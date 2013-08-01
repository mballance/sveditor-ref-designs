/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: kaos_02_03_04_18.s
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
#define PART_1_USED
#define PART_2_USED
#define PART_3_USED
#define PART_4_USED
#define PART_5_USED
#define PART_6_USED
#define PART_7_USED
				
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
/* start ktbl.0.h */
#define T0_KAOS_NIAGARA
#define T0_KAOS_VERSION       4.2
#define T0_KAOS_SEED          d2744952f8e1
#define T0_KAOS_ICOUNT        2000
#define T0_KAOS_AREAS         1
#define T0_KAOS_AREASIZE      64
#define T0_KAOS_AREAOFFSET    3264
#define T0_KAOS_PAGESIZE      8192
#define T0_KAOS_CODECOUNT     2001

#define T0_KAOS_BOOT_VA                  0x15996000
#define T0_KAOS_BOOT_PA                  0x0000000000c44000
#define T0_KAOS_BOOT_CACHEABLE           1
#define T0_KAOS_BOOT_NONCACHEABLE        0

#define T0_KAOS_STARTUP_VA               0x3dd80000
#define T0_KAOS_STARTUP_PA               0x0000000003ac2000
#define T0_KAOS_STARTUP_CACHEABLE        1
#define T0_KAOS_STARTUP_NONCACHEABLE     0

#define T0_KAOS_OFFSET_TBL_VA            0x3a910000
#define T0_KAOS_OFFSET_TBL_PA            0x0000000005122000
#define T0_KAOS_OFFSET_TBL_CACHEABLE     1
#define T0_KAOS_OFFSET_TBL_NONCACHEABLE  0

#define T0_KAOS_DONE_VA                  0x38774000
#define T0_KAOS_DONE_PA                  0x0000000007faa000
#define T0_KAOS_DONE_CACHEABLE           1
#define T0_KAOS_DONE_NONCACHEABLE        0

#define T0_KAOS_KTBL_VA                  0x69e2c000
#define T0_KAOS_KTBL_PA                  0x00000000092e6000
#define T0_KAOS_KTBL_CACHEABLE           1
#define T0_KAOS_KTBL_NONCACHEABLE        0

#define T0_KAOS_SUBR0_VA                 0x27c3a000
#define T0_KAOS_SUBR0_PA                 0x000000000b9c4000
#define T0_KAOS_SUBR0_CACHEABLE          1
#define T0_KAOS_SUBR0_NONCACHEABLE       0
#define T0_KAOS_SUBR1_VA                 0x5e91e000
#define T0_KAOS_SUBR1_PA                 0x000000000d466000
#define T0_KAOS_SUBR1_CACHEABLE          1
#define T0_KAOS_SUBR1_NONCACHEABLE       0
#define T0_KAOS_SUBR2_VA                 0x69dfa000
#define T0_KAOS_SUBR2_PA                 0x000000000f99a000
#define T0_KAOS_SUBR2_CACHEABLE          1
#define T0_KAOS_SUBR2_NONCACHEABLE       0
#define T0_KAOS_SUBR3_VA                 0x69e80000
#define T0_KAOS_SUBR3_PA                 0x00000000103ea000
#define T0_KAOS_SUBR3_CACHEABLE          1
#define T0_KAOS_SUBR3_NONCACHEABLE       0

#define T0_KAOS_EXP_REGS_VA              0x199dc000
#define T0_KAOS_EXP_REGS_PA              0x00000000123f4000
#define T0_KAOS_EXP_REGS_CACHEABLE       1
#define T0_KAOS_EXP_REGS_NONCACHEABLE    0
#define T0_KAOS_RUN_REGS_VA              0x19eac000
#define T0_KAOS_RUN_REGS_PA              0x000000001499e000
#define T0_KAOS_RUN_REGS_CACHEABLE       1
#define T0_KAOS_RUN_REGS_NONCACHEABLE    0

#define T0_KAOS_EXP_STACK_VA             0x49c9c000
#define T0_KAOS_EXP_STACK_PA             0x0000000016992000
#define T0_KAOS_EXP_STACK_CACHEABLE      1
#define T0_KAOS_EXP_STACK_NONCACHEABLE   0
#define T0_KAOS_RUN_STACK_VA             0x516ea000
#define T0_KAOS_RUN_STACK_PA             0x0000000018c58000
#define T0_KAOS_RUN_STACK_CACHEABLE      1
#define T0_KAOS_RUN_STACK_NONCACHEABLE   0

#define T0_KAOS_AREA0
#define T0_KAOS_EXP_AREA0_VA             0x7ca94000
#define T0_KAOS_EXP_AREA0_PA             0x000000001bce8000
#define T0_KAOS_EXP_AREA0_CACHEABLE      1
#define T0_KAOS_EXP_AREA0_NONCACHEABLE   0
#define T0_KAOS_RUN_AREA0_VA             0x20964000
#define T0_KAOS_RUN_AREA0_PA             0x000000001d5e4000
#define T0_KAOS_RUN_AREA0_CACHEABLE      1
#define T0_KAOS_RUN_AREA0_NONCACHEABLE   0

#define T0_KAOS_SHM_AREA
#define T0_KAOS_EXP_SHM_AREA_VA          0x47e20000
#define T0_KAOS_EXP_SHM_AREA_PA          0x0000000000df6000
#define T0_KAOS_EXP_SHM_AREA_CACHEABLE   1
#define T0_KAOS_EXP_SHM_AREA_NONCACHEABLE 0
#define T0_KAOS_RUN_SHM_AREA_VA          0x1f83c000
#define T0_KAOS_RUN_SHM_AREA_PA          0x0000000001e98000
#define T0_KAOS_RUN_SHM_AREA_CACHEABLE   1
#define T0_KAOS_RUN_SHM_AREA_NONCACHEABLE 0

#define T0_KAOS_RANVAL_00     0x4b7d0b35
#define T0_KAOS_RANVAL_01     0xb9e998f8
#define T0_KAOS_RANVAL_02     0x6735addf
#define T0_KAOS_RANVAL_03     0x77538b96
#define T0_KAOS_RANVAL_04     0xf35302c5
#define T0_KAOS_RANVAL_05     0x610a0f6d
#define T0_KAOS_RANVAL_06     0xdab2c846
#define T0_KAOS_RANVAL_07     0xa3671c59
#define T0_KAOS_RANVAL_08     0x08e7a982
#define T0_KAOS_RANVAL_09     0x4209253c
#define T0_KAOS_RANVAL_0a     0xffd28922
#define T0_KAOS_RANVAL_0b     0xb00ec8bc
#define T0_KAOS_RANVAL_0c     0x97c9f97e
#define T0_KAOS_RANVAL_0d     0x3fa5c6e8
#define T0_KAOS_RANVAL_0e     0x5737c836
#define T0_KAOS_RANVAL_0f     0xfd522ac8
#define T0_KAOS_RANVAL_10     0x8ac793c5
#define T0_KAOS_RANVAL_11     0x08aa0226
#define T0_KAOS_RANVAL_12     0x8ed58b97
#define T0_KAOS_RANVAL_13     0x874d7b0d
#define T0_KAOS_RANVAL_14     0xb8384fa1
#define T0_KAOS_RANVAL_15     0x417e1dd4
#define T0_KAOS_RANVAL_16     0x0a057292
#define T0_KAOS_RANVAL_17     0x3df5ebb2
#define T0_KAOS_RANVAL_18     0xf8dcfa18
#define T0_KAOS_RANVAL_19     0x66c0bd29
#define T0_KAOS_RANVAL_1a     0x97df6acc
#define T0_KAOS_RANVAL_1b     0xaa6020cd
#define T0_KAOS_RANVAL_1c     0x9c6c09b9
#define T0_KAOS_RANVAL_1d     0x8761822e
#define T0_KAOS_RANVAL_1e     0xf97513a9
#define T0_KAOS_RANVAL_1f     0xc98559f4
#define T0_KAOS_RANVAL_20     0x5f4f4a97
#define T0_KAOS_RANVAL_21     0x5a9ee36d
#define T0_KAOS_RANVAL_22     0x66d573f1
#define T0_KAOS_RANVAL_23     0xaf392114
#define T0_KAOS_RANVAL_24     0x8bc1c696
#define T0_KAOS_RANVAL_25     0x4f1f28e7
#define T0_KAOS_RANVAL_26     0x38e3e5b1
#define T0_KAOS_RANVAL_27     0x1cca9280
#define T0_KAOS_RANVAL_28     0xcdad6de5
#define T0_KAOS_RANVAL_29     0xb767c44a
#define T0_KAOS_RANVAL_2a     0x79575c5f
#define T0_KAOS_RANVAL_2b     0x0ae9924d
#define T0_KAOS_RANVAL_2c     0xd89c43ca
#define T0_KAOS_RANVAL_2d     0x5c757863
#define T0_KAOS_RANVAL_2e     0xf7e56941
#define T0_KAOS_RANVAL_2f     0x171982dc
#define T0_KAOS_RANVAL_30     0xba0913a4
#define T0_KAOS_RANVAL_31     0x646b03d1
#define T0_KAOS_RANVAL_32     0xe5eea20e
#define T0_KAOS_RANVAL_33     0x878050b7
#define T0_KAOS_RANVAL_34     0x3c97f22e
#define T0_KAOS_RANVAL_35     0x787342fb
#define T0_KAOS_RANVAL_36     0x07384dd4
#define T0_KAOS_RANVAL_37     0xf579e7a1
#define T0_KAOS_RANVAL_38     0x4a7f0f00
#define T0_KAOS_RANVAL_39     0x754efd43
#define T0_KAOS_RANVAL_3a     0x88997c1d
#define T0_KAOS_RANVAL_3b     0xc54564e7
#define T0_KAOS_RANVAL_3c     0xbaec9a5b
#define T0_KAOS_RANVAL_3d     0x34d5d17b
#define T0_KAOS_RANVAL_3e     0x333fea4d
#define T0_KAOS_RANVAL_3f     0x10a29afc
#define T0_KAOS_RANVAL_40     0x5fbec325
#define T0_KAOS_RANVAL_41     0x5734f597
#define T0_KAOS_RANVAL_42     0x4e935b4e
#define T0_KAOS_RANVAL_43     0x188bba44
#define T0_KAOS_RANVAL_44     0xbaaf1132
#define T0_KAOS_RANVAL_45     0x882dbda4
#define T0_KAOS_RANVAL_46     0x4a04456e
#define T0_KAOS_RANVAL_47     0x48a0332f
#define T0_KAOS_RANVAL_48     0x3b629fc4
#define T0_KAOS_RANVAL_49     0xea411df8
#define T0_KAOS_RANVAL_4a     0x957cfa87
#define T0_KAOS_RANVAL_4b     0x4293258a
#define T0_KAOS_RANVAL_4c     0xcee4fc55
#define T0_KAOS_RANVAL_4d     0xe6d49cab
#define T0_KAOS_RANVAL_4e     0xa0faae5f
#define T0_KAOS_RANVAL_4f     0xca40f111
#define T0_KAOS_RANVAL_50     0x652bad93
#define T0_KAOS_RANVAL_51     0x22306645
#define T0_KAOS_RANVAL_52     0x3445ff52
#define T0_KAOS_RANVAL_53     0x1934bb48
#define T0_KAOS_RANVAL_54     0xae9ca6ab
#define T0_KAOS_RANVAL_55     0x33fd79b8
#define T0_KAOS_RANVAL_56     0x7518e52e
#define T0_KAOS_RANVAL_57     0x839ffe8a
#define T0_KAOS_RANVAL_58     0x02722aca
#define T0_KAOS_RANVAL_59     0xb3e61f90
#define T0_KAOS_RANVAL_5a     0x6e7a2a5d
#define T0_KAOS_RANVAL_5b     0x2e537662
#define T0_KAOS_RANVAL_5c     0x337ae4e0
#define T0_KAOS_RANVAL_5d     0x456a2068
#define T0_KAOS_RANVAL_5e     0x8df4d349
#define T0_KAOS_RANVAL_5f     0x2e69fd19
#define T0_KAOS_RANVAL_60     0x2b5d37a6
#define T0_KAOS_RANVAL_61     0x691b6ea0
#define T0_KAOS_RANVAL_62     0xc4d417fb
#define T0_KAOS_RANVAL_63     0xed4b2e8f
#define T0_KAOS_RANVAL_64     0xd17109e2
#define T0_KAOS_RANVAL_65     0xbb8f374c
#define T0_KAOS_RANVAL_66     0x22f2d405
#define T0_KAOS_RANVAL_67     0x4fb4e44e
#define T0_KAOS_RANVAL_68     0xe9b392e9
#define T0_KAOS_RANVAL_69     0xee9a8e6f
#define T0_KAOS_RANVAL_6a     0x503790a2
#define T0_KAOS_RANVAL_6b     0x71d7dedb
#define T0_KAOS_RANVAL_6c     0xde8ceb65
#define T0_KAOS_RANVAL_6d     0x9f312a68
#define T0_KAOS_RANVAL_6e     0x1fc48d1b
#define T0_KAOS_RANVAL_6f     0xee85304f
#define T0_KAOS_RANVAL_70     0x75576658
#define T0_KAOS_RANVAL_71     0x54afe2ab
#define T0_KAOS_RANVAL_72     0x1675696b
#define T0_KAOS_RANVAL_73     0x912f3c27
#define T0_KAOS_RANVAL_74     0x2e14f660
#define T0_KAOS_RANVAL_75     0x8cc3e5b4
#define T0_KAOS_RANVAL_76     0x8bba5725
#define T0_KAOS_RANVAL_77     0x0b5a6057
#define T0_KAOS_RANVAL_78     0xf2bf233c
#define T0_KAOS_RANVAL_79     0x04bada39
#define T0_KAOS_RANVAL_7a     0x927af495
#define T0_KAOS_RANVAL_7b     0x2b469ba4
#define T0_KAOS_RANVAL_7c     0xf662538e
#define T0_KAOS_RANVAL_7d     0x35175f9f
#define T0_KAOS_RANVAL_7e     0x05a93626
#define T0_KAOS_RANVAL_7f     0x145cc533
/* end ktbl.0.h */

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
/*#include "red_trap_table.s"
*/
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

!    kaos version   4.2
!    thread         0
!    icount         2000
!    targetid       NIAGARA:SIM
!    hostid         NIAGARA:5.8
!    areas          1
!    areasize       64
!    areaoffset     3264
!    ncache         0
!    emulate_ncache 1
!    pagesize       8192
!    invsize        0
!    codecount      2001
!    code           69e2c000
!    entry          69e2c000
!    fsr_exceptions 00000000
!    fsr_roundmode  00000004
!    fsr_mask       c0000fff
!    seed           d2744952f8e1
!    va_map         0000000000400000,000000007fffffff
!    pa_cached      0000000000400000,000000007fffffff
!    pa_noncached   000001ff00000000,000001ff7fffffff
!    weights        /import/n2-aus-localdir1/ntran/n2cdmspp/verif/diag/assembly/kaos/weights_files/allv9.w
!    begcount       0
!    endcount       2000
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

KTEXT_MODULE(t0_module_ktbl, 0x69e2c000)
.seg "text"
	KGLOBAL(t0_ktbl)
t0_ktbl_page_begin:
.global t0_kref; t0_kref:
	.skip 0
t0_ktbl:
	.word	0x9fc00004	! t0_kref+0x0:   	call	%g0 + %g4
	.word	0xd2367fe8	! t0_kref+0x4:   	sth	%o1, [%i1 - 0x18]
	.word	0xe640a018	! t0_kref+0x8:   	ldsw	[%g2 + 0x18], %l3
	.word	0xe93e2018	! t0_kref+0xc:   	std	%f20, [%i0 + 0x18]
	.word	0xf53e3fe8	! t0_kref+0x10:   	std	%f26, [%i0 - 0x18]
	.word	0xe636401b	! t0_kref+0x14:   	sth	%l3, [%i1 + %i3]
	.word	0x3e800003	! t0_kref+0x18:   	bvc,a	_kref+0x24
	.word	0x9264ea05	! t0_kref+0x1c:   	subc	%l3, 0xa05, %o1
	.word	0x38480003	! t0_kref+0x20:   	bgu,a,pt	%icc, _kref+0x2c
	.word	0xd448a02e	! t0_kref+0x24:   	ldsb	[%g2 + 0x2e], %o2
	.word	0xc0780018	! t0_kref+0x28:   	swap	[%g0 + %i0], %g0
	.word	0xa4dd7d1e	! t0_kref+0x2c:   	smulcc	%l5, -0x2e2, %l2
	.word	0xd2580018	! t0_kref+0x30:   	ldx	[%g0 + %i0], %o1
	.word	0xee50a014	! t0_kref+0x34:   	ldsh	[%g2 + 0x14], %l7
	.word	0xde167fe6	! t0_kref+0x38:   	lduh	[%i1 - 0x1a], %o7
	.word	0xa6da777c	! t0_kref+0x3c:   	smulcc	%o1, -0x884, %l3
	.word	0x99a58d26	! t0_kref+0x40:   	fsmuld	%f22, %f6, %f12
	.word	0x81ae8ab6	! t0_kref+0x44:   	fcmpes	%fcc0, %f26, %f22
	.word	0xa645bb4e	! t0_kref+0x48:   	addc	%l6, -0x4b2, %l3
	.word	0xd41e001d	! t0_kref+0x4c:   	ldd	[%i0 + %i5], %o2
	.word	0x2b800007	! t0_kref+0x50:   	fbug,a	_kref+0x6c
	.word	0xee30a030	! t0_kref+0x54:   	sth	%l7, [%g2 + 0x30]
	.word	0xb1a00154	! t0_kref+0x58:   	fabsd	%f20, %f24
	.word	0xe9ee501b	! t0_kref+0x5c:   	prefetcha	%i1 + %i3, 20
	.word	0x9494b6da	! t0_kref+0x60:   	orcc	%l2, -0x926, %o2
	.word	0x9eb339cf	! t0_kref+0x64:   	orncc	%o4, -0x631, %o7
	.word	0xd09e101d	! t0_kref+0x68:   	ldda	[%i0 + %i5]0x80, %o0
	.word	0x9fa149a1	! t0_kref+0x6c:   	fdivs	%f5, %f1, %f15
	.word	0xde40a028	! t0_kref+0x70:   	ldsw	[%g2 + 0x28], %o7
	.word	0x81aa0aa6	! t0_kref+0x74:   	fcmpes	%fcc0, %f8, %f6
	.word	0xa6d4c015	! t0_kref+0x78:   	umulcc	%l3, %l5, %l3
	.word	0xc398a040	! t0_kref+0x7c:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0x99a01939	! t0_kref+0x80:   	fstod	%f25, %f12
	.word	0xe2564000	! t0_kref+0x84:   	ldsh	[%i1], %l1
	.word	0xa53c8012	! t0_kref+0x88:   	sra	%l2, %l2, %l2
	.word	0xd430a018	! t0_kref+0x8c:   	sth	%o2, [%g2 + 0x18]
	.word	0x9653401a	! t0_kref+0x90:   	umul	%o5, %i2, %o3
	.word	0x2a480006	! t0_kref+0x94:   	bcs,a,pt	%icc, _kref+0xac
	.word	0xec362014	! t0_kref+0x98:   	sth	%l6, [%i0 + 0x14]
	.word	0x2c480001	! t0_kref+0x9c:   	bneg,a,pt	%icc, _kref+0xa0
	.word	0x95a54834	! t0_kref+0xa0:   	fadds	%f21, %f20, %f10
	.word	0xd208a02c	! t0_kref+0xa4:   	ldub	[%g2 + 0x2c], %o1
	.word	0xde4e2004	! t0_kref+0xa8:   	ldsb	[%i0 + 4], %o7
	.word	0xf186501c	! t0_kref+0xac:   	lda	[%i1 + %i4]0x80, %f24
	.word	0xb5a00123	! t0_kref+0xb0:   	fabss	%f3, %f26
	.word	0xdb871019	! t0_kref+0xb4:   	lda	[%i4 + %i1]0x80, %f13
	.word	0x81ab0ad2	! t0_kref+0xb8:   	fcmped	%fcc0, %f12, %f18
	call	SYM(t0_subr0)
	.word	0x98d50012	! t0_kref+0xc0:   	umulcc	%l4, %l2, %o4
	.word	0xb5a01a2d	! t0_kref+0xc4:   	fstoi	%f13, %f26
	.word	0xa2d33929	! t0_kref+0xc8:   	umulcc	%o4, -0x6d7, %l1
	.word	0xaedb400a	! t0_kref+0xcc:   	smulcc	%o5, %o2, %l7
	.word	0x87802080	! t0_kref+0xd0:   	mov	0x80, %asi
	.word	0xa092e22e	! t0_kref+0xd4:   	orcc	%o3, 0x22e, %l0
	.word	0xe4563ff6	! t0_kref+0xd8:   	ldsh	[%i0 - 0xa], %l2
	.word	0xd2863ff8	! t0_kref+0xdc:   	lda	[%i0 - 8]%asi, %o1
	.word	0x85a10934	! t0_kref+0xe0:   	fmuls	%f4, %f20, %f2
	.word	0xd428a033	! t0_kref+0xe4:   	stb	%o2, [%g2 + 0x33]
	.word	0x991eb2df	! t0_kref+0xe8:   	tsubcctv	%i2, -0xd21, %o4
	.word	0xe836c019	! t0_kref+0xec:   	sth	%l4, [%i3 + %i1]
	.word	0xa2c6b1a3	! t0_kref+0xf0:   	addccc	%i2, -0xe5d, %l1
	.word	0xa5a0012c	! t0_kref+0xf4:   	fabss	%f12, %f18
	.word	0xd41f4019	! t0_kref+0xf8:   	ldd	[%i5 + %i1], %o2
	.word	0xa1a00123	! t0_kref+0xfc:   	fabss	%f3, %f16
	.word	0x81a01928	! t0_kref+0x100:   	fstod	%f8, %f0
	.word	0x93a08826	! t0_kref+0x104:   	fadds	%f2, %f6, %f9
	.word	0xc36e6000	! t0_kref+0x108:   	prefetch	%i1, 1
	.word	0x8da24d20	! t0_kref+0x10c:   	fsmuld	%f9, %f0, %f6
	.word	0xac95add5	! t0_kref+0x110:   	orcc	%l6, 0xdd5, %l6
	.word	0xa532e013	! t0_kref+0x114:   	srl	%o3, 0x13, %l2
	.word	0x9246800a	! t0_kref+0x118:   	addc	%i2, %o2, %o1
	.word	0x9115fb8c	! t0_kref+0x11c:   	taddcctv	%l7, -0x474, %o0
	.word	0x98f32182	! t0_kref+0x120:   	udivcc	%o4, 0x182, %o4
	.word	0x89a40837	! t0_kref+0x124:   	fadds	%f16, %f23, %f4
	.word	0x8143e040	! t0_kref+0x128:   	membar	0x40
	.word	0xa73de004	! t0_kref+0x12c:   	sra	%l7, 0x4, %l3
	.word	0xf7ee101b	! t0_kref+0x130:   	prefetcha	%i0 + %i3, 27
	.word	0xb1a24d26	! t0_kref+0x134:   	fsmuld	%f9, %f6, %f24
	.word	0xd4a0a030	! t0_kref+0x138:   	sta	%o2, [%g2 + 0x30]%asi
	.word	0xada2c936	! t0_kref+0x13c:   	fmuls	%f11, %f22, %f22
	.word	0xad0cc01a	! t0_kref+0x140:   	tsubcc	%l3, %i2, %l6
	.word	0xac8d4013	! t0_kref+0x144:   	andcc	%l5, %l3, %l6
	.word	0xda362018	! t0_kref+0x148:   	sth	%o5, [%i0 + 0x18]
	.word	0xd1be1856	! t0_kref+0x14c:   	stda	%f8, [%i0 + %l6]0xc2
	.word	0x9ba1c8a5	! t0_kref+0x150:   	fsubs	%f7, %f5, %f13
	.word	0xa495a471	! t0_kref+0x154:   	orcc	%l6, 0x471, %l2
	.word	0x9fc10000	! t0_kref+0x158:   	call	%g4
	.word	0x89a01926	! t0_kref+0x15c:   	fstod	%f6, %f4
	.word	0x9126b358	! t0_kref+0x160:   	mulscc	%i2, -0xca8, %o0
	.word	0xaed26d37	! t0_kref+0x164:   	umulcc	%o1, 0xd37, %l7
	.word	0xedee101c	! t0_kref+0x168:   	prefetcha	%i0 + %i4, 22
	.word	0x9e0d8017	! t0_kref+0x16c:   	and	%l6, %l7, %o7
	.word	0xe0470018	! t0_kref+0x170:   	ldsw	[%i4 + %i0], %l0
	.word	0x9206b46e	! t0_kref+0x174:   	add	%i2, -0xb92, %o1
	.word	0xec48a01e	! t0_kref+0x178:   	ldsb	[%g2 + 0x1e], %l6
	.word	0xd11fbe90	! t0_kref+0x17c:   	ldd	[%fp - 0x170], %f8
	.word	0xd0ce3fe9	! t0_kref+0x180:   	ldsba	[%i0 - 0x17]%asi, %o0
	.word	0xd44e3ff9	! t0_kref+0x184:   	ldsb	[%i0 - 7], %o2
	.word	0xe27e3fe0	! t0_kref+0x188:   	swap	[%i0 - 0x20], %l1
	.word	0x3d800005	! t0_kref+0x18c:   	fbule,a	_kref+0x1a0
	.word	0x95a68921	! t0_kref+0x190:   	fmuls	%f26, %f1, %f10
	.word	0xa015ba5c	! t0_kref+0x194:   	or	%l6, -0x5a4, %l0
	.word	0x9a54800b	! t0_kref+0x198:   	umul	%l2, %o3, %o5
	.word	0xe4300018	! t0_kref+0x19c:   	sth	%l2, [%g0 + %i0]
	.word	0xae8de971	! t0_kref+0x1a0:   	andcc	%l7, 0x971, %l7
	.word	0xa0d32c05	! t0_kref+0x1a4:   	umulcc	%o4, 0xc05, %l0
	.word	0x2c480004	! t0_kref+0x1a8:   	bneg,a,pt	%icc, _kref+0x1b8
	.word	0x81868000	! t0_kref+0x1ac:   	wr	%i2, %g0, %y
	.word	0xa68377bc	! t0_kref+0x1b0:   	addcc	%o5, -0x844, %l3
	.word	0x9fc10000	! t0_kref+0x1b4:   	call	%g4
	.word	0xee30a03e	! t0_kref+0x1b8:   	sth	%l7, [%g2 + 0x3e]
	.word	0xf1ee501b	! t0_kref+0x1bc:   	prefetcha	%i1 + %i3, 24
	.word	0xa5a40d33	! t0_kref+0x1c0:   	fsmuld	%f16, %f19, %f18
	.word	0x925d4009	! t0_kref+0x1c4:   	smul	%l5, %o1, %o1
	.word	0xeb20a014	! t0_kref+0x1c8:   	st	%f21, [%g2 + 0x14]
	.word	0xf13e001d	! t0_kref+0x1cc:   	std	%f24, [%i0 + %i5]
	.word	0x81dd800f	! t0_kref+0x1d0:   	flush	%l6 + %o7
	.word	0xa32d000d	! t0_kref+0x1d4:   	sll	%l4, %o5, %l1
	.word	0xf207bfe0	! t0_kref+0x1d8:   	ld	[%fp - 0x20], %i1
	.word	0x9a54f335	! t0_kref+0x1dc:   	umul	%l3, -0xccb, %o5
	.word	0x8185c000	! t0_kref+0x1e0:   	wr	%l7, %g0, %y
	.word	0xdd180019	! t0_kref+0x1e4:   	ldd	[%g0 + %i1], %f14
	.word	0xe1ee101d	! t0_kref+0x1e8:   	prefetcha	%i0 + %i5, 16
	.word	0x9865b43c	! t0_kref+0x1ec:   	subc	%l6, -0xbc4, %o4
	.word	0xcda0a000	! t0_kref+0x1f0:   	sta	%f6, [%g2]%asi
	.word	0x81a98a40	! t0_kref+0x1f4:   	fcmpd	%fcc0, %f6, %f0
	.word	0xa10d000d	! t0_kref+0x1f8:   	tsubcc	%l4, %o5, %l0
	.word	0xe0062000	! t0_kref+0x1fc:   	ld	[%i0], %l0
	.word	0x95a44d2b	! t0_kref+0x200:   	fsmuld	%f17, %f11, %f10
	.word	0x91400000	! t0_kref+0x204:   	mov	%y, %o0
	.word	0x23480006	! t0_kref+0x208:   	fbne,a,pt	%fcc0, _kref+0x220
	.word	0xed20a020	! t0_kref+0x20c:   	st	%f22, [%g2 + 0x20]
	.word	0xada00125	! t0_kref+0x210:   	fabss	%f5, %f22
	.word	0xa03b24b1	! t0_kref+0x214:   	xnor	%o4, 0x4b1, %l0
	.word	0x8ba01a37	! t0_kref+0x218:   	fstoi	%f23, %f5
	.word	0xe6070019	! t0_kref+0x21c:   	ld	[%i4 + %i1], %l3
	.word	0xe64e6012	! t0_kref+0x220:   	ldsb	[%i1 + 0x12], %l3
	.word	0x8ba1c83a	! t0_kref+0x224:   	fadds	%f7, %f26, %f5
	.word	0x81a489b0	! t0_kref+0x228:   	fdivs	%f18, %f16, %f0
	.word	0xb1a0192e	! t0_kref+0x22c:   	fstod	%f14, %f24
	.word	0xaad83630	! t0_kref+0x230:   	smulcc	%g0, -0x9d0, %l5
	.word	0xe6774019	! t0_kref+0x234:   	stx	%l3, [%i5 + %i1]
	.word	0x85a01a2f	! t0_kref+0x238:   	fstoi	%f15, %f2
	.word	0xaee6bd0e	! t0_kref+0x23c:   	subccc	%i2, -0x2f2, %l7
	.word	0xeca8a034	! t0_kref+0x240:   	stba	%l6, [%g2 + 0x34]%asi
	.word	0xe84e3ff2	! t0_kref+0x244:   	ldsb	[%i0 - 0xe], %l4
	.word	0x989de884	! t0_kref+0x248:   	xorcc	%l7, 0x884, %o4
	.word	0xe51e2010	! t0_kref+0x24c:   	ldd	[%i0 + 0x10], %f18
	.word	0x21800002	! t0_kref+0x250:   	fbn,a	_kref+0x258
	.word	0xae8a400c	! t0_kref+0x254:   	andcc	%o1, %o4, %l7
	.word	0xe890a02a	! t0_kref+0x258:   	lduha	[%g2 + 0x2a]%asi, %l4
	.word	0x91a01a28	! t0_kref+0x25c:   	fstoi	%f8, %f8
	.word	0xd2866004	! t0_kref+0x260:   	lda	[%i1 + 4]%asi, %o1
	.word	0xf9ee101c	! t0_kref+0x264:   	prefetcha	%i0 + %i4, 28
	.word	0xed20a014	! t0_kref+0x268:   	st	%f22, [%g2 + 0x14]
	.word	0xa0b34013	! t0_kref+0x26c:   	orncc	%o5, %l3, %l0
	.word	0xf19e5a5c	! t0_kref+0x270:   	ldda	[%i1 + %i4]0xd2, %f24
	.word	0x2b800008	! t0_kref+0x274:   	fbug,a	_kref+0x294
	.word	0xaf32c012	! t0_kref+0x278:   	srl	%o3, %l2, %l7
	.word	0xf207bfe0	! t0_kref+0x27c:   	ld	[%fp - 0x20], %i1
	.word	0x9ba000b4	! t0_kref+0x280:   	fnegs	%f20, %f13
	.word	0x89a1892a	! t0_kref+0x284:   	fmuls	%f6, %f10, %f4
	.word	0xeac8a005	! t0_kref+0x288:   	ldsba	[%g2 + 5]%asi, %l5
	.word	0x81ac0ac6	! t0_kref+0x28c:   	fcmped	%fcc0, %f16, %f6
	.word	0xd880a008	! t0_kref+0x290:   	lda	[%g2 + 8]%asi, %o4
	.word	0x99a01a38	! t0_kref+0x294:   	fstoi	%f24, %f12
	.word	0x8d85000c	! t0_kref+0x298:   	wr	%l4, %o4, %fprs
	.word	0x8610200e	! t0_kref+0x29c:   	mov	0xe, %g3
	.word	0x86a0e001	! t0_kref+0x2a0:   	subcc	%g3, 1, %g3
	.word	0x22800014	! t0_kref+0x2a4:   	be,a	_kref+0x2f4
	.word	0xa3400000	! t0_kref+0x2a8:   	mov	%y, %l1
	.word	0x9b25398a	! t0_kref+0x2ac:   	mulscc	%l4, -0x676, %o5
	.word	0x81ac0a33	! t0_kref+0x2b0:   	fcmps	%fcc0, %f16, %f19
	.word	0x99a01937	! t0_kref+0x2b4:   	fstod	%f23, %f12
	.word	0xac437ac7	! t0_kref+0x2b8:   	addc	%o5, -0x539, %l6
	.word	0xd8264000	! t0_kref+0x2bc:   	st	%o4, [%i1]
	.word	0xd500a018	! t0_kref+0x2c0:   	ld	[%g2 + 0x18], %f10
	.word	0x25bffff7	! t0_kref+0x2c4:   	fblg,a	_kref+0x2a0
	.word	0xf3ee501a	! t0_kref+0x2c8:   	prefetcha	%i1 + %i2, 25
	.word	0xe93e6000	! t0_kref+0x2cc:   	std	%f20, [%i1]
	.word	0x85a01a3a	! t0_kref+0x2d0:   	fstoi	%f26, %f2
	.word	0xde871019	! t0_kref+0x2d4:   	lda	[%i4 + %i1]0x80, %o7
	.word	0x93a449b0	! t0_kref+0x2d8:   	fdivs	%f17, %f16, %f9
	.word	0x94b023ae	! t0_kref+0x2dc:   	orncc	%g0, 0x3ae, %o2
	.word	0x85a00936	! t0_kref+0x2e0:   	fmuls	%f0, %f22, %f2
	.word	0xc19e1a1a	! t0_kref+0x2e4:   	ldda	[%i0 + %i2]0xd0, %f0
	.word	0x3fbfffee	! t0_kref+0x2e8:   	fbo,a	_kref+0x2a0
	.word	0x96f00000	! t0_kref+0x2ec:   	udivcc	%g0, %g0, %o3
	.word	0x9ae2400a	! t0_kref+0x2f0:   	subccc	%o1, %o2, %o5
	.word	0x9aab0009	! t0_kref+0x2f4:   	andncc	%o4, %o1, %o5
	.word	0xa8954008	! t0_kref+0x2f8:   	orcc	%l5, %o0, %l4
	.word	0x99a3c82f	! t0_kref+0x2fc:   	fadds	%f15, %f15, %f12
	.word	0xd256c019	! t0_kref+0x300:   	ldsh	[%i3 + %i1], %o1
	.word	0xf428a01b	! t0_kref+0x304:   	stb	%i2, [%g2 + 0x1b]
	.word	0x81dab9b8	! t0_kref+0x308:   	flush	%o2 - 0x648
	.word	0xd2067fe0	! t0_kref+0x30c:   	ld	[%i1 - 0x20], %o1
	.word	0xe7ee501c	! t0_kref+0x310:   	prefetcha	%i1 + %i4, 19
	.word	0xa4b30009	! t0_kref+0x314:   	orncc	%o4, %o1, %l2
	.word	0x81dabe61	! t0_kref+0x318:   	flush	%o2 - 0x19f
	.word	0xa2ddc01a	! t0_kref+0x31c:   	smulcc	%l7, %i2, %l1
	.word	0xf51fbe50	! t0_kref+0x320:   	ldd	[%fp - 0x1b0], %f26
	.word	0x9730000a	! t0_kref+0x324:   	srl	%g0, %o2, %o3
	.word	0xd53e7ff0	! t0_kref+0x328:   	std	%f10, [%i1 - 0x10]
	.word	0x3e480003	! t0_kref+0x32c:   	bvc,a,pt	%icc, _kref+0x338
	.word	0xd1be9a18	! t0_kref+0x330:   	stda	%f8, [%i2 + %i0]0xd0
	.word	0xaa8a8017	! t0_kref+0x334:   	andcc	%o2, %l7, %l5
	.word	0x35800005	! t0_kref+0x338:   	fbue,a	_kref+0x34c
	.word	0xd228a02b	! t0_kref+0x33c:   	stb	%o1, [%g2 + 0x2b]
	.word	0xea30a006	! t0_kref+0x340:   	sth	%l5, [%g2 + 6]
	.word	0x24800002	! t0_kref+0x344:   	ble,a	_kref+0x34c
	.word	0xd53e001d	! t0_kref+0x348:   	std	%f10, [%i0 + %i5]
	.word	0xd286501c	! t0_kref+0x34c:   	lda	[%i1 + %i4]0x80, %o1
	.word	0x33800006	! t0_kref+0x350:   	fbe,a	_kref+0x368
	.word	0x94f3715d	! t0_kref+0x354:   	udivcc	%o5, -0xea3, %o2
	.word	0xf4762008	! t0_kref+0x358:   	stx	%i2, [%i0 + 8]
	.word	0x85a01921	! t0_kref+0x35c:   	fstod	%f1, %f2
	.word	0xe93f4018	! t0_kref+0x360:   	std	%f20, [%i5 + %i0]
	.word	0xdb00a028	! t0_kref+0x364:   	ld	[%g2 + 0x28], %f13
	.word	0x27480002	! t0_kref+0x368:   	fbul,a,pt	%fcc0, _kref+0x370
	.word	0xd6c8a02b	! t0_kref+0x36c:   	ldsba	[%g2 + 0x2b]%asi, %o3
	.word	0xe6767ff0	! t0_kref+0x370:   	stx	%l3, [%i1 - 0x10]
	.word	0xd19eda58	! t0_kref+0x374:   	ldda	[%i3 + %i0]0xd2, %f8
	.word	0x86102004	! t0_kref+0x378:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x37c:   	bne,a	_kref+0x37c
	.word	0x86a0e001	! t0_kref+0x380:   	subcc	%g3, 1, %g3
	.word	0x39480004	! t0_kref+0x384:   	fbuge,a,pt	%fcc0, _kref+0x394
	.word	0xc11e2010	! t0_kref+0x388:   	ldd	[%i0 + 0x10], %f0
	.word	0xecf01018	! t0_kref+0x38c:   	stxa	%l6, [%g0 + %i0]0x80
	.word	0x98f2c008	! t0_kref+0x390:   	udivcc	%o3, %o0, %o4
	.word	0x81ad0ad6	! t0_kref+0x394:   	fcmped	%fcc0, %f20, %f22
	.word	0xee88a03f	! t0_kref+0x398:   	lduba	[%g2 + 0x3f]%asi, %l7
	.word	0xcd1e3ff8	! t0_kref+0x39c:   	ldd	[%i0 - 8], %f6
	.word	0x89a01a58	! t0_kref+0x3a0:   	fdtoi	%f24, %f4
	.word	0xa1400000	! t0_kref+0x3a4:   	mov	%y, %l0
	.word	0x920b732c	! t0_kref+0x3a8:   	and	%o5, -0xcd4, %o1
	.word	0xd9180019	! t0_kref+0x3ac:   	ldd	[%g0 + %i1], %f12
	.word	0x9e007e00	! t0_kref+0x3b0:   	add	%g1, -0x200, %o7
!	.word	0x2d815702	! t0_kref+0x3b4:   	fbg,a	SYM(t0_subr3)
	   	fbg,a	SYM(t0_subr3)
	.word	0xe24e3fe6	! t0_kref+0x3b8:   	ldsb	[%i0 - 0x1a], %l1
	.word	0x8143e067	! t0_kref+0x3bc:   	membar	0x67
	.word	0x81dac001	! t0_kref+0x3c0:   	flush	%o3 + %g1
	.word	0x89a188a4	! t0_kref+0x3c4:   	fsubs	%f6, %f4, %f4
	.word	0xe07e0000	! t0_kref+0x3c8:   	swap	[%i0], %l0
	.word	0x8143c000	! t0_kref+0x3cc:   	stbar
	.word	0x99a01a2d	! t0_kref+0x3d0:   	fstoi	%f13, %f12
	.word	0x37800003	! t0_kref+0x3d4:   	fbge,a	_kref+0x3e0
	.word	0x9a50000c	! t0_kref+0x3d8:   	umul	%g0, %o4, %o5
	.word	0x9b34e01d	! t0_kref+0x3dc:   	srl	%l3, 0x1d, %o5
	.word	0xb1a000da	! t0_kref+0x3e0:   	fnegd	%f26, %f24
	.word	0xaa8eab50	! t0_kref+0x3e4:   	andcc	%i2, 0xb50, %l5
	sethi	%hi(2f), %o7
	.word	0xe40be028	! t0_kref+0x3ec:   	ldub	[%o7 + 0x28], %l2
	.word	0xa41ca00c	! t0_kref+0x3f0:   	xor	%l2, 0xc, %l2
	.word	0xe42be028	! t0_kref+0x3f4:   	stb	%l2, [%o7 + 0x28]
	.word	0x81dbe028	! t0_kref+0x3f8:   	flush	%o7 + 0x28
	.word	0x2d480004	! t0_kref+0x3fc:   	fbg,a,pt	%fcc0, _kref+0x40c
	.word	0xc9be584a	! t0_kref+0x400:   	stda	%f4, [%i1 + %o2]0xc2
	.word	0x33480003	! t0_kref+0x404:   	fbe,a,pt	%fcc0, _kref+0x410
	.word	0x91a40836	! t0_kref+0x408:   	fadds	%f16, %f22, %f8
	.word	0x8585a562	! t0_kref+0x40c:   	wr	%l6, 0x562, %ccr
	.word	0x8d84c00b	! t0_kref+0x410:   	wr	%l3, %o3, %fprs
	.word	0x33800005	! t0_kref+0x414:   	fbe,a	_kref+0x428
	.word	0xd93e2018	! t0_kref+0x418:   	std	%f12, [%i0 + 0x18]
	.word	0xa6b0000b	! t0_kref+0x41c:   	orncc	%g0, %o3, %l3
	.word	0xc9be1814	! t0_kref+0x420:   	stda	%f4, [%i0 + %l4]0xc0
	.word	0x31800003	! t0_kref+0x424:   	fba,a	_kref+0x430
2:	.word	0x9e06afbb	! t0_kref+0x428:   	add	%i2, 0xfbb, %o7
	.word	0x33480004	! t0_kref+0x42c:   	fbe,a,pt	%fcc0, _kref+0x43c
	.word	0x9eb372dc	! t0_kref+0x430:   	orncc	%o5, -0xd24, %o7
	.word	0xde00a004	! t0_kref+0x434:   	ld	[%g2 + 4], %o7
	.word	0xeaa0a004	! t0_kref+0x438:   	sta	%l5, [%g2 + 4]%asi
	.word	0x86102002	! t0_kref+0x43c:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x440:   	bne,a	_kref+0x440
	.word	0x86a0e001	! t0_kref+0x444:   	subcc	%g3, 1, %g3
	.word	0xc11fbe00	! t0_kref+0x448:   	ldd	[%fp - 0x200], %f0
	.word	0xd2a0a000	! t0_kref+0x44c:   	sta	%o1, [%g2]%asi
	.word	0xa0ddbd96	! t0_kref+0x450:   	smulcc	%l6, -0x26a, %l0
	.word	0xe68e9019	! t0_kref+0x454:   	lduba	[%i2 + %i1]0x80, %l3
	.word	0x9fa2c8ad	! t0_kref+0x458:   	fsubs	%f11, %f13, %f15
	.word	0xe6963ffe	! t0_kref+0x45c:   	lduha	[%i0 - 2]%asi, %l3
	.word	0xec780019	! t0_kref+0x460:   	swap	[%g0 + %i1], %l6
	.word	0xee2e3ff4	! t0_kref+0x464:   	stb	%l7, [%i0 - 0xc]
	.word	0x989d6e24	! t0_kref+0x468:   	xorcc	%l5, 0xe24, %o4
	.word	0x2f800001	! t0_kref+0x46c:   	fbu,a	_kref+0x470
	.word	0xb1a40837	! t0_kref+0x470:   	fadds	%f16, %f23, %f24
	.word	0xa3a1092e	! t0_kref+0x474:   	fmuls	%f4, %f14, %f17
	.word	0xe5380019	! t0_kref+0x478:   	std	%f18, [%g0 + %i1]
	.word	0x8da089b6	! t0_kref+0x47c:   	fdivs	%f2, %f22, %f6
	.word	0xcb00a018	! t0_kref+0x480:   	ld	[%g2 + 0x18], %f5
	.word	0xaed54008	! t0_kref+0x484:   	umulcc	%l5, %o0, %l7
	.word	0xda2e601e	! t0_kref+0x488:   	stb	%o5, [%i1 + 0x1e]
	.word	0xa4b238c6	! t0_kref+0x48c:   	orncc	%o0, -0x73a, %l2
	.word	0xe6e81018	! t0_kref+0x490:   	ldstuba	[%g0 + %i0]0x80, %l3
	.word	0xae52c008	! t0_kref+0x494:   	umul	%o3, %o0, %l7
	.word	0xa2fb000d	! t0_kref+0x498:   	sdivcc	%o4, %o5, %l1
	.word	0xea300018	! t0_kref+0x49c:   	sth	%l5, [%g0 + %i0]
	.word	0xe048a038	! t0_kref+0x4a0:   	ldsb	[%g2 + 0x38], %l0
	.word	0x27800006	! t0_kref+0x4a4:   	fbul,a	_kref+0x4bc
	.word	0xa9400000	! t0_kref+0x4a8:   	mov	%y, %l4
	.word	0xd3861000	! t0_kref+0x4ac:   	lda	[%i0]0x80, %f9
	.word	0xa6be8015	! t0_kref+0x4b0:   	xnorcc	%i2, %l5, %l3
	.word	0xe9ee101c	! t0_kref+0x4b4:   	prefetcha	%i0 + %i4, 20
	.word	0xf53e2000	! t0_kref+0x4b8:   	std	%f26, [%i0]
	.word	0xa3a04934	! t0_kref+0x4bc:   	fmuls	%f1, %f20, %f17
	.word	0x9ed4bd7e	! t0_kref+0x4c0:   	umulcc	%l2, -0x282, %o7
	.word	0xecf8a01c	! t0_kref+0x4c4:   	swapa	[%g2 + 0x1c]%asi, %l6
	.word	0x9453401a	! t0_kref+0x4c8:   	umul	%o5, %i2, %o2
	.word	0xa31dc012	! t0_kref+0x4cc:   	tsubcctv	%l7, %l2, %l1
	.word	0x98d4c013	! t0_kref+0x4d0:   	umulcc	%l3, %l3, %o4
	.word	0xff206c9a	! t0_kref+0x4d4:   	st	%f31, [%g1 + 0xc9a]
	.word	0xd8c8a033	! t0_kref+0x4d8:   	ldsba	[%g2 + 0x33]%asi, %o4
	.word	0x9da01a28	! t0_kref+0x4dc:   	fstoi	%f8, %f14
	.word	0x8143e040	! t0_kref+0x4e0:   	membar	0x40
	.word	0xf11e7ff8	! t0_kref+0x4e4:   	ldd	[%i1 - 8], %f24
	.word	0xac55c015	! t0_kref+0x4e8:   	umul	%l7, %l5, %l6
	.word	0xa0658017	! t0_kref+0x4ec:   	subc	%l6, %l7, %l0
	.word	0xe8b0a004	! t0_kref+0x4f0:   	stha	%l4, [%g2 + 4]%asi
	.word	0x9615800c	! t0_kref+0x4f4:   	or	%l6, %o4, %o3
	.word	0xeac8a004	! t0_kref+0x4f8:   	ldsba	[%g2 + 4]%asi, %l5
	.word	0x001fffff	! t0_kref+0x4fc:   	illtrap	0x1fffff
	.word	0xec2e6016	! t0_kref+0x500:   	stb	%l6, [%i1 + 0x16]
	.word	0x35800006	! t0_kref+0x504:   	fbue,a	_kref+0x51c
	.word	0x910b0008	! t0_kref+0x508:   	tsubcc	%o4, %o0, %o0
	.word	0xac8a6aaf	! t0_kref+0x50c:   	andcc	%o1, 0xaaf, %l6
	.word	0x81defc13	! t0_kref+0x510:   	flush	%i3 - 0x3ed
	.word	0x9fc00004	! t0_kref+0x514:   	call	%g0 + %g4
	.word	0xaba18824	! t0_kref+0x518:   	fadds	%f6, %f4, %f21
	.word	0xc700a030	! t0_kref+0x51c:   	ld	[%g2 + 0x30], %f3
	.word	0x81aa8ac0	! t0_kref+0x520:   	fcmped	%fcc0, %f10, %f0
	.word	0xc13e401d	! t0_kref+0x524:   	std	%f0, [%i1 + %i5]
	.word	0xac5dfeec	! t0_kref+0x528:   	smul	%l7, -0x114, %l6
	.word	0x99a28d2a	! t0_kref+0x52c:   	fsmuld	%f10, %f10, %f12
	.word	0xd700a014	! t0_kref+0x530:   	ld	[%g2 + 0x14], %f11
	.word	0xa1400000	! t0_kref+0x534:   	mov	%y, %l0
	.word	0x9a64c00c	! t0_kref+0x538:   	subc	%l3, %o4, %o5
	.word	0x20800001	! t0_kref+0x53c:   	bn,a	_kref+0x540
	.word	0xe5067ffc	! t0_kref+0x540:   	ld	[%i1 - 4], %f18
	.word	0xd45e001d	! t0_kref+0x544:   	ldx	[%i0 + %i5], %o2
	.word	0xa1a548a1	! t0_kref+0x548:   	fsubs	%f21, %f1, %f16
	.word	0xeab0a014	! t0_kref+0x54c:   	stha	%l5, [%g2 + 0x14]%asi
	.word	0xd0567ff2	! t0_kref+0x550:   	ldsh	[%i1 - 0xe], %o0
	.word	0x23800004	! t0_kref+0x554:   	fbne,a	_kref+0x564
	.word	0xd01e2008	! t0_kref+0x558:   	ldd	[%i0 + 8], %o0
	.word	0xd44e2015	! t0_kref+0x55c:   	ldsb	[%i0 + 0x15], %o2
	.word	0x8143c000	! t0_kref+0x560:   	stbar
	.word	0xae3d2666	! t0_kref+0x564:   	xnor	%l4, 0x666, %l7
	.word	0x81aa8ad2	! t0_kref+0x568:   	fcmped	%fcc0, %f10, %f18
	.word	0x9732e009	! t0_kref+0x56c:   	srl	%o3, 0x9, %o3
	.word	0x86102011	! t0_kref+0x570:   	mov	0x11, %g3
	.word	0x86a0e001	! t0_kref+0x574:   	subcc	%g3, 1, %g3
	.word	0x22800011	! t0_kref+0x578:   	be,a	_kref+0x5bc
	.word	0xe0064000	! t0_kref+0x57c:   	ld	[%i1], %l0
	.word	0x9ed33cf1	! t0_kref+0x580:   	umulcc	%o4, -0x30f, %o7
	.word	0x23bffffc	! t0_kref+0x584:   	fbne,a	_kref+0x574
	.word	0x9e648000	! t0_kref+0x588:   	subc	%l2, %g0, %o7
	.word	0xec20a034	! t0_kref+0x58c:   	st	%l6, [%g2 + 0x34]
	.word	0xd6580018	! t0_kref+0x590:   	ldx	[%g0 + %i0], %o3
	.word	0x90ab4009	! t0_kref+0x594:   	andncc	%o5, %o1, %o0
	.word	0xa4d54016	! t0_kref+0x598:   	umulcc	%l5, %l6, %l2
	.word	0x9852fdea	! t0_kref+0x59c:   	umul	%o3, -0x216, %o4
	.word	0x81df0008	! t0_kref+0x5a0:   	flush	%i4 + %o0
	.word	0x31480006	! t0_kref+0x5a4:   	fba,a,pt	%fcc0, _kref+0x5bc
	.word	0x90b00013	! t0_kref+0x5a8:   	orncc	%g0, %l3, %o0
	.word	0x93400000	! t0_kref+0x5ac:   	mov	%y, %o1
	.word	0x95a00033	! t0_kref+0x5b0:   	fmovs	%f19, %f10
	.word	0x92632e63	! t0_kref+0x5b4:   	subc	%o4, 0xe63, %o1
	.word	0xec6e8018	! t0_kref+0x5b8:   	ldstub	[%i2 + %i0], %l6
	.word	0x9ae4b76b	! t0_kref+0x5bc:   	subccc	%l2, -0x895, %o5
	.word	0x86102002	! t0_kref+0x5c0:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x5c4:   	bne,a	_kref+0x5c4
	.word	0x86a0e001	! t0_kref+0x5c8:   	subcc	%g3, 1, %g3
	.word	0xd62e2005	! t0_kref+0x5cc:   	stb	%o3, [%i0 + 5]
	.word	0x8d82c016	! t0_kref+0x5d0:   	wr	%o3, %l6, %fprs
	.word	0xac868008	! t0_kref+0x5d4:   	addcc	%i2, %o0, %l6
	.word	0xf207bfe0	! t0_kref+0x5d8:   	ld	[%fp - 0x20], %i1
	.word	0x2c480005	! t0_kref+0x5dc:   	bneg,a,pt	%icc, _kref+0x5f0
	.word	0x230ccb7b	! t0_kref+0x5e0:   	sethi	%hi(0x332dec00), %l1
	.word	0x81a00020	! t0_kref+0x5e4:   	fmovs	%f0, %f0
	.word	0x94b267b4	! t0_kref+0x5e8:   	orncc	%o1, 0x7b4, %o2
	.word	0xa6048017	! t0_kref+0x5ec:   	add	%l2, %l7, %l3
	.word	0xd028a02b	! t0_kref+0x5f0:   	stb	%o0, [%g2 + 0x2b]
	.word	0x36800007	! t0_kref+0x5f4:   	bge,a	_kref+0x610
	.word	0xd290a00a	! t0_kref+0x5f8:   	lduha	[%g2 + 0xa]%asi, %o1
	.word	0xa05a401a	! t0_kref+0x5fc:   	smul	%o1, %i2, %l0
	.word	0xd91e4000	! t0_kref+0x600:   	ldd	[%i1], %f12
	.word	0xaec2f590	! t0_kref+0x604:   	addccc	%o3, -0xa70, %l7
	.word	0xea267fe8	! t0_kref+0x608:   	st	%l5, [%i1 - 0x18]
	.word	0xd91e3ff8	! t0_kref+0x60c:   	ldd	[%i0 - 8], %f12
	.word	0xe2000018	! t0_kref+0x610:   	ld	[%g0 + %i0], %l1
	.word	0xcc18001d	! t0_kref+0x614:   	ldd	[%g0 + %i5], %g6
	.word	0x81a00131	! t0_kref+0x618:   	fabss	%f17, %f0
	.word	0x9de3bfa0	! t0_kref+0x61c:   	save	%sp, -0x60, %sp
	.word	0xb066c018	! t0_kref+0x620:   	subc	%i3, %i0, %i0
	.word	0x9fe80018	! t0_kref+0x624:   	restore	%g0, %i0, %o7
	.word	0xa0d22a0b	! t0_kref+0x628:   	umulcc	%o0, 0xa0b, %l0
	.word	0x87a04826	! t0_kref+0x62c:   	fadds	%f1, %f6, %f3
	.word	0x21480008	! t0_kref+0x630:   	fbn,a,pt	%fcc0, _kref+0x650
	.word	0x91a01a34	! t0_kref+0x634:   	fstoi	%f20, %f8
	.word	0xf5ee101b	! t0_kref+0x638:   	prefetcha	%i0 + %i3, 26
	.word	0xc1a0a014	! t0_kref+0x63c:   	sta	%f0, [%g2 + 0x14]%asi
	call	SYM(t0_subr3)
	.word	0xe11e6018	! t0_kref+0x644:   	ldd	[%i1 + 0x18], %f16
	.word	0x9662a6d4	! t0_kref+0x648:   	subc	%o2, 0x6d4, %o3
	.word	0xd0de3fe0	! t0_kref+0x64c:   	ldxa	[%i0 - 0x20]%asi, %o0
	.word	0xdad0a026	! t0_kref+0x650:   	ldsha	[%g2 + 0x26]%asi, %o5
	.word	0x81aa0ac6	! t0_kref+0x654:   	fcmped	%fcc0, %f8, %f6
	.word	0x81db8005	! t0_kref+0x658:   	flush	%sp + %g5
	.word	0x9fc10000	! t0_kref+0x65c:   	call	%g4
	.word	0xae1a400c	! t0_kref+0x660:   	xor	%o1, %o4, %l7
	.word	0x9e033b3e	! t0_kref+0x664:   	add	%o4, -0x4c2, %o7
	.word	0xefee501c	! t0_kref+0x668:   	prefetcha	%i1 + %i4, 23
	.word	0xd6fe6008	! t0_kref+0x66c:   	swapa	[%i1 + 8]%asi, %o3
	.word	0xe4067ffc	! t0_kref+0x670:   	ld	[%i1 - 4], %l2
	.word	0xdafe101c	! t0_kref+0x674:   	swapa	[%i0 + %i4]0x80, %o5
	.word	0xd8b0a01c	! t0_kref+0x678:   	stha	%o4, [%g2 + 0x1c]%asi
	.word	0xa8ba000d	! t0_kref+0x67c:   	xnorcc	%o0, %o5, %l4
	.word	0x85858016	! t0_kref+0x680:   	wr	%l6, %l6, %ccr
	.word	0x987ce2dc	! t0_kref+0x684:   	sdiv	%l3, 0x2dc, %o4
	.word	0x8da0012a	! t0_kref+0x688:   	fabss	%f10, %f6
	.word	0xd04e0000	! t0_kref+0x68c:   	ldsb	[%i0], %o0
	.word	0x920d8017	! t0_kref+0x690:   	and	%l6, %l7, %o1
	.word	0xd050a016	! t0_kref+0x694:   	ldsh	[%g2 + 0x16], %o0
	.word	0x8ba000a8	! t0_kref+0x698:   	fnegs	%f8, %f5
	.word	0x81a588da	! t0_kref+0x69c:   	fsubd	%f22, %f26, %f0
	.word	0x35800005	! t0_kref+0x6a0:   	fbue,a	_kref+0x6b4
	.word	0x8da0110c	! t0_kref+0x6a4:   	fxtod	%f12, %f6
	.word	0x83a64929	! t0_kref+0x6a8:   	fmuls	%f25, %f9, %f1
	.word	0x97a01882	! t0_kref+0x6ac:   	fitos	%f2, %f11
	.word	0x90bcefcb	! t0_kref+0x6b0:   	xnorcc	%l3, 0xfcb, %o0
	.word	0xa4a56f14	! t0_kref+0x6b4:   	subcc	%l5, 0xf14, %l2
	.word	0xa0baf183	! t0_kref+0x6b8:   	xnorcc	%o3, -0xe7d, %l0
	.word	0x25800008	! t0_kref+0x6bc:   	fblg,a	_kref+0x6dc
	.word	0xee88a036	! t0_kref+0x6c0:   	lduba	[%g2 + 0x36]%asi, %l7
	.word	0xd81e6018	! t0_kref+0x6c4:   	ldd	[%i1 + 0x18], %o4
	.word	0x9fc10000	! t0_kref+0x6c8:   	call	%g4
	.word	0xec000019	! t0_kref+0x6cc:   	ld	[%g0 + %i1], %l6
	.word	0x8da10936	! t0_kref+0x6d0:   	fmuls	%f4, %f22, %f6
	.word	0x92ab0009	! t0_kref+0x6d4:   	andncc	%o4, %o1, %o1
	.word	0x93a01a21	! t0_kref+0x6d8:   	fstoi	%f1, %f9
	.word	0x35800007	! t0_kref+0x6dc:   	fbue,a	_kref+0x6f8
	.word	0xe820a030	! t0_kref+0x6e0:   	st	%l4, [%g2 + 0x30]
	.word	0xee2e3fe8	! t0_kref+0x6e4:   	stb	%l7, [%i0 - 0x18]
	.word	0xb1a01a2d	! t0_kref+0x6e8:   	fstoi	%f13, %f24
	.word	0xed063ff4	! t0_kref+0x6ec:   	ld	[%i0 - 0xc], %f22
	.word	0xaba1c929	! t0_kref+0x6f0:   	fmuls	%f7, %f9, %f21
	.word	0x2c800002	! t0_kref+0x6f4:   	bneg,a	_kref+0x6fc
	.word	0x8ba44830	! t0_kref+0x6f8:   	fadds	%f17, %f16, %f5
	.word	0xe13f4018	! t0_kref+0x6fc:   	std	%f16, [%i5 + %i0]
	.word	0x97a01a23	! t0_kref+0x700:   	fstoi	%f3, %f11
	.word	0x81a80ad8	! t0_kref+0x704:   	fcmped	%fcc0, %f0, %f24
	.word	0x98daa3b2	! t0_kref+0x708:   	smulcc	%o2, 0x3b2, %o4
	.word	0x30800003	! t0_kref+0x70c:   	ba,a	_kref+0x718
	.word	0x96d0000c	! t0_kref+0x710:   	umulcc	%g0, %o4, %o3
	.word	0xda88a00e	! t0_kref+0x714:   	lduba	[%g2 + 0xe]%asi, %o5
	.word	0xacd48017	! t0_kref+0x718:   	umulcc	%l2, %l7, %l6
	.word	0x928b4015	! t0_kref+0x71c:   	andcc	%o5, %l5, %o1
	.word	0xd53e0000	! t0_kref+0x720:   	std	%f10, [%i0]
	.word	0xda28a02f	! t0_kref+0x724:   	stb	%o5, [%g2 + 0x2f]
	.word	0xe67e200c	! t0_kref+0x728:   	swap	[%i0 + 0xc], %l3
	sethi	%hi(2f), %o7
	.word	0xe40be36c	! t0_kref+0x730:   	ldub	[%o7 + 0x36c], %l2
	.word	0xa41ca00c	! t0_kref+0x734:   	xor	%l2, 0xc, %l2
	.word	0xe42be36c	! t0_kref+0x738:   	stb	%l2, [%o7 + 0x36c]
	.word	0x81dbe36c	! t0_kref+0x73c:   	flush	%o7 + 0x36c
	.word	0xa2800016	! t0_kref+0x740:   	addcc	%g0, %l6, %l1
	.word	0xf420a010	! t0_kref+0x744:   	st	%i2, [%g2 + 0x10]
	.word	0x28800005	! t0_kref+0x748:   	bleu,a	_kref+0x75c
	.word	0xaf2da010	! t0_kref+0x74c:   	sll	%l6, 0x10, %l7
	.word	0xcda0a000	! t0_kref+0x750:   	sta	%f6, [%g2]%asi
	.word	0x93a01a2d	! t0_kref+0x754:   	fstoi	%f13, %f9
	.word	0xcd3e6008	! t0_kref+0x758:   	std	%f6, [%i1 + 8]
	.word	0x91a01a29	! t0_kref+0x75c:   	fstoi	%f9, %f8
	.word	0xd11fbe90	! t0_kref+0x760:   	ldd	[%fp - 0x170], %f8
	.word	0x9abdc00d	! t0_kref+0x764:   	xnorcc	%l7, %o5, %o5
	.word	0x3f800004	! t0_kref+0x768:   	fbo,a	_kref+0x778
2:	.word	0x925b37d2	! t0_kref+0x76c:   	smul	%o4, -0x82e, %o1
	.word	0x9fc10000	! t0_kref+0x770:   	call	%g4
	.word	0xac5e8016	! t0_kref+0x774:   	smul	%i2, %l6, %l6
	.word	0x9b0c801a	! t0_kref+0x778:   	tsubcc	%l2, %i2, %o5
	.word	0xa60b0015	! t0_kref+0x77c:   	and	%o4, %l5, %l3
	.word	0x81ad8ad4	! t0_kref+0x780:   	fcmped	%fcc0, %f22, %f20
	.word	0x8143e011	! t0_kref+0x784:   	membar	0x11
	.word	0xa7a01a39	! t0_kref+0x788:   	fstoi	%f25, %f19
	.word	0x9a2dc015	! t0_kref+0x78c:   	andn	%l7, %l5, %o5
	.word	0x8da01938	! t0_kref+0x790:   	fstod	%f24, %f6
	.word	0x96bd3fb9	! t0_kref+0x794:   	xnorcc	%l4, -0x47, %o3
	.word	0x9f2d601b	! t0_kref+0x798:   	sll	%l5, 0x1b, %o7
	.word	0xacf5e267	! t0_kref+0x79c:   	udivcc	%l7, 0x267, %l6
	.word	0xda56c018	! t0_kref+0x7a0:   	ldsh	[%i3 + %i0], %o5
	.word	0x98d834a3	! t0_kref+0x7a4:   	smulcc	%g0, -0xb5d, %o4
	.word	0xaa433fb3	! t0_kref+0x7a8:   	addc	%o4, -0x4d, %l5
	.word	0x98b8000a	! t0_kref+0x7ac:   	xnorcc	%g0, %o2, %o4
	.word	0x99a648b2	! t0_kref+0x7b0:   	fsubs	%f25, %f18, %f12
	.word	0x92900014	! t0_kref+0x7b4:   	orcc	%g0, %l4, %o1
	.word	0xe450a024	! t0_kref+0x7b8:   	ldsh	[%g2 + 0x24], %l2
	.word	0xb3a000b8	! t0_kref+0x7bc:   	fnegs	%f24, %f25
	.word	0x9ba01a2a	! t0_kref+0x7c0:   	fstoi	%f10, %f13
	.word	0x9e0b7bfc	! t0_kref+0x7c4:   	and	%o5, -0x404, %o7
	.word	0x99a40844	! t0_kref+0x7c8:   	faddd	%f16, %f4, %f12
	.word	0xa205400b	! t0_kref+0x7cc:   	add	%l5, %o3, %l1
	.word	0xec562010	! t0_kref+0x7d0:   	ldsh	[%i0 + 0x10], %l6
	.word	0xe628a03a	! t0_kref+0x7d4:   	stb	%l3, [%g2 + 0x3a]
	.word	0xa1a0192b	! t0_kref+0x7d8:   	fstod	%f11, %f16
	.word	0x8d820012	! t0_kref+0x7dc:   	wr	%o0, %l2, %fprs
	.word	0xa9a01088	! t0_kref+0x7e0:   	fxtos	%f8, %f20
	.word	0xd828a021	! t0_kref+0x7e4:   	stb	%o4, [%g2 + 0x21]
	.word	0xa68b4009	! t0_kref+0x7e8:   	andcc	%o5, %o1, %l3
	.word	0x9fc10000	! t0_kref+0x7ec:   	call	%g4
	.word	0xa29b6051	! t0_kref+0x7f0:   	xorcc	%o5, 0x51, %l1
	.word	0xd11fbe40	! t0_kref+0x7f4:   	ldd	[%fp - 0x1c0], %f8
	.word	0x98b5616f	! t0_kref+0x7f8:   	orncc	%l5, 0x16f, %o4
	.word	0xe8f01018	! t0_kref+0x7fc:   	stxa	%l4, [%g0 + %i0]0x80
	.word	0xe36e401c	! t0_kref+0x800:   	prefetch	%i1 + %i4, 17
	.word	0x25800002	! t0_kref+0x804:   	fblg,a	_kref+0x80c
	.word	0xf207bfe0	! t0_kref+0x808:   	ld	[%fp - 0x20], %i1
	.word	0xc0b67fe6	! t0_kref+0x80c:   	stha	%g0, [%i1 - 0x1a]%asi
	.word	0x8143e061	! t0_kref+0x810:   	membar	0x61
	.word	0xc56e6010	! t0_kref+0x814:   	prefetch	%i1 + 0x10, 2
	.word	0x81ad8a5a	! t0_kref+0x818:   	fcmpd	%fcc0, %f22, %f26
	.word	0xaec3400d	! t0_kref+0x81c:   	addccc	%o5, %o5, %l7
	.word	0x9b400000	! t0_kref+0x820:   	mov	%y, %o5
	.word	0xb5a14d34	! t0_kref+0x824:   	fsmuld	%f5, %f20, %f26
	.word	0xa8bb6ee2	! t0_kref+0x828:   	xnorcc	%o5, 0xee2, %l4
	.word	0xd09e3fe0	! t0_kref+0x82c:   	ldda	[%i0 - 0x20]%asi, %o0
	.word	0x9664800b	! t0_kref+0x830:   	subc	%l2, %o3, %o3
	.word	0x9fc00004	! t0_kref+0x834:   	call	%g0 + %g4
	.word	0x8da24925	! t0_kref+0x838:   	fmuls	%f9, %f5, %f6
	.word	0xf7ee501c	! t0_kref+0x83c:   	prefetcha	%i1 + %i4, 27
	.word	0x3b800007	! t0_kref+0x840:   	fble,a	_kref+0x85c
	.word	0xd91e2018	! t0_kref+0x844:   	ldd	[%i0 + 0x18], %f12
	.word	0x81850000	! t0_kref+0x848:   	wr	%l4, %g0, %y
	.word	0xd6566002	! t0_kref+0x84c:   	ldsh	[%i1 + 2], %o3
	.word	0xa6ba8000	! t0_kref+0x850:   	xnorcc	%o2, %g0, %l3
	.word	0xd49e2000	! t0_kref+0x854:   	ldda	[%i0]%asi, %o2
	.word	0x3d800001	! t0_kref+0x858:   	fbule,a	_kref+0x85c
	.word	0xc030a03a	! t0_kref+0x85c:   	clrh	[%g2 + 0x3a]
	.word	0xd62e3ff3	! t0_kref+0x860:   	stb	%o3, [%i0 - 0xd]
	.word	0xd40e401a	! t0_kref+0x864:   	ldub	[%i1 + %i2], %o2
	.word	0x95a548b0	! t0_kref+0x868:   	fsubs	%f21, %f16, %f10
	.word	0x9fc00004	! t0_kref+0x86c:   	call	%g0 + %g4
	.word	0xefe8a009	! t0_kref+0x870:   	prefetcha	%g2 + 9, 23
	.word	0xec160000	! t0_kref+0x874:   	lduh	[%i0], %l6
	.word	0x32480004	! t0_kref+0x878:   	bne,a,pt	%icc, _kref+0x888
	.word	0x953d200b	! t0_kref+0x87c:   	sra	%l4, 0xb, %o2
	.word	0xcf80a004	! t0_kref+0x880:   	lda	[%g2 + 4]%asi, %f7
	.word	0xdac8a02c	! t0_kref+0x884:   	ldsba	[%g2 + 0x2c]%asi, %o5
	.word	0xf1ee101d	! t0_kref+0x888:   	prefetcha	%i0 + %i5, 24
	.word	0xe56e001b	! t0_kref+0x88c:   	prefetch	%i0 + %i3, 18
	.word	0xf19e1a5b	! t0_kref+0x890:   	ldda	[%i0 + %i3]0xd2, %f24
	.word	0xb3a000a9	! t0_kref+0x894:   	fnegs	%f9, %f25
	.word	0xd056001b	! t0_kref+0x898:   	ldsh	[%i0 + %i3], %o0
	.word	0xe720a004	! t0_kref+0x89c:   	st	%f19, [%g2 + 4]
	.word	0xa63cfccf	! t0_kref+0x8a0:   	xnor	%l3, -0x331, %l3
	.word	0x81daf625	! t0_kref+0x8a4:   	flush	%o3 - 0x9db
	.word	0xe91e6018	! t0_kref+0x8a8:   	ldd	[%i1 + 0x18], %f20
	.word	0xec48a02c	! t0_kref+0x8ac:   	ldsb	[%g2 + 0x2c], %l6
	.word	0x85a8c044	! t0_kref+0x8b0:   	fmovdul	%fcc0, %f4, %f2
	.word	0xd4ae2007	! t0_kref+0x8b4:   	stba	%o2, [%i0 + 7]%asi
	.word	0xf007bfe0	! t0_kref+0x8b8:   	ld	[%fp - 0x20], %i0
	.word	0xa936a01f	! t0_kref+0x8bc:   	srl	%i2, 0x1f, %l4
	.word	0x98a30012	! t0_kref+0x8c0:   	subcc	%o4, %l2, %o4
	.word	0x35800004	! t0_kref+0x8c4:   	fbue,a	_kref+0x8d4
	.word	0xf56e001a	! t0_kref+0x8c8:   	prefetch	%i0 + %i2, 26
	.word	0x87a20923	! t0_kref+0x8cc:   	fmuls	%f8, %f3, %f3
	.word	0x9644b6e6	! t0_kref+0x8d0:   	addc	%l2, -0x91a, %o3
	.word	0xe4086334	! t0_kref+0x8d4:   	ldub	[%g1 + 0x334], %l2
	.word	0xa41ca00c	! t0_kref+0x8d8:   	xor	%l2, 0xc, %l2
	.word	0xe4286334	! t0_kref+0x8dc:   	stb	%l2, [%g1 + 0x334]
	.word	0x81d86334	! t0_kref+0x8e0:   	flush	%g1 + 0x334
	.word	0x90a0000c	! t0_kref+0x8e4:   	subcc	%g0, %o4, %o0
2:	.word	0xe20e4000	! t0_kref+0x8e8:   	ldub	[%i1], %l1
	.word	0xc53e001d	! t0_kref+0x8ec:   	std	%f2, [%i0 + %i5]
	call	SYM(t0_subr1)
	.word	0xd430a02e	! t0_kref+0x8f4:   	sth	%o2, [%g2 + 0x2e]
	.word	0xe7ee101b	! t0_kref+0x8f8:   	prefetcha	%i0 + %i3, 19
	.word	0x81a80ac4	! t0_kref+0x8fc:   	fcmped	%fcc0, %f0, %f4
	.word	0xd010a028	! t0_kref+0x900:   	lduh	[%g2 + 0x28], %o0
	.word	0xea80a008	! t0_kref+0x904:   	lda	[%g2 + 8]%asi, %l5
	.word	0xa9352002	! t0_kref+0x908:   	srl	%l4, 0x2, %l4
	.word	0xd41e0000	! t0_kref+0x90c:   	ldd	[%i0], %o2
	.word	0x92da7811	! t0_kref+0x910:   	smulcc	%o1, -0x7ef, %o1
	.word	0x28800006	! t0_kref+0x914:   	bleu,a	_kref+0x92c
	.word	0xe2564000	! t0_kref+0x918:   	ldsh	[%i1], %l1
	.word	0xea96501b	! t0_kref+0x91c:   	lduha	[%i1 + %i3]0x80, %l5
	.word	0xa03a4009	! t0_kref+0x920:   	xnor	%o1, %o1, %l0
	.word	0xae1d7bfa	! t0_kref+0x924:   	xor	%l5, -0x406, %l7
	.word	0xa9a60856	! t0_kref+0x928:   	faddd	%f24, %f22, %f20
	.word	0x91a60d2d	! t0_kref+0x92c:   	fsmuld	%f24, %f13, %f8
	.word	0xf380a034	! t0_kref+0x930:   	lda	[%g2 + 0x34]%asi, %f25
	.word	0x81dae00d	! t0_kref+0x934:   	flush	%o3 + 0xd
	.word	0xf4767fe8	! t0_kref+0x938:   	stx	%i2, [%i1 - 0x18]
	.word	0x9ba0003a	! t0_kref+0x93c:   	fmovs	%f26, %f13
	.word	0x87a01a28	! t0_kref+0x940:   	fstoi	%f8, %f3
	.word	0xf5ee501c	! t0_kref+0x944:   	prefetcha	%i1 + %i4, 26
	.word	0xd580a00c	! t0_kref+0x948:   	lda	[%g2 + 0xc]%asi, %f10
	.word	0xf96e2018	! t0_kref+0x94c:   	prefetch	%i0 + 0x18, 28
	.word	0x2b800001	! t0_kref+0x950:   	fbug,a	_kref+0x954
	.word	0xa4456d57	! t0_kref+0x954:   	addc	%l5, 0xd57, %l2
	.word	0xa892400b	! t0_kref+0x958:   	orcc	%o1, %o3, %l4
	.word	0x81df001e	! t0_kref+0x95c:   	flush	%i4 + %fp
	.word	0xa7256b53	! t0_kref+0x960:   	mulscc	%l5, 0xb53, %l3
	.word	0xa9a009c4	! t0_kref+0x964:   	fdivd	%f0, %f4, %f20
	.word	0xa2e6800a	! t0_kref+0x968:   	subccc	%i2, %o2, %l1
	.word	0xc99eda58	! t0_kref+0x96c:   	ldda	[%i3 + %i0]0xd2, %f4
	.word	0x9e9dc00b	! t0_kref+0x970:   	xorcc	%l7, %o3, %o7
	.word	0xacf54008	! t0_kref+0x974:   	udivcc	%l5, %o0, %l6
	.word	0xa8450017	! t0_kref+0x978:   	addc	%l4, %l7, %l4
!	.word	0x28495590	! t0_kref+0x97c:   	bleu,a,pt	%icc, SYM(t0_subr3)
	   	bleu,a,pt	%icc, SYM(t0_subr3)
	.word	0x9f414000	! t0_kref+0x980:   	mov	%pc, %o7
	.word	0xec36c018	! t0_kref+0x984:   	sth	%l6, [%i3 + %i0]
	.word	0x8143e019	! t0_kref+0x988:   	membar	0x19
	.word	0x85a01a28	! t0_kref+0x98c:   	fstoi	%f8, %f2
	.word	0x99a88028	! t0_kref+0x990:   	fmovslg	%fcc0, %f8, %f12
	.word	0x86102009	! t0_kref+0x994:   	mov	0x9, %g3
	.word	0x86a0e001	! t0_kref+0x998:   	subcc	%g3, 1, %g3
	.word	0x22800002	! t0_kref+0x99c:   	be,a	_kref+0x9a4
	.word	0x9a0023eb	! t0_kref+0x9a0:   	add	%g0, 0x3eb, %o5
	.word	0x2d800008	! t0_kref+0x9a4:   	fbg,a	_kref+0x9c4
	.word	0x9da64829	! t0_kref+0x9a8:   	fadds	%f25, %f9, %f14
	.word	0x99a1482c	! t0_kref+0x9ac:   	fadds	%f5, %f12, %f12
	.word	0xd300a02c	! t0_kref+0x9b0:   	ld	[%g2 + 0x2c], %f9
	.word	0xf16e3fe0	! t0_kref+0x9b4:   	prefetch	%i0 - 0x20, 24
	.word	0xe3ee101c	! t0_kref+0x9b8:   	prefetcha	%i0 + %i4, 17
	.word	0xe5867ff4	! t0_kref+0x9bc:   	lda	[%i1 - 0xc]%asi, %f18
	call	SYM(t0_subr3)
	.word	0x81850000	! t0_kref+0x9c4:   	wr	%l4, %g0, %y
	.word	0x81adcab5	! t0_kref+0x9c8:   	fcmpes	%fcc0, %f23, %f21
	.word	0x9ba01a25	! t0_kref+0x9cc:   	fstoi	%f5, %f13
	.word	0xd67e7fe8	! t0_kref+0x9d0:   	swap	[%i1 - 0x18], %o3
	.word	0xa5a289d4	! t0_kref+0x9d4:   	fdivd	%f10, %f20, %f18
	.word	0x9ba01889	! t0_kref+0x9d8:   	fitos	%f9, %f13
	.word	0x86102002	! t0_kref+0x9dc:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x9e0:   	bne,a	_kref+0x9e0
	.word	0x86a0e001	! t0_kref+0x9e4:   	subcc	%g3, 1, %g3
	.word	0x952ea001	! t0_kref+0x9e8:   	sll	%i2, 0x1, %o2
	.word	0x29800007	! t0_kref+0x9ec:   	fbl,a	_kref+0xa08
	.word	0xa5a08d35	! t0_kref+0x9f0:   	fsmuld	%f2, %f21, %f18
	.word	0x9f400000	! t0_kref+0x9f4:   	mov	%y, %o7
	.word	0x9afac012	! t0_kref+0x9f8:   	sdivcc	%o3, %l2, %o5
	.word	0x96b57f52	! t0_kref+0x9fc:   	orncc	%l5, -0xae, %o3
	.word	0xd67e0000	! t0_kref+0xa00:   	swap	[%i0], %o3
	.word	0xfbee101a	! t0_kref+0xa04:   	prefetcha	%i0 + %i2, 29
	.word	0x989d0009	! t0_kref+0xa08:   	xorcc	%l4, %o1, %o4
	.word	0xd226401c	! t0_kref+0xa0c:   	st	%o1, [%i1 + %i4]
	.word	0x3e800007	! t0_kref+0xa10:   	bvc,a	_kref+0xa2c
	.word	0xe16e001a	! t0_kref+0xa14:   	prefetch	%i0 + %i2, 16
	.word	0x232dfca0	! t0_kref+0xa18:   	sethi	%hi(0xb7f28000), %l1
	.word	0xd826401c	! t0_kref+0xa1c:   	st	%o4, [%i1 + %i4]
	.word	0xaf3a0016	! t0_kref+0xa20:   	sra	%o0, %l6, %l7
	.word	0x39800008	! t0_kref+0xa24:   	fbuge,a	_kref+0xa44
	.word	0x81a4cd35	! t0_kref+0xa28:   	fsmuld	%f19, %f21, %f0
	.word	0x81dfc00c	! t0_kref+0xa2c:   	flush	%i7 + %o4
	.word	0xd44e7ff6	! t0_kref+0xa30:   	ldsb	[%i1 - 0xa], %o2
	.word	0xd040a02c	! t0_kref+0xa34:   	ldsw	[%g2 + 0x2c], %o0
	.word	0x91400000	! t0_kref+0xa38:   	mov	%y, %o0
	.word	0x967b000b	! t0_kref+0xa3c:   	sdiv	%o4, %o3, %o3
	.word	0x99a48d2a	! t0_kref+0xa40:   	fsmuld	%f18, %f10, %f12
	.word	0xcf861000	! t0_kref+0xa44:   	lda	[%i0]0x80, %f7
	.word	0xed1e6008	! t0_kref+0xa48:   	ldd	[%i1 + 8], %f22
	.word	0xae0d000d	! t0_kref+0xa4c:   	and	%l4, %o5, %l7
	.word	0xab400000	! t0_kref+0xa50:   	mov	%y, %l5
	.word	0x9fc00004	! t0_kref+0xa54:   	call	%g0 + %g4
	.word	0xada309cc	! t0_kref+0xa58:   	fdivd	%f12, %f12, %f22
	.word	0x9922755a	! t0_kref+0xa5c:   	mulscc	%o1, -0xaa6, %o4
	.word	0x39800001	! t0_kref+0xa60:   	fbuge,a	_kref+0xa64
	.word	0xe8862018	! t0_kref+0xa64:   	lda	[%i0 + 0x18]%asi, %l4
	.word	0xe828a005	! t0_kref+0xa68:   	stb	%l4, [%g2 + 5]
	.word	0xc96e2018	! t0_kref+0xa6c:   	prefetch	%i0 + 0x18, 4
	.word	0x9fc10000	! t0_kref+0xa70:   	call	%g4
	.word	0xaeb2c013	! t0_kref+0xa74:   	orncc	%o3, %l3, %l7
	.word	0x9f33600a	! t0_kref+0xa78:   	srl	%o5, 0xa, %o7
	.word	0xde865000	! t0_kref+0xa7c:   	lda	[%i1]0x80, %o7
	.word	0xa0b4e7a8	! t0_kref+0xa80:   	orncc	%l3, 0x7a8, %l0
	call	SYM(t0_subr3)
	.word	0xaba4483a	! t0_kref+0xa88:   	fadds	%f17, %f26, %f21
	.word	0x25800001	! t0_kref+0xa8c:   	fblg,a	_kref+0xa90
	.word	0xaf350015	! t0_kref+0xa90:   	srl	%l4, %l5, %l7
	.word	0x86102020	! t0_kref+0xa94:   	mov	0x20, %g3
	.word	0x86a0e001	! t0_kref+0xa98:   	subcc	%g3, 1, %g3
	.word	0x2280000d	! t0_kref+0xa9c:   	be,a	_kref+0xad0
	.word	0xdac0a024	! t0_kref+0xaa0:   	ldswa	[%g2 + 0x24]%asi, %o5
	.word	0x81ab8ac0	! t0_kref+0xaa4:   	fcmped	%fcc0, %f14, %f0
	.word	0x9fc10000	! t0_kref+0xaa8:   	call	%g4
	.word	0x912d0012	! t0_kref+0xaac:   	sll	%l4, %l2, %o0
	.word	0xd81e3fe8	! t0_kref+0xab0:   	ldd	[%i0 - 0x18], %o4
	.word	0xc1be1896	! t0_kref+0xab4:   	stda	%f0, [%i0 + %l6]0xc4
	.word	0x81aac040	! t0_kref+0xab8:   	fmovdge	%fcc0, %f0, %f0
	.word	0x224ffff7	! t0_kref+0xabc:   	be,a,pt	%icc, _kref+0xa98
	.word	0xac2b2811	! t0_kref+0xac0:   	andn	%o4, 0x811, %l6
	.word	0x9fc10000	! t0_kref+0xac4:   	call	%g4
	.word	0xe6b67fe6	! t0_kref+0xac8:   	stha	%l3, [%i1 - 0x1a]%asi
	.word	0x81da60bd	! t0_kref+0xacc:   	flush	%o1 + 0xbd
	.word	0xe6070019	! t0_kref+0xad0:   	ld	[%i4 + %i1], %l3
	.word	0x9ec2c015	! t0_kref+0xad4:   	addccc	%o3, %l5, %o7
	.word	0xa0d2b4ec	! t0_kref+0xad8:   	umulcc	%o2, -0xb14, %l0
	.word	0xa69b7baa	! t0_kref+0xadc:   	xorcc	%o5, -0x456, %l3
	call	SYM(t0_subr3)
	.word	0xcd20a008	! t0_kref+0xae4:   	st	%f6, [%g2 + 8]
	.word	0xaa5dfe71	! t0_kref+0xae8:   	smul	%l7, -0x18f, %l5
	.word	0xecee101a	! t0_kref+0xaec:   	ldstuba	[%i0 + %i2]0x80, %l6
	.word	0xea280018	! t0_kref+0xaf0:   	stb	%l5, [%g0 + %i0]
	.word	0xd8865000	! t0_kref+0xaf4:   	lda	[%i1]0x80, %o4
	.word	0xa6dce0db	! t0_kref+0xaf8:   	smulcc	%l3, 0xdb, %l3
	.word	0xa2e52378	! t0_kref+0xafc:   	subccc	%l4, 0x378, %l1
	.word	0x9a54ec8b	! t0_kref+0xb00:   	umul	%l3, 0xc8b, %o5
	.word	0xd620a028	! t0_kref+0xb04:   	st	%o3, [%g2 + 0x28]
	.word	0xc36e0013	! t0_kref+0xb08:   	prefetch	%i0 + %l3, 1
	.word	0x99aa4046	! t0_kref+0xb0c:   	fmovde	%fcc0, %f6, %f12
	.word	0xe6e8a02b	! t0_kref+0xb10:   	ldstuba	[%g2 + 0x2b]%asi, %l3
	.word	0xd6267fe4	! t0_kref+0xb14:   	st	%o3, [%i1 - 0x1c]
	.word	0x98de8014	! t0_kref+0xb18:   	smulcc	%i2, %l4, %o4
	.word	0xecfe3fe8	! t0_kref+0xb1c:   	swapa	[%i0 - 0x18]%asi, %l6
	.word	0xd87e601c	! t0_kref+0xb20:   	swap	[%i1 + 0x1c], %o4
!	.word	0x3f495526	! t0_kref+0xb24:   	fbo,a,pt	%fcc0, SYM(t0_subr3)
	   	fbo,a,pt	%fcc0, SYM(t0_subr3)
	.word	0x9e006570	! t0_kref+0xb28:   	add	%g1, 0x570, %o7
	.word	0xea563ff4	! t0_kref+0xb2c:   	ldsh	[%i0 - 0xc], %l5
	.word	0xc56e7ff8	! t0_kref+0xb30:   	prefetch	%i1 - 8, 2
	.word	0x87a24936	! t0_kref+0xb34:   	fmuls	%f9, %f22, %f3
	.word	0x37480003	! t0_kref+0xb38:   	fbge,a,pt	%fcc0, _kref+0xb44
	.word	0x9da00128	! t0_kref+0xb3c:   	fabss	%f8, %f14
	.word	0x9328001a	! t0_kref+0xb40:   	sll	%g0, %i2, %o1
	.word	0xea367fe8	! t0_kref+0xb44:   	sth	%l5, [%i1 - 0x18]
	.word	0xd030a020	! t0_kref+0xb48:   	sth	%o0, [%g2 + 0x20]
	.word	0xa7a04829	! t0_kref+0xb4c:   	fadds	%f1, %f9, %f19
	.word	0x33480003	! t0_kref+0xb50:   	fbe,a,pt	%fcc0, _kref+0xb5c
	.word	0xafa00034	! t0_kref+0xb54:   	fmovs	%f20, %f23
	.word	0xf76e3ff8	! t0_kref+0xb58:   	prefetch	%i0 - 8, 27
	.word	0x8da50939	! t0_kref+0xb5c:   	fmuls	%f20, %f25, %f6
	.word	0x925d6545	! t0_kref+0xb60:   	smul	%l5, 0x545, %o1
	.word	0xf207bfe0	! t0_kref+0xb64:   	ld	[%fp - 0x20], %i1
	.word	0x81830000	! t0_kref+0xb68:   	wr	%o4, %g0, %y
	.word	0x86102017	! t0_kref+0xb6c:   	mov	0x17, %g3
	.word	0x86a0e001	! t0_kref+0xb70:   	subcc	%g3, 1, %g3
	.word	0x2280001d	! t0_kref+0xb74:   	be,a	_kref+0xbe8
	.word	0xac62c016	! t0_kref+0xb78:   	subc	%o3, %l6, %l6
	.word	0xec00a008	! t0_kref+0xb7c:   	ld	[%g2 + 8], %l6
	call	SYM(t0_subr2)
	.word	0xc7a0a004	! t0_kref+0xb84:   	sta	%f3, [%g2 + 4]%asi
	.word	0xa93aa008	! t0_kref+0xb88:   	sra	%o2, 0x8, %l4
	.word	0x81aa0ab3	! t0_kref+0xb8c:   	fcmpes	%fcc0, %f8, %f19
	.word	0x98db0017	! t0_kref+0xb90:   	smulcc	%o4, %l7, %o4
	.word	0xe8a0a010	! t0_kref+0xb94:   	sta	%l4, [%g2 + 0x10]%asi
	.word	0xe856001b	! t0_kref+0xb98:   	ldsh	[%i0 + %i3], %l4
	.word	0xa8db400a	! t0_kref+0xb9c:   	smulcc	%o5, %o2, %l4
	.word	0xe676001d	! t0_kref+0xba0:   	stx	%l3, [%i0 + %i5]
	.word	0xe2f81019	! t0_kref+0xba4:   	swapa	[%g0 + %i1]0x80, %l1
	.word	0xe7ee501c	! t0_kref+0xba8:   	prefetcha	%i1 + %i4, 19
	.word	0xd2871059	! t0_kref+0xbac:   	lda	[%i4 + %i1]0x82, %o1
	.word	0x9e8c8000	! t0_kref+0xbb0:   	andcc	%l2, %g0, %o7
!	.word	0x2cbf3d11	! t0_kref+0xbb4:   	bneg,a	SYM(t0_subr2)
	   	bneg,a	SYM(t0_subr2)
	.word	0x9e006600	! t0_kref+0xbb8:   	add	%g1, 0x600, %o7
	.word	0xada0015a	! t0_kref+0xbbc:   	fabsd	%f26, %f22
	.word	0xc19e9a19	! t0_kref+0xbc0:   	ldda	[%i2 + %i1]0xd0, %f0
	.word	0xc11fbde0	! t0_kref+0xbc4:   	ldd	[%fp - 0x220], %f0
	.word	0xa8d00009	! t0_kref+0xbc8:   	umulcc	%g0, %o1, %l4
	.word	0x264fffe9	! t0_kref+0xbcc:   	bl,a,pt	%icc, _kref+0xb70
	.word	0x83a508ba	! t0_kref+0xbd0:   	fsubs	%f20, %f26, %f1
	.word	0xe830a018	! t0_kref+0xbd4:   	sth	%l4, [%g2 + 0x18]
	.word	0x81a98ad4	! t0_kref+0xbd8:   	fcmped	%fcc0, %f6, %f20
	.word	0xa07cc017	! t0_kref+0xbdc:   	sdiv	%l3, %l7, %l0
	.word	0xada01a35	! t0_kref+0xbe0:   	fstoi	%f21, %f22
	.word	0x9462c01a	! t0_kref+0xbe4:   	subc	%o3, %i2, %o2
	.word	0xa2d4c012	! t0_kref+0xbe8:   	umulcc	%l3, %l2, %l1
	.word	0x925a000a	! t0_kref+0xbec:   	smul	%o0, %o2, %o1
	.word	0x2d800003	! t0_kref+0xbf0:   	fbg,a	_kref+0xbfc
	.word	0xa0e5eb22	! t0_kref+0xbf4:   	subccc	%l7, 0xb22, %l0
	.word	0xafa10833	! t0_kref+0xbf8:   	fadds	%f4, %f19, %f23
	.word	0xd13e7fe8	! t0_kref+0xbfc:   	std	%f8, [%i1 - 0x18]
	.word	0xaa5cc017	! t0_kref+0xc00:   	smul	%l3, %l7, %l5
	.word	0x001fffff	! t0_kref+0xc04:   	illtrap	0x1fffff
	.word	0xa4958009	! t0_kref+0xc08:   	orcc	%l6, %o1, %l2
	.word	0x9a9ae11a	! t0_kref+0xc0c:   	xorcc	%o3, 0x11a, %o5
	.word	0x8da54d32	! t0_kref+0xc10:   	fsmuld	%f21, %f18, %f6
	.word	0x81da4012	! t0_kref+0xc14:   	flush	%o1 + %l2
	.word	0x9f1a4017	! t0_kref+0xc18:   	tsubcctv	%o1, %l7, %o7
	.word	0xe11e001d	! t0_kref+0xc1c:   	ldd	[%i0 + %i5], %f16
	.word	0xcd00a020	! t0_kref+0xc20:   	ld	[%g2 + 0x20], %f6
	.word	0xec50a026	! t0_kref+0xc24:   	ldsh	[%g2 + 0x26], %l6
	.word	0xdd3e2018	! t0_kref+0xc28:   	std	%f14, [%i0 + 0x18]
	.word	0x9fa1882e	! t0_kref+0xc2c:   	fadds	%f6, %f14, %f15
	.word	0xf4366000	! t0_kref+0xc30:   	sth	%i2, [%i1]
	.word	0x3d800008	! t0_kref+0xc34:   	fbule,a	_kref+0xc54
	.word	0x981a77e1	! t0_kref+0xc38:   	xor	%o1, -0x81f, %o4
	.word	0x81a90ab4	! t0_kref+0xc3c:   	fcmpes	%fcc0, %f4, %f20
	.word	0xe4fe3ff0	! t0_kref+0xc40:   	swapa	[%i0 - 0x10]%asi, %l2
	.word	0x9da01a4e	! t0_kref+0xc44:   	fdtoi	%f14, %f14
	.word	0x23800008	! t0_kref+0xc48:   	fbne,a	_kref+0xc68
	.word	0xa1a2492d	! t0_kref+0xc4c:   	fmuls	%f9, %f13, %f16
	.word	0xe85e3ff8	! t0_kref+0xc50:   	ldx	[%i0 - 8], %l4
	.word	0xaba20925	! t0_kref+0xc54:   	fmuls	%f8, %f5, %f21
	.word	0x3b800003	! t0_kref+0xc58:   	fble,a	_kref+0xc64
	.word	0xc07e2010	! t0_kref+0xc5c:   	swap	[%i0 + 0x10], %g0
	.word	0xe8764000	! t0_kref+0xc60:   	stx	%l4, [%i1]
	.word	0xa41dff4d	! t0_kref+0xc64:   	xor	%l7, -0xb3, %l2
	.word	0xc76e400a	! t0_kref+0xc68:   	prefetch	%i1 + %o2, 3
	.word	0xada28d30	! t0_kref+0xc6c:   	fsmuld	%f10, %f16, %f22
	.word	0x9a60000d	! t0_kref+0xc70:   	subc	%g0, %o5, %o5
	.word	0x91408000	! t0_kref+0xc74:   	mov	%ccr, %o0
	.word	0x94750014	! t0_kref+0xc78:   	udiv	%l4, %l4, %o2
	.word	0xd09e3ff0	! t0_kref+0xc7c:   	ldda	[%i0 - 0x10]%asi, %o0
	.word	0xea363ff8	! t0_kref+0xc80:   	sth	%l5, [%i0 - 8]
	.word	0xaa3b3ac9	! t0_kref+0xc84:   	xnor	%o4, -0x537, %l5
	.word	0xf4266010	! t0_kref+0xc88:   	st	%i2, [%i1 + 0x10]
	.word	0xe9ee101b	! t0_kref+0xc8c:   	prefetcha	%i0 + %i3, 20
	.word	0xa9a1c8b0	! t0_kref+0xc90:   	fsubs	%f7, %f16, %f20
	.word	0x8143e040	! t0_kref+0xc94:   	membar	0x40
	.word	0x94822b0e	! t0_kref+0xc98:   	addcc	%o0, 0xb0e, %o2
	.word	0x9fc10000	! t0_kref+0xc9c:   	call	%g4
	.word	0xf207bfe0	! t0_kref+0xca0:   	ld	[%fp - 0x20], %i1
	.word	0xe4000018	! t0_kref+0xca4:   	ld	[%g0 + %i0], %l2
	.word	0x9e0066f8	! t0_kref+0xca8:   	add	%g1, 0x6f8, %o7
!	.word	0x3abf3cd3	! t0_kref+0xcac:   	bcc,a	SYM(t0_subr2)
	   	bcc,a	SYM(t0_subr2)
	.word	0x8fa01a50	! t0_kref+0xcb0:   	fdtoi	%f16, %f7
	.word	0x97400000	! t0_kref+0xcb4:   	mov	%y, %o3
	.word	0xada00156	! t0_kref+0xcb8:   	fabsd	%f22, %f22
	.word	0x29800005	! t0_kref+0xcbc:   	fbl,a	_kref+0xcd0
	.word	0x8d84bbe4	! t0_kref+0xcc0:   	wr	%l2, 0xfffffbe4, %fprs
	.word	0x9fc00004	! t0_kref+0xcc4:   	call	%g0 + %g4
	.word	0x001fffff	! t0_kref+0xcc8:   	illtrap	0x1fffff
	.word	0x97a4c9b3	! t0_kref+0xccc:   	fdivs	%f19, %f19, %f11
	.word	0x9002c008	! t0_kref+0xcd0:   	add	%o3, %o0, %o0
	.word	0xf430a02c	! t0_kref+0xcd4:   	sth	%i2, [%g2 + 0x2c]
	.word	0x96bb000c	! t0_kref+0xcd8:   	xnorcc	%o4, %o4, %o3
	.word	0xd820a034	! t0_kref+0xcdc:   	st	%o4, [%g2 + 0x34]
	.word	0xf19eda59	! t0_kref+0xce0:   	ldda	[%i3 + %i1]0xd2, %f24
	.word	0x9ed836fd	! t0_kref+0xce4:   	smulcc	%g0, -0x903, %o7
	.word	0x92e24000	! t0_kref+0xce8:   	subccc	%o1, %g0, %o1
	.word	0x9ae3400d	! t0_kref+0xcec:   	subccc	%o5, %o5, %o5
	.word	0x99a000cc	! t0_kref+0xcf0:   	fnegd	%f12, %f12
	.word	0xf120a004	! t0_kref+0xcf4:   	st	%f24, [%g2 + 4]
	.word	0x9da01920	! t0_kref+0xcf8:   	fstod	%f0, %f14
	.word	0xa45ea0a8	! t0_kref+0xcfc:   	smul	%i2, 0xa8, %l2
	.word	0xa4bd70b5	! t0_kref+0xd00:   	xnorcc	%l5, -0xf4b, %l2
	.word	0xd9be188d	! t0_kref+0xd04:   	stda	%f12, [%i0 + %o5]0xc4
	.word	0xa8048000	! t0_kref+0xd08:   	add	%l2, %g0, %l4
	.word	0x33800005	! t0_kref+0xd0c:   	fbe,a	_kref+0xd20
	.word	0x90632c5a	! t0_kref+0xd10:   	subc	%o4, 0xc5a, %o0
	.word	0x81de6efc	! t0_kref+0xd14:   	flush	%i1 + 0xefc
	.word	0x21480008	! t0_kref+0xd18:   	fbn,a,pt	%fcc0, _kref+0xd38
	.word	0x9602309a	! t0_kref+0xd1c:   	add	%o0, -0xf66, %o3
	.word	0xc5a0a00c	! t0_kref+0xd20:   	sta	%f2, [%g2 + 0xc]%asi
	.word	0xb1a3cd26	! t0_kref+0xd24:   	fsmuld	%f15, %f6, %f24
	.word	0x8d82000b	! t0_kref+0xd28:   	wr	%o0, %o3, %fprs
	.word	0xab400000	! t0_kref+0xd2c:   	mov	%y, %l5
	.word	0xa87c800c	! t0_kref+0xd30:   	sdiv	%l2, %o4, %l4
	.word	0xa27cef63	! t0_kref+0xd34:   	sdiv	%l3, 0xf63, %l1
	.word	0xe5ee101d	! t0_kref+0xd38:   	prefetcha	%i0 + %i5, 18
	.word	0x9736a00e	! t0_kref+0xd3c:   	srl	%i2, 0xe, %o3
	.word	0xaef28014	! t0_kref+0xd40:   	udivcc	%o2, %l4, %l7
	.word	0xa07ebbdc	! t0_kref+0xd44:   	sdiv	%i2, -0x424, %l0
	.word	0xa3400000	! t0_kref+0xd48:   	mov	%y, %l1
	.word	0x96b22f63	! t0_kref+0xd4c:   	orncc	%o0, 0xf63, %o3
	.word	0xda80a000	! t0_kref+0xd50:   	lda	[%g2]%asi, %o5
	.word	0x96d5bf5a	! t0_kref+0xd54:   	umulcc	%l6, -0xa6, %o3
	.word	0xd04e8019	! t0_kref+0xd58:   	ldsb	[%i2 + %i1], %o0
	.word	0x89a60823	! t0_kref+0xd5c:   	fadds	%f24, %f3, %f4
	.word	0x20480008	! t0_kref+0xd60:   	bn,a,pt	%icc, _kref+0xd80
	.word	0xd07e3fe8	! t0_kref+0xd64:   	swap	[%i0 - 0x18], %o0
	.word	0xe8264000	! t0_kref+0xd68:   	st	%l4, [%i1]
	.word	0x9b408000	! t0_kref+0xd6c:   	mov	%ccr, %o5
	.word	0xd87f0018	! t0_kref+0xd70:   	swap	[%i4 + %i0], %o4
	.word	0xaaf80012	! t0_kref+0xd74:   	sdivcc	%g0, %l2, %l5
	.word	0xf1ee101c	! t0_kref+0xd78:   	prefetcha	%i0 + %i4, 24
	.word	0x9ae27fba	! t0_kref+0xd7c:   	subccc	%o1, -0x46, %o5
	.word	0xf420a014	! t0_kref+0xd80:   	st	%i2, [%g2 + 0x14]
	.word	0xf36e3ff8	! t0_kref+0xd84:   	prefetch	%i0 - 8, 25
	.word	0xe4086820	! t0_kref+0xd88:   	ldub	[%g1 + 0x820], %l2
	.word	0xa41ca00c	! t0_kref+0xd8c:   	xor	%l2, 0xc, %l2
	.word	0xe4286820	! t0_kref+0xd90:   	stb	%l2, [%g1 + 0x820]
	.word	0x81d86820	! t0_kref+0xd94:   	flush	%g1 + 0x820
	.word	0x9fc00004	! t0_kref+0xd98:   	call	%g0 + %g4
	.word	0xda871018	! t0_kref+0xd9c:   	lda	[%i4 + %i0]0x80, %o5
	.word	0x81daa9b5	! t0_kref+0xda0:   	flush	%o2 + 0x9b5
	.word	0x8182c000	! t0_kref+0xda4:   	wr	%o3, %g0, %y
	.word	0x95418000	! t0_kref+0xda8:   	mov	%fprs, %o2
	.word	0x81a90ac4	! t0_kref+0xdac:   	fcmped	%fcc0, %f4, %f4
	.word	0xd44e2009	! t0_kref+0xdb0:   	ldsb	[%i0 + 9], %o2
	.word	0x9da01927	! t0_kref+0xdb4:   	fstod	%f7, %f14
	.word	0xef00a004	! t0_kref+0xdb8:   	ld	[%g2 + 4], %f23
	.word	0x81834000	! t0_kref+0xdbc:   	wr	%o5, %g0, %y
	.word	0x81ab8a40	! t0_kref+0xdc0:   	fcmpd	%fcc0, %f14, %f0
	.word	0x9104e8da	! t0_kref+0xdc4:   	taddcc	%l3, 0x8da, %o0
	.word	0x9ae5f36f	! t0_kref+0xdc8:   	subccc	%l7, -0xc91, %o5
	.word	0xa9400000	! t0_kref+0xdcc:   	mov	%y, %l4
	.word	0x9f35200d	! t0_kref+0xdd0:   	srl	%l4, 0xd, %o7
2:	.word	0xa64336cb	! t0_kref+0xdd4:   	addc	%o4, -0x935, %l3
	.word	0xe4086870	! t0_kref+0xdd8:   	ldub	[%g1 + 0x870], %l2
	.word	0xa41ca00c	! t0_kref+0xddc:   	xor	%l2, 0xc, %l2
	.word	0xe4286870	! t0_kref+0xde0:   	stb	%l2, [%g1 + 0x870]
	.word	0x81d86870	! t0_kref+0xde4:   	flush	%g1 + 0x870
	.word	0xa3a4492d	! t0_kref+0xde8:   	fmuls	%f17, %f13, %f17
	.word	0xb5a8c044	! t0_kref+0xdec:   	fmovdul	%fcc0, %f4, %f26
	.word	0xa1a01a33	! t0_kref+0xdf0:   	fstoi	%f19, %f16
	.word	0x9b400000	! t0_kref+0xdf4:   	mov	%y, %o5
	.word	0x9332600a	! t0_kref+0xdf8:   	srl	%o1, 0xa, %o1
	.word	0xacd027af	! t0_kref+0xdfc:   	umulcc	%g0, 0x7af, %l6
	.word	0x9da5cd2b	! t0_kref+0xe00:   	fsmuld	%f23, %f11, %f14
	.word	0xaca2400a	! t0_kref+0xe04:   	subcc	%o1, %o2, %l6
	.word	0x9f36a009	! t0_kref+0xe08:   	srl	%i2, 0x9, %o7
	.word	0xe91fbc10	! t0_kref+0xe0c:   	ldd	[%fp - 0x3f0], %f20
	.word	0x92f20000	! t0_kref+0xe10:   	udivcc	%o0, %g0, %o1
	.word	0xb1a01026	! t0_kref+0xe14:   	fstox	%f6, %f24
	.word	0x91a0005a	! t0_kref+0xe18:   	fmovd	%f26, %f8
	.word	0x8ba1492b	! t0_kref+0xe1c:   	fmuls	%f5, %f11, %f5
	.word	0xd2560000	! t0_kref+0xe20:   	ldsh	[%i0], %o1
2:	.word	0xaa04e72a	! t0_kref+0xe24:   	add	%l3, 0x72a, %l5
	.word	0xda20a018	! t0_kref+0xe28:   	st	%o5, [%g2 + 0x18]
	.word	0xe456201c	! t0_kref+0xe2c:   	ldsh	[%i0 + 0x1c], %l2
	.word	0x37800008	! t0_kref+0xe30:   	fbge,a	_kref+0xe50
	.word	0xa006ac93	! t0_kref+0xe34:   	add	%i2, 0xc93, %l0
	.word	0x2d800003	! t0_kref+0xe38:   	fbg,a	_kref+0xe44
	.word	0x9498000b	! t0_kref+0xe3c:   	xorcc	%g0, %o3, %o2
	.word	0xd2567ff4	! t0_kref+0xe40:   	ldsh	[%i1 - 0xc], %o1
	.word	0x27800008	! t0_kref+0xe44:   	fbul,a	_kref+0xe64
	.word	0xa9400000	! t0_kref+0xe48:   	mov	%y, %l4
	.word	0xedee501b	! t0_kref+0xe4c:   	prefetcha	%i1 + %i3, 22
	.word	0xab418000	! t0_kref+0xe50:   	mov	%fprs, %l5
	.word	0xf436001b	! t0_kref+0xe54:   	sth	%i2, [%i0 + %i3]
	.word	0xe248a028	! t0_kref+0xe58:   	ldsb	[%g2 + 0x28], %l1
	.word	0xad2de01b	! t0_kref+0xe5c:   	sll	%l7, 0x1b, %l6
	.word	0xa514bec4	! t0_kref+0xe60:   	taddcctv	%l2, -0x13c, %l2
	.word	0x38480001	! t0_kref+0xe64:   	bgu,a,pt	%icc, _kref+0xe68
	.word	0xd8180019	! t0_kref+0xe68:   	ldd	[%g0 + %i1], %o4
	.word	0x38800005	! t0_kref+0xe6c:   	bgu,a	_kref+0xe80
	.word	0xc99e1a5c	! t0_kref+0xe70:   	ldda	[%i0 + %i4]0xd2, %f4
	.word	0xb3a4c936	! t0_kref+0xe74:   	fmuls	%f19, %f22, %f25
	.word	0x91a04931	! t0_kref+0xe78:   	fmuls	%f1, %f17, %f8
	.word	0xac5aa7ac	! t0_kref+0xe7c:   	smul	%o2, 0x7ac, %l6
	.word	0xae9b7a1e	! t0_kref+0xe80:   	xorcc	%o5, -0x5e2, %l7
	.word	0xa3a44924	! t0_kref+0xe84:   	fmuls	%f17, %f4, %f17
	.word	0xa404f5b4	! t0_kref+0xe88:   	add	%l3, -0xa4c, %l2
	.word	0xd4c0a038	! t0_kref+0xe8c:   	ldswa	[%g2 + 0x38]%asi, %o2
	.word	0xec4e3fe9	! t0_kref+0xe90:   	ldsb	[%i0 - 0x17], %l6
	.word	0xee480019	! t0_kref+0xe94:   	ldsb	[%g0 + %i1], %l7
	.word	0x33800002	! t0_kref+0xe98:   	fbe,a	_kref+0xea0
	.word	0x99a58d3a	! t0_kref+0xe9c:   	fsmuld	%f22, %f26, %f12
	.word	0xd07e001c	! t0_kref+0xea0:   	swap	[%i0 + %i4], %o0
	.word	0xee280019	! t0_kref+0xea4:   	stb	%l7, [%g0 + %i1]
	.word	0x81a80ab3	! t0_kref+0xea8:   	fcmpes	%fcc0, %f0, %f19
	.word	0xd8a0a00c	! t0_kref+0xeac:   	sta	%o4, [%g2 + 0xc]%asi
	.word	0x81dfe06d	! t0_kref+0xeb0:   	flush	%i7 + 0x6d
	.word	0x92dd330c	! t0_kref+0xeb4:   	smulcc	%l4, -0xcf4, %o1
	.word	0x97a64926	! t0_kref+0xeb8:   	fmuls	%f25, %f6, %f11
	.word	0x23800007	! t0_kref+0xebc:   	fbne,a	_kref+0xed8
	.word	0xa935a001	! t0_kref+0xec0:   	srl	%l6, 0x1, %l4
	.word	0x38480008	! t0_kref+0xec4:   	bgu,a,pt	%icc, _kref+0xee4
	.word	0xd890a010	! t0_kref+0xec8:   	lduha	[%g2 + 0x10]%asi, %o4
	.word	0x9b400000	! t0_kref+0xecc:   	mov	%y, %o5
	.word	0xa88d280c	! t0_kref+0xed0:   	andcc	%l4, 0x80c, %l4
	.word	0xacba400c	! t0_kref+0xed4:   	xnorcc	%o1, %o4, %l6
	.word	0x8143c000	! t0_kref+0xed8:   	stbar
	.word	0x3d800003	! t0_kref+0xedc:   	fbule,a	_kref+0xee8
	.word	0xb5a48858	! t0_kref+0xee0:   	faddd	%f18, %f24, %f26
	.word	0xa47b6a7f	! t0_kref+0xee4:   	sdiv	%o5, 0xa7f, %l2
	.word	0x9a7b000b	! t0_kref+0xee8:   	sdiv	%o4, %o3, %o5
	.word	0x9de3bfa0	! t0_kref+0xeec:   	save	%sp, -0x60, %sp
	.word	0xa1ef750a	! t0_kref+0xef0:   	restore	%i5, -0xaf6, %l0
	.word	0x81ad0ab5	! t0_kref+0xef4:   	fcmpes	%fcc0, %f20, %f21
	.word	0xc030a026	! t0_kref+0xef8:   	clrh	[%g2 + 0x26]
	.word	0x9340c000	! t0_kref+0xefc:   	mov	%asi, %o1
	.word	0x8da4092b	! t0_kref+0xf00:   	fmuls	%f16, %f11, %f6
	.word	0xd01f4019	! t0_kref+0xf04:   	ldd	[%i5 + %i1], %o0
	.word	0xa6382b27	! t0_kref+0xf08:   	xnor	%g0, 0xb27, %l3
	.word	0xec10a02c	! t0_kref+0xf0c:   	lduh	[%g2 + 0x2c], %l6
	.word	0xcb00a030	! t0_kref+0xf10:   	ld	[%g2 + 0x30], %f5
	.word	0xe920a034	! t0_kref+0xf14:   	st	%f20, [%g2 + 0x34]
	.word	0x36480008	! t0_kref+0xf18:   	bge,a,pt	%icc, _kref+0xf38
	.word	0xf9ee501a	! t0_kref+0xf1c:   	prefetcha	%i1 + %i2, 28
	.word	0x93a108ad	! t0_kref+0xf20:   	fsubs	%f4, %f13, %f9
	.word	0xd8000019	! t0_kref+0xf24:   	ld	[%g0 + %i1], %o4
	call	SYM(t0_subr2)
	.word	0xa13d6019	! t0_kref+0xf2c:   	sra	%l5, 0x19, %l0
	.word	0x8d82ae90	! t0_kref+0xf30:   	wr	%o2, 0xe90, %fprs
	.word	0x81ad8a46	! t0_kref+0xf34:   	fcmpd	%fcc0, %f22, %f6
	.word	0xe8d0a026	! t0_kref+0xf38:   	ldsha	[%g2 + 0x26]%asi, %l4
	.word	0x95a00156	! t0_kref+0xf3c:   	fabsd	%f22, %f10
	.word	0xe290a030	! t0_kref+0xf40:   	lduha	[%g2 + 0x30]%asi, %l1
	.word	0xea28a00d	! t0_kref+0xf44:   	stb	%l5, [%g2 + 0xd]
	.word	0x92f03c28	! t0_kref+0xf48:   	udivcc	%g0, -0x3d8, %o1
	.word	0x8d82c014	! t0_kref+0xf4c:   	wr	%o3, %l4, %fprs
	.word	0xa5418000	! t0_kref+0xf50:   	mov	%fprs, %l2
	.word	0xe048a00f	! t0_kref+0xf54:   	ldsb	[%g2 + 0xf], %l0
	.word	0x9245a440	! t0_kref+0xf58:   	addc	%l6, 0x440, %o1
	.word	0xa9a01936	! t0_kref+0xf5c:   	fstod	%f22, %f20
	.word	0x93a649a3	! t0_kref+0xf60:   	fdivs	%f25, %f3, %f9
	.word	0x9af2f9bc	! t0_kref+0xf64:   	udivcc	%o3, -0x644, %o5
	.word	0x993ca01e	! t0_kref+0xf68:   	sra	%l2, 0x1e, %o4
	.word	0xc5e8a005	! t0_kref+0xf6c:   	prefetcha	%g2 + 5, 2
	.word	0xed6e401d	! t0_kref+0xf70:   	prefetch	%i1 + %i5, 22
	.word	0xf4a8a005	! t0_kref+0xf74:   	stba	%i2, [%g2 + 5]%asi
	.word	0xa49b001a	! t0_kref+0xf78:   	xorcc	%o4, %i2, %l2
	.word	0xf56e401b	! t0_kref+0xf7c:   	prefetch	%i1 + %i3, 26
	.word	0xfd6e2000	! t0_kref+0xf80:   	prefetch	%i0, 30
	.word	0x81a9caae	! t0_kref+0xf84:   	fcmpes	%fcc0, %f7, %f14
	.word	0xea280018	! t0_kref+0xf88:   	stb	%l5, [%g0 + %i0]
	.word	0x30800003	! t0_kref+0xf8c:   	ba,a	_kref+0xf98
	.word	0xc19e5a1d	! t0_kref+0xf90:   	ldda	[%i1 + %i5]0xd0, %f0
	.word	0xa69aee4d	! t0_kref+0xf94:   	xorcc	%o3, 0xe4d, %l3
	.word	0xd4ee2009	! t0_kref+0xf98:   	ldstuba	[%i0 + 9]%asi, %o2
	.word	0x9e02619d	! t0_kref+0xf9c:   	add	%o1, 0x19d, %o7
	.word	0xd81e3ff0	! t0_kref+0xfa0:   	ldd	[%i0 - 0x10], %o4
	.word	0xd6881018	! t0_kref+0xfa4:   	lduba	[%g0 + %i0]0x80, %o3
	.word	0x2c800001	! t0_kref+0xfa8:   	bneg,a	_kref+0xfac
	.word	0xa6a34008	! t0_kref+0xfac:   	subcc	%o5, %o0, %l3
	.word	0xe1f6501a	! t0_kref+0xfb0:   	casxa	[%i1]0x80, %i2, %l0
	.word	0x3c480003	! t0_kref+0xfb4:   	bpos,a,pt	%icc, _kref+0xfc0
	.word	0xd228a02d	! t0_kref+0xfb8:   	stb	%o1, [%g2 + 0x2d]
	.word	0x9fa0108e	! t0_kref+0xfbc:   	fxtos	%f14, %f15
	.word	0xc120a028	! t0_kref+0xfc0:   	st	%f0, [%g2 + 0x28]
	.word	0x8143e040	! t0_kref+0xfc4:   	membar	0x40
	.word	0x9e8d0015	! t0_kref+0xfc8:   	andcc	%l4, %l5, %o7
	.word	0x981ea99e	! t0_kref+0xfcc:   	xor	%i2, 0x99e, %o4
	.word	0xa28cc017	! t0_kref+0xfd0:   	andcc	%l3, %l7, %l1
	.word	0xe300a018	! t0_kref+0xfd4:   	ld	[%g2 + 0x18], %f17
	sethi	%hi(2f), %o7
	.word	0xe40be004	! t0_kref+0xfdc:   	ldub	[%o7 + 4], %l2
	.word	0xa41ca00c	! t0_kref+0xfe0:   	xor	%l2, 0xc, %l2
	.word	0xe42be004	! t0_kref+0xfe4:   	stb	%l2, [%o7 + 4]
	.word	0x81dbe004	! t0_kref+0xfe8:   	flush	%o7 + 4
	.word	0xd89e501d	! t0_kref+0xfec:   	ldda	[%i1 + %i5]0x80, %o4
	.word	0xda30a03c	! t0_kref+0xff0:   	sth	%o5, [%g2 + 0x3c]
	.word	0x3f800003	! t0_kref+0xff4:   	fbo,a	_kref+0x1000
	.word	0xaba0188e	! t0_kref+0xff8:   	fitos	%f14, %f21
	.word	0xa9a1892a	! t0_kref+0xffc:   	fmuls	%f6, %f10, %f20
	.word	0x29800005	! t0_kref+0x1000:   	fbl,a	_kref+0x1014
2:	.word	0x91a0cd38	! t0_kref+0x1004:   	fsmuld	%f3, %f24, %f8
	.word	0xa3a000a2	! t0_kref+0x1008:   	fnegs	%f2, %f17
	.word	0xb5a6092c	! t0_kref+0x100c:   	fmuls	%f24, %f12, %f26
	.word	0x22480005	! t0_kref+0x1010:   	be,a,pt	%icc, _kref+0x1024
	.word	0xf9ee501b	! t0_kref+0x1014:   	prefetcha	%i1 + %i3, 28
	.word	0xa91dc009	! t0_kref+0x1018:   	tsubcctv	%l7, %o1, %l4
	.word	0xa9a34934	! t0_kref+0x101c:   	fmuls	%f13, %f20, %f20
	.word	0xd4564000	! t0_kref+0x1020:   	ldsh	[%i1], %o2
	.word	0x2e480003	! t0_kref+0x1024:   	bvs,a,pt	%icc, _kref+0x1030
	.word	0x85a2884a	! t0_kref+0x1028:   	faddd	%f10, %f10, %f2
	.word	0xe87e6010	! t0_kref+0x102c:   	swap	[%i1 + 0x10], %l4
	.word	0x95a00140	! t0_kref+0x1030:   	fabsd	%f0, %f10
	.word	0x98c4c000	! t0_kref+0x1034:   	addccc	%l3, %g0, %o4
	.word	0xe6362002	! t0_kref+0x1038:   	sth	%l3, [%i0 + 2]
	.word	0x86102017	! t0_kref+0x103c:   	mov	0x17, %g3
	.word	0x86a0e001	! t0_kref+0x1040:   	subcc	%g3, 1, %g3
	.word	0x22800001	! t0_kref+0x1044:   	be,a	_kref+0x1048
	.word	0x9e88000c	! t0_kref+0x1048:   	andcc	%g0, %o4, %o7
	.word	0x3f800008	! t0_kref+0x104c:   	fbo,a	_kref+0x106c
	.word	0xa2b2e80a	! t0_kref+0x1050:   	orncc	%o3, 0x80a, %l1
	.word	0x81da0012	! t0_kref+0x1054:   	flush	%o0 + %l2
	.word	0xdd3e0000	! t0_kref+0x1058:   	std	%f14, [%i0]
	.word	0x89a00034	! t0_kref+0x105c:   	fmovs	%f20, %f4
	.word	0xc900a030	! t0_kref+0x1060:   	ld	[%g2 + 0x30], %f4
	.word	0x8da58834	! t0_kref+0x1064:   	fadds	%f22, %f20, %f6
	.word	0xda500019	! t0_kref+0x1068:   	ldsh	[%g0 + %i1], %o5
	.word	0xd84e7fe8	! t0_kref+0x106c:   	ldsb	[%i1 - 0x18], %o4
	.word	0x9a2c8013	! t0_kref+0x1070:   	andn	%l2, %l3, %o5
	.word	0xad0ac012	! t0_kref+0x1074:   	tsubcc	%o3, %l2, %l6
	.word	0x8fa00135	! t0_kref+0x1078:   	fabss	%f21, %f7
	.word	0xb3a01a33	! t0_kref+0x107c:   	fstoi	%f19, %f25
	call	SYM(t0_subr1)
	.word	0x8143c000	! t0_kref+0x1084:   	stbar
	.word	0xe500a030	! t0_kref+0x1088:   	ld	[%g2 + 0x30], %f18
	.word	0xd2b0a026	! t0_kref+0x108c:   	stha	%o1, [%g2 + 0x26]%asi
	.word	0x2b800006	! t0_kref+0x1090:   	fbug,a	_kref+0x10a8
	.word	0x9b26a7a1	! t0_kref+0x1094:   	mulscc	%i2, 0x7a1, %o5
	.word	0x96530015	! t0_kref+0x1098:   	umul	%o4, %l5, %o3
	.word	0xa61a8015	! t0_kref+0x109c:   	xor	%o2, %l5, %l3
	.word	0x81da22a1	! t0_kref+0x10a0:   	flush	%o0 + 0x2a1
	.word	0x96ae8015	! t0_kref+0x10a4:   	andncc	%i2, %l5, %o3
	.word	0xef6e401c	! t0_kref+0x10a8:   	prefetch	%i1 + %i4, 23
	.word	0xae8e8014	! t0_kref+0x10ac:   	andcc	%i2, %l4, %l7
	.word	0xa45abc5f	! t0_kref+0x10b0:   	smul	%o2, -0x3a1, %l2
	.word	0x28480006	! t0_kref+0x10b4:   	bleu,a,pt	%icc, _kref+0x10cc
	.word	0x81dd401c	! t0_kref+0x10b8:   	flush	%l5 + %i4
	.word	0xf430a038	! t0_kref+0x10bc:   	sth	%i2, [%g2 + 0x38]
	.word	0xaba2c9ae	! t0_kref+0x10c0:   	fdivs	%f11, %f14, %f21
	.word	0x95a000c4	! t0_kref+0x10c4:   	fnegd	%f4, %f10
	.word	0xd13e3ff8	! t0_kref+0x10c8:   	std	%f8, [%i0 - 8]
	.word	0xcd3e4000	! t0_kref+0x10cc:   	std	%f6, [%i1]
	.word	0xaa056d94	! t0_kref+0x10d0:   	add	%l5, 0xd94, %l5
	.word	0x81a0012b	! t0_kref+0x10d4:   	fabss	%f11, %f0
	.word	0xeda0a004	! t0_kref+0x10d8:   	sta	%f22, [%g2 + 4]%asi
	.word	0xcf20a014	! t0_kref+0x10dc:   	st	%f7, [%g2 + 0x14]
	.word	0x2f800002	! t0_kref+0x10e0:   	fbu,a	_kref+0x10e8
	.word	0xee4e6019	! t0_kref+0x10e4:   	ldsb	[%i1 + 0x19], %l7
	.word	0x953d0014	! t0_kref+0x10e8:   	sra	%l4, %l4, %o2
	.word	0x9f3d000a	! t0_kref+0x10ec:   	sra	%l4, %o2, %o7
	.word	0xaa9a6fff	! t0_kref+0x10f0:   	xorcc	%o1, 0xfff, %l5
	.word	0xd430a02a	! t0_kref+0x10f4:   	sth	%o2, [%g2 + 0x2a]
	.word	0x2a480001	! t0_kref+0x10f8:   	bcs,a,pt	%icc, _kref+0x10fc
	.word	0xc1a0a03c	! t0_kref+0x10fc:   	sta	%f0, [%g2 + 0x3c]%asi
	.word	0x9fc00004	! t0_kref+0x1100:   	call	%g0 + %g4
	.word	0xa01cf3ba	! t0_kref+0x1104:   	xor	%l3, -0xc46, %l0
	.word	0xe688a020	! t0_kref+0x1108:   	lduba	[%g2 + 0x20]%asi, %l3
	.word	0xab0dbb8f	! t0_kref+0x110c:   	tsubcc	%l6, -0x471, %l5
	.word	0xaba1892a	! t0_kref+0x1110:   	fmuls	%f6, %f10, %f21
	.word	0xca31401b	! t0_kref+0x1114:   	sth	%g5, [%g5 + %i3]
	.word	0xd6b63ff4	! t0_kref+0x1118:   	stha	%o3, [%i0 - 0xc]%asi
	.word	0xa33aa00a	! t0_kref+0x111c:   	sra	%o2, 0xa, %l1
	.word	0xaad2f9a5	! t0_kref+0x1120:   	umulcc	%o3, -0x65b, %l5
	.word	0x8610200b	! t0_kref+0x1124:   	mov	0xb, %g3
	.word	0x86a0e001	! t0_kref+0x1128:   	subcc	%g3, 1, %g3
	.word	0x22800017	! t0_kref+0x112c:   	be,a	_kref+0x1188
	.word	0xa854c016	! t0_kref+0x1130:   	umul	%l3, %l6, %l4
	.word	0xe828a017	! t0_kref+0x1134:   	stb	%l4, [%g2 + 0x17]
	.word	0x29bffffc	! t0_kref+0x1138:   	fbl,a	_kref+0x1128
	.word	0x9ef5400b	! t0_kref+0x113c:   	udivcc	%l5, %o3, %o7
	.word	0x85a0cd29	! t0_kref+0x1140:   	fsmuld	%f3, %f9, %f2
	.word	0xa665001a	! t0_kref+0x1144:   	subc	%l4, %i2, %l3
	.word	0x949d800a	! t0_kref+0x1148:   	xorcc	%l6, %o2, %o2
	.word	0xa6827404	! t0_kref+0x114c:   	addcc	%o1, -0xbfc, %l3
	.word	0xe16e001c	! t0_kref+0x1150:   	prefetch	%i0 + %i4, 16
	.word	0xecb61000	! t0_kref+0x1154:   	stha	%l6, [%i0]0x80
	.word	0x81ae8a50	! t0_kref+0x1158:   	fcmpd	%fcc0, %f26, %f16
	.word	0xe180a024	! t0_kref+0x115c:   	lda	[%g2 + 0x24]%asi, %f16
	.word	0x81ac0ace	! t0_kref+0x1160:   	fcmped	%fcc0, %f16, %f14
	.word	0xe628a003	! t0_kref+0x1164:   	stb	%l3, [%g2 + 3]
	.word	0xb3a000aa	! t0_kref+0x1168:   	fnegs	%f10, %f25
	.word	0xa4bac017	! t0_kref+0x116c:   	xnorcc	%o3, %l7, %l2
	.word	0xa40ab8fa	! t0_kref+0x1170:   	and	%o2, -0x706, %l2
	.word	0xd036c018	! t0_kref+0x1174:   	sth	%o0, [%i3 + %i0]
	.word	0xa6bea612	! t0_kref+0x1178:   	xnorcc	%i2, 0x612, %l3
	.word	0xa07ab2a0	! t0_kref+0x117c:   	sdiv	%o2, -0xd60, %l0
	.word	0xaeba8012	! t0_kref+0x1180:   	xnorcc	%o2, %l2, %l7
	.word	0xae84c012	! t0_kref+0x1184:   	addcc	%l3, %l2, %l7
	.word	0xffee101a	! t0_kref+0x1188:   	prefetcha	%i0 + %i2, 31
	.word	0xf13e0000	! t0_kref+0x118c:   	std	%f24, [%i0]
	.word	0x38480007	! t0_kref+0x1190:   	bgu,a,pt	%icc, _kref+0x11ac
	.word	0xd8f8a004	! t0_kref+0x1194:   	swapa	[%g2 + 4]%asi, %o4
	.word	0xa05dc012	! t0_kref+0x1198:   	smul	%l7, %l2, %l0
	.word	0x98bc8012	! t0_kref+0x119c:   	xnorcc	%l2, %l2, %o4
	.word	0x33800006	! t0_kref+0x11a0:   	fbe,a	_kref+0x11b8
	.word	0x9fa38825	! t0_kref+0x11a4:   	fadds	%f14, %f5, %f15
	.word	0x27800007	! t0_kref+0x11a8:   	fbul,a	_kref+0x11c4
	.word	0x9293401a	! t0_kref+0x11ac:   	orcc	%o5, %i2, %o1
	.word	0x81da21c9	! t0_kref+0x11b0:   	flush	%o0 + 0x1c9
	.word	0x81db8001	! t0_kref+0x11b4:   	flush	%sp + %g1
	.word	0xc96e001a	! t0_kref+0x11b8:   	prefetch	%i0 + %i2, 4
	.word	0xa9a08831	! t0_kref+0x11bc:   	fadds	%f2, %f17, %f20
	.word	0x9a924017	! t0_kref+0x11c0:   	orcc	%o1, %l7, %o5
	.word	0xd0300018	! t0_kref+0x11c4:   	sth	%o0, [%g0 + %i0]
	.word	0x81ad0ad4	! t0_kref+0x11c8:   	fcmped	%fcc0, %f20, %f20
	.word	0xc12e2004	! t0_kref+0x11cc:   	st	%fsr, [%i0 + 4]
	.word	0x2d800007	! t0_kref+0x11d0:   	fbg,a	_kref+0x11ec
	.word	0xe64e8019	! t0_kref+0x11d4:   	ldsb	[%i2 + %i1], %l3
	.word	0x97a01a32	! t0_kref+0x11d8:   	fstoi	%f18, %f11
	.word	0x992cc00b	! t0_kref+0x11dc:   	sll	%l3, %o3, %o4
	.word	0xd45e0000	! t0_kref+0x11e0:   	ldx	[%i0], %o2
	.word	0xde40a000	! t0_kref+0x11e4:   	ldsw	[%g2], %o7
	.word	0x9af5000b	! t0_kref+0x11e8:   	udivcc	%l4, %o3, %o5
	.word	0xeaa0a018	! t0_kref+0x11ec:   	sta	%l5, [%g2 + 0x18]%asi
	.word	0xd816c000	! t0_kref+0x11f0:   	lduh	[%i3], %o4
	.word	0xc0a8a031	! t0_kref+0x11f4:   	stba	%g0, [%g2 + 0x31]%asi
	.word	0xaf34e009	! t0_kref+0x11f8:   	srl	%l3, 0x9, %l7
	.word	0xaca20014	! t0_kref+0x11fc:   	subcc	%o0, %l4, %l6
	.word	0xe8a8a01a	! t0_kref+0x1200:   	stba	%l4, [%g2 + 0x1a]%asi
	.word	0x8da01a31	! t0_kref+0x1204:   	fstoi	%f17, %f6
	.word	0xd636601e	! t0_kref+0x1208:   	sth	%o3, [%i1 + 0x1e]
	.word	0xa1a508ad	! t0_kref+0x120c:   	fsubs	%f20, %f13, %f16
	.word	0x95a18d33	! t0_kref+0x1210:   	fsmuld	%f6, %f19, %f10
	.word	0xa43d6944	! t0_kref+0x1214:   	xnor	%l5, 0x944, %l2
	.word	0xae002076	! t0_kref+0x1218:   	add	%g0, 0x76, %l7
	.word	0xd11fbd10	! t0_kref+0x121c:   	ldd	[%fp - 0x2f0], %f8
!	.word	0x28815367	! t0_kref+0x1220:   	bleu,a	SYM(t0_subr3)
	   	bleu,a	SYM(t0_subr3)
	.word	0x9f414000	! t0_kref+0x1224:   	mov	%pc, %o7
	.word	0x99a40846	! t0_kref+0x1228:   	faddd	%f16, %f6, %f12
	.word	0x31800003	! t0_kref+0x122c:   	fba,a	_kref+0x1238
	.word	0xd8c8a029	! t0_kref+0x1230:   	ldsba	[%g2 + 0x29]%asi, %o4
	.word	0x9e5a8008	! t0_kref+0x1234:   	smul	%o2, %o0, %o7
	.word	0x25800003	! t0_kref+0x1238:   	fblg,a	_kref+0x1244
	.word	0xf007bfe0	! t0_kref+0x123c:   	ld	[%fp - 0x20], %i0
	.word	0x8da14d39	! t0_kref+0x1240:   	fsmuld	%f5, %f25, %f6
	.word	0xc3a0a03c	! t0_kref+0x1244:   	sta	%f1, [%g2 + 0x3c]%asi
	.word	0xe4086cbc	! t0_kref+0x1248:   	ldub	[%g1 + 0xcbc], %l2
	.word	0xa41ca00c	! t0_kref+0x124c:   	xor	%l2, 0xc, %l2
	.word	0xe4286cbc	! t0_kref+0x1250:   	stb	%l2, [%g1 + 0xcbc]
	.word	0x81d86cbc	! t0_kref+0x1254:   	flush	%g1 + 0xcbc
	.word	0x87a34821	! t0_kref+0x1258:   	fadds	%f13, %f1, %f3
	.word	0xa1a309da	! t0_kref+0x125c:   	fdivd	%f12, %f26, %f16
	.word	0x9f408000	! t0_kref+0x1260:   	mov	%ccr, %o7
	.word	0xe6a8a028	! t0_kref+0x1264:   	stba	%l3, [%g2 + 0x28]%asi
	.word	0xda7e001c	! t0_kref+0x1268:   	swap	[%i0 + %i4], %o5
	.word	0xa045a42f	! t0_kref+0x126c:   	addc	%l6, 0x42f, %l0
2:	.word	0x9ac5e4b2	! t0_kref+0x1270:   	addccc	%l7, 0x4b2, %o5
	.word	0xa3400000	! t0_kref+0x1274:   	mov	%y, %l1
	.word	0xc53e4000	! t0_kref+0x1278:   	std	%f2, [%i1]
	.word	0x36480007	! t0_kref+0x127c:   	bge,a,pt	%icc, _kref+0x1298
	.word	0xf420a000	! t0_kref+0x1280:   	st	%i2, [%g2]
	.word	0xa6180016	! t0_kref+0x1284:   	xor	%g0, %l6, %l3
	.word	0x8fa01a21	! t0_kref+0x1288:   	fstoi	%f1, %f7
	.word	0xb3a148a0	! t0_kref+0x128c:   	fsubs	%f5, %f0, %f25
	.word	0xec26001c	! t0_kref+0x1290:   	st	%l6, [%i0 + %i4]
	.word	0xb5a1c830	! t0_kref+0x1294:   	fadds	%f7, %f16, %f26
	.word	0xa73c8008	! t0_kref+0x1298:   	sra	%l2, %o0, %l3
	call	SYM(t0_subr3)
	.word	0xe24e6015	! t0_kref+0x12a0:   	ldsb	[%i1 + 0x15], %l1
	.word	0x9e620000	! t0_kref+0x12a4:   	subc	%o0, %g0, %o7
	.word	0xac7b0015	! t0_kref+0x12a8:   	sdiv	%o4, %l5, %l6
	.word	0x9534c009	! t0_kref+0x12ac:   	srl	%l3, %o1, %o2
	.word	0xd820a018	! t0_kref+0x12b0:   	st	%o4, [%g2 + 0x18]
	.word	0x85832428	! t0_kref+0x12b4:   	wr	%o4, 0x428, %ccr
	.word	0x81a2c925	! t0_kref+0x12b8:   	fmuls	%f11, %f5, %f0
	.word	0xc306001c	! t0_kref+0x12bc:   	ld	[%i0 + %i4], %f1
	.word	0x91a589a8	! t0_kref+0x12c0:   	fdivs	%f22, %f8, %f8
	.word	0xee20a010	! t0_kref+0x12c4:   	st	%l7, [%g2 + 0x10]
	.word	0x3f800004	! t0_kref+0x12c8:   	fbo,a	_kref+0x12d8
	.word	0x95aa8052	! t0_kref+0x12cc:   	fmovdue	%fcc0, %f18, %f10
	.word	0x3e480006	! t0_kref+0x12d0:   	bvc,a,pt	%icc, _kref+0x12e8
	.word	0x81dc8000	! t0_kref+0x12d4:   	flush	%l2
	.word	0xd428a00f	! t0_kref+0x12d8:   	stb	%o2, [%g2 + 0xf]
	.word	0xa9a00039	! t0_kref+0x12dc:   	fmovs	%f25, %f20
	.word	0xe856c018	! t0_kref+0x12e0:   	ldsh	[%i3 + %i0], %l4
	.word	0x81dcf1a9	! t0_kref+0x12e4:   	flush	%l3 - 0xe57
	.word	0xc1be184b	! t0_kref+0x12e8:   	stda	%f0, [%i0 + %o3]0xc2
	.word	0xea28355c	! t0_kref+0x12ec:   	stb	%l5, [%g0 - 0xaa4]
	.word	0xcf064000	! t0_kref+0x12f0:   	ld	[%i1], %f7
	.word	0xf7ee501a	! t0_kref+0x12f4:   	prefetcha	%i1 + %i2, 27
	.word	0x94d56740	! t0_kref+0x12f8:   	umulcc	%l5, 0x740, %o2
	.word	0x92e4c00d	! t0_kref+0x12fc:   	subccc	%l3, %o5, %o1
	.word	0xf16e7ff8	! t0_kref+0x1300:   	prefetch	%i1 - 8, 24
	.word	0x83a60826	! t0_kref+0x1304:   	fadds	%f24, %f6, %f1
	.word	0xb3a50833	! t0_kref+0x1308:   	fadds	%f20, %f19, %f25
	.word	0xe4086d98	! t0_kref+0x130c:   	ldub	[%g1 + 0xd98], %l2
	.word	0xa41ca00c	! t0_kref+0x1310:   	xor	%l2, 0xc, %l2
	.word	0xe4286d98	! t0_kref+0x1314:   	stb	%l2, [%g1 + 0xd98]
	.word	0x81d86d98	! t0_kref+0x1318:   	flush	%g1 + 0xd98
	.word	0xaef8001a	! t0_kref+0x131c:   	sdivcc	%g0, %i2, %l7
	.word	0xea30a022	! t0_kref+0x1320:   	sth	%l5, [%g2 + 0x22]
	.word	0x81ac8ada	! t0_kref+0x1324:   	fcmped	%fcc0, %f18, %f26
	.word	0xd60e7ffa	! t0_kref+0x1328:   	ldub	[%i1 - 6], %o3
	.word	0x87a34938	! t0_kref+0x132c:   	fmuls	%f13, %f24, %f3
	.word	0x81aa8a4a	! t0_kref+0x1330:   	fcmpd	%fcc0, %f10, %f10
	.word	0x94d3401a	! t0_kref+0x1334:   	umulcc	%o5, %i2, %o2
	.word	0xd4266000	! t0_kref+0x1338:   	st	%o2, [%i1]
	.word	0xf16e401d	! t0_kref+0x133c:   	prefetch	%i1 + %i5, 24
	.word	0xde0e7ff9	! t0_kref+0x1340:   	ldub	[%i1 - 7], %o7
	.word	0xa1268017	! t0_kref+0x1344:   	mulscc	%i2, %l7, %l0
	.word	0xd1be5808	! t0_kref+0x1348:   	stda	%f8, [%i1 + %o0]0xc0
2:	.word	0x85a01080	! t0_kref+0x134c:   	fxtos	%f0, %f2
	.word	0xea56201c	! t0_kref+0x1350:   	ldsh	[%i0 + 0x1c], %l5
	.word	0xe2f81018	! t0_kref+0x1354:   	swapa	[%g0 + %i0]0x80, %l1
	.word	0xaa7a4009	! t0_kref+0x1358:   	sdiv	%o1, %o1, %l5
	.word	0xac627051	! t0_kref+0x135c:   	subc	%o1, -0xfaf, %l6
	.word	0x3f800006	! t0_kref+0x1360:   	fbo,a	_kref+0x1378
	.word	0xe96e3fe0	! t0_kref+0x1364:   	prefetch	%i0 - 0x20, 20
	.word	0xc1e8a085	! t0_kref+0x1368:   	prefetcha	%g2 + 0x85, 0
	.word	0x97418000	! t0_kref+0x136c:   	mov	%fprs, %o3
	.word	0x81a4492e	! t0_kref+0x1370:   	fmuls	%f17, %f14, %f0
	.word	0x91a10839	! t0_kref+0x1374:   	fadds	%f4, %f25, %f8
	.word	0xe5ee501c	! t0_kref+0x1378:   	prefetcha	%i1 + %i4, 18
	.word	0xa5a58921	! t0_kref+0x137c:   	fmuls	%f22, %f1, %f18
	.word	0xe5a0a02c	! t0_kref+0x1380:   	sta	%f18, [%g2 + 0x2c]%asi
	.word	0xa0523aa7	! t0_kref+0x1384:   	umul	%o0, -0x559, %l0
	.word	0x9b3d6000	! t0_kref+0x1388:   	sra	%l5, 0x0, %o5
	.word	0x3c800006	! t0_kref+0x138c:   	bpos,a	_kref+0x13a4
	.word	0x92f34013	! t0_kref+0x1390:   	udivcc	%o5, %l3, %o1
	call	SYM(t0_subr0)
	.word	0x93a01a2a	! t0_kref+0x1398:   	fstoi	%f10, %f9
	.word	0xa7a018d4	! t0_kref+0x139c:   	fdtos	%f20, %f19
	.word	0x81a88ad2	! t0_kref+0x13a0:   	fcmped	%fcc0, %f2, %f18
	.word	0xd028a00b	! t0_kref+0x13a4:   	stb	%o0, [%g2 + 0xb]
	.word	0x81aa8ad6	! t0_kref+0x13a8:   	fcmped	%fcc0, %f10, %f22
	.word	0xd0266000	! t0_kref+0x13ac:   	st	%o0, [%i1]
	.word	0x81dcb6ba	! t0_kref+0x13b0:   	flush	%l2 - 0x946
	.word	0xe900a000	! t0_kref+0x13b4:   	ld	[%g2], %f20
	.word	0xa888000c	! t0_kref+0x13b8:   	andcc	%g0, %o4, %l4
	.word	0x81ad8ace	! t0_kref+0x13bc:   	fcmped	%fcc0, %f22, %f14
	.word	0x81ae4aaa	! t0_kref+0x13c0:   	fcmpes	%fcc0, %f25, %f10
	.word	0xa0d3372e	! t0_kref+0x13c4:   	umulcc	%o4, -0x8d2, %l0
	.word	0xe500a008	! t0_kref+0x13c8:   	ld	[%g2 + 8], %f18
	sethi	%hi(2f), %o7
	.word	0xe40be014	! t0_kref+0x13d0:   	ldub	[%o7 + 0x14], %l2
	.word	0xa41ca00c	! t0_kref+0x13d4:   	xor	%l2, 0xc, %l2
	.word	0xe42be014	! t0_kref+0x13d8:   	stb	%l2, [%o7 + 0x14]
	.word	0x81dbe014	! t0_kref+0x13dc:   	flush	%o7 + 0x14
	.word	0xc91e7fe8	! t0_kref+0x13e0:   	ldd	[%i1 - 0x18], %f4
	.word	0x94e2b4cb	! t0_kref+0x13e4:   	subccc	%o2, -0xb35, %o2
	.word	0xd8b62000	! t0_kref+0x13e8:   	stha	%o4, [%i0]%asi
	.word	0xa87ceb00	! t0_kref+0x13ec:   	sdiv	%l3, 0xb00, %l4
	.word	0xb5a1c931	! t0_kref+0x13f0:   	fmuls	%f7, %f17, %f26
	.word	0x92bb6931	! t0_kref+0x13f4:   	xnorcc	%o5, 0x931, %o1
	.word	0x89a00154	! t0_kref+0x13f8:   	fabsd	%f20, %f4
	.word	0x2f800005	! t0_kref+0x13fc:   	fbu,a	_kref+0x1410
	.word	0xa4dab896	! t0_kref+0x1400:   	smulcc	%o2, -0x76a, %l2
	.word	0x972d200d	! t0_kref+0x1404:   	sll	%l4, 0xd, %o3
	.word	0x928b3dbb	! t0_kref+0x1408:   	andcc	%o4, -0x245, %o1
	.word	0x85a68927	! t0_kref+0x140c:   	fmuls	%f26, %f7, %f2
	.word	0xefee101a	! t0_kref+0x1410:   	prefetcha	%i0 + %i2, 23
2:	.word	0xa8930000	! t0_kref+0x1414:   	orcc	%o4, %g0, %l4
	.word	0xe4086e84	! t0_kref+0x1418:   	ldub	[%g1 + 0xe84], %l2
	.word	0xa41ca00c	! t0_kref+0x141c:   	xor	%l2, 0xc, %l2
	.word	0xe4286e84	! t0_kref+0x1420:   	stb	%l2, [%g1 + 0xe84]
	.word	0x81d86e84	! t0_kref+0x1424:   	flush	%g1 + 0xe84
	.word	0xe1be588d	! t0_kref+0x1428:   	stda	%f16, [%i1 + %o5]0xc4
	.word	0xa1352005	! t0_kref+0x142c:   	srl	%l4, 0x5, %l0
	.word	0x933e800d	! t0_kref+0x1430:   	sra	%i2, %o5, %o1
	.word	0x33800001	! t0_kref+0x1434:   	fbe,a	_kref+0x1438
2:	.word	0xaba01a36	! t0_kref+0x1438:   	fstoi	%f22, %f21
	.word	0xb1a68922	! t0_kref+0x143c:   	fmuls	%f26, %f2, %f24
	.word	0xd2366012	! t0_kref+0x1440:   	sth	%o1, [%i1 + 0x12]
	.word	0x81dbb5db	! t0_kref+0x1444:   	flush	%sp - 0xa25
	.word	0xc0200019	! t0_kref+0x1448:   	clr	[%g0 + %i1]
	.word	0xee363ff2	! t0_kref+0x144c:   	sth	%l7, [%i0 - 0xe]
	.word	0x3c800003	! t0_kref+0x1450:   	bpos,a	_kref+0x145c
	.word	0xa5a01a50	! t0_kref+0x1454:   	fdtoi	%f16, %f18
	.word	0xa5a000c2	! t0_kref+0x1458:   	fnegd	%f2, %f18
	.word	0x94600000	! t0_kref+0x145c:   	subc	%g0, %g0, %o2
	.word	0xa5302006	! t0_kref+0x1460:   	srl	%g0, 0x6, %l2
	.word	0x85a18856	! t0_kref+0x1464:   	faddd	%f6, %f22, %f2
	.word	0xec363ff6	! t0_kref+0x1468:   	sth	%l6, [%i0 - 0xa]
	.word	0xa604a03e	! t0_kref+0x146c:   	add	%l2, 0x3e, %l3
	.word	0x3b800007	! t0_kref+0x1470:   	fble,a	_kref+0x148c
	.word	0x85a0012d	! t0_kref+0x1474:   	fabss	%f13, %f2
	.word	0x92548009	! t0_kref+0x1478:   	umul	%l2, %o1, %o1
	.word	0xd27e3fe8	! t0_kref+0x147c:   	swap	[%i0 - 0x18], %o1
	.word	0xac05000c	! t0_kref+0x1480:   	add	%l4, %o4, %l6
	.word	0xa1a80050	! t0_kref+0x1484:   	fmovdn	%fcc0, %f16, %f16
	.word	0x27800001	! t0_kref+0x1488:   	fbul,a	_kref+0x148c
	.word	0x8fa0c932	! t0_kref+0x148c:   	fmuls	%f3, %f18, %f7
	.word	0xd2480019	! t0_kref+0x1490:   	ldsb	[%g0 + %i1], %o1
	.word	0x92702a29	! t0_kref+0x1494:   	udiv	%g0, 0xa29, %o1
	.word	0x96883310	! t0_kref+0x1498:   	andcc	%g0, -0xcf0, %o3
	.word	0x9e7ac008	! t0_kref+0x149c:   	sdiv	%o3, %o0, %o7
	.word	0xf207bfe0	! t0_kref+0x14a0:   	ld	[%fp - 0x20], %i1
	.word	0xa0568016	! t0_kref+0x14a4:   	umul	%i2, %l6, %l0
	.word	0x21800008	! t0_kref+0x14a8:   	fbn,a	_kref+0x14c8
	.word	0x9a7abcd1	! t0_kref+0x14ac:   	sdiv	%o2, -0x32f, %o5
	.word	0x8d84c01a	! t0_kref+0x14b0:   	wr	%l3, %i2, %fprs
	.word	0xe2167ff0	! t0_kref+0x14b4:   	lduh	[%i1 - 0x10], %l1
	.word	0x3d800005	! t0_kref+0x14b8:   	fbule,a	_kref+0x14cc
	.word	0x972b0017	! t0_kref+0x14bc:   	sll	%o4, %l7, %o3
	.word	0xace02012	! t0_kref+0x14c0:   	subccc	%g0, 0x12, %l6
	.word	0xa0b83971	! t0_kref+0x14c4:   	xnorcc	%g0, -0x68f, %l0
	.word	0xe93e6008	! t0_kref+0x14c8:   	std	%f20, [%i1 + 8]
!	.word	0x204f3acb	! t0_kref+0x14cc:   	bn,a,pt	%icc, SYM(t0_subr2)
	   	bn,a,pt	%icc, SYM(t0_subr2)
	.word	0x9f414000	! t0_kref+0x14d0:   	mov	%pc, %o7
	.word	0xe040a004	! t0_kref+0x14d4:   	ldsw	[%g2 + 4], %l0
	.word	0xaee28015	! t0_kref+0x14d8:   	subccc	%o2, %l5, %l7
	.word	0xc12e201c	! t0_kref+0x14dc:   	st	%fsr, [%i0 + 0x1c]
	.word	0x85a04d24	! t0_kref+0x14e0:   	fsmuld	%f1, %f4, %f2
	.word	0xa1a01933	! t0_kref+0x14e4:   	fstod	%f19, %f16
	.word	0x81858000	! t0_kref+0x14e8:   	wr	%l6, %g0, %y
	.word	0xc500a004	! t0_kref+0x14ec:   	ld	[%g2 + 4], %f2
	.word	0xd01f4019	! t0_kref+0x14f0:   	ldd	[%i5 + %i1], %o0
	.word	0x98e56ea7	! t0_kref+0x14f4:   	subccc	%l5, 0xea7, %o4
	.word	0x94024014	! t0_kref+0x14f8:   	add	%o1, %l4, %o2
	.word	0xd4263ffc	! t0_kref+0x14fc:   	st	%o2, [%i0 - 4]
	.word	0xaa656b7b	! t0_kref+0x1500:   	subc	%l5, 0xb7b, %l5
	.word	0xd0766018	! t0_kref+0x1504:   	stx	%o0, [%i1 + 0x18]
	.word	0xd680a038	! t0_kref+0x1508:   	lda	[%g2 + 0x38]%asi, %o3
	.word	0xe53e6008	! t0_kref+0x150c:   	std	%f18, [%i1 + 8]
	.word	0x921ac00d	! t0_kref+0x1510:   	xor	%o3, %o5, %o1
	.word	0x98c223c3	! t0_kref+0x1514:   	addccc	%o0, 0x3c3, %o4
	.word	0xa80d001a	! t0_kref+0x1518:   	and	%l4, %i2, %l4
	.word	0xd27e2008	! t0_kref+0x151c:   	swap	[%i0 + 8], %o1
	.word	0x948aaa70	! t0_kref+0x1520:   	andcc	%o2, 0xa70, %o2
	.word	0xa05030c9	! t0_kref+0x1524:   	umul	%g0, -0xf37, %l0
	.word	0xc91fbe48	! t0_kref+0x1528:   	ldd	[%fp - 0x1b8], %f4
	.word	0x9ad48015	! t0_kref+0x152c:   	umulcc	%l2, %l5, %o5
	call	SYM(t0_subr2)
	.word	0xa6bab68f	! t0_kref+0x1534:   	xnorcc	%o2, -0x971, %l3
	.word	0x8fa01a24	! t0_kref+0x1538:   	fstoi	%f4, %f7
	.word	0xee48a013	! t0_kref+0x153c:   	ldsb	[%g2 + 0x13], %l7
	.word	0xa3a50928	! t0_kref+0x1540:   	fmuls	%f20, %f8, %f17
	.word	0x8da0012b	! t0_kref+0x1544:   	fabss	%f11, %f6
	sethi	%hi(2f), %o7
	.word	0xe40be168	! t0_kref+0x154c:   	ldub	[%o7 + 0x168], %l2
	.word	0xa41ca00c	! t0_kref+0x1550:   	xor	%l2, 0xc, %l2
	.word	0xe42be168	! t0_kref+0x1554:   	stb	%l2, [%o7 + 0x168]
	.word	0x81dbe168	! t0_kref+0x1558:   	flush	%o7 + 0x168
	.word	0xa8b80008	! t0_kref+0x155c:   	xnorcc	%g0, %o0, %l4
	.word	0xe210a038	! t0_kref+0x1560:   	lduh	[%g2 + 0x38], %l1
	.word	0x81de000d	! t0_kref+0x1564:   	flush	%i0 + %o5
2:	.word	0xec762008	! t0_kref+0x1568:   	stx	%l6, [%i0 + 8]
	.word	0x950dc000	! t0_kref+0x156c:   	tsubcc	%l7, %g0, %o2
	.word	0xd6c0a008	! t0_kref+0x1570:   	ldswa	[%g2 + 8]%asi, %o3
	.word	0x81da695e	! t0_kref+0x1574:   	flush	%o1 + 0x95e
	.word	0x94a5b32d	! t0_kref+0x1578:   	subcc	%l6, -0xcd3, %o2
	.word	0xa5a000c6	! t0_kref+0x157c:   	fnegd	%f6, %f18
	.word	0xaa02e05f	! t0_kref+0x1580:   	add	%o3, 0x5f, %l5
	.word	0x9e006fd4	! t0_kref+0x1584:   	add	%g1, 0xfd4, %o7
!	.word	0x2881528d	! t0_kref+0x1588:   	bleu,a	SYM(t0_subr3)
	   	bleu,a	SYM(t0_subr3)
	.word	0x95a01a29	! t0_kref+0x158c:   	fstoi	%f9, %f10
	.word	0x30800002	! t0_kref+0x1590:   	ba,a	_kref+0x1598
	.word	0x952ea01e	! t0_kref+0x1594:   	sll	%i2, 0x1e, %o2
	.word	0x9fc10000	! t0_kref+0x1598:   	call	%g4
	.word	0xd0267fe0	! t0_kref+0x159c:   	st	%o0, [%i1 - 0x20]
	.word	0xa0b5400b	! t0_kref+0x15a0:   	orncc	%l5, %o3, %l0
	.word	0xe9ee501d	! t0_kref+0x15a4:   	prefetcha	%i1 + %i5, 20
	.word	0xaf400000	! t0_kref+0x15a8:   	mov	%y, %l7
	.word	0x21800006	! t0_kref+0x15ac:   	fbn,a	_kref+0x15c4
	.word	0xd4300018	! t0_kref+0x15b0:   	sth	%o2, [%g0 + %i0]
	.word	0xe0c0a010	! t0_kref+0x15b4:   	ldswa	[%g2 + 0x10]%asi, %l0
	.word	0x2f480002	! t0_kref+0x15b8:   	fbu,a,pt	%fcc0, _kref+0x15c0
	.word	0xe8300018	! t0_kref+0x15bc:   	sth	%l4, [%g0 + %i0]
	.word	0x93400000	! t0_kref+0x15c0:   	mov	%y, %o1
	.word	0xa6d5400b	! t0_kref+0x15c4:   	umulcc	%l5, %o3, %l3
	.word	0xc96e3fe0	! t0_kref+0x15c8:   	prefetch	%i0 - 0x20, 4
	.word	0xa6b3400a	! t0_kref+0x15cc:   	orncc	%o5, %o2, %l3
	.word	0xc030a03c	! t0_kref+0x15d0:   	clrh	[%g2 + 0x3c]
	.word	0xa5a01a39	! t0_kref+0x15d4:   	fstoi	%f25, %f18
	.word	0x22800006	! t0_kref+0x15d8:   	be,a	_kref+0x15f0
	.word	0xf11e0000	! t0_kref+0x15dc:   	ldd	[%i0], %f24
	.word	0x9fc00004	! t0_kref+0x15e0:   	call	%g0 + %g4
	.word	0xd888105a	! t0_kref+0x15e4:   	lduba	[%g0 + %i2]0x82, %o4
	.word	0xe4063fec	! t0_kref+0x15e8:   	ld	[%i0 - 0x14], %l2
	.word	0xea070018	! t0_kref+0x15ec:   	ld	[%i4 + %i0], %l5
	.word	0xdd1fbe78	! t0_kref+0x15f0:   	ldd	[%fp - 0x188], %f14
	.word	0x35800003	! t0_kref+0x15f4:   	fbue,a	_kref+0x1600
	.word	0xe8366002	! t0_kref+0x15f8:   	sth	%l4, [%i1 + 2]
	.word	0xaba00128	! t0_kref+0x15fc:   	fabss	%f8, %f21
	.word	0x98053644	! t0_kref+0x1600:   	add	%l4, -0x9bc, %o4
	.word	0x9da44934	! t0_kref+0x1604:   	fmuls	%f17, %f20, %f14
	.word	0x8d800000	! t0_kref+0x1608:   	mov	%g0, %fprs
	.word	0x94bca063	! t0_kref+0x160c:   	xnorcc	%l2, 0x63, %o2
	.word	0x252a12cb	! t0_kref+0x1610:   	sethi	%hi(0xa84b2c00), %l2
	.word	0x81deac30	! t0_kref+0x1614:   	flush	%i2 + 0xc30
	.word	0xd13e7fe0	! t0_kref+0x1618:   	std	%f8, [%i1 - 0x20]
	.word	0xa87ac016	! t0_kref+0x161c:   	sdiv	%o3, %l6, %l4
	.word	0x32800008	! t0_kref+0x1620:   	bne,a	_kref+0x1640
	.word	0x9fa10827	! t0_kref+0x1624:   	fadds	%f4, %f7, %f15
	.word	0xefa0a01c	! t0_kref+0x1628:   	sta	%f23, [%g2 + 0x1c]%asi
	.word	0xf76e401b	! t0_kref+0x162c:   	prefetch	%i1 + %i3, 27
	.word	0xa4a2800d	! t0_kref+0x1630:   	subcc	%o2, %o5, %l2
	.word	0x91a58937	! t0_kref+0x1634:   	fmuls	%f22, %f23, %f8
	.word	0xe6863ff4	! t0_kref+0x1638:   	lda	[%i0 - 0xc]%asi, %l3
	.word	0x89a68d26	! t0_kref+0x163c:   	fsmuld	%f26, %f6, %f4
	.word	0x9a1c800b	! t0_kref+0x1640:   	xor	%l2, %o3, %o5
	.word	0x96034009	! t0_kref+0x1644:   	add	%o5, %o1, %o3
	.word	0x9de3bfa0	! t0_kref+0x1648:   	save	%sp, -0x60, %sp
	.word	0x95ee8000	! t0_kref+0x164c:   	restore	%i2, %g0, %o2
	.word	0x34800006	! t0_kref+0x1650:   	bg,a	_kref+0x1668
	.word	0xae3b4013	! t0_kref+0x1654:   	xnor	%o5, %l3, %l7
	.word	0x9af30012	! t0_kref+0x1658:   	udivcc	%o4, %l2, %o5
	.word	0x95aac04c	! t0_kref+0x165c:   	fmovdge	%fcc0, %f12, %f10
	.word	0x91a34926	! t0_kref+0x1660:   	fmuls	%f13, %f6, %f8
	.word	0xada01a39	! t0_kref+0x1664:   	fstoi	%f25, %f22
	.word	0x9264f682	! t0_kref+0x1668:   	subc	%l3, -0x97e, %o1
	.word	0x28480001	! t0_kref+0x166c:   	bleu,a,pt	%icc, _kref+0x1670
	.word	0x9864a46a	! t0_kref+0x1670:   	subc	%l2, 0x46a, %o4
	.word	0xa6857074	! t0_kref+0x1674:   	addcc	%l5, -0xf8c, %l3
	.word	0x81ad0a44	! t0_kref+0x1678:   	fcmpd	%fcc0, %f20, %f4
	.word	0x95a64d26	! t0_kref+0x167c:   	fsmuld	%f25, %f6, %f10
	.word	0xf11e4000	! t0_kref+0x1680:   	ldd	[%i1], %f24
	.word	0xd4063ff0	! t0_kref+0x1684:   	ld	[%i0 - 0x10], %o2
	.word	0x9a0b400b	! t0_kref+0x1688:   	and	%o5, %o3, %o5
	.word	0xe0060000	! t0_kref+0x168c:   	ld	[%i0], %l0
	.word	0x81a88acc	! t0_kref+0x1690:   	fcmped	%fcc0, %f2, %f12
	.word	0x86102010	! t0_kref+0x1694:   	mov	0x10, %g3
	.word	0x86a0e001	! t0_kref+0x1698:   	subcc	%g3, 1, %g3
	.word	0x2280001f	! t0_kref+0x169c:   	be,a	_kref+0x1718
	.word	0x91a0004a	! t0_kref+0x16a0:   	fmovd	%f10, %f8
	.word	0xf300a01c	! t0_kref+0x16a4:   	ld	[%g2 + 0x1c], %f25
	.word	0x81df3878	! t0_kref+0x16a8:   	flush	%i4 - 0x788
	.word	0x952ea00f	! t0_kref+0x16ac:   	sll	%i2, 0xf, %o2
	.word	0x9a9a4013	! t0_kref+0x16b0:   	xorcc	%o1, %l3, %o5
	.word	0x9e1deb2e	! t0_kref+0x16b4:   	xor	%l7, 0xb2e, %o7
	.word	0xec266008	! t0_kref+0x16b8:   	st	%l6, [%i1 + 8]
	.word	0xecd0105b	! t0_kref+0x16bc:   	ldsha	[%g0 + %i3]0x82, %l6
	.word	0xe93e7ff8	! t0_kref+0x16c0:   	std	%f20, [%i1 - 8]
	.word	0x22480002	! t0_kref+0x16c4:   	be,a,pt	%icc, _kref+0x16cc
	.word	0xae5e800d	! t0_kref+0x16c8:   	smul	%i2, %o5, %l7
	.word	0x8ba548ba	! t0_kref+0x16cc:   	fsubs	%f21, %f26, %f5
	.word	0xf007bfe0	! t0_kref+0x16d0:   	ld	[%fp - 0x20], %i0
	.word	0xd4067fe8	! t0_kref+0x16d4:   	ld	[%i1 - 0x18], %o2
	.word	0xe36e401a	! t0_kref+0x16d8:   	prefetch	%i1 + %i2, 17
	.word	0x85834017	! t0_kref+0x16dc:   	wr	%o5, %l7, %ccr
	.word	0xc5a0a000	! t0_kref+0x16e0:   	sta	%f2, [%g2]%asi
	.word	0xc19e5a5d	! t0_kref+0x16e4:   	ldda	[%i1 + %i5]0xd2, %f0
	.word	0x9fc10000	! t0_kref+0x16e8:   	call	%g4
	.word	0xcb20a028	! t0_kref+0x16ec:   	st	%f5, [%g2 + 0x28]
	.word	0x9fc10000	! t0_kref+0x16f0:   	call	%g4
	.word	0xacb2609a	! t0_kref+0x16f4:   	orncc	%o1, 0x9a, %l6
	.word	0xa2b03600	! t0_kref+0x16f8:   	orncc	%g0, -0xa00, %l1
	.word	0x9842ab4d	! t0_kref+0x16fc:   	addc	%o2, 0xb4d, %o4
	.word	0xa4fa6a77	! t0_kref+0x1700:   	sdivcc	%o1, 0xa77, %l2
	.word	0xa8c2800a	! t0_kref+0x1704:   	addccc	%o2, %o2, %l4
	.word	0xc53f4018	! t0_kref+0x1708:   	std	%f2, [%i5 + %i0]
	.word	0x92f80016	! t0_kref+0x170c:   	sdivcc	%g0, %l6, %o1
	.word	0x3bbfffe2	! t0_kref+0x1710:   	fble,a	_kref+0x1698
	.word	0xa48ce555	! t0_kref+0x1714:   	andcc	%l3, 0x555, %l2
	.word	0x86102008	! t0_kref+0x1718:   	mov	0x8, %g3
	.word	0x86a0e001	! t0_kref+0x171c:   	subcc	%g3, 1, %g3
	.word	0x22800018	! t0_kref+0x1720:   	be,a	_kref+0x1780
	.word	0xf56e2010	! t0_kref+0x1724:   	prefetch	%i0 + 0x10, 26
	.word	0x8da0192f	! t0_kref+0x1728:   	fstod	%f15, %f6
	.word	0xeaee3ff0	! t0_kref+0x172c:   	ldstuba	[%i0 - 0x10]%asi, %l5
	.word	0xe93f4019	! t0_kref+0x1730:   	std	%f20, [%i5 + %i1]
	.word	0xec88a013	! t0_kref+0x1734:   	lduba	[%g2 + 0x13]%asi, %l6
	.word	0x83a50823	! t0_kref+0x1738:   	fadds	%f20, %f3, %f1
	.word	0x9fc00004	! t0_kref+0x173c:   	call	%g0 + %g4
	.word	0xa6568012	! t0_kref+0x1740:   	umul	%i2, %l2, %l3
	.word	0x25480001	! t0_kref+0x1744:   	fblg,a,pt	%fcc0, _kref+0x1748
	.word	0xda500018	! t0_kref+0x1748:   	ldsh	[%g0 + %i0], %o5
	.word	0x25bffff4	! t0_kref+0x174c:   	fblg,a	_kref+0x171c
	.word	0xc91fbef0	! t0_kref+0x1750:   	ldd	[%fp - 0x110], %f4
	.word	0xf19eda59	! t0_kref+0x1754:   	ldda	[%i3 + %i1]0xd2, %f24
	.word	0xb1a01888	! t0_kref+0x1758:   	fitos	%f8, %f24
	.word	0xacf2aa38	! t0_kref+0x175c:   	udivcc	%o2, 0xa38, %l6
	.word	0x3d4fffef	! t0_kref+0x1760:   	fbule,a,pt	%fcc0, _kref+0x171c
	.word	0x9a5dc008	! t0_kref+0x1764:   	smul	%l7, %o0, %o5
	.word	0xf76e001c	! t0_kref+0x1768:   	prefetch	%i0 + %i4, 27
	.word	0xcd80a02c	! t0_kref+0x176c:   	lda	[%g2 + 0x2c]%asi, %f6
	.word	0xd0500018	! t0_kref+0x1770:   	ldsh	[%g0 + %i0], %o0
	.word	0x92e00012	! t0_kref+0x1774:   	subccc	%g0, %l2, %o1
	.word	0xf76e2018	! t0_kref+0x1778:   	prefetch	%i0 + 0x18, 27
	.word	0x30bfffe8	! t0_kref+0x177c:   	ba,a	_kref+0x171c
	.word	0xf1060000	! t0_kref+0x1780:   	ld	[%i0], %f24
	.word	0x9fc10000	! t0_kref+0x1784:   	call	%g4
	.word	0xd81e7fe8	! t0_kref+0x1788:   	ldd	[%i1 - 0x18], %o4
	.word	0xa47a8012	! t0_kref+0x178c:   	sdiv	%o2, %l2, %l2
	.word	0xe1be1814	! t0_kref+0x1790:   	stda	%f16, [%i0 + %l4]0xc0
	.word	0x24480002	! t0_kref+0x1794:   	ble,a,pt	%icc, _kref+0x179c
	.word	0x965a6313	! t0_kref+0x1798:   	smul	%o1, 0x313, %o3
	.word	0xd7f6500a	! t0_kref+0x179c:   	casxa	[%i1]0x80, %o2, %o3
	.word	0xc5ee100d	! t0_kref+0x17a0:   	prefetcha	%i0 + %o5, 2
	.word	0x36800005	! t0_kref+0x17a4:   	bge,a	_kref+0x17b8
	.word	0x913e8013	! t0_kref+0x17a8:   	sra	%i2, %l3, %o0
	.word	0xb5a68856	! t0_kref+0x17ac:   	faddd	%f26, %f22, %f26
	.word	0x81dffd93	! t0_kref+0x17b0:   	flush	%i7 - 0x26d
	.word	0xd008a006	! t0_kref+0x17b4:   	ldub	[%g2 + 6], %o0
	.word	0xf3871018	! t0_kref+0x17b8:   	lda	[%i4 + %i0]0x80, %f25
	.word	0x94657d42	! t0_kref+0x17bc:   	subc	%l5, -0x2be, %o2
	.word	0xadab005a	! t0_kref+0x17c0:   	fmovduge	%fcc0, %f26, %f22
	.word	0xd8200018	! t0_kref+0x17c4:   	st	%o4, [%g0 + %i0]
	.word	0xa062c00b	! t0_kref+0x17c8:   	subc	%o3, %o3, %l0
	.word	0xa6e5001a	! t0_kref+0x17cc:   	subccc	%l4, %i2, %l3
	.word	0x81a8caa7	! t0_kref+0x17d0:   	fcmpes	%fcc0, %f3, %f7
	.word	0x97a01a30	! t0_kref+0x17d4:   	fstoi	%f16, %f11
	.word	0xaa62b39b	! t0_kref+0x17d8:   	subc	%o2, -0xc65, %l5
	.word	0xec464000	! t0_kref+0x17dc:   	ldsw	[%i1], %l6
	.word	0xc1ee5009	! t0_kref+0x17e0:   	prefetcha	%i1 + %o1, 0
	.word	0x81ae4aa4	! t0_kref+0x17e4:   	fcmpes	%fcc0, %f25, %f4
	.word	0x9b3b4012	! t0_kref+0x17e8:   	sra	%o5, %l2, %o5
	.word	0xacad79a0	! t0_kref+0x17ec:   	andncc	%l5, -0x660, %l6
	.word	0xee1029ee	! t0_kref+0x17f0:   	lduh	[%g0 + 0x9ee], %l7
	.word	0xafa54929	! t0_kref+0x17f4:   	fmuls	%f21, %f9, %f23
	.word	0x970d6da0	! t0_kref+0x17f8:   	tsubcc	%l5, 0xda0, %o3
	.word	0xaba5c824	! t0_kref+0x17fc:   	fadds	%f23, %f4, %f21
	.word	0x9fc00004	! t0_kref+0x1800:   	call	%g0 + %g4
	.word	0xf1ee101c	! t0_kref+0x1804:   	prefetcha	%i0 + %i4, 24
	.word	0xe64e001a	! t0_kref+0x1808:   	ldsb	[%i0 + %i2], %l3
	.word	0x98434016	! t0_kref+0x180c:   	addc	%o5, %l6, %o4
	.word	0x8143c000	! t0_kref+0x1810:   	stbar
	sethi	%hi(2f), %o7
	.word	0xe40be038	! t0_kref+0x1818:   	ldub	[%o7 + 0x38], %l2
	.word	0xa41ca00c	! t0_kref+0x181c:   	xor	%l2, 0xc, %l2
	.word	0xe42be038	! t0_kref+0x1820:   	stb	%l2, [%o7 + 0x38]
	.word	0x81dbe038	! t0_kref+0x1824:   	flush	%o7 + 0x38
	.word	0x90bb4009	! t0_kref+0x1828:   	xnorcc	%o5, %o1, %o0
	.word	0x9ba01a4e	! t0_kref+0x182c:   	fdtoi	%f14, %f13
	.word	0x81800000	! t0_kref+0x1830:   	mov	%g0, %y
	.word	0x931a27f2	! t0_kref+0x1834:   	tsubcctv	%o0, 0x7f2, %o1
2:	.word	0x92f20009	! t0_kref+0x1838:   	udivcc	%o0, %o1, %o1
	.word	0xa1a01a2c	! t0_kref+0x183c:   	fstoi	%f12, %f16
	.word	0x21480004	! t0_kref+0x1840:   	fbn,a,pt	%fcc0, _kref+0x1850
	.word	0xcf80a038	! t0_kref+0x1844:   	lda	[%g2 + 0x38]%asi, %f7
	.word	0xc11fbd98	! t0_kref+0x1848:   	ldd	[%fp - 0x268], %f0
	.word	0x9ba08838	! t0_kref+0x184c:   	fadds	%f2, %f24, %f13
	.word	0xa052f473	! t0_kref+0x1850:   	umul	%o3, -0xb8d, %l0
	.word	0xc51e0000	! t0_kref+0x1854:   	ldd	[%i0], %f2
	.word	0xd0a8a03d	! t0_kref+0x1858:   	stba	%o0, [%g2 + 0x3d]%asi
	.word	0x9fc00004	! t0_kref+0x185c:   	call	%g0 + %g4
	.word	0xace4a8e2	! t0_kref+0x1860:   	subccc	%l2, 0x8e2, %l6
	.word	0x81aacaa3	! t0_kref+0x1864:   	fcmpes	%fcc0, %f11, %f3
	.word	0x81aa8a58	! t0_kref+0x1868:   	fcmpd	%fcc0, %f10, %f24
	.word	0xe84e600e	! t0_kref+0x186c:   	ldsb	[%i1 + 0xe], %l4
	.word	0xaba00132	! t0_kref+0x1870:   	fabss	%f18, %f21
	.word	0x34480004	! t0_kref+0x1874:   	bg,a,pt	%icc, _kref+0x1884
	.word	0xd44e2016	! t0_kref+0x1878:   	ldsb	[%i0 + 0x16], %o2
!	.word	0x3b8151d0	! t0_kref+0x187c:   	fble,a	SYM(t0_subr3)
	   	fble,a	SYM(t0_subr3)
	.word	0x9f414000	! t0_kref+0x1880:   	mov	%pc, %o7
	.word	0x8ba01a2f	! t0_kref+0x1884:   	fstoi	%f15, %f5
	.word	0xacb4a030	! t0_kref+0x1888:   	orncc	%l2, 0x30, %l6
	.word	0x3a800006	! t0_kref+0x188c:   	bcc,a	_kref+0x18a4
	.word	0x9ba01a54	! t0_kref+0x1890:   	fdtoi	%f20, %f13
	.word	0xe0f81019	! t0_kref+0x1894:   	swapa	[%g0 + %i1]0x80, %l0
	.word	0xd0380019	! t0_kref+0x1898:   	std	%o0, [%g0 + %i1]
	.word	0xa09cb13b	! t0_kref+0x189c:   	xorcc	%l2, -0xec5, %l0
	.word	0xad368014	! t0_kref+0x18a0:   	srl	%i2, %l4, %l6
	.word	0x81a0002f	! t0_kref+0x18a4:   	fmovs	%f15, %f0
	.word	0x98b50013	! t0_kref+0x18a8:   	orncc	%l4, %l3, %o4
	.word	0x8143e040	! t0_kref+0x18ac:   	membar	0x40
	.word	0xc13e7ff0	! t0_kref+0x18b0:   	std	%f0, [%i1 - 0x10]
	.word	0xab1a8013	! t0_kref+0x18b4:   	tsubcctv	%o2, %l3, %l5
	.word	0xdd80a00c	! t0_kref+0x18b8:   	lda	[%g2 + 0xc]%asi, %f14
	.word	0xdd80a004	! t0_kref+0x18bc:   	lda	[%g2 + 4]%asi, %f14
	.word	0xa0e5c01a	! t0_kref+0x18c0:   	subccc	%l7, %i2, %l0
	.word	0x903ced53	! t0_kref+0x18c4:   	xnor	%l3, 0xd53, %o0
	.word	0x3b800008	! t0_kref+0x18c8:   	fble,a	_kref+0x18e8
	.word	0x85828017	! t0_kref+0x18cc:   	wr	%o2, %l7, %ccr
	.word	0x9325c017	! t0_kref+0x18d0:   	mulscc	%l7, %l7, %o1
	.word	0x973a4015	! t0_kref+0x18d4:   	sra	%o1, %l5, %o3
	.word	0xde100019	! t0_kref+0x18d8:   	lduh	[%g0 + %i1], %o7
	.word	0xe296101b	! t0_kref+0x18dc:   	lduha	[%i0 + %i3]0x80, %l1
	.word	0xd8a0a018	! t0_kref+0x18e0:   	sta	%o4, [%g2 + 0x18]%asi
	.word	0x34800005	! t0_kref+0x18e4:   	bg,a	_kref+0x18f8
	.word	0x97400000	! t0_kref+0x18e8:   	mov	%y, %o3
	.word	0xada14d29	! t0_kref+0x18ec:   	fsmuld	%f5, %f9, %f22
	.word	0x95037e23	! t0_kref+0x18f0:   	taddcc	%o5, -0x1dd, %o2
	.word	0xd87e0000	! t0_kref+0x18f4:   	swap	[%i0], %o4
	.word	0xd076001d	! t0_kref+0x18f8:   	stx	%o0, [%i0 + %i5]
	.word	0xaeb30017	! t0_kref+0x18fc:   	orncc	%o4, %l7, %l7
	.word	0xa05df381	! t0_kref+0x1900:   	smul	%l7, -0xc7f, %l0
	.word	0x81a90ac6	! t0_kref+0x1904:   	fcmped	%fcc0, %f4, %f6
	call	SYM(t0_subr3)
	.word	0x9ba8c02b	! t0_kref+0x190c:   	fmovsul	%fcc0, %f11, %f13
	.word	0x89a01931	! t0_kref+0x1910:   	fstod	%f17, %f4
	.word	0x9a800012	! t0_kref+0x1914:   	addcc	%g0, %l2, %o5
	call	SYM(t0_subr3)
	.word	0xa1400000	! t0_kref+0x191c:   	mov	%y, %l0
	.word	0xada01a34	! t0_kref+0x1920:   	fstoi	%f20, %f22
	.word	0xda28a025	! t0_kref+0x1924:   	stb	%o5, [%g2 + 0x25]
	.word	0x2a480004	! t0_kref+0x1928:   	bcs,a,pt	%icc, _kref+0x1938
	.word	0xac400009	! t0_kref+0x192c:   	addc	%g0, %o1, %l6
	.word	0x3a800004	! t0_kref+0x1930:   	bcc,a	_kref+0x1940
	.word	0x94024015	! t0_kref+0x1934:   	add	%o1, %l5, %o2
	.word	0x9042c014	! t0_kref+0x1938:   	addc	%o3, %l4, %o0
	.word	0xd11fbcc0	! t0_kref+0x193c:   	ldd	[%fp - 0x340], %f8
	.word	0xa2aa0016	! t0_kref+0x1940:   	andncc	%o0, %l6, %l1
	.word	0x3f800007	! t0_kref+0x1944:   	fbo,a	_kref+0x1960
	.word	0x92bd4008	! t0_kref+0x1948:   	xnorcc	%l5, %o0, %o1
	.word	0x3c800003	! t0_kref+0x194c:   	bpos,a	_kref+0x1958
	.word	0xc0f63fe8	! t0_kref+0x1950:   	stxa	%g0, [%i0 - 0x18]%asi
	.word	0x9da00126	! t0_kref+0x1954:   	fabss	%f6, %f14
	.word	0x9ba01a2e	! t0_kref+0x1958:   	fstoi	%f14, %f13
	.word	0xf007bfe0	! t0_kref+0x195c:   	ld	[%fp - 0x20], %i0
	.word	0xc12f0005	! t0_kref+0x1960:   	st	%fsr, [%i4 + %g5]
	.word	0xa822000c	! t0_kref+0x1964:   	sub	%o0, %o4, %l4
	.word	0x9fc00004	! t0_kref+0x1968:   	call	%g0 + %g4
	.word	0xe5380019	! t0_kref+0x196c:   	std	%f18, [%g0 + %i1]
	.word	0x24480007	! t0_kref+0x1970:   	ble,a,pt	%icc, _kref+0x198c
	.word	0x972da001	! t0_kref+0x1974:   	sll	%l6, 0x1, %o3
	.word	0x91a01027	! t0_kref+0x1978:   	fstox	%f7, %f8
	.word	0xeac81019	! t0_kref+0x197c:   	ldsba	[%g0 + %i1]0x80, %l5
	.word	0xd67e7fe4	! t0_kref+0x1980:   	swap	[%i1 - 0x1c], %o3
	.word	0xda5e0000	! t0_kref+0x1984:   	ldx	[%i0], %o5
	.word	0xab2d2008	! t0_kref+0x1988:   	sll	%l4, 0x8, %l5
	.word	0xa614a124	! t0_kref+0x198c:   	or	%l2, 0x124, %l3
	.word	0xacbcc017	! t0_kref+0x1990:   	xnorcc	%l3, %l7, %l6
	.word	0x9fc10000	! t0_kref+0x1994:   	call	%g4
	.word	0xdab66014	! t0_kref+0x1998:   	stha	%o5, [%i1 + 0x14]%asi
	.word	0x86102003	! t0_kref+0x199c:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x19a0:   	bne,a	_kref+0x19a0
	.word	0x86a0e001	! t0_kref+0x19a4:   	subcc	%g3, 1, %g3
	.word	0xebee101a	! t0_kref+0x19a8:   	prefetcha	%i0 + %i2, 21
	.word	0xe206001c	! t0_kref+0x19ac:   	ld	[%i0 + %i4], %l1
	.word	0xfd6e7fe0	! t0_kref+0x19b0:   	prefetch	%i1 - 0x20, 30
	.word	0x81dc8016	! t0_kref+0x19b4:   	flush	%l2 + %l6
	.word	0xa688000b	! t0_kref+0x19b8:   	andcc	%g0, %o3, %l3
	.word	0xde162000	! t0_kref+0x19bc:   	lduh	[%i0], %o7
	.word	0x949037d2	! t0_kref+0x19c0:   	orcc	%g0, -0x82e, %o2
	.word	0xa65deca4	! t0_kref+0x19c4:   	smul	%l7, 0xca4, %l3
	.word	0xa5a609d0	! t0_kref+0x19c8:   	fdivd	%f24, %f16, %f18
	.word	0x81dcb3ce	! t0_kref+0x19cc:   	flush	%l2 - 0xc32
	.word	0xa862e7fe	! t0_kref+0x19d0:   	subc	%o3, 0x7fe, %l4
	.word	0xa5254016	! t0_kref+0x19d4:   	mulscc	%l5, %l6, %l2
	.word	0x9fc10000	! t0_kref+0x19d8:   	call	%g4
	.word	0xea4e7ff7	! t0_kref+0x19dc:   	ldsb	[%i1 - 9], %l5
	.word	0xc13e6000	! t0_kref+0x19e0:   	std	%f0, [%i1]
	.word	0xde567fe2	! t0_kref+0x19e4:   	ldsh	[%i1 - 0x1e], %o7
	.word	0x86102018	! t0_kref+0x19e8:   	mov	0x18, %g3
	.word	0x86a0e001	! t0_kref+0x19ec:   	subcc	%g3, 1, %g3
	.word	0x2280001b	! t0_kref+0x19f0:   	be,a	_kref+0x1a5c
	.word	0xa645b244	! t0_kref+0x19f4:   	addc	%l6, -0xdbc, %l3
	.word	0xacd30008	! t0_kref+0x19f8:   	umulcc	%o4, %o0, %l6
	.word	0xa1a00125	! t0_kref+0x19fc:   	fabss	%f5, %f16
	.word	0xe8b0a02e	! t0_kref+0x1a00:   	stha	%l4, [%g2 + 0x2e]%asi
	.word	0xc1be1a5c	! t0_kref+0x1a04:   	stda	%f0, [%i0 + %i4]0xd2
	.word	0xc51e4000	! t0_kref+0x1a08:   	ldd	[%i1], %f2
	.word	0xe21162e2	! t0_kref+0x1a0c:   	lduh	[%g5 + 0x2e2], %l1
	.word	0x81d96712	! t0_kref+0x1a10:   	flush	%g5 + 0x712
	.word	0x23bffff6	! t0_kref+0x1a14:   	fbne,a	_kref+0x19ec
	.word	0x9ba000a7	! t0_kref+0x1a18:   	fnegs	%f7, %f13
	.word	0xd720a028	! t0_kref+0x1a1c:   	st	%f11, [%g2 + 0x28]
	.word	0xc13e4000	! t0_kref+0x1a20:   	std	%f0, [%i1]
	.word	0x98054000	! t0_kref+0x1a24:   	add	%l5, %g0, %o4
	.word	0xac9d756e	! t0_kref+0x1a28:   	xorcc	%l5, -0xa92, %l6
	.word	0xaf332011	! t0_kref+0x1a2c:   	srl	%o4, 0x11, %l7
	.word	0x968a8017	! t0_kref+0x1a30:   	andcc	%o2, %l7, %o3
	.word	0xe36e6018	! t0_kref+0x1a34:   	prefetch	%i1 + 0x18, 17
	.word	0x81ad0a42	! t0_kref+0x1a38:   	fcmpd	%fcc0, %f20, %f2
	.word	0x9e434009	! t0_kref+0x1a3c:   	addc	%o5, %o1, %o7
	.word	0x94dd8015	! t0_kref+0x1a40:   	smulcc	%l6, %l5, %o2
	.word	0xedee501c	! t0_kref+0x1a44:   	prefetcha	%i1 + %i4, 22
	.word	0x37bfffe9	! t0_kref+0x1a48:   	fbge,a	_kref+0x19ec
	.word	0x81dec012	! t0_kref+0x1a4c:   	flush	%i3 + %l2
	.word	0x91a0192a	! t0_kref+0x1a50:   	fstod	%f10, %f8
	.word	0x26480002	! t0_kref+0x1a54:   	bl,a,pt	%icc, _kref+0x1a5c
	.word	0x90d6bb2e	! t0_kref+0x1a58:   	umulcc	%i2, -0x4d2, %o0
	.word	0xcd1e2010	! t0_kref+0x1a5c:   	ldd	[%i0 + 0x10], %f6
	.word	0xae400012	! t0_kref+0x1a60:   	addc	%g0, %l2, %l7
	.word	0xa12b0012	! t0_kref+0x1a64:   	sll	%o4, %l2, %l0
	.word	0xeb871019	! t0_kref+0x1a68:   	lda	[%i4 + %i1]0x80, %f21
	.word	0xacd54015	! t0_kref+0x1a6c:   	umulcc	%l5, %l5, %l6
	.word	0xa4d0001a	! t0_kref+0x1a70:   	umulcc	%g0, %i2, %l2
	.word	0xc96e4012	! t0_kref+0x1a74:   	prefetch	%i1 + %l2, 4
	.word	0xee10a03c	! t0_kref+0x1a78:   	lduh	[%g2 + 0x3c], %l7
	.word	0x21480006	! t0_kref+0x1a7c:   	fbn,a,pt	%fcc0, _kref+0x1a94
	.word	0xd8c0a008	! t0_kref+0x1a80:   	ldswa	[%g2 + 8]%asi, %o4
	.word	0xacf5800c	! t0_kref+0x1a84:   	udivcc	%l6, %o4, %l6
	.word	0xaef4efc7	! t0_kref+0x1a88:   	udivcc	%l3, 0xfc7, %l7
	.word	0x81dce8cc	! t0_kref+0x1a8c:   	flush	%l3 + 0x8cc
	.word	0xab400000	! t0_kref+0x1a90:   	mov	%y, %l5
	.word	0xae7d0009	! t0_kref+0x1a94:   	sdiv	%l4, %o1, %l7
	.word	0x83aa0031	! t0_kref+0x1a98:   	fmovsa	%fcc0, %f17, %f1
	.word	0xad40c000	! t0_kref+0x1a9c:   	mov	%asi, %l6
	.word	0x92e0000b	! t0_kref+0x1aa0:   	subccc	%g0, %o3, %o1
	call	SYM(t0_subr3)
	.word	0xe680a000	! t0_kref+0x1aa8:   	lda	[%g2]%asi, %l3
	.word	0xd630a036	! t0_kref+0x1aac:   	sth	%o3, [%g2 + 0x36]
	.word	0xe620a028	! t0_kref+0x1ab0:   	st	%l3, [%g2 + 0x28]
	.word	0xae527ab4	! t0_kref+0x1ab4:   	umul	%o1, -0x54c, %l7
	.word	0x81aa0ab2	! t0_kref+0x1ab8:   	fcmpes	%fcc0, %f8, %f18
	.word	0xc780a018	! t0_kref+0x1abc:   	lda	[%g2 + 0x18]%asi, %f3
	.word	0x39480008	! t0_kref+0x1ac0:   	fbuge,a,pt	%fcc0, _kref+0x1ae0
	.word	0xa5400000	! t0_kref+0x1ac4:   	mov	%y, %l2
	.word	0xe6064000	! t0_kref+0x1ac8:   	ld	[%i1], %l3
	.word	0xdd1fbeb8	! t0_kref+0x1acc:   	ldd	[%fp - 0x148], %f14
	.word	0x33800001	! t0_kref+0x1ad0:   	fbe,a	_kref+0x1ad4
	.word	0xa0a33078	! t0_kref+0x1ad4:   	subcc	%o4, -0xf88, %l0
	.word	0x909ac014	! t0_kref+0x1ad8:   	xorcc	%o3, %l4, %o0
	.word	0xd0562010	! t0_kref+0x1adc:   	ldsh	[%i0 + 0x10], %o0
	.word	0xa662401a	! t0_kref+0x1ae0:   	subc	%o1, %i2, %l3
	.word	0xd4ce5000	! t0_kref+0x1ae4:   	ldsba	[%i1]0x80, %o2
	.word	0x9fc10000	! t0_kref+0x1ae8:   	call	%g4
	.word	0x9732a006	! t0_kref+0x1aec:   	srl	%o2, 0x6, %o3
	.word	0xa2634013	! t0_kref+0x1af0:   	subc	%o5, %l3, %l1
	.word	0xa0403c9f	! t0_kref+0x1af4:   	addc	%g0, -0x361, %l0
	.word	0x925cec1e	! t0_kref+0x1af8:   	smul	%l3, 0xc1e, %o1
	.word	0xa5a68d38	! t0_kref+0x1afc:   	fsmuld	%f26, %f24, %f18
	.word	0xf11e2018	! t0_kref+0x1b00:   	ldd	[%i0 + 0x18], %f24
	.word	0xc100a020	! t0_kref+0x1b04:   	ld	[%g2 + 0x20], %f0
	.word	0x81d86e11	! t0_kref+0x1b08:   	flush	%g1 + 0xe11
	.word	0xcd1e6018	! t0_kref+0x1b0c:   	ldd	[%i1 + 0x18], %f6
	.word	0x3a480005	! t0_kref+0x1b10:   	bcc,a,pt	%icc, _kref+0x1b24
	.word	0xead0a000	! t0_kref+0x1b14:   	ldsha	[%g2]%asi, %l5
	.word	0xa8f5e0b3	! t0_kref+0x1b18:   	udivcc	%l7, 0xb3, %l4
	.word	0x92b4f7a0	! t0_kref+0x1b1c:   	orncc	%l3, -0x860, %o1
	.word	0xc807bfe4	! t0_kref+0x1b20:   	ld	[%fp - 0x1c], %g4
	.word	0xac72a7ed	! t0_kref+0x1b24:   	udiv	%o2, 0x7ed, %l6
	.word	0x81ab8ace	! t0_kref+0x1b28:   	fcmped	%fcc0, %f14, %f14
	.word	0x36480003	! t0_kref+0x1b2c:   	bge,a,pt	%icc, _kref+0x1b38
	.word	0xdf80a014	! t0_kref+0x1b30:   	lda	[%g2 + 0x14]%asi, %f15
	.word	0x81a94039	! t0_kref+0x1b34:   	fmovsug	%fcc0, %f25, %f0
	.word	0xf96e001d	! t0_kref+0x1b38:   	prefetch	%i0 + %i5, 28
	.word	0x81ae0ac2	! t0_kref+0x1b3c:   	fcmped	%fcc0, %f24, %f2
	.word	0x9fc00004	! t0_kref+0x1b40:   	call	%g0 + %g4
	.word	0xe5a0a024	! t0_kref+0x1b44:   	sta	%f18, [%g2 + 0x24]%asi
	.word	0xd9380018	! t0_kref+0x1b48:   	std	%f12, [%g0 + %i0]
	.word	0xd8180018	! t0_kref+0x1b4c:   	ldd	[%g0 + %i0], %o4
	.word	0xe6300019	! t0_kref+0x1b50:   	sth	%l3, [%g0 + %i1]
	.word	0xe8c0a028	! t0_kref+0x1b54:   	ldswa	[%g2 + 0x28]%asi, %l4
	.word	0x30480001	! t0_kref+0x1b58:   	ba,a,pt	%icc, _kref+0x1b5c
	.word	0x988a0016	! t0_kref+0x1b5c:   	andcc	%o0, %l6, %o4
	.word	0x81dee411	! t0_kref+0x1b60:   	flush	%i3 + 0x411
	.word	0x929a400a	! t0_kref+0x1b64:   	xorcc	%o1, %o2, %o1
	.word	0xd91fbe98	! t0_kref+0x1b68:   	ldd	[%fp - 0x168], %f12
	.word	0xf13e3ff8	! t0_kref+0x1b6c:   	std	%f24, [%i0 - 8]
	.word	0x9fc10000	! t0_kref+0x1b70:   	call	%g4
	.word	0x8d8226b7	! t0_kref+0x1b74:   	wr	%o0, 0x6b7, %fprs
	.word	0x25800004	! t0_kref+0x1b78:   	fblg,a	_kref+0x1b88
	.word	0x9a628012	! t0_kref+0x1b7c:   	subc	%o2, %l2, %o5
	.word	0xc5380018	! t0_kref+0x1b80:   	std	%f2, [%g0 + %i0]
	.word	0xaa3de96a	! t0_kref+0x1b84:   	xnor	%l7, 0x96a, %l5
	.word	0xc9be1808	! t0_kref+0x1b88:   	stda	%f4, [%i0 + %o0]0xc0
	.word	0xa3350015	! t0_kref+0x1b8c:   	srl	%l4, %l5, %l1
	.word	0x90422bad	! t0_kref+0x1b90:   	addc	%o0, 0xbad, %o0
	.word	0xea50a014	! t0_kref+0x1b94:   	ldsh	[%g2 + 0x14], %l5
	.word	0xd9be1816	! t0_kref+0x1b98:   	stda	%f12, [%i0 + %l6]0xc0
	.word	0xa4db7cdd	! t0_kref+0x1b9c:   	smulcc	%o5, -0x323, %l2
	.word	0xada008b7	! t0_kref+0x1ba0:   	fsubs	%f0, %f23, %f22
	.word	0xdb80a014	! t0_kref+0x1ba4:   	lda	[%g2 + 0x14]%asi, %f13
	.word	0x9fc00004	! t0_kref+0x1ba8:   	call	%g0 + %g4
	.word	0xee00a02c	! t0_kref+0x1bac:   	ld	[%g2 + 0x2c], %l7
	.word	0xaa448000	! t0_kref+0x1bb0:   	addc	%l2, %g0, %l5
	.word	0xa4f53b32	! t0_kref+0x1bb4:   	udivcc	%l4, -0x4ce, %l2
	.word	0xa5a01920	! t0_kref+0x1bb8:   	fstod	%f0, %f18
	.word	0x2d800002	! t0_kref+0x1bbc:   	fbg,a	_kref+0x1bc4
	.word	0x968d618d	! t0_kref+0x1bc0:   	andcc	%l5, 0x18d, %o3
	.word	0xd11fbdf0	! t0_kref+0x1bc4:   	ldd	[%fp - 0x210], %f8
	.word	0xd016601e	! t0_kref+0x1bc8:   	lduh	[%i1 + 0x1e], %o0
	.word	0xa83da43e	! t0_kref+0x1bcc:   	xnor	%l6, 0x43e, %l4
	.word	0x3c480003	! t0_kref+0x1bd0:   	bpos,a,pt	%icc, _kref+0x1bdc
	.word	0xa88df1af	! t0_kref+0x1bd4:   	andcc	%l7, -0xe51, %l4
	.word	0xf5871059	! t0_kref+0x1bd8:   	lda	[%i4 + %i1]0x82, %f26
	.word	0xe8070019	! t0_kref+0x1bdc:   	ld	[%i4 + %i1], %l4
	.word	0xe9be588c	! t0_kref+0x1be0:   	stda	%f20, [%i1 + %o4]0xc4
	.word	0xaba01a28	! t0_kref+0x1be4:   	fstoi	%f8, %f21
	.word	0x81d94010	! t0_kref+0x1be8:   	flush	%g5 + %l0
	.word	0xd226200c	! t0_kref+0x1bec:   	st	%o1, [%i0 + 0xc]
	.word	0xe93e7ff0	! t0_kref+0x1bf0:   	std	%f20, [%i1 - 0x10]
	.word	0xd5be3ff0	! t0_kref+0x1bf4:   	stda	%f10, [%i0 - 0x10]%asi
	.word	0xd7867ffc	! t0_kref+0x1bf8:   	lda	[%i1 - 4]%asi, %f11
	.word	0xaf05001a	! t0_kref+0x1bfc:   	taddcc	%l4, %i2, %l7
	.word	0xac624000	! t0_kref+0x1c00:   	subc	%o1, %g0, %l6
	.word	0xe300a024	! t0_kref+0x1c04:   	ld	[%g2 + 0x24], %f17
	.word	0xa464b784	! t0_kref+0x1c08:   	subc	%l2, -0x87c, %l2
	.word	0xae430008	! t0_kref+0x1c0c:   	addc	%o4, %o0, %l7
	.word	0x8143e040	! t0_kref+0x1c10:   	membar	0x40
	.word	0x903defda	! t0_kref+0x1c14:   	xnor	%l7, 0xfda, %o0
	.word	0x9fa01a2a	! t0_kref+0x1c18:   	fstoi	%f10, %f15
	.word	0x97a00036	! t0_kref+0x1c1c:   	fmovs	%f22, %f11
	.word	0xa80df9d4	! t0_kref+0x1c20:   	and	%l7, -0x62c, %l4
	.word	0x81aa8ad6	! t0_kref+0x1c24:   	fcmped	%fcc0, %f10, %f22
	.word	0xa09cff91	! t0_kref+0x1c28:   	xorcc	%l3, -0x6f, %l0
	.word	0xee30a038	! t0_kref+0x1c2c:   	sth	%l7, [%g2 + 0x38]
	.word	0x29800008	! t0_kref+0x1c30:   	fbl,a	_kref+0x1c50
	.word	0x99234013	! t0_kref+0x1c34:   	mulscc	%o5, %l3, %o4
	.word	0x85a00856	! t0_kref+0x1c38:   	faddd	%f0, %f22, %f2
	.word	0xd288a03d	! t0_kref+0x1c3c:   	lduba	[%g2 + 0x3d]%asi, %o1
	.word	0xe920a000	! t0_kref+0x1c40:   	st	%f20, [%g2]
	.word	0xe84e3fe4	! t0_kref+0x1c44:   	ldsb	[%i0 - 0x1c], %l4
	.word	0x2a480008	! t0_kref+0x1c48:   	bcs,a,pt	%icc, _kref+0x1c68
	.word	0xeab67fec	! t0_kref+0x1c4c:   	stha	%l5, [%i1 - 0x14]%asi
	.word	0xe91e3fe8	! t0_kref+0x1c50:   	ldd	[%i0 - 0x18], %f20
	.word	0x93a0108e	! t0_kref+0x1c54:   	fxtos	%f14, %f9
	.word	0x8143c000	! t0_kref+0x1c58:   	stbar
	.word	0xa3400000	! t0_kref+0x1c5c:   	mov	%y, %l1
	.word	0x90d6800a	! t0_kref+0x1c60:   	umulcc	%i2, %o2, %o0
	.word	0xea7f0018	! t0_kref+0x1c64:   	swap	[%i4 + %i0], %l5
	.word	0x9af02adc	! t0_kref+0x1c68:   	udivcc	%g0, 0xadc, %o5
	.word	0x93418000	! t0_kref+0x1c6c:   	mov	%fprs, %o1
	.word	0x9fc00004	! t0_kref+0x1c70:   	call	%g0 + %g4
	.word	0xe636c005	! t0_kref+0x1c74:   	sth	%l3, [%i3 + %g5]
	.word	0x39800003	! t0_kref+0x1c78:   	fbuge,a	_kref+0x1c84
	.word	0xcd3e4000	! t0_kref+0x1c7c:   	std	%f6, [%i1]
	.word	0xd2200019	! t0_kref+0x1c80:   	st	%o1, [%g0 + %i1]
	call	SYM(t0_subr0)
	.word	0x933a8016	! t0_kref+0x1c88:   	sra	%o2, %l6, %o1
	.word	0xd81e401d	! t0_kref+0x1c8c:   	ldd	[%i1 + %i5], %o4
	.word	0xa655000c	! t0_kref+0x1c90:   	umul	%l4, %o4, %l3
	.word	0x9b028012	! t0_kref+0x1c94:   	taddcc	%o2, %l2, %o5
	.word	0x81a88ada	! t0_kref+0x1c98:   	fcmped	%fcc0, %f2, %f26
	.word	0x8fa10927	! t0_kref+0x1c9c:   	fmuls	%f4, %f7, %f7
	call	SYM(t0_subr3)
	.word	0x81a14d25	! t0_kref+0x1ca4:   	fsmuld	%f5, %f5, %f0
	.word	0xa902ecf4	! t0_kref+0x1ca8:   	taddcc	%o3, 0xcf4, %l4
	.word	0x8fa64920	! t0_kref+0x1cac:   	fmuls	%f25, %f0, %f7
	.word	0xfdee101a	! t0_kref+0x1cb0:   	prefetcha	%i0 + %i2, 30
	.word	0xc93e401d	! t0_kref+0x1cb4:   	std	%f4, [%i1 + %i5]
	.word	0x9aa5c01a	! t0_kref+0x1cb8:   	subcc	%l7, %i2, %o5
	.word	0xac94f6ab	! t0_kref+0x1cbc:   	orcc	%l3, -0x955, %l6
	.word	0xa29221c7	! t0_kref+0x1cc0:   	orcc	%o0, 0x1c7, %l1
	.word	0xd4f6501d	! t0_kref+0x1cc4:   	stxa	%o2, [%i1 + %i5]0x80
	.word	0xded0105b	! t0_kref+0x1cc8:   	ldsha	[%g0 + %i3]0x82, %o7
	.word	0x9ad4c01a	! t0_kref+0x1ccc:   	umulcc	%l3, %i2, %o5
	.word	0xa1a0012a	! t0_kref+0x1cd0:   	fabss	%f10, %f16
	.word	0x9fc00004	! t0_kref+0x1cd4:   	call	%g0 + %g4
	.word	0xf4270018	! t0_kref+0x1cd8:   	st	%i2, [%i4 + %i0]
	.word	0xc7ee1016	! t0_kref+0x1cdc:   	prefetcha	%i0 + %l6, 3
	.word	0xcf00a00c	! t0_kref+0x1ce0:   	ld	[%g2 + 0xc], %f7
	.word	0x81a88aa0	! t0_kref+0x1ce4:   	fcmpes	%fcc0, %f2, %f0
	.word	0x81ab804a	! t0_kref+0x1ce8:   	fmovdule	%fcc0, %f10, %f0
	.word	0xea90a01c	! t0_kref+0x1cec:   	lduha	[%g2 + 0x1c]%asi, %l5
	.word	0xe1a0a010	! t0_kref+0x1cf0:   	sta	%f16, [%g2 + 0x10]%asi
	.word	0x81868000	! t0_kref+0x1cf4:   	wr	%i2, %g0, %y
	.word	0x20480003	! t0_kref+0x1cf8:   	bn,a,pt	%icc, _kref+0x1d04
	.word	0x952dc00b	! t0_kref+0x1cfc:   	sll	%l7, %o3, %o2
	.word	0xf4b0a00a	! t0_kref+0x1d00:   	stha	%i2, [%g2 + 0xa]%asi
	.word	0x85a00137	! t0_kref+0x1d04:   	fabss	%f23, %f2
	.word	0xa465001a	! t0_kref+0x1d08:   	subc	%l4, %i2, %l2
	.word	0xe96e401c	! t0_kref+0x1d0c:   	prefetch	%i1 + %i4, 20
	sethi	%hi(2f), %o7
	.word	0xe40be138	! t0_kref+0x1d14:   	ldub	[%o7 + 0x138], %l2
	.word	0xa41ca00c	! t0_kref+0x1d18:   	xor	%l2, 0xc, %l2
	.word	0xe42be138	! t0_kref+0x1d1c:   	stb	%l2, [%o7 + 0x138]
	.word	0x81dbe138	! t0_kref+0x1d20:   	flush	%o7 + 0x138
	.word	0x2d800002	! t0_kref+0x1d24:   	fbg,a	_kref+0x1d2c
	.word	0x95a01a37	! t0_kref+0x1d28:   	fstoi	%f23, %f10
	.word	0xa9418000	! t0_kref+0x1d2c:   	mov	%fprs, %l4
	.word	0xa2c2a49a	! t0_kref+0x1d30:   	addccc	%o2, 0x49a, %l1
	.word	0x980b4016	! t0_kref+0x1d34:   	and	%o5, %l6, %o4
2:	.word	0x95a0012f	! t0_kref+0x1d38:   	fabss	%f15, %f10
	.word	0x9e3ac000	! t0_kref+0x1d3c:   	not	%o3, %o7
	.word	0xcc1f4005	! t0_kref+0x1d40:   	ldd	[%i5 + %g5], %g6
	.word	0xd8c0a020	! t0_kref+0x1d44:   	ldswa	[%g2 + 0x20]%asi, %o4
	.word	0xae8d4009	! t0_kref+0x1d48:   	andcc	%l5, %o1, %l7
	.word	0x9fc00004	! t0_kref+0x1d4c:   	call	%g0 + %g4
	.word	0xaf2d0013	! t0_kref+0x1d50:   	sll	%l4, %l3, %l7
	.word	0x878020d0	! t0_kref+0x1d54:   	mov	0xd0, %asi
	.word	0x3c800001	! t0_kref+0x1d58:   	bpos,a	_kref+0x1d5c
	.word	0xdd00a02c	! t0_kref+0x1d5c:   	ld	[%g2 + 0x2c], %f14
	.word	0x81dec01c	! t0_kref+0x1d60:   	flush	%i3 + %i4
	.word	0xf420a004	! t0_kref+0x1d64:   	st	%i2, [%g2 + 4]
	.word	0x969df21b	! t0_kref+0x1d68:   	xorcc	%l7, -0xde5, %o3
	.word	0xa6f237f2	! t0_kref+0x1d6c:   	udivcc	%o0, -0x80e, %l3
	.word	0x28800003	! t0_kref+0x1d70:   	bleu,a	_kref+0x1d7c
	.word	0xb3abc030	! t0_kref+0x1d74:   	fmovso	%fcc0, %f16, %f25
	.word	0x81dc6e97	! t0_kref+0x1d78:   	flush	%l1 + 0xe97
	.word	0x90b4c015	! t0_kref+0x1d7c:   	orncc	%l3, %l5, %o0
	.word	0x39800008	! t0_kref+0x1d80:   	fbuge,a	_kref+0x1da0
	.word	0x9a8d6d70	! t0_kref+0x1d84:   	andcc	%l5, 0xd70, %o5
	.word	0xf53e7fe0	! t0_kref+0x1d88:   	std	%f26, [%i1 - 0x20]
	.word	0x8fa000b9	! t0_kref+0x1d8c:   	fnegs	%f25, %f7
	.word	0xe206001c	! t0_kref+0x1d90:   	ld	[%i0 + %i4], %l1
	.word	0xc96e6008	! t0_kref+0x1d94:   	prefetch	%i1 + 8, 4
	.word	0x905b400b	! t0_kref+0x1d98:   	smul	%o5, %o3, %o0
	.word	0xd81e6010	! t0_kref+0x1d9c:   	ldd	[%i1 + 0x10], %o4
	.word	0xa03d37c2	! t0_kref+0x1da0:   	xnor	%l4, -0x83e, %l0
	.word	0xa0a02851	! t0_kref+0x1da4:   	subcc	%g0, 0x851, %l0
	.word	0xb1a309ce	! t0_kref+0x1da8:   	fdivd	%f12, %f14, %f24
	.word	0xa4d24000	! t0_kref+0x1dac:   	umulcc	%o1, %g0, %l2
	.word	0xde5e0000	! t0_kref+0x1db0:   	ldx	[%i0], %o7
	.word	0x9aba0015	! t0_kref+0x1db4:   	xnorcc	%o0, %l5, %o5
	.word	0xc12e2014	! t0_kref+0x1db8:   	st	%fsr, [%i0 + 0x14]
	.word	0x85a089c0	! t0_kref+0x1dbc:   	fdivd	%f2, %f0, %f2
	call	SYM(t0_subr2)
	.word	0xd220a008	! t0_kref+0x1dc4:   	st	%o1, [%g2 + 8]
	.word	0xc700a03c	! t0_kref+0x1dc8:   	ld	[%g2 + 0x3c], %f3
	.word	0x985b000a	! t0_kref+0x1dcc:   	smul	%o4, %o2, %o4
	.word	0x87a00128	! t0_kref+0x1dd0:   	fabss	%f8, %f3
	.word	0x9de3bfa0	! t0_kref+0x1dd4:   	save	%sp, -0x60, %sp
	.word	0x93ef001a	! t0_kref+0x1dd8:   	restore	%i4, %i2, %o1
	.word	0x86102002	! t0_kref+0x1ddc:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x1de0:   	bne,a	_kref+0x1de0
	.word	0x86a0e001	! t0_kref+0x1de4:   	subcc	%g3, 1, %g3
	.word	0xb5a68822	! t0_kref+0x1de8:   	fadds	%f26, %f2, %f26
	.word	0xd01f4018	! t0_kref+0x1dec:   	ldd	[%i5 + %i0], %o0
	.word	0x81ab8ad8	! t0_kref+0x1df0:   	fcmped	%fcc0, %f14, %f24
	.word	0x93a01897	! t0_kref+0x1df4:   	fitos	%f23, %f9
	.word	0xc700a024	! t0_kref+0x1df8:   	ld	[%g2 + 0x24], %f3
	.word	0x9fc10000	! t0_kref+0x1dfc:   	call	%g4
	.word	0x95a14d31	! t0_kref+0x1e00:   	fsmuld	%f5, %f17, %f10
	.word	0xab228016	! t0_kref+0x1e04:   	mulscc	%o2, %l6, %l5
	.word	0xd2b6501b	! t0_kref+0x1e08:   	stha	%o1, [%i1 + %i3]0x80
	.word	0x9a42c009	! t0_kref+0x1e0c:   	addc	%o3, %o1, %o5
	.word	0xf4380019	! t0_kref+0x1e10:   	std	%i2, [%g0 + %i1]
	.word	0xa9256e06	! t0_kref+0x1e14:   	mulscc	%l5, 0xe06, %l4
	.word	0x8184c000	! t0_kref+0x1e18:   	wr	%l3, %g0, %y
	.word	0x99a08d38	! t0_kref+0x1e1c:   	fsmuld	%f2, %f24, %f12
	.word	0xd91fbf50	! t0_kref+0x1e20:   	ldd	[%fp - 0xb0], %f12
	.word	0x81aa8ac2	! t0_kref+0x1e24:   	fcmped	%fcc0, %f10, %f2
	.word	0x28480003	! t0_kref+0x1e28:   	bleu,a,pt	%icc, _kref+0x1e34
	.word	0xea7e3fe0	! t0_kref+0x1e2c:   	swap	[%i0 - 0x20], %l5
	.word	0xc93e7fe0	! t0_kref+0x1e30:   	std	%f4, [%i1 - 0x20]
	.word	0xd2363ff0	! t0_kref+0x1e34:   	sth	%o1, [%i0 - 0x10]
	.word	0x8143e040	! t0_kref+0x1e38:   	membar	0x40
	.word	0xa664a954	! t0_kref+0x1e3c:   	subc	%l2, 0x954, %l3
	.word	0xec20a02c	! t0_kref+0x1e40:   	st	%l6, [%g2 + 0x2c]
	.word	0x99a34925	! t0_kref+0x1e44:   	fmuls	%f13, %f5, %f12
	.word	0xc0b6501b	! t0_kref+0x1e48:   	stha	%g0, [%i1 + %i3]0x80
	.word	0xc56e0017	! t0_kref+0x1e4c:   	prefetch	%i0 + %l7, 2
	.word	0xd0400018	! t0_kref+0x1e50:   	ldsw	[%g0 + %i0], %o0
	.word	0xec367ff6	! t0_kref+0x1e54:   	sth	%l6, [%i1 - 0xa]
	.word	0x9fc00004	! t0_kref+0x1e58:   	call	%g0 + %g4
	.word	0xc9be1809	! t0_kref+0x1e5c:   	stda	%f4, [%i0 + %o1]0xc0
	.word	0xef20a008	! t0_kref+0x1e60:   	st	%f23, [%g2 + 8]
	.word	0x89abc021	! t0_kref+0x1e64:   	fmovso	%fcc0, %f1, %f4
	.word	0xc53f4018	! t0_kref+0x1e68:   	std	%f2, [%i5 + %i0]
	.word	0xe828a024	! t0_kref+0x1e6c:   	stb	%l4, [%g2 + 0x24]
	.word	0xf5380019	! t0_kref+0x1e70:   	std	%f26, [%g0 + %i1]
	.word	0xd4500018	! t0_kref+0x1e74:   	ldsh	[%g0 + %i0], %o2
	.word	0xec062004	! t0_kref+0x1e78:   	ld	[%i0 + 4], %l6
	call	SYM(t0_subr3)
	.word	0x9ba0012e	! t0_kref+0x1e80:   	fabss	%f14, %f13
	.word	0x9fc10000	! t0_kref+0x1e84:   	call	%g4
	.word	0x94f4b432	! t0_kref+0x1e88:   	udivcc	%l2, -0xbce, %o2
	.word	0x83414000	! t0_kref+0x1e8c:   	mov	%pc, %g1
	.word	0x87ab0036	! t0_kref+0x1e90:   	fmovsuge	%fcc0, %f22, %f3
	.word	0xe520a01c	! t0_kref+0x1e94:   	st	%f18, [%g2 + 0x1c]
	.word	0x95a0cd35	! t0_kref+0x1e98:   	fsmuld	%f3, %f21, %f10
	.word	0xa1a14d22	! t0_kref+0x1e9c:   	fsmuld	%f5, %f2, %f16
	.word	0x81a01932	! t0_kref+0x1ea0:   	fstod	%f18, %f0
	.word	0xd300a020	! t0_kref+0x1ea4:   	ld	[%g2 + 0x20], %f9
	.word	0xa0032045	! t0_kref+0x1ea8:   	add	%o4, 0x45, %l0
	.word	0x89a00054	! t0_kref+0x1eac:   	fmovd	%f20, %f4
	.word	0xe6263fe4	! t0_kref+0x1eb0:   	st	%l3, [%i0 - 0x1c]
	.word	0x8ba01a56	! t0_kref+0x1eb4:   	fdtoi	%f22, %f5
	.word	0xd6b6101b	! t0_kref+0x1eb8:   	stha	%o3, [%i0 + %i3]0x80
	.word	0x9de3bfa0	! t0_kref+0x1ebc:   	save	%sp, -0x60, %sp
	.word	0xb0576eb7	! t0_kref+0x1ec0:   	umul	%i5, 0xeb7, %i0
	.word	0xa7e8294a	! t0_kref+0x1ec4:   	restore	%g0, 0x94a, %l3
	.word	0xde965000	! t0_kref+0x1ec8:   	lduha	[%i1]0x80, %o7
	.word	0xf4ae9018	! t0_kref+0x1ecc:   	stba	%i2, [%i2 + %i0]0x80
	.word	0x27480005	! t0_kref+0x1ed0:   	fbul,a,pt	%fcc0, _kref+0x1ee4
	.word	0xda363ff2	! t0_kref+0x1ed4:   	sth	%o5, [%i0 - 0xe]
	.word	0x2e480007	! t0_kref+0x1ed8:   	bvs,a,pt	%icc, _kref+0x1ef4
	.word	0xd436c018	! t0_kref+0x1edc:   	sth	%o2, [%i3 + %i0]
	.word	0xada9c040	! t0_kref+0x1ee0:   	fmovdu	%fcc0, %f0, %f22
	.word	0xd08e101a	! t0_kref+0x1ee4:   	lduba	[%i0 + %i2]0x80, %o0
	.word	0xa1a30d20	! t0_kref+0x1ee8:   	fsmuld	%f12, %f0, %f16
	.word	0x9135c01a	! t0_kref+0x1eec:   	srl	%l7, %i2, %o0
	.word	0xd0180019	! t0_kref+0x1ef0:   	ldd	[%g0 + %i1], %o0
	.word	0xac1cb2ad	! t0_kref+0x1ef4:   	xor	%l2, -0xd53, %l6
	.word	0xafa000a8	! t0_kref+0x1ef8:   	fnegs	%f8, %f23
	.word	0xaf352012	! t0_kref+0x1efc:   	srl	%l4, 0x12, %l7
	.word	0x9e520014	! t0_kref+0x1f00:   	umul	%o0, %l4, %o7
	.word	0xe0564000	! t0_kref+0x1f04:   	ldsh	[%i1], %l0
	.word	0x932ca00a	! t0_kref+0x1f08:   	sll	%l2, 0xa, %o1
	.word	0x81ab0ac4	! t0_kref+0x1f0c:   	fcmped	%fcc0, %f12, %f4
	.word	0x99a18840	! t0_kref+0x1f10:   	faddd	%f6, %f0, %f12
	.word	0xd600a018	! t0_kref+0x1f14:   	ld	[%g2 + 0x18], %o3
	.word	0x81a88a42	! t0_kref+0x1f18:   	fcmpd	%fcc0, %f2, %f2
	.word	0xa8b4a579	! t0_kref+0x1f1c:   	orncc	%l2, 0x579, %l4
	.word	0x987b401a	! t0_kref+0x1f20:   	sdiv	%o5, %i2, %o4
	.word	0xee48a00a	! t0_kref+0x1f24:   	ldsb	[%g2 + 0xa], %l7
	.word	0xa205c009	! t0_kref+0x1f28:   	add	%l7, %o1, %l1
	.word	0x29800004	! t0_kref+0x1f2c:   	fbl,a	_kref+0x1f3c
	.word	0xe9be1808	! t0_kref+0x1f30:   	stda	%f20, [%i0 + %o0]0xc0
	.word	0x81de2a72	! t0_kref+0x1f34:   	flush	%i0 + 0xa72
	.word	0xa244e773	! t0_kref+0x1f38:   	addc	%l3, 0x773, %l1
	call	SYM(_kaos_done)
	.word	0x01000000	! t0_kref+0x1f40:   	nop
	KGLOBAL(t0_ktbl_end)
t0_ktbl_end:
t0_ktbl_page_end:

KTEXT_MODULE(t0_module_subr0, 0x27c3a000)
.seg "text"
t0_subr0_page_begin:
	.skip 8184
.global _t0_subr0; ENTRY(t0_subr0)
	.word	0xa6844012	! t0_subr0+0x0:   	addcc	%l1, %l2, %l3
	.word	0x81c3e008	! t0_subr0+0x4:   	retl
	.word	0xaa64c014	! t0_subr0+0x8:   	subc	%l3, %l4, %l5
t0_subr0_page_end:

KTEXT_MODULE(t0_module_subr1, 0x5e91e000)
.seg "text"
t0_subr1_page_begin:
	.skip 8184
.global _t0_subr1; ENTRY(t0_subr1)
	.word	0x9de3bfa0	! t0_subr1+0x0:   	save	%sp, -0x60, %sp
	.word	0xb29eaa5a	! t0_subr1+0x4:   	xorcc	%i2, 0xa5a, %i1
	.word	0x81c7e008	! t0_subr1+0x8:   	ret
	.word	0xa7ee6001	! t0_subr1+0xc:   	restore	%i1, 1, %l3
t0_subr1_page_end:

KTEXT_MODULE(t0_module_subr2, 0x69dfa000)
.seg "text"
t0_subr2_page_begin:
	.skip 8184
.global _t0_subr2; ENTRY(t0_subr2)
	.word	0x9de3bfa0	! t0_subr2+0x0:   	save	%sp, -0x60, %sp
	.word	0xb2066001	! t0_subr2+0x4:   	add	%i1, 1, %i1
	.word	0x81c7e008	! t0_subr2+0x8:   	ret
	.word	0xa3ee6001	! t0_subr2+0xc:   	restore	%i1, 1, %l1
t0_subr2_page_end:

KTEXT_MODULE(t0_module_subr3, 0x69e80000)
.seg "text"
t0_subr3_page_begin:
	.skip 8124
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
!  Total operations: 1912  
!
!  Operation frequencies
!
!  name               exp    obs
!  ldsb              1.45   1.15
!  ldub              0.24   0.21
!  ldsh              0.78   1.26
!  lduh              0.22   0.31
!  ld                1.02   1.05
!  ldd               0.80   0.84
!  swap              1.31   1.05
!  ldstub            0.09   0.05
!  stb               0.20   0.47
!  sth               1.23   1.41
!  st                1.02   0.99
!  std               0.15   0.10
!  add               1.39   1.31
!  addcc             0.50   0.42
!  addx              1.11   1.20
!  addxcc            0.61   0.47
!  taddcc            0.28   0.26
!  taddcctv          0.06   0.10
!  sub               0.03   0.05
!  subcc             0.41   0.58
!  subx              1.36   1.57
!  subxcc            0.79   1.05
!  tsubcc            0.34   0.42
!  tsubcctv          0.27   0.31
!  mulscc            0.84   0.58
!  and               0.30   0.58
!  andcc             1.36   1.36
!  andn              0.05   0.16
!  andncc            0.28   0.31
!  or                0.10   0.16
!  orcc              0.75   0.73
!  orn               0.09   0.00
!  orncc             1.21   1.31
!  xor               0.48   0.63
!  xorcc             1.40   1.05
!  xnor              0.88   0.73
!  xnorcc            1.10   1.31
!  sll               1.14   0.94
!  srl               1.21   1.26
!  sra               1.00   0.89
!  unimp             0.25   0.16
!  umul              1.05   1.05
!  smul              1.31   1.15
!  udiv              0.03   0.16
!  sdiv              0.86   0.94
!  umulcc            1.43   1.62
!  smulcc            0.75   0.94
!  udivcc            0.81   1.20
!  sdivcc            0.32   0.31
!  rdy               1.23   1.31
!  wry               0.83   0.58
!  bicc              1.49   1.36
!  sethi             0.25   0.16
!  jmpl              1.68   2.09
!  call              1.01   0.99
!  ticc              0.00   0.00
!  flush             1.62   2.14
!  save              0.29   0.26
!  restore           1.35   0.00
!  stbar             0.25   0.31
!  ldf               0.11   0.26
!  lddf              0.98   1.15
!  stf               0.11   0.00
!  stdf              1.34   2.20
!  fadds             1.56   1.57
!  fsubs             0.67   0.68
!  fmuls             1.67   2.25
!  fdivs             0.36   0.42
!  faddd             0.57   0.47
!  fsubd             0.06   0.05
!  fmuld             0.02   0.00
!  fdivd             0.20   0.37
!  faddq             0.00   0.00
!  fsubq             0.00   0.00
!  fmulq             0.00   0.00
!  fdivq             0.00   0.00
!  fsmuld            1.17   1.62
!  fdmulq            0.00   0.00
!  fitos             0.59   0.26
!  fitod             0.13   0.00
!  fitoq             0.00   0.00
!  fstoi             1.68   2.04
!  fstod             0.81   0.89
!  fstoq             0.00   0.00
!  fdtoi             0.32   0.37
!  fdtos             0.22   0.05
!  fdtoq             0.00   0.00
!  fqtoi             0.00   0.00
!  fqtos             0.00   0.00
!  fqtod             0.00   0.00
!  fmovs             0.62   0.42
!  fnegs             0.67   0.47
!  fabss             0.75   1.05
!  fsqrts            0.06   0.00
!  fsqrtd            0.00   0.00
!  fsqrtq            0.00   0.00
!  fcmps             0.01   0.05
!  fcmpd             0.63   0.52
!  fcmpq             0.00   0.00
!  fcmpes            0.71   0.73
!  fcmped            1.24   1.41
!  fcmpeq            0.00   0.00
!  fbfcc             4.01   4.03
!  ldfsr             0.08   0.00
!  stfsr             0.26   0.16
!  loop              1.63   0.84
!  offset            0.04   0.00
!  area              0.29   0.58
!  target            0.09   0.05
!  goto              0.06   0.00
!  sigsegv           0.14   0.21
!  sigbus            0.33   0.31
!  imodify           1.60   0.68
!  ldfsr_offset      0.10   0.00
!  fpattern          0.84   0.89
!  lbranch           0.32   0.47
!  shmld             5.14   4.92
!  shmst             4.40   4.86
!  shmpf             0.16   0.16
!  shmswap           0.09   0.16
!  shmblkld          0.95   0.05
!  shmblkst          1.52   0.00
!  shmblkchk         0.50   0.37
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
!  casa              0.00   0.00
!  rdasi             0.09   0.10
!  wrasi             0.07   0.10
!  bpcc              1.99   1.88
!  fbpfcc            1.34   0.94
!  fmovscc           0.24   0.37
!  fmovdcc           0.32   0.52
!  fmovqcc           0.00   0.00
!  movcc             0.01   0.00
!  flushw            0.05   0.00
!  membar            0.30   0.21
!  prefetch          1.44   1.88
!  rdpc              0.05   0.05
!  ldqf              0.00   0.00
!  stqf              0.00   0.00
!  ldfa              0.29   0.42
!  lddfa             0.04   0.00
!  ldqfa             0.00   0.00
!  ldsba             0.16   0.16
!  ldsha             0.07   0.00
!  lduba             0.10   0.16
!  lduha             0.19   0.21
!  lda               0.31   0.47
!  ldda              0.24   0.26
!  ldstuba           0.28   0.21
!  prefetcha         1.65   1.88
!  stfa              0.00   0.00
!  stdfa             0.02   0.05
!  stqfa             0.00   0.00
!  stba              0.17   0.10
!  stha              0.21   0.52
!  sta               0.13   0.00
!  stda              0.01   0.00
!  swapa             0.23   0.37
!  fmovd             0.11   0.16
!  fnegd             0.13   0.26
!  fabsd             0.17   0.31
!  fstox             0.27   0.10
!  fdtox             0.08   0.00
!  fxtos             0.32   0.21
!  fxtod             0.09   0.05
!  lds               0.16   0.16
!  ldsa              0.14   0.00
!  ldx               0.24   0.37
!  ldxa              0.05   0.05
!  nofault           0.20   0.26
!  rdgsr             0.00   0.00
!  wrgsr             0.00   0.00
!  fpadd16           0.00   0.00
!  fpadd16s          0.00   0.00
!  fpadd32           0.00   0.00
!  fpadd32s          0.00   0.00
!  fpsub16           0.00   0.00
!  fpsub16s          0.00   0.00
!  fpsub32           0.00   0.00
!  fpsub32s          0.00   0.00
!  fpack16           0.00   0.00
!  fpack32           0.00   0.00
!  fpackfix          0.00   0.00
!  fexpand           0.00   0.00
!  fpmerge           0.00   0.00
!  fmul8x16          0.00   0.00
!  fmul8x16au        0.00   0.00
!  fmul8x16al        0.00   0.00
!  fmul8sux16        0.00   0.00
!  fmul8ulx16        0.00   0.00
!  fmuld8sux16       0.00   0.00
!  fmuld8ulx16       0.00   0.00
!  alignaddr         0.00   0.00
!  alignaddrl        0.00   0.00
!  faligndata        0.00   0.00
!  fzero             0.00   0.00
!  fzeros            0.00   0.00
!  fone              0.00   0.00
!  fones             0.00   0.00
!  fsrc1             0.00   0.00
!  fsrc1s            0.00   0.00
!  fsrc2             0.00   0.00
!  fsrc2s            0.00   0.00
!  fnot1             0.00   0.00
!  fnot1s            0.00   0.00
!  fnot2             0.00   0.00
!  fnot2s            0.00   0.00
!  for               0.00   0.00
!  fors              0.00   0.00
!  fnor              0.00   0.00
!  fnors             0.00   0.00
!  fand              0.00   0.00
!  fands             0.00   0.00
!  fnand             0.00   0.00
!  fnands            0.00   0.00
!  fxor              0.00   0.00
!  fxors             0.00   0.00
!  fxnor             0.00   0.00
!  fxnors            0.00   0.00
!  fornot1           0.00   0.00
!  fornot1s          0.00   0.00
!  fornot2           0.00   0.00
!  fornot2s          0.00   0.00
!  fandnot1          0.00   0.00
!  fandnot1s         0.00   0.00
!  fandnot2          0.00   0.00
!  fandnot2s         0.00   0.00
!  fcmpgt16          0.00   0.00
!  fcmpgt32          0.00   0.00
!  fcmple16          0.00   0.00
!  fcmple32          0.00   0.00
!  fcmpne16          0.00   0.00
!  fcmpne32          0.00   0.00
!  fcmpeq16          0.00   0.00
!  fcmpeq32          0.00   0.00
!  edge8             0.00   0.00
!  edge8l            0.00   0.00
!  edge16            0.00   0.00
!  edge16l           0.00   0.00
!  edge32            0.00   0.00
!  edge32l           0.00   0.00
!  pdist             0.00   0.00
!  partial_st8       0.27   0.37
!  partial_st16      0.19   0.16
!  partial_st32      0.13   0.21
!  short_st8         0.01   0.05
!  short_st16        0.06   0.05
!  short_ld8         0.21   0.16
!  short_ld16        0.28   0.42
!  blkld             0.30   0.00
!  blkst             0.17   0.00
!  blkld_offset      0.06   0.00
!  blkst_offset      0.24   0.00
!  blk_check         0.29   0.31
!  casxa             0.15   0.10
!  rdccr             0.13   0.16
!  rdfprs            0.26   0.31
!  wrccr             0.15   0.26
!  popc              0.05   0.00
!  wrfprs            0.19   0.58
!  stx               0.28   0.47
!  stxa              0.15   0.21
!  cflush            0.00   0.00
!  array8            0.00   0.00
!  array16           0.00   0.00
!  array32           0.00   0.00
!  edge8n            0.00   0.00
!  edge8ln           0.00   0.00
!  edge16n           0.00   0.00
!  edge16ln          0.00   0.00
!  edge32n           0.00   0.00
!  edge32ln          0.00   0.00
!  bmask             0.00   0.00
!  bshuffle          0.00   0.00
!  siam              0.00   0.00
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
KDATA_MODULE(t0_module_offset_table, 0x3a910000)
.seg "data"
t0_offset_table_start:
t0_offset_table_size:	.word	0x00000008
t0_offset_table:
	.word	0xffffffe0
	.word	0x00000010
	.word	0xfffffff8
	.word	0xffffffe8
	.word	0x00000000
	.word	0x00000008
	.word	0x00000018
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

KDATA_MODULE(t0_module_data_in_regs, 0x19eac000)
.seg "data"
KGLOBAL(t0_data_in_regs)
t0_data_in_regs_start:
t0_data_in_regs:
	.word	0x403f45d7          ! %f0
	.word	0xed8f849d          ! %f1
	.word	0x6a31c860          ! %f2
	.word	0x220562b5          ! %f3
	.word	0xab214891          ! %f4
	.word	0xb5c16272          ! %f5
	.word	0x14763ca8          ! %f6
	.word	0x5255509f          ! %f7
	.word	0x61c72a21          ! %f8
	.word	0xc32c0d86          ! %f9
	.word	0x69e6eac3          ! %f10
	.word	0x7c05f14c          ! %f11
	.word	0x3d3d395f          ! %f12
	.word	0xacc589c8          ! %f13
	.word	0x09440d17          ! %f14
	.word	0x100fc4f2          ! %f15
	.word	0x3e0edb39          ! %f16
	.word	0x8d41f368          ! %f17
	.word	0xc5c2eae2          ! %f18
	.word	0x3a6dc09d          ! %f19
	.word	0x76824b0d          ! %f20
	.word	0x92bfda9d          ! %f21
	.word	0x3e9302b6          ! %f22
	.word	0xc4e4999b          ! %f23
	.word	0xdf5f8c3a          ! %f24
	.word	0x60f817a2          ! %f25
	.word	0x9166e823          ! %f26
	.word	0x8c68e319          ! %f27
	.word	0x9e3c60f4          ! %f28
	.word	0xa2c85b00          ! %f29
	.word	0xc6c0c8b5          ! %f30
	.word	0x8616e20d          ! %f31
	.word	0xd9905a57          ! %f32
	.word	0x879ffe13          ! %f33
	.word	0xae4dcc20          ! %f34
	.word	0x72793b57          ! %f35
	.word	0x4f7155be          ! %f36
	.word	0xabcad7c6          ! %f37
	.word	0x1e9ac3b9          ! %f38
	.word	0xaa09e022          ! %f39
	.word	0xe109fb55          ! %f40
	.word	0xf80e19a0          ! %f41
	.word	0x511fdd28          ! %f42
	.word	0xa6aadc90          ! %f43
	.word	0x5be111ed          ! %f44
	.word	0x89c77904          ! %f45
	.word	0xb9484c5c          ! %f46
	.word	0xb98aec96          ! %f47
	.word	0x4421bc0f          ! %f48
	.word	0x60ff28b4          ! %f49
	.word	0xc5f620be          ! %f50
	.word	0x85c3fb23          ! %f51
	.word	0xdd81f253          ! %f52
	.word	0xd9e16696          ! %f53
	.word	0x7851b9a9          ! %f54
	.word	0x8c3fef87          ! %f55
	.word	0x5c65cef1          ! %f56
	.word	0x531ca1bb          ! %f57
	.word	0x53b78e18          ! %f58
	.word	0x27526d13          ! %f59
	.word	0x0bb37e98          ! %f60
	.word	0x8eed7c9c          ! %f61
	.word	0x888e3ba0          ! %f62
	.word	0x7a3c68fc          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0x5b4       ! %g1 (code pointer)
	.word	t0_data_in_shm_area ! %g2 (shared area pointer)
	.word	0xfb640fde          ! %g3 (loop index)
	.word	SYM(t0_subr3)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0x723b37cb          ! %o0
	.word	0x17663e6a          ! %o1
	.word	0x08115a77          ! %o2
	.word	0xf19cbe41          ! %o3
	.word	0x60910682          ! %o4
	.word	0x1a50c2d1          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0x66b4ea7e          ! %l0
	.word	0x99722fa6          ! %l1
	.word	0x39fa10a1          ! %l2
	.word	0xecb8ba84          ! %l3
	.word	0x16a16fb8          ! %l4
	.word	0x50730ff8          ! %l5
	.word	0xac0285b8          ! %l6
	.word	0x0aff095b          ! %l7
	.word	t0_data_in_area0    ! %i0 (area pointer)
	.word	t0_data_in_area0    ! %i1 (area pointer)
	.word	0x00000010          ! %i2 (byte offset)
	.word	0x0000000a          ! %i3 (halfword offset)
	.word	0xfffffff8          ! %i4 (word offset)
	.word	0x00000000          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0x2ffa4958          ! %y
	.word	0x00000000          ! %icc (nzvc)
	.word	0x80000d0b          ! %fsr
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

KDATA_MODULE(t0_module_data_in_stack, 0x516ea000)
.seg "data"
KGLOBAL(t0_data_in_mtbl_size)
KGLOBAL(t0_data_in_mtbl)
KGLOBAL(t0_data_in_stack)
t0_data_in_stack_start:
	.word	0xb618ec35
	.word	0xe7cc3d1e
	.word	0x46198209
	.word	0x0e6e5d44
	.word	0xe1fe02e6
	.word	0x5a89a34f
	.word	0xe842094b
	.word	0x474d11cf
	.word	0x6188aa69
	.word	0xf2e050aa
	.word	0xce70abd8
	.word	0x7da5ac68
	.word	0x1083a885
	.word	0x9920c075
	.word	0x1969b7b2
	.word	0x4174fb89
	.word	0xdf2a99f6
	.word	0xde11e596
	.word	0x93176399
	.word	0x651320e7
	.word	0x8894e0c9
	.word	0x46081c58
	.word	0x1d34d779
	.word	0x288e62d3
	.word	0x60b0a3e9
	.word	0x72d2f46e
	.word	0xe2bcc823
	.word	0x47972fe2
	.word	0xe035b3f8
	.word	0xbf2f1737
	.word	0x1af99a3f
	.word	0x57b638d0
	.word	0xf3216963
	.word	0x0579ce43
	.word	0x68804081
	.word	0x8cafc4a1
	.word	0x9dc9cfb0
	.word	0xeb37ee15
	.word	0x9d3e491b
	.word	0xd185a308
	.word	0x8ea7b219
	.word	0x6bda292a
	.word	0x3256ce72
	.word	0x4fbb610c
	.word	0xbcdc5d5e
	.word	0x0b450f3a
	.word	0x46113f14
	.word	0x0296a3e9
	.word	0x6e712ad7
	.word	0x24433cbd
	.word	0xded830e8
	.word	0xfb4fce34
	.word	0x6a9c28c8
	.word	0x046c7eb0
	.word	0x6775b3a6
	.word	0x13c55341
	.word	0xc53673f8
	.word	0xce74ee98
	.word	0x699dd689
	.word	0x29865cc8
	.word	0x7e461684
	.word	0x89834ac6
	.word	0xffaf5543
	.word	0xb12fa6c6
	.word	0x1c467ff0
	.word	0xf85e0edd
	.word	0x089da031
	.word	0xbc5fb5a0
	.word	0xbef7ea7e
	.word	0x32331091
	.word	0x0876b3d0
	.word	0x0935ca8e
	.word	0xcc2f41c3
	.word	0xe8b5a4b1
	.word	0xb02a736e
	.word	0xa3a13a36
	.word	0xfda55e76
	.word	0x788b9066
	.word	0x1f607b24
	.word	0x2cfd0997
	.word	0x075dab8b
	.word	0x81c14abc
	.word	0x1e849d03
	.word	0x4fcdf528
	.word	0x6729887f
	.word	0xca825262
	.word	0x4d017d8c
	.word	0xea374640
	.word	0xe04efcf5
	.word	0x8eda9bad
	.word	0xc3240365
	.word	0x641d1ab8
	.word	0x37ae9182
	.word	0x59125ae2
	.word	0x17998e4a
	.word	0xac3102ce
	.word	0x8e2d61c4
	.word	0xcf85aeb4
	.word	0x71262941
	.word	0xd390194c
	.word	0x25e5bbb9
	.word	0x12edef0b
	.word	0x1d4f2c11
	.word	0xf067f9e8
	.word	0xf3f1e04d
	.word	0xdb2aa406
	.word	0x8f89fff4
	.word	0x378a39ee
	.word	0x71c9b934
	.word	0x44f46943
	.word	0x2945fb8b
	.word	0x612c471c
	.word	0x176597fa
	.word	0x88c4415d
	.word	0x65238a11
	.word	0xd88bd0cc
	.word	0x7fe55257
	.word	0xaede1db6
	.word	0x161a11d3
	.word	0xb70e1f58
	.word	0xc69c4fc7
	.word	0xde159e75
	.word	0x31714ddf
	.word	0x93f2fdb9
	.word	0x4f585c5a
	.word	0x76d04ed2
	.word	0xd78a0efb
	.word	0x181a1971
	.word	0x23c254c8
	.word	0xaa38e190
	.word	0xfebd97d9
	.word	0x83e3fcab
	.word	0xe614ffc8
	.word	0x4acb31cb
	.word	0xb45a0888
	.word	0xca26069f
	.word	0x3057a8a1
	.word	0xd7990bf3
	.word	0x7d358d2c
	.word	0x10bb063b
	.word	0x040f4f00
	.word	0x2b240318
	.word	0x10b943f1
	.word	0xb3b05aff
	.word	0xba32800c
	.word	0x31a8d667
	.word	0xc1e00e3c
	.word	0xdda9c028
	.word	0x0b592cb8
	.word	0xcd7d2af4
	.word	0x28b4c123
	.word	0x55142610
	.word	0x3de31157
	.word	0xd2e89db9
	.word	0x779e691f
	.word	0xd4623dd4
	.word	0x10648275
	.word	0x43ee71de
	.word	0xc1809500
	.word	0x9a139b37
	.word	0x6b52b2e3
	.word	0xb00d5f3a
	.word	0xeba0dc20
	.word	0x6df190c5
	.word	0x72e5c713
	.word	0x984f4519
	.word	0x27a213db
	.word	0x21fb2a3b
t0_data_in_sp:
	.word	0xfab849a6
	.word	0xbd5ac53f
	.word	0x61f8e83e
	.word	0x392be925
	.word	0x3510d543
	.word	0x57d50b2d
	.word	0xc744cbfd
	.word	0x62df27c9
	.word	t0_data_in_area0
	.word	t0_data_in_area0
	.word	0xfffffffd
	.word	0xfffffffc
	.word	0xfffffffc
	.word	0xffffffe8
	.word	t0_data_in_fp
	.word	0x9f778864
	.word	0x4b445024
	.word	0x5ab605f1
	.word	0x05e47a8c
	.word	0x5199443f
	.word	0x3f24bc4c
	.word	0x29a9b710
	.word	0x8aa5e339
	.word	0x15cd534e
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
	.word   	0x76b4d1ff	! [%fp - 0xc]
	.word   	0x57511ca7	! [%fp - 0x8]
	.word   	0x70a6e9fe	! [%fp - 0x4]
.global t0_data_in_fp; t0_data_in_fp:
	.word	0x79f86378
	.word	0x38501a3f
	.word	0xeda42aa3
	.word	0xb1507603
	.word	0x6352593d
	.word	0xdbf48cb3
	.word	0xbc760243
	.word	0x4eb50645
	.word	0x7015bcb2
	.word	0xf6959251
	.word	0xf62ad0b6
	.word	0xea37d564
	.word	0x264a72c9
	.word	0x2b8fff59
	.word	0x959a7401
	.word	0x8061e6bb
	.word	0xbdac46d6
	.word	0x810f3884
	.word	0x907e0a26
	.word	0x7d5250b1
	.word	0x13b2084e
	.word	0x1482f77d
	.word	0x2f04ce82
	.word	0x9638584e
t0_data_in_stacktop:
	.word	0
t0_data_in_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_in_area0, 0x20964000)
.seg "data"
t0_data_in_area0_start:
.skip 3264
t0_data_in_area0_begin:
	.word	0xbdc240d1	! t0_data_in_area0-0x20
	.word	0x7a486290	! t0_data_in_area0-0x1c
	.word	0xa40ee976	! t0_data_in_area0-0x18
	.word	0x141b3211	! t0_data_in_area0-0x14
	.word	0xf2eec669	! t0_data_in_area0-0x10
	.word	0x96a06ba0	! t0_data_in_area0-0xc
	.word	0xe8531649	! t0_data_in_area0-0x8
	.word	0x9c1c7bff	! t0_data_in_area0-0x4
.global t0_data_in_area0; t0_data_in_area0:
	.word	0x6c60ae14	! t0_data_in_area0+0x0
	.word	0x3138aa5e	! t0_data_in_area0+0x4
	.word	0xbf9e434d	! t0_data_in_area0+0x8
	.word	0x6e9fc4ff	! t0_data_in_area0+0xc
	.word	0x6632627f	! t0_data_in_area0+0x10
	.word	0x372b25b8	! t0_data_in_area0+0x14
	.word	0xf0aa903f	! t0_data_in_area0+0x18
	.word	0x9292b565	! t0_data_in_area0+0x1c
t0_data_in_area0_end:
.skip 4864
t0_data_in_area0_stop:

KDATA_MODULE(t0_module_data_in_shm_area, 0x1f83c000)
.seg "data"
t0_data_in_shm_area_start:
t0_data_in_shm_area_begin:
.global t0_data_in_shm_area; t0_data_in_shm_area:
	.word	0xa20de314	! t0_data_in_shm_area+0x0 (t0)
	.word	0x94acc08e	! t0_data_in_shm_area+0x4 (t0)
	.word	0xf7fd4ef3	! t0_data_in_shm_area+0x8 (t0)
	.word	0x41b6accb	! t0_data_in_shm_area+0xc (t0)
	.word	0xfdc16f36	! t0_data_in_shm_area+0x10 (t0)
	.word	0xbee93dab	! t0_data_in_shm_area+0x14 (t0)
	.word	0xa311ea30	! t0_data_in_shm_area+0x18 (t0)
	.word	0x1785e927	! t0_data_in_shm_area+0x1c (t0)
	.word	0xaa5d21cb	! t0_data_in_shm_area+0x20 (t0)
	.word	0x9b070ef2	! t0_data_in_shm_area+0x24 (t0)
	.word	0xf511d6d8	! t0_data_in_shm_area+0x28 (t0)
	.word	0x3b5b8b1a	! t0_data_in_shm_area+0x2c (t0)
	.word	0xe89040fa	! t0_data_in_shm_area+0x30 (t0)
	.word	0x083c63d7	! t0_data_in_shm_area+0x34 (t0)
	.word	0xc7b7f34c	! t0_data_in_shm_area+0x38 (t0)
	.word	0xd1270b86	! t0_data_in_shm_area+0x3c (t0)
	.word	0xfd254635	! t0_data_in_shm_area+0x40 (t0 bload)
	.word	0x43822b11	! t0_data_in_shm_area+0x44
	.word	0xbbfff90e	! t0_data_in_shm_area+0x48
	.word	0x0f68f662	! t0_data_in_shm_area+0x4c
	.word	0xb0e7e279	! t0_data_in_shm_area+0x50
	.word	0xeb08fb8d	! t0_data_in_shm_area+0x54
	.word	0x1528e4a7	! t0_data_in_shm_area+0x58
	.word	0x26bffed0	! t0_data_in_shm_area+0x5c
	.word	0x823082d4	! t0_data_in_shm_area+0x60
	.word	0x115f18a5	! t0_data_in_shm_area+0x64
	.word	0xff9b77ca	! t0_data_in_shm_area+0x68
	.word	0xbc2ac06f	! t0_data_in_shm_area+0x6c
	.word	0xd8051928	! t0_data_in_shm_area+0x70
	.word	0x83760591	! t0_data_in_shm_area+0x74
	.word	0xeab439b9	! t0_data_in_shm_area+0x78
	.word	0xb493c1ee	! t0_data_in_shm_area+0x7c
	.word	0x2f772d2d	! t0_data_in_shm_area+0x80 (t0 bstore)
	.word	0xc4a95c1d	! t0_data_in_shm_area+0x84
	.word	0x028299e7	! t0_data_in_shm_area+0x88
	.word	0xeb828ce1	! t0_data_in_shm_area+0x8c
	.word	0xcfe379bb	! t0_data_in_shm_area+0x90
	.word	0xe7cfda9c	! t0_data_in_shm_area+0x94
	.word	0x638518de	! t0_data_in_shm_area+0x98
	.word	0xb125eed7	! t0_data_in_shm_area+0x9c
	.word	0x02379a49	! t0_data_in_shm_area+0xa0
	.word	0x1f7add1c	! t0_data_in_shm_area+0xa4
	.word	0x60849b62	! t0_data_in_shm_area+0xa8
	.word	0x7298b7ab	! t0_data_in_shm_area+0xac
	.word	0xc6a68cb0	! t0_data_in_shm_area+0xb0
	.word	0xe117b5da	! t0_data_in_shm_area+0xb4
	.word	0x902f4bd6	! t0_data_in_shm_area+0xb8
	.word	0x2b83891a	! t0_data_in_shm_area+0xbc
t0_data_in_shm_area_end:
t0_data_in_shm_area_stop:

KDATA_MODULE(t0_module_data_exp_regs, 0x199dc000)
.seg "data"
KGLOBAL(t0_data_exp_regs)
t0_data_exp_regs_start:
t0_data_exp_regs:
	.word	0x403f45d7          ! %f0
	.word	0xed8f849d          ! %f1
	.word	0x6a31c860          ! %f2
	.word	0x220562b5          ! %f3
	.word	0xab214891          ! %f4
	.word	0xb5c16272          ! %f5
	.word	0x14763ca8          ! %f6
	.word	0x5255509f          ! %f7
	.word	0x61c72a21          ! %f8
	.word	0xc32c0d86          ! %f9
	.word	0x69e6eac3          ! %f10
	.word	0x7c05f14c          ! %f11
	.word	0x3d3d395f          ! %f12
	.word	0xacc589c8          ! %f13
	.word	0x09440d17          ! %f14
	.word	0x100fc4f2          ! %f15
	.word	0x3e0edb39          ! %f16
	.word	0x8d41f368          ! %f17
	.word	0xc5c2eae2          ! %f18
	.word	0x3a6dc09d          ! %f19
	.word	0x76824b0d          ! %f20
	.word	0x92bfda9d          ! %f21
	.word	0x3e9302b6          ! %f22
	.word	0xc4e4999b          ! %f23
	.word	0xdf5f8c3a          ! %f24
	.word	0x60f817a2          ! %f25
	.word	0x9166e823          ! %f26
	.word	0x8c68e319          ! %f27
	.word	0x9e3c60f4          ! %f28
	.word	0xa2c85b00          ! %f29
	.word	0xc6c0c8b5          ! %f30
	.word	0x8616e20d          ! %f31
	.word	0xd9905a57          ! %f32
	.word	0x879ffe13          ! %f33
	.word	0xae4dcc20          ! %f34
	.word	0x72793b57          ! %f35
	.word	0x4f7155be          ! %f36
	.word	0xabcad7c6          ! %f37
	.word	0x1e9ac3b9          ! %f38
	.word	0xaa09e022          ! %f39
	.word	0xe109fb55          ! %f40
	.word	0xf80e19a0          ! %f41
	.word	0x511fdd28          ! %f42
	.word	0xa6aadc90          ! %f43
	.word	0x5be111ed          ! %f44
	.word	0x89c77904          ! %f45
	.word	0xb9484c5c          ! %f46
	.word	0xb98aec96          ! %f47
	.word	0x4421bc0f          ! %f48
	.word	0x60ff28b4          ! %f49
	.word	0xc5f620be          ! %f50
	.word	0x85c3fb23          ! %f51
	.word	0xdd81f253          ! %f52
	.word	0xd9e16696          ! %f53
	.word	0x7851b9a9          ! %f54
	.word	0x8c3fef87          ! %f55
	.word	0x5c65cef1          ! %f56
	.word	0x531ca1bb          ! %f57
	.word	0x53b78e18          ! %f58
	.word	0x27526d13          ! %f59
	.word	0x0bb37e98          ! %f60
	.word	0x8eed7c9c          ! %f61
	.word	0x888e3ba0          ! %f62
	.word	0x7a3c68fc          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0x5b4       ! %g1 (code pointer)
	.word	t0_data_exp_shm_area! %g2 (shared area pointer)
	.word	0xfb640fde          ! %g3 (loop index)
	.word	SYM(t0_subr3)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0x723b37cb          ! %o0
	.word	0x17663e6a          ! %o1
	.word	0x08115a77          ! %o2
	.word	0xf19cbe41          ! %o3
	.word	0x60910682          ! %o4
	.word	0x1a50c2d1          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0x66b4ea7e          ! %l0
	.word	0x99722fa6          ! %l1
	.word	0x39fa10a1          ! %l2
	.word	0xecb8ba84          ! %l3
	.word	0x16a16fb8          ! %l4
	.word	0x50730ff8          ! %l5
	.word	0xac0285b8          ! %l6
	.word	0x0aff095b          ! %l7
	.word	t0_data_exp_area0   ! %i0 (area pointer)
	.word	t0_data_exp_area0   ! %i1 (area pointer)
	.word	0x00000010          ! %i2 (byte offset)
	.word	0x0000000a          ! %i3 (halfword offset)
	.word	0xfffffff8          ! %i4 (word offset)
	.word	0x00000000          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0x2ffa4958          ! %y
	.word	0x00000000          ! %icc (nzvc)
	.word	0x80000d0b          ! %fsr
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

KDATA_MODULE(t0_module_data_exp_stack, 0x49c9c000)
.seg "data"
KGLOBAL(t0_data_exp_mtbl_size)
KGLOBAL(t0_data_exp_mtbl)
KGLOBAL(t0_data_exp_stack)
t0_data_exp_stack_start:
	.word	0xb618ec35
	.word	0xe7cc3d1e
	.word	0x46198209
	.word	0x0e6e5d44
	.word	0xe1fe02e6
	.word	0x5a89a34f
	.word	0xe842094b
	.word	0x474d11cf
	.word	0x6188aa69
	.word	0xf2e050aa
	.word	0xce70abd8
	.word	0x7da5ac68
	.word	0x1083a885
	.word	0x9920c075
	.word	0x1969b7b2
	.word	0x4174fb89
	.word	0xdf2a99f6
	.word	0xde11e596
	.word	0x93176399
	.word	0x651320e7
	.word	0x8894e0c9
	.word	0x46081c58
	.word	0x1d34d779
	.word	0x288e62d3
	.word	0x60b0a3e9
	.word	0x72d2f46e
	.word	0xe2bcc823
	.word	0x47972fe2
	.word	0xe035b3f8
	.word	0xbf2f1737
	.word	0x1af99a3f
	.word	0x57b638d0
	.word	0xf3216963
	.word	0x0579ce43
	.word	0x68804081
	.word	0x8cafc4a1
	.word	0x9dc9cfb0
	.word	0xeb37ee15
	.word	0x9d3e491b
	.word	0xd185a308
	.word	0x8ea7b219
	.word	0x6bda292a
	.word	0x3256ce72
	.word	0x4fbb610c
	.word	0xbcdc5d5e
	.word	0x0b450f3a
	.word	0x46113f14
	.word	0x0296a3e9
	.word	0x6e712ad7
	.word	0x24433cbd
	.word	0xded830e8
	.word	0xfb4fce34
	.word	0x6a9c28c8
	.word	0x046c7eb0
	.word	0x6775b3a6
	.word	0x13c55341
	.word	0xc53673f8
	.word	0xce74ee98
	.word	0x699dd689
	.word	0x29865cc8
	.word	0x7e461684
	.word	0x89834ac6
	.word	0xffaf5543
	.word	0xb12fa6c6
	.word	0x1c467ff0
	.word	0xf85e0edd
	.word	0x089da031
	.word	0xbc5fb5a0
	.word	0xbef7ea7e
	.word	0x32331091
	.word	0x0876b3d0
	.word	0x0935ca8e
	.word	0xcc2f41c3
	.word	0xe8b5a4b1
	.word	0xb02a736e
	.word	0xa3a13a36
	.word	0xfda55e76
	.word	0x788b9066
	.word	0x1f607b24
	.word	0x2cfd0997
	.word	0x075dab8b
	.word	0x81c14abc
	.word	0x1e849d03
	.word	0x4fcdf528
	.word	0x6729887f
	.word	0xca825262
	.word	0x4d017d8c
	.word	0xea374640
	.word	0xe04efcf5
	.word	0x8eda9bad
	.word	0xc3240365
	.word	0x641d1ab8
	.word	0x37ae9182
	.word	0x59125ae2
	.word	0x17998e4a
	.word	0xac3102ce
	.word	0x8e2d61c4
	.word	0xcf85aeb4
	.word	0x71262941
	.word	0xd390194c
	.word	0x25e5bbb9
	.word	0x12edef0b
	.word	0x1d4f2c11
	.word	0xf067f9e8
	.word	0xf3f1e04d
	.word	0xdb2aa406
	.word	0x8f89fff4
	.word	0x378a39ee
	.word	0x71c9b934
	.word	0x44f46943
	.word	0x2945fb8b
	.word	0x612c471c
	.word	0x176597fa
	.word	0x88c4415d
	.word	0x65238a11
	.word	0xd88bd0cc
	.word	0x7fe55257
	.word	0xaede1db6
	.word	0x161a11d3
	.word	0xb70e1f58
	.word	0xc69c4fc7
	.word	0xde159e75
	.word	0x31714ddf
	.word	0x93f2fdb9
	.word	0x4f585c5a
	.word	0x76d04ed2
	.word	0xd78a0efb
	.word	0x181a1971
	.word	0x23c254c8
	.word	0xaa38e190
	.word	0xfebd97d9
	.word	0x83e3fcab
	.word	0xe614ffc8
	.word	0x4acb31cb
	.word	0xb45a0888
	.word	0xca26069f
	.word	0x3057a8a1
	.word	0xd7990bf3
	.word	0x7d358d2c
	.word	0x10bb063b
	.word	0x040f4f00
	.word	0x2b240318
	.word	0x10b943f1
	.word	0xb3b05aff
	.word	0xba32800c
	.word	0x31a8d667
	.word	0xc1e00e3c
	.word	0xdda9c028
	.word	0x0b592cb8
	.word	0xcd7d2af4
	.word	0x28b4c123
	.word	0x55142610
	.word	0x3de31157
	.word	0xd2e89db9
	.word	0x779e691f
	.word	0xd4623dd4
	.word	0x10648275
	.word	0x43ee71de
	.word	0xc1809500
	.word	0x9a139b37
	.word	0x6b52b2e3
	.word	0xb00d5f3a
	.word	0xeba0dc20
	.word	0x6df190c5
	.word	0x72e5c713
	.word	0x984f4519
	.word	0x27a213db
	.word	0x21fb2a3b
t0_data_exp_sp:
	.word	0xfab849a6
	.word	0xbd5ac53f
	.word	0x61f8e83e
	.word	0x392be925
	.word	0x3510d543
	.word	0x57d50b2d
	.word	0xc744cbfd
	.word	0x62df27c9
	.word	t0_data_exp_area0
	.word	t0_data_exp_area0
	.word	0xfffffffd
	.word	0xfffffffc
	.word	0xfffffffc
	.word	0xffffffe8
	.word	t0_data_exp_fp
	.word	0x9f778864
	.word	0x4b445024
	.word	0x5ab605f1
	.word	0x05e47a8c
	.word	0x5199443f
	.word	0x3f24bc4c
	.word	0x29a9b710
	.word	0x8aa5e339
	.word	0x15cd534e
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
	.word   	0x76b4d1ff	! [%fp - 0xc]
	.word   	0x57511ca7	! [%fp - 0x8]
	.word   	0x70a6e9fe	! [%fp - 0x4]
t0_data_exp_fp:
	.word	0x79f86378
	.word	0x38501a3f
	.word	0xeda42aa3
	.word	0xb1507603
	.word	0x6352593d
	.word	0xdbf48cb3
	.word	0xbc760243
	.word	0x4eb50645
	.word	0x7015bcb2
	.word	0xf6959251
	.word	0xf62ad0b6
	.word	0xea37d564
	.word	0x264a72c9
	.word	0x2b8fff59
	.word	0x959a7401
	.word	0x8061e6bb
	.word	0xbdac46d6
	.word	0x810f3884
	.word	0x907e0a26
	.word	0x7d5250b1
	.word	0x13b2084e
	.word	0x1482f77d
	.word	0x2f04ce82
	.word	0x9638584e
t0_data_exp_stacktop:
	.word	0
t0_data_exp_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_exp_area0, 0x7ca94000)
.seg "data"
t0_data_exp_area0_start:
.skip 3264
t0_data_exp_area0_begin:
	.word	0xbdc240d1	! t0_data_exp_area0-0x20
	.word	0x7a486290	! t0_data_exp_area0-0x1c
	.word	0xa40ee976	! t0_data_exp_area0-0x18
	.word	0x141b3211	! t0_data_exp_area0-0x14
	.word	0xf2eec669	! t0_data_exp_area0-0x10
	.word	0x96a06ba0	! t0_data_exp_area0-0xc
	.word	0xe8531649	! t0_data_exp_area0-0x8
	.word	0x9c1c7bff	! t0_data_exp_area0-0x4
.global t0_data_exp_area0; t0_data_exp_area0:
	.word	0x6c60ae14	! t0_data_exp_area0+0x0
	.word	0x3138aa5e	! t0_data_exp_area0+0x4
	.word	0xbf9e434d	! t0_data_exp_area0+0x8
	.word	0x6e9fc4ff	! t0_data_exp_area0+0xc
	.word	0x6632627f	! t0_data_exp_area0+0x10
	.word	0x372b25b8	! t0_data_exp_area0+0x14
	.word	0xf0aa903f	! t0_data_exp_area0+0x18
	.word	0x9292b565	! t0_data_exp_area0+0x1c
t0_data_exp_area0_end:
.skip 4864
t0_data_exp_area0_stop:

KDATA_MODULE(t0_module_data_exp_shm_area, 0x47e20000)
.seg "data"
t0_data_exp_shm_area_start:
t0_data_exp_shm_area_begin:
.global t0_data_exp_shm_area; t0_data_exp_shm_area:
	.word	0xa20de314	! t0_data_exp_shm_area+0x0 (t0)
	.word	0x94acc08e	! t0_data_exp_shm_area+0x4 (t0)
	.word	0xf7fd4ef3	! t0_data_exp_shm_area+0x8 (t0)
	.word	0x41b6accb	! t0_data_exp_shm_area+0xc (t0)
	.word	0xfdc16f36	! t0_data_exp_shm_area+0x10 (t0)
	.word	0xbee93dab	! t0_data_exp_shm_area+0x14 (t0)
	.word	0xa311ea30	! t0_data_exp_shm_area+0x18 (t0)
	.word	0x1785e927	! t0_data_exp_shm_area+0x1c (t0)
	.word	0xaa5d21cb	! t0_data_exp_shm_area+0x20 (t0)
	.word	0x9b070ef2	! t0_data_exp_shm_area+0x24 (t0)
	.word	0xf511d6d8	! t0_data_exp_shm_area+0x28 (t0)
	.word	0x3b5b8b1a	! t0_data_exp_shm_area+0x2c (t0)
	.word	0xe89040fa	! t0_data_exp_shm_area+0x30 (t0)
	.word	0x083c63d7	! t0_data_exp_shm_area+0x34 (t0)
	.word	0xc7b7f34c	! t0_data_exp_shm_area+0x38 (t0)
	.word	0xd1270b86	! t0_data_exp_shm_area+0x3c (t0)
	.word	0xfd254635	! t0_data_exp_shm_area+0x40 (t0 bload)
	.word	0x43822b11	! t0_data_exp_shm_area+0x44
	.word	0xbbfff90e	! t0_data_exp_shm_area+0x48
	.word	0x0f68f662	! t0_data_exp_shm_area+0x4c
	.word	0xb0e7e279	! t0_data_exp_shm_area+0x50
	.word	0xeb08fb8d	! t0_data_exp_shm_area+0x54
	.word	0x1528e4a7	! t0_data_exp_shm_area+0x58
	.word	0x26bffed0	! t0_data_exp_shm_area+0x5c
	.word	0x823082d4	! t0_data_exp_shm_area+0x60
	.word	0x115f18a5	! t0_data_exp_shm_area+0x64
	.word	0xff9b77ca	! t0_data_exp_shm_area+0x68
	.word	0xbc2ac06f	! t0_data_exp_shm_area+0x6c
	.word	0xd8051928	! t0_data_exp_shm_area+0x70
	.word	0x83760591	! t0_data_exp_shm_area+0x74
	.word	0xeab439b9	! t0_data_exp_shm_area+0x78
	.word	0xb493c1ee	! t0_data_exp_shm_area+0x7c
	.word	0x2f772d2d	! t0_data_exp_shm_area+0x80 (t0 bstore)
	.word	0xc4a95c1d	! t0_data_exp_shm_area+0x84
	.word	0x028299e7	! t0_data_exp_shm_area+0x88
	.word	0xeb828ce1	! t0_data_exp_shm_area+0x8c
	.word	0xcfe379bb	! t0_data_exp_shm_area+0x90
	.word	0xe7cfda9c	! t0_data_exp_shm_area+0x94
	.word	0x638518de	! t0_data_exp_shm_area+0x98
	.word	0xb125eed7	! t0_data_exp_shm_area+0x9c
	.word	0x02379a49	! t0_data_exp_shm_area+0xa0
	.word	0x1f7add1c	! t0_data_exp_shm_area+0xa4
	.word	0x60849b62	! t0_data_exp_shm_area+0xa8
	.word	0x7298b7ab	! t0_data_exp_shm_area+0xac
	.word	0xc6a68cb0	! t0_data_exp_shm_area+0xb0
	.word	0xe117b5da	! t0_data_exp_shm_area+0xb4
	.word	0x902f4bd6	! t0_data_exp_shm_area+0xb8
	.word	0x2b83891a	! t0_data_exp_shm_area+0xbc
t0_data_exp_shm_area_end:
t0_data_exp_shm_area_stop:


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
#include "enable_file.h"
	
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
/* start ktbl.0.h */
#define T0_KAOS_NIAGARA
#define T0_KAOS_VERSION       4.2
#define T0_KAOS_SEED          d2744952f8e1
#define T0_KAOS_ICOUNT        2000
#define T0_KAOS_AREAS         1
#define T0_KAOS_AREASIZE      64
#define T0_KAOS_AREAOFFSET    3264
#define T0_KAOS_PAGESIZE      8192
#define T0_KAOS_CODECOUNT     2001

#define T0_KAOS_BOOT_VA                  0x15996000
#define T0_KAOS_BOOT_PA                  0x0000000000c44000
#define T0_KAOS_BOOT_CACHEABLE           1
#define T0_KAOS_BOOT_NONCACHEABLE        0

#define T0_KAOS_STARTUP_VA               0x3dd80000
#define T0_KAOS_STARTUP_PA               0x0000000003ac2000
#define T0_KAOS_STARTUP_CACHEABLE        1
#define T0_KAOS_STARTUP_NONCACHEABLE     0

#define T0_KAOS_OFFSET_TBL_VA            0x3a910000
#define T0_KAOS_OFFSET_TBL_PA            0x0000000005122000
#define T0_KAOS_OFFSET_TBL_CACHEABLE     1
#define T0_KAOS_OFFSET_TBL_NONCACHEABLE  0

#define T0_KAOS_DONE_VA                  0x38774000
#define T0_KAOS_DONE_PA                  0x0000000007faa000
#define T0_KAOS_DONE_CACHEABLE           1
#define T0_KAOS_DONE_NONCACHEABLE        0

#define T0_KAOS_KTBL_VA                  0x69e2c000
#define T0_KAOS_KTBL_PA                  0x00000000092e6000
#define T0_KAOS_KTBL_CACHEABLE           1
#define T0_KAOS_KTBL_NONCACHEABLE        0

#define T0_KAOS_SUBR0_VA                 0x27c3a000
#define T0_KAOS_SUBR0_PA                 0x000000000b9c4000
#define T0_KAOS_SUBR0_CACHEABLE          1
#define T0_KAOS_SUBR0_NONCACHEABLE       0
#define T0_KAOS_SUBR1_VA                 0x5e91e000
#define T0_KAOS_SUBR1_PA                 0x000000000d466000
#define T0_KAOS_SUBR1_CACHEABLE          1
#define T0_KAOS_SUBR1_NONCACHEABLE       0
#define T0_KAOS_SUBR2_VA                 0x69dfa000
#define T0_KAOS_SUBR2_PA                 0x000000000f99a000
#define T0_KAOS_SUBR2_CACHEABLE          1
#define T0_KAOS_SUBR2_NONCACHEABLE       0
#define T0_KAOS_SUBR3_VA                 0x69e80000
#define T0_KAOS_SUBR3_PA                 0x00000000103ea000
#define T0_KAOS_SUBR3_CACHEABLE          1
#define T0_KAOS_SUBR3_NONCACHEABLE       0

#define T0_KAOS_EXP_REGS_VA              0x199dc000
#define T0_KAOS_EXP_REGS_PA              0x00000000123f4000
#define T0_KAOS_EXP_REGS_CACHEABLE       1
#define T0_KAOS_EXP_REGS_NONCACHEABLE    0
#define T0_KAOS_RUN_REGS_VA              0x19eac000
#define T0_KAOS_RUN_REGS_PA              0x000000001499e000
#define T0_KAOS_RUN_REGS_CACHEABLE       1
#define T0_KAOS_RUN_REGS_NONCACHEABLE    0

#define T0_KAOS_EXP_STACK_VA             0x49c9c000
#define T0_KAOS_EXP_STACK_PA             0x0000000016992000
#define T0_KAOS_EXP_STACK_CACHEABLE      1
#define T0_KAOS_EXP_STACK_NONCACHEABLE   0
#define T0_KAOS_RUN_STACK_VA             0x516ea000
#define T0_KAOS_RUN_STACK_PA             0x0000000018c58000
#define T0_KAOS_RUN_STACK_CACHEABLE      1
#define T0_KAOS_RUN_STACK_NONCACHEABLE   0

#define T0_KAOS_AREA0
#define T0_KAOS_EXP_AREA0_VA             0x7ca94000
#define T0_KAOS_EXP_AREA0_PA             0x000000001bce8000
#define T0_KAOS_EXP_AREA0_CACHEABLE      1
#define T0_KAOS_EXP_AREA0_NONCACHEABLE   0
#define T0_KAOS_RUN_AREA0_VA             0x20964000
#define T0_KAOS_RUN_AREA0_PA             0x000000001d5e4000
#define T0_KAOS_RUN_AREA0_CACHEABLE      1
#define T0_KAOS_RUN_AREA0_NONCACHEABLE   0

#define T0_KAOS_SHM_AREA
#define T0_KAOS_EXP_SHM_AREA_VA          0x47e20000
#define T0_KAOS_EXP_SHM_AREA_PA          0x0000000000df6000
#define T0_KAOS_EXP_SHM_AREA_CACHEABLE   1
#define T0_KAOS_EXP_SHM_AREA_NONCACHEABLE 0
#define T0_KAOS_RUN_SHM_AREA_VA          0x1f83c000
#define T0_KAOS_RUN_SHM_AREA_PA          0x0000000001e98000
#define T0_KAOS_RUN_SHM_AREA_CACHEABLE   1
#define T0_KAOS_RUN_SHM_AREA_NONCACHEABLE 0

#define T0_KAOS_RANVAL_00     0x4b7d0b35
#define T0_KAOS_RANVAL_01     0xb9e998f8
#define T0_KAOS_RANVAL_02     0x6735addf
#define T0_KAOS_RANVAL_03     0x77538b96
#define T0_KAOS_RANVAL_04     0xf35302c5
#define T0_KAOS_RANVAL_05     0x610a0f6d
#define T0_KAOS_RANVAL_06     0xdab2c846
#define T0_KAOS_RANVAL_07     0xa3671c59
#define T0_KAOS_RANVAL_08     0x08e7a982
#define T0_KAOS_RANVAL_09     0x4209253c
#define T0_KAOS_RANVAL_0a     0xffd28922
#define T0_KAOS_RANVAL_0b     0xb00ec8bc
#define T0_KAOS_RANVAL_0c     0x97c9f97e
#define T0_KAOS_RANVAL_0d     0x3fa5c6e8
#define T0_KAOS_RANVAL_0e     0x5737c836
#define T0_KAOS_RANVAL_0f     0xfd522ac8
#define T0_KAOS_RANVAL_10     0x8ac793c5
#define T0_KAOS_RANVAL_11     0x08aa0226
#define T0_KAOS_RANVAL_12     0x8ed58b97
#define T0_KAOS_RANVAL_13     0x874d7b0d
#define T0_KAOS_RANVAL_14     0xb8384fa1
#define T0_KAOS_RANVAL_15     0x417e1dd4
#define T0_KAOS_RANVAL_16     0x0a057292
#define T0_KAOS_RANVAL_17     0x3df5ebb2
#define T0_KAOS_RANVAL_18     0xf8dcfa18
#define T0_KAOS_RANVAL_19     0x66c0bd29
#define T0_KAOS_RANVAL_1a     0x97df6acc
#define T0_KAOS_RANVAL_1b     0xaa6020cd
#define T0_KAOS_RANVAL_1c     0x9c6c09b9
#define T0_KAOS_RANVAL_1d     0x8761822e
#define T0_KAOS_RANVAL_1e     0xf97513a9
#define T0_KAOS_RANVAL_1f     0xc98559f4
#define T0_KAOS_RANVAL_20     0x5f4f4a97
#define T0_KAOS_RANVAL_21     0x5a9ee36d
#define T0_KAOS_RANVAL_22     0x66d573f1
#define T0_KAOS_RANVAL_23     0xaf392114
#define T0_KAOS_RANVAL_24     0x8bc1c696
#define T0_KAOS_RANVAL_25     0x4f1f28e7
#define T0_KAOS_RANVAL_26     0x38e3e5b1
#define T0_KAOS_RANVAL_27     0x1cca9280
#define T0_KAOS_RANVAL_28     0xcdad6de5
#define T0_KAOS_RANVAL_29     0xb767c44a
#define T0_KAOS_RANVAL_2a     0x79575c5f
#define T0_KAOS_RANVAL_2b     0x0ae9924d
#define T0_KAOS_RANVAL_2c     0xd89c43ca
#define T0_KAOS_RANVAL_2d     0x5c757863
#define T0_KAOS_RANVAL_2e     0xf7e56941
#define T0_KAOS_RANVAL_2f     0x171982dc
#define T0_KAOS_RANVAL_30     0xba0913a4
#define T0_KAOS_RANVAL_31     0x646b03d1
#define T0_KAOS_RANVAL_32     0xe5eea20e
#define T0_KAOS_RANVAL_33     0x878050b7
#define T0_KAOS_RANVAL_34     0x3c97f22e
#define T0_KAOS_RANVAL_35     0x787342fb
#define T0_KAOS_RANVAL_36     0x07384dd4
#define T0_KAOS_RANVAL_37     0xf579e7a1
#define T0_KAOS_RANVAL_38     0x4a7f0f00
#define T0_KAOS_RANVAL_39     0x754efd43
#define T0_KAOS_RANVAL_3a     0x88997c1d
#define T0_KAOS_RANVAL_3b     0xc54564e7
#define T0_KAOS_RANVAL_3c     0xbaec9a5b
#define T0_KAOS_RANVAL_3d     0x34d5d17b
#define T0_KAOS_RANVAL_3e     0x333fea4d
#define T0_KAOS_RANVAL_3f     0x10a29afc
#define T0_KAOS_RANVAL_40     0x5fbec325
#define T0_KAOS_RANVAL_41     0x5734f597
#define T0_KAOS_RANVAL_42     0x4e935b4e
#define T0_KAOS_RANVAL_43     0x188bba44
#define T0_KAOS_RANVAL_44     0xbaaf1132
#define T0_KAOS_RANVAL_45     0x882dbda4
#define T0_KAOS_RANVAL_46     0x4a04456e
#define T0_KAOS_RANVAL_47     0x48a0332f
#define T0_KAOS_RANVAL_48     0x3b629fc4
#define T0_KAOS_RANVAL_49     0xea411df8
#define T0_KAOS_RANVAL_4a     0x957cfa87
#define T0_KAOS_RANVAL_4b     0x4293258a
#define T0_KAOS_RANVAL_4c     0xcee4fc55
#define T0_KAOS_RANVAL_4d     0xe6d49cab
#define T0_KAOS_RANVAL_4e     0xa0faae5f
#define T0_KAOS_RANVAL_4f     0xca40f111
#define T0_KAOS_RANVAL_50     0x652bad93
#define T0_KAOS_RANVAL_51     0x22306645
#define T0_KAOS_RANVAL_52     0x3445ff52
#define T0_KAOS_RANVAL_53     0x1934bb48
#define T0_KAOS_RANVAL_54     0xae9ca6ab
#define T0_KAOS_RANVAL_55     0x33fd79b8
#define T0_KAOS_RANVAL_56     0x7518e52e
#define T0_KAOS_RANVAL_57     0x839ffe8a
#define T0_KAOS_RANVAL_58     0x02722aca
#define T0_KAOS_RANVAL_59     0xb3e61f90
#define T0_KAOS_RANVAL_5a     0x6e7a2a5d
#define T0_KAOS_RANVAL_5b     0x2e537662
#define T0_KAOS_RANVAL_5c     0x337ae4e0
#define T0_KAOS_RANVAL_5d     0x456a2068
#define T0_KAOS_RANVAL_5e     0x8df4d349
#define T0_KAOS_RANVAL_5f     0x2e69fd19
#define T0_KAOS_RANVAL_60     0x2b5d37a6
#define T0_KAOS_RANVAL_61     0x691b6ea0
#define T0_KAOS_RANVAL_62     0xc4d417fb
#define T0_KAOS_RANVAL_63     0xed4b2e8f
#define T0_KAOS_RANVAL_64     0xd17109e2
#define T0_KAOS_RANVAL_65     0xbb8f374c
#define T0_KAOS_RANVAL_66     0x22f2d405
#define T0_KAOS_RANVAL_67     0x4fb4e44e
#define T0_KAOS_RANVAL_68     0xe9b392e9
#define T0_KAOS_RANVAL_69     0xee9a8e6f
#define T0_KAOS_RANVAL_6a     0x503790a2
#define T0_KAOS_RANVAL_6b     0x71d7dedb
#define T0_KAOS_RANVAL_6c     0xde8ceb65
#define T0_KAOS_RANVAL_6d     0x9f312a68
#define T0_KAOS_RANVAL_6e     0x1fc48d1b
#define T0_KAOS_RANVAL_6f     0xee85304f
#define T0_KAOS_RANVAL_70     0x75576658
#define T0_KAOS_RANVAL_71     0x54afe2ab
#define T0_KAOS_RANVAL_72     0x1675696b
#define T0_KAOS_RANVAL_73     0x912f3c27
#define T0_KAOS_RANVAL_74     0x2e14f660
#define T0_KAOS_RANVAL_75     0x8cc3e5b4
#define T0_KAOS_RANVAL_76     0x8bba5725
#define T0_KAOS_RANVAL_77     0x0b5a6057
#define T0_KAOS_RANVAL_78     0xf2bf233c
#define T0_KAOS_RANVAL_79     0x04bada39
#define T0_KAOS_RANVAL_7a     0x927af495
#define T0_KAOS_RANVAL_7b     0x2b469ba4
#define T0_KAOS_RANVAL_7c     0xf662538e
#define T0_KAOS_RANVAL_7d     0x35175f9f
#define T0_KAOS_RANVAL_7e     0x05a93626
#define T0_KAOS_RANVAL_7f     0x145cc533
/* end ktbl.0.h */


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

#define H_T0_Trap_Instruction_2
#define SUN_H_T0_Trap_Instruction_2  \
                        tcc     T_TRAP_INST1; \
                        wr      %g0, ASI_PRIMARY, %asi; \
			set     T0_KAOS_RUN_REGS_PA, %g7; \
                        lda     [%g7+KDATA_ETRAP_SIGSEGV_OFF]%asi, %g6 ; \
                        inc     %g6 ; \
                        sta     %g6, [%g7+KDATA_ETRAP_SIGSEGV_OFF]%asi ; \
                        done; \
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
#define NOHWTW
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
!    icount         2000
!    targetid       NIAGARA:SIM
!    hostid         NIAGARA:5.8
!    areas          1
!    areasize       64
!    areaoffset     3264
!    ncache         0
!    emulate_ncache 1
!    pagesize       8192
!    invsize        0
!    codecount      2001
!    code           69e2c000
!    entry          69e2c000
!    fsr_exceptions 00000000
!    fsr_roundmode  00000004
!    fsr_mask       c0000fff
!    seed           d2744952f8e1
!    va_map         0000000000400000,000000007fffffff
!    pa_cached      0000000000400000,000000007fffffff
!    pa_noncached   000001ff00000000,000001ff7fffffff
!    weights        /import/n2-aus-localdir1/ntran/n2cdmspp/verif/diag/assembly/kaos/weights_files/allv9.w
!    begcount       0
!    endcount       2000
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

KTEXT_MODULE(t0_module_ktbl, 0x69e2c000)
.seg "text"
	KGLOBAL(t0_ktbl)
t0_ktbl_page_begin:
.global t0_kref; t0_kref:
	.skip 0
t0_ktbl:
	.word	0x9fc00004	! t0_kref+0x0:   	call	%g0 + %g4
	.word	0xd2367fe8	! t0_kref+0x4:   	sth	%o1, [%i1 - 0x18]
	.word	0xe640a018	! t0_kref+0x8:   	ldsw	[%g2 + 0x18], %l3
	.word	0xe93e2018	! t0_kref+0xc:   	std	%f20, [%i0 + 0x18]
	.word	0xf53e3fe8	! t0_kref+0x10:   	std	%f26, [%i0 - 0x18]
	.word	0xe636401b	! t0_kref+0x14:   	sth	%l3, [%i1 + %i3]
	.word	0x3e800003	! t0_kref+0x18:   	bvc,a	_kref+0x24
	.word	0x9264ea05	! t0_kref+0x1c:   	subc	%l3, 0xa05, %o1
	.word	0x38480003	! t0_kref+0x20:   	bgu,a,pt	%icc, _kref+0x2c
	.word	0xd448a02e	! t0_kref+0x24:   	ldsb	[%g2 + 0x2e], %o2
	.word	0xc0780018	! t0_kref+0x28:   	swap	[%g0 + %i0], %g0
	.word	0xa4dd7d1e	! t0_kref+0x2c:   	smulcc	%l5, -0x2e2, %l2
	.word	0xd2580018	! t0_kref+0x30:   	ldx	[%g0 + %i0], %o1
	.word	0xee50a014	! t0_kref+0x34:   	ldsh	[%g2 + 0x14], %l7
	.word	0xde167fe6	! t0_kref+0x38:   	lduh	[%i1 - 0x1a], %o7
	.word	0xa6da777c	! t0_kref+0x3c:   	smulcc	%o1, -0x884, %l3
	.word	0x99a58d26	! t0_kref+0x40:   	fsmuld	%f22, %f6, %f12
	.word	0x81ae8ab6	! t0_kref+0x44:   	fcmpes	%fcc0, %f26, %f22
	.word	0xa645bb4e	! t0_kref+0x48:   	addc	%l6, -0x4b2, %l3
	.word	0xd41e001d	! t0_kref+0x4c:   	ldd	[%i0 + %i5], %o2
	.word	0x2b800007	! t0_kref+0x50:   	fbug,a	_kref+0x6c
	.word	0xee30a030	! t0_kref+0x54:   	sth	%l7, [%g2 + 0x30]
	.word	0xb1a00154	! t0_kref+0x58:   	fabsd	%f20, %f24
	.word	0xe9ee501b	! t0_kref+0x5c:   	prefetcha	%i1 + %i3, 20
	.word	0x9494b6da	! t0_kref+0x60:   	orcc	%l2, -0x926, %o2
	.word	0x9eb339cf	! t0_kref+0x64:   	orncc	%o4, -0x631, %o7
	.word	0xd09e101d	! t0_kref+0x68:   	ldda	[%i0 + %i5]0x80, %o0
	.word	0x9fa149a1	! t0_kref+0x6c:   	fdivs	%f5, %f1, %f15
	.word	0xde40a028	! t0_kref+0x70:   	ldsw	[%g2 + 0x28], %o7
	.word	0x81aa0aa6	! t0_kref+0x74:   	fcmpes	%fcc0, %f8, %f6
	.word	0xa6d4c015	! t0_kref+0x78:   	umulcc	%l3, %l5, %l3
	.word	0xc398a040	! t0_kref+0x7c:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0x99a01939	! t0_kref+0x80:   	fstod	%f25, %f12
	.word	0xe2564000	! t0_kref+0x84:   	ldsh	[%i1], %l1
	.word	0xa53c8012	! t0_kref+0x88:   	sra	%l2, %l2, %l2
	.word	0xd430a018	! t0_kref+0x8c:   	sth	%o2, [%g2 + 0x18]
	.word	0x9653401a	! t0_kref+0x90:   	umul	%o5, %i2, %o3
	.word	0x2a480006	! t0_kref+0x94:   	bcs,a,pt	%icc, _kref+0xac
	.word	0xec362014	! t0_kref+0x98:   	sth	%l6, [%i0 + 0x14]
	.word	0x2c480001	! t0_kref+0x9c:   	bneg,a,pt	%icc, _kref+0xa0
	.word	0x95a54834	! t0_kref+0xa0:   	fadds	%f21, %f20, %f10
	.word	0xd208a02c	! t0_kref+0xa4:   	ldub	[%g2 + 0x2c], %o1
	.word	0xde4e2004	! t0_kref+0xa8:   	ldsb	[%i0 + 4], %o7
	.word	0xf186501c	! t0_kref+0xac:   	lda	[%i1 + %i4]0x80, %f24
	.word	0xb5a00123	! t0_kref+0xb0:   	fabss	%f3, %f26
	.word	0xdb871019	! t0_kref+0xb4:   	lda	[%i4 + %i1]0x80, %f13
	.word	0x81ab0ad2	! t0_kref+0xb8:   	fcmped	%fcc0, %f12, %f18
	call	SYM(t0_subr0)
	.word	0x98d50012	! t0_kref+0xc0:   	umulcc	%l4, %l2, %o4
	.word	0xb5a01a2d	! t0_kref+0xc4:   	fstoi	%f13, %f26
	.word	0xa2d33929	! t0_kref+0xc8:   	umulcc	%o4, -0x6d7, %l1
	.word	0xaedb400a	! t0_kref+0xcc:   	smulcc	%o5, %o2, %l7
	.word	0x87802080	! t0_kref+0xd0:   	mov	0x80, %asi
	.word	0xa092e22e	! t0_kref+0xd4:   	orcc	%o3, 0x22e, %l0
	.word	0xe4563ff6	! t0_kref+0xd8:   	ldsh	[%i0 - 0xa], %l2
	.word	0xd2863ff8	! t0_kref+0xdc:   	lda	[%i0 - 8]%asi, %o1
	.word	0x85a10934	! t0_kref+0xe0:   	fmuls	%f4, %f20, %f2
	.word	0xd428a033	! t0_kref+0xe4:   	stb	%o2, [%g2 + 0x33]
	.word	0x991eb2df	! t0_kref+0xe8:   	tsubcctv	%i2, -0xd21, %o4
	.word	0xe836c019	! t0_kref+0xec:   	sth	%l4, [%i3 + %i1]
	.word	0xa2c6b1a3	! t0_kref+0xf0:   	addccc	%i2, -0xe5d, %l1
	.word	0xa5a0012c	! t0_kref+0xf4:   	fabss	%f12, %f18
	.word	0xd41f4019	! t0_kref+0xf8:   	ldd	[%i5 + %i1], %o2
	.word	0xa1a00123	! t0_kref+0xfc:   	fabss	%f3, %f16
	.word	0x81a01928	! t0_kref+0x100:   	fstod	%f8, %f0
	.word	0x93a08826	! t0_kref+0x104:   	fadds	%f2, %f6, %f9
	.word	0xc36e6000	! t0_kref+0x108:   	prefetch	%i1, 1
	.word	0x8da24d20	! t0_kref+0x10c:   	fsmuld	%f9, %f0, %f6
	.word	0xac95add5	! t0_kref+0x110:   	orcc	%l6, 0xdd5, %l6
	.word	0xa532e013	! t0_kref+0x114:   	srl	%o3, 0x13, %l2
	.word	0x9246800a	! t0_kref+0x118:   	addc	%i2, %o2, %o1
	.word	0x9115fb8c	! t0_kref+0x11c:   	taddcctv	%l7, -0x474, %o0
	.word	0x98f32182	! t0_kref+0x120:   	udivcc	%o4, 0x182, %o4
	.word	0x89a40837	! t0_kref+0x124:   	fadds	%f16, %f23, %f4
	.word	0x8143e040	! t0_kref+0x128:   	membar	0x40
	.word	0xa73de004	! t0_kref+0x12c:   	sra	%l7, 0x4, %l3
	.word	0xf7ee101b	! t0_kref+0x130:   	prefetcha	%i0 + %i3, 27
	.word	0xb1a24d26	! t0_kref+0x134:   	fsmuld	%f9, %f6, %f24
	.word	0xd4a0a030	! t0_kref+0x138:   	sta	%o2, [%g2 + 0x30]%asi
	.word	0xada2c936	! t0_kref+0x13c:   	fmuls	%f11, %f22, %f22
	.word	0xad0cc01a	! t0_kref+0x140:   	tsubcc	%l3, %i2, %l6
	.word	0xac8d4013	! t0_kref+0x144:   	andcc	%l5, %l3, %l6
	.word	0xda362018	! t0_kref+0x148:   	sth	%o5, [%i0 + 0x18]
	.word	0xd1be1856	! t0_kref+0x14c:   	stda	%f8, [%i0 + %l6]0xc2
	.word	0x9ba1c8a5	! t0_kref+0x150:   	fsubs	%f7, %f5, %f13
	.word	0xa495a471	! t0_kref+0x154:   	orcc	%l6, 0x471, %l2
	.word	0x9fc10000	! t0_kref+0x158:   	call	%g4
	.word	0x89a01926	! t0_kref+0x15c:   	fstod	%f6, %f4
	.word	0x9126b358	! t0_kref+0x160:   	mulscc	%i2, -0xca8, %o0
	.word	0xaed26d37	! t0_kref+0x164:   	umulcc	%o1, 0xd37, %l7
	.word	0xedee101c	! t0_kref+0x168:   	prefetcha	%i0 + %i4, 22
	.word	0x9e0d8017	! t0_kref+0x16c:   	and	%l6, %l7, %o7
	.word	0xe0470018	! t0_kref+0x170:   	ldsw	[%i4 + %i0], %l0
	.word	0x9206b46e	! t0_kref+0x174:   	add	%i2, -0xb92, %o1
	.word	0xec48a01e	! t0_kref+0x178:   	ldsb	[%g2 + 0x1e], %l6
	.word	0xd11fbe90	! t0_kref+0x17c:   	ldd	[%fp - 0x170], %f8
	.word	0xd0ce3fe9	! t0_kref+0x180:   	ldsba	[%i0 - 0x17]%asi, %o0
	.word	0xd44e3ff9	! t0_kref+0x184:   	ldsb	[%i0 - 7], %o2
	.word	0xe27e3fe0	! t0_kref+0x188:   	swap	[%i0 - 0x20], %l1
	.word	0x3d800005	! t0_kref+0x18c:   	fbule,a	_kref+0x1a0
	.word	0x95a68921	! t0_kref+0x190:   	fmuls	%f26, %f1, %f10
	.word	0xa015ba5c	! t0_kref+0x194:   	or	%l6, -0x5a4, %l0
	.word	0x9a54800b	! t0_kref+0x198:   	umul	%l2, %o3, %o5
	.word	0xe4300018	! t0_kref+0x19c:   	sth	%l2, [%g0 + %i0]
	.word	0xae8de971	! t0_kref+0x1a0:   	andcc	%l7, 0x971, %l7
	.word	0xa0d32c05	! t0_kref+0x1a4:   	umulcc	%o4, 0xc05, %l0
	.word	0x2c480004	! t0_kref+0x1a8:   	bneg,a,pt	%icc, _kref+0x1b8
	.word	0x81868000	! t0_kref+0x1ac:   	wr	%i2, %g0, %y
	.word	0xa68377bc	! t0_kref+0x1b0:   	addcc	%o5, -0x844, %l3
	.word	0x9fc10000	! t0_kref+0x1b4:   	call	%g4
	.word	0xee30a03e	! t0_kref+0x1b8:   	sth	%l7, [%g2 + 0x3e]
	.word	0xf1ee501b	! t0_kref+0x1bc:   	prefetcha	%i1 + %i3, 24
	.word	0xa5a40d33	! t0_kref+0x1c0:   	fsmuld	%f16, %f19, %f18
	.word	0x925d4009	! t0_kref+0x1c4:   	smul	%l5, %o1, %o1
	.word	0xeb20a014	! t0_kref+0x1c8:   	st	%f21, [%g2 + 0x14]
	.word	0xf13e001d	! t0_kref+0x1cc:   	std	%f24, [%i0 + %i5]
	.word	0x81dd800f	! t0_kref+0x1d0:   	flush	%l6 + %o7
	.word	0xa32d000d	! t0_kref+0x1d4:   	sll	%l4, %o5, %l1
	.word	0xf207bfe0	! t0_kref+0x1d8:   	ld	[%fp - 0x20], %i1
	.word	0x9a54f335	! t0_kref+0x1dc:   	umul	%l3, -0xccb, %o5
	.word	0x8185c000	! t0_kref+0x1e0:   	wr	%l7, %g0, %y
	.word	0xdd180019	! t0_kref+0x1e4:   	ldd	[%g0 + %i1], %f14
	.word	0xe1ee101d	! t0_kref+0x1e8:   	prefetcha	%i0 + %i5, 16
	.word	0x9865b43c	! t0_kref+0x1ec:   	subc	%l6, -0xbc4, %o4
	.word	0xcda0a000	! t0_kref+0x1f0:   	sta	%f6, [%g2]%asi
	.word	0x81a98a40	! t0_kref+0x1f4:   	fcmpd	%fcc0, %f6, %f0
	.word	0xa10d000d	! t0_kref+0x1f8:   	tsubcc	%l4, %o5, %l0
	.word	0xe0062000	! t0_kref+0x1fc:   	ld	[%i0], %l0
	.word	0x95a44d2b	! t0_kref+0x200:   	fsmuld	%f17, %f11, %f10
	.word	0x91400000	! t0_kref+0x204:   	mov	%y, %o0
	.word	0x23480006	! t0_kref+0x208:   	fbne,a,pt	%fcc0, _kref+0x220
	.word	0xed20a020	! t0_kref+0x20c:   	st	%f22, [%g2 + 0x20]
	.word	0xada00125	! t0_kref+0x210:   	fabss	%f5, %f22
	.word	0xa03b24b1	! t0_kref+0x214:   	xnor	%o4, 0x4b1, %l0
	.word	0x8ba01a37	! t0_kref+0x218:   	fstoi	%f23, %f5
	.word	0xe6070019	! t0_kref+0x21c:   	ld	[%i4 + %i1], %l3
	.word	0xe64e6012	! t0_kref+0x220:   	ldsb	[%i1 + 0x12], %l3
	.word	0x8ba1c83a	! t0_kref+0x224:   	fadds	%f7, %f26, %f5
	.word	0x81a489b0	! t0_kref+0x228:   	fdivs	%f18, %f16, %f0
	.word	0xb1a0192e	! t0_kref+0x22c:   	fstod	%f14, %f24
	.word	0xaad83630	! t0_kref+0x230:   	smulcc	%g0, -0x9d0, %l5
	.word	0xe6774019	! t0_kref+0x234:   	stx	%l3, [%i5 + %i1]
	.word	0x85a01a2f	! t0_kref+0x238:   	fstoi	%f15, %f2
	.word	0xaee6bd0e	! t0_kref+0x23c:   	subccc	%i2, -0x2f2, %l7
	.word	0xeca8a034	! t0_kref+0x240:   	stba	%l6, [%g2 + 0x34]%asi
	.word	0xe84e3ff2	! t0_kref+0x244:   	ldsb	[%i0 - 0xe], %l4
	.word	0x989de884	! t0_kref+0x248:   	xorcc	%l7, 0x884, %o4
	.word	0xe51e2010	! t0_kref+0x24c:   	ldd	[%i0 + 0x10], %f18
	.word	0x21800002	! t0_kref+0x250:   	fbn,a	_kref+0x258
	.word	0xae8a400c	! t0_kref+0x254:   	andcc	%o1, %o4, %l7
	.word	0xe890a02a	! t0_kref+0x258:   	lduha	[%g2 + 0x2a]%asi, %l4
	.word	0x91a01a28	! t0_kref+0x25c:   	fstoi	%f8, %f8
	.word	0xd2866004	! t0_kref+0x260:   	lda	[%i1 + 4]%asi, %o1
	.word	0xf9ee101c	! t0_kref+0x264:   	prefetcha	%i0 + %i4, 28
	.word	0xed20a014	! t0_kref+0x268:   	st	%f22, [%g2 + 0x14]
	.word	0xa0b34013	! t0_kref+0x26c:   	orncc	%o5, %l3, %l0
	.word	0xf19e5a5c	! t0_kref+0x270:   	ldda	[%i1 + %i4]0xd2, %f24
	.word	0x2b800008	! t0_kref+0x274:   	fbug,a	_kref+0x294
	.word	0xaf32c012	! t0_kref+0x278:   	srl	%o3, %l2, %l7
	.word	0xf207bfe0	! t0_kref+0x27c:   	ld	[%fp - 0x20], %i1
	.word	0x9ba000b4	! t0_kref+0x280:   	fnegs	%f20, %f13
	.word	0x89a1892a	! t0_kref+0x284:   	fmuls	%f6, %f10, %f4
	.word	0xeac8a005	! t0_kref+0x288:   	ldsba	[%g2 + 5]%asi, %l5
	.word	0x81ac0ac6	! t0_kref+0x28c:   	fcmped	%fcc0, %f16, %f6
	.word	0xd880a008	! t0_kref+0x290:   	lda	[%g2 + 8]%asi, %o4
	.word	0x99a01a38	! t0_kref+0x294:   	fstoi	%f24, %f12
	.word	0x8d85000c	! t0_kref+0x298:   	wr	%l4, %o4, %fprs
	.word	0x8610200e	! t0_kref+0x29c:   	mov	0xe, %g3
	.word	0x86a0e001	! t0_kref+0x2a0:   	subcc	%g3, 1, %g3
	.word	0x22800014	! t0_kref+0x2a4:   	be,a	_kref+0x2f4
	.word	0xa3400000	! t0_kref+0x2a8:   	mov	%y, %l1
	.word	0x9b25398a	! t0_kref+0x2ac:   	mulscc	%l4, -0x676, %o5
	.word	0x81ac0a33	! t0_kref+0x2b0:   	fcmps	%fcc0, %f16, %f19
	.word	0x99a01937	! t0_kref+0x2b4:   	fstod	%f23, %f12
	.word	0xac437ac7	! t0_kref+0x2b8:   	addc	%o5, -0x539, %l6
	.word	0xd8264000	! t0_kref+0x2bc:   	st	%o4, [%i1]
	.word	0xd500a018	! t0_kref+0x2c0:   	ld	[%g2 + 0x18], %f10
	.word	0x25bffff7	! t0_kref+0x2c4:   	fblg,a	_kref+0x2a0
	.word	0xf3ee501a	! t0_kref+0x2c8:   	prefetcha	%i1 + %i2, 25
	.word	0xe93e6000	! t0_kref+0x2cc:   	std	%f20, [%i1]
	.word	0x85a01a3a	! t0_kref+0x2d0:   	fstoi	%f26, %f2
	.word	0xde871019	! t0_kref+0x2d4:   	lda	[%i4 + %i1]0x80, %o7
	.word	0x93a449b0	! t0_kref+0x2d8:   	fdivs	%f17, %f16, %f9
	.word	0x94b023ae	! t0_kref+0x2dc:   	orncc	%g0, 0x3ae, %o2
	.word	0x85a00936	! t0_kref+0x2e0:   	fmuls	%f0, %f22, %f2
	.word	0xc19e1a1a	! t0_kref+0x2e4:   	ldda	[%i0 + %i2]0xd0, %f0
	.word	0x3fbfffee	! t0_kref+0x2e8:   	fbo,a	_kref+0x2a0
	.word	0x96f00000	! t0_kref+0x2ec:   	udivcc	%g0, %g0, %o3
	.word	0x9ae2400a	! t0_kref+0x2f0:   	subccc	%o1, %o2, %o5
	.word	0x9aab0009	! t0_kref+0x2f4:   	andncc	%o4, %o1, %o5
	.word	0xa8954008	! t0_kref+0x2f8:   	orcc	%l5, %o0, %l4
	.word	0x99a3c82f	! t0_kref+0x2fc:   	fadds	%f15, %f15, %f12
	.word	0xd256c019	! t0_kref+0x300:   	ldsh	[%i3 + %i1], %o1
	.word	0xf428a01b	! t0_kref+0x304:   	stb	%i2, [%g2 + 0x1b]
	.word	0x81dab9b8	! t0_kref+0x308:   	flush	%o2 - 0x648
	.word	0xd2067fe0	! t0_kref+0x30c:   	ld	[%i1 - 0x20], %o1
	.word	0xe7ee501c	! t0_kref+0x310:   	prefetcha	%i1 + %i4, 19
	.word	0xa4b30009	! t0_kref+0x314:   	orncc	%o4, %o1, %l2
	.word	0x81dabe61	! t0_kref+0x318:   	flush	%o2 - 0x19f
	.word	0xa2ddc01a	! t0_kref+0x31c:   	smulcc	%l7, %i2, %l1
	.word	0xf51fbe50	! t0_kref+0x320:   	ldd	[%fp - 0x1b0], %f26
	.word	0x9730000a	! t0_kref+0x324:   	srl	%g0, %o2, %o3
	.word	0xd53e7ff0	! t0_kref+0x328:   	std	%f10, [%i1 - 0x10]
	.word	0x3e480003	! t0_kref+0x32c:   	bvc,a,pt	%icc, _kref+0x338
	.word	0xd1be9a18	! t0_kref+0x330:   	stda	%f8, [%i2 + %i0]0xd0
	.word	0xaa8a8017	! t0_kref+0x334:   	andcc	%o2, %l7, %l5
	.word	0x35800005	! t0_kref+0x338:   	fbue,a	_kref+0x34c
	.word	0xd228a02b	! t0_kref+0x33c:   	stb	%o1, [%g2 + 0x2b]
	.word	0xea30a006	! t0_kref+0x340:   	sth	%l5, [%g2 + 6]
	.word	0x24800002	! t0_kref+0x344:   	ble,a	_kref+0x34c
	.word	0xd53e001d	! t0_kref+0x348:   	std	%f10, [%i0 + %i5]
	.word	0xd286501c	! t0_kref+0x34c:   	lda	[%i1 + %i4]0x80, %o1
	.word	0x33800006	! t0_kref+0x350:   	fbe,a	_kref+0x368
	.word	0x94f3715d	! t0_kref+0x354:   	udivcc	%o5, -0xea3, %o2
	.word	0xf4762008	! t0_kref+0x358:   	stx	%i2, [%i0 + 8]
	.word	0x85a01921	! t0_kref+0x35c:   	fstod	%f1, %f2
	.word	0xe93f4018	! t0_kref+0x360:   	std	%f20, [%i5 + %i0]
	.word	0xdb00a028	! t0_kref+0x364:   	ld	[%g2 + 0x28], %f13
	.word	0x27480002	! t0_kref+0x368:   	fbul,a,pt	%fcc0, _kref+0x370
	.word	0xd6c8a02b	! t0_kref+0x36c:   	ldsba	[%g2 + 0x2b]%asi, %o3
	.word	0xe6767ff0	! t0_kref+0x370:   	stx	%l3, [%i1 - 0x10]
	.word	0xd19eda58	! t0_kref+0x374:   	ldda	[%i3 + %i0]0xd2, %f8
	.word	0x86102004	! t0_kref+0x378:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x37c:   	bne,a	_kref+0x37c
	.word	0x86a0e001	! t0_kref+0x380:   	subcc	%g3, 1, %g3
	.word	0x39480004	! t0_kref+0x384:   	fbuge,a,pt	%fcc0, _kref+0x394
	.word	0xc11e2010	! t0_kref+0x388:   	ldd	[%i0 + 0x10], %f0
	.word	0xecf01018	! t0_kref+0x38c:   	stxa	%l6, [%g0 + %i0]0x80
	.word	0x98f2c008	! t0_kref+0x390:   	udivcc	%o3, %o0, %o4
	.word	0x81ad0ad6	! t0_kref+0x394:   	fcmped	%fcc0, %f20, %f22
	.word	0xee88a03f	! t0_kref+0x398:   	lduba	[%g2 + 0x3f]%asi, %l7
	.word	0xcd1e3ff8	! t0_kref+0x39c:   	ldd	[%i0 - 8], %f6
	.word	0x89a01a58	! t0_kref+0x3a0:   	fdtoi	%f24, %f4
	.word	0xa1400000	! t0_kref+0x3a4:   	mov	%y, %l0
	.word	0x920b732c	! t0_kref+0x3a8:   	and	%o5, -0xcd4, %o1
	.word	0xd9180019	! t0_kref+0x3ac:   	ldd	[%g0 + %i1], %f12
	.word	0x9e007e00	! t0_kref+0x3b0:   	add	%g1, -0x200, %o7
!	.word	0x2d815702	! t0_kref+0x3b4:   	fbg,a	SYM(t0_subr3)
	   	fbg,a	SYM(t0_subr3)
	.word	0xe24e3fe6	! t0_kref+0x3b8:   	ldsb	[%i0 - 0x1a], %l1
	.word	0x8143e067	! t0_kref+0x3bc:   	membar	0x67
	.word	0x81dac001	! t0_kref+0x3c0:   	flush	%o3 + %g1
	.word	0x89a188a4	! t0_kref+0x3c4:   	fsubs	%f6, %f4, %f4
	.word	0xe07e0000	! t0_kref+0x3c8:   	swap	[%i0], %l0
	.word	0x8143c000	! t0_kref+0x3cc:   	stbar
	.word	0x99a01a2d	! t0_kref+0x3d0:   	fstoi	%f13, %f12
	.word	0x37800003	! t0_kref+0x3d4:   	fbge,a	_kref+0x3e0
	.word	0x9a50000c	! t0_kref+0x3d8:   	umul	%g0, %o4, %o5
	.word	0x9b34e01d	! t0_kref+0x3dc:   	srl	%l3, 0x1d, %o5
	.word	0xb1a000da	! t0_kref+0x3e0:   	fnegd	%f26, %f24
	.word	0xaa8eab50	! t0_kref+0x3e4:   	andcc	%i2, 0xb50, %l5
	sethi	%hi(2f), %o7
	.word	0xe40be028	! t0_kref+0x3ec:   	ldub	[%o7 + 0x28], %l2
	.word	0xa41ca00c	! t0_kref+0x3f0:   	xor	%l2, 0xc, %l2
	.word	0xe42be028	! t0_kref+0x3f4:   	stb	%l2, [%o7 + 0x28]
	.word	0x81dbe028	! t0_kref+0x3f8:   	flush	%o7 + 0x28
	.word	0x2d480004	! t0_kref+0x3fc:   	fbg,a,pt	%fcc0, _kref+0x40c
	.word	0xc9be584a	! t0_kref+0x400:   	stda	%f4, [%i1 + %o2]0xc2
	.word	0x33480003	! t0_kref+0x404:   	fbe,a,pt	%fcc0, _kref+0x410
	.word	0x91a40836	! t0_kref+0x408:   	fadds	%f16, %f22, %f8
	.word	0x8585a562	! t0_kref+0x40c:   	wr	%l6, 0x562, %ccr
	.word	0x8d84c00b	! t0_kref+0x410:   	wr	%l3, %o3, %fprs
	.word	0x33800005	! t0_kref+0x414:   	fbe,a	_kref+0x428
	.word	0xd93e2018	! t0_kref+0x418:   	std	%f12, [%i0 + 0x18]
	.word	0xa6b0000b	! t0_kref+0x41c:   	orncc	%g0, %o3, %l3
	.word	0xc9be1814	! t0_kref+0x420:   	stda	%f4, [%i0 + %l4]0xc0
	.word	0x31800003	! t0_kref+0x424:   	fba,a	_kref+0x430
2:	.word	0x9e06afbb	! t0_kref+0x428:   	add	%i2, 0xfbb, %o7
	.word	0x33480004	! t0_kref+0x42c:   	fbe,a,pt	%fcc0, _kref+0x43c
	.word	0x9eb372dc	! t0_kref+0x430:   	orncc	%o5, -0xd24, %o7
	.word	0xde00a004	! t0_kref+0x434:   	ld	[%g2 + 4], %o7
	.word	0xeaa0a004	! t0_kref+0x438:   	sta	%l5, [%g2 + 4]%asi
	.word	0x86102002	! t0_kref+0x43c:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x440:   	bne,a	_kref+0x440
	.word	0x86a0e001	! t0_kref+0x444:   	subcc	%g3, 1, %g3
	.word	0xc11fbe00	! t0_kref+0x448:   	ldd	[%fp - 0x200], %f0
	.word	0xd2a0a000	! t0_kref+0x44c:   	sta	%o1, [%g2]%asi
	.word	0xa0ddbd96	! t0_kref+0x450:   	smulcc	%l6, -0x26a, %l0
	.word	0xe68e9019	! t0_kref+0x454:   	lduba	[%i2 + %i1]0x80, %l3
	.word	0x9fa2c8ad	! t0_kref+0x458:   	fsubs	%f11, %f13, %f15
	.word	0xe6963ffe	! t0_kref+0x45c:   	lduha	[%i0 - 2]%asi, %l3
	.word	0xec780019	! t0_kref+0x460:   	swap	[%g0 + %i1], %l6
	.word	0xee2e3ff4	! t0_kref+0x464:   	stb	%l7, [%i0 - 0xc]
	.word	0x989d6e24	! t0_kref+0x468:   	xorcc	%l5, 0xe24, %o4
	.word	0x2f800001	! t0_kref+0x46c:   	fbu,a	_kref+0x470
	.word	0xb1a40837	! t0_kref+0x470:   	fadds	%f16, %f23, %f24
	.word	0xa3a1092e	! t0_kref+0x474:   	fmuls	%f4, %f14, %f17
	.word	0xe5380019	! t0_kref+0x478:   	std	%f18, [%g0 + %i1]
	.word	0x8da089b6	! t0_kref+0x47c:   	fdivs	%f2, %f22, %f6
	.word	0xcb00a018	! t0_kref+0x480:   	ld	[%g2 + 0x18], %f5
	.word	0xaed54008	! t0_kref+0x484:   	umulcc	%l5, %o0, %l7
	.word	0xda2e601e	! t0_kref+0x488:   	stb	%o5, [%i1 + 0x1e]
	.word	0xa4b238c6	! t0_kref+0x48c:   	orncc	%o0, -0x73a, %l2
	.word	0xe6e81018	! t0_kref+0x490:   	ldstuba	[%g0 + %i0]0x80, %l3
	.word	0xae52c008	! t0_kref+0x494:   	umul	%o3, %o0, %l7
	.word	0xa2fb000d	! t0_kref+0x498:   	sdivcc	%o4, %o5, %l1
	.word	0xea300018	! t0_kref+0x49c:   	sth	%l5, [%g0 + %i0]
	.word	0xe048a038	! t0_kref+0x4a0:   	ldsb	[%g2 + 0x38], %l0
	.word	0x27800006	! t0_kref+0x4a4:   	fbul,a	_kref+0x4bc
	.word	0xa9400000	! t0_kref+0x4a8:   	mov	%y, %l4
	.word	0xd3861000	! t0_kref+0x4ac:   	lda	[%i0]0x80, %f9
	.word	0xa6be8015	! t0_kref+0x4b0:   	xnorcc	%i2, %l5, %l3
	.word	0xe9ee101c	! t0_kref+0x4b4:   	prefetcha	%i0 + %i4, 20
	.word	0xf53e2000	! t0_kref+0x4b8:   	std	%f26, [%i0]
	.word	0xa3a04934	! t0_kref+0x4bc:   	fmuls	%f1, %f20, %f17
	.word	0x9ed4bd7e	! t0_kref+0x4c0:   	umulcc	%l2, -0x282, %o7
	.word	0xecf8a01c	! t0_kref+0x4c4:   	swapa	[%g2 + 0x1c]%asi, %l6
	.word	0x9453401a	! t0_kref+0x4c8:   	umul	%o5, %i2, %o2
	.word	0xa31dc012	! t0_kref+0x4cc:   	tsubcctv	%l7, %l2, %l1
	.word	0x98d4c013	! t0_kref+0x4d0:   	umulcc	%l3, %l3, %o4
	.word	0xff206c9a	! t0_kref+0x4d4:   	st	%f31, [%g1 + 0xc9a]
	.word	0xd8c8a033	! t0_kref+0x4d8:   	ldsba	[%g2 + 0x33]%asi, %o4
	.word	0x9da01a28	! t0_kref+0x4dc:   	fstoi	%f8, %f14
	.word	0x8143e040	! t0_kref+0x4e0:   	membar	0x40
	.word	0xf11e7ff8	! t0_kref+0x4e4:   	ldd	[%i1 - 8], %f24
	.word	0xac55c015	! t0_kref+0x4e8:   	umul	%l7, %l5, %l6
	.word	0xa0658017	! t0_kref+0x4ec:   	subc	%l6, %l7, %l0
	.word	0xe8b0a004	! t0_kref+0x4f0:   	stha	%l4, [%g2 + 4]%asi
	.word	0x9615800c	! t0_kref+0x4f4:   	or	%l6, %o4, %o3
	.word	0xeac8a004	! t0_kref+0x4f8:   	ldsba	[%g2 + 4]%asi, %l5
	.word	0x001fffff	! t0_kref+0x4fc:   	illtrap	0x1fffff
	.word	0xec2e6016	! t0_kref+0x500:   	stb	%l6, [%i1 + 0x16]
	.word	0x35800006	! t0_kref+0x504:   	fbue,a	_kref+0x51c
	.word	0x910b0008	! t0_kref+0x508:   	tsubcc	%o4, %o0, %o0
	.word	0xac8a6aaf	! t0_kref+0x50c:   	andcc	%o1, 0xaaf, %l6
	.word	0x81defc13	! t0_kref+0x510:   	flush	%i3 - 0x3ed
	.word	0x9fc00004	! t0_kref+0x514:   	call	%g0 + %g4
	.word	0xaba18824	! t0_kref+0x518:   	fadds	%f6, %f4, %f21
	.word	0xc700a030	! t0_kref+0x51c:   	ld	[%g2 + 0x30], %f3
	.word	0x81aa8ac0	! t0_kref+0x520:   	fcmped	%fcc0, %f10, %f0
	.word	0xc13e401d	! t0_kref+0x524:   	std	%f0, [%i1 + %i5]
	.word	0xac5dfeec	! t0_kref+0x528:   	smul	%l7, -0x114, %l6
	.word	0x99a28d2a	! t0_kref+0x52c:   	fsmuld	%f10, %f10, %f12
	.word	0xd700a014	! t0_kref+0x530:   	ld	[%g2 + 0x14], %f11
	.word	0xa1400000	! t0_kref+0x534:   	mov	%y, %l0
	.word	0x9a64c00c	! t0_kref+0x538:   	subc	%l3, %o4, %o5
	.word	0x20800001	! t0_kref+0x53c:   	bn,a	_kref+0x540
	.word	0xe5067ffc	! t0_kref+0x540:   	ld	[%i1 - 4], %f18
	.word	0xd45e001d	! t0_kref+0x544:   	ldx	[%i0 + %i5], %o2
	.word	0xa1a548a1	! t0_kref+0x548:   	fsubs	%f21, %f1, %f16
	.word	0xeab0a014	! t0_kref+0x54c:   	stha	%l5, [%g2 + 0x14]%asi
	.word	0xd0567ff2	! t0_kref+0x550:   	ldsh	[%i1 - 0xe], %o0
	.word	0x23800004	! t0_kref+0x554:   	fbne,a	_kref+0x564
	.word	0xd01e2008	! t0_kref+0x558:   	ldd	[%i0 + 8], %o0
	.word	0xd44e2015	! t0_kref+0x55c:   	ldsb	[%i0 + 0x15], %o2
	.word	0x8143c000	! t0_kref+0x560:   	stbar
	.word	0xae3d2666	! t0_kref+0x564:   	xnor	%l4, 0x666, %l7
	.word	0x81aa8ad2	! t0_kref+0x568:   	fcmped	%fcc0, %f10, %f18
	.word	0x9732e009	! t0_kref+0x56c:   	srl	%o3, 0x9, %o3
	.word	0x86102011	! t0_kref+0x570:   	mov	0x11, %g3
	.word	0x86a0e001	! t0_kref+0x574:   	subcc	%g3, 1, %g3
	.word	0x22800011	! t0_kref+0x578:   	be,a	_kref+0x5bc
	.word	0xe0064000	! t0_kref+0x57c:   	ld	[%i1], %l0
	.word	0x9ed33cf1	! t0_kref+0x580:   	umulcc	%o4, -0x30f, %o7
	.word	0x23bffffc	! t0_kref+0x584:   	fbne,a	_kref+0x574
	.word	0x9e648000	! t0_kref+0x588:   	subc	%l2, %g0, %o7
	.word	0xec20a034	! t0_kref+0x58c:   	st	%l6, [%g2 + 0x34]
	.word	0xd6580018	! t0_kref+0x590:   	ldx	[%g0 + %i0], %o3
	.word	0x90ab4009	! t0_kref+0x594:   	andncc	%o5, %o1, %o0
	.word	0xa4d54016	! t0_kref+0x598:   	umulcc	%l5, %l6, %l2
	.word	0x9852fdea	! t0_kref+0x59c:   	umul	%o3, -0x216, %o4
	.word	0x81df0008	! t0_kref+0x5a0:   	flush	%i4 + %o0
	.word	0x31480006	! t0_kref+0x5a4:   	fba,a,pt	%fcc0, _kref+0x5bc
	.word	0x90b00013	! t0_kref+0x5a8:   	orncc	%g0, %l3, %o0
	.word	0x93400000	! t0_kref+0x5ac:   	mov	%y, %o1
	.word	0x95a00033	! t0_kref+0x5b0:   	fmovs	%f19, %f10
	.word	0x92632e63	! t0_kref+0x5b4:   	subc	%o4, 0xe63, %o1
	.word	0xec6e8018	! t0_kref+0x5b8:   	ldstub	[%i2 + %i0], %l6
	.word	0x9ae4b76b	! t0_kref+0x5bc:   	subccc	%l2, -0x895, %o5
	.word	0x86102002	! t0_kref+0x5c0:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x5c4:   	bne,a	_kref+0x5c4
	.word	0x86a0e001	! t0_kref+0x5c8:   	subcc	%g3, 1, %g3
	.word	0xd62e2005	! t0_kref+0x5cc:   	stb	%o3, [%i0 + 5]
	.word	0x8d82c016	! t0_kref+0x5d0:   	wr	%o3, %l6, %fprs
	.word	0xac868008	! t0_kref+0x5d4:   	addcc	%i2, %o0, %l6
	.word	0xf207bfe0	! t0_kref+0x5d8:   	ld	[%fp - 0x20], %i1
	.word	0x2c480005	! t0_kref+0x5dc:   	bneg,a,pt	%icc, _kref+0x5f0
	.word	0x230ccb7b	! t0_kref+0x5e0:   	sethi	%hi(0x332dec00), %l1
	.word	0x81a00020	! t0_kref+0x5e4:   	fmovs	%f0, %f0
	.word	0x94b267b4	! t0_kref+0x5e8:   	orncc	%o1, 0x7b4, %o2
	.word	0xa6048017	! t0_kref+0x5ec:   	add	%l2, %l7, %l3
	.word	0xd028a02b	! t0_kref+0x5f0:   	stb	%o0, [%g2 + 0x2b]
	.word	0x36800007	! t0_kref+0x5f4:   	bge,a	_kref+0x610
	.word	0xd290a00a	! t0_kref+0x5f8:   	lduha	[%g2 + 0xa]%asi, %o1
	.word	0xa05a401a	! t0_kref+0x5fc:   	smul	%o1, %i2, %l0
	.word	0xd91e4000	! t0_kref+0x600:   	ldd	[%i1], %f12
	.word	0xaec2f590	! t0_kref+0x604:   	addccc	%o3, -0xa70, %l7
	.word	0xea267fe8	! t0_kref+0x608:   	st	%l5, [%i1 - 0x18]
	.word	0xd91e3ff8	! t0_kref+0x60c:   	ldd	[%i0 - 8], %f12
	.word	0xe2000018	! t0_kref+0x610:   	ld	[%g0 + %i0], %l1
	.word	0xcc18001d	! t0_kref+0x614:   	ldd	[%g0 + %i5], %g6
	.word	0x81a00131	! t0_kref+0x618:   	fabss	%f17, %f0
	.word	0x9de3bfa0	! t0_kref+0x61c:   	save	%sp, -0x60, %sp
	.word	0xb066c018	! t0_kref+0x620:   	subc	%i3, %i0, %i0
	.word	0x9fe80018	! t0_kref+0x624:   	restore	%g0, %i0, %o7
	.word	0xa0d22a0b	! t0_kref+0x628:   	umulcc	%o0, 0xa0b, %l0
	.word	0x87a04826	! t0_kref+0x62c:   	fadds	%f1, %f6, %f3
	.word	0x21480008	! t0_kref+0x630:   	fbn,a,pt	%fcc0, _kref+0x650
	.word	0x91a01a34	! t0_kref+0x634:   	fstoi	%f20, %f8
	.word	0xf5ee101b	! t0_kref+0x638:   	prefetcha	%i0 + %i3, 26
	.word	0xc1a0a014	! t0_kref+0x63c:   	sta	%f0, [%g2 + 0x14]%asi
	call	SYM(t0_subr3)
	.word	0xe11e6018	! t0_kref+0x644:   	ldd	[%i1 + 0x18], %f16
	.word	0x9662a6d4	! t0_kref+0x648:   	subc	%o2, 0x6d4, %o3
	.word	0xd0de3fe0	! t0_kref+0x64c:   	ldxa	[%i0 - 0x20]%asi, %o0
	.word	0xdad0a026	! t0_kref+0x650:   	ldsha	[%g2 + 0x26]%asi, %o5
	.word	0x81aa0ac6	! t0_kref+0x654:   	fcmped	%fcc0, %f8, %f6
	.word	0x81db8005	! t0_kref+0x658:   	flush	%sp + %g5
	.word	0x9fc10000	! t0_kref+0x65c:   	call	%g4
	.word	0xae1a400c	! t0_kref+0x660:   	xor	%o1, %o4, %l7
	.word	0x9e033b3e	! t0_kref+0x664:   	add	%o4, -0x4c2, %o7
	.word	0xefee501c	! t0_kref+0x668:   	prefetcha	%i1 + %i4, 23
	.word	0xd6fe6008	! t0_kref+0x66c:   	swapa	[%i1 + 8]%asi, %o3
	.word	0xe4067ffc	! t0_kref+0x670:   	ld	[%i1 - 4], %l2
	.word	0xdafe101c	! t0_kref+0x674:   	swapa	[%i0 + %i4]0x80, %o5
	.word	0xd8b0a01c	! t0_kref+0x678:   	stha	%o4, [%g2 + 0x1c]%asi
	.word	0xa8ba000d	! t0_kref+0x67c:   	xnorcc	%o0, %o5, %l4
	.word	0x85858016	! t0_kref+0x680:   	wr	%l6, %l6, %ccr
	.word	0x987ce2dc	! t0_kref+0x684:   	sdiv	%l3, 0x2dc, %o4
	.word	0x8da0012a	! t0_kref+0x688:   	fabss	%f10, %f6
	.word	0xd04e0000	! t0_kref+0x68c:   	ldsb	[%i0], %o0
	.word	0x920d8017	! t0_kref+0x690:   	and	%l6, %l7, %o1
	.word	0xd050a016	! t0_kref+0x694:   	ldsh	[%g2 + 0x16], %o0
	.word	0x8ba000a8	! t0_kref+0x698:   	fnegs	%f8, %f5
	.word	0x81a588da	! t0_kref+0x69c:   	fsubd	%f22, %f26, %f0
	.word	0x35800005	! t0_kref+0x6a0:   	fbue,a	_kref+0x6b4
	.word	0x8da0110c	! t0_kref+0x6a4:   	fxtod	%f12, %f6
	.word	0x83a64929	! t0_kref+0x6a8:   	fmuls	%f25, %f9, %f1
	.word	0x97a01882	! t0_kref+0x6ac:   	fitos	%f2, %f11
	.word	0x90bcefcb	! t0_kref+0x6b0:   	xnorcc	%l3, 0xfcb, %o0
	.word	0xa4a56f14	! t0_kref+0x6b4:   	subcc	%l5, 0xf14, %l2
	.word	0xa0baf183	! t0_kref+0x6b8:   	xnorcc	%o3, -0xe7d, %l0
	.word	0x25800008	! t0_kref+0x6bc:   	fblg,a	_kref+0x6dc
	.word	0xee88a036	! t0_kref+0x6c0:   	lduba	[%g2 + 0x36]%asi, %l7
	.word	0xd81e6018	! t0_kref+0x6c4:   	ldd	[%i1 + 0x18], %o4
	.word	0x9fc10000	! t0_kref+0x6c8:   	call	%g4
	.word	0xec000019	! t0_kref+0x6cc:   	ld	[%g0 + %i1], %l6
	.word	0x8da10936	! t0_kref+0x6d0:   	fmuls	%f4, %f22, %f6
	.word	0x92ab0009	! t0_kref+0x6d4:   	andncc	%o4, %o1, %o1
	.word	0x93a01a21	! t0_kref+0x6d8:   	fstoi	%f1, %f9
	.word	0x35800007	! t0_kref+0x6dc:   	fbue,a	_kref+0x6f8
	.word	0xe820a030	! t0_kref+0x6e0:   	st	%l4, [%g2 + 0x30]
	.word	0xee2e3fe8	! t0_kref+0x6e4:   	stb	%l7, [%i0 - 0x18]
	.word	0xb1a01a2d	! t0_kref+0x6e8:   	fstoi	%f13, %f24
	.word	0xed063ff4	! t0_kref+0x6ec:   	ld	[%i0 - 0xc], %f22
	.word	0xaba1c929	! t0_kref+0x6f0:   	fmuls	%f7, %f9, %f21
	.word	0x2c800002	! t0_kref+0x6f4:   	bneg,a	_kref+0x6fc
	.word	0x8ba44830	! t0_kref+0x6f8:   	fadds	%f17, %f16, %f5
	.word	0xe13f4018	! t0_kref+0x6fc:   	std	%f16, [%i5 + %i0]
	.word	0x97a01a23	! t0_kref+0x700:   	fstoi	%f3, %f11
	.word	0x81a80ad8	! t0_kref+0x704:   	fcmped	%fcc0, %f0, %f24
	.word	0x98daa3b2	! t0_kref+0x708:   	smulcc	%o2, 0x3b2, %o4
	.word	0x30800003	! t0_kref+0x70c:   	ba,a	_kref+0x718
	.word	0x96d0000c	! t0_kref+0x710:   	umulcc	%g0, %o4, %o3
	.word	0xda88a00e	! t0_kref+0x714:   	lduba	[%g2 + 0xe]%asi, %o5
	.word	0xacd48017	! t0_kref+0x718:   	umulcc	%l2, %l7, %l6
	.word	0x928b4015	! t0_kref+0x71c:   	andcc	%o5, %l5, %o1
	.word	0xd53e0000	! t0_kref+0x720:   	std	%f10, [%i0]
	.word	0xda28a02f	! t0_kref+0x724:   	stb	%o5, [%g2 + 0x2f]
	.word	0xe67e200c	! t0_kref+0x728:   	swap	[%i0 + 0xc], %l3
	sethi	%hi(2f), %o7
	.word	0xe40be36c	! t0_kref+0x730:   	ldub	[%o7 + 0x36c], %l2
	.word	0xa41ca00c	! t0_kref+0x734:   	xor	%l2, 0xc, %l2
	.word	0xe42be36c	! t0_kref+0x738:   	stb	%l2, [%o7 + 0x36c]
	.word	0x81dbe36c	! t0_kref+0x73c:   	flush	%o7 + 0x36c
	.word	0xa2800016	! t0_kref+0x740:   	addcc	%g0, %l6, %l1
	.word	0xf420a010	! t0_kref+0x744:   	st	%i2, [%g2 + 0x10]
	.word	0x28800005	! t0_kref+0x748:   	bleu,a	_kref+0x75c
	.word	0xaf2da010	! t0_kref+0x74c:   	sll	%l6, 0x10, %l7
	.word	0xcda0a000	! t0_kref+0x750:   	sta	%f6, [%g2]%asi
	.word	0x93a01a2d	! t0_kref+0x754:   	fstoi	%f13, %f9
	.word	0xcd3e6008	! t0_kref+0x758:   	std	%f6, [%i1 + 8]
	.word	0x91a01a29	! t0_kref+0x75c:   	fstoi	%f9, %f8
	.word	0xd11fbe90	! t0_kref+0x760:   	ldd	[%fp - 0x170], %f8
	.word	0x9abdc00d	! t0_kref+0x764:   	xnorcc	%l7, %o5, %o5
	.word	0x3f800004	! t0_kref+0x768:   	fbo,a	_kref+0x778
2:	.word	0x925b37d2	! t0_kref+0x76c:   	smul	%o4, -0x82e, %o1
	.word	0x9fc10000	! t0_kref+0x770:   	call	%g4
	.word	0xac5e8016	! t0_kref+0x774:   	smul	%i2, %l6, %l6
	.word	0x9b0c801a	! t0_kref+0x778:   	tsubcc	%l2, %i2, %o5
	.word	0xa60b0015	! t0_kref+0x77c:   	and	%o4, %l5, %l3
	.word	0x81ad8ad4	! t0_kref+0x780:   	fcmped	%fcc0, %f22, %f20
	.word	0x8143e011	! t0_kref+0x784:   	membar	0x11
	.word	0xa7a01a39	! t0_kref+0x788:   	fstoi	%f25, %f19
	.word	0x9a2dc015	! t0_kref+0x78c:   	andn	%l7, %l5, %o5
	.word	0x8da01938	! t0_kref+0x790:   	fstod	%f24, %f6
	.word	0x96bd3fb9	! t0_kref+0x794:   	xnorcc	%l4, -0x47, %o3
	.word	0x9f2d601b	! t0_kref+0x798:   	sll	%l5, 0x1b, %o7
	.word	0xacf5e267	! t0_kref+0x79c:   	udivcc	%l7, 0x267, %l6
	.word	0xda56c018	! t0_kref+0x7a0:   	ldsh	[%i3 + %i0], %o5
	.word	0x98d834a3	! t0_kref+0x7a4:   	smulcc	%g0, -0xb5d, %o4
	.word	0xaa433fb3	! t0_kref+0x7a8:   	addc	%o4, -0x4d, %l5
	.word	0x98b8000a	! t0_kref+0x7ac:   	xnorcc	%g0, %o2, %o4
	.word	0x99a648b2	! t0_kref+0x7b0:   	fsubs	%f25, %f18, %f12
	.word	0x92900014	! t0_kref+0x7b4:   	orcc	%g0, %l4, %o1
	.word	0xe450a024	! t0_kref+0x7b8:   	ldsh	[%g2 + 0x24], %l2
	.word	0xb3a000b8	! t0_kref+0x7bc:   	fnegs	%f24, %f25
	.word	0x9ba01a2a	! t0_kref+0x7c0:   	fstoi	%f10, %f13
	.word	0x9e0b7bfc	! t0_kref+0x7c4:   	and	%o5, -0x404, %o7
	.word	0x99a40844	! t0_kref+0x7c8:   	faddd	%f16, %f4, %f12
	.word	0xa205400b	! t0_kref+0x7cc:   	add	%l5, %o3, %l1
	.word	0xec562010	! t0_kref+0x7d0:   	ldsh	[%i0 + 0x10], %l6
	.word	0xe628a03a	! t0_kref+0x7d4:   	stb	%l3, [%g2 + 0x3a]
	.word	0xa1a0192b	! t0_kref+0x7d8:   	fstod	%f11, %f16
	.word	0x8d820012	! t0_kref+0x7dc:   	wr	%o0, %l2, %fprs
	.word	0xa9a01088	! t0_kref+0x7e0:   	fxtos	%f8, %f20
	.word	0xd828a021	! t0_kref+0x7e4:   	stb	%o4, [%g2 + 0x21]
	.word	0xa68b4009	! t0_kref+0x7e8:   	andcc	%o5, %o1, %l3
	.word	0x9fc10000	! t0_kref+0x7ec:   	call	%g4
	.word	0xa29b6051	! t0_kref+0x7f0:   	xorcc	%o5, 0x51, %l1
	.word	0xd11fbe40	! t0_kref+0x7f4:   	ldd	[%fp - 0x1c0], %f8
	.word	0x98b5616f	! t0_kref+0x7f8:   	orncc	%l5, 0x16f, %o4
	.word	0xe8f01018	! t0_kref+0x7fc:   	stxa	%l4, [%g0 + %i0]0x80
	.word	0xe36e401c	! t0_kref+0x800:   	prefetch	%i1 + %i4, 17
	.word	0x25800002	! t0_kref+0x804:   	fblg,a	_kref+0x80c
	.word	0xf207bfe0	! t0_kref+0x808:   	ld	[%fp - 0x20], %i1
	.word	0xc0b67fe6	! t0_kref+0x80c:   	stha	%g0, [%i1 - 0x1a]%asi
	.word	0x8143e061	! t0_kref+0x810:   	membar	0x61
	.word	0xc56e6010	! t0_kref+0x814:   	prefetch	%i1 + 0x10, 2
	.word	0x81ad8a5a	! t0_kref+0x818:   	fcmpd	%fcc0, %f22, %f26
	.word	0xaec3400d	! t0_kref+0x81c:   	addccc	%o5, %o5, %l7
	.word	0x9b400000	! t0_kref+0x820:   	mov	%y, %o5
	.word	0xb5a14d34	! t0_kref+0x824:   	fsmuld	%f5, %f20, %f26
	.word	0xa8bb6ee2	! t0_kref+0x828:   	xnorcc	%o5, 0xee2, %l4
	.word	0xd09e3fe0	! t0_kref+0x82c:   	ldda	[%i0 - 0x20]%asi, %o0
	.word	0x9664800b	! t0_kref+0x830:   	subc	%l2, %o3, %o3
	.word	0x9fc00004	! t0_kref+0x834:   	call	%g0 + %g4
	.word	0x8da24925	! t0_kref+0x838:   	fmuls	%f9, %f5, %f6
	.word	0xf7ee501c	! t0_kref+0x83c:   	prefetcha	%i1 + %i4, 27
	.word	0x3b800007	! t0_kref+0x840:   	fble,a	_kref+0x85c
	.word	0xd91e2018	! t0_kref+0x844:   	ldd	[%i0 + 0x18], %f12
	.word	0x81850000	! t0_kref+0x848:   	wr	%l4, %g0, %y
	.word	0xd6566002	! t0_kref+0x84c:   	ldsh	[%i1 + 2], %o3
	.word	0xa6ba8000	! t0_kref+0x850:   	xnorcc	%o2, %g0, %l3
	.word	0xd49e2000	! t0_kref+0x854:   	ldda	[%i0]%asi, %o2
	.word	0x3d800001	! t0_kref+0x858:   	fbule,a	_kref+0x85c
	.word	0xc030a03a	! t0_kref+0x85c:   	clrh	[%g2 + 0x3a]
	.word	0xd62e3ff3	! t0_kref+0x860:   	stb	%o3, [%i0 - 0xd]
	.word	0xd40e401a	! t0_kref+0x864:   	ldub	[%i1 + %i2], %o2
	.word	0x95a548b0	! t0_kref+0x868:   	fsubs	%f21, %f16, %f10
	.word	0x9fc00004	! t0_kref+0x86c:   	call	%g0 + %g4
	.word	0xefe8a009	! t0_kref+0x870:   	prefetcha	%g2 + 9, 23
	.word	0xec160000	! t0_kref+0x874:   	lduh	[%i0], %l6
	.word	0x32480004	! t0_kref+0x878:   	bne,a,pt	%icc, _kref+0x888
	.word	0x953d200b	! t0_kref+0x87c:   	sra	%l4, 0xb, %o2
	.word	0xcf80a004	! t0_kref+0x880:   	lda	[%g2 + 4]%asi, %f7
	.word	0xdac8a02c	! t0_kref+0x884:   	ldsba	[%g2 + 0x2c]%asi, %o5
	.word	0xf1ee101d	! t0_kref+0x888:   	prefetcha	%i0 + %i5, 24
	.word	0xe56e001b	! t0_kref+0x88c:   	prefetch	%i0 + %i3, 18
	.word	0xf19e1a5b	! t0_kref+0x890:   	ldda	[%i0 + %i3]0xd2, %f24
	.word	0xb3a000a9	! t0_kref+0x894:   	fnegs	%f9, %f25
	.word	0xd056001b	! t0_kref+0x898:   	ldsh	[%i0 + %i3], %o0
	.word	0xe720a004	! t0_kref+0x89c:   	st	%f19, [%g2 + 4]
	.word	0xa63cfccf	! t0_kref+0x8a0:   	xnor	%l3, -0x331, %l3
	.word	0x81daf625	! t0_kref+0x8a4:   	flush	%o3 - 0x9db
	.word	0xe91e6018	! t0_kref+0x8a8:   	ldd	[%i1 + 0x18], %f20
	.word	0xec48a02c	! t0_kref+0x8ac:   	ldsb	[%g2 + 0x2c], %l6
	.word	0x85a8c044	! t0_kref+0x8b0:   	fmovdul	%fcc0, %f4, %f2
	.word	0xd4ae2007	! t0_kref+0x8b4:   	stba	%o2, [%i0 + 7]%asi
	.word	0xf007bfe0	! t0_kref+0x8b8:   	ld	[%fp - 0x20], %i0
	.word	0xa936a01f	! t0_kref+0x8bc:   	srl	%i2, 0x1f, %l4
	.word	0x98a30012	! t0_kref+0x8c0:   	subcc	%o4, %l2, %o4
	.word	0x35800004	! t0_kref+0x8c4:   	fbue,a	_kref+0x8d4
	.word	0xf56e001a	! t0_kref+0x8c8:   	prefetch	%i0 + %i2, 26
	.word	0x87a20923	! t0_kref+0x8cc:   	fmuls	%f8, %f3, %f3
	.word	0x9644b6e6	! t0_kref+0x8d0:   	addc	%l2, -0x91a, %o3
	.word	0xe4086334	! t0_kref+0x8d4:   	ldub	[%g1 + 0x334], %l2
	.word	0xa41ca00c	! t0_kref+0x8d8:   	xor	%l2, 0xc, %l2
	.word	0xe4286334	! t0_kref+0x8dc:   	stb	%l2, [%g1 + 0x334]
	.word	0x81d86334	! t0_kref+0x8e0:   	flush	%g1 + 0x334
	.word	0x90a0000c	! t0_kref+0x8e4:   	subcc	%g0, %o4, %o0
2:	.word	0xe20e4000	! t0_kref+0x8e8:   	ldub	[%i1], %l1
	.word	0xc53e001d	! t0_kref+0x8ec:   	std	%f2, [%i0 + %i5]
	call	SYM(t0_subr1)
	.word	0xd430a02e	! t0_kref+0x8f4:   	sth	%o2, [%g2 + 0x2e]
	.word	0xe7ee101b	! t0_kref+0x8f8:   	prefetcha	%i0 + %i3, 19
	.word	0x81a80ac4	! t0_kref+0x8fc:   	fcmped	%fcc0, %f0, %f4
	.word	0xd010a028	! t0_kref+0x900:   	lduh	[%g2 + 0x28], %o0
	.word	0xea80a008	! t0_kref+0x904:   	lda	[%g2 + 8]%asi, %l5
	.word	0xa9352002	! t0_kref+0x908:   	srl	%l4, 0x2, %l4
	.word	0xd41e0000	! t0_kref+0x90c:   	ldd	[%i0], %o2
	.word	0x92da7811	! t0_kref+0x910:   	smulcc	%o1, -0x7ef, %o1
	.word	0x28800006	! t0_kref+0x914:   	bleu,a	_kref+0x92c
	.word	0xe2564000	! t0_kref+0x918:   	ldsh	[%i1], %l1
	.word	0xea96501b	! t0_kref+0x91c:   	lduha	[%i1 + %i3]0x80, %l5
	.word	0xa03a4009	! t0_kref+0x920:   	xnor	%o1, %o1, %l0
	.word	0xae1d7bfa	! t0_kref+0x924:   	xor	%l5, -0x406, %l7
	.word	0xa9a60856	! t0_kref+0x928:   	faddd	%f24, %f22, %f20
	.word	0x91a60d2d	! t0_kref+0x92c:   	fsmuld	%f24, %f13, %f8
	.word	0xf380a034	! t0_kref+0x930:   	lda	[%g2 + 0x34]%asi, %f25
	.word	0x81dae00d	! t0_kref+0x934:   	flush	%o3 + 0xd
	.word	0xf4767fe8	! t0_kref+0x938:   	stx	%i2, [%i1 - 0x18]
	.word	0x9ba0003a	! t0_kref+0x93c:   	fmovs	%f26, %f13
	.word	0x87a01a28	! t0_kref+0x940:   	fstoi	%f8, %f3
	.word	0xf5ee501c	! t0_kref+0x944:   	prefetcha	%i1 + %i4, 26
	.word	0xd580a00c	! t0_kref+0x948:   	lda	[%g2 + 0xc]%asi, %f10
	.word	0xf96e2018	! t0_kref+0x94c:   	prefetch	%i0 + 0x18, 28
	.word	0x2b800001	! t0_kref+0x950:   	fbug,a	_kref+0x954
	.word	0xa4456d57	! t0_kref+0x954:   	addc	%l5, 0xd57, %l2
	.word	0xa892400b	! t0_kref+0x958:   	orcc	%o1, %o3, %l4
	.word	0x81df001e	! t0_kref+0x95c:   	flush	%i4 + %fp
	.word	0xa7256b53	! t0_kref+0x960:   	mulscc	%l5, 0xb53, %l3
	.word	0xa9a009c4	! t0_kref+0x964:   	fdivd	%f0, %f4, %f20
	.word	0xa2e6800a	! t0_kref+0x968:   	subccc	%i2, %o2, %l1
	.word	0xc99eda58	! t0_kref+0x96c:   	ldda	[%i3 + %i0]0xd2, %f4
	.word	0x9e9dc00b	! t0_kref+0x970:   	xorcc	%l7, %o3, %o7
	.word	0xacf54008	! t0_kref+0x974:   	udivcc	%l5, %o0, %l6
	.word	0xa8450017	! t0_kref+0x978:   	addc	%l4, %l7, %l4
!	.word	0x28495590	! t0_kref+0x97c:   	bleu,a,pt	%icc, SYM(t0_subr3)
	   	bleu,a,pt	%icc, SYM(t0_subr3)
	.word	0x9f414000	! t0_kref+0x980:   	mov	%pc, %o7
	.word	0xec36c018	! t0_kref+0x984:   	sth	%l6, [%i3 + %i0]
	.word	0x8143e019	! t0_kref+0x988:   	membar	0x19
	.word	0x85a01a28	! t0_kref+0x98c:   	fstoi	%f8, %f2
	.word	0x99a88028	! t0_kref+0x990:   	fmovslg	%fcc0, %f8, %f12
	.word	0x86102009	! t0_kref+0x994:   	mov	0x9, %g3
	.word	0x86a0e001	! t0_kref+0x998:   	subcc	%g3, 1, %g3
	.word	0x22800002	! t0_kref+0x99c:   	be,a	_kref+0x9a4
	.word	0x9a0023eb	! t0_kref+0x9a0:   	add	%g0, 0x3eb, %o5
	.word	0x2d800008	! t0_kref+0x9a4:   	fbg,a	_kref+0x9c4
	.word	0x9da64829	! t0_kref+0x9a8:   	fadds	%f25, %f9, %f14
	.word	0x99a1482c	! t0_kref+0x9ac:   	fadds	%f5, %f12, %f12
	.word	0xd300a02c	! t0_kref+0x9b0:   	ld	[%g2 + 0x2c], %f9
	.word	0xf16e3fe0	! t0_kref+0x9b4:   	prefetch	%i0 - 0x20, 24
	.word	0xe3ee101c	! t0_kref+0x9b8:   	prefetcha	%i0 + %i4, 17
	.word	0xe5867ff4	! t0_kref+0x9bc:   	lda	[%i1 - 0xc]%asi, %f18
	call	SYM(t0_subr3)
	.word	0x81850000	! t0_kref+0x9c4:   	wr	%l4, %g0, %y
	.word	0x81adcab5	! t0_kref+0x9c8:   	fcmpes	%fcc0, %f23, %f21
	.word	0x9ba01a25	! t0_kref+0x9cc:   	fstoi	%f5, %f13
	.word	0xd67e7fe8	! t0_kref+0x9d0:   	swap	[%i1 - 0x18], %o3
	.word	0xa5a289d4	! t0_kref+0x9d4:   	fdivd	%f10, %f20, %f18
	.word	0x9ba01889	! t0_kref+0x9d8:   	fitos	%f9, %f13
	.word	0x86102002	! t0_kref+0x9dc:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x9e0:   	bne,a	_kref+0x9e0
	.word	0x86a0e001	! t0_kref+0x9e4:   	subcc	%g3, 1, %g3
	.word	0x952ea001	! t0_kref+0x9e8:   	sll	%i2, 0x1, %o2
	.word	0x29800007	! t0_kref+0x9ec:   	fbl,a	_kref+0xa08
	.word	0xa5a08d35	! t0_kref+0x9f0:   	fsmuld	%f2, %f21, %f18
	.word	0x9f400000	! t0_kref+0x9f4:   	mov	%y, %o7
	.word	0x9afac012	! t0_kref+0x9f8:   	sdivcc	%o3, %l2, %o5
	.word	0x96b57f52	! t0_kref+0x9fc:   	orncc	%l5, -0xae, %o3
	.word	0xd67e0000	! t0_kref+0xa00:   	swap	[%i0], %o3
	.word	0xfbee101a	! t0_kref+0xa04:   	prefetcha	%i0 + %i2, 29
	.word	0x989d0009	! t0_kref+0xa08:   	xorcc	%l4, %o1, %o4
	.word	0xd226401c	! t0_kref+0xa0c:   	st	%o1, [%i1 + %i4]
	.word	0x3e800007	! t0_kref+0xa10:   	bvc,a	_kref+0xa2c
	.word	0xe16e001a	! t0_kref+0xa14:   	prefetch	%i0 + %i2, 16
	.word	0x232dfca0	! t0_kref+0xa18:   	sethi	%hi(0xb7f28000), %l1
	.word	0xd826401c	! t0_kref+0xa1c:   	st	%o4, [%i1 + %i4]
	.word	0xaf3a0016	! t0_kref+0xa20:   	sra	%o0, %l6, %l7
	.word	0x39800008	! t0_kref+0xa24:   	fbuge,a	_kref+0xa44
	.word	0x81a4cd35	! t0_kref+0xa28:   	fsmuld	%f19, %f21, %f0
	.word	0x81dfc00c	! t0_kref+0xa2c:   	flush	%i7 + %o4
	.word	0xd44e7ff6	! t0_kref+0xa30:   	ldsb	[%i1 - 0xa], %o2
	.word	0xd040a02c	! t0_kref+0xa34:   	ldsw	[%g2 + 0x2c], %o0
	.word	0x91400000	! t0_kref+0xa38:   	mov	%y, %o0
	.word	0x967b000b	! t0_kref+0xa3c:   	sdiv	%o4, %o3, %o3
	.word	0x99a48d2a	! t0_kref+0xa40:   	fsmuld	%f18, %f10, %f12
	.word	0xcf861000	! t0_kref+0xa44:   	lda	[%i0]0x80, %f7
	.word	0xed1e6008	! t0_kref+0xa48:   	ldd	[%i1 + 8], %f22
	.word	0xae0d000d	! t0_kref+0xa4c:   	and	%l4, %o5, %l7
	.word	0xab400000	! t0_kref+0xa50:   	mov	%y, %l5
	.word	0x9fc00004	! t0_kref+0xa54:   	call	%g0 + %g4
	.word	0xada309cc	! t0_kref+0xa58:   	fdivd	%f12, %f12, %f22
	.word	0x9922755a	! t0_kref+0xa5c:   	mulscc	%o1, -0xaa6, %o4
	.word	0x39800001	! t0_kref+0xa60:   	fbuge,a	_kref+0xa64
	.word	0xe8862018	! t0_kref+0xa64:   	lda	[%i0 + 0x18]%asi, %l4
	.word	0xe828a005	! t0_kref+0xa68:   	stb	%l4, [%g2 + 5]
	.word	0xc96e2018	! t0_kref+0xa6c:   	prefetch	%i0 + 0x18, 4
	.word	0x9fc10000	! t0_kref+0xa70:   	call	%g4
	.word	0xaeb2c013	! t0_kref+0xa74:   	orncc	%o3, %l3, %l7
	.word	0x9f33600a	! t0_kref+0xa78:   	srl	%o5, 0xa, %o7
	.word	0xde865000	! t0_kref+0xa7c:   	lda	[%i1]0x80, %o7
	.word	0xa0b4e7a8	! t0_kref+0xa80:   	orncc	%l3, 0x7a8, %l0
	call	SYM(t0_subr3)
	.word	0xaba4483a	! t0_kref+0xa88:   	fadds	%f17, %f26, %f21
	.word	0x25800001	! t0_kref+0xa8c:   	fblg,a	_kref+0xa90
	.word	0xaf350015	! t0_kref+0xa90:   	srl	%l4, %l5, %l7
	.word	0x86102020	! t0_kref+0xa94:   	mov	0x20, %g3
	.word	0x86a0e001	! t0_kref+0xa98:   	subcc	%g3, 1, %g3
	.word	0x2280000d	! t0_kref+0xa9c:   	be,a	_kref+0xad0
	.word	0xdac0a024	! t0_kref+0xaa0:   	ldswa	[%g2 + 0x24]%asi, %o5
	.word	0x81ab8ac0	! t0_kref+0xaa4:   	fcmped	%fcc0, %f14, %f0
	.word	0x9fc10000	! t0_kref+0xaa8:   	call	%g4
	.word	0x912d0012	! t0_kref+0xaac:   	sll	%l4, %l2, %o0
	.word	0xd81e3fe8	! t0_kref+0xab0:   	ldd	[%i0 - 0x18], %o4
	.word	0xc1be1896	! t0_kref+0xab4:   	stda	%f0, [%i0 + %l6]0xc4
	.word	0x81aac040	! t0_kref+0xab8:   	fmovdge	%fcc0, %f0, %f0
	.word	0x224ffff7	! t0_kref+0xabc:   	be,a,pt	%icc, _kref+0xa98
	.word	0xac2b2811	! t0_kref+0xac0:   	andn	%o4, 0x811, %l6
	.word	0x9fc10000	! t0_kref+0xac4:   	call	%g4
	.word	0xe6b67fe6	! t0_kref+0xac8:   	stha	%l3, [%i1 - 0x1a]%asi
	.word	0x81da60bd	! t0_kref+0xacc:   	flush	%o1 + 0xbd
	.word	0xe6070019	! t0_kref+0xad0:   	ld	[%i4 + %i1], %l3
	.word	0x9ec2c015	! t0_kref+0xad4:   	addccc	%o3, %l5, %o7
	.word	0xa0d2b4ec	! t0_kref+0xad8:   	umulcc	%o2, -0xb14, %l0
	.word	0xa69b7baa	! t0_kref+0xadc:   	xorcc	%o5, -0x456, %l3
	call	SYM(t0_subr3)
	.word	0xcd20a008	! t0_kref+0xae4:   	st	%f6, [%g2 + 8]
	.word	0xaa5dfe71	! t0_kref+0xae8:   	smul	%l7, -0x18f, %l5
	.word	0xecee101a	! t0_kref+0xaec:   	ldstuba	[%i0 + %i2]0x80, %l6
	.word	0xea280018	! t0_kref+0xaf0:   	stb	%l5, [%g0 + %i0]
	.word	0xd8865000	! t0_kref+0xaf4:   	lda	[%i1]0x80, %o4
	.word	0xa6dce0db	! t0_kref+0xaf8:   	smulcc	%l3, 0xdb, %l3
	.word	0xa2e52378	! t0_kref+0xafc:   	subccc	%l4, 0x378, %l1
	.word	0x9a54ec8b	! t0_kref+0xb00:   	umul	%l3, 0xc8b, %o5
	.word	0xd620a028	! t0_kref+0xb04:   	st	%o3, [%g2 + 0x28]
	.word	0xc36e0013	! t0_kref+0xb08:   	prefetch	%i0 + %l3, 1
	.word	0x99aa4046	! t0_kref+0xb0c:   	fmovde	%fcc0, %f6, %f12
	.word	0xe6e8a02b	! t0_kref+0xb10:   	ldstuba	[%g2 + 0x2b]%asi, %l3
	.word	0xd6267fe4	! t0_kref+0xb14:   	st	%o3, [%i1 - 0x1c]
	.word	0x98de8014	! t0_kref+0xb18:   	smulcc	%i2, %l4, %o4
	.word	0xecfe3fe8	! t0_kref+0xb1c:   	swapa	[%i0 - 0x18]%asi, %l6
	.word	0xd87e601c	! t0_kref+0xb20:   	swap	[%i1 + 0x1c], %o4
!	.word	0x3f495526	! t0_kref+0xb24:   	fbo,a,pt	%fcc0, SYM(t0_subr3)
	   	fbo,a,pt	%fcc0, SYM(t0_subr3)
	.word	0x9e006570	! t0_kref+0xb28:   	add	%g1, 0x570, %o7
	.word	0xea563ff4	! t0_kref+0xb2c:   	ldsh	[%i0 - 0xc], %l5
	.word	0xc56e7ff8	! t0_kref+0xb30:   	prefetch	%i1 - 8, 2
	.word	0x87a24936	! t0_kref+0xb34:   	fmuls	%f9, %f22, %f3
	.word	0x37480003	! t0_kref+0xb38:   	fbge,a,pt	%fcc0, _kref+0xb44
	.word	0x9da00128	! t0_kref+0xb3c:   	fabss	%f8, %f14
	.word	0x9328001a	! t0_kref+0xb40:   	sll	%g0, %i2, %o1
	.word	0xea367fe8	! t0_kref+0xb44:   	sth	%l5, [%i1 - 0x18]
	.word	0xd030a020	! t0_kref+0xb48:   	sth	%o0, [%g2 + 0x20]
	.word	0xa7a04829	! t0_kref+0xb4c:   	fadds	%f1, %f9, %f19
	.word	0x33480003	! t0_kref+0xb50:   	fbe,a,pt	%fcc0, _kref+0xb5c
	.word	0xafa00034	! t0_kref+0xb54:   	fmovs	%f20, %f23
	.word	0xf76e3ff8	! t0_kref+0xb58:   	prefetch	%i0 - 8, 27
	.word	0x8da50939	! t0_kref+0xb5c:   	fmuls	%f20, %f25, %f6
	.word	0x925d6545	! t0_kref+0xb60:   	smul	%l5, 0x545, %o1
	.word	0xf207bfe0	! t0_kref+0xb64:   	ld	[%fp - 0x20], %i1
	.word	0x81830000	! t0_kref+0xb68:   	wr	%o4, %g0, %y
	.word	0x86102017	! t0_kref+0xb6c:   	mov	0x17, %g3
	.word	0x86a0e001	! t0_kref+0xb70:   	subcc	%g3, 1, %g3
	.word	0x2280001d	! t0_kref+0xb74:   	be,a	_kref+0xbe8
	.word	0xac62c016	! t0_kref+0xb78:   	subc	%o3, %l6, %l6
	.word	0xec00a008	! t0_kref+0xb7c:   	ld	[%g2 + 8], %l6
	call	SYM(t0_subr2)
	.word	0xc7a0a004	! t0_kref+0xb84:   	sta	%f3, [%g2 + 4]%asi
	.word	0xa93aa008	! t0_kref+0xb88:   	sra	%o2, 0x8, %l4
	.word	0x81aa0ab3	! t0_kref+0xb8c:   	fcmpes	%fcc0, %f8, %f19
	.word	0x98db0017	! t0_kref+0xb90:   	smulcc	%o4, %l7, %o4
	.word	0xe8a0a010	! t0_kref+0xb94:   	sta	%l4, [%g2 + 0x10]%asi
	.word	0xe856001b	! t0_kref+0xb98:   	ldsh	[%i0 + %i3], %l4
	.word	0xa8db400a	! t0_kref+0xb9c:   	smulcc	%o5, %o2, %l4
	.word	0xe676001d	! t0_kref+0xba0:   	stx	%l3, [%i0 + %i5]
	.word	0xe2f81019	! t0_kref+0xba4:   	swapa	[%g0 + %i1]0x80, %l1
	.word	0xe7ee501c	! t0_kref+0xba8:   	prefetcha	%i1 + %i4, 19
	.word	0xd2871059	! t0_kref+0xbac:   	lda	[%i4 + %i1]0x82, %o1
	.word	0x9e8c8000	! t0_kref+0xbb0:   	andcc	%l2, %g0, %o7
!	.word	0x2cbf3d11	! t0_kref+0xbb4:   	bneg,a	SYM(t0_subr2)
	   	bneg,a	SYM(t0_subr2)
	.word	0x9e006600	! t0_kref+0xbb8:   	add	%g1, 0x600, %o7
	.word	0xada0015a	! t0_kref+0xbbc:   	fabsd	%f26, %f22
	.word	0xc19e9a19	! t0_kref+0xbc0:   	ldda	[%i2 + %i1]0xd0, %f0
	.word	0xc11fbde0	! t0_kref+0xbc4:   	ldd	[%fp - 0x220], %f0
	.word	0xa8d00009	! t0_kref+0xbc8:   	umulcc	%g0, %o1, %l4
	.word	0x264fffe9	! t0_kref+0xbcc:   	bl,a,pt	%icc, _kref+0xb70
	.word	0x83a508ba	! t0_kref+0xbd0:   	fsubs	%f20, %f26, %f1
	.word	0xe830a018	! t0_kref+0xbd4:   	sth	%l4, [%g2 + 0x18]
	.word	0x81a98ad4	! t0_kref+0xbd8:   	fcmped	%fcc0, %f6, %f20
	.word	0xa07cc017	! t0_kref+0xbdc:   	sdiv	%l3, %l7, %l0
	.word	0xada01a35	! t0_kref+0xbe0:   	fstoi	%f21, %f22
	.word	0x9462c01a	! t0_kref+0xbe4:   	subc	%o3, %i2, %o2
	.word	0xa2d4c012	! t0_kref+0xbe8:   	umulcc	%l3, %l2, %l1
	.word	0x925a000a	! t0_kref+0xbec:   	smul	%o0, %o2, %o1
	.word	0x2d800003	! t0_kref+0xbf0:   	fbg,a	_kref+0xbfc
	.word	0xa0e5eb22	! t0_kref+0xbf4:   	subccc	%l7, 0xb22, %l0
	.word	0xafa10833	! t0_kref+0xbf8:   	fadds	%f4, %f19, %f23
	.word	0xd13e7fe8	! t0_kref+0xbfc:   	std	%f8, [%i1 - 0x18]
	.word	0xaa5cc017	! t0_kref+0xc00:   	smul	%l3, %l7, %l5
	.word	0x001fffff	! t0_kref+0xc04:   	illtrap	0x1fffff
	.word	0xa4958009	! t0_kref+0xc08:   	orcc	%l6, %o1, %l2
	.word	0x9a9ae11a	! t0_kref+0xc0c:   	xorcc	%o3, 0x11a, %o5
	.word	0x8da54d32	! t0_kref+0xc10:   	fsmuld	%f21, %f18, %f6
	.word	0x81da4012	! t0_kref+0xc14:   	flush	%o1 + %l2
	.word	0x9f1a4017	! t0_kref+0xc18:   	tsubcctv	%o1, %l7, %o7
	.word	0xe11e001d	! t0_kref+0xc1c:   	ldd	[%i0 + %i5], %f16
	.word	0xcd00a020	! t0_kref+0xc20:   	ld	[%g2 + 0x20], %f6
	.word	0xec50a026	! t0_kref+0xc24:   	ldsh	[%g2 + 0x26], %l6
	.word	0xdd3e2018	! t0_kref+0xc28:   	std	%f14, [%i0 + 0x18]
	.word	0x9fa1882e	! t0_kref+0xc2c:   	fadds	%f6, %f14, %f15
	.word	0xf4366000	! t0_kref+0xc30:   	sth	%i2, [%i1]
	.word	0x3d800008	! t0_kref+0xc34:   	fbule,a	_kref+0xc54
	.word	0x981a77e1	! t0_kref+0xc38:   	xor	%o1, -0x81f, %o4
	.word	0x81a90ab4	! t0_kref+0xc3c:   	fcmpes	%fcc0, %f4, %f20
	.word	0xe4fe3ff0	! t0_kref+0xc40:   	swapa	[%i0 - 0x10]%asi, %l2
	.word	0x9da01a4e	! t0_kref+0xc44:   	fdtoi	%f14, %f14
	.word	0x23800008	! t0_kref+0xc48:   	fbne,a	_kref+0xc68
	.word	0xa1a2492d	! t0_kref+0xc4c:   	fmuls	%f9, %f13, %f16
	.word	0xe85e3ff8	! t0_kref+0xc50:   	ldx	[%i0 - 8], %l4
	.word	0xaba20925	! t0_kref+0xc54:   	fmuls	%f8, %f5, %f21
	.word	0x3b800003	! t0_kref+0xc58:   	fble,a	_kref+0xc64
	.word	0xc07e2010	! t0_kref+0xc5c:   	swap	[%i0 + 0x10], %g0
	.word	0xe8764000	! t0_kref+0xc60:   	stx	%l4, [%i1]
	.word	0xa41dff4d	! t0_kref+0xc64:   	xor	%l7, -0xb3, %l2
	.word	0xc76e400a	! t0_kref+0xc68:   	prefetch	%i1 + %o2, 3
	.word	0xada28d30	! t0_kref+0xc6c:   	fsmuld	%f10, %f16, %f22
	.word	0x9a60000d	! t0_kref+0xc70:   	subc	%g0, %o5, %o5
	.word	0x91408000	! t0_kref+0xc74:   	mov	%ccr, %o0
	.word	0x94750014	! t0_kref+0xc78:   	udiv	%l4, %l4, %o2
	.word	0xd09e3ff0	! t0_kref+0xc7c:   	ldda	[%i0 - 0x10]%asi, %o0
	.word	0xea363ff8	! t0_kref+0xc80:   	sth	%l5, [%i0 - 8]
	.word	0xaa3b3ac9	! t0_kref+0xc84:   	xnor	%o4, -0x537, %l5
	.word	0xf4266010	! t0_kref+0xc88:   	st	%i2, [%i1 + 0x10]
	.word	0xe9ee101b	! t0_kref+0xc8c:   	prefetcha	%i0 + %i3, 20
	.word	0xa9a1c8b0	! t0_kref+0xc90:   	fsubs	%f7, %f16, %f20
	.word	0x8143e040	! t0_kref+0xc94:   	membar	0x40
	.word	0x94822b0e	! t0_kref+0xc98:   	addcc	%o0, 0xb0e, %o2
	.word	0x9fc10000	! t0_kref+0xc9c:   	call	%g4
	.word	0xf207bfe0	! t0_kref+0xca0:   	ld	[%fp - 0x20], %i1
	.word	0xe4000018	! t0_kref+0xca4:   	ld	[%g0 + %i0], %l2
	.word	0x9e0066f8	! t0_kref+0xca8:   	add	%g1, 0x6f8, %o7
!	.word	0x3abf3cd3	! t0_kref+0xcac:   	bcc,a	SYM(t0_subr2)
	   	bcc,a	SYM(t0_subr2)
	.word	0x8fa01a50	! t0_kref+0xcb0:   	fdtoi	%f16, %f7
	.word	0x97400000	! t0_kref+0xcb4:   	mov	%y, %o3
	.word	0xada00156	! t0_kref+0xcb8:   	fabsd	%f22, %f22
	.word	0x29800005	! t0_kref+0xcbc:   	fbl,a	_kref+0xcd0
	.word	0x8d84bbe4	! t0_kref+0xcc0:   	wr	%l2, 0xfffffbe4, %fprs
	.word	0x9fc00004	! t0_kref+0xcc4:   	call	%g0 + %g4
	.word	0x001fffff	! t0_kref+0xcc8:   	illtrap	0x1fffff
	.word	0x97a4c9b3	! t0_kref+0xccc:   	fdivs	%f19, %f19, %f11
	.word	0x9002c008	! t0_kref+0xcd0:   	add	%o3, %o0, %o0
	.word	0xf430a02c	! t0_kref+0xcd4:   	sth	%i2, [%g2 + 0x2c]
	.word	0x96bb000c	! t0_kref+0xcd8:   	xnorcc	%o4, %o4, %o3
	.word	0xd820a034	! t0_kref+0xcdc:   	st	%o4, [%g2 + 0x34]
	.word	0xf19eda59	! t0_kref+0xce0:   	ldda	[%i3 + %i1]0xd2, %f24
	.word	0x9ed836fd	! t0_kref+0xce4:   	smulcc	%g0, -0x903, %o7
	.word	0x92e24000	! t0_kref+0xce8:   	subccc	%o1, %g0, %o1
	.word	0x9ae3400d	! t0_kref+0xcec:   	subccc	%o5, %o5, %o5
	.word	0x99a000cc	! t0_kref+0xcf0:   	fnegd	%f12, %f12
	.word	0xf120a004	! t0_kref+0xcf4:   	st	%f24, [%g2 + 4]
	.word	0x9da01920	! t0_kref+0xcf8:   	fstod	%f0, %f14
	.word	0xa45ea0a8	! t0_kref+0xcfc:   	smul	%i2, 0xa8, %l2
	.word	0xa4bd70b5	! t0_kref+0xd00:   	xnorcc	%l5, -0xf4b, %l2
	.word	0xd9be188d	! t0_kref+0xd04:   	stda	%f12, [%i0 + %o5]0xc4
	.word	0xa8048000	! t0_kref+0xd08:   	add	%l2, %g0, %l4
	.word	0x33800005	! t0_kref+0xd0c:   	fbe,a	_kref+0xd20
	.word	0x90632c5a	! t0_kref+0xd10:   	subc	%o4, 0xc5a, %o0
	.word	0x81de6efc	! t0_kref+0xd14:   	flush	%i1 + 0xefc
	.word	0x21480008	! t0_kref+0xd18:   	fbn,a,pt	%fcc0, _kref+0xd38
	.word	0x9602309a	! t0_kref+0xd1c:   	add	%o0, -0xf66, %o3
	.word	0xc5a0a00c	! t0_kref+0xd20:   	sta	%f2, [%g2 + 0xc]%asi
	.word	0xb1a3cd26	! t0_kref+0xd24:   	fsmuld	%f15, %f6, %f24
	.word	0x8d82000b	! t0_kref+0xd28:   	wr	%o0, %o3, %fprs
	.word	0xab400000	! t0_kref+0xd2c:   	mov	%y, %l5
	.word	0xa87c800c	! t0_kref+0xd30:   	sdiv	%l2, %o4, %l4
	.word	0xa27cef63	! t0_kref+0xd34:   	sdiv	%l3, 0xf63, %l1
	.word	0xe5ee101d	! t0_kref+0xd38:   	prefetcha	%i0 + %i5, 18
	.word	0x9736a00e	! t0_kref+0xd3c:   	srl	%i2, 0xe, %o3
	.word	0xaef28014	! t0_kref+0xd40:   	udivcc	%o2, %l4, %l7
	.word	0xa07ebbdc	! t0_kref+0xd44:   	sdiv	%i2, -0x424, %l0
	.word	0xa3400000	! t0_kref+0xd48:   	mov	%y, %l1
	.word	0x96b22f63	! t0_kref+0xd4c:   	orncc	%o0, 0xf63, %o3
	.word	0xda80a000	! t0_kref+0xd50:   	lda	[%g2]%asi, %o5
	.word	0x96d5bf5a	! t0_kref+0xd54:   	umulcc	%l6, -0xa6, %o3
	.word	0xd04e8019	! t0_kref+0xd58:   	ldsb	[%i2 + %i1], %o0
	.word	0x89a60823	! t0_kref+0xd5c:   	fadds	%f24, %f3, %f4
	.word	0x20480008	! t0_kref+0xd60:   	bn,a,pt	%icc, _kref+0xd80
	.word	0xd07e3fe8	! t0_kref+0xd64:   	swap	[%i0 - 0x18], %o0
	.word	0xe8264000	! t0_kref+0xd68:   	st	%l4, [%i1]
	.word	0x9b408000	! t0_kref+0xd6c:   	mov	%ccr, %o5
	.word	0xd87f0018	! t0_kref+0xd70:   	swap	[%i4 + %i0], %o4
	.word	0xaaf80012	! t0_kref+0xd74:   	sdivcc	%g0, %l2, %l5
	.word	0xf1ee101c	! t0_kref+0xd78:   	prefetcha	%i0 + %i4, 24
	.word	0x9ae27fba	! t0_kref+0xd7c:   	subccc	%o1, -0x46, %o5
	.word	0xf420a014	! t0_kref+0xd80:   	st	%i2, [%g2 + 0x14]
	.word	0xf36e3ff8	! t0_kref+0xd84:   	prefetch	%i0 - 8, 25
	.word	0xe4086820	! t0_kref+0xd88:   	ldub	[%g1 + 0x820], %l2
	.word	0xa41ca00c	! t0_kref+0xd8c:   	xor	%l2, 0xc, %l2
	.word	0xe4286820	! t0_kref+0xd90:   	stb	%l2, [%g1 + 0x820]
	.word	0x81d86820	! t0_kref+0xd94:   	flush	%g1 + 0x820
	.word	0x9fc00004	! t0_kref+0xd98:   	call	%g0 + %g4
	.word	0xda871018	! t0_kref+0xd9c:   	lda	[%i4 + %i0]0x80, %o5
	.word	0x81daa9b5	! t0_kref+0xda0:   	flush	%o2 + 0x9b5
	.word	0x8182c000	! t0_kref+0xda4:   	wr	%o3, %g0, %y
	.word	0x95418000	! t0_kref+0xda8:   	mov	%fprs, %o2
	.word	0x81a90ac4	! t0_kref+0xdac:   	fcmped	%fcc0, %f4, %f4
	.word	0xd44e2009	! t0_kref+0xdb0:   	ldsb	[%i0 + 9], %o2
	.word	0x9da01927	! t0_kref+0xdb4:   	fstod	%f7, %f14
	.word	0xef00a004	! t0_kref+0xdb8:   	ld	[%g2 + 4], %f23
	.word	0x81834000	! t0_kref+0xdbc:   	wr	%o5, %g0, %y
	.word	0x81ab8a40	! t0_kref+0xdc0:   	fcmpd	%fcc0, %f14, %f0
	.word	0x9104e8da	! t0_kref+0xdc4:   	taddcc	%l3, 0x8da, %o0
	.word	0x9ae5f36f	! t0_kref+0xdc8:   	subccc	%l7, -0xc91, %o5
	.word	0xa9400000	! t0_kref+0xdcc:   	mov	%y, %l4
	.word	0x9f35200d	! t0_kref+0xdd0:   	srl	%l4, 0xd, %o7
2:	.word	0xa64336cb	! t0_kref+0xdd4:   	addc	%o4, -0x935, %l3
	.word	0xe4086870	! t0_kref+0xdd8:   	ldub	[%g1 + 0x870], %l2
	.word	0xa41ca00c	! t0_kref+0xddc:   	xor	%l2, 0xc, %l2
	.word	0xe4286870	! t0_kref+0xde0:   	stb	%l2, [%g1 + 0x870]
	.word	0x81d86870	! t0_kref+0xde4:   	flush	%g1 + 0x870
	.word	0xa3a4492d	! t0_kref+0xde8:   	fmuls	%f17, %f13, %f17
	.word	0xb5a8c044	! t0_kref+0xdec:   	fmovdul	%fcc0, %f4, %f26
	.word	0xa1a01a33	! t0_kref+0xdf0:   	fstoi	%f19, %f16
	.word	0x9b400000	! t0_kref+0xdf4:   	mov	%y, %o5
	.word	0x9332600a	! t0_kref+0xdf8:   	srl	%o1, 0xa, %o1
	.word	0xacd027af	! t0_kref+0xdfc:   	umulcc	%g0, 0x7af, %l6
	.word	0x9da5cd2b	! t0_kref+0xe00:   	fsmuld	%f23, %f11, %f14
	.word	0xaca2400a	! t0_kref+0xe04:   	subcc	%o1, %o2, %l6
	.word	0x9f36a009	! t0_kref+0xe08:   	srl	%i2, 0x9, %o7
	.word	0xe91fbc10	! t0_kref+0xe0c:   	ldd	[%fp - 0x3f0], %f20
	.word	0x92f20000	! t0_kref+0xe10:   	udivcc	%o0, %g0, %o1
	.word	0xb1a01026	! t0_kref+0xe14:   	fstox	%f6, %f24
	.word	0x91a0005a	! t0_kref+0xe18:   	fmovd	%f26, %f8
	.word	0x8ba1492b	! t0_kref+0xe1c:   	fmuls	%f5, %f11, %f5
	.word	0xd2560000	! t0_kref+0xe20:   	ldsh	[%i0], %o1
2:	.word	0xaa04e72a	! t0_kref+0xe24:   	add	%l3, 0x72a, %l5
	.word	0xda20a018	! t0_kref+0xe28:   	st	%o5, [%g2 + 0x18]
	.word	0xe456201c	! t0_kref+0xe2c:   	ldsh	[%i0 + 0x1c], %l2
	.word	0x37800008	! t0_kref+0xe30:   	fbge,a	_kref+0xe50
	.word	0xa006ac93	! t0_kref+0xe34:   	add	%i2, 0xc93, %l0
	.word	0x2d800003	! t0_kref+0xe38:   	fbg,a	_kref+0xe44
	.word	0x9498000b	! t0_kref+0xe3c:   	xorcc	%g0, %o3, %o2
	.word	0xd2567ff4	! t0_kref+0xe40:   	ldsh	[%i1 - 0xc], %o1
	.word	0x27800008	! t0_kref+0xe44:   	fbul,a	_kref+0xe64
	.word	0xa9400000	! t0_kref+0xe48:   	mov	%y, %l4
	.word	0xedee501b	! t0_kref+0xe4c:   	prefetcha	%i1 + %i3, 22
	.word	0xab418000	! t0_kref+0xe50:   	mov	%fprs, %l5
	.word	0xf436001b	! t0_kref+0xe54:   	sth	%i2, [%i0 + %i3]
	.word	0xe248a028	! t0_kref+0xe58:   	ldsb	[%g2 + 0x28], %l1
	.word	0xad2de01b	! t0_kref+0xe5c:   	sll	%l7, 0x1b, %l6
	.word	0xa514bec4	! t0_kref+0xe60:   	taddcctv	%l2, -0x13c, %l2
	.word	0x38480001	! t0_kref+0xe64:   	bgu,a,pt	%icc, _kref+0xe68
	.word	0xd8180019	! t0_kref+0xe68:   	ldd	[%g0 + %i1], %o4
	.word	0x38800005	! t0_kref+0xe6c:   	bgu,a	_kref+0xe80
	.word	0xc99e1a5c	! t0_kref+0xe70:   	ldda	[%i0 + %i4]0xd2, %f4
	.word	0xb3a4c936	! t0_kref+0xe74:   	fmuls	%f19, %f22, %f25
	.word	0x91a04931	! t0_kref+0xe78:   	fmuls	%f1, %f17, %f8
	.word	0xac5aa7ac	! t0_kref+0xe7c:   	smul	%o2, 0x7ac, %l6
	.word	0xae9b7a1e	! t0_kref+0xe80:   	xorcc	%o5, -0x5e2, %l7
	.word	0xa3a44924	! t0_kref+0xe84:   	fmuls	%f17, %f4, %f17
	.word	0xa404f5b4	! t0_kref+0xe88:   	add	%l3, -0xa4c, %l2
	.word	0xd4c0a038	! t0_kref+0xe8c:   	ldswa	[%g2 + 0x38]%asi, %o2
	.word	0xec4e3fe9	! t0_kref+0xe90:   	ldsb	[%i0 - 0x17], %l6
	.word	0xee480019	! t0_kref+0xe94:   	ldsb	[%g0 + %i1], %l7
	.word	0x33800002	! t0_kref+0xe98:   	fbe,a	_kref+0xea0
	.word	0x99a58d3a	! t0_kref+0xe9c:   	fsmuld	%f22, %f26, %f12
	.word	0xd07e001c	! t0_kref+0xea0:   	swap	[%i0 + %i4], %o0
	.word	0xee280019	! t0_kref+0xea4:   	stb	%l7, [%g0 + %i1]
	.word	0x81a80ab3	! t0_kref+0xea8:   	fcmpes	%fcc0, %f0, %f19
	.word	0xd8a0a00c	! t0_kref+0xeac:   	sta	%o4, [%g2 + 0xc]%asi
	.word	0x81dfe06d	! t0_kref+0xeb0:   	flush	%i7 + 0x6d
	.word	0x92dd330c	! t0_kref+0xeb4:   	smulcc	%l4, -0xcf4, %o1
	.word	0x97a64926	! t0_kref+0xeb8:   	fmuls	%f25, %f6, %f11
	.word	0x23800007	! t0_kref+0xebc:   	fbne,a	_kref+0xed8
	.word	0xa935a001	! t0_kref+0xec0:   	srl	%l6, 0x1, %l4
	.word	0x38480008	! t0_kref+0xec4:   	bgu,a,pt	%icc, _kref+0xee4
	.word	0xd890a010	! t0_kref+0xec8:   	lduha	[%g2 + 0x10]%asi, %o4
	.word	0x9b400000	! t0_kref+0xecc:   	mov	%y, %o5
	.word	0xa88d280c	! t0_kref+0xed0:   	andcc	%l4, 0x80c, %l4
	.word	0xacba400c	! t0_kref+0xed4:   	xnorcc	%o1, %o4, %l6
	.word	0x8143c000	! t0_kref+0xed8:   	stbar
	.word	0x3d800003	! t0_kref+0xedc:   	fbule,a	_kref+0xee8
	.word	0xb5a48858	! t0_kref+0xee0:   	faddd	%f18, %f24, %f26
	.word	0xa47b6a7f	! t0_kref+0xee4:   	sdiv	%o5, 0xa7f, %l2
	.word	0x9a7b000b	! t0_kref+0xee8:   	sdiv	%o4, %o3, %o5
	.word	0x9de3bfa0	! t0_kref+0xeec:   	save	%sp, -0x60, %sp
	.word	0xa1ef750a	! t0_kref+0xef0:   	restore	%i5, -0xaf6, %l0
	.word	0x81ad0ab5	! t0_kref+0xef4:   	fcmpes	%fcc0, %f20, %f21
	.word	0xc030a026	! t0_kref+0xef8:   	clrh	[%g2 + 0x26]
	.word	0x9340c000	! t0_kref+0xefc:   	mov	%asi, %o1
	.word	0x8da4092b	! t0_kref+0xf00:   	fmuls	%f16, %f11, %f6
	.word	0xd01f4019	! t0_kref+0xf04:   	ldd	[%i5 + %i1], %o0
	.word	0xa6382b27	! t0_kref+0xf08:   	xnor	%g0, 0xb27, %l3
	.word	0xec10a02c	! t0_kref+0xf0c:   	lduh	[%g2 + 0x2c], %l6
	.word	0xcb00a030	! t0_kref+0xf10:   	ld	[%g2 + 0x30], %f5
	.word	0xe920a034	! t0_kref+0xf14:   	st	%f20, [%g2 + 0x34]
	.word	0x36480008	! t0_kref+0xf18:   	bge,a,pt	%icc, _kref+0xf38
	.word	0xf9ee501a	! t0_kref+0xf1c:   	prefetcha	%i1 + %i2, 28
	.word	0x93a108ad	! t0_kref+0xf20:   	fsubs	%f4, %f13, %f9
	.word	0xd8000019	! t0_kref+0xf24:   	ld	[%g0 + %i1], %o4
	call	SYM(t0_subr2)
	.word	0xa13d6019	! t0_kref+0xf2c:   	sra	%l5, 0x19, %l0
	.word	0x8d82ae90	! t0_kref+0xf30:   	wr	%o2, 0xe90, %fprs
	.word	0x81ad8a46	! t0_kref+0xf34:   	fcmpd	%fcc0, %f22, %f6
	.word	0xe8d0a026	! t0_kref+0xf38:   	ldsha	[%g2 + 0x26]%asi, %l4
	.word	0x95a00156	! t0_kref+0xf3c:   	fabsd	%f22, %f10
	.word	0xe290a030	! t0_kref+0xf40:   	lduha	[%g2 + 0x30]%asi, %l1
	.word	0xea28a00d	! t0_kref+0xf44:   	stb	%l5, [%g2 + 0xd]
	.word	0x92f03c28	! t0_kref+0xf48:   	udivcc	%g0, -0x3d8, %o1
	.word	0x8d82c014	! t0_kref+0xf4c:   	wr	%o3, %l4, %fprs
	.word	0xa5418000	! t0_kref+0xf50:   	mov	%fprs, %l2
	.word	0xe048a00f	! t0_kref+0xf54:   	ldsb	[%g2 + 0xf], %l0
	.word	0x9245a440	! t0_kref+0xf58:   	addc	%l6, 0x440, %o1
	.word	0xa9a01936	! t0_kref+0xf5c:   	fstod	%f22, %f20
	.word	0x93a649a3	! t0_kref+0xf60:   	fdivs	%f25, %f3, %f9
	.word	0x9af2f9bc	! t0_kref+0xf64:   	udivcc	%o3, -0x644, %o5
	.word	0x993ca01e	! t0_kref+0xf68:   	sra	%l2, 0x1e, %o4
	.word	0xc5e8a005	! t0_kref+0xf6c:   	prefetcha	%g2 + 5, 2
	.word	0xed6e401d	! t0_kref+0xf70:   	prefetch	%i1 + %i5, 22
	.word	0xf4a8a005	! t0_kref+0xf74:   	stba	%i2, [%g2 + 5]%asi
	.word	0xa49b001a	! t0_kref+0xf78:   	xorcc	%o4, %i2, %l2
	.word	0xf56e401b	! t0_kref+0xf7c:   	prefetch	%i1 + %i3, 26
	.word	0xfd6e2000	! t0_kref+0xf80:   	prefetch	%i0, 30
	.word	0x81a9caae	! t0_kref+0xf84:   	fcmpes	%fcc0, %f7, %f14
	.word	0xea280018	! t0_kref+0xf88:   	stb	%l5, [%g0 + %i0]
	.word	0x30800003	! t0_kref+0xf8c:   	ba,a	_kref+0xf98
	.word	0xc19e5a1d	! t0_kref+0xf90:   	ldda	[%i1 + %i5]0xd0, %f0
	.word	0xa69aee4d	! t0_kref+0xf94:   	xorcc	%o3, 0xe4d, %l3
	.word	0xd4ee2009	! t0_kref+0xf98:   	ldstuba	[%i0 + 9]%asi, %o2
	.word	0x9e02619d	! t0_kref+0xf9c:   	add	%o1, 0x19d, %o7
	.word	0xd81e3ff0	! t0_kref+0xfa0:   	ldd	[%i0 - 0x10], %o4
	.word	0xd6881018	! t0_kref+0xfa4:   	lduba	[%g0 + %i0]0x80, %o3
	.word	0x2c800001	! t0_kref+0xfa8:   	bneg,a	_kref+0xfac
	.word	0xa6a34008	! t0_kref+0xfac:   	subcc	%o5, %o0, %l3
	.word	0xe1f6501a	! t0_kref+0xfb0:   	casxa	[%i1]0x80, %i2, %l0
	.word	0x3c480003	! t0_kref+0xfb4:   	bpos,a,pt	%icc, _kref+0xfc0
	.word	0xd228a02d	! t0_kref+0xfb8:   	stb	%o1, [%g2 + 0x2d]
	.word	0x9fa0108e	! t0_kref+0xfbc:   	fxtos	%f14, %f15
	.word	0xc120a028	! t0_kref+0xfc0:   	st	%f0, [%g2 + 0x28]
	.word	0x8143e040	! t0_kref+0xfc4:   	membar	0x40
	.word	0x9e8d0015	! t0_kref+0xfc8:   	andcc	%l4, %l5, %o7
	.word	0x981ea99e	! t0_kref+0xfcc:   	xor	%i2, 0x99e, %o4
	.word	0xa28cc017	! t0_kref+0xfd0:   	andcc	%l3, %l7, %l1
	.word	0xe300a018	! t0_kref+0xfd4:   	ld	[%g2 + 0x18], %f17
	sethi	%hi(2f), %o7
	.word	0xe40be004	! t0_kref+0xfdc:   	ldub	[%o7 + 4], %l2
	.word	0xa41ca00c	! t0_kref+0xfe0:   	xor	%l2, 0xc, %l2
	.word	0xe42be004	! t0_kref+0xfe4:   	stb	%l2, [%o7 + 4]
	.word	0x81dbe004	! t0_kref+0xfe8:   	flush	%o7 + 4
	.word	0xd89e501d	! t0_kref+0xfec:   	ldda	[%i1 + %i5]0x80, %o4
	.word	0xda30a03c	! t0_kref+0xff0:   	sth	%o5, [%g2 + 0x3c]
	.word	0x3f800003	! t0_kref+0xff4:   	fbo,a	_kref+0x1000
	.word	0xaba0188e	! t0_kref+0xff8:   	fitos	%f14, %f21
	.word	0xa9a1892a	! t0_kref+0xffc:   	fmuls	%f6, %f10, %f20
	.word	0x29800005	! t0_kref+0x1000:   	fbl,a	_kref+0x1014
2:	.word	0x91a0cd38	! t0_kref+0x1004:   	fsmuld	%f3, %f24, %f8
	.word	0xa3a000a2	! t0_kref+0x1008:   	fnegs	%f2, %f17
	.word	0xb5a6092c	! t0_kref+0x100c:   	fmuls	%f24, %f12, %f26
	.word	0x22480005	! t0_kref+0x1010:   	be,a,pt	%icc, _kref+0x1024
	.word	0xf9ee501b	! t0_kref+0x1014:   	prefetcha	%i1 + %i3, 28
	.word	0xa91dc009	! t0_kref+0x1018:   	tsubcctv	%l7, %o1, %l4
	.word	0xa9a34934	! t0_kref+0x101c:   	fmuls	%f13, %f20, %f20
	.word	0xd4564000	! t0_kref+0x1020:   	ldsh	[%i1], %o2
	.word	0x2e480003	! t0_kref+0x1024:   	bvs,a,pt	%icc, _kref+0x1030
	.word	0x85a2884a	! t0_kref+0x1028:   	faddd	%f10, %f10, %f2
	.word	0xe87e6010	! t0_kref+0x102c:   	swap	[%i1 + 0x10], %l4
	.word	0x95a00140	! t0_kref+0x1030:   	fabsd	%f0, %f10
	.word	0x98c4c000	! t0_kref+0x1034:   	addccc	%l3, %g0, %o4
	.word	0xe6362002	! t0_kref+0x1038:   	sth	%l3, [%i0 + 2]
	.word	0x86102017	! t0_kref+0x103c:   	mov	0x17, %g3
	.word	0x86a0e001	! t0_kref+0x1040:   	subcc	%g3, 1, %g3
	.word	0x22800001	! t0_kref+0x1044:   	be,a	_kref+0x1048
	.word	0x9e88000c	! t0_kref+0x1048:   	andcc	%g0, %o4, %o7
	.word	0x3f800008	! t0_kref+0x104c:   	fbo,a	_kref+0x106c
	.word	0xa2b2e80a	! t0_kref+0x1050:   	orncc	%o3, 0x80a, %l1
	.word	0x81da0012	! t0_kref+0x1054:   	flush	%o0 + %l2
	.word	0xdd3e0000	! t0_kref+0x1058:   	std	%f14, [%i0]
	.word	0x89a00034	! t0_kref+0x105c:   	fmovs	%f20, %f4
	.word	0xc900a030	! t0_kref+0x1060:   	ld	[%g2 + 0x30], %f4
	.word	0x8da58834	! t0_kref+0x1064:   	fadds	%f22, %f20, %f6
	.word	0xda500019	! t0_kref+0x1068:   	ldsh	[%g0 + %i1], %o5
	.word	0xd84e7fe8	! t0_kref+0x106c:   	ldsb	[%i1 - 0x18], %o4
	.word	0x9a2c8013	! t0_kref+0x1070:   	andn	%l2, %l3, %o5
	.word	0xad0ac012	! t0_kref+0x1074:   	tsubcc	%o3, %l2, %l6
	.word	0x8fa00135	! t0_kref+0x1078:   	fabss	%f21, %f7
	.word	0xb3a01a33	! t0_kref+0x107c:   	fstoi	%f19, %f25
	call	SYM(t0_subr1)
	.word	0x8143c000	! t0_kref+0x1084:   	stbar
	.word	0xe500a030	! t0_kref+0x1088:   	ld	[%g2 + 0x30], %f18
	.word	0xd2b0a026	! t0_kref+0x108c:   	stha	%o1, [%g2 + 0x26]%asi
	.word	0x2b800006	! t0_kref+0x1090:   	fbug,a	_kref+0x10a8
	.word	0x9b26a7a1	! t0_kref+0x1094:   	mulscc	%i2, 0x7a1, %o5
	.word	0x96530015	! t0_kref+0x1098:   	umul	%o4, %l5, %o3
	.word	0xa61a8015	! t0_kref+0x109c:   	xor	%o2, %l5, %l3
	.word	0x81da22a1	! t0_kref+0x10a0:   	flush	%o0 + 0x2a1
	.word	0x96ae8015	! t0_kref+0x10a4:   	andncc	%i2, %l5, %o3
	.word	0xef6e401c	! t0_kref+0x10a8:   	prefetch	%i1 + %i4, 23
	.word	0xae8e8014	! t0_kref+0x10ac:   	andcc	%i2, %l4, %l7
	.word	0xa45abc5f	! t0_kref+0x10b0:   	smul	%o2, -0x3a1, %l2
	.word	0x28480006	! t0_kref+0x10b4:   	bleu,a,pt	%icc, _kref+0x10cc
	.word	0x81dd401c	! t0_kref+0x10b8:   	flush	%l5 + %i4
	.word	0xf430a038	! t0_kref+0x10bc:   	sth	%i2, [%g2 + 0x38]
	.word	0xaba2c9ae	! t0_kref+0x10c0:   	fdivs	%f11, %f14, %f21
	.word	0x95a000c4	! t0_kref+0x10c4:   	fnegd	%f4, %f10
	.word	0xd13e3ff8	! t0_kref+0x10c8:   	std	%f8, [%i0 - 8]
	.word	0xcd3e4000	! t0_kref+0x10cc:   	std	%f6, [%i1]
	.word	0xaa056d94	! t0_kref+0x10d0:   	add	%l5, 0xd94, %l5
	.word	0x81a0012b	! t0_kref+0x10d4:   	fabss	%f11, %f0
	.word	0xeda0a004	! t0_kref+0x10d8:   	sta	%f22, [%g2 + 4]%asi
	.word	0xcf20a014	! t0_kref+0x10dc:   	st	%f7, [%g2 + 0x14]
	.word	0x2f800002	! t0_kref+0x10e0:   	fbu,a	_kref+0x10e8
	.word	0xee4e6019	! t0_kref+0x10e4:   	ldsb	[%i1 + 0x19], %l7
	.word	0x953d0014	! t0_kref+0x10e8:   	sra	%l4, %l4, %o2
	.word	0x9f3d000a	! t0_kref+0x10ec:   	sra	%l4, %o2, %o7
	.word	0xaa9a6fff	! t0_kref+0x10f0:   	xorcc	%o1, 0xfff, %l5
	.word	0xd430a02a	! t0_kref+0x10f4:   	sth	%o2, [%g2 + 0x2a]
	.word	0x2a480001	! t0_kref+0x10f8:   	bcs,a,pt	%icc, _kref+0x10fc
	.word	0xc1a0a03c	! t0_kref+0x10fc:   	sta	%f0, [%g2 + 0x3c]%asi
	.word	0x9fc00004	! t0_kref+0x1100:   	call	%g0 + %g4
	.word	0xa01cf3ba	! t0_kref+0x1104:   	xor	%l3, -0xc46, %l0
	.word	0xe688a020	! t0_kref+0x1108:   	lduba	[%g2 + 0x20]%asi, %l3
	.word	0xab0dbb8f	! t0_kref+0x110c:   	tsubcc	%l6, -0x471, %l5
	.word	0xaba1892a	! t0_kref+0x1110:   	fmuls	%f6, %f10, %f21
	.word	0xca31401b	! t0_kref+0x1114:   	sth	%g5, [%g5 + %i3]
	.word	0xd6b63ff4	! t0_kref+0x1118:   	stha	%o3, [%i0 - 0xc]%asi
	.word	0xa33aa00a	! t0_kref+0x111c:   	sra	%o2, 0xa, %l1
	.word	0xaad2f9a5	! t0_kref+0x1120:   	umulcc	%o3, -0x65b, %l5
	.word	0x8610200b	! t0_kref+0x1124:   	mov	0xb, %g3
	.word	0x86a0e001	! t0_kref+0x1128:   	subcc	%g3, 1, %g3
	.word	0x22800017	! t0_kref+0x112c:   	be,a	_kref+0x1188
	.word	0xa854c016	! t0_kref+0x1130:   	umul	%l3, %l6, %l4
	.word	0xe828a017	! t0_kref+0x1134:   	stb	%l4, [%g2 + 0x17]
	.word	0x29bffffc	! t0_kref+0x1138:   	fbl,a	_kref+0x1128
	.word	0x9ef5400b	! t0_kref+0x113c:   	udivcc	%l5, %o3, %o7
	.word	0x85a0cd29	! t0_kref+0x1140:   	fsmuld	%f3, %f9, %f2
	.word	0xa665001a	! t0_kref+0x1144:   	subc	%l4, %i2, %l3
	.word	0x949d800a	! t0_kref+0x1148:   	xorcc	%l6, %o2, %o2
	.word	0xa6827404	! t0_kref+0x114c:   	addcc	%o1, -0xbfc, %l3
	.word	0xe16e001c	! t0_kref+0x1150:   	prefetch	%i0 + %i4, 16
	.word	0xecb61000	! t0_kref+0x1154:   	stha	%l6, [%i0]0x80
	.word	0x81ae8a50	! t0_kref+0x1158:   	fcmpd	%fcc0, %f26, %f16
	.word	0xe180a024	! t0_kref+0x115c:   	lda	[%g2 + 0x24]%asi, %f16
	.word	0x81ac0ace	! t0_kref+0x1160:   	fcmped	%fcc0, %f16, %f14
	.word	0xe628a003	! t0_kref+0x1164:   	stb	%l3, [%g2 + 3]
	.word	0xb3a000aa	! t0_kref+0x1168:   	fnegs	%f10, %f25
	.word	0xa4bac017	! t0_kref+0x116c:   	xnorcc	%o3, %l7, %l2
	.word	0xa40ab8fa	! t0_kref+0x1170:   	and	%o2, -0x706, %l2
	.word	0xd036c018	! t0_kref+0x1174:   	sth	%o0, [%i3 + %i0]
	.word	0xa6bea612	! t0_kref+0x1178:   	xnorcc	%i2, 0x612, %l3
	.word	0xa07ab2a0	! t0_kref+0x117c:   	sdiv	%o2, -0xd60, %l0
	.word	0xaeba8012	! t0_kref+0x1180:   	xnorcc	%o2, %l2, %l7
	.word	0xae84c012	! t0_kref+0x1184:   	addcc	%l3, %l2, %l7
	.word	0xffee101a	! t0_kref+0x1188:   	prefetcha	%i0 + %i2, 31
	.word	0xf13e0000	! t0_kref+0x118c:   	std	%f24, [%i0]
	.word	0x38480007	! t0_kref+0x1190:   	bgu,a,pt	%icc, _kref+0x11ac
	.word	0xd8f8a004	! t0_kref+0x1194:   	swapa	[%g2 + 4]%asi, %o4
	.word	0xa05dc012	! t0_kref+0x1198:   	smul	%l7, %l2, %l0
	.word	0x98bc8012	! t0_kref+0x119c:   	xnorcc	%l2, %l2, %o4
	.word	0x33800006	! t0_kref+0x11a0:   	fbe,a	_kref+0x11b8
	.word	0x9fa38825	! t0_kref+0x11a4:   	fadds	%f14, %f5, %f15
	.word	0x27800007	! t0_kref+0x11a8:   	fbul,a	_kref+0x11c4
	.word	0x9293401a	! t0_kref+0x11ac:   	orcc	%o5, %i2, %o1
	.word	0x81da21c9	! t0_kref+0x11b0:   	flush	%o0 + 0x1c9
	.word	0x81db8001	! t0_kref+0x11b4:   	flush	%sp + %g1
	.word	0xc96e001a	! t0_kref+0x11b8:   	prefetch	%i0 + %i2, 4
	.word	0xa9a08831	! t0_kref+0x11bc:   	fadds	%f2, %f17, %f20
	.word	0x9a924017	! t0_kref+0x11c0:   	orcc	%o1, %l7, %o5
	.word	0xd0300018	! t0_kref+0x11c4:   	sth	%o0, [%g0 + %i0]
	.word	0x81ad0ad4	! t0_kref+0x11c8:   	fcmped	%fcc0, %f20, %f20
	.word	0xc12e2004	! t0_kref+0x11cc:   	st	%fsr, [%i0 + 4]
	.word	0x2d800007	! t0_kref+0x11d0:   	fbg,a	_kref+0x11ec
	.word	0xe64e8019	! t0_kref+0x11d4:   	ldsb	[%i2 + %i1], %l3
	.word	0x97a01a32	! t0_kref+0x11d8:   	fstoi	%f18, %f11
	.word	0x992cc00b	! t0_kref+0x11dc:   	sll	%l3, %o3, %o4
	.word	0xd45e0000	! t0_kref+0x11e0:   	ldx	[%i0], %o2
	.word	0xde40a000	! t0_kref+0x11e4:   	ldsw	[%g2], %o7
	.word	0x9af5000b	! t0_kref+0x11e8:   	udivcc	%l4, %o3, %o5
	.word	0xeaa0a018	! t0_kref+0x11ec:   	sta	%l5, [%g2 + 0x18]%asi
	.word	0xd816c000	! t0_kref+0x11f0:   	lduh	[%i3], %o4
	.word	0xc0a8a031	! t0_kref+0x11f4:   	stba	%g0, [%g2 + 0x31]%asi
	.word	0xaf34e009	! t0_kref+0x11f8:   	srl	%l3, 0x9, %l7
	.word	0xaca20014	! t0_kref+0x11fc:   	subcc	%o0, %l4, %l6
	.word	0xe8a8a01a	! t0_kref+0x1200:   	stba	%l4, [%g2 + 0x1a]%asi
	.word	0x8da01a31	! t0_kref+0x1204:   	fstoi	%f17, %f6
	.word	0xd636601e	! t0_kref+0x1208:   	sth	%o3, [%i1 + 0x1e]
	.word	0xa1a508ad	! t0_kref+0x120c:   	fsubs	%f20, %f13, %f16
	.word	0x95a18d33	! t0_kref+0x1210:   	fsmuld	%f6, %f19, %f10
	.word	0xa43d6944	! t0_kref+0x1214:   	xnor	%l5, 0x944, %l2
	.word	0xae002076	! t0_kref+0x1218:   	add	%g0, 0x76, %l7
	.word	0xd11fbd10	! t0_kref+0x121c:   	ldd	[%fp - 0x2f0], %f8
!	.word	0x28815367	! t0_kref+0x1220:   	bleu,a	SYM(t0_subr3)
	   	bleu,a	SYM(t0_subr3)
	.word	0x9f414000	! t0_kref+0x1224:   	mov	%pc, %o7
	.word	0x99a40846	! t0_kref+0x1228:   	faddd	%f16, %f6, %f12
	.word	0x31800003	! t0_kref+0x122c:   	fba,a	_kref+0x1238
	.word	0xd8c8a029	! t0_kref+0x1230:   	ldsba	[%g2 + 0x29]%asi, %o4
	.word	0x9e5a8008	! t0_kref+0x1234:   	smul	%o2, %o0, %o7
	.word	0x25800003	! t0_kref+0x1238:   	fblg,a	_kref+0x1244
	.word	0xf007bfe0	! t0_kref+0x123c:   	ld	[%fp - 0x20], %i0
	.word	0x8da14d39	! t0_kref+0x1240:   	fsmuld	%f5, %f25, %f6
	.word	0xc3a0a03c	! t0_kref+0x1244:   	sta	%f1, [%g2 + 0x3c]%asi
	.word	0xe4086cbc	! t0_kref+0x1248:   	ldub	[%g1 + 0xcbc], %l2
	.word	0xa41ca00c	! t0_kref+0x124c:   	xor	%l2, 0xc, %l2
	.word	0xe4286cbc	! t0_kref+0x1250:   	stb	%l2, [%g1 + 0xcbc]
	.word	0x81d86cbc	! t0_kref+0x1254:   	flush	%g1 + 0xcbc
	.word	0x87a34821	! t0_kref+0x1258:   	fadds	%f13, %f1, %f3
	.word	0xa1a309da	! t0_kref+0x125c:   	fdivd	%f12, %f26, %f16
	.word	0x9f408000	! t0_kref+0x1260:   	mov	%ccr, %o7
	.word	0xe6a8a028	! t0_kref+0x1264:   	stba	%l3, [%g2 + 0x28]%asi
	.word	0xda7e001c	! t0_kref+0x1268:   	swap	[%i0 + %i4], %o5
	.word	0xa045a42f	! t0_kref+0x126c:   	addc	%l6, 0x42f, %l0
2:	.word	0x9ac5e4b2	! t0_kref+0x1270:   	addccc	%l7, 0x4b2, %o5
	.word	0xa3400000	! t0_kref+0x1274:   	mov	%y, %l1
	.word	0xc53e4000	! t0_kref+0x1278:   	std	%f2, [%i1]
	.word	0x36480007	! t0_kref+0x127c:   	bge,a,pt	%icc, _kref+0x1298
	.word	0xf420a000	! t0_kref+0x1280:   	st	%i2, [%g2]
	.word	0xa6180016	! t0_kref+0x1284:   	xor	%g0, %l6, %l3
	.word	0x8fa01a21	! t0_kref+0x1288:   	fstoi	%f1, %f7
	.word	0xb3a148a0	! t0_kref+0x128c:   	fsubs	%f5, %f0, %f25
	.word	0xec26001c	! t0_kref+0x1290:   	st	%l6, [%i0 + %i4]
	.word	0xb5a1c830	! t0_kref+0x1294:   	fadds	%f7, %f16, %f26
	.word	0xa73c8008	! t0_kref+0x1298:   	sra	%l2, %o0, %l3
	call	SYM(t0_subr3)
	.word	0xe24e6015	! t0_kref+0x12a0:   	ldsb	[%i1 + 0x15], %l1
	.word	0x9e620000	! t0_kref+0x12a4:   	subc	%o0, %g0, %o7
	.word	0xac7b0015	! t0_kref+0x12a8:   	sdiv	%o4, %l5, %l6
	.word	0x9534c009	! t0_kref+0x12ac:   	srl	%l3, %o1, %o2
	.word	0xd820a018	! t0_kref+0x12b0:   	st	%o4, [%g2 + 0x18]
	.word	0x85832428	! t0_kref+0x12b4:   	wr	%o4, 0x428, %ccr
	.word	0x81a2c925	! t0_kref+0x12b8:   	fmuls	%f11, %f5, %f0
	.word	0xc306001c	! t0_kref+0x12bc:   	ld	[%i0 + %i4], %f1
	.word	0x91a589a8	! t0_kref+0x12c0:   	fdivs	%f22, %f8, %f8
	.word	0xee20a010	! t0_kref+0x12c4:   	st	%l7, [%g2 + 0x10]
	.word	0x3f800004	! t0_kref+0x12c8:   	fbo,a	_kref+0x12d8
	.word	0x95aa8052	! t0_kref+0x12cc:   	fmovdue	%fcc0, %f18, %f10
	.word	0x3e480006	! t0_kref+0x12d0:   	bvc,a,pt	%icc, _kref+0x12e8
	.word	0x81dc8000	! t0_kref+0x12d4:   	flush	%l2
	.word	0xd428a00f	! t0_kref+0x12d8:   	stb	%o2, [%g2 + 0xf]
	.word	0xa9a00039	! t0_kref+0x12dc:   	fmovs	%f25, %f20
	.word	0xe856c018	! t0_kref+0x12e0:   	ldsh	[%i3 + %i0], %l4
	.word	0x81dcf1a9	! t0_kref+0x12e4:   	flush	%l3 - 0xe57
	.word	0xc1be184b	! t0_kref+0x12e8:   	stda	%f0, [%i0 + %o3]0xc2
	.word	0xea28355c	! t0_kref+0x12ec:   	stb	%l5, [%g0 - 0xaa4]
	.word	0xcf064000	! t0_kref+0x12f0:   	ld	[%i1], %f7
	.word	0xf7ee501a	! t0_kref+0x12f4:   	prefetcha	%i1 + %i2, 27
	.word	0x94d56740	! t0_kref+0x12f8:   	umulcc	%l5, 0x740, %o2
	.word	0x92e4c00d	! t0_kref+0x12fc:   	subccc	%l3, %o5, %o1
	.word	0xf16e7ff8	! t0_kref+0x1300:   	prefetch	%i1 - 8, 24
	.word	0x83a60826	! t0_kref+0x1304:   	fadds	%f24, %f6, %f1
	.word	0xb3a50833	! t0_kref+0x1308:   	fadds	%f20, %f19, %f25
	.word	0xe4086d98	! t0_kref+0x130c:   	ldub	[%g1 + 0xd98], %l2
	.word	0xa41ca00c	! t0_kref+0x1310:   	xor	%l2, 0xc, %l2
	.word	0xe4286d98	! t0_kref+0x1314:   	stb	%l2, [%g1 + 0xd98]
	.word	0x81d86d98	! t0_kref+0x1318:   	flush	%g1 + 0xd98
	.word	0xaef8001a	! t0_kref+0x131c:   	sdivcc	%g0, %i2, %l7
	.word	0xea30a022	! t0_kref+0x1320:   	sth	%l5, [%g2 + 0x22]
	.word	0x81ac8ada	! t0_kref+0x1324:   	fcmped	%fcc0, %f18, %f26
	.word	0xd60e7ffa	! t0_kref+0x1328:   	ldub	[%i1 - 6], %o3
	.word	0x87a34938	! t0_kref+0x132c:   	fmuls	%f13, %f24, %f3
	.word	0x81aa8a4a	! t0_kref+0x1330:   	fcmpd	%fcc0, %f10, %f10
	.word	0x94d3401a	! t0_kref+0x1334:   	umulcc	%o5, %i2, %o2
	.word	0xd4266000	! t0_kref+0x1338:   	st	%o2, [%i1]
	.word	0xf16e401d	! t0_kref+0x133c:   	prefetch	%i1 + %i5, 24
	.word	0xde0e7ff9	! t0_kref+0x1340:   	ldub	[%i1 - 7], %o7
	.word	0xa1268017	! t0_kref+0x1344:   	mulscc	%i2, %l7, %l0
	.word	0xd1be5808	! t0_kref+0x1348:   	stda	%f8, [%i1 + %o0]0xc0
2:	.word	0x85a01080	! t0_kref+0x134c:   	fxtos	%f0, %f2
	.word	0xea56201c	! t0_kref+0x1350:   	ldsh	[%i0 + 0x1c], %l5
	.word	0xe2f81018	! t0_kref+0x1354:   	swapa	[%g0 + %i0]0x80, %l1
	.word	0xaa7a4009	! t0_kref+0x1358:   	sdiv	%o1, %o1, %l5
	.word	0xac627051	! t0_kref+0x135c:   	subc	%o1, -0xfaf, %l6
	.word	0x3f800006	! t0_kref+0x1360:   	fbo,a	_kref+0x1378
	.word	0xe96e3fe0	! t0_kref+0x1364:   	prefetch	%i0 - 0x20, 20
	.word	0xc1e8a085	! t0_kref+0x1368:   	prefetcha	%g2 + 0x85, 0
	.word	0x97418000	! t0_kref+0x136c:   	mov	%fprs, %o3
	.word	0x81a4492e	! t0_kref+0x1370:   	fmuls	%f17, %f14, %f0
	.word	0x91a10839	! t0_kref+0x1374:   	fadds	%f4, %f25, %f8
	.word	0xe5ee501c	! t0_kref+0x1378:   	prefetcha	%i1 + %i4, 18
	.word	0xa5a58921	! t0_kref+0x137c:   	fmuls	%f22, %f1, %f18
	.word	0xe5a0a02c	! t0_kref+0x1380:   	sta	%f18, [%g2 + 0x2c]%asi
	.word	0xa0523aa7	! t0_kref+0x1384:   	umul	%o0, -0x559, %l0
	.word	0x9b3d6000	! t0_kref+0x1388:   	sra	%l5, 0x0, %o5
	.word	0x3c800006	! t0_kref+0x138c:   	bpos,a	_kref+0x13a4
	.word	0x92f34013	! t0_kref+0x1390:   	udivcc	%o5, %l3, %o1
	call	SYM(t0_subr0)
	.word	0x93a01a2a	! t0_kref+0x1398:   	fstoi	%f10, %f9
	.word	0xa7a018d4	! t0_kref+0x139c:   	fdtos	%f20, %f19
	.word	0x81a88ad2	! t0_kref+0x13a0:   	fcmped	%fcc0, %f2, %f18
	.word	0xd028a00b	! t0_kref+0x13a4:   	stb	%o0, [%g2 + 0xb]
	.word	0x81aa8ad6	! t0_kref+0x13a8:   	fcmped	%fcc0, %f10, %f22
	.word	0xd0266000	! t0_kref+0x13ac:   	st	%o0, [%i1]
	.word	0x81dcb6ba	! t0_kref+0x13b0:   	flush	%l2 - 0x946
	.word	0xe900a000	! t0_kref+0x13b4:   	ld	[%g2], %f20
	.word	0xa888000c	! t0_kref+0x13b8:   	andcc	%g0, %o4, %l4
	.word	0x81ad8ace	! t0_kref+0x13bc:   	fcmped	%fcc0, %f22, %f14
	.word	0x81ae4aaa	! t0_kref+0x13c0:   	fcmpes	%fcc0, %f25, %f10
	.word	0xa0d3372e	! t0_kref+0x13c4:   	umulcc	%o4, -0x8d2, %l0
	.word	0xe500a008	! t0_kref+0x13c8:   	ld	[%g2 + 8], %f18
	sethi	%hi(2f), %o7
	.word	0xe40be014	! t0_kref+0x13d0:   	ldub	[%o7 + 0x14], %l2
	.word	0xa41ca00c	! t0_kref+0x13d4:   	xor	%l2, 0xc, %l2
	.word	0xe42be014	! t0_kref+0x13d8:   	stb	%l2, [%o7 + 0x14]
	.word	0x81dbe014	! t0_kref+0x13dc:   	flush	%o7 + 0x14
	.word	0xc91e7fe8	! t0_kref+0x13e0:   	ldd	[%i1 - 0x18], %f4
	.word	0x94e2b4cb	! t0_kref+0x13e4:   	subccc	%o2, -0xb35, %o2
	.word	0xd8b62000	! t0_kref+0x13e8:   	stha	%o4, [%i0]%asi
	.word	0xa87ceb00	! t0_kref+0x13ec:   	sdiv	%l3, 0xb00, %l4
	.word	0xb5a1c931	! t0_kref+0x13f0:   	fmuls	%f7, %f17, %f26
	.word	0x92bb6931	! t0_kref+0x13f4:   	xnorcc	%o5, 0x931, %o1
	.word	0x89a00154	! t0_kref+0x13f8:   	fabsd	%f20, %f4
	.word	0x2f800005	! t0_kref+0x13fc:   	fbu,a	_kref+0x1410
	.word	0xa4dab896	! t0_kref+0x1400:   	smulcc	%o2, -0x76a, %l2
	.word	0x972d200d	! t0_kref+0x1404:   	sll	%l4, 0xd, %o3
	.word	0x928b3dbb	! t0_kref+0x1408:   	andcc	%o4, -0x245, %o1
	.word	0x85a68927	! t0_kref+0x140c:   	fmuls	%f26, %f7, %f2
	.word	0xefee101a	! t0_kref+0x1410:   	prefetcha	%i0 + %i2, 23
2:	.word	0xa8930000	! t0_kref+0x1414:   	orcc	%o4, %g0, %l4
	.word	0xe4086e84	! t0_kref+0x1418:   	ldub	[%g1 + 0xe84], %l2
	.word	0xa41ca00c	! t0_kref+0x141c:   	xor	%l2, 0xc, %l2
	.word	0xe4286e84	! t0_kref+0x1420:   	stb	%l2, [%g1 + 0xe84]
	.word	0x81d86e84	! t0_kref+0x1424:   	flush	%g1 + 0xe84
	.word	0xe1be588d	! t0_kref+0x1428:   	stda	%f16, [%i1 + %o5]0xc4
	.word	0xa1352005	! t0_kref+0x142c:   	srl	%l4, 0x5, %l0
	.word	0x933e800d	! t0_kref+0x1430:   	sra	%i2, %o5, %o1
	.word	0x33800001	! t0_kref+0x1434:   	fbe,a	_kref+0x1438
2:	.word	0xaba01a36	! t0_kref+0x1438:   	fstoi	%f22, %f21
	.word	0xb1a68922	! t0_kref+0x143c:   	fmuls	%f26, %f2, %f24
	.word	0xd2366012	! t0_kref+0x1440:   	sth	%o1, [%i1 + 0x12]
	.word	0x81dbb5db	! t0_kref+0x1444:   	flush	%sp - 0xa25
	.word	0xc0200019	! t0_kref+0x1448:   	clr	[%g0 + %i1]
	.word	0xee363ff2	! t0_kref+0x144c:   	sth	%l7, [%i0 - 0xe]
	.word	0x3c800003	! t0_kref+0x1450:   	bpos,a	_kref+0x145c
	.word	0xa5a01a50	! t0_kref+0x1454:   	fdtoi	%f16, %f18
	.word	0xa5a000c2	! t0_kref+0x1458:   	fnegd	%f2, %f18
	.word	0x94600000	! t0_kref+0x145c:   	subc	%g0, %g0, %o2
	.word	0xa5302006	! t0_kref+0x1460:   	srl	%g0, 0x6, %l2
	.word	0x85a18856	! t0_kref+0x1464:   	faddd	%f6, %f22, %f2
	.word	0xec363ff6	! t0_kref+0x1468:   	sth	%l6, [%i0 - 0xa]
	.word	0xa604a03e	! t0_kref+0x146c:   	add	%l2, 0x3e, %l3
	.word	0x3b800007	! t0_kref+0x1470:   	fble,a	_kref+0x148c
	.word	0x85a0012d	! t0_kref+0x1474:   	fabss	%f13, %f2
	.word	0x92548009	! t0_kref+0x1478:   	umul	%l2, %o1, %o1
	.word	0xd27e3fe8	! t0_kref+0x147c:   	swap	[%i0 - 0x18], %o1
	.word	0xac05000c	! t0_kref+0x1480:   	add	%l4, %o4, %l6
	.word	0xa1a80050	! t0_kref+0x1484:   	fmovdn	%fcc0, %f16, %f16
	.word	0x27800001	! t0_kref+0x1488:   	fbul,a	_kref+0x148c
	.word	0x8fa0c932	! t0_kref+0x148c:   	fmuls	%f3, %f18, %f7
	.word	0xd2480019	! t0_kref+0x1490:   	ldsb	[%g0 + %i1], %o1
	.word	0x92702a29	! t0_kref+0x1494:   	udiv	%g0, 0xa29, %o1
	.word	0x96883310	! t0_kref+0x1498:   	andcc	%g0, -0xcf0, %o3
	.word	0x9e7ac008	! t0_kref+0x149c:   	sdiv	%o3, %o0, %o7
	.word	0xf207bfe0	! t0_kref+0x14a0:   	ld	[%fp - 0x20], %i1
	.word	0xa0568016	! t0_kref+0x14a4:   	umul	%i2, %l6, %l0
	.word	0x21800008	! t0_kref+0x14a8:   	fbn,a	_kref+0x14c8
	.word	0x9a7abcd1	! t0_kref+0x14ac:   	sdiv	%o2, -0x32f, %o5
	.word	0x8d84c01a	! t0_kref+0x14b0:   	wr	%l3, %i2, %fprs
	.word	0xe2167ff0	! t0_kref+0x14b4:   	lduh	[%i1 - 0x10], %l1
	.word	0x3d800005	! t0_kref+0x14b8:   	fbule,a	_kref+0x14cc
	.word	0x972b0017	! t0_kref+0x14bc:   	sll	%o4, %l7, %o3
	.word	0xace02012	! t0_kref+0x14c0:   	subccc	%g0, 0x12, %l6
	.word	0xa0b83971	! t0_kref+0x14c4:   	xnorcc	%g0, -0x68f, %l0
	.word	0xe93e6008	! t0_kref+0x14c8:   	std	%f20, [%i1 + 8]
!	.word	0x204f3acb	! t0_kref+0x14cc:   	bn,a,pt	%icc, SYM(t0_subr2)
	   	bn,a,pt	%icc, SYM(t0_subr2)
	.word	0x9f414000	! t0_kref+0x14d0:   	mov	%pc, %o7
	.word	0xe040a004	! t0_kref+0x14d4:   	ldsw	[%g2 + 4], %l0
	.word	0xaee28015	! t0_kref+0x14d8:   	subccc	%o2, %l5, %l7
	.word	0xc12e201c	! t0_kref+0x14dc:   	st	%fsr, [%i0 + 0x1c]
	.word	0x85a04d24	! t0_kref+0x14e0:   	fsmuld	%f1, %f4, %f2
	.word	0xa1a01933	! t0_kref+0x14e4:   	fstod	%f19, %f16
	.word	0x81858000	! t0_kref+0x14e8:   	wr	%l6, %g0, %y
	.word	0xc500a004	! t0_kref+0x14ec:   	ld	[%g2 + 4], %f2
	.word	0xd01f4019	! t0_kref+0x14f0:   	ldd	[%i5 + %i1], %o0
	.word	0x98e56ea7	! t0_kref+0x14f4:   	subccc	%l5, 0xea7, %o4
	.word	0x94024014	! t0_kref+0x14f8:   	add	%o1, %l4, %o2
	.word	0xd4263ffc	! t0_kref+0x14fc:   	st	%o2, [%i0 - 4]
	.word	0xaa656b7b	! t0_kref+0x1500:   	subc	%l5, 0xb7b, %l5
	.word	0xd0766018	! t0_kref+0x1504:   	stx	%o0, [%i1 + 0x18]
	.word	0xd680a038	! t0_kref+0x1508:   	lda	[%g2 + 0x38]%asi, %o3
	.word	0xe53e6008	! t0_kref+0x150c:   	std	%f18, [%i1 + 8]
	.word	0x921ac00d	! t0_kref+0x1510:   	xor	%o3, %o5, %o1
	.word	0x98c223c3	! t0_kref+0x1514:   	addccc	%o0, 0x3c3, %o4
	.word	0xa80d001a	! t0_kref+0x1518:   	and	%l4, %i2, %l4
	.word	0xd27e2008	! t0_kref+0x151c:   	swap	[%i0 + 8], %o1
	.word	0x948aaa70	! t0_kref+0x1520:   	andcc	%o2, 0xa70, %o2
	.word	0xa05030c9	! t0_kref+0x1524:   	umul	%g0, -0xf37, %l0
	.word	0xc91fbe48	! t0_kref+0x1528:   	ldd	[%fp - 0x1b8], %f4
	.word	0x9ad48015	! t0_kref+0x152c:   	umulcc	%l2, %l5, %o5
	call	SYM(t0_subr2)
	.word	0xa6bab68f	! t0_kref+0x1534:   	xnorcc	%o2, -0x971, %l3
	.word	0x8fa01a24	! t0_kref+0x1538:   	fstoi	%f4, %f7
	.word	0xee48a013	! t0_kref+0x153c:   	ldsb	[%g2 + 0x13], %l7
	.word	0xa3a50928	! t0_kref+0x1540:   	fmuls	%f20, %f8, %f17
	.word	0x8da0012b	! t0_kref+0x1544:   	fabss	%f11, %f6
	sethi	%hi(2f), %o7
	.word	0xe40be168	! t0_kref+0x154c:   	ldub	[%o7 + 0x168], %l2
	.word	0xa41ca00c	! t0_kref+0x1550:   	xor	%l2, 0xc, %l2
	.word	0xe42be168	! t0_kref+0x1554:   	stb	%l2, [%o7 + 0x168]
	.word	0x81dbe168	! t0_kref+0x1558:   	flush	%o7 + 0x168
	.word	0xa8b80008	! t0_kref+0x155c:   	xnorcc	%g0, %o0, %l4
	.word	0xe210a038	! t0_kref+0x1560:   	lduh	[%g2 + 0x38], %l1
	.word	0x81de000d	! t0_kref+0x1564:   	flush	%i0 + %o5
2:	.word	0xec762008	! t0_kref+0x1568:   	stx	%l6, [%i0 + 8]
	.word	0x950dc000	! t0_kref+0x156c:   	tsubcc	%l7, %g0, %o2
	.word	0xd6c0a008	! t0_kref+0x1570:   	ldswa	[%g2 + 8]%asi, %o3
	.word	0x81da695e	! t0_kref+0x1574:   	flush	%o1 + 0x95e
	.word	0x94a5b32d	! t0_kref+0x1578:   	subcc	%l6, -0xcd3, %o2
	.word	0xa5a000c6	! t0_kref+0x157c:   	fnegd	%f6, %f18
	.word	0xaa02e05f	! t0_kref+0x1580:   	add	%o3, 0x5f, %l5
	.word	0x9e006fd4	! t0_kref+0x1584:   	add	%g1, 0xfd4, %o7
!	.word	0x2881528d	! t0_kref+0x1588:   	bleu,a	SYM(t0_subr3)
	   	bleu,a	SYM(t0_subr3)
	.word	0x95a01a29	! t0_kref+0x158c:   	fstoi	%f9, %f10
	.word	0x30800002	! t0_kref+0x1590:   	ba,a	_kref+0x1598
	.word	0x952ea01e	! t0_kref+0x1594:   	sll	%i2, 0x1e, %o2
	.word	0x9fc10000	! t0_kref+0x1598:   	call	%g4
	.word	0xd0267fe0	! t0_kref+0x159c:   	st	%o0, [%i1 - 0x20]
	.word	0xa0b5400b	! t0_kref+0x15a0:   	orncc	%l5, %o3, %l0
	.word	0xe9ee501d	! t0_kref+0x15a4:   	prefetcha	%i1 + %i5, 20
	.word	0xaf400000	! t0_kref+0x15a8:   	mov	%y, %l7
	.word	0x21800006	! t0_kref+0x15ac:   	fbn,a	_kref+0x15c4
	.word	0xd4300018	! t0_kref+0x15b0:   	sth	%o2, [%g0 + %i0]
	.word	0xe0c0a010	! t0_kref+0x15b4:   	ldswa	[%g2 + 0x10]%asi, %l0
	.word	0x2f480002	! t0_kref+0x15b8:   	fbu,a,pt	%fcc0, _kref+0x15c0
	.word	0xe8300018	! t0_kref+0x15bc:   	sth	%l4, [%g0 + %i0]
	.word	0x93400000	! t0_kref+0x15c0:   	mov	%y, %o1
	.word	0xa6d5400b	! t0_kref+0x15c4:   	umulcc	%l5, %o3, %l3
	.word	0xc96e3fe0	! t0_kref+0x15c8:   	prefetch	%i0 - 0x20, 4
	.word	0xa6b3400a	! t0_kref+0x15cc:   	orncc	%o5, %o2, %l3
	.word	0xc030a03c	! t0_kref+0x15d0:   	clrh	[%g2 + 0x3c]
	.word	0xa5a01a39	! t0_kref+0x15d4:   	fstoi	%f25, %f18
	.word	0x22800006	! t0_kref+0x15d8:   	be,a	_kref+0x15f0
	.word	0xf11e0000	! t0_kref+0x15dc:   	ldd	[%i0], %f24
	.word	0x9fc00004	! t0_kref+0x15e0:   	call	%g0 + %g4
	.word	0xd888105a	! t0_kref+0x15e4:   	lduba	[%g0 + %i2]0x82, %o4
	.word	0xe4063fec	! t0_kref+0x15e8:   	ld	[%i0 - 0x14], %l2
	.word	0xea070018	! t0_kref+0x15ec:   	ld	[%i4 + %i0], %l5
	.word	0xdd1fbe78	! t0_kref+0x15f0:   	ldd	[%fp - 0x188], %f14
	.word	0x35800003	! t0_kref+0x15f4:   	fbue,a	_kref+0x1600
	.word	0xe8366002	! t0_kref+0x15f8:   	sth	%l4, [%i1 + 2]
	.word	0xaba00128	! t0_kref+0x15fc:   	fabss	%f8, %f21
	.word	0x98053644	! t0_kref+0x1600:   	add	%l4, -0x9bc, %o4
	.word	0x9da44934	! t0_kref+0x1604:   	fmuls	%f17, %f20, %f14
	.word	0x8d800000	! t0_kref+0x1608:   	mov	%g0, %fprs
	.word	0x94bca063	! t0_kref+0x160c:   	xnorcc	%l2, 0x63, %o2
	.word	0x252a12cb	! t0_kref+0x1610:   	sethi	%hi(0xa84b2c00), %l2
	.word	0x81deac30	! t0_kref+0x1614:   	flush	%i2 + 0xc30
	.word	0xd13e7fe0	! t0_kref+0x1618:   	std	%f8, [%i1 - 0x20]
	.word	0xa87ac016	! t0_kref+0x161c:   	sdiv	%o3, %l6, %l4
	.word	0x32800008	! t0_kref+0x1620:   	bne,a	_kref+0x1640
	.word	0x9fa10827	! t0_kref+0x1624:   	fadds	%f4, %f7, %f15
	.word	0xefa0a01c	! t0_kref+0x1628:   	sta	%f23, [%g2 + 0x1c]%asi
	.word	0xf76e401b	! t0_kref+0x162c:   	prefetch	%i1 + %i3, 27
	.word	0xa4a2800d	! t0_kref+0x1630:   	subcc	%o2, %o5, %l2
	.word	0x91a58937	! t0_kref+0x1634:   	fmuls	%f22, %f23, %f8
	.word	0xe6863ff4	! t0_kref+0x1638:   	lda	[%i0 - 0xc]%asi, %l3
	.word	0x89a68d26	! t0_kref+0x163c:   	fsmuld	%f26, %f6, %f4
	.word	0x9a1c800b	! t0_kref+0x1640:   	xor	%l2, %o3, %o5
	.word	0x96034009	! t0_kref+0x1644:   	add	%o5, %o1, %o3
	.word	0x9de3bfa0	! t0_kref+0x1648:   	save	%sp, -0x60, %sp
	.word	0x95ee8000	! t0_kref+0x164c:   	restore	%i2, %g0, %o2
	.word	0x34800006	! t0_kref+0x1650:   	bg,a	_kref+0x1668
	.word	0xae3b4013	! t0_kref+0x1654:   	xnor	%o5, %l3, %l7
	.word	0x9af30012	! t0_kref+0x1658:   	udivcc	%o4, %l2, %o5
	.word	0x95aac04c	! t0_kref+0x165c:   	fmovdge	%fcc0, %f12, %f10
	.word	0x91a34926	! t0_kref+0x1660:   	fmuls	%f13, %f6, %f8
	.word	0xada01a39	! t0_kref+0x1664:   	fstoi	%f25, %f22
	.word	0x9264f682	! t0_kref+0x1668:   	subc	%l3, -0x97e, %o1
	.word	0x28480001	! t0_kref+0x166c:   	bleu,a,pt	%icc, _kref+0x1670
	.word	0x9864a46a	! t0_kref+0x1670:   	subc	%l2, 0x46a, %o4
	.word	0xa6857074	! t0_kref+0x1674:   	addcc	%l5, -0xf8c, %l3
	.word	0x81ad0a44	! t0_kref+0x1678:   	fcmpd	%fcc0, %f20, %f4
	.word	0x95a64d26	! t0_kref+0x167c:   	fsmuld	%f25, %f6, %f10
	.word	0xf11e4000	! t0_kref+0x1680:   	ldd	[%i1], %f24
	.word	0xd4063ff0	! t0_kref+0x1684:   	ld	[%i0 - 0x10], %o2
	.word	0x9a0b400b	! t0_kref+0x1688:   	and	%o5, %o3, %o5
	.word	0xe0060000	! t0_kref+0x168c:   	ld	[%i0], %l0
	.word	0x81a88acc	! t0_kref+0x1690:   	fcmped	%fcc0, %f2, %f12
	.word	0x86102010	! t0_kref+0x1694:   	mov	0x10, %g3
	.word	0x86a0e001	! t0_kref+0x1698:   	subcc	%g3, 1, %g3
	.word	0x2280001f	! t0_kref+0x169c:   	be,a	_kref+0x1718
	.word	0x91a0004a	! t0_kref+0x16a0:   	fmovd	%f10, %f8
	.word	0xf300a01c	! t0_kref+0x16a4:   	ld	[%g2 + 0x1c], %f25
	.word	0x81df3878	! t0_kref+0x16a8:   	flush	%i4 - 0x788
	.word	0x952ea00f	! t0_kref+0x16ac:   	sll	%i2, 0xf, %o2
	.word	0x9a9a4013	! t0_kref+0x16b0:   	xorcc	%o1, %l3, %o5
	.word	0x9e1deb2e	! t0_kref+0x16b4:   	xor	%l7, 0xb2e, %o7
	.word	0xec266008	! t0_kref+0x16b8:   	st	%l6, [%i1 + 8]
	.word	0xecd0105b	! t0_kref+0x16bc:   	ldsha	[%g0 + %i3]0x82, %l6
	.word	0xe93e7ff8	! t0_kref+0x16c0:   	std	%f20, [%i1 - 8]
	.word	0x22480002	! t0_kref+0x16c4:   	be,a,pt	%icc, _kref+0x16cc
	.word	0xae5e800d	! t0_kref+0x16c8:   	smul	%i2, %o5, %l7
	.word	0x8ba548ba	! t0_kref+0x16cc:   	fsubs	%f21, %f26, %f5
	.word	0xf007bfe0	! t0_kref+0x16d0:   	ld	[%fp - 0x20], %i0
	.word	0xd4067fe8	! t0_kref+0x16d4:   	ld	[%i1 - 0x18], %o2
	.word	0xe36e401a	! t0_kref+0x16d8:   	prefetch	%i1 + %i2, 17
	.word	0x85834017	! t0_kref+0x16dc:   	wr	%o5, %l7, %ccr
	.word	0xc5a0a000	! t0_kref+0x16e0:   	sta	%f2, [%g2]%asi
	.word	0xc19e5a5d	! t0_kref+0x16e4:   	ldda	[%i1 + %i5]0xd2, %f0
	.word	0x9fc10000	! t0_kref+0x16e8:   	call	%g4
	.word	0xcb20a028	! t0_kref+0x16ec:   	st	%f5, [%g2 + 0x28]
	.word	0x9fc10000	! t0_kref+0x16f0:   	call	%g4
	.word	0xacb2609a	! t0_kref+0x16f4:   	orncc	%o1, 0x9a, %l6
	.word	0xa2b03600	! t0_kref+0x16f8:   	orncc	%g0, -0xa00, %l1
	.word	0x9842ab4d	! t0_kref+0x16fc:   	addc	%o2, 0xb4d, %o4
	.word	0xa4fa6a77	! t0_kref+0x1700:   	sdivcc	%o1, 0xa77, %l2
	.word	0xa8c2800a	! t0_kref+0x1704:   	addccc	%o2, %o2, %l4
	.word	0xc53f4018	! t0_kref+0x1708:   	std	%f2, [%i5 + %i0]
	.word	0x92f80016	! t0_kref+0x170c:   	sdivcc	%g0, %l6, %o1
	.word	0x3bbfffe2	! t0_kref+0x1710:   	fble,a	_kref+0x1698
	.word	0xa48ce555	! t0_kref+0x1714:   	andcc	%l3, 0x555, %l2
	.word	0x86102008	! t0_kref+0x1718:   	mov	0x8, %g3
	.word	0x86a0e001	! t0_kref+0x171c:   	subcc	%g3, 1, %g3
	.word	0x22800018	! t0_kref+0x1720:   	be,a	_kref+0x1780
	.word	0xf56e2010	! t0_kref+0x1724:   	prefetch	%i0 + 0x10, 26
	.word	0x8da0192f	! t0_kref+0x1728:   	fstod	%f15, %f6
	.word	0xeaee3ff0	! t0_kref+0x172c:   	ldstuba	[%i0 - 0x10]%asi, %l5
	.word	0xe93f4019	! t0_kref+0x1730:   	std	%f20, [%i5 + %i1]
	.word	0xec88a013	! t0_kref+0x1734:   	lduba	[%g2 + 0x13]%asi, %l6
	.word	0x83a50823	! t0_kref+0x1738:   	fadds	%f20, %f3, %f1
	.word	0x9fc00004	! t0_kref+0x173c:   	call	%g0 + %g4
	.word	0xa6568012	! t0_kref+0x1740:   	umul	%i2, %l2, %l3
	.word	0x25480001	! t0_kref+0x1744:   	fblg,a,pt	%fcc0, _kref+0x1748
	.word	0xda500018	! t0_kref+0x1748:   	ldsh	[%g0 + %i0], %o5
	.word	0x25bffff4	! t0_kref+0x174c:   	fblg,a	_kref+0x171c
	.word	0xc91fbef0	! t0_kref+0x1750:   	ldd	[%fp - 0x110], %f4
	.word	0xf19eda59	! t0_kref+0x1754:   	ldda	[%i3 + %i1]0xd2, %f24
	.word	0xb1a01888	! t0_kref+0x1758:   	fitos	%f8, %f24
	.word	0xacf2aa38	! t0_kref+0x175c:   	udivcc	%o2, 0xa38, %l6
	.word	0x3d4fffef	! t0_kref+0x1760:   	fbule,a,pt	%fcc0, _kref+0x171c
	.word	0x9a5dc008	! t0_kref+0x1764:   	smul	%l7, %o0, %o5
	.word	0xf76e001c	! t0_kref+0x1768:   	prefetch	%i0 + %i4, 27
	.word	0xcd80a02c	! t0_kref+0x176c:   	lda	[%g2 + 0x2c]%asi, %f6
	.word	0xd0500018	! t0_kref+0x1770:   	ldsh	[%g0 + %i0], %o0
	.word	0x92e00012	! t0_kref+0x1774:   	subccc	%g0, %l2, %o1
	.word	0xf76e2018	! t0_kref+0x1778:   	prefetch	%i0 + 0x18, 27
	.word	0x30bfffe8	! t0_kref+0x177c:   	ba,a	_kref+0x171c
	.word	0xf1060000	! t0_kref+0x1780:   	ld	[%i0], %f24
	.word	0x9fc10000	! t0_kref+0x1784:   	call	%g4
	.word	0xd81e7fe8	! t0_kref+0x1788:   	ldd	[%i1 - 0x18], %o4
	.word	0xa47a8012	! t0_kref+0x178c:   	sdiv	%o2, %l2, %l2
	.word	0xe1be1814	! t0_kref+0x1790:   	stda	%f16, [%i0 + %l4]0xc0
	.word	0x24480002	! t0_kref+0x1794:   	ble,a,pt	%icc, _kref+0x179c
	.word	0x965a6313	! t0_kref+0x1798:   	smul	%o1, 0x313, %o3
	.word	0xd7f6500a	! t0_kref+0x179c:   	casxa	[%i1]0x80, %o2, %o3
	.word	0xc5ee100d	! t0_kref+0x17a0:   	prefetcha	%i0 + %o5, 2
	.word	0x36800005	! t0_kref+0x17a4:   	bge,a	_kref+0x17b8
	.word	0x913e8013	! t0_kref+0x17a8:   	sra	%i2, %l3, %o0
	.word	0xb5a68856	! t0_kref+0x17ac:   	faddd	%f26, %f22, %f26
	.word	0x81dffd93	! t0_kref+0x17b0:   	flush	%i7 - 0x26d
	.word	0xd008a006	! t0_kref+0x17b4:   	ldub	[%g2 + 6], %o0
	.word	0xf3871018	! t0_kref+0x17b8:   	lda	[%i4 + %i0]0x80, %f25
	.word	0x94657d42	! t0_kref+0x17bc:   	subc	%l5, -0x2be, %o2
	.word	0xadab005a	! t0_kref+0x17c0:   	fmovduge	%fcc0, %f26, %f22
	.word	0xd8200018	! t0_kref+0x17c4:   	st	%o4, [%g0 + %i0]
	.word	0xa062c00b	! t0_kref+0x17c8:   	subc	%o3, %o3, %l0
	.word	0xa6e5001a	! t0_kref+0x17cc:   	subccc	%l4, %i2, %l3
	.word	0x81a8caa7	! t0_kref+0x17d0:   	fcmpes	%fcc0, %f3, %f7
	.word	0x97a01a30	! t0_kref+0x17d4:   	fstoi	%f16, %f11
	.word	0xaa62b39b	! t0_kref+0x17d8:   	subc	%o2, -0xc65, %l5
	.word	0xec464000	! t0_kref+0x17dc:   	ldsw	[%i1], %l6
	.word	0xc1ee5009	! t0_kref+0x17e0:   	prefetcha	%i1 + %o1, 0
	.word	0x81ae4aa4	! t0_kref+0x17e4:   	fcmpes	%fcc0, %f25, %f4
	.word	0x9b3b4012	! t0_kref+0x17e8:   	sra	%o5, %l2, %o5
	.word	0xacad79a0	! t0_kref+0x17ec:   	andncc	%l5, -0x660, %l6
	.word	0xee1029ee	! t0_kref+0x17f0:   	lduh	[%g0 + 0x9ee], %l7
	.word	0xafa54929	! t0_kref+0x17f4:   	fmuls	%f21, %f9, %f23
	.word	0x970d6da0	! t0_kref+0x17f8:   	tsubcc	%l5, 0xda0, %o3
	.word	0xaba5c824	! t0_kref+0x17fc:   	fadds	%f23, %f4, %f21
	.word	0x9fc00004	! t0_kref+0x1800:   	call	%g0 + %g4
	.word	0xf1ee101c	! t0_kref+0x1804:   	prefetcha	%i0 + %i4, 24
	.word	0xe64e001a	! t0_kref+0x1808:   	ldsb	[%i0 + %i2], %l3
	.word	0x98434016	! t0_kref+0x180c:   	addc	%o5, %l6, %o4
	.word	0x8143c000	! t0_kref+0x1810:   	stbar
	sethi	%hi(2f), %o7
	.word	0xe40be038	! t0_kref+0x1818:   	ldub	[%o7 + 0x38], %l2
	.word	0xa41ca00c	! t0_kref+0x181c:   	xor	%l2, 0xc, %l2
	.word	0xe42be038	! t0_kref+0x1820:   	stb	%l2, [%o7 + 0x38]
	.word	0x81dbe038	! t0_kref+0x1824:   	flush	%o7 + 0x38
	.word	0x90bb4009	! t0_kref+0x1828:   	xnorcc	%o5, %o1, %o0
	.word	0x9ba01a4e	! t0_kref+0x182c:   	fdtoi	%f14, %f13
	.word	0x81800000	! t0_kref+0x1830:   	mov	%g0, %y
	.word	0x931a27f2	! t0_kref+0x1834:   	tsubcctv	%o0, 0x7f2, %o1
2:	.word	0x92f20009	! t0_kref+0x1838:   	udivcc	%o0, %o1, %o1
	.word	0xa1a01a2c	! t0_kref+0x183c:   	fstoi	%f12, %f16
	.word	0x21480004	! t0_kref+0x1840:   	fbn,a,pt	%fcc0, _kref+0x1850
	.word	0xcf80a038	! t0_kref+0x1844:   	lda	[%g2 + 0x38]%asi, %f7
	.word	0xc11fbd98	! t0_kref+0x1848:   	ldd	[%fp - 0x268], %f0
	.word	0x9ba08838	! t0_kref+0x184c:   	fadds	%f2, %f24, %f13
	.word	0xa052f473	! t0_kref+0x1850:   	umul	%o3, -0xb8d, %l0
	.word	0xc51e0000	! t0_kref+0x1854:   	ldd	[%i0], %f2
	.word	0xd0a8a03d	! t0_kref+0x1858:   	stba	%o0, [%g2 + 0x3d]%asi
	.word	0x9fc00004	! t0_kref+0x185c:   	call	%g0 + %g4
	.word	0xace4a8e2	! t0_kref+0x1860:   	subccc	%l2, 0x8e2, %l6
	.word	0x81aacaa3	! t0_kref+0x1864:   	fcmpes	%fcc0, %f11, %f3
	.word	0x81aa8a58	! t0_kref+0x1868:   	fcmpd	%fcc0, %f10, %f24
	.word	0xe84e600e	! t0_kref+0x186c:   	ldsb	[%i1 + 0xe], %l4
	.word	0xaba00132	! t0_kref+0x1870:   	fabss	%f18, %f21
	.word	0x34480004	! t0_kref+0x1874:   	bg,a,pt	%icc, _kref+0x1884
	.word	0xd44e2016	! t0_kref+0x1878:   	ldsb	[%i0 + 0x16], %o2
!	.word	0x3b8151d0	! t0_kref+0x187c:   	fble,a	SYM(t0_subr3)
	   	fble,a	SYM(t0_subr3)
	.word	0x9f414000	! t0_kref+0x1880:   	mov	%pc, %o7
	.word	0x8ba01a2f	! t0_kref+0x1884:   	fstoi	%f15, %f5
	.word	0xacb4a030	! t0_kref+0x1888:   	orncc	%l2, 0x30, %l6
	.word	0x3a800006	! t0_kref+0x188c:   	bcc,a	_kref+0x18a4
	.word	0x9ba01a54	! t0_kref+0x1890:   	fdtoi	%f20, %f13
	.word	0xe0f81019	! t0_kref+0x1894:   	swapa	[%g0 + %i1]0x80, %l0
	.word	0xd0380019	! t0_kref+0x1898:   	std	%o0, [%g0 + %i1]
	.word	0xa09cb13b	! t0_kref+0x189c:   	xorcc	%l2, -0xec5, %l0
	.word	0xad368014	! t0_kref+0x18a0:   	srl	%i2, %l4, %l6
	.word	0x81a0002f	! t0_kref+0x18a4:   	fmovs	%f15, %f0
	.word	0x98b50013	! t0_kref+0x18a8:   	orncc	%l4, %l3, %o4
	.word	0x8143e040	! t0_kref+0x18ac:   	membar	0x40
	.word	0xc13e7ff0	! t0_kref+0x18b0:   	std	%f0, [%i1 - 0x10]
	.word	0xab1a8013	! t0_kref+0x18b4:   	tsubcctv	%o2, %l3, %l5
	.word	0xdd80a00c	! t0_kref+0x18b8:   	lda	[%g2 + 0xc]%asi, %f14
	.word	0xdd80a004	! t0_kref+0x18bc:   	lda	[%g2 + 4]%asi, %f14
	.word	0xa0e5c01a	! t0_kref+0x18c0:   	subccc	%l7, %i2, %l0
	.word	0x903ced53	! t0_kref+0x18c4:   	xnor	%l3, 0xd53, %o0
	.word	0x3b800008	! t0_kref+0x18c8:   	fble,a	_kref+0x18e8
	.word	0x85828017	! t0_kref+0x18cc:   	wr	%o2, %l7, %ccr
	.word	0x9325c017	! t0_kref+0x18d0:   	mulscc	%l7, %l7, %o1
	.word	0x973a4015	! t0_kref+0x18d4:   	sra	%o1, %l5, %o3
	.word	0xde100019	! t0_kref+0x18d8:   	lduh	[%g0 + %i1], %o7
	.word	0xe296101b	! t0_kref+0x18dc:   	lduha	[%i0 + %i3]0x80, %l1
	.word	0xd8a0a018	! t0_kref+0x18e0:   	sta	%o4, [%g2 + 0x18]%asi
	.word	0x34800005	! t0_kref+0x18e4:   	bg,a	_kref+0x18f8
	.word	0x97400000	! t0_kref+0x18e8:   	mov	%y, %o3
	.word	0xada14d29	! t0_kref+0x18ec:   	fsmuld	%f5, %f9, %f22
	.word	0x95037e23	! t0_kref+0x18f0:   	taddcc	%o5, -0x1dd, %o2
	.word	0xd87e0000	! t0_kref+0x18f4:   	swap	[%i0], %o4
	.word	0xd076001d	! t0_kref+0x18f8:   	stx	%o0, [%i0 + %i5]
	.word	0xaeb30017	! t0_kref+0x18fc:   	orncc	%o4, %l7, %l7
	.word	0xa05df381	! t0_kref+0x1900:   	smul	%l7, -0xc7f, %l0
	.word	0x81a90ac6	! t0_kref+0x1904:   	fcmped	%fcc0, %f4, %f6
	call	SYM(t0_subr3)
	.word	0x9ba8c02b	! t0_kref+0x190c:   	fmovsul	%fcc0, %f11, %f13
	.word	0x89a01931	! t0_kref+0x1910:   	fstod	%f17, %f4
	.word	0x9a800012	! t0_kref+0x1914:   	addcc	%g0, %l2, %o5
	call	SYM(t0_subr3)
	.word	0xa1400000	! t0_kref+0x191c:   	mov	%y, %l0
	.word	0xada01a34	! t0_kref+0x1920:   	fstoi	%f20, %f22
	.word	0xda28a025	! t0_kref+0x1924:   	stb	%o5, [%g2 + 0x25]
	.word	0x2a480004	! t0_kref+0x1928:   	bcs,a,pt	%icc, _kref+0x1938
	.word	0xac400009	! t0_kref+0x192c:   	addc	%g0, %o1, %l6
	.word	0x3a800004	! t0_kref+0x1930:   	bcc,a	_kref+0x1940
	.word	0x94024015	! t0_kref+0x1934:   	add	%o1, %l5, %o2
	.word	0x9042c014	! t0_kref+0x1938:   	addc	%o3, %l4, %o0
	.word	0xd11fbcc0	! t0_kref+0x193c:   	ldd	[%fp - 0x340], %f8
	.word	0xa2aa0016	! t0_kref+0x1940:   	andncc	%o0, %l6, %l1
	.word	0x3f800007	! t0_kref+0x1944:   	fbo,a	_kref+0x1960
	.word	0x92bd4008	! t0_kref+0x1948:   	xnorcc	%l5, %o0, %o1
	.word	0x3c800003	! t0_kref+0x194c:   	bpos,a	_kref+0x1958
	.word	0xc0f63fe8	! t0_kref+0x1950:   	stxa	%g0, [%i0 - 0x18]%asi
	.word	0x9da00126	! t0_kref+0x1954:   	fabss	%f6, %f14
	.word	0x9ba01a2e	! t0_kref+0x1958:   	fstoi	%f14, %f13
	.word	0xf007bfe0	! t0_kref+0x195c:   	ld	[%fp - 0x20], %i0
	.word	0xc12f0005	! t0_kref+0x1960:   	st	%fsr, [%i4 + %g5]
	.word	0xa822000c	! t0_kref+0x1964:   	sub	%o0, %o4, %l4
	.word	0x9fc00004	! t0_kref+0x1968:   	call	%g0 + %g4
	.word	0xe5380019	! t0_kref+0x196c:   	std	%f18, [%g0 + %i1]
	.word	0x24480007	! t0_kref+0x1970:   	ble,a,pt	%icc, _kref+0x198c
	.word	0x972da001	! t0_kref+0x1974:   	sll	%l6, 0x1, %o3
	.word	0x91a01027	! t0_kref+0x1978:   	fstox	%f7, %f8
	.word	0xeac81019	! t0_kref+0x197c:   	ldsba	[%g0 + %i1]0x80, %l5
	.word	0xd67e7fe4	! t0_kref+0x1980:   	swap	[%i1 - 0x1c], %o3
	.word	0xda5e0000	! t0_kref+0x1984:   	ldx	[%i0], %o5
	.word	0xab2d2008	! t0_kref+0x1988:   	sll	%l4, 0x8, %l5
	.word	0xa614a124	! t0_kref+0x198c:   	or	%l2, 0x124, %l3
	.word	0xacbcc017	! t0_kref+0x1990:   	xnorcc	%l3, %l7, %l6
	.word	0x9fc10000	! t0_kref+0x1994:   	call	%g4
	.word	0xdab66014	! t0_kref+0x1998:   	stha	%o5, [%i1 + 0x14]%asi
	.word	0x86102003	! t0_kref+0x199c:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x19a0:   	bne,a	_kref+0x19a0
	.word	0x86a0e001	! t0_kref+0x19a4:   	subcc	%g3, 1, %g3
	.word	0xebee101a	! t0_kref+0x19a8:   	prefetcha	%i0 + %i2, 21
	.word	0xe206001c	! t0_kref+0x19ac:   	ld	[%i0 + %i4], %l1
	.word	0xfd6e7fe0	! t0_kref+0x19b0:   	prefetch	%i1 - 0x20, 30
	.word	0x81dc8016	! t0_kref+0x19b4:   	flush	%l2 + %l6
	.word	0xa688000b	! t0_kref+0x19b8:   	andcc	%g0, %o3, %l3
	.word	0xde162000	! t0_kref+0x19bc:   	lduh	[%i0], %o7
	.word	0x949037d2	! t0_kref+0x19c0:   	orcc	%g0, -0x82e, %o2
	.word	0xa65deca4	! t0_kref+0x19c4:   	smul	%l7, 0xca4, %l3
	.word	0xa5a609d0	! t0_kref+0x19c8:   	fdivd	%f24, %f16, %f18
	.word	0x81dcb3ce	! t0_kref+0x19cc:   	flush	%l2 - 0xc32
	.word	0xa862e7fe	! t0_kref+0x19d0:   	subc	%o3, 0x7fe, %l4
	.word	0xa5254016	! t0_kref+0x19d4:   	mulscc	%l5, %l6, %l2
	.word	0x9fc10000	! t0_kref+0x19d8:   	call	%g4
	.word	0xea4e7ff7	! t0_kref+0x19dc:   	ldsb	[%i1 - 9], %l5
	.word	0xc13e6000	! t0_kref+0x19e0:   	std	%f0, [%i1]
	.word	0xde567fe2	! t0_kref+0x19e4:   	ldsh	[%i1 - 0x1e], %o7
	.word	0x86102018	! t0_kref+0x19e8:   	mov	0x18, %g3
	.word	0x86a0e001	! t0_kref+0x19ec:   	subcc	%g3, 1, %g3
	.word	0x2280001b	! t0_kref+0x19f0:   	be,a	_kref+0x1a5c
	.word	0xa645b244	! t0_kref+0x19f4:   	addc	%l6, -0xdbc, %l3
	.word	0xacd30008	! t0_kref+0x19f8:   	umulcc	%o4, %o0, %l6
	.word	0xa1a00125	! t0_kref+0x19fc:   	fabss	%f5, %f16
	.word	0xe8b0a02e	! t0_kref+0x1a00:   	stha	%l4, [%g2 + 0x2e]%asi
	.word	0xc1be1a5c	! t0_kref+0x1a04:   	stda	%f0, [%i0 + %i4]0xd2
	.word	0xc51e4000	! t0_kref+0x1a08:   	ldd	[%i1], %f2
	.word	0xe21162e2	! t0_kref+0x1a0c:   	lduh	[%g5 + 0x2e2], %l1
	.word	0x81d96712	! t0_kref+0x1a10:   	flush	%g5 + 0x712
	.word	0x23bffff6	! t0_kref+0x1a14:   	fbne,a	_kref+0x19ec
	.word	0x9ba000a7	! t0_kref+0x1a18:   	fnegs	%f7, %f13
	.word	0xd720a028	! t0_kref+0x1a1c:   	st	%f11, [%g2 + 0x28]
	.word	0xc13e4000	! t0_kref+0x1a20:   	std	%f0, [%i1]
	.word	0x98054000	! t0_kref+0x1a24:   	add	%l5, %g0, %o4
	.word	0xac9d756e	! t0_kref+0x1a28:   	xorcc	%l5, -0xa92, %l6
	.word	0xaf332011	! t0_kref+0x1a2c:   	srl	%o4, 0x11, %l7
	.word	0x968a8017	! t0_kref+0x1a30:   	andcc	%o2, %l7, %o3
	.word	0xe36e6018	! t0_kref+0x1a34:   	prefetch	%i1 + 0x18, 17
	.word	0x81ad0a42	! t0_kref+0x1a38:   	fcmpd	%fcc0, %f20, %f2
	.word	0x9e434009	! t0_kref+0x1a3c:   	addc	%o5, %o1, %o7
	.word	0x94dd8015	! t0_kref+0x1a40:   	smulcc	%l6, %l5, %o2
	.word	0xedee501c	! t0_kref+0x1a44:   	prefetcha	%i1 + %i4, 22
	.word	0x37bfffe9	! t0_kref+0x1a48:   	fbge,a	_kref+0x19ec
	.word	0x81dec012	! t0_kref+0x1a4c:   	flush	%i3 + %l2
	.word	0x91a0192a	! t0_kref+0x1a50:   	fstod	%f10, %f8
	.word	0x26480002	! t0_kref+0x1a54:   	bl,a,pt	%icc, _kref+0x1a5c
	.word	0x90d6bb2e	! t0_kref+0x1a58:   	umulcc	%i2, -0x4d2, %o0
	.word	0xcd1e2010	! t0_kref+0x1a5c:   	ldd	[%i0 + 0x10], %f6
	.word	0xae400012	! t0_kref+0x1a60:   	addc	%g0, %l2, %l7
	.word	0xa12b0012	! t0_kref+0x1a64:   	sll	%o4, %l2, %l0
	.word	0xeb871019	! t0_kref+0x1a68:   	lda	[%i4 + %i1]0x80, %f21
	.word	0xacd54015	! t0_kref+0x1a6c:   	umulcc	%l5, %l5, %l6
	.word	0xa4d0001a	! t0_kref+0x1a70:   	umulcc	%g0, %i2, %l2
	.word	0xc96e4012	! t0_kref+0x1a74:   	prefetch	%i1 + %l2, 4
	.word	0xee10a03c	! t0_kref+0x1a78:   	lduh	[%g2 + 0x3c], %l7
	.word	0x21480006	! t0_kref+0x1a7c:   	fbn,a,pt	%fcc0, _kref+0x1a94
	.word	0xd8c0a008	! t0_kref+0x1a80:   	ldswa	[%g2 + 8]%asi, %o4
	.word	0xacf5800c	! t0_kref+0x1a84:   	udivcc	%l6, %o4, %l6
	.word	0xaef4efc7	! t0_kref+0x1a88:   	udivcc	%l3, 0xfc7, %l7
	.word	0x81dce8cc	! t0_kref+0x1a8c:   	flush	%l3 + 0x8cc
	.word	0xab400000	! t0_kref+0x1a90:   	mov	%y, %l5
	.word	0xae7d0009	! t0_kref+0x1a94:   	sdiv	%l4, %o1, %l7
	.word	0x83aa0031	! t0_kref+0x1a98:   	fmovsa	%fcc0, %f17, %f1
	.word	0xad40c000	! t0_kref+0x1a9c:   	mov	%asi, %l6
	.word	0x92e0000b	! t0_kref+0x1aa0:   	subccc	%g0, %o3, %o1
	call	SYM(t0_subr3)
	.word	0xe680a000	! t0_kref+0x1aa8:   	lda	[%g2]%asi, %l3
	.word	0xd630a036	! t0_kref+0x1aac:   	sth	%o3, [%g2 + 0x36]
	.word	0xe620a028	! t0_kref+0x1ab0:   	st	%l3, [%g2 + 0x28]
	.word	0xae527ab4	! t0_kref+0x1ab4:   	umul	%o1, -0x54c, %l7
	.word	0x81aa0ab2	! t0_kref+0x1ab8:   	fcmpes	%fcc0, %f8, %f18
	.word	0xc780a018	! t0_kref+0x1abc:   	lda	[%g2 + 0x18]%asi, %f3
	.word	0x39480008	! t0_kref+0x1ac0:   	fbuge,a,pt	%fcc0, _kref+0x1ae0
	.word	0xa5400000	! t0_kref+0x1ac4:   	mov	%y, %l2
	.word	0xe6064000	! t0_kref+0x1ac8:   	ld	[%i1], %l3
	.word	0xdd1fbeb8	! t0_kref+0x1acc:   	ldd	[%fp - 0x148], %f14
	.word	0x33800001	! t0_kref+0x1ad0:   	fbe,a	_kref+0x1ad4
	.word	0xa0a33078	! t0_kref+0x1ad4:   	subcc	%o4, -0xf88, %l0
	.word	0x909ac014	! t0_kref+0x1ad8:   	xorcc	%o3, %l4, %o0
	.word	0xd0562010	! t0_kref+0x1adc:   	ldsh	[%i0 + 0x10], %o0
	.word	0xa662401a	! t0_kref+0x1ae0:   	subc	%o1, %i2, %l3
	.word	0xd4ce5000	! t0_kref+0x1ae4:   	ldsba	[%i1]0x80, %o2
	.word	0x9fc10000	! t0_kref+0x1ae8:   	call	%g4
	.word	0x9732a006	! t0_kref+0x1aec:   	srl	%o2, 0x6, %o3
	.word	0xa2634013	! t0_kref+0x1af0:   	subc	%o5, %l3, %l1
	.word	0xa0403c9f	! t0_kref+0x1af4:   	addc	%g0, -0x361, %l0
	.word	0x925cec1e	! t0_kref+0x1af8:   	smul	%l3, 0xc1e, %o1
	.word	0xa5a68d38	! t0_kref+0x1afc:   	fsmuld	%f26, %f24, %f18
	.word	0xf11e2018	! t0_kref+0x1b00:   	ldd	[%i0 + 0x18], %f24
	.word	0xc100a020	! t0_kref+0x1b04:   	ld	[%g2 + 0x20], %f0
	.word	0x81d86e11	! t0_kref+0x1b08:   	flush	%g1 + 0xe11
	.word	0xcd1e6018	! t0_kref+0x1b0c:   	ldd	[%i1 + 0x18], %f6
	.word	0x3a480005	! t0_kref+0x1b10:   	bcc,a,pt	%icc, _kref+0x1b24
	.word	0xead0a000	! t0_kref+0x1b14:   	ldsha	[%g2]%asi, %l5
	.word	0xa8f5e0b3	! t0_kref+0x1b18:   	udivcc	%l7, 0xb3, %l4
	.word	0x92b4f7a0	! t0_kref+0x1b1c:   	orncc	%l3, -0x860, %o1
	.word	0xc807bfe4	! t0_kref+0x1b20:   	ld	[%fp - 0x1c], %g4
	.word	0xac72a7ed	! t0_kref+0x1b24:   	udiv	%o2, 0x7ed, %l6
	.word	0x81ab8ace	! t0_kref+0x1b28:   	fcmped	%fcc0, %f14, %f14
	.word	0x36480003	! t0_kref+0x1b2c:   	bge,a,pt	%icc, _kref+0x1b38
	.word	0xdf80a014	! t0_kref+0x1b30:   	lda	[%g2 + 0x14]%asi, %f15
	.word	0x81a94039	! t0_kref+0x1b34:   	fmovsug	%fcc0, %f25, %f0
	.word	0xf96e001d	! t0_kref+0x1b38:   	prefetch	%i0 + %i5, 28
	.word	0x81ae0ac2	! t0_kref+0x1b3c:   	fcmped	%fcc0, %f24, %f2
	.word	0x9fc00004	! t0_kref+0x1b40:   	call	%g0 + %g4
	.word	0xe5a0a024	! t0_kref+0x1b44:   	sta	%f18, [%g2 + 0x24]%asi
	.word	0xd9380018	! t0_kref+0x1b48:   	std	%f12, [%g0 + %i0]
	.word	0xd8180018	! t0_kref+0x1b4c:   	ldd	[%g0 + %i0], %o4
	.word	0xe6300019	! t0_kref+0x1b50:   	sth	%l3, [%g0 + %i1]
	.word	0xe8c0a028	! t0_kref+0x1b54:   	ldswa	[%g2 + 0x28]%asi, %l4
	.word	0x30480001	! t0_kref+0x1b58:   	ba,a,pt	%icc, _kref+0x1b5c
	.word	0x988a0016	! t0_kref+0x1b5c:   	andcc	%o0, %l6, %o4
	.word	0x81dee411	! t0_kref+0x1b60:   	flush	%i3 + 0x411
	.word	0x929a400a	! t0_kref+0x1b64:   	xorcc	%o1, %o2, %o1
	.word	0xd91fbe98	! t0_kref+0x1b68:   	ldd	[%fp - 0x168], %f12
	.word	0xf13e3ff8	! t0_kref+0x1b6c:   	std	%f24, [%i0 - 8]
	.word	0x9fc10000	! t0_kref+0x1b70:   	call	%g4
	.word	0x8d8226b7	! t0_kref+0x1b74:   	wr	%o0, 0x6b7, %fprs
	.word	0x25800004	! t0_kref+0x1b78:   	fblg,a	_kref+0x1b88
	.word	0x9a628012	! t0_kref+0x1b7c:   	subc	%o2, %l2, %o5
	.word	0xc5380018	! t0_kref+0x1b80:   	std	%f2, [%g0 + %i0]
	.word	0xaa3de96a	! t0_kref+0x1b84:   	xnor	%l7, 0x96a, %l5
	.word	0xc9be1808	! t0_kref+0x1b88:   	stda	%f4, [%i0 + %o0]0xc0
	.word	0xa3350015	! t0_kref+0x1b8c:   	srl	%l4, %l5, %l1
	.word	0x90422bad	! t0_kref+0x1b90:   	addc	%o0, 0xbad, %o0
	.word	0xea50a014	! t0_kref+0x1b94:   	ldsh	[%g2 + 0x14], %l5
	.word	0xd9be1816	! t0_kref+0x1b98:   	stda	%f12, [%i0 + %l6]0xc0
	.word	0xa4db7cdd	! t0_kref+0x1b9c:   	smulcc	%o5, -0x323, %l2
	.word	0xada008b7	! t0_kref+0x1ba0:   	fsubs	%f0, %f23, %f22
	.word	0xdb80a014	! t0_kref+0x1ba4:   	lda	[%g2 + 0x14]%asi, %f13
	.word	0x9fc00004	! t0_kref+0x1ba8:   	call	%g0 + %g4
	.word	0xee00a02c	! t0_kref+0x1bac:   	ld	[%g2 + 0x2c], %l7
	.word	0xaa448000	! t0_kref+0x1bb0:   	addc	%l2, %g0, %l5
	.word	0xa4f53b32	! t0_kref+0x1bb4:   	udivcc	%l4, -0x4ce, %l2
	.word	0xa5a01920	! t0_kref+0x1bb8:   	fstod	%f0, %f18
	.word	0x2d800002	! t0_kref+0x1bbc:   	fbg,a	_kref+0x1bc4
	.word	0x968d618d	! t0_kref+0x1bc0:   	andcc	%l5, 0x18d, %o3
	.word	0xd11fbdf0	! t0_kref+0x1bc4:   	ldd	[%fp - 0x210], %f8
	.word	0xd016601e	! t0_kref+0x1bc8:   	lduh	[%i1 + 0x1e], %o0
	.word	0xa83da43e	! t0_kref+0x1bcc:   	xnor	%l6, 0x43e, %l4
	.word	0x3c480003	! t0_kref+0x1bd0:   	bpos,a,pt	%icc, _kref+0x1bdc
	.word	0xa88df1af	! t0_kref+0x1bd4:   	andcc	%l7, -0xe51, %l4
	.word	0xf5871059	! t0_kref+0x1bd8:   	lda	[%i4 + %i1]0x82, %f26
	.word	0xe8070019	! t0_kref+0x1bdc:   	ld	[%i4 + %i1], %l4
	.word	0xe9be588c	! t0_kref+0x1be0:   	stda	%f20, [%i1 + %o4]0xc4
	.word	0xaba01a28	! t0_kref+0x1be4:   	fstoi	%f8, %f21
	.word	0x81d94010	! t0_kref+0x1be8:   	flush	%g5 + %l0
	.word	0xd226200c	! t0_kref+0x1bec:   	st	%o1, [%i0 + 0xc]
	.word	0xe93e7ff0	! t0_kref+0x1bf0:   	std	%f20, [%i1 - 0x10]
	.word	0xd5be3ff0	! t0_kref+0x1bf4:   	stda	%f10, [%i0 - 0x10]%asi
	.word	0xd7867ffc	! t0_kref+0x1bf8:   	lda	[%i1 - 4]%asi, %f11
	.word	0xaf05001a	! t0_kref+0x1bfc:   	taddcc	%l4, %i2, %l7
	.word	0xac624000	! t0_kref+0x1c00:   	subc	%o1, %g0, %l6
	.word	0xe300a024	! t0_kref+0x1c04:   	ld	[%g2 + 0x24], %f17
	.word	0xa464b784	! t0_kref+0x1c08:   	subc	%l2, -0x87c, %l2
	.word	0xae430008	! t0_kref+0x1c0c:   	addc	%o4, %o0, %l7
	.word	0x8143e040	! t0_kref+0x1c10:   	membar	0x40
	.word	0x903defda	! t0_kref+0x1c14:   	xnor	%l7, 0xfda, %o0
	.word	0x9fa01a2a	! t0_kref+0x1c18:   	fstoi	%f10, %f15
	.word	0x97a00036	! t0_kref+0x1c1c:   	fmovs	%f22, %f11
	.word	0xa80df9d4	! t0_kref+0x1c20:   	and	%l7, -0x62c, %l4
	.word	0x81aa8ad6	! t0_kref+0x1c24:   	fcmped	%fcc0, %f10, %f22
	.word	0xa09cff91	! t0_kref+0x1c28:   	xorcc	%l3, -0x6f, %l0
	.word	0xee30a038	! t0_kref+0x1c2c:   	sth	%l7, [%g2 + 0x38]
	.word	0x29800008	! t0_kref+0x1c30:   	fbl,a	_kref+0x1c50
	.word	0x99234013	! t0_kref+0x1c34:   	mulscc	%o5, %l3, %o4
	.word	0x85a00856	! t0_kref+0x1c38:   	faddd	%f0, %f22, %f2
	.word	0xd288a03d	! t0_kref+0x1c3c:   	lduba	[%g2 + 0x3d]%asi, %o1
	.word	0xe920a000	! t0_kref+0x1c40:   	st	%f20, [%g2]
	.word	0xe84e3fe4	! t0_kref+0x1c44:   	ldsb	[%i0 - 0x1c], %l4
	.word	0x2a480008	! t0_kref+0x1c48:   	bcs,a,pt	%icc, _kref+0x1c68
	.word	0xeab67fec	! t0_kref+0x1c4c:   	stha	%l5, [%i1 - 0x14]%asi
	.word	0xe91e3fe8	! t0_kref+0x1c50:   	ldd	[%i0 - 0x18], %f20
	.word	0x93a0108e	! t0_kref+0x1c54:   	fxtos	%f14, %f9
	.word	0x8143c000	! t0_kref+0x1c58:   	stbar
	.word	0xa3400000	! t0_kref+0x1c5c:   	mov	%y, %l1
	.word	0x90d6800a	! t0_kref+0x1c60:   	umulcc	%i2, %o2, %o0
	.word	0xea7f0018	! t0_kref+0x1c64:   	swap	[%i4 + %i0], %l5
	.word	0x9af02adc	! t0_kref+0x1c68:   	udivcc	%g0, 0xadc, %o5
	.word	0x93418000	! t0_kref+0x1c6c:   	mov	%fprs, %o1
	.word	0x9fc00004	! t0_kref+0x1c70:   	call	%g0 + %g4
	.word	0xe636c005	! t0_kref+0x1c74:   	sth	%l3, [%i3 + %g5]
	.word	0x39800003	! t0_kref+0x1c78:   	fbuge,a	_kref+0x1c84
	.word	0xcd3e4000	! t0_kref+0x1c7c:   	std	%f6, [%i1]
	.word	0xd2200019	! t0_kref+0x1c80:   	st	%o1, [%g0 + %i1]
	call	SYM(t0_subr0)
	.word	0x933a8016	! t0_kref+0x1c88:   	sra	%o2, %l6, %o1
	.word	0xd81e401d	! t0_kref+0x1c8c:   	ldd	[%i1 + %i5], %o4
	.word	0xa655000c	! t0_kref+0x1c90:   	umul	%l4, %o4, %l3
	.word	0x9b028012	! t0_kref+0x1c94:   	taddcc	%o2, %l2, %o5
	.word	0x81a88ada	! t0_kref+0x1c98:   	fcmped	%fcc0, %f2, %f26
	.word	0x8fa10927	! t0_kref+0x1c9c:   	fmuls	%f4, %f7, %f7
	call	SYM(t0_subr3)
	.word	0x81a14d25	! t0_kref+0x1ca4:   	fsmuld	%f5, %f5, %f0
	.word	0xa902ecf4	! t0_kref+0x1ca8:   	taddcc	%o3, 0xcf4, %l4
	.word	0x8fa64920	! t0_kref+0x1cac:   	fmuls	%f25, %f0, %f7
	.word	0xfdee101a	! t0_kref+0x1cb0:   	prefetcha	%i0 + %i2, 30
	.word	0xc93e401d	! t0_kref+0x1cb4:   	std	%f4, [%i1 + %i5]
	.word	0x9aa5c01a	! t0_kref+0x1cb8:   	subcc	%l7, %i2, %o5
	.word	0xac94f6ab	! t0_kref+0x1cbc:   	orcc	%l3, -0x955, %l6
	.word	0xa29221c7	! t0_kref+0x1cc0:   	orcc	%o0, 0x1c7, %l1
	.word	0xd4f6501d	! t0_kref+0x1cc4:   	stxa	%o2, [%i1 + %i5]0x80
	.word	0xded0105b	! t0_kref+0x1cc8:   	ldsha	[%g0 + %i3]0x82, %o7
	.word	0x9ad4c01a	! t0_kref+0x1ccc:   	umulcc	%l3, %i2, %o5
	.word	0xa1a0012a	! t0_kref+0x1cd0:   	fabss	%f10, %f16
	.word	0x9fc00004	! t0_kref+0x1cd4:   	call	%g0 + %g4
	.word	0xf4270018	! t0_kref+0x1cd8:   	st	%i2, [%i4 + %i0]
	.word	0xc7ee1016	! t0_kref+0x1cdc:   	prefetcha	%i0 + %l6, 3
	.word	0xcf00a00c	! t0_kref+0x1ce0:   	ld	[%g2 + 0xc], %f7
	.word	0x81a88aa0	! t0_kref+0x1ce4:   	fcmpes	%fcc0, %f2, %f0
	.word	0x81ab804a	! t0_kref+0x1ce8:   	fmovdule	%fcc0, %f10, %f0
	.word	0xea90a01c	! t0_kref+0x1cec:   	lduha	[%g2 + 0x1c]%asi, %l5
	.word	0xe1a0a010	! t0_kref+0x1cf0:   	sta	%f16, [%g2 + 0x10]%asi
	.word	0x81868000	! t0_kref+0x1cf4:   	wr	%i2, %g0, %y
	.word	0x20480003	! t0_kref+0x1cf8:   	bn,a,pt	%icc, _kref+0x1d04
	.word	0x952dc00b	! t0_kref+0x1cfc:   	sll	%l7, %o3, %o2
	.word	0xf4b0a00a	! t0_kref+0x1d00:   	stha	%i2, [%g2 + 0xa]%asi
	.word	0x85a00137	! t0_kref+0x1d04:   	fabss	%f23, %f2
	.word	0xa465001a	! t0_kref+0x1d08:   	subc	%l4, %i2, %l2
	.word	0xe96e401c	! t0_kref+0x1d0c:   	prefetch	%i1 + %i4, 20
	sethi	%hi(2f), %o7
	.word	0xe40be138	! t0_kref+0x1d14:   	ldub	[%o7 + 0x138], %l2
	.word	0xa41ca00c	! t0_kref+0x1d18:   	xor	%l2, 0xc, %l2
	.word	0xe42be138	! t0_kref+0x1d1c:   	stb	%l2, [%o7 + 0x138]
	.word	0x81dbe138	! t0_kref+0x1d20:   	flush	%o7 + 0x138
	.word	0x2d800002	! t0_kref+0x1d24:   	fbg,a	_kref+0x1d2c
	.word	0x95a01a37	! t0_kref+0x1d28:   	fstoi	%f23, %f10
	.word	0xa9418000	! t0_kref+0x1d2c:   	mov	%fprs, %l4
	.word	0xa2c2a49a	! t0_kref+0x1d30:   	addccc	%o2, 0x49a, %l1
	.word	0x980b4016	! t0_kref+0x1d34:   	and	%o5, %l6, %o4
2:	.word	0x95a0012f	! t0_kref+0x1d38:   	fabss	%f15, %f10
	.word	0x9e3ac000	! t0_kref+0x1d3c:   	not	%o3, %o7
	.word	0xcc1f4005	! t0_kref+0x1d40:   	ldd	[%i5 + %g5], %g6
	.word	0xd8c0a020	! t0_kref+0x1d44:   	ldswa	[%g2 + 0x20]%asi, %o4
	.word	0xae8d4009	! t0_kref+0x1d48:   	andcc	%l5, %o1, %l7
	.word	0x9fc00004	! t0_kref+0x1d4c:   	call	%g0 + %g4
	.word	0xaf2d0013	! t0_kref+0x1d50:   	sll	%l4, %l3, %l7
	.word	0x878020d0	! t0_kref+0x1d54:   	mov	0xd0, %asi
	.word	0x3c800001	! t0_kref+0x1d58:   	bpos,a	_kref+0x1d5c
	.word	0xdd00a02c	! t0_kref+0x1d5c:   	ld	[%g2 + 0x2c], %f14
	.word	0x81dec01c	! t0_kref+0x1d60:   	flush	%i3 + %i4
	.word	0xf420a004	! t0_kref+0x1d64:   	st	%i2, [%g2 + 4]
	.word	0x969df21b	! t0_kref+0x1d68:   	xorcc	%l7, -0xde5, %o3
	.word	0xa6f237f2	! t0_kref+0x1d6c:   	udivcc	%o0, -0x80e, %l3
	.word	0x28800003	! t0_kref+0x1d70:   	bleu,a	_kref+0x1d7c
	.word	0xb3abc030	! t0_kref+0x1d74:   	fmovso	%fcc0, %f16, %f25
	.word	0x81dc6e97	! t0_kref+0x1d78:   	flush	%l1 + 0xe97
	.word	0x90b4c015	! t0_kref+0x1d7c:   	orncc	%l3, %l5, %o0
	.word	0x39800008	! t0_kref+0x1d80:   	fbuge,a	_kref+0x1da0
	.word	0x9a8d6d70	! t0_kref+0x1d84:   	andcc	%l5, 0xd70, %o5
	.word	0xf53e7fe0	! t0_kref+0x1d88:   	std	%f26, [%i1 - 0x20]
	.word	0x8fa000b9	! t0_kref+0x1d8c:   	fnegs	%f25, %f7
	.word	0xe206001c	! t0_kref+0x1d90:   	ld	[%i0 + %i4], %l1
	.word	0xc96e6008	! t0_kref+0x1d94:   	prefetch	%i1 + 8, 4
	.word	0x905b400b	! t0_kref+0x1d98:   	smul	%o5, %o3, %o0
	.word	0xd81e6010	! t0_kref+0x1d9c:   	ldd	[%i1 + 0x10], %o4
	.word	0xa03d37c2	! t0_kref+0x1da0:   	xnor	%l4, -0x83e, %l0
	.word	0xa0a02851	! t0_kref+0x1da4:   	subcc	%g0, 0x851, %l0
	.word	0xb1a309ce	! t0_kref+0x1da8:   	fdivd	%f12, %f14, %f24
	.word	0xa4d24000	! t0_kref+0x1dac:   	umulcc	%o1, %g0, %l2
	.word	0xde5e0000	! t0_kref+0x1db0:   	ldx	[%i0], %o7
	.word	0x9aba0015	! t0_kref+0x1db4:   	xnorcc	%o0, %l5, %o5
	.word	0xc12e2014	! t0_kref+0x1db8:   	st	%fsr, [%i0 + 0x14]
	.word	0x85a089c0	! t0_kref+0x1dbc:   	fdivd	%f2, %f0, %f2
	call	SYM(t0_subr2)
	.word	0xd220a008	! t0_kref+0x1dc4:   	st	%o1, [%g2 + 8]
	.word	0xc700a03c	! t0_kref+0x1dc8:   	ld	[%g2 + 0x3c], %f3
	.word	0x985b000a	! t0_kref+0x1dcc:   	smul	%o4, %o2, %o4
	.word	0x87a00128	! t0_kref+0x1dd0:   	fabss	%f8, %f3
	.word	0x9de3bfa0	! t0_kref+0x1dd4:   	save	%sp, -0x60, %sp
	.word	0x93ef001a	! t0_kref+0x1dd8:   	restore	%i4, %i2, %o1
	.word	0x86102002	! t0_kref+0x1ddc:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x1de0:   	bne,a	_kref+0x1de0
	.word	0x86a0e001	! t0_kref+0x1de4:   	subcc	%g3, 1, %g3
	.word	0xb5a68822	! t0_kref+0x1de8:   	fadds	%f26, %f2, %f26
	.word	0xd01f4018	! t0_kref+0x1dec:   	ldd	[%i5 + %i0], %o0
	.word	0x81ab8ad8	! t0_kref+0x1df0:   	fcmped	%fcc0, %f14, %f24
	.word	0x93a01897	! t0_kref+0x1df4:   	fitos	%f23, %f9
	.word	0xc700a024	! t0_kref+0x1df8:   	ld	[%g2 + 0x24], %f3
	.word	0x9fc10000	! t0_kref+0x1dfc:   	call	%g4
	.word	0x95a14d31	! t0_kref+0x1e00:   	fsmuld	%f5, %f17, %f10
	.word	0xab228016	! t0_kref+0x1e04:   	mulscc	%o2, %l6, %l5
	.word	0xd2b6501b	! t0_kref+0x1e08:   	stha	%o1, [%i1 + %i3]0x80
	.word	0x9a42c009	! t0_kref+0x1e0c:   	addc	%o3, %o1, %o5
	.word	0xf4380019	! t0_kref+0x1e10:   	std	%i2, [%g0 + %i1]
	.word	0xa9256e06	! t0_kref+0x1e14:   	mulscc	%l5, 0xe06, %l4
	.word	0x8184c000	! t0_kref+0x1e18:   	wr	%l3, %g0, %y
	.word	0x99a08d38	! t0_kref+0x1e1c:   	fsmuld	%f2, %f24, %f12
	.word	0xd91fbf50	! t0_kref+0x1e20:   	ldd	[%fp - 0xb0], %f12
	.word	0x81aa8ac2	! t0_kref+0x1e24:   	fcmped	%fcc0, %f10, %f2
	.word	0x28480003	! t0_kref+0x1e28:   	bleu,a,pt	%icc, _kref+0x1e34
	.word	0xea7e3fe0	! t0_kref+0x1e2c:   	swap	[%i0 - 0x20], %l5
	.word	0xc93e7fe0	! t0_kref+0x1e30:   	std	%f4, [%i1 - 0x20]
	.word	0xd2363ff0	! t0_kref+0x1e34:   	sth	%o1, [%i0 - 0x10]
	.word	0x8143e040	! t0_kref+0x1e38:   	membar	0x40
	.word	0xa664a954	! t0_kref+0x1e3c:   	subc	%l2, 0x954, %l3
	.word	0xec20a02c	! t0_kref+0x1e40:   	st	%l6, [%g2 + 0x2c]
	.word	0x99a34925	! t0_kref+0x1e44:   	fmuls	%f13, %f5, %f12
	.word	0xc0b6501b	! t0_kref+0x1e48:   	stha	%g0, [%i1 + %i3]0x80
	.word	0xc56e0017	! t0_kref+0x1e4c:   	prefetch	%i0 + %l7, 2
	.word	0xd0400018	! t0_kref+0x1e50:   	ldsw	[%g0 + %i0], %o0
	.word	0xec367ff6	! t0_kref+0x1e54:   	sth	%l6, [%i1 - 0xa]
	.word	0x9fc00004	! t0_kref+0x1e58:   	call	%g0 + %g4
	.word	0xc9be1809	! t0_kref+0x1e5c:   	stda	%f4, [%i0 + %o1]0xc0
	.word	0xef20a008	! t0_kref+0x1e60:   	st	%f23, [%g2 + 8]
	.word	0x89abc021	! t0_kref+0x1e64:   	fmovso	%fcc0, %f1, %f4
	.word	0xc53f4018	! t0_kref+0x1e68:   	std	%f2, [%i5 + %i0]
	.word	0xe828a024	! t0_kref+0x1e6c:   	stb	%l4, [%g2 + 0x24]
	.word	0xf5380019	! t0_kref+0x1e70:   	std	%f26, [%g0 + %i1]
	.word	0xd4500018	! t0_kref+0x1e74:   	ldsh	[%g0 + %i0], %o2
	.word	0xec062004	! t0_kref+0x1e78:   	ld	[%i0 + 4], %l6
	call	SYM(t0_subr3)
	.word	0x9ba0012e	! t0_kref+0x1e80:   	fabss	%f14, %f13
	.word	0x9fc10000	! t0_kref+0x1e84:   	call	%g4
	.word	0x94f4b432	! t0_kref+0x1e88:   	udivcc	%l2, -0xbce, %o2
	.word	0x83414000	! t0_kref+0x1e8c:   	mov	%pc, %g1
	.word	0x87ab0036	! t0_kref+0x1e90:   	fmovsuge	%fcc0, %f22, %f3
	.word	0xe520a01c	! t0_kref+0x1e94:   	st	%f18, [%g2 + 0x1c]
	.word	0x95a0cd35	! t0_kref+0x1e98:   	fsmuld	%f3, %f21, %f10
	.word	0xa1a14d22	! t0_kref+0x1e9c:   	fsmuld	%f5, %f2, %f16
	.word	0x81a01932	! t0_kref+0x1ea0:   	fstod	%f18, %f0
	.word	0xd300a020	! t0_kref+0x1ea4:   	ld	[%g2 + 0x20], %f9
	.word	0xa0032045	! t0_kref+0x1ea8:   	add	%o4, 0x45, %l0
	.word	0x89a00054	! t0_kref+0x1eac:   	fmovd	%f20, %f4
	.word	0xe6263fe4	! t0_kref+0x1eb0:   	st	%l3, [%i0 - 0x1c]
	.word	0x8ba01a56	! t0_kref+0x1eb4:   	fdtoi	%f22, %f5
	.word	0xd6b6101b	! t0_kref+0x1eb8:   	stha	%o3, [%i0 + %i3]0x80
	.word	0x9de3bfa0	! t0_kref+0x1ebc:   	save	%sp, -0x60, %sp
	.word	0xb0576eb7	! t0_kref+0x1ec0:   	umul	%i5, 0xeb7, %i0
	.word	0xa7e8294a	! t0_kref+0x1ec4:   	restore	%g0, 0x94a, %l3
	.word	0xde965000	! t0_kref+0x1ec8:   	lduha	[%i1]0x80, %o7
	.word	0xf4ae9018	! t0_kref+0x1ecc:   	stba	%i2, [%i2 + %i0]0x80
	.word	0x27480005	! t0_kref+0x1ed0:   	fbul,a,pt	%fcc0, _kref+0x1ee4
	.word	0xda363ff2	! t0_kref+0x1ed4:   	sth	%o5, [%i0 - 0xe]
	.word	0x2e480007	! t0_kref+0x1ed8:   	bvs,a,pt	%icc, _kref+0x1ef4
	.word	0xd436c018	! t0_kref+0x1edc:   	sth	%o2, [%i3 + %i0]
	.word	0xada9c040	! t0_kref+0x1ee0:   	fmovdu	%fcc0, %f0, %f22
	.word	0xd08e101a	! t0_kref+0x1ee4:   	lduba	[%i0 + %i2]0x80, %o0
	.word	0xa1a30d20	! t0_kref+0x1ee8:   	fsmuld	%f12, %f0, %f16
	.word	0x9135c01a	! t0_kref+0x1eec:   	srl	%l7, %i2, %o0
	.word	0xd0180019	! t0_kref+0x1ef0:   	ldd	[%g0 + %i1], %o0
	.word	0xac1cb2ad	! t0_kref+0x1ef4:   	xor	%l2, -0xd53, %l6
	.word	0xafa000a8	! t0_kref+0x1ef8:   	fnegs	%f8, %f23
	.word	0xaf352012	! t0_kref+0x1efc:   	srl	%l4, 0x12, %l7
	.word	0x9e520014	! t0_kref+0x1f00:   	umul	%o0, %l4, %o7
	.word	0xe0564000	! t0_kref+0x1f04:   	ldsh	[%i1], %l0
	.word	0x932ca00a	! t0_kref+0x1f08:   	sll	%l2, 0xa, %o1
	.word	0x81ab0ac4	! t0_kref+0x1f0c:   	fcmped	%fcc0, %f12, %f4
	.word	0x99a18840	! t0_kref+0x1f10:   	faddd	%f6, %f0, %f12
	.word	0xd600a018	! t0_kref+0x1f14:   	ld	[%g2 + 0x18], %o3
	.word	0x81a88a42	! t0_kref+0x1f18:   	fcmpd	%fcc0, %f2, %f2
	.word	0xa8b4a579	! t0_kref+0x1f1c:   	orncc	%l2, 0x579, %l4
	.word	0x987b401a	! t0_kref+0x1f20:   	sdiv	%o5, %i2, %o4
	.word	0xee48a00a	! t0_kref+0x1f24:   	ldsb	[%g2 + 0xa], %l7
	.word	0xa205c009	! t0_kref+0x1f28:   	add	%l7, %o1, %l1
	.word	0x29800004	! t0_kref+0x1f2c:   	fbl,a	_kref+0x1f3c
	.word	0xe9be1808	! t0_kref+0x1f30:   	stda	%f20, [%i0 + %o0]0xc0
	.word	0x81de2a72	! t0_kref+0x1f34:   	flush	%i0 + 0xa72
	.word	0xa244e773	! t0_kref+0x1f38:   	addc	%l3, 0x773, %l1
	call	SYM(_kaos_done)
	.word	0x01000000	! t0_kref+0x1f40:   	nop
	KGLOBAL(t0_ktbl_end)
t0_ktbl_end:
t0_ktbl_page_end:

KTEXT_MODULE(t0_module_subr0, 0x27c3a000)
.seg "text"
t0_subr0_page_begin:
	.skip 8184
.global _t0_subr0; ENTRY(t0_subr0)
	.word	0xa6844012	! t0_subr0+0x0:   	addcc	%l1, %l2, %l3
	.word	0x81c3e008	! t0_subr0+0x4:   	retl
	.word	0xaa64c014	! t0_subr0+0x8:   	subc	%l3, %l4, %l5
t0_subr0_page_end:

KTEXT_MODULE(t0_module_subr1, 0x5e91e000)
.seg "text"
t0_subr1_page_begin:
	.skip 8184
.global _t0_subr1; ENTRY(t0_subr1)
	.word	0x9de3bfa0	! t0_subr1+0x0:   	save	%sp, -0x60, %sp
	.word	0xb29eaa5a	! t0_subr1+0x4:   	xorcc	%i2, 0xa5a, %i1
	.word	0x81c7e008	! t0_subr1+0x8:   	ret
	.word	0xa7ee6001	! t0_subr1+0xc:   	restore	%i1, 1, %l3
t0_subr1_page_end:

KTEXT_MODULE(t0_module_subr2, 0x69dfa000)
.seg "text"
t0_subr2_page_begin:
	.skip 8184
.global _t0_subr2; ENTRY(t0_subr2)
	.word	0x9de3bfa0	! t0_subr2+0x0:   	save	%sp, -0x60, %sp
	.word	0xb2066001	! t0_subr2+0x4:   	add	%i1, 1, %i1
	.word	0x81c7e008	! t0_subr2+0x8:   	ret
	.word	0xa3ee6001	! t0_subr2+0xc:   	restore	%i1, 1, %l1
t0_subr2_page_end:

KTEXT_MODULE(t0_module_subr3, 0x69e80000)
.seg "text"
t0_subr3_page_begin:
	.skip 8124
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
!  Total operations: 1912  
!
!  Operation frequencies
!
!  name               exp    obs
!  ldsb              1.45   1.15
!  ldub              0.24   0.21
!  ldsh              0.78   1.26
!  lduh              0.22   0.31
!  ld                1.02   1.05
!  ldd               0.80   0.84
!  swap              1.31   1.05
!  ldstub            0.09   0.05
!  stb               0.20   0.47
!  sth               1.23   1.41
!  st                1.02   0.99
!  std               0.15   0.10
!  add               1.39   1.31
!  addcc             0.50   0.42
!  addx              1.11   1.20
!  addxcc            0.61   0.47
!  taddcc            0.28   0.26
!  taddcctv          0.06   0.10
!  sub               0.03   0.05
!  subcc             0.41   0.58
!  subx              1.36   1.57
!  subxcc            0.79   1.05
!  tsubcc            0.34   0.42
!  tsubcctv          0.27   0.31
!  mulscc            0.84   0.58
!  and               0.30   0.58
!  andcc             1.36   1.36
!  andn              0.05   0.16
!  andncc            0.28   0.31
!  or                0.10   0.16
!  orcc              0.75   0.73
!  orn               0.09   0.00
!  orncc             1.21   1.31
!  xor               0.48   0.63
!  xorcc             1.40   1.05
!  xnor              0.88   0.73
!  xnorcc            1.10   1.31
!  sll               1.14   0.94
!  srl               1.21   1.26
!  sra               1.00   0.89
!  unimp             0.25   0.16
!  umul              1.05   1.05
!  smul              1.31   1.15
!  udiv              0.03   0.16
!  sdiv              0.86   0.94
!  umulcc            1.43   1.62
!  smulcc            0.75   0.94
!  udivcc            0.81   1.20
!  sdivcc            0.32   0.31
!  rdy               1.23   1.31
!  wry               0.83   0.58
!  bicc              1.49   1.36
!  sethi             0.25   0.16
!  jmpl              1.68   2.09
!  call              1.01   0.99
!  ticc              0.00   0.00
!  flush             1.62   2.14
!  save              0.29   0.26
!  restore           1.35   0.00
!  stbar             0.25   0.31
!  ldf               0.11   0.26
!  lddf              0.98   1.15
!  stf               0.11   0.00
!  stdf              1.34   2.20
!  fadds             1.56   1.57
!  fsubs             0.67   0.68
!  fmuls             1.67   2.25
!  fdivs             0.36   0.42
!  faddd             0.57   0.47
!  fsubd             0.06   0.05
!  fmuld             0.02   0.00
!  fdivd             0.20   0.37
!  faddq             0.00   0.00
!  fsubq             0.00   0.00
!  fmulq             0.00   0.00
!  fdivq             0.00   0.00
!  fsmuld            1.17   1.62
!  fdmulq            0.00   0.00
!  fitos             0.59   0.26
!  fitod             0.13   0.00
!  fitoq             0.00   0.00
!  fstoi             1.68   2.04
!  fstod             0.81   0.89
!  fstoq             0.00   0.00
!  fdtoi             0.32   0.37
!  fdtos             0.22   0.05
!  fdtoq             0.00   0.00
!  fqtoi             0.00   0.00
!  fqtos             0.00   0.00
!  fqtod             0.00   0.00
!  fmovs             0.62   0.42
!  fnegs             0.67   0.47
!  fabss             0.75   1.05
!  fsqrts            0.06   0.00
!  fsqrtd            0.00   0.00
!  fsqrtq            0.00   0.00
!  fcmps             0.01   0.05
!  fcmpd             0.63   0.52
!  fcmpq             0.00   0.00
!  fcmpes            0.71   0.73
!  fcmped            1.24   1.41
!  fcmpeq            0.00   0.00
!  fbfcc             4.01   4.03
!  ldfsr             0.08   0.00
!  stfsr             0.26   0.16
!  loop              1.63   0.84
!  offset            0.04   0.00
!  area              0.29   0.58
!  target            0.09   0.05
!  goto              0.06   0.00
!  sigsegv           0.14   0.21
!  sigbus            0.33   0.31
!  imodify           1.60   0.68
!  ldfsr_offset      0.10   0.00
!  fpattern          0.84   0.89
!  lbranch           0.32   0.47
!  shmld             5.14   4.92
!  shmst             4.40   4.86
!  shmpf             0.16   0.16
!  shmswap           0.09   0.16
!  shmblkld          0.95   0.05
!  shmblkst          1.52   0.00
!  shmblkchk         0.50   0.37
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
!  casa              0.00   0.00
!  rdasi             0.09   0.10
!  wrasi             0.07   0.10
!  bpcc              1.99   1.88
!  fbpfcc            1.34   0.94
!  fmovscc           0.24   0.37
!  fmovdcc           0.32   0.52
!  fmovqcc           0.00   0.00
!  movcc             0.01   0.00
!  flushw            0.05   0.00
!  membar            0.30   0.21
!  prefetch          1.44   1.88
!  rdpc              0.05   0.05
!  ldqf              0.00   0.00
!  stqf              0.00   0.00
!  ldfa              0.29   0.42
!  lddfa             0.04   0.00
!  ldqfa             0.00   0.00
!  ldsba             0.16   0.16
!  ldsha             0.07   0.00
!  lduba             0.10   0.16
!  lduha             0.19   0.21
!  lda               0.31   0.47
!  ldda              0.24   0.26
!  ldstuba           0.28   0.21
!  prefetcha         1.65   1.88
!  stfa              0.00   0.00
!  stdfa             0.02   0.05
!  stqfa             0.00   0.00
!  stba              0.17   0.10
!  stha              0.21   0.52
!  sta               0.13   0.00
!  stda              0.01   0.00
!  swapa             0.23   0.37
!  fmovd             0.11   0.16
!  fnegd             0.13   0.26
!  fabsd             0.17   0.31
!  fstox             0.27   0.10
!  fdtox             0.08   0.00
!  fxtos             0.32   0.21
!  fxtod             0.09   0.05
!  lds               0.16   0.16
!  ldsa              0.14   0.00
!  ldx               0.24   0.37
!  ldxa              0.05   0.05
!  nofault           0.20   0.26
!  rdgsr             0.00   0.00
!  wrgsr             0.00   0.00
!  fpadd16           0.00   0.00
!  fpadd16s          0.00   0.00
!  fpadd32           0.00   0.00
!  fpadd32s          0.00   0.00
!  fpsub16           0.00   0.00
!  fpsub16s          0.00   0.00
!  fpsub32           0.00   0.00
!  fpsub32s          0.00   0.00
!  fpack16           0.00   0.00
!  fpack32           0.00   0.00
!  fpackfix          0.00   0.00
!  fexpand           0.00   0.00
!  fpmerge           0.00   0.00
!  fmul8x16          0.00   0.00
!  fmul8x16au        0.00   0.00
!  fmul8x16al        0.00   0.00
!  fmul8sux16        0.00   0.00
!  fmul8ulx16        0.00   0.00
!  fmuld8sux16       0.00   0.00
!  fmuld8ulx16       0.00   0.00
!  alignaddr         0.00   0.00
!  alignaddrl        0.00   0.00
!  faligndata        0.00   0.00
!  fzero             0.00   0.00
!  fzeros            0.00   0.00
!  fone              0.00   0.00
!  fones             0.00   0.00
!  fsrc1             0.00   0.00
!  fsrc1s            0.00   0.00
!  fsrc2             0.00   0.00
!  fsrc2s            0.00   0.00
!  fnot1             0.00   0.00
!  fnot1s            0.00   0.00
!  fnot2             0.00   0.00
!  fnot2s            0.00   0.00
!  for               0.00   0.00
!  fors              0.00   0.00
!  fnor              0.00   0.00
!  fnors             0.00   0.00
!  fand              0.00   0.00
!  fands             0.00   0.00
!  fnand             0.00   0.00
!  fnands            0.00   0.00
!  fxor              0.00   0.00
!  fxors             0.00   0.00
!  fxnor             0.00   0.00
!  fxnors            0.00   0.00
!  fornot1           0.00   0.00
!  fornot1s          0.00   0.00
!  fornot2           0.00   0.00
!  fornot2s          0.00   0.00
!  fandnot1          0.00   0.00
!  fandnot1s         0.00   0.00
!  fandnot2          0.00   0.00
!  fandnot2s         0.00   0.00
!  fcmpgt16          0.00   0.00
!  fcmpgt32          0.00   0.00
!  fcmple16          0.00   0.00
!  fcmple32          0.00   0.00
!  fcmpne16          0.00   0.00
!  fcmpne32          0.00   0.00
!  fcmpeq16          0.00   0.00
!  fcmpeq32          0.00   0.00
!  edge8             0.00   0.00
!  edge8l            0.00   0.00
!  edge16            0.00   0.00
!  edge16l           0.00   0.00
!  edge32            0.00   0.00
!  edge32l           0.00   0.00
!  pdist             0.00   0.00
!  partial_st8       0.27   0.37
!  partial_st16      0.19   0.16
!  partial_st32      0.13   0.21
!  short_st8         0.01   0.05
!  short_st16        0.06   0.05
!  short_ld8         0.21   0.16
!  short_ld16        0.28   0.42
!  blkld             0.30   0.00
!  blkst             0.17   0.00
!  blkld_offset      0.06   0.00
!  blkst_offset      0.24   0.00
!  blk_check         0.29   0.31
!  casxa             0.15   0.10
!  rdccr             0.13   0.16
!  rdfprs            0.26   0.31
!  wrccr             0.15   0.26
!  popc              0.05   0.00
!  wrfprs            0.19   0.58
!  stx               0.28   0.47
!  stxa              0.15   0.21
!  cflush            0.00   0.00
!  array8            0.00   0.00
!  array16           0.00   0.00
!  array32           0.00   0.00
!  edge8n            0.00   0.00
!  edge8ln           0.00   0.00
!  edge16n           0.00   0.00
!  edge16ln          0.00   0.00
!  edge32n           0.00   0.00
!  edge32ln          0.00   0.00
!  bmask             0.00   0.00
!  bshuffle          0.00   0.00
!  siam              0.00   0.00
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
KDATA_MODULE(t0_module_offset_table, 0x3a910000)
.seg "data"
t0_offset_table_start:
t0_offset_table_size:	.word	0x00000008
t0_offset_table:
	.word	0xffffffe0
	.word	0x00000010
	.word	0xfffffff8
	.word	0xffffffe8
	.word	0x00000000
	.word	0x00000008
	.word	0x00000018
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

KDATA_MODULE(t0_module_data_in_regs, 0x19eac000)
.seg "data"
KGLOBAL(t0_data_in_regs)
t0_data_in_regs_start:
t0_data_in_regs:
	.word	0x403f45d7          ! %f0
	.word	0xed8f849d          ! %f1
	.word	0x6a31c860          ! %f2
	.word	0x220562b5          ! %f3
	.word	0xab214891          ! %f4
	.word	0xb5c16272          ! %f5
	.word	0x14763ca8          ! %f6
	.word	0x5255509f          ! %f7
	.word	0x61c72a21          ! %f8
	.word	0xc32c0d86          ! %f9
	.word	0x69e6eac3          ! %f10
	.word	0x7c05f14c          ! %f11
	.word	0x3d3d395f          ! %f12
	.word	0xacc589c8          ! %f13
	.word	0x09440d17          ! %f14
	.word	0x100fc4f2          ! %f15
	.word	0x3e0edb39          ! %f16
	.word	0x8d41f368          ! %f17
	.word	0xc5c2eae2          ! %f18
	.word	0x3a6dc09d          ! %f19
	.word	0x76824b0d          ! %f20
	.word	0x92bfda9d          ! %f21
	.word	0x3e9302b6          ! %f22
	.word	0xc4e4999b          ! %f23
	.word	0xdf5f8c3a          ! %f24
	.word	0x60f817a2          ! %f25
	.word	0x9166e823          ! %f26
	.word	0x8c68e319          ! %f27
	.word	0x9e3c60f4          ! %f28
	.word	0xa2c85b00          ! %f29
	.word	0xc6c0c8b5          ! %f30
	.word	0x8616e20d          ! %f31
	.word	0xd9905a57          ! %f32
	.word	0x879ffe13          ! %f33
	.word	0xae4dcc20          ! %f34
	.word	0x72793b57          ! %f35
	.word	0x4f7155be          ! %f36
	.word	0xabcad7c6          ! %f37
	.word	0x1e9ac3b9          ! %f38
	.word	0xaa09e022          ! %f39
	.word	0xe109fb55          ! %f40
	.word	0xf80e19a0          ! %f41
	.word	0x511fdd28          ! %f42
	.word	0xa6aadc90          ! %f43
	.word	0x5be111ed          ! %f44
	.word	0x89c77904          ! %f45
	.word	0xb9484c5c          ! %f46
	.word	0xb98aec96          ! %f47
	.word	0x4421bc0f          ! %f48
	.word	0x60ff28b4          ! %f49
	.word	0xc5f620be          ! %f50
	.word	0x85c3fb23          ! %f51
	.word	0xdd81f253          ! %f52
	.word	0xd9e16696          ! %f53
	.word	0x7851b9a9          ! %f54
	.word	0x8c3fef87          ! %f55
	.word	0x5c65cef1          ! %f56
	.word	0x531ca1bb          ! %f57
	.word	0x53b78e18          ! %f58
	.word	0x27526d13          ! %f59
	.word	0x0bb37e98          ! %f60
	.word	0x8eed7c9c          ! %f61
	.word	0x888e3ba0          ! %f62
	.word	0x7a3c68fc          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0x5b4       ! %g1 (code pointer)
	.word	t0_data_in_shm_area ! %g2 (shared area pointer)
	.word	0xfb640fde          ! %g3 (loop index)
	.word	SYM(t0_subr3)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0x723b37cb          ! %o0
	.word	0x17663e6a          ! %o1
	.word	0x08115a77          ! %o2
	.word	0xf19cbe41          ! %o3
	.word	0x60910682          ! %o4
	.word	0x1a50c2d1          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0x66b4ea7e          ! %l0
	.word	0x99722fa6          ! %l1
	.word	0x39fa10a1          ! %l2
	.word	0xecb8ba84          ! %l3
	.word	0x16a16fb8          ! %l4
	.word	0x50730ff8          ! %l5
	.word	0xac0285b8          ! %l6
	.word	0x0aff095b          ! %l7
	.word	t0_data_in_area0    ! %i0 (area pointer)
	.word	t0_data_in_area0    ! %i1 (area pointer)
	.word	0x00000010          ! %i2 (byte offset)
	.word	0x0000000a          ! %i3 (halfword offset)
	.word	0xfffffff8          ! %i4 (word offset)
	.word	0x00000000          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0x2ffa4958          ! %y
	.word	0x00000000          ! %icc (nzvc)
	.word	0x80000d0b          ! %fsr
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

KDATA_MODULE(t0_module_data_in_stack, 0x516ea000)
.seg "data"
KGLOBAL(t0_data_in_mtbl_size)
KGLOBAL(t0_data_in_mtbl)
KGLOBAL(t0_data_in_stack)
t0_data_in_stack_start:
	.word	0xb618ec35
	.word	0xe7cc3d1e
	.word	0x46198209
	.word	0x0e6e5d44
	.word	0xe1fe02e6
	.word	0x5a89a34f
	.word	0xe842094b
	.word	0x474d11cf
	.word	0x6188aa69
	.word	0xf2e050aa
	.word	0xce70abd8
	.word	0x7da5ac68
	.word	0x1083a885
	.word	0x9920c075
	.word	0x1969b7b2
	.word	0x4174fb89
	.word	0xdf2a99f6
	.word	0xde11e596
	.word	0x93176399
	.word	0x651320e7
	.word	0x8894e0c9
	.word	0x46081c58
	.word	0x1d34d779
	.word	0x288e62d3
	.word	0x60b0a3e9
	.word	0x72d2f46e
	.word	0xe2bcc823
	.word	0x47972fe2
	.word	0xe035b3f8
	.word	0xbf2f1737
	.word	0x1af99a3f
	.word	0x57b638d0
	.word	0xf3216963
	.word	0x0579ce43
	.word	0x68804081
	.word	0x8cafc4a1
	.word	0x9dc9cfb0
	.word	0xeb37ee15
	.word	0x9d3e491b
	.word	0xd185a308
	.word	0x8ea7b219
	.word	0x6bda292a
	.word	0x3256ce72
	.word	0x4fbb610c
	.word	0xbcdc5d5e
	.word	0x0b450f3a
	.word	0x46113f14
	.word	0x0296a3e9
	.word	0x6e712ad7
	.word	0x24433cbd
	.word	0xded830e8
	.word	0xfb4fce34
	.word	0x6a9c28c8
	.word	0x046c7eb0
	.word	0x6775b3a6
	.word	0x13c55341
	.word	0xc53673f8
	.word	0xce74ee98
	.word	0x699dd689
	.word	0x29865cc8
	.word	0x7e461684
	.word	0x89834ac6
	.word	0xffaf5543
	.word	0xb12fa6c6
	.word	0x1c467ff0
	.word	0xf85e0edd
	.word	0x089da031
	.word	0xbc5fb5a0
	.word	0xbef7ea7e
	.word	0x32331091
	.word	0x0876b3d0
	.word	0x0935ca8e
	.word	0xcc2f41c3
	.word	0xe8b5a4b1
	.word	0xb02a736e
	.word	0xa3a13a36
	.word	0xfda55e76
	.word	0x788b9066
	.word	0x1f607b24
	.word	0x2cfd0997
	.word	0x075dab8b
	.word	0x81c14abc
	.word	0x1e849d03
	.word	0x4fcdf528
	.word	0x6729887f
	.word	0xca825262
	.word	0x4d017d8c
	.word	0xea374640
	.word	0xe04efcf5
	.word	0x8eda9bad
	.word	0xc3240365
	.word	0x641d1ab8
	.word	0x37ae9182
	.word	0x59125ae2
	.word	0x17998e4a
	.word	0xac3102ce
	.word	0x8e2d61c4
	.word	0xcf85aeb4
	.word	0x71262941
	.word	0xd390194c
	.word	0x25e5bbb9
	.word	0x12edef0b
	.word	0x1d4f2c11
	.word	0xf067f9e8
	.word	0xf3f1e04d
	.word	0xdb2aa406
	.word	0x8f89fff4
	.word	0x378a39ee
	.word	0x71c9b934
	.word	0x44f46943
	.word	0x2945fb8b
	.word	0x612c471c
	.word	0x176597fa
	.word	0x88c4415d
	.word	0x65238a11
	.word	0xd88bd0cc
	.word	0x7fe55257
	.word	0xaede1db6
	.word	0x161a11d3
	.word	0xb70e1f58
	.word	0xc69c4fc7
	.word	0xde159e75
	.word	0x31714ddf
	.word	0x93f2fdb9
	.word	0x4f585c5a
	.word	0x76d04ed2
	.word	0xd78a0efb
	.word	0x181a1971
	.word	0x23c254c8
	.word	0xaa38e190
	.word	0xfebd97d9
	.word	0x83e3fcab
	.word	0xe614ffc8
	.word	0x4acb31cb
	.word	0xb45a0888
	.word	0xca26069f
	.word	0x3057a8a1
	.word	0xd7990bf3
	.word	0x7d358d2c
	.word	0x10bb063b
	.word	0x040f4f00
	.word	0x2b240318
	.word	0x10b943f1
	.word	0xb3b05aff
	.word	0xba32800c
	.word	0x31a8d667
	.word	0xc1e00e3c
	.word	0xdda9c028
	.word	0x0b592cb8
	.word	0xcd7d2af4
	.word	0x28b4c123
	.word	0x55142610
	.word	0x3de31157
	.word	0xd2e89db9
	.word	0x779e691f
	.word	0xd4623dd4
	.word	0x10648275
	.word	0x43ee71de
	.word	0xc1809500
	.word	0x9a139b37
	.word	0x6b52b2e3
	.word	0xb00d5f3a
	.word	0xeba0dc20
	.word	0x6df190c5
	.word	0x72e5c713
	.word	0x984f4519
	.word	0x27a213db
	.word	0x21fb2a3b
t0_data_in_sp:
	.word	0xfab849a6
	.word	0xbd5ac53f
	.word	0x61f8e83e
	.word	0x392be925
	.word	0x3510d543
	.word	0x57d50b2d
	.word	0xc744cbfd
	.word	0x62df27c9
	.word	t0_data_in_area0
	.word	t0_data_in_area0
	.word	0xfffffffd
	.word	0xfffffffc
	.word	0xfffffffc
	.word	0xffffffe8
	.word	t0_data_in_fp
	.word	0x9f778864
	.word	0x4b445024
	.word	0x5ab605f1
	.word	0x05e47a8c
	.word	0x5199443f
	.word	0x3f24bc4c
	.word	0x29a9b710
	.word	0x8aa5e339
	.word	0x15cd534e
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
	.word   	0x76b4d1ff	! [%fp - 0xc]
	.word   	0x57511ca7	! [%fp - 0x8]
	.word   	0x70a6e9fe	! [%fp - 0x4]
.global t0_data_in_fp; t0_data_in_fp:
	.word	0x79f86378
	.word	0x38501a3f
	.word	0xeda42aa3
	.word	0xb1507603
	.word	0x6352593d
	.word	0xdbf48cb3
	.word	0xbc760243
	.word	0x4eb50645
	.word	0x7015bcb2
	.word	0xf6959251
	.word	0xf62ad0b6
	.word	0xea37d564
	.word	0x264a72c9
	.word	0x2b8fff59
	.word	0x959a7401
	.word	0x8061e6bb
	.word	0xbdac46d6
	.word	0x810f3884
	.word	0x907e0a26
	.word	0x7d5250b1
	.word	0x13b2084e
	.word	0x1482f77d
	.word	0x2f04ce82
	.word	0x9638584e
t0_data_in_stacktop:
	.word	0
t0_data_in_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_in_area0, 0x20964000)
.seg "data"
t0_data_in_area0_start:
.skip 3264
t0_data_in_area0_begin:
	.word	0xbdc240d1	! t0_data_in_area0-0x20
	.word	0x7a486290	! t0_data_in_area0-0x1c
	.word	0xa40ee976	! t0_data_in_area0-0x18
	.word	0x141b3211	! t0_data_in_area0-0x14
	.word	0xf2eec669	! t0_data_in_area0-0x10
	.word	0x96a06ba0	! t0_data_in_area0-0xc
	.word	0xe8531649	! t0_data_in_area0-0x8
	.word	0x9c1c7bff	! t0_data_in_area0-0x4
.global t0_data_in_area0; t0_data_in_area0:
	.word	0x6c60ae14	! t0_data_in_area0+0x0
	.word	0x3138aa5e	! t0_data_in_area0+0x4
	.word	0xbf9e434d	! t0_data_in_area0+0x8
	.word	0x6e9fc4ff	! t0_data_in_area0+0xc
	.word	0x6632627f	! t0_data_in_area0+0x10
	.word	0x372b25b8	! t0_data_in_area0+0x14
	.word	0xf0aa903f	! t0_data_in_area0+0x18
	.word	0x9292b565	! t0_data_in_area0+0x1c
t0_data_in_area0_end:
.skip 4864
t0_data_in_area0_stop:

KDATA_MODULE(t0_module_data_in_shm_area, 0x1f83c000)
.seg "data"
t0_data_in_shm_area_start:
t0_data_in_shm_area_begin:
.global t0_data_in_shm_area; t0_data_in_shm_area:
	.word	0xa20de314	! t0_data_in_shm_area+0x0 (t0)
	.word	0x94acc08e	! t0_data_in_shm_area+0x4 (t0)
	.word	0xf7fd4ef3	! t0_data_in_shm_area+0x8 (t0)
	.word	0x41b6accb	! t0_data_in_shm_area+0xc (t0)
	.word	0xfdc16f36	! t0_data_in_shm_area+0x10 (t0)
	.word	0xbee93dab	! t0_data_in_shm_area+0x14 (t0)
	.word	0xa311ea30	! t0_data_in_shm_area+0x18 (t0)
	.word	0x1785e927	! t0_data_in_shm_area+0x1c (t0)
	.word	0xaa5d21cb	! t0_data_in_shm_area+0x20 (t0)
	.word	0x9b070ef2	! t0_data_in_shm_area+0x24 (t0)
	.word	0xf511d6d8	! t0_data_in_shm_area+0x28 (t0)
	.word	0x3b5b8b1a	! t0_data_in_shm_area+0x2c (t0)
	.word	0xe89040fa	! t0_data_in_shm_area+0x30 (t0)
	.word	0x083c63d7	! t0_data_in_shm_area+0x34 (t0)
	.word	0xc7b7f34c	! t0_data_in_shm_area+0x38 (t0)
	.word	0xd1270b86	! t0_data_in_shm_area+0x3c (t0)
	.word	0xfd254635	! t0_data_in_shm_area+0x40 (t0 bload)
	.word	0x43822b11	! t0_data_in_shm_area+0x44
	.word	0xbbfff90e	! t0_data_in_shm_area+0x48
	.word	0x0f68f662	! t0_data_in_shm_area+0x4c
	.word	0xb0e7e279	! t0_data_in_shm_area+0x50
	.word	0xeb08fb8d	! t0_data_in_shm_area+0x54
	.word	0x1528e4a7	! t0_data_in_shm_area+0x58
	.word	0x26bffed0	! t0_data_in_shm_area+0x5c
	.word	0x823082d4	! t0_data_in_shm_area+0x60
	.word	0x115f18a5	! t0_data_in_shm_area+0x64
	.word	0xff9b77ca	! t0_data_in_shm_area+0x68
	.word	0xbc2ac06f	! t0_data_in_shm_area+0x6c
	.word	0xd8051928	! t0_data_in_shm_area+0x70
	.word	0x83760591	! t0_data_in_shm_area+0x74
	.word	0xeab439b9	! t0_data_in_shm_area+0x78
	.word	0xb493c1ee	! t0_data_in_shm_area+0x7c
	.word	0x2f772d2d	! t0_data_in_shm_area+0x80 (t0 bstore)
	.word	0xc4a95c1d	! t0_data_in_shm_area+0x84
	.word	0x028299e7	! t0_data_in_shm_area+0x88
	.word	0xeb828ce1	! t0_data_in_shm_area+0x8c
	.word	0xcfe379bb	! t0_data_in_shm_area+0x90
	.word	0xe7cfda9c	! t0_data_in_shm_area+0x94
	.word	0x638518de	! t0_data_in_shm_area+0x98
	.word	0xb125eed7	! t0_data_in_shm_area+0x9c
	.word	0x02379a49	! t0_data_in_shm_area+0xa0
	.word	0x1f7add1c	! t0_data_in_shm_area+0xa4
	.word	0x60849b62	! t0_data_in_shm_area+0xa8
	.word	0x7298b7ab	! t0_data_in_shm_area+0xac
	.word	0xc6a68cb0	! t0_data_in_shm_area+0xb0
	.word	0xe117b5da	! t0_data_in_shm_area+0xb4
	.word	0x902f4bd6	! t0_data_in_shm_area+0xb8
	.word	0x2b83891a	! t0_data_in_shm_area+0xbc
t0_data_in_shm_area_end:
t0_data_in_shm_area_stop:

KDATA_MODULE(t0_module_data_exp_regs, 0x199dc000)
.seg "data"
KGLOBAL(t0_data_exp_regs)
t0_data_exp_regs_start:
t0_data_exp_regs:
	.word	0x403f45d7          ! %f0
	.word	0xed8f849d          ! %f1
	.word	0x6a31c860          ! %f2
	.word	0x220562b5          ! %f3
	.word	0xab214891          ! %f4
	.word	0xb5c16272          ! %f5
	.word	0x14763ca8          ! %f6
	.word	0x5255509f          ! %f7
	.word	0x61c72a21          ! %f8
	.word	0xc32c0d86          ! %f9
	.word	0x69e6eac3          ! %f10
	.word	0x7c05f14c          ! %f11
	.word	0x3d3d395f          ! %f12
	.word	0xacc589c8          ! %f13
	.word	0x09440d17          ! %f14
	.word	0x100fc4f2          ! %f15
	.word	0x3e0edb39          ! %f16
	.word	0x8d41f368          ! %f17
	.word	0xc5c2eae2          ! %f18
	.word	0x3a6dc09d          ! %f19
	.word	0x76824b0d          ! %f20
	.word	0x92bfda9d          ! %f21
	.word	0x3e9302b6          ! %f22
	.word	0xc4e4999b          ! %f23
	.word	0xdf5f8c3a          ! %f24
	.word	0x60f817a2          ! %f25
	.word	0x9166e823          ! %f26
	.word	0x8c68e319          ! %f27
	.word	0x9e3c60f4          ! %f28
	.word	0xa2c85b00          ! %f29
	.word	0xc6c0c8b5          ! %f30
	.word	0x8616e20d          ! %f31
	.word	0xd9905a57          ! %f32
	.word	0x879ffe13          ! %f33
	.word	0xae4dcc20          ! %f34
	.word	0x72793b57          ! %f35
	.word	0x4f7155be          ! %f36
	.word	0xabcad7c6          ! %f37
	.word	0x1e9ac3b9          ! %f38
	.word	0xaa09e022          ! %f39
	.word	0xe109fb55          ! %f40
	.word	0xf80e19a0          ! %f41
	.word	0x511fdd28          ! %f42
	.word	0xa6aadc90          ! %f43
	.word	0x5be111ed          ! %f44
	.word	0x89c77904          ! %f45
	.word	0xb9484c5c          ! %f46
	.word	0xb98aec96          ! %f47
	.word	0x4421bc0f          ! %f48
	.word	0x60ff28b4          ! %f49
	.word	0xc5f620be          ! %f50
	.word	0x85c3fb23          ! %f51
	.word	0xdd81f253          ! %f52
	.word	0xd9e16696          ! %f53
	.word	0x7851b9a9          ! %f54
	.word	0x8c3fef87          ! %f55
	.word	0x5c65cef1          ! %f56
	.word	0x531ca1bb          ! %f57
	.word	0x53b78e18          ! %f58
	.word	0x27526d13          ! %f59
	.word	0x0bb37e98          ! %f60
	.word	0x8eed7c9c          ! %f61
	.word	0x888e3ba0          ! %f62
	.word	0x7a3c68fc          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0x5b4       ! %g1 (code pointer)
	.word	t0_data_exp_shm_area! %g2 (shared area pointer)
	.word	0xfb640fde          ! %g3 (loop index)
	.word	SYM(t0_subr3)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0x723b37cb          ! %o0
	.word	0x17663e6a          ! %o1
	.word	0x08115a77          ! %o2
	.word	0xf19cbe41          ! %o3
	.word	0x60910682          ! %o4
	.word	0x1a50c2d1          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0x66b4ea7e          ! %l0
	.word	0x99722fa6          ! %l1
	.word	0x39fa10a1          ! %l2
	.word	0xecb8ba84          ! %l3
	.word	0x16a16fb8          ! %l4
	.word	0x50730ff8          ! %l5
	.word	0xac0285b8          ! %l6
	.word	0x0aff095b          ! %l7
	.word	t0_data_exp_area0   ! %i0 (area pointer)
	.word	t0_data_exp_area0   ! %i1 (area pointer)
	.word	0x00000010          ! %i2 (byte offset)
	.word	0x0000000a          ! %i3 (halfword offset)
	.word	0xfffffff8          ! %i4 (word offset)
	.word	0x00000000          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0x2ffa4958          ! %y
	.word	0x00000000          ! %icc (nzvc)
	.word	0x80000d0b          ! %fsr
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

KDATA_MODULE(t0_module_data_exp_stack, 0x49c9c000)
.seg "data"
KGLOBAL(t0_data_exp_mtbl_size)
KGLOBAL(t0_data_exp_mtbl)
KGLOBAL(t0_data_exp_stack)
t0_data_exp_stack_start:
	.word	0xb618ec35
	.word	0xe7cc3d1e
	.word	0x46198209
	.word	0x0e6e5d44
	.word	0xe1fe02e6
	.word	0x5a89a34f
	.word	0xe842094b
	.word	0x474d11cf
	.word	0x6188aa69
	.word	0xf2e050aa
	.word	0xce70abd8
	.word	0x7da5ac68
	.word	0x1083a885
	.word	0x9920c075
	.word	0x1969b7b2
	.word	0x4174fb89
	.word	0xdf2a99f6
	.word	0xde11e596
	.word	0x93176399
	.word	0x651320e7
	.word	0x8894e0c9
	.word	0x46081c58
	.word	0x1d34d779
	.word	0x288e62d3
	.word	0x60b0a3e9
	.word	0x72d2f46e
	.word	0xe2bcc823
	.word	0x47972fe2
	.word	0xe035b3f8
	.word	0xbf2f1737
	.word	0x1af99a3f
	.word	0x57b638d0
	.word	0xf3216963
	.word	0x0579ce43
	.word	0x68804081
	.word	0x8cafc4a1
	.word	0x9dc9cfb0
	.word	0xeb37ee15
	.word	0x9d3e491b
	.word	0xd185a308
	.word	0x8ea7b219
	.word	0x6bda292a
	.word	0x3256ce72
	.word	0x4fbb610c
	.word	0xbcdc5d5e
	.word	0x0b450f3a
	.word	0x46113f14
	.word	0x0296a3e9
	.word	0x6e712ad7
	.word	0x24433cbd
	.word	0xded830e8
	.word	0xfb4fce34
	.word	0x6a9c28c8
	.word	0x046c7eb0
	.word	0x6775b3a6
	.word	0x13c55341
	.word	0xc53673f8
	.word	0xce74ee98
	.word	0x699dd689
	.word	0x29865cc8
	.word	0x7e461684
	.word	0x89834ac6
	.word	0xffaf5543
	.word	0xb12fa6c6
	.word	0x1c467ff0
	.word	0xf85e0edd
	.word	0x089da031
	.word	0xbc5fb5a0
	.word	0xbef7ea7e
	.word	0x32331091
	.word	0x0876b3d0
	.word	0x0935ca8e
	.word	0xcc2f41c3
	.word	0xe8b5a4b1
	.word	0xb02a736e
	.word	0xa3a13a36
	.word	0xfda55e76
	.word	0x788b9066
	.word	0x1f607b24
	.word	0x2cfd0997
	.word	0x075dab8b
	.word	0x81c14abc
	.word	0x1e849d03
	.word	0x4fcdf528
	.word	0x6729887f
	.word	0xca825262
	.word	0x4d017d8c
	.word	0xea374640
	.word	0xe04efcf5
	.word	0x8eda9bad
	.word	0xc3240365
	.word	0x641d1ab8
	.word	0x37ae9182
	.word	0x59125ae2
	.word	0x17998e4a
	.word	0xac3102ce
	.word	0x8e2d61c4
	.word	0xcf85aeb4
	.word	0x71262941
	.word	0xd390194c
	.word	0x25e5bbb9
	.word	0x12edef0b
	.word	0x1d4f2c11
	.word	0xf067f9e8
	.word	0xf3f1e04d
	.word	0xdb2aa406
	.word	0x8f89fff4
	.word	0x378a39ee
	.word	0x71c9b934
	.word	0x44f46943
	.word	0x2945fb8b
	.word	0x612c471c
	.word	0x176597fa
	.word	0x88c4415d
	.word	0x65238a11
	.word	0xd88bd0cc
	.word	0x7fe55257
	.word	0xaede1db6
	.word	0x161a11d3
	.word	0xb70e1f58
	.word	0xc69c4fc7
	.word	0xde159e75
	.word	0x31714ddf
	.word	0x93f2fdb9
	.word	0x4f585c5a
	.word	0x76d04ed2
	.word	0xd78a0efb
	.word	0x181a1971
	.word	0x23c254c8
	.word	0xaa38e190
	.word	0xfebd97d9
	.word	0x83e3fcab
	.word	0xe614ffc8
	.word	0x4acb31cb
	.word	0xb45a0888
	.word	0xca26069f
	.word	0x3057a8a1
	.word	0xd7990bf3
	.word	0x7d358d2c
	.word	0x10bb063b
	.word	0x040f4f00
	.word	0x2b240318
	.word	0x10b943f1
	.word	0xb3b05aff
	.word	0xba32800c
	.word	0x31a8d667
	.word	0xc1e00e3c
	.word	0xdda9c028
	.word	0x0b592cb8
	.word	0xcd7d2af4
	.word	0x28b4c123
	.word	0x55142610
	.word	0x3de31157
	.word	0xd2e89db9
	.word	0x779e691f
	.word	0xd4623dd4
	.word	0x10648275
	.word	0x43ee71de
	.word	0xc1809500
	.word	0x9a139b37
	.word	0x6b52b2e3
	.word	0xb00d5f3a
	.word	0xeba0dc20
	.word	0x6df190c5
	.word	0x72e5c713
	.word	0x984f4519
	.word	0x27a213db
	.word	0x21fb2a3b
t0_data_exp_sp:
	.word	0xfab849a6
	.word	0xbd5ac53f
	.word	0x61f8e83e
	.word	0x392be925
	.word	0x3510d543
	.word	0x57d50b2d
	.word	0xc744cbfd
	.word	0x62df27c9
	.word	t0_data_exp_area0
	.word	t0_data_exp_area0
	.word	0xfffffffd
	.word	0xfffffffc
	.word	0xfffffffc
	.word	0xffffffe8
	.word	t0_data_exp_fp
	.word	0x9f778864
	.word	0x4b445024
	.word	0x5ab605f1
	.word	0x05e47a8c
	.word	0x5199443f
	.word	0x3f24bc4c
	.word	0x29a9b710
	.word	0x8aa5e339
	.word	0x15cd534e
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
	.word   	0x76b4d1ff	! [%fp - 0xc]
	.word   	0x57511ca7	! [%fp - 0x8]
	.word   	0x70a6e9fe	! [%fp - 0x4]
t0_data_exp_fp:
	.word	0x79f86378
	.word	0x38501a3f
	.word	0xeda42aa3
	.word	0xb1507603
	.word	0x6352593d
	.word	0xdbf48cb3
	.word	0xbc760243
	.word	0x4eb50645
	.word	0x7015bcb2
	.word	0xf6959251
	.word	0xf62ad0b6
	.word	0xea37d564
	.word	0x264a72c9
	.word	0x2b8fff59
	.word	0x959a7401
	.word	0x8061e6bb
	.word	0xbdac46d6
	.word	0x810f3884
	.word	0x907e0a26
	.word	0x7d5250b1
	.word	0x13b2084e
	.word	0x1482f77d
	.word	0x2f04ce82
	.word	0x9638584e
t0_data_exp_stacktop:
	.word	0
t0_data_exp_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_exp_area0, 0x7ca94000)
.seg "data"
t0_data_exp_area0_start:
.skip 3264
t0_data_exp_area0_begin:
	.word	0xbdc240d1	! t0_data_exp_area0-0x20
	.word	0x7a486290	! t0_data_exp_area0-0x1c
	.word	0xa40ee976	! t0_data_exp_area0-0x18
	.word	0x141b3211	! t0_data_exp_area0-0x14
	.word	0xf2eec669	! t0_data_exp_area0-0x10
	.word	0x96a06ba0	! t0_data_exp_area0-0xc
	.word	0xe8531649	! t0_data_exp_area0-0x8
	.word	0x9c1c7bff	! t0_data_exp_area0-0x4
.global t0_data_exp_area0; t0_data_exp_area0:
	.word	0x6c60ae14	! t0_data_exp_area0+0x0
	.word	0x3138aa5e	! t0_data_exp_area0+0x4
	.word	0xbf9e434d	! t0_data_exp_area0+0x8
	.word	0x6e9fc4ff	! t0_data_exp_area0+0xc
	.word	0x6632627f	! t0_data_exp_area0+0x10
	.word	0x372b25b8	! t0_data_exp_area0+0x14
	.word	0xf0aa903f	! t0_data_exp_area0+0x18
	.word	0x9292b565	! t0_data_exp_area0+0x1c
t0_data_exp_area0_end:
.skip 4864
t0_data_exp_area0_stop:

KDATA_MODULE(t0_module_data_exp_shm_area, 0x47e20000)
.seg "data"
t0_data_exp_shm_area_start:
t0_data_exp_shm_area_begin:
.global t0_data_exp_shm_area; t0_data_exp_shm_area:
	.word	0xa20de314	! t0_data_exp_shm_area+0x0 (t0)
	.word	0x94acc08e	! t0_data_exp_shm_area+0x4 (t0)
	.word	0xf7fd4ef3	! t0_data_exp_shm_area+0x8 (t0)
	.word	0x41b6accb	! t0_data_exp_shm_area+0xc (t0)
	.word	0xfdc16f36	! t0_data_exp_shm_area+0x10 (t0)
	.word	0xbee93dab	! t0_data_exp_shm_area+0x14 (t0)
	.word	0xa311ea30	! t0_data_exp_shm_area+0x18 (t0)
	.word	0x1785e927	! t0_data_exp_shm_area+0x1c (t0)
	.word	0xaa5d21cb	! t0_data_exp_shm_area+0x20 (t0)
	.word	0x9b070ef2	! t0_data_exp_shm_area+0x24 (t0)
	.word	0xf511d6d8	! t0_data_exp_shm_area+0x28 (t0)
	.word	0x3b5b8b1a	! t0_data_exp_shm_area+0x2c (t0)
	.word	0xe89040fa	! t0_data_exp_shm_area+0x30 (t0)
	.word	0x083c63d7	! t0_data_exp_shm_area+0x34 (t0)
	.word	0xc7b7f34c	! t0_data_exp_shm_area+0x38 (t0)
	.word	0xd1270b86	! t0_data_exp_shm_area+0x3c (t0)
	.word	0xfd254635	! t0_data_exp_shm_area+0x40 (t0 bload)
	.word	0x43822b11	! t0_data_exp_shm_area+0x44
	.word	0xbbfff90e	! t0_data_exp_shm_area+0x48
	.word	0x0f68f662	! t0_data_exp_shm_area+0x4c
	.word	0xb0e7e279	! t0_data_exp_shm_area+0x50
	.word	0xeb08fb8d	! t0_data_exp_shm_area+0x54
	.word	0x1528e4a7	! t0_data_exp_shm_area+0x58
	.word	0x26bffed0	! t0_data_exp_shm_area+0x5c
	.word	0x823082d4	! t0_data_exp_shm_area+0x60
	.word	0x115f18a5	! t0_data_exp_shm_area+0x64
	.word	0xff9b77ca	! t0_data_exp_shm_area+0x68
	.word	0xbc2ac06f	! t0_data_exp_shm_area+0x6c
	.word	0xd8051928	! t0_data_exp_shm_area+0x70
	.word	0x83760591	! t0_data_exp_shm_area+0x74
	.word	0xeab439b9	! t0_data_exp_shm_area+0x78
	.word	0xb493c1ee	! t0_data_exp_shm_area+0x7c
	.word	0x2f772d2d	! t0_data_exp_shm_area+0x80 (t0 bstore)
	.word	0xc4a95c1d	! t0_data_exp_shm_area+0x84
	.word	0x028299e7	! t0_data_exp_shm_area+0x88
	.word	0xeb828ce1	! t0_data_exp_shm_area+0x8c
	.word	0xcfe379bb	! t0_data_exp_shm_area+0x90
	.word	0xe7cfda9c	! t0_data_exp_shm_area+0x94
	.word	0x638518de	! t0_data_exp_shm_area+0x98
	.word	0xb125eed7	! t0_data_exp_shm_area+0x9c
	.word	0x02379a49	! t0_data_exp_shm_area+0xa0
	.word	0x1f7add1c	! t0_data_exp_shm_area+0xa4
	.word	0x60849b62	! t0_data_exp_shm_area+0xa8
	.word	0x7298b7ab	! t0_data_exp_shm_area+0xac
	.word	0xc6a68cb0	! t0_data_exp_shm_area+0xb0
	.word	0xe117b5da	! t0_data_exp_shm_area+0xb4
	.word	0x902f4bd6	! t0_data_exp_shm_area+0xb8
	.word	0x2b83891a	! t0_data_exp_shm_area+0xbc
t0_data_exp_shm_area_end:
t0_data_exp_shm_area_stop:



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
        ta      T_GOOD_TRAP

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


#endif ! if NIAGARA



