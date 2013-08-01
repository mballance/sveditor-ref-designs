/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: v9_2th_kao_02_20_04_71.s
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
#define T0_KAOS_SEED          d3d0902a6326
#define T0_KAOS_ICOUNT        5000
#define T0_KAOS_AREAS         1
#define T0_KAOS_AREASIZE      64
#define T0_KAOS_AREAOFFSET    4160
#define T0_KAOS_PAGESIZE      8192
#define T0_KAOS_CODECOUNT     5002

#define T0_KAOS_BOOT_VA                  0x017c0000
#define T0_KAOS_BOOT_PA                  0x00000000001da000
#define T0_KAOS_BOOT_CACHEABLE           1
#define T0_KAOS_BOOT_NONCACHEABLE        0

#define T0_KAOS_STARTUP_VA               0x07696000
#define T0_KAOS_STARTUP_PA               0x0000000001fc8000
#define T0_KAOS_STARTUP_CACHEABLE        1
#define T0_KAOS_STARTUP_NONCACHEABLE     0

#define T0_KAOS_OFFSET_TBL_VA            0x1e6bc000
#define T0_KAOS_OFFSET_TBL_PA            0x0000000002476000
#define T0_KAOS_OFFSET_TBL_CACHEABLE     1
#define T0_KAOS_OFFSET_TBL_NONCACHEABLE  0

#define T0_KAOS_DONE_VA                  0x33a9c000
#define T0_KAOS_DONE_PA                  0x0000000003fce000
#define T0_KAOS_DONE_CACHEABLE           1
#define T0_KAOS_DONE_NONCACHEABLE        0

#define T0_KAOS_KTBL_VA                  0x0da1c000
#define T0_KAOS_KTBL_PA                  0x0000000004f1e000
#define T0_KAOS_KTBL_CACHEABLE           1
#define T0_KAOS_KTBL_NONCACHEABLE        0

#define T0_KAOS_SUBR0_VA                 0x0e1d6000
#define T0_KAOS_SUBR0_PA                 0x0000000005b8a000
#define T0_KAOS_SUBR0_CACHEABLE          1
#define T0_KAOS_SUBR0_NONCACHEABLE       0
#define T0_KAOS_SUBR1_VA                 0x0d968000
#define T0_KAOS_SUBR1_PA                 0x0000000006ac2000
#define T0_KAOS_SUBR1_CACHEABLE          1
#define T0_KAOS_SUBR1_NONCACHEABLE       0
#define T0_KAOS_SUBR2_VA                 0x228c0000
#define T0_KAOS_SUBR2_PA                 0x0000000007a4a000
#define T0_KAOS_SUBR2_CACHEABLE          1
#define T0_KAOS_SUBR2_NONCACHEABLE       0
#define T0_KAOS_SUBR3_VA                 0x28e4e000
#define T0_KAOS_SUBR3_PA                 0x0000000008166000
#define T0_KAOS_SUBR3_CACHEABLE          1
#define T0_KAOS_SUBR3_NONCACHEABLE       0

#define T0_KAOS_EXP_REGS_VA              0x2242a000
#define T0_KAOS_EXP_REGS_PA              0x00000000090f0000
#define T0_KAOS_EXP_REGS_CACHEABLE       1
#define T0_KAOS_EXP_REGS_NONCACHEABLE    0
#define T0_KAOS_RUN_REGS_VA              0x2e98e000
#define T0_KAOS_RUN_REGS_PA              0x000000000a6de000
#define T0_KAOS_RUN_REGS_CACHEABLE       1
#define T0_KAOS_RUN_REGS_NONCACHEABLE    0

#define T0_KAOS_EXP_STACK_VA             0x246ac000
#define T0_KAOS_EXP_STACK_PA             0x000000000b4c2000
#define T0_KAOS_EXP_STACK_CACHEABLE      1
#define T0_KAOS_EXP_STACK_NONCACHEABLE   0
#define T0_KAOS_RUN_STACK_VA             0x0f632000
#define T0_KAOS_RUN_STACK_PA             0x000000000cb04000
#define T0_KAOS_RUN_STACK_CACHEABLE      1
#define T0_KAOS_RUN_STACK_NONCACHEABLE   0

#define T0_KAOS_AREA0
#define T0_KAOS_EXP_AREA0_VA             0x256a2000
#define T0_KAOS_EXP_AREA0_PA             0x000000000d03e000
#define T0_KAOS_EXP_AREA0_CACHEABLE      1
#define T0_KAOS_EXP_AREA0_NONCACHEABLE   0
#define T0_KAOS_RUN_AREA0_VA             0x3546a000
#define T0_KAOS_RUN_AREA0_PA             0x000000000e9fe000
#define T0_KAOS_RUN_AREA0_CACHEABLE      1
#define T0_KAOS_RUN_AREA0_NONCACHEABLE   0

#define T0_KAOS_SHM_AREA
#define T0_KAOS_EXP_SHM_AREA_VA          0x3632e000
#define T0_KAOS_EXP_SHM_AREA_PA          0x00000000007b8000
#define T0_KAOS_EXP_SHM_AREA_CACHEABLE   1
#define T0_KAOS_EXP_SHM_AREA_NONCACHEABLE 0
#define T0_KAOS_RUN_SHM_AREA_VA          0x27b7e000
#define T0_KAOS_RUN_SHM_AREA_PA          0x00000000006e2000
#define T0_KAOS_RUN_SHM_AREA_CACHEABLE   1
#define T0_KAOS_RUN_SHM_AREA_NONCACHEABLE 0

#define T0_KAOS_RANVAL_00     0x9f50df44
#define T0_KAOS_RANVAL_01     0x6ceb37b4
#define T0_KAOS_RANVAL_02     0x69c2bb09
#define T0_KAOS_RANVAL_03     0x5171530b
#define T0_KAOS_RANVAL_04     0x58d0014c
#define T0_KAOS_RANVAL_05     0xa8a7985c
#define T0_KAOS_RANVAL_06     0x99e55d19
#define T0_KAOS_RANVAL_07     0xdecc7966
#define T0_KAOS_RANVAL_08     0xff629b72
#define T0_KAOS_RANVAL_09     0x265593b6
#define T0_KAOS_RANVAL_0a     0x173fa798
#define T0_KAOS_RANVAL_0b     0xba74e7f7
#define T0_KAOS_RANVAL_0c     0xb23ea1cc
#define T0_KAOS_RANVAL_0d     0x9c21d9e7
#define T0_KAOS_RANVAL_0e     0x8de708a7
#define T0_KAOS_RANVAL_0f     0x2565c45d
#define T0_KAOS_RANVAL_10     0x36930048
#define T0_KAOS_RANVAL_11     0xf9889eee
#define T0_KAOS_RANVAL_12     0x91f527d4
#define T0_KAOS_RANVAL_13     0xe435cf3d
#define T0_KAOS_RANVAL_14     0xff807527
#define T0_KAOS_RANVAL_15     0x5b7ed605
#define T0_KAOS_RANVAL_16     0x18a207ac
#define T0_KAOS_RANVAL_17     0x95d2a846
#define T0_KAOS_RANVAL_18     0x86a11eab
#define T0_KAOS_RANVAL_19     0x41693f4d
#define T0_KAOS_RANVAL_1a     0xc6e62c94
#define T0_KAOS_RANVAL_1b     0x80ddce6f
#define T0_KAOS_RANVAL_1c     0x818eb00e
#define T0_KAOS_RANVAL_1d     0x53c42ba9
#define T0_KAOS_RANVAL_1e     0x8f17dcd8
#define T0_KAOS_RANVAL_1f     0x61a2e083
#define T0_KAOS_RANVAL_20     0xc36281b6
#define T0_KAOS_RANVAL_21     0x7e291ae9
#define T0_KAOS_RANVAL_22     0xd293ce04
#define T0_KAOS_RANVAL_23     0xec12e1de
#define T0_KAOS_RANVAL_24     0xb129f0a7
#define T0_KAOS_RANVAL_25     0xa98d982b
#define T0_KAOS_RANVAL_26     0x0cb2d372
#define T0_KAOS_RANVAL_27     0x99a88778
#define T0_KAOS_RANVAL_28     0x80fcc139
#define T0_KAOS_RANVAL_29     0xcb68f87d
#define T0_KAOS_RANVAL_2a     0x26536224
#define T0_KAOS_RANVAL_2b     0x26d5d122
#define T0_KAOS_RANVAL_2c     0x5c0a790a
#define T0_KAOS_RANVAL_2d     0xe924dfc7
#define T0_KAOS_RANVAL_2e     0x3e56fdd3
#define T0_KAOS_RANVAL_2f     0x86db7310
#define T0_KAOS_RANVAL_30     0x77cee435
#define T0_KAOS_RANVAL_31     0xe716afe7
#define T0_KAOS_RANVAL_32     0x90e0e347
#define T0_KAOS_RANVAL_33     0x83eed397
#define T0_KAOS_RANVAL_34     0x50ed39c3
#define T0_KAOS_RANVAL_35     0xad7e461d
#define T0_KAOS_RANVAL_36     0x662483e9
#define T0_KAOS_RANVAL_37     0x349ba136
#define T0_KAOS_RANVAL_38     0x16349361
#define T0_KAOS_RANVAL_39     0x2ee8aaa9
#define T0_KAOS_RANVAL_3a     0x9767a696
#define T0_KAOS_RANVAL_3b     0xa29a44da
#define T0_KAOS_RANVAL_3c     0xab47ac53
#define T0_KAOS_RANVAL_3d     0xe01b96b3
#define T0_KAOS_RANVAL_3e     0x5ec541b5
#define T0_KAOS_RANVAL_3f     0xb324b45d
#define T0_KAOS_RANVAL_40     0x538d1ba8
#define T0_KAOS_RANVAL_41     0x1498f46a
#define T0_KAOS_RANVAL_42     0x397b628b
#define T0_KAOS_RANVAL_43     0x9967694f
#define T0_KAOS_RANVAL_44     0x5eac7daf
#define T0_KAOS_RANVAL_45     0xb217bd6e
#define T0_KAOS_RANVAL_46     0xa65fb5cd
#define T0_KAOS_RANVAL_47     0xe1447ff9
#define T0_KAOS_RANVAL_48     0x1b3040a9
#define T0_KAOS_RANVAL_49     0xab41db72
#define T0_KAOS_RANVAL_4a     0x4fbb8576
#define T0_KAOS_RANVAL_4b     0xbf7b429e
#define T0_KAOS_RANVAL_4c     0xd92b08bf
#define T0_KAOS_RANVAL_4d     0x74dcef1d
#define T0_KAOS_RANVAL_4e     0xa2893fdb
#define T0_KAOS_RANVAL_4f     0x9ca6a504
#define T0_KAOS_RANVAL_50     0x113adf36
#define T0_KAOS_RANVAL_51     0x1a7e2131
#define T0_KAOS_RANVAL_52     0x321adbfc
#define T0_KAOS_RANVAL_53     0x56a97432
#define T0_KAOS_RANVAL_54     0x7333a0e0
#define T0_KAOS_RANVAL_55     0x074761ee
#define T0_KAOS_RANVAL_56     0x5fd1af1c
#define T0_KAOS_RANVAL_57     0x10473e7a
#define T0_KAOS_RANVAL_58     0x065d5fd5
#define T0_KAOS_RANVAL_59     0xf62ebab8
#define T0_KAOS_RANVAL_5a     0x38058792
#define T0_KAOS_RANVAL_5b     0x751537b9
#define T0_KAOS_RANVAL_5c     0xeacaac63
#define T0_KAOS_RANVAL_5d     0xa23695f7
#define T0_KAOS_RANVAL_5e     0x08c220e1
#define T0_KAOS_RANVAL_5f     0x78de9ddd
#define T0_KAOS_RANVAL_60     0x2b15f942
#define T0_KAOS_RANVAL_61     0xb408213e
#define T0_KAOS_RANVAL_62     0xf1df4506
#define T0_KAOS_RANVAL_63     0xf14c61a7
#define T0_KAOS_RANVAL_64     0x57148f0c
#define T0_KAOS_RANVAL_65     0x6dcf2dae
#define T0_KAOS_RANVAL_66     0x31692f11
#define T0_KAOS_RANVAL_67     0x1f5817b1
#define T0_KAOS_RANVAL_68     0xf600c2eb
#define T0_KAOS_RANVAL_69     0xba49329c
#define T0_KAOS_RANVAL_6a     0xb09402f7
#define T0_KAOS_RANVAL_6b     0xc00e75b2
#define T0_KAOS_RANVAL_6c     0xd8846493
#define T0_KAOS_RANVAL_6d     0x6eef5671
#define T0_KAOS_RANVAL_6e     0xddce6ea5
#define T0_KAOS_RANVAL_6f     0x79a5e001
#define T0_KAOS_RANVAL_70     0xbc279773
#define T0_KAOS_RANVAL_71     0xcd3da1d2
#define T0_KAOS_RANVAL_72     0x0d34c858
#define T0_KAOS_RANVAL_73     0x2731cb57
#define T0_KAOS_RANVAL_74     0xc9378b26
#define T0_KAOS_RANVAL_75     0x0a97c100
#define T0_KAOS_RANVAL_76     0xdae73e2b
#define T0_KAOS_RANVAL_77     0x5a83f6d8
#define T0_KAOS_RANVAL_78     0x2d7bc72f
#define T0_KAOS_RANVAL_79     0xf36df780
#define T0_KAOS_RANVAL_7a     0xa7daeaf1
#define T0_KAOS_RANVAL_7b     0x6558c254
#define T0_KAOS_RANVAL_7c     0x5847fde5
#define T0_KAOS_RANVAL_7d     0x934b29fe
#define T0_KAOS_RANVAL_7e     0x9ae6e445
#define T0_KAOS_RANVAL_7f     0xd8fc24c9
/* end ktbl.0.h */
/* start ktbl.1.h */
#define T1_KAOS_NIAGARA
#define T1_KAOS_VERSION       4.2
#define T1_KAOS_SEED          d3d0902a6327
#define T1_KAOS_ICOUNT        5000
#define T1_KAOS_AREAS         1
#define T1_KAOS_AREASIZE      64
#define T1_KAOS_AREAOFFSET    4160
#define T1_KAOS_PAGESIZE      8192
#define T1_KAOS_CODECOUNT     5004

#define T1_KAOS_BOOT_VA                  0x65344000
#define T1_KAOS_BOOT_PA                  0x0000000040d94000
#define T1_KAOS_BOOT_CACHEABLE           1
#define T1_KAOS_BOOT_NONCACHEABLE        0

#define T1_KAOS_STARTUP_VA               0x7fd96000
#define T1_KAOS_STARTUP_PA               0x00000000410fa000
#define T1_KAOS_STARTUP_CACHEABLE        1
#define T1_KAOS_STARTUP_NONCACHEABLE     0

#define T1_KAOS_OFFSET_TBL_VA            0x7c346000
#define T1_KAOS_OFFSET_TBL_PA            0x0000000042ab8000
#define T1_KAOS_OFFSET_TBL_CACHEABLE     1
#define T1_KAOS_OFFSET_TBL_NONCACHEABLE  0

#define T1_KAOS_DONE_VA                  0x4120a000
#define T1_KAOS_DONE_PA                  0x000000004347c000
#define T1_KAOS_DONE_CACHEABLE           1
#define T1_KAOS_DONE_NONCACHEABLE        0

#define T1_KAOS_KTBL_VA                  0x654ac000
#define T1_KAOS_KTBL_PA                  0x0000000044e76000
#define T1_KAOS_KTBL_CACHEABLE           1
#define T1_KAOS_KTBL_NONCACHEABLE        0

#define T1_KAOS_SUBR0_VA                 0x6e2e6000
#define T1_KAOS_SUBR0_PA                 0x000000004513a000
#define T1_KAOS_SUBR0_CACHEABLE          1
#define T1_KAOS_SUBR0_NONCACHEABLE       0
#define T1_KAOS_SUBR1_VA                 0x710d4000
#define T1_KAOS_SUBR1_PA                 0x0000000046210000
#define T1_KAOS_SUBR1_CACHEABLE          1
#define T1_KAOS_SUBR1_NONCACHEABLE       0
#define T1_KAOS_SUBR2_VA                 0x6a8c4000
#define T1_KAOS_SUBR2_PA                 0x000000004707a000
#define T1_KAOS_SUBR2_CACHEABLE          1
#define T1_KAOS_SUBR2_NONCACHEABLE       0
#define T1_KAOS_SUBR3_VA                 0x65530000
#define T1_KAOS_SUBR3_PA                 0x0000000048b60000
#define T1_KAOS_SUBR3_CACHEABLE          1
#define T1_KAOS_SUBR3_NONCACHEABLE       0

#define T1_KAOS_EXP_REGS_VA              0x5cbbe000
#define T1_KAOS_EXP_REGS_PA              0x0000000049e68000
#define T1_KAOS_EXP_REGS_CACHEABLE       1
#define T1_KAOS_EXP_REGS_NONCACHEABLE    0
#define T1_KAOS_RUN_REGS_VA              0x72604000
#define T1_KAOS_RUN_REGS_PA              0x000000004a2b2000
#define T1_KAOS_RUN_REGS_CACHEABLE       1
#define T1_KAOS_RUN_REGS_NONCACHEABLE    0

#define T1_KAOS_EXP_STACK_VA             0x41728000
#define T1_KAOS_EXP_STACK_PA             0x000000004bc70000
#define T1_KAOS_EXP_STACK_CACHEABLE      1
#define T1_KAOS_EXP_STACK_NONCACHEABLE   0
#define T1_KAOS_RUN_STACK_VA             0x7b6d6000
#define T1_KAOS_RUN_STACK_PA             0x000000004c45c000
#define T1_KAOS_RUN_STACK_CACHEABLE      1
#define T1_KAOS_RUN_STACK_NONCACHEABLE   0

#define T1_KAOS_AREA0
#define T1_KAOS_EXP_AREA0_VA             0x6d156000
#define T1_KAOS_EXP_AREA0_PA             0x000000004d9ec000
#define T1_KAOS_EXP_AREA0_CACHEABLE      1
#define T1_KAOS_EXP_AREA0_NONCACHEABLE   0
#define T1_KAOS_RUN_AREA0_VA             0x4df8a000
#define T1_KAOS_RUN_AREA0_PA             0x000000004e3e6000
#define T1_KAOS_RUN_AREA0_CACHEABLE      1
#define T1_KAOS_RUN_AREA0_NONCACHEABLE   0

#define T1_KAOS_SHM_AREA
#define T1_KAOS_EXP_SHM_AREA_VA          0x478b0000
#define T1_KAOS_EXP_SHM_AREA_PA          0x0000000040b4a000
#define T1_KAOS_EXP_SHM_AREA_CACHEABLE   1
#define T1_KAOS_EXP_SHM_AREA_NONCACHEABLE 0
#define T1_KAOS_RUN_SHM_AREA_VA          0x711d2000
#define T1_KAOS_RUN_SHM_AREA_PA          0x0000000040d8a000
#define T1_KAOS_RUN_SHM_AREA_CACHEABLE   1
#define T1_KAOS_RUN_SHM_AREA_NONCACHEABLE 0

#define T1_KAOS_RANVAL_00     0x07980b49
#define T1_KAOS_RANVAL_01     0x2797f6df
#define T1_KAOS_RANVAL_02     0x8352c991
#define T1_KAOS_RANVAL_03     0x927379a4
#define T1_KAOS_RANVAL_04     0x9dd7a709
#define T1_KAOS_RANVAL_05     0xe4d10619
#define T1_KAOS_RANVAL_06     0x9dbd63ff
#define T1_KAOS_RANVAL_07     0x939a727f
#define T1_KAOS_RANVAL_08     0xe35dd8f6
#define T1_KAOS_RANVAL_09     0x088a554b
#define T1_KAOS_RANVAL_0a     0xbb336b5c
#define T1_KAOS_RANVAL_0b     0xa527975d
#define T1_KAOS_RANVAL_0c     0x5c98ef76
#define T1_KAOS_RANVAL_0d     0x3856bd86
#define T1_KAOS_RANVAL_0e     0xfe8c90ac
#define T1_KAOS_RANVAL_0f     0x8a5c0f50
#define T1_KAOS_RANVAL_10     0xaa5021a1
#define T1_KAOS_RANVAL_11     0xa6ad8464
#define T1_KAOS_RANVAL_12     0xd346d7bc
#define T1_KAOS_RANVAL_13     0x599ef708
#define T1_KAOS_RANVAL_14     0xf9968204
#define T1_KAOS_RANVAL_15     0xc827d181
#define T1_KAOS_RANVAL_16     0x2f27d187
#define T1_KAOS_RANVAL_17     0xd4c91568
#define T1_KAOS_RANVAL_18     0x70b3d9a1
#define T1_KAOS_RANVAL_19     0x471b872a
#define T1_KAOS_RANVAL_1a     0x47cc98da
#define T1_KAOS_RANVAL_1b     0x339ec555
#define T1_KAOS_RANVAL_1c     0x5491af3a
#define T1_KAOS_RANVAL_1d     0x923e7254
#define T1_KAOS_RANVAL_1e     0xb82a753b
#define T1_KAOS_RANVAL_1f     0x901e28d0
#define T1_KAOS_RANVAL_20     0xd65afece
#define T1_KAOS_RANVAL_21     0x8e3805d0
#define T1_KAOS_RANVAL_22     0xb5bc4807
#define T1_KAOS_RANVAL_23     0x3014f946
#define T1_KAOS_RANVAL_24     0xe6e16563
#define T1_KAOS_RANVAL_25     0xcdb714bb
#define T1_KAOS_RANVAL_26     0xf23727da
#define T1_KAOS_RANVAL_27     0xdad28926
#define T1_KAOS_RANVAL_28     0x6d42c506
#define T1_KAOS_RANVAL_29     0x5304403a
#define T1_KAOS_RANVAL_2a     0xcf62ce32
#define T1_KAOS_RANVAL_2b     0xa9ffcab4
#define T1_KAOS_RANVAL_2c     0x6c76a510
#define T1_KAOS_RANVAL_2d     0x48610c67
#define T1_KAOS_RANVAL_2e     0x3558bb56
#define T1_KAOS_RANVAL_2f     0xcaf0701c
#define T1_KAOS_RANVAL_30     0x201ad2aa
#define T1_KAOS_RANVAL_31     0x8d0ed086
#define T1_KAOS_RANVAL_32     0x62373474
#define T1_KAOS_RANVAL_33     0x3f5d78ca
#define T1_KAOS_RANVAL_34     0xc84b0592
#define T1_KAOS_RANVAL_35     0x1ad7f67b
#define T1_KAOS_RANVAL_36     0x8b838009
#define T1_KAOS_RANVAL_37     0x3aaabff8
#define T1_KAOS_RANVAL_38     0xa6c78d1e
#define T1_KAOS_RANVAL_39     0x86a93d80
#define T1_KAOS_RANVAL_3a     0xe7490485
#define T1_KAOS_RANVAL_3b     0x70de6088
#define T1_KAOS_RANVAL_3c     0xc16b4981
#define T1_KAOS_RANVAL_3d     0x8d6ff412
#define T1_KAOS_RANVAL_3e     0x53b92d2e
#define T1_KAOS_RANVAL_3f     0xd78a0213
#define T1_KAOS_RANVAL_40     0x0731754c
#define T1_KAOS_RANVAL_41     0x484d5d2c
#define T1_KAOS_RANVAL_42     0x21ea3943
#define T1_KAOS_RANVAL_43     0x94536341
#define T1_KAOS_RANVAL_44     0xea100338
#define T1_KAOS_RANVAL_45     0x477eb4b7
#define T1_KAOS_RANVAL_46     0xb1915965
#define T1_KAOS_RANVAL_47     0x51cab55a
#define T1_KAOS_RANVAL_48     0xd8f39422
#define T1_KAOS_RANVAL_49     0x255c8740
#define T1_KAOS_RANVAL_4a     0x6276bf32
#define T1_KAOS_RANVAL_4b     0xf7129d1d
#define T1_KAOS_RANVAL_4c     0xfe764956
#define T1_KAOS_RANVAL_4d     0xc9cb50eb
#define T1_KAOS_RANVAL_4e     0x9b288333
#define T1_KAOS_RANVAL_4f     0xe2c6ecd0
#define T1_KAOS_RANVAL_50     0x82baf70f
#define T1_KAOS_RANVAL_51     0x6da297a7
#define T1_KAOS_RANVAL_52     0x1d5b84f7
#define T1_KAOS_RANVAL_53     0xbacc6b98
#define T1_KAOS_RANVAL_54     0x4d6a7b3e
#define T1_KAOS_RANVAL_55     0xc42ef4a2
#define T1_KAOS_RANVAL_56     0xd5b7a97f
#define T1_KAOS_RANVAL_57     0xa2853e0a
#define T1_KAOS_RANVAL_58     0xf0693c8a
#define T1_KAOS_RANVAL_59     0x8a46c0ff
#define T1_KAOS_RANVAL_5a     0xa8bf1bdc
#define T1_KAOS_RANVAL_5b     0x0c8ac401
#define T1_KAOS_RANVAL_5c     0x48b71598
#define T1_KAOS_RANVAL_5d     0x0db059c6
#define T1_KAOS_RANVAL_5e     0x37567417
#define T1_KAOS_RANVAL_5f     0x4dc6ffb1
#define T1_KAOS_RANVAL_60     0x514c308b
#define T1_KAOS_RANVAL_61     0x38142f1c
#define T1_KAOS_RANVAL_62     0x1d6de850
#define T1_KAOS_RANVAL_63     0xd2d4d9fc
#define T1_KAOS_RANVAL_64     0x2fe996ce
#define T1_KAOS_RANVAL_65     0xe5a412b3
#define T1_KAOS_RANVAL_66     0x12a9ec29
#define T1_KAOS_RANVAL_67     0x2f2fd804
#define T1_KAOS_RANVAL_68     0x45fc7910
#define T1_KAOS_RANVAL_69     0x24447983
#define T1_KAOS_RANVAL_6a     0x89ebe264
#define T1_KAOS_RANVAL_6b     0xd5311600
#define T1_KAOS_RANVAL_6c     0xe41f7390
#define T1_KAOS_RANVAL_6d     0xab9ba4b9
#define T1_KAOS_RANVAL_6e     0xc781c4ca
#define T1_KAOS_RANVAL_6f     0xd7609b53
#define T1_KAOS_RANVAL_70     0x85b5529a
#define T1_KAOS_RANVAL_71     0xec35e5ef
#define T1_KAOS_RANVAL_72     0xe0cde64e
#define T1_KAOS_RANVAL_73     0xac7f5bda
#define T1_KAOS_RANVAL_74     0x57cd1b50
#define T1_KAOS_RANVAL_75     0x6b2d729e
#define T1_KAOS_RANVAL_76     0x11a63372
#define T1_KAOS_RANVAL_77     0x311f7a85
#define T1_KAOS_RANVAL_78     0x6b375cad
#define T1_KAOS_RANVAL_79     0x63b77ad0
#define T1_KAOS_RANVAL_7a     0x4dbc94ea
#define T1_KAOS_RANVAL_7b     0x80e5a129
#define T1_KAOS_RANVAL_7c     0xb9b10cc7
#define T1_KAOS_RANVAL_7d     0x6fdf7719
#define T1_KAOS_RANVAL_7e     0xd558587e
#define T1_KAOS_RANVAL_7f     0x47e78193
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
!    areaoffset     4160
!    ncache         0
!    emulate_ncache 1
!    pagesize       8192
!    invsize        0
!    codecount      5002
!    code           0da1c000
!    entry          0da1c000
!    fsr_exceptions 00000000
!    fsr_roundmode  00000004
!    fsr_mask       c0000fff
!    seed           d3d0902a6326
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

KTEXT_MODULE(t0_module_ktbl, 0x0da1c000)
.seg "text"
	KGLOBAL(t0_ktbl)
t0_ktbl_page_begin:
.global t0_kref; t0_kref:
	.skip 0
t0_ktbl:
	.word	0xe3b8a080	! t0_kref+0x0:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xa5b58f54	! t0_kref+0x4:   	fornot1	%f22, %f20, %f18
	.word	0xa203001b	! t0_kref+0x8:   	add	%o4, %i3, %l1
	.word	0xa2952faa	! t0_kref+0xc:   	orcc	%l4, 0xfaa, %l1
	.word	0x9fc00004	! t0_kref+0x10:   	call	%g0 + %g4
	.word	0xada689ca	! t0_kref+0x14:   	fdivd	%f26, %f10, %f22
	.word	0xa2148011	! t0_kref+0x18:   	or	%l2, %l1, %l1
	.word	0x8fb40efa	! t0_kref+0x1c:   	fornot2s	%f16, %f26, %f7
	.word	0xa2328000	! t0_kref+0x20:   	orn	%o2, %g0, %l1
	.word	0xa296bc73	! t0_kref+0x24:   	orcc	%i2, -0x38d, %l1
	.word	0xcd1fbd98	! t0_kref+0x28:   	ldd	[%fp - 0x268], %f6
	.word	0xa202b241	! t0_kref+0x2c:   	add	%o2, -0xdbf, %l1
	.word	0xe228a019	! t0_kref+0x30:   	stb	%l1, [%g2 + 0x19]
	.word	0xe24e3fee	! t0_kref+0x34:   	ldsb	[%i0 - 0x12], %l1
	.word	0xb3b28a28	! t0_kref+0x38:   	fpadd16s	%f10, %f8, %f25
	.word	0xb5a689ce	! t0_kref+0x3c:   	fdivd	%f26, %f14, %f26
	.word	0xa295c015	! t0_kref+0x40:   	orcc	%l7, %l5, %l1
	.word	0xa5b68e80	! t0_kref+0x44:   	fsrc1	%f26, %f18
	.word	0xd700a038	! t0_kref+0x48:   	ld	[%g2 + 0x38], %f11
	.word	0x232aedad	! t0_kref+0x4c:   	sethi	%hi(0xabb6b400), %l1
	.word	0x33800001	! t0_kref+0x50:   	fbe,a	_kref+0x54
	.word	0xe2871018	! t0_kref+0x54:   	lda	[%i4 + %i0]0x80, %l1
	.word	0xec6e6002	! t0_kref+0x58:   	ldstub	[%i1 + 2], %l6
	.word	0xd13e2018	! t0_kref+0x5c:   	std	%f8, [%i0 + 0x18]
	.word	0x27480006	! t0_kref+0x60:   	fbul,a,pt	%fcc0, _kref+0x78
	.word	0xa3658000	! t0_kref+0x64:   	movneg	%icc, %g0, %l1
	.word	0xe026201c	! t0_kref+0x68:   	st	%l0, [%i0 + 0x1c]
	.word	0xa294f9b2	! t0_kref+0x6c:   	orcc	%l3, -0x64e, %l1
	.word	0x29480005	! t0_kref+0x70:   	fbl,a,pt	%fcc0, _kref+0x84
	.word	0xb1a2895c	! t0_kref+0x74:   	fmuld	%f10, %f28, %f24
	.word	0x36480007	! t0_kref+0x78:   	bge,a,pt	%icc, _kref+0x94
	.word	0xa9b58a3d	! t0_kref+0x7c:   	fpadd16s	%f22, %f29, %f20
	.word	0x95b00f0c	! t0_kref+0x80:   	fsrc2	%f12, %f10
	.word	0xb9a018d8	! t0_kref+0x84:   	fdtos	%f24, %f28
	.word	0xa1b7097b	! t0_kref+0x88:   	fpmerge	%f28, %f27, %f16
	.word	0x38800003	! t0_kref+0x8c:   	bgu,a	_kref+0x98
	.word	0x95b4497c	! t0_kref+0x90:   	fpmerge	%f17, %f28, %f10
	.word	0xedee101c	! t0_kref+0x94:   	prefetcha	%i0 + %i4, 22
	.word	0x32800001	! t0_kref+0x98:   	bne,a	_kref+0x9c
	.word	0xd4200019	! t0_kref+0x9c:   	st	%o2, [%g0 + %i1]
	.word	0xe20e2005	! t0_kref+0xa0:   	ldub	[%i0 + 5], %l1
	.word	0xa3b00200	! t0_kref+0xa4:   	array8	%g0, %g0, %l1
	.word	0x8143e040	! t0_kref+0xa8:   	membar	0x40
	.word	0xa276c015	! t0_kref+0xac:   	udiv	%i3, %l5, %l1
	.word	0xa3b48506	! t0_kref+0xb0:   	fcmpgt16	%f18, %f6, %l1
	.word	0xc06e001a	! t0_kref+0xb4:   	ldstub	[%i0 + %i2], %g0
	.word	0x2333eeb1	! t0_kref+0xb8:   	sethi	%hi(0xcfbac400), %l1
	.word	0xa25c400b	! t0_kref+0xbc:   	smul	%l1, %o3, %l1
	.word	0x9da709b4	! t0_kref+0xc0:   	fdivs	%f28, %f20, %f14
	.word	0xa25b4000	! t0_kref+0xc4:   	smul	%o5, %g0, %l1
	.word	0xa2dd4015	! t0_kref+0xc8:   	smulcc	%l5, %l5, %l1
	.word	0xe208a01b	! t0_kref+0xcc:   	ldub	[%g2 + 0x1b], %l1
	.word	0xa5a00038	! t0_kref+0xd0:   	fmovs	%f24, %f18
	.word	0xb9a01917	! t0_kref+0xd4:   	fitod	%f23, %f28
	.word	0x9db50d90	! t0_kref+0xd8:   	fxor	%f20, %f16, %f14
	.word	0xb1a708da	! t0_kref+0xdc:   	fsubd	%f28, %f26, %f24
	.word	0xbba000ab	! t0_kref+0xe0:   	fnegs	%f11, %f29
	.word	0x81abca2d	! t0_kref+0xe4:   	fcmps	%fcc0, %f15, %f13
	.word	0xa3b40240	! t0_kref+0xe8:   	array16	%l0, %g0, %l1
	.word	0xb9b00fc0	! t0_kref+0xec:   	fone	%f28
	.word	0x28800008	! t0_kref+0xf0:   	bleu,a	_kref+0x110
	.word	0xadb48afa	! t0_kref+0xf4:   	fpsub32s	%f18, %f26, %f22
	.word	0xa2e4e395	! t0_kref+0xf8:   	subccc	%l3, 0x395, %l1
	.word	0x9da00038	! t0_kref+0xfc:   	fmovs	%f24, %f14
	.word	0x95a389d0	! t0_kref+0x100:   	fdivd	%f14, %f16, %f10
	.word	0x35480003	! t0_kref+0x104:   	fbue,a,pt	%fcc0, _kref+0x110
	.word	0xa27c71ff	! t0_kref+0x108:   	sdiv	%l1, -0xe01, %l1
	.word	0xe220a020	! t0_kref+0x10c:   	st	%l1, [%g2 + 0x20]
	.word	0xa5a589c6	! t0_kref+0x110:   	fdivd	%f22, %f6, %f18
	.word	0xa2068013	! t0_kref+0x114:   	add	%i2, %l3, %l1
	.word	0xeb20a030	! t0_kref+0x118:   	st	%f21, [%g2 + 0x30]
	.word	0xe2560000	! t0_kref+0x11c:   	ldsh	[%i0], %l1
	.word	0xa3330015	! t0_kref+0x120:   	srl	%o4, %l5, %l1
	.word	0xa9b54e28	! t0_kref+0x124:   	fands	%f21, %f8, %f20
	.word	0xa2b2742e	! t0_kref+0x128:   	orncc	%o1, -0xbd2, %l1
	.word	0xe420a018	! t0_kref+0x12c:   	st	%l2, [%g2 + 0x18]
	.word	0xb1b38d30	! t0_kref+0x130:   	fandnot1s	%f14, %f16, %f24
	.word	0xa235a668	! t0_kref+0x134:   	orn	%l6, 0x668, %l1
	call	SYM(t0_subr1)
	.word	0x91b1ca27	! t0_kref+0x13c:   	fpadd16s	%f7, %f7, %f8
	.word	0x99b00f16	! t0_kref+0x140:   	fsrc2	%f22, %f12
	.word	0xc768a005	! t0_kref+0x144:   	prefetch	%g2 + 5, 3
	.word	0x34480007	! t0_kref+0x148:   	bg,a,pt	%icc, _kref+0x164
	.word	0xa31a8011	! t0_kref+0x14c:   	tsubcctv	%o2, %l1, %l1
	.word	0xe2d81019	! t0_kref+0x150:   	ldxa	[%g0 + %i1]0x80, %l1
	.word	0xa3b2044c	! t0_kref+0x154:   	fcmpne16	%f8, %f12, %l1
	.word	0xe20e0000	! t0_kref+0x158:   	ldub	[%i0], %l1
	.word	0xb7b30daf	! t0_kref+0x15c:   	fxors	%f12, %f15, %f27
	.word	0xa2334017	! t0_kref+0x160:   	orn	%o5, %l7, %l1
	.word	0xa202b40f	! t0_kref+0x164:   	add	%o2, -0xbf1, %l1
	.word	0xa1a0188e	! t0_kref+0x168:   	fitos	%f14, %f16
	.word	0xe300a000	! t0_kref+0x16c:   	ld	[%g2], %f17
	.word	0xb9a0192b	! t0_kref+0x170:   	fstod	%f11, %f28
	.word	0x30800001	! t0_kref+0x174:   	ba,a	_kref+0x178
	.word	0x8185c000	! t0_kref+0x178:   	wr	%l7, %g0, %y
	.word	0x9fc00004	! t0_kref+0x17c:   	call	%g0 + %g4
	.word	0xec28a003	! t0_kref+0x180:   	stb	%l6, [%g2 + 3]
	.word	0xe240a010	! t0_kref+0x184:   	ldsw	[%g2 + 0x10], %l1
	.word	0xf1000018	! t0_kref+0x188:   	ld	[%g0 + %i0], %f24
	.word	0xe24e3fe1	! t0_kref+0x18c:   	ldsb	[%i0 - 0x1f], %l1
	.word	0xe3b8a040	! t0_kref+0x190:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xa25dc010	! t0_kref+0x194:   	smul	%l7, %l0, %l1
	.word	0xa2bb0015	! t0_kref+0x198:   	xnorcc	%o4, %l5, %l1
	.word	0xa33cc009	! t0_kref+0x19c:   	sra	%l3, %o1, %l1
	.word	0xb1a2892c	! t0_kref+0x1a0:   	fmuls	%f10, %f12, %f24
	.word	0xd828a010	! t0_kref+0x1a4:   	stb	%o4, [%g2 + 0x10]
	.word	0x31480008	! t0_kref+0x1a8:   	fba,a,pt	%fcc0, _kref+0x1c8
	.word	0xa2368010	! t0_kref+0x1ac:   	orn	%i2, %l0, %l1
	.word	0xe256001b	! t0_kref+0x1b0:   	ldsh	[%i0 + %i3], %l1
	.word	0xe42e600d	! t0_kref+0x1b4:   	stb	%l2, [%i1 + 0xd]
	.word	0x81dc6f46	! t0_kref+0x1b8:   	flush	%l1 + 0xf46
	.word	0xe216601e	! t0_kref+0x1bc:   	lduh	[%i1 + 0x1e], %l1
	.word	0xa28b400a	! t0_kref+0x1c0:   	andcc	%o5, %o2, %l1
	.word	0x81ab0a48	! t0_kref+0x1c4:   	fcmpd	%fcc0, %f12, %f8
	.word	0xa286b50c	! t0_kref+0x1c8:   	addcc	%i2, -0xaf4, %l1
	.word	0xe24e2007	! t0_kref+0x1cc:   	ldsb	[%i0 + 7], %l1
	.word	0xe500a018	! t0_kref+0x1d0:   	ld	[%g2 + 0x18], %f18
	call	SYM(t0_subr1)
	.word	0xa3253b45	! t0_kref+0x1d8:   	mulscc	%l4, -0x4bb, %l1
	.word	0x8fa309b4	! t0_kref+0x1dc:   	fdivs	%f12, %f20, %f7
	.word	0xa2da67a1	! t0_kref+0x1e0:   	smulcc	%o1, 0x7a1, %l1
	.word	0xb5a01889	! t0_kref+0x1e4:   	fitos	%f9, %f26
	.word	0xed9e5000	! t0_kref+0x1e8:   	ldda	[%i1]0x80, %f22
	.word	0x81aacab4	! t0_kref+0x1ec:   	fcmpes	%fcc0, %f11, %f20
	.word	0xe2162014	! t0_kref+0x1f0:   	lduh	[%i0 + 0x14], %l1
	.word	0x81a9cab4	! t0_kref+0x1f4:   	fcmpes	%fcc0, %f7, %f20
	.word	0xa1a00029	! t0_kref+0x1f8:   	fmovs	%f9, %f16
	.word	0xa2756bd1	! t0_kref+0x1fc:   	udiv	%l5, 0xbd1, %l1
	.word	0xa1a01912	! t0_kref+0x200:   	fitod	%f18, %f16
	.word	0xe81f4019	! t0_kref+0x204:   	ldd	[%i5 + %i1], %l4
	.word	0xd636c018	! t0_kref+0x208:   	sth	%o3, [%i3 + %i0]
	call	SYM(t0_subr2)
	.word	0x9ba018ce	! t0_kref+0x210:   	fdtos	%f14, %f13
	.word	0xada0054e	! t0_kref+0x214:   	fsqrtd	%f14, %f22
	.word	0xa2280017	! t0_kref+0x218:   	andn	%g0, %l7, %l1
	.word	0xd4363fee	! t0_kref+0x21c:   	sth	%o2, [%i0 - 0x12]
	.word	0xd436200a	! t0_kref+0x220:   	sth	%o2, [%i0 + 0xa]
	.word	0x91b4096d	! t0_kref+0x224:   	fpmerge	%f16, %f13, %f8
	.word	0x2c800004	! t0_kref+0x228:   	bneg,a	_kref+0x238
	.word	0x91b00c00	! t0_kref+0x22c:   	fzero	%f8
	.word	0x81adca35	! t0_kref+0x230:   	fcmps	%fcc0, %f23, %f21
	.word	0xe6263fe8	! t0_kref+0x234:   	st	%l3, [%i0 - 0x18]
	.word	0xa204f189	! t0_kref+0x238:   	add	%l3, -0xe77, %l1
	.word	0xe2462004	! t0_kref+0x23c:   	ldsw	[%i0 + 4], %l1
	.word	0xd1be5852	! t0_kref+0x240:   	stda	%f8, [%i1 + %l2]0xc2
	call	SYM(t0_subr3)
	.word	0xa1a01a2a	! t0_kref+0x248:   	fstoi	%f10, %f16
	.word	0x2c800004	! t0_kref+0x24c:   	bneg,a	_kref+0x25c
	.word	0xd878a038	! t0_kref+0x250:   	swap	[%g2 + 0x38], %o4
	.word	0xee30a030	! t0_kref+0x254:   	sth	%l7, [%g2 + 0x30]
	call	SYM(t0_subr2)
	.word	0xa286b5a9	! t0_kref+0x25c:   	addcc	%i2, -0xa57, %l1
	.word	0xa3b28300	! t0_kref+0x260:   	alignaddr	%o2, %g0, %l1
	.word	0xa2d80012	! t0_kref+0x264:   	smulcc	%g0, %l2, %l1
	.word	0xa32b0009	! t0_kref+0x268:   	sll	%o4, %o1, %l1
	.word	0xe40874fc	! t0_kref+0x26c:   	ldub	[%g1 - 0xb04], %l2
	.word	0xa41ca00c	! t0_kref+0x270:   	xor	%l2, 0xc, %l2
	.word	0xe42874fc	! t0_kref+0x274:   	stb	%l2, [%g1 - 0xb04]
	.word	0x81d874fc	! t0_kref+0x278:   	flush	%g1 - 0xb04
	.word	0x35480003	! t0_kref+0x27c:   	fbue,a,pt	%fcc0, _kref+0x288
	.word	0x9da38850	! t0_kref+0x280:   	faddd	%f14, %f16, %f14
	.word	0xa3334016	! t0_kref+0x284:   	srl	%o5, %l6, %l1
2:	.word	0xa270001a	! t0_kref+0x288:   	udiv	%g0, %i2, %l1
	.word	0xf51fbeb0	! t0_kref+0x28c:   	ldd	[%fp - 0x150], %f26
	.word	0x8fb30a26	! t0_kref+0x290:   	fpadd16s	%f12, %f6, %f7
	.word	0x3e800001	! t0_kref+0x294:   	bvc,a	_kref+0x298
	.word	0xa2328011	! t0_kref+0x298:   	orn	%o2, %l1, %l1
	.word	0xa3400000	! t0_kref+0x29c:   	mov	%y, %l1
	.word	0x25480008	! t0_kref+0x2a0:   	fblg,a,pt	%fcc0, _kref+0x2c0
	.word	0x8da01886	! t0_kref+0x2a4:   	fitos	%f6, %f6
	.word	0xe250a008	! t0_kref+0x2a8:   	ldsh	[%g2 + 8], %l1
	.word	0x27480005	! t0_kref+0x2ac:   	fbul,a,pt	%fcc0, _kref+0x2c0
	.word	0x8db00c00	! t0_kref+0x2b0:   	fzero	%f6
	.word	0xd9be9a19	! t0_kref+0x2b4:   	stda	%f12, [%i2 + %i1]0xd0
	.word	0x2d480006	! t0_kref+0x2b8:   	fbg,a,pt	%fcc0, _kref+0x2d0
	.word	0xe24e6018	! t0_kref+0x2bc:   	ldsb	[%i1 + 0x18], %l1
	.word	0x36800001	! t0_kref+0x2c0:   	bge,a	_kref+0x2c4
	.word	0xa234c00c	! t0_kref+0x2c4:   	orn	%l3, %o4, %l1
	.word	0xe2df5019	! t0_kref+0x2c8:   	ldxa	[%i5 + %i1]0x80, %l1
	.word	0xafa01893	! t0_kref+0x2cc:   	fitos	%f19, %f23
	.word	0xa28df4b8	! t0_kref+0x2d0:   	andcc	%l7, -0xb48, %l1
	.word	0x91a018ce	! t0_kref+0x2d4:   	fdtos	%f14, %f8
	.word	0xe216201e	! t0_kref+0x2d8:   	lduh	[%i0 + 0x1e], %l1
	.word	0xa5b50d94	! t0_kref+0x2dc:   	fxor	%f20, %f20, %f18
	.word	0x30480004	! t0_kref+0x2e0:   	ba,a,pt	%icc, _kref+0x2f0
	.word	0xa3b6800d	! t0_kref+0x2e4:   	edge8	%i2, %o5, %l1
	.word	0xada609ce	! t0_kref+0x2e8:   	fdivd	%f24, %f14, %f22
	.word	0xa234c00c	! t0_kref+0x2ec:   	orn	%l3, %o4, %l1
	.word	0xa32c800b	! t0_kref+0x2f0:   	sll	%l2, %o3, %l1
	.word	0xa214c01a	! t0_kref+0x2f4:   	or	%l3, %i2, %l1
	.word	0x29800002	! t0_kref+0x2f8:   	fbl,a	_kref+0x300
	.word	0xa28df691	! t0_kref+0x2fc:   	andcc	%l7, -0x96f, %l1
	.word	0xe256001b	! t0_kref+0x300:   	ldsh	[%i0 + %i3], %l1
	.word	0xf1ee501a	! t0_kref+0x304:   	prefetcha	%i1 + %i2, 24
	.word	0xa243401a	! t0_kref+0x308:   	addc	%o5, %i2, %l1
	.word	0xa2154012	! t0_kref+0x30c:   	or	%l5, %l2, %l1
	.word	0xa3b28149	! t0_kref+0x310:   	edge32l	%o2, %o1, %l1
	.word	0xa32a8015	! t0_kref+0x314:   	sll	%o2, %l5, %l1
	.word	0xe19f5018	! t0_kref+0x318:   	ldda	[%i5 + %i0]0x80, %f16
	.word	0xa2d5e263	! t0_kref+0x31c:   	umulcc	%l7, 0x263, %l1
	.word	0x91a3895c	! t0_kref+0x320:   	fmuld	%f14, %f28, %f8
	.word	0xe1bf1a19	! t0_kref+0x324:   	stda	%f16, [%i4 + %i1]0xd0
	.word	0xa2f5401a	! t0_kref+0x328:   	udivcc	%l5, %i2, %l1
	.word	0xe126001c	! t0_kref+0x32c:   	st	%f16, [%i0 + %i4]
	.word	0x8143c000	! t0_kref+0x330:   	stbar
	.word	0x95a01a2d	! t0_kref+0x334:   	fstoi	%f13, %f10
	.word	0x81de401d	! t0_kref+0x338:   	flush	%i1 + %i5
	.word	0x81b01025	! t0_kref+0x33c:   	siam	0x5
	.word	0xa3302005	! t0_kref+0x340:   	srl	%g0, 0x5, %l1
	.word	0xa2d4c011	! t0_kref+0x344:   	umulcc	%l3, %l1, %l1
	.word	0xdb00a028	! t0_kref+0x348:   	ld	[%g2 + 0x28], %f13
	.word	0x27480004	! t0_kref+0x34c:   	fbul,a,pt	%fcc0, _kref+0x35c
	.word	0xa1b28f50	! t0_kref+0x350:   	fornot1	%f10, %f16, %f16
	.word	0xa2c50008	! t0_kref+0x354:   	addccc	%l4, %o0, %l1
	.word	0xa2034013	! t0_kref+0x358:   	add	%o5, %l3, %l1
	.word	0xa3b5c356	! t0_kref+0x35c:   	alignaddrl	%l7, %l6, %l1
	.word	0xa2052079	! t0_kref+0x360:   	add	%l4, 0x79, %l1
	.word	0xa33d8009	! t0_kref+0x364:   	sra	%l6, %o1, %l1
	.word	0xc028a03b	! t0_kref+0x368:   	clrb	[%g2 + 0x3b]
	.word	0xa3b50456	! t0_kref+0x36c:   	fcmpne16	%f20, %f22, %l1
	.word	0x99b00fc0	! t0_kref+0x370:   	fone	%f12
	.word	0x33480001	! t0_kref+0x374:   	fbe,a,pt	%fcc0, _kref+0x378
	.word	0x99b48756	! t0_kref+0x378:   	fpack32	%f18, %f22, %f12
	.word	0xa5b24fbb	! t0_kref+0x37c:   	fors	%f9, %f27, %f18
	.word	0xa2f6c012	! t0_kref+0x380:   	udivcc	%i3, %l2, %l1
	.word	0xafa00531	! t0_kref+0x384:   	fsqrts	%f17, %f23
	.word	0x93b68ab8	! t0_kref+0x388:   	fpsub16s	%f26, %f24, %f9
	.word	0xa2754009	! t0_kref+0x38c:   	udiv	%l5, %o1, %l1
	.word	0xdd1fbc40	! t0_kref+0x390:   	ldd	[%fp - 0x3c0], %f14
	.word	0xa21ebfbe	! t0_kref+0x394:   	xor	%i2, -0x42, %l1
	.word	0x81d8000a	! t0_kref+0x398:   	flush	%g0 + %o2
	.word	0xd428a028	! t0_kref+0x39c:   	stb	%o2, [%g2 + 0x28]
	.word	0xe250a002	! t0_kref+0x3a0:   	ldsh	[%g2 + 2], %l1
	.word	0x9fc00004	! t0_kref+0x3a4:   	call	%g0 + %g4
	.word	0xa7a548a8	! t0_kref+0x3a8:   	fsubs	%f21, %f8, %f19
	.word	0xe220a000	! t0_kref+0x3ac:   	st	%l1, [%g2]
	.word	0xa3b50412	! t0_kref+0x3b0:   	fcmple16	%f20, %f18, %l1
	.word	0x81ac8a48	! t0_kref+0x3b4:   	fcmpd	%fcc0, %f18, %f8
	.word	0x81ac8a3d	! t0_kref+0x3b8:   	fcmps	%fcc0, %f18, %f29
	.word	0xa9a0188a	! t0_kref+0x3bc:   	fitos	%f10, %f20
	.word	0xf51fbef0	! t0_kref+0x3c0:   	ldd	[%fp - 0x110], %f26
	.word	0xa2337fd0	! t0_kref+0x3c4:   	orn	%o5, -0x30, %l1
	.word	0xa33b4014	! t0_kref+0x3c8:   	sra	%o5, %l4, %l1
	.word	0x2c480003	! t0_kref+0x3cc:   	bneg,a,pt	%icc, _kref+0x3d8
	.word	0xa2ab693d	! t0_kref+0x3d0:   	andncc	%o5, 0x93d, %l1
	.word	0xa2f6e713	! t0_kref+0x3d4:   	udivcc	%i3, 0x713, %l1
	.word	0xed067fe8	! t0_kref+0x3d8:   	ld	[%i1 - 0x18], %f22
	.word	0x23480005	! t0_kref+0x3dc:   	fbne,a,pt	%fcc0, _kref+0x3f0
	.word	0x8d824014	! t0_kref+0x3e0:   	wr	%o1, %l4, %fprs
	.word	0xe2066010	! t0_kref+0x3e4:   	ld	[%i1 + 0x10], %l1
	.word	0xa212381b	! t0_kref+0x3e8:   	or	%o0, -0x7e5, %l1
	.word	0xe20e3ff2	! t0_kref+0x3ec:   	ldub	[%i0 - 0xe], %l1
	.word	0x3b480001	! t0_kref+0x3f0:   	fble,a,pt	%fcc0, _kref+0x3f4
	.word	0xda6e401a	! t0_kref+0x3f4:   	ldstub	[%i1 + %i2], %o5
	.word	0x20480002	! t0_kref+0x3f8:   	bn,a,pt	%icc, _kref+0x400
	.word	0xc06e8018	! t0_kref+0x3fc:   	ldstub	[%i2 + %i0], %g0
	.word	0xa2c6f91c	! t0_kref+0x400:   	addccc	%i3, -0x6e4, %l1
	.word	0xa2726aab	! t0_kref+0x404:   	udiv	%o1, 0xaab, %l1
	.word	0xe81e6018	! t0_kref+0x408:   	ldd	[%i1 + 0x18], %l4
	.word	0xa25d618d	! t0_kref+0x40c:   	smul	%l5, 0x18d, %l1
	.word	0xe86e401a	! t0_kref+0x410:   	ldstub	[%i1 + %i2], %l4
	.word	0x9fb00ced	! t0_kref+0x414:   	fnot2s	%f13, %f15
	.word	0xb9a0110c	! t0_kref+0x418:   	fxtod	%f12, %f28
	.word	0xef20a000	! t0_kref+0x41c:   	st	%f23, [%g2]
	.word	0x001fffff	! t0_kref+0x420:   	illtrap	0x1fffff
	.word	0xe81e7fe0	! t0_kref+0x424:   	ldd	[%i1 - 0x20], %l4
	.word	0xc168a042	! t0_kref+0x428:   	prefetch	%g2 + 0x42, 0
	.word	0xc9be1851	! t0_kref+0x42c:   	stda	%f4, [%i0 + %l1]0xc2
	call	SYM(t0_subr1)
	.word	0xb5a00550	! t0_kref+0x434:   	fsqrtd	%f16, %f26
	.word	0xa2152e53	! t0_kref+0x438:   	or	%l4, 0xe53, %l1
	.word	0x8610201e	! t0_kref+0x43c:   	mov	0x1e, %g3
	.word	0x86a0e001	! t0_kref+0x440:   	subcc	%g3, 1, %g3
	.word	0x2280000f	! t0_kref+0x444:   	be,a	_kref+0x480
	.word	0x9ba01a31	! t0_kref+0x448:   	fstoi	%f17, %f13
	.word	0xa3b6c060	! t0_kref+0x44c:   	edge8ln	%i3, %g0, %l1
	.word	0xa3600015	! t0_kref+0x450:   	movn	%fcc0, %l5, %l1
	.word	0xa246b601	! t0_kref+0x454:   	addc	%i2, -0x9ff, %l1
	.word	0xe2901018	! t0_kref+0x458:   	lduha	[%g0 + %i0]0x80, %l1
	.word	0xf420a000	! t0_kref+0x45c:   	st	%i2, [%g2]
	.word	0xee6e401a	! t0_kref+0x460:   	ldstub	[%i1 + %i2], %l7
	.word	0xe8260000	! t0_kref+0x464:   	st	%l4, [%i0]
	.word	0xa2b521fe	! t0_kref+0x468:   	orncc	%l4, 0x1fe, %l1
	.word	0x3c4ffff5	! t0_kref+0x46c:   	bpos,a,pt	%icc, _kref+0x440
	.word	0xfdee101d	! t0_kref+0x470:   	prefetcha	%i0 + %i5, 30
	.word	0xa212a117	! t0_kref+0x474:   	or	%o2, 0x117, %l1
	.word	0xa2c54009	! t0_kref+0x478:   	addccc	%l5, %o1, %l1
	.word	0x81a98a4c	! t0_kref+0x47c:   	fcmpd	%fcc0, %f6, %f12
	.word	0xe81e401d	! t0_kref+0x480:   	ldd	[%i1 + %i5], %l4
	.word	0xe256001b	! t0_kref+0x484:   	ldsh	[%i0 + %i3], %l1
	.word	0x8143c000	! t0_kref+0x488:   	stbar
	.word	0x9de3bfa0	! t0_kref+0x48c:   	save	%sp, -0x60, %sp
	.word	0xa3ef401a	! t0_kref+0x490:   	restore	%i5, %i2, %l1
	.word	0x24800003	! t0_kref+0x494:   	ble,a	_kref+0x4a0
	.word	0xa22ec010	! t0_kref+0x498:   	andn	%i3, %l0, %l1
	.word	0xa3700014	! t0_kref+0x49c:   	popc	%l4, %l1
	.word	0xee20a038	! t0_kref+0x4a0:   	st	%l7, [%g2 + 0x38]
	.word	0xa33e8000	! t0_kref+0x4a4:   	sra	%i2, %g0, %l1
	.word	0xa1a01893	! t0_kref+0x4a8:   	fitos	%f19, %f16
	.word	0x29480001	! t0_kref+0x4ac:   	fbl,a,pt	%fcc0, _kref+0x4b0
	.word	0xa9b70977	! t0_kref+0x4b0:   	fpmerge	%f28, %f23, %f20
	.word	0xb3b30afd	! t0_kref+0x4b4:   	fpsub32s	%f12, %f29, %f25
	.word	0x2a800002	! t0_kref+0x4b8:   	bcs,a	_kref+0x4c0
	.word	0x81df4018	! t0_kref+0x4bc:   	flush	%i5 + %i0
	.word	0x9de3bfa0	! t0_kref+0x4c0:   	save	%sp, -0x60, %sp
	.word	0x80802083	! t0_kref+0x4c4:   	addcc	%g0, 0x83, %g0
	.word	0xa3ee0000	! t0_kref+0x4c8:   	restore	%i0, %g0, %l1
	.word	0xa29ab15e	! t0_kref+0x4cc:   	xorcc	%o2, -0xea2, %l1
	.word	0xa25db905	! t0_kref+0x4d0:   	smul	%l6, -0x6fb, %l1
	.word	0x2d480005	! t0_kref+0x4d4:   	fbg,a,pt	%fcc0, _kref+0x4e8
	.word	0xeb06001c	! t0_kref+0x4d8:   	ld	[%i0 + %i4], %f21
	.word	0xef20a020	! t0_kref+0x4dc:   	st	%f23, [%g2 + 0x20]
	.word	0xa2c40000	! t0_kref+0x4e0:   	addccc	%l0, %g0, %l1
	.word	0x2300e453	! t0_kref+0x4e4:   	sethi	%hi(0x3914c00), %l1
	.word	0xd1264000	! t0_kref+0x4e8:   	st	%f8, [%i1]
	.word	0xa2358014	! t0_kref+0x4ec:   	orn	%l6, %l4, %l1
	.word	0xd236001b	! t0_kref+0x4f0:   	sth	%o1, [%i0 + %i3]
	.word	0xa3b58009	! t0_kref+0x4f4:   	edge8	%l6, %o1, %l1
	.word	0xa322a259	! t0_kref+0x4f8:   	mulscc	%o2, 0x259, %l1
	.word	0xa33c8000	! t0_kref+0x4fc:   	sra	%l2, %g0, %l1
	.word	0xc020a030	! t0_kref+0x500:   	clr	[%g2 + 0x30]
	.word	0x9da20939	! t0_kref+0x504:   	fmuls	%f8, %f25, %f14
	.word	0x2f480001	! t0_kref+0x508:   	fbu,a,pt	%fcc0, _kref+0x50c
	.word	0xa2402df2	! t0_kref+0x50c:   	addc	%g0, 0xdf2, %l1
	.word	0xe20e0000	! t0_kref+0x510:   	ldub	[%i0], %l1
	.word	0xe2562006	! t0_kref+0x514:   	ldsh	[%i0 + 6], %l1
	.word	0x30800006	! t0_kref+0x518:   	ba,a	_kref+0x530
	.word	0x91b20d0a	! t0_kref+0x51c:   	fandnot1	%f8, %f10, %f8
	.word	0x81da62f4	! t0_kref+0x520:   	flush	%o1 + 0x2f4
	.word	0xe2de501d	! t0_kref+0x524:   	ldxa	[%i1 + %i5]0x80, %l1
	.word	0x99b30dba	! t0_kref+0x528:   	fxors	%f12, %f26, %f12
	.word	0x81aa8aa6	! t0_kref+0x52c:   	fcmpes	%fcc0, %f10, %f6
	.word	0xa29d4000	! t0_kref+0x530:   	xorcc	%l5, %g0, %l1
	.word	0xa29a401b	! t0_kref+0x534:   	xorcc	%o1, %i3, %l1
	.word	0x9da0054e	! t0_kref+0x538:   	fsqrtd	%f14, %f14
	.word	0x95b28e80	! t0_kref+0x53c:   	fsrc1	%f10, %f10
	call	SYM(t0_subr1)
	.word	0xe7e65017	! t0_kref+0x544:   	casa	[%i1]0x80, %l7, %l3
	.word	0xe1be1000	! t0_kref+0x548:   	stda	%f16, [%i0]0x80
	.word	0xa27b0016	! t0_kref+0x54c:   	sdiv	%o4, %l6, %l1
	.word	0xa2140012	! t0_kref+0x550:   	or	%l0, %l2, %l1
	.word	0xf500a018	! t0_kref+0x554:   	ld	[%g2 + 0x18], %f26
	.word	0xe250a00a	! t0_kref+0x558:   	ldsh	[%g2 + 0xa], %l1
	.word	0xadb4cd26	! t0_kref+0x55c:   	fandnot1s	%f19, %f6, %f22
	.word	0xd06e3ff4	! t0_kref+0x560:   	ldstub	[%i0 - 0xc], %o0
	.word	0xe3b8a040	! t0_kref+0x564:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xa204801b	! t0_kref+0x568:   	add	%l2, %i3, %l1
	.word	0xecee501a	! t0_kref+0x56c:   	ldstuba	[%i1 + %i2]0x80, %l6
	.word	0xd520a010	! t0_kref+0x570:   	st	%f10, [%g2 + 0x10]
	.word	0xa29aa313	! t0_kref+0x574:   	xorcc	%o2, 0x313, %l1
	.word	0xea28a03b	! t0_kref+0x578:   	stb	%l5, [%g2 + 0x3b]
	.word	0xe200a038	! t0_kref+0x57c:   	ld	[%g2 + 0x38], %l1
	.word	0xe200a010	! t0_kref+0x580:   	ld	[%g2 + 0x10], %l1
	.word	0xe408783c	! t0_kref+0x584:   	ldub	[%g1 - 0x7c4], %l2
	.word	0xa41ca00c	! t0_kref+0x588:   	xor	%l2, 0xc, %l2
	.word	0xe428783c	! t0_kref+0x58c:   	stb	%l2, [%g1 - 0x7c4]
	.word	0x81d8783c	! t0_kref+0x590:   	flush	%g1 - 0x7c4
	.word	0xd526201c	! t0_kref+0x594:   	st	%f10, [%i0 + 0x1c]
	.word	0xa2d00011	! t0_kref+0x598:   	umulcc	%g0, %l1, %l1
	.word	0xe2166000	! t0_kref+0x59c:   	lduh	[%i1], %l1
	.word	0xa2a43916	! t0_kref+0x5a0:   	subcc	%l0, -0x6ea, %l1
	.word	0x8143c000	! t0_kref+0x5a4:   	stbar
	.word	0xa2150011	! t0_kref+0x5a8:   	or	%l4, %l1, %l1
	.word	0xe82e8018	! t0_kref+0x5ac:   	stb	%l4, [%i2 + %i0]
	.word	0xa276f073	! t0_kref+0x5b0:   	udiv	%i3, -0xf8d, %l1
	.word	0xcd270019	! t0_kref+0x5b4:   	st	%f6, [%i4 + %i1]
	.word	0xa9a588d6	! t0_kref+0x5b8:   	fsubd	%f22, %f22, %f20
	.word	0xa204a359	! t0_kref+0x5bc:   	add	%l2, 0x359, %l1
	.word	0xa235c017	! t0_kref+0x5c0:   	orn	%l7, %l7, %l1
	.word	0x95b34a3a	! t0_kref+0x5c4:   	fpadd16s	%f13, %f26, %f10
2:	.word	0xa21b29b3	! t0_kref+0x5c8:   	xor	%o4, 0x9b3, %l1
	.word	0x95a0190b	! t0_kref+0x5cc:   	fitod	%f11, %f10
	.word	0x81dc2ccb	! t0_kref+0x5d0:   	flush	%l0 + 0xccb
	.word	0xb9b38a50	! t0_kref+0x5d4:   	fpadd32	%f14, %f16, %f28
	.word	0x99b68c8a	! t0_kref+0x5d8:   	fandnot2	%f26, %f10, %f12
	.word	0x8143c000	! t0_kref+0x5dc:   	stbar
	.word	0x9fc10000	! t0_kref+0x5e0:   	call	%g4
	.word	0xc807bfe4	! t0_kref+0x5e4:   	ld	[%fp - 0x1c], %g4
	.word	0xe210a020	! t0_kref+0x5e8:   	lduh	[%g2 + 0x20], %l1
	.word	0xed00a020	! t0_kref+0x5ec:   	ld	[%g2 + 0x20], %f22
	.word	0xa21d8016	! t0_kref+0x5f0:   	xor	%l6, %l6, %l1
	.word	0xb1a24837	! t0_kref+0x5f4:   	fadds	%f9, %f23, %f24
	.word	0xa3b00f36	! t0_kref+0x5f8:   	fsrc2s	%f22, %f17
	.word	0xa2057f40	! t0_kref+0x5fc:   	add	%l5, -0xc0, %l1
	call	SYM(t0_subr0)
	.word	0xe81e7fe8	! t0_kref+0x604:   	ldd	[%i1 - 0x18], %l4
	.word	0x8143c000	! t0_kref+0x608:   	stbar
	.word	0xe0680018	! t0_kref+0x60c:   	ldstub	[%g0 + %i0], %l0
	.word	0xb5b00cc6	! t0_kref+0x610:   	fnot2	%f6, %f26
	.word	0xb9a00554	! t0_kref+0x614:   	fsqrtd	%f20, %f28
	.word	0xa2020008	! t0_kref+0x618:   	add	%o0, %o0, %l1
	.word	0xe210a032	! t0_kref+0x61c:   	lduh	[%g2 + 0x32], %l1
	.word	0x34800003	! t0_kref+0x620:   	bg,a	_kref+0x62c
	.word	0x233fe346	! t0_kref+0x624:   	sethi	%hi(0xff8d1800), %l1
	.word	0xe41e2000	! t0_kref+0x628:   	ldd	[%i0], %l2
	.word	0x28800006	! t0_kref+0x62c:   	bleu,a	_kref+0x644
	.word	0xd520a018	! t0_kref+0x630:   	st	%f10, [%g2 + 0x18]
	.word	0xa1a00028	! t0_kref+0x634:   	fmovs	%f8, %f16
	.word	0xb3a3c8a8	! t0_kref+0x638:   	fsubs	%f15, %f8, %f25
	.word	0xe2500018	! t0_kref+0x63c:   	ldsh	[%g0 + %i0], %l1
	.word	0x30800006	! t0_kref+0x640:   	ba,a	_kref+0x658
	.word	0x9fa208b9	! t0_kref+0x644:   	fsubs	%f8, %f25, %f15
	.word	0xa2056c80	! t0_kref+0x648:   	add	%l5, 0xc80, %l1
	call	0x00000764
	.word	0xb9a01a3b	! t0_kref+0x650:   	fstoi	%f27, %f28
	.word	0xa2e5400d	! t0_kref+0x654:   	subccc	%l5, %o5, %l1
	.word	0xb7a70928	! t0_kref+0x658:   	fmuls	%f28, %f8, %f27
	.word	0xe250a000	! t0_kref+0x65c:   	ldsh	[%g2], %l1
	call	SYM(t0_subr2)
	.word	0xa2da0014	! t0_kref+0x664:   	smulcc	%o0, %l4, %l1
	.word	0xbba01891	! t0_kref+0x668:   	fitos	%f17, %f29
	.word	0x81ad4a2b	! t0_kref+0x66c:   	fcmps	%fcc0, %f21, %f11
	.word	0xcd00a018	! t0_kref+0x670:   	ld	[%g2 + 0x18], %f6
	.word	0xb9a00052	! t0_kref+0x674:   	fmovd	%f18, %f28
	.word	0xd06e8018	! t0_kref+0x678:   	ldstub	[%i2 + %i0], %o0
	.word	0xb5a5093a	! t0_kref+0x67c:   	fmuls	%f20, %f26, %f26
	.word	0x37480008	! t0_kref+0x680:   	fbge,a,pt	%fcc0, _kref+0x6a0
	.word	0xadb54caa	! t0_kref+0x684:   	fandnot2s	%f21, %f10, %f22
	.word	0x38800006	! t0_kref+0x688:   	bgu,a	_kref+0x6a0
	.word	0xda680018	! t0_kref+0x68c:   	ldstub	[%g0 + %i0], %o5
	.word	0xb9b50d12	! t0_kref+0x690:   	fandnot1	%f20, %f18, %f28
	.word	0xa2140011	! t0_kref+0x694:   	or	%l0, %l1, %l1
	.word	0xa33ce004	! t0_kref+0x698:   	sra	%l3, 0x4, %l1
	.word	0xe216200c	! t0_kref+0x69c:   	lduh	[%i0 + 0xc], %l1
	.word	0xa22c4009	! t0_kref+0x6a0:   	andn	%l1, %o1, %l1
	.word	0xa3b28077	! t0_kref+0x6a4:   	edge8ln	%o2, %l7, %l1
	.word	0x95b5870c	! t0_kref+0x6a8:   	fmuld8sux16	%f22, %f12, %f10
	.word	0x86102001	! t0_kref+0x6ac:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x6b0:   	bne,a	_kref+0x6b0
	.word	0x86a0e001	! t0_kref+0x6b4:   	subcc	%g3, 1, %g3
	call	SYM(t0_subr1)
	.word	0xa3b24200	! t0_kref+0x6bc:   	array8	%o1, %g0, %l1
	.word	0xa2144009	! t0_kref+0x6c0:   	or	%l1, %o1, %l1
	.word	0xecae5000	! t0_kref+0x6c4:   	stba	%l6, [%i1]0x80
	.word	0xdaf81018	! t0_kref+0x6c8:   	swapa	[%g0 + %i0]0x80, %o5
	.word	0xa2e27334	! t0_kref+0x6cc:   	subccc	%o1, -0xccc, %l1
	.word	0xa5a01898	! t0_kref+0x6d0:   	fitos	%f24, %f18
	.word	0xa2f2c013	! t0_kref+0x6d4:   	udivcc	%o3, %l3, %l1
	.word	0x81ac0a52	! t0_kref+0x6d8:   	fcmpd	%fcc0, %f16, %f18
	.word	0xa25d3ec2	! t0_kref+0x6dc:   	smul	%l4, -0x13e, %l1
	.word	0x91a6c931	! t0_kref+0x6e0:   	fmuls	%f27, %f17, %f8
	.word	0x29800004	! t0_kref+0x6e4:   	fbl,a	_kref+0x6f4
	.word	0xa3418000	! t0_kref+0x6e8:   	mov	%fprs, %l1
	.word	0x81b01021	! t0_kref+0x6ec:   	siam	0x1
	.word	0xb9b5cc73	! t0_kref+0x6f0:   	fnors	%f23, %f19, %f28
	.word	0xe2162006	! t0_kref+0x6f4:   	lduh	[%i0 + 6], %l1
	.word	0xa2e24009	! t0_kref+0x6f8:   	subccc	%o1, %o1, %l1
	.word	0x28800002	! t0_kref+0x6fc:   	bleu,a	_kref+0x704
	.word	0xe248a011	! t0_kref+0x700:   	ldsb	[%g2 + 0x11], %l1
	.word	0xb5a408d4	! t0_kref+0x704:   	fsubd	%f16, %f20, %f26
	.word	0x8d834011	! t0_kref+0x708:   	wr	%o5, %l1, %fprs
	.word	0xe2df5018	! t0_kref+0x70c:   	ldxa	[%i5 + %i0]0x80, %l1
	.word	0x81aa8ab9	! t0_kref+0x710:   	fcmpes	%fcc0, %f10, %f25
	.word	0xe81e4000	! t0_kref+0x714:   	ldd	[%i1], %l4
	.word	0x3e480005	! t0_kref+0x718:   	bvc,a,pt	%icc, _kref+0x72c
	.word	0xe250a038	! t0_kref+0x71c:   	ldsh	[%g2 + 0x38], %l1
	.word	0x91b28f8a	! t0_kref+0x720:   	for	%f10, %f10, %f8
	.word	0xd230a020	! t0_kref+0x724:   	sth	%o1, [%g2 + 0x20]
	.word	0xd820a030	! t0_kref+0x728:   	st	%o4, [%g2 + 0x30]
	.word	0xa2343872	! t0_kref+0x72c:   	orn	%l0, -0x78e, %l1
	.word	0xa3b2808d	! t0_kref+0x730:   	edge16	%o2, %o5, %l1
	.word	0xe24e8018	! t0_kref+0x734:   	ldsb	[%i2 + %i0], %l1
	.word	0x81840000	! t0_kref+0x738:   	wr	%l0, %g0, %y
	.word	0xa3b5c01b	! t0_kref+0x73c:   	edge8	%l7, %i3, %l1
	.word	0x9fa20928	! t0_kref+0x740:   	fmuls	%f8, %f8, %f15
	.word	0xfb266008	! t0_kref+0x744:   	st	%f29, [%i1 + 8]
	.word	0xee6e3fe4	! t0_kref+0x748:   	ldstub	[%i0 - 0x1c], %l7
	.word	0x2e480001	! t0_kref+0x74c:   	bvs,a,pt	%icc, _kref+0x750
	.word	0x9db2073b	! t0_kref+0x750:   	fmuld8ulx16	%f8, %f27, %f14
	.word	0x81830000	! t0_kref+0x754:   	wr	%o4, %g0, %y
	.word	0xa2ddf49b	! t0_kref+0x758:   	smulcc	%l7, -0xb65, %l1
	.word	0x32480003	! t0_kref+0x75c:   	bne,a,pt	%icc, _kref+0x768
	.word	0xada018d6	! t0_kref+0x760:   	fdtos	%f22, %f22
	.word	0x2c480006	! t0_kref+0x764:   	bneg,a,pt	%icc, _kref+0x77c
	.word	0xe20e3fea	! t0_kref+0x768:   	ldub	[%i0 - 0x16], %l1
	.word	0x25480008	! t0_kref+0x76c:   	fblg,a,pt	%fcc0, _kref+0x78c
	.word	0xa25531b8	! t0_kref+0x770:   	umul	%l4, -0xe48, %l1
	.word	0xf1be1a5c	! t0_kref+0x774:   	stda	%f24, [%i0 + %i4]0xd2
	.word	0xa205f6e7	! t0_kref+0x778:   	add	%l7, -0x919, %l1
	.word	0xf428a00a	! t0_kref+0x77c:   	stb	%i2, [%g2 + 0xa]
	.word	0xa23565a5	! t0_kref+0x780:   	orn	%l5, 0x5a5, %l1
	.word	0x34800005	! t0_kref+0x784:   	bg,a	_kref+0x798
	.word	0xa5b20c66	! t0_kref+0x788:   	fnors	%f8, %f6, %f18
	.word	0xa3b7058c	! t0_kref+0x78c:   	fcmpgt32	%f28, %f12, %l1
	.word	0xe24e6005	! t0_kref+0x790:   	ldsb	[%i1 + 5], %l1
	.word	0xa234400a	! t0_kref+0x794:   	orn	%l1, %o2, %l1
	.word	0xc030a020	! t0_kref+0x798:   	clrh	[%g2 + 0x20]
	.word	0xa7a208ae	! t0_kref+0x79c:   	fsubs	%f8, %f14, %f19
	.word	0xec6e7fec	! t0_kref+0x7a0:   	ldstub	[%i1 - 0x14], %l6
	.word	0xa2c48014	! t0_kref+0x7a4:   	addccc	%l2, %l4, %l1
	.word	0xa21b0000	! t0_kref+0x7a8:   	xor	%o4, %g0, %l1
	.word	0xa3703979	! t0_kref+0x7ac:   	popc	-0x687, %l1
	.word	0xc3ee1011	! t0_kref+0x7b0:   	prefetcha	%i0 + %l1, 1
	call	SYM(t0_subr0)
	.word	0xa5a01a2e	! t0_kref+0x7b8:   	fstoi	%f14, %f18
	.word	0xadb24738	! t0_kref+0x7bc:   	fmuld8ulx16	%f9, %f24, %f22
	.word	0xa22ee289	! t0_kref+0x7c0:   	andn	%i3, 0x289, %l1
	.word	0x81ac4a2a	! t0_kref+0x7c4:   	fcmps	%fcc0, %f17, %f10
	.word	0xe3ee101a	! t0_kref+0x7c8:   	prefetcha	%i0 + %i2, 17
	.word	0xa2048016	! t0_kref+0x7cc:   	add	%l2, %l6, %l1
	.word	0x9fc00004	! t0_kref+0x7d0:   	call	%g0 + %g4
	.word	0xa2e30009	! t0_kref+0x7d4:   	subccc	%o4, %o1, %l1
	.word	0xe2563fe2	! t0_kref+0x7d8:   	ldsh	[%i0 - 0x1e], %l1
	call	SYM(t0_subr1)
	.word	0xa3400000	! t0_kref+0x7e0:   	mov	%y, %l1
	.word	0x30800003	! t0_kref+0x7e4:   	ba,a	_kref+0x7f0
	.word	0xb5b38e50	! t0_kref+0x7e8:   	fxnor	%f14, %f16, %f26
	.word	0xa216c00d	! t0_kref+0x7ec:   	or	%i3, %o5, %l1
	.word	0xa2c03dc4	! t0_kref+0x7f0:   	addccc	%g0, -0x23c, %l1
	.word	0xa3b2031b	! t0_kref+0x7f4:   	alignaddr	%o0, %i3, %l1
	.word	0xa5b00f36	! t0_kref+0x7f8:   	fsrc2s	%f22, %f18
	.word	0x81ae8a58	! t0_kref+0x7fc:   	fcmpd	%fcc0, %f26, %f24
	.word	0xa9a50850	! t0_kref+0x800:   	faddd	%f20, %f16, %f20
	.word	0xa22af284	! t0_kref+0x804:   	andn	%o3, -0xd7c, %l1
	.word	0x21480002	! t0_kref+0x808:   	fbn,a,pt	%fcc0, _kref+0x810
	.word	0xb7b18f72	! t0_kref+0x80c:   	fornot1s	%f6, %f18, %f27
	.word	0x9de3bfa0	! t0_kref+0x810:   	save	%sp, -0x60, %sp
	.word	0xa3eef1e8	! t0_kref+0x814:   	restore	%i3, -0xe18, %l1
	.word	0xc026001c	! t0_kref+0x818:   	clr	[%i0 + %i4]
	.word	0xa3247367	! t0_kref+0x81c:   	mulscc	%l1, -0xc99, %l1
	.word	0xa253000c	! t0_kref+0x820:   	umul	%o4, %o4, %l1
	.word	0x93a01a37	! t0_kref+0x824:   	fstoi	%f23, %f9
	.word	0x26800006	! t0_kref+0x828:   	bl,a	_kref+0x840
	.word	0xe246200c	! t0_kref+0x82c:   	ldsw	[%i0 + 0xc], %l1
	.word	0xe91fbcd8	! t0_kref+0x830:   	ldd	[%fp - 0x328], %f20
	.word	0xd836600e	! t0_kref+0x834:   	sth	%o4, [%i1 + 0xe]
	.word	0xb9b00cdc	! t0_kref+0x838:   	fnot2	%f28, %f28
	.word	0xa33c401b	! t0_kref+0x83c:   	sra	%l1, %i3, %l1
	.word	0x81850000	! t0_kref+0x840:   	wr	%l4, %g0, %y
	.word	0xa25c8016	! t0_kref+0x844:   	smul	%l2, %l6, %l1
	.word	0x93b30c6e	! t0_kref+0x848:   	fnors	%f12, %f14, %f9
	.word	0x81a98a5c	! t0_kref+0x84c:   	fcmpd	%fcc0, %f6, %f28
	.word	0xd46e3fee	! t0_kref+0x850:   	ldstub	[%i0 - 0x12], %o2
	.word	0xeb20a000	! t0_kref+0x854:   	st	%f21, [%g2]
	.word	0xada4084e	! t0_kref+0x858:   	faddd	%f16, %f14, %f22
	.word	0xabb70ca8	! t0_kref+0x85c:   	fandnot2s	%f28, %f8, %f21
	.word	0xa2c0001b	! t0_kref+0x860:   	addccc	%g0, %i3, %l1
	.word	0xe4180019	! t0_kref+0x864:   	ldd	[%g0 + %i1], %l2
	.word	0xa2aee91d	! t0_kref+0x868:   	andncc	%i3, 0x91d, %l1
	.word	0xe256c019	! t0_kref+0x86c:   	ldsh	[%i3 + %i1], %l1
	.word	0x9da0054c	! t0_kref+0x870:   	fsqrtd	%f12, %f14
	.word	0xa29ee2cc	! t0_kref+0x874:   	xorcc	%i3, 0x2cc, %l1
	.word	0xbba0188c	! t0_kref+0x878:   	fitos	%f12, %f29
	.word	0xe4087b0c	! t0_kref+0x87c:   	ldub	[%g1 - 0x4f4], %l2
	.word	0xa41ca00c	! t0_kref+0x880:   	xor	%l2, 0xc, %l2
	.word	0xe4287b0c	! t0_kref+0x884:   	stb	%l2, [%g1 - 0x4f4]
	.word	0x81d87b0c	! t0_kref+0x888:   	flush	%g1 - 0x4f4
	.word	0x81a98a56	! t0_kref+0x88c:   	fcmpd	%fcc0, %f6, %f22
	.word	0xc807bff0	! t0_kref+0x890:   	ld	[%fp - 0x10], %g4
	.word	0xada0102a	! t0_kref+0x894:   	fstox	%f10, %f22
2:	.word	0xa29a800d	! t0_kref+0x898:   	xorcc	%o2, %o5, %l1
	.word	0xb1b38e80	! t0_kref+0x89c:   	fsrc1	%f14, %f24
	.word	0xa33e8000	! t0_kref+0x8a0:   	sra	%i2, %g0, %l1
	.word	0xb5b2874c	! t0_kref+0x8a4:   	fpack32	%f10, %f12, %f26
	.word	0x85828015	! t0_kref+0x8a8:   	wr	%o2, %l5, %ccr
	.word	0x9de3bfa0	! t0_kref+0x8ac:   	save	%sp, -0x60, %sp
	.word	0xb4af401d	! t0_kref+0x8b0:   	andncc	%i5, %i5, %i2
	.word	0xa3ee401c	! t0_kref+0x8b4:   	restore	%i1, %i4, %l1
	.word	0x81da401e	! t0_kref+0x8b8:   	flush	%o1 + %fp
	.word	0x3f800007	! t0_kref+0x8bc:   	fbo,a	_kref+0x8d8
	.word	0xe420a008	! t0_kref+0x8c0:   	st	%l2, [%g2 + 8]
	.word	0x95a508ac	! t0_kref+0x8c4:   	fsubs	%f20, %f12, %f10
	.word	0xe248a030	! t0_kref+0x8c8:   	ldsb	[%g2 + 0x30], %l1
	.word	0x9fc10000	! t0_kref+0x8cc:   	call	%g4
	.word	0xe2066018	! t0_kref+0x8d0:   	ld	[%i1 + 0x18], %l1
	.word	0xe628a008	! t0_kref+0x8d4:   	stb	%l3, [%g2 + 8]
	.word	0x9f414000	! t0_kref+0x8d8:   	mov	%pc, %o7
!	.word	0x22bd35c7	! t0_kref+0x8dc:   	be,a	SYM(t0_subr1)
	   	be,a	SYM(t0_subr1)
	.word	0x99b2874c	! t0_kref+0x8e0:   	fpack32	%f10, %f12, %f12
	.word	0xda20a038	! t0_kref+0x8e4:   	st	%o5, [%g2 + 0x38]
	.word	0xa9a4894a	! t0_kref+0x8e8:   	fmuld	%f18, %f10, %f20
	.word	0x93b34c6a	! t0_kref+0x8ec:   	fnors	%f13, %f10, %f9
	.word	0x9da20948	! t0_kref+0x8f0:   	fmuld	%f8, %f8, %f14
	.word	0xa9a01912	! t0_kref+0x8f4:   	fitod	%f18, %f20
	.word	0xa22b661e	! t0_kref+0x8f8:   	andn	%o5, 0x61e, %l1
	.word	0xf9ee101d	! t0_kref+0x8fc:   	prefetcha	%i0 + %i5, 28
	.word	0x81aa8a48	! t0_kref+0x900:   	fcmpd	%fcc0, %f10, %f8
	.word	0x81b01020	! t0_kref+0x904:   	siam	0x0
	.word	0xa2034000	! t0_kref+0x908:   	add	%o5, %g0, %l1
	.word	0x3d800006	! t0_kref+0x90c:   	fbule,a	_kref+0x924
	.word	0x99a1895c	! t0_kref+0x910:   	fmuld	%f6, %f28, %f12
	.word	0xa2d335ae	! t0_kref+0x914:   	umulcc	%o4, -0xa52, %l1
	.word	0xa2f2e642	! t0_kref+0x918:   	udivcc	%o3, 0x642, %l1
	.word	0x91a0004c	! t0_kref+0x91c:   	fmovd	%f12, %f8
	.word	0x9da00529	! t0_kref+0x920:   	fsqrts	%f9, %f14
	.word	0x8143c000	! t0_kref+0x924:   	stbar
	.word	0xe9be5a5b	! t0_kref+0x928:   	stda	%f20, [%i1 + %i3]0xd2
	.word	0xa3244016	! t0_kref+0x92c:   	mulscc	%l1, %l6, %l1
	.word	0x81aa0a54	! t0_kref+0x930:   	fcmpd	%fcc0, %f8, %f20
	.word	0xa29d4008	! t0_kref+0x934:   	xorcc	%l5, %o0, %l1
	.word	0xa22c801a	! t0_kref+0x938:   	andn	%l2, %i2, %l1
	.word	0xb5a4884e	! t0_kref+0x93c:   	faddd	%f18, %f14, %f26
	.word	0xdb00a030	! t0_kref+0x940:   	ld	[%g2 + 0x30], %f13
	.word	0x91b2897c	! t0_kref+0x944:   	fpmerge	%f10, %f28, %f8
	.word	0x95a018d8	! t0_kref+0x948:   	fdtos	%f24, %f10
	.word	0x9fc10000	! t0_kref+0x94c:   	call	%g4
	.word	0xa2e2000c	! t0_kref+0x950:   	subccc	%o0, %o4, %l1
	.word	0xf3263fec	! t0_kref+0x954:   	st	%f25, [%i0 - 0x14]
	.word	0xf6270019	! t0_kref+0x958:   	st	%i3, [%i4 + %i1]
	.word	0xa22cc00a	! t0_kref+0x95c:   	andn	%l3, %o2, %l1
	.word	0x9da189bc	! t0_kref+0x960:   	fdivs	%f6, %f28, %f14
	.word	0xa3b685dc	! t0_kref+0x964:   	fcmpeq32	%f26, %f28, %l1
	.word	0xa285c01b	! t0_kref+0x968:   	addcc	%l7, %i3, %l1
	.word	0xa5a0193a	! t0_kref+0x96c:   	fstod	%f26, %f18
	.word	0xa36166ae	! t0_kref+0x970:   	movug	%fcc0, -0x152, %l1
	.word	0x93b70ea0	! t0_kref+0x974:   	fsrc1s	%f28, %f9
	.word	0xa2727188	! t0_kref+0x978:   	udiv	%o1, -0xe78, %l1
	.word	0xa2c6b12d	! t0_kref+0x97c:   	addccc	%i2, -0xed3, %l1
	.word	0xa5a2c82c	! t0_kref+0x980:   	fadds	%f11, %f12, %f18
	.word	0x9db18a2a	! t0_kref+0x984:   	fpadd16s	%f6, %f10, %f14
	.word	0xe210a038	! t0_kref+0x988:   	lduh	[%g2 + 0x38], %l1
	.word	0xd1be9a18	! t0_kref+0x98c:   	stda	%f8, [%i2 + %i0]0xd0
	.word	0xe206201c	! t0_kref+0x990:   	ld	[%i0 + 0x1c], %l1
	.word	0x39480005	! t0_kref+0x994:   	fbuge,a,pt	%fcc0, _kref+0x9a8
	.word	0x99a01a27	! t0_kref+0x998:   	fstoi	%f7, %f12
	.word	0x81dec000	! t0_kref+0x99c:   	flush	%i3
	.word	0x9bb007a6	! t0_kref+0x9a0:   	fpackfix	%f6, %f13
	.word	0xa29eb6a0	! t0_kref+0x9a4:   	xorcc	%i2, -0x960, %l1
	.word	0xa255801b	! t0_kref+0x9a8:   	umul	%l6, %i3, %l1
	.word	0xa2b68011	! t0_kref+0x9ac:   	orncc	%i2, %l1, %l1
	.word	0xdd06001c	! t0_kref+0x9b0:   	ld	[%i0 + %i4], %f14
	.word	0xa27422d0	! t0_kref+0x9b4:   	udiv	%l0, 0x2d0, %l1
	.word	0xe2de501d	! t0_kref+0x9b8:   	ldxa	[%i1 + %i5]0x80, %l1
	.word	0xe3b8a040	! t0_kref+0x9bc:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xa33da018	! t0_kref+0x9c0:   	sra	%l6, 0x18, %l1
	.word	0xa5a00031	! t0_kref+0x9c4:   	fmovs	%f17, %f18
	.word	0x9da01927	! t0_kref+0x9c8:   	fstod	%f7, %f14
	.word	0xf9bf5a59	! t0_kref+0x9cc:   	stda	%f28, [%i5 + %i1]0xd2
	.word	0x8186c000	! t0_kref+0x9d0:   	wr	%i3, %g0, %y
	.word	0xa2a83f7b	! t0_kref+0x9d4:   	andncc	%g0, -0x85, %l1
	.word	0xf630a000	! t0_kref+0x9d8:   	sth	%i3, [%g2]
	.word	0xa2ade5ae	! t0_kref+0x9dc:   	andncc	%l7, 0x5ae, %l1
	.word	0xd6270019	! t0_kref+0x9e0:   	st	%o3, [%i4 + %i1]
	.word	0x001fffff	! t0_kref+0x9e4:   	illtrap	0x1fffff
	.word	0xb7a5893b	! t0_kref+0x9e8:   	fmuls	%f22, %f27, %f27
	.word	0xa3400000	! t0_kref+0x9ec:   	mov	%y, %l1
	.word	0xe26e3ff0	! t0_kref+0x9f0:   	ldstub	[%i0 - 0x10], %l1
	.word	0xa3400000	! t0_kref+0x9f4:   	mov	%y, %l1
	.word	0x23280026	! t0_kref+0x9f8:   	sethi	%hi(0xa0009800), %l1
	.word	0xe93e0000	! t0_kref+0x9fc:   	std	%f20, [%i0]
	.word	0xb1b58974	! t0_kref+0xa00:   	fpmerge	%f22, %f20, %f24
	call	SYM(t0_subr2)
	.word	0xa3aa402d	! t0_kref+0xa08:   	fmovse	%fcc0, %f13, %f17
	.word	0xa2aa8008	! t0_kref+0xa0c:   	andncc	%o2, %o0, %l1
	.word	0xe2de5000	! t0_kref+0xa10:   	ldxa	[%i1]0x80, %l1
	.word	0xa243400a	! t0_kref+0xa14:   	addc	%o5, %o2, %l1
	.word	0xadb38f50	! t0_kref+0xa18:   	fornot1	%f14, %f16, %f22
	.word	0x39480008	! t0_kref+0xa1c:   	fbuge,a,pt	%fcc0, _kref+0xa3c
	.word	0xa3418000	! t0_kref+0xa20:   	mov	%fprs, %l1
	call	SYM(t0_subr3)
	.word	0xb9a709ab	! t0_kref+0xa28:   	fdivs	%f28, %f11, %f28
	.word	0xc0680018	! t0_kref+0xa2c:   	ldstub	[%g0 + %i0], %g0
	.word	0x3c800003	! t0_kref+0xa30:   	bpos,a	_kref+0xa3c
	.word	0xa3b50240	! t0_kref+0xa34:   	array16	%l4, %g0, %l1
	.word	0xe1e6501b	! t0_kref+0xa38:   	casa	[%i1]0x80, %i3, %l0
	.word	0xa5a00050	! t0_kref+0xa3c:   	fmovd	%f16, %f18
	.word	0xe2961000	! t0_kref+0xa40:   	lduha	[%i0]0x80, %l1
	.word	0xeea6101c	! t0_kref+0xa44:   	sta	%l7, [%i0 + %i4]0x80
	.word	0xa1a0002a	! t0_kref+0xa48:   	fmovs	%f10, %f16
	.word	0xe030a038	! t0_kref+0xa4c:   	sth	%l0, [%g2 + 0x38]
	.word	0xa25dc01a	! t0_kref+0xa50:   	smul	%l7, %i2, %l1
	.word	0xa3b5858a	! t0_kref+0xa54:   	fcmpgt32	%f22, %f10, %l1
	.word	0x97a01888	! t0_kref+0xa58:   	fitos	%f8, %f11
	.word	0xec2e3ff0	! t0_kref+0xa5c:   	stb	%l6, [%i0 - 0x10]
	.word	0x25800002	! t0_kref+0xa60:   	fblg,a	_kref+0xa68
	.word	0xa2c22e4c	! t0_kref+0xa64:   	addccc	%o0, 0xe4c, %l1
	.word	0xa206b998	! t0_kref+0xa68:   	add	%i2, -0x668, %l1
	.word	0x230b4350	! t0_kref+0xa6c:   	sethi	%hi(0x2d0d4000), %l1
	.word	0xa9b48d14	! t0_kref+0xa70:   	fandnot1	%f18, %f20, %f20
	call	SYM(t0_subr1)
	.word	0xa2f48008	! t0_kref+0xa78:   	udivcc	%l2, %o0, %l1
	.word	0xa2124011	! t0_kref+0xa7c:   	or	%o1, %l1, %l1
	.word	0xd220a038	! t0_kref+0xa80:   	st	%o1, [%g2 + 0x38]
	.word	0xa3b30172	! t0_kref+0xa84:   	edge32ln	%o4, %l2, %l1
	.word	0xa3400000	! t0_kref+0xa88:   	mov	%y, %l1
	.word	0xf420a028	! t0_kref+0xa8c:   	st	%i2, [%g2 + 0x28]
	.word	0xf706200c	! t0_kref+0xa90:   	ld	[%i0 + 0xc], %f27
	.word	0x81ab0a37	! t0_kref+0xa94:   	fcmps	%fcc0, %f12, %f23
	.word	0xa2b46725	! t0_kref+0xa98:   	orncc	%l1, 0x725, %l1
	.word	0x37480004	! t0_kref+0xa9c:   	fbge,a,pt	%fcc0, _kref+0xaac
	.word	0x81daaef5	! t0_kref+0xaa0:   	flush	%o2 + 0xef5
	.word	0xada01926	! t0_kref+0xaa4:   	fstod	%f6, %f22
	.word	0x8da01a3a	! t0_kref+0xaa8:   	fstoi	%f26, %f6
	.word	0x2f800008	! t0_kref+0xaac:   	fbu,a	_kref+0xacc
	.word	0xe86e6014	! t0_kref+0xab0:   	ldstub	[%i1 + 0x14], %l4
	.word	0xa212c008	! t0_kref+0xab4:   	or	%o3, %o0, %l1
	.word	0xd4762000	! t0_kref+0xab8:   	stx	%o2, [%i0]
	.word	0xd1be1813	! t0_kref+0xabc:   	stda	%f8, [%i0 + %l3]0xc0
	.word	0x31480004	! t0_kref+0xac0:   	fba,a,pt	%fcc0, _kref+0xad0
	.word	0xa2adc008	! t0_kref+0xac4:   	andncc	%l7, %o0, %l1
	.word	0xfb262010	! t0_kref+0xac8:   	st	%f29, [%i0 + 0x10]
	.word	0xa22c6773	! t0_kref+0xacc:   	andn	%l1, 0x773, %l1
	.word	0xe620a030	! t0_kref+0xad0:   	st	%l3, [%g2 + 0x30]
	.word	0x3f480008	! t0_kref+0xad4:   	fbo,a,pt	%fcc0, _kref+0xaf4
	.word	0x231cbe1c	! t0_kref+0xad8:   	sethi	%hi(0x72f87000), %l1
	.word	0x91a44934	! t0_kref+0xadc:   	fmuls	%f17, %f20, %f8
	.word	0xed1fbde0	! t0_kref+0xae0:   	ldd	[%fp - 0x220], %f22
	.word	0xe41e6000	! t0_kref+0xae4:   	ldd	[%i1], %l2
	.word	0xa2f2c014	! t0_kref+0xae8:   	udivcc	%o3, %l4, %l1
	.word	0x9ba0189a	! t0_kref+0xaec:   	fitos	%f26, %f13
	.word	0xa2820013	! t0_kref+0xaf0:   	addcc	%o0, %l3, %l1
	.word	0xa1a588aa	! t0_kref+0xaf4:   	fsubs	%f22, %f10, %f16
	.word	0xe3b8a040	! t0_kref+0xaf8:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xe24e0000	! t0_kref+0xafc:   	ldsb	[%i0], %l1
	.word	0x8da6094e	! t0_kref+0xb00:   	fmuld	%f24, %f14, %f6
	.word	0xe5e61017	! t0_kref+0xb04:   	casa	[%i0]0x80, %l7, %l2
	.word	0xa22c401a	! t0_kref+0xb08:   	andn	%l1, %i2, %l1
	.word	0xa21e8013	! t0_kref+0xb0c:   	xor	%i2, %l3, %l1
	.word	0x86102007	! t0_kref+0xb10:   	mov	0x7, %g3
	.word	0x86a0e001	! t0_kref+0xb14:   	subcc	%g3, 1, %g3
	.word	0x2280000d	! t0_kref+0xb18:   	be,a	_kref+0xb4c
	.word	0xb7b40aad	! t0_kref+0xb1c:   	fpsub16s	%f16, %f13, %f27
	.word	0xe030a018	! t0_kref+0xb20:   	sth	%l0, [%g2 + 0x18]
	.word	0xee28a000	! t0_kref+0xb24:   	stb	%l7, [%g2]
	.word	0xafa288a7	! t0_kref+0xb28:   	fsubs	%f10, %f7, %f23
	.word	0xa2354010	! t0_kref+0xb2c:   	orn	%l5, %l0, %l1
	.word	0x81a98a58	! t0_kref+0xb30:   	fcmpd	%fcc0, %f6, %f24
	.word	0xfbee101b	! t0_kref+0xb34:   	prefetcha	%i0 + %i3, 29
	.word	0xe2d6101b	! t0_kref+0xb38:   	ldsha	[%i0 + %i3]0x80, %l1
	.word	0x2e480005	! t0_kref+0xb3c:   	bvs,a,pt	%icc, _kref+0xb50
	.word	0xe2c71019	! t0_kref+0xb40:   	ldswa	[%i4 + %i1]0x80, %l1
	.word	0xa242fc6c	! t0_kref+0xb44:   	addc	%o3, -0x394, %l1
	.word	0xada0192a	! t0_kref+0xb48:   	fstod	%f10, %f22
	.word	0x27480001	! t0_kref+0xb4c:   	fbul,a,pt	%fcc0, _kref+0xb50
	.word	0xa33ea01c	! t0_kref+0xb50:   	sra	%i2, 0x1c, %l1
	.word	0xa21aad8d	! t0_kref+0xb54:   	xor	%o2, 0xd8d, %l1
	.word	0xa2154013	! t0_kref+0xb58:   	or	%l5, %l3, %l1
	.word	0xa28a8013	! t0_kref+0xb5c:   	andcc	%o2, %l3, %l1
	.word	0xe830a018	! t0_kref+0xb60:   	sth	%l4, [%g2 + 0x18]
	.word	0xa335a011	! t0_kref+0xb64:   	srl	%l6, 0x11, %l1
	.word	0xadb0076c	! t0_kref+0xb68:   	fpack16	%f12, %f22
	.word	0xb9b7471b	! t0_kref+0xb6c:   	fmuld8sux16	%f29, %f27, %f28
	.word	0xe200a038	! t0_kref+0xb70:   	ld	[%g2 + 0x38], %l1
	.word	0x2305cf3a	! t0_kref+0xb74:   	sethi	%hi(0x173ce800), %l1
	.word	0x8143c000	! t0_kref+0xb78:   	stbar
	.word	0x81ad8a58	! t0_kref+0xb7c:   	fcmpd	%fcc0, %f22, %f24
	.word	0xdd066014	! t0_kref+0xb80:   	ld	[%i1 + 0x14], %f14
	.word	0xb5b00cfa	! t0_kref+0xb84:   	fnot2s	%f26, %f26
	.word	0xbbb40d60	! t0_kref+0xb88:   	fnot1s	%f16, %f29
	.word	0xa33c4000	! t0_kref+0xb8c:   	sra	%l1, %g0, %l1
	.word	0xe51fbcd0	! t0_kref+0xb90:   	ldd	[%fp - 0x330], %f18
	.word	0x93b70d60	! t0_kref+0xb94:   	fnot1s	%f28, %f9
	.word	0xa335c013	! t0_kref+0xb98:   	srl	%l7, %l3, %l1
	.word	0xe24e8019	! t0_kref+0xb9c:   	ldsb	[%i2 + %i1], %l1
	.word	0xa5a48d39	! t0_kref+0xba0:   	fsmuld	%f18, %f25, %f18
	.word	0xb9b00f36	! t0_kref+0xba4:   	fsrc2s	%f22, %f28
	.word	0xa3b48200	! t0_kref+0xba8:   	array8	%l2, %g0, %l1
	.word	0x99b58f88	! t0_kref+0xbac:   	for	%f22, %f8, %f12
	.word	0xb5b00cfd	! t0_kref+0xbb0:   	fnot2s	%f29, %f26
	.word	0x81ae8adc	! t0_kref+0xbb4:   	fcmped	%fcc0, %f26, %f28
	.word	0xa2e4000a	! t0_kref+0xbb8:   	subccc	%l0, %o2, %l1
	.word	0xe240a008	! t0_kref+0xbbc:   	ldsw	[%g2 + 8], %l1
	.word	0x81ab0a4a	! t0_kref+0xbc0:   	fcmpd	%fcc0, %f12, %f10
	.word	0xa24275c4	! t0_kref+0xbc4:   	addc	%o1, -0xa3c, %l1
	.word	0xe2480018	! t0_kref+0xbc8:   	ldsb	[%g0 + %i0], %l1
	.word	0xa2583ef0	! t0_kref+0xbcc:   	smul	%g0, -0x110, %l1
	.word	0xe248a021	! t0_kref+0xbd0:   	ldsb	[%g2 + 0x21], %l1
	.word	0x9e007e4c	! t0_kref+0xbd4:   	add	%g1, -0x1b4, %o7
!	.word	0x3e9eed09	! t0_kref+0xbd8:   	bvc,a	SYM(t0_subr0)
	   	bvc,a	SYM(t0_subr0)
	.word	0xa215000c	! t0_kref+0xbdc:   	or	%l4, %o4, %l1
	.word	0xa2f6b688	! t0_kref+0xbe0:   	udivcc	%i2, -0x978, %l1
	.word	0xa29df921	! t0_kref+0xbe4:   	xorcc	%l7, -0x6df, %l1
	.word	0xadb38ea0	! t0_kref+0xbe8:   	fsrc1s	%f14, %f22
	.word	0xa272400a	! t0_kref+0xbec:   	udiv	%o1, %o2, %l1
	call	SYM(t0_subr1)
	.word	0xadb58d8a	! t0_kref+0xbf4:   	fxor	%f22, %f10, %f22
	.word	0xda280018	! t0_kref+0xbf8:   	stb	%o5, [%g0 + %i0]
	.word	0xa9b6cab0	! t0_kref+0xbfc:   	fpsub16s	%f27, %f16, %f20
	.word	0xe2400019	! t0_kref+0xc00:   	ldsw	[%g0 + %i1], %l1
	.word	0xe2de501d	! t0_kref+0xc04:   	ldxa	[%i1 + %i5]0x80, %l1
	.word	0x9ba748b8	! t0_kref+0xc08:   	fsubs	%f29, %f24, %f13
	call	SYM(t0_subr1)
	.word	0xe240a028	! t0_kref+0xc10:   	ldsw	[%g2 + 0x28], %l1
	.word	0xa21ea6da	! t0_kref+0xc14:   	xor	%i2, 0x6da, %l1
	.word	0xe9be5888	! t0_kref+0xc18:   	stda	%f20, [%i1 + %o0]0xc4
	.word	0x8dab804a	! t0_kref+0xc1c:   	fmovdule	%fcc0, %f10, %f6
	.word	0x81dd8019	! t0_kref+0xc20:   	flush	%l6 + %i1
	.word	0xa3408000	! t0_kref+0xc24:   	mov	%ccr, %l1
	.word	0xa202244b	! t0_kref+0xc28:   	add	%o0, 0x44b, %l1
	.word	0xa28b4014	! t0_kref+0xc2c:   	andcc	%o5, %l4, %l1
	.word	0x29480007	! t0_kref+0xc30:   	fbl,a,pt	%fcc0, _kref+0xc4c
	.word	0x91b40d9a	! t0_kref+0xc34:   	fxor	%f16, %f26, %f8
	.word	0xd720a018	! t0_kref+0xc38:   	st	%f11, [%g2 + 0x18]
	.word	0xa2952536	! t0_kref+0xc3c:   	orcc	%l4, 0x536, %l1
	.word	0xb9b70d9a	! t0_kref+0xc40:   	fxor	%f28, %f26, %f28
	.word	0xa204c008	! t0_kref+0xc44:   	add	%l3, %o0, %l1
	.word	0xabb48c68	! t0_kref+0xc48:   	fnors	%f18, %f8, %f21
	.word	0xe240a020	! t0_kref+0xc4c:   	ldsw	[%g2 + 0x20], %l1
	.word	0xd0200018	! t0_kref+0xc50:   	st	%o0, [%g0 + %i0]
	.word	0x34480004	! t0_kref+0xc54:   	bg,a,pt	%icc, _kref+0xc64
	.word	0xb5a2094a	! t0_kref+0xc58:   	fmuld	%f8, %f10, %f26
	.word	0xa2a6801a	! t0_kref+0xc5c:   	subcc	%i2, %i2, %l1
	.word	0xa2458010	! t0_kref+0xc60:   	addc	%l6, %l0, %l1
	.word	0x37480001	! t0_kref+0xc64:   	fbge,a,pt	%fcc0, _kref+0xc68
	.word	0xa232001b	! t0_kref+0xc68:   	orn	%o0, %i3, %l1
	.word	0xa30c6f1e	! t0_kref+0xc6c:   	tsubcc	%l1, 0xf1e, %l1
	.word	0x9da00027	! t0_kref+0xc70:   	fmovs	%f7, %f14
	.word	0x2e480008	! t0_kref+0xc74:   	bvs,a,pt	%icc, _kref+0xc94
	.word	0x81850000	! t0_kref+0xc78:   	wr	%l4, %g0, %y
	.word	0xa5a2885a	! t0_kref+0xc7c:   	faddd	%f10, %f26, %f18
	.word	0xa21c6ee1	! t0_kref+0xc80:   	xor	%l1, 0xee1, %l1
	.word	0x22800001	! t0_kref+0xc84:   	be,a	_kref+0xc88
	.word	0xe296d018	! t0_kref+0xc88:   	lduha	[%i3 + %i0]0x80, %l1
	.word	0xa22c3f1a	! t0_kref+0xc8c:   	andn	%l0, -0xe6, %l1
	.word	0x95a01106	! t0_kref+0xc90:   	fxtod	%f6, %f10
	.word	0xa212e9e2	! t0_kref+0xc94:   	or	%o3, 0x9e2, %l1
	.word	0xeb060000	! t0_kref+0xc98:   	ld	[%i0], %f21
	.word	0xa2f30015	! t0_kref+0xc9c:   	udivcc	%o4, %l5, %l1
	.word	0xe42e401a	! t0_kref+0xca0:   	stb	%l2, [%i1 + %i2]
	.word	0x81820000	! t0_kref+0xca4:   	wr	%o0, %g0, %y
	.word	0x2e480008	! t0_kref+0xca8:   	bvs,a,pt	%icc, _kref+0xcc8
	.word	0xed1fbcc8	! t0_kref+0xcac:   	ldd	[%fp - 0x338], %f22
	.word	0xe81e001d	! t0_kref+0xcb0:   	ldd	[%i0 + %i5], %l4
	.word	0xe24e0000	! t0_kref+0xcb4:   	ldsb	[%i0], %l1
	.word	0xe248a038	! t0_kref+0xcb8:   	ldsb	[%g2 + 0x38], %l1
	.word	0x81dd0012	! t0_kref+0xcbc:   	flush	%l4 + %l2
	.word	0xf630a002	! t0_kref+0xcc0:   	sth	%i3, [%g2 + 2]
	.word	0xa2e4c014	! t0_kref+0xcc4:   	subccc	%l3, %l4, %l1
	.word	0xa28a4014	! t0_kref+0xcc8:   	andcc	%o1, %l4, %l1
	.word	0x8da0190c	! t0_kref+0xccc:   	fitod	%f12, %f6
	.word	0xa32d4010	! t0_kref+0xcd0:   	sll	%l5, %l0, %l1
	.word	0xa2e571b0	! t0_kref+0xcd4:   	subccc	%l5, -0xe50, %l1
	.word	0xb5a00133	! t0_kref+0xcd8:   	fabss	%f19, %f26
	.word	0x3a480002	! t0_kref+0xcdc:   	bcc,a,pt	%icc, _kref+0xce4
	.word	0xe24e3fff	! t0_kref+0xce0:   	ldsb	[%i0 - 1], %l1
	.word	0xa2730011	! t0_kref+0xce4:   	udiv	%o4, %l1, %l1
	.word	0x2f480004	! t0_kref+0xce8:   	fbu,a,pt	%fcc0, _kref+0xcf8
	.word	0xa2126fd6	! t0_kref+0xcec:   	or	%o1, 0xfd6, %l1
	.word	0xa2834017	! t0_kref+0xcf0:   	addcc	%o5, %l7, %l1
	.word	0xa286a121	! t0_kref+0xcf4:   	addcc	%i2, 0x121, %l1
	.word	0xdf00a030	! t0_kref+0xcf8:   	ld	[%g2 + 0x30], %f15
	.word	0xa5aac058	! t0_kref+0xcfc:   	fmovdge	%fcc0, %f24, %f18
	.word	0xe250a00a	! t0_kref+0xd00:   	ldsh	[%g2 + 0xa], %l1
	.word	0xada40848	! t0_kref+0xd04:   	faddd	%f16, %f8, %f22
	.word	0xdd20a038	! t0_kref+0xd08:   	st	%f14, [%g2 + 0x38]
	.word	0xa1a01094	! t0_kref+0xd0c:   	fxtos	%f20, %f16
	.word	0xd9063fe4	! t0_kref+0xd10:   	ld	[%i0 - 0x1c], %f12
	.word	0x2d800001	! t0_kref+0xd14:   	fbg,a	_kref+0xd18
	.word	0x97a000ae	! t0_kref+0xd18:   	fnegs	%f14, %f11
	.word	0xb4102012	! t0_kref+0xd1c:   	mov	0x12, %i2
	.word	0xd320a020	! t0_kref+0xd20:   	st	%f9, [%g2 + 0x20]
	.word	0x2c800003	! t0_kref+0xd24:   	bneg,a	_kref+0xd30
	.word	0xe210a002	! t0_kref+0xd28:   	lduh	[%g2 + 2], %l1
	.word	0x8da0188f	! t0_kref+0xd2c:   	fitos	%f15, %f6
	.word	0xa3b20240	! t0_kref+0xd30:   	array16	%o0, %g0, %l1
	.word	0xa2e4000d	! t0_kref+0xd34:   	subccc	%l0, %o5, %l1
	.word	0xa3b38592	! t0_kref+0xd38:   	fcmpgt32	%f14, %f18, %l1
	.word	0x99a408ca	! t0_kref+0xd3c:   	fsubd	%f16, %f10, %f12
	.word	0xa276bebd	! t0_kref+0xd40:   	udiv	%i2, -0x143, %l1
	.word	0xa3b28418	! t0_kref+0xd44:   	fcmple16	%f10, %f24, %l1
	.word	0xe1beda59	! t0_kref+0xd48:   	stda	%f16, [%i3 + %i1]0xd2
	.word	0xa2303929	! t0_kref+0xd4c:   	orn	%g0, -0x6d7, %l1
	.word	0xe2164000	! t0_kref+0xd50:   	lduh	[%i1], %l1
	.word	0x81ae0a3d	! t0_kref+0xd54:   	fcmps	%fcc0, %f24, %f29
	.word	0x8da40948	! t0_kref+0xd58:   	fmuld	%f16, %f8, %f6
	.word	0x230f5f82	! t0_kref+0xd5c:   	sethi	%hi(0x3d7e0800), %l1
	.word	0xa340c000	! t0_kref+0xd60:   	mov	%asi, %l1
	.word	0xa235000d	! t0_kref+0xd64:   	orn	%l4, %o5, %l1
	.word	0x81ab8ad8	! t0_kref+0xd68:   	fcmped	%fcc0, %f14, %f24
	.word	0x91a01906	! t0_kref+0xd6c:   	fitod	%f6, %f8
	.word	0xa334601f	! t0_kref+0xd70:   	srl	%l1, 0x1f, %l1
	.word	0x29480006	! t0_kref+0xd74:   	fbl,a,pt	%fcc0, _kref+0xd8c
	.word	0xd7067fe0	! t0_kref+0xd78:   	ld	[%i1 - 0x20], %f11
	call	0x00000d64
	.word	0xa3b50133	! t0_kref+0xd80:   	edge32n	%l4, %l3, %l1
	.word	0x2326f610	! t0_kref+0xd84:   	sethi	%hi(0x9bd84000), %l1
	.word	0xd428a03a	! t0_kref+0xd88:   	stb	%o2, [%g2 + 0x3a]
	.word	0xa3b6c035	! t0_kref+0xd8c:   	edge8n	%i3, %l5, %l1
	.word	0x8143c000	! t0_kref+0xd90:   	stbar
	.word	0xe248a038	! t0_kref+0xd94:   	ldsb	[%g2 + 0x38], %l1
	.word	0xe24e3fe2	! t0_kref+0xd98:   	ldsb	[%i0 - 0x1e], %l1
	.word	0xd220a000	! t0_kref+0xd9c:   	st	%o1, [%g2]
	.word	0xdd1fbf78	! t0_kref+0xda0:   	ldd	[%fp - 0x88], %f14
	.word	0xa2368016	! t0_kref+0xda4:   	orn	%i2, %l6, %l1
	.word	0xe030a038	! t0_kref+0xda8:   	sth	%l0, [%g2 + 0x38]
	.word	0xed06200c	! t0_kref+0xdac:   	ld	[%i0 + 0xc], %f22
	.word	0x81deed26	! t0_kref+0xdb0:   	flush	%i3 + 0xd26
	.word	0x32800003	! t0_kref+0xdb4:   	bne,a	_kref+0xdc0
	.word	0x8586edca	! t0_kref+0xdb8:   	wr	%i3, 0xdca, %ccr
	.word	0xd220a010	! t0_kref+0xdbc:   	st	%o1, [%g2 + 0x10]
	.word	0xecf81018	! t0_kref+0xdc0:   	swapa	[%g0 + %i0]0x80, %l6
	.word	0x97a018d2	! t0_kref+0xdc4:   	fdtos	%f18, %f11
	.word	0xe216401b	! t0_kref+0xdc8:   	lduh	[%i1 + %i3], %l1
	.word	0x95a48858	! t0_kref+0xdcc:   	faddd	%f18, %f24, %f10
	.word	0xa2050008	! t0_kref+0xdd0:   	add	%l4, %o0, %l1
	call	SYM(t0_subr3)
	.word	0xa2182982	! t0_kref+0xdd8:   	xor	%g0, 0x982, %l1
	.word	0x81aacaba	! t0_kref+0xddc:   	fcmpes	%fcc0, %f11, %f26
	.word	0x81580000	! t0_kref+0xde0:   	flushw
	.word	0xa33b4011	! t0_kref+0xde4:   	sra	%o5, %l1, %l1
	.word	0xa33c0015	! t0_kref+0xde8:   	sra	%l0, %l5, %l1
	.word	0xa3400000	! t0_kref+0xdec:   	mov	%y, %l1
	.word	0xd5064000	! t0_kref+0xdf0:   	ld	[%i1], %f10
	.word	0xe0680018	! t0_kref+0xdf4:   	ldstub	[%g0 + %i0], %l0
	.word	0xe208a021	! t0_kref+0xdf8:   	ldub	[%g2 + 0x21], %l1
	.word	0xe2567fea	! t0_kref+0xdfc:   	ldsh	[%i1 - 0x16], %l1
	.word	0x8da01a34	! t0_kref+0xe00:   	fstoi	%f20, %f6
	.word	0x9de3bfa0	! t0_kref+0xe04:   	save	%sp, -0x60, %sp
	.word	0xa3eec01b	! t0_kref+0xe08:   	restore	%i3, %i3, %l1
	.word	0xa25cf60c	! t0_kref+0xe0c:   	smul	%l3, -0x9f4, %l1
	.word	0x91a0190c	! t0_kref+0xe10:   	fitod	%f12, %f8
	.word	0x30800001	! t0_kref+0xe14:   	ba,a	_kref+0xe18
	.word	0xe24e8019	! t0_kref+0xe18:   	ldsb	[%i2 + %i1], %l1
	.word	0xa29d000d	! t0_kref+0xe1c:   	xorcc	%l4, %o5, %l1
	.word	0xe5067fe8	! t0_kref+0xe20:   	ld	[%i1 - 0x18], %f18
	.word	0x31480001	! t0_kref+0xe24:   	fba,a,pt	%fcc0, _kref+0xe28
	.word	0xa3b34096	! t0_kref+0xe28:   	edge16	%o5, %l6, %l1
	.word	0xcd00a020	! t0_kref+0xe2c:   	ld	[%g2 + 0x20], %f6
	.word	0xa21ac015	! t0_kref+0xe30:   	xor	%o3, %l5, %l1
	.word	0xada00150	! t0_kref+0xe34:   	fabsd	%f16, %f22
	.word	0xd86e001a	! t0_kref+0xe38:   	ldstub	[%i0 + %i2], %o4
	.word	0xa3b6c09a	! t0_kref+0xe3c:   	edge16	%i3, %i2, %l1
	.word	0xa5b30d1c	! t0_kref+0xe40:   	fandnot1	%f12, %f28, %f18
	.word	0x95b6898c	! t0_kref+0xe44:   	bshuffle	%f26, %f12, %f10
	.word	0xa284c009	! t0_kref+0xe48:   	addcc	%l3, %o1, %l1
	.word	0x3e800008	! t0_kref+0xe4c:   	bvc,a	_kref+0xe6c
	.word	0xe19e5000	! t0_kref+0xe50:   	ldda	[%i1]0x80, %f16
	.word	0xa1a0192a	! t0_kref+0xe54:   	fstod	%f10, %f16
	.word	0xa2734009	! t0_kref+0xe58:   	udiv	%o5, %o1, %l1
	.word	0xc36e7fe8	! t0_kref+0xe5c:   	prefetch	%i1 - 0x18, 1
	.word	0xa3400000	! t0_kref+0xe60:   	mov	%y, %l1
	.word	0x81aa4a2c	! t0_kref+0xe64:   	fcmps	%fcc0, %f9, %f12
	.word	0x81ae8a4c	! t0_kref+0xe68:   	fcmpd	%fcc0, %f26, %f12
	.word	0xa29cf727	! t0_kref+0xe6c:   	xorcc	%l3, -0x8d9, %l1
	.word	0xa2740012	! t0_kref+0xe70:   	udiv	%l0, %l2, %l1
	.word	0x3a800002	! t0_kref+0xe74:   	bcc,a	_kref+0xe7c
	.word	0xa3b604dc	! t0_kref+0xe78:   	fcmpne32	%f24, %f28, %l1
	.word	0xa3703fb7	! t0_kref+0xe7c:   	popc	-0x49, %l1
	.word	0xe210a012	! t0_kref+0xe80:   	lduh	[%g2 + 0x12], %l1
	.word	0xe2965000	! t0_kref+0xe84:   	lduha	[%i1]0x80, %l1
	.word	0xa1b00cec	! t0_kref+0xe88:   	fnot2s	%f12, %f16
	.word	0xa28a7cc2	! t0_kref+0xe8c:   	andcc	%o1, -0x33e, %l1
	.word	0x97b30c70	! t0_kref+0xe90:   	fnors	%f12, %f16, %f11
	.word	0xe028a001	! t0_kref+0xe94:   	stb	%l0, [%g2 + 1]
	.word	0x9db7497d	! t0_kref+0xe98:   	fpmerge	%f29, %f29, %f14
	.word	0xe2d81019	! t0_kref+0xe9c:   	ldxa	[%g0 + %i1]0x80, %l1
	.word	0xa272af0b	! t0_kref+0xea0:   	udiv	%o2, 0xf0b, %l1
	.word	0xe0300019	! t0_kref+0xea4:   	sth	%l0, [%g0 + %i1]
	.word	0x2c480001	! t0_kref+0xea8:   	bneg,a,pt	%icc, _kref+0xeac
	.word	0xa21a62bd	! t0_kref+0xeac:   	xor	%o1, 0x2bd, %l1
	.word	0x91a70d2c	! t0_kref+0xeb0:   	fsmuld	%f28, %f12, %f8
	.word	0xe630001b	! t0_kref+0xeb4:   	sth	%l3, [%g0 + %i3]
	.word	0xea26601c	! t0_kref+0xeb8:   	st	%l5, [%i1 + 0x1c]
	.word	0xf11fbf28	! t0_kref+0xebc:   	ldd	[%fp - 0xd8], %f24
	.word	0x2d480001	! t0_kref+0xec0:   	fbg,a,pt	%fcc0, _kref+0xec4
	.word	0xd11fbc68	! t0_kref+0xec4:   	ldd	[%fp - 0x398], %f8
	.word	0xa3b44200	! t0_kref+0xec8:   	array8	%l1, %g0, %l1
	.word	0x9fc00004	! t0_kref+0xecc:   	call	%g0 + %g4
	.word	0xa2344000	! t0_kref+0xed0:   	orn	%l1, %g0, %l1
	.word	0xa23431f6	! t0_kref+0xed4:   	orn	%l0, -0xe0a, %l1
	.word	0xda6e2000	! t0_kref+0xed8:   	ldstub	[%i0], %o5
	.word	0xa2d68009	! t0_kref+0xedc:   	umulcc	%i2, %o1, %l1
	.word	0x81844000	! t0_kref+0xee0:   	wr	%l1, %g0, %y
	.word	0xe89e1000	! t0_kref+0xee4:   	ldda	[%i0]0x80, %l4
	.word	0xa295c008	! t0_kref+0xee8:   	orcc	%l7, %o0, %l1
	.word	0xa2d274ef	! t0_kref+0xeec:   	umulcc	%o1, -0xb11, %l1
	sethi	%hi(2f), %o7
	.word	0xe40be334	! t0_kref+0xef4:   	ldub	[%o7 + 0x334], %l2
	.word	0xa41ca00c	! t0_kref+0xef8:   	xor	%l2, 0xc, %l2
	.word	0xe42be334	! t0_kref+0xefc:   	stb	%l2, [%o7 + 0x334]
	.word	0x81dbe334	! t0_kref+0xf00:   	flush	%o7 + 0x334
	.word	0x22800006	! t0_kref+0xf04:   	be,a	_kref+0xf1c
	.word	0xd06e8018	! t0_kref+0xf08:   	ldstub	[%i2 + %i0], %o0
	.word	0xa2e270dc	! t0_kref+0xf0c:   	subccc	%o1, -0xf24, %l1
	.word	0x81ac4a2d	! t0_kref+0xf10:   	fcmps	%fcc0, %f17, %f13
	.word	0x3c800001	! t0_kref+0xf14:   	bpos,a	_kref+0xf18
	.word	0xe5000019	! t0_kref+0xf18:   	ld	[%g0 + %i1], %f18
	.word	0xa3a0003a	! t0_kref+0xf1c:   	fmovs	%f26, %f17
	.word	0xa22b400c	! t0_kref+0xf20:   	andn	%o5, %o4, %l1
	.word	0xe3b8a040	! t0_kref+0xf24:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xe216c019	! t0_kref+0xf28:   	lduh	[%i3 + %i1], %l1
	.word	0xa9a289d4	! t0_kref+0xf2c:   	fdivd	%f10, %f20, %f20
	.word	0xe25e6000	! t0_kref+0xf30:   	ldx	[%i1], %l1
2:	.word	0x95b4091c	! t0_kref+0xf34:   	faligndata	%f16, %f28, %f10
	.word	0x81ab8aae	! t0_kref+0xf38:   	fcmpes	%fcc0, %f14, %f14
	.word	0xe2d81019	! t0_kref+0xf3c:   	ldxa	[%g0 + %i1]0x80, %l1
	.word	0xd7266010	! t0_kref+0xf40:   	st	%f11, [%i1 + 0x10]
	.word	0xa2420014	! t0_kref+0xf44:   	addc	%o0, %l4, %l1
	.word	0xb7a9802a	! t0_kref+0xf48:   	fmovsg	%fcc0, %f10, %f27
	.word	0x29480003	! t0_kref+0xf4c:   	fbl,a,pt	%fcc0, _kref+0xf58
	.word	0xa2b4801a	! t0_kref+0xf50:   	orncc	%l2, %i2, %l1
	.word	0xa274b11e	! t0_kref+0xf54:   	udiv	%l2, -0xee2, %l1
	.word	0xcd06401c	! t0_kref+0xf58:   	ld	[%i1 + %i4], %f6
	.word	0xa294e970	! t0_kref+0xf5c:   	orcc	%l3, 0x970, %l1
	.word	0x34480006	! t0_kref+0xf60:   	bg,a,pt	%icc, _kref+0xf78
	.word	0xa2b225ef	! t0_kref+0xf64:   	orncc	%o0, 0x5ef, %l1
	.word	0xb9a0054a	! t0_kref+0xf68:   	fsqrtd	%f10, %f28
	.word	0xa1a018d8	! t0_kref+0xf6c:   	fdtos	%f24, %f16
	.word	0xa2147998	! t0_kref+0xf70:   	or	%l1, -0x668, %l1
	.word	0xb5a0013b	! t0_kref+0xf74:   	fabss	%f27, %f26
	.word	0xa2950017	! t0_kref+0xf78:   	orcc	%l4, %l7, %l1
	.word	0x81a98a33	! t0_kref+0xf7c:   	fcmps	%fcc0, %f6, %f19
	.word	0xa244400d	! t0_kref+0xf80:   	addc	%l1, %o5, %l1
	.word	0xa22a8017	! t0_kref+0xf84:   	andn	%o2, %l7, %l1
	.word	0x25480006	! t0_kref+0xf88:   	fblg,a,pt	%fcc0, _kref+0xfa0
	.word	0x99a609ba	! t0_kref+0xf8c:   	fdivs	%f24, %f26, %f12
	.word	0xe240a018	! t0_kref+0xf90:   	ldsw	[%g2 + 0x18], %l1
	.word	0xe20e3ffb	! t0_kref+0xf94:   	ldub	[%i0 - 5], %l1
	.word	0xc12e3fe4	! t0_kref+0xf98:   	st	%fsr, [%i0 - 0x1c]
	.word	0xa2aa366d	! t0_kref+0xf9c:   	andncc	%o0, -0x993, %l1
	.word	0xa2a4e9a2	! t0_kref+0xfa0:   	subcc	%l3, 0x9a2, %l1
	.word	0xb3b007ac	! t0_kref+0xfa4:   	fpackfix	%f12, %f25
	.word	0xe24e3fef	! t0_kref+0xfa8:   	ldsb	[%i0 - 0x11], %l1
	.word	0xe210a02a	! t0_kref+0xfac:   	lduh	[%g2 + 0x2a], %l1
	.word	0x81aa8ac6	! t0_kref+0xfb0:   	fcmped	%fcc0, %f10, %f6
	.word	0xb7a288ac	! t0_kref+0xfb4:   	fsubs	%f10, %f12, %f27
	.word	0xa3400000	! t0_kref+0xfb8:   	mov	%y, %l1
	.word	0x9ba34928	! t0_kref+0xfbc:   	fmuls	%f13, %f8, %f13
	.word	0xda28a029	! t0_kref+0xfc0:   	stb	%o5, [%g2 + 0x29]
	.word	0xe250a032	! t0_kref+0xfc4:   	ldsh	[%g2 + 0x32], %l1
	.word	0xb1a0192f	! t0_kref+0xfc8:   	fstod	%f15, %f24
	.word	0xb9b30a96	! t0_kref+0xfcc:   	fpsub16	%f12, %f22, %f28
	.word	0x81850000	! t0_kref+0xfd0:   	wr	%l4, %g0, %y
	.word	0x81df6334	! t0_kref+0xfd4:   	flush	%i5 + 0x334
	.word	0xa2f24000	! t0_kref+0xfd8:   	udivcc	%o1, %g0, %l1
	.word	0xa21dc009	! t0_kref+0xfdc:   	xor	%l7, %o1, %l1
	.word	0x86102012	! t0_kref+0xfe0:   	mov	0x12, %g3
	.word	0x86a0e001	! t0_kref+0xfe4:   	subcc	%g3, 1, %g3
	.word	0x2280000b	! t0_kref+0xfe8:   	be,a	_kref+0x1014
	.word	0xe2965000	! t0_kref+0xfec:   	lduha	[%i1]0x80, %l1
	.word	0xa2146e26	! t0_kref+0xff0:   	or	%l1, 0xe26, %l1
	.word	0x2d4ffffc	! t0_kref+0xff4:   	fbg,a,pt	%fcc0, _kref+0xfe4
	.word	0xa1b009a6	! t0_kref+0xff8:   	fexpand	%f6, %f16
	.word	0x81dbe986	! t0_kref+0xffc:   	flush	%o7 + 0x986
	.word	0x8143c000	! t0_kref+0x1000:   	stbar
	.word	0xa3b6044a	! t0_kref+0x1004:   	fcmpne16	%f24, %f10, %l1
	.word	0x9fa508ab	! t0_kref+0x1008:   	fsubs	%f20, %f11, %f15
	.word	0xda20a000	! t0_kref+0x100c:   	st	%o5, [%g2]
	.word	0xa32cc016	! t0_kref+0x1010:   	sll	%l3, %l6, %l1
	.word	0x8143c000	! t0_kref+0x1014:   	stbar
	.word	0xa3b280ed	! t0_kref+0x1018:   	edge16ln	%o2, %o5, %l1
	.word	0xa2b24000	! t0_kref+0x101c:   	orncc	%o1, %g0, %l1
	.word	0x8143c000	! t0_kref+0x1020:   	stbar
	.word	0xee28a029	! t0_kref+0x1024:   	stb	%l7, [%g2 + 0x29]
	.word	0xe20e4000	! t0_kref+0x1028:   	ldub	[%i1], %l1
	.word	0xa5b5cc6d	! t0_kref+0x102c:   	fnors	%f23, %f13, %f18
	.word	0xb7b54d60	! t0_kref+0x1030:   	fnot1s	%f21, %f27
	.word	0xa21d801b	! t0_kref+0x1034:   	xor	%l6, %i3, %l1
	.word	0xb9aa4048	! t0_kref+0x1038:   	fmovde	%fcc0, %f8, %f28
	.word	0xb9a0004e	! t0_kref+0x103c:   	fmovd	%f14, %f28
	.word	0xa2db2f76	! t0_kref+0x1040:   	smulcc	%o4, 0xf76, %l1
	.word	0xa3a3c8ac	! t0_kref+0x1044:   	fsubs	%f15, %f12, %f17
	.word	0x230ca65f	! t0_kref+0x1048:   	sethi	%hi(0x32997c00), %l1
	.word	0xa25a000d	! t0_kref+0x104c:   	smul	%o0, %o5, %l1
	.word	0xa2728015	! t0_kref+0x1050:   	udiv	%o2, %l5, %l1
	.word	0xa1a01036	! t0_kref+0x1054:   	fstox	%f22, %f16
	.word	0xf1be501d	! t0_kref+0x1058:   	stda	%f24, [%i1 + %i5]0x80
	.word	0x28480001	! t0_kref+0x105c:   	bleu,a,pt	%icc, _kref+0x1060
	.word	0xd520a038	! t0_kref+0x1060:   	st	%f10, [%g2 + 0x38]
	.word	0xe020a030	! t0_kref+0x1064:   	st	%l0, [%g2 + 0x30]
	.word	0xcd1e0000	! t0_kref+0x1068:   	ldd	[%i0], %f6
	.word	0xa284e0aa	! t0_kref+0x106c:   	addcc	%l3, 0xaa, %l1
	.word	0xa274b5d7	! t0_kref+0x1070:   	udiv	%l2, -0xa29, %l1
	.word	0xa294c014	! t0_kref+0x1074:   	orcc	%l3, %l4, %l1
	.word	0xe296d019	! t0_kref+0x1078:   	lduha	[%i3 + %i1]0x80, %l1
	.word	0x8da30846	! t0_kref+0x107c:   	faddd	%f12, %f6, %f6
	.word	0xa216e97d	! t0_kref+0x1080:   	or	%i3, 0x97d, %l1
	.word	0xafb3cf66	! t0_kref+0x1084:   	fornot1s	%f15, %f6, %f23
	.word	0xa2f20012	! t0_kref+0x1088:   	udivcc	%o0, %l2, %l1
	.word	0xa210000b	! t0_kref+0x108c:   	mov	%o3, %l1
	.word	0xb7b74e6e	! t0_kref+0x1090:   	fxnors	%f29, %f14, %f27
	.word	0xa3400000	! t0_kref+0x1094:   	mov	%y, %l1
	.word	0xe220a020	! t0_kref+0x1098:   	st	%l1, [%g2 + 0x20]
	.word	0xd620a010	! t0_kref+0x109c:   	st	%o3, [%g2 + 0x10]
	.word	0x8143c000	! t0_kref+0x10a0:   	stbar
	.word	0xe2c71018	! t0_kref+0x10a4:   	ldswa	[%i4 + %i0]0x80, %l1
	.word	0xe2000018	! t0_kref+0x10a8:   	ld	[%g0 + %i0], %l1
	.word	0xb7b50e3d	! t0_kref+0x10ac:   	fands	%f20, %f29, %f27
	.word	0xa25d6e62	! t0_kref+0x10b0:   	smul	%l5, 0xe62, %l1
	.word	0x9db3ca32	! t0_kref+0x10b4:   	fpadd16s	%f15, %f18, %f14
	.word	0x36480008	! t0_kref+0x10b8:   	bge,a,pt	%icc, _kref+0x10d8
	.word	0x91a44930	! t0_kref+0x10bc:   	fmuls	%f17, %f16, %f8
	.word	0xe41e2008	! t0_kref+0x10c0:   	ldd	[%i0 + 8], %l2
	.word	0xa286c01a	! t0_kref+0x10c4:   	addcc	%i3, %i2, %l1
	.word	0x38800007	! t0_kref+0x10c8:   	bgu,a	_kref+0x10e4
	.word	0xd9b81018	! t0_kref+0x10cc:   	stda	%f12, [%g0 + %i0]0x80
	.word	0xcd1fbec0	! t0_kref+0x10d0:   	ldd	[%fp - 0x140], %f6
	.word	0x9fa70826	! t0_kref+0x10d4:   	fadds	%f28, %f6, %f15
	.word	0xa2e2612e	! t0_kref+0x10d8:   	subccc	%o1, 0x12e, %l1
	.word	0xa22e8014	! t0_kref+0x10dc:   	andn	%i2, %l4, %l1
	.word	0xe028a033	! t0_kref+0x10e0:   	stb	%l0, [%g2 + 0x33]
	call	SYM(t0_subr3)
	.word	0xa31831b9	! t0_kref+0x10e8:   	tsubcctv	%g0, -0xe47, %l1
	.word	0xe20e4000	! t0_kref+0x10ec:   	ldub	[%i1], %l1
	.word	0xa1a489c8	! t0_kref+0x10f0:   	fdivd	%f18, %f8, %f16
	.word	0xb5a00554	! t0_kref+0x10f4:   	fsqrtd	%f20, %f26
	.word	0xe2580018	! t0_kref+0x10f8:   	ldx	[%g0 + %i0], %l1
	.word	0x81ad8a48	! t0_kref+0x10fc:   	fcmpd	%fcc0, %f22, %f8
	.word	0xa33cc01b	! t0_kref+0x1100:   	sra	%l3, %i3, %l1
	.word	0xa9a509da	! t0_kref+0x1104:   	fdivd	%f20, %f26, %f20
	.word	0xa3b20506	! t0_kref+0x1108:   	fcmpgt16	%f8, %f6, %l1
	.word	0xe25e2008	! t0_kref+0x110c:   	ldx	[%i0 + 8], %l1
	.word	0xa2757133	! t0_kref+0x1110:   	udiv	%l5, -0xecd, %l1
	.word	0xa20c8010	! t0_kref+0x1114:   	and	%l2, %l0, %l1
	.word	0xda6e8019	! t0_kref+0x1118:   	ldstub	[%i2 + %i1], %o5
	.word	0x2318f56d	! t0_kref+0x111c:   	sethi	%hi(0x63d5b400), %l1
	.word	0xf13f4018	! t0_kref+0x1120:   	std	%f24, [%i5 + %i0]
	.word	0xa2e6aa25	! t0_kref+0x1124:   	subccc	%i2, 0xa25, %l1
	.word	0xa23d0012	! t0_kref+0x1128:   	xnor	%l4, %l2, %l1
	.word	0xe41e6018	! t0_kref+0x112c:   	ldd	[%i1 + 0x18], %l2
	.word	0xa3b38586	! t0_kref+0x1130:   	fcmpgt32	%f14, %f6, %l1
	.word	0xa232001b	! t0_kref+0x1134:   	orn	%o0, %i3, %l1
	.word	0xa283705f	! t0_kref+0x1138:   	addcc	%o5, -0xfa1, %l1
	.word	0xca10001b	! t0_kref+0x113c:   	lduh	[%g0 + %i3], %g5
	.word	0xa2730017	! t0_kref+0x1140:   	udiv	%o4, %l7, %l1
	.word	0x22800007	! t0_kref+0x1144:   	be,a	_kref+0x1160
	.word	0xa25a400b	! t0_kref+0x1148:   	smul	%o1, %o3, %l1
	.word	0xd620a028	! t0_kref+0x114c:   	st	%o3, [%g2 + 0x28]
	.word	0xa3b204d0	! t0_kref+0x1150:   	fcmpne32	%f8, %f16, %l1
	.word	0xd420a010	! t0_kref+0x1154:   	st	%o2, [%g2 + 0x10]
	.word	0xa29dc00a	! t0_kref+0x1158:   	xorcc	%l7, %o2, %l1
	.word	0xa29df56d	! t0_kref+0x115c:   	xorcc	%l7, -0xa93, %l1
	.word	0xe81e7ff8	! t0_kref+0x1160:   	ldd	[%i1 - 8], %l4
	.word	0xe256201e	! t0_kref+0x1164:   	ldsh	[%i0 + 0x1e], %l1
	.word	0x95b30d40	! t0_kref+0x1168:   	fnot1	%f12, %f10
	.word	0xcd070019	! t0_kref+0x116c:   	ld	[%i4 + %i1], %f6
	.word	0xe2564000	! t0_kref+0x1170:   	ldsh	[%i1], %l1
	.word	0x001fffff	! t0_kref+0x1174:   	illtrap	0x1fffff
	.word	0x9fc10000	! t0_kref+0x1178:   	call	%g4
	.word	0xe256c019	! t0_kref+0x117c:   	ldsh	[%i3 + %i1], %l1
	.word	0xe2563ffe	! t0_kref+0x1180:   	ldsh	[%i0 - 2], %l1
	.word	0x38800003	! t0_kref+0x1184:   	bgu,a	_kref+0x1190
	.word	0x8fb44c6b	! t0_kref+0x1188:   	fnors	%f17, %f11, %f7
	.word	0x37480002	! t0_kref+0x118c:   	fbge,a,pt	%fcc0, _kref+0x1194
	.word	0x233a2441	! t0_kref+0x1190:   	sethi	%hi(0xe8910400), %l1
	.word	0xe7060000	! t0_kref+0x1194:   	ld	[%i0], %f19
	.word	0xe256001b	! t0_kref+0x1198:   	ldsh	[%i0 + %i3], %l1
	.word	0xe256601e	! t0_kref+0x119c:   	ldsh	[%i1 + 0x1e], %l1
	.word	0xf9ee101b	! t0_kref+0x11a0:   	prefetcha	%i0 + %i3, 28
	.word	0xa22b24e2	! t0_kref+0x11a4:   	andn	%o4, 0x4e2, %l1
	.word	0xa335a00c	! t0_kref+0x11a8:   	srl	%l6, 0xc, %l1
	.word	0x81ab8abc	! t0_kref+0x11ac:   	fcmpes	%fcc0, %f14, %f28
	.word	0xafb44cb6	! t0_kref+0x11b0:   	fandnot2s	%f17, %f22, %f23
	.word	0xf428a023	! t0_kref+0x11b4:   	stb	%i2, [%g2 + 0x23]
	.word	0xafa448aa	! t0_kref+0x11b8:   	fsubs	%f17, %f10, %f23
	.word	0xa2f435e4	! t0_kref+0x11bc:   	udivcc	%l0, -0xa1c, %l1
	.word	0x36480004	! t0_kref+0x11c0:   	bge,a,pt	%icc, _kref+0x11d0
	.word	0x81dd4018	! t0_kref+0x11c4:   	flush	%l5 + %i0
	.word	0x38480002	! t0_kref+0x11c8:   	bgu,a,pt	%icc, _kref+0x11d0
	.word	0x8da018ca	! t0_kref+0x11cc:   	fdtos	%f10, %f6
	.word	0xa2148012	! t0_kref+0x11d0:   	or	%l2, %l2, %l1
	.word	0x38800002	! t0_kref+0x11d4:   	bgu,a	_kref+0x11dc
	.word	0xed1fbf10	! t0_kref+0x11d8:   	ldd	[%fp - 0xf0], %f22
	.word	0xb7a018c6	! t0_kref+0x11dc:   	fdtos	%f6, %f27
	.word	0xb5a01a46	! t0_kref+0x11e0:   	fdtoi	%f6, %f26
	.word	0xe24e8019	! t0_kref+0x11e4:   	ldsb	[%i2 + %i1], %l1
	.word	0xada408ce	! t0_kref+0x11e8:   	fsubd	%f16, %f14, %f22
	.word	0xafa01a3a	! t0_kref+0x11ec:   	fstoi	%f26, %f23
	.word	0xa2e268f6	! t0_kref+0x11f0:   	subccc	%o1, 0x8f6, %l1
	.word	0xa25e8000	! t0_kref+0x11f4:   	smul	%i2, %g0, %l1
	.word	0xa33d8012	! t0_kref+0x11f8:   	sra	%l6, %l2, %l1
	.word	0xe25e0000	! t0_kref+0x11fc:   	ldx	[%i0], %l1
	.word	0xc5ee5017	! t0_kref+0x1200:   	prefetcha	%i1 + %l7, 2
	.word	0x8fa6892d	! t0_kref+0x1204:   	fmuls	%f26, %f13, %f7
	.word	0xe0be101d	! t0_kref+0x1208:   	stda	%l0, [%i0 + %i5]0x80
	.word	0xa2454014	! t0_kref+0x120c:   	addc	%l5, %l4, %l1
	.word	0xa1b20e80	! t0_kref+0x1210:   	fsrc1	%f8, %f16
	.word	0xa276b3f3	! t0_kref+0x1214:   	udiv	%i2, -0xc0d, %l1
	.word	0xa2e576be	! t0_kref+0x1218:   	subccc	%l5, -0x942, %l1
	.word	0x2d480007	! t0_kref+0x121c:   	fbg,a,pt	%fcc0, _kref+0x1238
	.word	0xf93e4000	! t0_kref+0x1220:   	std	%f28, [%i1]
	.word	0x31480002	! t0_kref+0x1224:   	fba,a,pt	%fcc0, _kref+0x122c
	.word	0xa282c016	! t0_kref+0x1228:   	addcc	%o3, %l6, %l1
	.word	0xe3ee101d	! t0_kref+0x122c:   	prefetcha	%i0 + %i5, 17
	.word	0xa2d5eb0b	! t0_kref+0x1230:   	umulcc	%l7, 0xb0b, %l1
	.word	0xe7264000	! t0_kref+0x1234:   	st	%f19, [%i1]
	.word	0xe24e3fea	! t0_kref+0x1238:   	ldsb	[%i0 - 0x16], %l1
	.word	0xa5a509d4	! t0_kref+0x123c:   	fdivd	%f20, %f20, %f18
	.word	0x81acca32	! t0_kref+0x1240:   	fcmps	%fcc0, %f19, %f18
	.word	0xa25d27a1	! t0_kref+0x1244:   	smul	%l4, 0x7a1, %l1
	.word	0x2e480002	! t0_kref+0x1248:   	bvs,a,pt	%icc, _kref+0x1250
	.word	0xe208a003	! t0_kref+0x124c:   	ldub	[%g2 + 3], %l1
	.word	0xe42e4000	! t0_kref+0x1250:   	stb	%l2, [%i1]
	.word	0xe20e401a	! t0_kref+0x1254:   	ldub	[%i1 + %i2], %l1
	.word	0xbbab003b	! t0_kref+0x1258:   	fmovsuge	%fcc0, %f27, %f29
	.word	0xe248a002	! t0_kref+0x125c:   	ldsb	[%g2 + 2], %l1
	.word	0xa22efeb2	! t0_kref+0x1260:   	andn	%i3, -0x14e, %l1
	.word	0x81af0a4a	! t0_kref+0x1264:   	fcmpd	%fcc0, %f28, %f10
	.word	0x9fa00135	! t0_kref+0x1268:   	fabss	%f21, %f15
	.word	0x81ae0a2a	! t0_kref+0x126c:   	fcmps	%fcc0, %f24, %f10
	.word	0xe210a038	! t0_kref+0x1270:   	lduh	[%g2 + 0x38], %l1
	.word	0xc12e001c	! t0_kref+0x1274:   	st	%fsr, [%i0 + %i4]
	.word	0xa3b184c6	! t0_kref+0x1278:   	fcmpne32	%f6, %f6, %l1
	.word	0x86102017	! t0_kref+0x127c:   	mov	0x17, %g3
	.word	0x86a0e001	! t0_kref+0x1280:   	subcc	%g3, 1, %g3
	.word	0x22800006	! t0_kref+0x1284:   	be,a	_kref+0x129c
	.word	0x91a3885a	! t0_kref+0x1288:   	faddd	%f14, %f26, %f8
	.word	0x214ffffd	! t0_kref+0x128c:   	fbn,a,pt	%fcc0, _kref+0x1280
	.word	0xb7a000bd	! t0_kref+0x1290:   	fnegs	%f29, %f27
	.word	0xeff61012	! t0_kref+0x1294:   	casxa	[%i0]0x80, %l2, %l7
	.word	0x81aa0a3c	! t0_kref+0x1298:   	fcmps	%fcc0, %f8, %f28
	.word	0x28480006	! t0_kref+0x129c:   	bleu,a,pt	%icc, _kref+0x12b4
	.word	0xa28268ce	! t0_kref+0x12a0:   	addcc	%o1, 0x8ce, %l1
	.word	0x95a01916	! t0_kref+0x12a4:   	fitod	%f22, %f10
	.word	0xe2801018	! t0_kref+0x12a8:   	lda	[%g0 + %i0]0x80, %l1
	.word	0xdd9f5018	! t0_kref+0x12ac:   	ldda	[%i5 + %i0]0x80, %f14
	call	SYM(t0_subr3)
	.word	0xa3b6041a	! t0_kref+0x12b4:   	fcmple16	%f24, %f26, %l1
	.word	0xe428a000	! t0_kref+0x12b8:   	stb	%l2, [%g2]
	.word	0xa1b40f94	! t0_kref+0x12bc:   	for	%f16, %f20, %f16
	.word	0x81acca33	! t0_kref+0x12c0:   	fcmps	%fcc0, %f19, %f19
	.word	0xe250a02a	! t0_kref+0x12c4:   	ldsh	[%g2 + 0x2a], %l1
	.word	0xb5a708d8	! t0_kref+0x12c8:   	fsubd	%f28, %f24, %f26
	.word	0xa2a28008	! t0_kref+0x12cc:   	subcc	%o2, %o0, %l1
	.word	0x33480004	! t0_kref+0x12d0:   	fbe,a,pt	%fcc0, _kref+0x12e0
	.word	0x81858000	! t0_kref+0x12d4:   	wr	%l6, %g0, %y
	.word	0xadb18e2a	! t0_kref+0x12d8:   	fands	%f6, %f10, %f22
	.word	0xcf070018	! t0_kref+0x12dc:   	ld	[%i4 + %i0], %f7
	.word	0x231e7c4f	! t0_kref+0x12e0:   	sethi	%hi(0x79f13c00), %l1
	.word	0xefe65012	! t0_kref+0x12e4:   	casa	[%i1]0x80, %l2, %l7
	.word	0x81ad8a4a	! t0_kref+0x12e8:   	fcmpd	%fcc0, %f22, %f10
	.word	0xee20a010	! t0_kref+0x12ec:   	st	%l7, [%g2 + 0x10]
	.word	0xb9a00031	! t0_kref+0x12f0:   	fmovs	%f17, %f28
	.word	0x81de4005	! t0_kref+0x12f4:   	flush	%i1 + %g5
	.word	0xa32c8015	! t0_kref+0x12f8:   	sll	%l2, %l5, %l1
	.word	0xe030a028	! t0_kref+0x12fc:   	sth	%l0, [%g2 + 0x28]
	.word	0x9db38c46	! t0_kref+0x1300:   	fnor	%f14, %f6, %f14
	.word	0xa7a0188f	! t0_kref+0x1304:   	fitos	%f15, %f19
	.word	0x26800008	! t0_kref+0x1308:   	bl,a	_kref+0x1328
	.word	0xa3b58348	! t0_kref+0x130c:   	alignaddrl	%l6, %o0, %l1
	.word	0x3e480005	! t0_kref+0x1310:   	bvc,a,pt	%icc, _kref+0x1324
	.word	0xa235fb68	! t0_kref+0x1314:   	orn	%l7, -0x498, %l1
	.word	0xd468a012	! t0_kref+0x1318:   	ldstub	[%g2 + 0x12], %o2
	.word	0xe250a030	! t0_kref+0x131c:   	ldsh	[%g2 + 0x30], %l1
	.word	0x95b58f71	! t0_kref+0x1320:   	fornot1s	%f22, %f17, %f10
	.word	0xe2500018	! t0_kref+0x1324:   	ldsh	[%g0 + %i0], %l1
	.word	0xe9ee501d	! t0_kref+0x1328:   	prefetcha	%i1 + %i5, 20
	.word	0xa28a2dbe	! t0_kref+0x132c:   	andcc	%o0, 0xdbe, %l1
	.word	0xe20e601d	! t0_kref+0x1330:   	ldub	[%i1 + 0x1d], %l1
	.word	0xcdbe1000	! t0_kref+0x1334:   	stda	%f6, [%i0]0x80
	.word	0xa2880017	! t0_kref+0x1338:   	andcc	%g0, %l7, %l1
	.word	0x99b28752	! t0_kref+0x133c:   	fpack32	%f10, %f18, %f12
	.word	0x8143c000	! t0_kref+0x1340:   	stbar
	.word	0xb7b70abc	! t0_kref+0x1344:   	fpsub16s	%f28, %f28, %f27
	.word	0x81ac8a2c	! t0_kref+0x1348:   	fcmps	%fcc0, %f18, %f12
	.word	0xd230a000	! t0_kref+0x134c:   	sth	%o1, [%g2]
	.word	0xb3a0052b	! t0_kref+0x1350:   	fsqrts	%f11, %f25
	.word	0xada0193b	! t0_kref+0x1354:   	fstod	%f27, %f22
	.word	0x31800006	! t0_kref+0x1358:   	fba,a	_kref+0x1370
	.word	0x97a01a50	! t0_kref+0x135c:   	fdtoi	%f16, %f11
	.word	0x8143c000	! t0_kref+0x1360:   	stbar
	.word	0x8fb1cd60	! t0_kref+0x1364:   	fnot1s	%f7, %f7
	.word	0xb1a01936	! t0_kref+0x1368:   	fstod	%f22, %f24
	.word	0xcd20a030	! t0_kref+0x136c:   	st	%f6, [%g2 + 0x30]
	.word	0xa205ffaa	! t0_kref+0x1370:   	add	%l7, -0x56, %l1
	.word	0xe7f6500c	! t0_kref+0x1374:   	casxa	[%i1]0x80, %o4, %l3
	.word	0x8da00158	! t0_kref+0x1378:   	fabsd	%f24, %f6
	.word	0xa3b484da	! t0_kref+0x137c:   	fcmpne32	%f18, %f26, %l1
	.word	0xa3b2c200	! t0_kref+0x1380:   	array8	%o3, %g0, %l1
	.word	0xd5270019	! t0_kref+0x1384:   	st	%f10, [%i4 + %i1]
	.word	0xc12e401c	! t0_kref+0x1388:   	st	%fsr, [%i1 + %i4]
	.word	0xa234c012	! t0_kref+0x138c:   	orn	%l3, %l2, %l1
	.word	0xa29d4011	! t0_kref+0x1390:   	xorcc	%l5, %l1, %l1
	.word	0xe81e4000	! t0_kref+0x1394:   	ldd	[%i1], %l4
	.word	0x9da609cc	! t0_kref+0x1398:   	fdivd	%f24, %f12, %f14
	.word	0x99b58c96	! t0_kref+0x139c:   	fandnot2	%f22, %f22, %f12
	.word	0x34800007	! t0_kref+0x13a0:   	bg,a	_kref+0x13bc
	.word	0xe2901019	! t0_kref+0x13a4:   	lduha	[%g0 + %i1]0x80, %l1
	call	SYM(t0_subr1)
	.word	0xe2463fec	! t0_kref+0x13ac:   	ldsw	[%i0 - 0x14], %l1
	.word	0xa2022ab0	! t0_kref+0x13b0:   	add	%o0, 0xab0, %l1
	.word	0x9fc10000	! t0_kref+0x13b4:   	call	%g4
	.word	0xf520a018	! t0_kref+0x13b8:   	st	%f26, [%g2 + 0x18]
	.word	0x81ae4ab6	! t0_kref+0x13bc:   	fcmpes	%fcc0, %f25, %f22
	.word	0xe81e001d	! t0_kref+0x13c0:   	ldd	[%i0 + %i5], %l4
	.word	0xa1a00036	! t0_kref+0x13c4:   	fmovs	%f22, %f16
	.word	0x36480006	! t0_kref+0x13c8:   	bge,a,pt	%icc, _kref+0x13e0
	.word	0xe2480019	! t0_kref+0x13cc:   	ldsb	[%g0 + %i1], %l1
	.word	0x2f480006	! t0_kref+0x13d0:   	fbu,a,pt	%fcc0, _kref+0x13e8
	.word	0x91a70d2c	! t0_kref+0x13d4:   	fsmuld	%f28, %f12, %f8
	.word	0xa2c34009	! t0_kref+0x13d8:   	addccc	%o5, %o1, %l1
	.word	0xa29d8016	! t0_kref+0x13dc:   	xorcc	%l6, %l6, %l1
	.word	0xa29c4012	! t0_kref+0x13e0:   	xorcc	%l1, %l2, %l1
	.word	0x8fa01886	! t0_kref+0x13e4:   	fitos	%f6, %f7
	.word	0xe2163fec	! t0_kref+0x13e8:   	lduh	[%i0 - 0x14], %l1
	.word	0x3c800002	! t0_kref+0x13ec:   	bpos,a	_kref+0x13f4
	.word	0x81848000	! t0_kref+0x13f0:   	wr	%l2, %g0, %y
	.word	0xa2b430e0	! t0_kref+0x13f4:   	orncc	%l0, -0xf20, %l1
	.word	0xe250a01a	! t0_kref+0x13f8:   	ldsh	[%g2 + 0x1a], %l1
	.word	0xa21cc010	! t0_kref+0x13fc:   	xor	%l3, %l0, %l1
	.word	0xda20a018	! t0_kref+0x1400:   	st	%o5, [%g2 + 0x18]
	.word	0xa3180014	! t0_kref+0x1404:   	tsubcctv	%g0, %l4, %l1
	.word	0x81af0a56	! t0_kref+0x1408:   	fcmpd	%fcc0, %f28, %f22
	.word	0x9da508ce	! t0_kref+0x140c:   	fsubd	%f20, %f14, %f14
	.word	0x26800008	! t0_kref+0x1410:   	bl,a	_kref+0x1430
	.word	0xa22a8014	! t0_kref+0x1414:   	andn	%o2, %l4, %l1
	.word	0xe420a000	! t0_kref+0x1418:   	st	%l2, [%g2]
	.word	0xb9b18da8	! t0_kref+0x141c:   	fxors	%f6, %f8, %f28
	.word	0xa3b50416	! t0_kref+0x1420:   	fcmple16	%f20, %f22, %l1
	.word	0xe2d81018	! t0_kref+0x1424:   	ldxa	[%g0 + %i0]0x80, %l1
	.word	0x3e800005	! t0_kref+0x1428:   	bvc,a	_kref+0x143c
	.word	0xa3a389a9	! t0_kref+0x142c:   	fdivs	%f14, %f9, %f17
	.word	0xa3418000	! t0_kref+0x1430:   	mov	%fprs, %l1
	.word	0xa274c000	! t0_kref+0x1434:   	udiv	%l3, %g0, %l1
	.word	0xa1a38932	! t0_kref+0x1438:   	fmuls	%f14, %f18, %f16
	.word	0xa2f6c00d	! t0_kref+0x143c:   	udivcc	%i3, %o5, %l1
	.word	0xe2566012	! t0_kref+0x1440:   	ldsh	[%i1 + 0x12], %l1
	.word	0xe41e6000	! t0_kref+0x1444:   	ldd	[%i1], %l2
	.word	0xea20a008	! t0_kref+0x1448:   	st	%l5, [%g2 + 8]
	.word	0xe4bf5018	! t0_kref+0x144c:   	stda	%l2, [%i5 + %i0]0x80
	.word	0xa5a0191b	! t0_kref+0x1450:   	fitod	%f27, %f18
	.word	0xa1b6c729	! t0_kref+0x1454:   	fmuld8ulx16	%f27, %f9, %f16
	.word	0x34800003	! t0_kref+0x1458:   	bg,a	_kref+0x1464
	.word	0xdf000019	! t0_kref+0x145c:   	ld	[%g0 + %i1], %f15
	.word	0xa20ae357	! t0_kref+0x1460:   	and	%o3, 0x357, %l1
	.word	0xee366004	! t0_kref+0x1464:   	sth	%l7, [%i1 + 4]
	.word	0xb3a00027	! t0_kref+0x1468:   	fmovs	%f7, %f25
	.word	0xadb3070e	! t0_kref+0x146c:   	fmuld8sux16	%f12, %f14, %f22
	.word	0xa2da0009	! t0_kref+0x1470:   	smulcc	%o0, %o1, %l1
	.word	0xb5b00f08	! t0_kref+0x1474:   	fsrc2	%f8, %f26
	.word	0xada01892	! t0_kref+0x1478:   	fitos	%f18, %f22
	.word	0x81ad8a4e	! t0_kref+0x147c:   	fcmpd	%fcc0, %f22, %f14
	.word	0xe2564000	! t0_kref+0x1480:   	ldsh	[%i1], %l1
	.word	0x81850000	! t0_kref+0x1484:   	wr	%l4, %g0, %y
	.word	0xa5a389ca	! t0_kref+0x1488:   	fdivd	%f14, %f10, %f18
	.word	0xa27b2625	! t0_kref+0x148c:   	sdiv	%o4, 0x625, %l1
	.word	0xa9a5094e	! t0_kref+0x1490:   	fmuld	%f20, %f14, %f20
	.word	0x2d480001	! t0_kref+0x1494:   	fbg,a,pt	%fcc0, _kref+0x1498
	.word	0xa28db129	! t0_kref+0x1498:   	andcc	%l6, -0xed7, %l1
	.word	0x27480005	! t0_kref+0x149c:   	fbul,a,pt	%fcc0, _kref+0x14b0
	.word	0xb9b00cd2	! t0_kref+0x14a0:   	fnot2	%f18, %f28
	.word	0x81ad0a50	! t0_kref+0x14a4:   	fcmpd	%fcc0, %f20, %f16
	.word	0x81ab8a56	! t0_kref+0x14a8:   	fcmpd	%fcc0, %f14, %f22
	.word	0x81ac0a54	! t0_kref+0x14ac:   	fcmpd	%fcc0, %f16, %f20
	.word	0xeeee501a	! t0_kref+0x14b0:   	ldstuba	[%i1 + %i2]0x80, %l7
	.word	0x24480003	! t0_kref+0x14b4:   	ble,a,pt	%icc, _kref+0x14c0
	.word	0xa3220016	! t0_kref+0x14b8:   	mulscc	%o0, %l6, %l1
	.word	0x231911f6	! t0_kref+0x14bc:   	sethi	%hi(0x6447d800), %l1
!	.word	0x3a4d32ce	! t0_kref+0x14c0:   	bcc,a,pt	%icc, SYM(t0_subr1)
	   	bcc,a,pt	%icc, SYM(t0_subr1)
	.word	0x9f414000	! t0_kref+0x14c4:   	mov	%pc, %o7
	.word	0xe830a012	! t0_kref+0x14c8:   	sth	%l4, [%g2 + 0x12]
	.word	0xa21d800c	! t0_kref+0x14cc:   	xor	%l6, %o4, %l1
	.word	0xa5a38d2a	! t0_kref+0x14d0:   	fsmuld	%f14, %f10, %f18
	.word	0x95b00fc0	! t0_kref+0x14d4:   	fone	%f10
	.word	0x3a800001	! t0_kref+0x14d8:   	bcc,a	_kref+0x14dc
	.word	0xefe61014	! t0_kref+0x14dc:   	casa	[%i0]0x80, %l4, %l7
	.word	0x81ab8a48	! t0_kref+0x14e0:   	fcmpd	%fcc0, %f14, %f8
	.word	0xa1a2492d	! t0_kref+0x14e4:   	fmuls	%f9, %f13, %f16
	.word	0xef00a038	! t0_kref+0x14e8:   	ld	[%g2 + 0x38], %f23
	.word	0xd7f6100d	! t0_kref+0x14ec:   	casxa	[%i0]0x80, %o5, %o3
	.word	0xe5266000	! t0_kref+0x14f0:   	st	%f18, [%i1]
	.word	0xb7aa002f	! t0_kref+0x14f4:   	fmovsa	%fcc0, %f15, %f27
	.word	0xb1a40856	! t0_kref+0x14f8:   	faddd	%f16, %f22, %f24
	.word	0xf62e200f	! t0_kref+0x14fc:   	stb	%i3, [%i0 + 0xf]
	.word	0xa2aae323	! t0_kref+0x1500:   	andncc	%o3, 0x323, %l1
	.word	0xf9be5a5c	! t0_kref+0x1504:   	stda	%f28, [%i1 + %i4]0xd2
	.word	0xa9a00552	! t0_kref+0x1508:   	fsqrtd	%f18, %f20
	.word	0xe06e7ffd	! t0_kref+0x150c:   	ldstub	[%i1 - 3], %l0
	.word	0xada688a9	! t0_kref+0x1510:   	fsubs	%f26, %f9, %f22
	.word	0xa232400a	! t0_kref+0x1514:   	orn	%o1, %o2, %l1
	.word	0xa21b369d	! t0_kref+0x1518:   	xor	%o4, -0x963, %l1
	.word	0xd5000018	! t0_kref+0x151c:   	ld	[%g0 + %i0], %f10
	.word	0x9bb28db0	! t0_kref+0x1520:   	fxors	%f10, %f16, %f13
	.word	0xd320a008	! t0_kref+0x1524:   	st	%f9, [%g2 + 8]
	.word	0xe2d6d019	! t0_kref+0x1528:   	ldsha	[%i3 + %i1]0x80, %l1
	.word	0xc9ee5010	! t0_kref+0x152c:   	prefetcha	%i1 + %l0, 4
	.word	0xe210a03a	! t0_kref+0x1530:   	lduh	[%g2 + 0x3a], %l1
	.word	0xa202c00a	! t0_kref+0x1534:   	add	%o3, %o2, %l1
	.word	0xe256c019	! t0_kref+0x1538:   	ldsh	[%i3 + %i1], %l1
	.word	0xb5b00768	! t0_kref+0x153c:   	fpack16	%f8, %f26
	.word	0xe250a032	! t0_kref+0x1540:   	ldsh	[%g2 + 0x32], %l1
	.word	0x99a409cc	! t0_kref+0x1544:   	fdivd	%f16, %f12, %f12
	.word	0x2d480001	! t0_kref+0x1548:   	fbg,a,pt	%fcc0, _kref+0x154c
	.word	0x81800000	! t0_kref+0x154c:   	mov	%g0, %y
	.word	0x86102002	! t0_kref+0x1550:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x1554:   	bne,a	_kref+0x1554
	.word	0x86a0e001	! t0_kref+0x1558:   	subcc	%g3, 1, %g3
	.word	0xa33e8011	! t0_kref+0x155c:   	sra	%i2, %l1, %l1
	.word	0xa3a38837	! t0_kref+0x1560:   	fadds	%f14, %f23, %f17
	.word	0xa2f273e1	! t0_kref+0x1564:   	udivcc	%o1, -0xc1f, %l1
	.word	0x8db64a30	! t0_kref+0x1568:   	fpadd16s	%f25, %f16, %f6
	.word	0x95a68958	! t0_kref+0x156c:   	fmuld	%f26, %f24, %f10
	.word	0xa2f42f63	! t0_kref+0x1570:   	udivcc	%l0, 0xf63, %l1
	.word	0xe91fbe60	! t0_kref+0x1574:   	ldd	[%fp - 0x1a0], %f20
	.word	0xc807bfe8	! t0_kref+0x1578:   	ld	[%fp - 0x18], %g4
	.word	0x81b01026	! t0_kref+0x157c:   	siam	0x6
	.word	0xa5a48950	! t0_kref+0x1580:   	fmuld	%f18, %f16, %f18
	.word	0xa3b34356	! t0_kref+0x1584:   	alignaddrl	%o5, %l6, %l1
	.word	0xe81e2010	! t0_kref+0x1588:   	ldd	[%i0 + 0x10], %l4
	.word	0x26800003	! t0_kref+0x158c:   	bl,a	_kref+0x1598
	.word	0x8da4095a	! t0_kref+0x1590:   	fmuld	%f16, %f26, %f6
	.word	0xf120a020	! t0_kref+0x1594:   	st	%f24, [%g2 + 0x20]
	.word	0xa212ad85	! t0_kref+0x1598:   	or	%o2, 0xd85, %l1
	.word	0x26800005	! t0_kref+0x159c:   	bl,a	_kref+0x15b0
	.word	0xa254c01b	! t0_kref+0x15a0:   	umul	%l3, %i3, %l1
	.word	0xaba000a7	! t0_kref+0x15a4:   	fnegs	%f7, %f21
	.word	0xa5b00cd2	! t0_kref+0x15a8:   	fnot2	%f18, %f18
	.word	0xa7a408a8	! t0_kref+0x15ac:   	fsubs	%f16, %f8, %f19
	.word	0x9da01932	! t0_kref+0x15b0:   	fstod	%f18, %f14
	.word	0xa1b009b8	! t0_kref+0x15b4:   	fexpand	%f24, %f16
	.word	0xa3b6844e	! t0_kref+0x15b8:   	fcmpne16	%f26, %f14, %l1
	.word	0x99a0193a	! t0_kref+0x15bc:   	fstod	%f26, %f12
	.word	0x8fa209b1	! t0_kref+0x15c0:   	fdivs	%f8, %f17, %f7
	.word	0xcf260000	! t0_kref+0x15c4:   	st	%f7, [%i0]
	.word	0xe3b8a040	! t0_kref+0x15c8:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xcd1fbce0	! t0_kref+0x15cc:   	ldd	[%fp - 0x320], %f6
	.word	0xa2f50013	! t0_kref+0x15d0:   	udivcc	%l4, %l3, %l1
	.word	0xe2567ff4	! t0_kref+0x15d4:   	ldsh	[%i1 - 0xc], %l1
	.word	0x25480006	! t0_kref+0x15d8:   	fblg,a,pt	%fcc0, _kref+0x15f0
	.word	0xdaf81018	! t0_kref+0x15dc:   	swapa	[%g0 + %i0]0x80, %o5
	.word	0xe120a010	! t0_kref+0x15e0:   	st	%f16, [%g2 + 0x10]
	.word	0xd1be5888	! t0_kref+0x15e4:   	stda	%f8, [%i1 + %o0]0xc4
	.word	0xe06e3ff7	! t0_kref+0x15e8:   	ldstub	[%i0 - 9], %l0
	.word	0xdf000019	! t0_kref+0x15ec:   	ld	[%g0 + %i1], %f15
	.word	0xec30a028	! t0_kref+0x15f0:   	sth	%l6, [%g2 + 0x28]
	.word	0xa3b6c010	! t0_kref+0x15f4:   	edge8	%i3, %l0, %l1
	.word	0xdf20a028	! t0_kref+0x15f8:   	st	%f15, [%g2 + 0x28]
	.word	0x99a38958	! t0_kref+0x15fc:   	fmuld	%f14, %f24, %f12
	.word	0xa29efe8a	! t0_kref+0x1600:   	xorcc	%i3, -0x176, %l1
	.word	0x33480007	! t0_kref+0x1604:   	fbe,a,pt	%fcc0, _kref+0x1620
	.word	0xed00a018	! t0_kref+0x1608:   	ld	[%g2 + 0x18], %f22
	.word	0xa245767c	! t0_kref+0x160c:   	addc	%l5, -0x984, %l1
	.word	0xa21df5c5	! t0_kref+0x1610:   	xor	%l7, -0xa3b, %l1
	.word	0xee30a010	! t0_kref+0x1614:   	sth	%l7, [%g2 + 0x10]
	.word	0xa2ad0014	! t0_kref+0x1618:   	andncc	%l4, %l4, %l1
	.word	0x3e480004	! t0_kref+0x161c:   	bvc,a,pt	%icc, _kref+0x162c
	.word	0x8db50d08	! t0_kref+0x1620:   	fandnot1	%f20, %f8, %f6
	.word	0xa206aaec	! t0_kref+0x1624:   	add	%i2, 0xaec, %l1
	.word	0x24800002	! t0_kref+0x1628:   	ble,a	_kref+0x1630
	.word	0xa29cab1a	! t0_kref+0x162c:   	xorcc	%l2, 0xb1a, %l1
	.word	0xb5b38a3a	! t0_kref+0x1630:   	fpadd16s	%f14, %f26, %f26
	.word	0xb7b00fe0	! t0_kref+0x1634:   	fones	%f27
	.word	0xe630a038	! t0_kref+0x1638:   	sth	%l3, [%g2 + 0x38]
	.word	0x86102007	! t0_kref+0x163c:   	mov	0x7, %g3
	.word	0x86a0e001	! t0_kref+0x1640:   	subcc	%g3, 1, %g3
	.word	0x22800009	! t0_kref+0x1644:   	be,a	_kref+0x1668
	.word	0x97a00529	! t0_kref+0x1648:   	fsqrts	%f9, %f11
	.word	0xb1b00f2d	! t0_kref+0x164c:   	fsrc2s	%f13, %f24
	.word	0xa3334009	! t0_kref+0x1650:   	srl	%o5, %o1, %l1
	.word	0x8182c000	! t0_kref+0x1654:   	wr	%o3, %g0, %y
	.word	0xa2b364e5	! t0_kref+0x1658:   	orncc	%o5, 0x4e5, %l1
	call	SYM(t0_subr0)
	.word	0xe3b8a040	! t0_kref+0x1660:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xa29521c8	! t0_kref+0x1664:   	orcc	%l4, 0x1c8, %l1
	.word	0x9f414000	! t0_kref+0x1668:   	mov	%pc, %o7
!	.word	0x254d3263	! t0_kref+0x166c:   	fblg,a,pt	%fcc0, SYM(t0_subr1)
	   	fblg,a,pt	%fcc0, SYM(t0_subr1)
	.word	0x81de8015	! t0_kref+0x1670:   	flush	%i2 + %l5
	.word	0xea28a029	! t0_kref+0x1674:   	stb	%l5, [%g2 + 0x29]
	.word	0x20800002	! t0_kref+0x1678:   	bn,a	_kref+0x1680
	.word	0xb5b007b4	! t0_kref+0x167c:   	fpackfix	%f20, %f26
	.word	0xa2a00015	! t0_kref+0x1680:   	subcc	%g0, %l5, %l1
	.word	0xa25d400b	! t0_kref+0x1684:   	smul	%l5, %o3, %l1
	.word	0xa3b50e7a	! t0_kref+0x1688:   	fxnors	%f20, %f26, %f17
	.word	0xa3b6805b	! t0_kref+0x168c:   	edge8l	%i2, %i3, %l1
	.word	0x8db00fc0	! t0_kref+0x1690:   	fone	%f6
	.word	0xa29c6511	! t0_kref+0x1694:   	xorcc	%l1, 0x511, %l1
	.word	0xe240a030	! t0_kref+0x1698:   	ldsw	[%g2 + 0x30], %l1
	.word	0x36480005	! t0_kref+0x169c:   	bge,a,pt	%icc, _kref+0x16b0
	.word	0xa3282004	! t0_kref+0x16a0:   	sll	%g0, 0x4, %l1
	.word	0xd2b01019	! t0_kref+0x16a4:   	stha	%o1, [%g0 + %i1]0x80
	.word	0xa5a00035	! t0_kref+0x16a8:   	fmovs	%f21, %f18
	.word	0xe2480019	! t0_kref+0x16ac:   	ldsb	[%g0 + %i1], %l1
	.word	0xcd1fbd18	! t0_kref+0x16b0:   	ldd	[%fp - 0x2e8], %f6
	.word	0xe216c019	! t0_kref+0x16b4:   	lduh	[%i3 + %i1], %l1
	.word	0x9de3bfa0	! t0_kref+0x16b8:   	save	%sp, -0x60, %sp
	.word	0xba2025ca	! t0_kref+0x16bc:   	sub	%g0, 0x5ca, %i5
	.word	0xa3ee8000	! t0_kref+0x16c0:   	restore	%i2, %g0, %l1
	.word	0x29480004	! t0_kref+0x16c4:   	fbl,a,pt	%fcc0, _kref+0x16d4
	.word	0xee30a01a	! t0_kref+0x16c8:   	sth	%l7, [%g2 + 0x1a]
	.word	0xa33de00a	! t0_kref+0x16cc:   	sra	%l7, 0xa, %l1
	.word	0xa2ad8013	! t0_kref+0x16d0:   	andncc	%l6, %l3, %l1
	.word	0x2c480003	! t0_kref+0x16d4:   	bneg,a,pt	%icc, _kref+0x16e0
	.word	0xd26e8019	! t0_kref+0x16d8:   	ldstub	[%i2 + %i1], %o1
	.word	0x99b20a8c	! t0_kref+0x16dc:   	fpsub16	%f8, %f12, %f12
	.word	0xd020a008	! t0_kref+0x16e0:   	st	%o0, [%g2 + 8]
	.word	0xe2564000	! t0_kref+0x16e4:   	ldsh	[%i1], %l1
	.word	0x9fc00004	! t0_kref+0x16e8:   	call	%g0 + %g4
	.word	0xa22e8010	! t0_kref+0x16ec:   	andn	%i2, %l0, %l1
	.word	0xb5a588aa	! t0_kref+0x16f0:   	fsubs	%f22, %f10, %f26
	.word	0x23480003	! t0_kref+0x16f4:   	fbne,a,pt	%fcc0, _kref+0x1700
	.word	0xe830a020	! t0_kref+0x16f8:   	sth	%l4, [%g2 + 0x20]
	.word	0xa28d7512	! t0_kref+0x16fc:   	andcc	%l5, -0xaee, %l1
	.word	0xe4086984	! t0_kref+0x1700:   	ldub	[%g1 + 0x984], %l2
	.word	0xa41ca00c	! t0_kref+0x1704:   	xor	%l2, 0xc, %l2
	.word	0xe4286984	! t0_kref+0x1708:   	stb	%l2, [%g1 + 0x984]
	.word	0x81d86984	! t0_kref+0x170c:   	flush	%g1 + 0x984
2:	.word	0x97a648bb	! t0_kref+0x1710:   	fsubs	%f25, %f27, %f11
	.word	0xa215ae07	! t0_kref+0x1714:   	or	%l6, 0xe07, %l1
	.word	0xa3b7044a	! t0_kref+0x1718:   	fcmpne16	%f28, %f10, %l1
	.word	0xa9b48d94	! t0_kref+0x171c:   	fxor	%f18, %f20, %f20
	.word	0x99b00c00	! t0_kref+0x1720:   	fzero	%f12
	.word	0xa1a01a30	! t0_kref+0x1724:   	fstoi	%f16, %f16
	.word	0xf3066004	! t0_kref+0x1728:   	ld	[%i1 + 4], %f25
	.word	0xe500a018	! t0_kref+0x172c:   	ld	[%g2 + 0x18], %f18
	.word	0x95a0054a	! t0_kref+0x1730:   	fsqrtd	%f10, %f10
	sethi	%hi(2f), %o7
	.word	0xe40be358	! t0_kref+0x1738:   	ldub	[%o7 + 0x358], %l2
	.word	0xa41ca00c	! t0_kref+0x173c:   	xor	%l2, 0xc, %l2
	.word	0xe42be358	! t0_kref+0x1740:   	stb	%l2, [%o7 + 0x358]
	.word	0x81dbe358	! t0_kref+0x1744:   	flush	%o7 + 0x358
	.word	0xe81e6008	! t0_kref+0x1748:   	ldd	[%i1 + 8], %l4
	.word	0xa3400000	! t0_kref+0x174c:   	mov	%y, %l1
	.word	0xa9a01929	! t0_kref+0x1750:   	fstod	%f9, %f20
	.word	0xa25af98c	! t0_kref+0x1754:   	smul	%o3, -0x674, %l1
2:	.word	0xa32c2009	! t0_kref+0x1758:   	sll	%l0, 0x9, %l1
	.word	0x9ba248b4	! t0_kref+0x175c:   	fsubs	%f9, %f20, %f13
	.word	0xd7262008	! t0_kref+0x1760:   	st	%f11, [%i0 + 8]
	.word	0xe2563fee	! t0_kref+0x1764:   	ldsh	[%i0 - 0x12], %l1
	.word	0xe25e7ff8	! t0_kref+0x1768:   	ldx	[%i1 - 8], %l1
	.word	0x81dcc008	! t0_kref+0x176c:   	flush	%l3 + %o0
	.word	0xa3b5c15a	! t0_kref+0x1770:   	edge32l	%l7, %i2, %l1
	.word	0xf628a029	! t0_kref+0x1774:   	stb	%i3, [%g2 + 0x29]
	.word	0xa2b34008	! t0_kref+0x1778:   	orncc	%o5, %o0, %l1
	.word	0x9fa3c93d	! t0_kref+0x177c:   	fmuls	%f15, %f29, %f15
	.word	0xa5a01935	! t0_kref+0x1780:   	fstod	%f21, %f18
	.word	0xa2aa8014	! t0_kref+0x1784:   	andncc	%o2, %l4, %l1
	.word	0x23010739	! t0_kref+0x1788:   	sethi	%hi(0x41ce400), %l1
	.word	0xe9be1a5b	! t0_kref+0x178c:   	stda	%f20, [%i0 + %i3]0xd2
	.word	0xa275c011	! t0_kref+0x1790:   	udiv	%l7, %l1, %l1
	.word	0xbba01a33	! t0_kref+0x1794:   	fstoi	%f19, %f29
	.word	0x95b50d0a	! t0_kref+0x1798:   	fandnot1	%f20, %f10, %f10
	.word	0x81a9caa7	! t0_kref+0x179c:   	fcmpes	%fcc0, %f7, %f7
	.word	0xa204be1a	! t0_kref+0x17a0:   	add	%l2, -0x1e6, %l1
	.word	0x9fc10000	! t0_kref+0x17a4:   	call	%g4
	.word	0xa332c014	! t0_kref+0x17a8:   	srl	%o3, %l4, %l1
	.word	0xe2567ff6	! t0_kref+0x17ac:   	ldsh	[%i1 - 0xa], %l1
	.word	0xa2b22915	! t0_kref+0x17b0:   	orncc	%o0, 0x915, %l1
	.word	0xa3326016	! t0_kref+0x17b4:   	srl	%o1, 0x16, %l1
	.word	0xa3b68240	! t0_kref+0x17b8:   	array16	%i2, %g0, %l1
	.word	0xe2de1000	! t0_kref+0x17bc:   	ldxa	[%i0]0x80, %l1
	.word	0xd628a011	! t0_kref+0x17c0:   	stb	%o3, [%g2 + 0x11]
	.word	0xb3a188b3	! t0_kref+0x17c4:   	fsubs	%f6, %f19, %f25
	.word	0xe2563ff2	! t0_kref+0x17c8:   	ldsh	[%i0 - 0xe], %l1
	.word	0x39480001	! t0_kref+0x17cc:   	fbuge,a,pt	%fcc0, _kref+0x17d0
	.word	0x99a689ca	! t0_kref+0x17d0:   	fdivd	%f26, %f10, %f12
	.word	0xa33dc015	! t0_kref+0x17d4:   	sra	%l7, %l5, %l1
	.word	0x30800005	! t0_kref+0x17d8:   	ba,a	_kref+0x17ec
	.word	0x9da01929	! t0_kref+0x17dc:   	fstod	%f9, %f14
	.word	0x99a0108c	! t0_kref+0x17e0:   	fxtos	%f12, %f12
	.word	0xa216f8aa	! t0_kref+0x17e4:   	or	%i3, -0x756, %l1
	.word	0xa2b4800c	! t0_kref+0x17e8:   	orncc	%l2, %o4, %l1
	.word	0xa9b28707	! t0_kref+0x17ec:   	fmuld8sux16	%f10, %f7, %f20
	.word	0xa1b30d10	! t0_kref+0x17f0:   	fandnot1	%f12, %f16, %f16
	.word	0xa2430000	! t0_kref+0x17f4:   	addc	%o4, %g0, %l1
	.word	0xa3b30010	! t0_kref+0x17f8:   	edge8	%o4, %l0, %l1
	.word	0x20800007	! t0_kref+0x17fc:   	bn,a	_kref+0x1818
	.word	0x23343bca	! t0_kref+0x1800:   	sethi	%hi(0xd0ef2800), %l1
	.word	0x81aa0a48	! t0_kref+0x1804:   	fcmpd	%fcc0, %f8, %f8
	.word	0x3e800004	! t0_kref+0x1808:   	bvc,a	_kref+0x1818
	.word	0xa2c2400b	! t0_kref+0x180c:   	addccc	%o1, %o3, %l1
	.word	0xa3400000	! t0_kref+0x1810:   	mov	%y, %l1
	.word	0xa31a4008	! t0_kref+0x1814:   	tsubcctv	%o1, %o0, %l1
	.word	0x81dac017	! t0_kref+0x1818:   	flush	%o3 + %l7
	.word	0xb7a01a26	! t0_kref+0x181c:   	fstoi	%f6, %f27
	.word	0xabb48a33	! t0_kref+0x1820:   	fpadd16s	%f18, %f19, %f21
	.word	0x9fa00128	! t0_kref+0x1824:   	fabss	%f8, %f15
	.word	0xb5b00c00	! t0_kref+0x1828:   	fzero	%f26
	.word	0xb1b00cd6	! t0_kref+0x182c:   	fnot2	%f22, %f24
	.word	0xb9a209ca	! t0_kref+0x1830:   	fdivd	%f8, %f10, %f28
	.word	0xa2b4400a	! t0_kref+0x1834:   	orncc	%l1, %o2, %l1
	.word	0xb9a708ca	! t0_kref+0x1838:   	fsubd	%f28, %f10, %f28
	.word	0x231f1d8c	! t0_kref+0x183c:   	sethi	%hi(0x7c763000), %l1
	.word	0x233a6195	! t0_kref+0x1840:   	sethi	%hi(0xe9865400), %l1
	.word	0xa9b68d18	! t0_kref+0x1844:   	fandnot1	%f26, %f24, %f20
	.word	0x99b20f88	! t0_kref+0x1848:   	for	%f8, %f8, %f12
	.word	0xd030a000	! t0_kref+0x184c:   	sth	%o0, [%g2]
	.word	0x9fb70c6f	! t0_kref+0x1850:   	fnors	%f28, %f15, %f15
	.word	0x81aeca32	! t0_kref+0x1854:   	fcmps	%fcc0, %f27, %f18
	.word	0xe93824a8	! t0_kref+0x1858:   	std	%f20, [%g0 + 0x4a8]
	.word	0xe2564000	! t0_kref+0x185c:   	ldsh	[%i1], %l1
	.word	0xa275a15f	! t0_kref+0x1860:   	udiv	%l6, 0x15f, %l1
	.word	0xada00554	! t0_kref+0x1864:   	fsqrtd	%f20, %f22
	.word	0x8585401a	! t0_kref+0x1868:   	wr	%l5, %i2, %ccr
	.word	0xa3a0002f	! t0_kref+0x186c:   	fmovs	%f15, %f17
	.word	0xa2d48012	! t0_kref+0x1870:   	umulcc	%l2, %l2, %l1
	.word	0x91b3074e	! t0_kref+0x1874:   	fpack32	%f12, %f14, %f8
	.word	0xa2000013	! t0_kref+0x1878:   	add	%g0, %l3, %l1
	.word	0x91a6c8a6	! t0_kref+0x187c:   	fsubs	%f27, %f6, %f8
	.word	0xadb74975	! t0_kref+0x1880:   	fpmerge	%f29, %f21, %f22
	.word	0x36800004	! t0_kref+0x1884:   	bge,a	_kref+0x1894
	.word	0xa9b48d88	! t0_kref+0x1888:   	fxor	%f18, %f8, %f20
	.word	0xa2b2c010	! t0_kref+0x188c:   	orncc	%o3, %l0, %l1
	.word	0x3a480004	! t0_kref+0x1890:   	bcc,a,pt	%icc, _kref+0x18a0
	.word	0xf920a010	! t0_kref+0x1894:   	st	%f28, [%g2 + 0x10]
	.word	0x8da00039	! t0_kref+0x1898:   	fmovs	%f25, %f6
	.word	0xe030a032	! t0_kref+0x189c:   	sth	%l0, [%g2 + 0x32]
	.word	0x99b00fc0	! t0_kref+0x18a0:   	fone	%f12
	.word	0xa22eaa10	! t0_kref+0x18a4:   	andn	%i2, 0xa10, %l1
	.word	0xa3400000	! t0_kref+0x18a8:   	mov	%y, %l1
	.word	0xa1b6098a	! t0_kref+0x18ac:   	bshuffle	%f24, %f10, %f16
	.word	0xa2332da5	! t0_kref+0x18b0:   	orn	%o4, 0xda5, %l1
	.word	0xa2dd28b3	! t0_kref+0x18b4:   	smulcc	%l4, 0x8b3, %l1
	.word	0xa9a2c832	! t0_kref+0x18b8:   	fadds	%f11, %f18, %f20
	.word	0xb5a01a2b	! t0_kref+0x18bc:   	fstoi	%f11, %f26
	.word	0xeb20a030	! t0_kref+0x18c0:   	st	%f21, [%g2 + 0x30]
	.word	0x81db78c6	! t0_kref+0x18c4:   	flush	%o5 - 0x73a
	.word	0x81ae4a2f	! t0_kref+0x18c8:   	fcmps	%fcc0, %f25, %f15
	.word	0xa32b2008	! t0_kref+0x18cc:   	sll	%o4, 0x8, %l1
	.word	0xb9a24d39	! t0_kref+0x18d0:   	fsmuld	%f9, %f25, %f28
	.word	0x81adcab2	! t0_kref+0x18d4:   	fcmpes	%fcc0, %f23, %f18
	.word	0x2e800004	! t0_kref+0x18d8:   	bvs,a	_kref+0x18e8
	.word	0xa3400000	! t0_kref+0x18dc:   	mov	%y, %l1
	.word	0x8fb007b0	! t0_kref+0x18e0:   	fpackfix	%f16, %f7
	.word	0xa213400c	! t0_kref+0x18e4:   	or	%o5, %o4, %l1
	.word	0xa23325bc	! t0_kref+0x18e8:   	orn	%o4, 0x5bc, %l1
	.word	0xf5264000	! t0_kref+0x18ec:   	st	%f26, [%i1]
	.word	0xa3700013	! t0_kref+0x18f0:   	popc	%l3, %l1
	.word	0xa1a0054e	! t0_kref+0x18f4:   	fsqrtd	%f14, %f16
	.word	0xa3b48017	! t0_kref+0x18f8:   	edge8	%l2, %l7, %l1
	.word	0xa215c00d	! t0_kref+0x18fc:   	or	%l7, %o5, %l1
	.word	0x37800001	! t0_kref+0x1900:   	fbge,a	_kref+0x1904
	.word	0xb1b00c00	! t0_kref+0x1904:   	fzero	%f24
	.word	0xa3342010	! t0_kref+0x1908:   	srl	%l0, 0x10, %l1
	.word	0xa3b68240	! t0_kref+0x190c:   	array16	%i2, %g0, %l1
	.word	0xe2164000	! t0_kref+0x1910:   	lduh	[%i1], %l1
	.word	0x3f800001	! t0_kref+0x1914:   	fbo,a	_kref+0x1918
	.word	0xadb48d98	! t0_kref+0x1918:   	fxor	%f18, %f24, %f22
	.word	0xdb26201c	! t0_kref+0x191c:   	st	%f13, [%i0 + 0x1c]
	.word	0xe230a022	! t0_kref+0x1920:   	sth	%l1, [%g2 + 0x22]
	.word	0x33800007	! t0_kref+0x1924:   	fbe,a	_kref+0x1940
	.word	0xa21ebf42	! t0_kref+0x1928:   	xor	%i2, -0xbe, %l1
	.word	0x8db00fe0	! t0_kref+0x192c:   	fones	%f6
	.word	0x9db50a26	! t0_kref+0x1930:   	fpadd16s	%f20, %f6, %f14
	.word	0x95a2492f	! t0_kref+0x1934:   	fmuls	%f9, %f15, %f10
	.word	0xa3b68406	! t0_kref+0x1938:   	fcmple16	%f26, %f6, %l1
	.word	0xa28b400b	! t0_kref+0x193c:   	andcc	%o5, %o3, %l1
	.word	0xa304b9af	! t0_kref+0x1940:   	taddcc	%l2, -0x651, %l1
	.word	0xa21cc014	! t0_kref+0x1944:   	xor	%l3, %l4, %l1
	.word	0xe4086be4	! t0_kref+0x1948:   	ldub	[%g1 + 0xbe4], %l2
	.word	0xa41ca00c	! t0_kref+0x194c:   	xor	%l2, 0xc, %l2
	.word	0xe4286be4	! t0_kref+0x1950:   	stb	%l2, [%g1 + 0xbe4]
	.word	0x81d86be4	! t0_kref+0x1954:   	flush	%g1 + 0xbe4
	.word	0x38800004	! t0_kref+0x1958:   	bgu,a	_kref+0x1968
	.word	0xa3b6050a	! t0_kref+0x195c:   	fcmpgt16	%f24, %f10, %l1
	.word	0xa7a3c939	! t0_kref+0x1960:   	fmuls	%f15, %f25, %f19
	.word	0xa2d3224d	! t0_kref+0x1964:   	umulcc	%o4, 0x24d, %l1
	.word	0xda28a020	! t0_kref+0x1968:   	stb	%o5, [%g2 + 0x20]
	.word	0xafa0002e	! t0_kref+0x196c:   	fmovs	%f14, %f23
2:	.word	0xd93e6010	! t0_kref+0x1970:   	std	%f12, [%i1 + 0x10]
	.word	0xa1a28d2b	! t0_kref+0x1974:   	fsmuld	%f10, %f11, %f16
	.word	0x8db1c971	! t0_kref+0x1978:   	fpmerge	%f7, %f17, %f6
	.word	0xf706401c	! t0_kref+0x197c:   	ld	[%i1 + %i4], %f27
	.word	0xa2c50000	! t0_kref+0x1980:   	addccc	%l4, %g0, %l1
	.word	0x9fb48ea0	! t0_kref+0x1984:   	fsrc1s	%f18, %f15
	.word	0x8db50cb8	! t0_kref+0x1988:   	fandnot2s	%f20, %f24, %f6
	.word	0x81af0a5c	! t0_kref+0x198c:   	fcmpd	%fcc0, %f28, %f28
	.word	0xa30c4012	! t0_kref+0x1990:   	tsubcc	%l1, %l2, %l1
	.word	0x20800004	! t0_kref+0x1994:   	bn,a	_kref+0x19a4
	.word	0xd4f6501d	! t0_kref+0x1998:   	stxa	%o2, [%i1 + %i5]0x80
	.word	0xbba000b4	! t0_kref+0x199c:   	fnegs	%f20, %f29
	.word	0x91a00146	! t0_kref+0x19a0:   	fabsd	%f6, %f8
	.word	0xd7200019	! t0_kref+0x19a4:   	st	%f11, [%g0 + %i1]
	.word	0xa2727fe5	! t0_kref+0x19a8:   	udiv	%o1, -0x1b, %l1
	.word	0xd26e6015	! t0_kref+0x19ac:   	ldstub	[%i1 + 0x15], %o1
	.word	0xe246001c	! t0_kref+0x19b0:   	ldsw	[%i0 + %i4], %l1
	.word	0xd91fbc80	! t0_kref+0x19b4:   	ldd	[%fp - 0x380], %f12
	.word	0xe41e7ff0	! t0_kref+0x19b8:   	ldd	[%i1 - 0x10], %l2
	.word	0x81820000	! t0_kref+0x19bc:   	wr	%o0, %g0, %y
	.word	0xe20e601e	! t0_kref+0x19c0:   	ldub	[%i1 + 0x1e], %l1
	.word	0xcd3e4000	! t0_kref+0x19c4:   	std	%f6, [%i1]
	.word	0x9db50d94	! t0_kref+0x19c8:   	fxor	%f20, %f20, %f14
	.word	0xa2d3789f	! t0_kref+0x19cc:   	umulcc	%o5, -0x761, %l1
	.word	0xa21aa296	! t0_kref+0x19d0:   	xor	%o2, 0x296, %l1
	.word	0xa210000c	! t0_kref+0x19d4:   	mov	%o4, %l1
	.word	0x28800005	! t0_kref+0x19d8:   	bleu,a	_kref+0x19ec
	.word	0xa21d8014	! t0_kref+0x19dc:   	xor	%l6, %l4, %l1
	.word	0x99a00550	! t0_kref+0x19e0:   	fsqrtd	%f16, %f12
	.word	0xa3b48177	! t0_kref+0x19e4:   	edge32ln	%l2, %l7, %l1
	.word	0xa30a6333	! t0_kref+0x19e8:   	tsubcc	%o1, 0x333, %l1
	.word	0xe24e7fe6	! t0_kref+0x19ec:   	ldsb	[%i1 - 0x1a], %l1
	.word	0x86102004	! t0_kref+0x19f0:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x19f4:   	bne,a	_kref+0x19f4
	.word	0x86a0e001	! t0_kref+0x19f8:   	subcc	%g3, 1, %g3
	.word	0xada00137	! t0_kref+0x19fc:   	fabss	%f23, %f22
	.word	0xa2f32ce5	! t0_kref+0x1a00:   	udivcc	%o4, 0xce5, %l1
	.word	0x8db48dad	! t0_kref+0x1a04:   	fxors	%f18, %f13, %f6
	.word	0xe2680019	! t0_kref+0x1a08:   	ldstub	[%g0 + %i1], %l1
	.word	0xa2aa67c4	! t0_kref+0x1a0c:   	andncc	%o1, 0x7c4, %l1
	.word	0xd628a013	! t0_kref+0x1a10:   	stb	%o3, [%g2 + 0x13]
	.word	0x232e96a1	! t0_kref+0x1a14:   	sethi	%hi(0xba5a8400), %l1
	.word	0xe208a02b	! t0_kref+0x1a18:   	ldub	[%g2 + 0x2b], %l1
	.word	0xa275c00c	! t0_kref+0x1a1c:   	udiv	%l7, %o4, %l1
	.word	0x9ba01889	! t0_kref+0x1a20:   	fitos	%f9, %f13
	.word	0xa2080011	! t0_kref+0x1a24:   	and	%g0, %l1, %l1
	.word	0xd0a6501c	! t0_kref+0x1a28:   	sta	%o0, [%i1 + %i4]0x80
	.word	0xe24e3fec	! t0_kref+0x1a2c:   	ldsb	[%i0 - 0x14], %l1
	.word	0x86102001	! t0_kref+0x1a30:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x1a34:   	bne,a	_kref+0x1a34
	.word	0x86a0e001	! t0_kref+0x1a38:   	subcc	%g3, 1, %g3
	.word	0x81ac0a27	! t0_kref+0x1a3c:   	fcmps	%fcc0, %f16, %f7
	.word	0xea30a022	! t0_kref+0x1a40:   	sth	%l5, [%g2 + 0x22]
	.word	0xf11fbc58	! t0_kref+0x1a44:   	ldd	[%fp - 0x3a8], %f24
	.word	0xa2742bdf	! t0_kref+0x1a48:   	udiv	%l0, 0xbdf, %l1
	.word	0xa2e54017	! t0_kref+0x1a4c:   	subccc	%l5, %l7, %l1
	.word	0xa2ad6394	! t0_kref+0x1a50:   	andncc	%l5, 0x394, %l1
	.word	0xa7a488ba	! t0_kref+0x1a54:   	fsubs	%f18, %f26, %f19
	.word	0xe216200a	! t0_kref+0x1a58:   	lduh	[%i0 + 0xa], %l1
	.word	0xe3b8a040	! t0_kref+0x1a5c:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x2d800006	! t0_kref+0x1a60:   	fbg,a	_kref+0x1a78
	.word	0xd9bf1a59	! t0_kref+0x1a64:   	stda	%f12, [%i4 + %i1]0xd2
	.word	0xb1b009ad	! t0_kref+0x1a68:   	fexpand	%f13, %f24
	.word	0x99a0193d	! t0_kref+0x1a6c:   	fstod	%f29, %f12
	.word	0xf4367ff4	! t0_kref+0x1a70:   	sth	%i2, [%i1 - 0xc]
	.word	0xa3b5800d	! t0_kref+0x1a74:   	edge8	%l6, %o5, %l1
	.word	0xa25ab3c2	! t0_kref+0x1a78:   	smul	%o2, -0xc3e, %l1
	.word	0xee20a030	! t0_kref+0x1a7c:   	st	%l7, [%g2 + 0x30]
	.word	0xd1f61011	! t0_kref+0x1a80:   	casxa	[%i0]0x80, %l1, %o0
	.word	0x86102003	! t0_kref+0x1a84:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x1a88:   	bne,a	_kref+0x1a88
	.word	0x86a0e001	! t0_kref+0x1a8c:   	subcc	%g3, 1, %g3
	.word	0xe24e8019	! t0_kref+0x1a90:   	ldsb	[%i2 + %i1], %l1
	call	SYM(t0_subr1)
	.word	0x9da1c9a6	! t0_kref+0x1a98:   	fdivs	%f7, %f6, %f14
	.word	0xb7b2cea0	! t0_kref+0x1a9c:   	fsrc1s	%f11, %f27
	.word	0xe24e401a	! t0_kref+0x1aa0:   	ldsb	[%i1 + %i2], %l1
	.word	0xe5f6101a	! t0_kref+0x1aa4:   	casxa	[%i0]0x80, %i2, %l2
	.word	0xc030a038	! t0_kref+0x1aa8:   	clrh	[%g2 + 0x38]
	.word	0xa28a6dd1	! t0_kref+0x1aac:   	andcc	%o1, 0xdd1, %l1
	.word	0xa3b00f37	! t0_kref+0x1ab0:   	fsrc2s	%f23, %f17
	.word	0x37480004	! t0_kref+0x1ab4:   	fbge,a,pt	%fcc0, _kref+0x1ac4
	.word	0xe41f4018	! t0_kref+0x1ab8:   	ldd	[%i5 + %i0], %l2
	.word	0x81ab0aa8	! t0_kref+0x1abc:   	fcmpes	%fcc0, %f12, %f8
	.word	0xa2ac800b	! t0_kref+0x1ac0:   	andncc	%l2, %o3, %l1
	.word	0xa22b280a	! t0_kref+0x1ac4:   	andn	%o4, 0x80a, %l1
	.word	0x99b70a1a	! t0_kref+0x1ac8:   	fpadd16	%f28, %f26, %f12
	.word	0xe208a039	! t0_kref+0x1acc:   	ldub	[%g2 + 0x39], %l1
	.word	0xa3b585d2	! t0_kref+0x1ad0:   	fcmpeq32	%f22, %f18, %l1
	.word	0xa333600c	! t0_kref+0x1ad4:   	srl	%o5, 0xc, %l1
	.word	0xe9be5848	! t0_kref+0x1ad8:   	stda	%f20, [%i1 + %o0]0xc2
	.word	0x8da48839	! t0_kref+0x1adc:   	fadds	%f18, %f25, %f6
	.word	0x8da349b2	! t0_kref+0x1ae0:   	fdivs	%f13, %f18, %f6
	.word	0xa2042418	! t0_kref+0x1ae4:   	add	%l0, 0x418, %l1
	.word	0x8184c000	! t0_kref+0x1ae8:   	wr	%l3, %g0, %y
	.word	0x8fb3cde6	! t0_kref+0x1aec:   	fnands	%f15, %f6, %f7
	.word	0xdd39401d	! t0_kref+0x1af0:   	std	%f14, [%g5 + %i5]
	.word	0x8143c000	! t0_kref+0x1af4:   	stbar
	.word	0xe420a030	! t0_kref+0x1af8:   	st	%l2, [%g2 + 0x30]
	.word	0xe41e401d	! t0_kref+0x1afc:   	ldd	[%i1 + %i5], %l2
	.word	0x3d480002	! t0_kref+0x1b00:   	fbule,a,pt	%fcc0, _kref+0x1b08
	.word	0xa3400000	! t0_kref+0x1b04:   	mov	%y, %l1
	.word	0xa2f44012	! t0_kref+0x1b08:   	udivcc	%l1, %l2, %l1
	.word	0x97a00134	! t0_kref+0x1b0c:   	fabss	%f20, %f11
	.word	0xf207bfe0	! t0_kref+0x1b10:   	ld	[%fp - 0x20], %i1
	.word	0x81ad0ac8	! t0_kref+0x1b14:   	fcmped	%fcc0, %f20, %f8
	.word	0x99a689ca	! t0_kref+0x1b18:   	fdivd	%f26, %f10, %f12
	.word	0xe200a018	! t0_kref+0x1b1c:   	ld	[%g2 + 0x18], %l1
	.word	0x81580000	! t0_kref+0x1b20:   	flushw
	.word	0xeb063ff8	! t0_kref+0x1b24:   	ld	[%i0 - 8], %f21
	.word	0x81840000	! t0_kref+0x1b28:   	wr	%l0, %g0, %y
	.word	0xb7a0188f	! t0_kref+0x1b2c:   	fitos	%f15, %f27
	.word	0x23200686	! t0_kref+0x1b30:   	sethi	%hi(0x801a1800), %l1
	call	SYM(t0_subr3)
	.word	0xe200a030	! t0_kref+0x1b38:   	ld	[%g2 + 0x30], %l1
	.word	0xe24e4000	! t0_kref+0x1b3c:   	ldsb	[%i1], %l1
	.word	0xa336a013	! t0_kref+0x1b40:   	srl	%i2, 0x13, %l1
	.word	0x8da01912	! t0_kref+0x1b44:   	fitod	%f18, %f6
	.word	0xa2754000	! t0_kref+0x1b48:   	udiv	%l5, %g0, %l1
	.word	0xef263ff8	! t0_kref+0x1b4c:   	st	%f23, [%i0 - 8]
	.word	0xa2db623f	! t0_kref+0x1b50:   	smulcc	%o5, 0x23f, %l1
	.word	0xe828a02a	! t0_kref+0x1b54:   	stb	%l4, [%g2 + 0x2a]
	.word	0xa2aec010	! t0_kref+0x1b58:   	andncc	%i3, %l0, %l1
	.word	0x8143c000	! t0_kref+0x1b5c:   	stbar
	.word	0xe1be1888	! t0_kref+0x1b60:   	stda	%f16, [%i0 + %o0]0xc4
	.word	0x81dc3fc9	! t0_kref+0x1b64:   	flush	%l0 - 0x37
	.word	0x91b00f12	! t0_kref+0x1b68:   	fsrc2	%f18, %f8
	.word	0xa1b70c54	! t0_kref+0x1b6c:   	fnor	%f28, %f20, %f16
	.word	0xcd20a000	! t0_kref+0x1b70:   	st	%f6, [%g2]
	.word	0xe256c018	! t0_kref+0x1b74:   	ldsh	[%i3 + %i0], %l1
	.word	0xa2dda9a0	! t0_kref+0x1b78:   	smulcc	%l6, 0x9a0, %l1
	.word	0xb5b3097c	! t0_kref+0x1b7c:   	fpmerge	%f12, %f28, %f26
	.word	0xa28ee814	! t0_kref+0x1b80:   	andcc	%i3, 0x814, %l1
	.word	0xa2880011	! t0_kref+0x1b84:   	andcc	%g0, %l1, %l1
	.word	0xe248a01b	! t0_kref+0x1b88:   	ldsb	[%g2 + 0x1b], %l1
	.word	0xa1b34cb3	! t0_kref+0x1b8c:   	fandnot2s	%f13, %f19, %f16
	.word	0x2a480007	! t0_kref+0x1b90:   	bcs,a,pt	%icc, _kref+0x1bac
	.word	0xa3b2c056	! t0_kref+0x1b94:   	edge8l	%o3, %l6, %l1
	.word	0xf1ee101a	! t0_kref+0x1b98:   	prefetcha	%i0 + %i2, 24
	.word	0xe2163ff2	! t0_kref+0x1b9c:   	lduh	[%i0 - 0xe], %l1
	.word	0xa9a20952	! t0_kref+0x1ba0:   	fmuld	%f8, %f18, %f20
	.word	0xc028a029	! t0_kref+0x1ba4:   	clrb	[%g2 + 0x29]
	.word	0x29480004	! t0_kref+0x1ba8:   	fbl,a,pt	%fcc0, _kref+0x1bb8
	.word	0xf106401c	! t0_kref+0x1bac:   	ld	[%i1 + %i4], %f24
	.word	0xa20477c7	! t0_kref+0x1bb0:   	add	%l1, -0x839, %l1
	.word	0x8db70c98	! t0_kref+0x1bb4:   	fandnot2	%f28, %f24, %f6
	.word	0xa2168009	! t0_kref+0x1bb8:   	or	%i2, %o1, %l1
	call	SYM(t0_subr3)
	.word	0x81dd31ab	! t0_kref+0x1bc0:   	flush	%l4 - 0xe55
	.word	0x95a0054a	! t0_kref+0x1bc4:   	fsqrtd	%f10, %f10
	.word	0x2e800005	! t0_kref+0x1bc8:   	bvs,a	_kref+0x1bdc
	.word	0xc020a020	! t0_kref+0x1bcc:   	clr	[%g2 + 0x20]
	.word	0x99a00554	! t0_kref+0x1bd0:   	fsqrtd	%f20, %f12
	.word	0xa244aa3f	! t0_kref+0x1bd4:   	addc	%l2, 0xa3f, %l1
	.word	0xf428a019	! t0_kref+0x1bd8:   	stb	%i2, [%g2 + 0x19]
	.word	0x38800002	! t0_kref+0x1bdc:   	bgu,a	_kref+0x1be4
	.word	0xe2063ff8	! t0_kref+0x1be0:   	ld	[%i0 - 8], %l1
	.word	0x33800007	! t0_kref+0x1be4:   	fbe,a	_kref+0x1c00
	.word	0xd9067fec	! t0_kref+0x1be8:   	ld	[%i1 - 0x14], %f12
	.word	0x26800007	! t0_kref+0x1bec:   	bl,a	_kref+0x1c08
	.word	0xd53e2000	! t0_kref+0x1bf0:   	std	%f10, [%i0]
	.word	0xc12e2014	! t0_kref+0x1bf4:   	st	%fsr, [%i0 + 0x14]
	.word	0x9db18ed2	! t0_kref+0x1bf8:   	fornot2	%f6, %f18, %f14
	.word	0x29800004	! t0_kref+0x1bfc:   	fbl,a	_kref+0x1c0c
	.word	0x81824000	! t0_kref+0x1c00:   	wr	%o1, %g0, %y
	.word	0xe248a02a	! t0_kref+0x1c04:   	ldsb	[%g2 + 0x2a], %l1
	.word	0xe2563fee	! t0_kref+0x1c08:   	ldsh	[%i0 - 0x12], %l1
	.word	0x9db44710	! t0_kref+0x1c0c:   	fmuld8sux16	%f17, %f16, %f14
	.word	0xe41e001d	! t0_kref+0x1c10:   	ldd	[%i0 + %i5], %l2
	.word	0xcd86501c	! t0_kref+0x1c14:   	lda	[%i1 + %i4]0x80, %f6
	.word	0x91a00548	! t0_kref+0x1c18:   	fsqrtd	%f8, %f8
	.word	0xc5ee5010	! t0_kref+0x1c1c:   	prefetcha	%i1 + %l0, 2
	.word	0x28480006	! t0_kref+0x1c20:   	bleu,a,pt	%icc, _kref+0x1c38
	.word	0xa2bdb237	! t0_kref+0x1c24:   	xnorcc	%l6, -0xdc9, %l1
	.word	0xa3b54048	! t0_kref+0x1c28:   	edge8l	%l5, %o0, %l1
	.word	0xe240a030	! t0_kref+0x1c2c:   	ldsw	[%g2 + 0x30], %l1
	.word	0xa330200d	! t0_kref+0x1c30:   	srl	%g0, 0xd, %l1
	.word	0xa2adc01b	! t0_kref+0x1c34:   	andncc	%l7, %i3, %l1
	.word	0x9de3bfa0	! t0_kref+0x1c38:   	save	%sp, -0x60, %sp
	.word	0xbab7401c	! t0_kref+0x1c3c:   	orncc	%i5, %i4, %i5
	.word	0xa3ee801b	! t0_kref+0x1c40:   	restore	%i2, %i3, %l1
	.word	0x22800005	! t0_kref+0x1c44:   	be,a	_kref+0x1c58
	.word	0xa2dec011	! t0_kref+0x1c48:   	smulcc	%i3, %l1, %l1
	.word	0xa27d001b	! t0_kref+0x1c4c:   	sdiv	%l4, %i3, %l1
	.word	0x9bb50daa	! t0_kref+0x1c50:   	fxors	%f20, %f10, %f13
	.word	0x91b40edc	! t0_kref+0x1c54:   	fornot2	%f16, %f28, %f8
	.word	0xa204401a	! t0_kref+0x1c58:   	add	%l1, %i2, %l1
	.word	0xdd20a010	! t0_kref+0x1c5c:   	st	%f14, [%g2 + 0x10]
	.word	0xe2564000	! t0_kref+0x1c60:   	ldsh	[%i1], %l1
	.word	0xe248a012	! t0_kref+0x1c64:   	ldsb	[%g2 + 0x12], %l1
	.word	0x8fa388b3	! t0_kref+0x1c68:   	fsubs	%f14, %f19, %f7
	.word	0x9db68d18	! t0_kref+0x1c6c:   	fandnot1	%f26, %f24, %f14
	.word	0x26800006	! t0_kref+0x1c70:   	bl,a	_kref+0x1c88
	.word	0xa28c400a	! t0_kref+0x1c74:   	andcc	%l1, %o2, %l1
	.word	0xdd1fbc48	! t0_kref+0x1c78:   	ldd	[%fp - 0x3b8], %f14
	.word	0xa2f4c013	! t0_kref+0x1c7c:   	udivcc	%l3, %l3, %l1
	.word	0xe49e5000	! t0_kref+0x1c80:   	ldda	[%i1]0x80, %l2
	.word	0xa29c400c	! t0_kref+0x1c84:   	xorcc	%l1, %o4, %l1
	.word	0xe430a020	! t0_kref+0x1c88:   	sth	%l2, [%g2 + 0x20]
	.word	0x95a0193c	! t0_kref+0x1c8c:   	fstod	%f28, %f10
	.word	0xe2464000	! t0_kref+0x1c90:   	ldsw	[%i1], %l1
	.word	0xf430a030	! t0_kref+0x1c94:   	sth	%i2, [%g2 + 0x30]
	.word	0xa3380010	! t0_kref+0x1c98:   	sra	%g0, %l0, %l1
	.word	0xe100a008	! t0_kref+0x1c9c:   	ld	[%g2 + 8], %f16
	.word	0x81ad8a5c	! t0_kref+0x1ca0:   	fcmpd	%fcc0, %f22, %f28
	.word	0xa1b00f10	! t0_kref+0x1ca4:   	fsrc2	%f16, %f16
	.word	0xa2d8000c	! t0_kref+0x1ca8:   	smulcc	%g0, %o4, %l1
	.word	0xe208a010	! t0_kref+0x1cac:   	ldub	[%g2 + 0x10], %l1
	.word	0xf9200018	! t0_kref+0x1cb0:   	st	%f28, [%g0 + %i0]
	.word	0xa9b68d88	! t0_kref+0x1cb4:   	fxor	%f26, %f8, %f20
	.word	0xfb20a020	! t0_kref+0x1cb8:   	st	%f29, [%g2 + 0x20]
	.word	0x81dac013	! t0_kref+0x1cbc:   	flush	%o3 + %l3
	.word	0xa9b28f56	! t0_kref+0x1cc0:   	fornot1	%f10, %f22, %f20
	.word	0xa2f325d3	! t0_kref+0x1cc4:   	udivcc	%o4, 0x5d3, %l1
	.word	0xa2336c5b	! t0_kref+0x1cc8:   	orn	%o5, 0xc5b, %l1
	.word	0xa22aa8c9	! t0_kref+0x1ccc:   	andn	%o2, 0x8c9, %l1
	.word	0xafa00036	! t0_kref+0x1cd0:   	fmovs	%f22, %f23
	.word	0xada5894a	! t0_kref+0x1cd4:   	fmuld	%f22, %f10, %f22
	.word	0x9da01a38	! t0_kref+0x1cd8:   	fstoi	%f24, %f14
	.word	0xa3b20050	! t0_kref+0x1cdc:   	edge8l	%o0, %l0, %l1
	.word	0x29800004	! t0_kref+0x1ce0:   	fbl,a	_kref+0x1cf0
	.word	0xebee501c	! t0_kref+0x1ce4:   	prefetcha	%i1 + %i4, 21
	.word	0xbbb5cd2e	! t0_kref+0x1ce8:   	fandnot1s	%f23, %f14, %f29
	.word	0xd920a000	! t0_kref+0x1cec:   	st	%f12, [%g2]
	.word	0x3b800008	! t0_kref+0x1cf0:   	fble,a	_kref+0x1d10
	.word	0xe41e3ff0	! t0_kref+0x1cf4:   	ldd	[%i0 - 0x10], %l2
	.word	0x2e480006	! t0_kref+0x1cf8:   	bvs,a,pt	%icc, _kref+0x1d10
	.word	0xf51fbc78	! t0_kref+0x1cfc:   	ldd	[%fp - 0x388], %f26
	.word	0xaba01a30	! t0_kref+0x1d00:   	fstoi	%f16, %f21
	.word	0xc81f4000	! t0_kref+0x1d04:   	ldd	[%i5], %g4
	.word	0xa2a22b01	! t0_kref+0x1d08:   	subcc	%o0, 0xb01, %l1
	.word	0xb1a018ca	! t0_kref+0x1d0c:   	fdtos	%f10, %f24
	.word	0xa33dc01b	! t0_kref+0x1d10:   	sra	%l7, %i3, %l1
	.word	0x91a20854	! t0_kref+0x1d14:   	faddd	%f8, %f20, %f8
	.word	0xe2d81018	! t0_kref+0x1d18:   	ldxa	[%g0 + %i0]0x80, %l1
	.word	0xb1a68950	! t0_kref+0x1d1c:   	fmuld	%f26, %f16, %f24
	.word	0xf51fbe10	! t0_kref+0x1d20:   	ldd	[%fp - 0x1f0], %f26
	.word	0xa9b50edc	! t0_kref+0x1d24:   	fornot2	%f20, %f28, %f20
	.word	0xa212650c	! t0_kref+0x1d28:   	or	%o1, 0x50c, %l1
	.word	0xa25d8015	! t0_kref+0x1d2c:   	smul	%l6, %l5, %l1
	.word	0x26800001	! t0_kref+0x1d30:   	bl,a	_kref+0x1d34
	.word	0x8584c014	! t0_kref+0x1d34:   	wr	%l3, %l4, %ccr
	.word	0x31480006	! t0_kref+0x1d38:   	fba,a,pt	%fcc0, _kref+0x1d50
	.word	0xa9b5c72e	! t0_kref+0x1d3c:   	fmuld8ulx16	%f23, %f14, %f20
	.word	0xe2d81019	! t0_kref+0x1d40:   	ldxa	[%g0 + %i1]0x80, %l1
	.word	0xa2bb3429	! t0_kref+0x1d44:   	xnorcc	%o4, -0xbd7, %l1
	.word	0xee28a012	! t0_kref+0x1d48:   	stb	%l7, [%g2 + 0x12]
	.word	0xe256401b	! t0_kref+0x1d4c:   	ldsh	[%i1 + %i3], %l1
	.word	0xb1b00cd4	! t0_kref+0x1d50:   	fnot2	%f20, %f24
	.word	0xf207bfe0	! t0_kref+0x1d54:   	ld	[%fp - 0x20], %i1
	.word	0xa210001b	! t0_kref+0x1d58:   	mov	%i3, %l1
	.word	0xa2e3400d	! t0_kref+0x1d5c:   	subccc	%o5, %o5, %l1
	.word	0x81aa0a36	! t0_kref+0x1d60:   	fcmps	%fcc0, %f8, %f22
	.word	0xa29d400a	! t0_kref+0x1d64:   	xorcc	%l5, %o2, %l1
	.word	0xa2326a9f	! t0_kref+0x1d68:   	orn	%o1, 0xa9f, %l1
	.word	0xd220a028	! t0_kref+0x1d6c:   	st	%o1, [%g2 + 0x28]
	.word	0x95b009b2	! t0_kref+0x1d70:   	fexpand	%f18, %f10
	.word	0xee28a02a	! t0_kref+0x1d74:   	stb	%l7, [%g2 + 0x2a]
	.word	0x91a000ae	! t0_kref+0x1d78:   	fnegs	%f14, %f8
	.word	0xf900a018	! t0_kref+0x1d7c:   	ld	[%g2 + 0x18], %f28
	.word	0x81ae4aa6	! t0_kref+0x1d80:   	fcmpes	%fcc0, %f25, %f6
	.word	0x8186c000	! t0_kref+0x1d84:   	wr	%i3, %g0, %y
	.word	0x2d480002	! t0_kref+0x1d88:   	fbg,a,pt	%fcc0, _kref+0x1d90
	.word	0x93a000ba	! t0_kref+0x1d8c:   	fnegs	%f26, %f9
	.word	0xa1a00546	! t0_kref+0x1d90:   	fsqrtd	%f6, %f16
	.word	0xa21c800a	! t0_kref+0x1d94:   	xor	%l2, %o2, %l1
	.word	0x9de3bfa0	! t0_kref+0x1d98:   	save	%sp, -0x60, %sp
	.word	0xb8c66b87	! t0_kref+0x1d9c:   	addccc	%i1, 0xb87, %i4
	.word	0xa3ee8018	! t0_kref+0x1da0:   	restore	%i2, %i0, %l1
	.word	0xec20a008	! t0_kref+0x1da4:   	st	%l6, [%g2 + 8]
	.word	0xa2f47df7	! t0_kref+0x1da8:   	udivcc	%l1, -0x209, %l1
	.word	0x9db18ec8	! t0_kref+0x1dac:   	fornot2	%f6, %f8, %f14
	.word	0xa3b34240	! t0_kref+0x1db0:   	array16	%o5, %g0, %l1
	.word	0xa2d5f3de	! t0_kref+0x1db4:   	umulcc	%l7, -0xc22, %l1
	.word	0xa2ad000d	! t0_kref+0x1db8:   	andncc	%l4, %o5, %l1
	.word	0xa25ef792	! t0_kref+0x1dbc:   	smul	%i3, -0x86e, %l1
	.word	0xa22cb238	! t0_kref+0x1dc0:   	andn	%l2, -0xdc8, %l1
	.word	0xa29a000c	! t0_kref+0x1dc4:   	xorcc	%o0, %o4, %l1
	sethi	%hi(2f), %o7
	.word	0xe40be214	! t0_kref+0x1dcc:   	ldub	[%o7 + 0x214], %l2
	.word	0xa41ca00c	! t0_kref+0x1dd0:   	xor	%l2, 0xc, %l2
	.word	0xe42be214	! t0_kref+0x1dd4:   	stb	%l2, [%o7 + 0x214]
	.word	0x81dbe214	! t0_kref+0x1dd8:   	flush	%o7 + 0x214
	.word	0xb5b68754	! t0_kref+0x1ddc:   	fpack32	%f26, %f20, %f26
	.word	0xa9aa8054	! t0_kref+0x1de0:   	fmovdue	%fcc0, %f20, %f20
	.word	0xe3b8a040	! t0_kref+0x1de4:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xa7b68f67	! t0_kref+0x1de8:   	fornot1s	%f26, %f7, %f19
	.word	0xafb20c77	! t0_kref+0x1dec:   	fnors	%f8, %f23, %f23
	.word	0xa21c2c95	! t0_kref+0x1df0:   	xor	%l0, 0xc95, %l1
	.word	0xf628a003	! t0_kref+0x1df4:   	stb	%i3, [%g2 + 3]
	.word	0xa296b959	! t0_kref+0x1df8:   	orcc	%i2, -0x6a7, %l1
	.word	0xe3b8a040	! t0_kref+0x1dfc:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xa20270ab	! t0_kref+0x1e00:   	add	%o1, -0xf55, %l1
	.word	0xc1f61011	! t0_kref+0x1e04:   	casxa	[%i0]0x80, %l1, %g0
	.word	0xafb4cc67	! t0_kref+0x1e08:   	fnors	%f19, %f7, %f23
	.word	0x24800003	! t0_kref+0x1e0c:   	ble,a	_kref+0x1e18
	.word	0xb1a48958	! t0_kref+0x1e10:   	fmuld	%f18, %f24, %f24
2:	.word	0xe4a71018	! t0_kref+0x1e14:   	sta	%l2, [%i4 + %i0]0x80
	.word	0x33480002	! t0_kref+0x1e18:   	fbe,a,pt	%fcc0, _kref+0x1e20
	.word	0xa5a50856	! t0_kref+0x1e1c:   	faddd	%f20, %f22, %f18
	.word	0x81af0a4a	! t0_kref+0x1e20:   	fcmpd	%fcc0, %f28, %f10
	.word	0xa2e4a75b	! t0_kref+0x1e24:   	subccc	%l2, 0x75b, %l1
	.word	0xa275c013	! t0_kref+0x1e28:   	udiv	%l7, %l3, %l1
	.word	0x95b00c20	! t0_kref+0x1e2c:   	fzeros	%f10
	.word	0x3c800006	! t0_kref+0x1e30:   	bpos,a	_kref+0x1e48
	.word	0x99a708d4	! t0_kref+0x1e34:   	fsubd	%f28, %f20, %f12
	.word	0xe700a030	! t0_kref+0x1e38:   	ld	[%g2 + 0x30], %f19
	.word	0xa333200b	! t0_kref+0x1e3c:   	srl	%o4, 0xb, %l1
	.word	0xc9bf5a18	! t0_kref+0x1e40:   	stda	%f4, [%i5 + %i0]0xd0
	.word	0xa5a01887	! t0_kref+0x1e44:   	fitos	%f7, %f18
	.word	0x3c480004	! t0_kref+0x1e48:   	bpos,a,pt	%icc, _kref+0x1e58
	.word	0xf5070018	! t0_kref+0x1e4c:   	ld	[%i4 + %i0], %f26
	.word	0x2d800008	! t0_kref+0x1e50:   	fbg,a	_kref+0x1e70
	.word	0xb9b00fe0	! t0_kref+0x1e54:   	fones	%f28
	.word	0xa32327fd	! t0_kref+0x1e58:   	mulscc	%o4, 0x7fd, %l1
	.word	0xa9a38854	! t0_kref+0x1e5c:   	faddd	%f14, %f20, %f20
	.word	0x8143c000	! t0_kref+0x1e60:   	stbar
	.word	0x34800002	! t0_kref+0x1e64:   	bg,a	_kref+0x1e6c
	.word	0xe216c019	! t0_kref+0x1e68:   	lduh	[%i3 + %i1], %l1
	.word	0xd91fbcb8	! t0_kref+0x1e6c:   	ldd	[%fp - 0x348], %f12
	.word	0x22800003	! t0_kref+0x1e70:   	be,a	_kref+0x1e7c
	.word	0xa2f2c009	! t0_kref+0x1e74:   	udivcc	%o3, %o1, %l1
	.word	0xeaae1000	! t0_kref+0x1e78:   	stba	%l5, [%i0]0x80
	.word	0xa1b00cfd	! t0_kref+0x1e7c:   	fnot2s	%f29, %f16
	.word	0xf720a018	! t0_kref+0x1e80:   	st	%f27, [%g2 + 0x18]
	.word	0xb1b18f46	! t0_kref+0x1e84:   	fornot1	%f6, %f6, %f24
	.word	0xa25ec017	! t0_kref+0x1e88:   	smul	%i3, %l7, %l1
	.word	0xa1b18ea0	! t0_kref+0x1e8c:   	fsrc1s	%f6, %f16
	.word	0xa29cf442	! t0_kref+0x1e90:   	xorcc	%l3, -0xbbe, %l1
	.word	0xe200a010	! t0_kref+0x1e94:   	ld	[%g2 + 0x10], %l1
	.word	0xb3a018ce	! t0_kref+0x1e98:   	fdtos	%f14, %f25
	call	1f
	.empty
	.word	0xe220a038	! t0_kref+0x1ea0:   	st	%l1, [%g2 + 0x38]
	.word	0xa2a5401a	! t0_kref+0x1ea4:   	subcc	%l5, %i2, %l1
1:	.word	0x8db3cc77	! t0_kref+0x1ea8:   	fnors	%f15, %f23, %f6
	.word	0xa2e4fcdb	! t0_kref+0x1eac:   	subccc	%l3, -0x325, %l1
	call	SYM(t0_subr1)
	.word	0xa25c001b	! t0_kref+0x1eb4:   	smul	%l0, %i3, %l1
	.word	0xa25b6abe	! t0_kref+0x1eb8:   	smul	%o5, 0xabe, %l1
	.word	0x9da01917	! t0_kref+0x1ebc:   	fitod	%f23, %f14
	.word	0xb1a0014c	! t0_kref+0x1ec0:   	fabsd	%f12, %f24
	.word	0xb1a0054a	! t0_kref+0x1ec4:   	fsqrtd	%f10, %f24
	.word	0xa1a0188f	! t0_kref+0x1ec8:   	fitos	%f15, %f16
	.word	0xa3a01a26	! t0_kref+0x1ecc:   	fstoi	%f6, %f17
	.word	0x8143c000	! t0_kref+0x1ed0:   	stbar
	.word	0x24800005	! t0_kref+0x1ed4:   	ble,a	_kref+0x1ee8
	.word	0xa28d6869	! t0_kref+0x1ed8:   	andcc	%l5, 0x869, %l1
	.word	0x36800003	! t0_kref+0x1edc:   	bge,a	_kref+0x1ee8
	.word	0xa2e02df2	! t0_kref+0x1ee0:   	subccc	%g0, 0xdf2, %l1
	.word	0xa2a2b230	! t0_kref+0x1ee4:   	subcc	%o2, -0xdd0, %l1
	.word	0xa1a588da	! t0_kref+0x1ee8:   	fsubd	%f22, %f26, %f16
	.word	0x8db28d10	! t0_kref+0x1eec:   	fandnot1	%f10, %f16, %f6
	.word	0xdbe6500a	! t0_kref+0x1ef0:   	casa	[%i1]0x80, %o2, %o5
	.word	0xa2dd7cc4	! t0_kref+0x1ef4:   	smulcc	%l5, -0x33c, %l1
	.word	0xa2ba2664	! t0_kref+0x1ef8:   	xnorcc	%o0, 0x664, %l1
	.word	0xa2130012	! t0_kref+0x1efc:   	or	%o4, %l2, %l1
	.word	0xb5a0052f	! t0_kref+0x1f00:   	fsqrts	%f15, %f26
	.word	0xee20a000	! t0_kref+0x1f04:   	st	%l7, [%g2]
	.word	0xe210a020	! t0_kref+0x1f08:   	lduh	[%g2 + 0x20], %l1
	.word	0xb1a58946	! t0_kref+0x1f0c:   	fmuld	%f22, %f6, %f24
	.word	0xa33d8017	! t0_kref+0x1f10:   	sra	%l6, %l7, %l1
	.word	0x32800008	! t0_kref+0x1f14:   	bne,a	_kref+0x1f34
	.word	0xa3b68316	! t0_kref+0x1f18:   	alignaddr	%i2, %l6, %l1
	.word	0xa21533fb	! t0_kref+0x1f1c:   	or	%l4, -0xc05, %l1
	.word	0xa22cc017	! t0_kref+0x1f20:   	andn	%l3, %l7, %l1
	.word	0xe5264000	! t0_kref+0x1f24:   	st	%f18, [%i1]
	.word	0xb1b00fc0	! t0_kref+0x1f28:   	fone	%f24
	.word	0x8143c000	! t0_kref+0x1f2c:   	stbar
	.word	0x8d840000	! t0_kref+0x1f30:   	wr	%l0, %g0, %fprs
	.word	0xa2403751	! t0_kref+0x1f34:   	addc	%g0, -0x8af, %l1
	.word	0xe248a020	! t0_kref+0x1f38:   	ldsb	[%g2 + 0x20], %l1
	.word	0x9da01927	! t0_kref+0x1f3c:   	fstod	%f7, %f14
	.word	0xf700a018	! t0_kref+0x1f40:   	ld	[%g2 + 0x18], %f27
	.word	0xb9b60e46	! t0_kref+0x1f44:   	fxnor	%f24, %f6, %f28
	.word	0xe26e8019	! t0_kref+0x1f48:   	ldstub	[%i2 + %i1], %l1
	.word	0xdba71019	! t0_kref+0x1f4c:   	sta	%f13, [%i4 + %i1]0x80
	.word	0xe2080019	! t0_kref+0x1f50:   	ldub	[%g0 + %i1], %l1
	.word	0xf11fbf20	! t0_kref+0x1f54:   	ldd	[%fp - 0xe0], %f24
	.word	0x26800008	! t0_kref+0x1f58:   	bl,a	_kref+0x1f78
	.word	0xa3b18546	! t0_kref+0x1f5c:   	fcmpeq16	%f6, %f6, %l1
	.word	0xda7f0000	! t0_kref+0x1f60:   	swap	[%i4], %o5
	.word	0xea2e401a	! t0_kref+0x1f64:   	stb	%l5, [%i1 + %i2]
	.word	0xa5a0192d	! t0_kref+0x1f68:   	fstod	%f13, %f18
	.word	0x9db60e80	! t0_kref+0x1f6c:   	fsrc1	%f24, %f14
	.word	0xe81e001d	! t0_kref+0x1f70:   	ldd	[%i0 + %i5], %l4
	.word	0xe2566014	! t0_kref+0x1f74:   	ldsh	[%i1 + 0x14], %l1
	.word	0xf920a000	! t0_kref+0x1f78:   	st	%f28, [%g2]
	.word	0x95b48dc8	! t0_kref+0x1f7c:   	fnand	%f18, %f8, %f10
	.word	0xa242c015	! t0_kref+0x1f80:   	addc	%o3, %l5, %l1
	.word	0x2e800003	! t0_kref+0x1f84:   	bvs,a	_kref+0x1f90
	.word	0xa29d800a	! t0_kref+0x1f88:   	xorcc	%l6, %o2, %l1
	.word	0xa3a38934	! t0_kref+0x1f8c:   	fmuls	%f14, %f20, %f17
	.word	0x001fffff	! t0_kref+0x1f90:   	illtrap	0x1fffff
	.word	0xd036200a	! t0_kref+0x1f94:   	sth	%o0, [%i0 + 0xa]
	.word	0xa3b40336	! t0_kref+0x1f98:   	bmask	%l0, %l6, %l1
	.word	0xa3b185d4	! t0_kref+0x1f9c:   	fcmpeq32	%f6, %f20, %l1
	.word	0xa25a79e5	! t0_kref+0x1fa0:   	smul	%o1, -0x61b, %l1
	.word	0xa5b68d40	! t0_kref+0x1fa4:   	fnot1	%f26, %f18
	.word	0x2d480003	! t0_kref+0x1fa8:   	fbg,a,pt	%fcc0, _kref+0x1fb4
	.word	0xd020a010	! t0_kref+0x1fac:   	st	%o0, [%g2 + 0x10]
	.word	0xeb06401c	! t0_kref+0x1fb0:   	ld	[%i1 + %i4], %f21
	.word	0x81ac8a46	! t0_kref+0x1fb4:   	fcmpd	%fcc0, %f18, %f6
	.word	0x9da00554	! t0_kref+0x1fb8:   	fsqrtd	%f20, %f14
	.word	0x99a01887	! t0_kref+0x1fbc:   	fitos	%f7, %f12
	.word	0x8143c000	! t0_kref+0x1fc0:   	stbar
	.word	0x99a01939	! t0_kref+0x1fc4:   	fstod	%f25, %f12
	.word	0x3e480007	! t0_kref+0x1fc8:   	bvc,a,pt	%icc, _kref+0x1fe4
	.word	0xe2d81018	! t0_kref+0x1fcc:   	ldxa	[%g0 + %i0]0x80, %l1
	.word	0xa2e5341b	! t0_kref+0x1fd0:   	subccc	%l4, -0xbe5, %l1
	.word	0xa28c6876	! t0_kref+0x1fd4:   	andcc	%l1, 0x876, %l1
	.word	0xcf270018	! t0_kref+0x1fd8:   	st	%f7, [%i4 + %i0]
	.word	0xa2348000	! t0_kref+0x1fdc:   	orn	%l2, %g0, %l1
	.word	0xb9a00138	! t0_kref+0x1fe0:   	fabss	%f24, %f28
	.word	0xa3700011	! t0_kref+0x1fe4:   	popc	%l1, %l1
	.word	0xea30a020	! t0_kref+0x1fe8:   	sth	%l5, [%g2 + 0x20]
	.word	0xd8270018	! t0_kref+0x1fec:   	st	%o4, [%i4 + %i0]
	.word	0xa2f54010	! t0_kref+0x1ff0:   	udivcc	%l5, %l0, %l1
	.word	0x2c800005	! t0_kref+0x1ff4:   	bneg,a	_kref+0x2008
	.word	0xb9a0189b	! t0_kref+0x1ff8:   	fitos	%f27, %f28
	.word	0x81ae8ab0	! t0_kref+0x1ffc:   	fcmpes	%fcc0, %f26, %f16
	.word	0xd700a010	! t0_kref+0x2000:   	ld	[%g2 + 0x10], %f11
	.word	0xa2720008	! t0_kref+0x2004:   	udiv	%o0, %o0, %l1
	.word	0x3f480002	! t0_kref+0x2008:   	fbo,a,pt	%fcc0, _kref+0x2010
	.word	0xd46e001a	! t0_kref+0x200c:   	ldstub	[%i0 + %i2], %o2
	.word	0xa21ae25c	! t0_kref+0x2010:   	xor	%o3, 0x25c, %l1
	.word	0xa32b6006	! t0_kref+0x2014:   	sll	%o5, 0x6, %l1
	.word	0xdb066000	! t0_kref+0x2018:   	ld	[%i1], %f13
	.word	0xd7e61010	! t0_kref+0x201c:   	casa	[%i0]0x80, %l0, %o3
	.word	0xe24e2012	! t0_kref+0x2020:   	ldsb	[%i0 + 0x12], %l1
	.word	0x28800001	! t0_kref+0x2024:   	bleu,a	_kref+0x2028
	.word	0xa25abc99	! t0_kref+0x2028:   	smul	%o2, -0x367, %l1
	.word	0xada01031	! t0_kref+0x202c:   	fstox	%f17, %f22
	.word	0xa2927894	! t0_kref+0x2030:   	orcc	%o1, -0x76c, %l1
	.word	0xf420a010	! t0_kref+0x2034:   	st	%i2, [%g2 + 0x10]
	.word	0xa2e6c011	! t0_kref+0x2038:   	subccc	%i3, %l1, %l1
	.word	0xa33a6000	! t0_kref+0x203c:   	sra	%o1, 0x0, %l1
	.word	0xec20a000	! t0_kref+0x2040:   	st	%l6, [%g2]
	.word	0xa200229f	! t0_kref+0x2044:   	add	%g0, 0x29f, %l1
	.word	0xe286501c	! t0_kref+0x2048:   	lda	[%i1 + %i4]0x80, %l1
	.word	0xd2680019	! t0_kref+0x204c:   	ldstub	[%g0 + %i1], %o1
	.word	0xa338201f	! t0_kref+0x2050:   	sra	%g0, 0x1f, %l1
	.word	0xa33a4009	! t0_kref+0x2054:   	sra	%o1, %o1, %l1
	.word	0xe248a030	! t0_kref+0x2058:   	ldsb	[%g2 + 0x30], %l1
	.word	0xe2067ff4	! t0_kref+0x205c:   	ld	[%i1 - 0xc], %l1
	.word	0xa9b28def	! t0_kref+0x2060:   	fnands	%f10, %f15, %f20
	.word	0xe2961000	! t0_kref+0x2064:   	lduha	[%i0]0x80, %l1
	.word	0x8fb3caa9	! t0_kref+0x2068:   	fpsub16s	%f15, %f9, %f7
	.word	0xa1b4cea0	! t0_kref+0x206c:   	fsrc1s	%f19, %f16
	.word	0x81aa8a58	! t0_kref+0x2070:   	fcmpd	%fcc0, %f10, %f24
	.word	0xe4300019	! t0_kref+0x2074:   	sth	%l2, [%g0 + %i1]
	.word	0x81dd26e0	! t0_kref+0x2078:   	flush	%l4 + 0x6e0
	.word	0xfbee501a	! t0_kref+0x207c:   	prefetcha	%i1 + %i2, 29
	.word	0xa3b28418	! t0_kref+0x2080:   	fcmple16	%f10, %f24, %l1
	.word	0xd62e0000	! t0_kref+0x2084:   	stb	%o3, [%i0]
	.word	0xe200a010	! t0_kref+0x2088:   	ld	[%g2 + 0x10], %l1
	.word	0xeb200019	! t0_kref+0x208c:   	st	%f21, [%g0 + %i1]
	.word	0x97b00cea	! t0_kref+0x2090:   	fnot2s	%f10, %f11
	.word	0xec280018	! t0_kref+0x2094:   	stb	%l6, [%g0 + %i0]
	.word	0xa33e800c	! t0_kref+0x2098:   	sra	%i2, %o4, %l1
	.word	0x81840000	! t0_kref+0x209c:   	wr	%l0, %g0, %y
	.word	0x8fb28e79	! t0_kref+0x20a0:   	fxnors	%f10, %f25, %f7
	.word	0x001fffff	! t0_kref+0x20a4:   	illtrap	0x1fffff
	.word	0x99a0002e	! t0_kref+0x20a8:   	fmovs	%f14, %f12
	.word	0xaba6092b	! t0_kref+0x20ac:   	fmuls	%f24, %f11, %f21
	.word	0xa2aa4012	! t0_kref+0x20b0:   	andncc	%o1, %l2, %l1
	.word	0xa2da3bc7	! t0_kref+0x20b4:   	smulcc	%o0, -0x439, %l1
	.word	0x8db58f58	! t0_kref+0x20b8:   	fornot1	%f22, %f24, %f6
	.word	0xe200a030	! t0_kref+0x20bc:   	ld	[%g2 + 0x30], %l1
	.word	0xa3b50068	! t0_kref+0x20c0:   	edge8ln	%l4, %o0, %l1
	.word	0x8143e040	! t0_kref+0x20c4:   	membar	0x40
	.word	0x23352795	! t0_kref+0x20c8:   	sethi	%hi(0xd49e5400), %l1
	.word	0xe2100018	! t0_kref+0x20cc:   	lduh	[%g0 + %i0], %l1
	.word	0xe2266008	! t0_kref+0x20d0:   	st	%l1, [%i1 + 8]
	.word	0xb5a00558	! t0_kref+0x20d4:   	fsqrtd	%f24, %f26
	.word	0x25480001	! t0_kref+0x20d8:   	fblg,a,pt	%fcc0, _kref+0x20dc
	.word	0xb3a0053d	! t0_kref+0x20dc:   	fsqrts	%f29, %f25
	.word	0xa282c017	! t0_kref+0x20e0:   	addcc	%o3, %l7, %l1
	.word	0x81af0a54	! t0_kref+0x20e4:   	fcmpd	%fcc0, %f28, %f20
	.word	0xa33b6014	! t0_kref+0x20e8:   	sra	%o5, 0x14, %l1
	.word	0x9da01927	! t0_kref+0x20ec:   	fstod	%f7, %f14
	.word	0xa2e5f45a	! t0_kref+0x20f0:   	subccc	%l7, -0xba6, %l1
	.word	0x8584a06b	! t0_kref+0x20f4:   	wr	%l2, 0x6b, %ccr
	.word	0xada0190c	! t0_kref+0x20f8:   	fitod	%f12, %f22
	.word	0xa232c017	! t0_kref+0x20fc:   	orn	%o3, %l7, %l1
	.word	0x95a6084e	! t0_kref+0x2100:   	faddd	%f24, %f14, %f10
	.word	0xa22cc00a	! t0_kref+0x2104:   	andn	%l3, %o2, %l1
	.word	0x8da0188e	! t0_kref+0x2108:   	fitos	%f14, %f6
	.word	0x3d800001	! t0_kref+0x210c:   	fbule,a	_kref+0x2110
	.word	0xa2a4000b	! t0_kref+0x2110:   	subcc	%l0, %o3, %l1
	.word	0xe248a029	! t0_kref+0x2114:   	ldsb	[%g2 + 0x29], %l1
	.word	0xcf270019	! t0_kref+0x2118:   	st	%f7, [%i4 + %i1]
	.word	0xa2b3401a	! t0_kref+0x211c:   	orncc	%o5, %i2, %l1
	.word	0xa7b20a29	! t0_kref+0x2120:   	fpadd16s	%f8, %f9, %f19
	.word	0xd6ae101a	! t0_kref+0x2124:   	stba	%o3, [%i0 + %i2]0x80
	.word	0x81ae0a3a	! t0_kref+0x2128:   	fcmps	%fcc0, %f24, %f26
	.word	0xe248a000	! t0_kref+0x212c:   	ldsb	[%g2], %l1
	.word	0x99b70e80	! t0_kref+0x2130:   	fsrc1	%f28, %f12
	.word	0xd19e101d	! t0_kref+0x2134:   	ldda	[%i0 + %i5]0x80, %f8
	.word	0xa33a0008	! t0_kref+0x2138:   	sra	%o0, %o0, %l1
	.word	0xa3b20240	! t0_kref+0x213c:   	array16	%o0, %g0, %l1
	.word	0xa3340015	! t0_kref+0x2140:   	srl	%l0, %l5, %l1
	.word	0xe2871018	! t0_kref+0x2144:   	lda	[%i4 + %i0]0x80, %l1
	.word	0xd06e3ff4	! t0_kref+0x2148:   	ldstub	[%i0 - 0xc], %o0
	.word	0xe25e3ff0	! t0_kref+0x214c:   	ldx	[%i0 - 0x10], %l1
	.word	0xb4103fe1	! t0_kref+0x2150:   	mov	0xffffffe1, %i2
	.word	0x95a01908	! t0_kref+0x2154:   	fitod	%f8, %f10
	.word	0xada30952	! t0_kref+0x2158:   	fmuld	%f12, %f18, %f22
	.word	0xe2c01018	! t0_kref+0x215c:   	ldswa	[%g0 + %i0]0x80, %l1
	.word	0xa29a8016	! t0_kref+0x2160:   	xorcc	%o2, %l6, %l1
	.word	0xa2048011	! t0_kref+0x2164:   	add	%l2, %l1, %l1
	.word	0xa340c000	! t0_kref+0x2168:   	mov	%asi, %l1
	.word	0xcf20a038	! t0_kref+0x216c:   	st	%f7, [%g2 + 0x38]
	.word	0xe24e200c	! t0_kref+0x2170:   	ldsb	[%i0 + 0xc], %l1
	.word	0x81daa102	! t0_kref+0x2174:   	flush	%o2 + 0x102
	.word	0xb9a20856	! t0_kref+0x2178:   	faddd	%f8, %f22, %f28
	.word	0xe81f4019	! t0_kref+0x217c:   	ldd	[%i5 + %i1], %l4
	.word	0xe246401c	! t0_kref+0x2180:   	ldsw	[%i1 + %i4], %l1
	.word	0xe66e8019	! t0_kref+0x2184:   	ldstub	[%i2 + %i1], %l3
	.word	0xa5b00f12	! t0_kref+0x2188:   	fsrc2	%f18, %f18
	.word	0x20800006	! t0_kref+0x218c:   	bn,a	_kref+0x21a4
	.word	0xb5a9003d	! t0_kref+0x2190:   	fmovsl	%fcc0, %f29, %f26
	.word	0x8fa208b6	! t0_kref+0x2194:   	fsubs	%f8, %f22, %f7
	.word	0x8da0191b	! t0_kref+0x2198:   	fitod	%f27, %f6
	.word	0xe2901018	! t0_kref+0x219c:   	lduha	[%g0 + %i0]0x80, %l1
	.word	0xa3b18414	! t0_kref+0x21a0:   	fcmple16	%f6, %f20, %l1
	.word	0x9da0055a	! t0_kref+0x21a4:   	fsqrtd	%f26, %f14
	.word	0xa3b20410	! t0_kref+0x21a8:   	fcmple16	%f8, %f16, %l1
	.word	0x97a0052e	! t0_kref+0x21ac:   	fsqrts	%f14, %f11
	.word	0xb5a0189a	! t0_kref+0x21b0:   	fitos	%f26, %f26
	.word	0xa2ad4013	! t0_kref+0x21b4:   	andncc	%l5, %l3, %l1
	.word	0x99a70954	! t0_kref+0x21b8:   	fmuld	%f28, %f20, %f12
	.word	0xe250a010	! t0_kref+0x21bc:   	ldsh	[%g2 + 0x10], %l1
	.word	0x86102003	! t0_kref+0x21c0:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x21c4:   	bne,a	_kref+0x21c4
	.word	0x86a0e001	! t0_kref+0x21c8:   	subcc	%g3, 1, %g3
	.word	0x91a58948	! t0_kref+0x21cc:   	fmuld	%f22, %f8, %f8
	.word	0xd53e2000	! t0_kref+0x21d0:   	std	%f10, [%i0]
	.word	0xb9a0193b	! t0_kref+0x21d4:   	fstod	%f27, %f28
	.word	0xa7a0003d	! t0_kref+0x21d8:   	fmovs	%f29, %f19
	.word	0x8186c000	! t0_kref+0x21dc:   	wr	%i3, %g0, %y
	.word	0xed20a010	! t0_kref+0x21e0:   	st	%f22, [%g2 + 0x10]
	.word	0x20800001	! t0_kref+0x21e4:   	bn,a	_kref+0x21e8
	.word	0xada0192d	! t0_kref+0x21e8:   	fstod	%f13, %f22
	.word	0x9da58d29	! t0_kref+0x21ec:   	fsmuld	%f22, %f9, %f14
	.word	0xa2e54008	! t0_kref+0x21f0:   	subccc	%l5, %o0, %l1
	.word	0xe2063fec	! t0_kref+0x21f4:   	ld	[%i0 - 0x14], %l1
	.word	0xc9ee5015	! t0_kref+0x21f8:   	prefetcha	%i1 + %l5, 4
	.word	0x9da1c93b	! t0_kref+0x21fc:   	fmuls	%f7, %f27, %f14
	.word	0x9db00c00	! t0_kref+0x2200:   	fzero	%f14
	.word	0xa2b24017	! t0_kref+0x2204:   	orncc	%o1, %l7, %l1
	.word	0xa235ef3b	! t0_kref+0x2208:   	orn	%l7, 0xf3b, %l1
	.word	0xa2153f6d	! t0_kref+0x220c:   	or	%l4, -0x93, %l1
	.word	0xe41e401d	! t0_kref+0x2210:   	ldd	[%i1 + %i5], %l2
	.word	0xa3b00011	! t0_kref+0x2214:   	edge8	%g0, %l1, %l1
	.word	0xa2e4c016	! t0_kref+0x2218:   	subccc	%l3, %l6, %l1
	.word	0xf5ee101b	! t0_kref+0x221c:   	prefetcha	%i0 + %i3, 26
	.word	0x91a34d30	! t0_kref+0x2220:   	fsmuld	%f13, %f16, %f8
	.word	0xa212f77e	! t0_kref+0x2224:   	or	%o3, -0x882, %l1
	.word	0xa9a00552	! t0_kref+0x2228:   	fsqrtd	%f18, %f20
	.word	0xa2e5c009	! t0_kref+0x222c:   	subccc	%l7, %o1, %l1
	.word	0xec20a030	! t0_kref+0x2230:   	st	%l6, [%g2 + 0x30]
	.word	0xe248a010	! t0_kref+0x2234:   	ldsb	[%g2 + 0x10], %l1
	.word	0xa33d2013	! t0_kref+0x2238:   	sra	%l4, 0x13, %l1
	.word	0xa2f80008	! t0_kref+0x223c:   	sdivcc	%g0, %o0, %l1
	.word	0x8fb60ea0	! t0_kref+0x2240:   	fsrc1s	%f24, %f7
	.word	0x95a0188b	! t0_kref+0x2244:   	fitos	%f11, %f10
	.word	0xf628a00a	! t0_kref+0x2248:   	stb	%i3, [%g2 + 0xa]
	.word	0xd8680019	! t0_kref+0x224c:   	ldstub	[%g0 + %i1], %o4
	.word	0xf11fbca0	! t0_kref+0x2250:   	ldd	[%fp - 0x360], %f24
	.word	0xa2b24008	! t0_kref+0x2254:   	orncc	%o1, %o0, %l1
	.word	0xa1a01887	! t0_kref+0x2258:   	fitos	%f7, %f16
	.word	0xa1a54939	! t0_kref+0x225c:   	fmuls	%f21, %f25, %f16
	.word	0x9fc00004	! t0_kref+0x2260:   	call	%g0 + %g4
	.word	0xa2b6aa7c	! t0_kref+0x2264:   	orncc	%i2, 0xa7c, %l1
	.word	0xa22375ca	! t0_kref+0x2268:   	sub	%o5, -0xa36, %l1
	.word	0xa2f4282b	! t0_kref+0x226c:   	udivcc	%l0, 0x82b, %l1
	.word	0xa33d4014	! t0_kref+0x2270:   	sra	%l5, %l4, %l1
	.word	0x8610200d	! t0_kref+0x2274:   	mov	0xd, %g3
	.word	0x86a0e001	! t0_kref+0x2278:   	subcc	%g3, 1, %g3
	.word	0x2280001c	! t0_kref+0x227c:   	be,a	_kref+0x22ec
	.word	0xa5b30d40	! t0_kref+0x2280:   	fnot1	%f12, %f18
	.word	0xe420a000	! t0_kref+0x2284:   	st	%l2, [%g2]
	.word	0xef262010	! t0_kref+0x2288:   	st	%f23, [%i0 + 0x10]
	call	SYM(t0_subr1)
	.word	0xa2700014	! t0_kref+0x2290:   	udiv	%g0, %l4, %l1
	.word	0x35480006	! t0_kref+0x2294:   	fbue,a,pt	%fcc0, _kref+0x22ac
	.word	0xa3b54094	! t0_kref+0x2298:   	edge16	%l5, %l4, %l1
	.word	0x9da0188e	! t0_kref+0x229c:   	fitos	%f14, %f14
	.word	0x33480006	! t0_kref+0x22a0:   	fbe,a,pt	%fcc0, _kref+0x22b8
	.word	0xa1a00027	! t0_kref+0x22a4:   	fmovs	%f7, %f16
	.word	0xe248a012	! t0_kref+0x22a8:   	ldsb	[%g2 + 0x12], %l1
	.word	0xa2f4001a	! t0_kref+0x22ac:   	udivcc	%l0, %i2, %l1
	.word	0xe51fbc58	! t0_kref+0x22b0:   	ldd	[%fp - 0x3a8], %f18
	.word	0xede61010	! t0_kref+0x22b4:   	casa	[%i0]0x80, %l0, %l6
	.word	0xafa688bb	! t0_kref+0x22b8:   	fsubs	%f26, %f27, %f23
	.word	0xe248a022	! t0_kref+0x22bc:   	ldsb	[%g2 + 0x22], %l1
	.word	0x8184c000	! t0_kref+0x22c0:   	wr	%l3, %g0, %y
	.word	0xf506601c	! t0_kref+0x22c4:   	ld	[%i1 + 0x1c], %f26
	.word	0xbbb00774	! t0_kref+0x22c8:   	fpack16	%f20, %f29
	.word	0xa29d800c	! t0_kref+0x22cc:   	xorcc	%l6, %o4, %l1
	.word	0xa298000d	! t0_kref+0x22d0:   	xorcc	%g0, %o5, %l1
	.word	0xe7063ffc	! t0_kref+0x22d4:   	ld	[%i0 - 4], %f19
	.word	0xa236c00a	! t0_kref+0x22d8:   	orn	%i3, %o2, %l1
	.word	0xe208a031	! t0_kref+0x22dc:   	ldub	[%g2 + 0x31], %l1
	.word	0x38bfffe6	! t0_kref+0x22e0:   	bgu,a	_kref+0x2278
	.word	0xe2de101d	! t0_kref+0x22e4:   	ldxa	[%i0 + %i5]0x80, %l1
	.word	0xa2330016	! t0_kref+0x22e8:   	orn	%o4, %l6, %l1
	.word	0x28480003	! t0_kref+0x22ec:   	bleu,a,pt	%icc, _kref+0x22f8
	.word	0xa25b0016	! t0_kref+0x22f0:   	smul	%o4, %l6, %l1
	.word	0x81ae0a54	! t0_kref+0x22f4:   	fcmpd	%fcc0, %f24, %f20
	.word	0xb7b007b8	! t0_kref+0x22f8:   	fpackfix	%f24, %f27
	.word	0x81de000d	! t0_kref+0x22fc:   	flush	%i0 + %o5
	.word	0x9db18f6d	! t0_kref+0x2300:   	fornot1s	%f6, %f13, %f14
	.word	0x31480004	! t0_kref+0x2304:   	fba,a,pt	%fcc0, _kref+0x2314
	.word	0xa22ac00c	! t0_kref+0x2308:   	andn	%o3, %o4, %l1
	.word	0xe248a010	! t0_kref+0x230c:   	ldsb	[%g2 + 0x10], %l1
	.word	0xa21cc00c	! t0_kref+0x2310:   	xor	%l3, %o4, %l1
	.word	0x81dbc013	! t0_kref+0x2314:   	flush	%o7 + %l3
	.word	0xe51fbe58	! t0_kref+0x2318:   	ldd	[%fp - 0x1a8], %f18
	.word	0xec20a008	! t0_kref+0x231c:   	st	%l6, [%g2 + 8]
	.word	0xa2030012	! t0_kref+0x2320:   	add	%o4, %l2, %l1
	.word	0xa3400000	! t0_kref+0x2324:   	mov	%y, %l1
	.word	0xa3418000	! t0_kref+0x2328:   	mov	%fprs, %l1
	.word	0xe250a020	! t0_kref+0x232c:   	ldsh	[%g2 + 0x20], %l1
	.word	0xa21d0017	! t0_kref+0x2330:   	xor	%l4, %l7, %l1
	.word	0xe250a030	! t0_kref+0x2334:   	ldsh	[%g2 + 0x30], %l1
	.word	0x8da448ba	! t0_kref+0x2338:   	fsubs	%f17, %f26, %f6
	.word	0xf1be1813	! t0_kref+0x233c:   	stda	%f24, [%i0 + %l3]0xc0
	.word	0xe820a018	! t0_kref+0x2340:   	st	%l4, [%g2 + 0x18]
	.word	0xa28ee84d	! t0_kref+0x2344:   	andcc	%i3, 0x84d, %l1
	.word	0x91a0054c	! t0_kref+0x2348:   	fsqrtd	%f12, %f8
	.word	0xe2965000	! t0_kref+0x234c:   	lduha	[%i1]0x80, %l1
	.word	0xcd1fbea0	! t0_kref+0x2350:   	ldd	[%fp - 0x160], %f6
	.word	0xe81e7ff0	! t0_kref+0x2354:   	ldd	[%i1 - 0x10], %l4
	.word	0xe256001b	! t0_kref+0x2358:   	ldsh	[%i0 + %i3], %l1
	.word	0xd9e6100d	! t0_kref+0x235c:   	casa	[%i0]0x80, %o5, %o4
	.word	0xe6ae1000	! t0_kref+0x2360:   	stba	%l3, [%i0]0x80
	.word	0xe41e3fe8	! t0_kref+0x2364:   	ldd	[%i0 - 0x18], %l2
	.word	0xd4267ff0	! t0_kref+0x2368:   	st	%o2, [%i1 - 0x10]
	.word	0xafa018c6	! t0_kref+0x236c:   	fdtos	%f6, %f23
	.word	0xa5a5882b	! t0_kref+0x2370:   	fadds	%f22, %f11, %f18
	.word	0x3c800002	! t0_kref+0x2374:   	bpos,a	_kref+0x237c
	.word	0xa2adeddc	! t0_kref+0x2378:   	andncc	%l7, 0xddc, %l1
	.word	0xd3060000	! t0_kref+0x237c:   	ld	[%i0], %f9
	.word	0x23192736	! t0_kref+0x2380:   	sethi	%hi(0x649cd800), %l1
	.word	0xdf00a000	! t0_kref+0x2384:   	ld	[%g2], %f15
	.word	0x9fb0076a	! t0_kref+0x2388:   	fpack16	%f10, %f15
	.word	0xe630a032	! t0_kref+0x238c:   	sth	%l3, [%g2 + 0x32]
	.word	0x8143c000	! t0_kref+0x2390:   	stbar
	.word	0xe428a012	! t0_kref+0x2394:   	stb	%l2, [%g2 + 0x12]
	.word	0xa3b3058e	! t0_kref+0x2398:   	fcmpgt32	%f12, %f14, %l1
	.word	0xe240a000	! t0_kref+0x239c:   	ldsw	[%g2], %l1
	.word	0xa22a0017	! t0_kref+0x23a0:   	andn	%o0, %l7, %l1
	.word	0xa29d400c	! t0_kref+0x23a4:   	xorcc	%l5, %o4, %l1
	.word	0x9fb007ac	! t0_kref+0x23a8:   	fpackfix	%f12, %f15
	.word	0xdaa6501c	! t0_kref+0x23ac:   	sta	%o5, [%i1 + %i4]0x80
	.word	0x24480008	! t0_kref+0x23b0:   	ble,a,pt	%icc, _kref+0x23d0
	.word	0xda28a023	! t0_kref+0x23b4:   	stb	%o5, [%g2 + 0x23]
	.word	0xe228a021	! t0_kref+0x23b8:   	stb	%l1, [%g2 + 0x21]
	.word	0xfb20a000	! t0_kref+0x23bc:   	st	%f29, [%g2]
	.word	0xe2901018	! t0_kref+0x23c0:   	lduha	[%g0 + %i0]0x80, %l1
	.word	0xe256401b	! t0_kref+0x23c4:   	ldsh	[%i1 + %i3], %l1
	.word	0xed1fbe98	! t0_kref+0x23c8:   	ldd	[%fp - 0x168], %f22
	.word	0xa275a778	! t0_kref+0x23cc:   	udiv	%l6, 0x778, %l1
	.word	0xe81e3fe0	! t0_kref+0x23d0:   	ldd	[%i0 - 0x20], %l4
	call	SYM(t0_subr2)
	.word	0xd428a013	! t0_kref+0x23d8:   	stb	%o2, [%g2 + 0x13]
	.word	0xd1200019	! t0_kref+0x23dc:   	st	%f8, [%g0 + %i1]
	.word	0x99a01919	! t0_kref+0x23e0:   	fitod	%f25, %f12
	.word	0xa258000a	! t0_kref+0x23e4:   	smul	%g0, %o2, %l1
	.word	0xa2d24016	! t0_kref+0x23e8:   	umulcc	%o1, %l6, %l1
	.word	0xa3b2001b	! t0_kref+0x23ec:   	edge8	%o0, %i3, %l1
	.word	0x81ac0a46	! t0_kref+0x23f0:   	fcmpd	%fcc0, %f16, %f6
	.word	0x9de3bfa0	! t0_kref+0x23f4:   	save	%sp, -0x60, %sp
	.word	0xb6c6b134	! t0_kref+0x23f8:   	addccc	%i2, -0xecc, %i3
	.word	0xa3e83ec5	! t0_kref+0x23fc:   	restore	%g0, -0x13b, %l1
	.word	0xa2423455	! t0_kref+0x2400:   	addc	%o0, -0xbab, %l1
	.word	0x83414000	! t0_kref+0x2404:   	mov	%pc, %g1
	.word	0xe256401b	! t0_kref+0x2408:   	ldsh	[%i1 + %i3], %l1
	.word	0xa3b5806c	! t0_kref+0x240c:   	edge8ln	%l6, %o4, %l1
	.word	0x3d480007	! t0_kref+0x2410:   	fbule,a,pt	%fcc0, _kref+0x242c
	.word	0xa2054011	! t0_kref+0x2414:   	add	%l5, %l1, %l1
	.word	0xa9a00036	! t0_kref+0x2418:   	fmovs	%f22, %f20
	.word	0xa3400000	! t0_kref+0x241c:   	mov	%y, %l1
	.word	0xb7a01a32	! t0_kref+0x2420:   	fstoi	%f18, %f27
	.word	0xfb262014	! t0_kref+0x2424:   	st	%f29, [%i0 + 0x14]
	.word	0x91a20956	! t0_kref+0x2428:   	fmuld	%f8, %f22, %f8
	.word	0xf100a010	! t0_kref+0x242c:   	ld	[%g2 + 0x10], %f24
	.word	0xf5bf5018	! t0_kref+0x2430:   	stda	%f26, [%i5 + %i0]0x80
	.word	0xa9a01a32	! t0_kref+0x2434:   	fstoi	%f18, %f20
	.word	0xd1f65013	! t0_kref+0x2438:   	casxa	[%i1]0x80, %l3, %o0
	.word	0x34480004	! t0_kref+0x243c:   	bg,a,pt	%icc, _kref+0x244c
	.word	0xf6300019	! t0_kref+0x2440:   	sth	%i3, [%g0 + %i1]
	.word	0xe256c019	! t0_kref+0x2444:   	ldsh	[%i3 + %i1], %l1
	.word	0xedee101a	! t0_kref+0x2448:   	prefetcha	%i0 + %i2, 22
	.word	0xd028a00a	! t0_kref+0x244c:   	stb	%o0, [%g2 + 0xa]
	.word	0xe200a030	! t0_kref+0x2450:   	ld	[%g2 + 0x30], %l1
	.word	0xa2880017	! t0_kref+0x2454:   	andcc	%g0, %l7, %l1
	.word	0x8da00556	! t0_kref+0x2458:   	fsqrtd	%f22, %f6
	.word	0xe20e7ffd	! t0_kref+0x245c:   	ldub	[%i1 - 3], %l1
	.word	0xa29a4016	! t0_kref+0x2460:   	xorcc	%o1, %l6, %l1
	.word	0xa22af124	! t0_kref+0x2464:   	andn	%o3, -0xedc, %l1
	.word	0xa3b200d2	! t0_kref+0x2468:   	edge16l	%o0, %l2, %l1
	.word	0xd826601c	! t0_kref+0x246c:   	st	%o4, [%i1 + 0x1c]
	.word	0xdd20a008	! t0_kref+0x2470:   	st	%f14, [%g2 + 8]
	.word	0xe7f6501b	! t0_kref+0x2474:   	casxa	[%i1]0x80, %i3, %l3
	.word	0xb1b1cd60	! t0_kref+0x2478:   	fnot1s	%f7, %f24
	.word	0x8143c000	! t0_kref+0x247c:   	stbar
	.word	0x9fa018da	! t0_kref+0x2480:   	fdtos	%f26, %f15
	.word	0x2c800006	! t0_kref+0x2484:   	bneg,a	_kref+0x249c
	.word	0xa3b2c011	! t0_kref+0x2488:   	edge8	%o3, %l1, %l1
	.word	0xa9a00058	! t0_kref+0x248c:   	fmovd	%f24, %f20
	.word	0x8db70f48	! t0_kref+0x2490:   	fornot1	%f28, %f8, %f6
	.word	0xa21ef0f5	! t0_kref+0x2494:   	xor	%i3, -0xf0b, %l1
	.word	0xada20954	! t0_kref+0x2498:   	fmuld	%f8, %f20, %f22
	.word	0x81af0a5a	! t0_kref+0x249c:   	fcmpd	%fcc0, %f28, %f26
	.word	0x27480008	! t0_kref+0x24a0:   	fbul,a,pt	%fcc0, _kref+0x24c0
	.word	0xbbb44a2c	! t0_kref+0x24a4:   	fpadd16s	%f17, %f12, %f29
	.word	0xd1bf1a59	! t0_kref+0x24a8:   	stda	%f8, [%i4 + %i1]0xd2
	.word	0x99a50946	! t0_kref+0x24ac:   	fmuld	%f20, %f6, %f12
	.word	0x81abcab4	! t0_kref+0x24b0:   	fcmpes	%fcc0, %f15, %f20
	.word	0xa202c00c	! t0_kref+0x24b4:   	add	%o3, %o4, %l1
	.word	0xa2468013	! t0_kref+0x24b8:   	addc	%i2, %l3, %l1
	.word	0xa2020017	! t0_kref+0x24bc:   	add	%o0, %l7, %l1
	.word	0xa3b34280	! t0_kref+0x24c0:   	array32	%o5, %g0, %l1
	.word	0x8143e075	! t0_kref+0x24c4:   	membar	0x75
	.word	0xd630a01a	! t0_kref+0x24c8:   	sth	%o3, [%g2 + 0x1a]
	.word	0x8fb6cdb2	! t0_kref+0x24cc:   	fxors	%f27, %f18, %f7
	.word	0xa1a3894e	! t0_kref+0x24d0:   	fmuld	%f14, %f14, %f16
	.word	0xf520a018	! t0_kref+0x24d4:   	st	%f26, [%g2 + 0x18]
	.word	0xe240a008	! t0_kref+0x24d8:   	ldsw	[%g2 + 8], %l1
	.word	0xa5a01a35	! t0_kref+0x24dc:   	fstoi	%f21, %f18
	.word	0x9da288c6	! t0_kref+0x24e0:   	fsubd	%f10, %f6, %f14
	.word	0x81dd400b	! t0_kref+0x24e4:   	flush	%l5 + %o3
	.word	0xa3b58133	! t0_kref+0x24e8:   	edge32n	%l6, %l3, %l1
	.word	0xf1be5a5b	! t0_kref+0x24ec:   	stda	%f24, [%i1 + %i3]0xd2
	.word	0xa9b58f70	! t0_kref+0x24f0:   	fornot1s	%f22, %f16, %f20
	.word	0xf11fbc00	! t0_kref+0x24f4:   	ldd	[%fp - 0x400], %f24
	.word	0xa3418000	! t0_kref+0x24f8:   	mov	%fprs, %l1
	.word	0xa22c37d3	! t0_kref+0x24fc:   	andn	%l0, -0x82d, %l1
	.word	0xe6200019	! t0_kref+0x2500:   	st	%l3, [%g0 + %i1]
	.word	0xabab4028	! t0_kref+0x2504:   	fmovsle	%fcc0, %f8, %f21
	.word	0xdd3f4019	! t0_kref+0x2508:   	std	%f14, [%i5 + %i1]
	.word	0x81834000	! t0_kref+0x250c:   	wr	%o5, %g0, %y
	.word	0x2d480001	! t0_kref+0x2510:   	fbg,a,pt	%fcc0, _kref+0x2514
	.word	0xa215c00a	! t0_kref+0x2514:   	or	%l7, %o2, %l1
	.word	0xb9b68f56	! t0_kref+0x2518:   	fornot1	%f26, %f22, %f28
	.word	0x99a30958	! t0_kref+0x251c:   	fmuld	%f12, %f24, %f12
	.word	0xfb20a028	! t0_kref+0x2520:   	st	%f29, [%g2 + 0x28]
	.word	0xe24e3fff	! t0_kref+0x2524:   	ldsb	[%i0 - 1], %l1
	.word	0x30800001	! t0_kref+0x2528:   	ba,a	_kref+0x252c
	.word	0xa3b68310	! t0_kref+0x252c:   	alignaddr	%i2, %l0, %l1
	.word	0x8185c000	! t0_kref+0x2530:   	wr	%l7, %g0, %y
	.word	0xa3b58130	! t0_kref+0x2534:   	edge32n	%l6, %l0, %l1
	.word	0xa3700000	! t0_kref+0x2538:   	popc	%g0, %l1
	.word	0xe24e600f	! t0_kref+0x253c:   	ldsb	[%i1 + 0xf], %l1
	.word	0x91b34c6c	! t0_kref+0x2540:   	fnors	%f13, %f12, %f8
	.word	0x9da00154	! t0_kref+0x2544:   	fabsd	%f20, %f14
	.word	0xb1a0012c	! t0_kref+0x2548:   	fabss	%f12, %f24
	.word	0xa3400000	! t0_kref+0x254c:   	mov	%y, %l1
	.word	0xa205f3e4	! t0_kref+0x2550:   	add	%l7, -0xc1c, %l1
	.word	0xf3067ffc	! t0_kref+0x2554:   	ld	[%i1 - 4], %f25
	.word	0xa9a018d2	! t0_kref+0x2558:   	fdtos	%f18, %f20
	.word	0x3a800002	! t0_kref+0x255c:   	bcc,a	_kref+0x2564
	.word	0xa9a0055c	! t0_kref+0x2560:   	fsqrtd	%f28, %f20
	.word	0x34480003	! t0_kref+0x2564:   	bg,a,pt	%icc, _kref+0x2570
	.word	0xe2162012	! t0_kref+0x2568:   	lduh	[%i0 + 0x12], %l1
	.word	0xe89e501d	! t0_kref+0x256c:   	ldda	[%i1 + %i5]0x80, %l4
	.word	0x91a188d4	! t0_kref+0x2570:   	fsubd	%f6, %f20, %f8
	.word	0xa1a0193c	! t0_kref+0x2574:   	fstod	%f28, %f16
	.word	0xebee501a	! t0_kref+0x2578:   	prefetcha	%i1 + %i2, 21
	.word	0xe250a000	! t0_kref+0x257c:   	ldsh	[%g2], %l1
	.word	0x23480005	! t0_kref+0x2580:   	fbne,a,pt	%fcc0, _kref+0x2594
	.word	0xa5a289d8	! t0_kref+0x2584:   	fdivd	%f10, %f24, %f18
	.word	0xe2ae101a	! t0_kref+0x2588:   	stba	%l1, [%i0 + %i2]0x80
	.word	0xa9a688d4	! t0_kref+0x258c:   	fsubd	%f26, %f20, %f20
	.word	0x93a0189d	! t0_kref+0x2590:   	fitos	%f29, %f9
	.word	0xee20a028	! t0_kref+0x2594:   	st	%l7, [%g2 + 0x28]
	.word	0xefe6500b	! t0_kref+0x2598:   	casa	[%i1]0x80, %o3, %l7
	.word	0xb1a388d0	! t0_kref+0x259c:   	fsubd	%f14, %f16, %f24
	.word	0xa2b5400c	! t0_kref+0x25a0:   	orncc	%l5, %o4, %l1
	.word	0x8da209af	! t0_kref+0x25a4:   	fdivs	%f8, %f15, %f6
	.word	0x2d800005	! t0_kref+0x25a8:   	fbg,a	_kref+0x25bc
	.word	0xda30a028	! t0_kref+0x25ac:   	sth	%o5, [%g2 + 0x28]
	.word	0xadb30cb2	! t0_kref+0x25b0:   	fandnot2s	%f12, %f18, %f22
	.word	0xa2f20009	! t0_kref+0x25b4:   	udivcc	%o0, %o1, %l1
	.word	0xe210a012	! t0_kref+0x25b8:   	lduh	[%g2 + 0x12], %l1
	.word	0xe24e0000	! t0_kref+0x25bc:   	ldsb	[%i0], %l1
	.word	0xa2e20014	! t0_kref+0x25c0:   	subccc	%o0, %l4, %l1
	.word	0xa2dd6953	! t0_kref+0x25c4:   	smulcc	%l5, 0x953, %l1
	.word	0x3f480002	! t0_kref+0x25c8:   	fbo,a,pt	%fcc0, _kref+0x25d0
	.word	0x81dc722a	! t0_kref+0x25cc:   	flush	%l1 - 0xdd6
	.word	0xe230a010	! t0_kref+0x25d0:   	sth	%l1, [%g2 + 0x10]
	.word	0xb9a4084a	! t0_kref+0x25d4:   	faddd	%f16, %f10, %f28
	.word	0xa21abfc1	! t0_kref+0x25d8:   	xor	%o2, -0x3f, %l1
	.word	0x81ad8aaf	! t0_kref+0x25dc:   	fcmpes	%fcc0, %f22, %f15
	.word	0xcd20a020	! t0_kref+0x25e0:   	st	%f6, [%g2 + 0x20]
	.word	0xada01a32	! t0_kref+0x25e4:   	fstoi	%f18, %f22
	.word	0xa29cf1c9	! t0_kref+0x25e8:   	xorcc	%l3, -0xe37, %l1
	.word	0x81ae0a3b	! t0_kref+0x25ec:   	fcmps	%fcc0, %f24, %f27
	.word	0xaba309a6	! t0_kref+0x25f0:   	fdivs	%f12, %f6, %f21
	.word	0x81a98aa6	! t0_kref+0x25f4:   	fcmpes	%fcc0, %f6, %f6
	.word	0x95b50f92	! t0_kref+0x25f8:   	for	%f20, %f18, %f10
	.word	0xdd00a020	! t0_kref+0x25fc:   	ld	[%g2 + 0x20], %f14
	.word	0x9ba01a3a	! t0_kref+0x2600:   	fstoi	%f26, %f13
	.word	0x95b50d90	! t0_kref+0x2604:   	fxor	%f20, %f16, %f10
	.word	0xc9ee5012	! t0_kref+0x2608:   	prefetcha	%i1 + %l2, 4
	.word	0xb5a4c938	! t0_kref+0x260c:   	fmuls	%f19, %f24, %f26
	.word	0xa33d4011	! t0_kref+0x2610:   	sra	%l5, %l1, %l1
	.word	0xa1a0188c	! t0_kref+0x2614:   	fitos	%f12, %f16
	.word	0xa25d6f8d	! t0_kref+0x2618:   	smul	%l5, 0xf8d, %l1
	.word	0xe250a02a	! t0_kref+0x261c:   	ldsh	[%g2 + 0x2a], %l1
	.word	0xa3418000	! t0_kref+0x2620:   	mov	%fprs, %l1
	.word	0x81acca39	! t0_kref+0x2624:   	fcmps	%fcc0, %f19, %f25
	.word	0xa286b989	! t0_kref+0x2628:   	addcc	%i2, -0x677, %l1
	.word	0xbba018da	! t0_kref+0x262c:   	fdtos	%f26, %f29
	.word	0x9de3bfa0	! t0_kref+0x2630:   	save	%sp, -0x60, %sp
	.word	0x805f7141	! t0_kref+0x2634:   	smul	%i5, -0xebf, %g0
	.word	0xa3ee6d6b	! t0_kref+0x2638:   	restore	%i1, 0xd6b, %l1
	.word	0xa21d000c	! t0_kref+0x263c:   	xor	%l4, %o4, %l1
	.word	0xa3400000	! t0_kref+0x2640:   	mov	%y, %l1
	.word	0xe89f5018	! t0_kref+0x2644:   	ldda	[%i5 + %i0]0x80, %l4
	.word	0x97b00cea	! t0_kref+0x2648:   	fnot2s	%f10, %f11
	.word	0xa5b18d40	! t0_kref+0x264c:   	fnot1	%f6, %f18
	.word	0xa23031e0	! t0_kref+0x2650:   	orn	%g0, -0xe20, %l1
	.word	0xef06600c	! t0_kref+0x2654:   	ld	[%i1 + 0xc], %f23
	.word	0xcd1fbe30	! t0_kref+0x2658:   	ldd	[%fp - 0x1d0], %f6
	.word	0x3a800005	! t0_kref+0x265c:   	bcc,a	_kref+0x2670
	.word	0xe820a030	! t0_kref+0x2660:   	st	%l4, [%g2 + 0x30]
	.word	0xa2d2ee23	! t0_kref+0x2664:   	umulcc	%o3, 0xe23, %l1
	.word	0xf420a030	! t0_kref+0x2668:   	st	%i2, [%g2 + 0x30]
	.word	0xe240a000	! t0_kref+0x266c:   	ldsw	[%g2], %l1
	.word	0xa5a309dc	! t0_kref+0x2670:   	fdivd	%f12, %f28, %f18
	.word	0xe256c019	! t0_kref+0x2674:   	ldsh	[%i3 + %i1], %l1
	.word	0xa367e43f	! t0_kref+0x2678:   	movvc	%icc, -0x3c1, %l1
	.word	0xa242801a	! t0_kref+0x267c:   	addc	%o2, %i2, %l1
	.word	0xf5ee101d	! t0_kref+0x2680:   	prefetcha	%i0 + %i5, 26
	.word	0x95a288d6	! t0_kref+0x2684:   	fsubd	%f10, %f22, %f10
	.word	0xa23221c2	! t0_kref+0x2688:   	orn	%o0, 0x1c2, %l1
	.word	0xa292ee49	! t0_kref+0x268c:   	orcc	%o3, 0xe49, %l1
	.word	0xafab803d	! t0_kref+0x2690:   	fmovsule	%fcc0, %f29, %f23
	.word	0xa33b201d	! t0_kref+0x2694:   	sra	%o4, 0x1d, %l1
	.word	0x2d480003	! t0_kref+0x2698:   	fbg,a,pt	%fcc0, _kref+0x26a4
	.word	0xa7a0188d	! t0_kref+0x269c:   	fitos	%f13, %f19
	.word	0xa2000015	! t0_kref+0x26a0:   	add	%g0, %l5, %l1
	.word	0x2a480007	! t0_kref+0x26a4:   	bcs,a,pt	%icc, _kref+0x26c0
	.word	0xe91f4000	! t0_kref+0x26a8:   	ldd	[%i5], %f20
	.word	0xb3a0109c	! t0_kref+0x26ac:   	fxtos	%f28, %f25
	.word	0xb5b30709	! t0_kref+0x26b0:   	fmuld8sux16	%f12, %f9, %f26
	.word	0xa33d601f	! t0_kref+0x26b4:   	sra	%l5, 0x1f, %l1
	.word	0xd630a032	! t0_kref+0x26b8:   	sth	%o3, [%g2 + 0x32]
	.word	0xe24e2019	! t0_kref+0x26bc:   	ldsb	[%i0 + 0x19], %l1
	.word	0xa9a01a29	! t0_kref+0x26c0:   	fstoi	%f9, %f20
	.word	0xa1a30852	! t0_kref+0x26c4:   	faddd	%f12, %f18, %f16
	.word	0x93a01a27	! t0_kref+0x26c8:   	fstoi	%f7, %f9
	.word	0xa273000a	! t0_kref+0x26cc:   	udiv	%o4, %o2, %l1
	.word	0xe630a030	! t0_kref+0x26d0:   	sth	%l3, [%g2 + 0x30]
	.word	0xd220a020	! t0_kref+0x26d4:   	st	%o1, [%g2 + 0x20]
	.word	0xa2f00015	! t0_kref+0x26d8:   	udivcc	%g0, %l5, %l1
	.word	0x99b5c979	! t0_kref+0x26dc:   	fpmerge	%f23, %f25, %f12
	.word	0xb1a448a7	! t0_kref+0x26e0:   	fsubs	%f17, %f7, %f24
	.word	0xda364000	! t0_kref+0x26e4:   	sth	%o5, [%i1]
	.word	0x8143c000	! t0_kref+0x26e8:   	stbar
	.word	0x30800006	! t0_kref+0x26ec:   	ba,a	_kref+0x2704
	.word	0xa304aa0f	! t0_kref+0x26f0:   	taddcc	%l2, 0xa0f, %l1
	.word	0x81ab8aac	! t0_kref+0x26f4:   	fcmpes	%fcc0, %f14, %f12
	.word	0x9db70918	! t0_kref+0x26f8:   	faligndata	%f28, %f24, %f14
	.word	0xe8981018	! t0_kref+0x26fc:   	ldda	[%g0 + %i0]0x80, %l4
	.word	0xa2828008	! t0_kref+0x2700:   	addcc	%o2, %o0, %l1
	.word	0xa204c00b	! t0_kref+0x2704:   	add	%l3, %o3, %l1
	.word	0xafa249a6	! t0_kref+0x2708:   	fdivs	%f9, %f6, %f23
	.word	0xa3400000	! t0_kref+0x270c:   	mov	%y, %l1
	.word	0xe500a018	! t0_kref+0x2710:   	ld	[%g2 + 0x18], %f18
	.word	0xa28a000a	! t0_kref+0x2714:   	andcc	%o0, %o2, %l1
	.word	0xb3a01a2b	! t0_kref+0x2718:   	fstoi	%f11, %f25
	.word	0xa2aa0012	! t0_kref+0x271c:   	andncc	%o0, %l2, %l1
	.word	0xe2861000	! t0_kref+0x2720:   	lda	[%i0]0x80, %l1
	.word	0xa3356010	! t0_kref+0x2724:   	srl	%l5, 0x10, %l1
	.word	0xa294a752	! t0_kref+0x2728:   	orcc	%l2, 0x752, %l1
	.word	0xf007bfe0	! t0_kref+0x272c:   	ld	[%fp - 0x20], %i0
	.word	0x3a800007	! t0_kref+0x2730:   	bcc,a	_kref+0x274c
	.word	0xa2923b75	! t0_kref+0x2734:   	orcc	%o0, -0x48b, %l1
!	.word	0x2c4d2e30	! t0_kref+0x2738:   	bneg,a,pt	%icc, SYM(t0_subr1)
	   	bneg,a,pt	%icc, SYM(t0_subr1)
	.word	0x9e006334	! t0_kref+0x273c:   	add	%g1, 0x334, %o7
	.word	0xd1be1a1c	! t0_kref+0x2740:   	stda	%f8, [%i0 + %i4]0xd0
	.word	0x8db1cf7a	! t0_kref+0x2744:   	fornot1s	%f7, %f26, %f6
	.word	0xe0bf5019	! t0_kref+0x2748:   	stda	%l0, [%i5 + %i1]0x80
	.word	0xa23524c5	! t0_kref+0x274c:   	orn	%l4, 0x4c5, %l1
	.word	0xe5070018	! t0_kref+0x2750:   	ld	[%i4 + %i0], %f18
	.word	0xa3b70554	! t0_kref+0x2754:   	fcmpeq16	%f28, %f20, %l1
	.word	0x9e006358	! t0_kref+0x2758:   	add	%g1, 0x358, %o7
!	.word	0x3b4d2e27	! t0_kref+0x275c:   	fble,a,pt	%fcc0, SYM(t0_subr1)
	   	fble,a,pt	%fcc0, SYM(t0_subr1)
	.word	0xb1a018d0	! t0_kref+0x2760:   	fdtos	%f16, %f24
	.word	0xb9b28f4c	! t0_kref+0x2764:   	fornot1	%f10, %f12, %f28
	.word	0xec36c019	! t0_kref+0x2768:   	sth	%l6, [%i3 + %i1]
	.word	0xe208a010	! t0_kref+0x276c:   	ldub	[%g2 + 0x10], %l1
	.word	0x86102003	! t0_kref+0x2770:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x2774:   	bne,a	_kref+0x2774
	.word	0x86a0e001	! t0_kref+0x2778:   	subcc	%g3, 1, %g3
	.word	0xe256001b	! t0_kref+0x277c:   	ldsh	[%i0 + %i3], %l1
	.word	0x81de7b2a	! t0_kref+0x2780:   	flush	%i1 - 0x4d6
	.word	0xa2352e90	! t0_kref+0x2784:   	orn	%l4, 0xe90, %l1
	.word	0xa202c01b	! t0_kref+0x2788:   	add	%o3, %i3, %l1
	.word	0xd500a000	! t0_kref+0x278c:   	ld	[%g2], %f10
	.word	0x31480002	! t0_kref+0x2790:   	fba,a,pt	%fcc0, _kref+0x2798
	.word	0xf628a029	! t0_kref+0x2794:   	stb	%i3, [%g2 + 0x29]
	.word	0xa204bf97	! t0_kref+0x2798:   	add	%l2, -0x69, %l1
	.word	0xe2164000	! t0_kref+0x279c:   	lduh	[%i1], %l1
	.word	0xa3b20416	! t0_kref+0x27a0:   	fcmple16	%f8, %f22, %l1
	.word	0x9da01915	! t0_kref+0x27a4:   	fitod	%f21, %f14
	.word	0x3d480002	! t0_kref+0x27a8:   	fbule,a,pt	%fcc0, _kref+0x27b0
	.word	0xa2756360	! t0_kref+0x27ac:   	udiv	%l5, 0x360, %l1
	.word	0xe208a001	! t0_kref+0x27b0:   	ldub	[%g2 + 1], %l1
	.word	0xe2066018	! t0_kref+0x27b4:   	ld	[%i1 + 0x18], %l1
	.word	0xa2020008	! t0_kref+0x27b8:   	add	%o0, %o0, %l1
	.word	0x28480005	! t0_kref+0x27bc:   	bleu,a,pt	%icc, _kref+0x27d0
	.word	0xe41e6000	! t0_kref+0x27c0:   	ldd	[%i1], %l2
	.word	0x33480007	! t0_kref+0x27c4:   	fbe,a,pt	%fcc0, _kref+0x27e0
	.word	0xa3b304da	! t0_kref+0x27c8:   	fcmpne32	%f12, %f26, %l1
	.word	0xb9b00fc0	! t0_kref+0x27cc:   	fone	%f28
	.word	0x99a01926	! t0_kref+0x27d0:   	fstod	%f6, %f12
	.word	0xe628a01b	! t0_kref+0x27d4:   	stb	%l3, [%g2 + 0x1b]
	.word	0x8da389d2	! t0_kref+0x27d8:   	fdivd	%f14, %f18, %f6
	.word	0xe2865000	! t0_kref+0x27dc:   	lda	[%i1]0x80, %l1
	.word	0xa2a4800a	! t0_kref+0x27e0:   	subcc	%l2, %o2, %l1
	.word	0xe24e401a	! t0_kref+0x27e4:   	ldsb	[%i1 + %i2], %l1
	.word	0xa27529b4	! t0_kref+0x27e8:   	udiv	%l4, 0x9b4, %l1
	.word	0x30800003	! t0_kref+0x27ec:   	ba,a	_kref+0x27f8
	.word	0xe66e0000	! t0_kref+0x27f0:   	ldstub	[%i0], %l3
	.word	0x24480007	! t0_kref+0x27f4:   	ble,a,pt	%icc, _kref+0x2810
	.word	0xe03e401d	! t0_kref+0x27f8:   	std	%l0, [%i1 + %i5]
	.word	0xa275400b	! t0_kref+0x27fc:   	udiv	%l5, %o3, %l1
	.word	0x230a14b2	! t0_kref+0x2800:   	sethi	%hi(0x2852c800), %l1
	.word	0xa3400000	! t0_kref+0x2804:   	mov	%y, %l1
	.word	0x8d85f5b0	! t0_kref+0x2808:   	wr	%l7, 0xfffff5b0, %fprs
	.word	0xa2ac8017	! t0_kref+0x280c:   	andncc	%l2, %l7, %l1
	.word	0xf007bfe0	! t0_kref+0x2810:   	ld	[%fp - 0x20], %i0
	.word	0xa292000d	! t0_kref+0x2814:   	orcc	%o0, %o5, %l1
	.word	0xa22c800a	! t0_kref+0x2818:   	andn	%l2, %o2, %l1
	.word	0x95a01027	! t0_kref+0x281c:   	fstox	%f7, %f10
	.word	0xa2400009	! t0_kref+0x2820:   	addc	%g0, %o1, %l1
	.word	0xb9a0054e	! t0_kref+0x2824:   	fsqrtd	%f14, %f28
	.word	0xa212c016	! t0_kref+0x2828:   	or	%o3, %l6, %l1
	.word	0xa25cbcd1	! t0_kref+0x282c:   	smul	%l2, -0x32f, %l1
	.word	0xa9b40e4c	! t0_kref+0x2830:   	fxnor	%f16, %f12, %f20
	.word	0xa2337d75	! t0_kref+0x2834:   	orn	%o5, -0x28b, %l1
	.word	0xa2320012	! t0_kref+0x2838:   	orn	%o0, %l2, %l1
	.word	0x91a5c8ac	! t0_kref+0x283c:   	fsubs	%f23, %f12, %f8
	.word	0x81daef4a	! t0_kref+0x2840:   	flush	%o3 + 0xf4a
	.word	0xa1a01a39	! t0_kref+0x2844:   	fstoi	%f25, %f16
	.word	0xa3b54330	! t0_kref+0x2848:   	bmask	%l5, %l0, %l1
	.word	0xa1a48935	! t0_kref+0x284c:   	fmuls	%f18, %f21, %f16
	.word	0xb5a0015a	! t0_kref+0x2850:   	fabsd	%f26, %f26
	.word	0xb5a389dc	! t0_kref+0x2854:   	fdivd	%f14, %f28, %f26
	.word	0x9fb18cbd	! t0_kref+0x2858:   	fandnot2s	%f6, %f29, %f15
	.word	0xb9a01a3c	! t0_kref+0x285c:   	fstoi	%f28, %f28
	.word	0xa2054000	! t0_kref+0x2860:   	add	%l5, %g0, %l1
	.word	0xa2dd7f4e	! t0_kref+0x2864:   	smulcc	%l5, -0xb2, %l1
	.word	0xe3b8a080	! t0_kref+0x2868:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xc807bfe4	! t0_kref+0x286c:   	ld	[%fp - 0x1c], %g4
	.word	0xe2901018	! t0_kref+0x2870:   	lduha	[%g0 + %i0]0x80, %l1
	.word	0xdf20a020	! t0_kref+0x2874:   	st	%f15, [%g2 + 0x20]
	.word	0xa5b28d10	! t0_kref+0x2878:   	fandnot1	%f10, %f16, %f18
	.word	0xe326401c	! t0_kref+0x287c:   	st	%f17, [%i1 + %i4]
	.word	0xada409ce	! t0_kref+0x2880:   	fdivd	%f16, %f14, %f22
	.word	0xe248a000	! t0_kref+0x2884:   	ldsb	[%g2], %l1
	.word	0xa2847b64	! t0_kref+0x2888:   	addcc	%l1, -0x49c, %l1
	.word	0xa2c5efac	! t0_kref+0x288c:   	addccc	%l7, 0xfac, %l1
	.word	0xa2f26bcf	! t0_kref+0x2890:   	udivcc	%o1, 0xbcf, %l1
	.word	0xe2462014	! t0_kref+0x2894:   	ldsw	[%i0 + 0x14], %l1
	.word	0xeb20a030	! t0_kref+0x2898:   	st	%f21, [%g2 + 0x30]
	.word	0x9ba01a35	! t0_kref+0x289c:   	fstoi	%f21, %f13
	.word	0x20800001	! t0_kref+0x28a0:   	bn,a	_kref+0x28a4
	.word	0xadb00766	! t0_kref+0x28a4:   	fpack16	%f6, %f22
	.word	0xd228a021	! t0_kref+0x28a8:   	stb	%o1, [%g2 + 0x21]
	.word	0xa9a01939	! t0_kref+0x28ac:   	fstod	%f25, %f20
	.word	0x34800005	! t0_kref+0x28b0:   	bg,a	_kref+0x28c4
	.word	0xf430a030	! t0_kref+0x28b4:   	sth	%i2, [%g2 + 0x30]
	.word	0x95b406f2	! t0_kref+0x28b8:   	fmul8ulx16	%f16, %f18, %f10
	.word	0xea28a000	! t0_kref+0x28bc:   	stb	%l5, [%g2]
	.word	0xa2acc017	! t0_kref+0x28c0:   	andncc	%l3, %l7, %l1
	.word	0x99a018d8	! t0_kref+0x28c4:   	fdtos	%f24, %f12
	.word	0xa235000d	! t0_kref+0x28c8:   	orn	%l4, %o5, %l1
	.word	0xee36200e	! t0_kref+0x28cc:   	sth	%l7, [%i0 + 0xe]
	.word	0xa3b5c136	! t0_kref+0x28d0:   	edge32n	%l7, %l6, %l1
	.word	0x81ab4a2d	! t0_kref+0x28d4:   	fcmps	%fcc0, %f13, %f13
	.word	0xd430a03a	! t0_kref+0x28d8:   	sth	%o2, [%g2 + 0x3a]
	.word	0xf5266004	! t0_kref+0x28dc:   	st	%f26, [%i1 + 4]
	.word	0x33480005	! t0_kref+0x28e0:   	fbe,a,pt	%fcc0, _kref+0x28f4
	.word	0x8143c000	! t0_kref+0x28e4:   	stbar
	.word	0xd1063ffc	! t0_kref+0x28e8:   	ld	[%i0 - 4], %f8
	.word	0x24800006	! t0_kref+0x28ec:   	ble,a	_kref+0x2904
	.word	0xe210a01a	! t0_kref+0x28f0:   	lduh	[%g2 + 0x1a], %l1
	.word	0xe2080019	! t0_kref+0x28f4:   	ldub	[%g0 + %i1], %l1
	.word	0x9fa0003b	! t0_kref+0x28f8:   	fmovs	%f27, %f15
	.word	0xe200a000	! t0_kref+0x28fc:   	ld	[%g2], %l1
	.word	0x28800007	! t0_kref+0x2900:   	bleu,a	_kref+0x291c
	.word	0xe2901019	! t0_kref+0x2904:   	lduha	[%g0 + %i1]0x80, %l1
	.word	0xa21aa4a7	! t0_kref+0x2908:   	xor	%o2, 0x4a7, %l1
	.word	0xa3400000	! t0_kref+0x290c:   	mov	%y, %l1
	.word	0xe99e501d	! t0_kref+0x2910:   	ldda	[%i1 + %i5]0x80, %f20
	.word	0x91b70d9a	! t0_kref+0x2914:   	fxor	%f28, %f26, %f8
	.word	0x001fffff	! t0_kref+0x2918:   	illtrap	0x1fffff
	.word	0x81ab0a2c	! t0_kref+0x291c:   	fcmps	%fcc0, %f12, %f12
	.word	0xcf20a030	! t0_kref+0x2920:   	st	%f7, [%g2 + 0x30]
	.word	0xa2057325	! t0_kref+0x2924:   	add	%l5, -0xcdb, %l1
	.word	0xa21427f5	! t0_kref+0x2928:   	or	%l0, 0x7f5, %l1
	.word	0xe210a01a	! t0_kref+0x292c:   	lduh	[%g2 + 0x1a], %l1
	.word	0x9fa5883d	! t0_kref+0x2930:   	fadds	%f22, %f29, %f15
	.word	0xef68a0cc	! t0_kref+0x2934:   	prefetch	%g2 + 0xcc, 23
	.word	0xa5a408cc	! t0_kref+0x2938:   	fsubd	%f16, %f12, %f18
	.word	0xa28cfd85	! t0_kref+0x293c:   	andcc	%l3, -0x27b, %l1
	.word	0xe200a028	! t0_kref+0x2940:   	ld	[%g2 + 0x28], %l1
	.word	0xd220a028	! t0_kref+0x2944:   	st	%o1, [%g2 + 0x28]
	.word	0xa258001a	! t0_kref+0x2948:   	smul	%g0, %i2, %l1
	.word	0xd100a020	! t0_kref+0x294c:   	ld	[%g2 + 0x20], %f8
	.word	0xb9a209d4	! t0_kref+0x2950:   	fdivd	%f8, %f20, %f28
	.word	0x95a68954	! t0_kref+0x2954:   	fmuld	%f26, %f20, %f10
	.word	0xc7ee500b	! t0_kref+0x2958:   	prefetcha	%i1 + %o3, 3
	.word	0xa2c48010	! t0_kref+0x295c:   	addccc	%l2, %l0, %l1
	.word	0xe99e1000	! t0_kref+0x2960:   	ldda	[%i0]0x80, %f20
	.word	0xa2e00010	! t0_kref+0x2964:   	subccc	%g0, %l0, %l1
	.word	0xa2d6efcd	! t0_kref+0x2968:   	umulcc	%i3, 0xfcd, %l1
	.word	0xa28a000c	! t0_kref+0x296c:   	andcc	%o0, %o4, %l1
	.word	0xe216c019	! t0_kref+0x2970:   	lduh	[%i3 + %i1], %l1
	.word	0xa214ed2e	! t0_kref+0x2974:   	or	%l3, 0xd2e, %l1
	.word	0x21480007	! t0_kref+0x2978:   	fbn,a,pt	%fcc0, _kref+0x2994
	.word	0x99b00f3b	! t0_kref+0x297c:   	fsrc2s	%f27, %f12
	.word	0xa29efecb	! t0_kref+0x2980:   	xorcc	%i3, -0x135, %l1
	.word	0xd11fbd50	! t0_kref+0x2984:   	ldd	[%fp - 0x2b0], %f8
	.word	0x81580000	! t0_kref+0x2988:   	flushw
	.word	0xd1be180a	! t0_kref+0x298c:   	stda	%f8, [%i0 + %o2]0xc0
	.word	0xb9a70950	! t0_kref+0x2990:   	fmuld	%f28, %f16, %f28
	.word	0xa21ec00b	! t0_kref+0x2994:   	xor	%i3, %o3, %l1
	.word	0xbba00039	! t0_kref+0x2998:   	fmovs	%f25, %f29
	.word	0xa5b6c667	! t0_kref+0x299c:   	fmul8x16au	%f27, %f7, %f18
	.word	0xd920a008	! t0_kref+0x29a0:   	st	%f12, [%g2 + 8]
	.word	0xa2f5bfc4	! t0_kref+0x29a4:   	udivcc	%l6, -0x3c, %l1
	.word	0xa2057182	! t0_kref+0x29a8:   	add	%l5, -0xe7e, %l1
	.word	0x93b74ea0	! t0_kref+0x29ac:   	fsrc1s	%f29, %f9
	.word	0xa29a8015	! t0_kref+0x29b0:   	xorcc	%o2, %l5, %l1
	.word	0xa2bc3b8b	! t0_kref+0x29b4:   	xnorcc	%l0, -0x475, %l1
	.word	0xed1fbd78	! t0_kref+0x29b8:   	ldd	[%fp - 0x288], %f22
	.word	0xd11fbd18	! t0_kref+0x29bc:   	ldd	[%fp - 0x2e8], %f8
	.word	0xa22b327b	! t0_kref+0x29c0:   	andn	%o4, -0xd85, %l1
	.word	0xb9b38746	! t0_kref+0x29c4:   	fpack32	%f14, %f6, %f28
	.word	0xa3328012	! t0_kref+0x29c8:   	srl	%o2, %l2, %l1
	.word	0x8143c000	! t0_kref+0x29cc:   	stbar
	.word	0xb3a0189a	! t0_kref+0x29d0:   	fitos	%f26, %f25
	.word	0xa264800b	! t0_kref+0x29d4:   	subc	%l2, %o3, %l1
	.word	0xa3a208b2	! t0_kref+0x29d8:   	fsubs	%f8, %f18, %f17
	.word	0xa2833198	! t0_kref+0x29dc:   	addcc	%o4, -0xe68, %l1
	.word	0x99a0054a	! t0_kref+0x29e0:   	fsqrtd	%f10, %f12
	.word	0xa3b6c00d	! t0_kref+0x29e4:   	edge8	%i3, %o5, %l1
	.word	0xa9b009ab	! t0_kref+0x29e8:   	fexpand	%f11, %f20
	.word	0xa2158014	! t0_kref+0x29ec:   	or	%l6, %l4, %l1
	.word	0x29480008	! t0_kref+0x29f0:   	fbl,a,pt	%fcc0, _kref+0x2a10
	.word	0xa28ac00b	! t0_kref+0x29f4:   	andcc	%o3, %o3, %l1
	.word	0xe2965000	! t0_kref+0x29f8:   	lduha	[%i1]0x80, %l1
	.word	0xe2a01019	! t0_kref+0x29fc:   	sta	%l1, [%g0 + %i1]0x80
	.word	0xe41e2000	! t0_kref+0x2a00:   	ldd	[%i0], %l2
	.word	0xc06e6008	! t0_kref+0x2a04:   	ldstub	[%i1 + 8], %g0
	.word	0xa32e8010	! t0_kref+0x2a08:   	sll	%i2, %l0, %l1
	.word	0xa2e3001a	! t0_kref+0x2a0c:   	subccc	%o4, %i2, %l1
	.word	0xa3b68200	! t0_kref+0x2a10:   	array8	%i2, %g0, %l1
	.word	0x81ab0a4a	! t0_kref+0x2a14:   	fcmpd	%fcc0, %f12, %f10
	.word	0x91a6cd31	! t0_kref+0x2a18:   	fsmuld	%f27, %f17, %f8
	.word	0xe42e3fe8	! t0_kref+0x2a1c:   	stb	%l2, [%i0 - 0x18]
	.word	0x27800007	! t0_kref+0x2a20:   	fbul,a	_kref+0x2a3c
	.word	0x81db4009	! t0_kref+0x2a24:   	flush	%o5 + %o1
	.word	0xe246001c	! t0_kref+0x2a28:   	ldsw	[%i0 + %i4], %l1
	.word	0x8143c000	! t0_kref+0x2a2c:   	stbar
	.word	0xaba00531	! t0_kref+0x2a30:   	fsqrts	%f17, %f21
	.word	0x8da4892a	! t0_kref+0x2a34:   	fmuls	%f18, %f10, %f6
	.word	0xa204bc35	! t0_kref+0x2a38:   	add	%l2, -0x3cb, %l1
	.word	0x8da0193a	! t0_kref+0x2a3c:   	fstod	%f26, %f6
	.word	0xa3a01a34	! t0_kref+0x2a40:   	fstoi	%f20, %f17
	.word	0xa3418000	! t0_kref+0x2a44:   	mov	%fprs, %l1
	.word	0xe2563ff6	! t0_kref+0x2a48:   	ldsh	[%i0 - 0xa], %l1
	.word	0xb4102006	! t0_kref+0x2a4c:   	mov	0x6, %i2
	.word	0xe4763fe8	! t0_kref+0x2a50:   	stx	%l2, [%i0 - 0x18]
	.word	0x81ac4a27	! t0_kref+0x2a54:   	fcmps	%fcc0, %f17, %f7
	call	SYM(t0_subr1)
	.word	0xa2750017	! t0_kref+0x2a5c:   	udiv	%l4, %l7, %l1
	.word	0xa3b74c72	! t0_kref+0x2a60:   	fnors	%f29, %f18, %f17
	.word	0xafa689ae	! t0_kref+0x2a64:   	fdivs	%f26, %f14, %f23
	.word	0x20480001	! t0_kref+0x2a68:   	bn,a,pt	%icc, _kref+0x2a6c
	.word	0xa29220f3	! t0_kref+0x2a6c:   	orcc	%o0, 0xf3, %l1
	.word	0xdd00a018	! t0_kref+0x2a70:   	ld	[%g2 + 0x18], %f14
	.word	0xe1be1a5d	! t0_kref+0x2a74:   	stda	%f16, [%i0 + %i5]0xd2
	.word	0x32800002	! t0_kref+0x2a78:   	bne,a	_kref+0x2a80
	.word	0xa25b400c	! t0_kref+0x2a7c:   	smul	%o5, %o4, %l1
	.word	0xa3b70a26	! t0_kref+0x2a80:   	fpadd16s	%f28, %f6, %f17
	.word	0xa21d7e17	! t0_kref+0x2a84:   	xor	%l5, -0x1e9, %l1
	.word	0xa21c001b	! t0_kref+0x2a88:   	xor	%l0, %i3, %l1
	.word	0xe4a65000	! t0_kref+0x2a8c:   	sta	%l2, [%i1]0x80
	.word	0x3e800002	! t0_kref+0x2a90:   	bvc,a	_kref+0x2a98
	.word	0xa21d8009	! t0_kref+0x2a94:   	xor	%l6, %o1, %l1
	.word	0xa3418000	! t0_kref+0x2a98:   	mov	%fprs, %l1
	.word	0xe2500019	! t0_kref+0x2a9c:   	ldsh	[%g0 + %i1], %l1
	.word	0xa1a5094e	! t0_kref+0x2aa0:   	fmuld	%f20, %f14, %f16
	.word	0xf007bfe0	! t0_kref+0x2aa4:   	ld	[%fp - 0x20], %i0
	.word	0xa1b44aa8	! t0_kref+0x2aa8:   	fpsub16s	%f17, %f8, %f16
	.word	0xa3b70496	! t0_kref+0x2aac:   	fcmple32	%f28, %f22, %l1
	.word	0xa340c000	! t0_kref+0x2ab0:   	mov	%asi, %l1
	.word	0xe520a000	! t0_kref+0x2ab4:   	st	%f18, [%g2]
	.word	0xa5a0102d	! t0_kref+0x2ab8:   	fstox	%f13, %f18
	.word	0xe41e2018	! t0_kref+0x2abc:   	ldd	[%i0 + 0x18], %l2
	.word	0x3b480004	! t0_kref+0x2ac0:   	fble,a,pt	%fcc0, _kref+0x2ad0
	.word	0xb1a01a2c	! t0_kref+0x2ac4:   	fstoi	%f12, %f24
	.word	0x26800008	! t0_kref+0x2ac8:   	bl,a	_kref+0x2ae8
	.word	0xc1e6501a	! t0_kref+0x2acc:   	casa	[%i1]0x80, %i2, %g0
	.word	0x97a608af	! t0_kref+0x2ad0:   	fsubs	%f24, %f15, %f11
	.word	0xd86e7fe9	! t0_kref+0x2ad4:   	ldstub	[%i1 - 0x17], %o4
	.word	0xa274400b	! t0_kref+0x2ad8:   	udiv	%l1, %o3, %l1
	.word	0x2a800003	! t0_kref+0x2adc:   	bcs,a	_kref+0x2ae8
	.word	0xafa748b1	! t0_kref+0x2ae0:   	fsubs	%f29, %f17, %f23
	.word	0xa212bec6	! t0_kref+0x2ae4:   	or	%o2, -0x13a, %l1
	.word	0xd028a001	! t0_kref+0x2ae8:   	stb	%o0, [%g2 + 1]
	.word	0xdd06001c	! t0_kref+0x2aec:   	ld	[%i0 + %i4], %f14
	.word	0x2e480001	! t0_kref+0x2af0:   	bvs,a,pt	%icc, _kref+0x2af4
	.word	0xa3b184d4	! t0_kref+0x2af4:   	fcmpne32	%f6, %f20, %l1
	.word	0xb9a01915	! t0_kref+0x2af8:   	fitod	%f21, %f28
	.word	0xa3b2004d	! t0_kref+0x2afc:   	edge8l	%o0, %o5, %l1
	.word	0xa2330014	! t0_kref+0x2b00:   	orn	%o4, %l4, %l1
	.word	0x233821e9	! t0_kref+0x2b04:   	sethi	%hi(0xe087a400), %l1
	.word	0xb9a48958	! t0_kref+0x2b08:   	fmuld	%f18, %f24, %f28
	.word	0xf007bfe0	! t0_kref+0x2b0c:   	ld	[%fp - 0x20], %i0
	.word	0xa2440017	! t0_kref+0x2b10:   	addc	%l0, %l7, %l1
	.word	0xa2c4c017	! t0_kref+0x2b14:   	addccc	%l3, %l7, %l1
	.word	0xa2580011	! t0_kref+0x2b18:   	smul	%g0, %l1, %l1
	.word	0xa3400000	! t0_kref+0x2b1c:   	mov	%y, %l1
	.word	0xf7066018	! t0_kref+0x2b20:   	ld	[%i1 + 0x18], %f27
	call	SYM(t0_subr3)
	.word	0xf91fbd50	! t0_kref+0x2b28:   	ldd	[%fp - 0x2b0], %f28
	.word	0xe2167ff4	! t0_kref+0x2b2c:   	lduh	[%i1 - 0xc], %l1
	.word	0x81dc400a	! t0_kref+0x2b30:   	flush	%l1 + %o2
	.word	0xe200a020	! t0_kref+0x2b34:   	ld	[%g2 + 0x20], %l1
	.word	0xe120a028	! t0_kref+0x2b38:   	st	%f16, [%g2 + 0x28]
	.word	0x8da01934	! t0_kref+0x2b3c:   	fstod	%f20, %f6
!	.word	0x3bbd2d2e	! t0_kref+0x2b40:   	fble,a	SYM(t0_subr1)
	   	fble,a	SYM(t0_subr1)
	.word	0x9e00673c	! t0_kref+0x2b44:   	add	%g1, 0x73c, %o7
	.word	0xa274c015	! t0_kref+0x2b48:   	udiv	%l3, %l5, %l1
	.word	0xa2e4f53d	! t0_kref+0x2b4c:   	subccc	%l3, -0xac3, %l1
	.word	0xa33ae00c	! t0_kref+0x2b50:   	sra	%o3, 0xc, %l1
	.word	0xa2f4e49e	! t0_kref+0x2b54:   	udivcc	%l3, 0x49e, %l1
	.word	0x230c9639	! t0_kref+0x2b58:   	sethi	%hi(0x3258e400), %l1
	.word	0xcd981018	! t0_kref+0x2b5c:   	ldda	[%g0 + %i0]0x80, %f6
	.word	0x2c800003	! t0_kref+0x2b60:   	bneg,a	_kref+0x2b6c
	.word	0xa2b54000	! t0_kref+0x2b64:   	orncc	%l5, %g0, %l1
	.word	0xa9b68d90	! t0_kref+0x2b68:   	fxor	%f26, %f16, %f20
	.word	0xb5a01a37	! t0_kref+0x2b6c:   	fstoi	%f23, %f26
	.word	0xa2e57964	! t0_kref+0x2b70:   	subccc	%l5, -0x69c, %l1
	.word	0xe820a000	! t0_kref+0x2b74:   	st	%l4, [%g2]
	.word	0xa256e84e	! t0_kref+0x2b78:   	umul	%i3, 0x84e, %l1
	.word	0x21480008	! t0_kref+0x2b7c:   	fbn,a,pt	%fcc0, _kref+0x2b9c
	.word	0xe828a012	! t0_kref+0x2b80:   	stb	%l4, [%g2 + 0x12]
	.word	0xd3067fe8	! t0_kref+0x2b84:   	ld	[%i1 - 0x18], %f9
	.word	0xe46e4000	! t0_kref+0x2b88:   	ldstub	[%i1], %l2
	.word	0xb1b50a96	! t0_kref+0x2b8c:   	fpsub16	%f20, %f22, %f24
	.word	0x9bb50ea0	! t0_kref+0x2b90:   	fsrc1s	%f20, %f13
	.word	0xc12e2000	! t0_kref+0x2b94:   	st	%fsr, [%i0]
	.word	0x8143c000	! t0_kref+0x2b98:   	stbar
	.word	0xa202b14c	! t0_kref+0x2b9c:   	add	%o2, -0xeb4, %l1
	call	SYM(t0_subr1)
	.word	0xa5a01917	! t0_kref+0x2ba4:   	fitod	%f23, %f18
	.word	0xe41e4000	! t0_kref+0x2ba8:   	ldd	[%i1], %l2
	.word	0xd428a029	! t0_kref+0x2bac:   	stb	%o2, [%g2 + 0x29]
	.word	0xe81e001d	! t0_kref+0x2bb0:   	ldd	[%i0 + %i5], %l4
	.word	0xe3b8a080	! t0_kref+0x2bb4:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x231d01ee	! t0_kref+0x2bb8:   	sethi	%hi(0x7407b800), %l1
	.word	0xa3b2c00a	! t0_kref+0x2bbc:   	edge8	%o3, %o2, %l1
!	.word	0x204d2d0e	! t0_kref+0x2bc0:   	bn,a,pt	%icc, SYM(t0_subr1)
	   	bn,a,pt	%icc, SYM(t0_subr1)
	.word	0x9e0067bc	! t0_kref+0x2bc4:   	add	%g1, 0x7bc, %o7
	.word	0xd5f65011	! t0_kref+0x2bc8:   	casxa	[%i1]0x80, %l1, %o2
	.word	0xa3b300db	! t0_kref+0x2bcc:   	edge16l	%o4, %i3, %l1
	.word	0xe8180018	! t0_kref+0x2bd0:   	ldd	[%g0 + %i0], %l4
	.word	0xc020a030	! t0_kref+0x2bd4:   	clr	[%g2 + 0x30]
	.word	0xe820a038	! t0_kref+0x2bd8:   	st	%l4, [%g2 + 0x38]
	.word	0x85858011	! t0_kref+0x2bdc:   	wr	%l6, %l1, %ccr
	.word	0xd6200018	! t0_kref+0x2be0:   	st	%o3, [%g0 + %i0]
	.word	0xa25ca180	! t0_kref+0x2be4:   	smul	%l2, 0x180, %l1
	.word	0xe3b8a080	! t0_kref+0x2be8:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xe3b8a080	! t0_kref+0x2bec:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xa325c012	! t0_kref+0x2bf0:   	mulscc	%l7, %l2, %l1
	.word	0x99b38748	! t0_kref+0x2bf4:   	fpack32	%f14, %f8, %f12
	.word	0x20480008	! t0_kref+0x2bf8:   	bn,a,pt	%icc, _kref+0x2c18
	.word	0xe2480019	! t0_kref+0x2bfc:   	ldsb	[%g0 + %i1], %l1
	.word	0x38800003	! t0_kref+0x2c00:   	bgu,a	_kref+0x2c0c
	.word	0xa2bd7a49	! t0_kref+0x2c04:   	xnorcc	%l5, -0x5b7, %l1
	.word	0xe2564000	! t0_kref+0x2c08:   	ldsh	[%i1], %l1
	.word	0xe286501c	! t0_kref+0x2c0c:   	lda	[%i1 + %i4]0x80, %l1
	.word	0xa30b4015	! t0_kref+0x2c10:   	tsubcc	%o5, %l5, %l1
	.word	0x81ab8a48	! t0_kref+0x2c14:   	fcmpd	%fcc0, %f14, %f8
	.word	0xa206fb0f	! t0_kref+0x2c18:   	add	%i3, -0x4f1, %l1
	.word	0x95a188d4	! t0_kref+0x2c1c:   	fsubd	%f6, %f20, %f10
	.word	0x99a30956	! t0_kref+0x2c20:   	fmuld	%f12, %f22, %f12
	.word	0x26800001	! t0_kref+0x2c24:   	bl,a	_kref+0x2c28
	.word	0xa2c6800d	! t0_kref+0x2c28:   	addccc	%i2, %o5, %l1
	.word	0x91a70848	! t0_kref+0x2c2c:   	faddd	%f28, %f8, %f8
	.word	0xbba409b6	! t0_kref+0x2c30:   	fdivs	%f16, %f22, %f29
	.word	0x81ab8a4e	! t0_kref+0x2c34:   	fcmpd	%fcc0, %f14, %f14
	.word	0xe246001c	! t0_kref+0x2c38:   	ldsw	[%i0 + %i4], %l1
	.word	0xe2162008	! t0_kref+0x2c3c:   	lduh	[%i0 + 8], %l1
	.word	0xe9ee501c	! t0_kref+0x2c40:   	prefetcha	%i1 + %i4, 20
	.word	0x86102006	! t0_kref+0x2c44:   	mov	0x6, %g3
	.word	0x86a0e001	! t0_kref+0x2c48:   	subcc	%g3, 1, %g3
	.word	0x2280001d	! t0_kref+0x2c4c:   	be,a	_kref+0x2cc0
	.word	0xc06e8019	! t0_kref+0x2c50:   	ldstub	[%i2 + %i1], %g0
	.word	0xdd000018	! t0_kref+0x2c54:   	ld	[%g0 + %i0], %f14
	.word	0xa202f797	! t0_kref+0x2c58:   	add	%o3, -0x869, %l1
	.word	0xe3b8a080	! t0_kref+0x2c5c:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xb1a01917	! t0_kref+0x2c60:   	fitod	%f23, %f24
	.word	0xa232bdd2	! t0_kref+0x2c64:   	orn	%o2, -0x22e, %l1
	.word	0x99a0055a	! t0_kref+0x2c68:   	fsqrtd	%f26, %f12
	.word	0xa31d3e31	! t0_kref+0x2c6c:   	tsubcctv	%l4, -0x1cf, %l1
	.word	0xa2b32db2	! t0_kref+0x2c70:   	orncc	%o4, 0xdb2, %l1
	.word	0xd11fbcc0	! t0_kref+0x2c74:   	ldd	[%fp - 0x340], %f8
	.word	0x9da38948	! t0_kref+0x2c78:   	fmuld	%f14, %f8, %f14
	.word	0xe240a018	! t0_kref+0x2c7c:   	ldsw	[%g2 + 0x18], %l1
	.word	0xc12e001c	! t0_kref+0x2c80:   	st	%fsr, [%i0 + %i4]
	.word	0x91a30948	! t0_kref+0x2c84:   	fmuld	%f12, %f8, %f8
	.word	0xb5b28f8a	! t0_kref+0x2c88:   	for	%f10, %f10, %f26
	.word	0x9fa018d8	! t0_kref+0x2c8c:   	fdtos	%f24, %f15
	.word	0x3c4fffee	! t0_kref+0x2c90:   	bpos,a,pt	%icc, _kref+0x2c48
	.word	0xeb68a084	! t0_kref+0x2c94:   	prefetch	%g2 + 0x84, 21
	.word	0x8db00c00	! t0_kref+0x2c98:   	fzero	%f6
	.word	0xa2032672	! t0_kref+0x2c9c:   	add	%o4, 0x672, %l1
	.word	0x81dac000	! t0_kref+0x2ca0:   	flush	%o3
	.word	0xef260000	! t0_kref+0x2ca4:   	st	%f23, [%i0]
	.word	0xd9200019	! t0_kref+0x2ca8:   	st	%f12, [%g0 + %i1]
	.word	0xa20379f5	! t0_kref+0x2cac:   	add	%o5, -0x60b, %l1
	.word	0xa2d2e039	! t0_kref+0x2cb0:   	umulcc	%o3, 0x39, %l1
	.word	0xb7a01a2d	! t0_kref+0x2cb4:   	fstoi	%f13, %f27
	.word	0xa2aa7d33	! t0_kref+0x2cb8:   	andncc	%o1, -0x2cd, %l1
	.word	0xe2160000	! t0_kref+0x2cbc:   	lduh	[%i0], %l1
	.word	0x9db68a58	! t0_kref+0x2cc0:   	fpadd32	%f26, %f24, %f14
	.word	0xb5a90058	! t0_kref+0x2cc4:   	fmovdl	%fcc0, %f24, %f26
	.word	0xb410200c	! t0_kref+0x2cc8:   	mov	0xc, %i2
	.word	0x91a40846	! t0_kref+0x2ccc:   	faddd	%f16, %f6, %f8
	.word	0xa3b2040e	! t0_kref+0x2cd0:   	fcmple16	%f8, %f14, %l1
	.word	0xe2480019	! t0_kref+0x2cd4:   	ldsb	[%g0 + %i1], %l1
	.word	0xa3400000	! t0_kref+0x2cd8:   	mov	%y, %l1
	.word	0x91a30956	! t0_kref+0x2cdc:   	fmuld	%f12, %f22, %f8
	.word	0xd06e401a	! t0_kref+0x2ce0:   	ldstub	[%i1 + %i2], %o0
	.word	0xc807bff0	! t0_kref+0x2ce4:   	ld	[%fp - 0x10], %g4
	.word	0xa2850013	! t0_kref+0x2ce8:   	addcc	%l4, %l3, %l1
	.word	0xd220a030	! t0_kref+0x2cec:   	st	%o1, [%g2 + 0x30]
	call	SYM(t0_subr3)
	.word	0xd620a030	! t0_kref+0x2cf4:   	st	%o3, [%g2 + 0x30]
	.word	0x2c800002	! t0_kref+0x2cf8:   	bneg,a	_kref+0x2d00
	.word	0xa2c57004	! t0_kref+0x2cfc:   	addccc	%l5, -0xffc, %l1
	.word	0xa9a288c6	! t0_kref+0x2d00:   	fsubd	%f10, %f6, %f20
	.word	0xda28a02b	! t0_kref+0x2d04:   	stb	%o5, [%g2 + 0x2b]
	.word	0xa246c016	! t0_kref+0x2d08:   	addc	%i3, %l6, %l1
	.word	0x9de3bfa0	! t0_kref+0x2d0c:   	save	%sp, -0x60, %sp
	.word	0xa3ef4019	! t0_kref+0x2d10:   	restore	%i5, %i1, %l1
	.word	0x9de3bfa0	! t0_kref+0x2d14:   	save	%sp, -0x60, %sp
	.word	0xb4a83c7e	! t0_kref+0x2d18:   	andncc	%g0, -0x382, %i2
	.word	0xa3e8001a	! t0_kref+0x2d1c:   	restore	%g0, %i2, %l1
	.word	0xd5f65014	! t0_kref+0x2d20:   	casxa	[%i1]0x80, %l4, %o2
	.word	0x24800006	! t0_kref+0x2d24:   	ble,a	_kref+0x2d3c
	.word	0xb3b20db1	! t0_kref+0x2d28:   	fxors	%f8, %f17, %f25
	.word	0xa2300000	! t0_kref+0x2d2c:   	orn	%g0, %g0, %l1
	.word	0xe2167fe2	! t0_kref+0x2d30:   	lduh	[%i1 - 0x1e], %l1
	.word	0x8143c000	! t0_kref+0x2d34:   	stbar
	.word	0xe2871018	! t0_kref+0x2d38:   	lda	[%i4 + %i0]0x80, %l1
	.word	0xdf070019	! t0_kref+0x2d3c:   	ld	[%i4 + %i1], %f15
	.word	0xe3b8a080	! t0_kref+0x2d40:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xe2566006	! t0_kref+0x2d44:   	ldsh	[%i1 + 6], %l1
	.word	0x25800006	! t0_kref+0x2d48:   	fblg,a	_kref+0x2d60
	.word	0xa2e5c010	! t0_kref+0x2d4c:   	subccc	%l7, %l0, %l1
	.word	0xa3a00138	! t0_kref+0x2d50:   	fabss	%f24, %f17
	.word	0xd11fbf40	! t0_kref+0x2d54:   	ldd	[%fp - 0xc0], %f8
	.word	0xa2d50013	! t0_kref+0x2d58:   	umulcc	%l4, %l3, %l1
	.word	0xf1be501d	! t0_kref+0x2d5c:   	stda	%f24, [%i1 + %i5]0x80
	.word	0x9da30d31	! t0_kref+0x2d60:   	fsmuld	%f12, %f17, %f14
	.word	0xa3b28586	! t0_kref+0x2d64:   	fcmpgt32	%f10, %f6, %l1
	.word	0xe2466008	! t0_kref+0x2d68:   	ldsw	[%i1 + 8], %l1
	.word	0xe66e8018	! t0_kref+0x2d6c:   	ldstub	[%i2 + %i0], %l3
	.word	0x39480001	! t0_kref+0x2d70:   	fbuge,a,pt	%fcc0, _kref+0x2d74
	.word	0xd8680019	! t0_kref+0x2d74:   	ldstub	[%g0 + %i1], %o4
	.word	0x91a30856	! t0_kref+0x2d78:   	faddd	%f12, %f22, %f8
	.word	0xadab0048	! t0_kref+0x2d7c:   	fmovduge	%fcc0, %f8, %f22
	.word	0x91a289d6	! t0_kref+0x2d80:   	fdivd	%f10, %f22, %f8
	.word	0xe2567ffa	! t0_kref+0x2d84:   	ldsh	[%i1 - 6], %l1
	.word	0xe20e0000	! t0_kref+0x2d88:   	ldub	[%i0], %l1
	.word	0xe200a008	! t0_kref+0x2d8c:   	ld	[%g2 + 8], %l1
	.word	0x8143c000	! t0_kref+0x2d90:   	stbar
	.word	0xe206401c	! t0_kref+0x2d94:   	ld	[%i1 + %i4], %l1
	.word	0xee20a018	! t0_kref+0x2d98:   	st	%l7, [%g2 + 0x18]
	.word	0xea6e0000	! t0_kref+0x2d9c:   	ldstub	[%i0], %l5
	.word	0xbba01a2c	! t0_kref+0x2da0:   	fstoi	%f12, %f29
	.word	0xe2de101d	! t0_kref+0x2da4:   	ldxa	[%i0 + %i5]0x80, %l1
	.word	0xa3400000	! t0_kref+0x2da8:   	mov	%y, %l1
	.word	0x32800003	! t0_kref+0x2dac:   	bne,a	_kref+0x2db8
	.word	0xa21ac00b	! t0_kref+0x2db0:   	xor	%o3, %o3, %l1
	.word	0xa32021a5	! t0_kref+0x2db4:   	mulscc	%g0, 0x1a5, %l1
	.word	0xa2e34012	! t0_kref+0x2db8:   	subccc	%o5, %l2, %l1
	.word	0xa2848000	! t0_kref+0x2dbc:   	addcc	%l2, %g0, %l1
	.word	0xb1a8802c	! t0_kref+0x2dc0:   	fmovslg	%fcc0, %f12, %f24
	.word	0x39480002	! t0_kref+0x2dc4:   	fbuge,a,pt	%fcc0, _kref+0x2dcc
	.word	0x8143c000	! t0_kref+0x2dc8:   	stbar
	.word	0xa2d4c008	! t0_kref+0x2dcc:   	umulcc	%l3, %o0, %l1
	.word	0xe81e6018	! t0_kref+0x2dd0:   	ldd	[%i1 + 0x18], %l4
	.word	0xda30a000	! t0_kref+0x2dd4:   	sth	%o5, [%g2]
	.word	0xa1a01936	! t0_kref+0x2dd8:   	fstod	%f22, %f16
	.word	0xd91fbf28	! t0_kref+0x2ddc:   	ldd	[%fp - 0xd8], %f12
	.word	0x93a00130	! t0_kref+0x2de0:   	fabss	%f16, %f9
	.word	0xe296d018	! t0_kref+0x2de4:   	lduha	[%i3 + %i0]0x80, %l1
	.word	0xc3ee500d	! t0_kref+0x2de8:   	prefetcha	%i1 + %o5, 1
	.word	0xa216c00d	! t0_kref+0x2dec:   	or	%i3, %o5, %l1
	.word	0xe66e3feb	! t0_kref+0x2df0:   	ldstub	[%i0 - 0x15], %l3
	.word	0x32800001	! t0_kref+0x2df4:   	bne,a	_kref+0x2df8
	.word	0xa2a571fe	! t0_kref+0x2df8:   	subcc	%l5, -0xe02, %l1
	.word	0x8da6084a	! t0_kref+0x2dfc:   	faddd	%f24, %f10, %f6
	.word	0xa5a000b2	! t0_kref+0x2e00:   	fnegs	%f18, %f18
	.word	0x2f480005	! t0_kref+0x2e04:   	fbu,a,pt	%fcc0, _kref+0x2e18
	.word	0xe210a030	! t0_kref+0x2e08:   	lduh	[%g2 + 0x30], %l1
	.word	0xa9b00c00	! t0_kref+0x2e0c:   	fzero	%f20
	.word	0xa33e801b	! t0_kref+0x2e10:   	sra	%i2, %i3, %l1
	.word	0xa334801b	! t0_kref+0x2e14:   	srl	%l2, %i3, %l1
	.word	0xf300a020	! t0_kref+0x2e18:   	ld	[%g2 + 0x20], %f25
	.word	0xa3358009	! t0_kref+0x2e1c:   	srl	%l6, %o1, %l1
	.word	0xf91fbe88	! t0_kref+0x2e20:   	ldd	[%fp - 0x178], %f28
	.word	0xf19e101d	! t0_kref+0x2e24:   	ldda	[%i0 + %i5]0x80, %f24
	.word	0xe0363fec	! t0_kref+0x2e28:   	sth	%l0, [%i0 - 0x14]
	.word	0x3c800006	! t0_kref+0x2e2c:   	bpos,a	_kref+0x2e44
	.word	0xe2070019	! t0_kref+0x2e30:   	ld	[%i4 + %i1], %l1
	.word	0xec364000	! t0_kref+0x2e34:   	sth	%l6, [%i1]
	.word	0xba102008	! t0_kref+0x2e38:   	mov	0x8, %i5
	.word	0x95a018d4	! t0_kref+0x2e3c:   	fdtos	%f20, %f10
	.word	0xa2346a84	! t0_kref+0x2e40:   	orn	%l1, 0xa84, %l1
	.word	0x91a01934	! t0_kref+0x2e44:   	fstod	%f20, %f8
	.word	0xa3b204dc	! t0_kref+0x2e48:   	fcmpne32	%f8, %f28, %l1
	.word	0x9da000b1	! t0_kref+0x2e4c:   	fnegs	%f17, %f14
	.word	0xa2124015	! t0_kref+0x2e50:   	or	%o1, %l5, %l1
	.word	0xa33ce00c	! t0_kref+0x2e54:   	sra	%l3, 0xc, %l1
	.word	0x30800001	! t0_kref+0x2e58:   	ba,a	_kref+0x2e5c
	.word	0x95a018c6	! t0_kref+0x2e5c:   	fdtos	%f6, %f10
	.word	0xe256401b	! t0_kref+0x2e60:   	ldsh	[%i1 + %i3], %l1
	.word	0x22800002	! t0_kref+0x2e64:   	be,a	_kref+0x2e6c
	.word	0xa206c00b	! t0_kref+0x2e68:   	add	%i3, %o3, %l1
	.word	0x91a50952	! t0_kref+0x2e6c:   	fmuld	%f20, %f18, %f8
	.word	0xa1a18852	! t0_kref+0x2e70:   	faddd	%f6, %f18, %f16
	.word	0xe24e8018	! t0_kref+0x2e74:   	ldsb	[%i2 + %i0], %l1
	.word	0xe51fbf60	! t0_kref+0x2e78:   	ldd	[%fp - 0xa0], %f18
	.word	0xb9a018ce	! t0_kref+0x2e7c:   	fdtos	%f14, %f28
	.word	0x9fa6c92a	! t0_kref+0x2e80:   	fmuls	%f27, %f10, %f15
	.word	0xb3a00038	! t0_kref+0x2e84:   	fmovs	%f24, %f25
	.word	0x34800003	! t0_kref+0x2e88:   	bg,a	_kref+0x2e94
	.word	0xa21b3784	! t0_kref+0x2e8c:   	xor	%o4, -0x87c, %l1
	.word	0xda26401c	! t0_kref+0x2e90:   	st	%o5, [%i1 + %i4]
	.word	0xa21a30cf	! t0_kref+0x2e94:   	xor	%o0, -0xf31, %l1
	.word	0xa3b5409a	! t0_kref+0x2e98:   	edge16	%l5, %i2, %l1
	.word	0xb9a289bc	! t0_kref+0x2e9c:   	fdivs	%f10, %f28, %f28
	.word	0xa29b400c	! t0_kref+0x2ea0:   	xorcc	%o5, %o4, %l1
	.word	0x001fffff	! t0_kref+0x2ea4:   	illtrap	0x1fffff
	.word	0xc807bfec	! t0_kref+0x2ea8:   	ld	[%fp - 0x14], %g4
	call	SYM(t0_subr0)
	.word	0xc06e8019	! t0_kref+0x2eb0:   	ldstub	[%i2 + %i1], %g0
	.word	0xe2164000	! t0_kref+0x2eb4:   	lduh	[%i1], %l1
	.word	0x95a018d6	! t0_kref+0x2eb8:   	fdtos	%f22, %f10
	.word	0x9da3095a	! t0_kref+0x2ebc:   	fmuld	%f12, %f26, %f14
	.word	0xa21c3c8d	! t0_kref+0x2ec0:   	xor	%l0, -0x373, %l1
	.word	0xe2901018	! t0_kref+0x2ec4:   	lduha	[%g0 + %i0]0x80, %l1
	.word	0x81ae4a2f	! t0_kref+0x2ec8:   	fcmps	%fcc0, %f25, %f15
	.word	0xa1a0192d	! t0_kref+0x2ecc:   	fstod	%f13, %f16
	.word	0xd900a010	! t0_kref+0x2ed0:   	ld	[%g2 + 0x10], %f12
	call	SYM(t0_subr1)
	.word	0xa2e48008	! t0_kref+0x2ed8:   	subccc	%l2, %o0, %l1
	.word	0xa284629c	! t0_kref+0x2edc:   	addcc	%l1, 0x29c, %l1
	.word	0xa25c0017	! t0_kref+0x2ee0:   	smul	%l0, %l7, %l1
	.word	0xe41e401d	! t0_kref+0x2ee4:   	ldd	[%i1 + %i5], %l2
	.word	0xb3a6482c	! t0_kref+0x2ee8:   	fadds	%f25, %f12, %f25
	.word	0xd8364000	! t0_kref+0x2eec:   	sth	%o4, [%i1]
	.word	0xb9a509d2	! t0_kref+0x2ef0:   	fdivd	%f20, %f18, %f28
	.word	0xe620a030	! t0_kref+0x2ef4:   	st	%l3, [%g2 + 0x30]
	.word	0xa22eafc6	! t0_kref+0x2ef8:   	andn	%i2, 0xfc6, %l1
	.word	0xe2965000	! t0_kref+0x2efc:   	lduha	[%i1]0x80, %l1
	.word	0x3f480005	! t0_kref+0x2f00:   	fbo,a,pt	%fcc0, _kref+0x2f14
	.word	0xb3b20af1	! t0_kref+0x2f04:   	fpsub32s	%f8, %f17, %f25
	.word	0x81ab4a2b	! t0_kref+0x2f08:   	fcmps	%fcc0, %f13, %f11
	.word	0x2c480006	! t0_kref+0x2f0c:   	bneg,a,pt	%icc, _kref+0x2f24
	.word	0xe216001b	! t0_kref+0x2f10:   	lduh	[%i0 + %i3], %l1
	.word	0xb7b00cee	! t0_kref+0x2f14:   	fnot2s	%f14, %f27
	.word	0x9db70638	! t0_kref+0x2f18:   	fmul8x16	%f28, %f24, %f14
	.word	0xe3b8a080	! t0_kref+0x2f1c:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xe9070018	! t0_kref+0x2f20:   	ld	[%i4 + %i0], %f20
	.word	0xeb20a020	! t0_kref+0x2f24:   	st	%f21, [%g2 + 0x20]
	.word	0xa2d339e3	! t0_kref+0x2f28:   	umulcc	%o4, -0x61d, %l1
	.word	0xe248a023	! t0_kref+0x2f2c:   	ldsb	[%g2 + 0x23], %l1
	.word	0x81a9caac	! t0_kref+0x2f30:   	fcmpes	%fcc0, %f7, %f12
	.word	0xb7b24cb0	! t0_kref+0x2f34:   	fandnot2s	%f9, %f16, %f27
	.word	0x2319bc5a	! t0_kref+0x2f38:   	sethi	%hi(0x66f16800), %l1
	.word	0xd900a008	! t0_kref+0x2f3c:   	ld	[%g2 + 8], %f12
	.word	0xebee101c	! t0_kref+0x2f40:   	prefetcha	%i0 + %i4, 21
	.word	0xe216c019	! t0_kref+0x2f44:   	lduh	[%i3 + %i1], %l1
	.word	0xb3a3c926	! t0_kref+0x2f48:   	fmuls	%f15, %f6, %f25
	.word	0xa296e7db	! t0_kref+0x2f4c:   	orcc	%i3, 0x7db, %l1
	.word	0xa3b6c0ea	! t0_kref+0x2f50:   	edge16ln	%i3, %o2, %l1
	.word	0x86102002	! t0_kref+0x2f54:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x2f58:   	bne,a	_kref+0x2f58
	.word	0x86a0e001	! t0_kref+0x2f5c:   	subcc	%g3, 1, %g3
	.word	0xa28c0012	! t0_kref+0x2f60:   	andcc	%l0, %l2, %l1
	.word	0xe20e001a	! t0_kref+0x2f64:   	ldub	[%i0 + %i2], %l1
	.word	0xa5a5884c	! t0_kref+0x2f68:   	faddd	%f22, %f12, %f18
	.word	0xe240a030	! t0_kref+0x2f6c:   	ldsw	[%g2 + 0x30], %l1
	.word	0x3e800003	! t0_kref+0x2f70:   	bvc,a	_kref+0x2f7c
	.word	0xe210a000	! t0_kref+0x2f74:   	lduh	[%g2], %l1
	.word	0xa3702eac	! t0_kref+0x2f78:   	popc	0xeac, %l1
	.word	0xe256401b	! t0_kref+0x2f7c:   	ldsh	[%i1 + %i3], %l1
	.word	0xa3b40337	! t0_kref+0x2f80:   	bmask	%l0, %l7, %l1
	.word	0xe248a03b	! t0_kref+0x2f84:   	ldsb	[%g2 + 0x3b], %l1
	.word	0x81ae0a33	! t0_kref+0x2f88:   	fcmps	%fcc0, %f24, %f19
	.word	0xe216200c	! t0_kref+0x2f8c:   	lduh	[%i0 + 0xc], %l1
	.word	0xa5b28a73	! t0_kref+0x2f90:   	fpadd32s	%f10, %f19, %f18
	.word	0xd920a018	! t0_kref+0x2f94:   	st	%f12, [%g2 + 0x18]
	.word	0x9fb24fbb	! t0_kref+0x2f98:   	fors	%f9, %f27, %f15
	.word	0x39800005	! t0_kref+0x2f9c:   	fbuge,a	_kref+0x2fb0
	.word	0xc07e3fe0	! t0_kref+0x2fa0:   	swap	[%i0 - 0x20], %g0
	.word	0xe6366010	! t0_kref+0x2fa4:   	sth	%l3, [%i1 + 0x10]
	.word	0xc12e401c	! t0_kref+0x2fa8:   	st	%fsr, [%i1 + %i4]
	.word	0xe250a002	! t0_kref+0x2fac:   	ldsh	[%g2 + 2], %l1
	.word	0xa29c800b	! t0_kref+0x2fb0:   	xorcc	%l2, %o3, %l1
	.word	0xe2564000	! t0_kref+0x2fb4:   	ldsh	[%i1], %l1
	.word	0xb5a28854	! t0_kref+0x2fb8:   	faddd	%f10, %f20, %f26
	.word	0xe5ee501d	! t0_kref+0x2fbc:   	prefetcha	%i1 + %i5, 18
	.word	0x8da408c6	! t0_kref+0x2fc0:   	fsubd	%f16, %f6, %f6
	.word	0xa22ac01b	! t0_kref+0x2fc4:   	andn	%o3, %i3, %l1
	.word	0xa2d80017	! t0_kref+0x2fc8:   	smulcc	%g0, %l7, %l1
	.word	0x95b386f2	! t0_kref+0x2fcc:   	fmul8ulx16	%f14, %f18, %f10
	.word	0xbbb00ce9	! t0_kref+0x2fd0:   	fnot2s	%f9, %f29
	.word	0xa274b04f	! t0_kref+0x2fd4:   	udiv	%l2, -0xfb1, %l1
	call	SYM(t0_subr1)
	.word	0x9fb0076e	! t0_kref+0x2fdc:   	fpack16	%f14, %f15
	.word	0xa31d37d7	! t0_kref+0x2fe0:   	tsubcctv	%l4, -0x829, %l1
	.word	0xe030a038	! t0_kref+0x2fe4:   	sth	%l0, [%g2 + 0x38]
	.word	0x81df764f	! t0_kref+0x2fe8:   	flush	%i5 - 0x9b1
	.word	0x9de3bfa0	! t0_kref+0x2fec:   	save	%sp, -0x60, %sp
	.word	0xb6bea6e6	! t0_kref+0x2ff0:   	xnorcc	%i2, 0x6e6, %i3
	.word	0xa3ef7e30	! t0_kref+0x2ff4:   	restore	%i5, -0x1d0, %l1
	.word	0xed981018	! t0_kref+0x2ff8:   	ldda	[%g0 + %i0]0x80, %f22
	.word	0xe3b8a080	! t0_kref+0x2ffc:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xa334201b	! t0_kref+0x3000:   	srl	%l0, 0x1b, %l1
	.word	0xe2460000	! t0_kref+0x3004:   	ldsw	[%i0], %l1
	.word	0x23375f63	! t0_kref+0x3008:   	sethi	%hi(0xdd7d8c00), %l1
	.word	0xe256c018	! t0_kref+0x300c:   	ldsh	[%i3 + %i0], %l1
	.word	0xf300a030	! t0_kref+0x3010:   	ld	[%g2 + 0x30], %f25
	.word	0xc020a000	! t0_kref+0x3014:   	clr	[%g2]
	.word	0xa2724011	! t0_kref+0x3018:   	udiv	%o1, %l1, %l1
	.word	0xa322000a	! t0_kref+0x301c:   	mulscc	%o0, %o2, %l1
	.word	0xa3b18516	! t0_kref+0x3020:   	fcmpgt16	%f6, %f22, %l1
	.word	0xb3a3892e	! t0_kref+0x3024:   	fmuls	%f14, %f14, %f25
	.word	0xa246f15a	! t0_kref+0x3028:   	addc	%i3, -0xea6, %l1
	.word	0xd820a030	! t0_kref+0x302c:   	st	%o4, [%g2 + 0x30]
	.word	0xa29b4012	! t0_kref+0x3030:   	xorcc	%o5, %l2, %l1
	.word	0xe630a00a	! t0_kref+0x3034:   	sth	%l3, [%g2 + 0xa]
	.word	0xf207bfe0	! t0_kref+0x3038:   	ld	[%fp - 0x20], %i1
	.word	0xa3b24093	! t0_kref+0x303c:   	edge16	%o1, %l3, %l1
	.word	0xd26e3fe6	! t0_kref+0x3040:   	ldstub	[%i0 - 0x1a], %o1
	.word	0xe2de1000	! t0_kref+0x3044:   	ldxa	[%i0]0x80, %l1
	.word	0xa28aa959	! t0_kref+0x3048:   	andcc	%o2, 0x959, %l1
	.word	0x81d83821	! t0_kref+0x304c:   	flush	%g0 - 0x7df
	.word	0x9de3bfa0	! t0_kref+0x3050:   	save	%sp, -0x60, %sp
	.word	0xb8366b1e	! t0_kref+0x3054:   	orn	%i1, 0xb1e, %i4
	.word	0xa3ef001a	! t0_kref+0x3058:   	restore	%i4, %i2, %l1
	.word	0xaba00531	! t0_kref+0x305c:   	fsqrts	%f17, %f21
	.word	0xd5e61010	! t0_kref+0x3060:   	casa	[%i0]0x80, %l0, %o2
	.word	0x81ac0a50	! t0_kref+0x3064:   	fcmpd	%fcc0, %f16, %f16
	.word	0xb1b6cea0	! t0_kref+0x3068:   	fsrc1s	%f27, %f24
	.word	0xe9000018	! t0_kref+0x306c:   	ld	[%g0 + %i0], %f20
	.word	0x91a189ba	! t0_kref+0x3070:   	fdivs	%f6, %f26, %f8
	.word	0x30800006	! t0_kref+0x3074:   	ba,a	_kref+0x308c
	.word	0xe25e7fe8	! t0_kref+0x3078:   	ldx	[%i1 - 0x18], %l1
	.word	0x81da800b	! t0_kref+0x307c:   	flush	%o2 + %o3
	.word	0xe24e600d	! t0_kref+0x3080:   	ldsb	[%i1 + 0xd], %l1
	.word	0x99a388b0	! t0_kref+0x3084:   	fsubs	%f14, %f16, %f12
	.word	0xb9b007a8	! t0_kref+0x3088:   	fpackfix	%f8, %f28
	.word	0xa2134010	! t0_kref+0x308c:   	or	%o5, %l0, %l1
	.word	0xa3b20357	! t0_kref+0x3090:   	alignaddrl	%o0, %l7, %l1
	.word	0xe41e6010	! t0_kref+0x3094:   	ldd	[%i1 + 0x10], %l2
	.word	0x9fa01a50	! t0_kref+0x3098:   	fdtoi	%f16, %f15
	.word	0xe250a02a	! t0_kref+0x309c:   	ldsh	[%g2 + 0x2a], %l1
	.word	0xe5064000	! t0_kref+0x30a0:   	ld	[%i1], %f18
	.word	0xa21d0012	! t0_kref+0x30a4:   	xor	%l4, %l2, %l1
	.word	0xa218318f	! t0_kref+0x30a8:   	xor	%g0, -0xe71, %l1
	.word	0xe3b8a080	! t0_kref+0x30ac:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x3a800007	! t0_kref+0x30b0:   	bcc,a	_kref+0x30cc
	.word	0xa2458013	! t0_kref+0x30b4:   	addc	%l6, %l3, %l1
	.word	0xd91fbce0	! t0_kref+0x30b8:   	ldd	[%fp - 0x320], %f12
	.word	0xa27227c4	! t0_kref+0x30bc:   	udiv	%o0, 0x7c4, %l1
	.word	0xa212c01a	! t0_kref+0x30c0:   	or	%o3, %i2, %l1
	.word	0x8fa018c6	! t0_kref+0x30c4:   	fdtos	%f6, %f7
	.word	0xe296d019	! t0_kref+0x30c8:   	lduha	[%i3 + %i1]0x80, %l1
	.word	0xa3b58052	! t0_kref+0x30cc:   	edge8l	%l6, %l2, %l1
	.word	0xd828a012	! t0_kref+0x30d0:   	stb	%o4, [%g2 + 0x12]
	.word	0x99b60ed0	! t0_kref+0x30d4:   	fornot2	%f24, %f16, %f12
	.word	0x36800007	! t0_kref+0x30d8:   	bge,a	_kref+0x30f4
	.word	0x9db00f1a	! t0_kref+0x30dc:   	fsrc2	%f26, %f14
	.word	0x24800008	! t0_kref+0x30e0:   	ble,a	_kref+0x3100
	.word	0xa2acfd43	! t0_kref+0x30e4:   	andncc	%l3, -0x2bd, %l1
	.word	0xb5a4095c	! t0_kref+0x30e8:   	fmuld	%f16, %f28, %f26
	.word	0xe4680018	! t0_kref+0x30ec:   	ldstub	[%g0 + %i0], %l2
	.word	0xd830a032	! t0_kref+0x30f0:   	sth	%o4, [%g2 + 0x32]
	.word	0x3a480001	! t0_kref+0x30f4:   	bcc,a,pt	%icc, _kref+0x30f8
	.word	0xb3b2cf72	! t0_kref+0x30f8:   	fornot1s	%f11, %f18, %f25
	.word	0xa2fd2fd1	! t0_kref+0x30fc:   	sdivcc	%l4, 0xfd1, %l1
	.word	0xa1b2c974	! t0_kref+0x3100:   	fpmerge	%f11, %f20, %f16
	.word	0x86102013	! t0_kref+0x3104:   	mov	0x13, %g3
	.word	0x86a0e001	! t0_kref+0x3108:   	subcc	%g3, 1, %g3
	.word	0x2280000f	! t0_kref+0x310c:   	be,a	_kref+0x3148
	.word	0xd19e501d	! t0_kref+0x3110:   	ldda	[%i1 + %i5]0x80, %f8
	.word	0xe41e3ff0	! t0_kref+0x3114:   	ldd	[%i0 - 0x10], %l2
	.word	0xadb00c20	! t0_kref+0x3118:   	fzeros	%f22
	.word	0xa22b0015	! t0_kref+0x311c:   	andn	%o4, %l5, %l1
	.word	0xe20e001a	! t0_kref+0x3120:   	ldub	[%i0 + %i2], %l1
	.word	0xa5a01919	! t0_kref+0x3124:   	fitod	%f25, %f18
	.word	0xb1a018dc	! t0_kref+0x3128:   	fdtos	%f28, %f24
	.word	0x81ac0a48	! t0_kref+0x312c:   	fcmpd	%fcc0, %f16, %f8
	.word	0xa21d8010	! t0_kref+0x3130:   	xor	%l6, %l0, %l1
	.word	0x8186c000	! t0_kref+0x3134:   	wr	%i3, %g0, %y
	.word	0xa3400000	! t0_kref+0x3138:   	mov	%y, %l1
	.word	0xa29b4012	! t0_kref+0x313c:   	xorcc	%o5, %l2, %l1
	.word	0xe1e6101a	! t0_kref+0x3140:   	casa	[%i0]0x80, %i2, %l0
	.word	0x9fc10000	! t0_kref+0x3144:   	call	%g4
	.word	0xa1a0015c	! t0_kref+0x3148:   	fabsd	%f28, %f16
	.word	0xdd1fbda8	! t0_kref+0x314c:   	ldd	[%fp - 0x258], %f14
	.word	0x99b00f0c	! t0_kref+0x3150:   	fsrc2	%f12, %f12
	.word	0xe620a028	! t0_kref+0x3154:   	st	%l3, [%g2 + 0x28]
	.word	0x9da30d35	! t0_kref+0x3158:   	fsmuld	%f12, %f21, %f14
	.word	0xd86e8019	! t0_kref+0x315c:   	ldstub	[%i2 + %i1], %o4
	.word	0x29480005	! t0_kref+0x3160:   	fbl,a,pt	%fcc0, _kref+0x3174
	.word	0x91b18d88	! t0_kref+0x3164:   	fxor	%f6, %f8, %f8
	.word	0xa5b48986	! t0_kref+0x3168:   	bshuffle	%f18, %f6, %f18
	.word	0xd0182868	! t0_kref+0x316c:   	ldd	[%g0 + 0x868], %o0
	.word	0xb3a00533	! t0_kref+0x3170:   	fsqrts	%f19, %f25
	.word	0xa2140008	! t0_kref+0x3174:   	or	%l0, %o0, %l1
	.word	0xa29c800d	! t0_kref+0x3178:   	xorcc	%l2, %o5, %l1
	.word	0xb1a00554	! t0_kref+0x317c:   	fsqrtd	%f20, %f24
	.word	0xa1b00c00	! t0_kref+0x3180:   	fzero	%f16
	.word	0xa1b30f4c	! t0_kref+0x3184:   	fornot1	%f12, %f12, %f16
	.word	0x81828000	! t0_kref+0x3188:   	wr	%o2, %g0, %y
	.word	0x81828000	! t0_kref+0x318c:   	wr	%o2, %g0, %y
	.word	0xd830a01a	! t0_kref+0x3190:   	sth	%o4, [%g2 + 0x1a]
	.word	0x25800007	! t0_kref+0x3194:   	fblg,a	_kref+0x31b0
	.word	0xa2f33dda	! t0_kref+0x3198:   	udivcc	%o4, -0x226, %l1
	.word	0x93a018cc	! t0_kref+0x319c:   	fdtos	%f12, %f9
	.word	0xe24e7ff4	! t0_kref+0x31a0:   	ldsb	[%i1 - 0xc], %l1
	.word	0xea26001c	! t0_kref+0x31a4:   	st	%l5, [%i0 + %i4]
	.word	0xb3a018d0	! t0_kref+0x31a8:   	fdtos	%f16, %f25
	.word	0xa9a00156	! t0_kref+0x31ac:   	fabsd	%f22, %f20
	.word	0xe256401b	! t0_kref+0x31b0:   	ldsh	[%i1 + %i3], %l1
	.word	0xa2a40017	! t0_kref+0x31b4:   	subcc	%l0, %l7, %l1
	.word	0xa1a609cc	! t0_kref+0x31b8:   	fdivd	%f24, %f12, %f16
	.word	0xe24e200b	! t0_kref+0x31bc:   	ldsb	[%i0 + 0xb], %l1
	.word	0xb5a748a9	! t0_kref+0x31c0:   	fsubs	%f29, %f9, %f26
	.word	0xa2b4a89c	! t0_kref+0x31c4:   	orncc	%l2, 0x89c, %l1
	.word	0xa28dc01b	! t0_kref+0x31c8:   	andcc	%l7, %i3, %l1
	.word	0x21480005	! t0_kref+0x31cc:   	fbn,a,pt	%fcc0, _kref+0x31e0
	.word	0x81828000	! t0_kref+0x31d0:   	wr	%o2, %g0, %y
	.word	0xa25c4000	! t0_kref+0x31d4:   	smul	%l1, %g0, %l1
	.word	0xa5a01888	! t0_kref+0x31d8:   	fitos	%f8, %f18
	.word	0x9da01028	! t0_kref+0x31dc:   	fstox	%f8, %f14
	.word	0x2d480004	! t0_kref+0x31e0:   	fbg,a,pt	%fcc0, _kref+0x31f0
	.word	0xd2fe5000	! t0_kref+0x31e4:   	swapa	[%i1]0x80, %o1
	.word	0xa5b40c6e	! t0_kref+0x31e8:   	fnors	%f16, %f14, %f18
	.word	0xe200a038	! t0_kref+0x31ec:   	ld	[%g2 + 0x38], %l1
	.word	0x9fc00004	! t0_kref+0x31f0:   	call	%g0 + %g4
	.word	0xa286801b	! t0_kref+0x31f4:   	addcc	%i2, %i3, %l1
	.word	0xed20a020	! t0_kref+0x31f8:   	st	%f22, [%g2 + 0x20]
	.word	0xe2562000	! t0_kref+0x31fc:   	ldsh	[%i0], %l1
	.word	0xb5a0192b	! t0_kref+0x3200:   	fstod	%f11, %f26
	.word	0x8da00034	! t0_kref+0x3204:   	fmovs	%f20, %f6
	.word	0x2321d81b	! t0_kref+0x3208:   	sethi	%hi(0x87606c00), %l1
	.word	0x8da18952	! t0_kref+0x320c:   	fmuld	%f6, %f18, %f6
	.word	0xa21ee6c1	! t0_kref+0x3210:   	xor	%i3, 0x6c1, %l1
	.word	0xf7067ff0	! t0_kref+0x3214:   	ld	[%i1 - 0x10], %f27
	.word	0x9da0189b	! t0_kref+0x3218:   	fitos	%f27, %f14
	.word	0xe8f81019	! t0_kref+0x321c:   	swapa	[%g0 + %i1]0x80, %l4
	.word	0xe24e7fe7	! t0_kref+0x3220:   	ldsb	[%i1 - 0x19], %l1
	.word	0xa5a0004a	! t0_kref+0x3224:   	fmovd	%f10, %f18
	.word	0x95a018ca	! t0_kref+0x3228:   	fdtos	%f10, %f10
	.word	0x81ab0a5c	! t0_kref+0x322c:   	fcmpd	%fcc0, %f12, %f28
	.word	0xa2ac2d3d	! t0_kref+0x3230:   	andncc	%l0, 0xd3d, %l1
	.word	0x20480007	! t0_kref+0x3234:   	bn,a,pt	%icc, _kref+0x3250
	.word	0xf007bfe0	! t0_kref+0x3238:   	ld	[%fp - 0x20], %i0
	.word	0xa2c2c00d	! t0_kref+0x323c:   	addccc	%o3, %o5, %l1
	.word	0xa3352004	! t0_kref+0x3240:   	srl	%l4, 0x4, %l1
	.word	0xf620a020	! t0_kref+0x3244:   	st	%i3, [%g2 + 0x20]
	.word	0x81aa8a5c	! t0_kref+0x3248:   	fcmpd	%fcc0, %f10, %f28
	.word	0xa2868000	! t0_kref+0x324c:   	addcc	%i2, %g0, %l1
	.word	0xb1a0188e	! t0_kref+0x3250:   	fitos	%f14, %f24
	.word	0x8185c000	! t0_kref+0x3254:   	wr	%l7, %g0, %y
	.word	0xb9b40756	! t0_kref+0x3258:   	fpack32	%f16, %f22, %f28
	.word	0xb9a00028	! t0_kref+0x325c:   	fmovs	%f8, %f28
	.word	0xa2703466	! t0_kref+0x3260:   	udiv	%g0, -0xb9a, %l1
	.word	0xe320a008	! t0_kref+0x3264:   	st	%f17, [%g2 + 8]
	.word	0x81ad8a4a	! t0_kref+0x3268:   	fcmpd	%fcc0, %f22, %f10
	.word	0xe830a038	! t0_kref+0x326c:   	sth	%l4, [%g2 + 0x38]
	.word	0x97a000b6	! t0_kref+0x3270:   	fnegs	%f22, %f11
	.word	0xa29b0016	! t0_kref+0x3274:   	xorcc	%o4, %l6, %l1
	.word	0x37480001	! t0_kref+0x3278:   	fbge,a,pt	%fcc0, _kref+0x327c
	.word	0x95a409d2	! t0_kref+0x327c:   	fdivd	%f16, %f18, %f10
	.word	0x99a018c8	! t0_kref+0x3280:   	fdtos	%f8, %f12
	.word	0xda30a002	! t0_kref+0x3284:   	sth	%o5, [%g2 + 2]
	.word	0x3a800008	! t0_kref+0x3288:   	bcc,a	_kref+0x32a8
	.word	0xe210a012	! t0_kref+0x328c:   	lduh	[%g2 + 0x12], %l1
	.word	0xe41e001d	! t0_kref+0x3290:   	ldd	[%i0 + %i5], %l2
	.word	0xa21cff29	! t0_kref+0x3294:   	xor	%l3, -0xd7, %l1
	.word	0xa2c5e8fc	! t0_kref+0x3298:   	addccc	%l7, 0x8fc, %l1
	.word	0xa2f56382	! t0_kref+0x329c:   	udivcc	%l5, 0x382, %l1
	.word	0xa204c01a	! t0_kref+0x32a0:   	add	%l3, %i2, %l1
	.word	0xa2346cc4	! t0_kref+0x32a4:   	orn	%l1, 0xcc4, %l1
	.word	0xeaff1018	! t0_kref+0x32a8:   	swapa	[%i4 + %i0]0x80, %l5
	.word	0x81df001a	! t0_kref+0x32ac:   	flush	%i4 + %i2
	.word	0xa29d7551	! t0_kref+0x32b0:   	xorcc	%l5, -0xaaf, %l1
	.word	0xb9a000a7	! t0_kref+0x32b4:   	fnegs	%f7, %f28
	.word	0xe4981018	! t0_kref+0x32b8:   	ldda	[%g0 + %i0]0x80, %l2
	.word	0xe2464000	! t0_kref+0x32bc:   	ldsw	[%i1], %l1
	.word	0xb9a0015c	! t0_kref+0x32c0:   	fabsd	%f28, %f28
	.word	0xa292401b	! t0_kref+0x32c4:   	orcc	%o1, %i3, %l1
	.word	0x35800002	! t0_kref+0x32c8:   	fbue,a	_kref+0x32d0
	.word	0xa2303f3c	! t0_kref+0x32cc:   	orn	%g0, -0xc4, %l1
	.word	0xe200a038	! t0_kref+0x32d0:   	ld	[%g2 + 0x38], %l1
	.word	0xe8270018	! t0_kref+0x32d4:   	st	%l4, [%i4 + %i0]
	.word	0xda28a01b	! t0_kref+0x32d8:   	stb	%o5, [%g2 + 0x1b]
	.word	0xa3334013	! t0_kref+0x32dc:   	srl	%o5, %l3, %l1
	.word	0x8da689dc	! t0_kref+0x32e0:   	fdivd	%f26, %f28, %f6
	.word	0xfba01019	! t0_kref+0x32e4:   	sta	%f29, [%g0 + %i1]0x80
	.word	0xea30a000	! t0_kref+0x32e8:   	sth	%l5, [%g2]
	.word	0xa326ed25	! t0_kref+0x32ec:   	mulscc	%i3, 0xd25, %l1
	.word	0xf526601c	! t0_kref+0x32f0:   	st	%f26, [%i1 + 0x1c]
	.word	0x8143c000	! t0_kref+0x32f4:   	stbar
	.word	0xeb200019	! t0_kref+0x32f8:   	st	%f21, [%g0 + %i1]
	.word	0xa25ab025	! t0_kref+0x32fc:   	smul	%o2, -0xfdb, %l1
	.word	0xa5a209d0	! t0_kref+0x3300:   	fdivd	%f8, %f16, %f18
	call	SYM(t0_subr1)
	.word	0x9db60ed6	! t0_kref+0x3308:   	fornot2	%f24, %f22, %f14
	.word	0xd22e401a	! t0_kref+0x330c:   	stb	%o1, [%i1 + %i2]
	.word	0xa3a0012b	! t0_kref+0x3310:   	fabss	%f11, %f17
	.word	0xba103fe0	! t0_kref+0x3314:   	mov	0xffffffe0, %i5
	.word	0xc1ee5015	! t0_kref+0x3318:   	prefetcha	%i1 + %l5, 0
	.word	0x86102002	! t0_kref+0x331c:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x3320:   	bne,a	_kref+0x3320
	.word	0x86a0e001	! t0_kref+0x3324:   	subcc	%g3, 1, %g3
	.word	0x81840000	! t0_kref+0x3328:   	wr	%l0, %g0, %y
	.word	0x91a50d2f	! t0_kref+0x332c:   	fsmuld	%f20, %f15, %f8
	.word	0x3c480008	! t0_kref+0x3330:   	bpos,a,pt	%icc, _kref+0x3350
	.word	0xa5a00038	! t0_kref+0x3334:   	fmovs	%f24, %f18
	.word	0xd6763fe8	! t0_kref+0x3338:   	stx	%o3, [%i0 - 0x18]
	.word	0x3b480007	! t0_kref+0x333c:   	fble,a,pt	%fcc0, _kref+0x3358
	.word	0x8143c000	! t0_kref+0x3340:   	stbar
	.word	0x26480003	! t0_kref+0x3344:   	bl,a,pt	%icc, _kref+0x3350
	.word	0xa2c4800d	! t0_kref+0x3348:   	addccc	%l2, %o5, %l1
	.word	0xa2c5c009	! t0_kref+0x334c:   	addccc	%l7, %o1, %l1
	.word	0x95a2885c	! t0_kref+0x3350:   	faddd	%f10, %f28, %f10
	.word	0xa21c4017	! t0_kref+0x3354:   	xor	%l1, %l7, %l1
	.word	0xa23c000c	! t0_kref+0x3358:   	xnor	%l0, %o4, %l1
	.word	0xa2937e62	! t0_kref+0x335c:   	orcc	%o5, -0x19e, %l1
	.word	0xa2f6c00b	! t0_kref+0x3360:   	udivcc	%i3, %o3, %l1
	.word	0xa332a016	! t0_kref+0x3364:   	srl	%o2, 0x16, %l1
	.word	0xa2f54008	! t0_kref+0x3368:   	udivcc	%l5, %o0, %l1
	.word	0x9ba01a37	! t0_kref+0x336c:   	fstoi	%f23, %f13
	.word	0xe220a028	! t0_kref+0x3370:   	st	%l1, [%g2 + 0x28]
	.word	0xc12e401c	! t0_kref+0x3374:   	st	%fsr, [%i1 + %i4]
	.word	0xa370253d	! t0_kref+0x3378:   	popc	0x53d, %l1
	.word	0xa2303e43	! t0_kref+0x337c:   	orn	%g0, -0x1bd, %l1
	.word	0xd228a020	! t0_kref+0x3380:   	stb	%o1, [%g2 + 0x20]
	.word	0xb9a70956	! t0_kref+0x3384:   	fmuld	%f28, %f22, %f28
	.word	0xf91fbe50	! t0_kref+0x3388:   	ldd	[%fp - 0x1b0], %f28
	.word	0xa245bd90	! t0_kref+0x338c:   	addc	%l6, -0x270, %l1
	.word	0xe7066004	! t0_kref+0x3390:   	ld	[%i1 + 4], %f19
	.word	0x37480002	! t0_kref+0x3394:   	fbge,a,pt	%fcc0, _kref+0x339c
	.word	0x99a0188c	! t0_kref+0x3398:   	fitos	%f12, %f12
	.word	0xe240a020	! t0_kref+0x339c:   	ldsw	[%g2 + 0x20], %l1
	.word	0xa2434008	! t0_kref+0x33a0:   	addc	%o5, %o0, %l1
	.word	0x9db30748	! t0_kref+0x33a4:   	fpack32	%f12, %f8, %f14
	.word	0xb9a01927	! t0_kref+0x33a8:   	fstod	%f7, %f28
	.word	0x9fc10000	! t0_kref+0x33ac:   	call	%g4
	.word	0xa212400d	! t0_kref+0x33b0:   	or	%o1, %o5, %l1
	.word	0x81ae0a4e	! t0_kref+0x33b4:   	fcmpd	%fcc0, %f24, %f14
	.word	0xe41e7fe8	! t0_kref+0x33b8:   	ldd	[%i1 - 0x18], %l2
	.word	0x9de3bfa0	! t0_kref+0x33bc:   	save	%sp, -0x60, %sp
	.word	0xb4b7001c	! t0_kref+0x33c0:   	orncc	%i4, %i4, %i2
	.word	0xa3eec01a	! t0_kref+0x33c4:   	restore	%i3, %i2, %l1
	.word	0xf62e4000	! t0_kref+0x33c8:   	stb	%i3, [%i1]
	.word	0xa296c000	! t0_kref+0x33cc:   	orcc	%i3, %g0, %l1
	.word	0x99a28d3c	! t0_kref+0x33d0:   	fsmuld	%f10, %f28, %f12
	.word	0x3a800004	! t0_kref+0x33d4:   	bcc,a	_kref+0x33e4
	.word	0xeda65000	! t0_kref+0x33d8:   	sta	%f22, [%i1]0x80
	.word	0xc16e4011	! t0_kref+0x33dc:   	prefetch	%i1 + %l1, 0
	.word	0x81aa0a4c	! t0_kref+0x33e0:   	fcmpd	%fcc0, %f8, %f12
	.word	0x8143c000	! t0_kref+0x33e4:   	stbar
	.word	0xf5ee101a	! t0_kref+0x33e8:   	prefetcha	%i0 + %i2, 26
	.word	0xa2022df1	! t0_kref+0x33ec:   	add	%o0, 0xdf1, %l1
	.word	0xa3b54108	! t0_kref+0x33f0:   	edge32	%l5, %o0, %l1
	.word	0x38800003	! t0_kref+0x33f4:   	bgu,a	_kref+0x3400
	.word	0xe49f5019	! t0_kref+0x33f8:   	ldda	[%i5 + %i1]0x80, %l2
	.word	0xb7a018dc	! t0_kref+0x33fc:   	fdtos	%f28, %f27
	.word	0x230858cf	! t0_kref+0x3400:   	sethi	%hi(0x21633c00), %l1
	.word	0xa1a00550	! t0_kref+0x3404:   	fsqrtd	%f16, %f16
	.word	0x9fb64ca7	! t0_kref+0x3408:   	fandnot2s	%f25, %f7, %f15
	.word	0x81ae8a2b	! t0_kref+0x340c:   	fcmps	%fcc0, %f26, %f11
	.word	0xa22c7cbf	! t0_kref+0x3410:   	andn	%l1, -0x341, %l1
	.word	0xa3b0013b	! t0_kref+0x3414:   	edge32n	%g0, %i3, %l1
	.word	0xda30a008	! t0_kref+0x3418:   	sth	%o5, [%g2 + 8]
	.word	0x9da018ce	! t0_kref+0x341c:   	fdtos	%f14, %f14
	.word	0xa273621f	! t0_kref+0x3420:   	udiv	%o5, 0x21f, %l1
	.word	0x36800006	! t0_kref+0x3424:   	bge,a	_kref+0x343c
	.word	0xd1200018	! t0_kref+0x3428:   	st	%f8, [%g0 + %i0]
	.word	0xa1b54ea0	! t0_kref+0x342c:   	fsrc1s	%f21, %f16
	.word	0x81d964ee	! t0_kref+0x3430:   	flush	%g5 + 0x4ee
	.word	0x93a018ce	! t0_kref+0x3434:   	fdtos	%f14, %f9
	.word	0xb9b5874e	! t0_kref+0x3438:   	fpack32	%f22, %f14, %f28
	.word	0xe028a038	! t0_kref+0x343c:   	stb	%l0, [%g2 + 0x38]
	call	SYM(t0_subr0)
	.word	0xa33c200f	! t0_kref+0x3444:   	sra	%l0, 0xf, %l1
	.word	0xe81e2010	! t0_kref+0x3448:   	ldd	[%i0 + 0x10], %l4
	.word	0xf1be501d	! t0_kref+0x344c:   	stda	%f24, [%i1 + %i5]0x80
	.word	0x23168815	! t0_kref+0x3450:   	sethi	%hi(0x5a205400), %l1
	.word	0xe11fbdf8	! t0_kref+0x3454:   	ldd	[%fp - 0x208], %f16
	.word	0xa33c4016	! t0_kref+0x3458:   	sra	%l1, %l6, %l1
	.word	0xf5b81019	! t0_kref+0x345c:   	stda	%f26, [%g0 + %i1]0x80
	.word	0x34800006	! t0_kref+0x3460:   	bg,a	_kref+0x3478
	.word	0xe8363fea	! t0_kref+0x3464:   	sth	%l4, [%i0 - 0x16]
	.word	0xa29d4014	! t0_kref+0x3468:   	xorcc	%l5, %l4, %l1
	.word	0xa25ae540	! t0_kref+0x346c:   	smul	%o3, 0x540, %l1
	.word	0xa20d3cad	! t0_kref+0x3470:   	and	%l4, -0x353, %l1
	.word	0x8fa01892	! t0_kref+0x3474:   	fitos	%f18, %f7
	.word	0xa23434ba	! t0_kref+0x3478:   	orn	%l0, -0xb46, %l1
	.word	0x9fc00004	! t0_kref+0x347c:   	call	%g0 + %g4
	.word	0xa9a018d4	! t0_kref+0x3480:   	fdtos	%f20, %f20
	.word	0xe820a030	! t0_kref+0x3484:   	st	%l4, [%g2 + 0x30]
	.word	0xd628a001	! t0_kref+0x3488:   	stb	%o3, [%g2 + 1]
	.word	0xd4680019	! t0_kref+0x348c:   	ldstub	[%g0 + %i1], %o2
	.word	0xa1a389d4	! t0_kref+0x3490:   	fdivd	%f14, %f20, %f16
	.word	0x99a00056	! t0_kref+0x3494:   	fmovd	%f22, %f12
	.word	0xe0fe501c	! t0_kref+0x3498:   	swapa	[%i1 + %i4]0x80, %l0
	.word	0xe240a010	! t0_kref+0x349c:   	ldsw	[%g2 + 0x10], %l1
	.word	0xa33b000a	! t0_kref+0x34a0:   	sra	%o4, %o2, %l1
	.word	0xe020a010	! t0_kref+0x34a4:   	st	%l0, [%g2 + 0x10]
	.word	0xa22ab467	! t0_kref+0x34a8:   	andn	%o2, -0xb99, %l1
	.word	0xa22ac011	! t0_kref+0x34ac:   	andn	%o3, %l1, %l1
	.word	0xd91fbd28	! t0_kref+0x34b0:   	ldd	[%fp - 0x2d8], %f12
	.word	0xe720a020	! t0_kref+0x34b4:   	st	%f19, [%g2 + 0x20]
	.word	0x9fc00004	! t0_kref+0x34b8:   	call	%g0 + %g4
	.word	0xa335a010	! t0_kref+0x34bc:   	srl	%l6, 0x10, %l1
	.word	0xf4ae9019	! t0_kref+0x34c0:   	stba	%i2, [%i2 + %i1]0x80
	.word	0xa5b18f8a	! t0_kref+0x34c4:   	for	%f6, %f10, %f18
	.word	0xa205400a	! t0_kref+0x34c8:   	add	%l5, %o2, %l1
	.word	0x91a70956	! t0_kref+0x34cc:   	fmuld	%f28, %f22, %f8
	.word	0xa202000b	! t0_kref+0x34d0:   	add	%o0, %o3, %l1
	.word	0x36800007	! t0_kref+0x34d4:   	bge,a	_kref+0x34f0
	.word	0xea20a038	! t0_kref+0x34d8:   	st	%l5, [%g2 + 0x38]
	.word	0xe250a020	! t0_kref+0x34dc:   	ldsh	[%g2 + 0x20], %l1
	.word	0xe1e65000	! t0_kref+0x34e0:   	casa	[%i1]0x80, %g0, %l0
	.word	0xa21cea09	! t0_kref+0x34e4:   	xor	%l3, 0xa09, %l1
	.word	0xa274001a	! t0_kref+0x34e8:   	udiv	%l0, %i2, %l1
	.word	0xe06e600a	! t0_kref+0x34ec:   	ldstub	[%i1 + 0xa], %l0
	.word	0xa2f6c014	! t0_kref+0x34f0:   	udivcc	%i3, %l4, %l1
	.word	0xa2136e3d	! t0_kref+0x34f4:   	or	%o5, 0xe3d, %l1
	.word	0xa295b16e	! t0_kref+0x34f8:   	orcc	%l6, -0xe92, %l1
	.word	0xd1be1895	! t0_kref+0x34fc:   	stda	%f8, [%i0 + %l5]0xc4
	.word	0xa1a01938	! t0_kref+0x3500:   	fstod	%f24, %f16
	.word	0xbba018ca	! t0_kref+0x3504:   	fdtos	%f10, %f29
	.word	0xa29d363e	! t0_kref+0x3508:   	xorcc	%l4, -0x9c2, %l1
	.word	0xa28c401b	! t0_kref+0x350c:   	andcc	%l1, %i3, %l1
	.word	0xe208a01a	! t0_kref+0x3510:   	ldub	[%g2 + 0x1a], %l1
	.word	0xcf064000	! t0_kref+0x3514:   	ld	[%i1], %f7
	.word	0xd726200c	! t0_kref+0x3518:   	st	%f11, [%i0 + 0xc]
	.word	0xa28b238f	! t0_kref+0x351c:   	andcc	%o4, 0x38f, %l1
	.word	0xa28cc008	! t0_kref+0x3520:   	andcc	%l3, %o0, %l1
	.word	0xa21aa962	! t0_kref+0x3524:   	xor	%o2, 0x962, %l1
	.word	0x95a709ac	! t0_kref+0x3528:   	fdivs	%f28, %f12, %f10
	.word	0xa212366a	! t0_kref+0x352c:   	or	%o0, -0x996, %l1
	.word	0xa2e44015	! t0_kref+0x3530:   	subccc	%l1, %l5, %l1
	.word	0xe24e001a	! t0_kref+0x3534:   	ldsb	[%i0 + %i2], %l1
	.word	0xa2328013	! t0_kref+0x3538:   	orn	%o2, %l3, %l1
	.word	0xa25a800d	! t0_kref+0x353c:   	smul	%o2, %o5, %l1
	.word	0xadb00fc0	! t0_kref+0x3540:   	fone	%f22
	.word	0x81aacab2	! t0_kref+0x3544:   	fcmpes	%fcc0, %f11, %f18
	.word	0xf1267fe0	! t0_kref+0x3548:   	st	%f24, [%i1 - 0x20]
	.word	0xe296d018	! t0_kref+0x354c:   	lduha	[%i3 + %i0]0x80, %l1
	.word	0x2c480005	! t0_kref+0x3550:   	bneg,a,pt	%icc, _kref+0x3564
	.word	0xadb00cce	! t0_kref+0x3554:   	fnot2	%f14, %f22
	.word	0xa3b20280	! t0_kref+0x3558:   	array32	%o0, %g0, %l1
	.word	0x36800005	! t0_kref+0x355c:   	bge,a	_kref+0x3570
	.word	0xe3263ff8	! t0_kref+0x3560:   	st	%f17, [%i0 - 8]
	.word	0x8143c000	! t0_kref+0x3564:   	stbar
	.word	0xf100a030	! t0_kref+0x3568:   	ld	[%g2 + 0x30], %f24
	.word	0xe240a038	! t0_kref+0x356c:   	ldsw	[%g2 + 0x38], %l1
	.word	0x8db18e50	! t0_kref+0x3570:   	fxnor	%f6, %f16, %f6
	.word	0x81adca31	! t0_kref+0x3574:   	fcmps	%fcc0, %f23, %f17
	.word	0xe2c61000	! t0_kref+0x3578:   	ldswa	[%i0]0x80, %l1
	.word	0xa2dc0008	! t0_kref+0x357c:   	smulcc	%l0, %o0, %l1
	sethi	%hi(2f), %o7
	.word	0xe40be1a4	! t0_kref+0x3584:   	ldub	[%o7 + 0x1a4], %l2
	.word	0xa41ca00c	! t0_kref+0x3588:   	xor	%l2, 0xc, %l2
	.word	0xe42be1a4	! t0_kref+0x358c:   	stb	%l2, [%o7 + 0x1a4]
	.word	0x81dbe1a4	! t0_kref+0x3590:   	flush	%o7 + 0x1a4
	.word	0xf1be184d	! t0_kref+0x3594:   	stda	%f24, [%i0 + %o5]0xc2
	.word	0xa3b2c075	! t0_kref+0x3598:   	edge8ln	%o3, %l5, %l1
	.word	0x23389d11	! t0_kref+0x359c:   	sethi	%hi(0xe2744400), %l1
	call	SYM(t0_subr0)
2:	.word	0xb9b5cea0	! t0_kref+0x35a4:   	fsrc1s	%f23, %f28
	.word	0xa27a2863	! t0_kref+0x35a8:   	sdiv	%o0, 0x863, %l1
	.word	0x91a60958	! t0_kref+0x35ac:   	fmuld	%f24, %f24, %f8
	.word	0xb9a00548	! t0_kref+0x35b0:   	fsqrtd	%f8, %f28
	.word	0xe2100019	! t0_kref+0x35b4:   	lduh	[%g0 + %i1], %l1
	.word	0xb1a0055a	! t0_kref+0x35b8:   	fsqrtd	%f26, %f24
	.word	0xc028a03b	! t0_kref+0x35bc:   	clrb	[%g2 + 0x3b]
	call	SYM(t0_subr0)
	.word	0x9db30f48	! t0_kref+0x35c4:   	fornot1	%f12, %f8, %f14
	.word	0xf700a020	! t0_kref+0x35c8:   	ld	[%g2 + 0x20], %f27
	call	SYM(t0_subr0)
	.word	0xf428a039	! t0_kref+0x35d0:   	stb	%i2, [%g2 + 0x39]
	.word	0xa24279b7	! t0_kref+0x35d4:   	addc	%o1, -0x649, %l1
	.word	0x36800003	! t0_kref+0x35d8:   	bge,a	_kref+0x35e4
	.word	0x8143c000	! t0_kref+0x35dc:   	stbar
	.word	0xa25eabcb	! t0_kref+0x35e0:   	smul	%i2, 0xbcb, %l1
	.word	0xa25ec017	! t0_kref+0x35e4:   	smul	%i3, %l7, %l1
	.word	0xa20a4008	! t0_kref+0x35e8:   	and	%o1, %o0, %l1
	.word	0x39480008	! t0_kref+0x35ec:   	fbuge,a,pt	%fcc0, _kref+0x360c
	.word	0xa2324012	! t0_kref+0x35f0:   	orn	%o1, %l2, %l1
	.word	0xa9a00146	! t0_kref+0x35f4:   	fabsd	%f6, %f20
	.word	0xe286501c	! t0_kref+0x35f8:   	lda	[%i1 + %i4]0x80, %l1
	.word	0x28480002	! t0_kref+0x35fc:   	bleu,a,pt	%icc, _kref+0x3604
	.word	0x8143c000	! t0_kref+0x3600:   	stbar
	.word	0x8143c000	! t0_kref+0x3604:   	stbar
	.word	0x99a0192d	! t0_kref+0x3608:   	fstod	%f13, %f12
	.word	0x9f414000	! t0_kref+0x360c:   	mov	%pc, %o7
!	.word	0x3abd2a7a	! t0_kref+0x3610:   	bcc,a	SYM(t0_subr1)
	   	bcc,a	SYM(t0_subr1)
	.word	0xa2e50010	! t0_kref+0x3614:   	subccc	%l4, %l0, %l1
	.word	0x38800006	! t0_kref+0x3618:   	bgu,a	_kref+0x3630
	.word	0x81ddc01b	! t0_kref+0x361c:   	flush	%l7 + %i3
	.word	0xe208a031	! t0_kref+0x3620:   	ldub	[%g2 + 0x31], %l1
	.word	0xf6362002	! t0_kref+0x3624:   	sth	%i3, [%i0 + 2]
	.word	0x9fc10000	! t0_kref+0x3628:   	call	%g4
	.word	0xa2e24015	! t0_kref+0x362c:   	subccc	%o1, %l5, %l1
	call	SYM(t0_subr3)
	.word	0xa3400000	! t0_kref+0x3634:   	mov	%y, %l1
	.word	0xa3b50056	! t0_kref+0x3638:   	edge8l	%l4, %l6, %l1
	.word	0xa2022bd0	! t0_kref+0x363c:   	add	%o0, 0xbd0, %l1
	.word	0xe41f4018	! t0_kref+0x3640:   	ldd	[%i5 + %i0], %l2
	.word	0xada5c93d	! t0_kref+0x3644:   	fmuls	%f23, %f29, %f22
	.word	0xa204400a	! t0_kref+0x3648:   	add	%l1, %o2, %l1
	.word	0xa258000a	! t0_kref+0x364c:   	smul	%g0, %o2, %l1
	.word	0xa332801b	! t0_kref+0x3650:   	srl	%o2, %i3, %l1
	.word	0xa29a4016	! t0_kref+0x3654:   	xorcc	%o1, %l6, %l1
	.word	0xe24e7feb	! t0_kref+0x3658:   	ldsb	[%i1 - 0x15], %l1
	.word	0x91b24967	! t0_kref+0x365c:   	fpmerge	%f9, %f7, %f8
	.word	0x9fc00004	! t0_kref+0x3660:   	call	%g0 + %g4
	.word	0xe49e101d	! t0_kref+0x3664:   	ldda	[%i0 + %i5]0x80, %l2
	.word	0xef00a038	! t0_kref+0x3668:   	ld	[%g2 + 0x38], %f23
	.word	0xa2a50000	! t0_kref+0x366c:   	subcc	%l4, %g0, %l1
	.word	0x97a01090	! t0_kref+0x3670:   	fxtos	%f16, %f11
	.word	0xe216001b	! t0_kref+0x3674:   	lduh	[%i0 + %i3], %l1
	.word	0xa9a00546	! t0_kref+0x3678:   	fsqrtd	%f6, %f20
	.word	0xa5a68d29	! t0_kref+0x367c:   	fsmuld	%f26, %f9, %f18
	.word	0x95a488d2	! t0_kref+0x3680:   	fsubd	%f18, %f18, %f10
	.word	0xa3b18a34	! t0_kref+0x3684:   	fpadd16s	%f6, %f20, %f17
	.word	0xe81e7fe8	! t0_kref+0x3688:   	ldd	[%i1 - 0x18], %l4
	.word	0x99a01918	! t0_kref+0x368c:   	fitod	%f24, %f12
	.word	0x9fc00004	! t0_kref+0x3690:   	call	%g0 + %g4
	.word	0xdd063ff8	! t0_kref+0x3694:   	ld	[%i0 - 8], %f14
	.word	0x95a01028	! t0_kref+0x3698:   	fstox	%f8, %f10
	.word	0xa2a6eefd	! t0_kref+0x369c:   	subcc	%i3, 0xefd, %l1
	.word	0xdd9e501d	! t0_kref+0x36a0:   	ldda	[%i1 + %i5]0x80, %f14
	call	SYM(t0_subr2)
	.word	0xa9a689d2	! t0_kref+0x36a8:   	fdivd	%f26, %f18, %f20
	.word	0xf5be501d	! t0_kref+0x36ac:   	stda	%f26, [%i1 + %i5]0x80
	.word	0xe830a02a	! t0_kref+0x36b0:   	sth	%l4, [%g2 + 0x2a]
	.word	0x9da01039	! t0_kref+0x36b4:   	fstox	%f25, %f14
	.word	0xe248a011	! t0_kref+0x36b8:   	ldsb	[%g2 + 0x11], %l1
	.word	0x81dc6437	! t0_kref+0x36bc:   	flush	%l1 + 0x437
	.word	0xa2026dc5	! t0_kref+0x36c0:   	add	%o1, 0xdc5, %l1
	.word	0xd22e600e	! t0_kref+0x36c4:   	stb	%o1, [%i1 + 0xe]
	.word	0x93a018d8	! t0_kref+0x36c8:   	fdtos	%f24, %f9
	.word	0xa21eb5ed	! t0_kref+0x36cc:   	xor	%i2, -0xa13, %l1
	.word	0xa3b68016	! t0_kref+0x36d0:   	edge8	%i2, %l6, %l1
	.word	0xa21a800b	! t0_kref+0x36d4:   	xor	%o2, %o3, %l1
	.word	0xec300019	! t0_kref+0x36d8:   	sth	%l6, [%g0 + %i1]
	.word	0x91b44715	! t0_kref+0x36dc:   	fmuld8sux16	%f17, %f21, %f8
	.word	0xdd1fbd30	! t0_kref+0x36e0:   	ldd	[%fp - 0x2d0], %f14
	.word	0xe2480019	! t0_kref+0x36e4:   	ldsb	[%g0 + %i1], %l1
	.word	0xb3b00c20	! t0_kref+0x36e8:   	fzeros	%f25
	.word	0xa370000b	! t0_kref+0x36ec:   	popc	%o3, %l1
	.word	0x32800001	! t0_kref+0x36f0:   	bne,a	_kref+0x36f4
	.word	0xa2deff1b	! t0_kref+0x36f4:   	smulcc	%i3, -0xe5, %l1
	.word	0x81844000	! t0_kref+0x36f8:   	wr	%l1, %g0, %y
	.word	0xbbaa0031	! t0_kref+0x36fc:   	fmovsa	%fcc0, %f17, %f29
	.word	0xd86e7ffa	! t0_kref+0x3700:   	ldstub	[%i1 - 6], %o4
	.word	0x81ab4ab3	! t0_kref+0x3704:   	fcmpes	%fcc0, %f13, %f19
	.word	0xa28e8016	! t0_kref+0x3708:   	andcc	%i2, %l6, %l1
	.word	0xc1ee1013	! t0_kref+0x370c:   	prefetcha	%i0 + %l3, 0
	.word	0xb9a208aa	! t0_kref+0x3710:   	fsubs	%f8, %f10, %f28
	.word	0x8da60936	! t0_kref+0x3714:   	fmuls	%f24, %f22, %f6
	.word	0xa32ea00a	! t0_kref+0x3718:   	sll	%i2, 0xa, %l1
	.word	0x26480007	! t0_kref+0x371c:   	bl,a,pt	%icc, _kref+0x3738
	.word	0xafb40ea0	! t0_kref+0x3720:   	fsrc1s	%f16, %f23
	.word	0x81b01020	! t0_kref+0x3724:   	siam	0x0
	.word	0xa33b2018	! t0_kref+0x3728:   	sra	%o4, 0x18, %l1
	.word	0xd028a00a	! t0_kref+0x372c:   	stb	%o0, [%g2 + 0xa]
	.word	0x9fc00004	! t0_kref+0x3730:   	call	%g0 + %g4
	.word	0xada0188a	! t0_kref+0x3734:   	fitos	%f10, %f22
	.word	0xd230a018	! t0_kref+0x3738:   	sth	%o1, [%g2 + 0x18]
	.word	0x22800003	! t0_kref+0x373c:   	be,a	_kref+0x3748
	.word	0xf700a008	! t0_kref+0x3740:   	ld	[%g2 + 8], %f27
	.word	0xe240a038	! t0_kref+0x3744:   	ldsw	[%g2 + 0x38], %l1
	.word	0x37480001	! t0_kref+0x3748:   	fbge,a,pt	%fcc0, _kref+0x374c
	.word	0xa2828013	! t0_kref+0x374c:   	addcc	%o2, %l3, %l1
	.word	0xa25d4015	! t0_kref+0x3750:   	smul	%l5, %l5, %l1
	.word	0x3e480003	! t0_kref+0x3754:   	bvc,a,pt	%icc, _kref+0x3760
	.word	0xa2330008	! t0_kref+0x3758:   	orn	%o4, %o0, %l1
	.word	0xa21c4000	! t0_kref+0x375c:   	xor	%l1, %g0, %l1
	.word	0x99aa8029	! t0_kref+0x3760:   	fmovsue	%fcc0, %f9, %f12
	.word	0x9bb007a8	! t0_kref+0x3764:   	fpackfix	%f8, %f13
	.word	0xa9b58aa7	! t0_kref+0x3768:   	fpsub16s	%f22, %f7, %f20
	.word	0xada3c93c	! t0_kref+0x376c:   	fmuls	%f15, %f28, %f22
	.word	0xe208a009	! t0_kref+0x3770:   	ldub	[%g2 + 9], %l1
	.word	0x8143c000	! t0_kref+0x3774:   	stbar
	.word	0xa5a000b9	! t0_kref+0x3778:   	fnegs	%f25, %f18
	.word	0xa2f23056	! t0_kref+0x377c:   	udivcc	%o0, -0xfaa, %l1
	.word	0xb9a688b9	! t0_kref+0x3780:   	fsubs	%f26, %f25, %f28
	.word	0xa33c6005	! t0_kref+0x3784:   	sra	%l1, 0x5, %l1
	.word	0xe1be5000	! t0_kref+0x3788:   	stda	%f16, [%i1]0x80
	.word	0xa206f3fd	! t0_kref+0x378c:   	add	%i3, -0xc03, %l1
	.word	0xe20e3fe0	! t0_kref+0x3790:   	ldub	[%i0 - 0x20], %l1
	.word	0x2a800008	! t0_kref+0x3794:   	bcs,a	_kref+0x37b4
	.word	0xd5380019	! t0_kref+0x3798:   	std	%f10, [%g0 + %i1]
	.word	0x2e480006	! t0_kref+0x379c:   	bvs,a,pt	%icc, _kref+0x37b4
	.word	0x8143c000	! t0_kref+0x37a0:   	stbar
	.word	0xe286101c	! t0_kref+0x37a4:   	lda	[%i0 + %i4]0x80, %l1
	.word	0xb1a01910	! t0_kref+0x37a8:   	fitod	%f16, %f24
	.word	0x81de6551	! t0_kref+0x37ac:   	flush	%i1 + 0x551
	.word	0xa21daba1	! t0_kref+0x37b0:   	xor	%l6, 0xba1, %l1
	.word	0xa3418000	! t0_kref+0x37b4:   	mov	%fprs, %l1
	.word	0xea300018	! t0_kref+0x37b8:   	sth	%l5, [%g0 + %i0]
	.word	0x81ac0a39	! t0_kref+0x37bc:   	fcmps	%fcc0, %f16, %f25
	.word	0x28800007	! t0_kref+0x37c0:   	bleu,a	_kref+0x37dc
	.word	0xa9b48750	! t0_kref+0x37c4:   	fpack32	%f18, %f16, %f20
	.word	0xc030a008	! t0_kref+0x37c8:   	clrh	[%g2 + 8]
	.word	0xe51fbf20	! t0_kref+0x37cc:   	ldd	[%fp - 0xe0], %f18
	.word	0xdb06401c	! t0_kref+0x37d0:   	ld	[%i1 + %i4], %f13
	.word	0xa23e8012	! t0_kref+0x37d4:   	xnor	%i2, %l2, %l1
	.word	0x28480004	! t0_kref+0x37d8:   	bleu,a,pt	%icc, _kref+0x37e8
	.word	0xa7a708bc	! t0_kref+0x37dc:   	fsubs	%f28, %f28, %f19
	.word	0xaba00134	! t0_kref+0x37e0:   	fabss	%f20, %f21
	.word	0xe3000018	! t0_kref+0x37e4:   	ld	[%g0 + %i0], %f17
	.word	0x3b480008	! t0_kref+0x37e8:   	fble,a,pt	%fcc0, _kref+0x3808
	.word	0xa1b6870c	! t0_kref+0x37ec:   	fmuld8sux16	%f26, %f12, %f16
	.word	0xe53e3ff8	! t0_kref+0x37f0:   	std	%f18, [%i0 - 8]
	.word	0xf51fbcc0	! t0_kref+0x37f4:   	ldd	[%fp - 0x340], %f26
	.word	0x81aa0a5c	! t0_kref+0x37f8:   	fcmpd	%fcc0, %f8, %f28
	.word	0xb3a0003a	! t0_kref+0x37fc:   	fmovs	%f26, %f25
	.word	0xe24e2005	! t0_kref+0x3800:   	ldsb	[%i0 + 5], %l1
	.word	0xdd1fbdc0	! t0_kref+0x3804:   	ldd	[%fp - 0x240], %f14
	.word	0x21480007	! t0_kref+0x3808:   	fbn,a,pt	%fcc0, _kref+0x3824
	.word	0xe200a020	! t0_kref+0x380c:   	ld	[%g2 + 0x20], %l1
	.word	0x9fa70933	! t0_kref+0x3810:   	fmuls	%f28, %f19, %f15
	.word	0x81aa0a54	! t0_kref+0x3814:   	fcmpd	%fcc0, %f8, %f20
	.word	0xb5a2c9b8	! t0_kref+0x3818:   	fdivs	%f11, %f24, %f26
	.word	0xe2c01018	! t0_kref+0x381c:   	ldswa	[%g0 + %i0]0x80, %l1
	.word	0xa7b1cdfb	! t0_kref+0x3820:   	fnands	%f7, %f27, %f19
	.word	0x93b34f6d	! t0_kref+0x3824:   	fornot1s	%f13, %f13, %f9
	.word	0x99a0193b	! t0_kref+0x3828:   	fstod	%f27, %f12
	.word	0xf320a008	! t0_kref+0x382c:   	st	%f25, [%g2 + 8]
	.word	0x91a60954	! t0_kref+0x3830:   	fmuld	%f24, %f20, %f8
	.word	0xa22ec011	! t0_kref+0x3834:   	andn	%i3, %l1, %l1
	.word	0xa22a4011	! t0_kref+0x3838:   	andn	%o1, %l1, %l1
	.word	0xf207bfe0	! t0_kref+0x383c:   	ld	[%fp - 0x20], %i1
	.word	0xa9a018d0	! t0_kref+0x3840:   	fdtos	%f16, %f20
	.word	0x23259a1d	! t0_kref+0x3844:   	sethi	%hi(0x96687400), %l1
	.word	0xa2d5001a	! t0_kref+0x3848:   	umulcc	%l4, %i2, %l1
	.word	0xa2300000	! t0_kref+0x384c:   	orn	%g0, %g0, %l1
	.word	0xf5000018	! t0_kref+0x3850:   	ld	[%g0 + %i0], %f26
	.word	0xa2133bfe	! t0_kref+0x3854:   	or	%o4, -0x402, %l1
	.word	0xdf20a018	! t0_kref+0x3858:   	st	%f15, [%g2 + 0x18]
	.word	0x8143c000	! t0_kref+0x385c:   	stbar
	.word	0xf1062018	! t0_kref+0x3860:   	ld	[%i0 + 0x18], %f24
	.word	0xa3b20410	! t0_kref+0x3864:   	fcmple16	%f8, %f16, %l1
	.word	0xd2764000	! t0_kref+0x3868:   	stx	%o1, [%i1]
	.word	0xa21d800b	! t0_kref+0x386c:   	xor	%l6, %o3, %l1
	.word	0xa230000c	! t0_kref+0x3870:   	orn	%g0, %o4, %l1
	.word	0x9fc10000	! t0_kref+0x3874:   	call	%g4
	.word	0xa2de801b	! t0_kref+0x3878:   	smulcc	%i2, %i3, %l1
	.word	0x81858000	! t0_kref+0x387c:   	wr	%l6, %g0, %y
	.word	0xdb06600c	! t0_kref+0x3880:   	ld	[%i1 + 0xc], %f13
	.word	0x91a308dc	! t0_kref+0x3884:   	fsubd	%f12, %f28, %f8
	.word	0xe820a000	! t0_kref+0x3888:   	st	%l4, [%g2]
	.word	0x3d800003	! t0_kref+0x388c:   	fbule,a	_kref+0x3898
	.word	0x93a0002b	! t0_kref+0x3890:   	fmovs	%f11, %f9
	.word	0x2c800002	! t0_kref+0x3894:   	bneg,a	_kref+0x389c
	.word	0xb9a9c02d	! t0_kref+0x3898:   	fmovsu	%fcc0, %f13, %f28
	.word	0xa30d75f7	! t0_kref+0x389c:   	tsubcc	%l5, -0xa09, %l1
	.word	0x8143e014	! t0_kref+0x38a0:   	membar	0x14
	.word	0xda68a011	! t0_kref+0x38a4:   	ldstub	[%g2 + 0x11], %o5
	.word	0xa3a2893b	! t0_kref+0x38a8:   	fmuls	%f10, %f27, %f17
	.word	0xf9200018	! t0_kref+0x38ac:   	st	%f28, [%g0 + %i0]
	.word	0xe41e2008	! t0_kref+0x38b0:   	ldd	[%i0 + 8], %l2
	.word	0xe4be1000	! t0_kref+0x38b4:   	stda	%l2, [%i0]0x80
	.word	0xa274a74e	! t0_kref+0x38b8:   	udiv	%l2, 0x74e, %l1
	.word	0xa9b00fc0	! t0_kref+0x38bc:   	fone	%f20
	.word	0xa25a000d	! t0_kref+0x38c0:   	smul	%o0, %o5, %l1
	.word	0xe250a038	! t0_kref+0x38c4:   	ldsh	[%g2 + 0x38], %l1
	.word	0xa32a4015	! t0_kref+0x38c8:   	sll	%o1, %l5, %l1
	.word	0x8143c000	! t0_kref+0x38cc:   	stbar
	.word	0xa3400000	! t0_kref+0x38d0:   	mov	%y, %l1
	.word	0xa3400000	! t0_kref+0x38d4:   	mov	%y, %l1
	.word	0xa2ba725a	! t0_kref+0x38d8:   	xnorcc	%o1, -0xda6, %l1
	.word	0xa236c01b	! t0_kref+0x38dc:   	orn	%i3, %i3, %l1
	.word	0x3d480001	! t0_kref+0x38e0:   	fbule,a,pt	%fcc0, _kref+0x38e4
	.word	0x2327933f	! t0_kref+0x38e4:   	sethi	%hi(0x9e4cfc00), %l1
	.word	0x8db00f16	! t0_kref+0x38e8:   	fsrc2	%f22, %f6
	.word	0xa2d80016	! t0_kref+0x38ec:   	smulcc	%g0, %l6, %l1
	.word	0xa2426425	! t0_kref+0x38f0:   	addc	%o1, 0x425, %l1
	.word	0xa20c4014	! t0_kref+0x38f4:   	and	%l1, %l4, %l1
	.word	0x9fc00004	! t0_kref+0x38f8:   	call	%g0 + %g4
	.word	0x9da00556	! t0_kref+0x38fc:   	fsqrtd	%f22, %f14
	.word	0x23480003	! t0_kref+0x3900:   	fbne,a,pt	%fcc0, _kref+0x390c
	.word	0xc02e3ff2	! t0_kref+0x3904:   	clrb	[%i0 - 0xe]
	.word	0xa29ec00b	! t0_kref+0x3908:   	xorcc	%i3, %o3, %l1
	.word	0x3c480004	! t0_kref+0x390c:   	bpos,a,pt	%icc, _kref+0x391c
	.word	0x91b6c707	! t0_kref+0x3910:   	fmuld8sux16	%f27, %f7, %f8
	.word	0xa336a01e	! t0_kref+0x3914:   	srl	%i2, 0x1e, %l1
	.word	0x23279933	! t0_kref+0x3918:   	sethi	%hi(0x9e64cc00), %l1
	.word	0xe24e8018	! t0_kref+0x391c:   	ldsb	[%i2 + %i0], %l1
	.word	0xc12e401c	! t0_kref+0x3920:   	st	%fsr, [%i1 + %i4]
	.word	0x9de3bfa0	! t0_kref+0x3924:   	save	%sp, -0x60, %sp
	.word	0xb90f2da0	! t0_kref+0x3928:   	tsubcc	%i4, 0xda0, %i4
	.word	0xa3ee001a	! t0_kref+0x392c:   	restore	%i0, %i2, %l1
	.word	0xa3b4434a	! t0_kref+0x3930:   	alignaddrl	%l1, %o2, %l1
	.word	0xa324000d	! t0_kref+0x3934:   	mulscc	%l0, %o5, %l1
	.word	0xe24e8019	! t0_kref+0x3938:   	ldsb	[%i2 + %i1], %l1
	.word	0xa22ae8ff	! t0_kref+0x393c:   	andn	%o3, 0x8ff, %l1
	.word	0x81ac8a5a	! t0_kref+0x3940:   	fcmpd	%fcc0, %f18, %f26
	.word	0xa3b28349	! t0_kref+0x3944:   	alignaddrl	%o2, %o1, %l1
	.word	0x81a98a48	! t0_kref+0x3948:   	fcmpd	%fcc0, %f6, %f8
	.word	0x37480002	! t0_kref+0x394c:   	fbge,a,pt	%fcc0, _kref+0x3954
	.word	0x9db007a8	! t0_kref+0x3950:   	fpackfix	%f8, %f14
	.word	0xa27b6739	! t0_kref+0x3954:   	sdiv	%o5, 0x739, %l1
	.word	0x9de3bfa0	! t0_kref+0x3958:   	save	%sp, -0x60, %sp
	.word	0xa3ef0019	! t0_kref+0x395c:   	restore	%i4, %i1, %l1
	.word	0xa2ace963	! t0_kref+0x3960:   	andncc	%l3, 0x963, %l1
	.word	0x36800001	! t0_kref+0x3964:   	bge,a	_kref+0x3968
	.word	0xa3b30136	! t0_kref+0x3968:   	edge32n	%o4, %l6, %l1
	.word	0xd5060000	! t0_kref+0x396c:   	ld	[%i0], %f10
	.word	0xa3b5404c	! t0_kref+0x3970:   	edge8l	%l5, %o4, %l1
	.word	0xb9b24ca8	! t0_kref+0x3974:   	fandnot2s	%f9, %f8, %f28
	.word	0x8fb34c79	! t0_kref+0x3978:   	fnors	%f13, %f25, %f7
	.word	0xe11fbd90	! t0_kref+0x397c:   	ldd	[%fp - 0x270], %f16
	.word	0x8610201e	! t0_kref+0x3980:   	mov	0x1e, %g3
	.word	0x86a0e001	! t0_kref+0x3984:   	subcc	%g3, 1, %g3
	.word	0x2280000c	! t0_kref+0x3988:   	be,a	_kref+0x39b8
	.word	0xeba71018	! t0_kref+0x398c:   	sta	%f21, [%i4 + %i0]0x80
	.word	0xa2dd800b	! t0_kref+0x3990:   	smulcc	%l6, %o3, %l1
	.word	0xd2300018	! t0_kref+0x3994:   	sth	%o1, [%g0 + %i0]
	.word	0xa2f6c00b	! t0_kref+0x3998:   	udivcc	%i3, %o3, %l1
	.word	0xdb00a028	! t0_kref+0x399c:   	ld	[%g2 + 0x28], %f13
	.word	0xb9a01a32	! t0_kref+0x39a0:   	fstoi	%f18, %f28
	.word	0xd020a000	! t0_kref+0x39a4:   	st	%o0, [%g2]
	.word	0xebf61015	! t0_kref+0x39a8:   	casxa	[%i0]0x80, %l5, %l5
	.word	0x2e4ffff6	! t0_kref+0x39ac:   	bvs,a,pt	%icc, _kref+0x3984
	.word	0xada3085a	! t0_kref+0x39b0:   	faddd	%f12, %f26, %f22
	.word	0x81ab8a4a	! t0_kref+0x39b4:   	fcmpd	%fcc0, %f14, %f10
	.word	0xf3ee501b	! t0_kref+0x39b8:   	prefetcha	%i1 + %i3, 25
	.word	0xa3b204d8	! t0_kref+0x39bc:   	fcmpne32	%f8, %f24, %l1
	.word	0xa205c012	! t0_kref+0x39c0:   	add	%l7, %l2, %l1
	.word	0xa3b18caf	! t0_kref+0x39c4:   	fandnot2s	%f6, %f15, %f17
	.word	0xa284fcbc	! t0_kref+0x39c8:   	addcc	%l3, -0x344, %l1
	.word	0xe81e3ff8	! t0_kref+0x39cc:   	ldd	[%i0 - 8], %l4
	.word	0xf51fbd08	! t0_kref+0x39d0:   	ldd	[%fp - 0x2f8], %f26
	.word	0xb1a58950	! t0_kref+0x39d4:   	fmuld	%f22, %f16, %f24
	.word	0xb9a01a50	! t0_kref+0x39d8:   	fdtoi	%f16, %f28
	.word	0xe2500018	! t0_kref+0x39dc:   	ldsh	[%g0 + %i0], %l1
	.word	0xa3b70586	! t0_kref+0x39e0:   	fcmpgt32	%f28, %f6, %l1
	.word	0x95a6084c	! t0_kref+0x39e4:   	faddd	%f24, %f12, %f10
	.word	0xb9b38da9	! t0_kref+0x39e8:   	fxors	%f14, %f9, %f28
	.word	0x28480008	! t0_kref+0x39ec:   	bleu,a,pt	%icc, _kref+0x3a0c
	.word	0xa29a0014	! t0_kref+0x39f0:   	xorcc	%o0, %l4, %l1
	.word	0x81a98a46	! t0_kref+0x39f4:   	fcmpd	%fcc0, %f6, %f6
	.word	0xa2bac011	! t0_kref+0x39f8:   	xnorcc	%o3, %l1, %l1
	.word	0xa3b4ce2a	! t0_kref+0x39fc:   	fands	%f19, %f10, %f17
	.word	0x81acca39	! t0_kref+0x3a00:   	fcmps	%fcc0, %f19, %f25
	.word	0xa2840013	! t0_kref+0x3a04:   	addcc	%l0, %l3, %l1
	.word	0xe2167fe6	! t0_kref+0x3a08:   	lduh	[%i1 - 0x1a], %l1
	.word	0xe2080019	! t0_kref+0x3a0c:   	ldub	[%g0 + %i1], %l1
	.word	0xa3b00c20	! t0_kref+0x3a10:   	fzeros	%f17
	sethi	%hi(2f), %o7
	.word	0xe40be260	! t0_kref+0x3a18:   	ldub	[%o7 + 0x260], %l2
	.word	0xa41ca00c	! t0_kref+0x3a1c:   	xor	%l2, 0xc, %l2
	.word	0xe42be260	! t0_kref+0x3a20:   	stb	%l2, [%o7 + 0x260]
	.word	0x81dbe260	! t0_kref+0x3a24:   	flush	%o7 + 0x260
	.word	0xa7a348b7	! t0_kref+0x3a28:   	fsubs	%f13, %f23, %f19
	.word	0xcd067ff4	! t0_kref+0x3a2c:   	ld	[%i1 - 0xc], %f6
	.word	0x38800007	! t0_kref+0x3a30:   	bgu,a	_kref+0x3a4c
	.word	0xa2b56e38	! t0_kref+0x3a34:   	orncc	%l5, 0xe38, %l1
	.word	0xa332400b	! t0_kref+0x3a38:   	srl	%o1, %o3, %l1
	.word	0xe250a038	! t0_kref+0x3a3c:   	ldsh	[%g2 + 0x38], %l1
	.word	0x9da0189d	! t0_kref+0x3a40:   	fitos	%f29, %f14
	.word	0xb9b00c00	! t0_kref+0x3a44:   	fzero	%f28
	.word	0xa2368000	! t0_kref+0x3a48:   	orn	%i2, %g0, %l1
	.word	0x21800006	! t0_kref+0x3a4c:   	fbn,a	_kref+0x3a64
	.word	0xe9ee101b	! t0_kref+0x3a50:   	prefetcha	%i0 + %i3, 20
	.word	0xdf06601c	! t0_kref+0x3a54:   	ld	[%i1 + 0x1c], %f15
	.word	0xc030a00a	! t0_kref+0x3a58:   	clrh	[%g2 + 0xa]
	.word	0xa2a26e8d	! t0_kref+0x3a5c:   	subcc	%o1, 0xe8d, %l1
2:	.word	0xa292c00b	! t0_kref+0x3a60:   	orcc	%o3, %o3, %l1
	.word	0xe20e3fe8	! t0_kref+0x3a64:   	ldub	[%i0 - 0x18], %l1
	.word	0x8da609c6	! t0_kref+0x3a68:   	fdivd	%f24, %f6, %f6
	.word	0x23145566	! t0_kref+0x3a6c:   	sethi	%hi(0x51559800), %l1
	.word	0xe028a01b	! t0_kref+0x3a70:   	stb	%l0, [%g2 + 0x1b]
	.word	0x9bb70caa	! t0_kref+0x3a74:   	fandnot2s	%f28, %f10, %f13
	.word	0x81ae8a48	! t0_kref+0x3a78:   	fcmpd	%fcc0, %f26, %f8
	.word	0xda78a020	! t0_kref+0x3a7c:   	swap	[%g2 + 0x20], %o5
	.word	0xe2861000	! t0_kref+0x3a80:   	lda	[%i0]0x80, %l1
	.word	0xa9a0110e	! t0_kref+0x3a84:   	fxtod	%f14, %f20
	.word	0xa2a2c00a	! t0_kref+0x3a88:   	subcc	%o3, %o2, %l1
	.word	0x2c800003	! t0_kref+0x3a8c:   	bneg,a	_kref+0x3a98
	.word	0xa2430000	! t0_kref+0x3a90:   	addc	%o4, %g0, %l1
	.word	0x2e480004	! t0_kref+0x3a94:   	bvs,a,pt	%icc, _kref+0x3aa4
	.word	0xadb00f1a	! t0_kref+0x3a98:   	fsrc2	%f26, %f22
	.word	0xb6103ff0	! t0_kref+0x3a9c:   	mov	0xfffffff0, %i3
	.word	0xc1ee101a	! t0_kref+0x3aa0:   	prefetcha	%i0 + %i2, 0
	.word	0xcd20a028	! t0_kref+0x3aa4:   	st	%f6, [%g2 + 0x28]
	.word	0xdf062008	! t0_kref+0x3aa8:   	ld	[%i0 + 8], %f15
	.word	0xe2160000	! t0_kref+0x3aac:   	lduh	[%i0], %l1
	.word	0x38800005	! t0_kref+0x3ab0:   	bgu,a	_kref+0x3ac4
	.word	0xf007bfe0	! t0_kref+0x3ab4:   	ld	[%fp - 0x20], %i0
	.word	0xa3302010	! t0_kref+0x3ab8:   	srl	%g0, 0x10, %l1
	.word	0x27800003	! t0_kref+0x3abc:   	fbul,a	_kref+0x3ac8
	.word	0x95b70f8e	! t0_kref+0x3ac0:   	for	%f28, %f14, %f10
	.word	0xe5981018	! t0_kref+0x3ac4:   	ldda	[%g0 + %i0]0x80, %f18
	.word	0xd020a018	! t0_kref+0x3ac8:   	st	%o0, [%g2 + 0x18]
	.word	0xa23268db	! t0_kref+0x3acc:   	orn	%o1, 0x8db, %l1
	.word	0xee28a000	! t0_kref+0x3ad0:   	stb	%l7, [%g2]
	.word	0x81b01024	! t0_kref+0x3ad4:   	siam	0x4
	.word	0x36800006	! t0_kref+0x3ad8:   	bge,a	_kref+0x3af0
	.word	0xa336c010	! t0_kref+0x3adc:   	srl	%i3, %l0, %l1
	.word	0xa3400000	! t0_kref+0x3ae0:   	mov	%y, %l1
	.word	0xa2a2ef95	! t0_kref+0x3ae4:   	subcc	%o3, 0xf95, %l1
	.word	0x91a000a6	! t0_kref+0x3ae8:   	fnegs	%f6, %f8
	.word	0x81adca36	! t0_kref+0x3aec:   	fcmps	%fcc0, %f23, %f22
	.word	0xe286101c	! t0_kref+0x3af0:   	lda	[%i0 + %i4]0x80, %l1
	.word	0xe240a018	! t0_kref+0x3af4:   	ldsw	[%g2 + 0x18], %l1
	.word	0xe81e7fe0	! t0_kref+0x3af8:   	ldd	[%i1 - 0x20], %l4
	.word	0xe250a03a	! t0_kref+0x3afc:   	ldsh	[%g2 + 0x3a], %l1
	.word	0xda362018	! t0_kref+0x3b00:   	sth	%o5, [%i0 + 0x18]
	.word	0xa3b50506	! t0_kref+0x3b04:   	fcmpgt16	%f20, %f6, %l1
	.word	0xe2566008	! t0_kref+0x3b08:   	ldsh	[%i1 + 8], %l1
	.word	0xa22d0016	! t0_kref+0x3b0c:   	andn	%l4, %l6, %l1
	.word	0xb1b70e54	! t0_kref+0x3b10:   	fxnor	%f28, %f20, %f24
	.word	0xcf063ff0	! t0_kref+0x3b14:   	ld	[%i0 - 0x10], %f7
	.word	0xa28561a0	! t0_kref+0x3b18:   	addcc	%l5, 0x1a0, %l1
	.word	0xa3b5c129	! t0_kref+0x3b1c:   	edge32n	%l7, %o1, %l1
	.word	0xa9b28e80	! t0_kref+0x3b20:   	fsrc1	%f10, %f20
	.word	0x2b480004	! t0_kref+0x3b24:   	fbug,a,pt	%fcc0, _kref+0x3b34
	.word	0x81580000	! t0_kref+0x3b28:   	flushw
	.word	0xa3b30516	! t0_kref+0x3b2c:   	fcmpgt16	%f12, %f22, %l1
	.word	0x81820000	! t0_kref+0x3b30:   	wr	%o0, %g0, %y
	.word	0xa3b34357	! t0_kref+0x3b34:   	alignaddrl	%o5, %l7, %l1
	.word	0xec30a03a	! t0_kref+0x3b38:   	sth	%l6, [%g2 + 0x3a]
	.word	0xe25e3fe0	! t0_kref+0x3b3c:   	ldx	[%i0 - 0x20], %l1
	.word	0x8db00fc0	! t0_kref+0x3b40:   	fone	%f6
	.word	0x8143c000	! t0_kref+0x3b44:   	stbar
	.word	0xb5b58f4a	! t0_kref+0x3b48:   	fornot1	%f22, %f10, %f26
	.word	0xe3b8a080	! t0_kref+0x3b4c:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xa9a01927	! t0_kref+0x3b50:   	fstod	%f7, %f20
	.word	0xada308ce	! t0_kref+0x3b54:   	fsubd	%f12, %f14, %f22
	.word	0xe2d01019	! t0_kref+0x3b58:   	ldsha	[%g0 + %i1]0x80, %l1
	.word	0xcf063fe4	! t0_kref+0x3b5c:   	ld	[%i0 - 0x1c], %f7
	.word	0x22800001	! t0_kref+0x3b60:   	be,a	_kref+0x3b64
	.word	0xa22ec016	! t0_kref+0x3b64:   	andn	%i3, %l6, %l1
	.word	0xadb009a7	! t0_kref+0x3b68:   	fexpand	%f7, %f22
	sethi	%hi(2f), %o7
	.word	0xe40be384	! t0_kref+0x3b70:   	ldub	[%o7 + 0x384], %l2
	.word	0xa41ca00c	! t0_kref+0x3b74:   	xor	%l2, 0xc, %l2
	.word	0xe42be384	! t0_kref+0x3b78:   	stb	%l2, [%o7 + 0x384]
	.word	0x81dbe384	! t0_kref+0x3b7c:   	flush	%o7 + 0x384
	.word	0xe5be101d	! t0_kref+0x3b80:   	stda	%f18, [%i0 + %i5]0x80
2:	.word	0xe2500018	! t0_kref+0x3b84:   	ldsh	[%g0 + %i0], %l1
	.word	0x28480005	! t0_kref+0x3b88:   	bleu,a,pt	%icc, _kref+0x3b9c
	.word	0xf620a020	! t0_kref+0x3b8c:   	st	%i3, [%g2 + 0x20]
	.word	0x2e480005	! t0_kref+0x3b90:   	bvs,a,pt	%icc, _kref+0x3ba4
	.word	0xa1b00c20	! t0_kref+0x3b94:   	fzeros	%f16
	.word	0xa2d6e291	! t0_kref+0x3b98:   	umulcc	%i3, 0x291, %l1
	.word	0xa2f6b39b	! t0_kref+0x3b9c:   	udivcc	%i2, -0xc65, %l1
	.word	0xada00558	! t0_kref+0x3ba0:   	fsqrtd	%f24, %f22
	.word	0xa31237f9	! t0_kref+0x3ba4:   	taddcctv	%o0, -0x807, %l1
	.word	0xa33d4000	! t0_kref+0x3ba8:   	sra	%l5, %g0, %l1
	.word	0x8da688d4	! t0_kref+0x3bac:   	fsubd	%f26, %f20, %f6
	.word	0x2b800006	! t0_kref+0x3bb0:   	fbug,a	_kref+0x3bc8
	.word	0x81dee366	! t0_kref+0x3bb4:   	flush	%i3 + 0x366
	.word	0x23389d64	! t0_kref+0x3bb8:   	sethi	%hi(0xe2759000), %l1
	.word	0xd5062008	! t0_kref+0x3bbc:   	ld	[%i0 + 8], %f10
	.word	0xa212000a	! t0_kref+0x3bc0:   	or	%o0, %o2, %l1
	.word	0xa2c4e957	! t0_kref+0x3bc4:   	addccc	%l3, 0x957, %l1
	.word	0xa3b200d7	! t0_kref+0x3bc8:   	edge16l	%o0, %l7, %l1
	.word	0xc9be1854	! t0_kref+0x3bcc:   	stda	%f4, [%i0 + %l4]0xc2
	.word	0x9db00c00	! t0_kref+0x3bd0:   	fzero	%f14
	.word	0xe41e7ff0	! t0_kref+0x3bd4:   	ldd	[%i1 - 0x10], %l2
	.word	0xa22eb411	! t0_kref+0x3bd8:   	andn	%i2, -0xbef, %l1
	.word	0xf5ee501a	! t0_kref+0x3bdc:   	prefetcha	%i1 + %i2, 26
	.word	0xa29c0008	! t0_kref+0x3be0:   	xorcc	%l0, %o0, %l1
	.word	0xb9a000ae	! t0_kref+0x3be4:   	fnegs	%f14, %f28
	.word	0xa21ca12b	! t0_kref+0x3be8:   	xor	%l2, 0x12b, %l1
	.word	0xe2066014	! t0_kref+0x3bec:   	ld	[%i1 + 0x14], %l1
	.word	0x23257907	! t0_kref+0x3bf0:   	sethi	%hi(0x95e41c00), %l1
	.word	0x22480005	! t0_kref+0x3bf4:   	be,a,pt	%icc, _kref+0x3c08
	.word	0xa20266d3	! t0_kref+0x3bf8:   	add	%o1, 0x6d3, %l1
	.word	0xee30a03a	! t0_kref+0x3bfc:   	sth	%l7, [%g2 + 0x3a]
	.word	0xe3ee501b	! t0_kref+0x3c00:   	prefetcha	%i1 + %i3, 17
	.word	0xa2334013	! t0_kref+0x3c04:   	orn	%o5, %l3, %l1
	.word	0xada01932	! t0_kref+0x3c08:   	fstod	%f18, %f22
	.word	0xa3b4810d	! t0_kref+0x3c0c:   	edge32	%l2, %o5, %l1
	.word	0xa2968008	! t0_kref+0x3c10:   	orcc	%i2, %o0, %l1
	.word	0xeb20a020	! t0_kref+0x3c14:   	st	%f21, [%g2 + 0x20]
	.word	0xb3a0109c	! t0_kref+0x3c18:   	fxtos	%f28, %f25
	.word	0xa2ddc00b	! t0_kref+0x3c1c:   	smulcc	%l7, %o3, %l1
	.word	0x9de3bfa0	! t0_kref+0x3c20:   	save	%sp, -0x60, %sp
	.word	0xa3e82dfb	! t0_kref+0x3c24:   	restore	%g0, 0xdfb, %l1
	.word	0xa2f44013	! t0_kref+0x3c28:   	udivcc	%l1, %l3, %l1
	.word	0xe20e3fe6	! t0_kref+0x3c2c:   	ldub	[%i0 - 0x1a], %l1
	.word	0xb5a408dc	! t0_kref+0x3c30:   	fsubd	%f16, %f28, %f26
	.word	0xb8102000	! t0_kref+0x3c34:   	mov	0x0, %i4
	.word	0xa29d4012	! t0_kref+0x3c38:   	xorcc	%l5, %l2, %l1
	.word	0x95a00032	! t0_kref+0x3c3c:   	fmovs	%f18, %f10
	.word	0x8143c000	! t0_kref+0x3c40:   	stbar
	.word	0x3e480005	! t0_kref+0x3c44:   	bvc,a,pt	%icc, _kref+0x3c58
	.word	0x8143c000	! t0_kref+0x3c48:   	stbar
	.word	0x2a800001	! t0_kref+0x3c4c:   	bcs,a	_kref+0x3c50
	.word	0xa370353b	! t0_kref+0x3c50:   	popc	-0xac5, %l1
	.word	0x81ad0a48	! t0_kref+0x3c54:   	fcmpd	%fcc0, %f20, %f8
	.word	0xf91fbe40	! t0_kref+0x3c58:   	ldd	[%fp - 0x1c0], %f28
	.word	0x33480008	! t0_kref+0x3c5c:   	fbe,a,pt	%fcc0, _kref+0x3c7c
	.word	0xe41e0000	! t0_kref+0x3c60:   	ldd	[%i0], %l2
	.word	0x81834000	! t0_kref+0x3c64:   	wr	%o5, %g0, %y
	.word	0xd51fbd38	! t0_kref+0x3c68:   	ldd	[%fp - 0x2c8], %f10
!	.word	0x3a4d28e3	! t0_kref+0x3c6c:   	bcc,a,pt	%icc, SYM(t0_subr1)
	   	bcc,a,pt	%icc, SYM(t0_subr1)
	.word	0x9f414000	! t0_kref+0x3c70:   	mov	%pc, %o7
	.word	0x99a0192c	! t0_kref+0x3c74:   	fstod	%f12, %f12
	.word	0x9da0192d	! t0_kref+0x3c78:   	fstod	%f13, %f14
	.word	0xa3234014	! t0_kref+0x3c7c:   	mulscc	%o5, %l4, %l1
	.word	0x9de3bfa0	! t0_kref+0x3c80:   	save	%sp, -0x60, %sp
	.word	0xb306401b	! t0_kref+0x3c84:   	taddcc	%i1, %i3, %i1
	.word	0xa3eee5e8	! t0_kref+0x3c88:   	restore	%i3, 0x5e8, %l1
	.word	0xa2824012	! t0_kref+0x3c8c:   	addcc	%o1, %l2, %l1
	.word	0xa9a54935	! t0_kref+0x3c90:   	fmuls	%f21, %f21, %f20
	.word	0xa5a6885a	! t0_kref+0x3c94:   	faddd	%f26, %f26, %f18
	.word	0xa2b52a01	! t0_kref+0x3c98:   	orncc	%l4, 0xa01, %l1
	.word	0xe2566004	! t0_kref+0x3c9c:   	ldsh	[%i1 + 4], %l1
	.word	0xdf260000	! t0_kref+0x3ca0:   	st	%f15, [%i0]
	.word	0xa5a3cd34	! t0_kref+0x3ca4:   	fsmuld	%f15, %f20, %f18
	.word	0x8143e040	! t0_kref+0x3ca8:   	membar	0x40
	.word	0xe250a00a	! t0_kref+0x3cac:   	ldsh	[%g2 + 0xa], %l1
	.word	0xc12e2014	! t0_kref+0x3cb0:   	st	%fsr, [%i0 + 0x14]
	.word	0xa232400c	! t0_kref+0x3cb4:   	orn	%o1, %o4, %l1
	.word	0xe24e600f	! t0_kref+0x3cb8:   	ldsb	[%i1 + 0xf], %l1
	.word	0x95a01888	! t0_kref+0x3cbc:   	fitos	%f8, %f10
	sethi	%hi(2f), %o7
	.word	0xe40be0d8	! t0_kref+0x3cc4:   	ldub	[%o7 + 0xd8], %l2
	.word	0xa41ca00c	! t0_kref+0x3cc8:   	xor	%l2, 0xc, %l2
	.word	0xe42be0d8	! t0_kref+0x3ccc:   	stb	%l2, [%o7 + 0xd8]
	.word	0x81dbe0d8	! t0_kref+0x3cd0:   	flush	%o7 + 0xd8
	.word	0xa2828000	! t0_kref+0x3cd4:   	addcc	%o2, %g0, %l1
2:	.word	0x91a709c8	! t0_kref+0x3cd8:   	fdivd	%f28, %f8, %f8
	.word	0xa3b34200	! t0_kref+0x3cdc:   	array8	%o5, %g0, %l1
	.word	0x81aecab4	! t0_kref+0x3ce0:   	fcmpes	%fcc0, %f27, %f20
	.word	0xb9a000ab	! t0_kref+0x3ce4:   	fnegs	%f11, %f28
	.word	0x81af4aab	! t0_kref+0x3ce8:   	fcmpes	%fcc0, %f29, %f11
	.word	0x81ab8ad6	! t0_kref+0x3cec:   	fcmped	%fcc0, %f14, %f22
	.word	0xb5a38958	! t0_kref+0x3cf0:   	fmuld	%f14, %f24, %f26
	.word	0xa210000b	! t0_kref+0x3cf4:   	mov	%o3, %l1
	.word	0xada00558	! t0_kref+0x3cf8:   	fsqrtd	%f24, %f22
	.word	0xa3b68017	! t0_kref+0x3cfc:   	edge8	%i2, %l7, %l1
	.word	0xa2ac801a	! t0_kref+0x3d00:   	andncc	%l2, %i2, %l1
	.word	0xe208a000	! t0_kref+0x3d04:   	ldub	[%g2], %l1
	.word	0xe53e001d	! t0_kref+0x3d08:   	std	%f18, [%i0 + %i5]
	.word	0x23319406	! t0_kref+0x3d0c:   	sethi	%hi(0xc6501800), %l1
	.word	0x23480008	! t0_kref+0x3d10:   	fbne,a,pt	%fcc0, _kref+0x3d30
	.word	0xd26e601c	! t0_kref+0x3d14:   	ldstub	[%i1 + 0x1c], %o1
	.word	0xd1bf5a58	! t0_kref+0x3d18:   	stda	%f8, [%i5 + %i0]0xd2
	.word	0x35480008	! t0_kref+0x3d1c:   	fbue,a,pt	%fcc0, _kref+0x3d3c
	.word	0xf9066004	! t0_kref+0x3d20:   	ld	[%i1 + 4], %f28
	.word	0x95a4884a	! t0_kref+0x3d24:   	faddd	%f18, %f10, %f10
	.word	0x3f480007	! t0_kref+0x3d28:   	fbo,a,pt	%fcc0, _kref+0x3d44
	.word	0xa2702aa5	! t0_kref+0x3d2c:   	udiv	%g0, 0xaa5, %l1
	.word	0xa3b5405b	! t0_kref+0x3d30:   	edge8l	%l5, %i3, %l1
	.word	0xa2450008	! t0_kref+0x3d34:   	addc	%l4, %o0, %l1
	.word	0x81dec01c	! t0_kref+0x3d38:   	flush	%i3 + %i4
	.word	0xe228a032	! t0_kref+0x3d3c:   	stb	%l1, [%g2 + 0x32]
	.word	0x99a01911	! t0_kref+0x3d40:   	fitod	%f17, %f12
	.word	0xa20cc01b	! t0_kref+0x3d44:   	and	%l3, %i3, %l1
	.word	0xb7a00137	! t0_kref+0x3d48:   	fabss	%f23, %f27
	.word	0xe2063ffc	! t0_kref+0x3d4c:   	ld	[%i0 - 4], %l1
	.word	0xa366e49c	! t0_kref+0x3d50:   	movge	%icc, -0x364, %l1
	.word	0xe11fbe08	! t0_kref+0x3d54:   	ldd	[%fp - 0x1f8], %f16
	.word	0xa2ae8016	! t0_kref+0x3d58:   	andncc	%i2, %l6, %l1
	.word	0x95a00146	! t0_kref+0x3d5c:   	fabsd	%f6, %f10
	.word	0xe2901019	! t0_kref+0x3d60:   	lduha	[%g0 + %i1]0x80, %l1
	.word	0xa215724f	! t0_kref+0x3d64:   	or	%l5, -0xdb1, %l1
	.word	0xa3b2c000	! t0_kref+0x3d68:   	edge8	%o3, %g0, %l1
	.word	0xa296ea13	! t0_kref+0x3d6c:   	orcc	%i3, 0xa13, %l1
	.word	0xd9260000	! t0_kref+0x3d70:   	st	%f12, [%i0]
	.word	0xa22b29b1	! t0_kref+0x3d74:   	andn	%o4, 0x9b1, %l1
	call	1f
	.empty
	.word	0x81b01023	! t0_kref+0x3d7c:   	siam	0x3
	.word	0xa3b00336	! t0_kref+0x3d80:   	bmask	%g0, %l6, %l1
	.word	0xa1a01030	! t0_kref+0x3d84:   	fstox	%f16, %f16
	.word	0xb7a018d4	! t0_kref+0x3d88:   	fdtos	%f20, %f27
	.word	0xe20e8019	! t0_kref+0x3d8c:   	ldub	[%i2 + %i1], %l1
	.word	0xb5a208c8	! t0_kref+0x3d90:   	fsubd	%f8, %f8, %f26
	.word	0xd7263fe0	! t0_kref+0x3d94:   	st	%f11, [%i0 - 0x20]
1:	.word	0xada01935	! t0_kref+0x3d98:   	fstod	%f21, %f22
	.word	0x99b38dd6	! t0_kref+0x3d9c:   	fnand	%f14, %f22, %f12
	.word	0xd9be5852	! t0_kref+0x3da0:   	stda	%f12, [%i1 + %l2]0xc2
	.word	0xa212000d	! t0_kref+0x3da4:   	or	%o0, %o5, %l1
	.word	0x9bb4cf7d	! t0_kref+0x3da8:   	fornot1s	%f19, %f29, %f13
	.word	0xa2bb7430	! t0_kref+0x3dac:   	xnorcc	%o5, -0xbd0, %l1
	.word	0xa29cf8f1	! t0_kref+0x3db0:   	xorcc	%l3, -0x70f, %l1
	call	SYM(t0_subr1)
	.word	0xa2e5fc46	! t0_kref+0x3db8:   	subccc	%l7, -0x3ba, %l1
	.word	0x8143c000	! t0_kref+0x3dbc:   	stbar
	.word	0x81ac4a3a	! t0_kref+0x3dc0:   	fcmps	%fcc0, %f17, %f26
	.word	0xe24e001a	! t0_kref+0x3dc4:   	ldsb	[%i0 + %i2], %l1
	.word	0xa25de480	! t0_kref+0x3dc8:   	smul	%l7, 0x480, %l1
	.word	0x3d480002	! t0_kref+0x3dcc:   	fbule,a,pt	%fcc0, _kref+0x3dd4
	.word	0xe2460000	! t0_kref+0x3dd0:   	ldsw	[%i0], %l1
!	.word	0x284d2889	! t0_kref+0x3dd4:   	bleu,a,pt	%icc, SYM(t0_subr1)
	   	bleu,a,pt	%icc, SYM(t0_subr1)
	.word	0x9f414000	! t0_kref+0x3dd8:   	mov	%pc, %o7
	.word	0xd3e65016	! t0_kref+0x3ddc:   	casa	[%i1]0x80, %l6, %o1
	.word	0x81df6bcd	! t0_kref+0x3de0:   	flush	%i5 + 0xbcd
	.word	0xa3b54200	! t0_kref+0x3de4:   	array8	%l5, %g0, %l1
	.word	0xb5b386aa	! t0_kref+0x3de8:   	fmul8x16al	%f14, %f10, %f26
	.word	0x8db38d90	! t0_kref+0x3dec:   	fxor	%f14, %f16, %f6
	call	SYM(t0_subr3)
	.word	0x95a00548	! t0_kref+0x3df4:   	fsqrtd	%f8, %f10
	.word	0xa3b38598	! t0_kref+0x3df8:   	fcmpgt32	%f14, %f24, %l1
	.word	0x81dbc00a	! t0_kref+0x3dfc:   	flush	%o7 + %o2
	.word	0xf428a031	! t0_kref+0x3e00:   	stb	%i2, [%g2 + 0x31]
	.word	0xa3400000	! t0_kref+0x3e04:   	mov	%y, %l1
	.word	0x2e480002	! t0_kref+0x3e08:   	bvs,a,pt	%icc, _kref+0x3e10
	.word	0xe8360000	! t0_kref+0x3e0c:   	sth	%l4, [%i0]
	.word	0xe2680018	! t0_kref+0x3e10:   	ldstub	[%g0 + %i0], %l1
	.word	0xe20e7ff4	! t0_kref+0x3e14:   	ldub	[%i1 - 0xc], %l1
	.word	0xa33b0009	! t0_kref+0x3e18:   	sra	%o4, %o1, %l1
	.word	0xa242a1cb	! t0_kref+0x3e1c:   	addc	%o2, 0x1cb, %l1
	.word	0xadb40ece	! t0_kref+0x3e20:   	fornot2	%f16, %f14, %f22
	.word	0x3a800005	! t0_kref+0x3e24:   	bcc,a	_kref+0x3e38
	.word	0xa276b1f4	! t0_kref+0x3e28:   	udiv	%i2, -0xe0c, %l1
	.word	0xd03f4018	! t0_kref+0x3e2c:   	std	%o0, [%i5 + %i0]
	.word	0xa2d5c014	! t0_kref+0x3e30:   	umulcc	%l7, %l4, %l1
	.word	0xada34926	! t0_kref+0x3e34:   	fmuls	%f13, %f6, %f22
	.word	0xe5bf5018	! t0_kref+0x3e38:   	stda	%f18, [%i5 + %i0]0x80
	.word	0x29480003	! t0_kref+0x3e3c:   	fbl,a,pt	%fcc0, _kref+0x3e48
	.word	0xb1a50856	! t0_kref+0x3e40:   	faddd	%f20, %f22, %f24
	.word	0x8143c000	! t0_kref+0x3e44:   	stbar
	.word	0xb9a58850	! t0_kref+0x3e48:   	faddd	%f22, %f16, %f28
	.word	0xa3b3054c	! t0_kref+0x3e4c:   	fcmpeq16	%f12, %f12, %l1
	.word	0xe3b8a040	! t0_kref+0x3e50:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xe830a022	! t0_kref+0x3e54:   	sth	%l4, [%g2 + 0x22]
	.word	0xe2df5018	! t0_kref+0x3e58:   	ldxa	[%i5 + %i0]0x80, %l1
	call	SYM(t0_subr3)
	.word	0xed20a028	! t0_kref+0x3e60:   	st	%f22, [%g2 + 0x28]
	.word	0xe250a00a	! t0_kref+0x3e64:   	ldsh	[%g2 + 0xa], %l1
	.word	0xa3b20334	! t0_kref+0x3e68:   	bmask	%o0, %l4, %l1
	.word	0xa3348010	! t0_kref+0x3e6c:   	srl	%l2, %l0, %l1
	.word	0xa2f6c010	! t0_kref+0x3e70:   	udivcc	%i3, %l0, %l1
	.word	0x21800005	! t0_kref+0x3e74:   	fbn,a	_kref+0x3e88
	.word	0x8186c000	! t0_kref+0x3e78:   	wr	%i3, %g0, %y
	.word	0xa3034000	! t0_kref+0x3e7c:   	taddcc	%o5, %g0, %l1
	.word	0xe628a018	! t0_kref+0x3e80:   	stb	%l3, [%g2 + 0x18]
	.word	0xa2342c5a	! t0_kref+0x3e84:   	orn	%l0, 0xc5a, %l1
	.word	0x81d9627d	! t0_kref+0x3e88:   	flush	%g5 + 0x27d
	.word	0x32480004	! t0_kref+0x3e8c:   	bne,a,pt	%icc, _kref+0x3e9c
	.word	0xa9a0015a	! t0_kref+0x3e90:   	fabsd	%f26, %f20
	.word	0x36800006	! t0_kref+0x3e94:   	bge,a	_kref+0x3eac
	.word	0xe2063ff4	! t0_kref+0x3e98:   	ld	[%i0 - 0xc], %l1
	.word	0xa3a018d6	! t0_kref+0x3e9c:   	fdtos	%f22, %f17
	.word	0xe2470018	! t0_kref+0x3ea0:   	ldsw	[%i4 + %i0], %l1
	.word	0x233aed35	! t0_kref+0x3ea4:   	sethi	%hi(0xebb4d400), %l1
	.word	0x99b18715	! t0_kref+0x3ea8:   	fmuld8sux16	%f6, %f21, %f12
	.word	0x81af0ac8	! t0_kref+0x3eac:   	fcmped	%fcc0, %f28, %f8
	.word	0xe216c018	! t0_kref+0x3eb0:   	lduh	[%i3 + %i0], %l1
	.word	0xe250a028	! t0_kref+0x3eb4:   	ldsh	[%g2 + 0x28], %l1
	.word	0xe24e6006	! t0_kref+0x3eb8:   	ldsb	[%i1 + 6], %l1
	.word	0xa5a20950	! t0_kref+0x3ebc:   	fmuld	%f8, %f16, %f18
	.word	0xa3400000	! t0_kref+0x3ec0:   	mov	%y, %l1
	.word	0x99a0055a	! t0_kref+0x3ec4:   	fsqrtd	%f26, %f12
	.word	0xe20e6016	! t0_kref+0x3ec8:   	ldub	[%i1 + 0x16], %l1
	.word	0xa32d4016	! t0_kref+0x3ecc:   	sll	%l5, %l6, %l1
	.word	0x9da608dc	! t0_kref+0x3ed0:   	fsubd	%f24, %f28, %f14
	.word	0x8143c000	! t0_kref+0x3ed4:   	stbar
	.word	0x8143c000	! t0_kref+0x3ed8:   	stbar
	.word	0x97b00ced	! t0_kref+0x3edc:   	fnot2s	%f13, %f11
	.word	0xcd801018	! t0_kref+0x3ee0:   	lda	[%g0 + %i0]0x80, %f6
	.word	0xcd26401c	! t0_kref+0x3ee4:   	st	%f6, [%i1 + %i4]
	.word	0xa2320017	! t0_kref+0x3ee8:   	orn	%o0, %l7, %l1
	.word	0x81af0ace	! t0_kref+0x3eec:   	fcmped	%fcc0, %f28, %f14
	.word	0xe2562014	! t0_kref+0x3ef0:   	ldsh	[%i0 + 0x14], %l1
	.word	0xa2ac400a	! t0_kref+0x3ef4:   	andncc	%l1, %o2, %l1
	.word	0xf91fbdc8	! t0_kref+0x3ef8:   	ldd	[%fp - 0x238], %f28
	.word	0x8143c000	! t0_kref+0x3efc:   	stbar
	.word	0xa274b05c	! t0_kref+0x3f00:   	udiv	%l2, -0xfa4, %l1
	.word	0xa2b5783c	! t0_kref+0x3f04:   	orncc	%l5, -0x7c4, %l1
	.word	0xa3302002	! t0_kref+0x3f08:   	srl	%g0, 0x2, %l1
	.word	0xa1a0190e	! t0_kref+0x3f0c:   	fitod	%f14, %f16
	.word	0xa3670013	! t0_kref+0x3f10:   	movgu	%icc, %l3, %l1
	.word	0xa21dc014	! t0_kref+0x3f14:   	xor	%l7, %l4, %l1
	.word	0xe4367fee	! t0_kref+0x3f18:   	sth	%l2, [%i1 - 0x12]
	.word	0xa22b400a	! t0_kref+0x3f1c:   	andn	%o5, %o2, %l1
	.word	0xa2ad3c0b	! t0_kref+0x3f20:   	andncc	%l4, -0x3f5, %l1
	.word	0x9fc00004	! t0_kref+0x3f24:   	call	%g0 + %g4
	.word	0xdd3e2008	! t0_kref+0x3f28:   	std	%f14, [%i0 + 8]
	.word	0x32800001	! t0_kref+0x3f2c:   	bne,a	_kref+0x3f30
	.word	0xa3400000	! t0_kref+0x3f30:   	mov	%y, %l1
	.word	0x3e480008	! t0_kref+0x3f34:   	bvc,a,pt	%icc, _kref+0x3f54
	.word	0xea20a008	! t0_kref+0x3f38:   	st	%l5, [%g2 + 8]
	.word	0xadb18c94	! t0_kref+0x3f3c:   	fandnot2	%f6, %f20, %f22
	.word	0x30800001	! t0_kref+0x3f40:   	ba,a	_kref+0x3f44
	.word	0xe8180018	! t0_kref+0x3f44:   	ldd	[%g0 + %i0], %l4
	.word	0xa245b556	! t0_kref+0x3f48:   	addc	%l6, -0xaaa, %l1
	.word	0x3e800006	! t0_kref+0x3f4c:   	bvc,a	_kref+0x3f64
	.word	0xfbee501c	! t0_kref+0x3f50:   	prefetcha	%i1 + %i4, 29
	call	SYM(t0_subr3)
	.word	0xa28ee924	! t0_kref+0x3f58:   	andcc	%i3, 0x924, %l1
	.word	0xb9a68d3c	! t0_kref+0x3f5c:   	fsmuld	%f26, %f28, %f28
	.word	0xa27b6ee4	! t0_kref+0x3f60:   	sdiv	%o5, 0xee4, %l1
	.word	0xed00a038	! t0_kref+0x3f64:   	ld	[%g2 + 0x38], %f22
	.word	0x8143c000	! t0_kref+0x3f68:   	stbar
	.word	0xe256401b	! t0_kref+0x3f6c:   	ldsh	[%i1 + %i3], %l1
	.word	0xa3b4016d	! t0_kref+0x3f70:   	edge32ln	%l0, %o5, %l1
	.word	0xe2567ff6	! t0_kref+0x3f74:   	ldsh	[%i1 - 0xa], %l1
	.word	0xe24e7ffe	! t0_kref+0x3f78:   	ldsb	[%i1 - 2], %l1
	.word	0xe200a008	! t0_kref+0x3f7c:   	ld	[%g2 + 8], %l1
	.word	0xa25b3931	! t0_kref+0x3f80:   	smul	%o4, -0x6cf, %l1
	.word	0xa21d4008	! t0_kref+0x3f84:   	xor	%l5, %o0, %l1
	.word	0xa2347e58	! t0_kref+0x3f88:   	orn	%l1, -0x1a8, %l1
	.word	0x21480001	! t0_kref+0x3f8c:   	fbn,a,pt	%fcc0, _kref+0x3f90
	.word	0xeb062010	! t0_kref+0x3f90:   	ld	[%i0 + 0x10], %f21
	.word	0xa2e431e9	! t0_kref+0x3f94:   	subccc	%l0, -0xe17, %l1
	.word	0x81ac0a56	! t0_kref+0x3f98:   	fcmpd	%fcc0, %f16, %f22
	.word	0x81ae0a54	! t0_kref+0x3f9c:   	fcmpd	%fcc0, %f24, %f20
	.word	0xa2333f42	! t0_kref+0x3fa0:   	orn	%o4, -0xbe, %l1
	.word	0x9fc10000	! t0_kref+0x3fa4:   	call	%g4
	.word	0xa2aa240c	! t0_kref+0x3fa8:   	andncc	%o0, 0x40c, %l1
	.word	0xa2828009	! t0_kref+0x3fac:   	addcc	%o2, %o1, %l1
	.word	0x81df400f	! t0_kref+0x3fb0:   	flush	%i5 + %o7
	.word	0xa2b5c012	! t0_kref+0x3fb4:   	orncc	%l7, %l2, %l1
	.word	0x81aeca3c	! t0_kref+0x3fb8:   	fcmps	%fcc0, %f27, %f28
	.word	0xd2262004	! t0_kref+0x3fbc:   	st	%o1, [%i0 + 4]
	.word	0xa22a0016	! t0_kref+0x3fc0:   	andn	%o0, %l6, %l1
	.word	0xa7a01895	! t0_kref+0x3fc4:   	fitos	%f21, %f19
	.word	0xa33a8009	! t0_kref+0x3fc8:   	sra	%o2, %o1, %l1
	.word	0x81acca2e	! t0_kref+0x3fcc:   	fcmps	%fcc0, %f19, %f14
	.word	0xe7ee101d	! t0_kref+0x3fd0:   	prefetcha	%i0 + %i5, 19
	.word	0x81ab0a50	! t0_kref+0x3fd4:   	fcmpd	%fcc0, %f12, %f16
	.word	0xe3b8a040	! t0_kref+0x3fd8:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x8fa01a26	! t0_kref+0x3fdc:   	fstoi	%f6, %f7
	.word	0xa202bc21	! t0_kref+0x3fe0:   	add	%o2, -0x3df, %l1
	.word	0xa334a019	! t0_kref+0x3fe4:   	srl	%l2, 0x19, %l1
	.word	0xc807bff0	! t0_kref+0x3fe8:   	ld	[%fp - 0x10], %g4
	.word	0xe428a002	! t0_kref+0x3fec:   	stb	%l2, [%g2 + 2]
	.word	0x9fc0001c	! t0_kref+0x3ff0:   	call	%g0 + %i4
	.word	0xe920a010	! t0_kref+0x3ff4:   	st	%f20, [%g2 + 0x10]
	.word	0x37480003	! t0_kref+0x3ff8:   	fbge,a,pt	%fcc0, _kref+0x4004
	.word	0xd620a030	! t0_kref+0x3ffc:   	st	%o3, [%g2 + 0x30]
	.word	0x9ba608ac	! t0_kref+0x4000:   	fsubs	%f24, %f12, %f13
	.word	0xb1a01028	! t0_kref+0x4004:   	fstox	%f8, %f24
	.word	0xe2de101d	! t0_kref+0x4008:   	ldxa	[%i0 + %i5]0x80, %l1
	.word	0xa2c6b6ef	! t0_kref+0x400c:   	addccc	%i2, -0x911, %l1
	.word	0xb9b5c97d	! t0_kref+0x4010:   	fpmerge	%f23, %f29, %f28
	.word	0xe24e0000	! t0_kref+0x4014:   	ldsb	[%i0], %l1
	.word	0xa25eff40	! t0_kref+0x4018:   	smul	%i3, -0xc0, %l1
	.word	0xffee501c	! t0_kref+0x401c:   	prefetcha	%i1 + %i4, 31
	.word	0xa3400000	! t0_kref+0x4020:   	mov	%y, %l1
	.word	0xa3b5840e	! t0_kref+0x4024:   	fcmple16	%f22, %f14, %l1
	.word	0xb6103fe4	! t0_kref+0x4028:   	mov	0xffffffe4, %i3
	.word	0xa282400c	! t0_kref+0x402c:   	addcc	%o1, %o4, %l1
	.word	0xef20a020	! t0_kref+0x4030:   	st	%f23, [%g2 + 0x20]
	.word	0x99a000ce	! t0_kref+0x4034:   	fnegd	%f14, %f12
	.word	0x2336d716	! t0_kref+0x4038:   	sethi	%hi(0xdb5c5800), %l1
	.word	0x9bb1cabb	! t0_kref+0x403c:   	fpsub16s	%f7, %f27, %f13
	.word	0x37800002	! t0_kref+0x4040:   	fbge,a	_kref+0x4048
	.word	0x95b20f8a	! t0_kref+0x4044:   	for	%f8, %f10, %f10
	.word	0x81ac8a4e	! t0_kref+0x4048:   	fcmpd	%fcc0, %f18, %f14
	.word	0x81ab0a54	! t0_kref+0x404c:   	fcmpd	%fcc0, %f12, %f20
	.word	0xe2460000	! t0_kref+0x4050:   	ldsw	[%i0], %l1
	.word	0xe20e3ffe	! t0_kref+0x4054:   	ldub	[%i0 - 2], %l1
	.word	0xe200a020	! t0_kref+0x4058:   	ld	[%g2 + 0x20], %l1
	.word	0xa335400b	! t0_kref+0x405c:   	srl	%l5, %o3, %l1
	.word	0x81dce764	! t0_kref+0x4060:   	flush	%l3 + 0x764
	.word	0xa9a6895c	! t0_kref+0x4064:   	fmuld	%f26, %f28, %f20
	.word	0xa2024000	! t0_kref+0x4068:   	add	%o1, %g0, %l1
	.word	0xa3340017	! t0_kref+0x406c:   	srl	%l0, %l7, %l1
	.word	0xa21db75c	! t0_kref+0x4070:   	xor	%l6, -0x8a4, %l1
	.word	0xa28c7fe8	! t0_kref+0x4074:   	andcc	%l1, -0x18, %l1
	.word	0xa3b300fb	! t0_kref+0x4078:   	edge16ln	%o4, %i3, %l1
	.word	0xa27b4008	! t0_kref+0x407c:   	sdiv	%o5, %o0, %l1
	.word	0xa214291a	! t0_kref+0x4080:   	or	%l0, 0x91a, %l1
	.word	0xa9a30d2c	! t0_kref+0x4084:   	fsmuld	%f12, %f12, %f20
	.word	0xa292801a	! t0_kref+0x4088:   	orcc	%o2, %i2, %l1
	.word	0xa2dd8015	! t0_kref+0x408c:   	smulcc	%l6, %l5, %l1
	.word	0x39480001	! t0_kref+0x4090:   	fbuge,a,pt	%fcc0, _kref+0x4094
	.word	0xa25ca75a	! t0_kref+0x4094:   	smul	%l2, 0x75a, %l1
	.word	0xa233216d	! t0_kref+0x4098:   	orn	%o4, 0x16d, %l1
	.word	0x81ac0ab8	! t0_kref+0x409c:   	fcmpes	%fcc0, %f16, %f24
	.word	0xa21d4000	! t0_kref+0x40a0:   	xor	%l5, %g0, %l1
	.word	0x2b480002	! t0_kref+0x40a4:   	fbug,a,pt	%fcc0, _kref+0x40ac
	.word	0xa5a00027	! t0_kref+0x40a8:   	fmovs	%f7, %f18
	.word	0xa9b68eca	! t0_kref+0x40ac:   	fornot2	%f26, %f10, %f20
	.word	0x30800005	! t0_kref+0x40b0:   	ba,a	_kref+0x40c4
	.word	0xa33a601b	! t0_kref+0x40b4:   	sra	%o1, 0x1b, %l1
	.word	0xaba6c8ab	! t0_kref+0x40b8:   	fsubs	%f27, %f11, %f21
	.word	0x29480006	! t0_kref+0x40bc:   	fbl,a,pt	%fcc0, _kref+0x40d4
	.word	0xe24e4000	! t0_kref+0x40c0:   	ldsb	[%i1], %l1
	.word	0x28800007	! t0_kref+0x40c4:   	bleu,a	_kref+0x40e0
	.word	0xe41e001d	! t0_kref+0x40c8:   	ldd	[%i0 + %i5], %l2
	.word	0xa28d000a	! t0_kref+0x40cc:   	andcc	%l4, %o2, %l1
	.word	0xa31ec01b	! t0_kref+0x40d0:   	tsubcctv	%i3, %i3, %l1
	.word	0xa361a39a	! t0_kref+0x40d4:   	movg	%fcc0, 0x39a, %l1
	.word	0xa2948015	! t0_kref+0x40d8:   	orcc	%l2, %l5, %l1
	.word	0xa24574d0	! t0_kref+0x40dc:   	addc	%l5, -0xb30, %l1
	.word	0xadb58db3	! t0_kref+0x40e0:   	fxors	%f22, %f19, %f22
	.word	0xa332e000	! t0_kref+0x40e4:   	srl	%o3, 0x0, %l1
	.word	0xd91fbcd0	! t0_kref+0x40e8:   	ldd	[%fp - 0x330], %f12
	.word	0xf520a000	! t0_kref+0x40ec:   	st	%f26, [%g2]
	.word	0xe2480019	! t0_kref+0x40f0:   	ldsb	[%g0 + %i1], %l1
	.word	0xafa348ae	! t0_kref+0x40f4:   	fsubs	%f13, %f14, %f23
	.word	0xa7b00776	! t0_kref+0x40f8:   	fpack16	%f22, %f19
	.word	0xa2368017	! t0_kref+0x40fc:   	orn	%i2, %l7, %l1
	sethi	%hi(1f), %o7
	jmpl	%o7+%lo(1f), %g1
	.empty
	.word	0x91a2c92b	! t0_kref+0x4108:   	fmuls	%f11, %f11, %f8
	.word	0xf920a030	! t0_kref+0x410c:   	st	%f28, [%g2 + 0x30]
	.word	0x99b3099c	! t0_kref+0x4110:   	bshuffle	%f12, %f28, %f12
	.word	0xd6280018	! t0_kref+0x4114:   	stb	%o3, [%g0 + %i0]
	.word	0xd428a03b	! t0_kref+0x4118:   	stb	%o2, [%g2 + 0x3b]
	.word	0xa9a01a38	! t0_kref+0x411c:   	fstoi	%f24, %f20
1:	.word	0xe66e4000	! t0_kref+0x4120:   	ldstub	[%i1], %l3
	.word	0xa5a648bd	! t0_kref+0x4124:   	fsubs	%f25, %f29, %f18
	.word	0x81ac8a4e	! t0_kref+0x4128:   	fcmpd	%fcc0, %f18, %f14
	.word	0xe8ff1019	! t0_kref+0x412c:   	swapa	[%i4 + %i1]0x80, %l4
	.word	0xb1a018c6	! t0_kref+0x4130:   	fdtos	%f6, %f24
	.word	0x8143c000	! t0_kref+0x4134:   	stbar
	.word	0xa286ab8f	! t0_kref+0x4138:   	addcc	%i2, 0xb8f, %l1
	.word	0xa20a6268	! t0_kref+0x413c:   	and	%o1, 0x268, %l1
	.word	0xe86e8018	! t0_kref+0x4140:   	ldstub	[%i2 + %i0], %l4
	.word	0x26480005	! t0_kref+0x4144:   	bl,a,pt	%icc, _kref+0x4158
	.word	0xe230a030	! t0_kref+0x4148:   	sth	%l1, [%g2 + 0x30]
	.word	0xe286501c	! t0_kref+0x414c:   	lda	[%i1 + %i4]0x80, %l1
	.word	0xf1ee101b	! t0_kref+0x4150:   	prefetcha	%i0 + %i3, 24
	.word	0xa3a508bd	! t0_kref+0x4154:   	fsubs	%f20, %f29, %f17
	.word	0xb7a000b5	! t0_kref+0x4158:   	fnegs	%f21, %f27
	.word	0xa2bb4008	! t0_kref+0x415c:   	xnorcc	%o5, %o0, %l1
	.word	0xa3247094	! t0_kref+0x4160:   	mulscc	%l1, -0xf6c, %l1
	.word	0xebee501a	! t0_kref+0x4164:   	prefetcha	%i1 + %i2, 21
	.word	0xa3b4811a	! t0_kref+0x4168:   	edge32	%l2, %i2, %l1
	.word	0xdf200018	! t0_kref+0x416c:   	st	%f15, [%g0 + %i0]
	.word	0xd030a028	! t0_kref+0x4170:   	sth	%o0, [%g2 + 0x28]
	.word	0x81abcaa7	! t0_kref+0x4174:   	fcmpes	%fcc0, %f15, %f7
	.word	0xd628a031	! t0_kref+0x4178:   	stb	%o3, [%g2 + 0x31]
	.word	0xe4180019	! t0_kref+0x417c:   	ldd	[%g0 + %i1], %l2
	.word	0xd220a020	! t0_kref+0x4180:   	st	%o1, [%g2 + 0x20]
	call	SYM(t0_subr2)
	.word	0xb9a508ab	! t0_kref+0x4188:   	fsubs	%f20, %f11, %f28
	.word	0xa2d337d9	! t0_kref+0x418c:   	umulcc	%o4, -0x827, %l1
	.word	0xa25cc000	! t0_kref+0x4190:   	smul	%l3, %g0, %l1
	.word	0xa2730009	! t0_kref+0x4194:   	udiv	%o4, %o1, %l1
	.word	0x91b44a26	! t0_kref+0x4198:   	fpadd16s	%f17, %f6, %f8
	.word	0xf4b6501b	! t0_kref+0x419c:   	stha	%i2, [%i1 + %i3]0x80
	.word	0xf51fbf98	! t0_kref+0x41a0:   	ldd	[%fp - 0x68], %f26
	.word	0xa292001b	! t0_kref+0x41a4:   	orcc	%o0, %i3, %l1
	.word	0xa2a5f696	! t0_kref+0x41a8:   	subcc	%l7, -0x96a, %l1
	.word	0x3a800006	! t0_kref+0x41ac:   	bcc,a	_kref+0x41c4
	.word	0x95a0193c	! t0_kref+0x41b0:   	fstod	%f28, %f10
	.word	0xf11fbda0	! t0_kref+0x41b4:   	ldd	[%fp - 0x260], %f24
	.word	0xe2567ff8	! t0_kref+0x41b8:   	ldsh	[%i1 - 8], %l1
	.word	0x21800003	! t0_kref+0x41bc:   	fbn,a	_kref+0x41c8
	.word	0x8143c000	! t0_kref+0x41c0:   	stbar
	.word	0x99a0054a	! t0_kref+0x41c4:   	fsqrtd	%f10, %f12
	call	SYM(t0_subr0)
	.word	0x8fb1cef4	! t0_kref+0x41cc:   	fornot2s	%f7, %f20, %f7
	.word	0x9fc10000	! t0_kref+0x41d0:   	call	%g4
	.word	0xea363fec	! t0_kref+0x41d4:   	sth	%l5, [%i0 - 0x14]
	.word	0x3f480004	! t0_kref+0x41d8:   	fbo,a,pt	%fcc0, _kref+0x41e8
	.word	0xa5b48f86	! t0_kref+0x41dc:   	for	%f18, %f6, %f18
	.word	0xb5b6cdbc	! t0_kref+0x41e0:   	fxors	%f27, %f28, %f26
	.word	0xec20a000	! t0_kref+0x41e4:   	st	%l6, [%g2]
	.word	0xa3b24074	! t0_kref+0x41e8:   	edge8ln	%o1, %l4, %l1
	.word	0x91a489da	! t0_kref+0x41ec:   	fdivd	%f18, %f26, %f8
	.word	0x97a0003a	! t0_kref+0x41f0:   	fmovs	%f26, %f11
	.word	0xe5262010	! t0_kref+0x41f4:   	st	%f18, [%i0 + 0x10]
	.word	0xa3328010	! t0_kref+0x41f8:   	srl	%o2, %l0, %l1
	.word	0x99b009ae	! t0_kref+0x41fc:   	fexpand	%f14, %f12
	.word	0xb5a018d4	! t0_kref+0x4200:   	fdtos	%f20, %f26
	.word	0x8da28954	! t0_kref+0x4204:   	fmuld	%f10, %f20, %f6
	.word	0x8da188bb	! t0_kref+0x4208:   	fsubs	%f6, %f27, %f6
	.word	0xa5a0191a	! t0_kref+0x420c:   	fitod	%f26, %f18
	.word	0xa28ec01b	! t0_kref+0x4210:   	andcc	%i3, %i3, %l1
	.word	0x8143c000	! t0_kref+0x4214:   	stbar
	.word	0x9da0003c	! t0_kref+0x4218:   	fmovs	%f28, %f14
	.word	0x8143c000	! t0_kref+0x421c:   	stbar
	.word	0xe286501c	! t0_kref+0x4220:   	lda	[%i1 + %i4]0x80, %l1
	.word	0xea30a018	! t0_kref+0x4224:   	sth	%l5, [%g2 + 0x18]
	.word	0xa2bd0014	! t0_kref+0x4228:   	xnorcc	%l4, %l4, %l1
	.word	0x9db34aaa	! t0_kref+0x422c:   	fpsub16s	%f13, %f10, %f14
	.word	0x8182c000	! t0_kref+0x4230:   	wr	%o3, %g0, %y
	.word	0xb1a6895a	! t0_kref+0x4234:   	fmuld	%f26, %f26, %f24
	.word	0xd720a020	! t0_kref+0x4238:   	st	%f11, [%g2 + 0x20]
	.word	0xa32c200a	! t0_kref+0x423c:   	sll	%l0, 0xa, %l1
	.word	0xafa548ab	! t0_kref+0x4240:   	fsubs	%f21, %f11, %f23
	.word	0xa3b5c332	! t0_kref+0x4244:   	bmask	%l7, %l2, %l1
	.word	0xafa0109a	! t0_kref+0x4248:   	fxtos	%f26, %f23
	.word	0xaba0002a	! t0_kref+0x424c:   	fmovs	%f10, %f21
	.word	0x9e006150	! t0_kref+0x4250:   	add	%g1, 0x150, %o7
!	.word	0x314d2769	! t0_kref+0x4254:   	fba,a,pt	%fcc0, SYM(t0_subr1)
	   	fba,a,pt	%fcc0, SYM(t0_subr1)
	.word	0xe82e6001	! t0_kref+0x4258:   	stb	%l4, [%i1 + 1]
	.word	0x3c800008	! t0_kref+0x425c:   	bpos,a	_kref+0x427c
	.word	0x81b01022	! t0_kref+0x4260:   	siam	0x2
	.word	0xa2f36282	! t0_kref+0x4264:   	udivcc	%o5, 0x282, %l1
	.word	0xa9a408d2	! t0_kref+0x4268:   	fsubd	%f16, %f18, %f20
	.word	0xe20e6015	! t0_kref+0x426c:   	ldub	[%i1 + 0x15], %l1
	.word	0xe2c65000	! t0_kref+0x4270:   	ldswa	[%i1]0x80, %l1
	.word	0xa3a01a27	! t0_kref+0x4274:   	fstoi	%f7, %f17
	.word	0xa2daa3e7	! t0_kref+0x4278:   	smulcc	%o2, 0x3e7, %l1
	.word	0x8143c000	! t0_kref+0x427c:   	stbar
	.word	0xbba00034	! t0_kref+0x4280:   	fmovs	%f20, %f29
	.word	0x001fffff	! t0_kref+0x4284:   	illtrap	0x1fffff
	.word	0xa234b4cd	! t0_kref+0x4288:   	orn	%l2, -0xb33, %l1
	.word	0xa22d7673	! t0_kref+0x428c:   	andn	%l5, -0x98d, %l1
	.word	0xe208a002	! t0_kref+0x4290:   	ldub	[%g2 + 2], %l1
	.word	0x95b406b9	! t0_kref+0x4294:   	fmul8x16al	%f16, %f25, %f10
	.word	0x99b40a58	! t0_kref+0x4298:   	fpadd32	%f16, %f24, %f12
	.word	0xa9b34a3c	! t0_kref+0x429c:   	fpadd16s	%f13, %f28, %f20
	.word	0x8da689d0	! t0_kref+0x42a0:   	fdivd	%f26, %f16, %f6
	.word	0xafa8802f	! t0_kref+0x42a4:   	fmovslg	%fcc0, %f15, %f23
	.word	0xe25f4018	! t0_kref+0x42a8:   	ldx	[%i5 + %i0], %l1
	.word	0xa244ae29	! t0_kref+0x42ac:   	addc	%l2, 0xe29, %l1
	.word	0xe900a000	! t0_kref+0x42b0:   	ld	[%g2], %f20
	.word	0xa2b54009	! t0_kref+0x42b4:   	orncc	%l5, %o1, %l1
	.word	0xa22aa250	! t0_kref+0x42b8:   	andn	%o2, 0x250, %l1
	.word	0xe2d81019	! t0_kref+0x42bc:   	ldxa	[%g0 + %i1]0x80, %l1
	.word	0x91b58d0c	! t0_kref+0x42c0:   	fandnot1	%f22, %f12, %f8
	.word	0xa3400000	! t0_kref+0x42c4:   	mov	%y, %l1
	.word	0xada01a33	! t0_kref+0x42c8:   	fstoi	%f19, %f22
	.word	0xa344c000	! t0_kref+0x42cc:   	mov	%gsr, %l1
	.word	0xb9b00fc0	! t0_kref+0x42d0:   	fone	%f28
	.word	0xa5a0054e	! t0_kref+0x42d4:   	fsqrtd	%f14, %f18
	.word	0xe2064000	! t0_kref+0x42d8:   	ld	[%i1], %l1
	.word	0xa2740010	! t0_kref+0x42dc:   	udiv	%l0, %l0, %l1
	call	1f
	.empty
	.word	0xe320a008	! t0_kref+0x42e4:   	st	%f17, [%g2 + 8]
	.word	0xa2ac4014	! t0_kref+0x42e8:   	andncc	%l1, %l4, %l1
	.word	0xa245800c	! t0_kref+0x42ec:   	addc	%l6, %o4, %l1
	.word	0x2a800005	! t0_kref+0x42f0:   	bcs,a	_kref+0x4304
1:	.word	0xb1a0108c	! t0_kref+0x42f4:   	fxtos	%f12, %f24
	.word	0xa2f026d1	! t0_kref+0x42f8:   	udivcc	%g0, 0x6d1, %l1
	.word	0xa1b28ecc	! t0_kref+0x42fc:   	fornot2	%f10, %f12, %f16
	.word	0xa3330008	! t0_kref+0x4300:   	srl	%o4, %o0, %l1
	.word	0x36480002	! t0_kref+0x4304:   	bge,a,pt	%icc, _kref+0x430c
	.word	0xa230001a	! t0_kref+0x4308:   	orn	%g0, %i2, %l1
	.word	0xd626601c	! t0_kref+0x430c:   	st	%o3, [%i1 + 0x1c]
	.word	0xadb3074e	! t0_kref+0x4310:   	fpack32	%f12, %f14, %f22
	.word	0xe228a030	! t0_kref+0x4314:   	stb	%l1, [%g2 + 0x30]
	.word	0xe81e3fe8	! t0_kref+0x4318:   	ldd	[%i0 - 0x18], %l4
	.word	0xf4774019	! t0_kref+0x431c:   	stx	%i2, [%i5 + %i1]
	.word	0xa2b82af7	! t0_kref+0x4320:   	xnorcc	%g0, 0xaf7, %l1
	.word	0xb3a288ba	! t0_kref+0x4324:   	fsubs	%f10, %f26, %f25
	.word	0xa1a00550	! t0_kref+0x4328:   	fsqrtd	%f16, %f16
	.word	0xa3120012	! t0_kref+0x432c:   	taddcctv	%o0, %l2, %l1
	.word	0x001fffff	! t0_kref+0x4330:   	illtrap	0x1fffff
	.word	0x8185c000	! t0_kref+0x4334:   	wr	%l7, %g0, %y
	.word	0xd91fbe50	! t0_kref+0x4338:   	ldd	[%fp - 0x1b0], %f12
	.word	0xa5b2cefc	! t0_kref+0x433c:   	fornot2s	%f11, %f28, %f18
	.word	0xf51fbe68	! t0_kref+0x4340:   	ldd	[%fp - 0x198], %f26
	.word	0x2a800006	! t0_kref+0x4344:   	bcs,a	_kref+0x435c
	.word	0x8143c000	! t0_kref+0x4348:   	stbar
	.word	0xea20a000	! t0_kref+0x434c:   	st	%l5, [%g2]
	.word	0xa3b40418	! t0_kref+0x4350:   	fcmple16	%f16, %f24, %l1
	.word	0xa235c009	! t0_kref+0x4354:   	orn	%l7, %o1, %l1
	.word	0x2308ee07	! t0_kref+0x4358:   	sethi	%hi(0x23b81c00), %l1
	.word	0x91a18939	! t0_kref+0x435c:   	fmuls	%f6, %f25, %f8
	call	SYM(t0_subr1)
	.word	0xa2a2001a	! t0_kref+0x4364:   	subcc	%o0, %i2, %l1
	.word	0xe208a030	! t0_kref+0x4368:   	ldub	[%g2 + 0x30], %l1
	.word	0xa5a00150	! t0_kref+0x436c:   	fabsd	%f16, %f18
	.word	0xafb0076c	! t0_kref+0x4370:   	fpack16	%f12, %f23
	call	SYM(t0_subr0)
	.word	0xa32de00a	! t0_kref+0x4378:   	sll	%l7, 0xa, %l1
	.word	0xa1a0054a	! t0_kref+0x437c:   	fsqrtd	%f10, %f16
	.word	0xb5a00548	! t0_kref+0x4380:   	fsqrtd	%f8, %f26
	.word	0xe2500019	! t0_kref+0x4384:   	ldsh	[%g0 + %i1], %l1
	.word	0xa2132cdc	! t0_kref+0x4388:   	or	%o4, 0xcdc, %l1
	.word	0xe246600c	! t0_kref+0x438c:   	ldsw	[%i1 + 0xc], %l1
	.word	0xa2023d02	! t0_kref+0x4390:   	add	%o0, -0x2fe, %l1
	.word	0x8143c000	! t0_kref+0x4394:   	stbar
	sethi	%hi(2f), %o7
	.word	0xe40be3bc	! t0_kref+0x439c:   	ldub	[%o7 + 0x3bc], %l2
	.word	0xa41ca00c	! t0_kref+0x43a0:   	xor	%l2, 0xc, %l2
	.word	0xe42be3bc	! t0_kref+0x43a4:   	stb	%l2, [%o7 + 0x3bc]
	.word	0x81dbe3bc	! t0_kref+0x43a8:   	flush	%o7 + 0x3bc
	.word	0x95b38a58	! t0_kref+0x43ac:   	fpadd32	%f14, %f24, %f10
	.word	0xc0262010	! t0_kref+0x43b0:   	clr	[%i0 + 0x10]
	.word	0x2a800004	! t0_kref+0x43b4:   	bcs,a	_kref+0x43c4
	.word	0xa33e8016	! t0_kref+0x43b8:   	sra	%i2, %l6, %l1
2:	.word	0xe0680019	! t0_kref+0x43bc:   	ldstub	[%g0 + %i1], %l0
	.word	0xa5a4094c	! t0_kref+0x43c0:   	fmuld	%f16, %f12, %f18
	.word	0xc0280018	! t0_kref+0x43c4:   	clrb	[%g0 + %i0]
	.word	0x32800003	! t0_kref+0x43c8:   	bne,a	_kref+0x43d4
	.word	0xf436001b	! t0_kref+0x43cc:   	sth	%i2, [%i0 + %i3]
	.word	0x81ac8a4e	! t0_kref+0x43d0:   	fcmpd	%fcc0, %f18, %f14
	.word	0xe41e4000	! t0_kref+0x43d4:   	ldd	[%i1], %l2
	.word	0xa5a188d8	! t0_kref+0x43d8:   	fsubd	%f6, %f24, %f18
	.word	0xe296d018	! t0_kref+0x43dc:   	lduha	[%i3 + %i0]0x80, %l1
	.word	0x8182c000	! t0_kref+0x43e0:   	wr	%o3, %g0, %y
	.word	0x3e800003	! t0_kref+0x43e4:   	bvc,a	_kref+0x43f0
	.word	0x91a00554	! t0_kref+0x43e8:   	fsqrtd	%f20, %f8
	.word	0x81ac8ad8	! t0_kref+0x43ec:   	fcmped	%fcc0, %f18, %f24
	.word	0xb9a408da	! t0_kref+0x43f0:   	fsubd	%f16, %f26, %f28
	.word	0xe2462004	! t0_kref+0x43f4:   	ldsw	[%i0 + 4], %l1
	.word	0xf720a008	! t0_kref+0x43f8:   	st	%f27, [%g2 + 8]
	.word	0xa29d0000	! t0_kref+0x43fc:   	xorcc	%l4, %g0, %l1
	.word	0xebee101a	! t0_kref+0x4400:   	prefetcha	%i0 + %i2, 21
	.word	0xa3b500da	! t0_kref+0x4404:   	edge16l	%l4, %i2, %l1
	.word	0xe2067fe8	! t0_kref+0x4408:   	ld	[%i1 - 0x18], %l1
	.word	0xb9b00c00	! t0_kref+0x440c:   	fzero	%f28
	.word	0xe8180019	! t0_kref+0x4410:   	ldd	[%g0 + %i1], %l4
	.word	0xe250a038	! t0_kref+0x4414:   	ldsh	[%g2 + 0x38], %l1
	.word	0xe2871018	! t0_kref+0x4418:   	lda	[%i4 + %i0]0x80, %l1
	.word	0xf1263ffc	! t0_kref+0x441c:   	st	%f24, [%i0 - 4]
	.word	0xa3b5805b	! t0_kref+0x4420:   	edge8l	%l6, %i3, %l1
	.word	0xcd20a010	! t0_kref+0x4424:   	st	%f6, [%g2 + 0x10]
	.word	0xadb70d88	! t0_kref+0x4428:   	fxor	%f28, %f8, %f22
	.word	0xc43f4000	! t0_kref+0x442c:   	std	%g2, [%i5]
	.word	0xa3322011	! t0_kref+0x4430:   	srl	%o0, 0x11, %l1
	.word	0xa28a7335	! t0_kref+0x4434:   	andcc	%o1, -0xccb, %l1
	.word	0xe81e001d	! t0_kref+0x4438:   	ldd	[%i0 + %i5], %l4
	.word	0x9da00552	! t0_kref+0x443c:   	fsqrtd	%f18, %f14
	.word	0xd26e8018	! t0_kref+0x4440:   	ldstub	[%i2 + %i0], %o1
	.word	0xe4262010	! t0_kref+0x4444:   	st	%l2, [%i0 + 0x10]
	.word	0xa325401b	! t0_kref+0x4448:   	mulscc	%l5, %i3, %l1
	.word	0xa3400000	! t0_kref+0x444c:   	mov	%y, %l1
	.word	0x95a00054	! t0_kref+0x4450:   	fmovd	%f20, %f10
	.word	0xe240a020	! t0_kref+0x4454:   	ldsw	[%g2 + 0x20], %l1
	.word	0xa3b305d2	! t0_kref+0x4458:   	fcmpeq32	%f12, %f18, %l1
	.word	0xb3a018c8	! t0_kref+0x445c:   	fdtos	%f8, %f25
	.word	0xa245c000	! t0_kref+0x4460:   	addc	%l7, %g0, %l1
	.word	0xb5b00fc0	! t0_kref+0x4464:   	fone	%f26
	.word	0x8143c000	! t0_kref+0x4468:   	stbar
	.word	0x83414000	! t0_kref+0x446c:   	mov	%pc, %g1
	.word	0xa246801b	! t0_kref+0x4470:   	addc	%i2, %i3, %l1
	.word	0xb3a018d6	! t0_kref+0x4474:   	fdtos	%f22, %f25
	.word	0x3d480002	! t0_kref+0x4478:   	fbule,a,pt	%fcc0, _kref+0x4480
	.word	0xe2563fe2	! t0_kref+0x447c:   	ldsh	[%i0 - 0x1e], %l1
	.word	0x99b60f50	! t0_kref+0x4480:   	fornot1	%f24, %f16, %f12
	.word	0x81b01023	! t0_kref+0x4484:   	siam	0x3
	.word	0xa22d7b4e	! t0_kref+0x4488:   	andn	%l5, -0x4b2, %l1
	.word	0xa2daaa13	! t0_kref+0x448c:   	smulcc	%o2, 0xa13, %l1
	.word	0xa33d4009	! t0_kref+0x4490:   	sra	%l5, %o1, %l1
	.word	0xa3608014	! t0_kref+0x4494:   	movlg	%fcc0, %l4, %l1
	.word	0xa29cc00b	! t0_kref+0x4498:   	xorcc	%l3, %o3, %l1
	.word	0xd7263fe4	! t0_kref+0x449c:   	st	%f11, [%i0 - 0x1c]
	.word	0x8610200e	! t0_kref+0x44a0:   	mov	0xe, %g3
	.word	0x86a0e001	! t0_kref+0x44a4:   	subcc	%g3, 1, %g3
	.word	0x22800003	! t0_kref+0x44a8:   	be,a	_kref+0x44b4
	.word	0x9bb00c20	! t0_kref+0x44ac:   	fzeros	%f13
	.word	0xda28a009	! t0_kref+0x44b0:   	stb	%o5, [%g2 + 9]
	.word	0xa2827a20	! t0_kref+0x44b4:   	addcc	%o1, -0x5e0, %l1
	.word	0x25480006	! t0_kref+0x44b8:   	fblg,a,pt	%fcc0, _kref+0x44d0
	.word	0xa9b20a3d	! t0_kref+0x44bc:   	fpadd16s	%f8, %f29, %f20
	.word	0xed1fbf28	! t0_kref+0x44c0:   	ldd	[%fp - 0xd8], %f22
	.word	0xa5b58f92	! t0_kref+0x44c4:   	for	%f22, %f18, %f18
	.word	0xa1a018c8	! t0_kref+0x44c8:   	fdtos	%f8, %f16
	.word	0x9fc00004	! t0_kref+0x44cc:   	call	%g0 + %g4
	.word	0xe3b8a040	! t0_kref+0x44d0:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x9fc00004	! t0_kref+0x44d4:   	call	%g0 + %g4
	.word	0xa29d4012	! t0_kref+0x44d8:   	xorcc	%l5, %l2, %l1
	.word	0x81ab8a50	! t0_kref+0x44dc:   	fcmpd	%fcc0, %f14, %f16
	.word	0xf007bfe0	! t0_kref+0x44e0:   	ld	[%fp - 0x20], %i0
	.word	0xd830a03a	! t0_kref+0x44e4:   	sth	%o4, [%g2 + 0x3a]
	.word	0xa9a689d4	! t0_kref+0x44e8:   	fdivd	%f26, %f20, %f20
	.word	0x3f800005	! t0_kref+0x44ec:   	fbo,a	_kref+0x4500
	.word	0x81de7577	! t0_kref+0x44f0:   	flush	%i1 - 0xa89
	.word	0x81834000	! t0_kref+0x44f4:   	wr	%o5, %g0, %y
	.word	0xa204001a	! t0_kref+0x44f8:   	add	%l0, %i2, %l1
	.word	0x99b38ed8	! t0_kref+0x44fc:   	fornot2	%f14, %f24, %f12
	.word	0xa3358008	! t0_kref+0x4500:   	srl	%l6, %o0, %l1
	.word	0xa322a602	! t0_kref+0x4504:   	mulscc	%o2, 0x602, %l1
	.word	0x9da509d4	! t0_kref+0x4508:   	fdivd	%f20, %f20, %f14
	.word	0xe1be1852	! t0_kref+0x450c:   	stda	%f16, [%i0 + %l2]0xc2
	.word	0xb9a01893	! t0_kref+0x4510:   	fitos	%f19, %f28
	.word	0x26480002	! t0_kref+0x4514:   	bl,a,pt	%icc, _kref+0x451c
	.word	0xdbe6100b	! t0_kref+0x4518:   	casa	[%i0]0x80, %o3, %o5
	.word	0xd91fbf20	! t0_kref+0x451c:   	ldd	[%fp - 0xe0], %f12
	.word	0xe53e2010	! t0_kref+0x4520:   	std	%f18, [%i0 + 0x10]
	.word	0xe2100018	! t0_kref+0x4524:   	lduh	[%g0 + %i0], %l1
	.word	0xb9a01936	! t0_kref+0x4528:   	fstod	%f22, %f28
	.word	0xb1b48ddc	! t0_kref+0x452c:   	fnand	%f18, %f28, %f24
	.word	0x8da6094a	! t0_kref+0x4530:   	fmuld	%f24, %f10, %f6
	.word	0xb1a01917	! t0_kref+0x4534:   	fitod	%f23, %f24
	.word	0xa5a388d6	! t0_kref+0x4538:   	fsubd	%f14, %f22, %f18
	.word	0xec20a020	! t0_kref+0x453c:   	st	%l6, [%g2 + 0x20]
	.word	0xcd20a038	! t0_kref+0x4540:   	st	%f6, [%g2 + 0x38]
	.word	0x8da188bb	! t0_kref+0x4544:   	fsubs	%f6, %f27, %f6
	.word	0x8fb70ab8	! t0_kref+0x4548:   	fpsub16s	%f28, %f24, %f7
	.word	0xf3270019	! t0_kref+0x454c:   	st	%f25, [%i4 + %i1]
	.word	0x8610200c	! t0_kref+0x4550:   	mov	0xc, %g3
	.word	0x86a0e001	! t0_kref+0x4554:   	subcc	%g3, 1, %g3
	.word	0x2280000f	! t0_kref+0x4558:   	be,a	_kref+0x4594
	.word	0xe22e6015	! t0_kref+0x455c:   	stb	%l1, [%i1 + 0x15]
	.word	0xa2e54012	! t0_kref+0x4560:   	subccc	%l5, %l2, %l1
	.word	0xe24e7fe6	! t0_kref+0x4564:   	ldsb	[%i1 - 0x1a], %l1
	.word	0xa3400000	! t0_kref+0x4568:   	mov	%y, %l1
	.word	0xd51fbd58	! t0_kref+0x456c:   	ldd	[%fp - 0x2a8], %f10
	.word	0xa2348008	! t0_kref+0x4570:   	orn	%l2, %o0, %l1
	.word	0xa29aabba	! t0_kref+0x4574:   	xorcc	%o2, 0xbba, %l1
	.word	0xb5b00fc0	! t0_kref+0x4578:   	fone	%f26
	.word	0xa32b6019	! t0_kref+0x457c:   	sll	%o5, 0x19, %l1
	.word	0x32bffff5	! t0_kref+0x4580:   	bne,a	_kref+0x4554
	.word	0xcf200019	! t0_kref+0x4584:   	st	%f7, [%g0 + %i1]
	.word	0xc030a000	! t0_kref+0x4588:   	clrh	[%g2]
	.word	0x99a01112	! t0_kref+0x458c:   	fxtod	%f18, %f12
	.word	0xa24578d0	! t0_kref+0x4590:   	addc	%l5, -0x730, %l1
	.word	0xa2d6b961	! t0_kref+0x4594:   	umulcc	%i2, -0x69f, %l1
	.word	0x22480005	! t0_kref+0x4598:   	be,a,pt	%icc, _kref+0x45ac
	.word	0xf326401c	! t0_kref+0x459c:   	st	%f25, [%i1 + %i4]
	.word	0xa3418000	! t0_kref+0x45a0:   	mov	%fprs, %l1
	.word	0x95b00fe0	! t0_kref+0x45a4:   	fones	%f10
	.word	0xdb20a010	! t0_kref+0x45a8:   	st	%f13, [%g2 + 0x10]
	.word	0xa23030d6	! t0_kref+0x45ac:   	orn	%g0, -0xf2a, %l1
	.word	0x9fc00004	! t0_kref+0x45b0:   	call	%g0 + %g4
	.word	0xa202727f	! t0_kref+0x45b4:   	add	%o1, -0xd81, %l1
	.word	0xa25dc016	! t0_kref+0x45b8:   	smul	%l7, %l6, %l1
	.word	0xa9a01908	! t0_kref+0x45bc:   	fitod	%f8, %f20
	.word	0x99b48a2a	! t0_kref+0x45c0:   	fpadd16s	%f18, %f10, %f12
	.word	0x81d96953	! t0_kref+0x45c4:   	flush	%g5 + 0x953
	.word	0xa244c009	! t0_kref+0x45c8:   	addc	%l3, %o1, %l1
	.word	0xda30a038	! t0_kref+0x45cc:   	sth	%o5, [%g2 + 0x38]
	.word	0x95a288ab	! t0_kref+0x45d0:   	fsubs	%f10, %f11, %f10
	.word	0x81ae8aca	! t0_kref+0x45d4:   	fcmped	%fcc0, %f26, %f10
	.word	0xa21a801b	! t0_kref+0x45d8:   	xor	%o2, %i3, %l1
	.word	0xa30ca406	! t0_kref+0x45dc:   	tsubcc	%l2, 0x406, %l1
	.word	0xa2c2c00a	! t0_kref+0x45e0:   	addccc	%o3, %o2, %l1
	.word	0xec28a021	! t0_kref+0x45e4:   	stb	%l6, [%g2 + 0x21]
	.word	0x81824000	! t0_kref+0x45e8:   	wr	%o1, %g0, %y
	.word	0xa1b74ea0	! t0_kref+0x45ec:   	fsrc1s	%f29, %f16
	.word	0xa245e572	! t0_kref+0x45f0:   	addc	%l7, 0x572, %l1
	.word	0x95b38f86	! t0_kref+0x45f4:   	for	%f14, %f6, %f10
	.word	0xa2750013	! t0_kref+0x45f8:   	udiv	%l4, %l3, %l1
	.word	0xa204c014	! t0_kref+0x45fc:   	add	%l3, %l4, %l1
	.word	0xa3418000	! t0_kref+0x4600:   	mov	%fprs, %l1
	.word	0xa3b30498	! t0_kref+0x4604:   	fcmple32	%f12, %f24, %l1
	.word	0xa25e8000	! t0_kref+0x4608:   	smul	%i2, %g0, %l1
	.word	0xb1a01930	! t0_kref+0x460c:   	fstod	%f16, %f24
	.word	0xaba00035	! t0_kref+0x4610:   	fmovs	%f21, %f21
	.word	0xe240a038	! t0_kref+0x4614:   	ldsw	[%g2 + 0x38], %l1
	call	SYM(t0_subr1)
	.word	0x99b70a39	! t0_kref+0x461c:   	fpadd16s	%f28, %f25, %f12
	.word	0xa28025a3	! t0_kref+0x4620:   	addcc	%g0, 0x5a3, %l1
	.word	0xe7ee501a	! t0_kref+0x4624:   	prefetcha	%i1 + %i2, 19
	.word	0xe240a018	! t0_kref+0x4628:   	ldsw	[%g2 + 0x18], %l1
	.word	0x3b480001	! t0_kref+0x462c:   	fble,a,pt	%fcc0, _kref+0x4630
	.word	0xe81e7fe8	! t0_kref+0x4630:   	ldd	[%i1 - 0x18], %l4
	.word	0xa2e57ce1	! t0_kref+0x4634:   	subccc	%l5, -0x31f, %l1
	.word	0xc807bfe8	! t0_kref+0x4638:   	ld	[%fp - 0x18], %g4
	.word	0x95a01a2f	! t0_kref+0x463c:   	fstoi	%f15, %f10
	.word	0xe2801019	! t0_kref+0x4640:   	lda	[%g0 + %i1]0x80, %l1
	.word	0xa2ddc013	! t0_kref+0x4644:   	smulcc	%l7, %l3, %l1
	.word	0xa2b3641d	! t0_kref+0x4648:   	orncc	%o5, 0x41d, %l1
	.word	0x86102015	! t0_kref+0x464c:   	mov	0x15, %g3
	.word	0x86a0e001	! t0_kref+0x4650:   	subcc	%g3, 1, %g3
	.word	0x2280001a	! t0_kref+0x4654:   	be,a	_kref+0x46bc
	.word	0x81840000	! t0_kref+0x4658:   	wr	%l0, %g0, %y
	.word	0x9ba00531	! t0_kref+0x465c:   	fsqrts	%f17, %f13
	.word	0xe2162016	! t0_kref+0x4660:   	lduh	[%i0 + 0x16], %l1
	.word	0xd220a008	! t0_kref+0x4664:   	st	%o1, [%g2 + 8]
	.word	0xe2d01019	! t0_kref+0x4668:   	ldsha	[%g0 + %i1]0x80, %l1
	.word	0xa3b404d4	! t0_kref+0x466c:   	fcmpne32	%f16, %f20, %l1
	.word	0xe036001b	! t0_kref+0x4670:   	sth	%l0, [%i0 + %i3]
	.word	0xe256c018	! t0_kref+0x4674:   	ldsh	[%i3 + %i0], %l1
	.word	0xa32cc016	! t0_kref+0x4678:   	sll	%l3, %l6, %l1
	.word	0xe3b8a040	! t0_kref+0x467c:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xe2000018	! t0_kref+0x4680:   	ld	[%g0 + %i0], %l1
	.word	0xa2adf3f9	! t0_kref+0x4684:   	andncc	%l7, -0xc07, %l1
	.word	0xe81e6000	! t0_kref+0x4688:   	ldd	[%i1], %l4
	.word	0xb9a018d2	! t0_kref+0x468c:   	fdtos	%f18, %f28
	.word	0xa33c600a	! t0_kref+0x4690:   	sra	%l1, 0xa, %l1
	.word	0xa2040010	! t0_kref+0x4694:   	add	%l0, %l0, %l1
	.word	0xe248a030	! t0_kref+0x4698:   	ldsb	[%g2 + 0x30], %l1
	.word	0xafa548aa	! t0_kref+0x469c:   	fsubs	%f21, %f10, %f23
	.word	0xd6f61000	! t0_kref+0x46a0:   	stxa	%o3, [%i0]0x80
	.word	0xa29b2f0e	! t0_kref+0x46a4:   	xorcc	%o4, 0xf0e, %l1
	.word	0x9db28a0c	! t0_kref+0x46a8:   	fpadd16	%f10, %f12, %f14
	.word	0xa286801b	! t0_kref+0x46ac:   	addcc	%i2, %i3, %l1
	.word	0xecf81019	! t0_kref+0x46b0:   	swapa	[%g0 + %i1]0x80, %l6
	.word	0xe210a032	! t0_kref+0x46b4:   	lduh	[%g2 + 0x32], %l1
	.word	0xa3b2054e	! t0_kref+0x46b8:   	fcmpeq16	%f8, %f14, %l1
	.word	0xa25eb216	! t0_kref+0x46bc:   	smul	%i2, -0xdea, %l1
	.word	0xa3b5c240	! t0_kref+0x46c0:   	array16	%l7, %g0, %l1
	.word	0xe628a011	! t0_kref+0x46c4:   	stb	%l3, [%g2 + 0x11]
	.word	0xada0054a	! t0_kref+0x46c8:   	fsqrtd	%f10, %f22
	.word	0xa33dc011	! t0_kref+0x46cc:   	sra	%l7, %l1, %l1
	.word	0xe91fbce0	! t0_kref+0x46d0:   	ldd	[%fp - 0x320], %f20
	.word	0x9bb64f78	! t0_kref+0x46d4:   	fornot1s	%f25, %f24, %f13
	.word	0xa2353205	! t0_kref+0x46d8:   	orn	%l4, -0xdfb, %l1
	.word	0xa2e334f8	! t0_kref+0x46dc:   	subccc	%o4, -0xb08, %l1
	.word	0xa2b563f2	! t0_kref+0x46e0:   	orncc	%l5, 0x3f2, %l1
	.word	0xc12e001c	! t0_kref+0x46e4:   	st	%fsr, [%i0 + %i4]
	.word	0xe208a018	! t0_kref+0x46e8:   	ldub	[%g2 + 0x18], %l1
	.word	0xe256201c	! t0_kref+0x46ec:   	ldsh	[%i0 + 0x1c], %l1
	.word	0x9da00558	! t0_kref+0x46f0:   	fsqrtd	%f24, %f14
	.word	0xa5b00f0e	! t0_kref+0x46f4:   	fsrc2	%f14, %f18
	.word	0xa2dcf95a	! t0_kref+0x46f8:   	smulcc	%l3, -0x6a6, %l1
	.word	0xc9ee5008	! t0_kref+0x46fc:   	prefetcha	%i1 + %o0, 4
	.word	0x8143c000	! t0_kref+0x4700:   	stbar
	.word	0x20800007	! t0_kref+0x4704:   	bn,a	_kref+0x4720
	.word	0xd9be184d	! t0_kref+0x4708:   	stda	%f12, [%i0 + %o5]0xc2
	.word	0xa2520015	! t0_kref+0x470c:   	umul	%o0, %l5, %l1
	.word	0xf93f4019	! t0_kref+0x4710:   	std	%f28, [%i5 + %i1]
	.word	0xa3b1844e	! t0_kref+0x4714:   	fcmpne16	%f6, %f14, %l1
	.word	0xb5a00552	! t0_kref+0x4718:   	fsqrtd	%f18, %f26
	.word	0xcf260000	! t0_kref+0x471c:   	st	%f7, [%i0]
	.word	0xa2da4015	! t0_kref+0x4720:   	smulcc	%o1, %l5, %l1
	.word	0xa216c009	! t0_kref+0x4724:   	or	%i3, %o1, %l1
	.word	0xa1b00f0c	! t0_kref+0x4728:   	fsrc2	%f12, %f16
	.word	0x81ac8a5c	! t0_kref+0x472c:   	fcmpd	%fcc0, %f18, %f28
	.word	0xe6362016	! t0_kref+0x4730:   	sth	%l3, [%i0 + 0x16]
	.word	0xa7a00130	! t0_kref+0x4734:   	fabss	%f16, %f19
	.word	0xa242000a	! t0_kref+0x4738:   	addc	%o0, %o2, %l1
	.word	0x3f800006	! t0_kref+0x473c:   	fbo,a	_kref+0x4754
	.word	0x93b24ea0	! t0_kref+0x4740:   	fsrc1s	%f9, %f9
	.word	0x23038d0b	! t0_kref+0x4744:   	sethi	%hi(0xe342c00), %l1
	.word	0xa206800d	! t0_kref+0x4748:   	add	%i2, %o5, %l1
	.word	0xf1260000	! t0_kref+0x474c:   	st	%f24, [%i0]
	.word	0xa22d4008	! t0_kref+0x4750:   	andn	%l5, %o0, %l1
	call	SYM(t0_subr1)
	.word	0xe2160000	! t0_kref+0x4758:   	lduh	[%i0], %l1
	.word	0xd2a6501c	! t0_kref+0x475c:   	sta	%o1, [%i1 + %i4]0x80
	.word	0x2a480005	! t0_kref+0x4760:   	bcs,a,pt	%icc, _kref+0x4774
	.word	0x91a709d4	! t0_kref+0x4764:   	fdivd	%f28, %f20, %f8
	.word	0xa2140014	! t0_kref+0x4768:   	or	%l0, %l4, %l1
	.word	0x9fc00004	! t0_kref+0x476c:   	call	%g0 + %g4
	.word	0xa294f302	! t0_kref+0x4770:   	orcc	%l3, -0xcfe, %l1
	.word	0xa25eb46c	! t0_kref+0x4774:   	smul	%i2, -0xb94, %l1
	.word	0x81aa8a4c	! t0_kref+0x4778:   	fcmpd	%fcc0, %f10, %f12
	.word	0xa9a308ce	! t0_kref+0x477c:   	fsubd	%f12, %f14, %f20
	.word	0xe5981019	! t0_kref+0x4780:   	ldda	[%g0 + %i1]0x80, %f18
	.word	0xa5a6894e	! t0_kref+0x4784:   	fmuld	%f26, %f14, %f18
	.word	0x81b01027	! t0_kref+0x4788:   	siam	0x7
	.word	0xa2e58009	! t0_kref+0x478c:   	subccc	%l6, %o1, %l1
	.word	0x9db00f32	! t0_kref+0x4790:   	fsrc2s	%f18, %f14
	.word	0xa33ee010	! t0_kref+0x4794:   	sra	%i3, 0x10, %l1
	.word	0x230dfbae	! t0_kref+0x4798:   	sethi	%hi(0x37eeb800), %l1
	.word	0xa25a74a5	! t0_kref+0x479c:   	smul	%o1, -0xb5b, %l1
	.word	0x8143e040	! t0_kref+0x47a0:   	membar	0x40
	.word	0xa9b40e18	! t0_kref+0x47a4:   	fand	%f16, %f24, %f20
	.word	0x81db6a68	! t0_kref+0x47a8:   	flush	%o5 + 0xa68
	.word	0x81ac8a4a	! t0_kref+0x47ac:   	fcmpd	%fcc0, %f18, %f10
	.word	0x232b0298	! t0_kref+0x47b0:   	sethi	%hi(0xac0a6000), %l1
	.word	0xa3220014	! t0_kref+0x47b4:   	mulscc	%o0, %l4, %l1
	.word	0x9fc00004	! t0_kref+0x47b8:   	call	%g0 + %g4
	.word	0xb5b48726	! t0_kref+0x47bc:   	fmuld8ulx16	%f18, %f6, %f26
	.word	0x2c800008	! t0_kref+0x47c0:   	bneg,a	_kref+0x47e0
	.word	0x8186c000	! t0_kref+0x47c4:   	wr	%i3, %g0, %y
	.word	0xa25b0008	! t0_kref+0x47c8:   	smul	%o4, %o0, %l1
	.word	0xf420a010	! t0_kref+0x47cc:   	st	%i2, [%g2 + 0x10]
	.word	0xb1b28e5a	! t0_kref+0x47d0:   	fxnor	%f10, %f26, %f24
	.word	0xe278a000	! t0_kref+0x47d4:   	swap	[%g2], %l1
	.word	0xa23ae6ae	! t0_kref+0x47d8:   	xnor	%o3, 0x6ae, %l1
	.word	0xe2de501d	! t0_kref+0x47dc:   	ldxa	[%i1 + %i5]0x80, %l1
	.word	0xe41e6010	! t0_kref+0x47e0:   	ldd	[%i1 + 0x10], %l2
	.word	0x99a688d8	! t0_kref+0x47e4:   	fsubd	%f26, %f24, %f12
	.word	0xa2ac8015	! t0_kref+0x47e8:   	andncc	%l2, %l5, %l1
	.word	0xda68a023	! t0_kref+0x47ec:   	ldstub	[%g2 + 0x23], %o5
	.word	0xa3408000	! t0_kref+0x47f0:   	mov	%ccr, %l1
	.word	0x8586f7ae	! t0_kref+0x47f4:   	wr	%i3, 0xfffff7ae, %ccr
	.word	0xc0260000	! t0_kref+0x47f8:   	clr	[%i0]
	.word	0x31480004	! t0_kref+0x47fc:   	fba,a,pt	%fcc0, _kref+0x480c
	.word	0xa3418000	! t0_kref+0x4800:   	mov	%fprs, %l1
	.word	0xa3b4848e	! t0_kref+0x4804:   	fcmple32	%f18, %f14, %l1
	.word	0xe24e2018	! t0_kref+0x4808:   	ldsb	[%i0 + 0x18], %l1
	.word	0x32800005	! t0_kref+0x480c:   	bne,a	_kref+0x4820
	.word	0xa2d2400b	! t0_kref+0x4810:   	umulcc	%o1, %o3, %l1
	.word	0xa2432142	! t0_kref+0x4814:   	addc	%o4, 0x142, %l1
	.word	0x81aa8a35	! t0_kref+0x4818:   	fcmps	%fcc0, %f10, %f21
	.word	0xa3b48170	! t0_kref+0x481c:   	edge32ln	%l2, %l0, %l1
	.word	0x8143c000	! t0_kref+0x4820:   	stbar
	.word	0xa25b721c	! t0_kref+0x4824:   	smul	%o5, -0xde4, %l1
	.word	0xa27321ed	! t0_kref+0x4828:   	udiv	%o4, 0x1ed, %l1
	.word	0xe3b8a080	! t0_kref+0x482c:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xf11fbde8	! t0_kref+0x4830:   	ldd	[%fp - 0x218], %f24
	.word	0xe40863d8	! t0_kref+0x4834:   	ldub	[%g1 + 0x3d8], %l2
	.word	0xa41ca00c	! t0_kref+0x4838:   	xor	%l2, 0xc, %l2
	.word	0xe42863d8	! t0_kref+0x483c:   	stb	%l2, [%g1 + 0x3d8]
	.word	0x81d863d8	! t0_kref+0x4840:   	flush	%g1 + 0x3d8
2:	.word	0xa9b48a86	! t0_kref+0x4844:   	fpsub16	%f18, %f6, %f20
	.word	0x95a5095c	! t0_kref+0x4848:   	fmuld	%f20, %f28, %f10
	.word	0xa2dafbee	! t0_kref+0x484c:   	smulcc	%o3, -0x412, %l1
	.word	0xe3b8a080	! t0_kref+0x4850:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xa22d801b	! t0_kref+0x4854:   	andn	%l6, %i3, %l1
	.word	0x9da38952	! t0_kref+0x4858:   	fmuld	%f14, %f18, %f14
	.word	0x86102002	! t0_kref+0x485c:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x4860:   	bne,a	_kref+0x4860
	.word	0x86a0e001	! t0_kref+0x4864:   	subcc	%g3, 1, %g3
	.word	0xe2164000	! t0_kref+0x4868:   	lduh	[%i1], %l1
	.word	0xe408643c	! t0_kref+0x486c:   	ldub	[%g1 + 0x43c], %l2
	.word	0xa41ca00c	! t0_kref+0x4870:   	xor	%l2, 0xc, %l2
	.word	0xe428643c	! t0_kref+0x4874:   	stb	%l2, [%g1 + 0x43c]
	.word	0x81d8643c	! t0_kref+0x4878:   	flush	%g1 + 0x43c
	.word	0x9fb3ca68	! t0_kref+0x487c:   	fpadd32s	%f15, %f8, %f15
	.word	0xb3a00037	! t0_kref+0x4880:   	fmovs	%f23, %f25
	.word	0x8da309dc	! t0_kref+0x4884:   	fdivd	%f12, %f28, %f6
	.word	0x232db7c7	! t0_kref+0x4888:   	sethi	%hi(0xb6df1c00), %l1
	.word	0xf428a039	! t0_kref+0x488c:   	stb	%i2, [%g2 + 0x39]
	.word	0xa21ee636	! t0_kref+0x4890:   	xor	%i3, 0x636, %l1
	.word	0xe2de501d	! t0_kref+0x4894:   	ldxa	[%i1 + %i5]0x80, %l1
	.word	0xf93e2018	! t0_kref+0x4898:   	std	%f28, [%i0 + 0x18]
	.word	0xe630a002	! t0_kref+0x489c:   	sth	%l3, [%g2 + 2]
	.word	0x91a0192b	! t0_kref+0x48a0:   	fstod	%f11, %f8
	.word	0x3e480006	! t0_kref+0x48a4:   	bvc,a,pt	%icc, _kref+0x48bc
2:	.word	0xa9b40a1c	! t0_kref+0x48a8:   	fpadd16	%f16, %f28, %f20
	.word	0xa2d54009	! t0_kref+0x48ac:   	umulcc	%l5, %o1, %l1
	.word	0xe296501b	! t0_kref+0x48b0:   	lduha	[%i1 + %i3]0x80, %l1
	.word	0xf6774018	! t0_kref+0x48b4:   	stx	%i3, [%i5 + %i0]
	.word	0x9da018c8	! t0_kref+0x48b8:   	fdtos	%f8, %f14
	.word	0xa5b00fc0	! t0_kref+0x48bc:   	fone	%f18
	.word	0x26800004	! t0_kref+0x48c0:   	bl,a	_kref+0x48d0
	.word	0xa2d2400b	! t0_kref+0x48c4:   	umulcc	%o1, %o3, %l1
	.word	0x21480003	! t0_kref+0x48c8:   	fbn,a,pt	%fcc0, _kref+0x48d4
	.word	0xa2ddb942	! t0_kref+0x48cc:   	smulcc	%l6, -0x6be, %l1
	.word	0x81b01026	! t0_kref+0x48d0:   	siam	0x6
	.word	0xa3b6c100	! t0_kref+0x48d4:   	edge32	%i3, %g0, %l1
	.word	0xa2f4401a	! t0_kref+0x48d8:   	udivcc	%l1, %i2, %l1
	.word	0xa28c8012	! t0_kref+0x48dc:   	andcc	%l2, %l2, %l1
	.word	0x81a9ca38	! t0_kref+0x48e0:   	fcmps	%fcc0, %f7, %f24
	.word	0xa2353c88	! t0_kref+0x48e4:   	orn	%l4, -0x378, %l1
	.word	0xa2dc4016	! t0_kref+0x48e8:   	smulcc	%l1, %l6, %l1
	.word	0xe2500018	! t0_kref+0x48ec:   	ldsh	[%g0 + %i0], %l1
	.word	0xa27ee9e5	! t0_kref+0x48f0:   	sdiv	%i3, 0x9e5, %l1
	.word	0xb9a0103c	! t0_kref+0x48f4:   	fstox	%f28, %f28
	.word	0x3c800003	! t0_kref+0x48f8:   	bpos,a	_kref+0x4904
	.word	0xa3b48200	! t0_kref+0x48fc:   	array8	%l2, %g0, %l1
	.word	0x26480001	! t0_kref+0x4900:   	bl,a,pt	%icc, _kref+0x4904
	.word	0x2325b3ab	! t0_kref+0x4904:   	sethi	%hi(0x96ceac00), %l1
	.word	0xe41e2008	! t0_kref+0x4908:   	ldd	[%i0 + 8], %l2
	.word	0xa2647c5c	! t0_kref+0x490c:   	subc	%l1, -0x3a4, %l1
	call	SYM(t0_subr3)
	.word	0xa2acc01a	! t0_kref+0x4914:   	andncc	%l3, %i2, %l1
	.word	0x9db20f8c	! t0_kref+0x4918:   	for	%f8, %f12, %f14
	.word	0xa25efc57	! t0_kref+0x491c:   	smul	%i3, -0x3a9, %l1
	.word	0x81828000	! t0_kref+0x4920:   	wr	%o2, %g0, %y
	.word	0xa3b30598	! t0_kref+0x4924:   	fcmpgt32	%f12, %f24, %l1
	.word	0xda30a030	! t0_kref+0x4928:   	sth	%o5, [%g2 + 0x30]
	.word	0xa336c015	! t0_kref+0x492c:   	srl	%i3, %l5, %l1
	.word	0x3a800005	! t0_kref+0x4930:   	bcc,a	_kref+0x4944
	.word	0xa3b58496	! t0_kref+0x4934:   	fcmple32	%f22, %f22, %l1
	.word	0xa2180011	! t0_kref+0x4938:   	xor	%g0, %l1, %l1
	.word	0xa234ed41	! t0_kref+0x493c:   	orn	%l3, 0xd41, %l1
	.word	0xe968a080	! t0_kref+0x4940:   	prefetch	%g2 + 0x80, 20
	.word	0xada01913	! t0_kref+0x4944:   	fitod	%f19, %f22
	.word	0xdf20a030	! t0_kref+0x4948:   	st	%f15, [%g2 + 0x30]
	.word	0xa9a00052	! t0_kref+0x494c:   	fmovd	%f18, %f20
	.word	0x93b00fe0	! t0_kref+0x4950:   	fones	%f9
	.word	0xa22a8013	! t0_kref+0x4954:   	andn	%o2, %l3, %l1
	.word	0xb1a508ba	! t0_kref+0x4958:   	fsubs	%f20, %f26, %f24
	.word	0x20800005	! t0_kref+0x495c:   	bn,a	_kref+0x4970
	.word	0xa21e8017	! t0_kref+0x4960:   	xor	%i2, %l7, %l1
	.word	0xa3418000	! t0_kref+0x4964:   	mov	%fprs, %l1
	.word	0xb5a24935	! t0_kref+0x4968:   	fmuls	%f9, %f21, %f26
	.word	0xa29c7e60	! t0_kref+0x496c:   	xorcc	%l1, -0x1a0, %l1
	.word	0xb1a0192b	! t0_kref+0x4970:   	fstod	%f11, %f24
	.word	0xa2150013	! t0_kref+0x4974:   	or	%l4, %l3, %l1
	.word	0xee30a032	! t0_kref+0x4978:   	sth	%l7, [%g2 + 0x32]
	.word	0x93a208b4	! t0_kref+0x497c:   	fsubs	%f8, %f20, %f9
	.word	0xe2063fe8	! t0_kref+0x4980:   	ld	[%i0 - 0x18], %l1
	.word	0xa272800b	! t0_kref+0x4984:   	udiv	%o2, %o3, %l1
	.word	0xa9a01a3c	! t0_kref+0x4988:   	fstoi	%f28, %f20
	.word	0xa215c009	! t0_kref+0x498c:   	or	%l7, %o1, %l1
	.word	0x8fa708b8	! t0_kref+0x4990:   	fsubs	%f28, %f24, %f7
	.word	0xb9a308dc	! t0_kref+0x4994:   	fsubd	%f12, %f28, %f28
	.word	0xd7062004	! t0_kref+0x4998:   	ld	[%i0 + 4], %f11
	.word	0xd7067ff0	! t0_kref+0x499c:   	ld	[%i1 - 0x10], %f11
	.word	0xe42e401a	! t0_kref+0x49a0:   	stb	%l2, [%i1 + %i2]
	.word	0xa2aec012	! t0_kref+0x49a4:   	andncc	%i3, %l2, %l1
	.word	0x95b28f50	! t0_kref+0x49a8:   	fornot1	%f10, %f16, %f10
	.word	0xe3b8a080	! t0_kref+0x49ac:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x9e006548	! t0_kref+0x49b0:   	add	%g1, 0x548, %o7
!	.word	0x36bd2591	! t0_kref+0x49b4:   	bge,a	SYM(t0_subr1)
	   	bge,a	SYM(t0_subr1)
	.word	0xa2ac800d	! t0_kref+0x49b8:   	andncc	%l2, %o5, %l1
	.word	0x99a509da	! t0_kref+0x49bc:   	fdivd	%f20, %f26, %f12
	.word	0xb9b64a2a	! t0_kref+0x49c0:   	fpadd16s	%f25, %f10, %f28
	.word	0x9da0109c	! t0_kref+0x49c4:   	fxtos	%f28, %f14
	.word	0x8143e040	! t0_kref+0x49c8:   	membar	0x40
	.word	0xe24e601a	! t0_kref+0x49cc:   	ldsb	[%i1 + 0x1a], %l1
	.word	0x81834000	! t0_kref+0x49d0:   	wr	%o5, %g0, %y
	.word	0xada0055c	! t0_kref+0x49d4:   	fsqrtd	%f28, %f22
	.word	0xd520a008	! t0_kref+0x49d8:   	st	%f10, [%g2 + 8]
	.word	0x24800003	! t0_kref+0x49dc:   	ble,a	_kref+0x49e8
	.word	0xa22ac013	! t0_kref+0x49e0:   	andn	%o3, %l3, %l1
	.word	0xa3b20200	! t0_kref+0x49e4:   	array8	%o0, %g0, %l1
	.word	0xa2e2c01a	! t0_kref+0x49e8:   	subccc	%o3, %i2, %l1
	.word	0xa2758008	! t0_kref+0x49ec:   	udiv	%l6, %o0, %l1
	.word	0x8fa018d6	! t0_kref+0x49f0:   	fdtos	%f22, %f7
	.word	0xa2153b56	! t0_kref+0x49f4:   	or	%l4, -0x4aa, %l1
	.word	0xb9b58f94	! t0_kref+0x49f8:   	for	%f22, %f20, %f28
!	.word	0x394d257f	! t0_kref+0x49fc:   	fbuge,a,pt	%fcc0, SYM(t0_subr1)
	   	fbuge,a,pt	%fcc0, SYM(t0_subr1)
	.word	0x9f414000	! t0_kref+0x4a00:   	mov	%pc, %o7
	.word	0xc807bfe4	! t0_kref+0x4a04:   	ld	[%fp - 0x1c], %g4
	.word	0x8186c000	! t0_kref+0x4a08:   	wr	%i3, %g0, %y
	.word	0x81aa8a3d	! t0_kref+0x4a0c:   	fcmps	%fcc0, %f10, %f29
	call	SYM(t0_subr1)
	.word	0xa3b20598	! t0_kref+0x4a14:   	fcmpgt32	%f8, %f24, %l1
	.word	0xa29ea313	! t0_kref+0x4a18:   	xorcc	%i2, 0x313, %l1
	.word	0x8fa348ba	! t0_kref+0x4a1c:   	fsubs	%f13, %f26, %f7
	.word	0xada408d6	! t0_kref+0x4a20:   	fsubd	%f16, %f22, %f22
	.word	0xa232329e	! t0_kref+0x4a24:   	orn	%o0, -0xd62, %l1
	.word	0xcd3f4019	! t0_kref+0x4a28:   	std	%f6, [%i5 + %i1]
	.word	0xd9f61008	! t0_kref+0x4a2c:   	casxa	[%i0]0x80, %o0, %o4
	.word	0xe7e65017	! t0_kref+0x4a30:   	casa	[%i1]0x80, %l7, %l3
	.word	0x9de3bfa0	! t0_kref+0x4a34:   	save	%sp, -0x60, %sp
	.word	0xa3e82da5	! t0_kref+0x4a38:   	restore	%g0, 0xda5, %l1
	.word	0xa2c2e064	! t0_kref+0x4a3c:   	addccc	%o3, 0x64, %l1
	.word	0xe8a61000	! t0_kref+0x4a40:   	sta	%l4, [%i0]0x80
	.word	0xa2d57680	! t0_kref+0x4a44:   	umulcc	%l5, -0x980, %l1
	.word	0x8db5875c	! t0_kref+0x4a48:   	fpack32	%f22, %f28, %f6
	.word	0xe216c019	! t0_kref+0x4a4c:   	lduh	[%i3 + %i1], %l1
	.word	0xec262004	! t0_kref+0x4a50:   	st	%l6, [%i0 + 4]
	.word	0xa5a01935	! t0_kref+0x4a54:   	fstod	%f21, %f18
	.word	0x8610201e	! t0_kref+0x4a58:   	mov	0x1e, %g3
	.word	0x86a0e001	! t0_kref+0x4a5c:   	subcc	%g3, 1, %g3
	.word	0x22800003	! t0_kref+0x4a60:   	be,a	_kref+0x4a6c
	.word	0xa3b44056	! t0_kref+0x4a64:   	edge8l	%l1, %l6, %l1
	call	SYM(t0_subr1)
	.word	0x81824000	! t0_kref+0x4a6c:   	wr	%o1, %g0, %y
	.word	0xa7a01a3a	! t0_kref+0x4a70:   	fstoi	%f26, %f19
	.word	0x3f480008	! t0_kref+0x4a74:   	fbo,a,pt	%fcc0, _kref+0x4a94
	.word	0x81db6fb8	! t0_kref+0x4a78:   	flush	%o5 + 0xfb8
	.word	0x9da0193d	! t0_kref+0x4a7c:   	fstod	%f29, %f14
	.word	0xe210a028	! t0_kref+0x4a80:   	lduh	[%g2 + 0x28], %l1
	.word	0xa2800015	! t0_kref+0x4a84:   	addcc	%g0, %l5, %l1
	.word	0xc368a088	! t0_kref+0x4a88:   	prefetch	%g2 + 0x88, 1
	.word	0xa3b20000	! t0_kref+0x4a8c:   	edge8	%o0, %g0, %l1
	.word	0xa9a01933	! t0_kref+0x4a90:   	fstod	%f19, %f20
	.word	0xe2500019	! t0_kref+0x4a94:   	ldsh	[%g0 + %i1], %l1
	.word	0x93a609a7	! t0_kref+0x4a98:   	fdivs	%f24, %f7, %f9
	.word	0xa236bf04	! t0_kref+0x4a9c:   	orn	%i2, -0xfc, %l1
	.word	0xa3b34337	! t0_kref+0x4aa0:   	bmask	%o5, %l7, %l1
	.word	0x8da018da	! t0_kref+0x4aa4:   	fdtos	%f26, %f6
	.word	0xb1a00548	! t0_kref+0x4aa8:   	fsqrtd	%f8, %f24
	.word	0x91b686fc	! t0_kref+0x4aac:   	fmul8ulx16	%f26, %f28, %f8
	.word	0xfdee501b	! t0_kref+0x4ab0:   	prefetcha	%i1 + %i3, 30
	.word	0xb9a0188c	! t0_kref+0x4ab4:   	fitos	%f12, %f28
	.word	0x81d82272	! t0_kref+0x4ab8:   	flush	%g0 + 0x272
	.word	0xa33a0014	! t0_kref+0x4abc:   	sra	%o0, %l4, %l1
	.word	0xa7a01898	! t0_kref+0x4ac0:   	fitos	%f24, %f19
	.word	0xf5b81019	! t0_kref+0x4ac4:   	stda	%f26, [%g0 + %i1]0x80
	.word	0xe25e0000	! t0_kref+0x4ac8:   	ldx	[%i0], %l1
	.word	0xe41e6010	! t0_kref+0x4acc:   	ldd	[%i1 + 0x10], %l2
	.word	0xa5aa005c	! t0_kref+0x4ad0:   	fmovda	%fcc0, %f28, %f18
	.word	0xa244400a	! t0_kref+0x4ad4:   	addc	%l1, %o2, %l1
	.word	0xa2702590	! t0_kref+0x4ad8:   	udiv	%g0, 0x590, %l1
	.word	0xa212f7cb	! t0_kref+0x4adc:   	or	%o3, -0x835, %l1
	.word	0xa2023e9a	! t0_kref+0x4ae0:   	add	%o0, -0x166, %l1
	.word	0xc0200018	! t0_kref+0x4ae4:   	clr	[%g0 + %i0]
	.word	0x9fc10000	! t0_kref+0x4ae8:   	call	%g4
	.word	0xada00554	! t0_kref+0x4aec:   	fsqrtd	%f20, %f22
	.word	0xa5abc048	! t0_kref+0x4af0:   	fmovdo	%fcc0, %f8, %f18
	.word	0xa28d6dcc	! t0_kref+0x4af4:   	andcc	%l5, 0xdcc, %l1
	.word	0x81b01026	! t0_kref+0x4af8:   	siam	0x6
	.word	0x38800007	! t0_kref+0x4afc:   	bgu,a	_kref+0x4b18
	.word	0x9fb0076c	! t0_kref+0x4b00:   	fpack16	%f12, %f15
	.word	0xbba01092	! t0_kref+0x4b04:   	fxtos	%f18, %f29
	.word	0x8143c000	! t0_kref+0x4b08:   	stbar
	.word	0xe240a000	! t0_kref+0x4b0c:   	ldsw	[%g2], %l1
	.word	0xa2320000	! t0_kref+0x4b10:   	orn	%o0, %g0, %l1
	.word	0xa334c014	! t0_kref+0x4b14:   	srl	%l3, %l4, %l1
	.word	0xa234c00d	! t0_kref+0x4b18:   	orn	%l3, %o5, %l1
	.word	0xfc383dc0	! t0_kref+0x4b1c:   	std	%fp, [%g0 - 0x240]
	.word	0xe2567fe2	! t0_kref+0x4b20:   	ldsh	[%i1 - 0x1e], %l1
	.word	0xa25d8012	! t0_kref+0x4b24:   	smul	%l6, %l2, %l1
	.word	0x81dc4018	! t0_kref+0x4b28:   	flush	%l1 + %i0
	.word	0xa5a0055c	! t0_kref+0x4b2c:   	fsqrtd	%f28, %f18
	.word	0xa2dc7986	! t0_kref+0x4b30:   	smulcc	%l1, -0x67a, %l1
	.word	0xe210a000	! t0_kref+0x4b34:   	lduh	[%g2], %l1
	.word	0xa206c009	! t0_kref+0x4b38:   	add	%i3, %o1, %l1
	.word	0xada4c931	! t0_kref+0x4b3c:   	fmuls	%f19, %f17, %f22
	.word	0xd420a020	! t0_kref+0x4b40:   	st	%o2, [%g2 + 0x20]
	.word	0xe41e6008	! t0_kref+0x4b44:   	ldd	[%i1 + 8], %l2
	.word	0xe81e3ff0	! t0_kref+0x4b48:   	ldd	[%i0 - 0x10], %l4
	.word	0xa2f58011	! t0_kref+0x4b4c:   	udivcc	%l6, %l1, %l1
	.word	0x9fa018da	! t0_kref+0x4b50:   	fdtos	%f26, %f15
	.word	0xd5be101d	! t0_kref+0x4b54:   	stda	%f10, [%i0 + %i5]0x80
	.word	0xa33c4011	! t0_kref+0x4b58:   	sra	%l1, %l1, %l1
	.word	0xe120a028	! t0_kref+0x4b5c:   	st	%f16, [%g2 + 0x28]
	.word	0xaba0002b	! t0_kref+0x4b60:   	fmovs	%f11, %f21
	.word	0xa33c0009	! t0_kref+0x4b64:   	sra	%l0, %o1, %l1
	.word	0x37800001	! t0_kref+0x4b68:   	fbge,a	_kref+0x4b6c
	.word	0xe51fbda8	! t0_kref+0x4b6c:   	ldd	[%fp - 0x258], %f18
	.word	0x27480003	! t0_kref+0x4b70:   	fbul,a,pt	%fcc0, _kref+0x4b7c
	.word	0x81d80008	! t0_kref+0x4b74:   	flush	%g0 + %o0
	.word	0xa33d2012	! t0_kref+0x4b78:   	sra	%l4, 0x12, %l1
	.word	0xa33a6000	! t0_kref+0x4b7c:   	sra	%o1, 0x0, %l1
	.word	0xa25b0012	! t0_kref+0x4b80:   	smul	%o4, %l2, %l1
	.word	0x91b5c6ae	! t0_kref+0x4b84:   	fmul8x16al	%f23, %f14, %f8
	.word	0xe420a030	! t0_kref+0x4b88:   	st	%l2, [%g2 + 0x30]
	.word	0xa21aa87f	! t0_kref+0x4b8c:   	xor	%o2, 0x87f, %l1
	.word	0xa2057d63	! t0_kref+0x4b90:   	add	%l5, -0x29d, %l1
	.word	0x23354c8f	! t0_kref+0x4b94:   	sethi	%hi(0xd5323c00), %l1
	.word	0x81aa4a2c	! t0_kref+0x4b98:   	fcmps	%fcc0, %f9, %f12
	.word	0xa21c6439	! t0_kref+0x4b9c:   	xor	%l1, 0x439, %l1
	.word	0x9fc10000	! t0_kref+0x4ba0:   	call	%g4
	.word	0xe248a000	! t0_kref+0x4ba4:   	ldsb	[%g2], %l1
	.word	0x37480005	! t0_kref+0x4ba8:   	fbge,a,pt	%fcc0, _kref+0x4bbc
	.word	0xa2c00013	! t0_kref+0x4bac:   	addccc	%g0, %l3, %l1
	.word	0xe246601c	! t0_kref+0x4bb0:   	ldsw	[%i1 + 0x1c], %l1
	.word	0x81ae8a56	! t0_kref+0x4bb4:   	fcmpd	%fcc0, %f26, %f22
	.word	0xe240a008	! t0_kref+0x4bb8:   	ldsw	[%g2 + 8], %l1
	.word	0xda28a030	! t0_kref+0x4bbc:   	stb	%o5, [%g2 + 0x30]
	.word	0x81ac0abb	! t0_kref+0x4bc0:   	fcmpes	%fcc0, %f16, %f27
	.word	0x23344c0b	! t0_kref+0x4bc4:   	sethi	%hi(0xd1302c00), %l1
	.word	0x8fa000b5	! t0_kref+0x4bc8:   	fnegs	%f21, %f7
	.word	0xada01a29	! t0_kref+0x4bcc:   	fstoi	%f9, %f22
	.word	0x21480007	! t0_kref+0x4bd0:   	fbn,a,pt	%fcc0, _kref+0x4bec
	.word	0xb5a5492c	! t0_kref+0x4bd4:   	fmuls	%f21, %f12, %f26
	.word	0xa2c43a3b	! t0_kref+0x4bd8:   	addccc	%l0, -0x5c5, %l1
	.word	0xa2d2c00c	! t0_kref+0x4bdc:   	umulcc	%o3, %o4, %l1
	.word	0x81ad0a34	! t0_kref+0x4be0:   	fcmps	%fcc0, %f20, %f20
	.word	0xe2567ffc	! t0_kref+0x4be4:   	ldsh	[%i1 - 4], %l1
	.word	0xa325aebd	! t0_kref+0x4be8:   	mulscc	%l6, 0xebd, %l1
	.word	0xa3b5841c	! t0_kref+0x4bec:   	fcmple16	%f22, %f28, %l1
	.word	0xa2b44017	! t0_kref+0x4bf0:   	orncc	%l1, %l7, %l1
	.word	0x9db50d1a	! t0_kref+0x4bf4:   	fandnot1	%f20, %f26, %f14
	.word	0xa2b6b821	! t0_kref+0x4bf8:   	orncc	%i2, -0x7df, %l1
	.word	0xf630a00a	! t0_kref+0x4bfc:   	sth	%i3, [%g2 + 0xa]
	.word	0x2e480002	! t0_kref+0x4c00:   	bvs,a,pt	%icc, _kref+0x4c08
	.word	0xd228a00a	! t0_kref+0x4c04:   	stb	%o1, [%g2 + 0xa]
	.word	0xa298000d	! t0_kref+0x4c08:   	xorcc	%g0, %o5, %l1
	.word	0xf6262018	! t0_kref+0x4c0c:   	st	%i3, [%i0 + 0x18]
	.word	0xa3346006	! t0_kref+0x4c10:   	srl	%l1, 0x6, %l1
	.word	0xa2434010	! t0_kref+0x4c14:   	addc	%o5, %l0, %l1
	.word	0xa3b44040	! t0_kref+0x4c18:   	edge8l	%l1, %g0, %l1
	.word	0xe3064000	! t0_kref+0x4c1c:   	ld	[%i1], %f17
	.word	0xeb270019	! t0_kref+0x4c20:   	st	%f21, [%i4 + %i1]
	.word	0xa3b4813a	! t0_kref+0x4c24:   	edge32n	%l2, %i2, %l1
	.word	0xe3b8a040	! t0_kref+0x4c28:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xe40867f4	! t0_kref+0x4c2c:   	ldub	[%g1 + 0x7f4], %l2
	.word	0xa41ca00c	! t0_kref+0x4c30:   	xor	%l2, 0xc, %l2
	.word	0xe42867f4	! t0_kref+0x4c34:   	stb	%l2, [%g1 + 0x7f4]
	.word	0x81d867f4	! t0_kref+0x4c38:   	flush	%g1 + 0x7f4
	.word	0x81b01027	! t0_kref+0x4c3c:   	siam	0x7
	.word	0xd5063fec	! t0_kref+0x4c40:   	ld	[%i0 - 0x14], %f10
	.word	0x8fb18abc	! t0_kref+0x4c44:   	fpsub16s	%f6, %f28, %f7
	.word	0xa3a01a30	! t0_kref+0x4c48:   	fstoi	%f16, %f17
	.word	0xe240a018	! t0_kref+0x4c4c:   	ldsw	[%g2 + 0x18], %l1
	.word	0xef00a008	! t0_kref+0x4c50:   	ld	[%g2 + 8], %f23
	.word	0x8143c000	! t0_kref+0x4c54:   	stbar
	.word	0x8143c000	! t0_kref+0x4c58:   	stbar
	.word	0xa332a016	! t0_kref+0x4c5c:   	srl	%o2, 0x16, %l1
2:	.word	0xafa01a38	! t0_kref+0x4c60:   	fstoi	%f24, %f23
	.word	0xa1a01a2c	! t0_kref+0x4c64:   	fstoi	%f12, %f16
	.word	0xa2328015	! t0_kref+0x4c68:   	orn	%o2, %l5, %l1
	.word	0xa2834013	! t0_kref+0x4c6c:   	addcc	%o5, %l3, %l1
	.word	0x33800001	! t0_kref+0x4c70:   	fbe,a	_kref+0x4c74
	.word	0xa275c016	! t0_kref+0x4c74:   	udiv	%l7, %l6, %l1
	.word	0x28480003	! t0_kref+0x4c78:   	bleu,a,pt	%icc, _kref+0x4c84
	.word	0xe200a038	! t0_kref+0x4c7c:   	ld	[%g2 + 0x38], %l1
	.word	0xa3b6850a	! t0_kref+0x4c80:   	fcmpgt16	%f26, %f10, %l1
	.word	0xa203001b	! t0_kref+0x4c84:   	add	%o4, %i3, %l1
	.word	0xe726401c	! t0_kref+0x4c88:   	st	%f19, [%i1 + %i4]
	.word	0xe206401c	! t0_kref+0x4c8c:   	ld	[%i1 + %i4], %l1
	.word	0xe210a032	! t0_kref+0x4c90:   	lduh	[%g2 + 0x32], %l1
	.word	0x8da3c8a8	! t0_kref+0x4c94:   	fsubs	%f15, %f8, %f6
	.word	0x38800005	! t0_kref+0x4c98:   	bgu,a	_kref+0x4cac
	.word	0xc12e001c	! t0_kref+0x4c9c:   	st	%fsr, [%i0 + %i4]
	.word	0x81dcf05e	! t0_kref+0x4ca0:   	flush	%l3 - 0xfa2
	.word	0xe24e8019	! t0_kref+0x4ca4:   	ldsb	[%i2 + %i1], %l1
	call	SYM(t0_subr1)
	.word	0xe81e0000	! t0_kref+0x4cac:   	ldd	[%i0], %l4
	.word	0xe91fbe68	! t0_kref+0x4cb0:   	ldd	[%fp - 0x198], %f20
	.word	0xa5b4497d	! t0_kref+0x4cb4:   	fpmerge	%f17, %f29, %f18
	.word	0xb5a0002d	! t0_kref+0x4cb8:   	fmovs	%f13, %f26
	.word	0x95a00558	! t0_kref+0x4cbc:   	fsqrtd	%f24, %f10
	.word	0x99b00f0a	! t0_kref+0x4cc0:   	fsrc2	%f10, %f12
	.word	0x2f480003	! t0_kref+0x4cc4:   	fbu,a,pt	%fcc0, _kref+0x4cd0
	.word	0xe030a010	! t0_kref+0x4cc8:   	sth	%l0, [%g2 + 0x10]
	.word	0xa322276a	! t0_kref+0x4ccc:   	mulscc	%o0, 0x76a, %l1
	.word	0x95a000bb	! t0_kref+0x4cd0:   	fnegs	%f27, %f10
	.word	0xa232a578	! t0_kref+0x4cd4:   	orn	%o2, 0x578, %l1
	.word	0xa21a401b	! t0_kref+0x4cd8:   	xor	%o1, %i3, %l1
	.word	0x9da30948	! t0_kref+0x4cdc:   	fmuld	%f12, %f8, %f14
	.word	0xe89e101d	! t0_kref+0x4ce0:   	ldda	[%i0 + %i5]0x80, %l4
	.word	0xa282a0a6	! t0_kref+0x4ce4:   	addcc	%o2, 0xa6, %l1
	.word	0xfb20a000	! t0_kref+0x4ce8:   	st	%f29, [%g2]
	.word	0xa2847287	! t0_kref+0x4cec:   	addcc	%l1, -0xd79, %l1
	.word	0xd86e601e	! t0_kref+0x4cf0:   	ldstub	[%i1 + 0x1e], %o4
	.word	0xa2e6801b	! t0_kref+0x4cf4:   	subccc	%i2, %i3, %l1
	.word	0xa3b30548	! t0_kref+0x4cf8:   	fcmpeq16	%f12, %f8, %l1
	.word	0xd3262004	! t0_kref+0x4cfc:   	st	%f9, [%i0 + 4]
	.word	0x81db34c9	! t0_kref+0x4d00:   	flush	%o4 - 0xb37
	.word	0x32800004	! t0_kref+0x4d04:   	bne,a	_kref+0x4d14
	.word	0xa32c4000	! t0_kref+0x4d08:   	sll	%l1, %g0, %l1
	.word	0xee28a009	! t0_kref+0x4d0c:   	stb	%l7, [%g2 + 9]
	.word	0xe13e7ff0	! t0_kref+0x4d10:   	std	%f16, [%i1 - 0x10]
	.word	0xa2e5400c	! t0_kref+0x4d14:   	subccc	%l5, %o4, %l1
	.word	0xe256c019	! t0_kref+0x4d18:   	ldsh	[%i3 + %i1], %l1
	.word	0x9db70d9c	! t0_kref+0x4d1c:   	fxor	%f28, %f28, %f14
	.word	0xe81e4000	! t0_kref+0x4d20:   	ldd	[%i1], %l4
	.word	0xa2347adf	! t0_kref+0x4d24:   	orn	%l1, -0x521, %l1
	.word	0x35800003	! t0_kref+0x4d28:   	fbue,a	_kref+0x4d34
	.word	0xe2865000	! t0_kref+0x4d2c:   	lda	[%i1]0x80, %l1
	.word	0x93a74939	! t0_kref+0x4d30:   	fmuls	%f29, %f25, %f9
	.word	0x3c480002	! t0_kref+0x4d34:   	bpos,a,pt	%icc, _kref+0x4d3c
	.word	0x97a58928	! t0_kref+0x4d38:   	fmuls	%f22, %f8, %f11
	.word	0xdf064000	! t0_kref+0x4d3c:   	ld	[%i1], %f15
	.word	0xa9a0012b	! t0_kref+0x4d40:   	fabss	%f11, %f20
	.word	0xa21d39be	! t0_kref+0x4d44:   	xor	%l4, -0x642, %l1
	.word	0x2e800007	! t0_kref+0x4d48:   	bvs,a	_kref+0x4d64
	.word	0xb5a38948	! t0_kref+0x4d4c:   	fmuld	%f14, %f8, %f26
	.word	0x33480008	! t0_kref+0x4d50:   	fbe,a,pt	%fcc0, _kref+0x4d70
	.word	0xa2dc309b	! t0_kref+0x4d54:   	smulcc	%l0, -0xf65, %l1
	.word	0xa33d800d	! t0_kref+0x4d58:   	sra	%l6, %o5, %l1
	.word	0xd7067fe8	! t0_kref+0x4d5c:   	ld	[%i1 - 0x18], %f11
	.word	0xe22e001a	! t0_kref+0x4d60:   	stb	%l1, [%i0 + %i2]
	.word	0x81ac4a38	! t0_kref+0x4d64:   	fcmps	%fcc0, %f17, %f24
	.word	0xa3b28518	! t0_kref+0x4d68:   	fcmpgt16	%f10, %f24, %l1
	.word	0xa2c2c011	! t0_kref+0x4d6c:   	addccc	%o3, %l1, %l1
	.word	0xe5be501d	! t0_kref+0x4d70:   	stda	%f18, [%i1 + %i5]0x80
	.word	0xb9b00f38	! t0_kref+0x4d74:   	fsrc2s	%f24, %f28
	.word	0xe2562018	! t0_kref+0x4d78:   	ldsh	[%i0 + 0x18], %l1
	.word	0x3c800005	! t0_kref+0x4d7c:   	bpos,a	_kref+0x4d90
	.word	0xa2f2800d	! t0_kref+0x4d80:   	udivcc	%o2, %o5, %l1
	.word	0x81dbf83a	! t0_kref+0x4d84:   	flush	%o7 - 0x7c6
	.word	0xed1fbc18	! t0_kref+0x4d88:   	ldd	[%fp - 0x3e8], %f22
	.word	0x8da01930	! t0_kref+0x4d8c:   	fstod	%f16, %f6
	.word	0xe4086944	! t0_kref+0x4d90:   	ldub	[%g1 + 0x944], %l2
	.word	0xa41ca00c	! t0_kref+0x4d94:   	xor	%l2, 0xc, %l2
	.word	0xe4286944	! t0_kref+0x4d98:   	stb	%l2, [%g1 + 0x944]
	.word	0x81d86944	! t0_kref+0x4d9c:   	flush	%g1 + 0x944
	.word	0x81ac8a4a	! t0_kref+0x4da0:   	fcmpd	%fcc0, %f18, %f10
	.word	0xa5a0055a	! t0_kref+0x4da4:   	fsqrtd	%f26, %f18
	.word	0xb5b00ce8	! t0_kref+0x4da8:   	fnot2s	%f8, %f26
	.word	0xe0680019	! t0_kref+0x4dac:   	ldstub	[%g0 + %i1], %l0
2:	.word	0xa28d800c	! t0_kref+0x4db0:   	andcc	%l6, %o4, %l1
	.word	0xa33a6013	! t0_kref+0x4db4:   	sra	%o1, 0x13, %l1
	.word	0x81df801d	! t0_kref+0x4db8:   	flush	%fp + %i5
	.word	0xd1be1000	! t0_kref+0x4dbc:   	stda	%f8, [%i0]0x80
	.word	0x99a508b1	! t0_kref+0x4dc0:   	fsubs	%f20, %f17, %f12
	.word	0xa2f46c42	! t0_kref+0x4dc4:   	udivcc	%l1, 0xc42, %l1
	.word	0xa1aa0026	! t0_kref+0x4dc8:   	fmovsa	%fcc0, %f6, %f16
	.word	0xe41e3ff0	! t0_kref+0x4dcc:   	ldd	[%i0 - 0x10], %l2
	call	SYM(t0_subr1)
	.word	0x91a01889	! t0_kref+0x4dd4:   	fitos	%f9, %f8
	.word	0xec6e8019	! t0_kref+0x4dd8:   	ldstub	[%i2 + %i1], %l6
	.word	0xd1e61011	! t0_kref+0x4ddc:   	casa	[%i0]0x80, %l1, %o0
	.word	0xa2b48000	! t0_kref+0x4de0:   	orncc	%l2, %g0, %l1
	.word	0xa2fb401b	! t0_kref+0x4de4:   	sdivcc	%o5, %i3, %l1
	.word	0xd5000019	! t0_kref+0x4de8:   	ld	[%g0 + %i1], %f10
	.word	0x22480008	! t0_kref+0x4dec:   	be,a,pt	%icc, _kref+0x4e0c
	.word	0x9fa748ba	! t0_kref+0x4df0:   	fsubs	%f29, %f26, %f15
	.word	0xe820a028	! t0_kref+0x4df4:   	st	%l4, [%g2 + 0x28]
	.word	0xd5e6100b	! t0_kref+0x4df8:   	casa	[%i0]0x80, %o3, %o2
	.word	0x22480005	! t0_kref+0x4dfc:   	be,a,pt	%icc, _kref+0x4e10
	.word	0x8143c000	! t0_kref+0x4e00:   	stbar
	.word	0x22480003	! t0_kref+0x4e04:   	be,a,pt	%icc, _kref+0x4e10
	.word	0x95b009b6	! t0_kref+0x4e08:   	fexpand	%f22, %f10
	.word	0xa3400000	! t0_kref+0x4e0c:   	mov	%y, %l1
	.word	0xe620a018	! t0_kref+0x4e10:   	st	%l3, [%g2 + 0x18]
	.word	0xa28a8009	! t0_kref+0x4e14:   	andcc	%o2, %o1, %l1
	.word	0xa2ddabc8	! t0_kref+0x4e18:   	smulcc	%l6, 0xbc8, %l1
	.word	0xa9a01931	! t0_kref+0x4e1c:   	fstod	%f17, %f20
	call	SYM(_kaos_done)
	.word	0x01000000	! t0_kref+0x4e24:   	nop
	KGLOBAL(t0_ktbl_end)
t0_ktbl_end:
t0_ktbl_page_end:

KTEXT_MODULE(t0_module_subr0, 0x0e1d6000)
.seg "text"
t0_subr0_page_begin:
	.skip 8188
.global _t0_subr0; ENTRY(t0_subr0)
	.word	0xa6844012	! t0_subr0+0x0:   	addcc	%l1, %l2, %l3
	.word	0x81c3e008	! t0_subr0+0x4:   	retl
	.word	0xaa64c014	! t0_subr0+0x8:   	subc	%l3, %l4, %l5
t0_subr0_page_end:

KTEXT_MODULE(t0_module_subr1, 0x0d968000)
.seg "text"
t0_subr1_page_begin:
	.skip 8184
.global _t0_subr1; ENTRY(t0_subr1)
	.word	0x9de3bfa0	! t0_subr1+0x0:   	save	%sp, -0x60, %sp
	.word	0xb29eaa5a	! t0_subr1+0x4:   	xorcc	%i2, 0xa5a, %i1
	.word	0x81c7e008	! t0_subr1+0x8:   	ret
	.word	0xa7ee6001	! t0_subr1+0xc:   	restore	%i1, 1, %l3
t0_subr1_page_end:

KTEXT_MODULE(t0_module_subr2, 0x228c0000)
.seg "text"
t0_subr2_page_begin:
	.skip 8180
.global _t0_subr2; ENTRY(t0_subr2)
	.word	0x9de3bfa0	! t0_subr2+0x0:   	save	%sp, -0x60, %sp
	.word	0xb2066001	! t0_subr2+0x4:   	add	%i1, 1, %i1
	.word	0x81c7e008	! t0_subr2+0x8:   	ret
	.word	0xa3ee6001	! t0_subr2+0xc:   	restore	%i1, 1, %l1
t0_subr2_page_end:

KTEXT_MODULE(t0_module_subr3, 0x28e4e000)
.seg "text"
t0_subr3_page_begin:
	.skip 8116
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
!  Total operations: 4852  
!
!  Operation frequencies
!
!  name               exp    obs
!  ldsb              1.14   1.11
!  ldub              0.42   0.54
!  ldsh              1.22   1.34
!  lduh              0.63   0.76
!  ld                0.39   0.37
!  ldd               1.13   1.36
!  swap              0.03   0.02
!  ldstub            1.22   1.20
!  stb               0.53   0.43
!  sth               0.49   0.62
!  st                0.57   0.54
!  std               0.06   0.04
!  add               1.23   1.50
!  addcc             0.92   0.78
!  addx              0.84   0.89
!  addxcc            0.63   0.58
!  taddcc            0.13   0.06
!  taddcctv          0.07   0.04
!  sub               0.05   0.02
!  subcc             0.46   0.39
!  subx              0.06   0.04
!  subxcc            0.89   0.95
!  tsubcc            0.24   0.12
!  tsubcctv          0.11   0.14
!  mulscc            0.47   0.37
!  and               0.23   0.16
!  andcc             0.79   0.82
!  andn              0.97   1.07
!  andncc            0.54   0.78
!  or                1.22   1.28
!  orcc              0.54   0.60
!  orn               1.23   1.63
!  orncc             0.61   0.66
!  xor               1.32   1.32
!  xorcc             0.86   1.13
!  xnor              0.10   0.08
!  xnorcc            0.28   0.25
!  sll               0.45   0.39
!  srl               0.90   0.91
!  sra               1.14   1.15
!  unimp             0.15   0.19
!  umul              0.21   0.12
!  smul              1.03   1.20
!  udiv              1.04   1.15
!  sdiv              0.23   0.19
!  umulcc            0.68   0.58
!  smulcc            0.89   0.72
!  udivcc            0.80   0.95
!  sdivcc            0.06   0.06
!  rdy               0.94   0.76
!  wry               0.93   0.95
!  bicc              3.51   3.13
!  sethi             1.06   1.03
!  jmpl              0.80   0.70
!  call              1.24   1.17
!  ticc              0.00   0.00
!  flush             1.22   1.24
!  save              0.52   0.41
!  restore           0.88   0.00
!  stbar             1.16   1.32
!  ldf               1.31   1.40
!  lddf              0.03   0.02
!  stf               0.84   1.07
!  stdf              0.33   0.37
!  fadds             0.11   0.19
!  fsubs             1.02   1.11
!  fmuls             0.63   0.82
!  fdivs             0.35   0.39
!  faddd             0.68   0.64
!  fsubd             0.54   0.70
!  fmuld             1.24   1.13
!  fdivd             0.94   0.78
!  faddq             0.00   0.00
!  fsubq             0.00   0.00
!  fmulq             0.00   0.00
!  fdivq             0.00   0.00
!  fsmuld            0.48   0.35
!  fdmulq            0.00   0.00
!  fitos             0.80   0.89
!  fitod             0.70   0.58
!  fitoq             0.00   0.00
!  fstoi             0.79   0.95
!  fstod             1.06   1.03
!  fstoq             0.00   0.00
!  fdtoi             0.05   0.08
!  fdtos             1.16   0.97
!  fdtoq             0.00   0.00
!  fqtoi             0.00   0.00
!  fqtos             0.00   0.00
!  fqtod             0.00   0.00
!  fmovs             1.09   0.78
!  fnegs             0.36   0.37
!  fabss             0.42   0.31
!  fsqrts            0.26   0.23
!  fsqrtd            1.07   1.09
!  fsqrtq            0.00   0.00
!  fcmps             0.78   0.87
!  fcmpd             1.17   1.30
!  fcmpq             0.00   0.00
!  fcmpes            0.49   0.52
!  fcmped            0.30   0.19
!  fcmpeq            0.00   0.00
!  fbfcc             1.10   0.76
!  ldfsr             0.16   0.00
!  stfsr             0.17   0.25
!  loop              0.94   0.47
!  offset            0.27   0.19
!  area              0.19   0.23
!  target            0.19   0.19
!  goto              0.12   0.08
!  sigsegv           0.23   0.25
!  sigbus            0.10   0.02
!  imodify           0.50   0.35
!  ldfsr_offset      0.13   0.00
!  fpattern          1.20   1.38
!  lbranch           0.25   0.29
!  shmld             2.99   3.36
!  shmst             4.90   5.38
!  shmpf             0.15   0.12
!  shmswap           0.13   0.12
!  shmblkld          0.76   0.00
!  shmblkst          0.67   0.60
!  shmblkchk         0.13   0.10
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
!  casa              0.25   0.39
!  rdasi             0.10   0.06
!  wrasi             0.04   0.00
!  bpcc              1.70   1.67
!  fbpfcc            2.29   2.35
!  fmovscc           0.21   0.27
!  fmovdcc           0.21   0.16
!  fmovqcc           0.00   0.00
!  movcc             0.14   0.16
!  flushw            0.09   0.08
!  membar            0.05   0.04
!  prefetch          0.11   0.04
!  rdpc              0.19   0.04
!  ldqf              0.00   0.00
!  stqf              0.00   0.00
!  ldfa              0.08   0.04
!  lddfa             0.20   0.29
!  ldqfa             0.00   0.00
!  ldsba             0.03   0.00
!  ldsha             0.10   0.08
!  lduba             0.00   0.00
!  lduha             0.25   0.45
!  lda               0.21   0.35
!  ldda              0.21   0.19
!  ldstuba           0.03   0.04
!  prefetcha         0.77   0.91
!  stfa              0.05   0.08
!  stdfa             0.22   0.33
!  stqfa             0.00   0.00
!  stba              0.13   0.12
!  stha              0.03   0.04
!  sta               0.12   0.16
!  stda              0.05   0.08
!  swapa             0.18   0.19
!  fmovd             0.25   0.19
!  fnegd             0.05   0.02
!  fabsd             0.26   0.27
!  fstox             0.16   0.23
!  fdtox             0.00   0.00
!  fxtos             0.17   0.19
!  fxtod             0.06   0.08
!  lds               0.25   0.39
!  ldsa              0.19   0.12
!  ldx               0.10   0.21
!  ldxa              0.24   0.45
!  nofault           0.01   0.00
!  rdgsr             0.13   0.02
!  wrgsr             0.05   0.00
!  fpadd16           0.04   0.06
!  fpadd16s          0.26   0.43
!  fpadd32           0.07   0.08
!  fpadd32s          0.06   0.04
!  fpsub16           0.07   0.08
!  fpsub16s          0.25   0.23
!  fpsub32           0.00   0.00
!  fpsub32s          0.04   0.06
!  fpack16           0.17   0.19
!  fpack32           0.17   0.29
!  fpackfix          0.18   0.19
!  fexpand           0.06   0.16
!  fpmerge           0.25   0.31
!  fmul8x16          0.12   0.02
!  fmul8x16au        0.01   0.02
!  fmul8x16al        0.09   0.06
!  fmul8sux16        0.03   0.00
!  fmul8ulx16        0.17   0.06
!  fmuld8sux16       0.14   0.21
!  fmuld8ulx16       0.10   0.10
!  alignaddr         0.09   0.08
!  alignaddrl        0.21   0.14
!  faligndata        0.05   0.04
!  fzero             0.20   0.25
!  fzeros            0.15   0.12
!  fone              0.24   0.29
!  fones             0.08   0.10
!  fsrc1             0.14   0.14
!  fsrc1s            0.25   0.31
!  fsrc2             0.16   0.27
!  fsrc2s            0.21   0.16
!  fnot1             0.09   0.08
!  fnot1s            0.06   0.10
!  fnot2             0.20   0.14
!  fnot2s            0.26   0.23
!  for               0.25   0.29
!  fors              0.08   0.04
!  fnor              0.05   0.04
!  fnors             0.15   0.33
!  fand              0.05   0.02
!  fands             0.12   0.08
!  fnand             0.03   0.06
!  fnands            0.05   0.06
!  fxor              0.20   0.35
!  fxors             0.21   0.23
!  fxnor             0.13   0.12
!  fxnors            0.09   0.06
!  fornot1           0.22   0.29
!  fornot1s          0.14   0.23
!  fornot2           0.15   0.21
!  fornot2s          0.11   0.06
!  fandnot1          0.21   0.27
!  fandnot1s         0.04   0.06
!  fandnot2          0.10   0.08
!  fandnot2s         0.24   0.25
!  fcmpgt16          0.13   0.16
!  fcmpgt32          0.13   0.21
!  fcmple16          0.25   0.29
!  fcmple32          0.23   0.08
!  fcmpne16          0.23   0.12
!  fcmpne32          0.12   0.19
!  fcmpeq16          0.07   0.10
!  fcmpeq32          0.02   0.08
!  edge8             0.19   0.33
!  edge8l            0.24   0.25
!  edge16            0.11   0.12
!  edge16l           0.05   0.08
!  edge32            0.13   0.08
!  edge32l           0.02   0.04
!  pdist             0.01   0.00
!  partial_st8       0.10   0.06
!  partial_st16      0.18   0.16
!  partial_st32      0.13   0.08
!  short_st8         0.12   0.10
!  short_st16        0.21   0.23
!  short_ld8         0.00   0.00
!  short_ld16        0.00   0.00
!  blkld             0.14   0.00
!  blkst             0.17   0.00
!  blkld_offset      0.23   0.00
!  blkst_offset      0.03   0.00
!  blk_check         0.21   0.10
!  casxa             0.14   0.25
!  rdccr             0.02   0.04
!  rdfprs            0.25   0.27
!  wrccr             0.17   0.14
!  popc              0.18   0.21
!  wrfprs            0.17   0.08
!  stx               0.12   0.12
!  stxa              0.04   0.04
!  cflush            0.00   0.00
!  array8            0.18   0.21
!  array16           0.13   0.16
!  array32           0.05   0.04
!  edge8n            0.05   0.02
!  edge8ln           0.20   0.12
!  edge16n           0.00   0.00
!  edge16ln          0.11   0.06
!  edge32n           0.13   0.16
!  edge32ln          0.04   0.08
!  bmask             0.11   0.14
!  bshuffle          0.23   0.08
!  siam              0.24   0.27
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
KDATA_MODULE(t0_module_offset_table, 0x1e6bc000)
.seg "data"
t0_offset_table_start:
t0_offset_table_size:	.word	0x00000008
t0_offset_table:
	.word	0x00000018
	.word	0xffffffe0
	.word	0xfffffff8
	.word	0x00000008
	.word	0x00000010
	.word	0xfffffff0
	.word	0xffffffe8
	.word	0x00000000
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

KDATA_MODULE(t0_module_data_in_regs, 0x2e98e000)
.seg "data"
KGLOBAL(t0_data_in_regs)
t0_data_in_regs_start:
t0_data_in_regs:
	.word	0x06c25c54          ! %f0
	.word	0x12764016          ! %f1
	.word	0x488e901e          ! %f2
	.word	0x8d30ecd0          ! %f3
	.word	0x8a26d631          ! %f4
	.word	0xc42ba5bd          ! %f5
	.word	0xc7516dac          ! %f6
	.word	0x11207def          ! %f7
	.word	0xa300a914          ! %f8
	.word	0xc5a36dab          ! %f9
	.word	0xcb6840de          ! %f10
	.word	0x4e60f669          ! %f11
	.word	0xa2a19dbf          ! %f12
	.word	0x397343ac          ! %f13
	.word	0x098174ca          ! %f14
	.word	0x4a314e30          ! %f15
	.word	0xeeb9f29f          ! %f16
	.word	0x077fc8f8          ! %f17
	.word	0xcada6841          ! %f18
	.word	0xc9a14c49          ! %f19
	.word	0xe9194341          ! %f20
	.word	0xd1015894          ! %f21
	.word	0xdfe8e467          ! %f22
	.word	0x8cb1fbd3          ! %f23
	.word	0x9d51f304          ! %f24
	.word	0x26e62df7          ! %f25
	.word	0xce0ce885          ! %f26
	.word	0x3f99ed48          ! %f27
	.word	0xf01c0f0e          ! %f28
	.word	0x72ddd1ef          ! %f29
	.word	0x6772df1d          ! %f30
	.word	0xa835c802          ! %f31
	.word	0xb8afdb83          ! %f32
	.word	0x61b3f1c5          ! %f33
	.word	0x3e3b903e          ! %f34
	.word	0xcf31f001          ! %f35
	.word	0x7b1f7ff4          ! %f36
	.word	0x5f5f049f          ! %f37
	.word	0xcf80651a          ! %f38
	.word	0xca0243eb          ! %f39
	.word	0x9f3a8715          ! %f40
	.word	0x2c896325          ! %f41
	.word	0x5d1fd0d5          ! %f42
	.word	0x98893753          ! %f43
	.word	0x20fd25b3          ! %f44
	.word	0xf8a1b567          ! %f45
	.word	0xcfa6f29f          ! %f46
	.word	0xff9fcd3d          ! %f47
	.word	0x31387ce4          ! %f48
	.word	0x14e9dafe          ! %f49
	.word	0x916ac504          ! %f50
	.word	0xecc436e1          ! %f51
	.word	0xde404b7f          ! %f52
	.word	0x02c9b170          ! %f53
	.word	0xa2346e82          ! %f54
	.word	0x474d1aaf          ! %f55
	.word	0x283dc2ce          ! %f56
	.word	0xb41d5cd9          ! %f57
	.word	0x7d09875b          ! %f58
	.word	0xecdbc793          ! %f59
	.word	0x528e7282          ! %f60
	.word	0x958cf6c6          ! %f61
	.word	0x38d268ad          ! %f62
	.word	0x41a7d87a          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0xd8c       ! %g1 (code pointer)
	.word	t0_data_in_shm_area ! %g2 (shared area pointer)
	.word	0xd0430f8a          ! %g3 (loop index)
	.word	SYM(t0_subr0)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0xdfb56ef3          ! %o0
	.word	0x94d994f1          ! %o1
	.word	0x215516e6          ! %o2
	.word	0x95756551          ! %o3
	.word	0x08236591          ! %o4
	.word	0xb4352cfd          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0x7e917fe6          ! %l0
	.word	0xd375c764          ! %l1
	.word	0x4e2dd8bf          ! %l2
	.word	0x4de30c13          ! %l3
	.word	0xc3b49c57          ! %l4
	.word	0x07cb6cd9          ! %l5
	.word	0xf1e2a89c          ! %l6
	.word	0xf01c54d9          ! %l7
	.word	t0_data_in_area0    ! %i0 (area pointer)
	.word	t0_data_in_area0    ! %i1 (area pointer)
	.word	0x0000001f          ! %i2 (byte offset)
	.word	0x00000010          ! %i3 (halfword offset)
	.word	0xfffffff8          ! %i4 (word offset)
	.word	0xffffffe8          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0x8e6f0be3          ! %y
	.word	0x00000000          ! %icc (nzvc)
	.word	0xc0000780          ! %fsr
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
.global t0_data_in_mtbl_size; t0_data_in_mtbl_size:	.word	253
t0_data_in_regs_end:

.skip 7708	! page align

KDATA_MODULE(t0_module_data_in_stack, 0x0f632000)
.seg "data"
KGLOBAL(t0_data_in_mtbl_size)
KGLOBAL(t0_data_in_mtbl)
KGLOBAL(t0_data_in_stack)
t0_data_in_stack_start:
	.word	0x8f21b49a
	.word	0x98797fa5
	.word	0xa904bffa
	.word	0xe4fb3007
	.word	0xed2b2b50
	.word	0x4e149c04
	.word	0xb74dc5f4
	.word	0x6aeafd1c
	.word	0x1314f783
	.word	0xa23533d8
	.word	0x938adb16
	.word	0x62993e79
	.word	0xa5d46bac
	.word	0x00513b01
	.word	0xc41cfaf5
	.word	0xe6793a7f
	.word	0xac69f3f0
	.word	0x51a7eeec
	.word	0x040b8cec
	.word	0x02a4d22f
	.word	0xe72618ec
	.word	0xaad01c02
	.word	0x99ee2e88
	.word	0x0e6d85bc
	.word	0xccf56ab5
	.word	0x79e0c660
	.word	0x24be4025
	.word	0x0520ae5b
	.word	0xca51981a
	.word	0x58af29cd
	.word	0x612217d8
	.word	0xb8f5015e
	.word	0x8296362b
	.word	0x6ed844e8
	.word	0xe67dfe90
	.word	0x2be4b080
	.word	0x435bfbfe
	.word	0x97fb63a1
	.word	0x41355b77
	.word	0x0298bb82
	.word	0xea6576b0
	.word	0x5eee5cea
	.word	0xd148b19d
	.word	0x4abf46f6
	.word	0xcdd479aa
	.word	0x560b77ad
	.word	0x082353d8
	.word	0x29700c5a
	.word	0xe40fcf25
	.word	0xa2442aff
	.word	0xc035f2e5
	.word	0x44df3768
	.word	0x5934ecef
	.word	0x61a32d96
	.word	0x932969d2
	.word	0x3fd044ab
	.word	0xdb69b16e
	.word	0x519b8878
	.word	0x0a476ca0
	.word	0x9a3fb555
	.word	0x5a1e6ce5
	.word	0x1529a0f5
	.word	0xee6cfd23
	.word	0x0ad3ac4f
	.word	0x6e90baf6
	.word	0x41a66dd7
	.word	0xa3b4ca2d
	.word	0x8510c892
	.word	0x99e3f067
	.word	0xea7c4bd7
	.word	0x8f45dceb
	.word	0xd251d0b5
	.word	0x6f2c2128
	.word	0x72f02551
	.word	0xd595388e
	.word	0xec5603c6
	.word	0x5a150294
	.word	0xa128e13b
	.word	0x032f502d
	.word	0x4123235c
	.word	0x3d9e2df7
	.word	0x21ca4d53
	.word	0x440876e9
	.word	0x1e358aec
	.word	0xa5fa8750
	.word	0x2f17f797
	.word	0xeba1ae51
	.word	0xb5c9e85b
	.word	0xc538cc57
	.word	0xe4e7aafa
	.word	0x1d417708
	.word	0x59b169d5
	.word	0x38378fc1
	.word	0xeaf28354
	.word	0x255687a5
	.word	0x8cda74dc
	.word	0x70c724c1
	.word	0xb48ecc99
	.word	0x76148dda
	.word	0xacc53aa3
	.word	0x2f003ed2
	.word	0x3ecc214d
	.word	0x87b95dd7
	.word	0xffbcbd9c
	.word	0x46fe49b3
	.word	0x478e7c37
	.word	0x0aeb33f0
	.word	0x91221c4f
	.word	0xe598bdb3
	.word	0xb8dc3154
	.word	0xbf86ec7c
	.word	0x2ba1356d
	.word	0xfea6f42e
	.word	0xee5e020e
	.word	0xd63f5600
	.word	0xff02f925
	.word	0xae0e4056
	.word	0x7f4fc0ae
	.word	0x65dd018d
	.word	0xb5c2fbb5
	.word	0x42925036
	.word	0xf813370e
	.word	0x30003566
	.word	0x62d31d43
	.word	0xd25c19f4
	.word	0x037e4491
	.word	0x9b3ce5e5
	.word	0x4b515aed
	.word	0x8dabd956
	.word	0xb8186757
	.word	0x7382d89e
	.word	0xffa11d1d
	.word	0x386ee187
	.word	0x500b24ad
	.word	0x1c4255c4
	.word	0xec9a9722
	.word	0xffba4719
	.word	0x76cc04c3
	.word	0x7be00bcb
	.word	0xcd980bfc
	.word	0x40b7a64d
	.word	0x74be15a0
	.word	0xfc11094f
	.word	0x8c520c76
	.word	0x4ba18992
	.word	0xf2742959
	.word	0xa0e1f134
	.word	0xd0f9027a
	.word	0xfb41344b
	.word	0x621c4380
	.word	0xeebacd0d
	.word	0x0d0b9da0
	.word	0x6837d5d5
	.word	0x992fe9db
	.word	0x40e321c1
	.word	0x3b4ef507
	.word	0x9b7968c8
	.word	0xfe0c4c56
	.word	0x54202a6b
	.word	0x10467268
	.word	0xfcffc27b
	.word	0x4fd07839
	.word	0x4e415d82
	.word	0x65d6da68
	.word	0x272096cd
	.word	0x5a0f0a9d
	.word	0x020da03a
	.word	0x5ba1062c
t0_data_in_sp:
	.word	0x9c597423
	.word	0x6cc4161c
	.word	0xc945cc28
	.word	0xd9562232
	.word	0xb910fbac
	.word	0xbad72fc7
	.word	0x22976b2c
	.word	0xd210865f
	.word	t0_data_in_area0
	.word	t0_data_in_area0
	.word	0x0000000b
	.word	0x00000010
	.word	0xfffffff8
	.word	0x00000008
	.word	t0_data_in_fp
	.word	0x9049aeb8
	.word	0x59f5de5a
	.word	0x20358104
	.word	0x0ccef9fb
	.word	0xeffd348a
	.word	0x3cf75a22
	.word	0x3a15ea8a
	.word	0x341d1d83
	.word	0x9430f649
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
	.word   	0xcd644bc1	! [%fp - 0xc]
	.word   	0x4427e337	! [%fp - 0x8]
	.word   	0x27644dfa	! [%fp - 0x4]
.global t0_data_in_fp; t0_data_in_fp:
	.word	0xb5746d67
	.word	0x09cff38e
	.word	0x636630ea
	.word	0xabeae0ee
	.word	0x052cfbc6
	.word	0x92c47cc0
	.word	0x0a5447a4
	.word	0xf2c22f97
	.word	0x0614bb6b
	.word	0xd94d250f
	.word	0xac9e825b
	.word	0x427d4117
	.word	0x5aaa1571
	.word	0x8708ba9b
	.word	0x7244950e
	.word	0xe5315501
	.word	0xc18d543f
	.word	0xe34b940d
	.word	0xc5308c19
	.word	0x5496121f
	.word	0xdde8a4fd
	.word	0x87a666fb
	.word	0xaf6decca
	.word	0x3f335d6f
t0_data_in_stacktop:
	.word	0
t0_data_in_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_in_area0, 0x3546a000)
.seg "data"
t0_data_in_area0_start:
.skip 4160
t0_data_in_area0_begin:
	.word	0x4ad23c43	! t0_data_in_area0-0x20
	.word	0xbb99a091	! t0_data_in_area0-0x1c
	.word	0xf759cb33	! t0_data_in_area0-0x18
	.word	0xb3e71d6f	! t0_data_in_area0-0x14
	.word	0x4b5f9213	! t0_data_in_area0-0x10
	.word	0x9193246c	! t0_data_in_area0-0xc
	.word	0x235de941	! t0_data_in_area0-0x8
	.word	0xd4ed6d9a	! t0_data_in_area0-0x4
.global t0_data_in_area0; t0_data_in_area0:
	.word	0x591be909	! t0_data_in_area0+0x0
	.word	0xc8ce95c9	! t0_data_in_area0+0x4
	.word	0xcd56330d	! t0_data_in_area0+0x8
	.word	0xfd3a0631	! t0_data_in_area0+0xc
	.word	0xff0394d0	! t0_data_in_area0+0x10
	.word	0x568e8ede	! t0_data_in_area0+0x14
	.word	0x3fe12c72	! t0_data_in_area0+0x18
	.word	0x5a99dc3e	! t0_data_in_area0+0x1c
t0_data_in_area0_end:
.skip 3968
t0_data_in_area0_stop:

KDATA_MODULE(t0_module_data_in_shm_area, 0x27b7e000)
.seg "data"
t0_data_in_shm_area_start:
t0_data_in_shm_area_begin:
.global t0_data_in_shm_area; t0_data_in_shm_area:
	.word	0xab48b3d8	! t0_data_in_shm_area+0x0 (t0)
	.word	0x235aa754	! t0_data_in_shm_area+0x4 (t1)
	.word	0xbfa76a87	! t0_data_in_shm_area+0x8 (t0)
	.word	0xd868615d	! t0_data_in_shm_area+0xc (t1)
	.word	0x62d123de	! t0_data_in_shm_area+0x10 (t0)
	.word	0x4028206f	! t0_data_in_shm_area+0x14 (t1)
	.word	0x01003dd5	! t0_data_in_shm_area+0x18 (t0)
	.word	0xcc734622	! t0_data_in_shm_area+0x1c (t1)
	.word	0x353d5045	! t0_data_in_shm_area+0x20 (t0)
	.word	0xab307efc	! t0_data_in_shm_area+0x24 (t1)
	.word	0x6fba8425	! t0_data_in_shm_area+0x28 (t0)
	.word	0x5233901e	! t0_data_in_shm_area+0x2c (t1)
	.word	0xb8fd3e6d	! t0_data_in_shm_area+0x30 (t0)
	.word	0x86adec1a	! t0_data_in_shm_area+0x34 (t1)
	.word	0x47d2ee9d	! t0_data_in_shm_area+0x38 (t0)
	.word	0xd522c7bc	! t0_data_in_shm_area+0x3c (t1)
	.word	0xba0a1c2a	! t0_data_in_shm_area+0x40 (t0 bload)
	.word	0x780b11c3	! t0_data_in_shm_area+0x44
	.word	0x2e0eb133	! t0_data_in_shm_area+0x48
	.word	0x7d3d088e	! t0_data_in_shm_area+0x4c
	.word	0x99983cf6	! t0_data_in_shm_area+0x50
	.word	0x72c3fc79	! t0_data_in_shm_area+0x54
	.word	0xcfd7bbd9	! t0_data_in_shm_area+0x58
	.word	0x4dc8a4fb	! t0_data_in_shm_area+0x5c
	.word	0xe887da2e	! t0_data_in_shm_area+0x60
	.word	0x33185b15	! t0_data_in_shm_area+0x64
	.word	0x4187386a	! t0_data_in_shm_area+0x68
	.word	0x93fb91d3	! t0_data_in_shm_area+0x6c
	.word	0xb374635c	! t0_data_in_shm_area+0x70
	.word	0xd51e72f7	! t0_data_in_shm_area+0x74
	.word	0xc8e4d46e	! t0_data_in_shm_area+0x78
	.word	0x0cb39723	! t0_data_in_shm_area+0x7c
	.word	0x3e62c147	! t0_data_in_shm_area+0x80 (t0 bstore)
	.word	0x33df633b	! t0_data_in_shm_area+0x84
	.word	0xa3ef4738	! t0_data_in_shm_area+0x88
	.word	0xddc310de	! t0_data_in_shm_area+0x8c
	.word	0xc044e663	! t0_data_in_shm_area+0x90
	.word	0xb713de1d	! t0_data_in_shm_area+0x94
	.word	0xd0f7197c	! t0_data_in_shm_area+0x98
	.word	0x2d16e0e0	! t0_data_in_shm_area+0x9c
	.word	0x6941728a	! t0_data_in_shm_area+0xa0
	.word	0x5ea89499	! t0_data_in_shm_area+0xa4
	.word	0x61e5d224	! t0_data_in_shm_area+0xa8
	.word	0xb3bafd30	! t0_data_in_shm_area+0xac
	.word	0x32255dec	! t0_data_in_shm_area+0xb0
	.word	0x66ab3852	! t0_data_in_shm_area+0xb4
	.word	0xae0a9c63	! t0_data_in_shm_area+0xb8
	.word	0x41a31e85	! t0_data_in_shm_area+0xbc
	.word	0x2dd25cf6	! t0_data_in_shm_area+0xc0 (t1 bload)
	.word	0x42133233	! t0_data_in_shm_area+0xc4
	.word	0x232496dc	! t0_data_in_shm_area+0xc8
	.word	0x819815f1	! t0_data_in_shm_area+0xcc
	.word	0xf92b75e1	! t0_data_in_shm_area+0xd0
	.word	0xe8a1d027	! t0_data_in_shm_area+0xd4
	.word	0x812c7e4d	! t0_data_in_shm_area+0xd8
	.word	0x1c66247e	! t0_data_in_shm_area+0xdc
	.word	0x351fa128	! t0_data_in_shm_area+0xe0
	.word	0xafb22b49	! t0_data_in_shm_area+0xe4
	.word	0x01d496a7	! t0_data_in_shm_area+0xe8
	.word	0x9c9ecfb1	! t0_data_in_shm_area+0xec
	.word	0x97a8d540	! t0_data_in_shm_area+0xf0
	.word	0xdf323e9f	! t0_data_in_shm_area+0xf4
	.word	0x6c0d0aac	! t0_data_in_shm_area+0xf8
	.word	0xa077c883	! t0_data_in_shm_area+0xfc
	.word	0x4399a42e	! t0_data_in_shm_area+0x100 (t1 bstore)
	.word	0x7388db1b	! t0_data_in_shm_area+0x104
	.word	0x64c975c7	! t0_data_in_shm_area+0x108
	.word	0x2549adeb	! t0_data_in_shm_area+0x10c
	.word	0x826c7c4c	! t0_data_in_shm_area+0x110
	.word	0x1bb4530c	! t0_data_in_shm_area+0x114
	.word	0xd70a1c71	! t0_data_in_shm_area+0x118
	.word	0xd056e770	! t0_data_in_shm_area+0x11c
	.word	0x41bfb14b	! t0_data_in_shm_area+0x120
	.word	0xdee3e8d7	! t0_data_in_shm_area+0x124
	.word	0x7595c6d6	! t0_data_in_shm_area+0x128
	.word	0xec8d1500	! t0_data_in_shm_area+0x12c
	.word	0xd89a917b	! t0_data_in_shm_area+0x130
	.word	0xbeacf4e6	! t0_data_in_shm_area+0x134
	.word	0x20a421b7	! t0_data_in_shm_area+0x138
	.word	0xd14d2800	! t0_data_in_shm_area+0x13c
t0_data_in_shm_area_end:
t0_data_in_shm_area_stop:

KDATA_MODULE(t0_module_data_exp_regs, 0x2242a000)
.seg "data"
KGLOBAL(t0_data_exp_regs)
t0_data_exp_regs_start:
t0_data_exp_regs:
	.word	0x06c25c54          ! %f0
	.word	0x12764016          ! %f1
	.word	0x488e901e          ! %f2
	.word	0x8d30ecd0          ! %f3
	.word	0x8a26d631          ! %f4
	.word	0xc42ba5bd          ! %f5
	.word	0xc7516dac          ! %f6
	.word	0x11207def          ! %f7
	.word	0xa300a914          ! %f8
	.word	0xc5a36dab          ! %f9
	.word	0xcb6840de          ! %f10
	.word	0x4e60f669          ! %f11
	.word	0xa2a19dbf          ! %f12
	.word	0x397343ac          ! %f13
	.word	0x098174ca          ! %f14
	.word	0x4a314e30          ! %f15
	.word	0xeeb9f29f          ! %f16
	.word	0x077fc8f8          ! %f17
	.word	0xcada6841          ! %f18
	.word	0xc9a14c49          ! %f19
	.word	0xe9194341          ! %f20
	.word	0xd1015894          ! %f21
	.word	0xdfe8e467          ! %f22
	.word	0x8cb1fbd3          ! %f23
	.word	0x9d51f304          ! %f24
	.word	0x26e62df7          ! %f25
	.word	0xce0ce885          ! %f26
	.word	0x3f99ed48          ! %f27
	.word	0xf01c0f0e          ! %f28
	.word	0x72ddd1ef          ! %f29
	.word	0x6772df1d          ! %f30
	.word	0xa835c802          ! %f31
	.word	0xb8afdb83          ! %f32
	.word	0x61b3f1c5          ! %f33
	.word	0x3e3b903e          ! %f34
	.word	0xcf31f001          ! %f35
	.word	0x7b1f7ff4          ! %f36
	.word	0x5f5f049f          ! %f37
	.word	0xcf80651a          ! %f38
	.word	0xca0243eb          ! %f39
	.word	0x9f3a8715          ! %f40
	.word	0x2c896325          ! %f41
	.word	0x5d1fd0d5          ! %f42
	.word	0x98893753          ! %f43
	.word	0x20fd25b3          ! %f44
	.word	0xf8a1b567          ! %f45
	.word	0xcfa6f29f          ! %f46
	.word	0xff9fcd3d          ! %f47
	.word	0x31387ce4          ! %f48
	.word	0x14e9dafe          ! %f49
	.word	0x916ac504          ! %f50
	.word	0xecc436e1          ! %f51
	.word	0xde404b7f          ! %f52
	.word	0x02c9b170          ! %f53
	.word	0xa2346e82          ! %f54
	.word	0x474d1aaf          ! %f55
	.word	0x283dc2ce          ! %f56
	.word	0xb41d5cd9          ! %f57
	.word	0x7d09875b          ! %f58
	.word	0xecdbc793          ! %f59
	.word	0x528e7282          ! %f60
	.word	0x958cf6c6          ! %f61
	.word	0x38d268ad          ! %f62
	.word	0x41a7d87a          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0xd8c       ! %g1 (code pointer)
	.word	t0_data_exp_shm_area! %g2 (shared area pointer)
	.word	0xd0430f8a          ! %g3 (loop index)
	.word	SYM(t0_subr0)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0xdfb56ef3          ! %o0
	.word	0x94d994f1          ! %o1
	.word	0x215516e6          ! %o2
	.word	0x95756551          ! %o3
	.word	0x08236591          ! %o4
	.word	0xb4352cfd          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0x7e917fe6          ! %l0
	.word	0xd375c764          ! %l1
	.word	0x4e2dd8bf          ! %l2
	.word	0x4de30c13          ! %l3
	.word	0xc3b49c57          ! %l4
	.word	0x07cb6cd9          ! %l5
	.word	0xf1e2a89c          ! %l6
	.word	0xf01c54d9          ! %l7
	.word	t0_data_exp_area0   ! %i0 (area pointer)
	.word	t0_data_exp_area0   ! %i1 (area pointer)
	.word	0x0000001f          ! %i2 (byte offset)
	.word	0x00000010          ! %i3 (halfword offset)
	.word	0xfffffff8          ! %i4 (word offset)
	.word	0xffffffe8          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0x8e6f0be3          ! %y
	.word	0x00000000          ! %icc (nzvc)
	.word	0xc0000780          ! %fsr
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
t0_data_exp_mtbl_size:	.word	253
t0_data_exp_regs_end:

.skip 7708	! page align

KDATA_MODULE(t0_module_data_exp_stack, 0x246ac000)
.seg "data"
KGLOBAL(t0_data_exp_mtbl_size)
KGLOBAL(t0_data_exp_mtbl)
KGLOBAL(t0_data_exp_stack)
t0_data_exp_stack_start:
	.word	0x8f21b49a
	.word	0x98797fa5
	.word	0xa904bffa
	.word	0xe4fb3007
	.word	0xed2b2b50
	.word	0x4e149c04
	.word	0xb74dc5f4
	.word	0x6aeafd1c
	.word	0x1314f783
	.word	0xa23533d8
	.word	0x938adb16
	.word	0x62993e79
	.word	0xa5d46bac
	.word	0x00513b01
	.word	0xc41cfaf5
	.word	0xe6793a7f
	.word	0xac69f3f0
	.word	0x51a7eeec
	.word	0x040b8cec
	.word	0x02a4d22f
	.word	0xe72618ec
	.word	0xaad01c02
	.word	0x99ee2e88
	.word	0x0e6d85bc
	.word	0xccf56ab5
	.word	0x79e0c660
	.word	0x24be4025
	.word	0x0520ae5b
	.word	0xca51981a
	.word	0x58af29cd
	.word	0x612217d8
	.word	0xb8f5015e
	.word	0x8296362b
	.word	0x6ed844e8
	.word	0xe67dfe90
	.word	0x2be4b080
	.word	0x435bfbfe
	.word	0x97fb63a1
	.word	0x41355b77
	.word	0x0298bb82
	.word	0xea6576b0
	.word	0x5eee5cea
	.word	0xd148b19d
	.word	0x4abf46f6
	.word	0xcdd479aa
	.word	0x560b77ad
	.word	0x082353d8
	.word	0x29700c5a
	.word	0xe40fcf25
	.word	0xa2442aff
	.word	0xc035f2e5
	.word	0x44df3768
	.word	0x5934ecef
	.word	0x61a32d96
	.word	0x932969d2
	.word	0x3fd044ab
	.word	0xdb69b16e
	.word	0x519b8878
	.word	0x0a476ca0
	.word	0x9a3fb555
	.word	0x5a1e6ce5
	.word	0x1529a0f5
	.word	0xee6cfd23
	.word	0x0ad3ac4f
	.word	0x6e90baf6
	.word	0x41a66dd7
	.word	0xa3b4ca2d
	.word	0x8510c892
	.word	0x99e3f067
	.word	0xea7c4bd7
	.word	0x8f45dceb
	.word	0xd251d0b5
	.word	0x6f2c2128
	.word	0x72f02551
	.word	0xd595388e
	.word	0xec5603c6
	.word	0x5a150294
	.word	0xa128e13b
	.word	0x032f502d
	.word	0x4123235c
	.word	0x3d9e2df7
	.word	0x21ca4d53
	.word	0x440876e9
	.word	0x1e358aec
	.word	0xa5fa8750
	.word	0x2f17f797
	.word	0xeba1ae51
	.word	0xb5c9e85b
	.word	0xc538cc57
	.word	0xe4e7aafa
	.word	0x1d417708
	.word	0x59b169d5
	.word	0x38378fc1
	.word	0xeaf28354
	.word	0x255687a5
	.word	0x8cda74dc
	.word	0x70c724c1
	.word	0xb48ecc99
	.word	0x76148dda
	.word	0xacc53aa3
	.word	0x2f003ed2
	.word	0x3ecc214d
	.word	0x87b95dd7
	.word	0xffbcbd9c
	.word	0x46fe49b3
	.word	0x478e7c37
	.word	0x0aeb33f0
	.word	0x91221c4f
	.word	0xe598bdb3
	.word	0xb8dc3154
	.word	0xbf86ec7c
	.word	0x2ba1356d
	.word	0xfea6f42e
	.word	0xee5e020e
	.word	0xd63f5600
	.word	0xff02f925
	.word	0xae0e4056
	.word	0x7f4fc0ae
	.word	0x65dd018d
	.word	0xb5c2fbb5
	.word	0x42925036
	.word	0xf813370e
	.word	0x30003566
	.word	0x62d31d43
	.word	0xd25c19f4
	.word	0x037e4491
	.word	0x9b3ce5e5
	.word	0x4b515aed
	.word	0x8dabd956
	.word	0xb8186757
	.word	0x7382d89e
	.word	0xffa11d1d
	.word	0x386ee187
	.word	0x500b24ad
	.word	0x1c4255c4
	.word	0xec9a9722
	.word	0xffba4719
	.word	0x76cc04c3
	.word	0x7be00bcb
	.word	0xcd980bfc
	.word	0x40b7a64d
	.word	0x74be15a0
	.word	0xfc11094f
	.word	0x8c520c76
	.word	0x4ba18992
	.word	0xf2742959
	.word	0xa0e1f134
	.word	0xd0f9027a
	.word	0xfb41344b
	.word	0x621c4380
	.word	0xeebacd0d
	.word	0x0d0b9da0
	.word	0x6837d5d5
	.word	0x992fe9db
	.word	0x40e321c1
	.word	0x3b4ef507
	.word	0x9b7968c8
	.word	0xfe0c4c56
	.word	0x54202a6b
	.word	0x10467268
	.word	0xfcffc27b
	.word	0x4fd07839
	.word	0x4e415d82
	.word	0x65d6da68
	.word	0x272096cd
	.word	0x5a0f0a9d
	.word	0x020da03a
	.word	0x5ba1062c
t0_data_exp_sp:
	.word	0x9c597423
	.word	0x6cc4161c
	.word	0xc945cc28
	.word	0xd9562232
	.word	0xb910fbac
	.word	0xbad72fc7
	.word	0x22976b2c
	.word	0xd210865f
	.word	t0_data_exp_area0
	.word	t0_data_exp_area0
	.word	0x0000000b
	.word	0x00000010
	.word	0xfffffff8
	.word	0x00000008
	.word	t0_data_exp_fp
	.word	0x9049aeb8
	.word	0x59f5de5a
	.word	0x20358104
	.word	0x0ccef9fb
	.word	0xeffd348a
	.word	0x3cf75a22
	.word	0x3a15ea8a
	.word	0x341d1d83
	.word	0x9430f649
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
	.word   	0xcd644bc1	! [%fp - 0xc]
	.word   	0x4427e337	! [%fp - 0x8]
	.word   	0x27644dfa	! [%fp - 0x4]
t0_data_exp_fp:
	.word	0xb5746d67
	.word	0x09cff38e
	.word	0x636630ea
	.word	0xabeae0ee
	.word	0x052cfbc6
	.word	0x92c47cc0
	.word	0x0a5447a4
	.word	0xf2c22f97
	.word	0x0614bb6b
	.word	0xd94d250f
	.word	0xac9e825b
	.word	0x427d4117
	.word	0x5aaa1571
	.word	0x8708ba9b
	.word	0x7244950e
	.word	0xe5315501
	.word	0xc18d543f
	.word	0xe34b940d
	.word	0xc5308c19
	.word	0x5496121f
	.word	0xdde8a4fd
	.word	0x87a666fb
	.word	0xaf6decca
	.word	0x3f335d6f
t0_data_exp_stacktop:
	.word	0
t0_data_exp_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_exp_area0, 0x256a2000)
.seg "data"
t0_data_exp_area0_start:
.skip 4160
t0_data_exp_area0_begin:
	.word	0x4ad23c43	! t0_data_exp_area0-0x20
	.word	0xbb99a091	! t0_data_exp_area0-0x1c
	.word	0xf759cb33	! t0_data_exp_area0-0x18
	.word	0xb3e71d6f	! t0_data_exp_area0-0x14
	.word	0x4b5f9213	! t0_data_exp_area0-0x10
	.word	0x9193246c	! t0_data_exp_area0-0xc
	.word	0x235de941	! t0_data_exp_area0-0x8
	.word	0xd4ed6d9a	! t0_data_exp_area0-0x4
.global t0_data_exp_area0; t0_data_exp_area0:
	.word	0x591be909	! t0_data_exp_area0+0x0
	.word	0xc8ce95c9	! t0_data_exp_area0+0x4
	.word	0xcd56330d	! t0_data_exp_area0+0x8
	.word	0xfd3a0631	! t0_data_exp_area0+0xc
	.word	0xff0394d0	! t0_data_exp_area0+0x10
	.word	0x568e8ede	! t0_data_exp_area0+0x14
	.word	0x3fe12c72	! t0_data_exp_area0+0x18
	.word	0x5a99dc3e	! t0_data_exp_area0+0x1c
t0_data_exp_area0_end:
.skip 3968
t0_data_exp_area0_stop:

KDATA_MODULE(t0_module_data_exp_shm_area, 0x3632e000)
.seg "data"
t0_data_exp_shm_area_start:
t0_data_exp_shm_area_begin:
.global t0_data_exp_shm_area; t0_data_exp_shm_area:
	.word	0xab48b3d8	! t0_data_exp_shm_area+0x0 (t0)
	.word	0x235aa754	! t0_data_exp_shm_area+0x4 (t1)
	.word	0xbfa76a87	! t0_data_exp_shm_area+0x8 (t0)
	.word	0xd868615d	! t0_data_exp_shm_area+0xc (t1)
	.word	0x62d123de	! t0_data_exp_shm_area+0x10 (t0)
	.word	0x4028206f	! t0_data_exp_shm_area+0x14 (t1)
	.word	0x01003dd5	! t0_data_exp_shm_area+0x18 (t0)
	.word	0xcc734622	! t0_data_exp_shm_area+0x1c (t1)
	.word	0x353d5045	! t0_data_exp_shm_area+0x20 (t0)
	.word	0xab307efc	! t0_data_exp_shm_area+0x24 (t1)
	.word	0x6fba8425	! t0_data_exp_shm_area+0x28 (t0)
	.word	0x5233901e	! t0_data_exp_shm_area+0x2c (t1)
	.word	0xb8fd3e6d	! t0_data_exp_shm_area+0x30 (t0)
	.word	0x86adec1a	! t0_data_exp_shm_area+0x34 (t1)
	.word	0x47d2ee9d	! t0_data_exp_shm_area+0x38 (t0)
	.word	0xd522c7bc	! t0_data_exp_shm_area+0x3c (t1)
	.word	0xba0a1c2a	! t0_data_exp_shm_area+0x40 (t0 bload)
	.word	0x780b11c3	! t0_data_exp_shm_area+0x44
	.word	0x2e0eb133	! t0_data_exp_shm_area+0x48
	.word	0x7d3d088e	! t0_data_exp_shm_area+0x4c
	.word	0x99983cf6	! t0_data_exp_shm_area+0x50
	.word	0x72c3fc79	! t0_data_exp_shm_area+0x54
	.word	0xcfd7bbd9	! t0_data_exp_shm_area+0x58
	.word	0x4dc8a4fb	! t0_data_exp_shm_area+0x5c
	.word	0xe887da2e	! t0_data_exp_shm_area+0x60
	.word	0x33185b15	! t0_data_exp_shm_area+0x64
	.word	0x4187386a	! t0_data_exp_shm_area+0x68
	.word	0x93fb91d3	! t0_data_exp_shm_area+0x6c
	.word	0xb374635c	! t0_data_exp_shm_area+0x70
	.word	0xd51e72f7	! t0_data_exp_shm_area+0x74
	.word	0xc8e4d46e	! t0_data_exp_shm_area+0x78
	.word	0x0cb39723	! t0_data_exp_shm_area+0x7c
	.word	0x3e62c147	! t0_data_exp_shm_area+0x80 (t0 bstore)
	.word	0x33df633b	! t0_data_exp_shm_area+0x84
	.word	0xa3ef4738	! t0_data_exp_shm_area+0x88
	.word	0xddc310de	! t0_data_exp_shm_area+0x8c
	.word	0xc044e663	! t0_data_exp_shm_area+0x90
	.word	0xb713de1d	! t0_data_exp_shm_area+0x94
	.word	0xd0f7197c	! t0_data_exp_shm_area+0x98
	.word	0x2d16e0e0	! t0_data_exp_shm_area+0x9c
	.word	0x6941728a	! t0_data_exp_shm_area+0xa0
	.word	0x5ea89499	! t0_data_exp_shm_area+0xa4
	.word	0x61e5d224	! t0_data_exp_shm_area+0xa8
	.word	0xb3bafd30	! t0_data_exp_shm_area+0xac
	.word	0x32255dec	! t0_data_exp_shm_area+0xb0
	.word	0x66ab3852	! t0_data_exp_shm_area+0xb4
	.word	0xae0a9c63	! t0_data_exp_shm_area+0xb8
	.word	0x41a31e85	! t0_data_exp_shm_area+0xbc
	.word	0x2dd25cf6	! t0_data_exp_shm_area+0xc0 (t1 bload)
	.word	0x42133233	! t0_data_exp_shm_area+0xc4
	.word	0x232496dc	! t0_data_exp_shm_area+0xc8
	.word	0x819815f1	! t0_data_exp_shm_area+0xcc
	.word	0xf92b75e1	! t0_data_exp_shm_area+0xd0
	.word	0xe8a1d027	! t0_data_exp_shm_area+0xd4
	.word	0x812c7e4d	! t0_data_exp_shm_area+0xd8
	.word	0x1c66247e	! t0_data_exp_shm_area+0xdc
	.word	0x351fa128	! t0_data_exp_shm_area+0xe0
	.word	0xafb22b49	! t0_data_exp_shm_area+0xe4
	.word	0x01d496a7	! t0_data_exp_shm_area+0xe8
	.word	0x9c9ecfb1	! t0_data_exp_shm_area+0xec
	.word	0x97a8d540	! t0_data_exp_shm_area+0xf0
	.word	0xdf323e9f	! t0_data_exp_shm_area+0xf4
	.word	0x6c0d0aac	! t0_data_exp_shm_area+0xf8
	.word	0xa077c883	! t0_data_exp_shm_area+0xfc
	.word	0x4399a42e	! t0_data_exp_shm_area+0x100 (t1 bstore)
	.word	0x7388db1b	! t0_data_exp_shm_area+0x104
	.word	0x64c975c7	! t0_data_exp_shm_area+0x108
	.word	0x2549adeb	! t0_data_exp_shm_area+0x10c
	.word	0x826c7c4c	! t0_data_exp_shm_area+0x110
	.word	0x1bb4530c	! t0_data_exp_shm_area+0x114
	.word	0xd70a1c71	! t0_data_exp_shm_area+0x118
	.word	0xd056e770	! t0_data_exp_shm_area+0x11c
	.word	0x41bfb14b	! t0_data_exp_shm_area+0x120
	.word	0xdee3e8d7	! t0_data_exp_shm_area+0x124
	.word	0x7595c6d6	! t0_data_exp_shm_area+0x128
	.word	0xec8d1500	! t0_data_exp_shm_area+0x12c
	.word	0xd89a917b	! t0_data_exp_shm_area+0x130
	.word	0xbeacf4e6	! t0_data_exp_shm_area+0x134
	.word	0x20a421b7	! t0_data_exp_shm_area+0x138
	.word	0xd14d2800	! t0_data_exp_shm_area+0x13c
t0_data_exp_shm_area_end:
t0_data_exp_shm_area_stop:

!    kaos version   4.2
!    thread         1
!    icount         5000
!    targetid       NIAGARA:SIM
!    hostid         NIAGARA:5.8
!    areas          1
!    areasize       64
!    areaoffset     4160
!    ncache         0
!    emulate_ncache 1
!    pagesize       8192
!    invsize        0
!    codecount      5004
!    code           254ac000
!    entry          254ac000
!    fsr_exceptions 00000000
!    fsr_roundmode  00000004
!    fsr_mask       c0000fff
!    seed           d3d0902a6327
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

KTEXT_MODULE(t1_module_ktbl, 0x654ac000)
.seg "text"
	KGLOBAL(t1_ktbl)
t1_ktbl_page_begin:
.global t1_kref; t1_kref:
	.skip 0
t1_ktbl:
	.word	0xd6fe501c	! t1_kref+0x0:   	swapa	[%i1 + %i4]0x80, %o3
	.word	0xa9b40dcc	! t1_kref+0x4:   	fnand	%f16, %f12, %f20
	.word	0xe168a001	! t1_kref+0x8:   	prefetch	%g2 + 1, 16
	.word	0xd8566002	! t1_kref+0xc:   	ldsh	[%i1 + 2], %o4
	.word	0xc93e6000	! t1_kref+0x10:   	std	%f4, [%i1]
	.word	0xa5a14926	! t1_kref+0x14:   	fmuls	%f5, %f6, %f18
	.word	0x89a589ce	! t1_kref+0x18:   	fdivd	%f22, %f14, %f4
	.word	0x981db753	! t1_kref+0x1c:   	xor	%l6, -0x8ad, %o4
	.word	0xd19f1a59	! t1_kref+0x20:   	ldda	[%i4 + %i1]0xd2, %f8
	.word	0xf830a024	! t1_kref+0x24:   	sth	%i4, [%g2 + 0x24]
	.word	0xe630a034	! t1_kref+0x28:   	sth	%l3, [%g2 + 0x34]
	.word	0xd11fbcb8	! t1_kref+0x2c:   	ldd	[%fp - 0x348], %f8
	.word	0xed00a01c	! t1_kref+0x30:   	ld	[%g2 + 0x1c], %f22
	.word	0x81aa4a34	! t1_kref+0x34:   	fcmps	%fcc0, %f9, %f20
	.word	0xc9be1a1a	! t1_kref+0x38:   	stda	%f4, [%i0 + %i2]0xd0
	.word	0xe03e001d	! t1_kref+0x3c:   	std	%l0, [%i0 + %i5]
	.word	0xa7a0c9b9	! t1_kref+0x40:   	fdivs	%f3, %f25, %f19
	.word	0x2a480005	! t1_kref+0x44:   	bcs,a,pt	%icc, _kref+0x58
	.word	0xe828a024	! t1_kref+0x48:   	stb	%l4, [%g2 + 0x24]
	.word	0xe428a00d	! t1_kref+0x4c:   	stb	%l2, [%g2 + 0xd]
	.word	0x9fa01a44	! t1_kref+0x50:   	fdtoi	%f4, %f15
	.word	0x99246e5b	! t1_kref+0x54:   	mulscc	%l1, 0xe5b, %o4
	.word	0xe40876ec	! t1_kref+0x58:   	ldub	[%g1 - 0x914], %l2
	.word	0xa41ca00c	! t1_kref+0x5c:   	xor	%l2, 0xc, %l2
	.word	0xe42876ec	! t1_kref+0x60:   	stb	%l2, [%g1 - 0x914]
	.word	0x81d876ec	! t1_kref+0x64:   	flush	%g1 - 0x914
	.word	0xd8070019	! t1_kref+0x68:   	ld	[%i4 + %i1], %o4
	.word	0xb5b10f92	! t1_kref+0x6c:   	for	%f4, %f18, %f26
	.word	0x9832f3d8	! t1_kref+0x70:   	orn	%o3, -0xc28, %o4
	.word	0x81de72e5	! t1_kref+0x74:   	flush	%i1 - 0xd1b
	.word	0x98668011	! t1_kref+0x78:   	subc	%i2, %l1, %o4
	.word	0x8da00152	! t1_kref+0x7c:   	fabsd	%f18, %f6
	.word	0x98f23ceb	! t1_kref+0x80:   	udivcc	%o0, -0x315, %o4
	.word	0x97a01894	! t1_kref+0x84:   	fitos	%f20, %f11
	.word	0x98c0000a	! t1_kref+0x88:   	addccc	%g0, %o2, %o4
	.word	0x81870000	! t1_kref+0x8c:   	wr	%i4, %g0, %y
	.word	0x81db8009	! t1_kref+0x90:   	flush	%sp + %o1
	.word	0xafa209a4	! t1_kref+0x94:   	fdivs	%f8, %f4, %f23
	.word	0x81dbbed2	! t1_kref+0x98:   	flush	%sp - 0x12e
2:	.word	0xd8464000	! t1_kref+0x9c:   	ldsw	[%i1], %o4
	.word	0xc168a0c4	! t1_kref+0xa0:   	prefetch	%g2 + 0xc4, 0
	.word	0xd80e3ff6	! t1_kref+0xa4:   	ldub	[%i0 - 0xa], %o4
	.word	0xe3b8a100	! t1_kref+0xa8:   	stda	%f48, [%g2 + 0x100]%asi
	.word	0xc030a00c	! t1_kref+0xac:   	clrh	[%g2 + 0xc]
	.word	0x9e007704	! t1_kref+0xb0:   	add	%g1, -0x8fc, %o7
!	.word	0x2e8217d3	! t1_kref+0xb4:   	bvs,a	SYM(t1_subr3)
	   	bvs,a	SYM(t1_subr3)
	.word	0x981d2bfc	! t1_kref+0xb8:   	xor	%l4, 0xbfc, %o4
	.word	0xe276401d	! t1_kref+0xbc:   	stx	%l1, [%i1 + %i5]
	.word	0xd8263ffc	! t1_kref+0xc0:   	st	%o4, [%i0 - 4]
	.word	0x95b2ca79	! t1_kref+0xc4:   	fpadd32s	%f11, %f25, %f10
	.word	0xe6263ff0	! t1_kref+0xc8:   	st	%l3, [%i0 - 0x10]
	.word	0x982d0009	! t1_kref+0xcc:   	andn	%l4, %o1, %o4
	.word	0x9db2896f	! t1_kref+0xd0:   	fpmerge	%f10, %f15, %f14
	.word	0x9813000b	! t1_kref+0xd4:   	or	%o4, %o3, %o4
	.word	0x9845748a	! t1_kref+0xd8:   	addc	%l5, -0xb76, %o4
	.word	0xd920a014	! t1_kref+0xdc:   	st	%f12, [%g2 + 0x14]
	.word	0x1927e337	! t1_kref+0xe0:   	sethi	%hi(0x9f8cdc00), %o4
	.word	0xd5270018	! t1_kref+0xe4:   	st	%f10, [%i4 + %i0]
	.word	0x983b225b	! t1_kref+0xe8:   	xnor	%o4, 0x25b, %o4
	.word	0xd8566008	! t1_kref+0xec:   	ldsh	[%i1 + 8], %o4
	.word	0xa1a0054c	! t1_kref+0xf0:   	fsqrtd	%f12, %f16
	.word	0x8143e040	! t1_kref+0xf4:   	membar	0x40
	.word	0xfdee501a	! t1_kref+0xf8:   	prefetcha	%i1 + %i2, 30
	.word	0x81ac0ad4	! t1_kref+0xfc:   	fcmped	%fcc0, %f16, %f20
	.word	0x81ad4a2a	! t1_kref+0x100:   	fcmps	%fcc0, %f21, %f10
	.word	0xb1b20e28	! t1_kref+0x104:   	fands	%f8, %f8, %f24
	.word	0xeb68a0c3	! t1_kref+0x108:   	prefetch	%g2 + 0xc3, 21
	.word	0x99b404d8	! t1_kref+0x10c:   	fcmpne32	%f16, %f24, %o4
	.word	0xb5a01931	! t1_kref+0x110:   	fstod	%f17, %f26
	.word	0x31800008	! t1_kref+0x114:   	fba,a	_kref+0x134
	.word	0x8da01903	! t1_kref+0x118:   	fitod	%f3, %f6
	.word	0x8da00552	! t1_kref+0x11c:   	fsqrtd	%f18, %f6
	.word	0x28480003	! t1_kref+0x120:   	bleu,a,pt	%icc, _kref+0x12c
	.word	0x9fa00529	! t1_kref+0x124:   	fsqrts	%f9, %f15
	.word	0xda28a037	! t1_kref+0x128:   	stb	%o5, [%g2 + 0x37]
	.word	0x993a4008	! t1_kref+0x12c:   	sra	%o1, %o0, %o4
	.word	0x81ab8ac8	! t1_kref+0x130:   	fcmped	%fcc0, %f14, %f8
	.word	0x3d480006	! t1_kref+0x134:   	fbule,a,pt	%fcc0, _kref+0x14c
	.word	0xe9ee101d	! t1_kref+0x138:   	prefetcha	%i0 + %i5, 20
	.word	0x8fa00525	! t1_kref+0x13c:   	fsqrts	%f5, %f7
	.word	0xfd6e2018	! t1_kref+0x140:   	prefetch	%i0 + 0x18, 30
	.word	0x8da0052c	! t1_kref+0x144:   	fsqrts	%f12, %f6
	.word	0x89a0110c	! t1_kref+0x148:   	fxtod	%f12, %f4
	.word	0x99b24280	! t1_kref+0x14c:   	array32	%o1, %g0, %o4
	.word	0xa5b48711	! t1_kref+0x150:   	fmuld8sux16	%f18, %f17, %f18
	.word	0xd856001b	! t1_kref+0x154:   	ldsh	[%i0 + %i3], %o4
	.word	0x99b604d4	! t1_kref+0x158:   	fcmpne32	%f24, %f20, %o4
	.word	0xf428a014	! t1_kref+0x15c:   	stb	%i2, [%g2 + 0x14]
	.word	0xeb865000	! t1_kref+0x160:   	lda	[%i1]0x80, %f21
	.word	0xdaff1018	! t1_kref+0x164:   	swapa	[%i4 + %i0]0x80, %o5
	.word	0x9db40a54	! t1_kref+0x168:   	fpadd32	%f16, %f20, %f14
	.word	0xe40877f8	! t1_kref+0x16c:   	ldub	[%g1 - 0x808], %l2
	.word	0xa41ca00c	! t1_kref+0x170:   	xor	%l2, 0xc, %l2
	.word	0xe42877f8	! t1_kref+0x174:   	stb	%l2, [%g1 - 0x808]
	.word	0x81d877f8	! t1_kref+0x178:   	flush	%g1 - 0x808
	.word	0xe83e7ff0	! t1_kref+0x17c:   	std	%l4, [%i1 - 0x10]
	.word	0xb5b20a82	! t1_kref+0x180:   	fpsub16	%f8, %f2, %f26
	.word	0x989c6254	! t1_kref+0x184:   	xorcc	%l1, 0x254, %o4
	.word	0x99b3cf70	! t1_kref+0x188:   	fornot1s	%f15, %f16, %f12
	.word	0x81ab8ac8	! t1_kref+0x18c:   	fcmped	%fcc0, %f14, %f8
	.word	0x989a001a	! t1_kref+0x190:   	xorcc	%o0, %i2, %o4
	.word	0x9da00552	! t1_kref+0x194:   	fsqrtd	%f18, %f14
	.word	0x98658011	! t1_kref+0x198:   	subc	%l6, %l1, %o4
	.word	0x98e2c014	! t1_kref+0x19c:   	subccc	%o3, %l4, %o4
	.word	0x98db3d01	! t1_kref+0x1a0:   	smulcc	%o4, -0x2ff, %o4
	.word	0x98d23944	! t1_kref+0x1a4:   	umulcc	%o0, -0x6bc, %o4
2:	.word	0x98dd3338	! t1_kref+0x1a8:   	smulcc	%l4, -0xcc8, %o4
	.word	0xe220a02c	! t1_kref+0x1ac:   	st	%l1, [%g2 + 0x2c]
	.word	0xd8100018	! t1_kref+0x1b0:   	lduh	[%g0 + %i0], %o4
	.word	0x26800007	! t1_kref+0x1b4:   	bl,a	_kref+0x1d0
	.word	0x9812fa00	! t1_kref+0x1b8:   	or	%o3, -0x600, %o4
	.word	0x29480008	! t1_kref+0x1bc:   	fbl,a,pt	%fcc0, _kref+0x1dc
	.word	0xda367ffe	! t1_kref+0x1c0:   	sth	%o5, [%i1 - 2]
	.word	0xada289aa	! t1_kref+0x1c4:   	fdivs	%f10, %f10, %f22
	.word	0x98f4fd5d	! t1_kref+0x1c8:   	udivcc	%l3, -0x2a3, %o4
	.word	0x98c32358	! t1_kref+0x1cc:   	addccc	%o4, 0x358, %o4
	.word	0x98144000	! t1_kref+0x1d0:   	or	%l1, %g0, %o4
	.word	0x91a309b6	! t1_kref+0x1d4:   	fdivs	%f12, %f22, %f8
	.word	0xa5b10f94	! t1_kref+0x1d8:   	for	%f4, %f20, %f18
	.word	0xf7ee501a	! t1_kref+0x1dc:   	prefetcha	%i1 + %i2, 27
	.word	0x98bb4011	! t1_kref+0x1e0:   	xnorcc	%o5, %l1, %o4
	.word	0x99b3034b	! t1_kref+0x1e4:   	alignaddrl	%o4, %o3, %o4
	.word	0x9da0190c	! t1_kref+0x1e8:   	fitod	%f12, %f14
	.word	0xd11e001d	! t1_kref+0x1ec:   	ldd	[%i0 + %i5], %f8
	.word	0x89a0103a	! t1_kref+0x1f0:   	fstox	%f26, %f4
	.word	0x99244015	! t1_kref+0x1f4:   	mulscc	%l1, %l5, %o4
	.word	0x989d75d1	! t1_kref+0x1f8:   	xorcc	%l5, -0xa2f, %o4
	.word	0x98b8228e	! t1_kref+0x1fc:   	xnorcc	%g0, 0x28e, %o4
	.word	0x95b18d16	! t1_kref+0x200:   	fandnot1	%f6, %f22, %f10
	.word	0xd886501c	! t1_kref+0x204:   	lda	[%i1 + %i4]0x80, %o4
	.word	0xd93f4018	! t1_kref+0x208:   	std	%f12, [%i5 + %i0]
	.word	0x985d2bdc	! t1_kref+0x20c:   	smul	%l4, 0xbdc, %o4
	.word	0xabb44df6	! t1_kref+0x210:   	fnands	%f17, %f22, %f21
	.word	0xd810a03e	! t1_kref+0x214:   	lduh	[%g2 + 0x3e], %o4
	.word	0x81844000	! t1_kref+0x218:   	wr	%l1, %g0, %y
	.word	0xc030a03c	! t1_kref+0x21c:   	clrh	[%g2 + 0x3c]
	.word	0xd856001b	! t1_kref+0x220:   	ldsh	[%i0 + %i3], %o4
	.word	0xe4087894	! t1_kref+0x224:   	ldub	[%g1 - 0x76c], %l2
	.word	0xa41ca00c	! t1_kref+0x228:   	xor	%l2, 0xc, %l2
	.word	0xe4287894	! t1_kref+0x22c:   	stb	%l2, [%g1 - 0x76c]
	.word	0x81d87894	! t1_kref+0x230:   	flush	%g1 - 0x76c
	.word	0x2a800004	! t1_kref+0x234:   	bcs,a	_kref+0x244
	.word	0xe620a03c	! t1_kref+0x238:   	st	%l3, [%g2 + 0x3c]
	.word	0x2b480006	! t1_kref+0x23c:   	fbug,a,pt	%fcc0, _kref+0x254
	.word	0xd030a014	! t1_kref+0x240:   	sth	%o0, [%g2 + 0x14]
2:	.word	0xa7a0052a	! t1_kref+0x244:   	fsqrts	%f10, %f19
	.word	0x8143c000	! t1_kref+0x248:   	stbar
	.word	0x98db0013	! t1_kref+0x24c:   	smulcc	%o4, %l3, %o4
	.word	0x81580000	! t1_kref+0x250:   	flushw
	.word	0x99400000	! t1_kref+0x254:   	mov	%y, %o4
	.word	0x988a4017	! t1_kref+0x258:   	andcc	%o1, %l7, %o4
	.word	0xd80e8018	! t1_kref+0x25c:   	ldub	[%i2 + %i0], %o4
	.word	0xa5a54937	! t1_kref+0x260:   	fmuls	%f21, %f23, %f18
	.word	0xc7ee5016	! t1_kref+0x264:   	prefetcha	%i1 + %l6, 3
	.word	0xe720a034	! t1_kref+0x268:   	st	%f19, [%g2 + 0x34]
	.word	0xd03e4000	! t1_kref+0x26c:   	std	%o0, [%i1]
	.word	0x98fec00b	! t1_kref+0x270:   	sdivcc	%i3, %o3, %o4
	.word	0x99b4854a	! t1_kref+0x274:   	fcmpeq16	%f18, %f10, %o4
	.word	0xe91fbd28	! t1_kref+0x278:   	ldd	[%fp - 0x2d8], %f20
	.word	0x983a8015	! t1_kref+0x27c:   	xnor	%o2, %l5, %o4
	.word	0x81aa8a2d	! t1_kref+0x280:   	fcmps	%fcc0, %f10, %f13
	.word	0xe228a034	! t1_kref+0x284:   	stb	%l1, [%g2 + 0x34]
	.word	0x89a00544	! t1_kref+0x288:   	fsqrtd	%f4, %f4
	.word	0x98158015	! t1_kref+0x28c:   	or	%l6, %l5, %o4
	sethi	%hi(1f), %o7
	jmpl	%o7+%lo(1f), %g1
	.empty
	.word	0xe3b8a0c0	! t1_kref+0x298:   	stda	%f48, [%g2 + 0xc0]%asi
1:	.word	0xe428a005	! t1_kref+0x29c:   	stb	%l2, [%g2 + 5]
	.word	0xf500a03c	! t1_kref+0x2a0:   	ld	[%g2 + 0x3c], %f26
	.word	0x81ab8ace	! t1_kref+0x2a4:   	fcmped	%fcc0, %f14, %f14
	.word	0xd520a03c	! t1_kref+0x2a8:   	st	%f10, [%g2 + 0x3c]
	.word	0xa9a00533	! t1_kref+0x2ac:   	fsqrts	%f19, %f20
	sethi	%hi(2f), %o7
	.word	0xe40be2fc	! t1_kref+0x2b4:   	ldub	[%o7 + 0x2fc], %l2
	.word	0xa41ca00c	! t1_kref+0x2b8:   	xor	%l2, 0xc, %l2
	.word	0xe42be2fc	! t1_kref+0x2bc:   	stb	%l2, [%o7 + 0x2fc]
	.word	0x81dbe2fc	! t1_kref+0x2c0:   	flush	%o7 + 0x2fc
	.word	0xadb1cdb0	! t1_kref+0x2c4:   	fxors	%f7, %f16, %f22
	.word	0xb1a0014e	! t1_kref+0x2c8:   	fabsd	%f14, %f24
	.word	0x99b2011b	! t1_kref+0x2cc:   	edge32	%o0, %i3, %o4
	.word	0x98c2f58b	! t1_kref+0x2d0:   	addccc	%o3, -0xa75, %o4
	.word	0x8182c000	! t1_kref+0x2d4:   	wr	%o3, %g0, %y
	.word	0x2d480007	! t1_kref+0x2d8:   	fbg,a,pt	%fcc0, _kref+0x2f4
	.word	0xe168a006	! t1_kref+0x2dc:   	prefetch	%g2 + 6, 16
	.word	0xe9ee101d	! t1_kref+0x2e0:   	prefetcha	%i0 + %i5, 20
	.word	0xa1b30d92	! t1_kref+0x2e4:   	fxor	%f12, %f18, %f16
	.word	0xe320a004	! t1_kref+0x2e8:   	st	%f17, [%g2 + 4]
	.word	0xe1267ff8	! t1_kref+0x2ec:   	st	%f16, [%i1 - 8]
	.word	0x98def905	! t1_kref+0x2f0:   	smulcc	%i3, -0x6fb, %o4
	.word	0xd800a024	! t1_kref+0x2f4:   	ld	[%g2 + 0x24], %o4
	.word	0xc7ee1017	! t1_kref+0x2f8:   	prefetcha	%i0 + %l7, 3
2:	.word	0xd8070019	! t1_kref+0x2fc:   	ld	[%i4 + %i1], %o4
	.word	0x992e8016	! t1_kref+0x300:   	sll	%i2, %l6, %o4
	.word	0x93a00527	! t1_kref+0x304:   	fsqrts	%f7, %f9
	.word	0x2d800005	! t1_kref+0x308:   	fbg,a	_kref+0x31c
	.word	0x99408000	! t1_kref+0x30c:   	mov	%ccr, %o4
	.word	0xada64936	! t1_kref+0x310:   	fmuls	%f25, %f22, %f22
	.word	0xd630a02c	! t1_kref+0x314:   	sth	%o3, [%g2 + 0x2c]
	.word	0x98650013	! t1_kref+0x318:   	subc	%l4, %l3, %o4
	.word	0xc0f61000	! t1_kref+0x31c:   	stxa	%g0, [%i0]0x80
	.word	0xa1a00530	! t1_kref+0x320:   	fsqrts	%f16, %f16
	.word	0xdd9e501d	! t1_kref+0x324:   	ldda	[%i1 + %i5]0x80, %f14
	.word	0x98e73efa	! t1_kref+0x328:   	subccc	%i4, -0x106, %o4
	.word	0x89a00546	! t1_kref+0x32c:   	fsqrtd	%f6, %f4
	.word	0xd11e6010	! t1_kref+0x330:   	ldd	[%i1 + 0x10], %f8
	.word	0xede6500c	! t1_kref+0x334:   	casa	[%i1]0x80, %o4, %l6
	.word	0x2b800007	! t1_kref+0x338:   	fbug,a	_kref+0x354
	.word	0x98b80000	! t1_kref+0x33c:   	xnorcc	%g0, %g0, %o4
	.word	0x993b6005	! t1_kref+0x340:   	sra	%o5, 0x5, %o4
	.word	0x99b540f5	! t1_kref+0x344:   	edge16ln	%l5, %l5, %o4
	.word	0x29480002	! t1_kref+0x348:   	fbl,a,pt	%fcc0, _kref+0x350
	.word	0x99408000	! t1_kref+0x34c:   	mov	%ccr, %o4
	.word	0x81dd0012	! t1_kref+0x350:   	flush	%l4 + %l2
	.word	0x97a018d2	! t1_kref+0x354:   	fdtos	%f18, %f11
	.word	0xb3a00539	! t1_kref+0x358:   	fsqrts	%f25, %f25
	.word	0x98fa801c	! t1_kref+0x35c:   	sdivcc	%o2, %i4, %o4
	.word	0xada00529	! t1_kref+0x360:   	fsqrts	%f9, %f22
	.word	0x8da00544	! t1_kref+0x364:   	fsqrtd	%f4, %f6
	.word	0x81da800f	! t1_kref+0x368:   	flush	%o2 + %o7
	.word	0x81ad0ab4	! t1_kref+0x36c:   	fcmpes	%fcc0, %f20, %f20
	.word	0xe430a034	! t1_kref+0x370:   	sth	%l2, [%g2 + 0x34]
	.word	0x98f4c013	! t1_kref+0x374:   	udivcc	%l3, %l3, %o4
	.word	0x81db8017	! t1_kref+0x378:   	flush	%sp + %l7
	.word	0xd806600c	! t1_kref+0x37c:   	ld	[%i1 + 0xc], %o4
	.word	0xd856401b	! t1_kref+0x380:   	ldsh	[%i1 + %i3], %o4
	.word	0xec266010	! t1_kref+0x384:   	st	%l6, [%i1 + 0x10]
	.word	0x9895ffff	! t1_kref+0x388:   	orcc	%l7, -0x1, %o4
	.word	0x9922ab60	! t1_kref+0x38c:   	mulscc	%o2, 0xb60, %o4
	.word	0xaba01a54	! t1_kref+0x390:   	fdtoi	%f20, %f21
	.word	0x8ba28835	! t1_kref+0x394:   	fadds	%f10, %f21, %f5
	.word	0x9da608af	! t1_kref+0x398:   	fsubs	%f24, %f15, %f14
	.word	0xe6e81018	! t1_kref+0x39c:   	ldstuba	[%g0 + %i0]0x80, %l3
	.word	0x87a01a50	! t1_kref+0x3a0:   	fdtoi	%f16, %f3
	.word	0xe9ee101b	! t1_kref+0x3a4:   	prefetcha	%i0 + %i3, 20
	.word	0x99b48544	! t1_kref+0x3a8:   	fcmpeq16	%f18, %f4, %o4
	.word	0xc3ee500a	! t1_kref+0x3ac:   	prefetcha	%i1 + %o2, 1
	.word	0x28800008	! t1_kref+0x3b0:   	bleu,a	_kref+0x3d0
	.word	0xd22e401a	! t1_kref+0x3b4:   	stb	%o1, [%i1 + %i2]
	.word	0xa3a2c936	! t1_kref+0x3b8:   	fmuls	%f11, %f22, %f17
	.word	0x989eb0c4	! t1_kref+0x3bc:   	xorcc	%i2, -0xf3c, %o4
	.word	0x39480005	! t1_kref+0x3c0:   	fbuge,a,pt	%fcc0, _kref+0x3d4
	.word	0x91a2c9ac	! t1_kref+0x3c4:   	fdivs	%f11, %f12, %f8
	.word	0x98dc801a	! t1_kref+0x3c8:   	smulcc	%l2, %i2, %o4
	.word	0x99400000	! t1_kref+0x3cc:   	mov	%y, %o4
	.word	0x98032ed1	! t1_kref+0x3d0:   	add	%o4, 0xed1, %o4
	.word	0x9de3bfa0	! t1_kref+0x3d4:   	save	%sp, -0x60, %sp
	.word	0x99ee6f8b	! t1_kref+0x3d8:   	restore	%i1, 0xf8b, %o4
	.word	0xd420a02c	! t1_kref+0x3dc:   	st	%o2, [%g2 + 0x2c]
	.word	0xe468a02f	! t1_kref+0x3e0:   	ldstub	[%g2 + 0x2f], %l2
	.word	0xadb146a9	! t1_kref+0x3e4:   	fmul8x16al	%f5, %f9, %f22
	.word	0x98953e9a	! t1_kref+0x3e8:   	orcc	%l4, -0x166, %o4
	.word	0xf5ee501b	! t1_kref+0x3ec:   	prefetcha	%i1 + %i3, 26
	.word	0x98e2b392	! t1_kref+0x3f0:   	subccc	%o2, -0xc6e, %o4
	.word	0xd808a00d	! t1_kref+0x3f4:   	ldub	[%g2 + 0xd], %o4
	.word	0x99b440da	! t1_kref+0x3f8:   	edge16l	%l1, %i2, %o4
	.word	0xf139401d	! t1_kref+0x3fc:   	std	%f24, [%g5 + %i5]
	.word	0x9894c017	! t1_kref+0x400:   	orcc	%l3, %l7, %o4
	.word	0x81dcf882	! t1_kref+0x404:   	flush	%l3 - 0x77e
	.word	0x89a01a2f	! t1_kref+0x408:   	fstoi	%f15, %f4
	.word	0x981ec000	! t1_kref+0x40c:   	xor	%i3, %g0, %o4
	.word	0xabaa8036	! t1_kref+0x410:   	fmovsue	%fcc0, %f22, %f21
	.word	0xe500a02c	! t1_kref+0x414:   	ld	[%g2 + 0x2c], %f18
	.word	0xee280019	! t1_kref+0x418:   	stb	%l7, [%g0 + %i1]
	.word	0xa9a01911	! t1_kref+0x41c:   	fitod	%f17, %f20
	.word	0xe91f4018	! t1_kref+0x420:   	ldd	[%i5 + %i0], %f20
	.word	0xc12e2010	! t1_kref+0x424:   	st	%fsr, [%i0 + 0x10]
	.word	0xd8466018	! t1_kref+0x428:   	ldsw	[%i1 + 0x18], %o4
	.word	0x98e6a8ec	! t1_kref+0x42c:   	subccc	%i2, 0x8ec, %o4
	.word	0xc0780019	! t1_kref+0x430:   	swap	[%g0 + %i1], %g0
	.word	0x98a4ffde	! t1_kref+0x434:   	subcc	%l3, -0x22, %o4
	.word	0xe3b8a0c0	! t1_kref+0x438:   	stda	%f48, [%g2 + 0xc0]%asi
	.word	0xe6363fe6	! t1_kref+0x43c:   	sth	%l3, [%i0 - 0x1a]
	.word	0xe8262014	! t1_kref+0x440:   	st	%l4, [%i0 + 0x14]
	.word	0x3f800006	! t1_kref+0x444:   	fbo,a	_kref+0x45c
	.word	0xe27f0019	! t1_kref+0x448:   	swap	[%i4 + %i1], %l1
	.word	0x9da01919	! t1_kref+0x44c:   	fitod	%f25, %f14
	.word	0xd856c019	! t1_kref+0x450:   	ldsh	[%i3 + %i1], %o4
	.word	0xd0a65000	! t1_kref+0x454:   	sta	%o0, [%i1]0x80
	.word	0x98f5e82b	! t1_kref+0x458:   	udivcc	%l7, 0x82b, %o4
	.word	0x2d800007	! t1_kref+0x45c:   	fbg,a	_kref+0x478
	.word	0xe1be588a	! t1_kref+0x460:   	stda	%f16, [%i1 + %o2]0xc4
	.word	0xaba14929	! t1_kref+0x464:   	fmuls	%f5, %f9, %f21
	.word	0xd620a03c	! t1_kref+0x468:   	st	%o3, [%g2 + 0x3c]
	.word	0x9ba00130	! t1_kref+0x46c:   	fabss	%f16, %f13
	.word	0x91a00538	! t1_kref+0x470:   	fsqrts	%f24, %f8
	.word	0x29480006	! t1_kref+0x474:   	fbl,a,pt	%fcc0, _kref+0x48c
	.word	0x9925f7a6	! t1_kref+0x478:   	mulscc	%l7, -0x85a, %o4
	.word	0xf836c019	! t1_kref+0x47c:   	sth	%i4, [%i3 + %i1]
	.word	0xd03e7fe0	! t1_kref+0x480:   	std	%o0, [%i1 - 0x20]
	.word	0x81ab8aa4	! t1_kref+0x484:   	fcmpes	%fcc0, %f14, %f4
	.word	0xb3a38932	! t1_kref+0x488:   	fmuls	%f14, %f18, %f25
	.word	0xe268a016	! t1_kref+0x48c:   	ldstub	[%g2 + 0x16], %l1
	.word	0xd80e3ffb	! t1_kref+0x490:   	ldub	[%i0 - 5], %o4
	.word	0x35480008	! t1_kref+0x494:   	fbue,a,pt	%fcc0, _kref+0x4b4
	.word	0x98a58013	! t1_kref+0x498:   	subcc	%l6, %l3, %o4
	.word	0xe220a02c	! t1_kref+0x49c:   	st	%l1, [%g2 + 0x2c]
	.word	0xb1a01905	! t1_kref+0x4a0:   	fitod	%f5, %f24
	.word	0x98054013	! t1_kref+0x4a4:   	add	%l5, %l3, %o4
	.word	0xada01919	! t1_kref+0x4a8:   	fitod	%f25, %f22
	.word	0xe700a03c	! t1_kref+0x4ac:   	ld	[%g2 + 0x3c], %f19
	.word	0xd03f4018	! t1_kref+0x4b0:   	std	%o0, [%i5 + %i0]
	.word	0x81ac8a48	! t1_kref+0x4b4:   	fcmpd	%fcc0, %f18, %f8
	.word	0x98d54008	! t1_kref+0x4b8:   	umulcc	%l5, %o0, %o4
	.word	0x99b20594	! t1_kref+0x4bc:   	fcmpgt32	%f8, %f20, %o4
	.word	0xf476001d	! t1_kref+0x4c0:   	stx	%i2, [%i0 + %i5]
	.word	0xd07e200c	! t1_kref+0x4c4:   	swap	[%i0 + 0xc], %o0
	.word	0x81850000	! t1_kref+0x4c8:   	wr	%l4, %g0, %y
	.word	0x81a98ad6	! t1_kref+0x4cc:   	fcmped	%fcc0, %f6, %f22
	.word	0xe9be5888	! t1_kref+0x4d0:   	stda	%f20, [%i1 + %o0]0xc4
	.word	0xe81e3ff8	! t1_kref+0x4d4:   	ldd	[%i0 - 8], %l4
	.word	0xcb20a00c	! t1_kref+0x4d8:   	st	%f5, [%g2 + 0xc]
	.word	0xd840a01c	! t1_kref+0x4dc:   	ldsw	[%g2 + 0x1c], %o4
	.word	0x99a00532	! t1_kref+0x4e0:   	fsqrts	%f18, %f12
	.word	0xcd20a00c	! t1_kref+0x4e4:   	st	%f6, [%g2 + 0xc]
	.word	0x9ba01a29	! t1_kref+0x4e8:   	fstoi	%f9, %f13
	.word	0x81850000	! t1_kref+0x4ec:   	wr	%l4, %g0, %y
	.word	0x8da00533	! t1_kref+0x4f0:   	fsqrts	%f19, %f6
	.word	0x99400000	! t1_kref+0x4f4:   	mov	%y, %o4
	.word	0x9db30d40	! t1_kref+0x4f8:   	fnot1	%f12, %f14
	.word	0x81848000	! t1_kref+0x4fc:   	wr	%l2, %g0, %y
	.word	0xf1266018	! t1_kref+0x500:   	st	%f24, [%i1 + 0x18]
	.word	0x81accab1	! t1_kref+0x504:   	fcmpes	%fcc0, %f19, %f17
	.word	0xaba01a23	! t1_kref+0x508:   	fstoi	%f3, %f21
	.word	0xd848a00e	! t1_kref+0x50c:   	ldsb	[%g2 + 0xe], %o4
	.word	0xd800a024	! t1_kref+0x510:   	ld	[%g2 + 0x24], %o4
	.word	0xed20a01c	! t1_kref+0x514:   	st	%f22, [%g2 + 0x1c]
	.word	0x93a0002d	! t1_kref+0x518:   	fmovs	%f13, %f9
	.word	0x91b2c970	! t1_kref+0x51c:   	fpmerge	%f11, %f16, %f8
	.word	0x98d80009	! t1_kref+0x520:   	smulcc	%g0, %o1, %o4
	.word	0xf820a004	! t1_kref+0x524:   	st	%i4, [%g2 + 4]
	.word	0x98433f58	! t1_kref+0x528:   	addc	%o4, -0xa8, %o4
!	.word	0x244a16b5	! t1_kref+0x52c:   	ble,a,pt	%icc, SYM(t1_subr3)
	   	ble,a,pt	%icc, SYM(t1_subr3)
	.word	0x9e006298	! t1_kref+0x530:   	add	%g1, 0x298, %o7
	.word	0x89a01883	! t1_kref+0x534:   	fitos	%f3, %f4
	.word	0xc807bfec	! t1_kref+0x538:   	ld	[%fp - 0x14], %g4
	.word	0x9fa00534	! t1_kref+0x53c:   	fsqrts	%f20, %f15
	.word	0x98f4800c	! t1_kref+0x540:   	udivcc	%l2, %o4, %o4
	.word	0xb3b40cb6	! t1_kref+0x544:   	fandnot2s	%f16, %f22, %f25
	.word	0xf836c018	! t1_kref+0x548:   	sth	%i4, [%i3 + %i0]
	.word	0x81830000	! t1_kref+0x54c:   	wr	%o4, %g0, %y
	.word	0x99b28988	! t1_kref+0x550:   	bshuffle	%f10, %f8, %f12
	.word	0xc07e7ff8	! t1_kref+0x554:   	swap	[%i1 - 8], %g0
	.word	0xe720a034	! t1_kref+0x558:   	st	%f19, [%g2 + 0x34]
	.word	0x981d000c	! t1_kref+0x55c:   	xor	%l4, %o4, %o4
	.word	0x99b684d6	! t1_kref+0x560:   	fcmpne32	%f26, %f22, %o4
	.word	0xdf267ff4	! t1_kref+0x564:   	st	%f15, [%i1 - 0xc]
	.word	0x81dcf83d	! t1_kref+0x568:   	flush	%l3 - 0x7c3
	.word	0xda30a02c	! t1_kref+0x56c:   	sth	%o5, [%g2 + 0x2c]
	.word	0xcd1e6008	! t1_kref+0x570:   	ldd	[%i1 + 8], %f6
	.word	0xf428a027	! t1_kref+0x574:   	stb	%i2, [%g2 + 0x27]
	.word	0x98dd800d	! t1_kref+0x578:   	smulcc	%l6, %o5, %o4
	.word	0x95a00556	! t1_kref+0x57c:   	fsqrtd	%f22, %f10
	.word	0xc020a02c	! t1_kref+0x580:   	clr	[%g2 + 0x2c]
	.word	0xe3b8a0c0	! t1_kref+0x584:   	stda	%f48, [%g2 + 0xc0]%asi
	.word	0x91b00f38	! t1_kref+0x588:   	fsrc2s	%f24, %f8
	.word	0x3b480001	! t1_kref+0x58c:   	fble,a,pt	%fcc0, _kref+0x590
	.word	0x99b304c8	! t1_kref+0x590:   	fcmpne32	%f12, %f8, %o4
	.word	0x91a01116	! t1_kref+0x594:   	fxtod	%f22, %f8
	.word	0x28480006	! t1_kref+0x598:   	bleu,a,pt	%icc, _kref+0x5b0
	.word	0x9835401c	! t1_kref+0x59c:   	orn	%l5, %i4, %o4
	.word	0xd67e2010	! t1_kref+0x5a0:   	swap	[%i0 + 0x10], %o3
	.word	0x25480007	! t1_kref+0x5a4:   	fblg,a,pt	%fcc0, _kref+0x5c0
	.word	0x9da0052e	! t1_kref+0x5a8:   	fsqrts	%f14, %f14
	.word	0x9ba9c027	! t1_kref+0x5ac:   	fmovsu	%fcc0, %f7, %f13
	.word	0x9922c008	! t1_kref+0x5b0:   	mulscc	%o3, %o0, %o4
	.word	0x3e800004	! t1_kref+0x5b4:   	bvc,a	_kref+0x5c4
	.word	0x98db4012	! t1_kref+0x5b8:   	smulcc	%o5, %l2, %o4
	.word	0x9855779d	! t1_kref+0x5bc:   	umul	%l5, -0x863, %o4
	.word	0x98534011	! t1_kref+0x5c0:   	umul	%o5, %l1, %o4
	.word	0x81828000	! t1_kref+0x5c4:   	wr	%o2, %g0, %y
	.word	0xa9b28f8c	! t1_kref+0x5c8:   	for	%f10, %f12, %f20
	.word	0x28480001	! t1_kref+0x5cc:   	bleu,a,pt	%icc, _kref+0x5d0
	.word	0x98e2c00c	! t1_kref+0x5d0:   	subccc	%o3, %o4, %o4
	.word	0xa5a00531	! t1_kref+0x5d4:   	fsqrts	%f17, %f18
	.word	0x98930015	! t1_kref+0x5d8:   	orcc	%o4, %l5, %o4
	.word	0xd93e3fe8	! t1_kref+0x5dc:   	std	%f12, [%i0 - 0x18]
	.word	0xe636401b	! t1_kref+0x5e0:   	sth	%l3, [%i1 + %i3]
	.word	0xe5380019	! t1_kref+0x5e4:   	std	%f18, [%g0 + %i1]
	.word	0x89b2ca27	! t1_kref+0x5e8:   	fpadd16s	%f11, %f7, %f4
	.word	0x98dec00a	! t1_kref+0x5ec:   	smulcc	%i3, %o2, %o4
	.word	0x99282009	! t1_kref+0x5f0:   	sll	%g0, 0x9, %o4
	.word	0xe3b8a0c0	! t1_kref+0x5f4:   	stda	%f48, [%g2 + 0xc0]%asi
	.word	0xa7a2c9a5	! t1_kref+0x5f8:   	fdivs	%f11, %f5, %f19
	.word	0x91a2c824	! t1_kref+0x5fc:   	fadds	%f11, %f4, %f8
	.word	0x982de7b1	! t1_kref+0x600:   	andn	%l7, 0x7b1, %o4
	.word	0x99b40518	! t1_kref+0x604:   	fcmpgt16	%f16, %f24, %o4
	.word	0xef68a001	! t1_kref+0x608:   	prefetch	%g2 + 1, 23
	.word	0x98a4eb5c	! t1_kref+0x60c:   	subcc	%l3, 0xb5c, %o4
	.word	0x98a32fa6	! t1_kref+0x610:   	subcc	%o4, 0xfa6, %o4
	.word	0xd840a03c	! t1_kref+0x614:   	ldsw	[%g2 + 0x3c], %o4
	.word	0x8db4cd39	! t1_kref+0x618:   	fandnot1s	%f19, %f25, %f6
	.word	0xa3a01a27	! t1_kref+0x61c:   	fstoi	%f7, %f17
	.word	0x99a01a2a	! t1_kref+0x620:   	fstoi	%f10, %f12
	.word	0xe53f4019	! t1_kref+0x624:   	std	%f18, [%i5 + %i1]
	.word	0x983a647c	! t1_kref+0x628:   	xnor	%o1, 0x47c, %o4
	.word	0xd856c018	! t1_kref+0x62c:   	ldsh	[%i3 + %i0], %o4
	.word	0x98d58008	! t1_kref+0x630:   	umulcc	%l6, %o0, %o4
	.word	0x989ebcfb	! t1_kref+0x634:   	xorcc	%i2, -0x305, %o4
	.word	0x98f5b4f2	! t1_kref+0x638:   	udivcc	%l6, -0xb0e, %o4
	.word	0xec7e6018	! t1_kref+0x63c:   	swap	[%i1 + 0x18], %l6
	.word	0x31800002	! t1_kref+0x640:   	fba,a	_kref+0x648
	.word	0x9863000d	! t1_kref+0x644:   	subc	%o4, %o5, %o4
	.word	0x98a50011	! t1_kref+0x648:   	subcc	%l4, %l1, %o4
	.word	0xb1a2c9b2	! t1_kref+0x64c:   	fdivs	%f11, %f18, %f24
	.word	0x81dac001	! t1_kref+0x650:   	flush	%o3 + %g1
	.word	0x97a01a25	! t1_kref+0x654:   	fstoi	%f5, %f11
	.word	0x99b5c071	! t1_kref+0x658:   	edge8ln	%l7, %l1, %o4
	.word	0x9da000c4	! t1_kref+0x65c:   	fnegd	%f4, %f14
	.word	0x9846c01a	! t1_kref+0x660:   	addc	%i3, %i2, %o4
	.word	0x8ba248b2	! t1_kref+0x664:   	fsubs	%f9, %f18, %f5
	.word	0x98858013	! t1_kref+0x668:   	addcc	%l6, %l3, %o4
	.word	0xd428a015	! t1_kref+0x66c:   	stb	%o2, [%g2 + 0x15]
	.word	0xd808a025	! t1_kref+0x670:   	ldub	[%g2 + 0x25], %o4
	.word	0x23800001	! t1_kref+0x674:   	fbne,a	_kref+0x678
	.word	0x98628014	! t1_kref+0x678:   	subc	%o2, %l4, %o4
	.word	0xa5a30852	! t1_kref+0x67c:   	faddd	%f12, %f18, %f18
	.word	0x98a271d2	! t1_kref+0x680:   	subcc	%o1, -0xe2e, %o4
	.word	0xa5b48f92	! t1_kref+0x684:   	for	%f18, %f18, %f18
	.word	0x95b00c20	! t1_kref+0x688:   	fzeros	%f10
	.word	0xa7a0002d	! t1_kref+0x68c:   	fmovs	%f13, %f19
	.word	0x8143e040	! t1_kref+0x690:   	membar	0x40
	.word	0x98c4e3a4	! t1_kref+0x694:   	addccc	%l3, 0x3a4, %o4
	.word	0xea6e401a	! t1_kref+0x698:   	ldstub	[%i1 + %i2], %l5
	.word	0xd1be589c	! t1_kref+0x69c:   	stda	%f8, [%i1 + %i4]0xc4
	.word	0x81da732d	! t1_kref+0x6a0:   	flush	%o1 - 0xcd3
	.word	0x98fc401b	! t1_kref+0x6a4:   	sdivcc	%l1, %i3, %o4
	.word	0x980720eb	! t1_kref+0x6a8:   	add	%i4, 0xeb, %o4
	.word	0x97aac023	! t1_kref+0x6ac:   	fmovsge	%fcc0, %f3, %f11
	.word	0xd8163ff0	! t1_kref+0x6b0:   	lduh	[%i0 - 0x10], %o4
	.word	0x3d800008	! t1_kref+0x6b4:   	fbule,a	_kref+0x6d4
	.word	0x8da2c935	! t1_kref+0x6b8:   	fmuls	%f11, %f21, %f6
	.word	0xb1a0c928	! t1_kref+0x6bc:   	fmuls	%f3, %f8, %f24
	.word	0x98a4f042	! t1_kref+0x6c0:   	subcc	%l3, -0xfbe, %o4
	.word	0xec200018	! t1_kref+0x6c4:   	st	%l6, [%g0 + %i0]
	.word	0x98f4801c	! t1_kref+0x6c8:   	udivcc	%l2, %i4, %o4
	.word	0xd0200019	! t1_kref+0x6cc:   	st	%o0, [%g0 + %i1]
	.word	0xe91fbe10	! t1_kref+0x6d0:   	ldd	[%fp - 0x1f0], %f20
	.word	0x988ca923	! t1_kref+0x6d4:   	andcc	%l2, 0x923, %o4
	.word	0xe93e0000	! t1_kref+0x6d8:   	std	%f20, [%i0]
	.word	0x9fc00004	! t1_kref+0x6dc:   	call	%g0 + %g4
	.word	0xb1a00535	! t1_kref+0x6e0:   	fsqrts	%f21, %f24
	.word	0x9923400d	! t1_kref+0x6e4:   	mulscc	%o5, %o5, %o4
	.word	0xd8063fe8	! t1_kref+0x6e8:   	ld	[%i0 - 0x18], %o4
	.word	0x81dae781	! t1_kref+0x6ec:   	flush	%o3 + 0x781
	.word	0xa1a01a2e	! t1_kref+0x6f0:   	fstoi	%f14, %f16
	.word	0xa5b24ae5	! t1_kref+0x6f4:   	fpsub32s	%f9, %f5, %f18
	.word	0xafa01a58	! t1_kref+0x6f8:   	fdtoi	%f24, %f23
	.word	0x81adca30	! t1_kref+0x6fc:   	fcmps	%fcc0, %f23, %f16
	.word	0xa5b1090c	! t1_kref+0x700:   	faligndata	%f4, %f12, %f18
	.word	0xd810a034	! t1_kref+0x704:   	lduh	[%g2 + 0x34], %o4
	.word	0x99b28153	! t1_kref+0x708:   	edge32l	%o2, %l3, %o4
	.word	0xd810a016	! t1_kref+0x70c:   	lduh	[%g2 + 0x16], %o4
	.word	0xc020a03c	! t1_kref+0x710:   	clr	[%g2 + 0x3c]
	.word	0x98c2a0b3	! t1_kref+0x714:   	addccc	%o2, 0xb3, %o4
	.word	0x81ad8ab4	! t1_kref+0x718:   	fcmpes	%fcc0, %f22, %f20
	.word	0x89b14723	! t1_kref+0x71c:   	fmuld8ulx16	%f5, %f3, %f4
	.word	0x98668000	! t1_kref+0x720:   	subc	%i2, %g0, %o4
	.word	0xa9a309da	! t1_kref+0x724:   	fdivd	%f12, %f26, %f20
	.word	0x99a60929	! t1_kref+0x728:   	fmuls	%f24, %f9, %f12
	.word	0xb5a34935	! t1_kref+0x72c:   	fmuls	%f13, %f21, %f26
	.word	0xa1b4cf6b	! t1_kref+0x730:   	fornot1s	%f19, %f11, %f16
	.word	0xaba01a4a	! t1_kref+0x734:   	fdtoi	%f10, %f21
	.word	0xd80e600a	! t1_kref+0x738:   	ldub	[%i1 + 0xa], %o4
	.word	0x81df2471	! t1_kref+0x73c:   	flush	%i4 + 0x471
	.word	0xa5a208b9	! t1_kref+0x740:   	fsubs	%f8, %f25, %f18
	.word	0xadb1862c	! t1_kref+0x744:   	fmul8x16	%f6, %f12, %f22
	.word	0x21800004	! t1_kref+0x748:   	fbn,a	_kref+0x758
	.word	0xa1a00550	! t1_kref+0x74c:   	fsqrtd	%f16, %f16
	.word	0x81b01027	! t1_kref+0x750:   	siam	0x7
	.word	0xb1a01911	! t1_kref+0x754:   	fitod	%f17, %f24
	.word	0xd3a71018	! t1_kref+0x758:   	sta	%f9, [%i4 + %i0]0x80
	.word	0xadb00c00	! t1_kref+0x75c:   	fzero	%f22
	.word	0xd8162008	! t1_kref+0x760:   	lduh	[%i0 + 8], %o4
	.word	0x980263fe	! t1_kref+0x764:   	add	%o1, 0x3fe, %o4
	.word	0x81ae4ab1	! t1_kref+0x768:   	fcmpes	%fcc0, %f25, %f17
	.word	0xd8067fe8	! t1_kref+0x76c:   	ld	[%i1 - 0x18], %o4
	.word	0x98d37fa2	! t1_kref+0x770:   	umulcc	%o5, -0x5e, %o4
	.word	0x9de3bfa0	! t1_kref+0x774:   	save	%sp, -0x60, %sp
	.word	0xb0566664	! t1_kref+0x778:   	umul	%i1, 0x664, %i0
	.word	0x99ee751e	! t1_kref+0x77c:   	restore	%i1, -0xae2, %o4
	.word	0xada01888	! t1_kref+0x780:   	fitos	%f8, %f22
	.word	0x81ad4a35	! t1_kref+0x784:   	fcmps	%fcc0, %f21, %f21
	.word	0x9882f59e	! t1_kref+0x788:   	addcc	%o3, -0xa62, %o4
	.word	0xa1a1482c	! t1_kref+0x78c:   	fadds	%f5, %f12, %f16
	.word	0x98bd400a	! t1_kref+0x790:   	xnorcc	%l5, %o2, %o4
	.word	0x33800003	! t1_kref+0x794:   	fbe,a	_kref+0x7a0
	.word	0xd856c018	! t1_kref+0x798:   	ldsh	[%i3 + %i0], %o4
	.word	0x99b280d5	! t1_kref+0x79c:   	edge16l	%o2, %l5, %o4
	.word	0x81824000	! t1_kref+0x7a0:   	wr	%o1, %g0, %y
	.word	0x981261f3	! t1_kref+0x7a4:   	or	%o1, 0x1f3, %o4
	.word	0x81aa8ace	! t1_kref+0x7a8:   	fcmped	%fcc0, %f10, %f14
	.word	0xe476001d	! t1_kref+0x7ac:   	stx	%l2, [%i0 + %i5]
	.word	0x93a54833	! t1_kref+0x7b0:   	fadds	%f21, %f19, %f9
	sethi	%hi(2f), %o7
	.word	0xe40be3d0	! t1_kref+0x7b8:   	ldub	[%o7 + 0x3d0], %l2
	.word	0xa41ca00c	! t1_kref+0x7bc:   	xor	%l2, 0xc, %l2
	.word	0xe42be3d0	! t1_kref+0x7c0:   	stb	%l2, [%o7 + 0x3d0]
	.word	0x81dbe3d0	! t1_kref+0x7c4:   	flush	%o7 + 0x3d0
	.word	0xa1a588af	! t1_kref+0x7c8:   	fsubs	%f22, %f15, %f16
	.word	0x989c8008	! t1_kref+0x7cc:   	xorcc	%l2, %o0, %o4
2:	.word	0x992d2006	! t1_kref+0x7d0:   	sll	%l4, 0x6, %o4
	.word	0x9db50a08	! t1_kref+0x7d4:   	fpadd16	%f20, %f8, %f14
	.word	0x91a01926	! t1_kref+0x7d8:   	fstod	%f6, %f8
	.word	0x98dc8008	! t1_kref+0x7dc:   	smulcc	%l2, %o0, %o4
	.word	0x98d2abbc	! t1_kref+0x7e0:   	umulcc	%o2, 0xbbc, %o4
	.word	0x98bd6551	! t1_kref+0x7e4:   	xnorcc	%l5, 0x551, %o4
	.word	0xd028a007	! t1_kref+0x7e8:   	stb	%o0, [%g2 + 7]
	.word	0x9db18a84	! t1_kref+0x7ec:   	fpsub16	%f6, %f4, %f14
	.word	0xe100a014	! t1_kref+0x7f0:   	ld	[%g2 + 0x14], %f16
	.word	0x39800007	! t1_kref+0x7f4:   	fbuge,a	_kref+0x810
	.word	0xd8562014	! t1_kref+0x7f8:   	ldsh	[%i0 + 0x14], %o4
	.word	0x992c601b	! t1_kref+0x7fc:   	sll	%l1, 0x1b, %o4
	.word	0x99b68314	! t1_kref+0x800:   	alignaddr	%i2, %l4, %o4
	.word	0xb5a0054c	! t1_kref+0x804:   	fsqrtd	%f12, %f26
	.word	0x98648012	! t1_kref+0x808:   	subc	%l2, %l2, %o4
	.word	0x33480002	! t1_kref+0x80c:   	fbe,a,pt	%fcc0, _kref+0x814
	.word	0xd0267fec	! t1_kref+0x810:   	st	%o0, [%i1 - 0x14]
	.word	0xd19e1000	! t1_kref+0x814:   	ldda	[%i0]0x80, %f8
	.word	0xc99f5a18	! t1_kref+0x818:   	ldda	[%i5 + %i0]0xd0, %f4
	.word	0x98b50014	! t1_kref+0x81c:   	orncc	%l4, %l4, %o4
	.word	0xa3a109a5	! t1_kref+0x820:   	fdivs	%f4, %f5, %f17
	.word	0x2b800002	! t1_kref+0x824:   	fbug,a	_kref+0x82c
	.word	0xd420a004	! t1_kref+0x828:   	st	%o2, [%g2 + 4]
	.word	0xd430a004	! t1_kref+0x82c:   	sth	%o2, [%g2 + 4]
	.word	0x98c20015	! t1_kref+0x830:   	addccc	%o0, %l5, %o4
	.word	0xa7b34e30	! t1_kref+0x834:   	fands	%f13, %f16, %f19
	.word	0xe0380019	! t1_kref+0x838:   	std	%l0, [%g0 + %i1]
	.word	0xc59f5019	! t1_kref+0x83c:   	ldda	[%i5 + %i1]0x80, %f2
	.word	0x98f5eea9	! t1_kref+0x840:   	udivcc	%l7, 0xea9, %o4
	.word	0x3f480002	! t1_kref+0x844:   	fbo,a,pt	%fcc0, _kref+0x84c
	.word	0x989af811	! t1_kref+0x848:   	xorcc	%o3, -0x7ef, %o4
	.word	0x8143c000	! t1_kref+0x84c:   	stbar
	.word	0xd4774018	! t1_kref+0x850:   	stx	%o2, [%i5 + %i0]
	.word	0x1906d817	! t1_kref+0x854:   	sethi	%hi(0x1b605c00), %o4
	.word	0x35800006	! t1_kref+0x858:   	fbue,a	_kref+0x870
	.word	0x87a00532	! t1_kref+0x85c:   	fsqrts	%f18, %f3
	.word	0xa5a2cd39	! t1_kref+0x860:   	fsmuld	%f11, %f25, %f18
	call	SYM(t1_subr3)
	.word	0x98670016	! t1_kref+0x868:   	subc	%i4, %l6, %o4
	.word	0x27480008	! t1_kref+0x86c:   	fbul,a,pt	%fcc0, _kref+0x88c
	.word	0xd620a034	! t1_kref+0x870:   	st	%o3, [%g2 + 0x34]
	.word	0x99b28456	! t1_kref+0x874:   	fcmpne16	%f10, %f22, %o4
	.word	0x95a309d6	! t1_kref+0x878:   	fdivd	%f12, %f22, %f10
	.word	0xa5a409cc	! t1_kref+0x87c:   	fdivd	%f16, %f12, %f18
	.word	0xf8b65000	! t1_kref+0x880:   	stha	%i4, [%i1]0x80
	.word	0xa9b2c968	! t1_kref+0x884:   	fpmerge	%f11, %f8, %f20
	.word	0x99700011	! t1_kref+0x888:   	popc	%l1, %o4
	.word	0x9892c000	! t1_kref+0x88c:   	orcc	%o3, %g0, %o4
	.word	0xe630a00c	! t1_kref+0x890:   	sth	%l3, [%g2 + 0xc]
	.word	0x1902e045	! t1_kref+0x894:   	sethi	%hi(0xb811400), %o4
	.word	0x9db50d60	! t1_kref+0x898:   	fnot1s	%f20, %f14
	.word	0x988b39ac	! t1_kref+0x89c:   	andcc	%o4, -0x654, %o4
	.word	0xd020a03c	! t1_kref+0x8a0:   	st	%o0, [%g2 + 0x3c]
	.word	0xb5b18f94	! t1_kref+0x8a4:   	for	%f6, %f20, %f26
	.word	0xd820a034	! t1_kref+0x8a8:   	st	%o4, [%g2 + 0x34]
	.word	0x99b4851a	! t1_kref+0x8ac:   	fcmpgt16	%f18, %f26, %o4
	.word	0xf51e4000	! t1_kref+0x8b0:   	ldd	[%i1], %f26
	.word	0x8da01923	! t1_kref+0x8b4:   	fstod	%f3, %f6
	.word	0x35800002	! t1_kref+0x8b8:   	fbue,a	_kref+0x8c0
	.word	0x98d039dc	! t1_kref+0x8bc:   	umulcc	%g0, -0x624, %o4
	sethi	%hi(2f), %o7
	.word	0xe40be10c	! t1_kref+0x8c4:   	ldub	[%o7 + 0x10c], %l2
	.word	0xa41ca00c	! t1_kref+0x8c8:   	xor	%l2, 0xc, %l2
	.word	0xe42be10c	! t1_kref+0x8cc:   	stb	%l2, [%o7 + 0x10c]
	.word	0x81dbe10c	! t1_kref+0x8d0:   	flush	%o7 + 0x10c
	.word	0x81dfbe7c	! t1_kref+0x8d4:   	flush	%fp - 0x184
	.word	0x9802000c	! t1_kref+0x8d8:   	add	%o0, %o4, %o4
	.word	0x98af0009	! t1_kref+0x8dc:   	andncc	%i4, %o1, %o4
	.word	0x81ae0ac8	! t1_kref+0x8e0:   	fcmped	%fcc0, %f24, %f8
	.word	0x8da00548	! t1_kref+0x8e4:   	fsqrtd	%f8, %f6
	.word	0x81ad8aa5	! t1_kref+0x8e8:   	fcmpes	%fcc0, %f22, %f5
	.word	0x990a7312	! t1_kref+0x8ec:   	tsubcc	%o1, -0xcee, %o4
	.word	0xa9b00fc0	! t1_kref+0x8f0:   	fone	%f20
	.word	0x98fc798f	! t1_kref+0x8f4:   	sdivcc	%l1, -0x671, %o4
	.word	0x28800005	! t1_kref+0x8f8:   	bleu,a	_kref+0x90c
	.word	0x9da01894	! t1_kref+0x8fc:   	fitos	%f20, %f14
	.word	0x3b480008	! t1_kref+0x900:   	fble,a,pt	%fcc0, _kref+0x920
	.word	0xd8080018	! t1_kref+0x904:   	ldub	[%g0 + %i0], %o4
	.word	0xd300a024	! t1_kref+0x908:   	ld	[%g2 + 0x24], %f9
2:	.word	0x98a6ff2d	! t1_kref+0x90c:   	subcc	%i3, -0xd3, %o4
	.word	0x9da58846	! t1_kref+0x910:   	faddd	%f22, %f6, %f14
	.word	0x93b44ab4	! t1_kref+0x914:   	fpsub16s	%f17, %f20, %f9
	.word	0x8143c000	! t1_kref+0x918:   	stbar
	.word	0x98c30000	! t1_kref+0x91c:   	addccc	%o4, %g0, %o4
	.word	0xd810a01c	! t1_kref+0x920:   	lduh	[%g2 + 0x1c], %o4
	.word	0x99b58280	! t1_kref+0x924:   	array32	%l6, %g0, %o4
	.word	0x8143e013	! t1_kref+0x928:   	membar	0x13
	.word	0x98c6b292	! t1_kref+0x92c:   	addccc	%i2, -0xd6e, %o4
	.word	0xb5a01914	! t1_kref+0x930:   	fitod	%f20, %f26
	.word	0x988cbbf2	! t1_kref+0x934:   	andcc	%l2, -0x40e, %o4
	.word	0xec30a03c	! t1_kref+0x938:   	sth	%l6, [%g2 + 0x3c]
	.word	0x81ab8ad4	! t1_kref+0x93c:   	fcmped	%fcc0, %f14, %f20
	.word	0x982b001b	! t1_kref+0x940:   	andn	%o4, %i3, %o4
	.word	0x9927366b	! t1_kref+0x944:   	mulscc	%i4, -0x995, %o4
	.word	0xadb00774	! t1_kref+0x948:   	fpack16	%f20, %f22
	.word	0xa1a01a30	! t1_kref+0x94c:   	fstoi	%f16, %f16
	.word	0xd80e3ff4	! t1_kref+0x950:   	ldub	[%i0 - 0xc], %o4
	.word	0x9806800b	! t1_kref+0x954:   	add	%i2, %o3, %o4
	.word	0xe53e4000	! t1_kref+0x958:   	std	%f18, [%i1]
	.word	0x2b480002	! t1_kref+0x95c:   	fbug,a,pt	%fcc0, _kref+0x964
	.word	0x9db34ca6	! t1_kref+0x960:   	fandnot2s	%f13, %f6, %f14
	.word	0xd51fbc58	! t1_kref+0x964:   	ldd	[%fp - 0x3a8], %f10
	.word	0xe7ee101c	! t1_kref+0x968:   	prefetcha	%i0 + %i4, 19
	.word	0xeb6e2000	! t1_kref+0x96c:   	prefetch	%i0, 21
	sethi	%hi(2f), %o7
	.word	0xe40be190	! t1_kref+0x974:   	ldub	[%o7 + 0x190], %l2
	.word	0xa41ca00c	! t1_kref+0x978:   	xor	%l2, 0xc, %l2
	.word	0xe42be190	! t1_kref+0x97c:   	stb	%l2, [%o7 + 0x190]
	.word	0x81dbe190	! t1_kref+0x980:   	flush	%o7 + 0x190
	.word	0x8186c000	! t1_kref+0x984:   	wr	%i3, %g0, %y
	.word	0x98853be2	! t1_kref+0x988:   	addcc	%l4, -0x41e, %o4
	.word	0xee16c000	! t1_kref+0x98c:   	lduh	[%i3], %l7
2:	.word	0xda20a004	! t1_kref+0x990:   	st	%o5, [%g2 + 4]
	.word	0xada00523	! t1_kref+0x994:   	fsqrts	%f3, %f22
	.word	0x99b60a4c	! t1_kref+0x998:   	fpadd32	%f24, %f12, %f12
	.word	0xe828a03c	! t1_kref+0x99c:   	stb	%l4, [%g2 + 0x3c]
	.word	0x27480002	! t1_kref+0x9a0:   	fbul,a,pt	%fcc0, _kref+0x9a8
	.word	0xf828a007	! t1_kref+0x9a4:   	stb	%i4, [%g2 + 7]
	.word	0x9928000b	! t1_kref+0x9a8:   	sll	%g0, %o3, %o4
	.word	0xd850a02e	! t1_kref+0x9ac:   	ldsh	[%g2 + 0x2e], %o4
	.word	0xe968a08b	! t1_kref+0x9b0:   	prefetch	%g2 + 0x8b, 20
	.word	0x9845c01b	! t1_kref+0x9b4:   	addc	%l7, %i3, %o4
	.word	0x99b38592	! t1_kref+0x9b8:   	fcmpgt32	%f14, %f18, %o4
	.word	0xeb00a00c	! t1_kref+0x9bc:   	ld	[%g2 + 0xc], %f21
	.word	0x91a0052e	! t1_kref+0x9c0:   	fsqrts	%f14, %f8
	.word	0x9fb10fa5	! t1_kref+0x9c4:   	fors	%f4, %f5, %f15
	.word	0xb5a01907	! t1_kref+0x9c8:   	fitod	%f7, %f26
	.word	0xd80e2011	! t1_kref+0x9cc:   	ldub	[%i0 + 0x11], %o4
	.word	0xd80e001a	! t1_kref+0x9d0:   	ldub	[%i0 + %i2], %o4
	.word	0xe420a03c	! t1_kref+0x9d4:   	st	%l2, [%g2 + 0x3c]
	.word	0xa1a01930	! t1_kref+0x9d8:   	fstod	%f16, %f16
	.word	0xd840a01c	! t1_kref+0x9dc:   	ldsw	[%g2 + 0x1c], %o4
	.word	0x99b00cd4	! t1_kref+0x9e0:   	fnot2	%f20, %f12
	.word	0x993a2009	! t1_kref+0x9e4:   	sra	%o0, 0x9, %o4
	.word	0x9f414000	! t1_kref+0x9e8:   	mov	%pc, %o7
!	.word	0x25821585	! t1_kref+0x9ec:   	fblg,a	SYM(t1_subr3)
	   	fblg,a	SYM(t1_subr3)
	.word	0x9845800a	! t1_kref+0x9f0:   	addc	%l6, %o2, %o4
	.word	0x98f24008	! t1_kref+0x9f4:   	udivcc	%o1, %o0, %o4
	.word	0xd856600a	! t1_kref+0x9f8:   	ldsh	[%i1 + 0xa], %o4
	.word	0xd620a034	! t1_kref+0x9fc:   	st	%o3, [%g2 + 0x34]
	.word	0x81abca23	! t1_kref+0xa00:   	fcmps	%fcc0, %f15, %f3
	.word	0x93a249ab	! t1_kref+0xa04:   	fdivs	%f9, %f11, %f9
	.word	0x992c8011	! t1_kref+0xa08:   	sll	%l2, %l1, %o4
	.word	0x21480004	! t1_kref+0xa0c:   	fbn,a,pt	%fcc0, _kref+0xa1c
	.word	0xd808a006	! t1_kref+0xa10:   	ldub	[%g2 + 6], %o4
	.word	0xd8470019	! t1_kref+0xa14:   	ldsw	[%i4 + %i1], %o4
	.word	0x99234015	! t1_kref+0xa18:   	mulscc	%o5, %l5, %o4
	.word	0xe76e2010	! t1_kref+0xa1c:   	prefetch	%i0 + 0x10, 19
	.word	0xe3b8a100	! t1_kref+0xa20:   	stda	%f48, [%g2 + 0x100]%asi
	.word	0x81a98ad6	! t1_kref+0xa24:   	fcmped	%fcc0, %f6, %f22
	.word	0x8143e040	! t1_kref+0xa28:   	membar	0x40
	.word	0x9fa6492e	! t1_kref+0xa2c:   	fmuls	%f25, %f14, %f15
	.word	0x81858000	! t1_kref+0xa30:   	wr	%l6, %g0, %y
	.word	0xd8566006	! t1_kref+0xa34:   	ldsh	[%i1 + 6], %o4
	.word	0x989aaf1b	! t1_kref+0xa38:   	xorcc	%o2, 0xf1b, %o4
	.word	0xd80e601c	! t1_kref+0xa3c:   	ldub	[%i1 + 0x1c], %o4
	.word	0x98dd2983	! t1_kref+0xa40:   	smulcc	%l4, 0x983, %o4
	.word	0x98db000d	! t1_kref+0xa44:   	smulcc	%o4, %o5, %o4
	.word	0x97a30923	! t1_kref+0xa48:   	fmuls	%f12, %f3, %f11
	.word	0x2f480005	! t1_kref+0xa4c:   	fbu,a,pt	%fcc0, _kref+0xa60
	.word	0xb3a3892b	! t1_kref+0xa50:   	fmuls	%f14, %f11, %f25
	.word	0x81ab8ad0	! t1_kref+0xa54:   	fcmped	%fcc0, %f14, %f16
	.word	0x9fc00004	! t1_kref+0xa58:   	call	%g0 + %g4
	.word	0x9815c015	! t1_kref+0xa5c:   	or	%l7, %l5, %o4
	.word	0xd8480019	! t1_kref+0xa60:   	ldsb	[%g0 + %i1], %o4
	.word	0x984020c2	! t1_kref+0xa64:   	addc	%g0, 0xc2, %o4
	.word	0x81ad0aa4	! t1_kref+0xa68:   	fcmpes	%fcc0, %f20, %f4
	.word	0x8ba01a36	! t1_kref+0xa6c:   	fstoi	%f22, %f5
	.word	0x99b20410	! t1_kref+0xa70:   	fcmple16	%f8, %f16, %o4
	.word	0xd27e3fe4	! t1_kref+0xa74:   	swap	[%i0 - 0x1c], %o1
	.word	0x9de3bfa0	! t1_kref+0xa78:   	save	%sp, -0x60, %sp
	.word	0x99ee401a	! t1_kref+0xa7c:   	restore	%i1, %i2, %o4
	.word	0x9924c017	! t1_kref+0xa80:   	mulscc	%l3, %l7, %o4
	.word	0x9806baf9	! t1_kref+0xa84:   	add	%i2, -0x507, %o4
	.word	0xd9be189c	! t1_kref+0xa88:   	stda	%f12, [%i0 + %i4]0xc4
	.word	0x989ea269	! t1_kref+0xa8c:   	xorcc	%i2, 0x269, %o4
	.word	0xe83f4018	! t1_kref+0xa90:   	std	%l4, [%i5 + %i0]
	.word	0xda68a017	! t1_kref+0xa94:   	ldstub	[%g2 + 0x17], %o5
	.word	0xf1be5a5c	! t1_kref+0xa98:   	stda	%f24, [%i1 + %i4]0xd2
	.word	0x99b68506	! t1_kref+0xa9c:   	fcmpgt16	%f26, %f6, %o4
	.word	0xa9b00778	! t1_kref+0xaa0:   	fpack16	%f24, %f20
	.word	0x81ae8ad0	! t1_kref+0xaa4:   	fcmped	%fcc0, %f26, %f16
	.word	0xf207bfe0	! t1_kref+0xaa8:   	ld	[%fp - 0x20], %i1
	.word	0xc91fbc80	! t1_kref+0xaac:   	ldd	[%fp - 0x380], %f4
	.word	0xa1a649a4	! t1_kref+0xab0:   	fdivs	%f25, %f4, %f16
	.word	0xe230a006	! t1_kref+0xab4:   	sth	%l1, [%g2 + 6]
	.word	0xb1a0054c	! t1_kref+0xab8:   	fsqrtd	%f12, %f24
	.word	0xb3c1401c	! t1_kref+0xabc:   	jmpl	%g5 + %i4, %i1
	.word	0xa1a3882d	! t1_kref+0xac0:   	fadds	%f14, %f13, %f16
	.word	0xd856c019	! t1_kref+0xac4:   	ldsh	[%i3 + %i1], %o4
	.word	0xa5a0053a	! t1_kref+0xac8:   	fsqrts	%f26, %f18
	.word	0x85b68a44	! t1_kref+0xacc:   	fpadd32	%f26, %f4, %f2
	.word	0x98bd0016	! t1_kref+0xad0:   	xnorcc	%l4, %l6, %o4
	.word	0xa7a01a2c	! t1_kref+0xad4:   	fstoi	%f12, %f19
	.word	0xd67e6018	! t1_kref+0xad8:   	swap	[%i1 + 0x18], %o3
	.word	0x99b5c280	! t1_kref+0xadc:   	array32	%l7, %g0, %o4
	.word	0x98bf001c	! t1_kref+0xae0:   	xnorcc	%i4, %i4, %o4
	.word	0xb1a509ae	! t1_kref+0xae4:   	fdivs	%f20, %f14, %f24
	.word	0xa7b0cea0	! t1_kref+0xae8:   	fsrc1s	%f3, %f19
	.word	0xd88e101a	! t1_kref+0xaec:   	lduba	[%i0 + %i2]0x80, %o4
	.word	0x99a01a2f	! t1_kref+0xaf0:   	fstoi	%f15, %f12
	.word	0xa9a01a42	! t1_kref+0xaf4:   	fdtoi	%f2, %f20
	.word	0xd8467ff0	! t1_kref+0xaf8:   	ldsw	[%i1 - 0x10], %o4
	.word	0x98653add	! t1_kref+0xafc:   	subc	%l4, -0x523, %o4
	.word	0x9de3bfa0	! t1_kref+0xb00:   	save	%sp, -0x60, %sp
	.word	0x99eeecb0	! t1_kref+0xb04:   	restore	%i3, 0xcb0, %o4
	.word	0x3e480006	! t1_kref+0xb08:   	bvc,a,pt	%icc, _kref+0xb20
	.word	0xadb58dcc	! t1_kref+0xb0c:   	fnand	%f22, %f12, %f22
	.word	0x98f2f015	! t1_kref+0xb10:   	udivcc	%o3, -0xfeb, %o4
	.word	0xe228a03d	! t1_kref+0xb14:   	stb	%l1, [%g2 + 0x3d]
	.word	0x8d80000c	! t1_kref+0xb18:   	mov	%o4, %fprs
	.word	0xe9260000	! t1_kref+0xb1c:   	st	%f20, [%i0]
	.word	0x9da0054a	! t1_kref+0xb20:   	fsqrtd	%f10, %f14
	.word	0xd8562014	! t1_kref+0xb24:   	ldsh	[%i0 + 0x14], %o4
	.word	0x91a0190f	! t1_kref+0xb28:   	fitod	%f15, %f8
	.word	0xb5a01911	! t1_kref+0xb2c:   	fitod	%f17, %f26
	.word	0x95b00cf0	! t1_kref+0xb30:   	fnot2s	%f16, %f10
	.word	0x34480003	! t1_kref+0xb34:   	bg,a,pt	%icc, _kref+0xb40
	.word	0xc7ee100b	! t1_kref+0xb38:   	prefetcha	%i0 + %o3, 3
	.word	0xd800a01c	! t1_kref+0xb3c:   	ld	[%g2 + 0x1c], %o4
	.word	0xa9a00550	! t1_kref+0xb40:   	fsqrtd	%f16, %f20
	call	SYM(t1_subr1)
	.word	0xaba00529	! t1_kref+0xb48:   	fsqrts	%f9, %f21
	.word	0x97b5ce36	! t1_kref+0xb4c:   	fands	%f23, %f22, %f11
	.word	0x99b54117	! t1_kref+0xb50:   	edge32	%l5, %l7, %o4
	.word	0x992a000b	! t1_kref+0xb54:   	sll	%o0, %o3, %o4
	.word	0x81ddc01c	! t1_kref+0xb58:   	flush	%l7 + %i4
	.word	0xd820a034	! t1_kref+0xb5c:   	st	%o4, [%g2 + 0x34]
	.word	0x8143e02a	! t1_kref+0xb60:   	membar	0x2a
	.word	0xd4270019	! t1_kref+0xb64:   	st	%o2, [%i4 + %i1]
	.word	0x2b800006	! t1_kref+0xb68:   	fbug,a	_kref+0xb80
	.word	0xa5b40a54	! t1_kref+0xb6c:   	fpadd32	%f16, %f20, %f18
	.word	0x26480005	! t1_kref+0xb70:   	bl,a,pt	%icc, _kref+0xb84
	.word	0x992b4011	! t1_kref+0xb74:   	sll	%o5, %l1, %o4
	.word	0x3d480005	! t1_kref+0xb78:   	fbule,a,pt	%fcc0, _kref+0xb8c
	.word	0xd8060000	! t1_kref+0xb7c:   	ld	[%i0], %o4
	.word	0xd4263fe8	! t1_kref+0xb80:   	st	%o2, [%i0 - 0x18]
	.word	0x1915d538	! t1_kref+0xb84:   	sethi	%hi(0x5754e000), %o4
	.word	0x27800003	! t1_kref+0xb88:   	fbul,a	_kref+0xb94
	.word	0x98f6af81	! t1_kref+0xb8c:   	udivcc	%i2, 0xf81, %o4
	.word	0x99b58ab7	! t1_kref+0xb90:   	fpsub16s	%f22, %f23, %f12
	.word	0x9da00550	! t1_kref+0xb94:   	fsqrtd	%f16, %f14
	.word	0xe5ee101c	! t1_kref+0xb98:   	prefetcha	%i0 + %i4, 18
	.word	0xd8063fe0	! t1_kref+0xb9c:   	ld	[%i0 - 0x20], %o4
	.word	0x98328011	! t1_kref+0xba0:   	orn	%o2, %l1, %o4
	.word	0x81870000	! t1_kref+0xba4:   	wr	%i4, %g0, %y
	.word	0x9fc03738	! t1_kref+0xba8:   	call	%g0 - 0x8c8
	.word	0x99250014	! t1_kref+0xbac:   	mulscc	%l4, %l4, %o4
	.word	0x81854000	! t1_kref+0xbb0:   	wr	%l5, %g0, %y
	.word	0x8bb0076c	! t1_kref+0xbb4:   	fpack16	%f12, %f5
	.word	0x9904b66c	! t1_kref+0xbb8:   	taddcc	%l2, -0x994, %o4
	.word	0x98bc7327	! t1_kref+0xbbc:   	xnorcc	%l1, -0xcd9, %o4
	sethi	%hi(2f), %o7
	.word	0xe40be3e4	! t1_kref+0xbc4:   	ldub	[%o7 + 0x3e4], %l2
	.word	0xa41ca00c	! t1_kref+0xbc8:   	xor	%l2, 0xc, %l2
	.word	0xe42be3e4	! t1_kref+0xbcc:   	stb	%l2, [%o7 + 0x3e4]
	.word	0x81dbe3e4	! t1_kref+0xbd0:   	flush	%o7 + 0x3e4
	.word	0xd5a65000	! t1_kref+0xbd4:   	sta	%f10, [%i1]0x80
	.word	0x81ae0a48	! t1_kref+0xbd8:   	fcmpd	%fcc0, %f24, %f8
	.word	0x988d8017	! t1_kref+0xbdc:   	andcc	%l6, %l7, %o4
	.word	0x99b5055a	! t1_kref+0xbe0:   	fcmpeq16	%f20, %f26, %o4
2:	.word	0x93b64cb9	! t1_kref+0xbe4:   	fandnot2s	%f25, %f25, %f9
	.word	0xda20a03c	! t1_kref+0xbe8:   	st	%o5, [%g2 + 0x3c]
	.word	0xd230a01e	! t1_kref+0xbec:   	sth	%o1, [%g2 + 0x1e]
	.word	0x99244011	! t1_kref+0xbf0:   	mulscc	%l1, %l1, %o4
	.word	0x98a5000c	! t1_kref+0xbf4:   	subcc	%l4, %o4, %o4
	.word	0x8fa01a35	! t1_kref+0xbf8:   	fstoi	%f21, %f7
	.word	0x8fa58927	! t1_kref+0xbfc:   	fmuls	%f22, %f7, %f7
	.word	0xafa0052b	! t1_kref+0xc00:   	fsqrts	%f11, %f23
	.word	0x98c5000d	! t1_kref+0xc04:   	addccc	%l4, %o5, %o4
	.word	0x89a01912	! t1_kref+0xc08:   	fitod	%f18, %f4
	.word	0x9922400a	! t1_kref+0xc0c:   	mulscc	%o1, %o2, %o4
	.word	0x93ab4038	! t1_kref+0xc10:   	fmovsle	%fcc0, %f24, %f9
	.word	0xb5a0054e	! t1_kref+0xc14:   	fsqrtd	%f14, %f26
	.word	0xa3b58c67	! t1_kref+0xc18:   	fnors	%f22, %f7, %f17
	.word	0xeb68a008	! t1_kref+0xc1c:   	prefetch	%g2 + 8, 21
	.word	0x98e26b91	! t1_kref+0xc20:   	subccc	%o1, 0xb91, %o4
	.word	0xdaee9019	! t1_kref+0xc24:   	ldstuba	[%i2 + %i1]0x80, %o5
	.word	0xcd1fbea0	! t1_kref+0xc28:   	ldd	[%fp - 0x160], %f6
	.word	0x99b4050c	! t1_kref+0xc2c:   	fcmpgt16	%f16, %f12, %o4
	.word	0xafa01a3a	! t1_kref+0xc30:   	fstoi	%f26, %f23
	.word	0x81ddf48f	! t1_kref+0xc34:   	flush	%l7 - 0xb71
	.word	0xa9a01908	! t1_kref+0xc38:   	fitod	%f8, %f20
	.word	0x989dc00a	! t1_kref+0xc3c:   	xorcc	%l7, %o2, %o4
	.word	0x87802082	! t1_kref+0xc40:   	mov	0x82, %asi
	.word	0x98603555	! t1_kref+0xc44:   	subc	%g0, -0xaab, %o4
	.word	0xe720a00c	! t1_kref+0xc48:   	st	%f19, [%g2 + 0xc]
!	.word	0x264a14ed	! t1_kref+0xc4c:   	bl,a,pt	%icc, SYM(t1_subr3)
	   	bl,a,pt	%icc, SYM(t1_subr3)
	.word	0x9f414000	! t1_kref+0xc50:   	mov	%pc, %o7
	.word	0x8143c000	! t1_kref+0xc54:   	stbar
	.word	0x9842000a	! t1_kref+0xc58:   	addc	%o0, %o2, %o4
	.word	0xa9a00533	! t1_kref+0xc5c:   	fsqrts	%f19, %f20
	.word	0x99b700f2	! t1_kref+0xc60:   	edge16ln	%i4, %l2, %o4
	.word	0xada018d4	! t1_kref+0xc64:   	fdtos	%f20, %f22
	.word	0x99a01906	! t1_kref+0xc68:   	fitod	%f6, %f12
	.word	0x991ec015	! t1_kref+0xc6c:   	tsubcctv	%i3, %l5, %o4
	.word	0x98a6801b	! t1_kref+0xc70:   	subcc	%i2, %i3, %o4
	.word	0x35480002	! t1_kref+0xc74:   	fbue,a,pt	%fcc0, _kref+0xc7c
	.word	0x8bb1cfb9	! t1_kref+0xc78:   	fors	%f7, %f25, %f5
	.word	0x99b284c4	! t1_kref+0xc7c:   	fcmpne32	%f10, %f4, %o4
	.word	0x87a24928	! t1_kref+0xc80:   	fmuls	%f9, %f8, %f3
	.word	0x1934c3b7	! t1_kref+0xc84:   	sethi	%hi(0xd30edc00), %o4
	.word	0xa5b58d04	! t1_kref+0xc88:   	fandnot1	%f22, %f4, %f18
	.word	0x993ce00a	! t1_kref+0xc8c:   	sra	%l3, 0xa, %o4
	.word	0xea30a026	! t1_kref+0xc90:   	sth	%l5, [%g2 + 0x26]
	.word	0x8db00cf2	! t1_kref+0xc94:   	fnot2s	%f18, %f6
	.word	0xc53e3ff0	! t1_kref+0xc98:   	std	%f2, [%i0 - 0x10]
	.word	0x98bc71ca	! t1_kref+0xc9c:   	xnorcc	%l1, -0xe36, %o4
	.word	0x99400000	! t1_kref+0xca0:   	mov	%y, %o4
	.word	0x9867278e	! t1_kref+0xca4:   	subc	%i4, 0x78e, %o4
	.word	0x98aa0012	! t1_kref+0xca8:   	andncc	%o0, %l2, %o4
	call	SYM(t1_subr2)
	.word	0x99b18eee	! t1_kref+0xcb0:   	fornot2s	%f6, %f14, %f12
	.word	0x81844000	! t1_kref+0xcb4:   	wr	%l1, %g0, %y
	.word	0xe7f61011	! t1_kref+0xcb8:   	casxa	[%i0]0x80, %l1, %l3
	sethi	%hi(2f), %o7
	.word	0xe40be104	! t1_kref+0xcc0:   	ldub	[%o7 + 0x104], %l2
	.word	0xa41ca00c	! t1_kref+0xcc4:   	xor	%l2, 0xc, %l2
	.word	0xe42be104	! t1_kref+0xcc8:   	stb	%l2, [%o7 + 0x104]
	.word	0x81dbe104	! t1_kref+0xccc:   	flush	%o7 + 0x104
	.word	0xafb00fe0	! t1_kref+0xcd0:   	fones	%f23
	.word	0x2d480006	! t1_kref+0xcd4:   	fbg,a,pt	%fcc0, _kref+0xcec
	.word	0xb1a00546	! t1_kref+0xcd8:   	fsqrtd	%f6, %f24
	.word	0xe120a004	! t1_kref+0xcdc:   	st	%f16, [%g2 + 4]
	.word	0x98e4801b	! t1_kref+0xce0:   	subccc	%l2, %i3, %o4
	.word	0x98450011	! t1_kref+0xce4:   	addc	%l4, %l1, %o4
	.word	0x99b1849a	! t1_kref+0xce8:   	fcmple32	%f6, %f26, %o4
	.word	0x98454009	! t1_kref+0xcec:   	addc	%l5, %o1, %o4
	call	SYM(t1_subr3)
	.word	0x81dac012	! t1_kref+0xcf4:   	flush	%o3 + %l2
	.word	0xadb206c4	! t1_kref+0xcf8:   	fmul8sux16	%f8, %f4, %f22
	.word	0xc93e3fe8	! t1_kref+0xcfc:   	std	%f4, [%i0 - 0x18]
	.word	0xa3a01088	! t1_kref+0xd00:   	fxtos	%f8, %f17
2:	.word	0xef267fe8	! t1_kref+0xd04:   	st	%f23, [%i1 - 0x18]
	.word	0x98553f14	! t1_kref+0xd08:   	umul	%l4, -0xec, %o4
	.word	0x8db30ef3	! t1_kref+0xd0c:   	fornot2s	%f12, %f19, %f6
	.word	0x982a0016	! t1_kref+0xd10:   	andn	%o0, %l6, %o4
	.word	0x9de3bfa0	! t1_kref+0xd14:   	save	%sp, -0x60, %sp
	.word	0xb60e8018	! t1_kref+0xd18:   	and	%i2, %i0, %i3
	.word	0x99eec01b	! t1_kref+0xd1c:   	restore	%i3, %i3, %o4
	.word	0xa3a5c8b9	! t1_kref+0xd20:   	fsubs	%f23, %f25, %f17
	.word	0xb1a0110c	! t1_kref+0xd24:   	fxtod	%f12, %f24
	.word	0x9862a0ce	! t1_kref+0xd28:   	subc	%o2, 0xce, %o4
	.word	0x33800002	! t1_kref+0xd2c:   	fbe,a	_kref+0xd34
	.word	0xd810a024	! t1_kref+0xd30:   	lduh	[%g2 + 0x24], %o4
	.word	0x2f800004	! t1_kref+0xd34:   	fbu,a	_kref+0xd44
	.word	0x9ba01a28	! t1_kref+0xd38:   	fstoi	%f8, %f13
	.word	0x992a400c	! t1_kref+0xd3c:   	sll	%o1, %o4, %o4
	.word	0x98daa1fc	! t1_kref+0xd40:   	smulcc	%o2, 0x1fc, %o4
	.word	0xadb5cd24	! t1_kref+0xd44:   	fandnot1s	%f23, %f4, %f22
	.word	0x3b800007	! t1_kref+0xd48:   	fble,a	_kref+0xd64
	.word	0x98350014	! t1_kref+0xd4c:   	orn	%l4, %l4, %o4
	.word	0x81ac8ad0	! t1_kref+0xd50:   	fcmped	%fcc0, %f18, %f16
	.word	0x98c33a29	! t1_kref+0xd54:   	addccc	%o4, -0x5d7, %o4
	.word	0xc168a0ca	! t1_kref+0xd58:   	prefetch	%g2 + 0xca, 0
	.word	0xfdee501b	! t1_kref+0xd5c:   	prefetcha	%i1 + %i3, 30
	.word	0x9938200d	! t1_kref+0xd60:   	sra	%g0, 0xd, %o4
	.word	0xd03e3ff0	! t1_kref+0xd64:   	std	%o0, [%i0 - 0x10]
	.word	0x992d201d	! t1_kref+0xd68:   	sll	%l4, 0x1d, %o4
	.word	0xa9a00133	! t1_kref+0xd6c:   	fabss	%f19, %f20
	.word	0xda20a00c	! t1_kref+0xd70:   	st	%o5, [%g2 + 0xc]
	.word	0x9f414000	! t1_kref+0xd74:   	mov	%pc, %o7
	.word	0xd808a007	! t1_kref+0xd78:   	ldub	[%g2 + 7], %o4
	.word	0xd828a00f	! t1_kref+0xd7c:   	stb	%o4, [%g2 + 0xf]
	.word	0x98ade1ea	! t1_kref+0xd80:   	andncc	%l7, 0x1ea, %o4
	.word	0x98624012	! t1_kref+0xd84:   	subc	%o1, %l2, %o4
	.word	0x989c800a	! t1_kref+0xd88:   	xorcc	%l2, %o2, %o4
	.word	0x99a0054a	! t1_kref+0xd8c:   	fsqrtd	%f10, %f12
	.word	0xd848a025	! t1_kref+0xd90:   	ldsb	[%g2 + 0x25], %o4
	.word	0x9db00c00	! t1_kref+0xd94:   	fzero	%f14
	.word	0x89b5cea0	! t1_kref+0xd98:   	fsrc1s	%f23, %f4
	.word	0x98bf0008	! t1_kref+0xd9c:   	xnorcc	%i4, %o0, %o4
	.word	0x98bac01b	! t1_kref+0xda0:   	xnorcc	%o3, %i3, %o4
	.word	0xd51e7ff8	! t1_kref+0xda4:   	ldd	[%i1 - 8], %f10
	.word	0x31480008	! t1_kref+0xda8:   	fba,a,pt	%fcc0, _kref+0xdc8
	.word	0xea20a00c	! t1_kref+0xdac:   	st	%l5, [%g2 + 0xc]
	.word	0xb5a60854	! t1_kref+0xdb0:   	faddd	%f24, %f20, %f26
	.word	0x93b3cab4	! t1_kref+0xdb4:   	fpsub16s	%f15, %f20, %f9
	.word	0xee30a03e	! t1_kref+0xdb8:   	sth	%l7, [%g2 + 0x3e]
	.word	0x98dcc014	! t1_kref+0xdbc:   	smulcc	%l3, %l4, %o4
	.word	0xd800a03c	! t1_kref+0xdc0:   	ld	[%g2 + 0x3c], %o4
	.word	0xc1ee100a	! t1_kref+0xdc4:   	prefetcha	%i0 + %o2, 0
	.word	0xcd871019	! t1_kref+0xdc8:   	lda	[%i4 + %i1]0x80, %f6
	.word	0xd028a015	! t1_kref+0xdcc:   	stb	%o0, [%g2 + 0x15]
	.word	0xf420a024	! t1_kref+0xdd0:   	st	%i2, [%g2 + 0x24]
	.word	0xd810a036	! t1_kref+0xdd4:   	lduh	[%g2 + 0x36], %o4
	.word	0x9fc10000	! t1_kref+0xdd8:   	call	%g4
	.word	0xa786c011	! t1_kref+0xddc:   	wr	%i3, %l1, %gsr
	.word	0x98fb3a5c	! t1_kref+0xde0:   	sdivcc	%o4, -0x5a4, %o4
	.word	0x98df0013	! t1_kref+0xde4:   	smulcc	%i4, %l3, %o4
	call	SYM(t1_subr1)
	.word	0x99244013	! t1_kref+0xdec:   	mulscc	%l1, %l3, %o4
	.word	0x3b480004	! t1_kref+0xdf0:   	fble,a,pt	%fcc0, _kref+0xe00
	.word	0x9862000b	! t1_kref+0xdf4:   	subc	%o0, %o3, %o4
	.word	0x993d4015	! t1_kref+0xdf8:   	sra	%l5, %l5, %o4
	.word	0x81ad4a37	! t1_kref+0xdfc:   	fcmps	%fcc0, %f21, %f23
	.word	0x93a388a7	! t1_kref+0xe00:   	fsubs	%f14, %f7, %f9
	.word	0x8fa3082e	! t1_kref+0xe04:   	fadds	%f12, %f14, %f7
	.word	0x9de3bfa0	! t1_kref+0xe08:   	save	%sp, -0x60, %sp
	.word	0x99eea45c	! t1_kref+0xe0c:   	restore	%i2, 0x45c, %o4
	.word	0xeb00a01c	! t1_kref+0xe10:   	ld	[%g2 + 0x1c], %f21
	.word	0x95b00f16	! t1_kref+0xe14:   	fsrc2	%f22, %f10
	.word	0x39800005	! t1_kref+0xe18:   	fbuge,a	_kref+0xe2c
	.word	0x98ddbaf3	! t1_kref+0xe1c:   	smulcc	%l6, -0x50d, %o4
	.word	0xd03e6000	! t1_kref+0xe20:   	std	%o0, [%i1]
	.word	0x8143c000	! t1_kref+0xe24:   	stbar
	.word	0x8db506e8	! t1_kref+0xe28:   	fmul8ulx16	%f20, %f8, %f6
	.word	0x8143e040	! t1_kref+0xe2c:   	membar	0x40
	.word	0x9ba34826	! t1_kref+0xe30:   	fadds	%f13, %f6, %f13
	.word	0x9922bfd8	! t1_kref+0xe34:   	mulscc	%o2, -0x28, %o4
	.word	0x8da01938	! t1_kref+0xe38:   	fstod	%f24, %f6
	.word	0xb5a609d0	! t1_kref+0xe3c:   	fdivd	%f24, %f16, %f26
	.word	0x95a01a54	! t1_kref+0xe40:   	fdtoi	%f20, %f10
	.word	0x98e5b024	! t1_kref+0xe44:   	subccc	%l6, -0xfdc, %o4
	call	SYM(t1_subr1)
	.word	0xda20a004	! t1_kref+0xe4c:   	st	%o5, [%g2 + 4]
	.word	0x9da48858	! t1_kref+0xe50:   	faddd	%f18, %f24, %f14
	sethi	%hi(2f), %o7
	.word	0xe40be274	! t1_kref+0xe58:   	ldub	[%o7 + 0x274], %l2
	.word	0xa41ca00c	! t1_kref+0xe5c:   	xor	%l2, 0xc, %l2
	.word	0xe42be274	! t1_kref+0xe60:   	stb	%l2, [%o7 + 0x274]
	.word	0x81dbe274	! t1_kref+0xe64:   	flush	%o7 + 0x274
	.word	0x99233555	! t1_kref+0xe68:   	mulscc	%o4, -0xaab, %o4
	.word	0x81858000	! t1_kref+0xe6c:   	wr	%l6, %g0, %y
	.word	0x98e20015	! t1_kref+0xe70:   	subccc	%o0, %l5, %o4
2:	.word	0x91a00546	! t1_kref+0xe74:   	fsqrtd	%f6, %f8
	.word	0x983c401b	! t1_kref+0xe78:   	xnor	%l1, %i3, %o4
	.word	0xd100a004	! t1_kref+0xe7c:   	ld	[%g2 + 4], %f8
	.word	0xaba38925	! t1_kref+0xe80:   	fmuls	%f14, %f5, %f21
	.word	0x98570016	! t1_kref+0xe84:   	umul	%i4, %l6, %o4
	.word	0xd80e3fe7	! t1_kref+0xe88:   	ldub	[%i0 - 0x19], %o4
	.word	0xf8767fe8	! t1_kref+0xe8c:   	stx	%i4, [%i1 - 0x18]
	.word	0x3d480004	! t1_kref+0xe90:   	fbule,a,pt	%fcc0, _kref+0xea0
	.word	0x99b504d8	! t1_kref+0xe94:   	fcmpne32	%f20, %f24, %o4
	.word	0x98e5b68d	! t1_kref+0xe98:   	subccc	%l6, -0x973, %o4
	.word	0xd8562008	! t1_kref+0xe9c:   	ldsh	[%i0 + 8], %o4
	.word	0x93a0052d	! t1_kref+0xea0:   	fsqrts	%f13, %f9
	.word	0xd9be5800	! t1_kref+0xea4:   	stda	%f12, [%i1]0xc0
	.word	0x993b400a	! t1_kref+0xea8:   	sra	%o5, %o2, %o4
	.word	0x98ac7682	! t1_kref+0xeac:   	andncc	%l1, -0x97e, %o4
	.word	0x991ae63c	! t1_kref+0xeb0:   	tsubcctv	%o3, 0x63c, %o4
	.word	0x81870000	! t1_kref+0xeb4:   	wr	%i4, %g0, %y
	.word	0x98fdc00d	! t1_kref+0xeb8:   	sdivcc	%l7, %o5, %o4
	.word	0xf1ee501d	! t1_kref+0xebc:   	prefetcha	%i1 + %i5, 24
	.word	0x989ac013	! t1_kref+0xec0:   	xorcc	%o3, %l3, %o4
	.word	0x23480006	! t1_kref+0xec4:   	fbne,a,pt	%fcc0, _kref+0xedc
	.word	0x98ba4012	! t1_kref+0xec8:   	xnorcc	%o1, %l2, %o4
	.word	0xf13e3fe8	! t1_kref+0xecc:   	std	%f24, [%i0 - 0x18]
	.word	0x9da01907	! t1_kref+0xed0:   	fitod	%f7, %f14
	.word	0x99b2402b	! t1_kref+0xed4:   	edge8n	%o1, %o3, %o4
	.word	0xa3a5c8ab	! t1_kref+0xed8:   	fsubs	%f23, %f11, %f17
	.word	0x86102003	! t1_kref+0xedc:   	mov	0x3, %g3
	.word	0x86a0e001	! t1_kref+0xee0:   	subcc	%g3, 1, %g3
	.word	0x22800002	! t1_kref+0xee4:   	be,a	_kref+0xeec
	.word	0x98ba0014	! t1_kref+0xee8:   	xnorcc	%o0, %l4, %o4
	.word	0x983474ae	! t1_kref+0xeec:   	orn	%l1, -0xb52, %o4
	.word	0xd8562016	! t1_kref+0xef0:   	ldsh	[%i0 + 0x16], %o4
	.word	0x8ba0c9b3	! t1_kref+0xef4:   	fdivs	%f3, %f19, %f5
	.word	0xada00544	! t1_kref+0xef8:   	fsqrtd	%f4, %f22
	.word	0xd91fbf98	! t1_kref+0xefc:   	ldd	[%fp - 0x68], %f12
	.word	0x99b60512	! t1_kref+0xf00:   	fcmpgt16	%f24, %f18, %o4
	.word	0x81ac0a33	! t1_kref+0xf04:   	fcmps	%fcc0, %f16, %f19
	.word	0x98a7000b	! t1_kref+0xf08:   	subcc	%i4, %o3, %o4
	.word	0x98fb377b	! t1_kref+0xf0c:   	sdivcc	%o4, -0x885, %o4
	.word	0x25800004	! t1_kref+0xf10:   	fblg,a	_kref+0xf20
	.word	0xa9a1084e	! t1_kref+0xf14:   	faddd	%f4, %f14, %f20
	.word	0xa5b28e46	! t1_kref+0xf18:   	fxnor	%f10, %f6, %f18
	.word	0x99b700ca	! t1_kref+0xf1c:   	edge16l	%i4, %o2, %o4
	.word	0xa5b286ea	! t1_kref+0xf20:   	fmul8ulx16	%f10, %f10, %f18
	.word	0x36480003	! t1_kref+0xf24:   	bge,a,pt	%icc, _kref+0xf30
	.word	0xec30a03c	! t1_kref+0xf28:   	sth	%l6, [%g2 + 0x3c]
	.word	0x98f5c01b	! t1_kref+0xf2c:   	udivcc	%l7, %i3, %o4
	.word	0x8fb10a32	! t1_kref+0xf30:   	fpadd16s	%f4, %f18, %f7
	.word	0xe4086ccc	! t1_kref+0xf34:   	ldub	[%g1 + 0xccc], %l2
	.word	0xa41ca00c	! t1_kref+0xf38:   	xor	%l2, 0xc, %l2
	.word	0xe4286ccc	! t1_kref+0xf3c:   	stb	%l2, [%g1 + 0xccc]
	.word	0x81d86ccc	! t1_kref+0xf40:   	flush	%g1 + 0xccc
	.word	0xd8060000	! t1_kref+0xf44:   	ld	[%i0], %o4
	.word	0xa1a01910	! t1_kref+0xf48:   	fitod	%f16, %f16
	.word	0xd91fbd70	! t1_kref+0xf4c:   	ldd	[%fp - 0x290], %f12
	.word	0x1933f7c9	! t1_kref+0xf50:   	sethi	%hi(0xcfdf2400), %o4
	.word	0xada0055a	! t1_kref+0xf54:   	fsqrtd	%f26, %f22
	.word	0xe1be188b	! t1_kref+0xf58:   	stda	%f16, [%i0 + %o3]0xc4
	.word	0xd8865000	! t1_kref+0xf5c:   	lda	[%i1]0x80, %o4
2:	.word	0xb5a0188b	! t1_kref+0xf60:   	fitos	%f11, %f26
	.word	0x27800005	! t1_kref+0xf64:   	fbul,a	_kref+0xf78
	.word	0xa3b54d60	! t1_kref+0xf68:   	fnot1s	%f21, %f17
	call	SYM(t1_subr2)
	.word	0xa9a01a54	! t1_kref+0xf70:   	fdtoi	%f20, %f20
	.word	0x87a01a3a	! t1_kref+0xf74:   	fstoi	%f26, %f3
	.word	0x95a0190e	! t1_kref+0xf78:   	fitod	%f14, %f10
	.word	0x91b6496a	! t1_kref+0xf7c:   	fpmerge	%f25, %f10, %f8
	.word	0x192d2815	! t1_kref+0xf80:   	sethi	%hi(0xb4a05400), %o4
	.word	0x9934c01a	! t1_kref+0xf84:   	srl	%l3, %i2, %o4
	.word	0xf9ee501a	! t1_kref+0xf88:   	prefetcha	%i1 + %i2, 28
	.word	0x992b6013	! t1_kref+0xf8c:   	sll	%o5, 0x13, %o4
	.word	0x9845f173	! t1_kref+0xf90:   	addc	%l7, -0xe8d, %o4
	.word	0xd8062018	! t1_kref+0xf94:   	ld	[%i0 + 0x18], %o4
	.word	0x93a0003a	! t1_kref+0xf98:   	fmovs	%f26, %f9
	.word	0xd810a01e	! t1_kref+0xf9c:   	lduh	[%g2 + 0x1e], %o4
	.word	0xd8d61000	! t1_kref+0xfa0:   	ldsha	[%i0]0x80, %o4
	.word	0x993ce018	! t1_kref+0xfa4:   	sra	%l3, 0x18, %o4
	.word	0x9de3bfa0	! t1_kref+0xfa8:   	save	%sp, -0x60, %sp
	.word	0x802f6d33	! t1_kref+0xfac:   	andn	%i5, 0xd33, %g0
	.word	0x99ee8000	! t1_kref+0xfb0:   	restore	%i2, %g0, %o4
	.word	0xd628a036	! t1_kref+0xfb4:   	stb	%o3, [%g2 + 0x36]
	.word	0xb5b30752	! t1_kref+0xfb8:   	fpack32	%f12, %f18, %f26
	.word	0x980db3fe	! t1_kref+0xfbc:   	and	%l6, -0xc02, %o4
	.word	0xf1be101d	! t1_kref+0xfc0:   	stda	%f24, [%i0 + %i5]0x80
	.word	0x9fa0188b	! t1_kref+0xfc4:   	fitos	%f11, %f15
	.word	0xd88e1000	! t1_kref+0xfc8:   	lduba	[%i0]0x80, %o4
	.word	0xa7a01a39	! t1_kref+0xfcc:   	fstoi	%f25, %f19
	.word	0xa9a389ac	! t1_kref+0xfd0:   	fdivs	%f14, %f12, %f20
	.word	0x985b2267	! t1_kref+0xfd4:   	smul	%o4, 0x267, %o4
	.word	0xadb18f86	! t1_kref+0xfd8:   	for	%f6, %f6, %f22
	.word	0x99408000	! t1_kref+0xfdc:   	mov	%ccr, %o4
	.word	0xa5b28a84	! t1_kref+0xfe0:   	fpsub16	%f10, %f4, %f18
	.word	0x8da00548	! t1_kref+0xfe4:   	fsqrtd	%f8, %f6
	.word	0x99b4c0ed	! t1_kref+0xfe8:   	edge16ln	%l3, %o5, %o4
	.word	0x91a0052d	! t1_kref+0xfec:   	fsqrts	%f13, %f8
	.word	0xc700a00c	! t1_kref+0xff0:   	ld	[%g2 + 0xc], %f3
	.word	0xe4086d98	! t1_kref+0xff4:   	ldub	[%g1 + 0xd98], %l2
	.word	0xa41ca00c	! t1_kref+0xff8:   	xor	%l2, 0xc, %l2
	.word	0xe4286d98	! t1_kref+0xffc:   	stb	%l2, [%g1 + 0xd98]
	.word	0x81d86d98	! t1_kref+0x1000:   	flush	%g1 + 0xd98
	.word	0x99b00240	! t1_kref+0x1004:   	array16	%g0, %g0, %o4
	.word	0x98c48014	! t1_kref+0x1008:   	addccc	%l2, %l4, %o4
	.word	0xd8ce9019	! t1_kref+0x100c:   	ldsba	[%i2 + %i1]0x80, %o4
	.word	0xec3e4000	! t1_kref+0x1010:   	std	%l6, [%i1]
	.word	0xfbee501d	! t1_kref+0x1014:   	prefetcha	%i1 + %i5, 29
	.word	0x9db00c00	! t1_kref+0x1018:   	fzero	%f14
	.word	0xe830a016	! t1_kref+0x101c:   	sth	%l4, [%g2 + 0x16]
	.word	0x983cc01a	! t1_kref+0x1020:   	xnor	%l3, %i2, %o4
	.word	0xa9b38d0e	! t1_kref+0x1024:   	fandnot1	%f14, %f14, %f20
	.word	0x97b1cf77	! t1_kref+0x1028:   	fornot1s	%f7, %f23, %f11
2:	.word	0xd628a007	! t1_kref+0x102c:   	stb	%o3, [%g2 + 7]
	.word	0xd8567fe8	! t1_kref+0x1030:   	ldsh	[%i1 - 0x18], %o4
	sethi	%hi(2f), %o7
	.word	0xe40be058	! t1_kref+0x1038:   	ldub	[%o7 + 0x58], %l2
	.word	0xa41ca00c	! t1_kref+0x103c:   	xor	%l2, 0xc, %l2
	.word	0xe42be058	! t1_kref+0x1040:   	stb	%l2, [%o7 + 0x58]
	.word	0x81dbe058	! t1_kref+0x1044:   	flush	%o7 + 0x58
	.word	0xe07e3ff4	! t1_kref+0x1048:   	swap	[%i0 - 0xc], %l0
	.word	0x993ca002	! t1_kref+0x104c:   	sra	%l2, 0x2, %o4
	.word	0x91b18e2b	! t1_kref+0x1050:   	fands	%f6, %f11, %f8
	.word	0x81ab0a3a	! t1_kref+0x1054:   	fcmps	%fcc0, %f12, %f26
2:	.word	0x98a2000b	! t1_kref+0x1058:   	subcc	%o0, %o3, %o4
	.word	0xd53e6008	! t1_kref+0x105c:   	std	%f10, [%i1 + 8]
	.word	0xd428a007	! t1_kref+0x1060:   	stb	%o2, [%g2 + 7]
	.word	0x81aa4a33	! t1_kref+0x1064:   	fcmps	%fcc0, %f9, %f19
	.word	0xd8a6101c	! t1_kref+0x1068:   	sta	%o4, [%i0 + %i4]0x80
	.word	0x3b480004	! t1_kref+0x106c:   	fble,a,pt	%fcc0, _kref+0x107c
	.word	0x99400000	! t1_kref+0x1070:   	mov	%y, %o4
	.word	0xd84e3ff1	! t1_kref+0x1074:   	ldsb	[%i0 - 0xf], %o4
	.word	0xd848a03d	! t1_kref+0x1078:   	ldsb	[%g2 + 0x3d], %o4
	.word	0xe968a08f	! t1_kref+0x107c:   	prefetch	%g2 + 0x8f, 20
	.word	0x983d3543	! t1_kref+0x1080:   	xnor	%l4, -0xabd, %o4
	sethi	%hi(2f), %o7
	.word	0xe40be0d4	! t1_kref+0x1088:   	ldub	[%o7 + 0xd4], %l2
	.word	0xa41ca00c	! t1_kref+0x108c:   	xor	%l2, 0xc, %l2
	.word	0xe42be0d4	! t1_kref+0x1090:   	stb	%l2, [%o7 + 0xd4]
	.word	0x81dbe0d4	! t1_kref+0x1094:   	flush	%o7 + 0xd4
	.word	0x9fc00004	! t1_kref+0x1098:   	call	%g0 + %g4
	.word	0xc76e7fe8	! t1_kref+0x109c:   	prefetch	%i1 - 0x18, 3
	.word	0xd2ee9019	! t1_kref+0x10a0:   	ldstuba	[%i2 + %i1]0x80, %o1
	.word	0xe8270018	! t1_kref+0x10a4:   	st	%l4, [%i4 + %i0]
	.word	0xc51e6000	! t1_kref+0x10a8:   	ldd	[%i1], %f2
	.word	0xd8100018	! t1_kref+0x10ac:   	lduh	[%g0 + %i0], %o4
	.word	0x97a01a58	! t1_kref+0x10b0:   	fdtoi	%f24, %f11
	.word	0x98624009	! t1_kref+0x10b4:   	subc	%o1, %o1, %o4
	.word	0x95a54925	! t1_kref+0x10b8:   	fmuls	%f21, %f5, %f10
	.word	0xb3a01a52	! t1_kref+0x10bc:   	fdtoi	%f18, %f25
	.word	0xa3a3882a	! t1_kref+0x10c0:   	fadds	%f14, %f10, %f17
	.word	0x89a58852	! t1_kref+0x10c4:   	faddd	%f22, %f18, %f4
	.word	0x8ba28937	! t1_kref+0x10c8:   	fmuls	%f10, %f23, %f5
	.word	0xd840a02c	! t1_kref+0x10cc:   	ldsw	[%g2 + 0x2c], %o4
	.word	0x9826b091	! t1_kref+0x10d0:   	sub	%i2, -0xf6f, %o4
2:	.word	0xb5a0192f	! t1_kref+0x10d4:   	fstod	%f15, %f26
	.word	0x9ba0012a	! t1_kref+0x10d8:   	fabss	%f10, %f13
	.word	0x81ad0ad0	! t1_kref+0x10dc:   	fcmped	%fcc0, %f20, %f16
	.word	0x9864800c	! t1_kref+0x10e0:   	subc	%l2, %o4, %o4
	.word	0xf6a71018	! t1_kref+0x10e4:   	sta	%i3, [%i4 + %i0]0x80
	.word	0x98e029f3	! t1_kref+0x10e8:   	subccc	%g0, 0x9f3, %o4
	.word	0x99b604d2	! t1_kref+0x10ec:   	fcmpne32	%f24, %f18, %o4
	.word	0xb1a00535	! t1_kref+0x10f0:   	fsqrts	%f21, %f24
	.word	0xe2ee5000	! t1_kref+0x10f4:   	ldstuba	[%i1]0x80, %l1
	.word	0x8143c000	! t1_kref+0x10f8:   	stbar
	.word	0x8bb24f70	! t1_kref+0x10fc:   	fornot1s	%f9, %f16, %f5
	.word	0x81ac8a37	! t1_kref+0x1100:   	fcmps	%fcc0, %f18, %f23
	.word	0x30480007	! t1_kref+0x1104:   	ba,a,pt	%icc, _kref+0x1120
	.word	0x9fb50fa4	! t1_kref+0x1108:   	fors	%f20, %f4, %f15
	.word	0xe86e4000	! t1_kref+0x110c:   	ldstub	[%i1], %l4
	.word	0x9fa109ad	! t1_kref+0x1110:   	fdivs	%f4, %f13, %f15
	.word	0x81ac0ac6	! t1_kref+0x1114:   	fcmped	%fcc0, %f16, %f6
	.word	0xd620a014	! t1_kref+0x1118:   	st	%o3, [%g2 + 0x14]
	.word	0xd920a034	! t1_kref+0x111c:   	st	%f12, [%g2 + 0x34]
	.word	0xcd9f5019	! t1_kref+0x1120:   	ldda	[%i5 + %i1]0x80, %f6
	.word	0xf11fbf88	! t1_kref+0x1124:   	ldd	[%fp - 0x78], %f24
	.word	0x9de3bfa0	! t1_kref+0x1128:   	save	%sp, -0x60, %sp
	.word	0xb4c7001a	! t1_kref+0x112c:   	addccc	%i4, %i2, %i2
	.word	0x99ef39c6	! t1_kref+0x1130:   	restore	%i4, -0x63a, %o4
	.word	0x3d480006	! t1_kref+0x1134:   	fbule,a,pt	%fcc0, _kref+0x114c
	.word	0x98644013	! t1_kref+0x1138:   	subc	%l1, %l3, %o4
	.word	0xadabc052	! t1_kref+0x113c:   	fmovdo	%fcc0, %f18, %f22
	.word	0xdd1e6000	! t1_kref+0x1140:   	ldd	[%i1], %f14
	.word	0xec30a00e	! t1_kref+0x1144:   	sth	%l6, [%g2 + 0xe]
	.word	0x99400000	! t1_kref+0x1148:   	mov	%y, %o4
	.word	0xf820a01c	! t1_kref+0x114c:   	st	%i4, [%g2 + 0x1c]
	.word	0xd8566016	! t1_kref+0x1150:   	ldsh	[%i1 + 0x16], %o4
	.word	0xc368a0c5	! t1_kref+0x1154:   	prefetch	%g2 + 0xc5, 1
	.word	0x98fc71bb	! t1_kref+0x1158:   	sdivcc	%l1, -0xe45, %o4
	.word	0xb5a0012c	! t1_kref+0x115c:   	fabss	%f12, %f26
	.word	0xa9b00f10	! t1_kref+0x1160:   	fsrc2	%f16, %f20
	.word	0xd4380018	! t1_kref+0x1164:   	std	%o2, [%g0 + %i0]
	.word	0x2f800006	! t1_kref+0x1168:   	fbu,a	_kref+0x1180
	.word	0xf500a00c	! t1_kref+0x116c:   	ld	[%g2 + 0xc], %f26
	.word	0x99400000	! t1_kref+0x1170:   	mov	%y, %o4
	.word	0xb1a0054c	! t1_kref+0x1174:   	fsqrtd	%f12, %f24
	.word	0x8143c000	! t1_kref+0x1178:   	stbar
	.word	0x99a00556	! t1_kref+0x117c:   	fsqrtd	%f22, %f12
	.word	0xe4086f18	! t1_kref+0x1180:   	ldub	[%g1 + 0xf18], %l2
	.word	0xa41ca00c	! t1_kref+0x1184:   	xor	%l2, 0xc, %l2
	.word	0xe4286f18	! t1_kref+0x1188:   	stb	%l2, [%g1 + 0xf18]
	.word	0x81d86f18	! t1_kref+0x118c:   	flush	%g1 + 0xf18
	.word	0xb5b00cc2	! t1_kref+0x1190:   	fnot2	%f2, %f26
	.word	0x001fffff	! t1_kref+0x1194:   	illtrap	0x1fffff
	.word	0x9fb00ce6	! t1_kref+0x1198:   	fnot2s	%f6, %f15
	.word	0xd8560000	! t1_kref+0x119c:   	ldsh	[%i0], %o4
	.word	0xf620a00c	! t1_kref+0x11a0:   	st	%i3, [%g2 + 0xc]
	.word	0xd84e600e	! t1_kref+0x11a4:   	ldsb	[%i1 + 0xe], %o4
	.word	0xe07e2014	! t1_kref+0x11a8:   	swap	[%i0 + 0x14], %l0
2:	.word	0xa9a018cc	! t1_kref+0x11ac:   	fdtos	%f12, %f20
	.word	0x9fc10000	! t1_kref+0x11b0:   	call	%g4
	.word	0x98a5c01a	! t1_kref+0x11b4:   	subcc	%l7, %i2, %o4
	.word	0x9de3bfa0	! t1_kref+0x11b8:   	save	%sp, -0x60, %sp
	.word	0x99eec000	! t1_kref+0x11bc:   	restore	%i3, %g0, %o4
	.word	0xb1a01938	! t1_kref+0x11c0:   	fstod	%f24, %f24
	.word	0xa3a8c027	! t1_kref+0x11c4:   	fmovsul	%fcc0, %f7, %f17
	.word	0xec30a024	! t1_kref+0x11c8:   	sth	%l6, [%g2 + 0x24]
	.word	0x992b001a	! t1_kref+0x11cc:   	sll	%o4, %i2, %o4
	.word	0x9db18e4c	! t1_kref+0x11d0:   	fxnor	%f6, %f12, %f14
	.word	0x9805665e	! t1_kref+0x11d4:   	add	%l5, 0x65e, %o4
	.word	0x8143e022	! t1_kref+0x11d8:   	membar	0x22
	.word	0xda30a03c	! t1_kref+0x11dc:   	sth	%o5, [%g2 + 0x3c]
	.word	0x89b40e58	! t1_kref+0x11e0:   	fxnor	%f16, %f24, %f4
	.word	0xe0ee1000	! t1_kref+0x11e4:   	ldstuba	[%i0]0x80, %l0
	.word	0x89a01a37	! t1_kref+0x11e8:   	fstoi	%f23, %f4
	.word	0x81dd401f	! t1_kref+0x11ec:   	flush	%l5 + %i7
	.word	0xed1fbc98	! t1_kref+0x11f0:   	ldd	[%fp - 0x368], %f22
	.word	0x9916eb8d	! t1_kref+0x11f4:   	taddcctv	%i3, 0xb8d, %o4
	.word	0x95a10854	! t1_kref+0x11f8:   	faddd	%f4, %f20, %f10
	.word	0x190419c7	! t1_kref+0x11fc:   	sethi	%hi(0x10671c00), %o4
	.word	0xd84e001a	! t1_kref+0x1200:   	ldsb	[%i0 + %i2], %o4
	.word	0x23800001	! t1_kref+0x1204:   	fbne,a	_kref+0x1208
	.word	0xdd3e2010	! t1_kref+0x1208:   	std	%f14, [%i0 + 0x10]
	.word	0xb5b68d40	! t1_kref+0x120c:   	fnot1	%f26, %f26
	.word	0xd808a037	! t1_kref+0x1210:   	ldub	[%g2 + 0x37], %o4
	.word	0xd850a036	! t1_kref+0x1214:   	ldsh	[%g2 + 0x36], %o4
	.word	0xa1a489d6	! t1_kref+0x1218:   	fdivd	%f18, %f22, %f16
	.word	0x87b00cf8	! t1_kref+0x121c:   	fnot2s	%f24, %f3
	.word	0x99a0014e	! t1_kref+0x1220:   	fabsd	%f14, %f12
	.word	0x89b50a5a	! t1_kref+0x1224:   	fpadd32	%f20, %f26, %f4
	.word	0x98620011	! t1_kref+0x1228:   	subc	%o0, %l1, %o4
	.word	0x39800001	! t1_kref+0x122c:   	fbuge,a	_kref+0x1230
	.word	0xd9262010	! t1_kref+0x1230:   	st	%f12, [%i0 + 0x10]
	.word	0xe520a00c	! t1_kref+0x1234:   	st	%f18, [%g2 + 0xc]
	.word	0xd848a026	! t1_kref+0x1238:   	ldsb	[%g2 + 0x26], %o4
	.word	0x33800004	! t1_kref+0x123c:   	fbe,a	_kref+0x124c
	.word	0x91b30e80	! t1_kref+0x1240:   	fsrc1	%f12, %f8
	.word	0x98653b20	! t1_kref+0x1244:   	subc	%l4, -0x4e0, %o4
	.word	0x31800008	! t1_kref+0x1248:   	fba,a	_kref+0x1268
	.word	0x8fa00524	! t1_kref+0x124c:   	fsqrts	%f4, %f7
	.word	0xcd1e7fe0	! t1_kref+0x1250:   	ldd	[%i1 - 0x20], %f6
	.word	0xe1be5800	! t1_kref+0x1254:   	stda	%f16, [%i1]0xc0
	.word	0x98f2401c	! t1_kref+0x1258:   	udivcc	%o1, %i4, %o4
	.word	0xf628a00c	! t1_kref+0x125c:   	stb	%i3, [%g2 + 0xc]
	.word	0x98a34011	! t1_kref+0x1260:   	subcc	%o5, %l1, %o4
	.word	0x95a388c4	! t1_kref+0x1264:   	fsubd	%f14, %f4, %f10
	.word	0x99a0055a	! t1_kref+0x1268:   	fsqrtd	%f26, %f12
	.word	0xf11fbdb8	! t1_kref+0x126c:   	ldd	[%fp - 0x248], %f24
	.word	0xb5ab002c	! t1_kref+0x1270:   	fmovsuge	%fcc0, %f12, %f26
	.word	0x29800007	! t1_kref+0x1274:   	fbl,a	_kref+0x1290
	.word	0xec7e7ffc	! t1_kref+0x1278:   	swap	[%i1 - 4], %l6
	.word	0x99b30450	! t1_kref+0x127c:   	fcmpne16	%f12, %f16, %o4
	.word	0xa1a00554	! t1_kref+0x1280:   	fsqrtd	%f20, %f16
	.word	0x39480004	! t1_kref+0x1284:   	fbuge,a,pt	%fcc0, _kref+0x1294
	.word	0x98f58000	! t1_kref+0x1288:   	udivcc	%l6, %g0, %o4
	.word	0xcba71019	! t1_kref+0x128c:   	sta	%f5, [%i4 + %i1]0x80
	.word	0x982ab61d	! t1_kref+0x1290:   	andn	%o2, -0x9e3, %o4
	.word	0xb3a00539	! t1_kref+0x1294:   	fsqrts	%f25, %f25
	.word	0x91a388c8	! t1_kref+0x1298:   	fsubd	%f14, %f8, %f8
	.word	0x81aa0ada	! t1_kref+0x129c:   	fcmped	%fcc0, %f8, %f26
	.word	0x99400000	! t1_kref+0x12a0:   	mov	%y, %o4
	.word	0xe1260000	! t1_kref+0x12a4:   	st	%f16, [%i0]
	.word	0x8da01a56	! t1_kref+0x12a8:   	fdtoi	%f22, %f6
	.word	0x99b48028	! t1_kref+0x12ac:   	edge8n	%l2, %o0, %o4
	.word	0xb5a189cc	! t1_kref+0x12b0:   	fdivd	%f6, %f12, %f26
	.word	0xd2774018	! t1_kref+0x12b4:   	stx	%o1, [%i5 + %i0]
	.word	0xec3e6018	! t1_kref+0x12b8:   	std	%l6, [%i1 + 0x18]
	.word	0x98bcec4a	! t1_kref+0x12bc:   	xnorcc	%l3, 0xc4a, %o4
	.word	0xcd3e401d	! t1_kref+0x12c0:   	std	%f6, [%i1 + %i5]
	.word	0xc3ee1012	! t1_kref+0x12c4:   	prefetcha	%i0 + %l2, 1
	.word	0xa1b00f34	! t1_kref+0x12c8:   	fsrc2s	%f20, %f16
	.word	0x37800008	! t1_kref+0x12cc:   	fbge,a	_kref+0x12ec
	.word	0xd810a02e	! t1_kref+0x12d0:   	lduh	[%g2 + 0x2e], %o4
	.word	0x81ae8a2e	! t1_kref+0x12d4:   	fcmps	%fcc0, %f26, %f14
	.word	0x99a10846	! t1_kref+0x12d8:   	faddd	%f4, %f6, %f12
	.word	0xe420a02c	! t1_kref+0x12dc:   	st	%l2, [%g2 + 0x2c]
	.word	0x91b40d96	! t1_kref+0x12e0:   	fxor	%f16, %f22, %f8
	.word	0xada00144	! t1_kref+0x12e4:   	fabsd	%f4, %f22
	.word	0xdd20a034	! t1_kref+0x12e8:   	st	%f14, [%g2 + 0x34]
	.word	0xe220a01c	! t1_kref+0x12ec:   	st	%l1, [%g2 + 0x1c]
	.word	0x98bdf13a	! t1_kref+0x12f0:   	xnorcc	%l7, -0xec6, %o4
	.word	0xe47e0000	! t1_kref+0x12f4:   	swap	[%i0], %l2
	.word	0x8db10a2e	! t1_kref+0x12f8:   	fpadd16s	%f4, %f14, %f6
	.word	0x9db40910	! t1_kref+0x12fc:   	faligndata	%f16, %f16, %f14
	.word	0x8bb00c20	! t1_kref+0x1300:   	fzeros	%f5
	.word	0x9db00c00	! t1_kref+0x1304:   	fzero	%f14
	.word	0x9da0188d	! t1_kref+0x1308:   	fitos	%f13, %f14
	.word	0xb3b00cf9	! t1_kref+0x130c:   	fnot2s	%f25, %f25
	.word	0x31480002	! t1_kref+0x1310:   	fba,a,pt	%fcc0, _kref+0x1318
	.word	0x99b5035c	! t1_kref+0x1314:   	alignaddrl	%l4, %i4, %o4
	.word	0x81ad8ac2	! t1_kref+0x1318:   	fcmped	%fcc0, %f22, %f2
	.word	0x99b20240	! t1_kref+0x131c:   	array16	%o0, %g0, %o4
	.word	0x33480002	! t1_kref+0x1320:   	fbe,a,pt	%fcc0, _kref+0x1328
	.word	0xd030a01c	! t1_kref+0x1324:   	sth	%o0, [%g2 + 0x1c]
	.word	0x99b5c320	! t1_kref+0x1328:   	bmask	%l7, %g0, %o4
	.word	0x95a00544	! t1_kref+0x132c:   	fsqrtd	%f4, %f10
	.word	0x27800007	! t1_kref+0x1330:   	fbul,a	_kref+0x134c
	.word	0xe228a02c	! t1_kref+0x1334:   	stb	%l1, [%g2 + 0x2c]
	.word	0x81830000	! t1_kref+0x1338:   	wr	%o4, %g0, %y
	.word	0xe06e7fff	! t1_kref+0x133c:   	ldstub	[%i1 - 1], %l0
	.word	0x9865800c	! t1_kref+0x1340:   	subc	%l6, %o4, %o4
	.word	0x98c32a0f	! t1_kref+0x1344:   	addccc	%o4, 0xa0f, %o4
	.word	0x95a60842	! t1_kref+0x1348:   	faddd	%f24, %f2, %f10
	.word	0x97b007ae	! t1_kref+0x134c:   	fpackfix	%f14, %f11
	.word	0x8182c000	! t1_kref+0x1350:   	wr	%o3, %g0, %y
	.word	0xd520a03c	! t1_kref+0x1354:   	st	%f10, [%g2 + 0x3c]
	.word	0x990ec015	! t1_kref+0x1358:   	tsubcc	%i3, %l5, %o4
	.word	0xd8567ffc	! t1_kref+0x135c:   	ldsh	[%i1 - 4], %o4
	.word	0x99b504d8	! t1_kref+0x1360:   	fcmpne32	%f20, %f24, %o4
	sethi	%hi(2f), %o7
	.word	0xe40be3a0	! t1_kref+0x1368:   	ldub	[%o7 + 0x3a0], %l2
	.word	0xa41ca00c	! t1_kref+0x136c:   	xor	%l2, 0xc, %l2
	.word	0xe42be3a0	! t1_kref+0x1370:   	stb	%l2, [%o7 + 0x3a0]
	.word	0x81dbe3a0	! t1_kref+0x1374:   	flush	%o7 + 0x3a0
	.word	0x81de001e	! t1_kref+0x1378:   	flush	%i0 + %fp
	.word	0x98e50016	! t1_kref+0x137c:   	subccc	%l4, %l6, %o4
	.word	0xd27e001c	! t1_kref+0x1380:   	swap	[%i0 + %i4], %o1
	.word	0x9893000a	! t1_kref+0x1384:   	orcc	%o4, %o2, %o4
	.word	0xf3861000	! t1_kref+0x1388:   	lda	[%i0]0x80, %f25
	.word	0xe168a0c6	! t1_kref+0x138c:   	prefetch	%g2 + 0xc6, 16
	.word	0xed1e7ff0	! t1_kref+0x1390:   	ldd	[%i1 - 0x10], %f22
	.word	0xd8464000	! t1_kref+0x1394:   	ldsw	[%i1], %o4
	.word	0x21800003	! t1_kref+0x1398:   	fbn,a	_kref+0x13a4
	.word	0x98254015	! t1_kref+0x139c:   	sub	%l5, %l5, %o4
2:	.word	0xd8500018	! t1_kref+0x13a0:   	ldsh	[%g0 + %i0], %o4
	.word	0x98f368e4	! t1_kref+0x13a4:   	udivcc	%o5, 0x8e4, %o4
	.word	0x98f6e0d3	! t1_kref+0x13a8:   	udivcc	%i3, 0xd3, %o4
	.word	0xafa00027	! t1_kref+0x13ac:   	fmovs	%f7, %f23
	.word	0x89a109ce	! t1_kref+0x13b0:   	fdivd	%f4, %f14, %f4
	.word	0x9fa0188f	! t1_kref+0x13b4:   	fitos	%f15, %f15
	.word	0x8db48d8c	! t1_kref+0x13b8:   	fxor	%f18, %f12, %f6
	.word	0x193ccd03	! t1_kref+0x13bc:   	sethi	%hi(0xf3340c00), %o4
	.word	0xa1b00fc0	! t1_kref+0x13c0:   	fone	%f16
	.word	0x987ec00b	! t1_kref+0x13c4:   	sdiv	%i3, %o3, %o4
	.word	0xaba00537	! t1_kref+0x13c8:   	fsqrts	%f23, %f21
	.word	0xb1a01891	! t1_kref+0x13cc:   	fitos	%f17, %f24
	.word	0x9f414000	! t1_kref+0x13d0:   	mov	%pc, %o7
!	.word	0x394a130b	! t1_kref+0x13d4:   	fbuge,a,pt	%fcc0, SYM(t1_subr3)
	   	fbuge,a,pt	%fcc0, SYM(t1_subr3)
	.word	0xada18935	! t1_kref+0x13d8:   	fmuls	%f6, %f21, %f22
	.word	0xd80e7feb	! t1_kref+0x13dc:   	ldub	[%i1 - 0x15], %o4
	.word	0x8da00558	! t1_kref+0x13e0:   	fsqrtd	%f24, %f6
	.word	0x99408000	! t1_kref+0x13e4:   	mov	%ccr, %o4
	.word	0x9de3bfa0	! t1_kref+0x13e8:   	save	%sp, -0x60, %sp
	.word	0x99eec01a	! t1_kref+0x13ec:   	restore	%i3, %i2, %o4
	.word	0x98027828	! t1_kref+0x13f0:   	add	%o1, -0x7d8, %o4
	.word	0xe968a105	! t1_kref+0x13f4:   	prefetch	%g2 + 0x105, 20
	.word	0x87a108ba	! t1_kref+0x13f8:   	fsubs	%f4, %f26, %f3
	.word	0x98f5eaff	! t1_kref+0x13fc:   	udivcc	%l7, 0xaff, %o4
	.word	0xd800a01c	! t1_kref+0x1400:   	ld	[%g2 + 0x1c], %o4
	.word	0xd6ee9018	! t1_kref+0x1404:   	ldstuba	[%i2 + %i0]0x80, %o3
	.word	0xd808a00d	! t1_kref+0x1408:   	ldub	[%g2 + 0xd], %o4
	.word	0xe828a004	! t1_kref+0x140c:   	stb	%l4, [%g2 + 4]
	.word	0x91a0054c	! t1_kref+0x1410:   	fsqrtd	%f12, %f8
	.word	0xb5a58850	! t1_kref+0x1414:   	faddd	%f22, %f16, %f26
	sethi	%hi(2f), %o7
	.word	0xe40be02c	! t1_kref+0x141c:   	ldub	[%o7 + 0x2c], %l2
	.word	0xa41ca00c	! t1_kref+0x1420:   	xor	%l2, 0xc, %l2
	.word	0xe42be02c	! t1_kref+0x1424:   	stb	%l2, [%o7 + 0x2c]
	.word	0x81dbe02c	! t1_kref+0x1428:   	flush	%o7 + 0x2c
2:	.word	0x9866e02b	! t1_kref+0x142c:   	subc	%i3, 0x2b, %o4
	.word	0x993da013	! t1_kref+0x1430:   	sra	%l6, 0x13, %o4
	.word	0x9ba0188b	! t1_kref+0x1434:   	fitos	%f11, %f13
	.word	0x98a4bf3e	! t1_kref+0x1438:   	subcc	%l2, -0xc2, %o4
	.word	0xd13e001d	! t1_kref+0x143c:   	std	%f8, [%i0 + %i5]
	.word	0x992c601c	! t1_kref+0x1440:   	sll	%l1, 0x1c, %o4
	.word	0xb1a018d6	! t1_kref+0x1444:   	fdtos	%f22, %f24
	.word	0x99b4407b	! t1_kref+0x1448:   	edge8ln	%l1, %i3, %o4
	.word	0x31480002	! t1_kref+0x144c:   	fba,a,pt	%fcc0, _kref+0x1454
	.word	0x99a01a52	! t1_kref+0x1450:   	fdtoi	%f18, %f12
	.word	0x98602820	! t1_kref+0x1454:   	subc	%g0, 0x820, %o4
	.word	0x99b5433c	! t1_kref+0x1458:   	bmask	%l5, %i4, %o4
	.word	0x98db001a	! t1_kref+0x145c:   	smulcc	%o4, %i2, %o4
	.word	0x81848000	! t1_kref+0x1460:   	wr	%l2, %g0, %y
	.word	0x98634000	! t1_kref+0x1464:   	subc	%o5, %g0, %o4
	.word	0xa5b486ca	! t1_kref+0x1468:   	fmul8sux16	%f18, %f10, %f18
	.word	0xc030a00e	! t1_kref+0x146c:   	clrh	[%g2 + 0xe]
	.word	0xd2763fe0	! t1_kref+0x1470:   	stx	%o1, [%i0 - 0x20]
	.word	0x89a00550	! t1_kref+0x1474:   	fsqrtd	%f16, %f4
	.word	0xd84e2011	! t1_kref+0x1478:   	ldsb	[%i0 + 0x11], %o4
	.word	0x191e6e49	! t1_kref+0x147c:   	sethi	%hi(0x79b92400), %o4
	.word	0x37480006	! t1_kref+0x1480:   	fbge,a,pt	%fcc0, _kref+0x1498
	.word	0xd808a02c	! t1_kref+0x1484:   	ldub	[%g2 + 0x2c], %o4
	.word	0x98b80009	! t1_kref+0x1488:   	xnorcc	%g0, %o1, %o4
	.word	0x9864b54a	! t1_kref+0x148c:   	subc	%l2, -0xab6, %o4
	.word	0xa1b3cfba	! t1_kref+0x1490:   	fors	%f15, %f26, %f16
	.word	0xd8067fe0	! t1_kref+0x1494:   	ld	[%i1 - 0x20], %o4
	.word	0x8143c000	! t1_kref+0x1498:   	stbar
	.word	0x9924c01c	! t1_kref+0x149c:   	mulscc	%l3, %i4, %o4
	call	SYM(t1_subr1)
	.word	0x99a00550	! t1_kref+0x14a4:   	fsqrtd	%f16, %f12
	.word	0x95b00fc0	! t1_kref+0x14a8:   	fone	%f10
	.word	0x95b009ab	! t1_kref+0x14ac:   	fexpand	%f11, %f10
	.word	0xd808a034	! t1_kref+0x14b0:   	ldub	[%g2 + 0x34], %o4
	.word	0x192efaf2	! t1_kref+0x14b4:   	sethi	%hi(0xbbebc800), %o4
	.word	0x99408000	! t1_kref+0x14b8:   	mov	%ccr, %o4
	sethi	%hi(2f), %o7
	.word	0xe40be0d8	! t1_kref+0x14c0:   	ldub	[%o7 + 0xd8], %l2
	.word	0xa41ca00c	! t1_kref+0x14c4:   	xor	%l2, 0xc, %l2
	.word	0xe42be0d8	! t1_kref+0x14c8:   	stb	%l2, [%o7 + 0xd8]
	.word	0x81dbe0d8	! t1_kref+0x14cc:   	flush	%o7 + 0xd8
	.word	0xd84e3ff2	! t1_kref+0x14d0:   	ldsb	[%i0 - 0xe], %o4
	.word	0x81820000	! t1_kref+0x14d4:   	wr	%o0, %g0, %y
2:	.word	0xd80e0000	! t1_kref+0x14d8:   	ldub	[%i0], %o4
	.word	0x98e5b7f3	! t1_kref+0x14dc:   	subccc	%l6, -0x80d, %o4
	.word	0x99252a6a	! t1_kref+0x14e0:   	mulscc	%l4, 0xa6a, %o4
	.word	0xa7850016	! t1_kref+0x14e4:   	wr	%l4, %l6, %gsr
	.word	0x81ac0ab5	! t1_kref+0x14e8:   	fcmpes	%fcc0, %f16, %f21
	.word	0x98c2c00a	! t1_kref+0x14ec:   	addccc	%o3, %o2, %o4
	.word	0xa9b38979	! t1_kref+0x14f0:   	fpmerge	%f14, %f25, %f20
	.word	0x81aa0aad	! t1_kref+0x14f4:   	fcmpes	%fcc0, %f8, %f13
	.word	0xb1a01096	! t1_kref+0x14f8:   	fxtos	%f22, %f24
	.word	0x98657668	! t1_kref+0x14fc:   	subc	%l5, -0x998, %o4
	.word	0x98070000	! t1_kref+0x1500:   	add	%i4, %g0, %o4
	.word	0x25480004	! t1_kref+0x1504:   	fblg,a,pt	%fcc0, _kref+0x1514
	.word	0xd9be5816	! t1_kref+0x1508:   	stda	%f12, [%i1 + %l6]0xc0
	.word	0x3f480007	! t1_kref+0x150c:   	fbo,a,pt	%fcc0, _kref+0x1528
	.word	0x91a00552	! t1_kref+0x1510:   	fsqrtd	%f18, %f8
	.word	0x81aa8a38	! t1_kref+0x1514:   	fcmps	%fcc0, %f10, %f24
	.word	0x99a0054e	! t1_kref+0x1518:   	fsqrtd	%f14, %f12
	.word	0x3d800008	! t1_kref+0x151c:   	fbule,a	_kref+0x153c
	.word	0xd43e2010	! t1_kref+0x1520:   	std	%o2, [%i0 + 0x10]
	.word	0x984237f7	! t1_kref+0x1524:   	addc	%o0, -0x809, %o4
	.word	0x91a00534	! t1_kref+0x1528:   	fsqrts	%f20, %f8
	.word	0xc9262000	! t1_kref+0x152c:   	st	%f4, [%i0]
	.word	0xe676001d	! t1_kref+0x1530:   	stx	%l3, [%i0 + %i5]
	.word	0x98f2801b	! t1_kref+0x1534:   	udivcc	%o2, %i3, %o4
	.word	0x23800001	! t1_kref+0x1538:   	fbne,a	_kref+0x153c
	.word	0x98a3000c	! t1_kref+0x153c:   	subcc	%o4, %o4, %o4
	sethi	%hi(2f), %o7
	.word	0xe40be160	! t1_kref+0x1544:   	ldub	[%o7 + 0x160], %l2
	.word	0xa41ca00c	! t1_kref+0x1548:   	xor	%l2, 0xc, %l2
	.word	0xe42be160	! t1_kref+0x154c:   	stb	%l2, [%o7 + 0x160]
	.word	0x81dbe160	! t1_kref+0x1550:   	flush	%o7 + 0x160
	.word	0xaba01a36	! t1_kref+0x1554:   	fstoi	%f22, %f21
	.word	0xada00539	! t1_kref+0x1558:   	fsqrts	%f25, %f22
	.word	0x99b38508	! t1_kref+0x155c:   	fcmpgt16	%f14, %f8, %o4
2:	.word	0xd856c018	! t1_kref+0x1560:   	ldsh	[%i3 + %i0], %o4
	sethi	%hi(2f), %o7
	.word	0xe40be19c	! t1_kref+0x1568:   	ldub	[%o7 + 0x19c], %l2
	.word	0xa41ca00c	! t1_kref+0x156c:   	xor	%l2, 0xc, %l2
	.word	0xe42be19c	! t1_kref+0x1570:   	stb	%l2, [%o7 + 0x19c]
	.word	0x81dbe19c	! t1_kref+0x1574:   	flush	%o7 + 0x19c
	.word	0xada28848	! t1_kref+0x1578:   	faddd	%f10, %f8, %f22
	.word	0x98558015	! t1_kref+0x157c:   	umul	%l6, %l5, %o4
	.word	0xf8364000	! t1_kref+0x1580:   	sth	%i4, [%i1]
	.word	0xa9b48ea0	! t1_kref+0x1584:   	fsrc1s	%f18, %f20
	.word	0xd8567fe2	! t1_kref+0x1588:   	ldsh	[%i1 - 0x1e], %o4
	.word	0x99b20240	! t1_kref+0x158c:   	array16	%o0, %g0, %o4
	.word	0x98d5fc4f	! t1_kref+0x1590:   	umulcc	%l7, -0x3b1, %o4
	.word	0x81df0008	! t1_kref+0x1594:   	flush	%i4 + %o0
	.word	0x99408000	! t1_kref+0x1598:   	mov	%ccr, %o4
2:	.word	0x99b000eb	! t1_kref+0x159c:   	edge16ln	%g0, %o3, %o4
	.word	0x98e30008	! t1_kref+0x15a0:   	subccc	%o4, %o0, %o4
	.word	0x98544013	! t1_kref+0x15a4:   	umul	%l1, %l3, %o4
	.word	0x98fd8015	! t1_kref+0x15a8:   	sdivcc	%l6, %l5, %o4
	.word	0x99b5c134	! t1_kref+0x15ac:   	edge32n	%l7, %l4, %o4
	.word	0xd628a01d	! t1_kref+0x15b0:   	stb	%o3, [%g2 + 0x1d]
	.word	0xd8563fe0	! t1_kref+0x15b4:   	ldsh	[%i0 - 0x20], %o4
	.word	0x91a01913	! t1_kref+0x15b8:   	fitod	%f19, %f8
	.word	0x99b58135	! t1_kref+0x15bc:   	edge32n	%l6, %l5, %o4
	.word	0xd8163fe4	! t1_kref+0x15c0:   	lduh	[%i0 - 0x1c], %o4
	.word	0x3c800004	! t1_kref+0x15c4:   	bpos,a	_kref+0x15d4
	.word	0xa7a3c928	! t1_kref+0x15c8:   	fmuls	%f15, %f8, %f19
	.word	0x8182c000	! t1_kref+0x15cc:   	wr	%o3, %g0, %y
	.word	0x98fec012	! t1_kref+0x15d0:   	sdivcc	%i3, %l2, %o4
	.word	0x98350011	! t1_kref+0x15d4:   	orn	%l4, %l1, %o4
	.word	0x982a7839	! t1_kref+0x15d8:   	andn	%o1, -0x7c7, %o4
	.word	0x98147b30	! t1_kref+0x15dc:   	or	%l1, -0x4d0, %o4
	.word	0xa9a34937	! t1_kref+0x15e0:   	fmuls	%f13, %f23, %f20
	.word	0x91a00525	! t1_kref+0x15e4:   	fsqrts	%f5, %f8
	.word	0x98bd6c70	! t1_kref+0x15e8:   	xnorcc	%l5, 0xc70, %o4
	.word	0x989d7a46	! t1_kref+0x15ec:   	xorcc	%l5, -0x5ba, %o4
	.word	0xed20a004	! t1_kref+0x15f0:   	st	%f22, [%g2 + 4]
	.word	0x81ac8a42	! t1_kref+0x15f4:   	fcmpd	%fcc0, %f18, %f2
	.word	0x8db286ee	! t1_kref+0x15f8:   	fmul8ulx16	%f10, %f14, %f6
	.word	0x993dc015	! t1_kref+0x15fc:   	sra	%l7, %l5, %o4
	.word	0x9da3c824	! t1_kref+0x1600:   	fadds	%f15, %f4, %f14
	.word	0x98e2c00d	! t1_kref+0x1604:   	subccc	%o3, %o5, %o4
	.word	0xd84e2018	! t1_kref+0x1608:   	ldsb	[%i0 + 0x18], %o4
	.word	0xabb5cdab	! t1_kref+0x160c:   	fxors	%f23, %f11, %f21
	.word	0x81aa0a28	! t1_kref+0x1610:   	fcmps	%fcc0, %f8, %f8
	.word	0x9884e1f5	! t1_kref+0x1614:   	addcc	%l3, 0x1f5, %o4
	.word	0xee362002	! t1_kref+0x1618:   	sth	%l7, [%i0 + 2]
	.word	0x98dda452	! t1_kref+0x161c:   	smulcc	%l6, 0x452, %o4
	.word	0xd830a00e	! t1_kref+0x1620:   	sth	%o4, [%g2 + 0xe]
	.word	0xb1a0102e	! t1_kref+0x1624:   	fstox	%f14, %f24
	.word	0xed1fbeb8	! t1_kref+0x1628:   	ldd	[%fp - 0x148], %f22
	.word	0x37800002	! t1_kref+0x162c:   	fbge,a	_kref+0x1634
	.word	0x987dbc88	! t1_kref+0x1630:   	sdiv	%l6, -0x378, %o4
	.word	0x98c4c00a	! t1_kref+0x1634:   	addccc	%l3, %o2, %o4
	.word	0xefee101b	! t1_kref+0x1638:   	prefetcha	%i0 + %i3, 23
	.word	0x8fb48ea0	! t1_kref+0x163c:   	fsrc1s	%f18, %f7
	.word	0x99a0054c	! t1_kref+0x1640:   	fsqrtd	%f12, %f12
	.word	0x9db00c00	! t1_kref+0x1644:   	fzero	%f14
	.word	0x8143c000	! t1_kref+0x1648:   	stbar
	.word	0xb1a609d6	! t1_kref+0x164c:   	fdivd	%f24, %f22, %f24
	.word	0x878020f0	! t1_kref+0x1650:   	mov	0xf0, %asi
	sethi	%hi(2f), %o7
	.word	0xe40be288	! t1_kref+0x1658:   	ldub	[%o7 + 0x288], %l2
	.word	0xa41ca00c	! t1_kref+0x165c:   	xor	%l2, 0xc, %l2
	.word	0xe42be288	! t1_kref+0x1660:   	stb	%l2, [%o7 + 0x288]
	.word	0x81dbe288	! t1_kref+0x1664:   	flush	%o7 + 0x288
	.word	0xa1a00546	! t1_kref+0x1668:   	fsqrtd	%f6, %f16
	.word	0xe620a014	! t1_kref+0x166c:   	st	%l3, [%g2 + 0x14]
	.word	0x99b2c34b	! t1_kref+0x1670:   	alignaddrl	%o3, %o3, %o4
	.word	0xb3a01a4c	! t1_kref+0x1674:   	fdtoi	%f12, %f25
	.word	0xb5a109ac	! t1_kref+0x1678:   	fdivs	%f4, %f12, %f26
	.word	0x95b00fc0	! t1_kref+0x167c:   	fone	%f10
	.word	0xa1a01030	! t1_kref+0x1680:   	fstox	%f16, %f16
	.word	0x81ae0ac6	! t1_kref+0x1684:   	fcmped	%fcc0, %f24, %f6
2:	.word	0xd428a024	! t1_kref+0x1688:   	stb	%o2, [%g2 + 0x24]
	.word	0x99400000	! t1_kref+0x168c:   	mov	%y, %o4
	.word	0x91a00536	! t1_kref+0x1690:   	fsqrts	%f22, %f8
	.word	0xc1ee5012	! t1_kref+0x1694:   	prefetcha	%i1 + %l2, 0
	.word	0x2a480005	! t1_kref+0x1698:   	bcs,a,pt	%icc, _kref+0x16ac
	.word	0x98a6b901	! t1_kref+0x169c:   	subcc	%i2, -0x6ff, %o4
	.word	0x89b00cf2	! t1_kref+0x16a0:   	fnot2s	%f18, %f4
	.word	0xc398a0c0	! t1_kref+0x16a4:   	ldda	[%g2 + 0xc0]%asi, %f32
	.word	0x98ba8011	! t1_kref+0x16a8:   	xnorcc	%o2, %l1, %o4
	.word	0xa5a00542	! t1_kref+0x16ac:   	fsqrtd	%f2, %f18
	.word	0x81acca30	! t1_kref+0x16b0:   	fcmps	%fcc0, %f19, %f16
	.word	0xd8460000	! t1_kref+0x16b4:   	ldsw	[%i0], %o4
	.word	0x8fa28834	! t1_kref+0x16b8:   	fadds	%f10, %f20, %f7
	.word	0xe3b8a100	! t1_kref+0x16bc:   	stda	%f48, [%g2 + 0x100]%asi
	.word	0xda7e0000	! t1_kref+0x16c0:   	swap	[%i0], %o5
	.word	0x98f46107	! t1_kref+0x16c4:   	udivcc	%l1, 0x107, %o4
	.word	0x9fb48ea0	! t1_kref+0x16c8:   	fsrc1s	%f18, %f15
	.word	0x81844000	! t1_kref+0x16cc:   	wr	%l1, %g0, %y
	.word	0xe8a01018	! t1_kref+0x16d0:   	sta	%l4, [%g0 + %i0]0x80
	.word	0xe5180018	! t1_kref+0x16d4:   	ldd	[%g0 + %i0], %f18
	.word	0xa5b30f96	! t1_kref+0x16d8:   	for	%f12, %f22, %f18
	.word	0x89b286e4	! t1_kref+0x16dc:   	fmul8ulx16	%f10, %f4, %f4
	.word	0x81ab4a24	! t1_kref+0x16e0:   	fcmps	%fcc0, %f13, %f4
	.word	0xec180019	! t1_kref+0x16e4:   	ldd	[%g0 + %i1], %l6
	.word	0x89a189ad	! t1_kref+0x16e8:   	fdivs	%f6, %f13, %f4
	.word	0x27800004	! t1_kref+0x16ec:   	fbul,a	_kref+0x16fc
	.word	0xe420a03c	! t1_kref+0x16f0:   	st	%l2, [%g2 + 0x3c]
	.word	0xd810a02c	! t1_kref+0x16f4:   	lduh	[%g2 + 0x2c], %o4
	.word	0x89a2084a	! t1_kref+0x16f8:   	faddd	%f8, %f10, %f4
	.word	0x98fd7f06	! t1_kref+0x16fc:   	sdivcc	%l5, -0xfa, %o4
	.word	0x81858000	! t1_kref+0x1700:   	wr	%l6, %g0, %y
	.word	0xa1b0c978	! t1_kref+0x1704:   	fpmerge	%f3, %f24, %f16
	.word	0xec20a03c	! t1_kref+0x1708:   	st	%l6, [%g2 + 0x3c]
	.word	0xafa2c9b3	! t1_kref+0x170c:   	fdivs	%f11, %f19, %f23
	.word	0xb3a0188b	! t1_kref+0x1710:   	fitos	%f11, %f25
	.word	0x98bb70ed	! t1_kref+0x1714:   	xnorcc	%o5, -0xf13, %o4
	.word	0xda7e401c	! t1_kref+0x1718:   	swap	[%i1 + %i4], %o5
	.word	0x9970398a	! t1_kref+0x171c:   	popc	-0x676, %o4
	.word	0x9de3bfa0	! t1_kref+0x1720:   	save	%sp, -0x60, %sp
	.word	0x99ef4000	! t1_kref+0x1724:   	restore	%i5, %g0, %o4
	.word	0x993d401c	! t1_kref+0x1728:   	sra	%l5, %i4, %o4
	.word	0xda6e3ff4	! t1_kref+0x172c:   	ldstub	[%i0 - 0xc], %o5
	.word	0x3c480005	! t1_kref+0x1730:   	bpos,a,pt	%icc, _kref+0x1744
	.word	0xd810a03c	! t1_kref+0x1734:   	lduh	[%g2 + 0x3c], %o4
	.word	0xd80e8019	! t1_kref+0x1738:   	ldub	[%i2 + %i1], %o4
	.word	0xeb00a02c	! t1_kref+0x173c:   	ld	[%g2 + 0x2c], %f21
	.word	0x989e800c	! t1_kref+0x1740:   	xorcc	%i2, %o4, %o4
	.word	0xeb20a034	! t1_kref+0x1744:   	st	%f21, [%g2 + 0x34]
	.word	0xd850a034	! t1_kref+0x1748:   	ldsh	[%g2 + 0x34], %o4
	.word	0xd8c8105a	! t1_kref+0x174c:   	ldsba	[%g0 + %i2]0x82, %o4
	.word	0xa7a18934	! t1_kref+0x1750:   	fmuls	%f6, %f20, %f19
	.word	0x99b10454	! t1_kref+0x1754:   	fcmpne16	%f4, %f20, %o4
	.word	0xf100a014	! t1_kref+0x1758:   	ld	[%g2 + 0x14], %f24
	.word	0xcd00a014	! t1_kref+0x175c:   	ld	[%g2 + 0x14], %f6
	.word	0x85b20e80	! t1_kref+0x1760:   	fsrc1	%f8, %f2
	call	1f
	.empty
	.word	0xaba01a46	! t1_kref+0x1768:   	fdtoi	%f6, %f21
	.word	0x9da01042	! t1_kref+0x176c:   	fdtox	%f2, %f14
	.word	0x987a8011	! t1_kref+0x1770:   	sdiv	%o2, %l1, %o4
	.word	0x99b580fb	! t1_kref+0x1774:   	edge16ln	%l6, %i3, %o4
	.word	0x8da689d8	! t1_kref+0x1778:   	fdivd	%f26, %f24, %f6
	.word	0x81ac8a2c	! t1_kref+0x177c:   	fcmps	%fcc0, %f18, %f12
1:	.word	0x984364fd	! t1_kref+0x1780:   	addc	%o5, 0x4fd, %o4
	.word	0xa5a58854	! t1_kref+0x1784:   	faddd	%f22, %f20, %f18
	.word	0xe3ee501b	! t1_kref+0x1788:   	prefetcha	%i1 + %i3, 17
	.word	0x98dec015	! t1_kref+0x178c:   	smulcc	%i3, %l5, %o4
	.word	0xb5b68fb7	! t1_kref+0x1790:   	fors	%f26, %f23, %f26
	.word	0x87a5092c	! t1_kref+0x1794:   	fmuls	%f20, %f12, %f3
	.word	0xd84e401a	! t1_kref+0x1798:   	ldsb	[%i1 + %i2], %o4
	.word	0x8143e040	! t1_kref+0x179c:   	membar	0x40
	.word	0x98d47845	! t1_kref+0x17a0:   	umulcc	%l1, -0x7bb, %o4
	.word	0x98853de5	! t1_kref+0x17a4:   	addcc	%l4, -0x21b, %o4
	.word	0xd91e3ff8	! t1_kref+0x17a8:   	ldd	[%i0 - 8], %f12
	.word	0xd808a03f	! t1_kref+0x17ac:   	ldub	[%g2 + 0x3f], %o4
	.word	0x2a480001	! t1_kref+0x17b0:   	bcs,a,pt	%icc, _kref+0x17b4
	.word	0x8da0104a	! t1_kref+0x17b4:   	fdtox	%f10, %f6
	.word	0x878020d0	! t1_kref+0x17b8:   	mov	0xd0, %asi
	.word	0x3d480006	! t1_kref+0x17bc:   	fbule,a,pt	%fcc0, _kref+0x17d4
	.word	0x992d6019	! t1_kref+0x17c0:   	sll	%l5, 0x19, %o4
	.word	0x99400000	! t1_kref+0x17c4:   	mov	%y, %o4
	.word	0x85a01906	! t1_kref+0x17c8:   	fitod	%f6, %f2
	.word	0xd8500019	! t1_kref+0x17cc:   	ldsh	[%g0 + %i1], %o4
	.word	0x98df2bc1	! t1_kref+0x17d0:   	smulcc	%i4, 0xbc1, %o4
	.word	0xd67f0019	! t1_kref+0x17d4:   	swap	[%i4 + %i1], %o3
	.word	0x85a0055a	! t1_kref+0x17d8:   	fsqrtd	%f26, %f2
	.word	0xa5a00552	! t1_kref+0x17dc:   	fsqrtd	%f18, %f18
	.word	0xe1be1808	! t1_kref+0x17e0:   	stda	%f16, [%i0 + %o0]0xc0
	.word	0xa9a289a3	! t1_kref+0x17e4:   	fdivs	%f10, %f3, %f20
	.word	0x98ba3f52	! t1_kref+0x17e8:   	xnorcc	%o0, -0xae, %o4
	.word	0x3b800003	! t1_kref+0x17ec:   	fble,a	_kref+0x17f8
	.word	0xd91e7fe8	! t1_kref+0x17f0:   	ldd	[%i1 - 0x18], %f12
	.word	0x983e801b	! t1_kref+0x17f4:   	xnor	%i2, %i3, %o4
	.word	0x98bb0016	! t1_kref+0x17f8:   	xnorcc	%o4, %l6, %o4
	.word	0xd028a027	! t1_kref+0x17fc:   	stb	%o0, [%g2 + 0x27]
	.word	0x39480005	! t1_kref+0x1800:   	fbuge,a,pt	%fcc0, _kref+0x1814
	.word	0xe5a65000	! t1_kref+0x1804:   	sta	%f18, [%i1]0x80
	.word	0x91b44d36	! t1_kref+0x1808:   	fandnot1s	%f17, %f22, %f8
	.word	0x9852fe58	! t1_kref+0x180c:   	umul	%o3, -0x1a8, %o4
	.word	0x981d001a	! t1_kref+0x1810:   	xor	%l4, %i2, %o4
	.word	0x98dcbac6	! t1_kref+0x1814:   	smulcc	%l2, -0x53a, %o4
	.word	0x81ab8ad2	! t1_kref+0x1818:   	fcmped	%fcc0, %f14, %f18
	.word	0x98d2fc0c	! t1_kref+0x181c:   	umulcc	%o3, -0x3f4, %o4
	.word	0x81d9000d	! t1_kref+0x1820:   	flush	%g4 + %o5
	.word	0x99a0054a	! t1_kref+0x1824:   	fsqrtd	%f10, %f12
	.word	0xb5a01915	! t1_kref+0x1828:   	fitod	%f21, %f26
	.word	0xd220a02c	! t1_kref+0x182c:   	st	%o1, [%g2 + 0x2c]
	.word	0x24480004	! t1_kref+0x1830:   	ble,a,pt	%icc, _kref+0x1840
	.word	0xabb0cda3	! t1_kref+0x1834:   	fxors	%f3, %f3, %f21
	.word	0xb5a01a46	! t1_kref+0x1838:   	fdtoi	%f6, %f26
	.word	0x8185c000	! t1_kref+0x183c:   	wr	%l7, %g0, %y
	.word	0x30800001	! t1_kref+0x1840:   	ba,a	_kref+0x1844
	.word	0x98a5f3d2	! t1_kref+0x1844:   	subcc	%l7, -0xc2e, %o4
	.word	0xe03e2010	! t1_kref+0x1848:   	std	%l0, [%i0 + 0x10]
	.word	0xdd00a00c	! t1_kref+0x184c:   	ld	[%g2 + 0xc], %f14
	.word	0x87a01884	! t1_kref+0x1850:   	fitos	%f4, %f3
	.word	0x31800008	! t1_kref+0x1854:   	fba,a	_kref+0x1874
	.word	0xee78a01c	! t1_kref+0x1858:   	swap	[%g2 + 0x1c], %l7
	.word	0x98bb75bd	! t1_kref+0x185c:   	xnorcc	%o5, -0xa43, %o4
	.word	0x99400000	! t1_kref+0x1860:   	mov	%y, %o4
	.word	0x983dfdba	! t1_kref+0x1864:   	xnor	%l7, -0x246, %o4
	.word	0x89a389b9	! t1_kref+0x1868:   	fdivs	%f14, %f25, %f4
	.word	0x988c8011	! t1_kref+0x186c:   	andcc	%l2, %l1, %o4
	.word	0x993da017	! t1_kref+0x1870:   	sra	%l6, 0x17, %o4
	.word	0x982a4008	! t1_kref+0x1874:   	andn	%o1, %o0, %o4
	.word	0xa1b50f8a	! t1_kref+0x1878:   	for	%f20, %f10, %f16
	.word	0x95a00558	! t1_kref+0x187c:   	fsqrtd	%f24, %f10
	.word	0xc91e0000	! t1_kref+0x1880:   	ldd	[%i0], %f4
	.word	0x89a40954	! t1_kref+0x1884:   	fmuld	%f16, %f20, %f4
	.word	0x33800008	! t1_kref+0x1888:   	fbe,a	_kref+0x18a8
	.word	0xd856c018	! t1_kref+0x188c:   	ldsh	[%i3 + %i0], %o4
	.word	0xeb68a080	! t1_kref+0x1890:   	prefetch	%g2 + 0x80, 21
	.word	0x9db64de6	! t1_kref+0x1894:   	fnands	%f25, %f6, %f14
	.word	0x98926dac	! t1_kref+0x1898:   	orcc	%o1, 0xdac, %o4
	.word	0x9da00548	! t1_kref+0x189c:   	fsqrtd	%f8, %f14
	.word	0xadb00fe0	! t1_kref+0x18a0:   	fones	%f22
	.word	0xed1fbdf8	! t1_kref+0x18a4:   	ldd	[%fp - 0x208], %f22
	.word	0xd51fbf08	! t1_kref+0x18a8:   	ldd	[%fp - 0xf8], %f10
	.word	0x9fa00529	! t1_kref+0x18ac:   	fsqrts	%f9, %f15
	.word	0x24800002	! t1_kref+0x18b0:   	ble,a	_kref+0x18b8
	.word	0x98a56e3c	! t1_kref+0x18b4:   	subcc	%l5, 0xe3c, %o4
	.word	0x993c8009	! t1_kref+0x18b8:   	sra	%l2, %o1, %o4
	.word	0x81ddac9c	! t1_kref+0x18bc:   	flush	%l6 + 0xc9c
	.word	0x99a00558	! t1_kref+0x18c0:   	fsqrtd	%f24, %f12
	.word	0x99400000	! t1_kref+0x18c4:   	mov	%y, %o4
	.word	0x993e8009	! t1_kref+0x18c8:   	sra	%i2, %o1, %o4
	.word	0x98e48000	! t1_kref+0x18cc:   	subccc	%l2, %g0, %o4
	.word	0x8da0055a	! t1_kref+0x18d0:   	fsqrtd	%f26, %f6
	.word	0x98fdc000	! t1_kref+0x18d4:   	sdivcc	%l7, %g0, %o4
	.word	0x191e852a	! t1_kref+0x18d8:   	sethi	%hi(0x7a14a800), %o4
	.word	0x99700012	! t1_kref+0x18dc:   	popc	%l2, %o4
	.word	0x98faea8e	! t1_kref+0x18e0:   	sdivcc	%o3, 0xa8e, %o4
	.word	0xf820a01c	! t1_kref+0x18e4:   	st	%i4, [%g2 + 0x1c]
	.word	0xb5a01a2c	! t1_kref+0x18e8:   	fstoi	%f12, %f26
	.word	0xc168a108	! t1_kref+0x18ec:   	prefetch	%g2 + 0x108, 0
	.word	0x98f02ed4	! t1_kref+0x18f0:   	udivcc	%g0, 0xed4, %o4
	.word	0x992a0015	! t1_kref+0x18f4:   	sll	%o0, %l5, %o4
	.word	0xf5871018	! t1_kref+0x18f8:   	lda	[%i4 + %i0]0x80, %f26
	.word	0x8143c000	! t1_kref+0x18fc:   	stbar
	.word	0xd806401c	! t1_kref+0x1900:   	ld	[%i1 + %i4], %o4
	.word	0xc12e001c	! t1_kref+0x1904:   	st	%fsr, [%i0 + %i4]
	.word	0xc0362012	! t1_kref+0x1908:   	clrh	[%i0 + 0x12]
	.word	0x2c480004	! t1_kref+0x190c:   	bneg,a,pt	%icc, _kref+0x191c
	.word	0xd810a006	! t1_kref+0x1910:   	lduh	[%g2 + 6], %o4
	.word	0xa9b186cc	! t1_kref+0x1914:   	fmul8sux16	%f6, %f12, %f20
	.word	0x9842c016	! t1_kref+0x1918:   	addc	%o3, %l6, %o4
	.word	0x81ad8ac6	! t1_kref+0x191c:   	fcmped	%fcc0, %f22, %f6
	.word	0x99a0188b	! t1_kref+0x1920:   	fitos	%f11, %f12
	.word	0x9da01a35	! t1_kref+0x1924:   	fstoi	%f21, %f14
	sethi	%hi(2f), %o7
	.word	0xe40be170	! t1_kref+0x192c:   	ldub	[%o7 + 0x170], %l2
	.word	0xa41ca00c	! t1_kref+0x1930:   	xor	%l2, 0xc, %l2
	.word	0xe42be170	! t1_kref+0x1934:   	stb	%l2, [%o7 + 0x170]
	.word	0x81dbe170	! t1_kref+0x1938:   	flush	%o7 + 0x170
	.word	0x9940c000	! t1_kref+0x193c:   	mov	%asi, %o4
	.word	0x98e4c01a	! t1_kref+0x1940:   	subccc	%l3, %i2, %o4
	.word	0x98828014	! t1_kref+0x1944:   	addcc	%o2, %l4, %o4
	.word	0xd800a034	! t1_kref+0x1948:   	ld	[%g2 + 0x34], %o4
	.word	0x8186c000	! t1_kref+0x194c:   	wr	%i3, %g0, %y
	.word	0x81a9ca39	! t1_kref+0x1950:   	fcmps	%fcc0, %f7, %f25
	.word	0xd808a00f	! t1_kref+0x1954:   	ldub	[%g2 + 0xf], %o4
	.word	0xec30a02c	! t1_kref+0x1958:   	sth	%l6, [%g2 + 0x2c]
	.word	0xf5ee101d	! t1_kref+0x195c:   	prefetcha	%i0 + %i5, 26
	.word	0xd810a00e	! t1_kref+0x1960:   	lduh	[%g2 + 0xe], %o4
	.word	0xd5270018	! t1_kref+0x1964:   	st	%f10, [%i4 + %i0]
	.word	0x99b6c11b	! t1_kref+0x1968:   	edge32	%i3, %i3, %o4
	.word	0x81d84001	! t1_kref+0x196c:   	flush	%g1 + %g1
2:	.word	0xe028a00c	! t1_kref+0x1970:   	stb	%l0, [%g2 + 0xc]
	.word	0xa5b00fc0	! t1_kref+0x1974:   	fone	%f18
	.word	0xe700a034	! t1_kref+0x1978:   	ld	[%g2 + 0x34], %f19
	.word	0xe820a02c	! t1_kref+0x197c:   	st	%l4, [%g2 + 0x2c]
	.word	0x98a44012	! t1_kref+0x1980:   	subcc	%l1, %l2, %o4
	.word	0xdd3e6010	! t1_kref+0x1984:   	std	%f14, [%i1 + 0x10]
	.word	0x89b306f4	! t1_kref+0x1988:   	fmul8ulx16	%f12, %f20, %f4
	.word	0x99b280e8	! t1_kref+0x198c:   	edge16ln	%o2, %o0, %o4
	.word	0xc12e401c	! t1_kref+0x1990:   	st	%fsr, [%i1 + %i4]
	sethi	%hi(2f), %o7
	.word	0xe40be1b0	! t1_kref+0x1998:   	ldub	[%o7 + 0x1b0], %l2
	.word	0xa41ca00c	! t1_kref+0x199c:   	xor	%l2, 0xc, %l2
	.word	0xe42be1b0	! t1_kref+0x19a0:   	stb	%l2, [%o7 + 0x1b0]
	.word	0x81dbe1b0	! t1_kref+0x19a4:   	flush	%o7 + 0x1b0
	.word	0xe820a034	! t1_kref+0x19a8:   	st	%l4, [%g2 + 0x34]
	.word	0x98634013	! t1_kref+0x19ac:   	subc	%o5, %l3, %o4
2:	.word	0xd19e101d	! t1_kref+0x19b0:   	ldda	[%i0 + %i5]0x80, %f8
	.word	0x983c800a	! t1_kref+0x19b4:   	xnor	%l2, %o2, %o4
	.word	0x89a18854	! t1_kref+0x19b8:   	faddd	%f6, %f20, %f4
	.word	0xe628a034	! t1_kref+0x19bc:   	stb	%l3, [%g2 + 0x34]
	.word	0xee20a004	! t1_kref+0x19c0:   	st	%l7, [%g2 + 4]
	.word	0x190338c7	! t1_kref+0x19c4:   	sethi	%hi(0xce31c00), %o4
	.word	0xa5b20ca3	! t1_kref+0x19c8:   	fandnot2s	%f8, %f3, %f18
	.word	0x3f800001	! t1_kref+0x19cc:   	fbo,a	_kref+0x19d0
	.word	0x91a01933	! t1_kref+0x19d0:   	fstod	%f19, %f8
	.word	0xe2ee9018	! t1_kref+0x19d4:   	ldstuba	[%i2 + %i0]0x80, %l1
	.word	0xd850a034	! t1_kref+0x19d8:   	ldsh	[%g2 + 0x34], %o4
	.word	0xd47f0018	! t1_kref+0x19dc:   	swap	[%i4 + %i0], %o2
	.word	0x98e2a32b	! t1_kref+0x19e0:   	subccc	%o2, 0x32b, %o4
	.word	0x99400000	! t1_kref+0x19e4:   	mov	%y, %o4
	.word	0x81dd0017	! t1_kref+0x19e8:   	flush	%l4 + %l7
	.word	0x985b4011	! t1_kref+0x19ec:   	smul	%o5, %l1, %o4
	.word	0xe628a03e	! t1_kref+0x19f0:   	stb	%l3, [%g2 + 0x3e]
	.word	0xa1a5083a	! t1_kref+0x19f4:   	fadds	%f20, %f26, %f16
	.word	0x93a01a2a	! t1_kref+0x19f8:   	fstoi	%f10, %f9
	.word	0x81ab8ada	! t1_kref+0x19fc:   	fcmped	%fcc0, %f14, %f26
	.word	0xada00548	! t1_kref+0x1a00:   	fsqrtd	%f8, %f22
	.word	0x91a40844	! t1_kref+0x1a04:   	faddd	%f16, %f4, %f8
	.word	0x98a2001c	! t1_kref+0x1a08:   	subcc	%o0, %i4, %o4
	.word	0x8d856ff1	! t1_kref+0x1a0c:   	wr	%l5, 0xff1, %fprs
	.word	0x9de3bfa0	! t1_kref+0x1a10:   	save	%sp, -0x60, %sp
	.word	0xb82f0000	! t1_kref+0x1a14:   	andn	%i4, %g0, %i4
	.word	0x99ef001d	! t1_kref+0x1a18:   	restore	%i4, %i5, %o4
	.word	0x91a00550	! t1_kref+0x1a1c:   	fsqrtd	%f16, %f8
	.word	0xb1b24a72	! t1_kref+0x1a20:   	fpadd32s	%f9, %f18, %f24
	.word	0x81db800a	! t1_kref+0x1a24:   	flush	%sp + %o2
	.word	0x98d53b75	! t1_kref+0x1a28:   	umulcc	%l4, -0x48b, %o4
	.word	0x31800002	! t1_kref+0x1a2c:   	fba,a	_kref+0x1a34
	.word	0x89b18a44	! t1_kref+0x1a30:   	fpadd32	%f6, %f4, %f4
	.word	0x98782bc0	! t1_kref+0x1a34:   	sdiv	%g0, 0xbc0, %o4
	.word	0x99b6c168	! t1_kref+0x1a38:   	edge32ln	%i3, %o0, %o4
	.word	0xd8463ff8	! t1_kref+0x1a3c:   	ldsw	[%i0 - 8], %o4
	.word	0xc1282cfc	! t1_kref+0x1a40:   	st	%fsr, [%g0 + 0xcfc]
	.word	0x988a2a06	! t1_kref+0x1a44:   	andcc	%o0, 0xa06, %o4
	.word	0x2f480005	! t1_kref+0x1a48:   	fbu,a,pt	%fcc0, _kref+0x1a5c
	.word	0xd856c019	! t1_kref+0x1a4c:   	ldsh	[%i3 + %i1], %o4
	.word	0xdaa71019	! t1_kref+0x1a50:   	sta	%o5, [%i4 + %i1]0x80
	.word	0xd800a004	! t1_kref+0x1a54:   	ld	[%g2 + 4], %o4
	.word	0x89a00528	! t1_kref+0x1a58:   	fsqrts	%f8, %f4
	.word	0xa5a0190e	! t1_kref+0x1a5c:   	fitod	%f14, %f18
	.word	0x98fea03e	! t1_kref+0x1a60:   	sdivcc	%i2, 0x3e, %o4
	.word	0xd8562008	! t1_kref+0x1a64:   	ldsh	[%i0 + 8], %o4
	.word	0xd810a01e	! t1_kref+0x1a68:   	lduh	[%g2 + 0x1e], %o4
	.word	0xc807bff0	! t1_kref+0x1a6c:   	ld	[%fp - 0x10], %g4
	.word	0xd8167ff8	! t1_kref+0x1a70:   	lduh	[%i1 - 8], %o4
	.word	0xa1b6070d	! t1_kref+0x1a74:   	fmuld8sux16	%f24, %f13, %f16
	.word	0x98473b56	! t1_kref+0x1a78:   	addc	%i4, -0x4aa, %o4
!	.word	0x27821161	! t1_kref+0x1a7c:   	fbul,a	SYM(t1_subr3)
	   	fbul,a	SYM(t1_subr3)
	.word	0x9f414000	! t1_kref+0x1a80:   	mov	%pc, %o7
	.word	0x98220016	! t1_kref+0x1a84:   	sub	%o0, %l6, %o4
	.word	0x95b40e44	! t1_kref+0x1a88:   	fxnor	%f16, %f4, %f10
	.word	0x81ab0a26	! t1_kref+0x1a8c:   	fcmps	%fcc0, %f12, %f6
	.word	0x98428015	! t1_kref+0x1a90:   	addc	%o2, %l5, %o4
	.word	0x98968017	! t1_kref+0x1a94:   	orcc	%i2, %l7, %o4
	.word	0x98f6a3fc	! t1_kref+0x1a98:   	udivcc	%i2, 0x3fc, %o4
	.word	0xf11e7fe0	! t1_kref+0x1a9c:   	ldd	[%i1 - 0x20], %f24
	.word	0xe87f0019	! t1_kref+0x1aa0:   	swap	[%i4 + %i1], %l4
	.word	0xa9a00056	! t1_kref+0x1aa4:   	fmovd	%f22, %f20
	.word	0xd848a036	! t1_kref+0x1aa8:   	ldsb	[%g2 + 0x36], %o4
	.word	0xb5a5c8b9	! t1_kref+0x1aac:   	fsubs	%f23, %f25, %f26
	.word	0x99b58148	! t1_kref+0x1ab0:   	edge32l	%l6, %o0, %o4
	.word	0xb1a01936	! t1_kref+0x1ab4:   	fstod	%f22, %f24
	.word	0x992a0008	! t1_kref+0x1ab8:   	sll	%o0, %o0, %o4
	.word	0xcd20a02c	! t1_kref+0x1abc:   	st	%f6, [%g2 + 0x2c]
	.word	0xd500a034	! t1_kref+0x1ac0:   	ld	[%g2 + 0x34], %f10
	.word	0xd8160000	! t1_kref+0x1ac4:   	lduh	[%i0], %o4
	.word	0x99b38518	! t1_kref+0x1ac8:   	fcmpgt16	%f14, %f24, %o4
	.word	0xcb00a01c	! t1_kref+0x1acc:   	ld	[%g2 + 0x1c], %f5
	.word	0x193bf43a	! t1_kref+0x1ad0:   	sethi	%hi(0xefd0e800), %o4
	.word	0x98900009	! t1_kref+0x1ad4:   	orcc	%g0, %o1, %o4
	.word	0xd806601c	! t1_kref+0x1ad8:   	ld	[%i1 + 0x1c], %o4
	.word	0xafa0c9a6	! t1_kref+0x1adc:   	fdivs	%f3, %f6, %f23
	.word	0x2f800007	! t1_kref+0x1ae0:   	fbu,a	_kref+0x1afc
	.word	0xa5a01930	! t1_kref+0x1ae4:   	fstod	%f16, %f18
	.word	0xe3e61012	! t1_kref+0x1ae8:   	casa	[%i0]0x80, %l2, %l1
	.word	0xa7a00526	! t1_kref+0x1aec:   	fsqrts	%f6, %f19
	.word	0x9ba3082d	! t1_kref+0x1af0:   	fadds	%f12, %f13, %f13
	.word	0x99b28133	! t1_kref+0x1af4:   	edge32n	%o2, %l3, %o4
	.word	0x8143c000	! t1_kref+0x1af8:   	stbar
	.word	0x81ac8ad8	! t1_kref+0x1afc:   	fcmped	%fcc0, %f18, %f24
	.word	0x9fb54dab	! t1_kref+0x1b00:   	fxors	%f21, %f11, %f15
	.word	0x9847275d	! t1_kref+0x1b04:   	addc	%i4, 0x75d, %o4
	.word	0xb3a58932	! t1_kref+0x1b08:   	fmuls	%f22, %f18, %f25
	.word	0x31480004	! t1_kref+0x1b0c:   	fba,a,pt	%fcc0, _kref+0x1b1c
	.word	0xada01928	! t1_kref+0x1b10:   	fstod	%f8, %f22
	.word	0xd840a00c	! t1_kref+0x1b14:   	ldsw	[%g2 + 0xc], %o4
	.word	0x95a0103a	! t1_kref+0x1b18:   	fstox	%f26, %f10
	.word	0x98400017	! t1_kref+0x1b1c:   	addc	%g0, %l7, %o4
	.word	0xa9b68703	! t1_kref+0x1b20:   	fmuld8sux16	%f26, %f3, %f20
	.word	0xa1a0192e	! t1_kref+0x1b24:   	fstod	%f14, %f16
	.word	0x95a2c9ad	! t1_kref+0x1b28:   	fdivs	%f11, %f13, %f10
	.word	0xdd1fbc58	! t1_kref+0x1b2c:   	ldd	[%fp - 0x3a8], %f14
	.word	0xd228a015	! t1_kref+0x1b30:   	stb	%o1, [%g2 + 0x15]
	.word	0x98f53e81	! t1_kref+0x1b34:   	udivcc	%l4, -0x17f, %o4
	.word	0x192552e0	! t1_kref+0x1b38:   	sethi	%hi(0x954b8000), %o4
	.word	0xc07e0000	! t1_kref+0x1b3c:   	swap	[%i0], %g0
	.word	0x89a28858	! t1_kref+0x1b40:   	faddd	%f10, %f24, %f4
	call	SYM(t1_subr0)
	.word	0x98bac00b	! t1_kref+0x1b48:   	xnorcc	%o3, %o3, %o4
	.word	0x98f50015	! t1_kref+0x1b4c:   	udivcc	%l4, %l5, %o4
	.word	0xef00a034	! t1_kref+0x1b50:   	ld	[%g2 + 0x34], %f23
	.word	0x9802c008	! t1_kref+0x1b54:   	add	%o3, %o0, %o4
	.word	0xd850a034	! t1_kref+0x1b58:   	ldsh	[%g2 + 0x34], %o4
	.word	0x81df2383	! t1_kref+0x1b5c:   	flush	%i4 + 0x383
	.word	0xd808a006	! t1_kref+0x1b60:   	ldub	[%g2 + 6], %o4
	.word	0x89b4074c	! t1_kref+0x1b64:   	fpack32	%f16, %f12, %f4
	.word	0x98a2c00d	! t1_kref+0x1b68:   	subcc	%o3, %o5, %o4
	.word	0x9da01925	! t1_kref+0x1b6c:   	fstod	%f5, %f14
	call	1f
	.empty
	.word	0xc7263fe4	! t1_kref+0x1b74:   	st	%f3, [%i0 - 0x1c]
	.word	0xe5380019	! t1_kref+0x1b78:   	std	%f18, [%g0 + %i1]
	.word	0xd848a034	! t1_kref+0x1b7c:   	ldsb	[%g2 + 0x34], %o4
	.word	0x98f6ff01	! t1_kref+0x1b80:   	udivcc	%i3, -0xff, %o4
	.word	0x95a0190e	! t1_kref+0x1b84:   	fitod	%f14, %f10
	.word	0xa5a01905	! t1_kref+0x1b88:   	fitod	%f5, %f18
	.word	0xf207bfe0	! t1_kref+0x1b8c:   	ld	[%fp - 0x20], %i1
1:	.word	0xa5b38c75	! t1_kref+0x1b90:   	fnors	%f14, %f21, %f18
	.word	0x81abca39	! t1_kref+0x1b94:   	fcmps	%fcc0, %f15, %f25
	.word	0xd8df5019	! t1_kref+0x1b98:   	ldxa	[%i5 + %i1]0x80, %o4
	.word	0x992a6001	! t1_kref+0x1b9c:   	sll	%o1, 0x1, %o4
	.word	0x85a18858	! t1_kref+0x1ba0:   	faddd	%f6, %f24, %f2
	.word	0xa3a0002a	! t1_kref+0x1ba4:   	fmovs	%f10, %f17
	.word	0x98f30016	! t1_kref+0x1ba8:   	udivcc	%o4, %l6, %o4
	.word	0x9fc00004	! t1_kref+0x1bac:   	call	%g0 + %g4
	.word	0xd8064000	! t1_kref+0x1bb0:   	ld	[%i1], %o4
	.word	0x9fa00539	! t1_kref+0x1bb4:   	fsqrts	%f25, %f15
	.word	0x98db400c	! t1_kref+0x1bb8:   	smulcc	%o5, %o4, %o4
	.word	0xf19eda59	! t1_kref+0x1bbc:   	ldda	[%i3 + %i1]0xd2, %f24
	.word	0x99b30496	! t1_kref+0x1bc0:   	fcmple32	%f12, %f22, %o4
	.word	0xa9b50994	! t1_kref+0x1bc4:   	bshuffle	%f20, %f20, %f20
	.word	0x36800001	! t1_kref+0x1bc8:   	bge,a	_kref+0x1bcc
	.word	0xa5b38e48	! t1_kref+0x1bcc:   	fxnor	%f14, %f8, %f18
	.word	0x91aa4044	! t1_kref+0x1bd0:   	fmovde	%fcc0, %f4, %f8
	.word	0x27800002	! t1_kref+0x1bd4:   	fbul,a	_kref+0x1bdc
	.word	0xe520a02c	! t1_kref+0x1bd8:   	st	%f18, [%g2 + 0x2c]
	.word	0x81828000	! t1_kref+0x1bdc:   	wr	%o2, %g0, %y
	.word	0xa3a0052c	! t1_kref+0x1be0:   	fsqrts	%f12, %f17
	.word	0xef263fe0	! t1_kref+0x1be4:   	st	%f23, [%i0 - 0x20]
	.word	0x99254009	! t1_kref+0x1be8:   	mulscc	%l5, %o1, %o4
	.word	0x99b34ef7	! t1_kref+0x1bec:   	fornot2s	%f13, %f23, %f12
	.word	0xe13e6008	! t1_kref+0x1bf0:   	std	%f16, [%i1 + 8]
	.word	0xd8ce5000	! t1_kref+0x1bf4:   	ldsba	[%i1]0x80, %o4
	.word	0x99b40512	! t1_kref+0x1bf8:   	fcmpgt16	%f16, %f18, %o4
	.word	0x98bf3e72	! t1_kref+0x1bfc:   	xnorcc	%i4, -0x18e, %o4
	.word	0x98458015	! t1_kref+0x1c00:   	addc	%l6, %l5, %o4
	.word	0xc99e501d	! t1_kref+0x1c04:   	ldda	[%i1 + %i5]0x80, %f4
	.word	0x8186c000	! t1_kref+0x1c08:   	wr	%i3, %g0, %y
	.word	0x8da01903	! t1_kref+0x1c0c:   	fitod	%f3, %f6
	.word	0xa5a01910	! t1_kref+0x1c10:   	fitod	%f16, %f18
	.word	0x99400000	! t1_kref+0x1c14:   	mov	%y, %o4
	.word	0x98a5bf7a	! t1_kref+0x1c18:   	subcc	%l6, -0x86, %o4
	.word	0x98c33ee6	! t1_kref+0x1c1c:   	addccc	%o4, -0x11a, %o4
	.word	0xd848a01c	! t1_kref+0x1c20:   	ldsb	[%g2 + 0x1c], %o4
	.word	0x98126679	! t1_kref+0x1c24:   	or	%o1, 0x679, %o4
	.word	0x99a1894a	! t1_kref+0x1c28:   	fmuld	%f6, %f10, %f12
	.word	0x27480001	! t1_kref+0x1c2c:   	fbul,a,pt	%fcc0, _kref+0x1c30
	.word	0x89a0054c	! t1_kref+0x1c30:   	fsqrtd	%f12, %f4
	.word	0xc12e201c	! t1_kref+0x1c34:   	st	%fsr, [%i0 + 0x1c]
	.word	0xa9a00548	! t1_kref+0x1c38:   	fsqrtd	%f8, %f20
	.word	0x8db38d40	! t1_kref+0x1c3c:   	fnot1	%f14, %f6
	.word	0x81a98a52	! t1_kref+0x1c40:   	fcmpd	%fcc0, %f6, %f18
	.word	0xe2362014	! t1_kref+0x1c44:   	sth	%l1, [%i0 + 0x14]
	.word	0x3b480002	! t1_kref+0x1c48:   	fble,a,pt	%fcc0, _kref+0x1c50
	.word	0x98ff3d0e	! t1_kref+0x1c4c:   	sdivcc	%i4, -0x2f2, %o4
	.word	0x81a90ab3	! t1_kref+0x1c50:   	fcmpes	%fcc0, %f4, %f19
	.word	0x98f83b8f	! t1_kref+0x1c54:   	sdivcc	%g0, -0x471, %o4
	.word	0x3f480004	! t1_kref+0x1c58:   	fbo,a,pt	%fcc0, _kref+0x1c68
	.word	0xada01924	! t1_kref+0x1c5c:   	fstod	%f4, %f22
	.word	0x81a98aca	! t1_kref+0x1c60:   	fcmped	%fcc0, %f6, %f10
	.word	0x97a00130	! t1_kref+0x1c64:   	fabss	%f16, %f11
	.word	0x98fac01b	! t1_kref+0x1c68:   	sdivcc	%o3, %i3, %o4
	.word	0x8da00552	! t1_kref+0x1c6c:   	fsqrtd	%f18, %f6
	.word	0x98450009	! t1_kref+0x1c70:   	addc	%l4, %o1, %o4
	.word	0xd840a034	! t1_kref+0x1c74:   	ldsw	[%g2 + 0x34], %o4
	.word	0xa1a01919	! t1_kref+0x1c78:   	fitod	%f25, %f16
	.word	0x81ab0a4a	! t1_kref+0x1c7c:   	fcmpd	%fcc0, %f12, %f10
	.word	0x99b10444	! t1_kref+0x1c80:   	fcmpne16	%f4, %f4, %o4
	.word	0x99b18552	! t1_kref+0x1c84:   	fcmpeq16	%f6, %f18, %o4
	.word	0x99b48200	! t1_kref+0x1c88:   	array8	%l2, %g0, %o4
	.word	0x9ba0108e	! t1_kref+0x1c8c:   	fxtos	%f14, %f13
	.word	0x9da0190b	! t1_kref+0x1c90:   	fitod	%f11, %f14
	.word	0xb1a149a4	! t1_kref+0x1c94:   	fdivs	%f5, %f4, %f24
	.word	0xe4380018	! t1_kref+0x1c98:   	std	%l2, [%g0 + %i0]
	.word	0x95a489d4	! t1_kref+0x1c9c:   	fdivd	%f18, %f20, %f10
	.word	0xd030a024	! t1_kref+0x1ca0:   	sth	%o0, [%g2 + 0x24]
	.word	0x99b20029	! t1_kref+0x1ca4:   	edge8n	%o0, %o1, %o4
	.word	0xf8760000	! t1_kref+0x1ca8:   	stx	%i4, [%i0]
	.word	0x9814c00d	! t1_kref+0x1cac:   	or	%l3, %o5, %o4
	.word	0xa1a588ca	! t1_kref+0x1cb0:   	fsubd	%f22, %f10, %f16
	.word	0x81d82c18	! t1_kref+0x1cb4:   	flush	%g0 + 0xc18
	.word	0x8fa1c8a5	! t1_kref+0x1cb8:   	fsubs	%f7, %f5, %f7
	.word	0x9835801c	! t1_kref+0x1cbc:   	orn	%l6, %i4, %o4
	.word	0xe6ee101a	! t1_kref+0x1cc0:   	ldstuba	[%i0 + %i2]0x80, %l3
	.word	0xe6263ffc	! t1_kref+0x1cc4:   	st	%l3, [%i0 - 4]
	.word	0xcf00a02c	! t1_kref+0x1cc8:   	ld	[%g2 + 0x2c], %f7
	.word	0x98c70016	! t1_kref+0x1ccc:   	addccc	%i4, %l6, %o4
	.word	0xb1b40d40	! t1_kref+0x1cd0:   	fnot1	%f16, %f24
	.word	0xd0be5000	! t1_kref+0x1cd4:   	stda	%o0, [%i1]0x80
	.word	0x8d870011	! t1_kref+0x1cd8:   	wr	%i4, %l1, %fprs
	.word	0x98f4ac26	! t1_kref+0x1cdc:   	udivcc	%l2, 0xc26, %o4
!	.word	0x288210c8	! t1_kref+0x1ce0:   	bleu,a	SYM(t1_subr3)
	   	bleu,a	SYM(t1_subr3)
	.word	0x9f414000	! t1_kref+0x1ce4:   	mov	%pc, %o7
	.word	0xc1be1894	! t1_kref+0x1ce8:   	stda	%f0, [%i0 + %l4]0xc4
	.word	0x81a90ad4	! t1_kref+0x1cec:   	fcmped	%fcc0, %f4, %f20
	.word	0x983a0015	! t1_kref+0x1cf0:   	xnor	%o0, %l5, %o4
	.word	0x992b2008	! t1_kref+0x1cf4:   	sll	%o4, 0x8, %o4
	.word	0x98136d19	! t1_kref+0x1cf8:   	or	%o5, 0xd19, %o4
	.word	0x91a20856	! t1_kref+0x1cfc:   	faddd	%f8, %f22, %f8
	.word	0xd848a017	! t1_kref+0x1d00:   	ldsb	[%g2 + 0x17], %o4
	.word	0x8143c000	! t1_kref+0x1d04:   	stbar
	.word	0x9922fa12	! t1_kref+0x1d08:   	mulscc	%o3, -0x5ee, %o4
	.word	0x8143e040	! t1_kref+0x1d0c:   	membar	0x40
	.word	0xe27e3ff8	! t1_kref+0x1d10:   	swap	[%i0 - 8], %l1
	.word	0x9846b07a	! t1_kref+0x1d14:   	addc	%i2, -0xf86, %o4
	.word	0xd8801019	! t1_kref+0x1d18:   	lda	[%g0 + %i1]0x80, %o4
	.word	0x99268000	! t1_kref+0x1d1c:   	mulscc	%i2, %g0, %o4
	.word	0x992b000c	! t1_kref+0x1d20:   	sll	%o4, %o4, %o4
	.word	0x95b00f0a	! t1_kref+0x1d24:   	fsrc2	%f10, %f10
	.word	0x3e800002	! t1_kref+0x1d28:   	bvc,a	_kref+0x1d30
	.word	0xf19f5018	! t1_kref+0x1d2c:   	ldda	[%i5 + %i0]0x80, %f24
	.word	0x99b4c0cb	! t1_kref+0x1d30:   	edge16l	%l3, %o3, %o4
	.word	0x81aa8a4a	! t1_kref+0x1d34:   	fcmpd	%fcc0, %f10, %f10
	.word	0xf820a004	! t1_kref+0x1d38:   	st	%i4, [%g2 + 4]
	.word	0x95aa0044	! t1_kref+0x1d3c:   	fmovda	%fcc0, %f4, %f10
	.word	0xb5a1882b	! t1_kref+0x1d40:   	fadds	%f6, %f11, %f26
	.word	0xec3e0000	! t1_kref+0x1d44:   	std	%l6, [%i0]
	.word	0xa9a309c8	! t1_kref+0x1d48:   	fdivd	%f12, %f8, %f20
	.word	0x8186c000	! t1_kref+0x1d4c:   	wr	%i3, %g0, %y
	.word	0x99400000	! t1_kref+0x1d50:   	mov	%y, %o4
	.word	0x1903124d	! t1_kref+0x1d54:   	sethi	%hi(0xc493400), %o4
	.word	0x8d86c00c	! t1_kref+0x1d58:   	wr	%i3, %o4, %fprs
	.word	0xa785211a	! t1_kref+0x1d5c:   	wr	%l4, 0x11a, %gsr
	.word	0x98533969	! t1_kref+0x1d60:   	umul	%o4, -0x697, %o4
	.word	0xa1a00134	! t1_kref+0x1d64:   	fabss	%f20, %f16
	.word	0xa5b50744	! t1_kref+0x1d68:   	fpack32	%f20, %f4, %f18
	.word	0xd8162010	! t1_kref+0x1d6c:   	lduh	[%i0 + 0x10], %o4
	.word	0x89a0188e	! t1_kref+0x1d70:   	fitos	%f14, %f4
	.word	0x99b3048a	! t1_kref+0x1d74:   	fcmple32	%f12, %f10, %o4
	.word	0xe1861000	! t1_kref+0x1d78:   	lda	[%i0]0x80, %f16
	.word	0xada01891	! t1_kref+0x1d7c:   	fitos	%f17, %f22
	.word	0x193e5b58	! t1_kref+0x1d80:   	sethi	%hi(0xf96d6000), %o4
	.word	0x98bc8014	! t1_kref+0x1d84:   	xnorcc	%l2, %l4, %o4
	.word	0xec3f4018	! t1_kref+0x1d88:   	std	%l6, [%i5 + %i0]
	.word	0xa5b08a4a	! t1_kref+0x1d8c:   	fpadd32	%f2, %f10, %f18
	.word	0x2d800002	! t1_kref+0x1d90:   	fbg,a	_kref+0x1d98
	.word	0x99400000	! t1_kref+0x1d94:   	mov	%y, %o4
	.word	0x9865ea5c	! t1_kref+0x1d98:   	subc	%l7, 0xa5c, %o4
	.word	0xd806401c	! t1_kref+0x1d9c:   	ld	[%i1 + %i4], %o4
	.word	0xeb68a0cf	! t1_kref+0x1da0:   	prefetch	%g2 + 0xcf, 21
	.word	0x91b346b9	! t1_kref+0x1da4:   	fmul8x16al	%f13, %f25, %f8
	.word	0xeb861000	! t1_kref+0x1da8:   	lda	[%i0]0x80, %f21
	.word	0x98dec01b	! t1_kref+0x1dac:   	smulcc	%i3, %i3, %o4
	.word	0xd320a034	! t1_kref+0x1db0:   	st	%f9, [%g2 + 0x34]
	.word	0xb3a00533	! t1_kref+0x1db4:   	fsqrts	%f19, %f25
	.word	0x9926c00d	! t1_kref+0x1db8:   	mulscc	%i3, %o5, %o4
	.word	0x3b480004	! t1_kref+0x1dbc:   	fble,a,pt	%fcc0, _kref+0x1dcc
	.word	0xe83e7ff0	! t1_kref+0x1dc0:   	std	%l4, [%i1 - 0x10]
	.word	0x98f02e06	! t1_kref+0x1dc4:   	udivcc	%g0, 0xe06, %o4
	.word	0xa1a6492b	! t1_kref+0x1dc8:   	fmuls	%f25, %f11, %f16
	.word	0x991ec009	! t1_kref+0x1dcc:   	tsubcctv	%i3, %o1, %o4
	.word	0x81ab8a4e	! t1_kref+0x1dd0:   	fcmpd	%fcc0, %f14, %f14
	.word	0x81850000	! t1_kref+0x1dd4:   	wr	%l4, %g0, %y
	.word	0xd856600c	! t1_kref+0x1dd8:   	ldsh	[%i1 + 0xc], %o4
	.word	0x93b00f2b	! t1_kref+0x1ddc:   	fsrc2s	%f11, %f9
	.word	0x9845c015	! t1_kref+0x1de0:   	addc	%l7, %l5, %o4
	.word	0x8da0190a	! t1_kref+0x1de4:   	fitod	%f10, %f6
	.word	0xe43e6008	! t1_kref+0x1de8:   	std	%l2, [%i1 + 8]
	.word	0xe228a026	! t1_kref+0x1dec:   	stb	%l1, [%g2 + 0x26]
	.word	0xe878a004	! t1_kref+0x1df0:   	swap	[%g2 + 4], %l4
	.word	0xd8564000	! t1_kref+0x1df4:   	ldsh	[%i1], %o4
	.word	0xc5ee1012	! t1_kref+0x1df8:   	prefetcha	%i0 + %l2, 2
	.word	0x81ad0ad4	! t1_kref+0x1dfc:   	fcmped	%fcc0, %f20, %f20
	.word	0x3f480007	! t1_kref+0x1e00:   	fbo,a,pt	%fcc0, _kref+0x1e1c
	.word	0xa1a209d4	! t1_kref+0x1e04:   	fdivd	%f8, %f20, %f16
	.word	0xf3267ff8	! t1_kref+0x1e08:   	st	%f25, [%i1 - 8]
	.word	0xb3a389b6	! t1_kref+0x1e0c:   	fdivs	%f14, %f22, %f25
	.word	0xe2270019	! t1_kref+0x1e10:   	st	%l1, [%i4 + %i1]
	.word	0xa5a0c9b7	! t1_kref+0x1e14:   	fdivs	%f3, %f23, %f18
	.word	0x8ba209a9	! t1_kref+0x1e18:   	fdivs	%f8, %f9, %f5
	.word	0xd53e7fe0	! t1_kref+0x1e1c:   	std	%f10, [%i1 - 0x20]
	.word	0xd856401b	! t1_kref+0x1e20:   	ldsh	[%i1 + %i3], %o4
	.word	0x91b4096f	! t1_kref+0x1e24:   	fpmerge	%f16, %f15, %f8
	.word	0xe1ee101a	! t1_kref+0x1e28:   	prefetcha	%i0 + %i2, 16
	.word	0x9ba60926	! t1_kref+0x1e2c:   	fmuls	%f24, %f6, %f13
	.word	0xa5a00550	! t1_kref+0x1e30:   	fsqrtd	%f16, %f18
	.word	0xa9b00778	! t1_kref+0x1e34:   	fpack16	%f24, %f20
	.word	0xd8500018	! t1_kref+0x1e38:   	ldsh	[%g0 + %i0], %o4
	.word	0x87b64aec	! t1_kref+0x1e3c:   	fpsub32s	%f25, %f12, %f3
	.word	0x98f30000	! t1_kref+0x1e40:   	udivcc	%o4, %g0, %o4
	.word	0x983b400d	! t1_kref+0x1e44:   	xnor	%o5, %o5, %o4
	.word	0x31800005	! t1_kref+0x1e48:   	fba,a	_kref+0x1e5c
	.word	0xd8c61000	! t1_kref+0x1e4c:   	ldswa	[%i0]0x80, %o4
	.word	0x98c2f5a3	! t1_kref+0x1e50:   	addccc	%o3, -0xa5d, %o4
	.word	0xa5b48d10	! t1_kref+0x1e54:   	fandnot1	%f18, %f16, %f18
	.word	0x91b64676	! t1_kref+0x1e58:   	fmul8x16au	%f25, %f22, %f8
	.word	0x85b10e80	! t1_kref+0x1e5c:   	fsrc1	%f4, %f2
	.word	0x98c37cd5	! t1_kref+0x1e60:   	addccc	%o5, -0x32b, %o4
	.word	0x89a00130	! t1_kref+0x1e64:   	fabss	%f16, %f4
	.word	0xa5a01910	! t1_kref+0x1e68:   	fitod	%f16, %f18
	.word	0x98d58009	! t1_kref+0x1e6c:   	umulcc	%l6, %o1, %o4
	.word	0x98bb76df	! t1_kref+0x1e70:   	xnorcc	%o5, -0x921, %o4
	.word	0xa5a00535	! t1_kref+0x1e74:   	fsqrts	%f21, %f18
	.word	0x99408000	! t1_kref+0x1e78:   	mov	%ccr, %o4
!	.word	0x2b4a1061	! t1_kref+0x1e7c:   	fbug,a,pt	%fcc0, SYM(t1_subr3)
	   	fbug,a,pt	%fcc0, SYM(t1_subr3)
	.word	0x9f414000	! t1_kref+0x1e80:   	mov	%pc, %o7
	.word	0x99a0102a	! t1_kref+0x1e84:   	fstox	%f10, %f12
	.word	0x9da01116	! t1_kref+0x1e88:   	fxtod	%f22, %f14
	.word	0x3d800008	! t1_kref+0x1e8c:   	fbule,a	_kref+0x1eac
	.word	0xd80e2016	! t1_kref+0x1e90:   	ldub	[%i0 + 0x16], %o4
	.word	0xd2fe501c	! t1_kref+0x1e94:   	swapa	[%i1 + %i4]0x80, %o1
	.word	0x989abf06	! t1_kref+0x1e98:   	xorcc	%o2, -0xfa, %o4
	.word	0xef68a047	! t1_kref+0x1e9c:   	prefetch	%g2 + 0x47, 23
	.word	0xdd1e7fe0	! t1_kref+0x1ea0:   	ldd	[%i1 - 0x20], %f14
	call	SYM(t1_subr3)
	.word	0xd820a024	! t1_kref+0x1ea8:   	st	%o4, [%g2 + 0x24]
	.word	0x98e20011	! t1_kref+0x1eac:   	subccc	%o0, %l1, %o4
	.word	0x3f800008	! t1_kref+0x1eb0:   	fbo,a	_kref+0x1ed0
	.word	0xda28a01f	! t1_kref+0x1eb4:   	stb	%o5, [%g2 + 0x1f]
	.word	0xa1a01a31	! t1_kref+0x1eb8:   	fstoi	%f17, %f16
	.word	0xb1a60844	! t1_kref+0x1ebc:   	faddd	%f24, %f4, %f24
	.word	0x993ca019	! t1_kref+0x1ec0:   	sra	%l2, 0x19, %o4
	.word	0x97a149ab	! t1_kref+0x1ec4:   	fdivs	%f5, %f11, %f11
	.word	0x98f54013	! t1_kref+0x1ec8:   	udivcc	%l5, %l3, %o4
	.word	0xb3a01a44	! t1_kref+0x1ecc:   	fdtoi	%f4, %f25
	.word	0x8143c000	! t1_kref+0x1ed0:   	stbar
	.word	0xd8871018	! t1_kref+0x1ed4:   	lda	[%i4 + %i0]0x80, %o4
	.word	0xdafe101c	! t1_kref+0x1ed8:   	swapa	[%i0 + %i4]0x80, %o5
	.word	0xd88e1000	! t1_kref+0x1edc:   	lduba	[%i0]0x80, %o4
	.word	0x81ae8a32	! t1_kref+0x1ee0:   	fcmps	%fcc0, %f26, %f18
	.word	0xafa64938	! t1_kref+0x1ee4:   	fmuls	%f25, %f24, %f23
	.word	0x99a4c934	! t1_kref+0x1ee8:   	fmuls	%f19, %f20, %f12
	.word	0x95a68d31	! t1_kref+0x1eec:   	fsmuld	%f26, %f17, %f10
	.word	0x98f5bbde	! t1_kref+0x1ef0:   	udivcc	%l6, -0x422, %o4
	.word	0xe9ee101d	! t1_kref+0x1ef4:   	prefetcha	%i0 + %i5, 20
	.word	0x3f800005	! t1_kref+0x1ef8:   	fbo,a	_kref+0x1f0c
	.word	0xa9b2c97a	! t1_kref+0x1efc:   	fpmerge	%f11, %f26, %f20
	.word	0x99b580fa	! t1_kref+0x1f00:   	edge16ln	%l6, %i2, %o4
	call	SYM(t1_subr2)
	.word	0x9da01907	! t1_kref+0x1f08:   	fitod	%f7, %f14
	.word	0x35800003	! t1_kref+0x1f0c:   	fbue,a	_kref+0x1f18
	.word	0x99b6c240	! t1_kref+0x1f10:   	array16	%i3, %g0, %o4
	.word	0x19016f4b	! t1_kref+0x1f14:   	sethi	%hi(0x5bd2c00), %o4
	.word	0xb5a00548	! t1_kref+0x1f18:   	fsqrtd	%f8, %f26
	.word	0x989dbc63	! t1_kref+0x1f1c:   	xorcc	%l6, -0x39d, %o4
	sethi	%hi(2f), %o7
	.word	0xe40be368	! t1_kref+0x1f24:   	ldub	[%o7 + 0x368], %l2
	.word	0xa41ca00c	! t1_kref+0x1f28:   	xor	%l2, 0xc, %l2
	.word	0xe42be368	! t1_kref+0x1f2c:   	stb	%l2, [%o7 + 0x368]
	.word	0x81dbe368	! t1_kref+0x1f30:   	flush	%o7 + 0x368
	.word	0x8db50e80	! t1_kref+0x1f34:   	fsrc1	%f20, %f6
	.word	0x986333ec	! t1_kref+0x1f38:   	subc	%o4, -0xc14, %o4
	.word	0x9845000c	! t1_kref+0x1f3c:   	addc	%l4, %o4, %o4
	.word	0x99b340e9	! t1_kref+0x1f40:   	edge16ln	%o5, %o1, %o4
	.word	0x98da75ec	! t1_kref+0x1f44:   	smulcc	%o1, -0xa14, %o4
	call	SYM(t1_subr0)
	.word	0x81850000	! t1_kref+0x1f4c:   	wr	%l4, %g0, %y
	.word	0x98900016	! t1_kref+0x1f50:   	orcc	%g0, %l6, %o4
	.word	0x98c2b278	! t1_kref+0x1f54:   	addccc	%o2, -0xd88, %o4
	.word	0xada389da	! t1_kref+0x1f58:   	fdivd	%f14, %f26, %f22
	.word	0x81858000	! t1_kref+0x1f5c:   	wr	%l6, %g0, %y
	.word	0xa7b40ca5	! t1_kref+0x1f60:   	fandnot2s	%f16, %f5, %f19
	.word	0xe91fbc28	! t1_kref+0x1f64:   	ldd	[%fp - 0x3d8], %f20
2:	.word	0x993d4014	! t1_kref+0x1f68:   	sra	%l5, %l4, %o4
	.word	0xd810a02c	! t1_kref+0x1f6c:   	lduh	[%g2 + 0x2c], %o4
	.word	0xf630a014	! t1_kref+0x1f70:   	sth	%i3, [%g2 + 0x14]
	.word	0x98de8012	! t1_kref+0x1f74:   	smulcc	%i2, %l2, %o4
	.word	0xa3a01a2d	! t1_kref+0x1f78:   	fstoi	%f13, %f17
	.word	0x81ad0acc	! t1_kref+0x1f7c:   	fcmped	%fcc0, %f20, %f12
	.word	0x98900012	! t1_kref+0x1f80:   	orcc	%g0, %l2, %o4
	sethi	%hi(2f), %o7
	.word	0xe40be398	! t1_kref+0x1f88:   	ldub	[%o7 + 0x398], %l2
	.word	0xa41ca00c	! t1_kref+0x1f8c:   	xor	%l2, 0xc, %l2
	.word	0xe42be398	! t1_kref+0x1f90:   	stb	%l2, [%o7 + 0x398]
	.word	0x81dbe398	! t1_kref+0x1f94:   	flush	%o7 + 0x398
2:	.word	0xd428a03c	! t1_kref+0x1f98:   	stb	%o2, [%g2 + 0x3c]
	.word	0xd520a01c	! t1_kref+0x1f9c:   	st	%f10, [%g2 + 0x1c]
	.word	0xada0054e	! t1_kref+0x1fa0:   	fsqrtd	%f14, %f22
	.word	0x99b6806d	! t1_kref+0x1fa4:   	edge8ln	%i2, %o5, %o4
	.word	0x99b60490	! t1_kref+0x1fa8:   	fcmple32	%f24, %f16, %o4
	.word	0x993d8015	! t1_kref+0x1fac:   	sra	%l6, %l5, %o4
	.word	0x87802080	! t1_kref+0x1fb0:   	mov	0x80, %asi
	.word	0xe2a0a02c	! t1_kref+0x1fb4:   	sta	%l1, [%g2 + 0x2c]%asi
	.word	0xd84e3fe2	! t1_kref+0x1fb8:   	ldsb	[%i0 - 0x1e], %o4
	.word	0x981ec00d	! t1_kref+0x1fbc:   	xor	%i3, %o5, %o4
	.word	0x98ba800c	! t1_kref+0x1fc0:   	xnorcc	%o2, %o4, %o4
	.word	0x27480008	! t1_kref+0x1fc4:   	fbul,a,pt	%fcc0, _kref+0x1fe4
	.word	0x9ba249ad	! t1_kref+0x1fc8:   	fdivs	%f9, %f13, %f13
	.word	0x99b2811b	! t1_kref+0x1fcc:   	edge32	%o2, %i3, %o4
	.word	0x81ab8ac8	! t1_kref+0x1fd0:   	fcmped	%fcc0, %f14, %f8
	.word	0xd810a01e	! t1_kref+0x1fd4:   	lduh	[%g2 + 0x1e], %o4
	.word	0x27480007	! t1_kref+0x1fd8:   	fbul,a,pt	%fcc0, _kref+0x1ff4
	.word	0xa5a548b1	! t1_kref+0x1fdc:   	fsubs	%f21, %f17, %f18
	.word	0x81a90ac4	! t1_kref+0x1fe0:   	fcmped	%fcc0, %f4, %f4
	.word	0x91a018d4	! t1_kref+0x1fe4:   	fdtos	%f20, %f8
	.word	0xe8a0a014	! t1_kref+0x1fe8:   	sta	%l4, [%g2 + 0x14]%asi
	.word	0xb1b38742	! t1_kref+0x1fec:   	fpack32	%f14, %f2, %f24
	.word	0x93b54e2b	! t1_kref+0x1ff0:   	fands	%f21, %f11, %f9
	.word	0x1920bc75	! t1_kref+0x1ff4:   	sethi	%hi(0x82f1d400), %o4
	.word	0x81deb163	! t1_kref+0x1ff8:   	flush	%i2 - 0xe9d
	.word	0x85b28a86	! t1_kref+0x1ffc:   	fpsub16	%f10, %f6, %f2
	.word	0x9864800a	! t1_kref+0x2000:   	subc	%l2, %o2, %o4
	.word	0xefee101c	! t1_kref+0x2004:   	prefetcha	%i0 + %i4, 23
	.word	0x89a00137	! t1_kref+0x2008:   	fabss	%f23, %f4
	.word	0xec30a00e	! t1_kref+0x200c:   	sth	%l6, [%g2 + 0xe]
	.word	0xd1be1a1d	! t1_kref+0x2010:   	stda	%f8, [%i0 + %i5]0xd0
	.word	0xda28a01f	! t1_kref+0x2014:   	stb	%o5, [%g2 + 0x1f]
	.word	0x9f414000	! t1_kref+0x2018:   	mov	%pc, %o7
!	.word	0x2f4a0ff9	! t1_kref+0x201c:   	fbu,a,pt	%fcc0, SYM(t1_subr3)
	   	fbu,a,pt	%fcc0, SYM(t1_subr3)
	.word	0x98e27b00	! t1_kref+0x2020:   	subccc	%o1, -0x500, %o4
	.word	0x98c470f4	! t1_kref+0x2024:   	addccc	%l1, -0xf0c, %o4
	.word	0x1918be0e	! t1_kref+0x2028:   	sethi	%hi(0x62f83800), %o4
	.word	0xd07e4000	! t1_kref+0x202c:   	swap	[%i1], %o0
	.word	0x8ba18930	! t1_kref+0x2030:   	fmuls	%f6, %f16, %f5
	.word	0x33800008	! t1_kref+0x2034:   	fbe,a	_kref+0x2054
	.word	0xf6b0a006	! t1_kref+0x2038:   	stha	%i3, [%g2 + 6]%asi
	.word	0x98a5400a	! t1_kref+0x203c:   	subcc	%l5, %o2, %o4
	.word	0x95a01885	! t1_kref+0x2040:   	fitos	%f5, %f10
	.word	0x99b340eb	! t1_kref+0x2044:   	edge16ln	%o5, %o3, %o4
	.word	0x001fffff	! t1_kref+0x2048:   	illtrap	0x1fffff
	.word	0xb1a00535	! t1_kref+0x204c:   	fsqrts	%f21, %f24
	.word	0x9bb5cda6	! t1_kref+0x2050:   	fxors	%f23, %f6, %f13
	.word	0xaba00132	! t1_kref+0x2054:   	fabss	%f18, %f21
	.word	0x33480005	! t1_kref+0x2058:   	fbe,a,pt	%fcc0, _kref+0x206c
	.word	0x9896b8c3	! t1_kref+0x205c:   	orcc	%i2, -0x73d, %o4
	.word	0x988e800b	! t1_kref+0x2060:   	andcc	%i2, %o3, %o4
	.word	0xd900a00c	! t1_kref+0x2064:   	ld	[%g2 + 0xc], %f12
	.word	0xf3ee101c	! t1_kref+0x2068:   	prefetcha	%i0 + %i4, 25
	.word	0x98df0016	! t1_kref+0x206c:   	smulcc	%i4, %l6, %o4
	.word	0x8d86800a	! t1_kref+0x2070:   	wr	%i2, %o2, %fprs
	.word	0xd8470019	! t1_kref+0x2074:   	ldsw	[%i4 + %i1], %o4
	.word	0x91a01917	! t1_kref+0x2078:   	fitod	%f23, %f8
	.word	0x91a01a50	! t1_kref+0x207c:   	fdtoi	%f16, %f8
	.word	0xe068a01f	! t1_kref+0x2080:   	ldstub	[%g2 + 0x1f], %l0
	.word	0x9886fc2f	! t1_kref+0x2084:   	addcc	%i3, -0x3d1, %o4
	.word	0xd84e0000	! t1_kref+0x2088:   	ldsb	[%i0], %o4
	.word	0xeaa8a01f	! t1_kref+0x208c:   	stba	%l5, [%g2 + 0x1f]%asi
	.word	0x95b5caaf	! t1_kref+0x2090:   	fpsub16s	%f23, %f15, %f10
	.word	0xa9a20844	! t1_kref+0x2094:   	faddd	%f8, %f4, %f20
	.word	0x988efa90	! t1_kref+0x2098:   	andcc	%i3, -0x570, %o4
	.word	0x993de00b	! t1_kref+0x209c:   	sra	%l7, 0xb, %o4
	.word	0xe91fbde0	! t1_kref+0x20a0:   	ldd	[%fp - 0x220], %f20
	.word	0xd84e3fe9	! t1_kref+0x20a4:   	ldsb	[%i0 - 0x17], %o4
	.word	0xcd380019	! t1_kref+0x20a8:   	std	%f6, [%g0 + %i1]
	.word	0xcd1e3fe8	! t1_kref+0x20ac:   	ldd	[%i0 - 0x18], %f6
	.word	0x3c480002	! t1_kref+0x20b0:   	bpos,a,pt	%icc, _kref+0x20b8
	.word	0x91a24928	! t1_kref+0x20b4:   	fmuls	%f9, %f8, %f8
	.word	0x3b800005	! t1_kref+0x20b8:   	fble,a	_kref+0x20cc
	.word	0x98a56001	! t1_kref+0x20bc:   	subcc	%l5, 1, %o4
	.word	0x99b54068	! t1_kref+0x20c0:   	edge8ln	%l5, %o0, %o4
	.word	0xf420a03c	! t1_kref+0x20c4:   	st	%i2, [%g2 + 0x3c]
	.word	0xec28a00c	! t1_kref+0x20c8:   	stb	%l6, [%g2 + 0xc]
	.word	0x8184c000	! t1_kref+0x20cc:   	wr	%l3, %g0, %y
	.word	0x97b00f2d	! t1_kref+0x20d0:   	fsrc2s	%f13, %f11
	.word	0x8ba01888	! t1_kref+0x20d4:   	fitos	%f8, %f5
	.word	0x9de3bfa0	! t1_kref+0x20d8:   	save	%sp, -0x60, %sp
	.word	0xb8073598	! t1_kref+0x20dc:   	add	%i4, -0xa68, %i4
	.word	0x99ee0018	! t1_kref+0x20e0:   	restore	%i0, %i0, %o4
	.word	0xd8d0a004	! t1_kref+0x20e4:   	ldsha	[%g2 + 4]%asi, %o4
	.word	0x29480007	! t1_kref+0x20e8:   	fbl,a,pt	%fcc0, _kref+0x2104
	.word	0x98347808	! t1_kref+0x20ec:   	orn	%l1, -0x7f8, %o4
	.word	0xd8c62008	! t1_kref+0x20f0:   	ldswa	[%i0 + 8]%asi, %o4
	.word	0x81ad8a3a	! t1_kref+0x20f4:   	fcmps	%fcc0, %f22, %f26
	.word	0x81ab8a4c	! t1_kref+0x20f8:   	fcmpd	%fcc0, %f14, %f12
	.word	0x99b4c032	! t1_kref+0x20fc:   	edge8n	%l3, %l2, %o4
	.word	0xa1b40f96	! t1_kref+0x2100:   	for	%f16, %f22, %f16
	.word	0xa7a01a2c	! t1_kref+0x2104:   	fstoi	%f12, %f19
	.word	0xea764000	! t1_kref+0x2108:   	stx	%l5, [%i1]
	.word	0xa1a50856	! t1_kref+0x210c:   	faddd	%f20, %f22, %f16
	.word	0xabb38df7	! t1_kref+0x2110:   	fnands	%f14, %f23, %f21
	.word	0x8143c000	! t1_kref+0x2114:   	stbar
	.word	0x983db757	! t1_kref+0x2118:   	xnor	%l6, -0x8a9, %o4
	.word	0x98dabecc	! t1_kref+0x211c:   	smulcc	%o2, -0x134, %o4
	.word	0xb1a48854	! t1_kref+0x2120:   	faddd	%f18, %f20, %f24
	.word	0x8186c000	! t1_kref+0x2124:   	wr	%i3, %g0, %y
	.word	0x87a289ab	! t1_kref+0x2128:   	fdivs	%f10, %f11, %f3
	.word	0x98df24ab	! t1_kref+0x212c:   	smulcc	%i4, 0x4ab, %o4
	.word	0xa5a00554	! t1_kref+0x2130:   	fsqrtd	%f20, %f18
	.word	0x982b0008	! t1_kref+0x2134:   	andn	%o4, %o0, %o4
	.word	0x192316e6	! t1_kref+0x2138:   	sethi	%hi(0x8c5b9800), %o4
	.word	0x9924697a	! t1_kref+0x213c:   	mulscc	%l1, 0x97a, %o4
	.word	0x81834000	! t1_kref+0x2140:   	wr	%o5, %g0, %y
	.word	0x98344015	! t1_kref+0x2144:   	orn	%l1, %l5, %o4
	.word	0xd8164000	! t1_kref+0x2148:   	lduh	[%i1], %o4
	.word	0x993ac00d	! t1_kref+0x214c:   	sra	%o3, %o5, %o4
	.word	0x21480001	! t1_kref+0x2150:   	fbn,a,pt	%fcc0, _kref+0x2154
	.word	0x9865400b	! t1_kref+0x2154:   	subc	%l5, %o3, %o4
	.word	0xba103ff8	! t1_kref+0x2158:   	mov	0xfffffff8, %i5
	.word	0x27800001	! t1_kref+0x215c:   	fbul,a	_kref+0x2160
	.word	0xdb26001c	! t1_kref+0x2160:   	st	%f13, [%i0 + %i4]
	.word	0xfa50001b	! t1_kref+0x2164:   	ldsh	[%g0 + %i3], %i5
	.word	0x30800006	! t1_kref+0x2168:   	ba,a	_kref+0x2180
	.word	0xd8064000	! t1_kref+0x216c:   	ld	[%i1], %o4
	.word	0x987ae0e9	! t1_kref+0x2170:   	sdiv	%o3, 0xe9, %o4
	.word	0xec380019	! t1_kref+0x2174:   	std	%l6, [%g0 + %i1]
	.word	0xecb0a00c	! t1_kref+0x2178:   	stha	%l6, [%g2 + 0xc]%asi
	.word	0xe13e001d	! t1_kref+0x217c:   	std	%f16, [%i0 + %i5]
	.word	0xd888a00f	! t1_kref+0x2180:   	lduba	[%g2 + 0xf]%asi, %o4
	.word	0xa5b18df3	! t1_kref+0x2184:   	fnands	%f6, %f19, %f18
	.word	0x99148013	! t1_kref+0x2188:   	taddcctv	%l2, %l3, %o4
	.word	0x81d83a36	! t1_kref+0x218c:   	flush	%g0 - 0x5ca
	.word	0xa9a00031	! t1_kref+0x2190:   	fmovs	%f17, %f20
	.word	0x98e46db5	! t1_kref+0x2194:   	subccc	%l1, 0xdb5, %o4
	.word	0x8da00552	! t1_kref+0x2198:   	fsqrtd	%f18, %f6
	.word	0xd810a016	! t1_kref+0x219c:   	lduh	[%g2 + 0x16], %o4
	.word	0xd808a014	! t1_kref+0x21a0:   	ldub	[%g2 + 0x14], %o4
	.word	0x98837a9c	! t1_kref+0x21a4:   	addcc	%o5, -0x564, %o4
	.word	0x93b00f30	! t1_kref+0x21a8:   	fsrc2s	%f16, %f9
	.word	0x98e6ae3c	! t1_kref+0x21ac:   	subccc	%i2, 0xe3c, %o4
	.word	0x9895c01a	! t1_kref+0x21b0:   	orcc	%l7, %i2, %o4
	.word	0x987a37a5	! t1_kref+0x21b4:   	sdiv	%o0, -0x85b, %o4
	.word	0xe580a02c	! t1_kref+0x21b8:   	lda	[%g2 + 0x2c]%asi, %f18
	.word	0xe968a109	! t1_kref+0x21bc:   	prefetch	%g2 + 0x109, 20
	.word	0x89a54d30	! t1_kref+0x21c0:   	fsmuld	%f21, %f16, %f4
	.word	0x9f414000	! t1_kref+0x21c4:   	mov	%pc, %o7
!	.word	0x284a0f8e	! t1_kref+0x21c8:   	bleu,a,pt	%icc, SYM(t1_subr3)
	   	bleu,a,pt	%icc, SYM(t1_subr3)
	.word	0x85a00544	! t1_kref+0x21cc:   	fsqrtd	%f4, %f2
	.word	0x89a489ae	! t1_kref+0x21d0:   	fdivs	%f18, %f14, %f4
	.word	0xc807bfec	! t1_kref+0x21d4:   	ld	[%fp - 0x14], %g4
	.word	0x20800001	! t1_kref+0x21d8:   	bn,a	_kref+0x21dc
	.word	0xd9a6501c	! t1_kref+0x21dc:   	sta	%f12, [%i1 + %i4]0x80
	.word	0xb3a01a48	! t1_kref+0x21e0:   	fdtoi	%f8, %f25
	.word	0x8186c000	! t1_kref+0x21e4:   	wr	%i3, %g0, %y
	.word	0x87a01a58	! t1_kref+0x21e8:   	fdtoi	%f24, %f3
	.word	0x981362f2	! t1_kref+0x21ec:   	or	%o5, 0x2f2, %o4
	.word	0xb1b00c00	! t1_kref+0x21f0:   	fzero	%f24
	.word	0xa1b30cb4	! t1_kref+0x21f4:   	fandnot2s	%f12, %f20, %f16
	.word	0xb3a0188a	! t1_kref+0x21f8:   	fitos	%f10, %f25
	.word	0x8fa01a4e	! t1_kref+0x21fc:   	fdtoi	%f14, %f7
	.word	0x91a01890	! t1_kref+0x2200:   	fitos	%f16, %f8
	.word	0x98fd7016	! t1_kref+0x2204:   	sdivcc	%l5, -0xfea, %o4
	.word	0x81ddc012	! t1_kref+0x2208:   	flush	%l7 + %l2
	.word	0x98c4b5c1	! t1_kref+0x220c:   	addccc	%l2, -0xa3f, %o4
	.word	0x81ad8acc	! t1_kref+0x2210:   	fcmped	%fcc0, %f22, %f12
	.word	0xdd3e2010	! t1_kref+0x2214:   	std	%f14, [%i0 + 0x10]
	.word	0xd896d040	! t1_kref+0x2218:   	lduha	[%i3]0x82, %o4
	.word	0x9866a940	! t1_kref+0x221c:   	subc	%i2, 0x940, %o4
	.word	0xd1be180d	! t1_kref+0x2220:   	stda	%f8, [%i0 + %o5]0xc0
	.word	0x9815f8a0	! t1_kref+0x2224:   	or	%l7, -0x760, %o4
	.word	0x8143e026	! t1_kref+0x2228:   	membar	0x26
	.word	0x992a4013	! t1_kref+0x222c:   	sll	%o1, %l3, %o4
	.word	0x9814e035	! t1_kref+0x2230:   	or	%l3, 0x35, %o4
	.word	0xd93f4019	! t1_kref+0x2234:   	std	%f12, [%i5 + %i1]
	.word	0xda7e7ffc	! t1_kref+0x2238:   	swap	[%i1 - 4], %o5
	.word	0x8143e001	! t1_kref+0x223c:   	membar	0x1
	.word	0x98a5c013	! t1_kref+0x2240:   	subcc	%l7, %l3, %o4
	.word	0x98e323d7	! t1_kref+0x2244:   	subccc	%o4, 0x3d7, %o4
	.word	0xb3b30ea0	! t1_kref+0x2248:   	fsrc1s	%f12, %f25
	.word	0xada64824	! t1_kref+0x224c:   	fadds	%f25, %f4, %f22
	.word	0x33800001	! t1_kref+0x2250:   	fbe,a	_kref+0x2254
	.word	0x9fa289af	! t1_kref+0x2254:   	fdivs	%f10, %f15, %f15
	.word	0x81de3274	! t1_kref+0x2258:   	flush	%i0 - 0xd8c
	.word	0xd80e001a	! t1_kref+0x225c:   	ldub	[%i0 + %i2], %o4
	.word	0xd8070019	! t1_kref+0x2260:   	ld	[%i4 + %i1], %o4
	.word	0x9940c000	! t1_kref+0x2264:   	mov	%asi, %o4
	.word	0x983c67a5	! t1_kref+0x2268:   	xnor	%l1, 0x7a5, %o4
	.word	0x98bd69d6	! t1_kref+0x226c:   	xnorcc	%l5, 0x9d6, %o4
	.word	0xc9003a14	! t1_kref+0x2270:   	ld	[%g0 - 0x5ec], %f4
	.word	0xd8163ffa	! t1_kref+0x2274:   	lduh	[%i0 - 6], %o4
	.word	0xe91fbcd0	! t1_kref+0x2278:   	ldd	[%fp - 0x330], %f20
	.word	0xd6363ff0	! t1_kref+0x227c:   	sth	%o3, [%i0 - 0x10]
	.word	0x9802c01a	! t1_kref+0x2280:   	add	%o3, %i2, %o4
	sethi	%hi(2f), %o7
	.word	0xe40be2c0	! t1_kref+0x2288:   	ldub	[%o7 + 0x2c0], %l2
	.word	0xa41ca00c	! t1_kref+0x228c:   	xor	%l2, 0xc, %l2
	.word	0xe42be2c0	! t1_kref+0x2290:   	stb	%l2, [%o7 + 0x2c0]
	.word	0x81dbe2c0	! t1_kref+0x2294:   	flush	%o7 + 0x2c0
	.word	0x95a48854	! t1_kref+0x2298:   	faddd	%f18, %f20, %f10
	call	SYM(t1_subr0)
	.word	0xb1a1084e	! t1_kref+0x22a0:   	faddd	%f4, %f14, %f24
	.word	0x39480006	! t1_kref+0x22a4:   	fbuge,a,pt	%fcc0, _kref+0x22bc
	.word	0xd80e3fe8	! t1_kref+0x22a8:   	ldub	[%i0 - 0x18], %o4
	.word	0xdf20a034	! t1_kref+0x22ac:   	st	%f15, [%g2 + 0x34]
	.word	0xa9b30752	! t1_kref+0x22b0:   	fpack32	%f12, %f18, %f20
	.word	0xb5a01a2f	! t1_kref+0x22b4:   	fstoi	%f15, %f26
	.word	0x3b480004	! t1_kref+0x22b8:   	fble,a,pt	%fcc0, _kref+0x22c8
	.word	0x99b54028	! t1_kref+0x22bc:   	edge8n	%l5, %o0, %o4
2:	.word	0xd8000019	! t1_kref+0x22c0:   	ld	[%g0 + %i1], %o4
	.word	0x992a201d	! t1_kref+0x22c4:   	sll	%o0, 0x1d, %o4
	.word	0x993ec016	! t1_kref+0x22c8:   	sra	%i3, %l6, %o4
	.word	0x98a723df	! t1_kref+0x22cc:   	subcc	%i4, 0x3df, %o4
	.word	0xada0190f	! t1_kref+0x22d0:   	fitod	%f15, %f22
	.word	0xb1b20ea0	! t1_kref+0x22d4:   	fsrc1s	%f8, %f24
	.word	0x987d001a	! t1_kref+0x22d8:   	sdiv	%l4, %i2, %o4
	.word	0x93b00770	! t1_kref+0x22dc:   	fpack16	%f16, %f9
	.word	0x98f3609e	! t1_kref+0x22e0:   	udivcc	%o5, 0x9e, %o4
	.word	0xe9066008	! t1_kref+0x22e4:   	ld	[%i1 + 8], %f20
	.word	0xe300a014	! t1_kref+0x22e8:   	ld	[%g2 + 0x14], %f17
	.word	0xd8062000	! t1_kref+0x22ec:   	ld	[%i0], %o4
	.word	0xe780a004	! t1_kref+0x22f0:   	lda	[%g2 + 4]%asi, %f19
	.word	0x99a00552	! t1_kref+0x22f4:   	fsqrtd	%f18, %f12
	.word	0x91a00544	! t1_kref+0x22f8:   	fsqrtd	%f4, %f8
	.word	0xd0a8a02e	! t1_kref+0x22fc:   	stba	%o0, [%g2 + 0x2e]%asi
	.word	0x99a28934	! t1_kref+0x2300:   	fmuls	%f10, %f20, %f12
	.word	0xe1be581b	! t1_kref+0x2304:   	stda	%f16, [%i1 + %i3]0xc0
	.word	0xea200018	! t1_kref+0x2308:   	st	%l5, [%g0 + %i0]
	.word	0xd848a026	! t1_kref+0x230c:   	ldsb	[%g2 + 0x26], %o4
	.word	0x98bcbd20	! t1_kref+0x2310:   	xnorcc	%l2, -0x2e0, %o4
	.word	0xd8d6d018	! t1_kref+0x2314:   	ldsha	[%i3 + %i0]0x80, %o4
	sethi	%hi(2f), %o7
	.word	0xe40be348	! t1_kref+0x231c:   	ldub	[%o7 + 0x348], %l2
	.word	0xa41ca00c	! t1_kref+0x2320:   	xor	%l2, 0xc, %l2
	.word	0xe42be348	! t1_kref+0x2324:   	stb	%l2, [%o7 + 0x348]
	.word	0x81dbe348	! t1_kref+0x2328:   	flush	%o7 + 0x348
	.word	0x2d800008	! t1_kref+0x232c:   	fbg,a	_kref+0x234c
	.word	0x9802f965	! t1_kref+0x2330:   	add	%o3, -0x69b, %o4
	.word	0x89a00550	! t1_kref+0x2334:   	fsqrtd	%f16, %f4
	.word	0xed68a008	! t1_kref+0x2338:   	prefetch	%g2 + 8, 22
	.word	0x9812400a	! t1_kref+0x233c:   	or	%o1, %o2, %o4
	.word	0x989ec013	! t1_kref+0x2340:   	xorcc	%i3, %l3, %o4
	.word	0xe93e4000	! t1_kref+0x2344:   	std	%f20, [%i1]
2:	.word	0x98327095	! t1_kref+0x2348:   	orn	%o1, -0xf6b, %o4
	.word	0x95a018c4	! t1_kref+0x234c:   	fdtos	%f4, %f10
	.word	0x99224012	! t1_kref+0x2350:   	mulscc	%o1, %l2, %o4
	.word	0xd80e2002	! t1_kref+0x2354:   	ldub	[%i0 + 2], %o4
	.word	0x98ddeca6	! t1_kref+0x2358:   	smulcc	%l7, 0xca6, %o4
	.word	0xa3a44833	! t1_kref+0x235c:   	fadds	%f17, %f19, %f17
	.word	0xede8a0c3	! t1_kref+0x2360:   	prefetcha	%g2 + 0xc3, 22
	.word	0xdb20a02c	! t1_kref+0x2364:   	st	%f13, [%g2 + 0x2c]
	.word	0xd84e6018	! t1_kref+0x2368:   	ldsb	[%i1 + 0x18], %o4
	.word	0x29800002	! t1_kref+0x236c:   	fbl,a	_kref+0x2374
	.word	0xee20a00c	! t1_kref+0x2370:   	st	%l7, [%g2 + 0xc]
	.word	0xada01935	! t1_kref+0x2374:   	fstod	%f21, %f22
	.word	0x9896a056	! t1_kref+0x2378:   	orcc	%i2, 0x56, %o4
	.word	0x37480007	! t1_kref+0x237c:   	fbge,a,pt	%fcc0, _kref+0x2398
	.word	0x9da01886	! t1_kref+0x2380:   	fitos	%f6, %f14
	.word	0x99b5410a	! t1_kref+0x2384:   	edge32	%l5, %o2, %o4
	.word	0x8db1cef5	! t1_kref+0x2388:   	fornot2s	%f7, %f21, %f6
	.word	0xe1ee501b	! t1_kref+0x238c:   	prefetcha	%i1 + %i3, 16
	.word	0xb3b54ae7	! t1_kref+0x2390:   	fpsub32s	%f21, %f7, %f25
	.word	0x9895ac19	! t1_kref+0x2394:   	orcc	%l6, 0xc19, %o4
	.word	0x98e375a3	! t1_kref+0x2398:   	subccc	%o5, -0xa5d, %o4
	.word	0x98fac01a	! t1_kref+0x239c:   	sdivcc	%o3, %i2, %o4
	.word	0x81ae0ac8	! t1_kref+0x23a0:   	fcmped	%fcc0, %f24, %f8
	.word	0xd8801019	! t1_kref+0x23a4:   	lda	[%g0 + %i1]0x80, %o4
	.word	0x98dd800b	! t1_kref+0x23a8:   	smulcc	%l6, %o3, %o4
	.word	0x98bf3c96	! t1_kref+0x23ac:   	xnorcc	%i4, -0x36a, %o4
	.word	0x8582801a	! t1_kref+0x23b0:   	wr	%o2, %i2, %ccr
	.word	0x878020e0	! t1_kref+0x23b4:   	mov	0xe0, %asi
	.word	0x8db00cfa	! t1_kref+0x23b8:   	fnot2s	%f26, %f6
	.word	0x983d65ae	! t1_kref+0x23bc:   	xnor	%l5, 0x5ae, %o4
	.word	0x9866e965	! t1_kref+0x23c0:   	subc	%i3, 0x965, %o4
	.word	0x8ba0053a	! t1_kref+0x23c4:   	fsqrts	%f26, %f5
	.word	0xaba40827	! t1_kref+0x23c8:   	fadds	%f16, %f7, %f21
	.word	0x89a01903	! t1_kref+0x23cc:   	fitod	%f3, %f4
	.word	0xd80e601e	! t1_kref+0x23d0:   	ldub	[%i1 + 0x1e], %o4
	.word	0x99418000	! t1_kref+0x23d4:   	mov	%fprs, %o4
	.word	0xb1b007b8	! t1_kref+0x23d8:   	fpackfix	%f24, %f24
	.word	0xec28a01e	! t1_kref+0x23dc:   	stb	%l6, [%g2 + 0x1e]
	.word	0xf13f4018	! t1_kref+0x23e0:   	std	%f24, [%i5 + %i0]
	.word	0x93a00539	! t1_kref+0x23e4:   	fsqrts	%f25, %f9
	.word	0x98a58016	! t1_kref+0x23e8:   	subcc	%l6, %l6, %o4
	.word	0xeb86101c	! t1_kref+0x23ec:   	lda	[%i0 + %i4]0x80, %f21
	.word	0x99b68280	! t1_kref+0x23f0:   	array32	%i2, %g0, %o4
	.word	0x1916fb95	! t1_kref+0x23f4:   	sethi	%hi(0x5bee5400), %o4
	.word	0xdd3e4000	! t1_kref+0x23f8:   	std	%f14, [%i1]
	.word	0x99382013	! t1_kref+0x23fc:   	sra	%g0, 0x13, %o4
	.word	0xd8100019	! t1_kref+0x2400:   	lduh	[%g0 + %i1], %o4
	.word	0xed68a005	! t1_kref+0x2404:   	prefetch	%g2 + 5, 22
	.word	0x192c06b7	! t1_kref+0x2408:   	sethi	%hi(0xb01adc00), %o4
	.word	0x8fab8035	! t1_kref+0x240c:   	fmovsule	%fcc0, %f21, %f7
	.word	0x98b33520	! t1_kref+0x2410:   	orncc	%o4, -0xae0, %o4
	.word	0x8143e040	! t1_kref+0x2414:   	membar	0x40
	.word	0xe1380019	! t1_kref+0x2418:   	std	%f16, [%g0 + %i1]
	.word	0x81ae8a25	! t1_kref+0x241c:   	fcmps	%fcc0, %f26, %f5
	.word	0x98e3001a	! t1_kref+0x2420:   	subccc	%o4, %i2, %o4
	.word	0x9fa00534	! t1_kref+0x2424:   	fsqrts	%f20, %f15
	.word	0x9866b8cb	! t1_kref+0x2428:   	subc	%i2, -0x735, %o4
	.word	0x8186c000	! t1_kref+0x242c:   	wr	%i3, %g0, %y
	.word	0xd8164000	! t1_kref+0x2430:   	lduh	[%i1], %o4
	.word	0xd856201e	! t1_kref+0x2434:   	ldsh	[%i0 + 0x1e], %o4
	.word	0xda28a02f	! t1_kref+0x2438:   	stb	%o5, [%g2 + 0x2f]
	.word	0x989d401b	! t1_kref+0x243c:   	xorcc	%l5, %i3, %o4
	.word	0xada00552	! t1_kref+0x2440:   	fsqrtd	%f18, %f22
	.word	0x99a00046	! t1_kref+0x2444:   	fmovd	%f6, %f12
	.word	0xea260000	! t1_kref+0x2448:   	st	%l5, [%i0]
	.word	0xe11fbf40	! t1_kref+0x244c:   	ldd	[%fp - 0xc0], %f16
	.word	0x87a01a46	! t1_kref+0x2450:   	fdtoi	%f6, %f3
	.word	0x9da00550	! t1_kref+0x2454:   	fsqrtd	%f16, %f14
	.word	0xc93e7fe0	! t1_kref+0x2458:   	std	%f4, [%i1 - 0x20]
	.word	0xe3b8a0c0	! t1_kref+0x245c:   	stda	%f48, [%g2 + 0xc0]%asi
	.word	0xafb24af3	! t1_kref+0x2460:   	fpsub32s	%f9, %f19, %f23
	.word	0x985d4011	! t1_kref+0x2464:   	smul	%l5, %l1, %o4
	.word	0xa5b60a8a	! t1_kref+0x2468:   	fpsub16	%f24, %f10, %f18
	.word	0xd220a014	! t1_kref+0x246c:   	st	%o1, [%g2 + 0x14]
	sethi	%hi(2f), %o7
	.word	0xe40be08c	! t1_kref+0x2474:   	ldub	[%o7 + 0x8c], %l2
	.word	0xa41ca00c	! t1_kref+0x2478:   	xor	%l2, 0xc, %l2
	.word	0xe42be08c	! t1_kref+0x247c:   	stb	%l2, [%o7 + 0x8c]
	.word	0x81dbe08c	! t1_kref+0x2480:   	flush	%o7 + 0x8c
	.word	0xa1b60fad	! t1_kref+0x2484:   	fors	%f24, %f13, %f16
	.word	0xe820a034	! t1_kref+0x2488:   	st	%l4, [%g2 + 0x34]
2:	.word	0x98faf73d	! t1_kref+0x248c:   	sdivcc	%o3, -0x8c3, %o4
	.word	0xe67e0000	! t1_kref+0x2490:   	swap	[%i0], %l3
	.word	0xec68a004	! t1_kref+0x2494:   	ldstub	[%g2 + 4], %l6
	.word	0x8143e040	! t1_kref+0x2498:   	membar	0x40
	.word	0x98fc4015	! t1_kref+0x249c:   	sdivcc	%l1, %l5, %o4
	.word	0x99b1849a	! t1_kref+0x24a0:   	fcmple32	%f6, %f26, %o4
	.word	0xcf20a004	! t1_kref+0x24a4:   	st	%f7, [%g2 + 4]
	.word	0xafa00536	! t1_kref+0x24a8:   	fsqrts	%f22, %f23
	.word	0xa9a289ca	! t1_kref+0x24ac:   	fdivd	%f10, %f10, %f20
	.word	0x878020d0	! t1_kref+0x24b0:   	mov	0xd0, %asi
	.word	0x89b406ea	! t1_kref+0x24b4:   	fmul8ulx16	%f16, %f10, %f4
	.word	0x9924b842	! t1_kref+0x24b8:   	mulscc	%l2, -0x7be, %o4
	.word	0xefee501b	! t1_kref+0x24bc:   	prefetcha	%i1 + %i3, 23
	.word	0xa7a0053a	! t1_kref+0x24c0:   	fsqrts	%f26, %f19
	.word	0x983ab198	! t1_kref+0x24c4:   	xnor	%o2, -0xe68, %o4
	.word	0xeaa71018	! t1_kref+0x24c8:   	sta	%l5, [%i4 + %i0]0x80
	.word	0x98957046	! t1_kref+0x24cc:   	orcc	%l5, -0xfba, %o4
	.word	0x98e0376d	! t1_kref+0x24d0:   	subccc	%g0, -0x893, %o4
	.word	0x87a0052c	! t1_kref+0x24d4:   	fsqrts	%f12, %f3
	.word	0x87b00f2d	! t1_kref+0x24d8:   	fsrc2s	%f13, %f3
	.word	0xd228a025	! t1_kref+0x24dc:   	stb	%o1, [%g2 + 0x25]
	.word	0xd848a004	! t1_kref+0x24e0:   	ldsb	[%g2 + 4], %o4
	.word	0x98c50015	! t1_kref+0x24e4:   	addccc	%l4, %l5, %o4
	.word	0x99b5c0e8	! t1_kref+0x24e8:   	edge16ln	%l7, %o0, %o4
	.word	0xd230a024	! t1_kref+0x24ec:   	sth	%o1, [%g2 + 0x24]
	.word	0x85a000ce	! t1_kref+0x24f0:   	fnegd	%f14, %f2
	.word	0x98fd801b	! t1_kref+0x24f4:   	sdivcc	%l6, %i3, %o4
	.word	0x99b305d4	! t1_kref+0x24f8:   	fcmpeq32	%f12, %f20, %o4
	.word	0x99b280ed	! t1_kref+0x24fc:   	edge16ln	%o2, %o5, %o4
	.word	0x3b480003	! t1_kref+0x2500:   	fble,a,pt	%fcc0, _kref+0x250c
	.word	0xa9a00558	! t1_kref+0x2504:   	fsqrtd	%f24, %f20
	.word	0xd9bf5a58	! t1_kref+0x2508:   	stda	%f12, [%i5 + %i0]0xd2
	.word	0xef00a01c	! t1_kref+0x250c:   	ld	[%g2 + 0x1c], %f23
	.word	0x9916e115	! t1_kref+0x2510:   	taddcctv	%i3, 0x115, %o4
	.word	0x9925b065	! t1_kref+0x2514:   	mulscc	%l6, -0xf9b, %o4
	.word	0xa9b38e42	! t1_kref+0x2518:   	fxnor	%f14, %f2, %f20
	.word	0x89a64927	! t1_kref+0x251c:   	fmuls	%f25, %f7, %f4
	.word	0xc53e6008	! t1_kref+0x2520:   	std	%f2, [%i1 + 8]
	.word	0x99a00552	! t1_kref+0x2524:   	fsqrtd	%f18, %f12
	.word	0xd43e3ff0	! t1_kref+0x2528:   	std	%o2, [%i0 - 0x10]
	.word	0xb3a00523	! t1_kref+0x252c:   	fsqrts	%f3, %f25
	.word	0x30800007	! t1_kref+0x2530:   	ba,a	_kref+0x254c
	.word	0xdba6101c	! t1_kref+0x2534:   	sta	%f13, [%i0 + %i4]0x80
	.word	0xb3a01a3a	! t1_kref+0x2538:   	fstoi	%f26, %f25
	.word	0x8ba01a48	! t1_kref+0x253c:   	fdtoi	%f8, %f5
	.word	0x89a01919	! t1_kref+0x2540:   	fitod	%f25, %f4
	.word	0x81ad4a2f	! t1_kref+0x2544:   	fcmps	%fcc0, %f21, %f15
	.word	0xa1a0002e	! t1_kref+0x2548:   	fmovs	%f14, %f16
	.word	0xd2e81018	! t1_kref+0x254c:   	ldstuba	[%g0 + %i0]0x80, %o1
	.word	0x8fa289b9	! t1_kref+0x2550:   	fdivs	%f10, %f25, %f7
	.word	0x191054ab	! t1_kref+0x2554:   	sethi	%hi(0x4152ac00), %o4
	.word	0x9db00fc0	! t1_kref+0x2558:   	fone	%f14
	.word	0x99b40582	! t1_kref+0x255c:   	fcmpgt32	%f16, %f2, %o4
	.word	0x98180016	! t1_kref+0x2560:   	xor	%g0, %l6, %o4
	.word	0x98630014	! t1_kref+0x2564:   	subc	%o4, %l4, %o4
	.word	0x98a00014	! t1_kref+0x2568:   	subcc	%g0, %l4, %o4
	.word	0x98d70016	! t1_kref+0x256c:   	umulcc	%i4, %l6, %o4
	.word	0x9844e5ec	! t1_kref+0x2570:   	addc	%l3, 0x5ec, %o4
	.word	0xf53e2008	! t1_kref+0x2574:   	std	%f26, [%i0 + 8]
	.word	0xc168a081	! t1_kref+0x2578:   	prefetch	%g2 + 0x81, 0
	.word	0x87a018d8	! t1_kref+0x257c:   	fdtos	%f24, %f3
	.word	0x993f0017	! t1_kref+0x2580:   	sra	%i4, %l7, %o4
	.word	0x991cc012	! t1_kref+0x2584:   	tsubcctv	%l3, %l2, %o4
	.word	0xd806001c	! t1_kref+0x2588:   	ld	[%i0 + %i4], %o4
	.word	0x9856800d	! t1_kref+0x258c:   	umul	%i2, %o5, %o4
	.word	0xd8c01019	! t1_kref+0x2590:   	ldswa	[%g0 + %i1]0x80, %o4
	.word	0xd8c71019	! t1_kref+0x2594:   	ldswa	[%i4 + %i1]0x80, %o4
	.word	0xd850a01e	! t1_kref+0x2598:   	ldsh	[%g2 + 0x1e], %o4
	.word	0xdd26401c	! t1_kref+0x259c:   	st	%f14, [%i1 + %i4]
	.word	0xd856401b	! t1_kref+0x25a0:   	ldsh	[%i1 + %i3], %o4
	.word	0x99b580e0	! t1_kref+0x25a4:   	edge16ln	%l6, %g0, %o4
	.word	0x99258014	! t1_kref+0x25a8:   	mulscc	%l6, %l4, %o4
	.word	0xd020a03c	! t1_kref+0x25ac:   	st	%o0, [%g2 + 0x3c]
	.word	0xb1a01a50	! t1_kref+0x25b0:   	fdtoi	%f16, %f24
	.word	0x98feabc9	! t1_kref+0x25b4:   	sdivcc	%i2, 0xbc9, %o4
	.word	0x99222b63	! t1_kref+0x25b8:   	mulscc	%o0, 0xb63, %o4
	.word	0xe830a004	! t1_kref+0x25bc:   	sth	%l4, [%g2 + 4]
	.word	0xd856001b	! t1_kref+0x25c0:   	ldsh	[%i0 + %i3], %o4
	.word	0x81aa0ace	! t1_kref+0x25c4:   	fcmped	%fcc0, %f8, %f14
	.word	0xe43e7ff8	! t1_kref+0x25c8:   	std	%l2, [%i1 - 8]
	.word	0x989a4014	! t1_kref+0x25cc:   	xorcc	%o1, %l4, %o4
	.word	0x91a40856	! t1_kref+0x25d0:   	faddd	%f16, %f22, %f8
	.word	0xd8500019	! t1_kref+0x25d4:   	ldsh	[%g0 + %i1], %o4
	.word	0xa1a01904	! t1_kref+0x25d8:   	fitod	%f4, %f16
	.word	0xd6ee9019	! t1_kref+0x25dc:   	ldstuba	[%i2 + %i1]0x80, %o3
	.word	0x1923e46c	! t1_kref+0x25e0:   	sethi	%hi(0x8f91b000), %o4
	.word	0x989d800b	! t1_kref+0x25e4:   	xorcc	%l6, %o3, %o4
	.word	0x9de3bfa0	! t1_kref+0x25e8:   	save	%sp, -0x60, %sp
	.word	0xb286b9d4	! t1_kref+0x25ec:   	addcc	%i2, -0x62c, %i1
	.word	0x99ef3291	! t1_kref+0x25f0:   	restore	%i4, -0xd6f, %o4
	.word	0x98c70014	! t1_kref+0x25f4:   	addccc	%i4, %l4, %o4
	.word	0x9812401b	! t1_kref+0x25f8:   	or	%o1, %i3, %o4
	.word	0xd80e3fe6	! t1_kref+0x25fc:   	ldub	[%i0 - 0x1a], %o4
	.word	0x95a01028	! t1_kref+0x2600:   	fstox	%f8, %f10
	.word	0xe51fbf00	! t1_kref+0x2604:   	ldd	[%fp - 0x100], %f18
	.word	0x99b2013a	! t1_kref+0x2608:   	edge32n	%o0, %i2, %o4
	.word	0xe51f4005	! t1_kref+0x260c:   	ldd	[%i5 + %g5], %f18
	.word	0x81a90a23	! t1_kref+0x2610:   	fcmps	%fcc0, %f4, %f3
	.word	0x98dc6ef4	! t1_kref+0x2614:   	smulcc	%l1, 0xef4, %o4
	.word	0x989d8016	! t1_kref+0x2618:   	xorcc	%l6, %l6, %o4
	.word	0xd84e401a	! t1_kref+0x261c:   	ldsb	[%i1 + %i2], %o4
	.word	0xabb00f33	! t1_kref+0x2620:   	fsrc2s	%f19, %f21
	.word	0xa3a2c9ae	! t1_kref+0x2624:   	fdivs	%f11, %f14, %f17
	.word	0xa1a00548	! t1_kref+0x2628:   	fsqrtd	%f8, %f16
	.word	0x99a00556	! t1_kref+0x262c:   	fsqrtd	%f22, %f12
	.word	0xef68a006	! t1_kref+0x2630:   	prefetch	%g2 + 6, 23
	.word	0xa5b00cef	! t1_kref+0x2634:   	fnot2s	%f15, %f18
	.word	0xe900a024	! t1_kref+0x2638:   	ld	[%g2 + 0x24], %f20
	.word	0x98a4f33a	! t1_kref+0x263c:   	subcc	%l3, -0xcc6, %o4
	.word	0x37480001	! t1_kref+0x2640:   	fbge,a,pt	%fcc0, _kref+0x2644
	.word	0xa5b00f3a	! t1_kref+0x2644:   	fsrc2s	%f26, %f18
	.word	0x99a00526	! t1_kref+0x2648:   	fsqrts	%f6, %f12
	sethi	%hi(2f), %o7
	.word	0xe40be26c	! t1_kref+0x2650:   	ldub	[%o7 + 0x26c], %l2
	.word	0xa41ca00c	! t1_kref+0x2654:   	xor	%l2, 0xc, %l2
	.word	0xe42be26c	! t1_kref+0x2658:   	stb	%l2, [%o7 + 0x26c]
	.word	0x81dbe26c	! t1_kref+0x265c:   	flush	%o7 + 0x26c
	.word	0xb1b50a69	! t1_kref+0x2660:   	fpadd32s	%f20, %f9, %f24
	.word	0x19317a9a	! t1_kref+0x2664:   	sethi	%hi(0xc5ea6800), %o4
	.word	0x8fa0012d	! t1_kref+0x2668:   	fabss	%f13, %f7
2:	.word	0xb1a0190d	! t1_kref+0x266c:   	fitod	%f13, %f24
	.word	0x2d480007	! t1_kref+0x2670:   	fbg,a,pt	%fcc0, _kref+0x268c
	.word	0x81870000	! t1_kref+0x2674:   	wr	%i4, %g0, %y
	.word	0x91a489cc	! t1_kref+0x2678:   	fdivd	%f18, %f12, %f8
	.word	0x8143c000	! t1_kref+0x267c:   	stbar
	.word	0x9802c01c	! t1_kref+0x2680:   	add	%o3, %i4, %o4
	.word	0xd51fbca8	! t1_kref+0x2684:   	ldd	[%fp - 0x358], %f10
	.word	0xd43e7ff0	! t1_kref+0x2688:   	std	%o2, [%i1 - 0x10]
	.word	0x98a22332	! t1_kref+0x268c:   	subcc	%o0, 0x332, %o4
	.word	0x19243bf0	! t1_kref+0x2690:   	sethi	%hi(0x90efc000), %o4
	.word	0xea20a00c	! t1_kref+0x2694:   	st	%l5, [%g2 + 0xc]
	.word	0x86102001	! t1_kref+0x2698:   	mov	0x1, %g3
	.word	0x32800000	! t1_kref+0x269c:   	bne,a	_kref+0x269c
	.word	0x86a0e001	! t1_kref+0x26a0:   	subcc	%g3, 1, %g3
	.word	0xd91fbd88	! t1_kref+0x26a4:   	ldd	[%fp - 0x278], %f12
	.word	0x98e02bd8	! t1_kref+0x26a8:   	subccc	%g0, 0xbd8, %o4
	.word	0xee26601c	! t1_kref+0x26ac:   	st	%l7, [%i1 + 0x1c]
	.word	0x81800000	! t1_kref+0x26b0:   	mov	%g0, %y
	.word	0x993a601d	! t1_kref+0x26b4:   	sra	%o1, 0x1d, %o4
	.word	0xd800a024	! t1_kref+0x26b8:   	ld	[%g2 + 0x24], %o4
	.word	0xf821401c	! t1_kref+0x26bc:   	st	%i4, [%g5 + %i4]
	.word	0x991d8016	! t1_kref+0x26c0:   	tsubcctv	%l6, %l6, %o4
	.word	0xd84e3ffd	! t1_kref+0x26c4:   	ldsb	[%i0 - 3], %o4
	.word	0x99a38848	! t1_kref+0x26c8:   	faddd	%f14, %f8, %f12
	.word	0x98f26f8a	! t1_kref+0x26cc:   	udivcc	%o1, 0xf8a, %o4
	.word	0x989a6aaf	! t1_kref+0x26d0:   	xorcc	%o1, 0xaaf, %o4
	.word	0x989d001b	! t1_kref+0x26d4:   	xorcc	%l4, %i3, %o4
	.word	0xe9ee101c	! t1_kref+0x26d8:   	prefetcha	%i0 + %i4, 20
	.word	0x39480004	! t1_kref+0x26dc:   	fbuge,a,pt	%fcc0, _kref+0x26ec
	.word	0xe7ee101c	! t1_kref+0x26e0:   	prefetcha	%i0 + %i4, 19
	.word	0xa5a01037	! t1_kref+0x26e4:   	fstox	%f23, %f18
	.word	0xd856601c	! t1_kref+0x26e8:   	ldsh	[%i1 + 0x1c], %o4
	.word	0x9f414000	! t1_kref+0x26ec:   	mov	%pc, %o7
!	.word	0x304a0e44	! t1_kref+0x26f0:   	ba,a,pt	%icc, SYM(t1_subr3)
	   	ba,a,pt	%icc, SYM(t1_subr3)
	.word	0x95a289c4	! t1_kref+0x26f4:   	fdivd	%f10, %f4, %f10
	.word	0x81de8004	! t1_kref+0x26f8:   	flush	%i2 + %g4
	call	SYM(t1_subr1)
	.word	0x98e4e9fa	! t1_kref+0x2700:   	subccc	%l3, 0x9fa, %o4
	.word	0x99b40484	! t1_kref+0x2704:   	fcmple32	%f16, %f4, %o4
	.word	0x8da0054c	! t1_kref+0x2708:   	fsqrtd	%f12, %f6
	.word	0x8186c000	! t1_kref+0x270c:   	wr	%i3, %g0, %y
	.word	0xafb60ea0	! t1_kref+0x2710:   	fsrc1s	%f24, %f23
	.word	0x9862e104	! t1_kref+0x2714:   	subc	%o3, 0x104, %o4
	.word	0x21800003	! t1_kref+0x2718:   	fbn,a	_kref+0x2724
	.word	0x81848000	! t1_kref+0x271c:   	wr	%l2, %g0, %y
	.word	0xea7e0000	! t1_kref+0x2720:   	swap	[%i0], %l5
	.word	0x99b00cda	! t1_kref+0x2724:   	fnot2	%f26, %f12
	.word	0x987cf234	! t1_kref+0x2728:   	sdiv	%l3, -0xdcc, %o4
	.word	0xe51fbd00	! t1_kref+0x272c:   	ldd	[%fp - 0x300], %f18
	.word	0x81abca35	! t1_kref+0x2730:   	fcmps	%fcc0, %f15, %f21
	.word	0xa1b206a5	! t1_kref+0x2734:   	fmul8x16al	%f8, %f5, %f16
	.word	0xc030a03e	! t1_kref+0x2738:   	clrh	[%g2 + 0x3e]
	.word	0x3f800007	! t1_kref+0x273c:   	fbo,a	_kref+0x2758
	.word	0xb5a01916	! t1_kref+0x2740:   	fitod	%f22, %f26
	.word	0x988e8011	! t1_kref+0x2744:   	andcc	%i2, %l1, %o4
	.word	0x89b00cf2	! t1_kref+0x2748:   	fnot2s	%f18, %f4
	.word	0xd80e2005	! t1_kref+0x274c:   	ldub	[%i0 + 5], %o4
	.word	0x98c4f6e9	! t1_kref+0x2750:   	addccc	%l3, -0x917, %o4
	.word	0x36480007	! t1_kref+0x2754:   	bge,a,pt	%icc, _kref+0x2770
	.word	0xb5a01096	! t1_kref+0x2758:   	fxtos	%f22, %f26
	.word	0xd8163fe8	! t1_kref+0x275c:   	lduh	[%i0 - 0x18], %o4
	call	SYM(t1_subr1)
	.word	0x99b5c0fa	! t1_kref+0x2764:   	edge16ln	%l7, %i2, %o4
	.word	0x99a0054e	! t1_kref+0x2768:   	fsqrtd	%f14, %f12
	.word	0x98a5a49c	! t1_kref+0x276c:   	subcc	%l6, 0x49c, %o4
	.word	0x87802080	! t1_kref+0x2770:   	mov	0x80, %asi
	.word	0x8ba01a4e	! t1_kref+0x2774:   	fdtoi	%f14, %f5
	.word	0xb3a0002b	! t1_kref+0x2778:   	fmovs	%f11, %f25
	.word	0x98432bf5	! t1_kref+0x277c:   	addc	%o4, 0xbf5, %o4
	.word	0x8da01913	! t1_kref+0x2780:   	fitod	%f19, %f6
	.word	0xd03e3fe8	! t1_kref+0x2784:   	std	%o0, [%i0 - 0x18]
	.word	0x98528014	! t1_kref+0x2788:   	umul	%o2, %l4, %o4
	.word	0x9885001b	! t1_kref+0x278c:   	addcc	%l4, %i3, %o4
	.word	0xe96e401c	! t1_kref+0x2790:   	prefetch	%i1 + %i4, 20
	.word	0x93a00523	! t1_kref+0x2794:   	fsqrts	%f3, %f9
	.word	0x30480008	! t1_kref+0x2798:   	ba,a,pt	%icc, _kref+0x27b8
	.word	0xefee501d	! t1_kref+0x279c:   	prefetcha	%i1 + %i5, 23
	.word	0x98fd4009	! t1_kref+0x27a0:   	sdivcc	%l5, %o1, %o4
	.word	0x97a01a46	! t1_kref+0x27a4:   	fdtoi	%f6, %f11
	.word	0x97a01a25	! t1_kref+0x27a8:   	fstoi	%f5, %f11
	.word	0xc9be5888	! t1_kref+0x27ac:   	stda	%f4, [%i1 + %o0]0xc4
	.word	0x26480003	! t1_kref+0x27b0:   	bl,a,pt	%icc, _kref+0x27bc
	.word	0xa3a0c92a	! t1_kref+0x27b4:   	fmuls	%f3, %f10, %f17
	.word	0xebe8a10c	! t1_kref+0x27b8:   	prefetcha	%g2 + 0x10c, 21
	.word	0x91a01910	! t1_kref+0x27bc:   	fitod	%f16, %f8
	.word	0xd8b0a01e	! t1_kref+0x27c0:   	stha	%o4, [%g2 + 0x1e]%asi
	.word	0xa9a64927	! t1_kref+0x27c4:   	fmuls	%f25, %f7, %f20
	.word	0x8db64faf	! t1_kref+0x27c8:   	fors	%f25, %f15, %f6
	.word	0xd8ce501a	! t1_kref+0x27cc:   	ldsba	[%i1 + %i2]0x80, %o4
	.word	0xd890a03c	! t1_kref+0x27d0:   	lduha	[%g2 + 0x3c]%asi, %o4
	.word	0xea2e7fe2	! t1_kref+0x27d4:   	stb	%l5, [%i1 - 0x1e]
	.word	0x9de3bfa0	! t1_kref+0x27d8:   	save	%sp, -0x60, %sp
	.word	0x99eefac4	! t1_kref+0x27dc:   	restore	%i3, -0x53c, %o4
	.word	0x99418000	! t1_kref+0x27e0:   	mov	%fprs, %o4
	.word	0xe6b0a036	! t1_kref+0x27e4:   	stha	%l3, [%g2 + 0x36]%asi
	.word	0xb1a48933	! t1_kref+0x27e8:   	fmuls	%f18, %f19, %f24
	.word	0x3b800004	! t1_kref+0x27ec:   	fble,a	_kref+0x27fc
	.word	0x98650008	! t1_kref+0x27f0:   	subc	%l4, %o0, %o4
	.word	0xa3a01a28	! t1_kref+0x27f4:   	fstoi	%f8, %f17
	.word	0x98a4c015	! t1_kref+0x27f8:   	subcc	%l3, %l5, %o4
	.word	0x9816c013	! t1_kref+0x27fc:   	or	%i3, %l3, %o4
	.word	0x8143e040	! t1_kref+0x2800:   	membar	0x40
	.word	0xd840a004	! t1_kref+0x2804:   	ldsw	[%g2 + 4], %o4
	.word	0x98654016	! t1_kref+0x2808:   	subc	%l5, %l6, %o4
	.word	0xe6a0a024	! t1_kref+0x280c:   	sta	%l3, [%g2 + 0x24]%asi
	.word	0xe9380018	! t1_kref+0x2810:   	std	%f20, [%g0 + %i0]
	.word	0x98b46157	! t1_kref+0x2814:   	orncc	%l1, 0x157, %o4
	.word	0xd8ee9019	! t1_kref+0x2818:   	ldstuba	[%i2 + %i1]0x80, %o4
	.word	0xf6a0a01c	! t1_kref+0x281c:   	sta	%i3, [%g2 + 0x1c]%asi
	.word	0xc91fbd40	! t1_kref+0x2820:   	ldd	[%fp - 0x2c0], %f4
	.word	0x81a90ad0	! t1_kref+0x2824:   	fcmped	%fcc0, %f4, %f16
	.word	0xd816600a	! t1_kref+0x2828:   	lduh	[%i1 + 0xa], %o4
	.word	0xd8167ff0	! t1_kref+0x282c:   	lduh	[%i1 - 0x10], %o4
	.word	0x81aa0ad8	! t1_kref+0x2830:   	fcmped	%fcc0, %f8, %f24
	.word	0x98f467e4	! t1_kref+0x2834:   	udivcc	%l1, 0x7e4, %o4
	.word	0x98650009	! t1_kref+0x2838:   	subc	%l4, %o1, %o4
	.word	0xedee101d	! t1_kref+0x283c:   	prefetcha	%i0 + %i5, 22
	.word	0x98fcc012	! t1_kref+0x2840:   	sdivcc	%l3, %l2, %o4
	.word	0x98bd2a9e	! t1_kref+0x2844:   	xnorcc	%l4, 0xa9e, %o4
	.word	0xeba67ff4	! t1_kref+0x2848:   	sta	%f21, [%i1 - 0xc]%asi
	.word	0xc9981019	! t1_kref+0x284c:   	ldda	[%g0 + %i1]0x80, %f4
	.word	0x989b0008	! t1_kref+0x2850:   	xorcc	%o4, %o0, %o4
	.word	0x99b20114	! t1_kref+0x2854:   	edge32	%o0, %l4, %o4
	.word	0xd87f0019	! t1_kref+0x2858:   	swap	[%i4 + %i1], %o4
	.word	0xb3a01a35	! t1_kref+0x285c:   	fstoi	%f21, %f25
	.word	0xaba44930	! t1_kref+0x2860:   	fmuls	%f17, %f16, %f21
	.word	0x25480001	! t1_kref+0x2864:   	fblg,a,pt	%fcc0, _kref+0x2868
	.word	0x99b50488	! t1_kref+0x2868:   	fcmple32	%f20, %f8, %o4
	.word	0xf430a034	! t1_kref+0x286c:   	sth	%i2, [%g2 + 0x34]
	.word	0xa1a6482f	! t1_kref+0x2870:   	fadds	%f25, %f15, %f16
	.word	0x97a00523	! t1_kref+0x2874:   	fsqrts	%f3, %f11
	.word	0xadb10ee8	! t1_kref+0x2878:   	fornot2s	%f4, %f8, %f22
	.word	0x8db60a8a	! t1_kref+0x287c:   	fpsub16	%f24, %f10, %f6
	.word	0x99b68240	! t1_kref+0x2880:   	array16	%i2, %g0, %o4
	.word	0x2c480002	! t1_kref+0x2884:   	bneg,a,pt	%icc, _kref+0x288c
	.word	0xd67e4000	! t1_kref+0x2888:   	swap	[%i1], %o3
	.word	0x98a6c00d	! t1_kref+0x288c:   	subcc	%i3, %o5, %o4
	.word	0xe07e7ff0	! t1_kref+0x2890:   	swap	[%i1 - 0x10], %l0
	call	1f
	.empty
	.word	0xd8070019	! t1_kref+0x2898:   	ld	[%i4 + %i1], %o4
	.word	0xe1e8a044	! t1_kref+0x289c:   	prefetcha	%g2 + 0x44, 16
	.word	0x23800001	! t1_kref+0x28a0:   	fbne,a	_kref+0x28a4
	.word	0xf207bfe0	! t1_kref+0x28a4:   	ld	[%fp - 0x20], %i1
1:	.word	0x98baec7a	! t1_kref+0x28a8:   	xnorcc	%o3, 0xc7a, %o4
	.word	0xe03e0000	! t1_kref+0x28ac:   	std	%l0, [%i0]
	.word	0xeeb0a034	! t1_kref+0x28b0:   	stha	%l7, [%g2 + 0x34]%asi
	.word	0x98e2a640	! t1_kref+0x28b4:   	subccc	%o2, 0x640, %o4
	.word	0x9864c00a	! t1_kref+0x28b8:   	subc	%l3, %o2, %o4
	.word	0x81ad8a37	! t1_kref+0x28bc:   	fcmps	%fcc0, %f22, %f23
	.word	0x31480001	! t1_kref+0x28c0:   	fba,a,pt	%fcc0, _kref+0x28c4
	.word	0x98426721	! t1_kref+0x28c4:   	addc	%o1, 0x721, %o4
	.word	0x8143e040	! t1_kref+0x28c8:   	membar	0x40
	.word	0x97a01886	! t1_kref+0x28cc:   	fitos	%f6, %f11
	.word	0xd8c63ff4	! t1_kref+0x28d0:   	ldswa	[%i0 - 0xc]%asi, %o4
	.word	0xef20a03c	! t1_kref+0x28d4:   	st	%f23, [%g2 + 0x3c]
	.word	0x8ba01a50	! t1_kref+0x28d8:   	fdtoi	%f16, %f5
	.word	0xda7e001c	! t1_kref+0x28dc:   	swap	[%i0 + %i4], %o5
	.word	0x9816c009	! t1_kref+0x28e0:   	or	%i3, %o1, %o4
	.word	0x99b58586	! t1_kref+0x28e4:   	fcmpgt32	%f22, %f6, %o4
	.word	0x95b38969	! t1_kref+0x28e8:   	fpmerge	%f14, %f9, %f10
	.word	0x8143e040	! t1_kref+0x28ec:   	membar	0x40
	.word	0x99b104ca	! t1_kref+0x28f0:   	fcmpne32	%f4, %f10, %o4
	.word	0xada0054c	! t1_kref+0x28f4:   	fsqrtd	%f12, %f22
	.word	0x98f4c015	! t1_kref+0x28f8:   	udivcc	%l3, %l5, %o4
	.word	0xd2363fe2	! t1_kref+0x28fc:   	sth	%o1, [%i0 - 0x1e]
	.word	0xede8a00a	! t1_kref+0x2900:   	prefetcha	%g2 + 0xa, 22
	.word	0xd8c0a00c	! t1_kref+0x2904:   	ldswa	[%g2 + 0xc]%asi, %o4
	.word	0x993ac008	! t1_kref+0x2908:   	sra	%o3, %o0, %o4
	.word	0xeea0a014	! t1_kref+0x290c:   	sta	%l7, [%g2 + 0x14]%asi
	.word	0x99a088d8	! t1_kref+0x2910:   	fsubd	%f2, %f24, %f12
	.word	0xa5b18e44	! t1_kref+0x2914:   	fxnor	%f6, %f4, %f18
	.word	0x3d800001	! t1_kref+0x2918:   	fbule,a	_kref+0x291c
	.word	0x99a0188a	! t1_kref+0x291c:   	fitos	%f10, %f12
	.word	0x8182c000	! t1_kref+0x2920:   	wr	%o3, %g0, %y
	.word	0x8143c000	! t1_kref+0x2924:   	stbar
	.word	0xdd3e3ff8	! t1_kref+0x2928:   	std	%f14, [%i0 - 8]
	.word	0x9ba4092f	! t1_kref+0x292c:   	fmuls	%f16, %f15, %f13
	.word	0xd43e001d	! t1_kref+0x2930:   	std	%o2, [%i0 + %i5]
	.word	0x993a4009	! t1_kref+0x2934:   	sra	%o1, %o1, %o4
	.word	0x85a0192b	! t1_kref+0x2938:   	fstod	%f11, %f2
	.word	0x993f200c	! t1_kref+0x293c:   	sra	%i4, 0xc, %o4
	.word	0x98c3000d	! t1_kref+0x2940:   	addccc	%o4, %o5, %o4
	.word	0x980736c7	! t1_kref+0x2944:   	add	%i4, -0x939, %o4
	.word	0xe8362016	! t1_kref+0x2948:   	sth	%l4, [%i0 + 0x16]
	.word	0x91a0053a	! t1_kref+0x294c:   	fsqrts	%f26, %f8
	.word	0xf1a0a01c	! t1_kref+0x2950:   	sta	%f24, [%g2 + 0x1c]%asi
	.word	0xf8a0a014	! t1_kref+0x2954:   	sta	%i4, [%g2 + 0x14]%asi
	.word	0x8143c000	! t1_kref+0x2958:   	stbar
	.word	0x81820000	! t1_kref+0x295c:   	wr	%o0, %g0, %y
	.word	0xa7a20937	! t1_kref+0x2960:   	fmuls	%f8, %f23, %f19
	.word	0x992ea010	! t1_kref+0x2964:   	sll	%i2, 0x10, %o4
	.word	0x37800004	! t1_kref+0x2968:   	fbge,a	_kref+0x2978
	.word	0xada0054c	! t1_kref+0x296c:   	fsqrtd	%f12, %f22
	.word	0xafa0052e	! t1_kref+0x2970:   	fsqrts	%f14, %f23
	.word	0x98a02020	! t1_kref+0x2974:   	subcc	%g0, 0x20, %o4
	.word	0xd0a0a024	! t1_kref+0x2978:   	sta	%o0, [%g2 + 0x24]%asi
	.word	0xa9c06c7a	! t1_kref+0x297c:   	jmpl	%g1 + 0xc7a, %l4
	.word	0xa5a01926	! t1_kref+0x2980:   	fstod	%f6, %f18
	.word	0x98fef7df	! t1_kref+0x2984:   	sdivcc	%i3, -0x821, %o4
	.word	0x98e24000	! t1_kref+0x2988:   	subccc	%o1, %g0, %o4
	.word	0xd8562018	! t1_kref+0x298c:   	ldsh	[%i0 + 0x18], %o4
	.word	0xb3a189b8	! t1_kref+0x2990:   	fdivs	%f6, %f24, %f25
	.word	0x9940c000	! t1_kref+0x2994:   	mov	%asi, %o4
	.word	0x8fa01a30	! t1_kref+0x2998:   	fstoi	%f16, %f7
	.word	0xe91f4019	! t1_kref+0x299c:   	ldd	[%i5 + %i1], %f20
	.word	0x3f480002	! t1_kref+0x29a0:   	fbo,a,pt	%fcc0, _kref+0x29a8
	.word	0x99b6803c	! t1_kref+0x29a4:   	edge8n	%i2, %i4, %o4
	.word	0xe980a01c	! t1_kref+0x29a8:   	lda	[%g2 + 0x1c]%asi, %f20
	.word	0xd6b0a026	! t1_kref+0x29ac:   	stha	%o3, [%g2 + 0x26]%asi
	.word	0xc807bfe4	! t1_kref+0x29b0:   	ld	[%fp - 0x1c], %g4
	.word	0xf830a026	! t1_kref+0x29b4:   	sth	%i4, [%g2 + 0x26]
	.word	0x99b18498	! t1_kref+0x29b8:   	fcmple32	%f6, %f24, %o4
	.word	0xa1a0104e	! t1_kref+0x29bc:   	fdtox	%f14, %f16
	.word	0x9805b501	! t1_kref+0x29c0:   	add	%l6, -0xaff, %o4
	.word	0x9da0002f	! t1_kref+0x29c4:   	fmovs	%f15, %f14
	.word	0x99b50f84	! t1_kref+0x29c8:   	for	%f20, %f4, %f12
	.word	0xb1a00529	! t1_kref+0x29cc:   	fsqrts	%f9, %f24
	.word	0x81580000	! t1_kref+0x29d0:   	flushw
	.word	0x98dc4013	! t1_kref+0x29d4:   	smulcc	%l1, %l3, %o4
	.word	0xf6200018	! t1_kref+0x29d8:   	st	%i3, [%g0 + %i0]
	.word	0x9865c014	! t1_kref+0x29dc:   	subc	%l7, %l4, %o4
	.word	0xcd80a004	! t1_kref+0x29e0:   	lda	[%g2 + 4]%asi, %f6
	.word	0xc7e8a006	! t1_kref+0x29e4:   	prefetcha	%g2 + 6, 3
	.word	0xd8567fea	! t1_kref+0x29e8:   	ldsh	[%i1 - 0x16], %o4
	.word	0xd80e7ff3	! t1_kref+0x29ec:   	ldub	[%i1 - 0xd], %o4
	sethi	%hi(2f), %o7
	.word	0xe40be23c	! t1_kref+0x29f4:   	ldub	[%o7 + 0x23c], %l2
	.word	0xa41ca00c	! t1_kref+0x29f8:   	xor	%l2, 0xc, %l2
	.word	0xe42be23c	! t1_kref+0x29fc:   	stb	%l2, [%o7 + 0x23c]
	.word	0x81dbe23c	! t1_kref+0x2a00:   	flush	%o7 + 0x23c
	.word	0x8ba54831	! t1_kref+0x2a04:   	fadds	%f21, %f17, %f5
	.word	0x98aa4014	! t1_kref+0x2a08:   	andncc	%o1, %l4, %o4
	.word	0x9926c01c	! t1_kref+0x2a0c:   	mulscc	%i3, %i4, %o4
	.word	0x9894643c	! t1_kref+0x2a10:   	orcc	%l1, 0x43c, %o4
	.word	0x81a98aa3	! t1_kref+0x2a14:   	fcmpes	%fcc0, %f6, %f3
	.word	0x89a01a26	! t1_kref+0x2a18:   	fstoi	%f6, %f4
	.word	0x98bd401b	! t1_kref+0x2a1c:   	xnorcc	%l5, %i3, %o4
	.word	0xd888a016	! t1_kref+0x2a20:   	lduba	[%g2 + 0x16]%asi, %o4
	.word	0x99b68134	! t1_kref+0x2a24:   	edge32n	%i2, %l4, %o4
	.word	0xe47e4000	! t1_kref+0x2a28:   	swap	[%i1], %l2
	.word	0x9854801a	! t1_kref+0x2a2c:   	umul	%l2, %i2, %o4
	.word	0xc368a0cf	! t1_kref+0x2a30:   	prefetch	%g2 + 0xcf, 1
	.word	0xc91fbdf0	! t1_kref+0x2a34:   	ldd	[%fp - 0x210], %f4
	.word	0xd856401b	! t1_kref+0x2a38:   	ldsh	[%i1 + %i3], %o4
2:	.word	0xd6a8a01c	! t1_kref+0x2a3c:   	stba	%o3, [%g2 + 0x1c]%asi
	.word	0x9db10a69	! t1_kref+0x2a40:   	fpadd32s	%f4, %f9, %f14
	.word	0x988738ef	! t1_kref+0x2a44:   	addcc	%i4, -0x711, %o4
	.word	0x98a338f9	! t1_kref+0x2a48:   	subcc	%o4, -0x707, %o4
	.word	0x98ba3686	! t1_kref+0x2a4c:   	xnorcc	%o0, -0x97a, %o4
	.word	0x9885ad89	! t1_kref+0x2a50:   	addcc	%l6, 0xd89, %o4
	.word	0x9844e846	! t1_kref+0x2a54:   	addc	%l3, 0x846, %o4
	.word	0x25480001	! t1_kref+0x2a58:   	fblg,a,pt	%fcc0, _kref+0x2a5c
	.word	0xfbee101c	! t1_kref+0x2a5c:   	prefetcha	%i0 + %i4, 29
	.word	0x99400000	! t1_kref+0x2a60:   	mov	%y, %o4
	.word	0xa1a018cc	! t1_kref+0x2a64:   	fdtos	%f12, %f16
	.word	0x81800000	! t1_kref+0x2a68:   	mov	%g0, %y
	.word	0x2d480001	! t1_kref+0x2a6c:   	fbg,a,pt	%fcc0, _kref+0x2a70
	.word	0xea7f0019	! t1_kref+0x2a70:   	swap	[%i4 + %i1], %l5
	.word	0xadb30f98	! t1_kref+0x2a74:   	for	%f12, %f24, %f22
	.word	0x9da018c6	! t1_kref+0x2a78:   	fdtos	%f6, %f14
	.word	0x9832eba9	! t1_kref+0x2a7c:   	orn	%o3, 0xba9, %o4
	.word	0xd8d0a03c	! t1_kref+0x2a80:   	ldsha	[%g2 + 0x3c]%asi, %o4
	.word	0xd03e001d	! t1_kref+0x2a84:   	std	%o0, [%i0 + %i5]
	.word	0x992f0013	! t1_kref+0x2a88:   	sll	%i4, %l3, %o4
	.word	0x99408000	! t1_kref+0x2a8c:   	mov	%ccr, %o4
	.word	0xc0b0a02c	! t1_kref+0x2a90:   	stha	%g0, [%g2 + 0x2c]%asi
	.word	0x98bdfcbd	! t1_kref+0x2a94:   	xnorcc	%l7, -0x343, %o4
	.word	0xc0fe101c	! t1_kref+0x2a98:   	swapa	[%i0 + %i4]0x80, %g0
	.word	0xd236600a	! t1_kref+0x2a9c:   	sth	%o1, [%i1 + 0xa]
	.word	0x983a6591	! t1_kref+0x2aa0:   	xnor	%o1, 0x591, %o4
	.word	0xeea0a03c	! t1_kref+0x2aa4:   	sta	%l7, [%g2 + 0x3c]%asi
	.word	0x29480003	! t1_kref+0x2aa8:   	fbl,a,pt	%fcc0, _kref+0x2ab4
	.word	0x98020008	! t1_kref+0x2aac:   	add	%o0, %o0, %o4
	.word	0xc0266008	! t1_kref+0x2ab0:   	clr	[%i1 + 8]
	.word	0xe2b0a004	! t1_kref+0x2ab4:   	stha	%l1, [%g2 + 4]%asi
	.word	0x98637b58	! t1_kref+0x2ab8:   	subc	%o5, -0x4a8, %o4
	.word	0x98144012	! t1_kref+0x2abc:   	or	%l1, %l2, %o4
	.word	0xe4b0a006	! t1_kref+0x2ac0:   	stha	%l2, [%g2 + 6]%asi
	.word	0xd856601e	! t1_kref+0x2ac4:   	ldsh	[%i1 + 0x1e], %o4
	.word	0xa1a01931	! t1_kref+0x2ac8:   	fstod	%f17, %f16
	.word	0x81ac0a2a	! t1_kref+0x2acc:   	fcmps	%fcc0, %f16, %f10
	.word	0xeaa8a00f	! t1_kref+0x2ad0:   	stba	%l5, [%g2 + 0xf]%asi
	.word	0x98656c1a	! t1_kref+0x2ad4:   	subc	%l5, 0xc1a, %o4
	.word	0x99b20240	! t1_kref+0x2ad8:   	array16	%o0, %g0, %o4
	.word	0x87a00031	! t1_kref+0x2adc:   	fmovs	%f17, %f3
	.word	0x98e54009	! t1_kref+0x2ae0:   	subccc	%l5, %o1, %o4
	.word	0x98fe800b	! t1_kref+0x2ae4:   	sdivcc	%i2, %o3, %o4
	.word	0x81a88a4e	! t1_kref+0x2ae8:   	fcmpd	%fcc0, %f2, %f14
	.word	0x878020d0	! t1_kref+0x2aec:   	mov	0xd0, %asi
	.word	0x8185c000	! t1_kref+0x2af0:   	wr	%l7, %g0, %y
	.word	0x3d800008	! t1_kref+0x2af4:   	fbule,a	_kref+0x2b14
	.word	0x81858000	! t1_kref+0x2af8:   	wr	%l6, %g0, %y
	.word	0xc5180019	! t1_kref+0x2afc:   	ldd	[%g0 + %i1], %f2
	.word	0x89b007b4	! t1_kref+0x2b00:   	fpackfix	%f20, %f4
	.word	0x98fd0016	! t1_kref+0x2b04:   	sdivcc	%l4, %l6, %o4
	.word	0x9922af14	! t1_kref+0x2b08:   	mulscc	%o2, 0xf14, %o4
	.word	0x9854b4f2	! t1_kref+0x2b0c:   	umul	%l2, -0xb0e, %o4
	.word	0xd800a004	! t1_kref+0x2b10:   	ld	[%g2 + 4], %o4
	.word	0x98a24016	! t1_kref+0x2b14:   	subcc	%o1, %l6, %o4
	.word	0xee7e200c	! t1_kref+0x2b18:   	swap	[%i0 + 0xc], %l7
	.word	0x9842f9f3	! t1_kref+0x2b1c:   	addc	%o3, -0x60d, %o4
	.word	0x8fa01a46	! t1_kref+0x2b20:   	fdtoi	%f6, %f7
	.word	0xd808a007	! t1_kref+0x2b24:   	ldub	[%g2 + 7], %o4
	.word	0x8db18dd0	! t1_kref+0x2b28:   	fnand	%f6, %f16, %f6
	.word	0x81ad8aa8	! t1_kref+0x2b2c:   	fcmpes	%fcc0, %f22, %f8
	.word	0x91a00550	! t1_kref+0x2b30:   	fsqrtd	%f16, %f8
	.word	0xd810a01e	! t1_kref+0x2b34:   	lduh	[%g2 + 0x1e], %o4
	.word	0xb3a0012b	! t1_kref+0x2b38:   	fabss	%f11, %f25
	.word	0x98c5c00b	! t1_kref+0x2b3c:   	addccc	%l7, %o3, %o4
	.word	0xd840a01c	! t1_kref+0x2b40:   	ldsw	[%g2 + 0x1c], %o4
	.word	0xfdee501a	! t1_kref+0x2b44:   	prefetcha	%i1 + %i2, 30
	.word	0x81ad8a28	! t1_kref+0x2b48:   	fcmps	%fcc0, %f22, %f8
	.word	0x98a5c012	! t1_kref+0x2b4c:   	subcc	%l7, %l2, %o4
	.word	0x98dd4009	! t1_kref+0x2b50:   	smulcc	%l5, %o1, %o4
	.word	0xa9a408b4	! t1_kref+0x2b54:   	fsubs	%f16, %f20, %f20
	call	SYM(t1_subr2)
	.word	0x8bb58fb6	! t1_kref+0x2b5c:   	fors	%f22, %f22, %f5
	.word	0x983d3259	! t1_kref+0x2b60:   	xnor	%l4, -0xda7, %o4
	.word	0x8143e040	! t1_kref+0x2b64:   	membar	0x40
	.word	0x9da01028	! t1_kref+0x2b68:   	fstox	%f8, %f14
	.word	0x9804c00b	! t1_kref+0x2b6c:   	add	%l3, %o3, %o4
	.word	0x99418000	! t1_kref+0x2b70:   	mov	%fprs, %o4
	.word	0x981721d7	! t1_kref+0x2b74:   	or	%i4, 0x1d7, %o4
	.word	0xd8470018	! t1_kref+0x2b78:   	ldsw	[%i4 + %i0], %o4
	.word	0xa1b00c00	! t1_kref+0x2b7c:   	fzero	%f16
	.word	0x27800003	! t1_kref+0x2b80:   	fbul,a	_kref+0x2b8c
	.word	0x988722fd	! t1_kref+0x2b84:   	addcc	%i4, 0x2fd, %o4
	.word	0x9842c008	! t1_kref+0x2b88:   	addc	%o3, %o0, %o4
	.word	0x99400000	! t1_kref+0x2b8c:   	mov	%y, %o4
	.word	0x27480001	! t1_kref+0x2b90:   	fbul,a,pt	%fcc0, _kref+0x2b94
	.word	0xb3a00137	! t1_kref+0x2b94:   	fabss	%f23, %f25
	.word	0x8143c000	! t1_kref+0x2b98:   	stbar
	.word	0xada18846	! t1_kref+0x2b9c:   	faddd	%f6, %f6, %f22
	.word	0xa3a00030	! t1_kref+0x2ba0:   	fmovs	%f16, %f17
	.word	0xc07e3fe0	! t1_kref+0x2ba4:   	swap	[%i0 - 0x20], %g0
	.word	0x8db1890c	! t1_kref+0x2ba8:   	faligndata	%f6, %f12, %f6
	.word	0x89a01a2a	! t1_kref+0x2bac:   	fstoi	%f10, %f4
	.word	0x89a00546	! t1_kref+0x2bb0:   	fsqrtd	%f6, %f4
	.word	0xd850a00e	! t1_kref+0x2bb4:   	ldsh	[%g2 + 0xe], %o4
	.word	0xd850a00e	! t1_kref+0x2bb8:   	ldsh	[%g2 + 0xe], %o4
	.word	0x99400000	! t1_kref+0x2bbc:   	mov	%y, %o4
	.word	0x3e480002	! t1_kref+0x2bc0:   	bvc,a,pt	%icc, _kref+0x2bc8
	.word	0x989c4012	! t1_kref+0x2bc4:   	xorcc	%l1, %l2, %o4
	.word	0x98ada32e	! t1_kref+0x2bc8:   	andncc	%l6, 0x32e, %o4
	.word	0x81820000	! t1_kref+0x2bcc:   	wr	%o0, %g0, %y
	.word	0xed00a01c	! t1_kref+0x2bd0:   	ld	[%g2 + 0x1c], %f22
	.word	0xafa00538	! t1_kref+0x2bd4:   	fsqrts	%f24, %f23
	.word	0x99b5c333	! t1_kref+0x2bd8:   	bmask	%l7, %l3, %o4
	.word	0x9da10856	! t1_kref+0x2bdc:   	faddd	%f4, %f22, %f14
	.word	0xb5a000b0	! t1_kref+0x2be0:   	fnegs	%f16, %f26
	.word	0x8fa018c6	! t1_kref+0x2be4:   	fdtos	%f6, %f7
	.word	0x98500012	! t1_kref+0x2be8:   	umul	%g0, %l2, %o4
	.word	0x81aa0a2c	! t1_kref+0x2bec:   	fcmps	%fcc0, %f8, %f12
	.word	0x81df0015	! t1_kref+0x2bf0:   	flush	%i4 + %l5
	.word	0x81580000	! t1_kref+0x2bf4:   	flushw
	.word	0x98ddb19e	! t1_kref+0x2bf8:   	smulcc	%l6, -0xe62, %o4
	.word	0x989f0013	! t1_kref+0x2bfc:   	xorcc	%i4, %l3, %o4
	.word	0xdb865000	! t1_kref+0x2c00:   	lda	[%i1]0x80, %f13
	.word	0xd80e4000	! t1_kref+0x2c04:   	ldub	[%i1], %o4
	.word	0xef00a01c	! t1_kref+0x2c08:   	ld	[%g2 + 0x1c], %f23
	.word	0x25480007	! t1_kref+0x2c0c:   	fblg,a,pt	%fcc0, _kref+0x2c28
	.word	0x9814c017	! t1_kref+0x2c10:   	or	%l3, %l7, %o4
	.word	0x35800001	! t1_kref+0x2c14:   	fbue,a	_kref+0x2c18
	.word	0xb1a10858	! t1_kref+0x2c18:   	faddd	%f4, %f24, %f24
	.word	0xb5a00550	! t1_kref+0x2c1c:   	fsqrtd	%f16, %f26
	.word	0x993dc01a	! t1_kref+0x2c20:   	sra	%l7, %i2, %o4
	.word	0x9ba0052b	! t1_kref+0x2c24:   	fsqrts	%f11, %f13
	.word	0xada01a34	! t1_kref+0x2c28:   	fstoi	%f20, %f22
	.word	0x9834ee54	! t1_kref+0x2c2c:   	orn	%l3, 0xe54, %o4
	.word	0xa3a5492a	! t1_kref+0x2c30:   	fmuls	%f21, %f10, %f17
	.word	0x81aa8ac8	! t1_kref+0x2c34:   	fcmped	%fcc0, %f10, %f8
	.word	0xcf20a00c	! t1_kref+0x2c38:   	st	%f7, [%g2 + 0xc]
	.word	0x81aa8ace	! t1_kref+0x2c3c:   	fcmped	%fcc0, %f10, %f14
	.word	0x89a01a2f	! t1_kref+0x2c40:   	fstoi	%f15, %f4
	.word	0xada50924	! t1_kref+0x2c44:   	fmuls	%f20, %f4, %f22
	.word	0x9da00546	! t1_kref+0x2c48:   	fsqrtd	%f6, %f14
	.word	0x99b00029	! t1_kref+0x2c4c:   	edge8n	%g0, %o1, %o4
	.word	0xeb68a10a	! t1_kref+0x2c50:   	prefetch	%g2 + 0x10a, 21
	.word	0xa7a00534	! t1_kref+0x2c54:   	fsqrts	%f20, %f19
	.word	0xb1a00544	! t1_kref+0x2c58:   	fsqrtd	%f4, %f24
	.word	0x993a2005	! t1_kref+0x2c5c:   	sra	%o0, 0x5, %o4
	.word	0x93b2ca6a	! t1_kref+0x2c60:   	fpadd32s	%f11, %f10, %f9
	.word	0x9806ef57	! t1_kref+0x2c64:   	add	%i3, 0xf57, %o4
	.word	0x982b3a55	! t1_kref+0x2c68:   	andn	%o4, -0x5ab, %o4
	.word	0xaba249ad	! t1_kref+0x2c6c:   	fdivs	%f9, %f13, %f21
	.word	0x8db00fc0	! t1_kref+0x2c70:   	fone	%f6
	.word	0x993a0008	! t1_kref+0x2c74:   	sra	%o0, %o0, %o4
	.word	0x98fb2778	! t1_kref+0x2c78:   	sdivcc	%o4, 0x778, %o4
	.word	0xcd180018	! t1_kref+0x2c7c:   	ldd	[%g0 + %i0], %f6
	.word	0x99a01a36	! t1_kref+0x2c80:   	fstoi	%f22, %f12
	call	SYM(t1_subr0)
	.word	0xd8c01018	! t1_kref+0x2c88:   	ldswa	[%g0 + %i0]0x80, %o4
	.word	0x99b30132	! t1_kref+0x2c8c:   	edge32n	%o4, %l2, %o4
	.word	0x983a4015	! t1_kref+0x2c90:   	xnor	%o1, %l5, %o4
	.word	0x9fa489a9	! t1_kref+0x2c94:   	fdivs	%f18, %f9, %f15
	.word	0x31480007	! t1_kref+0x2c98:   	fba,a,pt	%fcc0, _kref+0x2cb4
	.word	0x99b000da	! t1_kref+0x2c9c:   	edge16l	%g0, %i2, %o4
	.word	0xa1a0052c	! t1_kref+0x2ca0:   	fsqrts	%f12, %f16
	.word	0x99b5c240	! t1_kref+0x2ca4:   	array16	%l7, %g0, %o4
	.word	0x97a5083a	! t1_kref+0x2ca8:   	fadds	%f20, %f26, %f11
	.word	0xa3a24823	! t1_kref+0x2cac:   	fadds	%f9, %f3, %f17
	.word	0xafa018ca	! t1_kref+0x2cb0:   	fdtos	%f10, %f23
	.word	0x91a00550	! t1_kref+0x2cb4:   	fsqrtd	%f16, %f8
	.word	0xd8801019	! t1_kref+0x2cb8:   	lda	[%g0 + %i1]0x80, %o4
	.word	0x27480008	! t1_kref+0x2cbc:   	fbul,a,pt	%fcc0, _kref+0x2cdc
	.word	0xd80e4000	! t1_kref+0x2cc0:   	ldub	[%i1], %o4
	.word	0xc168a103	! t1_kref+0x2cc4:   	prefetch	%g2 + 0x103, 0
	.word	0x99a0054a	! t1_kref+0x2cc8:   	fsqrtd	%f10, %f12
	.word	0x993c6004	! t1_kref+0x2ccc:   	sra	%l1, 0x4, %o4
	.word	0xe2367ff6	! t1_kref+0x2cd0:   	sth	%l1, [%i1 - 0xa]
	.word	0xcd3e4000	! t1_kref+0x2cd4:   	std	%f6, [%i1]
	.word	0xafa309af	! t1_kref+0x2cd8:   	fdivs	%f12, %f15, %f23
	.word	0x2a800002	! t1_kref+0x2cdc:   	bcs,a	_kref+0x2ce4
	.word	0x9db54a75	! t1_kref+0x2ce0:   	fpadd32s	%f21, %f21, %f14
	.word	0xeb68a0c5	! t1_kref+0x2ce4:   	prefetch	%g2 + 0xc5, 21
	.word	0x8143e020	! t1_kref+0x2ce8:   	membar	0x20
	.word	0x89b40d12	! t1_kref+0x2cec:   	fandnot1	%f16, %f18, %f4
	.word	0xd228a017	! t1_kref+0x2cf0:   	stb	%o1, [%g2 + 0x17]
	.word	0x9925e7e5	! t1_kref+0x2cf4:   	mulscc	%l7, 0x7e5, %o4
	.word	0xa1a00544	! t1_kref+0x2cf8:   	fsqrtd	%f4, %f16
	.word	0xe830a026	! t1_kref+0x2cfc:   	sth	%l4, [%g2 + 0x26]
	.word	0x81ad8a44	! t1_kref+0x2d00:   	fcmpd	%fcc0, %f22, %f4
	.word	0x98d80016	! t1_kref+0x2d04:   	smulcc	%g0, %l6, %o4
	.word	0xa5a01a24	! t1_kref+0x2d08:   	fstoi	%f4, %f18
	.word	0xaba01a52	! t1_kref+0x2d0c:   	fdtoi	%f18, %f21
	.word	0xd8167ff4	! t1_kref+0x2d10:   	lduh	[%i1 - 0xc], %o4
	.word	0x98e6b043	! t1_kref+0x2d14:   	subccc	%i2, -0xfbd, %o4
	.word	0x99a0192b	! t1_kref+0x2d18:   	fstod	%f11, %f12
	.word	0xec20a02c	! t1_kref+0x2d1c:   	st	%l6, [%g2 + 0x2c]
	.word	0x9fc10000	! t1_kref+0x2d20:   	call	%g4
	.word	0x85a00554	! t1_kref+0x2d24:   	fsqrtd	%f20, %f2
	.word	0xef20a034	! t1_kref+0x2d28:   	st	%f23, [%g2 + 0x34]
	.word	0xd850a026	! t1_kref+0x2d2c:   	ldsh	[%g2 + 0x26], %o4
	.word	0x98fcbf78	! t1_kref+0x2d30:   	sdivcc	%l2, -0x88, %o4
	.word	0xa9a00544	! t1_kref+0x2d34:   	fsqrtd	%f4, %f20
!	.word	0x294a0cb2	! t1_kref+0x2d38:   	fbl,a,pt	%fcc0, SYM(t1_subr3)
	   	fbl,a,pt	%fcc0, SYM(t1_subr3)
	.word	0x9f414000	! t1_kref+0x2d3c:   	mov	%pc, %o7
	.word	0xada00531	! t1_kref+0x2d40:   	fsqrts	%f17, %f22
	.word	0xb1a01a2a	! t1_kref+0x2d44:   	fstoi	%f10, %f24
	.word	0xa7b58af3	! t1_kref+0x2d48:   	fpsub32s	%f22, %f19, %f19
	.word	0x99b58133	! t1_kref+0x2d4c:   	edge32n	%l6, %l3, %o4
	.word	0xd80e0000	! t1_kref+0x2d50:   	ldub	[%i0], %o4
	.word	0x8d84400b	! t1_kref+0x2d54:   	wr	%l1, %o3, %fprs
	.word	0xd806001c	! t1_kref+0x2d58:   	ld	[%i0 + %i4], %o4
	.word	0x99408000	! t1_kref+0x2d5c:   	mov	%ccr, %o4
	call	1f
	.empty
	.word	0x99b2c0f3	! t1_kref+0x2d64:   	edge16ln	%o3, %l3, %o4
	.word	0xd8067ffc	! t1_kref+0x2d68:   	ld	[%i1 - 4], %o4
	.word	0xa5b00f0c	! t1_kref+0x2d6c:   	fsrc2	%f12, %f18
	.word	0x98523812	! t1_kref+0x2d70:   	umul	%o0, -0x7ee, %o4
	.word	0x31480004	! t1_kref+0x2d74:   	fba,a,pt	%fcc0, _kref+0x2d84
1:	.word	0xa7b0ce36	! t1_kref+0x2d78:   	fands	%f3, %f22, %f19
	.word	0x99b00f0c	! t1_kref+0x2d7c:   	fsrc2	%f12, %f12
	.word	0x93b00cf0	! t1_kref+0x2d80:   	fnot2s	%f16, %f9
	.word	0x8143c000	! t1_kref+0x2d84:   	stbar
	.word	0x28480003	! t1_kref+0x2d88:   	bleu,a,pt	%icc, _kref+0x2d94
	.word	0x99b40554	! t1_kref+0x2d8c:   	fcmpeq16	%f16, %f20, %o4
	.word	0xd07e3fe8	! t1_kref+0x2d90:   	swap	[%i0 - 0x18], %o0
	.word	0x9842401b	! t1_kref+0x2d94:   	addc	%o1, %i3, %o4
	.word	0xa5a389d6	! t1_kref+0x2d98:   	fdivd	%f14, %f22, %f18
	.word	0xa5a01a48	! t1_kref+0x2d9c:   	fdtoi	%f8, %f18
	.word	0x8db38db4	! t1_kref+0x2da0:   	fxors	%f14, %f20, %f6
	.word	0x81d96561	! t1_kref+0x2da4:   	flush	%g5 + 0x561
	.word	0xf830a004	! t1_kref+0x2da8:   	sth	%i4, [%g2 + 4]
	.word	0x8143e040	! t1_kref+0x2dac:   	membar	0x40
	.word	0xd8060000	! t1_kref+0x2db0:   	ld	[%i0], %o4
	.word	0x81dc4015	! t1_kref+0x2db4:   	flush	%l1 + %l5
	.word	0x9802a1d1	! t1_kref+0x2db8:   	add	%o2, 0x1d1, %o4
	.word	0x81ac8a50	! t1_kref+0x2dbc:   	fcmpd	%fcc0, %f18, %f16
	.word	0x9fa000b5	! t1_kref+0x2dc0:   	fnegs	%f21, %f15
	.word	0x81ab8a26	! t1_kref+0x2dc4:   	fcmps	%fcc0, %f14, %f6
	.word	0xa9b2896f	! t1_kref+0x2dc8:   	fpmerge	%f10, %f15, %f20
	.word	0x81ae0a29	! t1_kref+0x2dcc:   	fcmps	%fcc0, %f24, %f9
	.word	0x992de011	! t1_kref+0x2dd0:   	sll	%l7, 0x11, %o4
	.word	0xe6300018	! t1_kref+0x2dd4:   	sth	%l3, [%g0 + %i0]
	.word	0x99a5892d	! t1_kref+0x2dd8:   	fmuls	%f22, %f13, %f12
	.word	0x85a01913	! t1_kref+0x2ddc:   	fitod	%f19, %f2
	.word	0x989b401a	! t1_kref+0x2de0:   	xorcc	%o5, %i2, %o4
	.word	0xd2fe1000	! t1_kref+0x2de4:   	swapa	[%i0]0x80, %o1
	.word	0xb5a01a4c	! t1_kref+0x2de8:   	fdtoi	%f12, %f26
	.word	0x9961c009	! t1_kref+0x2dec:   	movu	%fcc0, %o1, %o4
	.word	0x81ac8aaf	! t1_kref+0x2df0:   	fcmpes	%fcc0, %f18, %f15
	.word	0xd84e401a	! t1_kref+0x2df4:   	ldsb	[%i1 + %i2], %o4
	.word	0xd8466008	! t1_kref+0x2df8:   	ldsw	[%i1 + 8], %o4
	.word	0xe630a024	! t1_kref+0x2dfc:   	sth	%l3, [%g2 + 0x24]
	.word	0x9db10eea	! t1_kref+0x2e00:   	fornot2s	%f4, %f10, %f14
	.word	0x98dc8009	! t1_kref+0x2e04:   	smulcc	%l2, %o1, %o4
	.word	0xd4ee5000	! t1_kref+0x2e08:   	ldstuba	[%i1]0x80, %o2
	.word	0xe83f4019	! t1_kref+0x2e0c:   	std	%l4, [%i5 + %i1]
	.word	0x98fa801b	! t1_kref+0x2e10:   	sdivcc	%o2, %i3, %o4
	.word	0xa1b40db6	! t1_kref+0x2e14:   	fxors	%f16, %f22, %f16
	.word	0xa1a0052f	! t1_kref+0x2e18:   	fsqrts	%f15, %f16
	.word	0xa1a608ca	! t1_kref+0x2e1c:   	fsubd	%f24, %f10, %f16
	.word	0x980a37df	! t1_kref+0x2e20:   	and	%o0, -0x821, %o4
	call	SYM(t1_subr2)
	.word	0x99b00177	! t1_kref+0x2e28:   	edge32ln	%g0, %l7, %o4
	.word	0x9802800a	! t1_kref+0x2e2c:   	add	%o2, %o2, %o4
	sethi	%hi(2f), %o7
	.word	0xe40be270	! t1_kref+0x2e34:   	ldub	[%o7 + 0x270], %l2
	.word	0xa41ca00c	! t1_kref+0x2e38:   	xor	%l2, 0xc, %l2
	.word	0xe42be270	! t1_kref+0x2e3c:   	stb	%l2, [%o7 + 0x270]
	.word	0x81dbe270	! t1_kref+0x2e40:   	flush	%o7 + 0x270
	.word	0xaba54831	! t1_kref+0x2e44:   	fadds	%f21, %f17, %f21
	.word	0x9882400b	! t1_kref+0x2e48:   	addcc	%o1, %o3, %o4
	.word	0x8db40aa7	! t1_kref+0x2e4c:   	fpsub16s	%f16, %f7, %f6
	.word	0xa5b60a16	! t1_kref+0x2e50:   	fpadd16	%f24, %f22, %f18
	.word	0x98c30014	! t1_kref+0x2e54:   	addccc	%o4, %l4, %o4
	.word	0x98beb013	! t1_kref+0x2e58:   	xnorcc	%i2, -0xfed, %o4
	.word	0xd840a014	! t1_kref+0x2e5c:   	ldsw	[%g2 + 0x14], %o4
	.word	0xe7ee501b	! t1_kref+0x2e60:   	prefetcha	%i1 + %i3, 19
	.word	0x9fc10000	! t1_kref+0x2e64:   	call	%g4
	.word	0x89b506f0	! t1_kref+0x2e68:   	fmul8ulx16	%f20, %f16, %f4
	.word	0x9fc10000	! t1_kref+0x2e6c:   	call	%g4
2:	.word	0xd8080018	! t1_kref+0x2e70:   	ldub	[%g0 + %i0], %o4
	.word	0x35800004	! t1_kref+0x2e74:   	fbue,a	_kref+0x2e84
	.word	0xedee501d	! t1_kref+0x2e78:   	prefetcha	%i1 + %i5, 22
	.word	0xa1b30db4	! t1_kref+0x2e7c:   	fxors	%f12, %f20, %f16
	.word	0x33480003	! t1_kref+0x2e80:   	fbe,a,pt	%fcc0, _kref+0x2e8c
	.word	0xecfe5000	! t1_kref+0x2e84:   	swapa	[%i1]0x80, %l6
	.word	0xee20a03c	! t1_kref+0x2e88:   	st	%l7, [%g2 + 0x3c]
	.word	0xd80e6004	! t1_kref+0x2e8c:   	ldub	[%i1 + 4], %o4
	.word	0xd8871018	! t1_kref+0x2e90:   	lda	[%i4 + %i0]0x80, %o4
	.word	0xa9b40971	! t1_kref+0x2e94:   	fpmerge	%f16, %f17, %f20
	.word	0x81870000	! t1_kref+0x2e98:   	wr	%i4, %g0, %y
	.word	0x81ad8a32	! t1_kref+0x2e9c:   	fcmps	%fcc0, %f22, %f18
	sethi	%hi(2f), %o7
	.word	0xe40be2cc	! t1_kref+0x2ea4:   	ldub	[%o7 + 0x2cc], %l2
	.word	0xa41ca00c	! t1_kref+0x2ea8:   	xor	%l2, 0xc, %l2
	.word	0xe42be2cc	! t1_kref+0x2eac:   	stb	%l2, [%o7 + 0x2cc]
	.word	0x81dbe2cc	! t1_kref+0x2eb0:   	flush	%o7 + 0x2cc
	.word	0x36480005	! t1_kref+0x2eb4:   	bge,a,pt	%icc, _kref+0x2ec8
	.word	0xd8560000	! t1_kref+0x2eb8:   	ldsh	[%i0], %o4
	.word	0xf500a014	! t1_kref+0x2ebc:   	ld	[%g2 + 0x14], %f26
	.word	0x93a00536	! t1_kref+0x2ec0:   	fsqrts	%f22, %f9
	.word	0xd810a006	! t1_kref+0x2ec4:   	lduh	[%g2 + 6], %o4
	.word	0xc720a01c	! t1_kref+0x2ec8:   	st	%f3, [%g2 + 0x1c]
2:	.word	0xe83e3ff0	! t1_kref+0x2ecc:   	std	%l4, [%i0 - 0x10]
	.word	0x9805c011	! t1_kref+0x2ed0:   	add	%l7, %l1, %o4
	.word	0x8fa018ce	! t1_kref+0x2ed4:   	fdtos	%f14, %f7
	.word	0x9805e0f5	! t1_kref+0x2ed8:   	add	%l7, 0xf5, %o4
	.word	0x99252331	! t1_kref+0x2edc:   	mulscc	%l4, 0x331, %o4
	.word	0xe0ff1018	! t1_kref+0x2ee0:   	swapa	[%i4 + %i0]0x80, %l0
	.word	0xa3a01096	! t1_kref+0x2ee4:   	fxtos	%f22, %f17
	.word	0x81ad8a2f	! t1_kref+0x2ee8:   	fcmps	%fcc0, %f22, %f15
	.word	0x981f001b	! t1_kref+0x2eec:   	xor	%i4, %i3, %o4
	.word	0x99203b65	! t1_kref+0x2ef0:   	mulscc	%g0, -0x49b, %o4
	.word	0x81aaca28	! t1_kref+0x2ef4:   	fcmps	%fcc0, %f11, %f8
	.word	0x98428009	! t1_kref+0x2ef8:   	addc	%o2, %o1, %o4
	.word	0x99b285d6	! t1_kref+0x2efc:   	fcmpeq32	%f10, %f22, %o4
	.word	0xd856201c	! t1_kref+0x2f00:   	ldsh	[%i0 + 0x1c], %o4
	.word	0x81a98a31	! t1_kref+0x2f04:   	fcmps	%fcc0, %f6, %f17
	.word	0x878020f0	! t1_kref+0x2f08:   	mov	0xf0, %asi
	.word	0xa7b60fb2	! t1_kref+0x2f0c:   	fors	%f24, %f18, %f19
	.word	0x99b4401b	! t1_kref+0x2f10:   	edge8	%l1, %i3, %o4
	.word	0xe9264000	! t1_kref+0x2f14:   	st	%f20, [%i1]
	.word	0xb3a01891	! t1_kref+0x2f18:   	fitos	%f17, %f25
	.word	0x89a00536	! t1_kref+0x2f1c:   	fsqrts	%f22, %f4
	.word	0x98b30013	! t1_kref+0x2f20:   	orncc	%o4, %l3, %o4
	.word	0xc398a100	! t1_kref+0x2f24:   	ldda	[%g2 + 0x100]%asi, %f32
	.word	0x98db7ee2	! t1_kref+0x2f28:   	smulcc	%o5, -0x11e, %o4
	.word	0xf5ee101a	! t1_kref+0x2f2c:   	prefetcha	%i0 + %i2, 26
	.word	0xd80e8018	! t1_kref+0x2f30:   	ldub	[%i2 + %i0], %o4
	.word	0x81ad0a50	! t1_kref+0x2f34:   	fcmpd	%fcc0, %f20, %f16
	.word	0xcd1fbed0	! t1_kref+0x2f38:   	ldd	[%fp - 0x130], %f6
	.word	0xd1260000	! t1_kref+0x2f3c:   	st	%f8, [%i0]
	.word	0xc368a003	! t1_kref+0x2f40:   	prefetch	%g2 + 3, 1
	.word	0xcf20a014	! t1_kref+0x2f44:   	st	%f7, [%g2 + 0x14]
	.word	0xf868001a	! t1_kref+0x2f48:   	ldstub	[%g0 + %i2], %i4
	call	SYM(t1_subr1)
	.word	0x98a73bce	! t1_kref+0x2f50:   	subcc	%i4, -0x432, %o4
	.word	0x9db58faa	! t1_kref+0x2f54:   	fors	%f22, %f10, %f14
	.word	0x8143c000	! t1_kref+0x2f58:   	stbar
	.word	0xd850a03c	! t1_kref+0x2f5c:   	ldsh	[%g2 + 0x3c], %o4
	.word	0x87a9c02d	! t1_kref+0x2f60:   	fmovsu	%fcc0, %f13, %f3
	.word	0xa9a01a4c	! t1_kref+0x2f64:   	fdtoi	%f12, %f20
	.word	0xebee101d	! t1_kref+0x2f68:   	prefetcha	%i0 + %i5, 21
	.word	0x81a9ca35	! t1_kref+0x2f6c:   	fcmps	%fcc0, %f7, %f21
	.word	0xe47f0019	! t1_kref+0x2f70:   	swap	[%i4 + %i1], %l2
	.word	0xc7ee5012	! t1_kref+0x2f74:   	prefetcha	%i1 + %l2, 3
	.word	0x9922a38b	! t1_kref+0x2f78:   	mulscc	%o2, 0x38b, %o4
	.word	0xe43f4018	! t1_kref+0x2f7c:   	std	%l2, [%i5 + %i0]
	.word	0x81dfb719	! t1_kref+0x2f80:   	flush	%fp - 0x8e7
	.word	0xa7a609a6	! t1_kref+0x2f84:   	fdivs	%f24, %f6, %f19
	.word	0x99b540fa	! t1_kref+0x2f88:   	edge16ln	%l5, %i2, %o4
	.word	0x98d5731d	! t1_kref+0x2f8c:   	umulcc	%l5, -0xce3, %o4
	.word	0xf430a02e	! t1_kref+0x2f90:   	sth	%i2, [%g2 + 0x2e]
	.word	0xe7ee101b	! t1_kref+0x2f94:   	prefetcha	%i0 + %i3, 19
	.word	0xc53e0000	! t1_kref+0x2f98:   	std	%f2, [%i0]
	.word	0xd8fe501c	! t1_kref+0x2f9c:   	swapa	[%i1 + %i4]0x80, %o4
	.word	0xb1a00525	! t1_kref+0x2fa0:   	fsqrts	%f5, %f24
	.word	0x98c47a40	! t1_kref+0x2fa4:   	addccc	%l1, -0x5c0, %o4
	.word	0x99a3892e	! t1_kref+0x2fa8:   	fmuls	%f14, %f14, %f12
	.word	0xf6682c2c	! t1_kref+0x2fac:   	ldstub	[%g0 + 0xc2c], %i3
	.word	0xd80e601c	! t1_kref+0x2fb0:   	ldub	[%i1 + 0x1c], %o4
	.word	0x8bb38c77	! t1_kref+0x2fb4:   	fnors	%f14, %f23, %f5
	.word	0x98673cda	! t1_kref+0x2fb8:   	subc	%i4, -0x326, %o4
	.word	0x25480008	! t1_kref+0x2fbc:   	fblg,a,pt	%fcc0, _kref+0x2fdc
	.word	0x8db68998	! t1_kref+0x2fc0:   	bshuffle	%f26, %f24, %f6
	.word	0xada00552	! t1_kref+0x2fc4:   	fsqrtd	%f18, %f22
	.word	0x39800005	! t1_kref+0x2fc8:   	fbuge,a	_kref+0x2fdc
	.word	0x98dec008	! t1_kref+0x2fcc:   	smulcc	%i3, %o0, %o4
	.word	0x993de011	! t1_kref+0x2fd0:   	sra	%l7, 0x11, %o4
	.word	0x91b18d40	! t1_kref+0x2fd4:   	fnot1	%f6, %f8
	.word	0x8da488ce	! t1_kref+0x2fd8:   	fsubd	%f18, %f14, %f6
	.word	0x87802080	! t1_kref+0x2fdc:   	mov	0x80, %asi
	.word	0x8da00531	! t1_kref+0x2fe0:   	fsqrts	%f17, %f6
	.word	0xaba54934	! t1_kref+0x2fe4:   	fmuls	%f21, %f20, %f21
	.word	0xb5a0052e	! t1_kref+0x2fe8:   	fsqrts	%f14, %f26
	.word	0xd8a0a01c	! t1_kref+0x2fec:   	sta	%o4, [%g2 + 0x1c]%asi
	.word	0xe920a014	! t1_kref+0x2ff0:   	st	%f20, [%g2 + 0x14]
	.word	0xd880a014	! t1_kref+0x2ff4:   	lda	[%g2 + 0x14]%asi, %o4
	.word	0x3a480006	! t1_kref+0x2ff8:   	bcc,a,pt	%icc, _kref+0x3010
	.word	0xeca8a00c	! t1_kref+0x2ffc:   	stba	%l6, [%g2 + 0xc]%asi
	.word	0x95a00534	! t1_kref+0x3000:   	fsqrts	%f20, %f10
	.word	0x91a01096	! t1_kref+0x3004:   	fxtos	%f22, %f8
	.word	0x983b2c75	! t1_kref+0x3008:   	xnor	%o4, 0xc75, %o4
	.word	0x23480004	! t1_kref+0x300c:   	fbne,a,pt	%fcc0, _kref+0x301c
	.word	0x91a2c82a	! t1_kref+0x3010:   	fadds	%f11, %f10, %f8
	.word	0xd8060000	! t1_kref+0x3014:   	ld	[%i0], %o4
	.word	0x81ad0a25	! t1_kref+0x3018:   	fcmps	%fcc0, %f20, %f5
	.word	0xb1a00556	! t1_kref+0x301c:   	fsqrtd	%f22, %f24
	.word	0x983825ef	! t1_kref+0x3020:   	xnor	%g0, 0x5ef, %o4
	.word	0x81da0014	! t1_kref+0x3024:   	flush	%o0 + %l4
	.word	0x81580000	! t1_kref+0x3028:   	flushw
	.word	0xa1b00fc0	! t1_kref+0x302c:   	fone	%f16
	.word	0x99a01106	! t1_kref+0x3030:   	fxtod	%f6, %f12
	.word	0x8da649aa	! t1_kref+0x3034:   	fdivs	%f25, %f10, %f6
	.word	0xf628a035	! t1_kref+0x3038:   	stb	%i3, [%g2 + 0x35]
	.word	0x99b0c62c	! t1_kref+0x303c:   	fmul8x16	%f3, %f12, %f12
	.word	0x3f800008	! t1_kref+0x3040:   	fbo,a	_kref+0x3060
	.word	0x8db30e80	! t1_kref+0x3044:   	fsrc1	%f12, %f6
	.word	0x98c5abe8	! t1_kref+0x3048:   	addccc	%l6, 0xbe8, %o4
	.word	0x98fd7b69	! t1_kref+0x304c:   	sdivcc	%l5, -0x497, %o4
	.word	0xd4380018	! t1_kref+0x3050:   	std	%o2, [%g0 + %i0]
	.word	0xd8066010	! t1_kref+0x3054:   	ld	[%i1 + 0x10], %o4
	.word	0x81df0015	! t1_kref+0x3058:   	flush	%i4 + %l5
	.word	0xd84e6008	! t1_kref+0x305c:   	ldsb	[%i1 + 8], %o4
	.word	0x8da18933	! t1_kref+0x3060:   	fmuls	%f6, %f19, %f6
	.word	0xc0ee501a	! t1_kref+0x3064:   	ldstuba	[%i1 + %i2]0x80, %g0
	.word	0x8db386ce	! t1_kref+0x3068:   	fmul8sux16	%f14, %f14, %f6
	.word	0x9ba01a33	! t1_kref+0x306c:   	fstoi	%f19, %f13
	.word	0xb5a01a2a	! t1_kref+0x3070:   	fstoi	%f10, %f26
	.word	0x98bec00c	! t1_kref+0x3074:   	xnorcc	%i3, %o4, %o4
	.word	0x81aa8a2b	! t1_kref+0x3078:   	fcmps	%fcc0, %f10, %f11
	.word	0x192fe246	! t1_kref+0x307c:   	sethi	%hi(0xbf891800), %o4
	.word	0x31480005	! t1_kref+0x3080:   	fba,a,pt	%fcc0, _kref+0x3094
	.word	0x9da0052f	! t1_kref+0x3084:   	fsqrts	%f15, %f14
	.word	0x8da01a26	! t1_kref+0x3088:   	fstoi	%f6, %f6
	.word	0xd8080018	! t1_kref+0x308c:   	ldub	[%g0 + %i0], %o4
	.word	0xebe8a00f	! t1_kref+0x3090:   	prefetcha	%g2 + 0xf, 21
	.word	0x9863380c	! t1_kref+0x3094:   	subc	%o4, -0x7f4, %o4
	.word	0x983c400b	! t1_kref+0x3098:   	xnor	%l1, %o3, %o4
	.word	0x98b70008	! t1_kref+0x309c:   	orncc	%i4, %o0, %o4
	.word	0xede6500d	! t1_kref+0x30a0:   	casa	[%i1]0x80, %o5, %l6
	.word	0xd80e3fe1	! t1_kref+0x30a4:   	ldub	[%i0 - 0x1f], %o4
	.word	0x98bc400b	! t1_kref+0x30a8:   	xnorcc	%l1, %o3, %o4
	.word	0x31800007	! t1_kref+0x30ac:   	fba,a	_kref+0x30c8
	.word	0x9817000a	! t1_kref+0x30b0:   	or	%i4, %o2, %o4
	.word	0xaba3493a	! t1_kref+0x30b4:   	fmuls	%f13, %f26, %f21
	.word	0xe4b0a034	! t1_kref+0x30b8:   	stha	%l2, [%g2 + 0x34]%asi
	.word	0xa9b20d10	! t1_kref+0x30bc:   	fandnot1	%f8, %f16, %f20
	.word	0xb1a01a27	! t1_kref+0x30c0:   	fstoi	%f7, %f24
	.word	0x99b60484	! t1_kref+0x30c4:   	fcmple32	%f24, %f4, %o4
	.word	0x99b000b7	! t1_kref+0x30c8:   	edge16n	%g0, %l7, %o4
	.word	0x81820000	! t1_kref+0x30cc:   	wr	%o0, %g0, %y
	.word	0xc07e401c	! t1_kref+0x30d0:   	swap	[%i1 + %i4], %g0
	.word	0xd840a02c	! t1_kref+0x30d4:   	ldsw	[%g2 + 0x2c], %o4
	.word	0x983b2151	! t1_kref+0x30d8:   	xnor	%o4, 0x151, %o4
	.word	0xe51fbca8	! t1_kref+0x30dc:   	ldd	[%fp - 0x358], %f18
	.word	0xef00a00c	! t1_kref+0x30e0:   	ld	[%g2 + 0xc], %f23
	.word	0x993ae014	! t1_kref+0x30e4:   	sra	%o3, 0x14, %o4
	.word	0x81ab0ace	! t1_kref+0x30e8:   	fcmped	%fcc0, %f12, %f14
	.word	0x89a38850	! t1_kref+0x30ec:   	faddd	%f14, %f16, %f4
	sethi	%hi(2f), %o7
	.word	0xe40be138	! t1_kref+0x30f4:   	ldub	[%o7 + 0x138], %l2
	.word	0xa41ca00c	! t1_kref+0x30f8:   	xor	%l2, 0xc, %l2
	.word	0xe42be138	! t1_kref+0x30fc:   	stb	%l2, [%o7 + 0x138]
	.word	0x81dbe138	! t1_kref+0x3100:   	flush	%o7 + 0x138
	.word	0xe4380018	! t1_kref+0x3104:   	std	%l2, [%g0 + %i0]
	.word	0x2f480005	! t1_kref+0x3108:   	fbu,a,pt	%fcc0, _kref+0x311c
	.word	0x93a3c836	! t1_kref+0x310c:   	fadds	%f15, %f22, %f9
	.word	0x81848000	! t1_kref+0x3110:   	wr	%l2, %g0, %y
	.word	0x98fcbfd7	! t1_kref+0x3114:   	sdivcc	%l2, -0x29, %o4
	.word	0x98d32a87	! t1_kref+0x3118:   	umulcc	%o4, 0xa87, %o4
	.word	0x1914f155	! t1_kref+0x311c:   	sethi	%hi(0x53c55400), %o4
	.word	0xa3a01a54	! t1_kref+0x3120:   	fdtoi	%f20, %f17
	.word	0x97a01a50	! t1_kref+0x3124:   	fdtoi	%f16, %f11
	call	SYM(t1_subr2)
	.word	0xadb00f0e	! t1_kref+0x312c:   	fsrc2	%f14, %f22
	.word	0x81828000	! t1_kref+0x3130:   	wr	%o2, %g0, %y
	.word	0xa5b1c70c	! t1_kref+0x3134:   	fmuld8sux16	%f7, %f12, %f18
2:	.word	0x9fb00ce3	! t1_kref+0x3138:   	fnot2s	%f3, %f15
	.word	0x9de3bfa0	! t1_kref+0x313c:   	save	%sp, -0x60, %sp
	.word	0x99ef241b	! t1_kref+0x3140:   	restore	%i4, 0x41b, %o4
	.word	0xa9a0003a	! t1_kref+0x3144:   	fmovs	%f26, %f20
	sethi	%hi(1f), %o7
	jmpl	%o7+%lo(1f), %g1
	.empty
1:	.word	0xada01915	! t1_kref+0x3150:   	fitod	%f21, %f22
	.word	0xea20a024	! t1_kref+0x3154:   	st	%l5, [%g2 + 0x24]
	.word	0x95a58d29	! t1_kref+0x3158:   	fsmuld	%f22, %f9, %f10
	.word	0x99b3012b	! t1_kref+0x315c:   	edge32n	%o4, %o3, %o4
	.word	0xb1b18d40	! t1_kref+0x3160:   	fnot1	%f6, %f24
	.word	0x989277a2	! t1_kref+0x3164:   	orcc	%o1, -0x85e, %o4
	.word	0xa3a01a54	! t1_kref+0x3168:   	fdtoi	%f20, %f17
	.word	0xf320a00c	! t1_kref+0x316c:   	st	%f25, [%g2 + 0xc]
	.word	0x98bac015	! t1_kref+0x3170:   	xnorcc	%o3, %l5, %o4
	.word	0x990b400c	! t1_kref+0x3174:   	tsubcc	%o5, %o4, %o4
	.word	0x1906dc12	! t1_kref+0x3178:   	sethi	%hi(0x1b704800), %o4
	.word	0xd880a03c	! t1_kref+0x317c:   	lda	[%g2 + 0x3c]%asi, %o4
	.word	0xb1a0192a	! t1_kref+0x3180:   	fstod	%f10, %f24
	.word	0x34480001	! t1_kref+0x3184:   	bg,a,pt	%icc, _kref+0x3188
	.word	0xb3b00c20	! t1_kref+0x3188:   	fzeros	%f25
	.word	0xd856401b	! t1_kref+0x318c:   	ldsh	[%i1 + %i3], %o4
	.word	0xe53e4000	! t1_kref+0x3190:   	std	%f18, [%i1]
	.word	0x98dd8000	! t1_kref+0x3194:   	smulcc	%l6, %g0, %o4
	.word	0x89a01a24	! t1_kref+0x3198:   	fstoi	%f4, %f4
	.word	0x2d480007	! t1_kref+0x319c:   	fbg,a,pt	%fcc0, _kref+0x31b8
	.word	0xd99f1a58	! t1_kref+0x31a0:   	ldda	[%i4 + %i0]0xd2, %f12
	.word	0x9802c01a	! t1_kref+0x31a4:   	add	%o3, %i2, %o4
	.word	0x21800008	! t1_kref+0x31a8:   	fbn,a	_kref+0x31c8
	.word	0x9834c009	! t1_kref+0x31ac:   	orn	%l3, %o1, %o4
	.word	0x99408000	! t1_kref+0x31b0:   	mov	%ccr, %o4
	.word	0x99b54155	! t1_kref+0x31b4:   	edge32l	%l5, %l5, %o4
	.word	0x991f0015	! t1_kref+0x31b8:   	tsubcctv	%i4, %l5, %o4
	.word	0x9bb2cd60	! t1_kref+0x31bc:   	fnot1s	%f11, %f13
	.word	0x89a018d8	! t1_kref+0x31c0:   	fdtos	%f24, %f4
	.word	0xa9a01925	! t1_kref+0x31c4:   	fstod	%f5, %f20
	.word	0xe168a04f	! t1_kref+0x31c8:   	prefetch	%g2 + 0x4f, 16
	.word	0xe83e001d	! t1_kref+0x31cc:   	std	%l4, [%i0 + %i5]
	call	SYM(t1_subr2)
	.word	0xd856201a	! t1_kref+0x31d4:   	ldsh	[%i0 + 0x1a], %o4
	.word	0x81828000	! t1_kref+0x31d8:   	wr	%o2, %g0, %y
	.word	0x98a4801b	! t1_kref+0x31dc:   	subcc	%l2, %i3, %o4
	.word	0x9886c01c	! t1_kref+0x31e0:   	addcc	%i3, %i4, %o4
	.word	0x98fe8008	! t1_kref+0x31e4:   	sdivcc	%i2, %o0, %o4
	.word	0x3b800003	! t1_kref+0x31e8:   	fble,a	_kref+0x31f4
	.word	0xb1b00cd8	! t1_kref+0x31ec:   	fnot2	%f24, %f24
	.word	0x99400000	! t1_kref+0x31f0:   	mov	%y, %o4
	.word	0xf51e6000	! t1_kref+0x31f4:   	ldd	[%i1], %f26
	.word	0xd800a024	! t1_kref+0x31f8:   	ld	[%g2 + 0x24], %o4
	.word	0x93a0052a	! t1_kref+0x31fc:   	fsqrts	%f10, %f9
	.word	0x29800008	! t1_kref+0x3200:   	fbl,a	_kref+0x3220
	.word	0x81dfc013	! t1_kref+0x3204:   	flush	%i7 + %l3
	.word	0x9800001b	! t1_kref+0x3208:   	add	%g0, %i3, %o4
	.word	0x85a0054e	! t1_kref+0x320c:   	fsqrtd	%f14, %f2
	.word	0xdd3e401d	! t1_kref+0x3210:   	std	%f14, [%i1 + %i5]
	.word	0x22480006	! t1_kref+0x3214:   	be,a,pt	%icc, _kref+0x322c
	.word	0x97a00527	! t1_kref+0x3218:   	fsqrts	%f7, %f11
	.word	0xd820a014	! t1_kref+0x321c:   	st	%o4, [%g2 + 0x14]
	.word	0x992d2018	! t1_kref+0x3220:   	sll	%l4, 0x18, %o4
	.word	0xa7b50de4	! t1_kref+0x3224:   	fnands	%f20, %f4, %f19
	.word	0x95a50d38	! t1_kref+0x3228:   	fsmuld	%f20, %f24, %f10
	.word	0x81d9701c	! t1_kref+0x322c:   	flush	%g5 - 0xfe4
	.word	0x8143e01c	! t1_kref+0x3230:   	membar	0x1c
	.word	0x99b584ce	! t1_kref+0x3234:   	fcmpne32	%f22, %f14, %o4
	.word	0x98e573c7	! t1_kref+0x3238:   	subccc	%l5, -0xc39, %o4
	.word	0x93b4cdf2	! t1_kref+0x323c:   	fnands	%f19, %f18, %f9
	.word	0x99b58404	! t1_kref+0x3240:   	fcmple16	%f22, %f4, %o4
	.word	0x8da00535	! t1_kref+0x3244:   	fsqrts	%f21, %f6
	.word	0x9852f513	! t1_kref+0x3248:   	umul	%o3, -0xaed, %o4
	.word	0x89a01a50	! t1_kref+0x324c:   	fdtoi	%f16, %f4
	.word	0x8da00554	! t1_kref+0x3250:   	fsqrtd	%f20, %f6
	.word	0xf430a034	! t1_kref+0x3254:   	sth	%i2, [%g2 + 0x34]
	.word	0x9de3bfa0	! t1_kref+0x3258:   	save	%sp, -0x60, %sp
	.word	0x99e8001d	! t1_kref+0x325c:   	restore	%g0, %i5, %o4
	.word	0xd03e001d	! t1_kref+0x3260:   	std	%o0, [%i0 + %i5]
	.word	0xd8070018	! t1_kref+0x3264:   	ld	[%i4 + %i0], %o4
	.word	0x8da01905	! t1_kref+0x3268:   	fitod	%f5, %f6
	.word	0x98df3321	! t1_kref+0x326c:   	smulcc	%i4, -0xcdf, %o4
	.word	0xe6a8a016	! t1_kref+0x3270:   	stba	%l3, [%g2 + 0x16]%asi
	.word	0x81ab0a54	! t1_kref+0x3274:   	fcmpd	%fcc0, %f12, %f20
	.word	0xec7e6018	! t1_kref+0x3278:   	swap	[%i1 + 0x18], %l6
	.word	0xa9a0054c	! t1_kref+0x327c:   	fsqrtd	%f12, %f20
	.word	0x91a00558	! t1_kref+0x3280:   	fsqrtd	%f24, %f8
	.word	0xe89f5040	! t1_kref+0x3284:   	ldda	[%i5]0x82, %l4
	.word	0xabb2caf2	! t1_kref+0x3288:   	fpsub32s	%f11, %f18, %f21
	.word	0x95a00125	! t1_kref+0x328c:   	fabss	%f5, %f10
	.word	0xe420a034	! t1_kref+0x3290:   	st	%l2, [%g2 + 0x34]
	.word	0xca5166fc	! t1_kref+0x3294:   	ldsh	[%g5 + 0x6fc], %g5
	.word	0x2f800008	! t1_kref+0x3298:   	fbu,a	_kref+0x32b8
	.word	0xe878a004	! t1_kref+0x329c:   	swap	[%g2 + 4], %l4
	.word	0xb5a01a2c	! t1_kref+0x32a0:   	fstoi	%f12, %f26
	.word	0xd02e2003	! t1_kref+0x32a4:   	stb	%o0, [%i0 + 3]
	.word	0xd848a01c	! t1_kref+0x32a8:   	ldsb	[%g2 + 0x1c], %o4
	.word	0x33800002	! t1_kref+0x32ac:   	fbe,a	_kref+0x32b4
	.word	0x85b48968	! t1_kref+0x32b0:   	fpmerge	%f18, %f8, %f2
	.word	0xe81029ac	! t1_kref+0x32b4:   	lduh	[%g0 + 0x9ac], %l4
	.word	0xe87e3fec	! t1_kref+0x32b8:   	swap	[%i0 - 0x14], %l4
	.word	0x99a01a48	! t1_kref+0x32bc:   	fdtoi	%f8, %f12
	.word	0x99ab0023	! t1_kref+0x32c0:   	fmovsuge	%fcc0, %f3, %f12
!	.word	0x2b4a0b4f	! t1_kref+0x32c4:   	fbug,a,pt	%fcc0, SYM(t1_subr3)
	   	fbug,a,pt	%fcc0, SYM(t1_subr3)
	.word	0x9e006178	! t1_kref+0x32c8:   	add	%g1, 0x178, %o7
	.word	0x98dac01c	! t1_kref+0x32cc:   	smulcc	%o3, %i4, %o4
	.word	0x81accab8	! t1_kref+0x32d0:   	fcmpes	%fcc0, %f19, %f24
	.word	0xc91e0000	! t1_kref+0x32d4:   	ldd	[%i0], %f4
	.word	0x81ae0ad4	! t1_kref+0x32d8:   	fcmped	%fcc0, %f24, %f20
	.word	0x9da01a34	! t1_kref+0x32dc:   	fstoi	%f20, %f14
	.word	0xe6f01019	! t1_kref+0x32e0:   	stxa	%l3, [%g0 + %i1]0x80
	.word	0x993d6000	! t1_kref+0x32e4:   	sra	%l5, 0x0, %o4
	.word	0x87b0cf65	! t1_kref+0x32e8:   	fornot1s	%f3, %f5, %f3
	.word	0xd856c019	! t1_kref+0x32ec:   	ldsh	[%i3 + %i1], %o4
	.word	0x98bb001a	! t1_kref+0x32f0:   	xnorcc	%o4, %i2, %o4
	.word	0x9938201e	! t1_kref+0x32f4:   	sra	%g0, 0x1e, %o4
	.word	0xd856c018	! t1_kref+0x32f8:   	ldsh	[%i3 + %i0], %o4
	.word	0x89a0055a	! t1_kref+0x32fc:   	fsqrtd	%f26, %f4
	.word	0xb3b44ea0	! t1_kref+0x3300:   	fsrc1s	%f17, %f25
	.word	0xffee101c	! t1_kref+0x3304:   	prefetcha	%i0 + %i4, 31
	.word	0x991f001c	! t1_kref+0x3308:   	tsubcctv	%i4, %i4, %o4
	.word	0x98852b7d	! t1_kref+0x330c:   	addcc	%l4, 0xb7d, %o4
	.word	0x93a308b8	! t1_kref+0x3310:   	fsubs	%f12, %f24, %f9
	.word	0x98120008	! t1_kref+0x3314:   	or	%o0, %o0, %o4
	.word	0xe99e7fe0	! t1_kref+0x3318:   	ldda	[%i1 - 0x20]%asi, %f20
	.word	0xd846001c	! t1_kref+0x331c:   	ldsw	[%i0 + %i4], %o4
	.word	0xd03e2010	! t1_kref+0x3320:   	std	%o0, [%i0 + 0x10]
	.word	0x99400000	! t1_kref+0x3324:   	mov	%y, %o4
	.word	0xf7ee501a	! t1_kref+0x3328:   	prefetcha	%i1 + %i2, 27
	.word	0xa5b30d40	! t1_kref+0x332c:   	fnot1	%f12, %f18
	.word	0x9883400d	! t1_kref+0x3330:   	addcc	%o5, %o5, %o4
	.word	0x91a0110c	! t1_kref+0x3334:   	fxtod	%f12, %f8
	.word	0xb810201c	! t1_kref+0x3338:   	mov	0x1c, %i4
	.word	0x8143e040	! t1_kref+0x333c:   	membar	0x40
	.word	0x3f800002	! t1_kref+0x3340:   	fbo,a	_kref+0x3348
	.word	0xd53e6010	! t1_kref+0x3344:   	std	%f10, [%i1 + 0x10]
	.word	0x23480001	! t1_kref+0x3348:   	fbne,a,pt	%fcc0, _kref+0x334c
	.word	0x8db4c973	! t1_kref+0x334c:   	fpmerge	%f19, %f19, %f6
	.word	0xb1a109b6	! t1_kref+0x3350:   	fdivs	%f4, %f22, %f24
	.word	0x28480004	! t1_kref+0x3354:   	bleu,a,pt	%icc, _kref+0x3364
	.word	0x98f24012	! t1_kref+0x3358:   	udivcc	%o1, %l2, %o4
	.word	0x99a0053a	! t1_kref+0x335c:   	fsqrts	%f26, %f12
	.word	0xc7e8a08d	! t1_kref+0x3360:   	prefetcha	%g2 + 0x8d, 3
	.word	0x39800006	! t1_kref+0x3364:   	fbuge,a	_kref+0x337c
	.word	0x99400000	! t1_kref+0x3368:   	mov	%y, %o4
	.word	0xada01936	! t1_kref+0x336c:   	fstod	%f22, %f22
	.word	0xd800a034	! t1_kref+0x3370:   	ld	[%g2 + 0x34], %o4
	.word	0x98fdef43	! t1_kref+0x3374:   	sdivcc	%l7, 0xf43, %o4
	.word	0x81dfb90a	! t1_kref+0x3378:   	flush	%fp - 0x6f6
	.word	0x99a01903	! t1_kref+0x337c:   	fitod	%f3, %f12
	.word	0x982c7e87	! t1_kref+0x3380:   	andn	%l1, -0x179, %o4
	.word	0xc1e8a043	! t1_kref+0x3384:   	prefetcha	%g2 + 0x43, 0
	.word	0x981df994	! t1_kref+0x3388:   	xor	%l7, -0x66c, %o4
	.word	0x89b00c00	! t1_kref+0x338c:   	fzero	%f4
	.word	0xd620a02c	! t1_kref+0x3390:   	st	%o3, [%g2 + 0x2c]
	.word	0xd800a004	! t1_kref+0x3394:   	ld	[%g2 + 4], %o4
	.word	0x3a480006	! t1_kref+0x3398:   	bcc,a,pt	%icc, _kref+0x33b0
	.word	0xf4a8a034	! t1_kref+0x339c:   	stba	%i2, [%g2 + 0x34]%asi
	.word	0xa7a00127	! t1_kref+0x33a0:   	fabss	%f7, %f19
	.word	0xef68a045	! t1_kref+0x33a4:   	prefetch	%g2 + 0x45, 23
	.word	0x9ba0052a	! t1_kref+0x33a8:   	fsqrts	%f10, %f13
	.word	0x8fa0052a	! t1_kref+0x33ac:   	fsqrts	%f10, %f7
	.word	0x98a3000a	! t1_kref+0x33b0:   	subcc	%o4, %o2, %o4
	.word	0xcfa0a00c	! t1_kref+0x33b4:   	sta	%f7, [%g2 + 0xc]%asi
	.word	0x99b00076	! t1_kref+0x33b8:   	edge8ln	%g0, %l6, %o4
	.word	0x9de3bfa0	! t1_kref+0x33bc:   	save	%sp, -0x60, %sp
	.word	0x99e82650	! t1_kref+0x33c0:   	restore	%g0, 0x650, %o4
	.word	0x85ab0058	! t1_kref+0x33c4:   	fmovduge	%fcc0, %f24, %f2
	.word	0x39800002	! t1_kref+0x33c8:   	fbuge,a	_kref+0x33d0
	.word	0x98c5800a	! t1_kref+0x33cc:   	addccc	%l6, %o2, %o4
	.word	0xa7a208a5	! t1_kref+0x33d0:   	fsubs	%f8, %f5, %f19
	.word	0x98d5800d	! t1_kref+0x33d4:   	umulcc	%l6, %o5, %o4
	.word	0xada5c92d	! t1_kref+0x33d8:   	fmuls	%f23, %f13, %f22
	.word	0xd8080018	! t1_kref+0x33dc:   	ldub	[%g0 + %i0], %o4
	.word	0xd850a016	! t1_kref+0x33e0:   	ldsh	[%g2 + 0x16], %o4
	.word	0x81aa8a23	! t1_kref+0x33e4:   	fcmps	%fcc0, %f10, %f3
	.word	0xc1f6500d	! t1_kref+0x33e8:   	casxa	[%i1]0x80, %o5, %g0
	.word	0x99b6048a	! t1_kref+0x33ec:   	fcmple32	%f24, %f10, %o4
	.word	0x81ae8a2f	! t1_kref+0x33f0:   	fcmps	%fcc0, %f26, %f15
	call	SYM(t1_subr2)
	.word	0x99b2c240	! t1_kref+0x33f8:   	array16	%o3, %g0, %o4
	.word	0x9de3bfa0	! t1_kref+0x33fc:   	save	%sp, -0x60, %sp
	.word	0x99ef001d	! t1_kref+0x3400:   	restore	%i4, %i5, %o4
	.word	0x99b585c6	! t1_kref+0x3404:   	fcmpeq32	%f22, %f6, %o4
	.word	0xaba0053a	! t1_kref+0x3408:   	fsqrts	%f26, %f21
	.word	0xc568a04a	! t1_kref+0x340c:   	prefetch	%g2 + 0x4a, 2
	.word	0xadb60e54	! t1_kref+0x3410:   	fxnor	%f24, %f20, %f22
	.word	0x9de3bfa0	! t1_kref+0x3414:   	save	%sp, -0x60, %sp
	.word	0x99ee0019	! t1_kref+0x3418:   	restore	%i0, %i1, %o4
	.word	0x35480004	! t1_kref+0x341c:   	fbue,a,pt	%fcc0, _kref+0x342c
	.word	0x89a40831	! t1_kref+0x3420:   	fadds	%f16, %f17, %f4
	.word	0xc93e2010	! t1_kref+0x3424:   	std	%f4, [%i0 + 0x10]
	.word	0xadb606d0	! t1_kref+0x3428:   	fmul8sux16	%f24, %f16, %f22
	.word	0xd800a034	! t1_kref+0x342c:   	ld	[%g2 + 0x34], %o4
	.word	0xa1a00558	! t1_kref+0x3430:   	fsqrtd	%f24, %f16
	.word	0x985a32ec	! t1_kref+0x3434:   	smul	%o0, -0xd14, %o4
	.word	0xadb50fb5	! t1_kref+0x3438:   	fors	%f20, %f21, %f22
	.word	0xd8c66014	! t1_kref+0x343c:   	ldswa	[%i1 + 0x14]%asi, %o4
	.word	0x95a188c8	! t1_kref+0x3440:   	fsubd	%f6, %f8, %f10
	.word	0xb3b64a65	! t1_kref+0x3444:   	fpadd32s	%f25, %f5, %f25
	.word	0x81d8401d	! t1_kref+0x3448:   	flush	%g1 + %i5
	.word	0xc0a8a025	! t1_kref+0x344c:   	stba	%g0, [%g2 + 0x25]%asi
	.word	0x81ae8ab8	! t1_kref+0x3450:   	fcmpes	%fcc0, %f26, %f24
	.word	0x8da0052b	! t1_kref+0x3454:   	fsqrts	%f11, %f6
	.word	0x32480008	! t1_kref+0x3458:   	bne,a,pt	%icc, _kref+0x3478
	.word	0x98156df4	! t1_kref+0x345c:   	or	%l5, 0xdf4, %o4
	.word	0xcd1fbe70	! t1_kref+0x3460:   	ldd	[%fp - 0x190], %f6
	.word	0x9db186ca	! t1_kref+0x3464:   	fmul8sux16	%f6, %f10, %f14
	.word	0xd850a014	! t1_kref+0x3468:   	ldsh	[%g2 + 0x14], %o4
	.word	0x8da2084e	! t1_kref+0x346c:   	faddd	%f8, %f14, %f6
	.word	0x26480006	! t1_kref+0x3470:   	bl,a,pt	%icc, _kref+0x3488
	.word	0x9ba0c9aa	! t1_kref+0x3474:   	fdivs	%f3, %f10, %f13
	.word	0xd856001b	! t1_kref+0x3478:   	ldsh	[%i0 + %i3], %o4
	.word	0xb3b18a38	! t1_kref+0x347c:   	fpadd16s	%f6, %f24, %f25
	.word	0xa5a00544	! t1_kref+0x3480:   	fsqrtd	%f4, %f18
	.word	0x81dfc01e	! t1_kref+0x3484:   	flush	%i7 + %fp
	.word	0x99b20280	! t1_kref+0x3488:   	array32	%o0, %g0, %o4
	.word	0xd51fbdd8	! t1_kref+0x348c:   	ldd	[%fp - 0x228], %f10
	.word	0x982a2ee3	! t1_kref+0x3490:   	andn	%o0, 0xee3, %o4
	.word	0x9de3bfa0	! t1_kref+0x3494:   	save	%sp, -0x60, %sp
	.word	0x99ee6e12	! t1_kref+0x3498:   	restore	%i1, 0xe12, %o4
	.word	0xc807bfe4	! t1_kref+0x349c:   	ld	[%fp - 0x1c], %g4
	.word	0x81820000	! t1_kref+0x34a0:   	wr	%o0, %g0, %y
	.word	0x95a488c8	! t1_kref+0x34a4:   	fsubd	%f18, %f8, %f10
	.word	0x97a01a32	! t1_kref+0x34a8:   	fstoi	%f18, %f11
	.word	0x98f72dc9	! t1_kref+0x34ac:   	udivcc	%i4, 0xdc9, %o4
	.word	0xb1a3884e	! t1_kref+0x34b0:   	faddd	%f14, %f14, %f24
	.word	0xd4be7ff8	! t1_kref+0x34b4:   	stda	%o2, [%i1 - 8]%asi
	.word	0x98bcc00d	! t1_kref+0x34b8:   	xnorcc	%l3, %o5, %o4
	.word	0x25800005	! t1_kref+0x34bc:   	fblg,a	_kref+0x34d0
	.word	0x99a348b1	! t1_kref+0x34c0:   	fsubs	%f13, %f17, %f12
	.word	0x98f44000	! t1_kref+0x34c4:   	udivcc	%l1, %g0, %o4
	.word	0x993e8017	! t1_kref+0x34c8:   	sra	%i2, %l7, %o4
	.word	0x81800000	! t1_kref+0x34cc:   	mov	%g0, %y
	.word	0x9fa01a46	! t1_kref+0x34d0:   	fdtoi	%f6, %f15
	.word	0xafa3c837	! t1_kref+0x34d4:   	fadds	%f15, %f23, %f23
	.word	0x83414000	! t1_kref+0x34d8:   	mov	%pc, %g1
	.word	0x98c5fd29	! t1_kref+0x34dc:   	addccc	%l7, -0x2d7, %o4
	.word	0xd88e5000	! t1_kref+0x34e0:   	lduba	[%i1]0x80, %o4
	.word	0xc0fe3ffc	! t1_kref+0x34e4:   	swapa	[%i0 - 4]%asi, %g0
	.word	0x99b20550	! t1_kref+0x34e8:   	fcmpeq16	%f8, %f16, %o4
	.word	0xf59e101d	! t1_kref+0x34ec:   	ldda	[%i0 + %i5]0x80, %f26
	.word	0xd1be188b	! t1_kref+0x34f0:   	stda	%f8, [%i0 + %o3]0xc4
	.word	0x98673fb1	! t1_kref+0x34f4:   	subc	%i4, -0x4f, %o4
	.word	0x2b480006	! t1_kref+0x34f8:   	fbug,a,pt	%fcc0, _kref+0x3510
	.word	0x992d600c	! t1_kref+0x34fc:   	sll	%l5, 0xc, %o4
	.word	0x99b2803a	! t1_kref+0x3500:   	edge8n	%o2, %i2, %o4
	.word	0xdaa8a03d	! t1_kref+0x3504:   	stba	%o5, [%g2 + 0x3d]%asi
	.word	0x95a00152	! t1_kref+0x3508:   	fabsd	%f18, %f10
	.word	0xb5a00023	! t1_kref+0x350c:   	fmovs	%f3, %f26
	.word	0x98f2f1e2	! t1_kref+0x3510:   	udivcc	%o3, -0xe1e, %o4
	.word	0xd816001b	! t1_kref+0x3514:   	lduh	[%i0 + %i3], %o4
	.word	0xa1a00150	! t1_kref+0x3518:   	fabsd	%f16, %f16
	.word	0xe2a0a03c	! t1_kref+0x351c:   	sta	%l1, [%g2 + 0x3c]%asi
	.word	0x989c801a	! t1_kref+0x3520:   	xorcc	%l2, %i2, %o4
	.word	0x9812000b	! t1_kref+0x3524:   	or	%o0, %o3, %o4
	.word	0x97b00fe0	! t1_kref+0x3528:   	fones	%f11
	.word	0xe4316b2a	! t1_kref+0x352c:   	sth	%l2, [%g5 + 0xb2a]
	.word	0xa1a00531	! t1_kref+0x3530:   	fsqrts	%f17, %f16
	.word	0x3b800008	! t1_kref+0x3534:   	fble,a	_kref+0x3554
	.word	0xe3ee101a	! t1_kref+0x3538:   	prefetcha	%i0 + %i2, 17
	.word	0x81da800d	! t1_kref+0x353c:   	flush	%o2 + %o5
	.word	0xa5b00cda	! t1_kref+0x3540:   	fnot2	%f26, %f18
	.word	0xe83e3ff0	! t1_kref+0x3544:   	std	%l4, [%i0 - 0x10]
	.word	0xa5b20c77	! t1_kref+0x3548:   	fnors	%f8, %f23, %f18
	.word	0x992aa00c	! t1_kref+0x354c:   	sll	%o2, 0xc, %o4
	.word	0x989cf2c6	! t1_kref+0x3550:   	xorcc	%l3, -0xd3a, %o4
	.word	0xf420a01c	! t1_kref+0x3554:   	st	%i2, [%g2 + 0x1c]
	.word	0xa1b00c00	! t1_kref+0x3558:   	fzero	%f16
	.word	0xeca0a024	! t1_kref+0x355c:   	sta	%l6, [%g2 + 0x24]%asi
	.word	0x98ad8012	! t1_kref+0x3560:   	andncc	%l6, %l2, %o4
	.word	0x9836c011	! t1_kref+0x3564:   	orn	%i3, %l1, %o4
	.word	0xa5a01118	! t1_kref+0x3568:   	fxtod	%f24, %f18
	.word	0xe700a024	! t1_kref+0x356c:   	ld	[%g2 + 0x24], %f19
	.word	0x98dc800b	! t1_kref+0x3570:   	smulcc	%l2, %o3, %o4
	.word	0xada208ce	! t1_kref+0x3574:   	fsubd	%f8, %f14, %f22
	.word	0xec3f4019	! t1_kref+0x3578:   	std	%l6, [%i5 + %i1]
	.word	0xf5ee101a	! t1_kref+0x357c:   	prefetcha	%i0 + %i2, 26
	.word	0xd8063fe0	! t1_kref+0x3580:   	ld	[%i0 - 0x20], %o4
	.word	0xadb48d40	! t1_kref+0x3584:   	fnot1	%f18, %f22
	.word	0xa7a00132	! t1_kref+0x3588:   	fabss	%f18, %f19
	.word	0xafa01a4c	! t1_kref+0x358c:   	fdtoi	%f12, %f23
	.word	0xe03e7ff8	! t1_kref+0x3590:   	std	%l0, [%i1 - 8]
	.word	0xc51e6008	! t1_kref+0x3594:   	ldd	[%i1 + 8], %f2
	.word	0xd856401b	! t1_kref+0x3598:   	ldsh	[%i1 + %i3], %o4
	.word	0xd88e7ff1	! t1_kref+0x359c:   	lduba	[%i1 - 0xf]%asi, %o4
	.word	0xd8067ff8	! t1_kref+0x35a0:   	ld	[%i1 - 8], %o4
	.word	0xda20a02c	! t1_kref+0x35a4:   	st	%o5, [%g2 + 0x2c]
	.word	0xd0a8a004	! t1_kref+0x35a8:   	stba	%o0, [%g2 + 4]%asi
	.word	0xd11e001d	! t1_kref+0x35ac:   	ldd	[%i0 + %i5], %f8
	.word	0x91a00544	! t1_kref+0x35b0:   	fsqrtd	%f4, %f8
	.word	0x81a9ca35	! t1_kref+0x35b4:   	fcmps	%fcc0, %f7, %f21
	.word	0x992d8016	! t1_kref+0x35b8:   	sll	%l6, %l6, %o4
	.word	0x98faaff7	! t1_kref+0x35bc:   	sdivcc	%o2, 0xff7, %o4
	.word	0x9fa0188b	! t1_kref+0x35c0:   	fitos	%f11, %f15
	.word	0xd856c019	! t1_kref+0x35c4:   	ldsh	[%i3 + %i1], %o4
	.word	0x97a00025	! t1_kref+0x35c8:   	fmovs	%f5, %f11
	.word	0x81844000	! t1_kref+0x35cc:   	wr	%l1, %g0, %y
	.word	0xc568a08e	! t1_kref+0x35d0:   	prefetch	%g2 + 0x8e, 2
	.word	0xa5b206a9	! t1_kref+0x35d4:   	fmul8x16al	%f8, %f9, %f18
	.word	0xcd80a03c	! t1_kref+0x35d8:   	lda	[%g2 + 0x3c]%asi, %f6
	.word	0xd700a01c	! t1_kref+0x35dc:   	ld	[%g2 + 0x1c], %f11
	.word	0x99b440dc	! t1_kref+0x35e0:   	edge16l	%l1, %i4, %o4
	.word	0x85a00548	! t1_kref+0x35e4:   	fsqrtd	%f8, %f2
	.word	0xd430001b	! t1_kref+0x35e8:   	sth	%o2, [%g0 + %i3]
	.word	0x98a47617	! t1_kref+0x35ec:   	subcc	%l1, -0x9e9, %o4
	.word	0xe91e4000	! t1_kref+0x35f0:   	ldd	[%i1], %f20
	.word	0x983ec000	! t1_kref+0x35f4:   	not	%i3, %o4
	.word	0x9de3bfa0	! t1_kref+0x35f8:   	save	%sp, -0x60, %sp
	.word	0x99ee401c	! t1_kref+0x35fc:   	restore	%i1, %i4, %o4
	.word	0xd80e200d	! t1_kref+0x3600:   	ldub	[%i0 + 0xd], %o4
	.word	0x98a33c6f	! t1_kref+0x3604:   	subcc	%o4, -0x391, %o4
	.word	0xc807bfec	! t1_kref+0x3608:   	ld	[%fp - 0x14], %g4
	.word	0x8da00154	! t1_kref+0x360c:   	fabsd	%f20, %f6
	.word	0xede8a0c1	! t1_kref+0x3610:   	prefetcha	%g2 + 0xc1, 22
	.word	0xa7a00026	! t1_kref+0x3614:   	fmovs	%f6, %f19
	.word	0x98f57176	! t1_kref+0x3618:   	udivcc	%l5, -0xe8a, %o4
	.word	0xd11fbc98	! t1_kref+0x361c:   	ldd	[%fp - 0x368], %f8
	.word	0x9f414000	! t1_kref+0x3620:   	mov	%pc, %o7
!	.word	0x394a0a77	! t1_kref+0x3624:   	fbuge,a,pt	%fcc0, SYM(t1_subr3)
	   	fbuge,a,pt	%fcc0, SYM(t1_subr3)
	.word	0x9db20f84	! t1_kref+0x3628:   	for	%f8, %f4, %f14
	.word	0x98fa400b	! t1_kref+0x362c:   	sdivcc	%o1, %o3, %o4
	.word	0xd078a00c	! t1_kref+0x3630:   	swap	[%g2 + 0xc], %o0
	.word	0x989560a0	! t1_kref+0x3634:   	orcc	%l5, 0xa0, %o4
	.word	0xe40861a8	! t1_kref+0x3638:   	ldub	[%g1 + 0x1a8], %l2
	.word	0xa41ca00c	! t1_kref+0x363c:   	xor	%l2, 0xc, %l2
	.word	0xe42861a8	! t1_kref+0x3640:   	stb	%l2, [%g1 + 0x1a8]
	.word	0x81d861a8	! t1_kref+0x3644:   	flush	%g1 + 0x1a8
	.word	0x99b70114	! t1_kref+0x3648:   	edge32	%i4, %l4, %o4
	.word	0xa3a01a2b	! t1_kref+0x364c:   	fstoi	%f11, %f17
	.word	0x8fa589b5	! t1_kref+0x3650:   	fdivs	%f22, %f21, %f7
	.word	0x986468ae	! t1_kref+0x3654:   	subc	%l1, 0x8ae, %o4
	.word	0x99b2844a	! t1_kref+0x3658:   	fcmpne16	%f10, %f10, %o4
	.word	0xc9ee5015	! t1_kref+0x365c:   	prefetcha	%i1 + %l5, 4
	.word	0xe1865000	! t1_kref+0x3660:   	lda	[%i1]0x80, %f16
	.word	0xd84e8018	! t1_kref+0x3664:   	ldsb	[%i2 + %i0], %o4
!	.word	0x2f4a0a66	! t1_kref+0x3668:   	fbu,a,pt	%fcc0, SYM(t1_subr3)
	   	fbu,a,pt	%fcc0, SYM(t1_subr3)
	.word	0x9f414000	! t1_kref+0x366c:   	mov	%pc, %o7
	.word	0x9da00542	! t1_kref+0x3670:   	fsqrtd	%f2, %f14
	.word	0xa9a01a3a	! t1_kref+0x3674:   	fstoi	%f26, %f20
	.word	0x3f480006	! t1_kref+0x3678:   	fbo,a,pt	%fcc0, _kref+0x3690
	.word	0x99b34280	! t1_kref+0x367c:   	array32	%o5, %g0, %o4
2:	.word	0xaba449a3	! t1_kref+0x3680:   	fdivs	%f17, %f3, %f21
	.word	0x81aa0a30	! t1_kref+0x3684:   	fcmps	%fcc0, %f8, %f16
	.word	0xa7a01a39	! t1_kref+0x3688:   	fstoi	%f25, %f19
	.word	0x97a00039	! t1_kref+0x368c:   	fmovs	%f25, %f11
	.word	0xa1a00552	! t1_kref+0x3690:   	fsqrtd	%f18, %f16
	.word	0x98dc6d5b	! t1_kref+0x3694:   	smulcc	%l1, 0xd5b, %o4
	.word	0x98bf38f5	! t1_kref+0x3698:   	xnorcc	%i4, -0x70b, %o4
	.word	0x3d480004	! t1_kref+0x369c:   	fbule,a,pt	%fcc0, _kref+0x36ac
	.word	0x8143c000	! t1_kref+0x36a0:   	stbar
	.word	0x98dd4000	! t1_kref+0x36a4:   	smulcc	%l5, %g0, %o4
	.word	0xd810a03c	! t1_kref+0x36a8:   	lduh	[%g2 + 0x3c], %o4
	.word	0x98ff3e81	! t1_kref+0x36ac:   	sdivcc	%i4, -0x17f, %o4
	.word	0xecb0a034	! t1_kref+0x36b0:   	stha	%l6, [%g2 + 0x34]%asi
	.word	0x993ce012	! t1_kref+0x36b4:   	sra	%l3, 0x12, %o4
	.word	0x983c400b	! t1_kref+0x36b8:   	xnor	%l1, %o3, %o4
	.word	0x989a800b	! t1_kref+0x36bc:   	xorcc	%o2, %o3, %o4
	.word	0x37480006	! t1_kref+0x36c0:   	fbge,a,pt	%fcc0, _kref+0x36d8
	.word	0x8143c000	! t1_kref+0x36c4:   	stbar
	.word	0x89b10918	! t1_kref+0x36c8:   	faligndata	%f4, %f24, %f4
	.word	0x9fa1c8b5	! t1_kref+0x36cc:   	fsubs	%f7, %f21, %f15
	.word	0xb1a01903	! t1_kref+0x36d0:   	fitod	%f3, %f24
	.word	0x81dc8008	! t1_kref+0x36d4:   	flush	%l2 + %o0
	.word	0x8185c000	! t1_kref+0x36d8:   	wr	%l7, %g0, %y
	.word	0x99a01914	! t1_kref+0x36dc:   	fitod	%f20, %f12
	.word	0x99027454	! t1_kref+0x36e0:   	taddcc	%o1, -0xbac, %o4
	.word	0xd626401c	! t1_kref+0x36e4:   	st	%o3, [%i1 + %i4]
	.word	0xe99f1a18	! t1_kref+0x36e8:   	ldda	[%i4 + %i0]0xd0, %f20
	.word	0xdaa01019	! t1_kref+0x36ec:   	sta	%o5, [%g0 + %i1]0x80
	.word	0x9de3bfa0	! t1_kref+0x36f0:   	save	%sp, -0x60, %sp
	.word	0xb8c6a2af	! t1_kref+0x36f4:   	addccc	%i2, 0x2af, %i4
	.word	0x99ef2723	! t1_kref+0x36f8:   	restore	%i4, 0x723, %o4
	.word	0x81a98ac4	! t1_kref+0x36fc:   	fcmped	%fcc0, %f6, %f4
	.word	0xb1b50a54	! t1_kref+0x3700:   	fpadd32	%f20, %f20, %f24
	.word	0x95a10937	! t1_kref+0x3704:   	fmuls	%f4, %f23, %f10
	.word	0xb1a01909	! t1_kref+0x3708:   	fitod	%f9, %f24
	.word	0x23800002	! t1_kref+0x370c:   	fbne,a	_kref+0x3714
	.word	0xd1bf5a19	! t1_kref+0x3710:   	stda	%f8, [%i5 + %i1]0xd0
	.word	0xe4086278	! t1_kref+0x3714:   	ldub	[%g1 + 0x278], %l2
	.word	0xa41ca00c	! t1_kref+0x3718:   	xor	%l2, 0xc, %l2
	.word	0xe4286278	! t1_kref+0x371c:   	stb	%l2, [%g1 + 0x278]
	.word	0x81d86278	! t1_kref+0x3720:   	flush	%g1 + 0x278
	.word	0xd8567fe4	! t1_kref+0x3724:   	ldsh	[%i1 - 0x1c], %o4
	.word	0x89a01a32	! t1_kref+0x3728:   	fstoi	%f18, %f4
	.word	0xd43f4018	! t1_kref+0x372c:   	std	%o2, [%i5 + %i0]
	.word	0xe1be1800	! t1_kref+0x3730:   	stda	%f16, [%i0]0xc0
	.word	0x98a72c3a	! t1_kref+0x3734:   	subcc	%i4, 0xc3a, %o4
	.word	0x3e800003	! t1_kref+0x3738:   	bvc,a	_kref+0x3744
	.word	0x9844c015	! t1_kref+0x373c:   	addc	%l3, %l5, %o4
	.word	0x8fa5c82f	! t1_kref+0x3740:   	fadds	%f23, %f15, %f7
	.word	0x001fffff	! t1_kref+0x3744:   	illtrap	0x1fffff
	.word	0x8da38848	! t1_kref+0x3748:   	faddd	%f14, %f8, %f6
	.word	0x89b40e39	! t1_kref+0x374c:   	fands	%f16, %f25, %f4
2:	.word	0xa5a00546	! t1_kref+0x3750:   	fsqrtd	%f6, %f18
	.word	0x993dc012	! t1_kref+0x3754:   	sra	%l7, %l2, %o4
	.word	0xc0780019	! t1_kref+0x3758:   	swap	[%g0 + %i1], %g0
	.word	0xc51e7fe0	! t1_kref+0x375c:   	ldd	[%i1 - 0x20], %f2
	.word	0x9864c00a	! t1_kref+0x3760:   	subc	%l3, %o2, %o4
	.word	0x99b10e50	! t1_kref+0x3764:   	fxnor	%f4, %f16, %f12
	.word	0x9ba94037	! t1_kref+0x3768:   	fmovsug	%fcc0, %f23, %f13
	.word	0xa9a5092d	! t1_kref+0x376c:   	fmuls	%f20, %f13, %f20
	.word	0x9da4c934	! t1_kref+0x3770:   	fmuls	%f19, %f20, %f14
	.word	0x81dec01c	! t1_kref+0x3774:   	flush	%i3 + %i4
	.word	0xd726001c	! t1_kref+0x3778:   	st	%f11, [%i0 + %i4]
	.word	0xe99eda58	! t1_kref+0x377c:   	ldda	[%i3 + %i0]0xd2, %f20
	.word	0x9925c00b	! t1_kref+0x3780:   	mulscc	%l7, %o3, %o4
	.word	0xd1be1817	! t1_kref+0x3784:   	stda	%f8, [%i0 + %l7]0xc0
	.word	0xb5a0003a	! t1_kref+0x3788:   	fmovs	%f26, %f26
	.word	0x99b50448	! t1_kref+0x378c:   	fcmpne16	%f20, %f8, %o4
	.word	0x9da0052b	! t1_kref+0x3790:   	fsqrts	%f11, %f14
	.word	0xa5b60a48	! t1_kref+0x3794:   	fpadd32	%f24, %f8, %f18
	.word	0x98550008	! t1_kref+0x3798:   	umul	%l4, %o0, %o4
	.word	0x9da0191a	! t1_kref+0x379c:   	fitod	%f26, %f14
	.word	0x99408000	! t1_kref+0x37a0:   	mov	%ccr, %o4
	.word	0x8bb40f6b	! t1_kref+0x37a4:   	fornot1s	%f16, %f11, %f5
	.word	0xd80e4000	! t1_kref+0x37a8:   	ldub	[%i1], %o4
	.word	0xd8563fee	! t1_kref+0x37ac:   	ldsh	[%i0 - 0x12], %o4
	.word	0x2b800005	! t1_kref+0x37b0:   	fbug,a	_kref+0x37c4
	.word	0xf8362000	! t1_kref+0x37b4:   	sth	%i4, [%i0]
	.word	0x8db38d10	! t1_kref+0x37b8:   	fandnot1	%f14, %f16, %f6
	.word	0x87b48a26	! t1_kref+0x37bc:   	fpadd16s	%f18, %f6, %f3
	.word	0xec3f4018	! t1_kref+0x37c0:   	std	%l6, [%i5 + %i0]
	.word	0xa5a6882d	! t1_kref+0x37c4:   	fadds	%f26, %f13, %f18
	.word	0xd80e0000	! t1_kref+0x37c8:   	ldub	[%i0], %o4
	.word	0xb1b00fc0	! t1_kref+0x37cc:   	fone	%f24
	.word	0xc7a0a02c	! t1_kref+0x37d0:   	sta	%f3, [%g2 + 0x2c]%asi
	.word	0x98a333d0	! t1_kref+0x37d4:   	subcc	%o4, -0xc30, %o4
	.word	0xa9a01898	! t1_kref+0x37d8:   	fitos	%f24, %f20
	.word	0x99b30280	! t1_kref+0x37dc:   	array32	%o4, %g0, %o4
	.word	0xa7a209b7	! t1_kref+0x37e0:   	fdivs	%f8, %f23, %f19
	.word	0x85a508ce	! t1_kref+0x37e4:   	fsubd	%f20, %f14, %f2
	.word	0x001fffff	! t1_kref+0x37e8:   	illtrap	0x1fffff
	.word	0xd888a00f	! t1_kref+0x37ec:   	lduba	[%g2 + 0xf]%asi, %o4
	.word	0x8ba18926	! t1_kref+0x37f0:   	fmuls	%f6, %f6, %f5
	.word	0xb3a018d8	! t1_kref+0x37f4:   	fdtos	%f24, %f25
	.word	0xe228a034	! t1_kref+0x37f8:   	stb	%l1, [%g2 + 0x34]
	.word	0x85b38a52	! t1_kref+0x37fc:   	fpadd32	%f14, %f18, %f2
	.word	0x98fa400c	! t1_kref+0x3800:   	sdivcc	%o1, %o4, %o4
	.word	0x989225fe	! t1_kref+0x3804:   	orcc	%o0, 0x5fe, %o4
	.word	0xe0680019	! t1_kref+0x3808:   	ldstub	[%g0 + %i1], %l0
	.word	0x21800007	! t1_kref+0x380c:   	fbn,a	_kref+0x3828
	.word	0xd8567fec	! t1_kref+0x3810:   	ldsh	[%i1 - 0x14], %o4
	.word	0xed3e6008	! t1_kref+0x3814:   	std	%f22, [%i1 + 8]
	.word	0xd856401b	! t1_kref+0x3818:   	ldsh	[%i1 + %i3], %o4
	.word	0x81df4017	! t1_kref+0x381c:   	flush	%i5 + %l7
	.word	0xa9a01a26	! t1_kref+0x3820:   	fstoi	%f6, %f20
	.word	0x99b68d40	! t1_kref+0x3824:   	fnot1	%f26, %f12
	.word	0x93a00529	! t1_kref+0x3828:   	fsqrts	%f9, %f9
	.word	0x19396807	! t1_kref+0x382c:   	sethi	%hi(0xe5a01c00), %o4
	.word	0xa786800a	! t1_kref+0x3830:   	wr	%i2, %o2, %gsr
	.word	0x99a48842	! t1_kref+0x3834:   	faddd	%f18, %f2, %f12
	.word	0xa3a00032	! t1_kref+0x3838:   	fmovs	%f18, %f17
	.word	0x98e26177	! t1_kref+0x383c:   	subccc	%o1, 0x177, %o4
	.word	0x981a6f9e	! t1_kref+0x3840:   	xor	%o1, 0xf9e, %o4
	.word	0xd42e8019	! t1_kref+0x3844:   	stb	%o2, [%i2 + %i1]
	.word	0x20480008	! t1_kref+0x3848:   	bn,a,pt	%icc, _kref+0x3868
	.word	0xedee101b	! t1_kref+0x384c:   	prefetcha	%i0 + %i3, 22
	.word	0xa5a60858	! t1_kref+0x3850:   	faddd	%f24, %f24, %f18
	.word	0x99418000	! t1_kref+0x3854:   	mov	%fprs, %o4
	.word	0x98d2a767	! t1_kref+0x3858:   	umulcc	%o2, 0x767, %o4
	.word	0xa1a0054a	! t1_kref+0x385c:   	fsqrtd	%f10, %f16
	.word	0x98e37c9e	! t1_kref+0x3860:   	subccc	%o5, -0x362, %o4
	.word	0x99b5054e	! t1_kref+0x3864:   	fcmpeq16	%f20, %f14, %o4
	.word	0xd6a8a00e	! t1_kref+0x3868:   	stba	%o3, [%g2 + 0xe]%asi
	.word	0xe828a00f	! t1_kref+0x386c:   	stb	%l4, [%g2 + 0xf]
	.word	0xada00548	! t1_kref+0x3870:   	fsqrtd	%f8, %f22
	sethi	%hi(2f), %o7
	.word	0xe40be0c0	! t1_kref+0x3878:   	ldub	[%o7 + 0xc0], %l2
	.word	0xa41ca00c	! t1_kref+0x387c:   	xor	%l2, 0xc, %l2
	.word	0xe42be0c0	! t1_kref+0x3880:   	stb	%l2, [%o7 + 0xc0]
	.word	0x81dbe0c0	! t1_kref+0x3884:   	flush	%o7 + 0xc0
	.word	0x29800007	! t1_kref+0x3888:   	fbl,a	_kref+0x38a4
	.word	0x9905c01a	! t1_kref+0x388c:   	taddcc	%l7, %i2, %o4
	.word	0x89b00768	! t1_kref+0x3890:   	fpack16	%f8, %f4
	.word	0x98f379a1	! t1_kref+0x3894:   	udivcc	%o5, -0x65f, %o4
	.word	0x99b6c353	! t1_kref+0x3898:   	alignaddrl	%i3, %l3, %o4
	.word	0x98128015	! t1_kref+0x389c:   	or	%o2, %l5, %o4
	.word	0xf3ee101b	! t1_kref+0x38a0:   	prefetcha	%i0 + %i3, 25
	.word	0x99b500d4	! t1_kref+0x38a4:   	edge16l	%l4, %l4, %o4
	.word	0x35800008	! t1_kref+0x38a8:   	fbue,a	_kref+0x38c8
	.word	0xc768a0c2	! t1_kref+0x38ac:   	prefetch	%g2 + 0xc2, 3
	.word	0x93a01a30	! t1_kref+0x38b0:   	fstoi	%f16, %f9
	.word	0xd8a0a014	! t1_kref+0x38b4:   	sta	%o4, [%g2 + 0x14]%asi
	.word	0x98948016	! t1_kref+0x38b8:   	orcc	%l2, %l6, %o4
	.word	0x89b38a8c	! t1_kref+0x38bc:   	fpsub16	%f14, %f12, %f4
2:	.word	0xdd3e7ff8	! t1_kref+0x38c0:   	std	%f14, [%i1 - 8]
	.word	0xd848a01f	! t1_kref+0x38c4:   	ldsb	[%g2 + 0x1f], %o4
	.word	0x98ba4015	! t1_kref+0x38c8:   	xnorcc	%o1, %l5, %o4
	.word	0xd828a01d	! t1_kref+0x38cc:   	stb	%o4, [%g2 + 0x1d]
	.word	0x99a00548	! t1_kref+0x38d0:   	fsqrtd	%f8, %f12
	.word	0x9de3bfa0	! t1_kref+0x38d4:   	save	%sp, -0x60, %sp
	.word	0x99ee7f4e	! t1_kref+0x38d8:   	restore	%i1, -0xb2, %o4
	.word	0x9835add0	! t1_kref+0x38dc:   	orn	%l6, 0xdd0, %o4
	.word	0x991b000d	! t1_kref+0x38e0:   	tsubcctv	%o4, %o5, %o4
	.word	0x91b38eee	! t1_kref+0x38e4:   	fornot2s	%f14, %f14, %f8
	.word	0x192b4096	! t1_kref+0x38e8:   	sethi	%hi(0xad025800), %o4
	.word	0xb5a01932	! t1_kref+0x38ec:   	fstod	%f18, %f26
	.word	0x99b000db	! t1_kref+0x38f0:   	edge16l	%g0, %i3, %o4
	.word	0xf320a034	! t1_kref+0x38f4:   	st	%f25, [%g2 + 0x34]
	.word	0x95a01a32	! t1_kref+0x38f8:   	fstoi	%f18, %f10
	.word	0x98f5e422	! t1_kref+0x38fc:   	udivcc	%l7, 0x422, %o4
	.word	0xb3a40935	! t1_kref+0x3900:   	fmuls	%f16, %f21, %f25
	.word	0x98f28008	! t1_kref+0x3904:   	udivcc	%o2, %o0, %o4
	.word	0xa5a0054a	! t1_kref+0x3908:   	fsqrtd	%f10, %f18
	.word	0xd8467ff4	! t1_kref+0x390c:   	ldsw	[%i1 - 0xc], %o4
	.word	0x8da01909	! t1_kref+0x3910:   	fitod	%f9, %f6
	.word	0x8bb00cee	! t1_kref+0x3914:   	fnot2s	%f14, %f5
	.word	0x9da309c8	! t1_kref+0x3918:   	fdivd	%f12, %f8, %f14
	.word	0xafa01a2b	! t1_kref+0x391c:   	fstoi	%f11, %f23
	.word	0x98e6c00b	! t1_kref+0x3920:   	subccc	%i3, %o3, %o4
	.word	0x3b800007	! t1_kref+0x3924:   	fble,a	_kref+0x3940
	.word	0xd51fbcc8	! t1_kref+0x3928:   	ldd	[%fp - 0x338], %f10
	.word	0xe2b0a036	! t1_kref+0x392c:   	stha	%l1, [%g2 + 0x36]%asi
	.word	0x9da00535	! t1_kref+0x3930:   	fsqrts	%f21, %f14
	.word	0x996123b9	! t1_kref+0x3934:   	movl	%fcc0, 0x3b9, %o4
	.word	0xdb267ff8	! t1_kref+0x3938:   	st	%f13, [%i1 - 8]
	.word	0x2c480004	! t1_kref+0x393c:   	bneg,a,pt	%icc, _kref+0x394c
	.word	0x99a01a2f	! t1_kref+0x3940:   	fstoi	%f15, %f12
	.word	0xf13e7fe8	! t1_kref+0x3944:   	std	%f24, [%i1 - 0x18]
	.word	0x98a03c1e	! t1_kref+0x3948:   	subcc	%g0, -0x3e2, %o4
	.word	0xe2ee7ffb	! t1_kref+0x394c:   	ldstuba	[%i1 - 5]%asi, %l1
	.word	0xd840a004	! t1_kref+0x3950:   	ldsw	[%g2 + 4], %o4
	.word	0x9940c000	! t1_kref+0x3954:   	mov	%asi, %o4
	.word	0x98d5a07f	! t1_kref+0x3958:   	umulcc	%l6, 0x7f, %o4
	.word	0x91b58a58	! t1_kref+0x395c:   	fpadd32	%f22, %f24, %f8
	.word	0xd846001c	! t1_kref+0x3960:   	ldsw	[%i0 + %i4], %o4
	.word	0x98bf3e1f	! t1_kref+0x3964:   	xnorcc	%i4, -0x1e1, %o4
	.word	0xefee501a	! t1_kref+0x3968:   	prefetcha	%i1 + %i2, 23
	.word	0xd9f6500a	! t1_kref+0x396c:   	casxa	[%i1]0x80, %o2, %o4
	.word	0x81850000	! t1_kref+0x3970:   	wr	%l4, %g0, %y
	.word	0x992ce006	! t1_kref+0x3974:   	sll	%l3, 0x6, %o4
	.word	0xd8062018	! t1_kref+0x3978:   	ld	[%i0 + 0x18], %o4
	.word	0x983223c3	! t1_kref+0x397c:   	orn	%o0, 0x3c3, %o4
	.word	0x99b58108	! t1_kref+0x3980:   	edge32	%l6, %o0, %o4
	.word	0x9926c01b	! t1_kref+0x3984:   	mulscc	%i3, %i3, %o4
	.word	0xf207bfe0	! t1_kref+0x3988:   	ld	[%fp - 0x20], %i1
	.word	0x3f480007	! t1_kref+0x398c:   	fbo,a,pt	%fcc0, _kref+0x39a8
	.word	0xda76001d	! t1_kref+0x3990:   	stx	%o5, [%i0 + %i5]
	.word	0x99a488b2	! t1_kref+0x3994:   	fsubs	%f18, %f18, %f12
	.word	0x98f5c000	! t1_kref+0x3998:   	udivcc	%l7, %g0, %o4
	.word	0xf4b0a01c	! t1_kref+0x399c:   	stha	%i2, [%g2 + 0x1c]%asi
	.word	0xe87e001c	! t1_kref+0x39a0:   	swap	[%i0 + %i4], %l4
	.word	0x993c401c	! t1_kref+0x39a4:   	sra	%l1, %i4, %o4
	.word	0xafa01a2b	! t1_kref+0x39a8:   	fstoi	%f11, %f23
	.word	0xd9e61000	! t1_kref+0x39ac:   	casa	[%i0]0x80, %g0, %o4
	.word	0x3b800001	! t1_kref+0x39b0:   	fble,a	_kref+0x39b4
	.word	0x9da01a23	! t1_kref+0x39b4:   	fstoi	%f3, %f14
	.word	0xd856001b	! t1_kref+0x39b8:   	ldsh	[%i0 + %i3], %o4
	.word	0xa1a00135	! t1_kref+0x39bc:   	fabss	%f21, %f16
	.word	0x28480002	! t1_kref+0x39c0:   	bleu,a,pt	%icc, _kref+0x39c8
	.word	0xd53e3fe8	! t1_kref+0x39c4:   	std	%f10, [%i0 - 0x18]
	.word	0x9846c012	! t1_kref+0x39c8:   	addc	%i3, %l2, %o4
	.word	0x98820012	! t1_kref+0x39cc:   	addcc	%o0, %l2, %o4
	.word	0x89b18916	! t1_kref+0x39d0:   	faligndata	%f6, %f22, %f4
	.word	0x8ba00523	! t1_kref+0x39d4:   	fsqrts	%f3, %f5
	.word	0xa5b58aef	! t1_kref+0x39d8:   	fpsub32s	%f22, %f15, %f18
	.word	0x9fa01887	! t1_kref+0x39dc:   	fitos	%f7, %f15
	.word	0x95a01884	! t1_kref+0x39e0:   	fitos	%f4, %f10
	.word	0x8582bcd2	! t1_kref+0x39e4:   	wr	%o2, 0xfffffcd2, %ccr
	.word	0xb3a01a29	! t1_kref+0x39e8:   	fstoi	%f9, %f25
	.word	0x988ec00d	! t1_kref+0x39ec:   	andcc	%i3, %o5, %o4
	.word	0x9db38738	! t1_kref+0x39f0:   	fmuld8ulx16	%f14, %f24, %f14
	.word	0x98973d36	! t1_kref+0x39f4:   	orcc	%i4, -0x2ca, %o4
	.word	0x89a00525	! t1_kref+0x39f8:   	fsqrts	%f5, %f4
	.word	0xc41f4005	! t1_kref+0x39fc:   	ldd	[%i5 + %g5], %g2
	.word	0x9da2c927	! t1_kref+0x3a00:   	fmuls	%f11, %f7, %f14
	.word	0x9855ffc0	! t1_kref+0x3a04:   	umul	%l7, -0x40, %o4
	.word	0x95b28a92	! t1_kref+0x3a08:   	fpsub16	%f10, %f18, %f10
	.word	0x99400000	! t1_kref+0x3a0c:   	mov	%y, %o4
	.word	0x99b6c317	! t1_kref+0x3a10:   	alignaddr	%i3, %l7, %o4
	.word	0xd8564000	! t1_kref+0x3a14:   	ldsh	[%i1], %o4
	.word	0xa5a48829	! t1_kref+0x3a18:   	fadds	%f18, %f9, %f18
	.word	0x9816bd52	! t1_kref+0x3a1c:   	or	%i2, -0x2ae, %o4
	.word	0x3a480002	! t1_kref+0x3a20:   	bcc,a,pt	%icc, _kref+0x3a28
	.word	0x93b30df2	! t1_kref+0x3a24:   	fnands	%f12, %f18, %f9
	.word	0xaba01a54	! t1_kref+0x3a28:   	fdtoi	%f20, %f21
	.word	0x98358015	! t1_kref+0x3a2c:   	orn	%l6, %l5, %o4
	.word	0xd8563fe2	! t1_kref+0x3a30:   	ldsh	[%i0 - 0x1e], %o4
	.word	0x23800004	! t1_kref+0x3a34:   	fbne,a	_kref+0x3a44
	.word	0xee28a037	! t1_kref+0x3a38:   	stb	%l7, [%g2 + 0x37]
	.word	0x89a01a39	! t1_kref+0x3a3c:   	fstoi	%f25, %f4
	.word	0xafa60935	! t1_kref+0x3a40:   	fmuls	%f24, %f21, %f23
	.word	0x9ba01a2d	! t1_kref+0x3a44:   	fstoi	%f13, %f13
	.word	0x989aa2d2	! t1_kref+0x3a48:   	xorcc	%o2, 0x2d2, %o4
	.word	0x81aa0ac8	! t1_kref+0x3a4c:   	fcmped	%fcc0, %f8, %f8
	.word	0x97a3c82f	! t1_kref+0x3a50:   	fadds	%f15, %f15, %f11
	.word	0x98c2fcb9	! t1_kref+0x3a54:   	addccc	%o3, -0x347, %o4
	.word	0xd2300018	! t1_kref+0x3a58:   	sth	%o1, [%g0 + %i0]
	.word	0x98430012	! t1_kref+0x3a5c:   	addc	%o4, %l2, %o4
	.word	0xd03e7ff8	! t1_kref+0x3a60:   	std	%o0, [%i1 - 8]
	.word	0xf6a0a034	! t1_kref+0x3a64:   	sta	%i3, [%g2 + 0x34]%asi
	.word	0xa1a00558	! t1_kref+0x3a68:   	fsqrtd	%f24, %f16
	.word	0xf207bfe0	! t1_kref+0x3a6c:   	ld	[%fp - 0x20], %i1
	.word	0xd0b0a03e	! t1_kref+0x3a70:   	stha	%o0, [%g2 + 0x3e]%asi
	.word	0x98068011	! t1_kref+0x3a74:   	add	%i2, %l1, %o4
	.word	0xd9e61000	! t1_kref+0x3a78:   	casa	[%i0]0x80, %g0, %o4
	.word	0x98f46363	! t1_kref+0x3a7c:   	udivcc	%l1, 0x363, %o4
	.word	0x37800004	! t1_kref+0x3a80:   	fbge,a	_kref+0x3a90
	.word	0xc7866018	! t1_kref+0x3a84:   	lda	[%i1 + 0x18]%asi, %f3
	.word	0x99400000	! t1_kref+0x3a88:   	mov	%y, %o4
	.word	0xe9be188b	! t1_kref+0x3a8c:   	stda	%f20, [%i0 + %o3]0xc4
	call	SYM(t1_subr0)
	.word	0x99b485d4	! t1_kref+0x3a94:   	fcmpeq32	%f18, %f20, %o4
	.word	0xabb40de6	! t1_kref+0x3a98:   	fnands	%f16, %f6, %f21
	.word	0xa3a01893	! t1_kref+0x3a9c:   	fitos	%f19, %f17
	.word	0xe40865e0	! t1_kref+0x3aa0:   	ldub	[%g1 + 0x5e0], %l2
	.word	0xa41ca00c	! t1_kref+0x3aa4:   	xor	%l2, 0xc, %l2
	.word	0xe42865e0	! t1_kref+0x3aa8:   	stb	%l2, [%g1 + 0x5e0]
	.word	0x81d865e0	! t1_kref+0x3aac:   	flush	%g1 + 0x5e0
	.word	0xadb30d40	! t1_kref+0x3ab0:   	fnot1	%f12, %f22
	.word	0xd848a01f	! t1_kref+0x3ab4:   	ldsb	[%g2 + 0x1f], %o4
2:	.word	0xb3a4c92c	! t1_kref+0x3ab8:   	fmuls	%f19, %f12, %f25
	.word	0x982a801c	! t1_kref+0x3abc:   	andn	%o2, %i4, %o4
	.word	0x98c33139	! t1_kref+0x3ac0:   	addccc	%o4, -0xec7, %o4
	.word	0xe11fbcd0	! t1_kref+0x3ac4:   	ldd	[%fp - 0x330], %f16
	.word	0x29800002	! t1_kref+0x3ac8:   	fbl,a	_kref+0x3ad0
	.word	0x993b201e	! t1_kref+0x3acc:   	sra	%o4, 0x1e, %o4
	.word	0x9826afce	! t1_kref+0x3ad0:   	sub	%i2, 0xfce, %o4
	.word	0x8d8577b9	! t1_kref+0x3ad4:   	wr	%l5, 0xfffff7b9, %fprs
	.word	0xc168a00a	! t1_kref+0x3ad8:   	prefetch	%g2 + 0xa, 0
	.word	0x98f80011	! t1_kref+0x3adc:   	sdivcc	%g0, %l1, %o4
	.word	0x9da00552	! t1_kref+0x3ae0:   	fsqrtd	%f18, %f14
	.word	0x98b4ab5f	! t1_kref+0x3ae4:   	orncc	%l2, 0xb5f, %o4
	.word	0x81dac011	! t1_kref+0x3ae8:   	flush	%o3 + %l1
	.word	0x9da000ce	! t1_kref+0x3aec:   	fnegd	%f14, %f14
	.word	0x81a94aad	! t1_kref+0x3af0:   	fcmpes	%fcc0, %f5, %f13
	.word	0xd93e3fe8	! t1_kref+0x3af4:   	std	%f12, [%i0 - 0x18]
	.word	0x98652128	! t1_kref+0x3af8:   	subc	%l4, 0x128, %o4
	.word	0xd6b0a004	! t1_kref+0x3afc:   	stha	%o3, [%g2 + 4]%asi
	.word	0xd8c8a02e	! t1_kref+0x3b00:   	ldsba	[%g2 + 0x2e]%asi, %o4
	.word	0x8ba5c92a	! t1_kref+0x3b04:   	fmuls	%f23, %f10, %f5
	.word	0x8fa01a52	! t1_kref+0x3b08:   	fdtoi	%f18, %f7
	sethi	%hi(2f), %o7
	.word	0xe40be344	! t1_kref+0x3b10:   	ldub	[%o7 + 0x344], %l2
	.word	0xa41ca00c	! t1_kref+0x3b14:   	xor	%l2, 0xc, %l2
	.word	0xe42be344	! t1_kref+0x3b18:   	stb	%l2, [%o7 + 0x344]
	.word	0x81dbe344	! t1_kref+0x3b1c:   	flush	%o7 + 0x344
	.word	0x33800001	! t1_kref+0x3b20:   	fbe,a	_kref+0x3b24
	.word	0x98624013	! t1_kref+0x3b24:   	subc	%o1, %l3, %o4
	.word	0xd43e7ff8	! t1_kref+0x3b28:   	std	%o2, [%i1 - 8]
	.word	0x99250011	! t1_kref+0x3b2c:   	mulscc	%l4, %l1, %o4
	.word	0xe67e401c	! t1_kref+0x3b30:   	swap	[%i1 + %i4], %l3
	.word	0x99a0052a	! t1_kref+0x3b34:   	fsqrts	%f10, %f12
	.word	0xd880a00c	! t1_kref+0x3b38:   	lda	[%g2 + 0xc]%asi, %o4
	.word	0x9895f8b8	! t1_kref+0x3b3c:   	orcc	%l7, -0x748, %o4
	.word	0xd4b0a00e	! t1_kref+0x3b40:   	stha	%o2, [%g2 + 0xe]%asi
2:	.word	0xe026401c	! t1_kref+0x3b44:   	st	%l0, [%i1 + %i4]
	.word	0xf9ee501c	! t1_kref+0x3b48:   	prefetcha	%i1 + %i4, 28
	.word	0x29480002	! t1_kref+0x3b4c:   	fbl,a,pt	%fcc0, _kref+0x3b54
	.word	0x99083451	! t1_kref+0x3b50:   	tsubcc	%g0, -0xbaf, %o4
	.word	0x2a480001	! t1_kref+0x3b54:   	bcs,a,pt	%icc, _kref+0x3b58
	.word	0xb5a00550	! t1_kref+0x3b58:   	fsqrtd	%f16, %f26
	.word	0xc51e4000	! t1_kref+0x3b5c:   	ldd	[%i1], %f2
	.word	0xd810a014	! t1_kref+0x3b60:   	lduh	[%g2 + 0x14], %o4
	.word	0x9f414000	! t1_kref+0x3b64:   	mov	%pc, %o7
	.word	0x91b58ac4	! t1_kref+0x3b68:   	fpsub32	%f22, %f4, %f8
	.word	0x98bd2782	! t1_kref+0x3b6c:   	xnorcc	%l4, 0x782, %o4
	.word	0x81ad8a2b	! t1_kref+0x3b70:   	fcmps	%fcc0, %f22, %f11
	.word	0x990d8014	! t1_kref+0x3b74:   	tsubcc	%l6, %l4, %o4
	.word	0x99b24117	! t1_kref+0x3b78:   	edge32	%o1, %l7, %o4
	.word	0x3d800002	! t1_kref+0x3b7c:   	fbule,a	_kref+0x3b84
	.word	0x983ac00d	! t1_kref+0x3b80:   	xnor	%o3, %o5, %o4
	.word	0x97a0052d	! t1_kref+0x3b84:   	fsqrts	%f13, %f11
	.word	0xa9b38e58	! t1_kref+0x3b88:   	fxnor	%f14, %f24, %f20
	.word	0xf1a0a03c	! t1_kref+0x3b8c:   	sta	%f24, [%g2 + 0x3c]%asi
	.word	0xb1a48856	! t1_kref+0x3b90:   	faddd	%f18, %f22, %f24
	.word	0x37800002	! t1_kref+0x3b94:   	fbge,a	_kref+0x3b9c
	.word	0xecbe2010	! t1_kref+0x3b98:   	stda	%l6, [%i0 + 0x10]%asi
	.word	0x81aa0ab2	! t1_kref+0x3b9c:   	fcmpes	%fcc0, %f8, %f18
	.word	0xe828a025	! t1_kref+0x3ba0:   	stb	%l4, [%g2 + 0x25]
	.word	0x97a3492c	! t1_kref+0x3ba4:   	fmuls	%f13, %f12, %f11
	.word	0xb6103fea	! t1_kref+0x3ba8:   	mov	0xffffffea, %i3
	.word	0x2f480008	! t1_kref+0x3bac:   	fbu,a,pt	%fcc0, _kref+0x3bcc
	.word	0xed68a0c1	! t1_kref+0x3bb0:   	prefetch	%g2 + 0xc1, 22
	.word	0xd856601e	! t1_kref+0x3bb4:   	ldsh	[%i1 + 0x1e], %o4
	.word	0x34480006	! t1_kref+0x3bb8:   	bg,a,pt	%icc, _kref+0x3bd0
	.word	0xa9b60ea0	! t1_kref+0x3bbc:   	fsrc1s	%f24, %f20
	.word	0x93a00530	! t1_kref+0x3bc0:   	fsqrts	%f16, %f9
	.word	0x9925ad45	! t1_kref+0x3bc4:   	mulscc	%l6, 0xd45, %o4
	.word	0xa5a01918	! t1_kref+0x3bc8:   	fitod	%f24, %f18
	.word	0xd8070019	! t1_kref+0x3bcc:   	ld	[%i4 + %i1], %o4
	.word	0x1919e53b	! t1_kref+0x3bd0:   	sethi	%hi(0x6794ec00), %o4
	.word	0x99b54077	! t1_kref+0x3bd4:   	edge8ln	%l5, %l7, %o4
	.word	0xd8000019	! t1_kref+0x3bd8:   	ld	[%g0 + %i1], %o4
	call	SYM(t1_subr2)
	.word	0xf4f63ff0	! t1_kref+0x3be0:   	stxa	%i2, [%i0 - 0x10]%asi
	.word	0x95b38d40	! t1_kref+0x3be4:   	fnot1	%f14, %f10
	.word	0x37480001	! t1_kref+0x3be8:   	fbge,a,pt	%fcc0, _kref+0x3bec
	.word	0xa1b30d10	! t1_kref+0x3bec:   	fandnot1	%f12, %f16, %f16
	.word	0xd890105b	! t1_kref+0x3bf0:   	lduha	[%g0 + %i3]0x82, %o4
	.word	0xa9a01899	! t1_kref+0x3bf4:   	fitos	%f25, %f20
	.word	0xb5a01a44	! t1_kref+0x3bf8:   	fdtoi	%f4, %f26
	.word	0xe9be1897	! t1_kref+0x3bfc:   	stda	%f20, [%i0 + %l7]0xc4
	.word	0x985ac01a	! t1_kref+0x3c00:   	smul	%o3, %i2, %o4
	.word	0x992ca004	! t1_kref+0x3c04:   	sll	%l2, 0x4, %o4
	.word	0x81dac01d	! t1_kref+0x3c08:   	flush	%o3 + %i5
	.word	0x983a20c1	! t1_kref+0x3c0c:   	xnor	%o0, 0xc1, %o4
	.word	0xd2ff1019	! t1_kref+0x3c10:   	swapa	[%i4 + %i1]0x80, %o1
	.word	0xd8a8a017	! t1_kref+0x3c14:   	stba	%o4, [%g2 + 0x17]%asi
	.word	0x98334008	! t1_kref+0x3c18:   	orn	%o5, %o0, %o4
	.word	0xd2263ff8	! t1_kref+0x3c1c:   	st	%o1, [%i0 - 8]
	.word	0x89a01935	! t1_kref+0x3c20:   	fstod	%f21, %f4
	.word	0xd27e7ff8	! t1_kref+0x3c24:   	swap	[%i1 - 8], %o1
	call	SYM(t1_subr0)
	.word	0xd91fbfd0	! t1_kref+0x3c2c:   	ldd	[%fp - 0x30], %f12
	.word	0xd856600a	! t1_kref+0x3c30:   	ldsh	[%i1 + 0xa], %o4
	.word	0xe51fbd20	! t1_kref+0x3c34:   	ldd	[%fp - 0x2e0], %f18
	.word	0x9924c013	! t1_kref+0x3c38:   	mulscc	%l3, %l3, %o4
	.word	0x983d800d	! t1_kref+0x3c3c:   	xnor	%l6, %o5, %o4
	.word	0x37800002	! t1_kref+0x3c40:   	fbge,a	_kref+0x3c48
	.word	0x87a01a29	! t1_kref+0x3c44:   	fstoi	%f9, %f3
	.word	0x19225c5c	! t1_kref+0x3c48:   	sethi	%hi(0x89717000), %o4
	.word	0x98a34017	! t1_kref+0x3c4c:   	subcc	%o5, %l7, %o4
	.word	0xc9266000	! t1_kref+0x3c50:   	st	%f4, [%i1]
	.word	0x98148013	! t1_kref+0x3c54:   	or	%l2, %l3, %o4
	.word	0xe820a03c	! t1_kref+0x3c58:   	st	%l4, [%g2 + 0x3c]
	.word	0xd890a014	! t1_kref+0x3c5c:   	lduha	[%g2 + 0x14]%asi, %o4
	.word	0xf4262004	! t1_kref+0x3c60:   	st	%i2, [%i0 + 4]
	.word	0x2d800002	! t1_kref+0x3c64:   	fbg,a	_kref+0x3c6c
	.word	0x98e30011	! t1_kref+0x3c68:   	subccc	%o4, %l1, %o4
	.word	0x99b7006d	! t1_kref+0x3c6c:   	edge8ln	%i4, %o5, %o4
	.word	0x98957053	! t1_kref+0x3c70:   	orcc	%l5, -0xfad, %o4
	.word	0xe40867c4	! t1_kref+0x3c74:   	ldub	[%g1 + 0x7c4], %l2
	.word	0xa41ca00c	! t1_kref+0x3c78:   	xor	%l2, 0xc, %l2
	.word	0xe42867c4	! t1_kref+0x3c7c:   	stb	%l2, [%g1 + 0x7c4]
	.word	0x81d867c4	! t1_kref+0x3c80:   	flush	%g1 + 0x7c4
	.word	0x81dab476	! t1_kref+0x3c84:   	flush	%o2 - 0xb8a
	.word	0xd8d0a006	! t1_kref+0x3c88:   	ldsha	[%g2 + 6]%asi, %o4
	.word	0xf420a02c	! t1_kref+0x3c8c:   	st	%i2, [%g2 + 0x2c]
	.word	0xd80e8019	! t1_kref+0x3c90:   	ldub	[%i2 + %i1], %o4
	.word	0xa9ab4046	! t1_kref+0x3c94:   	fmovdle	%fcc0, %f6, %f20
	.word	0x99408000	! t1_kref+0x3c98:   	mov	%ccr, %o4
2:	.word	0xa3a58927	! t1_kref+0x3c9c:   	fmuls	%f22, %f7, %f17
	.word	0xdd070019	! t1_kref+0x3ca0:   	ld	[%i4 + %i1], %f14
	.word	0xe408680c	! t1_kref+0x3ca4:   	ldub	[%g1 + 0x80c], %l2
	.word	0xa41ca00c	! t1_kref+0x3ca8:   	xor	%l2, 0xc, %l2
	.word	0xe428680c	! t1_kref+0x3cac:   	stb	%l2, [%g1 + 0x80c]
	.word	0x81d8680c	! t1_kref+0x3cb0:   	flush	%g1 + 0x80c
	call	SYM(t1_subr0)
	.word	0x98e70011	! t1_kref+0x3cb8:   	subccc	%i4, %l1, %o4
	.word	0x98f6800a	! t1_kref+0x3cbc:   	udivcc	%i2, %o2, %o4
	.word	0x9da00025	! t1_kref+0x3cc0:   	fmovs	%f5, %f14
	.word	0x98c569f8	! t1_kref+0x3cc4:   	addccc	%l5, 0x9f8, %o4
	.word	0x81a88ace	! t1_kref+0x3cc8:   	fcmped	%fcc0, %f2, %f14
	.word	0xd850a00c	! t1_kref+0x3ccc:   	ldsh	[%g2 + 0xc], %o4
	.word	0x98b80017	! t1_kref+0x3cd0:   	xnorcc	%g0, %l7, %o4
	.word	0x9845be9c	! t1_kref+0x3cd4:   	addc	%l6, -0x164, %o4
	.word	0x98fca727	! t1_kref+0x3cd8:   	sdivcc	%l2, 0x727, %o4
	.word	0x993d801b	! t1_kref+0x3cdc:   	sra	%l6, %i3, %o4
	.word	0x98b30000	! t1_kref+0x3ce0:   	orncc	%o4, %g0, %o4
2:	.word	0xd8d0105b	! t1_kref+0x3ce4:   	ldsha	[%g0 + %i3]0x82, %o4
	.word	0x9865000a	! t1_kref+0x3ce8:   	subc	%l4, %o2, %o4
	.word	0xd436401b	! t1_kref+0x3cec:   	sth	%o2, [%i1 + %i3]
	.word	0x2f800003	! t1_kref+0x3cf0:   	fbu,a	_kref+0x3cfc
	.word	0xd8c8a00e	! t1_kref+0x3cf4:   	ldsba	[%g2 + 0xe]%asi, %o4
	.word	0xc1ee101a	! t1_kref+0x3cf8:   	prefetcha	%i0 + %i2, 0
	.word	0xb5b50a2a	! t1_kref+0x3cfc:   	fpadd16s	%f20, %f10, %f26
	.word	0xec20a014	! t1_kref+0x3d00:   	st	%l6, [%g2 + 0x14]
	.word	0x9815f7b7	! t1_kref+0x3d04:   	or	%l7, -0x849, %o4
	.word	0x98958000	! t1_kref+0x3d08:   	orcc	%l6, %g0, %o4
	.word	0xe81e2008	! t1_kref+0x3d0c:   	ldd	[%i0 + 8], %l4
	.word	0xd84e200b	! t1_kref+0x3d10:   	ldsb	[%i0 + 0xb], %o4
	.word	0xee30a034	! t1_kref+0x3d14:   	sth	%l7, [%g2 + 0x34]
	.word	0xadb48dea	! t1_kref+0x3d18:   	fnands	%f18, %f10, %f22
	.word	0x9fa0052f	! t1_kref+0x3d1c:   	fsqrts	%f15, %f15
	.word	0xc9ee5000	! t1_kref+0x3d20:   	prefetcha	%i1, 4
	.word	0x87a0188a	! t1_kref+0x3d24:   	fitos	%f10, %f3
	.word	0x9fa00523	! t1_kref+0x3d28:   	fsqrts	%f3, %f15
	.word	0x99a00558	! t1_kref+0x3d2c:   	fsqrtd	%f24, %f12
	.word	0xe726401c	! t1_kref+0x3d30:   	st	%f19, [%i1 + %i4]
	.word	0xc9be1a1c	! t1_kref+0x3d34:   	stda	%f4, [%i0 + %i4]0xd0
	.word	0xed20a01c	! t1_kref+0x3d38:   	st	%f22, [%g2 + 0x1c]
	call	SYM(t1_subr1)
	.word	0xc1ee100c	! t1_kref+0x3d40:   	prefetcha	%i0 + %o4, 0
	.word	0x9805e68a	! t1_kref+0x3d44:   	add	%l7, 0x68a, %o4
	.word	0xd80e2019	! t1_kref+0x3d48:   	ldub	[%i0 + 0x19], %o4
	.word	0xd8c8a034	! t1_kref+0x3d4c:   	ldsba	[%g2 + 0x34]%asi, %o4
	.word	0xada0190a	! t1_kref+0x3d50:   	fitod	%f10, %f22
	.word	0xd8064000	! t1_kref+0x3d54:   	ld	[%i1], %o4
	.word	0x98aa2c4b	! t1_kref+0x3d58:   	andncc	%o0, 0xc4b, %o4
	.word	0x99400000	! t1_kref+0x3d5c:   	mov	%y, %o4
	.word	0x8db38d40	! t1_kref+0x3d60:   	fnot1	%f14, %f6
	.word	0xa1b50f8a	! t1_kref+0x3d64:   	for	%f20, %f10, %f16
	.word	0xb5a018d2	! t1_kref+0x3d68:   	fdtos	%f18, %f26
	.word	0x87a01a4a	! t1_kref+0x3d6c:   	fdtoi	%f10, %f3
	.word	0x99b38444	! t1_kref+0x3d70:   	fcmpne16	%f14, %f4, %o4
	.word	0x98f5c008	! t1_kref+0x3d74:   	udivcc	%l7, %o0, %o4
	.word	0x95a0055a	! t1_kref+0x3d78:   	fsqrtd	%f26, %f10
	.word	0x81dec01f	! t1_kref+0x3d7c:   	flush	%i3 + %i7
	.word	0x982d400c	! t1_kref+0x3d80:   	andn	%l5, %o4, %o4
	.word	0x982ab82f	! t1_kref+0x3d84:   	andn	%o2, -0x7d1, %o4
	.word	0xa5b00c20	! t1_kref+0x3d88:   	fzeros	%f18
	.word	0x99a00552	! t1_kref+0x3d8c:   	fsqrtd	%f18, %f12
	.word	0x9845801c	! t1_kref+0x3d90:   	addc	%l6, %i4, %o4
	.word	0xefe65015	! t1_kref+0x3d94:   	casa	[%i1]0x80, %l5, %l7
	.word	0xed1e2018	! t1_kref+0x3d98:   	ldd	[%i0 + 0x18], %f22
	.word	0x3b480004	! t1_kref+0x3d9c:   	fble,a,pt	%fcc0, _kref+0x3dac
	.word	0x9bb2cae5	! t1_kref+0x3da0:   	fpsub32s	%f11, %f5, %f13
	.word	0x81ad0a35	! t1_kref+0x3da4:   	fcmps	%fcc0, %f20, %f21
	.word	0x9855b8fe	! t1_kref+0x3da8:   	umul	%l6, -0x702, %o4
	.word	0x21480008	! t1_kref+0x3dac:   	fbn,a,pt	%fcc0, _kref+0x3dcc
	.word	0x9802c00d	! t1_kref+0x3db0:   	add	%o3, %o5, %o4
	.word	0x992ae002	! t1_kref+0x3db4:   	sll	%o3, 0x2, %o4
	.word	0xa5a0c925	! t1_kref+0x3db8:   	fmuls	%f3, %f5, %f18
	.word	0x8182c000	! t1_kref+0x3dbc:   	wr	%o3, %g0, %y
	.word	0x9814400a	! t1_kref+0x3dc0:   	or	%l1, %o2, %o4
	.word	0x37800002	! t1_kref+0x3dc4:   	fbge,a	_kref+0x3dcc
	.word	0x982a8016	! t1_kref+0x3dc8:   	andn	%o2, %l6, %o4
	.word	0xeda0a024	! t1_kref+0x3dcc:   	sta	%f22, [%g2 + 0x24]%asi
	.word	0xd80e7ff2	! t1_kref+0x3dd0:   	ldub	[%i1 - 0xe], %o4
	.word	0xc1e8a0c6	! t1_kref+0x3dd4:   	prefetcha	%g2 + 0xc6, 0
	.word	0x87b64ab5	! t1_kref+0x3dd8:   	fpsub16s	%f25, %f21, %f3
	.word	0x98e6b67b	! t1_kref+0x3ddc:   	subccc	%i2, -0x985, %o4
	sethi	%hi(2f), %o7
	.word	0xe40be218	! t1_kref+0x3de4:   	ldub	[%o7 + 0x218], %l2
	.word	0xa41ca00c	! t1_kref+0x3de8:   	xor	%l2, 0xc, %l2
	.word	0xe42be218	! t1_kref+0x3dec:   	stb	%l2, [%o7 + 0x218]
	.word	0x81dbe218	! t1_kref+0x3df0:   	flush	%o7 + 0x218
	.word	0xb1a58856	! t1_kref+0x3df4:   	faddd	%f22, %f22, %f24
	.word	0x97a00127	! t1_kref+0x3df8:   	fabss	%f7, %f11
	.word	0x89b00fc0	! t1_kref+0x3dfc:   	fone	%f4
	.word	0xd848a024	! t1_kref+0x3e00:   	ldsb	[%g2 + 0x24], %o4
	.word	0xd8500019	! t1_kref+0x3e04:   	ldsh	[%g0 + %i1], %o4
	.word	0xc807bfe4	! t1_kref+0x3e08:   	ld	[%fp - 0x1c], %g4
	.word	0x99b30280	! t1_kref+0x3e0c:   	array32	%o4, %g0, %o4
	.word	0x81ac0ac2	! t1_kref+0x3e10:   	fcmped	%fcc0, %f16, %f2
	.word	0xe230a036	! t1_kref+0x3e14:   	sth	%l1, [%g2 + 0x36]
2:	.word	0xd806601c	! t1_kref+0x3e18:   	ld	[%i1 + 0x1c], %o4
	.word	0x89a00527	! t1_kref+0x3e1c:   	fsqrts	%f7, %f4
	.word	0x81ddb9ff	! t1_kref+0x3e20:   	flush	%l6 - 0x601
	.word	0xebe65009	! t1_kref+0x3e24:   	casa	[%i1]0x80, %o1, %l5
	.word	0x8fa01a58	! t1_kref+0x3e28:   	fdtoi	%f24, %f7
	.word	0xcf00a024	! t1_kref+0x3e2c:   	ld	[%g2 + 0x24], %f7
	.word	0x99b40f92	! t1_kref+0x3e30:   	for	%f16, %f18, %f12
	.word	0x37800001	! t1_kref+0x3e34:   	fbge,a	_kref+0x3e38
	.word	0xd856c018	! t1_kref+0x3e38:   	ldsh	[%i3 + %i0], %o4
	.word	0xe168a0c9	! t1_kref+0x3e3c:   	prefetch	%g2 + 0xc9, 16
	.word	0x992ca010	! t1_kref+0x3e40:   	sll	%l2, 0x10, %o4
	.word	0xa7a01a5a	! t1_kref+0x3e44:   	fdtoi	%f26, %f19
	.word	0x991026f8	! t1_kref+0x3e48:   	taddcctv	%g0, 0x6f8, %o4
	.word	0xd8c8a00e	! t1_kref+0x3e4c:   	ldsba	[%g2 + 0xe]%asi, %o4
	.word	0xa1a409c8	! t1_kref+0x3e50:   	fdivd	%f16, %f8, %f16
	.word	0xf8b0a02e	! t1_kref+0x3e54:   	stha	%i4, [%g2 + 0x2e]%asi
	.word	0x98d2e4c2	! t1_kref+0x3e58:   	umulcc	%o3, 0x4c2, %o4
	.word	0x98c4a8b5	! t1_kref+0x3e5c:   	addccc	%l2, 0x8b5, %o4
	.word	0x95b10aa3	! t1_kref+0x3e60:   	fpsub16s	%f4, %f3, %f10
	.word	0xb5b00c00	! t1_kref+0x3e64:   	fzero	%f26
	.word	0xb3b0ce24	! t1_kref+0x3e68:   	fands	%f3, %f4, %f25
	.word	0x98058016	! t1_kref+0x3e6c:   	add	%l6, %l6, %o4
	.word	0xec3e2018	! t1_kref+0x3e70:   	std	%l6, [%i0 + 0x18]
	.word	0x91a94032	! t1_kref+0x3e74:   	fmovsug	%fcc0, %f18, %f8
	sethi	%hi(2f), %o7
	.word	0xe40be29c	! t1_kref+0x3e7c:   	ldub	[%o7 + 0x29c], %l2
	.word	0xa41ca00c	! t1_kref+0x3e80:   	xor	%l2, 0xc, %l2
	.word	0xe42be29c	! t1_kref+0x3e84:   	stb	%l2, [%o7 + 0x29c]
	.word	0x81dbe29c	! t1_kref+0x3e88:   	flush	%o7 + 0x29c
	.word	0x8da00546	! t1_kref+0x3e8c:   	fsqrtd	%f6, %f6
	.word	0xee360000	! t1_kref+0x3e90:   	sth	%l7, [%i0]
	.word	0x2f480008	! t1_kref+0x3e94:   	fbu,a,pt	%fcc0, _kref+0x3eb4
	.word	0x9865b8c5	! t1_kref+0x3e98:   	subc	%l6, -0x73b, %o4
2:	.word	0xa9a4482f	! t1_kref+0x3e9c:   	fadds	%f17, %f15, %f20
	.word	0xd88e7fe5	! t1_kref+0x3ea0:   	lduba	[%i1 - 0x1b]%asi, %o4
	.word	0x89b54ef8	! t1_kref+0x3ea4:   	fornot2s	%f21, %f24, %f4
	.word	0x28480001	! t1_kref+0x3ea8:   	bleu,a,pt	%icc, _kref+0x3eac
	.word	0xf6264000	! t1_kref+0x3eac:   	st	%i3, [%i1]
	.word	0xd4e8a02c	! t1_kref+0x3eb0:   	ldstuba	[%g2 + 0x2c]%asi, %o2
	.word	0x87a0052d	! t1_kref+0x3eb4:   	fsqrts	%f13, %f3
	.word	0xa9a01927	! t1_kref+0x3eb8:   	fstod	%f7, %f20
	.word	0x81da32a6	! t1_kref+0x3ebc:   	flush	%o0 - 0xd5a
	.word	0x9fc00004	! t1_kref+0x3ec0:   	call	%g0 + %g4
	.word	0xc07e3ff0	! t1_kref+0x3ec4:   	swap	[%i0 - 0x10], %g0
	.word	0x29800007	! t1_kref+0x3ec8:   	fbl,a	_kref+0x3ee4
	.word	0xb1b48d31	! t1_kref+0x3ecc:   	fandnot1s	%f18, %f17, %f24
	.word	0x98f30008	! t1_kref+0x3ed0:   	udivcc	%o4, %o0, %o4
	.word	0x97b00cf4	! t1_kref+0x3ed4:   	fnot2s	%f20, %f11
	.word	0x98053730	! t1_kref+0x3ed8:   	add	%l4, -0x8d0, %o4
	.word	0x99408000	! t1_kref+0x3edc:   	mov	%ccr, %o4
	.word	0x99b10442	! t1_kref+0x3ee0:   	fcmpne16	%f4, %f2, %o4
	.word	0xe22e601b	! t1_kref+0x3ee4:   	stb	%l1, [%i1 + 0x1b]
	.word	0xe5ee501a	! t1_kref+0x3ee8:   	prefetcha	%i1 + %i2, 18
	.word	0xa1a01098	! t1_kref+0x3eec:   	fxtos	%f24, %f16
	.word	0xf7ee101c	! t1_kref+0x3ef0:   	prefetcha	%i0 + %i4, 27
	.word	0xadb28c64	! t1_kref+0x3ef4:   	fnors	%f10, %f4, %f22
	.word	0x99233b6c	! t1_kref+0x3ef8:   	mulscc	%o4, -0x494, %o4
	.word	0xa5b18d40	! t1_kref+0x3efc:   	fnot1	%f6, %f18
	.word	0x993b6014	! t1_kref+0x3f00:   	sra	%o5, 0x14, %o4
	.word	0xa5a01a38	! t1_kref+0x3f04:   	fstoi	%f24, %f18
	.word	0xe82e6013	! t1_kref+0x3f08:   	stb	%l4, [%i1 + 0x13]
	.word	0x8db40a52	! t1_kref+0x3f0c:   	fpadd32	%f16, %f18, %f6
	.word	0x81dd6584	! t1_kref+0x3f10:   	flush	%l5 + 0x584
	.word	0x98d82df5	! t1_kref+0x3f14:   	smulcc	%g0, 0xdf5, %o4
	.word	0x91a0190a	! t1_kref+0x3f18:   	fitod	%f10, %f8
	.word	0x98a5400b	! t1_kref+0x3f1c:   	subcc	%l5, %o3, %o4
	.word	0xafb54fb4	! t1_kref+0x3f20:   	fors	%f21, %f20, %f23
	.word	0xe0e81018	! t1_kref+0x3f24:   	ldstuba	[%g0 + %i0]0x80, %l0
	.word	0x2b800008	! t1_kref+0x3f28:   	fbug,a	_kref+0x3f48
	.word	0x99270015	! t1_kref+0x3f2c:   	mulscc	%i4, %l5, %o4
	.word	0x81ac8ac6	! t1_kref+0x3f30:   	fcmped	%fcc0, %f18, %f6
	.word	0xe11e001d	! t1_kref+0x3f34:   	ldd	[%i0 + %i5], %f16
	.word	0xc068386d	! t1_kref+0x3f38:   	ldstub	[%g0 - 0x793], %g0
	.word	0xf4280019	! t1_kref+0x3f3c:   	stb	%i2, [%g0 + %i1]
	.word	0x37800006	! t1_kref+0x3f40:   	fbge,a	_kref+0x3f58
	.word	0x93a3c9ab	! t1_kref+0x3f44:   	fdivs	%f15, %f11, %f9
	.word	0x001fffff	! t1_kref+0x3f48:   	illtrap	0x1fffff
	.word	0x81868000	! t1_kref+0x3f4c:   	wr	%i2, %g0, %y
	.word	0x81854000	! t1_kref+0x3f50:   	wr	%l5, %g0, %y
	.word	0x81de400e	! t1_kref+0x3f54:   	flush	%i1 + %sp
	.word	0x98bda9e4	! t1_kref+0x3f58:   	xnorcc	%l6, 0x9e4, %o4
	.word	0xb5a00552	! t1_kref+0x3f5c:   	fsqrtd	%f18, %f26
	.word	0x9f414000	! t1_kref+0x3f60:   	mov	%pc, %o7
!	.word	0x234a0827	! t1_kref+0x3f64:   	fbne,a,pt	%fcc0, SYM(t1_subr3)
	   	fbne,a,pt	%fcc0, SYM(t1_subr3)
	.word	0x8143c000	! t1_kref+0x3f68:   	stbar
	.word	0x981469fa	! t1_kref+0x3f6c:   	or	%l1, 0x9fa, %o4
	.word	0xe168a0c8	! t1_kref+0x3f70:   	prefetch	%g2 + 0xc8, 16
	.word	0xd856001b	! t1_kref+0x3f74:   	ldsh	[%i0 + %i3], %o4
	.word	0x2f480007	! t1_kref+0x3f78:   	fbu,a,pt	%fcc0, _kref+0x3f94
	.word	0x8ba00529	! t1_kref+0x3f7c:   	fsqrts	%f9, %f5
	.word	0xe51e2018	! t1_kref+0x3f80:   	ldd	[%i0 + 0x18], %f18
	.word	0xb8103ff0	! t1_kref+0x3f84:   	mov	0xfffffff0, %i4
	.word	0x81ad0a37	! t1_kref+0x3f88:   	fcmps	%fcc0, %f20, %f23
	.word	0xadab8042	! t1_kref+0x3f8c:   	fmovdule	%fcc0, %f2, %f22
	.word	0x3b480004	! t1_kref+0x3f90:   	fble,a,pt	%fcc0, _kref+0x3fa0
	.word	0xafa38933	! t1_kref+0x3f94:   	fmuls	%f14, %f19, %f23
	.word	0x91a00526	! t1_kref+0x3f98:   	fsqrts	%f6, %f8
	.word	0x98c34016	! t1_kref+0x3f9c:   	addccc	%o5, %l6, %o4
	.word	0xa9a018ce	! t1_kref+0x3fa0:   	fdtos	%f14, %f20
	.word	0xd8067ff8	! t1_kref+0x3fa4:   	ld	[%i1 - 8], %o4
	.word	0x98823f4b	! t1_kref+0x3fa8:   	addcc	%o0, -0xb5, %o4
	.word	0x99b2c331	! t1_kref+0x3fac:   	bmask	%o3, %l1, %o4
	.word	0x99b0076a	! t1_kref+0x3fb0:   	fpack16	%f10, %f12
	.word	0x8ba01a50	! t1_kref+0x3fb4:   	fdtoi	%f16, %f5
	.word	0xd4360000	! t1_kref+0x3fb8:   	sth	%o2, [%i0]
	.word	0x89b58f8a	! t1_kref+0x3fbc:   	for	%f22, %f10, %f4
	.word	0x9da01a37	! t1_kref+0x3fc0:   	fstoi	%f23, %f14
	.word	0x8da00554	! t1_kref+0x3fc4:   	fsqrtd	%f20, %f6
	.word	0x98237ce8	! t1_kref+0x3fc8:   	sub	%o5, -0x318, %o4
	.word	0x91a50852	! t1_kref+0x3fcc:   	faddd	%f20, %f18, %f8
	.word	0xa9b30f96	! t1_kref+0x3fd0:   	for	%f12, %f22, %f20
	.word	0x98c2b39d	! t1_kref+0x3fd4:   	addccc	%o2, -0xc63, %o4
	.word	0xd2a0a034	! t1_kref+0x3fd8:   	sta	%o1, [%g2 + 0x34]%asi
	.word	0xdb263fe8	! t1_kref+0x3fdc:   	st	%f13, [%i0 - 0x18]
	.word	0xaba01a29	! t1_kref+0x3fe0:   	fstoi	%f9, %f21
	.word	0x95a01894	! t1_kref+0x3fe4:   	fitos	%f20, %f10
	.word	0x8186c000	! t1_kref+0x3fe8:   	wr	%i3, %g0, %y
	.word	0xe43e6000	! t1_kref+0x3fec:   	std	%l2, [%i1]
	.word	0x983d67c9	! t1_kref+0x3ff0:   	xnor	%l5, 0x7c9, %o4
	.word	0x98da0012	! t1_kref+0x3ff4:   	smulcc	%o0, %l2, %o4
	.word	0x98fa800d	! t1_kref+0x3ff8:   	sdivcc	%o2, %o5, %o4
	sethi	%hi(2f), %o7
	.word	0xe40be038	! t1_kref+0x4000:   	ldub	[%o7 + 0x38], %l2
	.word	0xa41ca00c	! t1_kref+0x4004:   	xor	%l2, 0xc, %l2
	.word	0xe42be038	! t1_kref+0x4008:   	stb	%l2, [%o7 + 0x38]
	.word	0x81dbe038	! t1_kref+0x400c:   	flush	%o7 + 0x38
	.word	0x9924c01a	! t1_kref+0x4010:   	mulscc	%l3, %i2, %o4
	.word	0xa9b406b0	! t1_kref+0x4014:   	fmul8x16al	%f16, %f16, %f20
	.word	0x98168008	! t1_kref+0x4018:   	or	%i2, %o0, %o4
	.word	0x98b80000	! t1_kref+0x401c:   	xnorcc	%g0, %g0, %o4
	.word	0xa9a01098	! t1_kref+0x4020:   	fxtos	%f24, %f20
	.word	0xd8000018	! t1_kref+0x4024:   	ld	[%g0 + %i0], %o4
	.word	0xd880a024	! t1_kref+0x4028:   	lda	[%g2 + 0x24]%asi, %o4
	.word	0x8184c000	! t1_kref+0x402c:   	wr	%l3, %g0, %y
	.word	0x9917000d	! t1_kref+0x4030:   	taddcctv	%i4, %o5, %o4
	.word	0xa5b50734	! t1_kref+0x4034:   	fmuld8ulx16	%f20, %f20, %f18
2:	.word	0x95a58850	! t1_kref+0x4038:   	faddd	%f22, %f16, %f10
	.word	0x99a01a32	! t1_kref+0x403c:   	fstoi	%f18, %f12
	.word	0x87a1092e	! t1_kref+0x4040:   	fmuls	%f4, %f14, %f3
	.word	0x98f50008	! t1_kref+0x4044:   	udivcc	%l4, %o0, %o4
	.word	0x8fa01a4a	! t1_kref+0x4048:   	fdtoi	%f10, %f7
	.word	0xd11e2008	! t1_kref+0x404c:   	ldd	[%i0 + 8], %f8
	.word	0xb1b586e6	! t1_kref+0x4050:   	fmul8ulx16	%f22, %f6, %f24
	.word	0xb3a4c9b4	! t1_kref+0x4054:   	fdivs	%f19, %f20, %f25
	.word	0x81824000	! t1_kref+0x4058:   	wr	%o1, %g0, %y
	.word	0x81850000	! t1_kref+0x405c:   	wr	%l4, %g0, %y
	.word	0xd93e0000	! t1_kref+0x4060:   	std	%f12, [%i0]
	.word	0xd87e401c	! t1_kref+0x4064:   	swap	[%i1 + %i4], %o4
	.word	0xb5a01a4e	! t1_kref+0x4068:   	fdtoi	%f14, %f26
	.word	0x81de8010	! t1_kref+0x406c:   	flush	%i2 + %l0
	.word	0x99b5002a	! t1_kref+0x4070:   	edge8n	%l4, %o2, %o4
	.word	0xcd1fbe60	! t1_kref+0x4074:   	ldd	[%fp - 0x1a0], %f6
	.word	0x91a20927	! t1_kref+0x4078:   	fmuls	%f8, %f7, %f8
	.word	0x99b10510	! t1_kref+0x407c:   	fcmpgt16	%f4, %f16, %o4
	.word	0x89b28dce	! t1_kref+0x4080:   	fnand	%f10, %f14, %f4
	.word	0xa7a248ab	! t1_kref+0x4084:   	fsubs	%f9, %f11, %f19
	.word	0x81830000	! t1_kref+0x4088:   	wr	%o4, %g0, %y
	.word	0x9da0190d	! t1_kref+0x408c:   	fitod	%f13, %f14
	.word	0x8da01a32	! t1_kref+0x4090:   	fstoi	%f18, %f6
	.word	0x99b540fc	! t1_kref+0x4094:   	edge16ln	%l5, %i4, %o4
	.word	0xd02e8018	! t1_kref+0x4098:   	stb	%o0, [%i2 + %i0]
	.word	0x98ba8013	! t1_kref+0x409c:   	xnorcc	%o2, %l3, %o4
	.word	0xda20a034	! t1_kref+0x40a0:   	st	%o5, [%g2 + 0x34]
	.word	0x983d3bed	! t1_kref+0x40a4:   	xnor	%l4, -0x413, %o4
	.word	0x8ba00123	! t1_kref+0x40a8:   	fabss	%f3, %f5
	.word	0x982cfe26	! t1_kref+0x40ac:   	andn	%l3, -0x1da, %o4
	.word	0x81dda2c3	! t1_kref+0x40b0:   	flush	%l6 + 0x2c3
	.word	0xebe8a0c2	! t1_kref+0x40b4:   	prefetcha	%g2 + 0xc2, 21
	.word	0xe0780018	! t1_kref+0x40b8:   	swap	[%g0 + %i0], %l0
	.word	0xd810a006	! t1_kref+0x40bc:   	lduh	[%g2 + 6], %o4
	.word	0xdf267fec	! t1_kref+0x40c0:   	st	%f15, [%i1 - 0x14]
	.word	0x27800001	! t1_kref+0x40c4:   	fbul,a	_kref+0x40c8
	.word	0xd8c8a006	! t1_kref+0x40c8:   	ldsba	[%g2 + 6]%asi, %o4
	.word	0x9894fbc5	! t1_kref+0x40cc:   	orcc	%l3, -0x43b, %o4
	.word	0x91b34f75	! t1_kref+0x40d0:   	fornot1s	%f13, %f21, %f8
	.word	0xd8167fe0	! t1_kref+0x40d4:   	lduh	[%i1 - 0x20], %o4
	.word	0x9da80050	! t1_kref+0x40d8:   	fmovdn	%fcc0, %f16, %f14
	.word	0x21480004	! t1_kref+0x40dc:   	fbn,a,pt	%fcc0, _kref+0x40ec
	.word	0x983ab4b2	! t1_kref+0x40e0:   	xnor	%o2, -0xb4e, %o4
	.word	0xcd00a034	! t1_kref+0x40e4:   	ld	[%g2 + 0x34], %f6
	.word	0x85a00550	! t1_kref+0x40e8:   	fsqrtd	%f16, %f2
	.word	0x95b00cca	! t1_kref+0x40ec:   	fnot2	%f10, %f10
	.word	0xf207bfe0	! t1_kref+0x40f0:   	ld	[%fp - 0x20], %i1
	.word	0x2d800006	! t1_kref+0x40f4:   	fbg,a	_kref+0x410c
	.word	0xd848a02d	! t1_kref+0x40f8:   	ldsb	[%g2 + 0x2d], %o4
	.word	0x81dd753a	! t1_kref+0x40fc:   	flush	%l5 - 0xac6
	.word	0xdb20a03c	! t1_kref+0x4100:   	st	%f13, [%g2 + 0x3c]
	.word	0x9da60833	! t1_kref+0x4104:   	fadds	%f24, %f19, %f14
	.word	0xa1b00cfa	! t1_kref+0x4108:   	fnot2s	%f26, %f16
	.word	0x98feea7d	! t1_kref+0x410c:   	sdivcc	%i3, 0xa7d, %o4
	.word	0xf4f63ff8	! t1_kref+0x4110:   	stxa	%i2, [%i0 - 8]%asi
	.word	0xd1be5812	! t1_kref+0x4114:   	stda	%f8, [%i1 + %l2]0xc0
	.word	0xec1e7fe0	! t1_kref+0x4118:   	ldd	[%i1 - 0x20], %l6
	.word	0x98070011	! t1_kref+0x411c:   	add	%i4, %l1, %o4
	.word	0xa3b38ef2	! t1_kref+0x4120:   	fornot2s	%f14, %f18, %f17
	.word	0xada88042	! t1_kref+0x4124:   	fmovdlg	%fcc0, %f2, %f22
	.word	0xaba0053a	! t1_kref+0x4128:   	fsqrts	%f26, %f21
	.word	0x2d480002	! t1_kref+0x412c:   	fbg,a,pt	%fcc0, _kref+0x4134
	.word	0xdaf8a03c	! t1_kref+0x4130:   	swapa	[%g2 + 0x3c]%asi, %o5
	.word	0x95b48ab1	! t1_kref+0x4134:   	fpsub16s	%f18, %f17, %f10
	.word	0x99b2c280	! t1_kref+0x4138:   	array32	%o3, %g0, %o4
	.word	0xd8000018	! t1_kref+0x413c:   	ld	[%g0 + %i0], %o4
	.word	0x29800008	! t1_kref+0x4140:   	fbl,a	_kref+0x4160
	.word	0x8ba0052c	! t1_kref+0x4144:   	fsqrts	%f12, %f5
	.word	0x98db001c	! t1_kref+0x4148:   	smulcc	%o4, %i4, %o4
	.word	0x89a0052c	! t1_kref+0x414c:   	fsqrts	%f12, %f4
	.word	0xed3f4019	! t1_kref+0x4150:   	std	%f22, [%i5 + %i1]
	.word	0xa5a00533	! t1_kref+0x4154:   	fsqrts	%f19, %f18
	.word	0x9866c008	! t1_kref+0x4158:   	subc	%i3, %o0, %o4
	.word	0x81ad8a31	! t1_kref+0x415c:   	fcmps	%fcc0, %f22, %f17
	.word	0x991ec014	! t1_kref+0x4160:   	tsubcctv	%i3, %l4, %o4
	.word	0xe920a00c	! t1_kref+0x4164:   	st	%f20, [%g2 + 0xc]
	.word	0x99b30014	! t1_kref+0x4168:   	edge8	%o4, %l4, %o4
	.word	0x8143c000	! t1_kref+0x416c:   	stbar
	.word	0x81ae8a2e	! t1_kref+0x4170:   	fcmps	%fcc0, %f26, %f14
	.word	0xd80e4000	! t1_kref+0x4174:   	ldub	[%i1], %o4
	.word	0x98172681	! t1_kref+0x4178:   	or	%i4, 0x681, %o4
	.word	0xa9a149b7	! t1_kref+0x417c:   	fdivs	%f5, %f23, %f20
	.word	0x81ad0a46	! t1_kref+0x4180:   	fcmpd	%fcc0, %f20, %f6
	.word	0x8da08854	! t1_kref+0x4184:   	faddd	%f2, %f20, %f6
	.word	0x37800008	! t1_kref+0x4188:   	fbge,a	_kref+0x41a8
	.word	0xd0380018	! t1_kref+0x418c:   	std	%o0, [%g0 + %i0]
	.word	0x2f800005	! t1_kref+0x4190:   	fbu,a	_kref+0x41a4
	.word	0x98e2ac2f	! t1_kref+0x4194:   	subccc	%o2, 0xc2f, %o4
	.word	0x99b2412a	! t1_kref+0x4198:   	edge32n	%o1, %o2, %o4
	.word	0x98fac00c	! t1_kref+0x419c:   	sdivcc	%o3, %o4, %o4
	.word	0x8db60750	! t1_kref+0x41a0:   	fpack32	%f24, %f16, %f6
	.word	0xd820a034	! t1_kref+0x41a4:   	st	%o4, [%g2 + 0x34]
	.word	0x9fc0001c	! t1_kref+0x41a8:   	call	%g0 + %i4
	.word	0x99b44dae	! t1_kref+0x41ac:   	fxors	%f17, %f14, %f12
	.word	0x98c58011	! t1_kref+0x41b0:   	addccc	%l6, %l1, %o4
	.word	0xe2a0a02c	! t1_kref+0x41b4:   	sta	%l1, [%g2 + 0x2c]%asi
	.word	0x98a5c00c	! t1_kref+0x41b8:   	subcc	%l7, %o4, %o4
	.word	0x99b5034c	! t1_kref+0x41bc:   	alignaddrl	%l4, %o4, %o4
	.word	0x85a00556	! t1_kref+0x41c0:   	fsqrtd	%f22, %f2
	.word	0xa7b00fe0	! t1_kref+0x41c4:   	fones	%f19
	.word	0x81df2283	! t1_kref+0x41c8:   	flush	%i4 + 0x283
	.word	0xa1a01937	! t1_kref+0x41cc:   	fstod	%f23, %f16
	.word	0xec3e7fe8	! t1_kref+0x41d0:   	std	%l6, [%i1 - 0x18]
	.word	0xe520a024	! t1_kref+0x41d4:   	st	%f18, [%g2 + 0x24]
	.word	0x9da309b2	! t1_kref+0x41d8:   	fdivs	%f12, %f18, %f14
	.word	0x98820000	! t1_kref+0x41dc:   	addcc	%o0, %g0, %o4
	.word	0x98a4c01b	! t1_kref+0x41e0:   	subcc	%l3, %i3, %o4
	.word	0x8143c000	! t1_kref+0x41e4:   	stbar
	.word	0xe628a027	! t1_kref+0x41e8:   	stb	%l3, [%g2 + 0x27]
	.word	0x99400000	! t1_kref+0x41ec:   	mov	%y, %o4
	.word	0x91b40dd6	! t1_kref+0x41f0:   	fnand	%f16, %f22, %f8
	.word	0x9de3bfa0	! t1_kref+0x41f4:   	save	%sp, -0x60, %sp
	.word	0x99e8001d	! t1_kref+0x41f8:   	restore	%g0, %i5, %o4
	.word	0xf51fbc30	! t1_kref+0x41fc:   	ldd	[%fp - 0x3d0], %f26
	.word	0xe99f1a18	! t1_kref+0x4200:   	ldda	[%i4 + %i0]0xd0, %f20
	.word	0x8143e040	! t1_kref+0x4204:   	membar	0x40
	.word	0x99100013	! t1_kref+0x4208:   	taddcctv	%g0, %l3, %o4
	.word	0x32800002	! t1_kref+0x420c:   	bne,a	_kref+0x4214
	.word	0x98126c10	! t1_kref+0x4210:   	or	%o1, 0xc10, %o4
	.word	0x983b0009	! t1_kref+0x4214:   	xnor	%o4, %o1, %o4
	.word	0x8143c000	! t1_kref+0x4218:   	stbar
	.word	0xd88e501a	! t1_kref+0x421c:   	lduba	[%i1 + %i2]0x80, %o4
	.word	0xd8c8a015	! t1_kref+0x4220:   	ldsba	[%g2 + 0x15]%asi, %o4
	sethi	%hi(2f), %o7
	.word	0xe40be258	! t1_kref+0x4228:   	ldub	[%o7 + 0x258], %l2
	.word	0xa41ca00c	! t1_kref+0x422c:   	xor	%l2, 0xc, %l2
	.word	0xe42be258	! t1_kref+0x4230:   	stb	%l2, [%o7 + 0x258]
	.word	0x81dbe258	! t1_kref+0x4234:   	flush	%o7 + 0x258
	.word	0xa9a109a8	! t1_kref+0x4238:   	fdivs	%f4, %f8, %f20
	.word	0x89a34938	! t1_kref+0x423c:   	fmuls	%f13, %f24, %f4
	.word	0x98bd2598	! t1_kref+0x4240:   	xnorcc	%l4, 0x598, %o4
	.word	0xa5a01925	! t1_kref+0x4244:   	fstod	%f5, %f18
	.word	0xd810a02c	! t1_kref+0x4248:   	lduh	[%g2 + 0x2c], %o4
	.word	0x98ddf4a5	! t1_kref+0x424c:   	smulcc	%l7, -0xb5b, %o4
	.word	0xe03e4000	! t1_kref+0x4250:   	std	%l0, [%i1]
	.word	0x99b4848e	! t1_kref+0x4254:   	fcmple32	%f18, %f14, %o4
2:	.word	0xb5b48ab4	! t1_kref+0x4258:   	fpsub16s	%f18, %f20, %f26
	.word	0x98f4e936	! t1_kref+0x425c:   	udivcc	%l3, 0x936, %o4
	.word	0xa9a00554	! t1_kref+0x4260:   	fsqrtd	%f20, %f20
	.word	0x98f80011	! t1_kref+0x4264:   	sdivcc	%g0, %l1, %o4
	.word	0x91b00fc0	! t1_kref+0x4268:   	fone	%f8
	.word	0xd43e3fe8	! t1_kref+0x426c:   	std	%o2, [%i0 - 0x18]
	.word	0x9894c012	! t1_kref+0x4270:   	orcc	%l3, %l2, %o4
	.word	0xe11f4019	! t1_kref+0x4274:   	ldd	[%i5 + %i1], %f16
	.word	0xa5a01a23	! t1_kref+0x4278:   	fstoi	%f3, %f18
	.word	0x8143e048	! t1_kref+0x427c:   	membar	0x48
	.word	0x31480002	! t1_kref+0x4280:   	fba,a,pt	%fcc0, _kref+0x4288
	.word	0xd230a036	! t1_kref+0x4284:   	sth	%o1, [%g2 + 0x36]
	.word	0xd848a03f	! t1_kref+0x4288:   	ldsb	[%g2 + 0x3f], %o4
	.word	0x992de007	! t1_kref+0x428c:   	sll	%l7, 0x7, %o4
	.word	0xb5a00138	! t1_kref+0x4290:   	fabss	%f24, %f26
	.word	0x83c06dcc	! t1_kref+0x4294:   	jmpl	%g1 + 0xdcc, %g1
	.word	0x89a00124	! t1_kref+0x4298:   	fabss	%f4, %f4
	.word	0x98830013	! t1_kref+0x429c:   	addcc	%o4, %l3, %o4
	.word	0xec30a024	! t1_kref+0x42a0:   	sth	%l6, [%g2 + 0x24]
	.word	0x2f800003	! t1_kref+0x42a4:   	fbu,a	_kref+0x42b0
	.word	0xd6f81018	! t1_kref+0x42a8:   	swapa	[%g0 + %i0]0x80, %o3
	.word	0xd9be189c	! t1_kref+0x42ac:   	stda	%f12, [%i0 + %i4]0xc4
	.word	0x98033463	! t1_kref+0x42b0:   	add	%o4, -0xb9d, %o4
	.word	0x91a0052e	! t1_kref+0x42b4:   	fsqrts	%f14, %f8
	.word	0x81848000	! t1_kref+0x42b8:   	wr	%l2, %g0, %y
	.word	0x99233ffd	! t1_kref+0x42bc:   	mulscc	%o4, -0x3, %o4
	.word	0x2b800007	! t1_kref+0x42c0:   	fbug,a	_kref+0x42dc
	.word	0x98927ae5	! t1_kref+0x42c4:   	orcc	%o1, -0x51b, %o4
	.word	0x81dee36b	! t1_kref+0x42c8:   	flush	%i3 + 0x36b
	.word	0x9884b4e8	! t1_kref+0x42cc:   	addcc	%l2, -0xb18, %o4
	.word	0x89a10844	! t1_kref+0x42d0:   	faddd	%f4, %f4, %f4
	.word	0xd6e8a024	! t1_kref+0x42d4:   	ldstuba	[%g2 + 0x24]%asi, %o3
	.word	0x992b000b	! t1_kref+0x42d8:   	sll	%o4, %o3, %o4
	.word	0xd840a004	! t1_kref+0x42dc:   	ldsw	[%g2 + 4], %o4
	.word	0xe4086070	! t1_kref+0x42e0:   	ldub	[%g1 + 0x70], %l2
	.word	0xa41ca00c	! t1_kref+0x42e4:   	xor	%l2, 0xc, %l2
	.word	0xe4286070	! t1_kref+0x42e8:   	stb	%l2, [%g1 + 0x70]
	.word	0x81d86070	! t1_kref+0x42ec:   	flush	%g1 + 0x70
	.word	0x98bac014	! t1_kref+0x42f0:   	xnorcc	%o3, %l4, %o4
	.word	0x8da4884c	! t1_kref+0x42f4:   	faddd	%f18, %f12, %f6
	.word	0x27480002	! t1_kref+0x42f8:   	fbul,a,pt	%fcc0, _kref+0x4300
	.word	0x9855ad8c	! t1_kref+0x42fc:   	umul	%l6, 0xd8c, %o4
	.word	0xcd1e7fe8	! t1_kref+0x4300:   	ldd	[%i1 - 0x18], %f6
2:	.word	0xd478a03c	! t1_kref+0x4304:   	swap	[%g2 + 0x3c], %o2
	.word	0x39480002	! t1_kref+0x4308:   	fbuge,a,pt	%fcc0, _kref+0x4310
	.word	0x9846bc77	! t1_kref+0x430c:   	addc	%i2, -0x389, %o4
	.word	0xada109c8	! t1_kref+0x4310:   	fdivd	%f4, %f8, %f22
	.word	0x9894b0c0	! t1_kref+0x4314:   	orcc	%l2, -0xf40, %o4
	.word	0xa3b68ef4	! t1_kref+0x4318:   	fornot2s	%f26, %f20, %f17
	sethi	%hi(2f), %o7
	.word	0xe40be334	! t1_kref+0x4320:   	ldub	[%o7 + 0x334], %l2
	.word	0xa41ca00c	! t1_kref+0x4324:   	xor	%l2, 0xc, %l2
	.word	0xe42be334	! t1_kref+0x4328:   	stb	%l2, [%o7 + 0x334]
	.word	0x81dbe334	! t1_kref+0x432c:   	flush	%o7 + 0x334
	.word	0xd8560000	! t1_kref+0x4330:   	ldsh	[%i0], %o4
2:	.word	0x8da609ab	! t1_kref+0x4334:   	fdivs	%f24, %f11, %f6
	.word	0x98dec00c	! t1_kref+0x4338:   	smulcc	%i3, %o4, %o4
	.word	0x89a649ad	! t1_kref+0x433c:   	fdivs	%f25, %f13, %f4
	.word	0xc12e2014	! t1_kref+0x4340:   	st	%fsr, [%i0 + 0x14]
	.word	0xed68a047	! t1_kref+0x4344:   	prefetch	%g2 + 0x47, 22
	.word	0x35800006	! t1_kref+0x4348:   	fbue,a	_kref+0x4360
	.word	0x98358011	! t1_kref+0x434c:   	orn	%l6, %l1, %o4
	.word	0x91b50ed4	! t1_kref+0x4350:   	fornot2	%f20, %f20, %f8
	.word	0x8186c000	! t1_kref+0x4354:   	wr	%i3, %g0, %y
	.word	0x9924c011	! t1_kref+0x4358:   	mulscc	%l3, %l1, %o4
	.word	0x91a0190d	! t1_kref+0x435c:   	fitod	%f13, %f8
	.word	0x81a90ac4	! t1_kref+0x4360:   	fcmped	%fcc0, %f4, %f4
	.word	0x9892401a	! t1_kref+0x4364:   	orcc	%o1, %i2, %o4
	.word	0x988b618a	! t1_kref+0x4368:   	andcc	%o5, 0x18a, %o4
	.word	0x89b28d40	! t1_kref+0x436c:   	fnot1	%f10, %f4
	.word	0xd800a024	! t1_kref+0x4370:   	ld	[%g2 + 0x24], %o4
	.word	0x26480008	! t1_kref+0x4374:   	bl,a,pt	%icc, _kref+0x4394
	.word	0xd8060000	! t1_kref+0x4378:   	ld	[%i0], %o4
	.word	0x8da00552	! t1_kref+0x437c:   	fsqrtd	%f18, %f6
	.word	0x98c50016	! t1_kref+0x4380:   	addccc	%l4, %l6, %o4
	.word	0x99230012	! t1_kref+0x4384:   	mulscc	%o4, %l2, %o4
	.word	0x9940c000	! t1_kref+0x4388:   	mov	%asi, %o4
	.word	0x9864ab37	! t1_kref+0x438c:   	subc	%l2, 0xb37, %o4
	.word	0x9814f042	! t1_kref+0x4390:   	or	%l3, -0xfbe, %o4
	.word	0x91a00548	! t1_kref+0x4394:   	fsqrtd	%f8, %f8
	.word	0x193cdc1c	! t1_kref+0x4398:   	sethi	%hi(0xf3707000), %o4
	.word	0x21800006	! t1_kref+0x439c:   	fbn,a	_kref+0x43b4
	.word	0xb1a00526	! t1_kref+0x43a0:   	fsqrts	%f6, %f24
	.word	0x993c800a	! t1_kref+0x43a4:   	sra	%l2, %o2, %o4
	.word	0x35800004	! t1_kref+0x43a8:   	fbue,a	_kref+0x43b8
	.word	0xa5a00542	! t1_kref+0x43ac:   	fsqrtd	%f2, %f18
	.word	0x9fc10000	! t1_kref+0x43b0:   	call	%g4
	.word	0xb5a018da	! t1_kref+0x43b4:   	fdtos	%f26, %f26
	.word	0x98db799f	! t1_kref+0x43b8:   	smulcc	%o5, -0x661, %o4
	.word	0xa9b00cf8	! t1_kref+0x43bc:   	fnot2s	%f24, %f20
	.word	0x98da2d15	! t1_kref+0x43c0:   	smulcc	%o0, 0xd15, %o4
	.word	0x98bb0015	! t1_kref+0x43c4:   	xnorcc	%o4, %l5, %o4
	.word	0x878020d0	! t1_kref+0x43c8:   	mov	0xd0, %asi
	.word	0x8ba189b5	! t1_kref+0x43cc:   	fdivs	%f6, %f21, %f5
	.word	0xf1ee501b	! t1_kref+0x43d0:   	prefetcha	%i1 + %i3, 24
	.word	0xd228a00d	! t1_kref+0x43d4:   	stb	%o1, [%g2 + 0xd]
	.word	0x81d86056	! t1_kref+0x43d8:   	flush	%g1 + 0x56
	.word	0xe1be5815	! t1_kref+0x43dc:   	stda	%f16, [%i1 + %l5]0xc0
	.word	0x89b48d10	! t1_kref+0x43e0:   	fandnot1	%f18, %f16, %f4
	.word	0x2f480003	! t1_kref+0x43e4:   	fbu,a,pt	%fcc0, _kref+0x43f0
	.word	0x99b60544	! t1_kref+0x43e8:   	fcmpeq16	%f24, %f4, %o4
	.word	0x81848000	! t1_kref+0x43ec:   	wr	%l2, %g0, %y
	.word	0xf1ee101d	! t1_kref+0x43f0:   	prefetcha	%i0 + %i5, 24
	.word	0x8fa0052b	! t1_kref+0x43f4:   	fsqrts	%f11, %f7
	.word	0x98620017	! t1_kref+0x43f8:   	subc	%o0, %l7, %o4
	.word	0xf620a034	! t1_kref+0x43fc:   	st	%i3, [%g2 + 0x34]
	.word	0x81aa0acc	! t1_kref+0x4400:   	fcmped	%fcc0, %f8, %f12
	.word	0xe99eda59	! t1_kref+0x4404:   	ldda	[%i3 + %i1]0xd2, %f20
	.word	0x99b304d6	! t1_kref+0x4408:   	fcmpne32	%f12, %f22, %o4
	.word	0xea30a00c	! t1_kref+0x440c:   	sth	%l5, [%g2 + 0xc]
	.word	0xd1be580d	! t1_kref+0x4410:   	stda	%f8, [%i1 + %o5]0xc0
	.word	0x81df0000	! t1_kref+0x4414:   	flush	%i4
	.word	0x27480004	! t1_kref+0x4418:   	fbul,a,pt	%fcc0, _kref+0x4428
	.word	0xa9b20d40	! t1_kref+0x441c:   	fnot1	%f8, %f20
	.word	0x9fc10000	! t1_kref+0x4420:   	call	%g4
	.word	0xed1f4018	! t1_kref+0x4424:   	ldd	[%i5 + %i0], %f22
	sethi	%hi(2f), %o7
	.word	0xe40be06c	! t1_kref+0x442c:   	ldub	[%o7 + 0x6c], %l2
	.word	0xa41ca00c	! t1_kref+0x4430:   	xor	%l2, 0xc, %l2
	.word	0xe42be06c	! t1_kref+0x4434:   	stb	%l2, [%o7 + 0x6c]
	.word	0x81dbe06c	! t1_kref+0x4438:   	flush	%o7 + 0x6c
	.word	0x91a28854	! t1_kref+0x443c:   	faddd	%f10, %f20, %f8
	.word	0x95a10852	! t1_kref+0x4440:   	faddd	%f4, %f18, %f10
	.word	0xd028a01e	! t1_kref+0x4444:   	stb	%o0, [%g2 + 0x1e]
	.word	0xd810a014	! t1_kref+0x4448:   	lduh	[%g2 + 0x14], %o4
	.word	0x9844401c	! t1_kref+0x444c:   	addc	%l1, %i4, %o4
	.word	0x99b48280	! t1_kref+0x4450:   	array32	%l2, %g0, %o4
	.word	0xef68a04a	! t1_kref+0x4454:   	prefetch	%g2 + 0x4a, 23
	.word	0x8d800008	! t1_kref+0x4458:   	mov	%o0, %fprs
	.word	0xa5b00cce	! t1_kref+0x445c:   	fnot2	%f14, %f18
	.word	0x983d66c1	! t1_kref+0x4460:   	xnor	%l5, 0x6c1, %o4
	.word	0x9852e743	! t1_kref+0x4464:   	umul	%o3, 0x743, %o4
	.word	0x98572594	! t1_kref+0x4468:   	umul	%i4, 0x594, %o4
2:	.word	0x98ba7686	! t1_kref+0x446c:   	xnorcc	%o1, -0x97a, %o4
	.word	0x992ee012	! t1_kref+0x4470:   	sll	%i3, 0x12, %o4
	.word	0x989dc00c	! t1_kref+0x4474:   	xorcc	%l7, %o4, %o4
	.word	0x3d480007	! t1_kref+0x4478:   	fbule,a,pt	%fcc0, _kref+0x4494
	.word	0x99b18dc8	! t1_kref+0x447c:   	fnand	%f6, %f8, %f12
	.word	0x98fc800a	! t1_kref+0x4480:   	sdivcc	%l2, %o2, %o4
	.word	0x98d30016	! t1_kref+0x4484:   	umulcc	%o4, %l6, %o4
	.word	0x37480008	! t1_kref+0x4488:   	fbge,a,pt	%fcc0, _kref+0x44a8
	.word	0x98524017	! t1_kref+0x448c:   	umul	%o1, %l7, %o4
	.word	0x8da649b7	! t1_kref+0x4490:   	fdivs	%f25, %f23, %f6
	.word	0xdd1fbca8	! t1_kref+0x4494:   	ldd	[%fp - 0x358], %f14
	.word	0x39800005	! t1_kref+0x4498:   	fbuge,a	_kref+0x44ac
	.word	0x8fa509b4	! t1_kref+0x449c:   	fdivs	%f20, %f20, %f7
	.word	0x98e50015	! t1_kref+0x44a0:   	subccc	%l4, %l5, %o4
	.word	0x98a57849	! t1_kref+0x44a4:   	subcc	%l5, -0x7b7, %o4
	.word	0x9da01a37	! t1_kref+0x44a8:   	fstoi	%f23, %f14
	.word	0x98bd7360	! t1_kref+0x44ac:   	xnorcc	%l5, -0xca0, %o4
	.word	0x98bac008	! t1_kref+0x44b0:   	xnorcc	%o3, %o0, %o4
	.word	0x99b4810c	! t1_kref+0x44b4:   	edge32	%l2, %o4, %o4
	.word	0xada00544	! t1_kref+0x44b8:   	fsqrtd	%f4, %f22
	.word	0x9846801b	! t1_kref+0x44bc:   	addc	%i2, %i3, %o4
	.word	0xa1a4c835	! t1_kref+0x44c0:   	fadds	%f19, %f21, %f16
	.word	0xe83e2018	! t1_kref+0x44c4:   	std	%l4, [%i0 + 0x18]
	.word	0xed070019	! t1_kref+0x44c8:   	ld	[%i4 + %i1], %f22
	.word	0xda20a03c	! t1_kref+0x44cc:   	st	%o5, [%g2 + 0x3c]
	.word	0x98427348	! t1_kref+0x44d0:   	addc	%o1, -0xcb8, %o4
	.word	0x9fa508b8	! t1_kref+0x44d4:   	fsubs	%f20, %f24, %f15
	.word	0xc9be601c	! t1_kref+0x44d8:   	stda	%f4, [%i1 + 0x1c]%asi
	.word	0xc9186e10	! t1_kref+0x44dc:   	ldd	[%g1 + 0xe10], %f4
	.word	0x81aa8aca	! t1_kref+0x44e0:   	fcmped	%fcc0, %f10, %f10
	.word	0x98a2c017	! t1_kref+0x44e4:   	subcc	%o3, %l7, %o4
	.word	0xd850a004	! t1_kref+0x44e8:   	ldsh	[%g2 + 4], %o4
	.word	0x95b4870e	! t1_kref+0x44ec:   	fmuld8sux16	%f18, %f14, %f10
	.word	0x99147e9d	! t1_kref+0x44f0:   	taddcctv	%l1, -0x163, %o4
	.word	0x9de3bfa0	! t1_kref+0x44f4:   	save	%sp, -0x60, %sp
	.word	0x80ae401b	! t1_kref+0x44f8:   	andncc	%i1, %i3, %g0
	.word	0x99e837e9	! t1_kref+0x44fc:   	restore	%g0, -0x817, %o4
	.word	0x23480004	! t1_kref+0x4500:   	fbne,a,pt	%fcc0, _kref+0x4510
	.word	0x98f54016	! t1_kref+0x4504:   	udivcc	%l5, %l6, %o4
	.word	0xd808a01c	! t1_kref+0x4508:   	ldub	[%g2 + 0x1c], %o4
	.word	0xd8c01019	! t1_kref+0x450c:   	ldswa	[%g0 + %i1]0x80, %o4
	.word	0x9850000c	! t1_kref+0x4510:   	umul	%g0, %o4, %o4
	.word	0x89a5c82f	! t1_kref+0x4514:   	fadds	%f23, %f15, %f4
	.word	0xdf260000	! t1_kref+0x4518:   	st	%f15, [%i0]
	.word	0xe828a02e	! t1_kref+0x451c:   	stb	%l4, [%g2 + 0x2e]
	.word	0x9940c000	! t1_kref+0x4520:   	mov	%asi, %o4
	.word	0xe6270018	! t1_kref+0x4524:   	st	%l3, [%i4 + %i0]
	.word	0xa1a00548	! t1_kref+0x4528:   	fsqrtd	%f8, %f16
	.word	0x95b18dc4	! t1_kref+0x452c:   	fnand	%f6, %f4, %f10
	.word	0xb1b106ea	! t1_kref+0x4530:   	fmul8ulx16	%f4, %f10, %f24
	.word	0xb3a209aa	! t1_kref+0x4534:   	fdivs	%f8, %f10, %f25
	.word	0xe83e2000	! t1_kref+0x4538:   	std	%l4, [%i0]
	.word	0x99b24155	! t1_kref+0x453c:   	edge32l	%o1, %l5, %o4
	.word	0x993b2015	! t1_kref+0x4540:   	sra	%o4, 0x15, %o4
	.word	0x98dd0011	! t1_kref+0x4544:   	smulcc	%l4, %l1, %o4
	.word	0x98e2ec86	! t1_kref+0x4548:   	subccc	%o3, 0xc86, %o4
	.word	0x99b000f1	! t1_kref+0x454c:   	edge16ln	%g0, %l1, %o4
	.word	0x8db44709	! t1_kref+0x4550:   	fmuld8sux16	%f17, %f9, %f6
	.word	0xe40862e8	! t1_kref+0x4554:   	ldub	[%g1 + 0x2e8], %l2
	.word	0xa41ca00c	! t1_kref+0x4558:   	xor	%l2, 0xc, %l2
	.word	0xe42862e8	! t1_kref+0x455c:   	stb	%l2, [%g1 + 0x2e8]
	.word	0x81d862e8	! t1_kref+0x4560:   	flush	%g1 + 0x2e8
	.word	0xb1b60dc4	! t1_kref+0x4564:   	fnand	%f24, %f4, %f24
	.word	0x9892a3ca	! t1_kref+0x4568:   	orcc	%o2, 0x3ca, %o4
	.word	0xea796100	! t1_kref+0x456c:   	swap	[%g5 + 0x100], %l5
	.word	0x9ba489a4	! t1_kref+0x4570:   	fdivs	%f18, %f4, %f13
	.word	0x2d480005	! t1_kref+0x4574:   	fbg,a,pt	%fcc0, _kref+0x4588
	.word	0x9926ed22	! t1_kref+0x4578:   	mulscc	%i3, 0xd22, %o4
2:	.word	0xf8766000	! t1_kref+0x457c:   	stx	%i4, [%i1]
	.word	0xa7b4ccad	! t1_kref+0x4580:   	fandnot2s	%f19, %f13, %f19
	.word	0x9885c00a	! t1_kref+0x4584:   	addcc	%l7, %o2, %o4
	.word	0x98dcfa46	! t1_kref+0x4588:   	smulcc	%l3, -0x5ba, %o4
	.word	0x98d82132	! t1_kref+0x458c:   	smulcc	%g0, 0x132, %o4
	.word	0xf628a036	! t1_kref+0x4590:   	stb	%i3, [%g2 + 0x36]
	.word	0xb1b00764	! t1_kref+0x4594:   	fpack16	%f4, %f24
	.word	0xa5a00552	! t1_kref+0x4598:   	fsqrtd	%f18, %f18
	.word	0x9906bba0	! t1_kref+0x459c:   	taddcc	%i2, -0x460, %o4
	.word	0xf630a006	! t1_kref+0x45a0:   	sth	%i3, [%g2 + 6]
	.word	0x9f414000	! t1_kref+0x45a4:   	mov	%pc, %o7
	.word	0x2b480004	! t1_kref+0x45a8:   	fbug,a,pt	%fcc0, _kref+0x45b8
	.word	0x9812ff5b	! t1_kref+0x45ac:   	or	%o3, -0xa5, %o4
	.word	0x98e7001c	! t1_kref+0x45b0:   	subccc	%i4, %i4, %o4
	.word	0x99400000	! t1_kref+0x45b4:   	mov	%y, %o4
	.word	0x9814666a	! t1_kref+0x45b8:   	or	%l1, 0x66a, %o4
	.word	0xe43e0000	! t1_kref+0x45bc:   	std	%l2, [%i0]
	.word	0x9926ff7c	! t1_kref+0x45c0:   	mulscc	%i3, -0x84, %o4
	.word	0x97a309ab	! t1_kref+0x45c4:   	fdivs	%f12, %f11, %f11
	.word	0xd8080019	! t1_kref+0x45c8:   	ldub	[%g0 + %i1], %o4
	.word	0x98f33baf	! t1_kref+0x45cc:   	udivcc	%o4, -0x451, %o4
	.word	0x9896af02	! t1_kref+0x45d0:   	orcc	%i2, 0xf02, %o4
	.word	0x81abcab2	! t1_kref+0x45d4:   	fcmpes	%fcc0, %f15, %f18
	.word	0x983dbc37	! t1_kref+0x45d8:   	xnor	%l6, -0x3c9, %o4
	.word	0xb5a0102a	! t1_kref+0x45dc:   	fstox	%f10, %f26
	.word	0x8fa00527	! t1_kref+0x45e0:   	fsqrts	%f7, %f7
	.word	0x982a0011	! t1_kref+0x45e4:   	andn	%o0, %l1, %o4
	.word	0xe430a026	! t1_kref+0x45e8:   	sth	%l2, [%g2 + 0x26]
	.word	0xf500a014	! t1_kref+0x45ec:   	ld	[%g2 + 0x14], %f26
	.word	0x30480008	! t1_kref+0x45f0:   	ba,a,pt	%icc, _kref+0x4610
	.word	0xec20a03c	! t1_kref+0x45f4:   	st	%l6, [%g2 + 0x3c]
	.word	0x38480008	! t1_kref+0x45f8:   	bgu,a,pt	%icc, _kref+0x4618
	.word	0x8da00550	! t1_kref+0x45fc:   	fsqrtd	%f16, %f6
	.word	0xcda6501c	! t1_kref+0x4600:   	sta	%f6, [%i1 + %i4]0x80
	.word	0x98bb3c44	! t1_kref+0x4604:   	xnorcc	%o4, -0x3bc, %o4
	.word	0x98fa400d	! t1_kref+0x4608:   	sdivcc	%o1, %o5, %o4
	.word	0xc368a0c9	! t1_kref+0x460c:   	prefetch	%g2 + 0xc9, 1
	.word	0xe628a015	! t1_kref+0x4610:   	stb	%l3, [%g2 + 0x15]
	.word	0xb1a00544	! t1_kref+0x4614:   	fsqrtd	%f4, %f24
	.word	0xd84e0000	! t1_kref+0x4618:   	ldsb	[%i0], %o4
	.word	0xf826601c	! t1_kref+0x461c:   	st	%i4, [%i1 + 0x1c]
	.word	0x8da00139	! t1_kref+0x4620:   	fabss	%f25, %f6
	.word	0xeb68a082	! t1_kref+0x4624:   	prefetch	%g2 + 0x82, 21
	.word	0x8ba018c8	! t1_kref+0x4628:   	fdtos	%f8, %f5
	.word	0xc9be188c	! t1_kref+0x462c:   	stda	%f4, [%i0 + %o4]0xc4
	.word	0x87aa4026	! t1_kref+0x4630:   	fmovse	%fcc0, %f6, %f3
	.word	0xe968a08e	! t1_kref+0x4634:   	prefetch	%g2 + 0x8e, 20
	.word	0x98a4800a	! t1_kref+0x4638:   	subcc	%l2, %o2, %o4
	.word	0xe40863c0	! t1_kref+0x463c:   	ldub	[%g1 + 0x3c0], %l2
	.word	0xa41ca00c	! t1_kref+0x4640:   	xor	%l2, 0xc, %l2
	.word	0xe42863c0	! t1_kref+0x4644:   	stb	%l2, [%g1 + 0x3c0]
	.word	0x81d863c0	! t1_kref+0x4648:   	flush	%g1 + 0x3c0
	.word	0x39800008	! t1_kref+0x464c:   	fbuge,a	_kref+0x466c
	.word	0xada00526	! t1_kref+0x4650:   	fsqrts	%f6, %f22
2:	.word	0x980a0016	! t1_kref+0x4654:   	and	%o0, %l6, %o4
	.word	0x8143c000	! t1_kref+0x4658:   	stbar
	.word	0xafa309b6	! t1_kref+0x465c:   	fdivs	%f12, %f22, %f23
	.word	0x89b58634	! t1_kref+0x4660:   	fmul8x16	%f22, %f20, %f4
	.word	0xd856200e	! t1_kref+0x4664:   	ldsh	[%i0 + 0xe], %o4
	.word	0x9da01931	! t1_kref+0x4668:   	fstod	%f17, %f14
	.word	0x8143c000	! t1_kref+0x466c:   	stbar
	.word	0xe99e1a1a	! t1_kref+0x4670:   	ldda	[%i0 + %i2]0xd0, %f20
	.word	0x993b201e	! t1_kref+0x4674:   	sra	%o4, 0x1e, %o4
	.word	0xa1b58e44	! t1_kref+0x4678:   	fxnor	%f22, %f4, %f16
	.word	0x9895e1ef	! t1_kref+0x467c:   	orcc	%l7, 0x1ef, %o4
	.word	0x98e2c01a	! t1_kref+0x4680:   	subccc	%o3, %i2, %o4
	.word	0x992a0014	! t1_kref+0x4684:   	sll	%o0, %l4, %o4
	.word	0xd8560000	! t1_kref+0x4688:   	ldsh	[%i0], %o4
	.word	0xdf00a03c	! t1_kref+0x468c:   	ld	[%g2 + 0x3c], %f15
	.word	0x97a449ac	! t1_kref+0x4690:   	fdivs	%f17, %f12, %f11
	.word	0x99b00776	! t1_kref+0x4694:   	fpack16	%f22, %f12
	.word	0x8143c000	! t1_kref+0x4698:   	stbar
	.word	0x91a188c4	! t1_kref+0x469c:   	fsubd	%f6, %f4, %f8
	.word	0xd8566010	! t1_kref+0x46a0:   	ldsh	[%i1 + 0x10], %o4
	.word	0x98fefe62	! t1_kref+0x46a4:   	sdivcc	%i3, -0x19e, %o4
	.word	0xed68a008	! t1_kref+0x46a8:   	prefetch	%g2 + 8, 22
	.word	0xec9e101d	! t1_kref+0x46ac:   	ldda	[%i0 + %i5]0x80, %l6
	.word	0xd80e7fe9	! t1_kref+0x46b0:   	ldub	[%i1 - 0x17], %o4
	.word	0xcd1fbe18	! t1_kref+0x46b4:   	ldd	[%fp - 0x1e8], %f6
	.word	0xd19e1a5b	! t1_kref+0x46b8:   	ldda	[%i0 + %i3]0xd2, %f8
	.word	0xadb00cca	! t1_kref+0x46bc:   	fnot2	%f10, %f22
	.word	0x31480007	! t1_kref+0x46c0:   	fba,a,pt	%fcc0, _kref+0x46dc
	.word	0x98353e7a	! t1_kref+0x46c4:   	orn	%l4, -0x186, %o4
	.word	0x98454017	! t1_kref+0x46c8:   	addc	%l5, %l7, %o4
	.word	0xd8063fe0	! t1_kref+0x46cc:   	ld	[%i0 - 0x20], %o4
	.word	0x29480007	! t1_kref+0x46d0:   	fbl,a,pt	%fcc0, _kref+0x46ec
	.word	0x987a8016	! t1_kref+0x46d4:   	sdiv	%o2, %l6, %o4
	.word	0x9815b32f	! t1_kref+0x46d8:   	or	%l6, -0xcd1, %o4
	.word	0x89a01a2d	! t1_kref+0x46dc:   	fstoi	%f13, %f4
	.word	0xc020a00c	! t1_kref+0x46e0:   	clr	[%g2 + 0xc]
	.word	0x9bb10e29	! t1_kref+0x46e4:   	fands	%f4, %f9, %f13
	.word	0x97a01a4a	! t1_kref+0x46e8:   	fdtoi	%f10, %f11
	.word	0xd816c019	! t1_kref+0x46ec:   	lduh	[%i3 + %i1], %o4
	.word	0x27480003	! t1_kref+0x46f0:   	fbul,a,pt	%fcc0, _kref+0x46fc
	.word	0x983a38ea	! t1_kref+0x46f4:   	xnor	%o0, -0x716, %o4
	.word	0x81ae0ab8	! t1_kref+0x46f8:   	fcmpes	%fcc0, %f24, %f24
	.word	0xe0fe501c	! t1_kref+0x46fc:   	swapa	[%i1 + %i4]0x80, %l0
	.word	0xe47e6014	! t1_kref+0x4700:   	swap	[%i1 + 0x14], %l2
	.word	0x98a4f1da	! t1_kref+0x4704:   	subcc	%l3, -0xe26, %o4
	.word	0x989d801a	! t1_kref+0x4708:   	xorcc	%l6, %i2, %o4
	.word	0x99b70028	! t1_kref+0x470c:   	edge8n	%i4, %o0, %o4
	.word	0xb3a01899	! t1_kref+0x4710:   	fitos	%f25, %f25
	.word	0x9f414000	! t1_kref+0x4714:   	mov	%pc, %o7
!	.word	0x2682063a	! t1_kref+0x4718:   	bl,a	SYM(t1_subr3)
	   	bl,a	SYM(t1_subr3)
	.word	0x98bd3280	! t1_kref+0x471c:   	xnorcc	%l4, -0xd80, %o4
	.word	0x33800002	! t1_kref+0x4720:   	fbe,a	_kref+0x4728
	.word	0x99b5834c	! t1_kref+0x4724:   	alignaddrl	%l6, %o4, %o4
	.word	0x99b604d4	! t1_kref+0x4728:   	fcmpne32	%f24, %f20, %o4
	.word	0x81a94a37	! t1_kref+0x472c:   	fcmps	%fcc0, %f5, %f23
	.word	0x9db48dc4	! t1_kref+0x4730:   	fnand	%f18, %f4, %f14
	.word	0x992e800a	! t1_kref+0x4734:   	sll	%i2, %o2, %o4
	.word	0xd2f6101d	! t1_kref+0x4738:   	stxa	%o1, [%i0 + %i5]0x80
	.word	0xb1b28f82	! t1_kref+0x473c:   	for	%f10, %f2, %f24
	.word	0x3f480006	! t1_kref+0x4740:   	fbo,a,pt	%fcc0, _kref+0x4758
	.word	0x987da9dc	! t1_kref+0x4744:   	sdiv	%l6, 0x9dc, %o4
	.word	0x98f5fda9	! t1_kref+0x4748:   	udivcc	%l7, -0x257, %o4
	call	SYM(t1_subr3)
	.word	0x9844beea	! t1_kref+0x4750:   	addc	%l2, -0x116, %o4
	.word	0x81d9001a	! t1_kref+0x4754:   	flush	%g4 + %i2
	.word	0xe1f65000	! t1_kref+0x4758:   	casxa	[%i1]0x80, %g0, %l0
	.word	0x89b14faa	! t1_kref+0x475c:   	fors	%f5, %f10, %f4
	.word	0x98f260f4	! t1_kref+0x4760:   	udivcc	%o1, 0xf4, %o4
	.word	0x99100009	! t1_kref+0x4764:   	taddcctv	%g0, %o1, %o4
	.word	0xd8066018	! t1_kref+0x4768:   	ld	[%i1 + 0x18], %o4
	.word	0x1936a0e9	! t1_kref+0x476c:   	sethi	%hi(0xda83a400), %o4
	.word	0x2b480002	! t1_kref+0x4770:   	fbug,a,pt	%fcc0, _kref+0x4778
	.word	0x988ec00b	! t1_kref+0x4774:   	andcc	%i3, %o3, %o4
	.word	0xb3a24926	! t1_kref+0x4778:   	fmuls	%f9, %f6, %f25
	.word	0x9de3bfa0	! t1_kref+0x477c:   	save	%sp, -0x60, %sp
	.word	0x800e7f3c	! t1_kref+0x4780:   	and	%i1, -0xc4, %g0
	.word	0x99ee705c	! t1_kref+0x4784:   	restore	%i1, -0xfa4, %o4
	.word	0xc168a103	! t1_kref+0x4788:   	prefetch	%g2 + 0x103, 0
	.word	0xa5a01a56	! t1_kref+0x478c:   	fdtoi	%f22, %f18
	.word	0xe13e3ff8	! t1_kref+0x4790:   	std	%f16, [%i0 - 8]
	.word	0xb5a00546	! t1_kref+0x4794:   	fsqrtd	%f6, %f26
	call	SYM(t1_subr1)
	.word	0x89a00556	! t1_kref+0x479c:   	fsqrtd	%f22, %f4
	.word	0x89a0054e	! t1_kref+0x47a0:   	fsqrtd	%f14, %f4
	.word	0xada00554	! t1_kref+0x47a4:   	fsqrtd	%f20, %f22
	.word	0x98e5a7b3	! t1_kref+0x47a8:   	subccc	%l6, 0x7b3, %o4
	.word	0xe878a004	! t1_kref+0x47ac:   	swap	[%g2 + 4], %l4
	.word	0xd856601a	! t1_kref+0x47b0:   	ldsh	[%i1 + 0x1a], %o4
	.word	0x8184c000	! t1_kref+0x47b4:   	wr	%l3, %g0, %y
	.word	0xcd1fbf50	! t1_kref+0x47b8:   	ldd	[%fp - 0xb0], %f6
	.word	0xdd1f4019	! t1_kref+0x47bc:   	ldd	[%i5 + %i1], %f14
	.word	0xf1ee501d	! t1_kref+0x47c0:   	prefetcha	%i1 + %i5, 24
	.word	0x81ab0a2b	! t1_kref+0x47c4:   	fcmps	%fcc0, %f12, %f11
	.word	0xb5a40854	! t1_kref+0x47c8:   	faddd	%f16, %f20, %f26
	.word	0x98944008	! t1_kref+0x47cc:   	orcc	%l1, %o0, %o4
	.word	0x93a548aa	! t1_kref+0x47d0:   	fsubs	%f21, %f10, %f9
	.word	0x99b68117	! t1_kref+0x47d4:   	edge32	%i2, %l7, %o4
	.word	0xafa01a39	! t1_kref+0x47d8:   	fstoi	%f25, %f23
	.word	0xe630a02e	! t1_kref+0x47dc:   	sth	%l3, [%g2 + 0x2e]
	.word	0xf420a004	! t1_kref+0x47e0:   	st	%i2, [%g2 + 4]
	.word	0x81df8010	! t1_kref+0x47e4:   	flush	%fp + %l0
	.word	0x99418000	! t1_kref+0x47e8:   	mov	%fprs, %o4
	.word	0xa5a20856	! t1_kref+0x47ec:   	faddd	%f8, %f22, %f18
	.word	0xc1ee101b	! t1_kref+0x47f0:   	prefetcha	%i0 + %i3, 0
	.word	0xe1be5892	! t1_kref+0x47f4:   	stda	%f16, [%i1 + %l2]0xc4
	.word	0x2c480003	! t1_kref+0x47f8:   	bneg,a,pt	%icc, _kref+0x4804
	.word	0x989cf36e	! t1_kref+0x47fc:   	xorcc	%l3, -0xc92, %o4
	.word	0x98ddbfda	! t1_kref+0x4800:   	smulcc	%l6, -0x26, %o4
	.word	0xd868a02e	! t1_kref+0x4804:   	ldstub	[%g2 + 0x2e], %o4
	.word	0x191fcd5d	! t1_kref+0x4808:   	sethi	%hi(0x7f357400), %o4
	.word	0x99700011	! t1_kref+0x480c:   	popc	%l1, %o4
	.word	0xa9a01a50	! t1_kref+0x4810:   	fdtoi	%f16, %f20
	.word	0x27800003	! t1_kref+0x4814:   	fbul,a	_kref+0x4820
	.word	0xf007bfe0	! t1_kref+0x4818:   	ld	[%fp - 0x20], %i0
	.word	0x992b600b	! t1_kref+0x481c:   	sll	%o5, 0xb, %o4
	.word	0x98a3000b	! t1_kref+0x4820:   	subcc	%o4, %o3, %o4
	.word	0xee7e2014	! t1_kref+0x4824:   	swap	[%i0 + 0x14], %l7
	.word	0x9db6890e	! t1_kref+0x4828:   	faligndata	%f26, %f14, %f14
	.word	0x99b30240	! t1_kref+0x482c:   	array16	%o4, %g0, %o4
	.word	0xd47e7fe0	! t1_kref+0x4830:   	swap	[%i1 - 0x20], %o2
	.word	0x9832fda3	! t1_kref+0x4834:   	orn	%o3, -0x25d, %o4
	.word	0xed20a02c	! t1_kref+0x4838:   	st	%f22, [%g2 + 0x2c]
	.word	0x81aa0ad8	! t1_kref+0x483c:   	fcmped	%fcc0, %f8, %f24
	.word	0xd8080019	! t1_kref+0x4840:   	ldub	[%g0 + %i1], %o4
	.word	0x99b6c240	! t1_kref+0x4844:   	array16	%i3, %g0, %o4
	.word	0x2b480007	! t1_kref+0x4848:   	fbug,a,pt	%fcc0, _kref+0x4864
	.word	0xd27f0019	! t1_kref+0x484c:   	swap	[%i4 + %i1], %o1
	.word	0x35800001	! t1_kref+0x4850:   	fbue,a	_kref+0x4854
	.word	0x983a8013	! t1_kref+0x4854:   	xnor	%o2, %l3, %o4
	.word	0xadb58e58	! t1_kref+0x4858:   	fxnor	%f22, %f24, %f22
	.word	0x91b0cc75	! t1_kref+0x485c:   	fnors	%f3, %f21, %f8
	.word	0x81aaca34	! t1_kref+0x4860:   	fcmps	%fcc0, %f11, %f20
	.word	0xd806001c	! t1_kref+0x4864:   	ld	[%i0 + %i4], %o4
	.word	0xc1ee1014	! t1_kref+0x4868:   	prefetcha	%i0 + %l4, 0
	.word	0xe408661c	! t1_kref+0x486c:   	ldub	[%g1 + 0x61c], %l2
	.word	0xa41ca00c	! t1_kref+0x4870:   	xor	%l2, 0xc, %l2
	.word	0xe428661c	! t1_kref+0x4874:   	stb	%l2, [%g1 + 0x61c]
	.word	0x81d8661c	! t1_kref+0x4878:   	flush	%g1 + 0x61c
	.word	0x8db20972	! t1_kref+0x487c:   	fpmerge	%f8, %f18, %f6
	.word	0xeb20a03c	! t1_kref+0x4880:   	st	%f21, [%g2 + 0x3c]
	.word	0xada00148	! t1_kref+0x4884:   	fabsd	%f8, %f22
	.word	0x99b2c0f5	! t1_kref+0x4888:   	edge16ln	%o3, %l5, %o4
	.word	0x81ac4ab0	! t1_kref+0x488c:   	fcmpes	%fcc0, %f17, %f16
	.word	0x81aa8a38	! t1_kref+0x4890:   	fcmps	%fcc0, %f10, %f24
	.word	0x93b00770	! t1_kref+0x4894:   	fpack16	%f16, %f9
	.word	0x99b604d8	! t1_kref+0x4898:   	fcmpne32	%f24, %f24, %o4
	.word	0xada00554	! t1_kref+0x489c:   	fsqrtd	%f20, %f22
	.word	0xee774018	! t1_kref+0x48a0:   	stx	%l7, [%i5 + %i0]
	.word	0x2b480001	! t1_kref+0x48a4:   	fbug,a,pt	%fcc0, _kref+0x48a8
	.word	0xd920a02c	! t1_kref+0x48a8:   	st	%f12, [%g2 + 0x2c]
	.word	0xd80e8019	! t1_kref+0x48ac:   	ldub	[%i2 + %i1], %o4
2:	.word	0x9892f2c8	! t1_kref+0x48b0:   	orcc	%o3, -0xd38, %o4
	.word	0x98e2400d	! t1_kref+0x48b4:   	subccc	%o1, %o5, %o4
	.word	0xc568a04a	! t1_kref+0x48b8:   	prefetch	%g2 + 0x4a, 2
	.word	0x989e8011	! t1_kref+0x48bc:   	xorcc	%i2, %l1, %o4
	.word	0x81ac0ac6	! t1_kref+0x48c0:   	fcmped	%fcc0, %f16, %f6
	.word	0x23480008	! t1_kref+0x48c4:   	fbne,a,pt	%fcc0, _kref+0x48e4
	.word	0x85a50858	! t1_kref+0x48c8:   	faddd	%f20, %f24, %f2
	.word	0xd4780019	! t1_kref+0x48cc:   	swap	[%g0 + %i1], %o2
	.word	0xe51fbf18	! t1_kref+0x48d0:   	ldd	[%fp - 0xe8], %f18
	.word	0x91b60a4a	! t1_kref+0x48d4:   	fpadd32	%f24, %f10, %f8
	.word	0x98da0015	! t1_kref+0x48d8:   	smulcc	%o0, %l5, %o4
	.word	0x99b48442	! t1_kref+0x48dc:   	fcmpne16	%f18, %f2, %o4
	.word	0x9916c01a	! t1_kref+0x48e0:   	taddcctv	%i3, %i2, %o4
	.word	0x9daa8058	! t1_kref+0x48e4:   	fmovdue	%fcc0, %f24, %f14
	.word	0x99b5c240	! t1_kref+0x48e8:   	array16	%l7, %g0, %o4
	.word	0x33800008	! t1_kref+0x48ec:   	fbe,a	_kref+0x490c
	.word	0xd8062008	! t1_kref+0x48f0:   	ld	[%i0 + 8], %o4
	.word	0x81db8005	! t1_kref+0x48f4:   	flush	%sp + %g5
	.word	0x93a488a4	! t1_kref+0x48f8:   	fsubs	%f18, %f4, %f9
	.word	0xc9be589a	! t1_kref+0x48fc:   	stda	%f4, [%i1 + %i2]0xc4
	.word	0x8db08e80	! t1_kref+0x4900:   	fsrc1	%f2, %f6
	.word	0xaba648b4	! t1_kref+0x4904:   	fsubs	%f25, %f20, %f21
	.word	0x990d0000	! t1_kref+0x4908:   	tsubcc	%l4, %g0, %o4
	.word	0xd8567fe0	! t1_kref+0x490c:   	ldsh	[%i1 - 0x20], %o4
	.word	0x98f2a56b	! t1_kref+0x4910:   	udivcc	%o2, 0x56b, %o4
	.word	0xd80e001a	! t1_kref+0x4914:   	ldub	[%i0 + %i2], %o4
	.word	0xa1b00c00	! t1_kref+0x4918:   	fzero	%f16
	.word	0xf5263ff8	! t1_kref+0x491c:   	st	%f26, [%i0 - 8]
	.word	0xd80e2012	! t1_kref+0x4920:   	ldub	[%i0 + 0x12], %o4
	.word	0x3f800006	! t1_kref+0x4924:   	fbo,a	_kref+0x493c
	.word	0x98330013	! t1_kref+0x4928:   	orn	%o4, %l3, %o4
	.word	0x99b3848c	! t1_kref+0x492c:   	fcmple32	%f14, %f12, %o4
	.word	0x98c28011	! t1_kref+0x4930:   	addccc	%o2, %l1, %o4
	.word	0x9fa5492c	! t1_kref+0x4934:   	fmuls	%f21, %f12, %f15
	.word	0xa1a01906	! t1_kref+0x4938:   	fitod	%f6, %f16
	.word	0x98128013	! t1_kref+0x493c:   	or	%o2, %l3, %o4
	.word	0x23480002	! t1_kref+0x4940:   	fbne,a,pt	%fcc0, _kref+0x4948
	.word	0x98b6b710	! t1_kref+0x4944:   	orncc	%i2, -0x8f0, %o4
	.word	0x99400000	! t1_kref+0x4948:   	mov	%y, %o4
	.word	0xa7b00cf8	! t1_kref+0x494c:   	fnot2s	%f24, %f19
	.word	0x98bdc008	! t1_kref+0x4950:   	xnorcc	%l7, %o0, %o4
	.word	0xe168a0c3	! t1_kref+0x4954:   	prefetch	%g2 + 0xc3, 16
	.word	0x98dc8013	! t1_kref+0x4958:   	smulcc	%l2, %l3, %o4
	.word	0x98c44012	! t1_kref+0x495c:   	addccc	%l1, %l2, %o4
	.word	0x93a6482c	! t1_kref+0x4960:   	fadds	%f25, %f12, %f9
	.word	0x8143c000	! t1_kref+0x4964:   	stbar
	.word	0x99a01a27	! t1_kref+0x4968:   	fstoi	%f7, %f12
	.word	0xb5a01a24	! t1_kref+0x496c:   	fstoi	%f4, %f26
	.word	0xe27e3ffc	! t1_kref+0x4970:   	swap	[%i0 - 4], %l1
	.word	0x81aa0ac4	! t1_kref+0x4974:   	fcmped	%fcc0, %f8, %f4
	.word	0x98850015	! t1_kref+0x4978:   	addcc	%l4, %l5, %o4
	.word	0x9855bd8c	! t1_kref+0x497c:   	umul	%l6, -0x274, %o4
	.word	0xe8200019	! t1_kref+0x4980:   	st	%l4, [%g0 + %i1]
	.word	0xa3a01a35	! t1_kref+0x4984:   	fstoi	%f21, %f17
	.word	0xd19f5018	! t1_kref+0x4988:   	ldda	[%i5 + %i0]0x80, %f8
	.word	0x99b38514	! t1_kref+0x498c:   	fcmpgt16	%f14, %f20, %o4
	.word	0xb3b00c20	! t1_kref+0x4990:   	fzeros	%f25
	.word	0x992b0008	! t1_kref+0x4994:   	sll	%o4, %o0, %o4
	.word	0xe320a034	! t1_kref+0x4998:   	st	%f17, [%g2 + 0x34]
	.word	0x81df249e	! t1_kref+0x499c:   	flush	%i4 + 0x49e
	.word	0xd8470018	! t1_kref+0x49a0:   	ldsw	[%i4 + %i0], %o4
	.word	0x9de3bfa0	! t1_kref+0x49a4:   	save	%sp, -0x60, %sp
	.word	0xbab80018	! t1_kref+0x49a8:   	xnorcc	%g0, %i0, %i5
	.word	0x99eee627	! t1_kref+0x49ac:   	restore	%i3, 0x627, %o4
	.word	0xd8063fe4	! t1_kref+0x49b0:   	ld	[%i0 - 0x1c], %o4
	.word	0x98f24009	! t1_kref+0x49b4:   	udivcc	%o1, %o1, %o4
	.word	0xf207bfe0	! t1_kref+0x49b8:   	ld	[%fp - 0x20], %i1
	.word	0xada609ce	! t1_kref+0x49bc:   	fdivd	%f24, %f14, %f22
	.word	0xe430a00c	! t1_kref+0x49c0:   	sth	%l2, [%g2 + 0xc]
	.word	0x91b34e2c	! t1_kref+0x49c4:   	fands	%f13, %f12, %f8
	.word	0x9897001c	! t1_kref+0x49c8:   	orcc	%i4, %i4, %o4
	.word	0xd856001b	! t1_kref+0x49cc:   	ldsh	[%i0 + %i3], %o4
	.word	0x99b50034	! t1_kref+0x49d0:   	edge8n	%l4, %l4, %o4
	.word	0x25800004	! t1_kref+0x49d4:   	fblg,a	_kref+0x49e4
	.word	0xd806601c	! t1_kref+0x49d8:   	ld	[%i1 + 0x1c], %o4
	.word	0x93b30aef	! t1_kref+0x49dc:   	fpsub32s	%f12, %f15, %f9
	.word	0xe87e2010	! t1_kref+0x49e0:   	swap	[%i0 + 0x10], %l4
	.word	0xd420a01c	! t1_kref+0x49e4:   	st	%o2, [%g2 + 0x1c]
	.word	0x36480006	! t1_kref+0x49e8:   	bge,a,pt	%icc, _kref+0x4a00
	.word	0x8143c000	! t1_kref+0x49ec:   	stbar
	.word	0x81a90a2c	! t1_kref+0x49f0:   	fcmps	%fcc0, %f4, %f12
	.word	0xe630a01c	! t1_kref+0x49f4:   	sth	%l3, [%g2 + 0x1c]
	.word	0xe828a02d	! t1_kref+0x49f8:   	stb	%l4, [%g2 + 0x2d]
	.word	0x980b001c	! t1_kref+0x49fc:   	and	%o4, %i4, %o4
	.word	0x98acc00c	! t1_kref+0x4a00:   	andncc	%l3, %o4, %o4
	.word	0x992f200f	! t1_kref+0x4a04:   	sll	%i4, 0xf, %o4
	.word	0xe230a02c	! t1_kref+0x4a08:   	sth	%l1, [%g2 + 0x2c]
	.word	0xa1a00544	! t1_kref+0x4a0c:   	fsqrtd	%f4, %f16
	.word	0x98fd801c	! t1_kref+0x4a10:   	sdivcc	%l6, %i4, %o4
	.word	0xa1abc046	! t1_kref+0x4a14:   	fmovdo	%fcc0, %f6, %f16
	.word	0xe03e7fe8	! t1_kref+0x4a18:   	std	%l0, [%i1 - 0x18]
	.word	0x91a01914	! t1_kref+0x4a1c:   	fitod	%f20, %f8
	.word	0x8da0054e	! t1_kref+0x4a20:   	fsqrtd	%f14, %f6
	.word	0x93ab002b	! t1_kref+0x4a24:   	fmovsuge	%fcc0, %f11, %f9
	.word	0xa5a00546	! t1_kref+0x4a28:   	fsqrtd	%f6, %f18
	sethi	%hi(2f), %o7
	.word	0xe40be264	! t1_kref+0x4a30:   	ldub	[%o7 + 0x264], %l2
	.word	0xa41ca00c	! t1_kref+0x4a34:   	xor	%l2, 0xc, %l2
	.word	0xe42be264	! t1_kref+0x4a38:   	stb	%l2, [%o7 + 0x264]
	.word	0x81dbe264	! t1_kref+0x4a3c:   	flush	%o7 + 0x264
	.word	0x98e53146	! t1_kref+0x4a40:   	subccc	%l4, -0xeba, %o4
	.word	0xb5a000a9	! t1_kref+0x4a44:   	fnegs	%f9, %f26
	.word	0xd8163fe6	! t1_kref+0x4a48:   	lduh	[%i0 - 0x1a], %o4
	.word	0x1931b5a4	! t1_kref+0x4a4c:   	sethi	%hi(0xc6d69000), %o4
	.word	0x8143c000	! t1_kref+0x4a50:   	stbar
	.word	0x9885a45b	! t1_kref+0x4a54:   	addcc	%l6, 0x45b, %o4
	.word	0x984564ae	! t1_kref+0x4a58:   	addc	%l5, 0x4ae, %o4
	.word	0x81ac8ace	! t1_kref+0x4a5c:   	fcmped	%fcc0, %f18, %f14
	.word	0xd51e7fe0	! t1_kref+0x4a60:   	ldd	[%i1 - 0x20], %f10
2:	.word	0x98fdfd98	! t1_kref+0x4a64:   	sdivcc	%l7, -0x268, %o4
	.word	0x8db34ab7	! t1_kref+0x4a68:   	fpsub16s	%f13, %f23, %f6
	.word	0xe1ee101a	! t1_kref+0x4a6c:   	prefetcha	%i0 + %i2, 16
	.word	0x28480003	! t1_kref+0x4a70:   	bleu,a,pt	%icc, _kref+0x4a7c
	.word	0xe430a03e	! t1_kref+0x4a74:   	sth	%l2, [%g2 + 0x3e]
	.word	0xd80e2006	! t1_kref+0x4a78:   	ldub	[%i0 + 6], %o4
	.word	0x83c0680c	! t1_kref+0x4a7c:   	jmpl	%g1 + 0x80c, %g1
	.word	0x98fec017	! t1_kref+0x4a80:   	sdivcc	%i3, %l7, %o4
	.word	0x91a309cc	! t1_kref+0x4a84:   	fdivd	%f12, %f12, %f8
	.word	0x31480002	! t1_kref+0x4a88:   	fba,a,pt	%fcc0, _kref+0x4a90
	.word	0x9806c008	! t1_kref+0x4a8c:   	add	%i3, %o0, %o4
	.word	0x9bb60cb2	! t1_kref+0x4a90:   	fandnot2s	%f24, %f18, %f13
	.word	0x33800002	! t1_kref+0x4a94:   	fbe,a	_kref+0x4a9c
	.word	0x993dc008	! t1_kref+0x4a98:   	sra	%l7, %o0, %o4
	.word	0x8db406c6	! t1_kref+0x4a9c:   	fmul8sux16	%f16, %f6, %f6
	.word	0x81ae0a44	! t1_kref+0x4aa0:   	fcmpd	%fcc0, %f24, %f4
	.word	0xada0190d	! t1_kref+0x4aa4:   	fitod	%f13, %f22
	.word	0x81dc801f	! t1_kref+0x4aa8:   	flush	%l2 + %i7
	.word	0x99b4c013	! t1_kref+0x4aac:   	edge8	%l3, %l3, %o4
	.word	0xd520a034	! t1_kref+0x4ab0:   	st	%f10, [%g2 + 0x34]
	.word	0x98bdbd29	! t1_kref+0x4ab4:   	xnorcc	%l6, -0x2d7, %o4
	.word	0x98828009	! t1_kref+0x4ab8:   	addcc	%o2, %o1, %o4
	.word	0xe4086060	! t1_kref+0x4abc:   	ldub	[%g1 + 0x60], %l2
	.word	0xa41ca00c	! t1_kref+0x4ac0:   	xor	%l2, 0xc, %l2
	.word	0xe4286060	! t1_kref+0x4ac4:   	stb	%l2, [%g1 + 0x60]
	.word	0x81d86060	! t1_kref+0x4ac8:   	flush	%g1 + 0x60
	.word	0x81dc3bca	! t1_kref+0x4acc:   	flush	%l0 - 0x436
	.word	0xa9a188ca	! t1_kref+0x4ad0:   	fsubd	%f6, %f10, %f20
	.word	0xedee501b	! t1_kref+0x4ad4:   	prefetcha	%i1 + %i3, 22
	.word	0x99b580d7	! t1_kref+0x4ad8:   	edge16l	%l6, %l7, %o4
2:	.word	0xd810a03c	! t1_kref+0x4adc:   	lduh	[%g2 + 0x3c], %o4
	.word	0xd806401c	! t1_kref+0x4ae0:   	ld	[%i1 + %i4], %o4
	sethi	%hi(2f), %o7
	.word	0xe40be330	! t1_kref+0x4ae8:   	ldub	[%o7 + 0x330], %l2
	.word	0xa41ca00c	! t1_kref+0x4aec:   	xor	%l2, 0xc, %l2
	.word	0xe42be330	! t1_kref+0x4af0:   	stb	%l2, [%o7 + 0x330]
	.word	0x81dbe330	! t1_kref+0x4af4:   	flush	%o7 + 0x330
	.word	0x99b4c15b	! t1_kref+0x4af8:   	edge32l	%l3, %i3, %o4
	.word	0x9ba01895	! t1_kref+0x4afc:   	fitos	%f21, %f13
	.word	0x95b4cea0	! t1_kref+0x4b00:   	fsrc1s	%f19, %f10
	.word	0x992ac013	! t1_kref+0x4b04:   	sll	%o3, %l3, %o4
	.word	0x3c800003	! t1_kref+0x4b08:   	bpos,a	_kref+0x4b14
	.word	0xd620a01c	! t1_kref+0x4b0c:   	st	%o3, [%g2 + 0x1c]
	.word	0x25800007	! t1_kref+0x4b10:   	fblg,a	_kref+0x4b2c
	.word	0xd84e3fe0	! t1_kref+0x4b14:   	ldsb	[%i0 - 0x20], %o4
	.word	0xd80e4000	! t1_kref+0x4b18:   	ldub	[%i1], %o4
	.word	0x9802bd1b	! t1_kref+0x4b1c:   	add	%o2, -0x2e5, %o4
	.word	0x97a488a6	! t1_kref+0x4b20:   	fsubs	%f18, %f6, %f11
	.word	0x81d87ae9	! t1_kref+0x4b24:   	flush	%g1 - 0x517
	.word	0x21480004	! t1_kref+0x4b28:   	fbn,a,pt	%fcc0, _kref+0x4b38
	.word	0x987cbd2d	! t1_kref+0x4b2c:   	sdiv	%l2, -0x2d3, %o4
2:	.word	0xafa3893a	! t1_kref+0x4b30:   	fmuls	%f14, %f26, %f23
	.word	0x8143c000	! t1_kref+0x4b34:   	stbar
	.word	0xf007bfe0	! t1_kref+0x4b38:   	ld	[%fp - 0x20], %i0
	.word	0x37800007	! t1_kref+0x4b3c:   	fbge,a	_kref+0x4b58
	.word	0x98c2800a	! t1_kref+0x4b40:   	addccc	%o2, %o2, %o4
	.word	0x98f4801c	! t1_kref+0x4b44:   	udivcc	%l2, %i4, %o4
	.word	0x98a44011	! t1_kref+0x4b48:   	subcc	%l1, %l1, %o4
	.word	0x99408000	! t1_kref+0x4b4c:   	mov	%ccr, %o4
	.word	0x9962a392	! t1_kref+0x4b50:   	movue	%fcc0, 0x392, %o4
	.word	0x988a8000	! t1_kref+0x4b54:   	andcc	%o2, %g0, %o4
	.word	0x9de3bfa0	! t1_kref+0x4b58:   	save	%sp, -0x60, %sp
	.word	0xba96e1e9	! t1_kref+0x4b5c:   	orcc	%i3, 0x1e9, %i5
	.word	0x99ef66d9	! t1_kref+0x4b60:   	restore	%i5, 0x6d9, %o4
	.word	0xd808a02e	! t1_kref+0x4b64:   	ldub	[%g2 + 0x2e], %o4
	.word	0x99a549b8	! t1_kref+0x4b68:   	fdivs	%f21, %f24, %f12
	.word	0xd678a01c	! t1_kref+0x4b6c:   	swap	[%g2 + 0x1c], %o3
	.word	0x91a0014c	! t1_kref+0x4b70:   	fabsd	%f12, %f8
	.word	0xe43e2008	! t1_kref+0x4b74:   	std	%l2, [%i0 + 8]
	.word	0x993d801a	! t1_kref+0x4b78:   	sra	%l6, %i2, %o4
	.word	0x81aa4a33	! t1_kref+0x4b7c:   	fcmps	%fcc0, %f9, %f19
	.word	0x89a00550	! t1_kref+0x4b80:   	fsqrtd	%f16, %f4
	.word	0x89a0c82b	! t1_kref+0x4b84:   	fadds	%f3, %f11, %f4
	.word	0x89a00527	! t1_kref+0x4b88:   	fsqrts	%f7, %f4
	.word	0xe900a034	! t1_kref+0x4b8c:   	ld	[%g2 + 0x34], %f20
	.word	0x98673a97	! t1_kref+0x4b90:   	subc	%i4, -0x569, %o4
	.word	0xb1a249b2	! t1_kref+0x4b94:   	fdivs	%f9, %f18, %f24
	.word	0x91a00523	! t1_kref+0x4b98:   	fsqrts	%f3, %f8
	.word	0xd830a01e	! t1_kref+0x4b9c:   	sth	%o4, [%g2 + 0x1e]
	.word	0xd848a02f	! t1_kref+0x4ba0:   	ldsb	[%g2 + 0x2f], %o4
	.word	0x21480001	! t1_kref+0x4ba4:   	fbn,a,pt	%fcc0, _kref+0x4ba8
	.word	0x95a409a5	! t1_kref+0x4ba8:   	fdivs	%f16, %f5, %f10
	.word	0xb3a0052a	! t1_kref+0x4bac:   	fsqrts	%f10, %f25
	.word	0x8143c000	! t1_kref+0x4bb0:   	stbar
	.word	0xd856c019	! t1_kref+0x4bb4:   	ldsh	[%i3 + %i1], %o4
	.word	0xe968a0c2	! t1_kref+0x4bb8:   	prefetch	%g2 + 0xc2, 20
	.word	0x89a84046	! t1_kref+0x4bbc:   	fmovdne	%fcc0, %f6, %f4
	.word	0x9bb0076c	! t1_kref+0x4bc0:   	fpack16	%f12, %f13
	.word	0x2c480002	! t1_kref+0x4bc4:   	bneg,a,pt	%icc, _kref+0x4bcc
	.word	0x98c2801c	! t1_kref+0x4bc8:   	addccc	%o2, %i4, %o4
	.word	0xe100a03c	! t1_kref+0x4bcc:   	ld	[%g2 + 0x3c], %f16
	.word	0x95a24826	! t1_kref+0x4bd0:   	fadds	%f9, %f6, %f10
	.word	0xb1a01923	! t1_kref+0x4bd4:   	fstod	%f3, %f24
	.word	0x23800006	! t1_kref+0x4bd8:   	fbne,a	_kref+0x4bf0
	.word	0xa3b00778	! t1_kref+0x4bdc:   	fpack16	%f24, %f17
	call	SYM(t1_subr1)
	.word	0x98d5b489	! t1_kref+0x4be4:   	umulcc	%l6, -0xb77, %o4
	.word	0x98fd400d	! t1_kref+0x4be8:   	sdivcc	%l5, %o5, %o4
	.word	0x22480005	! t1_kref+0x4bec:   	be,a,pt	%icc, _kref+0x4c00
	.word	0x9842001a	! t1_kref+0x4bf0:   	addc	%o0, %i2, %o4
	.word	0xd8167fec	! t1_kref+0x4bf4:   	lduh	[%i1 - 0x14], %o4
	.word	0xada00558	! t1_kref+0x4bf8:   	fsqrtd	%f24, %f22
	.word	0x988373f2	! t1_kref+0x4bfc:   	addcc	%o5, -0xc0e, %o4
	.word	0x99b6802a	! t1_kref+0x4c00:   	edge8n	%i2, %o2, %o4
	.word	0xec28a027	! t1_kref+0x4c04:   	stb	%l6, [%g2 + 0x27]
	.word	0x992a6015	! t1_kref+0x4c08:   	sll	%o1, 0x15, %o4
	.word	0x87b00fe0	! t1_kref+0x4c0c:   	fones	%f3
	.word	0xd46e401a	! t1_kref+0x4c10:   	ldstub	[%i1 + %i2], %o2
	.word	0xe43f4019	! t1_kref+0x4c14:   	std	%l2, [%i5 + %i1]
	.word	0x988dbf92	! t1_kref+0x4c18:   	andcc	%l6, -0x6e, %o4
	.word	0x31480004	! t1_kref+0x4c1c:   	fba,a,pt	%fcc0, _kref+0x4c2c
	.word	0xcb20a00c	! t1_kref+0x4c20:   	st	%f5, [%g2 + 0xc]
	.word	0x8da00554	! t1_kref+0x4c24:   	fsqrtd	%f20, %f6
	.word	0xafa01a3a	! t1_kref+0x4c28:   	fstoi	%f26, %f23
	.word	0x99408000	! t1_kref+0x4c2c:   	mov	%ccr, %o4
	.word	0x99a4c8ac	! t1_kref+0x4c30:   	fsubs	%f19, %f12, %f12
	.word	0x9865800d	! t1_kref+0x4c34:   	subc	%l6, %o5, %o4
	.word	0x98624011	! t1_kref+0x4c38:   	subc	%o1, %l1, %o4
	.word	0xe6360000	! t1_kref+0x4c3c:   	sth	%l3, [%i0]
	.word	0x3a480001	! t1_kref+0x4c40:   	bcc,a,pt	%icc, _kref+0x4c44
	.word	0x9816f10a	! t1_kref+0x4c44:   	or	%i3, -0xef6, %o4
	.word	0x81a88ad6	! t1_kref+0x4c48:   	fcmped	%fcc0, %f2, %f22
	.word	0xa3a00530	! t1_kref+0x4c4c:   	fsqrts	%f16, %f17
	.word	0xe40861fc	! t1_kref+0x4c50:   	ldub	[%g1 + 0x1fc], %l2
	.word	0xa41ca00c	! t1_kref+0x4c54:   	xor	%l2, 0xc, %l2
	.word	0xe42861fc	! t1_kref+0x4c58:   	stb	%l2, [%g1 + 0x1fc]
	.word	0x81d861fc	! t1_kref+0x4c5c:   	flush	%g1 + 0x1fc
	.word	0x95b306a4	! t1_kref+0x4c60:   	fmul8x16al	%f12, %f4, %f10
	.word	0xd8063ff4	! t1_kref+0x4c64:   	ld	[%i0 - 0xc], %o4
	.word	0xdaa6501c	! t1_kref+0x4c68:   	sta	%o5, [%i1 + %i4]0x80
	.word	0x98128011	! t1_kref+0x4c6c:   	or	%o2, %l1, %o4
	.word	0x99b4806c	! t1_kref+0x4c70:   	edge8ln	%l2, %o4, %o4
	.word	0x9927001b	! t1_kref+0x4c74:   	mulscc	%i4, %i3, %o4
2:	.word	0xada609b1	! t1_kref+0x4c78:   	fdivs	%f24, %f17, %f22
	.word	0x81ad0aa5	! t1_kref+0x4c7c:   	fcmpes	%fcc0, %f20, %f5
	.word	0x81ddbca5	! t1_kref+0x4c80:   	flush	%l6 - 0x35b
	.word	0x9f414000	! t1_kref+0x4c84:   	mov	%pc, %o7
	.word	0x8db00cc4	! t1_kref+0x4c88:   	fnot2	%f4, %f6
	.word	0x98928016	! t1_kref+0x4c8c:   	orcc	%o2, %l6, %o4
	.word	0x8143c000	! t1_kref+0x4c90:   	stbar
	.word	0xd8063ff8	! t1_kref+0x4c94:   	ld	[%i0 - 8], %o4
	.word	0x81dc4010	! t1_kref+0x4c98:   	flush	%l1 + %l0
	.word	0x95a0108c	! t1_kref+0x4c9c:   	fxtos	%f12, %f10
	.word	0xd67e200c	! t1_kref+0x4ca0:   	swap	[%i0 + 0xc], %o3
	.word	0xc3ee1016	! t1_kref+0x4ca4:   	prefetcha	%i0 + %l6, 1
	.word	0xc0a71019	! t1_kref+0x4ca8:   	sta	%g0, [%i4 + %i1]0x80
	.word	0xe1380019	! t1_kref+0x4cac:   	std	%f16, [%g0 + %i1]
	.word	0x81ab4ab8	! t1_kref+0x4cb0:   	fcmpes	%fcc0, %f13, %f24
	.word	0x98beb3ee	! t1_kref+0x4cb4:   	xnorcc	%i2, -0xc12, %o4
	.word	0x190fa9f8	! t1_kref+0x4cb8:   	sethi	%hi(0x3ea7e000), %o4
	.word	0x9db00cd4	! t1_kref+0x4cbc:   	fnot2	%f20, %f14
	.word	0x3b800001	! t1_kref+0x4cc0:   	fble,a	_kref+0x4cc4
	.word	0x987a2159	! t1_kref+0x4cc4:   	sdiv	%o0, 0x159, %o4
	.word	0x81858000	! t1_kref+0x4cc8:   	wr	%l6, %g0, %y
	.word	0x98373a58	! t1_kref+0x4ccc:   	orn	%i4, -0x5a8, %o4
	.word	0x9db30fb3	! t1_kref+0x4cd0:   	fors	%f12, %f19, %f14
	.word	0xed20a034	! t1_kref+0x4cd4:   	st	%f22, [%g2 + 0x34]
	.word	0x9fb64dfa	! t1_kref+0x4cd8:   	fnands	%f25, %f26, %f15
	.word	0xec3e6000	! t1_kref+0x4cdc:   	std	%l6, [%i1]
	.word	0xa5b1c706	! t1_kref+0x4ce0:   	fmuld8sux16	%f7, %f6, %f18
	.word	0x98154009	! t1_kref+0x4ce4:   	or	%l5, %o1, %o4
	.word	0x992f0011	! t1_kref+0x4ce8:   	sll	%i4, %l1, %o4
	.word	0x81830000	! t1_kref+0x4cec:   	wr	%o4, %g0, %y
	.word	0x32480006	! t1_kref+0x4cf0:   	bne,a,pt	%icc, _kref+0x4d08
	.word	0x97a01a2a	! t1_kref+0x4cf4:   	fstoi	%f10, %f11
	.word	0x98dc8009	! t1_kref+0x4cf8:   	smulcc	%l2, %o1, %o4
	.word	0x1905b50d	! t1_kref+0x4cfc:   	sethi	%hi(0x16d43400), %o4
	.word	0xb5a9402e	! t1_kref+0x4d00:   	fmovsug	%fcc0, %f14, %f26
	.word	0x98fa4013	! t1_kref+0x4d04:   	sdivcc	%o1, %l3, %o4
	.word	0xa7b54de8	! t1_kref+0x4d08:   	fnands	%f21, %f8, %f19
	.word	0x99a00542	! t1_kref+0x4d0c:   	fsqrtd	%f2, %f12
	.word	0xa5a01a46	! t1_kref+0x4d10:   	fdtoi	%f6, %f18
	.word	0x81aa8aba	! t1_kref+0x4d14:   	fcmpes	%fcc0, %f10, %f26
	.word	0x89a00554	! t1_kref+0x4d18:   	fsqrtd	%f20, %f4
	.word	0xa1b40f8c	! t1_kref+0x4d1c:   	for	%f16, %f12, %f16
	.word	0x98f37f51	! t1_kref+0x4d20:   	udivcc	%o5, -0xaf, %o4
	.word	0x21800003	! t1_kref+0x4d24:   	fbn,a	_kref+0x4d30
	.word	0x993a2005	! t1_kref+0x4d28:   	sra	%o0, 0x5, %o4
	.word	0x9da00556	! t1_kref+0x4d2c:   	fsqrtd	%f22, %f14
	.word	0xa9b00fc0	! t1_kref+0x4d30:   	fone	%f20
	.word	0x99b28490	! t1_kref+0x4d34:   	fcmple32	%f10, %f16, %o4
	.word	0x95a00544	! t1_kref+0x4d38:   	fsqrtd	%f4, %f10
	.word	0x9822c000	! t1_kref+0x4d3c:   	sub	%o3, %g0, %o4
	.word	0xc7ee100d	! t1_kref+0x4d40:   	prefetcha	%i0 + %o5, 3
	.word	0x81a98aca	! t1_kref+0x4d44:   	fcmped	%fcc0, %f6, %f10
	.word	0xec180019	! t1_kref+0x4d48:   	ldd	[%g0 + %i1], %l6
	.word	0x99b58036	! t1_kref+0x4d4c:   	edge8n	%l6, %l6, %o4
	.word	0x9db30a44	! t1_kref+0x4d50:   	fpadd32	%f12, %f4, %f14
	.word	0x99b505c4	! t1_kref+0x4d54:   	fcmpeq32	%f20, %f4, %o4
	.word	0x9924c016	! t1_kref+0x4d58:   	mulscc	%l3, %l6, %o4
	.word	0x85870015	! t1_kref+0x4d5c:   	wr	%i4, %l5, %ccr
	.word	0xf828a007	! t1_kref+0x4d60:   	stb	%i4, [%g2 + 7]
	.word	0x31480002	! t1_kref+0x4d64:   	fba,a,pt	%fcc0, _kref+0x4d6c
	.word	0xd828a03f	! t1_kref+0x4d68:   	stb	%o4, [%g2 + 0x3f]
	.word	0xa1a089d0	! t1_kref+0x4d6c:   	fdivd	%f2, %f16, %f16
	.word	0xa1a48827	! t1_kref+0x4d70:   	fadds	%f18, %f7, %f16
	.word	0xaba01a4e	! t1_kref+0x4d74:   	fdtoi	%f14, %f21
	.word	0xa9b50da6	! t1_kref+0x4d78:   	fxors	%f20, %f6, %f20
	.word	0xee28a035	! t1_kref+0x4d7c:   	stb	%l7, [%g2 + 0x35]
	.word	0xcd1e0000	! t1_kref+0x4d80:   	ldd	[%i0], %f6
	.word	0xc108271c	! t1_kref+0x4d84:   	ld	[%g0 + 0x71c], %fsr
	.word	0x39480003	! t1_kref+0x4d88:   	fbuge,a,pt	%fcc0, _kref+0x4d94
	.word	0xed68a044	! t1_kref+0x4d8c:   	prefetch	%g2 + 0x44, 22
	.word	0x983f0009	! t1_kref+0x4d90:   	xnor	%i4, %o1, %o4
	.word	0x35480001	! t1_kref+0x4d94:   	fbue,a,pt	%fcc0, _kref+0x4d98
	.word	0x98424015	! t1_kref+0x4d98:   	addc	%o1, %l5, %o4
	.word	0x99b384cc	! t1_kref+0x4d9c:   	fcmpne32	%f14, %f12, %o4
	.word	0xd830a00e	! t1_kref+0x4da0:   	sth	%o4, [%g2 + 0xe]
	.word	0x1934f118	! t1_kref+0x4da4:   	sethi	%hi(0xd3c46000), %o4
	.word	0x25480002	! t1_kref+0x4da8:   	fblg,a,pt	%fcc0, _kref+0x4db0
	.word	0x98a4b5ef	! t1_kref+0x4dac:   	subcc	%l2, -0xa11, %o4
	.word	0x98ba70e4	! t1_kref+0x4db0:   	xnorcc	%o1, -0xf1c, %o4
	.word	0x99a01a31	! t1_kref+0x4db4:   	fstoi	%f17, %f12
	.word	0x858377b3	! t1_kref+0x4db8:   	wr	%o5, 0xfffff7b3, %ccr
	.word	0x93a3c9b7	! t1_kref+0x4dbc:   	fdivs	%f15, %f23, %f9
	.word	0xd808a02f	! t1_kref+0x4dc0:   	ldub	[%g2 + 0x2f], %o4
	.word	0xf11fbf50	! t1_kref+0x4dc4:   	ldd	[%fp - 0xb0], %f24
	.word	0xe9263ff4	! t1_kref+0x4dc8:   	st	%f20, [%i0 - 0xc]
	.word	0xb5a549b2	! t1_kref+0x4dcc:   	fdivs	%f21, %f18, %f26
	.word	0x98dc68f5	! t1_kref+0x4dd0:   	smulcc	%l1, 0x8f5, %o4
	.word	0xd80e4000	! t1_kref+0x4dd4:   	ldub	[%i1], %o4
	.word	0xb1b24db6	! t1_kref+0x4dd8:   	fxors	%f9, %f22, %f24
	.word	0x8db286e4	! t1_kref+0x4ddc:   	fmul8ulx16	%f10, %f4, %f6
	.word	0x2f480003	! t1_kref+0x4de0:   	fbu,a,pt	%fcc0, _kref+0x4dec
	.word	0xe228a004	! t1_kref+0x4de4:   	stb	%l1, [%g2 + 4]
	.word	0xd8063fe0	! t1_kref+0x4de8:   	ld	[%i0 - 0x20], %o4
	.word	0x8186c000	! t1_kref+0x4dec:   	wr	%i3, %g0, %y
	.word	0xc807bff0	! t1_kref+0x4df0:   	ld	[%fp - 0x10], %g4
	.word	0x29480008	! t1_kref+0x4df4:   	fbl,a,pt	%fcc0, _kref+0x4e14
	.word	0xb5b38a88	! t1_kref+0x4df8:   	fpsub16	%f14, %f8, %f26
	.word	0xed68a101	! t1_kref+0x4dfc:   	prefetch	%g2 + 0x101, 22
	.word	0x99a0190c	! t1_kref+0x4e00:   	fitod	%f12, %f12
	.word	0x99a00535	! t1_kref+0x4e04:   	fsqrts	%f21, %f12
	.word	0xd856c019	! t1_kref+0x4e08:   	ldsh	[%i3 + %i1], %o4
	.word	0x99b5c280	! t1_kref+0x4e0c:   	array32	%l7, %g0, %o4
	.word	0x98982381	! t1_kref+0x4e10:   	xorcc	%g0, 0x381, %o4
	.word	0xe630a016	! t1_kref+0x4e14:   	sth	%l3, [%g2 + 0x16]
	.word	0x98bc801b	! t1_kref+0x4e18:   	xnorcc	%l2, %i3, %o4
	.word	0x01000000	! t1_kref+0x4e1c:   	nop
	.word	0x01000000	! t1_kref+0x4e20:   	nop
	.word	0x01000000	! t1_kref+0x4e24:   	nop
	call	SYM(_kaos_done)
	.word	0x01000000	! t1_kref+0x4e2c:   	nop
	KGLOBAL(t1_ktbl_end)
t1_ktbl_end:
t1_ktbl_page_end:

KTEXT_MODULE(t1_module_subr0, 0x6e2e6000)
.seg "text"
t1_subr0_page_begin:
	.skip 8188
.global _t1_subr0; ENTRY(t1_subr0)
	.word	0xa6844012	! t1_subr0+0x0:   	addcc	%l1, %l2, %l3
	.word	0x81c3e008	! t1_subr0+0x4:   	retl
	.word	0xaa64c014	! t1_subr0+0x8:   	subc	%l3, %l4, %l5
t1_subr0_page_end:

KTEXT_MODULE(t1_module_subr1, 0x710d4000)
.seg "text"
t1_subr1_page_begin:
	.skip 8192
.global _t1_subr1; ENTRY(t1_subr1)
	.word	0x9de3bfa0	! t1_subr1+0x0:   	save	%sp, -0x60, %sp
	.word	0xb29eaa5a	! t1_subr1+0x4:   	xorcc	%i2, 0xa5a, %i1
	.word	0x81c7e008	! t1_subr1+0x8:   	ret
	.word	0xa7ee6001	! t1_subr1+0xc:   	restore	%i1, 1, %l3
t1_subr1_page_end:

KTEXT_MODULE(t1_module_subr2, 0x6a8c4000)
.seg "text"
t1_subr2_page_begin:
	.skip 8180
.global _t1_subr2; ENTRY(t1_subr2)
	.word	0x9de3bfa0	! t1_subr2+0x0:   	save	%sp, -0x60, %sp
	.word	0xb2066001	! t1_subr2+0x4:   	add	%i1, 1, %i1
	.word	0x81c7e008	! t1_subr2+0x8:   	ret
	.word	0xa3ee6001	! t1_subr2+0xc:   	restore	%i1, 1, %l1
t1_subr2_page_end:

KTEXT_MODULE(t1_module_subr3, 0x65530000)
.seg "text"
t1_subr3_page_begin:
	.skip 8192
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
!  Total operations: 4740  
!
!  Operation frequencies
!
!  name               exp    obs
!  ldsb              0.56   0.42
!  ldub              1.05   0.99
!  ldsh              1.27   1.48
!  lduh              0.32   0.44
!  ld                0.93   0.99
!  ldd               0.13   0.11
!  swap              0.86   1.10
!  ldstub            0.12   0.13
!  stb               0.25   0.19
!  sth               0.51   0.44
!  st                0.51   0.53
!  std               1.09   1.16
!  add               0.68   0.72
!  addcc             0.54   0.55
!  addx              0.64   0.93
!  addxcc            0.89   0.91
!  taddcc            0.05   0.08
!  taddcctv          0.11   0.19
!  sub               0.13   0.13
!  subcc             1.03   1.20
!  subx              1.12   1.20
!  subxcc            1.15   0.99
!  tsubcc            0.13   0.13
!  tsubcctv          0.26   0.19
!  mulscc            0.92   1.01
!  and               0.14   0.08
!  andcc             0.27   0.32
!  andn              0.25   0.36
!  andncc            0.19   0.19
!  or                0.66   0.86
!  orcc              0.90   0.78
!  orn               0.35   0.49
!  orncc             0.10   0.17
!  xor               0.12   0.21
!  xorcc             0.86   0.76
!  xnor              0.64   0.76
!  xnorcc            0.96   1.31
!  sll               0.97   0.91
!  srl               0.02   0.02
!  sra               1.09   1.01
!  unimp             0.11   0.11
!  umul              0.52   0.51
!  smul              0.10   0.13
!  udiv              0.01   0.00
!  sdiv              0.24   0.25
!  umulcc            0.55   0.42
!  smulcc            1.19   1.24
!  udivcc            1.06   1.20
!  sdivcc            0.68   1.12
!  rdy               0.41   0.59
!  wry               1.26   1.50
!  bicc              0.48   0.36
!  sethi             0.81   0.86
!  jmpl              0.25   0.25
!  call              0.82   0.63
!  ticc              0.00   0.00
!  flush             1.24   1.48
!  save              0.82   0.61
!  restore           0.15   0.00
!  stbar             0.95   0.74
!  ldf               0.03   0.06
!  lddf              0.86   0.78
!  stf               0.50   0.55
!  stdf              0.85   0.97
!  fadds             0.78   0.78
!  fsubs             0.66   0.51
!  fmuls             1.14   1.37
!  fdivs             1.11   1.35
!  faddd             0.65   0.99
!  fsubd             0.34   0.25
!  fmuld             0.08   0.04
!  fdivd             0.55   0.51
!  faddq             0.00   0.00
!  fsubq             0.00   0.00
!  fmulq             0.00   0.00
!  fdivq             0.00   0.00
!  fsmuld            0.22   0.11
!  fdmulq            0.00   0.00
!  fitos             0.61   0.70
!  fitod             1.09   1.20
!  fitoq             0.00   0.00
!  fstoi             1.35   1.58
!  fstod             0.63   0.61
!  fstoq             0.00   0.00
!  fdtoi             1.12   1.10
!  fdtos             0.48   0.38
!  fdtoq             0.00   0.00
!  fqtoi             0.00   0.00
!  fqtos             0.00   0.00
!  fqtod             0.00   0.00
!  fmovs             0.40   0.40
!  fnegs             0.10   0.06
!  fabss             0.47   0.44
!  fsqrts            2.16   2.19
!  fsqrtd            2.62   2.72
!  fsqrtq            0.00   0.00
!  fcmps             1.28   1.14
!  fcmpd             0.25   0.32
!  fcmpq             0.00   0.00
!  fcmpes            0.46   0.49
!  fcmped            1.21   1.05
!  fcmpeq            0.00   0.00
!  fbfcc             2.87   2.57
!  ldfsr             0.05   0.00
!  stfsr             0.11   0.11
!  loop              0.11   0.04
!  offset            0.12   0.08
!  area              0.14   0.19
!  target            0.18   0.17
!  goto              0.11   0.17
!  sigsegv           0.22   0.25
!  sigbus            0.17   0.21
!  imodify           1.36   1.14
!  ldfsr_offset      0.09   0.00
!  fpattern          0.95   0.86
!  lbranch           0.24   0.36
!  shmld             3.30   3.31
!  shmst             5.30   5.46
!  shmpf             1.19   1.22
!  shmswap           0.26   0.34
!  shmblkld          1.24   0.04
!  shmblkst          0.90   0.17
!  shmblkchk         0.31   0.32
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
!  casa              0.17   0.15
!  rdasi             0.25   0.13
!  wrasi             0.25   0.23
!  bpcc              1.23   0.97
!  fbpfcc            2.95   2.51
!  fmovscc           0.25   0.30
!  fmovdcc           0.18   0.23
!  fmovqcc           0.00   0.00
!  movcc             0.05   0.06
!  flushw            0.11   0.08
!  membar            0.23   0.17
!  prefetch          0.06   0.11
!  rdpc              0.11   0.11
!  ldqf              0.00   0.00
!  stqf              0.00   0.00
!  ldfa              0.13   0.21
!  lddfa             0.14   0.23
!  ldqfa             0.00   0.00
!  ldsba             0.13   0.06
!  ldsha             0.07   0.04
!  lduba             0.09   0.15
!  lduha             0.02   0.00
!  lda               0.11   0.15
!  ldda              0.02   0.02
!  ldstuba           0.26   0.32
!  prefetcha         1.01   1.35
!  stfa              0.16   0.17
!  stdfa             0.04   0.02
!  stqfa             0.00   0.00
!  stba              0.00   0.00
!  stha              0.03   0.02
!  sta               0.21   0.19
!  stda              0.05   0.06
!  swapa             0.26   0.27
!  fmovd             0.02   0.04
!  fnegd             0.09   0.06
!  fabsd             0.16   0.19
!  fstox             0.20   0.19
!  fdtox             0.07   0.06
!  fxtos             0.26   0.19
!  fxtod             0.12   0.15
!  lds               0.25   0.30
!  ldsa              0.19   0.17
!  ldx               0.07   0.00
!  ldxa              0.01   0.02
!  nofault           0.10   0.11
!  rdgsr             0.02   0.00
!  wrgsr             0.09   0.08
!  fpadd16           0.07   0.04
!  fpadd16s          0.13   0.13
!  fpadd32           0.26   0.30
!  fpadd32s          0.23   0.15
!  fpsub16           0.12   0.19
!  fpsub16s          0.20   0.21
!  fpsub32           0.04   0.02
!  fpsub32s          0.20   0.19
!  fpack16           0.23   0.25
!  fpack32           0.11   0.13
!  fpackfix          0.07   0.06
!  fexpand           0.02   0.02
!  fpmerge           0.22   0.30
!  fmul8x16          0.07   0.06
!  fmul8x16au        0.07   0.02
!  fmul8x16al        0.18   0.13
!  fmul8sux16        0.15   0.15
!  fmul8ulx16        0.15   0.21
!  fmuld8sux16       0.15   0.15
!  fmuld8ulx16       0.13   0.06
!  alignaddr         0.02   0.04
!  alignaddrl        0.14   0.13
!  faligndata        0.13   0.13
!  fzero             0.25   0.23
!  fzeros            0.14   0.11
!  fone              0.25   0.25
!  fones             0.15   0.11
!  fsrc1             0.13   0.13
!  fsrc1s            0.21   0.23
!  fsrc2             0.05   0.13
!  fsrc2s            0.15   0.17
!  fnot1             0.25   0.32
!  fnot1s            0.09   0.06
!  fnot2             0.16   0.21
!  fnot2s            0.26   0.34
!  for               0.26   0.38
!  fors              0.24   0.30
!  fnor              0.01   0.00
!  fnors             0.09   0.13
!  fand              0.03   0.00
!  fands             0.17   0.21
!  fnand             0.17   0.19
!  fnands            0.23   0.23
!  fxor              0.09   0.06
!  fxors             0.24   0.23
!  fxnor             0.17   0.25
!  fxnors            0.01   0.00
!  fornot1           0.03   0.00
!  fornot1s          0.19   0.15
!  fornot2           0.02   0.02
!  fornot2s          0.15   0.21
!  fandnot1          0.26   0.19
!  fandnot1s         0.05   0.08
!  fandnot2          0.01   0.00
!  fandnot2s         0.13   0.17
!  fcmpgt16          0.25   0.21
!  fcmpgt32          0.17   0.08
!  fcmple16          0.09   0.04
!  fcmple32          0.23   0.27
!  fcmpne16          0.21   0.19
!  fcmpne32          0.26   0.30
!  fcmpeq16          0.18   0.17
!  fcmpeq32          0.24   0.11
!  edge8             0.07   0.06
!  edge8l            0.00   0.00
!  edge16            0.04   0.00
!  edge16l           0.19   0.19
!  edge32            0.13   0.23
!  edge32l           0.13   0.11
!  pdist             0.01   0.00
!  partial_st8       0.12   0.23
!  partial_st16      0.02   0.00
!  partial_st32      0.16   0.30
!  short_st8         0.12   0.11
!  short_st16        0.19   0.04
!  short_ld8         0.10   0.08
!  short_ld16        0.19   0.13
!  blkld             0.05   0.00
!  blkst             0.00   0.00
!  blkld_offset      0.23   0.00
!  blkst_offset      0.12   0.00
!  blk_check         0.06   0.06
!  casxa             0.11   0.08
!  rdccr             0.25   0.32
!  rdfprs            0.07   0.11
!  wrccr             0.09   0.08
!  popc              0.08   0.08
!  wrfprs            0.25   0.17
!  stx               0.23   0.27
!  stxa              0.12   0.11
!  cflush            0.00   0.00
!  array8            0.05   0.02
!  array16           0.21   0.23
!  array32           0.23   0.23
!  edge8n            0.19   0.27
!  edge8ln           0.17   0.17
!  edge16n           0.02   0.02
!  edge16ln          0.20   0.38
!  edge32n           0.25   0.19
!  edge32ln          0.06   0.04
!  bmask             0.21   0.08
!  bshuffle          0.05   0.06
!  siam              0.01   0.02
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
KDATA_MODULE(t1_module_offset_table, 0x7c346000)
.seg "data"
t1_offset_table_start:
t1_offset_table_size:	.word	0x00000008
t1_offset_table:
	.word	0xfffffff8
	.word	0xffffffe0
	.word	0x00000010
	.word	0xffffffe8
	.word	0x00000000
	.word	0xfffffff0
	.word	0x00000008
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

KDATA_MODULE(t1_module_data_in_regs, 0x72604000)
.seg "data"
KGLOBAL(t1_data_in_regs)
t1_data_in_regs_start:
t1_data_in_regs:
	.word	0x2e3c67e7          ! %f0
	.word	0x2b6c73c1          ! %f1
	.word	0x63c593d5          ! %f2
	.word	0x7ad82a23          ! %f3
	.word	0x1df9ce91          ! %f4
	.word	0xb650f092          ! %f5
	.word	0x7bc7aa28          ! %f6
	.word	0xa6db7a3d          ! %f7
	.word	0xc53cbd07          ! %f8
	.word	0x77ac7c63          ! %f9
	.word	0xf1d6a87d          ! %f10
	.word	0x0923c2ec          ! %f11
	.word	0x8dabe3c6          ! %f12
	.word	0x00d16f9e          ! %f13
	.word	0x28a1539d          ! %f14
	.word	0xf8b0ff5a          ! %f15
	.word	0xbdbd49a7          ! %f16
	.word	0x2c8ee30b          ! %f17
	.word	0xb8786c3d          ! %f18
	.word	0x67099633          ! %f19
	.word	0x39268e52          ! %f20
	.word	0xc5a1332e          ! %f21
	.word	0x3b727893          ! %f22
	.word	0x1f0225ab          ! %f23
	.word	0x48ea5ff0          ! %f24
	.word	0x661cd5ed          ! %f25
	.word	0x950a132b          ! %f26
	.word	0x01678bc6          ! %f27
	.word	0xc9db1824          ! %f28
	.word	0xe6fe6676          ! %f29
	.word	0x8b51d2fa          ! %f30
	.word	0x2d0aaed3          ! %f31
	.word	0x2175b43b          ! %f32
	.word	0x44550b5f          ! %f33
	.word	0x65f620b3          ! %f34
	.word	0xd9a1ca38          ! %f35
	.word	0x97779ca1          ! %f36
	.word	0xca2a9b0e          ! %f37
	.word	0xe1f68d59          ! %f38
	.word	0xc9eb4375          ! %f39
	.word	0x11c4ef96          ! %f40
	.word	0xf29f225a          ! %f41
	.word	0xd5857e14          ! %f42
	.word	0x45ba4b62          ! %f43
	.word	0x875c4322          ! %f44
	.word	0xbce3b172          ! %f45
	.word	0x27164148          ! %f46
	.word	0xb855cfbb          ! %f47
	.word	0xd9701246          ! %f48
	.word	0xb91a92fd          ! %f49
	.word	0x5a8ee0e4          ! %f50
	.word	0x4f1680de          ! %f51
	.word	0x9e8d4973          ! %f52
	.word	0x3ce15182          ! %f53
	.word	0xa11445f7          ! %f54
	.word	0x3fb8efd2          ! %f55
	.word	0xfe39a63f          ! %f56
	.word	0x81ab2f0a          ! %f57
	.word	0x903c8188          ! %f58
	.word	0xf1a5088b          ! %f59
	.word	0x2aebde56          ! %f60
	.word	0x0758f304          ! %f61
	.word	0x05dc4ea6          ! %f62
	.word	0xe1bc6c6b          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t1_kref+0x9b0       ! %g1 (code pointer)
	.word	t1_data_in_shm_area ! %g2 (shared area pointer)
	.word	0x15c749ed          ! %g3 (loop index)
	.word	SYM(t1_subr1)       ! %g4 (jmpl target)
	.word	t1_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0xa9bcd970          ! %o0
	.word	0xf53ae39f          ! %o1
	.word	0xa91d6312          ! %o2
	.word	0x88140e48          ! %o3
	.word	0xb8dbf295          ! %o4
	.word	0x2b974bdc          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0xafeac1ae          ! %l0
	.word	0xd4e53267          ! %l1
	.word	0x336221bd          ! %l2
	.word	0x4155710c          ! %l3
	.word	0x77bfcbfe          ! %l4
	.word	0xd4ca761d          ! %l5
	.word	0xd802592b          ! %l6
	.word	0x8f20c73c          ! %l7
	.word	t1_data_in_area0    ! %i0 (area pointer)
	.word	t1_data_in_area0    ! %i1 (area pointer)
	.word	0xffffffff          ! %i2 (byte offset)
	.word	0xffffffee          ! %i3 (halfword offset)
	.word	0x00000008          ! %i4 (word offset)
	.word	0xffffffe0          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0x3581ec6f          ! %y
	.word	0x0000000d          ! %icc (nzvc)
	.word	0x40000580          ! %fsr
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

KDATA_MODULE(t1_module_data_in_stack, 0x7b6d6000)
.seg "data"
KGLOBAL(t1_data_in_mtbl_size)
KGLOBAL(t1_data_in_mtbl)
KGLOBAL(t1_data_in_stack)
t1_data_in_stack_start:
	.word	0x35681d41
	.word	0x647f3bc9
	.word	0xe7262c69
	.word	0xce4d55e4
	.word	0x72fd335b
	.word	0x061226e5
	.word	0x83d99350
	.word	0x483db74a
	.word	0x15030886
	.word	0xf4fe4a5a
	.word	0xccc773bb
	.word	0x649dc639
	.word	0x733218de
	.word	0xd8bdd4e7
	.word	0x415355c6
	.word	0x69879d65
	.word	0x2e59c4f9
	.word	0x0e162c69
	.word	0x2ea933c6
	.word	0x422e3638
	.word	0xa22e983b
	.word	0x1c8b57a3
	.word	0xdb979ac1
	.word	0xa6d5723d
	.word	0x22862068
	.word	0xa0f9c041
	.word	0xe406de20
	.word	0xe8f6d6c1
	.word	0x1ac02a7a
	.word	0x257b9119
	.word	0x170352a3
	.word	0x9f83deb7
	.word	0x31c678b4
	.word	0x654f34b4
	.word	0x8f3bc494
	.word	0xc2e106dc
	.word	0x2a0945f6
	.word	0x72c8b80d
	.word	0xbe349d3f
	.word	0x8442f81b
	.word	0x14702a53
	.word	0xe5b01598
	.word	0x81836ba0
	.word	0xf2c97432
	.word	0x2c9c34e0
	.word	0xae0aac85
	.word	0xce6dc45e
	.word	0xd849e894
	.word	0xfd514ece
	.word	0xf26e6845
	.word	0xf681acf8
	.word	0xca75cb91
	.word	0x3aaa3bbb
	.word	0xd5e15c4c
	.word	0x5e6d063d
	.word	0x492727b3
	.word	0xa61bcb44
	.word	0x7830d819
	.word	0xcabcaa01
	.word	0x9a5ff96b
	.word	0xb3810fde
	.word	0x98d73773
	.word	0x2b83300d
	.word	0x7e2f42ed
	.word	0xffb3aee6
	.word	0x1837f2f4
	.word	0x4b728e57
	.word	0x8a78fa57
	.word	0xc5d09df5
	.word	0x096db4cb
	.word	0xa7f30872
	.word	0x1ecc3618
	.word	0xc17ae179
	.word	0x085e75bc
	.word	0x61752247
	.word	0x2d453b8f
	.word	0x87732081
	.word	0x4085e66b
	.word	0xfce38a05
	.word	0x352f53f2
	.word	0x9bf421d7
	.word	0xb126a8da
	.word	0x23f52d55
	.word	0x88f48b71
	.word	0x0cb18653
	.word	0x37971e30
	.word	0xb16eedd2
	.word	0x8127be9a
	.word	0x4457546e
	.word	0x3866ccbc
	.word	0xd367a8b8
	.word	0x645799ff
	.word	0x343e2915
	.word	0x2065a238
	.word	0x8f9885da
	.word	0x451f7015
	.word	0xe7f121bf
	.word	0xa7669651
	.word	0x57eec1d9
	.word	0xbfd5095e
	.word	0x8a5fd3c1
	.word	0xc42b7166
	.word	0xef336792
	.word	0x9580d2ca
	.word	0xd767e4e0
	.word	0xa37fbb90
	.word	0xa1f0acd8
	.word	0x84c00e5a
	.word	0xbb071927
	.word	0x006517e2
	.word	0xc603e663
	.word	0x3906ea07
	.word	0x633fe9fb
	.word	0xc0938ff1
	.word	0xb6c64707
	.word	0x9fb2a0e1
	.word	0x87c7fa6c
	.word	0x4bb49396
	.word	0xbba5de28
	.word	0xb6ba0a7a
	.word	0xf438fccd
	.word	0x4ce7b0f2
	.word	0xc6ab896d
	.word	0xeccd3c84
	.word	0x1bf1dd86
	.word	0x498c48b2
	.word	0x0701cdb3
	.word	0x449b22b8
	.word	0x635f4727
	.word	0x163bc293
	.word	0x645bcb44
	.word	0x96fe30f9
	.word	0xe63fd3c1
	.word	0xd7940628
	.word	0x0a5ac148
	.word	0xe83f93b9
	.word	0x76e97f71
	.word	0x102a3bda
	.word	0xda03d47a
	.word	0xcdb2829b
	.word	0xd4db303c
	.word	0xabfa1a30
	.word	0x7a3f0d1f
	.word	0x40df995a
	.word	0x323e6722
	.word	0xf4264351
	.word	0xa273c034
	.word	0xfe925ae8
	.word	0xedaa6e6d
	.word	0x902276c6
	.word	0x5ae5d7e6
	.word	0x209942da
	.word	0x58bb9949
	.word	0xeba89b83
	.word	0x40baaf47
	.word	0x132b0902
	.word	0xc2266899
	.word	0x7f65e627
	.word	0x46c3753e
	.word	0x50e9fb5d
	.word	0x1c17a907
	.word	0x155d9f82
	.word	0x0b964abe
	.word	0x8ca8922f
	.word	0x2b2fde5d
	.word	0x75d34f58
	.word	0x405e9039
	.word	0x9ca0a26c
t1_data_in_sp:
	.word	0x70799013
	.word	0x3e664f64
	.word	0x05601657
	.word	0xba00d25a
	.word	0x0e9f4b28
	.word	0x87250a9f
	.word	0xc8b025e3
	.word	0x7fca3473
	.word	t1_data_in_area0
	.word	t1_data_in_area0
	.word	0xfffffff0
	.word	0xffffffe0
	.word	0xfffffff4
	.word	0x00000018
	.word	t1_data_in_fp
	.word	0xea5c4607
	.word	0x12984fb6
	.word	0xac5b0342
	.word	0x55ae92cb
	.word	0x5219a737
	.word	0x42c0316f
	.word	0x1677cb82
	.word	0x1f6fd9b6
	.word	0x02b479e1
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
	.word   	0xf331de23	! [%fp - 0xc]
	.word   	0xe8967e8d	! [%fp - 0x8]
	.word   	0x8386e547	! [%fp - 0x4]
.global t1_data_in_fp; t1_data_in_fp:
	.word	0x47c9d8e6
	.word	0x68561470
	.word	0x6e957209
	.word	0x2bdf87fd
	.word	0x12e0ed3e
	.word	0x9e0ec310
	.word	0xaa778c6c
	.word	0xc3b389ae
	.word	0xca8052f5
	.word	0x4444a395
	.word	0xcb9cdb9d
	.word	0xa92a2352
	.word	0x33c64a76
	.word	0x53a74c55
	.word	0x399b71db
	.word	0xbc52e41a
	.word	0x837c3a0b
	.word	0xb707eda2
	.word	0xb9ceacde
	.word	0xe44153c7
	.word	0x5c2243a3
	.word	0xe7862e3e
	.word	0x0f714b3b
	.word	0x198fe63a
t1_data_in_stacktop:
	.word	0
t1_data_in_stack_end:
.skip 6300	! page align

KDATA_MODULE(t1_module_data_in_area0, 0x4df8a000)
.seg "data"
t1_data_in_area0_start:
.skip 4160
t1_data_in_area0_begin:
	.word	0xd2f7f2d6	! t1_data_in_area0-0x20
	.word	0xc149db0d	! t1_data_in_area0-0x1c
	.word	0x7478f40c	! t1_data_in_area0-0x18
	.word	0x5ae61446	! t1_data_in_area0-0x14
	.word	0xc2d34726	! t1_data_in_area0-0x10
	.word	0x6afb5e0c	! t1_data_in_area0-0xc
	.word	0xa3b014cf	! t1_data_in_area0-0x8
	.word	0x7d86adcd	! t1_data_in_area0-0x4
.global t1_data_in_area0; t1_data_in_area0:
	.word	0x78e79e88	! t1_data_in_area0+0x0
	.word	0x46d83081	! t1_data_in_area0+0x4
	.word	0x3cf5398e	! t1_data_in_area0+0x8
	.word	0x3ea8b90a	! t1_data_in_area0+0xc
	.word	0xa9b24422	! t1_data_in_area0+0x10
	.word	0x585fbc74	! t1_data_in_area0+0x14
	.word	0xd1554340	! t1_data_in_area0+0x18
	.word	0xd3ae732a	! t1_data_in_area0+0x1c
t1_data_in_area0_end:
.skip 3968
t1_data_in_area0_stop:

KDATA_MODULE(t1_module_data_in_shm_area, 0x711d2000)
.seg "data"
t1_data_in_shm_area_start:
t1_data_in_shm_area_begin:
.global t1_data_in_shm_area; t1_data_in_shm_area:
	.word	0xab48b3d8	! t1_data_in_shm_area+0x0 (t0)
	.word	0x235aa754	! t1_data_in_shm_area+0x4 (t1)
	.word	0xbfa76a87	! t1_data_in_shm_area+0x8 (t0)
	.word	0xd868615d	! t1_data_in_shm_area+0xc (t1)
	.word	0x62d123de	! t1_data_in_shm_area+0x10 (t0)
	.word	0x4028206f	! t1_data_in_shm_area+0x14 (t1)
	.word	0x01003dd5	! t1_data_in_shm_area+0x18 (t0)
	.word	0xcc734622	! t1_data_in_shm_area+0x1c (t1)
	.word	0x353d5045	! t1_data_in_shm_area+0x20 (t0)
	.word	0xab307efc	! t1_data_in_shm_area+0x24 (t1)
	.word	0x6fba8425	! t1_data_in_shm_area+0x28 (t0)
	.word	0x5233901e	! t1_data_in_shm_area+0x2c (t1)
	.word	0xb8fd3e6d	! t1_data_in_shm_area+0x30 (t0)
	.word	0x86adec1a	! t1_data_in_shm_area+0x34 (t1)
	.word	0x47d2ee9d	! t1_data_in_shm_area+0x38 (t0)
	.word	0xd522c7bc	! t1_data_in_shm_area+0x3c (t1)
	.word	0xba0a1c2a	! t1_data_in_shm_area+0x40 (t0 bload)
	.word	0x780b11c3	! t1_data_in_shm_area+0x44
	.word	0x2e0eb133	! t1_data_in_shm_area+0x48
	.word	0x7d3d088e	! t1_data_in_shm_area+0x4c
	.word	0x99983cf6	! t1_data_in_shm_area+0x50
	.word	0x72c3fc79	! t1_data_in_shm_area+0x54
	.word	0xcfd7bbd9	! t1_data_in_shm_area+0x58
	.word	0x4dc8a4fb	! t1_data_in_shm_area+0x5c
	.word	0xe887da2e	! t1_data_in_shm_area+0x60
	.word	0x33185b15	! t1_data_in_shm_area+0x64
	.word	0x4187386a	! t1_data_in_shm_area+0x68
	.word	0x93fb91d3	! t1_data_in_shm_area+0x6c
	.word	0xb374635c	! t1_data_in_shm_area+0x70
	.word	0xd51e72f7	! t1_data_in_shm_area+0x74
	.word	0xc8e4d46e	! t1_data_in_shm_area+0x78
	.word	0x0cb39723	! t1_data_in_shm_area+0x7c
	.word	0x3e62c147	! t1_data_in_shm_area+0x80 (t0 bstore)
	.word	0x33df633b	! t1_data_in_shm_area+0x84
	.word	0xa3ef4738	! t1_data_in_shm_area+0x88
	.word	0xddc310de	! t1_data_in_shm_area+0x8c
	.word	0xc044e663	! t1_data_in_shm_area+0x90
	.word	0xb713de1d	! t1_data_in_shm_area+0x94
	.word	0xd0f7197c	! t1_data_in_shm_area+0x98
	.word	0x2d16e0e0	! t1_data_in_shm_area+0x9c
	.word	0x6941728a	! t1_data_in_shm_area+0xa0
	.word	0x5ea89499	! t1_data_in_shm_area+0xa4
	.word	0x61e5d224	! t1_data_in_shm_area+0xa8
	.word	0xb3bafd30	! t1_data_in_shm_area+0xac
	.word	0x32255dec	! t1_data_in_shm_area+0xb0
	.word	0x66ab3852	! t1_data_in_shm_area+0xb4
	.word	0xae0a9c63	! t1_data_in_shm_area+0xb8
	.word	0x41a31e85	! t1_data_in_shm_area+0xbc
	.word	0x2dd25cf6	! t1_data_in_shm_area+0xc0 (t1 bload)
	.word	0x42133233	! t1_data_in_shm_area+0xc4
	.word	0x232496dc	! t1_data_in_shm_area+0xc8
	.word	0x819815f1	! t1_data_in_shm_area+0xcc
	.word	0xf92b75e1	! t1_data_in_shm_area+0xd0
	.word	0xe8a1d027	! t1_data_in_shm_area+0xd4
	.word	0x812c7e4d	! t1_data_in_shm_area+0xd8
	.word	0x1c66247e	! t1_data_in_shm_area+0xdc
	.word	0x351fa128	! t1_data_in_shm_area+0xe0
	.word	0xafb22b49	! t1_data_in_shm_area+0xe4
	.word	0x01d496a7	! t1_data_in_shm_area+0xe8
	.word	0x9c9ecfb1	! t1_data_in_shm_area+0xec
	.word	0x97a8d540	! t1_data_in_shm_area+0xf0
	.word	0xdf323e9f	! t1_data_in_shm_area+0xf4
	.word	0x6c0d0aac	! t1_data_in_shm_area+0xf8
	.word	0xa077c883	! t1_data_in_shm_area+0xfc
	.word	0x4399a42e	! t1_data_in_shm_area+0x100 (t1 bstore)
	.word	0x7388db1b	! t1_data_in_shm_area+0x104
	.word	0x64c975c7	! t1_data_in_shm_area+0x108
	.word	0x2549adeb	! t1_data_in_shm_area+0x10c
	.word	0x826c7c4c	! t1_data_in_shm_area+0x110
	.word	0x1bb4530c	! t1_data_in_shm_area+0x114
	.word	0xd70a1c71	! t1_data_in_shm_area+0x118
	.word	0xd056e770	! t1_data_in_shm_area+0x11c
	.word	0x41bfb14b	! t1_data_in_shm_area+0x120
	.word	0xdee3e8d7	! t1_data_in_shm_area+0x124
	.word	0x7595c6d6	! t1_data_in_shm_area+0x128
	.word	0xec8d1500	! t1_data_in_shm_area+0x12c
	.word	0xd89a917b	! t1_data_in_shm_area+0x130
	.word	0xbeacf4e6	! t1_data_in_shm_area+0x134
	.word	0x20a421b7	! t1_data_in_shm_area+0x138
	.word	0xd14d2800	! t1_data_in_shm_area+0x13c
t1_data_in_shm_area_end:
t1_data_in_shm_area_stop:

KDATA_MODULE(t1_module_data_exp_regs, 0x5cbbe000)
.seg "data"
KGLOBAL(t1_data_exp_regs)
t1_data_exp_regs_start:
t1_data_exp_regs:
	.word	0x2e3c67e7          ! %f0
	.word	0x2b6c73c1          ! %f1
	.word	0x63c593d5          ! %f2
	.word	0x7ad82a23          ! %f3
	.word	0x1df9ce91          ! %f4
	.word	0xb650f092          ! %f5
	.word	0x7bc7aa28          ! %f6
	.word	0xa6db7a3d          ! %f7
	.word	0xc53cbd07          ! %f8
	.word	0x77ac7c63          ! %f9
	.word	0xf1d6a87d          ! %f10
	.word	0x0923c2ec          ! %f11
	.word	0x8dabe3c6          ! %f12
	.word	0x00d16f9e          ! %f13
	.word	0x28a1539d          ! %f14
	.word	0xf8b0ff5a          ! %f15
	.word	0xbdbd49a7          ! %f16
	.word	0x2c8ee30b          ! %f17
	.word	0xb8786c3d          ! %f18
	.word	0x67099633          ! %f19
	.word	0x39268e52          ! %f20
	.word	0xc5a1332e          ! %f21
	.word	0x3b727893          ! %f22
	.word	0x1f0225ab          ! %f23
	.word	0x48ea5ff0          ! %f24
	.word	0x661cd5ed          ! %f25
	.word	0x950a132b          ! %f26
	.word	0x01678bc6          ! %f27
	.word	0xc9db1824          ! %f28
	.word	0xe6fe6676          ! %f29
	.word	0x8b51d2fa          ! %f30
	.word	0x2d0aaed3          ! %f31
	.word	0x2175b43b          ! %f32
	.word	0x44550b5f          ! %f33
	.word	0x65f620b3          ! %f34
	.word	0xd9a1ca38          ! %f35
	.word	0x97779ca1          ! %f36
	.word	0xca2a9b0e          ! %f37
	.word	0xe1f68d59          ! %f38
	.word	0xc9eb4375          ! %f39
	.word	0x11c4ef96          ! %f40
	.word	0xf29f225a          ! %f41
	.word	0xd5857e14          ! %f42
	.word	0x45ba4b62          ! %f43
	.word	0x875c4322          ! %f44
	.word	0xbce3b172          ! %f45
	.word	0x27164148          ! %f46
	.word	0xb855cfbb          ! %f47
	.word	0xd9701246          ! %f48
	.word	0xb91a92fd          ! %f49
	.word	0x5a8ee0e4          ! %f50
	.word	0x4f1680de          ! %f51
	.word	0x9e8d4973          ! %f52
	.word	0x3ce15182          ! %f53
	.word	0xa11445f7          ! %f54
	.word	0x3fb8efd2          ! %f55
	.word	0xfe39a63f          ! %f56
	.word	0x81ab2f0a          ! %f57
	.word	0x903c8188          ! %f58
	.word	0xf1a5088b          ! %f59
	.word	0x2aebde56          ! %f60
	.word	0x0758f304          ! %f61
	.word	0x05dc4ea6          ! %f62
	.word	0xe1bc6c6b          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t1_kref+0x9b0       ! %g1 (code pointer)
	.word	t1_data_exp_shm_area! %g2 (shared area pointer)
	.word	0x15c749ed          ! %g3 (loop index)
	.word	SYM(t1_subr1)       ! %g4 (jmpl target)
	.word	t1_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0xa9bcd970          ! %o0
	.word	0xf53ae39f          ! %o1
	.word	0xa91d6312          ! %o2
	.word	0x88140e48          ! %o3
	.word	0xb8dbf295          ! %o4
	.word	0x2b974bdc          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0xafeac1ae          ! %l0
	.word	0xd4e53267          ! %l1
	.word	0x336221bd          ! %l2
	.word	0x4155710c          ! %l3
	.word	0x77bfcbfe          ! %l4
	.word	0xd4ca761d          ! %l5
	.word	0xd802592b          ! %l6
	.word	0x8f20c73c          ! %l7
	.word	t1_data_exp_area0   ! %i0 (area pointer)
	.word	t1_data_exp_area0   ! %i1 (area pointer)
	.word	0xffffffff          ! %i2 (byte offset)
	.word	0xffffffee          ! %i3 (halfword offset)
	.word	0x00000008          ! %i4 (word offset)
	.word	0xffffffe0          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0x3581ec6f          ! %y
	.word	0x0000000d          ! %icc (nzvc)
	.word	0x40000580          ! %fsr
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

KDATA_MODULE(t1_module_data_exp_stack, 0x41728000)
.seg "data"
KGLOBAL(t1_data_exp_mtbl_size)
KGLOBAL(t1_data_exp_mtbl)
KGLOBAL(t1_data_exp_stack)
t1_data_exp_stack_start:
	.word	0x35681d41
	.word	0x647f3bc9
	.word	0xe7262c69
	.word	0xce4d55e4
	.word	0x72fd335b
	.word	0x061226e5
	.word	0x83d99350
	.word	0x483db74a
	.word	0x15030886
	.word	0xf4fe4a5a
	.word	0xccc773bb
	.word	0x649dc639
	.word	0x733218de
	.word	0xd8bdd4e7
	.word	0x415355c6
	.word	0x69879d65
	.word	0x2e59c4f9
	.word	0x0e162c69
	.word	0x2ea933c6
	.word	0x422e3638
	.word	0xa22e983b
	.word	0x1c8b57a3
	.word	0xdb979ac1
	.word	0xa6d5723d
	.word	0x22862068
	.word	0xa0f9c041
	.word	0xe406de20
	.word	0xe8f6d6c1
	.word	0x1ac02a7a
	.word	0x257b9119
	.word	0x170352a3
	.word	0x9f83deb7
	.word	0x31c678b4
	.word	0x654f34b4
	.word	0x8f3bc494
	.word	0xc2e106dc
	.word	0x2a0945f6
	.word	0x72c8b80d
	.word	0xbe349d3f
	.word	0x8442f81b
	.word	0x14702a53
	.word	0xe5b01598
	.word	0x81836ba0
	.word	0xf2c97432
	.word	0x2c9c34e0
	.word	0xae0aac85
	.word	0xce6dc45e
	.word	0xd849e894
	.word	0xfd514ece
	.word	0xf26e6845
	.word	0xf681acf8
	.word	0xca75cb91
	.word	0x3aaa3bbb
	.word	0xd5e15c4c
	.word	0x5e6d063d
	.word	0x492727b3
	.word	0xa61bcb44
	.word	0x7830d819
	.word	0xcabcaa01
	.word	0x9a5ff96b
	.word	0xb3810fde
	.word	0x98d73773
	.word	0x2b83300d
	.word	0x7e2f42ed
	.word	0xffb3aee6
	.word	0x1837f2f4
	.word	0x4b728e57
	.word	0x8a78fa57
	.word	0xc5d09df5
	.word	0x096db4cb
	.word	0xa7f30872
	.word	0x1ecc3618
	.word	0xc17ae179
	.word	0x085e75bc
	.word	0x61752247
	.word	0x2d453b8f
	.word	0x87732081
	.word	0x4085e66b
	.word	0xfce38a05
	.word	0x352f53f2
	.word	0x9bf421d7
	.word	0xb126a8da
	.word	0x23f52d55
	.word	0x88f48b71
	.word	0x0cb18653
	.word	0x37971e30
	.word	0xb16eedd2
	.word	0x8127be9a
	.word	0x4457546e
	.word	0x3866ccbc
	.word	0xd367a8b8
	.word	0x645799ff
	.word	0x343e2915
	.word	0x2065a238
	.word	0x8f9885da
	.word	0x451f7015
	.word	0xe7f121bf
	.word	0xa7669651
	.word	0x57eec1d9
	.word	0xbfd5095e
	.word	0x8a5fd3c1
	.word	0xc42b7166
	.word	0xef336792
	.word	0x9580d2ca
	.word	0xd767e4e0
	.word	0xa37fbb90
	.word	0xa1f0acd8
	.word	0x84c00e5a
	.word	0xbb071927
	.word	0x006517e2
	.word	0xc603e663
	.word	0x3906ea07
	.word	0x633fe9fb
	.word	0xc0938ff1
	.word	0xb6c64707
	.word	0x9fb2a0e1
	.word	0x87c7fa6c
	.word	0x4bb49396
	.word	0xbba5de28
	.word	0xb6ba0a7a
	.word	0xf438fccd
	.word	0x4ce7b0f2
	.word	0xc6ab896d
	.word	0xeccd3c84
	.word	0x1bf1dd86
	.word	0x498c48b2
	.word	0x0701cdb3
	.word	0x449b22b8
	.word	0x635f4727
	.word	0x163bc293
	.word	0x645bcb44
	.word	0x96fe30f9
	.word	0xe63fd3c1
	.word	0xd7940628
	.word	0x0a5ac148
	.word	0xe83f93b9
	.word	0x76e97f71
	.word	0x102a3bda
	.word	0xda03d47a
	.word	0xcdb2829b
	.word	0xd4db303c
	.word	0xabfa1a30
	.word	0x7a3f0d1f
	.word	0x40df995a
	.word	0x323e6722
	.word	0xf4264351
	.word	0xa273c034
	.word	0xfe925ae8
	.word	0xedaa6e6d
	.word	0x902276c6
	.word	0x5ae5d7e6
	.word	0x209942da
	.word	0x58bb9949
	.word	0xeba89b83
	.word	0x40baaf47
	.word	0x132b0902
	.word	0xc2266899
	.word	0x7f65e627
	.word	0x46c3753e
	.word	0x50e9fb5d
	.word	0x1c17a907
	.word	0x155d9f82
	.word	0x0b964abe
	.word	0x8ca8922f
	.word	0x2b2fde5d
	.word	0x75d34f58
	.word	0x405e9039
	.word	0x9ca0a26c
t1_data_exp_sp:
	.word	0x70799013
	.word	0x3e664f64
	.word	0x05601657
	.word	0xba00d25a
	.word	0x0e9f4b28
	.word	0x87250a9f
	.word	0xc8b025e3
	.word	0x7fca3473
	.word	t1_data_exp_area0
	.word	t1_data_exp_area0
	.word	0xfffffff0
	.word	0xffffffe0
	.word	0xfffffff4
	.word	0x00000018
	.word	t1_data_exp_fp
	.word	0xea5c4607
	.word	0x12984fb6
	.word	0xac5b0342
	.word	0x55ae92cb
	.word	0x5219a737
	.word	0x42c0316f
	.word	0x1677cb82
	.word	0x1f6fd9b6
	.word	0x02b479e1
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
	.word   	0xf331de23	! [%fp - 0xc]
	.word   	0xe8967e8d	! [%fp - 0x8]
	.word   	0x8386e547	! [%fp - 0x4]
t1_data_exp_fp:
	.word	0x47c9d8e6
	.word	0x68561470
	.word	0x6e957209
	.word	0x2bdf87fd
	.word	0x12e0ed3e
	.word	0x9e0ec310
	.word	0xaa778c6c
	.word	0xc3b389ae
	.word	0xca8052f5
	.word	0x4444a395
	.word	0xcb9cdb9d
	.word	0xa92a2352
	.word	0x33c64a76
	.word	0x53a74c55
	.word	0x399b71db
	.word	0xbc52e41a
	.word	0x837c3a0b
	.word	0xb707eda2
	.word	0xb9ceacde
	.word	0xe44153c7
	.word	0x5c2243a3
	.word	0xe7862e3e
	.word	0x0f714b3b
	.word	0x198fe63a
t1_data_exp_stacktop:
	.word	0
t1_data_exp_stack_end:
.skip 6300	! page align

KDATA_MODULE(t1_module_data_exp_area0, 0x6d156000)
.seg "data"
t1_data_exp_area0_start:
.skip 4160
t1_data_exp_area0_begin:
	.word	0xd2f7f2d6	! t1_data_exp_area0-0x20
	.word	0xc149db0d	! t1_data_exp_area0-0x1c
	.word	0x7478f40c	! t1_data_exp_area0-0x18
	.word	0x5ae61446	! t1_data_exp_area0-0x14
	.word	0xc2d34726	! t1_data_exp_area0-0x10
	.word	0x6afb5e0c	! t1_data_exp_area0-0xc
	.word	0xa3b014cf	! t1_data_exp_area0-0x8
	.word	0x7d86adcd	! t1_data_exp_area0-0x4
.global t1_data_exp_area0; t1_data_exp_area0:
	.word	0x78e79e88	! t1_data_exp_area0+0x0
	.word	0x46d83081	! t1_data_exp_area0+0x4
	.word	0x3cf5398e	! t1_data_exp_area0+0x8
	.word	0x3ea8b90a	! t1_data_exp_area0+0xc
	.word	0xa9b24422	! t1_data_exp_area0+0x10
	.word	0x585fbc74	! t1_data_exp_area0+0x14
	.word	0xd1554340	! t1_data_exp_area0+0x18
	.word	0xd3ae732a	! t1_data_exp_area0+0x1c
t1_data_exp_area0_end:
.skip 3968
t1_data_exp_area0_stop:

KDATA_MODULE(t1_module_data_exp_shm_area, 0x478b0000)
.seg "data"
t1_data_exp_shm_area_start:
t1_data_exp_shm_area_begin:
.global t1_data_exp_shm_area; t1_data_exp_shm_area:
	.word	0xab48b3d8	! t1_data_exp_shm_area+0x0 (t0)
	.word	0x235aa754	! t1_data_exp_shm_area+0x4 (t1)
	.word	0xbfa76a87	! t1_data_exp_shm_area+0x8 (t0)
	.word	0xd868615d	! t1_data_exp_shm_area+0xc (t1)
	.word	0x62d123de	! t1_data_exp_shm_area+0x10 (t0)
	.word	0x4028206f	! t1_data_exp_shm_area+0x14 (t1)
	.word	0x01003dd5	! t1_data_exp_shm_area+0x18 (t0)
	.word	0xcc734622	! t1_data_exp_shm_area+0x1c (t1)
	.word	0x353d5045	! t1_data_exp_shm_area+0x20 (t0)
	.word	0xab307efc	! t1_data_exp_shm_area+0x24 (t1)
	.word	0x6fba8425	! t1_data_exp_shm_area+0x28 (t0)
	.word	0x5233901e	! t1_data_exp_shm_area+0x2c (t1)
	.word	0xb8fd3e6d	! t1_data_exp_shm_area+0x30 (t0)
	.word	0x86adec1a	! t1_data_exp_shm_area+0x34 (t1)
	.word	0x47d2ee9d	! t1_data_exp_shm_area+0x38 (t0)
	.word	0xd522c7bc	! t1_data_exp_shm_area+0x3c (t1)
	.word	0xba0a1c2a	! t1_data_exp_shm_area+0x40 (t0 bload)
	.word	0x780b11c3	! t1_data_exp_shm_area+0x44
	.word	0x2e0eb133	! t1_data_exp_shm_area+0x48
	.word	0x7d3d088e	! t1_data_exp_shm_area+0x4c
	.word	0x99983cf6	! t1_data_exp_shm_area+0x50
	.word	0x72c3fc79	! t1_data_exp_shm_area+0x54
	.word	0xcfd7bbd9	! t1_data_exp_shm_area+0x58
	.word	0x4dc8a4fb	! t1_data_exp_shm_area+0x5c
	.word	0xe887da2e	! t1_data_exp_shm_area+0x60
	.word	0x33185b15	! t1_data_exp_shm_area+0x64
	.word	0x4187386a	! t1_data_exp_shm_area+0x68
	.word	0x93fb91d3	! t1_data_exp_shm_area+0x6c
	.word	0xb374635c	! t1_data_exp_shm_area+0x70
	.word	0xd51e72f7	! t1_data_exp_shm_area+0x74
	.word	0xc8e4d46e	! t1_data_exp_shm_area+0x78
	.word	0x0cb39723	! t1_data_exp_shm_area+0x7c
	.word	0x3e62c147	! t1_data_exp_shm_area+0x80 (t0 bstore)
	.word	0x33df633b	! t1_data_exp_shm_area+0x84
	.word	0xa3ef4738	! t1_data_exp_shm_area+0x88
	.word	0xddc310de	! t1_data_exp_shm_area+0x8c
	.word	0xc044e663	! t1_data_exp_shm_area+0x90
	.word	0xb713de1d	! t1_data_exp_shm_area+0x94
	.word	0xd0f7197c	! t1_data_exp_shm_area+0x98
	.word	0x2d16e0e0	! t1_data_exp_shm_area+0x9c
	.word	0x6941728a	! t1_data_exp_shm_area+0xa0
	.word	0x5ea89499	! t1_data_exp_shm_area+0xa4
	.word	0x61e5d224	! t1_data_exp_shm_area+0xa8
	.word	0xb3bafd30	! t1_data_exp_shm_area+0xac
	.word	0x32255dec	! t1_data_exp_shm_area+0xb0
	.word	0x66ab3852	! t1_data_exp_shm_area+0xb4
	.word	0xae0a9c63	! t1_data_exp_shm_area+0xb8
	.word	0x41a31e85	! t1_data_exp_shm_area+0xbc
	.word	0x2dd25cf6	! t1_data_exp_shm_area+0xc0 (t1 bload)
	.word	0x42133233	! t1_data_exp_shm_area+0xc4
	.word	0x232496dc	! t1_data_exp_shm_area+0xc8
	.word	0x819815f1	! t1_data_exp_shm_area+0xcc
	.word	0xf92b75e1	! t1_data_exp_shm_area+0xd0
	.word	0xe8a1d027	! t1_data_exp_shm_area+0xd4
	.word	0x812c7e4d	! t1_data_exp_shm_area+0xd8
	.word	0x1c66247e	! t1_data_exp_shm_area+0xdc
	.word	0x351fa128	! t1_data_exp_shm_area+0xe0
	.word	0xafb22b49	! t1_data_exp_shm_area+0xe4
	.word	0x01d496a7	! t1_data_exp_shm_area+0xe8
	.word	0x9c9ecfb1	! t1_data_exp_shm_area+0xec
	.word	0x97a8d540	! t1_data_exp_shm_area+0xf0
	.word	0xdf323e9f	! t1_data_exp_shm_area+0xf4
	.word	0x6c0d0aac	! t1_data_exp_shm_area+0xf8
	.word	0xa077c883	! t1_data_exp_shm_area+0xfc
	.word	0x4399a42e	! t1_data_exp_shm_area+0x100 (t1 bstore)
	.word	0x7388db1b	! t1_data_exp_shm_area+0x104
	.word	0x64c975c7	! t1_data_exp_shm_area+0x108
	.word	0x2549adeb	! t1_data_exp_shm_area+0x10c
	.word	0x826c7c4c	! t1_data_exp_shm_area+0x110
	.word	0x1bb4530c	! t1_data_exp_shm_area+0x114
	.word	0xd70a1c71	! t1_data_exp_shm_area+0x118
	.word	0xd056e770	! t1_data_exp_shm_area+0x11c
	.word	0x41bfb14b	! t1_data_exp_shm_area+0x120
	.word	0xdee3e8d7	! t1_data_exp_shm_area+0x124
	.word	0x7595c6d6	! t1_data_exp_shm_area+0x128
	.word	0xec8d1500	! t1_data_exp_shm_area+0x12c
	.word	0xd89a917b	! t1_data_exp_shm_area+0x130
	.word	0xbeacf4e6	! t1_data_exp_shm_area+0x134
	.word	0x20a421b7	! t1_data_exp_shm_area+0x138
	.word	0xd14d2800	! t1_data_exp_shm_area+0x13c
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



