/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: v9_2th_kao_02_20_04_219.s
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
#define T0_KAOS_SEED          d3d24dc35098
#define T0_KAOS_ICOUNT        5000
#define T0_KAOS_AREAS         1
#define T0_KAOS_AREASIZE      64
#define T0_KAOS_AREAOFFSET    1344
#define T0_KAOS_PAGESIZE      8192
#define T0_KAOS_CODECOUNT     5003

#define T0_KAOS_BOOT_VA                  0x05b8e000
#define T0_KAOS_BOOT_PA                  0x00000000007a4000
#define T0_KAOS_BOOT_CACHEABLE           1
#define T0_KAOS_BOOT_NONCACHEABLE        0

#define T0_KAOS_STARTUP_VA               0x1957c000
#define T0_KAOS_STARTUP_PA               0x00000000011ea000
#define T0_KAOS_STARTUP_CACHEABLE        1
#define T0_KAOS_STARTUP_NONCACHEABLE     0

#define T0_KAOS_OFFSET_TBL_VA            0x3ed58000
#define T0_KAOS_OFFSET_TBL_PA            0x0000000002384000
#define T0_KAOS_OFFSET_TBL_CACHEABLE     1
#define T0_KAOS_OFFSET_TBL_NONCACHEABLE  0

#define T0_KAOS_DONE_VA                  0x33ebc000
#define T0_KAOS_DONE_PA                  0x0000000003548000
#define T0_KAOS_DONE_CACHEABLE           1
#define T0_KAOS_DONE_NONCACHEABLE        0

#define T0_KAOS_KTBL_VA                  0x36098000
#define T0_KAOS_KTBL_PA                  0x0000000004502000
#define T0_KAOS_KTBL_CACHEABLE           1
#define T0_KAOS_KTBL_NONCACHEABLE        0

#define T0_KAOS_SUBR0_VA                 0x3654a000
#define T0_KAOS_SUBR0_PA                 0x0000000005b32000
#define T0_KAOS_SUBR0_CACHEABLE          1
#define T0_KAOS_SUBR0_NONCACHEABLE       0
#define T0_KAOS_SUBR1_VA                 0x28590000
#define T0_KAOS_SUBR1_PA                 0x0000000006ed4000
#define T0_KAOS_SUBR1_CACHEABLE          1
#define T0_KAOS_SUBR1_NONCACHEABLE       0
#define T0_KAOS_SUBR2_VA                 0x36124000
#define T0_KAOS_SUBR2_PA                 0x0000000007e90000
#define T0_KAOS_SUBR2_CACHEABLE          1
#define T0_KAOS_SUBR2_NONCACHEABLE       0
#define T0_KAOS_SUBR3_VA                 0x359ac000
#define T0_KAOS_SUBR3_PA                 0x0000000008a2c000
#define T0_KAOS_SUBR3_CACHEABLE          1
#define T0_KAOS_SUBR3_NONCACHEABLE       0

#define T0_KAOS_EXP_REGS_VA              0x2dc46000
#define T0_KAOS_EXP_REGS_PA              0x0000000009538000
#define T0_KAOS_EXP_REGS_CACHEABLE       1
#define T0_KAOS_EXP_REGS_NONCACHEABLE    0
#define T0_KAOS_RUN_REGS_VA              0x1365a000
#define T0_KAOS_RUN_REGS_PA              0x000000000a3b2000
#define T0_KAOS_RUN_REGS_CACHEABLE       1
#define T0_KAOS_RUN_REGS_NONCACHEABLE    0

#define T0_KAOS_EXP_STACK_VA             0x3d362000
#define T0_KAOS_EXP_STACK_PA             0x000000000b16e000
#define T0_KAOS_EXP_STACK_CACHEABLE      1
#define T0_KAOS_EXP_STACK_NONCACHEABLE   0
#define T0_KAOS_RUN_STACK_VA             0x35c8c000
#define T0_KAOS_RUN_STACK_PA             0x000000000cc76000
#define T0_KAOS_RUN_STACK_CACHEABLE      1
#define T0_KAOS_RUN_STACK_NONCACHEABLE   0

#define T0_KAOS_AREA0
#define T0_KAOS_EXP_AREA0_VA             0x371a0000
#define T0_KAOS_EXP_AREA0_PA             0x000000000d742000
#define T0_KAOS_EXP_AREA0_CACHEABLE      1
#define T0_KAOS_EXP_AREA0_NONCACHEABLE   0
#define T0_KAOS_RUN_AREA0_VA             0x05764000
#define T0_KAOS_RUN_AREA0_PA             0x000000000e260000
#define T0_KAOS_RUN_AREA0_CACHEABLE      1
#define T0_KAOS_RUN_AREA0_NONCACHEABLE   0

#define T0_KAOS_SHM_AREA
#define T0_KAOS_EXP_SHM_AREA_VA          0x2813e000
#define T0_KAOS_EXP_SHM_AREA_PA          0x0000000000e62000
#define T0_KAOS_EXP_SHM_AREA_CACHEABLE   1
#define T0_KAOS_EXP_SHM_AREA_NONCACHEABLE 0
#define T0_KAOS_RUN_SHM_AREA_VA          0x34790000
#define T0_KAOS_RUN_SHM_AREA_PA          0x0000000000f6a000
#define T0_KAOS_RUN_SHM_AREA_CACHEABLE   1
#define T0_KAOS_RUN_SHM_AREA_NONCACHEABLE 0

#define T0_KAOS_RANVAL_00     0x9dab042f
#define T0_KAOS_RANVAL_01     0x6a26f434
#define T0_KAOS_RANVAL_02     0xf1a32b2a
#define T0_KAOS_RANVAL_03     0x3db3e94a
#define T0_KAOS_RANVAL_04     0xfd01fe3f
#define T0_KAOS_RANVAL_05     0x79015a4c
#define T0_KAOS_RANVAL_06     0xa58e52a1
#define T0_KAOS_RANVAL_07     0xd2f65ff3
#define T0_KAOS_RANVAL_08     0x2887b755
#define T0_KAOS_RANVAL_09     0x108dc90b
#define T0_KAOS_RANVAL_0a     0xbf17bd71
#define T0_KAOS_RANVAL_0b     0x0a124737
#define T0_KAOS_RANVAL_0c     0x8f06fc70
#define T0_KAOS_RANVAL_0d     0x9d888eac
#define T0_KAOS_RANVAL_0e     0xd4730d1f
#define T0_KAOS_RANVAL_0f     0x42cf84c0
#define T0_KAOS_RANVAL_10     0x556bccf2
#define T0_KAOS_RANVAL_11     0x3560ff7a
#define T0_KAOS_RANVAL_12     0x582144c4
#define T0_KAOS_RANVAL_13     0x56f80890
#define T0_KAOS_RANVAL_14     0xb9a6d94f
#define T0_KAOS_RANVAL_15     0xfadc2070
#define T0_KAOS_RANVAL_16     0x1eb2c8dd
#define T0_KAOS_RANVAL_17     0x893a3245
#define T0_KAOS_RANVAL_18     0x82bdb901
#define T0_KAOS_RANVAL_19     0xba64d81f
#define T0_KAOS_RANVAL_1a     0xc309085e
#define T0_KAOS_RANVAL_1b     0x6975c69e
#define T0_KAOS_RANVAL_1c     0x27d40bbf
#define T0_KAOS_RANVAL_1d     0x70b3c9d4
#define T0_KAOS_RANVAL_1e     0x07e1230c
#define T0_KAOS_RANVAL_1f     0x1ba4393d
#define T0_KAOS_RANVAL_20     0xac08f9ed
#define T0_KAOS_RANVAL_21     0xec773ef9
#define T0_KAOS_RANVAL_22     0x6832210c
#define T0_KAOS_RANVAL_23     0x0a554eae
#define T0_KAOS_RANVAL_24     0x6ac7c855
#define T0_KAOS_RANVAL_25     0x7345c2bb
#define T0_KAOS_RANVAL_26     0xfd7e8fb6
#define T0_KAOS_RANVAL_27     0xb5c55aa7
#define T0_KAOS_RANVAL_28     0x9ee17317
#define T0_KAOS_RANVAL_29     0xb9ac53ed
#define T0_KAOS_RANVAL_2a     0x94e297ae
#define T0_KAOS_RANVAL_2b     0x05229e91
#define T0_KAOS_RANVAL_2c     0xe9b083de
#define T0_KAOS_RANVAL_2d     0x2fd3512b
#define T0_KAOS_RANVAL_2e     0x66a4e035
#define T0_KAOS_RANVAL_2f     0x04eb8c46
#define T0_KAOS_RANVAL_30     0x95e79754
#define T0_KAOS_RANVAL_31     0x9e438342
#define T0_KAOS_RANVAL_32     0x29a1d3bc
#define T0_KAOS_RANVAL_33     0x1ba7f11c
#define T0_KAOS_RANVAL_34     0x86be45d7
#define T0_KAOS_RANVAL_35     0xf306e9cf
#define T0_KAOS_RANVAL_36     0xc14e19ba
#define T0_KAOS_RANVAL_37     0x81db4d22
#define T0_KAOS_RANVAL_38     0x6f37636c
#define T0_KAOS_RANVAL_39     0x74f72e25
#define T0_KAOS_RANVAL_3a     0x338659be
#define T0_KAOS_RANVAL_3b     0xc32edaa9
#define T0_KAOS_RANVAL_3c     0xf976caf3
#define T0_KAOS_RANVAL_3d     0x03c5e074
#define T0_KAOS_RANVAL_3e     0xe82f9bc7
#define T0_KAOS_RANVAL_3f     0x91b60a06
#define T0_KAOS_RANVAL_40     0x52cc289c
#define T0_KAOS_RANVAL_41     0xa568e326
#define T0_KAOS_RANVAL_42     0x010cd9d3
#define T0_KAOS_RANVAL_43     0x99187595
#define T0_KAOS_RANVAL_44     0x317b7799
#define T0_KAOS_RANVAL_45     0x1757a88c
#define T0_KAOS_RANVAL_46     0x416396b5
#define T0_KAOS_RANVAL_47     0xe29891ff
#define T0_KAOS_RANVAL_48     0xe4a32715
#define T0_KAOS_RANVAL_49     0x01ac26b9
#define T0_KAOS_RANVAL_4a     0xfc528e2b
#define T0_KAOS_RANVAL_4b     0xdc9e9ec0
#define T0_KAOS_RANVAL_4c     0x902b1a64
#define T0_KAOS_RANVAL_4d     0x7e04a5ae
#define T0_KAOS_RANVAL_4e     0xa35ad22f
#define T0_KAOS_RANVAL_4f     0x1ce39ae3
#define T0_KAOS_RANVAL_50     0x0da6f87b
#define T0_KAOS_RANVAL_51     0x0231cbb7
#define T0_KAOS_RANVAL_52     0x35cce98d
#define T0_KAOS_RANVAL_53     0x63d04210
#define T0_KAOS_RANVAL_54     0x6ac97ea1
#define T0_KAOS_RANVAL_55     0x298e8c13
#define T0_KAOS_RANVAL_56     0x32d0c3b5
#define T0_KAOS_RANVAL_57     0x6e6055c8
#define T0_KAOS_RANVAL_58     0xfdadca66
#define T0_KAOS_RANVAL_59     0xf595dbda
#define T0_KAOS_RANVAL_5a     0x13d895d2
#define T0_KAOS_RANVAL_5b     0x721ab6ee
#define T0_KAOS_RANVAL_5c     0x1216ced4
#define T0_KAOS_RANVAL_5d     0xb924511b
#define T0_KAOS_RANVAL_5e     0x59bbf51b
#define T0_KAOS_RANVAL_5f     0x28b31388
#define T0_KAOS_RANVAL_60     0x481468e4
#define T0_KAOS_RANVAL_61     0x28121044
#define T0_KAOS_RANVAL_62     0x0cb9c268
#define T0_KAOS_RANVAL_63     0x8ef22cc7
#define T0_KAOS_RANVAL_64     0x8f80c733
#define T0_KAOS_RANVAL_65     0xc8b3abc6
#define T0_KAOS_RANVAL_66     0x3c74bb07
#define T0_KAOS_RANVAL_67     0xa8cdf944
#define T0_KAOS_RANVAL_68     0xe3c018f5
#define T0_KAOS_RANVAL_69     0xfc96d9f8
#define T0_KAOS_RANVAL_6a     0xa9e7c2d0
#define T0_KAOS_RANVAL_6b     0xfb6b278c
#define T0_KAOS_RANVAL_6c     0x6357b829
#define T0_KAOS_RANVAL_6d     0xdbba253c
#define T0_KAOS_RANVAL_6e     0xbf8c3b76
#define T0_KAOS_RANVAL_6f     0x0155c4de
#define T0_KAOS_RANVAL_70     0x6691430e
#define T0_KAOS_RANVAL_71     0x6fccfa60
#define T0_KAOS_RANVAL_72     0x54bdfd1f
#define T0_KAOS_RANVAL_73     0xadd70c32
#define T0_KAOS_RANVAL_74     0xd2b158d5
#define T0_KAOS_RANVAL_75     0x5df7b946
#define T0_KAOS_RANVAL_76     0x460dc437
#define T0_KAOS_RANVAL_77     0x6e2aa17d
#define T0_KAOS_RANVAL_78     0x0b90ed97
#define T0_KAOS_RANVAL_79     0x8381abc6
#define T0_KAOS_RANVAL_7a     0x95ec2881
#define T0_KAOS_RANVAL_7b     0xcab5bd33
#define T0_KAOS_RANVAL_7c     0xbee36988
#define T0_KAOS_RANVAL_7d     0x5ea506d2
#define T0_KAOS_RANVAL_7e     0xcd24716e
#define T0_KAOS_RANVAL_7f     0x6b870c0d
/* end ktbl.0.h */
/* start ktbl.1.h */
#define T1_KAOS_NIAGARA
#define T1_KAOS_VERSION       4.2
#define T1_KAOS_SEED          d3d24dc35099
#define T1_KAOS_ICOUNT        5000
#define T1_KAOS_AREAS         1
#define T1_KAOS_AREASIZE      64
#define T1_KAOS_AREAOFFSET    1344
#define T1_KAOS_PAGESIZE      8192
#define T1_KAOS_CODECOUNT     5002

#define T1_KAOS_BOOT_VA                  0x6c79a000
#define T1_KAOS_BOOT_PA                  0x000000004098a000
#define T1_KAOS_BOOT_CACHEABLE           1
#define T1_KAOS_BOOT_NONCACHEABLE        0

#define T1_KAOS_STARTUP_VA               0x5d268000
#define T1_KAOS_STARTUP_PA               0x000000004169c000
#define T1_KAOS_STARTUP_CACHEABLE        1
#define T1_KAOS_STARTUP_NONCACHEABLE     0

#define T1_KAOS_OFFSET_TBL_VA            0x73030000
#define T1_KAOS_OFFSET_TBL_PA            0x0000000042eba000
#define T1_KAOS_OFFSET_TBL_CACHEABLE     1
#define T1_KAOS_OFFSET_TBL_NONCACHEABLE  0

#define T1_KAOS_DONE_VA                  0x453ae000
#define T1_KAOS_DONE_PA                  0x0000000043126000
#define T1_KAOS_DONE_CACHEABLE           1
#define T1_KAOS_DONE_NONCACHEABLE        0

#define T1_KAOS_KTBL_VA                  0x4df30000
#define T1_KAOS_KTBL_PA                  0x0000000044432000
#define T1_KAOS_KTBL_CACHEABLE           1
#define T1_KAOS_KTBL_NONCACHEABLE        0

#define T1_KAOS_SUBR0_VA                 0x79ed6000
#define T1_KAOS_SUBR0_PA                 0x00000000451ca000
#define T1_KAOS_SUBR0_CACHEABLE          1
#define T1_KAOS_SUBR0_NONCACHEABLE       0
#define T1_KAOS_SUBR1_VA                 0x54054000
#define T1_KAOS_SUBR1_PA                 0x0000000046466000
#define T1_KAOS_SUBR1_CACHEABLE          1
#define T1_KAOS_SUBR1_NONCACHEABLE       0
#define T1_KAOS_SUBR2_VA                 0x4dee6000
#define T1_KAOS_SUBR2_PA                 0x0000000047e82000
#define T1_KAOS_SUBR2_CACHEABLE          1
#define T1_KAOS_SUBR2_NONCACHEABLE       0
#define T1_KAOS_SUBR3_VA                 0x4f952000
#define T1_KAOS_SUBR3_PA                 0x0000000048e36000
#define T1_KAOS_SUBR3_CACHEABLE          1
#define T1_KAOS_SUBR3_NONCACHEABLE       0

#define T1_KAOS_EXP_REGS_VA              0x6d2ba000
#define T1_KAOS_EXP_REGS_PA              0x0000000049534000
#define T1_KAOS_EXP_REGS_CACHEABLE       1
#define T1_KAOS_EXP_REGS_NONCACHEABLE    0
#define T1_KAOS_RUN_REGS_VA              0x6495e000
#define T1_KAOS_RUN_REGS_PA              0x000000004a50a000
#define T1_KAOS_RUN_REGS_CACHEABLE       1
#define T1_KAOS_RUN_REGS_NONCACHEABLE    0

#define T1_KAOS_EXP_STACK_VA             0x552de000
#define T1_KAOS_EXP_STACK_PA             0x000000004bef0000
#define T1_KAOS_EXP_STACK_CACHEABLE      1
#define T1_KAOS_EXP_STACK_NONCACHEABLE   0
#define T1_KAOS_RUN_STACK_VA             0x6e3ea000
#define T1_KAOS_RUN_STACK_PA             0x000000004c438000
#define T1_KAOS_RUN_STACK_CACHEABLE      1
#define T1_KAOS_RUN_STACK_NONCACHEABLE   0

#define T1_KAOS_AREA0
#define T1_KAOS_EXP_AREA0_VA             0x54c24000
#define T1_KAOS_EXP_AREA0_PA             0x000000004d724000
#define T1_KAOS_EXP_AREA0_CACHEABLE      1
#define T1_KAOS_EXP_AREA0_NONCACHEABLE   0
#define T1_KAOS_RUN_AREA0_VA             0x4eb40000
#define T1_KAOS_RUN_AREA0_PA             0x000000004eec2000
#define T1_KAOS_RUN_AREA0_CACHEABLE      1
#define T1_KAOS_RUN_AREA0_NONCACHEABLE   0

#define T1_KAOS_SHM_AREA
#define T1_KAOS_EXP_SHM_AREA_VA          0x56500000
#define T1_KAOS_EXP_SHM_AREA_PA          0x0000000040eaa000
#define T1_KAOS_EXP_SHM_AREA_CACHEABLE   1
#define T1_KAOS_EXP_SHM_AREA_NONCACHEABLE 0
#define T1_KAOS_RUN_SHM_AREA_VA          0x6870c000
#define T1_KAOS_RUN_SHM_AREA_PA          0x00000000409da000
#define T1_KAOS_RUN_SHM_AREA_CACHEABLE   1
#define T1_KAOS_RUN_SHM_AREA_NONCACHEABLE 0

#define T1_KAOS_RANVAL_00     0x17186447
#define T1_KAOS_RANVAL_01     0x81867d4b
#define T1_KAOS_RANVAL_02     0xd1a5ad24
#define T1_KAOS_RANVAL_03     0xac5013a8
#define T1_KAOS_RANVAL_04     0x7c3102d3
#define T1_KAOS_RANVAL_05     0x9d96a639
#define T1_KAOS_RANVAL_06     0x1e500c82
#define T1_KAOS_RANVAL_07     0x3f5c7842
#define T1_KAOS_RANVAL_08     0x02c4a6a4
#define T1_KAOS_RANVAL_09     0xe4f789c2
#define T1_KAOS_RANVAL_0a     0x0fd4a068
#define T1_KAOS_RANVAL_0b     0xe074f064
#define T1_KAOS_RANVAL_0c     0xb7293d46
#define T1_KAOS_RANVAL_0d     0x149df1b4
#define T1_KAOS_RANVAL_0e     0xd466cb85
#define T1_KAOS_RANVAL_0f     0xd1c1c158
#define T1_KAOS_RANVAL_10     0x97768edb
#define T1_KAOS_RANVAL_11     0x116eb754
#define T1_KAOS_RANVAL_12     0xf29e76a5
#define T1_KAOS_RANVAL_13     0x25f445a4
#define T1_KAOS_RANVAL_14     0xc954a93f
#define T1_KAOS_RANVAL_15     0x4294b9b5
#define T1_KAOS_RANVAL_16     0xe8d16a7e
#define T1_KAOS_RANVAL_17     0x98a83d7e
#define T1_KAOS_RANVAL_18     0xeca3596c
#define T1_KAOS_RANVAL_19     0xda0f654d
#define T1_KAOS_RANVAL_1a     0x740201a8
#define T1_KAOS_RANVAL_1b     0xc9a53280
#define T1_KAOS_RANVAL_1c     0x17d5571e
#define T1_KAOS_RANVAL_1d     0xa3e9a0c4
#define T1_KAOS_RANVAL_1e     0x4e7876ed
#define T1_KAOS_RANVAL_1f     0x3f25e297
#define T1_KAOS_RANVAL_20     0x2b6006b9
#define T1_KAOS_RANVAL_21     0x6b32330f
#define T1_KAOS_RANVAL_22     0xcbac53c3
#define T1_KAOS_RANVAL_23     0xdb36e641
#define T1_KAOS_RANVAL_24     0x244af56a
#define T1_KAOS_RANVAL_25     0xb3cbf6bd
#define T1_KAOS_RANVAL_26     0x2d77c315
#define T1_KAOS_RANVAL_27     0x839d05f7
#define T1_KAOS_RANVAL_28     0xe8f8738d
#define T1_KAOS_RANVAL_29     0x32bd6e91
#define T1_KAOS_RANVAL_2a     0xade6cc49
#define T1_KAOS_RANVAL_2b     0x5dc6f2e7
#define T1_KAOS_RANVAL_2c     0x58f2f14e
#define T1_KAOS_RANVAL_2d     0xa90c8f50
#define T1_KAOS_RANVAL_2e     0x0d90ba7e
#define T1_KAOS_RANVAL_2f     0xe85556e5
#define T1_KAOS_RANVAL_30     0xb7210192
#define T1_KAOS_RANVAL_31     0x38acd2da
#define T1_KAOS_RANVAL_32     0x908a3415
#define T1_KAOS_RANVAL_33     0x54ff6fa3
#define T1_KAOS_RANVAL_34     0x7f7c2717
#define T1_KAOS_RANVAL_35     0xf4d2e87f
#define T1_KAOS_RANVAL_36     0x07e2c673
#define T1_KAOS_RANVAL_37     0x2f49a920
#define T1_KAOS_RANVAL_38     0x6c84cfd9
#define T1_KAOS_RANVAL_39     0xe062968b
#define T1_KAOS_RANVAL_3a     0x2b88ea04
#define T1_KAOS_RANVAL_3b     0xa9e6eb5e
#define T1_KAOS_RANVAL_3c     0x8f7022b7
#define T1_KAOS_RANVAL_3d     0x2b60a122
#define T1_KAOS_RANVAL_3e     0xbc9bc282
#define T1_KAOS_RANVAL_3f     0xe4f48f57
#define T1_KAOS_RANVAL_40     0x7eb28356
#define T1_KAOS_RANVAL_41     0xc49bca53
#define T1_KAOS_RANVAL_42     0xcae21f76
#define T1_KAOS_RANVAL_43     0x5dcc2f31
#define T1_KAOS_RANVAL_44     0x7b53f045
#define T1_KAOS_RANVAL_45     0x0c5d3f66
#define T1_KAOS_RANVAL_46     0xed9280ff
#define T1_KAOS_RANVAL_47     0x2d25c5b0
#define T1_KAOS_RANVAL_48     0x24a99f62
#define T1_KAOS_RANVAL_49     0x01220778
#define T1_KAOS_RANVAL_4a     0x301024d1
#define T1_KAOS_RANVAL_4b     0x24f7d0eb
#define T1_KAOS_RANVAL_4c     0xa5e27c7b
#define T1_KAOS_RANVAL_4d     0xd564474a
#define T1_KAOS_RANVAL_4e     0x0afd5f80
#define T1_KAOS_RANVAL_4f     0x9c2a6c42
#define T1_KAOS_RANVAL_50     0xdf8a6e38
#define T1_KAOS_RANVAL_51     0xc6946e55
#define T1_KAOS_RANVAL_52     0xb143c5fe
#define T1_KAOS_RANVAL_53     0x4e0d958f
#define T1_KAOS_RANVAL_54     0xb3028537
#define T1_KAOS_RANVAL_55     0xe6cfa120
#define T1_KAOS_RANVAL_56     0xb3b6eb62
#define T1_KAOS_RANVAL_57     0x25d2119a
#define T1_KAOS_RANVAL_58     0x752a7978
#define T1_KAOS_RANVAL_59     0x85e1f4d6
#define T1_KAOS_RANVAL_5a     0xfcfeb6ea
#define T1_KAOS_RANVAL_5b     0xce47a3d2
#define T1_KAOS_RANVAL_5c     0x7a5a19fa
#define T1_KAOS_RANVAL_5d     0x07f85012
#define T1_KAOS_RANVAL_5e     0x26c29643
#define T1_KAOS_RANVAL_5f     0x131a8d3a
#define T1_KAOS_RANVAL_60     0x5e8f92a6
#define T1_KAOS_RANVAL_61     0x5a4f04fd
#define T1_KAOS_RANVAL_62     0x68df1007
#define T1_KAOS_RANVAL_63     0x65f586a1
#define T1_KAOS_RANVAL_64     0xfba1ac6c
#define T1_KAOS_RANVAL_65     0x4567789b
#define T1_KAOS_RANVAL_66     0xe8037a86
#define T1_KAOS_RANVAL_67     0x7e8caa16
#define T1_KAOS_RANVAL_68     0x2a936bab
#define T1_KAOS_RANVAL_69     0x9a206b61
#define T1_KAOS_RANVAL_6a     0xfaaddac8
#define T1_KAOS_RANVAL_6b     0x13e8ff99
#define T1_KAOS_RANVAL_6c     0x5718b0d6
#define T1_KAOS_RANVAL_6d     0x78b1b70a
#define T1_KAOS_RANVAL_6e     0x66572fd2
#define T1_KAOS_RANVAL_6f     0x0e93a115
#define T1_KAOS_RANVAL_70     0x5b31bf53
#define T1_KAOS_RANVAL_71     0x9f4595aa
#define T1_KAOS_RANVAL_72     0x6b02ae28
#define T1_KAOS_RANVAL_73     0x79baa98d
#define T1_KAOS_RANVAL_74     0xf6bdcea6
#define T1_KAOS_RANVAL_75     0x06f6c603
#define T1_KAOS_RANVAL_76     0x4586af93
#define T1_KAOS_RANVAL_77     0x84596396
#define T1_KAOS_RANVAL_78     0xd24309ce
#define T1_KAOS_RANVAL_79     0xea9c2116
#define T1_KAOS_RANVAL_7a     0x390e5b24
#define T1_KAOS_RANVAL_7b     0x66106b05
#define T1_KAOS_RANVAL_7c     0x472ca0ef
#define T1_KAOS_RANVAL_7d     0x483f74fd
#define T1_KAOS_RANVAL_7e     0x0abf4978
#define T1_KAOS_RANVAL_7f     0x3cf1b5e8
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
!    areaoffset     1344
!    ncache         0
!    emulate_ncache 1
!    pagesize       8192
!    invsize        0
!    codecount      5003
!    code           36098000
!    entry          36098000
!    fsr_exceptions 00000000
!    fsr_roundmode  00000004
!    fsr_mask       c0000fff
!    seed           d3d24dc35098
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

KTEXT_MODULE(t0_module_ktbl, 0x36098000)
.seg "text"
	KGLOBAL(t0_ktbl)
t0_ktbl_page_begin:
.global t0_kref; t0_kref:
	.skip 0
t0_ktbl:
	.word	0x20480001	! t0_kref+0x0:   	bn,a,pt	%icc, _kref+0x4
	.word	0x9264c015	! t0_kref+0x4:   	subc	%l3, %l5, %o1
	.word	0x95b48504	! t0_kref+0x8:   	fcmpgt16	%f18, %f4, %o2
	.word	0xa63cebfe	! t0_kref+0xc:   	xnor	%l3, 0xbfe, %l3
	.word	0xeaa01019	! t0_kref+0x10:   	sta	%l5, [%g0 + %i1]0x80
	.word	0xee40a010	! t0_kref+0x14:   	ldsw	[%g2 + 0x10], %l7
	.word	0xa9400000	! t0_kref+0x18:   	mov	%y, %l4
	.word	0xa7a00526	! t0_kref+0x1c:   	fsqrts	%f6, %f19
	.word	0x99a01910	! t0_kref+0x20:   	fitod	%f16, %f12
	call	SYM(t0_subr2)
	.word	0x805536f5	! t0_kref+0x28:   	umul	%l4, -0x90b, %g0
	.word	0x90bd4013	! t0_kref+0x2c:   	xnorcc	%l5, %l3, %o0
	.word	0xa274b4ca	! t0_kref+0x30:   	udiv	%l2, -0xb36, %l1
	.word	0xa61ca2cd	! t0_kref+0x34:   	xor	%l2, 0x2cd, %l3
	.word	0xe3ee501d	! t0_kref+0x38:   	prefetcha	%i1 + %i5, 17
	.word	0xd078a038	! t0_kref+0x3c:   	swap	[%g2 + 0x38], %o0
	.word	0xaadd7f7b	! t0_kref+0x40:   	smulcc	%l5, -0x85, %l5
	.word	0xe09e105d	! t0_kref+0x44:   	ldda	[%i0 + %i5]0x82, %l0
	.word	0x89a01a4c	! t0_kref+0x48:   	fdtoi	%f12, %f4
	.word	0xad14b1ea	! t0_kref+0x4c:   	taddcctv	%l2, -0xe16, %l6
	call	SYM(t0_subr3)
	.word	0xa7a58833	! t0_kref+0x54:   	fadds	%f22, %f19, %f19
	.word	0x80150012	! t0_kref+0x58:   	or	%l4, %l2, %g0
	.word	0x95a0054e	! t0_kref+0x5c:   	fsqrtd	%f14, %f10
	.word	0x9254c015	! t0_kref+0x60:   	umul	%l3, %l5, %o1
	.word	0x27480001	! t0_kref+0x64:   	fbul,a,pt	%fcc0, _kref+0x68
	.word	0x9ba2882d	! t0_kref+0x68:   	fadds	%f10, %f13, %f13
	.word	0x37480003	! t0_kref+0x6c:   	fbge,a,pt	%fcc0, _kref+0x78
	.word	0x81b58335	! t0_kref+0x70:   	bmask	%l6, %l5, %g0
	.word	0x941cb00a	! t0_kref+0x74:   	xor	%l2, -0xff6, %o2
	.word	0x9fb58173	! t0_kref+0x78:   	edge32ln	%l6, %l3, %o7
	.word	0xa5a00525	! t0_kref+0x7c:   	fsqrts	%f5, %f18
	.word	0x9db28cb3	! t0_kref+0x80:   	fandnot2s	%f10, %f19, %f14
	.word	0x81a94a31	! t0_kref+0x84:   	fcmps	%fcc0, %f5, %f17
	.word	0x8ba01a48	! t0_kref+0x88:   	fdtoi	%f8, %f5
	.word	0x953d600d	! t0_kref+0x8c:   	sra	%l5, 0xd, %o2
	.word	0x8143c000	! t0_kref+0x90:   	stbar
	.word	0xa1a00556	! t0_kref+0x94:   	fsqrtd	%f22, %f16
	.word	0x81a94ab2	! t0_kref+0x98:   	fcmpes	%fcc0, %f5, %f18
	.word	0x001fffff	! t0_kref+0x9c:   	illtrap	0x1fffff
	.word	0xe868a031	! t0_kref+0xa0:   	ldstub	[%g2 + 0x31], %l4
	.word	0xd656201c	! t0_kref+0xa4:   	ldsh	[%i0 + 0x1c], %o3
	.word	0x8d84f547	! t0_kref+0xa8:   	wr	%l3, 0xfffff547, %fprs
	.word	0x86102011	! t0_kref+0xac:   	mov	0x11, %g3
	.word	0x86a0e001	! t0_kref+0xb0:   	subcc	%g3, 1, %g3
	.word	0x2280001a	! t0_kref+0xb4:   	be,a	_kref+0x11c
	.word	0x990d713b	! t0_kref+0xb8:   	tsubcc	%l5, -0xec5, %o4
	.word	0xe8280019	! t0_kref+0xbc:   	stb	%l4, [%g0 + %i1]
	.word	0xc568a10c	! t0_kref+0xc0:   	prefetch	%g2 + 0x10c, 2
	.word	0xa3a01090	! t0_kref+0xc4:   	fxtos	%f16, %f17
	.word	0xa1a0054a	! t0_kref+0xc8:   	fsqrtd	%f10, %f16
	.word	0xa0ddb230	! t0_kref+0xcc:   	smulcc	%l6, -0xdd0, %l0
	.word	0xed066008	! t0_kref+0xd0:   	ld	[%i1 + 8], %f22
	.word	0xe856c018	! t0_kref+0xd4:   	ldsh	[%i3 + %i0], %l4
	.word	0x8fa00534	! t0_kref+0xd8:   	fsqrts	%f20, %f7
	.word	0x9ebc8014	! t0_kref+0xdc:   	xnorcc	%l2, %l4, %o7
	.word	0x374ffff4	! t0_kref+0xe0:   	fbge,a,pt	%fcc0, _kref+0xb0
	.word	0xa7a01a4a	! t0_kref+0xe4:   	fdtoi	%f10, %f19
	call	SYM(t0_subr2)
	.word	0xa00c8012	! t0_kref+0xec:   	and	%l2, %l2, %l0
	.word	0xe62e001a	! t0_kref+0xf0:   	stb	%l3, [%i0 + %i2]
	.word	0x97b58093	! t0_kref+0xf4:   	edge16	%l6, %l3, %o3
	.word	0xa7628014	! t0_kref+0xf8:   	movue	%fcc0, %l4, %l3
	.word	0xea2e4000	! t0_kref+0xfc:   	stb	%l5, [%i1]
	.word	0x90650013	! t0_kref+0x100:   	subc	%l4, %l3, %o0
	.word	0xe09e1000	! t0_kref+0x104:   	ldda	[%i0]0x80, %l0
	.word	0x91400000	! t0_kref+0x108:   	mov	%y, %o0
	.word	0x81a8ca36	! t0_kref+0x10c:   	fcmps	%fcc0, %f3, %f22
	.word	0x81848000	! t0_kref+0x110:   	wr	%l2, %g0, %y
	.word	0x992ca01b	! t0_kref+0x114:   	sll	%l2, 0x1b, %o4
	.word	0x89a00544	! t0_kref+0x118:   	fsqrtd	%f4, %f4
	.word	0xa864edce	! t0_kref+0x11c:   	subc	%l3, 0xdce, %l4
	.word	0x972ce00c	! t0_kref+0x120:   	sll	%l3, 0xc, %o3
	.word	0xc56e4015	! t0_kref+0x124:   	prefetch	%i1 + %l5, 2
	.word	0x8143c000	! t0_kref+0x128:   	stbar
	.word	0x89b1c62e	! t0_kref+0x12c:   	fmul8x16	%f7, %f14, %f4
	.word	0xa7b34dee	! t0_kref+0x130:   	fnands	%f13, %f14, %f19
	.word	0xa23d0012	! t0_kref+0x134:   	xnor	%l4, %l2, %l1
	.word	0xe2fe501c	! t0_kref+0x138:   	swapa	[%i1 + %i4]0x80, %l1
	.word	0xaa356dd2	! t0_kref+0x13c:   	orn	%l5, 0xdd2, %l5
	.word	0x9de3bfa0	! t0_kref+0x140:   	save	%sp, -0x60, %sp
	.word	0xb6dee061	! t0_kref+0x144:   	smulcc	%i3, 0x61, %i3
	.word	0x95ef239a	! t0_kref+0x148:   	restore	%i4, 0x39a, %o2
	.word	0xaa25b430	! t0_kref+0x14c:   	sub	%l6, -0xbd0, %l5
	.word	0xa7a018c4	! t0_kref+0x150:   	fdtos	%f4, %f19
	.word	0x29800001	! t0_kref+0x154:   	fbl,a	_kref+0x158
	.word	0x93400000	! t0_kref+0x158:   	mov	%y, %o1
	.word	0x2c480001	! t0_kref+0x15c:   	bneg,a,pt	%icc, _kref+0x160
	.word	0x95a00554	! t0_kref+0x160:   	fsqrtd	%f20, %f10
	.word	0xea2e401a	! t0_kref+0x164:   	stb	%l5, [%i1 + %i2]
	.word	0x2b480003	! t0_kref+0x168:   	fbug,a,pt	%fcc0, _kref+0x174
	.word	0xa5a00556	! t0_kref+0x16c:   	fsqrtd	%f22, %f18
	.word	0xea2e200a	! t0_kref+0x170:   	stb	%l5, [%i0 + 0xa]
	.word	0xa41cb80e	! t0_kref+0x174:   	xor	%l2, -0x7f2, %l2
	.word	0xe40e8018	! t0_kref+0x178:   	ldub	[%i2 + %i0], %l2
	.word	0x87a01a27	! t0_kref+0x17c:   	fstoi	%f7, %f3
	.word	0xec4e7ffb	! t0_kref+0x180:   	ldsb	[%i1 - 5], %l6
	.word	0x89a58d26	! t0_kref+0x184:   	fsmuld	%f22, %f6, %f4
	.word	0xa81d32a0	! t0_kref+0x188:   	xor	%l4, -0xd60, %l4
	.word	0xada50844	! t0_kref+0x18c:   	faddd	%f20, %f4, %f22
	.word	0xd40e3ff9	! t0_kref+0x190:   	ldub	[%i0 - 7], %o2
	.word	0x99a0054c	! t0_kref+0x194:   	fsqrtd	%f12, %f12
	.word	0xae7d0014	! t0_kref+0x198:   	sdiv	%l4, %l4, %l7
	.word	0x31480002	! t0_kref+0x19c:   	fba,a,pt	%fcc0, _kref+0x1a4
	.word	0xeac71018	! t0_kref+0x1a0:   	ldswa	[%i4 + %i0]0x80, %l5
	.word	0x89a0108c	! t0_kref+0x1a4:   	fxtos	%f12, %f4
	.word	0x87b38da4	! t0_kref+0x1a8:   	fxors	%f14, %f4, %f3
	.word	0x99a288c2	! t0_kref+0x1ac:   	fsubd	%f10, %f2, %f12
	.word	0xd24e2008	! t0_kref+0x1b0:   	ldsb	[%i0 + 8], %o1
	.word	0x965d6c73	! t0_kref+0x1b4:   	smul	%l5, 0xc73, %o3
	.word	0x9ebdbfa1	! t0_kref+0x1b8:   	xnorcc	%l6, -0x5f, %o7
	.word	0x81aa0a50	! t0_kref+0x1bc:   	fcmpd	%fcc0, %f8, %f16
	.word	0x81de400e	! t0_kref+0x1c0:   	flush	%i1 + %sp
	.word	0xc398a040	! t0_kref+0x1c4:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0x37800004	! t0_kref+0x1c8:   	fbge,a	_kref+0x1d8
	.word	0x85b307d4	! t0_kref+0x1cc:   	pdist	%f12, %f20, %f2
	.word	0x3e480005	! t0_kref+0x1d0:   	bvc,a,pt	%icc, _kref+0x1e4
	.word	0x9561275a	! t0_kref+0x1d4:   	movl	%fcc0, -0xa6, %o2
	.word	0x95a488ce	! t0_kref+0x1d8:   	fsubd	%f18, %f14, %f10
	.word	0x96648013	! t0_kref+0x1dc:   	subc	%l2, %l3, %o3
	.word	0xac9d4015	! t0_kref+0x1e0:   	xorcc	%l5, %l5, %l6
	.word	0x932d8012	! t0_kref+0x1e4:   	sll	%l6, %l2, %o1
	.word	0x91a00127	! t0_kref+0x1e8:   	fabss	%f7, %f8
	.word	0x85b40eca	! t0_kref+0x1ec:   	fornot2	%f16, %f10, %f2
	.word	0x905d0013	! t0_kref+0x1f0:   	smul	%l4, %l3, %o0
	.word	0x8db20a4c	! t0_kref+0x1f4:   	fpadd32	%f8, %f12, %f6
	.word	0xb6102002	! t0_kref+0x1f8:   	mov	0x2, %i3
	.word	0xaaf4e8e6	! t0_kref+0x1fc:   	udivcc	%l3, 0x8e6, %l5
	.word	0xa3a00534	! t0_kref+0x200:   	fsqrts	%f20, %f17
	.word	0x91a20d2a	! t0_kref+0x204:   	fsmuld	%f8, %f10, %f8
	.word	0x3b480002	! t0_kref+0x208:   	fble,a,pt	%fcc0, _kref+0x210
	.word	0x9da0190d	! t0_kref+0x20c:   	fitod	%f13, %f14
	.word	0x8ba2c8ab	! t0_kref+0x210:   	fsubs	%f11, %f11, %f5
	.word	0x89a01a24	! t0_kref+0x214:   	fstoi	%f4, %f4
	.word	0x96554016	! t0_kref+0x218:   	umul	%l5, %l6, %o3
	.word	0xa7b0076c	! t0_kref+0x21c:   	fpack16	%f12, %f19
	.word	0x8610200c	! t0_kref+0x220:   	mov	0xc, %g3
	.word	0x86a0e001	! t0_kref+0x224:   	subcc	%g3, 1, %g3
	.word	0x22800012	! t0_kref+0x228:   	be,a	_kref+0x270
	.word	0xaba2482a	! t0_kref+0x22c:   	fadds	%f9, %f10, %f21
	.word	0xaf63a2b2	! t0_kref+0x230:   	movule	%fcc0, 0x2b2, %l7
	.word	0x94154014	! t0_kref+0x234:   	or	%l5, %l4, %o2
	.word	0xd3a71019	! t0_kref+0x238:   	sta	%f9, [%i4 + %i1]0x80
	.word	0xa3a000a9	! t0_kref+0x23c:   	fnegs	%f9, %f17
	.word	0xa5a10852	! t0_kref+0x240:   	faddd	%f4, %f18, %f18
	.word	0x8143c000	! t0_kref+0x244:   	stbar
	.word	0xa8c522c6	! t0_kref+0x248:   	addccc	%l4, 0x2c6, %l4
	.word	0xa88cfbee	! t0_kref+0x24c:   	andcc	%l3, -0x412, %l4
	.word	0x81ac0ad6	! t0_kref+0x250:   	fcmped	%fcc0, %f16, %f22
	.word	0x9f24c015	! t0_kref+0x254:   	mulscc	%l3, %l5, %o7
	.word	0xa5b48d24	! t0_kref+0x258:   	fandnot1s	%f18, %f4, %f18
	.word	0xa1b48ed0	! t0_kref+0x25c:   	fornot2	%f18, %f16, %f16
	.word	0x81dc800b	! t0_kref+0x260:   	flush	%l2 + %o3
	.word	0xd608a003	! t0_kref+0x264:   	ldub	[%g2 + 3], %o3
	.word	0x26480006	! t0_kref+0x268:   	bl,a,pt	%icc, _kref+0x280
	.word	0x9da00546	! t0_kref+0x26c:   	fsqrtd	%f6, %f14
	.word	0x97aa402e	! t0_kref+0x270:   	fmovse	%fcc0, %f14, %f11
	.word	0xe616c018	! t0_kref+0x274:   	lduh	[%i3 + %i0], %l3
	.word	0x81a90a56	! t0_kref+0x278:   	fcmpd	%fcc0, %f4, %f22
	.word	0x91b20c74	! t0_kref+0x27c:   	fnors	%f8, %f20, %f8
	.word	0x95b28ece	! t0_kref+0x280:   	fornot2	%f10, %f14, %f10
	.word	0xaba3c824	! t0_kref+0x284:   	fadds	%f15, %f4, %f21
	.word	0x99b40e14	! t0_kref+0x288:   	fand	%f16, %f20, %f12
	.word	0x2b480004	! t0_kref+0x28c:   	fbug,a,pt	%fcc0, _kref+0x29c
	.word	0xee062010	! t0_kref+0x290:   	ld	[%i0 + 0x10], %l7
	.word	0x993c8015	! t0_kref+0x294:   	sra	%l2, %l5, %o4
	.word	0x97a3c928	! t0_kref+0x298:   	fmuls	%f15, %f8, %f11
	.word	0x9ba01a23	! t0_kref+0x29c:   	fstoi	%f3, %f13
	.word	0x8ba01a2e	! t0_kref+0x2a0:   	fstoi	%f14, %f5
	.word	0x942cc016	! t0_kref+0x2a4:   	andn	%l3, %l6, %o2
	.word	0xa424f745	! t0_kref+0x2a8:   	sub	%l3, -0x8bb, %l2
	.word	0x81850000	! t0_kref+0x2ac:   	wr	%l4, %g0, %y
	.word	0xad3ce003	! t0_kref+0x2b0:   	sra	%l3, 0x3, %l6
	.word	0xa4f58015	! t0_kref+0x2b4:   	udivcc	%l6, %l5, %l2
	.word	0xae9d0015	! t0_kref+0x2b8:   	xorcc	%l4, %l5, %l7
	.word	0xa7a000ab	! t0_kref+0x2bc:   	fnegs	%f11, %f19
	.word	0xa055289c	! t0_kref+0x2c0:   	umul	%l4, 0x89c, %l0
	.word	0x80ace60b	! t0_kref+0x2c4:   	andncc	%l3, 0x60b, %g0
	.word	0xaba4c825	! t0_kref+0x2c8:   	fadds	%f19, %f5, %f21
	.word	0xec881018	! t0_kref+0x2cc:   	lduba	[%g0 + %i0]0x80, %l6
	.word	0xd6d6d018	! t0_kref+0x2d0:   	ldsha	[%i3 + %i0]0x80, %o3
	.word	0xd3267fe8	! t0_kref+0x2d4:   	st	%f9, [%i1 - 0x18]
	.word	0xe3ee501a	! t0_kref+0x2d8:   	prefetcha	%i1 + %i2, 17
	.word	0x91b54d2e	! t0_kref+0x2dc:   	fandnot1s	%f21, %f14, %f8
	.word	0xe4280019	! t0_kref+0x2e0:   	stb	%l2, [%g0 + %i1]
	.word	0x81dcc00c	! t0_kref+0x2e4:   	flush	%l3 + %o4
	.word	0x2e480007	! t0_kref+0x2e8:   	bvs,a,pt	%icc, _kref+0x304
	.word	0x97a01a44	! t0_kref+0x2ec:   	fdtoi	%f4, %f11
	.word	0xa4448012	! t0_kref+0x2f0:   	addc	%l2, %l2, %l2
	.word	0xd9be1855	! t0_kref+0x2f4:   	stda	%f12, [%i0 + %l5]0xc2
	.word	0xa81cc014	! t0_kref+0x2f8:   	xor	%l3, %l4, %l4
	.word	0x81848000	! t0_kref+0x2fc:   	wr	%l2, %g0, %y
	.word	0x81abca2f	! t0_kref+0x300:   	fcmps	%fcc0, %f15, %f15
	.word	0xde10a028	! t0_kref+0x304:   	lduh	[%g2 + 0x28], %o7
	.word	0xee000018	! t0_kref+0x308:   	ld	[%g0 + %i0], %l7
	.word	0xa0a4c014	! t0_kref+0x30c:   	subcc	%l3, %l4, %l0
	.word	0xada00523	! t0_kref+0x310:   	fsqrts	%f3, %f22
	.word	0x93b58152	! t0_kref+0x314:   	edge32l	%l6, %l2, %o1
	.word	0xa5b50aab	! t0_kref+0x318:   	fpsub16s	%f20, %f11, %f18
	.word	0x25480004	! t0_kref+0x31c:   	fblg,a,pt	%fcc0, _kref+0x32c
	.word	0xa9b54aaa	! t0_kref+0x320:   	fpsub16s	%f21, %f10, %f20
	.word	0x81df0009	! t0_kref+0x324:   	flush	%i4 + %o1
	.word	0x9854b2e3	! t0_kref+0x328:   	umul	%l2, -0xd1d, %o4
	.word	0x85854016	! t0_kref+0x32c:   	wr	%l5, %l6, %ccr
	.word	0x81ddc01d	! t0_kref+0x330:   	flush	%l7 + %i5
	.word	0xa1a148ab	! t0_kref+0x334:   	fsubs	%f5, %f11, %f16
	.word	0xe620a000	! t0_kref+0x338:   	st	%l3, [%g2]
	.word	0x9fc10000	! t0_kref+0x33c:   	call	%g4
	.word	0xe4981019	! t0_kref+0x340:   	ldda	[%g0 + %i1]0x80, %l2
	.word	0x8ba0c82b	! t0_kref+0x344:   	fadds	%f3, %f11, %f5
	.word	0x91a00548	! t0_kref+0x348:   	fsqrtd	%f8, %f8
	.word	0x8da40856	! t0_kref+0x34c:   	faddd	%f16, %f22, %f6
	.word	0x91a0054e	! t0_kref+0x350:   	fsqrtd	%f14, %f8
	.word	0x3e480006	! t0_kref+0x354:   	bvc,a,pt	%icc, _kref+0x36c
	.word	0xa90cb381	! t0_kref+0x358:   	tsubcc	%l2, -0xc7f, %l4
	.word	0xa9b086f2	! t0_kref+0x35c:   	fmul8ulx16	%f2, %f18, %f20
	.word	0xa0254015	! t0_kref+0x360:   	sub	%l5, %l5, %l0
	.word	0xaaaca901	! t0_kref+0x364:   	andncc	%l2, 0x901, %l5
	.word	0x95b20f8a	! t0_kref+0x368:   	for	%f8, %f10, %f10
	.word	0xaa7d4014	! t0_kref+0x36c:   	sdiv	%l5, %l4, %l5
	.word	0x81ab0ac8	! t0_kref+0x370:   	fcmped	%fcc0, %f12, %f8
	.word	0xe086101c	! t0_kref+0x374:   	lda	[%i0 + %i4]0x80, %l0
	.word	0x30480006	! t0_kref+0x378:   	ba,a,pt	%icc, _kref+0x390
	.word	0x96e4c013	! t0_kref+0x37c:   	subccc	%l3, %l3, %o3
	.word	0x9bb38faf	! t0_kref+0x380:   	fors	%f14, %f15, %f13
	.word	0xc0164000	! t0_kref+0x384:   	lduh	[%i1], %g0
	.word	0xd648a031	! t0_kref+0x388:   	ldsb	[%g2 + 0x31], %o3
	.word	0xa4a4b52d	! t0_kref+0x38c:   	subcc	%l2, -0xad3, %l2
	.word	0xadb4c072	! t0_kref+0x390:   	edge8ln	%l3, %l2, %l6
	.word	0xdd1e2010	! t0_kref+0x394:   	ldd	[%i0 + 0x10], %f14
	.word	0x95a00550	! t0_kref+0x398:   	fsqrtd	%f16, %f10
	.word	0x89a01923	! t0_kref+0x39c:   	fstod	%f3, %f4
	.word	0x99b20548	! t0_kref+0x3a0:   	fcmpeq16	%f8, %f8, %o4
	.word	0x81ac0ac6	! t0_kref+0x3a4:   	fcmped	%fcc0, %f16, %f6
	.word	0xaf3cc012	! t0_kref+0x3a8:   	sra	%l3, %l2, %l7
	.word	0xadb500f3	! t0_kref+0x3ac:   	edge16ln	%l4, %l3, %l6
	.word	0xa1b00cca	! t0_kref+0x3b0:   	fnot2	%f10, %f16
	.word	0xc807bff0	! t0_kref+0x3b4:   	ld	[%fp - 0x10], %g4
	.word	0x81b50450	! t0_kref+0x3b8:   	fcmpne16	%f20, %f16, %g0
	.word	0x9bb204d0	! t0_kref+0x3bc:   	fcmpne32	%f8, %f16, %o5
	.word	0xae754012	! t0_kref+0x3c0:   	udiv	%l5, %l2, %l7
	.word	0x91a34d30	! t0_kref+0x3c4:   	fsmuld	%f13, %f16, %f8
	.word	0xd600a018	! t0_kref+0x3c8:   	ld	[%g2 + 0x18], %o3
	.word	0xa9a00531	! t0_kref+0x3cc:   	fsqrts	%f17, %f20
	.word	0x933d6019	! t0_kref+0x3d0:   	sra	%l5, 0x19, %o1
	.word	0x2c480003	! t0_kref+0x3d4:   	bneg,a,pt	%icc, _kref+0x3e0
	.word	0x95b580f5	! t0_kref+0x3d8:   	edge16ln	%l6, %l5, %o2
	.word	0xa6e4f149	! t0_kref+0x3dc:   	subccc	%l3, -0xeb7, %l3
	.word	0xc398a040	! t0_kref+0x3e0:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0x97400000	! t0_kref+0x3e4:   	mov	%y, %o3
	.word	0x81850000	! t0_kref+0x3e8:   	wr	%l4, %g0, %y
	.word	0x94254012	! t0_kref+0x3ec:   	sub	%l5, %l2, %o2
	.word	0xa1b48df6	! t0_kref+0x3f0:   	fnands	%f18, %f22, %f16
	.word	0xeb68a00a	! t0_kref+0x3f4:   	prefetch	%g2 + 0xa, 21
	.word	0xa9b50448	! t0_kref+0x3f8:   	fcmpne16	%f20, %f8, %l4
	.word	0xa5b500b3	! t0_kref+0x3fc:   	edge16n	%l4, %l3, %l2
	.word	0x81ab8a2e	! t0_kref+0x400:   	fcmps	%fcc0, %f14, %f14
	.word	0x81ac8ac2	! t0_kref+0x404:   	fcmped	%fcc0, %f18, %f2
	.word	0x81dec010	! t0_kref+0x408:   	flush	%i3 + %l0
	.word	0x8da288c8	! t0_kref+0x40c:   	fsubd	%f10, %f8, %f6
	.word	0xcd1fbce8	! t0_kref+0x410:   	ldd	[%fp - 0x318], %f6
	.word	0x3f480007	! t0_kref+0x414:   	fbo,a,pt	%fcc0, _kref+0x430
	.word	0xa7b20c67	! t0_kref+0x418:   	fnors	%f8, %f7, %f19
	.word	0xa9a00532	! t0_kref+0x41c:   	fsqrts	%f18, %f20
	.word	0xe3b8a080	! t0_kref+0x420:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x801cf96e	! t0_kref+0x424:   	xor	%l3, -0x692, %g0
	.word	0xeace9018	! t0_kref+0x428:   	ldsba	[%i2 + %i0]0x80, %l5
	.word	0x8ba50936	! t0_kref+0x42c:   	fmuls	%f20, %f22, %f5
	.word	0xd010a028	! t0_kref+0x430:   	lduh	[%g2 + 0x28], %o0
	.word	0x2f480007	! t0_kref+0x434:   	fbu,a,pt	%fcc0, _kref+0x450
	.word	0xada00550	! t0_kref+0x438:   	fsqrtd	%f16, %f22
	.word	0x89a00550	! t0_kref+0x43c:   	fsqrtd	%f16, %f4
	.word	0x9a44b45c	! t0_kref+0x440:   	addc	%l2, -0xba4, %o5
	.word	0xe1180019	! t0_kref+0x444:   	ldd	[%g0 + %i1], %f16
	.word	0x89a2c8a8	! t0_kref+0x448:   	fsubs	%f11, %f8, %f4
	.word	0x27800002	! t0_kref+0x44c:   	fbul,a	_kref+0x454
	.word	0xd0ce9018	! t0_kref+0x450:   	ldsba	[%i2 + %i0]0x80, %o0
	.word	0xa1a01925	! t0_kref+0x454:   	fstod	%f5, %f16
	.word	0xc906001c	! t0_kref+0x458:   	ld	[%i0 + %i4], %f4
	.word	0xa3a01a54	! t0_kref+0x45c:   	fdtoi	%f20, %f17
	.word	0xc986501c	! t0_kref+0x460:   	lda	[%i1 + %i4]0x80, %f4
	.word	0xe1066004	! t0_kref+0x464:   	ld	[%i1 + 4], %f16
	call	SYM(t0_subr2)
	.word	0x97b4048e	! t0_kref+0x46c:   	fcmple32	%f16, %f14, %o3
	.word	0xc398a040	! t0_kref+0x470:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0xea2e7fe5	! t0_kref+0x474:   	stb	%l5, [%i1 - 0x1b]
	.word	0xa0448013	! t0_kref+0x478:   	addc	%l2, %l3, %l0
	.word	0xaa648016	! t0_kref+0x47c:   	subc	%l2, %l6, %l5
	.word	0xe2166012	! t0_kref+0x480:   	lduh	[%i1 + 0x12], %l1
	.word	0x8143e040	! t0_kref+0x484:   	membar	0x40
	.word	0xf3ee101d	! t0_kref+0x488:   	prefetcha	%i0 + %i5, 25
	.word	0x97a00528	! t0_kref+0x48c:   	fsqrts	%f8, %f11
	.word	0x9afd0013	! t0_kref+0x490:   	sdivcc	%l4, %l3, %o5
	.word	0xe240a038	! t0_kref+0x494:   	ldsw	[%g2 + 0x38], %l1
	.word	0xd1070019	! t0_kref+0x498:   	ld	[%i4 + %i1], %f8
	.word	0x25800007	! t0_kref+0x49c:   	fblg,a	_kref+0x4b8
	.word	0x8da01923	! t0_kref+0x4a0:   	fstod	%f3, %f6
	.word	0xeaae501a	! t0_kref+0x4a4:   	stba	%l5, [%i1 + %i2]0x80
	.word	0x981d7d2d	! t0_kref+0x4a8:   	xor	%l5, -0x2d3, %o4
	.word	0xd106001c	! t0_kref+0x4ac:   	ld	[%i0 + %i4], %f8
	.word	0x89a0104e	! t0_kref+0x4b0:   	fdtox	%f14, %f4
	.word	0xd99e1a5c	! t0_kref+0x4b4:   	ldda	[%i0 + %i4]0xd2, %f12
	.word	0x81850000	! t0_kref+0x4b8:   	wr	%l4, %g0, %y
	.word	0x9b400000	! t0_kref+0x4bc:   	mov	%y, %o5
	.word	0x99b48450	! t0_kref+0x4c0:   	fcmpne16	%f18, %f16, %o4
	.word	0x99a4482d	! t0_kref+0x4c4:   	fadds	%f17, %f13, %f12
	.word	0x85a0054c	! t0_kref+0x4c8:   	fsqrtd	%f12, %f2
	.word	0xe42e401a	! t0_kref+0x4cc:   	stb	%l2, [%i1 + %i2]
	.word	0x90acb76c	! t0_kref+0x4d0:   	andncc	%l2, -0x894, %o0
	.word	0x943d0015	! t0_kref+0x4d4:   	xnor	%l4, %l5, %o2
	.word	0xec28a002	! t0_kref+0x4d8:   	stb	%l6, [%g2 + 2]
	.word	0x9035b71a	! t0_kref+0x4dc:   	orn	%l6, -0x8e6, %o0
	.word	0xaf2d2019	! t0_kref+0x4e0:   	sll	%l4, 0x19, %l7
	.word	0xa9b44c63	! t0_kref+0x4e4:   	fnors	%f17, %f3, %f20
	.word	0xec20a018	! t0_kref+0x4e8:   	st	%l6, [%g2 + 0x18]
	.word	0xabb4c115	! t0_kref+0x4ec:   	edge32	%l3, %l5, %l5
	.word	0x32480002	! t0_kref+0x4f0:   	bne,a,pt	%icc, _kref+0x4f8
	.word	0x97b40ee9	! t0_kref+0x4f4:   	fornot2s	%f16, %f9, %f11
	.word	0x83c07ae8	! t0_kref+0x4f8:   	jmpl	%g1 - 0x518, %g1
	.word	0xa1b1c666	! t0_kref+0x4fc:   	fmul8x16au	%f7, %f6, %f16
	.word	0xa5a0054e	! t0_kref+0x500:   	fsqrtd	%f14, %f18
	.word	0x81a9cab4	! t0_kref+0x504:   	fcmpes	%fcc0, %f7, %f20
	.word	0x93b58016	! t0_kref+0x508:   	edge8	%l6, %l6, %o1
	.word	0xc398a080	! t0_kref+0x50c:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0x961db895	! t0_kref+0x510:   	xor	%l6, -0x76b, %o3
	.word	0x8da00533	! t0_kref+0x514:   	fsqrts	%f19, %f6
	.word	0xa9a00544	! t0_kref+0x518:   	fsqrtd	%f4, %f20
	.word	0xcb270019	! t0_kref+0x51c:   	st	%f5, [%i4 + %i1]
	.word	0x81350013	! t0_kref+0x520:   	srl	%l4, %l3, %g0
	.word	0xe42e6019	! t0_kref+0x524:   	stb	%l2, [%i1 + 0x19]
	.word	0xd7270019	! t0_kref+0x528:   	st	%f11, [%i4 + %i1]
	.word	0x81df71fc	! t0_kref+0x52c:   	flush	%i5 - 0xe04
	.word	0x81580000	! t0_kref+0x530:   	flushw
	.word	0x81d8365e	! t0_kref+0x534:   	flush	%g0 - 0x9a2
	.word	0x3b800001	! t0_kref+0x538:   	fble,a	_kref+0x53c
	.word	0xdd067fec	! t0_kref+0x53c:   	ld	[%i1 - 0x14], %f14
	.word	0x80f57e20	! t0_kref+0x540:   	udivcc	%l5, -0x1e0, %g0
	.word	0x99a00146	! t0_kref+0x544:   	fabsd	%f6, %f12
	.word	0x9a44ad59	! t0_kref+0x548:   	addc	%l2, 0xd59, %o5
	.word	0x8610200f	! t0_kref+0x54c:   	mov	0xf, %g3
	.word	0x86a0e001	! t0_kref+0x550:   	subcc	%g3, 1, %g3
	.word	0x2280000a	! t0_kref+0x554:   	be,a	_kref+0x57c
	.word	0xe968a041	! t0_kref+0x558:   	prefetch	%g2 + 0x41, 20
	.word	0xf1ee501c	! t0_kref+0x55c:   	prefetcha	%i1 + %i4, 24
	.word	0xe826401c	! t0_kref+0x560:   	st	%l4, [%i1 + %i4]
	.word	0xe440a030	! t0_kref+0x564:   	ldsw	[%g2 + 0x30], %l2
	.word	0xec762010	! t0_kref+0x568:   	stx	%l6, [%i0 + 0x10]
	.word	0xd9bf5a18	! t0_kref+0x56c:   	stda	%f12, [%i5 + %i0]0xd0
	.word	0xc050a010	! t0_kref+0x570:   	ldsh	[%g2 + 0x10], %g0
	.word	0xa835b1c2	! t0_kref+0x574:   	orn	%l6, -0xe3e, %l4
	.word	0x8db28e12	! t0_kref+0x578:   	fand	%f10, %f18, %f6
	.word	0x81ac0ace	! t0_kref+0x57c:   	fcmped	%fcc0, %f16, %f14
	.word	0x98bd7be4	! t0_kref+0x580:   	xnorcc	%l5, -0x41c, %o4
	.word	0xe49f5019	! t0_kref+0x584:   	ldda	[%i5 + %i1]0x80, %l2
	.word	0xe9be5813	! t0_kref+0x588:   	stda	%f20, [%i1 + %l3]0xc0
	.word	0x34800006	! t0_kref+0x58c:   	bg,a	_kref+0x5a4
	.word	0xe8267fe8	! t0_kref+0x590:   	st	%l4, [%i1 - 0x18]
	.word	0xac1c8015	! t0_kref+0x594:   	xor	%l2, %l5, %l6
	.word	0x9db2462a	! t0_kref+0x598:   	fmul8x16	%f9, %f10, %f14
	.word	0xa1b484ce	! t0_kref+0x59c:   	fcmpne32	%f18, %f14, %l0
	.word	0x81aa0a56	! t0_kref+0x5a0:   	fcmpd	%fcc0, %f8, %f22
	.word	0x8143c000	! t0_kref+0x5a4:   	stbar
	.word	0x9fa00523	! t0_kref+0x5a8:   	fsqrts	%f3, %f15
	.word	0x9f2da015	! t0_kref+0x5ac:   	sll	%l6, 0x15, %o7
	.word	0x9b24c016	! t0_kref+0x5b0:   	mulscc	%l3, %l6, %o5
	.word	0x99b580f6	! t0_kref+0x5b4:   	edge16ln	%l6, %l6, %o4
	.word	0x9ba01a4c	! t0_kref+0x5b8:   	fdtoi	%f12, %f13
	.word	0xa13d8016	! t0_kref+0x5bc:   	sra	%l6, %l6, %l0
	.word	0x8da00556	! t0_kref+0x5c0:   	fsqrtd	%f22, %f6
	.word	0xa68d0016	! t0_kref+0x5c4:   	andcc	%l4, %l6, %l3
	.word	0x91a28848	! t0_kref+0x5c8:   	faddd	%f10, %f8, %f8
	.word	0xec20a018	! t0_kref+0x5cc:   	st	%l6, [%g2 + 0x18]
	.word	0x905d3947	! t0_kref+0x5d0:   	smul	%l4, -0x6b9, %o0
	.word	0xe3b8a040	! t0_kref+0x5d4:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x99a0054a	! t0_kref+0x5d8:   	fsqrtd	%f10, %f12
	.word	0x9db50db4	! t0_kref+0x5dc:   	fxors	%f20, %f20, %f14
	.word	0x8143e00c	! t0_kref+0x5e0:   	membar	0xc
	.word	0x8fa00124	! t0_kref+0x5e4:   	fabss	%f4, %f7
	.word	0xea163fe6	! t0_kref+0x5e8:   	lduh	[%i0 - 0x1a], %l5
	.word	0xe3b8a040	! t0_kref+0x5ec:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x90658015	! t0_kref+0x5f0:   	subc	%l6, %l5, %o0
	.word	0xa7a00531	! t0_kref+0x5f4:   	fsqrts	%f17, %f19
	.word	0x95b48173	! t0_kref+0x5f8:   	edge32ln	%l2, %l3, %o2
	.word	0xea28a03b	! t0_kref+0x5fc:   	stb	%l5, [%g2 + 0x3b]
	.word	0xe3b8a040	! t0_kref+0x600:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xa5b5470b	! t0_kref+0x604:   	fmuld8sux16	%f21, %f11, %f18
	.word	0xa81c8014	! t0_kref+0x608:   	xor	%l2, %l4, %l4
	.word	0x95a00542	! t0_kref+0x60c:   	fsqrtd	%f2, %f10
	.word	0x9da0054e	! t0_kref+0x610:   	fsqrtd	%f14, %f14
	.word	0x27800001	! t0_kref+0x614:   	fbul,a	_kref+0x618
	.word	0xaf400000	! t0_kref+0x618:   	mov	%y, %l7
	.word	0x99b00cc2	! t0_kref+0x61c:   	fnot2	%f2, %f12
	.word	0xabb58056	! t0_kref+0x620:   	edge8l	%l6, %l6, %l5
	.word	0x909ca595	! t0_kref+0x624:   	xorcc	%l2, 0x595, %o0
	.word	0x89a4c832	! t0_kref+0x628:   	fadds	%f19, %f18, %f4
	.word	0x27480003	! t0_kref+0x62c:   	fbul,a,pt	%fcc0, _kref+0x638
	.word	0xd456c019	! t0_kref+0x630:   	ldsh	[%i3 + %i1], %o2
	call	SYM(t0_subr3)
	.word	0xd1266014	! t0_kref+0x638:   	st	%f8, [%i1 + 0x14]
	.word	0xe4a65000	! t0_kref+0x63c:   	sta	%l2, [%i1]0x80
	.word	0x81ad8a46	! t0_kref+0x640:   	fcmpd	%fcc0, %f22, %f6
	.word	0xd720a030	! t0_kref+0x644:   	st	%f11, [%g2 + 0x30]
	.word	0x38480001	! t0_kref+0x648:   	bgu,a,pt	%icc, _kref+0x64c
	.word	0xdf263ffc	! t0_kref+0x64c:   	st	%f15, [%i0 - 4]
	.word	0xa6f48013	! t0_kref+0x650:   	udivcc	%l2, %l3, %l3
	.word	0x99b4c176	! t0_kref+0x654:   	edge32ln	%l3, %l6, %o4
	.word	0x89b20fa3	! t0_kref+0x658:   	fors	%f8, %f3, %f4
	.word	0xa65d8016	! t0_kref+0x65c:   	smul	%l6, %l6, %l3
	.word	0x21480005	! t0_kref+0x660:   	fbn,a,pt	%fcc0, _kref+0x674
	.word	0xe0100019	! t0_kref+0x664:   	lduh	[%g0 + %i1], %l0
	.word	0x9bb580f6	! t0_kref+0x668:   	edge16ln	%l6, %l6, %o5
	.word	0x99a30850	! t0_kref+0x66c:   	faddd	%f12, %f16, %f12
	.word	0xa5a30852	! t0_kref+0x670:   	faddd	%f12, %f18, %f18
	.word	0xe830a002	! t0_kref+0x674:   	sth	%l4, [%g2 + 2]
	.word	0xb4103ff8	! t0_kref+0x678:   	mov	0xfffffff8, %i2
	.word	0x8ba3c825	! t0_kref+0x67c:   	fadds	%f15, %f5, %f5
	.word	0xa9b580f3	! t0_kref+0x680:   	edge16ln	%l6, %l3, %l4
	.word	0x95b20965	! t0_kref+0x684:   	fpmerge	%f8, %f5, %f10
	.word	0xcd060000	! t0_kref+0x688:   	ld	[%i0], %f6
	.word	0x9af52957	! t0_kref+0x68c:   	udivcc	%l4, 0x957, %o5
	.word	0xa6b58015	! t0_kref+0x690:   	orncc	%l6, %l5, %l3
	.word	0xc368a104	! t0_kref+0x694:   	prefetch	%g2 + 0x104, 1
	.word	0xe426001c	! t0_kref+0x698:   	st	%l2, [%i0 + %i4]
	.word	0x85850015	! t0_kref+0x69c:   	wr	%l4, %l5, %ccr
	.word	0xe3b8a040	! t0_kref+0x6a0:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xa784e19e	! t0_kref+0x6a4:   	wr	%l3, 0x19e, %gsr
	.word	0x94b58012	! t0_kref+0x6a8:   	orncc	%l6, %l2, %o2
	.word	0xa9a00548	! t0_kref+0x6ac:   	fsqrtd	%f8, %f20
	.word	0xa9a00050	! t0_kref+0x6b0:   	fmovd	%f16, %f20
	.word	0xadb00f29	! t0_kref+0x6b4:   	fsrc2s	%f9, %f22
	.word	0x25480008	! t0_kref+0x6b8:   	fblg,a,pt	%fcc0, _kref+0x6d8
	.word	0xe44e0000	! t0_kref+0x6bc:   	ldsb	[%i0], %l2
	.word	0xd8100018	! t0_kref+0x6c0:   	lduh	[%g0 + %i0], %o4
	.word	0x3e480004	! t0_kref+0x6c4:   	bvc,a,pt	%icc, _kref+0x6d4
	.word	0xc720a018	! t0_kref+0x6c8:   	st	%f3, [%g2 + 0x18]
	.word	0x2e480002	! t0_kref+0x6cc:   	bvs,a,pt	%icc, _kref+0x6d4
	.word	0xac8ceb3e	! t0_kref+0x6d0:   	andcc	%l3, 0xb3e, %l6
	.word	0x9fb54112	! t0_kref+0x6d4:   	edge32	%l5, %l2, %o7
	.word	0xd800a020	! t0_kref+0x6d8:   	ld	[%g2 + 0x20], %o4
	.word	0x81aa8a25	! t0_kref+0x6dc:   	fcmps	%fcc0, %f10, %f5
	.word	0xa9b18e80	! t0_kref+0x6e0:   	fsrc1	%f6, %f20
	.word	0xa5a2c9a3	! t0_kref+0x6e4:   	fdivs	%f11, %f3, %f18
	.word	0x96e48015	! t0_kref+0x6e8:   	subccc	%l2, %l5, %o3
	.word	0x9fa01a46	! t0_kref+0x6ec:   	fdtoi	%f6, %f15
	.word	0xe420a030	! t0_kref+0x6f0:   	st	%l2, [%g2 + 0x30]
	.word	0xea260000	! t0_kref+0x6f4:   	st	%l5, [%i0]
	.word	0xabb54072	! t0_kref+0x6f8:   	edge8ln	%l5, %l2, %l5
	.word	0xa2150015	! t0_kref+0x6fc:   	or	%l4, %l5, %l1
	.word	0xadb1cfad	! t0_kref+0x700:   	fors	%f7, %f13, %f22
	.word	0x95b58012	! t0_kref+0x704:   	edge8	%l6, %l2, %o2
	.word	0xa9b187ca	! t0_kref+0x708:   	pdist	%f6, %f10, %f20
	.word	0xc398a080	! t0_kref+0x70c:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0xd5263ffc	! t0_kref+0x710:   	st	%f10, [%i0 - 4]
	.word	0xea30a032	! t0_kref+0x714:   	sth	%l5, [%g2 + 0x32]
	.word	0x9e14ec07	! t0_kref+0x718:   	or	%l3, 0xc07, %o7
	.word	0xe51e7fe8	! t0_kref+0x71c:   	ldd	[%i1 - 0x18], %f18
	.word	0x9db18a50	! t0_kref+0x720:   	fpadd32	%f6, %f16, %f14
	.word	0xd0566000	! t0_kref+0x724:   	ldsh	[%i1], %o0
	.word	0x81dc8013	! t0_kref+0x728:   	flush	%l2 + %l3
	.word	0xaab54014	! t0_kref+0x72c:   	orncc	%l5, %l4, %l5
	.word	0xd7063fe0	! t0_kref+0x730:   	ld	[%i0 - 0x20], %f11
	.word	0xac65ac92	! t0_kref+0x734:   	subc	%l6, 0xc92, %l6
	.word	0x9fb58114	! t0_kref+0x738:   	edge32	%l6, %l4, %o7
	.word	0xa9400000	! t0_kref+0x73c:   	mov	%y, %l4
	.word	0x2e480004	! t0_kref+0x740:   	bvs,a,pt	%icc, _kref+0x750
	.word	0x9db28f50	! t0_kref+0x744:   	fornot1	%f10, %f16, %f14
	.word	0x97400000	! t0_kref+0x748:   	mov	%y, %o3
	.word	0xa0453085	! t0_kref+0x74c:   	addc	%l4, -0xf7b, %l0
	.word	0x91a508d0	! t0_kref+0x750:   	fsubd	%f20, %f16, %f8
	.word	0x9855a747	! t0_kref+0x754:   	umul	%l6, 0x747, %o4
	.word	0x95b4854c	! t0_kref+0x758:   	fcmpeq16	%f18, %f12, %o2
	.word	0xa1a01931	! t0_kref+0x75c:   	fstod	%f17, %f16
	.word	0xe62e7ff5	! t0_kref+0x760:   	stb	%l3, [%i1 - 0xb]
	.word	0xa2c524a8	! t0_kref+0x764:   	addccc	%l4, 0x4a8, %l1
	.word	0xe4762008	! t0_kref+0x768:   	stx	%l2, [%i0 + 8]
	.word	0xa4a4fe66	! t0_kref+0x76c:   	subcc	%l3, -0x19a, %l2
	.word	0xa5b50a94	! t0_kref+0x770:   	fpsub16	%f20, %f20, %f18
	.word	0xe1be1813	! t0_kref+0x774:   	stda	%f16, [%i0 + %l3]0xc0
	.word	0x9074c015	! t0_kref+0x778:   	udiv	%l3, %l5, %o0
	.word	0x8184c000	! t0_kref+0x77c:   	wr	%l3, %g0, %y
	.word	0x81ac8a48	! t0_kref+0x780:   	fcmpd	%fcc0, %f18, %f8
	.word	0xf007bfe0	! t0_kref+0x784:   	ld	[%fp - 0x20], %i0
	.word	0x9614b535	! t0_kref+0x788:   	or	%l2, -0xacb, %o3
	.word	0xa414c012	! t0_kref+0x78c:   	or	%l3, %l2, %l2
	.word	0xa6b5b495	! t0_kref+0x790:   	orncc	%l6, -0xb6b, %l3
	.word	0x8fa00536	! t0_kref+0x794:   	fsqrts	%f22, %f7
	.word	0x9455360e	! t0_kref+0x798:   	umul	%l4, -0x9f2, %o2
	.word	0xada01a23	! t0_kref+0x79c:   	fstoi	%f3, %f22
	.word	0xe4fe501c	! t0_kref+0x7a0:   	swapa	[%i1 + %i4]0x80, %l2
	.word	0xd106401c	! t0_kref+0x7a4:   	ld	[%i1 + %i4], %f8
	.word	0xdf801019	! t0_kref+0x7a8:   	lda	[%g0 + %i1]0x80, %f15
	.word	0xee16401b	! t0_kref+0x7ac:   	lduh	[%i1 + %i3], %l7
	.word	0x8143c000	! t0_kref+0x7b0:   	stbar
	.word	0x8143e040	! t0_kref+0x7b4:   	membar	0x40
	.word	0xa3150016	! t0_kref+0x7b8:   	taddcctv	%l4, %l6, %l1
	.word	0x89b1c634	! t0_kref+0x7bc:   	fmul8x16	%f7, %f20, %f4
	.word	0x81ab0aca	! t0_kref+0x7c0:   	fcmped	%fcc0, %f12, %f10
	.word	0x8db24fa5	! t0_kref+0x7c4:   	fors	%f9, %f5, %f6
	.word	0x8143c000	! t0_kref+0x7c8:   	stbar
	.word	0x90752b87	! t0_kref+0x7cc:   	udiv	%l4, 0xb87, %o0
	.word	0xc398a040	! t0_kref+0x7d0:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0xe42e8019	! t0_kref+0x7d4:   	stb	%l2, [%i2 + %i1]
	.word	0xe5865000	! t0_kref+0x7d8:   	lda	[%i1]0x80, %f18
	.word	0x87ab8026	! t0_kref+0x7dc:   	fmovsule	%fcc0, %f6, %f3
	.word	0x970d0012	! t0_kref+0x7e0:   	tsubcc	%l4, %l2, %o3
	.word	0x9614edbc	! t0_kref+0x7e4:   	or	%l3, 0xdbc, %o3
	.word	0x21480003	! t0_kref+0x7e8:   	fbn,a,pt	%fcc0, _kref+0x7f4
	.word	0x8db40f54	! t0_kref+0x7ec:   	fornot1	%f16, %f20, %f6
	.word	0x81ab0acc	! t0_kref+0x7f0:   	fcmped	%fcc0, %f12, %f12
	.word	0x9e552962	! t0_kref+0x7f4:   	umul	%l4, 0x962, %o7
	.word	0xd520a020	! t0_kref+0x7f8:   	st	%f10, [%g2 + 0x20]
	.word	0x99b00f29	! t0_kref+0x7fc:   	fsrc2s	%f9, %f12
	.word	0xe8280019	! t0_kref+0x800:   	stb	%l4, [%g0 + %i1]
	.word	0x39480004	! t0_kref+0x804:   	fbuge,a,pt	%fcc0, _kref+0x814
	.word	0xe4363fe0	! t0_kref+0x808:   	sth	%l2, [%i0 - 0x20]
	.word	0x8d84ecb7	! t0_kref+0x80c:   	wr	%l3, 0xcb7, %fprs
	.word	0xd288105a	! t0_kref+0x810:   	lduba	[%g0 + %i2]0x82, %o1
	.word	0x90750013	! t0_kref+0x814:   	udiv	%l4, %l3, %o0
	.word	0xa7a0108e	! t0_kref+0x818:   	fxtos	%f14, %f19
	.word	0xa1a018d2	! t0_kref+0x81c:   	fdtos	%f18, %f16
	.word	0xa9b18e16	! t0_kref+0x820:   	fand	%f6, %f22, %f20
	.word	0x001fffff	! t0_kref+0x824:   	illtrap	0x1fffff
	.word	0xec767fe0	! t0_kref+0x828:   	stx	%l6, [%i1 - 0x20]
	.word	0x8ba00524	! t0_kref+0x82c:   	fsqrts	%f4, %f5
	.word	0x99b40516	! t0_kref+0x830:   	fcmpgt16	%f16, %f22, %o4
	.word	0x90b54015	! t0_kref+0x834:   	orncc	%l5, %l5, %o0
	.word	0xea56c019	! t0_kref+0x838:   	ldsh	[%i3 + %i1], %l5
	.word	0x2c480005	! t0_kref+0x83c:   	bneg,a,pt	%icc, _kref+0x850
	.word	0x81850000	! t0_kref+0x840:   	wr	%l4, %g0, %y
	.word	0xee56401b	! t0_kref+0x844:   	ldsh	[%i1 + %i3], %l7
	.word	0xab3d2016	! t0_kref+0x848:   	sra	%l4, 0x16, %l5
	.word	0xd1f65013	! t0_kref+0x84c:   	casxa	[%i1]0x80, %l3, %o0
	.word	0x96e4a192	! t0_kref+0x850:   	subccc	%l2, 0x192, %o3
	.word	0xee0e001a	! t0_kref+0x854:   	ldub	[%i0 + %i2], %l7
	.word	0xe126001c	! t0_kref+0x858:   	st	%f16, [%i0 + %i4]
	.word	0x27480008	! t0_kref+0x85c:   	fbul,a,pt	%fcc0, _kref+0x87c
	.word	0xec267ff4	! t0_kref+0x860:   	st	%l6, [%i1 - 0xc]
	.word	0x81de6f78	! t0_kref+0x864:   	flush	%i1 + 0xf78
	.word	0x8fa00128	! t0_kref+0x868:   	fabss	%f8, %f7
	.word	0x93700013	! t0_kref+0x86c:   	popc	%l3, %o1
	.word	0xa9a0054e	! t0_kref+0x870:   	fsqrtd	%f14, %f20
	.word	0xa3b50352	! t0_kref+0x874:   	alignaddrl	%l4, %l2, %l1
	.word	0x80f48015	! t0_kref+0x878:   	udivcc	%l2, %l5, %g0
	.word	0x33480003	! t0_kref+0x87c:   	fbe,a,pt	%fcc0, _kref+0x888
	.word	0xa3a00529	! t0_kref+0x880:   	fsqrts	%f9, %f17
	.word	0xada508a6	! t0_kref+0x884:   	fsubs	%f20, %f6, %f22
	.word	0xdf066004	! t0_kref+0x888:   	ld	[%i1 + 4], %f15
	.word	0x94ad797e	! t0_kref+0x88c:   	andncc	%l5, -0x682, %o2
	.word	0xe4363ff2	! t0_kref+0x890:   	sth	%l2, [%i0 - 0xe]
	.word	0x91a24d24	! t0_kref+0x894:   	fsmuld	%f9, %f4, %f8
	.word	0x81348015	! t0_kref+0x898:   	srl	%l2, %l5, %g0
	.word	0xd408a011	! t0_kref+0x89c:   	ldub	[%g2 + 0x11], %o2
	.word	0x99400000	! t0_kref+0x8a0:   	mov	%y, %o4
	.word	0xa7b3cc70	! t0_kref+0x8a4:   	fnors	%f15, %f16, %f19
	.word	0xaba00526	! t0_kref+0x8a8:   	fsqrts	%f6, %f21
	.word	0x81854000	! t0_kref+0x8ac:   	wr	%l5, %g0, %y
	.word	0x86102003	! t0_kref+0x8b0:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x8b4:   	bne,a	_kref+0x8b4
	.word	0x86a0e001	! t0_kref+0x8b8:   	subcc	%g3, 1, %g3
	.word	0xda881018	! t0_kref+0x8bc:   	lduba	[%g0 + %i0]0x80, %o5
	.word	0xa814a135	! t0_kref+0x8c0:   	or	%l2, 0x135, %l4
	.word	0xd056c019	! t0_kref+0x8c4:   	ldsh	[%i3 + %i1], %o0
	.word	0x81ab0ab0	! t0_kref+0x8c8:   	fcmpes	%fcc0, %f12, %f16
	.word	0xae1cf8e9	! t0_kref+0x8cc:   	xor	%l3, -0x717, %l7
	.word	0xada00550	! t0_kref+0x8d0:   	fsqrtd	%f16, %f22
	.word	0xeaa81019	! t0_kref+0x8d4:   	stba	%l5, [%g0 + %i1]0x80
	.word	0xacf521ed	! t0_kref+0x8d8:   	udivcc	%l4, 0x1ed, %l6
	.word	0xa9b185d0	! t0_kref+0x8dc:   	fcmpeq32	%f6, %f16, %l4
	.word	0x963d6dd3	! t0_kref+0x8e0:   	xnor	%l5, 0xdd3, %o3
	.word	0x81ac4aa4	! t0_kref+0x8e4:   	fcmpes	%fcc0, %f17, %f4
	.word	0xa784e9d5	! t0_kref+0x8e8:   	wr	%l3, 0x9d5, %gsr
	.word	0xa8bc8014	! t0_kref+0x8ec:   	xnorcc	%l2, %l4, %l4
	.word	0x91b30556	! t0_kref+0x8f0:   	fcmpeq16	%f12, %f22, %o0
	.word	0xa83ca85f	! t0_kref+0x8f4:   	xnor	%l2, 0x85f, %l4
	.word	0xde56c018	! t0_kref+0x8f8:   	ldsh	[%i3 + %i0], %o7
	.word	0xc0ce501a	! t0_kref+0x8fc:   	ldsba	[%i1 + %i2]0x80, %g0
	.word	0xa8d58015	! t0_kref+0x900:   	umulcc	%l6, %l5, %l4
	.word	0xc398a040	! t0_kref+0x904:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0xc9070018	! t0_kref+0x908:   	ld	[%i4 + %i0], %f4
	.word	0xa1a28854	! t0_kref+0x90c:   	faddd	%f10, %f20, %f16
	.word	0xada0052e	! t0_kref+0x910:   	fsqrts	%f14, %f22
	.word	0x95b1896d	! t0_kref+0x914:   	fpmerge	%f6, %f13, %f10
	.word	0x9a7d6d6f	! t0_kref+0x918:   	sdiv	%l5, 0xd6f, %o5
	.word	0xa1b50355	! t0_kref+0x91c:   	alignaddrl	%l4, %l5, %l0
	.word	0xabb00c20	! t0_kref+0x920:   	fzeros	%f21
	.word	0x9a458015	! t0_kref+0x924:   	addc	%l6, %l5, %o5
	.word	0xee881018	! t0_kref+0x928:   	lduba	[%g0 + %i0]0x80, %l7
	.word	0x8da2084c	! t0_kref+0x92c:   	faddd	%f8, %f12, %f6
	.word	0xc3ee5014	! t0_kref+0x930:   	prefetcha	%i1 + %l4, 1
	sethi	%hi(2f), %o7
	.word	0xe40be158	! t0_kref+0x938:   	ldub	[%o7 + 0x158], %l2
	.word	0xa41ca00c	! t0_kref+0x93c:   	xor	%l2, 0xc, %l2
	.word	0xe42be158	! t0_kref+0x940:   	stb	%l2, [%o7 + 0x158]
	.word	0x81dbe158	! t0_kref+0x944:   	flush	%o7 + 0x158
	.word	0xc398a040	! t0_kref+0x948:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0x81aa4aa7	! t0_kref+0x94c:   	fcmpes	%fcc0, %f9, %f7
	.word	0xc398a040	! t0_kref+0x950:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0x85a509d6	! t0_kref+0x954:   	fdivd	%f20, %f22, %f2
2:	.word	0x921d23b7	! t0_kref+0x958:   	xor	%l4, 0x3b7, %o1
	.word	0xc3ee5016	! t0_kref+0x95c:   	prefetcha	%i1 + %l6, 1
	.word	0x8143c000	! t0_kref+0x960:   	stbar
	.word	0xeb060000	! t0_kref+0x964:   	ld	[%i0], %f21
	.word	0x34480002	! t0_kref+0x968:   	bg,a,pt	%icc, _kref+0x970
	.word	0xa3b28508	! t0_kref+0x96c:   	fcmpgt16	%f10, %f8, %l1
	.word	0x809d4015	! t0_kref+0x970:   	xorcc	%l5, %l5, %g0
	.word	0xe820a000	! t0_kref+0x974:   	st	%l4, [%g2]
	.word	0xa784b6b8	! t0_kref+0x978:   	wr	%l2, 0xfffff6b8, %gsr
	.word	0xe3b8a080	! t0_kref+0x97c:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x99b00cca	! t0_kref+0x980:   	fnot2	%f10, %f12
	.word	0xe49e5000	! t0_kref+0x984:   	ldda	[%i1]0x80, %l2
	.word	0x99a00550	! t0_kref+0x988:   	fsqrtd	%f16, %f12
	.word	0xa9b00fc0	! t0_kref+0x98c:   	fone	%f20
	.word	0x89a408cc	! t0_kref+0x990:   	fsubd	%f16, %f12, %f4
	.word	0x81dd3346	! t0_kref+0x994:   	flush	%l4 - 0xcba
	.word	0xc768a108	! t0_kref+0x998:   	prefetch	%g2 + 0x108, 3
	.word	0x89b3cc74	! t0_kref+0x99c:   	fnors	%f15, %f20, %f4
	.word	0x8143c000	! t0_kref+0x9a0:   	stbar
	.word	0xc398a040	! t0_kref+0x9a4:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0xaba349a9	! t0_kref+0x9a8:   	fdivs	%f13, %f9, %f21
	.word	0x81a94a27	! t0_kref+0x9ac:   	fcmps	%fcc0, %f5, %f7
	.word	0xa5a308d4	! t0_kref+0x9b0:   	fsubd	%f12, %f20, %f18
	.word	0x3b480004	! t0_kref+0x9b4:   	fble,a,pt	%fcc0, _kref+0x9c4
	.word	0x92ad6a50	! t0_kref+0x9b8:   	andncc	%l5, 0xa50, %o1
	.word	0x9e548016	! t0_kref+0x9bc:   	umul	%l2, %l6, %o7
	.word	0x9715bbc1	! t0_kref+0x9c0:   	taddcctv	%l6, -0x43f, %o3
	.word	0xac1c8015	! t0_kref+0x9c4:   	xor	%l2, %l5, %l6
	.word	0x949d0012	! t0_kref+0x9c8:   	xorcc	%l4, %l2, %o2
	.word	0x8db30e06	! t0_kref+0x9cc:   	fand	%f12, %f6, %f6
	.word	0x81b48095	! t0_kref+0x9d0:   	edge16	%l2, %l5, %g0
	sethi	%hi(2f), %o7
	.word	0xe40be210	! t0_kref+0x9d8:   	ldub	[%o7 + 0x210], %l2
	.word	0xa41ca00c	! t0_kref+0x9dc:   	xor	%l2, 0xc, %l2
	.word	0xe42be210	! t0_kref+0x9e0:   	stb	%l2, [%o7 + 0x210]
	.word	0x81dbe210	! t0_kref+0x9e4:   	flush	%o7 + 0x210
	.word	0x93b50154	! t0_kref+0x9e8:   	edge32l	%l4, %l4, %o1
	.word	0xac24c016	! t0_kref+0x9ec:   	sub	%l3, %l6, %l6
	.word	0x9b2cc015	! t0_kref+0x9f0:   	sll	%l3, %l5, %o5
	.word	0x81ab4a32	! t0_kref+0x9f4:   	fcmps	%fcc0, %f13, %f18
	.word	0x98648012	! t0_kref+0x9f8:   	subc	%l2, %l2, %o4
	.word	0xe51e2018	! t0_kref+0x9fc:   	ldd	[%i0 + 0x18], %f18
	.word	0x908cc013	! t0_kref+0xa00:   	andcc	%l3, %l3, %o0
	.word	0xea7e7ff8	! t0_kref+0xa04:   	swap	[%i1 - 8], %l5
	.word	0x9e9c8012	! t0_kref+0xa08:   	xorcc	%l2, %l2, %o7
	.word	0x31480001	! t0_kref+0xa0c:   	fba,a,pt	%fcc0, _kref+0xa10
2:	.word	0xa1a018c6	! t0_kref+0xa10:   	fdtos	%f6, %f16
	.word	0xd320a000	! t0_kref+0xa14:   	st	%f9, [%g2]
	.word	0xef68a000	! t0_kref+0xa18:   	prefetch	%g2, 23
	.word	0xa9248015	! t0_kref+0xa1c:   	mulscc	%l2, %l5, %l4
	.word	0xa1b10e4e	! t0_kref+0xa20:   	fxnor	%f4, %f14, %f16
	.word	0x99b30c48	! t0_kref+0xa24:   	fnor	%f12, %f8, %f12
	.word	0x9da00548	! t0_kref+0xa28:   	fsqrtd	%f8, %f14
	.word	0x001fffff	! t0_kref+0xa2c:   	illtrap	0x1fffff
	.word	0x81dc7e86	! t0_kref+0xa30:   	flush	%l1 - 0x17a
	.word	0x81aa8a4a	! t0_kref+0xa34:   	fcmpd	%fcc0, %f10, %f10
	.word	0xa7b4c113	! t0_kref+0xa38:   	edge32	%l3, %l3, %l3
	.word	0x81ad8a26	! t0_kref+0xa3c:   	fcmps	%fcc0, %f22, %f6
	.word	0x9844ea64	! t0_kref+0xa40:   	addc	%l3, 0xa64, %o4
	.word	0x96f5617b	! t0_kref+0xa44:   	udivcc	%l5, 0x17b, %o3
	.word	0x9f3d4013	! t0_kref+0xa48:   	sra	%l5, %l3, %o7
	.word	0xa7b48172	! t0_kref+0xa4c:   	edge32ln	%l2, %l2, %l3
	.word	0x99a0054a	! t0_kref+0xa50:   	fsqrtd	%f10, %f12
	.word	0xa5a00542	! t0_kref+0xa54:   	fsqrtd	%f2, %f18
	.word	0x31800006	! t0_kref+0xa58:   	fba,a	_kref+0xa70
	.word	0x8184c000	! t0_kref+0xa5c:   	wr	%l3, %g0, %y
	.word	0x977026bc	! t0_kref+0xa60:   	popc	0x6bc, %o3
	.word	0x8ba01a4a	! t0_kref+0xa64:   	fdtoi	%f10, %f5
	.word	0xa664c013	! t0_kref+0xa68:   	subc	%l3, %l3, %l3
	.word	0x8fa00526	! t0_kref+0xa6c:   	fsqrts	%f6, %f7
	.word	0x89a488c6	! t0_kref+0xa70:   	fsubd	%f18, %f6, %f4
	.word	0x89b00fc0	! t0_kref+0xa74:   	fone	%f4
	.word	0x85b486e8	! t0_kref+0xa78:   	fmul8ulx16	%f18, %f8, %f2
	call	SYM(t0_subr1)
	.word	0x9da0102b	! t0_kref+0xa80:   	fstox	%f11, %f14
	.word	0xa767c013	! t0_kref+0xa84:   	movvc	%icc, %l3, %l3
	.word	0x27480005	! t0_kref+0xa88:   	fbul,a,pt	%fcc0, _kref+0xa9c
	.word	0x9b2ca01a	! t0_kref+0xa8c:   	sll	%l2, 0x1a, %o5
	.word	0xa674adb5	! t0_kref+0xa90:   	udiv	%l2, 0xdb5, %l3
	.word	0xd1066008	! t0_kref+0xa94:   	ld	[%i1 + 8], %f8
	.word	0xea500019	! t0_kref+0xa98:   	ldsh	[%g0 + %i1], %l5
	.word	0xef68a000	! t0_kref+0xa9c:   	prefetch	%g2, 23
	.word	0xa3a00136	! t0_kref+0xaa0:   	fabss	%f22, %f17
	.word	0x96e58014	! t0_kref+0xaa4:   	subccc	%l6, %l4, %o3
	.word	0xea36c018	! t0_kref+0xaa8:   	sth	%l5, [%i3 + %i0]
	.word	0x85853dd8	! t0_kref+0xaac:   	wr	%l4, 0xfffffdd8, %ccr
	.word	0x81ac8aca	! t0_kref+0xab0:   	fcmped	%fcc0, %f18, %f10
	.word	0xa1a3882a	! t0_kref+0xab4:   	fadds	%f14, %f10, %f16
	.word	0xa7b00c20	! t0_kref+0xab8:   	fzeros	%f19
	.word	0x81ad8a48	! t0_kref+0xabc:   	fcmpd	%fcc0, %f22, %f8
	.word	0xa9a01052	! t0_kref+0xac0:   	fdtox	%f18, %f20
	.word	0x95b107c8	! t0_kref+0xac4:   	pdist	%f4, %f8, %f10
	.word	0x9a5c8013	! t0_kref+0xac8:   	smul	%l2, %l3, %o5
	.word	0xa5b1062e	! t0_kref+0xacc:   	fmul8x16	%f4, %f14, %f18
	.word	0x99b28e80	! t0_kref+0xad0:   	fsrc1	%f10, %f12
	.word	0x9db00768	! t0_kref+0xad4:   	fpack16	%f8, %f14
	.word	0x9eac8014	! t0_kref+0xad8:   	andncc	%l2, %l4, %o7
	.word	0x8fb00cf6	! t0_kref+0xadc:   	fnot2s	%f22, %f7
	.word	0x90548013	! t0_kref+0xae0:   	umul	%l2, %l3, %o0
	.word	0x96e520b0	! t0_kref+0xae4:   	subccc	%l4, 0xb0, %o3
	.word	0x91a508d2	! t0_kref+0xae8:   	fsubd	%f20, %f18, %f8
	.word	0x94158016	! t0_kref+0xaec:   	or	%l6, %l6, %o2
	.word	0x8bb34ca3	! t0_kref+0xaf0:   	fandnot2s	%f13, %f3, %f5
	.word	0x2b480007	! t0_kref+0xaf4:   	fbug,a,pt	%fcc0, _kref+0xb10
	.word	0xea26200c	! t0_kref+0xaf8:   	st	%l5, [%i0 + 0xc]
	.word	0x29480004	! t0_kref+0xafc:   	fbl,a,pt	%fcc0, _kref+0xb0c
	.word	0x9bb10446	! t0_kref+0xb00:   	fcmpne16	%f4, %f6, %o5
	.word	0x2e480007	! t0_kref+0xb04:   	bvs,a,pt	%icc, _kref+0xb20
	.word	0x905c8016	! t0_kref+0xb08:   	smul	%l2, %l6, %o0
	.word	0xad157004	! t0_kref+0xb0c:   	taddcctv	%l5, -0xffc, %l6
	.word	0x32800008	! t0_kref+0xb10:   	bne,a	_kref+0xb30
	.word	0xac8d8013	! t0_kref+0xb14:   	andcc	%l6, %l3, %l6
	.word	0xa6bd0014	! t0_kref+0xb18:   	xnorcc	%l4, %l4, %l3
	.word	0x21800005	! t0_kref+0xb1c:   	fbn,a	_kref+0xb30
	.word	0x9f0d373a	! t0_kref+0xb20:   	tsubcc	%l4, -0x8c6, %o7
	.word	0xecae9019	! t0_kref+0xb24:   	stba	%l6, [%i2 + %i1]0x80
	.word	0xa6550015	! t0_kref+0xb28:   	umul	%l4, %l5, %l3
	.word	0x9ba01a4e	! t0_kref+0xb2c:   	fdtoi	%f14, %f13
	.word	0xa5a01a44	! t0_kref+0xb30:   	fdtoi	%f4, %f18
	.word	0x81aa8a2d	! t0_kref+0xb34:   	fcmps	%fcc0, %f10, %f13
	.word	0x9e9d2139	! t0_kref+0xb38:   	xorcc	%l4, 0x139, %o7
	.word	0xe830a038	! t0_kref+0xb3c:   	sth	%l4, [%g2 + 0x38]
	.word	0xc398a040	! t0_kref+0xb40:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0xcf263ffc	! t0_kref+0xb44:   	st	%f7, [%i0 - 4]
	.word	0x91a18954	! t0_kref+0xb48:   	fmuld	%f6, %f20, %f8
	.word	0x21480002	! t0_kref+0xb4c:   	fbn,a,pt	%fcc0, _kref+0xb54
	.word	0x9db306ec	! t0_kref+0xb50:   	fmul8ulx16	%f12, %f12, %f14
	.word	0xe99f1a18	! t0_kref+0xb54:   	ldda	[%i4 + %i0]0xd0, %f20
	.word	0xec36c018	! t0_kref+0xb58:   	sth	%l6, [%i3 + %i0]
	.word	0x9db0c967	! t0_kref+0xb5c:   	fpmerge	%f3, %f7, %f14
	.word	0x98a58013	! t0_kref+0xb60:   	subcc	%l6, %l3, %o4
	.word	0x8143c000	! t0_kref+0xb64:   	stbar
	.word	0x92350012	! t0_kref+0xb68:   	orn	%l4, %l2, %o1
	.word	0xabb4caa8	! t0_kref+0xb6c:   	fpsub16s	%f19, %f8, %f21
	.word	0xe828a028	! t0_kref+0xb70:   	stb	%l4, [%g2 + 0x28]
	.word	0x31800003	! t0_kref+0xb74:   	fba,a	_kref+0xb80
	.word	0xc398a040	! t0_kref+0xb78:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0xe42e3ffb	! t0_kref+0xb7c:   	stb	%l2, [%i0 - 5]
	.word	0x8fa0012c	! t0_kref+0xb80:   	fabss	%f12, %f7
	.word	0x9fa018d6	! t0_kref+0xb84:   	fdtos	%f22, %f15
	.word	0xba103ff0	! t0_kref+0xb88:   	mov	0xfffffff0, %i5
	.word	0x99a0cd31	! t0_kref+0xb8c:   	fsmuld	%f3, %f17, %f12
	.word	0xe3b8a080	! t0_kref+0xb90:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x87a50828	! t0_kref+0xb94:   	fadds	%f20, %f8, %f3
	.word	0x8da2084a	! t0_kref+0xb98:   	faddd	%f8, %f10, %f6
	.word	0x81ab8aca	! t0_kref+0xb9c:   	fcmped	%fcc0, %f14, %f10
	.word	0x8184c000	! t0_kref+0xba0:   	wr	%l3, %g0, %y
	.word	0xeb68a10a	! t0_kref+0xba4:   	prefetch	%g2 + 0x10a, 21
	.word	0x89b20a4c	! t0_kref+0xba8:   	fpadd32	%f8, %f12, %f4
	.word	0x9da208d2	! t0_kref+0xbac:   	fsubd	%f8, %f18, %f14
	.word	0x99a00552	! t0_kref+0xbb0:   	fsqrtd	%f18, %f12
	.word	0x95b009b4	! t0_kref+0xbb4:   	fexpand	%f20, %f10
	.word	0xc398a040	! t0_kref+0xbb8:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0xa0158015	! t0_kref+0xbbc:   	or	%l6, %l5, %l0
	.word	0x99b58335	! t0_kref+0xbc0:   	bmask	%l6, %l5, %o4
	.word	0xe016001b	! t0_kref+0xbc4:   	lduh	[%i0 + %i3], %l0
	.word	0x89b24967	! t0_kref+0xbc8:   	fpmerge	%f9, %f7, %f4
	.word	0xc398a040	! t0_kref+0xbcc:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0xac752f70	! t0_kref+0xbd0:   	udiv	%l4, 0xf70, %l6
	.word	0x81aa0a28	! t0_kref+0xbd4:   	fcmps	%fcc0, %f8, %f8
	.word	0xdd270019	! t0_kref+0xbd8:   	st	%f14, [%i4 + %i1]
	.word	0x9eb5bc42	! t0_kref+0xbdc:   	orncc	%l6, -0x3be, %o7
	.word	0xec78a028	! t0_kref+0xbe0:   	swap	[%g2 + 0x28], %l6
	.word	0xd06e001a	! t0_kref+0xbe4:   	ldstub	[%i0 + %i2], %o0
	.word	0x2f1d24c9	! t0_kref+0xbe8:   	sethi	%hi(0x74932400), %l7
	.word	0xe248a033	! t0_kref+0xbec:   	ldsb	[%g2 + 0x33], %l1
	.word	0x9a3cc016	! t0_kref+0xbf0:   	xnor	%l3, %l6, %o5
	.word	0x3d800001	! t0_kref+0xbf4:   	fbule,a	_kref+0xbf8
	.word	0x8db20ad2	! t0_kref+0xbf8:   	fpsub32	%f8, %f18, %f6
	.word	0xc568a0ca	! t0_kref+0xbfc:   	prefetch	%g2 + 0xca, 2
	.word	0xa5b40f4a	! t0_kref+0xc00:   	fornot1	%f16, %f10, %f18
	.word	0x89b44628	! t0_kref+0xc04:   	fmul8x16	%f17, %f8, %f4
	.word	0xe49f5018	! t0_kref+0xc08:   	ldda	[%i5 + %i0]0x80, %l2
	.word	0xe3b8a080	! t0_kref+0xc0c:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x988d20c6	! t0_kref+0xc10:   	andcc	%l4, 0xc6, %o4
	.word	0x81aacaad	! t0_kref+0xc14:   	fcmpes	%fcc0, %f11, %f13
	.word	0x9a4566ba	! t0_kref+0xc18:   	addc	%l5, 0x6ba, %o5
	.word	0x97a01a44	! t0_kref+0xc1c:   	fdtoi	%f4, %f11
	.word	0xa655b552	! t0_kref+0xc20:   	umul	%l6, -0xaae, %l3
	.word	0xc1f65013	! t0_kref+0xc24:   	casxa	[%i1]0x80, %l3, %g0
	.word	0x81ac0a4e	! t0_kref+0xc28:   	fcmpd	%fcc0, %f16, %f14
	.word	0xcd063fe8	! t0_kref+0xc2c:   	ld	[%i0 - 0x18], %f6
	sethi	%hi(2f), %o7
	.word	0xe40be070	! t0_kref+0xc34:   	ldub	[%o7 + 0x70], %l2
	.word	0xa41ca00c	! t0_kref+0xc38:   	xor	%l2, 0xc, %l2
	.word	0xe42be070	! t0_kref+0xc3c:   	stb	%l2, [%o7 + 0x70]
	.word	0x81dbe070	! t0_kref+0xc40:   	flush	%o7 + 0x70
	.word	0x81254012	! t0_kref+0xc44:   	mulscc	%l5, %l2, %g0
	.word	0xe4981019	! t0_kref+0xc48:   	ldda	[%g0 + %i1]0x80, %l2
	.word	0xa5400000	! t0_kref+0xc4c:   	mov	%y, %l2
	.word	0xa1a018d2	! t0_kref+0xc50:   	fdtos	%f18, %f16
	.word	0x95b1874c	! t0_kref+0xc54:   	fpack32	%f6, %f12, %f10
	.word	0x8da24d24	! t0_kref+0xc58:   	fsmuld	%f9, %f4, %f6
	.word	0x9414ba8c	! t0_kref+0xc5c:   	or	%l2, -0x574, %o2
	.word	0x89a108cc	! t0_kref+0xc60:   	fsubd	%f4, %f12, %f4
	.word	0xa845637f	! t0_kref+0xc64:   	addc	%l5, 0x37f, %l4
	.word	0x81a98a54	! t0_kref+0xc68:   	fcmpd	%fcc0, %f6, %f20
	.word	0xea200019	! t0_kref+0xc6c:   	st	%l5, [%g0 + %i1]
2:	.word	0xa12d4016	! t0_kref+0xc70:   	sll	%l5, %l6, %l0
	.word	0x9efc8014	! t0_kref+0xc74:   	sdivcc	%l2, %l4, %o7
	.word	0xec563ff6	! t0_kref+0xc78:   	ldsh	[%i0 - 0xa], %l6
	.word	0x81dac00e	! t0_kref+0xc7c:   	flush	%o3 + %sp
	.word	0xe3b8a080	! t0_kref+0xc80:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xa9a308c8	! t0_kref+0xc84:   	fsubd	%f12, %f8, %f20
	.word	0x95a4084c	! t0_kref+0xc88:   	faddd	%f16, %f12, %f10
	.word	0xe830a03a	! t0_kref+0xc8c:   	sth	%l4, [%g2 + 0x3a]
	.word	0xa81c8016	! t0_kref+0xc90:   	xor	%l2, %l6, %l4
	.word	0xe410a03a	! t0_kref+0xc94:   	lduh	[%g2 + 0x3a], %l2
	.word	0x9ba00130	! t0_kref+0xc98:   	fabss	%f16, %f13
	.word	0x32800004	! t0_kref+0xc9c:   	bne,a	_kref+0xcac
	.word	0xa5a208c4	! t0_kref+0xca0:   	fsubd	%f8, %f4, %f18
	.word	0x81848000	! t0_kref+0xca4:   	wr	%l2, %g0, %y
	.word	0xe620a038	! t0_kref+0xca8:   	st	%l3, [%g2 + 0x38]
	call	SYM(t0_subr0)
	.word	0xd03e4000	! t0_kref+0xcb0:   	std	%o0, [%i1]
	.word	0xabb28416	! t0_kref+0xcb4:   	fcmple16	%f10, %f22, %l5
	.word	0xa265312f	! t0_kref+0xcb8:   	subc	%l4, -0xed1, %l1
	.word	0x9fb30ae3	! t0_kref+0xcbc:   	fpsub32s	%f12, %f3, %f15
	.word	0x91b58012	! t0_kref+0xcc0:   	edge8	%l6, %l2, %o0
	.word	0x9fa389b4	! t0_kref+0xcc4:   	fdivs	%f14, %f20, %f15
	.word	0xe82e4000	! t0_kref+0xcc8:   	stb	%l4, [%i1]
	.word	0xec9e101d	! t0_kref+0xccc:   	ldda	[%i0 + %i5]0x80, %l6
	.word	0xa1a3c9a3	! t0_kref+0xcd0:   	fdivs	%f15, %f3, %f16
	.word	0x81854000	! t0_kref+0xcd4:   	wr	%l5, %g0, %y
	.word	0xa12d8015	! t0_kref+0xcd8:   	sll	%l6, %l5, %l0
	.word	0x8184c000	! t0_kref+0xcdc:   	wr	%l3, %g0, %y
	.word	0x89a488d4	! t0_kref+0xce0:   	fsubd	%f18, %f20, %f4
	.word	0xa4952147	! t0_kref+0xce4:   	orcc	%l4, 0x147, %l2
	.word	0xc7ee5013	! t0_kref+0xce8:   	prefetcha	%i1 + %l3, 3
	.word	0xed063fe8	! t0_kref+0xcec:   	ld	[%i0 - 0x18], %f22
	.word	0xe886501c	! t0_kref+0xcf0:   	lda	[%i1 + %i4]0x80, %l4
	.word	0x99a00056	! t0_kref+0xcf4:   	fmovd	%f22, %f12
	.word	0x23480004	! t0_kref+0xcf8:   	fbne,a,pt	%fcc0, _kref+0xd08
	.word	0xc398a040	! t0_kref+0xcfc:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0xec30a022	! t0_kref+0xd00:   	sth	%l6, [%g2 + 0x22]
	.word	0xe5063ff8	! t0_kref+0xd04:   	ld	[%i0 - 8], %f18
	.word	0xe82e601c	! t0_kref+0xd08:   	stb	%l4, [%i1 + 0x1c]
	.word	0x93b48076	! t0_kref+0xd0c:   	edge8ln	%l2, %l6, %o1
	.word	0xdd1e7fe8	! t0_kref+0xd10:   	ldd	[%i1 - 0x18], %f14
	.word	0xa5a84034	! t0_kref+0xd14:   	fmovsne	%fcc0, %f20, %f18
	.word	0xa9b54db6	! t0_kref+0xd18:   	fxors	%f21, %f22, %f20
	.word	0xa1b48a8a	! t0_kref+0xd1c:   	fpsub16	%f18, %f10, %f16
	.word	0xe520a010	! t0_kref+0xd20:   	st	%f18, [%g2 + 0x10]
	.word	0xcd1e2018	! t0_kref+0xd24:   	ldd	[%i0 + 0x18], %f6
	.word	0xec16401b	! t0_kref+0xd28:   	lduh	[%i1 + %i3], %l6
	.word	0xadb30f64	! t0_kref+0xd2c:   	fornot1s	%f12, %f4, %f22
	.word	0x8143c000	! t0_kref+0xd30:   	stbar
	.word	0xa7a01894	! t0_kref+0xd34:   	fitos	%f20, %f19
	.word	0xe3b8a080	! t0_kref+0xd38:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xa1b30510	! t0_kref+0xd3c:   	fcmpgt16	%f12, %f16, %l0
	.word	0x89a01932	! t0_kref+0xd40:   	fstod	%f18, %f4
	.word	0x81da6d01	! t0_kref+0xd44:   	flush	%o1 + 0xd01
	.word	0x87b10cb4	! t0_kref+0xd48:   	fandnot2s	%f4, %f20, %f3
	.word	0xc768a0c1	! t0_kref+0xd4c:   	prefetch	%g2 + 0xc1, 3
	.word	0xabb480b2	! t0_kref+0xd50:   	edge16n	%l2, %l2, %l5
	.word	0x9fb500d4	! t0_kref+0xd54:   	edge16l	%l4, %l4, %o7
	.word	0x83414000	! t0_kref+0xd58:   	mov	%pc, %g1
	.word	0x81de35d8	! t0_kref+0xd5c:   	flush	%i0 - 0xa28
	.word	0xd840a038	! t0_kref+0xd60:   	ldsw	[%g2 + 0x38], %o4
	.word	0x96b48016	! t0_kref+0xd64:   	orncc	%l2, %l6, %o3
	.word	0x9b3ce01f	! t0_kref+0xd68:   	sra	%l3, 0x1f, %o5
	.word	0x8da00528	! t0_kref+0xd6c:   	fsqrts	%f8, %f6
	.word	0xc9260000	! t0_kref+0xd70:   	st	%f4, [%i0]
	.word	0xe42e8018	! t0_kref+0xd74:   	stb	%l2, [%i2 + %i0]
	.word	0x97a00526	! t0_kref+0xd78:   	fsqrts	%f6, %f11
	.word	0xe656c018	! t0_kref+0xd7c:   	ldsh	[%i3 + %i0], %l3
	.word	0xa1a00548	! t0_kref+0xd80:   	fsqrtd	%f8, %f16
	.word	0x8fa01a46	! t0_kref+0xd84:   	fdtoi	%f6, %f7
	.word	0xac5c8012	! t0_kref+0xd88:   	smul	%l2, %l2, %l6
	.word	0xe430a020	! t0_kref+0xd8c:   	sth	%l2, [%g2 + 0x20]
	.word	0xe08e9059	! t0_kref+0xd90:   	lduba	[%i2 + %i1]0x82, %l0
	.word	0x9ba0052d	! t0_kref+0xd94:   	fsqrts	%f13, %f13
	.word	0xba103fe8	! t0_kref+0xd98:   	mov	0xffffffe8, %i5
	.word	0x95b34df2	! t0_kref+0xd9c:   	fnands	%f13, %f18, %f10
	.word	0x3f480007	! t0_kref+0xda0:   	fbo,a,pt	%fcc0, _kref+0xdbc
	.word	0xaee58016	! t0_kref+0xda4:   	subccc	%l6, %l6, %l7
	.word	0x38480001	! t0_kref+0xda8:   	bgu,a,pt	%icc, _kref+0xdac
	.word	0xc398a040	! t0_kref+0xdac:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0x91056c48	! t0_kref+0xdb0:   	taddcc	%l5, 0xc48, %o0
	.word	0xf9ee101c	! t0_kref+0xdb4:   	prefetcha	%i0 + %i4, 28
	.word	0x99a18952	! t0_kref+0xdb8:   	fmuld	%f6, %f18, %f12
	.word	0xaa250016	! t0_kref+0xdbc:   	sub	%l4, %l6, %l5
	.word	0x86102004	! t0_kref+0xdc0:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0xdc4:   	bne,a	_kref+0xdc4
	.word	0x86a0e001	! t0_kref+0xdc8:   	subcc	%g3, 1, %g3
	.word	0x8dabc04a	! t0_kref+0xdcc:   	fmovdo	%fcc0, %f10, %f6
	.word	0xa61db30c	! t0_kref+0xdd0:   	xor	%l6, -0xcf4, %l3
	.word	0xa3b4c354	! t0_kref+0xdd4:   	alignaddrl	%l3, %l4, %l1
	.word	0xe0865000	! t0_kref+0xdd8:   	lda	[%i1]0x80, %l0
	.word	0xe3b8a080	! t0_kref+0xddc:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xe3e65016	! t0_kref+0xde0:   	casa	[%i1]0x80, %l6, %l1
	.word	0x81b4c154	! t0_kref+0xde4:   	edge32l	%l3, %l4, %g0
	.word	0x81dee61a	! t0_kref+0xde8:   	flush	%i3 + 0x61a
	.word	0x38480001	! t0_kref+0xdec:   	bgu,a,pt	%icc, _kref+0xdf0
	.word	0xaba01a34	! t0_kref+0xdf0:   	fstoi	%f20, %f21
	.word	0x91b580f3	! t0_kref+0xdf4:   	edge16ln	%l6, %l3, %o0
	.word	0x81d87bc8	! t0_kref+0xdf8:   	flush	%g1 - 0x438
	.word	0xe3ee501b	! t0_kref+0xdfc:   	prefetcha	%i1 + %i3, 17
	.word	0x8da508c8	! t0_kref+0xe00:   	fsubd	%f20, %f8, %f6
	.word	0x91a01909	! t0_kref+0xe04:   	fitod	%f9, %f8
	.word	0x81a88a52	! t0_kref+0xe08:   	fcmpd	%fcc0, %f2, %f18
	.word	0xaa14a5c6	! t0_kref+0xe0c:   	or	%l2, 0x5c6, %l5
	.word	0x99a00531	! t0_kref+0xe10:   	fsqrts	%f17, %f12
	.word	0xa9b009a6	! t0_kref+0xe14:   	fexpand	%f6, %f20
	.word	0xaa558016	! t0_kref+0xe18:   	umul	%l6, %l6, %l5
	.word	0x9e34e1a4	! t0_kref+0xe1c:   	orn	%l3, 0x1a4, %o7
	.word	0x8da018d6	! t0_kref+0xe20:   	fdtos	%f22, %f6
	.word	0xd59e5000	! t0_kref+0xe24:   	ldda	[%i1]0x80, %f10
	.word	0x85b58e06	! t0_kref+0xe28:   	fand	%f22, %f6, %f2
	.word	0xed68a002	! t0_kref+0xe2c:   	prefetch	%g2 + 2, 22
	.word	0x92acae47	! t0_kref+0xe30:   	andncc	%l2, 0xe47, %o1
	.word	0xe1be5a1c	! t0_kref+0xe34:   	stda	%f16, [%i1 + %i4]0xd0
	.word	0x9fc00004	! t0_kref+0xe38:   	call	%g0 + %g4
	.word	0xd7f61016	! t0_kref+0xe3c:   	casxa	[%i0]0x80, %l6, %o3
	.word	0xe3e65016	! t0_kref+0xe40:   	casa	[%i1]0x80, %l6, %l1
	.word	0x8143c000	! t0_kref+0xe44:   	stbar
	.word	0x801d8016	! t0_kref+0xe48:   	xor	%l6, %l6, %g0
	.word	0x8d858015	! t0_kref+0xe4c:   	wr	%l6, %l5, %fprs
	.word	0xd40e3fe0	! t0_kref+0xe50:   	ldub	[%i0 - 0x20], %o2
	.word	0x99a388d4	! t0_kref+0xe54:   	fsubd	%f14, %f20, %f12
	.word	0xa88d6f43	! t0_kref+0xe58:   	andcc	%l5, 0xf43, %l4
	.word	0x9db1096a	! t0_kref+0xe5c:   	fpmerge	%f4, %f10, %f14
	.word	0x812c8016	! t0_kref+0xe60:   	sll	%l2, %l6, %g0
	.word	0xa62cff84	! t0_kref+0xe64:   	andn	%l3, -0x7c, %l3
	.word	0xe420a010	! t0_kref+0xe68:   	st	%l2, [%g2 + 0x10]
	.word	0x81ab0aca	! t0_kref+0xe6c:   	fcmped	%fcc0, %f12, %f10
	.word	0xe8280018	! t0_kref+0xe70:   	stb	%l4, [%g0 + %i0]
	.word	0x8143c000	! t0_kref+0xe74:   	stbar
	.word	0x81a9ca32	! t0_kref+0xe78:   	fcmps	%fcc0, %f7, %f18
	.word	0xaf400000	! t0_kref+0xe7c:   	mov	%y, %l7
	.word	0x21800003	! t0_kref+0xe80:   	fbn,a	_kref+0xe8c
	.word	0x95354016	! t0_kref+0xe84:   	srl	%l5, %l6, %o2
	.word	0x989daad3	! t0_kref+0xe88:   	xorcc	%l6, 0xad3, %o4
	.word	0x81d9329b	! t0_kref+0xe8c:   	flush	%g4 - 0xd65
	.word	0x81850000	! t0_kref+0xe90:   	wr	%l4, %g0, %y
	.word	0xa9a00552	! t0_kref+0xe94:   	fsqrtd	%f18, %f20
	.word	0x8ba28926	! t0_kref+0xe98:   	fmuls	%f10, %f6, %f5
	.word	0xebee101b	! t0_kref+0xe9c:   	prefetcha	%i0 + %i3, 21
	.word	0x9de3bfa0	! t0_kref+0xea0:   	save	%sp, -0x60, %sp
	.word	0xa3ee6f43	! t0_kref+0xea4:   	restore	%i1, 0xf43, %l1
	.word	0x97a48828	! t0_kref+0xea8:   	fadds	%f18, %f8, %f11
	.word	0x9da489aa	! t0_kref+0xeac:   	fdivs	%f18, %f10, %f14
	.word	0xadb3cdaf	! t0_kref+0xeb0:   	fxors	%f15, %f15, %f22
	.word	0xa3a01a54	! t0_kref+0xeb4:   	fdtoi	%f20, %f17
	.word	0xe40861a4	! t0_kref+0xeb8:   	ldub	[%g1 + 0x1a4], %l2
	.word	0xa41ca00c	! t0_kref+0xebc:   	xor	%l2, 0xc, %l2
	.word	0xe42861a4	! t0_kref+0xec0:   	stb	%l2, [%g1 + 0x1a4]
	.word	0x81d861a4	! t0_kref+0xec4:   	flush	%g1 + 0x1a4
	.word	0x81b28490	! t0_kref+0xec8:   	fcmple32	%f10, %f16, %g0
	.word	0xa7b00c20	! t0_kref+0xecc:   	fzeros	%f19
	.word	0x89a00156	! t0_kref+0xed0:   	fabsd	%f22, %f4
	.word	0x33480007	! t0_kref+0xed4:   	fbe,a,pt	%fcc0, _kref+0xef0
	.word	0x97b50aed	! t0_kref+0xed8:   	fpsub32s	%f20, %f13, %f11
	.word	0xa6154014	! t0_kref+0xedc:   	or	%l5, %l4, %l3
	.word	0xae9cb831	! t0_kref+0xee0:   	xorcc	%l2, -0x7cf, %l7
	.word	0xa7a000ac	! t0_kref+0xee4:   	fnegs	%f12, %f19
	.word	0x91b48748	! t0_kref+0xee8:   	fpack32	%f18, %f8, %f8
	.word	0x8143c000	! t0_kref+0xeec:   	stbar
	.word	0xa9a34d30	! t0_kref+0xef0:   	fsmuld	%f13, %f16, %f20
	.word	0xada000b1	! t0_kref+0xef4:   	fnegs	%f17, %f22
	.word	0xd9a65000	! t0_kref+0xef8:   	sta	%f12, [%i1]0x80
2:	.word	0xa1b50590	! t0_kref+0xefc:   	fcmpgt32	%f20, %f16, %l0
	.word	0xe820a020	! t0_kref+0xf00:   	st	%l4, [%g2 + 0x20]
	.word	0x9da488d2	! t0_kref+0xf04:   	fsubd	%f18, %f18, %f14
	.word	0xe1be5853	! t0_kref+0xf08:   	stda	%f16, [%i1 + %l3]0xc2
	.word	0x2f800002	! t0_kref+0xf0c:   	fbu,a	_kref+0xf14
	.word	0x8da00534	! t0_kref+0xf10:   	fsqrts	%f20, %f6
	.word	0xa1b48096	! t0_kref+0xf14:   	edge16	%l2, %l6, %l0
	.word	0xa8a4ec09	! t0_kref+0xf18:   	subcc	%l3, 0xc09, %l4
	.word	0x9bb00f27	! t0_kref+0xf1c:   	fsrc2s	%f7, %f13
	.word	0xe5380018	! t0_kref+0xf20:   	std	%f18, [%g0 + %i0]
	.word	0x9ba018c6	! t0_kref+0xf24:   	fdtos	%f6, %f13
	.word	0x2e480008	! t0_kref+0xf28:   	bvs,a,pt	%icc, _kref+0xf48
	.word	0xa1b00cd2	! t0_kref+0xf2c:   	fnot2	%f18, %f16
	.word	0xe4b01019	! t0_kref+0xf30:   	stha	%l2, [%g0 + %i1]0x80
	.word	0x8db50c48	! t0_kref+0xf34:   	fnor	%f20, %f8, %f6
	.word	0x81aa8a26	! t0_kref+0xf38:   	fcmps	%fcc0, %f10, %f6
	.word	0xc398a040	! t0_kref+0xf3c:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0xa9a00548	! t0_kref+0xf40:   	fsqrtd	%f8, %f20
	.word	0x8db38971	! t0_kref+0xf44:   	fpmerge	%f14, %f17, %f6
	.word	0x89b08f42	! t0_kref+0xf48:   	fornot1	%f2, %f2, %f4
	.word	0x81ac0a33	! t0_kref+0xf4c:   	fcmps	%fcc0, %f16, %f19
	.word	0x81d84004	! t0_kref+0xf50:   	flush	%g1 + %g4
	.word	0x917021ff	! t0_kref+0xf54:   	popc	0x1ff, %o0
	.word	0xaa14e2dd	! t0_kref+0xf58:   	or	%l3, 0x2dd, %l5
	.word	0x9ba01a31	! t0_kref+0xf5c:   	fstoi	%f17, %f13
	.word	0x9e24e9e7	! t0_kref+0xf60:   	sub	%l3, 0x9e7, %o7
	.word	0xd9be1814	! t0_kref+0xf64:   	stda	%f12, [%i0 + %l4]0xc0
	.word	0x932ce018	! t0_kref+0xf68:   	sll	%l3, 0x18, %o1
	.word	0x808ce8cc	! t0_kref+0xf6c:   	btst	0x8cc, %l3
	.word	0xa624c012	! t0_kref+0xf70:   	sub	%l3, %l2, %l3
	.word	0x81580000	! t0_kref+0xf74:   	flushw
	call	SYM(t0_subr0)
	.word	0xa01c8013	! t0_kref+0xf7c:   	xor	%l2, %l3, %l0
	.word	0x9b400000	! t0_kref+0xf80:   	mov	%y, %o5
	.word	0x9db00f30	! t0_kref+0xf84:   	fsrc2s	%f16, %f14
	.word	0xa1b50316	! t0_kref+0xf88:   	alignaddr	%l4, %l6, %l0
	.word	0xa1a00135	! t0_kref+0xf8c:   	fabss	%f21, %f16
	.word	0xe5267fe4	! t0_kref+0xf90:   	st	%f18, [%i1 - 0x1c]
	.word	0xec280018	! t0_kref+0xf94:   	stb	%l6, [%g0 + %i0]
	.word	0xa0448014	! t0_kref+0xf98:   	addc	%l2, %l4, %l0
	.word	0xe408626c	! t0_kref+0xf9c:   	ldub	[%g1 + 0x26c], %l2
	.word	0xa41ca00c	! t0_kref+0xfa0:   	xor	%l2, 0xc, %l2
	.word	0xe428626c	! t0_kref+0xfa4:   	stb	%l2, [%g1 + 0x26c]
	.word	0x81d8626c	! t0_kref+0xfa8:   	flush	%g1 + 0x26c
	.word	0xe3b8a080	! t0_kref+0xfac:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x80ad4014	! t0_kref+0xfb0:   	andncc	%l5, %l4, %g0
	.word	0xa1a0192d	! t0_kref+0xfb4:   	fstod	%f13, %f16
	.word	0x9da588c2	! t0_kref+0xfb8:   	fsubd	%f22, %f2, %f14
	.word	0x9ead3adb	! t0_kref+0xfbc:   	andncc	%l4, -0x525, %o7
	.word	0x9a9da061	! t0_kref+0xfc0:   	xorcc	%l6, 0x61, %o5
2:	.word	0xe8881019	! t0_kref+0xfc4:   	lduba	[%g0 + %i1]0x80, %l4
	.word	0xfbee501b	! t0_kref+0xfc8:   	prefetcha	%i1 + %i3, 29
	.word	0x99a58d26	! t0_kref+0xfcc:   	fsmuld	%f22, %f6, %f12
	.word	0xea881019	! t0_kref+0xfd0:   	lduba	[%g0 + %i1]0x80, %l5
	.word	0xd5060000	! t0_kref+0xfd4:   	ld	[%i0], %f10
	.word	0x87a01a4a	! t0_kref+0xfd8:   	fdtoi	%f10, %f3
	.word	0xcb20a038	! t0_kref+0xfdc:   	st	%f5, [%g2 + 0x38]
	.word	0xa3a00125	! t0_kref+0xfe0:   	fabss	%f5, %f17
	.word	0xc7063ff0	! t0_kref+0xfe4:   	ld	[%i0 - 0x10], %f3
	.word	0xe40862a0	! t0_kref+0xfe8:   	ldub	[%g1 + 0x2a0], %l2
	.word	0xa41ca00c	! t0_kref+0xfec:   	xor	%l2, 0xc, %l2
	.word	0xe42862a0	! t0_kref+0xff0:   	stb	%l2, [%g1 + 0x2a0]
	.word	0x81d862a0	! t0_kref+0xff4:   	flush	%g1 + 0x2a0
2:	.word	0xa9a018c2	! t0_kref+0xff8:   	fdtos	%f2, %f20
	.word	0x95a58d2f	! t0_kref+0xffc:   	fsmuld	%f22, %f15, %f10
	.word	0xd44e401a	! t0_kref+0x1000:   	ldsb	[%i1 + %i2], %o2
	.word	0x36480002	! t0_kref+0x1004:   	bge,a,pt	%icc, _kref+0x100c
	.word	0x9da00550	! t0_kref+0x1008:   	fsqrtd	%f16, %f14
	.word	0x9da01930	! t0_kref+0x100c:   	fstod	%f16, %f14
	.word	0xd19e9a18	! t0_kref+0x1010:   	ldda	[%i2 + %i0]0xd0, %f8
	.word	0x9e65a3c3	! t0_kref+0x1014:   	subc	%l6, 0x3c3, %o7
	.word	0xa9408000	! t0_kref+0x1018:   	mov	%ccr, %l4
	.word	0x9de3bfa0	! t0_kref+0x101c:   	save	%sp, -0x60, %sp
	.word	0xb89f3c62	! t0_kref+0x1020:   	xorcc	%i4, -0x39e, %i4
	.word	0x97ef001d	! t0_kref+0x1024:   	restore	%i4, %i5, %o3
	.word	0xd4d65000	! t0_kref+0x1028:   	ldsha	[%i1]0x80, %o2
	.word	0xe7264000	! t0_kref+0x102c:   	st	%f19, [%i1]
	.word	0xc7060000	! t0_kref+0x1030:   	ld	[%i0], %f3
	.word	0x81ad0a46	! t0_kref+0x1034:   	fcmpd	%fcc0, %f20, %f6
	.word	0x81aa4a2f	! t0_kref+0x1038:   	fcmps	%fcc0, %f9, %f15
	.word	0x812d601a	! t0_kref+0x103c:   	sll	%l5, 0x1a, %g0
	.word	0x2d480007	! t0_kref+0x1040:   	fbg,a,pt	%fcc0, _kref+0x105c
	.word	0xa53d6016	! t0_kref+0x1044:   	sra	%l5, 0x16, %l2
	.word	0xa9a0054c	! t0_kref+0x1048:   	fsqrtd	%f12, %f20
	.word	0x9bb4c076	! t0_kref+0x104c:   	edge8ln	%l3, %l6, %o5
	.word	0xdf00a008	! t0_kref+0x1050:   	ld	[%g2 + 8], %f15
	.word	0xd650a030	! t0_kref+0x1054:   	ldsh	[%g2 + 0x30], %o3
	.word	0xcd20a018	! t0_kref+0x1058:   	st	%f6, [%g2 + 0x18]
	.word	0xe42e7ff6	! t0_kref+0x105c:   	stb	%l2, [%i1 - 0xa]
	.word	0xa3a4c82e	! t0_kref+0x1060:   	fadds	%f19, %f14, %f17
	.word	0xa0acc012	! t0_kref+0x1064:   	andncc	%l3, %l2, %l0
	.word	0xa7b58315	! t0_kref+0x1068:   	alignaddr	%l6, %l5, %l3
	.word	0x81850000	! t0_kref+0x106c:   	wr	%l4, %g0, %y
	.word	0x9da00525	! t0_kref+0x1070:   	fsqrts	%f5, %f14
	.word	0xe66e0000	! t0_kref+0x1074:   	ldstub	[%i0], %l3
	.word	0x95b4ca30	! t0_kref+0x1078:   	fpadd16s	%f19, %f16, %f10
	.word	0x95b50faf	! t0_kref+0x107c:   	fors	%f20, %f15, %f10
	.word	0xa5a0190c	! t0_kref+0x1080:   	fitod	%f12, %f18
	.word	0xa6548016	! t0_kref+0x1084:   	umul	%l2, %l6, %l3
	.word	0xe82e401a	! t0_kref+0x1088:   	stb	%l4, [%i1 + %i2]
	.word	0x9da01908	! t0_kref+0x108c:   	fitod	%f8, %f14
	.word	0xd6167fec	! t0_kref+0x1090:   	lduh	[%i1 - 0x14], %o3
	.word	0xa7a8002e	! t0_kref+0x1094:   	fmovsn	%fcc0, %f14, %f19
	.word	0x86102005	! t0_kref+0x1098:   	mov	0x5, %g3
	.word	0x86a0e001	! t0_kref+0x109c:   	subcc	%g3, 1, %g3
	.word	0x22800004	! t0_kref+0x10a0:   	be,a	_kref+0x10b0
	.word	0xe0e81018	! t0_kref+0x10a4:   	ldstuba	[%g0 + %i0]0x80, %l0
	.word	0x927d288b	! t0_kref+0x10a8:   	sdiv	%l4, 0x88b, %o1
	.word	0xa9b104d4	! t0_kref+0x10ac:   	fcmpne32	%f4, %f20, %l4
	.word	0xc1f65015	! t0_kref+0x10b0:   	casxa	[%i1]0x80, %l5, %g0
	.word	0x8da40854	! t0_kref+0x10b4:   	faddd	%f16, %f20, %f6
	.word	0x81aa0aab	! t0_kref+0x10b8:   	fcmpes	%fcc0, %f8, %f11
	.word	0xec20a038	! t0_kref+0x10bc:   	st	%l6, [%g2 + 0x38]
	.word	0xe8366006	! t0_kref+0x10c0:   	sth	%l4, [%i1 + 6]
	.word	0xe82e6018	! t0_kref+0x10c4:   	stb	%l4, [%i1 + 0x18]
	.word	0xc398a040	! t0_kref+0x10c8:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0xa1a00528	! t0_kref+0x10cc:   	fsqrts	%f8, %f16
	.word	0xc398a040	! t0_kref+0x10d0:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0x39480001	! t0_kref+0x10d4:   	fbuge,a,pt	%fcc0, _kref+0x10d8
	.word	0x9e25740d	! t0_kref+0x10d8:   	sub	%l5, -0xbf3, %o7
	.word	0x8da01909	! t0_kref+0x10dc:   	fitod	%f9, %f6
	.word	0xde48a000	! t0_kref+0x10e0:   	ldsb	[%g2], %o7
	.word	0x96258014	! t0_kref+0x10e4:   	sub	%l6, %l4, %o3
	.word	0xa72da00c	! t0_kref+0x10e8:   	sll	%l6, 0xc, %l3
	.word	0xe9beda19	! t0_kref+0x10ec:   	stda	%f20, [%i3 + %i1]0xd0
	.word	0xe40863e0	! t0_kref+0x10f0:   	ldub	[%g1 + 0x3e0], %l2
	.word	0xa41ca00c	! t0_kref+0x10f4:   	xor	%l2, 0xc, %l2
	.word	0xe42863e0	! t0_kref+0x10f8:   	stb	%l2, [%g1 + 0x3e0]
	.word	0x81d863e0	! t0_kref+0x10fc:   	flush	%g1 + 0x3e0
	.word	0xa0ad4015	! t0_kref+0x1100:   	andncc	%l5, %l5, %l0
	.word	0xdf26200c	! t0_kref+0x1104:   	st	%f15, [%i0 + 0xc]
	.word	0x99a4c9ac	! t0_kref+0x1108:   	fdivs	%f19, %f12, %f12
	.word	0x24480003	! t0_kref+0x110c:   	ble,a,pt	%icc, _kref+0x1118
	.word	0xa7a0052a	! t0_kref+0x1110:   	fsqrts	%f10, %f19
	.word	0x95a3c92e	! t0_kref+0x1114:   	fmuls	%f15, %f14, %f10
	.word	0x87a01a44	! t0_kref+0x1118:   	fdtoi	%f4, %f3
	.word	0x908dab89	! t0_kref+0x111c:   	andcc	%l6, 0xb89, %o0
	.word	0xd1be5813	! t0_kref+0x1120:   	stda	%f8, [%i1 + %l3]0xc0
	.word	0x8ba0188a	! t0_kref+0x1124:   	fitos	%f10, %f5
	.word	0x91a0102d	! t0_kref+0x1128:   	fstox	%f13, %f8
	.word	0x96f4ee84	! t0_kref+0x112c:   	udivcc	%l3, 0xe84, %o3
	.word	0x97408000	! t0_kref+0x1130:   	mov	%ccr, %o3
	.word	0x89a00546	! t0_kref+0x1134:   	fsqrtd	%f6, %f4
2:	.word	0xd6ce1000	! t0_kref+0x1138:   	ldsba	[%i0]0x80, %o3
	.word	0xa9a10844	! t0_kref+0x113c:   	faddd	%f4, %f4, %f20
	.word	0xd4500018	! t0_kref+0x1140:   	ldsh	[%g0 + %i0], %o2
	.word	0xa9a01929	! t0_kref+0x1144:   	fstod	%f9, %f20
	.word	0x8143c000	! t0_kref+0x1148:   	stbar
	.word	0x38480008	! t0_kref+0x114c:   	bgu,a,pt	%icc, _kref+0x116c
	.word	0xa69d8012	! t0_kref+0x1150:   	xorcc	%l6, %l2, %l3
	.word	0x81ac4aa9	! t0_kref+0x1154:   	fcmpes	%fcc0, %f17, %f9
	.word	0x90748013	! t0_kref+0x1158:   	udiv	%l2, %l3, %o0
	.word	0x87a01886	! t0_kref+0x115c:   	fitos	%f6, %f3
	.word	0x33480005	! t0_kref+0x1160:   	fbe,a,pt	%fcc0, _kref+0x1174
	.word	0xe62e6001	! t0_kref+0x1164:   	stb	%l3, [%i1 + 1]
	.word	0x8d854015	! t0_kref+0x1168:   	wr	%l5, %l5, %fprs
	.word	0x29480006	! t0_kref+0x116c:   	fbl,a,pt	%fcc0, _kref+0x1184
	.word	0x91b50908	! t0_kref+0x1170:   	faligndata	%f20, %f8, %f8
	.word	0x98bdacfe	! t0_kref+0x1174:   	xnorcc	%l6, 0xcfe, %o4
	.word	0x2d480005	! t0_kref+0x1178:   	fbg,a,pt	%fcc0, _kref+0x118c
	.word	0x93a0c82a	! t0_kref+0x117c:   	fadds	%f3, %f10, %f9
	.word	0xe11e7ff0	! t0_kref+0x1180:   	ldd	[%i1 - 0x10], %f16
	.word	0x8ba01a32	! t0_kref+0x1184:   	fstoi	%f18, %f5
	.word	0xe056401b	! t0_kref+0x1188:   	ldsh	[%i1 + %i3], %l0
	.word	0x89a0002f	! t0_kref+0x118c:   	fmovs	%f15, %f4
	.word	0x9ab54015	! t0_kref+0x1190:   	orncc	%l5, %l5, %o5
	.word	0x9de3bfa0	! t0_kref+0x1194:   	save	%sp, -0x60, %sp
	.word	0xa3ee401a	! t0_kref+0x1198:   	restore	%i1, %i2, %l1
	.word	0x8143e01a	! t0_kref+0x119c:   	membar	0x1a
	.word	0x91a48852	! t0_kref+0x11a0:   	faddd	%f18, %f18, %f8
	.word	0xd300a000	! t0_kref+0x11a4:   	ld	[%g2], %f9
	.word	0xd64e401a	! t0_kref+0x11a8:   	ldsb	[%i1 + %i2], %o3
	.word	0xa9a488c6	! t0_kref+0x11ac:   	fsubd	%f18, %f6, %f20
	.word	0x9e14b5fe	! t0_kref+0x11b0:   	or	%l2, -0xa02, %o7
	.word	0x8fa00532	! t0_kref+0x11b4:   	fsqrts	%f18, %f7
	.word	0xada2084e	! t0_kref+0x11b8:   	faddd	%f8, %f14, %f22
	.word	0x8610200b	! t0_kref+0x11bc:   	mov	0xb, %g3
	.word	0x86a0e001	! t0_kref+0x11c0:   	subcc	%g3, 1, %g3
	.word	0x22800001	! t0_kref+0x11c4:   	be,a	_kref+0x11c8
	.word	0xe168a08f	! t0_kref+0x11c8:   	prefetch	%g2 + 0x8f, 16
	.word	0xa0850012	! t0_kref+0x11cc:   	addcc	%l4, %l2, %l0
	.word	0x95a01a27	! t0_kref+0x11d0:   	fstoi	%f7, %f10
	.word	0x23480001	! t0_kref+0x11d4:   	fbne,a,pt	%fcc0, _kref+0x11d8
	.word	0x81dc3644	! t0_kref+0x11d8:   	flush	%l0 - 0x9bc
	.word	0x8da1c825	! t0_kref+0x11dc:   	fadds	%f7, %f5, %f6
	.word	0x8ba38823	! t0_kref+0x11e0:   	fadds	%f14, %f3, %f5
	.word	0xadb48352	! t0_kref+0x11e4:   	alignaddrl	%l2, %l2, %l6
	.word	0xafb20582	! t0_kref+0x11e8:   	fcmpgt32	%f8, %f2, %l7
	.word	0x9da84046	! t0_kref+0x11ec:   	fmovdne	%fcc0, %f6, %f14
	.word	0x81ab8a2c	! t0_kref+0x11f0:   	fcmps	%fcc0, %f14, %f12
	.word	0xe630a002	! t0_kref+0x11f4:   	sth	%l3, [%g2 + 2]
	.word	0xab702347	! t0_kref+0x11f8:   	popc	0x347, %l5
	.word	0x81a90a46	! t0_kref+0x11fc:   	fcmpd	%fcc0, %f4, %f6
	.word	0x93b14fad	! t0_kref+0x1200:   	fors	%f5, %f13, %f9
	.word	0x9bb2cc73	! t0_kref+0x1204:   	fnors	%f11, %f19, %f13
	.word	0x3c480005	! t0_kref+0x1208:   	bpos,a,pt	%icc, _kref+0x121c
	.word	0xa2054013	! t0_kref+0x120c:   	add	%l5, %l3, %l1
	.word	0x81858000	! t0_kref+0x1210:   	wr	%l6, %g0, %y
	.word	0x9b400000	! t0_kref+0x1214:   	mov	%y, %o5
	.word	0xeaee501a	! t0_kref+0x1218:   	ldstuba	[%i1 + %i2]0x80, %l5
	.word	0x8143c000	! t0_kref+0x121c:   	stbar
	.word	0x97a0052c	! t0_kref+0x1220:   	fsqrts	%f12, %f11
	.word	0x9fb0858c	! t0_kref+0x1224:   	fcmpgt32	%f2, %f12, %o7
	.word	0xe40864fc	! t0_kref+0x1228:   	ldub	[%g1 + 0x4fc], %l2
	.word	0xa41ca00c	! t0_kref+0x122c:   	xor	%l2, 0xc, %l2
	.word	0xe42864fc	! t0_kref+0x1230:   	stb	%l2, [%g1 + 0x4fc]
	.word	0x81d864fc	! t0_kref+0x1234:   	flush	%g1 + 0x4fc
	.word	0x9fa409b6	! t0_kref+0x1238:   	fdivs	%f16, %f22, %f15
	.word	0xe8a81018	! t0_kref+0x123c:   	stba	%l4, [%g0 + %i0]0x80
	.word	0xaab4c012	! t0_kref+0x1240:   	orncc	%l3, %l2, %l5
	.word	0xc398a040	! t0_kref+0x1244:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0xea767ff8	! t0_kref+0x1248:   	stx	%l5, [%i1 - 8]
	.word	0x99a0cd2f	! t0_kref+0x124c:   	fsmuld	%f3, %f15, %f12
	.word	0x81ac0aa3	! t0_kref+0x1250:   	fcmpes	%fcc0, %f16, %f3
2:	.word	0xa1b20d40	! t0_kref+0x1254:   	fnot1	%f8, %f16
	.word	0x8fa01a48	! t0_kref+0x1258:   	fdtoi	%f8, %f7
	.word	0xe720a010	! t0_kref+0x125c:   	st	%f19, [%g2 + 0x10]
	.word	0xa1b207ca	! t0_kref+0x1260:   	pdist	%f8, %f10, %f16
	.word	0xa68c8014	! t0_kref+0x1264:   	andcc	%l2, %l4, %l3
	.word	0xe48e501a	! t0_kref+0x1268:   	lduba	[%i1 + %i2]0x80, %l2
	.word	0xefee101c	! t0_kref+0x126c:   	prefetcha	%i0 + %i4, 23
	.word	0x813ca012	! t0_kref+0x1270:   	sra	%l2, 0x12, %g0
	.word	0x908db557	! t0_kref+0x1274:   	andcc	%l6, -0xaa9, %o0
	.word	0x86102004	! t0_kref+0x1278:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x127c:   	bne,a	_kref+0x127c
	.word	0x86a0e001	! t0_kref+0x1280:   	subcc	%g3, 1, %g3
	.word	0xe82e2016	! t0_kref+0x1284:   	stb	%l4, [%i0 + 0x16]
	.word	0xa89ce1f7	! t0_kref+0x1288:   	xorcc	%l3, 0x1f7, %l4
	.word	0x81b01027	! t0_kref+0x128c:   	siam	0x7
	.word	0x8fa01a4e	! t0_kref+0x1290:   	fdtoi	%f14, %f7
	.word	0xa1a409d4	! t0_kref+0x1294:   	fdivd	%f16, %f20, %f16
	.word	0x37480006	! t0_kref+0x1298:   	fbge,a,pt	%fcc0, _kref+0x12b0
	.word	0xf9ee501c	! t0_kref+0x129c:   	prefetcha	%i1 + %i4, 28
	call	SYM(t0_subr0)
	.word	0xa0f57f9b	! t0_kref+0x12a4:   	udivcc	%l5, -0x65, %l0
	.word	0x903d7857	! t0_kref+0x12a8:   	xnor	%l5, -0x7a9, %o0
	.word	0xabb485cc	! t0_kref+0x12ac:   	fcmpeq32	%f18, %f12, %l5
	.word	0xd0162010	! t0_kref+0x12b0:   	lduh	[%i0 + 0x10], %o0
	.word	0x95a018c8	! t0_kref+0x12b4:   	fdtos	%f8, %f10
	.word	0x81daeed7	! t0_kref+0x12b8:   	flush	%o3 + 0xed7
	.word	0x8184c000	! t0_kref+0x12bc:   	wr	%l3, %g0, %y
	.word	0xaa157b61	! t0_kref+0x12c0:   	or	%l5, -0x49f, %l5
	.word	0x92258014	! t0_kref+0x12c4:   	sub	%l6, %l4, %o1
	.word	0x87a01a24	! t0_kref+0x12c8:   	fstoi	%f4, %f3
	.word	0xa1b38450	! t0_kref+0x12cc:   	fcmpne16	%f14, %f16, %l0
	.word	0xe1266014	! t0_kref+0x12d0:   	st	%f16, [%i1 + 0x14]
	.word	0x8da00129	! t0_kref+0x12d4:   	fabss	%f9, %f6
	.word	0x2b480003	! t0_kref+0x12d8:   	fbug,a,pt	%fcc0, _kref+0x12e4
	.word	0xe1266014	! t0_kref+0x12dc:   	st	%f16, [%i1 + 0x14]
	.word	0xdd067ffc	! t0_kref+0x12e0:   	ld	[%i1 - 4], %f14
	.word	0x99b406a9	! t0_kref+0x12e4:   	fmul8x16al	%f16, %f9, %f12
	.word	0xdf20a028	! t0_kref+0x12e8:   	st	%f15, [%g2 + 0x28]
	.word	0x9614eb79	! t0_kref+0x12ec:   	or	%l3, 0xb79, %o3
	.word	0xd9e61016	! t0_kref+0x12f0:   	casa	[%i0]0x80, %l6, %o4
	.word	0xd51e3ff0	! t0_kref+0x12f4:   	ldd	[%i0 - 0x10], %f10
	.word	0xa5a00532	! t0_kref+0x12f8:   	fsqrts	%f18, %f18
	.word	0xa5b50486	! t0_kref+0x12fc:   	fcmple32	%f20, %f6, %l2
	.word	0x99b2c634	! t0_kref+0x1300:   	fmul8x16	%f11, %f20, %f12
	.word	0xa0154013	! t0_kref+0x1304:   	or	%l5, %l3, %l0
	.word	0xc398a040	! t0_kref+0x1308:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0xa7400000	! t0_kref+0x130c:   	mov	%y, %l3
	.word	0xd500a030	! t0_kref+0x1310:   	ld	[%g2 + 0x30], %f10
	.word	0x95b28a94	! t0_kref+0x1314:   	fpsub16	%f10, %f20, %f10
	.word	0x89a0004a	! t0_kref+0x1318:   	fmovd	%f10, %f4
	.word	0xafb284c4	! t0_kref+0x131c:   	fcmpne32	%f10, %f4, %l7
	.word	0xa5a308ca	! t0_kref+0x1320:   	fsubd	%f12, %f10, %f18
	.word	0xaa34c014	! t0_kref+0x1324:   	orn	%l3, %l4, %l5
	.word	0xa7b58414	! t0_kref+0x1328:   	fcmple16	%f22, %f20, %l3
	.word	0x31800001	! t0_kref+0x132c:   	fba,a	_kref+0x1330
	.word	0xf1ee501a	! t0_kref+0x1330:   	prefetcha	%i1 + %i2, 24
	.word	0x9fb58333	! t0_kref+0x1334:   	bmask	%l6, %l3, %o7
	.word	0xf207bfe0	! t0_kref+0x1338:   	ld	[%fp - 0x20], %i1
	.word	0xdb20a028	! t0_kref+0x133c:   	st	%f13, [%g2 + 0x28]
	.word	0xe0566012	! t0_kref+0x1340:   	ldsh	[%i1 + 0x12], %l0
	.word	0x99b4c315	! t0_kref+0x1344:   	alignaddr	%l3, %l5, %o4
	.word	0x91256e01	! t0_kref+0x1348:   	mulscc	%l5, 0xe01, %o0
	.word	0xde0e7fe2	! t0_kref+0x134c:   	ldub	[%i1 - 0x1e], %o7
	.word	0xdf063ffc	! t0_kref+0x1350:   	ld	[%i0 - 4], %f15
	.word	0xd65e2010	! t0_kref+0x1354:   	ldx	[%i0 + 0x10], %o3
	.word	0x81d8000b	! t0_kref+0x1358:   	flush	%g0 + %o3
	.word	0x99a01a4c	! t0_kref+0x135c:   	fdtoi	%f12, %f12
	.word	0xa9a00546	! t0_kref+0x1360:   	fsqrtd	%f6, %f20
	.word	0xa1a01a4e	! t0_kref+0x1364:   	fdtoi	%f14, %f16
	.word	0xadb0cfaf	! t0_kref+0x1368:   	fors	%f3, %f15, %f22
	.word	0x81df8016	! t0_kref+0x136c:   	flush	%fp + %l6
	.word	0x93a00536	! t0_kref+0x1370:   	fsqrts	%f22, %f9
	.word	0x9da0c824	! t0_kref+0x1374:   	fadds	%f3, %f4, %f14
	.word	0xa9b1496e	! t0_kref+0x1378:   	fpmerge	%f5, %f14, %f20
	.word	0x803da845	! t0_kref+0x137c:   	xnor	%l6, 0x845, %g0
	.word	0x8143c000	! t0_kref+0x1380:   	stbar
	.word	0xe8467fe8	! t0_kref+0x1384:   	ldsw	[%i1 - 0x18], %l4
	.word	0xa1a00548	! t0_kref+0x1388:   	fsqrtd	%f8, %f16
	.word	0xd100a028	! t0_kref+0x138c:   	ld	[%g2 + 0x28], %f8
	.word	0x90654014	! t0_kref+0x1390:   	subc	%l5, %l4, %o0
	.word	0x81aa8a35	! t0_kref+0x1394:   	fcmps	%fcc0, %f10, %f21
	.word	0x38480004	! t0_kref+0x1398:   	bgu,a,pt	%icc, _kref+0x13a8
	.word	0xa9a50d2e	! t0_kref+0x139c:   	fsmuld	%f20, %f14, %f20
	.word	0x2d480005	! t0_kref+0x13a0:   	fbg,a,pt	%fcc0, _kref+0x13b4
	.word	0xa1b306e8	! t0_kref+0x13a4:   	fmul8ulx16	%f12, %f8, %f16
	.word	0x8143c000	! t0_kref+0x13a8:   	stbar
	.word	0xe820a020	! t0_kref+0x13ac:   	st	%l4, [%g2 + 0x20]
	.word	0xc398a040	! t0_kref+0x13b0:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0xdb06001c	! t0_kref+0x13b4:   	ld	[%i0 + %i4], %f13
	.word	0x81db3b14	! t0_kref+0x13b8:   	flush	%o4 - 0x4ec
	.word	0x81ac0aa3	! t0_kref+0x13bc:   	fcmpes	%fcc0, %f16, %f3
	.word	0x9a15b633	! t0_kref+0x13c0:   	or	%l6, -0x9cd, %o5
	.word	0x85852ec2	! t0_kref+0x13c4:   	wr	%l4, 0xec2, %ccr
	.word	0xec180019	! t0_kref+0x13c8:   	ldd	[%g0 + %i1], %l6
	.word	0x8024c015	! t0_kref+0x13cc:   	sub	%l3, %l5, %g0
	.word	0xada00529	! t0_kref+0x13d0:   	fsqrts	%f9, %f22
	call	SYM(t0_subr2)
	.word	0x961d8014	! t0_kref+0x13d8:   	xor	%l6, %l4, %o3
	.word	0x95a00534	! t0_kref+0x13dc:   	fsqrts	%f20, %f10
	.word	0x8da01a54	! t0_kref+0x13e0:   	fdtoi	%f20, %f6
	.word	0x9da0192e	! t0_kref+0x13e4:   	fstod	%f14, %f14
	.word	0xe820a030	! t0_kref+0x13e8:   	st	%l4, [%g2 + 0x30]
	.word	0x9efd4013	! t0_kref+0x13ec:   	sdivcc	%l5, %l3, %o7
	.word	0xa1a01a4e	! t0_kref+0x13f0:   	fdtoi	%f14, %f16
	.word	0xe8480019	! t0_kref+0x13f4:   	ldsb	[%g0 + %i1], %l4
	.word	0x85a188c6	! t0_kref+0x13f8:   	fsubd	%f6, %f6, %f2
	.word	0xe5000018	! t0_kref+0x13fc:   	ld	[%g0 + %i0], %f18
	.word	0x9615b9e2	! t0_kref+0x1400:   	or	%l6, -0x61e, %o3
	.word	0x81a94a33	! t0_kref+0x1404:   	fcmps	%fcc0, %f5, %f19
	.word	0xe428a003	! t0_kref+0x1408:   	stb	%l2, [%g2 + 3]
	.word	0x86102004	! t0_kref+0x140c:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x1410:   	bne,a	_kref+0x1410
	.word	0x86a0e001	! t0_kref+0x1414:   	subcc	%g3, 1, %g3
	.word	0x95a38924	! t0_kref+0x1418:   	fmuls	%f14, %f4, %f10
	.word	0x981d8014	! t0_kref+0x141c:   	xor	%l6, %l4, %o4
	.word	0xabb580d2	! t0_kref+0x1420:   	edge16l	%l6, %l2, %l5
	.word	0x95a00530	! t0_kref+0x1424:   	fsqrts	%f16, %f10
	.word	0x96a54015	! t0_kref+0x1428:   	subcc	%l5, %l5, %o3
	.word	0x2d480007	! t0_kref+0x142c:   	fbg,a,pt	%fcc0, _kref+0x1448
	.word	0xada4c835	! t0_kref+0x1430:   	fadds	%f19, %f21, %f22
	.word	0x9bb44d27	! t0_kref+0x1434:   	fandnot1s	%f17, %f7, %f13
	.word	0x9e1d32cd	! t0_kref+0x1438:   	xor	%l4, -0xd33, %o7
	.word	0xd8de101d	! t0_kref+0x143c:   	ldxa	[%i0 + %i5]0x80, %o4
	.word	0x2c480005	! t0_kref+0x1440:   	bneg,a,pt	%icc, _kref+0x1454
	.word	0xc768a08f	! t0_kref+0x1444:   	prefetch	%g2 + 0x8f, 3
	.word	0x90b54012	! t0_kref+0x1448:   	orncc	%l5, %l2, %o0
	.word	0x33800008	! t0_kref+0x144c:   	fbe,a	_kref+0x146c
	.word	0xaf400000	! t0_kref+0x1450:   	mov	%y, %l7
	.word	0xea280019	! t0_kref+0x1454:   	stb	%l5, [%g0 + %i1]
	.word	0x21800001	! t0_kref+0x1458:   	fbn,a	_kref+0x145c
	.word	0x90b4ef7e	! t0_kref+0x145c:   	orncc	%l3, 0xf7e, %o0
	.word	0x93ab402c	! t0_kref+0x1460:   	fmovsle	%fcc0, %f12, %f9
	.word	0xda50a012	! t0_kref+0x1464:   	ldsh	[%g2 + 0x12], %o5
	.word	0x9a7d8013	! t0_kref+0x1468:   	sdiv	%l6, %l3, %o5
	.word	0x91b1850e	! t0_kref+0x146c:   	fcmpgt16	%f6, %f14, %o0
	.word	0xe42e2010	! t0_kref+0x1470:   	stb	%l2, [%i0 + 0x10]
	.word	0x3f480001	! t0_kref+0x1474:   	fbo,a,pt	%fcc0, _kref+0x1478
	.word	0x98f50014	! t0_kref+0x1478:   	udivcc	%l4, %l4, %o4
	.word	0xada00552	! t0_kref+0x147c:   	fsqrtd	%f18, %f22
	.word	0x81b01023	! t0_kref+0x1480:   	siam	0x3
	.word	0x93257ec2	! t0_kref+0x1484:   	mulscc	%l5, -0x13e, %o1
	.word	0x99a8002b	! t0_kref+0x1488:   	fmovsn	%fcc0, %f11, %f12
	.word	0xa5b00c00	! t0_kref+0x148c:   	fzero	%f18
	.word	0x8db286ec	! t0_kref+0x1490:   	fmul8ulx16	%f10, %f12, %f6
	.word	0xa1a01a44	! t0_kref+0x1494:   	fdtoi	%f4, %f16
	.word	0xc398a040	! t0_kref+0x1498:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0xc096d040	! t0_kref+0x149c:   	lduha	[%i3]0x82, %g0
	.word	0xc398a040	! t0_kref+0x14a0:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0xa5a01110	! t0_kref+0x14a4:   	fxtod	%f16, %f18
	.word	0xe8567fec	! t0_kref+0x14a8:   	ldsh	[%i1 - 0x14], %l4
	.word	0xa7b1850e	! t0_kref+0x14ac:   	fcmpgt16	%f6, %f14, %l3
	.word	0x39480004	! t0_kref+0x14b0:   	fbuge,a,pt	%fcc0, _kref+0x14c0
	.word	0x90fd8013	! t0_kref+0x14b4:   	sdivcc	%l6, %l3, %o0
	.word	0x96358013	! t0_kref+0x14b8:   	orn	%l6, %l3, %o3
	.word	0xa4ac8012	! t0_kref+0x14bc:   	andncc	%l2, %l2, %l2
	.word	0x8da01927	! t0_kref+0x14c0:   	fstod	%f7, %f6
	.word	0xea2e4000	! t0_kref+0x14c4:   	stb	%l5, [%i1]
	.word	0xabb48334	! t0_kref+0x14c8:   	bmask	%l2, %l4, %l5
	.word	0x9e7ca82c	! t0_kref+0x14cc:   	sdiv	%l2, 0x82c, %o7
	.word	0x39800006	! t0_kref+0x14d0:   	fbuge,a	_kref+0x14e8
	.word	0x9fa1c9a8	! t0_kref+0x14d4:   	fdivs	%f7, %f8, %f15
	.word	0x801c8013	! t0_kref+0x14d8:   	xor	%l2, %l3, %g0
	.word	0xe11e001d	! t0_kref+0x14dc:   	ldd	[%i0 + %i5], %f16
	.word	0x24480003	! t0_kref+0x14e0:   	ble,a,pt	%icc, _kref+0x14ec
	.word	0x8184c000	! t0_kref+0x14e4:   	wr	%l3, %g0, %y
	.word	0xadb48172	! t0_kref+0x14e8:   	edge32ln	%l2, %l2, %l6
	.word	0xac5dadb5	! t0_kref+0x14ec:   	smul	%l6, 0xdb5, %l6
	.word	0x27480006	! t0_kref+0x14f0:   	fbul,a,pt	%fcc0, _kref+0x1508
	.word	0x93400000	! t0_kref+0x14f4:   	mov	%y, %o1
	.word	0x81ac4aae	! t0_kref+0x14f8:   	fcmpes	%fcc0, %f17, %f14
	.word	0x9fb48116	! t0_kref+0x14fc:   	edge32	%l2, %l6, %o7
	.word	0x81850000	! t0_kref+0x1500:   	wr	%l4, %g0, %y
	.word	0xa1a0052d	! t0_kref+0x1504:   	fsqrts	%f13, %f16
	.word	0x3f480003	! t0_kref+0x1508:   	fbo,a,pt	%fcc0, _kref+0x1514
	.word	0xdb200019	! t0_kref+0x150c:   	st	%f13, [%g0 + %i1]
	.word	0x89a00530	! t0_kref+0x1510:   	fsqrts	%f16, %f4
	.word	0xe3ee501b	! t0_kref+0x1514:   	prefetcha	%i1 + %i3, 17
	call	SYM(t0_subr0)
	.word	0x8da448a7	! t0_kref+0x151c:   	fsubs	%f17, %f7, %f6
	.word	0xe82e0000	! t0_kref+0x1520:   	stb	%l4, [%i0]
	.word	0xada00131	! t0_kref+0x1524:   	fabss	%f17, %f22
	.word	0xa61c8013	! t0_kref+0x1528:   	xor	%l2, %l3, %l3
	.word	0xdf064000	! t0_kref+0x152c:   	ld	[%i1], %f15
	.word	0x91a40d30	! t0_kref+0x1530:   	fsmuld	%f16, %f16, %f8
	.word	0xde0e3ff8	! t0_kref+0x1534:   	ldub	[%i0 - 8], %o7
	.word	0xd0566006	! t0_kref+0x1538:   	ldsh	[%i1 + 6], %o0
	.word	0x9ba018d4	! t0_kref+0x153c:   	fdtos	%f20, %f13
	.word	0x2b800004	! t0_kref+0x1540:   	fbug,a	_kref+0x1550
	.word	0xfbee101a	! t0_kref+0x1544:   	prefetcha	%i0 + %i2, 29
	.word	0xa1a01a46	! t0_kref+0x1548:   	fdtoi	%f6, %f16
	.word	0x81dcbd56	! t0_kref+0x154c:   	flush	%l2 - 0x2aa
	.word	0x9f3ca001	! t0_kref+0x1550:   	sra	%l2, 0x1, %o7
	.word	0x91a01a4a	! t0_kref+0x1554:   	fdtoi	%f10, %f8
	.word	0xa5b28a8e	! t0_kref+0x1558:   	fpsub16	%f10, %f14, %f18
	.word	0xa90d2acf	! t0_kref+0x155c:   	tsubcc	%l4, 0xacf, %l4
	.word	0xec9e101d	! t0_kref+0x1560:   	ldda	[%i0 + %i5]0x80, %l6
	.word	0x95a01933	! t0_kref+0x1564:   	fstod	%f19, %f10
	.word	0xa5b00770	! t0_kref+0x1568:   	fpack16	%f16, %f18
	.word	0x81854000	! t0_kref+0x156c:   	wr	%l5, %g0, %y
	.word	0x913cc012	! t0_kref+0x1570:   	sra	%l3, %l2, %o0
	.word	0xe42e6004	! t0_kref+0x1574:   	stb	%l2, [%i1 + 4]
	.word	0xaaa4f92d	! t0_kref+0x1578:   	subcc	%l3, -0x6d3, %l5
	.word	0x94b5a92f	! t0_kref+0x157c:   	orncc	%l6, 0x92f, %o2
	.word	0x809d7b04	! t0_kref+0x1580:   	xorcc	%l5, -0x4fc, %g0
	.word	0x95b1c674	! t0_kref+0x1584:   	fmul8x16au	%f7, %f20, %f10
	.word	0x85a28854	! t0_kref+0x1588:   	faddd	%f10, %f20, %f2
	.word	0x973d0016	! t0_kref+0x158c:   	sra	%l4, %l6, %o3
	.word	0x97b20584	! t0_kref+0x1590:   	fcmpgt32	%f8, %f4, %o3
	.word	0xe7ee101a	! t0_kref+0x1594:   	prefetcha	%i0 + %i2, 19
	.word	0x9f250012	! t0_kref+0x1598:   	mulscc	%l4, %l2, %o7
	.word	0xada00550	! t0_kref+0x159c:   	fsqrtd	%f16, %f22
	.word	0xa7a01a54	! t0_kref+0x15a0:   	fdtoi	%f20, %f19
	.word	0xa5a00552	! t0_kref+0x15a4:   	fsqrtd	%f18, %f18
	.word	0x31480007	! t0_kref+0x15a8:   	fba,a,pt	%fcc0, _kref+0x15c4
	.word	0xcd00a000	! t0_kref+0x15ac:   	ld	[%g2], %f6
	.word	0xac9d0014	! t0_kref+0x15b0:   	xorcc	%l4, %l4, %l6
	.word	0x8da1c829	! t0_kref+0x15b4:   	fadds	%f7, %f9, %f6
	.word	0xe62e3fe6	! t0_kref+0x15b8:   	stb	%l3, [%i0 - 0x1a]
	.word	0xadb2462e	! t0_kref+0x15bc:   	fmul8x16	%f9, %f14, %f22
	.word	0x81580000	! t0_kref+0x15c0:   	flushw
	.word	0xe3b8a080	! t0_kref+0x15c4:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xa3b20cb5	! t0_kref+0x15c8:   	fandnot2s	%f8, %f21, %f17
	.word	0x96b57e65	! t0_kref+0x15cc:   	orncc	%l5, -0x19b, %o3
	.word	0xea2e4000	! t0_kref+0x15d0:   	stb	%l5, [%i1]
	.word	0xa1a00550	! t0_kref+0x15d4:   	fsqrtd	%f16, %f16
	.word	0x949ce452	! t0_kref+0x15d8:   	xorcc	%l3, 0x452, %o2
	.word	0xd1be5816	! t0_kref+0x15dc:   	stda	%f8, [%i1 + %l6]0xc0
	.word	0x86102001	! t0_kref+0x15e0:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x15e4:   	bne,a	_kref+0x15e4
	.word	0x86a0e001	! t0_kref+0x15e8:   	subcc	%g3, 1, %g3
	.word	0xad65a4a7	! t0_kref+0x15ec:   	movneg	%icc, -0x359, %l6
	.word	0x8da288cc	! t0_kref+0x15f0:   	fsubd	%f10, %f12, %f6
	.word	0x9fb4c355	! t0_kref+0x15f4:   	alignaddrl	%l3, %l5, %o7
	.word	0xe62e6006	! t0_kref+0x15f8:   	stb	%l3, [%i1 + 6]
	.word	0x21480004	! t0_kref+0x15fc:   	fbn,a,pt	%fcc0, _kref+0x160c
	.word	0xd0564000	! t0_kref+0x1600:   	ldsh	[%i1], %o0
	.word	0x9264b15d	! t0_kref+0x1604:   	subc	%l2, -0xea3, %o1
	.word	0xa6f5a452	! t0_kref+0x1608:   	udivcc	%l6, 0x452, %l3
	.word	0x36480003	! t0_kref+0x160c:   	bge,a,pt	%icc, _kref+0x1618
	.word	0xe51e6000	! t0_kref+0x1610:   	ldd	[%i1], %f18
	.word	0xadb50335	! t0_kref+0x1614:   	bmask	%l4, %l5, %l6
	.word	0xec070018	! t0_kref+0x1618:   	ld	[%i4 + %i0], %l6
	.word	0xa9b00c00	! t0_kref+0x161c:   	fzero	%f20
	.word	0xa3b58113	! t0_kref+0x1620:   	edge32	%l6, %l3, %l1
	.word	0x9da00135	! t0_kref+0x1624:   	fabss	%f21, %f14
	.word	0xe430a00a	! t0_kref+0x1628:   	sth	%l2, [%g2 + 0xa]
	.word	0x81ab0a34	! t0_kref+0x162c:   	fcmps	%fcc0, %f12, %f20
	.word	0xe4164000	! t0_kref+0x1630:   	lduh	[%i1], %l2
	.word	0xe1f65012	! t0_kref+0x1634:   	casxa	[%i1]0x80, %l2, %l0
	.word	0x9b400000	! t0_kref+0x1638:   	mov	%y, %o5
	.word	0xaebc8014	! t0_kref+0x163c:   	xnorcc	%l2, %l4, %l7
	.word	0xacad8014	! t0_kref+0x1640:   	andncc	%l6, %l4, %l6
	.word	0x8143e040	! t0_kref+0x1644:   	membar	0x40
	.word	0xe9be5813	! t0_kref+0x1648:   	stda	%f20, [%i1 + %l3]0xc0
	.word	0xa1b34967	! t0_kref+0x164c:   	fpmerge	%f13, %f7, %f16
	.word	0x81b40488	! t0_kref+0x1650:   	fcmple32	%f16, %f8, %g0
	.word	0x81dd000f	! t0_kref+0x1654:   	flush	%l4 + %o7
	.word	0x29480005	! t0_kref+0x1658:   	fbl,a,pt	%fcc0, _kref+0x166c
	.word	0x95a018d0	! t0_kref+0x165c:   	fdtos	%f16, %f10
	.word	0x801cbb2d	! t0_kref+0x1660:   	xor	%l2, -0x4d3, %g0
	.word	0x9ba00528	! t0_kref+0x1664:   	fsqrts	%f8, %f13
	.word	0x99b580b3	! t0_kref+0x1668:   	edge16n	%l6, %l3, %o4
	.word	0xe426401c	! t0_kref+0x166c:   	st	%l2, [%i1 + %i4]
	.word	0xae14f1d0	! t0_kref+0x1670:   	or	%l3, -0xe30, %l7
	.word	0xe5000019	! t0_kref+0x1674:   	ld	[%g0 + %i1], %f18
	.word	0x965d3027	! t0_kref+0x1678:   	smul	%l4, -0xfd9, %o3
	.word	0x9654f6aa	! t0_kref+0x167c:   	umul	%l3, -0x956, %o3
	.word	0xd320a038	! t0_kref+0x1680:   	st	%f9, [%g2 + 0x38]
	.word	0xee8e9019	! t0_kref+0x1684:   	lduba	[%i2 + %i1]0x80, %l7
	.word	0x30480003	! t0_kref+0x1688:   	ba,a,pt	%icc, _kref+0x1694
	.word	0x89aa4052	! t0_kref+0x168c:   	fmovde	%fcc0, %f18, %f4
	.word	0xe9be1a1d	! t0_kref+0x1690:   	stda	%f20, [%i0 + %i5]0xd0
	.word	0x9de3bfa0	! t0_kref+0x1694:   	save	%sp, -0x60, %sp
	.word	0xb616fb47	! t0_kref+0x1698:   	or	%i3, -0x4b9, %i3
	.word	0xadee8019	! t0_kref+0x169c:   	restore	%i2, %i1, %l6
	.word	0x8143e047	! t0_kref+0x16a0:   	membar	0x47
	.word	0x98b58013	! t0_kref+0x16a4:   	orncc	%l6, %l3, %o4
	.word	0x81ab8a48	! t0_kref+0x16a8:   	fcmpd	%fcc0, %f14, %f8
	.word	0x8db406ea	! t0_kref+0x16ac:   	fmul8ulx16	%f16, %f10, %f6
	.word	0xa1a0884c	! t0_kref+0x16b0:   	faddd	%f2, %f12, %f16
	.word	0x9e64c014	! t0_kref+0x16b4:   	subc	%l3, %l4, %o7
	.word	0xa8adb311	! t0_kref+0x16b8:   	andncc	%l6, -0xcef, %l4
	.word	0x973d8016	! t0_kref+0x16bc:   	sra	%l6, %l6, %o3
	.word	0xae1d8016	! t0_kref+0x16c0:   	xor	%l6, %l6, %l7
	.word	0xe610a030	! t0_kref+0x16c4:   	lduh	[%g2 + 0x30], %l3
	.word	0xe1000019	! t0_kref+0x16c8:   	ld	[%g0 + %i1], %f16
	.word	0x9fa01a50	! t0_kref+0x16cc:   	fdtoi	%f16, %f15
	.word	0xa88d62c0	! t0_kref+0x16d0:   	andcc	%l5, 0x2c0, %l4
	.word	0xe51e6018	! t0_kref+0x16d4:   	ldd	[%i1 + 0x18], %f18
	.word	0xa5b009b0	! t0_kref+0x16d8:   	fexpand	%f16, %f18
	.word	0xc398a080	! t0_kref+0x16dc:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0x92ad8012	! t0_kref+0x16e0:   	andncc	%l6, %l2, %o1
	call	SYM(t0_subr1)
	.word	0x8585713e	! t0_kref+0x16e8:   	wr	%l5, 0xfffff13e, %ccr
	.word	0x31480001	! t0_kref+0x16ec:   	fba,a,pt	%fcc0, _kref+0x16f0
	.word	0x9f400000	! t0_kref+0x16f0:   	mov	%y, %o7
	.word	0xea2e3ffd	! t0_kref+0x16f4:   	stb	%l5, [%i0 - 3]
	.word	0xc3ee1013	! t0_kref+0x16f8:   	prefetcha	%i0 + %l3, 1
	.word	0xa93d0013	! t0_kref+0x16fc:   	sra	%l4, %l3, %l4
	.word	0xec30a008	! t0_kref+0x1700:   	sth	%l6, [%g2 + 8]
	.word	0x81854000	! t0_kref+0x1704:   	wr	%l5, %g0, %y
	.word	0xe51e2000	! t0_kref+0x1708:   	ldd	[%i0], %f18
	.word	0x8ba3c82a	! t0_kref+0x170c:   	fadds	%f15, %f10, %f5
	.word	0xd256c019	! t0_kref+0x1710:   	ldsh	[%i3 + %i1], %o1
	.word	0xa28d0012	! t0_kref+0x1714:   	andcc	%l4, %l2, %l1
	.word	0x9f24c015	! t0_kref+0x1718:   	mulscc	%l3, %l5, %o7
	.word	0xd400a038	! t0_kref+0x171c:   	ld	[%g2 + 0x38], %o2
	.word	0x80158012	! t0_kref+0x1720:   	or	%l6, %l2, %g0
	.word	0xa5a34828	! t0_kref+0x1724:   	fadds	%f13, %f8, %f18
	.word	0xa02d319c	! t0_kref+0x1728:   	andn	%l4, -0xe64, %l0
	.word	0xc00e2005	! t0_kref+0x172c:   	ldub	[%i0 + 5], %g0
	.word	0xed26601c	! t0_kref+0x1730:   	st	%f22, [%i1 + 0x1c]
	.word	0x9124c015	! t0_kref+0x1734:   	mulscc	%l3, %l5, %o0
	.word	0xa5a0004c	! t0_kref+0x1738:   	fmovd	%f12, %f18
	.word	0x35480001	! t0_kref+0x173c:   	fbue,a,pt	%fcc0, _kref+0x1740
	.word	0xa5a01907	! t0_kref+0x1740:   	fitod	%f7, %f18
	.word	0x9ba00523	! t0_kref+0x1744:   	fsqrts	%f3, %f13
	.word	0x99b5874c	! t0_kref+0x1748:   	fpack32	%f22, %f12, %f12
	.word	0x81a9ca2b	! t0_kref+0x174c:   	fcmps	%fcc0, %f7, %f11
	.word	0xaae48015	! t0_kref+0x1750:   	subccc	%l2, %l5, %l5
	.word	0x9763e796	! t0_kref+0x1754:   	movo	%fcc0, -0x6a, %o3
	.word	0x965d0014	! t0_kref+0x1758:   	smul	%l4, %l4, %o3
	.word	0xd5066010	! t0_kref+0x175c:   	ld	[%i1 + 0x10], %f10
	.word	0xd520a010	! t0_kref+0x1760:   	st	%f10, [%g2 + 0x10]
	.word	0x9525325f	! t0_kref+0x1764:   	mulscc	%l4, -0xda1, %o2
	.word	0x807d4016	! t0_kref+0x1768:   	sdiv	%l5, %l6, %g0
	.word	0x81ac8ab5	! t0_kref+0x176c:   	fcmpes	%fcc0, %f18, %f21
	.word	0x91258014	! t0_kref+0x1770:   	mulscc	%l6, %l4, %o0
	.word	0xc5ee1014	! t0_kref+0x1774:   	prefetcha	%i0 + %l4, 2
	.word	0x973d6013	! t0_kref+0x1778:   	sra	%l5, 0x13, %o3
	.word	0xda564000	! t0_kref+0x177c:   	ldsh	[%i1], %o5
	.word	0x28480008	! t0_kref+0x1780:   	bleu,a,pt	%icc, _kref+0x17a0
	.word	0xe4266000	! t0_kref+0x1784:   	st	%l2, [%i1]
	.word	0xea266000	! t0_kref+0x1788:   	st	%l5, [%i1]
	.word	0xae248013	! t0_kref+0x178c:   	sub	%l2, %l3, %l7
	.word	0x81858000	! t0_kref+0x1790:   	wr	%l6, %g0, %y
	.word	0x81a94a24	! t0_kref+0x1794:   	fcmps	%fcc0, %f5, %f4
	.word	0xa3a000a5	! t0_kref+0x1798:   	fnegs	%f5, %f17
	.word	0xae3d8012	! t0_kref+0x179c:   	xnor	%l6, %l2, %l7
	.word	0xc7267fe0	! t0_kref+0x17a0:   	st	%f3, [%i1 - 0x20]
	.word	0x89a28846	! t0_kref+0x17a4:   	faddd	%f10, %f6, %f4
	.word	0xe4ae501a	! t0_kref+0x17a8:   	stba	%l2, [%i1 + %i2]0x80
	.word	0xdd20a018	! t0_kref+0x17ac:   	st	%f14, [%g2 + 0x18]
	.word	0x80b5a10a	! t0_kref+0x17b0:   	orncc	%l6, 0x10a, %g0
	.word	0x9bb500b4	! t0_kref+0x17b4:   	edge16n	%l4, %l4, %o5
	.word	0xa4f4e887	! t0_kref+0x17b8:   	udivcc	%l3, 0x887, %l2
	.word	0x32480001	! t0_kref+0x17bc:   	bne,a,pt	%icc, _kref+0x17c0
	.word	0x99a10836	! t0_kref+0x17c0:   	fadds	%f4, %f22, %f12
	.word	0xea2e2018	! t0_kref+0x17c4:   	stb	%l5, [%i0 + 0x18]
	.word	0x8d857efc	! t0_kref+0x17c8:   	wr	%l5, 0xfffffefc, %fprs
	.word	0x8da00554	! t0_kref+0x17cc:   	fsqrtd	%f20, %f6
	.word	0x89b207d4	! t0_kref+0x17d0:   	pdist	%f8, %f20, %f4
	.word	0x9fb30ea0	! t0_kref+0x17d4:   	fsrc1s	%f12, %f15
	.word	0x31480004	! t0_kref+0x17d8:   	fba,a,pt	%fcc0, _kref+0x17e8
	.word	0xa5b00f25	! t0_kref+0x17dc:   	fsrc2s	%f5, %f18
	.word	0xde8e101a	! t0_kref+0x17e0:   	lduba	[%i0 + %i2]0x80, %o7
	.word	0x9bb18a30	! t0_kref+0x17e4:   	fpadd16s	%f6, %f16, %f13
	.word	0xe3b8a040	! t0_kref+0x17e8:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xa73d0014	! t0_kref+0x17ec:   	sra	%l4, %l4, %l3
	.word	0xaba0052d	! t0_kref+0x17f0:   	fsqrts	%f13, %f21
	.word	0x9da01907	! t0_kref+0x17f4:   	fitod	%f7, %f14
	.word	0x9da01903	! t0_kref+0x17f8:   	fitod	%f3, %f14
	.word	0xe62e2000	! t0_kref+0x17fc:   	stb	%l3, [%i0]
	.word	0xa1a01912	! t0_kref+0x1800:   	fitod	%f18, %f16
	.word	0x81df8008	! t0_kref+0x1804:   	flush	%fp + %o0
	.word	0xaa14e5df	! t0_kref+0x1808:   	or	%l3, 0x5df, %l5
	.word	0x85b2c6a7	! t0_kref+0x180c:   	fmul8x16al	%f11, %f7, %f2
	.word	0xec367fea	! t0_kref+0x1810:   	sth	%l6, [%i1 - 0x16]
	.word	0xd816200c	! t0_kref+0x1814:   	lduh	[%i0 + 0xc], %o4
	.word	0x982c8012	! t0_kref+0x1818:   	andn	%l2, %l2, %o4
	.word	0xec266008	! t0_kref+0x181c:   	st	%l6, [%i1 + 8]
	.word	0xd7200018	! t0_kref+0x1820:   	st	%f11, [%g0 + %i0]
	.word	0xa265bbec	! t0_kref+0x1824:   	subc	%l6, -0x414, %l1
	.word	0xc9ee1016	! t0_kref+0x1828:   	prefetcha	%i0 + %l6, 4
	.word	0x8da01a2c	! t0_kref+0x182c:   	fstoi	%f12, %f6
	.word	0x21800004	! t0_kref+0x1830:   	fbn,a	_kref+0x1840
	.word	0x91a288d0	! t0_kref+0x1834:   	fsubd	%f10, %f16, %f8
	.word	0xe068a001	! t0_kref+0x1838:   	ldstub	[%g2 + 1], %l0
	.word	0x99b20ec6	! t0_kref+0x183c:   	fornot2	%f8, %f6, %f12
	.word	0x32480006	! t0_kref+0x1840:   	bne,a,pt	%icc, _kref+0x1858
	.word	0xc900a008	! t0_kref+0x1844:   	ld	[%g2 + 8], %f4
	.word	0xe3b8a040	! t0_kref+0x1848:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xada1482e	! t0_kref+0x184c:   	fadds	%f5, %f14, %f22
	.word	0x81858000	! t0_kref+0x1850:   	wr	%l6, %g0, %y
	.word	0xe4d6101b	! t0_kref+0x1854:   	ldsha	[%i0 + %i3]0x80, %l2
	.word	0x99a00552	! t0_kref+0x1858:   	fsqrtd	%f18, %f12
	.word	0xa9b540b3	! t0_kref+0x185c:   	edge16n	%l5, %l3, %l4
	.word	0xa6ad0012	! t0_kref+0x1860:   	andncc	%l4, %l2, %l3
	.word	0xe628a008	! t0_kref+0x1864:   	stb	%l3, [%g2 + 8]
	.word	0xa4758013	! t0_kref+0x1868:   	udiv	%l6, %l3, %l2
	.word	0x8143c000	! t0_kref+0x186c:   	stbar
	.word	0xa5a01a32	! t0_kref+0x1870:   	fstoi	%f18, %f18
	.word	0x89a01a50	! t0_kref+0x1874:   	fdtoi	%f16, %f4
	.word	0x8ba9002f	! t0_kref+0x1878:   	fmovsl	%fcc0, %f15, %f5
	.word	0x91b50ee5	! t0_kref+0x187c:   	fornot2s	%f20, %f5, %f8
	.word	0x81aa0aa9	! t0_kref+0x1880:   	fcmpes	%fcc0, %f8, %f9
	.word	0x86102019	! t0_kref+0x1884:   	mov	0x19, %g3
	.word	0x86a0e001	! t0_kref+0x1888:   	subcc	%g3, 1, %g3
	.word	0x22800010	! t0_kref+0x188c:   	be,a	_kref+0x18cc
	.word	0x89b3cc6e	! t0_kref+0x1890:   	fnors	%f15, %f14, %f4
	.word	0x28480003	! t0_kref+0x1894:   	bleu,a,pt	%icc, _kref+0x18a0
	.word	0xabb00fe0	! t0_kref+0x1898:   	fones	%f21
	.word	0xe6560000	! t0_kref+0x189c:   	ldsh	[%i0], %l3
	.word	0xe82e001a	! t0_kref+0x18a0:   	stb	%l4, [%i0 + %i2]
	.word	0xadb386ec	! t0_kref+0x18a4:   	fmul8ulx16	%f14, %f12, %f22
	.word	0x93a00534	! t0_kref+0x18a8:   	fsqrts	%f20, %f9
	.word	0x81850000	! t0_kref+0x18ac:   	wr	%l4, %g0, %y
	.word	0xe430a00a	! t0_kref+0x18b0:   	sth	%l2, [%g2 + 0xa]
	.word	0xa4ad66f4	! t0_kref+0x18b4:   	andncc	%l5, 0x6f4, %l2
	.word	0x8143c000	! t0_kref+0x18b8:   	stbar
	.word	0x99b58076	! t0_kref+0x18bc:   	edge8ln	%l6, %l6, %o4
	.word	0x9a548012	! t0_kref+0x18c0:   	umul	%l2, %l2, %o5
	.word	0x9ee50012	! t0_kref+0x18c4:   	subccc	%l4, %l2, %o7
	call	SYM(t0_subr0)
	.word	0x8143c000	! t0_kref+0x18cc:   	stbar
	.word	0xa5a000a6	! t0_kref+0x18d0:   	fnegs	%f6, %f18
	.word	0x2b0ae3db	! t0_kref+0x18d4:   	sethi	%hi(0x2b8f6c00), %l5
	.word	0x9f3d8014	! t0_kref+0x18d8:   	sra	%l6, %l4, %o7
	.word	0xa1b50c4c	! t0_kref+0x18dc:   	fnor	%f20, %f12, %f16
	.word	0x86102004	! t0_kref+0x18e0:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x18e4:   	bne,a	_kref+0x18e4
	.word	0x86a0e001	! t0_kref+0x18e8:   	subcc	%g3, 1, %g3
	.word	0x9bb385ca	! t0_kref+0x18ec:   	fcmpeq32	%f14, %f10, %o5
	.word	0x36800007	! t0_kref+0x18f0:   	bge,a	_kref+0x190c
	.word	0xc920a038	! t0_kref+0x18f4:   	st	%f4, [%g2 + 0x38]
	.word	0x34480005	! t0_kref+0x18f8:   	bg,a,pt	%icc, _kref+0x190c
	.word	0x92dcc014	! t0_kref+0x18fc:   	smulcc	%l3, %l4, %o1
	.word	0x2d480005	! t0_kref+0x1900:   	fbg,a,pt	%fcc0, _kref+0x1914
	.word	0xe306401c	! t0_kref+0x1904:   	ld	[%i1 + %i4], %f17
	.word	0x81848000	! t0_kref+0x1908:   	wr	%l2, %g0, %y
	.word	0xa4acc014	! t0_kref+0x190c:   	andncc	%l3, %l4, %l2
	.word	0xaa9d3bdd	! t0_kref+0x1910:   	xorcc	%l4, -0x423, %l5
	.word	0x9f258012	! t0_kref+0x1914:   	mulscc	%l6, %l2, %o7
	.word	0x8db18e14	! t0_kref+0x1918:   	fand	%f6, %f20, %f6
	.word	0xe9180019	! t0_kref+0x191c:   	ldd	[%g0 + %i1], %f20
	.word	0xa6454014	! t0_kref+0x1920:   	addc	%l5, %l4, %l3
	.word	0xe4463ff8	! t0_kref+0x1924:   	ldsw	[%i0 - 8], %l2
	.word	0xd0080018	! t0_kref+0x1928:   	ldub	[%g0 + %i0], %o0
	.word	0x89a208cc	! t0_kref+0x192c:   	fsubd	%f8, %f12, %f4
	.word	0xa93d0013	! t0_kref+0x1930:   	sra	%l4, %l3, %l4
	.word	0x81aa8aa9	! t0_kref+0x1934:   	fcmpes	%fcc0, %f10, %f9
	.word	0xa1b54333	! t0_kref+0x1938:   	bmask	%l5, %l3, %l0
	.word	0xe8763ff0	! t0_kref+0x193c:   	stx	%l4, [%i0 - 0x10]
	.word	0x81d8001d	! t0_kref+0x1940:   	flush	%g0 + %i5
	.word	0xaa5c8015	! t0_kref+0x1944:   	smul	%l2, %l5, %l5
	.word	0x8da00527	! t0_kref+0x1948:   	fsqrts	%f7, %f6
	.word	0x9064c015	! t0_kref+0x194c:   	subc	%l3, %l5, %o0
	.word	0xc7260000	! t0_kref+0x1950:   	st	%f3, [%i0]
	.word	0xa89cb37d	! t0_kref+0x1954:   	xorcc	%l2, -0xc83, %l4
	.word	0x89a00550	! t0_kref+0x1958:   	fsqrtd	%f16, %f4
	.word	0x91a01930	! t0_kref+0x195c:   	fstod	%f16, %f8
	.word	0x99400000	! t0_kref+0x1960:   	mov	%y, %o4
	.word	0xd64e401a	! t0_kref+0x1964:   	ldsb	[%i1 + %i2], %o3
	.word	0x8143c000	! t0_kref+0x1968:   	stbar
	.word	0xec26200c	! t0_kref+0x196c:   	st	%l6, [%i0 + 0xc]
	.word	0xa9a4084c	! t0_kref+0x1970:   	faddd	%f16, %f12, %f20
	.word	0xc398a080	! t0_kref+0x1974:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0x9a3db84d	! t0_kref+0x1978:   	xnor	%l6, -0x7b3, %o5
	.word	0xd3000018	! t0_kref+0x197c:   	ld	[%g0 + %i0], %f9
	.word	0xa1a00123	! t0_kref+0x1980:   	fabss	%f3, %f16
	.word	0xa5a00544	! t0_kref+0x1984:   	fsqrtd	%f4, %f18
	.word	0x29480005	! t0_kref+0x1988:   	fbl,a,pt	%fcc0, _kref+0x199c
	.word	0xa124a85f	! t0_kref+0x198c:   	mulscc	%l2, 0x85f, %l0
	.word	0x8ba01a27	! t0_kref+0x1990:   	fstoi	%f7, %f5
	.word	0xaa1d8014	! t0_kref+0x1994:   	xor	%l6, %l4, %l5
	.word	0x91a00556	! t0_kref+0x1998:   	fsqrtd	%f22, %f8
	.word	0x81ad8aab	! t0_kref+0x199c:   	fcmpes	%fcc0, %f22, %f11
	.word	0xe878a008	! t0_kref+0x19a0:   	swap	[%g2 + 8], %l4
	.word	0x39800008	! t0_kref+0x19a4:   	fbuge,a	_kref+0x19c4
	.word	0x9f7021e3	! t0_kref+0x19a8:   	popc	0x1e3, %o7
	.word	0x8fa01a50	! t0_kref+0x19ac:   	fdtoi	%f16, %f7
	.word	0xd5180019	! t0_kref+0x19b0:   	ldd	[%g0 + %i1], %f10
	.word	0x8da0884a	! t0_kref+0x19b4:   	faddd	%f2, %f10, %f6
	.word	0xd11e001d	! t0_kref+0x19b8:   	ldd	[%i0 + %i5], %f8
	.word	0xa9a3084a	! t0_kref+0x19bc:   	faddd	%f12, %f10, %f20
	.word	0xaba01a54	! t0_kref+0x19c0:   	fdtoi	%f20, %f21
	.word	0xeca65000	! t0_kref+0x19c4:   	sta	%l6, [%i1]0x80
	.word	0x81850000	! t0_kref+0x19c8:   	wr	%l4, %g0, %y
	.word	0x8fa018c4	! t0_kref+0x19cc:   	fdtos	%f4, %f7
	.word	0x948cb670	! t0_kref+0x19d0:   	andcc	%l2, -0x990, %o2
	.word	0x9f414000	! t0_kref+0x19d4:   	mov	%pc, %o7
	.word	0xada0002c	! t0_kref+0x19d8:   	fmovs	%f12, %f22
	.word	0xa9a388c4	! t0_kref+0x19dc:   	fsubd	%f14, %f4, %f20
	.word	0xa81ce873	! t0_kref+0x19e0:   	xor	%l3, 0x873, %l4
	.word	0xa9a01923	! t0_kref+0x19e4:   	fstod	%f3, %f20
	.word	0x89a388c4	! t0_kref+0x19e8:   	fsubd	%f14, %f4, %f4
	.word	0xd9be1a5c	! t0_kref+0x19ec:   	stda	%f12, [%i0 + %i4]0xd2
	.word	0x81257507	! t0_kref+0x19f0:   	mulscc	%l5, -0xaf9, %g0
	.word	0x8da2884a	! t0_kref+0x19f4:   	faddd	%f10, %f10, %f6
	.word	0x91a01932	! t0_kref+0x19f8:   	fstod	%f18, %f8
	.word	0xa5a0190a	! t0_kref+0x19fc:   	fitod	%f10, %f18
	.word	0xe000a030	! t0_kref+0x1a00:   	ld	[%g2 + 0x30], %l0
	.word	0x91a3cd2a	! t0_kref+0x1a04:   	fsmuld	%f15, %f10, %f8
	.word	0x25480006	! t0_kref+0x1a08:   	fblg,a,pt	%fcc0, _kref+0x1a20
	.word	0xd086501c	! t0_kref+0x1a0c:   	lda	[%i1 + %i4]0x80, %o0
	.word	0xc368a0c8	! t0_kref+0x1a10:   	prefetch	%g2 + 0xc8, 1
	.word	0xac14e1b6	! t0_kref+0x1a14:   	or	%l3, 0x1b6, %l6
	.word	0x3d480003	! t0_kref+0x1a18:   	fbule,a,pt	%fcc0, _kref+0x1a24
	.word	0x9db00cc4	! t0_kref+0x1a1c:   	fnot2	%f4, %f14
	.word	0x9ba01a46	! t0_kref+0x1a20:   	fdtoi	%f6, %f13
	.word	0xc050a008	! t0_kref+0x1a24:   	ldsh	[%g2 + 8], %g0
	.word	0x2a480002	! t0_kref+0x1a28:   	bcs,a,pt	%icc, _kref+0x1a30
	.word	0xa5b38d90	! t0_kref+0x1a2c:   	fxor	%f14, %f16, %f18
	.word	0xace58016	! t0_kref+0x1a30:   	subccc	%l6, %l6, %l6
	.word	0xd9be1892	! t0_kref+0x1a34:   	stda	%f12, [%i0 + %l2]0xc4
	.word	0x8db00c20	! t0_kref+0x1a38:   	fzeros	%f6
	.word	0xea30a010	! t0_kref+0x1a3c:   	sth	%l5, [%g2 + 0x10]
	.word	0xc568a048	! t0_kref+0x1a40:   	prefetch	%g2 + 0x48, 2
	.word	0x91b28a90	! t0_kref+0x1a44:   	fpsub16	%f10, %f16, %f8
	.word	0xa054e411	! t0_kref+0x1a48:   	umul	%l3, 0x411, %l0
	.word	0xa9400000	! t0_kref+0x1a4c:   	mov	%y, %l4
	.word	0x92554014	! t0_kref+0x1a50:   	umul	%l5, %l4, %o1
	.word	0x80acacf1	! t0_kref+0x1a54:   	andncc	%l2, 0xcf1, %g0
	.word	0xd9be5816	! t0_kref+0x1a58:   	stda	%f12, [%i1 + %l6]0xc0
	.word	0xe5270018	! t0_kref+0x1a5c:   	st	%f18, [%i4 + %i0]
	.word	0x95b2040e	! t0_kref+0x1a60:   	fcmple16	%f8, %f14, %o2
	.word	0x81858000	! t0_kref+0x1a64:   	wr	%l6, %g0, %y
	.word	0xa5b18506	! t0_kref+0x1a68:   	fcmpgt16	%f6, %f6, %l2
	.word	0x95b00fe0	! t0_kref+0x1a6c:   	fones	%f10
	.word	0xa2ad4014	! t0_kref+0x1a70:   	andncc	%l5, %l4, %l1
	.word	0xa475b96d	! t0_kref+0x1a74:   	udiv	%l6, -0x693, %l2
	.word	0x91b40a6d	! t0_kref+0x1a78:   	fpadd32s	%f16, %f13, %f8
	.word	0x3a480001	! t0_kref+0x1a7c:   	bcc,a,pt	%icc, _kref+0x1a80
	.word	0xcb267fe4	! t0_kref+0x1a80:   	st	%f5, [%i1 - 0x1c]
	.word	0xd99e1a5c	! t0_kref+0x1a84:   	ldda	[%i0 + %i4]0xd2, %f12
	.word	0xec06401c	! t0_kref+0x1a88:   	ld	[%i1 + %i4], %l6
	.word	0x83414000	! t0_kref+0x1a8c:   	mov	%pc, %g1
	.word	0xa9a24d28	! t0_kref+0x1a90:   	fsmuld	%f9, %f8, %f20
	.word	0xa1250016	! t0_kref+0x1a94:   	mulscc	%l4, %l6, %l0
	.word	0x22800002	! t0_kref+0x1a98:   	be,a	_kref+0x1aa0
	.word	0xea16401b	! t0_kref+0x1a9c:   	lduh	[%i1 + %i3], %l5
	call	SYM(t0_subr3)
	.word	0xa2acb7f3	! t0_kref+0x1aa4:   	andncc	%l2, -0x80d, %l1
	.word	0x9db5862c	! t0_kref+0x1aa8:   	fmul8x16	%f22, %f12, %f14
	.word	0xf207bfe0	! t0_kref+0x1aac:   	ld	[%fp - 0x20], %i1
	.word	0xec0e4000	! t0_kref+0x1ab0:   	ldub	[%i1], %l6
	.word	0x99b20a54	! t0_kref+0x1ab4:   	fpadd32	%f8, %f20, %f12
	.word	0xa63db65b	! t0_kref+0x1ab8:   	xnor	%l6, -0x9a5, %l3
	.word	0xe4180019	! t0_kref+0x1abc:   	ldd	[%g0 + %i1], %l2
	.word	0xa9b18fb6	! t0_kref+0x1ac0:   	fors	%f6, %f22, %f20
	.word	0x89a00526	! t0_kref+0x1ac4:   	fsqrts	%f6, %f4
	.word	0xa935200d	! t0_kref+0x1ac8:   	srl	%l4, 0xd, %l4
	.word	0xa13da019	! t0_kref+0x1acc:   	sra	%l6, 0x19, %l0
	.word	0xa5a389c2	! t0_kref+0x1ad0:   	fdivd	%f14, %f2, %f18
	.word	0x91b48d84	! t0_kref+0x1ad4:   	fxor	%f18, %f4, %f8
	.word	0x8db58f44	! t0_kref+0x1ad8:   	fornot1	%f22, %f4, %f6
	.word	0x9e150012	! t0_kref+0x1adc:   	or	%l4, %l2, %o7
	.word	0xa8acc016	! t0_kref+0x1ae0:   	andncc	%l3, %l6, %l4
	.word	0xe648a030	! t0_kref+0x1ae4:   	ldsb	[%g2 + 0x30], %l3
	.word	0xa5400000	! t0_kref+0x1ae8:   	mov	%y, %l2
	.word	0x947cc016	! t0_kref+0x1aec:   	sdiv	%l3, %l6, %o2
	.word	0xea2e8019	! t0_kref+0x1af0:   	stb	%l5, [%i2 + %i1]
	.word	0xa9a48850	! t0_kref+0x1af4:   	faddd	%f18, %f16, %f20
	.word	0x87b44df4	! t0_kref+0x1af8:   	fnands	%f17, %f20, %f3
	.word	0xac15b2ad	! t0_kref+0x1afc:   	or	%l6, -0xd53, %l6
	.word	0xadb009b3	! t0_kref+0x1b00:   	fexpand	%f19, %f22
	.word	0x3b480007	! t0_kref+0x1b04:   	fble,a,pt	%fcc0, _kref+0x1b20
	.word	0xac658013	! t0_kref+0x1b08:   	subc	%l6, %l3, %l6
	.word	0xada0192e	! t0_kref+0x1b0c:   	fstod	%f14, %f22
	.word	0xe6764000	! t0_kref+0x1b10:   	stx	%l3, [%i1]
	.word	0xa1a20d24	! t0_kref+0x1b14:   	fsmuld	%f8, %f4, %f16
	.word	0x8da00546	! t0_kref+0x1b18:   	fsqrtd	%f6, %f6
	.word	0x93400000	! t0_kref+0x1b1c:   	mov	%y, %o1
	.word	0x95400000	! t0_kref+0x1b20:   	mov	%y, %o2
	.word	0x99a00548	! t0_kref+0x1b24:   	fsqrtd	%f8, %f12
	.word	0x95a01916	! t0_kref+0x1b28:   	fitod	%f22, %f10
	.word	0xa4ad4012	! t0_kref+0x1b2c:   	andncc	%l5, %l2, %l2
	.word	0x9a5d3b65	! t0_kref+0x1b30:   	smul	%l4, -0x49b, %o5
	.word	0xe106401c	! t0_kref+0x1b34:   	ld	[%i1 + %i4], %f16
	.word	0xd810a030	! t0_kref+0x1b38:   	lduh	[%g2 + 0x30], %o4
	.word	0x99400000	! t0_kref+0x1b3c:   	mov	%y, %o4
	.word	0x89b009ae	! t0_kref+0x1b40:   	fexpand	%f14, %f4
	.word	0x91a00550	! t0_kref+0x1b44:   	fsqrtd	%f16, %f8
	.word	0x3e800003	! t0_kref+0x1b48:   	bvc,a	_kref+0x1b54
	.word	0x89a01a56	! t0_kref+0x1b4c:   	fdtoi	%f22, %f4
	.word	0xd040a028	! t0_kref+0x1b50:   	ldsw	[%g2 + 0x28], %o0
	.word	0xd91e2018	! t0_kref+0x1b54:   	ldd	[%i0 + 0x18], %f12
	.word	0x96a4e565	! t0_kref+0x1b58:   	subcc	%l3, 0x565, %o3
	.word	0x8da00544	! t0_kref+0x1b5c:   	fsqrtd	%f4, %f6
	.word	0xdd20a030	! t0_kref+0x1b60:   	st	%f14, [%g2 + 0x30]
	.word	0x9514c012	! t0_kref+0x1b64:   	taddcctv	%l3, %l2, %o2
	.word	0x89a50d2d	! t0_kref+0x1b68:   	fsmuld	%f20, %f13, %f4
	.word	0xa0e53938	! t0_kref+0x1b6c:   	subccc	%l4, -0x6c8, %l0
	.word	0x9fc00004	! t0_kref+0x1b70:   	call	%g0 + %g4
	.word	0xaee4b264	! t0_kref+0x1b74:   	subccc	%l2, -0xd9c, %l7
	.word	0x81a90a48	! t0_kref+0x1b78:   	fcmpd	%fcc0, %f4, %f8
	.word	0x81ad0ace	! t0_kref+0x1b7c:   	fcmped	%fcc0, %f20, %f14
	.word	0x81854000	! t0_kref+0x1b80:   	wr	%l5, %g0, %y
	.word	0x9da508ca	! t0_kref+0x1b84:   	fsubd	%f20, %f10, %f14
	.word	0xa3400000	! t0_kref+0x1b88:   	mov	%y, %l1
	.word	0x81ad0a24	! t0_kref+0x1b8c:   	fcmps	%fcc0, %f20, %f4
	.word	0x85a0054e	! t0_kref+0x1b90:   	fsqrtd	%f14, %f2
	.word	0xa5b18c48	! t0_kref+0x1b94:   	fnor	%f6, %f8, %f18
	.word	0xada388c6	! t0_kref+0x1b98:   	fsubd	%f14, %f6, %f22
	.word	0xe8562008	! t0_kref+0x1b9c:   	ldsh	[%i0 + 8], %l4
	.word	0x35480004	! t0_kref+0x1ba0:   	fbue,a,pt	%fcc0, _kref+0x1bb0
	.word	0xac3dba53	! t0_kref+0x1ba4:   	xnor	%l6, -0x5ad, %l6
	.word	0x93a01092	! t0_kref+0x1ba8:   	fxtos	%f18, %f9
	.word	0xad400000	! t0_kref+0x1bac:   	mov	%y, %l6
	.word	0x25480001	! t0_kref+0x1bb0:   	fblg,a,pt	%fcc0, _kref+0x1bb4
	.word	0x94bd3d0c	! t0_kref+0x1bb4:   	xnorcc	%l4, -0x2f4, %o2
	.word	0x81dc000e	! t0_kref+0x1bb8:   	flush	%l0 + %sp
	.word	0x25480004	! t0_kref+0x1bbc:   	fblg,a,pt	%fcc0, _kref+0x1bcc
	.word	0x99b3c706	! t0_kref+0x1bc0:   	fmuld8sux16	%f15, %f6, %f12
	.word	0x8143c000	! t0_kref+0x1bc4:   	stbar
	.word	0x8184c000	! t0_kref+0x1bc8:   	wr	%l3, %g0, %y
	.word	0xa465a0e1	! t0_kref+0x1bcc:   	subc	%l6, 0xe1, %l2
	.word	0x81aa8a56	! t0_kref+0x1bd0:   	fcmpd	%fcc0, %f10, %f22
	.word	0x95a00554	! t0_kref+0x1bd4:   	fsqrtd	%f20, %f10
	.word	0xed68a043	! t0_kref+0x1bd8:   	prefetch	%g2 + 0x43, 22
	.word	0xe1beda59	! t0_kref+0x1bdc:   	stda	%f16, [%i3 + %i1]0xd2
	.word	0xe4086170	! t0_kref+0x1be0:   	ldub	[%g1 + 0x170], %l2
	.word	0xa41ca00c	! t0_kref+0x1be4:   	xor	%l2, 0xc, %l2
	.word	0xe4286170	! t0_kref+0x1be8:   	stb	%l2, [%g1 + 0x170]
	.word	0x81d86170	! t0_kref+0x1bec:   	flush	%g1 + 0x170
	.word	0xd2567fea	! t0_kref+0x1bf0:   	ldsh	[%i1 - 0x16], %o1
	.word	0xec28a038	! t0_kref+0x1bf4:   	stb	%l6, [%g2 + 0x38]
	.word	0xe9be5894	! t0_kref+0x1bf8:   	stda	%f20, [%i1 + %l4]0xc4
2:	.word	0xa0a58012	! t0_kref+0x1bfc:   	subcc	%l6, %l2, %l0
	.word	0xa9a00550	! t0_kref+0x1c00:   	fsqrtd	%f16, %f20
	.word	0xa83dbeda	! t0_kref+0x1c04:   	xnor	%l6, -0x126, %l4
	.word	0xe46e4000	! t0_kref+0x1c08:   	ldstub	[%i1], %l2
	.word	0x99a01932	! t0_kref+0x1c0c:   	fstod	%f18, %f12
	.word	0xe640a018	! t0_kref+0x1c10:   	ldsw	[%g2 + 0x18], %l3
	.word	0x25480003	! t0_kref+0x1c14:   	fblg,a,pt	%fcc0, _kref+0x1c20
	.word	0x8143c000	! t0_kref+0x1c18:   	stbar
	.word	0x91a00531	! t0_kref+0x1c1c:   	fsqrts	%f17, %f8
	.word	0x9fa01a4e	! t0_kref+0x1c20:   	fdtoi	%f14, %f15
	.word	0x36480001	! t0_kref+0x1c24:   	bge,a,pt	%icc, _kref+0x1c28
	.word	0xe428a030	! t0_kref+0x1c28:   	stb	%l2, [%g2 + 0x30]
	.word	0xa9a00548	! t0_kref+0x1c2c:   	fsqrtd	%f8, %f20
	.word	0xa28d6318	! t0_kref+0x1c30:   	andcc	%l5, 0x318, %l1
	.word	0x81ad0ab6	! t0_kref+0x1c34:   	fcmpes	%fcc0, %f20, %f22
	.word	0xa694b8c9	! t0_kref+0x1c38:   	orcc	%l2, -0x737, %l3
	.word	0x81dc259c	! t0_kref+0x1c3c:   	flush	%l0 + 0x59c
	.word	0xe0580018	! t0_kref+0x1c40:   	ldx	[%g0 + %i0], %l0
	.word	0xa1a189b6	! t0_kref+0x1c44:   	fdivs	%f6, %f22, %f16
	.word	0x933ca016	! t0_kref+0x1c48:   	sra	%l2, 0x16, %o1
	.word	0xaf3c8014	! t0_kref+0x1c4c:   	sra	%l2, %l4, %l7
	.word	0xab3da004	! t0_kref+0x1c50:   	sra	%l6, 0x4, %l5
	call	SYM(t0_subr0)
	.word	0x9da000b0	! t0_kref+0x1c58:   	fnegs	%f16, %f14
	.word	0x39480001	! t0_kref+0x1c5c:   	fbuge,a,pt	%fcc0, _kref+0x1c60
	.word	0xe6500018	! t0_kref+0x1c60:   	ldsh	[%g0 + %i0], %l3
	.word	0xada58d2a	! t0_kref+0x1c64:   	fsmuld	%f22, %f10, %f22
	call	SYM(t0_subr2)
	.word	0xd9be5a1d	! t0_kref+0x1c6c:   	stda	%f12, [%i1 + %i5]0xd0
	.word	0xe40861f8	! t0_kref+0x1c70:   	ldub	[%g1 + 0x1f8], %l2
	.word	0xa41ca00c	! t0_kref+0x1c74:   	xor	%l2, 0xc, %l2
	.word	0xe42861f8	! t0_kref+0x1c78:   	stb	%l2, [%g1 + 0x1f8]
	.word	0x81d861f8	! t0_kref+0x1c7c:   	flush	%g1 + 0x1f8
	.word	0xc016200a	! t0_kref+0x1c80:   	lduh	[%i0 + 0xa], %g0
2:	.word	0x9325b1b6	! t0_kref+0x1c84:   	mulscc	%l6, -0xe4a, %o1
	.word	0xe3b8a040	! t0_kref+0x1c88:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x9de3bfa0	! t0_kref+0x1c8c:   	save	%sp, -0x60, %sp
	.word	0xba87001b	! t0_kref+0x1c90:   	addcc	%i4, %i3, %i5
	.word	0x91ee8019	! t0_kref+0x1c94:   	restore	%i2, %i1, %o0
	.word	0x81848000	! t0_kref+0x1c98:   	wr	%l2, %g0, %y
	.word	0xa81cc015	! t0_kref+0x1c9c:   	xor	%l3, %l5, %l4
	.word	0x97b58240	! t0_kref+0x1ca0:   	array16	%l6, %g0, %o3
	.word	0xeaa81019	! t0_kref+0x1ca4:   	stba	%l5, [%g0 + %i1]0x80
	.word	0xa9b304d2	! t0_kref+0x1ca8:   	fcmpne32	%f12, %f18, %l4
	.word	0x81dd8014	! t0_kref+0x1cac:   	flush	%l6 + %l4
	.word	0xada0190c	! t0_kref+0x1cb0:   	fitod	%f12, %f22
	.word	0xe8981018	! t0_kref+0x1cb4:   	ldda	[%g0 + %i0]0x80, %l4
	.word	0x923cf27a	! t0_kref+0x1cb8:   	xnor	%l3, -0xd86, %o1
	.word	0x95700015	! t0_kref+0x1cbc:   	popc	%l5, %o2
	.word	0x8ba24830	! t0_kref+0x1cc0:   	fadds	%f9, %f16, %f5
	.word	0x95b30a8e	! t0_kref+0x1cc4:   	fpsub16	%f12, %f14, %f10
	.word	0xe4ae501a	! t0_kref+0x1cc8:   	stba	%l2, [%i1 + %i2]0x80
	.word	0x95b084ce	! t0_kref+0x1ccc:   	fcmpne32	%f2, %f14, %o2
	.word	0xc398a080	! t0_kref+0x1cd0:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0x969c8012	! t0_kref+0x1cd4:   	xorcc	%l2, %l2, %o3
	.word	0x81850000	! t0_kref+0x1cd8:   	wr	%l4, %g0, %y
	.word	0xd586501c	! t0_kref+0x1cdc:   	lda	[%i1 + %i4]0x80, %f10
	.word	0xaa550013	! t0_kref+0x1ce0:   	umul	%l4, %l3, %l5
	.word	0xafb58155	! t0_kref+0x1ce4:   	edge32l	%l6, %l5, %l7
	.word	0x91b10f48	! t0_kref+0x1ce8:   	fornot1	%f4, %f8, %f8
	call	SYM(t0_subr1)
	.word	0xa3b38452	! t0_kref+0x1cf0:   	fcmpne16	%f14, %f18, %l1
	.word	0x86102008	! t0_kref+0x1cf4:   	mov	0x8, %g3
	.word	0x86a0e001	! t0_kref+0x1cf8:   	subcc	%g3, 1, %g3
	.word	0x22800015	! t0_kref+0x1cfc:   	be,a	_kref+0x1d50
	.word	0x8da0884e	! t0_kref+0x1d00:   	faddd	%f2, %f14, %f6
	.word	0xaa04b452	! t0_kref+0x1d04:   	add	%l2, -0xbae, %l5
	.word	0x99b107d0	! t0_kref+0x1d08:   	pdist	%f4, %f16, %f12
	.word	0x933d8013	! t0_kref+0x1d0c:   	sra	%l6, %l3, %o1
	.word	0xcd267ffc	! t0_kref+0x1d10:   	st	%f6, [%i1 - 4]
	.word	0xa7a00528	! t0_kref+0x1d14:   	fsqrts	%f8, %f19
	.word	0xda070000	! t0_kref+0x1d18:   	ld	[%i4], %o5
	.word	0x89b086e6	! t0_kref+0x1d1c:   	fmul8ulx16	%f2, %f6, %f4
	.word	0x904570ac	! t0_kref+0x1d20:   	addc	%l5, -0xf54, %o0
	.word	0x99a0190d	! t0_kref+0x1d24:   	fitod	%f13, %f12
	.word	0x97a0002b	! t0_kref+0x1d28:   	fmovs	%f11, %f11
	.word	0x99a44929	! t0_kref+0x1d2c:   	fmuls	%f17, %f9, %f12
	.word	0xa6bcc016	! t0_kref+0x1d30:   	xnorcc	%l3, %l6, %l3
	call	SYM(t0_subr1)
	.word	0x9da01910	! t0_kref+0x1d38:   	fitod	%f16, %f14
	.word	0x93a3c8a8	! t0_kref+0x1d3c:   	fsubs	%f15, %f8, %f9
	.word	0x89b38aa5	! t0_kref+0x1d40:   	fpsub16s	%f14, %f5, %f4
	.word	0x81858000	! t0_kref+0x1d44:   	wr	%l6, %g0, %y
	.word	0x8143c000	! t0_kref+0x1d48:   	stbar
	.word	0x9db40ac6	! t0_kref+0x1d4c:   	fpsub32	%f16, %f6, %f14
	.word	0xa63ca569	! t0_kref+0x1d50:   	xnor	%l2, 0x569, %l3
	.word	0xe048a02a	! t0_kref+0x1d54:   	ldsb	[%g2 + 0x2a], %l0
	.word	0x81daea34	! t0_kref+0x1d58:   	flush	%o3 + 0xa34
	.word	0x81858000	! t0_kref+0x1d5c:   	wr	%l6, %g0, %y
	.word	0x80a4b175	! t0_kref+0x1d60:   	cmp	%l2, -0xe8b
	.word	0xa1b286c8	! t0_kref+0x1d64:   	fmul8sux16	%f10, %f8, %f16
	.word	0xd9be1815	! t0_kref+0x1d68:   	stda	%f12, [%i0 + %l5]0xc0
	.word	0xa224bfdb	! t0_kref+0x1d6c:   	sub	%l2, -0x25, %l1
	.word	0x93252a30	! t0_kref+0x1d70:   	mulscc	%l4, 0xa30, %o1
	.word	0xd840a000	! t0_kref+0x1d74:   	ldsw	[%g2], %o4
	.word	0x801d28b9	! t0_kref+0x1d78:   	xor	%l4, 0x8b9, %g0
	.word	0x86102001	! t0_kref+0x1d7c:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x1d80:   	bne,a	_kref+0x1d80
	.word	0x86a0e001	! t0_kref+0x1d84:   	subcc	%g3, 1, %g3
	.word	0x92a58014	! t0_kref+0x1d88:   	subcc	%l6, %l4, %o1
	.word	0x9ba00530	! t0_kref+0x1d8c:   	fsqrts	%f16, %f13
	.word	0x8da50856	! t0_kref+0x1d90:   	faddd	%f20, %f22, %f6
	.word	0xa0f57e41	! t0_kref+0x1d94:   	udivcc	%l5, -0x1bf, %l0
	.word	0x8184c000	! t0_kref+0x1d98:   	wr	%l3, %g0, %y
	.word	0x35480004	! t0_kref+0x1d9c:   	fbue,a,pt	%fcc0, _kref+0x1dac
	.word	0x97a00536	! t0_kref+0x1da0:   	fsqrts	%f22, %f11
	.word	0x81ad8a2d	! t0_kref+0x1da4:   	fcmps	%fcc0, %f22, %f13
	.word	0x8da00542	! t0_kref+0x1da8:   	fsqrtd	%f2, %f6
	.word	0x93b4c0b3	! t0_kref+0x1dac:   	edge16n	%l3, %l3, %o1
	.word	0x9fb00cec	! t0_kref+0x1db0:   	fnot2s	%f12, %f15
	.word	0x8bb28c66	! t0_kref+0x1db4:   	fnors	%f10, %f6, %f5
	call	SYM(t0_subr0)
	.word	0xe8801019	! t0_kref+0x1dbc:   	lda	[%g0 + %i1]0x80, %l4
	.word	0xe6280018	! t0_kref+0x1dc0:   	stb	%l3, [%g0 + %i0]
	.word	0x81a9ca35	! t0_kref+0x1dc4:   	fcmps	%fcc0, %f7, %f21
	.word	0xc1bf5a19	! t0_kref+0x1dc8:   	stda	%f0, [%i5 + %i1]0xd0
	.word	0xab256dc4	! t0_kref+0x1dcc:   	mulscc	%l5, 0xdc4, %l5
	.word	0x943cc014	! t0_kref+0x1dd0:   	xnor	%l3, %l4, %o2
	.word	0xe440a008	! t0_kref+0x1dd4:   	ldsw	[%g2 + 8], %l2
	.word	0x95a01911	! t0_kref+0x1dd8:   	fitod	%f17, %f10
	.word	0x9ba00531	! t0_kref+0x1ddc:   	fsqrts	%f17, %f13
	.word	0xa13ca00c	! t0_kref+0x1de0:   	sra	%l2, 0xc, %l0
	.word	0xd11e3ff8	! t0_kref+0x1de4:   	ldd	[%i0 - 8], %f8
	.word	0x81ab8a42	! t0_kref+0x1de8:   	fcmpd	%fcc0, %f14, %f2
	.word	0x9fa00523	! t0_kref+0x1dec:   	fsqrts	%f3, %f15
	.word	0xadb00c00	! t0_kref+0x1df0:   	fzero	%f22
	.word	0x8143c000	! t0_kref+0x1df4:   	stbar
	.word	0xac05ba10	! t0_kref+0x1df8:   	add	%l6, -0x5f0, %l6
	.word	0xec20a030	! t0_kref+0x1dfc:   	st	%l6, [%g2 + 0x30]
	.word	0xe7270018	! t0_kref+0x1e00:   	st	%f19, [%i4 + %i0]
	.word	0xa29ced7c	! t0_kref+0x1e04:   	xorcc	%l3, 0xd7c, %l1
	.word	0xedf65015	! t0_kref+0x1e08:   	casxa	[%i1]0x80, %l5, %l6
	.word	0xaaf573a5	! t0_kref+0x1e0c:   	udivcc	%l5, -0xc5b, %l5
	.word	0xa8756462	! t0_kref+0x1e10:   	udiv	%l5, 0x462, %l4
	.word	0x809d4012	! t0_kref+0x1e14:   	xorcc	%l5, %l2, %g0
	.word	0xd7064000	! t0_kref+0x1e18:   	ld	[%i1], %f11
	.word	0xe2f81018	! t0_kref+0x1e1c:   	swapa	[%g0 + %i0]0x80, %l1
	.word	0x9e056684	! t0_kref+0x1e20:   	add	%l5, 0x684, %o7
	.word	0xa5a20846	! t0_kref+0x1e24:   	faddd	%f8, %f6, %f18
	.word	0x8143c000	! t0_kref+0x1e28:   	stbar
	.word	0xde90105b	! t0_kref+0x1e2c:   	lduha	[%g0 + %i3]0x82, %o7
	.word	0x89b00c00	! t0_kref+0x1e30:   	fzero	%f4
	.word	0x35480008	! t0_kref+0x1e34:   	fbue,a,pt	%fcc0, _kref+0x1e54
	.word	0x9ae5b499	! t0_kref+0x1e38:   	subccc	%l6, -0xb67, %o5
	.word	0xe91e2010	! t0_kref+0x1e3c:   	ldd	[%i0 + 0x10], %f20
	.word	0xabb1cef3	! t0_kref+0x1e40:   	fornot2s	%f7, %f19, %f21
	.word	0xc9be5815	! t0_kref+0x1e44:   	stda	%f4, [%i1 + %l5]0xc0
	.word	0xa9b00f0c	! t0_kref+0x1e48:   	fsrc2	%f12, %f20
	.word	0xa4658013	! t0_kref+0x1e4c:   	subc	%l6, %l3, %l2
	.word	0xd808a028	! t0_kref+0x1e50:   	ldub	[%g2 + 0x28], %o4
	.word	0x9ea4f25f	! t0_kref+0x1e54:   	subcc	%l3, -0xda1, %o7
	.word	0x34800008	! t0_kref+0x1e58:   	bg,a	_kref+0x1e78
	.word	0xe630a038	! t0_kref+0x1e5c:   	sth	%l3, [%g2 + 0x38]
	.word	0x9da288c8	! t0_kref+0x1e60:   	fsubd	%f10, %f8, %f14
	.word	0xe42e7ff9	! t0_kref+0x1e64:   	stb	%l2, [%i1 - 7]
	.word	0xe920a010	! t0_kref+0x1e68:   	st	%f20, [%g2 + 0x10]
	.word	0xc3ee5016	! t0_kref+0x1e6c:   	prefetcha	%i1 + %l6, 1
	.word	0xa7b00cf5	! t0_kref+0x1e70:   	fnot2s	%f21, %f19
	.word	0xa634a5bf	! t0_kref+0x1e74:   	orn	%l2, 0x5bf, %l3
	.word	0x95b2ca29	! t0_kref+0x1e78:   	fpadd16s	%f11, %f9, %f10
	.word	0xc807bfec	! t0_kref+0x1e7c:   	ld	[%fp - 0x14], %g4
	.word	0xaba01a2b	! t0_kref+0x1e80:   	fstoi	%f11, %f21
	.word	0xe8ce5000	! t0_kref+0x1e84:   	ldsba	[%i1]0x80, %l4
	.word	0x9e750012	! t0_kref+0x1e88:   	udiv	%l4, %l2, %o7
	.word	0xea4e0000	! t0_kref+0x1e8c:   	ldsb	[%i0], %l5
	.word	0xd0080019	! t0_kref+0x1e90:   	ldub	[%g0 + %i1], %o0
	.word	0x8db30d08	! t0_kref+0x1e94:   	fandnot1	%f12, %f8, %f6
	.word	0xe1263fec	! t0_kref+0x1e98:   	st	%f16, [%i0 - 0x14]
	.word	0x95254014	! t0_kref+0x1e9c:   	mulscc	%l5, %l4, %o2
	.word	0x9f248016	! t0_kref+0x1ea0:   	mulscc	%l2, %l6, %o7
	.word	0xe420a000	! t0_kref+0x1ea4:   	st	%l2, [%g2]
	.word	0xe46e3ff2	! t0_kref+0x1ea8:   	ldstub	[%i0 - 0xe], %l2
	.word	0xa304bc06	! t0_kref+0x1eac:   	taddcc	%l2, -0x3fa, %l1
	.word	0xe00e401a	! t0_kref+0x1eb0:   	ldub	[%i1 + %i2], %l0
	.word	0xe3b8a040	! t0_kref+0x1eb4:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x95248013	! t0_kref+0x1eb8:   	mulscc	%l2, %l3, %o2
	.word	0x9a3cc013	! t0_kref+0x1ebc:   	xnor	%l3, %l3, %o5
	.word	0xd1f65012	! t0_kref+0x1ec0:   	casxa	[%i1]0x80, %l2, %o0
	.word	0xc9be5a5b	! t0_kref+0x1ec4:   	stda	%f4, [%i1 + %i3]0xd2
	.word	0xc398a080	! t0_kref+0x1ec8:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0xeaff1018	! t0_kref+0x1ecc:   	swapa	[%i4 + %i0]0x80, %l5
	.word	0x95a00554	! t0_kref+0x1ed0:   	fsqrtd	%f20, %f10
	.word	0x9834ed08	! t0_kref+0x1ed4:   	orn	%l3, 0xd08, %o4
	.word	0x99b14aad	! t0_kref+0x1ed8:   	fpsub16s	%f5, %f13, %f12
	.word	0xa2a4fd46	! t0_kref+0x1edc:   	subcc	%l3, -0x2ba, %l1
	.word	0x20480002	! t0_kref+0x1ee0:   	bn,a,pt	%icc, _kref+0x1ee8
	.word	0x91a00544	! t0_kref+0x1ee4:   	fsqrtd	%f4, %f8
	.word	0xdb070018	! t0_kref+0x1ee8:   	ld	[%i4 + %i0], %f13
	.word	0x9a9d8012	! t0_kref+0x1eec:   	xorcc	%l6, %l2, %o5
	.word	0xa5b18d86	! t0_kref+0x1ef0:   	fxor	%f6, %f6, %f18
	.word	0x963d369f	! t0_kref+0x1ef4:   	xnor	%l4, -0x961, %o3
	.word	0xd99e1a5d	! t0_kref+0x1ef8:   	ldda	[%i0 + %i5]0xd2, %f12
	sethi	%hi(2f), %o7
	.word	0xe40be320	! t0_kref+0x1f00:   	ldub	[%o7 + 0x320], %l2
	.word	0xa41ca00c	! t0_kref+0x1f04:   	xor	%l2, 0xc, %l2
	.word	0xe42be320	! t0_kref+0x1f08:   	stb	%l2, [%o7 + 0x320]
	.word	0x81dbe320	! t0_kref+0x1f0c:   	flush	%o7 + 0x320
	.word	0x91a0012b	! t0_kref+0x1f10:   	fabss	%f11, %f8
	.word	0xa9b50e80	! t0_kref+0x1f14:   	fsrc1	%f20, %f20
	.word	0xd9180019	! t0_kref+0x1f18:   	ldd	[%g0 + %i1], %f12
	.word	0x89a488cc	! t0_kref+0x1f1c:   	fsubd	%f18, %f12, %f4
2:	.word	0x89b38f46	! t0_kref+0x1f20:   	fornot1	%f14, %f6, %f4
	.word	0xa7a01a46	! t0_kref+0x1f24:   	fdtoi	%f6, %f19
	.word	0xdd180019	! t0_kref+0x1f28:   	ldd	[%g0 + %i1], %f14
	.word	0x913d600e	! t0_kref+0x1f2c:   	sra	%l5, 0xe, %o0
	.word	0xa7a248b1	! t0_kref+0x1f30:   	fsubs	%f9, %f17, %f19
	.word	0x9de3bfa0	! t0_kref+0x1f34:   	save	%sp, -0x60, %sp
	.word	0xb036001b	! t0_kref+0x1f38:   	orn	%i0, %i3, %i0
	.word	0x91e8001c	! t0_kref+0x1f3c:   	restore	%g0, %i4, %o0
	.word	0x95a488ca	! t0_kref+0x1f40:   	fsubd	%f18, %f10, %f10
	.word	0x39480003	! t0_kref+0x1f44:   	fbuge,a,pt	%fcc0, _kref+0x1f50
	.word	0x8fa01a28	! t0_kref+0x1f48:   	fstoi	%f8, %f7
	.word	0xa3a00531	! t0_kref+0x1f4c:   	fsqrts	%f17, %f17
	.word	0xa5b58174	! t0_kref+0x1f50:   	edge32ln	%l6, %l4, %l2
	.word	0xcd1e401d	! t0_kref+0x1f54:   	ldd	[%i1 + %i5], %f6
	.word	0xec28a008	! t0_kref+0x1f58:   	stb	%l6, [%g2 + 8]
	.word	0xe636c018	! t0_kref+0x1f5c:   	sth	%l3, [%i3 + %i0]
	.word	0xadb24f76	! t0_kref+0x1f60:   	fornot1s	%f9, %f22, %f22
	.word	0xa9b58333	! t0_kref+0x1f64:   	bmask	%l6, %l3, %l4
	.word	0xaf400000	! t0_kref+0x1f68:   	mov	%y, %l7
	.word	0xae74a92c	! t0_kref+0x1f6c:   	udiv	%l2, 0x92c, %l7
	.word	0x81850000	! t0_kref+0x1f70:   	wr	%l4, %g0, %y
	.word	0x90e4c014	! t0_kref+0x1f74:   	subccc	%l3, %l4, %o0
	.word	0x85856a27	! t0_kref+0x1f78:   	wr	%l5, 0xa27, %ccr
	.word	0xd99f5019	! t0_kref+0x1f7c:   	ldda	[%i5 + %i1]0x80, %f12
	.word	0x93b58504	! t0_kref+0x1f80:   	fcmpgt16	%f22, %f4, %o1
	.word	0x901dab53	! t0_kref+0x1f84:   	xor	%l6, 0xb53, %o0
	.word	0xc99f5a58	! t0_kref+0x1f88:   	ldda	[%i5 + %i0]0xd2, %f4
	.word	0x81dbb81e	! t0_kref+0x1f8c:   	flush	%sp - 0x7e2
	.word	0xc768a10a	! t0_kref+0x1f90:   	prefetch	%g2 + 0x10a, 3
	.word	0xe6262010	! t0_kref+0x1f94:   	st	%l3, [%i0 + 0x10]
	.word	0x9884b3c1	! t0_kref+0x1f98:   	addcc	%l2, -0xc3f, %o4
	.word	0x2f480007	! t0_kref+0x1f9c:   	fbu,a,pt	%fcc0, _kref+0x1fb8
	.word	0x94e4fec6	! t0_kref+0x1fa0:   	subccc	%l3, -0x13a, %o2
	.word	0xa1b30a48	! t0_kref+0x1fa4:   	fpadd32	%f12, %f8, %f16
	.word	0x9161a23e	! t0_kref+0x1fa8:   	movg	%fcc0, 0x23e, %o0
	.word	0xa054ac70	! t0_kref+0x1fac:   	umul	%l2, 0xc70, %l0
	.word	0xa5b00c00	! t0_kref+0x1fb0:   	fzero	%f18
	.word	0x97a000b5	! t0_kref+0x1fb4:   	fnegs	%f21, %f11
	.word	0xa9b10f4a	! t0_kref+0x1fb8:   	fornot1	%f4, %f10, %f20
	.word	0x81d8000c	! t0_kref+0x1fbc:   	flush	%g0 + %o4
	.word	0xe62e600e	! t0_kref+0x1fc0:   	stb	%l3, [%i1 + 0xe]
	.word	0xae5d0013	! t0_kref+0x1fc4:   	smul	%l4, %l3, %l7
	.word	0xd08e9019	! t0_kref+0x1fc8:   	lduba	[%i2 + %i1]0x80, %o0
	.word	0x99a00148	! t0_kref+0x1fcc:   	fabsd	%f8, %f12
	.word	0x81a94a24	! t0_kref+0x1fd0:   	fcmps	%fcc0, %f5, %f4
	.word	0xe46e6013	! t0_kref+0x1fd4:   	ldstub	[%i1 + 0x13], %l2
	.word	0x91a01906	! t0_kref+0x1fd8:   	fitod	%f6, %f8
	.word	0x9de3bfa0	! t0_kref+0x1fdc:   	save	%sp, -0x60, %sp
	.word	0xb4600019	! t0_kref+0x1fe0:   	subc	%g0, %i1, %i2
	.word	0xabef3892	! t0_kref+0x1fe4:   	restore	%i4, -0x76e, %l5
	.word	0x9214eccb	! t0_kref+0x1fe8:   	or	%l3, 0xccb, %o1
	.word	0x803d0015	! t0_kref+0x1fec:   	xnor	%l4, %l5, %g0
	.word	0x81ad0a2e	! t0_kref+0x1ff0:   	fcmps	%fcc0, %f20, %f14
	.word	0x8db00c00	! t0_kref+0x1ff4:   	fzero	%f6
	.word	0x97256447	! t0_kref+0x1ff8:   	mulscc	%l5, 0x447, %o3
	.word	0xadb4c012	! t0_kref+0x1ffc:   	edge8	%l3, %l2, %l6
	.word	0x8da248ae	! t0_kref+0x2000:   	fsubs	%f9, %f14, %f6
	.word	0x9de3bfa0	! t0_kref+0x2004:   	save	%sp, -0x60, %sp
	.word	0x93eefde7	! t0_kref+0x2008:   	restore	%i3, -0x219, %o1
	.word	0x9ba00526	! t0_kref+0x200c:   	fsqrts	%f6, %f13
	.word	0x945d68a4	! t0_kref+0x2010:   	smul	%l5, 0x8a4, %o2
	.word	0xea20a038	! t0_kref+0x2014:   	st	%l5, [%g2 + 0x38]
	.word	0xc368a003	! t0_kref+0x2018:   	prefetch	%g2 + 3, 1
	.word	0xa9a108c4	! t0_kref+0x201c:   	fsubd	%f4, %f4, %f20
	.word	0x99a0054c	! t0_kref+0x2020:   	fsqrtd	%f12, %f12
	.word	0x85b34975	! t0_kref+0x2024:   	fpmerge	%f13, %f21, %f2
	.word	0xa5a01a54	! t0_kref+0x2028:   	fdtoi	%f20, %f18
	.word	0xd64e6012	! t0_kref+0x202c:   	ldsb	[%i1 + 0x12], %o3
	.word	0xe430a008	! t0_kref+0x2030:   	sth	%l2, [%g2 + 8]
	.word	0xac55a602	! t0_kref+0x2034:   	umul	%l6, 0x602, %l6
	.word	0xd25e7fe8	! t0_kref+0x2038:   	ldx	[%i1 - 0x18], %o1
	.word	0xabb50153	! t0_kref+0x203c:   	edge32l	%l4, %l3, %l5
	.word	0xb8103ff0	! t0_kref+0x2040:   	mov	0xfffffff0, %i4
	.word	0xa53cc013	! t0_kref+0x2044:   	sra	%l3, %l3, %l2
	call	SYM(t0_subr1)
	.word	0x91b406e8	! t0_kref+0x204c:   	fmul8ulx16	%f16, %f8, %f8
	.word	0xc168a04c	! t0_kref+0x2050:   	prefetch	%g2 + 0x4c, 0
	.word	0xad2d8014	! t0_kref+0x2054:   	sll	%l6, %l4, %l6
	.word	0xa3a0108a	! t0_kref+0x2058:   	fxtos	%f10, %f17
	.word	0xe40865e0	! t0_kref+0x205c:   	ldub	[%g1 + 0x5e0], %l2
	.word	0xa41ca00c	! t0_kref+0x2060:   	xor	%l2, 0xc, %l2
	.word	0xe42865e0	! t0_kref+0x2064:   	stb	%l2, [%g1 + 0x5e0]
	.word	0x81d865e0	! t0_kref+0x2068:   	flush	%g1 + 0x5e0
2:	.word	0xe4b01018	! t0_kref+0x206c:   	stha	%l2, [%g0 + %i0]0x80
	.word	0xada38848	! t0_kref+0x2070:   	faddd	%f14, %f8, %f22
	.word	0x8da01906	! t0_kref+0x2074:   	fitod	%f6, %f6
	sethi	%hi(2f), %o7
	.word	0xe40be0c0	! t0_kref+0x207c:   	ldub	[%o7 + 0xc0], %l2
	.word	0xa41ca00c	! t0_kref+0x2080:   	xor	%l2, 0xc, %l2
	.word	0xe42be0c0	! t0_kref+0x2084:   	stb	%l2, [%o7 + 0xc0]
	.word	0x81dbe0c0	! t0_kref+0x2088:   	flush	%o7 + 0xc0
	.word	0x33480008	! t0_kref+0x208c:   	fbe,a,pt	%fcc0, _kref+0x20ac
	.word	0x9db50e80	! t0_kref+0x2090:   	fsrc1	%f20, %f14
	.word	0xadb1096f	! t0_kref+0x2094:   	fpmerge	%f4, %f15, %f22
	.word	0x95b50975	! t0_kref+0x2098:   	fpmerge	%f20, %f21, %f10
	.word	0xae554012	! t0_kref+0x209c:   	umul	%l5, %l2, %l7
	.word	0x30480007	! t0_kref+0x20a0:   	ba,a,pt	%icc, _kref+0x20bc
	.word	0xa88c8013	! t0_kref+0x20a4:   	andcc	%l2, %l3, %l4
	.word	0xada54d31	! t0_kref+0x20a8:   	fsmuld	%f21, %f17, %f22
	.word	0xa1a0190e	! t0_kref+0x20ac:   	fitod	%f14, %f16
	.word	0x81abcaa6	! t0_kref+0x20b0:   	fcmpes	%fcc0, %f15, %f6
	.word	0x8db30d10	! t0_kref+0x20b4:   	fandnot1	%f12, %f16, %f6
	.word	0x8db10a86	! t0_kref+0x20b8:   	fpsub16	%f4, %f6, %f6
	.word	0x9ba00126	! t0_kref+0x20bc:   	fabss	%f6, %f13
2:	.word	0xc926201c	! t0_kref+0x20c0:   	st	%f4, [%i0 + 0x1c]
	.word	0xe4086674	! t0_kref+0x20c4:   	ldub	[%g1 + 0x674], %l2
	.word	0xa41ca00c	! t0_kref+0x20c8:   	xor	%l2, 0xc, %l2
	.word	0xe4286674	! t0_kref+0x20cc:   	stb	%l2, [%g1 + 0x674]
	.word	0x81d86674	! t0_kref+0x20d0:   	flush	%g1 + 0x674
	.word	0x9db40ea0	! t0_kref+0x20d4:   	fsrc1s	%f16, %f14
	.word	0x9e34b25c	! t0_kref+0x20d8:   	orn	%l2, -0xda4, %o7
	.word	0xada01935	! t0_kref+0x20dc:   	fstod	%f21, %f22
	.word	0x9abcb894	! t0_kref+0x20e0:   	xnorcc	%l2, -0x76c, %o5
	.word	0x99b286e8	! t0_kref+0x20e4:   	fmul8ulx16	%f10, %f8, %f12
	.word	0x91b204ca	! t0_kref+0x20e8:   	fcmpne32	%f8, %f10, %o0
	.word	0x95a01908	! t0_kref+0x20ec:   	fitod	%f8, %f10
	.word	0x80f4c016	! t0_kref+0x20f0:   	udivcc	%l3, %l6, %g0
	.word	0x81aa8a4a	! t0_kref+0x20f4:   	fcmpd	%fcc0, %f10, %f10
	.word	0x89b20ec4	! t0_kref+0x20f8:   	fornot2	%f8, %f4, %f4
	.word	0xa1a50850	! t0_kref+0x20fc:   	faddd	%f20, %f16, %f16
2:	.word	0xa1b4c972	! t0_kref+0x2100:   	fpmerge	%f19, %f18, %f16
	.word	0x9e358012	! t0_kref+0x2104:   	orn	%l6, %l2, %o7
	.word	0x9e9ca4d2	! t0_kref+0x2108:   	xorcc	%l2, 0x4d2, %o7
	.word	0x81ad8acc	! t0_kref+0x210c:   	fcmped	%fcc0, %f22, %f12
	.word	0x97a0052b	! t0_kref+0x2110:   	fsqrts	%f11, %f11
	sethi	%hi(2f), %o7
	.word	0xe40be15c	! t0_kref+0x2118:   	ldub	[%o7 + 0x15c], %l2
	.word	0xa41ca00c	! t0_kref+0x211c:   	xor	%l2, 0xc, %l2
	.word	0xe42be15c	! t0_kref+0x2120:   	stb	%l2, [%o7 + 0x15c]
	.word	0x81dbe15c	! t0_kref+0x2124:   	flush	%o7 + 0x15c
	.word	0xe89e5000	! t0_kref+0x2128:   	ldda	[%i1]0x80, %l4
	.word	0xad052add	! t0_kref+0x212c:   	taddcc	%l4, 0xadd, %l6
	.word	0x22480008	! t0_kref+0x2130:   	be,a,pt	%icc, _kref+0x2150
	.word	0xee062014	! t0_kref+0x2134:   	ld	[%i0 + 0x14], %l7
	.word	0xeb871018	! t0_kref+0x2138:   	lda	[%i4 + %i0]0x80, %f21
	.word	0x9b254015	! t0_kref+0x213c:   	mulscc	%l5, %l5, %o5
	.word	0xadb2cf66	! t0_kref+0x2140:   	fornot1s	%f11, %f6, %f22
	.word	0x91b2854e	! t0_kref+0x2144:   	fcmpeq16	%f10, %f14, %o0
	.word	0x803d4014	! t0_kref+0x2148:   	xnor	%l5, %l4, %g0
	.word	0x8055314f	! t0_kref+0x214c:   	umul	%l4, -0xeb1, %g0
	.word	0xc807bfec	! t0_kref+0x2150:   	ld	[%fp - 0x14], %g4
	.word	0xe7ee501b	! t0_kref+0x2154:   	prefetcha	%i1 + %i3, 19
	.word	0x95b38744	! t0_kref+0x2158:   	fpack32	%f14, %f4, %f10
2:	.word	0xe0462000	! t0_kref+0x215c:   	ldsw	[%i0], %l0
	.word	0xe820a028	! t0_kref+0x2160:   	st	%l4, [%g2 + 0x28]
	.word	0xafb50490	! t0_kref+0x2164:   	fcmple32	%f20, %f16, %l7
	.word	0x89a000a5	! t0_kref+0x2168:   	fnegs	%f5, %f4
	.word	0xa5b50355	! t0_kref+0x216c:   	alignaddrl	%l4, %l5, %l2
	.word	0xadb48456	! t0_kref+0x2170:   	fcmpne16	%f18, %f22, %l6
	.word	0xe5180019	! t0_kref+0x2174:   	ldd	[%g0 + %i1], %f18
	.word	0xa5b28fb3	! t0_kref+0x2178:   	fors	%f10, %f19, %f18
	.word	0x97b48335	! t0_kref+0x217c:   	bmask	%l2, %l5, %o3
	.word	0x8584c013	! t0_kref+0x2180:   	wr	%l3, %l3, %ccr
	.word	0xcd20a008	! t0_kref+0x2184:   	st	%f6, [%g2 + 8]
	.word	0x95b30a46	! t0_kref+0x2188:   	fpadd32	%f12, %f6, %f10
	.word	0xa5b50556	! t0_kref+0x218c:   	fcmpeq16	%f20, %f22, %l2
	.word	0xae9c8012	! t0_kref+0x2190:   	xorcc	%l2, %l2, %l7
	.word	0xadb3ccab	! t0_kref+0x2194:   	fandnot2s	%f15, %f11, %f22
	.word	0x81a98aac	! t0_kref+0x2198:   	fcmpes	%fcc0, %f6, %f12
	.word	0x8143c000	! t0_kref+0x219c:   	stbar
	.word	0x21480002	! t0_kref+0x21a0:   	fbn,a,pt	%fcc0, _kref+0x21a8
	.word	0xc398a080	! t0_kref+0x21a4:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0x99662346	! t0_kref+0x21a8:   	mova	%icc, 0x346, %o4
	.word	0xe1070019	! t0_kref+0x21ac:   	ld	[%i4 + %i1], %f16
	.word	0xc720a008	! t0_kref+0x21b0:   	st	%f3, [%g2 + 8]
	.word	0x89a01907	! t0_kref+0x21b4:   	fitod	%f7, %f4
	.word	0x9a1cc015	! t0_kref+0x21b8:   	xor	%l3, %l5, %o5
	.word	0x8610200c	! t0_kref+0x21bc:   	mov	0xc, %g3
	.word	0x86a0e001	! t0_kref+0x21c0:   	subcc	%g3, 1, %g3
	.word	0x2280001d	! t0_kref+0x21c4:   	be,a	_kref+0x2238
	.word	0x9da50d31	! t0_kref+0x21c8:   	fsmuld	%f20, %f17, %f14
	.word	0x92f58016	! t0_kref+0x21cc:   	udivcc	%l6, %l6, %o1
	.word	0xe1180019	! t0_kref+0x21d0:   	ldd	[%g0 + %i1], %f16
	.word	0xa5a0004e	! t0_kref+0x21d4:   	fmovd	%f14, %f18
	.word	0x81ac8acc	! t0_kref+0x21d8:   	fcmped	%fcc0, %f18, %f12
	.word	0xab400000	! t0_kref+0x21dc:   	mov	%y, %l5
	.word	0x89a18d2b	! t0_kref+0x21e0:   	fsmuld	%f6, %f11, %f4
	.word	0xa1a28d35	! t0_kref+0x21e4:   	fsmuld	%f10, %f21, %f16
	.word	0x8da00554	! t0_kref+0x21e8:   	fsqrtd	%f20, %f6
	.word	0x374ffff5	! t0_kref+0x21ec:   	fbge,a,pt	%fcc0, _kref+0x21c0
	.word	0xa2ac8013	! t0_kref+0x21f0:   	andncc	%l2, %l3, %l1
	.word	0xd0480019	! t0_kref+0x21f4:   	ldsb	[%g0 + %i1], %o0
	.word	0x3b4ffff2	! t0_kref+0x21f8:   	fble,a,pt	%fcc0, _kref+0x21c0
	.word	0xcd1e2008	! t0_kref+0x21fc:   	ldd	[%i0 + 8], %f6
	.word	0xc7070018	! t0_kref+0x2200:   	ld	[%i4 + %i0], %f3
	.word	0xa415655b	! t0_kref+0x2204:   	or	%l5, 0x55b, %l2
	.word	0x81850000	! t0_kref+0x2208:   	wr	%l4, %g0, %y
	.word	0xa2a4e946	! t0_kref+0x220c:   	subcc	%l3, 0x946, %l1
	.word	0xa8f58014	! t0_kref+0x2210:   	udivcc	%l6, %l4, %l4
	.word	0xd0070018	! t0_kref+0x2214:   	ld	[%i4 + %i0], %o0
	.word	0x93b50013	! t0_kref+0x2218:   	edge8	%l4, %l3, %o1
	.word	0x81400000	! t0_kref+0x221c:   	mov	%y, %g0
	.word	0x334fffe8	! t0_kref+0x2220:   	fbe,a,pt	%fcc0, _kref+0x21c0
	.word	0x99b54280	! t0_kref+0x2224:   	array32	%l5, %g0, %o4
	.word	0x81b38412	! t0_kref+0x2228:   	fcmple16	%f14, %f18, %g0
	.word	0x95b00cc4	! t0_kref+0x222c:   	fnot2	%f4, %f10
	.word	0xadb00f2a	! t0_kref+0x2230:   	fsrc2s	%f10, %f22
	.word	0xa3a00536	! t0_kref+0x2234:   	fsqrts	%f22, %f17
	.word	0xd06e200d	! t0_kref+0x2238:   	ldstub	[%i0 + 0xd], %o0
	.word	0xa5a00528	! t0_kref+0x223c:   	fsqrts	%f8, %f18
	.word	0xa0acc013	! t0_kref+0x2240:   	andncc	%l3, %l3, %l0
	.word	0x90058015	! t0_kref+0x2244:   	add	%l6, %l5, %o0
	.word	0xe82e3ff2	! t0_kref+0x2248:   	stb	%l4, [%i0 - 0xe]
	.word	0x8bb3cfb6	! t0_kref+0x224c:   	fors	%f15, %f22, %f5
	.word	0xa5b18914	! t0_kref+0x2250:   	faligndata	%f6, %f20, %f18
	.word	0xa9b00fc0	! t0_kref+0x2254:   	fone	%f20
	call	SYM(t0_subr0)
	.word	0xad400000	! t0_kref+0x225c:   	mov	%y, %l6
	.word	0x8143c000	! t0_kref+0x2260:   	stbar
	.word	0x81ad0a4a	! t0_kref+0x2264:   	fcmpd	%fcc0, %f20, %f10
	.word	0xe13e401d	! t0_kref+0x2268:   	std	%f16, [%i1 + %i5]
	.word	0x9da488d0	! t0_kref+0x226c:   	fsubd	%f18, %f16, %f14
	.word	0x9de3bfa0	! t0_kref+0x2270:   	save	%sp, -0x60, %sp
	.word	0xb6b6401a	! t0_kref+0x2274:   	orncc	%i1, %i2, %i3
	.word	0xa1e8300c	! t0_kref+0x2278:   	restore	%g0, -0xff4, %l0
	.word	0x8db38c75	! t0_kref+0x227c:   	fnors	%f14, %f21, %f6
	.word	0xd51e401d	! t0_kref+0x2280:   	ldd	[%i1 + %i5], %f10
	.word	0x81ad8ac8	! t0_kref+0x2284:   	fcmped	%fcc0, %f22, %f8
	.word	0x81b404ca	! t0_kref+0x2288:   	fcmpne32	%f16, %f10, %g0
	.word	0x99a00526	! t0_kref+0x228c:   	fsqrts	%f6, %f12
	.word	0x9f3d0013	! t0_kref+0x2290:   	sra	%l4, %l3, %o7
	.word	0xe050a030	! t0_kref+0x2294:   	ldsh	[%g2 + 0x30], %l0
	.word	0x86102001	! t0_kref+0x2298:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x229c:   	bne,a	_kref+0x229c
	.word	0x86a0e001	! t0_kref+0x22a0:   	subcc	%g3, 1, %g3
	.word	0xea2e6004	! t0_kref+0x22a4:   	stb	%l5, [%i1 + 4]
	.word	0xe828a039	! t0_kref+0x22a8:   	stb	%l4, [%g2 + 0x39]
	.word	0xecce9019	! t0_kref+0x22ac:   	ldsba	[%i2 + %i1]0x80, %l6
	.word	0xc807bff0	! t0_kref+0x22b0:   	ld	[%fp - 0x10], %g4
	.word	0xaaa4b24f	! t0_kref+0x22b4:   	subcc	%l2, -0xdb1, %l5
	.word	0x8143c000	! t0_kref+0x22b8:   	stbar
	.word	0x9e14b10f	! t0_kref+0x22bc:   	or	%l2, -0xef1, %o7
	.word	0x993d200d	! t0_kref+0x22c0:   	sra	%l4, 0xd, %o4
	.word	0xd7e61012	! t0_kref+0x22c4:   	casa	[%i0]0x80, %l2, %o3
	.word	0xa7b50316	! t0_kref+0x22c8:   	alignaddr	%l4, %l6, %l3
	.word	0xe0ce9018	! t0_kref+0x22cc:   	ldsba	[%i2 + %i0]0x80, %l0
	.word	0xd808a02b	! t0_kref+0x22d0:   	ldub	[%g2 + 0x2b], %o4
	.word	0x81a98acc	! t0_kref+0x22d4:   	fcmped	%fcc0, %f6, %f12
	.word	0xada30829	! t0_kref+0x22d8:   	fadds	%f12, %f9, %f22
	.word	0x86102001	! t0_kref+0x22dc:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x22e0:   	bne,a	_kref+0x22e0
	.word	0x86a0e001	! t0_kref+0x22e4:   	subcc	%g3, 1, %g3
	.word	0xeb68a082	! t0_kref+0x22e8:   	prefetch	%g2 + 0x82, 21
	call	SYM(t0_subr2)
	.word	0x9da40850	! t0_kref+0x22f0:   	faddd	%f16, %f16, %f14
	.word	0xa2aca11e	! t0_kref+0x22f4:   	andncc	%l2, 0x11e, %l1
	.word	0x2d800006	! t0_kref+0x22f8:   	fbg,a	_kref+0x2310
	.word	0x90058016	! t0_kref+0x22fc:   	add	%l6, %l6, %o0
	.word	0x81ab8ac8	! t0_kref+0x2300:   	fcmped	%fcc0, %f14, %f8
	.word	0xee0e8019	! t0_kref+0x2304:   	ldub	[%i2 + %i1], %l7
	.word	0x9db30974	! t0_kref+0x2308:   	fpmerge	%f12, %f20, %f14
	.word	0x81d93b1d	! t0_kref+0x230c:   	flush	%g4 - 0x4e3
	.word	0xe6563fea	! t0_kref+0x2310:   	ldsh	[%i0 - 0x16], %l3
	.word	0x94848014	! t0_kref+0x2314:   	addcc	%l2, %l4, %o2
	.word	0xa5b50ecc	! t0_kref+0x2318:   	fornot2	%f20, %f12, %f18
	.word	0x81dbc00b	! t0_kref+0x231c:   	flush	%o7 + %o3
	.word	0xea2e2007	! t0_kref+0x2320:   	stb	%l5, [%i0 + 7]
	.word	0xa01d0012	! t0_kref+0x2324:   	xor	%l4, %l2, %l0
	.word	0x91a0012f	! t0_kref+0x2328:   	fabss	%f15, %f8
	.word	0xa5b20634	! t0_kref+0x232c:   	fmul8x16	%f8, %f20, %f18
	.word	0x9ebd3098	! t0_kref+0x2330:   	xnorcc	%l4, -0xf68, %o7
	.word	0xa3b480b2	! t0_kref+0x2334:   	edge16n	%l2, %l2, %l1
	.word	0x8da01a56	! t0_kref+0x2338:   	fdtoi	%f22, %f6
	.word	0xaefc8016	! t0_kref+0x233c:   	sdivcc	%l2, %l6, %l7
	.word	0xc9be1852	! t0_kref+0x2340:   	stda	%f4, [%i0 + %l2]0xc2
	.word	0x9de3bfa0	! t0_kref+0x2344:   	save	%sp, -0x60, %sp
	.word	0x81ee35df	! t0_kref+0x2348:   	restore	%i0, -0xa21, %g0
	.word	0xec263ff4	! t0_kref+0x234c:   	st	%l6, [%i0 - 0xc]
	.word	0xe80e6005	! t0_kref+0x2350:   	ldub	[%i1 + 5], %l4
	.word	0x9db44db3	! t0_kref+0x2354:   	fxors	%f17, %f19, %f14
	.word	0x91a0192d	! t0_kref+0x2358:   	fstod	%f13, %f8
	.word	0x993d6013	! t0_kref+0x235c:   	sra	%l5, 0x13, %o4
	.word	0x99a10948	! t0_kref+0x2360:   	fmuld	%f4, %f8, %f12
	.word	0xc040a020	! t0_kref+0x2364:   	ldsw	[%g2 + 0x20], %g0
	.word	0x8fa38832	! t0_kref+0x2368:   	fadds	%f14, %f18, %f7
	.word	0xe830a008	! t0_kref+0x236c:   	sth	%l4, [%g2 + 8]
	.word	0x9da38852	! t0_kref+0x2370:   	faddd	%f14, %f18, %f14
	.word	0x91b284d2	! t0_kref+0x2374:   	fcmpne32	%f10, %f18, %o0
	.word	0xea28a008	! t0_kref+0x2378:   	stb	%l5, [%g2 + 8]
	.word	0xa1a00532	! t0_kref+0x237c:   	fsqrts	%f18, %f16
	.word	0x8fa0c823	! t0_kref+0x2380:   	fadds	%f3, %f3, %f7
	.word	0xe05e6000	! t0_kref+0x2384:   	ldx	[%i1], %l0
	.word	0x91b00fc0	! t0_kref+0x2388:   	fone	%f8
	.word	0xe2563ff8	! t0_kref+0x238c:   	ldsh	[%i0 - 8], %l1
	.word	0xa62d0012	! t0_kref+0x2390:   	andn	%l4, %l2, %l3
	.word	0x81ab8a2b	! t0_kref+0x2394:   	fcmps	%fcc0, %f14, %f11
	.word	0x81ddc019	! t0_kref+0x2398:   	flush	%l7 + %i1
	.word	0xa1a01a56	! t0_kref+0x239c:   	fdtoi	%f22, %f16
	.word	0xa4a4be1c	! t0_kref+0x23a0:   	subcc	%l2, -0x1e4, %l2
	.word	0x9fc10000	! t0_kref+0x23a4:   	call	%g4
	.word	0x9fab802b	! t0_kref+0x23a8:   	fmovsule	%fcc0, %f11, %f15
	.word	0xa5b009af	! t0_kref+0x23ac:   	fexpand	%f15, %f18
	.word	0x9264c016	! t0_kref+0x23b0:   	subc	%l3, %l6, %o1
	.word	0x8143c000	! t0_kref+0x23b4:   	stbar
	.word	0xec2e2019	! t0_kref+0x23b8:   	stb	%l6, [%i0 + 0x19]
	.word	0x9db00c00	! t0_kref+0x23bc:   	fzero	%f14
	.word	0x98e4bfba	! t0_kref+0x23c0:   	subccc	%l2, -0x46, %o4
	.word	0xa5b0890a	! t0_kref+0x23c4:   	faligndata	%f2, %f10, %f18
	.word	0xa624a409	! t0_kref+0x23c8:   	sub	%l2, 0x409, %l3
	.word	0xdb20a008	! t0_kref+0x23cc:   	st	%f13, [%g2 + 8]
	.word	0xdf861000	! t0_kref+0x23d0:   	lda	[%i0]0x80, %f15
	.word	0xa28da35c	! t0_kref+0x23d4:   	andcc	%l6, 0x35c, %l1
	.word	0xe3b8a040	! t0_kref+0x23d8:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xd87e2008	! t0_kref+0x23dc:   	swap	[%i0 + 8], %o4
	.word	0x95b50055	! t0_kref+0x23e0:   	edge8l	%l4, %l5, %o2
	.word	0xe3b8a040	! t0_kref+0x23e4:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xe01e0000	! t0_kref+0x23e8:   	ldd	[%i0], %l0
	.word	0x8143e040	! t0_kref+0x23ec:   	membar	0x40
	.word	0xf43e6010	! t0_kref+0x23f0:   	std	%i2, [%i1 + 0x10]
	.word	0x927530df	! t0_kref+0x23f4:   	udiv	%l4, -0xf21, %o1
	.word	0x91b38d08	! t0_kref+0x23f8:   	fandnot1	%f14, %f8, %f8
	.word	0x9ba01a52	! t0_kref+0x23fc:   	fdtoi	%f18, %f13
	.word	0x905cfa25	! t0_kref+0x2400:   	smul	%l3, -0x5db, %o0
	.word	0xec180018	! t0_kref+0x2404:   	ldd	[%g0 + %i0], %l6
	.word	0x93a3882d	! t0_kref+0x2408:   	fadds	%f14, %f13, %f9
	.word	0xab408000	! t0_kref+0x240c:   	mov	%ccr, %l5
	.word	0xada00526	! t0_kref+0x2410:   	fsqrts	%f6, %f22
	.word	0x98158012	! t0_kref+0x2414:   	or	%l6, %l2, %o4
	.word	0xa5a00552	! t0_kref+0x2418:   	fsqrtd	%f18, %f18
	.word	0x87a0108e	! t0_kref+0x241c:   	fxtos	%f14, %f3
	.word	0xd5000019	! t0_kref+0x2420:   	ld	[%g0 + %i1], %f10
	.word	0xa2ad0013	! t0_kref+0x2424:   	andncc	%l4, %l3, %l1
	.word	0xeff61014	! t0_kref+0x2428:   	casxa	[%i0]0x80, %l4, %l7
	.word	0xa72d0014	! t0_kref+0x242c:   	sll	%l4, %l4, %l3
	.word	0x81aa4ab0	! t0_kref+0x2430:   	fcmpes	%fcc0, %f9, %f16
	.word	0xa1250014	! t0_kref+0x2434:   	mulscc	%l4, %l4, %l0
	.word	0x3a480003	! t0_kref+0x2438:   	bcc,a,pt	%icc, _kref+0x2444
	.word	0xa9a18944	! t0_kref+0x243c:   	fmuld	%f6, %f4, %f20
	.word	0x95aa4036	! t0_kref+0x2440:   	fmovse	%fcc0, %f22, %f10
	.word	0xa5a0054c	! t0_kref+0x2444:   	fsqrtd	%f12, %f18
	.word	0x9a45b813	! t0_kref+0x2448:   	addc	%l6, -0x7ed, %o5
	.word	0xaa3d0013	! t0_kref+0x244c:   	xnor	%l4, %l3, %l5
	.word	0x93252844	! t0_kref+0x2450:   	mulscc	%l4, 0x844, %o1
	.word	0x8bb40fb1	! t0_kref+0x2454:   	fors	%f16, %f17, %f5
	.word	0xd1066018	! t0_kref+0x2458:   	ld	[%i1 + 0x18], %f8
	.word	0x81ad0ab2	! t0_kref+0x245c:   	fcmpes	%fcc0, %f20, %f18
	.word	0x9b418000	! t0_kref+0x2460:   	mov	%fprs, %o5
	.word	0x81de364a	! t0_kref+0x2464:   	flush	%i0 - 0x9b6
	.word	0x9ab48015	! t0_kref+0x2468:   	orncc	%l2, %l5, %o5
	.word	0xc398a040	! t0_kref+0x246c:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0x8035b5f6	! t0_kref+0x2470:   	orn	%l6, -0xa0a, %g0
	.word	0xada0054a	! t0_kref+0x2474:   	fsqrtd	%f10, %f22
	.word	0xa6a48015	! t0_kref+0x2478:   	subcc	%l2, %l5, %l3
	.word	0x27480003	! t0_kref+0x247c:   	fbul,a,pt	%fcc0, _kref+0x2488
	.word	0x9db306e6	! t0_kref+0x2480:   	fmul8ulx16	%f12, %f6, %f14
	call	SYM(t0_subr3)
	.word	0xaedd3ad8	! t0_kref+0x2488:   	smulcc	%l4, -0x528, %l7
	.word	0x9624c012	! t0_kref+0x248c:   	sub	%l3, %l2, %o3
	.word	0xe8b6d018	! t0_kref+0x2490:   	stha	%l4, [%i3 + %i0]0x80
	.word	0x81aa0a52	! t0_kref+0x2494:   	fcmpd	%fcc0, %f8, %f18
	.word	0x99b44a6f	! t0_kref+0x2498:   	fpadd32s	%f17, %f15, %f12
	.word	0xe9865000	! t0_kref+0x249c:   	lda	[%i1]0x80, %f20
	.word	0x9fc10000	! t0_kref+0x24a0:   	call	%g4
	.word	0x99a0054a	! t0_kref+0x24a4:   	fsqrtd	%f10, %f12
	.word	0x9f158015	! t0_kref+0x24a8:   	taddcctv	%l6, %l5, %o7
	.word	0x85a388c8	! t0_kref+0x24ac:   	fsubd	%f14, %f8, %f2
	.word	0xa2d56fd8	! t0_kref+0x24b0:   	umulcc	%l5, 0xfd8, %l1
	.word	0xaa158015	! t0_kref+0x24b4:   	or	%l6, %l5, %l5
	.word	0xd11e0000	! t0_kref+0x24b8:   	ldd	[%i0], %f8
	.word	0xd11e2000	! t0_kref+0x24bc:   	ldd	[%i0], %f8
	.word	0x9de3bfa0	! t0_kref+0x24c0:   	save	%sp, -0x60, %sp
	.word	0xb6d73280	! t0_kref+0x24c4:   	umulcc	%i4, -0xd80, %i3
	.word	0xa7e8269e	! t0_kref+0x24c8:   	restore	%g0, 0x69e, %l3
	.word	0xe8160000	! t0_kref+0x24cc:   	lduh	[%i0], %l4
	.word	0x93a01a48	! t0_kref+0x24d0:   	fdtoi	%f8, %f9
	.word	0x97b38ee3	! t0_kref+0x24d4:   	fornot2s	%f14, %f3, %f11
	.word	0x36800001	! t0_kref+0x24d8:   	bge,a	_kref+0x24dc
	.word	0xa1a28850	! t0_kref+0x24dc:   	faddd	%f10, %f16, %f16
	.word	0xa9a4c92a	! t0_kref+0x24e0:   	fmuls	%f19, %f10, %f20
	.word	0xdd20a010	! t0_kref+0x24e4:   	st	%f14, [%g2 + 0x10]
	.word	0x2a480002	! t0_kref+0x24e8:   	bcs,a,pt	%icc, _kref+0x24f0
	.word	0xe810a020	! t0_kref+0x24ec:   	lduh	[%g2 + 0x20], %l4
	.word	0xde562016	! t0_kref+0x24f0:   	ldsh	[%i0 + 0x16], %o7
	.word	0x31480007	! t0_kref+0x24f4:   	fba,a,pt	%fcc0, _kref+0x2510
	.word	0xa9a00548	! t0_kref+0x24f8:   	fsqrtd	%f8, %f20
	.word	0xf007bfe0	! t0_kref+0x24fc:   	ld	[%fp - 0x20], %i0
	.word	0x80254016	! t0_kref+0x2500:   	sub	%l5, %l6, %g0
	.word	0xea280018	! t0_kref+0x2504:   	stb	%l5, [%g0 + %i0]
	.word	0xadb50115	! t0_kref+0x2508:   	edge32	%l4, %l5, %l6
	.word	0x8124b36a	! t0_kref+0x250c:   	mulscc	%l2, -0xc96, %g0
	.word	0xd1067fe4	! t0_kref+0x2510:   	ld	[%i1 - 0x1c], %f8
	.word	0xec20a028	! t0_kref+0x2514:   	st	%l6, [%g2 + 0x28]
	.word	0x948d7385	! t0_kref+0x2518:   	andcc	%l5, -0xc7b, %o2
	.word	0xd44e200c	! t0_kref+0x251c:   	ldsb	[%i0 + 0xc], %o2
	.word	0xa9a01a30	! t0_kref+0x2520:   	fstoi	%f16, %f20
	.word	0x8610201c	! t0_kref+0x2524:   	mov	0x1c, %g3
	.word	0x86a0e001	! t0_kref+0x2528:   	subcc	%g3, 1, %g3
	.word	0x2280000c	! t0_kref+0x252c:   	be,a	_kref+0x255c
	.word	0x981d8015	! t0_kref+0x2530:   	xor	%l6, %l5, %o4
	.word	0x912cc015	! t0_kref+0x2534:   	sll	%l3, %l5, %o0
	.word	0xad3c8013	! t0_kref+0x2538:   	sra	%l2, %l3, %l6
	.word	0x9ead0013	! t0_kref+0x253c:   	andncc	%l4, %l3, %o7
	.word	0x95408000	! t0_kref+0x2540:   	mov	%ccr, %o2
	.word	0xc398a040	! t0_kref+0x2544:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0xa1b14de3	! t0_kref+0x2548:   	fnands	%f5, %f3, %f16
	call	SYM(t0_subr0)
	.word	0xe3b8a080	! t0_kref+0x2550:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x9da508d0	! t0_kref+0x2554:   	fsubd	%f20, %f16, %f14
	.word	0xe7ee101d	! t0_kref+0x2558:   	prefetcha	%i0 + %i5, 19
	.word	0xa0f58015	! t0_kref+0x255c:   	udivcc	%l6, %l5, %l0
	.word	0xc398a040	! t0_kref+0x2560:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0x86102004	! t0_kref+0x2564:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x2568:   	bne,a	_kref+0x2568
	.word	0x86a0e001	! t0_kref+0x256c:   	subcc	%g3, 1, %g3
	.word	0xa9b3462e	! t0_kref+0x2570:   	fmul8x16	%f13, %f14, %f20
	.word	0x95400000	! t0_kref+0x2574:   	mov	%y, %o2
	.word	0x8da00554	! t0_kref+0x2578:   	fsqrtd	%f20, %f6
	.word	0x81a88ad4	! t0_kref+0x257c:   	fcmped	%fcc0, %f2, %f20
	.word	0xa67d8012	! t0_kref+0x2580:   	sdiv	%l6, %l2, %l3
	.word	0xa72cc012	! t0_kref+0x2584:   	sll	%l3, %l2, %l3
	.word	0x91a00542	! t0_kref+0x2588:   	fsqrtd	%f2, %f8
	.word	0x23800006	! t0_kref+0x258c:   	fbne,a	_kref+0x25a4
	.word	0x99b10a6d	! t0_kref+0x2590:   	fpadd32s	%f4, %f13, %f12
	.word	0x36480003	! t0_kref+0x2594:   	bge,a,pt	%icc, _kref+0x25a0
	.word	0xd99e5a5d	! t0_kref+0x2598:   	ldda	[%i1 + %i5]0xd2, %f12
	.word	0xec480018	! t0_kref+0x259c:   	ldsb	[%g0 + %i0], %l6
	.word	0x81ad4ab1	! t0_kref+0x25a0:   	fcmpes	%fcc0, %f21, %f17
	.word	0x9324c012	! t0_kref+0x25a4:   	mulscc	%l3, %l2, %o1
	.word	0x89a5084a	! t0_kref+0x25a8:   	faddd	%f20, %f10, %f4
	.word	0x86102004	! t0_kref+0x25ac:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x25b0:   	bne,a	_kref+0x25b0
	.word	0x86a0e001	! t0_kref+0x25b4:   	subcc	%g3, 1, %g3
	.word	0x81a94ab1	! t0_kref+0x25b8:   	fcmpes	%fcc0, %f5, %f17
	.word	0x9eb4f27b	! t0_kref+0x25bc:   	orncc	%l3, -0xd85, %o7
	.word	0xea366006	! t0_kref+0x25c0:   	sth	%l5, [%i1 + 6]
	.word	0xe4280019	! t0_kref+0x25c4:   	stb	%l2, [%g0 + %i1]
	.word	0x91670016	! t0_kref+0x25c8:   	movgu	%icc, %l6, %o0
	.word	0xada01a46	! t0_kref+0x25cc:   	fdtoi	%f6, %f22
	.word	0x81848000	! t0_kref+0x25d0:   	wr	%l2, %g0, %y
	.word	0x9224c015	! t0_kref+0x25d4:   	sub	%l3, %l5, %o1
	.word	0x81ab0ac8	! t0_kref+0x25d8:   	fcmped	%fcc0, %f12, %f8
	.word	0x3b480001	! t0_kref+0x25dc:   	fble,a,pt	%fcc0, _kref+0x25e0
	.word	0xa7a30834	! t0_kref+0x25e0:   	fadds	%f12, %f20, %f19
	.word	0x93a00134	! t0_kref+0x25e4:   	fabss	%f20, %f9
	.word	0x95400000	! t0_kref+0x25e8:   	mov	%y, %o2
	.word	0xe1be5892	! t0_kref+0x25ec:   	stda	%f16, [%i1 + %l2]0xc4
	.word	0xa3a018ce	! t0_kref+0x25f0:   	fdtos	%f14, %f17
	.word	0xe168a002	! t0_kref+0x25f4:   	prefetch	%g2 + 2, 16
	.word	0x94b4e334	! t0_kref+0x25f8:   	orncc	%l3, 0x334, %o2
	.word	0xd700a030	! t0_kref+0x25fc:   	ld	[%g2 + 0x30], %f11
	.word	0x9ba01a32	! t0_kref+0x2600:   	fstoi	%f18, %f13
	.word	0xea270019	! t0_kref+0x2604:   	st	%l5, [%i4 + %i1]
	.word	0x9a254015	! t0_kref+0x2608:   	sub	%l5, %l5, %o5
	.word	0xac1d681d	! t0_kref+0x260c:   	xor	%l5, 0x81d, %l6
	.word	0xd720a000	! t0_kref+0x2610:   	st	%f11, [%g2]
	.word	0xc398a040	! t0_kref+0x2614:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0x81854000	! t0_kref+0x2618:   	wr	%l5, %g0, %y
	.word	0x81580000	! t0_kref+0x261c:   	flushw
	.word	0xe7f61013	! t0_kref+0x2620:   	casxa	[%i0]0x80, %l3, %l3
	.word	0x9ba000a8	! t0_kref+0x2624:   	fnegs	%f8, %f13
	.word	0x81dc401b	! t0_kref+0x2628:   	flush	%l1 + %i3
	.word	0x9014a37e	! t0_kref+0x262c:   	or	%l2, 0x37e, %o0
	.word	0xe4086bf0	! t0_kref+0x2630:   	ldub	[%g1 + 0xbf0], %l2
	.word	0xa41ca00c	! t0_kref+0x2634:   	xor	%l2, 0xc, %l2
	.word	0xe4286bf0	! t0_kref+0x2638:   	stb	%l2, [%g1 + 0xbf0]
	.word	0x81d86bf0	! t0_kref+0x263c:   	flush	%g1 + 0xbf0
	.word	0xe520a038	! t0_kref+0x2640:   	st	%f18, [%g2 + 0x38]
	.word	0x3b480007	! t0_kref+0x2644:   	fble,a,pt	%fcc0, _kref+0x2660
	.word	0xc5180019	! t0_kref+0x2648:   	ldd	[%g0 + %i1], %f2
	.word	0xa4bca234	! t0_kref+0x264c:   	xnorcc	%l2, 0x234, %l2
	.word	0x2c480003	! t0_kref+0x2650:   	bneg,a,pt	%icc, _kref+0x265c
	.word	0xa1256310	! t0_kref+0x2654:   	mulscc	%l5, 0x310, %l0
	.word	0x81de0000	! t0_kref+0x2658:   	flush	%i0
	.word	0xec266004	! t0_kref+0x265c:   	st	%l6, [%i1 + 4]
	.word	0x81848000	! t0_kref+0x2660:   	wr	%l2, %g0, %y
	.word	0xc398a040	! t0_kref+0x2664:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0xc050a000	! t0_kref+0x2668:   	ldsh	[%g2], %g0
	.word	0x81ad0aca	! t0_kref+0x266c:   	fcmped	%fcc0, %f20, %f10
	.word	0x81a8caa9	! t0_kref+0x2670:   	fcmpes	%fcc0, %f3, %f9
	.word	0x9b400000	! t0_kref+0x2674:   	mov	%y, %o5
	.word	0xe4260000	! t0_kref+0x2678:   	st	%l2, [%i0]
2:	.word	0xa1b58354	! t0_kref+0x267c:   	alignaddrl	%l6, %l4, %l0
	.word	0x81aa8a56	! t0_kref+0x2680:   	fcmpd	%fcc0, %f10, %f22
	.word	0x8ba00526	! t0_kref+0x2684:   	fsqrts	%f6, %f5
	.word	0x8db00f06	! t0_kref+0x2688:   	fsrc2	%f6, %f6
	.word	0xaf400000	! t0_kref+0x268c:   	mov	%y, %l7
	.word	0xe846001c	! t0_kref+0x2690:   	ldsw	[%i0 + %i4], %l4
	.word	0x32480002	! t0_kref+0x2694:   	bne,a,pt	%icc, _kref+0x269c
	.word	0xd20e4000	! t0_kref+0x2698:   	ldub	[%i1], %o1
	.word	0x94b57086	! t0_kref+0x269c:   	orncc	%l5, -0xf7a, %o2
	.word	0xac24ab21	! t0_kref+0x26a0:   	sub	%l2, 0xb21, %l6
	.word	0xec467fe4	! t0_kref+0x26a4:   	ldsw	[%i1 - 0x1c], %l6
	.word	0xd91e4000	! t0_kref+0x26a8:   	ldd	[%i1], %f12
	.word	0xe91e401d	! t0_kref+0x26ac:   	ldd	[%i1 + %i5], %f20
	.word	0xa48c8012	! t0_kref+0x26b0:   	andcc	%l2, %l2, %l2
	.word	0x9eace1dd	! t0_kref+0x26b4:   	andncc	%l3, 0x1dd, %o7
	.word	0xdf200019	! t0_kref+0x26b8:   	st	%f15, [%g0 + %i1]
	.word	0xa2758012	! t0_kref+0x26bc:   	udiv	%l6, %l2, %l1
	.word	0xa644c015	! t0_kref+0x26c0:   	addc	%l3, %l5, %l3
	.word	0xa2250013	! t0_kref+0x26c4:   	sub	%l4, %l3, %l1
	.word	0xad2d2015	! t0_kref+0x26c8:   	sll	%l4, 0x15, %l6
	.word	0xa6acba09	! t0_kref+0x26cc:   	andncc	%l2, -0x5f7, %l3
	.word	0x9f3cc013	! t0_kref+0x26d0:   	sra	%l3, %l3, %o7
	.word	0xa9a0052f	! t0_kref+0x26d4:   	fsqrts	%f15, %f20
	.word	0xe42e0000	! t0_kref+0x26d8:   	stb	%l2, [%i0]
	.word	0xc00e7ffc	! t0_kref+0x26dc:   	ldub	[%i1 - 4], %g0
	.word	0x30480008	! t0_kref+0x26e0:   	ba,a,pt	%icc, _kref+0x2700
	.word	0x8143c000	! t0_kref+0x26e4:   	stbar
	.word	0x89b00c00	! t0_kref+0x26e8:   	fzero	%f4
	.word	0x8fa00124	! t0_kref+0x26ec:   	fabss	%f4, %f7
	.word	0xa53ce017	! t0_kref+0x26f0:   	sra	%l3, 0x17, %l2
	.word	0x81400000	! t0_kref+0x26f4:   	mov	%y, %g0
	.word	0xd250a012	! t0_kref+0x26f8:   	ldsh	[%g2 + 0x12], %o1
	.word	0x81dc2980	! t0_kref+0x26fc:   	flush	%l0 + 0x980
	.word	0xd2ce1000	! t0_kref+0x2700:   	ldsba	[%i0]0x80, %o1
	.word	0xe0ee1000	! t0_kref+0x2704:   	ldstuba	[%i0]0x80, %l0
	.word	0x9a75ba94	! t0_kref+0x2708:   	udiv	%l6, -0x56c, %o5
	.word	0xa5a0190f	! t0_kref+0x270c:   	fitod	%f15, %f18
	.word	0xe49e5000	! t0_kref+0x2710:   	ldda	[%i1]0x80, %l2
	.word	0x89a0052e	! t0_kref+0x2714:   	fsqrts	%f14, %f4
	.word	0xc368a086	! t0_kref+0x2718:   	prefetch	%g2 + 0x86, 1
	.word	0x8143c000	! t0_kref+0x271c:   	stbar
	.word	0x92ace34c	! t0_kref+0x2720:   	andncc	%l3, 0x34c, %o1
	.word	0x81580000	! t0_kref+0x2724:   	flushw
	.word	0x89a00554	! t0_kref+0x2728:   	fsqrtd	%f20, %f4
	.word	0xa6758013	! t0_kref+0x272c:   	udiv	%l6, %l3, %l3
	.word	0xc900a018	! t0_kref+0x2730:   	ld	[%g2 + 0x18], %f4
	.word	0x3e480003	! t0_kref+0x2734:   	bvc,a,pt	%icc, _kref+0x2740
	.word	0xa1b18c4e	! t0_kref+0x2738:   	fnor	%f6, %f14, %f16
	.word	0x3f480006	! t0_kref+0x273c:   	fbo,a,pt	%fcc0, _kref+0x2754
	.word	0xe82e4000	! t0_kref+0x2740:   	stb	%l4, [%i1]
	.word	0x91a00544	! t0_kref+0x2744:   	fsqrtd	%f4, %f8
	.word	0xc91e3ff0	! t0_kref+0x2748:   	ldd	[%i0 - 0x10], %f4
	.word	0xec78a038	! t0_kref+0x274c:   	swap	[%g2 + 0x38], %l6
	.word	0x87b34fa9	! t0_kref+0x2750:   	fors	%f13, %f9, %f3
	.word	0xea30a000	! t0_kref+0x2754:   	sth	%l5, [%g2]
	.word	0x97b2cc6d	! t0_kref+0x2758:   	fnors	%f11, %f13, %f11
	.word	0xc807bff0	! t0_kref+0x275c:   	ld	[%fp - 0x10], %g4
	.word	0xeaa71019	! t0_kref+0x2760:   	sta	%l5, [%i4 + %i1]0x80
	.word	0xa1b40446	! t0_kref+0x2764:   	fcmpne16	%f16, %f6, %l0
	.word	0xa78531e7	! t0_kref+0x2768:   	wr	%l4, 0xfffff1e7, %gsr
	.word	0xe4086d0c	! t0_kref+0x276c:   	ldub	[%g1 + 0xd0c], %l2
	.word	0xa41ca00c	! t0_kref+0x2770:   	xor	%l2, 0xc, %l2
	.word	0xe4286d0c	! t0_kref+0x2774:   	stb	%l2, [%g1 + 0xd0c]
	.word	0x81d86d0c	! t0_kref+0x2778:   	flush	%g1 + 0xd0c
	.word	0xa11d0016	! t0_kref+0x277c:   	tsubcctv	%l4, %l6, %l0
	.word	0x8143c000	! t0_kref+0x2780:   	stbar
	.word	0xea066004	! t0_kref+0x2784:   	ld	[%i1 + 4], %l5
	.word	0xea28a031	! t0_kref+0x2788:   	stb	%l5, [%g2 + 0x31]
	.word	0xa8dd8012	! t0_kref+0x278c:   	smulcc	%l6, %l2, %l4
	.word	0x91b009b3	! t0_kref+0x2790:   	fexpand	%f19, %f8
	.word	0xe8680018	! t0_kref+0x2794:   	ldstub	[%g0 + %i0], %l4
2:	.word	0xa29dbe9d	! t0_kref+0x2798:   	xorcc	%l6, -0x163, %l1
	.word	0xda567ff0	! t0_kref+0x279c:   	ldsh	[%i1 - 0x10], %o5
	.word	0xaaf4f399	! t0_kref+0x27a0:   	udivcc	%l3, -0xc67, %l5
	.word	0x97b28cb1	! t0_kref+0x27a4:   	fandnot2s	%f10, %f17, %f11
	.word	0xada00123	! t0_kref+0x27a8:   	fabss	%f3, %f22
	.word	0x80aca917	! t0_kref+0x27ac:   	andncc	%l2, 0x917, %g0
	.word	0xedf61012	! t0_kref+0x27b0:   	casxa	[%i0]0x80, %l2, %l6
	sethi	%hi(2f), %o7
	.word	0xe40be3c8	! t0_kref+0x27b8:   	ldub	[%o7 + 0x3c8], %l2
	.word	0xa41ca00c	! t0_kref+0x27bc:   	xor	%l2, 0xc, %l2
	.word	0xe42be3c8	! t0_kref+0x27c0:   	stb	%l2, [%o7 + 0x3c8]
	.word	0x81dbe3c8	! t0_kref+0x27c4:   	flush	%o7 + 0x3c8
2:	.word	0x94f4b15c	! t0_kref+0x27c8:   	udivcc	%l2, -0xea4, %o2
	.word	0xc398a040	! t0_kref+0x27cc:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0xe4086d7c	! t0_kref+0x27d0:   	ldub	[%g1 + 0xd7c], %l2
	.word	0xa41ca00c	! t0_kref+0x27d4:   	xor	%l2, 0xc, %l2
	.word	0xe4286d7c	! t0_kref+0x27d8:   	stb	%l2, [%g1 + 0xd7c]
	.word	0x81d86d7c	! t0_kref+0x27dc:   	flush	%g1 + 0xd7c
	.word	0xaba00523	! t0_kref+0x27e0:   	fsqrts	%f3, %f21
	.word	0xabb10504	! t0_kref+0x27e4:   	fcmpgt16	%f4, %f4, %l5
	.word	0xe44e7ffd	! t0_kref+0x27e8:   	ldsb	[%i1 - 3], %l2
	.word	0x93b0cda8	! t0_kref+0x27ec:   	fxors	%f3, %f8, %f9
	.word	0x3d480002	! t0_kref+0x27f0:   	fbule,a,pt	%fcc0, _kref+0x27f8
	.word	0xea2e201a	! t0_kref+0x27f4:   	stb	%l5, [%i0 + 0x1a]
	.word	0xabb4ccae	! t0_kref+0x27f8:   	fandnot2s	%f19, %f14, %f21
	.word	0xe3b8a080	! t0_kref+0x27fc:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xcf060000	! t0_kref+0x2800:   	ld	[%i0], %f7
	.word	0xa6457c99	! t0_kref+0x2804:   	addc	%l5, -0x367, %l3
2:	.word	0x970d8013	! t0_kref+0x2808:   	tsubcc	%l6, %l3, %o3
	.word	0xa054a27c	! t0_kref+0x280c:   	umul	%l2, 0x27c, %l0
	.word	0xec20a018	! t0_kref+0x2810:   	st	%l6, [%g2 + 0x18]
	.word	0x9de3bfa0	! t0_kref+0x2814:   	save	%sp, -0x60, %sp
	.word	0xb8d770a4	! t0_kref+0x2818:   	umulcc	%i5, -0xf5c, %i4
	.word	0x95ef4000	! t0_kref+0x281c:   	restore	%i5, %g0, %o2
	.word	0xa6450016	! t0_kref+0x2820:   	addc	%l4, %l6, %l3
	.word	0xa3a0c8ae	! t0_kref+0x2824:   	fsubs	%f3, %f14, %f17
	.word	0xa57035ec	! t0_kref+0x2828:   	popc	-0xa14, %l2
	.word	0xc807bfe4	! t0_kref+0x282c:   	ld	[%fp - 0x1c], %g4
	.word	0x81b4c355	! t0_kref+0x2830:   	alignaddrl	%l3, %l5, %g0
	.word	0xae757efe	! t0_kref+0x2834:   	udiv	%l5, -0x102, %l7
	sethi	%hi(2f), %o7
	.word	0xe40be054	! t0_kref+0x283c:   	ldub	[%o7 + 0x54], %l2
	.word	0xa41ca00c	! t0_kref+0x2840:   	xor	%l2, 0xc, %l2
	.word	0xe42be054	! t0_kref+0x2844:   	stb	%l2, [%o7 + 0x54]
	.word	0x81dbe054	! t0_kref+0x2848:   	flush	%o7 + 0x54
	.word	0x8da01936	! t0_kref+0x284c:   	fstod	%f22, %f6
	.word	0x81accaaa	! t0_kref+0x2850:   	fcmpes	%fcc0, %f19, %f10
2:	.word	0x9b400000	! t0_kref+0x2854:   	mov	%y, %o5
	.word	0x81848000	! t0_kref+0x2858:   	wr	%l2, %g0, %y
	.word	0xea4e201b	! t0_kref+0x285c:   	ldsb	[%i0 + 0x1b], %l5
	.word	0x81de4008	! t0_kref+0x2860:   	flush	%i1 + %o0
	.word	0x910c8015	! t0_kref+0x2864:   	tsubcc	%l2, %l5, %o0
	.word	0x81a88ad2	! t0_kref+0x2868:   	fcmped	%fcc0, %f2, %f18
	.word	0xeed6501b	! t0_kref+0x286c:   	ldsha	[%i1 + %i3]0x80, %l7
	.word	0xe62e0000	! t0_kref+0x2870:   	stb	%l3, [%i0]
	.word	0xec260000	! t0_kref+0x2874:   	st	%l6, [%i0]
	.word	0xdd067fe0	! t0_kref+0x2878:   	ld	[%i1 - 0x20], %f14
	.word	0xa5b28994	! t0_kref+0x287c:   	bshuffle	%f10, %f20, %f18
	.word	0x86102003	! t0_kref+0x2880:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x2884:   	bne,a	_kref+0x2884
	.word	0x86a0e001	! t0_kref+0x2888:   	subcc	%g3, 1, %g3
	.word	0xd4881018	! t0_kref+0x288c:   	lduba	[%g0 + %i0]0x80, %o2
	.word	0xaead0015	! t0_kref+0x2890:   	andncc	%l4, %l5, %l7
	.word	0xd4801018	! t0_kref+0x2894:   	lda	[%g0 + %i0]0x80, %o2
	.word	0xea280019	! t0_kref+0x2898:   	stb	%l5, [%g0 + %i1]
	.word	0x99b207d4	! t0_kref+0x289c:   	pdist	%f8, %f20, %f12
	.word	0x9db48fa5	! t0_kref+0x28a0:   	fors	%f18, %f5, %f14
	.word	0x9ba00535	! t0_kref+0x28a4:   	fsqrts	%f21, %f13
	call	1f
	.empty
	.word	0x85a01903	! t0_kref+0x28ac:   	fitod	%f3, %f2
1:	.word	0xa89d4013	! t0_kref+0x28b0:   	xorcc	%l5, %l3, %l4
	.word	0xa5b0cf75	! t0_kref+0x28b4:   	fornot1s	%f3, %f21, %f18
	.word	0xb810201c	! t0_kref+0x28b8:   	mov	0x1c, %i4
	.word	0x90f48016	! t0_kref+0x28bc:   	udivcc	%l2, %l6, %o0
	.word	0xe9be1854	! t0_kref+0x28c0:   	stda	%f20, [%i0 + %l4]0xc2
	.word	0xa03cbaaf	! t0_kref+0x28c4:   	xnor	%l2, -0x551, %l0
	.word	0x9514bd40	! t0_kref+0x28c8:   	taddcctv	%l2, -0x2c0, %o2
	.word	0xafb30494	! t0_kref+0x28cc:   	fcmple32	%f12, %f20, %l7
	.word	0x86102002	! t0_kref+0x28d0:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x28d4:   	bne,a	_kref+0x28d4
	.word	0x86a0e001	! t0_kref+0x28d8:   	subcc	%g3, 1, %g3
	.word	0x81848000	! t0_kref+0x28dc:   	wr	%l2, %g0, %y
	.word	0x9424eb12	! t0_kref+0x28e0:   	sub	%l3, 0xb12, %o2
	.word	0x25365937	! t0_kref+0x28e4:   	sethi	%hi(0xd964dc00), %l2
	.word	0xcf067ff4	! t0_kref+0x28e8:   	ld	[%i1 - 0xc], %f7
	.word	0x9e25b01e	! t0_kref+0x28ec:   	sub	%l6, -0xfe2, %o7
	.word	0x83c06e70	! t0_kref+0x28f0:   	jmpl	%g1 + 0xe70, %g1
	.word	0x92f4af81	! t0_kref+0x28f4:   	udivcc	%l2, 0xf81, %o1
	.word	0x95a0104c	! t0_kref+0x28f8:   	fdtox	%f12, %f10
	.word	0x81ab8a36	! t0_kref+0x28fc:   	fcmps	%fcc0, %f14, %f22
	.word	0x95b24705	! t0_kref+0x2900:   	fmuld8sux16	%f9, %f5, %f10
	.word	0xe9264000	! t0_kref+0x2904:   	st	%f20, [%i1]
	.word	0xa5a00542	! t0_kref+0x2908:   	fsqrtd	%f2, %f18
	.word	0x99703bd8	! t0_kref+0x290c:   	popc	-0x428, %o4
	.word	0x8da24827	! t0_kref+0x2910:   	fadds	%f9, %f7, %f6
	.word	0xa3a018ca	! t0_kref+0x2914:   	fdtos	%f10, %f17
	.word	0x9464c016	! t0_kref+0x2918:   	subc	%l3, %l6, %o2
	.word	0x8da208c6	! t0_kref+0x291c:   	fsubd	%f8, %f6, %f6
	.word	0xe430a002	! t0_kref+0x2920:   	sth	%l2, [%g2 + 2]
	.word	0x9a1ca79d	! t0_kref+0x2924:   	xor	%l2, 0x79d, %o5
	.word	0x2f800006	! t0_kref+0x2928:   	fbu,a	_kref+0x2940
	.word	0xac8cfb6a	! t0_kref+0x292c:   	andcc	%l3, -0x496, %l6
	.word	0x89b28f46	! t0_kref+0x2930:   	fornot1	%f10, %f6, %f4
	.word	0xe428a028	! t0_kref+0x2934:   	stb	%l2, [%g2 + 0x28]
	.word	0x8143c000	! t0_kref+0x2938:   	stbar
	.word	0x93400000	! t0_kref+0x293c:   	mov	%y, %o1
	.word	0x9e848013	! t0_kref+0x2940:   	addcc	%l2, %l3, %o7
	.word	0xed1e3fe0	! t0_kref+0x2944:   	ldd	[%i0 - 0x20], %f22
	.word	0xeeff1019	! t0_kref+0x2948:   	swapa	[%i4 + %i1]0x80, %l7
	.word	0x8184c000	! t0_kref+0x294c:   	wr	%l3, %g0, %y
	.word	0xa934e00d	! t0_kref+0x2950:   	srl	%l3, 0xd, %l4
	.word	0x93400000	! t0_kref+0x2954:   	mov	%y, %o1
	.word	0xe3b8a080	! t0_kref+0x2958:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x9aa5b0db	! t0_kref+0x295c:   	subcc	%l6, -0xf25, %o5
	.word	0xea08a00a	! t0_kref+0x2960:   	ldub	[%g2 + 0xa], %l5
	call	SYM(t0_subr3)
	.word	0x87a000a9	! t0_kref+0x2968:   	fnegs	%f9, %f3
	.word	0xd868a011	! t0_kref+0x296c:   	ldstub	[%g2 + 0x11], %o4
	.word	0x86102001	! t0_kref+0x2970:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x2974:   	bne,a	_kref+0x2974
	.word	0x86a0e001	! t0_kref+0x2978:   	subcc	%g3, 1, %g3
	.word	0x923d8012	! t0_kref+0x297c:   	xnor	%l6, %l2, %o1
	.word	0x8143c000	! t0_kref+0x2980:   	stbar
	.word	0x807563aa	! t0_kref+0x2984:   	udiv	%l5, 0x3aa, %g0
	.word	0xa9b4c0b5	! t0_kref+0x2988:   	edge16n	%l3, %l5, %l4
	.word	0x989d0015	! t0_kref+0x298c:   	xorcc	%l4, %l5, %o4
	.word	0x3b480006	! t0_kref+0x2990:   	fble,a,pt	%fcc0, _kref+0x29a8
	.word	0x99b30ab2	! t0_kref+0x2994:   	fpsub16s	%f12, %f18, %f12
	.word	0xa2b4ebe9	! t0_kref+0x2998:   	orncc	%l3, 0xbe9, %l1
	.word	0x97b4c0d6	! t0_kref+0x299c:   	edge16l	%l3, %l6, %o3
	.word	0xa0b53b33	! t0_kref+0x29a0:   	orncc	%l4, -0x4cd, %l0
	.word	0xec20a020	! t0_kref+0x29a4:   	st	%l6, [%g2 + 0x20]
	.word	0xa43c8016	! t0_kref+0x29a8:   	xnor	%l2, %l6, %l2
	.word	0xd1070018	! t0_kref+0x29ac:   	ld	[%i4 + %i0], %f8
	.word	0x87a14835	! t0_kref+0x29b0:   	fadds	%f5, %f21, %f3
	.word	0x963ce7d0	! t0_kref+0x29b4:   	xnor	%l3, 0x7d0, %o3
	.word	0x8143e040	! t0_kref+0x29b8:   	membar	0x40
	.word	0xe3b8a040	! t0_kref+0x29bc:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xe40860fc	! t0_kref+0x29c0:   	ldub	[%g1 + 0xfc], %l2
	.word	0xa41ca00c	! t0_kref+0x29c4:   	xor	%l2, 0xc, %l2
	.word	0xe42860fc	! t0_kref+0x29c8:   	stb	%l2, [%g1 + 0xfc]
	.word	0x81d860fc	! t0_kref+0x29cc:   	flush	%g1 + 0xfc
	.word	0x9db34cb3	! t0_kref+0x29d0:   	fandnot2s	%f13, %f19, %f14
	.word	0xa3b54352	! t0_kref+0x29d4:   	alignaddrl	%l5, %l2, %l1
	.word	0x39480003	! t0_kref+0x29d8:   	fbuge,a,pt	%fcc0, _kref+0x29e4
	.word	0xa1b1048c	! t0_kref+0x29dc:   	fcmple32	%f4, %f12, %l0
	.word	0xe820a030	! t0_kref+0x29e0:   	st	%l4, [%g2 + 0x30]
	.word	0xe5f61015	! t0_kref+0x29e4:   	casxa	[%i0]0x80, %l5, %l2
	.word	0xe9981019	! t0_kref+0x29e8:   	ldda	[%g0 + %i1]0x80, %f20
2:	.word	0x9e04e333	! t0_kref+0x29ec:   	add	%l3, 0x333, %o7
	.word	0x97b2cfa3	! t0_kref+0x29f0:   	fors	%f11, %f3, %f11
	.word	0x95b54153	! t0_kref+0x29f4:   	edge32l	%l5, %l3, %o2
	.word	0xea78a038	! t0_kref+0x29f8:   	swap	[%g2 + 0x38], %l5
	.word	0xd2066000	! t0_kref+0x29fc:   	ld	[%i1], %o1
	.word	0x3c480003	! t0_kref+0x2a00:   	bpos,a,pt	%icc, _kref+0x2a0c
	.word	0xa84532ce	! t0_kref+0x2a04:   	addc	%l4, -0xd32, %l4
	.word	0xa1a01909	! t0_kref+0x2a08:   	fitod	%f9, %f16
	.word	0xb410201b	! t0_kref+0x2a0c:   	mov	0x1b, %i2
	.word	0x8db009b1	! t0_kref+0x2a10:   	fexpand	%f17, %f6
	.word	0xc368a009	! t0_kref+0x2a14:   	prefetch	%g2 + 9, 1
	.word	0xc807bfe4	! t0_kref+0x2a18:   	ld	[%fp - 0x1c], %g4
	.word	0xea264000	! t0_kref+0x2a1c:   	st	%l5, [%i1]
	.word	0x9b348016	! t0_kref+0x2a20:   	srl	%l2, %l6, %o5
	.word	0x81b384d0	! t0_kref+0x2a24:   	fcmpne32	%f14, %f16, %g0
	.word	0xa63cf4d9	! t0_kref+0x2a28:   	xnor	%l3, -0xb27, %l3
	.word	0xee0e4000	! t0_kref+0x2a2c:   	ldub	[%i1], %l7
	.word	0x2a480002	! t0_kref+0x2a30:   	bcs,a,pt	%icc, _kref+0x2a38
	.word	0x9ee54013	! t0_kref+0x2a34:   	subccc	%l5, %l3, %o7
	.word	0x2f480008	! t0_kref+0x2a38:   	fbu,a,pt	%fcc0, _kref+0x2a58
	.word	0x81b4c012	! t0_kref+0x2a3c:   	edge8	%l3, %l2, %g0
	.word	0xada30844	! t0_kref+0x2a40:   	faddd	%f12, %f4, %f22
	.word	0x81de0005	! t0_kref+0x2a44:   	flush	%i0 + %g5
	.word	0x89a50d29	! t0_kref+0x2a48:   	fsmuld	%f20, %f9, %f4
	.word	0x2d480008	! t0_kref+0x2a4c:   	fbg,a,pt	%fcc0, _kref+0x2a6c
	.word	0x8143c000	! t0_kref+0x2a50:   	stbar
	.word	0x8bb14f6e	! t0_kref+0x2a54:   	fornot1s	%f5, %f14, %f5
	.word	0x85a18946	! t0_kref+0x2a58:   	fmuld	%f6, %f6, %f2
	.word	0xac9dae1d	! t0_kref+0x2a5c:   	xorcc	%l6, 0xe1d, %l6
	.word	0xd3066010	! t0_kref+0x2a60:   	ld	[%i1 + 0x10], %f9
	.word	0xda865000	! t0_kref+0x2a64:   	lda	[%i1]0x80, %o5
	.word	0xa1a108c6	! t0_kref+0x2a68:   	fsubd	%f4, %f6, %f16
	.word	0xa68d4015	! t0_kref+0x2a6c:   	andcc	%l5, %l5, %l3
	.word	0x9a64c014	! t0_kref+0x2a70:   	subc	%l3, %l4, %o5
	.word	0xd800a000	! t0_kref+0x2a74:   	ld	[%g2], %o4
	.word	0xea2e600c	! t0_kref+0x2a78:   	stb	%l5, [%i1 + 0xc]
	.word	0xe848a000	! t0_kref+0x2a7c:   	ldsb	[%g2], %l4
	.word	0x25480004	! t0_kref+0x2a80:   	fblg,a,pt	%fcc0, _kref+0x2a90
	.word	0x9fa0052e	! t0_kref+0x2a84:   	fsqrts	%f14, %f15
	.word	0xa0e57239	! t0_kref+0x2a88:   	subccc	%l5, -0xdc7, %l0
	.word	0xa1a01933	! t0_kref+0x2a8c:   	fstod	%f19, %f16
	.word	0x93400000	! t0_kref+0x2a90:   	mov	%y, %o1
	.word	0x8143e04d	! t0_kref+0x2a94:   	membar	0x4d
	.word	0xa3400000	! t0_kref+0x2a98:   	mov	%y, %l1
	.word	0x94b54012	! t0_kref+0x2a9c:   	orncc	%l5, %l2, %o2
	.word	0xa3b54eea	! t0_kref+0x2aa0:   	fornot2s	%f21, %f10, %f17
	.word	0xabb10594	! t0_kref+0x2aa4:   	fcmpgt32	%f4, %f20, %l5
	.word	0x95a00528	! t0_kref+0x2aa8:   	fsqrts	%f8, %f10
	.word	0x8143c000	! t0_kref+0x2aac:   	stbar
	.word	0x8ba00532	! t0_kref+0x2ab0:   	fsqrts	%f18, %f5
	.word	0x24480006	! t0_kref+0x2ab4:   	ble,a,pt	%icc, _kref+0x2acc
	.word	0x8fb4cf6d	! t0_kref+0x2ab8:   	fornot1s	%f19, %f13, %f7
	.word	0x81aaca25	! t0_kref+0x2abc:   	fcmps	%fcc0, %f11, %f5
	.word	0x8fb28aa3	! t0_kref+0x2ac0:   	fpsub16s	%f10, %f3, %f7
	.word	0x28480001	! t0_kref+0x2ac4:   	bleu,a,pt	%icc, _kref+0x2ac8
	.word	0xd8f81018	! t0_kref+0x2ac8:   	swapa	[%g0 + %i0]0x80, %o4
	.word	0x91b104d0	! t0_kref+0x2acc:   	fcmpne32	%f4, %f16, %o0
	.word	0x2b0bc92d	! t0_kref+0x2ad0:   	sethi	%hi(0x2f24b400), %l5
	.word	0x89b10d8c	! t0_kref+0x2ad4:   	fxor	%f4, %f12, %f4
	.word	0xadb54135	! t0_kref+0x2ad8:   	edge32n	%l5, %l5, %l6
	.word	0xd4462018	! t0_kref+0x2adc:   	ldsw	[%i0 + 0x18], %o2
	.word	0xaf400000	! t0_kref+0x2ae0:   	mov	%y, %l7
	call	SYM(t0_subr1)
	.word	0xafb4c075	! t0_kref+0x2ae8:   	edge8ln	%l3, %l5, %l7
	.word	0x8074c013	! t0_kref+0x2aec:   	udiv	%l3, %l3, %g0
	.word	0xa5b24ef3	! t0_kref+0x2af0:   	fornot2s	%f9, %f19, %f18
	.word	0x2c480007	! t0_kref+0x2af4:   	bneg,a,pt	%icc, _kref+0x2b10
	.word	0x8da98029	! t0_kref+0x2af8:   	fmovsg	%fcc0, %f9, %f6
	.word	0xaf2ca01d	! t0_kref+0x2afc:   	sll	%l2, 0x1d, %l7
	call	SYM(t0_subr0)
	.word	0x8143c000	! t0_kref+0x2b04:   	stbar
	.word	0x95b480b4	! t0_kref+0x2b08:   	edge16n	%l2, %l4, %o2
	.word	0x96e5369d	! t0_kref+0x2b0c:   	subccc	%l4, -0x963, %o3
	.word	0x81ad0ac2	! t0_kref+0x2b10:   	fcmped	%fcc0, %f20, %f2
	.word	0xa83d8014	! t0_kref+0x2b14:   	xnor	%l6, %l4, %l4
	.word	0xa9b386ce	! t0_kref+0x2b18:   	fmul8sux16	%f14, %f14, %f20
	.word	0xe4086278	! t0_kref+0x2b1c:   	ldub	[%g1 + 0x278], %l2
	.word	0xa41ca00c	! t0_kref+0x2b20:   	xor	%l2, 0xc, %l2
	.word	0xe4286278	! t0_kref+0x2b24:   	stb	%l2, [%g1 + 0x278]
	.word	0x81d86278	! t0_kref+0x2b28:   	flush	%g1 + 0x278
	.word	0xea30a038	! t0_kref+0x2b2c:   	sth	%l5, [%g2 + 0x38]
	.word	0xd86e7ff6	! t0_kref+0x2b30:   	ldstub	[%i1 - 0xa], %o4
	.word	0xe676001d	! t0_kref+0x2b34:   	stx	%l3, [%i0 + %i5]
	.word	0xc398a080	! t0_kref+0x2b38:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0xd0080019	! t0_kref+0x2b3c:   	ldub	[%g0 + %i1], %o0
	call	SYM(t0_subr0)
	.word	0xea30a03a	! t0_kref+0x2b44:   	sth	%l5, [%g2 + 0x3a]
	.word	0x33480002	! t0_kref+0x2b48:   	fbe,a,pt	%fcc0, _kref+0x2b50
	.word	0x99b40a46	! t0_kref+0x2b4c:   	fpadd32	%f16, %f6, %f12
	.word	0x31800005	! t0_kref+0x2b50:   	fba,a	_kref+0x2b64
	.word	0xa45c8014	! t0_kref+0x2b54:   	smul	%l2, %l4, %l2
	.word	0xe60e3fe8	! t0_kref+0x2b58:   	ldub	[%i0 - 0x18], %l3
	.word	0xdaff1019	! t0_kref+0x2b5c:   	swapa	[%i4 + %i1]0x80, %o5
	.word	0x2b480004	! t0_kref+0x2b60:   	fbug,a,pt	%fcc0, _kref+0x2b70
	.word	0xa5a088d6	! t0_kref+0x2b64:   	fsubd	%f2, %f22, %f18
2:	.word	0xec78a018	! t0_kref+0x2b68:   	swap	[%g2 + 0x18], %l6
	.word	0xafb385d4	! t0_kref+0x2b6c:   	fcmpeq32	%f14, %f20, %l7
	.word	0xa0bcc013	! t0_kref+0x2b70:   	xnorcc	%l3, %l3, %l0
	.word	0xa225bfc5	! t0_kref+0x2b74:   	sub	%l6, -0x3b, %l1
	.word	0xc398a080	! t0_kref+0x2b78:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0x8fa0c8af	! t0_kref+0x2b7c:   	fsubs	%f3, %f15, %f7
	.word	0x95a389d0	! t0_kref+0x2b80:   	fdivd	%f14, %f16, %f10
	.word	0x81a94a33	! t0_kref+0x2b84:   	fcmps	%fcc0, %f5, %f19
	.word	0x2f480003	! t0_kref+0x2b88:   	fbu,a,pt	%fcc0, _kref+0x2b94
	.word	0xc398a080	! t0_kref+0x2b8c:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0xc398a080	! t0_kref+0x2b90:   	ldda	[%g2 + 0x80]%asi, %f32
	call	1f
	.empty
	.word	0xe0c61000	! t0_kref+0x2b98:   	ldswa	[%i0]0x80, %l0
	call	SYM(t0_subr0)
1:	.word	0x80bd4014	! t0_kref+0x2ba0:   	xnorcc	%l5, %l4, %g0
	.word	0xe626401c	! t0_kref+0x2ba4:   	st	%l3, [%i1 + %i4]
	.word	0xada34929	! t0_kref+0x2ba8:   	fmuls	%f13, %f9, %f22
	.word	0xd11e001d	! t0_kref+0x2bac:   	ldd	[%i0 + %i5], %f8
	.word	0xe086101c	! t0_kref+0x2bb0:   	lda	[%i0 + %i4]0x80, %l0
	.word	0x3a480001	! t0_kref+0x2bb4:   	bcc,a,pt	%icc, _kref+0x2bb8
	.word	0xc398a080	! t0_kref+0x2bb8:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0x86102002	! t0_kref+0x2bbc:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x2bc0:   	bne,a	_kref+0x2bc0
	.word	0x86a0e001	! t0_kref+0x2bc4:   	subcc	%g3, 1, %g3
	.word	0x97a0052b	! t0_kref+0x2bc8:   	fsqrts	%f11, %f11
	.word	0xef68a103	! t0_kref+0x2bcc:   	prefetch	%g2 + 0x103, 23
	.word	0xc1be5812	! t0_kref+0x2bd0:   	stda	%f0, [%i1 + %l2]0xc0
	.word	0x9455bde3	! t0_kref+0x2bd4:   	umul	%l6, -0x21d, %o2
	.word	0xe4764000	! t0_kref+0x2bd8:   	stx	%l2, [%i1]
	.word	0x81aa0ad0	! t0_kref+0x2bdc:   	fcmped	%fcc0, %f8, %f16
	.word	0xd9be5813	! t0_kref+0x2be0:   	stda	%f12, [%i1 + %l3]0xc0
	.word	0x89b20caa	! t0_kref+0x2be4:   	fandnot2s	%f8, %f10, %f4
	.word	0x9dab004a	! t0_kref+0x2be8:   	fmovduge	%fcc0, %f10, %f14
	.word	0xdd981018	! t0_kref+0x2bec:   	ldda	[%g0 + %i0]0x80, %f14
	.word	0xa7b10450	! t0_kref+0x2bf0:   	fcmpne16	%f4, %f16, %l3
	.word	0xe06e401a	! t0_kref+0x2bf4:   	ldstub	[%i1 + %i2], %l0
	.word	0xa1a308ca	! t0_kref+0x2bf8:   	fsubd	%f12, %f10, %f16
	.word	0x21800006	! t0_kref+0x2bfc:   	fbn,a	_kref+0x2c14
	.word	0xd9070019	! t0_kref+0x2c00:   	ld	[%i4 + %i1], %f12
	.word	0x81a94a2b	! t0_kref+0x2c04:   	fcmps	%fcc0, %f5, %f11
	.word	0x81ab0a46	! t0_kref+0x2c08:   	fcmpd	%fcc0, %f12, %f6
	.word	0x2b480004	! t0_kref+0x2c0c:   	fbug,a,pt	%fcc0, _kref+0x2c1c
	.word	0xa244a0fc	! t0_kref+0x2c10:   	addc	%l2, 0xfc, %l1
	.word	0x30800002	! t0_kref+0x2c14:   	ba,a	_kref+0x2c1c
	.word	0xd6064000	! t0_kref+0x2c18:   	ld	[%i1], %o3
	.word	0xc920a000	! t0_kref+0x2c1c:   	st	%f4, [%g2]
	.word	0xa0bd2a69	! t0_kref+0x2c20:   	xnorcc	%l4, 0xa69, %l0
	.word	0xa9b00f12	! t0_kref+0x2c24:   	fsrc2	%f18, %f20
	.word	0xd868a012	! t0_kref+0x2c28:   	ldstub	[%g2 + 0x12], %o4
	.word	0x23800006	! t0_kref+0x2c2c:   	fbne,a	_kref+0x2c44
	.word	0x81dfc00e	! t0_kref+0x2c30:   	flush	%i7 + %sp
	.word	0x8143c000	! t0_kref+0x2c34:   	stbar
	.word	0xe1ee101b	! t0_kref+0x2c38:   	prefetcha	%i0 + %i3, 16
	.word	0xe6ae5000	! t0_kref+0x2c3c:   	stba	%l3, [%i1]0x80
	.word	0x9324ae93	! t0_kref+0x2c40:   	mulscc	%l2, 0xe93, %o1
	.word	0x90558012	! t0_kref+0x2c44:   	umul	%l6, %l2, %o0
	.word	0xd0167ffe	! t0_kref+0x2c48:   	lduh	[%i1 - 2], %o0
	.word	0x81a88ad2	! t0_kref+0x2c4c:   	fcmped	%fcc0, %f2, %f18
	call	SYM(t0_subr3)
	.word	0x81deb803	! t0_kref+0x2c54:   	flush	%i2 - 0x7fd
	.word	0xa93da00c	! t0_kref+0x2c58:   	sra	%l6, 0xc, %l4
	.word	0xada388ac	! t0_kref+0x2c5c:   	fsubs	%f14, %f12, %f22
	.word	0xa6157997	! t0_kref+0x2c60:   	or	%l5, -0x669, %l3
	.word	0x9da00550	! t0_kref+0x2c64:   	fsqrtd	%f16, %f14
	.word	0xace4b782	! t0_kref+0x2c68:   	subccc	%l2, -0x87e, %l6
	.word	0x95b487d0	! t0_kref+0x2c6c:   	pdist	%f18, %f16, %f10
	.word	0x94554014	! t0_kref+0x2c70:   	umul	%l5, %l4, %o2
	.word	0x9924e25f	! t0_kref+0x2c74:   	mulscc	%l3, 0x25f, %o4
	.word	0xdf063fec	! t0_kref+0x2c78:   	ld	[%i0 - 0x14], %f15
	.word	0x87a0012e	! t0_kref+0x2c7c:   	fabss	%f14, %f3
	.word	0x80acfc39	! t0_kref+0x2c80:   	andncc	%l3, -0x3c7, %g0
	.word	0x99a0054c	! t0_kref+0x2c84:   	fsqrtd	%f12, %f12
	.word	0x8bb44dac	! t0_kref+0x2c88:   	fxors	%f17, %f12, %f5
	.word	0x81a90aca	! t0_kref+0x2c8c:   	fcmped	%fcc0, %f4, %f10
	.word	0x9da40856	! t0_kref+0x2c90:   	faddd	%f16, %f22, %f14
	.word	0x8fa01a52	! t0_kref+0x2c94:   	fdtoi	%f18, %f7
	.word	0x81850000	! t0_kref+0x2c98:   	wr	%l4, %g0, %y
	.word	0x93a00531	! t0_kref+0x2c9c:   	fsqrts	%f17, %f9
	.word	0xaae53874	! t0_kref+0x2ca0:   	subccc	%l4, -0x78c, %l5
	.word	0xec766008	! t0_kref+0x2ca4:   	stx	%l6, [%i1 + 8]
	.word	0xe8267fe8	! t0_kref+0x2ca8:   	st	%l4, [%i1 - 0x18]
	.word	0x85b20c44	! t0_kref+0x2cac:   	fnor	%f8, %f4, %f2
	.word	0x91a00128	! t0_kref+0x2cb0:   	fabss	%f8, %f8
	.word	0xa4e4c014	! t0_kref+0x2cb4:   	subccc	%l3, %l4, %l2
	.word	0x9844c012	! t0_kref+0x2cb8:   	addc	%l3, %l2, %o4
	.word	0xe630a030	! t0_kref+0x2cbc:   	sth	%l3, [%g2 + 0x30]
	.word	0x9da1082f	! t0_kref+0x2cc0:   	fadds	%f4, %f15, %f14
	.word	0xc906600c	! t0_kref+0x2cc4:   	ld	[%i1 + 0xc], %f4
	.word	0x91b08ac8	! t0_kref+0x2cc8:   	fpsub32	%f2, %f8, %f8
	.word	0x21480002	! t0_kref+0x2ccc:   	fbn,a,pt	%fcc0, _kref+0x2cd4
	.word	0xe82e7fe3	! t0_kref+0x2cd0:   	stb	%l4, [%i1 - 0x1d]
	.word	0xa25533ce	! t0_kref+0x2cd4:   	umul	%l4, -0xc32, %l1
	.word	0xc398a080	! t0_kref+0x2cd8:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0xea2e8019	! t0_kref+0x2cdc:   	stb	%l5, [%i2 + %i1]
	.word	0xea164000	! t0_kref+0x2ce0:   	lduh	[%i1], %l5
	.word	0xd8163fe0	! t0_kref+0x2ce4:   	lduh	[%i0 - 0x20], %o4
	.word	0xe6270018	! t0_kref+0x2ce8:   	st	%l3, [%i4 + %i0]
	.word	0xc9be1813	! t0_kref+0x2cec:   	stda	%f4, [%i0 + %l3]0xc0
	.word	0x89b287d2	! t0_kref+0x2cf0:   	pdist	%f10, %f18, %f4
	.word	0x90bd62bd	! t0_kref+0x2cf4:   	xnorcc	%l5, 0x2bd, %o0
	.word	0xd4080018	! t0_kref+0x2cf8:   	ldub	[%g0 + %i0], %o2
	.word	0xa5b48d40	! t0_kref+0x2cfc:   	fnot1	%f18, %f18
	.word	0x9fa50829	! t0_kref+0x2d00:   	fadds	%f20, %f9, %f15
	.word	0xcb263fe4	! t0_kref+0x2d04:   	st	%f5, [%i0 - 0x1c]
	.word	0xa8ad3ee9	! t0_kref+0x2d08:   	andncc	%l4, -0x117, %l4
	.word	0xa6b56cb1	! t0_kref+0x2d0c:   	orncc	%l5, 0xcb1, %l3
	.word	0x925d8016	! t0_kref+0x2d10:   	smul	%l6, %l6, %o1
	.word	0x8bb54de7	! t0_kref+0x2d14:   	fnands	%f21, %f7, %f5
	.word	0xad3d0016	! t0_kref+0x2d18:   	sra	%l4, %l6, %l6
	.word	0x80150016	! t0_kref+0x2d1c:   	or	%l4, %l6, %g0
	.word	0x9b3cc014	! t0_kref+0x2d20:   	sra	%l3, %l4, %o5
	.word	0xa1a2c832	! t0_kref+0x2d24:   	fadds	%f11, %f18, %f16
	.word	0xe436c018	! t0_kref+0x2d28:   	sth	%l2, [%i3 + %i0]
	.word	0xe808a03a	! t0_kref+0x2d2c:   	ldub	[%g2 + 0x3a], %l4
	.word	0xd0c81019	! t0_kref+0x2d30:   	ldsba	[%g0 + %i1]0x80, %o0
	.word	0x95054016	! t0_kref+0x2d34:   	taddcc	%l5, %l6, %o2
	.word	0x9aad0015	! t0_kref+0x2d38:   	andncc	%l4, %l5, %o5
	.word	0x953d601c	! t0_kref+0x2d3c:   	sra	%l5, 0x1c, %o2
	.word	0xd400a020	! t0_kref+0x2d40:   	ld	[%g2 + 0x20], %o2
	.word	0x81abca23	! t0_kref+0x2d44:   	fcmps	%fcc0, %f15, %f3
	.word	0xa9a0052b	! t0_kref+0x2d48:   	fsqrts	%f11, %f20
	.word	0xe62e7ffc	! t0_kref+0x2d4c:   	stb	%l3, [%i1 - 4]
	.word	0x3b480004	! t0_kref+0x2d50:   	fble,a,pt	%fcc0, _kref+0x2d60
	.word	0xada408cc	! t0_kref+0x2d54:   	fsubd	%f16, %f12, %f22
	.word	0x3f480001	! t0_kref+0x2d58:   	fbo,a,pt	%fcc0, _kref+0x2d5c
	.word	0x89a00546	! t0_kref+0x2d5c:   	fsqrtd	%f6, %f4
	.word	0xc398a080	! t0_kref+0x2d60:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0x90954015	! t0_kref+0x2d64:   	orcc	%l5, %l5, %o0
	.word	0xc9000019	! t0_kref+0x2d68:   	ld	[%g0 + %i1], %f4
	.word	0x90acf967	! t0_kref+0x2d6c:   	andncc	%l3, -0x699, %o0
	.word	0x89a01925	! t0_kref+0x2d70:   	fstod	%f5, %f4
	.word	0xa6757358	! t0_kref+0x2d74:   	udiv	%l5, -0xca8, %l3
	.word	0x92654016	! t0_kref+0x2d78:   	subc	%l5, %l6, %o1
	.word	0x9da50846	! t0_kref+0x2d7c:   	faddd	%f20, %f6, %f14
	.word	0xc398a080	! t0_kref+0x2d80:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0xe7060000	! t0_kref+0x2d84:   	ld	[%i0], %f19
	.word	0xa0554014	! t0_kref+0x2d88:   	umul	%l5, %l4, %l0
	.word	0xa1a0054a	! t0_kref+0x2d8c:   	fsqrtd	%f10, %f16
	.word	0xcb267ff8	! t0_kref+0x2d90:   	st	%f5, [%i1 - 8]
	.word	0xaead7cbe	! t0_kref+0x2d94:   	andncc	%l5, -0x342, %l7
	.word	0x9325ace7	! t0_kref+0x2d98:   	mulscc	%l6, 0xce7, %o1
	.word	0xaead0014	! t0_kref+0x2d9c:   	andncc	%l4, %l4, %l7
	.word	0x89b00fc0	! t0_kref+0x2da0:   	fone	%f4
	.word	0xe4267fe4	! t0_kref+0x2da4:   	st	%l2, [%i1 - 0x1c]
	.word	0x9bb28450	! t0_kref+0x2da8:   	fcmpne16	%f10, %f16, %o5
	.word	0x2e480006	! t0_kref+0x2dac:   	bvs,a,pt	%icc, _kref+0x2dc4
	.word	0xe2480019	! t0_kref+0x2db0:   	ldsb	[%g0 + %i1], %l1
	.word	0xa9a01a2a	! t0_kref+0x2db4:   	fstoi	%f10, %f20
	.word	0x81b54315	! t0_kref+0x2db8:   	alignaddr	%l5, %l5, %g0
	.word	0x8d8561cb	! t0_kref+0x2dbc:   	wr	%l5, 0x1cb, %fprs
	.word	0x24480001	! t0_kref+0x2dc0:   	ble,a,pt	%icc, _kref+0x2dc4
	.word	0xea48a012	! t0_kref+0x2dc4:   	ldsb	[%g2 + 0x12], %l5
	.word	0x8143c000	! t0_kref+0x2dc8:   	stbar
	.word	0x81a90ac6	! t0_kref+0x2dcc:   	fcmped	%fcc0, %f4, %f6
	.word	0xa1a01a4a	! t0_kref+0x2dd0:   	fdtoi	%f10, %f16
	.word	0xd9be5a1d	! t0_kref+0x2dd4:   	stda	%f12, [%i1 + %i5]0xd0
	.word	0x87a000ab	! t0_kref+0x2dd8:   	fnegs	%f11, %f3
	.word	0xdd20a030	! t0_kref+0x2ddc:   	st	%f14, [%g2 + 0x30]
	.word	0xac64a9e7	! t0_kref+0x2de0:   	subc	%l2, 0x9e7, %l6
	.word	0x81a90ace	! t0_kref+0x2de4:   	fcmped	%fcc0, %f4, %f14
	.word	0xa7a00126	! t0_kref+0x2de8:   	fabss	%f6, %f19
	.word	0x81aa0aa8	! t0_kref+0x2dec:   	fcmpes	%fcc0, %f8, %f8
	.word	0x91b54113	! t0_kref+0x2df0:   	edge32	%l5, %l3, %o0
	.word	0x8db48f46	! t0_kref+0x2df4:   	fornot1	%f18, %f6, %f6
	.word	0xafb1054c	! t0_kref+0x2df8:   	fcmpeq16	%f4, %f12, %l7
	.word	0x99a00542	! t0_kref+0x2dfc:   	fsqrtd	%f2, %f12
	.word	0x94a54014	! t0_kref+0x2e00:   	subcc	%l5, %l4, %o2
	.word	0x95a4094e	! t0_kref+0x2e04:   	fmuld	%f16, %f14, %f10
	.word	0xd9be1855	! t0_kref+0x2e08:   	stda	%f12, [%i0 + %l5]0xc2
	.word	0xa72ca008	! t0_kref+0x2e0c:   	sll	%l2, 0x8, %l3
	.word	0xa5a01914	! t0_kref+0x2e10:   	fitod	%f20, %f18
	.word	0x8db00f04	! t0_kref+0x2e14:   	fsrc2	%f4, %f6
	.word	0xa524f179	! t0_kref+0x2e18:   	mulscc	%l3, -0xe87, %l2
	.word	0x97b14a2c	! t0_kref+0x2e1c:   	fpadd16s	%f5, %f12, %f11
	.word	0xea2e6015	! t0_kref+0x2e20:   	stb	%l5, [%i1 + 0x15]
	.word	0xc19f5a18	! t0_kref+0x2e24:   	ldda	[%i5 + %i0]0xd0, %f0
	.word	0x928ced53	! t0_kref+0x2e28:   	andcc	%l3, 0xd53, %o1
	.word	0xe3b8a040	! t0_kref+0x2e2c:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xd91e3fe0	! t0_kref+0x2e30:   	ldd	[%i0 - 0x20], %f12
	.word	0x3a480006	! t0_kref+0x2e34:   	bcc,a,pt	%icc, _kref+0x2e4c
	.word	0xc398a080	! t0_kref+0x2e38:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0x89a2084e	! t0_kref+0x2e3c:   	faddd	%f8, %f14, %f4
	.word	0x927cb3a2	! t0_kref+0x2e40:   	sdiv	%l2, -0xc5e, %o1
	.word	0x99a0012d	! t0_kref+0x2e44:   	fabss	%f13, %f12
	.word	0x81aa8a32	! t0_kref+0x2e48:   	fcmps	%fcc0, %f10, %f18
	.word	0x941d0012	! t0_kref+0x2e4c:   	xor	%l4, %l2, %o2
	.word	0x8ba00525	! t0_kref+0x2e50:   	fsqrts	%f5, %f5
	.word	0xde4e601b	! t0_kref+0x2e54:   	ldsb	[%i1 + 0x1b], %o7
	.word	0x95a00542	! t0_kref+0x2e58:   	fsqrtd	%f2, %f10
	.word	0xae64c014	! t0_kref+0x2e5c:   	subc	%l3, %l4, %l7
	.word	0xadb009b1	! t0_kref+0x2e60:   	fexpand	%f17, %f22
	call	SYM(t0_subr3)
	.word	0x9da00550	! t0_kref+0x2e68:   	fsqrtd	%f16, %f14
	.word	0xffee501c	! t0_kref+0x2e6c:   	prefetcha	%i1 + %i4, 31
	.word	0xa2854014	! t0_kref+0x2e70:   	addcc	%l5, %l4, %l1
	.word	0x2f480007	! t0_kref+0x2e74:   	fbu,a,pt	%fcc0, _kref+0x2e90
	.word	0xea28a03b	! t0_kref+0x2e78:   	stb	%l5, [%g2 + 0x3b]
	.word	0xc0166004	! t0_kref+0x2e7c:   	lduh	[%i1 + 4], %g0
	.word	0xfdee501b	! t0_kref+0x2e80:   	prefetcha	%i1 + %i3, 30
	.word	0xa7a01a46	! t0_kref+0x2e84:   	fdtoi	%f6, %f19
	.word	0x9da40d28	! t0_kref+0x2e88:   	fsmuld	%f16, %f8, %f14
	.word	0xac3d8014	! t0_kref+0x2e8c:   	xnor	%l6, %l4, %l6
	.word	0x81b30496	! t0_kref+0x2e90:   	fcmple32	%f12, %f22, %g0
	.word	0x91b4c355	! t0_kref+0x2e94:   	alignaddrl	%l3, %l5, %o0
	.word	0xa3a00133	! t0_kref+0x2e98:   	fabss	%f19, %f17
	.word	0x8fa01a2a	! t0_kref+0x2e9c:   	fstoi	%f10, %f7
	.word	0x86102003	! t0_kref+0x2ea0:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x2ea4:   	bne,a	_kref+0x2ea4
	.word	0x86a0e001	! t0_kref+0x2ea8:   	subcc	%g3, 1, %g3
	.word	0x81d9401c	! t0_kref+0x2eac:   	flush	%g5 + %i4
	.word	0xe04e8019	! t0_kref+0x2eb0:   	ldsb	[%i2 + %i1], %l0
	.word	0x97a0108c	! t0_kref+0x2eb4:   	fxtos	%f12, %f11
	.word	0x99b4c112	! t0_kref+0x2eb8:   	edge32	%l3, %l2, %o4
	.word	0xaba01a4a	! t0_kref+0x2ebc:   	fdtoi	%f10, %f21
	.word	0x8014c014	! t0_kref+0x2ec0:   	or	%l3, %l4, %g0
	.word	0x99a48d28	! t0_kref+0x2ec4:   	fsmuld	%f18, %f8, %f12
	.word	0xa49d37f2	! t0_kref+0x2ec8:   	xorcc	%l4, -0x80e, %l2
	.word	0xedee101d	! t0_kref+0x2ecc:   	prefetcha	%i0 + %i5, 22
	.word	0xa1b540b2	! t0_kref+0x2ed0:   	edge16n	%l5, %l2, %l0
	.word	0x93a018ca	! t0_kref+0x2ed4:   	fdtos	%f10, %f9
	.word	0xe630a018	! t0_kref+0x2ed8:   	sth	%l3, [%g2 + 0x18]
	.word	0xe968a04f	! t0_kref+0x2edc:   	prefetch	%g2 + 0x4f, 20
	.word	0xac650014	! t0_kref+0x2ee0:   	subc	%l4, %l4, %l6
	.word	0x9e550015	! t0_kref+0x2ee4:   	umul	%l4, %l5, %o7
	.word	0xe82e601a	! t0_kref+0x2ee8:   	stb	%l4, [%i1 + 0x1a]
	.word	0xd6563ff4	! t0_kref+0x2eec:   	ldsh	[%i0 - 0xc], %o3
	.word	0xab7032b1	! t0_kref+0x2ef0:   	popc	-0xd4f, %l5
	call	SYM(t0_subr1)
	.word	0x95400000	! t0_kref+0x2ef8:   	mov	%y, %o2
	.word	0xd46e4000	! t0_kref+0x2efc:   	ldstub	[%i1], %o2
	.word	0xa6a48015	! t0_kref+0x2f00:   	subcc	%l2, %l5, %l3
	.word	0xecae101a	! t0_kref+0x2f04:   	stba	%l6, [%i0 + %i2]0x80
	.word	0x81ac0a54	! t0_kref+0x2f08:   	fcmpd	%fcc0, %f16, %f20
	.word	0x9de3bfa0	! t0_kref+0x2f0c:   	save	%sp, -0x60, %sp
	.word	0xb6a6001a	! t0_kref+0x2f10:   	subcc	%i0, %i2, %i3
	.word	0xade82bbb	! t0_kref+0x2f14:   	restore	%g0, 0xbbb, %l6
	.word	0x97a01a48	! t0_kref+0x2f18:   	fdtoi	%f8, %f11
	.word	0x9fa14825	! t0_kref+0x2f1c:   	fadds	%f5, %f5, %f15
	.word	0xaf3d4015	! t0_kref+0x2f20:   	sra	%l5, %l5, %l7
	.word	0x85857ad4	! t0_kref+0x2f24:   	wr	%l5, 0xfffffad4, %ccr
	.word	0xea367ffa	! t0_kref+0x2f28:   	sth	%l5, [%i1 - 6]
	.word	0x37480008	! t0_kref+0x2f2c:   	fbge,a,pt	%fcc0, _kref+0x2f4c
	.word	0xa7b485c8	! t0_kref+0x2f30:   	fcmpeq32	%f18, %f8, %l3
	.word	0xe168a08f	! t0_kref+0x2f34:   	prefetch	%g2 + 0x8f, 16
	.word	0xc398a080	! t0_kref+0x2f38:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0x9a85ad27	! t0_kref+0x2f3c:   	addcc	%l6, 0xd27, %o5
	.word	0xadb00cce	! t0_kref+0x2f40:   	fnot2	%f14, %f22
	.word	0xa65d340e	! t0_kref+0x2f44:   	smul	%l4, -0xbf2, %l3
	.word	0x33800007	! t0_kref+0x2f48:   	fbe,a	_kref+0x2f64
	.word	0x90148012	! t0_kref+0x2f4c:   	or	%l2, %l2, %o0
	.word	0x92248013	! t0_kref+0x2f50:   	sub	%l2, %l3, %o1
	.word	0x992ce00f	! t0_kref+0x2f54:   	sll	%l3, 0xf, %o4
	.word	0xd1263fe0	! t0_kref+0x2f58:   	st	%f8, [%i0 - 0x20]
	.word	0x89b0c626	! t0_kref+0x2f5c:   	fmul8x16	%f3, %f6, %f4
	.word	0xa65ce9ea	! t0_kref+0x2f60:   	smul	%l3, 0x9ea, %l3
	.word	0xad400000	! t0_kref+0x2f64:   	mov	%y, %l6
	.word	0xebee101a	! t0_kref+0x2f68:   	prefetcha	%i0 + %i2, 21
	.word	0x90157f2e	! t0_kref+0x2f6c:   	or	%l5, -0xd2, %o0
	.word	0x81854000	! t0_kref+0x2f70:   	wr	%l5, %g0, %y
	.word	0x9844c016	! t0_kref+0x2f74:   	addc	%l3, %l6, %o4
	.word	0x2b800004	! t0_kref+0x2f78:   	fbug,a	_kref+0x2f88
	.word	0xa91cc015	! t0_kref+0x2f7c:   	tsubcctv	%l3, %l5, %l4
	.word	0x2f480001	! t0_kref+0x2f80:   	fbu,a,pt	%fcc0, _kref+0x2f84
	.word	0x9e656d26	! t0_kref+0x2f84:   	subc	%l5, 0xd26, %o7
	.word	0xa1a00550	! t0_kref+0x2f88:   	fsqrtd	%f16, %f16
	.word	0x96a54012	! t0_kref+0x2f8c:   	subcc	%l5, %l2, %o3
	.word	0x89a20854	! t0_kref+0x2f90:   	faddd	%f8, %f20, %f4
	.word	0xec2e7fe0	! t0_kref+0x2f94:   	stb	%l6, [%i1 - 0x20]
	.word	0x81aa8ad2	! t0_kref+0x2f98:   	fcmped	%fcc0, %f10, %f18
	.word	0xda080018	! t0_kref+0x2f9c:   	ldub	[%g0 + %i0], %o5
	.word	0xa29d35bc	! t0_kref+0x2fa0:   	xorcc	%l4, -0xa44, %l1
	.word	0xa1a0052a	! t0_kref+0x2fa4:   	fsqrts	%f10, %f16
	.word	0x95400000	! t0_kref+0x2fa8:   	mov	%y, %o2
	.word	0x89a01a46	! t0_kref+0x2fac:   	fdtoi	%f6, %f4
	.word	0xa675ac96	! t0_kref+0x2fb0:   	udiv	%l6, 0xc96, %l3
	.word	0xa0fd3c38	! t0_kref+0x2fb4:   	sdivcc	%l4, -0x3c8, %l0
	.word	0x91a5482b	! t0_kref+0x2fb8:   	fadds	%f21, %f11, %f8
	.word	0xc010a030	! t0_kref+0x2fbc:   	lduh	[%g2 + 0x30], %g0
	.word	0xd84e4000	! t0_kref+0x2fc0:   	ldsb	[%i1], %o4
	.word	0xc0567ffc	! t0_kref+0x2fc4:   	ldsh	[%i1 - 4], %g0
	.word	0xd5066010	! t0_kref+0x2fc8:   	ld	[%i1 + 0x10], %f10
	.word	0xee6e2006	! t0_kref+0x2fcc:   	ldstub	[%i0 + 6], %l7
	.word	0x8ba309a6	! t0_kref+0x2fd0:   	fdivs	%f12, %f6, %f5
	.word	0xa7854015	! t0_kref+0x2fd4:   	wr	%l5, %l5, %gsr
	.word	0x947567f6	! t0_kref+0x2fd8:   	udiv	%l5, 0x7f6, %o2
	.word	0xec267ff4	! t0_kref+0x2fdc:   	st	%l6, [%i1 - 0xc]
	.word	0xe5ee101b	! t0_kref+0x2fe0:   	prefetcha	%i0 + %i3, 18
	.word	0xe01e2010	! t0_kref+0x2fe4:   	ldd	[%i0 + 0x10], %l0
	.word	0xa7a0052b	! t0_kref+0x2fe8:   	fsqrts	%f11, %f19
	.word	0xadb24caf	! t0_kref+0x2fec:   	fandnot2s	%f9, %f15, %f22
	.word	0x81db800a	! t0_kref+0x2ff0:   	flush	%sp + %o2
	.word	0x9da00536	! t0_kref+0x2ff4:   	fsqrts	%f22, %f14
	.word	0xc398a080	! t0_kref+0x2ff8:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0x9de3bfa0	! t0_kref+0x2ffc:   	save	%sp, -0x60, %sp
	.word	0xa1ee001c	! t0_kref+0x3000:   	restore	%i0, %i4, %l0
	.word	0x230d616c	! t0_kref+0x3004:   	sethi	%hi(0x3585b000), %l1
	.word	0x8143e040	! t0_kref+0x3008:   	membar	0x40
	.word	0x85a488c4	! t0_kref+0x300c:   	fsubd	%f18, %f4, %f2
	.word	0xa65d8012	! t0_kref+0x3010:   	smul	%l6, %l2, %l3
	.word	0x91a0054c	! t0_kref+0x3014:   	fsqrtd	%f12, %f8
	.word	0x99b00ce8	! t0_kref+0x3018:   	fnot2s	%f8, %f12
	.word	0xa3a000b3	! t0_kref+0x301c:   	fnegs	%f19, %f17
	.word	0xeb68a0c2	! t0_kref+0x3020:   	prefetch	%g2 + 0xc2, 21
	.word	0xee86101c	! t0_kref+0x3024:   	lda	[%i0 + %i4]0x80, %l7
	.word	0x89a0cd27	! t0_kref+0x3028:   	fsmuld	%f3, %f7, %f4
	.word	0xa5b2c624	! t0_kref+0x302c:   	fmul8x16	%f11, %f4, %f18
	.word	0x9bb48488	! t0_kref+0x3030:   	fcmple32	%f18, %f8, %o5
	.word	0xed20a018	! t0_kref+0x3034:   	st	%f22, [%g2 + 0x18]
	.word	0xe06e601b	! t0_kref+0x3038:   	ldstub	[%i1 + 0x1b], %l0
	.word	0xe6ae1000	! t0_kref+0x303c:   	stba	%l3, [%i0]0x80
	.word	0x9de3bfa0	! t0_kref+0x3040:   	save	%sp, -0x60, %sp
	.word	0x99eee8c3	! t0_kref+0x3044:   	restore	%i3, 0x8c3, %o4
	.word	0xc398a040	! t0_kref+0x3048:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0x81aa0a46	! t0_kref+0x304c:   	fcmpd	%fcc0, %f8, %f6
	.word	0x95b4c152	! t0_kref+0x3050:   	edge32l	%l3, %l2, %o2
	.word	0xada188c8	! t0_kref+0x3054:   	fsubd	%f6, %f8, %f22
	.word	0x81854000	! t0_kref+0x3058:   	wr	%l5, %g0, %y
	.word	0x27800004	! t0_kref+0x305c:   	fbul,a	_kref+0x306c
	.word	0x81850000	! t0_kref+0x3060:   	wr	%l4, %g0, %y
	.word	0xa5b4862c	! t0_kref+0x3064:   	fmul8x16	%f18, %f12, %f18
	.word	0x81ab8ac8	! t0_kref+0x3068:   	fcmped	%fcc0, %f14, %f8
	.word	0x81a98ad4	! t0_kref+0x306c:   	fcmped	%fcc0, %f6, %f20
	.word	0x92354015	! t0_kref+0x3070:   	orn	%l5, %l5, %o1
	.word	0xeafe101c	! t0_kref+0x3074:   	swapa	[%i0 + %i4]0x80, %l5
	.word	0xd1180018	! t0_kref+0x3078:   	ldd	[%g0 + %i0], %f8
	.word	0xa5a01a48	! t0_kref+0x307c:   	fdtoi	%f8, %f18
	.word	0xea480018	! t0_kref+0x3080:   	ldsb	[%g0 + %i0], %l5
	.word	0x8db40904	! t0_kref+0x3084:   	faligndata	%f16, %f4, %f6
	.word	0xc056c019	! t0_kref+0x3088:   	ldsh	[%i3 + %i1], %g0
	.word	0x3f480004	! t0_kref+0x308c:   	fbo,a,pt	%fcc0, _kref+0x309c
	.word	0x89a018c6	! t0_kref+0x3090:   	fdtos	%f6, %f4
	.word	0x9e34b5de	! t0_kref+0x3094:   	orn	%l2, -0xa22, %o7
	.word	0x81a98a25	! t0_kref+0x3098:   	fcmps	%fcc0, %f6, %f5
	.word	0x2a480001	! t0_kref+0x309c:   	bcs,a,pt	%icc, _kref+0x30a0
	.word	0x80a50016	! t0_kref+0x30a0:   	cmp	%l4, %l6
	.word	0xab408000	! t0_kref+0x30a4:   	mov	%ccr, %l5
	.word	0x90654015	! t0_kref+0x30a8:   	subc	%l5, %l5, %o0
	.word	0x81850000	! t0_kref+0x30ac:   	wr	%l4, %g0, %y
	.word	0xa824c015	! t0_kref+0x30b0:   	sub	%l3, %l5, %l4
	.word	0xe09e5000	! t0_kref+0x30b4:   	ldda	[%i1]0x80, %l0
	.word	0x21480007	! t0_kref+0x30b8:   	fbn,a,pt	%fcc0, _kref+0x30d4
	.word	0x8fa00125	! t0_kref+0x30bc:   	fabss	%f5, %f7
	.word	0xa9b3874c	! t0_kref+0x30c0:   	fpack32	%f14, %f12, %f20
	.word	0xa1b009a7	! t0_kref+0x30c4:   	fexpand	%f7, %f16
	.word	0xa2bd4016	! t0_kref+0x30c8:   	xnorcc	%l5, %l6, %l1
	.word	0x99624012	! t0_kref+0x30cc:   	move	%fcc0, %l2, %o4
	.word	0xe3b8a080	! t0_kref+0x30d0:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x91b54014	! t0_kref+0x30d4:   	edge8	%l5, %l4, %o0
	.word	0x993ca018	! t0_kref+0x30d8:   	sra	%l2, 0x18, %o4
	.word	0x81400000	! t0_kref+0x30dc:   	mov	%y, %g0
	.word	0x85b20aca	! t0_kref+0x30e0:   	fpsub32	%f8, %f10, %f2
	.word	0xa0354012	! t0_kref+0x30e4:   	orn	%l5, %l2, %l0
	.word	0x89aac025	! t0_kref+0x30e8:   	fmovsge	%fcc0, %f5, %f4
	.word	0x2d480002	! t0_kref+0x30ec:   	fbg,a,pt	%fcc0, _kref+0x30f4
	.word	0x8143c000	! t0_kref+0x30f0:   	stbar
	.word	0x94b48016	! t0_kref+0x30f4:   	orncc	%l2, %l6, %o2
	.word	0xd83f4019	! t0_kref+0x30f8:   	std	%o4, [%i5 + %i1]
	.word	0x99b00fe0	! t0_kref+0x30fc:   	fones	%f12
	.word	0x96648016	! t0_kref+0x3100:   	subc	%l2, %l6, %o3
	.word	0xa1a00550	! t0_kref+0x3104:   	fsqrtd	%f16, %f16
	.word	0x81b20450	! t0_kref+0x3108:   	fcmpne16	%f8, %f16, %g0
	.word	0x86102002	! t0_kref+0x310c:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x3110:   	bne,a	_kref+0x3110
	.word	0x86a0e001	! t0_kref+0x3114:   	subcc	%g3, 1, %g3
	.word	0x9804b2ca	! t0_kref+0x3118:   	add	%l2, -0xd36, %o4
	.word	0x9de3bfa0	! t0_kref+0x311c:   	save	%sp, -0x60, %sp
	.word	0xb8d6c01c	! t0_kref+0x3120:   	umulcc	%i3, %i4, %i4
	.word	0x81ee4019	! t0_kref+0x3124:   	restore	%i1, %i1, %g0
	.word	0x2d800008	! t0_kref+0x3128:   	fbg,a	_kref+0x3148
	.word	0x9b3d6015	! t0_kref+0x312c:   	sra	%l5, 0x15, %o5
	.word	0xa5b407cc	! t0_kref+0x3130:   	pdist	%f16, %f12, %f18
	.word	0x9b400000	! t0_kref+0x3134:   	mov	%y, %o5
	.word	0x91b30554	! t0_kref+0x3138:   	fcmpeq16	%f12, %f20, %o0
	.word	0xa2acc016	! t0_kref+0x313c:   	andncc	%l3, %l6, %l1
	.word	0x9fa01a54	! t0_kref+0x3140:   	fdtoi	%f20, %f15
	.word	0x99a80048	! t0_kref+0x3144:   	fmovdn	%fcc0, %f8, %f12
	.word	0xaafd8014	! t0_kref+0x3148:   	sdivcc	%l6, %l4, %l5
	.word	0xa21d4012	! t0_kref+0x314c:   	xor	%l5, %l2, %l1
	.word	0x90ada7ff	! t0_kref+0x3150:   	andncc	%l6, 0x7ff, %o0
	call	SYM(t0_subr2)
	.word	0x89a10d26	! t0_kref+0x3158:   	fsmuld	%f4, %f6, %f4
	.word	0x99b386b0	! t0_kref+0x315c:   	fmul8x16al	%f14, %f16, %f12
	.word	0xa9b285c2	! t0_kref+0x3160:   	fcmpeq32	%f10, %f2, %l4
	.word	0xaad54014	! t0_kref+0x3164:   	umulcc	%l5, %l4, %l5
	.word	0x86102003	! t0_kref+0x3168:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x316c:   	bne,a	_kref+0x316c
	.word	0x86a0e001	! t0_kref+0x3170:   	subcc	%g3, 1, %g3
	.word	0xc118001d	! t0_kref+0x3174:   	ldd	[%g0 + %i5], %f0
	.word	0x99a50852	! t0_kref+0x3178:   	faddd	%f20, %f18, %f12
	.word	0xae45b6fa	! t0_kref+0x317c:   	addc	%l6, -0x906, %l7
	.word	0x9bb50075	! t0_kref+0x3180:   	edge8ln	%l4, %l5, %o5
	.word	0xd656401b	! t0_kref+0x3184:   	ldsh	[%i1 + %i3], %o3
	.word	0xecd61000	! t0_kref+0x3188:   	ldsha	[%i0]0x80, %l6
	.word	0x989db234	! t0_kref+0x318c:   	xorcc	%l6, -0xdcc, %o4
	.word	0x8044aac0	! t0_kref+0x3190:   	addc	%l2, 0xac0, %g0
	.word	0x9de3bfa0	! t0_kref+0x3194:   	save	%sp, -0x60, %sp
	.word	0x81ef7ca3	! t0_kref+0x3198:   	restore	%i5, -0x35d, %g0
	.word	0x9abda985	! t0_kref+0x319c:   	xnorcc	%l6, 0x985, %o5
	call	SYM(t0_subr2)
	.word	0x89b506ea	! t0_kref+0x31a4:   	fmul8ulx16	%f20, %f10, %f4
	.word	0x81aaca2c	! t0_kref+0x31a8:   	fcmps	%fcc0, %f11, %f12
	.word	0x81abcab6	! t0_kref+0x31ac:   	fcmpes	%fcc0, %f15, %f22
	.word	0x81abca2f	! t0_kref+0x31b0:   	fcmps	%fcc0, %f15, %f15
	.word	0x9634ae43	! t0_kref+0x31b4:   	orn	%l2, 0xe43, %o3
	.word	0x91a01a29	! t0_kref+0x31b8:   	fstoi	%f9, %f8
	.word	0x81ab0ad2	! t0_kref+0x31bc:   	fcmped	%fcc0, %f12, %f18
	.word	0x86102004	! t0_kref+0x31c0:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x31c4:   	bne,a	_kref+0x31c4
	.word	0x86a0e001	! t0_kref+0x31c8:   	subcc	%g3, 1, %g3
	.word	0xa5a9c054	! t0_kref+0x31cc:   	fmovdu	%fcc0, %f20, %f18
	.word	0x81ac8a48	! t0_kref+0x31d0:   	fcmpd	%fcc0, %f18, %f8
	.word	0x89a00533	! t0_kref+0x31d4:   	fsqrts	%f19, %f4
	.word	0xd6460000	! t0_kref+0x31d8:   	ldsw	[%i0], %o3
	.word	0x85a00550	! t0_kref+0x31dc:   	fsqrtd	%f16, %f2
	.word	0xa0b57a98	! t0_kref+0x31e0:   	orncc	%l5, -0x568, %l0
	.word	0xe9be5856	! t0_kref+0x31e4:   	stda	%f20, [%i1 + %l6]0xc2
	.word	0x8fa34835	! t0_kref+0x31e8:   	fadds	%f13, %f21, %f7
	.word	0x8184c000	! t0_kref+0x31ec:   	wr	%l3, %g0, %y
	.word	0x9bb00c20	! t0_kref+0x31f0:   	fzeros	%f13
	.word	0xc398a040	! t0_kref+0x31f4:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0xada01a4e	! t0_kref+0x31f8:   	fdtoi	%f14, %f22
	.word	0x29480003	! t0_kref+0x31fc:   	fbl,a,pt	%fcc0, _kref+0x3208
	.word	0x9ea4ef47	! t0_kref+0x3200:   	subcc	%l3, 0xf47, %o7
	.word	0xa1a88048	! t0_kref+0x3204:   	fmovdlg	%fcc0, %f8, %f16
	.word	0x91a0054c	! t0_kref+0x3208:   	fsqrtd	%f12, %f8
	.word	0x9b0cfda0	! t0_kref+0x320c:   	tsubcc	%l3, -0x260, %o5
	.word	0xd0562014	! t0_kref+0x3210:   	ldsh	[%i0 + 0x14], %o0
	.word	0xcd1e401d	! t0_kref+0x3214:   	ldd	[%i1 + %i5], %f6
	.word	0xd186101c	! t0_kref+0x3218:   	lda	[%i0 + %i4]0x80, %f8
	.word	0x21480003	! t0_kref+0x321c:   	fbn,a,pt	%fcc0, _kref+0x3228
	.word	0x945567a8	! t0_kref+0x3220:   	umul	%l5, 0x7a8, %o2
	.word	0x95b009aa	! t0_kref+0x3224:   	fexpand	%f10, %f10
	.word	0x8143c000	! t0_kref+0x3228:   	stbar
	.word	0xc368a0cd	! t0_kref+0x322c:   	prefetch	%g2 + 0xcd, 1
	.word	0xaab48014	! t0_kref+0x3230:   	orncc	%l2, %l4, %l5
	.word	0x3d800005	! t0_kref+0x3234:   	fbule,a	_kref+0x3248
	.word	0xee0e001a	! t0_kref+0x3238:   	ldub	[%i0 + %i2], %l7
	.word	0x81a9caae	! t0_kref+0x323c:   	fcmpes	%fcc0, %f7, %f14
	.word	0x8da508c8	! t0_kref+0x3240:   	fsubd	%f20, %f8, %f6
	.word	0x81858000	! t0_kref+0x3244:   	wr	%l6, %g0, %y
	.word	0x8143c000	! t0_kref+0x3248:   	stbar
	.word	0xa48d8014	! t0_kref+0x324c:   	andcc	%l6, %l4, %l2
	.word	0x87a018cc	! t0_kref+0x3250:   	fdtos	%f12, %f3
	.word	0x9f2c8015	! t0_kref+0x3254:   	sll	%l2, %l5, %o7
	.word	0x91a409ce	! t0_kref+0x3258:   	fdivd	%f16, %f14, %f8
	.word	0xa83c8016	! t0_kref+0x325c:   	xnor	%l2, %l6, %l4
	.word	0xd078a000	! t0_kref+0x3260:   	swap	[%g2], %o0
	.word	0xa1a0054a	! t0_kref+0x3264:   	fsqrtd	%f10, %f16
	.word	0xc807bfe8	! t0_kref+0x3268:   	ld	[%fp - 0x18], %g4
	.word	0x9de3bfa0	! t0_kref+0x326c:   	save	%sp, -0x60, %sp
	.word	0x91e80018	! t0_kref+0x3270:   	restore	%g0, %i0, %o0
	.word	0x81850000	! t0_kref+0x3274:   	wr	%l4, %g0, %y
	.word	0x95a208d0	! t0_kref+0x3278:   	fsubd	%f8, %f16, %f10
	call	SYM(t0_subr1)
	.word	0xaaa50012	! t0_kref+0x3280:   	subcc	%l4, %l2, %l5
	.word	0xe48e101a	! t0_kref+0x3284:   	lduba	[%i0 + %i2]0x80, %l2
	.word	0x81ac0ad0	! t0_kref+0x3288:   	fcmped	%fcc0, %f16, %f16
	.word	0xa1a38d27	! t0_kref+0x328c:   	fsmuld	%f14, %f7, %f16
	.word	0x38480004	! t0_kref+0x3290:   	bgu,a,pt	%icc, _kref+0x32a0
	.word	0xed066014	! t0_kref+0x3294:   	ld	[%i1 + 0x14], %f22
	.word	0x92dc8014	! t0_kref+0x3298:   	smulcc	%l2, %l4, %o1
	.word	0x89b286e4	! t0_kref+0x329c:   	fmul8ulx16	%f10, %f4, %f4
	.word	0xda50a012	! t0_kref+0x32a0:   	ldsh	[%g2 + 0x12], %o5
	.word	0x81d94019	! t0_kref+0x32a4:   	flush	%g5 + %i1
	.word	0x30480004	! t0_kref+0x32a8:   	ba,a,pt	%icc, _kref+0x32b8
	.word	0x8143c000	! t0_kref+0x32ac:   	stbar
	.word	0x94848016	! t0_kref+0x32b0:   	addcc	%l2, %l6, %o2
	.word	0x92454013	! t0_kref+0x32b4:   	addc	%l5, %l3, %o1
	.word	0xec28a02b	! t0_kref+0x32b8:   	stb	%l6, [%g2 + 0x2b]
	.word	0xa27d2150	! t0_kref+0x32bc:   	sdiv	%l4, 0x150, %l1
	.word	0xac348016	! t0_kref+0x32c0:   	orn	%l2, %l6, %l6
	.word	0x81580000	! t0_kref+0x32c4:   	flushw
	.word	0xa1b1c6a3	! t0_kref+0x32c8:   	fmul8x16al	%f7, %f3, %f16
	.word	0x95b00ce7	! t0_kref+0x32cc:   	fnot2s	%f7, %f10
	.word	0x94fd2b8d	! t0_kref+0x32d0:   	sdivcc	%l4, 0xb8d, %o2
	.word	0x96ac8012	! t0_kref+0x32d4:   	andncc	%l2, %l2, %o3
	.word	0x99a00550	! t0_kref+0x32d8:   	fsqrtd	%f16, %f12
	.word	0xa7400000	! t0_kref+0x32dc:   	mov	%y, %l3
	.word	0xcb00a020	! t0_kref+0x32e0:   	ld	[%g2 + 0x20], %f5
	.word	0xea2e8018	! t0_kref+0x32e4:   	stb	%l5, [%i2 + %i0]
	.word	0x38480008	! t0_kref+0x32e8:   	bgu,a,pt	%icc, _kref+0x3308
	.word	0xecae501a	! t0_kref+0x32ec:   	stba	%l6, [%i1 + %i2]0x80
	.word	0xa29ceec1	! t0_kref+0x32f0:   	xorcc	%l3, 0xec1, %l1
	.word	0xc9ee1014	! t0_kref+0x32f4:   	prefetcha	%i0 + %l4, 4
	.word	0x98f54013	! t0_kref+0x32f8:   	udivcc	%l5, %l3, %o4
	.word	0xadb38971	! t0_kref+0x32fc:   	fpmerge	%f14, %f17, %f22
	.word	0x91a208d6	! t0_kref+0x3300:   	fsubd	%f8, %f22, %f8
	.word	0x29480003	! t0_kref+0x3304:   	fbl,a,pt	%fcc0, _kref+0x3310
	.word	0x95a0014a	! t0_kref+0x3308:   	fabsd	%f10, %f10
	.word	0xd840a000	! t0_kref+0x330c:   	ldsw	[%g2], %o4
	.word	0x92fcc014	! t0_kref+0x3310:   	sdivcc	%l3, %l4, %o1
	.word	0x945d4016	! t0_kref+0x3314:   	smul	%l5, %l6, %o2
	.word	0x99b34675	! t0_kref+0x3318:   	fmul8x16au	%f13, %f21, %f12
	.word	0xc920a008	! t0_kref+0x331c:   	st	%f4, [%g2 + 8]
	.word	0xdf06201c	! t0_kref+0x3320:   	ld	[%i0 + 0x1c], %f15
	.word	0x95a00535	! t0_kref+0x3324:   	fsqrts	%f21, %f10
	.word	0x85a18d28	! t0_kref+0x3328:   	fsmuld	%f6, %f8, %f2
	.word	0xadb20ab3	! t0_kref+0x332c:   	fpsub16s	%f8, %f19, %f22
	.word	0x99b009b5	! t0_kref+0x3330:   	fexpand	%f21, %f12
	.word	0xd85e7fe8	! t0_kref+0x3334:   	ldx	[%i1 - 0x18], %o4
	.word	0xe6364000	! t0_kref+0x3338:   	sth	%l3, [%i1]
	.word	0xa3b14e30	! t0_kref+0x333c:   	fands	%f5, %f16, %f17
	.word	0xe2480019	! t0_kref+0x3340:   	ldsb	[%g0 + %i1], %l1
	.word	0xa5a00046	! t0_kref+0x3344:   	fmovd	%f6, %f18
	.word	0x9f408000	! t0_kref+0x3348:   	mov	%ccr, %o7
	.word	0x903574db	! t0_kref+0x334c:   	orn	%l5, -0xb25, %o0
	.word	0x96e48013	! t0_kref+0x3350:   	subccc	%l2, %l3, %o3
	.word	0x9b400000	! t0_kref+0x3354:   	mov	%y, %o5
	.word	0x91a18850	! t0_kref+0x3358:   	faddd	%f6, %f16, %f8
	.word	0xa4f5b253	! t0_kref+0x335c:   	udivcc	%l6, -0xdad, %l2
	.word	0x99a0cd2a	! t0_kref+0x3360:   	fsmuld	%f3, %f10, %f12
	.word	0xe428a00b	! t0_kref+0x3364:   	stb	%l2, [%g2 + 0xb]
	.word	0xa7b00ce6	! t0_kref+0x3368:   	fnot2s	%f6, %f19
	.word	0xe89f5018	! t0_kref+0x336c:   	ldda	[%i5 + %i0]0x80, %l4
	.word	0x993ce015	! t0_kref+0x3370:   	sra	%l3, 0x15, %o4
	.word	0x9fb1caac	! t0_kref+0x3374:   	fpsub16s	%f7, %f12, %f15
	.word	0xa9a2894e	! t0_kref+0x3378:   	fmuld	%f10, %f14, %f20
	.word	0xe6080019	! t0_kref+0x337c:   	ldub	[%g0 + %i1], %l3
	.word	0x95418000	! t0_kref+0x3380:   	mov	%fprs, %o2
	.word	0xe3b8a080	! t0_kref+0x3384:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x001fffff	! t0_kref+0x3388:   	illtrap	0x1fffff
	.word	0xeaae101a	! t0_kref+0x338c:   	stba	%l5, [%i0 + %i2]0x80
	.word	0x90a4fcca	! t0_kref+0x3390:   	subcc	%l3, -0x336, %o0
	.word	0xc900a018	! t0_kref+0x3394:   	ld	[%g2 + 0x18], %f4
	.word	0x913d200d	! t0_kref+0x3398:   	sra	%l4, 0xd, %o0
	call	SYM(t0_subr0)
	.word	0x95b2466b	! t0_kref+0x33a0:   	fmul8x16au	%f9, %f11, %f10
	.word	0xada00529	! t0_kref+0x33a4:   	fsqrts	%f9, %f22
	.word	0xea2e600f	! t0_kref+0x33a8:   	stb	%l5, [%i1 + 0xf]
	.word	0x9664c016	! t0_kref+0x33ac:   	subc	%l3, %l6, %o3
	call	SYM(t0_subr2)
	.word	0xa5b00fc0	! t0_kref+0x33b4:   	fone	%f18
	.word	0xa8ad2f59	! t0_kref+0x33b8:   	andncc	%l4, 0xf59, %l4
	call	SYM(t0_subr0)
	.word	0x89b1cf6a	! t0_kref+0x33c0:   	fornot1s	%f7, %f10, %f4
	.word	0x95b54112	! t0_kref+0x33c4:   	edge32	%l5, %l2, %o2
	.word	0x9da0054a	! t0_kref+0x33c8:   	fsqrtd	%f10, %f14
	.word	0xa784c015	! t0_kref+0x33cc:   	wr	%l3, %l5, %gsr
	.word	0x99b48092	! t0_kref+0x33d0:   	edge16	%l2, %l2, %o4
	.word	0x81d962e2	! t0_kref+0x33d4:   	flush	%g5 + 0x2e2
	.word	0xd91f4018	! t0_kref+0x33d8:   	ldd	[%i5 + %i0], %f12
	.word	0x8184c000	! t0_kref+0x33dc:   	wr	%l3, %g0, %y
	.word	0xac658015	! t0_kref+0x33e0:   	subc	%l6, %l5, %l6
	.word	0x89a0054a	! t0_kref+0x33e4:   	fsqrtd	%f10, %f4
	.word	0x8143e040	! t0_kref+0x33e8:   	membar	0x40
	.word	0xd19e5a5d	! t0_kref+0x33ec:   	ldda	[%i1 + %i5]0xd2, %f8
	.word	0xe06e401a	! t0_kref+0x33f0:   	ldstub	[%i1 + %i2], %l0
	.word	0x32480003	! t0_kref+0x33f4:   	bne,a,pt	%icc, _kref+0x3400
	.word	0xe62e6010	! t0_kref+0x33f8:   	stb	%l3, [%i1 + 0x10]
	.word	0x9e1da063	! t0_kref+0x33fc:   	xor	%l6, 0x63, %o7
	.word	0x86102017	! t0_kref+0x3400:   	mov	0x17, %g3
	.word	0x86a0e001	! t0_kref+0x3404:   	subcc	%g3, 1, %g3
	.word	0x2280000d	! t0_kref+0x3408:   	be,a	_kref+0x343c
	.word	0x95b48076	! t0_kref+0x340c:   	edge8ln	%l2, %l6, %o2
	.word	0x2bbffffd	! t0_kref+0x3410:   	fbug,a	_kref+0x3404
	.word	0x99b1c634	! t0_kref+0x3414:   	fmul8x16	%f7, %f20, %f12
	.word	0x2f4ffffb	! t0_kref+0x3418:   	fbu,a,pt	%fcc0, _kref+0x3404
	.word	0xe168a04a	! t0_kref+0x341c:   	prefetch	%g2 + 0x4a, 16
	.word	0x972d4013	! t0_kref+0x3420:   	sll	%l5, %l3, %o3
	.word	0xab24c016	! t0_kref+0x3424:   	mulscc	%l3, %l6, %l5
	.word	0x3b4ffff7	! t0_kref+0x3428:   	fble,a,pt	%fcc0, _kref+0x3404
	.word	0x9da01935	! t0_kref+0x342c:   	fstod	%f21, %f14
	.word	0xa265609f	! t0_kref+0x3430:   	subc	%l5, 0x9f, %l1
	.word	0x8143c000	! t0_kref+0x3434:   	stbar
	.word	0x91a01883	! t0_kref+0x3438:   	fitos	%f3, %f8
	.word	0xc3ee1013	! t0_kref+0x343c:   	prefetcha	%i0 + %l3, 1
	.word	0x9de3bfa0	! t0_kref+0x3440:   	save	%sp, -0x60, %sp
	.word	0xb880001a	! t0_kref+0x3444:   	addcc	%g0, %i2, %i4
	.word	0x81eee4b5	! t0_kref+0x3448:   	restore	%i3, 0x4b5, %g0
	.word	0x2b480007	! t0_kref+0x344c:   	fbug,a,pt	%fcc0, _kref+0x3468
	.word	0xe8d81019	! t0_kref+0x3450:   	ldxa	[%g0 + %i1]0x80, %l4
	.word	0x8d850013	! t0_kref+0x3454:   	wr	%l4, %l3, %fprs
	.word	0xde500019	! t0_kref+0x3458:   	ldsh	[%g0 + %i1], %o7
	.word	0x24480008	! t0_kref+0x345c:   	ble,a,pt	%icc, _kref+0x347c
	.word	0x9db48624	! t0_kref+0x3460:   	fmul8x16	%f18, %f4, %f14
	.word	0x9da1c930	! t0_kref+0x3464:   	fmuls	%f7, %f16, %f14
	.word	0xea28a030	! t0_kref+0x3468:   	stb	%l5, [%g2 + 0x30]
	.word	0x8143c000	! t0_kref+0x346c:   	stbar
	.word	0xa6258013	! t0_kref+0x3470:   	sub	%l6, %l3, %l3
	.word	0xaa9cfd5d	! t0_kref+0x3474:   	xorcc	%l3, -0x2a3, %l5
	.word	0x97b44d36	! t0_kref+0x3478:   	fandnot1s	%f17, %f22, %f11
	call	1f
	.empty
	.word	0xe64e4000	! t0_kref+0x3480:   	ldsb	[%i1], %l3
	.word	0x81848000	! t0_kref+0x3484:   	wr	%l2, %g0, %y
1:	.word	0x9ba01a32	! t0_kref+0x3488:   	fstoi	%f18, %f13
	.word	0xada44828	! t0_kref+0x348c:   	fadds	%f17, %f8, %f22
	.word	0xa5a0004c	! t0_kref+0x3490:   	fmovd	%f12, %f18
	.word	0xd0801019	! t0_kref+0x3494:   	lda	[%g0 + %i1]0x80, %o0
	.word	0xa0ac8015	! t0_kref+0x3498:   	andncc	%l2, %l5, %l0
	.word	0xcb262000	! t0_kref+0x349c:   	st	%f5, [%i0]
	.word	0xd9062004	! t0_kref+0x34a0:   	ld	[%i0 + 4], %f12
	.word	0x87a00536	! t0_kref+0x34a4:   	fsqrts	%f22, %f3
	.word	0x9ba018c8	! t0_kref+0x34a8:   	fdtos	%f8, %f13
	.word	0x81de400f	! t0_kref+0x34ac:   	flush	%i1 + %o7
	.word	0xa1ab0046	! t0_kref+0x34b0:   	fmovduge	%fcc0, %f6, %f16
	.word	0xe2080019	! t0_kref+0x34b4:   	ldub	[%g0 + %i1], %l1
	.word	0x8143e040	! t0_kref+0x34b8:   	membar	0x40
	.word	0xeaa01018	! t0_kref+0x34bc:   	sta	%l5, [%g0 + %i0]0x80
	.word	0xa9a018d2	! t0_kref+0x34c0:   	fdtos	%f18, %f20
	.word	0x9675297c	! t0_kref+0x34c4:   	udiv	%l4, 0x97c, %o3
	.word	0x3b480006	! t0_kref+0x34c8:   	fble,a,pt	%fcc0, _kref+0x34e0
	.word	0x91a0054e	! t0_kref+0x34cc:   	fsqrtd	%f14, %f8
	.word	0xa9b20f44	! t0_kref+0x34d0:   	fornot1	%f8, %f4, %f20
	.word	0xc9ee1015	! t0_kref+0x34d4:   	prefetcha	%i0 + %l5, 4
	.word	0x95a288d0	! t0_kref+0x34d8:   	fsubd	%f10, %f16, %f10
	.word	0xee86101c	! t0_kref+0x34dc:   	lda	[%i0 + %i4]0x80, %l7
	.word	0x9634a232	! t0_kref+0x34e0:   	orn	%l2, 0x232, %o3
	.word	0x8ba00529	! t0_kref+0x34e4:   	fsqrts	%f9, %f5
	.word	0xa644aa9d	! t0_kref+0x34e8:   	addc	%l2, 0xa9d, %l3
	.word	0xe3b8a080	! t0_kref+0x34ec:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x8ba0052b	! t0_kref+0x34f0:   	fsqrts	%f11, %f5
	.word	0x983d8014	! t0_kref+0x34f4:   	xnor	%l6, %l4, %o4
	.word	0xaa24b525	! t0_kref+0x34f8:   	sub	%l2, -0xadb, %l5
	.word	0xec20a028	! t0_kref+0x34fc:   	st	%l6, [%g2 + 0x28]
	.word	0x91b2cde3	! t0_kref+0x3500:   	fnands	%f11, %f3, %f8
	.word	0xa7400000	! t0_kref+0x3504:   	mov	%y, %l3
	sethi	%hi(2f), %o7
	.word	0xe40be130	! t0_kref+0x350c:   	ldub	[%o7 + 0x130], %l2
	.word	0xa41ca00c	! t0_kref+0x3510:   	xor	%l2, 0xc, %l2
	.word	0xe42be130	! t0_kref+0x3514:   	stb	%l2, [%o7 + 0x130]
	.word	0x81dbe130	! t0_kref+0x3518:   	flush	%o7 + 0x130
	.word	0x91a2482d	! t0_kref+0x351c:   	fadds	%f9, %f13, %f8
	.word	0xd5060000	! t0_kref+0x3520:   	ld	[%i0], %f10
	.word	0xa215bb34	! t0_kref+0x3524:   	or	%l6, -0x4cc, %l1
	.word	0x95a0190a	! t0_kref+0x3528:   	fitod	%f10, %f10
	.word	0x810c8015	! t0_kref+0x352c:   	tsubcc	%l2, %l5, %g0
2:	.word	0xaaad2650	! t0_kref+0x3530:   	andncc	%l4, 0x650, %l5
	.word	0xc9066010	! t0_kref+0x3534:   	ld	[%i1 + 0x10], %f4
	.word	0xf1ee101b	! t0_kref+0x3538:   	prefetcha	%i0 + %i3, 24
	.word	0x3f480005	! t0_kref+0x353c:   	fbo,a,pt	%fcc0, _kref+0x3550
	.word	0xa1a4082d	! t0_kref+0x3540:   	fadds	%f16, %f13, %f16
	.word	0xf007bfe0	! t0_kref+0x3544:   	ld	[%fp - 0x20], %i0
	.word	0xe6766000	! t0_kref+0x3548:   	stx	%l3, [%i1]
	.word	0xa2a48016	! t0_kref+0x354c:   	subcc	%l2, %l6, %l1
	.word	0xa3b5044c	! t0_kref+0x3550:   	fcmpne16	%f20, %f12, %l1
	.word	0x25480008	! t0_kref+0x3554:   	fblg,a,pt	%fcc0, _kref+0x3574
	.word	0x98dd0012	! t0_kref+0x3558:   	smulcc	%l4, %l2, %o4
	.word	0x85b28a94	! t0_kref+0x355c:   	fpsub16	%f10, %f20, %f2
	.word	0xe4b65000	! t0_kref+0x3560:   	stha	%l2, [%i1]0x80
	.word	0xacbcf67e	! t0_kref+0x3564:   	xnorcc	%l3, -0x982, %l6
	.word	0x9a9cf6bb	! t0_kref+0x3568:   	xorcc	%l3, -0x945, %o5
	.word	0x8fa3c830	! t0_kref+0x356c:   	fadds	%f15, %f16, %f7
	.word	0xa5b58634	! t0_kref+0x3570:   	fmul8x16	%f22, %f20, %f18
	.word	0xe24e2006	! t0_kref+0x3574:   	ldsb	[%i0 + 6], %l1
	.word	0xae9d6644	! t0_kref+0x3578:   	xorcc	%l5, 0x644, %l7
	.word	0x9db00fc0	! t0_kref+0x357c:   	fone	%f14
	.word	0xac8cbde8	! t0_kref+0x3580:   	andcc	%l2, -0x218, %l6
	.word	0xa0acb5b5	! t0_kref+0x3584:   	andncc	%l2, -0xa4b, %l0
	.word	0x96354016	! t0_kref+0x3588:   	orn	%l5, %l6, %o3
	.word	0xda40a030	! t0_kref+0x358c:   	ldsw	[%g2 + 0x30], %o5
	.word	0xe620a030	! t0_kref+0x3590:   	st	%l3, [%g2 + 0x30]
	.word	0xa9b106f4	! t0_kref+0x3594:   	fmul8ulx16	%f4, %f20, %f20
	.word	0x8da00152	! t0_kref+0x3598:   	fabsd	%f18, %f6
	.word	0xa124a4b8	! t0_kref+0x359c:   	mulscc	%l2, 0x4b8, %l0
	.word	0xa4e5aba8	! t0_kref+0x35a0:   	subccc	%l6, 0xba8, %l2
	.word	0x91b54012	! t0_kref+0x35a4:   	edge8	%l5, %l2, %o0
	.word	0x81858000	! t0_kref+0x35a8:   	wr	%l6, %g0, %y
	.word	0x98356bff	! t0_kref+0x35ac:   	orn	%l5, 0xbff, %o4
	.word	0xe926401c	! t0_kref+0x35b0:   	st	%f20, [%i1 + %i4]
	.word	0xaead8012	! t0_kref+0x35b4:   	andncc	%l6, %l2, %l7
	.word	0xcb270018	! t0_kref+0x35b8:   	st	%f5, [%i4 + %i0]
	.word	0x81ad8aa3	! t0_kref+0x35bc:   	fcmpes	%fcc0, %f22, %f3
	.word	0xe06e3ffa	! t0_kref+0x35c0:   	ldstub	[%i0 - 6], %l0
	.word	0x95a00550	! t0_kref+0x35c4:   	fsqrtd	%f16, %f10
	.word	0xa4ad4015	! t0_kref+0x35c8:   	andncc	%l5, %l5, %l2
	.word	0xec9e501d	! t0_kref+0x35cc:   	ldda	[%i1 + %i5]0x80, %l6
	.word	0xa4e4f829	! t0_kref+0x35d0:   	subccc	%l3, -0x7d7, %l2
	.word	0xadb50096	! t0_kref+0x35d4:   	edge16	%l4, %l6, %l6
	call	SYM(t0_subr1)
	.word	0xe828a033	! t0_kref+0x35dc:   	stb	%l4, [%g2 + 0x33]
	.word	0x98e4c015	! t0_kref+0x35e0:   	subccc	%l3, %l5, %o4
	.word	0x99a00529	! t0_kref+0x35e4:   	fsqrts	%f9, %f12
	.word	0x80bc8012	! t0_kref+0x35e8:   	xnorcc	%l2, %l2, %g0
	.word	0x91b40a6f	! t0_kref+0x35ec:   	fpadd32s	%f16, %f15, %f8
	.word	0x8d858016	! t0_kref+0x35f0:   	wr	%l6, %l6, %fprs
	.word	0x81ac0ad2	! t0_kref+0x35f4:   	fcmped	%fcc0, %f16, %f18
	.word	0xa1a00548	! t0_kref+0x35f8:   	fsqrtd	%f8, %f16
	.word	0x8143c000	! t0_kref+0x35fc:   	stbar
	.word	0xa2a58014	! t0_kref+0x3600:   	subcc	%l6, %l4, %l1
	.word	0xaa653599	! t0_kref+0x3604:   	subc	%l4, -0xa67, %l5
	.word	0xa7b0076e	! t0_kref+0x3608:   	fpack16	%f14, %f19
	.word	0x90256803	! t0_kref+0x360c:   	sub	%l5, 0x803, %o0
	call	SYM(t0_subr3)
	.word	0x9db30ed4	! t0_kref+0x3614:   	fornot2	%f12, %f20, %f14
	.word	0x99158014	! t0_kref+0x3618:   	taddcctv	%l6, %l4, %o4
	.word	0xd91e2000	! t0_kref+0x361c:   	ldd	[%i0], %f12
	.word	0x989d4016	! t0_kref+0x3620:   	xorcc	%l5, %l6, %o4
	.word	0x92f4f47c	! t0_kref+0x3624:   	udivcc	%l3, -0xb84, %o1
	.word	0xd51e4000	! t0_kref+0x3628:   	ldd	[%i1], %f10
	.word	0xe62e8019	! t0_kref+0x362c:   	stb	%l3, [%i2 + %i1]
	.word	0x91b18a82	! t0_kref+0x3630:   	fpsub16	%f6, %f2, %f8
	.word	0xadb10ec4	! t0_kref+0x3634:   	fornot2	%f4, %f4, %f22
	.word	0x987d7d5b	! t0_kref+0x3638:   	sdiv	%l5, -0x2a5, %o4
	.word	0xec500019	! t0_kref+0x363c:   	ldsh	[%g0 + %i1], %l6
	.word	0x96f50016	! t0_kref+0x3640:   	udivcc	%l4, %l6, %o3
	.word	0x89a0014e	! t0_kref+0x3644:   	fabsd	%f14, %f4
	.word	0xd1e65016	! t0_kref+0x3648:   	casa	[%i1]0x80, %l6, %o0
	.word	0xe2881018	! t0_kref+0x364c:   	lduba	[%g0 + %i0]0x80, %l1
	.word	0xc568a088	! t0_kref+0x3650:   	prefetch	%g2 + 0x88, 2
	.word	0xab3c8014	! t0_kref+0x3654:   	sra	%l2, %l4, %l5
	.word	0x8fa00530	! t0_kref+0x3658:   	fsqrts	%f16, %f7
	.word	0xdd063fe8	! t0_kref+0x365c:   	ld	[%i0 - 0x18], %f14
	.word	0x8bb00fe0	! t0_kref+0x3660:   	fones	%f5
	.word	0xadb00cc8	! t0_kref+0x3664:   	fnot2	%f8, %f22
	.word	0x85a509d0	! t0_kref+0x3668:   	fdivd	%f20, %f16, %f2
	.word	0xffee101d	! t0_kref+0x366c:   	prefetcha	%i0 + %i5, 31
	.word	0x95a1492f	! t0_kref+0x3670:   	fmuls	%f5, %f15, %f10
	.word	0x81aa0a46	! t0_kref+0x3674:   	fcmpd	%fcc0, %f8, %f6
	.word	0x94a4c015	! t0_kref+0x3678:   	subcc	%l3, %l5, %o2
	.word	0x89b30e04	! t0_kref+0x367c:   	fand	%f12, %f4, %f4
	.word	0x86102013	! t0_kref+0x3680:   	mov	0x13, %g3
	.word	0x86a0e001	! t0_kref+0x3684:   	subcc	%g3, 1, %g3
	.word	0x2280001f	! t0_kref+0x3688:   	be,a	_kref+0x3704
	.word	0x99b00c00	! t0_kref+0x368c:   	fzero	%f12
	.word	0x85b20a4c	! t0_kref+0x3690:   	fpadd32	%f8, %f12, %f2
	.word	0xaa657cdc	! t0_kref+0x3694:   	subc	%l5, -0x324, %l5
	.word	0x93354012	! t0_kref+0x3698:   	srl	%l5, %l2, %o1
	.word	0xcd20a010	! t0_kref+0x369c:   	st	%f6, [%g2 + 0x10]
	.word	0x803d719d	! t0_kref+0x36a0:   	xnor	%l5, -0xe63, %g0
	call	SYM(t0_subr0)
	.word	0x94654015	! t0_kref+0x36a8:   	subc	%l5, %l5, %o2
	.word	0x8da0190d	! t0_kref+0x36ac:   	fitod	%f13, %f6
	.word	0x224ffff5	! t0_kref+0x36b0:   	be,a,pt	%icc, _kref+0x3684
	.word	0xe428a001	! t0_kref+0x36b4:   	stb	%l2, [%g2 + 1]
	.word	0x87b30fa7	! t0_kref+0x36b8:   	fors	%f12, %f7, %f3
	.word	0x95a01052	! t0_kref+0x36bc:   	fdtox	%f18, %f10
	.word	0xa5a01a4c	! t0_kref+0x36c0:   	fdtoi	%f12, %f18
	.word	0xa1a00556	! t0_kref+0x36c4:   	fsqrtd	%f22, %f16
	.word	0xe830a03a	! t0_kref+0x36c8:   	sth	%l4, [%g2 + 0x3a]
	.word	0x3a4fffee	! t0_kref+0x36cc:   	bcc,a,pt	%icc, _kref+0x3684
	.word	0x95a5884a	! t0_kref+0x36d0:   	faddd	%f22, %f10, %f10
	.word	0x27480001	! t0_kref+0x36d4:   	fbul,a,pt	%fcc0, _kref+0x36d8
	.word	0xa25d8014	! t0_kref+0x36d8:   	smul	%l6, %l4, %l1
	.word	0x89a01932	! t0_kref+0x36dc:   	fstod	%f18, %f4
	.word	0x81ab0ad4	! t0_kref+0x36e0:   	fcmped	%fcc0, %f12, %f20
	.word	0xa074f37d	! t0_kref+0x36e4:   	udiv	%l3, -0xc83, %l0
	.word	0xe326601c	! t0_kref+0x36e8:   	st	%f17, [%i1 + 0x1c]
	.word	0x81de801e	! t0_kref+0x36ec:   	flush	%i2 + %fp
	.word	0x87b00cec	! t0_kref+0x36f0:   	fnot2s	%f12, %f3
	.word	0xafb4c116	! t0_kref+0x36f4:   	edge32	%l3, %l6, %l7
	.word	0xac148012	! t0_kref+0x36f8:   	or	%l2, %l2, %l6
	.word	0x9e54aebb	! t0_kref+0x36fc:   	umul	%l2, 0xebb, %o7
	.word	0xa49d8014	! t0_kref+0x3700:   	xorcc	%l6, %l4, %l2
	.word	0x9db38990	! t0_kref+0x3704:   	bshuffle	%f14, %f16, %f14
	.word	0xda8e501a	! t0_kref+0x3708:   	lduba	[%i1 + %i2]0x80, %o5
	.word	0x901d4014	! t0_kref+0x370c:   	xor	%l5, %l4, %o0
	.word	0x9da288ca	! t0_kref+0x3710:   	fsubd	%f10, %f10, %f14
	.word	0xaab58013	! t0_kref+0x3714:   	orncc	%l6, %l3, %l5
	.word	0xabb184cc	! t0_kref+0x3718:   	fcmpne32	%f6, %f12, %l5
	call	SYM(t0_subr3)
	.word	0x90f4eaa2	! t0_kref+0x3720:   	udivcc	%l3, 0xaa2, %o0
	.word	0x91b50db2	! t0_kref+0x3724:   	fxors	%f20, %f18, %f8
	.word	0xa3400000	! t0_kref+0x3728:   	mov	%y, %l1
	.word	0x81a90ace	! t0_kref+0x372c:   	fcmped	%fcc0, %f4, %f14
	.word	0x87a00526	! t0_kref+0x3730:   	fsqrts	%f6, %f3
	.word	0xcf062000	! t0_kref+0x3734:   	ld	[%i0], %f7
	.word	0xc168a08f	! t0_kref+0x3738:   	prefetch	%g2 + 0x8f, 0
	.word	0xa3254016	! t0_kref+0x373c:   	mulscc	%l5, %l6, %l1
	.word	0xd7f65013	! t0_kref+0x3740:   	casxa	[%i1]0x80, %l3, %o3
	.word	0xa6158012	! t0_kref+0x3744:   	or	%l6, %l2, %l3
	.word	0xe82e3fec	! t0_kref+0x3748:   	stb	%l4, [%i0 - 0x14]
	.word	0x809d2f56	! t0_kref+0x374c:   	xorcc	%l4, 0xf56, %g0
	.word	0xd3270019	! t0_kref+0x3750:   	st	%f9, [%i4 + %i1]
	.word	0xace5a4f4	! t0_kref+0x3754:   	subccc	%l6, 0x4f4, %l6
	.word	0x9a9db001	! t0_kref+0x3758:   	xorcc	%l6, -0xfff, %o5
	.word	0xe820a018	! t0_kref+0x375c:   	st	%l4, [%g2 + 0x18]
	.word	0xa1a308d6	! t0_kref+0x3760:   	fsubd	%f12, %f22, %f16
	.word	0x9bb50f73	! t0_kref+0x3764:   	fornot1s	%f20, %f19, %f13
	.word	0x8fa01a52	! t0_kref+0x3768:   	fdtoi	%f18, %f7
	.word	0xa3400000	! t0_kref+0x376c:   	mov	%y, %l1
	.word	0x99a01933	! t0_kref+0x3770:   	fstod	%f19, %f12
	.word	0x9fa00123	! t0_kref+0x3774:   	fabss	%f3, %f15
	.word	0xe5200018	! t0_kref+0x3778:   	st	%f18, [%g0 + %i0]
	.word	0xe4086ec0	! t0_kref+0x377c:   	ldub	[%g1 + 0xec0], %l2
	.word	0xa41ca00c	! t0_kref+0x3780:   	xor	%l2, 0xc, %l2
	.word	0xe4286ec0	! t0_kref+0x3784:   	stb	%l2, [%g1 + 0xec0]
	.word	0x81d86ec0	! t0_kref+0x3788:   	flush	%g1 + 0xec0
	.word	0xa5a00552	! t0_kref+0x378c:   	fsqrtd	%f18, %f18
	.word	0xa814b7bc	! t0_kref+0x3790:   	or	%l2, -0x844, %l4
	.word	0xa784be8c	! t0_kref+0x3794:   	wr	%l2, 0xfffffe8c, %gsr
	.word	0x95a01923	! t0_kref+0x3798:   	fstod	%f3, %f10
	.word	0x81daa80e	! t0_kref+0x379c:   	flush	%o2 + 0x80e
	.word	0xe82e6002	! t0_kref+0x37a0:   	stb	%l4, [%i1 + 2]
	.word	0x2e800001	! t0_kref+0x37a4:   	bvs,a	_kref+0x37a8
	.word	0x81b4c0b6	! t0_kref+0x37a8:   	edge16n	%l3, %l6, %g0
	.word	0x953d2003	! t0_kref+0x37ac:   	sra	%l4, 0x3, %o2
2:	.word	0xec28a01a	! t0_kref+0x37b0:   	stb	%l6, [%g2 + 0x1a]
	.word	0xedee101d	! t0_kref+0x37b4:   	prefetcha	%i0 + %i5, 22
	.word	0x922565a4	! t0_kref+0x37b8:   	sub	%l5, 0x5a4, %o1
	.word	0xa3b54112	! t0_kref+0x37bc:   	edge32	%l5, %l2, %l1
	.word	0xa9a2084c	! t0_kref+0x37c0:   	faddd	%f8, %f12, %f20
	.word	0x9de3bfa0	! t0_kref+0x37c4:   	save	%sp, -0x60, %sp
	.word	0xb4460000	! t0_kref+0x37c8:   	addc	%i0, %g0, %i2
	.word	0xa3e8001b	! t0_kref+0x37cc:   	restore	%g0, %i3, %l1
	.word	0x9af50013	! t0_kref+0x37d0:   	udivcc	%l4, %l3, %o5
	.word	0x91a00542	! t0_kref+0x37d4:   	fsqrtd	%f2, %f8
	.word	0xab3ca001	! t0_kref+0x37d8:   	sra	%l2, 0x1, %l5
	.word	0xcf267ffc	! t0_kref+0x37dc:   	st	%f7, [%i1 - 4]
	.word	0x9914c012	! t0_kref+0x37e0:   	taddcctv	%l3, %l2, %o4
	.word	0x81ad0a52	! t0_kref+0x37e4:   	fcmpd	%fcc0, %f20, %f18
	.word	0x9db00c00	! t0_kref+0x37e8:   	fzero	%f14
	.word	0x23480003	! t0_kref+0x37ec:   	fbne,a,pt	%fcc0, _kref+0x37f8
	.word	0x89b34fb6	! t0_kref+0x37f0:   	fors	%f13, %f22, %f4
	.word	0x91a10d29	! t0_kref+0x37f4:   	fsmuld	%f4, %f9, %f8
	.word	0xac254015	! t0_kref+0x37f8:   	sub	%l5, %l5, %l6
	.word	0xa81cf6d8	! t0_kref+0x37fc:   	xor	%l3, -0x928, %l4
	.word	0x9a048013	! t0_kref+0x3800:   	add	%l2, %l3, %o5
	.word	0x89a0190d	! t0_kref+0x3804:   	fitod	%f13, %f4
	.word	0xd720a038	! t0_kref+0x3808:   	st	%f11, [%g2 + 0x38]
	.word	0x9140c000	! t0_kref+0x380c:   	mov	%asi, %o0
	.word	0xac353981	! t0_kref+0x3810:   	orn	%l4, -0x67f, %l6
	.word	0x97408000	! t0_kref+0x3814:   	mov	%ccr, %o3
	.word	0x9644c012	! t0_kref+0x3818:   	addc	%l3, %l2, %o3
	.word	0xa235bda2	! t0_kref+0x381c:   	orn	%l6, -0x25e, %l1
	.word	0xd216200c	! t0_kref+0x3820:   	lduh	[%i0 + 0xc], %o1
	.word	0x967d7c2e	! t0_kref+0x3824:   	sdiv	%l5, -0x3d2, %o3
	.word	0x8da14827	! t0_kref+0x3828:   	fadds	%f5, %f7, %f6
	.word	0xea30a002	! t0_kref+0x382c:   	sth	%l5, [%g2 + 2]
	.word	0xc91e2010	! t0_kref+0x3830:   	ldd	[%i0 + 0x10], %f4
	.word	0xb8102014	! t0_kref+0x3834:   	mov	0x14, %i4
	.word	0x9b3c8012	! t0_kref+0x3838:   	sra	%l2, %l2, %o5
	.word	0xeb262008	! t0_kref+0x383c:   	st	%f21, [%i0 + 8]
	.word	0xed180018	! t0_kref+0x3840:   	ldd	[%g0 + %i0], %f22
	.word	0xe4300019	! t0_kref+0x3844:   	sth	%l2, [%g0 + %i1]
	.word	0xe628a00a	! t0_kref+0x3848:   	stb	%l3, [%g2 + 0xa]
	.word	0x9ee50013	! t0_kref+0x384c:   	subccc	%l4, %l3, %o7
	.word	0x93b00f27	! t0_kref+0x3850:   	fsrc2s	%f7, %f9
	.word	0xd45e3ff0	! t0_kref+0x3854:   	ldx	[%i0 - 0x10], %o2
	.word	0x8143e00a	! t0_kref+0x3858:   	membar	0xa
	.word	0xa9a9c046	! t0_kref+0x385c:   	fmovdu	%fcc0, %f6, %f20
	.word	0x87a00534	! t0_kref+0x3860:   	fsqrts	%f20, %f3
	.word	0xac248016	! t0_kref+0x3864:   	sub	%l2, %l6, %l6
	.word	0x810d4016	! t0_kref+0x3868:   	tsubcc	%l5, %l6, %g0
	.word	0x81858000	! t0_kref+0x386c:   	wr	%l6, %g0, %y
	.word	0x813d6010	! t0_kref+0x3870:   	sra	%l5, 0x10, %g0
	.word	0x95a188d0	! t0_kref+0x3874:   	fsubd	%f6, %f16, %f10
	.word	0x3d480004	! t0_kref+0x3878:   	fbule,a,pt	%fcc0, _kref+0x3888
	.word	0x81854000	! t0_kref+0x387c:   	wr	%l5, %g0, %y
	.word	0xa7b48333	! t0_kref+0x3880:   	bmask	%l2, %l3, %l3
	.word	0x92c58016	! t0_kref+0x3884:   	addccc	%l6, %l6, %o1
	.word	0xa1b48a90	! t0_kref+0x3888:   	fpsub16	%f18, %f16, %f16
	.word	0x95b50333	! t0_kref+0x388c:   	bmask	%l4, %l3, %o2
	.word	0xd11fbc08	! t0_kref+0x3890:   	ldd	[%fp - 0x3f8], %f8
	.word	0x81a90ac6	! t0_kref+0x3894:   	fcmped	%fcc0, %f4, %f6
	.word	0xea280018	! t0_kref+0x3898:   	stb	%l5, [%g0 + %i0]
	.word	0xa93cc016	! t0_kref+0x389c:   	sra	%l3, %l6, %l4
	.word	0xa9b40708	! t0_kref+0x38a0:   	fmuld8sux16	%f16, %f8, %f20
	.word	0x86102002	! t0_kref+0x38a4:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x38a8:   	bne,a	_kref+0x38a8
	.word	0x86a0e001	! t0_kref+0x38ac:   	subcc	%g3, 1, %g3
	.word	0x99a0052a	! t0_kref+0x38b0:   	fsqrts	%f10, %f12
	.word	0x8143c000	! t0_kref+0x38b4:   	stbar
	.word	0x9f414000	! t0_kref+0x38b8:   	mov	%pc, %o7
	.word	0xe5f65016	! t0_kref+0x38bc:   	casxa	[%i1]0x80, %l6, %l2
	.word	0xa9a2c836	! t0_kref+0x38c0:   	fadds	%f11, %f22, %f20
	.word	0x37480004	! t0_kref+0x38c4:   	fbge,a,pt	%fcc0, _kref+0x38d4
	.word	0xa7b500b5	! t0_kref+0x38c8:   	edge16n	%l4, %l5, %l3
	.word	0xd1180019	! t0_kref+0x38cc:   	ldd	[%g0 + %i1], %f8
	.word	0xa5a01a31	! t0_kref+0x38d0:   	fstoi	%f17, %f18
	.word	0x96e5313c	! t0_kref+0x38d4:   	subccc	%l4, -0xec4, %o3
	.word	0xa1b2c663	! t0_kref+0x38d8:   	fmul8x16au	%f11, %f3, %f16
	.word	0xed871019	! t0_kref+0x38dc:   	lda	[%i4 + %i1]0x80, %f22
	.word	0xea28a01b	! t0_kref+0x38e0:   	stb	%l5, [%g2 + 0x1b]
	.word	0x81a94aaa	! t0_kref+0x38e4:   	fcmpes	%fcc0, %f5, %f10
	.word	0xdad6d018	! t0_kref+0x38e8:   	ldsha	[%i3 + %i0]0x80, %o5
	.word	0x9bb48116	! t0_kref+0x38ec:   	edge32	%l2, %l6, %o5
	.word	0x99256bea	! t0_kref+0x38f0:   	mulscc	%l5, 0xbea, %o4
	.word	0x91a00148	! t0_kref+0x38f4:   	fabsd	%f8, %f8
	.word	0xd700a018	! t0_kref+0x38f8:   	ld	[%g2 + 0x18], %f11
	.word	0x89b40a28	! t0_kref+0x38fc:   	fpadd16s	%f16, %f8, %f4
	.word	0x91a2cd32	! t0_kref+0x3900:   	fsmuld	%f11, %f18, %f8
	.word	0xd11e6010	! t0_kref+0x3904:   	ldd	[%i1 + 0x10], %f8
	.word	0x9e3d0013	! t0_kref+0x3908:   	xnor	%l4, %l3, %o7
	.word	0xa3b54dab	! t0_kref+0x390c:   	fxors	%f21, %f11, %f17
	.word	0x81de743b	! t0_kref+0x3910:   	flush	%i1 - 0xbc5
	.word	0x95a188b2	! t0_kref+0x3914:   	fsubs	%f6, %f18, %f10
	.word	0xe84e3fec	! t0_kref+0x3918:   	ldsb	[%i0 - 0x14], %l4
	.word	0xd906001c	! t0_kref+0x391c:   	ld	[%i0 + %i4], %f12
	.word	0x81ad0a2d	! t0_kref+0x3920:   	fcmps	%fcc0, %f20, %f13
	.word	0x9e5d71fb	! t0_kref+0x3924:   	smul	%l5, -0xe05, %o7
	.word	0x9fc10000	! t0_kref+0x3928:   	call	%g4
	.word	0x89b54a63	! t0_kref+0x392c:   	fpadd32s	%f21, %f3, %f4
	.word	0xae748014	! t0_kref+0x3930:   	udiv	%l2, %l4, %l7
	.word	0xc078a000	! t0_kref+0x3934:   	swap	[%g2], %g0
	.word	0x99a588ca	! t0_kref+0x3938:   	fsubd	%f22, %f10, %f12
	.word	0x923c8014	! t0_kref+0x393c:   	xnor	%l2, %l4, %o1
	.word	0x8184c000	! t0_kref+0x3940:   	wr	%l3, %g0, %y
	.word	0x34800007	! t0_kref+0x3944:   	bg,a	_kref+0x3960
	.word	0xa6250012	! t0_kref+0x3948:   	sub	%l4, %l2, %l3
	.word	0x81ad4a2f	! t0_kref+0x394c:   	fcmps	%fcc0, %f21, %f15
	.word	0xe26e7fee	! t0_kref+0x3950:   	ldstub	[%i1 - 0x12], %l1
	.word	0x90d48016	! t0_kref+0x3954:   	umulcc	%l2, %l6, %o0
	.word	0x9ea53634	! t0_kref+0x3958:   	subcc	%l4, -0x9cc, %o7
	.word	0xa1a40846	! t0_kref+0x395c:   	faddd	%f16, %f6, %f16
	.word	0xa7a5482c	! t0_kref+0x3960:   	fadds	%f21, %f12, %f19
	.word	0xa21d0015	! t0_kref+0x3964:   	xor	%l4, %l5, %l1
	.word	0xa4854014	! t0_kref+0x3968:   	addcc	%l5, %l4, %l2
	.word	0xa2e57eb7	! t0_kref+0x396c:   	subccc	%l5, -0x149, %l1
	.word	0x8143c000	! t0_kref+0x3970:   	stbar
	.word	0xd11e6010	! t0_kref+0x3974:   	ldd	[%i1 + 0x10], %f8
	.word	0x9a248016	! t0_kref+0x3978:   	sub	%l2, %l6, %o5
	.word	0xec28a039	! t0_kref+0x397c:   	stb	%l6, [%g2 + 0x39]
	.word	0xda064000	! t0_kref+0x3980:   	ld	[%i1], %o5
	.word	0xa93ca017	! t0_kref+0x3984:   	sra	%l2, 0x17, %l4
	.word	0xc568a086	! t0_kref+0x3988:   	prefetch	%g2 + 0x86, 2
	.word	0x3e480005	! t0_kref+0x398c:   	bvc,a,pt	%icc, _kref+0x39a0
	.word	0xa9b20544	! t0_kref+0x3990:   	fcmpeq16	%f8, %f4, %l4
	.word	0x8143c000	! t0_kref+0x3994:   	stbar
	.word	0x9e9db972	! t0_kref+0x3998:   	xorcc	%l6, -0x68e, %o7
	.word	0xaa454015	! t0_kref+0x399c:   	addc	%l5, %l5, %l5
	.word	0x91a01a52	! t0_kref+0x39a0:   	fdtoi	%f18, %f8
	call	SYM(t0_subr2)
	.word	0x8da208d6	! t0_kref+0x39a8:   	fsubd	%f8, %f22, %f6
	.word	0xa1408000	! t0_kref+0x39ac:   	mov	%ccr, %l0
	.word	0x81ad0ac6	! t0_kref+0x39b0:   	fcmped	%fcc0, %f20, %f6
	.word	0x8da0054c	! t0_kref+0x39b4:   	fsqrtd	%f12, %f6
	.word	0xa966a77f	! t0_kref+0x39b8:   	movg	%icc, -0x81, %l4
	.word	0x81a88acc	! t0_kref+0x39bc:   	fcmped	%fcc0, %f2, %f12
	.word	0xa9a00552	! t0_kref+0x39c0:   	fsqrtd	%f18, %f20
	.word	0xd11e0000	! t0_kref+0x39c4:   	ldd	[%i0], %f8
	.word	0xaea48015	! t0_kref+0x39c8:   	subcc	%l2, %l5, %l7
	.word	0x3d480001	! t0_kref+0x39cc:   	fbule,a,pt	%fcc0, _kref+0x39d0
	.word	0xd0871019	! t0_kref+0x39d0:   	lda	[%i4 + %i1]0x80, %o0
	.word	0x948d4015	! t0_kref+0x39d4:   	andcc	%l5, %l5, %o2
	.word	0xaf050016	! t0_kref+0x39d8:   	taddcc	%l4, %l6, %l7
	.word	0x3d480008	! t0_kref+0x39dc:   	fbule,a,pt	%fcc0, _kref+0x39fc
	.word	0x81da7f77	! t0_kref+0x39e0:   	flush	%o1 - 0x89
	.word	0x99a30848	! t0_kref+0x39e4:   	faddd	%f12, %f8, %f12
	.word	0x22480002	! t0_kref+0x39e8:   	be,a,pt	%icc, _kref+0x39f0
	.word	0xaba0052a	! t0_kref+0x39ec:   	fsqrts	%f10, %f21
	.word	0xc368a003	! t0_kref+0x39f0:   	prefetch	%g2 + 3, 1
	.word	0x9fc00004	! t0_kref+0x39f4:   	call	%g0 + %g4
	.word	0x91b30a52	! t0_kref+0x39f8:   	fpadd32	%f12, %f18, %f8
	.word	0x9fa00524	! t0_kref+0x39fc:   	fsqrts	%f4, %f15
	.word	0xe430a010	! t0_kref+0x3a00:   	sth	%l2, [%g2 + 0x10]
	.word	0xea2e201a	! t0_kref+0x3a04:   	stb	%l5, [%i0 + 0x1a]
	.word	0x8fa01a46	! t0_kref+0x3a08:   	fdtoi	%f6, %f7
	.word	0x9814b8e3	! t0_kref+0x3a0c:   	or	%l2, -0x71d, %o4
	.word	0xa464be00	! t0_kref+0x3a10:   	subc	%l2, -0x200, %l2
	.word	0xea36601a	! t0_kref+0x3a14:   	sth	%l5, [%i1 + 0x1a]
	.word	0x81a98ac6	! t0_kref+0x3a18:   	fcmped	%fcc0, %f6, %f6
	.word	0x80f58016	! t0_kref+0x3a1c:   	udivcc	%l6, %l6, %g0
	.word	0xe7263ffc	! t0_kref+0x3a20:   	st	%f19, [%i0 - 4]
	.word	0x87a01a46	! t0_kref+0x3a24:   	fdtoi	%f6, %f3
	.word	0x85a01024	! t0_kref+0x3a28:   	fstox	%f4, %f2
	.word	0xe968a0c2	! t0_kref+0x3a2c:   	prefetch	%g2 + 0xc2, 20
	.word	0xa5aa804a	! t0_kref+0x3a30:   	fmovdue	%fcc0, %f10, %f18
	.word	0xa9a5084c	! t0_kref+0x3a34:   	faddd	%f20, %f12, %f20
	.word	0x91b0cfa5	! t0_kref+0x3a38:   	fors	%f3, %f5, %f8
	.word	0xea20a038	! t0_kref+0x3a3c:   	st	%l5, [%g2 + 0x38]
	.word	0x94ad8016	! t0_kref+0x3a40:   	andncc	%l6, %l6, %o2
	.word	0x93254015	! t0_kref+0x3a44:   	mulscc	%l5, %l5, %o1
	.word	0x97400000	! t0_kref+0x3a48:   	mov	%y, %o3
	.word	0xed68a048	! t0_kref+0x3a4c:   	prefetch	%g2 + 0x48, 22
	.word	0xe048a00a	! t0_kref+0x3a50:   	ldsb	[%g2 + 0xa], %l0
	.word	0x81b48512	! t0_kref+0x3a54:   	fcmpgt16	%f18, %f18, %g0
	.word	0xd91e3fe0	! t0_kref+0x3a58:   	ldd	[%i0 - 0x20], %f12
	.word	0x81858000	! t0_kref+0x3a5c:   	wr	%l6, %g0, %y
	.word	0xe8566012	! t0_kref+0x3a60:   	ldsh	[%i1 + 0x12], %l4
	.word	0xa9a00544	! t0_kref+0x3a64:   	fsqrtd	%f4, %f20
	.word	0xe82e601a	! t0_kref+0x3a68:   	stb	%l4, [%i1 + 0x1a]
	.word	0xa4350012	! t0_kref+0x3a6c:   	orn	%l4, %l2, %l2
	.word	0xab2d0013	! t0_kref+0x3a70:   	sll	%l4, %l3, %l5
	.word	0xc768a0cd	! t0_kref+0x3a74:   	prefetch	%g2 + 0xcd, 3
	.word	0xa6748012	! t0_kref+0x3a78:   	udiv	%l2, %l2, %l3
	.word	0x9fb205ca	! t0_kref+0x3a7c:   	fcmpeq32	%f8, %f10, %o7
	.word	0xd7066010	! t0_kref+0x3a80:   	ld	[%i1 + 0x10], %f11
	.word	0xe1be1852	! t0_kref+0x3a84:   	stda	%f16, [%i0 + %l2]0xc2
	.word	0xe41e401d	! t0_kref+0x3a88:   	ldd	[%i1 + %i5], %l2
	.word	0x37480002	! t0_kref+0x3a8c:   	fbge,a,pt	%fcc0, _kref+0x3a94
	.word	0x89aa4023	! t0_kref+0x3a90:   	fmovse	%fcc0, %f3, %f4
	.word	0xe3b8a080	! t0_kref+0x3a94:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x34480005	! t0_kref+0x3a98:   	bg,a,pt	%icc, _kref+0x3aac
	.word	0xea30a002	! t0_kref+0x3a9c:   	sth	%l5, [%g2 + 2]
	.word	0x9e1d8016	! t0_kref+0x3aa0:   	xor	%l6, %l6, %o7
	.word	0xa7a44829	! t0_kref+0x3aa4:   	fadds	%f17, %f9, %f19
	.word	0x8143c000	! t0_kref+0x3aa8:   	stbar
	.word	0xa5b1c6aa	! t0_kref+0x3aac:   	fmul8x16al	%f7, %f10, %f18
	.word	0xc0100019	! t0_kref+0x3ab0:   	lduh	[%g0 + %i1], %g0
	.word	0x3f480001	! t0_kref+0x3ab4:   	fbo,a,pt	%fcc0, _kref+0x3ab8
	.word	0x97b1850c	! t0_kref+0x3ab8:   	fcmpgt16	%f6, %f12, %o3
	.word	0xc99e1a5b	! t0_kref+0x3abc:   	ldda	[%i0 + %i3]0xd2, %f4
	.word	0x972d0016	! t0_kref+0x3ac0:   	sll	%l4, %l6, %o3
	.word	0xe5ee501a	! t0_kref+0x3ac4:   	prefetcha	%i1 + %i2, 18
	.word	0x943d643d	! t0_kref+0x3ac8:   	xnor	%l5, 0x43d, %o2
	.word	0x8da24d26	! t0_kref+0x3acc:   	fsmuld	%f9, %f6, %f6
	.word	0x81aa0a4e	! t0_kref+0x3ad0:   	fcmpd	%fcc0, %f8, %f14
	.word	0xa3a0188c	! t0_kref+0x3ad4:   	fitos	%f12, %f17
	.word	0x8fa01088	! t0_kref+0x3ad8:   	fxtos	%f8, %f7
	sethi	%hi(2f), %o7
	.word	0xe40be32c	! t0_kref+0x3ae0:   	ldub	[%o7 + 0x32c], %l2
	.word	0xa41ca00c	! t0_kref+0x3ae4:   	xor	%l2, 0xc, %l2
	.word	0xe42be32c	! t0_kref+0x3ae8:   	stb	%l2, [%o7 + 0x32c]
	.word	0x81dbe32c	! t0_kref+0x3aec:   	flush	%o7 + 0x32c
	.word	0xa5400000	! t0_kref+0x3af0:   	mov	%y, %l2
	.word	0xc1ee1013	! t0_kref+0x3af4:   	prefetcha	%i0 + %l3, 0
	.word	0x93b48334	! t0_kref+0x3af8:   	bmask	%l2, %l4, %o1
	.word	0xa43dbc1c	! t0_kref+0x3afc:   	xnor	%l6, -0x3e4, %l2
	.word	0x90b54012	! t0_kref+0x3b00:   	orncc	%l5, %l2, %o0
	.word	0xa5a0052f	! t0_kref+0x3b04:   	fsqrts	%f15, %f18
	.word	0x9efd8014	! t0_kref+0x3b08:   	sdivcc	%l6, %l4, %o7
	.word	0x99a308a3	! t0_kref+0x3b0c:   	fsubs	%f12, %f3, %f12
	.word	0x33800008	! t0_kref+0x3b10:   	fbe,a	_kref+0x3b30
	.word	0xa9b40df1	! t0_kref+0x3b14:   	fnands	%f16, %f17, %f20
	.word	0x81b50312	! t0_kref+0x3b18:   	alignaddr	%l4, %l2, %g0
	.word	0xdb200018	! t0_kref+0x3b1c:   	st	%f13, [%g0 + %i0]
	.word	0xa785ba60	! t0_kref+0x3b20:   	wr	%l6, 0xfffffa60, %gsr
	.word	0x922c8016	! t0_kref+0x3b24:   	andn	%l2, %l6, %o1
	.word	0x36480004	! t0_kref+0x3b28:   	bge,a,pt	%icc, _kref+0x3b38
2:	.word	0xe91e2010	! t0_kref+0x3b2c:   	ldd	[%i0 + 0x10], %f20
	.word	0xe8a71018	! t0_kref+0x3b30:   	sta	%l4, [%i4 + %i0]0x80
	.word	0x9da84056	! t0_kref+0x3b34:   	fmovdne	%fcc0, %f22, %f14
	.word	0xd26e7fe0	! t0_kref+0x3b38:   	ldstub	[%i1 - 0x20], %o1
	.word	0xe60e2014	! t0_kref+0x3b3c:   	ldub	[%i0 + 0x14], %l3
	.word	0x3b480004	! t0_kref+0x3b40:   	fble,a,pt	%fcc0, _kref+0x3b50
	.word	0xada01a54	! t0_kref+0x3b44:   	fdtoi	%f20, %f22
	.word	0xe430a020	! t0_kref+0x3b48:   	sth	%l2, [%g2 + 0x20]
	.word	0xa1b540f6	! t0_kref+0x3b4c:   	edge16ln	%l5, %l6, %l0
	.word	0x80dd37b3	! t0_kref+0x3b50:   	smulcc	%l4, -0x84d, %g0
	.word	0x89a1cd24	! t0_kref+0x3b54:   	fsmuld	%f7, %f4, %f4
	.word	0xdaf81018	! t0_kref+0x3b58:   	swapa	[%g0 + %i0]0x80, %o5
	.word	0x81ad0ad0	! t0_kref+0x3b5c:   	fcmped	%fcc0, %f20, %f16
	.word	0x9bb54115	! t0_kref+0x3b60:   	edge32	%l5, %l5, %o5
	sethi	%hi(2f), %o7
	.word	0xe40be37c	! t0_kref+0x3b68:   	ldub	[%o7 + 0x37c], %l2
	.word	0xa41ca00c	! t0_kref+0x3b6c:   	xor	%l2, 0xc, %l2
	.word	0xe42be37c	! t0_kref+0x3b70:   	stb	%l2, [%o7 + 0x37c]
	.word	0x81dbe37c	! t0_kref+0x3b74:   	flush	%o7 + 0x37c
	.word	0x80fca522	! t0_kref+0x3b78:   	sdivcc	%l2, 0x522, %g0
2:	.word	0x9da40848	! t0_kref+0x3b7c:   	faddd	%f16, %f8, %f14
	.word	0x9064e41b	! t0_kref+0x3b80:   	subc	%l3, 0x41b, %o0
	.word	0x89a00535	! t0_kref+0x3b84:   	fsqrts	%f21, %f4
	.word	0x8ba00525	! t0_kref+0x3b88:   	fsqrts	%f5, %f5
	.word	0xde4e001a	! t0_kref+0x3b8c:   	ldsb	[%i0 + %i2], %o7
	.word	0xc398a040	! t0_kref+0x3b90:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0x81aacaae	! t0_kref+0x3b94:   	fcmpes	%fcc0, %f11, %f14
	.word	0x32480004	! t0_kref+0x3b98:   	bne,a,pt	%icc, _kref+0x3ba8
	.word	0xa5a00546	! t0_kref+0x3b9c:   	fsqrtd	%f6, %f18
	.word	0xc0563fe6	! t0_kref+0x3ba0:   	ldsh	[%i0 - 0x1a], %g0
	.word	0xa614c012	! t0_kref+0x3ba4:   	or	%l3, %l2, %l3
	.word	0xf3ee501a	! t0_kref+0x3ba8:   	prefetcha	%i1 + %i2, 25
	.word	0x8d84e589	! t0_kref+0x3bac:   	wr	%l3, 0x589, %fprs
	.word	0x8fb30da9	! t0_kref+0x3bb0:   	fxors	%f12, %f9, %f7
	.word	0xdaff1019	! t0_kref+0x3bb4:   	swapa	[%i4 + %i1]0x80, %o5
	.word	0x81ab8ac4	! t0_kref+0x3bb8:   	fcmped	%fcc0, %f14, %f4
	.word	0x9e9cc013	! t0_kref+0x3bbc:   	xorcc	%l3, %l3, %o7
	.word	0x9aaca7a3	! t0_kref+0x3bc0:   	andncc	%l2, 0x7a3, %o5
	.word	0xd3062004	! t0_kref+0x3bc4:   	ld	[%i0 + 4], %f9
	.word	0xa4e4c014	! t0_kref+0x3bc8:   	subccc	%l3, %l4, %l2
	.word	0x89a18d32	! t0_kref+0x3bcc:   	fsmuld	%f6, %f18, %f4
	.word	0xea08a002	! t0_kref+0x3bd0:   	ldub	[%g2 + 2], %l5
	.word	0xe8ce1000	! t0_kref+0x3bd4:   	ldsba	[%i0]0x80, %l4
	.word	0xe6300019	! t0_kref+0x3bd8:   	sth	%l3, [%g0 + %i1]
	.word	0xe656401b	! t0_kref+0x3bdc:   	ldsh	[%i1 + %i3], %l3
	.word	0xae9d31fc	! t0_kref+0x3be0:   	xorcc	%l4, -0xe04, %l7
	.word	0x8ba0052d	! t0_kref+0x3be4:   	fsqrts	%f13, %f5
	.word	0xab2d4016	! t0_kref+0x3be8:   	sll	%l5, %l6, %l5
	.word	0xadb50112	! t0_kref+0x3bec:   	edge32	%l4, %l2, %l6
	.word	0x86102008	! t0_kref+0x3bf0:   	mov	0x8, %g3
	.word	0x86a0e001	! t0_kref+0x3bf4:   	subcc	%g3, 1, %g3
	.word	0x22800009	! t0_kref+0x3bf8:   	be,a	_kref+0x3c1c
	.word	0xa65c8016	! t0_kref+0x3bfc:   	smul	%l2, %l6, %l3
	.word	0xac2cbab3	! t0_kref+0x3c00:   	andn	%l2, -0x54d, %l6
	.word	0x29480007	! t0_kref+0x3c04:   	fbl,a,pt	%fcc0, _kref+0x3c20
	.word	0xda40a030	! t0_kref+0x3c08:   	ldsw	[%g2 + 0x30], %o5
	.word	0xa3a018d4	! t0_kref+0x3c0c:   	fdtos	%f20, %f17
	.word	0xe620a030	! t0_kref+0x3c10:   	st	%l3, [%g2 + 0x30]
	.word	0xa9b10510	! t0_kref+0x3c14:   	fcmpgt16	%f4, %f16, %l4
	.word	0xd410a010	! t0_kref+0x3c18:   	lduh	[%g2 + 0x10], %o2
	.word	0x89a0190a	! t0_kref+0x3c1c:   	fitod	%f10, %f4
	.word	0x993da00c	! t0_kref+0x3c20:   	sra	%l6, 0xc, %o4
	.word	0xf3ee101d	! t0_kref+0x3c24:   	prefetcha	%i0 + %i5, 25
	.word	0xe3b8a080	! t0_kref+0x3c28:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x30480002	! t0_kref+0x3c2c:   	ba,a,pt	%icc, _kref+0x3c34
	.word	0x99150014	! t0_kref+0x3c30:   	taddcctv	%l4, %l4, %o4
	.word	0x81348016	! t0_kref+0x3c34:   	srl	%l2, %l6, %g0
	.word	0x81b50136	! t0_kref+0x3c38:   	edge32n	%l4, %l6, %g0
	.word	0xe410a018	! t0_kref+0x3c3c:   	lduh	[%g2 + 0x18], %l2
	.word	0xadb38c6e	! t0_kref+0x3c40:   	fnors	%f14, %f14, %f22
	.word	0x8143e040	! t0_kref+0x3c44:   	membar	0x40
	.word	0x9db2ccb5	! t0_kref+0x3c48:   	fandnot2s	%f11, %f21, %f14
	.word	0x8da408ca	! t0_kref+0x3c4c:   	fsubd	%f16, %f10, %f6
	.word	0x85a00150	! t0_kref+0x3c50:   	fabsd	%f16, %f2
	.word	0xe6280018	! t0_kref+0x3c54:   	stb	%l3, [%g0 + %i0]
	.word	0x95a409c8	! t0_kref+0x3c58:   	fdivd	%f16, %f8, %f10
	.word	0xe82e601c	! t0_kref+0x3c5c:   	stb	%l4, [%i1 + 0x1c]
	.word	0xada01931	! t0_kref+0x3c60:   	fstod	%f17, %f22
	.word	0x3d800003	! t0_kref+0x3c64:   	fbule,a	_kref+0x3c70
	.word	0x953d8013	! t0_kref+0x3c68:   	sra	%l6, %l3, %o2
	.word	0x95b18967	! t0_kref+0x3c6c:   	fpmerge	%f6, %f7, %f10
	.word	0xd256c018	! t0_kref+0x3c70:   	ldsh	[%i3 + %i0], %o1
	.word	0x93400000	! t0_kref+0x3c74:   	mov	%y, %o1
	.word	0x81854000	! t0_kref+0x3c78:   	wr	%l5, %g0, %y
	.word	0x9ead6f7b	! t0_kref+0x3c7c:   	andncc	%l5, 0xf7b, %o7
	.word	0xa7850012	! t0_kref+0x3c80:   	wr	%l4, %l2, %gsr
	.word	0xe5180019	! t0_kref+0x3c84:   	ldd	[%g0 + %i1], %f18
	.word	0xac2d6234	! t0_kref+0x3c88:   	andn	%l5, 0x234, %l6
	.word	0x3e480008	! t0_kref+0x3c8c:   	bvc,a,pt	%icc, _kref+0x3cac
	.word	0x96c52583	! t0_kref+0x3c90:   	addccc	%l4, 0x583, %o3
	.word	0x8143c000	! t0_kref+0x3c94:   	stbar
	.word	0xec28a000	! t0_kref+0x3c98:   	stb	%l6, [%g2]
	.word	0xa5a0052b	! t0_kref+0x3c9c:   	fsqrts	%f11, %f18
	.word	0xa0adaad0	! t0_kref+0x3ca0:   	andncc	%l6, 0xad0, %l0
	.word	0x29480004	! t0_kref+0x3ca4:   	fbl,a,pt	%fcc0, _kref+0x3cb4
	.word	0x9eac8014	! t0_kref+0x3ca8:   	andncc	%l2, %l4, %o7
	.word	0xd2d01018	! t0_kref+0x3cac:   	ldsha	[%g0 + %i0]0x80, %o1
	.word	0x2f480002	! t0_kref+0x3cb0:   	fbu,a,pt	%fcc0, _kref+0x3cb8
	.word	0xa9a00525	! t0_kref+0x3cb4:   	fsqrts	%f5, %f20
	sethi	%hi(1f), %o7
	jmpl	%o7+%lo(1f), %g1
	.empty
	.word	0xc0080019	! t0_kref+0x3cc0:   	ldub	[%g0 + %i1], %g0
	.word	0xc768a0c2	! t0_kref+0x3cc4:   	prefetch	%g2 + 0xc2, 3
	.word	0xe11e6018	! t0_kref+0x3cc8:   	ldd	[%i1 + 0x18], %f16
	.word	0x81b10582	! t0_kref+0x3ccc:   	fcmpgt32	%f4, %f2, %g0
1:	.word	0x35480003	! t0_kref+0x3cd0:   	fbue,a,pt	%fcc0, _kref+0x3cdc
	.word	0xac2526f7	! t0_kref+0x3cd4:   	sub	%l4, 0x6f7, %l6
	.word	0xa1b500d4	! t0_kref+0x3cd8:   	edge16l	%l4, %l4, %l0
	.word	0x81ab8ac8	! t0_kref+0x3cdc:   	fcmped	%fcc0, %f14, %f8
	.word	0x95b48a50	! t0_kref+0x3ce0:   	fpadd32	%f18, %f16, %f10
	.word	0xffee501c	! t0_kref+0x3ce4:   	prefetcha	%i1 + %i4, 31
	.word	0xa0258012	! t0_kref+0x3ce8:   	sub	%l6, %l2, %l0
	.word	0x8da01933	! t0_kref+0x3cec:   	fstod	%f19, %f6
	.word	0x81aa8a27	! t0_kref+0x3cf0:   	fcmps	%fcc0, %f10, %f7
	call	SYM(t0_subr2)
	.word	0xe4262018	! t0_kref+0x3cf8:   	st	%l2, [%i0 + 0x18]
	.word	0xa32ca002	! t0_kref+0x3cfc:   	sll	%l2, 0x2, %l1
	.word	0xa9b54172	! t0_kref+0x3d00:   	edge32ln	%l5, %l2, %l4
	.word	0xa28d0015	! t0_kref+0x3d04:   	andcc	%l4, %l5, %l1
	.word	0x905cc012	! t0_kref+0x3d08:   	smul	%l3, %l2, %o0
	.word	0xed26201c	! t0_kref+0x3d0c:   	st	%f22, [%i0 + 0x1c]
	.word	0x9ead687b	! t0_kref+0x3d10:   	andncc	%l5, 0x87b, %o7
	.word	0x8125b595	! t0_kref+0x3d14:   	mulscc	%l6, -0xa6b, %g0
	.word	0x91a00556	! t0_kref+0x3d18:   	fsqrtd	%f22, %f8
	.word	0xe620a008	! t0_kref+0x3d1c:   	st	%l3, [%g2 + 8]
	.word	0xc398a080	! t0_kref+0x3d20:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0xee16001b	! t0_kref+0x3d24:   	lduh	[%i0 + %i3], %l7
	.word	0xa5a00552	! t0_kref+0x3d28:   	fsqrtd	%f18, %f18
	.word	0xc9ee5012	! t0_kref+0x3d2c:   	prefetcha	%i1 + %l2, 4
	.word	0x86102002	! t0_kref+0x3d30:   	mov	0x2, %g3
	.word	0x86a0e001	! t0_kref+0x3d34:   	subcc	%g3, 1, %g3
	.word	0x22800019	! t0_kref+0x3d38:   	be,a	_kref+0x3d9c
	.word	0xed68a04a	! t0_kref+0x3d3c:   	prefetch	%g2 + 0x4a, 22
	.word	0xa054c015	! t0_kref+0x3d40:   	umul	%l3, %l5, %l0
	.word	0xec28a003	! t0_kref+0x3d44:   	stb	%l6, [%g2 + 3]
	.word	0xd9be5854	! t0_kref+0x3d48:   	stda	%f12, [%i1 + %l4]0xc2
	.word	0x20480003	! t0_kref+0x3d4c:   	bn,a,pt	%icc, _kref+0x3d58
	.word	0x81db0005	! t0_kref+0x3d50:   	flush	%o4 + %g5
	.word	0xa5b00c00	! t0_kref+0x3d54:   	fzero	%f18
	.word	0xa6a53c3a	! t0_kref+0x3d58:   	subcc	%l4, -0x3c6, %l3
	.word	0x9db407d4	! t0_kref+0x3d5c:   	pdist	%f16, %f20, %f14
	.word	0x9da00544	! t0_kref+0x3d60:   	fsqrtd	%f4, %f14
	.word	0xd7062014	! t0_kref+0x3d64:   	ld	[%i0 + 0x14], %f11
	.word	0x81de62c6	! t0_kref+0x3d68:   	flush	%i1 + 0x2c6
	.word	0x81ac0acc	! t0_kref+0x3d6c:   	fcmped	%fcc0, %f16, %f12
	.word	0xa5b28e42	! t0_kref+0x3d70:   	fxnor	%f10, %f2, %f18
	.word	0xe46e4000	! t0_kref+0x3d74:   	ldstub	[%i1], %l2
	.word	0xe5263fe8	! t0_kref+0x3d78:   	st	%f18, [%i0 - 0x18]
	.word	0xee56c018	! t0_kref+0x3d7c:   	ldsh	[%i3 + %i0], %l7
	.word	0xa1a00052	! t0_kref+0x3d80:   	fmovd	%f18, %f16
	.word	0x9db28e12	! t0_kref+0x3d84:   	fand	%f10, %f18, %f14
	.word	0x99a0192f	! t0_kref+0x3d88:   	fstod	%f15, %f12
	.word	0xf007bfe0	! t0_kref+0x3d8c:   	ld	[%fp - 0x20], %i0
	.word	0x8db18970	! t0_kref+0x3d90:   	fpmerge	%f6, %f16, %f6
	.word	0x99a00548	! t0_kref+0x3d94:   	fsqrtd	%f8, %f12
	.word	0x8db14670	! t0_kref+0x3d98:   	fmul8x16au	%f5, %f16, %f6
	.word	0x153ef442	! t0_kref+0x3d9c:   	sethi	%hi(0xfbd10800), %o2
	.word	0x8143e040	! t0_kref+0x3da0:   	membar	0x40
	.word	0xe6a01018	! t0_kref+0x3da4:   	sta	%l3, [%g0 + %i0]0x80
	.word	0xadb2050e	! t0_kref+0x3da8:   	fcmpgt16	%f8, %f14, %l6
	.word	0xa434c013	! t0_kref+0x3dac:   	orn	%l3, %l3, %l2
	.word	0x27480005	! t0_kref+0x3db0:   	fbul,a,pt	%fcc0, _kref+0x3dc4
	.word	0xa1a000b3	! t0_kref+0x3db4:   	fnegs	%f19, %f16
	.word	0xe06e7fe3	! t0_kref+0x3db8:   	ldstub	[%i1 - 0x1d], %l0
	.word	0xd240a000	! t0_kref+0x3dbc:   	ldsw	[%g2], %o1
	.word	0x95a0054e	! t0_kref+0x3dc0:   	fsqrtd	%f14, %f10
	.word	0xc398a040	! t0_kref+0x3dc4:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0x9a254013	! t0_kref+0x3dc8:   	sub	%l5, %l3, %o5
	.word	0xe0162018	! t0_kref+0x3dcc:   	lduh	[%i0 + 0x18], %l0
	.word	0xd450a002	! t0_kref+0x3dd0:   	ldsh	[%g2 + 2], %o2
	.word	0x9f1570bf	! t0_kref+0x3dd4:   	taddcctv	%l5, -0xf41, %o7
	.word	0x8db506ec	! t0_kref+0x3dd8:   	fmul8ulx16	%f20, %f12, %f6
	.word	0xe7064000	! t0_kref+0x3ddc:   	ld	[%i1], %f19
	.word	0xa8d4ade0	! t0_kref+0x3de0:   	umulcc	%l2, 0xde0, %l4
	.word	0x9bb500f4	! t0_kref+0x3de4:   	edge16ln	%l4, %l4, %o5
	.word	0xc040a020	! t0_kref+0x3de8:   	ldsw	[%g2 + 0x20], %g0
	.word	0xeb68a0cd	! t0_kref+0x3dec:   	prefetch	%g2 + 0xcd, 21
	.word	0xdf06200c	! t0_kref+0x3df0:   	ld	[%i0 + 0xc], %f15
	.word	0xd0566006	! t0_kref+0x3df4:   	ldsh	[%i1 + 6], %o0
	.word	0x81854000	! t0_kref+0x3df8:   	wr	%l5, %g0, %y
	.word	0x81854000	! t0_kref+0x3dfc:   	wr	%l5, %g0, %y
	.word	0xa1b18e80	! t0_kref+0x3e00:   	fsrc1	%f6, %f16
	.word	0xe42e2010	! t0_kref+0x3e04:   	stb	%l2, [%i0 + 0x10]
	.word	0xa2050013	! t0_kref+0x3e08:   	add	%l4, %l3, %l1
	.word	0xe1e61014	! t0_kref+0x3e0c:   	casa	[%i0]0x80, %l4, %l0
	.word	0x813d4012	! t0_kref+0x3e10:   	sra	%l5, %l2, %g0
	.word	0x2d0e9da5	! t0_kref+0x3e14:   	sethi	%hi(0x3a769400), %l6
	.word	0xa9b48d40	! t0_kref+0x3e18:   	fnot1	%f18, %f20
	.word	0x81858000	! t0_kref+0x3e1c:   	wr	%l6, %g0, %y
	.word	0x812d0016	! t0_kref+0x3e20:   	sll	%l4, %l6, %g0
	.word	0xda6e201c	! t0_kref+0x3e24:   	ldstub	[%i0 + 0x1c], %o5
	.word	0xda00a020	! t0_kref+0x3e28:   	ld	[%g2 + 0x20], %o5
	.word	0x85850015	! t0_kref+0x3e2c:   	wr	%l4, %l5, %ccr
	.word	0xea56c019	! t0_kref+0x3e30:   	ldsh	[%i3 + %i1], %l5
	.word	0xec566018	! t0_kref+0x3e34:   	ldsh	[%i1 + 0x18], %l6
	.word	0xe42e3ff0	! t0_kref+0x3e38:   	stb	%l2, [%i0 - 0x10]
	.word	0xe42e3fe5	! t0_kref+0x3e3c:   	stb	%l2, [%i0 - 0x1b]
	.word	0xada00533	! t0_kref+0x3e40:   	fsqrts	%f19, %f22
	.word	0x87a000b0	! t0_kref+0x3e44:   	fnegs	%f16, %f3
	.word	0xab2d0012	! t0_kref+0x3e48:   	sll	%l4, %l2, %l5
	.word	0xda6e3ff7	! t0_kref+0x3e4c:   	ldstub	[%i0 - 9], %o5
	.word	0x89b009ab	! t0_kref+0x3e50:   	fexpand	%f11, %f4
	.word	0xa1b107cc	! t0_kref+0x3e54:   	pdist	%f4, %f12, %f16
	.word	0xa5a18850	! t0_kref+0x3e58:   	faddd	%f6, %f16, %f18
	.word	0xd5263ff4	! t0_kref+0x3e5c:   	st	%f10, [%i0 - 0xc]
	.word	0x91a0104a	! t0_kref+0x3e60:   	fdtox	%f10, %f8
	.word	0xa9b486ee	! t0_kref+0x3e64:   	fmul8ulx16	%f18, %f14, %f20
	.word	0xd1865000	! t0_kref+0x3e68:   	lda	[%i1]0x80, %f8
	call	SYM(t0_subr3)
	.word	0x9fa00026	! t0_kref+0x3e70:   	fmovs	%f6, %f15
	.word	0xadb48f64	! t0_kref+0x3e74:   	fornot1s	%f18, %f4, %f22
	.word	0xe88e9018	! t0_kref+0x3e78:   	lduba	[%i2 + %i0]0x80, %l4
	.word	0xaa1cc012	! t0_kref+0x3e7c:   	xor	%l3, %l2, %l5
	call	SYM(t0_subr3)
	.word	0xa65cafbf	! t0_kref+0x3e84:   	smul	%l2, 0xfbf, %l3
	.word	0xa61d8014	! t0_kref+0x3e88:   	xor	%l6, %l4, %l3
	.word	0x20480001	! t0_kref+0x3e8c:   	bn,a,pt	%icc, _kref+0x3e90
	.word	0x8143c000	! t0_kref+0x3e90:   	stbar
	.word	0xa275b07d	! t0_kref+0x3e94:   	udiv	%l6, -0xf83, %l1
	.word	0xda56201e	! t0_kref+0x3e98:   	ldsh	[%i0 + 0x1e], %o5
	.word	0xe630a012	! t0_kref+0x3e9c:   	sth	%l3, [%g2 + 0x12]
	.word	0x99400000	! t0_kref+0x3ea0:   	mov	%y, %o4
	.word	0xda4e8018	! t0_kref+0x3ea4:   	ldsb	[%i2 + %i0], %o5
	.word	0x9fc00004	! t0_kref+0x3ea8:   	call	%g0 + %g4
	.word	0xa6953076	! t0_kref+0x3eac:   	orcc	%l4, -0xf8a, %l3
	.word	0x99b00cc4	! t0_kref+0x3eb0:   	fnot2	%f4, %f12
	.word	0xa275a75f	! t0_kref+0x3eb4:   	udiv	%l6, 0x75f, %l1
	.word	0xa1a01914	! t0_kref+0x3eb8:   	fitod	%f20, %f16
	.word	0xdd380019	! t0_kref+0x3ebc:   	std	%f14, [%g0 + %i1]
	.word	0xada308c8	! t0_kref+0x3ec0:   	fsubd	%f12, %f8, %f22
	.word	0x85b18d88	! t0_kref+0x3ec4:   	fxor	%f6, %f8, %f2
	.word	0x81858000	! t0_kref+0x3ec8:   	wr	%l6, %g0, %y
	.word	0x92bd0014	! t0_kref+0x3ecc:   	xnorcc	%l4, %l4, %o1
	.word	0xafb480b4	! t0_kref+0x3ed0:   	edge16n	%l2, %l4, %l7
	.word	0x96b50012	! t0_kref+0x3ed4:   	orncc	%l4, %l2, %o3
	.word	0xa9a00534	! t0_kref+0x3ed8:   	fsqrts	%f20, %f20
	.word	0x95b00f2b	! t0_kref+0x3edc:   	fsrc2s	%f11, %f10
	.word	0x91a00528	! t0_kref+0x3ee0:   	fsqrts	%f8, %f8
	.word	0xa3a149a7	! t0_kref+0x3ee4:   	fdivs	%f5, %f7, %f17
	.word	0x85a00552	! t0_kref+0x3ee8:   	fsqrtd	%f18, %f2
	.word	0xada01a54	! t0_kref+0x3eec:   	fdtoi	%f20, %f22
	.word	0x923d4013	! t0_kref+0x3ef0:   	xnor	%l5, %l3, %o1
	.word	0xdf06401c	! t0_kref+0x3ef4:   	ld	[%i1 + %i4], %f15
	.word	0xe49f5019	! t0_kref+0x3ef8:   	ldda	[%i5 + %i1]0x80, %l2
	.word	0x90bd0013	! t0_kref+0x3efc:   	xnorcc	%l4, %l3, %o0
	.word	0x9db346ae	! t0_kref+0x3f00:   	fmul8x16al	%f13, %f14, %f14
	.word	0xaba00531	! t0_kref+0x3f04:   	fsqrts	%f17, %f21
	.word	0x81ddb42f	! t0_kref+0x3f08:   	flush	%l6 - 0xbd1
	.word	0xa664a209	! t0_kref+0x3f0c:   	subc	%l2, 0x209, %l3
	.word	0xa1a508d0	! t0_kref+0x3f10:   	fsubd	%f20, %f16, %f16
	.word	0x81db664a	! t0_kref+0x3f14:   	flush	%o5 + 0x64a
	call	SYM(t0_subr2)
	.word	0xc398a040	! t0_kref+0x3f1c:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0x37480001	! t0_kref+0x3f20:   	fbge,a,pt	%fcc0, _kref+0x3f24
	.word	0xaee48014	! t0_kref+0x3f24:   	subccc	%l2, %l4, %l7
	.word	0xe5e65015	! t0_kref+0x3f28:   	casa	[%i1]0x80, %l5, %l2
	.word	0xa7ab4036	! t0_kref+0x3f2c:   	fmovsle	%fcc0, %f22, %f19
	.word	0x95b50116	! t0_kref+0x3f30:   	edge32	%l4, %l6, %o2
	.word	0xa61d0012	! t0_kref+0x3f34:   	xor	%l4, %l2, %l3
	.word	0xa7a00525	! t0_kref+0x3f38:   	fsqrts	%f5, %f19
	.word	0xa6fda767	! t0_kref+0x3f3c:   	sdivcc	%l6, 0x767, %l3
	.word	0xde4e600a	! t0_kref+0x3f40:   	ldsb	[%i1 + 0xa], %o7
	.word	0x98e48014	! t0_kref+0x3f44:   	subccc	%l2, %l4, %o4
	.word	0xadb1cd33	! t0_kref+0x3f48:   	fandnot1s	%f7, %f19, %f22
	.word	0xe9871019	! t0_kref+0x3f4c:   	lda	[%i4 + %i1]0x80, %f20
	.word	0x95a00552	! t0_kref+0x3f50:   	fsqrtd	%f18, %f10
	.word	0x96b4a7cb	! t0_kref+0x3f54:   	orncc	%l2, 0x7cb, %o3
	.word	0xd2865000	! t0_kref+0x3f58:   	lda	[%i1]0x80, %o1
	.word	0x8143c000	! t0_kref+0x3f5c:   	stbar
	.word	0xada0052e	! t0_kref+0x3f60:   	fsqrts	%f14, %f22
	.word	0x85854013	! t0_kref+0x3f64:   	wr	%l5, %l3, %ccr
	.word	0x81de7f52	! t0_kref+0x3f68:   	flush	%i1 - 0xae
	.word	0xc9180019	! t0_kref+0x3f6c:   	ldd	[%g0 + %i1], %f4
	.word	0x9bb50354	! t0_kref+0x3f70:   	alignaddrl	%l4, %l4, %o5
	.word	0xd900a028	! t0_kref+0x3f74:   	ld	[%g2 + 0x28], %f12
	.word	0xc04e2013	! t0_kref+0x3f78:   	ldsb	[%i0 + 0x13], %g0
	.word	0x86102004	! t0_kref+0x3f7c:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x3f80:   	bne,a	_kref+0x3f80
	.word	0x86a0e001	! t0_kref+0x3f84:   	subcc	%g3, 1, %g3
	.word	0x8da20954	! t0_kref+0x3f88:   	fmuld	%f8, %f20, %f6
	.word	0xd0ee5000	! t0_kref+0x3f8c:   	ldstuba	[%i1]0x80, %o0
	.word	0x93b5054c	! t0_kref+0x3f90:   	fcmpeq16	%f20, %f12, %o1
	.word	0xc700a038	! t0_kref+0x3f94:   	ld	[%g2 + 0x38], %f3
	.word	0x39480006	! t0_kref+0x3f98:   	fbuge,a,pt	%fcc0, _kref+0x3fb0
	.word	0xea2e8019	! t0_kref+0x3f9c:   	stb	%l5, [%i2 + %i1]
	.word	0xea30a030	! t0_kref+0x3fa0:   	sth	%l5, [%g2 + 0x30]
	.word	0xa814efc4	! t0_kref+0x3fa4:   	or	%l3, 0xfc4, %l4
	.word	0xa874f0e5	! t0_kref+0x3fa8:   	udiv	%l3, -0xf1b, %l4
	.word	0xd848a03a	! t0_kref+0x3fac:   	ldsb	[%g2 + 0x3a], %o4
	.word	0xa6adb324	! t0_kref+0x3fb0:   	andncc	%l6, -0xcdc, %l3
	.word	0xa3a00532	! t0_kref+0x3fb4:   	fsqrts	%f18, %f17
	.word	0x8da01a52	! t0_kref+0x3fb8:   	fdtoi	%f18, %f6
	.word	0xa5b580f6	! t0_kref+0x3fbc:   	edge16ln	%l6, %l6, %l2
	.word	0xe4086350	! t0_kref+0x3fc0:   	ldub	[%g1 + 0x350], %l2
	.word	0xa41ca00c	! t0_kref+0x3fc4:   	xor	%l2, 0xc, %l2
	.word	0xe4286350	! t0_kref+0x3fc8:   	stb	%l2, [%g1 + 0x350]
	.word	0x81d86350	! t0_kref+0x3fcc:   	flush	%g1 + 0x350
	.word	0x8da00548	! t0_kref+0x3fd0:   	fsqrtd	%f8, %f6
	.word	0x95a30852	! t0_kref+0x3fd4:   	faddd	%f12, %f18, %f10
	.word	0xe59e1000	! t0_kref+0x3fd8:   	ldda	[%i0]0x80, %f18
	.word	0xd9262008	! t0_kref+0x3fdc:   	st	%f12, [%i0 + 8]
	.word	0xe426401c	! t0_kref+0x3fe0:   	st	%l2, [%i1 + %i4]
	.word	0x99a0054e	! t0_kref+0x3fe4:   	fsqrtd	%f14, %f12
	.word	0xef68a0c7	! t0_kref+0x3fe8:   	prefetch	%g2 + 0xc7, 23
	.word	0x2d480004	! t0_kref+0x3fec:   	fbg,a,pt	%fcc0, _kref+0x3ffc
	.word	0x91a00148	! t0_kref+0x3ff0:   	fabsd	%f8, %f8
	.word	0x9da0054e	! t0_kref+0x3ff4:   	fsqrtd	%f14, %f14
	.word	0x81b54135	! t0_kref+0x3ff8:   	edge32n	%l5, %l5, %g0
	.word	0x8143c000	! t0_kref+0x3ffc:   	stbar
	.word	0x80448013	! t0_kref+0x4000:   	addc	%l2, %l3, %g0
	.word	0x8fa00129	! t0_kref+0x4004:   	fabss	%f9, %f7
	.word	0x8143c000	! t0_kref+0x4008:   	stbar
2:	.word	0xe6566006	! t0_kref+0x400c:   	ldsh	[%i1 + 6], %l3
	.word	0xe4086368	! t0_kref+0x4010:   	ldub	[%g1 + 0x368], %l2
	.word	0xa41ca00c	! t0_kref+0x4014:   	xor	%l2, 0xc, %l2
	.word	0xe4286368	! t0_kref+0x4018:   	stb	%l2, [%g1 + 0x368]
	.word	0x81d86368	! t0_kref+0x401c:   	flush	%g1 + 0x368
	.word	0x9835aba2	! t0_kref+0x4020:   	orn	%l6, 0xba2, %o4
2:	.word	0x97250013	! t0_kref+0x4024:   	mulscc	%l4, %l3, %o3
	.word	0x99a0192b	! t0_kref+0x4028:   	fstod	%f11, %f12
	.word	0x9da00127	! t0_kref+0x402c:   	fabss	%f7, %f14
	.word	0x35480004	! t0_kref+0x4030:   	fbue,a,pt	%fcc0, _kref+0x4040
	.word	0xa5b48155	! t0_kref+0x4034:   	edge32l	%l2, %l5, %l2
	.word	0xea30a00a	! t0_kref+0x4038:   	sth	%l5, [%g2 + 0xa]
	.word	0x8da20952	! t0_kref+0x403c:   	fmuld	%f8, %f18, %f6
	.word	0xc398a040	! t0_kref+0x4040:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0xd91f4019	! t0_kref+0x4044:   	ldd	[%i5 + %i1], %f12
	.word	0xc016c018	! t0_kref+0x4048:   	lduh	[%i3 + %i0], %g0
	.word	0x81dfb5ce	! t0_kref+0x404c:   	flush	%fp - 0xa32
	.word	0xaf408000	! t0_kref+0x4050:   	mov	%ccr, %l7
	.word	0x29480001	! t0_kref+0x4054:   	fbl,a,pt	%fcc0, _kref+0x4058
	.word	0xe3e61016	! t0_kref+0x4058:   	casa	[%i0]0x80, %l6, %l1
	.word	0x81b10590	! t0_kref+0x405c:   	fcmpgt32	%f4, %f16, %g0
	.word	0xe3871018	! t0_kref+0x4060:   	lda	[%i4 + %i0]0x80, %f17
	call	SYM(t0_subr0)
	.word	0x8da01a29	! t0_kref+0x4068:   	fstoi	%f9, %f6
	.word	0x99a488ce	! t0_kref+0x406c:   	fsubd	%f18, %f14, %f12
	.word	0x8143e040	! t0_kref+0x4070:   	membar	0x40
	.word	0xea36c019	! t0_kref+0x4074:   	sth	%l5, [%i3 + %i1]
	.word	0x81ac8a24	! t0_kref+0x4078:   	fcmps	%fcc0, %f18, %f4
	.word	0x95400000	! t0_kref+0x407c:   	mov	%y, %o2
	.word	0xcf270019	! t0_kref+0x4080:   	st	%f7, [%i4 + %i1]
	.word	0xae158015	! t0_kref+0x4084:   	or	%l6, %l5, %l7
	.word	0xe62e3ff5	! t0_kref+0x4088:   	stb	%l3, [%i0 - 0xb]
	.word	0xcf267fe4	! t0_kref+0x408c:   	st	%f7, [%i1 - 0x1c]
	.word	0x97b1cef4	! t0_kref+0x4090:   	fornot2s	%f7, %f20, %f11
	.word	0x9b2cc015	! t0_kref+0x4094:   	sll	%l3, %l5, %o5
	.word	0xead65000	! t0_kref+0x4098:   	ldsha	[%i1]0x80, %l5
	.word	0x8db48a73	! t0_kref+0x409c:   	fpadd32s	%f18, %f19, %f6
	.word	0xec48a02b	! t0_kref+0x40a0:   	ldsb	[%g2 + 0x2b], %l6
	.word	0xedee101a	! t0_kref+0x40a4:   	prefetcha	%i0 + %i2, 22
	.word	0xa634f070	! t0_kref+0x40a8:   	orn	%l3, -0xf90, %l3
	.word	0xa484acf8	! t0_kref+0x40ac:   	addcc	%l2, 0xcf8, %l2
	.word	0xa2350015	! t0_kref+0x40b0:   	orn	%l4, %l5, %l1
	.word	0x8da00525	! t0_kref+0x40b4:   	fsqrts	%f5, %f6
	.word	0xe828a02b	! t0_kref+0x40b8:   	stb	%l4, [%g2 + 0x2b]
	.word	0xec20a020	! t0_kref+0x40bc:   	st	%l6, [%g2 + 0x20]
	.word	0xda08a021	! t0_kref+0x40c0:   	ldub	[%g2 + 0x21], %o5
	.word	0xd126601c	! t0_kref+0x40c4:   	st	%f8, [%i1 + 0x1c]
	.word	0xaba01a25	! t0_kref+0x40c8:   	fstoi	%f5, %f21
	.word	0xadb54176	! t0_kref+0x40cc:   	edge32ln	%l5, %l6, %l6
	call	SYM(t0_subr0)
	.word	0x99a588ce	! t0_kref+0x40d4:   	fsubd	%f22, %f14, %f12
	.word	0x9da1c9b5	! t0_kref+0x40d8:   	fdivs	%f7, %f21, %f14
	.word	0x989ca5d2	! t0_kref+0x40dc:   	xorcc	%l2, 0x5d2, %o4
	.word	0x81da3b46	! t0_kref+0x40e0:   	flush	%o0 - 0x4ba
	.word	0xc91fbe78	! t0_kref+0x40e4:   	ldd	[%fp - 0x188], %f4
	.word	0x8da00530	! t0_kref+0x40e8:   	fsqrts	%f16, %f6
	.word	0xa9b10a46	! t0_kref+0x40ec:   	fpadd32	%f4, %f6, %f20
	.word	0xe24e3ff6	! t0_kref+0x40f0:   	ldsb	[%i0 - 0xa], %l1
	.word	0xaa14f51f	! t0_kref+0x40f4:   	or	%l3, -0xae1, %l5
	.word	0x89b38ea0	! t0_kref+0x40f8:   	fsrc1s	%f14, %f4
	sethi	%hi(2f), %o7
	.word	0xe40be12c	! t0_kref+0x4100:   	ldub	[%o7 + 0x12c], %l2
	.word	0xa41ca00c	! t0_kref+0x4104:   	xor	%l2, 0xc, %l2
	.word	0xe42be12c	! t0_kref+0x4108:   	stb	%l2, [%o7 + 0x12c]
	.word	0x81dbe12c	! t0_kref+0x410c:   	flush	%o7 + 0x12c
	.word	0xe03e2000	! t0_kref+0x4110:   	std	%l0, [%i0]
	.word	0x98fcaca1	! t0_kref+0x4114:   	sdivcc	%l2, 0xca1, %o4
	.word	0x2b480007	! t0_kref+0x4118:   	fbug,a,pt	%fcc0, _kref+0x4134
	.word	0x9db387c6	! t0_kref+0x411c:   	pdist	%f14, %f6, %f14
	call	SYM(t0_subr3)
	.word	0x9aadb78a	! t0_kref+0x4124:   	andncc	%l6, -0x876, %o5
	.word	0xc807bff0	! t0_kref+0x4128:   	ld	[%fp - 0x10], %g4
2:	.word	0x9f24e5d4	! t0_kref+0x412c:   	mulscc	%l3, 0x5d4, %o7
	.word	0xd8560000	! t0_kref+0x4130:   	ldsh	[%i0], %o4
	.word	0xd268a029	! t0_kref+0x4134:   	ldstub	[%g2 + 0x29], %o1
	.word	0x81ad0ad4	! t0_kref+0x4138:   	fcmped	%fcc0, %f20, %f20
	.word	0xe3b8a040	! t0_kref+0x413c:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x86102001	! t0_kref+0x4140:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x4144:   	bne,a	_kref+0x4144
	.word	0x86a0e001	! t0_kref+0x4148:   	subcc	%g3, 1, %g3
	.word	0x81ac8ac2	! t0_kref+0x414c:   	fcmped	%fcc0, %f18, %f2
	.word	0x9de3bfa0	! t0_kref+0x4150:   	save	%sp, -0x60, %sp
	.word	0xafee4018	! t0_kref+0x4154:   	restore	%i1, %i0, %l7
	.word	0xd120a008	! t0_kref+0x4158:   	st	%f8, [%g2 + 8]
	.word	0xad3d8014	! t0_kref+0x415c:   	sra	%l6, %l4, %l6
	.word	0x8db507ca	! t0_kref+0x4160:   	pdist	%f20, %f10, %f6
	.word	0xa5a0054e	! t0_kref+0x4164:   	fsqrtd	%f14, %f18
	.word	0x9e650013	! t0_kref+0x4168:   	subc	%l4, %l3, %o7
	.word	0xe03e3fe8	! t0_kref+0x416c:   	std	%l0, [%i0 - 0x18]
	.word	0xe856401b	! t0_kref+0x4170:   	ldsh	[%i1 + %i3], %l4
	.word	0xa6f4ef47	! t0_kref+0x4174:   	udivcc	%l3, 0xf47, %l3
	.word	0xe620a010	! t0_kref+0x4178:   	st	%l3, [%g2 + 0x10]
	.word	0xa254b5eb	! t0_kref+0x417c:   	umul	%l2, -0xa15, %l1
	sethi	%hi(2f), %o7
	.word	0xe40be1d0	! t0_kref+0x4184:   	ldub	[%o7 + 0x1d0], %l2
	.word	0xa41ca00c	! t0_kref+0x4188:   	xor	%l2, 0xc, %l2
	.word	0xe42be1d0	! t0_kref+0x418c:   	stb	%l2, [%o7 + 0x1d0]
	.word	0x81dbe1d0	! t0_kref+0x4190:   	flush	%o7 + 0x1d0
	.word	0xaa15b349	! t0_kref+0x4194:   	or	%l6, -0xcb7, %l5
	.word	0xe3b8a040	! t0_kref+0x4198:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x95a508c2	! t0_kref+0x419c:   	fsubd	%f20, %f2, %f10
	.word	0x95418000	! t0_kref+0x41a0:   	mov	%fprs, %o2
	.word	0xaea4abbc	! t0_kref+0x41a4:   	subcc	%l2, 0xbbc, %l7
	.word	0xa5a00124	! t0_kref+0x41a8:   	fabss	%f4, %f18
	.word	0xa9b4874e	! t0_kref+0x41ac:   	fpack32	%f18, %f14, %f20
	.word	0xd4680019	! t0_kref+0x41b0:   	ldstub	[%g0 + %i1], %o2
	.word	0x9e648013	! t0_kref+0x41b4:   	subc	%l2, %l3, %o7
	.word	0xadb284d0	! t0_kref+0x41b8:   	fcmpne32	%f10, %f16, %l6
	.word	0xe0df5019	! t0_kref+0x41bc:   	ldxa	[%i5 + %i1]0x80, %l0
	.word	0x91b480b4	! t0_kref+0x41c0:   	edge16n	%l2, %l4, %o0
	.word	0x91b187d2	! t0_kref+0x41c4:   	pdist	%f6, %f18, %f8
	.word	0xe168a0cb	! t0_kref+0x41c8:   	prefetch	%g2 + 0xcb, 16
	.word	0xcb200019	! t0_kref+0x41cc:   	st	%f5, [%g0 + %i1]
2:	.word	0x99a14835	! t0_kref+0x41d0:   	fadds	%f5, %f21, %f12
	.word	0xc398a080	! t0_kref+0x41d4:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0x809cb4ef	! t0_kref+0x41d8:   	xorcc	%l2, -0xb11, %g0
	.word	0xa1a2c82d	! t0_kref+0x41dc:   	fadds	%f11, %f13, %f16
	.word	0xe1be1815	! t0_kref+0x41e0:   	stda	%f16, [%i0 + %l5]0xc0
	.word	0xa3a1c9b1	! t0_kref+0x41e4:   	fdivs	%f7, %f17, %f17
	.word	0x22480001	! t0_kref+0x41e8:   	be,a,pt	%icc, _kref+0x41ec
	.word	0xea36c019	! t0_kref+0x41ec:   	sth	%l5, [%i3 + %i1]
	.word	0x81580000	! t0_kref+0x41f0:   	flushw
	.word	0xd07f0018	! t0_kref+0x41f4:   	swap	[%i4 + %i0], %o0
	.word	0x940cc012	! t0_kref+0x41f8:   	and	%l3, %l2, %o2
	.word	0xe5200019	! t0_kref+0x41fc:   	st	%f18, [%g0 + %i1]
	.word	0x91a3084a	! t0_kref+0x4200:   	faddd	%f12, %f10, %f8
	.word	0xec20a028	! t0_kref+0x4204:   	st	%l6, [%g2 + 0x28]
	.word	0x98a532cd	! t0_kref+0x4208:   	subcc	%l4, -0xd33, %o4
	.word	0x81ab8ad0	! t0_kref+0x420c:   	fcmped	%fcc0, %f14, %f16
	.word	0xac3565de	! t0_kref+0x4210:   	orn	%l5, 0x5de, %l6
	.word	0xc168a048	! t0_kref+0x4214:   	prefetch	%g2 + 0x48, 0
	.word	0x93a018d0	! t0_kref+0x4218:   	fdtos	%f16, %f9
	.word	0x87a0052d	! t0_kref+0x421c:   	fsqrts	%f13, %f3
	.word	0xadb50586	! t0_kref+0x4220:   	fcmpgt32	%f20, %f6, %l6
	.word	0x9b24baab	! t0_kref+0x4224:   	mulscc	%l2, -0x555, %o5
	.word	0x87a00533	! t0_kref+0x4228:   	fsqrts	%f19, %f3
	.word	0xea28a021	! t0_kref+0x422c:   	stb	%l5, [%g2 + 0x21]
	.word	0x91a8804a	! t0_kref+0x4230:   	fmovdlg	%fcc0, %f10, %f8
	.word	0xeb20a038	! t0_kref+0x4234:   	st	%f21, [%g2 + 0x38]
	.word	0x910cc014	! t0_kref+0x4238:   	tsubcc	%l3, %l4, %o0
	.word	0xa90d0014	! t0_kref+0x423c:   	tsubcc	%l4, %l4, %l4
	.word	0xa8bcb786	! t0_kref+0x4240:   	xnorcc	%l2, -0x87a, %l4
	.word	0xed68a00a	! t0_kref+0x4244:   	prefetch	%g2 + 0xa, 22
	.word	0xd5180019	! t0_kref+0x4248:   	ldd	[%g0 + %i1], %f10
	.word	0x9b25bdbf	! t0_kref+0x424c:   	mulscc	%l6, -0x241, %o5
	.word	0xa3b38eec	! t0_kref+0x4250:   	fornot2s	%f14, %f12, %f17
	.word	0xa8b58015	! t0_kref+0x4254:   	orncc	%l6, %l5, %l4
	.word	0x37800005	! t0_kref+0x4258:   	fbge,a	_kref+0x426c
	.word	0x99a00554	! t0_kref+0x425c:   	fsqrtd	%f20, %f12
	.word	0xa7a248b2	! t0_kref+0x4260:   	fsubs	%f9, %f18, %f19
	.word	0x81d84012	! t0_kref+0x4264:   	flush	%g1 + %l2
	.word	0xe68e9019	! t0_kref+0x4268:   	lduba	[%i2 + %i1]0x80, %l3
	.word	0x9a658014	! t0_kref+0x426c:   	subc	%l6, %l4, %o5
	.word	0xa1408000	! t0_kref+0x4270:   	mov	%ccr, %l0
	.word	0x87a0052b	! t0_kref+0x4274:   	fsqrts	%f11, %f3
	.word	0x27800008	! t0_kref+0x4278:   	fbul,a	_kref+0x4298
	.word	0x99b50176	! t0_kref+0x427c:   	edge32ln	%l4, %l6, %o4
	.word	0x81b3040e	! t0_kref+0x4280:   	fcmple16	%f12, %f14, %g0
	.word	0xd7e61014	! t0_kref+0x4284:   	casa	[%i0]0x80, %l4, %o3
	.word	0x89a01a54	! t0_kref+0x4288:   	fdtoi	%f20, %f4
	.word	0x927d4016	! t0_kref+0x428c:   	sdiv	%l5, %l6, %o1
	.word	0xa015782e	! t0_kref+0x4290:   	or	%l5, -0x7d2, %l0
	.word	0xdd9e5000	! t0_kref+0x4294:   	ldda	[%i1]0x80, %f14
	.word	0x28800007	! t0_kref+0x4298:   	bleu,a	_kref+0x42b4
	.word	0x80258013	! t0_kref+0x429c:   	sub	%l6, %l3, %g0
	.word	0xd3270019	! t0_kref+0x42a0:   	st	%f9, [%i4 + %i1]
	.word	0x8143c000	! t0_kref+0x42a4:   	stbar
	.word	0xea566002	! t0_kref+0x42a8:   	ldsh	[%i1 + 2], %l5
	.word	0x89a508c6	! t0_kref+0x42ac:   	fsubd	%f20, %f6, %f4
	.word	0xabb48e23	! t0_kref+0x42b0:   	fands	%f18, %f3, %f21
	.word	0x89a01056	! t0_kref+0x42b4:   	fdtox	%f22, %f4
	.word	0xba103ff0	! t0_kref+0x42b8:   	mov	0xfffffff0, %i5
	.word	0x8db087ca	! t0_kref+0x42bc:   	pdist	%f2, %f10, %f6
	.word	0x3d800001	! t0_kref+0x42c0:   	fbule,a	_kref+0x42c4
	.word	0xc9266004	! t0_kref+0x42c4:   	st	%f4, [%i1 + 4]
	.word	0xd5871018	! t0_kref+0x42c8:   	lda	[%i4 + %i0]0x80, %f10
	.word	0x24480008	! t0_kref+0x42cc:   	ble,a,pt	%icc, _kref+0x42ec
	.word	0x91a40827	! t0_kref+0x42d0:   	fadds	%f16, %f7, %f8
	.word	0xe820a010	! t0_kref+0x42d4:   	st	%l4, [%g2 + 0x10]
	.word	0x85850015	! t0_kref+0x42d8:   	wr	%l4, %l5, %ccr
	.word	0xaa54be01	! t0_kref+0x42dc:   	umul	%l2, -0x1ff, %l5
	.word	0xd2ff1019	! t0_kref+0x42e0:   	swapa	[%i4 + %i1]0x80, %o1
	.word	0x95248012	! t0_kref+0x42e4:   	mulscc	%l2, %l2, %o2
	.word	0x93400000	! t0_kref+0x42e8:   	mov	%y, %o1
	.word	0x8fa01a2c	! t0_kref+0x42ec:   	fstoi	%f12, %f7
	.word	0x97624014	! t0_kref+0x42f0:   	move	%fcc0, %l4, %o3
	.word	0xa9a4cd28	! t0_kref+0x42f4:   	fsmuld	%f19, %f8, %f20
	.word	0xe6767fe0	! t0_kref+0x42f8:   	stx	%l3, [%i1 - 0x20]
	.word	0x3b480006	! t0_kref+0x42fc:   	fble,a,pt	%fcc0, _kref+0x4314
	.word	0x212bbaad	! t0_kref+0x4300:   	sethi	%hi(0xaeeab400), %l0
	.word	0xd2d6d019	! t0_kref+0x4304:   	ldsha	[%i3 + %i1]0x80, %o1
	.word	0xe6267ff0	! t0_kref+0x4308:   	st	%l3, [%i1 - 0x10]
	.word	0x81ad8ad0	! t0_kref+0x430c:   	fcmped	%fcc0, %f22, %f16
	.word	0xa9a40d2e	! t0_kref+0x4310:   	fsmuld	%f16, %f14, %f20
	.word	0xaf60e215	! t0_kref+0x4314:   	movul	%fcc0, 0x215, %l7
	.word	0xd11e2008	! t0_kref+0x4318:   	ldd	[%i0 + 8], %f8
	.word	0xae658015	! t0_kref+0x431c:   	subc	%l6, %l5, %l7
	.word	0x9f2ce001	! t0_kref+0x4320:   	sll	%l3, 0x1, %o7
	.word	0x948d0014	! t0_kref+0x4324:   	andcc	%l4, %l4, %o2
	.word	0xd100a030	! t0_kref+0x4328:   	ld	[%g2 + 0x30], %f8
	.word	0xd5180018	! t0_kref+0x432c:   	ldd	[%g0 + %i0], %f10
	.word	0x86102016	! t0_kref+0x4330:   	mov	0x16, %g3
	.word	0x86a0e001	! t0_kref+0x4334:   	subcc	%g3, 1, %g3
	.word	0x22800006	! t0_kref+0x4338:   	be,a	_kref+0x4350
	.word	0xaba000a8	! t0_kref+0x433c:   	fnegs	%f8, %f21
	.word	0xa21d4013	! t0_kref+0x4340:   	xor	%l5, %l3, %l1
	.word	0xaef4f9e7	! t0_kref+0x4344:   	udivcc	%l3, -0x619, %l7
	.word	0x81848000	! t0_kref+0x4348:   	wr	%l2, %g0, %y
	.word	0x95a10d35	! t0_kref+0x434c:   	fsmuld	%f4, %f21, %f10
	.word	0x81dfec14	! t0_kref+0x4350:   	flush	%i7 + 0xc14
	.word	0xc7270018	! t0_kref+0x4354:   	st	%f3, [%i4 + %i0]
	.word	0x8143e071	! t0_kref+0x4358:   	membar	0x71
	call	SYM(t0_subr3)
	.word	0xe1267ff0	! t0_kref+0x4360:   	st	%f16, [%i1 - 0x10]
	.word	0xe7e61016	! t0_kref+0x4364:   	casa	[%i0]0x80, %l6, %l3
	.word	0x87b0ca25	! t0_kref+0x4368:   	fpadd16s	%f3, %f5, %f3
	.word	0x9914f35d	! t0_kref+0x436c:   	taddcctv	%l3, -0xca3, %o4
	.word	0xe428a003	! t0_kref+0x4370:   	stb	%l2, [%g2 + 3]
	.word	0xaa3d7fd0	! t0_kref+0x4374:   	xnor	%l5, -0x30, %l5
	.word	0x97a50834	! t0_kref+0x4378:   	fadds	%f20, %f20, %f11
	.word	0x95a289d2	! t0_kref+0x437c:   	fdivd	%f10, %f18, %f10
	.word	0xea200018	! t0_kref+0x4380:   	st	%l5, [%g0 + %i0]
	.word	0xec30a032	! t0_kref+0x4384:   	sth	%l6, [%g2 + 0x32]
	.word	0x85a00550	! t0_kref+0x4388:   	fsqrtd	%f16, %f2
	.word	0xe6a81018	! t0_kref+0x438c:   	stba	%l3, [%g0 + %i0]0x80
	.word	0x9163c012	! t0_kref+0x4390:   	movo	%fcc0, %l2, %o0
	.word	0xd520a030	! t0_kref+0x4394:   	st	%f10, [%g2 + 0x30]
	.word	0xe4270018	! t0_kref+0x4398:   	st	%l2, [%i4 + %i0]
	.word	0x80252bd5	! t0_kref+0x439c:   	sub	%l4, 0xbd5, %g0
	.word	0x81abca29	! t0_kref+0x43a0:   	fcmps	%fcc0, %f15, %f9
	call	SYM(t0_subr0)
	.word	0xe320a020	! t0_kref+0x43a8:   	st	%f17, [%g2 + 0x20]
	.word	0x2c480006	! t0_kref+0x43ac:   	bneg,a,pt	%icc, _kref+0x43c4
	.word	0xe64e2000	! t0_kref+0x43b0:   	ldsb	[%i0], %l3
	.word	0x2a800006	! t0_kref+0x43b4:   	bcs,a	_kref+0x43cc
	.word	0x987cea13	! t0_kref+0x43b8:   	sdiv	%l3, 0xa13, %o4
	.word	0x905cec23	! t0_kref+0x43bc:   	smul	%l3, 0xc23, %o0
	.word	0x29480006	! t0_kref+0x43c0:   	fbl,a,pt	%fcc0, _kref+0x43d8
	.word	0xa235bb14	! t0_kref+0x43c4:   	orn	%l6, -0x4ec, %l1
	.word	0xec08a02a	! t0_kref+0x43c8:   	ldub	[%g2 + 0x2a], %l6
	.word	0xa4ad7044	! t0_kref+0x43cc:   	andncc	%l5, -0xfbc, %l2
	.word	0x91b4cdf3	! t0_kref+0x43d0:   	fnands	%f19, %f19, %f8
	.word	0xb8102004	! t0_kref+0x43d4:   	mov	0x4, %i4
	.word	0x95a0884c	! t0_kref+0x43d8:   	faddd	%f2, %f12, %f10
	.word	0xec20a008	! t0_kref+0x43dc:   	st	%l6, [%g2 + 8]
	.word	0x983d8014	! t0_kref+0x43e0:   	xnor	%l6, %l4, %o4
	.word	0xe8a65000	! t0_kref+0x43e4:   	sta	%l4, [%i1]0x80
	.word	0xa61d8015	! t0_kref+0x43e8:   	xor	%l6, %l5, %l3
	.word	0x983cc014	! t0_kref+0x43ec:   	xnor	%l3, %l4, %o4
	.word	0xd410a030	! t0_kref+0x43f0:   	lduh	[%g2 + 0x30], %o2
	.word	0xe81e2000	! t0_kref+0x43f4:   	ldd	[%i0], %l4
	.word	0xea28a022	! t0_kref+0x43f8:   	stb	%l5, [%g2 + 0x22]
	.word	0xef68a04b	! t0_kref+0x43fc:   	prefetch	%g2 + 0x4b, 23
	.word	0xe830a028	! t0_kref+0x4400:   	sth	%l4, [%g2 + 0x28]
	.word	0x81a90ad4	! t0_kref+0x4404:   	fcmped	%fcc0, %f4, %f20
	.word	0xaba01a52	! t0_kref+0x4408:   	fdtoi	%f18, %f21
	.word	0x9bb54016	! t0_kref+0x440c:   	edge8	%l5, %l6, %o5
	.word	0x9db3074c	! t0_kref+0x4410:   	fpack32	%f12, %f12, %f14
	sethi	%hi(2f), %o7
	.word	0xe40be034	! t0_kref+0x4418:   	ldub	[%o7 + 0x34], %l2
	.word	0xa41ca00c	! t0_kref+0x441c:   	xor	%l2, 0xc, %l2
	.word	0xe42be034	! t0_kref+0x4420:   	stb	%l2, [%o7 + 0x34]
	.word	0x81dbe034	! t0_kref+0x4424:   	flush	%o7 + 0x34
	.word	0x8da54d34	! t0_kref+0x4428:   	fsmuld	%f21, %f20, %f6
	.word	0xa1a308d6	! t0_kref+0x442c:   	fsubd	%f12, %f22, %f16
	.word	0x96acfa88	! t0_kref+0x4430:   	andncc	%l3, -0x578, %o3
2:	.word	0x8db3462a	! t0_kref+0x4434:   	fmul8x16	%f13, %f10, %f6
	.word	0x99b08d40	! t0_kref+0x4438:   	fnot1	%f2, %f12
	.word	0x99b54154	! t0_kref+0x443c:   	edge32l	%l5, %l4, %o4
	.word	0xc7062000	! t0_kref+0x4440:   	ld	[%i0], %f3
	.word	0xa3400000	! t0_kref+0x4444:   	mov	%y, %l1
	.word	0xe8280019	! t0_kref+0x4448:   	stb	%l4, [%g0 + %i1]
	.word	0x9e558016	! t0_kref+0x444c:   	umul	%l6, %l6, %o7
	.word	0xe120a038	! t0_kref+0x4450:   	st	%f16, [%g2 + 0x38]
	.word	0xe628a02b	! t0_kref+0x4454:   	stb	%l3, [%g2 + 0x2b]
	.word	0x8d848013	! t0_kref+0x4458:   	wr	%l2, %l3, %fprs
	.word	0xc398a080	! t0_kref+0x445c:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0x913ca015	! t0_kref+0x4460:   	sra	%l2, 0x15, %o0
	.word	0x81580000	! t0_kref+0x4464:   	flushw
	.word	0xadb18c46	! t0_kref+0x4468:   	fnor	%f6, %f6, %f22
	sethi	%hi(2f), %o7
	.word	0xe40be094	! t0_kref+0x4470:   	ldub	[%o7 + 0x94], %l2
	.word	0xa41ca00c	! t0_kref+0x4474:   	xor	%l2, 0xc, %l2
	.word	0xe42be094	! t0_kref+0x4478:   	stb	%l2, [%o7 + 0x94]
	.word	0x81dbe094	! t0_kref+0x447c:   	flush	%o7 + 0x94
	.word	0xeaf61000	! t0_kref+0x4480:   	stxa	%l5, [%i0]0x80
	.word	0xefe65015	! t0_kref+0x4484:   	casa	[%i1]0x80, %l5, %l7
	.word	0x81a8ca2f	! t0_kref+0x4488:   	fcmps	%fcc0, %f3, %f15
	.word	0x81aa8ad2	! t0_kref+0x448c:   	fcmped	%fcc0, %f10, %f18
	.word	0x8fb4cea0	! t0_kref+0x4490:   	fsrc1s	%f19, %f7
2:	.word	0xa6d58016	! t0_kref+0x4494:   	umulcc	%l6, %l6, %l3
	.word	0x81aa8aa7	! t0_kref+0x4498:   	fcmpes	%fcc0, %f10, %f7
	.word	0xa9a00131	! t0_kref+0x449c:   	fabss	%f17, %f20
	.word	0xc398a080	! t0_kref+0x44a0:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0xee06600c	! t0_kref+0x44a4:   	ld	[%i1 + 0xc], %l7
	.word	0xa5a18844	! t0_kref+0x44a8:   	faddd	%f6, %f4, %f18
	.word	0xa9a01927	! t0_kref+0x44ac:   	fstod	%f7, %f20
	.word	0xe4ce101a	! t0_kref+0x44b0:   	ldsba	[%i0 + %i2]0x80, %l2
	.word	0x98fd6ea1	! t0_kref+0x44b4:   	sdivcc	%l5, 0xea1, %o4
	.word	0x912cc015	! t0_kref+0x44b8:   	sll	%l3, %l5, %o0
	.word	0x25480007	! t0_kref+0x44bc:   	fblg,a,pt	%fcc0, _kref+0x44d8
	.word	0x81b54096	! t0_kref+0x44c0:   	edge16	%l5, %l6, %g0
	.word	0xc700a028	! t0_kref+0x44c4:   	ld	[%g2 + 0x28], %f3
	.word	0x9e44ed59	! t0_kref+0x44c8:   	addc	%l3, 0xd59, %o7
	.word	0x81aa4aae	! t0_kref+0x44cc:   	fcmpes	%fcc0, %f9, %f14
	.word	0x95a18850	! t0_kref+0x44d0:   	faddd	%f6, %f16, %f10
	.word	0xae1cc012	! t0_kref+0x44d4:   	xor	%l3, %l2, %l7
	.word	0x92548013	! t0_kref+0x44d8:   	umul	%l2, %l3, %o1
	.word	0x813d0016	! t0_kref+0x44dc:   	sra	%l4, %l6, %g0
	.word	0x8da01a4e	! t0_kref+0x44e0:   	fdtoi	%f14, %f6
	.word	0xd9be1812	! t0_kref+0x44e4:   	stda	%f12, [%i0 + %l2]0xc0
	.word	0x3b480003	! t0_kref+0x44e8:   	fble,a,pt	%fcc0, _kref+0x44f4
	.word	0xa9a408d2	! t0_kref+0x44ec:   	fsubd	%f16, %f18, %f20
	.word	0xa1a508b0	! t0_kref+0x44f0:   	fsubs	%f20, %f16, %f16
	.word	0x96fce9b6	! t0_kref+0x44f4:   	sdivcc	%l3, 0x9b6, %o3
	.word	0xc368a0c1	! t0_kref+0x44f8:   	prefetch	%g2 + 0xc1, 1
	.word	0x8610200b	! t0_kref+0x44fc:   	mov	0xb, %g3
	.word	0x86a0e001	! t0_kref+0x4500:   	subcc	%g3, 1, %g3
	.word	0x22800012	! t0_kref+0x4504:   	be,a	_kref+0x454c
	.word	0x81b58075	! t0_kref+0x4508:   	edge8ln	%l6, %l5, %g0
	.word	0x81a8ca33	! t0_kref+0x450c:   	fcmps	%fcc0, %f3, %f19
	.word	0x3d4ffffc	! t0_kref+0x4510:   	fbule,a,pt	%fcc0, _kref+0x4500
	.word	0xd6062014	! t0_kref+0x4514:   	ld	[%i0 + 0x14], %o3
	.word	0x813d0015	! t0_kref+0x4518:   	sra	%l4, %l5, %g0
	.word	0xa4048013	! t0_kref+0x451c:   	add	%l2, %l3, %l2
	.word	0xe430a00a	! t0_kref+0x4520:   	sth	%l2, [%g2 + 0xa]
	.word	0xcd1e7fe8	! t0_kref+0x4524:   	ldd	[%i1 - 0x18], %f6
	.word	0xe8167fec	! t0_kref+0x4528:   	lduh	[%i1 - 0x14], %l4
	.word	0x98e4b9b0	! t0_kref+0x452c:   	subccc	%l2, -0x650, %o4
	.word	0xac34c012	! t0_kref+0x4530:   	orn	%l3, %l2, %l6
	.word	0x34480005	! t0_kref+0x4534:   	bg,a,pt	%icc, _kref+0x4548
	.word	0xa93da011	! t0_kref+0x4538:   	sra	%l6, 0x11, %l4
	.word	0xb4103fe6	! t0_kref+0x453c:   	mov	0xffffffe6, %i2
	.word	0x95b009a5	! t0_kref+0x4540:   	fexpand	%f5, %f10
	.word	0xeb063ff0	! t0_kref+0x4544:   	ld	[%i0 - 0x10], %f21
	.word	0xc93e7fe8	! t0_kref+0x4548:   	std	%f4, [%i1 - 0x18]
	.word	0xec2e001a	! t0_kref+0x454c:   	stb	%l6, [%i0 + %i2]
	.word	0xa5ab8032	! t0_kref+0x4550:   	fmovsule	%fcc0, %f18, %f18
	.word	0x9ea4b0d9	! t0_kref+0x4554:   	subcc	%l2, -0xf27, %o7
	.word	0x3b480006	! t0_kref+0x4558:   	fble,a,pt	%fcc0, _kref+0x4570
	.word	0xc168a005	! t0_kref+0x455c:   	prefetch	%g2 + 5, 0
	.word	0x91a18d34	! t0_kref+0x4560:   	fsmuld	%f6, %f20, %f8
	.word	0xe82e4000	! t0_kref+0x4564:   	stb	%l4, [%i1]
	.word	0xacb4e184	! t0_kref+0x4568:   	orncc	%l3, 0x184, %l6
	.word	0x81850000	! t0_kref+0x456c:   	wr	%l4, %g0, %y
	.word	0x8143c000	! t0_kref+0x4570:   	stbar
	.word	0x98dd4014	! t0_kref+0x4574:   	smulcc	%l5, %l4, %o4
	.word	0x95a00554	! t0_kref+0x4578:   	fsqrtd	%f20, %f10
	.word	0x28480006	! t0_kref+0x457c:   	bleu,a,pt	%icc, _kref+0x4594
	.word	0xa8acec8a	! t0_kref+0x4580:   	andncc	%l3, 0xc8a, %l4
	.word	0xa4bd0014	! t0_kref+0x4584:   	xnorcc	%l4, %l4, %l2
	.word	0x29480003	! t0_kref+0x4588:   	fbl,a,pt	%fcc0, _kref+0x4594
	.word	0x980caabc	! t0_kref+0x458c:   	and	%l2, 0xabc, %o4
	.word	0x25480002	! t0_kref+0x4590:   	fblg,a,pt	%fcc0, _kref+0x4598
	.word	0xa1a388d0	! t0_kref+0x4594:   	fsubd	%f14, %f16, %f16
	.word	0xe620a018	! t0_kref+0x4598:   	st	%l3, [%g2 + 0x18]
	.word	0x31480005	! t0_kref+0x459c:   	fba,a,pt	%fcc0, _kref+0x45b0
	.word	0xa8ac8013	! t0_kref+0x45a0:   	andncc	%l2, %l3, %l4
	.word	0x31800002	! t0_kref+0x45a4:   	fba,a	_kref+0x45ac
	.word	0x85a1084a	! t0_kref+0x45a8:   	faddd	%f4, %f10, %f2
	.word	0x1735f271	! t0_kref+0x45ac:   	sethi	%hi(0xd7c9c400), %o3
	.word	0xeaa01019	! t0_kref+0x45b0:   	sta	%l5, [%g0 + %i1]0x80
	.word	0x91408000	! t0_kref+0x45b4:   	mov	%ccr, %o0
	.word	0x91a408b2	! t0_kref+0x45b8:   	fsubs	%f16, %f18, %f8
	.word	0xa1a00546	! t0_kref+0x45bc:   	fsqrtd	%f6, %f16
	.word	0xa2650013	! t0_kref+0x45c0:   	subc	%l4, %l3, %l1
	.word	0xa48cb33c	! t0_kref+0x45c4:   	andcc	%l2, -0xcc4, %l2
	.word	0xe19eda58	! t0_kref+0x45c8:   	ldda	[%i3 + %i0]0xd2, %f16
	.word	0x9a94aa23	! t0_kref+0x45cc:   	orcc	%l2, 0xa23, %o5
	.word	0xe920a028	! t0_kref+0x45d0:   	st	%f20, [%g2 + 0x28]
	.word	0x3c480005	! t0_kref+0x45d4:   	bpos,a,pt	%icc, _kref+0x45e8
	.word	0x81dbacd3	! t0_kref+0x45d8:   	flush	%sp + 0xcd3
	.word	0x8da00156	! t0_kref+0x45dc:   	fabsd	%f22, %f6
	.word	0x973ce002	! t0_kref+0x45e0:   	sra	%l3, 0x2, %o3
	.word	0x92e4c012	! t0_kref+0x45e4:   	subccc	%l3, %l2, %o1
	.word	0x97400000	! t0_kref+0x45e8:   	mov	%y, %o3
	.word	0x90758014	! t0_kref+0x45ec:   	udiv	%l6, %l4, %o0
	.word	0xafb4c076	! t0_kref+0x45f0:   	edge8ln	%l3, %l6, %l7
	.word	0xe4ff1018	! t0_kref+0x45f4:   	swapa	[%i4 + %i0]0x80, %l2
	.word	0x81854000	! t0_kref+0x45f8:   	wr	%l5, %g0, %y
	.word	0xe3b8a040	! t0_kref+0x45fc:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x9de3bfa0	! t0_kref+0x4600:   	save	%sp, -0x60, %sp
	.word	0xb6874018	! t0_kref+0x4604:   	addcc	%i5, %i0, %i3
	.word	0x95e839b3	! t0_kref+0x4608:   	restore	%g0, -0x64d, %o2
	.word	0xe830a032	! t0_kref+0x460c:   	sth	%l4, [%g2 + 0x32]
	.word	0xefee101b	! t0_kref+0x4610:   	prefetcha	%i0 + %i3, 23
	.word	0x9de3bfa0	! t0_kref+0x4614:   	save	%sp, -0x60, %sp
	.word	0x803ef5a3	! t0_kref+0x4618:   	xnor	%i3, -0xa5d, %g0
	.word	0xafef001b	! t0_kref+0x461c:   	restore	%i4, %i3, %l7
	.word	0x81ac4a2a	! t0_kref+0x4620:   	fcmps	%fcc0, %f17, %f10
	.word	0x95a00550	! t0_kref+0x4624:   	fsqrtd	%f16, %f10
	.word	0xaa450015	! t0_kref+0x4628:   	addc	%l4, %l5, %l5
	.word	0xc1be1895	! t0_kref+0x462c:   	stda	%f0, [%i0 + %l5]0xc4
	.word	0xada449b4	! t0_kref+0x4630:   	fdivs	%f17, %f20, %f22
	.word	0xd9be5816	! t0_kref+0x4634:   	stda	%f12, [%i1 + %l6]0xc0
	.word	0xa21d7605	! t0_kref+0x4638:   	xor	%l5, -0x9fb, %l1
	.word	0xc0ce501a	! t0_kref+0x463c:   	ldsba	[%i1 + %i2]0x80, %g0
	.word	0xba102008	! t0_kref+0x4640:   	mov	0x8, %i5
	.word	0x99a00132	! t0_kref+0x4644:   	fabss	%f18, %f12
	.word	0x8143c000	! t0_kref+0x4648:   	stbar
	.word	0xd99e101d	! t0_kref+0x464c:   	ldda	[%i0 + %i5]0x80, %f12
	.word	0xd0100018	! t0_kref+0x4650:   	lduh	[%g0 + %i0], %o0
	.word	0x2f800004	! t0_kref+0x4654:   	fbu,a	_kref+0x4664
	.word	0x9ead0014	! t0_kref+0x4658:   	andncc	%l4, %l4, %o7
	.word	0xd656200c	! t0_kref+0x465c:   	ldsh	[%i0 + 0xc], %o3
	.word	0xc568a0c6	! t0_kref+0x4660:   	prefetch	%g2 + 0xc6, 2
	.word	0xada018cc	! t0_kref+0x4664:   	fdtos	%f12, %f22
	.word	0x95a508c6	! t0_kref+0x4668:   	fsubd	%f20, %f6, %f10
	.word	0xe8ce9018	! t0_kref+0x466c:   	ldsba	[%i2 + %i0]0x80, %l4
	.word	0x85a0192f	! t0_kref+0x4670:   	fstod	%f15, %f2
	.word	0xc1ee5014	! t0_kref+0x4674:   	prefetcha	%i1 + %l4, 0
	.word	0x85a308c8	! t0_kref+0x4678:   	fsubd	%f12, %f8, %f2
	.word	0x2a480007	! t0_kref+0x467c:   	bcs,a,pt	%icc, _kref+0x4698
	.word	0x81400000	! t0_kref+0x4680:   	mov	%y, %g0
	.word	0x36480001	! t0_kref+0x4684:   	bge,a,pt	%icc, _kref+0x4688
	.word	0x89b08c4c	! t0_kref+0x4688:   	fnor	%f2, %f12, %f4
	.word	0x99b28e80	! t0_kref+0x468c:   	fsrc1	%f10, %f12
	.word	0x95b107ce	! t0_kref+0x4690:   	pdist	%f4, %f14, %f10
	.word	0x3a480002	! t0_kref+0x4694:   	bcc,a,pt	%icc, _kref+0x469c
	.word	0x92056083	! t0_kref+0x4698:   	add	%l5, 0x83, %o1
	.word	0xa5a309d6	! t0_kref+0x469c:   	fdivd	%f12, %f22, %f18
	.word	0xde16c018	! t0_kref+0x46a0:   	lduh	[%i3 + %i0], %o7
	.word	0x81ad0ab2	! t0_kref+0x46a4:   	fcmpes	%fcc0, %f20, %f18
	.word	0x9da01a2c	! t0_kref+0x46a8:   	fstoi	%f12, %f14
	.word	0xa7a1482b	! t0_kref+0x46ac:   	fadds	%f5, %f11, %f19
	.word	0x81daa7e4	! t0_kref+0x46b0:   	flush	%o2 + 0x7e4
	.word	0x37800003	! t0_kref+0x46b4:   	fbge,a	_kref+0x46c0
	.word	0xa8e5281b	! t0_kref+0x46b8:   	subccc	%l4, 0x81b, %l4
	.word	0xe848a019	! t0_kref+0x46bc:   	ldsb	[%g2 + 0x19], %l4
	.word	0x35480008	! t0_kref+0x46c0:   	fbue,a,pt	%fcc0, _kref+0x46e0
	.word	0xd60e001a	! t0_kref+0x46c4:   	ldub	[%i0 + %i2], %o3
	.word	0x27800007	! t0_kref+0x46c8:   	fbul,a	_kref+0x46e4
	.word	0xba102010	! t0_kref+0x46cc:   	mov	0x10, %i5
	.word	0x8d854012	! t0_kref+0x46d0:   	wr	%l5, %l2, %fprs
	.word	0xa9b405cc	! t0_kref+0x46d4:   	fcmpeq32	%f16, %f12, %l4
	.word	0xe2167ff0	! t0_kref+0x46d8:   	lduh	[%i1 - 0x10], %l1
	.word	0x9f2520ce	! t0_kref+0x46dc:   	mulscc	%l4, 0xce, %o7
	.word	0xe830a000	! t0_kref+0x46e0:   	sth	%l4, [%g2]
	.word	0x89a01052	! t0_kref+0x46e4:   	fdtox	%f18, %f4
	.word	0x29800006	! t0_kref+0x46e8:   	fbl,a	_kref+0x4700
	.word	0xada01934	! t0_kref+0x46ec:   	fstod	%f20, %f22
	.word	0x93b58240	! t0_kref+0x46f0:   	array16	%l6, %g0, %o1
	.word	0xa4bd0014	! t0_kref+0x46f4:   	xnorcc	%l4, %l4, %l2
	.word	0xea5e0000	! t0_kref+0x46f8:   	ldx	[%i0], %l5
	.word	0xe8266018	! t0_kref+0x46fc:   	st	%l4, [%i1 + 0x18]
	.word	0x81aa0a52	! t0_kref+0x4700:   	fcmpd	%fcc0, %f8, %f18
	.word	0x98e48013	! t0_kref+0x4704:   	subccc	%l2, %l3, %o4
	.word	0xadb50ae5	! t0_kref+0x4708:   	fpsub32s	%f20, %f5, %f22
	.word	0x9844c012	! t0_kref+0x470c:   	addc	%l3, %l2, %o4
	.word	0xa33d8015	! t0_kref+0x4710:   	sra	%l6, %l5, %l1
	.word	0xec380018	! t0_kref+0x4714:   	std	%l6, [%g0 + %i0]
	.word	0xac654013	! t0_kref+0x4718:   	subc	%l5, %l3, %l6
	.word	0xedee501b	! t0_kref+0x471c:   	prefetcha	%i1 + %i3, 22
	.word	0x93400000	! t0_kref+0x4720:   	mov	%y, %o1
	.word	0x8d856349	! t0_kref+0x4724:   	wr	%l5, 0x349, %fprs
	.word	0x95b48dd0	! t0_kref+0x4728:   	fnand	%f18, %f16, %f10
	.word	0xada3482b	! t0_kref+0x472c:   	fadds	%f13, %f11, %f22
	.word	0xa1a00123	! t0_kref+0x4730:   	fabss	%f3, %f16
	.word	0x95a0054e	! t0_kref+0x4734:   	fsqrtd	%f14, %f10
	.word	0xe24e2017	! t0_kref+0x4738:   	ldsb	[%i0 + 0x17], %l1
	.word	0x2d480006	! t0_kref+0x473c:   	fbg,a,pt	%fcc0, _kref+0x4754
	.word	0x8db18e80	! t0_kref+0x4740:   	fsrc1	%f6, %f6
	.word	0x81a88a48	! t0_kref+0x4744:   	fcmpd	%fcc0, %f2, %f8
	.word	0xa5a209c6	! t0_kref+0x4748:   	fdivd	%f8, %f6, %f18
	.word	0xcb067fe4	! t0_kref+0x474c:   	ld	[%i1 - 0x1c], %f5
	.word	0x90f58016	! t0_kref+0x4750:   	udivcc	%l6, %l6, %o0
	.word	0x81ac0ad0	! t0_kref+0x4754:   	fcmped	%fcc0, %f16, %f16
	.word	0xe4563fee	! t0_kref+0x4758:   	ldsh	[%i0 - 0x12], %l2
	.word	0xc7ee5014	! t0_kref+0x475c:   	prefetcha	%i1 + %l4, 3
	.word	0xa5a0c928	! t0_kref+0x4760:   	fmuls	%f3, %f8, %f18
	.word	0x99aac052	! t0_kref+0x4764:   	fmovdge	%fcc0, %f18, %f12
	.word	0x89b48a88	! t0_kref+0x4768:   	fpsub16	%f18, %f8, %f4
	.word	0xac254012	! t0_kref+0x476c:   	sub	%l5, %l2, %l6
	.word	0xee6e8019	! t0_kref+0x4770:   	ldstub	[%i2 + %i1], %l7
	.word	0xa874c013	! t0_kref+0x4774:   	udiv	%l3, %l3, %l4
	.word	0xc398a080	! t0_kref+0x4778:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0x9f414000	! t0_kref+0x477c:   	mov	%pc, %o7
	.word	0xee4e0000	! t0_kref+0x4780:   	ldsb	[%i0], %l7
	.word	0xa4350012	! t0_kref+0x4784:   	orn	%l4, %l2, %l2
	.word	0xa1b00c20	! t0_kref+0x4788:   	fzeros	%f16
	.word	0x8184c000	! t0_kref+0x478c:   	wr	%l3, %g0, %y
	.word	0x81580000	! t0_kref+0x4790:   	flushw
	.word	0xa1a018c6	! t0_kref+0x4794:   	fdtos	%f6, %f16
	call	SYM(t0_subr0)
	.word	0x81848000	! t0_kref+0x479c:   	wr	%l2, %g0, %y
	.word	0x9e5cf62a	! t0_kref+0x47a0:   	smul	%l3, -0x9d6, %o7
	.word	0x9214ec4f	! t0_kref+0x47a4:   	or	%l3, 0xc4f, %o1
	.word	0xe81e001d	! t0_kref+0x47a8:   	ldd	[%i0 + %i5], %l4
	.word	0x9fa00535	! t0_kref+0x47ac:   	fsqrts	%f21, %f15
	.word	0xa024f94a	! t0_kref+0x47b0:   	sub	%l3, -0x6b6, %l0
	.word	0xa1b50c4a	! t0_kref+0x47b4:   	fnor	%f20, %f10, %f16
	.word	0xeca01019	! t0_kref+0x47b8:   	sta	%l6, [%g0 + %i1]0x80
	.word	0xc398a080	! t0_kref+0x47bc:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0xd7e61015	! t0_kref+0x47c0:   	casa	[%i0]0x80, %l5, %o3
	.word	0x3d480006	! t0_kref+0x47c4:   	fbule,a,pt	%fcc0, _kref+0x47dc
	.word	0xec16c018	! t0_kref+0x47c8:   	lduh	[%i3 + %i0], %l6
	.word	0xd86e8018	! t0_kref+0x47cc:   	ldstub	[%i2 + %i0], %o4
	.word	0xa8bd0012	! t0_kref+0x47d0:   	xnorcc	%l4, %l2, %l4
	.word	0xa1a01a30	! t0_kref+0x47d4:   	fstoi	%f16, %f16
	.word	0x98ad7fee	! t0_kref+0x47d8:   	andncc	%l5, -0x12, %o4
	.word	0xec28a03b	! t0_kref+0x47dc:   	stb	%l6, [%g2 + 0x3b]
	.word	0xadb34dec	! t0_kref+0x47e0:   	fnands	%f13, %f12, %f22
	.word	0xa63d0012	! t0_kref+0x47e4:   	xnor	%l4, %l2, %l3
	.word	0x81257a0c	! t0_kref+0x47e8:   	mulscc	%l5, -0x5f4, %g0
	.word	0x945d67d5	! t0_kref+0x47ec:   	smul	%l5, 0x7d5, %o2
	.word	0xec28a013	! t0_kref+0x47f0:   	stb	%l6, [%g2 + 0x13]
	call	SYM(t0_subr3)
	.word	0xa9b40506	! t0_kref+0x47f8:   	fcmpgt16	%f16, %f6, %l4
	.word	0xf9ee501c	! t0_kref+0x47fc:   	prefetcha	%i1 + %i4, 28
	.word	0xec263fe0	! t0_kref+0x4800:   	st	%l6, [%i0 - 0x20]
	.word	0xaa248013	! t0_kref+0x4804:   	sub	%l2, %l3, %l5
	.word	0x97a0052e	! t0_kref+0x4808:   	fsqrts	%f14, %f11
	.word	0xc398a080	! t0_kref+0x480c:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0xace5aba4	! t0_kref+0x4810:   	subccc	%l6, 0xba4, %l6
	.word	0xaae533cc	! t0_kref+0x4814:   	subccc	%l4, -0xc34, %l5
	.word	0x9db30746	! t0_kref+0x4818:   	fpack32	%f12, %f6, %f14
	.word	0xa5a00556	! t0_kref+0x481c:   	fsqrtd	%f22, %f18
	.word	0xacf4c013	! t0_kref+0x4820:   	udivcc	%l3, %l3, %l6
	.word	0xa62cc015	! t0_kref+0x4824:   	andn	%l3, %l5, %l3
	.word	0x98648015	! t0_kref+0x4828:   	subc	%l2, %l5, %o4
	.word	0xa074c014	! t0_kref+0x482c:   	udiv	%l3, %l4, %l0
	.word	0x89a28850	! t0_kref+0x4830:   	faddd	%f10, %f16, %f4
	.word	0xa5a10825	! t0_kref+0x4834:   	fadds	%f4, %f5, %f18
	.word	0x87a000b2	! t0_kref+0x4838:   	fnegs	%f18, %f3
	.word	0x99b00c20	! t0_kref+0x483c:   	fzeros	%f12
	.word	0xc5ee1014	! t0_kref+0x4840:   	prefetcha	%i0 + %l4, 2
	.word	0x99a018c6	! t0_kref+0x4844:   	fdtos	%f6, %f12
	.word	0xe0ee1000	! t0_kref+0x4848:   	ldstuba	[%i0]0x80, %l0
	.word	0xe420a010	! t0_kref+0x484c:   	st	%l2, [%g2 + 0x10]
	.word	0x86102019	! t0_kref+0x4850:   	mov	0x19, %g3
	.word	0x86a0e001	! t0_kref+0x4854:   	subcc	%g3, 1, %g3
	.word	0x22800001	! t0_kref+0x4858:   	be,a	_kref+0x485c
	.word	0x91b3cc6d	! t0_kref+0x485c:   	fnors	%f15, %f13, %f8
	.word	0xc568a0c6	! t0_kref+0x4860:   	prefetch	%g2 + 0xc6, 2
	.word	0x80f4c012	! t0_kref+0x4864:   	udivcc	%l3, %l2, %g0
	.word	0x8fa00530	! t0_kref+0x4868:   	fsqrts	%f16, %f7
	.word	0xadb40a94	! t0_kref+0x486c:   	fpsub16	%f16, %f20, %f22
	.word	0x97b28f6b	! t0_kref+0x4870:   	fornot1s	%f10, %f11, %f11
	.word	0xc51e6000	! t0_kref+0x4874:   	ldd	[%i1], %f2
	.word	0xab3cc015	! t0_kref+0x4878:   	sra	%l3, %l5, %l5
	.word	0xd80e7ff0	! t0_kref+0x487c:   	ldub	[%i1 - 0x10], %o4
	.word	0x95b1cdf2	! t0_kref+0x4880:   	fnands	%f7, %f18, %f10
	.word	0x91a0052b	! t0_kref+0x4884:   	fsqrts	%f11, %f8
	.word	0xa01dabea	! t0_kref+0x4888:   	xor	%l6, 0xbea, %l0
	.word	0x8124c012	! t0_kref+0x488c:   	mulscc	%l3, %l2, %g0
	.word	0x81ac4ab5	! t0_kref+0x4890:   	fcmpes	%fcc0, %f17, %f21
	call	SYM(t0_subr0)
	.word	0x95b00fc0	! t0_kref+0x4898:   	fone	%f10
	.word	0xa0acc014	! t0_kref+0x489c:   	andncc	%l3, %l4, %l0
	.word	0xac64c015	! t0_kref+0x48a0:   	subc	%l3, %l5, %l6
	.word	0x813ca013	! t0_kref+0x48a4:   	sra	%l2, 0x13, %g0
	.word	0xec2e3ffd	! t0_kref+0x48a8:   	stb	%l6, [%i0 - 3]
	.word	0xa1408000	! t0_kref+0x48ac:   	mov	%ccr, %l0
	.word	0xa9a488c8	! t0_kref+0x48b0:   	fsubd	%f18, %f8, %f20
	.word	0xe6262000	! t0_kref+0x48b4:   	st	%l3, [%i0]
	.word	0xa9b204c8	! t0_kref+0x48b8:   	fcmpne32	%f8, %f8, %l4
	.word	0xaa350013	! t0_kref+0x48bc:   	orn	%l4, %l3, %l5
	.word	0x3e480005	! t0_kref+0x48c0:   	bvc,a,pt	%icc, _kref+0x48d4
	.word	0xa03579fe	! t0_kref+0x48c4:   	orn	%l5, -0x602, %l0
	.word	0xed1f4019	! t0_kref+0x48c8:   	ldd	[%i5 + %i1], %f22
	.word	0xa69d0015	! t0_kref+0x48cc:   	xorcc	%l4, %l5, %l3
	.word	0x8143c000	! t0_kref+0x48d0:   	stbar
	.word	0x85b08e06	! t0_kref+0x48d4:   	fand	%f2, %f6, %f2
	.word	0xd68e501a	! t0_kref+0x48d8:   	lduba	[%i1 + %i2]0x80, %o3
	.word	0xee8e101a	! t0_kref+0x48dc:   	lduba	[%i0 + %i2]0x80, %l7
	.word	0xd7267fe8	! t0_kref+0x48e0:   	st	%f11, [%i1 - 0x18]
	.word	0x81a98ad6	! t0_kref+0x48e4:   	fcmped	%fcc0, %f6, %f22
	.word	0xa3a00535	! t0_kref+0x48e8:   	fsqrts	%f21, %f17
	.word	0x33480001	! t0_kref+0x48ec:   	fbe,a,pt	%fcc0, _kref+0x48f0
	.word	0xa2e4c015	! t0_kref+0x48f0:   	subccc	%l3, %l5, %l1
	.word	0x95b48d40	! t0_kref+0x48f4:   	fnot1	%f18, %f10
	.word	0xa2f54015	! t0_kref+0x48f8:   	udivcc	%l5, %l5, %l1
	.word	0x99b54f65	! t0_kref+0x48fc:   	fornot1s	%f21, %f5, %f12
	.word	0x35480004	! t0_kref+0x4900:   	fbue,a,pt	%fcc0, _kref+0x4910
	.word	0x805d0015	! t0_kref+0x4904:   	smul	%l4, %l5, %g0
	.word	0x98fd4016	! t0_kref+0x4908:   	sdivcc	%l5, %l6, %o4
	.word	0x95252c7c	! t0_kref+0x490c:   	mulscc	%l4, 0xc7c, %o2
	.word	0xe700a008	! t0_kref+0x4910:   	ld	[%g2 + 8], %f19
	.word	0xa9a00528	! t0_kref+0x4914:   	fsqrts	%f8, %f20
	.word	0xdf070018	! t0_kref+0x4918:   	ld	[%i4 + %i0], %f15
	.word	0x81a88a4e	! t0_kref+0x491c:   	fcmpd	%fcc0, %f2, %f14
	.word	0xe5f61012	! t0_kref+0x4920:   	casxa	[%i0]0x80, %l2, %l2
	.word	0xea20a010	! t0_kref+0x4924:   	st	%l5, [%g2 + 0x10]
	.word	0xe628a001	! t0_kref+0x4928:   	stb	%l3, [%g2 + 1]
	.word	0x8143c000	! t0_kref+0x492c:   	stbar
	.word	0xa4648016	! t0_kref+0x4930:   	subc	%l2, %l6, %l2
	.word	0x25800003	! t0_kref+0x4934:   	fblg,a	_kref+0x4940
	.word	0xe3b8a040	! t0_kref+0x4938:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xe51e4000	! t0_kref+0x493c:   	ldd	[%i1], %f18
	.word	0x3f480008	! t0_kref+0x4940:   	fbo,a,pt	%fcc0, _kref+0x4960
	.word	0xd84e7feb	! t0_kref+0x4944:   	ldsb	[%i1 - 0x15], %o4
	.word	0x85ab8042	! t0_kref+0x4948:   	fmovdule	%fcc0, %f2, %f2
	.word	0x9bb480b6	! t0_kref+0x494c:   	edge16n	%l2, %l6, %o5
	.word	0x36480006	! t0_kref+0x4950:   	bge,a,pt	%icc, _kref+0x4968
	.word	0x81ddf8b2	! t0_kref+0x4954:   	flush	%l7 - 0x74e
	.word	0x89a00548	! t0_kref+0x4958:   	fsqrtd	%f8, %f4
	.word	0x95a01a4c	! t0_kref+0x495c:   	fdtoi	%f12, %f10
	.word	0xec981018	! t0_kref+0x4960:   	ldda	[%g0 + %i0]0x80, %l6
	.word	0xea4e7fe2	! t0_kref+0x4964:   	ldsb	[%i1 - 0x1e], %l5
	.word	0xd99eda58	! t0_kref+0x4968:   	ldda	[%i3 + %i0]0xd2, %f12
	.word	0xee6e401a	! t0_kref+0x496c:   	ldstub	[%i1 + %i2], %l7
	.word	0xc807bfe8	! t0_kref+0x4970:   	ld	[%fp - 0x18], %g4
	.word	0xac758015	! t0_kref+0x4974:   	udiv	%l6, %l5, %l6
	.word	0x99a18844	! t0_kref+0x4978:   	faddd	%f6, %f4, %f12
	.word	0xe420a000	! t0_kref+0x497c:   	st	%l2, [%g2]
	.word	0xee00a018	! t0_kref+0x4980:   	ld	[%g2 + 0x18], %l7
	.word	0x89b50a8a	! t0_kref+0x4984:   	fpsub16	%f20, %f10, %f4
	.word	0x9da0192c	! t0_kref+0x4988:   	fstod	%f12, %f14
	.word	0x21480004	! t0_kref+0x498c:   	fbn,a,pt	%fcc0, _kref+0x499c
	.word	0xa784e5e0	! t0_kref+0x4990:   	wr	%l3, 0x5e0, %gsr
	.word	0x81b01022	! t0_kref+0x4994:   	siam	0x2
	.word	0xa3a00534	! t0_kref+0x4998:   	fsqrts	%f20, %f17
	.word	0x95b00cd6	! t0_kref+0x499c:   	fnot2	%f22, %f10
	.word	0xa5a00134	! t0_kref+0x49a0:   	fabss	%f20, %f18
	.word	0x81ab8a46	! t0_kref+0x49a4:   	fcmpd	%fcc0, %f14, %f6
	.word	0x8585ba0c	! t0_kref+0x49a8:   	wr	%l6, 0xfffffa0c, %ccr
	.word	0x86102010	! t0_kref+0x49ac:   	mov	0x10, %g3
	.word	0x86a0e001	! t0_kref+0x49b0:   	subcc	%g3, 1, %g3
	.word	0x22800011	! t0_kref+0x49b4:   	be,a	_kref+0x49f8
	.word	0xa9a38854	! t0_kref+0x49b8:   	faddd	%f14, %f20, %f20
	.word	0xa7850012	! t0_kref+0x49bc:   	wr	%l4, %l2, %gsr
	.word	0x93a0052b	! t0_kref+0x49c0:   	fsqrts	%f11, %f9
	.word	0xed066010	! t0_kref+0x49c4:   	ld	[%i1 + 0x10], %f22
	.word	0x8584bce6	! t0_kref+0x49c8:   	wr	%l2, 0xfffffce6, %ccr
	.word	0xe436600a	! t0_kref+0x49cc:   	sth	%l2, [%i1 + 0xa]
	.word	0x99b20a25	! t0_kref+0x49d0:   	fpadd16s	%f8, %f5, %f12
	.word	0x39bffff7	! t0_kref+0x49d4:   	fbuge,a	_kref+0x49b0
	.word	0xa0d58012	! t0_kref+0x49d8:   	umulcc	%l6, %l2, %l0
	.word	0xed180019	! t0_kref+0x49dc:   	ldd	[%g0 + %i1], %f22
	.word	0x87a018c4	! t0_kref+0x49e0:   	fdtos	%f4, %f3
	.word	0x97b4c0b4	! t0_kref+0x49e4:   	edge16n	%l3, %l4, %o3
	.word	0x91a1884e	! t0_kref+0x49e8:   	faddd	%f6, %f14, %f8
	.word	0xa7b54015	! t0_kref+0x49ec:   	edge8	%l5, %l5, %l3
	.word	0xe42e3ff6	! t0_kref+0x49f0:   	stb	%l2, [%i0 - 0xa]
	.word	0xa5a0052b	! t0_kref+0x49f4:   	fsqrts	%f11, %f18
	.word	0x2f480007	! t0_kref+0x49f8:   	fbu,a,pt	%fcc0, _kref+0x4a14
	.word	0xc398a080	! t0_kref+0x49fc:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0xa5a308c8	! t0_kref+0x4a00:   	fsubd	%f12, %f8, %f18
	.word	0x30480003	! t0_kref+0x4a04:   	ba,a,pt	%icc, _kref+0x4a10
	.word	0xee0e0000	! t0_kref+0x4a08:   	ldub	[%i0], %l7
	.word	0x38480006	! t0_kref+0x4a0c:   	bgu,a,pt	%icc, _kref+0x4a24
	.word	0xd6163fe8	! t0_kref+0x4a10:   	lduh	[%i0 - 0x18], %o3
	.word	0x91b54154	! t0_kref+0x4a14:   	edge32l	%l5, %l4, %o0
	.word	0xeb200019	! t0_kref+0x4a18:   	st	%f21, [%g0 + %i1]
	.word	0xada00554	! t0_kref+0x4a1c:   	fsqrtd	%f20, %f22
	.word	0xe320a020	! t0_kref+0x4a20:   	st	%f17, [%g2 + 0x20]
	.word	0xd0d6d019	! t0_kref+0x4a24:   	ldsha	[%i3 + %i1]0x80, %o0
	.word	0xa1a10924	! t0_kref+0x4a28:   	fmuls	%f4, %f4, %f16
	.word	0x2e480006	! t0_kref+0x4a2c:   	bvs,a,pt	%icc, _kref+0x4a44
	.word	0xffee501a	! t0_kref+0x4a30:   	prefetcha	%i1 + %i2, 31
	.word	0xebee101a	! t0_kref+0x4a34:   	prefetcha	%i0 + %i2, 21
	.word	0xa1b009a3	! t0_kref+0x4a38:   	fexpand	%f3, %f16
	.word	0xac258015	! t0_kref+0x4a3c:   	sub	%l6, %l5, %l6
	.word	0xab356001	! t0_kref+0x4a40:   	srl	%l5, 0x1, %l5
	.word	0x9da01915	! t0_kref+0x4a44:   	fitod	%f21, %f14
	.word	0x89a0190c	! t0_kref+0x4a48:   	fitod	%f12, %f4
	.word	0x86102008	! t0_kref+0x4a4c:   	mov	0x8, %g3
	.word	0x86a0e001	! t0_kref+0x4a50:   	subcc	%g3, 1, %g3
	.word	0x2280000c	! t0_kref+0x4a54:   	be,a	_kref+0x4a84
	.word	0xa7a4c8a4	! t0_kref+0x4a58:   	fsubs	%f19, %f4, %f19
	.word	0x9e756a04	! t0_kref+0x4a5c:   	udiv	%l5, 0xa04, %o7
	.word	0xc53e6000	! t0_kref+0x4a60:   	std	%f2, [%i1]
	.word	0xea2e8019	! t0_kref+0x4a64:   	stb	%l5, [%i2 + %i1]
	.word	0x81580000	! t0_kref+0x4a68:   	flushw
	.word	0x3dbffff9	! t0_kref+0x4a6c:   	fbule,a	_kref+0x4a50
	.word	0x91a0052f	! t0_kref+0x4a70:   	fsqrts	%f15, %f8
	.word	0xaee522a2	! t0_kref+0x4a74:   	subccc	%l4, 0x2a2, %l7
	.word	0x89b2cc73	! t0_kref+0x4a78:   	fnors	%f11, %f19, %f4
	.word	0x30800007	! t0_kref+0x4a7c:   	ba,a	_kref+0x4a98
	.word	0x9da01044	! t0_kref+0x4a80:   	fdtox	%f4, %f14
	.word	0xec0e3ff0	! t0_kref+0x4a84:   	ldub	[%i0 - 0x10], %l6
	.word	0x85b10748	! t0_kref+0x4a88:   	fpack32	%f4, %f8, %f2
	.word	0xc1be5853	! t0_kref+0x4a8c:   	stda	%f0, [%i1 + %l3]0xc2
	.word	0xa6a5b8a2	! t0_kref+0x4a90:   	subcc	%l6, -0x75e, %l3
	.word	0x2b480005	! t0_kref+0x4a94:   	fbug,a,pt	%fcc0, _kref+0x4aa8
	.word	0x9eb5788b	! t0_kref+0x4a98:   	orncc	%l5, -0x775, %o7
	.word	0x9e150015	! t0_kref+0x4a9c:   	or	%l4, %l5, %o7
	.word	0xe830a02a	! t0_kref+0x4aa0:   	sth	%l4, [%g2 + 0x2a]
	.word	0xada488a3	! t0_kref+0x4aa4:   	fsubs	%f18, %f3, %f22
	.word	0x27480008	! t0_kref+0x4aa8:   	fbul,a,pt	%fcc0, _kref+0x4ac8
	.word	0xadb20a50	! t0_kref+0x4aac:   	fpadd32	%f8, %f16, %f22
	.word	0xe6062008	! t0_kref+0x4ab0:   	ld	[%i0 + 8], %l3
	.word	0xada0052d	! t0_kref+0x4ab4:   	fsqrts	%f13, %f22
	.word	0x8da0012e	! t0_kref+0x4ab8:   	fabss	%f14, %f6
	.word	0x8fa01a46	! t0_kref+0x4abc:   	fdtoi	%f6, %f7
	.word	0xd868a002	! t0_kref+0x4ac0:   	ldstub	[%g2 + 2], %o4
	.word	0x81ab0ac4	! t0_kref+0x4ac4:   	fcmped	%fcc0, %f12, %f4
	.word	0x9da00530	! t0_kref+0x4ac8:   	fsqrts	%f16, %f14
	.word	0x2a480006	! t0_kref+0x4acc:   	bcs,a,pt	%icc, _kref+0x4ae4
	.word	0xe0566000	! t0_kref+0x4ad0:   	ldsh	[%i1], %l0
	.word	0x001fffff	! t0_kref+0x4ad4:   	illtrap	0x1fffff
	.word	0x91a01a26	! t0_kref+0x4ad8:   	fstoi	%f6, %f8
	.word	0x983cc015	! t0_kref+0x4adc:   	xnor	%l3, %l5, %o4
	.word	0xa8548016	! t0_kref+0x4ae0:   	umul	%l2, %l6, %l4
	.word	0x93b2cab6	! t0_kref+0x4ae4:   	fpsub16s	%f11, %f22, %f9
	.word	0x81a8caa6	! t0_kref+0x4ae8:   	fcmpes	%fcc0, %f3, %f6
	.word	0xeb68a042	! t0_kref+0x4aec:   	prefetch	%g2 + 0x42, 21
	.word	0x9de3bfa0	! t0_kref+0x4af0:   	save	%sp, -0x60, %sp
	.word	0x80167d06	! t0_kref+0x4af4:   	or	%i1, -0x2fa, %g0
	.word	0x81eebee2	! t0_kref+0x4af8:   	restore	%i2, -0x11e, %g0
	.word	0xe62e7ffc	! t0_kref+0x4afc:   	stb	%l3, [%i1 - 4]
	.word	0xe0567ffc	! t0_kref+0x4b00:   	ldsh	[%i1 - 4], %l0
	.word	0xa1b485c4	! t0_kref+0x4b04:   	fcmpeq32	%f18, %f4, %l0
	.word	0x91a3c9ae	! t0_kref+0x4b08:   	fdivs	%f15, %f14, %f8
	.word	0x001fffff	! t0_kref+0x4b0c:   	illtrap	0x1fffff
	.word	0xd7200018	! t0_kref+0x4b10:   	st	%f11, [%g0 + %i0]
	.word	0xed68a104	! t0_kref+0x4b14:   	prefetch	%g2 + 0x104, 22
	.word	0x8daac054	! t0_kref+0x4b18:   	fmovdge	%fcc0, %f20, %f6
	.word	0xa08d2bda	! t0_kref+0x4b1c:   	andcc	%l4, 0xbda, %l0
	.word	0xda50a028	! t0_kref+0x4b20:   	ldsh	[%g2 + 0x28], %o5
	.word	0xe4ae1000	! t0_kref+0x4b24:   	stba	%l2, [%i0]0x80
	.word	0x001fffff	! t0_kref+0x4b28:   	illtrap	0x1fffff
	.word	0xa5a28844	! t0_kref+0x4b2c:   	faddd	%f10, %f4, %f18
	.word	0x98454013	! t0_kref+0x4b30:   	addc	%l5, %l3, %o4
	.word	0xac34a324	! t0_kref+0x4b34:   	orn	%l2, 0x324, %l6
	.word	0xa0a5a8d8	! t0_kref+0x4b38:   	subcc	%l6, 0x8d8, %l0
	.word	0xada00526	! t0_kref+0x4b3c:   	fsqrts	%f6, %f22
	.word	0x81ac8a31	! t0_kref+0x4b40:   	fcmps	%fcc0, %f18, %f17
	.word	0xa53d4012	! t0_kref+0x4b44:   	sra	%l5, %l2, %l2
	.word	0xd4c61000	! t0_kref+0x4b48:   	ldswa	[%i0]0x80, %o2
	.word	0xa5b386e6	! t0_kref+0x4b4c:   	fmul8ulx16	%f14, %f6, %f18
	.word	0x8da0190b	! t0_kref+0x4b50:   	fitod	%f11, %f6
	.word	0x813d8015	! t0_kref+0x4b54:   	sra	%l6, %l5, %g0
	.word	0xd8100018	! t0_kref+0x4b58:   	lduh	[%g0 + %i0], %o4
	.word	0x96b50013	! t0_kref+0x4b5c:   	orncc	%l4, %l3, %o3
	.word	0xe81e0000	! t0_kref+0x4b60:   	ldd	[%i0], %l4
	.word	0x81858000	! t0_kref+0x4b64:   	wr	%l6, %g0, %y
	.word	0xa87d4015	! t0_kref+0x4b68:   	sdiv	%l5, %l5, %l4
	.word	0x9fa01a50	! t0_kref+0x4b6c:   	fdtoi	%f16, %f15
	.word	0x993d4013	! t0_kref+0x4b70:   	sra	%l5, %l3, %o4
	.word	0xe4086ee8	! t0_kref+0x4b74:   	ldub	[%g1 + 0xee8], %l2
	.word	0xa41ca00c	! t0_kref+0x4b78:   	xor	%l2, 0xc, %l2
	.word	0xe4286ee8	! t0_kref+0x4b7c:   	stb	%l2, [%g1 + 0xee8]
	.word	0x81d86ee8	! t0_kref+0x4b80:   	flush	%g1 + 0xee8
	.word	0xa6f58015	! t0_kref+0x4b84:   	udivcc	%l6, %l5, %l3
	.word	0xc168a04f	! t0_kref+0x4b88:   	prefetch	%g2 + 0x4f, 0
	.word	0xd900a028	! t0_kref+0x4b8c:   	ld	[%g2 + 0x28], %f12
	.word	0xe82e6011	! t0_kref+0x4b90:   	stb	%l4, [%i1 + 0x11]
	.word	0x801d8014	! t0_kref+0x4b94:   	xor	%l6, %l4, %g0
	.word	0xe810a010	! t0_kref+0x4b98:   	lduh	[%g2 + 0x10], %l4
	.word	0x91b50db5	! t0_kref+0x4b9c:   	fxors	%f20, %f21, %f8
	.word	0x97a80028	! t0_kref+0x4ba0:   	fmovsn	%fcc0, %f8, %f11
2:	.word	0x8ba01a46	! t0_kref+0x4ba4:   	fdtoi	%f6, %f5
	.word	0xa8458016	! t0_kref+0x4ba8:   	addc	%l6, %l6, %l4
	.word	0x81858000	! t0_kref+0x4bac:   	wr	%l6, %g0, %y
	.word	0x803cf72c	! t0_kref+0x4bb0:   	xnor	%l3, -0x8d4, %g0
	.word	0xd1be5854	! t0_kref+0x4bb4:   	stda	%f8, [%i1 + %l4]0xc2
	.word	0x26480007	! t0_kref+0x4bb8:   	bl,a,pt	%icc, _kref+0x4bd4
	.word	0xd60e0000	! t0_kref+0x4bbc:   	ldub	[%i0], %o3
	.word	0x95a01907	! t0_kref+0x4bc0:   	fitod	%f7, %f10
	.word	0xa9b507c8	! t0_kref+0x4bc4:   	pdist	%f20, %f8, %f20
	.word	0xac150014	! t0_kref+0x4bc8:   	or	%l4, %l4, %l6
	.word	0xc398a080	! t0_kref+0x4bcc:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0x81ac8ad0	! t0_kref+0x4bd0:   	fcmped	%fcc0, %f18, %f16
	.word	0xe89e1000	! t0_kref+0x4bd4:   	ldda	[%i0]0x80, %l4
	.word	0xa474f24f	! t0_kref+0x4bd8:   	udiv	%l3, -0xdb1, %l2
	.word	0xcb26401c	! t0_kref+0x4bdc:   	st	%f5, [%i1 + %i4]
	.word	0x9da48846	! t0_kref+0x4be0:   	faddd	%f18, %f6, %f14
	.word	0xd91e2010	! t0_kref+0x4be4:   	ldd	[%i0 + 0x10], %f12
	.word	0xa5a588c8	! t0_kref+0x4be8:   	fsubd	%f22, %f8, %f18
	.word	0x90e5242e	! t0_kref+0x4bec:   	subccc	%l4, 0x42e, %o0
	.word	0x90a5b83c	! t0_kref+0x4bf0:   	subcc	%l6, -0x7c4, %o0
	.word	0xc398a080	! t0_kref+0x4bf4:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0x81a90a4c	! t0_kref+0x4bf8:   	fcmpd	%fcc0, %f4, %f12
	.word	0xd9bf5a59	! t0_kref+0x4bfc:   	stda	%f12, [%i5 + %i1]0xd2
	.word	0xa1b00fc0	! t0_kref+0x4c00:   	fone	%f16
	.word	0x9fb20554	! t0_kref+0x4c04:   	fcmpeq16	%f8, %f20, %o7
	.word	0x8ba01a24	! t0_kref+0x4c08:   	fstoi	%f4, %f5
	.word	0xcb00a038	! t0_kref+0x4c0c:   	ld	[%g2 + 0x38], %f5
	.word	0xadb48075	! t0_kref+0x4c10:   	edge8ln	%l2, %l5, %l6
	.word	0x2e800008	! t0_kref+0x4c14:   	bvs,a	_kref+0x4c34
	.word	0xacfcfb96	! t0_kref+0x4c18:   	sdivcc	%l3, -0x46a, %l6
	.word	0x81ad0a48	! t0_kref+0x4c1c:   	fcmpd	%fcc0, %f20, %f8
	.word	0xffee501a	! t0_kref+0x4c20:   	prefetcha	%i1 + %i2, 31
	.word	0xd520a020	! t0_kref+0x4c24:   	st	%f10, [%g2 + 0x20]
	.word	0x81db60be	! t0_kref+0x4c28:   	flush	%o5 + 0xbe
	.word	0xcb070019	! t0_kref+0x4c2c:   	ld	[%i4 + %i1], %f5
	.word	0x36480006	! t0_kref+0x4c30:   	bge,a,pt	%icc, _kref+0x4c48
	.word	0xe46e3fec	! t0_kref+0x4c34:   	ldstub	[%i0 - 0x14], %l2
	.word	0x9ee522a0	! t0_kref+0x4c38:   	subccc	%l4, 0x2a0, %o7
	.word	0x37480004	! t0_kref+0x4c3c:   	fbge,a,pt	%fcc0, _kref+0x4c4c
	.word	0xda6e001a	! t0_kref+0x4c40:   	ldstub	[%i0 + %i2], %o5
	.word	0xd9f61014	! t0_kref+0x4c44:   	casxa	[%i0]0x80, %l4, %o4
	.word	0x99b0c970	! t0_kref+0x4c48:   	fpmerge	%f3, %f16, %f12
	.word	0xacad4016	! t0_kref+0x4c4c:   	andncc	%l5, %l6, %l6
	.word	0xa5a3cd33	! t0_kref+0x4c50:   	fsmuld	%f15, %f19, %f18
	.word	0x9fa0052f	! t0_kref+0x4c54:   	fsqrts	%f15, %f15
	.word	0xaab4f251	! t0_kref+0x4c58:   	orncc	%l3, -0xdaf, %l5
	.word	0xea2e8018	! t0_kref+0x4c5c:   	stb	%l5, [%i2 + %i0]
	.word	0xa784a656	! t0_kref+0x4c60:   	wr	%l2, 0x656, %gsr
	.word	0x91a00533	! t0_kref+0x4c64:   	fsqrts	%f19, %f8
	.word	0x81ac8a4c	! t0_kref+0x4c68:   	fcmpd	%fcc0, %f18, %f12
	.word	0xd88e1000	! t0_kref+0x4c6c:   	lduba	[%i0]0x80, %o4
	.word	0xc048a038	! t0_kref+0x4c70:   	ldsb	[%g2 + 0x38], %g0
	.word	0xa5a00550	! t0_kref+0x4c74:   	fsqrtd	%f16, %f18
	.word	0x8bb14cb2	! t0_kref+0x4c78:   	fandnot2s	%f5, %f18, %f5
	.word	0xe4500018	! t0_kref+0x4c7c:   	ldsh	[%g0 + %i0], %l2
	.word	0xe4ce5000	! t0_kref+0x4c80:   	ldsba	[%i1]0x80, %l2
	.word	0xa49d3857	! t0_kref+0x4c84:   	xorcc	%l4, -0x7a9, %l2
	.word	0x8610201f	! t0_kref+0x4c88:   	mov	0x1f, %g3
	.word	0x86a0e001	! t0_kref+0x4c8c:   	subcc	%g3, 1, %g3
	.word	0x2280000a	! t0_kref+0x4c90:   	be,a	_kref+0x4cb8
	.word	0xa9a48925	! t0_kref+0x4c94:   	fmuls	%f18, %f5, %f20
	.word	0x2dbffffd	! t0_kref+0x4c98:   	fbg,a	_kref+0x4c8c
	.word	0xae75228d	! t0_kref+0x4c9c:   	udiv	%l4, 0x28d, %l7
	.word	0x85a0192b	! t0_kref+0x4ca0:   	fstod	%f11, %f2
	.word	0xe3b8a040	! t0_kref+0x4ca4:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x95b407c6	! t0_kref+0x4ca8:   	pdist	%f16, %f6, %f10
	.word	0xd3060000	! t0_kref+0x4cac:   	ld	[%i0], %f9
	.word	0xc398a080	! t0_kref+0x4cb0:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0xe6d6d018	! t0_kref+0x4cb4:   	ldsha	[%i3 + %i0]0x80, %l3
	.word	0x89b50965	! t0_kref+0x4cb8:   	fpmerge	%f20, %f5, %f4
	.word	0x99a01904	! t0_kref+0x4cbc:   	fitod	%f4, %f12
	.word	0x9a1d3359	! t0_kref+0x4cc0:   	xor	%l4, -0xca7, %o5
	.word	0x21800008	! t0_kref+0x4cc4:   	fbn,a	_kref+0x4ce4
	.word	0xada208c4	! t0_kref+0x4cc8:   	fsubd	%f8, %f4, %f22
	.word	0xdb266018	! t0_kref+0x4ccc:   	st	%f13, [%i1 + 0x18]
	.word	0xe6d81019	! t0_kref+0x4cd0:   	ldxa	[%g0 + %i1]0x80, %l3
	.word	0x38480004	! t0_kref+0x4cd4:   	bgu,a,pt	%icc, _kref+0x4ce4
	.word	0xf1ee501c	! t0_kref+0x4cd8:   	prefetcha	%i1 + %i4, 24
	.word	0xd520a030	! t0_kref+0x4cdc:   	st	%f10, [%g2 + 0x30]
	.word	0xdb266014	! t0_kref+0x4ce0:   	st	%f13, [%i1 + 0x14]
	.word	0x81de001a	! t0_kref+0x4ce4:   	flush	%i0 + %i2
	.word	0xa78575af	! t0_kref+0x4ce8:   	wr	%l5, 0xfffff5af, %gsr
	.word	0x81850000	! t0_kref+0x4cec:   	wr	%l4, %g0, %y
	.word	0x92ad8016	! t0_kref+0x4cf0:   	andncc	%l6, %l6, %o1
	.word	0x32480003	! t0_kref+0x4cf4:   	bne,a,pt	%icc, _kref+0x4d00
	.word	0xada109c8	! t0_kref+0x4cf8:   	fdivd	%f4, %f8, %f22
	.word	0x9a64c016	! t0_kref+0x4cfc:   	subc	%l3, %l6, %o5
	.word	0xa8257e61	! t0_kref+0x4d00:   	sub	%l5, -0x19f, %l4
	.word	0x8db30ed6	! t0_kref+0x4d04:   	fornot2	%f12, %f22, %f6
	.word	0xec20a038	! t0_kref+0x4d08:   	st	%l6, [%g2 + 0x38]
	.word	0xacf5be38	! t0_kref+0x4d0c:   	udivcc	%l6, -0x1c8, %l6
	.word	0xabb50ea0	! t0_kref+0x4d10:   	fsrc1s	%f20, %f21
	.word	0xa5b28d40	! t0_kref+0x4d14:   	fnot1	%f10, %f18
	.word	0xa1057bee	! t0_kref+0x4d18:   	taddcc	%l5, -0x412, %l0
	.word	0x81ab8ac2	! t0_kref+0x4d1c:   	fcmped	%fcc0, %f14, %f2
	.word	0xe8067ff0	! t0_kref+0x4d20:   	ld	[%i1 - 0x10], %l4
	.word	0xa1a00550	! t0_kref+0x4d24:   	fsqrtd	%f16, %f16
	.word	0x9fa4c825	! t0_kref+0x4d28:   	fadds	%f19, %f5, %f15
	.word	0x9fa00524	! t0_kref+0x4d2c:   	fsqrts	%f4, %f15
	.word	0x95a00546	! t0_kref+0x4d30:   	fsqrtd	%f6, %f10
	.word	0x81df0012	! t0_kref+0x4d34:   	flush	%i4 + %l2
	.word	0x86102003	! t0_kref+0x4d38:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x4d3c:   	bne,a	_kref+0x4d3c
	.word	0x86a0e001	! t0_kref+0x4d40:   	subcc	%g3, 1, %g3
	.word	0x9055bb91	! t0_kref+0x4d44:   	umul	%l6, -0x46f, %o0
	.word	0x8da48854	! t0_kref+0x4d48:   	faddd	%f18, %f20, %f6
	.word	0xd456401b	! t0_kref+0x4d4c:   	ldsh	[%i1 + %i3], %o2
	.word	0xa1a00128	! t0_kref+0x4d50:   	fabss	%f8, %f16
	.word	0x9da01907	! t0_kref+0x4d54:   	fitod	%f7, %f14
	.word	0xc807bff0	! t0_kref+0x4d58:   	ld	[%fp - 0x10], %g4
	.word	0x95a3882e	! t0_kref+0x4d5c:   	fadds	%f14, %f14, %f10
	.word	0xa41cc014	! t0_kref+0x4d60:   	xor	%l3, %l4, %l2
	.word	0xa014c014	! t0_kref+0x4d64:   	or	%l3, %l4, %l0
	.word	0x93a149aa	! t0_kref+0x4d68:   	fdivs	%f5, %f10, %f9
	.word	0x94748016	! t0_kref+0x4d6c:   	udiv	%l2, %l6, %o2
	.word	0xaab48015	! t0_kref+0x4d70:   	orncc	%l2, %l5, %l5
	.word	0x9e44c012	! t0_kref+0x4d74:   	addc	%l3, %l2, %o7
	.word	0xee16401b	! t0_kref+0x4d78:   	lduh	[%i1 + %i3], %l7
	.word	0xc168a00c	! t0_kref+0x4d7c:   	prefetch	%g2 + 0xc, 0
	.word	0x3b480003	! t0_kref+0x4d80:   	fble,a,pt	%fcc0, _kref+0x4d8c
	.word	0xe62e600b	! t0_kref+0x4d84:   	stb	%l3, [%i1 + 0xb]
	.word	0x2f480004	! t0_kref+0x4d88:   	fbu,a,pt	%fcc0, _kref+0x4d98
	.word	0xaa1db8cf	! t0_kref+0x4d8c:   	xor	%l6, -0x731, %l5
	.word	0x85858014	! t0_kref+0x4d90:   	wr	%l6, %l4, %ccr
	.word	0xec280019	! t0_kref+0x4d94:   	stb	%l6, [%g0 + %i1]
	.word	0x9e657357	! t0_kref+0x4d98:   	subc	%l5, -0xca9, %o7
	.word	0x3e480001	! t0_kref+0x4d9c:   	bvc,a,pt	%icc, _kref+0x4da0
	.word	0xa5b48746	! t0_kref+0x4da0:   	fpack32	%f18, %f6, %f18
	.word	0xebee501b	! t0_kref+0x4da4:   	prefetcha	%i1 + %i3, 21
	.word	0xe6100019	! t0_kref+0x4da8:   	lduh	[%g0 + %i1], %l3
	.word	0x81b10408	! t0_kref+0x4dac:   	fcmple16	%f4, %f8, %g0
	.word	0xa1b00c00	! t0_kref+0x4db0:   	fzero	%f16
	.word	0x001fffff	! t0_kref+0x4db4:   	illtrap	0x1fffff
	.word	0xac1da54c	! t0_kref+0x4db8:   	xor	%l6, 0x54c, %l6
	.word	0xa8bc8016	! t0_kref+0x4dbc:   	xnorcc	%l2, %l6, %l4
	.word	0xe91e6010	! t0_kref+0x4dc0:   	ldd	[%i1 + 0x10], %f20
	.word	0x3a480002	! t0_kref+0x4dc4:   	bcc,a,pt	%icc, _kref+0x4dcc
	.word	0xa1a01936	! t0_kref+0x4dc8:   	fstod	%f22, %f16
	.word	0x87b50fa4	! t0_kref+0x4dcc:   	fors	%f20, %f4, %f3
	.word	0xd126401c	! t0_kref+0x4dd0:   	st	%f8, [%i1 + %i4]
	.word	0xeaf01018	! t0_kref+0x4dd4:   	stxa	%l5, [%g0 + %i0]0x80
	.word	0x9da0014e	! t0_kref+0x4dd8:   	fabsd	%f14, %f14
	.word	0x28480007	! t0_kref+0x4ddc:   	bleu,a,pt	%icc, _kref+0x4df8
	.word	0xadb38552	! t0_kref+0x4de0:   	fcmpeq16	%f14, %f18, %l6
	.word	0xa3b4c096	! t0_kref+0x4de4:   	edge16	%l3, %l6, %l1
	.word	0xc368a0c6	! t0_kref+0x4de8:   	prefetch	%g2 + 0xc6, 1
	.word	0xc398a080	! t0_kref+0x4dec:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0x28800006	! t0_kref+0x4df0:   	bleu,a	_kref+0x4e08
	.word	0x9bb00fe0	! t0_kref+0x4df4:   	fones	%f13
	.word	0x9bb48112	! t0_kref+0x4df8:   	edge32	%l2, %l2, %o5
	.word	0x26480003	! t0_kref+0x4dfc:   	bl,a,pt	%icc, _kref+0x4e08
	.word	0xa81d774e	! t0_kref+0x4e00:   	xor	%l5, -0x8b2, %l4
	.word	0xe300a008	! t0_kref+0x4e04:   	ld	[%g2 + 8], %f17
	.word	0x95a589ae	! t0_kref+0x4e08:   	fdivs	%f22, %f14, %f10
	.word	0x9de3bfa0	! t0_kref+0x4e0c:   	save	%sp, -0x60, %sp
	.word	0xb65e8000	! t0_kref+0x4e10:   	smul	%i2, %g0, %i3
	.word	0x81eebe5d	! t0_kref+0x4e14:   	restore	%i2, -0x1a3, %g0
	.word	0x9de3bfa0	! t0_kref+0x4e18:   	save	%sp, -0x60, %sp
	.word	0xb0be8018	! t0_kref+0x4e1c:   	xnorcc	%i2, %i0, %i0
	.word	0x93ef238a	! t0_kref+0x4e20:   	restore	%i4, 0x38a, %o1
	call	SYM(_kaos_done)
	.word	0x01000000	! t0_kref+0x4e28:   	nop
	KGLOBAL(t0_ktbl_end)
t0_ktbl_end:
t0_ktbl_page_end:

KTEXT_MODULE(t0_module_subr0, 0x3654a000)
.seg "text"
t0_subr0_page_begin:
	.skip 8188
.global _t0_subr0; ENTRY(t0_subr0)
	.word	0xa6844012	! t0_subr0+0x0:   	addcc	%l1, %l2, %l3
	.word	0x81c3e008	! t0_subr0+0x4:   	retl
	.word	0xaa64c014	! t0_subr0+0x8:   	subc	%l3, %l4, %l5
t0_subr0_page_end:

KTEXT_MODULE(t0_module_subr1, 0x28590000)
.seg "text"
t0_subr1_page_begin:
	.skip 8180
.global _t0_subr1; ENTRY(t0_subr1)
	.word	0x9de3bfa0	! t0_subr1+0x0:   	save	%sp, -0x60, %sp
	.word	0xb29eaa5a	! t0_subr1+0x4:   	xorcc	%i2, 0xa5a, %i1
	.word	0x81c7e008	! t0_subr1+0x8:   	ret
	.word	0xa7ee6001	! t0_subr1+0xc:   	restore	%i1, 1, %l3
t0_subr1_page_end:

KTEXT_MODULE(t0_module_subr2, 0x36124000)
.seg "text"
t0_subr2_page_begin:
	.skip 8188
.global _t0_subr2; ENTRY(t0_subr2)
	.word	0x9de3bfa0	! t0_subr2+0x0:   	save	%sp, -0x60, %sp
	.word	0xb2066001	! t0_subr2+0x4:   	add	%i1, 1, %i1
	.word	0x81c7e008	! t0_subr2+0x8:   	ret
	.word	0xa3ee6001	! t0_subr2+0xc:   	restore	%i1, 1, %l1
t0_subr2_page_end:

KTEXT_MODULE(t0_module_subr3, 0x359ac000)
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
!  Total operations: 4766  
!
!  Operation frequencies
!
!  name               exp    obs
!  ldsb              0.68   0.69
!  ldub              0.69   0.63
!  ldsh              0.91   1.11
!  lduh              0.95   0.71
!  ld                0.21   0.29
!  ldd               0.27   0.19
!  swap              0.07   0.06
!  ldstub            0.54   0.55
!  stb               1.47   1.76
!  sth               0.41   0.36
!  st                0.64   0.67
!  std               0.06   0.13
!  add               0.24   0.25
!  addcc             0.32   0.19
!  addx              0.74   0.69
!  addxcc            0.28   0.08
!  taddcc            0.18   0.13
!  taddcctv          0.19   0.25
!  sub               0.99   0.92
!  subcc             0.75   0.78
!  subx              0.83   1.03
!  subxcc            1.09   0.90
!  tsubcc            0.23   0.25
!  tsubcctv          0.03   0.04
!  mulscc            0.83   0.99
!  and               0.07   0.06
!  andcc             0.53   0.61
!  andn              0.18   0.19
!  andncc            1.24   1.36
!  or                1.15   1.09
!  orcc              0.15   0.10
!  orn               0.59   0.73
!  orncc             0.59   0.76
!  xor               1.02   1.15
!  xorcc             1.16   0.94
!  xnor              0.75   0.88
!  xnorcc            0.64   0.59
!  sll               0.85   0.67
!  srl               0.13   0.19
!  sra               0.97   1.36
!  unimp             0.15   0.17
!  umul              0.81   0.82
!  smul              0.52   0.63
!  udiv              0.86   0.80
!  sdiv              0.43   0.34
!  umulcc            0.09   0.15
!  smulcc            0.32   0.19
!  udivcc            0.84   0.80
!  sdivcc            0.49   0.36
!  rdy               1.14   1.28
!  wry               1.33   1.47
!  bicc              0.33   0.34
!  sethi             0.15   0.19
!  jmpl              0.21   0.17
!  call              1.39   1.15
!  ticc              0.00   0.00
!  flush             1.12   1.45
!  save              0.86   0.57
!  restore           0.82   0.00
!  stbar             1.18   1.28
!  ldf               1.40   1.45
!  lddf              1.21   1.28
!  stf               1.20   1.28
!  stdf              0.11   0.10
!  fadds             1.16   1.13
!  fsubs             0.21   0.38
!  fmuls             0.28   0.27
!  fdivs             0.26   0.36
!  faddd             1.07   1.22
!  fsubd             1.05   1.38
!  fmuld             0.34   0.19
!  fdivd             0.23   0.23
!  faddq             0.00   0.00
!  fsubq             0.00   0.00
!  fmulq             0.00   0.00
!  fdivq             0.00   0.00
!  fsmuld            0.67   0.84
!  fdmulq            0.00   0.00
!  fitos             0.08   0.10
!  fitod             0.89   0.76
!  fitoq             0.00   0.00
!  fstoi             0.61   0.61
!  fstod             0.74   0.73
!  fstoq             0.00   0.00
!  fdtoi             1.13   1.32
!  fdtos             0.41   0.52
!  fdtoq             0.00   0.00
!  fqtoi             0.00   0.00
!  fqtos             0.00   0.00
!  fqtod             0.00   0.00
!  fmovs             0.08   0.08
!  fnegs             0.41   0.36
!  fabss             0.61   0.71
!  fsqrts            2.24   2.43
!  fsqrtd            2.20   2.45
!  fsqrtq            0.00   0.00
!  fcmps             1.01   0.92
!  fcmpd             0.53   0.71
!  fcmpq             0.00   0.00
!  fcmpes            0.78   0.73
!  fcmped            0.92   1.11
!  fcmpeq            0.00   0.00
!  fbfcc             1.05   0.97
!  ldfsr             0.13   0.00
!  stfsr             0.01   0.00
!  loop              1.27   0.88
!  offset            0.27   0.27
!  area              0.20   0.13
!  target            0.24   0.23
!  goto              0.16   0.13
!  sigsegv           0.14   0.04
!  sigbus            0.01   0.00
!  imodify           0.73   0.69
!  ldfsr_offset      0.11   0.00
!  fpattern          0.04   0.06
!  lbranch           0.01   0.00
!  shmld             2.02   1.74
!  shmst             3.02   2.90
!  shmpf             1.00   1.11
!  shmswap           0.14   0.29
!  shmblkld          1.29   1.34
!  shmblkst          0.78   0.71
!  shmblkchk         0.38   0.23
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
!  casa              0.27   0.25
!  rdasi             0.03   0.02
!  wrasi             0.01   0.00
!  bpcc              1.85   1.99
!  fbpfcc            3.11   2.94
!  fmovscc           0.22   0.31
!  fmovdcc           0.28   0.31
!  fmovqcc           0.00   0.00
!  movcc             0.28   0.29
!  flushw            0.21   0.21
!  membar            0.21   0.13
!  prefetch          0.05   0.02
!  rdpc              0.26   0.10
!  ldqf              0.00   0.00
!  stqf              0.00   0.00
!  ldfa              0.22   0.27
!  lddfa             0.16   0.15
!  ldqfa             0.00   0.00
!  ldsba             0.29   0.29
!  ldsha             0.21   0.23
!  lduba             0.29   0.38
!  lduha             0.02   0.00
!  lda               0.18   0.27
!  ldda              0.26   0.36
!  ldstuba           0.20   0.10
!  prefetcha         1.47   1.11
!  stfa              0.02   0.04
!  stdfa             0.03   0.00
!  stqfa             0.00   0.00
!  stba              0.20   0.29
!  stha              0.06   0.08
!  sta               0.19   0.21
!  stda              0.03   0.00
!  swapa             0.27   0.25
!  fmovd             0.18   0.17
!  fnegd             0.05   0.00
!  fabsd             0.25   0.23
!  fstox             0.07   0.06
!  fdtox             0.16   0.17
!  fxtos             0.16   0.17
!  fxtod             0.05   0.02
!  lds               0.20   0.15
!  ldsa              0.10   0.06
!  ldx               0.08   0.15
!  ldxa              0.17   0.08
!  nofault           0.15   0.10
!  rdgsr             0.02   0.00
!  wrgsr             0.27   0.27
!  fpadd16           0.00   0.00
!  fpadd16s          0.19   0.15
!  fpadd32           0.23   0.25
!  fpadd32s          0.13   0.13
!  fpsub16           0.20   0.27
!  fpsub16s          0.22   0.21
!  fpsub32           0.08   0.08
!  fpsub32s          0.07   0.06
!  fpack16           0.05   0.08
!  fpack32           0.26   0.21
!  fpackfix          0.01   0.00
!  fexpand           0.25   0.31
!  fpmerge           0.26   0.38
!  fmul8x16          0.22   0.36
!  fmul8x16au        0.11   0.13
!  fmul8x16al        0.15   0.13
!  fmul8sux16        0.03   0.04
!  fmul8ulx16        0.29   0.36
!  fmuld8sux16       0.11   0.08
!  fmuld8ulx16       0.00   0.00
!  alignaddr         0.26   0.13
!  alignaddrl        0.25   0.23
!  faligndata        0.04   0.08
!  fzero             0.12   0.25
!  fzeros            0.08   0.15
!  fone              0.19   0.19
!  fones             0.06   0.10
!  fsrc1             0.19   0.15
!  fsrc1s            0.15   0.10
!  fsrc2             0.09   0.08
!  fsrc2s            0.16   0.17
!  fnot1             0.12   0.13
!  fnot1s            0.00   0.00
!  fnot2             0.13   0.21
!  fnot2s            0.14   0.15
!  for               0.03   0.02
!  fors              0.29   0.38
!  fnor              0.22   0.19
!  fnors             0.15   0.27
!  fand              0.26   0.19
!  fands             0.05   0.04
!  fnand             0.02   0.02
!  fnands            0.25   0.23
!  fxor              0.12   0.10
!  fxors             0.22   0.23
!  fxnor             0.12   0.04
!  fxnors            0.00   0.00
!  fornot1           0.16   0.23
!  fornot1s          0.19   0.23
!  fornot2           0.23   0.19
!  fornot2s          0.21   0.17
!  fandnot1          0.08   0.06
!  fandnot1s         0.11   0.10
!  fandnot2          0.00   0.00
!  fandnot2s         0.29   0.25
!  fcmpgt16          0.27   0.29
!  fcmpgt32          0.06   0.17
!  fcmple16          0.17   0.13
!  fcmple32          0.22   0.19
!  fcmpne16          0.21   0.25
!  fcmpne32          0.22   0.29
!  fcmpeq16          0.27   0.23
!  fcmpeq32          0.23   0.19
!  edge8             0.15   0.21
!  edge8l            0.12   0.04
!  edge16            0.16   0.15
!  edge16l           0.03   0.08
!  edge32            0.29   0.36
!  edge32l           0.24   0.21
!  pdist             0.22   0.40
!  partial_st8       0.24   0.31
!  partial_st16      0.18   0.21
!  partial_st32      0.12   0.08
!  short_st8         0.09   0.15
!  short_st16        0.13   0.08
!  short_ld8         0.25   0.06
!  short_ld16        0.23   0.19
!  blkld             0.09   0.00
!  blkst             0.28   0.00
!  blkld_offset      0.23   0.00
!  blkst_offset      0.07   0.00
!  blk_check         0.24   0.19
!  casxa             0.29   0.31
!  rdccr             0.29   0.25
!  rdfprs            0.09   0.06
!  wrccr             0.27   0.29
!  popc              0.14   0.19
!  wrfprs            0.18   0.25
!  stx               0.21   0.23
!  stxa              0.04   0.04
!  cflush            0.00   0.00
!  array8            0.04   0.00
!  array16           0.14   0.04
!  array32           0.06   0.02
!  edge8n            0.00   0.00
!  edge8ln           0.16   0.23
!  edge16n           0.27   0.34
!  edge16ln          0.17   0.19
!  edge32n           0.04   0.06
!  edge32ln          0.22   0.19
!  bmask             0.22   0.23
!  bshuffle          0.01   0.04
!  siam              0.03   0.06
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
KDATA_MODULE(t0_module_offset_table, 0x3ed58000)
.seg "data"
t0_offset_table_start:
t0_offset_table_size:	.word	0x00000008
t0_offset_table:
	.word	0xffffffe0
	.word	0xfffffff8
	.word	0xfffffff0
	.word	0x00000010
	.word	0xffffffe8
	.word	0x00000000
	.word	0x00000018
	.word	0x00000008
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

KDATA_MODULE(t0_module_data_in_regs, 0x1365a000)
.seg "data"
KGLOBAL(t0_data_in_regs)
t0_data_in_regs_start:
t0_data_in_regs:
	.word	0x9fd5454e          ! %f0
	.word	0xe288b97e          ! %f1
	.word	0x68be6902          ! %f2
	.word	0x2f33ae1b          ! %f3
	.word	0x61df168c          ! %f4
	.word	0xb92c39db          ! %f5
	.word	0xc8b0b47a          ! %f6
	.word	0xdfc0b09f          ! %f7
	.word	0x471641a3          ! %f8
	.word	0x4c85f09d          ! %f9
	.word	0x8fb2a318          ! %f10
	.word	0xf4d674be          ! %f11
	.word	0xde55ed45          ! %f12
	.word	0xedf460d1          ! %f13
	.word	0x92079e27          ! %f14
	.word	0x1aa6ab67          ! %f15
	.word	0x673ab4c6          ! %f16
	.word	0xfd5de262          ! %f17
	.word	0xb232125a          ! %f18
	.word	0x76e2226b          ! %f19
	.word	0x0373abba          ! %f20
	.word	0x452486f2          ! %f21
	.word	0xf2d25610          ! %f22
	.word	0xc631e770          ! %f23
	.word	0xe9ad77dd          ! %f24
	.word	0x77b2f7ee          ! %f25
	.word	0x8d972fd9          ! %f26
	.word	0xb32b262b          ! %f27
	.word	0x74faa533          ! %f28
	.word	0x43b0a1dc          ! %f29
	.word	0x35d1c138          ! %f30
	.word	0x78e635cd          ! %f31
	.word	0x142a9870          ! %f32
	.word	0x85fcc0f6          ! %f33
	.word	0xde16d9aa          ! %f34
	.word	0xf8f489be          ! %f35
	.word	0x97b2c399          ! %f36
	.word	0xba7522fc          ! %f37
	.word	0xd673f5e6          ! %f38
	.word	0x7ff87988          ! %f39
	.word	0x30e400ea          ! %f40
	.word	0x1786b246          ! %f41
	.word	0xf45e6f67          ! %f42
	.word	0xf0dd1415          ! %f43
	.word	0xcc6037fa          ! %f44
	.word	0x39d31e18          ! %f45
	.word	0x82e7a027          ! %f46
	.word	0xd3db721d          ! %f47
	.word	0xda62b11c          ! %f48
	.word	0xfe183439          ! %f49
	.word	0xd128feac          ! %f50
	.word	0x675e3bd9          ! %f51
	.word	0x43afbb09          ! %f52
	.word	0x053abfc6          ! %f53
	.word	0x72877647          ! %f54
	.word	0xd4ab55fc          ! %f55
	.word	0x502686bb          ! %f56
	.word	0x5a200143          ! %f57
	.word	0x489d7f9b          ! %f58
	.word	0xcc46e9e3          ! %f59
	.word	0xde3a5d9b          ! %f60
	.word	0x181e13f2          ! %f61
	.word	0x9d8fbd5c          ! %f62
	.word	0x3d823d0a          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0xa28       ! %g1 (code pointer)
	.word	t0_data_in_shm_area ! %g2 (shared area pointer)
	.word	0xd75217ab          ! %g3 (loop index)
	.word	SYM(t0_subr3)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0x90941180          ! %o0
	.word	0x4e3d67c2          ! %o1
	.word	0x44c0a68e          ! %o2
	.word	0x3988f638          ! %o3
	.word	0x390ed056          ! %o4
	.word	0xc4c43718          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0x174695dd          ! %l0
	.word	0xa47cd468          ! %l1
	.word	0x57882158          ! %l2
	.word	0x7cdc0bc2          ! %l3
	.word	0x0e02e92b          ! %l4
	.word	0xc3061c5c          ! %l5
	.word	0x4f4fddbb          ! %l6
	.word	0xd4ff5b20          ! %l7
	.word	t0_data_in_area0    ! %i0 (area pointer)
	.word	t0_data_in_area0    ! %i1 (area pointer)
	.word	0xffffffee          ! %i2 (byte offset)
	.word	0xfffffffa          ! %i3 (halfword offset)
	.word	0xffffffe0          ! %i4 (word offset)
	.word	0x00000010          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0xc04a0780          ! %y
	.word	0x0000000b          ! %icc (nzvc)
	.word	0x0000029a          ! %fsr
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

KDATA_MODULE(t0_module_data_in_stack, 0x35c8c000)
.seg "data"
KGLOBAL(t0_data_in_mtbl_size)
KGLOBAL(t0_data_in_mtbl)
KGLOBAL(t0_data_in_stack)
t0_data_in_stack_start:
	.word	0x4a03697e
	.word	0x5faf35d4
	.word	0x044daf20
	.word	0x63ed7aba
	.word	0xd67420d6
	.word	0xe9ea9950
	.word	0x13bc894a
	.word	0x2cfc3362
	.word	0x378e9140
	.word	0x1e45e50f
	.word	0xa9048ded
	.word	0x5a718cf9
	.word	0x2dfb7a57
	.word	0x9382fd4f
	.word	0xc859f163
	.word	0xbfe1fe37
	.word	0x004d5a7c
	.word	0x32b9515a
	.word	0x0adbd103
	.word	0x2c1e9f99
	.word	0x5ae22ed9
	.word	0xd8a8353f
	.word	0x152c1cc9
	.word	0xfefcfe2c
	.word	0xd0d2afa3
	.word	0xb268a2c4
	.word	0x3b69f736
	.word	0x0b48c7ab
	.word	0x2ae28c9e
	.word	0xf1c5959a
	.word	0xc597af75
	.word	0x261ba3cc
	.word	0x8e996de6
	.word	0x964176d2
	.word	0x0c63b9bf
	.word	0xabc8ced6
	.word	0x9be4bceb
	.word	0x2d424b8f
	.word	0x23de49ff
	.word	0x1f4f4977
	.word	0xd71e79bd
	.word	0xad459afd
	.word	0x661b74b8
	.word	0xe51eb1d3
	.word	0x8055a089
	.word	0x38983f81
	.word	0x755bfa26
	.word	0x522819e0
	.word	0x8b78e362
	.word	0x631d9732
	.word	0x2a551fa3
	.word	0xcdf56ef0
	.word	0xffccbc45
	.word	0xff74c787
	.word	0xe9d23b4c
	.word	0x5f17468f
	.word	0x14221b57
	.word	0xe1820850
	.word	0x8370d5e4
	.word	0x7de2248e
	.word	0xe8d33570
	.word	0x0a4d29ea
	.word	0x9be286f7
	.word	0xa7718e5f
	.word	0x8ce036dc
	.word	0x6285caad
	.word	0xbe2def42
	.word	0xa3787fa3
	.word	0xd0ddde5f
	.word	0x4910efa9
	.word	0x231a7552
	.word	0x57cc1401
	.word	0x55044479
	.word	0x810af492
	.word	0x9288a86a
	.word	0x060e7a39
	.word	0xcfcc52ec
	.word	0x61e406f8
	.word	0x22336da9
	.word	0xe7ad8478
	.word	0x146eb07b
	.word	0xf3eca0ba
	.word	0x0e745b6c
	.word	0xdbc969ed
	.word	0x3c7f24f3
	.word	0xef0ab5bc
	.word	0x2e67e6f1
	.word	0xa6cd8d9b
	.word	0x220bb96e
	.word	0x67a788d7
	.word	0x2b74483c
	.word	0x95ce5e71
	.word	0x305718d6
	.word	0x92715c11
	.word	0x6700383d
	.word	0xfd5ca497
	.word	0x5cb9f4a8
	.word	0x198b700d
	.word	0x7654ed32
	.word	0x65afd00a
	.word	0xbfaf71fa
	.word	0x687a06c4
	.word	0x1678f94a
	.word	0x7a0e1c6a
	.word	0xf3cce2be
	.word	0x6ebf5d75
	.word	0x1687ef8b
	.word	0x48729e12
	.word	0xc5a54f48
	.word	0x2ef9d1da
	.word	0xc0e4f2f4
	.word	0xa5de8c69
	.word	0x509d940d
	.word	0x00a2a69c
	.word	0xf0e493e5
	.word	0xd4c45d77
	.word	0xd9be17ad
	.word	0x68901b07
	.word	0x156c9fbf
	.word	0xdad086bb
	.word	0x4edb5d32
	.word	0x7f54ca01
	.word	0x97cec6c7
	.word	0x633cf73a
	.word	0x863ef69a
	.word	0xdfc18438
	.word	0x530d3c4f
	.word	0x08199edb
	.word	0x358e9b92
	.word	0x5a6e199a
	.word	0x3906b517
	.word	0x68c596f2
	.word	0x1e476884
	.word	0x3080c60a
	.word	0xd2f967f0
	.word	0x6379c01a
	.word	0x6eff89d3
	.word	0x57333550
	.word	0xbfa2f4a2
	.word	0x047ee947
	.word	0xa300d765
	.word	0x6a0f5250
	.word	0x953d550f
	.word	0x84b6d41a
	.word	0xd1f32461
	.word	0x1acd557e
	.word	0xeef73c97
	.word	0xd3c0aa77
	.word	0xff754739
	.word	0x6e5fc691
	.word	0xde8889be
	.word	0x4d76b954
	.word	0x6af01dea
	.word	0x36516576
	.word	0x5169ae0c
	.word	0x180c84d3
	.word	0x82df1282
	.word	0x6f642e87
	.word	0x303f3034
	.word	0x4cf18993
	.word	0x187de3e2
	.word	0x719fedfc
	.word	0x7478ac78
	.word	0x1c0e3f43
	.word	0xe983b6c5
	.word	0xcdf216a1
	.word	0x2634f74b
	.word	0x04363077
t0_data_in_sp:
	.word	0xf98fb300
	.word	0xe967cfc9
	.word	0x11734637
	.word	0x8e033bbe
	.word	0x746bb10b
	.word	0xa9266e81
	.word	0x0fb38300
	.word	0x8cfb51f3
	.word	t0_data_in_area0
	.word	t0_data_in_area0
	.word	0x0000000d
	.word	0xfffffff8
	.word	0xfffffff4
	.word	0x00000010
	.word	t0_data_in_fp
	.word	0xa0733b7f
	.word	0x6bae6cf7
	.word	0xaa3680d0
	.word	0x41ae56de
	.word	0xe6bae8dd
	.word	0x8aff3e94
	.word	0x10e4b124
	.word	0x0e213458
	.word	0xa5c11b25
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
	.word   	0xca46d4f5	! [%fp - 0xc]
	.word   	0x36f3c528	! [%fp - 0x8]
	.word   	0x7b9149e1	! [%fp - 0x4]
.global t0_data_in_fp; t0_data_in_fp:
	.word	0x293387da
	.word	0x2c699cde
	.word	0x3a35c7e5
	.word	0x51845585
	.word	0x404e95b2
	.word	0xf8008164
	.word	0x3d2772eb
	.word	0x5d4f1b8d
	.word	0x72197488
	.word	0x9f6456d3
	.word	0xb8058961
	.word	0x76712602
	.word	0x4c374097
	.word	0xc14a8fd2
	.word	0xbb74505d
	.word	0x1b6e7870
	.word	0x73caa4e5
	.word	0x3895a0c5
	.word	0x3db5b875
	.word	0xa7aa3beb
	.word	0x15ccb0fc
	.word	0x0f3db572
	.word	0x46200c96
	.word	0x7971a756
t0_data_in_stacktop:
	.word	0
t0_data_in_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_in_area0, 0x05764000)
.seg "data"
t0_data_in_area0_start:
.skip 1344
t0_data_in_area0_begin:
	.word	0xfd0ed5df	! t0_data_in_area0-0x20
	.word	0x6f5c9ce6	! t0_data_in_area0-0x1c
	.word	0x73503a13	! t0_data_in_area0-0x18
	.word	0x0c96a7e2	! t0_data_in_area0-0x14
	.word	0xab2b3e3c	! t0_data_in_area0-0x10
	.word	0x98b20f99	! t0_data_in_area0-0xc
	.word	0x3cb00601	! t0_data_in_area0-0x8
	.word	0x75ee0dd5	! t0_data_in_area0-0x4
.global t0_data_in_area0; t0_data_in_area0:
	.word	0x8625f5dd	! t0_data_in_area0+0x0
	.word	0x0ea3b3d0	! t0_data_in_area0+0x4
	.word	0x5099c3c1	! t0_data_in_area0+0x8
	.word	0x36fd418c	! t0_data_in_area0+0xc
	.word	0x61b49464	! t0_data_in_area0+0x10
	.word	0xe50e8442	! t0_data_in_area0+0x14
	.word	0x42e860dd	! t0_data_in_area0+0x18
	.word	0xbb5fc4c2	! t0_data_in_area0+0x1c
t0_data_in_area0_end:
.skip 6784
t0_data_in_area0_stop:

KDATA_MODULE(t0_module_data_in_shm_area, 0x34790000)
.seg "data"
t0_data_in_shm_area_start:
t0_data_in_shm_area_begin:
.global t0_data_in_shm_area; t0_data_in_shm_area:
	.word	0x38495f37	! t0_data_in_shm_area+0x0 (t0)
	.word	0x42d02c02	! t0_data_in_shm_area+0x4 (t1)
	.word	0x6f757cfe	! t0_data_in_shm_area+0x8 (t0)
	.word	0x4debea59	! t0_data_in_shm_area+0xc (t1)
	.word	0x2d5bda18	! t0_data_in_shm_area+0x10 (t0)
	.word	0x5c262773	! t0_data_in_shm_area+0x14 (t1)
	.word	0x2b2d0412	! t0_data_in_shm_area+0x18 (t0)
	.word	0x439806e4	! t0_data_in_shm_area+0x1c (t1)
	.word	0xd85a16b8	! t0_data_in_shm_area+0x20 (t0)
	.word	0x25f0e6c8	! t0_data_in_shm_area+0x24 (t1)
	.word	0xe873b28b	! t0_data_in_shm_area+0x28 (t0)
	.word	0xfd85b220	! t0_data_in_shm_area+0x2c (t1)
	.word	0x09276dbf	! t0_data_in_shm_area+0x30 (t0)
	.word	0x42816f27	! t0_data_in_shm_area+0x34 (t1)
	.word	0x8b2b3cba	! t0_data_in_shm_area+0x38 (t0)
	.word	0x2238d9e0	! t0_data_in_shm_area+0x3c (t1)
	.word	0x1d29e2b9	! t0_data_in_shm_area+0x40 (t0 bload)
	.word	0x9d163750	! t0_data_in_shm_area+0x44
	.word	0x18801f45	! t0_data_in_shm_area+0x48
	.word	0x5d247aa1	! t0_data_in_shm_area+0x4c
	.word	0x32e1122f	! t0_data_in_shm_area+0x50
	.word	0x13247336	! t0_data_in_shm_area+0x54
	.word	0x3557600e	! t0_data_in_shm_area+0x58
	.word	0x547ef29b	! t0_data_in_shm_area+0x5c
	.word	0x8b34a225	! t0_data_in_shm_area+0x60
	.word	0xb8a3d18b	! t0_data_in_shm_area+0x64
	.word	0xe0d6f18a	! t0_data_in_shm_area+0x68
	.word	0xfd8a3cea	! t0_data_in_shm_area+0x6c
	.word	0xe58abff2	! t0_data_in_shm_area+0x70
	.word	0x484de929	! t0_data_in_shm_area+0x74
	.word	0x6af05486	! t0_data_in_shm_area+0x78
	.word	0xed073407	! t0_data_in_shm_area+0x7c
	.word	0xf2a8baae	! t0_data_in_shm_area+0x80 (t0 bstore)
	.word	0xf07e82d7	! t0_data_in_shm_area+0x84
	.word	0xfba359be	! t0_data_in_shm_area+0x88
	.word	0xb9887ba3	! t0_data_in_shm_area+0x8c
	.word	0x2bca17e1	! t0_data_in_shm_area+0x90
	.word	0xd29121ee	! t0_data_in_shm_area+0x94
	.word	0x05c4a7b6	! t0_data_in_shm_area+0x98
	.word	0x6da5f3e8	! t0_data_in_shm_area+0x9c
	.word	0xe6c7bf7d	! t0_data_in_shm_area+0xa0
	.word	0xe5fbf33f	! t0_data_in_shm_area+0xa4
	.word	0x1e4649c9	! t0_data_in_shm_area+0xa8
	.word	0xa0dd9d03	! t0_data_in_shm_area+0xac
	.word	0x2ff1730e	! t0_data_in_shm_area+0xb0
	.word	0x16f04634	! t0_data_in_shm_area+0xb4
	.word	0x18919c82	! t0_data_in_shm_area+0xb8
	.word	0x09a0aee6	! t0_data_in_shm_area+0xbc
	.word	0x4848c777	! t0_data_in_shm_area+0xc0 (t1 bload)
	.word	0xfbc1fb1e	! t0_data_in_shm_area+0xc4
	.word	0x7047afd3	! t0_data_in_shm_area+0xc8
	.word	0x3c3f5340	! t0_data_in_shm_area+0xcc
	.word	0xb4078377	! t0_data_in_shm_area+0xd0
	.word	0x9a12a971	! t0_data_in_shm_area+0xd4
	.word	0x64ddecfd	! t0_data_in_shm_area+0xd8
	.word	0x61fa9deb	! t0_data_in_shm_area+0xdc
	.word	0xe4785b20	! t0_data_in_shm_area+0xe0
	.word	0x0098d625	! t0_data_in_shm_area+0xe4
	.word	0xb5ba7467	! t0_data_in_shm_area+0xe8
	.word	0xc520083b	! t0_data_in_shm_area+0xec
	.word	0x70fc325c	! t0_data_in_shm_area+0xf0
	.word	0x9bf4a50f	! t0_data_in_shm_area+0xf4
	.word	0x816f614b	! t0_data_in_shm_area+0xf8
	.word	0x60e3fff1	! t0_data_in_shm_area+0xfc
	.word	0xaefa0f8b	! t0_data_in_shm_area+0x100 (t1 bstore)
	.word	0xd4dc23d8	! t0_data_in_shm_area+0x104
	.word	0x25c38fe7	! t0_data_in_shm_area+0x108
	.word	0xe3125969	! t0_data_in_shm_area+0x10c
	.word	0x7d1e24a6	! t0_data_in_shm_area+0x110
	.word	0xe158865c	! t0_data_in_shm_area+0x114
	.word	0xd068c53b	! t0_data_in_shm_area+0x118
	.word	0x9207560e	! t0_data_in_shm_area+0x11c
	.word	0x751dc6a6	! t0_data_in_shm_area+0x120
	.word	0xcdaa5434	! t0_data_in_shm_area+0x124
	.word	0xa5860f10	! t0_data_in_shm_area+0x128
	.word	0x038e1e0f	! t0_data_in_shm_area+0x12c
	.word	0xf3b8f726	! t0_data_in_shm_area+0x130
	.word	0x61ca5b91	! t0_data_in_shm_area+0x134
	.word	0x0539a03c	! t0_data_in_shm_area+0x138
	.word	0x67c0a152	! t0_data_in_shm_area+0x13c
t0_data_in_shm_area_end:
t0_data_in_shm_area_stop:

KDATA_MODULE(t0_module_data_exp_regs, 0x2dc46000)
.seg "data"
KGLOBAL(t0_data_exp_regs)
t0_data_exp_regs_start:
t0_data_exp_regs:
	.word	0x9fd5454e          ! %f0
	.word	0xe288b97e          ! %f1
	.word	0x68be6902          ! %f2
	.word	0x2f33ae1b          ! %f3
	.word	0x61df168c          ! %f4
	.word	0xb92c39db          ! %f5
	.word	0xc8b0b47a          ! %f6
	.word	0xdfc0b09f          ! %f7
	.word	0x471641a3          ! %f8
	.word	0x4c85f09d          ! %f9
	.word	0x8fb2a318          ! %f10
	.word	0xf4d674be          ! %f11
	.word	0xde55ed45          ! %f12
	.word	0xedf460d1          ! %f13
	.word	0x92079e27          ! %f14
	.word	0x1aa6ab67          ! %f15
	.word	0x673ab4c6          ! %f16
	.word	0xfd5de262          ! %f17
	.word	0xb232125a          ! %f18
	.word	0x76e2226b          ! %f19
	.word	0x0373abba          ! %f20
	.word	0x452486f2          ! %f21
	.word	0xf2d25610          ! %f22
	.word	0xc631e770          ! %f23
	.word	0xe9ad77dd          ! %f24
	.word	0x77b2f7ee          ! %f25
	.word	0x8d972fd9          ! %f26
	.word	0xb32b262b          ! %f27
	.word	0x74faa533          ! %f28
	.word	0x43b0a1dc          ! %f29
	.word	0x35d1c138          ! %f30
	.word	0x78e635cd          ! %f31
	.word	0x142a9870          ! %f32
	.word	0x85fcc0f6          ! %f33
	.word	0xde16d9aa          ! %f34
	.word	0xf8f489be          ! %f35
	.word	0x97b2c399          ! %f36
	.word	0xba7522fc          ! %f37
	.word	0xd673f5e6          ! %f38
	.word	0x7ff87988          ! %f39
	.word	0x30e400ea          ! %f40
	.word	0x1786b246          ! %f41
	.word	0xf45e6f67          ! %f42
	.word	0xf0dd1415          ! %f43
	.word	0xcc6037fa          ! %f44
	.word	0x39d31e18          ! %f45
	.word	0x82e7a027          ! %f46
	.word	0xd3db721d          ! %f47
	.word	0xda62b11c          ! %f48
	.word	0xfe183439          ! %f49
	.word	0xd128feac          ! %f50
	.word	0x675e3bd9          ! %f51
	.word	0x43afbb09          ! %f52
	.word	0x053abfc6          ! %f53
	.word	0x72877647          ! %f54
	.word	0xd4ab55fc          ! %f55
	.word	0x502686bb          ! %f56
	.word	0x5a200143          ! %f57
	.word	0x489d7f9b          ! %f58
	.word	0xcc46e9e3          ! %f59
	.word	0xde3a5d9b          ! %f60
	.word	0x181e13f2          ! %f61
	.word	0x9d8fbd5c          ! %f62
	.word	0x3d823d0a          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0xa28       ! %g1 (code pointer)
	.word	t0_data_exp_shm_area! %g2 (shared area pointer)
	.word	0xd75217ab          ! %g3 (loop index)
	.word	SYM(t0_subr3)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0x90941180          ! %o0
	.word	0x4e3d67c2          ! %o1
	.word	0x44c0a68e          ! %o2
	.word	0x3988f638          ! %o3
	.word	0x390ed056          ! %o4
	.word	0xc4c43718          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0x174695dd          ! %l0
	.word	0xa47cd468          ! %l1
	.word	0x57882158          ! %l2
	.word	0x7cdc0bc2          ! %l3
	.word	0x0e02e92b          ! %l4
	.word	0xc3061c5c          ! %l5
	.word	0x4f4fddbb          ! %l6
	.word	0xd4ff5b20          ! %l7
	.word	t0_data_exp_area0   ! %i0 (area pointer)
	.word	t0_data_exp_area0   ! %i1 (area pointer)
	.word	0xffffffee          ! %i2 (byte offset)
	.word	0xfffffffa          ! %i3 (halfword offset)
	.word	0xffffffe0          ! %i4 (word offset)
	.word	0x00000010          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0xc04a0780          ! %y
	.word	0x0000000b          ! %icc (nzvc)
	.word	0x0000029a          ! %fsr
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

KDATA_MODULE(t0_module_data_exp_stack, 0x3d362000)
.seg "data"
KGLOBAL(t0_data_exp_mtbl_size)
KGLOBAL(t0_data_exp_mtbl)
KGLOBAL(t0_data_exp_stack)
t0_data_exp_stack_start:
	.word	0x4a03697e
	.word	0x5faf35d4
	.word	0x044daf20
	.word	0x63ed7aba
	.word	0xd67420d6
	.word	0xe9ea9950
	.word	0x13bc894a
	.word	0x2cfc3362
	.word	0x378e9140
	.word	0x1e45e50f
	.word	0xa9048ded
	.word	0x5a718cf9
	.word	0x2dfb7a57
	.word	0x9382fd4f
	.word	0xc859f163
	.word	0xbfe1fe37
	.word	0x004d5a7c
	.word	0x32b9515a
	.word	0x0adbd103
	.word	0x2c1e9f99
	.word	0x5ae22ed9
	.word	0xd8a8353f
	.word	0x152c1cc9
	.word	0xfefcfe2c
	.word	0xd0d2afa3
	.word	0xb268a2c4
	.word	0x3b69f736
	.word	0x0b48c7ab
	.word	0x2ae28c9e
	.word	0xf1c5959a
	.word	0xc597af75
	.word	0x261ba3cc
	.word	0x8e996de6
	.word	0x964176d2
	.word	0x0c63b9bf
	.word	0xabc8ced6
	.word	0x9be4bceb
	.word	0x2d424b8f
	.word	0x23de49ff
	.word	0x1f4f4977
	.word	0xd71e79bd
	.word	0xad459afd
	.word	0x661b74b8
	.word	0xe51eb1d3
	.word	0x8055a089
	.word	0x38983f81
	.word	0x755bfa26
	.word	0x522819e0
	.word	0x8b78e362
	.word	0x631d9732
	.word	0x2a551fa3
	.word	0xcdf56ef0
	.word	0xffccbc45
	.word	0xff74c787
	.word	0xe9d23b4c
	.word	0x5f17468f
	.word	0x14221b57
	.word	0xe1820850
	.word	0x8370d5e4
	.word	0x7de2248e
	.word	0xe8d33570
	.word	0x0a4d29ea
	.word	0x9be286f7
	.word	0xa7718e5f
	.word	0x8ce036dc
	.word	0x6285caad
	.word	0xbe2def42
	.word	0xa3787fa3
	.word	0xd0ddde5f
	.word	0x4910efa9
	.word	0x231a7552
	.word	0x57cc1401
	.word	0x55044479
	.word	0x810af492
	.word	0x9288a86a
	.word	0x060e7a39
	.word	0xcfcc52ec
	.word	0x61e406f8
	.word	0x22336da9
	.word	0xe7ad8478
	.word	0x146eb07b
	.word	0xf3eca0ba
	.word	0x0e745b6c
	.word	0xdbc969ed
	.word	0x3c7f24f3
	.word	0xef0ab5bc
	.word	0x2e67e6f1
	.word	0xa6cd8d9b
	.word	0x220bb96e
	.word	0x67a788d7
	.word	0x2b74483c
	.word	0x95ce5e71
	.word	0x305718d6
	.word	0x92715c11
	.word	0x6700383d
	.word	0xfd5ca497
	.word	0x5cb9f4a8
	.word	0x198b700d
	.word	0x7654ed32
	.word	0x65afd00a
	.word	0xbfaf71fa
	.word	0x687a06c4
	.word	0x1678f94a
	.word	0x7a0e1c6a
	.word	0xf3cce2be
	.word	0x6ebf5d75
	.word	0x1687ef8b
	.word	0x48729e12
	.word	0xc5a54f48
	.word	0x2ef9d1da
	.word	0xc0e4f2f4
	.word	0xa5de8c69
	.word	0x509d940d
	.word	0x00a2a69c
	.word	0xf0e493e5
	.word	0xd4c45d77
	.word	0xd9be17ad
	.word	0x68901b07
	.word	0x156c9fbf
	.word	0xdad086bb
	.word	0x4edb5d32
	.word	0x7f54ca01
	.word	0x97cec6c7
	.word	0x633cf73a
	.word	0x863ef69a
	.word	0xdfc18438
	.word	0x530d3c4f
	.word	0x08199edb
	.word	0x358e9b92
	.word	0x5a6e199a
	.word	0x3906b517
	.word	0x68c596f2
	.word	0x1e476884
	.word	0x3080c60a
	.word	0xd2f967f0
	.word	0x6379c01a
	.word	0x6eff89d3
	.word	0x57333550
	.word	0xbfa2f4a2
	.word	0x047ee947
	.word	0xa300d765
	.word	0x6a0f5250
	.word	0x953d550f
	.word	0x84b6d41a
	.word	0xd1f32461
	.word	0x1acd557e
	.word	0xeef73c97
	.word	0xd3c0aa77
	.word	0xff754739
	.word	0x6e5fc691
	.word	0xde8889be
	.word	0x4d76b954
	.word	0x6af01dea
	.word	0x36516576
	.word	0x5169ae0c
	.word	0x180c84d3
	.word	0x82df1282
	.word	0x6f642e87
	.word	0x303f3034
	.word	0x4cf18993
	.word	0x187de3e2
	.word	0x719fedfc
	.word	0x7478ac78
	.word	0x1c0e3f43
	.word	0xe983b6c5
	.word	0xcdf216a1
	.word	0x2634f74b
	.word	0x04363077
t0_data_exp_sp:
	.word	0xf98fb300
	.word	0xe967cfc9
	.word	0x11734637
	.word	0x8e033bbe
	.word	0x746bb10b
	.word	0xa9266e81
	.word	0x0fb38300
	.word	0x8cfb51f3
	.word	t0_data_exp_area0
	.word	t0_data_exp_area0
	.word	0x0000000d
	.word	0xfffffff8
	.word	0xfffffff4
	.word	0x00000010
	.word	t0_data_exp_fp
	.word	0xa0733b7f
	.word	0x6bae6cf7
	.word	0xaa3680d0
	.word	0x41ae56de
	.word	0xe6bae8dd
	.word	0x8aff3e94
	.word	0x10e4b124
	.word	0x0e213458
	.word	0xa5c11b25
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
	.word   	0xca46d4f5	! [%fp - 0xc]
	.word   	0x36f3c528	! [%fp - 0x8]
	.word   	0x7b9149e1	! [%fp - 0x4]
t0_data_exp_fp:
	.word	0x293387da
	.word	0x2c699cde
	.word	0x3a35c7e5
	.word	0x51845585
	.word	0x404e95b2
	.word	0xf8008164
	.word	0x3d2772eb
	.word	0x5d4f1b8d
	.word	0x72197488
	.word	0x9f6456d3
	.word	0xb8058961
	.word	0x76712602
	.word	0x4c374097
	.word	0xc14a8fd2
	.word	0xbb74505d
	.word	0x1b6e7870
	.word	0x73caa4e5
	.word	0x3895a0c5
	.word	0x3db5b875
	.word	0xa7aa3beb
	.word	0x15ccb0fc
	.word	0x0f3db572
	.word	0x46200c96
	.word	0x7971a756
t0_data_exp_stacktop:
	.word	0
t0_data_exp_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_exp_area0, 0x371a0000)
.seg "data"
t0_data_exp_area0_start:
.skip 1344
t0_data_exp_area0_begin:
	.word	0xfd0ed5df	! t0_data_exp_area0-0x20
	.word	0x6f5c9ce6	! t0_data_exp_area0-0x1c
	.word	0x73503a13	! t0_data_exp_area0-0x18
	.word	0x0c96a7e2	! t0_data_exp_area0-0x14
	.word	0xab2b3e3c	! t0_data_exp_area0-0x10
	.word	0x98b20f99	! t0_data_exp_area0-0xc
	.word	0x3cb00601	! t0_data_exp_area0-0x8
	.word	0x75ee0dd5	! t0_data_exp_area0-0x4
.global t0_data_exp_area0; t0_data_exp_area0:
	.word	0x8625f5dd	! t0_data_exp_area0+0x0
	.word	0x0ea3b3d0	! t0_data_exp_area0+0x4
	.word	0x5099c3c1	! t0_data_exp_area0+0x8
	.word	0x36fd418c	! t0_data_exp_area0+0xc
	.word	0x61b49464	! t0_data_exp_area0+0x10
	.word	0xe50e8442	! t0_data_exp_area0+0x14
	.word	0x42e860dd	! t0_data_exp_area0+0x18
	.word	0xbb5fc4c2	! t0_data_exp_area0+0x1c
t0_data_exp_area0_end:
.skip 6784
t0_data_exp_area0_stop:

KDATA_MODULE(t0_module_data_exp_shm_area, 0x2813e000)
.seg "data"
t0_data_exp_shm_area_start:
t0_data_exp_shm_area_begin:
.global t0_data_exp_shm_area; t0_data_exp_shm_area:
	.word	0x38495f37	! t0_data_exp_shm_area+0x0 (t0)
	.word	0x42d02c02	! t0_data_exp_shm_area+0x4 (t1)
	.word	0x6f757cfe	! t0_data_exp_shm_area+0x8 (t0)
	.word	0x4debea59	! t0_data_exp_shm_area+0xc (t1)
	.word	0x2d5bda18	! t0_data_exp_shm_area+0x10 (t0)
	.word	0x5c262773	! t0_data_exp_shm_area+0x14 (t1)
	.word	0x2b2d0412	! t0_data_exp_shm_area+0x18 (t0)
	.word	0x439806e4	! t0_data_exp_shm_area+0x1c (t1)
	.word	0xd85a16b8	! t0_data_exp_shm_area+0x20 (t0)
	.word	0x25f0e6c8	! t0_data_exp_shm_area+0x24 (t1)
	.word	0xe873b28b	! t0_data_exp_shm_area+0x28 (t0)
	.word	0xfd85b220	! t0_data_exp_shm_area+0x2c (t1)
	.word	0x09276dbf	! t0_data_exp_shm_area+0x30 (t0)
	.word	0x42816f27	! t0_data_exp_shm_area+0x34 (t1)
	.word	0x8b2b3cba	! t0_data_exp_shm_area+0x38 (t0)
	.word	0x2238d9e0	! t0_data_exp_shm_area+0x3c (t1)
	.word	0x1d29e2b9	! t0_data_exp_shm_area+0x40 (t0 bload)
	.word	0x9d163750	! t0_data_exp_shm_area+0x44
	.word	0x18801f45	! t0_data_exp_shm_area+0x48
	.word	0x5d247aa1	! t0_data_exp_shm_area+0x4c
	.word	0x32e1122f	! t0_data_exp_shm_area+0x50
	.word	0x13247336	! t0_data_exp_shm_area+0x54
	.word	0x3557600e	! t0_data_exp_shm_area+0x58
	.word	0x547ef29b	! t0_data_exp_shm_area+0x5c
	.word	0x8b34a225	! t0_data_exp_shm_area+0x60
	.word	0xb8a3d18b	! t0_data_exp_shm_area+0x64
	.word	0xe0d6f18a	! t0_data_exp_shm_area+0x68
	.word	0xfd8a3cea	! t0_data_exp_shm_area+0x6c
	.word	0xe58abff2	! t0_data_exp_shm_area+0x70
	.word	0x484de929	! t0_data_exp_shm_area+0x74
	.word	0x6af05486	! t0_data_exp_shm_area+0x78
	.word	0xed073407	! t0_data_exp_shm_area+0x7c
	.word	0xf2a8baae	! t0_data_exp_shm_area+0x80 (t0 bstore)
	.word	0xf07e82d7	! t0_data_exp_shm_area+0x84
	.word	0xfba359be	! t0_data_exp_shm_area+0x88
	.word	0xb9887ba3	! t0_data_exp_shm_area+0x8c
	.word	0x2bca17e1	! t0_data_exp_shm_area+0x90
	.word	0xd29121ee	! t0_data_exp_shm_area+0x94
	.word	0x05c4a7b6	! t0_data_exp_shm_area+0x98
	.word	0x6da5f3e8	! t0_data_exp_shm_area+0x9c
	.word	0xe6c7bf7d	! t0_data_exp_shm_area+0xa0
	.word	0xe5fbf33f	! t0_data_exp_shm_area+0xa4
	.word	0x1e4649c9	! t0_data_exp_shm_area+0xa8
	.word	0xa0dd9d03	! t0_data_exp_shm_area+0xac
	.word	0x2ff1730e	! t0_data_exp_shm_area+0xb0
	.word	0x16f04634	! t0_data_exp_shm_area+0xb4
	.word	0x18919c82	! t0_data_exp_shm_area+0xb8
	.word	0x09a0aee6	! t0_data_exp_shm_area+0xbc
	.word	0x4848c777	! t0_data_exp_shm_area+0xc0 (t1 bload)
	.word	0xfbc1fb1e	! t0_data_exp_shm_area+0xc4
	.word	0x7047afd3	! t0_data_exp_shm_area+0xc8
	.word	0x3c3f5340	! t0_data_exp_shm_area+0xcc
	.word	0xb4078377	! t0_data_exp_shm_area+0xd0
	.word	0x9a12a971	! t0_data_exp_shm_area+0xd4
	.word	0x64ddecfd	! t0_data_exp_shm_area+0xd8
	.word	0x61fa9deb	! t0_data_exp_shm_area+0xdc
	.word	0xe4785b20	! t0_data_exp_shm_area+0xe0
	.word	0x0098d625	! t0_data_exp_shm_area+0xe4
	.word	0xb5ba7467	! t0_data_exp_shm_area+0xe8
	.word	0xc520083b	! t0_data_exp_shm_area+0xec
	.word	0x70fc325c	! t0_data_exp_shm_area+0xf0
	.word	0x9bf4a50f	! t0_data_exp_shm_area+0xf4
	.word	0x816f614b	! t0_data_exp_shm_area+0xf8
	.word	0x60e3fff1	! t0_data_exp_shm_area+0xfc
	.word	0xaefa0f8b	! t0_data_exp_shm_area+0x100 (t1 bstore)
	.word	0xd4dc23d8	! t0_data_exp_shm_area+0x104
	.word	0x25c38fe7	! t0_data_exp_shm_area+0x108
	.word	0xe3125969	! t0_data_exp_shm_area+0x10c
	.word	0x7d1e24a6	! t0_data_exp_shm_area+0x110
	.word	0xe158865c	! t0_data_exp_shm_area+0x114
	.word	0xd068c53b	! t0_data_exp_shm_area+0x118
	.word	0x9207560e	! t0_data_exp_shm_area+0x11c
	.word	0x751dc6a6	! t0_data_exp_shm_area+0x120
	.word	0xcdaa5434	! t0_data_exp_shm_area+0x124
	.word	0xa5860f10	! t0_data_exp_shm_area+0x128
	.word	0x038e1e0f	! t0_data_exp_shm_area+0x12c
	.word	0xf3b8f726	! t0_data_exp_shm_area+0x130
	.word	0x61ca5b91	! t0_data_exp_shm_area+0x134
	.word	0x0539a03c	! t0_data_exp_shm_area+0x138
	.word	0x67c0a152	! t0_data_exp_shm_area+0x13c
t0_data_exp_shm_area_end:
t0_data_exp_shm_area_stop:

!    kaos version   4.2
!    thread         1
!    icount         5000
!    targetid       NIAGARA:SIM
!    hostid         NIAGARA:5.8
!    areas          1
!    areasize       64
!    areaoffset     1344
!    ncache         0
!    emulate_ncache 1
!    pagesize       8192
!    invsize        0
!    codecount      5002
!    code           0df30000
!    entry          0df30000
!    fsr_exceptions 00000000
!    fsr_roundmode  00000004
!    fsr_mask       c0000fff
!    seed           d3d24dc35099
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

KTEXT_MODULE(t1_module_ktbl, 0x4df30000)
.seg "text"
	KGLOBAL(t1_ktbl)
t1_ktbl_page_begin:
.global t1_kref; t1_kref:
	.skip 0
t1_ktbl:
	.word	0x9de3bfa0	! t1_kref+0x0:   	save	%sp, -0x60, %sp
	.word	0x97ee8019	! t1_kref+0x4:   	restore	%i2, %i1, %o3
	.word	0xe4263ffc	! t1_kref+0x8:   	st	%l2, [%i0 - 4]
	.word	0xd47f0019	! t1_kref+0xc:   	swap	[%i4 + %i1], %o2
	.word	0x9da00530	! t1_kref+0x10:   	fsqrts	%f16, %f14
	.word	0xeeff1019	! t1_kref+0x14:   	swapa	[%i4 + %i1]0x80, %l7
	.word	0xada748bb	! t1_kref+0x18:   	fsubs	%f29, %f27, %f22
	.word	0x8d84c010	! t1_kref+0x1c:   	wr	%l3, %l0, %fprs
	.word	0x81ad0a50	! t1_kref+0x20:   	fcmpd	%fcc0, %f20, %f16
	.word	0xec166018	! t1_kref+0x24:   	lduh	[%i1 + 0x18], %l6
	.word	0xdac81018	! t1_kref+0x28:   	ldsba	[%g0 + %i0]0x80, %o5
	.word	0x9da0012e	! t1_kref+0x2c:   	fabss	%f14, %f14
	.word	0xa9a489cc	! t1_kref+0x30:   	fdivd	%f18, %f12, %f20
	.word	0xe028a01e	! t1_kref+0x34:   	stb	%l0, [%g2 + 0x1e]
	.word	0x91b40030	! t1_kref+0x38:   	edge8n	%l0, %l0, %o0
	.word	0xa8546f60	! t1_kref+0x3c:   	umul	%l1, 0xf60, %l4
	.word	0xada01a54	! t1_kref+0x40:   	fdtoi	%f20, %f22
	.word	0xb1a0054a	! t1_kref+0x44:   	fsqrtd	%f10, %f24
	.word	0xe0ff1018	! t1_kref+0x48:   	swapa	[%i4 + %i0]0x80, %l0
	.word	0x9bb44153	! t1_kref+0x4c:   	edge32l	%l1, %l3, %o5
	.word	0xc807bfe8	! t1_kref+0x50:   	ld	[%fp - 0x18], %g4
	.word	0xe91e2010	! t1_kref+0x54:   	ldd	[%i0 + 0x10], %f20
	.word	0x9e94a3cc	! t1_kref+0x58:   	orcc	%l2, 0x3cc, %o7
	.word	0x9fc10000	! t1_kref+0x5c:   	call	%g4
	.word	0x80742089	! t1_kref+0x60:   	udiv	%l0, 0x89, %g0
	.word	0x27800003	! t1_kref+0x64:   	fbul,a	_kref+0x70
	.word	0x98140010	! t1_kref+0x68:   	or	%l0, %l0, %o4
	.word	0x802d2f42	! t1_kref+0x6c:   	andn	%l4, 0xf42, %g0
	.word	0x32480002	! t1_kref+0x70:   	bne,a,pt	%icc, _kref+0x78
	.word	0xa9a5c9b8	! t1_kref+0x74:   	fdivs	%f23, %f24, %f20
	.word	0x99b44093	! t1_kref+0x78:   	edge16	%l1, %l3, %o4
	.word	0x989c4011	! t1_kref+0x7c:   	xorcc	%l1, %l1, %o4
	.word	0x91b6049c	! t1_kref+0x80:   	fcmple32	%f24, %f28, %o0
	.word	0x948c8013	! t1_kref+0x84:   	andcc	%l2, %l3, %o2
	.word	0x87802080	! t1_kref+0x88:   	mov	0x80, %asi
	.word	0xe93e4000	! t1_kref+0x8c:   	std	%f20, [%i1]
	.word	0xa5a0055c	! t1_kref+0x90:   	fsqrtd	%f28, %f18
	.word	0xaf3c8010	! t1_kref+0x94:   	sra	%l2, %l0, %l7
	.word	0x25480003	! t1_kref+0x98:   	fblg,a,pt	%fcc0, _kref+0xa4
	.word	0xa0e4b550	! t1_kref+0x9c:   	subccc	%l2, -0xab0, %l0
	.word	0xb5a0055a	! t1_kref+0xa0:   	fsqrtd	%f26, %f26
	.word	0x99a70d35	! t1_kref+0xa4:   	fsmuld	%f28, %f21, %f12
	.word	0xe9be5a5d	! t1_kref+0xa8:   	stda	%f20, [%i1 + %i5]0xd2
	.word	0xa52d0013	! t1_kref+0xac:   	sll	%l4, %l3, %l2
	.word	0xada0052b	! t1_kref+0xb0:   	fsqrts	%f11, %f22
	.word	0x9f1ce300	! t1_kref+0xb4:   	tsubcctv	%l3, 0x300, %o7
	.word	0xe93e3fe0	! t1_kref+0xb8:   	std	%f20, [%i0 - 0x20]
	.word	0xde56c019	! t1_kref+0xbc:   	ldsh	[%i3 + %i1], %o7
	.word	0xe51fbcd0	! t1_kref+0xc0:   	ldd	[%fp - 0x330], %f18
	.word	0x9e348013	! t1_kref+0xc4:   	orn	%l2, %l3, %o7
	.word	0xe210a004	! t1_kref+0xc8:   	lduh	[%g2 + 4], %l1
	.word	0xe4564000	! t1_kref+0xcc:   	ldsh	[%i1], %l2
	.word	0xacf4c014	! t1_kref+0xd0:   	udivcc	%l3, %l4, %l6
	.word	0x9de3bfa0	! t1_kref+0xd4:   	save	%sp, -0x60, %sp
	.word	0xbabe218c	! t1_kref+0xd8:   	xnorcc	%i0, 0x18c, %i5
	.word	0xa9eea4c2	! t1_kref+0xdc:   	restore	%i2, 0x4c2, %l4
	.word	0x31480007	! t1_kref+0xe0:   	fba,a,pt	%fcc0, _kref+0xfc
	.word	0xb5b4090c	! t1_kref+0xe4:   	faligndata	%f16, %f12, %f26
	.word	0xb3a408b6	! t1_kref+0xe8:   	fsubs	%f16, %f22, %f25
	.word	0xa5a01919	! t1_kref+0xec:   	fitod	%f25, %f18
	.word	0xe62e8019	! t1_kref+0xf0:   	stb	%l3, [%i2 + %i1]
	.word	0xa7350014	! t1_kref+0xf4:   	srl	%l4, %l4, %l3
	.word	0xb6103ffc	! t1_kref+0xf8:   	mov	0xfffffffc, %i3
	.word	0xa23c0010	! t1_kref+0xfc:   	xnor	%l0, %l0, %l1
	.word	0x94fd0010	! t1_kref+0x100:   	sdivcc	%l4, %l0, %o2
	.word	0xaa9c685e	! t1_kref+0x104:   	xorcc	%l1, 0x85e, %l5
	.word	0x808d0011	! t1_kref+0x108:   	btst	%l1, %l4
	.word	0xb1a01032	! t1_kref+0x10c:   	fstox	%f18, %f24
	.word	0xb1a709d6	! t1_kref+0x110:   	fdivd	%f28, %f22, %f24
	.word	0xecd6d018	! t1_kref+0x114:   	ldsha	[%i3 + %i0]0x80, %l6
	.word	0x80648014	! t1_kref+0x118:   	subc	%l2, %l4, %g0
	.word	0x29800002	! t1_kref+0x11c:   	fbl,a	_kref+0x124
	.word	0xe6a8a035	! t1_kref+0x120:   	stba	%l3, [%g2 + 0x35]%asi
	.word	0xada0052b	! t1_kref+0x124:   	fsqrts	%f11, %f22
	.word	0xf007bfe0	! t1_kref+0x128:   	ld	[%fp - 0x20], %i0
	.word	0x9da608bb	! t1_kref+0x12c:   	fsubs	%f24, %f27, %f14
	.word	0xaad40012	! t1_kref+0x130:   	umulcc	%l0, %l2, %l5
	.word	0xb3a00133	! t1_kref+0x134:   	fabss	%f19, %f25
	.word	0x8143c000	! t1_kref+0x138:   	stbar
	.word	0xee680019	! t1_kref+0x13c:   	ldstub	[%g0 + %i1], %l7
	.word	0x81ae8ad6	! t1_kref+0x140:   	fcmped	%fcc0, %f26, %f22
	.word	0xf1be1852	! t1_kref+0x144:   	stda	%f24, [%i0 + %l2]0xc2
	.word	0x81ac4ab1	! t1_kref+0x148:   	fcmpes	%fcc0, %f17, %f17
	.word	0x9e8c8014	! t1_kref+0x14c:   	andcc	%l2, %l4, %o7
	.word	0xe4f75019	! t1_kref+0x150:   	stxa	%l2, [%i5 + %i1]0x80
	.word	0xeb68a04f	! t1_kref+0x154:   	prefetch	%g2 + 0x4f, 21
	.word	0x3b800005	! t1_kref+0x158:   	fble,a	_kref+0x16c
	.word	0xad2c2002	! t1_kref+0x15c:   	sll	%l0, 0x2, %l6
	.word	0x95a01114	! t1_kref+0x160:   	fxtod	%f20, %f10
	.word	0xa2c44010	! t1_kref+0x164:   	addccc	%l1, %l0, %l1
	.word	0xa3400000	! t1_kref+0x168:   	mov	%y, %l1
	.word	0xf51e2010	! t1_kref+0x16c:   	ldd	[%i0 + 0x10], %f26
	.word	0x8143c000	! t1_kref+0x170:   	stbar
	.word	0xb5b00f33	! t1_kref+0x174:   	fsrc2s	%f19, %f26
	.word	0xbdb60d40	! t1_kref+0x178:   	fnot1	%f24, %f30
	.word	0x8143c000	! t1_kref+0x17c:   	stbar
	.word	0xd9be5891	! t1_kref+0x180:   	stda	%f12, [%i1 + %l1]0xc4
	.word	0xac4525fa	! t1_kref+0x184:   	addc	%l4, 0x5fa, %l6
	.word	0xae5c0011	! t1_kref+0x188:   	smul	%l0, %l1, %l7
	.word	0xb9b40d40	! t1_kref+0x18c:   	fnot1	%f16, %f28
	.word	0xb3a0052f	! t1_kref+0x190:   	fsqrts	%f15, %f25
	.word	0x9de3bfa0	! t1_kref+0x194:   	save	%sp, -0x60, %sp
	.word	0xa5e8001a	! t1_kref+0x198:   	restore	%g0, %i2, %l2
	.word	0x37800006	! t1_kref+0x19c:   	fbge,a	_kref+0x1b4
	.word	0x99b00f3b	! t1_kref+0x1a0:   	fsrc2s	%f27, %f12
	.word	0xe626401c	! t1_kref+0x1a4:   	st	%l3, [%i1 + %i4]
	.word	0xfb862004	! t1_kref+0x1a8:   	lda	[%i0 + 4]%asi, %f29
	.word	0x9fb6048a	! t1_kref+0x1ac:   	fcmple32	%f24, %f10, %o7
	.word	0x81aa8ad4	! t1_kref+0x1b0:   	fcmped	%fcc0, %f10, %f20
	.word	0xbba54932	! t1_kref+0x1b4:   	fmuls	%f21, %f18, %f29
	.word	0xa83c8011	! t1_kref+0x1b8:   	xnor	%l2, %l1, %l4
	.word	0x925468f7	! t1_kref+0x1bc:   	umul	%l1, 0x8f7, %o1
	.word	0x3b800006	! t1_kref+0x1c0:   	fble,a	_kref+0x1d8
	.word	0x96f40011	! t1_kref+0x1c4:   	udivcc	%l0, %l1, %o3
	.word	0xe42e6006	! t1_kref+0x1c8:   	stb	%l2, [%i1 + 6]
	.word	0xe2b0a03c	! t1_kref+0x1cc:   	stha	%l1, [%g2 + 0x3c]%asi
	.word	0xa1a0055a	! t1_kref+0x1d0:   	fsqrtd	%f26, %f16
	.word	0xada8802e	! t1_kref+0x1d4:   	fmovslg	%fcc0, %f14, %f22
	.word	0xbba3c8b8	! t1_kref+0x1d8:   	fsubs	%f15, %f24, %f29
	.word	0x81ad8ad6	! t1_kref+0x1dc:   	fcmped	%fcc0, %f22, %f22
	.word	0xb1b00776	! t1_kref+0x1e0:   	fpack16	%f22, %f24
	.word	0x9ba0012f	! t1_kref+0x1e4:   	fabss	%f15, %f13
	.word	0xe5e65014	! t1_kref+0x1e8:   	casa	[%i1]0x80, %l4, %l2
	.word	0x96fcbde0	! t1_kref+0x1ec:   	sdivcc	%l2, -0x220, %o3
	.word	0x99a488d6	! t1_kref+0x1f0:   	fsubd	%f18, %f22, %f12
	.word	0xa68ca259	! t1_kref+0x1f4:   	andcc	%l2, 0x259, %l3
	.word	0x9e544014	! t1_kref+0x1f8:   	umul	%l1, %l4, %o7
	.word	0x81850000	! t1_kref+0x1fc:   	wr	%l4, %g0, %y
	.word	0x8143c000	! t1_kref+0x200:   	stbar
	.word	0x9234c011	! t1_kref+0x204:   	orn	%l3, %l1, %o1
	.word	0xa11c7da2	! t1_kref+0x208:   	tsubcctv	%l1, -0x25e, %l0
	.word	0xb9a00552	! t1_kref+0x20c:   	fsqrtd	%f18, %f28
	.word	0x9634bca4	! t1_kref+0x210:   	orn	%l2, -0x35c, %o3
	.word	0x30800008	! t1_kref+0x214:   	ba,a	_kref+0x234
	.word	0xada00537	! t1_kref+0x218:   	fsqrts	%f23, %f22
	.word	0xda680018	! t1_kref+0x21c:   	ldstub	[%g0 + %i0], %o5
	.word	0xfb6e7fe8	! t1_kref+0x220:   	prefetch	%i1 - 0x18, 29
	.word	0xa6750014	! t1_kref+0x224:   	udiv	%l4, %l4, %l3
	.word	0x81dd30bf	! t1_kref+0x228:   	flush	%l4 - 0xf41
	.word	0xa3a3c932	! t1_kref+0x22c:   	fmuls	%f15, %f18, %f17
	.word	0xa1a00139	! t1_kref+0x230:   	fabss	%f25, %f16
	.word	0x99a01a54	! t1_kref+0x234:   	fdtoi	%f20, %f12
	.word	0x81b400f2	! t1_kref+0x238:   	edge16ln	%l0, %l2, %g0
	.word	0xa9a0055c	! t1_kref+0x23c:   	fsqrtd	%f28, %f20
	.word	0xe4700018	! t1_kref+0x240:   	stx	%l2, [%g0 + %i0]
	.word	0x81dd0019	! t1_kref+0x244:   	flush	%l4 + %i1
	.word	0x97b30450	! t1_kref+0x248:   	fcmpne16	%f12, %f16, %o3
	.word	0xac5c20b9	! t1_kref+0x24c:   	smul	%l0, 0xb9, %l6
	.word	0xe4a0a02c	! t1_kref+0x250:   	sta	%l2, [%g2 + 0x2c]%asi
	.word	0xe0b0a03c	! t1_kref+0x254:   	stha	%l0, [%g2 + 0x3c]%asi
	.word	0x99b3873a	! t1_kref+0x258:   	fmuld8ulx16	%f14, %f26, %f12
	.word	0xaaacc014	! t1_kref+0x25c:   	andncc	%l3, %l4, %l5
	.word	0xbba000b2	! t1_kref+0x260:   	fnegs	%f18, %f29
	.word	0xa0fc8012	! t1_kref+0x264:   	sdivcc	%l2, %l2, %l0
	.word	0xa07d38db	! t1_kref+0x268:   	sdiv	%l4, -0x725, %l0
	.word	0x001fffff	! t1_kref+0x26c:   	illtrap	0x1fffff
	.word	0xa0852ac4	! t1_kref+0x270:   	addcc	%l4, 0xac4, %l0
	.word	0x99b50a96	! t1_kref+0x274:   	fpsub16	%f20, %f22, %f12
	.word	0xddbe6008	! t1_kref+0x278:   	stda	%f14, [%i1 + 8]%asi
	.word	0x81dec01b	! t1_kref+0x27c:   	flush	%i3 + %i3
	.word	0xafb50092	! t1_kref+0x280:   	edge16	%l4, %l2, %l7
	.word	0x81ac0a4e	! t1_kref+0x284:   	fcmpd	%fcc0, %f16, %f14
	.word	0x9e750012	! t1_kref+0x288:   	udiv	%l4, %l2, %o7
	.word	0xe04e8019	! t1_kref+0x28c:   	ldsb	[%i2 + %i1], %l0
	.word	0x81abca30	! t1_kref+0x290:   	fcmps	%fcc0, %f15, %f16
	.word	0xab350012	! t1_kref+0x294:   	srl	%l4, %l2, %l5
	.word	0xb9b60ed0	! t1_kref+0x298:   	fornot2	%f24, %f16, %f28
	.word	0x81848000	! t1_kref+0x29c:   	wr	%l2, %g0, %y
	.word	0xacf50011	! t1_kref+0x2a0:   	udivcc	%l4, %l1, %l6
	.word	0xa2d47877	! t1_kref+0x2a4:   	umulcc	%l1, -0x789, %l1
	.word	0xc5e8a08a	! t1_kref+0x2a8:   	prefetcha	%g2 + 0x8a, 2
	.word	0xa9b4c011	! t1_kref+0x2ac:   	edge8	%l3, %l1, %l4
	.word	0xa9b50012	! t1_kref+0x2b0:   	edge8	%l4, %l2, %l4
	.word	0xbda01893	! t1_kref+0x2b4:   	fitos	%f19, %f30
	.word	0xa5b5c673	! t1_kref+0x2b8:   	fmul8x16au	%f23, %f19, %f18
	.word	0x37480002	! t1_kref+0x2bc:   	fbge,a,pt	%fcc0, _kref+0x2c4
	.word	0xb1a0054e	! t1_kref+0x2c0:   	fsqrtd	%f14, %f24
	.word	0x99a408d8	! t1_kref+0x2c4:   	fsubd	%f16, %f24, %f12
	.word	0x81ae4a30	! t1_kref+0x2c8:   	fcmps	%fcc0, %f25, %f16
	.word	0xe5e65010	! t1_kref+0x2cc:   	casa	[%i1]0x80, %l0, %l2
	.word	0x9a748013	! t1_kref+0x2d0:   	udiv	%l2, %l3, %o5
	.word	0xb5b00f2d	! t1_kref+0x2d4:   	fsrc2s	%f13, %f26
	.word	0xb9a00550	! t1_kref+0x2d8:   	fsqrtd	%f16, %f28
	.word	0xa43d0010	! t1_kref+0x2dc:   	xnor	%l4, %l0, %l2
	.word	0xe8a8a03d	! t1_kref+0x2e0:   	stba	%l4, [%g2 + 0x3d]%asi
	.word	0xa1a288ce	! t1_kref+0x2e4:   	fsubd	%f10, %f14, %f16
	.word	0x93344011	! t1_kref+0x2e8:   	srl	%l1, %l1, %o1
	.word	0xa2e46e3c	! t1_kref+0x2ec:   	subccc	%l1, 0xe3c, %l1
	.word	0xa82cc011	! t1_kref+0x2f0:   	andn	%l3, %l1, %l4
	.word	0xc368a0c3	! t1_kref+0x2f4:   	prefetch	%g2 + 0xc3, 1
	.word	0xfd180019	! t1_kref+0x2f8:   	ldd	[%g0 + %i1], %f30
	.word	0xa134c012	! t1_kref+0x2fc:   	srl	%l3, %l2, %l0
	.word	0xa9a508dc	! t1_kref+0x300:   	fsubd	%f20, %f28, %f20
	.word	0xae147bf6	! t1_kref+0x304:   	or	%l1, -0x40a, %l7
	.word	0xb1b586ce	! t1_kref+0x308:   	fmul8sux16	%f22, %f14, %f24
	.word	0xa45c4014	! t1_kref+0x30c:   	smul	%l1, %l4, %l2
	.word	0x9fc10000	! t1_kref+0x310:   	call	%g4
	.word	0x95b5841e	! t1_kref+0x314:   	fcmple16	%f22, %f30, %o2
	.word	0xae24642a	! t1_kref+0x318:   	sub	%l1, 0x42a, %l7
	.word	0x9f1cbd7d	! t1_kref+0x31c:   	tsubcctv	%l2, -0x283, %o7
	.word	0x81ad0a36	! t1_kref+0x320:   	fcmps	%fcc0, %f20, %f22
	.word	0xa9a0013e	! t1_kref+0x324:   	fabss	%f30, %f20
	.word	0xf9a0a02c	! t1_kref+0x328:   	sta	%f28, [%g2 + 0x2c]%asi
	.word	0xe4087dcc	! t1_kref+0x32c:   	ldub	[%g1 - 0x234], %l2
	.word	0xa41ca00c	! t1_kref+0x330:   	xor	%l2, 0xc, %l2
	.word	0xe4287dcc	! t1_kref+0x334:   	stb	%l2, [%g1 - 0x234]
	.word	0x81d87dcc	! t1_kref+0x338:   	flush	%g1 - 0x234
	.word	0x81ad0a3a	! t1_kref+0x33c:   	fcmps	%fcc0, %f20, %f26
	.word	0xe836601e	! t1_kref+0x340:   	sth	%l4, [%i1 + 0x1e]
	.word	0xf43e2000	! t1_kref+0x344:   	std	%i2, [%i0]
	.word	0xd01e6010	! t1_kref+0x348:   	ldd	[%i1 + 0x10], %o0
	.word	0xa3a00132	! t1_kref+0x34c:   	fabss	%f18, %f17
	.word	0xd93e3ff0	! t1_kref+0x350:   	std	%f12, [%i0 - 0x10]
	.word	0x95b48456	! t1_kref+0x354:   	fcmpne16	%f18, %f22, %o2
	.word	0xd3f61014	! t1_kref+0x358:   	casxa	[%i0]0x80, %l4, %o1
	.word	0xee50a01e	! t1_kref+0x35c:   	ldsh	[%g2 + 0x1e], %l7
	.word	0xe9be5891	! t1_kref+0x360:   	stda	%f20, [%i1 + %l1]0xc4
2:	.word	0xe8263ff0	! t1_kref+0x364:   	st	%l4, [%i0 - 0x10]
	.word	0x943c6380	! t1_kref+0x368:   	xnor	%l1, 0x380, %o2
	.word	0xa1a000dc	! t1_kref+0x36c:   	fnegd	%f28, %f16
	.word	0xe27e3ff4	! t1_kref+0x370:   	swap	[%i0 - 0xc], %l1
	.word	0xea68a024	! t1_kref+0x374:   	ldstub	[%g2 + 0x24], %l5
	.word	0xaba00538	! t1_kref+0x378:   	fsqrts	%f24, %f21
	.word	0xa3a00038	! t1_kref+0x37c:   	fmovs	%f24, %f17
	.word	0x9e9c4013	! t1_kref+0x380:   	xorcc	%l1, %l3, %o7
	.word	0xe2a0a01c	! t1_kref+0x384:   	sta	%l1, [%g2 + 0x1c]%asi
	.word	0xa644bf01	! t1_kref+0x388:   	addc	%l2, -0xff, %l3
	.word	0xae340010	! t1_kref+0x38c:   	orn	%l0, %l0, %l7
	.word	0x989cb245	! t1_kref+0x390:   	xorcc	%l2, -0xdbb, %o4
	.word	0x81ac8ad6	! t1_kref+0x394:   	fcmped	%fcc0, %f18, %f22
	.word	0xaa0c3b95	! t1_kref+0x398:   	and	%l0, -0x46b, %l5
	.word	0xa60c0012	! t1_kref+0x39c:   	and	%l0, %l2, %l3
	.word	0x9b400000	! t1_kref+0x3a0:   	mov	%y, %o5
	.word	0x99400000	! t1_kref+0x3a4:   	mov	%y, %o4
	.word	0x9fc00004	! t1_kref+0x3a8:   	call	%g0 + %g4
	.word	0xc768a08f	! t1_kref+0x3ac:   	prefetch	%g2 + 0x8f, 3
	.word	0x9de3bfa0	! t1_kref+0x3b0:   	save	%sp, -0x60, %sp
	.word	0xa7e83261	! t1_kref+0x3b4:   	restore	%g0, -0xd9f, %l3
	.word	0x908d0013	! t1_kref+0x3b8:   	andcc	%l4, %l3, %o0
	.word	0x81ab8a5a	! t1_kref+0x3bc:   	fcmpd	%fcc0, %f14, %f26
	.word	0x81dda351	! t1_kref+0x3c0:   	flush	%l6 + 0x351
	.word	0xa1400000	! t1_kref+0x3c4:   	mov	%y, %l0
	.word	0xada00558	! t1_kref+0x3c8:   	fsqrtd	%f24, %f22
	.word	0x99a748bd	! t1_kref+0x3cc:   	fsubs	%f29, %f29, %f12
	.word	0xf5a66018	! t1_kref+0x3d0:   	sta	%f26, [%i1 + 0x18]%asi
	.word	0x878020f0	! t1_kref+0x3d4:   	mov	0xf0, %asi
	.word	0x9ba548b2	! t1_kref+0x3d8:   	fsubs	%f21, %f18, %f13
	.word	0xe3b8a100	! t1_kref+0x3dc:   	stda	%f48, [%g2 + 0x100]%asi
	.word	0xabb00f2f	! t1_kref+0x3e0:   	fsrc2s	%f15, %f21
	.word	0x9e844012	! t1_kref+0x3e4:   	addcc	%l1, %l2, %o7
	.word	0x2f480005	! t1_kref+0x3e8:   	fbu,a,pt	%fcc0, _kref+0x3fc
	.word	0x99a40956	! t1_kref+0x3ec:   	fmuld	%f16, %f22, %f12
	.word	0x2f480007	! t1_kref+0x3f0:   	fbu,a,pt	%fcc0, _kref+0x40c
	.word	0xa13ca01b	! t1_kref+0x3f4:   	sra	%l2, 0x1b, %l0
	.word	0x943c8012	! t1_kref+0x3f8:   	xnor	%l2, %l2, %o2
	.word	0xeb070018	! t1_kref+0x3fc:   	ld	[%i4 + %i0], %f21
	.word	0xed070019	! t1_kref+0x400:   	ld	[%i4 + %i1], %f22
	.word	0xae34bce5	! t1_kref+0x404:   	orn	%l2, -0x31b, %l7
	.word	0x802ce485	! t1_kref+0x408:   	andn	%l3, 0x485, %g0
	.word	0x989d0013	! t1_kref+0x40c:   	xorcc	%l4, %l3, %o4
	.word	0xe120a034	! t1_kref+0x410:   	st	%f16, [%g2 + 0x34]
	.word	0x9f352016	! t1_kref+0x414:   	srl	%l4, 0x16, %o7
	.word	0xa624c013	! t1_kref+0x418:   	sub	%l3, %l3, %l3
	.word	0x8143c000	! t1_kref+0x41c:   	stbar
	.word	0xec1e7fe8	! t1_kref+0x420:   	ldd	[%i1 - 0x18], %l6
	.word	0xa1a689d0	! t1_kref+0x424:   	fdivd	%f26, %f16, %f16
	.word	0xe826200c	! t1_kref+0x428:   	st	%l4, [%i0 + 0xc]
	.word	0x973ca010	! t1_kref+0x42c:   	sra	%l2, 0x10, %o3
	.word	0xf1be1893	! t1_kref+0x430:   	stda	%f24, [%i0 + %l3]0xc4
	.word	0xa45c0014	! t1_kref+0x434:   	smul	%l0, %l4, %l2
	.word	0xae250013	! t1_kref+0x438:   	sub	%l4, %l3, %l7
	.word	0x92344011	! t1_kref+0x43c:   	orn	%l1, %l1, %o1
	.word	0x27800007	! t1_kref+0x440:   	fbul,a	_kref+0x45c
	.word	0xab248014	! t1_kref+0x444:   	mulscc	%l2, %l4, %l5
	.word	0xfd1fbf60	! t1_kref+0x448:   	ldd	[%fp - 0xa0], %f30
	.word	0xacd44012	! t1_kref+0x44c:   	umulcc	%l1, %l2, %l6
	.word	0xb3a00536	! t1_kref+0x450:   	fsqrts	%f22, %f25
	.word	0xa3a000b0	! t1_kref+0x454:   	fnegs	%f16, %f17
	.word	0x9fb4c280	! t1_kref+0x458:   	array32	%l3, %g0, %o7
	.word	0xa8c4b7bd	! t1_kref+0x45c:   	addccc	%l2, -0x843, %l4
	.word	0xd640a034	! t1_kref+0x460:   	ldsw	[%g2 + 0x34], %o3
	.word	0xee0e7ff1	! t1_kref+0x464:   	ldub	[%i1 - 0xf], %l7
	.word	0xa1a58858	! t1_kref+0x468:   	faddd	%f22, %f24, %f16
	.word	0xe3b8a100	! t1_kref+0x46c:   	stda	%f48, [%g2 + 0x100]%asi
	.word	0xafb64a35	! t1_kref+0x470:   	fpadd16s	%f25, %f21, %f23
	.word	0x86102021	! t1_kref+0x474:   	mov	0x21, %g3
	.word	0x86a0e001	! t1_kref+0x478:   	subcc	%g3, 1, %g3
	.word	0x22800001	! t1_kref+0x47c:   	be,a	_kref+0x480
	.word	0xa5a00556	! t1_kref+0x480:   	fsqrtd	%f22, %f18
	.word	0x3b800002	! t1_kref+0x484:   	fble,a	_kref+0x48c
	.word	0x9da0052c	! t1_kref+0x488:   	fsqrts	%f12, %f14
	.word	0xafa0012b	! t1_kref+0x48c:   	fabss	%f11, %f23
	.word	0xf99e1a1c	! t1_kref+0x490:   	ldda	[%i0 + %i4]0xd0, %f28
	.word	0xa53d200a	! t1_kref+0x494:   	sra	%l4, 0xa, %l2
	.word	0xa3400000	! t1_kref+0x498:   	mov	%y, %l1
	.word	0x99b400b0	! t1_kref+0x49c:   	edge16n	%l0, %l0, %o4
	.word	0x99b28d40	! t1_kref+0x4a0:   	fnot1	%f10, %f12
	.word	0xe4266008	! t1_kref+0x4a4:   	st	%l2, [%i1 + 8]
	.word	0xea7e2014	! t1_kref+0x4a8:   	swap	[%i0 + 0x14], %l5
	.word	0xa5a50d33	! t1_kref+0x4ac:   	fsmuld	%f20, %f19, %f18
	.word	0xe82e601f	! t1_kref+0x4b0:   	stb	%l4, [%i1 + 0x1f]
	.word	0x9ee4c013	! t1_kref+0x4b4:   	subccc	%l3, %l3, %o7
	.word	0xec6e4000	! t1_kref+0x4b8:   	ldstub	[%i1], %l6
	.word	0xac9cfb38	! t1_kref+0x4bc:   	xorcc	%l3, -0x4c8, %l6
	.word	0xda7f0018	! t1_kref+0x4c0:   	swap	[%i4 + %i0], %o5
	.word	0xaba00533	! t1_kref+0x4c4:   	fsqrts	%f19, %f21
	.word	0xa33c201f	! t1_kref+0x4c8:   	sra	%l0, 0x1f, %l1
	.word	0x8143e024	! t1_kref+0x4cc:   	membar	0x24
	.word	0xf1270018	! t1_kref+0x4d0:   	st	%f24, [%i4 + %i0]
	.word	0x81ac0a4e	! t1_kref+0x4d4:   	fcmpd	%fcc0, %f16, %f14
	.word	0xa3a0188f	! t1_kref+0x4d8:   	fitos	%f15, %f17
	.word	0xa7a44933	! t1_kref+0x4dc:   	fmuls	%f17, %f19, %f19
	.word	0x2c480002	! t1_kref+0x4e0:   	bneg,a,pt	%icc, _kref+0x4e8
	.word	0xaba6c8bb	! t1_kref+0x4e4:   	fsubs	%f27, %f27, %f21
	.word	0x36800005	! t1_kref+0x4e8:   	bge,a	_kref+0x4fc
	.word	0xa4bc7fca	! t1_kref+0x4ec:   	xnorcc	%l1, -0x36, %l2
	.word	0xa1a0110c	! t1_kref+0x4f0:   	fxtod	%f12, %f16
	.word	0xa9b30e80	! t1_kref+0x4f4:   	fsrc1	%f12, %f20
	.word	0xf207bfe0	! t1_kref+0x4f8:   	ld	[%fp - 0x20], %i1
	.word	0x9fb38e6b	! t1_kref+0x4fc:   	fxnors	%f14, %f11, %f15
	.word	0xe0264000	! t1_kref+0x500:   	st	%l0, [%i1]
	.word	0x25480007	! t1_kref+0x504:   	fblg,a,pt	%fcc0, _kref+0x520
	.word	0xed1fbdd8	! t1_kref+0x508:   	ldd	[%fp - 0x228], %f22
	.word	0xe1260000	! t1_kref+0x50c:   	st	%f16, [%i0]
	.word	0xb5b00c00	! t1_kref+0x510:   	fzero	%f26
	.word	0xafb00f2b	! t1_kref+0x514:   	fsrc2s	%f11, %f23
	.word	0x802ce39f	! t1_kref+0x518:   	andn	%l3, 0x39f, %g0
	.word	0x8143c000	! t1_kref+0x51c:   	stbar
	.word	0xa9a01919	! t1_kref+0x520:   	fitod	%f25, %f20
	.word	0xede65014	! t1_kref+0x524:   	casa	[%i1]0x80, %l4, %l6
	.word	0x24800006	! t1_kref+0x528:   	ble,a	_kref+0x540
	.word	0xafa018dc	! t1_kref+0x52c:   	fdtos	%f28, %f23
	.word	0x81af0acc	! t1_kref+0x530:   	fcmped	%fcc0, %f28, %f12
	.word	0xa1b40f96	! t1_kref+0x534:   	for	%f16, %f22, %f16
	.word	0x81abcaba	! t1_kref+0x538:   	fcmpes	%fcc0, %f15, %f26
	.word	0xb7a000ba	! t1_kref+0x53c:   	fnegs	%f26, %f27
	.word	0xc398a0c0	! t1_kref+0x540:   	ldda	[%g2 + 0xc0]%asi, %f32
	.word	0xa3a94031	! t1_kref+0x544:   	fmovsug	%fcc0, %f17, %f17
	.word	0x99b28e5a	! t1_kref+0x548:   	fxnor	%f10, %f26, %f12
	.word	0xa53ce01b	! t1_kref+0x54c:   	sra	%l3, 0x1b, %l2
	.word	0x9fb384d2	! t1_kref+0x550:   	fcmpne32	%f14, %f18, %o7
	.word	0xadb70d18	! t1_kref+0x554:   	fandnot1	%f28, %f24, %f22
	.word	0xa8f4a71d	! t1_kref+0x558:   	udivcc	%l2, 0x71d, %l4
	.word	0x81de000e	! t1_kref+0x55c:   	flush	%i0 + %sp
	.word	0xa1a00530	! t1_kref+0x560:   	fsqrts	%f16, %f16
	.word	0xa32c0014	! t1_kref+0x564:   	sll	%l0, %l4, %l1
	.word	0xaa047adb	! t1_kref+0x568:   	add	%l1, -0x525, %l5
	.word	0xb5b48e0c	! t1_kref+0x56c:   	fand	%f18, %f12, %f26
	.word	0xfdbe501d	! t1_kref+0x570:   	stda	%f30, [%i1 + %i5]0x80
	.word	0x91346016	! t1_kref+0x574:   	srl	%l1, 0x16, %o0
	.word	0xb1b58f92	! t1_kref+0x578:   	for	%f22, %f18, %f24
	.word	0x81d94001	! t1_kref+0x57c:   	flush	%g5 + %g1
	.word	0xd268a025	! t1_kref+0x580:   	ldstub	[%g2 + 0x25], %o1
	.word	0xa1b50134	! t1_kref+0x584:   	edge32n	%l4, %l4, %l0
	.word	0xb9a00134	! t1_kref+0x588:   	fabss	%f20, %f28
	.word	0x99240011	! t1_kref+0x58c:   	mulscc	%l0, %l1, %o4
	.word	0xf7062004	! t1_kref+0x590:   	ld	[%i0 + 4], %f27
	.word	0x913c601b	! t1_kref+0x594:   	sra	%l1, 0x1b, %o0
	.word	0x9bb00f2c	! t1_kref+0x598:   	fsrc2s	%f12, %f13
	.word	0xda563ffe	! t1_kref+0x59c:   	ldsh	[%i0 - 2], %o5
	.word	0x9eac4014	! t1_kref+0x5a0:   	andncc	%l1, %l4, %o7
	.word	0xb1a2894c	! t1_kref+0x5a4:   	fmuld	%f10, %f12, %f24
	.word	0x81ab0adc	! t1_kref+0x5a8:   	fcmped	%fcc0, %f12, %f28
	.word	0xbda5095c	! t1_kref+0x5ac:   	fmuld	%f20, %f28, %f30
	.word	0x81ae0ab9	! t1_kref+0x5b0:   	fcmpes	%fcc0, %f24, %f25
	.word	0x9da3085a	! t1_kref+0x5b4:   	faddd	%f12, %f26, %f14
	.word	0x21480007	! t1_kref+0x5b8:   	fbn,a,pt	%fcc0, _kref+0x5d4
	.word	0xacf53a1d	! t1_kref+0x5bc:   	udivcc	%l4, -0x5e3, %l6
	.word	0x97b50091	! t1_kref+0x5c0:   	edge16	%l4, %l1, %o3
	.word	0x803c0011	! t1_kref+0x5c4:   	xnor	%l0, %l1, %g0
	.word	0xadb406d8	! t1_kref+0x5c8:   	fmul8sux16	%f16, %f24, %f22
	.word	0x2f143409	! t1_kref+0x5cc:   	sethi	%hi(0x50d02400), %l7
	.word	0x81accaba	! t1_kref+0x5d0:   	fcmpes	%fcc0, %f19, %f26
	.word	0x191baf2a	! t1_kref+0x5d4:   	sethi	%hi(0x6ebca800), %o4
	.word	0xc568a04c	! t1_kref+0x5d8:   	prefetch	%g2 + 0x4c, 2
	.word	0x23199fce	! t1_kref+0x5dc:   	sethi	%hi(0x667f3800), %l1
	.word	0x97408000	! t1_kref+0x5e0:   	mov	%ccr, %o3
	.word	0x90544012	! t1_kref+0x5e4:   	umul	%l1, %l2, %o0
	.word	0x913d0011	! t1_kref+0x5e8:   	sra	%l4, %l1, %o0
	.word	0xaef50013	! t1_kref+0x5ec:   	udivcc	%l4, %l3, %l7
	.word	0xe02e3ff2	! t1_kref+0x5f0:   	stb	%l0, [%i0 - 0xe]
	.word	0x97a508b1	! t1_kref+0x5f4:   	fsubs	%f20, %f17, %f11
	.word	0xd91fbf40	! t1_kref+0x5f8:   	ldd	[%fp - 0xc0], %f12
	.word	0x94ac4011	! t1_kref+0x5fc:   	andncc	%l1, %l1, %o2
	.word	0xb7a0013d	! t1_kref+0x600:   	fabss	%f29, %f27
	.word	0xe3b8a100	! t1_kref+0x604:   	stda	%f48, [%g2 + 0x100]%asi
	.word	0xea96d018	! t1_kref+0x608:   	lduha	[%i3 + %i0]0x80, %l5
	.word	0x9b400000	! t1_kref+0x60c:   	mov	%y, %o5
	.word	0x81248014	! t1_kref+0x610:   	mulscc	%l2, %l4, %g0
	.word	0x878020f0	! t1_kref+0x614:   	mov	0xf0, %asi
	.word	0xa1400000	! t1_kref+0x618:   	mov	%y, %l0
	.word	0xe1266014	! t1_kref+0x61c:   	st	%f16, [%i1 + 0x14]
	.word	0xe51fbd00	! t1_kref+0x620:   	ldd	[%fp - 0x300], %f18
	.word	0xe51e401d	! t1_kref+0x624:   	ldd	[%i1 + %i5], %f18
	.word	0xace52a2f	! t1_kref+0x628:   	subccc	%l4, 0xa2f, %l6
	.word	0xab400000	! t1_kref+0x62c:   	mov	%y, %l5
	.word	0xd81e6008	! t1_kref+0x630:   	ldd	[%i1 + 8], %o4
	.word	0xa0aca536	! t1_kref+0x634:   	andncc	%l2, 0x536, %l0
	.word	0x81dd801c	! t1_kref+0x638:   	flush	%l6 + %i4
	.word	0x98344010	! t1_kref+0x63c:   	orn	%l1, %l0, %o4
	.word	0xd01e4000	! t1_kref+0x640:   	ldd	[%i1], %o0
	.word	0x99a01112	! t1_kref+0x644:   	fxtod	%f18, %f12
	.word	0xb5a0053e	! t1_kref+0x648:   	fsqrts	%f30, %f26
	.word	0x96bc2668	! t1_kref+0x64c:   	xnorcc	%l0, 0x668, %o3
	.word	0xad408000	! t1_kref+0x650:   	mov	%ccr, %l6
	.word	0x92fcfc37	! t1_kref+0x654:   	sdivcc	%l3, -0x3c9, %o1
	.word	0xe91e3ff8	! t1_kref+0x658:   	ldd	[%i0 - 8], %f20
	.word	0xb7a5c9ba	! t1_kref+0x65c:   	fdivs	%f23, %f26, %f27
	.word	0x9a3ca547	! t1_kref+0x660:   	xnor	%l2, 0x547, %o5
	.word	0x21480006	! t1_kref+0x664:   	fbn,a,pt	%fcc0, _kref+0x67c
	.word	0xe06e4000	! t1_kref+0x668:   	ldstub	[%i1], %l0
	.word	0xe920a01c	! t1_kref+0x66c:   	st	%f20, [%g2 + 0x1c]
	.word	0xb1a0052c	! t1_kref+0x670:   	fsqrts	%f12, %f24
	.word	0xac64720d	! t1_kref+0x674:   	subc	%l1, -0xdf3, %l6
	.word	0xafb44094	! t1_kref+0x678:   	edge16	%l1, %l4, %l7
	.word	0xe968a10e	! t1_kref+0x67c:   	prefetch	%g2 + 0x10e, 20
	.word	0x9ef4c010	! t1_kref+0x680:   	udivcc	%l3, %l0, %o7
	.word	0xbdb5ce6f	! t1_kref+0x684:   	fxnors	%f23, %f15, %f30
	.word	0xaefc8012	! t1_kref+0x688:   	sdivcc	%l2, %l2, %l7
	.word	0xa85cbd6e	! t1_kref+0x68c:   	smul	%l2, -0x292, %l4
	.word	0xf726601c	! t1_kref+0x690:   	st	%f27, [%i1 + 0x1c]
	.word	0x9f40c000	! t1_kref+0x694:   	mov	%asi, %o7
	.word	0xa60c0012	! t1_kref+0x698:   	and	%l0, %l2, %l3
	.word	0xacac0014	! t1_kref+0x69c:   	andncc	%l0, %l4, %l6
	.word	0x97a0012e	! t1_kref+0x6a0:   	fabss	%f14, %f11
	.word	0xb9b587dc	! t1_kref+0x6a4:   	pdist	%f22, %f28, %f28
	.word	0x81ac0a5a	! t1_kref+0x6a8:   	fcmpd	%fcc0, %f16, %f26
	.word	0xf51fbf70	! t1_kref+0x6ac:   	ldd	[%fp - 0x90], %f26
	.word	0x9db30d9c	! t1_kref+0x6b0:   	fxor	%f12, %f28, %f14
	.word	0xa5a000de	! t1_kref+0x6b4:   	fnegd	%f30, %f18
	.word	0x30480005	! t1_kref+0x6b8:   	ba,a,pt	%icc, _kref+0x6cc
	.word	0xbda708b6	! t1_kref+0x6bc:   	fsubs	%f28, %f22, %f30
	.word	0xe91fbc18	! t1_kref+0x6c0:   	ldd	[%fp - 0x3e8], %f20
	.word	0x2d480007	! t1_kref+0x6c4:   	fbg,a,pt	%fcc0, _kref+0x6e0
	.word	0x132261f4	! t1_kref+0x6c8:   	sethi	%hi(0x8987d000), %o1
	.word	0xd26e201c	! t1_kref+0x6cc:   	ldstub	[%i0 + 0x1c], %o1
	.word	0xe22e601e	! t1_kref+0x6d0:   	stb	%l1, [%i1 + 0x1e]
	.word	0xaf3d2005	! t1_kref+0x6d4:   	sra	%l4, 0x5, %l7
	.word	0x98e48014	! t1_kref+0x6d8:   	subccc	%l2, %l4, %o4
	.word	0x9a2cc010	! t1_kref+0x6dc:   	andn	%l3, %l0, %o5
	.word	0x94d52422	! t1_kref+0x6e0:   	umulcc	%l4, 0x422, %o2
	.word	0x2f480001	! t1_kref+0x6e4:   	fbu,a,pt	%fcc0, _kref+0x6e8
	.word	0xb1a00531	! t1_kref+0x6e8:   	fsqrts	%f17, %f24
	.word	0x92aca3b0	! t1_kref+0x6ec:   	andncc	%l2, 0x3b0, %o1
	.word	0xd6d81018	! t1_kref+0x6f0:   	ldxa	[%g0 + %i0]0x80, %o3
	.word	0x81ae0a5a	! t1_kref+0x6f4:   	fcmpd	%fcc0, %f24, %f26
	.word	0xdd3e401d	! t1_kref+0x6f8:   	std	%f14, [%i1 + %i5]
	.word	0xe3b8a100	! t1_kref+0x6fc:   	stda	%f48, [%g2 + 0x100]%asi
	.word	0xf720a01c	! t1_kref+0x700:   	st	%f27, [%g2 + 0x1c]
	.word	0xf16e2010	! t1_kref+0x704:   	prefetch	%i0 + 0x10, 24
	.word	0xef68a086	! t1_kref+0x708:   	prefetch	%g2 + 0x86, 23
	.word	0xbba0012f	! t1_kref+0x70c:   	fabss	%f15, %f29
	.word	0x9e24c014	! t1_kref+0x710:   	sub	%l3, %l4, %o7
	.word	0xa5b28454	! t1_kref+0x714:   	fcmpne16	%f10, %f20, %l2
	.word	0x97b30454	! t1_kref+0x718:   	fcmpne16	%f12, %f20, %o3
	.word	0xd07e600c	! t1_kref+0x71c:   	swap	[%i1 + 0xc], %o0
	.word	0x8184c000	! t1_kref+0x720:   	wr	%l3, %g0, %y
	.word	0x9adcc011	! t1_kref+0x724:   	smulcc	%l3, %l1, %o5
	.word	0x8184c000	! t1_kref+0x728:   	wr	%l3, %g0, %y
	.word	0x929d2b5e	! t1_kref+0x72c:   	xorcc	%l4, 0xb5e, %o1
	.word	0xa9b3466c	! t1_kref+0x730:   	fmul8x16au	%f13, %f12, %f20
	.word	0xe22e8018	! t1_kref+0x734:   	stb	%l1, [%i2 + %i0]
	.word	0xfd06401c	! t1_kref+0x738:   	ld	[%i1 + %i4], %f30
	.word	0xbbb78dab	! t1_kref+0x73c:   	fxors	%f30, %f11, %f29
	.word	0x81ab8a54	! t1_kref+0x740:   	fcmpd	%fcc0, %f14, %f20
	.word	0x9db48998	! t1_kref+0x744:   	bshuffle	%f18, %f24, %f14
	.word	0xc06e4000	! t1_kref+0x748:   	ldstub	[%i1], %g0
	.word	0xa09432ff	! t1_kref+0x74c:   	orcc	%l0, -0xd01, %l0
	.word	0x81dd0013	! t1_kref+0x750:   	flush	%l4 + %l3
	.word	0xa5a01a50	! t1_kref+0x754:   	fdtoi	%f16, %f18
	.word	0x8184c000	! t1_kref+0x758:   	wr	%l3, %g0, %y
	.word	0xb9b3467d	! t1_kref+0x75c:   	fmul8x16au	%f13, %f29, %f28
	.word	0x9fc00004	! t1_kref+0x760:   	call	%g0 + %g4
	.word	0x81848000	! t1_kref+0x764:   	wr	%l2, %g0, %y
	.word	0x9fc00004	! t1_kref+0x768:   	call	%g0 + %g4
	.word	0xd67e200c	! t1_kref+0x76c:   	swap	[%i0 + 0xc], %o3
	.word	0xa4f40014	! t1_kref+0x770:   	udivcc	%l0, %l4, %l2
	.word	0xa0f48014	! t1_kref+0x774:   	udivcc	%l2, %l4, %l0
	.word	0x9de3bfa0	! t1_kref+0x778:   	save	%sp, -0x60, %sp
	.word	0xa7ef4019	! t1_kref+0x77c:   	restore	%i5, %i1, %l3
	.word	0xd41f4019	! t1_kref+0x780:   	ldd	[%i5 + %i1], %o2
	.word	0xa52cc013	! t1_kref+0x784:   	sll	%l3, %l3, %l2
	.word	0xa8c4c012	! t1_kref+0x788:   	addccc	%l3, %l2, %l4
	.word	0x93b4c131	! t1_kref+0x78c:   	edge32n	%l3, %l1, %o1
	.word	0x9fc10000	! t1_kref+0x790:   	call	%g4
	.word	0x94844014	! t1_kref+0x794:   	addcc	%l1, %l4, %o2
	.word	0x9bb7850e	! t1_kref+0x798:   	fcmpgt16	%f30, %f14, %o5
	.word	0xa8444011	! t1_kref+0x79c:   	addc	%l1, %l1, %l4
	.word	0xb9a00550	! t1_kref+0x7a0:   	fsqrtd	%f16, %f28
	.word	0x97a018de	! t1_kref+0x7a4:   	fdtos	%f30, %f11
	.word	0x81840000	! t1_kref+0x7a8:   	wr	%l0, %g0, %y
	.word	0x9de3bfa0	! t1_kref+0x7ac:   	save	%sp, -0x60, %sp
	.word	0x81eec01a	! t1_kref+0x7b0:   	restore	%i3, %i2, %g0
	.word	0xef266000	! t1_kref+0x7b4:   	st	%f23, [%i1]
	.word	0xa944c000	! t1_kref+0x7b8:   	mov	%gsr, %l4
	.word	0xa80c8011	! t1_kref+0x7bc:   	and	%l2, %l1, %l4
	.word	0xe276001d	! t1_kref+0x7c0:   	stx	%l1, [%i0 + %i5]
	.word	0xe2780018	! t1_kref+0x7c4:   	swap	[%g0 + %i0], %l1
	.word	0xe0100019	! t1_kref+0x7c8:   	lduh	[%g0 + %i1], %l0
	.word	0xe2680018	! t1_kref+0x7cc:   	ldstub	[%g0 + %i0], %l1
	.word	0x953ca014	! t1_kref+0x7d0:   	sra	%l2, 0x14, %o2
	.word	0xa1a01035	! t1_kref+0x7d4:   	fstox	%f21, %f16
	.word	0xada0191d	! t1_kref+0x7d8:   	fitod	%f29, %f22
	.word	0xad3c2011	! t1_kref+0x7dc:   	sra	%l0, 0x11, %l6
	.word	0xaa44fff0	! t1_kref+0x7e0:   	addc	%l3, -0x10, %l5
	.word	0x91b70550	! t1_kref+0x7e4:   	fcmpeq16	%f28, %f16, %o0
	.word	0xc0de5000	! t1_kref+0x7e8:   	ldxa	[%i1]0x80, %g0
	.word	0x94550014	! t1_kref+0x7ec:   	umul	%l4, %l4, %o2
	.word	0x97342011	! t1_kref+0x7f0:   	srl	%l0, 0x11, %o3
	.word	0xa9a0055c	! t1_kref+0x7f4:   	fsqrtd	%f28, %f20
	.word	0xa254381c	! t1_kref+0x7f8:   	umul	%l0, -0x7e4, %l1
	.word	0xb7a000b1	! t1_kref+0x7fc:   	fnegs	%f17, %f27
	.word	0x81ad8a5a	! t1_kref+0x800:   	fcmpd	%fcc0, %f22, %f26
	.word	0x9884c012	! t1_kref+0x804:   	addcc	%l3, %l2, %o4
	.word	0xe91f4019	! t1_kref+0x808:   	ldd	[%i5 + %i1], %f20
	.word	0x29480006	! t1_kref+0x80c:   	fbl,a,pt	%fcc0, _kref+0x824
	.word	0xa0a50010	! t1_kref+0x810:   	subcc	%l4, %l0, %l0
	.word	0x99a00556	! t1_kref+0x814:   	fsqrtd	%f22, %f12
	.word	0xada68d32	! t1_kref+0x818:   	fsmuld	%f26, %f18, %f22
	.word	0x92a48014	! t1_kref+0x81c:   	subcc	%l2, %l4, %o1
	.word	0x9a2c34eb	! t1_kref+0x820:   	andn	%l0, -0xb15, %o5
	.word	0xa1ab8056	! t1_kref+0x824:   	fmovdule	%fcc0, %f22, %f16
	.word	0xd6167ff6	! t1_kref+0x828:   	lduh	[%i1 - 0xa], %o3
	.word	0x91b4049c	! t1_kref+0x82c:   	fcmple32	%f16, %f28, %o0
	.word	0xee163fe8	! t1_kref+0x830:   	lduh	[%i0 - 0x18], %l7
	.word	0x31480008	! t1_kref+0x834:   	fba,a,pt	%fcc0, _kref+0x854
	.word	0xc398a0c0	! t1_kref+0x838:   	ldda	[%g2 + 0xc0]%asi, %f32
	.word	0x9f414000	! t1_kref+0x83c:   	mov	%pc, %o7
	.word	0xb5b58e80	! t1_kref+0x840:   	fsrc1	%f22, %f26
	.word	0x81ae0ad4	! t1_kref+0x844:   	fcmped	%fcc0, %f24, %f20
	.word	0xada589d0	! t1_kref+0x848:   	fdivd	%f22, %f16, %f22
	.word	0xb5b58d40	! t1_kref+0x84c:   	fnot1	%f22, %f26
	.word	0x29800007	! t1_kref+0x850:   	fbl,a	_kref+0x86c
	.word	0xb1b5cdae	! t1_kref+0x854:   	fxors	%f23, %f14, %f24
	.word	0x33480008	! t1_kref+0x858:   	fbe,a,pt	%fcc0, _kref+0x878
	.word	0x95b50280	! t1_kref+0x85c:   	array32	%l4, %g0, %o2
	.word	0xb1a0054c	! t1_kref+0x860:   	fsqrtd	%f12, %f24
	.word	0xe656c019	! t1_kref+0x864:   	ldsh	[%i3 + %i1], %l3
	.word	0xd44e0000	! t1_kref+0x868:   	ldsb	[%i0], %o2
	.word	0xae140010	! t1_kref+0x86c:   	or	%l0, %l0, %l7
	.word	0xa9400000	! t1_kref+0x870:   	mov	%y, %l4
	.word	0x81142717	! t1_kref+0x874:   	taddcctv	%l0, 0x717, %g0
	.word	0xa9b44052	! t1_kref+0x878:   	edge8l	%l1, %l2, %l4
	.word	0xe42e8019	! t1_kref+0x87c:   	stb	%l2, [%i2 + %i1]
	.word	0x9da0055a	! t1_kref+0x880:   	fsqrtd	%f26, %f14
	.word	0xbdb00f1a	! t1_kref+0x884:   	fsrc2	%f26, %f30
	.word	0xa4944011	! t1_kref+0x888:   	orcc	%l1, %l1, %l2
	.word	0x94c47323	! t1_kref+0x88c:   	addccc	%l1, -0xcdd, %o2
	.word	0xe250a026	! t1_kref+0x890:   	ldsh	[%g2 + 0x26], %l1
	.word	0x97b50150	! t1_kref+0x894:   	edge32l	%l4, %l0, %o3
	.word	0xb5a60d2f	! t1_kref+0x898:   	fsmuld	%f24, %f15, %f26
	.word	0xa9a0055c	! t1_kref+0x89c:   	fsqrtd	%f28, %f20
	.word	0xa49c4010	! t1_kref+0x8a0:   	xorcc	%l1, %l0, %l2
	.word	0xace53ff7	! t1_kref+0x8a4:   	subccc	%l4, -0x9, %l6
	.word	0xb1a4c9b6	! t1_kref+0x8a8:   	fdivs	%f19, %f22, %f24
	.word	0x9ec50011	! t1_kref+0x8ac:   	addccc	%l4, %l1, %o7
	.word	0xa9b48f9a	! t1_kref+0x8b0:   	for	%f18, %f26, %f20
	.word	0xafb74df7	! t1_kref+0x8b4:   	fnands	%f29, %f23, %f23
	.word	0xd26e8018	! t1_kref+0x8b8:   	ldstub	[%i2 + %i0], %o1
	.word	0xf926001c	! t1_kref+0x8bc:   	st	%f28, [%i0 + %i4]
	.word	0xa2740014	! t1_kref+0x8c0:   	udiv	%l0, %l4, %l1
	.word	0xe93e401d	! t1_kref+0x8c4:   	std	%f20, [%i1 + %i5]
	.word	0x98fca9ac	! t1_kref+0x8c8:   	sdivcc	%l2, 0x9ac, %o4
	.word	0xaed48014	! t1_kref+0x8cc:   	umulcc	%l2, %l4, %l7
	.word	0x94353863	! t1_kref+0x8d0:   	orn	%l4, -0x79d, %o2
	.word	0xbbb50db0	! t1_kref+0x8d4:   	fxors	%f20, %f16, %f29
	.word	0x9de3bfa0	! t1_kref+0x8d8:   	save	%sp, -0x60, %sp
	.word	0xb296fc18	! t1_kref+0x8dc:   	orcc	%i3, -0x3e8, %i1
	.word	0xadee3db9	! t1_kref+0x8e0:   	restore	%i0, -0x247, %l6
	.word	0xada01911	! t1_kref+0x8e4:   	fitod	%f17, %f22
	.word	0x9a1ce90d	! t1_kref+0x8e8:   	xor	%l3, 0x90d, %o5
	.word	0x99a7085c	! t1_kref+0x8ec:   	faddd	%f28, %f28, %f12
	.word	0xa5a018da	! t1_kref+0x8f0:   	fdtos	%f26, %f18
	.word	0xe120a03c	! t1_kref+0x8f4:   	st	%f16, [%g2 + 0x3c]
	.word	0xb7a5c92b	! t1_kref+0x8f8:   	fmuls	%f23, %f11, %f27
	.word	0x940cf334	! t1_kref+0x8fc:   	and	%l3, -0xccc, %o2
	.word	0xaba64937	! t1_kref+0x900:   	fmuls	%f25, %f23, %f21
	.word	0x81d80014	! t1_kref+0x904:   	flush	%g0 + %l4
	.word	0x9fa409ac	! t1_kref+0x908:   	fdivs	%f16, %f12, %f15
	.word	0x95b387d6	! t1_kref+0x90c:   	pdist	%f14, %f22, %f10
	.word	0xb1a0053c	! t1_kref+0x910:   	fsqrts	%f28, %f24
	.word	0x8610201f	! t1_kref+0x914:   	mov	0x1f, %g3
	.word	0x86a0e001	! t1_kref+0x918:   	subcc	%g3, 1, %g3
	.word	0x22800014	! t1_kref+0x91c:   	be,a	_kref+0x96c
	.word	0xa1b3867b	! t1_kref+0x920:   	fmul8x16au	%f14, %f27, %f16
	.word	0x190ed8af	! t1_kref+0x924:   	sethi	%hi(0x3b62bc00), %o4
	.word	0x81af0a50	! t1_kref+0x928:   	fcmpd	%fcc0, %f28, %f16
	.word	0xc768a0c4	! t1_kref+0x92c:   	prefetch	%g2 + 0xc4, 3
	.word	0xada8c04e	! t1_kref+0x930:   	fmovdul	%fcc0, %f14, %f22
	.word	0xa5a3c8b4	! t1_kref+0x934:   	fsubs	%f15, %f20, %f18
	.word	0x9734e013	! t1_kref+0x938:   	srl	%l3, 0x13, %o3
	.word	0x354ffff7	! t1_kref+0x93c:   	fbue,a,pt	%fcc0, _kref+0x918
	.word	0x95a28956	! t1_kref+0x940:   	fmuld	%f10, %f22, %f10
	.word	0x9a2ca48e	! t1_kref+0x944:   	andn	%l2, 0x48e, %o5
	.word	0x28bffff4	! t1_kref+0x948:   	bleu,a	_kref+0x918
	.word	0x969c4011	! t1_kref+0x94c:   	xorcc	%l1, %l1, %o3
	.word	0xf1beda58	! t1_kref+0x950:   	stda	%f24, [%i3 + %i0]0xd2
	.word	0xb3a4c83e	! t1_kref+0x954:   	fadds	%f19, %f30, %f25
	.word	0xa82c0011	! t1_kref+0x958:   	andn	%l0, %l1, %l4
	.word	0x81844000	! t1_kref+0x95c:   	wr	%l1, %g0, %y
	.word	0xb1a000ac	! t1_kref+0x960:   	fnegs	%f12, %f24
	.word	0xa1a0013c	! t1_kref+0x964:   	fabss	%f28, %f16
	.word	0x803cedf4	! t1_kref+0x968:   	xnor	%l3, 0xdf4, %g0
	.word	0xf93e6000	! t1_kref+0x96c:   	std	%f28, [%i1]
	.word	0x81dca6d7	! t1_kref+0x970:   	flush	%l2 + 0x6d7
	.word	0xde08a02c	! t1_kref+0x974:   	ldub	[%g2 + 0x2c], %o7
	.word	0xa9400000	! t1_kref+0x978:   	mov	%y, %l4
	.word	0x99a0052d	! t1_kref+0x97c:   	fsqrts	%f13, %f12
	.word	0x989c0011	! t1_kref+0x980:   	xorcc	%l0, %l1, %o4
	.word	0xe8f01019	! t1_kref+0x984:   	stxa	%l4, [%g0 + %i1]0x80
	.word	0xe22e401a	! t1_kref+0x988:   	stb	%l1, [%i1 + %i2]
	.word	0x9af4c011	! t1_kref+0x98c:   	udivcc	%l3, %l1, %o5
	.word	0xacacb58a	! t1_kref+0x990:   	andncc	%l2, -0xa76, %l6
	.word	0xada44d3e	! t1_kref+0x994:   	fsmuld	%f17, %f30, %f22
	.word	0xc0df5019	! t1_kref+0x998:   	ldxa	[%i5 + %i1]0x80, %g0
	.word	0xacfcbcb2	! t1_kref+0x99c:   	sdivcc	%l2, -0x34e, %l6
	.word	0xa7a64934	! t1_kref+0x9a0:   	fmuls	%f25, %f20, %f19
	.word	0x92ac4012	! t1_kref+0x9a4:   	andncc	%l1, %l2, %o1
	.word	0x9bb60518	! t1_kref+0x9a8:   	fcmpgt16	%f24, %f24, %o5
	.word	0x3c480004	! t1_kref+0x9ac:   	bpos,a,pt	%icc, _kref+0x9bc
	.word	0xaa84e93f	! t1_kref+0x9b0:   	addcc	%l3, 0x93f, %l5
	.word	0xa3a00538	! t1_kref+0x9b4:   	fsqrts	%f24, %f17
	.word	0xe920a01c	! t1_kref+0x9b8:   	st	%f20, [%g2 + 0x1c]
	.word	0xe020a004	! t1_kref+0x9bc:   	st	%l0, [%g2 + 4]
	.word	0x97a0012b	! t1_kref+0x9c0:   	fabss	%f11, %f11
	.word	0x81ab0a5e	! t1_kref+0x9c4:   	fcmpd	%fcc0, %f12, %f30
	.word	0x2f480003	! t1_kref+0x9c8:   	fbu,a,pt	%fcc0, _kref+0x9d4
	.word	0x93b48151	! t1_kref+0x9cc:   	edge32l	%l2, %l1, %o1
	.word	0xaad4246b	! t1_kref+0x9d0:   	umulcc	%l0, 0x46b, %l5
	.word	0xa5a7085a	! t1_kref+0x9d4:   	faddd	%f28, %f26, %f18
	.word	0xd2f81018	! t1_kref+0x9d8:   	swapa	[%g0 + %i0]0x80, %o1
	.word	0xb3a509bc	! t1_kref+0x9dc:   	fdivs	%f20, %f28, %f25
	.word	0xae848011	! t1_kref+0x9e0:   	addcc	%l2, %l1, %l7
	.word	0xa2a50010	! t1_kref+0x9e4:   	subcc	%l4, %l0, %l1
	.word	0xe2680019	! t1_kref+0x9e8:   	ldstub	[%g0 + %i1], %l1
	.word	0xde567fe2	! t1_kref+0x9ec:   	ldsh	[%i1 - 0x1e], %o7
	.word	0xb9a3894e	! t1_kref+0x9f0:   	fmuld	%f14, %f14, %f28
	.word	0xc056001b	! t1_kref+0x9f4:   	ldsh	[%i0 + %i3], %g0
	.word	0xaec47c12	! t1_kref+0x9f8:   	addccc	%l1, -0x3ee, %l7
	.word	0x95348011	! t1_kref+0x9fc:   	srl	%l2, %l1, %o2
	.word	0xd06e8018	! t1_kref+0xa00:   	ldstub	[%i2 + %i0], %o0
	.word	0xb1b68e5c	! t1_kref+0xa04:   	fxnor	%f26, %f28, %f24
	.word	0x9fc00004	! t1_kref+0xa08:   	call	%g0 + %g4
	.word	0x8d840014	! t1_kref+0xa0c:   	wr	%l0, %l4, %fprs
	.word	0x81b40134	! t1_kref+0xa10:   	edge32n	%l0, %l4, %g0
	.word	0x95400000	! t1_kref+0xa14:   	mov	%y, %o2
	.word	0x99a000bb	! t1_kref+0xa18:   	fnegs	%f27, %f12
	.word	0xbdb00fc0	! t1_kref+0xa1c:   	fone	%f30
	.word	0xe4270019	! t1_kref+0xa20:   	st	%l2, [%i4 + %i1]
	.word	0xaaacfda2	! t1_kref+0xa24:   	andncc	%l3, -0x25e, %l5
	.word	0xa47c8011	! t1_kref+0xa28:   	sdiv	%l2, %l1, %l2
	.word	0xf9200018	! t1_kref+0xa2c:   	st	%f28, [%g0 + %i0]
	.word	0xa1a68930	! t1_kref+0xa30:   	fmuls	%f26, %f16, %f16
	.word	0x8143e004	! t1_kref+0xa34:   	membar	0x4
	.word	0xae8cff04	! t1_kref+0xa38:   	andcc	%l3, -0xfc, %l7
	.word	0xb3a018dc	! t1_kref+0xa3c:   	fdtos	%f28, %f25
	.word	0xadaa005a	! t1_kref+0xa40:   	fmovda	%fcc0, %f26, %f22
	.word	0xa3a00131	! t1_kref+0xa44:   	fabss	%f17, %f17
	.word	0x99b68558	! t1_kref+0xa48:   	fcmpeq16	%f26, %f24, %o4
	.word	0xf720a024	! t1_kref+0xa4c:   	st	%f27, [%g2 + 0x24]
	.word	0xc768a0c2	! t1_kref+0xa50:   	prefetch	%g2 + 0xc2, 3
	.word	0xfd263fe4	! t1_kref+0xa54:   	st	%f30, [%i0 - 0x1c]
	.word	0x81b40312	! t1_kref+0xa58:   	alignaddr	%l0, %l2, %g0
	.word	0xa5b60a1a	! t1_kref+0xa5c:   	fpadd16	%f24, %f26, %f18
	.word	0xacf40012	! t1_kref+0xa60:   	udivcc	%l0, %l2, %l6
	.word	0x81b3040e	! t1_kref+0xa64:   	fcmple16	%f12, %f14, %g0
	.word	0x99a01937	! t1_kref+0xa68:   	fstod	%f23, %f12
	.word	0x9ba00531	! t1_kref+0xa6c:   	fsqrts	%f17, %f13
	.word	0xa5a0013c	! t1_kref+0xa70:   	fabss	%f28, %f18
	.word	0x3f480003	! t1_kref+0xa74:   	fbo,a,pt	%fcc0, _kref+0xa80
	.word	0xa5b64632	! t1_kref+0xa78:   	fmul8x16	%f25, %f18, %f18
	.word	0xf9bf1a59	! t1_kref+0xa7c:   	stda	%f28, [%i4 + %i1]0xd2
	.word	0xd81e7ff0	! t1_kref+0xa80:   	ldd	[%i1 - 0x10], %o4
	.word	0xe83e4000	! t1_kref+0xa84:   	std	%l4, [%i1]
	.word	0xf1be5810	! t1_kref+0xa88:   	stda	%f24, [%i1 + %l0]0xc0
	.word	0x92850013	! t1_kref+0xa8c:   	addcc	%l4, %l3, %o1
	.word	0xa5a5c9bb	! t1_kref+0xa90:   	fdivs	%f23, %f27, %f18
	.word	0xec1e0000	! t1_kref+0xa94:   	ldd	[%i0], %l6
	.word	0xef067ff4	! t1_kref+0xa98:   	ld	[%i1 - 0xc], %f23
	.word	0x92fc0010	! t1_kref+0xa9c:   	sdivcc	%l0, %l0, %o1
	.word	0xbba00535	! t1_kref+0xaa0:   	fsqrts	%f21, %f29
	.word	0x9fa788b5	! t1_kref+0xaa4:   	fsubs	%f30, %f21, %f15
	.word	0xe4774018	! t1_kref+0xaa8:   	stx	%l2, [%i5 + %i0]
	.word	0xacfcc013	! t1_kref+0xaac:   	sdivcc	%l3, %l3, %l6
	.word	0xa5400000	! t1_kref+0xab0:   	mov	%y, %l2
	.word	0x3a480002	! t1_kref+0xab4:   	bcc,a,pt	%icc, _kref+0xabc
	.word	0xa68ce745	! t1_kref+0xab8:   	andcc	%l3, 0x745, %l3
	.word	0x8143c000	! t1_kref+0xabc:   	stbar
	.word	0xa9b4c0f2	! t1_kref+0xac0:   	edge16ln	%l3, %l2, %l4
	.word	0xe42e2001	! t1_kref+0xac4:   	stb	%l2, [%i0 + 1]
	.word	0xdf066010	! t1_kref+0xac8:   	ld	[%i1 + 0x10], %f15
	.word	0xd0563ff8	! t1_kref+0xacc:   	ldsh	[%i0 - 8], %o0
	.word	0xea166002	! t1_kref+0xad0:   	lduh	[%i1 + 2], %l5
	.word	0x90ac26a5	! t1_kref+0xad4:   	andncc	%l0, 0x6a5, %o0
	.word	0xa1a0053a	! t1_kref+0xad8:   	fsqrts	%f26, %f16
	.word	0x2f107f45	! t1_kref+0xadc:   	sethi	%hi(0x41fd1400), %l7
	.word	0x96f4e82d	! t1_kref+0xae0:   	udivcc	%l3, 0x82d, %o3
	.word	0x9db00776	! t1_kref+0xae4:   	fpack16	%f22, %f14
	.word	0xbbb78a6f	! t1_kref+0xae8:   	fpadd32s	%f30, %f15, %f29
	.word	0x3d800001	! t1_kref+0xaec:   	fbule,a	_kref+0xaf0
	.word	0xd83e2018	! t1_kref+0xaf0:   	std	%o4, [%i0 + 0x18]
	.word	0xa2c44011	! t1_kref+0xaf4:   	addccc	%l1, %l1, %l1
	.word	0xe93e3fe8	! t1_kref+0xaf8:   	std	%f20, [%i0 - 0x18]
	.word	0xa6148012	! t1_kref+0xafc:   	or	%l2, %l2, %l3
	.word	0xe6764000	! t1_kref+0xb00:   	stx	%l3, [%i1]
	.word	0x2d480006	! t1_kref+0xb04:   	fbg,a,pt	%fcc0, _kref+0xb1c
	.word	0xe0262018	! t1_kref+0xb08:   	st	%l0, [%i0 + 0x18]
	.word	0xc168a089	! t1_kref+0xb0c:   	prefetch	%g2 + 0x89, 0
	.word	0xe04e201e	! t1_kref+0xb10:   	ldsb	[%i0 + 0x1e], %l0
	.word	0xacad0012	! t1_kref+0xb14:   	andncc	%l4, %l2, %l6
	.word	0xa23cc012	! t1_kref+0xb18:   	xnor	%l3, %l2, %l1
	.word	0x33480007	! t1_kref+0xb1c:   	fbe,a,pt	%fcc0, _kref+0xb38
	.word	0xb3a0053d	! t1_kref+0xb20:   	fsqrts	%f29, %f25
	.word	0x81ae8a4e	! t1_kref+0xb24:   	fcmpd	%fcc0, %f26, %f14
	.word	0xb9b68aeb	! t1_kref+0xb28:   	fpsub32s	%f26, %f11, %f28
	.word	0x31480005	! t1_kref+0xb2c:   	fba,a,pt	%fcc0, _kref+0xb40
	.word	0xc1f65012	! t1_kref+0xb30:   	casxa	[%i1]0x80, %l2, %g0
	.word	0xafb7049c	! t1_kref+0xb34:   	fcmple32	%f28, %f28, %l7
	.word	0xb7b00fe0	! t1_kref+0xb38:   	fones	%f27
	.word	0xe6266014	! t1_kref+0xb3c:   	st	%l3, [%i1 + 0x14]
	.word	0xeb20a024	! t1_kref+0xb40:   	st	%f21, [%g2 + 0x24]
	.word	0xa9a01a4c	! t1_kref+0xb44:   	fdtoi	%f12, %f20
	.word	0xa8548011	! t1_kref+0xb48:   	umul	%l2, %l1, %l4
	.word	0xc398a0c0	! t1_kref+0xb4c:   	ldda	[%g2 + 0xc0]%asi, %f32
	.word	0x8143e040	! t1_kref+0xb50:   	membar	0x40
	.word	0x933cc011	! t1_kref+0xb54:   	sra	%l3, %l1, %o1
	.word	0xc398a100	! t1_kref+0xb58:   	ldda	[%g2 + 0x100]%asi, %f32
	.word	0x96840013	! t1_kref+0xb5c:   	addcc	%l0, %l3, %o3
	.word	0x2b480003	! t1_kref+0xb60:   	fbug,a,pt	%fcc0, _kref+0xb6c
	.word	0x9da0104a	! t1_kref+0xb64:   	fdtox	%f10, %f14
	.word	0x81ae8adc	! t1_kref+0xb68:   	fcmped	%fcc0, %f26, %f28
	.word	0xa5a288da	! t1_kref+0xb6c:   	fsubd	%f10, %f26, %f18
	.word	0x878020d2	! t1_kref+0xb70:   	mov	0xd2, %asi
	.word	0xadb48f5a	! t1_kref+0xb74:   	fornot1	%f18, %f26, %f22
	.word	0xaba64939	! t1_kref+0xb78:   	fmuls	%f25, %f25, %f21
	.word	0x9db2875c	! t1_kref+0xb7c:   	fpack32	%f10, %f28, %f14
	.word	0xc168a0c1	! t1_kref+0xb80:   	prefetch	%g2 + 0xc1, 0
	.word	0x2c480003	! t1_kref+0xb84:   	bneg,a,pt	%icc, _kref+0xb90
	.word	0x291198e4	! t1_kref+0xb88:   	sethi	%hi(0x46639000), %l4
	.word	0x3b800002	! t1_kref+0xb8c:   	fble,a	_kref+0xb94
	.word	0x9da000ce	! t1_kref+0xb90:   	fnegd	%f14, %f14
	.word	0xe1be1810	! t1_kref+0xb94:   	stda	%f16, [%i0 + %l0]0xc0
	.word	0xb1a0053a	! t1_kref+0xb98:   	fsqrts	%f26, %f24
	.word	0xada00139	! t1_kref+0xb9c:   	fabss	%f25, %f22
	.word	0xa1a01118	! t1_kref+0xba0:   	fxtod	%f24, %f16
	.word	0xb5a0055e	! t1_kref+0xba4:   	fsqrtd	%f30, %f26
	.word	0xa3a0052d	! t1_kref+0xba8:   	fsqrts	%f13, %f17
	.word	0xd64e401a	! t1_kref+0xbac:   	ldsb	[%i1 + %i2], %o3
	.word	0xa5b34a6c	! t1_kref+0xbb0:   	fpadd32s	%f13, %f12, %f18
	.word	0xa0c40011	! t1_kref+0xbb4:   	addccc	%l0, %l1, %l0
	.word	0xac9c0010	! t1_kref+0xbb8:   	xorcc	%l0, %l0, %l6
	.word	0xa4f44011	! t1_kref+0xbbc:   	udivcc	%l1, %l1, %l2
	.word	0x94f44014	! t1_kref+0xbc0:   	udivcc	%l1, %l4, %o2
	.word	0xb1a349b1	! t1_kref+0xbc4:   	fdivs	%f13, %f17, %f24
	.word	0x81d8286a	! t1_kref+0xbc8:   	flush	%g0 + 0x86a
	.word	0xbba01893	! t1_kref+0xbcc:   	fitos	%f19, %f29
	.word	0xe82e0000	! t1_kref+0xbd0:   	stb	%l4, [%i0]
	.word	0x8034c010	! t1_kref+0xbd4:   	orn	%l3, %l0, %g0
	.word	0xf207bfe0	! t1_kref+0xbd8:   	ld	[%fp - 0x20], %i1
	.word	0xe968a102	! t1_kref+0xbdc:   	prefetch	%g2 + 0x102, 20
	.word	0x90b48013	! t1_kref+0xbe0:   	orncc	%l2, %l3, %o0
	.word	0x92bc8011	! t1_kref+0xbe4:   	xnorcc	%l2, %l1, %o1
	.word	0xe02e001a	! t1_kref+0xbe8:   	stb	%l0, [%i0 + %i2]
	.word	0xe84e8019	! t1_kref+0xbec:   	ldsb	[%i2 + %i1], %l4
	.word	0x28800005	! t1_kref+0xbf0:   	bleu,a	_kref+0xc04
	.word	0xa5a000b2	! t1_kref+0xbf4:   	fnegs	%f18, %f18
	.word	0x2c800002	! t1_kref+0xbf8:   	bneg,a	_kref+0xc00
	.word	0xaad4fe92	! t1_kref+0xbfc:   	umulcc	%l3, -0x16e, %l5
	.word	0xa0bce770	! t1_kref+0xc00:   	xnorcc	%l3, 0x770, %l0
	.word	0xea500019	! t1_kref+0xc04:   	ldsh	[%g0 + %i1], %l5
	.word	0xa49d288f	! t1_kref+0xc08:   	xorcc	%l4, 0x88f, %l2
	.word	0x23480008	! t1_kref+0xc0c:   	fbne,a,pt	%fcc0, _kref+0xc2c
	.word	0xe2267fe8	! t1_kref+0xc10:   	st	%l1, [%i1 - 0x18]
	.word	0xa5b58e80	! t1_kref+0xc14:   	fsrc1	%f22, %f18
	.word	0xee16401b	! t1_kref+0xc18:   	lduh	[%i1 + %i3], %l7
	.word	0xe1ee501a	! t1_kref+0xc1c:   	prefetcha	%i1 + %i2, 16
	.word	0xe2563fe2	! t1_kref+0xc20:   	ldsh	[%i0 - 0x1e], %l1
	.word	0x90fc8010	! t1_kref+0xc24:   	sdivcc	%l2, %l0, %o0
	.word	0x91400000	! t1_kref+0xc28:   	mov	%y, %o0
	.word	0xaa9c2e35	! t1_kref+0xc2c:   	xorcc	%l0, 0xe35, %l5
	.word	0xaa5c0013	! t1_kref+0xc30:   	smul	%l0, %l3, %l5
	.word	0xaca4a5d3	! t1_kref+0xc34:   	subcc	%l2, 0x5d3, %l6
	.word	0x2f3e72ef	! t1_kref+0xc38:   	sethi	%hi(0xf9cbbc00), %l7
	.word	0xec3e3ff0	! t1_kref+0xc3c:   	std	%l6, [%i0 - 0x10]
	.word	0x9f414000	! t1_kref+0xc40:   	mov	%pc, %o7
	.word	0x9fa0002b	! t1_kref+0xc44:   	fmovs	%f11, %f15
	.word	0x81ae8ad2	! t1_kref+0xc48:   	fcmped	%fcc0, %f26, %f18
	.word	0xd01e7ff0	! t1_kref+0xc4c:   	ldd	[%i1 - 0x10], %o0
	.word	0x99b00fc0	! t1_kref+0xc50:   	fone	%f12
	.word	0xad400000	! t1_kref+0xc54:   	mov	%y, %l6
	.word	0xc1e61011	! t1_kref+0xc58:   	casa	[%i0]0x80, %l1, %g0
	.word	0x30800006	! t1_kref+0xc5c:   	ba,a	_kref+0xc74
	.word	0xa485212c	! t1_kref+0xc60:   	addcc	%l4, 0x12c, %l2
	.word	0xb5a309d6	! t1_kref+0xc64:   	fdivd	%f12, %f22, %f26
	.word	0x9e048012	! t1_kref+0xc68:   	add	%l2, %l2, %o7
	.word	0x96fc0014	! t1_kref+0xc6c:   	sdivcc	%l0, %l4, %o3
	.word	0xe0f75019	! t1_kref+0xc70:   	stxa	%l0, [%i5 + %i1]0x80
	.word	0x13322536	! t1_kref+0xc74:   	sethi	%hi(0xc894d800), %o1
	.word	0xe4060000	! t1_kref+0xc78:   	ld	[%i0], %l2
	.word	0x9f414000	! t1_kref+0xc7c:   	mov	%pc, %o7
	.word	0x9a5cc010	! t1_kref+0xc80:   	smul	%l3, %l0, %o5
	.word	0xa5a00158	! t1_kref+0xc84:   	fabsd	%f24, %f18
	.word	0x81844000	! t1_kref+0xc88:   	wr	%l1, %g0, %y
	.word	0x2c800003	! t1_kref+0xc8c:   	bneg,a	_kref+0xc98
	.word	0x90c48011	! t1_kref+0xc90:   	addccc	%l2, %l1, %o0
	.word	0xaea44010	! t1_kref+0xc94:   	subcc	%l1, %l0, %l7
	.word	0xa3b440f3	! t1_kref+0xc98:   	edge16ln	%l1, %l3, %l1
	.word	0x90442bc6	! t1_kref+0xc9c:   	addc	%l0, 0xbc6, %o0
	.word	0xafa0012e	! t1_kref+0xca0:   	fabss	%f14, %f23
	.word	0xa9b50153	! t1_kref+0xca4:   	edge32l	%l4, %l3, %l4
	.word	0xc807bff0	! t1_kref+0xca8:   	ld	[%fp - 0x10], %g4
	.word	0xe8270019	! t1_kref+0xcac:   	st	%l4, [%i4 + %i1]
	.word	0xabb4cd36	! t1_kref+0xcb0:   	fandnot1s	%f19, %f22, %f21
	.word	0xb9b2ca3e	! t1_kref+0xcb4:   	fpadd16s	%f11, %f30, %f28
	.word	0xf9be1894	! t1_kref+0xcb8:   	stda	%f28, [%i0 + %l4]0xc4
	.word	0xd9be1a1a	! t1_kref+0xcbc:   	stda	%f12, [%i0 + %i2]0xd0
	.word	0xae3c66d8	! t1_kref+0xcc0:   	xnor	%l1, 0x6d8, %l7
	.word	0x9da00532	! t1_kref+0xcc4:   	fsqrts	%f18, %f14
	.word	0xd91fbe80	! t1_kref+0xcc8:   	ldd	[%fp - 0x180], %f12
	.word	0xada00550	! t1_kref+0xccc:   	fsqrtd	%f16, %f22
	.word	0x2e480004	! t1_kref+0xcd0:   	bvs,a,pt	%icc, _kref+0xce0
	.word	0x81844000	! t1_kref+0xcd4:   	wr	%l1, %g0, %y
	.word	0xe8264000	! t1_kref+0xcd8:   	st	%l4, [%i1]
	.word	0xa1a408b0	! t1_kref+0xcdc:   	fsubs	%f16, %f16, %f16
	.word	0xa0d47fc4	! t1_kref+0xce0:   	umulcc	%l1, -0x3c, %l0
	.word	0xb9b68a4c	! t1_kref+0xce4:   	fpadd32	%f26, %f12, %f28
	.word	0x81b3048e	! t1_kref+0xce8:   	fcmple32	%f12, %f14, %g0
	.word	0xa63cc011	! t1_kref+0xcec:   	xnor	%l3, %l1, %l3
	.word	0x80fc0014	! t1_kref+0xcf0:   	sdivcc	%l0, %l4, %g0
	.word	0xab344013	! t1_kref+0xcf4:   	srl	%l1, %l3, %l5
	.word	0xad3ce006	! t1_kref+0xcf8:   	sra	%l3, 0x6, %l6
	.word	0xd41e0000	! t1_kref+0xcfc:   	ldd	[%i0], %o2
	.word	0xa1a0013b	! t1_kref+0xd00:   	fabss	%f27, %f16
	.word	0xa6540014	! t1_kref+0xd04:   	umul	%l0, %l4, %l3
	.word	0xd41e3fe0	! t1_kref+0xd08:   	ldd	[%i0 - 0x20], %o2
	.word	0xde567fea	! t1_kref+0xd0c:   	ldsh	[%i1 - 0x16], %o7
	.word	0xe820a00c	! t1_kref+0xd10:   	st	%l4, [%g2 + 0xc]
	.word	0xa9a2cd3c	! t1_kref+0xd14:   	fsmuld	%f11, %f28, %f20
	.word	0x9a350011	! t1_kref+0xd18:   	orn	%l4, %l1, %o5
	.word	0x95240012	! t1_kref+0xd1c:   	mulscc	%l0, %l2, %o2
	.word	0xd80e7ffd	! t1_kref+0xd20:   	ldub	[%i1 - 3], %o4
	.word	0xadb58e6c	! t1_kref+0xd24:   	fxnors	%f22, %f12, %f22
	.word	0x95a01916	! t1_kref+0xd28:   	fitod	%f22, %f10
	.word	0x98e44011	! t1_kref+0xd2c:   	subccc	%l1, %l1, %o4
	.word	0x99b54a2e	! t1_kref+0xd30:   	fpadd16s	%f21, %f14, %f12
	.word	0x99b50131	! t1_kref+0xd34:   	edge32n	%l4, %l1, %o4
	.word	0xf9be501d	! t1_kref+0xd38:   	stda	%f28, [%i1 + %i5]0x80
	.word	0xc12e601c	! t1_kref+0xd3c:   	st	%fsr, [%i1 + 0x1c]
	.word	0x98a439c7	! t1_kref+0xd40:   	subcc	%l0, -0x639, %o4
	.word	0xe59e105d	! t1_kref+0xd44:   	ldda	[%i0 + %i5]0x82, %f18
	.word	0xc0ee501a	! t1_kref+0xd48:   	ldstuba	[%i1 + %i2]0x80, %g0
	.word	0x96550013	! t1_kref+0xd4c:   	umul	%l4, %l3, %o3
	.word	0xd26e8018	! t1_kref+0xd50:   	ldstub	[%i2 + %i0], %o1
	.word	0xadb68d8c	! t1_kref+0xd54:   	fxor	%f26, %f12, %f22
	.word	0x8143c000	! t1_kref+0xd58:   	stbar
	.word	0xb5a0013d	! t1_kref+0xd5c:   	fabss	%f29, %f26
	.word	0xa1b40c8c	! t1_kref+0xd60:   	fandnot2	%f16, %f12, %f16
	.word	0x99a000ae	! t1_kref+0xd64:   	fnegs	%f14, %f12
	.word	0xafb3851e	! t1_kref+0xd68:   	fcmpgt16	%f14, %f30, %l7
	.word	0xdb26001c	! t1_kref+0xd6c:   	st	%f13, [%i0 + %i4]
	.word	0x25480004	! t1_kref+0xd70:   	fblg,a,pt	%fcc0, _kref+0xd80
	.word	0xdedf5019	! t1_kref+0xd74:   	ldxa	[%i5 + %i1]0x80, %o7
	.word	0xd87e3fec	! t1_kref+0xd78:   	swap	[%i0 - 0x14], %o4
	.word	0xb1a0055c	! t1_kref+0xd7c:   	fsqrtd	%f28, %f24
	.word	0xa9a01037	! t1_kref+0xd80:   	fstox	%f23, %f20
	.word	0xb9a0054e	! t1_kref+0xd84:   	fsqrtd	%f14, %f28
	.word	0xf1b81019	! t1_kref+0xd88:   	stda	%f24, [%g0 + %i1]0x80
	.word	0xa5a4094c	! t1_kref+0xd8c:   	fmuld	%f16, %f12, %f18
	.word	0x80bd339a	! t1_kref+0xd90:   	xnorcc	%l4, -0xc66, %g0
	.word	0x9fa00130	! t1_kref+0xd94:   	fabss	%f16, %f15
	.word	0xaa350011	! t1_kref+0xd98:   	orn	%l4, %l1, %l5
	.word	0x98c4a0ed	! t1_kref+0xd9c:   	addccc	%l2, 0xed, %o4
	.word	0x9aace0f7	! t1_kref+0xda0:   	andncc	%l3, 0xf7, %o5
	.word	0xa25d0011	! t1_kref+0xda4:   	smul	%l4, %l1, %l1
	.word	0x803c36ee	! t1_kref+0xda8:   	xnor	%l0, -0x912, %g0
	.word	0xa9b40034	! t1_kref+0xdac:   	edge8n	%l0, %l4, %l4
	.word	0x8143c000	! t1_kref+0xdb0:   	stbar
	.word	0x81ab0a4c	! t1_kref+0xdb4:   	fcmpd	%fcc0, %f12, %f12
	.word	0xae64309f	! t1_kref+0xdb8:   	subc	%l0, -0xf61, %l7
	.word	0xabb44332	! t1_kref+0xdbc:   	bmask	%l1, %l2, %l5
	.word	0xd84e7fe2	! t1_kref+0xdc0:   	ldsb	[%i1 - 0x1e], %o4
	.word	0xe4086868	! t1_kref+0xdc4:   	ldub	[%g1 + 0x868], %l2
	.word	0xa41ca00c	! t1_kref+0xdc8:   	xor	%l2, 0xc, %l2
	.word	0xe4286868	! t1_kref+0xdcc:   	stb	%l2, [%g1 + 0x868]
	.word	0x81d86868	! t1_kref+0xdd0:   	flush	%g1 + 0x868
	.word	0xe4267ff0	! t1_kref+0xdd4:   	st	%l2, [%i1 - 0x10]
	.word	0xd83f4018	! t1_kref+0xdd8:   	std	%o4, [%i5 + %i0]
	.word	0x27480008	! t1_kref+0xddc:   	fbul,a,pt	%fcc0, _kref+0xdfc
	.word	0xafa0013a	! t1_kref+0xde0:   	fabss	%f26, %f23
	.word	0x99a289da	! t1_kref+0xde4:   	fdivd	%f10, %f26, %f12
	.word	0xe106401c	! t1_kref+0xde8:   	ld	[%i1 + %i4], %f16
	.word	0xe526001c	! t1_kref+0xdec:   	st	%f18, [%i0 + %i4]
	.word	0x92d4bcf7	! t1_kref+0xdf0:   	umulcc	%l2, -0x309, %o1
	.word	0xa914286d	! t1_kref+0xdf4:   	taddcctv	%l0, 0x86d, %l4
	.word	0xa5a589d8	! t1_kref+0xdf8:   	fdivd	%f22, %f24, %f18
	.word	0xa8548012	! t1_kref+0xdfc:   	umul	%l2, %l2, %l4
2:	.word	0xa1b30754	! t1_kref+0xe00:   	fpack32	%f12, %f20, %f16
	.word	0xb1a4c9ac	! t1_kref+0xe04:   	fdivs	%f19, %f12, %f24
	.word	0xe830a03e	! t1_kref+0xe08:   	sth	%l4, [%g2 + 0x3e]
	.word	0x9ba0053e	! t1_kref+0xe0c:   	fsqrts	%f30, %f13
	.word	0xa5b60efb	! t1_kref+0xe10:   	fornot2s	%f24, %f27, %f18
	.word	0x982c8014	! t1_kref+0xe14:   	andn	%l2, %l4, %o4
	.word	0xaa3c6e75	! t1_kref+0xe18:   	xnor	%l1, 0xe75, %l5
	.word	0x92fc8010	! t1_kref+0xe1c:   	sdivcc	%l2, %l0, %o1
	.word	0xa67c275c	! t1_kref+0xe20:   	sdiv	%l0, 0x75c, %l3
	.word	0xa42cc014	! t1_kref+0xe24:   	andn	%l3, %l4, %l2
	.word	0xf9bf1a19	! t1_kref+0xe28:   	stda	%f28, [%i4 + %i1]0xd0
	.word	0x96bcbc1b	! t1_kref+0xe2c:   	xnorcc	%l2, -0x3e5, %o3
	.word	0x90f4e15b	! t1_kref+0xe30:   	udivcc	%l3, 0x15b, %o0
	.word	0xe4f75018	! t1_kref+0xe34:   	stxa	%l2, [%i5 + %i0]0x80
	.word	0x9444f54e	! t1_kref+0xe38:   	addc	%l3, -0xab2, %o2
	.word	0x81ae8ad4	! t1_kref+0xe3c:   	fcmped	%fcc0, %f26, %f20
	.word	0x90ac4010	! t1_kref+0xe40:   	andncc	%l1, %l0, %o0
	.word	0x81b3850a	! t1_kref+0xe44:   	fcmpgt16	%f14, %f10, %g0
	.word	0xa4bd0010	! t1_kref+0xe48:   	xnorcc	%l4, %l0, %l2
	.word	0xa0246579	! t1_kref+0xe4c:   	sub	%l1, 0x579, %l0
	.word	0xad3c0012	! t1_kref+0xe50:   	sra	%l0, %l2, %l6
	.word	0xd91fbf08	! t1_kref+0xe54:   	ldd	[%fp - 0xf8], %f12
	.word	0x98ac0012	! t1_kref+0xe58:   	andncc	%l0, %l2, %o4
	.word	0x94440012	! t1_kref+0xe5c:   	addc	%l0, %l2, %o2
	.word	0x9ed48013	! t1_kref+0xe60:   	umulcc	%l2, %l3, %o7
	.word	0x29480008	! t1_kref+0xe64:   	fbl,a,pt	%fcc0, _kref+0xe84
	.word	0xedb81018	! t1_kref+0xe68:   	stda	%f22, [%g0 + %i0]0x80
	.word	0x99a018d0	! t1_kref+0xe6c:   	fdtos	%f16, %f12
	.word	0x92547f81	! t1_kref+0xe70:   	umul	%l1, -0x7f, %o1
	.word	0xe230a026	! t1_kref+0xe74:   	sth	%l1, [%g2 + 0x26]
	.word	0x94940011	! t1_kref+0xe78:   	orcc	%l0, %l1, %o2
	.word	0xa5a389d4	! t1_kref+0xe7c:   	fdivd	%f14, %f20, %f18
	.word	0xa7b44150	! t1_kref+0xe80:   	edge32l	%l1, %l0, %l3
	.word	0xa5400000	! t1_kref+0xe84:   	mov	%y, %l2
	.word	0xa5a689d8	! t1_kref+0xe88:   	fdivd	%f26, %f24, %f18
	.word	0x962cff6f	! t1_kref+0xe8c:   	andn	%l3, -0x91, %o3
	.word	0xe416401b	! t1_kref+0xe90:   	lduh	[%i1 + %i3], %l2
	.word	0xa93ca007	! t1_kref+0xe94:   	sra	%l2, 0x7, %l4
	.word	0x9db2c66b	! t1_kref+0xe98:   	fmul8x16au	%f11, %f11, %f14
	.word	0xa9a00533	! t1_kref+0xe9c:   	fsqrts	%f19, %f20
	.word	0xb1a000cc	! t1_kref+0xea0:   	fnegd	%f12, %f24
	.word	0x9db68a14	! t1_kref+0xea4:   	fpadd16	%f26, %f20, %f14
	.word	0xe04e3fee	! t1_kref+0xea8:   	ldsb	[%i0 - 0x12], %l0
	.word	0xb5a01a54	! t1_kref+0xeac:   	fdtoi	%f20, %f26
	.word	0x93b40152	! t1_kref+0xeb0:   	edge32l	%l0, %l2, %o1
	.word	0x1f2e7ac5	! t1_kref+0xeb4:   	sethi	%hi(0xb9eb1400), %o7
	.word	0xa21c8014	! t1_kref+0xeb8:   	xor	%l2, %l4, %l1
	.word	0xac74e567	! t1_kref+0xebc:   	udiv	%l3, 0x567, %l6
	.word	0xe4266008	! t1_kref+0xec0:   	st	%l2, [%i1 + 8]
	.word	0xa5a6084a	! t1_kref+0xec4:   	faddd	%f24, %f10, %f18
	.word	0xeb26200c	! t1_kref+0xec8:   	st	%f21, [%i0 + 0xc]
	.word	0xee4e600f	! t1_kref+0xecc:   	ldsb	[%i1 + 0xf], %l7
	.word	0xa6f50013	! t1_kref+0xed0:   	udivcc	%l4, %l3, %l3
	.word	0xb3a3c8bb	! t1_kref+0xed4:   	fsubs	%f15, %f27, %f25
	.word	0xa1400000	! t1_kref+0xed8:   	mov	%y, %l0
	.word	0x3d480004	! t1_kref+0xedc:   	fbule,a,pt	%fcc0, _kref+0xeec
	.word	0xf1be501d	! t1_kref+0xee0:   	stda	%f24, [%i1 + %i5]0x80
	.word	0xacbc3ced	! t1_kref+0xee4:   	xnorcc	%l0, -0x313, %l6
	.word	0xafa38939	! t1_kref+0xee8:   	fmuls	%f14, %f25, %f23
	.word	0x81b01021	! t1_kref+0xeec:   	siam	0x1
	.word	0xd87e3ffc	! t1_kref+0xef0:   	swap	[%i0 - 4], %o4
	.word	0xd720a024	! t1_kref+0xef4:   	st	%f11, [%g2 + 0x24]
	.word	0x93b50310	! t1_kref+0xef8:   	alignaddr	%l4, %l0, %o1
	.word	0xb9a48852	! t1_kref+0xefc:   	faddd	%f18, %f18, %f28
	.word	0x99b40240	! t1_kref+0xf00:   	array16	%l0, %g0, %o4
	.word	0xf320a03c	! t1_kref+0xf04:   	st	%f25, [%g2 + 0x3c]
	.word	0xf53e7ff8	! t1_kref+0xf08:   	std	%f26, [%i1 - 8]
	.word	0x9da0055a	! t1_kref+0xf0c:   	fsqrtd	%f26, %f14
	.word	0x9fb44013	! t1_kref+0xf10:   	edge8	%l1, %l3, %o7
	.word	0x23480004	! t1_kref+0xf14:   	fbne,a,pt	%fcc0, _kref+0xf24
	.word	0xa1a0054c	! t1_kref+0xf18:   	fsqrtd	%f12, %f16
	.word	0xa9b60490	! t1_kref+0xf1c:   	fcmple32	%f24, %f16, %l4
	.word	0x9eac0013	! t1_kref+0xf20:   	andncc	%l0, %l3, %o7
	.word	0xe906401c	! t1_kref+0xf24:   	ld	[%i1 + %i4], %f20
	.word	0x99a0055c	! t1_kref+0xf28:   	fsqrtd	%f28, %f12
	.word	0xe4d6101b	! t1_kref+0xf2c:   	ldsha	[%i0 + %i3]0x80, %l2
	.word	0xdd1e6000	! t1_kref+0xf30:   	ldd	[%i1], %f14
	.word	0xb7a0003d	! t1_kref+0xf34:   	fmovs	%f29, %f27
	.word	0x9eace00a	! t1_kref+0xf38:   	andncc	%l3, 0xa, %o7
	.word	0xe028a02d	! t1_kref+0xf3c:   	stb	%l0, [%g2 + 0x2d]
	.word	0xb5a00139	! t1_kref+0xf40:   	fabss	%f25, %f26
	.word	0x81ae8a5a	! t1_kref+0xf44:   	fcmpd	%fcc0, %f26, %f26
	.word	0x9f408000	! t1_kref+0xf48:   	mov	%ccr, %o7
	.word	0x9b400000	! t1_kref+0xf4c:   	mov	%y, %o5
	.word	0xb3a2c9b3	! t1_kref+0xf50:   	fdivs	%f11, %f19, %f25
	.word	0x8143c000	! t1_kref+0xf54:   	stbar
	.word	0xe830a00e	! t1_kref+0xf58:   	sth	%l4, [%g2 + 0xe]
	.word	0x9e748011	! t1_kref+0xf5c:   	udiv	%l2, %l1, %o7
	.word	0x31480002	! t1_kref+0xf60:   	fba,a,pt	%fcc0, _kref+0xf68
	.word	0x81dd3253	! t1_kref+0xf64:   	flush	%l4 - 0xdad
	.word	0x9a0c0014	! t1_kref+0xf68:   	and	%l0, %l4, %o5
	.word	0xe13f4018	! t1_kref+0xf6c:   	std	%f16, [%i5 + %i0]
	.word	0xac54e59e	! t1_kref+0xf70:   	umul	%l3, 0x59e, %l6
	.word	0x81ad0adc	! t1_kref+0xf74:   	fcmped	%fcc0, %f20, %f28
	.word	0xe8a01019	! t1_kref+0xf78:   	sta	%l4, [%g0 + %i1]0x80
	.word	0xaaf44013	! t1_kref+0xf7c:   	udivcc	%l1, %l3, %l5
	.word	0x9a3d263b	! t1_kref+0xf80:   	xnor	%l4, 0x63b, %o5
	.word	0xadb2c96b	! t1_kref+0xf84:   	fpmerge	%f11, %f11, %f22
	.word	0xe1263fec	! t1_kref+0xf88:   	st	%f16, [%i0 - 0x14]
	.word	0x962c704b	! t1_kref+0xf8c:   	andn	%l1, -0xfb5, %o3
	.word	0xd81f4018	! t1_kref+0xf90:   	ldd	[%i5 + %i0], %o4
	.word	0xfd20a02c	! t1_kref+0xf94:   	st	%f30, [%g2 + 0x2c]
	.word	0xf900a01c	! t1_kref+0xf98:   	ld	[%g2 + 0x1c], %f28
	.word	0xc807bff0	! t1_kref+0xf9c:   	ld	[%fp - 0x10], %g4
	.word	0xb5a00533	! t1_kref+0xfa0:   	fsqrts	%f19, %f26
	.word	0x9ebc0013	! t1_kref+0xfa4:   	xnorcc	%l0, %l3, %o7
	.word	0xea78a02c	! t1_kref+0xfa8:   	swap	[%g2 + 0x2c], %l5
	.word	0x90bd0011	! t1_kref+0xfac:   	xnorcc	%l4, %l1, %o0
	.word	0xa89c4011	! t1_kref+0xfb0:   	xorcc	%l1, %l1, %l4
	.word	0x8d844011	! t1_kref+0xfb4:   	wr	%l1, %l1, %fprs
	.word	0xeb06200c	! t1_kref+0xfb8:   	ld	[%i0 + 0xc], %f21
	.word	0x29480007	! t1_kref+0xfbc:   	fbl,a,pt	%fcc0, _kref+0xfd8
	.word	0xecff1019	! t1_kref+0xfc0:   	swapa	[%i4 + %i1]0x80, %l6
	.word	0xafb00cfd	! t1_kref+0xfc4:   	fnot2s	%f29, %f23
	.word	0xa9b74632	! t1_kref+0xfc8:   	fmul8x16	%f29, %f18, %f20
	.word	0xe16e001c	! t1_kref+0xfcc:   	prefetch	%i0 + %i4, 16
	.word	0xada78d39	! t1_kref+0xfd0:   	fsmuld	%f30, %f25, %f22
	.word	0xf5ee101c	! t1_kref+0xfd4:   	prefetcha	%i0 + %i4, 26
	.word	0x21030379	! t1_kref+0xfd8:   	sethi	%hi(0xc0de400), %l0
	.word	0x81ab8ada	! t1_kref+0xfdc:   	fcmped	%fcc0, %f14, %f26
	.word	0x90ac4011	! t1_kref+0xfe0:   	andncc	%l1, %l1, %o0
	.word	0xe82e7ffb	! t1_kref+0xfe4:   	stb	%l4, [%i1 - 5]
	.word	0xaba6c9bd	! t1_kref+0xfe8:   	fdivs	%f27, %f29, %f21
	.word	0xa9a0013d	! t1_kref+0xfec:   	fabss	%f29, %f20
	.word	0x27480003	! t1_kref+0xff0:   	fbul,a,pt	%fcc0, _kref+0xffc
	.word	0xe4264000	! t1_kref+0xff4:   	st	%l2, [%i1]
	.word	0xe02e8018	! t1_kref+0xff8:   	stb	%l0, [%i2 + %i0]
	.word	0x81aa8adc	! t1_kref+0xffc:   	fcmped	%fcc0, %f10, %f28
	.word	0xa1a509b3	! t1_kref+0x1000:   	fdivs	%f20, %f19, %f16
	.word	0xae242a7f	! t1_kref+0x1004:   	sub	%l0, 0xa7f, %l7
	.word	0xadb3044c	! t1_kref+0x1008:   	fcmpne16	%f12, %f12, %l6
	.word	0xaba0053b	! t1_kref+0x100c:   	fsqrts	%f27, %f21
	.word	0xee08a015	! t1_kref+0x1010:   	ldub	[%g2 + 0x15], %l7
	.word	0xea060000	! t1_kref+0x1014:   	ld	[%i0], %l5
	.word	0x81ae0a52	! t1_kref+0x1018:   	fcmpd	%fcc0, %f24, %f18
	.word	0x99b78750	! t1_kref+0x101c:   	fpack32	%f30, %f16, %f12
	.word	0xaef44010	! t1_kref+0x1020:   	udivcc	%l1, %l0, %l7
	.word	0xe028a014	! t1_kref+0x1024:   	stb	%l0, [%g2 + 0x14]
	.word	0xacfd215d	! t1_kref+0x1028:   	sdivcc	%l4, 0x15d, %l6
	.word	0x9a2cc011	! t1_kref+0x102c:   	andn	%l3, %l1, %o5
	.word	0xada3cd30	! t1_kref+0x1030:   	fsmuld	%f15, %f16, %f22
	.word	0x9bb5058e	! t1_kref+0x1034:   	fcmpgt32	%f20, %f14, %o5
	.word	0xfb063fe0	! t1_kref+0x1038:   	ld	[%i0 - 0x20], %f29
	.word	0x3d480002	! t1_kref+0x103c:   	fbule,a,pt	%fcc0, _kref+0x1044
	.word	0x9644a03a	! t1_kref+0x1040:   	addc	%l2, 0x3a, %o3
	.word	0x9e5c4013	! t1_kref+0x1044:   	smul	%l1, %l3, %o7
	.word	0xa1a3c8ae	! t1_kref+0x1048:   	fsubs	%f15, %f14, %f16
	.word	0x8143e040	! t1_kref+0x104c:   	membar	0x40
	.word	0x81ac0a5a	! t1_kref+0x1050:   	fcmpd	%fcc0, %f16, %f26
	.word	0x95050013	! t1_kref+0x1054:   	taddcc	%l4, %l3, %o2
	.word	0xb1a00552	! t1_kref+0x1058:   	fsqrtd	%f18, %f24
	.word	0xe420a034	! t1_kref+0x105c:   	st	%l2, [%g2 + 0x34]
	.word	0x8610200a	! t1_kref+0x1060:   	mov	0xa, %g3
	.word	0x86a0e001	! t1_kref+0x1064:   	subcc	%g3, 1, %g3
	.word	0x22800010	! t1_kref+0x1068:   	be,a	_kref+0x10a8
	.word	0xa6ac67f2	! t1_kref+0x106c:   	andncc	%l1, 0x7f2, %l3
	.word	0xc168a000	! t1_kref+0x1070:   	prefetch	%g2, 0
	.word	0xde480018	! t1_kref+0x1074:   	ldsb	[%g0 + %i0], %o7
	.word	0x965cc012	! t1_kref+0x1078:   	smul	%l3, %l2, %o3
	.word	0xaf3ca01b	! t1_kref+0x107c:   	sra	%l2, 0x1b, %l7
	.word	0xd87f0019	! t1_kref+0x1080:   	swap	[%i4 + %i1], %o4
	.word	0x9fc027a8	! t1_kref+0x1084:   	call	%g0 + 0x7a8
	.word	0x80a4ffa2	! t1_kref+0x1088:   	cmp	%l3, -0x5e
	.word	0xe7262004	! t1_kref+0x108c:   	st	%f19, [%i0 + 4]
	.word	0xa0c4f839	! t1_kref+0x1090:   	addccc	%l3, -0x7c7, %l0
	.word	0xa69cbb99	! t1_kref+0x1094:   	xorcc	%l2, -0x467, %l3
	.word	0xa7400000	! t1_kref+0x1098:   	mov	%y, %l3
	.word	0xd9be1851	! t1_kref+0x109c:   	stda	%f12, [%i0 + %l1]0xc2
	.word	0xaec4c013	! t1_kref+0x10a0:   	addccc	%l3, %l3, %l7
	.word	0x95b60f8c	! t1_kref+0x10a4:   	for	%f24, %f12, %f10
	.word	0x9db5899c	! t1_kref+0x10a8:   	bshuffle	%f22, %f28, %f14
	.word	0xaa2d0012	! t1_kref+0x10ac:   	andn	%l4, %l2, %l5
	.word	0xe420a03c	! t1_kref+0x10b0:   	st	%l2, [%g2 + 0x3c]
	.word	0x9b400000	! t1_kref+0x10b4:   	mov	%y, %o5
	.word	0xa3140014	! t1_kref+0x10b8:   	taddcctv	%l0, %l4, %l1
	.word	0xa5b6059c	! t1_kref+0x10bc:   	fcmpgt32	%f24, %f28, %l2
	.word	0xa615303e	! t1_kref+0x10c0:   	or	%l4, -0xfc2, %l3
	.word	0xc168a00b	! t1_kref+0x10c4:   	prefetch	%g2 + 0xb, 0
	.word	0x9454616b	! t1_kref+0x10c8:   	umul	%l1, 0x16b, %o2
	.word	0xd900a03c	! t1_kref+0x10cc:   	ld	[%g2 + 0x3c], %f12
	.word	0xd4167ffc	! t1_kref+0x10d0:   	lduh	[%i1 - 4], %o2
	.word	0xab350012	! t1_kref+0x10d4:   	srl	%l4, %l2, %l5
	.word	0xa6043487	! t1_kref+0x10d8:   	add	%l0, -0xb79, %l3
	.word	0xd0000018	! t1_kref+0x10dc:   	ld	[%g0 + %i0], %o0
	.word	0xe226401c	! t1_kref+0x10e0:   	st	%l1, [%i1 + %i4]
	.word	0xd83e3fe8	! t1_kref+0x10e4:   	std	%o4, [%i0 - 0x18]
	.word	0xabb4c174	! t1_kref+0x10e8:   	edge32ln	%l3, %l4, %l5
	call	SYM(t1_subr1)
	.word	0x989cf4a0	! t1_kref+0x10f0:   	xorcc	%l3, -0xb60, %o4
	.word	0x8143c000	! t1_kref+0x10f4:   	stbar
	.word	0xe4ee9019	! t1_kref+0x10f8:   	ldstuba	[%i2 + %i1]0x80, %l2
	.word	0xe830a01e	! t1_kref+0x10fc:   	sth	%l4, [%g2 + 0x1e]
	.word	0x9654fcfb	! t1_kref+0x1100:   	umul	%l3, -0x305, %o3
	.word	0x81ae0a56	! t1_kref+0x1104:   	fcmpd	%fcc0, %f24, %f22
	.word	0xb3a0013b	! t1_kref+0x1108:   	fabss	%f27, %f25
	.word	0xa53c6011	! t1_kref+0x110c:   	sra	%l1, 0x11, %l2
	.word	0x81ae8ada	! t1_kref+0x1110:   	fcmped	%fcc0, %f26, %f26
	.word	0xa4840010	! t1_kref+0x1114:   	addcc	%l0, %l0, %l2
	.word	0x81848000	! t1_kref+0x1118:   	wr	%l2, %g0, %y
	.word	0x81848000	! t1_kref+0x111c:   	wr	%l2, %g0, %y
	.word	0x81840000	! t1_kref+0x1120:   	wr	%l0, %g0, %y
	.word	0x925c8012	! t1_kref+0x1124:   	smul	%l2, %l2, %o1
	.word	0xec9f5019	! t1_kref+0x1128:   	ldda	[%i5 + %i1]0x80, %l6
	.word	0x9af470b9	! t1_kref+0x112c:   	udivcc	%l1, -0xf47, %o5
	.word	0xe28e9040	! t1_kref+0x1130:   	lduba	[%i2]0x82, %l1
	.word	0x99a0054e	! t1_kref+0x1134:   	fsqrtd	%f14, %f12
	.word	0xe420a014	! t1_kref+0x1138:   	st	%l2, [%g2 + 0x14]
	.word	0xe828a027	! t1_kref+0x113c:   	stb	%l4, [%g2 + 0x27]
	.word	0xa5b6874e	! t1_kref+0x1140:   	fpack32	%f26, %f14, %f18
	.word	0xaebd0012	! t1_kref+0x1144:   	xnorcc	%l4, %l2, %l7
	.word	0xe8280018	! t1_kref+0x1148:   	stb	%l4, [%g0 + %i0]
	.word	0xd83e3ff0	! t1_kref+0x114c:   	std	%o4, [%i0 - 0x10]
	.word	0xe9066004	! t1_kref+0x1150:   	ld	[%i1 + 4], %f20
	.word	0xa444c011	! t1_kref+0x1154:   	addc	%l3, %l1, %l2
	.word	0xd8380019	! t1_kref+0x1158:   	std	%o4, [%g0 + %i1]
	.word	0xd60e6016	! t1_kref+0x115c:   	ldub	[%i1 + 0x16], %o3
	.word	0xa5a00131	! t1_kref+0x1160:   	fabss	%f17, %f18
	.word	0xe668a03f	! t1_kref+0x1164:   	ldstub	[%g2 + 0x3f], %l3
	.word	0xe830a036	! t1_kref+0x1168:   	sth	%l4, [%g2 + 0x36]
	.word	0xef20a03c	! t1_kref+0x116c:   	st	%f23, [%g2 + 0x3c]
	.word	0x81ac0a54	! t1_kref+0x1170:   	fcmpd	%fcc0, %f16, %f20
	.word	0xa6a4a3bd	! t1_kref+0x1174:   	subcc	%l2, 0x3bd, %l3
	.word	0x81df401c	! t1_kref+0x1178:   	flush	%i5 + %i4
	.word	0xa09c67a9	! t1_kref+0x117c:   	xorcc	%l1, 0x7a9, %l0
	.word	0xaf3ce003	! t1_kref+0x1180:   	sra	%l3, 0x3, %l7
	.word	0xe1be5a1d	! t1_kref+0x1184:   	stda	%f16, [%i1 + %i5]0xd0
	.word	0xa5b009bc	! t1_kref+0x1188:   	fexpand	%f28, %f18
	.word	0x98d44011	! t1_kref+0x118c:   	umulcc	%l1, %l1, %o4
	.word	0x90b48014	! t1_kref+0x1190:   	orncc	%l2, %l4, %o0
	.word	0xa1a5892b	! t1_kref+0x1194:   	fmuls	%f22, %f11, %f16
	.word	0xb7b5cdf6	! t1_kref+0x1198:   	fnands	%f23, %f22, %f27
	.word	0x90dd0010	! t1_kref+0x119c:   	smulcc	%l4, %l0, %o0
	.word	0xa5a5cd2c	! t1_kref+0x11a0:   	fsmuld	%f23, %f12, %f18
	.word	0xaa5c0011	! t1_kref+0x11a4:   	smul	%l0, %l1, %l5
	.word	0x9fc00004	! t1_kref+0x11a8:   	call	%g0 + %g4
	.word	0xc12e2004	! t1_kref+0x11ac:   	st	%fsr, [%i0 + 4]
	.word	0x811d0011	! t1_kref+0x11b0:   	tsubcctv	%l4, %l1, %g0
	.word	0x1b0d1cc9	! t1_kref+0x11b4:   	sethi	%hi(0x34732400), %o5
	.word	0x81ab8a50	! t1_kref+0x11b8:   	fcmpd	%fcc0, %f14, %f16
	.word	0xd66e3fe8	! t1_kref+0x11bc:   	ldstub	[%i0 - 0x18], %o3
	.word	0xa0d425ed	! t1_kref+0x11c0:   	umulcc	%l0, 0x5ed, %l0
	.word	0xac34b4f0	! t1_kref+0x11c4:   	orn	%l2, -0xb10, %l6
	.word	0xbda389d6	! t1_kref+0x11c8:   	fdivd	%f14, %f22, %f30
	.word	0xe11e3ff8	! t1_kref+0x11cc:   	ldd	[%i0 - 8], %f16
	.word	0xf91fbee0	! t1_kref+0x11d0:   	ldd	[%fp - 0x120], %f28
	.word	0xb5a00558	! t1_kref+0x11d4:   	fsqrtd	%f24, %f26
	.word	0xe7f61011	! t1_kref+0x11d8:   	casxa	[%i0]0x80, %l1, %l3
	.word	0x81ae0a33	! t1_kref+0x11dc:   	fcmps	%fcc0, %f24, %f19
	.word	0x81aa8ace	! t1_kref+0x11e0:   	fcmped	%fcc0, %f10, %f14
	.word	0x9fa588b1	! t1_kref+0x11e4:   	fsubs	%f22, %f17, %f15
	.word	0xa6140010	! t1_kref+0x11e8:   	or	%l0, %l0, %l3
	.word	0x3f800001	! t1_kref+0x11ec:   	fbo,a	_kref+0x11f0
	.word	0x90a4c010	! t1_kref+0x11f0:   	subcc	%l3, %l0, %o0
	.word	0xa1a588b3	! t1_kref+0x11f4:   	fsubs	%f22, %f19, %f16
	.word	0xb1a00039	! t1_kref+0x11f8:   	fmovs	%f25, %f24
	.word	0xab400000	! t1_kref+0x11fc:   	mov	%y, %l5
	.word	0xa3a0053d	! t1_kref+0x1200:   	fsqrts	%f29, %f17
	.word	0x97b4c131	! t1_kref+0x1204:   	edge32n	%l3, %l1, %o3
	.word	0xe800a004	! t1_kref+0x1208:   	ld	[%g2 + 4], %l4
	.word	0xeace9059	! t1_kref+0x120c:   	ldsba	[%i2 + %i1]0x82, %l5
	.word	0x95b587da	! t1_kref+0x1210:   	pdist	%f22, %f26, %f10
	.word	0xdd3e7fe8	! t1_kref+0x1214:   	std	%f14, [%i1 - 0x18]
	.word	0x9bb4c073	! t1_kref+0x1218:   	edge8ln	%l3, %l3, %o5
	.word	0xa9b4467e	! t1_kref+0x121c:   	fmul8x16au	%f17, %f30, %f20
	.word	0xb5a00152	! t1_kref+0x1220:   	fabsd	%f18, %f26
	.word	0x94dc0014	! t1_kref+0x1224:   	smulcc	%l0, %l4, %o2
	.word	0xb3a348ac	! t1_kref+0x1228:   	fsubs	%f13, %f12, %f25
	.word	0xa5a0190c	! t1_kref+0x122c:   	fitod	%f12, %f18
	.word	0xe82e4000	! t1_kref+0x1230:   	stb	%l4, [%i1]
	.word	0x993c8014	! t1_kref+0x1234:   	sra	%l2, %l4, %o4
	.word	0xbda00132	! t1_kref+0x1238:   	fabss	%f18, %f30
	.word	0xa5b2c714	! t1_kref+0x123c:   	fmuld8sux16	%f11, %f20, %f18
	.word	0xa4d48010	! t1_kref+0x1240:   	umulcc	%l2, %l0, %l2
	.word	0x9da3cd3b	! t1_kref+0x1244:   	fsmuld	%f15, %f27, %f14
	.word	0x80944014	! t1_kref+0x1248:   	orcc	%l1, %l4, %g0
	.word	0x963465bf	! t1_kref+0x124c:   	orn	%l1, 0x5bf, %o3
	.word	0x95b68e1c	! t1_kref+0x1250:   	fand	%f26, %f28, %f10
	.word	0xea4e001a	! t1_kref+0x1254:   	ldsb	[%i0 + %i2], %l5
	.word	0xe0780018	! t1_kref+0x1258:   	swap	[%g0 + %i0], %l0
	sethi	%hi(2f), %o7
	.word	0xe40be2ac	! t1_kref+0x1260:   	ldub	[%o7 + 0x2ac], %l2
	.word	0xa41ca00c	! t1_kref+0x1264:   	xor	%l2, 0xc, %l2
	.word	0xe42be2ac	! t1_kref+0x1268:   	stb	%l2, [%o7 + 0x2ac]
	.word	0x81dbe2ac	! t1_kref+0x126c:   	flush	%o7 + 0x2ac
	.word	0xb5b74ef7	! t1_kref+0x1270:   	fornot2s	%f29, %f23, %f26
	.word	0x9a7cbfc1	! t1_kref+0x1274:   	sdiv	%l2, -0x3f, %o5
	.word	0x94fce9cb	! t1_kref+0x1278:   	sdivcc	%l3, 0x9cb, %o2
	.word	0x94f52708	! t1_kref+0x127c:   	udivcc	%l4, 0x708, %o2
	.word	0x92444010	! t1_kref+0x1280:   	addc	%l1, %l0, %o1
	.word	0xa4a476e7	! t1_kref+0x1284:   	subcc	%l1, -0x919, %l2
	.word	0x9fa00133	! t1_kref+0x1288:   	fabss	%f19, %f15
	.word	0xe96e7fe8	! t1_kref+0x128c:   	prefetch	%i1 - 0x18, 20
	.word	0xa2bc32ff	! t1_kref+0x1290:   	xnorcc	%l0, -0xd01, %l1
	.word	0xa45cb388	! t1_kref+0x1294:   	smul	%l2, -0xc78, %l2
	.word	0x8143c000	! t1_kref+0x1298:   	stbar
	.word	0xc12e6004	! t1_kref+0x129c:   	st	%fsr, [%i1 + 4]
	.word	0x95b706ac	! t1_kref+0x12a0:   	fmul8x16al	%f28, %f12, %f10
	.word	0x9624eb3d	! t1_kref+0x12a4:   	sub	%l3, 0xb3d, %o3
	.word	0x969cb0f1	! t1_kref+0x12a8:   	xorcc	%l2, -0xf0f, %o3
2:	.word	0x93b44132	! t1_kref+0x12ac:   	edge32n	%l1, %l2, %o1
	.word	0x20800004	! t1_kref+0x12b0:   	bn,a	_kref+0x12c0
	.word	0xaba01a56	! t1_kref+0x12b4:   	fdtoi	%f22, %f21
	.word	0xaa8cc012	! t1_kref+0x12b8:   	andcc	%l3, %l2, %l5
	.word	0xe028a005	! t1_kref+0x12bc:   	stb	%l0, [%g2 + 5]
	.word	0xeb070018	! t1_kref+0x12c0:   	ld	[%i4 + %i0], %f21
	.word	0xa1a609b4	! t1_kref+0x12c4:   	fdivs	%f24, %f20, %f16
	.word	0xa1b400b0	! t1_kref+0x12c8:   	edge16n	%l0, %l0, %l0
	.word	0x81db0012	! t1_kref+0x12cc:   	flush	%o4 + %l2
	.word	0xa8146691	! t1_kref+0x12d0:   	or	%l1, 0x691, %l4
	.word	0xaec50010	! t1_kref+0x12d4:   	addccc	%l4, %l0, %l7
	.word	0x94ac8011	! t1_kref+0x12d8:   	andncc	%l2, %l1, %o2
	.word	0xa29d3c45	! t1_kref+0x12dc:   	xorcc	%l4, -0x3bb, %l1
	.word	0x9fa01a4e	! t1_kref+0x12e0:   	fdtoi	%f14, %f15
	.word	0xa314f7ac	! t1_kref+0x12e4:   	taddcctv	%l3, -0x854, %l1
	.word	0x96f4b919	! t1_kref+0x12e8:   	udivcc	%l2, -0x6e7, %o3
	.word	0x97b48031	! t1_kref+0x12ec:   	edge8n	%l2, %l1, %o3
	.word	0x9db406cc	! t1_kref+0x12f0:   	fmul8sux16	%f16, %f12, %f14
	.word	0x95b50130	! t1_kref+0x12f4:   	edge32n	%l4, %l0, %o2
	.word	0xadb009ad	! t1_kref+0x12f8:   	fexpand	%f13, %f22
	.word	0xa85c8013	! t1_kref+0x12fc:   	smul	%l2, %l3, %l4
	.word	0x99a409cc	! t1_kref+0x1300:   	fdivd	%f16, %f12, %f12
	.word	0xa9a00134	! t1_kref+0x1304:   	fabss	%f20, %f20
	.word	0xa6d44014	! t1_kref+0x1308:   	umulcc	%l1, %l4, %l3
	.word	0x9e5d0013	! t1_kref+0x130c:   	smul	%l4, %l3, %o7
	.word	0xa9b60a6d	! t1_kref+0x1310:   	fpadd32s	%f24, %f13, %f20
	.word	0xa1a2cd36	! t1_kref+0x1314:   	fsmuld	%f11, %f22, %f16
	.word	0x98f4674a	! t1_kref+0x1318:   	udivcc	%l1, 0x74a, %o4
	.word	0x81dafd68	! t1_kref+0x131c:   	flush	%o3 - 0x298
	.word	0x800c2929	! t1_kref+0x1320:   	and	%l0, 0x929, %g0
	.word	0x96246d01	! t1_kref+0x1324:   	sub	%l1, 0xd01, %o3
	.word	0xa5a00539	! t1_kref+0x1328:   	fsqrts	%f25, %f18
	.word	0x9940c000	! t1_kref+0x132c:   	mov	%asi, %o4
	.word	0x3f480006	! t1_kref+0x1330:   	fbo,a,pt	%fcc0, _kref+0x1348
	.word	0xadb50154	! t1_kref+0x1334:   	edge32l	%l4, %l4, %l6
	.word	0xf9be1851	! t1_kref+0x1338:   	stda	%f28, [%i0 + %l1]0xc2
	.word	0x990c8012	! t1_kref+0x133c:   	tsubcc	%l2, %l2, %o4
	.word	0xe27e001c	! t1_kref+0x1340:   	swap	[%i0 + %i4], %l1
	.word	0x9044c013	! t1_kref+0x1344:   	addc	%l3, %l3, %o0
	.word	0xbda01058	! t1_kref+0x1348:   	fdtox	%f24, %f30
	.word	0xb3a018d8	! t1_kref+0x134c:   	fdtos	%f24, %f25
	.word	0x9fc00004	! t1_kref+0x1350:   	call	%g0 + %g4
	.word	0x94ac3707	! t1_kref+0x1354:   	andncc	%l0, -0x8f9, %o2
	.word	0x951c8011	! t1_kref+0x1358:   	tsubcctv	%l2, %l1, %o2
	.word	0xb7b00770	! t1_kref+0x135c:   	fpack16	%f16, %f27
	.word	0x81df001e	! t1_kref+0x1360:   	flush	%i4 + %fp
	.word	0xd81e6018	! t1_kref+0x1364:   	ldd	[%i1 + 0x18], %o4
	.word	0x9fb70494	! t1_kref+0x1368:   	fcmple32	%f28, %f20, %o7
	.word	0xfb270018	! t1_kref+0x136c:   	st	%f29, [%i4 + %i0]
	.word	0x81ad8aca	! t1_kref+0x1370:   	fcmped	%fcc0, %f22, %f10
	.word	0xe67e6004	! t1_kref+0x1374:   	swap	[%i1 + 4], %l3
	.word	0xb1b2c67a	! t1_kref+0x1378:   	fmul8x16au	%f11, %f26, %f24
	.word	0x81848000	! t1_kref+0x137c:   	wr	%l2, %g0, %y
	.word	0xd06e001a	! t1_kref+0x1380:   	ldstub	[%i0 + %i2], %o0
	.word	0xf19f5a18	! t1_kref+0x1384:   	ldda	[%i5 + %i0]0xd0, %f24
	.word	0xb9a50d35	! t1_kref+0x1388:   	fsmuld	%f20, %f21, %f28
	.word	0x98f4a8ef	! t1_kref+0x138c:   	udivcc	%l2, 0x8ef, %o4
	.word	0xa9a6095c	! t1_kref+0x1390:   	fmuld	%f24, %f28, %f20
	.word	0x8143c000	! t1_kref+0x1394:   	stbar
	.word	0x96ac8010	! t1_kref+0x1398:   	andncc	%l2, %l0, %o3
	.word	0x929d0010	! t1_kref+0x139c:   	xorcc	%l4, %l0, %o1
	.word	0x80a43b1b	! t1_kref+0x13a0:   	cmp	%l0, -0x4e5
	.word	0xc050a034	! t1_kref+0x13a4:   	ldsh	[%g2 + 0x34], %g0
	.word	0xa5a3094e	! t1_kref+0x13a8:   	fmuld	%f12, %f14, %f18
	.word	0x93b40556	! t1_kref+0x13ac:   	fcmpeq16	%f16, %f22, %o1
	.word	0xadb00c20	! t1_kref+0x13b0:   	fzeros	%f22
	.word	0xac54c011	! t1_kref+0x13b4:   	umul	%l3, %l1, %l6
	.word	0x90753b6c	! t1_kref+0x13b8:   	udiv	%l4, -0x494, %o0
	.word	0x94fc766e	! t1_kref+0x13bc:   	sdivcc	%l1, -0x992, %o2
	.word	0xb1a50956	! t1_kref+0x13c0:   	fmuld	%f20, %f22, %f24
	.word	0xd83e2008	! t1_kref+0x13c4:   	std	%o4, [%i0 + 8]
	.word	0xa49cc010	! t1_kref+0x13c8:   	xorcc	%l3, %l0, %l2
	.word	0xa9b34737	! t1_kref+0x13cc:   	fmuld8ulx16	%f13, %f23, %f20
	.word	0xa5b68c92	! t1_kref+0x13d0:   	fandnot2	%f26, %f18, %f18
	.word	0xb9a0190b	! t1_kref+0x13d4:   	fitod	%f11, %f28
	.word	0xef06401c	! t1_kref+0x13d8:   	ld	[%i1 + %i4], %f23
	.word	0x39480001	! t1_kref+0x13dc:   	fbuge,a,pt	%fcc0, _kref+0x13e0
	.word	0xdd063ff0	! t1_kref+0x13e0:   	ld	[%i0 - 0x10], %f14
	.word	0xe7e61013	! t1_kref+0x13e4:   	casa	[%i0]0x80, %l3, %l3
	.word	0x99a01915	! t1_kref+0x13e8:   	fitod	%f21, %f12
	.word	0xe0562010	! t1_kref+0x13ec:   	ldsh	[%i0 + 0x10], %l0
	.word	0xadb48a9c	! t1_kref+0x13f0:   	fpsub16	%f18, %f28, %f22
	.word	0xa9a508ad	! t1_kref+0x13f4:   	fsubs	%f20, %f13, %f20
	.word	0xb1a00558	! t1_kref+0x13f8:   	fsqrtd	%f24, %f24
	.word	0xadb486ce	! t1_kref+0x13fc:   	fmul8sux16	%f18, %f14, %f22
	.word	0xad1ca60a	! t1_kref+0x1400:   	tsubcctv	%l2, 0x60a, %l6
	.word	0x9f400000	! t1_kref+0x1404:   	mov	%y, %o7
	.word	0x80a48011	! t1_kref+0x1408:   	cmp	%l2, %l1
	.word	0xd01e2018	! t1_kref+0x140c:   	ldd	[%i0 + 0x18], %o0
	.word	0x81aeca3b	! t1_kref+0x1410:   	fcmps	%fcc0, %f27, %f27
	.word	0x8143e058	! t1_kref+0x1414:   	membar	0x58
	.word	0xa0d4c012	! t1_kref+0x1418:   	umulcc	%l3, %l2, %l0
	.word	0x953ca008	! t1_kref+0x141c:   	sra	%l2, 0x8, %o2
	.word	0x92553f87	! t1_kref+0x1420:   	umul	%l4, -0x79, %o1
	.word	0xb7b6ce7a	! t1_kref+0x1424:   	fxnors	%f27, %f26, %f27
	.word	0x81dde074	! t1_kref+0x1428:   	flush	%l7 + 0x74
	.word	0x8184c000	! t1_kref+0x142c:   	wr	%l3, %g0, %y
	.word	0x9b247858	! t1_kref+0x1430:   	mulscc	%l1, -0x7a8, %o5
	.word	0xed3e6008	! t1_kref+0x1434:   	std	%f22, [%i1 + 8]
	.word	0x8610200a	! t1_kref+0x1438:   	mov	0xa, %g3
	.word	0x86a0e001	! t1_kref+0x143c:   	subcc	%g3, 1, %g3
	.word	0x2280001b	! t1_kref+0x1440:   	be,a	_kref+0x14ac
	.word	0xbba0053c	! t1_kref+0x1444:   	fsqrts	%f28, %f29
	.word	0xa1400000	! t1_kref+0x1448:   	mov	%y, %l0
	.word	0xac142568	! t1_kref+0x144c:   	or	%l0, 0x568, %l6
	.word	0xb5a000d2	! t1_kref+0x1450:   	fnegd	%f18, %f26
	.word	0xb5b58a14	! t1_kref+0x1454:   	fpadd16	%f22, %f20, %f26
	.word	0xe4266008	! t1_kref+0x1458:   	st	%l2, [%i1 + 8]
	.word	0xa6d4a4b1	! t1_kref+0x145c:   	umulcc	%l2, 0x4b1, %l3
	.word	0x9244ec2a	! t1_kref+0x1460:   	addc	%l3, 0xc2a, %o1
	.word	0x2c480008	! t1_kref+0x1464:   	bneg,a,pt	%icc, _kref+0x1484
	.word	0xe8260000	! t1_kref+0x1468:   	st	%l4, [%i0]
	.word	0x81ab0ad4	! t1_kref+0x146c:   	fcmped	%fcc0, %f12, %f20
	.word	0x8143c000	! t1_kref+0x1470:   	stbar
	.word	0xadb00f14	! t1_kref+0x1474:   	fsrc2	%f20, %f22
	.word	0xb5a00554	! t1_kref+0x1478:   	fsqrtd	%f20, %f26
	.word	0xa5b40150	! t1_kref+0x147c:   	edge32l	%l0, %l0, %l2
	.word	0xe456200a	! t1_kref+0x1480:   	ldsh	[%i0 + 0xa], %l2
	.word	0xa6350011	! t1_kref+0x1484:   	orn	%l4, %l1, %l3
	.word	0x9efd0014	! t1_kref+0x1488:   	sdivcc	%l4, %l4, %o7
	.word	0xe6f6101d	! t1_kref+0x148c:   	stxa	%l3, [%i0 + %i5]0x80
	.word	0xb9b6070d	! t1_kref+0x1490:   	fmuld8sux16	%f24, %f13, %f28
	.word	0x98f4b3ca	! t1_kref+0x1494:   	udivcc	%l2, -0xc36, %o4
	.word	0x9fa00537	! t1_kref+0x1498:   	fsqrts	%f23, %f15
	.word	0x9fc10000	! t1_kref+0x149c:   	call	%g4
	.word	0xdd1f4019	! t1_kref+0x14a0:   	ldd	[%i5 + %i1], %f14
	.word	0x2bbfffe6	! t1_kref+0x14a4:   	fbug,a	_kref+0x143c
	.word	0x95344010	! t1_kref+0x14a8:   	srl	%l1, %l0, %o2
	.word	0xa0453b29	! t1_kref+0x14ac:   	addc	%l4, -0x4d7, %l0
	.word	0xb9b28a94	! t1_kref+0x14b0:   	fpsub16	%f10, %f20, %f28
	.word	0x9f414000	! t1_kref+0x14b4:   	mov	%pc, %o7
	.word	0xa1a78858	! t1_kref+0x14b8:   	faddd	%f30, %f24, %f16
	.word	0xa2550011	! t1_kref+0x14bc:   	umul	%l4, %l1, %l1
	.word	0xac14c012	! t1_kref+0x14c0:   	or	%l3, %l2, %l6
	.word	0xa3b400b2	! t1_kref+0x14c4:   	edge16n	%l0, %l2, %l1
	.word	0xa9a00535	! t1_kref+0x14c8:   	fsqrts	%f21, %f20
	.word	0xa1a0103b	! t1_kref+0x14cc:   	fstox	%f27, %f16
	.word	0x801cf890	! t1_kref+0x14d0:   	xor	%l3, -0x770, %g0
	.word	0x9fc00004	! t1_kref+0x14d4:   	call	%g0 + %g4
	.word	0x001fffff	! t1_kref+0x14d8:   	illtrap	0x1fffff
	.word	0x81ac8ade	! t1_kref+0x14dc:   	fcmped	%fcc0, %f18, %f30
	.word	0xe9be5a1b	! t1_kref+0x14e0:   	stda	%f20, [%i1 + %i3]0xd0
	.word	0xe520a024	! t1_kref+0x14e4:   	st	%f18, [%g2 + 0x24]
	.word	0xa1a0013d	! t1_kref+0x14e8:   	fabss	%f29, %f16
	.word	0xd86e8019	! t1_kref+0x14ec:   	ldstub	[%i2 + %i1], %o4
	.word	0xa5b50e0e	! t1_kref+0x14f0:   	fand	%f20, %f14, %f18
	.word	0x33480003	! t1_kref+0x14f4:   	fbe,a,pt	%fcc0, _kref+0x1500
	.word	0xf926001c	! t1_kref+0x14f8:   	st	%f28, [%i0 + %i4]
	.word	0x9e14c011	! t1_kref+0x14fc:   	or	%l3, %l1, %o7
	.word	0xabb48a37	! t1_kref+0x1500:   	fpadd16s	%f18, %f23, %f21
	.word	0x95a000da	! t1_kref+0x1504:   	fnegd	%f26, %f10
	.word	0xc768a008	! t1_kref+0x1508:   	prefetch	%g2 + 8, 3
	.word	0xb5a0055e	! t1_kref+0x150c:   	fsqrtd	%f30, %f26
	.word	0xadb60ad8	! t1_kref+0x1510:   	fpsub32	%f24, %f24, %f22
	.word	0xe62e3fe9	! t1_kref+0x1514:   	stb	%l3, [%i0 - 0x17]
	.word	0xb9a38937	! t1_kref+0x1518:   	fmuls	%f14, %f23, %f28
	.word	0x9fc00004	! t1_kref+0x151c:   	call	%g0 + %g4
	.word	0xafb40014	! t1_kref+0x1520:   	edge8	%l0, %l4, %l7
	.word	0x928c73f2	! t1_kref+0x1524:   	andcc	%l1, -0xc0e, %o1
	.word	0x97b30a32	! t1_kref+0x1528:   	fpadd16s	%f12, %f18, %f11
	.word	0xa4544013	! t1_kref+0x152c:   	umul	%l1, %l3, %l2
	.word	0xf83e401d	! t1_kref+0x1530:   	std	%i4, [%i1 + %i5]
	.word	0xe226001c	! t1_kref+0x1534:   	st	%l1, [%i0 + %i4]
	.word	0x23480005	! t1_kref+0x1538:   	fbne,a,pt	%fcc0, _kref+0x154c
	.word	0xec180019	! t1_kref+0x153c:   	ldd	[%g0 + %i1], %l6
	.word	0x97a0052e	! t1_kref+0x1540:   	fsqrts	%f14, %f11
	.word	0x9fc00004	! t1_kref+0x1544:   	call	%g0 + %g4
	.word	0xadb304d4	! t1_kref+0x1548:   	fcmpne32	%f12, %f20, %l6
	.word	0x9fa0052d	! t1_kref+0x154c:   	fsqrts	%f13, %f15
	.word	0xbdb68d8e	! t1_kref+0x1550:   	fxor	%f26, %f14, %f30
	.word	0xa4fd0010	! t1_kref+0x1554:   	sdivcc	%l4, %l0, %l2
	.word	0xef68a005	! t1_kref+0x1558:   	prefetch	%g2 + 5, 23
	.word	0xa3b44134	! t1_kref+0x155c:   	edge32n	%l1, %l4, %l1
	.word	0xe1beda19	! t1_kref+0x1560:   	stda	%f16, [%i3 + %i1]0xd0
	.word	0x98c53307	! t1_kref+0x1564:   	addccc	%l4, -0xcf9, %o4
	.word	0xed1fbec8	! t1_kref+0x1568:   	ldd	[%fp - 0x138], %f22
	.word	0x9454edd8	! t1_kref+0x156c:   	umul	%l3, 0xdd8, %o2
	.word	0xd47e7ff4	! t1_kref+0x1570:   	swap	[%i1 - 0xc], %o2
	.word	0xa1a018d4	! t1_kref+0x1574:   	fdtos	%f20, %f16
	.word	0x3d800002	! t1_kref+0x1578:   	fbule,a	_kref+0x1580
	.word	0xd01e3fe8	! t1_kref+0x157c:   	ldd	[%i0 - 0x18], %o0
	.word	0xafb400f3	! t1_kref+0x1580:   	edge16ln	%l0, %l3, %l7
	.word	0x940531d8	! t1_kref+0x1584:   	add	%l4, -0xe28, %o2
	.word	0x9de3bfa0	! t1_kref+0x1588:   	save	%sp, -0x60, %sp
	.word	0x93eea47e	! t1_kref+0x158c:   	restore	%i2, 0x47e, %o1
	.word	0x9f414000	! t1_kref+0x1590:   	mov	%pc, %o7
	.word	0xb3a018da	! t1_kref+0x1594:   	fdtos	%f26, %f25
	.word	0xae050013	! t1_kref+0x1598:   	add	%l4, %l3, %l7
	.word	0xdd1fbc20	! t1_kref+0x159c:   	ldd	[%fp - 0x3e0], %f14
	.word	0x34800001	! t1_kref+0x15a0:   	bg,a	_kref+0x15a4
	.word	0x8044f666	! t1_kref+0x15a4:   	addc	%l3, -0x99a, %g0
	.word	0xd93e0000	! t1_kref+0x15a8:   	std	%f12, [%i0]
	.word	0xd048a03c	! t1_kref+0x15ac:   	ldsb	[%g2 + 0x3c], %o0
	.word	0xef26401c	! t1_kref+0x15b0:   	st	%f23, [%i1 + %i4]
	.word	0x86102021	! t1_kref+0x15b4:   	mov	0x21, %g3
	.word	0x86a0e001	! t1_kref+0x15b8:   	subcc	%g3, 1, %g3
	.word	0x22800016	! t1_kref+0x15bc:   	be,a	_kref+0x1614
	.word	0xa5b286dc	! t1_kref+0x15c0:   	fmul8sux16	%f10, %f28, %f18
	.word	0x9ba018d6	! t1_kref+0x15c4:   	fdtos	%f22, %f13
	.word	0xb7a3492f	! t1_kref+0x15c8:   	fmuls	%f13, %f15, %f27
	.word	0xa6ad240f	! t1_kref+0x15cc:   	andncc	%l4, 0x40f, %l3
	.word	0x9da018ce	! t1_kref+0x15d0:   	fdtos	%f14, %f14
	.word	0x38800001	! t1_kref+0x15d4:   	bgu,a	_kref+0x15d8
	.word	0xa2e40011	! t1_kref+0x15d8:   	subccc	%l0, %l1, %l1
	.word	0xe26e401a	! t1_kref+0x15dc:   	ldstub	[%i1 + %i2], %l1
	.word	0xc07e7ff4	! t1_kref+0x15e0:   	swap	[%i1 - 0xc], %g0
	.word	0xa9a0190d	! t1_kref+0x15e4:   	fitod	%f13, %f20
	.word	0xa5b306dc	! t1_kref+0x15e8:   	fmul8sux16	%f12, %f28, %f18
	.word	0xa6852bbc	! t1_kref+0x15ec:   	addcc	%l4, 0xbbc, %l3
	.word	0x29800006	! t1_kref+0x15f0:   	fbl,a	_kref+0x1608
	.word	0xef68a041	! t1_kref+0x15f4:   	prefetch	%g2 + 0x41, 23
	.word	0xc04e7ffb	! t1_kref+0x15f8:   	ldsb	[%i1 - 5], %g0
	.word	0xe1be5810	! t1_kref+0x15fc:   	stda	%f16, [%i1 + %l0]0xc0
	.word	0xfd1e7fe0	! t1_kref+0x1600:   	ldd	[%i1 - 0x20], %f30
	.word	0xfd3e3ff0	! t1_kref+0x1604:   	std	%f30, [%i0 - 0x10]
	.word	0xace50013	! t1_kref+0x1608:   	subccc	%l4, %l3, %l6
	.word	0xaba78937	! t1_kref+0x160c:   	fmuls	%f30, %f23, %f21
	.word	0xc368a006	! t1_kref+0x1610:   	prefetch	%g2 + 6, 1
	.word	0xe86e8019	! t1_kref+0x1614:   	ldstub	[%i2 + %i1], %l4
	.word	0x91342005	! t1_kref+0x1618:   	srl	%l0, 0x5, %o0
	.word	0xa6f4c011	! t1_kref+0x161c:   	udivcc	%l3, %l1, %l3
	.word	0xd2fe101c	! t1_kref+0x1620:   	swapa	[%i0 + %i4]0x80, %o1
	.word	0xe91fbd60	! t1_kref+0x1624:   	ldd	[%fp - 0x2a0], %f20
	.word	0xb5a5085a	! t1_kref+0x1628:   	faddd	%f20, %f26, %f26
	.word	0xd2ee1000	! t1_kref+0x162c:   	ldstuba	[%i0]0x80, %o1
	.word	0xe5e61013	! t1_kref+0x1630:   	casa	[%i0]0x80, %l3, %l2
	.word	0x2d480006	! t1_kref+0x1634:   	fbg,a,pt	%fcc0, _kref+0x164c
	.word	0x94148011	! t1_kref+0x1638:   	or	%l2, %l1, %o2
	.word	0xd9267fec	! t1_kref+0x163c:   	st	%f12, [%i1 - 0x14]
	.word	0x81ad8aca	! t1_kref+0x1640:   	fcmped	%fcc0, %f22, %f10
	.word	0x9a448012	! t1_kref+0x1644:   	addc	%l2, %l2, %o5
	.word	0x81dd401c	! t1_kref+0x1648:   	flush	%l5 + %i4
	.word	0xe4762018	! t1_kref+0x164c:   	stx	%l2, [%i0 + 0x18]
	.word	0x9ba548bd	! t1_kref+0x1650:   	fsubs	%f21, %f29, %f13
	.word	0xfd6e001a	! t1_kref+0x1654:   	prefetch	%i0 + %i2, 30
	.word	0xb7a00135	! t1_kref+0x1658:   	fabss	%f21, %f27
	.word	0x92a50012	! t1_kref+0x165c:   	subcc	%l4, %l2, %o1
	.word	0xb5b68a8e	! t1_kref+0x1660:   	fpsub16	%f26, %f14, %f26
	.word	0xee6e6014	! t1_kref+0x1664:   	ldstub	[%i1 + 0x14], %l7
	.word	0xedee501d	! t1_kref+0x1668:   	prefetcha	%i1 + %i5, 22
	.word	0xac7ce317	! t1_kref+0x166c:   	sdiv	%l3, 0x317, %l6
	.word	0xb1b50c9c	! t1_kref+0x1670:   	fandnot2	%f20, %f28, %f24
	.word	0xe1000018	! t1_kref+0x1674:   	ld	[%g0 + %i0], %f16
	.word	0xa9a01899	! t1_kref+0x1678:   	fitos	%f25, %f20
	.word	0xe3200019	! t1_kref+0x167c:   	st	%f17, [%g0 + %i1]
	.word	0xac9c74c9	! t1_kref+0x1680:   	xorcc	%l1, -0xb37, %l6
	.word	0xc568a0cb	! t1_kref+0x1684:   	prefetch	%g2 + 0xcb, 2
	.word	0xa0a4c012	! t1_kref+0x1688:   	subcc	%l3, %l2, %l0
	.word	0x9fc00004	! t1_kref+0x168c:   	call	%g0 + %g4
	.word	0xa9ab8030	! t1_kref+0x1690:   	fmovsule	%fcc0, %f16, %f20
	.word	0xa8ad0013	! t1_kref+0x1694:   	andncc	%l4, %l3, %l4
	.word	0x97400000	! t1_kref+0x1698:   	mov	%y, %o3
	.word	0xaad50010	! t1_kref+0x169c:   	umulcc	%l4, %l0, %l5
	.word	0xd6562004	! t1_kref+0x16a0:   	ldsh	[%i0 + 4], %o3
	.word	0xb9b00fc0	! t1_kref+0x16a4:   	fone	%f28
	.word	0x929527e7	! t1_kref+0x16a8:   	orcc	%l4, 0x7e7, %o1
	.word	0x94c50010	! t1_kref+0x16ac:   	addccc	%l4, %l0, %o2
	.word	0xb5a0013a	! t1_kref+0x16b0:   	fabss	%f26, %f26
	.word	0xb5b40674	! t1_kref+0x16b4:   	fmul8x16au	%f16, %f20, %f26
	.word	0x81ac8a3c	! t1_kref+0x16b8:   	fcmps	%fcc0, %f18, %f28
	.word	0xec1e2008	! t1_kref+0x16bc:   	ldd	[%i0 + 8], %l6
	.word	0xa0a50014	! t1_kref+0x16c0:   	subcc	%l4, %l4, %l0
	.word	0xf720a02c	! t1_kref+0x16c4:   	st	%f27, [%g2 + 0x2c]
	.word	0xf1be5891	! t1_kref+0x16c8:   	stda	%f24, [%i1 + %l1]0xc4
	.word	0x9da30954	! t1_kref+0x16cc:   	fmuld	%f12, %f20, %f14
	.word	0xf326600c	! t1_kref+0x16d0:   	st	%f25, [%i1 + 0xc]
	.word	0xa7700013	! t1_kref+0x16d4:   	popc	%l3, %l3
	.word	0x9814c011	! t1_kref+0x16d8:   	or	%l3, %l1, %o4
	.word	0x8143e017	! t1_kref+0x16dc:   	membar	0x17
	.word	0x2d480005	! t1_kref+0x16e0:   	fbg,a,pt	%fcc0, _kref+0x16f4
	.word	0x97b5049c	! t1_kref+0x16e4:   	fcmple32	%f20, %f28, %o3
	.word	0xa9a78931	! t1_kref+0x16e8:   	fmuls	%f30, %f17, %f20
	.word	0xb5a0053a	! t1_kref+0x16ec:   	fsqrts	%f26, %f26
	.word	0xd696101b	! t1_kref+0x16f0:   	lduha	[%i0 + %i3]0x80, %o3
	.word	0xc1ee1014	! t1_kref+0x16f4:   	prefetcha	%i0 + %l4, 0
	.word	0xa1a00031	! t1_kref+0x16f8:   	fmovs	%f17, %f16
	.word	0x9ec425e2	! t1_kref+0x16fc:   	addccc	%l0, 0x5e2, %o7
	.word	0xe168a105	! t1_kref+0x1700:   	prefetch	%g2 + 0x105, 16
	.word	0x3d480006	! t1_kref+0x1704:   	fbule,a,pt	%fcc0, _kref+0x171c
	.word	0xa1b60d18	! t1_kref+0x1708:   	fandnot1	%f24, %f24, %f16
	.word	0x001fffff	! t1_kref+0x170c:   	illtrap	0x1fffff
	.word	0xa1b007b6	! t1_kref+0x1710:   	fpackfix	%f22, %f16
	.word	0xb5b40a75	! t1_kref+0x1714:   	fpadd32s	%f16, %f21, %f26
	.word	0xa33ce001	! t1_kref+0x1718:   	sra	%l3, 0x1, %l1
	.word	0xaa548012	! t1_kref+0x171c:   	umul	%l2, %l2, %l5
	.word	0xd09e505d	! t1_kref+0x1720:   	ldda	[%i1 + %i5]0x82, %o0
	.word	0xa034fc2d	! t1_kref+0x1724:   	orn	%l3, -0x3d3, %l0
	.word	0xa5a6085e	! t1_kref+0x1728:   	faddd	%f24, %f30, %f18
	.word	0xb9a70952	! t1_kref+0x172c:   	fmuld	%f28, %f18, %f28
	.word	0x8143c000	! t1_kref+0x1730:   	stbar
	.word	0xe8774019	! t1_kref+0x1734:   	stx	%l4, [%i5 + %i1]
	.word	0xa1150014	! t1_kref+0x1738:   	taddcctv	%l4, %l4, %l0
	.word	0xfd06600c	! t1_kref+0x173c:   	ld	[%i1 + 0xc], %f30
	.word	0xbba4c9ab	! t1_kref+0x1740:   	fdivs	%f19, %f11, %f29
	.word	0x8143c000	! t1_kref+0x1744:   	stbar
	.word	0xab2ce016	! t1_kref+0x1748:   	sll	%l3, 0x16, %l5
	.word	0xa16062d2	! t1_kref+0x174c:   	movne	%fcc0, 0x2d2, %l0
	.word	0xea7e7ffc	! t1_kref+0x1750:   	swap	[%i1 - 4], %l5
	.word	0xa65d0012	! t1_kref+0x1754:   	smul	%l4, %l2, %l3
	.word	0x980c8014	! t1_kref+0x1758:   	and	%l2, %l4, %o4
	.word	0x949c0013	! t1_kref+0x175c:   	xorcc	%l0, %l3, %o2
	.word	0x99a018d2	! t1_kref+0x1760:   	fdtos	%f18, %f12
	.word	0xab3d0013	! t1_kref+0x1764:   	sra	%l4, %l3, %l5
	.word	0x81ddfe0d	! t1_kref+0x1768:   	flush	%l7 - 0x1f3
	.word	0xb1a589da	! t1_kref+0x176c:   	fdivd	%f22, %f26, %f24
	.word	0xaea4c013	! t1_kref+0x1770:   	subcc	%l3, %l3, %l7
	sethi	%hi(2f), %o7
	.word	0xe40be39c	! t1_kref+0x1778:   	ldub	[%o7 + 0x39c], %l2
	.word	0xa41ca00c	! t1_kref+0x177c:   	xor	%l2, 0xc, %l2
	.word	0xe42be39c	! t1_kref+0x1780:   	stb	%l2, [%o7 + 0x39c]
	.word	0x81dbe39c	! t1_kref+0x1784:   	flush	%o7 + 0x39c
	.word	0xb5b40e5a	! t1_kref+0x1788:   	fxnor	%f16, %f26, %f26
	.word	0x80c4c012	! t1_kref+0x178c:   	addccc	%l3, %l2, %g0
	.word	0x98750014	! t1_kref+0x1790:   	udiv	%l4, %l4, %o4
	.word	0xb9b00c20	! t1_kref+0x1794:   	fzeros	%f28
	.word	0xadb306b6	! t1_kref+0x1798:   	fmul8x16al	%f12, %f22, %f22
2:	.word	0xe87e001c	! t1_kref+0x179c:   	swap	[%i0 + %i4], %l4
	.word	0xa1a00535	! t1_kref+0x17a0:   	fsqrts	%f21, %f16
	.word	0x96f43fb9	! t1_kref+0x17a4:   	udivcc	%l0, -0x47, %o3
	.word	0xafb40240	! t1_kref+0x17a8:   	array16	%l0, %g0, %l7
	.word	0xe426001c	! t1_kref+0x17ac:   	st	%l2, [%i0 + %i4]
	.word	0xa1a589b8	! t1_kref+0x17b0:   	fdivs	%f22, %f24, %f16
	.word	0xf13e2010	! t1_kref+0x17b4:   	std	%f24, [%i0 + 0x10]
	.word	0xa7a01897	! t1_kref+0x17b8:   	fitos	%f23, %f19
	.word	0xa47ceffc	! t1_kref+0x17bc:   	sdiv	%l3, 0xffc, %l2
	.word	0xaea50010	! t1_kref+0x17c0:   	subcc	%l4, %l0, %l7
	.word	0xf91e2008	! t1_kref+0x17c4:   	ldd	[%i0 + 8], %f28
	.word	0xe610a004	! t1_kref+0x17c8:   	lduh	[%g2 + 4], %l3
	.word	0x81adcab7	! t1_kref+0x17cc:   	fcmpes	%fcc0, %f23, %f23
	.word	0xdf000019	! t1_kref+0x17d0:   	ld	[%g0 + %i1], %f15
	.word	0x3c480001	! t1_kref+0x17d4:   	bpos,a,pt	%icc, _kref+0x17d8
	.word	0xe030a02e	! t1_kref+0x17d8:   	sth	%l0, [%g2 + 0x2e]
	.word	0xe1be1a1a	! t1_kref+0x17dc:   	stda	%f16, [%i0 + %i2]0xd0
	.word	0xa3a489b2	! t1_kref+0x17e0:   	fdivs	%f18, %f18, %f17
	.word	0xf13e6000	! t1_kref+0x17e4:   	std	%f24, [%i1]
	.word	0xf300a034	! t1_kref+0x17e8:   	ld	[%g2 + 0x34], %f25
	.word	0x9804c014	! t1_kref+0x17ec:   	add	%l3, %l4, %o4
	.word	0xe4264000	! t1_kref+0x17f0:   	st	%l2, [%i1]
	.word	0xa1b70ddc	! t1_kref+0x17f4:   	fnand	%f28, %f28, %f16
	.word	0xb1a000ce	! t1_kref+0x17f8:   	fnegd	%f14, %f24
	.word	0xb7a3493a	! t1_kref+0x17fc:   	fmuls	%f13, %f26, %f27
	.word	0xadb009b8	! t1_kref+0x1800:   	fexpand	%f24, %f22
	.word	0x81580000	! t1_kref+0x1804:   	flushw
	.word	0xd5180019	! t1_kref+0x1808:   	ldd	[%g0 + %i1], %f10
	.word	0x8584b285	! t1_kref+0x180c:   	wr	%l2, 0xfffff285, %ccr
	.word	0xd096d058	! t1_kref+0x1810:   	lduha	[%i3 + %i0]0x82, %o0
	.word	0xbba709ad	! t1_kref+0x1814:   	fdivs	%f28, %f13, %f29
	.word	0x9a8c26ed	! t1_kref+0x1818:   	andcc	%l0, 0x6ed, %o5
	.word	0xab24c012	! t1_kref+0x181c:   	mulscc	%l3, %l2, %l5
	.word	0x9a6537d1	! t1_kref+0x1820:   	subc	%l4, -0x82f, %o5
	.word	0x32480005	! t1_kref+0x1824:   	bne,a,pt	%icc, _kref+0x1838
	.word	0x8184c000	! t1_kref+0x1828:   	wr	%l3, %g0, %y
	.word	0xe968a00e	! t1_kref+0x182c:   	prefetch	%g2 + 0xe, 20
	.word	0xe696d019	! t1_kref+0x1830:   	lduha	[%i3 + %i1]0x80, %l3
	.word	0x3d800003	! t1_kref+0x1834:   	fbule,a	_kref+0x1840
	.word	0xa634ecfa	! t1_kref+0x1838:   	orn	%l3, 0xcfa, %l3
	.word	0x8143c000	! t1_kref+0x183c:   	stbar
	.word	0xada409ce	! t1_kref+0x1840:   	fdivd	%f16, %f14, %f22
	.word	0x8143c000	! t1_kref+0x1844:   	stbar
	.word	0x9de3bfa0	! t1_kref+0x1848:   	save	%sp, -0x60, %sp
	.word	0xb436317f	! t1_kref+0x184c:   	orn	%i0, -0xe81, %i2
	.word	0xa1ef3f7e	! t1_kref+0x1850:   	restore	%i4, -0x82, %l0
	.word	0xa3a00532	! t1_kref+0x1854:   	fsqrts	%f18, %f17
	.word	0x99a000cc	! t1_kref+0x1858:   	fnegd	%f12, %f12
	.word	0x81ac4ab2	! t1_kref+0x185c:   	fcmpes	%fcc0, %f17, %f18
	.word	0xa2fc8010	! t1_kref+0x1860:   	sdivcc	%l2, %l0, %l1
	.word	0xe51e7ff8	! t1_kref+0x1864:   	ldd	[%i1 - 8], %f18
	.word	0xa5b00fc0	! t1_kref+0x1868:   	fone	%f18
	.word	0xb1a00558	! t1_kref+0x186c:   	fsqrtd	%f24, %f24
	.word	0x9da68958	! t1_kref+0x1870:   	fmuld	%f26, %f24, %f14
	.word	0xafa488b1	! t1_kref+0x1874:   	fsubs	%f18, %f17, %f23
	.word	0xe430a00e	! t1_kref+0x1878:   	sth	%l2, [%g2 + 0xe]
	.word	0xe4a65000	! t1_kref+0x187c:   	sta	%l2, [%i1]0x80
	.word	0x9b3c601d	! t1_kref+0x1880:   	sra	%l1, 0x1d, %o5
	.word	0xd01e6010	! t1_kref+0x1884:   	ldd	[%i1 + 0x10], %o0
	.word	0x9de3bfa0	! t1_kref+0x1888:   	save	%sp, -0x60, %sp
	.word	0xb4e7001c	! t1_kref+0x188c:   	subccc	%i4, %i4, %i2
	.word	0x99ef4019	! t1_kref+0x1890:   	restore	%i5, %i1, %o4
	.word	0x93400000	! t1_kref+0x1894:   	mov	%y, %o1
	.word	0xadb70c8c	! t1_kref+0x1898:   	fandnot2	%f28, %f12, %f22
	.word	0xe82e6002	! t1_kref+0x189c:   	stb	%l4, [%i1 + 2]
	.word	0xa4c44010	! t1_kref+0x18a0:   	addccc	%l1, %l0, %l2
	.word	0xe51f4018	! t1_kref+0x18a4:   	ldd	[%i5 + %i0], %f18
	.word	0xd84e401a	! t1_kref+0x18a8:   	ldsb	[%i1 + %i2], %o4
	.word	0xe80e8018	! t1_kref+0x18ac:   	ldub	[%i2 + %i0], %l4
	.word	0x809c4012	! t1_kref+0x18b0:   	xorcc	%l1, %l2, %g0
	.word	0xe24e401a	! t1_kref+0x18b4:   	ldsb	[%i1 + %i2], %l1
	.word	0xf7262010	! t1_kref+0x18b8:   	st	%f27, [%i0 + 0x10]
	.word	0xe9be5890	! t1_kref+0x18bc:   	stda	%f20, [%i1 + %l0]0xc4
	.word	0x98c53936	! t1_kref+0x18c0:   	addccc	%l4, -0x6ca, %o4
	.word	0xa9b58e1a	! t1_kref+0x18c4:   	fand	%f22, %f26, %f20
	.word	0xe27e3fe0	! t1_kref+0x18c8:   	swap	[%i0 - 0x20], %l1
	.word	0x99b4c66f	! t1_kref+0x18cc:   	fmul8x16au	%f19, %f15, %f12
	.word	0x8143e04a	! t1_kref+0x18d0:   	membar	0x4a
	.word	0xd99f1a58	! t1_kref+0x18d4:   	ldda	[%i4 + %i0]0xd2, %f12
	.word	0x925c6974	! t1_kref+0x18d8:   	smul	%l1, 0x974, %o1
	.word	0x9da78854	! t1_kref+0x18dc:   	faddd	%f30, %f20, %f14
	.word	0xd8180019	! t1_kref+0x18e0:   	ldd	[%g0 + %i1], %o4
	.word	0x81aacab6	! t1_kref+0x18e4:   	fcmpes	%fcc0, %f11, %f22
	.word	0xa2f4c013	! t1_kref+0x18e8:   	udivcc	%l3, %l3, %l1
	.word	0x81ae0a4c	! t1_kref+0x18ec:   	fcmpd	%fcc0, %f24, %f12
	.word	0xa1a0013b	! t1_kref+0x18f0:   	fabss	%f27, %f16
	.word	0xada68856	! t1_kref+0x18f4:   	faddd	%f26, %f22, %f22
	.word	0x96146470	! t1_kref+0x18f8:   	or	%l1, 0x470, %o3
	.word	0xd01e001d	! t1_kref+0x18fc:   	ldd	[%i0 + %i5], %o0
	.word	0x86102003	! t1_kref+0x1900:   	mov	0x3, %g3
	.word	0x32800000	! t1_kref+0x1904:   	bne,a	_kref+0x1904
	.word	0x86a0e001	! t1_kref+0x1908:   	subcc	%g3, 1, %g3
	.word	0xa0fcc013	! t1_kref+0x190c:   	sdivcc	%l3, %l3, %l0
	.word	0xe220a03c	! t1_kref+0x1910:   	st	%l1, [%g2 + 0x3c]
	.word	0x81ab0a58	! t1_kref+0x1914:   	fcmpd	%fcc0, %f12, %f24
	.word	0xa1400000	! t1_kref+0x1918:   	mov	%y, %l0
	.word	0xf51fbc18	! t1_kref+0x191c:   	ldd	[%fp - 0x3e8], %f26
	.word	0xd67e601c	! t1_kref+0x1920:   	swap	[%i1 + 0x1c], %o3
	.word	0xaa548010	! t1_kref+0x1924:   	umul	%l2, %l0, %l5
	.word	0xe820a004	! t1_kref+0x1928:   	st	%l4, [%g2 + 4]
	.word	0xa0fd3eb7	! t1_kref+0x192c:   	sdivcc	%l4, -0x149, %l0
	.word	0xa29ca7af	! t1_kref+0x1930:   	xorcc	%l2, 0x7af, %l1
	.word	0x92f42b9c	! t1_kref+0x1934:   	udivcc	%l0, 0xb9c, %o1
	.word	0xb5a6c9ab	! t1_kref+0x1938:   	fdivs	%f27, %f11, %f26
	.word	0xe820a024	! t1_kref+0x193c:   	st	%l4, [%g2 + 0x24]
	.word	0xde167fea	! t1_kref+0x1940:   	lduh	[%i1 - 0x16], %o7
	.word	0x9844a469	! t1_kref+0x1944:   	addc	%l2, 0x469, %o4
	.word	0x81dde141	! t1_kref+0x1948:   	flush	%l7 + 0x141
	.word	0xe7200019	! t1_kref+0x194c:   	st	%f19, [%g0 + %i1]
	.word	0xae2469f4	! t1_kref+0x1950:   	sub	%l1, 0x9f4, %l7
	.word	0xe4200018	! t1_kref+0x1954:   	st	%l2, [%g0 + %i0]
	.word	0xe87e0000	! t1_kref+0x1958:   	swap	[%i0], %l4
	.word	0x9e8c0012	! t1_kref+0x195c:   	andcc	%l0, %l2, %o7
	.word	0xf3871018	! t1_kref+0x1960:   	lda	[%i4 + %i0]0x80, %f25
	.word	0xe630a00c	! t1_kref+0x1964:   	sth	%l3, [%g2 + 0xc]
	.word	0x95a00556	! t1_kref+0x1968:   	fsqrtd	%f22, %f10
	.word	0xda4e4000	! t1_kref+0x196c:   	ldsb	[%i1], %o5
	.word	0xa4d44011	! t1_kref+0x1970:   	umulcc	%l1, %l1, %l2
	.word	0xbdb60d60	! t1_kref+0x1974:   	fnot1s	%f24, %f30
	.word	0x9f414000	! t1_kref+0x1978:   	mov	%pc, %o7
	.word	0x81ad0a33	! t1_kref+0x197c:   	fcmps	%fcc0, %f20, %f19
	.word	0x81ac8ada	! t1_kref+0x1980:   	fcmped	%fcc0, %f18, %f26
	.word	0xdd1fbc68	! t1_kref+0x1984:   	ldd	[%fp - 0x398], %f14
	.word	0xa434f016	! t1_kref+0x1988:   	orn	%l3, -0xfea, %l2
	.word	0xa1a00030	! t1_kref+0x198c:   	fmovs	%f16, %f16
	.word	0xdb267fe4	! t1_kref+0x1990:   	st	%f13, [%i1 - 0x1c]
	.word	0xab344013	! t1_kref+0x1994:   	srl	%l1, %l3, %l5
	.word	0x81850000	! t1_kref+0x1998:   	wr	%l4, %g0, %y
	.word	0xac9d0011	! t1_kref+0x199c:   	xorcc	%l4, %l1, %l6
	.word	0x9a9c2d09	! t1_kref+0x19a0:   	xorcc	%l0, 0xd09, %o5
	.word	0xae452b87	! t1_kref+0x19a4:   	addc	%l4, 0xb87, %l7
	.word	0xeede1000	! t1_kref+0x19a8:   	ldxa	[%i0]0x80, %l7
	.word	0xe030a014	! t1_kref+0x19ac:   	sth	%l0, [%g2 + 0x14]
	.word	0xea563ff0	! t1_kref+0x19b0:   	ldsh	[%i0 - 0x10], %l5
	.word	0x3f480001	! t1_kref+0x19b4:   	fbo,a,pt	%fcc0, _kref+0x19b8
	.word	0xa5a348b7	! t1_kref+0x19b8:   	fsubs	%f13, %f23, %f18
	.word	0xa1a0191e	! t1_kref+0x19bc:   	fitod	%f30, %f16
	.word	0xe0a71018	! t1_kref+0x19c0:   	sta	%l0, [%i4 + %i0]0x80
	.word	0xb5b40dce	! t1_kref+0x19c4:   	fnand	%f16, %f14, %f26
	.word	0xe26e7fe0	! t1_kref+0x19c8:   	ldstub	[%i1 - 0x20], %l1
	.word	0x001fffff	! t1_kref+0x19cc:   	illtrap	0x1fffff
	.word	0x29480005	! t1_kref+0x19d0:   	fbl,a,pt	%fcc0, _kref+0x19e4
	.word	0xa69ce274	! t1_kref+0x19d4:   	xorcc	%l3, 0x274, %l3
	.word	0x3a480006	! t1_kref+0x19d8:   	bcc,a,pt	%icc, _kref+0x19f0
	.word	0x9a2c4011	! t1_kref+0x19dc:   	andn	%l1, %l1, %o5
	.word	0xa9a508b5	! t1_kref+0x19e0:   	fsubs	%f20, %f21, %f20
	.word	0x95b50151	! t1_kref+0x19e4:   	edge32l	%l4, %l1, %o2
	.word	0xb1a309b2	! t1_kref+0x19e8:   	fdivs	%f12, %f18, %f24
	.word	0x80ac0014	! t1_kref+0x19ec:   	andncc	%l0, %l4, %g0
	.word	0xa09d0010	! t1_kref+0x19f0:   	xorcc	%l4, %l0, %l0
	.word	0x805c0010	! t1_kref+0x19f4:   	smul	%l0, %l0, %g0
	.word	0x8143c000	! t1_kref+0x19f8:   	stbar
	.word	0xed1fbe60	! t1_kref+0x19fc:   	ldd	[%fp - 0x1a0], %f22
	.word	0xda6e7ff8	! t1_kref+0x1a00:   	ldstub	[%i1 - 8], %o5
	.word	0x81ad8ad0	! t1_kref+0x1a04:   	fcmped	%fcc0, %f22, %f16
	.word	0xe250a004	! t1_kref+0x1a08:   	ldsh	[%g2 + 4], %l1
	.word	0xee56001b	! t1_kref+0x1a0c:   	ldsh	[%i0 + %i3], %l7
	.word	0xe020a00c	! t1_kref+0x1a10:   	st	%l0, [%g2 + 0xc]
	.word	0xa5a68d2f	! t1_kref+0x1a14:   	fsmuld	%f26, %f15, %f18
	.word	0x81af8a52	! t1_kref+0x1a18:   	fcmpd	%fcc0, %f30, %f18
	sethi	%hi(2f), %o7
	.word	0xe40be24c	! t1_kref+0x1a20:   	ldub	[%o7 + 0x24c], %l2
	.word	0xa41ca00c	! t1_kref+0x1a24:   	xor	%l2, 0xc, %l2
	.word	0xe42be24c	! t1_kref+0x1a28:   	stb	%l2, [%o7 + 0x24c]
	.word	0x81dbe24c	! t1_kref+0x1a2c:   	flush	%o7 + 0x24c
	.word	0x81aeca33	! t1_kref+0x1a30:   	fcmps	%fcc0, %f27, %f19
	.word	0xa1a0013b	! t1_kref+0x1a34:   	fabss	%f27, %f16
	.word	0xb1a78932	! t1_kref+0x1a38:   	fmuls	%f30, %f18, %f24
	.word	0x99a38950	! t1_kref+0x1a3c:   	fmuld	%f14, %f16, %f12
	.word	0x81ae0ad6	! t1_kref+0x1a40:   	fcmped	%fcc0, %f24, %f22
	.word	0xb5b3c62e	! t1_kref+0x1a44:   	fmul8x16	%f15, %f14, %f26
	.word	0x8114e573	! t1_kref+0x1a48:   	taddcctv	%l3, 0x573, %g0
2:	.word	0xabb50280	! t1_kref+0x1a4c:   	array32	%l4, %g0, %l5
	.word	0x9da000cc	! t1_kref+0x1a50:   	fnegd	%f12, %f14
	.word	0x91400000	! t1_kref+0x1a54:   	mov	%y, %o0
	.word	0x9af4c011	! t1_kref+0x1a58:   	udivcc	%l3, %l1, %o5
	.word	0x9da018d0	! t1_kref+0x1a5c:   	fdtos	%f16, %f14
	.word	0xa4552044	! t1_kref+0x1a60:   	umul	%l4, 0x44, %l2
	.word	0xc3ee1012	! t1_kref+0x1a64:   	prefetcha	%i0 + %l2, 1
	.word	0xf83f4019	! t1_kref+0x1a68:   	std	%i4, [%i5 + %i1]
	.word	0xc7ee1014	! t1_kref+0x1a6c:   	prefetcha	%i0 + %l4, 3
	.word	0x90340014	! t1_kref+0x1a70:   	orn	%l0, %l4, %o0
	.word	0xabb40556	! t1_kref+0x1a74:   	fcmpeq16	%f16, %f22, %l5
	.word	0x9f414000	! t1_kref+0x1a78:   	mov	%pc, %o7
	.word	0xea4e8018	! t1_kref+0x1a7c:   	ldsb	[%i2 + %i0], %l5
	.word	0xadb009b5	! t1_kref+0x1a80:   	fexpand	%f21, %f22
	.word	0xe66e8019	! t1_kref+0x1a84:   	ldstub	[%i2 + %i1], %l3
	.word	0x929c4010	! t1_kref+0x1a88:   	xorcc	%l1, %l0, %o1
	.word	0x802ce5c7	! t1_kref+0x1a8c:   	andn	%l3, 0x5c7, %g0
	.word	0x87802080	! t1_kref+0x1a90:   	mov	0x80, %asi
	.word	0x9fc00004	! t1_kref+0x1a94:   	call	%g0 + %g4
	.word	0xe6b0a034	! t1_kref+0x1a98:   	stha	%l3, [%g2 + 0x34]%asi
	.word	0xa7b40240	! t1_kref+0x1a9c:   	array16	%l0, %g0, %l3
	.word	0xfd380018	! t1_kref+0x1aa0:   	std	%f30, [%g0 + %i0]
	.word	0xafb00cf8	! t1_kref+0x1aa4:   	fnot2s	%f24, %f23
	.word	0x9fa0013a	! t1_kref+0x1aa8:   	fabss	%f26, %f15
	.word	0x973c8014	! t1_kref+0x1aac:   	sra	%l2, %l4, %o3
	.word	0x33800006	! t1_kref+0x1ab0:   	fbe,a	_kref+0x1ac8
	.word	0xea680019	! t1_kref+0x1ab4:   	ldstub	[%g0 + %i1], %l5
	.word	0x9db507da	! t1_kref+0x1ab8:   	pdist	%f20, %f26, %f14
	.word	0x9b400000	! t1_kref+0x1abc:   	mov	%y, %o5
	.word	0x81b01025	! t1_kref+0x1ac0:   	siam	0x5
	.word	0xbdb74efa	! t1_kref+0x1ac4:   	fornot2s	%f29, %f26, %f30
	.word	0xdd1fbe38	! t1_kref+0x1ac8:   	ldd	[%fp - 0x1c8], %f14
	.word	0xa8c48013	! t1_kref+0x1acc:   	addccc	%l2, %l3, %l4
	.word	0x9fc00004	! t1_kref+0x1ad0:   	call	%g0 + %g4
	.word	0x803d2e8b	! t1_kref+0x1ad4:   	xnor	%l4, 0xe8b, %g0
	.word	0x97b4849c	! t1_kref+0x1ad8:   	fcmple32	%f18, %f28, %o3
	.word	0xa854aabb	! t1_kref+0x1adc:   	umul	%l2, 0xabb, %l4
	.word	0x8143c000	! t1_kref+0x1ae0:   	stbar
	.word	0xea7e2014	! t1_kref+0x1ae4:   	swap	[%i0 + 0x14], %l5
	.word	0xafb50152	! t1_kref+0x1ae8:   	edge32l	%l4, %l2, %l7
	.word	0xabb7855e	! t1_kref+0x1aec:   	fcmpeq16	%f30, %f30, %l5
	.word	0xa5b2859a	! t1_kref+0x1af0:   	fcmpgt32	%f10, %f26, %l2
	.word	0xb5b50e0e	! t1_kref+0x1af4:   	fand	%f20, %f14, %f26
	.word	0xa1a01030	! t1_kref+0x1af8:   	fstox	%f16, %f16
	.word	0xa1b60e77	! t1_kref+0x1afc:   	fxnors	%f24, %f23, %f16
	.word	0xe020a004	! t1_kref+0x1b00:   	st	%l0, [%g2 + 4]
	.word	0xe0266008	! t1_kref+0x1b04:   	st	%l0, [%i1 + 8]
	.word	0xb3a01a5e	! t1_kref+0x1b08:   	fdtoi	%f30, %f25
	.word	0x9da30831	! t1_kref+0x1b0c:   	fadds	%f12, %f17, %f14
	.word	0xa1b48d92	! t1_kref+0x1b10:   	fxor	%f18, %f18, %f16
	.word	0xb1a388d2	! t1_kref+0x1b14:   	fsubd	%f14, %f18, %f24
	sethi	%hi(2f), %o7
	.word	0xe40be344	! t1_kref+0x1b1c:   	ldub	[%o7 + 0x344], %l2
	.word	0xa41ca00c	! t1_kref+0x1b20:   	xor	%l2, 0xc, %l2
	.word	0xe42be344	! t1_kref+0x1b24:   	stb	%l2, [%o7 + 0x344]
	.word	0x81dbe344	! t1_kref+0x1b28:   	flush	%o7 + 0x344
	.word	0x9205350b	! t1_kref+0x1b2c:   	add	%l4, -0xaf5, %o1
	.word	0x81ac0ada	! t1_kref+0x1b30:   	fcmped	%fcc0, %f16, %f26
	.word	0xb9a00537	! t1_kref+0x1b34:   	fsqrts	%f23, %f28
	.word	0xa6f4c011	! t1_kref+0x1b38:   	udivcc	%l3, %l1, %l3
	.word	0xa8b48010	! t1_kref+0x1b3c:   	orncc	%l2, %l0, %l4
	.word	0x29480003	! t1_kref+0x1b40:   	fbl,a,pt	%fcc0, _kref+0x1b4c
2:	.word	0xa0840011	! t1_kref+0x1b44:   	addcc	%l0, %l1, %l0
	.word	0x91400000	! t1_kref+0x1b48:   	mov	%y, %o0
	.word	0xac140013	! t1_kref+0x1b4c:   	or	%l0, %l3, %l6
	.word	0xbba0053e	! t1_kref+0x1b50:   	fsqrts	%f30, %f29
	.word	0xe4fe2000	! t1_kref+0x1b54:   	swapa	[%i0]%asi, %l2
	.word	0xa5a0054c	! t1_kref+0x1b58:   	fsqrtd	%f12, %f18
	.word	0x9da018d4	! t1_kref+0x1b5c:   	fdtos	%f20, %f14
	.word	0xa9b30dd6	! t1_kref+0x1b60:   	fnand	%f12, %f22, %f20
	.word	0x9da48d38	! t1_kref+0x1b64:   	fsmuld	%f18, %f24, %f14
	.word	0xa5b48073	! t1_kref+0x1b68:   	edge8ln	%l2, %l3, %l2
	.word	0xada0055a	! t1_kref+0x1b6c:   	fsqrtd	%f26, %f22
	.word	0xb9a0111a	! t1_kref+0x1b70:   	fxtod	%f26, %f28
	.word	0xf3ee501d	! t1_kref+0x1b74:   	prefetcha	%i1 + %i5, 25
	.word	0xa32cc013	! t1_kref+0x1b78:   	sll	%l3, %l3, %l1
	.word	0x81ab8ab4	! t1_kref+0x1b7c:   	fcmpes	%fcc0, %f14, %f20
	.word	0xaa84c012	! t1_kref+0x1b80:   	addcc	%l3, %l2, %l5
	.word	0xe2700019	! t1_kref+0x1b84:   	stx	%l1, [%g0 + %i1]
	.word	0x8143c000	! t1_kref+0x1b88:   	stbar
	.word	0xd850a01c	! t1_kref+0x1b8c:   	ldsh	[%g2 + 0x1c], %o4
	.word	0x9fa0012c	! t1_kref+0x1b90:   	fabss	%f12, %f15
	.word	0x933c6017	! t1_kref+0x1b94:   	sra	%l1, 0x17, %o1
	.word	0x8143c000	! t1_kref+0x1b98:   	stbar
	.word	0xf1beda19	! t1_kref+0x1b9c:   	stda	%f24, [%i3 + %i1]0xd0
	.word	0x8143c000	! t1_kref+0x1ba0:   	stbar
	.word	0x97a00532	! t1_kref+0x1ba4:   	fsqrts	%f18, %f11
	.word	0xd6100019	! t1_kref+0x1ba8:   	lduh	[%g0 + %i1], %o3
	.word	0x21800006	! t1_kref+0x1bac:   	fbn,a	_kref+0x1bc4
	.word	0xaa9d0011	! t1_kref+0x1bb0:   	xorcc	%l4, %l1, %l5
	.word	0xe62e3ffd	! t1_kref+0x1bb4:   	stb	%l3, [%i0 - 3]
	.word	0x97b00c20	! t1_kref+0x1bb8:   	fzeros	%f11
	.word	0x8143c000	! t1_kref+0x1bbc:   	stbar
	.word	0x81ad0a5a	! t1_kref+0x1bc0:   	fcmpd	%fcc0, %f20, %f26
	.word	0x8143c000	! t1_kref+0x1bc4:   	stbar
	.word	0xe82e001a	! t1_kref+0x1bc8:   	stb	%l4, [%i0 + %i2]
	.word	0x989c4013	! t1_kref+0x1bcc:   	xorcc	%l1, %l3, %o4
	.word	0xee6e4000	! t1_kref+0x1bd0:   	ldstub	[%i1], %l7
	.word	0xada708b3	! t1_kref+0x1bd4:   	fsubs	%f28, %f19, %f22
	.word	0x8610200c	! t1_kref+0x1bd8:   	mov	0xc, %g3
	.word	0x86a0e001	! t1_kref+0x1bdc:   	subcc	%g3, 1, %g3
	.word	0x22800020	! t1_kref+0x1be0:   	be,a	_kref+0x1c60
	.word	0xb1a0189d	! t1_kref+0x1be4:   	fitos	%f29, %f24
	.word	0xa9b64a33	! t1_kref+0x1be8:   	fpadd16s	%f25, %f19, %f20
	.word	0xbda60858	! t1_kref+0x1bec:   	faddd	%f24, %f24, %f30
	.word	0x2cbffffb	! t1_kref+0x1bf0:   	bneg,a	_kref+0x1bdc
	.word	0xb1a00537	! t1_kref+0x1bf4:   	fsqrts	%f23, %f24
	.word	0x93b50311	! t1_kref+0x1bf8:   	alignaddr	%l4, %l1, %o1
	.word	0x9fa5c9bb	! t1_kref+0x1bfc:   	fdivs	%f23, %f27, %f15
	.word	0xadb00cca	! t1_kref+0x1c00:   	fnot2	%f10, %f22
	.word	0xada689dc	! t1_kref+0x1c04:   	fdivd	%f26, %f28, %f22
	.word	0xb7a0053a	! t1_kref+0x1c08:   	fsqrts	%f26, %f27
	.word	0xdd20a01c	! t1_kref+0x1c0c:   	st	%f14, [%g2 + 0x1c]
	.word	0xadb38754	! t1_kref+0x1c10:   	fpack32	%f14, %f20, %f22
	.word	0x374ffff2	! t1_kref+0x1c14:   	fbge,a,pt	%fcc0, _kref+0x1bdc
	.word	0xa2c4fe60	! t1_kref+0x1c18:   	addccc	%l3, -0x1a0, %l1
	.word	0xb9b6463a	! t1_kref+0x1c1c:   	fmul8x16	%f25, %f26, %f28
	.word	0xaba488ba	! t1_kref+0x1c20:   	fsubs	%f18, %f26, %f21
	.word	0x22480003	! t1_kref+0x1c24:   	be,a,pt	%icc, _kref+0x1c30
	.word	0x8143c000	! t1_kref+0x1c28:   	stbar
	.word	0xe91fbc78	! t1_kref+0x1c2c:   	ldd	[%fp - 0x388], %f20
	.word	0x9ba00038	! t1_kref+0x1c30:   	fmovs	%f24, %f13
	.word	0x91400000	! t1_kref+0x1c34:   	mov	%y, %o0
	.word	0xa4050011	! t1_kref+0x1c38:   	add	%l4, %l1, %l2
	.word	0xe6100018	! t1_kref+0x1c3c:   	lduh	[%g0 + %i0], %l3
	.word	0xe436c018	! t1_kref+0x1c40:   	sth	%l2, [%i3 + %i0]
	.word	0xeb6e7fe8	! t1_kref+0x1c44:   	prefetch	%i1 - 0x18, 21
	.word	0xd296101b	! t1_kref+0x1c48:   	lduha	[%i0 + %i3]0x80, %o1
	.word	0xf7ee501b	! t1_kref+0x1c4c:   	prefetcha	%i1 + %i3, 27
	.word	0x81de2ba7	! t1_kref+0x1c50:   	flush	%i0 + 0xba7
	.word	0x9fb007ac	! t1_kref+0x1c54:   	fpackfix	%f12, %f15
	.word	0x9e040011	! t1_kref+0x1c58:   	add	%l0, %l1, %o7
	.word	0xd01e3ff0	! t1_kref+0x1c5c:   	ldd	[%i0 - 0x10], %o0
	.word	0x99a0054a	! t1_kref+0x1c60:   	fsqrtd	%f10, %f12
	.word	0x81844000	! t1_kref+0x1c64:   	wr	%l1, %g0, %y
	.word	0x80e4b8e7	! t1_kref+0x1c68:   	subccc	%l2, -0x719, %g0
	.word	0x8143c000	! t1_kref+0x1c6c:   	stbar
	.word	0x99b44134	! t1_kref+0x1c70:   	edge32n	%l1, %l4, %o4
	.word	0xd81e2000	! t1_kref+0x1c74:   	ldd	[%i0], %o4
	.word	0x9f3c601b	! t1_kref+0x1c78:   	sra	%l1, 0x1b, %o7
	.word	0xe82e2016	! t1_kref+0x1c7c:   	stb	%l4, [%i0 + 0x16]
	.word	0xbdb00fe0	! t1_kref+0x1c80:   	fones	%f30
	.word	0xa49c4013	! t1_kref+0x1c84:   	xorcc	%l1, %l3, %l2
	.word	0xeb066004	! t1_kref+0x1c88:   	ld	[%i1 + 4], %f21
	.word	0xc807bfe8	! t1_kref+0x1c8c:   	ld	[%fp - 0x18], %g4
	.word	0x85843d17	! t1_kref+0x1c90:   	wr	%l0, 0xfffffd17, %ccr
	.word	0xa1a01890	! t1_kref+0x1c94:   	fitos	%f16, %f16
	.word	0xb5a00533	! t1_kref+0x1c98:   	fsqrts	%f19, %f26
	.word	0xe968a08b	! t1_kref+0x1c9c:   	prefetch	%g2 + 0x8b, 20
	.word	0xabb48351	! t1_kref+0x1ca0:   	alignaddrl	%l2, %l1, %l5
	.word	0xb9a0012b	! t1_kref+0x1ca4:   	fabss	%f11, %f28
	.word	0xa1a74831	! t1_kref+0x1ca8:   	fadds	%f29, %f17, %f16
	.word	0xb5a40d35	! t1_kref+0x1cac:   	fsmuld	%f16, %f21, %f26
	.word	0xc807bfec	! t1_kref+0x1cb0:   	ld	[%fp - 0x14], %g4
	.word	0xa1a01050	! t1_kref+0x1cb4:   	fdtox	%f16, %f16
	.word	0x97b48030	! t1_kref+0x1cb8:   	edge8n	%l2, %l0, %o3
	.word	0xc3e8a08a	! t1_kref+0x1cbc:   	prefetcha	%g2 + 0x8a, 1
	.word	0x94b50012	! t1_kref+0x1cc0:   	orncc	%l4, %l2, %o2
	.word	0xb9b38f94	! t1_kref+0x1cc4:   	for	%f14, %f20, %f28
	.word	0x30480007	! t1_kref+0x1cc8:   	ba,a,pt	%icc, _kref+0x1ce4
	.word	0xa8ad3ef3	! t1_kref+0x1ccc:   	andncc	%l4, -0x10d, %l4
	.word	0xe1be1851	! t1_kref+0x1cd0:   	stda	%f16, [%i0 + %l1]0xc2
	.word	0x99a00554	! t1_kref+0x1cd4:   	fsqrtd	%f20, %f12
	.word	0xb9a0191b	! t1_kref+0x1cd8:   	fitod	%f27, %f28
	.word	0x2326d463	! t1_kref+0x1cdc:   	sethi	%hi(0x9b518c00), %l1
	.word	0xd81e2018	! t1_kref+0x1ce0:   	ldd	[%i0 + 0x18], %o4
	.word	0x81580000	! t1_kref+0x1ce4:   	flushw
	.word	0xa5a00538	! t1_kref+0x1ce8:   	fsqrts	%f24, %f18
	.word	0xe1867fe8	! t1_kref+0x1cec:   	lda	[%i1 - 0x18]%asi, %f16
	.word	0xd83e7ff0	! t1_kref+0x1cf0:   	std	%o4, [%i1 - 0x10]
	.word	0x95b50280	! t1_kref+0x1cf4:   	array32	%l4, %g0, %o2
	.word	0xa8c53da7	! t1_kref+0x1cf8:   	addccc	%l4, -0x259, %l4
	.word	0xd07e2014	! t1_kref+0x1cfc:   	swap	[%i0 + 0x14], %o0
	.word	0xd81f4018	! t1_kref+0x1d00:   	ldd	[%i5 + %i0], %o4
	.word	0x2c800005	! t1_kref+0x1d04:   	bneg,a	_kref+0x1d18
	.word	0xe82e4000	! t1_kref+0x1d08:   	stb	%l4, [%i1]
	.word	0x9f3c0012	! t1_kref+0x1d0c:   	sra	%l0, %l2, %o7
	.word	0x81ad8ada	! t1_kref+0x1d10:   	fcmped	%fcc0, %f22, %f26
	.word	0xbba018d6	! t1_kref+0x1d14:   	fdtos	%f22, %f29
	.word	0x9da0055e	! t1_kref+0x1d18:   	fsqrtd	%f30, %f14
	.word	0x9ebc3ee8	! t1_kref+0x1d1c:   	xnorcc	%l0, -0x118, %o7
	.word	0x81ae8abd	! t1_kref+0x1d20:   	fcmpes	%fcc0, %f26, %f29
	.word	0x9fc00004	! t1_kref+0x1d24:   	call	%g0 + %g4
	.word	0xe826401c	! t1_kref+0x1d28:   	st	%l4, [%i1 + %i4]
	.word	0xee7e401c	! t1_kref+0x1d2c:   	swap	[%i1 + %i4], %l7
	.word	0xe9bf5a19	! t1_kref+0x1d30:   	stda	%f20, [%i5 + %i1]0xd0
	.word	0x81ab0ad2	! t1_kref+0x1d34:   	fcmped	%fcc0, %f12, %f18
	.word	0xa9a000b3	! t1_kref+0x1d38:   	fnegs	%f19, %f20
	.word	0xa4fca108	! t1_kref+0x1d3c:   	sdivcc	%l2, 0x108, %l2
	.word	0xd86e7fe6	! t1_kref+0x1d40:   	ldstub	[%i1 - 0x1a], %o4
	.word	0xe93e401d	! t1_kref+0x1d44:   	std	%f20, [%i1 + %i5]
	.word	0xac44b7b8	! t1_kref+0x1d48:   	addc	%l2, -0x848, %l6
	.word	0xbda018dc	! t1_kref+0x1d4c:   	fdtos	%f28, %f30
	.word	0x8143e018	! t1_kref+0x1d50:   	membar	0x18
	.word	0xd24e4000	! t1_kref+0x1d54:   	ldsb	[%i1], %o1
	.word	0x9da018da	! t1_kref+0x1d58:   	fdtos	%f26, %f14
	.word	0xe59e7fe8	! t1_kref+0x1d5c:   	ldda	[%i1 - 0x18]%asi, %f18
	.word	0xee50a01e	! t1_kref+0x1d60:   	ldsh	[%g2 + 0x1e], %l7
	.word	0x2c480007	! t1_kref+0x1d64:   	bneg,a,pt	%icc, _kref+0x1d80
	.word	0xe430a016	! t1_kref+0x1d68:   	sth	%l2, [%g2 + 0x16]
	.word	0x3d480007	! t1_kref+0x1d6c:   	fbule,a,pt	%fcc0, _kref+0x1d88
	.word	0xe0b0a00c	! t1_kref+0x1d70:   	stha	%l0, [%g2 + 0xc]%asi
	.word	0xaba9403d	! t1_kref+0x1d74:   	fmovsug	%fcc0, %f29, %f21
	.word	0xe19f5a19	! t1_kref+0x1d78:   	ldda	[%i5 + %i1]0xd0, %f16
	.word	0xd81e7fe0	! t1_kref+0x1d7c:   	ldd	[%i1 - 0x20], %o4
	.word	0xe82e6013	! t1_kref+0x1d80:   	stb	%l4, [%i1 + 0x13]
	.word	0x9a040012	! t1_kref+0x1d84:   	add	%l0, %l2, %o5
	.word	0xb9a78833	! t1_kref+0x1d88:   	fadds	%f30, %f19, %f28
	.word	0xd41e7ff0	! t1_kref+0x1d8c:   	ldd	[%i1 - 0x10], %o2
	.word	0xada0055a	! t1_kref+0x1d90:   	fsqrtd	%f26, %f22
	.word	0x9da01114	! t1_kref+0x1d94:   	fxtod	%f20, %f14
	.word	0xa8540012	! t1_kref+0x1d98:   	umul	%l0, %l2, %l4
	sethi	%hi(2f), %o7
	.word	0xe40be1d4	! t1_kref+0x1da0:   	ldub	[%o7 + 0x1d4], %l2
	.word	0xa41ca00c	! t1_kref+0x1da4:   	xor	%l2, 0xc, %l2
	.word	0xe42be1d4	! t1_kref+0x1da8:   	stb	%l2, [%o7 + 0x1d4]
	.word	0x81dbe1d4	! t1_kref+0x1dac:   	flush	%o7 + 0x1d4
	.word	0x9eac79a1	! t1_kref+0x1db0:   	andncc	%l1, -0x65f, %o7
	.word	0xb5a0054c	! t1_kref+0x1db4:   	fsqrtd	%f12, %f26
	.word	0x81580000	! t1_kref+0x1db8:   	flushw
	.word	0xa5a3c93e	! t1_kref+0x1dbc:   	fmuls	%f15, %f30, %f18
	.word	0x81b40150	! t1_kref+0x1dc0:   	edge32l	%l0, %l0, %g0
	.word	0xec1e3ff0	! t1_kref+0x1dc4:   	ldd	[%i0 - 0x10], %l6
	.word	0xf99f1a19	! t1_kref+0x1dc8:   	ldda	[%i4 + %i1]0xd0, %f28
	.word	0x81844000	! t1_kref+0x1dcc:   	wr	%l1, %g0, %y
	.word	0x8004b534	! t1_kref+0x1dd0:   	add	%l2, -0xacc, %g0
2:	.word	0xa0a48014	! t1_kref+0x1dd4:   	subcc	%l2, %l4, %l0
	.word	0xa3a018d4	! t1_kref+0x1dd8:   	fdtos	%f20, %f17
	.word	0xc807bff0	! t1_kref+0x1ddc:   	ld	[%fp - 0x10], %g4
	.word	0xada708ca	! t1_kref+0x1de0:   	fsubd	%f28, %f10, %f22
	.word	0x81848000	! t1_kref+0x1de4:   	wr	%l2, %g0, %y
	.word	0xc12e600c	! t1_kref+0x1de8:   	st	%fsr, [%i1 + 0xc]
	.word	0x8014c012	! t1_kref+0x1dec:   	or	%l3, %l2, %g0
	.word	0xa5a00535	! t1_kref+0x1df0:   	fsqrts	%f21, %f18
	.word	0xa9b68db9	! t1_kref+0x1df4:   	fxors	%f26, %f25, %f20
	.word	0xb5a0188e	! t1_kref+0x1df8:   	fitos	%f14, %f26
	.word	0xa1a01a4a	! t1_kref+0x1dfc:   	fdtoi	%f10, %f16
	.word	0xf9871019	! t1_kref+0x1e00:   	lda	[%i4 + %i1]0x80, %f28
	.word	0xaa440010	! t1_kref+0x1e04:   	addc	%l0, %l0, %l5
	.word	0xb9a00556	! t1_kref+0x1e08:   	fsqrtd	%f22, %f28
	.word	0xe0fe3ff8	! t1_kref+0x1e0c:   	swapa	[%i0 - 8]%asi, %l0
	.word	0xa044ec6b	! t1_kref+0x1e10:   	addc	%l3, 0xc6b, %l0
	.word	0xe2267ff4	! t1_kref+0x1e14:   	st	%l1, [%i1 - 0xc]
	.word	0xa29d0014	! t1_kref+0x1e18:   	xorcc	%l4, %l4, %l1
	.word	0xf7263ff0	! t1_kref+0x1e1c:   	st	%f27, [%i0 - 0x10]
	.word	0xe8a0a004	! t1_kref+0x1e20:   	sta	%l4, [%g2 + 4]%asi
	.word	0x9de3bfa0	! t1_kref+0x1e24:   	save	%sp, -0x60, %sp
	.word	0xafef6718	! t1_kref+0x1e28:   	restore	%i5, 0x718, %l7
	.word	0x81af0adc	! t1_kref+0x1e2c:   	fcmped	%fcc0, %f28, %f28
	.word	0xe0ee3fec	! t1_kref+0x1e30:   	ldstuba	[%i0 - 0x14]%asi, %l0
	.word	0x8143c000	! t1_kref+0x1e34:   	stbar
	.word	0x99a449b7	! t1_kref+0x1e38:   	fdivs	%f17, %f23, %f12
	.word	0xaec4f73c	! t1_kref+0x1e3c:   	addccc	%l3, -0x8c4, %l7
	.word	0x81ad4aae	! t1_kref+0x1e40:   	fcmpes	%fcc0, %f21, %f14
	.word	0xf1067fe8	! t1_kref+0x1e44:   	ld	[%i1 - 0x18], %f24
	.word	0x9855208e	! t1_kref+0x1e48:   	umul	%l4, 0x8e, %o4
	.word	0xdb262010	! t1_kref+0x1e4c:   	st	%f13, [%i0 + 0x10]
	.word	0x98dc791f	! t1_kref+0x1e50:   	smulcc	%l1, -0x6e1, %o4
	.word	0xe9be1814	! t1_kref+0x1e54:   	stda	%f20, [%i0 + %l4]0xc0
	.word	0x92e44011	! t1_kref+0x1e58:   	subccc	%l1, %l1, %o1
	.word	0xa7a01a54	! t1_kref+0x1e5c:   	fdtoi	%f20, %f19
	.word	0x81dd6801	! t1_kref+0x1e60:   	flush	%l5 + 0x801
	.word	0xa1a000da	! t1_kref+0x1e64:   	fnegd	%f26, %f16
	.word	0xb5a30950	! t1_kref+0x1e68:   	fmuld	%f12, %f16, %f26
	.word	0xa3a0189e	! t1_kref+0x1e6c:   	fitos	%f30, %f17
	.word	0xa0e4be4f	! t1_kref+0x1e70:   	subccc	%l2, -0x1b1, %l0
	.word	0xd81e2000	! t1_kref+0x1e74:   	ldd	[%i0], %o4
	sethi	%hi(2f), %o7
	.word	0xe40be2c0	! t1_kref+0x1e7c:   	ldub	[%o7 + 0x2c0], %l2
	.word	0xa41ca00c	! t1_kref+0x1e80:   	xor	%l2, 0xc, %l2
	.word	0xe42be2c0	! t1_kref+0x1e84:   	stb	%l2, [%o7 + 0x2c0]
	.word	0x81dbe2c0	! t1_kref+0x1e88:   	flush	%o7 + 0x2c0
	.word	0xc07f0018	! t1_kref+0x1e8c:   	swap	[%i4 + %i0], %g0
	.word	0xe8a0a004	! t1_kref+0x1e90:   	sta	%l4, [%g2 + 4]%asi
	.word	0xed9e505d	! t1_kref+0x1e94:   	ldda	[%i1 + %i5]0x82, %f22
	.word	0xa0f4c010	! t1_kref+0x1e98:   	udivcc	%l3, %l0, %l0
	.word	0x3f800003	! t1_kref+0x1e9c:   	fbo,a	_kref+0x1ea8
	.word	0xaac48012	! t1_kref+0x1ea0:   	addccc	%l2, %l2, %l5
	.word	0x90d43526	! t1_kref+0x1ea4:   	umulcc	%l0, -0xada, %o0
	.word	0xa9a38856	! t1_kref+0x1ea8:   	faddd	%f14, %f22, %f20
	.word	0xb1a00556	! t1_kref+0x1eac:   	fsqrtd	%f22, %f24
	.word	0xb3a0013d	! t1_kref+0x1eb0:   	fabss	%f29, %f25
	.word	0xb5b00f1a	! t1_kref+0x1eb4:   	fsrc2	%f26, %f26
	.word	0x99a0054c	! t1_kref+0x1eb8:   	fsqrtd	%f12, %f12
	.word	0xec9e6010	! t1_kref+0x1ebc:   	ldda	[%i1 + 0x10]%asi, %l6
2:	.word	0xb9a00539	! t1_kref+0x1ec0:   	fsqrts	%f25, %f28
	.word	0x81ad4a3c	! t1_kref+0x1ec4:   	fcmps	%fcc0, %f21, %f28
	.word	0xa4844012	! t1_kref+0x1ec8:   	addcc	%l1, %l2, %l2
	.word	0xd01e3ff8	! t1_kref+0x1ecc:   	ldd	[%i0 - 8], %o0
	.word	0xaba348ad	! t1_kref+0x1ed0:   	fsubs	%f13, %f13, %f21
	.word	0xd9063ff0	! t1_kref+0x1ed4:   	ld	[%i0 - 0x10], %f12
	.word	0xe3ee101d	! t1_kref+0x1ed8:   	prefetcha	%i0 + %i5, 17
	.word	0xa1a01913	! t1_kref+0x1edc:   	fitod	%f19, %f16
	.word	0xa53c4011	! t1_kref+0x1ee0:   	sra	%l1, %l1, %l2
	.word	0x32480003	! t1_kref+0x1ee4:   	bne,a,pt	%icc, _kref+0x1ef0
	.word	0xa1a01919	! t1_kref+0x1ee8:   	fitod	%f25, %f16
	.word	0x93b48414	! t1_kref+0x1eec:   	fcmple16	%f18, %f20, %o1
	.word	0xe62e2011	! t1_kref+0x1ef0:   	stb	%l3, [%i0 + 0x11]
	.word	0xa7a788b4	! t1_kref+0x1ef4:   	fsubs	%f30, %f20, %f19
	.word	0x90448011	! t1_kref+0x1ef8:   	addc	%l2, %l1, %o0
	.word	0xe91e7ff0	! t1_kref+0x1efc:   	ldd	[%i1 - 0x10], %f20
	.word	0x37480007	! t1_kref+0x1f00:   	fbge,a,pt	%fcc0, _kref+0x1f1c
	.word	0xb5a748b5	! t1_kref+0x1f04:   	fsubs	%f29, %f21, %f26
	.word	0x913c6003	! t1_kref+0x1f08:   	sra	%l1, 0x3, %o0
	.word	0x20800008	! t1_kref+0x1f0c:   	bn,a	_kref+0x1f2c
	.word	0xbdb44730	! t1_kref+0x1f10:   	fmuld8ulx16	%f17, %f16, %f30
	.word	0xada0191c	! t1_kref+0x1f14:   	fitod	%f28, %f22
	.word	0x93b4c150	! t1_kref+0x1f18:   	edge32l	%l3, %l0, %o1
	.word	0xa8c4c012	! t1_kref+0x1f1c:   	addccc	%l3, %l2, %l4
	.word	0xb9b60e56	! t1_kref+0x1f20:   	fxnor	%f24, %f22, %f28
	.word	0xa5ab005a	! t1_kref+0x1f24:   	fmovduge	%fcc0, %f26, %f18
	.word	0x813cc013	! t1_kref+0x1f28:   	sra	%l3, %l3, %g0
	.word	0xa4f4c013	! t1_kref+0x1f2c:   	udivcc	%l3, %l3, %l2
	.word	0xf53e7fe8	! t1_kref+0x1f30:   	std	%f26, [%i1 - 0x18]
	.word	0xfda0a034	! t1_kref+0x1f34:   	sta	%f30, [%g2 + 0x34]%asi
	.word	0xa03c7f22	! t1_kref+0x1f38:   	xnor	%l1, -0xde, %l0
	.word	0xdd1fbef0	! t1_kref+0x1f3c:   	ldd	[%fp - 0x110], %f14
	.word	0xb1a0191c	! t1_kref+0x1f40:   	fitod	%f28, %f24
	.word	0x9da0188c	! t1_kref+0x1f44:   	fitos	%f12, %f14
	.word	0x81ac0acc	! t1_kref+0x1f48:   	fcmped	%fcc0, %f16, %f12
	.word	0xa1a00552	! t1_kref+0x1f4c:   	fsqrtd	%f18, %f16
	.word	0xd706600c	! t1_kref+0x1f50:   	ld	[%i1 + 0xc], %f11
	.word	0xa5a00534	! t1_kref+0x1f54:   	fsqrts	%f20, %f18
	.word	0x81580000	! t1_kref+0x1f58:   	flushw
	.word	0x80c4a46d	! t1_kref+0x1f5c:   	addccc	%l2, 0x46d, %g0
	.word	0xad408000	! t1_kref+0x1f60:   	mov	%ccr, %l6
	.word	0xa5a01918	! t1_kref+0x1f64:   	fitod	%f24, %f18
	.word	0x9edd0014	! t1_kref+0x1f68:   	smulcc	%l4, %l4, %o7
	.word	0x8034e2f5	! t1_kref+0x1f6c:   	orn	%l3, 0x2f5, %g0
	.word	0xa81c4014	! t1_kref+0x1f70:   	xor	%l1, %l4, %l4
	.word	0xa97033b8	! t1_kref+0x1f74:   	popc	-0xc48, %l4
	.word	0xe920a024	! t1_kref+0x1f78:   	st	%f20, [%g2 + 0x24]
	.word	0xec1f4018	! t1_kref+0x1f7c:   	ldd	[%i5 + %i0], %l6
	.word	0xec100019	! t1_kref+0x1f80:   	lduh	[%g0 + %i1], %l6
	.word	0xb1b70d8c	! t1_kref+0x1f84:   	fxor	%f28, %f12, %f24
	.word	0xb5b48a52	! t1_kref+0x1f88:   	fpadd32	%f18, %f18, %f26
	.word	0x9a3c7f1e	! t1_kref+0x1f8c:   	xnor	%l1, -0xe2, %o5
	.word	0xacc4fab0	! t1_kref+0x1f90:   	addccc	%l3, -0x550, %l6
	.word	0xa4fc0012	! t1_kref+0x1f94:   	sdivcc	%l0, %l2, %l2
	.word	0x81dc23d0	! t1_kref+0x1f98:   	flush	%l0 + 0x3d0
	.word	0x9a94f6a8	! t1_kref+0x1f9c:   	orcc	%l3, -0x958, %o5
	.word	0x99a01919	! t1_kref+0x1fa0:   	fitod	%f25, %f12
	.word	0x9654ef3d	! t1_kref+0x1fa4:   	umul	%l3, 0xf3d, %o3
	.word	0xa5b78918	! t1_kref+0x1fa8:   	faligndata	%f30, %f24, %f18
	.word	0x81b6050e	! t1_kref+0x1fac:   	fcmpgt16	%f24, %f14, %g0
	.word	0xa83c4013	! t1_kref+0x1fb0:   	xnor	%l1, %l3, %l4
	.word	0xf007bfe0	! t1_kref+0x1fb4:   	ld	[%fp - 0x20], %i0
	.word	0xe2780018	! t1_kref+0x1fb8:   	swap	[%g0 + %i0], %l1
	.word	0x96548014	! t1_kref+0x1fbc:   	umul	%l2, %l4, %o3
	.word	0xb3a0012c	! t1_kref+0x1fc0:   	fabss	%f12, %f25
	.word	0xa4d430a0	! t1_kref+0x1fc4:   	umulcc	%l0, -0xf60, %l2
	.word	0x9fc00004	! t1_kref+0x1fc8:   	call	%g0 + %g4
	.word	0x92548014	! t1_kref+0x1fcc:   	umul	%l2, %l4, %o1
	.word	0x2d480004	! t1_kref+0x1fd0:   	fbg,a,pt	%fcc0, _kref+0x1fe0
	.word	0xda100019	! t1_kref+0x1fd4:   	lduh	[%g0 + %i1], %o5
	.word	0x99b00f10	! t1_kref+0x1fd8:   	fsrc2	%f16, %f12
	.word	0x9e542a5c	! t1_kref+0x1fdc:   	umul	%l0, 0xa5c, %o7
	.word	0xe826200c	! t1_kref+0x1fe0:   	st	%l4, [%i0 + 0xc]
	.word	0x920c4014	! t1_kref+0x1fe4:   	and	%l1, %l4, %o1
	.word	0xe11e6000	! t1_kref+0x1fe8:   	ldd	[%i1], %f16
	.word	0xa5b00774	! t1_kref+0x1fec:   	fpack16	%f20, %f18
	.word	0xbda0102b	! t1_kref+0x1ff0:   	fstox	%f11, %f30
	.word	0x908d387f	! t1_kref+0x1ff4:   	andcc	%l4, -0x781, %o0
	.word	0xe87e3ff8	! t1_kref+0x1ff8:   	swap	[%i0 - 8], %l4
	.word	0x3d800003	! t1_kref+0x1ffc:   	fbule,a	_kref+0x2008
	.word	0xb1b38e50	! t1_kref+0x2000:   	fxnor	%f14, %f16, %f24
	.word	0x81aeca3e	! t1_kref+0x2004:   	fcmps	%fcc0, %f27, %f30
	.word	0xa63c7acd	! t1_kref+0x2008:   	xnor	%l1, -0x533, %l3
	.word	0xf11fbd88	! t1_kref+0x200c:   	ldd	[%fp - 0x278], %f24
	.word	0x9fc10000	! t1_kref+0x2010:   	call	%g4
	.word	0xb7a0013d	! t1_kref+0x2014:   	fabss	%f29, %f27
	.word	0x81db3744	! t1_kref+0x2018:   	flush	%o4 - 0x8bc
	.word	0xa49d0013	! t1_kref+0x201c:   	xorcc	%l4, %l3, %l2
	.word	0xa9a01110	! t1_kref+0x2020:   	fxtod	%f16, %f20
	.word	0xaa84e9c0	! t1_kref+0x2024:   	addcc	%l3, 0x9c0, %l5
	.word	0x9ea4255f	! t1_kref+0x2028:   	subcc	%l0, 0x55f, %o7
	.word	0xaa44ae7d	! t1_kref+0x202c:   	addc	%l2, 0xe7d, %l5
	.word	0x93400000	! t1_kref+0x2030:   	mov	%y, %o1
	.word	0x81ae8a2b	! t1_kref+0x2034:   	fcmps	%fcc0, %f26, %f11
	.word	0x81848000	! t1_kref+0x2038:   	wr	%l2, %g0, %y
	.word	0x9fc00004	! t1_kref+0x203c:   	call	%g0 + %g4
	.word	0xa00cc012	! t1_kref+0x2040:   	and	%l3, %l2, %l0
	.word	0x81ae0a52	! t1_kref+0x2044:   	fcmpd	%fcc0, %f24, %f18
	.word	0xe67e3ff8	! t1_kref+0x2048:   	swap	[%i0 - 8], %l3
	.word	0x92e53580	! t1_kref+0x204c:   	subccc	%l4, -0xa80, %o1
	.word	0xa5b6067d	! t1_kref+0x2050:   	fmul8x16au	%f24, %f29, %f18
	.word	0xd27e3ff4	! t1_kref+0x2054:   	swap	[%i0 - 0xc], %o1
	.word	0x9e9c7888	! t1_kref+0x2058:   	xorcc	%l1, -0x778, %o7
	.word	0xed1e3ff8	! t1_kref+0x205c:   	ldd	[%i0 - 8], %f22
	.word	0xb5a0052b	! t1_kref+0x2060:   	fsqrts	%f11, %f26
	.word	0xa7b4c240	! t1_kref+0x2064:   	array16	%l3, %g0, %l3
	.word	0xd4180018	! t1_kref+0x2068:   	ldd	[%g0 + %i0], %o2
	.word	0x993c4011	! t1_kref+0x206c:   	sra	%l1, %l1, %o4
	.word	0xc12e2010	! t1_kref+0x2070:   	st	%fsr, [%i0 + 0x10]
	.word	0x813c8010	! t1_kref+0x2074:   	sra	%l2, %l0, %g0
	.word	0xd83e2000	! t1_kref+0x2078:   	std	%o4, [%i0]
	.word	0xfb067ffc	! t1_kref+0x207c:   	ld	[%i1 - 4], %f29
	.word	0xe1e8a049	! t1_kref+0x2080:   	prefetcha	%g2 + 0x49, 16
	.word	0x983c23e1	! t1_kref+0x2084:   	xnor	%l0, 0x3e1, %o4
	.word	0xa9b440b3	! t1_kref+0x2088:   	edge16n	%l1, %l3, %l4
	.word	0x81b40598	! t1_kref+0x208c:   	fcmpgt32	%f16, %f24, %g0
	.word	0x81840000	! t1_kref+0x2090:   	wr	%l0, %g0, %y
	.word	0x1137b7d9	! t1_kref+0x2094:   	sethi	%hi(0xdedf6400), %o0
	.word	0x99408000	! t1_kref+0x2098:   	mov	%ccr, %o4
	.word	0x9ebc36c8	! t1_kref+0x209c:   	xnorcc	%l0, -0x938, %o7
	.word	0x94542204	! t1_kref+0x20a0:   	umul	%l0, 0x204, %o2
	.word	0x81accaab	! t1_kref+0x20a4:   	fcmpes	%fcc0, %f19, %f11
	.word	0x989d0010	! t1_kref+0x20a8:   	xorcc	%l4, %l0, %o4
	.word	0xa6152717	! t1_kref+0x20ac:   	or	%l4, 0x717, %l3
	.word	0xe168a009	! t1_kref+0x20b0:   	prefetch	%g2 + 9, 16
	.word	0x99a0190e	! t1_kref+0x20b4:   	fitod	%f14, %f12
	.word	0xebe8a100	! t1_kref+0x20b8:   	prefetcha	%g2 + 0x100, 21
	.word	0xd2c8a024	! t1_kref+0x20bc:   	ldsba	[%g2 + 0x24]%asi, %o1
	.word	0x31480004	! t1_kref+0x20c0:   	fba,a,pt	%fcc0, _kref+0x20d0
	.word	0xd9a0a024	! t1_kref+0x20c4:   	sta	%f12, [%g2 + 0x24]%asi
	.word	0xe2c0a02c	! t1_kref+0x20c8:   	ldswa	[%g2 + 0x2c]%asi, %l1
	.word	0x81ad8ab4	! t1_kref+0x20cc:   	fcmpes	%fcc0, %f22, %f20
	.word	0xafb40280	! t1_kref+0x20d0:   	array32	%l0, %g0, %l7
	.word	0xa834b5d5	! t1_kref+0x20d4:   	orn	%l2, -0xa2b, %l4
	.word	0xe630a02e	! t1_kref+0x20d8:   	sth	%l3, [%g2 + 0x2e]
	.word	0x9db007b4	! t1_kref+0x20dc:   	fpackfix	%f20, %f14
	.word	0xb3a00139	! t1_kref+0x20e0:   	fabss	%f25, %f25
	.word	0xada0054e	! t1_kref+0x20e4:   	fsqrtd	%f14, %f22
	.word	0x94540010	! t1_kref+0x20e8:   	umul	%l0, %l0, %o2
	.word	0xed1fbe60	! t1_kref+0x20ec:   	ldd	[%fp - 0x1a0], %f22
	.word	0xd03e2018	! t1_kref+0x20f0:   	std	%o0, [%i0 + 0x18]
	.word	0x32480008	! t1_kref+0x20f4:   	bne,a,pt	%icc, _kref+0x2114
	.word	0xa8f47130	! t1_kref+0x20f8:   	udivcc	%l1, -0xed0, %l4
	.word	0xed1fbf58	! t1_kref+0x20fc:   	ldd	[%fp - 0xa8], %f22
	.word	0xe228a00d	! t1_kref+0x2100:   	stb	%l1, [%g2 + 0xd]
	.word	0xb5b38a12	! t1_kref+0x2104:   	fpadd16	%f14, %f18, %f26
	.word	0x81df8001	! t1_kref+0x2108:   	flush	%fp + %g1
	.word	0xe230a014	! t1_kref+0x210c:   	sth	%l1, [%g2 + 0x14]
	.word	0x95a68856	! t1_kref+0x2110:   	faddd	%f26, %f22, %f10
	.word	0x99b48676	! t1_kref+0x2114:   	fmul8x16au	%f18, %f22, %f12
	.word	0xf207bfe0	! t1_kref+0x2118:   	ld	[%fp - 0x20], %i1
	.word	0xaec43e39	! t1_kref+0x211c:   	addccc	%l0, -0x1c7, %l7
	.word	0x3b480003	! t1_kref+0x2120:   	fble,a,pt	%fcc0, _kref+0x212c
	.word	0x9e2c8013	! t1_kref+0x2124:   	andn	%l2, %l3, %o7
	.word	0xbba018d4	! t1_kref+0x2128:   	fdtos	%f20, %f29
	.word	0xac9c4012	! t1_kref+0x212c:   	xorcc	%l1, %l2, %l6
	.word	0xd2df5018	! t1_kref+0x2130:   	ldxa	[%i5 + %i0]0x80, %o1
	.word	0xa9a48858	! t1_kref+0x2134:   	faddd	%f18, %f24, %f20
	.word	0xa9b48030	! t1_kref+0x2138:   	edge8n	%l2, %l0, %l4
	.word	0x29480001	! t1_kref+0x213c:   	fbl,a,pt	%fcc0, _kref+0x2140
	.word	0x9a2d2daa	! t1_kref+0x2140:   	andn	%l4, 0xdaa, %o5
	.word	0x31480008	! t1_kref+0x2144:   	fba,a,pt	%fcc0, _kref+0x2164
	.word	0xd53e7ff8	! t1_kref+0x2148:   	std	%f10, [%i1 - 8]
	.word	0xdd06001c	! t1_kref+0x214c:   	ld	[%i0 + %i4], %f14
	.word	0xa40d203f	! t1_kref+0x2150:   	and	%l4, 0x3f, %l2
	.word	0xbda68d35	! t1_kref+0x2154:   	fsmuld	%f26, %f21, %f30
	.word	0xe6300019	! t1_kref+0x2158:   	sth	%l3, [%g0 + %i1]
	.word	0xe99e1a1d	! t1_kref+0x215c:   	ldda	[%i0 + %i5]0xd0, %f20
	.word	0xc1f65014	! t1_kref+0x2160:   	casxa	[%i1]0x80, %l4, %g0
	.word	0x39480006	! t1_kref+0x2164:   	fbuge,a,pt	%fcc0, _kref+0x217c
	.word	0xe42e4000	! t1_kref+0x2168:   	stb	%l2, [%i1]
	.word	0x2f480005	! t1_kref+0x216c:   	fbu,a,pt	%fcc0, _kref+0x2180
	.word	0xda7e201c	! t1_kref+0x2170:   	swap	[%i0 + 0x1c], %o5
	.word	0xaa940012	! t1_kref+0x2174:   	orcc	%l0, %l2, %l5
	.word	0xbda0190c	! t1_kref+0x2178:   	fitod	%f12, %f30
	.word	0xac9c3c09	! t1_kref+0x217c:   	xorcc	%l0, -0x3f7, %l6
	.word	0x99b70e80	! t1_kref+0x2180:   	fsrc1	%f28, %f12
	.word	0xe7ee501a	! t1_kref+0x2184:   	prefetcha	%i1 + %i2, 19
	.word	0x972c8010	! t1_kref+0x2188:   	sll	%l2, %l0, %o3
	.word	0xa9140014	! t1_kref+0x218c:   	taddcctv	%l0, %l4, %l4
	.word	0x99400000	! t1_kref+0x2190:   	mov	%y, %o4
	.word	0xc5e8a001	! t1_kref+0x2194:   	prefetcha	%g2 + 1, 2
	.word	0xf207bfe0	! t1_kref+0x2198:   	ld	[%fp - 0x20], %i1
	.word	0x8004c012	! t1_kref+0x219c:   	add	%l3, %l2, %g0
	.word	0xaeb4ecbe	! t1_kref+0x21a0:   	orncc	%l3, 0xcbe, %l7
	.word	0x25480005	! t1_kref+0x21a4:   	fblg,a,pt	%fcc0, _kref+0x21b8
	.word	0xada389b5	! t1_kref+0x21a8:   	fdivs	%f14, %f21, %f22
	.word	0x94a48010	! t1_kref+0x21ac:   	subcc	%l2, %l0, %o2
	.word	0xe0280018	! t1_kref+0x21b0:   	stb	%l0, [%g0 + %i0]
	.word	0xd91fbd48	! t1_kref+0x21b4:   	ldd	[%fp - 0x2b8], %f12
	.word	0x9fc10000	! t1_kref+0x21b8:   	call	%g4
	.word	0x973c6018	! t1_kref+0x21bc:   	sra	%l1, 0x18, %o3
	.word	0xd9be5854	! t1_kref+0x21c0:   	stda	%f12, [%i1 + %l4]0xc2
	.word	0xe9062014	! t1_kref+0x21c4:   	ld	[%i0 + 0x14], %f20
	.word	0x92acba2d	! t1_kref+0x21c8:   	andncc	%l2, -0x5d3, %o1
	.word	0xa7400000	! t1_kref+0x21cc:   	mov	%y, %l3
	.word	0x96847393	! t1_kref+0x21d0:   	addcc	%l1, -0xc6d, %o3
	.word	0xa6f4eadc	! t1_kref+0x21d4:   	udivcc	%l3, 0xadc, %l3
	.word	0xa89cc011	! t1_kref+0x21d8:   	xorcc	%l3, %l1, %l4
	.word	0xb1b68e0a	! t1_kref+0x21dc:   	fand	%f26, %f10, %f24
	.word	0x8143c000	! t1_kref+0x21e0:   	stbar
	.word	0x933cc013	! t1_kref+0x21e4:   	sra	%l3, %l3, %o1
	.word	0x9de3bfa0	! t1_kref+0x21e8:   	save	%sp, -0x60, %sp
	.word	0x9bee36c7	! t1_kref+0x21ec:   	restore	%i0, -0x939, %o5
	.word	0x86102011	! t1_kref+0x21f0:   	mov	0x11, %g3
	.word	0x86a0e001	! t1_kref+0x21f4:   	subcc	%g3, 1, %g3
	.word	0x22800020	! t1_kref+0x21f8:   	be,a	_kref+0x2278
	.word	0x9fb48074	! t1_kref+0x21fc:   	edge8ln	%l2, %l4, %o7
	.word	0x9bb48240	! t1_kref+0x2200:   	array16	%l2, %g0, %o5
	.word	0x9fc00004	! t1_kref+0x2204:   	call	%g0 + %g4
	.word	0xabb007b8	! t1_kref+0x2208:   	fpackfix	%f24, %f21
	.word	0x80fd0013	! t1_kref+0x220c:   	sdivcc	%l4, %l3, %g0
	.word	0x81840000	! t1_kref+0x2210:   	wr	%l0, %g0, %y
	.word	0xa1ab8058	! t1_kref+0x2214:   	fmovdule	%fcc0, %f24, %f16
	.word	0x9fb4ca7b	! t1_kref+0x2218:   	fpadd32s	%f19, %f27, %f15
	.word	0x81dcc000	! t1_kref+0x221c:   	flush	%l3
	.word	0x81ae8ace	! t1_kref+0x2220:   	fcmped	%fcc0, %f26, %f14
	.word	0xb5a789ce	! t1_kref+0x2224:   	fdivd	%f30, %f14, %f26
	.word	0x9ec40010	! t1_kref+0x2228:   	addccc	%l0, %l0, %o7
	.word	0xbdb00c00	! t1_kref+0x222c:   	fzero	%f30
	.word	0xe220a034	! t1_kref+0x2230:   	st	%l1, [%g2 + 0x34]
	.word	0xe47e3fec	! t1_kref+0x2234:   	swap	[%i0 - 0x14], %l2
	.word	0x8143c000	! t1_kref+0x2238:   	stbar
	.word	0x3a4fffee	! t1_kref+0x223c:   	bcc,a,pt	%icc, _kref+0x21f4
	.word	0x211cb427	! t1_kref+0x2240:   	sethi	%hi(0x72d09c00), %l0
	.word	0x80bc0012	! t1_kref+0x2244:   	xnorcc	%l0, %l2, %g0
	.word	0xe6ae7fe2	! t1_kref+0x2248:   	stba	%l3, [%i1 - 0x1e]%asi
	.word	0x95a0191c	! t1_kref+0x224c:   	fitod	%f28, %f10
	.word	0x97b50332	! t1_kref+0x2250:   	bmask	%l4, %l2, %o3
	.word	0x81ddb3b8	! t1_kref+0x2254:   	flush	%l6 - 0xc48
	.word	0xadb68636	! t1_kref+0x2258:   	fmul8x16	%f26, %f22, %f22
	.word	0x9da00556	! t1_kref+0x225c:   	fsqrtd	%f22, %f14
	.word	0xa6146939	! t1_kref+0x2260:   	or	%l1, 0x939, %l3
	.word	0xada000ba	! t1_kref+0x2264:   	fnegs	%f26, %f22
	.word	0xa45d0012	! t1_kref+0x2268:   	smul	%l4, %l2, %l2
	.word	0xa0f48012	! t1_kref+0x226c:   	udivcc	%l2, %l2, %l0
	.word	0xa49d0012	! t1_kref+0x2270:   	xorcc	%l4, %l2, %l2
	.word	0xa23c8013	! t1_kref+0x2274:   	xnor	%l2, %l3, %l1
	.word	0xae4439ec	! t1_kref+0x2278:   	addc	%l0, -0x614, %l7
	.word	0x99b30c9a	! t1_kref+0x227c:   	fandnot2	%f12, %f26, %f12
	.word	0x9634c010	! t1_kref+0x2280:   	orn	%l3, %l0, %o3
	.word	0x9ed4364d	! t1_kref+0x2284:   	umulcc	%l0, -0x9b3, %o7
	.word	0xd51e001d	! t1_kref+0x2288:   	ldd	[%i0 + %i5], %f10
	.word	0x8143c000	! t1_kref+0x228c:   	stbar
	.word	0x99a648b6	! t1_kref+0x2290:   	fsubs	%f25, %f22, %f12
	.word	0xed000019	! t1_kref+0x2294:   	ld	[%g0 + %i1], %f22
	.word	0xa1a348b6	! t1_kref+0x2298:   	fsubs	%f13, %f22, %f16
	.word	0xe22e8019	! t1_kref+0x229c:   	stb	%l1, [%i2 + %i1]
	.word	0xdf863fe8	! t1_kref+0x22a0:   	lda	[%i0 - 0x18]%asi, %f15
	.word	0xa9a388b6	! t1_kref+0x22a4:   	fsubs	%f14, %f22, %f20
	.word	0xa1a0052e	! t1_kref+0x22a8:   	fsqrts	%f14, %f16
	.word	0xda6e2001	! t1_kref+0x22ac:   	ldstub	[%i0 + 1], %o5
	.word	0x9da588da	! t1_kref+0x22b0:   	fsubd	%f22, %f26, %f14
	.word	0xa5a50937	! t1_kref+0x22b4:   	fmuls	%f20, %f23, %f18
	.word	0xada4c93c	! t1_kref+0x22b8:   	fmuls	%f19, %f28, %f22
	.word	0xb1a50d39	! t1_kref+0x22bc:   	fsmuld	%f20, %f25, %f24
	.word	0x81ab0acc	! t1_kref+0x22c0:   	fcmped	%fcc0, %f12, %f12
	.word	0x96e4319c	! t1_kref+0x22c4:   	subccc	%l0, -0xe64, %o3
	.word	0xa6c4f970	! t1_kref+0x22c8:   	addccc	%l3, -0x690, %l3
	.word	0xaca43cc3	! t1_kref+0x22cc:   	subcc	%l0, -0x33d, %l6
	.word	0x8143e040	! t1_kref+0x22d0:   	membar	0x40
	.word	0xeba0a02c	! t1_kref+0x22d4:   	sta	%f21, [%g2 + 0x2c]%asi
	.word	0x9e544013	! t1_kref+0x22d8:   	umul	%l1, %l3, %o7
	.word	0x29800008	! t1_kref+0x22dc:   	fbl,a	_kref+0x22fc
	.word	0xaa342783	! t1_kref+0x22e0:   	orn	%l0, 0x783, %l5
	.word	0xe4ae501a	! t1_kref+0x22e4:   	stba	%l2, [%i1 + %i2]0x80
	.word	0x99a00133	! t1_kref+0x22e8:   	fabss	%f19, %f12
	.word	0xbda00136	! t1_kref+0x22ec:   	fabss	%f22, %f30
	.word	0xe5267ff0	! t1_kref+0x22f0:   	st	%f18, [%i1 - 0x10]
	.word	0x81ab8a39	! t1_kref+0x22f4:   	fcmps	%fcc0, %f14, %f25
	.word	0xbdb009be	! t1_kref+0x22f8:   	fexpand	%f30, %f30
	.word	0xb9a4895a	! t1_kref+0x22fc:   	fmuld	%f18, %f26, %f28
	.word	0x950c8010	! t1_kref+0x2300:   	tsubcc	%l2, %l0, %o2
	.word	0xd91fbc58	! t1_kref+0x2304:   	ldd	[%fp - 0x3a8], %f12
	.word	0xa1a70d3d	! t1_kref+0x2308:   	fsmuld	%f28, %f29, %f16
	.word	0xae843cd3	! t1_kref+0x230c:   	addcc	%l0, -0x32d, %l7
	.word	0xbdb40d1c	! t1_kref+0x2310:   	fandnot1	%f16, %f28, %f30
	.word	0xed3e6018	! t1_kref+0x2314:   	std	%f22, [%i1 + 0x18]
	.word	0xe42e7fe6	! t1_kref+0x2318:   	stb	%l2, [%i1 - 0x1a]
	.word	0xe6a0a014	! t1_kref+0x231c:   	sta	%l3, [%g2 + 0x14]%asi
	.word	0x81ae8ad6	! t1_kref+0x2320:   	fcmped	%fcc0, %f26, %f22
	.word	0xbdb58dd6	! t1_kref+0x2324:   	fnand	%f22, %f22, %f30
	.word	0xa4948013	! t1_kref+0x2328:   	orcc	%l2, %l3, %l2
	.word	0x31800001	! t1_kref+0x232c:   	fba,a	_kref+0x2330
	.word	0xa6c50013	! t1_kref+0x2330:   	addccc	%l4, %l3, %l3
	.word	0x33480001	! t1_kref+0x2334:   	fbe,a,pt	%fcc0, _kref+0x2338
	.word	0xd8164000	! t1_kref+0x2338:   	lduh	[%i1], %o4
	.word	0xa4c5316a	! t1_kref+0x233c:   	addccc	%l4, -0xe96, %l2
	.word	0xaba7083b	! t1_kref+0x2340:   	fadds	%f28, %f27, %f21
	.word	0xe830a034	! t1_kref+0x2344:   	sth	%l4, [%g2 + 0x34]
	.word	0xf9beda18	! t1_kref+0x2348:   	stda	%f28, [%i3 + %i0]0xd0
	.word	0x3e480007	! t1_kref+0x234c:   	bvc,a,pt	%icc, _kref+0x2368
	.word	0xa93c201b	! t1_kref+0x2350:   	sra	%l0, 0x1b, %l4
	.word	0x9fa018d8	! t1_kref+0x2354:   	fdtos	%f24, %f15
	.word	0x9fb40550	! t1_kref+0x2358:   	fcmpeq16	%f16, %f16, %o7
	.word	0xe6262010	! t1_kref+0x235c:   	st	%l3, [%i0 + 0x10]
	.word	0x92fcbed9	! t1_kref+0x2360:   	sdivcc	%l2, -0x127, %o1
	.word	0xb9a0054e	! t1_kref+0x2364:   	fsqrtd	%f14, %f28
	.word	0xb1b40d40	! t1_kref+0x2368:   	fnot1	%f16, %f24
	.word	0xdb200019	! t1_kref+0x236c:   	st	%f13, [%g0 + %i1]
	.word	0xa1b48a50	! t1_kref+0x2370:   	fpadd32	%f18, %f16, %f16
	.word	0xa1a3894c	! t1_kref+0x2374:   	fmuld	%f14, %f12, %f16
	.word	0x947d0010	! t1_kref+0x2378:   	sdiv	%l4, %l0, %o2
	.word	0x81af4a33	! t1_kref+0x237c:   	fcmps	%fcc0, %f29, %f19
	.word	0x2a800007	! t1_kref+0x2380:   	bcs,a	_kref+0x239c
	.word	0xee06001c	! t1_kref+0x2384:   	ld	[%i0 + %i4], %l7
	.word	0x9f414000	! t1_kref+0x2388:   	mov	%pc, %o7
	.word	0x3e800002	! t1_kref+0x238c:   	bvc,a	_kref+0x2394
	.word	0xa9a01915	! t1_kref+0x2390:   	fitod	%f21, %f20
	.word	0xd2ce101a	! t1_kref+0x2394:   	ldsba	[%i0 + %i2]0x80, %o1
	.word	0xbda018ce	! t1_kref+0x2398:   	fdtos	%f14, %f30
	.word	0x85840010	! t1_kref+0x239c:   	wr	%l0, %l0, %ccr
	.word	0xe2166014	! t1_kref+0x23a0:   	lduh	[%i1 + 0x14], %l1
	.word	0xc368a004	! t1_kref+0x23a4:   	prefetch	%g2 + 4, 1
	.word	0xafa0052c	! t1_kref+0x23a8:   	fsqrts	%f12, %f23
	.word	0x9fc10000	! t1_kref+0x23ac:   	call	%g4
	.word	0xfd26001c	! t1_kref+0x23b0:   	st	%f30, [%i0 + %i4]
	.word	0xa7a01a5c	! t1_kref+0x23b4:   	fdtoi	%f28, %f19
	.word	0x39480005	! t1_kref+0x23b8:   	fbuge,a,pt	%fcc0, _kref+0x23cc
	.word	0xe9ee501c	! t1_kref+0x23bc:   	prefetcha	%i1 + %i4, 20
	.word	0x30800002	! t1_kref+0x23c0:   	ba,a	_kref+0x23c8
	.word	0xf320a02c	! t1_kref+0x23c4:   	st	%f25, [%g2 + 0x2c]
	.word	0xc3e8a042	! t1_kref+0x23c8:   	prefetcha	%g2 + 0x42, 1
	.word	0xe8263ffc	! t1_kref+0x23cc:   	st	%l4, [%i0 - 4]
	.word	0xa9b40130	! t1_kref+0x23d0:   	edge32n	%l0, %l0, %l4
	.word	0x9da7483e	! t1_kref+0x23d4:   	fadds	%f29, %f30, %f14
	.word	0xc768a005	! t1_kref+0x23d8:   	prefetch	%g2 + 5, 3
	.word	0xb5a00534	! t1_kref+0x23dc:   	fsqrts	%f20, %f26
	.word	0xe11fbf10	! t1_kref+0x23e0:   	ldd	[%fp - 0xf0], %f16
	.word	0xa3b50050	! t1_kref+0x23e4:   	edge8l	%l4, %l0, %l1
	.word	0xe20e6016	! t1_kref+0x23e8:   	ldub	[%i1 + 0x16], %l1
	.word	0x8143e040	! t1_kref+0x23ec:   	membar	0x40
	.word	0x81dffc76	! t1_kref+0x23f0:   	flush	%i7 - 0x38a
	.word	0xe0160000	! t1_kref+0x23f4:   	lduh	[%i0], %l0
	.word	0x3c480006	! t1_kref+0x23f8:   	bpos,a,pt	%icc, _kref+0x2410
	.word	0xac5cb878	! t1_kref+0x23fc:   	smul	%l2, -0x788, %l6
	.word	0x8143c000	! t1_kref+0x2400:   	stbar
	.word	0xd2563ffa	! t1_kref+0x2404:   	ldsh	[%i0 - 6], %o1
	.word	0xb5a0054a	! t1_kref+0x2408:   	fsqrtd	%f10, %f26
	.word	0xe2b0a014	! t1_kref+0x240c:   	stha	%l1, [%g2 + 0x14]%asi
	.word	0xb1a000b8	! t1_kref+0x2410:   	fnegs	%f24, %f24
	.word	0xf51fbd38	! t1_kref+0x2414:   	ldd	[%fp - 0x2c8], %f26
	.word	0x9fc00004	! t1_kref+0x2418:   	call	%g0 + %g4
	.word	0xa004bc7d	! t1_kref+0x241c:   	add	%l2, -0x383, %l0
	.word	0xb1a000d4	! t1_kref+0x2420:   	fnegd	%f20, %f24
	.word	0x81ae4a3a	! t1_kref+0x2424:   	fcmps	%fcc0, %f25, %f26
	.word	0xd6d0a016	! t1_kref+0x2428:   	ldsha	[%g2 + 0x16]%asi, %o3
	.word	0x81af8a38	! t1_kref+0x242c:   	fcmps	%fcc0, %f30, %f24
	.word	0x95a00558	! t1_kref+0x2430:   	fsqrtd	%f24, %f10
	.word	0xe830a034	! t1_kref+0x2434:   	sth	%l4, [%g2 + 0x34]
	.word	0xf11fbc98	! t1_kref+0x2438:   	ldd	[%fp - 0x368], %f24
	.word	0xa1b4463a	! t1_kref+0x243c:   	fmul8x16	%f17, %f26, %f16
	.word	0xae7c0013	! t1_kref+0x2440:   	sdiv	%l0, %l3, %l7
	.word	0x8143c000	! t1_kref+0x2444:   	stbar
	.word	0xac746a77	! t1_kref+0x2448:   	udiv	%l1, 0xa77, %l6
	.word	0xa034f76e	! t1_kref+0x244c:   	orn	%l3, -0x892, %l0
	.word	0xadb78634	! t1_kref+0x2450:   	fmul8x16	%f30, %f20, %f22
	.word	0x92f4c011	! t1_kref+0x2454:   	udivcc	%l3, %l1, %o1
	.word	0xe82e3ff3	! t1_kref+0x2458:   	stb	%l4, [%i0 - 0xd]
	.word	0xa6a44012	! t1_kref+0x245c:   	subcc	%l1, %l2, %l3
	.word	0x99b385da	! t1_kref+0x2460:   	fcmpeq32	%f14, %f26, %o4
	.word	0x8143e031	! t1_kref+0x2464:   	membar	0x31
	.word	0xf207bfe0	! t1_kref+0x2468:   	ld	[%fp - 0x20], %i1
	.word	0x99a01918	! t1_kref+0x246c:   	fitod	%f24, %f12
	.word	0x38800005	! t1_kref+0x2470:   	bgu,a	_kref+0x2484
	.word	0xa6740011	! t1_kref+0x2474:   	udiv	%l0, %l1, %l3
	.word	0x39480007	! t1_kref+0x2478:   	fbuge,a,pt	%fcc0, _kref+0x2494
	.word	0xaa9d3683	! t1_kref+0x247c:   	xorcc	%l4, -0x97d, %l5
	.word	0xb1a0191d	! t1_kref+0x2480:   	fitod	%f29, %f24
	.word	0x33480005	! t1_kref+0x2484:   	fbe,a,pt	%fcc0, _kref+0x2498
	.word	0xb5b48a18	! t1_kref+0x2488:   	fpadd16	%f18, %f24, %f26
	.word	0xb7a0052b	! t1_kref+0x248c:   	fsqrts	%f11, %f27
	.word	0xec1e001d	! t1_kref+0x2490:   	ldd	[%i0 + %i5], %l6
	.word	0xd81e4000	! t1_kref+0x2494:   	ldd	[%i1], %o4
	.word	0x92842259	! t1_kref+0x2498:   	addcc	%l0, 0x259, %o1
	.word	0xacc50014	! t1_kref+0x249c:   	addccc	%l4, %l4, %l6
	.word	0xa13ca000	! t1_kref+0x24a0:   	sra	%l2, 0x0, %l0
	.word	0x81ae0a4c	! t1_kref+0x24a4:   	fcmpd	%fcc0, %f24, %f12
	.word	0x99b70e0c	! t1_kref+0x24a8:   	fand	%f28, %f12, %f12
	.word	0xa1a6094e	! t1_kref+0x24ac:   	fmuld	%f24, %f14, %f16
	.word	0xe8264000	! t1_kref+0x24b0:   	st	%l4, [%i1]
	.word	0xadb007b0	! t1_kref+0x24b4:   	fpackfix	%f16, %f22
	.word	0xd7e65010	! t1_kref+0x24b8:   	casa	[%i1]0x80, %l0, %o3
	.word	0x9134e000	! t1_kref+0x24bc:   	srl	%l3, 0x0, %o0
	.word	0x9fa389b1	! t1_kref+0x24c0:   	fdivs	%f14, %f17, %f15
	.word	0xae0ce444	! t1_kref+0x24c4:   	and	%l3, 0x444, %l7
	.word	0x99400000	! t1_kref+0x24c8:   	mov	%y, %o4
	.word	0xa1a0055e	! t1_kref+0x24cc:   	fsqrtd	%f30, %f16
	.word	0x81b50051	! t1_kref+0x24d0:   	edge8l	%l4, %l1, %g0
	.word	0x95b346ac	! t1_kref+0x24d4:   	fmul8x16al	%f13, %f12, %f10
	.word	0xac9d3523	! t1_kref+0x24d8:   	xorcc	%l4, -0xadd, %l6
	.word	0xa5a01035	! t1_kref+0x24dc:   	fstox	%f21, %f18
	.word	0x945c28b2	! t1_kref+0x24e0:   	smul	%l0, 0x8b2, %o2
	.word	0x9ba8403b	! t1_kref+0x24e4:   	fmovsne	%fcc0, %f27, %f13
	.word	0xe926401c	! t1_kref+0x24e8:   	st	%f20, [%i1 + %i4]
	.word	0xd4de101d	! t1_kref+0x24ec:   	ldxa	[%i0 + %i5]0x80, %o2
	.word	0xbba0053e	! t1_kref+0x24f0:   	fsqrts	%f30, %f29
	.word	0xe0d0a014	! t1_kref+0x24f4:   	ldsha	[%g2 + 0x14]%asi, %l0
	.word	0xedbe3ff8	! t1_kref+0x24f8:   	stda	%f22, [%i0 - 8]%asi
	.word	0x81af0a58	! t1_kref+0x24fc:   	fcmpd	%fcc0, %f28, %f24
	.word	0x8d84ecae	! t1_kref+0x2500:   	wr	%l3, 0xcae, %fprs
	.word	0xf3a0a03c	! t1_kref+0x2504:   	sta	%f25, [%g2 + 0x3c]%asi
	.word	0x965462ef	! t1_kref+0x2508:   	umul	%l1, 0x2ef, %o3
	.word	0x81ad4a39	! t1_kref+0x250c:   	fcmps	%fcc0, %f21, %f25
	.word	0x81aecabc	! t1_kref+0x2510:   	fcmpes	%fcc0, %f27, %f28
	.word	0xc12e7fe8	! t1_kref+0x2514:   	st	%fsr, [%i1 - 0x18]
	.word	0xb5a00538	! t1_kref+0x2518:   	fsqrts	%f24, %f26
	.word	0x9b344014	! t1_kref+0x251c:   	srl	%l1, %l4, %o5
	.word	0xabb5854a	! t1_kref+0x2520:   	fcmpeq16	%f22, %f10, %l5
	.word	0xe8200019	! t1_kref+0x2524:   	st	%l4, [%g0 + %i1]
	.word	0xebe8a04e	! t1_kref+0x2528:   	prefetcha	%g2 + 0x4e, 21
	.word	0xd9be5851	! t1_kref+0x252c:   	stda	%f12, [%i1 + %l1]0xc2
	.word	0xa89d35c1	! t1_kref+0x2530:   	xorcc	%l4, -0xa3f, %l4
	.word	0x905c4013	! t1_kref+0x2534:   	smul	%l1, %l3, %o0
	.word	0x81dac012	! t1_kref+0x2538:   	flush	%o3 + %l2
	.word	0xacc40010	! t1_kref+0x253c:   	addccc	%l0, %l0, %l6
	.word	0xa29c759c	! t1_kref+0x2540:   	xorcc	%l1, -0xa64, %l1
	.word	0xb9a018cc	! t1_kref+0x2544:   	fdtos	%f12, %f28
	.word	0xc0962004	! t1_kref+0x2548:   	lduha	[%i0 + 4]%asi, %g0
	.word	0x9b2cc014	! t1_kref+0x254c:   	sll	%l3, %l4, %o5
	.word	0x96c47c5d	! t1_kref+0x2550:   	addccc	%l1, -0x3a3, %o3
	.word	0x2b480004	! t1_kref+0x2554:   	fbug,a,pt	%fcc0, _kref+0x2564
	.word	0x81da4018	! t1_kref+0x2558:   	flush	%o1 + %i0
	.word	0xdb063fe0	! t1_kref+0x255c:   	ld	[%i0 - 0x20], %f13
	.word	0xa5a00552	! t1_kref+0x2560:   	fsqrtd	%f18, %f18
	.word	0x9a0d2a5a	! t1_kref+0x2564:   	and	%l4, 0xa5a, %o5
	.word	0x99a0190d	! t1_kref+0x2568:   	fitod	%f13, %f12
	.word	0xa1b40e80	! t1_kref+0x256c:   	fsrc1	%f16, %f16
	.word	0xa7b48131	! t1_kref+0x2570:   	edge32n	%l2, %l1, %l3
	.word	0xe7a0a034	! t1_kref+0x2574:   	sta	%f19, [%g2 + 0x34]%asi
	.word	0x933c2005	! t1_kref+0x2578:   	sra	%l0, 0x5, %o1
	.word	0x9144c000	! t1_kref+0x257c:   	mov	%gsr, %o0
	.word	0xe8a8a02d	! t1_kref+0x2580:   	stba	%l4, [%g2 + 0x2d]%asi
	.word	0xe5063ff0	! t1_kref+0x2584:   	ld	[%i0 - 0x10], %f18
	.word	0xe46e7fee	! t1_kref+0x2588:   	ldstub	[%i1 - 0x12], %l2
	.word	0xa7a0003e	! t1_kref+0x258c:   	fmovs	%f30, %f19
	.word	0xd99e5a1a	! t1_kref+0x2590:   	ldda	[%i1 + %i2]0xd0, %f12
	.word	0xfe002bc8	! t1_kref+0x2594:   	ld	[%g0 + 0xbc8], %i7
	.word	0xa9b30e80	! t1_kref+0x2598:   	fsrc1	%f12, %f20
	.word	0xe1be5a5c	! t1_kref+0x259c:   	stda	%f16, [%i1 + %i4]0xd2
	.word	0xabb440f2	! t1_kref+0x25a0:   	edge16ln	%l1, %l2, %l5
	.word	0xf9000019	! t1_kref+0x25a4:   	ld	[%g0 + %i1], %f28
	.word	0x9da688ca	! t1_kref+0x25a8:   	fsubd	%f26, %f10, %f14
	.word	0xacf52aaf	! t1_kref+0x25ac:   	udivcc	%l4, 0xaaf, %l6
	.word	0x9fc10000	! t1_kref+0x25b0:   	call	%g4
	.word	0xa9b586d6	! t1_kref+0x25b4:   	fmul8sux16	%f22, %f22, %f20
	.word	0x81ac8ada	! t1_kref+0x25b8:   	fcmped	%fcc0, %f18, %f26
	.word	0xada0055e	! t1_kref+0x25bc:   	fsqrtd	%f30, %f22
	.word	0xbda0191d	! t1_kref+0x25c0:   	fitod	%f29, %f30
	.word	0x2f800006	! t1_kref+0x25c4:   	fbu,a	_kref+0x25dc
	.word	0xabb30d60	! t1_kref+0x25c8:   	fnot1s	%f12, %f21
	.word	0x91b3840e	! t1_kref+0x25cc:   	fcmple16	%f14, %f14, %o0
	.word	0x9ea46b7c	! t1_kref+0x25d0:   	subcc	%l1, 0xb7c, %o7
	.word	0x39480002	! t1_kref+0x25d4:   	fbuge,a,pt	%fcc0, _kref+0x25dc
	.word	0xe4b63fe8	! t1_kref+0x25d8:   	stha	%l2, [%i0 - 0x18]%asi
	.word	0xeee8a037	! t1_kref+0x25dc:   	ldstuba	[%g2 + 0x37]%asi, %l7
	.word	0x943cf904	! t1_kref+0x25e0:   	xnor	%l3, -0x6fc, %o2
	.word	0xe82e600c	! t1_kref+0x25e4:   	stb	%l4, [%i1 + 0xc]
	.word	0x9854bf3c	! t1_kref+0x25e8:   	umul	%l2, -0xc4, %o4
	.word	0xa6340010	! t1_kref+0x25ec:   	orn	%l0, %l0, %l3
	.word	0xeb266000	! t1_kref+0x25f0:   	st	%f21, [%i1]
	.word	0xa644f013	! t1_kref+0x25f4:   	addc	%l3, -0xfed, %l3
	.word	0xb3a5c8ba	! t1_kref+0x25f8:   	fsubs	%f23, %f26, %f25
	.word	0xa6e48013	! t1_kref+0x25fc:   	subccc	%l2, %l3, %l3
	.word	0xa3b30a3a	! t1_kref+0x2600:   	fpadd16s	%f12, %f26, %f17
	.word	0x8143c000	! t1_kref+0x2604:   	stbar
	.word	0x97400000	! t1_kref+0x2608:   	mov	%y, %o3
	.word	0x81ae0ad4	! t1_kref+0x260c:   	fcmped	%fcc0, %f24, %f20
	.word	0xf9be5850	! t1_kref+0x2610:   	stda	%f28, [%i1 + %l0]0xc2
	.word	0xae3cef00	! t1_kref+0x2614:   	xnor	%l3, 0xf00, %l7
	.word	0x90f44014	! t1_kref+0x2618:   	udivcc	%l1, %l4, %o0
	.word	0x81dfb802	! t1_kref+0x261c:   	flush	%fp - 0x7fe
	.word	0x968c0010	! t1_kref+0x2620:   	andcc	%l0, %l0, %o3
	.word	0x81af8a5c	! t1_kref+0x2624:   	fcmpd	%fcc0, %f30, %f28
	.word	0x9434ee93	! t1_kref+0x2628:   	orn	%l3, 0xe93, %o2
	.word	0xd9270018	! t1_kref+0x262c:   	st	%f12, [%i4 + %i0]
	.word	0x9b3c4012	! t1_kref+0x2630:   	sra	%l1, %l2, %o5
	.word	0x80d42db2	! t1_kref+0x2634:   	umulcc	%l0, 0xdb2, %g0
	.word	0xa5a0190e	! t1_kref+0x2638:   	fitod	%f14, %f18
	.word	0xec1e7ff8	! t1_kref+0x263c:   	ldd	[%i1 - 8], %l6
	.word	0xd6560000	! t1_kref+0x2640:   	ldsh	[%i0], %o3
	.word	0xa9b38e0c	! t1_kref+0x2644:   	fand	%f14, %f12, %f20
	.word	0xb3a6c9b2	! t1_kref+0x2648:   	fdivs	%f27, %f18, %f25
	.word	0xe4f8a014	! t1_kref+0x264c:   	swapa	[%g2 + 0x14]%asi, %l2
	.word	0xf53e3fe0	! t1_kref+0x2650:   	std	%f26, [%i0 - 0x20]
	.word	0x9e050013	! t1_kref+0x2654:   	add	%l4, %l3, %o7
	.word	0xa5a01910	! t1_kref+0x2658:   	fitod	%f16, %f18
	.word	0xc807bfec	! t1_kref+0x265c:   	ld	[%fp - 0x14], %g4
	.word	0xf207bfe0	! t1_kref+0x2660:   	ld	[%fp - 0x20], %i1
	.word	0xb7b4cd3d	! t1_kref+0x2664:   	fandnot1s	%f19, %f29, %f27
	.word	0x9fb4851a	! t1_kref+0x2668:   	fcmpgt16	%f18, %f26, %o7
	.word	0xe8270018	! t1_kref+0x266c:   	st	%l4, [%i4 + %i0]
	.word	0x9da000dc	! t1_kref+0x2670:   	fnegd	%f28, %f14
	.word	0x968d0013	! t1_kref+0x2674:   	andcc	%l4, %l3, %o3
	.word	0xada01112	! t1_kref+0x2678:   	fxtod	%f18, %f22
	.word	0xe6200019	! t1_kref+0x267c:   	st	%l3, [%g0 + %i1]
	.word	0xaef4751f	! t1_kref+0x2680:   	udivcc	%l1, -0xae1, %l7
	.word	0xa294c014	! t1_kref+0x2684:   	orcc	%l3, %l4, %l1
	.word	0x99344012	! t1_kref+0x2688:   	srl	%l1, %l2, %o4
	.word	0x8584e5d6	! t1_kref+0x268c:   	wr	%l3, 0x5d6, %ccr
	.word	0x81850000	! t1_kref+0x2690:   	wr	%l4, %g0, %y
	.word	0xa9418000	! t1_kref+0x2694:   	mov	%fprs, %l4
	.word	0xadb28e50	! t1_kref+0x2698:   	fxnor	%f10, %f16, %f22
	.word	0xac1d3beb	! t1_kref+0x269c:   	xor	%l4, -0x415, %l6
	.word	0xaf1c8013	! t1_kref+0x26a0:   	tsubcctv	%l2, %l3, %l7
	.word	0x85840012	! t1_kref+0x26a4:   	wr	%l0, %l2, %ccr
	.word	0xa5a489ce	! t1_kref+0x26a8:   	fdivd	%f18, %f14, %f18
	.word	0xa3a6893a	! t1_kref+0x26ac:   	fmuls	%f26, %f26, %f17
	.word	0xed06600c	! t1_kref+0x26b0:   	ld	[%i1 + 0xc], %f22
	.word	0x81ad0a58	! t1_kref+0x26b4:   	fcmpd	%fcc0, %f20, %f24
	.word	0xf1200018	! t1_kref+0x26b8:   	st	%f24, [%g0 + %i0]
	.word	0xa5a788b6	! t1_kref+0x26bc:   	fsubs	%f30, %f22, %f18
	.word	0xd9be1a5b	! t1_kref+0x26c0:   	stda	%f12, [%i0 + %i3]0xd2
	.word	0xa914a412	! t1_kref+0x26c4:   	taddcctv	%l2, 0x412, %l4
	.word	0x0104eed1	! t1_kref+0x26c8:   	sethi	%hi(0x13bb4400), %g0
	.word	0xf1be5850	! t1_kref+0x26cc:   	stda	%f24, [%i1 + %l0]0xc2
	.word	0xa5a00039	! t1_kref+0x26d0:   	fmovs	%f25, %f18
	.word	0x81ab8ad6	! t1_kref+0x26d4:   	fcmped	%fcc0, %f14, %f22
	.word	0xfd981019	! t1_kref+0x26d8:   	ldda	[%g0 + %i1]0x80, %f30
	.word	0x94448011	! t1_kref+0x26dc:   	addc	%l2, %l1, %o2
	.word	0xa5b54a33	! t1_kref+0x26e0:   	fpadd16s	%f21, %f19, %f18
	.word	0xd91fbfc0	! t1_kref+0x26e4:   	ldd	[%fp - 0x40], %f12
	.word	0xb5b48a58	! t1_kref+0x26e8:   	fpadd32	%f18, %f24, %f26
	.word	0xaa4522ae	! t1_kref+0x26ec:   	addc	%l4, 0x2ae, %l5
	.word	0xb9a00138	! t1_kref+0x26f0:   	fabss	%f24, %f28
	.word	0xc056601c	! t1_kref+0x26f4:   	ldsh	[%i1 + 0x1c], %g0
	.word	0xec1e6010	! t1_kref+0x26f8:   	ldd	[%i1 + 0x10], %l6
	.word	0x80544012	! t1_kref+0x26fc:   	umul	%l1, %l2, %g0
	.word	0xada68854	! t1_kref+0x2700:   	faddd	%f26, %f20, %f22
	.word	0xfb066004	! t1_kref+0x2704:   	ld	[%i1 + 4], %f29
	.word	0xaa750012	! t1_kref+0x2708:   	udiv	%l4, %l2, %l5
	.word	0x96bc2e39	! t1_kref+0x270c:   	xnorcc	%l0, 0xe39, %o3
	.word	0x91b58518	! t1_kref+0x2710:   	fcmpgt16	%f22, %f24, %o0
	.word	0x81d84004	! t1_kref+0x2714:   	flush	%g1 + %g4
	.word	0x81de3479	! t1_kref+0x2718:   	flush	%i0 - 0xb87
	.word	0x9da4885a	! t1_kref+0x271c:   	faddd	%f18, %f26, %f14
	.word	0xc807bfe4	! t1_kref+0x2720:   	ld	[%fp - 0x1c], %g4
	.word	0xec1e001d	! t1_kref+0x2724:   	ldd	[%i0 + %i5], %l6
	.word	0xacc52bfd	! t1_kref+0x2728:   	addccc	%l4, 0xbfd, %l6
	.word	0xb1b30db9	! t1_kref+0x272c:   	fxors	%f12, %f25, %f24
	.word	0x27480004	! t1_kref+0x2730:   	fbul,a,pt	%fcc0, _kref+0x2740
	.word	0xa2550010	! t1_kref+0x2734:   	umul	%l4, %l0, %l1
	.word	0x81af8a5c	! t1_kref+0x2738:   	fcmpd	%fcc0, %f30, %f28
	.word	0x99b40350	! t1_kref+0x273c:   	alignaddrl	%l0, %l0, %o4
	.word	0x97a00132	! t1_kref+0x2740:   	fabss	%f18, %f11
	.word	0xafb64e32	! t1_kref+0x2744:   	fands	%f25, %f18, %f23
	.word	0xea6e6008	! t1_kref+0x2748:   	ldstub	[%i1 + 8], %l5
	.word	0xa254f17f	! t1_kref+0x274c:   	umul	%l3, -0xe81, %l1
	.word	0xada2cd39	! t1_kref+0x2750:   	fsmuld	%f11, %f25, %f22
	.word	0x90bcb56b	! t1_kref+0x2754:   	xnorcc	%l2, -0xa95, %o0
	.word	0x9b346013	! t1_kref+0x2758:   	srl	%l1, 0x13, %o5
	.word	0xe86e201f	! t1_kref+0x275c:   	ldstub	[%i0 + 0x1f], %l4
	.word	0x81ac0acc	! t1_kref+0x2760:   	fcmped	%fcc0, %f16, %f12
	.word	0xa894c013	! t1_kref+0x2764:   	orcc	%l3, %l3, %l4
	.word	0x9da00150	! t1_kref+0x2768:   	fabsd	%f16, %f14
	.word	0xe91f4019	! t1_kref+0x276c:   	ldd	[%i5 + %i1], %f20
	.word	0x80552c39	! t1_kref+0x2770:   	umul	%l4, 0xc39, %g0
	.word	0xa6ac6d12	! t1_kref+0x2774:   	andncc	%l1, 0xd12, %l3
	.word	0xa5b44636	! t1_kref+0x2778:   	fmul8x16	%f17, %f22, %f18
	.word	0x96fc8014	! t1_kref+0x277c:   	sdivcc	%l2, %l4, %o3
	.word	0xee20303c	! t1_kref+0x2780:   	st	%l7, [%g0 - 0xfc4]
	.word	0xaec4ed64	! t1_kref+0x2784:   	addccc	%l3, 0xd64, %l7
	.word	0x81af0a32	! t1_kref+0x2788:   	fcmps	%fcc0, %f28, %f18
	.word	0xb1a589ce	! t1_kref+0x278c:   	fdivd	%f22, %f14, %f24
	.word	0xe2262010	! t1_kref+0x2790:   	st	%l1, [%i0 + 0x10]
	.word	0xd41e2008	! t1_kref+0x2794:   	ldd	[%i0 + 8], %o2
	.word	0xe4b0a036	! t1_kref+0x2798:   	stha	%l2, [%g2 + 0x36]%asi
	.word	0xafb2ca78	! t1_kref+0x279c:   	fpadd32s	%f11, %f24, %f23
	.word	0xe22e7fe9	! t1_kref+0x27a0:   	stb	%l1, [%i1 - 0x17]
	.word	0xf91fbc70	! t1_kref+0x27a4:   	ldd	[%fp - 0x390], %f28
	.word	0xe0f67fe8	! t1_kref+0x27a8:   	stxa	%l0, [%i1 - 0x18]%asi
	.word	0x8d84c014	! t1_kref+0x27ac:   	wr	%l3, %l4, %fprs
	.word	0xa2250014	! t1_kref+0x27b0:   	sub	%l4, %l4, %l1
	.word	0x93b44013	! t1_kref+0x27b4:   	edge8	%l1, %l3, %o1
	.word	0x93348013	! t1_kref+0x27b8:   	srl	%l2, %l3, %o1
	.word	0xb1a5094c	! t1_kref+0x27bc:   	fmuld	%f20, %f12, %f24
	.word	0x9fc10000	! t1_kref+0x27c0:   	call	%g4
	.word	0xdd1e3ff0	! t1_kref+0x27c4:   	ldd	[%i0 - 0x10], %f14
	.word	0xa85d2344	! t1_kref+0x27c8:   	smul	%l4, 0x344, %l4
	.word	0xd01e2008	! t1_kref+0x27cc:   	ldd	[%i0 + 8], %o0
	.word	0x9b3cc013	! t1_kref+0x27d0:   	sra	%l3, %l3, %o5
	.word	0xa9a0105a	! t1_kref+0x27d4:   	fdtox	%f26, %f20
	.word	0x25480004	! t1_kref+0x27d8:   	fblg,a,pt	%fcc0, _kref+0x27e8
	.word	0x8d844011	! t1_kref+0x27dc:   	wr	%l1, %l1, %fprs
	.word	0x81850000	! t1_kref+0x27e0:   	wr	%l4, %g0, %y
	.word	0xec0e4000	! t1_kref+0x27e4:   	ldub	[%i1], %l6
	.word	0x9da00533	! t1_kref+0x27e8:   	fsqrts	%f19, %f14
	.word	0x9634aa52	! t1_kref+0x27ec:   	orn	%l2, 0xa52, %o3
	.word	0xacbc8012	! t1_kref+0x27f0:   	xnorcc	%l2, %l2, %l6
	.word	0xe450a026	! t1_kref+0x27f4:   	ldsh	[%g2 + 0x26], %l2
	.word	0x9fc10000	! t1_kref+0x27f8:   	call	%g4
	.word	0xe830a01c	! t1_kref+0x27fc:   	sth	%l4, [%g2 + 0x1c]
	.word	0x81ab4aad	! t1_kref+0x2800:   	fcmpes	%fcc0, %f13, %f13
	.word	0xd41e3fe8	! t1_kref+0x2804:   	ldd	[%i0 - 0x18], %o2
	.word	0x37480006	! t1_kref+0x2808:   	fbge,a,pt	%fcc0, _kref+0x2820
	.word	0x9f3c6011	! t1_kref+0x280c:   	sra	%l1, 0x11, %o7
	.word	0xe428a01c	! t1_kref+0x2810:   	stb	%l2, [%g2 + 0x1c]
	.word	0xa93c8014	! t1_kref+0x2814:   	sra	%l2, %l4, %l4
	.word	0x909c4013	! t1_kref+0x2818:   	xorcc	%l1, %l3, %o0
	.word	0x81af0ab2	! t1_kref+0x281c:   	fcmpes	%fcc0, %f28, %f18
	.word	0xd40e7ff5	! t1_kref+0x2820:   	ldub	[%i1 - 0xb], %o2
	.word	0x99a58858	! t1_kref+0x2824:   	faddd	%f22, %f24, %f12
	.word	0xe2ee501a	! t1_kref+0x2828:   	ldstuba	[%i1 + %i2]0x80, %l1
	.word	0x2d800006	! t1_kref+0x282c:   	fbg,a	_kref+0x2844
	.word	0x81b01022	! t1_kref+0x2830:   	siam	0x2
	.word	0xadb40e80	! t1_kref+0x2834:   	fsrc1	%f16, %f22
	.word	0xada00154	! t1_kref+0x2838:   	fabsd	%f20, %f22
	.word	0x9b1cc014	! t1_kref+0x283c:   	tsubcctv	%l3, %l4, %o5
	.word	0xd9180018	! t1_kref+0x2840:   	ldd	[%g0 + %i0], %f12
	.word	0xa1ab004c	! t1_kref+0x2844:   	fmovduge	%fcc0, %f12, %f16
	.word	0xc06e2017	! t1_kref+0x2848:   	ldstub	[%i0 + 0x17], %g0
	.word	0x001fffff	! t1_kref+0x284c:   	illtrap	0x1fffff
	.word	0xa6550012	! t1_kref+0x2850:   	umul	%l4, %l2, %l3
	.word	0xb1b686d0	! t1_kref+0x2854:   	fmul8sux16	%f26, %f16, %f24
	.word	0xea500018	! t1_kref+0x2858:   	ldsh	[%g0 + %i0], %l5
	.word	0xa6bc23b0	! t1_kref+0x285c:   	xnorcc	%l0, 0x3b0, %l3
	.word	0x81ab8adc	! t1_kref+0x2860:   	fcmped	%fcc0, %f14, %f28
	.word	0x81de4016	! t1_kref+0x2864:   	flush	%i1 + %l6
	.word	0xb1a588d8	! t1_kref+0x2868:   	fsubd	%f22, %f24, %f24
	.word	0xa5a58852	! t1_kref+0x286c:   	faddd	%f22, %f18, %f18
	.word	0x9e147b94	! t1_kref+0x2870:   	or	%l1, -0x46c, %o7
	.word	0x81ac0a33	! t1_kref+0x2874:   	fcmps	%fcc0, %f16, %f19
	.word	0x9814b9d4	! t1_kref+0x2878:   	or	%l2, -0x62c, %o4
	.word	0xb5a588b3	! t1_kref+0x287c:   	fsubs	%f22, %f19, %f26
	.word	0x98248013	! t1_kref+0x2880:   	sub	%l2, %l3, %o4
	.word	0xa73ca018	! t1_kref+0x2884:   	sra	%l2, 0x18, %l3
	.word	0xaaacc014	! t1_kref+0x2888:   	andncc	%l3, %l4, %l5
	.word	0xe2fe6014	! t1_kref+0x288c:   	swapa	[%i1 + 0x14]%asi, %l1
	.word	0x83414000	! t1_kref+0x2890:   	mov	%pc, %g1
	.word	0xa3342018	! t1_kref+0x2894:   	srl	%l0, 0x18, %l1
	.word	0x81ad8a31	! t1_kref+0x2898:   	fcmps	%fcc0, %f22, %f17
	.word	0x9074f33d	! t1_kref+0x289c:   	udiv	%l3, -0xcc3, %o0
	.word	0xe66e201b	! t1_kref+0x28a0:   	ldstub	[%i0 + 0x1b], %l3
	.word	0xa3a7493d	! t1_kref+0x28a4:   	fmuls	%f29, %f29, %f17
	.word	0xb1a0055e	! t1_kref+0x28a8:   	fsqrtd	%f30, %f24
	.word	0x989c26ff	! t1_kref+0x28ac:   	xorcc	%l0, 0x6ff, %o4
	.word	0xac8d2e8f	! t1_kref+0x28b0:   	andcc	%l4, 0xe8f, %l6
	.word	0xe91fbfc0	! t1_kref+0x28b4:   	ldd	[%fp - 0x40], %f20
	.word	0xa1b5845e	! t1_kref+0x28b8:   	fcmpne16	%f22, %f30, %l0
	.word	0xa1a018d8	! t1_kref+0x28bc:   	fdtos	%f24, %f16
	.word	0xfd1fbf50	! t1_kref+0x28c0:   	ldd	[%fp - 0xb0], %f30
	.word	0x95b2844e	! t1_kref+0x28c4:   	fcmpne16	%f10, %f14, %o2
	.word	0x8d84b413	! t1_kref+0x28c8:   	wr	%l2, 0xfffff413, %fprs
	.word	0xe4ae101a	! t1_kref+0x28cc:   	stba	%l2, [%i0 + %i2]0x80
	.word	0x9464a527	! t1_kref+0x28d0:   	subc	%l2, 0x527, %o2
	.word	0x9db2ca76	! t1_kref+0x28d4:   	fpadd32s	%f11, %f22, %f14
	.word	0xb3a00139	! t1_kref+0x28d8:   	fabss	%f25, %f25
	.word	0x81850000	! t1_kref+0x28dc:   	wr	%l4, %g0, %y
	.word	0x99b28a12	! t1_kref+0x28e0:   	fpadd16	%f10, %f18, %f12
	.word	0xada5092c	! t1_kref+0x28e4:   	fmuls	%f20, %f12, %f22
	.word	0xe0262000	! t1_kref+0x28e8:   	st	%l0, [%i0]
	.word	0xe1270018	! t1_kref+0x28ec:   	st	%f16, [%i4 + %i0]
	.word	0x27480004	! t1_kref+0x28f0:   	fbul,a,pt	%fcc0, _kref+0x2900
	.word	0xec1e0000	! t1_kref+0x28f4:   	ldd	[%i0], %l6
	.word	0xe19e5a1a	! t1_kref+0x28f8:   	ldda	[%i1 + %i2]0xd0, %f16
	.word	0xdd180019	! t1_kref+0x28fc:   	ldd	[%g0 + %i1], %f14
	.word	0xb7a58936	! t1_kref+0x2900:   	fmuls	%f22, %f22, %f27
	.word	0x985c0012	! t1_kref+0x2904:   	smul	%l0, %l2, %o4
	.word	0x96844014	! t1_kref+0x2908:   	addcc	%l1, %l4, %o3
	.word	0x9bb00c20	! t1_kref+0x290c:   	fzeros	%f13
	.word	0xd296501b	! t1_kref+0x2910:   	lduha	[%i1 + %i3]0x80, %o1
	.word	0xafb4c133	! t1_kref+0x2914:   	edge32n	%l3, %l3, %l7
	.word	0x81acca32	! t1_kref+0x2918:   	fcmps	%fcc0, %f19, %f18
	.word	0xacb4ba73	! t1_kref+0x291c:   	orncc	%l2, -0x58d, %l6
         nop   !	call	0xfffffa40
	.word	0x985cc011	! t1_kref+0x2924:   	smul	%l3, %l1, %o4
	.word	0xe8f67ff0	! t1_kref+0x2928:   	stxa	%l4, [%i1 - 0x10]%asi
	.word	0xeda0a03c	! t1_kref+0x292c:   	sta	%f22, [%g2 + 0x3c]%asi
	.word	0x9ba48932	! t1_kref+0x2930:   	fmuls	%f18, %f18, %f13
	.word	0xf586601c	! t1_kref+0x2934:   	lda	[%i1 + 0x1c]%asi, %f26
	.word	0x8044a6c5	! t1_kref+0x2938:   	addc	%l2, 0x6c5, %g0
	.word	0x9fc10000	! t1_kref+0x293c:   	call	%g4
	.word	0xe86e2001	! t1_kref+0x2940:   	ldstub	[%i0 + 1], %l4
	.word	0xa2f48011	! t1_kref+0x2944:   	udivcc	%l2, %l1, %l1
	.word	0xa1a0013a	! t1_kref+0x2948:   	fabss	%f26, %f16
	.word	0xe9a0a024	! t1_kref+0x294c:   	sta	%f20, [%g2 + 0x24]%asi
	.word	0xd0166006	! t1_kref+0x2950:   	lduh	[%i1 + 6], %o0
	.word	0xada608d0	! t1_kref+0x2954:   	fsubd	%f24, %f16, %f22
	.word	0x9f414000	! t1_kref+0x2958:   	mov	%pc, %o7
	.word	0xd01e6008	! t1_kref+0x295c:   	ldd	[%i1 + 8], %o0
	.word	0x96fd3bb9	! t1_kref+0x2960:   	sdivcc	%l4, -0x447, %o3
	.word	0xe1a0a01c	! t1_kref+0x2964:   	sta	%f16, [%g2 + 0x1c]%asi
	.word	0xac84b811	! t1_kref+0x2968:   	addcc	%l2, -0x7ef, %l6
	.word	0x91b4c314	! t1_kref+0x296c:   	alignaddr	%l3, %l4, %o0
	.word	0xa7a549b3	! t1_kref+0x2970:   	fdivs	%f21, %f19, %f19
	.word	0x81ac8ade	! t1_kref+0x2974:   	fcmped	%fcc0, %f18, %f30
	.word	0xa5b44172	! t1_kref+0x2978:   	edge32ln	%l1, %l2, %l2
	.word	0xa03d37be	! t1_kref+0x297c:   	xnor	%l4, -0x842, %l0
	.word	0xa09d316d	! t1_kref+0x2980:   	xorcc	%l4, -0xe93, %l0
	.word	0xbbb4cea0	! t1_kref+0x2984:   	fsrc1s	%f19, %f29
	.word	0xe42e6013	! t1_kref+0x2988:   	stb	%l2, [%i1 + 0x13]
	.word	0x28800003	! t1_kref+0x298c:   	bleu,a	_kref+0x2998
	.word	0x9534a00d	! t1_kref+0x2990:   	srl	%l2, 0xd, %o2
	.word	0x81aa8ad6	! t1_kref+0x2994:   	fcmped	%fcc0, %f10, %f22
	.word	0xb1a0190c	! t1_kref+0x2998:   	fitod	%f12, %f24
	.word	0xd278a034	! t1_kref+0x299c:   	swap	[%g2 + 0x34], %o1
	.word	0xa0bcfa76	! t1_kref+0x29a0:   	xnorcc	%l3, -0x58a, %l0
	.word	0xa9a0013c	! t1_kref+0x29a4:   	fabss	%f28, %f20
	.word	0xb1a00552	! t1_kref+0x29a8:   	fsqrtd	%f18, %f24
	.word	0xada00556	! t1_kref+0x29ac:   	fsqrtd	%f22, %f22
	.word	0xe5262014	! t1_kref+0x29b0:   	st	%f18, [%i0 + 0x14]
	.word	0x9ad48010	! t1_kref+0x29b4:   	umulcc	%l2, %l0, %o5
	.word	0xecc8a027	! t1_kref+0x29b8:   	ldsba	[%g2 + 0x27]%asi, %l6
	.word	0xa23c7828	! t1_kref+0x29bc:   	xnor	%l1, -0x7d8, %l1
	.word	0x81dbed84	! t1_kref+0x29c0:   	flush	%o7 + 0xd84
	.word	0xe91f4018	! t1_kref+0x29c4:   	ldd	[%i5 + %i0], %f20
	.word	0xa3a449be	! t1_kref+0x29c8:   	fdivs	%f17, %f30, %f17
	.word	0xe8a0a024	! t1_kref+0x29cc:   	sta	%l4, [%g2 + 0x24]%asi
	.word	0xe87e7fec	! t1_kref+0x29d0:   	swap	[%i1 - 0x14], %l4
	.word	0xe22e401a	! t1_kref+0x29d4:   	stb	%l1, [%i1 + %i2]
	.word	0x3d480008	! t1_kref+0x29d8:   	fbule,a,pt	%fcc0, _kref+0x29f8
	.word	0x97b4c054	! t1_kref+0x29dc:   	edge8l	%l3, %l4, %o3
	.word	0x80e42266	! t1_kref+0x29e0:   	subccc	%l0, 0x266, %g0
	.word	0x81ab8a58	! t1_kref+0x29e4:   	fcmpd	%fcc0, %f14, %f24
	.word	0xa9a01936	! t1_kref+0x29e8:   	fstod	%f22, %f20
	.word	0xb5a0013a	! t1_kref+0x29ec:   	fabss	%f26, %f26
	.word	0xb9a0053e	! t1_kref+0x29f0:   	fsqrts	%f30, %f28
	.word	0xe02e001a	! t1_kref+0x29f4:   	stb	%l0, [%i0 + %i2]
	.word	0x90448012	! t1_kref+0x29f8:   	addc	%l2, %l2, %o0
	.word	0x928cf4e2	! t1_kref+0x29fc:   	andcc	%l3, -0xb1e, %o1
	.word	0xd9be5853	! t1_kref+0x2a00:   	stda	%f12, [%i1 + %l3]0xc2
	.word	0xe220a004	! t1_kref+0x2a04:   	st	%l1, [%g2 + 4]
	.word	0xdade3fe8	! t1_kref+0x2a08:   	ldxa	[%i0 - 0x18]%asi, %o5
	.word	0x97700012	! t1_kref+0x2a0c:   	popc	%l2, %o3
	.word	0xe906200c	! t1_kref+0x2a10:   	ld	[%i0 + 0xc], %f20
	.word	0xd01e401d	! t1_kref+0x2a14:   	ldd	[%i1 + %i5], %o0
	.word	0xa5144012	! t1_kref+0x2a18:   	taddcctv	%l1, %l2, %l2
	.word	0xf91fbe50	! t1_kref+0x2a1c:   	ldd	[%fp - 0x1b0], %f28
	.word	0x8143c000	! t1_kref+0x2a20:   	stbar
	.word	0x9044e4d6	! t1_kref+0x2a24:   	addc	%l3, 0x4d6, %o0
	.word	0xeaee600f	! t1_kref+0x2a28:   	ldstuba	[%i1 + 0xf]%asi, %l5
	.word	0x99a389ce	! t1_kref+0x2a2c:   	fdivd	%f14, %f14, %f12
	.word	0xa1a01056	! t1_kref+0x2a30:   	fdtox	%f22, %f16
	.word	0x95b7850a	! t1_kref+0x2a34:   	fcmpgt16	%f30, %f10, %o2
	.word	0x808c350b	! t1_kref+0x2a38:   	btst	0xfffff50b, %l0
	.word	0xdf270018	! t1_kref+0x2a3c:   	st	%f15, [%i4 + %i0]
	.word	0xe93e2010	! t1_kref+0x2a40:   	std	%f20, [%i0 + 0x10]
	.word	0x9db48a10	! t1_kref+0x2a44:   	fpadd16	%f18, %f16, %f14
	.word	0x9b3c4010	! t1_kref+0x2a48:   	sra	%l1, %l0, %o5
	.word	0xa9a549ad	! t1_kref+0x2a4c:   	fdivs	%f21, %f13, %f20
	.word	0xa23c4014	! t1_kref+0x2a50:   	xnor	%l1, %l4, %l1
	.word	0xa0543747	! t1_kref+0x2a54:   	umul	%l0, -0x8b9, %l0
	.word	0xe4a0a02c	! t1_kref+0x2a58:   	sta	%l2, [%g2 + 0x2c]%asi
	.word	0x9da308d2	! t1_kref+0x2a5c:   	fsubd	%f12, %f18, %f14
	.word	0xb9a0054c	! t1_kref+0x2a60:   	fsqrtd	%f12, %f28
	.word	0xa5a01032	! t1_kref+0x2a64:   	fstox	%f18, %f18
	.word	0xbdb60d8a	! t1_kref+0x2a68:   	fxor	%f24, %f10, %f30
	.word	0x9b140011	! t1_kref+0x2a6c:   	taddcctv	%l0, %l1, %o5
	.word	0xadb4c313	! t1_kref+0x2a70:   	alignaddr	%l3, %l3, %l6
	sethi	%hi(2f), %o7
	.word	0xe40be2b0	! t1_kref+0x2a78:   	ldub	[%o7 + 0x2b0], %l2
	.word	0xa41ca00c	! t1_kref+0x2a7c:   	xor	%l2, 0xc, %l2
	.word	0xe42be2b0	! t1_kref+0x2a80:   	stb	%l2, [%o7 + 0x2b0]
	.word	0x81dbe2b0	! t1_kref+0x2a84:   	flush	%o7 + 0x2b0
	.word	0xf207bfe0	! t1_kref+0x2a88:   	ld	[%fp - 0x20], %i1
	.word	0xd4ce600b	! t1_kref+0x2a8c:   	ldsba	[%i1 + 0xb]%asi, %o2
	.word	0xbdb00f32	! t1_kref+0x2a90:   	fsrc2s	%f18, %f30
	.word	0xb5b3cdb7	! t1_kref+0x2a94:   	fxors	%f15, %f23, %f26
	.word	0xf7064000	! t1_kref+0x2a98:   	ld	[%i1], %f27
	.word	0x9f414000	! t1_kref+0x2a9c:   	mov	%pc, %o7
	.word	0xa434e17d	! t1_kref+0x2aa0:   	orn	%l3, 0x17d, %l2
	.word	0x9fc00004	! t1_kref+0x2aa4:   	call	%g0 + %g4
	.word	0xe4f65000	! t1_kref+0x2aa8:   	stxa	%l2, [%i1]0x80
	.word	0x981cb009	! t1_kref+0x2aac:   	xor	%l2, -0xff7, %o4
2:	.word	0x9da48d2f	! t1_kref+0x2ab0:   	fsmuld	%f18, %f15, %f14
	.word	0x9da749bc	! t1_kref+0x2ab4:   	fdivs	%f29, %f28, %f14
	.word	0xa3b40240	! t1_kref+0x2ab8:   	array16	%l0, %g0, %l1
	.word	0x23480003	! t1_kref+0x2abc:   	fbne,a,pt	%fcc0, _kref+0x2ac8
	.word	0xe4a0a024	! t1_kref+0x2ac0:   	sta	%l2, [%g2 + 0x24]%asi
	.word	0xf1be5891	! t1_kref+0x2ac4:   	stda	%f24, [%i1 + %l1]0xc4
	.word	0xa7b44354	! t1_kref+0x2ac8:   	alignaddrl	%l1, %l4, %l3
	.word	0x2b480004	! t1_kref+0x2acc:   	fbug,a,pt	%fcc0, _kref+0x2adc
	.word	0x813ce00c	! t1_kref+0x2ad0:   	sra	%l3, 0xc, %g0
	.word	0xe59f5019	! t1_kref+0x2ad4:   	ldda	[%i5 + %i1]0x80, %f18
	.word	0xa034e59b	! t1_kref+0x2ad8:   	orn	%l3, 0x59b, %l0
	.word	0xa27c706c	! t1_kref+0x2adc:   	sdiv	%l1, -0xf94, %l1
	.word	0xa3a409ac	! t1_kref+0x2ae0:   	fdivs	%f16, %f12, %f17
	.word	0x81ac8a56	! t1_kref+0x2ae4:   	fcmpd	%fcc0, %f18, %f22
	.word	0xa7b4050c	! t1_kref+0x2ae8:   	fcmpgt16	%f16, %f12, %l3
	.word	0x948d2c62	! t1_kref+0x2aec:   	andcc	%l4, 0xc62, %o2
	.word	0xe220a01c	! t1_kref+0x2af0:   	st	%l1, [%g2 + 0x1c]
	.word	0x2f800008	! t1_kref+0x2af4:   	fbu,a	_kref+0x2b14
	.word	0xafa0012f	! t1_kref+0x2af8:   	fabss	%f15, %f23
	.word	0xe0b67fe0	! t1_kref+0x2afc:   	stha	%l0, [%i1 - 0x20]%asi
	.word	0xd4180019	! t1_kref+0x2b00:   	ldd	[%g0 + %i1], %o2
	.word	0xa02cb75e	! t1_kref+0x2b04:   	andn	%l2, -0x8a2, %l0
	.word	0xb9a589d0	! t1_kref+0x2b08:   	fdivd	%f22, %f16, %f28
	.word	0xadb50e1a	! t1_kref+0x2b0c:   	fand	%f20, %f26, %f22
	.word	0x99a01a4c	! t1_kref+0x2b10:   	fdtoi	%f12, %f12
	.word	0xa224c013	! t1_kref+0x2b14:   	sub	%l3, %l3, %l1
	.word	0xa91cc011	! t1_kref+0x2b18:   	tsubcctv	%l3, %l1, %l4
	.word	0xe42e3ffb	! t1_kref+0x2b1c:   	stb	%l2, [%i0 - 5]
	.word	0x99b50f8c	! t1_kref+0x2b20:   	for	%f20, %f12, %f12
	.word	0xb9a0052f	! t1_kref+0x2b24:   	fsqrts	%f15, %f28
	.word	0xdd3e6008	! t1_kref+0x2b28:   	std	%f14, [%i1 + 8]
	.word	0x9e04c013	! t1_kref+0x2b2c:   	add	%l3, %l3, %o7
	.word	0x973c8013	! t1_kref+0x2b30:   	sra	%l2, %l3, %o3
	.word	0xa1b40518	! t1_kref+0x2b34:   	fcmpgt16	%f16, %f24, %l0
	.word	0x9a3c8012	! t1_kref+0x2b38:   	xnor	%l2, %l2, %o5
	.word	0xab3d2011	! t1_kref+0x2b3c:   	sra	%l4, 0x11, %l5
	.word	0xa3a0053a	! t1_kref+0x2b40:   	fsqrts	%f26, %f17
	.word	0x81b01026	! t1_kref+0x2b44:   	siam	0x6
	.word	0xaed4ed07	! t1_kref+0x2b48:   	umulcc	%l3, 0xd07, %l7
	.word	0x98944012	! t1_kref+0x2b4c:   	orcc	%l1, %l2, %o4
	.word	0xb1a000d8	! t1_kref+0x2b50:   	fnegd	%f24, %f24
	.word	0xe0b0a006	! t1_kref+0x2b54:   	stha	%l0, [%g2 + 6]%asi
	.word	0x001fffff	! t1_kref+0x2b58:   	illtrap	0x1fffff
	.word	0xef26201c	! t1_kref+0x2b5c:   	st	%f23, [%i0 + 0x1c]
	.word	0xc04e8019	! t1_kref+0x2b60:   	ldsb	[%i2 + %i1], %g0
	.word	0x9bb4854c	! t1_kref+0x2b64:   	fcmpeq16	%f18, %f12, %o5
	.word	0x95a0055e	! t1_kref+0x2b68:   	fsqrtd	%f30, %f10
	.word	0xfb063fe8	! t1_kref+0x2b6c:   	ld	[%i0 - 0x18], %f29
	.word	0xa734a01e	! t1_kref+0x2b70:   	srl	%l2, 0x1e, %l3
	.word	0x928d3c41	! t1_kref+0x2b74:   	andcc	%l4, -0x3bf, %o1
	.word	0xb9b60638	! t1_kref+0x2b78:   	fmul8x16	%f24, %f24, %f28
	.word	0x8143e04f	! t1_kref+0x2b7c:   	membar	0x4f
	.word	0xe02e3fe9	! t1_kref+0x2b80:   	stb	%l0, [%i0 - 0x17]
	.word	0xea4e4000	! t1_kref+0x2b84:   	ldsb	[%i1], %l5
	.word	0x2a800007	! t1_kref+0x2b88:   	bcs,a	_kref+0x2ba4
	.word	0xa9a40931	! t1_kref+0x2b8c:   	fmuls	%f16, %f17, %f20
	.word	0x81adca2d	! t1_kref+0x2b90:   	fcmps	%fcc0, %f23, %f13
	.word	0xadb40414	! t1_kref+0x2b94:   	fcmple16	%f16, %f20, %l6
	.word	0x90746513	! t1_kref+0x2b98:   	udiv	%l1, 0x513, %o0
	.word	0xe448a02d	! t1_kref+0x2b9c:   	ldsb	[%g2 + 0x2d], %l2
	.word	0x95700014	! t1_kref+0x2ba0:   	popc	%l4, %o2
	.word	0x81ab8a4a	! t1_kref+0x2ba4:   	fcmpd	%fcc0, %f14, %f10
	.word	0xa6ad0011	! t1_kref+0x2ba8:   	andncc	%l4, %l1, %l3
	.word	0xb5a648b9	! t1_kref+0x2bac:   	fsubs	%f25, %f25, %f26
	.word	0x86102004	! t1_kref+0x2bb0:   	mov	0x4, %g3
	.word	0x32800000	! t1_kref+0x2bb4:   	bne,a	_kref+0x2bb4
	.word	0x86a0e001	! t1_kref+0x2bb8:   	subcc	%g3, 1, %g3
	.word	0x81af0adc	! t1_kref+0x2bbc:   	fcmped	%fcc0, %f28, %f28
	.word	0xd07e6000	! t1_kref+0x2bc0:   	swap	[%i1], %o0
	.word	0x81aa8a52	! t1_kref+0x2bc4:   	fcmpd	%fcc0, %f10, %f18
	.word	0xa9b3862c	! t1_kref+0x2bc8:   	fmul8x16	%f14, %f12, %f20
	.word	0x9ef4c011	! t1_kref+0x2bcc:   	udivcc	%l3, %l1, %o7
	.word	0xabb48131	! t1_kref+0x2bd0:   	edge32n	%l2, %l1, %l5
	.word	0xa004bad5	! t1_kref+0x2bd4:   	add	%l2, -0x52b, %l0
	.word	0xb5b3072d	! t1_kref+0x2bd8:   	fmuld8ulx16	%f12, %f13, %f26
	.word	0xb9b30732	! t1_kref+0x2bdc:   	fmuld8ulx16	%f12, %f18, %f28
	.word	0xe62e0000	! t1_kref+0x2be0:   	stb	%l3, [%i0]
	.word	0x933c4013	! t1_kref+0x2be4:   	sra	%l1, %l3, %o1
	.word	0xa7b50353	! t1_kref+0x2be8:   	alignaddrl	%l4, %l3, %l3
	.word	0x81aacabe	! t1_kref+0x2bec:   	fcmpes	%fcc0, %f11, %f30
	.word	0xa884e166	! t1_kref+0x2bf0:   	addcc	%l3, 0x166, %l4
	.word	0xa1a0108a	! t1_kref+0x2bf4:   	fxtos	%f10, %f16
	.word	0x83414000	! t1_kref+0x2bf8:   	mov	%pc, %g1
	.word	0xfb866008	! t1_kref+0x2bfc:   	lda	[%i1 + 8]%asi, %f29
	.word	0xe42e201e	! t1_kref+0x2c00:   	stb	%l2, [%i0 + 0x1e]
	.word	0x80b42002	! t1_kref+0x2c04:   	orncc	%l0, 2, %g0
	.word	0x81aecab0	! t1_kref+0x2c08:   	fcmpes	%fcc0, %f27, %f16
	.word	0xed3e2008	! t1_kref+0x2c0c:   	std	%f22, [%i0 + 8]
	.word	0x81ae8ab7	! t1_kref+0x2c10:   	fcmpes	%fcc0, %f26, %f23
	.word	0xe53e001d	! t1_kref+0x2c14:   	std	%f18, [%i0 + %i5]
	.word	0xe4a8a015	! t1_kref+0x2c18:   	stba	%l2, [%g2 + 0x15]%asi
	.word	0xbba6c8b1	! t1_kref+0x2c1c:   	fsubs	%f27, %f17, %f29
	.word	0xecee3ffc	! t1_kref+0x2c20:   	ldstuba	[%i0 - 4]%asi, %l6
	.word	0x81ab8a56	! t1_kref+0x2c24:   	fcmpd	%fcc0, %f14, %f22
	.word	0xa6f4e15d	! t1_kref+0x2c28:   	udivcc	%l3, 0x15d, %l3
	.word	0x9934a01e	! t1_kref+0x2c2c:   	srl	%l2, 0x1e, %o4
	.word	0xa7a00131	! t1_kref+0x2c30:   	fabss	%f17, %f19
	.word	0x9694baa5	! t1_kref+0x2c34:   	orcc	%l2, -0x55b, %o3
	.word	0x23480007	! t1_kref+0x2c38:   	fbne,a,pt	%fcc0, _kref+0x2c54
	.word	0xb5b007bc	! t1_kref+0x2c3c:   	fpackfix	%f28, %f26
	.word	0x99a0054a	! t1_kref+0x2c40:   	fsqrtd	%f10, %f12
	.word	0x81accabe	! t1_kref+0x2c44:   	fcmpes	%fcc0, %f19, %f30
	.word	0xa1a48d36	! t1_kref+0x2c48:   	fsmuld	%f18, %f22, %f16
	.word	0xdd1e001d	! t1_kref+0x2c4c:   	ldd	[%i0 + %i5], %f14
	.word	0xada5894e	! t1_kref+0x2c50:   	fmuld	%f22, %f14, %f22
	.word	0xc12e401c	! t1_kref+0x2c54:   	st	%fsr, [%i1 + %i4]
	.word	0x81abcaab	! t1_kref+0x2c58:   	fcmpes	%fcc0, %f15, %f11
	.word	0xe4270018	! t1_kref+0x2c5c:   	st	%l2, [%i4 + %i0]
	.word	0xe64e4000	! t1_kref+0x2c60:   	ldsb	[%i1], %l3
	.word	0xe84e2018	! t1_kref+0x2c64:   	ldsb	[%i0 + 0x18], %l4
	.word	0xa7b70496	! t1_kref+0x2c68:   	fcmple32	%f28, %f22, %l3
	.word	0xaa2c4014	! t1_kref+0x2c6c:   	andn	%l1, %l4, %l5
	.word	0x81ac8ad4	! t1_kref+0x2c70:   	fcmped	%fcc0, %f18, %f20
	.word	0x92bc6648	! t1_kref+0x2c74:   	xnorcc	%l1, 0x648, %o1
	.word	0x81ac0ad2	! t1_kref+0x2c78:   	fcmped	%fcc0, %f16, %f18
	.word	0x9da3c8ac	! t1_kref+0x2c7c:   	fsubs	%f15, %f12, %f14
	.word	0xa3b440b3	! t1_kref+0x2c80:   	edge16n	%l1, %l3, %l1
	.word	0xe5264000	! t1_kref+0x2c84:   	st	%f18, [%i1]
	.word	0xb3a00139	! t1_kref+0x2c88:   	fabss	%f25, %f25
	.word	0x81ad8a58	! t1_kref+0x2c8c:   	fcmpd	%fcc0, %f22, %f24
	.word	0xa03c4013	! t1_kref+0x2c90:   	xnor	%l1, %l3, %l0
	.word	0x8184c000	! t1_kref+0x2c94:   	wr	%l3, %g0, %y
	.word	0xa5a00132	! t1_kref+0x2c98:   	fabss	%f18, %f18
	.word	0xa33c201b	! t1_kref+0x2c9c:   	sra	%l0, 0x1b, %l1
	.word	0xe9be1a1c	! t1_kref+0x2ca0:   	stda	%f20, [%i0 + %i4]0xd0
	.word	0xb9b58d40	! t1_kref+0x2ca4:   	fnot1	%f22, %f28
	.word	0xf007bfe0	! t1_kref+0x2ca8:   	ld	[%fp - 0x20], %i0
	.word	0xd86e401a	! t1_kref+0x2cac:   	ldstub	[%i1 + %i2], %o4
	.word	0x81debab6	! t1_kref+0x2cb0:   	flush	%i2 - 0x54a
	.word	0x81850000	! t1_kref+0x2cb4:   	wr	%l4, %g0, %y
	.word	0xae3cf8cb	! t1_kref+0x2cb8:   	xnor	%l3, -0x735, %l7
	.word	0x9da50938	! t1_kref+0x2cbc:   	fmuls	%f20, %f24, %f14
	.word	0x37480002	! t1_kref+0x2cc0:   	fbge,a,pt	%fcc0, _kref+0x2cc8
	.word	0x9da509de	! t1_kref+0x2cc4:   	fdivd	%f20, %f30, %f14
	.word	0x92a4e90a	! t1_kref+0x2cc8:   	subcc	%l3, 0x90a, %o1
	.word	0xe22e4000	! t1_kref+0x2ccc:   	stb	%l1, [%i1]
	.word	0xdbe65014	! t1_kref+0x2cd0:   	casa	[%i1]0x80, %l4, %o5
	.word	0xa5a5c8b5	! t1_kref+0x2cd4:   	fsubs	%f23, %f21, %f18
	.word	0xf91fbe68	! t1_kref+0x2cd8:   	ldd	[%fp - 0x198], %f28
	.word	0x903422aa	! t1_kref+0x2cdc:   	orn	%l0, 0x2aa, %o0
	.word	0xa1a01050	! t1_kref+0x2ce0:   	fdtox	%f16, %f16
	.word	0xae046574	! t1_kref+0x2ce4:   	add	%l1, 0x574, %l7
	.word	0x81af0ade	! t1_kref+0x2ce8:   	fcmped	%fcc0, %f28, %f30
	.word	0xadb28a98	! t1_kref+0x2cec:   	fpsub16	%f10, %f24, %f22
	.word	0xa9a00556	! t1_kref+0x2cf0:   	fsqrtd	%f22, %f20
	.word	0x81dea495	! t1_kref+0x2cf4:   	flush	%i2 + 0x495
	.word	0xe6200019	! t1_kref+0x2cf8:   	st	%l3, [%g0 + %i1]
	.word	0xada00539	! t1_kref+0x2cfc:   	fsqrts	%f25, %f22
	.word	0x81dcf52b	! t1_kref+0x2d00:   	flush	%l3 - 0xad5
	.word	0xa9a01050	! t1_kref+0x2d04:   	fdtox	%f16, %f20
	.word	0x9db009ab	! t1_kref+0x2d08:   	fexpand	%f11, %f14
	.word	0xe8280019	! t1_kref+0x2d0c:   	stb	%l4, [%g0 + %i1]
	.word	0xbdb50731	! t1_kref+0x2d10:   	fmuld8ulx16	%f20, %f17, %f30
	.word	0x973c601c	! t1_kref+0x2d14:   	sra	%l1, 0x1c, %o3
	.word	0xafa0052f	! t1_kref+0x2d18:   	fsqrts	%f15, %f23
	.word	0xa540c000	! t1_kref+0x2d1c:   	mov	%asi, %l2
	.word	0xb7a00131	! t1_kref+0x2d20:   	fabss	%f17, %f27
	.word	0xb5a00530	! t1_kref+0x2d24:   	fsqrts	%f16, %f26
	.word	0xaba748ae	! t1_kref+0x2d28:   	fsubs	%f29, %f14, %f21
	.word	0x81d96b05	! t1_kref+0x2d2c:   	flush	%g5 + 0xb05
	.word	0xe4a67fec	! t1_kref+0x2d30:   	sta	%l2, [%i1 - 0x14]%asi
	.word	0xd726001c	! t1_kref+0x2d34:   	st	%f11, [%i0 + %i4]
	.word	0x98550014	! t1_kref+0x2d38:   	umul	%l4, %l4, %o4
	.word	0xf13e4000	! t1_kref+0x2d3c:   	std	%f24, [%i1]
	.word	0xac246c20	! t1_kref+0x2d40:   	sub	%l1, 0xc20, %l6
	.word	0x80448011	! t1_kref+0x2d44:   	addc	%l2, %l1, %g0
	.word	0x81840000	! t1_kref+0x2d48:   	wr	%l0, %g0, %y
	.word	0xa5a0190e	! t1_kref+0x2d4c:   	fitod	%f14, %f18
	.word	0xa3a018cc	! t1_kref+0x2d50:   	fdtos	%f12, %f17
	.word	0x2b800008	! t1_kref+0x2d54:   	fbug,a	_kref+0x2d74
	.word	0x81b44332	! t1_kref+0x2d58:   	bmask	%l1, %l2, %g0
	.word	0x81dab864	! t1_kref+0x2d5c:   	flush	%o2 - 0x79c
	.word	0xd046600c	! t1_kref+0x2d60:   	ldsw	[%i1 + 0xc], %o0
	.word	0x90fc31fe	! t1_kref+0x2d64:   	sdivcc	%l0, -0xe02, %o0
	.word	0xa2bc2bce	! t1_kref+0x2d68:   	xnorcc	%l0, 0xbce, %l1
	.word	0xe4c8a014	! t1_kref+0x2d6c:   	ldsba	[%g2 + 0x14]%asi, %l2
	.word	0xa83cc011	! t1_kref+0x2d70:   	xnor	%l3, %l1, %l4
	.word	0x37800001	! t1_kref+0x2d74:   	fbge,a	_kref+0x2d78
	.word	0x81d86170	! t1_kref+0x2d78:   	flush	%g1 + 0x170
	.word	0xae547a3a	! t1_kref+0x2d7c:   	umul	%l1, -0x5c6, %l7
	.word	0x2b480008	! t1_kref+0x2d80:   	fbug,a,pt	%fcc0, _kref+0x2da0
	.word	0x80953a61	! t1_kref+0x2d84:   	orcc	%l4, -0x59f, %g0
	.word	0xa1a00550	! t1_kref+0x2d88:   	fsqrtd	%f16, %f16
	.word	0x901d362e	! t1_kref+0x2d8c:   	xor	%l4, -0x9d2, %o0
	.word	0xb5a00538	! t1_kref+0x2d90:   	fsqrts	%f24, %f26
	.word	0xa9a0054c	! t1_kref+0x2d94:   	fsqrtd	%f12, %f20
	.word	0xba102008	! t1_kref+0x2d98:   	mov	0x8, %i5
	.word	0xb5b60c92	! t1_kref+0x2d9c:   	fandnot2	%f24, %f18, %f26
	.word	0x807c8014	! t1_kref+0x2da0:   	sdiv	%l2, %l4, %g0
	.word	0x923c0012	! t1_kref+0x2da4:   	xnor	%l0, %l2, %o1
	.word	0x92f4c010	! t1_kref+0x2da8:   	udivcc	%l3, %l0, %o1
	.word	0x99b7854e	! t1_kref+0x2dac:   	fcmpeq16	%f30, %f14, %o4
	.word	0xfd1fbc58	! t1_kref+0x2db0:   	ldd	[%fp - 0x3a8], %f30
	.word	0x98bcc013	! t1_kref+0x2db4:   	xnorcc	%l3, %l3, %o4
	.word	0xabb38fb5	! t1_kref+0x2db8:   	fors	%f14, %f21, %f21
	.word	0xe028a016	! t1_kref+0x2dbc:   	stb	%l0, [%g2 + 0x16]
	.word	0xa25c0014	! t1_kref+0x2dc0:   	smul	%l0, %l4, %l1
	.word	0x81850000	! t1_kref+0x2dc4:   	wr	%l4, %g0, %y
	.word	0x95a00558	! t1_kref+0x2dc8:   	fsqrtd	%f24, %f10
	.word	0xa5a4085c	! t1_kref+0x2dcc:   	faddd	%f16, %f28, %f18
	.word	0xa5b58dd2	! t1_kref+0x2dd0:   	fnand	%f22, %f18, %f18
	.word	0x81ae8a58	! t1_kref+0x2dd4:   	fcmpd	%fcc0, %f26, %f24
	.word	0x98b50012	! t1_kref+0x2dd8:   	orncc	%l4, %l2, %o4
	.word	0xd91fbf10	! t1_kref+0x2ddc:   	ldd	[%fp - 0xf0], %f12
	.word	0x96344010	! t1_kref+0x2de0:   	orn	%l1, %l0, %o3
	.word	0x81ac0a5a	! t1_kref+0x2de4:   	fcmpd	%fcc0, %f16, %f26
	.word	0x99a0014a	! t1_kref+0x2de8:   	fabsd	%f10, %f12
	.word	0x965c3454	! t1_kref+0x2dec:   	smul	%l0, -0xbac, %o3
	.word	0x8143e048	! t1_kref+0x2df0:   	membar	0x48
	.word	0x81844000	! t1_kref+0x2df4:   	wr	%l1, %g0, %y
	.word	0x98d50014	! t1_kref+0x2df8:   	umulcc	%l4, %l4, %o4
	.word	0xa9a00554	! t1_kref+0x2dfc:   	fsqrtd	%f20, %f20
	.word	0x95b440b3	! t1_kref+0x2e00:   	edge16n	%l1, %l3, %o2
	.word	0xaa9c4013	! t1_kref+0x2e04:   	xorcc	%l1, %l3, %l5
	.word	0xa4bc743e	! t1_kref+0x2e08:   	xnorcc	%l1, -0xbc2, %l2
	.word	0xace50014	! t1_kref+0x2e0c:   	subccc	%l4, %l4, %l6
	.word	0xa464a8e8	! t1_kref+0x2e10:   	subc	%l2, 0x8e8, %l2
	.word	0x902c8010	! t1_kref+0x2e14:   	andn	%l2, %l0, %o0
	.word	0x9a948012	! t1_kref+0x2e18:   	orcc	%l2, %l2, %o5
	.word	0x9aa4b8a2	! t1_kref+0x2e1c:   	subcc	%l2, -0x75e, %o5
	.word	0xd47e001c	! t1_kref+0x2e20:   	swap	[%i0 + %i4], %o2
	.word	0xb7a5c8b9	! t1_kref+0x2e24:   	fsubs	%f23, %f25, %f27
	.word	0x9da788d0	! t1_kref+0x2e28:   	fsubd	%f30, %f16, %f14
	.word	0xbda0189e	! t1_kref+0x2e2c:   	fitos	%f30, %f30
	.word	0xe0300018	! t1_kref+0x2e30:   	sth	%l0, [%g0 + %i0]
	.word	0xa05cffd8	! t1_kref+0x2e34:   	smul	%l3, -0x28, %l0
	.word	0x81af0ad8	! t1_kref+0x2e38:   	fcmped	%fcc0, %f28, %f24
	.word	0x91408000	! t1_kref+0x2e3c:   	mov	%ccr, %o0
	.word	0xada38958	! t1_kref+0x2e40:   	fmuld	%f14, %f24, %f22
	.word	0xb9a689d4	! t1_kref+0x2e44:   	fdivd	%f26, %f20, %f28
	.word	0xa4840010	! t1_kref+0x2e48:   	addcc	%l0, %l0, %l2
	.word	0x9fa00137	! t1_kref+0x2e4c:   	fabss	%f23, %f15
	.word	0xe3e61014	! t1_kref+0x2e50:   	casa	[%i0]0x80, %l4, %l1
	.word	0xa1b6c96c	! t1_kref+0x2e54:   	fpmerge	%f27, %f12, %f16
	.word	0x81ad8aca	! t1_kref+0x2e58:   	fcmped	%fcc0, %f22, %f10
	.word	0x9abcf58a	! t1_kref+0x2e5c:   	xnorcc	%l3, -0xa76, %o5
	.word	0x9db64733	! t1_kref+0x2e60:   	fmuld8ulx16	%f25, %f19, %f14
	.word	0xac5c2d41	! t1_kref+0x2e64:   	smul	%l0, 0xd41, %l6
	.word	0xc5e8a003	! t1_kref+0x2e68:   	prefetcha	%g2 + 3, 2
	.word	0xb9a00152	! t1_kref+0x2e6c:   	fabsd	%f18, %f28
	.word	0xaa9cb01e	! t1_kref+0x2e70:   	xorcc	%l2, -0xfe2, %l5
	.word	0xda7e2010	! t1_kref+0x2e74:   	swap	[%i0 + 0x10], %o5
	.word	0x22800004	! t1_kref+0x2e78:   	be,a	_kref+0x2e88
	.word	0xf91e2018	! t1_kref+0x2e7c:   	ldd	[%i0 + 0x18], %f28
	.word	0xd81e7fe8	! t1_kref+0x2e80:   	ldd	[%i1 - 0x18], %o4
	.word	0xe67e0000	! t1_kref+0x2e84:   	swap	[%i0], %l3
	.word	0xe9180019	! t1_kref+0x2e88:   	ldd	[%g0 + %i1], %f20
	.word	0xafb44352	! t1_kref+0x2e8c:   	alignaddrl	%l1, %l2, %l7
	.word	0x93b4c240	! t1_kref+0x2e90:   	array16	%l3, %g0, %o1
	.word	0x97b384de	! t1_kref+0x2e94:   	fcmpne32	%f14, %f30, %o3
	.word	0x25480006	! t1_kref+0x2e98:   	fblg,a,pt	%fcc0, _kref+0x2eb0
	.word	0xb9a0052f	! t1_kref+0x2e9c:   	fsqrts	%f15, %f28
	.word	0xe0a8a035	! t1_kref+0x2ea0:   	stba	%l0, [%g2 + 0x35]%asi
	.word	0x810ce2ee	! t1_kref+0x2ea4:   	tsubcc	%l3, 0x2ee, %g0
	.word	0x92450010	! t1_kref+0x2ea8:   	addc	%l4, %l0, %o1
	.word	0x9ba00531	! t1_kref+0x2eac:   	fsqrts	%f17, %f13
	.word	0xada58d3c	! t1_kref+0x2eb0:   	fsmuld	%f22, %f28, %f22
	.word	0xaa2cf063	! t1_kref+0x2eb4:   	andn	%l3, -0xf9d, %l5
	.word	0xabb4c132	! t1_kref+0x2eb8:   	edge32n	%l3, %l2, %l5
	.word	0xa17025b0	! t1_kref+0x2ebc:   	popc	0x5b0, %l0
	.word	0x80544010	! t1_kref+0x2ec0:   	umul	%l1, %l0, %g0
	.word	0xadb60dcc	! t1_kref+0x2ec4:   	fnand	%f24, %f12, %f22
	.word	0xd8df5019	! t1_kref+0x2ec8:   	ldxa	[%i5 + %i1]0x80, %o4
	.word	0x91b4c093	! t1_kref+0x2ecc:   	edge16	%l3, %l3, %o0
	.word	0x81ad0a4a	! t1_kref+0x2ed0:   	fcmpd	%fcc0, %f20, %f10
	.word	0xd41e4000	! t1_kref+0x2ed4:   	ldd	[%i1], %o2
	.word	0xa5a0052c	! t1_kref+0x2ed8:   	fsqrts	%f12, %f18
	.word	0x2d480005	! t1_kref+0x2edc:   	fbg,a,pt	%fcc0, _kref+0x2ef0
	.word	0xe4a0a034	! t1_kref+0x2ee0:   	sta	%l2, [%g2 + 0x34]%asi
	.word	0x3e800002	! t1_kref+0x2ee4:   	bvc,a	_kref+0x2eec
	.word	0xa9b4c0f1	! t1_kref+0x2ee8:   	edge16ln	%l3, %l1, %l4
	.word	0x81b404d4	! t1_kref+0x2eec:   	fcmpne32	%f16, %f20, %g0
	.word	0xa4543569	! t1_kref+0x2ef0:   	umul	%l0, -0xa97, %l2
	.word	0xea562016	! t1_kref+0x2ef4:   	ldsh	[%i0 + 0x16], %l5
	.word	0x81db7f38	! t1_kref+0x2ef8:   	flush	%o5 - 0xc8
	.word	0x2f480007	! t1_kref+0x2efc:   	fbu,a,pt	%fcc0, _kref+0x2f18
	.word	0xa6bcb70c	! t1_kref+0x2f00:   	xnorcc	%l2, -0x8f4, %l3
	.word	0xb1a0054e	! t1_kref+0x2f04:   	fsqrtd	%f14, %f24
	.word	0xa45c2767	! t1_kref+0x2f08:   	smul	%l0, 0x767, %l2
	.word	0xa33cc013	! t1_kref+0x2f0c:   	sra	%l3, %l3, %l1
	.word	0x95b4841a	! t1_kref+0x2f10:   	fcmple16	%f18, %f26, %o2
	.word	0xae044014	! t1_kref+0x2f14:   	add	%l1, %l4, %l7
	.word	0x91b48153	! t1_kref+0x2f18:   	edge32l	%l2, %l3, %o0
	.word	0x90050010	! t1_kref+0x2f1c:   	add	%l4, %l0, %o0
	.word	0xa73cc013	! t1_kref+0x2f20:   	sra	%l3, %l3, %l3
	.word	0x2d800008	! t1_kref+0x2f24:   	fbg,a	_kref+0x2f44
	.word	0xaba4492e	! t1_kref+0x2f28:   	fmuls	%f17, %f14, %f21
	.word	0xaf408000	! t1_kref+0x2f2c:   	mov	%ccr, %l7
	.word	0x99a00556	! t1_kref+0x2f30:   	fsqrtd	%f22, %f12
	.word	0xa3a00132	! t1_kref+0x2f34:   	fabss	%f18, %f17
	.word	0x2b480002	! t1_kref+0x2f38:   	fbug,a,pt	%fcc0, _kref+0x2f40
	.word	0x81ddb3e2	! t1_kref+0x2f3c:   	flush	%l6 - 0xc1e
	.word	0xa9a0002b	! t1_kref+0x2f40:   	fmovs	%f11, %f20
	.word	0x909ca73d	! t1_kref+0x2f44:   	xorcc	%l2, 0x73d, %o0
	.word	0x9aac0014	! t1_kref+0x2f48:   	andncc	%l0, %l4, %o5
	.word	0xf91fbc00	! t1_kref+0x2f4c:   	ldd	[%fp - 0x400], %f28
	.word	0x905523cf	! t1_kref+0x2f50:   	umul	%l4, 0x3cf, %o0
	.word	0xe02e401a	! t1_kref+0x2f54:   	stb	%l0, [%i1 + %i2]
	.word	0xf1062000	! t1_kref+0x2f58:   	ld	[%i0], %f24
	.word	0xe6263fe8	! t1_kref+0x2f5c:   	st	%l3, [%i0 - 0x18]
	.word	0x81ae0aba	! t1_kref+0x2f60:   	fcmpes	%fcc0, %f24, %f26
	.word	0xa7a6c930	! t1_kref+0x2f64:   	fmuls	%f27, %f16, %f19
	.word	0xb9b4cdf6	! t1_kref+0x2f68:   	fnands	%f19, %f22, %f28
	.word	0xb1b58d96	! t1_kref+0x2f6c:   	fxor	%f22, %f22, %f24
	.word	0xe6264000	! t1_kref+0x2f70:   	st	%l3, [%i1]
	.word	0x9fc00004	! t1_kref+0x2f74:   	call	%g0 + %g4
	.word	0xa1b48200	! t1_kref+0x2f78:   	array8	%l2, %g0, %l0
	.word	0xa6348012	! t1_kref+0x2f7c:   	orn	%l2, %l2, %l3
	.word	0x37480008	! t1_kref+0x2f80:   	fbge,a,pt	%fcc0, _kref+0x2fa0
	.word	0xb810201c	! t1_kref+0x2f84:   	mov	0x1c, %i4
	.word	0x9f400000	! t1_kref+0x2f88:   	mov	%y, %o7
	.word	0x9a5d2080	! t1_kref+0x2f8c:   	smul	%l4, 0x80, %o5
	.word	0x80d48011	! t1_kref+0x2f90:   	umulcc	%l2, %l1, %g0
	.word	0xb9b58e80	! t1_kref+0x2f94:   	fsrc1	%f22, %f28
	.word	0x97150012	! t1_kref+0x2f98:   	taddcctv	%l4, %l2, %o3
	.word	0xec1e001d	! t1_kref+0x2f9c:   	ldd	[%i0 + %i5], %l6
	.word	0xb9a289da	! t1_kref+0x2fa0:   	fdivd	%f10, %f26, %f28
	.word	0xbdb74e6f	! t1_kref+0x2fa4:   	fxnors	%f29, %f15, %f30
	.word	0xd41e2018	! t1_kref+0x2fa8:   	ldd	[%i0 + 0x18], %o2
	.word	0xafb4c314	! t1_kref+0x2fac:   	alignaddr	%l3, %l4, %l7
	.word	0xa9a389dc	! t1_kref+0x2fb0:   	fdivd	%f14, %f28, %f20
	.word	0xa804f751	! t1_kref+0x2fb4:   	add	%l3, -0x8af, %l4
	.word	0xe380a02c	! t1_kref+0x2fb8:   	lda	[%g2 + 0x2c]%asi, %f17
	.word	0x9f40c000	! t1_kref+0x2fbc:   	mov	%asi, %o7
	.word	0x81abcab4	! t1_kref+0x2fc0:   	fcmpes	%fcc0, %f15, %f20
	.word	0xe2267fe4	! t1_kref+0x2fc4:   	st	%l1, [%i1 - 0x1c]
	.word	0x81ac8a52	! t1_kref+0x2fc8:   	fcmpd	%fcc0, %f18, %f18
	.word	0xe828a03f	! t1_kref+0x2fcc:   	stb	%l4, [%g2 + 0x3f]
	.word	0xa5a0055a	! t1_kref+0x2fd0:   	fsqrtd	%f26, %f18
	.word	0xa5a00556	! t1_kref+0x2fd4:   	fsqrtd	%f22, %f18
	.word	0x2f800005	! t1_kref+0x2fd8:   	fbu,a	_kref+0x2fec
	.word	0xc0c81018	! t1_kref+0x2fdc:   	ldsba	[%g0 + %i0]0x80, %g0
	.word	0xd41e6010	! t1_kref+0x2fe0:   	ldd	[%i1 + 0x10], %o2
	.word	0x99b58ad4	! t1_kref+0x2fe4:   	fpsub32	%f22, %f20, %f12
	.word	0xea4e8019	! t1_kref+0x2fe8:   	ldsb	[%i2 + %i1], %l5
	.word	0x99b38d1c	! t1_kref+0x2fec:   	fandnot1	%f14, %f28, %f12
	.word	0x81af8aaf	! t1_kref+0x2ff0:   	fcmpes	%fcc0, %f30, %f15
	.word	0x94fcc013	! t1_kref+0x2ff4:   	sdivcc	%l3, %l3, %o2
	.word	0xd9bf5a59	! t1_kref+0x2ff8:   	stda	%f12, [%i5 + %i1]0xd2
	.word	0x8143e05d	! t1_kref+0x2ffc:   	membar	0x5d
	.word	0xf91fbdb0	! t1_kref+0x3000:   	ldd	[%fp - 0x250], %f28
	.word	0xe436c019	! t1_kref+0x3004:   	sth	%l2, [%i3 + %i1]
	.word	0x81ac0a3a	! t1_kref+0x3008:   	fcmps	%fcc0, %f16, %f26
	.word	0x81abca2d	! t1_kref+0x300c:   	fcmps	%fcc0, %f15, %f13
	.word	0x81adcab4	! t1_kref+0x3010:   	fcmpes	%fcc0, %f23, %f20
	.word	0x23480007	! t1_kref+0x3014:   	fbne,a,pt	%fcc0, _kref+0x3030
	.word	0x9bb40091	! t1_kref+0x3018:   	edge16	%l0, %l1, %o5
	.word	0xe8264000	! t1_kref+0x301c:   	st	%l4, [%i1]
	.word	0x925d0014	! t1_kref+0x3020:   	smul	%l4, %l4, %o1
	.word	0xa9a78d30	! t1_kref+0x3024:   	fsmuld	%f30, %f16, %f20
	.word	0xd91e3fe8	! t1_kref+0x3028:   	ldd	[%i0 - 0x18], %f12
	.word	0x965d2967	! t1_kref+0x302c:   	smul	%l4, 0x967, %o3
	.word	0x99a4c939	! t1_kref+0x3030:   	fmuls	%f19, %f25, %f12
	.word	0xa1a5c938	! t1_kref+0x3034:   	fmuls	%f23, %f24, %f16
	.word	0x9a5c7a75	! t1_kref+0x3038:   	smul	%l1, -0x58b, %o5
	.word	0xa1a01934	! t1_kref+0x303c:   	fstod	%f20, %f16
	.word	0xda967ff8	! t1_kref+0x3040:   	lduha	[%i1 - 8]%asi, %o5
	.word	0xa5a0055c	! t1_kref+0x3044:   	fsqrtd	%f28, %f18
	.word	0xf5a0a024	! t1_kref+0x3048:   	sta	%f26, [%g2 + 0x24]%asi
	.word	0x97a00132	! t1_kref+0x304c:   	fabss	%f18, %f11
	.word	0x8184c000	! t1_kref+0x3050:   	wr	%l3, %g0, %y
	.word	0x9da74d31	! t1_kref+0x3054:   	fsmuld	%f29, %f17, %f14
	.word	0xa464c011	! t1_kref+0x3058:   	subc	%l3, %l1, %l2
	.word	0x86102019	! t1_kref+0x305c:   	mov	0x19, %g3
	.word	0x86a0e001	! t1_kref+0x3060:   	subcc	%g3, 1, %g3
	.word	0x22800013	! t1_kref+0x3064:   	be,a	_kref+0x30b0
	.word	0xb1a0191e	! t1_kref+0x3068:   	fitod	%f30, %f24
	.word	0xb1b00cd0	! t1_kref+0x306c:   	fnot2	%f16, %f24
	.word	0xd9263fe8	! t1_kref+0x3070:   	st	%f12, [%i0 - 0x18]
	.word	0x97b58a36	! t1_kref+0x3074:   	fpadd16s	%f22, %f22, %f11
	.word	0xa4547ba6	! t1_kref+0x3078:   	umul	%l1, -0x45a, %l2
	.word	0xe826001c	! t1_kref+0x307c:   	st	%l4, [%i0 + %i4]
	.word	0xb5b00f18	! t1_kref+0x3080:   	fsrc2	%f24, %f26
	.word	0xa5a0054c	! t1_kref+0x3084:   	fsqrtd	%f12, %f18
	.word	0xbba30936	! t1_kref+0x3088:   	fmuls	%f12, %f22, %f29
	.word	0xf91fbf50	! t1_kref+0x308c:   	ldd	[%fp - 0xb0], %f28
	.word	0x9f400000	! t1_kref+0x3090:   	mov	%y, %o7
	.word	0xa89cc012	! t1_kref+0x3094:   	xorcc	%l3, %l2, %l4
	.word	0x97a0012d	! t1_kref+0x3098:   	fabss	%f13, %f11
	.word	0xede65014	! t1_kref+0x309c:   	casa	[%i1]0x80, %l4, %l6
	.word	0xe67e2014	! t1_kref+0x30a0:   	swap	[%i0 + 0x14], %l3
	.word	0xee7e7ff0	! t1_kref+0x30a4:   	swap	[%i1 - 0x10], %l7
	.word	0x9f414000	! t1_kref+0x30a8:   	mov	%pc, %o7
	.word	0x99a0055c	! t1_kref+0x30ac:   	fsqrtd	%f28, %f12
	.word	0xa5b585da	! t1_kref+0x30b0:   	fcmpeq32	%f22, %f26, %l2
	.word	0xe6280018	! t1_kref+0x30b4:   	stb	%l3, [%g0 + %i0]
	.word	0xabb4c352	! t1_kref+0x30b8:   	alignaddrl	%l3, %l2, %l5
	.word	0x9a450010	! t1_kref+0x30bc:   	addc	%l4, %l0, %o5
	.word	0xa22d3731	! t1_kref+0x30c0:   	andn	%l4, -0x8cf, %l1
	.word	0x96a48011	! t1_kref+0x30c4:   	subcc	%l2, %l1, %o3
	.word	0xa9a01912	! t1_kref+0x30c8:   	fitod	%f18, %f20
	.word	0x32480005	! t1_kref+0x30cc:   	bne,a,pt	%icc, _kref+0x30e0
	.word	0x9a5d0013	! t1_kref+0x30d0:   	smul	%l4, %l3, %o5
	.word	0xf56e001b	! t1_kref+0x30d4:   	prefetch	%i0 + %i3, 26
	.word	0xae453840	! t1_kref+0x30d8:   	addc	%l4, -0x7c0, %l7
	.word	0x2f800005	! t1_kref+0x30dc:   	fbu,a	_kref+0x30f0
	.word	0x81840000	! t1_kref+0x30e0:   	wr	%l0, %g0, %y
	.word	0xada0111a	! t1_kref+0x30e4:   	fxtod	%f26, %f22
	.word	0x99a00136	! t1_kref+0x30e8:   	fabss	%f22, %f12
	.word	0x33800004	! t1_kref+0x30ec:   	fbe,a	_kref+0x30fc
	.word	0xa3b40280	! t1_kref+0x30f0:   	array32	%l0, %g0, %l1
	.word	0xf1be1a1a	! t1_kref+0x30f4:   	stda	%f24, [%i0 + %i2]0xd0
	.word	0xa5a6c933	! t1_kref+0x30f8:   	fmuls	%f27, %f19, %f18
	.word	0xb5a70938	! t1_kref+0x30fc:   	fmuls	%f28, %f24, %f26
	.word	0x99400000	! t1_kref+0x3100:   	mov	%y, %o4
	.word	0x9e540010	! t1_kref+0x3104:   	umul	%l0, %l0, %o7
	.word	0x967c7496	! t1_kref+0x3108:   	sdiv	%l1, -0xb6a, %o3
	.word	0xb9b30d60	! t1_kref+0x310c:   	fnot1s	%f12, %f28
	.word	0xe0b0a01e	! t1_kref+0x3110:   	stha	%l0, [%g2 + 0x1e]%asi
	.word	0xc0563ffe	! t1_kref+0x3114:   	ldsh	[%i0 - 2], %g0
	.word	0xe828a007	! t1_kref+0x3118:   	stb	%l4, [%g2 + 7]
	.word	0x980d0013	! t1_kref+0x311c:   	and	%l4, %l3, %o4
	.word	0xada0105c	! t1_kref+0x3120:   	fdtox	%f28, %f22
	.word	0x9db54db1	! t1_kref+0x3124:   	fxors	%f21, %f17, %f14
	.word	0x9fa309ae	! t1_kref+0x3128:   	fdivs	%f12, %f14, %f15
	.word	0xc12e3fe0	! t1_kref+0x312c:   	st	%fsr, [%i0 - 0x20]
	.word	0xaa443a57	! t1_kref+0x3130:   	addc	%l0, -0x5a9, %l5
	.word	0x2d480006	! t1_kref+0x3134:   	fbg,a,pt	%fcc0, _kref+0x314c
	.word	0xa26428c5	! t1_kref+0x3138:   	subc	%l0, 0x8c5, %l1
	.word	0xbda0053b	! t1_kref+0x313c:   	fsqrts	%f27, %f30
	.word	0xa5247610	! t1_kref+0x3140:   	mulscc	%l1, -0x9f0, %l2
	.word	0xc080105c	! t1_kref+0x3144:   	lda	[%g0 + %i4]0x82, %g0
	.word	0x81dcc01e	! t1_kref+0x3148:   	flush	%l3 + %fp
	.word	0x9b400000	! t1_kref+0x314c:   	mov	%y, %o5
	.word	0xada308b0	! t1_kref+0x3150:   	fsubs	%f12, %f16, %f22
	.word	0x27800004	! t1_kref+0x3154:   	fbul,a	_kref+0x3164
	.word	0xb5a389d6	! t1_kref+0x3158:   	fdivd	%f14, %f22, %f26
	.word	0x2e480003	! t1_kref+0x315c:   	bvs,a,pt	%icc, _kref+0x3168
	.word	0xada0055c	! t1_kref+0x3160:   	fsqrtd	%f28, %f22
	.word	0xa4acc011	! t1_kref+0x3164:   	andncc	%l3, %l1, %l2
	.word	0xb1a00550	! t1_kref+0x3168:   	fsqrtd	%f16, %f24
	.word	0xa43c6300	! t1_kref+0x316c:   	xnor	%l1, 0x300, %l2
	.word	0x92c4c013	! t1_kref+0x3170:   	addccc	%l3, %l3, %o1
	.word	0xb1a000cc	! t1_kref+0x3174:   	fnegd	%f12, %f24
	.word	0x805c737d	! t1_kref+0x3178:   	smul	%l1, -0xc83, %g0
	.word	0xb1a488de	! t1_kref+0x317c:   	fsubd	%f18, %f30, %f24
	.word	0x3f480006	! t1_kref+0x3180:   	fbo,a,pt	%fcc0, _kref+0x3198
	.word	0xaba00134	! t1_kref+0x3184:   	fabss	%f20, %f21
	.word	0xfb6e6018	! t1_kref+0x3188:   	prefetch	%i1 + 0x18, 29
	.word	0x36800007	! t1_kref+0x318c:   	bge,a	_kref+0x31a8
	.word	0x81848000	! t1_kref+0x3190:   	wr	%l2, %g0, %y
	.word	0x9da0055a	! t1_kref+0x3194:   	fsqrtd	%f26, %f14
	.word	0xa045321b	! t1_kref+0x3198:   	addc	%l4, -0xde5, %l0
	.word	0xa1a5094e	! t1_kref+0x319c:   	fmuld	%f20, %f14, %f16
	.word	0x969c6fc3	! t1_kref+0x31a0:   	xorcc	%l1, 0xfc3, %o3
	.word	0x90050012	! t1_kref+0x31a4:   	add	%l4, %l2, %o0
	.word	0xa7b58412	! t1_kref+0x31a8:   	fcmple16	%f22, %f18, %l3
	.word	0xbda0055c	! t1_kref+0x31ac:   	fsqrtd	%f28, %f30
	.word	0xe11e2018	! t1_kref+0x31b0:   	ldd	[%i0 + 0x18], %f16
	.word	0x93250011	! t1_kref+0x31b4:   	mulscc	%l4, %l1, %o1
	.word	0xb1b48737	! t1_kref+0x31b8:   	fmuld8ulx16	%f18, %f23, %f24
	.word	0xa2448013	! t1_kref+0x31bc:   	addc	%l2, %l3, %l1
	.word	0xa1b40454	! t1_kref+0x31c0:   	fcmpne16	%f16, %f20, %l0
	.word	0x81dbf68c	! t1_kref+0x31c4:   	flush	%o7 - 0x974
	.word	0xa61437d5	! t1_kref+0x31c8:   	or	%l0, -0x82b, %l3
	.word	0xa3a408ac	! t1_kref+0x31cc:   	fsubs	%f16, %f12, %f17
	.word	0x81ac0adc	! t1_kref+0x31d0:   	fcmped	%fcc0, %f16, %f28
	.word	0x99b4c034	! t1_kref+0x31d4:   	edge8n	%l3, %l4, %o4
	.word	0xe62e6015	! t1_kref+0x31d8:   	stb	%l3, [%i1 + 0x15]
	.word	0x98050011	! t1_kref+0x31dc:   	add	%l4, %l1, %o4
	.word	0xe42e8019	! t1_kref+0x31e0:   	stb	%l2, [%i2 + %i1]
	.word	0x9da7085c	! t1_kref+0x31e4:   	faddd	%f28, %f28, %f14
	.word	0xa80468d9	! t1_kref+0x31e8:   	add	%l1, 0x8d9, %l4
	.word	0x99b6863a	! t1_kref+0x31ec:   	fmul8x16	%f26, %f26, %f12
	.word	0xec16201e	! t1_kref+0x31f0:   	lduh	[%i0 + 0x1e], %l6
	.word	0x942d20c3	! t1_kref+0x31f4:   	andn	%l4, 0xc3, %o2
	.word	0xada5094e	! t1_kref+0x31f8:   	fmuld	%f20, %f14, %f22
	.word	0x98e4c014	! t1_kref+0x31fc:   	subccc	%l3, %l4, %o4
	.word	0xa5a00530	! t1_kref+0x3200:   	fsqrts	%f16, %f18
	.word	0x80ac4013	! t1_kref+0x3204:   	andncc	%l1, %l3, %g0
	.word	0xae5c8012	! t1_kref+0x3208:   	smul	%l2, %l2, %l7
	.word	0xe84e2017	! t1_kref+0x320c:   	ldsb	[%i0 + 0x17], %l4
	.word	0xd91fbf78	! t1_kref+0x3210:   	ldd	[%fp - 0x88], %f12
	.word	0xa2dc8011	! t1_kref+0x3214:   	smulcc	%l2, %l1, %l1
	.word	0x9fc00004	! t1_kref+0x3218:   	call	%g0 + %g4
	.word	0x96a4c012	! t1_kref+0x321c:   	subcc	%l3, %l2, %o3
	.word	0x9fc10000	! t1_kref+0x3220:   	call	%g4
	.word	0x9a54fae6	! t1_kref+0x3224:   	umul	%l3, -0x51a, %o5
	.word	0x25800007	! t1_kref+0x3228:   	fblg,a	_kref+0x3244
	.word	0xc07e6014	! t1_kref+0x322c:   	swap	[%i1 + 0x14], %g0
	.word	0x81af0ad8	! t1_kref+0x3230:   	fcmped	%fcc0, %f28, %f24
	.word	0xd9070018	! t1_kref+0x3234:   	ld	[%i4 + %i0], %f12
	.word	0x94048011	! t1_kref+0x3238:   	add	%l2, %l1, %o2
	.word	0xad1c73cf	! t1_kref+0x323c:   	tsubcctv	%l1, -0xc31, %l6
	.word	0xe628a01d	! t1_kref+0x3240:   	stb	%l3, [%g2 + 0x1d]
	.word	0xd44e8018	! t1_kref+0x3244:   	ldsb	[%i2 + %i0], %o2
	.word	0xadb4c71d	! t1_kref+0x3248:   	fmuld8sux16	%f19, %f29, %f22
	.word	0x81af8a5a	! t1_kref+0x324c:   	fcmpd	%fcc0, %f30, %f26
	.word	0x39480003	! t1_kref+0x3250:   	fbuge,a,pt	%fcc0, _kref+0x325c
	.word	0xa3b384d6	! t1_kref+0x3254:   	fcmpne32	%f14, %f22, %l1
	.word	0x9edca5ab	! t1_kref+0x3258:   	smulcc	%l2, 0x5ab, %o7
	.word	0x9afcefaf	! t1_kref+0x325c:   	sdivcc	%l3, 0xfaf, %o5
	.word	0xd93e6010	! t1_kref+0x3260:   	std	%f12, [%i1 + 0x10]
	.word	0xd09e5000	! t1_kref+0x3264:   	ldda	[%i1]0x80, %o0
	.word	0xa49c4012	! t1_kref+0x3268:   	xorcc	%l1, %l2, %l2
	.word	0x97b404d2	! t1_kref+0x326c:   	fcmpne32	%f16, %f18, %o3
	.word	0xaa04b15f	! t1_kref+0x3270:   	add	%l2, -0xea1, %l5
	.word	0x905cbfeb	! t1_kref+0x3274:   	smul	%l2, -0x15, %o0
	.word	0x2f800008	! t1_kref+0x3278:   	fbu,a	_kref+0x3298
	.word	0x932c8014	! t1_kref+0x327c:   	sll	%l2, %l4, %o1
	.word	0xa0a50011	! t1_kref+0x3280:   	subcc	%l4, %l1, %l0
	.word	0xada68858	! t1_kref+0x3284:   	faddd	%f26, %f24, %f22
	.word	0x81af4a2f	! t1_kref+0x3288:   	fcmps	%fcc0, %f29, %f15
	.word	0x9f414000	! t1_kref+0x328c:   	mov	%pc, %o7
	.word	0xa8a4c010	! t1_kref+0x3290:   	subcc	%l3, %l0, %l4
	.word	0x9224c013	! t1_kref+0x3294:   	sub	%l3, %l3, %o1
	.word	0x95b48a94	! t1_kref+0x3298:   	fpsub16	%f18, %f20, %f10
	.word	0xb9a70d2b	! t1_kref+0x329c:   	fsmuld	%f28, %f11, %f28
	.word	0x8143e068	! t1_kref+0x32a0:   	membar	0x68
	.word	0xa1247b8a	! t1_kref+0x32a4:   	mulscc	%l1, -0x476, %l0
	.word	0x9a344013	! t1_kref+0x32a8:   	orn	%l1, %l3, %o5
	.word	0xacbc8011	! t1_kref+0x32ac:   	xnorcc	%l2, %l1, %l6
	.word	0x9fc10000	! t1_kref+0x32b0:   	call	%g4
	.word	0xd27e7fec	! t1_kref+0x32b4:   	swap	[%i1 - 0x14], %o1
	.word	0xb9a4885c	! t1_kref+0x32b8:   	faddd	%f18, %f28, %f28
	.word	0xd67e2004	! t1_kref+0x32bc:   	swap	[%i0 + 4], %o3
	.word	0xd24e3ff2	! t1_kref+0x32c0:   	ldsb	[%i0 - 0xe], %o1
	.word	0xc0167ff6	! t1_kref+0x32c4:   	lduh	[%i1 - 0xa], %g0
	.word	0xe4086700	! t1_kref+0x32c8:   	ldub	[%g1 + 0x700], %l2
	.word	0xa41ca00c	! t1_kref+0x32cc:   	xor	%l2, 0xc, %l2
	.word	0xe4286700	! t1_kref+0x32d0:   	stb	%l2, [%g1 + 0x700]
	.word	0x81d86700	! t1_kref+0x32d4:   	flush	%g1 + 0x700
	.word	0x26800008	! t1_kref+0x32d8:   	bl,a	_kref+0x32f8
	.word	0x968cc014	! t1_kref+0x32dc:   	andcc	%l3, %l4, %o3
	.word	0x37480002	! t1_kref+0x32e0:   	fbge,a,pt	%fcc0, _kref+0x32e8
	.word	0x960c234b	! t1_kref+0x32e4:   	and	%l0, 0x34b, %o3
	.word	0x9284c010	! t1_kref+0x32e8:   	addcc	%l3, %l0, %o1
	.word	0xb9b00f34	! t1_kref+0x32ec:   	fsrc2s	%f20, %f28
	.word	0x97a0053c	! t1_kref+0x32f0:   	fsqrts	%f28, %f11
	.word	0xaf400000	! t1_kref+0x32f4:   	mov	%y, %l7
2:	.word	0xd91e6018	! t1_kref+0x32f8:   	ldd	[%i1 + 0x18], %f12
	.word	0xa3b4858e	! t1_kref+0x32fc:   	fcmpgt32	%f18, %f14, %l1
	.word	0xa434c010	! t1_kref+0x3300:   	orn	%l3, %l0, %l2
	.word	0xd6de3ff8	! t1_kref+0x3304:   	ldxa	[%i0 - 8]%asi, %o3
	.word	0x9b24adb0	! t1_kref+0x3308:   	mulscc	%l2, 0xdb0, %o5
	.word	0xa8dd0013	! t1_kref+0x330c:   	smulcc	%l4, %l3, %l4
	.word	0x81ad8ad4	! t1_kref+0x3310:   	fcmped	%fcc0, %f22, %f20
	.word	0xd99e1000	! t1_kref+0x3314:   	ldda	[%i0]0x80, %f12
	.word	0xa1b38e5a	! t1_kref+0x3318:   	fxnor	%f14, %f26, %f16
	.word	0x81700014	! t1_kref+0x331c:   	popc	%l4, %g0
	.word	0x878020d0	! t1_kref+0x3320:   	mov	0xd0, %asi
	.word	0x8143c000	! t1_kref+0x3324:   	stbar
	.word	0x9844795b	! t1_kref+0x3328:   	addc	%l1, -0x6a5, %o4
	.word	0xb1a709ad	! t1_kref+0x332c:   	fdivs	%f28, %f13, %f24
	.word	0x99b00f0c	! t1_kref+0x3330:   	fsrc2	%f12, %f12
	.word	0x2a800007	! t1_kref+0x3334:   	bcs,a	_kref+0x3350
	.word	0xa5a8004e	! t1_kref+0x3338:   	fmovdn	%fcc0, %f14, %f18
	.word	0xbda00550	! t1_kref+0x333c:   	fsqrtd	%f16, %f30
	.word	0x92bc24c6	! t1_kref+0x3340:   	xnorcc	%l0, 0x4c6, %o1
	.word	0xbba01a50	! t1_kref+0x3344:   	fdtoi	%f16, %f29
	.word	0xa1b40710	! t1_kref+0x3348:   	fmuld8sux16	%f16, %f16, %f16
	.word	0xe828a014	! t1_kref+0x334c:   	stb	%l4, [%g2 + 0x14]
	.word	0x98a434a1	! t1_kref+0x3350:   	subcc	%l0, -0xb5f, %o4
	.word	0xa1b440b1	! t1_kref+0x3354:   	edge16n	%l1, %l1, %l0
	.word	0xa3a3492d	! t1_kref+0x3358:   	fmuls	%f13, %f13, %f17
	.word	0xada709af	! t1_kref+0x335c:   	fdivs	%f28, %f15, %f22
	.word	0xbdb30efe	! t1_kref+0x3360:   	fornot2s	%f12, %f30, %f30
	.word	0xe968a081	! t1_kref+0x3364:   	prefetch	%g2 + 0x81, 20
	.word	0x95b40c9e	! t1_kref+0x3368:   	fandnot2	%f16, %f30, %f10
	.word	0xc368a08e	! t1_kref+0x336c:   	prefetch	%g2 + 0x8e, 1
	.word	0xd91fbe68	! t1_kref+0x3370:   	ldd	[%fp - 0x198], %f12
	.word	0xe420a03c	! t1_kref+0x3374:   	st	%l2, [%g2 + 0x3c]
	.word	0xeb263ff4	! t1_kref+0x3378:   	st	%f21, [%i0 - 0xc]
	.word	0xa02c7f86	! t1_kref+0x337c:   	andn	%l1, -0x7a, %l0
	.word	0x27800007	! t1_kref+0x3380:   	fbul,a	_kref+0x339c
	.word	0x9db007ae	! t1_kref+0x3384:   	fpackfix	%f14, %f14
	.word	0xe07e001c	! t1_kref+0x3388:   	swap	[%i0 + %i4], %l0
	.word	0x23480002	! t1_kref+0x338c:   	fbne,a,pt	%fcc0, _kref+0x3394
	.word	0xa8f4f170	! t1_kref+0x3390:   	udivcc	%l3, -0xe90, %l4
	.word	0xba102018	! t1_kref+0x3394:   	mov	0x18, %i5
	.word	0x9bb5ccb0	! t1_kref+0x3398:   	fandnot2s	%f23, %f16, %f13
	.word	0xd67e3fe0	! t1_kref+0x339c:   	swap	[%i0 - 0x20], %o3
	.word	0xb9b00fc0	! t1_kref+0x33a0:   	fone	%f28
	.word	0xa8453a97	! t1_kref+0x33a4:   	addc	%l4, -0x569, %l4
	.word	0xa3b40154	! t1_kref+0x33a8:   	edge32l	%l0, %l4, %l1
	.word	0xd440a03c	! t1_kref+0x33ac:   	ldsw	[%g2 + 0x3c], %o2
	.word	0xfd1fbd10	! t1_kref+0x33b0:   	ldd	[%fp - 0x2f0], %f30
	.word	0xf1062004	! t1_kref+0x33b4:   	ld	[%i0 + 4], %f24
	.word	0xe030a006	! t1_kref+0x33b8:   	sth	%l0, [%g2 + 6]
	.word	0xfd1fbd78	! t1_kref+0x33bc:   	ldd	[%fp - 0x288], %f30
	.word	0xa2d40011	! t1_kref+0x33c0:   	umulcc	%l0, %l1, %l1
	.word	0x801cecba	! t1_kref+0x33c4:   	xor	%l3, 0xcba, %g0
	.word	0xa9b60dda	! t1_kref+0x33c8:   	fnand	%f24, %f26, %f20
	.word	0xe4100019	! t1_kref+0x33cc:   	lduh	[%g0 + %i1], %l2
	.word	0x81850000	! t1_kref+0x33d0:   	wr	%l4, %g0, %y
	.word	0xe4ee1000	! t1_kref+0x33d4:   	ldstuba	[%i0]0x80, %l2
	.word	0x9244c014	! t1_kref+0x33d8:   	addc	%l3, %l4, %o1
	.word	0xac64c010	! t1_kref+0x33dc:   	subc	%l3, %l0, %l6
	.word	0x980c4014	! t1_kref+0x33e0:   	and	%l1, %l4, %o4
	.word	0xaba309ae	! t1_kref+0x33e4:   	fdivs	%f12, %f14, %f21
	.word	0x9da30850	! t1_kref+0x33e8:   	faddd	%f12, %f16, %f14
	.word	0xf726601c	! t1_kref+0x33ec:   	st	%f27, [%i1 + 0x1c]
	.word	0x9064e51c	! t1_kref+0x33f0:   	subc	%l3, 0x51c, %o0
	.word	0xa13d0011	! t1_kref+0x33f4:   	sra	%l4, %l1, %l0
	.word	0x94852b08	! t1_kref+0x33f8:   	addcc	%l4, 0xb08, %o2
	.word	0x2c800001	! t1_kref+0x33fc:   	bneg,a	_kref+0x3400
	.word	0xe40e7fe7	! t1_kref+0x3400:   	ldub	[%i1 - 0x19], %l2
	.word	0xe44e3ffb	! t1_kref+0x3404:   	ldsb	[%i0 - 5], %l2
	.word	0xe0480019	! t1_kref+0x3408:   	ldsb	[%g0 + %i1], %l0
	.word	0xe51e3ff0	! t1_kref+0x340c:   	ldd	[%i0 - 0x10], %f18
	.word	0xdd1fbcb8	! t1_kref+0x3410:   	ldd	[%fp - 0x348], %f14
	.word	0x9da0054e	! t1_kref+0x3414:   	fsqrtd	%f14, %f14
	.word	0xa8f4a376	! t1_kref+0x3418:   	udivcc	%l2, 0x376, %l4
	.word	0x99a30d31	! t1_kref+0x341c:   	fsmuld	%f12, %f17, %f12
	.word	0xe628a016	! t1_kref+0x3420:   	stb	%l3, [%g2 + 0x16]
	.word	0xafa00138	! t1_kref+0x3424:   	fabss	%f24, %f23
	.word	0x9bb50153	! t1_kref+0x3428:   	edge32l	%l4, %l3, %o5
	.word	0xf007bfe0	! t1_kref+0x342c:   	ld	[%fp - 0x20], %i0
	.word	0xa08cc013	! t1_kref+0x3430:   	andcc	%l3, %l3, %l0
	.word	0xb7a488ae	! t1_kref+0x3434:   	fsubs	%f18, %f14, %f27
	.word	0xe828a015	! t1_kref+0x3438:   	stb	%l4, [%g2 + 0x15]
	.word	0xd000a03c	! t1_kref+0x343c:   	ld	[%g2 + 0x3c], %o0
	.word	0x92ad3ca2	! t1_kref+0x3440:   	andncc	%l4, -0x35e, %o1
	.word	0x81ab0aca	! t1_kref+0x3444:   	fcmped	%fcc0, %f12, %f10
	.word	0xd81e6018	! t1_kref+0x3448:   	ldd	[%i1 + 0x18], %o4
	.word	0x960c4010	! t1_kref+0x344c:   	and	%l1, %l0, %o3
	.word	0xb9a78852	! t1_kref+0x3450:   	faddd	%f30, %f18, %f28
	.word	0xa5a50d36	! t1_kref+0x3454:   	fsmuld	%f20, %f22, %f18
	.word	0x81da800a	! t1_kref+0x3458:   	flush	%o2 + %o2
	.word	0xef6e7ff0	! t1_kref+0x345c:   	prefetch	%i1 - 0x10, 23
	.word	0xe6270018	! t1_kref+0x3460:   	st	%l3, [%i4 + %i0]
	.word	0xc12e6014	! t1_kref+0x3464:   	st	%fsr, [%i1 + 0x14]
	.word	0xf19e6013	! t1_kref+0x3468:   	ldda	[%i1 + 0x13]%asi, %f24
	.word	0x95b00fc0	! t1_kref+0x346c:   	fone	%f10
	.word	0x27480007	! t1_kref+0x3470:   	fbul,a,pt	%fcc0, _kref+0x348c
	.word	0x811cc014	! t1_kref+0x3474:   	tsubcctv	%l3, %l4, %g0
	.word	0x99a000d6	! t1_kref+0x3478:   	fnegd	%f22, %f12
	.word	0xa9b78c8e	! t1_kref+0x347c:   	fandnot2	%f30, %f14, %f20
	.word	0xdb264000	! t1_kref+0x3480:   	st	%f13, [%i1]
	.word	0xa1a0053e	! t1_kref+0x3484:   	fsqrts	%f30, %f16
	.word	0xac0cf19c	! t1_kref+0x3488:   	and	%l3, -0xe64, %l6
	.word	0xb3b74e7d	! t1_kref+0x348c:   	fxnors	%f29, %f29, %f25
	.word	0x9e1c4010	! t1_kref+0x3490:   	xor	%l1, %l0, %o7
	.word	0x96952179	! t1_kref+0x3494:   	orcc	%l4, 0x179, %o3
	.word	0xe9be3fe9	! t1_kref+0x3498:   	stda	%f20, [%i0 - 0x17]%asi
	.word	0x95b784ca	! t1_kref+0x349c:   	fcmpne32	%f30, %f10, %o2
	.word	0x905c4014	! t1_kref+0x34a0:   	smul	%l1, %l4, %o0
	.word	0x988c3f8c	! t1_kref+0x34a4:   	andcc	%l0, -0x74, %o4
	.word	0xe47f0019	! t1_kref+0x34a8:   	swap	[%i4 + %i1], %l2
	.word	0xa5a30d39	! t1_kref+0x34ac:   	fsmuld	%f12, %f25, %f18
	.word	0xafa4c9b4	! t1_kref+0x34b0:   	fdivs	%f19, %f20, %f23
	.word	0xe6270019	! t1_kref+0x34b4:   	st	%l3, [%i4 + %i1]
	.word	0xb9b60dcc	! t1_kref+0x34b8:   	fnand	%f24, %f12, %f28
	.word	0x9fc10000	! t1_kref+0x34bc:   	call	%g4
	.word	0xa9b30d9a	! t1_kref+0x34c0:   	fxor	%f12, %f26, %f20
	.word	0x9fc00004	! t1_kref+0x34c4:   	call	%g0 + %g4
	.word	0xe40e8019	! t1_kref+0x34c8:   	ldub	[%i2 + %i1], %l2
	.word	0x9de3bfa0	! t1_kref+0x34cc:   	save	%sp, -0x60, %sp
	.word	0xba56256f	! t1_kref+0x34d0:   	umul	%i0, 0x56f, %i5
	.word	0x81ef7f3a	! t1_kref+0x34d4:   	restore	%i5, -0xc6, %g0
	.word	0xe030a02c	! t1_kref+0x34d8:   	sth	%l0, [%g2 + 0x2c]
	.word	0xa1b70a90	! t1_kref+0x34dc:   	fpsub16	%f28, %f16, %f16
	.word	0xae650014	! t1_kref+0x34e0:   	subc	%l4, %l4, %l7
	.word	0xa6542a28	! t1_kref+0x34e4:   	umul	%l0, 0xa28, %l3
	.word	0x808c4012	! t1_kref+0x34e8:   	btst	%l2, %l1
	.word	0xb5a00558	! t1_kref+0x34ec:   	fsqrtd	%f24, %f26
	.word	0xe4086918	! t1_kref+0x34f0:   	ldub	[%g1 + 0x918], %l2
	.word	0xa41ca00c	! t1_kref+0x34f4:   	xor	%l2, 0xc, %l2
	.word	0xe4286918	! t1_kref+0x34f8:   	stb	%l2, [%g1 + 0x918]
	.word	0x81d86918	! t1_kref+0x34fc:   	flush	%g1 + 0x918
	.word	0x81dd2e4b	! t1_kref+0x3500:   	flush	%l4 + 0xe4b
	.word	0x81ad0ad6	! t1_kref+0x3504:   	fcmped	%fcc0, %f20, %f22
	.word	0x9db40e50	! t1_kref+0x3508:   	fxnor	%f16, %f16, %f14
	.word	0x9aacbc5f	! t1_kref+0x350c:   	andncc	%l2, -0x3a1, %o5
2:	.word	0xe82e4000	! t1_kref+0x3510:   	stb	%l4, [%i1]
	.word	0x92fcf90e	! t1_kref+0x3514:   	sdivcc	%l3, -0x6f2, %o1
	.word	0x81ab8ad6	! t1_kref+0x3518:   	fcmped	%fcc0, %f14, %f22
	.word	0x80a44013	! t1_kref+0x351c:   	cmp	%l1, %l3
	.word	0xd896d019	! t1_kref+0x3520:   	lduha	[%i3 + %i1]0x80, %o4
	.word	0x94f52f40	! t1_kref+0x3524:   	udivcc	%l4, 0xf40, %o2
	.word	0xf120a03c	! t1_kref+0x3528:   	st	%f24, [%g2 + 0x3c]
	.word	0xe620a034	! t1_kref+0x352c:   	st	%l3, [%g2 + 0x34]
	.word	0x962c0013	! t1_kref+0x3530:   	andn	%l0, %l3, %o3
	.word	0x86102002	! t1_kref+0x3534:   	mov	0x2, %g3
	.word	0x32800000	! t1_kref+0x3538:   	bne,a	_kref+0x3538
	.word	0x86a0e001	! t1_kref+0x353c:   	subcc	%g3, 1, %g3
	.word	0x8143c000	! t1_kref+0x3540:   	stbar
	.word	0x961c6c9d	! t1_kref+0x3544:   	xor	%l1, 0xc9d, %o3
	.word	0xb1a00533	! t1_kref+0x3548:   	fsqrts	%f19, %f24
	.word	0x97b50051	! t1_kref+0x354c:   	edge8l	%l4, %l1, %o3
	.word	0xa8a50011	! t1_kref+0x3550:   	subcc	%l4, %l1, %l4
	.word	0x90bc32f4	! t1_kref+0x3554:   	xnorcc	%l0, -0xd0c, %o0
	.word	0xa09cc011	! t1_kref+0x3558:   	xorcc	%l3, %l1, %l0
	.word	0xf99eda18	! t1_kref+0x355c:   	ldda	[%i3 + %i0]0xd0, %f28
	.word	0xdd1fbcc0	! t1_kref+0x3560:   	ldd	[%fp - 0x340], %f14
	.word	0x99a0053c	! t1_kref+0x3564:   	fsqrts	%f28, %f12
	.word	0xa9a000d8	! t1_kref+0x3568:   	fnegd	%f24, %f20
	.word	0x9db306da	! t1_kref+0x356c:   	fmul8sux16	%f12, %f26, %f14
	.word	0xf9be5a1c	! t1_kref+0x3570:   	stda	%f28, [%i1 + %i4]0xd0
	.word	0x39480002	! t1_kref+0x3574:   	fbuge,a,pt	%fcc0, _kref+0x357c
	.word	0xe820a034	! t1_kref+0x3578:   	st	%l4, [%g2 + 0x34]
	.word	0xa9b44240	! t1_kref+0x357c:   	array16	%l1, %g0, %l4
	.word	0x98947680	! t1_kref+0x3580:   	orcc	%l1, -0x980, %o4
	.word	0xe4560000	! t1_kref+0x3584:   	ldsh	[%i0], %l2
	.word	0xc9ee1012	! t1_kref+0x3588:   	prefetcha	%i0 + %l2, 4
	.word	0x94f40013	! t1_kref+0x358c:   	udivcc	%l0, %l3, %o2
	.word	0x99a00538	! t1_kref+0x3590:   	fsqrts	%f24, %f12
	.word	0xa3146c93	! t1_kref+0x3594:   	taddcctv	%l1, 0xc93, %l1
	.word	0x81580000	! t1_kref+0x3598:   	flushw
	.word	0xe22e7ffa	! t1_kref+0x359c:   	stb	%l1, [%i1 - 6]
	.word	0xef267ff0	! t1_kref+0x35a0:   	st	%f23, [%i1 - 0x10]
	.word	0xab702efe	! t1_kref+0x35a4:   	popc	0xefe, %l5
	.word	0xb3a308b4	! t1_kref+0x35a8:   	fsubs	%f12, %f20, %f25
	.word	0xa9b44280	! t1_kref+0x35ac:   	array32	%l1, %g0, %l4
	.word	0x21480007	! t1_kref+0x35b0:   	fbn,a,pt	%fcc0, _kref+0x35cc
	.word	0xa1a50d30	! t1_kref+0x35b4:   	fsmuld	%f20, %f16, %f16
	.word	0xa0e46596	! t1_kref+0x35b8:   	subccc	%l1, 0x596, %l0
	.word	0x9740c000	! t1_kref+0x35bc:   	mov	%asi, %o3
	.word	0x985c2c7b	! t1_kref+0x35c0:   	smul	%l0, 0xc7b, %o4
	.word	0xa1b00c00	! t1_kref+0x35c4:   	fzero	%f16
	.word	0xd8462014	! t1_kref+0x35c8:   	ldsw	[%i0 + 0x14], %o4
	.word	0x112928c4	! t1_kref+0x35cc:   	sethi	%hi(0xa4a31000), %o0
	.word	0xe630a016	! t1_kref+0x35d0:   	sth	%l3, [%g2 + 0x16]
	.word	0x9fc00004	! t1_kref+0x35d4:   	call	%g0 + %g4
	.word	0xa5a6cd2d	! t1_kref+0x35d8:   	fsmuld	%f27, %f13, %f18
	.word	0xb9a389da	! t1_kref+0x35dc:   	fdivd	%f14, %f26, %f28
	.word	0x9ba30939	! t1_kref+0x35e0:   	fmuls	%f12, %f25, %f13
	.word	0xa4c4c013	! t1_kref+0x35e4:   	addccc	%l3, %l3, %l2
	.word	0xa2250011	! t1_kref+0x35e8:   	sub	%l4, %l1, %l1
	.word	0xe84e601f	! t1_kref+0x35ec:   	ldsb	[%i1 + 0x1f], %l4
	.word	0x81844000	! t1_kref+0x35f0:   	wr	%l1, %g0, %y
	.word	0xa9a00552	! t1_kref+0x35f4:   	fsqrtd	%f18, %f20
	.word	0xd81e2000	! t1_kref+0x35f8:   	ldd	[%i0], %o4
	.word	0x2f800008	! t1_kref+0x35fc:   	fbu,a	_kref+0x361c
	.word	0x94548014	! t1_kref+0x3600:   	umul	%l2, %l4, %o2
	.word	0xb3a00538	! t1_kref+0x3604:   	fsqrts	%f24, %f25
	.word	0x97400000	! t1_kref+0x3608:   	mov	%y, %o3
	.word	0xac5d2936	! t1_kref+0x360c:   	smul	%l4, 0x936, %l6
	.word	0xa675326c	! t1_kref+0x3610:   	udiv	%l4, -0xd94, %l3
	.word	0x9634a0e1	! t1_kref+0x3614:   	orn	%l2, 0xe1, %o3
	.word	0xf120a00c	! t1_kref+0x3618:   	st	%f24, [%g2 + 0xc]
	.word	0x9db4090e	! t1_kref+0x361c:   	faligndata	%f16, %f14, %f14
	.word	0x96850012	! t1_kref+0x3620:   	addcc	%l4, %l2, %o3
	.word	0x9de3bfa0	! t1_kref+0x3624:   	save	%sp, -0x60, %sp
	.word	0xb6966928	! t1_kref+0x3628:   	orcc	%i1, 0x928, %i3
	.word	0x91ee0018	! t1_kref+0x362c:   	restore	%i0, %i0, %o0
	.word	0x942d3d40	! t1_kref+0x3630:   	andn	%l4, -0x2c0, %o2
	.word	0x20800003	! t1_kref+0x3634:   	bn,a	_kref+0x3640
	.word	0xabb4c132	! t1_kref+0x3638:   	edge32n	%l3, %l2, %l5
	.word	0xa5a00132	! t1_kref+0x363c:   	fabss	%f18, %f18
	.word	0x97a388bd	! t1_kref+0x3640:   	fsubs	%f14, %f29, %f11
	.word	0x8054c014	! t1_kref+0x3644:   	umul	%l3, %l4, %g0
	.word	0xb5b506ab	! t1_kref+0x3648:   	fmul8x16al	%f20, %f11, %f26
	.word	0xa8fd0010	! t1_kref+0x364c:   	sdivcc	%l4, %l0, %l4
	.word	0xe4965000	! t1_kref+0x3650:   	lduha	[%i1]0x80, %l2
	.word	0x3a480001	! t1_kref+0x3654:   	bcc,a,pt	%icc, _kref+0x3658
	.word	0x985c6a8e	! t1_kref+0x3658:   	smul	%l1, 0xa8e, %o4
	.word	0xb5a688bb	! t1_kref+0x365c:   	fsubs	%f26, %f27, %f26
	.word	0xab244014	! t1_kref+0x3660:   	mulscc	%l1, %l4, %l5
	.word	0xe228a03c	! t1_kref+0x3664:   	stb	%l1, [%g2 + 0x3c]
	.word	0x9b3d2002	! t1_kref+0x3668:   	sra	%l4, 0x2, %o5
	.word	0xa5a01914	! t1_kref+0x366c:   	fitod	%f20, %f18
	sethi	%hi(2f), %o7
	.word	0xe40be29c	! t1_kref+0x3674:   	ldub	[%o7 + 0x29c], %l2
	.word	0xa41ca00c	! t1_kref+0x3678:   	xor	%l2, 0xc, %l2
	.word	0xe42be29c	! t1_kref+0x367c:   	stb	%l2, [%o7 + 0x29c]
	.word	0x81dbe29c	! t1_kref+0x3680:   	flush	%o7 + 0x29c
	.word	0xae540011	! t1_kref+0x3684:   	umul	%l0, %l1, %l7
	.word	0x8143c000	! t1_kref+0x3688:   	stbar
	.word	0x991c0012	! t1_kref+0x368c:   	tsubcctv	%l0, %l2, %o4
	.word	0x81aaca35	! t1_kref+0x3690:   	fcmps	%fcc0, %f11, %f21
	.word	0xea070019	! t1_kref+0x3694:   	ld	[%i4 + %i1], %l5
	.word	0xa4f48013	! t1_kref+0x3698:   	udivcc	%l2, %l3, %l2
2:	.word	0xadb4463a	! t1_kref+0x369c:   	fmul8x16	%f17, %f26, %f22
	.word	0x8143e040	! t1_kref+0x36a0:   	membar	0x40
	.word	0x81ab0a3e	! t1_kref+0x36a4:   	fcmps	%fcc0, %f12, %f30
	.word	0xaef47512	! t1_kref+0x36a8:   	udivcc	%l1, -0xaee, %l7
	.word	0xb5a28958	! t1_kref+0x36ac:   	fmuld	%f10, %f24, %f26
	.word	0x81ad8ad2	! t1_kref+0x36b0:   	fcmped	%fcc0, %f22, %f18
	.word	0xac248014	! t1_kref+0x36b4:   	sub	%l2, %l4, %l6
	.word	0x81848000	! t1_kref+0x36b8:   	wr	%l2, %g0, %y
	.word	0xb9a0111a	! t1_kref+0x36bc:   	fxtod	%f26, %f28
	.word	0x81af8ab4	! t1_kref+0x36c0:   	fcmpes	%fcc0, %f30, %f20
	.word	0x1317feec	! t1_kref+0x36c4:   	sethi	%hi(0x5ffbb000), %o1
	.word	0xec100019	! t1_kref+0x36c8:   	lduh	[%g0 + %i1], %l6
	.word	0x001fffff	! t1_kref+0x36cc:   	illtrap	0x1fffff
	.word	0xe67f0019	! t1_kref+0x36d0:   	swap	[%i4 + %i1], %l3
	.word	0x9fa788b2	! t1_kref+0x36d4:   	fsubs	%f30, %f18, %f15
	.word	0xa1b2849a	! t1_kref+0x36d8:   	fcmple32	%f10, %f26, %l0
	.word	0x81ad0ace	! t1_kref+0x36dc:   	fcmped	%fcc0, %f20, %f14
	.word	0x969d251f	! t1_kref+0x36e0:   	xorcc	%l4, 0x51f, %o3
	.word	0xa1140014	! t1_kref+0x36e4:   	taddcctv	%l0, %l4, %l0
	.word	0xa9b30756	! t1_kref+0x36e8:   	fpack32	%f12, %f22, %f20
	.word	0xa9b48240	! t1_kref+0x36ec:   	array16	%l2, %g0, %l4
	.word	0xf520a02c	! t1_kref+0x36f0:   	st	%f26, [%g2 + 0x2c]
	.word	0xf1070018	! t1_kref+0x36f4:   	ld	[%i4 + %i0], %f24
	.word	0xb7a00131	! t1_kref+0x36f8:   	fabss	%f17, %f27
	.word	0x93b48094	! t1_kref+0x36fc:   	edge16	%l2, %l4, %o1
	.word	0x96c46964	! t1_kref+0x3700:   	addccc	%l1, 0x964, %o3
	.word	0xa1a0111a	! t1_kref+0x3704:   	fxtod	%f26, %f16
	.word	0xd67f0018	! t1_kref+0x3708:   	swap	[%i4 + %i0], %o3
	.word	0x905cc013	! t1_kref+0x370c:   	smul	%l3, %l3, %o0
	.word	0x9e84c011	! t1_kref+0x3710:   	addcc	%l3, %l1, %o7
	.word	0xe4086b34	! t1_kref+0x3714:   	ldub	[%g1 + 0xb34], %l2
	.word	0xa41ca00c	! t1_kref+0x3718:   	xor	%l2, 0xc, %l2
	.word	0xe4286b34	! t1_kref+0x371c:   	stb	%l2, [%g1 + 0xb34]
	.word	0x81d86b34	! t1_kref+0x3720:   	flush	%g1 + 0xb34
	.word	0xa1a44d2c	! t1_kref+0x3724:   	fsmuld	%f17, %f12, %f16
	.word	0x81db8016	! t1_kref+0x3728:   	flush	%sp + %l6
2:	.word	0xa8fc8011	! t1_kref+0x372c:   	sdivcc	%l2, %l1, %l4
	.word	0x943c79f0	! t1_kref+0x3730:   	xnor	%l1, -0x610, %o2
	.word	0x9f70311c	! t1_kref+0x3734:   	popc	-0xee4, %o7
	.word	0x91b5858e	! t1_kref+0x3738:   	fcmpgt32	%f22, %f14, %o0
	.word	0xada3892e	! t1_kref+0x373c:   	fmuls	%f14, %f14, %f22
	.word	0xa9b28c8c	! t1_kref+0x3740:   	fandnot2	%f10, %f12, %f20
	.word	0xa0ac3359	! t1_kref+0x3744:   	andncc	%l0, -0xca7, %l0
	.word	0xd0180019	! t1_kref+0x3748:   	ldd	[%g0 + %i1], %o0
	.word	0xe46e0000	! t1_kref+0x374c:   	ldstub	[%i0], %l2
	.word	0xed380019	! t1_kref+0x3750:   	std	%f22, [%g0 + %i1]
	.word	0x8161a45d	! t1_kref+0x3754:   	movg	%fcc0, -0x3a3, %g0
	.word	0xe030a026	! t1_kref+0x3758:   	sth	%l0, [%g2 + 0x26]
	.word	0x33480001	! t1_kref+0x375c:   	fbe,a,pt	%fcc0, _kref+0x3760
	.word	0xa4a4c014	! t1_kref+0x3760:   	subcc	%l3, %l4, %l2
	.word	0xaae5239e	! t1_kref+0x3764:   	subccc	%l4, 0x39e, %l5
	.word	0xec180019	! t1_kref+0x3768:   	ldd	[%g0 + %i1], %l6
	.word	0xd9270018	! t1_kref+0x376c:   	st	%f12, [%i4 + %i0]
	.word	0x99a30956	! t1_kref+0x3770:   	fmuld	%f12, %f22, %f12
	.word	0xd91fbd98	! t1_kref+0x3774:   	ldd	[%fp - 0x268], %f12
	sethi	%hi(2f), %o7
	.word	0xe40be3bc	! t1_kref+0x377c:   	ldub	[%o7 + 0x3bc], %l2
	.word	0xa41ca00c	! t1_kref+0x3780:   	xor	%l2, 0xc, %l2
	.word	0xe42be3bc	! t1_kref+0x3784:   	stb	%l2, [%o7 + 0x3bc]
	.word	0x81dbe3bc	! t1_kref+0x3788:   	flush	%o7 + 0x3bc
	.word	0x95a01056	! t1_kref+0x378c:   	fdtox	%f22, %f10
	.word	0xb5a0052f	! t1_kref+0x3790:   	fsqrts	%f15, %f26
	.word	0x965c4014	! t1_kref+0x3794:   	smul	%l1, %l4, %o3
	.word	0xd050a006	! t1_kref+0x3798:   	ldsh	[%g2 + 6], %o0
	.word	0xd67e0000	! t1_kref+0x379c:   	swap	[%i0], %o3
	.word	0xa6e4245f	! t1_kref+0x37a0:   	subccc	%l0, 0x45f, %l3
	.word	0x95a6885a	! t1_kref+0x37a4:   	faddd	%f26, %f26, %f10
	.word	0xa1418000	! t1_kref+0x37a8:   	mov	%fprs, %l0
	.word	0x9e0c2b7c	! t1_kref+0x37ac:   	and	%l0, 0xb7c, %o7
	.word	0xe86e8019	! t1_kref+0x37b0:   	ldstub	[%i2 + %i1], %l4
	.word	0xd9e61010	! t1_kref+0x37b4:   	casa	[%i0]0x80, %l0, %o4
	.word	0x91b4849a	! t1_kref+0x37b8:   	fcmple32	%f18, %f26, %o0
2:	.word	0x9db48a0c	! t1_kref+0x37bc:   	fpadd16	%f18, %f12, %f14
	.word	0x3f480006	! t1_kref+0x37c0:   	fbo,a,pt	%fcc0, _kref+0x37d8
	.word	0x96342918	! t1_kref+0x37c4:   	orn	%l0, 0x918, %o3
	.word	0xf120a014	! t1_kref+0x37c8:   	st	%f24, [%g2 + 0x14]
	.word	0x96a4ebb3	! t1_kref+0x37cc:   	subcc	%l3, 0xbb3, %o3
	.word	0x9e44c010	! t1_kref+0x37d0:   	addc	%l3, %l0, %o7
	.word	0x81ae4ab5	! t1_kref+0x37d4:   	fcmpes	%fcc0, %f25, %f21
	.word	0xa0142521	! t1_kref+0x37d8:   	or	%l0, 0x521, %l0
	.word	0xa5700014	! t1_kref+0x37dc:   	popc	%l4, %l2
	.word	0x9fc00004	! t1_kref+0x37e0:   	call	%g0 + %g4
	.word	0xa1a58954	! t1_kref+0x37e4:   	fmuld	%f22, %f20, %f16
	.word	0xd896d018	! t1_kref+0x37e8:   	lduha	[%i3 + %i0]0x80, %o4
	.word	0x81dcb01e	! t1_kref+0x37ec:   	flush	%l2 - 0xfe2
	.word	0x81ab8ab1	! t1_kref+0x37f0:   	fcmpes	%fcc0, %f14, %f17
	.word	0xa48c4013	! t1_kref+0x37f4:   	andcc	%l1, %l3, %l2
	.word	0x97a0003a	! t1_kref+0x37f8:   	fmovs	%f26, %f11
	.word	0xa5a70d39	! t1_kref+0x37fc:   	fsmuld	%f28, %f25, %f18
	.word	0xd6ce1000	! t1_kref+0x3800:   	ldsba	[%i0]0x80, %o3
	.word	0xee780018	! t1_kref+0x3804:   	swap	[%g0 + %i0], %l7
	.word	0xa9a0013e	! t1_kref+0x3808:   	fabss	%f30, %f20
	.word	0x39480003	! t1_kref+0x380c:   	fbuge,a,pt	%fcc0, _kref+0x3818
	.word	0xa4853f25	! t1_kref+0x3810:   	addcc	%l4, -0xdb, %l2
	.word	0xe426001c	! t1_kref+0x3814:   	st	%l2, [%i0 + %i4]
	.word	0xa3a00537	! t1_kref+0x3818:   	fsqrts	%f23, %f17
	.word	0x95b484cc	! t1_kref+0x381c:   	fcmpne32	%f18, %f12, %o2
	.word	0x99b50a10	! t1_kref+0x3820:   	fpadd16	%f20, %f16, %f12
	.word	0x81ae0a5a	! t1_kref+0x3824:   	fcmpd	%fcc0, %f24, %f26
	.word	0xd7e61013	! t1_kref+0x3828:   	casa	[%i0]0x80, %l3, %o3
	.word	0x9244a260	! t1_kref+0x382c:   	addc	%l2, 0x260, %o1
	.word	0xaef4edaa	! t1_kref+0x3830:   	udivcc	%l3, 0xdaa, %l7
	.word	0x86102004	! t1_kref+0x3834:   	mov	0x4, %g3
	.word	0x32800000	! t1_kref+0x3838:   	bne,a	_kref+0x3838
	.word	0x86a0e001	! t1_kref+0x383c:   	subcc	%g3, 1, %g3
	.word	0x80dc0010	! t1_kref+0x3840:   	smulcc	%l0, %l0, %g0
	.word	0xec1e0000	! t1_kref+0x3844:   	ldd	[%i0], %l6
	.word	0xafa6893e	! t1_kref+0x3848:   	fmuls	%f26, %f30, %f23
	.word	0x9f0c4012	! t1_kref+0x384c:   	tsubcc	%l1, %l2, %o7
	.word	0xd4562018	! t1_kref+0x3850:   	ldsh	[%i0 + 0x18], %o2
	.word	0x992c201c	! t1_kref+0x3854:   	sll	%l0, 0x1c, %o4
	.word	0xa5b386be	! t1_kref+0x3858:   	fmul8x16al	%f14, %f30, %f18
	.word	0xe0200019	! t1_kref+0x385c:   	st	%l0, [%g0 + %i1]
	.word	0xeee81019	! t1_kref+0x3860:   	ldstuba	[%g0 + %i1]0x80, %l7
	.word	0x94e40010	! t1_kref+0x3864:   	subccc	%l0, %l0, %o2
	.word	0x9da648b4	! t1_kref+0x3868:   	fsubs	%f25, %f20, %f14
	.word	0xb1a70856	! t1_kref+0x386c:   	faddd	%f28, %f22, %f24
	.word	0xe9b81018	! t1_kref+0x3870:   	stda	%f20, [%g0 + %i0]0x80
	.word	0xa9b30596	! t1_kref+0x3874:   	fcmpgt32	%f12, %f22, %l4
	.word	0xa13c6007	! t1_kref+0x3878:   	sra	%l1, 0x7, %l0
	.word	0x3d480002	! t1_kref+0x387c:   	fbule,a,pt	%fcc0, _kref+0x3884
	.word	0xa9a5cd36	! t1_kref+0x3880:   	fsmuld	%f23, %f22, %f20
	.word	0xa3a94034	! t1_kref+0x3884:   	fmovsug	%fcc0, %f20, %f17
	.word	0x803ca846	! t1_kref+0x3888:   	xnor	%l2, 0x846, %g0
	.word	0x90052596	! t1_kref+0x388c:   	add	%l4, 0x596, %o0
	.word	0xa4f40013	! t1_kref+0x3890:   	udivcc	%l0, %l3, %l2
	.word	0x9de3bfa0	! t1_kref+0x3894:   	save	%sp, -0x60, %sp
	.word	0xb0667423	! t1_kref+0x3898:   	subc	%i1, -0xbdd, %i0
	.word	0xafeec018	! t1_kref+0x389c:   	restore	%i3, %i0, %l7
	.word	0xa62ce4dc	! t1_kref+0x38a0:   	andn	%l3, 0x4dc, %l3
	.word	0xa82c0010	! t1_kref+0x38a4:   	andn	%l0, %l0, %l4
	.word	0x9fb48053	! t1_kref+0x38a8:   	edge8l	%l2, %l3, %o7
	.word	0x98444014	! t1_kref+0x38ac:   	addc	%l1, %l4, %o4
	.word	0xfd260000	! t1_kref+0x38b0:   	st	%f30, [%i0]
	.word	0xed06200c	! t1_kref+0x38b4:   	ld	[%i0 + 0xc], %f22
	.word	0xe028a02d	! t1_kref+0x38b8:   	stb	%l0, [%g2 + 0x2d]
	.word	0x9f34200e	! t1_kref+0x38bc:   	srl	%l0, 0xe, %o7
	.word	0xf11fbd48	! t1_kref+0x38c0:   	ldd	[%fp - 0x2b8], %f24
	.word	0x91400000	! t1_kref+0x38c4:   	mov	%y, %o0
	.word	0xe9bf5a58	! t1_kref+0x38c8:   	stda	%f20, [%i5 + %i0]0xd2
	.word	0xb1b407d2	! t1_kref+0x38cc:   	pdist	%f16, %f18, %f24
	.word	0xe3263ff8	! t1_kref+0x38d0:   	st	%f17, [%i0 - 8]
	.word	0xb9a00531	! t1_kref+0x38d4:   	fsqrts	%f17, %f28
	.word	0xe4086cfc	! t1_kref+0x38d8:   	ldub	[%g1 + 0xcfc], %l2
	.word	0xa41ca00c	! t1_kref+0x38dc:   	xor	%l2, 0xc, %l2
	.word	0xe4286cfc	! t1_kref+0x38e0:   	stb	%l2, [%g1 + 0xcfc]
	.word	0x81d86cfc	! t1_kref+0x38e4:   	flush	%g1 + 0xcfc
	.word	0xd6d6d040	! t1_kref+0x38e8:   	ldsha	[%i3]0x82, %o3
	.word	0x31800006	! t1_kref+0x38ec:   	fba,a	_kref+0x3904
	.word	0xa5b50f7d	! t1_kref+0x38f0:   	fornot1s	%f20, %f29, %f18
2:	.word	0xe02e0000	! t1_kref+0x38f4:   	stb	%l0, [%i0]
	.word	0xe020a004	! t1_kref+0x38f8:   	st	%l0, [%g2 + 4]
	.word	0xd2166018	! t1_kref+0x38fc:   	lduh	[%i1 + 0x18], %o1
	.word	0x9e14f1ce	! t1_kref+0x3900:   	or	%l3, -0xe32, %o7
	.word	0x95b4c154	! t1_kref+0x3904:   	edge32l	%l3, %l4, %o2
	.word	0xada00552	! t1_kref+0x3908:   	fsqrtd	%f18, %f22
	.word	0x92f426c0	! t1_kref+0x390c:   	udivcc	%l0, 0x6c0, %o1
	.word	0x809d0010	! t1_kref+0x3910:   	xorcc	%l4, %l0, %g0
	.word	0xa7b44092	! t1_kref+0x3914:   	edge16	%l1, %l2, %l3
	.word	0x97b480f2	! t1_kref+0x3918:   	edge16ln	%l2, %l2, %o3
	.word	0x81b01026	! t1_kref+0x391c:   	siam	0x6
	.word	0xe2f75019	! t1_kref+0x3920:   	stxa	%l1, [%i5 + %i1]0x80
	.word	0x81ad4ab5	! t1_kref+0x3924:   	fcmpes	%fcc0, %f21, %f21
	.word	0xa69c7eab	! t1_kref+0x3928:   	xorcc	%l1, -0x155, %l3
	.word	0x900d289d	! t1_kref+0x392c:   	and	%l4, 0x89d, %o0
	.word	0xb1a40d3e	! t1_kref+0x3930:   	fsmuld	%f16, %f30, %f24
	.word	0x962c3892	! t1_kref+0x3934:   	andn	%l0, -0x76e, %o3
	.word	0x94a44012	! t1_kref+0x3938:   	subcc	%l1, %l2, %o2
	.word	0xf9b81018	! t1_kref+0x393c:   	stda	%f28, [%g0 + %i0]0x80
	.word	0xe0566002	! t1_kref+0x3940:   	ldsh	[%i1 + 2], %l0
	.word	0x9fc10000	! t1_kref+0x3944:   	call	%g4
	.word	0x9db50a98	! t1_kref+0x3948:   	fpsub16	%f20, %f24, %f14
	.word	0x80944011	! t1_kref+0x394c:   	orcc	%l1, %l1, %g0
	.word	0xa0550011	! t1_kref+0x3950:   	umul	%l4, %l1, %l0
	.word	0xa13c4010	! t1_kref+0x3954:   	sra	%l1, %l0, %l0
	.word	0xa5a0190c	! t1_kref+0x3958:   	fitod	%f12, %f18
	.word	0xaee4ff1e	! t1_kref+0x395c:   	subccc	%l3, -0xe2, %l7
	.word	0x86102020	! t1_kref+0x3960:   	mov	0x20, %g3
	.word	0x86a0e001	! t1_kref+0x3964:   	subcc	%g3, 1, %g3
	.word	0x22800015	! t1_kref+0x3968:   	be,a	_kref+0x39bc
	.word	0xefee101a	! t1_kref+0x396c:   	prefetcha	%i0 + %i2, 23
	.word	0x9014c014	! t1_kref+0x3970:   	or	%l3, %l4, %o0
	.word	0xaec48011	! t1_kref+0x3974:   	addccc	%l2, %l1, %l7
	.word	0xe828a016	! t1_kref+0x3978:   	stb	%l4, [%g2 + 0x16]
	.word	0xb5a0055c	! t1_kref+0x397c:   	fsqrtd	%f28, %f26
	.word	0x962cc011	! t1_kref+0x3980:   	andn	%l3, %l1, %o3
	.word	0xb3a0052c	! t1_kref+0x3984:   	fsqrts	%f12, %f25
	.word	0xac8c0013	! t1_kref+0x3988:   	andcc	%l0, %l3, %l6
	.word	0xada54d32	! t1_kref+0x398c:   	fsmuld	%f21, %f18, %f22
	.word	0x923d2549	! t1_kref+0x3990:   	xnor	%l4, 0x549, %o1
	.word	0xaf3cc014	! t1_kref+0x3994:   	sra	%l3, %l4, %l7
	.word	0xe6901019	! t1_kref+0x3998:   	lduha	[%g0 + %i1]0x80, %l3
	.word	0xdb20a014	! t1_kref+0x399c:   	st	%f13, [%g2 + 0x14]
	.word	0xa3b404d8	! t1_kref+0x39a0:   	fcmpne32	%f16, %f24, %l1
	.word	0x960c4014	! t1_kref+0x39a4:   	and	%l1, %l4, %o3
	.word	0xb1b6cafc	! t1_kref+0x39a8:   	fpsub32s	%f27, %f28, %f24
	.word	0xe11e6000	! t1_kref+0x39ac:   	ldd	[%i1], %f16
	.word	0xabb40014	! t1_kref+0x39b0:   	edge8	%l0, %l4, %l5
	.word	0xaaf534f0	! t1_kref+0x39b4:   	udivcc	%l4, -0xb10, %l5
	.word	0x80c40014	! t1_kref+0x39b8:   	addccc	%l0, %l4, %g0
	.word	0x80bc8013	! t1_kref+0x39bc:   	xnorcc	%l2, %l3, %g0
	.word	0x3f800006	! t1_kref+0x39c0:   	fbo,a	_kref+0x39d8
	.word	0xadb40a8c	! t1_kref+0x39c4:   	fpsub16	%f16, %f12, %f22
	.word	0xbda4895c	! t1_kref+0x39c8:   	fmuld	%f18, %f28, %f30
	.word	0x81dcbb49	! t1_kref+0x39cc:   	flush	%l2 - 0x4b7
	.word	0x9054c013	! t1_kref+0x39d0:   	umul	%l3, %l3, %o0
	.word	0xd01e2008	! t1_kref+0x39d4:   	ldd	[%i0 + 8], %o0
	.word	0xb7a01894	! t1_kref+0x39d8:   	fitos	%f20, %f27
	.word	0xb5a00552	! t1_kref+0x39dc:   	fsqrtd	%f18, %f26
	.word	0xd7266014	! t1_kref+0x39e0:   	st	%f11, [%i1 + 0x14]
	.word	0xe6901019	! t1_kref+0x39e4:   	lduha	[%g0 + %i1]0x80, %l3
	.word	0xbdb00cfc	! t1_kref+0x39e8:   	fnot2s	%f28, %f30
	.word	0xae548012	! t1_kref+0x39ec:   	umul	%l2, %l2, %l7
	.word	0x804437a0	! t1_kref+0x39f0:   	addc	%l0, -0x860, %g0
	.word	0x8143c000	! t1_kref+0x39f4:   	stbar
	.word	0xe3270019	! t1_kref+0x39f8:   	st	%f17, [%i4 + %i1]
	.word	0xec1e7ff8	! t1_kref+0x39fc:   	ldd	[%i1 - 8], %l6
	.word	0xaac43252	! t1_kref+0x3a00:   	addccc	%l0, -0xdae, %l5
	.word	0x81b01025	! t1_kref+0x3a04:   	siam	0x5
	.word	0x81aacab9	! t1_kref+0x3a08:   	fcmpes	%fcc0, %f11, %f25
	.word	0x85848010	! t1_kref+0x3a0c:   	wr	%l2, %l0, %ccr
	.word	0x81af8a3d	! t1_kref+0x3a10:   	fcmps	%fcc0, %f30, %f29
	.word	0x92c53c90	! t1_kref+0x3a14:   	addccc	%l4, -0x370, %o1
	.word	0x99b38dd4	! t1_kref+0x3a18:   	fnand	%f14, %f20, %f12
	.word	0xec6e001a	! t1_kref+0x3a1c:   	ldstub	[%i0 + %i2], %l6
	.word	0x80ac7d35	! t1_kref+0x3a20:   	andncc	%l1, -0x2cb, %g0
	.word	0xb9a60d30	! t1_kref+0x3a24:   	fsmuld	%f24, %f16, %f28
	.word	0xa9400000	! t1_kref+0x3a28:   	mov	%y, %l4
	.word	0x81ac8a35	! t1_kref+0x3a2c:   	fcmps	%fcc0, %f18, %f21
	.word	0xa1a448ac	! t1_kref+0x3a30:   	fsubs	%f17, %f12, %f16
	.word	0x9f414000	! t1_kref+0x3a34:   	mov	%pc, %o7
	.word	0xd9be7ff8	! t1_kref+0x3a38:   	stda	%f12, [%i1 - 8]%asi
	.word	0x81ad0a5e	! t1_kref+0x3a3c:   	fcmpd	%fcc0, %f20, %f30
	.word	0xe87e3ff0	! t1_kref+0x3a40:   	swap	[%i0 - 0x10], %l4
	.word	0xa8448011	! t1_kref+0x3a44:   	addc	%l2, %l1, %l4
	.word	0x878020d0	! t1_kref+0x3a48:   	mov	0xd0, %asi
	.word	0xf11fbf10	! t1_kref+0x3a4c:   	ldd	[%fp - 0xf0], %f24
	.word	0x2e800008	! t1_kref+0x3a50:   	bvs,a	_kref+0x3a70
	.word	0xac348013	! t1_kref+0x3a54:   	orn	%l2, %l3, %l6
	.word	0xd720a02c	! t1_kref+0x3a58:   	st	%f11, [%g2 + 0x2c]
	.word	0xf207bfe0	! t1_kref+0x3a5c:   	ld	[%fp - 0x20], %i1
	.word	0x29800004	! t1_kref+0x3a60:   	fbl,a	_kref+0x3a70
	.word	0xb5b44a3a	! t1_kref+0x3a64:   	fpadd16s	%f17, %f26, %f26
	.word	0xb1b00fc0	! t1_kref+0x3a68:   	fone	%f24
	.word	0x99b50200	! t1_kref+0x3a6c:   	array8	%l4, %g0, %o4
	.word	0x81844000	! t1_kref+0x3a70:   	wr	%l1, %g0, %y
	.word	0xd81f4019	! t1_kref+0x3a74:   	ldd	[%i5 + %i1], %o4
	.word	0xe7200018	! t1_kref+0x3a78:   	st	%f19, [%g0 + %i0]
	.word	0x9b0c0011	! t1_kref+0x3a7c:   	tsubcc	%l0, %l1, %o5
	.word	0xbda4084e	! t1_kref+0x3a80:   	faddd	%f16, %f14, %f30
	.word	0xac54fb0b	! t1_kref+0x3a84:   	umul	%l3, -0x4f5, %l6
	.word	0xf1ee101a	! t1_kref+0x3a88:   	prefetcha	%i0 + %i2, 24
	.word	0xa5b58efa	! t1_kref+0x3a8c:   	fornot2s	%f22, %f26, %f18
	.word	0xe42e001a	! t1_kref+0x3a90:   	stb	%l2, [%i0 + %i2]
	.word	0xb5b00cd4	! t1_kref+0x3a94:   	fnot2	%f20, %f26
	.word	0xb5a34d30	! t1_kref+0x3a98:   	fsmuld	%f13, %f16, %f26
	.word	0xe06e001a	! t1_kref+0x3a9c:   	ldstub	[%i0 + %i2], %l0
	.word	0x95b4c134	! t1_kref+0x3aa0:   	edge32n	%l3, %l4, %o2
	.word	0x81ab0a36	! t1_kref+0x3aa4:   	fcmps	%fcc0, %f12, %f22
	.word	0x27480003	! t1_kref+0x3aa8:   	fbul,a,pt	%fcc0, _kref+0x3ab4
	.word	0x9da709ca	! t1_kref+0x3aac:   	fdivd	%f28, %f10, %f14
	.word	0xa9a308bd	! t1_kref+0x3ab0:   	fsubs	%f12, %f29, %f20
	.word	0xea16c018	! t1_kref+0x3ab4:   	lduh	[%i3 + %i0], %l5
	.word	0x3f800002	! t1_kref+0x3ab8:   	fbo,a	_kref+0x3ac0
	.word	0xa3b54afc	! t1_kref+0x3abc:   	fpsub32s	%f21, %f28, %f17
	.word	0xe5e61014	! t1_kref+0x3ac0:   	casa	[%i0]0x80, %l4, %l2
	.word	0xa3400000	! t1_kref+0x3ac4:   	mov	%y, %l1
	.word	0xe0767fe0	! t1_kref+0x3ac8:   	stx	%l0, [%i1 - 0x20]
	.word	0xde56001b	! t1_kref+0x3acc:   	ldsh	[%i0 + %i3], %o7
	.word	0x33480001	! t1_kref+0x3ad0:   	fbe,a,pt	%fcc0, _kref+0x3ad4
	.word	0xd41e4000	! t1_kref+0x3ad4:   	ldd	[%i1], %o2
	.word	0x99a00537	! t1_kref+0x3ad8:   	fsqrts	%f23, %f12
	.word	0xa074ea8d	! t1_kref+0x3adc:   	udiv	%l3, 0xa8d, %l0
	.word	0xe030a014	! t1_kref+0x3ae0:   	sth	%l0, [%g2 + 0x14]
	.word	0xa7b007b2	! t1_kref+0x3ae4:   	fpackfix	%f18, %f19
	.word	0xb5b58e5e	! t1_kref+0x3ae8:   	fxnor	%f22, %f30, %f26
	.word	0x001fffff	! t1_kref+0x3aec:   	illtrap	0x1fffff
	.word	0xf51e7fe0	! t1_kref+0x3af0:   	ldd	[%i1 - 0x20], %f26
	.word	0xd41e6018	! t1_kref+0x3af4:   	ldd	[%i1 + 0x18], %o2
	.word	0x81ab8a3a	! t1_kref+0x3af8:   	fcmps	%fcc0, %f14, %f26
	.word	0xd87e7fe4	! t1_kref+0x3afc:   	swap	[%i1 - 0x1c], %o4
	.word	0x9494c013	! t1_kref+0x3b00:   	orcc	%l3, %l3, %o2
	.word	0xc016001b	! t1_kref+0x3b04:   	lduh	[%i0 + %i3], %g0
	.word	0xb7b74dbb	! t1_kref+0x3b08:   	fxors	%f29, %f27, %f27
	.word	0x9aa422f4	! t1_kref+0x3b0c:   	subcc	%l0, 0x2f4, %o5
	.word	0xee163fe8	! t1_kref+0x3b10:   	lduh	[%i0 - 0x18], %l7
	.word	0x9b3c4011	! t1_kref+0x3b14:   	sra	%l1, %l1, %o5
	.word	0xa6a44013	! t1_kref+0x3b18:   	subcc	%l1, %l3, %l3
	.word	0x81aecaae	! t1_kref+0x3b1c:   	fcmpes	%fcc0, %f27, %f14
	.word	0xe47e600c	! t1_kref+0x3b20:   	swap	[%i1 + 0xc], %l2
	.word	0x8143c000	! t1_kref+0x3b24:   	stbar
	.word	0xa9b007b8	! t1_kref+0x3b28:   	fpackfix	%f24, %f20
	.word	0xe47f0018	! t1_kref+0x3b2c:   	swap	[%i4 + %i0], %l2
	.word	0x28800003	! t1_kref+0x3b30:   	bleu,a	_kref+0x3b3c
	.word	0xe87f0018	! t1_kref+0x3b34:   	swap	[%i4 + %i0], %l4
	.word	0xb9a00550	! t1_kref+0x3b38:   	fsqrtd	%f16, %f28
	.word	0x99b70e80	! t1_kref+0x3b3c:   	fsrc1	%f28, %f12
	.word	0xe6264000	! t1_kref+0x3b40:   	st	%l3, [%i1]
	.word	0xada709cc	! t1_kref+0x3b44:   	fdivd	%f28, %f12, %f22
	.word	0x98a44012	! t1_kref+0x3b48:   	subcc	%l1, %l2, %o4
	.word	0x3a480003	! t1_kref+0x3b4c:   	bcc,a,pt	%icc, _kref+0x3b58
	.word	0x95b440f4	! t1_kref+0x3b50:   	edge16ln	%l1, %l4, %o2
	.word	0x9524c011	! t1_kref+0x3b54:   	mulscc	%l3, %l1, %o2
	.word	0xb1b58a8e	! t1_kref+0x3b58:   	fpsub16	%f22, %f14, %f24
	.word	0x9fb48354	! t1_kref+0x3b5c:   	alignaddrl	%l2, %l4, %o7
	.word	0x81848000	! t1_kref+0x3b60:   	wr	%l2, %g0, %y
	.word	0xa9b306da	! t1_kref+0x3b64:   	fmul8sux16	%f12, %f26, %f20
	.word	0x94f4f488	! t1_kref+0x3b68:   	udivcc	%l3, -0xb78, %o2
	.word	0xa9b48034	! t1_kref+0x3b6c:   	edge8n	%l2, %l4, %l4
	.word	0xbda28852	! t1_kref+0x3b70:   	faddd	%f10, %f18, %f30
	.word	0x9e0c6489	! t1_kref+0x3b74:   	and	%l1, 0x489, %o7
	.word	0x80b47bde	! t1_kref+0x3b78:   	orncc	%l1, -0x422, %g0
	.word	0xc16e0013	! t1_kref+0x3b7c:   	prefetch	%i0 + %l3, 0
	.word	0xe7f61010	! t1_kref+0x3b80:   	casxa	[%i0]0x80, %l0, %l3
	.word	0xe820a034	! t1_kref+0x3b84:   	st	%l4, [%g2 + 0x34]
	.word	0xa33c4014	! t1_kref+0x3b88:   	sra	%l1, %l4, %l1
	.word	0x81848000	! t1_kref+0x3b8c:   	wr	%l2, %g0, %y
	.word	0xa9243ebe	! t1_kref+0x3b90:   	mulscc	%l0, -0x142, %l4
	.word	0xa824b154	! t1_kref+0x3b94:   	sub	%l2, -0xeac, %l4
	.word	0xa9a5c8be	! t1_kref+0x3b98:   	fsubs	%f23, %f30, %f20
	.word	0x85840014	! t1_kref+0x3b9c:   	wr	%l0, %l4, %ccr
	.word	0xd4ee501a	! t1_kref+0x3ba0:   	ldstuba	[%i1 + %i2]0x80, %o2
	.word	0xa9a01891	! t1_kref+0x3ba4:   	fitos	%f17, %f20
	.word	0xa3a00134	! t1_kref+0x3ba8:   	fabss	%f20, %f17
	.word	0xa33d0012	! t1_kref+0x3bac:   	sra	%l4, %l2, %l1
	.word	0x9ba00539	! t1_kref+0x3bb0:   	fsqrts	%f25, %f13
	.word	0xd44e6002	! t1_kref+0x3bb4:   	ldsb	[%i1 + 2], %o2
	.word	0xada589da	! t1_kref+0x3bb8:   	fdivd	%f22, %f26, %f22
	.word	0x96f43082	! t1_kref+0x3bbc:   	udivcc	%l0, -0xf7e, %o3
	.word	0xb5a00556	! t1_kref+0x3bc0:   	fsqrtd	%f22, %f26
	.word	0xafb44cb1	! t1_kref+0x3bc4:   	fandnot2s	%f17, %f17, %f23
	.word	0x21800005	! t1_kref+0x3bc8:   	fbn,a	_kref+0x3bdc
	.word	0x963c7129	! t1_kref+0x3bcc:   	xnor	%l1, -0xed7, %o3
	.word	0x80750014	! t1_kref+0x3bd0:   	udiv	%l4, %l4, %g0
	.word	0xa1a00556	! t1_kref+0x3bd4:   	fsqrtd	%f22, %f16
	.word	0xadb48d90	! t1_kref+0x3bd8:   	fxor	%f18, %f16, %f22
	.word	0xf9be9a18	! t1_kref+0x3bdc:   	stda	%f28, [%i2 + %i0]0xd0
	.word	0x961cf719	! t1_kref+0x3be0:   	xor	%l3, -0x8e7, %o3
	.word	0x8184c000	! t1_kref+0x3be4:   	wr	%l3, %g0, %y
	.word	0x81844000	! t1_kref+0x3be8:   	wr	%l1, %g0, %y
	.word	0xed1f4018	! t1_kref+0x3bec:   	ldd	[%i5 + %i0], %f22
	.word	0xee160000	! t1_kref+0x3bf0:   	lduh	[%i0], %l7
	.word	0xe67e001c	! t1_kref+0x3bf4:   	swap	[%i0 + %i4], %l3
	.word	0xe64e200e	! t1_kref+0x3bf8:   	ldsb	[%i0 + 0xe], %l3
	.word	0xa8bcf7bd	! t1_kref+0x3bfc:   	xnorcc	%l3, -0x843, %l4
	.word	0xc7ee1012	! t1_kref+0x3c00:   	prefetcha	%i0 + %l2, 3
	.word	0xa3a388bc	! t1_kref+0x3c04:   	fsubs	%f14, %f28, %f17
	.word	0x81400000	! t1_kref+0x3c08:   	mov	%y, %g0
	.word	0xe8b6101b	! t1_kref+0x3c0c:   	stha	%l4, [%i0 + %i3]0x80
	.word	0x9fa0013c	! t1_kref+0x3c10:   	fabss	%f28, %f15
	.word	0xae5c8014	! t1_kref+0x3c14:   	smul	%l2, %l4, %l7
	.word	0xa9a0055c	! t1_kref+0x3c18:   	fsqrtd	%f28, %f20
	.word	0xec563fe2	! t1_kref+0x3c1c:   	ldsh	[%i0 - 0x1e], %l6
	.word	0xc0463fe4	! t1_kref+0x3c20:   	ldsw	[%i0 - 0x1c], %g0
	.word	0xe906201c	! t1_kref+0x3c24:   	ld	[%i0 + 0x1c], %f20
	.word	0xc168a108	! t1_kref+0x3c28:   	prefetch	%g2 + 0x108, 0
	.word	0xa1a00035	! t1_kref+0x3c2c:   	fmovs	%f21, %f16
	.word	0xa884c010	! t1_kref+0x3c30:   	addcc	%l3, %l0, %l4
	.word	0xe0280018	! t1_kref+0x3c34:   	stb	%l0, [%g0 + %i0]
	.word	0xe2270019	! t1_kref+0x3c38:   	st	%l1, [%i4 + %i1]
	.word	0xa28d398b	! t1_kref+0x3c3c:   	andcc	%l4, -0x675, %l1
	.word	0xde480019	! t1_kref+0x3c40:   	ldsb	[%g0 + %i1], %o7
	.word	0xa5b4c130	! t1_kref+0x3c44:   	edge32n	%l3, %l0, %l2
	.word	0xd09e101d	! t1_kref+0x3c48:   	ldda	[%i0 + %i5]0x80, %o0
	.word	0xd81e7fe8	! t1_kref+0x3c4c:   	ldd	[%i1 - 0x18], %o4
	.word	0xa5418000	! t1_kref+0x3c50:   	mov	%fprs, %l2
	.word	0x97a00539	! t1_kref+0x3c54:   	fsqrts	%f25, %f11
	.word	0x93b44013	! t1_kref+0x3c58:   	edge8	%l1, %l3, %o1
	.word	0xe430a036	! t1_kref+0x3c5c:   	sth	%l2, [%g2 + 0x36]
	.word	0xa2f48013	! t1_kref+0x3c60:   	udivcc	%l2, %l3, %l1
	.word	0xb1b40a9e	! t1_kref+0x3c64:   	fpsub16	%f16, %f30, %f24
	.word	0xa5a0190d	! t1_kref+0x3c68:   	fitod	%f13, %f18
	.word	0x96550012	! t1_kref+0x3c6c:   	umul	%l4, %l2, %o3
	.word	0xac250012	! t1_kref+0x3c70:   	sub	%l4, %l2, %l6
	.word	0xa9a0054c	! t1_kref+0x3c74:   	fsqrtd	%f12, %f20
	.word	0x9da000cc	! t1_kref+0x3c78:   	fnegd	%f12, %f14
	.word	0xa1a448b1	! t1_kref+0x3c7c:   	fsubs	%f17, %f17, %f16
	.word	0x001fffff	! t1_kref+0x3c80:   	illtrap	0x1fffff
	.word	0xada00558	! t1_kref+0x3c84:   	fsqrtd	%f24, %f22
	.word	0x9ba4c9bb	! t1_kref+0x3c88:   	fdivs	%f19, %f27, %f13
	.word	0x9bb50200	! t1_kref+0x3c8c:   	array8	%l4, %g0, %o5
	.word	0x97a5092d	! t1_kref+0x3c90:   	fmuls	%f20, %f13, %f11
	.word	0x81dd69a1	! t1_kref+0x3c94:   	flush	%l5 + 0x9a1
	.word	0x27800004	! t1_kref+0x3c98:   	fbul,a	_kref+0x3ca8
	.word	0xa894ec68	! t1_kref+0x3c9c:   	orcc	%l3, 0xc68, %l4
	.word	0xe05e3fe8	! t1_kref+0x3ca0:   	ldx	[%i0 - 0x18], %l0
	.word	0x9a550013	! t1_kref+0x3ca4:   	umul	%l4, %l3, %o5
	.word	0x9e550010	! t1_kref+0x3ca8:   	umul	%l4, %l0, %o7
	.word	0xad408000	! t1_kref+0x3cac:   	mov	%ccr, %l6
	.word	0x81af0abc	! t1_kref+0x3cb0:   	fcmpes	%fcc0, %f28, %f28
	.word	0xf320a034	! t1_kref+0x3cb4:   	st	%f25, [%g2 + 0x34]
	.word	0x22480002	! t1_kref+0x3cb8:   	be,a,pt	%icc, _kref+0x3cc0
	.word	0x9e3531e7	! t1_kref+0x3cbc:   	orn	%l4, -0xe19, %o7
	.word	0x81ab8a5a	! t1_kref+0x3cc0:   	fcmpd	%fcc0, %f14, %f26
	.word	0x3c800004	! t1_kref+0x3cc4:   	bpos,a	_kref+0x3cd4
	.word	0xd01e2000	! t1_kref+0x3cc8:   	ldd	[%i0], %o0
	.word	0xa4348011	! t1_kref+0x3ccc:   	orn	%l2, %l1, %l2
	.word	0xa5408000	! t1_kref+0x3cd0:   	mov	%ccr, %l2
	.word	0xf11fbdf8	! t1_kref+0x3cd4:   	ldd	[%fp - 0x208], %f24
	.word	0xa684f960	! t1_kref+0x3cd8:   	addcc	%l3, -0x6a0, %l3
	.word	0x9da6c931	! t1_kref+0x3cdc:   	fmuls	%f27, %f17, %f14
	.word	0x9f414000	! t1_kref+0x3ce0:   	mov	%pc, %o7
	.word	0xb9a0055a	! t1_kref+0x3ce4:   	fsqrtd	%f26, %f28
	.word	0xd9be1a5c	! t1_kref+0x3ce8:   	stda	%f12, [%i0 + %i4]0xd2
	.word	0xc1e65012	! t1_kref+0x3cec:   	casa	[%i1]0x80, %l2, %g0
	.word	0xe13f4019	! t1_kref+0x3cf0:   	std	%f16, [%i5 + %i1]
	.word	0xa42c71ff	! t1_kref+0x3cf4:   	andn	%l1, -0xe01, %l2
	.word	0xafb00c20	! t1_kref+0x3cf8:   	fzeros	%f23
	.word	0xe02e2007	! t1_kref+0x3cfc:   	stb	%l0, [%i0 + 7]
	.word	0x9de3bfa0	! t1_kref+0x3d00:   	save	%sp, -0x60, %sp
	.word	0xba1622c7	! t1_kref+0x3d04:   	or	%i0, 0x2c7, %i5
	.word	0xadeeee79	! t1_kref+0x3d08:   	restore	%i3, 0xe79, %l6
	.word	0x31480008	! t1_kref+0x3d0c:   	fba,a,pt	%fcc0, _kref+0x3d2c
	.word	0xb9b00f0a	! t1_kref+0x3d10:   	fsrc2	%f10, %f28
	.word	0x15282795	! t1_kref+0x3d14:   	sethi	%hi(0xa09e5400), %o2
	.word	0xa5b38d10	! t1_kref+0x3d18:   	fandnot1	%f14, %f16, %f18
	.word	0xe62e6009	! t1_kref+0x3d1c:   	stb	%l3, [%i1 + 9]
	.word	0xada0191d	! t1_kref+0x3d20:   	fitod	%f29, %f22
	.word	0xd41e6010	! t1_kref+0x3d24:   	ldd	[%i1 + 0x10], %o2
	.word	0x81b01026	! t1_kref+0x3d28:   	siam	0x6
	.word	0xa6fc4010	! t1_kref+0x3d2c:   	sdivcc	%l1, %l0, %l3
	.word	0x9f34a00a	! t1_kref+0x3d30:   	srl	%l2, 0xa, %o7
	.word	0xea7e001c	! t1_kref+0x3d34:   	swap	[%i0 + %i4], %l5
	.word	0xef68a0c6	! t1_kref+0x3d38:   	prefetch	%g2 + 0xc6, 23
	.word	0xa47c674f	! t1_kref+0x3d3c:   	sdiv	%l1, 0x74f, %l2
	.word	0xa1b58a10	! t1_kref+0x3d40:   	fpadd16	%f22, %f16, %f16
	.word	0xe11fbde0	! t1_kref+0x3d44:   	ldd	[%fp - 0x220], %f16
	.word	0x81840000	! t1_kref+0x3d48:   	wr	%l0, %g0, %y
	.word	0x9fc00004	! t1_kref+0x3d4c:   	call	%g0 + %g4
	.word	0xb1b586d8	! t1_kref+0x3d50:   	fmul8sux16	%f22, %f24, %f24
	.word	0x9fc00004	! t1_kref+0x3d54:   	call	%g0 + %g4
	.word	0xe968a106	! t1_kref+0x3d58:   	prefetch	%g2 + 0x106, 20
	.word	0x8143c000	! t1_kref+0x3d5c:   	stbar
	.word	0x9434280d	! t1_kref+0x3d60:   	orn	%l0, 0x80d, %o2
	.word	0x80f40011	! t1_kref+0x3d64:   	udivcc	%l0, %l1, %g0
	.word	0x9de3bfa0	! t1_kref+0x3d68:   	save	%sp, -0x60, %sp
	.word	0xb2de23f6	! t1_kref+0x3d6c:   	smulcc	%i0, 0x3f6, %i1
	.word	0xa3eec01d	! t1_kref+0x3d70:   	restore	%i3, %i5, %l1
	.word	0xd7a6501c	! t1_kref+0x3d74:   	sta	%f11, [%i1 + %i4]0x80
	.word	0x92ac0011	! t1_kref+0x3d78:   	andncc	%l0, %l1, %o1
	.word	0x81ae0ad0	! t1_kref+0x3d7c:   	fcmped	%fcc0, %f24, %f16
	.word	0xc807bfe4	! t1_kref+0x3d80:   	ld	[%fp - 0x1c], %g4
	.word	0xa3400000	! t1_kref+0x3d84:   	mov	%y, %l1
	.word	0xd19e3fec	! t1_kref+0x3d88:   	ldda	[%i0 - 0x14]%asi, %f8
	.word	0xb1b68970	! t1_kref+0x3d8c:   	fpmerge	%f26, %f16, %f24
	.word	0x98e44011	! t1_kref+0x3d90:   	subccc	%l1, %l1, %o4
	.word	0xb5a58950	! t1_kref+0x3d94:   	fmuld	%f22, %f16, %f26
	.word	0x8143c000	! t1_kref+0x3d98:   	stbar
	.word	0x81af8a38	! t1_kref+0x3d9c:   	fcmps	%fcc0, %f30, %f24
	.word	0x923d37d4	! t1_kref+0x3da0:   	xnor	%l4, -0x82c, %o1
	.word	0x97b5cd60	! t1_kref+0x3da4:   	fnot1s	%f23, %f11
	.word	0xe030a00c	! t1_kref+0x3da8:   	sth	%l0, [%g2 + 0xc]
	.word	0xc368a0cb	! t1_kref+0x3dac:   	prefetch	%g2 + 0xcb, 1
	.word	0xa7a00532	! t1_kref+0x3db0:   	fsqrts	%f18, %f19
	.word	0xe426001c	! t1_kref+0x3db4:   	st	%l2, [%i0 + %i4]
	.word	0xaba448b5	! t1_kref+0x3db8:   	fsubs	%f17, %f21, %f21
	.word	0x98bc4014	! t1_kref+0x3dbc:   	xnorcc	%l1, %l4, %o4
	.word	0xe628a03f	! t1_kref+0x3dc0:   	stb	%l3, [%g2 + 0x3f]
	.word	0xb1b286de	! t1_kref+0x3dc4:   	fmul8sux16	%f10, %f30, %f24
	.word	0xa5352018	! t1_kref+0x3dc8:   	srl	%l4, 0x18, %l2
	.word	0xda08a01e	! t1_kref+0x3dcc:   	ldub	[%g2 + 0x1e], %o5
	.word	0xf91fbf50	! t1_kref+0x3dd0:   	ldd	[%fp - 0xb0], %f28
	.word	0x013fb1f3	! t1_kref+0x3dd4:   	sethi	%hi(0xfec7cc00), %g0
	.word	0xada0054e	! t1_kref+0x3dd8:   	fsqrtd	%f14, %f22
	.word	0xbda0191d	! t1_kref+0x3ddc:   	fitod	%f29, %f30
	sethi	%hi(2f), %o7
	.word	0xe40be22c	! t1_kref+0x3de4:   	ldub	[%o7 + 0x22c], %l2
	.word	0xa41ca00c	! t1_kref+0x3de8:   	xor	%l2, 0xc, %l2
	.word	0xe42be22c	! t1_kref+0x3dec:   	stb	%l2, [%o7 + 0x22c]
	.word	0x81dbe22c	! t1_kref+0x3df0:   	flush	%o7 + 0x22c
	.word	0xea7e401c	! t1_kref+0x3df4:   	swap	[%i1 + %i4], %l5
	.word	0xa9a0052c	! t1_kref+0x3df8:   	fsqrts	%f12, %f20
	.word	0xd67e6004	! t1_kref+0x3dfc:   	swap	[%i1 + 4], %o3
	.word	0x81848000	! t1_kref+0x3e00:   	wr	%l2, %g0, %y
	.word	0xd478a004	! t1_kref+0x3e04:   	swap	[%g2 + 4], %o2
	.word	0xf51fbc38	! t1_kref+0x3e08:   	ldd	[%fp - 0x3c8], %f26
	.word	0xa0c53ded	! t1_kref+0x3e0c:   	addccc	%l4, -0x213, %l0
	.word	0x9db50aec	! t1_kref+0x3e10:   	fpsub32s	%f20, %f12, %f14
	.word	0xa4444013	! t1_kref+0x3e14:   	addc	%l1, %l3, %l2
	.word	0x81ad8a52	! t1_kref+0x3e18:   	fcmpd	%fcc0, %f22, %f18
	.word	0xaa1d0013	! t1_kref+0x3e1c:   	xor	%l4, %l3, %l5
	.word	0xae9c6352	! t1_kref+0x3e20:   	xorcc	%l1, 0x352, %l7
	.word	0xa5b70458	! t1_kref+0x3e24:   	fcmpne16	%f28, %f24, %l2
	.word	0xe22e2010	! t1_kref+0x3e28:   	stb	%l1, [%i0 + 0x10]
2:	.word	0xd4ee5000	! t1_kref+0x3e2c:   	ldstuba	[%i1]0x80, %o2
	.word	0x8143c000	! t1_kref+0x3e30:   	stbar
	.word	0xa23d33c8	! t1_kref+0x3e34:   	xnor	%l4, -0xc38, %l1
	.word	0xd3e61014	! t1_kref+0x3e38:   	casa	[%i0]0x80, %l4, %o1
	.word	0x9af44011	! t1_kref+0x3e3c:   	udivcc	%l1, %l1, %o5
	.word	0xdb260000	! t1_kref+0x3e40:   	st	%f13, [%i0]
	.word	0xa1a48852	! t1_kref+0x3e44:   	faddd	%f18, %f18, %f16
	.word	0x9e5c4013	! t1_kref+0x3e48:   	smul	%l1, %l3, %o7
	.word	0xb3b00f37	! t1_kref+0x3e4c:   	fsrc2s	%f23, %f25
	.word	0xf1180019	! t1_kref+0x3e50:   	ldd	[%g0 + %i1], %f24
	.word	0x90b4f41e	! t1_kref+0x3e54:   	orncc	%l3, -0xbe2, %o0
	.word	0xc807bff0	! t1_kref+0x3e58:   	ld	[%fp - 0x10], %g4
	.word	0xe830a03e	! t1_kref+0x3e5c:   	sth	%l4, [%g2 + 0x3e]
	.word	0xec1e401d	! t1_kref+0x3e60:   	ldd	[%i1 + %i5], %l6
	.word	0xab0c4010	! t1_kref+0x3e64:   	tsubcc	%l1, %l0, %l5
	.word	0xa5400000	! t1_kref+0x3e68:   	mov	%y, %l2
	.word	0x81db8013	! t1_kref+0x3e6c:   	flush	%sp + %l3
	.word	0xa0d50014	! t1_kref+0x3e70:   	umulcc	%l4, %l4, %l0
	.word	0x9abd0012	! t1_kref+0x3e74:   	xnorcc	%l4, %l2, %o5
	.word	0x37480001	! t1_kref+0x3e78:   	fbge,a,pt	%fcc0, _kref+0x3e7c
	.word	0x9da00532	! t1_kref+0x3e7c:   	fsqrts	%f18, %f14
	.word	0xb1a50958	! t1_kref+0x3e80:   	fmuld	%f20, %f24, %f24
	.word	0x95b6c67d	! t1_kref+0x3e84:   	fmul8x16au	%f27, %f29, %f10
	.word	0xecfe5000	! t1_kref+0x3e88:   	swapa	[%i1]0x80, %l6
	.word	0x9ec4c013	! t1_kref+0x3e8c:   	addccc	%l3, %l3, %o7
	.word	0x81844000	! t1_kref+0x3e90:   	wr	%l1, %g0, %y
	.word	0x9db30ece	! t1_kref+0x3e94:   	fornot2	%f12, %f14, %f14
	.word	0x81dca6a6	! t1_kref+0x3e98:   	flush	%l2 + 0x6a6
	.word	0x33800005	! t1_kref+0x3e9c:   	fbe,a	_kref+0x3eb0
	.word	0xf007bfe0	! t1_kref+0x3ea0:   	ld	[%fp - 0x20], %i0
	.word	0xe4164000	! t1_kref+0x3ea4:   	lduh	[%i1], %l2
	.word	0xa334a009	! t1_kref+0x3ea8:   	srl	%l2, 0x9, %l1
	.word	0xbdb7066c	! t1_kref+0x3eac:   	fmul8x16au	%f28, %f12, %f30
	.word	0xebee501d	! t1_kref+0x3eb0:   	prefetcha	%i1 + %i5, 21
	.word	0x81af0ad0	! t1_kref+0x3eb4:   	fcmped	%fcc0, %f28, %f16
	.word	0xe626001c	! t1_kref+0x3eb8:   	st	%l3, [%i0 + %i4]
	.word	0xa6e48014	! t1_kref+0x3ebc:   	subccc	%l2, %l4, %l3
	.word	0xd07f0018	! t1_kref+0x3ec0:   	swap	[%i4 + %i0], %o0
	.word	0x9a750011	! t1_kref+0x3ec4:   	udiv	%l4, %l1, %o5
	.word	0xe168a104	! t1_kref+0x3ec8:   	prefetch	%g2 + 0x104, 16
	.word	0x99b68c90	! t1_kref+0x3ecc:   	fandnot2	%f26, %f16, %f12
	.word	0x21480002	! t1_kref+0x3ed0:   	fbn,a,pt	%fcc0, _kref+0x3ed8
	.word	0xac3d2f1b	! t1_kref+0x3ed4:   	xnor	%l4, 0xf1b, %l6
	.word	0xa2850010	! t1_kref+0x3ed8:   	addcc	%l4, %l0, %l1
	.word	0xda4e6014	! t1_kref+0x3edc:   	ldsb	[%i1 + 0x14], %o5
	.word	0xd91fbe80	! t1_kref+0x3ee0:   	ldd	[%fp - 0x180], %f12
	.word	0x92c4c012	! t1_kref+0x3ee4:   	addccc	%l3, %l2, %o1
	sethi	%hi(2f), %o7
	.word	0xe40be300	! t1_kref+0x3eec:   	ldub	[%o7 + 0x300], %l2
	.word	0xa41ca00c	! t1_kref+0x3ef0:   	xor	%l2, 0xc, %l2
	.word	0xe42be300	! t1_kref+0x3ef4:   	stb	%l2, [%o7 + 0x300]
	.word	0x81dbe300	! t1_kref+0x3ef8:   	flush	%o7 + 0x300
	.word	0xac2cacce	! t1_kref+0x3efc:   	andn	%l2, 0xcce, %l6
2:	.word	0x9fb4c0f1	! t1_kref+0x3f00:   	edge16ln	%l3, %l1, %o7
	.word	0x99a000ab	! t1_kref+0x3f04:   	fnegs	%f11, %f12
	.word	0xf1bf5a19	! t1_kref+0x3f08:   	stda	%f24, [%i5 + %i1]0xd0
	.word	0xa5b50071	! t1_kref+0x3f0c:   	edge8ln	%l4, %l1, %l2
	.word	0xaebd0014	! t1_kref+0x3f10:   	xnorcc	%l4, %l4, %l7
	.word	0x9ed4e07f	! t1_kref+0x3f14:   	umulcc	%l3, 0x7f, %o7
	.word	0xa0dc8012	! t1_kref+0x3f18:   	smulcc	%l2, %l2, %l0
	.word	0x8143e057	! t1_kref+0x3f1c:   	membar	0x57
	.word	0xe820a004	! t1_kref+0x3f20:   	st	%l4, [%g2 + 4]
	.word	0xe27e0000	! t1_kref+0x3f24:   	swap	[%i0], %l1
	.word	0xe22e7fee	! t1_kref+0x3f28:   	stb	%l1, [%i1 - 0x12]
	.word	0xb1b68d1a	! t1_kref+0x3f2c:   	fandnot1	%f26, %f26, %f24
	.word	0x95b48030	! t1_kref+0x3f30:   	edge8n	%l2, %l0, %o2
	.word	0xa9a60952	! t1_kref+0x3f34:   	fmuld	%f24, %f18, %f20
	.word	0xe42e401a	! t1_kref+0x3f38:   	stb	%l2, [%i1 + %i2]
	.word	0xa1b70735	! t1_kref+0x3f3c:   	fmuld8ulx16	%f28, %f21, %f16
	.word	0x9ec4bb97	! t1_kref+0x3f40:   	addccc	%l2, -0x469, %o7
	.word	0x3b480003	! t1_kref+0x3f44:   	fble,a,pt	%fcc0, _kref+0x3f50
	.word	0xb9a0055e	! t1_kref+0x3f48:   	fsqrtd	%f30, %f28
	.word	0xa5b68c8c	! t1_kref+0x3f4c:   	fandnot2	%f26, %f12, %f18
	.word	0xd87e7ff0	! t1_kref+0x3f50:   	swap	[%i1 - 0x10], %o4
	.word	0xe02e2005	! t1_kref+0x3f54:   	stb	%l0, [%i0 + 5]
	.word	0xac853416	! t1_kref+0x3f58:   	addcc	%l4, -0xbea, %l6
	.word	0xe028a034	! t1_kref+0x3f5c:   	stb	%l0, [%g2 + 0x34]
	.word	0x81ac0a58	! t1_kref+0x3f60:   	fcmpd	%fcc0, %f16, %f24
	.word	0x922cb33d	! t1_kref+0x3f64:   	andn	%l2, -0xcc3, %o1
	.word	0xa234c014	! t1_kref+0x3f68:   	orn	%l3, %l4, %l1
	.word	0xa8bc4011	! t1_kref+0x3f6c:   	xnorcc	%l1, %l1, %l4
	.word	0xae5d0010	! t1_kref+0x3f70:   	smul	%l4, %l0, %l7
	.word	0xa4644014	! t1_kref+0x3f74:   	subc	%l1, %l4, %l2
	.word	0xf326401c	! t1_kref+0x3f78:   	st	%f25, [%i1 + %i4]
	.word	0x9a540012	! t1_kref+0x3f7c:   	umul	%l0, %l2, %o5
	.word	0xa41cb7e4	! t1_kref+0x3f80:   	xor	%l2, -0x81c, %l2
	.word	0xc168a08b	! t1_kref+0x3f84:   	prefetch	%g2 + 0x8b, 0
	.word	0xc07e6004	! t1_kref+0x3f88:   	swap	[%i1 + 4], %g0
	.word	0xd8680019	! t1_kref+0x3f8c:   	ldstub	[%g0 + %i1], %o4
	.word	0xa9a000d8	! t1_kref+0x3f90:   	fnegd	%f24, %f20
	.word	0xa1a01a50	! t1_kref+0x3f94:   	fdtoi	%f16, %f16
	.word	0xd068a035	! t1_kref+0x3f98:   	ldstub	[%g2 + 0x35], %o0
	.word	0xe828a03c	! t1_kref+0x3f9c:   	stb	%l4, [%g2 + 0x3c]
	.word	0xb5a788b2	! t1_kref+0x3fa0:   	fsubs	%f30, %f18, %f26
	.word	0xa0043cf9	! t1_kref+0x3fa4:   	add	%l0, -0x307, %l0
	.word	0xac850013	! t1_kref+0x3fa8:   	addcc	%l4, %l3, %l6
	.word	0x28480002	! t1_kref+0x3fac:   	bleu,a,pt	%icc, _kref+0x3fb4
	.word	0xf1264000	! t1_kref+0x3fb0:   	st	%f24, [%i1]
	.word	0xb5a01a5c	! t1_kref+0x3fb4:   	fdtoi	%f28, %f26
	.word	0x97400000	! t1_kref+0x3fb8:   	mov	%y, %o3
	.word	0xc12e6004	! t1_kref+0x3fbc:   	st	%fsr, [%i1 + 4]
	.word	0x99a448bc	! t1_kref+0x3fc0:   	fsubs	%f17, %f28, %f12
	.word	0x99b30d94	! t1_kref+0x3fc4:   	fxor	%f12, %f20, %f12
	.word	0x9da509b1	! t1_kref+0x3fc8:   	fdivs	%f20, %f17, %f14
	.word	0xb1a688d0	! t1_kref+0x3fcc:   	fsubd	%f26, %f16, %f24
	.word	0xa9b48a56	! t1_kref+0x3fd0:   	fpadd32	%f18, %f22, %f20
	.word	0xc807bfe8	! t1_kref+0x3fd4:   	ld	[%fp - 0x18], %g4
	.word	0xa9b60a10	! t1_kref+0x3fd8:   	fpadd16	%f24, %f16, %f20
	.word	0x8143e018	! t1_kref+0x3fdc:   	membar	0x18
	.word	0x805d0010	! t1_kref+0x3fe0:   	smul	%l4, %l0, %g0
	.word	0xa5b3041a	! t1_kref+0x3fe4:   	fcmple16	%f12, %f26, %l2
	.word	0xafa489b5	! t1_kref+0x3fe8:   	fdivs	%f18, %f21, %f23
	.word	0x95a00552	! t1_kref+0x3fec:   	fsqrtd	%f18, %f10
	.word	0xab418000	! t1_kref+0x3ff0:   	mov	%fprs, %l5
	.word	0xaae4baa9	! t1_kref+0x3ff4:   	subccc	%l2, -0x557, %l5
	.word	0x9b24adbc	! t1_kref+0x3ff8:   	mulscc	%l2, 0xdbc, %o5
	.word	0xed68a088	! t1_kref+0x3ffc:   	prefetch	%g2 + 0x88, 22
	.word	0xa4e4ef02	! t1_kref+0x4000:   	subccc	%l3, 0xf02, %l2
	.word	0x9ba5c8bb	! t1_kref+0x4004:   	fsubs	%f23, %f27, %f13
	.word	0xe100a02c	! t1_kref+0x4008:   	ld	[%g2 + 0x2c], %f16
	.word	0xe8262008	! t1_kref+0x400c:   	st	%l4, [%i0 + 8]
	.word	0x9bb4cdb1	! t1_kref+0x4010:   	fxors	%f19, %f17, %f13
	.word	0x8d846ffe	! t1_kref+0x4014:   	wr	%l1, 0xffe, %fprs
	.word	0x980cc011	! t1_kref+0x4018:   	and	%l3, %l1, %o4
	.word	0x90a527a0	! t1_kref+0x401c:   	subcc	%l4, 0x7a0, %o0
	.word	0x9ae4f4a3	! t1_kref+0x4020:   	subccc	%l3, -0xb5d, %o5
	.word	0xbda018ce	! t1_kref+0x4024:   	fdtos	%f14, %f30
	.word	0xb7a588ac	! t1_kref+0x4028:   	fsubs	%f22, %f12, %f27
	.word	0xf11e2000	! t1_kref+0x402c:   	ldd	[%i0], %f24
	.word	0x23800004	! t1_kref+0x4030:   	fbne,a	_kref+0x4040
	.word	0xd0163fe0	! t1_kref+0x4034:   	lduh	[%i0 - 0x20], %o0
	.word	0xa7a00138	! t1_kref+0x4038:   	fabss	%f24, %f19
	.word	0x95b606d8	! t1_kref+0x403c:   	fmul8sux16	%f24, %f24, %f10
	.word	0xb5b78e80	! t1_kref+0x4040:   	fsrc1	%f30, %f26
	.word	0xa65cc014	! t1_kref+0x4044:   	smul	%l3, %l4, %l3
	.word	0x9a3cc012	! t1_kref+0x4048:   	xnor	%l3, %l2, %o5
	.word	0x8584f390	! t1_kref+0x404c:   	wr	%l3, 0xfffff390, %ccr
	.word	0x81ac0a36	! t1_kref+0x4050:   	fcmps	%fcc0, %f16, %f22
	.word	0xe51e401d	! t1_kref+0x4054:   	ldd	[%i1 + %i5], %f18
	.word	0x9a447eec	! t1_kref+0x4058:   	addc	%l1, -0x114, %o5
	.word	0x81ad0a5c	! t1_kref+0x405c:   	fcmpd	%fcc0, %f20, %f28
	.word	0x99a01917	! t1_kref+0x4060:   	fitod	%f23, %f12
	.word	0xc07e0000	! t1_kref+0x4064:   	swap	[%i0], %g0
	.word	0x80f52f35	! t1_kref+0x4068:   	udivcc	%l4, 0xf35, %g0
	.word	0x81ab0a52	! t1_kref+0x406c:   	fcmpd	%fcc0, %f12, %f18
	.word	0xd67e3fec	! t1_kref+0x4070:   	swap	[%i0 - 0x14], %o3
	.word	0xef000018	! t1_kref+0x4074:   	ld	[%g0 + %i0], %f23
	.word	0xc368a086	! t1_kref+0x4078:   	prefetch	%g2 + 0x86, 1
	.word	0xb5b40e1e	! t1_kref+0x407c:   	fand	%f16, %f30, %f26
	.word	0x9bb40131	! t1_kref+0x4080:   	edge32n	%l0, %l1, %o5
	.word	0xbda6893d	! t1_kref+0x4084:   	fmuls	%f26, %f29, %f30
	.word	0xc12e001c	! t1_kref+0x4088:   	st	%fsr, [%i0 + %i4]
	.word	0xac2c2f88	! t1_kref+0x408c:   	andn	%l0, 0xf88, %l6
	.word	0x9fc00004	! t1_kref+0x4090:   	call	%g0 + %g4
	.word	0x9a5c320e	! t1_kref+0x4094:   	smul	%l0, -0xdf2, %o5
	.word	0xa1a00550	! t1_kref+0x4098:   	fsqrtd	%f16, %f16
	.word	0x9444a951	! t1_kref+0x409c:   	addc	%l2, 0x951, %o2
	.word	0xacbd2f37	! t1_kref+0x40a0:   	xnorcc	%l4, 0xf37, %l6
	.word	0xd04e7fe3	! t1_kref+0x40a4:   	ldsb	[%i1 - 0x1d], %o0
	.word	0x2c480008	! t1_kref+0x40a8:   	bneg,a,pt	%icc, _kref+0x40c8
	.word	0x94fc362d	! t1_kref+0x40ac:   	sdivcc	%l0, -0x9d3, %o2
	.word	0x0124ce21	! t1_kref+0x40b0:   	sethi	%hi(0x93388400), %g0
	.word	0xe6566018	! t1_kref+0x40b4:   	ldsh	[%i1 + 0x18], %l3
	.word	0xb1a308da	! t1_kref+0x40b8:   	fsubd	%f12, %f26, %f24
	.word	0xd26e3ff9	! t1_kref+0x40bc:   	ldstub	[%i0 - 7], %o1
	.word	0xa1b486d6	! t1_kref+0x40c0:   	fmul8sux16	%f18, %f22, %f16
	.word	0x99b48e0c	! t1_kref+0x40c4:   	fand	%f18, %f12, %f12
	.word	0xaee46ba7	! t1_kref+0x40c8:   	subccc	%l1, 0xba7, %l7
	.word	0xa9a01037	! t1_kref+0x40cc:   	fstox	%f23, %f20
	.word	0x9f14b391	! t1_kref+0x40d0:   	taddcctv	%l2, -0xc6f, %o7
	.word	0xa9b48a14	! t1_kref+0x40d4:   	fpadd16	%f18, %f20, %f20
	.word	0xe2563fee	! t1_kref+0x40d8:   	ldsh	[%i0 - 0x12], %l1
	.word	0xa41c0011	! t1_kref+0x40dc:   	xor	%l0, %l1, %l2
	.word	0xb1b009ad	! t1_kref+0x40e0:   	fexpand	%f13, %f24
	.word	0xa5a0053c	! t1_kref+0x40e4:   	fsqrts	%f28, %f18
	.word	0x81db401c	! t1_kref+0x40e8:   	flush	%o5 + %i4
	.word	0xa8d520fa	! t1_kref+0x40ec:   	umulcc	%l4, 0xfa, %l4
	.word	0x809c350f	! t1_kref+0x40f0:   	xorcc	%l0, -0xaf1, %g0
	.word	0xa5b30a1e	! t1_kref+0x40f4:   	fpadd16	%f12, %f30, %f18
	.word	0xb1b00fc0	! t1_kref+0x40f8:   	fone	%f24
	.word	0xa9a78856	! t1_kref+0x40fc:   	faddd	%f30, %f22, %f20
	.word	0xe628a005	! t1_kref+0x4100:   	stb	%l3, [%g2 + 5]
	.word	0xe068a00d	! t1_kref+0x4104:   	ldstub	[%g2 + 0xd], %l0
	.word	0xa6744014	! t1_kref+0x4108:   	udiv	%l1, %l4, %l3
	.word	0xe9be5892	! t1_kref+0x410c:   	stda	%f20, [%i1 + %l2]0xc4
	.word	0x99a0055e	! t1_kref+0x4110:   	fsqrtd	%f30, %f12
	.word	0xa3b5041a	! t1_kref+0x4114:   	fcmple16	%f20, %f26, %l1
	.word	0x001fffff	! t1_kref+0x4118:   	illtrap	0x1fffff
	.word	0x94f48010	! t1_kref+0x411c:   	udivcc	%l2, %l0, %o2
	.word	0xa9b78e4a	! t1_kref+0x4120:   	fxnor	%f30, %f10, %f20
	.word	0x81ae8ad8	! t1_kref+0x4124:   	fcmped	%fcc0, %f26, %f24
	.word	0x90748011	! t1_kref+0x4128:   	udiv	%l2, %l1, %o0
	.word	0x81ae8a56	! t1_kref+0x412c:   	fcmpd	%fcc0, %f26, %f22
	.word	0xd9be5811	! t1_kref+0x4130:   	stda	%f12, [%i1 + %l1]0xc0
	.word	0x8143c000	! t1_kref+0x4134:   	stbar
	.word	0x80ac0014	! t1_kref+0x4138:   	andncc	%l0, %l4, %g0
	.word	0x81de26e5	! t1_kref+0x413c:   	flush	%i0 + 0x6e5
	.word	0xa65c0012	! t1_kref+0x4140:   	smul	%l0, %l2, %l3
	.word	0x98a48012	! t1_kref+0x4144:   	subcc	%l2, %l2, %o4
	.word	0x95144011	! t1_kref+0x4148:   	taddcctv	%l1, %l1, %o2
	.word	0x9a450010	! t1_kref+0x414c:   	addc	%l4, %l0, %o5
	.word	0xb1a0110c	! t1_kref+0x4150:   	fxtod	%f12, %f24
	.word	0xa5408000	! t1_kref+0x4154:   	mov	%ccr, %l2
	.word	0x99a00558	! t1_kref+0x4158:   	fsqrtd	%f24, %f12
	.word	0x9fc00004	! t1_kref+0x415c:   	call	%g0 + %g4
	.word	0xd650a03e	! t1_kref+0x4160:   	ldsh	[%g2 + 0x3e], %o3
	.word	0xc0ce9018	! t1_kref+0x4164:   	ldsba	[%i2 + %i0]0x80, %g0
	.word	0x96243888	! t1_kref+0x4168:   	sub	%l0, -0x778, %o3
	.word	0xa4e42dad	! t1_kref+0x416c:   	subccc	%l0, 0xdad, %l2
	.word	0x81aa8ace	! t1_kref+0x4170:   	fcmped	%fcc0, %f10, %f14
	.word	0xe42e8019	! t1_kref+0x4174:   	stb	%l2, [%i2 + %i1]
	.word	0xa9b007b4	! t1_kref+0x4178:   	fpackfix	%f20, %f20
	.word	0x9da000bd	! t1_kref+0x417c:   	fnegs	%f29, %f14
	.word	0xe62e8019	! t1_kref+0x4180:   	stb	%l3, [%i2 + %i1]
	.word	0xb1a00554	! t1_kref+0x4184:   	fsqrtd	%f20, %f24
	.word	0x9f414000	! t1_kref+0x4188:   	mov	%pc, %o7
	.word	0xe700a00c	! t1_kref+0x418c:   	ld	[%g2 + 0xc], %f19
	.word	0x8143c000	! t1_kref+0x4190:   	stbar
	.word	0xeb20a014	! t1_kref+0x4194:   	st	%f21, [%g2 + 0x14]
	.word	0x81dd2867	! t1_kref+0x4198:   	flush	%l4 + 0x867
	.word	0xd050a01e	! t1_kref+0x419c:   	ldsh	[%g2 + 0x1e], %o0
	.word	0xa03c0014	! t1_kref+0x41a0:   	xnor	%l0, %l4, %l0
	sethi	%hi(2f), %o7
	.word	0xe40be1f0	! t1_kref+0x41a8:   	ldub	[%o7 + 0x1f0], %l2
	.word	0xa41ca00c	! t1_kref+0x41ac:   	xor	%l2, 0xc, %l2
	.word	0xe42be1f0	! t1_kref+0x41b0:   	stb	%l2, [%o7 + 0x1f0]
	.word	0x81dbe1f0	! t1_kref+0x41b4:   	flush	%o7 + 0x1f0
	.word	0xac9c8011	! t1_kref+0x41b8:   	xorcc	%l2, %l1, %l6
	.word	0x81af0adc	! t1_kref+0x41bc:   	fcmped	%fcc0, %f28, %f28
	.word	0xbba648ae	! t1_kref+0x41c0:   	fsubs	%f25, %f14, %f29
	.word	0xd0480018	! t1_kref+0x41c4:   	ldsb	[%g0 + %i0], %o0
	.word	0xb9a388dc	! t1_kref+0x41c8:   	fsubd	%f14, %f28, %f28
	.word	0xe59f5018	! t1_kref+0x41cc:   	ldda	[%i5 + %i0]0x80, %f18
	.word	0xb1b50d12	! t1_kref+0x41d0:   	fandnot1	%f20, %f18, %f24
	.word	0xa0848013	! t1_kref+0x41d4:   	addcc	%l2, %l3, %l0
	.word	0xae9cf6c9	! t1_kref+0x41d8:   	xorcc	%l3, -0x937, %l7
	.word	0xec166010	! t1_kref+0x41dc:   	lduh	[%i1 + 0x10], %l6
	.word	0xa5b40a4a	! t1_kref+0x41e0:   	fpadd32	%f16, %f10, %f18
	.word	0xa5b58a18	! t1_kref+0x41e4:   	fpadd16	%f22, %f24, %f18
	.word	0xa4f46402	! t1_kref+0x41e8:   	udivcc	%l1, 0x402, %l2
	.word	0xacfc0013	! t1_kref+0x41ec:   	sdivcc	%l0, %l3, %l6
2:	.word	0xe26e601c	! t1_kref+0x41f0:   	ldstub	[%i1 + 0x1c], %l1
	.word	0xe030a00e	! t1_kref+0x41f4:   	sth	%l0, [%g2 + 0xe]
	.word	0xa9a00552	! t1_kref+0x41f8:   	fsqrtd	%f18, %f20
	.word	0xa1b40154	! t1_kref+0x41fc:   	edge32l	%l0, %l4, %l0
	.word	0xa33d2018	! t1_kref+0x4200:   	sra	%l4, 0x18, %l1
	.word	0xb9a0191b	! t1_kref+0x4204:   	fitod	%f27, %f28
	.word	0x98dc33ff	! t1_kref+0x4208:   	smulcc	%l0, -0xc01, %o4
	.word	0xe620a03c	! t1_kref+0x420c:   	st	%l3, [%g2 + 0x3c]
	.word	0x9da0103d	! t1_kref+0x4210:   	fstox	%f29, %f14
	.word	0x99b0077e	! t1_kref+0x4214:   	fpack16	%f30, %f12
	.word	0xe1be5892	! t1_kref+0x4218:   	stda	%f16, [%i1 + %l2]0xc4
	.word	0xb9a5cd2e	! t1_kref+0x421c:   	fsmuld	%f23, %f14, %f28
	.word	0xadb6872c	! t1_kref+0x4220:   	fmuld8ulx16	%f26, %f12, %f22
	.word	0xd26e2011	! t1_kref+0x4224:   	ldstub	[%i0 + 0x11], %o1
	.word	0xdf20a024	! t1_kref+0x4228:   	st	%f15, [%g2 + 0x24]
	.word	0xb1b6ceef	! t1_kref+0x422c:   	fornot2s	%f27, %f15, %f24
	.word	0x923cbb8e	! t1_kref+0x4230:   	xnor	%l2, -0x472, %o1
	.word	0x9ba409b2	! t1_kref+0x4234:   	fdivs	%f16, %f18, %f13
	.word	0x993ce016	! t1_kref+0x4238:   	sra	%l3, 0x16, %o4
	.word	0x86102003	! t1_kref+0x423c:   	mov	0x3, %g3
	.word	0x32800000	! t1_kref+0x4240:   	bne,a	_kref+0x4240
	.word	0x86a0e001	! t1_kref+0x4244:   	subcc	%g3, 1, %g3
	.word	0xacbcaf27	! t1_kref+0x4248:   	xnorcc	%l2, 0xf27, %l6
	.word	0xfd200019	! t1_kref+0x424c:   	st	%f30, [%g0 + %i1]
	.word	0xa65c4010	! t1_kref+0x4250:   	smul	%l1, %l0, %l3
	.word	0x96a40011	! t1_kref+0x4254:   	subcc	%l0, %l1, %o3
	.word	0x8d844011	! t1_kref+0x4258:   	wr	%l1, %l1, %fprs
	.word	0x9da448ac	! t1_kref+0x425c:   	fsubs	%f17, %f12, %f14
	.word	0x92b4a6bd	! t1_kref+0x4260:   	orncc	%l2, 0x6bd, %o1
	.word	0xe1270018	! t1_kref+0x4264:   	st	%f16, [%i4 + %i0]
	.word	0x96e48010	! t1_kref+0x4268:   	subccc	%l2, %l0, %o3
	.word	0x95a01910	! t1_kref+0x426c:   	fitod	%f16, %f10
	.word	0x94bc4010	! t1_kref+0x4270:   	xnorcc	%l1, %l0, %o2
	.word	0x86102002	! t1_kref+0x4274:   	mov	0x2, %g3
	.word	0x32800000	! t1_kref+0x4278:   	bne,a	_kref+0x4278
	.word	0x86a0e001	! t1_kref+0x427c:   	subcc	%g3, 1, %g3
	.word	0xf5062004	! t1_kref+0x4280:   	ld	[%i0 + 4], %f26
	.word	0xb1a6084e	! t1_kref+0x4284:   	faddd	%f24, %f14, %f24
	.word	0xa80cf188	! t1_kref+0x4288:   	and	%l3, -0xe78, %l4
	.word	0x878020d2	! t1_kref+0x428c:   	mov	0xd2, %asi
	.word	0x8143c000	! t1_kref+0x4290:   	stbar
	.word	0x989c8013	! t1_kref+0x4294:   	xorcc	%l2, %l3, %o4
	.word	0xaf702fd7	! t1_kref+0x4298:   	popc	0xfd7, %l7
	.word	0xe22e8019	! t1_kref+0x429c:   	stb	%l1, [%i2 + %i1]
	.word	0x9fc00004	! t1_kref+0x42a0:   	call	%g0 + %g4
	.word	0xef20a00c	! t1_kref+0x42a4:   	st	%f23, [%g2 + 0xc]
	.word	0x9614ef4b	! t1_kref+0x42a8:   	or	%l3, 0xf4b, %o3
	.word	0xb1a688cc	! t1_kref+0x42ac:   	fsubd	%f26, %f12, %f24
	.word	0xbda0111a	! t1_kref+0x42b0:   	fxtod	%f26, %f30
	.word	0x94140013	! t1_kref+0x42b4:   	or	%l0, %l3, %o2
	.word	0x001fffff	! t1_kref+0x42b8:   	illtrap	0x1fffff
	.word	0xe968a08f	! t1_kref+0x42bc:   	prefetch	%g2 + 0x8f, 20
	.word	0xa2d4a386	! t1_kref+0x42c0:   	umulcc	%l2, 0x386, %l1
	.word	0x8d840013	! t1_kref+0x42c4:   	wr	%l0, %l3, %fprs
	.word	0x96848011	! t1_kref+0x42c8:   	addcc	%l2, %l1, %o3
	.word	0xe22e2014	! t1_kref+0x42cc:   	stb	%l1, [%i0 + 0x14]
	.word	0xaba0052b	! t1_kref+0x42d0:   	fsqrts	%f11, %f21
	.word	0xa1b30e16	! t1_kref+0x42d4:   	fand	%f12, %f22, %f16
	.word	0x9bb6859e	! t1_kref+0x42d8:   	fcmpgt32	%f26, %f30, %o5
	.word	0xf9be5893	! t1_kref+0x42dc:   	stda	%f28, [%i1 + %l3]0xc4
	.word	0x31800003	! t1_kref+0x42e0:   	fba,a	_kref+0x42ec
	.word	0x93b48032	! t1_kref+0x42e4:   	edge8n	%l2, %l2, %o1
	.word	0xa9a00550	! t1_kref+0x42e8:   	fsqrtd	%f16, %f20
	.word	0xd920a004	! t1_kref+0x42ec:   	st	%f12, [%g2 + 4]
	.word	0x9fa38930	! t1_kref+0x42f0:   	fmuls	%f14, %f16, %f15
	.word	0xbda00558	! t1_kref+0x42f4:   	fsqrtd	%f24, %f30
	.word	0xf526200c	! t1_kref+0x42f8:   	st	%f26, [%i0 + 0xc]
	.word	0x80544011	! t1_kref+0x42fc:   	umul	%l1, %l1, %g0
	.word	0xc12e401c	! t1_kref+0x4300:   	st	%fsr, [%i1 + %i4]
	.word	0xe84e3fe1	! t1_kref+0x4304:   	ldsb	[%i0 - 0x1f], %l4
	.word	0xa93ca004	! t1_kref+0x4308:   	sra	%l2, 0x4, %l4
	.word	0xac947346	! t1_kref+0x430c:   	orcc	%l1, -0xcba, %l6
	.word	0xf1a6101c	! t1_kref+0x4310:   	sta	%f24, [%i0 + %i4]0x80
	.word	0xbdb007b6	! t1_kref+0x4314:   	fpackfix	%f22, %f30
	.word	0xa6c50014	! t1_kref+0x4318:   	addccc	%l4, %l4, %l3
	.word	0xacd50013	! t1_kref+0x431c:   	umulcc	%l4, %l3, %l6
	.word	0xaec48014	! t1_kref+0x4320:   	addccc	%l2, %l4, %l7
	.word	0x81dd65ed	! t1_kref+0x4324:   	flush	%l5 + 0x5ed
	.word	0xd210a034	! t1_kref+0x4328:   	lduh	[%g2 + 0x34], %o1
	.word	0xf7267fec	! t1_kref+0x432c:   	st	%f27, [%i1 - 0x14]
	.word	0xa4c50013	! t1_kref+0x4330:   	addccc	%l4, %l3, %l2
	.word	0x2d480005	! t1_kref+0x4334:   	fbg,a,pt	%fcc0, _kref+0x4348
	.word	0xa11c2100	! t1_kref+0x4338:   	tsubcctv	%l0, 0x100, %l0
	.word	0xa5b68a1c	! t1_kref+0x433c:   	fpadd16	%f26, %f28, %f18
	.word	0xa1b306da	! t1_kref+0x4340:   	fmul8sux16	%f12, %f26, %f16
	.word	0x81af0a56	! t1_kref+0x4344:   	fcmpd	%fcc0, %f28, %f22
	.word	0xa6f50010	! t1_kref+0x4348:   	udivcc	%l4, %l0, %l3
	.word	0xb9a4094e	! t1_kref+0x434c:   	fmuld	%f16, %f14, %f28
	.word	0xe43e401d	! t1_kref+0x4350:   	std	%l2, [%i1 + %i5]
	.word	0xe1be5a1d	! t1_kref+0x4354:   	stda	%f16, [%i1 + %i5]0xd0
	.word	0x99400000	! t1_kref+0x4358:   	mov	%y, %o4
	.word	0x97400000	! t1_kref+0x435c:   	mov	%y, %o3
	.word	0x968cc012	! t1_kref+0x4360:   	andcc	%l3, %l2, %o3
	.word	0xdb86101c	! t1_kref+0x4364:   	lda	[%i0 + %i4]0x80, %f13
	.word	0xada0055a	! t1_kref+0x4368:   	fsqrtd	%f26, %f22
	.word	0xe6280019	! t1_kref+0x436c:   	stb	%l3, [%g0 + %i1]
	.word	0x9da00556	! t1_kref+0x4370:   	fsqrtd	%f22, %f14
	.word	0xe4ee101a	! t1_kref+0x4374:   	ldstuba	[%i0 + %i2]0x80, %l2
	.word	0xa5250011	! t1_kref+0x4378:   	mulscc	%l4, %l1, %l2
	.word	0x95a3cd37	! t1_kref+0x437c:   	fsmuld	%f15, %f23, %f10
	.word	0x9fc00004	! t1_kref+0x4380:   	call	%g0 + %g4
	.word	0xa9400000	! t1_kref+0x4384:   	mov	%y, %l4
	.word	0xa80526c3	! t1_kref+0x4388:   	add	%l4, 0x6c3, %l4
	.word	0x95b009bb	! t1_kref+0x438c:   	fexpand	%f27, %f10
	.word	0xabb48280	! t1_kref+0x4390:   	array32	%l2, %g0, %l5
	.word	0x99a01918	! t1_kref+0x4394:   	fitod	%f24, %f12
	.word	0x27800008	! t1_kref+0x4398:   	fbul,a	_kref+0x43b8
	.word	0xd868a01f	! t1_kref+0x439c:   	ldstub	[%g2 + 0x1f], %o4
	.word	0xa5b40011	! t1_kref+0x43a0:   	edge8	%l0, %l1, %l2
	.word	0xc04e001a	! t1_kref+0x43a4:   	ldsb	[%i0 + %i2], %g0
	.word	0x81b01020	! t1_kref+0x43a8:   	siam	0x0
	.word	0xa5a0191c	! t1_kref+0x43ac:   	fitod	%f28, %f18
	.word	0x9fa00534	! t1_kref+0x43b0:   	fsqrts	%f20, %f15
	.word	0x9ba01a5a	! t1_kref+0x43b4:   	fdtoi	%f26, %f13
	.word	0xa82c0014	! t1_kref+0x43b8:   	andn	%l0, %l4, %l4
	.word	0xa8c43c8c	! t1_kref+0x43bc:   	addccc	%l0, -0x374, %l4
	.word	0xac3ce17a	! t1_kref+0x43c0:   	xnor	%l3, 0x17a, %l6
	.word	0x90544012	! t1_kref+0x43c4:   	umul	%l1, %l2, %o0
	.word	0x96dc4013	! t1_kref+0x43c8:   	smulcc	%l1, %l3, %o3
	.word	0xa9a4c9bc	! t1_kref+0x43cc:   	fdivs	%f19, %f28, %f20
	.word	0xfb20a01c	! t1_kref+0x43d0:   	st	%f29, [%g2 + 0x1c]
	.word	0xb9a3c8bc	! t1_kref+0x43d4:   	fsubs	%f15, %f28, %f28
	.word	0x9abd0012	! t1_kref+0x43d8:   	xnorcc	%l4, %l2, %o5
	.word	0x37480003	! t1_kref+0x43dc:   	fbge,a,pt	%fcc0, _kref+0x43e8
	.word	0xaab50011	! t1_kref+0x43e0:   	orncc	%l4, %l1, %l5
	.word	0xa5b00f33	! t1_kref+0x43e4:   	fsrc2s	%f19, %f18
	.word	0xbbb54d60	! t1_kref+0x43e8:   	fnot1s	%f21, %f29
	.word	0x80d463a5	! t1_kref+0x43ec:   	umulcc	%l1, 0x3a5, %g0
	.word	0x81b01021	! t1_kref+0x43f0:   	siam	0x1
	.word	0xe1266008	! t1_kref+0x43f4:   	st	%f16, [%i1 + 8]
	.word	0xada00554	! t1_kref+0x43f8:   	fsqrtd	%f20, %f22
	.word	0xa9a0191d	! t1_kref+0x43fc:   	fitod	%f29, %f20
	.word	0xae542efa	! t1_kref+0x4400:   	umul	%l0, 0xefa, %l7
	.word	0xd9be1853	! t1_kref+0x4404:   	stda	%f12, [%i0 + %l3]0xc2
	.word	0xa5a00552	! t1_kref+0x4408:   	fsqrtd	%f18, %f18
	.word	0xbda0111c	! t1_kref+0x440c:   	fxtod	%f28, %f30
	.word	0x29480005	! t1_kref+0x4410:   	fbl,a,pt	%fcc0, _kref+0x4424
	.word	0x922c3e7c	! t1_kref+0x4414:   	andn	%l0, -0x184, %o1
	.word	0x8143c000	! t1_kref+0x4418:   	stbar
	.word	0xe26e8019	! t1_kref+0x441c:   	ldstub	[%i2 + %i1], %l1
	.word	0x9444fb6a	! t1_kref+0x4420:   	addc	%l3, -0x496, %o2
	.word	0x2a480002	! t1_kref+0x4424:   	bcs,a,pt	%icc, _kref+0x442c
	.word	0xdd270018	! t1_kref+0x4428:   	st	%f14, [%i4 + %i0]
	.word	0x95b00c00	! t1_kref+0x442c:   	fzero	%f10
	.word	0xb1b00f10	! t1_kref+0x4430:   	fsrc2	%f16, %f24
	.word	0x35480005	! t1_kref+0x4434:   	fbue,a,pt	%fcc0, _kref+0x4448
	.word	0xa5a58930	! t1_kref+0x4438:   	fmuls	%f22, %f16, %f18
	.word	0x81dfc016	! t1_kref+0x443c:   	flush	%i7 + %l6
	.word	0x35480001	! t1_kref+0x4440:   	fbue,a,pt	%fcc0, _kref+0x4444
	.word	0x991c0011	! t1_kref+0x4444:   	tsubcctv	%l0, %l1, %o4
	.word	0x92140010	! t1_kref+0x4448:   	or	%l0, %l0, %o1
	.word	0xee40a014	! t1_kref+0x444c:   	ldsw	[%g2 + 0x14], %l7
	.word	0xaba0012b	! t1_kref+0x4450:   	fabss	%f11, %f21
	.word	0xe230a014	! t1_kref+0x4454:   	sth	%l1, [%g2 + 0x14]
	.word	0xa29cb1f1	! t1_kref+0x4458:   	xorcc	%l2, -0xe0f, %l1
	.word	0xa6c48013	! t1_kref+0x445c:   	addccc	%l2, %l3, %l3
	.word	0x9b3ce00e	! t1_kref+0x4460:   	sra	%l3, 0xe, %o5
	.word	0xb1a408bd	! t1_kref+0x4464:   	fsubs	%f16, %f29, %f24
	.word	0x97b4c240	! t1_kref+0x4468:   	array16	%l3, %g0, %o3
	.word	0x3f480004	! t1_kref+0x446c:   	fbo,a,pt	%fcc0, _kref+0x447c
	.word	0xd99e5a1c	! t1_kref+0x4470:   	ldda	[%i1 + %i4]0xd0, %f12
	.word	0xe0280018	! t1_kref+0x4474:   	stb	%l0, [%g0 + %i0]
	.word	0xb3a98034	! t1_kref+0x4478:   	fmovsg	%fcc0, %f20, %f25
	.word	0xac04c010	! t1_kref+0x447c:   	add	%l3, %l0, %l6
	.word	0x81850000	! t1_kref+0x4480:   	wr	%l4, %g0, %y
	.word	0x9da6885c	! t1_kref+0x4484:   	faddd	%f26, %f28, %f14
	.word	0x28480005	! t1_kref+0x4488:   	bleu,a,pt	%icc, _kref+0x449c
	.word	0x96acc014	! t1_kref+0x448c:   	andncc	%l3, %l4, %o3
	.word	0x9da000ce	! t1_kref+0x4490:   	fnegd	%f14, %f14
	.word	0x3f480007	! t1_kref+0x4494:   	fbo,a,pt	%fcc0, _kref+0x44b0
	.word	0x9f150014	! t1_kref+0x4498:   	taddcctv	%l4, %l4, %o7
	.word	0x81b68592	! t1_kref+0x449c:   	fcmpgt32	%f26, %f18, %g0
	.word	0xe650a006	! t1_kref+0x44a0:   	ldsh	[%g2 + 6], %l3
	.word	0xe2b61000	! t1_kref+0x44a4:   	stha	%l1, [%i0]0x80
	.word	0x9fc00004	! t1_kref+0x44a8:   	call	%g0 + %g4
	.word	0x81b01022	! t1_kref+0x44ac:   	siam	0x2
	.word	0xab144010	! t1_kref+0x44b0:   	taddcctv	%l1, %l0, %l5
	.word	0x81af0a5c	! t1_kref+0x44b4:   	fcmpd	%fcc0, %f28, %f28
	.word	0x81ab8ade	! t1_kref+0x44b8:   	fcmped	%fcc0, %f14, %f30
	.word	0xef68a00b	! t1_kref+0x44bc:   	prefetch	%g2 + 0xb, 23
	.word	0x99a018d4	! t1_kref+0x44c0:   	fdtos	%f20, %f12
	.word	0x99a0013a	! t1_kref+0x44c4:   	fabss	%f26, %f12
	.word	0xbda3894c	! t1_kref+0x44c8:   	fmuld	%f14, %f12, %f30
	.word	0xa7b500b2	! t1_kref+0x44cc:   	edge16n	%l4, %l2, %l3
	.word	0xe6264000	! t1_kref+0x44d0:   	st	%l3, [%i1]
	.word	0xe66e2000	! t1_kref+0x44d4:   	ldstub	[%i0], %l3
	.word	0x94a50010	! t1_kref+0x44d8:   	subcc	%l4, %l0, %o2
	.word	0xb1a60d3d	! t1_kref+0x44dc:   	fsmuld	%f24, %f29, %f24
	.word	0xacf47a39	! t1_kref+0x44e0:   	udivcc	%l1, -0x5c7, %l6
	.word	0xe7264000	! t1_kref+0x44e4:   	st	%f19, [%i1]
	.word	0x29800007	! t1_kref+0x44e8:   	fbl,a	_kref+0x4504
	.word	0xb1a54d32	! t1_kref+0x44ec:   	fsmuld	%f21, %f18, %f24
	.word	0x93400000	! t1_kref+0x44f0:   	mov	%y, %o1
	.word	0x99a0191c	! t1_kref+0x44f4:   	fitod	%f28, %f12
	.word	0xa72ce01a	! t1_kref+0x44f8:   	sll	%l3, 0x1a, %l3
	.word	0xd87e401c	! t1_kref+0x44fc:   	swap	[%i1 + %i4], %o4
	.word	0x9bb500f2	! t1_kref+0x4500:   	edge16ln	%l4, %l2, %o5
	.word	0x81ae0ab9	! t1_kref+0x4504:   	fcmpes	%fcc0, %f24, %f25
	.word	0xe3e61010	! t1_kref+0x4508:   	casa	[%i0]0x80, %l0, %l1
	.word	0x9274a3ac	! t1_kref+0x450c:   	udiv	%l2, 0x3ac, %o1
	.word	0xda0e4000	! t1_kref+0x4510:   	ldub	[%i1], %o5
	.word	0xa9a000bd	! t1_kref+0x4514:   	fnegs	%f29, %f20
	.word	0x86102004	! t1_kref+0x4518:   	mov	0x4, %g3
	.word	0x32800000	! t1_kref+0x451c:   	bne,a	_kref+0x451c
	.word	0x86a0e001	! t1_kref+0x4520:   	subcc	%g3, 1, %g3
	.word	0xb5a0055c	! t1_kref+0x4524:   	fsqrtd	%f28, %f26
	.word	0xb1b40f54	! t1_kref+0x4528:   	fornot1	%f16, %f20, %f24
	.word	0x9da01917	! t1_kref+0x452c:   	fitod	%f23, %f14
	.word	0xaa0cb69c	! t1_kref+0x4530:   	and	%l2, -0x964, %l5
	.word	0xd3e65010	! t1_kref+0x4534:   	casa	[%i1]0x80, %l0, %o1
	.word	0x90944012	! t1_kref+0x4538:   	orcc	%l1, %l2, %o0
	.word	0x9ebc8010	! t1_kref+0x453c:   	xnorcc	%l2, %l0, %o7
	.word	0x81ac0a3c	! t1_kref+0x4540:   	fcmps	%fcc0, %f16, %f28
	.word	0xe2280019	! t1_kref+0x4544:   	stb	%l1, [%g0 + %i1]
	.word	0xb7b38c73	! t1_kref+0x4548:   	fnors	%f14, %f19, %f27
	.word	0xe6a65000	! t1_kref+0x454c:   	sta	%l3, [%i1]0x80
	.word	0xe44e4000	! t1_kref+0x4550:   	ldsb	[%i1], %l2
	.word	0x86102004	! t1_kref+0x4554:   	mov	0x4, %g3
	.word	0x32800000	! t1_kref+0x4558:   	bne,a	_kref+0x4558
	.word	0x86a0e001	! t1_kref+0x455c:   	subcc	%g3, 1, %g3
	.word	0xb3a01a5a	! t1_kref+0x4560:   	fdtoi	%f26, %f25
	.word	0x86102019	! t1_kref+0x4564:   	mov	0x19, %g3
	.word	0x86a0e001	! t1_kref+0x4568:   	subcc	%g3, 1, %g3
	.word	0x22800003	! t1_kref+0x456c:   	be,a	_kref+0x4578
	.word	0x99a708ce	! t1_kref+0x4570:   	fsubd	%f28, %f14, %f12
	.word	0x9fb58590	! t1_kref+0x4574:   	fcmpgt32	%f22, %f16, %o7
	.word	0xa08c3318	! t1_kref+0x4578:   	andcc	%l0, -0xce8, %l0
	.word	0xaba0052d	! t1_kref+0x457c:   	fsqrts	%f13, %f21
	.word	0xada01056	! t1_kref+0x4580:   	fdtox	%f22, %f22
	.word	0x9a74c012	! t1_kref+0x4584:   	udiv	%l3, %l2, %o5
	.word	0x94ac0011	! t1_kref+0x4588:   	andncc	%l0, %l1, %o2
	.word	0xabb007b4	! t1_kref+0x458c:   	fpackfix	%f20, %f21
	.word	0xe8200019	! t1_kref+0x4590:   	st	%l4, [%g0 + %i1]
	.word	0x96d50013	! t1_kref+0x4594:   	umulcc	%l4, %l3, %o3
	.word	0x9da0055a	! t1_kref+0x4598:   	fsqrtd	%f26, %f14
	.word	0xc768a00a	! t1_kref+0x459c:   	prefetch	%g2 + 0xa, 3
	.word	0x942c8011	! t1_kref+0x45a0:   	andn	%l2, %l1, %o2
	.word	0x92943259	! t1_kref+0x45a4:   	orcc	%l0, -0xda7, %o1
	.word	0xb7a389b9	! t1_kref+0x45a8:   	fdivs	%f14, %f25, %f27
	.word	0x90bc0011	! t1_kref+0x45ac:   	xnorcc	%l0, %l1, %o0
	.word	0x81ad0ad8	! t1_kref+0x45b0:   	fcmped	%fcc0, %f20, %f24
	.word	0xa4c4fd22	! t1_kref+0x45b4:   	addccc	%l3, -0x2de, %l2
	.word	0x878020d0	! t1_kref+0x45b8:   	mov	0xd0, %asi
	.word	0xa23c2a1b	! t1_kref+0x45bc:   	xnor	%l0, 0xa1b, %l1
	.word	0xb5a3092e	! t1_kref+0x45c0:   	fmuls	%f12, %f14, %f26
	.word	0x2f800003	! t1_kref+0x45c4:   	fbu,a	_kref+0x45d0
	.word	0xa7a01892	! t1_kref+0x45c8:   	fitos	%f18, %f19
	.word	0x95a30d31	! t1_kref+0x45cc:   	fsmuld	%f12, %f17, %f10
	.word	0xb7a018d0	! t1_kref+0x45d0:   	fdtos	%f16, %f27
	.word	0xe0262018	! t1_kref+0x45d4:   	st	%l0, [%i0 + 0x18]
	.word	0xb3a00534	! t1_kref+0x45d8:   	fsqrts	%f20, %f25
	.word	0xd640a01c	! t1_kref+0x45dc:   	ldsw	[%g2 + 0x1c], %o3
	.word	0xe93e4000	! t1_kref+0x45e0:   	std	%f20, [%i1]
	.word	0xadb68f94	! t1_kref+0x45e4:   	for	%f26, %f20, %f22
	.word	0xa1a01917	! t1_kref+0x45e8:   	fitod	%f23, %f16
	.word	0xada3094a	! t1_kref+0x45ec:   	fmuld	%f12, %f10, %f22
	.word	0xa4340013	! t1_kref+0x45f0:   	orn	%l0, %l3, %l2
	.word	0xa8c47f0d	! t1_kref+0x45f4:   	addccc	%l1, -0xf3, %l4
	.word	0xa5b40a50	! t1_kref+0x45f8:   	fpadd32	%f16, %f16, %f18
	.word	0xa5b58752	! t1_kref+0x45fc:   	fpack32	%f22, %f18, %f18
	.word	0xaba3c8b1	! t1_kref+0x4600:   	fsubs	%f15, %f17, %f21
	.word	0xa9b00fe0	! t1_kref+0x4604:   	fones	%f20
	.word	0xe4c81018	! t1_kref+0x4608:   	ldsba	[%g0 + %i0]0x80, %l2
	.word	0xf720a01c	! t1_kref+0x460c:   	st	%f27, [%g2 + 0x1c]
	.word	0xa474ed12	! t1_kref+0x4610:   	udiv	%l3, 0xd12, %l2
	.word	0xed1e0000	! t1_kref+0x4614:   	ldd	[%i0], %f22
	.word	0xae540014	! t1_kref+0x4618:   	umul	%l0, %l4, %l7
	.word	0x23480007	! t1_kref+0x461c:   	fbne,a,pt	%fcc0, _kref+0x4638
	.word	0xa1a0055a	! t1_kref+0x4620:   	fsqrtd	%f26, %f16
	.word	0x99a0002d	! t1_kref+0x4624:   	fmovs	%f13, %f12
	.word	0x9da30850	! t1_kref+0x4628:   	faddd	%f12, %f16, %f14
	.word	0xec1e001d	! t1_kref+0x462c:   	ldd	[%i0 + %i5], %l6
	.word	0xa8f438e0	! t1_kref+0x4630:   	udivcc	%l0, -0x720, %l4
	.word	0x97a00137	! t1_kref+0x4634:   	fabss	%f23, %f11
	.word	0x81af4a32	! t1_kref+0x4638:   	fcmps	%fcc0, %f29, %f18
	.word	0x9b2c0014	! t1_kref+0x463c:   	sll	%l0, %l4, %o5
	.word	0xe0780019	! t1_kref+0x4640:   	swap	[%g0 + %i1], %l0
	.word	0xc1f61012	! t1_kref+0x4644:   	casxa	[%i0]0x80, %l2, %g0
	.word	0xa9b58732	! t1_kref+0x4648:   	fmuld8ulx16	%f22, %f18, %f20
	.word	0xadb3858e	! t1_kref+0x464c:   	fcmpgt32	%f14, %f14, %l6
	.word	0x94044011	! t1_kref+0x4650:   	add	%l1, %l1, %o2
	.word	0xac950010	! t1_kref+0x4654:   	orcc	%l4, %l0, %l6
	.word	0x95350013	! t1_kref+0x4658:   	srl	%l4, %l3, %o2
	.word	0xe4760000	! t1_kref+0x465c:   	stx	%l2, [%i0]
	.word	0x81ab8aae	! t1_kref+0x4660:   	fcmpes	%fcc0, %f14, %f14
	.word	0x99a01a4e	! t1_kref+0x4664:   	fdtoi	%f14, %f12
	.word	0x94bc7136	! t1_kref+0x4668:   	xnorcc	%l1, -0xeca, %o2
	.word	0xa8e40010	! t1_kref+0x466c:   	subccc	%l0, %l0, %l4
	.word	0xafa0052e	! t1_kref+0x4670:   	fsqrts	%f14, %f23
	.word	0x22480008	! t1_kref+0x4674:   	be,a,pt	%icc, _kref+0x4694
	.word	0xec6e8018	! t1_kref+0x4678:   	ldstub	[%i2 + %i0], %l6
	.word	0x97a00535	! t1_kref+0x467c:   	fsqrts	%f21, %f11
	.word	0xe968a083	! t1_kref+0x4680:   	prefetch	%g2 + 0x83, 20
	.word	0xa9400000	! t1_kref+0x4684:   	mov	%y, %l4
	.word	0xe51e6018	! t1_kref+0x4688:   	ldd	[%i1 + 0x18], %f18
	.word	0x81ac4a36	! t1_kref+0x468c:   	fcmps	%fcc0, %f17, %f22
	.word	0x81af4a34	! t1_kref+0x4690:   	fcmps	%fcc0, %f29, %f20
	.word	0x81ad8ada	! t1_kref+0x4694:   	fcmped	%fcc0, %f22, %f26
	.word	0x81ae0ad8	! t1_kref+0x4698:   	fcmped	%fcc0, %f24, %f24
	.word	0xb1b64c6e	! t1_kref+0x469c:   	fnors	%f25, %f14, %f24
	.word	0xa6148012	! t1_kref+0x46a0:   	or	%l2, %l2, %l3
	.word	0xb9a4493a	! t1_kref+0x46a4:   	fmuls	%f17, %f26, %f28
	.word	0xae443860	! t1_kref+0x46a8:   	addc	%l0, -0x7a0, %l7
	.word	0xc9ee1011	! t1_kref+0x46ac:   	prefetcha	%i0 + %l1, 4
	.word	0xb1a018d2	! t1_kref+0x46b0:   	fdtos	%f18, %f24
	.word	0x80f50011	! t1_kref+0x46b4:   	udivcc	%l4, %l1, %g0
	.word	0xa1b38678	! t1_kref+0x46b8:   	fmul8x16au	%f14, %f24, %f16
	.word	0xa1247c31	! t1_kref+0x46bc:   	mulscc	%l1, -0x3cf, %l0
	.word	0xd0100018	! t1_kref+0x46c0:   	lduh	[%g0 + %i0], %o0
	.word	0x9fc10000	! t1_kref+0x46c4:   	call	%g4
	.word	0x95a48958	! t1_kref+0x46c8:   	fmuld	%f18, %f24, %f10
	.word	0x99a00550	! t1_kref+0x46cc:   	fsqrtd	%f16, %f12
	.word	0x81ae4a39	! t1_kref+0x46d0:   	fcmps	%fcc0, %f25, %f25
	.word	0x9db00f18	! t1_kref+0x46d4:   	fsrc2	%f24, %f14
	.word	0x85840013	! t1_kref+0x46d8:   	wr	%l0, %l3, %ccr
	.word	0x81408000	! t1_kref+0x46dc:   	mov	%ccr, %g0
	.word	0xbdb48a18	! t1_kref+0x46e0:   	fpadd16	%f18, %f24, %f30
	.word	0xe82e4000	! t1_kref+0x46e4:   	stb	%l4, [%i1]
	.word	0x27480007	! t1_kref+0x46e8:   	fbul,a,pt	%fcc0, _kref+0x4704
	.word	0xfd1e2008	! t1_kref+0x46ec:   	ldd	[%i0 + 8], %f30
	.word	0x95400000	! t1_kref+0x46f0:   	mov	%y, %o2
	.word	0xa65d0010	! t1_kref+0x46f4:   	smul	%l4, %l0, %l3
	.word	0x8184c000	! t1_kref+0x46f8:   	wr	%l3, %g0, %y
	.word	0x94452871	! t1_kref+0x46fc:   	addc	%l4, 0x871, %o2
	.word	0xf19f1a18	! t1_kref+0x4700:   	ldda	[%i4 + %i0]0xd0, %f24
	.word	0x9e54ae3b	! t1_kref+0x4704:   	umul	%l2, 0xe3b, %o7
	.word	0xa2652e29	! t1_kref+0x4708:   	subc	%l4, 0xe29, %l1
	.word	0xb9a5c936	! t1_kref+0x470c:   	fmuls	%f23, %f22, %f28
	.word	0x8143e040	! t1_kref+0x4710:   	membar	0x40
	.word	0x9ef46be1	! t1_kref+0x4714:   	udivcc	%l1, 0xbe1, %o7
	.word	0xa3400000	! t1_kref+0x4718:   	mov	%y, %l1
	.word	0xaba00533	! t1_kref+0x471c:   	fsqrts	%f19, %f21
	.word	0x9db00f18	! t1_kref+0x4720:   	fsrc2	%f24, %f14
	.word	0xadb009ae	! t1_kref+0x4724:   	fexpand	%f14, %f22
	.word	0x9bb44152	! t1_kref+0x4728:   	edge32l	%l1, %l2, %o5
	.word	0x8d844010	! t1_kref+0x472c:   	wr	%l1, %l0, %fprs
	.word	0x8143c000	! t1_kref+0x4730:   	stbar
	.word	0xe2366014	! t1_kref+0x4734:   	sth	%l1, [%i1 + 0x14]
	.word	0x9efc8013	! t1_kref+0x4738:   	sdivcc	%l2, %l3, %o7
	.word	0x2738c3b8	! t1_kref+0x473c:   	sethi	%hi(0xe30ee000), %l3
	.word	0xa85d2d14	! t1_kref+0x4740:   	smul	%l4, 0xd14, %l4
	.word	0xd1be9a19	! t1_kref+0x4744:   	stda	%f8, [%i2 + %i1]0xd0
	.word	0xae44bd0c	! t1_kref+0x4748:   	addc	%l2, -0x2f4, %l7
	.word	0x95b3850e	! t1_kref+0x474c:   	fcmpgt16	%f14, %f14, %o2
	.word	0xdf00a004	! t1_kref+0x4750:   	ld	[%g2 + 4], %f15
	.word	0x99a609d0	! t1_kref+0x4754:   	fdivd	%f24, %f16, %f12
	.word	0xa3a3c8b5	! t1_kref+0x4758:   	fsubs	%f15, %f21, %f17
	.word	0xa9a0015c	! t1_kref+0x475c:   	fabsd	%f28, %f20
	.word	0xa0bcc012	! t1_kref+0x4760:   	xnorcc	%l3, %l2, %l0
	.word	0xbba0053b	! t1_kref+0x4764:   	fsqrts	%f27, %f29
	.word	0xaa1c3632	! t1_kref+0x4768:   	xor	%l0, -0x9ce, %l5
	sethi	%hi(2f), %o7
	.word	0xe40be398	! t1_kref+0x4770:   	ldub	[%o7 + 0x398], %l2
	.word	0xa41ca00c	! t1_kref+0x4774:   	xor	%l2, 0xc, %l2
	.word	0xe42be398	! t1_kref+0x4778:   	stb	%l2, [%o7 + 0x398]
	.word	0x81dbe398	! t1_kref+0x477c:   	flush	%o7 + 0x398
	.word	0x99400000	! t1_kref+0x4780:   	mov	%y, %o4
	.word	0x9da0013a	! t1_kref+0x4784:   	fabss	%f26, %f14
	.word	0xd1e61014	! t1_kref+0x4788:   	casa	[%i0]0x80, %l4, %o0
	.word	0x953c8012	! t1_kref+0x478c:   	sra	%l2, %l2, %o2
	.word	0x96b4b583	! t1_kref+0x4790:   	orncc	%l2, -0xa7d, %o3
	.word	0xb5a5cd2d	! t1_kref+0x4794:   	fsmuld	%f23, %f13, %f26
2:	.word	0x93350011	! t1_kref+0x4798:   	srl	%l4, %l1, %o1
	.word	0xa2450012	! t1_kref+0x479c:   	addc	%l4, %l2, %l1
	.word	0x9f340010	! t1_kref+0x47a0:   	srl	%l0, %l0, %o7
	.word	0xa4350012	! t1_kref+0x47a4:   	orn	%l4, %l2, %l2
	.word	0xe0262018	! t1_kref+0x47a8:   	st	%l0, [%i0 + 0x18]
	.word	0x81ab8ad8	! t1_kref+0x47ac:   	fcmped	%fcc0, %f14, %f24
	.word	0xa9b5048e	! t1_kref+0x47b0:   	fcmple32	%f20, %f14, %l4
	.word	0x98c5339f	! t1_kref+0x47b4:   	addccc	%l4, -0xc61, %o4
	.word	0xb1a00550	! t1_kref+0x47b8:   	fsqrtd	%f16, %f24
	.word	0xa7a00135	! t1_kref+0x47bc:   	fabss	%f21, %f19
	.word	0xf91f4018	! t1_kref+0x47c0:   	ldd	[%i5 + %i0], %f28
	.word	0x953d2011	! t1_kref+0x47c4:   	sra	%l4, 0x11, %o2
	.word	0x81dd8012	! t1_kref+0x47c8:   	flush	%l6 + %l2
	.word	0xd4780019	! t1_kref+0x47cc:   	swap	[%g0 + %i1], %o2
	.word	0xec16c018	! t1_kref+0x47d0:   	lduh	[%i3 + %i0], %l6
	.word	0xe11fbef0	! t1_kref+0x47d4:   	ldd	[%fp - 0x110], %f16
	.word	0xac343335	! t1_kref+0x47d8:   	orn	%l0, -0xccb, %l6
	.word	0x38800001	! t1_kref+0x47dc:   	bgu,a	_kref+0x47e0
	.word	0x90542f13	! t1_kref+0x47e0:   	umul	%l0, 0xf13, %o0
	.word	0x25800001	! t1_kref+0x47e4:   	fblg,a	_kref+0x47e8
	.word	0x95b4c151	! t1_kref+0x47e8:   	edge32l	%l3, %l1, %o2
	.word	0xe8262004	! t1_kref+0x47ec:   	st	%l4, [%i0 + 4]
	.word	0xb5b346be	! t1_kref+0x47f0:   	fmul8x16al	%f13, %f30, %f26
	.word	0x9ac4c010	! t1_kref+0x47f4:   	addccc	%l3, %l0, %o5
	.word	0x98bd0011	! t1_kref+0x47f8:   	xnorcc	%l4, %l1, %o4
	.word	0xa9a6884c	! t1_kref+0x47fc:   	faddd	%f26, %f12, %f20
	.word	0xe6280018	! t1_kref+0x4800:   	stb	%l3, [%g0 + %i0]
	.word	0xe47e6014	! t1_kref+0x4804:   	swap	[%i1 + 0x14], %l2
	.word	0x9ea4c013	! t1_kref+0x4808:   	subcc	%l3, %l3, %o7
	.word	0xa485307b	! t1_kref+0x480c:   	addcc	%l4, -0xf85, %l2
	.word	0xa7a00031	! t1_kref+0x4810:   	fmovs	%f17, %f19
	.word	0xbda00554	! t1_kref+0x4814:   	fsqrtd	%f20, %f30
	.word	0xae5469ce	! t1_kref+0x4818:   	umul	%l1, 0x9ce, %l7
	.word	0xa694fdf4	! t1_kref+0x481c:   	orcc	%l3, -0x20c, %l3
	.word	0xb9a000bb	! t1_kref+0x4820:   	fnegs	%f27, %f28
	.word	0xd41e3fe8	! t1_kref+0x4824:   	ldd	[%i0 - 0x18], %o2
	.word	0xef20a03c	! t1_kref+0x4828:   	st	%f23, [%g2 + 0x3c]
	.word	0x81aeca37	! t1_kref+0x482c:   	fcmps	%fcc0, %f27, %f23
	.word	0xa1b6c66f	! t1_kref+0x4830:   	fmul8x16au	%f27, %f15, %f16
	.word	0xada00554	! t1_kref+0x4834:   	fsqrtd	%f20, %f22
	.word	0x30800002	! t1_kref+0x4838:   	ba,a	_kref+0x4840
	.word	0x9db5074e	! t1_kref+0x483c:   	fpack32	%f20, %f14, %f14
	.word	0x95b00fc0	! t1_kref+0x4840:   	fone	%f10
	.word	0xa5b4c090	! t1_kref+0x4844:   	edge16	%l3, %l0, %l2
	.word	0x99b5848c	! t1_kref+0x4848:   	fcmple32	%f22, %f12, %o4
	.word	0x81ae0a4e	! t1_kref+0x484c:   	fcmpd	%fcc0, %f24, %f14
	.word	0x86102009	! t1_kref+0x4850:   	mov	0x9, %g3
	.word	0x86a0e001	! t1_kref+0x4854:   	subcc	%g3, 1, %g3
	.word	0x22800016	! t1_kref+0x4858:   	be,a	_kref+0x48b0
	.word	0x92c43935	! t1_kref+0x485c:   	addccc	%l0, -0x6cb, %o1
	.word	0xea100018	! t1_kref+0x4860:   	lduh	[%g0 + %i0], %l5
	.word	0x9014a195	! t1_kref+0x4864:   	or	%l2, 0x195, %o0
	.word	0xf3063ff0	! t1_kref+0x4868:   	ld	[%i0 - 0x10], %f25
	.word	0xb1b58f8e	! t1_kref+0x486c:   	for	%f22, %f14, %f24
	.word	0x81dca458	! t1_kref+0x4870:   	flush	%l2 + 0x458
	.word	0x9fa0012d	! t1_kref+0x4874:   	fabss	%f13, %f15
	.word	0x9ef4b103	! t1_kref+0x4878:   	udivcc	%l2, -0xefd, %o7
	.word	0xc807bfe4	! t1_kref+0x487c:   	ld	[%fp - 0x1c], %g4
	.word	0x900c8013	! t1_kref+0x4880:   	and	%l2, %l3, %o0
	.word	0x9ba018d8	! t1_kref+0x4884:   	fdtos	%f24, %f13
	.word	0xa71c8010	! t1_kref+0x4888:   	tsubcctv	%l2, %l0, %l3
	.word	0x91408000	! t1_kref+0x488c:   	mov	%ccr, %o0
	.word	0xe27f0018	! t1_kref+0x4890:   	swap	[%i4 + %i0], %l1
	.word	0x94ad216e	! t1_kref+0x4894:   	andncc	%l4, 0x16e, %o2
	.word	0x98f43dc8	! t1_kref+0x4898:   	udivcc	%l0, -0x238, %o4
	.word	0x23bfffee	! t1_kref+0x489c:   	fbne,a	_kref+0x4854
	.word	0xa6acc013	! t1_kref+0x48a0:   	andncc	%l3, %l3, %l3
	.word	0x801c78da	! t1_kref+0x48a4:   	xor	%l1, -0x726, %g0
	.word	0xa9a0013a	! t1_kref+0x48a8:   	fabss	%f26, %f20
	.word	0xa83c2067	! t1_kref+0x48ac:   	xnor	%l0, 0x67, %l4
	.word	0x39480002	! t1_kref+0x48b0:   	fbuge,a,pt	%fcc0, _kref+0x48b8
	.word	0x9ef48011	! t1_kref+0x48b4:   	udivcc	%l2, %l1, %o7
	.word	0xa5a018d8	! t1_kref+0x48b8:   	fdtos	%f24, %f18
	.word	0x99a00137	! t1_kref+0x48bc:   	fabss	%f23, %f12
	.word	0xd9064000	! t1_kref+0x48c0:   	ld	[%i1], %f12
	.word	0xf007bfe0	! t1_kref+0x48c4:   	ld	[%fp - 0x20], %i0
	.word	0x923c8013	! t1_kref+0x48c8:   	xnor	%l2, %l3, %o1
	.word	0xe228a01c	! t1_kref+0x48cc:   	stb	%l1, [%g2 + 0x1c]
	.word	0x9fa0053b	! t1_kref+0x48d0:   	fsqrts	%f27, %f15
	.word	0xa9a2cd3b	! t1_kref+0x48d4:   	fsmuld	%f11, %f27, %f20
	.word	0xbba308bb	! t1_kref+0x48d8:   	fsubs	%f12, %f27, %f29
	.word	0xa2846616	! t1_kref+0x48dc:   	addcc	%l1, 0x616, %l1
	.word	0x99a00554	! t1_kref+0x48e0:   	fsqrtd	%f20, %f12
	.word	0xb1b60d0c	! t1_kref+0x48e4:   	fandnot1	%f24, %f12, %f24
	.word	0xa4c5294f	! t1_kref+0x48e8:   	addccc	%l4, 0x94f, %l2
	.word	0x9fc00004	! t1_kref+0x48ec:   	call	%g0 + %g4
	.word	0xe2262014	! t1_kref+0x48f0:   	st	%l1, [%i0 + 0x14]
	.word	0xa4ac4011	! t1_kref+0x48f4:   	andncc	%l1, %l1, %l2
	.word	0x3a800007	! t1_kref+0x48f8:   	bcc,a	_kref+0x4914
	.word	0xafb7058e	! t1_kref+0x48fc:   	fcmpgt32	%f28, %f14, %l7
	.word	0x9a144011	! t1_kref+0x4900:   	or	%l1, %l1, %o5
	.word	0xe82e4000	! t1_kref+0x4904:   	stb	%l4, [%i1]
	.word	0xa29c8013	! t1_kref+0x4908:   	xorcc	%l2, %l3, %l1
	.word	0xe5180019	! t1_kref+0x490c:   	ldd	[%g0 + %i1], %f18
	.word	0x99a00552	! t1_kref+0x4910:   	fsqrtd	%f18, %f12
	.word	0x3d480007	! t1_kref+0x4914:   	fbule,a,pt	%fcc0, _kref+0x4930
	.word	0xa5a289da	! t1_kref+0x4918:   	fdivd	%f10, %f26, %f18
	.word	0xe028a034	! t1_kref+0x491c:   	stb	%l0, [%g2 + 0x34]
	.word	0xa1b5462c	! t1_kref+0x4920:   	fmul8x16	%f21, %f12, %f16
	.word	0xa4f48011	! t1_kref+0x4924:   	udivcc	%l2, %l1, %l2
	.word	0xe26e3fe9	! t1_kref+0x4928:   	ldstub	[%i0 - 0x17], %l1
	.word	0x001fffff	! t1_kref+0x492c:   	illtrap	0x1fffff
	.word	0x81ae4ab3	! t1_kref+0x4930:   	fcmpes	%fcc0, %f25, %f19
	.word	0xdd1e6018	! t1_kref+0x4934:   	ldd	[%i1 + 0x18], %f14
	.word	0xe2280018	! t1_kref+0x4938:   	stb	%l1, [%g0 + %i0]
	.word	0xd0164000	! t1_kref+0x493c:   	lduh	[%i1], %o0
	.word	0xa6a50013	! t1_kref+0x4940:   	subcc	%l4, %l3, %l3
	.word	0x9da0012b	! t1_kref+0x4944:   	fabss	%f11, %f14
	.word	0xfd1e401d	! t1_kref+0x4948:   	ldd	[%i1 + %i5], %f30
	.word	0x9da34d3b	! t1_kref+0x494c:   	fsmuld	%f13, %f27, %f14
	.word	0xc807bfe4	! t1_kref+0x4950:   	ld	[%fp - 0x1c], %g4
	.word	0xf93e6018	! t1_kref+0x4954:   	std	%f28, [%i1 + 0x18]
	.word	0xa4c50011	! t1_kref+0x4958:   	addccc	%l4, %l1, %l2
	.word	0xaf400000	! t1_kref+0x495c:   	mov	%y, %l7
	.word	0x96fcecfe	! t1_kref+0x4960:   	sdivcc	%l3, 0xcfe, %o3
	.word	0x92a4ec6a	! t1_kref+0x4964:   	subcc	%l3, 0xc6a, %o1
	.word	0xf51fbe08	! t1_kref+0x4968:   	ldd	[%fp - 0x1f8], %f26
	.word	0x9db306d0	! t1_kref+0x496c:   	fmul8sux16	%f12, %f16, %f14
	.word	0x99a0053a	! t1_kref+0x4970:   	fsqrts	%f26, %f12
	.word	0x9fc10000	! t1_kref+0x4974:   	call	%g4
	.word	0xa11d3fd4	! t1_kref+0x4978:   	tsubcctv	%l4, -0x2c, %l0
	.word	0xada01915	! t1_kref+0x497c:   	fitod	%f21, %f22
	.word	0x973ca010	! t1_kref+0x4980:   	sra	%l2, 0x10, %o3
	.word	0xef68a00e	! t1_kref+0x4984:   	prefetch	%g2 + 0xe, 23
	.word	0x81b01027	! t1_kref+0x4988:   	siam	0x7
	.word	0x9e34c014	! t1_kref+0x498c:   	orn	%l3, %l4, %o7
	.word	0x9f414000	! t1_kref+0x4990:   	mov	%pc, %o7
	.word	0xb9a28856	! t1_kref+0x4994:   	faddd	%f10, %f22, %f28
	.word	0xa7b68af7	! t1_kref+0x4998:   	fpsub32s	%f26, %f23, %f19
	.word	0xa9a389dc	! t1_kref+0x499c:   	fdivd	%f14, %f28, %f20
	.word	0xf11e2000	! t1_kref+0x49a0:   	ldd	[%i0], %f24
	.word	0xd86e3fe6	! t1_kref+0x49a4:   	ldstub	[%i0 - 0x1a], %o4
	.word	0xf91fbd70	! t1_kref+0x49a8:   	ldd	[%fp - 0x290], %f28
	.word	0x9db386d8	! t1_kref+0x49ac:   	fmul8sux16	%f14, %f24, %f14
	.word	0xa5b746af	! t1_kref+0x49b0:   	fmul8x16al	%f29, %f15, %f18
	.word	0x97a0052c	! t1_kref+0x49b4:   	fsqrts	%f12, %f11
	.word	0x95400000	! t1_kref+0x49b8:   	mov	%y, %o2
	.word	0xa635355a	! t1_kref+0x49bc:   	orn	%l4, -0xaa6, %l3
	.word	0xc07f0018	! t1_kref+0x49c0:   	swap	[%i4 + %i0], %g0
	.word	0x81dc001b	! t1_kref+0x49c4:   	flush	%l0 + %i3
	.word	0xe47e2004	! t1_kref+0x49c8:   	swap	[%i0 + 4], %l2
	.word	0xa9b3c6be	! t1_kref+0x49cc:   	fmul8x16al	%f15, %f30, %f20
	.word	0x953d0011	! t1_kref+0x49d0:   	sra	%l4, %l1, %o2
	.word	0x94948012	! t1_kref+0x49d4:   	orcc	%l2, %l2, %o2
	.word	0xb9a3085c	! t1_kref+0x49d8:   	faddd	%f12, %f28, %f28
	.word	0xada589bb	! t1_kref+0x49dc:   	fdivs	%f22, %f27, %f22
	.word	0xc568a006	! t1_kref+0x49e0:   	prefetch	%g2 + 6, 2
	.word	0xb5a000ce	! t1_kref+0x49e4:   	fnegd	%f14, %f26
	.word	0xa60c7de2	! t1_kref+0x49e8:   	and	%l1, -0x21e, %l3
	.word	0xac3ca2ca	! t1_kref+0x49ec:   	xnor	%l2, 0x2ca, %l6
	.word	0xb5b38f9a	! t1_kref+0x49f0:   	for	%f14, %f26, %f26
	.word	0xdd1e0000	! t1_kref+0x49f4:   	ldd	[%i0], %f14
	.word	0x81adcab5	! t1_kref+0x49f8:   	fcmpes	%fcc0, %f23, %f21
	.word	0xb5b6875a	! t1_kref+0x49fc:   	fpack32	%f26, %f26, %f26
	.word	0x97a0002e	! t1_kref+0x4a00:   	fmovs	%f14, %f11
	.word	0x8143e017	! t1_kref+0x4a04:   	membar	0x17
	.word	0x9da00035	! t1_kref+0x4a08:   	fmovs	%f21, %f14
	.word	0x2d480006	! t1_kref+0x4a0c:   	fbg,a,pt	%fcc0, _kref+0x4a24
	.word	0xa1a00558	! t1_kref+0x4a10:   	fsqrtd	%f24, %f16
	.word	0xae9cbf4e	! t1_kref+0x4a14:   	xorcc	%l2, -0xb2, %l7
	.word	0xadb34a79	! t1_kref+0x4a18:   	fpadd32s	%f13, %f25, %f22
	.word	0x99a00534	! t1_kref+0x4a1c:   	fsqrts	%f20, %f12
	.word	0xbda5c92c	! t1_kref+0x4a20:   	fmuls	%f23, %f12, %f30
	.word	0xf1be5a1c	! t1_kref+0x4a24:   	stda	%f24, [%i1 + %i4]0xd0
	.word	0x29480004	! t1_kref+0x4a28:   	fbl,a,pt	%fcc0, _kref+0x4a38
	.word	0x9ba0052e	! t1_kref+0x4a2c:   	fsqrts	%f14, %f13
	.word	0x81b01020	! t1_kref+0x4a30:   	siam	0x0
	.word	0xa9a00558	! t1_kref+0x4a34:   	fsqrtd	%f24, %f20
	.word	0xe5f65014	! t1_kref+0x4a38:   	casxa	[%i1]0x80, %l4, %l2
	.word	0xace5238c	! t1_kref+0x4a3c:   	subccc	%l4, 0x38c, %l6
	.word	0x91400000	! t1_kref+0x4a40:   	mov	%y, %o0
	.word	0xbda00134	! t1_kref+0x4a44:   	fabss	%f20, %f30
	.word	0xe5263ff4	! t1_kref+0x4a48:   	st	%f18, [%i0 - 0xc]
	.word	0xa9a00558	! t1_kref+0x4a4c:   	fsqrtd	%f24, %f20
	.word	0x3f800005	! t1_kref+0x4a50:   	fbo,a	_kref+0x4a64
	.word	0x80c4a498	! t1_kref+0x4a54:   	addccc	%l2, 0x498, %g0
	.word	0xa3b2cc6b	! t1_kref+0x4a58:   	fnors	%f11, %f11, %f17
	.word	0x25480002	! t1_kref+0x4a5c:   	fblg,a,pt	%fcc0, _kref+0x4a64
	.word	0xac0523fc	! t1_kref+0x4a60:   	add	%l4, 0x3fc, %l6
	.word	0xa5b58ddc	! t1_kref+0x4a64:   	fnand	%f22, %f28, %f18
	.word	0x94b46740	! t1_kref+0x4a68:   	orncc	%l1, 0x740, %o2
	.word	0xc368a0cf	! t1_kref+0x4a6c:   	prefetch	%g2 + 0xcf, 1
	.word	0xac8d33be	! t1_kref+0x4a70:   	andcc	%l4, -0xc42, %l6
	.word	0x81840000	! t1_kref+0x4a74:   	wr	%l0, %g0, %y
	.word	0x9de3bfa0	! t1_kref+0x4a78:   	save	%sp, -0x60, %sp
	.word	0x95e80018	! t1_kref+0x4a7c:   	restore	%g0, %i0, %o2
	.word	0xea6e600d	! t1_kref+0x4a80:   	ldstub	[%i1 + 0xd], %l5
	.word	0x9bb6caee	! t1_kref+0x4a84:   	fpsub32s	%f27, %f14, %f13
	.word	0x99b00fc0	! t1_kref+0x4a88:   	fone	%f12
	.word	0x29480001	! t1_kref+0x4a8c:   	fbl,a,pt	%fcc0, _kref+0x4a90
	.word	0xdd20a00c	! t1_kref+0x4a90:   	st	%f14, [%g2 + 0xc]
	.word	0xf11f4018	! t1_kref+0x4a94:   	ldd	[%i5 + %i0], %f24
	.word	0xf83f4019	! t1_kref+0x4a98:   	std	%i4, [%i5 + %i1]
	.word	0x97a01a52	! t1_kref+0x4a9c:   	fdtoi	%f18, %f11
	.word	0xa52c0013	! t1_kref+0x4aa0:   	sll	%l0, %l3, %l2
	.word	0x2f333162	! t1_kref+0x4aa4:   	sethi	%hi(0xccc58800), %l7
	.word	0xacc50014	! t1_kref+0x4aa8:   	addccc	%l4, %l4, %l6
	.word	0x9da00550	! t1_kref+0x4aac:   	fsqrtd	%f16, %f14
	.word	0xe1be5853	! t1_kref+0x4ab0:   	stda	%f16, [%i1 + %l3]0xc2
	.word	0xa1b44132	! t1_kref+0x4ab4:   	edge32n	%l1, %l2, %l0
	.word	0xa8a48010	! t1_kref+0x4ab8:   	subcc	%l2, %l0, %l4
	.word	0x878020f0	! t1_kref+0x4abc:   	mov	0xf0, %asi
	.word	0xa9b78d1e	! t1_kref+0x4ac0:   	fandnot1	%f30, %f30, %f20
	.word	0xe3b8a100	! t1_kref+0x4ac4:   	stda	%f48, [%g2 + 0x100]%asi
	.word	0xa5a00554	! t1_kref+0x4ac8:   	fsqrtd	%f20, %f18
	.word	0xa6bd3244	! t1_kref+0x4acc:   	xnorcc	%l4, -0xdbc, %l3
	.word	0xae548013	! t1_kref+0x4ad0:   	umul	%l2, %l3, %l7
	.word	0x927c4012	! t1_kref+0x4ad4:   	sdiv	%l1, %l2, %o1
	.word	0x95b30ed2	! t1_kref+0x4ad8:   	fornot2	%f12, %f18, %f10
	.word	0xda566014	! t1_kref+0x4adc:   	ldsh	[%i1 + 0x14], %o5
	.word	0xe826601c	! t1_kref+0x4ae0:   	st	%l4, [%i1 + 0x1c]
	.word	0x9a5d3804	! t1_kref+0x4ae4:   	smul	%l4, -0x7fc, %o5
	.word	0xc398a0c0	! t1_kref+0x4ae8:   	ldda	[%g2 + 0xc0]%asi, %f32
	.word	0x81ab0ace	! t1_kref+0x4aec:   	fcmped	%fcc0, %f12, %f14
	.word	0x8143c000	! t1_kref+0x4af0:   	stbar
	.word	0x81b40050	! t1_kref+0x4af4:   	edge8l	%l0, %l0, %g0
	.word	0x932c4011	! t1_kref+0x4af8:   	sll	%l1, %l1, %o1
	.word	0xada00552	! t1_kref+0x4afc:   	fsqrtd	%f18, %f22
	.word	0x151042b1	! t1_kref+0x4b00:   	sethi	%hi(0x410ac400), %o2
	.word	0xa9b58f9a	! t1_kref+0x4b04:   	for	%f22, %f26, %f20
	.word	0xd81e3fe8	! t1_kref+0x4b08:   	ldd	[%i0 - 0x18], %o4
	.word	0xe320a004	! t1_kref+0x4b0c:   	st	%f17, [%g2 + 4]
	.word	0x9fc00004	! t1_kref+0x4b10:   	call	%g0 + %g4
	.word	0xf138001d	! t1_kref+0x4b14:   	std	%f24, [%g0 + %i5]
	.word	0xf91fbd70	! t1_kref+0x4b18:   	ldd	[%fp - 0x290], %f28
	.word	0x901c0010	! t1_kref+0x4b1c:   	xor	%l0, %l0, %o0
	.word	0xe6263ffc	! t1_kref+0x4b20:   	st	%l3, [%i0 - 4]
	.word	0xa90c29eb	! t1_kref+0x4b24:   	tsubcc	%l0, 0x9eb, %l4
	.word	0xee4e201b	! t1_kref+0x4b28:   	ldsb	[%i0 + 0x1b], %l7
	.word	0x2b480004	! t1_kref+0x4b2c:   	fbug,a,pt	%fcc0, _kref+0x4b3c
	.word	0xb9a0052e	! t1_kref+0x4b30:   	fsqrts	%f14, %f28
	.word	0x9694f0c1	! t1_kref+0x4b34:   	orcc	%l3, -0xf3f, %o3
	.word	0xe3b8a100	! t1_kref+0x4b38:   	stda	%f48, [%g2 + 0x100]%asi
	.word	0xb5a389da	! t1_kref+0x4b3c:   	fdivd	%f14, %f26, %f26
	.word	0xaa5cbc29	! t1_kref+0x4b40:   	smul	%l2, -0x3d7, %l5
	.word	0xda48a034	! t1_kref+0x4b44:   	ldsb	[%g2 + 0x34], %o5
	.word	0x81ad0ad4	! t1_kref+0x4b48:   	fcmped	%fcc0, %f20, %f20
	.word	0x902cc013	! t1_kref+0x4b4c:   	andn	%l3, %l3, %o0
	.word	0xb9a0054c	! t1_kref+0x4b50:   	fsqrtd	%f12, %f28
	.word	0xa884c013	! t1_kref+0x4b54:   	addcc	%l3, %l3, %l4
	.word	0xa6b4ecf7	! t1_kref+0x4b58:   	orncc	%l3, 0xcf7, %l3
	.word	0xf520a024	! t1_kref+0x4b5c:   	st	%f26, [%g2 + 0x24]
	.word	0xa3b44332	! t1_kref+0x4b60:   	bmask	%l1, %l2, %l1
	.word	0x9f1c0013	! t1_kref+0x4b64:   	tsubcctv	%l0, %l3, %o7
	.word	0xb9b2caef	! t1_kref+0x4b68:   	fpsub32s	%f11, %f15, %f28
	.word	0xa20d3b53	! t1_kref+0x4b6c:   	and	%l4, -0x4ad, %l1
	.word	0xbda000ba	! t1_kref+0x4b70:   	fnegs	%f26, %f30
	.word	0x97b40031	! t1_kref+0x4b74:   	edge8n	%l0, %l1, %o3
	.word	0x8143c000	! t1_kref+0x4b78:   	stbar
	.word	0xd9be5000	! t1_kref+0x4b7c:   	stda	%f12, [%i1]0x80
	.word	0x81ae0acc	! t1_kref+0x4b80:   	fcmped	%fcc0, %f24, %f12
	.word	0xda500019	! t1_kref+0x4b84:   	ldsh	[%g0 + %i1], %o5
	.word	0x92e44014	! t1_kref+0x4b88:   	subccc	%l1, %l4, %o1
	.word	0x97400000	! t1_kref+0x4b8c:   	mov	%y, %o3
	.word	0xae3d2f08	! t1_kref+0x4b90:   	xnor	%l4, 0xf08, %l7
	.word	0xabb58dba	! t1_kref+0x4b94:   	fxors	%f22, %f26, %f21
	.word	0x9e04c010	! t1_kref+0x4b98:   	add	%l3, %l0, %o7
	.word	0xf5067ff4	! t1_kref+0x4b9c:   	ld	[%i1 - 0xc], %f26
	.word	0x9f24fd9e	! t1_kref+0x4ba0:   	mulscc	%l3, -0x262, %o7
	.word	0x94fc36b2	! t1_kref+0x4ba4:   	sdivcc	%l0, -0x94e, %o2
	.word	0x86102002	! t1_kref+0x4ba8:   	mov	0x2, %g3
	.word	0x32800000	! t1_kref+0x4bac:   	bne,a	_kref+0x4bac
	.word	0x86a0e001	! t1_kref+0x4bb0:   	subcc	%g3, 1, %g3
	.word	0xa3348013	! t1_kref+0x4bb4:   	srl	%l2, %l3, %l1
	.word	0x9e452c38	! t1_kref+0x4bb8:   	addc	%l4, 0xc38, %o7
	.word	0xd9be1853	! t1_kref+0x4bbc:   	stda	%f12, [%i0 + %l3]0xc2
	.word	0xa01caefc	! t1_kref+0x4bc0:   	xor	%l2, 0xefc, %l0
	.word	0x925cc012	! t1_kref+0x4bc4:   	smul	%l3, %l2, %o1
	.word	0xd93e0000	! t1_kref+0x4bc8:   	std	%f12, [%i0]
	.word	0x993cc010	! t1_kref+0x4bcc:   	sra	%l3, %l0, %o4
	.word	0x9e2d0012	! t1_kref+0x4bd0:   	andn	%l4, %l2, %o7
	.word	0xc368a044	! t1_kref+0x4bd4:   	prefetch	%g2 + 0x44, 1
	.word	0x81ae0acc	! t1_kref+0x4bd8:   	fcmped	%fcc0, %f24, %f12
	.word	0xb9a4c937	! t1_kref+0x4bdc:   	fmuls	%f19, %f23, %f28
	.word	0xbdb60dcc	! t1_kref+0x4be0:   	fnand	%f24, %f12, %f30
	.word	0x9efc8010	! t1_kref+0x4be4:   	sdivcc	%l2, %l0, %o7
	.word	0xb7a609b0	! t1_kref+0x4be8:   	fdivs	%f24, %f16, %f27
	.word	0x23480008	! t1_kref+0x4bec:   	fbne,a,pt	%fcc0, _kref+0x4c0c
	.word	0xe3b8a100	! t1_kref+0x4bf0:   	stda	%f48, [%g2 + 0x100]%asi
	.word	0xa1b5c636	! t1_kref+0x4bf4:   	fmul8x16	%f23, %f22, %f16
	.word	0x80344013	! t1_kref+0x4bf8:   	orn	%l1, %l3, %g0
	.word	0xa28d0014	! t1_kref+0x4bfc:   	andcc	%l4, %l4, %l1
	.word	0x98b44013	! t1_kref+0x4c00:   	orncc	%l1, %l3, %o4
	.word	0x96246f1b	! t1_kref+0x4c04:   	sub	%l1, 0xf1b, %o3
	.word	0x90044012	! t1_kref+0x4c08:   	add	%l1, %l2, %o0
	.word	0x8143c000	! t1_kref+0x4c0c:   	stbar
	.word	0xa1a00556	! t1_kref+0x4c10:   	fsqrtd	%f22, %f16
	.word	0xec1e6000	! t1_kref+0x4c14:   	ldd	[%i1], %l6
	.word	0x81848000	! t1_kref+0x4c18:   	wr	%l2, %g0, %y
	.word	0x81b01024	! t1_kref+0x4c1c:   	siam	0x4
	.word	0xf207bfe0	! t1_kref+0x4c20:   	ld	[%fp - 0x20], %i1
	.word	0xaa5cb7d0	! t1_kref+0x4c24:   	smul	%l2, -0x830, %l5
	.word	0xaba018d6	! t1_kref+0x4c28:   	fdtos	%f22, %f21
	.word	0xd01e7fe8	! t1_kref+0x4c2c:   	ldd	[%i1 - 0x18], %o0
	.word	0x25480001	! t1_kref+0x4c30:   	fblg,a,pt	%fcc0, _kref+0x4c34
	.word	0x9adc69d8	! t1_kref+0x4c34:   	smulcc	%l1, 0x9d8, %o5
	.word	0x23480008	! t1_kref+0x4c38:   	fbne,a,pt	%fcc0, _kref+0x4c58
	.word	0xada000ce	! t1_kref+0x4c3c:   	fnegd	%f14, %f22
	.word	0x94fc4014	! t1_kref+0x4c40:   	sdivcc	%l1, %l4, %o2
	.word	0xb9b50dd0	! t1_kref+0x4c44:   	fnand	%f20, %f16, %f28
	.word	0xa67d0010	! t1_kref+0x4c48:   	sdiv	%l4, %l0, %l3
	.word	0xa0c43bf1	! t1_kref+0x4c4c:   	addccc	%l0, -0x40f, %l0
	.word	0xd53e7ff0	! t1_kref+0x4c50:   	std	%f10, [%i1 - 0x10]
	.word	0xa9143033	! t1_kref+0x4c54:   	taddcctv	%l0, -0xfcd, %l4
	.word	0xe20e7ff6	! t1_kref+0x4c58:   	ldub	[%i1 - 0xa], %l1
	.word	0xa9a00539	! t1_kref+0x4c5c:   	fsqrts	%f25, %f20
	.word	0xb5a688b6	! t1_kref+0x4c60:   	fsubs	%f26, %f22, %f26
	.word	0xe3b8a100	! t1_kref+0x4c64:   	stda	%f48, [%g2 + 0x100]%asi
	.word	0xb5a408dc	! t1_kref+0x4c68:   	fsubd	%f16, %f28, %f26
	.word	0x81ae8a52	! t1_kref+0x4c6c:   	fcmpd	%fcc0, %f26, %f18
	.word	0xc0c81019	! t1_kref+0x4c70:   	ldsba	[%g0 + %i1]0x80, %g0
	.word	0x93148012	! t1_kref+0x4c74:   	taddcctv	%l2, %l2, %o1
	.word	0xe91fbdb0	! t1_kref+0x4c78:   	ldd	[%fp - 0x250], %f20
	.word	0x97a0012c	! t1_kref+0x4c7c:   	fabss	%f12, %f11
	.word	0x2d480004	! t1_kref+0x4c80:   	fbg,a,pt	%fcc0, _kref+0x4c90
	.word	0x95b78d40	! t1_kref+0x4c84:   	fnot1	%f30, %f10
	.word	0x93b50200	! t1_kref+0x4c88:   	array8	%l4, %g0, %o1
	.word	0xaf24ec60	! t1_kref+0x4c8c:   	mulscc	%l3, 0xc60, %l7
	.word	0xe5ee101b	! t1_kref+0x4c90:   	prefetcha	%i0 + %i3, 18
	.word	0x9b408000	! t1_kref+0x4c94:   	mov	%ccr, %o5
	.word	0x90bcbd3c	! t1_kref+0x4c98:   	xnorcc	%l2, -0x2c4, %o0
	.word	0x9205317b	! t1_kref+0x4c9c:   	add	%l4, -0xe85, %o1
	.word	0xada48d35	! t1_kref+0x4ca0:   	fsmuld	%f18, %f21, %f22
	.word	0xafb440f4	! t1_kref+0x4ca4:   	edge16ln	%l1, %l4, %l7
	.word	0xe3b8a100	! t1_kref+0x4ca8:   	stda	%f48, [%g2 + 0x100]%asi
	.word	0xaed50013	! t1_kref+0x4cac:   	umulcc	%l4, %l3, %l7
	.word	0x931c31ae	! t1_kref+0x4cb0:   	tsubcctv	%l0, -0xe52, %o1
	.word	0x9b3d2008	! t1_kref+0x4cb4:   	sra	%l4, 0x8, %o5
	.word	0xd81e2018	! t1_kref+0x4cb8:   	ldd	[%i0 + 0x18], %o4
	.word	0x9e1c0013	! t1_kref+0x4cbc:   	xor	%l0, %l3, %o7
	.word	0x8184c000	! t1_kref+0x4cc0:   	wr	%l3, %g0, %y
	.word	0xe06e8019	! t1_kref+0x4cc4:   	ldstub	[%i2 + %i1], %l0
	.word	0xaba3c9ae	! t1_kref+0x4cc8:   	fdivs	%f15, %f14, %f21
	.word	0x81da3dfd	! t1_kref+0x4ccc:   	flush	%o0 - 0x203
	.word	0xd5380019	! t1_kref+0x4cd0:   	std	%f10, [%g0 + %i1]
	.word	0xd2562018	! t1_kref+0x4cd4:   	ldsh	[%i0 + 0x18], %o1
	.word	0xed1fbfd0	! t1_kref+0x4cd8:   	ldd	[%fp - 0x30], %f22
	.word	0xe3b8a100	! t1_kref+0x4cdc:   	stda	%f48, [%g2 + 0x100]%asi
	.word	0xe2163fee	! t1_kref+0x4ce0:   	lduh	[%i0 - 0x12], %l1
	.word	0xacd4bacf	! t1_kref+0x4ce4:   	umulcc	%l2, -0x531, %l6
	.word	0xec1e0000	! t1_kref+0x4ce8:   	ldd	[%i0], %l6
	.word	0xf1bf5019	! t1_kref+0x4cec:   	stda	%f24, [%i5 + %i1]0x80
	.word	0x30800006	! t1_kref+0x4cf0:   	ba,a	_kref+0x4d08
	.word	0x9eac0013	! t1_kref+0x4cf4:   	andncc	%l0, %l3, %o7
	.word	0x95b44280	! t1_kref+0x4cf8:   	array32	%l1, %g0, %o2
	.word	0xbda01914	! t1_kref+0x4cfc:   	fitod	%f20, %f30
	.word	0xe226401c	! t1_kref+0x4d00:   	st	%l1, [%i1 + %i4]
	.word	0x9ba5c9b6	! t1_kref+0x4d04:   	fdivs	%f23, %f22, %f13
	.word	0x921c28c0	! t1_kref+0x4d08:   	xor	%l0, 0x8c0, %o1
	.word	0xae5c8010	! t1_kref+0x4d0c:   	smul	%l2, %l0, %l7
	.word	0xa9b3855c	! t1_kref+0x4d10:   	fcmpeq16	%f14, %f28, %l4
	.word	0xa5b28d40	! t1_kref+0x4d14:   	fnot1	%f10, %f18
	.word	0xe11fbde0	! t1_kref+0x4d18:   	ldd	[%fp - 0x220], %f16
	.word	0x2c800004	! t1_kref+0x4d1c:   	bneg,a	_kref+0x4d2c
	.word	0xafb64db0	! t1_kref+0x4d20:   	fxors	%f25, %f16, %f23
	.word	0xbda448bb	! t1_kref+0x4d24:   	fsubs	%f17, %f27, %f30
	.word	0x81b01025	! t1_kref+0x4d28:   	siam	0x5
	.word	0x233fff7a	! t1_kref+0x4d2c:   	sethi	%hi(0xfffde800), %l1
	.word	0xa7a0012f	! t1_kref+0x4d30:   	fabss	%f15, %f19
	.word	0x96e43fae	! t1_kref+0x4d34:   	subccc	%l0, -0x52, %o3
	.word	0xbba01a2c	! t1_kref+0x4d38:   	fstoi	%f12, %f29
	.word	0x97b74c78	! t1_kref+0x4d3c:   	fnors	%f29, %f24, %f11
	.word	0xe64e601b	! t1_kref+0x4d40:   	ldsb	[%i1 + 0x1b], %l3
	.word	0xe078a00c	! t1_kref+0x4d44:   	swap	[%g2 + 0xc], %l0
	.word	0xa6f43b6c	! t1_kref+0x4d48:   	udivcc	%l0, -0x494, %l3
	.word	0xe428a01f	! t1_kref+0x4d4c:   	stb	%l2, [%g2 + 0x1f]
	.word	0xd4180019	! t1_kref+0x4d50:   	ldd	[%g0 + %i1], %o2
	.word	0xe87e6010	! t1_kref+0x4d54:   	swap	[%i1 + 0x10], %l4
	.word	0x81af8ace	! t1_kref+0x4d58:   	fcmped	%fcc0, %f30, %f14
	.word	0xb5a488d2	! t1_kref+0x4d5c:   	fsubd	%f18, %f18, %f26
	.word	0xb5b78d1a	! t1_kref+0x4d60:   	fandnot1	%f30, %f26, %f26
	.word	0x8143c000	! t1_kref+0x4d64:   	stbar
	.word	0xe67e3fe0	! t1_kref+0x4d68:   	swap	[%i0 - 0x20], %l3
	.word	0x92448014	! t1_kref+0x4d6c:   	addc	%l2, %l4, %o1
	.word	0xe4a81018	! t1_kref+0x4d70:   	stba	%l2, [%g0 + %i0]0x80
	.word	0xfd1fbcf0	! t1_kref+0x4d74:   	ldd	[%fp - 0x310], %f30
	.word	0x81840000	! t1_kref+0x4d78:   	wr	%l0, %g0, %y
	.word	0xa634672f	! t1_kref+0x4d7c:   	orn	%l1, 0x72f, %l3
	.word	0x9fa0053b	! t1_kref+0x4d80:   	fsqrts	%f27, %f15
	.word	0x21800004	! t1_kref+0x4d84:   	fbn,a	_kref+0x4d94
	.word	0xeb262004	! t1_kref+0x4d88:   	st	%f21, [%i0 + 4]
	.word	0x9db70d40	! t1_kref+0x4d8c:   	fnot1	%f28, %f14
	.word	0xae148010	! t1_kref+0x4d90:   	or	%l2, %l0, %l7
	.word	0x99b48d90	! t1_kref+0x4d94:   	fxor	%f18, %f16, %f12
	.word	0xad246ceb	! t1_kref+0x4d98:   	mulscc	%l1, 0xceb, %l6
	.word	0xe9ee501a	! t1_kref+0x4d9c:   	prefetcha	%i1 + %i2, 20
	.word	0x25210351	! t1_kref+0x4da0:   	sethi	%hi(0x840d4400), %l2
	.word	0xb1b009ba	! t1_kref+0x4da4:   	fexpand	%f26, %f24
	.word	0xb9b58d9a	! t1_kref+0x4da8:   	fxor	%f22, %f26, %f28
	.word	0x9da000ce	! t1_kref+0x4dac:   	fnegd	%f14, %f14
	.word	0xa3a018da	! t1_kref+0x4db0:   	fdtos	%f26, %f17
	.word	0x92a50012	! t1_kref+0x4db4:   	subcc	%l4, %l2, %o1
	.word	0xc168a10c	! t1_kref+0x4db8:   	prefetch	%g2 + 0x10c, 0
	.word	0xbda00132	! t1_kref+0x4dbc:   	fabss	%f18, %f30
	.word	0xb3a01a56	! t1_kref+0x4dc0:   	fdtoi	%f22, %f25
	.word	0x8d84c014	! t1_kref+0x4dc4:   	wr	%l3, %l4, %fprs
	.word	0xbdb00c00	! t1_kref+0x4dc8:   	fzero	%f30
	.word	0xb4103ffb	! t1_kref+0x4dcc:   	mov	0xfffffffb, %i2
	.word	0xb9a00134	! t1_kref+0x4dd0:   	fabss	%f20, %f28
	.word	0xa6e533b5	! t1_kref+0x4dd4:   	subccc	%l4, -0xc4b, %l3
	.word	0xa5b38e80	! t1_kref+0x4dd8:   	fsrc1	%f14, %f18
	.word	0x99b38a1c	! t1_kref+0x4ddc:   	fpadd16	%f14, %f28, %f12
	.word	0xb1b38c96	! t1_kref+0x4de0:   	fandnot2	%f14, %f22, %f24
	.word	0xa3400000	! t1_kref+0x4de4:   	mov	%y, %l1
	.word	0x90552d0f	! t1_kref+0x4de8:   	umul	%l4, 0xd0f, %o0
	.word	0xb1b009be	! t1_kref+0x4dec:   	fexpand	%f30, %f24
	.word	0x81ab4a2c	! t1_kref+0x4df0:   	fcmps	%fcc0, %f13, %f12
	.word	0xa9b40013	! t1_kref+0x4df4:   	edge8	%l0, %l3, %l4
	.word	0x99b00c20	! t1_kref+0x4df8:   	fzeros	%f12
	.word	0xa9346008	! t1_kref+0x4dfc:   	srl	%l1, 0x8, %l4
	.word	0xa1b40f5a	! t1_kref+0x4e00:   	fornot1	%f16, %f26, %f16
	.word	0xa9a01054	! t1_kref+0x4e04:   	fdtox	%f20, %f20
	.word	0xe426001c	! t1_kref+0x4e08:   	st	%l2, [%i0 + %i4]
	.word	0xb5b686d2	! t1_kref+0x4e0c:   	fmul8sux16	%f26, %f18, %f26
	.word	0x96644012	! t1_kref+0x4e10:   	subc	%l1, %l2, %o3
	.word	0x953c2018	! t1_kref+0x4e14:   	sra	%l0, 0x18, %o2
	.word	0x9af4a04b	! t1_kref+0x4e18:   	udivcc	%l2, 0x4b, %o5
	.word	0x99a00556	! t1_kref+0x4e1c:   	fsqrtd	%f22, %f12
	call	SYM(_kaos_done)
	.word	0x01000000	! t1_kref+0x4e24:   	nop
	KGLOBAL(t1_ktbl_end)
t1_ktbl_end:
t1_ktbl_page_end:

KTEXT_MODULE(t1_module_subr0, 0x79ed6000)
.seg "text"
t1_subr0_page_begin:
	.skip 8188
.global _t1_subr0; ENTRY(t1_subr0)
	.word	0xa6844012	! t1_subr0+0x0:   	addcc	%l1, %l2, %l3
	.word	0x81c3e008	! t1_subr0+0x4:   	retl
	.word	0xaa64c014	! t1_subr0+0x8:   	subc	%l3, %l4, %l5
t1_subr0_page_end:

KTEXT_MODULE(t1_module_subr1, 0x54054000)
.seg "text"
t1_subr1_page_begin:
	.skip 8184
.global _t1_subr1; ENTRY(t1_subr1)
	.word	0x9de3bfa0	! t1_subr1+0x0:   	save	%sp, -0x60, %sp
	.word	0xb29eaa5a	! t1_subr1+0x4:   	xorcc	%i2, 0xa5a, %i1
	.word	0x81c7e008	! t1_subr1+0x8:   	ret
	.word	0xa7ee6001	! t1_subr1+0xc:   	restore	%i1, 1, %l3
t1_subr1_page_end:

KTEXT_MODULE(t1_module_subr2, 0x4dee6000)
.seg "text"
t1_subr2_page_begin:
	.skip 8180
.global _t1_subr2; ENTRY(t1_subr2)
	.word	0x9de3bfa0	! t1_subr2+0x0:   	save	%sp, -0x60, %sp
	.word	0xb2066001	! t1_subr2+0x4:   	add	%i1, 1, %i1
	.word	0x81c7e008	! t1_subr2+0x8:   	ret
	.word	0xa3ee6001	! t1_subr2+0xc:   	restore	%i1, 1, %l1
t1_subr2_page_end:

KTEXT_MODULE(t1_module_subr3, 0x4f952000)
.seg "text"
t1_subr3_page_begin:
	.skip 8128
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
!  Total operations: 4865  
!
!  Operation frequencies
!
!  name               exp    obs
!  ldsb              1.02   0.78
!  ldub              0.33   0.23
!  ldsh              0.74   0.64
!  lduh              0.58   0.70
!  ld                0.16   0.10
!  ldd               1.38   1.42
!  swap              1.24   1.46
!  ldstub            1.01   0.95
!  stb               1.31   1.34
!  sth               0.09   0.12
!  st                1.05   1.23
!  std               0.29   0.33
!  add               0.78   0.70
!  addcc             0.65   0.76
!  addx              1.14   1.13
!  addxcc            1.16   1.29
!  taddcc            0.02   0.02
!  taddcctv          0.27   0.39
!  sub               0.55   0.41
!  subcc             1.06   0.97
!  subx              0.24   0.29
!  subxcc            0.55   0.74
!  tsubcc            0.18   0.14
!  tsubcctv          0.24   0.37
!  mulscc            0.31   0.39
!  and               0.40   0.58
!  andcc             0.74   0.62
!  andn              0.66   0.82
!  andncc            0.88   0.92
!  or                0.49   0.62
!  orcc              0.46   0.55
!  orn               0.81   0.97
!  orncc             0.46   0.33
!  xor               0.35   0.41
!  xorcc             1.11   1.36
!  xnor              0.80   0.99
!  xnorcc            0.91   0.95
!  sll               0.30   0.29
!  srl               0.67   0.66
!  sra               1.32   1.44
!  unimp             0.19   0.25
!  umul              1.36   1.42
!  smul              1.23   1.21
!  udiv              0.58   0.47
!  sdiv              0.36   0.29
!  umulcc            0.73   0.74
!  smulcc            0.27   0.27
!  udivcc            1.17   1.48
!  sdivcc            0.74   0.84
!  rdy               1.26   1.23
!  wry               1.15   1.05
!  bicc              0.83   0.72
!  sethi             0.61   0.53
!  jmpl              0.98   1.01
!  call              0.01   0.02
!  ticc              0.00   0.00
!  flush             1.38   1.27
!  save              0.38   0.37
!  restore           1.14   0.00
!  stbar             1.19   1.07
!  ldf               1.11   0.90
!  lddf              0.73   0.95
!  stf               1.27   1.23
!  stdf              0.70   0.70
!  fadds             0.13   0.12
!  fsubs             1.09   1.36
!  fmuls             0.92   0.97
!  fdivs             0.81   0.88
!  faddd             0.65   0.76
!  fsubd             0.45   0.43
!  fmuld             0.59   0.68
!  fdivd             0.67   0.66
!  faddq             0.00   0.00
!  fsubq             0.00   0.00
!  fmulq             0.00   0.00
!  fdivq             0.00   0.00
!  fsmuld            0.82   0.95
!  fdmulq            0.00   0.00
!  fitos             0.23   0.29
!  fitod             1.00   0.97
!  fitoq             0.00   0.00
!  fstoi             0.06   0.02
!  fstod             0.06   0.06
!  fstoq             0.00   0.00
!  fdtoi             0.48   0.41
!  fdtos             0.78   0.64
!  fdtoq             0.00   0.00
!  fqtoi             0.00   0.00
!  fqtos             0.00   0.00
!  fqtod             0.00   0.00
!  fmovs             0.46   0.33
!  fnegs             0.35   0.33
!  fabss             1.31   1.64
!  fsqrts            2.10   2.06
!  fsqrtd            2.11   2.43
!  fsqrtq            0.00   0.00
!  fcmps             0.82   0.82
!  fcmpd             1.16   1.05
!  fcmpq             0.00   0.00
!  fcmpes            0.59   0.72
!  fcmped            1.15   1.36
!  fcmpeq            0.00   0.00
!  fbfcc             1.43   1.05
!  ldfsr             0.09   0.00
!  stfsr             0.21   0.25
!  loop              0.69   0.41
!  offset            0.09   0.10
!  area              0.29   0.31
!  target            0.23   0.27
!  goto              0.01   0.00
!  sigsegv           0.06   0.10
!  sigbus            0.01   0.00
!  imodify           0.49   0.39
!  ldfsr_offset      0.12   0.00
!  fpattern          1.41   1.23
!  lbranch           0.01   0.00
!  shmld             0.64   0.80
!  shmst             2.72   2.75
!  shmpf             1.05   1.05
!  shmswap           0.18   0.25
!  shmblkld          0.87   0.10
!  shmblkst          0.72   0.21
!  shmblkchk         0.27   0.12
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
!  casa              0.27   0.37
!  rdasi             0.21   0.10
!  wrasi             0.26   0.21
!  bpcc              0.70   0.60
!  fbpfcc            2.74   2.28
!  fmovscc           0.16   0.14
!  fmovdcc           0.19   0.14
!  fmovqcc           0.00   0.00
!  movcc             0.04   0.04
!  flushw            0.14   0.10
!  membar            0.27   0.29
!  prefetch          0.34   0.21
!  rdpc              0.23   0.37
!  ldqf              0.00   0.00
!  stqf              0.00   0.00
!  ldfa              0.16   0.16
!  lddfa             0.11   0.10
!  ldqfa             0.00   0.00
!  ldsba             0.16   0.16
!  ldsha             0.02   0.04
!  lduba             0.07   0.00
!  lduha             0.16   0.25
!  lda               0.01   0.00
!  ldda              0.08   0.08
!  ldstuba           0.22   0.25
!  prefetcha         0.27   0.39
!  stfa              0.06   0.06
!  stdfa             0.19   0.23
!  stqfa             0.00   0.00
!  stba              0.17   0.08
!  stha              0.05   0.08
!  sta               0.25   0.10
!  stda              0.00   0.00
!  swapa             0.11   0.18
!  fmovd             0.02   0.00
!  fnegd             0.27   0.45
!  fabsd             0.08   0.14
!  fstox             0.15   0.21
!  fdtox             0.16   0.23
!  fxtos             0.11   0.02
!  fxtod             0.18   0.29
!  lds               0.13   0.06
!  ldsa              0.03   0.00
!  ldx               0.03   0.02
!  ldxa              0.18   0.21
!  nofault           0.12   0.16
!  rdgsr             0.01   0.04
!  wrgsr             0.00   0.00
!  fpadd16           0.25   0.35
!  fpadd16s          0.16   0.21
!  fpadd32           0.19   0.14
!  fpadd32s          0.06   0.16
!  fpsub16           0.23   0.23
!  fpsub16s          0.02   0.00
!  fpsub32           0.04   0.04
!  fpsub32s          0.15   0.14
!  fpack16           0.17   0.10
!  fpack32           0.13   0.18
!  fpackfix          0.26   0.25
!  fexpand           0.19   0.23
!  fpmerge           0.07   0.06
!  fmul8x16          0.22   0.29
!  fmul8x16au        0.10   0.31
!  fmul8x16al        0.14   0.16
!  fmul8sux16        0.27   0.37
!  fmul8ulx16        0.00   0.00
!  fmuld8sux16       0.07   0.08
!  fmuld8ulx16       0.23   0.23
!  alignaddr         0.18   0.12
!  alignaddrl        0.14   0.14
!  faligndata        0.06   0.06
!  fzero             0.06   0.10
!  fzeros            0.11   0.12
!  fone              0.25   0.21
!  fones             0.04   0.06
!  fsrc1             0.21   0.23
!  fsrc1s            0.09   0.02
!  fsrc2             0.16   0.21
!  fsrc2s            0.09   0.21
!  fnot1             0.13   0.18
!  fnot1s            0.15   0.10
!  fnot2             0.10   0.06
!  fnot2s            0.08   0.06
!  for               0.19   0.21
!  fors              0.03   0.02
!  fnor              0.01   0.00
!  fnors             0.09   0.08
!  fand              0.25   0.25
!  fands             0.03   0.02
!  fnand             0.26   0.25
!  fnands            0.12   0.06
!  fxor              0.23   0.25
!  fxors             0.21   0.23
!  fxnor             0.27   0.21
!  fxnors            0.09   0.14
!  fornot1           0.05   0.06
!  fornot1s          0.01   0.02
!  fornot2           0.08   0.06
!  fornot2s          0.09   0.12
!  fandnot1          0.20   0.21
!  fandnot1s         0.03   0.04
!  fandnot2          0.27   0.25
!  fandnot2s         0.04   0.04
!  fcmpgt16          0.23   0.23
!  fcmpgt32          0.19   0.25
!  fcmple16          0.15   0.18
!  fcmple32          0.22   0.29
!  fcmpne16          0.16   0.18
!  fcmpne32          0.09   0.18
!  fcmpeq16          0.15   0.21
!  fcmpeq32          0.08   0.04
!  edge8             0.14   0.18
!  edge8l            0.15   0.14
!  edge16            0.19   0.18
!  edge16l           0.08   0.00
!  edge32            0.06   0.00
!  edge32l           0.26   0.39
!  pdist             0.10   0.10
!  partial_st8       0.11   0.10
!  partial_st16      0.19   0.25
!  partial_st32      0.15   0.21
!  short_st8         0.22   0.39
!  short_st16        0.13   0.16
!  short_ld8         0.18   0.25
!  short_ld16        0.03   0.02
!  blkld             0.27   0.00
!  blkst             0.10   0.00
!  blkld_offset      0.06   0.00
!  blkst_offset      0.14   0.00
!  blk_check         0.06   0.04
!  casxa             0.20   0.14
!  rdccr             0.22   0.27
!  rdfprs            0.04   0.08
!  wrccr             0.14   0.18
!  popc              0.23   0.21
!  wrfprs            0.19   0.25
!  stx               0.14   0.18
!  stxa              0.14   0.18
!  cflush            0.00   0.00
!  array8            0.10   0.08
!  array16           0.24   0.21
!  array32           0.20   0.18
!  edge8n            0.20   0.21
!  edge8ln           0.08   0.08
!  edge16n           0.13   0.16
!  edge16ln          0.25   0.23
!  edge32n           0.23   0.39
!  edge32ln          0.16   0.04
!  bmask             0.05   0.08
!  bshuffle          0.02   0.04
!  siam              0.23   0.29
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
KDATA_MODULE(t1_module_offset_table, 0x73030000)
.seg "data"
t1_offset_table_start:
t1_offset_table_size:	.word	0x00000008
t1_offset_table:
	.word	0x00000008
	.word	0xffffffe0
	.word	0x00000018
	.word	0xfffffff8
	.word	0x00000010
	.word	0xfffffff0
	.word	0x00000000
	.word	0xffffffe8
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

KDATA_MODULE(t1_module_data_in_regs, 0x6495e000)
.seg "data"
KGLOBAL(t1_data_in_regs)
t1_data_in_regs_start:
t1_data_in_regs:
	.word	0xf1d01f45          ! %f0
	.word	0x76f79de9          ! %f1
	.word	0x8e6c02a6          ! %f2
	.word	0xff3d5d8a          ! %f3
	.word	0x69cf804c          ! %f4
	.word	0xdf8ebcd1          ! %f5
	.word	0x4295411b          ! %f6
	.word	0x1f4f53b3          ! %f7
	.word	0x90b92a95          ! %f8
	.word	0x1529df5e          ! %f9
	.word	0x21569ed7          ! %f10
	.word	0xa2955238          ! %f11
	.word	0x13fca913          ! %f12
	.word	0x17e3e300          ! %f13
	.word	0x4c9d0b52          ! %f14
	.word	0x66440464          ! %f15
	.word	0xc3ae6380          ! %f16
	.word	0x156d7654          ! %f17
	.word	0xd90be110          ! %f18
	.word	0x3346c4cc          ! %f19
	.word	0x2a1b19b6          ! %f20
	.word	0xfd1613f1          ! %f21
	.word	0x0bcbc312          ! %f22
	.word	0xa93a1fb5          ! %f23
	.word	0x95c7403d          ! %f24
	.word	0xdf236561          ! %f25
	.word	0x35655d8f          ! %f26
	.word	0xb4a197b2          ! %f27
	.word	0x3c2f1224          ! %f28
	.word	0x900d526d          ! %f29
	.word	0x32bafde3          ! %f30
	.word	0x64a29091          ! %f31
	.word	0x6b956c14          ! %f32
	.word	0x04d5409d          ! %f33
	.word	0x26ef35c7          ! %f34
	.word	0xd4c88477          ! %f35
	.word	0x907cc4a1          ! %f36
	.word	0x1c1346fe          ! %f37
	.word	0xa335fdc3          ! %f38
	.word	0x60f4e74a          ! %f39
	.word	0x3146d5e3          ! %f40
	.word	0xdfbc5a25          ! %f41
	.word	0xbf710ae0          ! %f42
	.word	0xaedf5c4e          ! %f43
	.word	0xd52ccc45          ! %f44
	.word	0xda50b474          ! %f45
	.word	0x274f4ba0          ! %f46
	.word	0x57b12212          ! %f47
	.word	0x0c8b0e9c          ! %f48
	.word	0x7f51fe9b          ! %f49
	.word	0x8eb2c032          ! %f50
	.word	0x5f90d88d          ! %f51
	.word	0xcc98f37b          ! %f52
	.word	0x46d4fc61          ! %f53
	.word	0x8c9f21e1          ! %f54
	.word	0xcea20583          ! %f55
	.word	0xe955f7c5          ! %f56
	.word	0x5efac1a4          ! %f57
	.word	0x69270dce          ! %f58
	.word	0xe94dfb2d          ! %f59
	.word	0x62fb4a82          ! %f60
	.word	0x6859b39e          ! %f61
	.word	0xcff4a6de          ! %f62
	.word	0xdae20518          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t1_kref+0x598       ! %g1 (code pointer)
	.word	t1_data_in_shm_area ! %g2 (shared area pointer)
	.word	0x33cd8f6e          ! %g3 (loop index)
	.word	SYM(t1_subr2)       ! %g4 (jmpl target)
	.word	t1_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0x73523b5e          ! %o0
	.word	0xdf419017          ! %o1
	.word	0x30a0989e          ! %o2
	.word	0x656dd9ae          ! %o3
	.word	0x77c6dd29          ! %o4
	.word	0x1427aeb4          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0x41d9c1f6          ! %l0
	.word	0xc41eda69          ! %l1
	.word	0xa165e2f5          ! %l2
	.word	0x6fe8ff4c          ! %l3
	.word	0xf9798def          ! %l4
	.word	0x803446c4          ! %l5
	.word	0xc703f763          ! %l6
	.word	0x6b64bbb1          ! %l7
	.word	t1_data_in_area0    ! %i0 (area pointer)
	.word	t1_data_in_area0    ! %i1 (area pointer)
	.word	0xffffffef          ! %i2 (byte offset)
	.word	0x00000010          ! %i3 (halfword offset)
	.word	0x00000010          ! %i4 (word offset)
	.word	0xfffffff0          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0x1cdb0131          ! %y
	.word	0x00000003          ! %icc (nzvc)
	.word	0x400008d6          ! %fsr
	.word	0x00000000          ! %gsr.mask
	.word	0x00000000          ! %gsr
	.word	0x00000082          ! %asi
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

KDATA_MODULE(t1_module_data_in_stack, 0x6e3ea000)
.seg "data"
KGLOBAL(t1_data_in_mtbl_size)
KGLOBAL(t1_data_in_mtbl)
KGLOBAL(t1_data_in_stack)
t1_data_in_stack_start:
	.word	0xc195db70
	.word	0xd00927b5
	.word	0x24d83cd4
	.word	0xc2f1bd16
	.word	0x2c258c56
	.word	0x0ad72911
	.word	0xebedce9e
	.word	0xe39d626d
	.word	0x73d9aaa5
	.word	0x6384d471
	.word	0xe5570bef
	.word	0x253443fc
	.word	0x3189e73b
	.word	0x68367e60
	.word	0x9887b328
	.word	0xef37f908
	.word	0xbe1e95ad
	.word	0x8ac566ef
	.word	0xd7d96851
	.word	0xd6e9f168
	.word	0x463bd87e
	.word	0x224843d8
	.word	0xa4fade72
	.word	0xb3318644
	.word	0x62f6dc8e
	.word	0xaa97c8e5
	.word	0xc317c220
	.word	0x4ccbd320
	.word	0xa2ded7d0
	.word	0x17e8d292
	.word	0x58fc395a
	.word	0xfbb19b18
	.word	0x6d0abf40
	.word	0x2a0c16f1
	.word	0x66500c95
	.word	0xee9fbe6c
	.word	0xdd77e813
	.word	0xf97d80cd
	.word	0xdc32cd14
	.word	0x1d73043f
	.word	0x6615082f
	.word	0x6e6b9912
	.word	0xd4438c7d
	.word	0x3ad03c9b
	.word	0x959849dd
	.word	0x8181a26b
	.word	0x6eb3f9a9
	.word	0xd99dfeb8
	.word	0xcbf666bc
	.word	0x85c54b2d
	.word	0x29aff6bb
	.word	0x6765877e
	.word	0x773bfdf8
	.word	0xe4831973
	.word	0x375ffc73
	.word	0x5a047c47
	.word	0xc1e999bc
	.word	0xa652f589
	.word	0x355ddec4
	.word	0xc57195e8
	.word	0x290617e4
	.word	0x80f0768d
	.word	0x45d8c6a3
	.word	0x89f277f1
	.word	0xf32269f7
	.word	0x6f38d553
	.word	0x911e7521
	.word	0xfc413834
	.word	0xe5c4e054
	.word	0xc15aa989
	.word	0xa30d23bb
	.word	0xa4045a84
	.word	0x3b6174aa
	.word	0x2561d51b
	.word	0x7c5295f1
	.word	0xc9e444be
	.word	0xd467c7ad
	.word	0x160c41d8
	.word	0xf0923014
	.word	0xa9b56f0d
	.word	0xf146c606
	.word	0xfd7a5555
	.word	0x81d52764
	.word	0x56ded468
	.word	0xacd1288a
	.word	0xe5183f11
	.word	0x24451f5a
	.word	0x9d98675f
	.word	0x9d6d43ae
	.word	0xe24b84d9
	.word	0x9462c841
	.word	0x53158f17
	.word	0xdb2dda3a
	.word	0x5242716e
	.word	0x62ef530a
	.word	0xc56bf093
	.word	0x8098e73d
	.word	0x0cf94964
	.word	0xd5d8ce61
	.word	0x02470834
	.word	0x1ebc9340
	.word	0xca636a4c
	.word	0xd9e6c0fb
	.word	0xed7d5782
	.word	0x8a81c8be
	.word	0x32e4b815
	.word	0xaee59531
	.word	0x16a42b2c
	.word	0x942f1bd3
	.word	0x5029fcaf
	.word	0xbce4a9d2
	.word	0xa30b3d4d
	.word	0x4a05f932
	.word	0x03351df0
	.word	0x36041c34
	.word	0xb859b7f0
	.word	0x370f505c
	.word	0xa25c4dbb
	.word	0x3a8c9f8c
	.word	0x9f9a5bd6
	.word	0xeecc2d0e
	.word	0x2c49985f
	.word	0x25dcf57f
	.word	0x611ccf76
	.word	0x28d1f3fa
	.word	0x75fa753c
	.word	0x4f5ddbf8
	.word	0x2b6e5a44
	.word	0xaba136ba
	.word	0x27953dab
	.word	0xcc66843c
	.word	0x430c9036
	.word	0x77815301
	.word	0x28e4ae1f
	.word	0xdc08e73a
	.word	0x1198b183
	.word	0xa81a5113
	.word	0x98a7d587
	.word	0x6d5e8b27
	.word	0xca7ac2ad
	.word	0xb129b576
	.word	0x83e716f7
	.word	0x49638e4a
	.word	0xdc4fa0c2
	.word	0x374639e9
	.word	0x22652186
	.word	0x8bf70b14
	.word	0x6a6d95dd
	.word	0x4c71a195
	.word	0x5d4d0279
	.word	0x51752973
	.word	0x747f31f3
	.word	0x38771c82
	.word	0x33acb5a0
	.word	0x70d07167
	.word	0x4bec6bcb
	.word	0xd207ee4c
	.word	0x2f5dd800
	.word	0x3a5532d4
	.word	0xebc64e4e
	.word	0x5e6f4c15
	.word	0x72f460b2
	.word	0x0a9b169a
	.word	0xa869b600
	.word	0xbdd1a5bd
	.word	0x0065840a
	.word	0xecd62ce2
	.word	0x2c51e2ce
t1_data_in_sp:
	.word	0x987ace50
	.word	0x1e9724fa
	.word	0xf8fa0cba
	.word	0x8fdbe209
	.word	0x4201b7c0
	.word	0x4c2a78b8
	.word	0xd636d8e4
	.word	0x864814b2
	.word	t1_data_in_area0
	.word	t1_data_in_area0
	.word	0xfffffffa
	.word	0x00000000
	.word	0xfffffff8
	.word	0x00000008
	.word	t1_data_in_fp
	.word	0xf8f33e52
	.word	0x7153bd76
	.word	0x96b585fe
	.word	0x7e4f4cb3
	.word	0xbcedc626
	.word	0xf7e8dae0
	.word	0x953b7ce0
	.word	0xda690657
	.word	0xc47d93c1
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
	.word   	0xa912fd07	! [%fp - 0xc]
	.word   	0xd02ea9f7	! [%fp - 0x8]
	.word   	0xcec20ef8	! [%fp - 0x4]
.global t1_data_in_fp; t1_data_in_fp:
	.word	0x946044fe
	.word	0x0fd01963
	.word	0x7044e35c
	.word	0x4432459d
	.word	0xff891f14
	.word	0x03047c5b
	.word	0x019729ab
	.word	0xae68751f
	.word	0x6ad901f6
	.word	0xd7a942d3
	.word	0xff166409
	.word	0x1939f9d7
	.word	0xe0d7adfb
	.word	0xa6705909
	.word	0x93c15867
	.word	0xc05a8e98
	.word	0x56093fc1
	.word	0x1fa912a1
	.word	0xbe0b6407
	.word	0xfd8f74df
	.word	0x32c5064f
	.word	0xe14daffd
	.word	0xdad7b83e
	.word	0x2af06c49
t1_data_in_stacktop:
	.word	0
t1_data_in_stack_end:
.skip 6300	! page align

KDATA_MODULE(t1_module_data_in_area0, 0x4eb40000)
.seg "data"
t1_data_in_area0_start:
.skip 1344
t1_data_in_area0_begin:
	.word	0xbe211779	! t1_data_in_area0-0x20
	.word	0x28d364d2	! t1_data_in_area0-0x1c
	.word	0xa9651f7c	! t1_data_in_area0-0x18
	.word	0x38fc2d44	! t1_data_in_area0-0x14
	.word	0xa0d84688	! t1_data_in_area0-0x10
	.word	0xc1dbb3f7	! t1_data_in_area0-0xc
	.word	0xc4c28e89	! t1_data_in_area0-0x8
	.word	0x026d5b09	! t1_data_in_area0-0x4
.global t1_data_in_area0; t1_data_in_area0:
	.word	0x8d466119	! t1_data_in_area0+0x0
	.word	0x057f3480	! t1_data_in_area0+0x4
	.word	0x8a250611	! t1_data_in_area0+0x8
	.word	0xe51820c9	! t1_data_in_area0+0xc
	.word	0x74f0d645	! t1_data_in_area0+0x10
	.word	0xb8d7140b	! t1_data_in_area0+0x14
	.word	0x61fb8862	! t1_data_in_area0+0x18
	.word	0x56e7ee26	! t1_data_in_area0+0x1c
t1_data_in_area0_end:
.skip 6784
t1_data_in_area0_stop:

KDATA_MODULE(t1_module_data_in_shm_area, 0x6870c000)
.seg "data"
t1_data_in_shm_area_start:
t1_data_in_shm_area_begin:
.global t1_data_in_shm_area; t1_data_in_shm_area:
	.word	0x38495f37	! t1_data_in_shm_area+0x0 (t0)
	.word	0x42d02c02	! t1_data_in_shm_area+0x4 (t1)
	.word	0x6f757cfe	! t1_data_in_shm_area+0x8 (t0)
	.word	0x4debea59	! t1_data_in_shm_area+0xc (t1)
	.word	0x2d5bda18	! t1_data_in_shm_area+0x10 (t0)
	.word	0x5c262773	! t1_data_in_shm_area+0x14 (t1)
	.word	0x2b2d0412	! t1_data_in_shm_area+0x18 (t0)
	.word	0x439806e4	! t1_data_in_shm_area+0x1c (t1)
	.word	0xd85a16b8	! t1_data_in_shm_area+0x20 (t0)
	.word	0x25f0e6c8	! t1_data_in_shm_area+0x24 (t1)
	.word	0xe873b28b	! t1_data_in_shm_area+0x28 (t0)
	.word	0xfd85b220	! t1_data_in_shm_area+0x2c (t1)
	.word	0x09276dbf	! t1_data_in_shm_area+0x30 (t0)
	.word	0x42816f27	! t1_data_in_shm_area+0x34 (t1)
	.word	0x8b2b3cba	! t1_data_in_shm_area+0x38 (t0)
	.word	0x2238d9e0	! t1_data_in_shm_area+0x3c (t1)
	.word	0x1d29e2b9	! t1_data_in_shm_area+0x40 (t0 bload)
	.word	0x9d163750	! t1_data_in_shm_area+0x44
	.word	0x18801f45	! t1_data_in_shm_area+0x48
	.word	0x5d247aa1	! t1_data_in_shm_area+0x4c
	.word	0x32e1122f	! t1_data_in_shm_area+0x50
	.word	0x13247336	! t1_data_in_shm_area+0x54
	.word	0x3557600e	! t1_data_in_shm_area+0x58
	.word	0x547ef29b	! t1_data_in_shm_area+0x5c
	.word	0x8b34a225	! t1_data_in_shm_area+0x60
	.word	0xb8a3d18b	! t1_data_in_shm_area+0x64
	.word	0xe0d6f18a	! t1_data_in_shm_area+0x68
	.word	0xfd8a3cea	! t1_data_in_shm_area+0x6c
	.word	0xe58abff2	! t1_data_in_shm_area+0x70
	.word	0x484de929	! t1_data_in_shm_area+0x74
	.word	0x6af05486	! t1_data_in_shm_area+0x78
	.word	0xed073407	! t1_data_in_shm_area+0x7c
	.word	0xf2a8baae	! t1_data_in_shm_area+0x80 (t0 bstore)
	.word	0xf07e82d7	! t1_data_in_shm_area+0x84
	.word	0xfba359be	! t1_data_in_shm_area+0x88
	.word	0xb9887ba3	! t1_data_in_shm_area+0x8c
	.word	0x2bca17e1	! t1_data_in_shm_area+0x90
	.word	0xd29121ee	! t1_data_in_shm_area+0x94
	.word	0x05c4a7b6	! t1_data_in_shm_area+0x98
	.word	0x6da5f3e8	! t1_data_in_shm_area+0x9c
	.word	0xe6c7bf7d	! t1_data_in_shm_area+0xa0
	.word	0xe5fbf33f	! t1_data_in_shm_area+0xa4
	.word	0x1e4649c9	! t1_data_in_shm_area+0xa8
	.word	0xa0dd9d03	! t1_data_in_shm_area+0xac
	.word	0x2ff1730e	! t1_data_in_shm_area+0xb0
	.word	0x16f04634	! t1_data_in_shm_area+0xb4
	.word	0x18919c82	! t1_data_in_shm_area+0xb8
	.word	0x09a0aee6	! t1_data_in_shm_area+0xbc
	.word	0x4848c777	! t1_data_in_shm_area+0xc0 (t1 bload)
	.word	0xfbc1fb1e	! t1_data_in_shm_area+0xc4
	.word	0x7047afd3	! t1_data_in_shm_area+0xc8
	.word	0x3c3f5340	! t1_data_in_shm_area+0xcc
	.word	0xb4078377	! t1_data_in_shm_area+0xd0
	.word	0x9a12a971	! t1_data_in_shm_area+0xd4
	.word	0x64ddecfd	! t1_data_in_shm_area+0xd8
	.word	0x61fa9deb	! t1_data_in_shm_area+0xdc
	.word	0xe4785b20	! t1_data_in_shm_area+0xe0
	.word	0x0098d625	! t1_data_in_shm_area+0xe4
	.word	0xb5ba7467	! t1_data_in_shm_area+0xe8
	.word	0xc520083b	! t1_data_in_shm_area+0xec
	.word	0x70fc325c	! t1_data_in_shm_area+0xf0
	.word	0x9bf4a50f	! t1_data_in_shm_area+0xf4
	.word	0x816f614b	! t1_data_in_shm_area+0xf8
	.word	0x60e3fff1	! t1_data_in_shm_area+0xfc
	.word	0xaefa0f8b	! t1_data_in_shm_area+0x100 (t1 bstore)
	.word	0xd4dc23d8	! t1_data_in_shm_area+0x104
	.word	0x25c38fe7	! t1_data_in_shm_area+0x108
	.word	0xe3125969	! t1_data_in_shm_area+0x10c
	.word	0x7d1e24a6	! t1_data_in_shm_area+0x110
	.word	0xe158865c	! t1_data_in_shm_area+0x114
	.word	0xd068c53b	! t1_data_in_shm_area+0x118
	.word	0x9207560e	! t1_data_in_shm_area+0x11c
	.word	0x751dc6a6	! t1_data_in_shm_area+0x120
	.word	0xcdaa5434	! t1_data_in_shm_area+0x124
	.word	0xa5860f10	! t1_data_in_shm_area+0x128
	.word	0x038e1e0f	! t1_data_in_shm_area+0x12c
	.word	0xf3b8f726	! t1_data_in_shm_area+0x130
	.word	0x61ca5b91	! t1_data_in_shm_area+0x134
	.word	0x0539a03c	! t1_data_in_shm_area+0x138
	.word	0x67c0a152	! t1_data_in_shm_area+0x13c
t1_data_in_shm_area_end:
t1_data_in_shm_area_stop:

KDATA_MODULE(t1_module_data_exp_regs, 0x6d2ba000)
.seg "data"
KGLOBAL(t1_data_exp_regs)
t1_data_exp_regs_start:
t1_data_exp_regs:
	.word	0xf1d01f45          ! %f0
	.word	0x76f79de9          ! %f1
	.word	0x8e6c02a6          ! %f2
	.word	0xff3d5d8a          ! %f3
	.word	0x69cf804c          ! %f4
	.word	0xdf8ebcd1          ! %f5
	.word	0x4295411b          ! %f6
	.word	0x1f4f53b3          ! %f7
	.word	0x90b92a95          ! %f8
	.word	0x1529df5e          ! %f9
	.word	0x21569ed7          ! %f10
	.word	0xa2955238          ! %f11
	.word	0x13fca913          ! %f12
	.word	0x17e3e300          ! %f13
	.word	0x4c9d0b52          ! %f14
	.word	0x66440464          ! %f15
	.word	0xc3ae6380          ! %f16
	.word	0x156d7654          ! %f17
	.word	0xd90be110          ! %f18
	.word	0x3346c4cc          ! %f19
	.word	0x2a1b19b6          ! %f20
	.word	0xfd1613f1          ! %f21
	.word	0x0bcbc312          ! %f22
	.word	0xa93a1fb5          ! %f23
	.word	0x95c7403d          ! %f24
	.word	0xdf236561          ! %f25
	.word	0x35655d8f          ! %f26
	.word	0xb4a197b2          ! %f27
	.word	0x3c2f1224          ! %f28
	.word	0x900d526d          ! %f29
	.word	0x32bafde3          ! %f30
	.word	0x64a29091          ! %f31
	.word	0x6b956c14          ! %f32
	.word	0x04d5409d          ! %f33
	.word	0x26ef35c7          ! %f34
	.word	0xd4c88477          ! %f35
	.word	0x907cc4a1          ! %f36
	.word	0x1c1346fe          ! %f37
	.word	0xa335fdc3          ! %f38
	.word	0x60f4e74a          ! %f39
	.word	0x3146d5e3          ! %f40
	.word	0xdfbc5a25          ! %f41
	.word	0xbf710ae0          ! %f42
	.word	0xaedf5c4e          ! %f43
	.word	0xd52ccc45          ! %f44
	.word	0xda50b474          ! %f45
	.word	0x274f4ba0          ! %f46
	.word	0x57b12212          ! %f47
	.word	0x0c8b0e9c          ! %f48
	.word	0x7f51fe9b          ! %f49
	.word	0x8eb2c032          ! %f50
	.word	0x5f90d88d          ! %f51
	.word	0xcc98f37b          ! %f52
	.word	0x46d4fc61          ! %f53
	.word	0x8c9f21e1          ! %f54
	.word	0xcea20583          ! %f55
	.word	0xe955f7c5          ! %f56
	.word	0x5efac1a4          ! %f57
	.word	0x69270dce          ! %f58
	.word	0xe94dfb2d          ! %f59
	.word	0x62fb4a82          ! %f60
	.word	0x6859b39e          ! %f61
	.word	0xcff4a6de          ! %f62
	.word	0xdae20518          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t1_kref+0x598       ! %g1 (code pointer)
	.word	t1_data_exp_shm_area! %g2 (shared area pointer)
	.word	0x33cd8f6e          ! %g3 (loop index)
	.word	SYM(t1_subr2)       ! %g4 (jmpl target)
	.word	t1_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0x73523b5e          ! %o0
	.word	0xdf419017          ! %o1
	.word	0x30a0989e          ! %o2
	.word	0x656dd9ae          ! %o3
	.word	0x77c6dd29          ! %o4
	.word	0x1427aeb4          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0x41d9c1f6          ! %l0
	.word	0xc41eda69          ! %l1
	.word	0xa165e2f5          ! %l2
	.word	0x6fe8ff4c          ! %l3
	.word	0xf9798def          ! %l4
	.word	0x803446c4          ! %l5
	.word	0xc703f763          ! %l6
	.word	0x6b64bbb1          ! %l7
	.word	t1_data_exp_area0   ! %i0 (area pointer)
	.word	t1_data_exp_area0   ! %i1 (area pointer)
	.word	0xffffffef          ! %i2 (byte offset)
	.word	0x00000010          ! %i3 (halfword offset)
	.word	0x00000010          ! %i4 (word offset)
	.word	0xfffffff0          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0x1cdb0131          ! %y
	.word	0x00000003          ! %icc (nzvc)
	.word	0x400008d6          ! %fsr
	.word	0x00000000          ! %gsr.mask
	.word	0x00000000          ! %gsr
	.word	0x00000082          ! %asi
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

KDATA_MODULE(t1_module_data_exp_stack, 0x552de000)
.seg "data"
KGLOBAL(t1_data_exp_mtbl_size)
KGLOBAL(t1_data_exp_mtbl)
KGLOBAL(t1_data_exp_stack)
t1_data_exp_stack_start:
	.word	0xc195db70
	.word	0xd00927b5
	.word	0x24d83cd4
	.word	0xc2f1bd16
	.word	0x2c258c56
	.word	0x0ad72911
	.word	0xebedce9e
	.word	0xe39d626d
	.word	0x73d9aaa5
	.word	0x6384d471
	.word	0xe5570bef
	.word	0x253443fc
	.word	0x3189e73b
	.word	0x68367e60
	.word	0x9887b328
	.word	0xef37f908
	.word	0xbe1e95ad
	.word	0x8ac566ef
	.word	0xd7d96851
	.word	0xd6e9f168
	.word	0x463bd87e
	.word	0x224843d8
	.word	0xa4fade72
	.word	0xb3318644
	.word	0x62f6dc8e
	.word	0xaa97c8e5
	.word	0xc317c220
	.word	0x4ccbd320
	.word	0xa2ded7d0
	.word	0x17e8d292
	.word	0x58fc395a
	.word	0xfbb19b18
	.word	0x6d0abf40
	.word	0x2a0c16f1
	.word	0x66500c95
	.word	0xee9fbe6c
	.word	0xdd77e813
	.word	0xf97d80cd
	.word	0xdc32cd14
	.word	0x1d73043f
	.word	0x6615082f
	.word	0x6e6b9912
	.word	0xd4438c7d
	.word	0x3ad03c9b
	.word	0x959849dd
	.word	0x8181a26b
	.word	0x6eb3f9a9
	.word	0xd99dfeb8
	.word	0xcbf666bc
	.word	0x85c54b2d
	.word	0x29aff6bb
	.word	0x6765877e
	.word	0x773bfdf8
	.word	0xe4831973
	.word	0x375ffc73
	.word	0x5a047c47
	.word	0xc1e999bc
	.word	0xa652f589
	.word	0x355ddec4
	.word	0xc57195e8
	.word	0x290617e4
	.word	0x80f0768d
	.word	0x45d8c6a3
	.word	0x89f277f1
	.word	0xf32269f7
	.word	0x6f38d553
	.word	0x911e7521
	.word	0xfc413834
	.word	0xe5c4e054
	.word	0xc15aa989
	.word	0xa30d23bb
	.word	0xa4045a84
	.word	0x3b6174aa
	.word	0x2561d51b
	.word	0x7c5295f1
	.word	0xc9e444be
	.word	0xd467c7ad
	.word	0x160c41d8
	.word	0xf0923014
	.word	0xa9b56f0d
	.word	0xf146c606
	.word	0xfd7a5555
	.word	0x81d52764
	.word	0x56ded468
	.word	0xacd1288a
	.word	0xe5183f11
	.word	0x24451f5a
	.word	0x9d98675f
	.word	0x9d6d43ae
	.word	0xe24b84d9
	.word	0x9462c841
	.word	0x53158f17
	.word	0xdb2dda3a
	.word	0x5242716e
	.word	0x62ef530a
	.word	0xc56bf093
	.word	0x8098e73d
	.word	0x0cf94964
	.word	0xd5d8ce61
	.word	0x02470834
	.word	0x1ebc9340
	.word	0xca636a4c
	.word	0xd9e6c0fb
	.word	0xed7d5782
	.word	0x8a81c8be
	.word	0x32e4b815
	.word	0xaee59531
	.word	0x16a42b2c
	.word	0x942f1bd3
	.word	0x5029fcaf
	.word	0xbce4a9d2
	.word	0xa30b3d4d
	.word	0x4a05f932
	.word	0x03351df0
	.word	0x36041c34
	.word	0xb859b7f0
	.word	0x370f505c
	.word	0xa25c4dbb
	.word	0x3a8c9f8c
	.word	0x9f9a5bd6
	.word	0xeecc2d0e
	.word	0x2c49985f
	.word	0x25dcf57f
	.word	0x611ccf76
	.word	0x28d1f3fa
	.word	0x75fa753c
	.word	0x4f5ddbf8
	.word	0x2b6e5a44
	.word	0xaba136ba
	.word	0x27953dab
	.word	0xcc66843c
	.word	0x430c9036
	.word	0x77815301
	.word	0x28e4ae1f
	.word	0xdc08e73a
	.word	0x1198b183
	.word	0xa81a5113
	.word	0x98a7d587
	.word	0x6d5e8b27
	.word	0xca7ac2ad
	.word	0xb129b576
	.word	0x83e716f7
	.word	0x49638e4a
	.word	0xdc4fa0c2
	.word	0x374639e9
	.word	0x22652186
	.word	0x8bf70b14
	.word	0x6a6d95dd
	.word	0x4c71a195
	.word	0x5d4d0279
	.word	0x51752973
	.word	0x747f31f3
	.word	0x38771c82
	.word	0x33acb5a0
	.word	0x70d07167
	.word	0x4bec6bcb
	.word	0xd207ee4c
	.word	0x2f5dd800
	.word	0x3a5532d4
	.word	0xebc64e4e
	.word	0x5e6f4c15
	.word	0x72f460b2
	.word	0x0a9b169a
	.word	0xa869b600
	.word	0xbdd1a5bd
	.word	0x0065840a
	.word	0xecd62ce2
	.word	0x2c51e2ce
t1_data_exp_sp:
	.word	0x987ace50
	.word	0x1e9724fa
	.word	0xf8fa0cba
	.word	0x8fdbe209
	.word	0x4201b7c0
	.word	0x4c2a78b8
	.word	0xd636d8e4
	.word	0x864814b2
	.word	t1_data_exp_area0
	.word	t1_data_exp_area0
	.word	0xfffffffa
	.word	0x00000000
	.word	0xfffffff8
	.word	0x00000008
	.word	t1_data_exp_fp
	.word	0xf8f33e52
	.word	0x7153bd76
	.word	0x96b585fe
	.word	0x7e4f4cb3
	.word	0xbcedc626
	.word	0xf7e8dae0
	.word	0x953b7ce0
	.word	0xda690657
	.word	0xc47d93c1
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
	.word   	0xa912fd07	! [%fp - 0xc]
	.word   	0xd02ea9f7	! [%fp - 0x8]
	.word   	0xcec20ef8	! [%fp - 0x4]
t1_data_exp_fp:
	.word	0x946044fe
	.word	0x0fd01963
	.word	0x7044e35c
	.word	0x4432459d
	.word	0xff891f14
	.word	0x03047c5b
	.word	0x019729ab
	.word	0xae68751f
	.word	0x6ad901f6
	.word	0xd7a942d3
	.word	0xff166409
	.word	0x1939f9d7
	.word	0xe0d7adfb
	.word	0xa6705909
	.word	0x93c15867
	.word	0xc05a8e98
	.word	0x56093fc1
	.word	0x1fa912a1
	.word	0xbe0b6407
	.word	0xfd8f74df
	.word	0x32c5064f
	.word	0xe14daffd
	.word	0xdad7b83e
	.word	0x2af06c49
t1_data_exp_stacktop:
	.word	0
t1_data_exp_stack_end:
.skip 6300	! page align

KDATA_MODULE(t1_module_data_exp_area0, 0x54c24000)
.seg "data"
t1_data_exp_area0_start:
.skip 1344
t1_data_exp_area0_begin:
	.word	0xbe211779	! t1_data_exp_area0-0x20
	.word	0x28d364d2	! t1_data_exp_area0-0x1c
	.word	0xa9651f7c	! t1_data_exp_area0-0x18
	.word	0x38fc2d44	! t1_data_exp_area0-0x14
	.word	0xa0d84688	! t1_data_exp_area0-0x10
	.word	0xc1dbb3f7	! t1_data_exp_area0-0xc
	.word	0xc4c28e89	! t1_data_exp_area0-0x8
	.word	0x026d5b09	! t1_data_exp_area0-0x4
.global t1_data_exp_area0; t1_data_exp_area0:
	.word	0x8d466119	! t1_data_exp_area0+0x0
	.word	0x057f3480	! t1_data_exp_area0+0x4
	.word	0x8a250611	! t1_data_exp_area0+0x8
	.word	0xe51820c9	! t1_data_exp_area0+0xc
	.word	0x74f0d645	! t1_data_exp_area0+0x10
	.word	0xb8d7140b	! t1_data_exp_area0+0x14
	.word	0x61fb8862	! t1_data_exp_area0+0x18
	.word	0x56e7ee26	! t1_data_exp_area0+0x1c
t1_data_exp_area0_end:
.skip 6784
t1_data_exp_area0_stop:

KDATA_MODULE(t1_module_data_exp_shm_area, 0x56500000)
.seg "data"
t1_data_exp_shm_area_start:
t1_data_exp_shm_area_begin:
.global t1_data_exp_shm_area; t1_data_exp_shm_area:
	.word	0x38495f37	! t1_data_exp_shm_area+0x0 (t0)
	.word	0x42d02c02	! t1_data_exp_shm_area+0x4 (t1)
	.word	0x6f757cfe	! t1_data_exp_shm_area+0x8 (t0)
	.word	0x4debea59	! t1_data_exp_shm_area+0xc (t1)
	.word	0x2d5bda18	! t1_data_exp_shm_area+0x10 (t0)
	.word	0x5c262773	! t1_data_exp_shm_area+0x14 (t1)
	.word	0x2b2d0412	! t1_data_exp_shm_area+0x18 (t0)
	.word	0x439806e4	! t1_data_exp_shm_area+0x1c (t1)
	.word	0xd85a16b8	! t1_data_exp_shm_area+0x20 (t0)
	.word	0x25f0e6c8	! t1_data_exp_shm_area+0x24 (t1)
	.word	0xe873b28b	! t1_data_exp_shm_area+0x28 (t0)
	.word	0xfd85b220	! t1_data_exp_shm_area+0x2c (t1)
	.word	0x09276dbf	! t1_data_exp_shm_area+0x30 (t0)
	.word	0x42816f27	! t1_data_exp_shm_area+0x34 (t1)
	.word	0x8b2b3cba	! t1_data_exp_shm_area+0x38 (t0)
	.word	0x2238d9e0	! t1_data_exp_shm_area+0x3c (t1)
	.word	0x1d29e2b9	! t1_data_exp_shm_area+0x40 (t0 bload)
	.word	0x9d163750	! t1_data_exp_shm_area+0x44
	.word	0x18801f45	! t1_data_exp_shm_area+0x48
	.word	0x5d247aa1	! t1_data_exp_shm_area+0x4c
	.word	0x32e1122f	! t1_data_exp_shm_area+0x50
	.word	0x13247336	! t1_data_exp_shm_area+0x54
	.word	0x3557600e	! t1_data_exp_shm_area+0x58
	.word	0x547ef29b	! t1_data_exp_shm_area+0x5c
	.word	0x8b34a225	! t1_data_exp_shm_area+0x60
	.word	0xb8a3d18b	! t1_data_exp_shm_area+0x64
	.word	0xe0d6f18a	! t1_data_exp_shm_area+0x68
	.word	0xfd8a3cea	! t1_data_exp_shm_area+0x6c
	.word	0xe58abff2	! t1_data_exp_shm_area+0x70
	.word	0x484de929	! t1_data_exp_shm_area+0x74
	.word	0x6af05486	! t1_data_exp_shm_area+0x78
	.word	0xed073407	! t1_data_exp_shm_area+0x7c
	.word	0xf2a8baae	! t1_data_exp_shm_area+0x80 (t0 bstore)
	.word	0xf07e82d7	! t1_data_exp_shm_area+0x84
	.word	0xfba359be	! t1_data_exp_shm_area+0x88
	.word	0xb9887ba3	! t1_data_exp_shm_area+0x8c
	.word	0x2bca17e1	! t1_data_exp_shm_area+0x90
	.word	0xd29121ee	! t1_data_exp_shm_area+0x94
	.word	0x05c4a7b6	! t1_data_exp_shm_area+0x98
	.word	0x6da5f3e8	! t1_data_exp_shm_area+0x9c
	.word	0xe6c7bf7d	! t1_data_exp_shm_area+0xa0
	.word	0xe5fbf33f	! t1_data_exp_shm_area+0xa4
	.word	0x1e4649c9	! t1_data_exp_shm_area+0xa8
	.word	0xa0dd9d03	! t1_data_exp_shm_area+0xac
	.word	0x2ff1730e	! t1_data_exp_shm_area+0xb0
	.word	0x16f04634	! t1_data_exp_shm_area+0xb4
	.word	0x18919c82	! t1_data_exp_shm_area+0xb8
	.word	0x09a0aee6	! t1_data_exp_shm_area+0xbc
	.word	0x4848c777	! t1_data_exp_shm_area+0xc0 (t1 bload)
	.word	0xfbc1fb1e	! t1_data_exp_shm_area+0xc4
	.word	0x7047afd3	! t1_data_exp_shm_area+0xc8
	.word	0x3c3f5340	! t1_data_exp_shm_area+0xcc
	.word	0xb4078377	! t1_data_exp_shm_area+0xd0
	.word	0x9a12a971	! t1_data_exp_shm_area+0xd4
	.word	0x64ddecfd	! t1_data_exp_shm_area+0xd8
	.word	0x61fa9deb	! t1_data_exp_shm_area+0xdc
	.word	0xe4785b20	! t1_data_exp_shm_area+0xe0
	.word	0x0098d625	! t1_data_exp_shm_area+0xe4
	.word	0xb5ba7467	! t1_data_exp_shm_area+0xe8
	.word	0xc520083b	! t1_data_exp_shm_area+0xec
	.word	0x70fc325c	! t1_data_exp_shm_area+0xf0
	.word	0x9bf4a50f	! t1_data_exp_shm_area+0xf4
	.word	0x816f614b	! t1_data_exp_shm_area+0xf8
	.word	0x60e3fff1	! t1_data_exp_shm_area+0xfc
	.word	0xaefa0f8b	! t1_data_exp_shm_area+0x100 (t1 bstore)
	.word	0xd4dc23d8	! t1_data_exp_shm_area+0x104
	.word	0x25c38fe7	! t1_data_exp_shm_area+0x108
	.word	0xe3125969	! t1_data_exp_shm_area+0x10c
	.word	0x7d1e24a6	! t1_data_exp_shm_area+0x110
	.word	0xe158865c	! t1_data_exp_shm_area+0x114
	.word	0xd068c53b	! t1_data_exp_shm_area+0x118
	.word	0x9207560e	! t1_data_exp_shm_area+0x11c
	.word	0x751dc6a6	! t1_data_exp_shm_area+0x120
	.word	0xcdaa5434	! t1_data_exp_shm_area+0x124
	.word	0xa5860f10	! t1_data_exp_shm_area+0x128
	.word	0x038e1e0f	! t1_data_exp_shm_area+0x12c
	.word	0xf3b8f726	! t1_data_exp_shm_area+0x130
	.word	0x61ca5b91	! t1_data_exp_shm_area+0x134
	.word	0x0539a03c	! t1_data_exp_shm_area+0x138
	.word	0x67c0a152	! t1_data_exp_shm_area+0x13c
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



