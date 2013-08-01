/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: kaos_02_05_2004_91.s
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
#define T0_KAOS_SEED          d2a03a6e7a00
#define T0_KAOS_ICOUNT        5000
#define T0_KAOS_AREAS         1
#define T0_KAOS_AREASIZE      64
#define T0_KAOS_AREAOFFSET    7168
#define T0_KAOS_PAGESIZE      8192
#define T0_KAOS_CODECOUNT     5002

#define T0_KAOS_BOOT_VA                  0x6ddee000
#define T0_KAOS_BOOT_PA                  0x0000000000bae000
#define T0_KAOS_BOOT_CACHEABLE           1
#define T0_KAOS_BOOT_NONCACHEABLE        0

#define T0_KAOS_STARTUP_VA               0x35eb6000
#define T0_KAOS_STARTUP_PA               0x0000000003270000
#define T0_KAOS_STARTUP_CACHEABLE        1
#define T0_KAOS_STARTUP_NONCACHEABLE     0

#define T0_KAOS_OFFSET_TBL_VA            0x497c4000
#define T0_KAOS_OFFSET_TBL_PA            0x0000000004696000
#define T0_KAOS_OFFSET_TBL_CACHEABLE     1
#define T0_KAOS_OFFSET_TBL_NONCACHEABLE  0

#define T0_KAOS_DONE_VA                  0x12506000
#define T0_KAOS_DONE_PA                  0x0000000007278000
#define T0_KAOS_DONE_CACHEABLE           1
#define T0_KAOS_DONE_NONCACHEABLE        0

#define T0_KAOS_KTBL_VA                  0x009ec000
#define T0_KAOS_KTBL_PA                  0x0000000009eaa000
#define T0_KAOS_KTBL_CACHEABLE           1
#define T0_KAOS_KTBL_NONCACHEABLE        0

#define T0_KAOS_SUBR0_VA                 0x00fe2000
#define T0_KAOS_SUBR0_PA                 0x000000000ac10000
#define T0_KAOS_SUBR0_CACHEABLE          1
#define T0_KAOS_SUBR0_NONCACHEABLE       0
#define T0_KAOS_SUBR1_VA                 0x009da000
#define T0_KAOS_SUBR1_PA                 0x000000000d5f4000
#define T0_KAOS_SUBR1_CACHEABLE          1
#define T0_KAOS_SUBR1_NONCACHEABLE       0
#define T0_KAOS_SUBR2_VA                 0x00984000
#define T0_KAOS_SUBR2_PA                 0x000000000e134000
#define T0_KAOS_SUBR2_CACHEABLE          1
#define T0_KAOS_SUBR2_NONCACHEABLE       0
#define T0_KAOS_SUBR3_VA                 0x42f46000
#define T0_KAOS_SUBR3_PA                 0x000000001142e000
#define T0_KAOS_SUBR3_CACHEABLE          1
#define T0_KAOS_SUBR3_NONCACHEABLE       0

#define T0_KAOS_EXP_REGS_VA              0x18d9a000
#define T0_KAOS_EXP_REGS_PA              0x00000000120bc000
#define T0_KAOS_EXP_REGS_CACHEABLE       1
#define T0_KAOS_EXP_REGS_NONCACHEABLE    0
#define T0_KAOS_RUN_REGS_VA              0x4a864000
#define T0_KAOS_RUN_REGS_PA              0x0000000014216000
#define T0_KAOS_RUN_REGS_CACHEABLE       1
#define T0_KAOS_RUN_REGS_NONCACHEABLE    0

#define T0_KAOS_EXP_STACK_VA             0x007a8000
#define T0_KAOS_EXP_STACK_PA             0x0000000016e4c000
#define T0_KAOS_EXP_STACK_CACHEABLE      1
#define T0_KAOS_EXP_STACK_NONCACHEABLE   0
#define T0_KAOS_RUN_STACK_VA             0x1edea000
#define T0_KAOS_RUN_STACK_PA             0x0000000019180000
#define T0_KAOS_RUN_STACK_CACHEABLE      1
#define T0_KAOS_RUN_STACK_NONCACHEABLE   0

#define T0_KAOS_AREA0
#define T0_KAOS_EXP_AREA0_VA             0x74a58000
#define T0_KAOS_EXP_AREA0_PA             0x000000001a156000
#define T0_KAOS_EXP_AREA0_CACHEABLE      1
#define T0_KAOS_EXP_AREA0_NONCACHEABLE   0
#define T0_KAOS_RUN_AREA0_VA             0x0ce0c000
#define T0_KAOS_RUN_AREA0_PA             0x000000001d000000
#define T0_KAOS_RUN_AREA0_CACHEABLE      1
#define T0_KAOS_RUN_AREA0_NONCACHEABLE   0

#define T0_KAOS_SHM_AREA
#define T0_KAOS_EXP_SHM_AREA_VA          0x31bf0000
#define T0_KAOS_EXP_SHM_AREA_PA          0x0000000000748000
#define T0_KAOS_EXP_SHM_AREA_CACHEABLE   1
#define T0_KAOS_EXP_SHM_AREA_NONCACHEABLE 0
#define T0_KAOS_RUN_SHM_AREA_VA          0x00dc4000
#define T0_KAOS_RUN_SHM_AREA_PA          0x00000000013c2000
#define T0_KAOS_RUN_SHM_AREA_CACHEABLE   1
#define T0_KAOS_RUN_SHM_AREA_NONCACHEABLE 0

#define T0_KAOS_RANVAL_00     0x51e42e10
#define T0_KAOS_RANVAL_01     0x15846091
#define T0_KAOS_RANVAL_02     0x442e9489
#define T0_KAOS_RANVAL_03     0xe8852d11
#define T0_KAOS_RANVAL_04     0xca6cd3fb
#define T0_KAOS_RANVAL_05     0x4a648ce0
#define T0_KAOS_RANVAL_06     0xc02ee9a1
#define T0_KAOS_RANVAL_07     0x3a119592
#define T0_KAOS_RANVAL_08     0xe363752b
#define T0_KAOS_RANVAL_09     0x9322a3c7
#define T0_KAOS_RANVAL_0a     0xcda7d38e
#define T0_KAOS_RANVAL_0b     0x74681c07
#define T0_KAOS_RANVAL_0c     0x446b1b2e
#define T0_KAOS_RANVAL_0d     0xf83247f4
#define T0_KAOS_RANVAL_0e     0x1abd52d6
#define T0_KAOS_RANVAL_0f     0x2f08d108
#define T0_KAOS_RANVAL_10     0xec6e9f1f
#define T0_KAOS_RANVAL_11     0xa703af75
#define T0_KAOS_RANVAL_12     0xf8faee30
#define T0_KAOS_RANVAL_13     0xdec5daea
#define T0_KAOS_RANVAL_14     0xfba4f003
#define T0_KAOS_RANVAL_15     0x69437446
#define T0_KAOS_RANVAL_16     0x1954798b
#define T0_KAOS_RANVAL_17     0x8495ca79
#define T0_KAOS_RANVAL_18     0x4928db74
#define T0_KAOS_RANVAL_19     0xe3ee5a2b
#define T0_KAOS_RANVAL_1a     0x62bdc954
#define T0_KAOS_RANVAL_1b     0x91ea06e4
#define T0_KAOS_RANVAL_1c     0x5db23c83
#define T0_KAOS_RANVAL_1d     0xaa7b1dc0
#define T0_KAOS_RANVAL_1e     0xe973d5f8
#define T0_KAOS_RANVAL_1f     0x1e6b84f8
#define T0_KAOS_RANVAL_20     0xdd78b4da
#define T0_KAOS_RANVAL_21     0xebe9a0cd
#define T0_KAOS_RANVAL_22     0xf5b613a8
#define T0_KAOS_RANVAL_23     0x2a6f3d91
#define T0_KAOS_RANVAL_24     0x41265421
#define T0_KAOS_RANVAL_25     0x3ca807df
#define T0_KAOS_RANVAL_26     0x6f57025b
#define T0_KAOS_RANVAL_27     0x8897174c
#define T0_KAOS_RANVAL_28     0x6b42d1a3
#define T0_KAOS_RANVAL_29     0xe6339d13
#define T0_KAOS_RANVAL_2a     0x44773a19
#define T0_KAOS_RANVAL_2b     0xef2b3781
#define T0_KAOS_RANVAL_2c     0x82e63c30
#define T0_KAOS_RANVAL_2d     0x6d648c34
#define T0_KAOS_RANVAL_2e     0x5d2e7775
#define T0_KAOS_RANVAL_2f     0x9a02ee70
#define T0_KAOS_RANVAL_30     0x000c4444
#define T0_KAOS_RANVAL_31     0x37b0cc08
#define T0_KAOS_RANVAL_32     0x081a6c5a
#define T0_KAOS_RANVAL_33     0x3f93b2b9
#define T0_KAOS_RANVAL_34     0xdfcf8468
#define T0_KAOS_RANVAL_35     0x7fa3c8e7
#define T0_KAOS_RANVAL_36     0x2d03590a
#define T0_KAOS_RANVAL_37     0x0a2fe011
#define T0_KAOS_RANVAL_38     0x09666bd8
#define T0_KAOS_RANVAL_39     0x168da48c
#define T0_KAOS_RANVAL_3a     0xe742b164
#define T0_KAOS_RANVAL_3b     0xe0e62d32
#define T0_KAOS_RANVAL_3c     0x6e31af65
#define T0_KAOS_RANVAL_3d     0xce461f2f
#define T0_KAOS_RANVAL_3e     0xe1985265
#define T0_KAOS_RANVAL_3f     0xdd0e0d13
#define T0_KAOS_RANVAL_40     0xe9c6649c
#define T0_KAOS_RANVAL_41     0x2f0c7dd2
#define T0_KAOS_RANVAL_42     0x1cdf0bf0
#define T0_KAOS_RANVAL_43     0x119c6f59
#define T0_KAOS_RANVAL_44     0x48dc2b28
#define T0_KAOS_RANVAL_45     0x444f01db
#define T0_KAOS_RANVAL_46     0xead982d1
#define T0_KAOS_RANVAL_47     0x3b1f940d
#define T0_KAOS_RANVAL_48     0xb9aa0874
#define T0_KAOS_RANVAL_49     0x94b9c5e2
#define T0_KAOS_RANVAL_4a     0x525caeff
#define T0_KAOS_RANVAL_4b     0xf1f7e68e
#define T0_KAOS_RANVAL_4c     0xb3c2d994
#define T0_KAOS_RANVAL_4d     0x9f9613cc
#define T0_KAOS_RANVAL_4e     0xcaad7a21
#define T0_KAOS_RANVAL_4f     0x274f13c8
#define T0_KAOS_RANVAL_50     0xbb2c7f65
#define T0_KAOS_RANVAL_51     0xa8808818
#define T0_KAOS_RANVAL_52     0x053b4253
#define T0_KAOS_RANVAL_53     0x1fadcfa5
#define T0_KAOS_RANVAL_54     0x407b28f2
#define T0_KAOS_RANVAL_55     0xf40d9678
#define T0_KAOS_RANVAL_56     0x1f394529
#define T0_KAOS_RANVAL_57     0x8723fdc3
#define T0_KAOS_RANVAL_58     0xe86c6019
#define T0_KAOS_RANVAL_59     0x715943a3
#define T0_KAOS_RANVAL_5a     0x1c3536f3
#define T0_KAOS_RANVAL_5b     0x59fe3168
#define T0_KAOS_RANVAL_5c     0x3f13bc6e
#define T0_KAOS_RANVAL_5d     0xcef82869
#define T0_KAOS_RANVAL_5e     0x87e98a42
#define T0_KAOS_RANVAL_5f     0x1d3eb8b2
#define T0_KAOS_RANVAL_60     0xef65605e
#define T0_KAOS_RANVAL_61     0x228d1207
#define T0_KAOS_RANVAL_62     0xe46e2bab
#define T0_KAOS_RANVAL_63     0xa2bfa712
#define T0_KAOS_RANVAL_64     0x1608a497
#define T0_KAOS_RANVAL_65     0x2aa7d3bc
#define T0_KAOS_RANVAL_66     0x72d2b5ca
#define T0_KAOS_RANVAL_67     0x694692fb
#define T0_KAOS_RANVAL_68     0xe01f95a7
#define T0_KAOS_RANVAL_69     0x2fc71d9c
#define T0_KAOS_RANVAL_6a     0x8b596189
#define T0_KAOS_RANVAL_6b     0x9829fad5
#define T0_KAOS_RANVAL_6c     0xf25627e3
#define T0_KAOS_RANVAL_6d     0x1ca06ca3
#define T0_KAOS_RANVAL_6e     0x403a36a2
#define T0_KAOS_RANVAL_6f     0xdbb38537
#define T0_KAOS_RANVAL_70     0xcc564589
#define T0_KAOS_RANVAL_71     0x5c6e680c
#define T0_KAOS_RANVAL_72     0x4e4a4061
#define T0_KAOS_RANVAL_73     0xb2699056
#define T0_KAOS_RANVAL_74     0x9eec1b28
#define T0_KAOS_RANVAL_75     0xc9373fe3
#define T0_KAOS_RANVAL_76     0x525acaae
#define T0_KAOS_RANVAL_77     0x6f1dc4b7
#define T0_KAOS_RANVAL_78     0x99f8463f
#define T0_KAOS_RANVAL_79     0xa901e0d9
#define T0_KAOS_RANVAL_7a     0x04e0eb4a
#define T0_KAOS_RANVAL_7b     0xa7459f2c
#define T0_KAOS_RANVAL_7c     0x3903ca24
#define T0_KAOS_RANVAL_7d     0xb10a1157
#define T0_KAOS_RANVAL_7e     0x8fb5db59
#define T0_KAOS_RANVAL_7f     0x83fd25fd
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
!    icount         5000
!    targetid       NIAGARA:SIM
!    hostid         NIAGARA:5.8
!    areas          1
!    areasize       64
!    areaoffset     7168
!    ncache         0
!    emulate_ncache 1
!    pagesize       8192
!    invsize        0
!    codecount      5002
!    code           009ec000
!    entry          009ec000
!    fsr_exceptions 00000000
!    fsr_roundmode  00000004
!    fsr_mask       c0000fff
!    seed           d2a03a6e7a00
!    va_map         0000000000400000,000000007fffffff
!    pa_cached      0000000000400000,000000007fffffff
!    pa_noncached   000001ff00000000,000001ff7fffffff
!    weights        /import/n2-aus-localdir1/ntran/n2cdmspp/verif/diag/assembly/kaos/weights_files/allv9.w
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

KTEXT_MODULE(t0_module_ktbl, 0x009ec000)
.seg "text"
	KGLOBAL(t0_ktbl)
t0_ktbl_page_begin:
.global t0_kref; t0_kref:
	.skip 0
t0_ktbl:
	.word	0x85a018c8	! t0_kref+0x0:   	fdtos	%f8, %f2
	.word	0x96bdc017	! t0_kref+0x4:   	xnorcc	%l7, %l7, %o3
	.word	0xec30a01c	! t0_kref+0x8:   	sth	%l6, [%g2 + 0x1c]
	.word	0xc100a01c	! t0_kref+0xc:   	ld	[%g2 + 0x1c], %f0
	.word	0x8fa000a9	! t0_kref+0x10:   	fnegs	%f9, %f7
	.word	0xc7266004	! t0_kref+0x14:   	st	%f3, [%i1 + 4]
	.word	0x9135c016	! t0_kref+0x18:   	srl	%l7, %l6, %o0
	.word	0x808dbd5f	! t0_kref+0x1c:   	btst	0xfffffd5f, %l6
	.word	0xec36c018	! t0_kref+0x20:   	sth	%l6, [%i3 + %i0]
	.word	0x2d800005	! t0_kref+0x24:   	fbg,a	_kref+0x38
	.word	0x001fffff	! t0_kref+0x28:   	illtrap	0x1fffff
	call	SYM(t0_subr0)
	.word	0x83a1c9a9	! t0_kref+0x30:   	fdivs	%f7, %f9, %f1
	.word	0xee2e8019	! t0_kref+0x34:   	stb	%l7, [%i2 + %i1]
	.word	0x1f2f578f	! t0_kref+0x38:   	sethi	%hi(0xbd5e3c00), %o7
	.word	0x81858000	! t0_kref+0x3c:   	wr	%l6, %g0, %y
	.word	0x940dc016	! t0_kref+0x40:   	and	%l7, %l6, %o2
	.word	0x81a94a21	! t0_kref+0x44:   	fcmps	%fcc0, %f5, %f1
	.word	0x9735a00e	! t0_kref+0x48:   	srl	%l6, 0xe, %o3
	.word	0xee30a036	! t0_kref+0x4c:   	sth	%l7, [%g2 + 0x36]
	.word	0x9a25c017	! t0_kref+0x50:   	sub	%l7, %l7, %o5
	.word	0xe8fe101c	! t0_kref+0x54:   	swapa	[%i0 + %i4]0x80, %l4
	.word	0x92bdc016	! t0_kref+0x58:   	xnorcc	%l7, %l6, %o1
	.word	0x93a01a21	! t0_kref+0x5c:   	fstoi	%f1, %f9
	.word	0xc300a010	! t0_kref+0x60:   	ld	[%g2 + 0x10], %f1
	.word	0x9895c016	! t0_kref+0x64:   	orcc	%l7, %l6, %o4
	.word	0x83a00024	! t0_kref+0x68:   	fmovs	%f4, %f1
	.word	0x86102015	! t0_kref+0x6c:   	mov	0x15, %g3
	.word	0x86a0e001	! t0_kref+0x70:   	subcc	%g3, 1, %g3
	.word	0x22800018	! t0_kref+0x74:   	be,a	_kref+0xd4
	.word	0xc0961000	! t0_kref+0x78:   	lduha	[%i0]0x80, %g0
	.word	0xee300019	! t0_kref+0x7c:   	sth	%l7, [%g0 + %i1]
	.word	0xee300019	! t0_kref+0x80:   	sth	%l7, [%g0 + %i1]
	.word	0x9035b8a9	! t0_kref+0x84:   	orn	%l6, -0x757, %o0
	.word	0xe168a001	! t0_kref+0x88:   	prefetch	%g2 + 1, 16
	.word	0x81a00848	! t0_kref+0x8c:   	faddd	%f0, %f8, %f0
	.word	0x244ffff8	! t0_kref+0x90:   	ble,a,pt	%icc, _kref+0x70
	.word	0x89a000c0	! t0_kref+0x94:   	fnegd	%f0, %f4
	.word	0xd45e001d	! t0_kref+0x98:   	ldx	[%i0 + %i5], %o2
	.word	0x80e5aa9e	! t0_kref+0x9c:   	subccc	%l6, 0xa9e, %g0
	.word	0x81a80a48	! t0_kref+0xa0:   	fcmpd	%fcc0, %f0, %f8
	.word	0xee360000	! t0_kref+0xa4:   	sth	%l7, [%i0]
	.word	0xef68a083	! t0_kref+0xa8:   	prefetch	%g2 + 0x83, 23
	.word	0x8fa000a2	! t0_kref+0xac:   	fnegs	%f2, %f7
	.word	0x9065bed2	! t0_kref+0xb0:   	subc	%l6, -0x12e, %o0
	.word	0x91a00940	! t0_kref+0xb4:   	fmuld	%f0, %f0, %f8
	.word	0xda7f0019	! t0_kref+0xb8:   	swap	[%i4 + %i1], %o5
	.word	0x9a758016	! t0_kref+0xbc:   	udiv	%l6, %l6, %o5
	.word	0x940dc016	! t0_kref+0xc0:   	and	%l7, %l6, %o2
	.word	0xec2e7fe2	! t0_kref+0xc4:   	stb	%l6, [%i1 - 0x1e]
	.word	0xee28a001	! t0_kref+0xc8:   	stb	%l7, [%g2 + 1]
	.word	0x9045ac00	! t0_kref+0xcc:   	addc	%l6, 0xc00, %o0
	.word	0xedee101a	! t0_kref+0xd0:   	prefetcha	%i0 + %i2, 22
	.word	0x91a00046	! t0_kref+0xd4:   	fmovd	%f6, %f8
	.word	0x96d5c017	! t0_kref+0xd8:   	umulcc	%l7, %l7, %o3
	.word	0x83a00125	! t0_kref+0xdc:   	fabss	%f5, %f1
	.word	0x920db414	! t0_kref+0xe0:   	and	%l6, -0xbec, %o1
	.word	0xeb6e001c	! t0_kref+0xe4:   	prefetch	%i0 + %i4, 21
	.word	0x81a98ac6	! t0_kref+0xe8:   	fcmped	%fcc0, %f6, %f6
	.word	0xec3f4019	! t0_kref+0xec:   	std	%l6, [%i5 + %i1]
	.word	0x8da01903	! t0_kref+0xf0:   	fitod	%f3, %f6
	.word	0x92c5f714	! t0_kref+0xf4:   	addccc	%l7, -0x8ec, %o1
	.word	0x81a00024	! t0_kref+0xf8:   	fmovs	%f4, %f0
	.word	0x945db1a7	! t0_kref+0xfc:   	smul	%l6, -0xe59, %o2
	.word	0x91a000a1	! t0_kref+0x100:   	fnegs	%f1, %f8
	.word	0x9a75c017	! t0_kref+0x104:   	udiv	%l7, %l7, %o5
	.word	0x85a10844	! t0_kref+0x108:   	faddd	%f4, %f4, %f2
	.word	0x81a01929	! t0_kref+0x10c:   	fstod	%f9, %f0
	.word	0x9ef5c016	! t0_kref+0x110:   	udivcc	%l7, %l6, %o7
	.word	0x9465c016	! t0_kref+0x114:   	subc	%l7, %l6, %o2
	.word	0x8143c000	! t0_kref+0x118:   	stbar
	.word	0x9e35ad5d	! t0_kref+0x11c:   	orn	%l6, 0xd5d, %o7
	.word	0x81a80aa1	! t0_kref+0x120:   	fcmpes	%fcc0, %f0, %f1
	.word	0x9fc10000	! t0_kref+0x124:   	call	%g4
	.word	0xc1bf5018	! t0_kref+0x128:   	stda	%f0, [%i5 + %i0]0x80
	.word	0xd84e3fee	! t0_kref+0x12c:   	ldsb	[%i0 - 0x12], %o4
	.word	0x87a01886	! t0_kref+0x130:   	fitos	%f6, %f3
	.word	0xd2780018	! t0_kref+0x134:   	swap	[%g0 + %i0], %o1
	.word	0xee363ffc	! t0_kref+0x138:   	sth	%l7, [%i0 - 4]
	.word	0x921d8016	! t0_kref+0x13c:   	xor	%l6, %l6, %o1
	.word	0xec28a03f	! t0_kref+0x140:   	stb	%l6, [%g2 + 0x3f]
	.word	0x81a01042	! t0_kref+0x144:   	fdtox	%f2, %f0
	.word	0x81a9ca21	! t0_kref+0x148:   	fcmps	%fcc0, %f7, %f1
	.word	0x81a90aa4	! t0_kref+0x14c:   	fcmpes	%fcc0, %f4, %f4
	.word	0xc91fbd38	! t0_kref+0x150:   	ldd	[%fp - 0x2c8], %f4
	.word	0xc568a040	! t0_kref+0x154:   	prefetch	%g2 + 0x40, 2
	.word	0xee36001b	! t0_kref+0x158:   	sth	%l7, [%i0 + %i3]
	.word	0xd0d01018	! t0_kref+0x15c:   	ldsha	[%g0 + %i0]0x80, %o0
	.word	0x8da01a22	! t0_kref+0x160:   	fstoi	%f2, %f6
	.word	0xec200019	! t0_kref+0x164:   	st	%l6, [%g0 + %i1]
	.word	0xc19f5a58	! t0_kref+0x168:   	ldda	[%i5 + %i0]0xd2, %f0
	.word	0x945dc016	! t0_kref+0x16c:   	smul	%l7, %l6, %o2
	.word	0xd3f65016	! t0_kref+0x170:   	casxa	[%i1]0x80, %l6, %o1
	.word	0x9e95fc2b	! t0_kref+0x174:   	orcc	%l7, -0x3d5, %o7
	.word	0x96dda700	! t0_kref+0x178:   	smulcc	%l6, 0x700, %o3
	.word	0x85a01a26	! t0_kref+0x17c:   	fstoi	%f6, %f2
	.word	0xc9be1897	! t0_kref+0x180:   	stda	%f4, [%i0 + %l7]0xc4
	.word	0x8da01886	! t0_kref+0x184:   	fitos	%f6, %f6
	.word	0xc9067fec	! t0_kref+0x188:   	ld	[%i1 - 0x14], %f4
	.word	0xc1be1816	! t0_kref+0x18c:   	stda	%f0, [%i0 + %l6]0xc0
	.word	0xd320a038	! t0_kref+0x190:   	st	%f9, [%g2 + 0x38]
	.word	0x9495b839	! t0_kref+0x194:   	orcc	%l6, -0x7c7, %o2
	.word	0xec30a034	! t0_kref+0x198:   	sth	%l6, [%g2 + 0x34]
	.word	0x98f5f2e6	! t0_kref+0x19c:   	udivcc	%l7, -0xd1a, %o4
	.word	0x8065e070	! t0_kref+0x1a0:   	subc	%l7, 0x70, %g0
	.word	0xec266014	! t0_kref+0x1a4:   	st	%l6, [%i1 + 0x14]
	.word	0x2d800002	! t0_kref+0x1a8:   	fbg,a	_kref+0x1b0
	.word	0x8143c000	! t0_kref+0x1ac:   	stbar
	.word	0x940dc016	! t0_kref+0x1b0:   	and	%l7, %l6, %o2
	.word	0xe968a007	! t0_kref+0x1b4:   	prefetch	%g2 + 7, 20
	.word	0x952dc017	! t0_kref+0x1b8:   	sll	%l7, %l7, %o2
	.word	0x9f3de018	! t0_kref+0x1bc:   	sra	%l7, 0x18, %o7
	.word	0xc51fbe70	! t0_kref+0x1c0:   	ldd	[%fp - 0x190], %f2
	.word	0x9f25e221	! t0_kref+0x1c4:   	mulscc	%l7, 0x221, %o7
	.word	0x9445fc4c	! t0_kref+0x1c8:   	addc	%l7, -0x3b4, %o2
	.word	0x90c5a174	! t0_kref+0x1cc:   	addccc	%l6, 0x174, %o0
	.word	0x93a009a5	! t0_kref+0x1d0:   	fdivs	%f0, %f5, %f9
	.word	0x949d8017	! t0_kref+0x1d4:   	xorcc	%l6, %l7, %o2
	.word	0xcf20a028	! t0_kref+0x1d8:   	st	%f7, [%g2 + 0x28]
	.word	0x993d8017	! t0_kref+0x1dc:   	sra	%l6, %l7, %o4
	.word	0xc168a002	! t0_kref+0x1e0:   	prefetch	%g2 + 2, 0
	.word	0x91a0c823	! t0_kref+0x1e4:   	fadds	%f3, %f3, %f8
	.word	0x81dd000a	! t0_kref+0x1e8:   	flush	%l4 + %o2
	.word	0x81de8010	! t0_kref+0x1ec:   	flush	%i2 + %l0
	.word	0xec267fe4	! t0_kref+0x1f0:   	st	%l6, [%i1 - 0x1c]
	.word	0xe40860f8	! t0_kref+0x1f4:   	ldub	[%g1 + 0xf8], %l2
	.word	0xa41ca00c	! t0_kref+0x1f8:   	xor	%l2, 0xc, %l2
	.word	0xe42860f8	! t0_kref+0x1fc:   	stb	%l2, [%g1 + 0xf8]
	.word	0x81d860f8	! t0_kref+0x200:   	flush	%g1 + 0xf8
	.word	0xc11fbf60	! t0_kref+0x204:   	ldd	[%fp - 0xa0], %f0
	.word	0xd87e7ff4	! t0_kref+0x208:   	swap	[%i1 - 0xc], %o4
	.word	0x968d8017	! t0_kref+0x20c:   	andcc	%l6, %l7, %o3
	.word	0x8ba01a23	! t0_kref+0x210:   	fstoi	%f3, %f5
	.word	0x9505c016	! t0_kref+0x214:   	taddcc	%l7, %l6, %o2
	.word	0xf3ee501c	! t0_kref+0x218:   	prefetcha	%i1 + %i4, 25
	.word	0x9ee5eac1	! t0_kref+0x21c:   	subccc	%l7, 0xac1, %o7
!	.word	0x2e4e6778	! t0_kref+0x220:   	bvs,a,pt	%icc, SYM(t0_subr2)
	   	bvs,a,pt	%icc, SYM(t0_subr2)
	.word	0x9e0060ec	! t0_kref+0x224:   	add	%g1, 0xec, %o7
	.word	0xd2965000	! t0_kref+0x228:   	lduha	[%i1]0x80, %o1
2:	.word	0x95400000	! t0_kref+0x22c:   	mov	%y, %o2
	.word	0x905d8016	! t0_kref+0x230:   	smul	%l6, %l6, %o0
	.word	0x9635bedf	! t0_kref+0x234:   	orn	%l6, -0x121, %o3
	.word	0x9435c016	! t0_kref+0x238:   	orn	%l7, %l6, %o2
	.word	0x9f414000	! t0_kref+0x23c:   	mov	%pc, %o7
	.word	0x81a90a21	! t0_kref+0x240:   	fcmps	%fcc0, %f4, %f1
	.word	0x9005fcd8	! t0_kref+0x244:   	add	%l7, -0x328, %o0
	.word	0x9e458017	! t0_kref+0x248:   	addc	%l6, %l7, %o7
	.word	0x98f5fac7	! t0_kref+0x24c:   	udivcc	%l7, -0x539, %o4
	.word	0x9fc0001c	! t0_kref+0x250:   	call	%g0 + %i4
	.word	0xa13d8016	! t0_kref+0x254:   	sra	%l6, %l6, %l0
	.word	0x81a18d26	! t0_kref+0x258:   	fsmuld	%f6, %f6, %f0
	.word	0x81d9617f	! t0_kref+0x25c:   	flush	%g5 + 0x17f
	.word	0x89a000a3	! t0_kref+0x260:   	fnegs	%f3, %f4
	call	SYM(t0_subr3)
	.word	0xa0a58017	! t0_kref+0x268:   	subcc	%l6, %l7, %l0
	.word	0x9a65f36a	! t0_kref+0x26c:   	subc	%l7, -0xc96, %o5
	.word	0x969d8016	! t0_kref+0x270:   	xorcc	%l6, %l6, %o3
	.word	0x31800005	! t0_kref+0x274:   	fba,a	_kref+0x288
	.word	0xd8160000	! t0_kref+0x278:   	lduh	[%i0], %o4
	.word	0x80ddb189	! t0_kref+0x27c:   	smulcc	%l6, -0xe77, %g0
	.word	0x89a01a42	! t0_kref+0x280:   	fdtoi	%f2, %f4
	.word	0x94c5c016	! t0_kref+0x284:   	addccc	%l7, %l6, %o2
	.word	0x945da036	! t0_kref+0x288:   	smul	%l6, 0x36, %o2
	.word	0xc168a04f	! t0_kref+0x28c:   	prefetch	%g2 + 0x4f, 0
	.word	0x85a188c2	! t0_kref+0x290:   	fsubd	%f6, %f2, %f2
	.word	0xecbf5018	! t0_kref+0x294:   	stda	%l6, [%i5 + %i0]0x80
	.word	0x94dd8016	! t0_kref+0x298:   	smulcc	%l6, %l6, %o2
	.word	0x985df212	! t0_kref+0x29c:   	smul	%l7, -0xdee, %o4
	.word	0x80adb4ee	! t0_kref+0x2a0:   	andncc	%l6, -0xb12, %g0
	.word	0xec763ff8	! t0_kref+0x2a4:   	stx	%l6, [%i0 - 8]
	.word	0x8143e040	! t0_kref+0x2a8:   	membar	0x40
	.word	0x9425b4a2	! t0_kref+0x2ac:   	sub	%l6, -0xb5e, %o2
	.word	0xc3200019	! t0_kref+0x2b0:   	st	%f1, [%g0 + %i1]
	.word	0x94d5e34a	! t0_kref+0x2b4:   	umulcc	%l7, 0x34a, %o2
	.word	0x949da65c	! t0_kref+0x2b8:   	xorcc	%l6, 0x65c, %o2
	.word	0x9235c017	! t0_kref+0x2bc:   	orn	%l7, %l7, %o1
	.word	0x92658017	! t0_kref+0x2c0:   	subc	%l6, %l7, %o1
	.word	0x81a90ac2	! t0_kref+0x2c4:   	fcmped	%fcc0, %f4, %f2
	.word	0x9f414000	! t0_kref+0x2c8:   	mov	%pc, %o7
!	.word	0x294e674d	! t0_kref+0x2cc:   	fbl,a,pt	%fcc0, SYM(t0_subr2)
	   	fbl,a,pt	%fcc0, SYM(t0_subr2)
	.word	0xc06e8018	! t0_kref+0x2d0:   	ldstub	[%i2 + %i0], %g0
	.word	0xeea81019	! t0_kref+0x2d4:   	stba	%l7, [%g0 + %i1]0x80
	.word	0x8143c000	! t0_kref+0x2d8:   	stbar
	.word	0x9645c016	! t0_kref+0x2dc:   	addc	%l7, %l6, %o3
	.word	0xd0380018	! t0_kref+0x2e0:   	std	%o0, [%g0 + %i0]
	.word	0x9a458016	! t0_kref+0x2e4:   	addc	%l6, %l6, %o5
	.word	0xe27e6018	! t0_kref+0x2e8:   	swap	[%i1 + 0x18], %l1
	.word	0xc36e3fe0	! t0_kref+0x2ec:   	prefetch	%i0 - 0x20, 1
	.word	0x85a018c8	! t0_kref+0x2f0:   	fdtos	%f8, %f2
	.word	0xd03e7fe8	! t0_kref+0x2f4:   	std	%o0, [%i1 - 0x18]
	.word	0x89a01907	! t0_kref+0x2f8:   	fitod	%f7, %f4
	.word	0xc0e81019	! t0_kref+0x2fc:   	ldstuba	[%g0 + %i1]0x80, %g0
	.word	0xd83e3ff8	! t0_kref+0x300:   	std	%o4, [%i0 - 8]
	.word	0x86102004	! t0_kref+0x304:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x308:   	bne,a	_kref+0x308
	.word	0x86a0e001	! t0_kref+0x30c:   	subcc	%g3, 1, %g3
	.word	0x9525f7f6	! t0_kref+0x310:   	mulscc	%l7, -0x80a, %o2
	.word	0xda4e4000	! t0_kref+0x314:   	ldsb	[%i1], %o5
	.word	0x81a01a20	! t0_kref+0x318:   	fstoi	%f0, %f0
	.word	0xeea81018	! t0_kref+0x31c:   	stba	%l7, [%g0 + %i0]0x80
	.word	0x9445ad92	! t0_kref+0x320:   	addc	%l6, 0xd92, %o2
	.word	0xd5f61017	! t0_kref+0x324:   	casxa	[%i0]0x80, %l7, %o2
	.word	0xe6ee501a	! t0_kref+0x328:   	ldstuba	[%i1 + %i2]0x80, %l3
	.word	0x9ac5adaf	! t0_kref+0x32c:   	addccc	%l6, 0xdaf, %o5
	.word	0xd67e3fe8	! t0_kref+0x330:   	swap	[%i0 - 0x18], %o3
	.word	0x8065e8f5	! t0_kref+0x334:   	subc	%l7, 0x8f5, %g0
	.word	0x98f58016	! t0_kref+0x338:   	udivcc	%l6, %l6, %o4
	.word	0x9e958016	! t0_kref+0x33c:   	orcc	%l6, %l6, %o7
	.word	0x9865b149	! t0_kref+0x340:   	subc	%l6, -0xeb7, %o4
	.word	0x83a018c2	! t0_kref+0x344:   	fdtos	%f2, %f1
	.word	0xd87e201c	! t0_kref+0x348:   	swap	[%i0 + 0x1c], %o4
	.word	0x8ba000a9	! t0_kref+0x34c:   	fnegs	%f9, %f5
	.word	0x98c58017	! t0_kref+0x350:   	addccc	%l6, %l7, %o4
	.word	0xd1e61016	! t0_kref+0x354:   	casa	[%i0]0x80, %l6, %o0
	.word	0x81a90aa9	! t0_kref+0x358:   	fcmpes	%fcc0, %f4, %f9
	.word	0x9a758017	! t0_kref+0x35c:   	udiv	%l6, %l7, %o5
	.word	0x9f3dc017	! t0_kref+0x360:   	sra	%l7, %l7, %o7
	.word	0x89a18842	! t0_kref+0x364:   	faddd	%f6, %f2, %f4
	.word	0xc9be9a18	! t0_kref+0x368:   	stda	%f4, [%i2 + %i0]0xd0
	.word	0x80458017	! t0_kref+0x36c:   	addc	%l6, %l7, %g0
	.word	0xe098105d	! t0_kref+0x370:   	ldda	[%g0 + %i5]0x82, %l0
	.word	0xec36200e	! t0_kref+0x374:   	sth	%l6, [%i0 + 0xe]
	.word	0xee26200c	! t0_kref+0x378:   	st	%l7, [%i0 + 0xc]
	.word	0x85a01900	! t0_kref+0x37c:   	fitod	%f0, %f2
	.word	0x86102002	! t0_kref+0x380:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x384:   	bne,a	_kref+0x384
	.word	0x86a0e001	! t0_kref+0x388:   	subcc	%g3, 1, %g3
	.word	0x83a000a4	! t0_kref+0x38c:   	fnegs	%f4, %f1
	.word	0xcb20a02c	! t0_kref+0x390:   	st	%f5, [%g2 + 0x2c]
	.word	0x81a14d23	! t0_kref+0x394:   	fsmuld	%f5, %f3, %f0
	.word	0x9335a017	! t0_kref+0x398:   	srl	%l6, 0x17, %o1
	.word	0xda68a03d	! t0_kref+0x39c:   	ldstub	[%g2 + 0x3d], %o5
	.word	0xef68a048	! t0_kref+0x3a0:   	prefetch	%g2 + 0x48, 23
	.word	0x81a018c0	! t0_kref+0x3a4:   	fdtos	%f0, %f0
	.word	0xec20a024	! t0_kref+0x3a8:   	st	%l6, [%g2 + 0x24]
	.word	0x81dce80f	! t0_kref+0x3ac:   	flush	%l3 + 0x80f
	.word	0x89a018c0	! t0_kref+0x3b0:   	fdtos	%f0, %f4
	.word	0x27800005	! t0_kref+0x3b4:   	fbul,a	_kref+0x3c8
	.word	0x9a05c016	! t0_kref+0x3b8:   	add	%l7, %l6, %o5
	.word	0x81df7066	! t0_kref+0x3bc:   	flush	%i5 - 0xf9a
	.word	0xc1ee5017	! t0_kref+0x3c0:   	prefetcha	%i1 + %l7, 0
	.word	0xc36e3ff8	! t0_kref+0x3c4:   	prefetch	%i0 - 8, 1
	.word	0x9eadc016	! t0_kref+0x3c8:   	andncc	%l7, %l6, %o7
	.word	0x81a20844	! t0_kref+0x3cc:   	faddd	%f8, %f4, %f0
	.word	0x9b418000	! t0_kref+0x3d0:   	mov	%fprs, %o5
	.word	0x913de011	! t0_kref+0x3d4:   	sra	%l7, 0x11, %o0
	.word	0x9225c017	! t0_kref+0x3d8:   	sub	%l7, %l7, %o1
	.word	0xee2e0000	! t0_kref+0x3dc:   	stb	%l7, [%i0]
	call	SYM(t0_subr3)
	.word	0xd04e7ff9	! t0_kref+0x3e4:   	ldsb	[%i1 - 7], %o0
	.word	0x91a000a4	! t0_kref+0x3e8:   	fnegs	%f4, %f8
	.word	0x94758016	! t0_kref+0x3ec:   	udiv	%l6, %l6, %o2
	.word	0x87a01a22	! t0_kref+0x3f0:   	fstoi	%f2, %f3
	.word	0x91a01900	! t0_kref+0x3f4:   	fitod	%f0, %f8
	.word	0xe5e65016	! t0_kref+0x3f8:   	casa	[%i1]0x80, %l6, %l2
	.word	0x83a1c9a2	! t0_kref+0x3fc:   	fdivs	%f7, %f2, %f1
	.word	0x973da009	! t0_kref+0x400:   	sra	%l6, 0x9, %o3
	.word	0x90d5b258	! t0_kref+0x404:   	umulcc	%l6, -0xda8, %o0
	.word	0xec3f4019	! t0_kref+0x408:   	std	%l6, [%i5 + %i1]
	.word	0x800dc017	! t0_kref+0x40c:   	and	%l7, %l7, %g0
	.word	0xefee501b	! t0_kref+0x410:   	prefetcha	%i1 + %i3, 23
	call	SYM(t0_subr3)
	.word	0xd27e2008	! t0_kref+0x418:   	swap	[%i0 + 8], %o1
	.word	0xd47e3fec	! t0_kref+0x41c:   	swap	[%i0 - 0x14], %o2
	.word	0xcd1fbee8	! t0_kref+0x420:   	ldd	[%fp - 0x118], %f6
	.word	0x91a208c2	! t0_kref+0x424:   	fsubd	%f8, %f2, %f8
	.word	0x9625c017	! t0_kref+0x428:   	sub	%l7, %l7, %o3
	.word	0x8185c000	! t0_kref+0x42c:   	wr	%l7, %g0, %y
	.word	0x85a20846	! t0_kref+0x430:   	faddd	%f8, %f6, %f2
	.word	0x9845f31b	! t0_kref+0x434:   	addc	%l7, -0xce5, %o4
	.word	0x81a8ca27	! t0_kref+0x438:   	fcmps	%fcc0, %f3, %f7
	.word	0xda6e2010	! t0_kref+0x43c:   	ldstub	[%i0 + 0x10], %o5
	.word	0x81a84a29	! t0_kref+0x440:   	fcmps	%fcc0, %f1, %f9
	.word	0x92a5e72b	! t0_kref+0x444:   	subcc	%l7, 0x72b, %o1
	.word	0xd43e0000	! t0_kref+0x448:   	std	%o2, [%i0]
	.word	0xf1ee101d	! t0_kref+0x44c:   	prefetcha	%i0 + %i5, 24
	.word	0xd040a024	! t0_kref+0x450:   	ldsw	[%g2 + 0x24], %o0
	.word	0x98c5e027	! t0_kref+0x454:   	addccc	%l7, 0x27, %o4
	.word	0x93a01a24	! t0_kref+0x458:   	fstoi	%f4, %f9
	.word	0x91a000c6	! t0_kref+0x45c:   	fnegd	%f6, %f8
	.word	0x81ab4048	! t0_kref+0x460:   	fmovdle	%fcc0, %f8, %f0
	.word	0x9245c017	! t0_kref+0x464:   	addc	%l7, %l7, %o1
	.word	0x31800005	! t0_kref+0x468:   	fba,a	_kref+0x47c
	.word	0xec367ff6	! t0_kref+0x46c:   	sth	%l6, [%i1 - 0xa]
	.word	0x9fc10000	! t0_kref+0x470:   	call	%g4
	.word	0x98558016	! t0_kref+0x474:   	umul	%l6, %l6, %o4
	call	SYM(t0_subr0)
	.word	0x81dc7b1c	! t0_kref+0x47c:   	flush	%l1 - 0x4e4
	.word	0x22480003	! t0_kref+0x480:   	be,a,pt	%icc, _kref+0x48c
	.word	0x81a018c6	! t0_kref+0x484:   	fdtos	%f6, %f0
	.word	0x808dad6c	! t0_kref+0x488:   	btst	0xd6c, %l6
	.word	0x91a018c0	! t0_kref+0x48c:   	fdtos	%f0, %f8
	.word	0xcb00a028	! t0_kref+0x490:   	ld	[%g2 + 0x28], %f5
	.word	0xeb68a005	! t0_kref+0x494:   	prefetch	%g2 + 5, 21
	.word	0x9075fd53	! t0_kref+0x498:   	udiv	%l7, -0x2ad, %o0
	.word	0x9045a54a	! t0_kref+0x49c:   	addc	%l6, 0x54a, %o0
	.word	0xd1180018	! t0_kref+0x4a0:   	ldd	[%g0 + %i0], %f8
	.word	0xc1be1897	! t0_kref+0x4a4:   	stda	%f0, [%i0 + %l7]0xc4
	.word	0x86102001	! t0_kref+0x4a8:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x4ac:   	bne,a	_kref+0x4ac
	.word	0x86a0e001	! t0_kref+0x4b0:   	subcc	%g3, 1, %g3
	.word	0x89a149a6	! t0_kref+0x4b4:   	fdivs	%f5, %f6, %f4
	.word	0xd13e3fe0	! t0_kref+0x4b8:   	std	%f8, [%i0 - 0x20]
	.word	0x96adf132	! t0_kref+0x4bc:   	andncc	%l7, -0xece, %o3
	.word	0x8da01029	! t0_kref+0x4c0:   	fstox	%f9, %f6
	.word	0x9a458017	! t0_kref+0x4c4:   	addc	%l6, %l7, %o5
	.word	0xec20a030	! t0_kref+0x4c8:   	st	%l6, [%g2 + 0x30]
	.word	0x96b58017	! t0_kref+0x4cc:   	orncc	%l6, %l7, %o3
	.word	0x9a358017	! t0_kref+0x4d0:   	orn	%l6, %l7, %o5
	.word	0x81a00027	! t0_kref+0x4d4:   	fmovs	%f7, %f0
	.word	0x8fa01889	! t0_kref+0x4d8:   	fitos	%f9, %f7
	.word	0x983dea4c	! t0_kref+0x4dc:   	xnor	%l7, 0xa4c, %o4
	.word	0xeea81018	! t0_kref+0x4e0:   	stba	%l7, [%g0 + %i0]0x80
	.word	0x98ad8017	! t0_kref+0x4e4:   	andncc	%l6, %l7, %o4
	.word	0x81a88ac4	! t0_kref+0x4e8:   	fcmped	%fcc0, %f2, %f4
	.word	0x9aada019	! t0_kref+0x4ec:   	andncc	%l6, 0x19, %o5
	.word	0x81858000	! t0_kref+0x4f0:   	wr	%l6, %g0, %y
	.word	0x98d5a886	! t0_kref+0x4f4:   	umulcc	%l6, 0x886, %o4
	.word	0x86102003	! t0_kref+0x4f8:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x4fc:   	bne,a	_kref+0x4fc
	.word	0x86a0e001	! t0_kref+0x500:   	subcc	%g3, 1, %g3
	.word	0x9ea5c016	! t0_kref+0x504:   	subcc	%l7, %l6, %o7
	.word	0x9125eada	! t0_kref+0x508:   	mulscc	%l7, 0xada, %o0
	.word	0xd25e401d	! t0_kref+0x50c:   	ldx	[%i1 + %i5], %o1
	.word	0xeb6e2000	! t0_kref+0x510:   	prefetch	%i0, 21
	.word	0xea780018	! t0_kref+0x514:   	swap	[%g0 + %i0], %l5
	.word	0xd86e600f	! t0_kref+0x518:   	ldstub	[%i1 + 0xf], %o4
	.word	0x81aa0a23	! t0_kref+0x51c:   	fcmps	%fcc0, %f8, %f3
	.word	0xda166012	! t0_kref+0x520:   	lduh	[%i1 + 0x12], %o5
	.word	0x988dc017	! t0_kref+0x524:   	andcc	%l7, %l7, %o4
	.word	0xc040a008	! t0_kref+0x528:   	ldsw	[%g2 + 8], %g0
	.word	0xe4086438	! t0_kref+0x52c:   	ldub	[%g1 + 0x438], %l2
	.word	0xa41ca00c	! t0_kref+0x530:   	xor	%l2, 0xc, %l2
	.word	0xe4286438	! t0_kref+0x534:   	stb	%l2, [%g1 + 0x438]
	.word	0x81d86438	! t0_kref+0x538:   	flush	%g1 + 0x438
	.word	0x85a000a8	! t0_kref+0x53c:   	fnegs	%f8, %f2
	.word	0x9085c016	! t0_kref+0x540:   	addcc	%l7, %l6, %o0
	.word	0xd13e0000	! t0_kref+0x544:   	std	%f8, [%i0]
	.word	0xef6e6018	! t0_kref+0x548:   	prefetch	%i1 + 0x18, 23
	.word	0xd4c71018	! t0_kref+0x54c:   	ldswa	[%i4 + %i0]0x80, %o2
	.word	0xda163fe2	! t0_kref+0x550:   	lduh	[%i0 - 0x1e], %o5
	.word	0xc128001c	! t0_kref+0x554:   	st	%fsr, [%g0 + %i4]
	.word	0x981df5ee	! t0_kref+0x558:   	xor	%l7, -0xa12, %o4
	.word	0x85a01a21	! t0_kref+0x55c:   	fstoi	%f1, %f2
	.word	0x94c5bc78	! t0_kref+0x560:   	addccc	%l6, -0x388, %o2
	.word	0xc5bf5019	! t0_kref+0x564:   	stda	%f2, [%i5 + %i1]0x80
	.word	0x83a01a21	! t0_kref+0x568:   	fstoi	%f1, %f1
2:	.word	0xa0c5f71e	! t0_kref+0x56c:   	addccc	%l7, -0x8e2, %l0
	.word	0x8143e040	! t0_kref+0x570:   	membar	0x40
	.word	0xec364000	! t0_kref+0x574:   	sth	%l6, [%i1]
	.word	0x9a8d8016	! t0_kref+0x578:   	andcc	%l6, %l6, %o5
	.word	0xee30a002	! t0_kref+0x57c:   	sth	%l7, [%g2 + 2]
	.word	0xc53f4019	! t0_kref+0x580:   	std	%f2, [%i5 + %i1]
	.word	0x969de38f	! t0_kref+0x584:   	xorcc	%l7, 0x38f, %o3
	.word	0x89a00948	! t0_kref+0x588:   	fmuld	%f0, %f8, %f4
	.word	0xec28a037	! t0_kref+0x58c:   	stb	%l6, [%g2 + 0x37]
	.word	0xf1ee101d	! t0_kref+0x590:   	prefetcha	%i0 + %i5, 24
	.word	0x91a01904	! t0_kref+0x594:   	fitod	%f4, %f8
	.word	0xc51fbe60	! t0_kref+0x598:   	ldd	[%fp - 0x1a0], %f2
	.word	0xec363ffc	! t0_kref+0x59c:   	sth	%l6, [%i0 - 4]
	.word	0x94ddfb4d	! t0_kref+0x5a0:   	smulcc	%l7, -0x4b3, %o2
	.word	0x91a10d26	! t0_kref+0x5a4:   	fsmuld	%f4, %f6, %f8
	.word	0x900dc016	! t0_kref+0x5a8:   	and	%l7, %l6, %o0
	.word	0x803d8016	! t0_kref+0x5ac:   	xnor	%l6, %l6, %g0
	.word	0x8d85bcc6	! t0_kref+0x5b0:   	wr	%l6, 0xfffffcc6, %fprs
	.word	0x86102003	! t0_kref+0x5b4:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x5b8:   	bne,a	_kref+0x5b8
	.word	0x86a0e001	! t0_kref+0x5bc:   	subcc	%g3, 1, %g3
	.word	0xc3ee1017	! t0_kref+0x5c0:   	prefetcha	%i0 + %l7, 1
	.word	0xfd6e3fe8	! t0_kref+0x5c4:   	prefetch	%i0 - 0x18, 30
	.word	0x9075be25	! t0_kref+0x5c8:   	udiv	%l6, -0x1db, %o0
	.word	0x1931de23	! t0_kref+0x5cc:   	sethi	%hi(0xc7788c00), %o4
	.word	0x81a98ac2	! t0_kref+0x5d0:   	fcmped	%fcc0, %f6, %f2
	.word	0x8da00d21	! t0_kref+0x5d4:   	fsmuld	%f0, %f1, %f6
	.word	0x89a00026	! t0_kref+0x5d8:   	fmovs	%f6, %f4
	.word	0xd11e4000	! t0_kref+0x5dc:   	ldd	[%i1], %f8
	.word	0x01271927	! t0_kref+0x5e0:   	sethi	%hi(0x9c649c00), %g0
	.word	0x80ddb87b	! t0_kref+0x5e4:   	smulcc	%l6, -0x785, %g0
	.word	0xc9200018	! t0_kref+0x5e8:   	st	%f4, [%g0 + %i0]
	.word	0x80d5c017	! t0_kref+0x5ec:   	umulcc	%l7, %l7, %g0
	.word	0xec366014	! t0_kref+0x5f0:   	sth	%l6, [%i1 + 0x14]
	.word	0xea6e0000	! t0_kref+0x5f4:   	ldstub	[%i0], %l5
	.word	0x91a01a26	! t0_kref+0x5f8:   	fstoi	%f6, %f8
	.word	0x9fc10000	! t0_kref+0x5fc:   	call	%g4
	.word	0xcf200019	! t0_kref+0x600:   	st	%f7, [%g0 + %i1]
	.word	0x81a00022	! t0_kref+0x604:   	fmovs	%f2, %f0
	.word	0x950d8017	! t0_kref+0x608:   	tsubcc	%l6, %l7, %o2
	.word	0xc5bf5018	! t0_kref+0x60c:   	stda	%f2, [%i5 + %i0]0x80
	.word	0x8610200f	! t0_kref+0x610:   	mov	0xf, %g3
	.word	0x86a0e001	! t0_kref+0x614:   	subcc	%g3, 1, %g3
	.word	0x22800007	! t0_kref+0x618:   	be,a	_kref+0x634
	.word	0x945da693	! t0_kref+0x61c:   	smul	%l6, 0x693, %o2
	.word	0xcd3e3ff8	! t0_kref+0x620:   	std	%f6, [%i0 - 8]
	.word	0x21bffffc	! t0_kref+0x624:   	fbn,a	_kref+0x614
	.word	0x8185c000	! t0_kref+0x628:   	wr	%l7, %g0, %y
	.word	0x96358017	! t0_kref+0x62c:   	orn	%l6, %l7, %o3
	.word	0x91a108c8	! t0_kref+0x630:   	fsubd	%f4, %f8, %f8
	.word	0x9725a24e	! t0_kref+0x634:   	mulscc	%l6, 0x24e, %o3
	.word	0x81a0cd29	! t0_kref+0x638:   	fsmuld	%f3, %f9, %f0
	.word	0xee362010	! t0_kref+0x63c:   	sth	%l7, [%i0 + 0x10]
	.word	0xd0d81019	! t0_kref+0x640:   	ldxa	[%g0 + %i1]0x80, %o0
	.word	0x81a90ac8	! t0_kref+0x644:   	fcmped	%fcc0, %f4, %f8
	.word	0x8143c000	! t0_kref+0x648:   	stbar
	.word	0xe36e2010	! t0_kref+0x64c:   	prefetch	%i0 + 0x10, 17
	.word	0xec28a00e	! t0_kref+0x650:   	stb	%l6, [%g2 + 0xe]
	.word	0xec30a00e	! t0_kref+0x654:   	sth	%l6, [%g2 + 0xe]
	.word	0x8005c017	! t0_kref+0x658:   	add	%l7, %l7, %g0
	.word	0xe4fe501c	! t0_kref+0x65c:   	swapa	[%i1 + %i4]0x80, %l2
	.word	0x9f35c017	! t0_kref+0x660:   	srl	%l7, %l7, %o7
	.word	0x8ba209a4	! t0_kref+0x664:   	fdivs	%f8, %f4, %f5
	.word	0xe06e8019	! t0_kref+0x668:   	ldstub	[%i2 + %i1], %l0
	.word	0x8ba000a5	! t0_kref+0x66c:   	fnegs	%f5, %f5
	.word	0x83a14926	! t0_kref+0x670:   	fmuls	%f5, %f6, %f1
	.word	0x993da01c	! t0_kref+0x674:   	sra	%l6, 0x1c, %o4
	.word	0xd0961000	! t0_kref+0x678:   	lduha	[%i0]0x80, %o0
	.word	0x3f800006	! t0_kref+0x67c:   	fbo,a	_kref+0x694
	.word	0xc9ee5017	! t0_kref+0x680:   	prefetcha	%i1 + %l7, 4
	.word	0xc56e2008	! t0_kref+0x684:   	prefetch	%i0 + 8, 2
	.word	0xf36e2018	! t0_kref+0x688:   	prefetch	%i0 + 0x18, 25
	.word	0xd050a01c	! t0_kref+0x68c:   	ldsh	[%g2 + 0x1c], %o0
	.word	0xee2e7fe4	! t0_kref+0x690:   	stb	%l7, [%i1 - 0x1c]
	.word	0x86102008	! t0_kref+0x694:   	mov	0x8, %g3
	.word	0x86a0e001	! t0_kref+0x698:   	subcc	%g3, 1, %g3
	.word	0x22800013	! t0_kref+0x69c:   	be,a	_kref+0x6e8
	.word	0x89a188c2	! t0_kref+0x6a0:   	fsubd	%f6, %f2, %f4
	.word	0x81a018c2	! t0_kref+0x6a4:   	fdtos	%f2, %f0
	.word	0x9f418000	! t0_kref+0x6a8:   	mov	%fprs, %o7
	.word	0x908db18a	! t0_kref+0x6ac:   	andcc	%l6, -0xe76, %o0
	.word	0x81aa0aa9	! t0_kref+0x6b0:   	fcmpes	%fcc0, %f8, %f9
	.word	0x89a009c8	! t0_kref+0x6b4:   	fdivd	%f0, %f8, %f4
	.word	0x89a018c6	! t0_kref+0x6b8:   	fdtos	%f6, %f4
	.word	0xee28a008	! t0_kref+0x6bc:   	stb	%l7, [%g2 + 8]
	.word	0xf56e3fe8	! t0_kref+0x6c0:   	prefetch	%i0 - 0x18, 26
	.word	0xeeae9019	! t0_kref+0x6c4:   	stba	%l7, [%i2 + %i1]0x80
	.word	0x9f0deb9a	! t0_kref+0x6c8:   	tsubcc	%l7, 0xb9a, %o7
	.word	0x85a01901	! t0_kref+0x6cc:   	fitod	%f1, %f2
	.word	0xec263fe4	! t0_kref+0x6d0:   	st	%l6, [%i0 - 0x1c]
	.word	0x8da01885	! t0_kref+0x6d4:   	fitos	%f5, %f6
	.word	0xd016c018	! t0_kref+0x6d8:   	lduh	[%i3 + %i0], %o0
	.word	0x89a01a21	! t0_kref+0x6dc:   	fstoi	%f1, %f4
	.word	0xda40a004	! t0_kref+0x6e0:   	ldsw	[%g2 + 4], %o5
	.word	0x91a01929	! t0_kref+0x6e4:   	fstod	%f9, %f8
	.word	0x90d5fa97	! t0_kref+0x6e8:   	umulcc	%l7, -0x569, %o0
	.word	0x929dc016	! t0_kref+0x6ec:   	xorcc	%l7, %l6, %o1
	.word	0x87a018c0	! t0_kref+0x6f0:   	fdtos	%f0, %f3
	.word	0xe4086608	! t0_kref+0x6f4:   	ldub	[%g1 + 0x608], %l2
	.word	0xa41ca00c	! t0_kref+0x6f8:   	xor	%l2, 0xc, %l2
	.word	0xe4286608	! t0_kref+0x6fc:   	stb	%l2, [%g1 + 0x608]
	.word	0x81d86608	! t0_kref+0x700:   	flush	%g1 + 0x608
	.word	0x81a8caa7	! t0_kref+0x704:   	fcmpes	%fcc0, %f3, %f7
	.word	0xeb68a081	! t0_kref+0x708:   	prefetch	%g2 + 0x81, 21
	.word	0xe41e0000	! t0_kref+0x70c:   	ldd	[%i0], %l2
	.word	0xebee501c	! t0_kref+0x710:   	prefetcha	%i1 + %i4, 21
	.word	0xc91e3ff8	! t0_kref+0x714:   	ldd	[%i0 - 8], %f4
	.word	0x87a01888	! t0_kref+0x718:   	fitos	%f8, %f3
	.word	0x9e65c017	! t0_kref+0x71c:   	subc	%l7, %l7, %o7
	.word	0x8125a65f	! t0_kref+0x720:   	mulscc	%l6, 0x65f, %g0
	.word	0x89a01924	! t0_kref+0x724:   	fstod	%f4, %f4
	.word	0x9e75c016	! t0_kref+0x728:   	udiv	%l7, %l6, %o7
	.word	0xde4e401a	! t0_kref+0x72c:   	ldsb	[%i1 + %i2], %o7
	.word	0x94a5b7cf	! t0_kref+0x730:   	subcc	%l6, -0x831, %o2
	.word	0xc0e81019	! t0_kref+0x734:   	ldstuba	[%g0 + %i1]0x80, %g0
	.word	0x81aa4a24	! t0_kref+0x738:   	fcmps	%fcc0, %f9, %f4
2:	.word	0x91a009c2	! t0_kref+0x73c:   	fdivd	%f0, %f2, %f8
	.word	0xd43e7ff0	! t0_kref+0x740:   	std	%o2, [%i1 - 0x10]
	.word	0xc1be1a1c	! t0_kref+0x744:   	stda	%f0, [%i0 + %i4]0xd0
	.word	0xd03e7ff0	! t0_kref+0x748:   	std	%o0, [%i1 - 0x10]
	.word	0x8ba01889	! t0_kref+0x74c:   	fitos	%f9, %f5
	.word	0x9065a4f1	! t0_kref+0x750:   	subc	%l6, 0x4f1, %o0
	call	SYM(t0_subr1)
	.word	0xecff1019	! t0_kref+0x758:   	swapa	[%i4 + %i1]0x80, %l6
	.word	0x81dec004	! t0_kref+0x75c:   	flush	%i3 + %g4
	.word	0x91358016	! t0_kref+0x760:   	srl	%l6, %l6, %o0
	.word	0x81aa0a44	! t0_kref+0x764:   	fcmpd	%fcc0, %f8, %f4
	call	SYM(t0_subr2)
	.word	0xec36c018	! t0_kref+0x76c:   	sth	%l6, [%i3 + %i0]
	.word	0x80d5a76d	! t0_kref+0x770:   	umulcc	%l6, 0x76d, %g0
	.word	0x94adbbd3	! t0_kref+0x774:   	andncc	%l6, -0x42d, %o2
	.word	0x9935c017	! t0_kref+0x778:   	srl	%l7, %l7, %o4
	.word	0xcf20a01c	! t0_kref+0x77c:   	st	%f7, [%g2 + 0x1c]
	.word	0xcf26401c	! t0_kref+0x780:   	st	%f7, [%i1 + %i4]
	.word	0x973da01b	! t0_kref+0x784:   	sra	%l6, 0x1b, %o3
	.word	0x912de00b	! t0_kref+0x788:   	sll	%l7, 0xb, %o0
	.word	0x85a018c6	! t0_kref+0x78c:   	fdtos	%f6, %f2
	.word	0x91a009a8	! t0_kref+0x790:   	fdivs	%f0, %f8, %f8
	.word	0xeeae501a	! t0_kref+0x794:   	stba	%l7, [%i1 + %i2]0x80
	.word	0xec36401b	! t0_kref+0x798:   	sth	%l6, [%i1 + %i3]
	.word	0x25800005	! t0_kref+0x79c:   	fblg,a	_kref+0x7b0
	.word	0xee36c018	! t0_kref+0x7a0:   	sth	%l7, [%i3 + %i0]
	.word	0xd640a000	! t0_kref+0x7a4:   	ldsw	[%g2], %o3
	.word	0x9f258016	! t0_kref+0x7a8:   	mulscc	%l6, %l6, %o7
	.word	0xcd1fbc30	! t0_kref+0x7ac:   	ldd	[%fp - 0x3d0], %f6
	.word	0x94bdbf44	! t0_kref+0x7b0:   	xnorcc	%l6, -0xbc, %o2
	.word	0x94e5c016	! t0_kref+0x7b4:   	subccc	%l7, %l6, %o2
	.word	0x9a65b5d1	! t0_kref+0x7b8:   	subc	%l6, -0xa2f, %o5
	.word	0x91a08846	! t0_kref+0x7bc:   	faddd	%f2, %f6, %f8
	.word	0x89a189c6	! t0_kref+0x7c0:   	fdivd	%f6, %f6, %f4
	.word	0x89a08d23	! t0_kref+0x7c4:   	fsmuld	%f2, %f3, %f4
	.word	0x39800008	! t0_kref+0x7c8:   	fbuge,a	_kref+0x7e8
	.word	0xd46e6004	! t0_kref+0x7cc:   	ldstub	[%i1 + 4], %o2
	.word	0x9835c017	! t0_kref+0x7d0:   	orn	%l7, %l7, %o4
	.word	0x39800003	! t0_kref+0x7d4:   	fbuge,a	_kref+0x7e0
	.word	0x9215c016	! t0_kref+0x7d8:   	or	%l7, %l6, %o1
	.word	0x89a01903	! t0_kref+0x7dc:   	fitod	%f3, %f4
	.word	0xc91fbf10	! t0_kref+0x7e0:   	ldd	[%fp - 0xf0], %f4
	.word	0x9e05b282	! t0_kref+0x7e4:   	add	%l6, -0xd7e, %o7
	.word	0xf7ee101a	! t0_kref+0x7e8:   	prefetcha	%i0 + %i2, 27
	.word	0x86102002	! t0_kref+0x7ec:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x7f0:   	bne,a	_kref+0x7f0
	.word	0x86a0e001	! t0_kref+0x7f4:   	subcc	%g3, 1, %g3
	.word	0x9fc00004	! t0_kref+0x7f8:   	call	%g0 + %g4
	.word	0x9835ffa3	! t0_kref+0x7fc:   	orn	%l7, -0x5d, %o4
	.word	0xec20a030	! t0_kref+0x800:   	st	%l6, [%g2 + 0x30]
	.word	0xc9be1896	! t0_kref+0x804:   	stda	%f4, [%i0 + %l6]0xc4
	.word	0x8ba00023	! t0_kref+0x808:   	fmovs	%f3, %f5
	.word	0x85a009c2	! t0_kref+0x80c:   	fdivd	%f0, %f2, %f2
	.word	0xd83e7ff0	! t0_kref+0x810:   	std	%o4, [%i1 - 0x10]
	.word	0x983dc016	! t0_kref+0x814:   	xnor	%l7, %l6, %o4
	.word	0x81aa0a24	! t0_kref+0x818:   	fcmps	%fcc0, %f8, %f4
	.word	0x89a01922	! t0_kref+0x81c:   	fstod	%f2, %f4
	.word	0xc9263fec	! t0_kref+0x820:   	st	%f4, [%i0 - 0x14]
	.word	0x81858000	! t0_kref+0x824:   	wr	%l6, %g0, %y
	.word	0x80c5c017	! t0_kref+0x828:   	addccc	%l7, %l7, %g0
	.word	0xef68a08d	! t0_kref+0x82c:   	prefetch	%g2 + 0x8d, 23
	.word	0xe968a08b	! t0_kref+0x830:   	prefetch	%g2 + 0x8b, 20
	.word	0x81a01904	! t0_kref+0x834:   	fitod	%f4, %f0
	.word	0xd6ee9018	! t0_kref+0x838:   	ldstuba	[%i2 + %i0]0x80, %o3
	.word	0x8143c000	! t0_kref+0x83c:   	stbar
	.word	0x94958017	! t0_kref+0x840:   	orcc	%l6, %l7, %o2
	.word	0x9445c016	! t0_kref+0x844:   	addc	%l7, %l6, %o2
	.word	0x90c58017	! t0_kref+0x848:   	addccc	%l6, %l7, %o0
	.word	0x9e65c016	! t0_kref+0x84c:   	subc	%l7, %l6, %o7
	.word	0x96a58016	! t0_kref+0x850:   	subcc	%l6, %l6, %o3
	.word	0x89a000a3	! t0_kref+0x854:   	fnegs	%f3, %f4
	call	SYM(t0_subr0)
	.word	0x9495c016	! t0_kref+0x85c:   	orcc	%l7, %l6, %o2
	.word	0x99400000	! t0_kref+0x860:   	mov	%y, %o4
	.word	0x8143c000	! t0_kref+0x864:   	stbar
	.word	0x85a109c0	! t0_kref+0x868:   	fdivd	%f4, %f0, %f2
	.word	0x93a00525	! t0_kref+0x86c:   	fsqrts	%f5, %f9
	.word	0xc016001b	! t0_kref+0x870:   	lduh	[%i0 + %i3], %g0
	.word	0xc500a024	! t0_kref+0x874:   	ld	[%g2 + 0x24], %f2
	.word	0x8fa018c8	! t0_kref+0x878:   	fdtos	%f8, %f7
	.word	0x9ed5f0cb	! t0_kref+0x87c:   	umulcc	%l7, -0xf35, %o7
	.word	0xc326401c	! t0_kref+0x880:   	st	%f1, [%i1 + %i4]
	.word	0xe808001a	! t0_kref+0x884:   	ldub	[%g0 + %i2], %l4
	.word	0xd6067fe0	! t0_kref+0x888:   	ld	[%i1 - 0x20], %o3
	.word	0x31800007	! t0_kref+0x88c:   	fba,a	_kref+0x8a8
	.word	0xedee101a	! t0_kref+0x890:   	prefetcha	%i0 + %i2, 22
	.word	0xd016c019	! t0_kref+0x894:   	lduh	[%i3 + %i1], %o0
	.word	0x93a000a0	! t0_kref+0x898:   	fnegs	%f0, %f9
	.word	0x9045f1e3	! t0_kref+0x89c:   	addc	%l7, -0xe1d, %o0
	.word	0xc568a006	! t0_kref+0x8a0:   	prefetch	%g2 + 6, 2
	.word	0xd26e4000	! t0_kref+0x8a4:   	ldstub	[%i1], %o1
	.word	0x81a90a24	! t0_kref+0x8a8:   	fcmps	%fcc0, %f4, %f4
	.word	0x81a90a21	! t0_kref+0x8ac:   	fcmps	%fcc0, %f4, %f1
	.word	0x96ddf4c3	! t0_kref+0x8b0:   	smulcc	%l7, -0xb3d, %o3
	.word	0x8ba01883	! t0_kref+0x8b4:   	fitos	%f3, %f5
	.word	0xd100a024	! t0_kref+0x8b8:   	ld	[%g2 + 0x24], %f8
	.word	0xd650a018	! t0_kref+0x8bc:   	ldsh	[%g2 + 0x18], %o3
	.word	0xec766008	! t0_kref+0x8c0:   	stx	%l6, [%i1 + 8]
	.word	0x81a88a46	! t0_kref+0x8c4:   	fcmpd	%fcc0, %f2, %f6
	.word	0x8da84040	! t0_kref+0x8c8:   	fmovdne	%fcc0, %f0, %f6
	.word	0x98058017	! t0_kref+0x8cc:   	add	%l6, %l7, %o4
	.word	0x86102004	! t0_kref+0x8d0:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x8d4:   	bne,a	_kref+0x8d4
	.word	0x86a0e001	! t0_kref+0x8d8:   	subcc	%g3, 1, %g3
	.word	0xe3ee501d	! t0_kref+0x8dc:   	prefetcha	%i1 + %i5, 17
	.word	0x83a01a27	! t0_kref+0x8e0:   	fstoi	%f7, %f1
	.word	0xe66e8018	! t0_kref+0x8e4:   	ldstub	[%i2 + %i0], %l3
	.word	0x80c58017	! t0_kref+0x8e8:   	addccc	%l6, %l7, %g0
	.word	0xc9be5a1a	! t0_kref+0x8ec:   	stda	%f4, [%i1 + %i2]0xd0
	.word	0x9e758016	! t0_kref+0x8f0:   	udiv	%l6, %l6, %o7
	.word	0x34480008	! t0_kref+0x8f4:   	bg,a,pt	%icc, _kref+0x914
	.word	0xe07e7ffc	! t0_kref+0x8f8:   	swap	[%i1 - 4], %l0
	.word	0x9a95b8bc	! t0_kref+0x8fc:   	orcc	%l6, -0x744, %o5
	.word	0x9ea5c017	! t0_kref+0x900:   	subcc	%l7, %l7, %o7
	.word	0xd448a03a	! t0_kref+0x904:   	ldsb	[%g2 + 0x3a], %o2
	.word	0xd2000019	! t0_kref+0x908:   	ld	[%g0 + %i1], %o1
	.word	0x89a08944	! t0_kref+0x90c:   	fmuld	%f2, %f4, %f4
	.word	0x8095ae4c	! t0_kref+0x910:   	orcc	%l6, 0xe4c, %g0
	.word	0x92f5e337	! t0_kref+0x914:   	udivcc	%l7, 0x337, %o1
	.word	0x9addf2fe	! t0_kref+0x918:   	smulcc	%l7, -0xd02, %o5
	.word	0xea7f0019	! t0_kref+0x91c:   	swap	[%i4 + %i1], %l5
	.word	0x9ea5f47a	! t0_kref+0x920:   	subcc	%l7, -0xb86, %o7
	.word	0x86102004	! t0_kref+0x924:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x928:   	bne,a	_kref+0x928
	.word	0x86a0e001	! t0_kref+0x92c:   	subcc	%g3, 1, %g3
	.word	0x9a45c016	! t0_kref+0x930:   	addc	%l7, %l6, %o5
	.word	0x91aac042	! t0_kref+0x934:   	fmovdge	%fcc0, %f2, %f8
	.word	0x94bda143	! t0_kref+0x938:   	xnorcc	%l6, 0x143, %o2
	.word	0xec200018	! t0_kref+0x93c:   	st	%l6, [%g0 + %i0]
	.word	0x81a84a25	! t0_kref+0x940:   	fcmps	%fcc0, %f1, %f5
	.word	0xc99e101d	! t0_kref+0x944:   	ldda	[%i0 + %i5]0x80, %f4
	.word	0x9e0dbc86	! t0_kref+0x948:   	and	%l6, -0x37a, %o7
	.word	0x1f0bc301	! t0_kref+0x94c:   	sethi	%hi(0x2f0c0400), %o7
	.word	0xcb270019	! t0_kref+0x950:   	st	%f5, [%i4 + %i1]
	.word	0x9e95fcff	! t0_kref+0x954:   	orcc	%l7, -0x301, %o7
	.word	0x81a98a23	! t0_kref+0x958:   	fcmps	%fcc0, %f6, %f3
	.word	0xeea65000	! t0_kref+0x95c:   	sta	%l7, [%i1]0x80
	call	SYM(t0_subr2)
	.word	0x963de792	! t0_kref+0x964:   	xnor	%l7, 0x792, %o3
	.word	0xec20a024	! t0_kref+0x968:   	st	%l6, [%g2 + 0x24]
	.word	0x80a5a2c2	! t0_kref+0x96c:   	cmp	%l6, 0x2c2
	.word	0x8da000a2	! t0_kref+0x970:   	fnegs	%f2, %f6
	.word	0x9e058016	! t0_kref+0x974:   	add	%l6, %l6, %o7
	.word	0xec3e401d	! t0_kref+0x978:   	std	%l6, [%i1 + %i5]
	.word	0xfbee501a	! t0_kref+0x97c:   	prefetcha	%i1 + %i2, 29
	.word	0x9a0d8016	! t0_kref+0x980:   	and	%l6, %l6, %o5
	.word	0x85a18948	! t0_kref+0x984:   	fmuld	%f6, %f8, %f2
	.word	0xeb68a045	! t0_kref+0x988:   	prefetch	%g2 + 0x45, 21
	.word	0xebf65017	! t0_kref+0x98c:   	casxa	[%i1]0x80, %l7, %l5
	.word	0x810dc016	! t0_kref+0x990:   	tsubcc	%l7, %l6, %g0
	.word	0x89a01027	! t0_kref+0x994:   	fstox	%f7, %f4
	.word	0x83c06884	! t0_kref+0x998:   	jmpl	%g1 + 0x884, %g1
	.word	0xd43e6000	! t0_kref+0x99c:   	std	%o2, [%i1]
	.word	0x90a5c016	! t0_kref+0x9a0:   	subcc	%l7, %l6, %o0
	.word	0xc368a009	! t0_kref+0x9a4:   	prefetch	%g2 + 9, 1
	.word	0x9addee02	! t0_kref+0x9a8:   	smulcc	%l7, 0xe02, %o5
	.word	0x93a01a20	! t0_kref+0x9ac:   	fstoi	%f0, %f9
	.word	0xc56e2000	! t0_kref+0x9b0:   	prefetch	%i0, 2
	.word	0x91a01900	! t0_kref+0x9b4:   	fitod	%f0, %f8
	.word	0x86102002	! t0_kref+0x9b8:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x9bc:   	bne,a	_kref+0x9bc
	.word	0x86a0e001	! t0_kref+0x9c0:   	subcc	%g3, 1, %g3
	.word	0x94458016	! t0_kref+0x9c4:   	addc	%l6, %l6, %o2
	.word	0x98458016	! t0_kref+0x9c8:   	addc	%l6, %l6, %o4
	.word	0x91a00040	! t0_kref+0x9cc:   	fmovd	%f0, %f8
	.word	0x91a01908	! t0_kref+0x9d0:   	fitod	%f8, %f8
	.word	0xd668a037	! t0_kref+0x9d4:   	ldstub	[%g2 + 0x37], %o3
	.word	0xc99e1a5c	! t0_kref+0x9d8:   	ldda	[%i0 + %i4]0xd2, %f4
	.word	0x89a00026	! t0_kref+0x9dc:   	fmovs	%f6, %f4
	.word	0xee26001c	! t0_kref+0x9e0:   	st	%l7, [%i0 + %i4]
	.word	0x81aa0a21	! t0_kref+0x9e4:   	fcmps	%fcc0, %f8, %f1
	.word	0x90458017	! t0_kref+0x9e8:   	addc	%l6, %l7, %o0
	.word	0x81a209c6	! t0_kref+0x9ec:   	fdivd	%f8, %f6, %f0
	.word	0x90758017	! t0_kref+0x9f0:   	udiv	%l6, %l7, %o0
	.word	0xee263ff8	! t0_kref+0x9f4:   	st	%l7, [%i0 - 8]
	.word	0x9095a050	! t0_kref+0x9f8:   	orcc	%l6, 0x50, %o0
	.word	0x8ba01a21	! t0_kref+0x9fc:   	fstoi	%f1, %f5
	.word	0xeb6e2008	! t0_kref+0xa00:   	prefetch	%i0 + 8, 21
	.word	0x9635a9e5	! t0_kref+0xa04:   	orn	%l6, 0x9e5, %o3
	.word	0xde4e8019	! t0_kref+0xa08:   	ldsb	[%i2 + %i1], %o7
	.word	0xef6e401d	! t0_kref+0xa0c:   	prefetch	%i1 + %i5, 23
	.word	0xc5ee5016	! t0_kref+0xa10:   	prefetcha	%i1 + %l6, 2
	.word	0xd250a02e	! t0_kref+0xa14:   	ldsh	[%g2 + 0x2e], %o1
	.word	0x85a108c8	! t0_kref+0xa18:   	fsubd	%f4, %f8, %f2
	.word	0x9e9dac56	! t0_kref+0xa1c:   	xorcc	%l6, 0xc56, %o7
	.word	0xc1be5897	! t0_kref+0xa20:   	stda	%f0, [%i1 + %l7]0xc4
	.word	0x001fffff	! t0_kref+0xa24:   	illtrap	0x1fffff
	.word	0x8135e00b	! t0_kref+0xa28:   	srl	%l7, 0xb, %g0
	.word	0x3b800007	! t0_kref+0xa2c:   	fble,a	_kref+0xa48
	.word	0x8035b507	! t0_kref+0xa30:   	orn	%l6, -0xaf9, %g0
	.word	0xef68a047	! t0_kref+0xa34:   	prefetch	%g2 + 0x47, 23
	.word	0x80d5a544	! t0_kref+0xa38:   	umulcc	%l6, 0x544, %g0
	.word	0xcf00a018	! t0_kref+0xa3c:   	ld	[%g2 + 0x18], %f7
	.word	0xd5f65017	! t0_kref+0xa40:   	casxa	[%i1]0x80, %l7, %o2
	.word	0x92f5c016	! t0_kref+0xa44:   	udivcc	%l7, %l6, %o1
	.word	0x81a14d23	! t0_kref+0xa48:   	fsmuld	%f5, %f3, %f0
	.word	0x8035aa4b	! t0_kref+0xa4c:   	orn	%l6, 0xa4b, %g0
	.word	0x9ee5f895	! t0_kref+0xa50:   	subccc	%l7, -0x76b, %o7
	.word	0x813d8016	! t0_kref+0xa54:   	sra	%l6, %l6, %g0
	.word	0xe968a04e	! t0_kref+0xa58:   	prefetch	%g2 + 0x4e, 20
	.word	0x90a5ed5e	! t0_kref+0xa5c:   	subcc	%l7, 0xd5e, %o0
	.word	0xec3e001d	! t0_kref+0xa60:   	std	%l6, [%i0 + %i5]
	.word	0xc1270019	! t0_kref+0xa64:   	st	%f0, [%i4 + %i1]
	.word	0xcd1fbd40	! t0_kref+0xa68:   	ldd	[%fp - 0x2c0], %f6
	.word	0x81a90aa3	! t0_kref+0xa6c:   	fcmpes	%fcc0, %f4, %f3
	.word	0x9455c017	! t0_kref+0xa70:   	umul	%l7, %l7, %o2
	.word	0x83a01a22	! t0_kref+0xa74:   	fstoi	%f2, %f1
	.word	0xe41e0000	! t0_kref+0xa78:   	ldd	[%i0], %l2
	.word	0x85a018c0	! t0_kref+0xa7c:   	fdtos	%f0, %f2
	.word	0x3f800001	! t0_kref+0xa80:   	fbo,a	_kref+0xa84
	.word	0xea680019	! t0_kref+0xa84:   	ldstub	[%g0 + %i1], %l5
	.word	0x9e558017	! t0_kref+0xa88:   	umul	%l6, %l7, %o7
	.word	0xc0df5018	! t0_kref+0xa8c:   	ldxa	[%i5 + %i0]0x80, %g0
	.word	0x96758017	! t0_kref+0xa90:   	udiv	%l6, %l7, %o3
	.word	0x9465bffe	! t0_kref+0xa94:   	subc	%l6, -0x2, %o2
	.word	0x98458016	! t0_kref+0xa98:   	addc	%l6, %l6, %o4
	call	SYM(t0_subr1)
	.word	0x9abdf1f8	! t0_kref+0xaa0:   	xnorcc	%l7, -0xe08, %o5
	.word	0x9fc10000	! t0_kref+0xaa4:   	call	%g4
	.word	0xd6d81019	! t0_kref+0xaa8:   	ldxa	[%g0 + %i1]0x80, %o3
	.word	0x81a088c2	! t0_kref+0xaac:   	fsubd	%f2, %f2, %f0
	.word	0x89a01900	! t0_kref+0xab0:   	fitod	%f0, %f4
	.word	0x90658017	! t0_kref+0xab4:   	subc	%l6, %l7, %o0
	.word	0x9035c016	! t0_kref+0xab8:   	orn	%l7, %l6, %o0
	.word	0x97258016	! t0_kref+0xabc:   	mulscc	%l6, %l6, %o3
	.word	0x89a018c4	! t0_kref+0xac0:   	fdtos	%f4, %f4
	.word	0x86102018	! t0_kref+0xac4:   	mov	0x18, %g3
	.word	0x86a0e001	! t0_kref+0xac8:   	subcc	%g3, 1, %g3
	.word	0x22800019	! t0_kref+0xacc:   	be,a	_kref+0xb30
	.word	0x9485c016	! t0_kref+0xad0:   	addcc	%l7, %l6, %o2
	.word	0x97258016	! t0_kref+0xad4:   	mulscc	%l6, %l6, %o3
	.word	0xc368a046	! t0_kref+0xad8:   	prefetch	%g2 + 0x46, 1
	.word	0x9abdc016	! t0_kref+0xadc:   	xnorcc	%l7, %l6, %o5
	.word	0xd606001c	! t0_kref+0xae0:   	ld	[%i0 + %i4], %o3
	.word	0x29bffff9	! t0_kref+0xae4:   	fbl,a	_kref+0xac8
	.word	0x94adc017	! t0_kref+0xae8:   	andncc	%l7, %l7, %o2
	.word	0x9af58017	! t0_kref+0xaec:   	udivcc	%l6, %l7, %o5
	.word	0xe07e0000	! t0_kref+0xaf0:   	swap	[%i0], %l0
	call	SYM(t0_subr3)
	.word	0xba103ff8	! t0_kref+0xaf8:   	mov	0xfffffff8, %i5
	.word	0x8da20823	! t0_kref+0xafc:   	fadds	%f8, %f3, %f6
	.word	0xd67e3ff8	! t0_kref+0xb00:   	swap	[%i0 - 8], %o3
	.word	0x8da00026	! t0_kref+0xb04:   	fmovs	%f6, %f6
	.word	0x91a1c9a5	! t0_kref+0xb08:   	fdivs	%f7, %f5, %f8
	.word	0x9095bff9	! t0_kref+0xb0c:   	orcc	%l6, -0x7, %o0
	.word	0x80a5c017	! t0_kref+0xb10:   	cmp	%l7, %l7
	.word	0x8085baed	! t0_kref+0xb14:   	addcc	%l6, -0x513, %g0
	.word	0x9025bd62	! t0_kref+0xb18:   	sub	%l6, -0x29e, %o0
	.word	0x9fc10000	! t0_kref+0xb1c:   	call	%g4
	.word	0x9895c017	! t0_kref+0xb20:   	orcc	%l7, %l7, %o4
	.word	0x85a189a7	! t0_kref+0xb24:   	fdivs	%f6, %f7, %f2
	.word	0xd27e3fec	! t0_kref+0xb28:   	swap	[%i0 - 0x14], %o1
	.word	0x87a01a27	! t0_kref+0xb2c:   	fstoi	%f7, %f3
	.word	0xee36c018	! t0_kref+0xb30:   	sth	%l7, [%i3 + %i0]
	.word	0x9b3da006	! t0_kref+0xb34:   	sra	%l6, 0x6, %o5
	.word	0x90c5b31e	! t0_kref+0xb38:   	addccc	%l6, -0xce2, %o0
	.word	0xd87e001c	! t0_kref+0xb3c:   	swap	[%i0 + %i4], %o4
	.word	0xc5267fe0	! t0_kref+0xb40:   	st	%f2, [%i1 - 0x20]
	.word	0xeb68a08f	! t0_kref+0xb44:   	prefetch	%g2 + 0x8f, 21
	.word	0x11308f4e	! t0_kref+0xb48:   	sethi	%hi(0xc23d3800), %o0
	.word	0x89a01922	! t0_kref+0xb4c:   	fstod	%f2, %f4
	.word	0xe83e7fe0	! t0_kref+0xb50:   	std	%l4, [%i1 - 0x20]
	.word	0xf56e001d	! t0_kref+0xb54:   	prefetch	%i0 + %i5, 26
	.word	0x96d5c016	! t0_kref+0xb58:   	umulcc	%l7, %l6, %o3
	.word	0xeea65000	! t0_kref+0xb5c:   	sta	%l7, [%i1]0x80
	.word	0x96dde62e	! t0_kref+0xb60:   	smulcc	%l7, 0x62e, %o3
	.word	0x81a84aa3	! t0_kref+0xb64:   	fcmpes	%fcc0, %f1, %f3
	.word	0x86102003	! t0_kref+0xb68:   	mov	0x3, %g3
	.word	0x86a0e001	! t0_kref+0xb6c:   	subcc	%g3, 1, %g3
	.word	0x22800014	! t0_kref+0xb70:   	be,a	_kref+0xbc0
	.word	0x9aa5ee93	! t0_kref+0xb74:   	subcc	%l7, 0xe93, %o5
	.word	0x94adc017	! t0_kref+0xb78:   	andncc	%l7, %l7, %o2
	.word	0xeb6e401a	! t0_kref+0xb7c:   	prefetch	%i1 + %i2, 21
	.word	0x81a9ca25	! t0_kref+0xb80:   	fcmps	%fcc0, %f7, %f5
	.word	0x8da00021	! t0_kref+0xb84:   	fmovs	%f1, %f6
	.word	0xed68a044	! t0_kref+0xb88:   	prefetch	%g2 + 0x44, 22
	.word	0x90c5eb08	! t0_kref+0xb8c:   	addccc	%l7, 0xb08, %o0
	.word	0x923db508	! t0_kref+0xb90:   	xnor	%l6, -0xaf8, %o1
	.word	0x83a0c921	! t0_kref+0xb94:   	fmuls	%f3, %f1, %f1
	.word	0xed68a00d	! t0_kref+0xb98:   	prefetch	%g2 + 0xd, 22
	.word	0x85a01a23	! t0_kref+0xb9c:   	fstoi	%f3, %f2
	.word	0xeb68a080	! t0_kref+0xba0:   	prefetch	%g2 + 0x80, 21
	.word	0xc3260000	! t0_kref+0xba4:   	st	%f1, [%i0]
	.word	0x8da008c6	! t0_kref+0xba8:   	fsubd	%f0, %f6, %f6
	.word	0x29800008	! t0_kref+0xbac:   	fbl,a	_kref+0xbcc
	.word	0x94a5c017	! t0_kref+0xbb0:   	subcc	%l7, %l7, %o2
	.word	0x81ddc012	! t0_kref+0xbb4:   	flush	%l7 + %l2
	.word	0xc19e1a5c	! t0_kref+0xbb8:   	ldda	[%i0 + %i4]0xd2, %f0
	.word	0xd87e201c	! t0_kref+0xbbc:   	swap	[%i0 + 0x1c], %o4
	.word	0xcf000019	! t0_kref+0xbc0:   	ld	[%g0 + %i1], %f7
	.word	0xec363fec	! t0_kref+0xbc4:   	sth	%l6, [%i0 - 0x14]
	.word	0xec363ffa	! t0_kref+0xbc8:   	sth	%l6, [%i0 - 6]
	.word	0xec7e601c	! t0_kref+0xbcc:   	swap	[%i1 + 0x1c], %l6
	.word	0x9fc10000	! t0_kref+0xbd0:   	call	%g4
	.word	0x9075f154	! t0_kref+0xbd4:   	udiv	%l7, -0xeac, %o0
	.word	0x85a10848	! t0_kref+0xbd8:   	faddd	%f4, %f8, %f2
	.word	0xe07e200c	! t0_kref+0xbdc:   	swap	[%i0 + 0xc], %l0
	.word	0x9ef5ea4d	! t0_kref+0xbe0:   	udivcc	%l7, 0xa4d, %o7
	.word	0x80a58017	! t0_kref+0xbe4:   	cmp	%l6, %l7
	.word	0xc040a010	! t0_kref+0xbe8:   	ldsw	[%g2 + 0x10], %g0
	.word	0x8ba018c2	! t0_kref+0xbec:   	fdtos	%f2, %f5
	.word	0x89a00029	! t0_kref+0xbf0:   	fmovs	%f9, %f4
	.word	0xc9be1857	! t0_kref+0xbf4:   	stda	%f4, [%i0 + %l7]0xc2
	.word	0xd68e101a	! t0_kref+0xbf8:   	lduba	[%i0 + %i2]0x80, %o3
	.word	0x9a758017	! t0_kref+0xbfc:   	udiv	%l6, %l7, %o5
	.word	0x8035f745	! t0_kref+0xc00:   	orn	%l7, -0x8bb, %g0
	.word	0x98c5c016	! t0_kref+0xc04:   	addccc	%l7, %l6, %o4
	.word	0x90658017	! t0_kref+0xc08:   	subc	%l6, %l7, %o0
	.word	0x90358016	! t0_kref+0xc0c:   	orn	%l6, %l6, %o0
	.word	0xde881019	! t0_kref+0xc10:   	lduba	[%g0 + %i1]0x80, %o7
	.word	0x9a658017	! t0_kref+0xc14:   	subc	%l6, %l7, %o5
	.word	0xee363ffa	! t0_kref+0xc18:   	sth	%l7, [%i0 - 6]
	.word	0xd6167ffa	! t0_kref+0xc1c:   	lduh	[%i1 - 6], %o3
	.word	0xdbf65017	! t0_kref+0xc20:   	casxa	[%i1]0x80, %l7, %o5
	.word	0xc91fbf00	! t0_kref+0xc24:   	ldd	[%fp - 0x100], %f4
	.word	0x92f5c016	! t0_kref+0xc28:   	udivcc	%l7, %l6, %o1
	.word	0x8da0c9a7	! t0_kref+0xc2c:   	fdivs	%f3, %f7, %f6
	.word	0xb6103fea	! t0_kref+0xc30:   	mov	0xffffffea, %i3
	.word	0xcd20a00c	! t0_kref+0xc34:   	st	%f6, [%g2 + 0xc]
	.word	0x8ba00021	! t0_kref+0xc38:   	fmovs	%f1, %f5
	.word	0x90b5c016	! t0_kref+0xc3c:   	orncc	%l7, %l6, %o0
	.word	0xee7e6014	! t0_kref+0xc40:   	swap	[%i1 + 0x14], %l7
	.word	0x87a00027	! t0_kref+0xc44:   	fmovs	%f7, %f3
	.word	0x9505f785	! t0_kref+0xc48:   	taddcc	%l7, -0x87b, %o2
	.word	0x89a189c2	! t0_kref+0xc4c:   	fdivd	%f6, %f2, %f4
	.word	0x9e5db737	! t0_kref+0xc50:   	smul	%l6, -0x8c9, %o7
	.word	0xc9be5856	! t0_kref+0xc54:   	stda	%f4, [%i1 + %l6]0xc2
	.word	0x8da01881	! t0_kref+0xc58:   	fitos	%f1, %f6
	.word	0xc1380019	! t0_kref+0xc5c:   	std	%f0, [%g0 + %i1]
	.word	0x96458016	! t0_kref+0xc60:   	addc	%l6, %l6, %o3
	.word	0xe89e5000	! t0_kref+0xc64:   	ldda	[%i1]0x80, %l4
	.word	0x988df2f3	! t0_kref+0xc68:   	andcc	%l7, -0xd0d, %o4
	.word	0x9495fe85	! t0_kref+0xc6c:   	orcc	%l7, -0x17b, %o2
	.word	0x9645c017	! t0_kref+0xc70:   	addc	%l7, %l7, %o3
	.word	0x89a01a48	! t0_kref+0xc74:   	fdtoi	%f8, %f4
	.word	0x9b058016	! t0_kref+0xc78:   	taddcc	%l6, %l6, %o5
	.word	0xd320a034	! t0_kref+0xc7c:   	st	%f9, [%g2 + 0x34]
	.word	0x86102015	! t0_kref+0xc80:   	mov	0x15, %g3
	.word	0x86a0e001	! t0_kref+0xc84:   	subcc	%g3, 1, %g3
	.word	0x22800004	! t0_kref+0xc88:   	be,a	_kref+0xc98
	.word	0x91a249a1	! t0_kref+0xc8c:   	fdivs	%f9, %f1, %f8
	.word	0x8da089c0	! t0_kref+0xc90:   	fdivd	%f2, %f0, %f6
	.word	0x89a01901	! t0_kref+0xc94:   	fitod	%f1, %f4
	.word	0xd0160000	! t0_kref+0xc98:   	lduh	[%i0], %o0
	.word	0x81a008c0	! t0_kref+0xc9c:   	fsubd	%f0, %f0, %f0
	.word	0x93400000	! t0_kref+0xca0:   	mov	%y, %o1
	.word	0x80f5b347	! t0_kref+0xca4:   	udivcc	%l6, -0xcb9, %g0
	.word	0x81400000	! t0_kref+0xca8:   	mov	%y, %g0
	.word	0xcb20a020	! t0_kref+0xcac:   	st	%f5, [%g2 + 0x20]
	.word	0xe4086348	! t0_kref+0xcb0:   	ldub	[%g1 + 0x348], %l2
	.word	0xa41ca00c	! t0_kref+0xcb4:   	xor	%l2, 0xc, %l2
	.word	0xe4286348	! t0_kref+0xcb8:   	stb	%l2, [%g1 + 0x348]
	.word	0x81d86348	! t0_kref+0xcbc:   	flush	%g1 + 0x348
	.word	0x85a01901	! t0_kref+0xcc0:   	fitod	%f1, %f2
	.word	0x81aa0a22	! t0_kref+0xcc4:   	fcmps	%fcc0, %f8, %f2
	.word	0xe76e401b	! t0_kref+0xcc8:   	prefetch	%i1 + %i3, 19
	.word	0x80558017	! t0_kref+0xccc:   	umul	%l6, %l7, %g0
	.word	0x9fc10000	! t0_kref+0xcd0:   	call	%g4
	.word	0x8da018c0	! t0_kref+0xcd4:   	fdtos	%f0, %f6
	.word	0xc51e0000	! t0_kref+0xcd8:   	ldd	[%i0], %f2
	.word	0x9495a3b1	! t0_kref+0xcdc:   	orcc	%l6, 0x3b1, %o2
2:	.word	0x81a209c4	! t0_kref+0xce0:   	fdivd	%f8, %f4, %f0
	.word	0x83a00024	! t0_kref+0xce4:   	fmovs	%f4, %f1
	.word	0x81a20946	! t0_kref+0xce8:   	fmuld	%f8, %f6, %f0
	.word	0x85a01909	! t0_kref+0xcec:   	fitod	%f9, %f2
	.word	0x9885b26f	! t0_kref+0xcf0:   	addcc	%l6, -0xd91, %o4
	.word	0x8140c000	! t0_kref+0xcf4:   	mov	%asi, %g0
	.word	0xcf270018	! t0_kref+0xcf8:   	st	%f7, [%i4 + %i0]
	.word	0x8fa000a9	! t0_kref+0xcfc:   	fnegs	%f9, %f7
	.word	0xee30a010	! t0_kref+0xd00:   	sth	%l7, [%g2 + 0x10]
	.word	0x81a90aa2	! t0_kref+0xd04:   	fcmpes	%fcc0, %f4, %f2
	.word	0x8fa01a26	! t0_kref+0xd08:   	fstoi	%f6, %f7
	.word	0x92e5e643	! t0_kref+0xd0c:   	subccc	%l7, 0x643, %o1
	.word	0x81a00023	! t0_kref+0xd10:   	fmovs	%f3, %f0
	.word	0x87802082	! t0_kref+0xd14:   	mov	0x82, %asi
	.word	0xe87e4000	! t0_kref+0xd18:   	swap	[%i1], %l4
	.word	0x9e658017	! t0_kref+0xd1c:   	subc	%l6, %l7, %o7
	.word	0x9e0d8016	! t0_kref+0xd20:   	and	%l6, %l6, %o7
	.word	0x8045fe52	! t0_kref+0xd24:   	addc	%l7, -0x1ae, %g0
	.word	0xee300019	! t0_kref+0xd28:   	sth	%l7, [%g0 + %i1]
	.word	0x9a45c016	! t0_kref+0xd2c:   	addc	%l7, %l6, %o5
	.word	0x9e3df034	! t0_kref+0xd30:   	xnor	%l7, -0xfcc, %o7
	.word	0x81a88a22	! t0_kref+0xd34:   	fcmps	%fcc0, %f2, %f2
	.word	0x9095f3bd	! t0_kref+0xd38:   	orcc	%l7, -0xc43, %o0
	.word	0x8fa018c2	! t0_kref+0xd3c:   	fdtos	%f2, %f7
	.word	0xd1267fe4	! t0_kref+0xd40:   	st	%f8, [%i1 - 0x1c]
	.word	0xd47e600c	! t0_kref+0xd44:   	swap	[%i1 + 0xc], %o2
	.word	0xd200a028	! t0_kref+0xd48:   	ld	[%g2 + 0x28], %o1
	.word	0x11298e7a	! t0_kref+0xd4c:   	sethi	%hi(0xa639e800), %o0
	.word	0x89a01a27	! t0_kref+0xd50:   	fstoi	%f7, %f4
	.word	0x89a018c6	! t0_kref+0xd54:   	fdtos	%f6, %f4
	.word	0x9b3d8016	! t0_kref+0xd58:   	sra	%l6, %l6, %o5
	.word	0x8fa00026	! t0_kref+0xd5c:   	fmovs	%f6, %f7
	.word	0x8143e027	! t0_kref+0xd60:   	membar	0x27
	.word	0x8143e040	! t0_kref+0xd64:   	membar	0x40
	.word	0x805de403	! t0_kref+0xd68:   	smul	%l7, 0x403, %g0
	.word	0xd0166004	! t0_kref+0xd6c:   	lduh	[%i1 + 4], %o0
	.word	0x81a88a28	! t0_kref+0xd70:   	fcmps	%fcc0, %f2, %f8
	.word	0x903d8017	! t0_kref+0xd74:   	xnor	%l6, %l7, %o0
	.word	0x81de400c	! t0_kref+0xd78:   	flush	%i1 + %o4
	.word	0xd67e7ff8	! t0_kref+0xd7c:   	swap	[%i1 - 8], %o3
	call	SYM(t0_subr0)
	.word	0xf207bfe0	! t0_kref+0xd84:   	ld	[%fp - 0x20], %i1
	.word	0x91a088c4	! t0_kref+0xd88:   	fsubd	%f2, %f4, %f8
	.word	0xd448a012	! t0_kref+0xd8c:   	ldsb	[%g2 + 0x12], %o2
	.word	0x81a88ac0	! t0_kref+0xd90:   	fcmped	%fcc0, %f2, %f0
	.word	0x9fc10000	! t0_kref+0xd94:   	call	%g4
	.word	0x9535a01e	! t0_kref+0xd98:   	srl	%l6, 0x1e, %o2
	.word	0xec3e6018	! t0_kref+0xd9c:   	std	%l6, [%i1 + 0x18]
	.word	0xd7e65017	! t0_kref+0xda0:   	casa	[%i1]0x80, %l7, %o3
	.word	0x9e3db5f3	! t0_kref+0xda4:   	xnor	%l6, -0xa0d, %o7
	.word	0x2b800002	! t0_kref+0xda8:   	fbug,a	_kref+0xdb0
	.word	0x98558017	! t0_kref+0xdac:   	umul	%l6, %l7, %o4
	.word	0x81a009c6	! t0_kref+0xdb0:   	fdivd	%f0, %f6, %f0
	.word	0x81a000a6	! t0_kref+0xdb4:   	fnegs	%f6, %f0
	.word	0x8da01907	! t0_kref+0xdb8:   	fitod	%f7, %f6
	.word	0x993dc016	! t0_kref+0xdbc:   	sra	%l7, %l6, %o4
	.word	0xc56e3ff0	! t0_kref+0xdc0:   	prefetch	%i0 - 0x10, 2
	.word	0x81858000	! t0_kref+0xdc4:   	wr	%l6, %g0, %y
	.word	0x9fc10000	! t0_kref+0xdc8:   	call	%g4
	.word	0x933de015	! t0_kref+0xdcc:   	sra	%l7, 0x15, %o1
	.word	0xec280018	! t0_kref+0xdd0:   	stb	%l6, [%g0 + %i0]
	.word	0xc07f0019	! t0_kref+0xdd4:   	swap	[%i4 + %i1], %g0
	.word	0x98a58017	! t0_kref+0xdd8:   	subcc	%l6, %l7, %o4
	.word	0x33800006	! t0_kref+0xddc:   	fbe,a	_kref+0xdf4
	.word	0x91aa4023	! t0_kref+0xde0:   	fmovse	%fcc0, %f3, %f8
	.word	0x8065c016	! t0_kref+0xde4:   	subc	%l7, %l6, %g0
	.word	0x8d85e87e	! t0_kref+0xde8:   	wr	%l7, 0x87e, %fprs
	.word	0x940dacf1	! t0_kref+0xdec:   	and	%l6, 0xcf1, %o2
	.word	0xc768a003	! t0_kref+0xdf0:   	prefetch	%g2 + 3, 3
	.word	0x80e5b671	! t0_kref+0xdf4:   	subccc	%l6, -0x98f, %g0
	.word	0x9495a185	! t0_kref+0xdf8:   	orcc	%l6, 0x185, %o2
	.word	0x983dc017	! t0_kref+0xdfc:   	xnor	%l7, %l7, %o4
	.word	0x8da01883	! t0_kref+0xe00:   	fitos	%f3, %f6
	.word	0xdadf5018	! t0_kref+0xe04:   	ldxa	[%i5 + %i0]0x80, %o5
	.word	0x85a108c2	! t0_kref+0xe08:   	fsubd	%f4, %f2, %f2
	.word	0x8da089c6	! t0_kref+0xe0c:   	fdivd	%f2, %f6, %f6
	.word	0x90458016	! t0_kref+0xe10:   	addc	%l6, %l6, %o0
	.word	0x8185c000	! t0_kref+0xe14:   	wr	%l7, %g0, %y
	.word	0xd4b81018	! t0_kref+0xe18:   	stda	%o2, [%g0 + %i0]0x80
	.word	0x85a01925	! t0_kref+0xe1c:   	fstod	%f5, %f2
	.word	0x85a000c8	! t0_kref+0xe20:   	fnegd	%f8, %f2
	.word	0xd11fbd28	! t0_kref+0xe24:   	ldd	[%fp - 0x2d8], %f8
	.word	0x91a01922	! t0_kref+0xe28:   	fstod	%f2, %f8
	.word	0xc51e3ff8	! t0_kref+0xe2c:   	ldd	[%i0 - 8], %f2
	.word	0x9a1da373	! t0_kref+0xe30:   	xor	%l6, 0x373, %o5
	.word	0xd65e6008	! t0_kref+0xe34:   	ldx	[%i1 + 8], %o3
	.word	0xec36001b	! t0_kref+0xe38:   	sth	%l6, [%i0 + %i3]
	.word	0xeee81019	! t0_kref+0xe3c:   	ldstuba	[%g0 + %i1]0x80, %l7
	.word	0x94f5fa2e	! t0_kref+0xe40:   	udivcc	%l7, -0x5d2, %o2
	.word	0x8ba1c9a9	! t0_kref+0xe44:   	fdivs	%f7, %f9, %f5
	.word	0x013493ce	! t0_kref+0xe48:   	sethi	%hi(0xd24f3800), %g0
	.word	0x9e0064b8	! t0_kref+0xe4c:   	add	%g1, 0x4b8, %o7
!	.word	0x234fbc6c	! t0_kref+0xe50:   	fbne,a,pt	%fcc0, SYM(t0_subr1)
	   	fbne,a,pt	%fcc0, SYM(t0_subr1)
	.word	0xec28a03b	! t0_kref+0xe54:   	stb	%l6, [%g2 + 0x3b]
	.word	0xcf270018	! t0_kref+0xe58:   	st	%f7, [%i4 + %i0]
	.word	0xc050a002	! t0_kref+0xe5c:   	ldsh	[%g2 + 2], %g0
	.word	0xef68a00c	! t0_kref+0xe60:   	prefetch	%g2 + 0xc, 23
	.word	0xc99e1a5c	! t0_kref+0xe64:   	ldda	[%i0 + %i4]0xd2, %f4
	.word	0x8143e040	! t0_kref+0xe68:   	membar	0x40
	.word	0xe27e6014	! t0_kref+0xe6c:   	swap	[%i1 + 0x14], %l1
	.word	0xc04e7fe5	! t0_kref+0xe70:   	ldsb	[%i1 - 0x1b], %g0
	.word	0x8125abc7	! t0_kref+0xe74:   	mulscc	%l6, 0xbc7, %g0
	.word	0x8fa00523	! t0_kref+0xe78:   	fsqrts	%f3, %f7
	.word	0xc1beda18	! t0_kref+0xe7c:   	stda	%f0, [%i3 + %i0]0xd0
	.word	0x85a08d21	! t0_kref+0xe80:   	fsmuld	%f2, %f1, %f2
	.word	0x9fc10000	! t0_kref+0xe84:   	call	%g4
	.word	0x9a75edc9	! t0_kref+0xe88:   	udiv	%l7, 0xdc9, %o5
	.word	0x9edda644	! t0_kref+0xe8c:   	smulcc	%l6, 0x644, %o7
	.word	0xd46e4000	! t0_kref+0xe90:   	ldstub	[%i1], %o2
	.word	0xc808001a	! t0_kref+0xe94:   	ldub	[%g0 + %i2], %g4
	.word	0xee263ff0	! t0_kref+0xe98:   	st	%l7, [%i0 - 0x10]
	.word	0x90e5c016	! t0_kref+0xe9c:   	subccc	%l7, %l6, %o0
	.word	0xd306001c	! t0_kref+0xea0:   	ld	[%i0 + %i4], %f9
	.word	0x9065c016	! t0_kref+0xea4:   	subc	%l7, %l6, %o0
	.word	0x89a000c0	! t0_kref+0xea8:   	fnegd	%f0, %f4
	.word	0x8da00026	! t0_kref+0xeac:   	fmovs	%f6, %f6
	sethi	%hi(2f), %o7
	.word	0xe40be2d8	! t0_kref+0xeb4:   	ldub	[%o7 + 0x2d8], %l2
	.word	0xa41ca00c	! t0_kref+0xeb8:   	xor	%l2, 0xc, %l2
	.word	0xe42be2d8	! t0_kref+0xebc:   	stb	%l2, [%o7 + 0x2d8]
	.word	0x81dbe2d8	! t0_kref+0xec0:   	flush	%o7 + 0x2d8
	.word	0xda40a038	! t0_kref+0xec4:   	ldsw	[%g2 + 0x38], %o5
	.word	0x39800007	! t0_kref+0xec8:   	fbuge,a	_kref+0xee4
	.word	0x90758017	! t0_kref+0xecc:   	udiv	%l6, %l7, %o0
	.word	0x8005fb9a	! t0_kref+0xed0:   	add	%l7, -0x466, %g0
	.word	0x31800007	! t0_kref+0xed4:   	fba,a	_kref+0xef0
2:	.word	0x9685fe43	! t0_kref+0xed8:   	addcc	%l7, -0x1bd, %o3
	.word	0x9895ee70	! t0_kref+0xedc:   	orcc	%l7, 0xe70, %o4
	.word	0xc700a03c	! t0_kref+0xee0:   	ld	[%g2 + 0x3c], %f3
	.word	0xda7e401c	! t0_kref+0xee4:   	swap	[%i1 + %i4], %o5
	.word	0x9e75c017	! t0_kref+0xee8:   	udiv	%l7, %l7, %o7
	.word	0x99400000	! t0_kref+0xeec:   	mov	%y, %o4
	.word	0xd43e3fe0	! t0_kref+0xef0:   	std	%o2, [%i0 - 0x20]
	.word	0x9f400000	! t0_kref+0xef4:   	mov	%y, %o7
	.word	0x9445eaaf	! t0_kref+0xef8:   	addc	%l7, 0xaaf, %o2
	.word	0x80f5a337	! t0_kref+0xefc:   	udivcc	%l6, 0x337, %g0
	.word	0x81a10829	! t0_kref+0xf00:   	fadds	%f4, %f9, %f0
	.word	0x87a1c8a9	! t0_kref+0xf04:   	fsubs	%f7, %f9, %f3
	.word	0x809da312	! t0_kref+0xf08:   	xorcc	%l6, 0x312, %g0
	.word	0xd8df5019	! t0_kref+0xf0c:   	ldxa	[%i5 + %i1]0x80, %o4
	.word	0xe36e001b	! t0_kref+0xf10:   	prefetch	%i0 + %i3, 17
	call	1f
	.empty
	.word	0x91a01a28	! t0_kref+0xf18:   	fstoi	%f8, %f8
	.word	0x923d8017	! t0_kref+0xf1c:   	xnor	%l6, %l7, %o1
	.word	0x90d5ebfb	! t0_kref+0xf20:   	umulcc	%l7, 0xbfb, %o0
	.word	0x80758017	! t0_kref+0xf24:   	udiv	%l6, %l7, %g0
	.word	0x94bd8017	! t0_kref+0xf28:   	xnorcc	%l6, %l7, %o2
	.word	0x91a009c4	! t0_kref+0xf2c:   	fdivd	%f0, %f4, %f8
	.word	0xec30a032	! t0_kref+0xf30:   	sth	%l6, [%g2 + 0x32]
	.word	0x949d8016	! t0_kref+0xf34:   	xorcc	%l6, %l6, %o2
1:	.word	0x93a01a42	! t0_kref+0xf38:   	fdtoi	%f2, %f9
	.word	0x93a01a22	! t0_kref+0xf3c:   	fstoi	%f2, %f9
	.word	0xc11e2008	! t0_kref+0xf40:   	ldd	[%i0 + 8], %f0
	.word	0x91a01900	! t0_kref+0xf44:   	fitod	%f0, %f8
	.word	0xefee101c	! t0_kref+0xf48:   	prefetcha	%i0 + %i4, 23
	.word	0x8da01900	! t0_kref+0xf4c:   	fitod	%f0, %f6
	.word	0x8fa109a1	! t0_kref+0xf50:   	fdivs	%f4, %f1, %f7
	.word	0xde40a02c	! t0_kref+0xf54:   	ldsw	[%g2 + 0x2c], %o7
	.word	0x9e35ebd6	! t0_kref+0xf58:   	orn	%l7, 0xbd6, %o7
	.word	0x98d58016	! t0_kref+0xf5c:   	umulcc	%l6, %l6, %o4
	.word	0x98bd8016	! t0_kref+0xf60:   	xnorcc	%l6, %l6, %o4
	.word	0x91a01903	! t0_kref+0xf64:   	fitod	%f3, %f8
	.word	0x89a149a0	! t0_kref+0xf68:   	fdivs	%f5, %f0, %f4
	.word	0x8185c000	! t0_kref+0xf6c:   	wr	%l7, %g0, %y
	.word	0xe1ee501a	! t0_kref+0xf70:   	prefetcha	%i1 + %i2, 16
	.word	0x83a248a8	! t0_kref+0xf74:   	fsubs	%f9, %f8, %f1
	.word	0xec28a033	! t0_kref+0xf78:   	stb	%l6, [%g2 + 0x33]
	.word	0xe40865f8	! t0_kref+0xf7c:   	ldub	[%g1 + 0x5f8], %l2
	.word	0xa41ca00c	! t0_kref+0xf80:   	xor	%l2, 0xc, %l2
	.word	0xe42865f8	! t0_kref+0xf84:   	stb	%l2, [%g1 + 0x5f8]
	.word	0x81d865f8	! t0_kref+0xf88:   	flush	%g1 + 0x5f8
	.word	0x9ec5fe23	! t0_kref+0xf8c:   	addccc	%l7, -0x1dd, %o7
2:	.word	0xa0558016	! t0_kref+0xf90:   	umul	%l6, %l6, %l0
	.word	0x93400000	! t0_kref+0xf94:   	mov	%y, %o1
	.word	0x80a5b488	! t0_kref+0xf98:   	cmp	%l6, -0xb78
	.word	0xea6e3ffe	! t0_kref+0xf9c:   	ldstub	[%i0 - 2], %l5
	.word	0x89a00024	! t0_kref+0xfa0:   	fmovs	%f4, %f4
	.word	0x9a758016	! t0_kref+0xfa4:   	udiv	%l6, %l6, %o5
	.word	0x3b800001	! t0_kref+0xfa8:   	fble,a	_kref+0xfac
	.word	0x85a0cd28	! t0_kref+0xfac:   	fsmuld	%f3, %f8, %f2
	.word	0x8da109c8	! t0_kref+0xfb0:   	fdivd	%f4, %f8, %f6
	.word	0xe7ee101a	! t0_kref+0xfb4:   	prefetcha	%i0 + %i2, 19
	.word	0x98d5ae4f	! t0_kref+0xfb8:   	umulcc	%l6, 0xe4f, %o4
	.word	0x89a01901	! t0_kref+0xfbc:   	fitod	%f1, %f4
	.word	0xde4e2010	! t0_kref+0xfc0:   	ldsb	[%i0 + 0x10], %o7
	.word	0x90ddab24	! t0_kref+0xfc4:   	smulcc	%l6, 0xb24, %o0
	.word	0xd84e8018	! t0_kref+0xfc8:   	ldsb	[%i2 + %i0], %o4
	.word	0x9235f7fc	! t0_kref+0xfcc:   	orn	%l7, -0x804, %o1
	.word	0x34480008	! t0_kref+0xfd0:   	bg,a,pt	%icc, _kref+0xff0
	.word	0x8185c000	! t0_kref+0xfd4:   	wr	%l7, %g0, %y
	.word	0x993da00a	! t0_kref+0xfd8:   	sra	%l6, 0xa, %o4
	.word	0x9465a705	! t0_kref+0xfdc:   	subc	%l6, 0x705, %o2
	.word	0xc9be5a5b	! t0_kref+0xfe0:   	stda	%f4, [%i1 + %i3]0xd2
	.word	0x81dac01c	! t0_kref+0xfe4:   	flush	%o3 + %i4
	.word	0x93258016	! t0_kref+0xfe8:   	mulscc	%l6, %l6, %o1
	.word	0x2e480002	! t0_kref+0xfec:   	bvs,a,pt	%icc, _kref+0xff4
	.word	0xee266000	! t0_kref+0xff0:   	st	%l7, [%i1]
	.word	0x9e1dc017	! t0_kref+0xff4:   	xor	%l7, %l7, %o7
	.word	0xee363ff0	! t0_kref+0xff8:   	sth	%l7, [%i0 - 0x10]
	.word	0x8da01907	! t0_kref+0xffc:   	fitod	%f7, %f6
	.word	0x83a000a5	! t0_kref+0x1000:   	fnegs	%f5, %f1
	.word	0x96758016	! t0_kref+0x1004:   	udiv	%l6, %l6, %o3
	.word	0x9425b3c5	! t0_kref+0x1008:   	sub	%l6, -0xc3b, %o2
	.word	0x878020d0	! t0_kref+0x100c:   	mov	0xd0, %asi
	.word	0x87a000a8	! t0_kref+0x1010:   	fnegs	%f8, %f3
	.word	0x92c5c017	! t0_kref+0x1014:   	addccc	%l7, %l7, %o1
	.word	0xd100a008	! t0_kref+0x1018:   	ld	[%g2 + 8], %f8
	.word	0x170d0ea2	! t0_kref+0x101c:   	sethi	%hi(0x343a8800), %o3
	.word	0xc3264000	! t0_kref+0x1020:   	st	%f1, [%i1]
	.word	0x81a018c6	! t0_kref+0x1024:   	fdtos	%f6, %f0
	.word	0xcf263ff8	! t0_kref+0x1028:   	st	%f7, [%i0 - 8]
	.word	0x8fa01884	! t0_kref+0x102c:   	fitos	%f4, %f7
	.word	0x9425e1bc	! t0_kref+0x1030:   	sub	%l7, 0x1bc, %o2
	.word	0xe40866e4	! t0_kref+0x1034:   	ldub	[%g1 + 0x6e4], %l2
	.word	0xa41ca00c	! t0_kref+0x1038:   	xor	%l2, 0xc, %l2
	.word	0xe42866e4	! t0_kref+0x103c:   	stb	%l2, [%g1 + 0x6e4]
	.word	0x81d866e4	! t0_kref+0x1040:   	flush	%g1 + 0x6e4
	.word	0x96adb01f	! t0_kref+0x1044:   	andncc	%l6, -0xfe1, %o3
	.word	0x913de00e	! t0_kref+0x1048:   	sra	%l7, 0xe, %o0
	.word	0x963dc017	! t0_kref+0x104c:   	xnor	%l7, %l7, %o3
	.word	0xcd20a02c	! t0_kref+0x1050:   	st	%f6, [%g2 + 0x2c]
	.word	0x3d800003	! t0_kref+0x1054:   	fbule,a	_kref+0x1060
	.word	0x9f35e013	! t0_kref+0x1058:   	srl	%l7, 0x13, %o7
	.word	0x93a01887	! t0_kref+0x105c:   	fitos	%f7, %f9
	.word	0x91a00827	! t0_kref+0x1060:   	fadds	%f0, %f7, %f8
	.word	0xc368a086	! t0_kref+0x1064:   	prefetch	%g2 + 0x86, 1
	.word	0x3f800002	! t0_kref+0x1068:   	fbo,a	_kref+0x1070
	.word	0x8da01a42	! t0_kref+0x106c:   	fdtoi	%f2, %f6
	.word	0x809de315	! t0_kref+0x1070:   	xorcc	%l7, 0x315, %g0
	call	SYM(t0_subr2)
	.word	0x903de9f5	! t0_kref+0x1078:   	xnor	%l7, 0x9f5, %o0
2:	.word	0xec366008	! t0_kref+0x107c:   	sth	%l6, [%i1 + 8]
	.word	0xc5380019	! t0_kref+0x1080:   	std	%f2, [%g0 + %i1]
	.word	0x9e65c016	! t0_kref+0x1084:   	subc	%l7, %l6, %o7
	.word	0xd6060000	! t0_kref+0x1088:   	ld	[%i0], %o3
	.word	0x81dbc015	! t0_kref+0x108c:   	flush	%o7 + %l5
	.word	0x92258017	! t0_kref+0x1090:   	sub	%l6, %l7, %o1
	.word	0x23800003	! t0_kref+0x1094:   	fbne,a	_kref+0x10a0
	.word	0x9aa58017	! t0_kref+0x1098:   	subcc	%l6, %l7, %o5
	.word	0xc1a6101c	! t0_kref+0x109c:   	sta	%f0, [%i0 + %i4]0x80
	.word	0xe408672c	! t0_kref+0x10a0:   	ldub	[%g1 + 0x72c], %l2
	.word	0xa41ca00c	! t0_kref+0x10a4:   	xor	%l2, 0xc, %l2
	.word	0xe428672c	! t0_kref+0x10a8:   	stb	%l2, [%g1 + 0x72c]
	.word	0x81d8672c	! t0_kref+0x10ac:   	flush	%g1 + 0x72c
	.word	0xc19f1a58	! t0_kref+0x10b0:   	ldda	[%i4 + %i0]0xd2, %f0
	.word	0xee270019	! t0_kref+0x10b4:   	st	%l7, [%i4 + %i1]
	.word	0xe468a00e	! t0_kref+0x10b8:   	ldstub	[%g2 + 0xe], %l2
	.word	0x96b5c017	! t0_kref+0x10bc:   	orncc	%l7, %l7, %o3
	.word	0x93a018c2	! t0_kref+0x10c0:   	fdtos	%f2, %f9
2:	.word	0x85a08940	! t0_kref+0x10c4:   	fmuld	%f2, %f0, %f2
	.word	0x27800008	! t0_kref+0x10c8:   	fbul,a	_kref+0x10e8
	.word	0xd43e2018	! t0_kref+0x10cc:   	std	%o2, [%i0 + 0x18]
	.word	0x9425c016	! t0_kref+0x10d0:   	sub	%l7, %l6, %o2
	.word	0x9ae5c016	! t0_kref+0x10d4:   	subccc	%l7, %l6, %o5
	.word	0xd13e6018	! t0_kref+0x10d8:   	std	%f8, [%i1 + 0x18]
	.word	0x89a00025	! t0_kref+0x10dc:   	fmovs	%f5, %f4
	.word	0x81a80a29	! t0_kref+0x10e0:   	fcmps	%fcc0, %f0, %f9
	.word	0x81a018c2	! t0_kref+0x10e4:   	fdtos	%f2, %f0
	.word	0x3f800004	! t0_kref+0x10e8:   	fbo,a	_kref+0x10f8
	.word	0x9265edf3	! t0_kref+0x10ec:   	subc	%l7, 0xdf3, %o1
	.word	0x9a9db36f	! t0_kref+0x10f0:   	xorcc	%l6, -0xc91, %o5
	.word	0xeb6e401b	! t0_kref+0x10f4:   	prefetch	%i1 + %i3, 21
	.word	0x80a5c017	! t0_kref+0x10f8:   	cmp	%l7, %l7
	.word	0x81a88a42	! t0_kref+0x10fc:   	fcmpd	%fcc0, %f2, %f2
	.word	0x9a558016	! t0_kref+0x1100:   	umul	%l6, %l6, %o5
	.word	0xc100a010	! t0_kref+0x1104:   	ld	[%g2 + 0x10], %f0
	.word	0x9ec5c016	! t0_kref+0x1108:   	addccc	%l7, %l6, %o7
	.word	0xee2e001a	! t0_kref+0x110c:   	stb	%l7, [%i0 + %i2]
	.word	0x800def91	! t0_kref+0x1110:   	and	%l7, 0xf91, %g0
	.word	0x98ddc016	! t0_kref+0x1114:   	smulcc	%l7, %l6, %o4
	.word	0x89a01884	! t0_kref+0x1118:   	fitos	%f4, %f4
	.word	0x81a94a20	! t0_kref+0x111c:   	fcmps	%fcc0, %f5, %f0
	.word	0xe0ee1000	! t0_kref+0x1120:   	ldstuba	[%i0]0x80, %l0
	.word	0xd1be5a5b	! t0_kref+0x1124:   	stda	%f8, [%i1 + %i3]0xd2
	.word	0x2d800008	! t0_kref+0x1128:   	fbg,a	_kref+0x1148
	.word	0x94adf539	! t0_kref+0x112c:   	andncc	%l7, -0xac7, %o2
	.word	0xee7e7fe4	! t0_kref+0x1130:   	swap	[%i1 - 0x1c], %l7
	.word	0xc1260000	! t0_kref+0x1134:   	st	%f0, [%i0]
	.word	0x9f414000	! t0_kref+0x1138:   	mov	%pc, %o7
	.word	0x913d8016	! t0_kref+0x113c:   	sra	%l6, %l6, %o0
	.word	0x81a209c6	! t0_kref+0x1140:   	fdivd	%f8, %f6, %f0
	.word	0x9ac5ef3c	! t0_kref+0x1144:   	addccc	%l7, 0xf3c, %o5
	call	0x000005ac
	.word	0x9940c000	! t0_kref+0x114c:   	mov	%asi, %o4
	.word	0xd04e8018	! t0_kref+0x1150:   	ldsb	[%i2 + %i0], %o0
	.word	0x9eade4ae	! t0_kref+0x1154:   	andncc	%l7, 0x4ae, %o7
	.word	0x8fa000a7	! t0_kref+0x1158:   	fnegs	%f7, %f7
	.word	0x9035c016	! t0_kref+0x115c:   	orn	%l7, %l6, %o0
	.word	0xc300a028	! t0_kref+0x1160:   	ld	[%g2 + 0x28], %f1
	.word	0xc000a028	! t0_kref+0x1164:   	ld	[%g2 + 0x28], %g0
	.word	0x91a01883	! t0_kref+0x1168:   	fitos	%f3, %f8
	.word	0xda5e6018	! t0_kref+0x116c:   	ldx	[%i1 + 0x18], %o5
	.word	0xee200019	! t0_kref+0x1170:   	st	%l7, [%g0 + %i1]
	call	SYM(t0_subr1)
	.word	0x96458016	! t0_kref+0x1178:   	addc	%l6, %l6, %o3
	.word	0xee36401b	! t0_kref+0x117c:   	sth	%l7, [%i1 + %i3]
	.word	0xec20a018	! t0_kref+0x1180:   	st	%l6, [%g2 + 0x18]
	.word	0xd44e8018	! t0_kref+0x1184:   	ldsb	[%i2 + %i0], %o2
	.word	0x8fa009a9	! t0_kref+0x1188:   	fdivs	%f0, %f9, %f7
	.word	0x91a01905	! t0_kref+0x118c:   	fitod	%f5, %f8
	.word	0xec30a03c	! t0_kref+0x1190:   	sth	%l6, [%g2 + 0x3c]
	.word	0xec263fec	! t0_kref+0x1194:   	st	%l6, [%i0 - 0x14]
	.word	0xec763ff0	! t0_kref+0x1198:   	stx	%l6, [%i0 - 0x10]
	.word	0x9075ad7e	! t0_kref+0x119c:   	udiv	%l6, 0xd7e, %o0
	.word	0xd400a000	! t0_kref+0x11a0:   	ld	[%g2], %o2
	.word	0xe408684c	! t0_kref+0x11a4:   	ldub	[%g1 + 0x84c], %l2
	.word	0xa41ca00c	! t0_kref+0x11a8:   	xor	%l2, 0xc, %l2
	.word	0xe428684c	! t0_kref+0x11ac:   	stb	%l2, [%g1 + 0x84c]
	.word	0x81d8684c	! t0_kref+0x11b0:   	flush	%g1 + 0x84c
	.word	0xc096501b	! t0_kref+0x11b4:   	lduha	[%i1 + %i3]0x80, %g0
	.word	0xd4901018	! t0_kref+0x11b8:   	lduha	[%g0 + %i0]0x80, %o2
	.word	0x9fc00004	! t0_kref+0x11bc:   	call	%g0 + %g4
	.word	0x9ac5c016	! t0_kref+0x11c0:   	addccc	%l7, %l6, %o5
	.word	0x81a88ac0	! t0_kref+0x11c4:   	fcmped	%fcc0, %f2, %f0
	.word	0x923df7e3	! t0_kref+0x11c8:   	xnor	%l7, -0x81d, %o1
	.word	0x9b25c016	! t0_kref+0x11cc:   	mulscc	%l7, %l6, %o5
	.word	0xe3ee101b	! t0_kref+0x11d0:   	prefetcha	%i0 + %i3, 17
	.word	0xe1e61017	! t0_kref+0x11d4:   	casa	[%i0]0x80, %l7, %l0
	.word	0x87a018c8	! t0_kref+0x11d8:   	fdtos	%f8, %f3
	.word	0x9e25c016	! t0_kref+0x11dc:   	sub	%l7, %l6, %o7
	.word	0x81a80a27	! t0_kref+0x11e0:   	fcmps	%fcc0, %f0, %f7
2:	.word	0x85a018c6	! t0_kref+0x11e4:   	fdtos	%f6, %f2
	.word	0x87a00022	! t0_kref+0x11e8:   	fmovs	%f2, %f3
	.word	0x3d800007	! t0_kref+0x11ec:   	fbule,a	_kref+0x1208
	.word	0xd67f0019	! t0_kref+0x11f0:   	swap	[%i4 + %i1], %o3
	.word	0x963dc016	! t0_kref+0x11f4:   	xnor	%l7, %l6, %o3
	.word	0xde16401b	! t0_kref+0x11f8:   	lduh	[%i1 + %i3], %o7
	.word	0xd4be501d	! t0_kref+0x11fc:   	stda	%o2, [%i1 + %i5]0x80
	.word	0x9875ead6	! t0_kref+0x1200:   	udiv	%l7, 0xad6, %o4
	.word	0x81aa0ac8	! t0_kref+0x1204:   	fcmped	%fcc0, %f8, %f8
	.word	0x8da01907	! t0_kref+0x1208:   	fitod	%f7, %f6
	.word	0xcd1e4000	! t0_kref+0x120c:   	ldd	[%i1], %f6
	.word	0x81a80a46	! t0_kref+0x1210:   	fcmpd	%fcc0, %f0, %f6
	.word	0xec7e0000	! t0_kref+0x1214:   	swap	[%i0], %l6
	.word	0xd610a014	! t0_kref+0x1218:   	lduh	[%g2 + 0x14], %o3
	.word	0x81a90a42	! t0_kref+0x121c:   	fcmpd	%fcc0, %f4, %f2
	.word	0x94bd8016	! t0_kref+0x1220:   	xnorcc	%l6, %l6, %o2
	.word	0xcd3e7fe8	! t0_kref+0x1224:   	std	%f6, [%i1 - 0x18]
	.word	0xdad6d059	! t0_kref+0x1228:   	ldsha	[%i3 + %i1]0x82, %o5
	.word	0x89a01106	! t0_kref+0x122c:   	fxtod	%f6, %f4
	.word	0x8095fb29	! t0_kref+0x1230:   	orcc	%l7, -0x4d7, %g0
	.word	0xfdee101b	! t0_kref+0x1234:   	prefetcha	%i0 + %i3, 30
	.word	0xde070018	! t0_kref+0x1238:   	ld	[%i4 + %i0], %o7
	.word	0xec28a002	! t0_kref+0x123c:   	stb	%l6, [%g2 + 2]
	.word	0x910d8017	! t0_kref+0x1240:   	tsubcc	%l6, %l7, %o0
	.word	0x81a8caa2	! t0_kref+0x1244:   	fcmpes	%fcc0, %f3, %f2
	.word	0x83a249a1	! t0_kref+0x1248:   	fdivs	%f9, %f1, %f1
	.word	0x89a01923	! t0_kref+0x124c:   	fstod	%f3, %f4
	.word	0x9fc10000	! t0_kref+0x1250:   	call	%g4
	.word	0x90f5bdd8	! t0_kref+0x1254:   	udivcc	%l6, -0x228, %o0
	.word	0xd8780019	! t0_kref+0x1258:   	swap	[%g0 + %i1], %o4
	.word	0xcd267ff8	! t0_kref+0x125c:   	st	%f6, [%i1 - 8]
	.word	0x81a01a29	! t0_kref+0x1260:   	fstoi	%f9, %f0
	.word	0x985dc016	! t0_kref+0x1264:   	smul	%l7, %l6, %o4
	.word	0xee20a00c	! t0_kref+0x1268:   	st	%l7, [%g2 + 0xc]
	.word	0x9835c016	! t0_kref+0x126c:   	orn	%l7, %l6, %o4
	.word	0xe49f5019	! t0_kref+0x1270:   	ldda	[%i5 + %i1]0x80, %l2
	.word	0x980dc017	! t0_kref+0x1274:   	and	%l7, %l7, %o4
	.word	0xc700a018	! t0_kref+0x1278:   	ld	[%g2 + 0x18], %f3
	.word	0xec20a034	! t0_kref+0x127c:   	st	%l6, [%g2 + 0x34]
	.word	0x81df0014	! t0_kref+0x1280:   	flush	%i4 + %l4
	.word	0x945d8016	! t0_kref+0x1284:   	smul	%l6, %l6, %o2
	.word	0x85a000a9	! t0_kref+0x1288:   	fnegs	%f9, %f2
	.word	0x81a018c4	! t0_kref+0x128c:   	fdtos	%f4, %f0
	sethi	%hi(2f), %o7
	.word	0xe40be2e0	! t0_kref+0x1294:   	ldub	[%o7 + 0x2e0], %l2
	.word	0xa41ca00c	! t0_kref+0x1298:   	xor	%l2, 0xc, %l2
	.word	0xe42be2e0	! t0_kref+0x129c:   	stb	%l2, [%o7 + 0x2e0]
	.word	0x81dbe2e0	! t0_kref+0x12a0:   	flush	%o7 + 0x2e0
	.word	0xc320a01c	! t0_kref+0x12a4:   	st	%f1, [%g2 + 0x1c]
	.word	0x85a188c4	! t0_kref+0x12a8:   	fsubd	%f6, %f4, %f2
	.word	0x1b214bbd	! t0_kref+0x12ac:   	sethi	%hi(0x852ef400), %o5
	.word	0x8125e753	! t0_kref+0x12b0:   	mulscc	%l7, 0x753, %g0
	.word	0xdc396f28	! t0_kref+0x12b4:   	std	%sp, [%g5 + 0xf28]
	.word	0xc9beda59	! t0_kref+0x12b8:   	stda	%f4, [%i3 + %i1]0xd2
	.word	0xec300019	! t0_kref+0x12bc:   	sth	%l6, [%g0 + %i1]
	.word	0xee366012	! t0_kref+0x12c0:   	sth	%l7, [%i1 + 0x12]
	.word	0x909de52c	! t0_kref+0x12c4:   	xorcc	%l7, 0x52c, %o0
	.word	0x94d5afaa	! t0_kref+0x12c8:   	umulcc	%l6, 0xfaa, %o2
	.word	0x8ba01a22	! t0_kref+0x12cc:   	fstoi	%f2, %f5
	.word	0x8ba01a25	! t0_kref+0x12d0:   	fstoi	%f5, %f5
	.word	0x89a00026	! t0_kref+0x12d4:   	fmovs	%f6, %f4
	.word	0x87a018c8	! t0_kref+0x12d8:   	fdtos	%f8, %f3
	.word	0x9e0d8017	! t0_kref+0x12dc:   	and	%l6, %l7, %o7
2:	.word	0x9925e34e	! t0_kref+0x12e0:   	mulscc	%l7, 0x34e, %o4
	.word	0x93a01880	! t0_kref+0x12e4:   	fitos	%f0, %f9
	.word	0x9a75fa15	! t0_kref+0x12e8:   	udiv	%l7, -0x5eb, %o5
	.word	0x85a00944	! t0_kref+0x12ec:   	fmuld	%f0, %f4, %f2
	.word	0xee20a018	! t0_kref+0x12f0:   	st	%l7, [%g2 + 0x18]
	.word	0xd1200018	! t0_kref+0x12f4:   	st	%f8, [%g0 + %i0]
	.word	0xd1be2013	! t0_kref+0x12f8:   	stda	%f8, [%i0 + 0x13]%asi
	.word	0xc1be1816	! t0_kref+0x12fc:   	stda	%f0, [%i0 + %l6]0xc0
	.word	0x878020f0	! t0_kref+0x1300:   	mov	0xf0, %asi
	.word	0x9855e960	! t0_kref+0x1304:   	umul	%l7, 0x960, %o4
	.word	0x81a01108	! t0_kref+0x1308:   	fxtod	%f8, %f0
	.word	0xef6e401b	! t0_kref+0x130c:   	prefetch	%i1 + %i3, 23
	.word	0xc500a024	! t0_kref+0x1310:   	ld	[%g2 + 0x24], %f2
	.word	0x9ec5bdcf	! t0_kref+0x1314:   	addccc	%l6, -0x231, %o7
	.word	0xec28a012	! t0_kref+0x1318:   	stb	%l6, [%g2 + 0x12]
	.word	0x81a1cd21	! t0_kref+0x131c:   	fsmuld	%f7, %f1, %f0
	.word	0xc19e101d	! t0_kref+0x1320:   	ldda	[%i0 + %i5]0x80, %f0
	.word	0x87802082	! t0_kref+0x1324:   	mov	0x82, %asi
	.word	0x83a04820	! t0_kref+0x1328:   	fadds	%f1, %f0, %f1
	.word	0x8da108c4	! t0_kref+0x132c:   	fsubd	%f4, %f4, %f6
	.word	0x8143c000	! t0_kref+0x1330:   	stbar
	.word	0x9eddf873	! t0_kref+0x1334:   	smulcc	%l7, -0x78d, %o7
	.word	0xcd9e101d	! t0_kref+0x1338:   	ldda	[%i0 + %i5]0x80, %f6
	.word	0x92358017	! t0_kref+0x133c:   	orn	%l6, %l7, %o1
	.word	0x9455b866	! t0_kref+0x1340:   	umul	%l6, -0x79a, %o2
	.word	0x8da000a8	! t0_kref+0x1344:   	fnegs	%f8, %f6
	.word	0xc12e7fe8	! t0_kref+0x1348:   	st	%fsr, [%i1 - 0x18]
	.word	0x8da189c4	! t0_kref+0x134c:   	fdivd	%f6, %f4, %f6
	sethi	%hi(2f), %o7
	.word	0xe40be384	! t0_kref+0x1354:   	ldub	[%o7 + 0x384], %l2
	.word	0xa41ca00c	! t0_kref+0x1358:   	xor	%l2, 0xc, %l2
	.word	0xe42be384	! t0_kref+0x135c:   	stb	%l2, [%o7 + 0x384]
	.word	0x81dbe384	! t0_kref+0x1360:   	flush	%o7 + 0x384
	.word	0x9740c000	! t0_kref+0x1364:   	mov	%asi, %o3
	.word	0x8143c000	! t0_kref+0x1368:   	stbar
	.word	0x9305a5a0	! t0_kref+0x136c:   	taddcc	%l6, 0x5a0, %o1
	.word	0x9645b1f7	! t0_kref+0x1370:   	addc	%l6, -0xe09, %o3
	.word	0x89a109c2	! t0_kref+0x1374:   	fdivd	%f4, %f2, %f4
	.word	0x9635f174	! t0_kref+0x1378:   	orn	%l7, -0xe8c, %o3
	.word	0x90bda004	! t0_kref+0x137c:   	xnorcc	%l6, 4, %o0
	.word	0xd40e001a	! t0_kref+0x1380:   	ldub	[%i0 + %i2], %o2
2:	.word	0x87a049a7	! t0_kref+0x1384:   	fdivs	%f1, %f7, %f3
	.word	0x8da018c8	! t0_kref+0x1388:   	fdtos	%f8, %f6
	.word	0x83a189a3	! t0_kref+0x138c:   	fdivs	%f6, %f3, %f1
	.word	0xc3000019	! t0_kref+0x1390:   	ld	[%g0 + %i1], %f1
	.word	0xd2e81019	! t0_kref+0x1394:   	ldstuba	[%g0 + %i1]0x80, %o1
	.word	0x9ebdf539	! t0_kref+0x1398:   	xnorcc	%l7, -0xac7, %o7
	.word	0x91a01909	! t0_kref+0x139c:   	fitod	%f9, %f8
	.word	0xd66e7fe6	! t0_kref+0x13a0:   	ldstub	[%i1 - 0x1a], %o3
	.word	0x81a10d26	! t0_kref+0x13a4:   	fsmuld	%f4, %f6, %f0
	.word	0xee36601e	! t0_kref+0x13a8:   	sth	%l7, [%i1 + 0x1e]
	.word	0x81a00148	! t0_kref+0x13ac:   	fabsd	%f8, %f0
	.word	0x89a08948	! t0_kref+0x13b0:   	fmuld	%f2, %f8, %f4
	.word	0xee30a01c	! t0_kref+0x13b4:   	sth	%l7, [%g2 + 0x1c]
	.word	0xec36c019	! t0_kref+0x13b8:   	sth	%l6, [%i3 + %i1]
	.word	0xed6e401c	! t0_kref+0x13bc:   	prefetch	%i1 + %i4, 22
	.word	0xee20a018	! t0_kref+0x13c0:   	st	%l7, [%g2 + 0x18]
	.word	0xd07f0019	! t0_kref+0x13c4:   	swap	[%i4 + %i1], %o0
	.word	0xe5ee101d	! t0_kref+0x13c8:   	prefetcha	%i0 + %i5, 18
	.word	0x9e45c016	! t0_kref+0x13cc:   	addc	%l7, %l6, %o7
	.word	0xc19e5a5d	! t0_kref+0x13d0:   	ldda	[%i1 + %i5]0xd2, %f0
	.word	0xc91f4018	! t0_kref+0x13d4:   	ldd	[%i5 + %i0], %f4
	.word	0x81dce088	! t0_kref+0x13d8:   	flush	%l3 + 0x88
	.word	0x89a0c9a8	! t0_kref+0x13dc:   	fdivs	%f3, %f8, %f4
	.word	0x8143c000	! t0_kref+0x13e0:   	stbar
	.word	0xff6e401b	! t0_kref+0x13e4:   	prefetch	%i1 + %i3, 31
	.word	0x8ba109a8	! t0_kref+0x13e8:   	fdivs	%f4, %f8, %f5
	.word	0xcd1fbeb8	! t0_kref+0x13ec:   	ldd	[%fp - 0x148], %f6
	.word	0xd04e401a	! t0_kref+0x13f0:   	ldsb	[%i1 + %i2], %o0
	.word	0x93a01a22	! t0_kref+0x13f4:   	fstoi	%f2, %f9
	.word	0x8025a06e	! t0_kref+0x13f8:   	sub	%l6, 0x6e, %g0
	.word	0xedee101d	! t0_kref+0x13fc:   	prefetcha	%i0 + %i5, 22
	.word	0x9ef58017	! t0_kref+0x1400:   	udivcc	%l6, %l7, %o7
	.word	0xec767ff0	! t0_kref+0x1404:   	stx	%l6, [%i1 - 0x10]
	.word	0x91a10948	! t0_kref+0x1408:   	fmuld	%f4, %f8, %f8
	.word	0x80c58016	! t0_kref+0x140c:   	addccc	%l6, %l6, %g0
	.word	0x9695bcce	! t0_kref+0x1410:   	orcc	%l6, -0x332, %o3
	.word	0x8185c000	! t0_kref+0x1414:   	wr	%l7, %g0, %y
	.word	0x94ade7ff	! t0_kref+0x1418:   	andncc	%l7, 0x7ff, %o2
	.word	0xd11e2018	! t0_kref+0x141c:   	ldd	[%i0 + 0x18], %f8
	.word	0x9e75c016	! t0_kref+0x1420:   	udiv	%l7, %l6, %o7
	.word	0x8125ef40	! t0_kref+0x1424:   	mulscc	%l7, 0xf40, %g0
	.word	0x96a58016	! t0_kref+0x1428:   	subcc	%l6, %l6, %o3
	.word	0x83a01889	! t0_kref+0x142c:   	fitos	%f9, %f1
	.word	0x133f26f9	! t0_kref+0x1430:   	sethi	%hi(0xfc9be400), %o1
	.word	0xe3ee501a	! t0_kref+0x1434:   	prefetcha	%i1 + %i2, 17
	.word	0x95358017	! t0_kref+0x1438:   	srl	%l6, %l7, %o2
	.word	0x89a088c8	! t0_kref+0x143c:   	fsubd	%f2, %f8, %f4
	.word	0xd26e401a	! t0_kref+0x1440:   	ldstub	[%i1 + %i2], %o1
	.word	0x2b800003	! t0_kref+0x1444:   	fbug,a	_kref+0x1450
	.word	0xf56e001b	! t0_kref+0x1448:   	prefetch	%i0 + %i3, 26
	.word	0xee2e4000	! t0_kref+0x144c:   	stb	%l7, [%i1]
	.word	0x94c5c016	! t0_kref+0x1450:   	addccc	%l7, %l6, %o2
	.word	0xd11fbc30	! t0_kref+0x1454:   	ldd	[%fp - 0x3d0], %f8
	.word	0xd7f65017	! t0_kref+0x1458:   	casxa	[%i1]0x80, %l7, %o3
	.word	0x81a018c0	! t0_kref+0x145c:   	fdtos	%f0, %f0
	.word	0x948db847	! t0_kref+0x1460:   	andcc	%l6, -0x7b9, %o2
	.word	0x985dc017	! t0_kref+0x1464:   	smul	%l7, %l7, %o4
	.word	0x993d8016	! t0_kref+0x1468:   	sra	%l6, %l6, %o4
	.word	0x9e0d8017	! t0_kref+0x146c:   	and	%l6, %l7, %o7
	.word	0x8da01929	! t0_kref+0x1470:   	fstod	%f9, %f6
	.word	0xd4fe101c	! t0_kref+0x1474:   	swapa	[%i0 + %i4]0x80, %o2
	.word	0x96258016	! t0_kref+0x1478:   	sub	%l6, %l6, %o3
	.word	0xf5ee501d	! t0_kref+0x147c:   	prefetcha	%i1 + %i5, 26
	.word	0x85a10848	! t0_kref+0x1480:   	faddd	%f4, %f8, %f2
	.word	0x9e65a815	! t0_kref+0x1484:   	subc	%l6, 0x815, %o7
	.word	0x8da208c6	! t0_kref+0x1488:   	fsubd	%f8, %f6, %f6
	.word	0x96358017	! t0_kref+0x148c:   	orn	%l6, %l7, %o3
	.word	0x80f5b15f	! t0_kref+0x1490:   	udivcc	%l6, -0xea1, %g0
	.word	0x9f7035ea	! t0_kref+0x1494:   	popc	-0xa16, %o7
	.word	0x9a1da774	! t0_kref+0x1498:   	xor	%l6, 0x774, %o5
	.word	0xc96e2000	! t0_kref+0x149c:   	prefetch	%i0, 4
	.word	0x80f5c017	! t0_kref+0x14a0:   	udivcc	%l7, %l7, %g0
	.word	0xd67e7ff0	! t0_kref+0x14a4:   	swap	[%i1 - 0x10], %o3
	.word	0xcd263ffc	! t0_kref+0x14a8:   	st	%f6, [%i0 - 4]
	.word	0xc1ee5017	! t0_kref+0x14ac:   	prefetcha	%i1 + %l7, 0
	.word	0x80adc016	! t0_kref+0x14b0:   	andncc	%l7, %l6, %g0
	.word	0xec362018	! t0_kref+0x14b4:   	sth	%l6, [%i0 + 0x18]
	.word	0x85a01880	! t0_kref+0x14b8:   	fitos	%f0, %f2
	.word	0xd1be5896	! t0_kref+0x14bc:   	stda	%f8, [%i1 + %l6]0xc4
	.word	0x9a75f2fa	! t0_kref+0x14c0:   	udiv	%l7, -0xd06, %o5
	.word	0xc807bfec	! t0_kref+0x14c4:   	ld	[%fp - 0x14], %g4
	.word	0x8143e040	! t0_kref+0x14c8:   	membar	0x40
	sethi	%hi(2f), %o7
	.word	0xe40be11c	! t0_kref+0x14d0:   	ldub	[%o7 + 0x11c], %l2
	.word	0xa41ca00c	! t0_kref+0x14d4:   	xor	%l2, 0xc, %l2
	.word	0xe42be11c	! t0_kref+0x14d8:   	stb	%l2, [%o7 + 0x11c]
	.word	0x81dbe11c	! t0_kref+0x14dc:   	flush	%o7 + 0x11c
	.word	0x9425e339	! t0_kref+0x14e0:   	sub	%l7, 0x339, %o2
	.word	0xdedf5019	! t0_kref+0x14e4:   	ldxa	[%i5 + %i1]0x80, %o7
	.word	0x8143c000	! t0_kref+0x14e8:   	stbar
	.word	0x93400000	! t0_kref+0x14ec:   	mov	%y, %o1
	.word	0x8143c000	! t0_kref+0x14f0:   	stbar
	.word	0xc3ee1017	! t0_kref+0x14f4:   	prefetcha	%i0 + %l7, 1
	.word	0xd300a034	! t0_kref+0x14f8:   	ld	[%g2 + 0x34], %f9
	.word	0x80b58016	! t0_kref+0x14fc:   	orncc	%l6, %l6, %g0
	.word	0x9e45f086	! t0_kref+0x1500:   	addc	%l7, -0xf7a, %o7
	.word	0x81a01904	! t0_kref+0x1504:   	fitod	%f4, %f0
	.word	0x96658016	! t0_kref+0x1508:   	subc	%l6, %l6, %o3
	.word	0x21800002	! t0_kref+0x150c:   	fbn,a	_kref+0x1514
	.word	0xd8162000	! t0_kref+0x1510:   	lduh	[%i0], %o4
	.word	0xd4480018	! t0_kref+0x1514:   	ldsb	[%g0 + %i0], %o2
	.word	0x9a55a369	! t0_kref+0x1518:   	umul	%l6, 0x369, %o5
2:	.word	0xd47e7ff8	! t0_kref+0x151c:   	swap	[%i1 - 8], %o2
	.word	0x9025c017	! t0_kref+0x1520:   	sub	%l7, %l7, %o0
	.word	0xcfa71019	! t0_kref+0x1524:   	sta	%f7, [%i4 + %i1]0x80
	.word	0x90358016	! t0_kref+0x1528:   	orn	%l6, %l6, %o0
	.word	0x85a01925	! t0_kref+0x152c:   	fstod	%f5, %f2
	.word	0x81deaaae	! t0_kref+0x1530:   	flush	%i2 + 0xaae
	.word	0x83a01886	! t0_kref+0x1534:   	fitos	%f6, %f1
	.word	0xd66e7ff9	! t0_kref+0x1538:   	ldstub	[%i1 - 7], %o3
	.word	0x81df25b8	! t0_kref+0x153c:   	flush	%i4 + 0x5b8
	.word	0x9645b61f	! t0_kref+0x1540:   	addc	%l6, -0x9e1, %o3
	.word	0xd11fbf80	! t0_kref+0x1544:   	ldd	[%fp - 0x80], %f8
	.word	0x94a5c017	! t0_kref+0x1548:   	subcc	%l7, %l7, %o2
	.word	0xcd1fbc40	! t0_kref+0x154c:   	ldd	[%fp - 0x3c0], %f6
	.word	0x8075c017	! t0_kref+0x1550:   	udiv	%l7, %l7, %g0
	.word	0xc120a00c	! t0_kref+0x1554:   	st	%f0, [%g2 + 0xc]
	.word	0xd11fbe80	! t0_kref+0x1558:   	ldd	[%fp - 0x180], %f8
	.word	0x9ec5a02b	! t0_kref+0x155c:   	addccc	%l6, 0x2b, %o7
	.word	0x9a758016	! t0_kref+0x1560:   	udiv	%l6, %l6, %o5
	.word	0x81de8008	! t0_kref+0x1564:   	flush	%i2 + %o0
	.word	0x878020d0	! t0_kref+0x1568:   	mov	0xd0, %asi
	.word	0xde06001c	! t0_kref+0x156c:   	ld	[%i0 + %i4], %o7
	.word	0xcd1fbcb8	! t0_kref+0x1570:   	ldd	[%fp - 0x348], %f6
	.word	0x8085c016	! t0_kref+0x1574:   	addcc	%l7, %l6, %g0
	.word	0xd67e401c	! t0_kref+0x1578:   	swap	[%i1 + %i4], %o3
	.word	0xee366004	! t0_kref+0x157c:   	sth	%l7, [%i1 + 4]
	.word	0xda7e001c	! t0_kref+0x1580:   	swap	[%i0 + %i4], %o5
	.word	0xc7262000	! t0_kref+0x1584:   	st	%f3, [%i0]
	.word	0x81aa4a23	! t0_kref+0x1588:   	fcmps	%fcc0, %f9, %f3
	.word	0x9875c017	! t0_kref+0x158c:   	udiv	%l7, %l7, %o4
	.word	0x9e5d8016	! t0_kref+0x1590:   	smul	%l6, %l6, %o7
	.word	0x98c5c016	! t0_kref+0x1594:   	addccc	%l7, %l6, %o4
	.word	0xe56e001d	! t0_kref+0x1598:   	prefetch	%i0 + %i5, 18
	.word	0xee360000	! t0_kref+0x159c:   	sth	%l7, [%i0]
	.word	0x81a20d27	! t0_kref+0x15a0:   	fsmuld	%f8, %f7, %f0
	.word	0x98658017	! t0_kref+0x15a4:   	subc	%l6, %l7, %o4
	.word	0x94e5c016	! t0_kref+0x15a8:   	subccc	%l7, %l6, %o2
	.word	0x8610201d	! t0_kref+0x15ac:   	mov	0x1d, %g3
	.word	0x86a0e001	! t0_kref+0x15b0:   	subcc	%g3, 1, %g3
	.word	0x2280000e	! t0_kref+0x15b4:   	be,a	_kref+0x15ec
	.word	0xec30a026	! t0_kref+0x15b8:   	sth	%l6, [%g2 + 0x26]
	.word	0xe2780018	! t0_kref+0x15bc:   	swap	[%g0 + %i0], %l1
	.word	0x805d8016	! t0_kref+0x15c0:   	smul	%l6, %l6, %g0
	.word	0x85a000a4	! t0_kref+0x15c4:   	fnegs	%f4, %f2
	.word	0x9a5d8016	! t0_kref+0x15c8:   	smul	%l6, %l6, %o5
	.word	0xc1be5817	! t0_kref+0x15cc:   	stda	%f0, [%i1 + %l7]0xc0
	.word	0x8075e0c2	! t0_kref+0x15d0:   	udiv	%l7, 0xc2, %g0
	.word	0x91a188c2	! t0_kref+0x15d4:   	fsubd	%f6, %f2, %f8
	.word	0xc16e3fe0	! t0_kref+0x15d8:   	prefetch	%i0 - 0x20, 0
	.word	0xd87e7ff8	! t0_kref+0x15dc:   	swap	[%i1 - 8], %o4
	.word	0xd5e65017	! t0_kref+0x15e0:   	casa	[%i1]0x80, %l7, %o2
	.word	0x81aa4a20	! t0_kref+0x15e4:   	fcmps	%fcc0, %f9, %f0
	.word	0xee36c018	! t0_kref+0x15e8:   	sth	%l7, [%i3 + %i0]
	.word	0xc13f4019	! t0_kref+0x15ec:   	std	%f0, [%i5 + %i1]
	.word	0xd46e4000	! t0_kref+0x15f0:   	ldstub	[%i1], %o2
	.word	0x9aa5c016	! t0_kref+0x15f4:   	subcc	%l7, %l6, %o5
	.word	0x91358016	! t0_kref+0x15f8:   	srl	%l6, %l6, %o0
	.word	0x9715c016	! t0_kref+0x15fc:   	taddcctv	%l7, %l6, %o3
	.word	0xc096d019	! t0_kref+0x1600:   	lduha	[%i3 + %i1]0x80, %g0
	.word	0x9255c016	! t0_kref+0x1604:   	umul	%l7, %l6, %o1
	.word	0x91a01a29	! t0_kref+0x1608:   	fstoi	%f9, %f8
	.word	0x89a000a7	! t0_kref+0x160c:   	fnegs	%f7, %f4
	.word	0x92358017	! t0_kref+0x1610:   	orn	%l6, %l7, %o1
	.word	0x98d5b1b9	! t0_kref+0x1614:   	umulcc	%l6, -0xe47, %o4
	.word	0xcba6501c	! t0_kref+0x1618:   	sta	%f5, [%i1 + %i4]0x80
	.word	0xd03f4018	! t0_kref+0x161c:   	std	%o0, [%i5 + %i0]
	.word	0x8d85e169	! t0_kref+0x1620:   	wr	%l7, 0x169, %fprs
	.word	0x9875f6ca	! t0_kref+0x1624:   	udiv	%l7, -0x936, %o4
	.word	0x90ad8016	! t0_kref+0x1628:   	andncc	%l6, %l6, %o0
	.word	0x96d58016	! t0_kref+0x162c:   	umulcc	%l6, %l6, %o3
	.word	0x8fa01a42	! t0_kref+0x1630:   	fdtoi	%f2, %f7
	.word	0xecae9018	! t0_kref+0x1634:   	stba	%l6, [%i2 + %i0]0x80
	.word	0x87a00025	! t0_kref+0x1638:   	fmovs	%f5, %f3
	.word	0x94bdc017	! t0_kref+0x163c:   	xnorcc	%l7, %l7, %o2
	.word	0x2d800002	! t0_kref+0x1640:   	fbg,a	_kref+0x1648
	.word	0xc51fbf80	! t0_kref+0x1644:   	ldd	[%fp - 0x80], %f2
	.word	0x85a018c8	! t0_kref+0x1648:   	fdtos	%f8, %f2
	.word	0x8da01022	! t0_kref+0x164c:   	fstox	%f2, %f6
	.word	0x9e8d8016	! t0_kref+0x1650:   	andcc	%l6, %l6, %o7
	.word	0x9495ee87	! t0_kref+0x1654:   	orcc	%l7, 0xe87, %o2
	.word	0xcd1fbfb8	! t0_kref+0x1658:   	ldd	[%fp - 0x48], %f6
	.word	0x8da01a26	! t0_kref+0x165c:   	fstoi	%f6, %f6
	.word	0x80758017	! t0_kref+0x1660:   	udiv	%l6, %l7, %g0
	.word	0x8da01a29	! t0_kref+0x1664:   	fstoi	%f9, %f6
	.word	0x9405c016	! t0_kref+0x1668:   	add	%l7, %l6, %o2
	call	SYM(t0_subr1)
	.word	0x8d85e93a	! t0_kref+0x1670:   	wr	%l7, 0x93a, %fprs
	.word	0x89a188c8	! t0_kref+0x1674:   	fsubd	%f6, %f8, %f4
	.word	0xe5ee101a	! t0_kref+0x1678:   	prefetcha	%i0 + %i2, 18
	.word	0xe7ee101a	! t0_kref+0x167c:   	prefetcha	%i0 + %i2, 19
	.word	0x91a008c4	! t0_kref+0x1680:   	fsubd	%f0, %f4, %f8
	.word	0x81d9401c	! t0_kref+0x1684:   	flush	%g5 + %i4
	.word	0x92d5c017	! t0_kref+0x1688:   	umulcc	%l7, %l7, %o1
	.word	0x81a8caa6	! t0_kref+0x168c:   	fcmpes	%fcc0, %f3, %f6
	.word	0x9e558017	! t0_kref+0x1690:   	umul	%l6, %l7, %o7
	.word	0x8da01925	! t0_kref+0x1694:   	fstod	%f5, %f6
	.word	0x90d5f2ec	! t0_kref+0x1698:   	umulcc	%l7, -0xd14, %o0
	.word	0x905de72d	! t0_kref+0x169c:   	smul	%l7, 0x72d, %o0
	.word	0xd448a001	! t0_kref+0x16a0:   	ldsb	[%g2 + 1], %o2
	.word	0xd86e8018	! t0_kref+0x16a4:   	ldstub	[%i2 + %i0], %o4
	.word	0x83c06d20	! t0_kref+0x16a8:   	jmpl	%g1 + 0xd20, %g1
	.word	0xc19e5a5c	! t0_kref+0x16ac:   	ldda	[%i1 + %i4]0xd2, %f0
	.word	0xc368a080	! t0_kref+0x16b0:   	prefetch	%g2 + 0x80, 1
	.word	0xc11fbd40	! t0_kref+0x16b4:   	ldd	[%fp - 0x2c0], %f0
	.word	0x9ad5e31c	! t0_kref+0x16b8:   	umulcc	%l7, 0x31c, %o5
	.word	0x81a8ca23	! t0_kref+0x16bc:   	fcmps	%fcc0, %f3, %f3
	.word	0x98f5f2e2	! t0_kref+0x16c0:   	udivcc	%l7, -0xd1e, %o4
	.word	0x933d8017	! t0_kref+0x16c4:   	sra	%l6, %l7, %o1
	.word	0xc51fbd78	! t0_kref+0x16c8:   	ldd	[%fp - 0x288], %f2
	.word	0xc010a008	! t0_kref+0x16cc:   	lduh	[%g2 + 8], %g0
	.word	0x878020d2	! t0_kref+0x16d0:   	mov	0xd2, %asi
	.word	0x92d58016	! t0_kref+0x16d4:   	umulcc	%l6, %l6, %o1
	.word	0x9ad5f1cc	! t0_kref+0x16d8:   	umulcc	%l7, -0xe34, %o5
	.word	0x9865edf1	! t0_kref+0x16dc:   	subc	%l7, 0xdf1, %o4
	.word	0x8065efd4	! t0_kref+0x16e0:   	subc	%l7, 0xfd4, %g0
	.word	0xc1200018	! t0_kref+0x16e4:   	st	%f0, [%g0 + %i0]
	.word	0x81df7c78	! t0_kref+0x16e8:   	flush	%i5 - 0x388
	.word	0x9a3de7d0	! t0_kref+0x16ec:   	xnor	%l7, 0x7d0, %o5
	.word	0x9275bb98	! t0_kref+0x16f0:   	udiv	%l6, -0x468, %o1
	.word	0x1f33ec9d	! t0_kref+0x16f4:   	sethi	%hi(0xcfb27400), %o7
	.word	0xd0be5000	! t0_kref+0x16f8:   	stda	%o0, [%i1]0x80
	.word	0x94758017	! t0_kref+0x16fc:   	udiv	%l6, %l7, %o2
	.word	0xc5b81018	! t0_kref+0x1700:   	stda	%f2, [%g0 + %i0]0x80
	.word	0xc1be5897	! t0_kref+0x1704:   	stda	%f0, [%i1 + %l7]0xc4
	.word	0x9a35c016	! t0_kref+0x1708:   	orn	%l7, %l6, %o5
	.word	0x8da089a5	! t0_kref+0x170c:   	fdivs	%f2, %f5, %f6
	.word	0xd0070018	! t0_kref+0x1710:   	ld	[%i4 + %i0], %o0
	.word	0x80958016	! t0_kref+0x1714:   	orcc	%l6, %l6, %g0
	.word	0x89a249a6	! t0_kref+0x1718:   	fdivs	%f9, %f6, %f4
	.word	0x9e758017	! t0_kref+0x171c:   	udiv	%l6, %l7, %o7
	.word	0x9875c016	! t0_kref+0x1720:   	udiv	%l7, %l6, %o4
	.word	0x9e658017	! t0_kref+0x1724:   	subc	%l6, %l7, %o7
	.word	0x27800002	! t0_kref+0x1728:   	fbul,a	_kref+0x1730
	.word	0x8075c016	! t0_kref+0x172c:   	udiv	%l7, %l6, %g0
	.word	0xc91fbd78	! t0_kref+0x1730:   	ldd	[%fp - 0x288], %f4
	.word	0x86102003	! t0_kref+0x1734:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x1738:   	bne,a	_kref+0x1738
	.word	0x86a0e001	! t0_kref+0x173c:   	subcc	%g3, 1, %g3
	.word	0x945dc016	! t0_kref+0x1740:   	smul	%l7, %l6, %o2
	.word	0xd8070018	! t0_kref+0x1744:   	ld	[%i4 + %i0], %o4
	.word	0x9e058017	! t0_kref+0x1748:   	add	%l6, %l7, %o7
	.word	0x81a88a29	! t0_kref+0x174c:   	fcmps	%fcc0, %f2, %f9
	.word	0x9ed5e69b	! t0_kref+0x1750:   	umulcc	%l7, 0x69b, %o7
	.word	0xc11fbcd0	! t0_kref+0x1754:   	ldd	[%fp - 0x330], %f0
	.word	0xec300018	! t0_kref+0x1758:   	sth	%l6, [%g0 + %i0]
	.word	0x001fffff	! t0_kref+0x175c:   	illtrap	0x1fffff
	.word	0x8da01925	! t0_kref+0x1760:   	fstod	%f5, %f6
	.word	0x933dc016	! t0_kref+0x1764:   	sra	%l7, %l6, %o1
	.word	0xd1267ffc	! t0_kref+0x1768:   	st	%f8, [%i1 - 4]
	.word	0x93400000	! t0_kref+0x176c:   	mov	%y, %o1
	.word	0xecae501a	! t0_kref+0x1770:   	stba	%l6, [%i1 + %i2]0x80
	.word	0x9a05c017	! t0_kref+0x1774:   	add	%l7, %l7, %o5
	.word	0xec260000	! t0_kref+0x1778:   	st	%l6, [%i0]
	.word	0xd2080018	! t0_kref+0x177c:   	ldub	[%g0 + %i0], %o1
	.word	0x92fd8017	! t0_kref+0x1780:   	sdivcc	%l6, %l7, %o1
	.word	0x91a108c8	! t0_kref+0x1784:   	fsubd	%f4, %f8, %f8
	.word	0x81a9ca20	! t0_kref+0x1788:   	fcmps	%fcc0, %f7, %f0
	.word	0xc920a004	! t0_kref+0x178c:   	st	%f4, [%g2 + 4]
	.word	0x9e8dffcf	! t0_kref+0x1790:   	andcc	%l7, -0x31, %o7
	.word	0x81aa0a20	! t0_kref+0x1794:   	fcmps	%fcc0, %f8, %f0
	.word	0xfdee101b	! t0_kref+0x1798:   	prefetcha	%i0 + %i3, 30
	.word	0x8143c000	! t0_kref+0x179c:   	stbar
	.word	0x8da01028	! t0_kref+0x17a0:   	fstox	%f8, %f6
	.word	0x80e58016	! t0_kref+0x17a4:   	subccc	%l6, %l6, %g0
	.word	0xc568a009	! t0_kref+0x17a8:   	prefetch	%g2 + 9, 2
	.word	0x9635c016	! t0_kref+0x17ac:   	orn	%l7, %l6, %o3
	.word	0xda08a026	! t0_kref+0x17b0:   	ldub	[%g2 + 0x26], %o5
	.word	0x9655c016	! t0_kref+0x17b4:   	umul	%l7, %l6, %o3
	.word	0x8025c016	! t0_kref+0x17b8:   	sub	%l7, %l6, %g0
	.word	0x9025bdf0	! t0_kref+0x17bc:   	sub	%l6, -0x210, %o0
	.word	0x93a000a2	! t0_kref+0x17c0:   	fnegs	%f2, %f9
	.word	0x9a55b2e9	! t0_kref+0x17c4:   	umul	%l6, -0xd17, %o5
	.word	0x95058017	! t0_kref+0x17c8:   	taddcc	%l6, %l7, %o2
	.word	0x9465c017	! t0_kref+0x17cc:   	subc	%l7, %l7, %o2
	.word	0xd410a01a	! t0_kref+0x17d0:   	lduh	[%g2 + 0x1a], %o2
	.word	0xf16e001d	! t0_kref+0x17d4:   	prefetch	%i0 + %i5, 24
	.word	0xd300a034	! t0_kref+0x17d8:   	ld	[%g2 + 0x34], %f9
	.word	0x9a45ab4f	! t0_kref+0x17dc:   	addc	%l6, 0xb4f, %o5
	.word	0x8ba209a4	! t0_kref+0x17e0:   	fdivs	%f8, %f4, %f5
	.word	0x8da00022	! t0_kref+0x17e4:   	fmovs	%f2, %f6
	.word	0x98dd8016	! t0_kref+0x17e8:   	smulcc	%l6, %l6, %o4
	.word	0x87a189a8	! t0_kref+0x17ec:   	fdivs	%f6, %f8, %f3
	.word	0x31800004	! t0_kref+0x17f0:   	fba,a	_kref+0x1800
	.word	0x89a000a8	! t0_kref+0x17f4:   	fnegs	%f8, %f4
	.word	0x9af5e0e7	! t0_kref+0x17f8:   	udivcc	%l7, 0xe7, %o5
	.word	0x98bdbe4e	! t0_kref+0x17fc:   	xnorcc	%l6, -0x1b2, %o4
	.word	0x86102001	! t0_kref+0x1800:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x1804:   	bne,a	_kref+0x1804
	.word	0x86a0e001	! t0_kref+0x1808:   	subcc	%g3, 1, %g3
	.word	0x91a01a24	! t0_kref+0x180c:   	fstoi	%f4, %f8
	.word	0xec3e3fe8	! t0_kref+0x1810:   	std	%l6, [%i0 - 0x18]
	.word	0x91a01a21	! t0_kref+0x1814:   	fstoi	%f1, %f8
	.word	0x9065c017	! t0_kref+0x1818:   	subc	%l7, %l7, %o0
	.word	0xe66e7fe1	! t0_kref+0x181c:   	ldstub	[%i1 - 0x1f], %l3
	.word	0x9b058016	! t0_kref+0x1820:   	taddcc	%l6, %l6, %o5
	.word	0xd11fbf28	! t0_kref+0x1824:   	ldd	[%fp - 0xd8], %f8
	.word	0x012d47dc	! t0_kref+0x1828:   	sethi	%hi(0xb51f7000), %g0
	.word	0x8da01924	! t0_kref+0x182c:   	fstod	%f4, %f6
	.word	0xec3e2010	! t0_kref+0x1830:   	std	%l6, [%i0 + 0x10]
	.word	0x94b5a30b	! t0_kref+0x1834:   	orncc	%l6, 0x30b, %o2
	.word	0x960dc016	! t0_kref+0x1838:   	and	%l7, %l6, %o3
	.word	0x8fa8c020	! t0_kref+0x183c:   	fmovsul	%fcc0, %f0, %f7
	.word	0x81a01a28	! t0_kref+0x1840:   	fstoi	%f8, %f0
	.word	0xd810a018	! t0_kref+0x1844:   	lduh	[%g2 + 0x18], %o4
	.word	0xec36401b	! t0_kref+0x1848:   	sth	%l6, [%i1 + %i3]
	.word	0x96d5aba1	! t0_kref+0x184c:   	umulcc	%l6, 0xba1, %o3
	.word	0x85a08948	! t0_kref+0x1850:   	fmuld	%f2, %f8, %f2
	.word	0x9b25c016	! t0_kref+0x1854:   	mulscc	%l7, %l6, %o5
	.word	0x9e75c016	! t0_kref+0x1858:   	udiv	%l7, %l6, %o7
	.word	0x81a9caa8	! t0_kref+0x185c:   	fcmpes	%fcc0, %f7, %f8
	.word	0x9a758016	! t0_kref+0x1860:   	udiv	%l6, %l6, %o5
	.word	0x9065aa26	! t0_kref+0x1864:   	subc	%l6, 0xa26, %o0
	call	SYM(t0_subr0)
	.word	0x8fa000a0	! t0_kref+0x186c:   	fnegs	%f0, %f7
	.word	0xc51fbc08	! t0_kref+0x1870:   	ldd	[%fp - 0x3f8], %f2
	sethi	%hi(2f), %o7
	.word	0xe40be0b4	! t0_kref+0x1878:   	ldub	[%o7 + 0xb4], %l2
	.word	0xa41ca00c	! t0_kref+0x187c:   	xor	%l2, 0xc, %l2
	.word	0xe42be0b4	! t0_kref+0x1880:   	stb	%l2, [%o7 + 0xb4]
	.word	0x81dbe0b4	! t0_kref+0x1884:   	flush	%o7 + 0xb4
	.word	0xc1267fe0	! t0_kref+0x1888:   	st	%f0, [%i1 - 0x20]
	.word	0xc53e7fe0	! t0_kref+0x188c:   	std	%f2, [%i1 - 0x20]
	.word	0x9e65a2f7	! t0_kref+0x1890:   	subc	%l6, 0x2f7, %o7
	.word	0x8ba018c6	! t0_kref+0x1894:   	fdtos	%f6, %f5
	.word	0xec3e401d	! t0_kref+0x1898:   	std	%l6, [%i1 + %i5]
	.word	0x8ba049a2	! t0_kref+0x189c:   	fdivs	%f1, %f2, %f5
	.word	0xee30a010	! t0_kref+0x18a0:   	sth	%l7, [%g2 + 0x10]
	.word	0x9e65fb4a	! t0_kref+0x18a4:   	subc	%l7, -0x4b6, %o7
	.word	0x94c58017	! t0_kref+0x18a8:   	addccc	%l6, %l7, %o2
	.word	0x89a01887	! t0_kref+0x18ac:   	fitos	%f7, %f4
	.word	0xc168a049	! t0_kref+0x18b0:   	prefetch	%g2 + 0x49, 0
2:	.word	0xd326001c	! t0_kref+0x18b4:   	st	%f9, [%i0 + %i4]
	.word	0x90158016	! t0_kref+0x18b8:   	or	%l6, %l6, %o0
	.word	0x8ba01a44	! t0_kref+0x18bc:   	fdtoi	%f4, %f5
	.word	0x85a01902	! t0_kref+0x18c0:   	fitod	%f2, %f2
	.word	0x9b3d8017	! t0_kref+0x18c4:   	sra	%l6, %l7, %o5
	.word	0x9895f6a3	! t0_kref+0x18c8:   	orcc	%l7, -0x95d, %o4
	.word	0x81a8ca25	! t0_kref+0x18cc:   	fcmps	%fcc0, %f3, %f5
	.word	0x941de3f9	! t0_kref+0x18d0:   	xor	%l7, 0x3f9, %o2
	.word	0xc0067fe0	! t0_kref+0x18d4:   	ld	[%i1 - 0x20], %g0
	.word	0xdade1000	! t0_kref+0x18d8:   	ldxa	[%i0]0x80, %o5
	.word	0xcd1fbd98	! t0_kref+0x18dc:   	ldd	[%fp - 0x268], %f6
	.word	0xc5a71019	! t0_kref+0x18e0:   	sta	%f2, [%i4 + %i1]0x80
	.word	0x93418000	! t0_kref+0x18e4:   	mov	%fprs, %o1
	.word	0x96adf1e8	! t0_kref+0x18e8:   	andncc	%l7, -0xe18, %o3
	.word	0x8d85fe5a	! t0_kref+0x18ec:   	wr	%l7, 0xfffffe5a, %fprs
	.word	0x23800004	! t0_kref+0x18f0:   	fbne,a	_kref+0x1900
	.word	0x9aa5a5fb	! t0_kref+0x18f4:   	subcc	%l6, 0x5fb, %o5
	.word	0xc9be1816	! t0_kref+0x18f8:   	stda	%f4, [%i0 + %l6]0xc0
	.word	0x8d85e887	! t0_kref+0x18fc:   	wr	%l7, 0x887, %fprs
	.word	0x81dd4001	! t0_kref+0x1900:   	flush	%l5 + %g1
	.word	0xd0df5018	! t0_kref+0x1904:   	ldxa	[%i5 + %i0]0x80, %o0
	.word	0x948db44e	! t0_kref+0x1908:   	andcc	%l6, -0xbb2, %o2
	.word	0x90c5c016	! t0_kref+0x190c:   	addccc	%l7, %l6, %o0
	.word	0xe968a002	! t0_kref+0x1910:   	prefetch	%g2 + 2, 20
	.word	0x8fa209a7	! t0_kref+0x1914:   	fdivs	%f8, %f7, %f7
	.word	0x9ebdecbb	! t0_kref+0x1918:   	xnorcc	%l7, 0xcbb, %o7
	.word	0x805da698	! t0_kref+0x191c:   	smul	%l6, 0x698, %g0
	.word	0x948df8dc	! t0_kref+0x1920:   	andcc	%l7, -0x724, %o2
	.word	0x80c5a453	! t0_kref+0x1924:   	addccc	%l6, 0x453, %g0
	.word	0x94bdc017	! t0_kref+0x1928:   	xnorcc	%l7, %l7, %o2
	.word	0xe40862b4	! t0_kref+0x192c:   	ldub	[%g1 + 0x2b4], %l2
	.word	0xa41ca00c	! t0_kref+0x1930:   	xor	%l2, 0xc, %l2
	.word	0xe42862b4	! t0_kref+0x1934:   	stb	%l2, [%g1 + 0x2b4]
	.word	0x81d862b4	! t0_kref+0x1938:   	flush	%g1 + 0x2b4
	.word	0x8da01927	! t0_kref+0x193c:   	fstod	%f7, %f6
	.word	0x81d94017	! t0_kref+0x1940:   	flush	%g5 + %l7
	.word	0x9b25e4e1	! t0_kref+0x1944:   	mulscc	%l7, 0x4e1, %o5
	.word	0x9665c016	! t0_kref+0x1948:   	subc	%l7, %l6, %o3
	.word	0x9f400000	! t0_kref+0x194c:   	mov	%y, %o7
	.word	0x9abdfec7	! t0_kref+0x1950:   	xnorcc	%l7, -0x139, %o5
	.word	0x96bdf091	! t0_kref+0x1954:   	xnorcc	%l7, -0xf6f, %o3
	.word	0x9ad5c016	! t0_kref+0x1958:   	umulcc	%l7, %l6, %o5
2:	.word	0xa045be92	! t0_kref+0x195c:   	addc	%l6, -0x16e, %l0
	.word	0x98e5ff06	! t0_kref+0x1960:   	subccc	%l7, -0xfa, %o4
	.word	0x81a049a3	! t0_kref+0x1964:   	fdivs	%f1, %f3, %f0
	.word	0x988dee3d	! t0_kref+0x1968:   	andcc	%l7, 0xe3d, %o4
	.word	0x9295b0ce	! t0_kref+0x196c:   	orcc	%l6, -0xf32, %o1
	.word	0x95418000	! t0_kref+0x1970:   	mov	%fprs, %o2
	.word	0x89a00148	! t0_kref+0x1974:   	fabsd	%f8, %f4
	.word	0x8d85f5ef	! t0_kref+0x1978:   	wr	%l7, 0xfffff5ef, %fprs
	.word	0x85a208c2	! t0_kref+0x197c:   	fsubd	%f8, %f2, %f2
	.word	0xe41e4000	! t0_kref+0x1980:   	ldd	[%i1], %l2
	.word	0x93a000a0	! t0_kref+0x1984:   	fnegs	%f0, %f9
	.word	0x81a249a3	! t0_kref+0x1988:   	fdivs	%f9, %f3, %f0
	.word	0x909dab7c	! t0_kref+0x198c:   	xorcc	%l6, 0xb7c, %o0
	.word	0xc900a034	! t0_kref+0x1990:   	ld	[%g2 + 0x34], %f4
	.word	0xee30a022	! t0_kref+0x1994:   	sth	%l7, [%g2 + 0x22]
	.word	0xd43f4019	! t0_kref+0x1998:   	std	%o2, [%i5 + %i1]
	.word	0x85a188c2	! t0_kref+0x199c:   	fsubd	%f6, %f2, %f2
	sethi	%hi(2f), %o7
	.word	0xe40be1dc	! t0_kref+0x19a4:   	ldub	[%o7 + 0x1dc], %l2
	.word	0xa41ca00c	! t0_kref+0x19a8:   	xor	%l2, 0xc, %l2
	.word	0xe42be1dc	! t0_kref+0x19ac:   	stb	%l2, [%o7 + 0x1dc]
	.word	0x81dbe1dc	! t0_kref+0x19b0:   	flush	%o7 + 0x1dc
	.word	0x9ee5c017	! t0_kref+0x19b4:   	subccc	%l7, %l7, %o7
	.word	0x812dc016	! t0_kref+0x19b8:   	sll	%l7, %l6, %g0
	.word	0x25800001	! t0_kref+0x19bc:   	fblg,a	_kref+0x19c0
	.word	0x93a01a28	! t0_kref+0x19c0:   	fstoi	%f8, %f9
	.word	0x8dab0046	! t0_kref+0x19c4:   	fmovduge	%fcc0, %f6, %f6
	.word	0xd0167fee	! t0_kref+0x19c8:   	lduh	[%i1 - 0x12], %o0
	.word	0x91408000	! t0_kref+0x19cc:   	mov	%ccr, %o0
	.word	0xee267ff4	! t0_kref+0x19d0:   	st	%l7, [%i1 - 0xc]
	.word	0x92e5c017	! t0_kref+0x19d4:   	subccc	%l7, %l7, %o1
	.word	0x89a04d25	! t0_kref+0x19d8:   	fsmuld	%f1, %f5, %f4
2:	.word	0x85a00020	! t0_kref+0x19dc:   	fmovs	%f0, %f2
	.word	0x91a018c2	! t0_kref+0x19e0:   	fdtos	%f2, %f8
	.word	0x8da089c6	! t0_kref+0x19e4:   	fdivd	%f2, %f6, %f6
	.word	0xea003134	! t0_kref+0x19e8:   	ld	[%g0 - 0xecc], %l5
	.word	0x9105afec	! t0_kref+0x19ec:   	taddcc	%l6, 0xfec, %o0
	.word	0x25800001	! t0_kref+0x19f0:   	fblg,a	_kref+0x19f4
	.word	0xd320a024	! t0_kref+0x19f4:   	st	%f9, [%g2 + 0x24]
	.word	0xc07e7ff0	! t0_kref+0x19f8:   	swap	[%i1 - 0x10], %g0
	.word	0x80d5c017	! t0_kref+0x19fc:   	umulcc	%l7, %l7, %g0
	.word	0x8ba000a4	! t0_kref+0x1a00:   	fnegs	%f4, %f5
	.word	0xd85e6018	! t0_kref+0x1a04:   	ldx	[%i1 + 0x18], %o4
	.word	0x9635b5f2	! t0_kref+0x1a08:   	orn	%l6, -0xa0e, %o3
	.word	0x85a00842	! t0_kref+0x1a0c:   	faddd	%f0, %f2, %f2
	.word	0x96a5eaed	! t0_kref+0x1a10:   	subcc	%l7, 0xaed, %o3
	.word	0xc7ee1016	! t0_kref+0x1a14:   	prefetcha	%i0 + %l6, 3
	.word	0xc7267fe4	! t0_kref+0x1a18:   	st	%f3, [%i1 - 0x1c]
	call	SYM(t0_subr0)
	.word	0x8ba01a20	! t0_kref+0x1a20:   	fstoi	%f0, %f5
	.word	0xc3200018	! t0_kref+0x1a24:   	st	%f1, [%g0 + %i0]
	.word	0x9aa58017	! t0_kref+0x1a28:   	subcc	%l6, %l7, %o5
	.word	0xc51fbd18	! t0_kref+0x1a2c:   	ldd	[%fp - 0x2e8], %f2
	.word	0xcd3e2018	! t0_kref+0x1a30:   	std	%f6, [%i0 + 0x18]
	sethi	%hi(2f), %o7
	.word	0xe40be260	! t0_kref+0x1a38:   	ldub	[%o7 + 0x260], %l2
	.word	0xa41ca00c	! t0_kref+0x1a3c:   	xor	%l2, 0xc, %l2
	.word	0xe42be260	! t0_kref+0x1a40:   	stb	%l2, [%o7 + 0x260]
	.word	0x81dbe260	! t0_kref+0x1a44:   	flush	%o7 + 0x260
	.word	0x96a5c016	! t0_kref+0x1a48:   	subcc	%l7, %l6, %o3
	.word	0x9e95f56a	! t0_kref+0x1a4c:   	orcc	%l7, -0xa96, %o7
	.word	0xd1066000	! t0_kref+0x1a50:   	ld	[%i1], %f8
	.word	0x9075f07e	! t0_kref+0x1a54:   	udiv	%l7, -0xf82, %o0
	.word	0xc99f5018	! t0_kref+0x1a58:   	ldda	[%i5 + %i0]0x80, %f4
	.word	0x8185c000	! t0_kref+0x1a5c:   	wr	%l7, %g0, %y
2:	.word	0xe41e2000	! t0_kref+0x1a60:   	ldd	[%i0], %l2
	.word	0x809d8017	! t0_kref+0x1a64:   	xorcc	%l6, %l7, %g0
	.word	0x81a20946	! t0_kref+0x1a68:   	fmuld	%f8, %f6, %f0
	.word	0x91a01a23	! t0_kref+0x1a6c:   	fstoi	%f3, %f8
	.word	0xe40863e4	! t0_kref+0x1a70:   	ldub	[%g1 + 0x3e4], %l2
	.word	0xa41ca00c	! t0_kref+0x1a74:   	xor	%l2, 0xc, %l2
	.word	0xe42863e4	! t0_kref+0x1a78:   	stb	%l2, [%g1 + 0x3e4]
	.word	0x81d863e4	! t0_kref+0x1a7c:   	flush	%g1 + 0x3e4
	.word	0xdedf5019	! t0_kref+0x1a80:   	ldxa	[%i5 + %i1]0x80, %o7
	.word	0x98c58017	! t0_kref+0x1a84:   	addccc	%l6, %l7, %o4
	.word	0xda7e6018	! t0_kref+0x1a88:   	swap	[%i1 + 0x18], %o5
2:	.word	0xec264000	! t0_kref+0x1a8c:   	st	%l6, [%i1]
	.word	0xc900a024	! t0_kref+0x1a90:   	ld	[%g2 + 0x24], %f4
	.word	0xee28a034	! t0_kref+0x1a94:   	stb	%l7, [%g2 + 0x34]
	.word	0x94b5ba14	! t0_kref+0x1a98:   	orncc	%l6, -0x5ec, %o2
	.word	0xde96101b	! t0_kref+0x1a9c:   	lduha	[%i0 + %i3]0x80, %o7
	.word	0xee264000	! t0_kref+0x1aa0:   	st	%l7, [%i1]
	.word	0x8095c017	! t0_kref+0x1aa4:   	orcc	%l7, %l7, %g0
	.word	0xec366010	! t0_kref+0x1aa8:   	sth	%l6, [%i1 + 0x10]
	call	SYM(t0_subr2)
	.word	0xcd26401c	! t0_kref+0x1ab0:   	st	%f6, [%i1 + %i4]
	.word	0x8143c000	! t0_kref+0x1ab4:   	stbar
	.word	0xc526401c	! t0_kref+0x1ab8:   	st	%f2, [%i1 + %i4]
	.word	0xd200a02c	! t0_kref+0x1abc:   	ld	[%g2 + 0x2c], %o1
	.word	0x87a01887	! t0_kref+0x1ac0:   	fitos	%f7, %f3
	.word	0x80958017	! t0_kref+0x1ac4:   	orcc	%l6, %l7, %g0
	.word	0x983d8016	! t0_kref+0x1ac8:   	xnor	%l6, %l6, %o4
	.word	0x9645f048	! t0_kref+0x1acc:   	addc	%l7, -0xfb8, %o3
	.word	0x9e35bf46	! t0_kref+0x1ad0:   	orn	%l6, -0xba, %o7
	.word	0xc96e7ff8	! t0_kref+0x1ad4:   	prefetch	%i1 - 8, 4
	.word	0xd4c6501c	! t0_kref+0x1ad8:   	ldswa	[%i1 + %i4]0x80, %o2
	.word	0x8143e040	! t0_kref+0x1adc:   	membar	0x40
	.word	0xc768a081	! t0_kref+0x1ae0:   	prefetch	%g2 + 0x81, 3
	.word	0x94a5c016	! t0_kref+0x1ae4:   	subcc	%l7, %l6, %o2
	.word	0xdad61000	! t0_kref+0x1ae8:   	ldsha	[%i0]0x80, %o5
	.word	0x90d5c017	! t0_kref+0x1aec:   	umulcc	%l7, %l7, %o0
	.word	0xe7ee101b	! t0_kref+0x1af0:   	prefetcha	%i0 + %i3, 19
	.word	0xeca81019	! t0_kref+0x1af4:   	stba	%l6, [%g0 + %i1]0x80
	.word	0xecae9019	! t0_kref+0x1af8:   	stba	%l6, [%i2 + %i1]0x80
	.word	0x11077684	! t0_kref+0x1afc:   	sethi	%hi(0x1dda1000), %o0
	.word	0xda10a008	! t0_kref+0x1b00:   	lduh	[%g2 + 8], %o5
	.word	0x8143c000	! t0_kref+0x1b04:   	stbar
	.word	0xc1ee1016	! t0_kref+0x1b08:   	prefetcha	%i0 + %l6, 0
	.word	0x8610201e	! t0_kref+0x1b0c:   	mov	0x1e, %g3
	.word	0x86a0e001	! t0_kref+0x1b10:   	subcc	%g3, 1, %g3
	.word	0x22800019	! t0_kref+0x1b14:   	be,a	_kref+0x1b78
	.word	0xd27e3ff8	! t0_kref+0x1b18:   	swap	[%i0 - 8], %o1
	.word	0x80adc017	! t0_kref+0x1b1c:   	andncc	%l7, %l7, %g0
	.word	0x8da01885	! t0_kref+0x1b20:   	fitos	%f5, %f6
	.word	0x81a108c0	! t0_kref+0x1b24:   	fsubd	%f4, %f0, %f0
	.word	0xfb6e401b	! t0_kref+0x1b28:   	prefetch	%i1 + %i3, 29
	.word	0x92958017	! t0_kref+0x1b2c:   	orcc	%l6, %l7, %o1
	.word	0x80f5abbf	! t0_kref+0x1b30:   	udivcc	%l6, 0xbbf, %g0
	.word	0x80458017	! t0_kref+0x1b34:   	addc	%l6, %l7, %g0
	.word	0x9fc10000	! t0_kref+0x1b38:   	call	%g4
	.word	0x9025e41d	! t0_kref+0x1b3c:   	sub	%l7, 0x41d, %o0
	.word	0x9535c017	! t0_kref+0x1b40:   	srl	%l7, %l7, %o2
	.word	0x9ea5f314	! t0_kref+0x1b44:   	subcc	%l7, -0xcec, %o7
	.word	0xc0162014	! t0_kref+0x1b48:   	lduh	[%i0 + 0x14], %g0
	call	SYM(t0_subr0)
	.word	0xecf6501d	! t0_kref+0x1b50:   	stxa	%l6, [%i1 + %i5]0x80
	.word	0x83a01881	! t0_kref+0x1b54:   	fitos	%f1, %f1
	.word	0x9a958016	! t0_kref+0x1b58:   	orcc	%l6, %l6, %o5
	.word	0x9e3dc016	! t0_kref+0x1b5c:   	xnor	%l7, %l6, %o7
	.word	0x8143c000	! t0_kref+0x1b60:   	stbar
	.word	0x8da01924	! t0_kref+0x1b64:   	fstod	%f4, %f6
	.word	0x9235e157	! t0_kref+0x1b68:   	orn	%l7, 0x157, %o1
	.word	0x81aa0aa6	! t0_kref+0x1b6c:   	fcmpes	%fcc0, %f8, %f6
	.word	0x85a00925	! t0_kref+0x1b70:   	fmuls	%f0, %f5, %f2
	.word	0x94f5c017	! t0_kref+0x1b74:   	udivcc	%l7, %l7, %o2
	.word	0xee260000	! t0_kref+0x1b78:   	st	%l7, [%i0]
	.word	0xf207bfe0	! t0_kref+0x1b7c:   	ld	[%fp - 0x20], %i1
	.word	0xd11e3ff8	! t0_kref+0x1b80:   	ldd	[%i0 - 8], %f8
	.word	0x81a90aa2	! t0_kref+0x1b84:   	fcmpes	%fcc0, %f4, %f2
	.word	0x9695e128	! t0_kref+0x1b88:   	orcc	%l7, 0x128, %o3
	.word	0xd27e6010	! t0_kref+0x1b8c:   	swap	[%i1 + 0x10], %o1
	.word	0xcd270018	! t0_kref+0x1b90:   	st	%f6, [%i4 + %i0]
	.word	0x9535c017	! t0_kref+0x1b94:   	srl	%l7, %l7, %o2
	.word	0x81a01a25	! t0_kref+0x1b98:   	fstoi	%f5, %f0
	.word	0x83a049a3	! t0_kref+0x1b9c:   	fdivs	%f1, %f3, %f1
	.word	0xc9be9a19	! t0_kref+0x1ba0:   	stda	%f4, [%i2 + %i1]0xd0
	.word	0xee360000	! t0_kref+0x1ba4:   	sth	%l7, [%i0]
	sethi	%hi(2f), %o7
	.word	0xe40be3ec	! t0_kref+0x1bac:   	ldub	[%o7 + 0x3ec], %l2
	.word	0xa41ca00c	! t0_kref+0x1bb0:   	xor	%l2, 0xc, %l2
	.word	0xe42be3ec	! t0_kref+0x1bb4:   	stb	%l2, [%o7 + 0x3ec]
	.word	0x81dbe3ec	! t0_kref+0x1bb8:   	flush	%o7 + 0x3ec
	.word	0xd608a013	! t0_kref+0x1bbc:   	ldub	[%g2 + 0x13], %o3
	.word	0x91a109a7	! t0_kref+0x1bc0:   	fdivs	%f4, %f7, %f8
	.word	0x9fc00004	! t0_kref+0x1bc4:   	call	%g0 + %g4
	.word	0xc0c71019	! t0_kref+0x1bc8:   	ldswa	[%i4 + %i1]0x80, %g0
	.word	0x81a98a21	! t0_kref+0x1bcc:   	fcmps	%fcc0, %f6, %f1
	.word	0x9935c017	! t0_kref+0x1bd0:   	srl	%l7, %l7, %o4
	.word	0xd11e2008	! t0_kref+0x1bd4:   	ldd	[%i0 + 8], %f8
	.word	0xd1f65017	! t0_kref+0x1bd8:   	casxa	[%i1]0x80, %l7, %o0
	.word	0xee20a004	! t0_kref+0x1bdc:   	st	%l7, [%g2 + 4]
	.word	0xec270019	! t0_kref+0x1be0:   	st	%l6, [%i4 + %i1]
	.word	0x9245c016	! t0_kref+0x1be4:   	addc	%l7, %l6, %o1
	.word	0xc11fbf98	! t0_kref+0x1be8:   	ldd	[%fp - 0x68], %f0
2:	.word	0x89a01a27	! t0_kref+0x1bec:   	fstoi	%f7, %f4
	.word	0xec780018	! t0_kref+0x1bf0:   	swap	[%g0 + %i0], %l6
	.word	0x813dc017	! t0_kref+0x1bf4:   	sra	%l7, %l7, %g0
	.word	0x81a01889	! t0_kref+0x1bf8:   	fitos	%f9, %f0
	.word	0x85a009c0	! t0_kref+0x1bfc:   	fdivd	%f0, %f0, %f2
	.word	0xd05e7fe8	! t0_kref+0x1c00:   	ldx	[%i1 - 0x18], %o0
	.word	0x908d8017	! t0_kref+0x1c04:   	andcc	%l6, %l7, %o0
	.word	0x87a01a22	! t0_kref+0x1c08:   	fstoi	%f2, %f3
	.word	0x8143c000	! t0_kref+0x1c0c:   	stbar
	.word	0x8135a007	! t0_kref+0x1c10:   	srl	%l6, 0x7, %g0
	.word	0xd83e6010	! t0_kref+0x1c14:   	std	%o4, [%i1 + 0x10]
	.word	0x94f58016	! t0_kref+0x1c18:   	udivcc	%l6, %l6, %o2
	.word	0x91a90029	! t0_kref+0x1c1c:   	fmovsl	%fcc0, %f9, %f8
	.word	0x903dfa58	! t0_kref+0x1c20:   	xnor	%l7, -0x5a8, %o0
	.word	0x92ddc017	! t0_kref+0x1c24:   	smulcc	%l7, %l7, %o1
	.word	0x969d8016	! t0_kref+0x1c28:   	xorcc	%l6, %l6, %o3
	.word	0x92e58017	! t0_kref+0x1c2c:   	subccc	%l6, %l7, %o1
	.word	0x98f5be39	! t0_kref+0x1c30:   	udivcc	%l6, -0x1c7, %o4
	sethi	%hi(2f), %o7
	.word	0xe40be060	! t0_kref+0x1c38:   	ldub	[%o7 + 0x60], %l2
	.word	0xa41ca00c	! t0_kref+0x1c3c:   	xor	%l2, 0xc, %l2
	.word	0xe42be060	! t0_kref+0x1c40:   	stb	%l2, [%o7 + 0x60]
	.word	0x81dbe060	! t0_kref+0x1c44:   	flush	%o7 + 0x60
	.word	0x113ed46f	! t0_kref+0x1c48:   	sethi	%hi(0xfb51bc00), %o0
	.word	0x920da8d6	! t0_kref+0x1c4c:   	and	%l6, 0x8d6, %o1
	.word	0x94d5a2cb	! t0_kref+0x1c50:   	umulcc	%l6, 0x2cb, %o2
	.word	0x9495c017	! t0_kref+0x1c54:   	orcc	%l7, %l7, %o2
	.word	0x97358016	! t0_kref+0x1c58:   	srl	%l6, %l6, %o3
	.word	0x81a18842	! t0_kref+0x1c5c:   	faddd	%f6, %f2, %f0
2:	.word	0x1b3b37a7	! t0_kref+0x1c60:   	sethi	%hi(0xecde9c00), %o5
	.word	0xfdee101c	! t0_kref+0x1c64:   	prefetcha	%i0 + %i4, 30
	.word	0x98d58016	! t0_kref+0x1c68:   	umulcc	%l6, %l6, %o4
	.word	0x905dbcc5	! t0_kref+0x1c6c:   	smul	%l6, -0x33b, %o0
	.word	0x89a009a5	! t0_kref+0x1c70:   	fdivs	%f0, %f5, %f4
	.word	0x85a088c8	! t0_kref+0x1c74:   	fsubd	%f2, %f8, %f2
	.word	0x93a00025	! t0_kref+0x1c78:   	fmovs	%f5, %f9
	.word	0xc16e3fe0	! t0_kref+0x1c7c:   	prefetch	%i0 - 0x20, 0
	.word	0x83a018c6	! t0_kref+0x1c80:   	fdtos	%f6, %f1
	sethi	%hi(2f), %o7
	.word	0xe40be098	! t0_kref+0x1c88:   	ldub	[%o7 + 0x98], %l2
	.word	0xa41ca00c	! t0_kref+0x1c8c:   	xor	%l2, 0xc, %l2
	.word	0xe42be098	! t0_kref+0x1c90:   	stb	%l2, [%o7 + 0x98]
	.word	0x81dbe098	! t0_kref+0x1c94:   	flush	%o7 + 0x98
2:	.word	0xa0d5adc4	! t0_kref+0x1c98:   	umulcc	%l6, 0xdc4, %l0
	.word	0x83a000a5	! t0_kref+0x1c9c:   	fnegs	%f5, %f1
	.word	0x9af5f58f	! t0_kref+0x1ca0:   	udivcc	%l7, -0xa71, %o5
	.word	0x98358016	! t0_kref+0x1ca4:   	orn	%l6, %l6, %o4
	.word	0x001fffff	! t0_kref+0x1ca8:   	illtrap	0x1fffff
	.word	0x21800006	! t0_kref+0x1cac:   	fbn,a	_kref+0x1cc4
	.word	0xd810a006	! t0_kref+0x1cb0:   	lduh	[%g2 + 6], %o4
	.word	0x9aadc016	! t0_kref+0x1cb4:   	andncc	%l7, %l6, %o5
	.word	0x9125edb6	! t0_kref+0x1cb8:   	mulscc	%l7, 0xdb6, %o0
	.word	0x8fa189a7	! t0_kref+0x1cbc:   	fdivs	%f6, %f7, %f7
	.word	0x9095c016	! t0_kref+0x1cc0:   	orcc	%l7, %l6, %o0
	.word	0xdac6501c	! t0_kref+0x1cc4:   	ldswa	[%i1 + %i4]0x80, %o5
	.word	0xe5ee501a	! t0_kref+0x1cc8:   	prefetcha	%i1 + %i2, 18
	.word	0x86102010	! t0_kref+0x1ccc:   	mov	0x10, %g3
	.word	0x86a0e001	! t0_kref+0x1cd0:   	subcc	%g3, 1, %g3
	.word	0x22800008	! t0_kref+0x1cd4:   	be,a	_kref+0x1cf4
	.word	0xc1be7ffa	! t0_kref+0x1cd8:   	stda	%f0, [%i1 - 6]%asi
!	.word	0x294fb8c9	! t0_kref+0x1cdc:   	fbl,a,pt	%fcc0, SYM(t0_subr1)
	   	fbl,a,pt	%fcc0, SYM(t0_subr1)
	.word	0x9f414000	! t0_kref+0x1ce0:   	mov	%pc, %o7
	.word	0x94d5b283	! t0_kref+0x1ce4:   	umulcc	%l6, -0xd7d, %o2
	.word	0x8ba000a5	! t0_kref+0x1ce8:   	fnegs	%f5, %f5
	.word	0x9065c017	! t0_kref+0x1cec:   	subc	%l7, %l7, %o0
	.word	0x96bd8017	! t0_kref+0x1cf0:   	xnorcc	%l6, %l7, %o3
	.word	0xec28a01c	! t0_kref+0x1cf4:   	stb	%l6, [%g2 + 0x1c]
	.word	0xc7ee1016	! t0_kref+0x1cf8:   	prefetcha	%i0 + %l6, 3
	.word	0x9f35e016	! t0_kref+0x1cfc:   	srl	%l7, 0x16, %o7
	.word	0xec363fe6	! t0_kref+0x1d00:   	sth	%l6, [%i0 - 0x1a]
	.word	0xcd200019	! t0_kref+0x1d04:   	st	%f6, [%g0 + %i1]
	.word	0x21800001	! t0_kref+0x1d08:   	fbn,a	_kref+0x1d0c
	.word	0x81a01929	! t0_kref+0x1d0c:   	fstod	%f9, %f0
	.word	0x93a249a3	! t0_kref+0x1d10:   	fdivs	%f9, %f3, %f9
	.word	0xf9ee501b	! t0_kref+0x1d14:   	prefetcha	%i1 + %i3, 28
	.word	0x90d5e33e	! t0_kref+0x1d18:   	umulcc	%l7, 0x33e, %o0
	.word	0xd100a034	! t0_kref+0x1d1c:   	ld	[%g2 + 0x34], %f8
	.word	0x81358017	! t0_kref+0x1d20:   	srl	%l6, %l7, %g0
	.word	0xc11fbef8	! t0_kref+0x1d24:   	ldd	[%fp - 0x108], %f0
	.word	0xc1be5856	! t0_kref+0x1d28:   	stda	%f0, [%i1 + %l6]0xc2
	.word	0x9645c016	! t0_kref+0x1d2c:   	addc	%l7, %l6, %o3
	.word	0x8ba00021	! t0_kref+0x1d30:   	fmovs	%f1, %f5
	.word	0x86102015	! t0_kref+0x1d34:   	mov	0x15, %g3
	.word	0x86a0e001	! t0_kref+0x1d38:   	subcc	%g3, 1, %g3
	.word	0x22800011	! t0_kref+0x1d3c:   	be,a	_kref+0x1d80
	.word	0x83a000a4	! t0_kref+0x1d40:   	fnegs	%f4, %f1
	.word	0xd840a008	! t0_kref+0x1d44:   	ldsw	[%g2 + 8], %o4
	.word	0x94f58016	! t0_kref+0x1d48:   	udivcc	%l6, %l6, %o2
	.word	0x8d85c017	! t0_kref+0x1d4c:   	wr	%l7, %l7, %fprs
	.word	0x92d5c017	! t0_kref+0x1d50:   	umulcc	%l7, %l7, %o1
	.word	0xee30a032	! t0_kref+0x1d54:   	sth	%l7, [%g2 + 0x32]
	.word	0x8143c000	! t0_kref+0x1d58:   	stbar
	.word	0x8da00024	! t0_kref+0x1d5c:   	fmovs	%f4, %f6
	.word	0x9ee5e667	! t0_kref+0x1d60:   	subccc	%l7, 0x667, %o7
	.word	0x90f58016	! t0_kref+0x1d64:   	udivcc	%l6, %l6, %o0
	.word	0x8da01923	! t0_kref+0x1d68:   	fstod	%f3, %f6
	.word	0xda167ffc	! t0_kref+0x1d6c:   	lduh	[%i1 - 4], %o5
	.word	0x913d8017	! t0_kref+0x1d70:   	sra	%l6, %l7, %o0
	.word	0x87a01a20	! t0_kref+0x1d74:   	fstoi	%f0, %f3
	.word	0xde40a038	! t0_kref+0x1d78:   	ldsw	[%g2 + 0x38], %o7
	.word	0x9925b51f	! t0_kref+0x1d7c:   	mulscc	%l6, -0xae1, %o4
	.word	0x81a008c6	! t0_kref+0x1d80:   	fsubd	%f0, %f6, %f0
	.word	0x98a5e2bc	! t0_kref+0x1d84:   	subcc	%l7, 0x2bc, %o4
	.word	0x91a01888	! t0_kref+0x1d88:   	fitos	%f8, %f8
	.word	0x87a01a27	! t0_kref+0x1d8c:   	fstoi	%f7, %f3
	.word	0x96e5b91c	! t0_kref+0x1d90:   	subccc	%l6, -0x6e4, %o3
	.word	0x9275e286	! t0_kref+0x1d94:   	udiv	%l7, 0x286, %o1
	.word	0x91400000	! t0_kref+0x1d98:   	mov	%y, %o0
	.word	0xd60e4000	! t0_kref+0x1d9c:   	ldub	[%i1], %o3
	.word	0x9495c017	! t0_kref+0x1da0:   	orcc	%l7, %l7, %o2
	.word	0xecae9019	! t0_kref+0x1da4:   	stba	%l6, [%i2 + %i1]0x80
	.word	0xf96e6018	! t0_kref+0x1da8:   	prefetch	%i1 + 0x18, 28
	.word	0x85a188c0	! t0_kref+0x1dac:   	fsubd	%f6, %f0, %f2
	.word	0x8143c000	! t0_kref+0x1db0:   	stbar
	.word	0x98058016	! t0_kref+0x1db4:   	add	%l6, %l6, %o4
	.word	0x809dc017	! t0_kref+0x1db8:   	xorcc	%l7, %l7, %g0
	.word	0xeb6e401a	! t0_kref+0x1dbc:   	prefetch	%i1 + %i2, 21
	.word	0x87a149a8	! t0_kref+0x1dc0:   	fdivs	%f5, %f8, %f3
	.word	0x8da20842	! t0_kref+0x1dc4:   	faddd	%f8, %f2, %f6
	.word	0x91a14d28	! t0_kref+0x1dc8:   	fsmuld	%f5, %f8, %f8
	.word	0x80f58016	! t0_kref+0x1dcc:   	udivcc	%l6, %l6, %g0
	.word	0xd6780018	! t0_kref+0x1dd0:   	swap	[%g0 + %i0], %o3
	.word	0x9fc10000	! t0_kref+0x1dd4:   	call	%g4
	.word	0x8da20842	! t0_kref+0x1dd8:   	faddd	%f8, %f2, %f6
	.word	0xec263ff8	! t0_kref+0x1ddc:   	st	%l6, [%i0 - 8]
	.word	0x99418000	! t0_kref+0x1de0:   	mov	%fprs, %o4
	.word	0xd4070018	! t0_kref+0x1de4:   	ld	[%i4 + %i0], %o2
	.word	0x81d82116	! t0_kref+0x1de8:   	flush	%g0 + 0x116
	.word	0x96bdc016	! t0_kref+0x1dec:   	xnorcc	%l7, %l6, %o3
	.word	0x81a01927	! t0_kref+0x1df0:   	fstod	%f7, %f0
	.word	0xd24e7ffc	! t0_kref+0x1df4:   	ldsb	[%i1 - 4], %o1
	.word	0x8fa000a9	! t0_kref+0x1df8:   	fnegs	%f9, %f7
	.word	0xcf267fe0	! t0_kref+0x1dfc:   	st	%f7, [%i1 - 0x20]
	.word	0xc12e001c	! t0_kref+0x1e00:   	st	%fsr, [%i0 + %i4]
	.word	0x81a208c6	! t0_kref+0x1e04:   	fsubd	%f8, %f6, %f0
	.word	0x3d800005	! t0_kref+0x1e08:   	fbule,a	_kref+0x1e1c
	.word	0x9695c016	! t0_kref+0x1e0c:   	orcc	%l7, %l6, %o3
	.word	0x96a58016	! t0_kref+0x1e10:   	subcc	%l6, %l6, %o3
	.word	0x90dda908	! t0_kref+0x1e14:   	smulcc	%l6, 0x908, %o0
	.word	0xecf01018	! t0_kref+0x1e18:   	stxa	%l6, [%g0 + %i0]0x80
	.word	0xc93f4018	! t0_kref+0x1e1c:   	std	%f4, [%i5 + %i0]
	.word	0xd24e4000	! t0_kref+0x1e20:   	ldsb	[%i1], %o1
	.word	0xebf65016	! t0_kref+0x1e24:   	casxa	[%i1]0x80, %l6, %l5
	.word	0xd0df5018	! t0_kref+0x1e28:   	ldxa	[%i5 + %i0]0x80, %o0
	.word	0x9fc10000	! t0_kref+0x1e2c:   	call	%g4
	.word	0x8ba01880	! t0_kref+0x1e30:   	fitos	%f0, %f5
	.word	0x92a5a9eb	! t0_kref+0x1e34:   	subcc	%l6, 0x9eb, %o1
	.word	0x9e1dc016	! t0_kref+0x1e38:   	xor	%l7, %l6, %o7
	.word	0xc568a043	! t0_kref+0x1e3c:   	prefetch	%g2 + 0x43, 2
	.word	0xc51fbe48	! t0_kref+0x1e40:   	ldd	[%fp - 0x1b8], %f2
	.word	0x960d8016	! t0_kref+0x1e44:   	and	%l6, %l6, %o3
	.word	0x81a089a0	! t0_kref+0x1e48:   	fdivs	%f2, %f0, %f0
	.word	0x909dbf2d	! t0_kref+0x1e4c:   	xorcc	%l6, -0xd3, %o0
	.word	0x89a20848	! t0_kref+0x1e50:   	faddd	%f8, %f8, %f4
	.word	0xc900a01c	! t0_kref+0x1e54:   	ld	[%g2 + 0x1c], %f4
	.word	0x81aa4a27	! t0_kref+0x1e58:   	fcmps	%fcc0, %f9, %f7
	.word	0x8da108c0	! t0_kref+0x1e5c:   	fsubd	%f4, %f0, %f6
	.word	0xd84e8018	! t0_kref+0x1e60:   	ldsb	[%i2 + %i0], %o4
	.word	0x89a10946	! t0_kref+0x1e64:   	fmuld	%f4, %f6, %f4
	.word	0x92f5b204	! t0_kref+0x1e68:   	udivcc	%l6, -0xdfc, %o1
	.word	0x91a00844	! t0_kref+0x1e6c:   	faddd	%f0, %f4, %f8
	.word	0x8da00020	! t0_kref+0x1e70:   	fmovs	%f0, %f6
	.word	0x90258017	! t0_kref+0x1e74:   	sub	%l6, %l7, %o0
	.word	0x81a84a28	! t0_kref+0x1e78:   	fcmps	%fcc0, %f1, %f8
	.word	0xe7f61016	! t0_kref+0x1e7c:   	casxa	[%i0]0x80, %l6, %l3
	.word	0x85a000a0	! t0_kref+0x1e80:   	fnegs	%f0, %f2
	.word	0x813de01c	! t0_kref+0x1e84:   	sra	%l7, 0x1c, %g0
	.word	0x33800003	! t0_kref+0x1e88:   	fbe,a	_kref+0x1e94
	.word	0x96dde27f	! t0_kref+0x1e8c:   	smulcc	%l7, 0x27f, %o3
	.word	0xd8981019	! t0_kref+0x1e90:   	ldda	[%g0 + %i1]0x80, %o4
	.word	0x9eb5efca	! t0_kref+0x1e94:   	orncc	%l7, 0xfca, %o7
	.word	0xf96e3fe8	! t0_kref+0x1e98:   	prefetch	%i0 - 0x18, 28
	.word	0xc568a00f	! t0_kref+0x1e9c:   	prefetch	%g2 + 0xf, 2
	.word	0x9a55c017	! t0_kref+0x1ea0:   	umul	%l7, %l7, %o5
	.word	0x8ba01887	! t0_kref+0x1ea4:   	fitos	%f7, %f5
	.word	0x8da00025	! t0_kref+0x1ea8:   	fmovs	%f5, %f6
	call	1f
	.empty
	.word	0xc53e4000	! t0_kref+0x1eb0:   	std	%f2, [%i1]
	.word	0x9ea58017	! t0_kref+0x1eb4:   	subcc	%l6, %l7, %o7
	.word	0xee36201a	! t0_kref+0x1eb8:   	sth	%l7, [%i0 + 0x1a]
	.word	0x89a01905	! t0_kref+0x1ebc:   	fitod	%f5, %f4
	.word	0x9ebd8016	! t0_kref+0x1ec0:   	xnorcc	%l6, %l6, %o7
	.word	0x98adef4e	! t0_kref+0x1ec4:   	andncc	%l7, 0xf4e, %o4
1:	.word	0x86102004	! t0_kref+0x1ec8:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x1ecc:   	bne,a	_kref+0x1ecc
	.word	0x86a0e001	! t0_kref+0x1ed0:   	subcc	%g3, 1, %g3
	.word	0x93a01880	! t0_kref+0x1ed4:   	fitos	%f0, %f9
	.word	0xe16e401a	! t0_kref+0x1ed8:   	prefetch	%i1 + %i2, 16
	.word	0x8045b97d	! t0_kref+0x1edc:   	addc	%l6, -0x683, %g0
	.word	0x91a088c6	! t0_kref+0x1ee0:   	fsubd	%f2, %f6, %f8
	.word	0x93a000a2	! t0_kref+0x1ee4:   	fnegs	%f2, %f9
	.word	0x91a018c8	! t0_kref+0x1ee8:   	fdtos	%f8, %f8
	.word	0x9af5f633	! t0_kref+0x1eec:   	udivcc	%l7, -0x9cd, %o5
	.word	0xec36600e	! t0_kref+0x1ef0:   	sth	%l6, [%i1 + 0xe]
	.word	0xc19e2010	! t0_kref+0x1ef4:   	ldda	[%i0 + 0x10]%asi, %f0
	.word	0xee270019	! t0_kref+0x1ef8:   	st	%l7, [%i4 + %i1]
	.word	0x98c58016	! t0_kref+0x1efc:   	addccc	%l6, %l6, %o4
	.word	0xc7a01018	! t0_kref+0x1f00:   	sta	%f3, [%g0 + %i0]0x80
	.word	0x8ba00027	! t0_kref+0x1f04:   	fmovs	%f7, %f5
	.word	0x9265bcfb	! t0_kref+0x1f08:   	subc	%l6, -0x305, %o1
	.word	0x81a08842	! t0_kref+0x1f0c:   	faddd	%f2, %f2, %f0
	.word	0x8143c000	! t0_kref+0x1f10:   	stbar
	.word	0x98958017	! t0_kref+0x1f14:   	orcc	%l6, %l7, %o4
	.word	0xd0480018	! t0_kref+0x1f18:   	ldsb	[%g0 + %i0], %o0
	.word	0x945d8016	! t0_kref+0x1f1c:   	smul	%l6, %l6, %o2
	.word	0x25800006	! t0_kref+0x1f20:   	fblg,a	_kref+0x1f38
	.word	0x8da109c0	! t0_kref+0x1f24:   	fdivd	%f4, %f0, %f6
	.word	0xcf200018	! t0_kref+0x1f28:   	st	%f7, [%g0 + %i0]
	.word	0x92058017	! t0_kref+0x1f2c:   	add	%l6, %l7, %o1
	.word	0x93a000a1	! t0_kref+0x1f30:   	fnegs	%f1, %f9
	.word	0xd210a01e	! t0_kref+0x1f34:   	lduh	[%g2 + 0x1e], %o1
	.word	0x91a01907	! t0_kref+0x1f38:   	fitod	%f7, %f8
	.word	0x89a189c4	! t0_kref+0x1f3c:   	fdivd	%f6, %f4, %f4
	.word	0x81a8ca24	! t0_kref+0x1f40:   	fcmps	%fcc0, %f3, %f4
	.word	0xc320a024	! t0_kref+0x1f44:   	st	%f1, [%g2 + 0x24]
	.word	0xc807bfe8	! t0_kref+0x1f48:   	ld	[%fp - 0x18], %g4
	.word	0x87a01886	! t0_kref+0x1f4c:   	fitos	%f6, %f3
	.word	0x131aab63	! t0_kref+0x1f50:   	sethi	%hi(0x6aad8c00), %o1
	.word	0x81a90aa1	! t0_kref+0x1f54:   	fcmpes	%fcc0, %f4, %f1
	.word	0x9ac5b838	! t0_kref+0x1f58:   	addccc	%l6, -0x7c8, %o5
	.word	0xcf260000	! t0_kref+0x1f5c:   	st	%f7, [%i0]
	.word	0x3d800008	! t0_kref+0x1f60:   	fbule,a	_kref+0x1f80
	.word	0x83a01a26	! t0_kref+0x1f64:   	fstoi	%f6, %f1
	.word	0x81a01929	! t0_kref+0x1f68:   	fstod	%f9, %f0
	.word	0x81da400f	! t0_kref+0x1f6c:   	flush	%o1 + %o7
	.word	0x98a5b2f5	! t0_kref+0x1f70:   	subcc	%l6, -0xd0b, %o4
	.word	0x9115be3f	! t0_kref+0x1f74:   	taddcctv	%l6, -0x1c1, %o0
	.word	0xd11fbcc8	! t0_kref+0x1f78:   	ldd	[%fp - 0x338], %f8
	.word	0x90f58016	! t0_kref+0x1f7c:   	udivcc	%l6, %l6, %o0
	.word	0xef68a001	! t0_kref+0x1f80:   	prefetch	%g2 + 1, 23
	.word	0x8005efd5	! t0_kref+0x1f84:   	add	%l7, 0xfd5, %g0
	.word	0xd83e001d	! t0_kref+0x1f88:   	std	%o4, [%i0 + %i5]
	.word	0x89a10844	! t0_kref+0x1f8c:   	faddd	%f4, %f4, %f4
	.word	0x8da000c2	! t0_kref+0x1f90:   	fnegd	%f2, %f6
	.word	0x9e45a22d	! t0_kref+0x1f94:   	addc	%l6, 0x22d, %o7
	.word	0x80a5c016	! t0_kref+0x1f98:   	cmp	%l7, %l6
	.word	0x9ac58016	! t0_kref+0x1f9c:   	addccc	%l6, %l6, %o5
	.word	0x8143e040	! t0_kref+0x1fa0:   	membar	0x40
	.word	0x92d5fda7	! t0_kref+0x1fa4:   	umulcc	%l7, -0x259, %o1
	.word	0x9b400000	! t0_kref+0x1fa8:   	mov	%y, %o5
	.word	0x9a8d8017	! t0_kref+0x1fac:   	andcc	%l6, %l7, %o5
	.word	0xd1b81018	! t0_kref+0x1fb0:   	stda	%f8, [%g0 + %i0]0x80
	.word	0xd8064000	! t0_kref+0x1fb4:   	ld	[%i1], %o4
	.word	0x81a24d26	! t0_kref+0x1fb8:   	fsmuld	%f9, %f6, %f0
	.word	0xd0100018	! t0_kref+0x1fbc:   	lduh	[%g0 + %i0], %o0
	.word	0x9addf8ad	! t0_kref+0x1fc0:   	smulcc	%l7, -0x753, %o5
	.word	0x83a018c4	! t0_kref+0x1fc4:   	fdtos	%f4, %f1
	.word	0xc568a080	! t0_kref+0x1fc8:   	prefetch	%g2 + 0x80, 2
	.word	0x98f5c017	! t0_kref+0x1fcc:   	udivcc	%l7, %l7, %o4
	.word	0x28480007	! t0_kref+0x1fd0:   	bleu,a,pt	%icc, _kref+0x1fec
	.word	0x8da24d27	! t0_kref+0x1fd4:   	fsmuld	%f9, %f7, %f6
	.word	0xee362002	! t0_kref+0x1fd8:   	sth	%l7, [%i0 + 2]
	.word	0xe27e4000	! t0_kref+0x1fdc:   	swap	[%i1], %l1
	.word	0xc1200018	! t0_kref+0x1fe0:   	st	%f0, [%g0 + %i0]
	.word	0x960da167	! t0_kref+0x1fe4:   	and	%l6, 0x167, %o3
	.word	0xcb26001c	! t0_kref+0x1fe8:   	st	%f5, [%i0 + %i4]
	.word	0x8ba01a28	! t0_kref+0x1fec:   	fstoi	%f8, %f5
	.word	0x8da10944	! t0_kref+0x1ff0:   	fmuld	%f4, %f4, %f6
	.word	0x8fa018c2	! t0_kref+0x1ff4:   	fdtos	%f2, %f7
	.word	0xc008a00f	! t0_kref+0x1ff8:   	ldub	[%g2 + 0xf], %g0
	.word	0xeeae5000	! t0_kref+0x1ffc:   	stba	%l7, [%i1]0x80
	.word	0x980d8016	! t0_kref+0x2000:   	and	%l6, %l6, %o4
	.word	0x920de1e9	! t0_kref+0x2004:   	and	%l7, 0x1e9, %o1
	.word	0x809d8017	! t0_kref+0x2008:   	xorcc	%l6, %l7, %g0
	.word	0xe89e101d	! t0_kref+0x200c:   	ldda	[%i0 + %i5]0x80, %l4
	.word	0x81a88a24	! t0_kref+0x2010:   	fcmps	%fcc0, %f2, %f4
	.word	0x81a88a42	! t0_kref+0x2014:   	fcmpd	%fcc0, %f2, %f2
	.word	0x9045c017	! t0_kref+0x2018:   	addc	%l7, %l7, %o0
	.word	0x91a018c2	! t0_kref+0x201c:   	fdtos	%f2, %f8
	.word	0x89a089a7	! t0_kref+0x2020:   	fdivs	%f2, %f7, %f4
	.word	0xc0d01018	! t0_kref+0x2024:   	ldsha	[%g0 + %i0]0x80, %g0
	.word	0x81a98aa9	! t0_kref+0x2028:   	fcmpes	%fcc0, %f6, %f9
	.word	0xcf270018	! t0_kref+0x202c:   	st	%f7, [%i4 + %i0]
	.word	0xe9ee101d	! t0_kref+0x2030:   	prefetcha	%i0 + %i5, 20
	.word	0x91a088c6	! t0_kref+0x2034:   	fsubd	%f2, %f6, %f8
	.word	0x8143c000	! t0_kref+0x2038:   	stbar
	.word	0x9fc00004	! t0_kref+0x203c:   	call	%g0 + %g4
	.word	0xd0380018	! t0_kref+0x2040:   	std	%o0, [%g0 + %i0]
	.word	0x87a01a28	! t0_kref+0x2044:   	fstoi	%f8, %f3
	.word	0x9095bf26	! t0_kref+0x2048:   	orcc	%l6, -0xda, %o0
	.word	0x8fa01a42	! t0_kref+0x204c:   	fdtoi	%f2, %f7
	.word	0x81aa4aa3	! t0_kref+0x2050:   	fcmpes	%fcc0, %f9, %f3
	.word	0xfbee501c	! t0_kref+0x2054:   	prefetcha	%i1 + %i4, 29
	.word	0xda166018	! t0_kref+0x2058:   	lduh	[%i1 + 0x18], %o5
	.word	0x89a000a6	! t0_kref+0x205c:   	fnegs	%f6, %f4
	.word	0xeb68a08c	! t0_kref+0x2060:   	prefetch	%g2 + 0x8c, 21
	.word	0x81a109c8	! t0_kref+0x2064:   	fdivd	%f4, %f8, %f0
	.word	0xee20a014	! t0_kref+0x2068:   	st	%l7, [%g2 + 0x14]
	.word	0x993de010	! t0_kref+0x206c:   	sra	%l7, 0x10, %o4
	.word	0x2b800003	! t0_kref+0x2070:   	fbug,a	_kref+0x207c
	.word	0xc91fbf60	! t0_kref+0x2074:   	ldd	[%fp - 0xa0], %f4
	.word	0x9a958016	! t0_kref+0x2078:   	orcc	%l6, %l6, %o5
	.word	0x87a01a46	! t0_kref+0x207c:   	fdtoi	%f6, %f3
	.word	0x9445ee26	! t0_kref+0x2080:   	addc	%l7, 0xe26, %o2
	.word	0x8da00142	! t0_kref+0x2084:   	fabsd	%f2, %f6
	.word	0xee20a014	! t0_kref+0x2088:   	st	%l7, [%g2 + 0x14]
	.word	0x94a58016	! t0_kref+0x208c:   	subcc	%l6, %l6, %o2
	.word	0x90bdc017	! t0_kref+0x2090:   	xnorcc	%l7, %l7, %o0
	.word	0x27800002	! t0_kref+0x2094:   	fbul,a	_kref+0x209c
	.word	0xc91fbc50	! t0_kref+0x2098:   	ldd	[%fp - 0x3b0], %f4
	.word	0x96f58017	! t0_kref+0x209c:   	udivcc	%l6, %l7, %o3
	.word	0x81aa4a28	! t0_kref+0x20a0:   	fcmps	%fcc0, %f9, %f8
	.word	0x8da109c8	! t0_kref+0x20a4:   	fdivd	%f4, %f8, %f6
	.word	0x81a88a21	! t0_kref+0x20a8:   	fcmps	%fcc0, %f2, %f1
	.word	0xc59f5019	! t0_kref+0x20ac:   	ldda	[%i5 + %i1]0x80, %f2
	.word	0xc1ee5017	! t0_kref+0x20b0:   	prefetcha	%i1 + %l7, 0
	.word	0x92a5b945	! t0_kref+0x20b4:   	subcc	%l6, -0x6bb, %o1
	.word	0x8ba000a0	! t0_kref+0x20b8:   	fnegs	%f0, %f5
	.word	0x81a9ca21	! t0_kref+0x20bc:   	fcmps	%fcc0, %f7, %f1
	.word	0xc99f5018	! t0_kref+0x20c0:   	ldda	[%i5 + %i0]0x80, %f4
	.word	0x85a01900	! t0_kref+0x20c4:   	fitod	%f0, %f2
	.word	0x91a01a23	! t0_kref+0x20c8:   	fstoi	%f3, %f8
	.word	0xd1be1816	! t0_kref+0x20cc:   	stda	%f8, [%i0 + %l6]0xc0
	.word	0x23800002	! t0_kref+0x20d0:   	fbne,a	_kref+0x20d8
	.word	0x89a01922	! t0_kref+0x20d4:   	fstod	%f2, %f4
	.word	0x80f5e213	! t0_kref+0x20d8:   	udivcc	%l7, 0x213, %g0
	.word	0x9f3de004	! t0_kref+0x20dc:   	sra	%l7, 0x4, %o7
	.word	0x98458016	! t0_kref+0x20e0:   	addc	%l6, %l6, %o4
	.word	0xd048a025	! t0_kref+0x20e4:   	ldsb	[%g2 + 0x25], %o0
	.word	0x89a008c0	! t0_kref+0x20e8:   	fsubd	%f0, %f0, %f4
	.word	0x89a1c9a0	! t0_kref+0x20ec:   	fdivs	%f7, %f0, %f4
	.word	0x81a01900	! t0_kref+0x20f0:   	fitod	%f0, %f0
	.word	0xf5ee501b	! t0_kref+0x20f4:   	prefetcha	%i1 + %i3, 26
	.word	0x8005eef6	! t0_kref+0x20f8:   	add	%l7, 0xef6, %g0
	.word	0xe01e7fe0	! t0_kref+0x20fc:   	ldd	[%i1 - 0x20], %l0
	.word	0xecb01018	! t0_kref+0x2100:   	stha	%l6, [%g0 + %i0]0x80
	.word	0xee7e7fe0	! t0_kref+0x2104:   	swap	[%i1 - 0x20], %l7
	.word	0x8075a95c	! t0_kref+0x2108:   	udiv	%l6, 0x95c, %g0
	.word	0x94d58016	! t0_kref+0x210c:   	umulcc	%l6, %l6, %o2
	.word	0xd03e2000	! t0_kref+0x2110:   	std	%o0, [%i0]
	.word	0x9465fe0b	! t0_kref+0x2114:   	subc	%l7, -0x1f5, %o2
	.word	0x948da805	! t0_kref+0x2118:   	andcc	%l6, 0x805, %o2
	.word	0x8da00840	! t0_kref+0x211c:   	faddd	%f0, %f0, %f6
	.word	0x990dc017	! t0_kref+0x2120:   	tsubcc	%l7, %l7, %o4
	.word	0xe01e401d	! t0_kref+0x2124:   	ldd	[%i1 + %i5], %l0
	.word	0xc11fbf60	! t0_kref+0x2128:   	ldd	[%fp - 0xa0], %f0
	.word	0xd13e6000	! t0_kref+0x212c:   	std	%f8, [%i1]
	.word	0x93a00026	! t0_kref+0x2130:   	fmovs	%f6, %f9
	.word	0xee262018	! t0_kref+0x2134:   	st	%l7, [%i0 + 0x18]
	.word	0x2b800004	! t0_kref+0x2138:   	fbug,a	_kref+0x2148
	.word	0x9415c017	! t0_kref+0x213c:   	or	%l7, %l7, %o2
	.word	0x9eddb27c	! t0_kref+0x2140:   	smulcc	%l6, -0xd84, %o7
	.word	0x81a088c4	! t0_kref+0x2144:   	fsubd	%f2, %f4, %f0
	.word	0x9045e145	! t0_kref+0x2148:   	addc	%l7, 0x145, %o0
	.word	0xee2e8018	! t0_kref+0x214c:   	stb	%l7, [%i2 + %i0]
	.word	0xc0500018	! t0_kref+0x2150:   	ldsh	[%g0 + %i0], %g0
	.word	0xc1be5856	! t0_kref+0x2154:   	stda	%f0, [%i1 + %l6]0xc2
	.word	0xe83e3fe0	! t0_kref+0x2158:   	std	%l4, [%i0 - 0x20]
	.word	0xec3f4018	! t0_kref+0x215c:   	std	%l6, [%i5 + %i0]
	.word	0x90e5f63d	! t0_kref+0x2160:   	subccc	%l7, -0x9c3, %o0
	.word	0xda6e8019	! t0_kref+0x2164:   	ldstub	[%i2 + %i1], %o5
	.word	0x9465c017	! t0_kref+0x2168:   	subc	%l7, %l7, %o2
	.word	0x91a000a5	! t0_kref+0x216c:   	fnegs	%f5, %f8
	.word	0x25800004	! t0_kref+0x2170:   	fblg,a	_kref+0x2180
	.word	0x80b58016	! t0_kref+0x2174:   	orncc	%l6, %l6, %g0
	.word	0x8ba01880	! t0_kref+0x2178:   	fitos	%f0, %f5
	.word	0x89a18d26	! t0_kref+0x217c:   	fsmuld	%f6, %f6, %f4
	.word	0xcb26001c	! t0_kref+0x2180:   	st	%f5, [%i0 + %i4]
	.word	0x91a01a26	! t0_kref+0x2184:   	fstoi	%f6, %f8
	.word	0x9ea5b297	! t0_kref+0x2188:   	subcc	%l6, -0xd69, %o7
	.word	0x9895c017	! t0_kref+0x218c:   	orcc	%l7, %l7, %o4
	.word	0xc1bf1a19	! t0_kref+0x2190:   	stda	%f0, [%i4 + %i1]0xd0
	.word	0x9fc00004	! t0_kref+0x2194:   	call	%g0 + %g4
	.word	0xd26e6016	! t0_kref+0x2198:   	ldstub	[%i1 + 0x16], %o1
	.word	0x91a18940	! t0_kref+0x219c:   	fmuld	%f6, %f0, %f8
	.word	0x90bdb457	! t0_kref+0x21a0:   	xnorcc	%l6, -0xba9, %o0
	.word	0x92bdc017	! t0_kref+0x21a4:   	xnorcc	%l7, %l7, %o1
	.word	0xc5063ffc	! t0_kref+0x21a8:   	ld	[%i0 - 4], %f2
	.word	0x85a01027	! t0_kref+0x21ac:   	fstox	%f7, %f2
	.word	0xd2163fe4	! t0_kref+0x21b0:   	lduh	[%i0 - 0x1c], %o1
	.word	0x9f35c016	! t0_kref+0x21b4:   	srl	%l7, %l6, %o7
	.word	0xc11fbe18	! t0_kref+0x21b8:   	ldd	[%fp - 0x1e8], %f0
	.word	0x900d8017	! t0_kref+0x21bc:   	and	%l6, %l7, %o0
	.word	0x81a00026	! t0_kref+0x21c0:   	fmovs	%f6, %f0
	.word	0xc5380019	! t0_kref+0x21c4:   	std	%f2, [%g0 + %i1]
	.word	0x89a089c8	! t0_kref+0x21c8:   	fdivd	%f2, %f8, %f4
	.word	0xf207bfe0	! t0_kref+0x21cc:   	ld	[%fp - 0x20], %i1
	.word	0x81a9ca26	! t0_kref+0x21d0:   	fcmps	%fcc0, %f7, %f6
	.word	0x9ab5c017	! t0_kref+0x21d4:   	orncc	%l7, %l7, %o5
	.word	0x98a58016	! t0_kref+0x21d8:   	subcc	%l6, %l6, %o4
	.word	0x86102003	! t0_kref+0x21dc:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x21e0:   	bne,a	_kref+0x21e0
	.word	0x86a0e001	! t0_kref+0x21e4:   	subcc	%g3, 1, %g3
	.word	0xed21608c	! t0_kref+0x21e8:   	st	%f22, [%g5 + 0x8c]
	.word	0x9895b637	! t0_kref+0x21ec:   	orcc	%l6, -0x9c9, %o4
	.word	0x80558016	! t0_kref+0x21f0:   	umul	%l6, %l6, %g0
	.word	0x81a88a44	! t0_kref+0x21f4:   	fcmpd	%fcc0, %f2, %f4
	.word	0x89a149a2	! t0_kref+0x21f8:   	fdivs	%f5, %f2, %f4
	.word	0xc06e8018	! t0_kref+0x21fc:   	ldstub	[%i2 + %i0], %g0
	.word	0x8095ff54	! t0_kref+0x2200:   	orcc	%l7, -0xac, %g0
	.word	0x81a00946	! t0_kref+0x2204:   	fmuld	%f0, %f6, %f0
	.word	0x92c58017	! t0_kref+0x2208:   	addccc	%l6, %l7, %o1
	.word	0x81dd4001	! t0_kref+0x220c:   	flush	%l5 + %g1
	.word	0x81deb3a6	! t0_kref+0x2210:   	flush	%i2 - 0xc5a
	.word	0x89a208a3	! t0_kref+0x2214:   	fsubs	%f8, %f3, %f4
	.word	0xec280019	! t0_kref+0x2218:   	stb	%l6, [%g0 + %i1]
	.word	0x98d5b028	! t0_kref+0x221c:   	umulcc	%l6, -0xfd8, %o4
	.word	0x8143c000	! t0_kref+0x2220:   	stbar
	.word	0x9ea5e664	! t0_kref+0x2224:   	subcc	%l7, 0x664, %o7
	.word	0x92f5a880	! t0_kref+0x2228:   	udivcc	%l6, 0x880, %o1
	.word	0xde16001b	! t0_kref+0x222c:   	lduh	[%i0 + %i3], %o7
	.word	0x973de005	! t0_kref+0x2230:   	sra	%l7, 0x5, %o3
	.word	0xc1a01019	! t0_kref+0x2234:   	sta	%f0, [%g0 + %i1]0x80
	.word	0xc51fbd00	! t0_kref+0x2238:   	ldd	[%fp - 0x300], %f2
	.word	0xec2e4000	! t0_kref+0x223c:   	stb	%l6, [%i1]
	.word	0x93a00024	! t0_kref+0x2240:   	fmovs	%f4, %f9
	.word	0x957034c0	! t0_kref+0x2244:   	popc	-0xb40, %o2
	.word	0xd640a024	! t0_kref+0x2248:   	ldsw	[%g2 + 0x24], %o3
	.word	0x81700017	! t0_kref+0x224c:   	popc	%l7, %g0
!	.word	0x2e4fb76c	! t0_kref+0x2250:   	bvs,a,pt	%icc, SYM(t0_subr1)
	   	bvs,a,pt	%icc, SYM(t0_subr1)
	.word	0x9f414000	! t0_kref+0x2254:   	mov	%pc, %o7
	.word	0x83a01a26	! t0_kref+0x2258:   	fstoi	%f6, %f1
	.word	0x8da00023	! t0_kref+0x225c:   	fmovs	%f3, %f6
	.word	0x90f5c016	! t0_kref+0x2260:   	udivcc	%l7, %l6, %o0
	.word	0x92f5c017	! t0_kref+0x2264:   	udivcc	%l7, %l7, %o1
	.word	0x8143c000	! t0_kref+0x2268:   	stbar
	.word	0x9a158017	! t0_kref+0x226c:   	or	%l6, %l7, %o5
	.word	0x85a18948	! t0_kref+0x2270:   	fmuld	%f6, %f8, %f2
	sethi	%hi(2f), %o7
	.word	0xe40be294	! t0_kref+0x2278:   	ldub	[%o7 + 0x294], %l2
	.word	0xa41ca00c	! t0_kref+0x227c:   	xor	%l2, 0xc, %l2
	.word	0xe42be294	! t0_kref+0x2280:   	stb	%l2, [%o7 + 0x294]
	.word	0x81dbe294	! t0_kref+0x2284:   	flush	%o7 + 0x294
	.word	0xd87e4000	! t0_kref+0x2288:   	swap	[%i1], %o4
	.word	0x81aa0aa1	! t0_kref+0x228c:   	fcmpes	%fcc0, %f8, %f1
	.word	0x81aa0aa7	! t0_kref+0x2290:   	fcmpes	%fcc0, %f8, %f7
2:	.word	0xec3e2018	! t0_kref+0x2294:   	std	%l6, [%i0 + 0x18]
	.word	0x81aa0a28	! t0_kref+0x2298:   	fcmps	%fcc0, %f8, %f8
	.word	0xd8062000	! t0_kref+0x229c:   	ld	[%i0], %o4
	.word	0x9845a849	! t0_kref+0x22a0:   	addc	%l6, 0x849, %o4
	.word	0xeb6e6000	! t0_kref+0x22a4:   	prefetch	%i1, 21
	.word	0x80a5e7dc	! t0_kref+0x22a8:   	cmp	%l7, 0x7dc
	.word	0xde40a000	! t0_kref+0x22ac:   	ldsw	[%g2], %o7
	.word	0x81dcc004	! t0_kref+0x22b0:   	flush	%l3 + %g4
	.word	0xc12e7fe4	! t0_kref+0x22b4:   	st	%fsr, [%i1 - 0x1c]
	call	SYM(t0_subr2)
	.word	0x91a20844	! t0_kref+0x22bc:   	faddd	%f8, %f4, %f8
	.word	0xeea6101c	! t0_kref+0x22c0:   	sta	%l7, [%i0 + %i4]0x80
	.word	0x8fa01a25	! t0_kref+0x22c4:   	fstoi	%f5, %f7
	.word	0x9ad5c016	! t0_kref+0x22c8:   	umulcc	%l7, %l6, %o5
	.word	0x83a000a9	! t0_kref+0x22cc:   	fnegs	%f9, %f1
	.word	0x81a98a27	! t0_kref+0x22d0:   	fcmps	%fcc0, %f6, %f7
	.word	0x9245b3ef	! t0_kref+0x22d4:   	addc	%l6, -0xc11, %o1
	.word	0xd250a00e	! t0_kref+0x22d8:   	ldsh	[%g2 + 0xe], %o1
	.word	0x9e958017	! t0_kref+0x22dc:   	orcc	%l6, %l7, %o7
	.word	0xec367fe8	! t0_kref+0x22e0:   	sth	%l6, [%i1 - 0x18]
	.word	0x80c5a10e	! t0_kref+0x22e4:   	addccc	%l6, 0x10e, %g0
	.word	0xc300a010	! t0_kref+0x22e8:   	ld	[%g2 + 0x10], %f1
	.word	0x92c5c016	! t0_kref+0x22ec:   	addccc	%l7, %l6, %o1
	.word	0xec20a000	! t0_kref+0x22f0:   	st	%l6, [%g2]
	.word	0x89a01886	! t0_kref+0x22f4:   	fitos	%f6, %f4
	.word	0xee30a008	! t0_kref+0x22f8:   	sth	%l7, [%g2 + 8]
	.word	0x81a88aa2	! t0_kref+0x22fc:   	fcmpes	%fcc0, %f2, %f2
	.word	0x89a00028	! t0_kref+0x2300:   	fmovs	%f8, %f4
	.word	0x9ed5fba1	! t0_kref+0x2304:   	umulcc	%l7, -0x45f, %o7
	.word	0x11060a1f	! t0_kref+0x2308:   	sethi	%hi(0x18287c00), %o0
	.word	0x961dc016	! t0_kref+0x230c:   	xor	%l7, %l6, %o3
	.word	0x9e05a7c7	! t0_kref+0x2310:   	add	%l6, 0x7c7, %o7
	.word	0x90e5fed6	! t0_kref+0x2314:   	subccc	%l7, -0x12a, %o0
	.word	0x8da01a22	! t0_kref+0x2318:   	fstoi	%f2, %f6
	.word	0x92ad8017	! t0_kref+0x231c:   	andncc	%l6, %l7, %o1
	.word	0x8ba018c4	! t0_kref+0x2320:   	fdtos	%f4, %f5
	.word	0x86102004	! t0_kref+0x2324:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x2328:   	bne,a	_kref+0x2328
	.word	0x86a0e001	! t0_kref+0x232c:   	subcc	%g3, 1, %g3
	.word	0xec26001c	! t0_kref+0x2330:   	st	%l6, [%i0 + %i4]
	.word	0x9f702f04	! t0_kref+0x2334:   	popc	0xf04, %o7
	.word	0x93a000a7	! t0_kref+0x2338:   	fnegs	%f7, %f9
	.word	0x91a00144	! t0_kref+0x233c:   	fabsd	%f4, %f8
	.word	0x96c58016	! t0_kref+0x2340:   	addccc	%l6, %l6, %o3
	.word	0x8da01a22	! t0_kref+0x2344:   	fstoi	%f2, %f6
	.word	0x960dc017	! t0_kref+0x2348:   	and	%l7, %l7, %o3
	.word	0xe66e3ff3	! t0_kref+0x234c:   	ldstub	[%i0 - 0xd], %l3
	.word	0x81aa4aa5	! t0_kref+0x2350:   	fcmpes	%fcc0, %f9, %f5
	.word	0xe26e3fef	! t0_kref+0x2354:   	ldstub	[%i0 - 0x11], %l1
	.word	0xedf65016	! t0_kref+0x2358:   	casxa	[%i1]0x80, %l6, %l6
	.word	0x98358017	! t0_kref+0x235c:   	orn	%l6, %l7, %o4
	.word	0x90458016	! t0_kref+0x2360:   	addc	%l6, %l6, %o0
	.word	0xc91e001d	! t0_kref+0x2364:   	ldd	[%i0 + %i5], %f4
	.word	0x81a18842	! t0_kref+0x2368:   	faddd	%f6, %f2, %f0
	.word	0xd0ee9018	! t0_kref+0x236c:   	ldstuba	[%i2 + %i0]0x80, %o0
	.word	0xe47e001c	! t0_kref+0x2370:   	swap	[%i0 + %i4], %l2
	.word	0x8143c000	! t0_kref+0x2374:   	stbar
	.word	0x83a000a1	! t0_kref+0x2378:   	fnegs	%f1, %f1
	.word	0x91a18842	! t0_kref+0x237c:   	faddd	%f6, %f2, %f8
	.word	0x3b800008	! t0_kref+0x2380:   	fble,a	_kref+0x23a0
	.word	0xee300018	! t0_kref+0x2384:   	sth	%l7, [%g0 + %i0]
	.word	0xd6166008	! t0_kref+0x2388:   	lduh	[%i1 + 8], %o3
	.word	0xcd1fbd98	! t0_kref+0x238c:   	ldd	[%fp - 0x268], %f6
	.word	0x2f800008	! t0_kref+0x2390:   	fbu,a	_kref+0x23b0
	.word	0xc93e6010	! t0_kref+0x2394:   	std	%f4, [%i1 + 0x10]
	.word	0x81a98ac6	! t0_kref+0x2398:   	fcmped	%fcc0, %f6, %f6
	.word	0x90adbb41	! t0_kref+0x239c:   	andncc	%l6, -0x4bf, %o0
	.word	0x98ad8016	! t0_kref+0x23a0:   	andncc	%l6, %l6, %o4
	.word	0xd848a037	! t0_kref+0x23a4:   	ldsb	[%g2 + 0x37], %o4
	.word	0xc9be1857	! t0_kref+0x23a8:   	stda	%f4, [%i0 + %l7]0xc2
	.word	0x81a018c0	! t0_kref+0x23ac:   	fdtos	%f0, %f0
	.word	0xc320a014	! t0_kref+0x23b0:   	st	%f1, [%g2 + 0x14]
	.word	0x91a01922	! t0_kref+0x23b4:   	fstod	%f2, %f8
	.word	0xc11fbe98	! t0_kref+0x23b8:   	ldd	[%fp - 0x168], %f0
	.word	0x8125a98a	! t0_kref+0x23bc:   	mulscc	%l6, 0x98a, %g0
	.word	0xeeb01019	! t0_kref+0x23c0:   	stha	%l7, [%g0 + %i1]0x80
	.word	0xda000018	! t0_kref+0x23c4:   	ld	[%g0 + %i0], %o5
	.word	0xd41e3ff8	! t0_kref+0x23c8:   	ldd	[%i0 - 8], %o2
	.word	0x961d8017	! t0_kref+0x23cc:   	xor	%l6, %l7, %o3
	.word	0x9b35c017	! t0_kref+0x23d0:   	srl	%l7, %l7, %o5
	.word	0x81dfc015	! t0_kref+0x23d4:   	flush	%i7 + %l5
	.word	0x8143c000	! t0_kref+0x23d8:   	stbar
	.word	0x89a18d28	! t0_kref+0x23dc:   	fsmuld	%f6, %f8, %f4
	.word	0x93700017	! t0_kref+0x23e0:   	popc	%l7, %o1
	.word	0x9835a38c	! t0_kref+0x23e4:   	orn	%l6, 0x38c, %o4
	.word	0x90a5a703	! t0_kref+0x23e8:   	subcc	%l6, 0x703, %o0
	.word	0x980dc017	! t0_kref+0x23ec:   	and	%l7, %l7, %o4
	.word	0xd6de1000	! t0_kref+0x23f0:   	ldxa	[%i0]0x80, %o3
	.word	0x8da188c4	! t0_kref+0x23f4:   	fsubd	%f6, %f4, %f6
	.word	0xee6e7ffb	! t0_kref+0x23f8:   	ldstub	[%i1 - 5], %l7
	.word	0xd600a038	! t0_kref+0x23fc:   	ld	[%g2 + 0x38], %o3
	.word	0x96e58017	! t0_kref+0x2400:   	subccc	%l6, %l7, %o3
	.word	0x29800005	! t0_kref+0x2404:   	fbl,a	_kref+0x2418
	.word	0xd04e3ffa	! t0_kref+0x2408:   	ldsb	[%i0 - 6], %o0
	.word	0x81a80aa6	! t0_kref+0x240c:   	fcmpes	%fcc0, %f0, %f6
	.word	0xc91fbeb0	! t0_kref+0x2410:   	ldd	[%fp - 0x150], %f4
	.word	0x91358016	! t0_kref+0x2414:   	srl	%l6, %l6, %o0
	.word	0x81a00d22	! t0_kref+0x2418:   	fsmuld	%f0, %f2, %f0
	.word	0x9875e350	! t0_kref+0x241c:   	udiv	%l7, 0x350, %o4
	.word	0x8143e040	! t0_kref+0x2420:   	membar	0x40
	.word	0x89a18d22	! t0_kref+0x2424:   	fsmuld	%f6, %f2, %f4
	.word	0x8ba000a1	! t0_kref+0x2428:   	fnegs	%f1, %f5
	.word	0xeeb01018	! t0_kref+0x242c:   	stha	%l7, [%g0 + %i0]0x80
	.word	0x85a01884	! t0_kref+0x2430:   	fitos	%f4, %f2
	.word	0xd83e3ff0	! t0_kref+0x2434:   	std	%o4, [%i0 - 0x10]
	.word	0x89a01a48	! t0_kref+0x2438:   	fdtoi	%f8, %f4
	.word	0x87a018c0	! t0_kref+0x243c:   	fdtos	%f0, %f3
	.word	0x91a01a24	! t0_kref+0x2440:   	fstoi	%f4, %f8
	.word	0x8045c016	! t0_kref+0x2444:   	addc	%l7, %l6, %g0
	.word	0x8143c000	! t0_kref+0x2448:   	stbar
	.word	0xc8183fa0	! t0_kref+0x244c:   	ldd	[%g0 - 0x60], %g4
	.word	0x80d5e97f	! t0_kref+0x2450:   	umulcc	%l7, 0x97f, %g0
	.word	0x94f5ab7d	! t0_kref+0x2454:   	udivcc	%l6, 0xb7d, %o2
	.word	0x9f35e019	! t0_kref+0x2458:   	srl	%l7, 0x19, %o7
	.word	0x8da18946	! t0_kref+0x245c:   	fmuld	%f6, %f6, %f6
	.word	0x9a95c016	! t0_kref+0x2460:   	orcc	%l7, %l6, %o5
	.word	0x9695e627	! t0_kref+0x2464:   	orcc	%l7, 0x627, %o3
	.word	0x81a00046	! t0_kref+0x2468:   	fmovd	%f6, %f0
	.word	0xc76e4016	! t0_kref+0x246c:   	prefetch	%i1 + %l6, 3
	.word	0x9a95be89	! t0_kref+0x2470:   	orcc	%l6, -0x177, %o5
	.word	0xed68a081	! t0_kref+0x2474:   	prefetch	%g2 + 0x81, 22
	.word	0x87a049a2	! t0_kref+0x2478:   	fdivs	%f1, %f2, %f3
	.word	0xd83e3fe8	! t0_kref+0x247c:   	std	%o4, [%i0 - 0x18]
	.word	0xd240a030	! t0_kref+0x2480:   	ldsw	[%g2 + 0x30], %o1
	.word	0x98a58016	! t0_kref+0x2484:   	subcc	%l6, %l6, %o4
	.word	0xd186105c	! t0_kref+0x2488:   	lda	[%i0 + %i4]0x82, %f8
	.word	0xc0067ff0	! t0_kref+0x248c:   	ld	[%i1 - 0x10], %g0
	.word	0x29800007	! t0_kref+0x2490:   	fbl,a	_kref+0x24ac
	.word	0x8da000c2	! t0_kref+0x2494:   	fnegd	%f2, %f6
	.word	0x81a000a9	! t0_kref+0x2498:   	fnegs	%f9, %f0
	.word	0x89a089c0	! t0_kref+0x249c:   	fdivd	%f2, %f0, %f4
	.word	0x94a5ad75	! t0_kref+0x24a0:   	subcc	%l6, 0xd75, %o2
	.word	0xd2162012	! t0_kref+0x24a4:   	lduh	[%i0 + 0x12], %o1
	.word	0x90b5b1ce	! t0_kref+0x24a8:   	orncc	%l6, -0xe32, %o0
	.word	0xee30a002	! t0_kref+0x24ac:   	sth	%l7, [%g2 + 2]
	.word	0xc91e7fe0	! t0_kref+0x24b0:   	ldd	[%i1 - 0x20], %f4
	.word	0x8143c000	! t0_kref+0x24b4:   	stbar
	.word	0x98a58017	! t0_kref+0x24b8:   	subcc	%l6, %l7, %o4
	.word	0x8da01a29	! t0_kref+0x24bc:   	fstoi	%f9, %f6
	.word	0xda063ffc	! t0_kref+0x24c0:   	ld	[%i0 - 4], %o5
	.word	0x969df19a	! t0_kref+0x24c4:   	xorcc	%l7, -0xe66, %o3
	.word	0x9a3d8016	! t0_kref+0x24c8:   	xnor	%l6, %l6, %o5
	.word	0x3d800007	! t0_kref+0x24cc:   	fbule,a	_kref+0x24e8
	.word	0x87a109a2	! t0_kref+0x24d0:   	fdivs	%f4, %f2, %f3
	.word	0xd300a008	! t0_kref+0x24d4:   	ld	[%g2 + 8], %f9
	.word	0xee363fe6	! t0_kref+0x24d8:   	sth	%l7, [%i0 - 0x1a]
	.word	0x905d8017	! t0_kref+0x24dc:   	smul	%l6, %l7, %o0
	.word	0x8da00d23	! t0_kref+0x24e0:   	fsmuld	%f0, %f3, %f6
	.word	0xd050a00e	! t0_kref+0x24e4:   	ldsh	[%g2 + 0xe], %o0
	.word	0x8143c000	! t0_kref+0x24e8:   	stbar
	.word	0x8095bcfa	! t0_kref+0x24ec:   	orcc	%l6, -0x306, %g0
	.word	0x8143c000	! t0_kref+0x24f0:   	stbar
	.word	0x9445fb3b	! t0_kref+0x24f4:   	addc	%l7, -0x4c5, %o2
	.word	0x9665c017	! t0_kref+0x24f8:   	subc	%l7, %l7, %o3
	.word	0x8fa048a3	! t0_kref+0x24fc:   	fsubs	%f1, %f3, %f7
	.word	0xd04e7ff5	! t0_kref+0x2500:   	ldsb	[%i1 - 0xb], %o0
	.word	0x9fc02ef4	! t0_kref+0x2504:   	call	%g0 + 0xef4
	.word	0xc9062010	! t0_kref+0x2508:   	ld	[%i0 + 0x10], %f4
	.word	0xd6c61000	! t0_kref+0x250c:   	ldswa	[%i0]0x80, %o3
	.word	0xd84e601c	! t0_kref+0x2510:   	ldsb	[%i1 + 0x1c], %o4
	.word	0x970db08f	! t0_kref+0x2514:   	tsubcc	%l6, -0xf71, %o3
	.word	0xc768a041	! t0_kref+0x2518:   	prefetch	%g2 + 0x41, 3
	.word	0x83a01a28	! t0_kref+0x251c:   	fstoi	%f8, %f1
	.word	0x93a20929	! t0_kref+0x2520:   	fmuls	%f8, %f9, %f9
	.word	0xd2100019	! t0_kref+0x2524:   	lduh	[%g0 + %i1], %o1
	.word	0xec367fe2	! t0_kref+0x2528:   	sth	%l6, [%i1 - 0x1e]
	.word	0xf007bfe0	! t0_kref+0x252c:   	ld	[%fp - 0x20], %i0
	.word	0xc12e7fe0	! t0_kref+0x2530:   	st	%fsr, [%i1 - 0x20]
	.word	0xef6e001a	! t0_kref+0x2534:   	prefetch	%i0 + %i2, 23
	.word	0x80e5c017	! t0_kref+0x2538:   	subccc	%l7, %l7, %g0
	.word	0x8da188c4	! t0_kref+0x253c:   	fsubd	%f6, %f4, %f6
	.word	0x96e5a823	! t0_kref+0x2540:   	subccc	%l6, 0x823, %o3
	.word	0x81d80012	! t0_kref+0x2544:   	flush	%g0 + %l2
	.word	0x9295fbce	! t0_kref+0x2548:   	orcc	%l7, -0x432, %o1
	.word	0x85a01a46	! t0_kref+0x254c:   	fdtoi	%f6, %f2
	.word	0x913dc017	! t0_kref+0x2550:   	sra	%l7, %l7, %o0
	.word	0x27800004	! t0_kref+0x2554:   	fbul,a	_kref+0x2564
	.word	0xec3e2000	! t0_kref+0x2558:   	std	%l6, [%i0]
	.word	0x933d8017	! t0_kref+0x255c:   	sra	%l6, %l7, %o1
	.word	0xd1f65017	! t0_kref+0x2560:   	casxa	[%i1]0x80, %l7, %o0
	.word	0x81def92e	! t0_kref+0x2564:   	flush	%i3 - 0x6d2
	.word	0xd27f0018	! t0_kref+0x2568:   	swap	[%i4 + %i0], %o1
	.word	0x969db4ac	! t0_kref+0x256c:   	xorcc	%l6, -0xb54, %o3
	.word	0x8da00024	! t0_kref+0x2570:   	fmovs	%f4, %f6
	.word	0x85a00020	! t0_kref+0x2574:   	fmovs	%f0, %f2
	.word	0x85a00524	! t0_kref+0x2578:   	fsqrts	%f4, %f2
	.word	0x29480003	! t0_kref+0x257c:   	fbl,a,pt	%fcc0, _kref+0x2588
	.word	0x9f0def0a	! t0_kref+0x2580:   	tsubcc	%l7, 0xf0a, %o7
	.word	0xef68a001	! t0_kref+0x2584:   	prefetch	%g2 + 1, 23
	.word	0x91400000	! t0_kref+0x2588:   	mov	%y, %o0
	.word	0x27800008	! t0_kref+0x258c:   	fbul,a	_kref+0x25ac
	.word	0x87a01880	! t0_kref+0x2590:   	fitos	%f0, %f3
	.word	0xc91fbe58	! t0_kref+0x2594:   	ldd	[%fp - 0x1a8], %f4
	.word	0xd83e401d	! t0_kref+0x2598:   	std	%o4, [%i1 + %i5]
	.word	0x81d94009	! t0_kref+0x259c:   	flush	%g5 + %o1
	.word	0x81a98ac8	! t0_kref+0x25a0:   	fcmped	%fcc0, %f6, %f8
	call	SYM(t0_subr0)
	.word	0x95700017	! t0_kref+0x25a8:   	popc	%l7, %o2
	.word	0xd606001c	! t0_kref+0x25ac:   	ld	[%i0 + %i4], %o3
	.word	0x9fc00004	! t0_kref+0x25b0:   	call	%g0 + %g4
	.word	0x81a0c8a2	! t0_kref+0x25b4:   	fsubs	%f3, %f2, %f0
	.word	0x81a90a40	! t0_kref+0x25b8:   	fcmpd	%fcc0, %f4, %f0
	.word	0xc19e6010	! t0_kref+0x25bc:   	ldda	[%i1 + 0x10]%asi, %f0
	.word	0xda4e8018	! t0_kref+0x25c0:   	ldsb	[%i2 + %i0], %o5
	.word	0xee36201a	! t0_kref+0x25c4:   	sth	%l7, [%i0 + 0x1a]
	.word	0x9add8017	! t0_kref+0x25c8:   	smulcc	%l6, %l7, %o5
	.word	0x9f40c000	! t0_kref+0x25cc:   	mov	%asi, %o7
	.word	0x87a00028	! t0_kref+0x25d0:   	fmovs	%f8, %f3
	.word	0xd208a018	! t0_kref+0x25d4:   	ldub	[%g2 + 0x18], %o1
	.word	0x94c58017	! t0_kref+0x25d8:   	addccc	%l6, %l7, %o2
	.word	0x81a01900	! t0_kref+0x25dc:   	fitod	%f0, %f0
	.word	0xd0162014	! t0_kref+0x25e0:   	lduh	[%i0 + 0x14], %o0
	.word	0xcd1e6008	! t0_kref+0x25e4:   	ldd	[%i1 + 8], %f6
	.word	0x9e358016	! t0_kref+0x25e8:   	orn	%l6, %l6, %o7
	.word	0x93a01a40	! t0_kref+0x25ec:   	fdtoi	%f0, %f9
	.word	0x86102009	! t0_kref+0x25f0:   	mov	0x9, %g3
	.word	0x86a0e001	! t0_kref+0x25f4:   	subcc	%g3, 1, %g3
	.word	0x2280001a	! t0_kref+0x25f8:   	be,a	_kref+0x2660
	.word	0x9b25b30c	! t0_kref+0x25fc:   	mulscc	%l6, -0xcf4, %o5
	.word	0xc368a084	! t0_kref+0x2600:   	prefetch	%g2 + 0x84, 1
	.word	0x8da018c4	! t0_kref+0x2604:   	fdtos	%f4, %f6
	.word	0x9025f487	! t0_kref+0x2608:   	sub	%l7, -0xb79, %o0
	.word	0xda10a02c	! t0_kref+0x260c:   	lduh	[%g2 + 0x2c], %o5
	call	SYM(t0_subr3)
	.word	0x91a149a6	! t0_kref+0x2614:   	fdivs	%f5, %f6, %f8
	.word	0x81a00024	! t0_kref+0x2618:   	fmovs	%f4, %f0
	.word	0x9245c017	! t0_kref+0x261c:   	addc	%l7, %l7, %o1
	.word	0x81a84aa9	! t0_kref+0x2620:   	fcmpes	%fcc0, %f1, %f9
	.word	0x81a10942	! t0_kref+0x2624:   	fmuld	%f4, %f2, %f0
	.word	0x89a04d23	! t0_kref+0x2628:   	fsmuld	%f1, %f3, %f4
	.word	0xc06e8018	! t0_kref+0x262c:   	ldstub	[%i2 + %i0], %g0
	.word	0xcb26001c	! t0_kref+0x2630:   	st	%f5, [%i0 + %i4]
	.word	0x9e5d8017	! t0_kref+0x2634:   	smul	%l6, %l7, %o7
	.word	0x85a109c0	! t0_kref+0x2638:   	fdivd	%f4, %f0, %f2
	.word	0x8035b71b	! t0_kref+0x263c:   	orn	%l6, -0x8e5, %g0
	call	SYM(t0_subr3)
	.word	0xec3e0000	! t0_kref+0x2644:   	std	%l6, [%i0]
	.word	0x81ddf782	! t0_kref+0x2648:   	flush	%l7 - 0x87e
	.word	0x80c5fe47	! t0_kref+0x264c:   	addccc	%l7, -0x1b9, %g0
	.word	0x9e358016	! t0_kref+0x2650:   	orn	%l6, %l6, %o7
	.word	0x9535e01a	! t0_kref+0x2654:   	srl	%l7, 0x1a, %o2
	.word	0xc5180019	! t0_kref+0x2658:   	ldd	[%g0 + %i1], %f2
	.word	0xd808a025	! t0_kref+0x265c:   	ldub	[%g2 + 0x25], %o4
	.word	0xd24e0000	! t0_kref+0x2660:   	ldsb	[%i0], %o1
	.word	0x8faac028	! t0_kref+0x2664:   	fmovsge	%fcc0, %f8, %f7
	.word	0x98bdc017	! t0_kref+0x2668:   	xnorcc	%l7, %l7, %o4
	.word	0xec200019	! t0_kref+0x266c:   	st	%l6, [%g0 + %i1]
	.word	0x92adfc81	! t0_kref+0x2670:   	andncc	%l7, -0x37f, %o1
	.word	0xee30a00c	! t0_kref+0x2674:   	sth	%l7, [%g2 + 0xc]
	.word	0x9e75c017	! t0_kref+0x2678:   	udiv	%l7, %l7, %o7
	.word	0xc9be1816	! t0_kref+0x267c:   	stda	%f4, [%i0 + %l6]0xc0
	.word	0x8fa00021	! t0_kref+0x2680:   	fmovs	%f1, %f7
	.word	0x3b800002	! t0_kref+0x2684:   	fble,a	_kref+0x268c
	.word	0xc9be5817	! t0_kref+0x2688:   	stda	%f4, [%i1 + %l7]0xc0
	.word	0x98958016	! t0_kref+0x268c:   	orcc	%l6, %l6, %o4
	.word	0x85a01108	! t0_kref+0x2690:   	fxtod	%f8, %f2
	.word	0x92c5e645	! t0_kref+0x2694:   	addccc	%l7, 0x645, %o1
	.word	0xc9be1a1b	! t0_kref+0x2698:   	stda	%f4, [%i0 + %i3]0xd0
	.word	0xd2167ff8	! t0_kref+0x269c:   	lduh	[%i1 - 8], %o1
	.word	0x94a5ad8a	! t0_kref+0x26a0:   	subcc	%l6, 0xd8a, %o2
	.word	0x81a98a29	! t0_kref+0x26a4:   	fcmps	%fcc0, %f6, %f9
	.word	0x86102016	! t0_kref+0x26a8:   	mov	0x16, %g3
	.word	0x86a0e001	! t0_kref+0x26ac:   	subcc	%g3, 1, %g3
	.word	0x2280001d	! t0_kref+0x26b0:   	be,a	_kref+0x2724
	.word	0xc706001c	! t0_kref+0x26b4:   	ld	[%i0 + %i4], %f3
	.word	0x85a01904	! t0_kref+0x26b8:   	fitod	%f4, %f2
	.word	0x85a00520	! t0_kref+0x26bc:   	fsqrts	%f0, %f2
	.word	0x8fa018c4	! t0_kref+0x26c0:   	fdtos	%f4, %f7
	.word	0x969d8017	! t0_kref+0x26c4:   	xorcc	%l6, %l7, %o3
	.word	0x91a00022	! t0_kref+0x26c8:   	fmovs	%f2, %f8
	.word	0x92958017	! t0_kref+0x26cc:   	orcc	%l6, %l7, %o1
	.word	0xe2ee9018	! t0_kref+0x26d0:   	ldstuba	[%i2 + %i0]0x80, %l1
	.word	0x37bffff6	! t0_kref+0x26d4:   	fbge,a	_kref+0x26ac
	.word	0xef6e401b	! t0_kref+0x26d8:   	prefetch	%i1 + %i3, 23
	.word	0x1700094a	! t0_kref+0x26dc:   	sethi	%hi(0x252800), %o3
	.word	0xd400a018	! t0_kref+0x26e0:   	ld	[%g2 + 0x18], %o2
	.word	0xfdee101b	! t0_kref+0x26e4:   	prefetcha	%i0 + %i3, 30
	.word	0x89a00148	! t0_kref+0x26e8:   	fabsd	%f8, %f4
	.word	0xd1be5856	! t0_kref+0x26ec:   	stda	%f8, [%i1 + %l6]0xc2
	.word	0xcf20a028	! t0_kref+0x26f0:   	st	%f7, [%g2 + 0x28]
	.word	0x81a90aa1	! t0_kref+0x26f4:   	fcmpes	%fcc0, %f4, %f1
	.word	0x9ac5a239	! t0_kref+0x26f8:   	addccc	%l6, 0x239, %o5
	.word	0xee2e2011	! t0_kref+0x26fc:   	stb	%l7, [%i0 + 0x11]
	.word	0x91a01921	! t0_kref+0x2700:   	fstod	%f1, %f8
	.word	0x9325be72	! t0_kref+0x2704:   	mulscc	%l6, -0x18e, %o1
	.word	0x85a00046	! t0_kref+0x2708:   	fmovd	%f6, %f2
	.word	0x89a01a46	! t0_kref+0x270c:   	fdtoi	%f6, %f4
	.word	0x925dc016	! t0_kref+0x2710:   	smul	%l7, %l6, %o1
	.word	0xf1ee501a	! t0_kref+0x2714:   	prefetcha	%i1 + %i2, 24
	.word	0xec30a02c	! t0_kref+0x2718:   	sth	%l6, [%g2 + 0x2c]
	.word	0x87a109a7	! t0_kref+0x271c:   	fdivs	%f4, %f7, %f3
	.word	0x29800003	! t0_kref+0x2720:   	fbl,a	_kref+0x272c
	.word	0xc05e3ff8	! t0_kref+0x2724:   	ldx	[%i0 - 8], %g0
	.word	0x9645c017	! t0_kref+0x2728:   	addc	%l7, %l7, %o3
	.word	0xcd380019	! t0_kref+0x272c:   	std	%f6, [%g0 + %i1]
	.word	0x9445ec0b	! t0_kref+0x2730:   	addc	%l7, 0xc0b, %o2
	.word	0xee7e6018	! t0_kref+0x2734:   	swap	[%i1 + 0x18], %l7
	.word	0x86102006	! t0_kref+0x2738:   	mov	0x6, %g3
	.word	0x86a0e001	! t0_kref+0x273c:   	subcc	%g3, 1, %g3
	.word	0x2280000b	! t0_kref+0x2740:   	be,a	_kref+0x276c
	.word	0x81a01924	! t0_kref+0x2744:   	fstod	%f4, %f0
	.word	0xc19e1a5c	! t0_kref+0x2748:   	ldda	[%i0 + %i4]0xd2, %f0
	.word	0x8da20948	! t0_kref+0x274c:   	fmuld	%f8, %f8, %f6
	.word	0x89a01a25	! t0_kref+0x2750:   	fstoi	%f5, %f4
	.word	0x9fc00004	! t0_kref+0x2754:   	call	%g0 + %g4
	.word	0x923dadae	! t0_kref+0x2758:   	xnor	%l6, 0xdae, %o1
	.word	0x932da004	! t0_kref+0x275c:   	sll	%l6, 0x4, %o1
	.word	0xee30a024	! t0_kref+0x2760:   	sth	%l7, [%g2 + 0x24]
	.word	0xec20a018	! t0_kref+0x2764:   	st	%l6, [%g2 + 0x18]
	.word	0x89a01929	! t0_kref+0x2768:   	fstod	%f9, %f4
	.word	0x98a5e28b	! t0_kref+0x276c:   	subcc	%l7, 0x28b, %o4
	.word	0x93a018c6	! t0_kref+0x2770:   	fdtos	%f6, %f9
	.word	0x9025f879	! t0_kref+0x2774:   	sub	%l7, -0x787, %o0
	.word	0x81aa0a24	! t0_kref+0x2778:   	fcmps	%fcc0, %f8, %f4
	.word	0x91a018c4	! t0_kref+0x277c:   	fdtos	%f4, %f8
	.word	0xc51e7fe0	! t0_kref+0x2780:   	ldd	[%i1 - 0x20], %f2
	.word	0xe36e401b	! t0_kref+0x2784:   	prefetch	%i1 + %i3, 17
	.word	0x9095fca4	! t0_kref+0x2788:   	orcc	%l7, -0x35c, %o0
	.word	0x89a18944	! t0_kref+0x278c:   	fmuld	%f6, %f4, %f4
	.word	0xef68a045	! t0_kref+0x2790:   	prefetch	%g2 + 0x45, 23
	.word	0x8185c000	! t0_kref+0x2794:   	wr	%l7, %g0, %y
	.word	0x9445bf06	! t0_kref+0x2798:   	addc	%l6, -0xfa, %o2
	.word	0xed6e001a	! t0_kref+0x279c:   	prefetch	%i0 + %i2, 22
	.word	0x91a01106	! t0_kref+0x27a0:   	fxtod	%f6, %f8
	.word	0x81a018c0	! t0_kref+0x27a4:   	fdtos	%f0, %f0
	.word	0x86102001	! t0_kref+0x27a8:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x27ac:   	bne,a	_kref+0x27ac
	.word	0x86a0e001	! t0_kref+0x27b0:   	subcc	%g3, 1, %g3
	.word	0x9ee58016	! t0_kref+0x27b4:   	subccc	%l6, %l6, %o7
	.word	0x87a018c2	! t0_kref+0x27b8:   	fdtos	%f2, %f3
	.word	0xcd26600c	! t0_kref+0x27bc:   	st	%f6, [%i1 + 0xc]
	.word	0xeb6e3fe0	! t0_kref+0x27c0:   	prefetch	%i0 - 0x20, 21
	.word	0xd19e5a5d	! t0_kref+0x27c4:   	ldda	[%i1 + %i5]0xd2, %f8
	.word	0x9ae5ef3a	! t0_kref+0x27c8:   	subccc	%l7, 0xf3a, %o5
	.word	0xc320a014	! t0_kref+0x27cc:   	st	%f1, [%g2 + 0x14]
	.word	0x91a208c2	! t0_kref+0x27d0:   	fsubd	%f8, %f2, %f8
	.word	0x988d8017	! t0_kref+0x27d4:   	andcc	%l6, %l7, %o4
	.word	0x98458017	! t0_kref+0x27d8:   	addc	%l6, %l7, %o4
	.word	0x93a018c4	! t0_kref+0x27dc:   	fdtos	%f4, %f9
	.word	0xc300a03c	! t0_kref+0x27e0:   	ld	[%g2 + 0x3c], %f1
	.word	0x813da013	! t0_kref+0x27e4:   	sra	%l6, 0x13, %g0
!	.word	0x20bfb606	! t0_kref+0x27e8:   	bn,a	SYM(t0_subr1)
	   	bn,a	SYM(t0_subr1)
	.word	0x9f414000	! t0_kref+0x27ec:   	mov	%pc, %o7
	.word	0x93a01a25	! t0_kref+0x27f0:   	fstoi	%f5, %f9
	.word	0xd65f4018	! t0_kref+0x27f4:   	ldx	[%i5 + %i0], %o3
	.word	0x9835e6e2	! t0_kref+0x27f8:   	orn	%l7, 0x6e2, %o4
	.word	0xd200a010	! t0_kref+0x27fc:   	ld	[%g2 + 0x10], %o1
	.word	0xd01f4000	! t0_kref+0x2800:   	ldd	[%i5], %o0
	.word	0x81aa0aa5	! t0_kref+0x2804:   	fcmpes	%fcc0, %f8, %f5
	.word	0x91358016	! t0_kref+0x2808:   	srl	%l6, %l6, %o0
	.word	0xd3067fe4	! t0_kref+0x280c:   	ld	[%i1 - 0x1c], %f9
	.word	0x91a000a2	! t0_kref+0x2810:   	fnegs	%f2, %f8
	.word	0x9fc10000	! t0_kref+0x2814:   	call	%g4
	.word	0x8da98046	! t0_kref+0x2818:   	fmovdg	%fcc0, %f6, %f6
	.word	0xfbee501d	! t0_kref+0x281c:   	prefetcha	%i1 + %i5, 29
	.word	0xe168a007	! t0_kref+0x2820:   	prefetch	%g2 + 7, 16
	call	SYM(t0_subr1)
	.word	0xd19e3fea	! t0_kref+0x2828:   	ldda	[%i0 - 0x16]%asi, %f8
	.word	0x9b15e304	! t0_kref+0x282c:   	taddcctv	%l7, 0x304, %o5
	.word	0xd6060000	! t0_kref+0x2830:   	ld	[%i0], %o3
	.word	0x3e480001	! t0_kref+0x2834:   	bvc,a,pt	%icc, _kref+0x2838
	.word	0xe66e601e	! t0_kref+0x2838:   	ldstub	[%i1 + 0x1e], %l3
	.word	0x9e8dc017	! t0_kref+0x283c:   	andcc	%l7, %l7, %o7
	.word	0xc920a018	! t0_kref+0x2840:   	st	%f4, [%g2 + 0x18]
	.word	0x81aa0aa0	! t0_kref+0x2844:   	fcmpes	%fcc0, %f8, %f0
	.word	0x9e75f327	! t0_kref+0x2848:   	udiv	%l7, -0xcd9, %o7
	.word	0x91a000c8	! t0_kref+0x284c:   	fnegd	%f8, %f8
	.word	0x921de9ef	! t0_kref+0x2850:   	xor	%l7, 0x9ef, %o1
	.word	0xd1267ffc	! t0_kref+0x2854:   	st	%f8, [%i1 - 4]
	call	SYM(t0_subr2)
	.word	0xd19e5a5d	! t0_kref+0x285c:   	ldda	[%i1 + %i5]0xd2, %f8
	.word	0x90a5c017	! t0_kref+0x2860:   	subcc	%l7, %l7, %o0
	.word	0x3d800003	! t0_kref+0x2864:   	fbule,a	_kref+0x2870
	.word	0x91a01928	! t0_kref+0x2868:   	fstod	%f8, %f8
	.word	0xc13e001d	! t0_kref+0x286c:   	std	%f0, [%i0 + %i5]
	.word	0x9035b23f	! t0_kref+0x2870:   	orn	%l6, -0xdc1, %o0
	.word	0xd0c71019	! t0_kref+0x2874:   	ldswa	[%i4 + %i1]0x80, %o0
	.word	0x91a049a5	! t0_kref+0x2878:   	fdivs	%f1, %f5, %f8
	.word	0xeef75018	! t0_kref+0x287c:   	stxa	%l7, [%i5 + %i0]0x80
	.word	0x8da90044	! t0_kref+0x2880:   	fmovdl	%fcc0, %f4, %f6
	sethi	%hi(2f), %o7
	.word	0xe40be0b8	! t0_kref+0x2888:   	ldub	[%o7 + 0xb8], %l2
	.word	0xa41ca00c	! t0_kref+0x288c:   	xor	%l2, 0xc, %l2
	.word	0xe42be0b8	! t0_kref+0x2890:   	stb	%l2, [%o7 + 0xb8]
	.word	0x81dbe0b8	! t0_kref+0x2894:   	flush	%o7 + 0xb8
	.word	0x81418000	! t0_kref+0x2898:   	mov	%fprs, %g0
	.word	0x8143c000	! t0_kref+0x289c:   	stbar
	.word	0xd640a020	! t0_kref+0x28a0:   	ldsw	[%g2 + 0x20], %o3
	.word	0x94bda3b6	! t0_kref+0x28a4:   	xnorcc	%l6, 0x3b6, %o2
	.word	0x81aa0aa4	! t0_kref+0x28a8:   	fcmpes	%fcc0, %f8, %f4
	.word	0xc53e0000	! t0_kref+0x28ac:   	std	%f2, [%i0]
	.word	0x9865b0d4	! t0_kref+0x28b0:   	subc	%l6, -0xf2c, %o4
	.word	0x9af5f12d	! t0_kref+0x28b4:   	udivcc	%l7, -0xed3, %o5
2:	.word	0x98f5b2d8	! t0_kref+0x28b8:   	udivcc	%l6, -0xd28, %o4
	.word	0xd83e3fe0	! t0_kref+0x28bc:   	std	%o4, [%i0 - 0x20]
	.word	0x9225a874	! t0_kref+0x28c0:   	sub	%l6, 0x874, %o1
	.word	0x969de756	! t0_kref+0x28c4:   	xorcc	%l7, 0x756, %o3
	.word	0x953de00b	! t0_kref+0x28c8:   	sra	%l7, 0xb, %o2
	.word	0x81a208c0	! t0_kref+0x28cc:   	fsubd	%f8, %f0, %f0
	.word	0x9e8d8017	! t0_kref+0x28d0:   	andcc	%l6, %l7, %o7
	.word	0x94ad8017	! t0_kref+0x28d4:   	andncc	%l6, %l7, %o2
	.word	0xc168a08c	! t0_kref+0x28d8:   	prefetch	%g2 + 0x8c, 0
	.word	0x9e258017	! t0_kref+0x28dc:   	sub	%l6, %l7, %o7
	.word	0x85a01901	! t0_kref+0x28e0:   	fitod	%f1, %f2
	.word	0xe0680019	! t0_kref+0x28e4:   	ldstub	[%g0 + %i1], %l0
	.word	0x29800004	! t0_kref+0x28e8:   	fbl,a	_kref+0x28f8
	.word	0x81de8015	! t0_kref+0x28ec:   	flush	%i2 + %l5
	.word	0x92958017	! t0_kref+0x28f0:   	orcc	%l6, %l7, %o1
	.word	0x83a00021	! t0_kref+0x28f4:   	fmovs	%f1, %f1
	.word	0xe66e3fe0	! t0_kref+0x28f8:   	ldstub	[%i0 - 0x20], %l3
	.word	0xec7e0000	! t0_kref+0x28fc:   	swap	[%i0], %l6
	.word	0xe96e001d	! t0_kref+0x2900:   	prefetch	%i0 + %i5, 20
	.word	0x92d5e871	! t0_kref+0x2904:   	umulcc	%l7, 0x871, %o1
	call	SYM(t0_subr3)
	.word	0xd696d019	! t0_kref+0x290c:   	lduha	[%i3 + %i1]0x80, %o3
	.word	0x80bdffcf	! t0_kref+0x2910:   	xnorcc	%l7, -0x31, %g0
	.word	0x80558017	! t0_kref+0x2914:   	umul	%l6, %l7, %g0
	.word	0x89a018c4	! t0_kref+0x2918:   	fdtos	%f4, %f4
	.word	0x9105c017	! t0_kref+0x291c:   	taddcc	%l7, %l7, %o0
	.word	0xd2063fe0	! t0_kref+0x2920:   	ld	[%i0 - 0x20], %o1
	.word	0x90f5f3f8	! t0_kref+0x2924:   	udivcc	%l7, -0xc08, %o0
	.word	0x81a00042	! t0_kref+0x2928:   	fmovd	%f2, %f0
	.word	0x85a04d25	! t0_kref+0x292c:   	fsmuld	%f1, %f5, %f2
	.word	0xd810a020	! t0_kref+0x2930:   	lduh	[%g2 + 0x20], %o4
	.word	0xc9be2004	! t0_kref+0x2934:   	stda	%f4, [%i0 + 4]%asi
	.word	0x8185c000	! t0_kref+0x2938:   	wr	%l7, %g0, %y
	.word	0x34800001	! t0_kref+0x293c:   	bg,a	_kref+0x2940
	.word	0xda166002	! t0_kref+0x2940:   	lduh	[%i1 + 2], %o5
	.word	0xea6e200a	! t0_kref+0x2944:   	ldstub	[%i0 + 0xa], %l5
	.word	0xe968a086	! t0_kref+0x2948:   	prefetch	%g2 + 0x86, 20
	.word	0xd840a014	! t0_kref+0x294c:   	ldsw	[%g2 + 0x14], %o4
	.word	0xe83f4018	! t0_kref+0x2950:   	std	%l4, [%i5 + %i0]
	.word	0xee36001b	! t0_kref+0x2954:   	sth	%l7, [%i0 + %i3]
	.word	0x21800007	! t0_kref+0x2958:   	fbn,a	_kref+0x2974
	.word	0xc9beda18	! t0_kref+0x295c:   	stda	%f4, [%i3 + %i0]0xd0
	.word	0xc5263ff8	! t0_kref+0x2960:   	st	%f2, [%i0 - 8]
	.word	0x85a00d27	! t0_kref+0x2964:   	fsmuld	%f0, %f7, %f2
	.word	0xd1be1897	! t0_kref+0x2968:   	stda	%f8, [%i0 + %l7]0xc4
	.word	0xd27e201c	! t0_kref+0x296c:   	swap	[%i0 + 0x1c], %o1
	.word	0x81a00942	! t0_kref+0x2970:   	fmuld	%f0, %f2, %f0
	.word	0x92458016	! t0_kref+0x2974:   	addc	%l6, %l6, %o1
	.word	0x8045c016	! t0_kref+0x2978:   	addc	%l7, %l6, %g0
	.word	0x9ea5f7fb	! t0_kref+0x297c:   	subcc	%l7, -0x805, %o7
	.word	0x933d8016	! t0_kref+0x2980:   	sra	%l6, %l6, %o1
	.word	0xc1be1857	! t0_kref+0x2984:   	stda	%f0, [%i0 + %l7]0xc2
	.word	0xc5262010	! t0_kref+0x2988:   	st	%f2, [%i0 + 0x10]
	.word	0xfbee501c	! t0_kref+0x298c:   	prefetcha	%i1 + %i4, 29
	.word	0xec267ff8	! t0_kref+0x2990:   	st	%l6, [%i1 - 8]
	.word	0x9665c016	! t0_kref+0x2994:   	subc	%l7, %l6, %o3
	.word	0xde16401b	! t0_kref+0x2998:   	lduh	[%i1 + %i3], %o7
	.word	0x96c5b15b	! t0_kref+0x299c:   	addccc	%l6, -0xea5, %o3
	.word	0x9b3de003	! t0_kref+0x29a0:   	sra	%l7, 0x3, %o5
	.word	0x85a01889	! t0_kref+0x29a4:   	fitos	%f9, %f2
	.word	0x81858000	! t0_kref+0x29a8:   	wr	%l6, %g0, %y
	.word	0x8025b150	! t0_kref+0x29ac:   	sub	%l6, -0xeb0, %g0
	.word	0x83a01a28	! t0_kref+0x29b0:   	fstoi	%f8, %f1
	.word	0x87a000a4	! t0_kref+0x29b4:   	fnegs	%f4, %f3
	.word	0x9005b1d1	! t0_kref+0x29b8:   	add	%l6, -0xe2f, %o0
	.word	0xd840a02c	! t0_kref+0x29bc:   	ldsw	[%g2 + 0x2c], %o4
	.word	0xc1266018	! t0_kref+0x29c0:   	st	%f0, [%i1 + 0x18]
	.word	0x80e58017	! t0_kref+0x29c4:   	subccc	%l6, %l7, %g0
	.word	0x8da1cd27	! t0_kref+0x29c8:   	fsmuld	%f7, %f7, %f6
	.word	0x81aa4a25	! t0_kref+0x29cc:   	fcmps	%fcc0, %f9, %f5
	.word	0x81258017	! t0_kref+0x29d0:   	mulscc	%l6, %l7, %g0
	.word	0x9e65c017	! t0_kref+0x29d4:   	subc	%l7, %l7, %o7
	.word	0x9845b586	! t0_kref+0x29d8:   	addc	%l6, -0xa7a, %o4
	.word	0x90658017	! t0_kref+0x29dc:   	subc	%l6, %l7, %o0
	.word	0xd1be1896	! t0_kref+0x29e0:   	stda	%f8, [%i0 + %l6]0xc4
	.word	0xd64e3fea	! t0_kref+0x29e4:   	ldsb	[%i0 - 0x16], %o3
	.word	0x9845b713	! t0_kref+0x29e8:   	addc	%l6, -0x8ed, %o4
	.word	0x9475f897	! t0_kref+0x29ec:   	udiv	%l7, -0x769, %o2
	.word	0x8185c000	! t0_kref+0x29f0:   	wr	%l7, %g0, %y
	.word	0xd1be3ffe	! t0_kref+0x29f4:   	stda	%f8, [%i0 - 2]%asi
	.word	0xd608a03c	! t0_kref+0x29f8:   	ldub	[%g2 + 0x3c], %o3
	.word	0x8da00029	! t0_kref+0x29fc:   	fmovs	%f9, %f6
	.word	0x9665e56f	! t0_kref+0x2a00:   	subc	%l7, 0x56f, %o3
	.word	0xd648a010	! t0_kref+0x2a04:   	ldsb	[%g2 + 0x10], %o3
	.word	0xec20a034	! t0_kref+0x2a08:   	st	%l6, [%g2 + 0x34]
	.word	0x80658016	! t0_kref+0x2a0c:   	subc	%l6, %l6, %g0
	.word	0x91a01880	! t0_kref+0x2a10:   	fitos	%f0, %f8
	.word	0xcd1fbf40	! t0_kref+0x2a14:   	ldd	[%fp - 0xc0], %f6
	.word	0x81a9ca24	! t0_kref+0x2a18:   	fcmps	%fcc0, %f7, %f4
	.word	0x8045c016	! t0_kref+0x2a1c:   	addc	%l7, %l6, %g0
	.word	0x908d8017	! t0_kref+0x2a20:   	andcc	%l6, %l7, %o0
	.word	0xcd3e4000	! t0_kref+0x2a24:   	std	%f6, [%i1]
	call	1f
	.empty
	.word	0xdade1000	! t0_kref+0x2a2c:   	ldxa	[%i0]0x80, %o5
1:	.word	0xd850a026	! t0_kref+0x2a30:   	ldsh	[%g2 + 0x26], %o4
	.word	0x9a5dbd98	! t0_kref+0x2a34:   	smul	%l6, -0x268, %o5
	.word	0x9ea5c016	! t0_kref+0x2a38:   	subcc	%l7, %l6, %o7
	.word	0xec367fe2	! t0_kref+0x2a3c:   	sth	%l6, [%i1 - 0x1e]
	.word	0x81a88a21	! t0_kref+0x2a40:   	fcmps	%fcc0, %f2, %f1
	.word	0x9e5dc017	! t0_kref+0x2a44:   	smul	%l7, %l7, %o7
	.word	0x91a209c4	! t0_kref+0x2a48:   	fdivd	%f8, %f4, %f8
	.word	0x9a9dad9d	! t0_kref+0x2a4c:   	xorcc	%l6, 0xd9d, %o5
	.word	0x8da24d25	! t0_kref+0x2a50:   	fsmuld	%f9, %f5, %f6
	.word	0x94558016	! t0_kref+0x2a54:   	umul	%l6, %l6, %o2
	.word	0x98f5e755	! t0_kref+0x2a58:   	udivcc	%l7, 0x755, %o4
	.word	0xd84e6001	! t0_kref+0x2a5c:   	ldsb	[%i1 + 1], %o4
	.word	0xd87e001c	! t0_kref+0x2a60:   	swap	[%i0 + %i4], %o4
	.word	0x9e75aa9a	! t0_kref+0x2a64:   	udiv	%l6, 0xa9a, %o7
	.word	0x9495b057	! t0_kref+0x2a68:   	orcc	%l6, -0xfa9, %o2
	.word	0x8045c017	! t0_kref+0x2a6c:   	addc	%l7, %l7, %g0
	.word	0x89a08940	! t0_kref+0x2a70:   	fmuld	%f2, %f0, %f4
	.word	0x9ae5c017	! t0_kref+0x2a74:   	subccc	%l7, %l7, %o5
	.word	0x9ae5e1c4	! t0_kref+0x2a78:   	subccc	%l7, 0x1c4, %o5
	.word	0x81a80aa8	! t0_kref+0x2a7c:   	fcmpes	%fcc0, %f0, %f8
	.word	0x9a3d8016	! t0_kref+0x2a80:   	xnor	%l6, %l6, %o5
	.word	0xd010a034	! t0_kref+0x2a84:   	lduh	[%g2 + 0x34], %o0
	.word	0x81a98a23	! t0_kref+0x2a88:   	fcmps	%fcc0, %f6, %f3
	.word	0x85a20944	! t0_kref+0x2a8c:   	fmuld	%f8, %f4, %f2
	.word	0x9ed58017	! t0_kref+0x2a90:   	umulcc	%l6, %l7, %o7
	.word	0x8170243c	! t0_kref+0x2a94:   	popc	0x43c, %g0
	.word	0x91a00923	! t0_kref+0x2a98:   	fmuls	%f0, %f3, %f8
	.word	0xc19e7ff0	! t0_kref+0x2a9c:   	ldda	[%i1 - 0x10]%asi, %f0
	.word	0x3c480007	! t0_kref+0x2aa0:   	bpos,a,pt	%icc, _kref+0x2abc
	.word	0xc99e6012	! t0_kref+0x2aa4:   	ldda	[%i1 + 0x12]%asi, %f4
	.word	0xe0180018	! t0_kref+0x2aa8:   	ldd	[%g0 + %i0], %l0
	.word	0x81a01881	! t0_kref+0x2aac:   	fitos	%f1, %f0
	.word	0x9275af9a	! t0_kref+0x2ab0:   	udiv	%l6, 0xf9a, %o1
	.word	0x9a0daa75	! t0_kref+0x2ab4:   	and	%l6, 0xa75, %o5
	.word	0x94d5c016	! t0_kref+0x2ab8:   	umulcc	%l7, %l6, %o2
	.word	0x968dc017	! t0_kref+0x2abc:   	andcc	%l7, %l7, %o3
	.word	0xd608a001	! t0_kref+0x2ac0:   	ldub	[%g2 + 1], %o3
	.word	0xc168a083	! t0_kref+0x2ac4:   	prefetch	%g2 + 0x83, 0
	.word	0xe8be101d	! t0_kref+0x2ac8:   	stda	%l4, [%i0 + %i5]0x80
	.word	0x85a01102	! t0_kref+0x2acc:   	fxtod	%f2, %f2
	.word	0x988db1ac	! t0_kref+0x2ad0:   	andcc	%l6, -0xe54, %o4
	.word	0x85a049a5	! t0_kref+0x2ad4:   	fdivs	%f1, %f5, %f2
	.word	0x39800004	! t0_kref+0x2ad8:   	fbuge,a	_kref+0x2ae8
	.word	0x85a04d23	! t0_kref+0x2adc:   	fsmuld	%f1, %f3, %f2
	.word	0x907dafa6	! t0_kref+0x2ae0:   	sdiv	%l6, 0xfa6, %o0
	.word	0x81a88ac0	! t0_kref+0x2ae4:   	fcmped	%fcc0, %f2, %f0
	.word	0x9045f5f5	! t0_kref+0x2ae8:   	addc	%l7, -0xa0b, %o0
	.word	0x92bdc016	! t0_kref+0x2aec:   	xnorcc	%l7, %l6, %o1
	.word	0xc006401c	! t0_kref+0x2af0:   	ld	[%i1 + %i4], %g0
	.word	0x80a5c016	! t0_kref+0x2af4:   	cmp	%l7, %l6
	.word	0xcd1f4018	! t0_kref+0x2af8:   	ldd	[%i5 + %i0], %f6
	.word	0x98e5b194	! t0_kref+0x2afc:   	subccc	%l6, -0xe6c, %o4
	.word	0x9025fef6	! t0_kref+0x2b00:   	sub	%l7, -0x10a, %o0
	.word	0x8da00942	! t0_kref+0x2b04:   	fmuld	%f0, %f2, %f6
	.word	0x8da00022	! t0_kref+0x2b08:   	fmovs	%f2, %f6
	.word	0xf36e6018	! t0_kref+0x2b0c:   	prefetch	%i1 + 0x18, 25
	.word	0xf96e401c	! t0_kref+0x2b10:   	prefetch	%i1 + %i4, 28
	.word	0x923dec07	! t0_kref+0x2b14:   	xnor	%l7, 0xc07, %o1
	.word	0xcba71019	! t0_kref+0x2b18:   	sta	%f5, [%i4 + %i1]0x80
	.word	0x89a01048	! t0_kref+0x2b1c:   	fdtox	%f8, %f4
	.word	0xc807bff0	! t0_kref+0x2b20:   	ld	[%fp - 0x10], %g4
	.word	0x9a45f682	! t0_kref+0x2b24:   	addc	%l7, -0x97e, %o5
	.word	0x87a0c9a8	! t0_kref+0x2b28:   	fdivs	%f3, %f8, %f3
	.word	0x27800008	! t0_kref+0x2b2c:   	fbul,a	_kref+0x2b4c
	.word	0x99400000	! t0_kref+0x2b30:   	mov	%y, %o4
	.word	0x81a00942	! t0_kref+0x2b34:   	fmuld	%f0, %f2, %f0
	.word	0xda063ffc	! t0_kref+0x2b38:   	ld	[%i0 - 4], %o5
	.word	0xd11e7fe8	! t0_kref+0x2b3c:   	ldd	[%i1 - 0x18], %f8
	.word	0x8ba018c0	! t0_kref+0x2b40:   	fdtos	%f0, %f5
	.word	0x93a000a4	! t0_kref+0x2b44:   	fnegs	%f4, %f9
	.word	0x2b800005	! t0_kref+0x2b48:   	fbug,a	_kref+0x2b5c
	.word	0x8da01921	! t0_kref+0x2b4c:   	fstod	%f1, %f6
	.word	0x2b800008	! t0_kref+0x2b50:   	fbug,a	_kref+0x2b70
	.word	0x85a01885	! t0_kref+0x2b54:   	fitos	%f5, %f2
	.word	0x96f5ffb7	! t0_kref+0x2b58:   	udivcc	%l7, -0x49, %o3
	.word	0xd11fbcf0	! t0_kref+0x2b5c:   	ldd	[%fp - 0x310], %f8
	.word	0x9235f763	! t0_kref+0x2b60:   	orn	%l7, -0x89d, %o1
	.word	0x93a189a3	! t0_kref+0x2b64:   	fdivs	%f6, %f3, %f9
	.word	0xd300a028	! t0_kref+0x2b68:   	ld	[%g2 + 0x28], %f9
	call	SYM(t0_subr2)
	.word	0xe8981018	! t0_kref+0x2b70:   	ldda	[%g0 + %i0]0x80, %l4
	.word	0xe87e200c	! t0_kref+0x2b74:   	swap	[%i0 + 0xc], %l4
	sethi	%hi(2f), %o7
	.word	0xe40be3c0	! t0_kref+0x2b7c:   	ldub	[%o7 + 0x3c0], %l2
	.word	0xa41ca00c	! t0_kref+0x2b80:   	xor	%l2, 0xc, %l2
	.word	0xe42be3c0	! t0_kref+0x2b84:   	stb	%l2, [%o7 + 0x3c0]
	.word	0x81dbe3c0	! t0_kref+0x2b88:   	flush	%o7 + 0x3c0
	.word	0x91a10946	! t0_kref+0x2b8c:   	fmuld	%f4, %f6, %f8
	.word	0xd24e001a	! t0_kref+0x2b90:   	ldsb	[%i0 + %i2], %o1
	.word	0x9075e9d8	! t0_kref+0x2b94:   	udiv	%l7, 0x9d8, %o0
	.word	0x803d8016	! t0_kref+0x2b98:   	xnor	%l6, %l6, %g0
	.word	0xc568a049	! t0_kref+0x2b9c:   	prefetch	%g2 + 0x49, 2
	.word	0x89a000a2	! t0_kref+0x2ba0:   	fnegs	%f2, %f4
	.word	0x9425bd91	! t0_kref+0x2ba4:   	sub	%l6, -0x26f, %o2
	.word	0x35800005	! t0_kref+0x2ba8:   	fbue,a	_kref+0x2bbc
	.word	0x87a8c025	! t0_kref+0x2bac:   	fmovsul	%fcc0, %f5, %f3
	.word	0x87a00025	! t0_kref+0x2bb0:   	fmovs	%f5, %f3
	.word	0xcd3e0000	! t0_kref+0x2bb4:   	std	%f6, [%i0]
	.word	0x9095c016	! t0_kref+0x2bb8:   	orcc	%l7, %l6, %o0
	.word	0x90ad8016	! t0_kref+0x2bbc:   	andncc	%l6, %l6, %o0
2:	.word	0x9445a147	! t0_kref+0x2bc0:   	addc	%l6, 0x147, %o2
	.word	0x91a01a23	! t0_kref+0x2bc4:   	fstoi	%f3, %f8
	.word	0x170a3e0b	! t0_kref+0x2bc8:   	sethi	%hi(0x28f82c00), %o3
	.word	0x3b800008	! t0_kref+0x2bcc:   	fble,a	_kref+0x2bec
	.word	0xee6e8018	! t0_kref+0x2bd0:   	ldstub	[%i2 + %i0], %l7
	.word	0x9495c016	! t0_kref+0x2bd4:   	orcc	%l7, %l6, %o2
	.word	0x808dc016	! t0_kref+0x2bd8:   	btst	%l6, %l7
	.word	0xc19eda58	! t0_kref+0x2bdc:   	ldda	[%i3 + %i0]0xd2, %f0
	.word	0xcb200018	! t0_kref+0x2be0:   	st	%f5, [%g0 + %i0]
	.word	0xee20a010	! t0_kref+0x2be4:   	st	%l7, [%g2 + 0x10]
	.word	0xd816c019	! t0_kref+0x2be8:   	lduh	[%i3 + %i1], %o4
	.word	0x91a01906	! t0_kref+0x2bec:   	fitod	%f6, %f8
	.word	0x805dae42	! t0_kref+0x2bf0:   	smul	%l6, 0xe42, %g0
	.word	0x85a188c8	! t0_kref+0x2bf4:   	fsubd	%f6, %f8, %f2
	.word	0x81a98a21	! t0_kref+0x2bf8:   	fcmps	%fcc0, %f6, %f1
	.word	0x9ea5be99	! t0_kref+0x2bfc:   	subcc	%l6, -0x167, %o7
	.word	0x91a088c2	! t0_kref+0x2c00:   	fsubd	%f2, %f2, %f8
	.word	0x9ab5e5af	! t0_kref+0x2c04:   	orncc	%l7, 0x5af, %o5
	.word	0xf96e6010	! t0_kref+0x2c08:   	prefetch	%i1 + 0x10, 28
	.word	0x9535a005	! t0_kref+0x2c0c:   	srl	%l6, 0x5, %o2
	.word	0x93a089a8	! t0_kref+0x2c10:   	fdivs	%f2, %f8, %f9
	.word	0x9ee58016	! t0_kref+0x2c14:   	subccc	%l6, %l6, %o7
	.word	0x91a008c8	! t0_kref+0x2c18:   	fsubd	%f0, %f8, %f8
	.word	0x81700017	! t0_kref+0x2c1c:   	popc	%l7, %g0
	.word	0x8185c000	! t0_kref+0x2c20:   	wr	%l7, %g0, %y
	.word	0x8143e040	! t0_kref+0x2c24:   	membar	0x40
	.word	0x8143e040	! t0_kref+0x2c28:   	membar	0x40
	.word	0x9095bf97	! t0_kref+0x2c2c:   	orcc	%l6, -0x69, %o0
	.word	0x953da009	! t0_kref+0x2c30:   	sra	%l6, 0x9, %o2
	.word	0x9addc016	! t0_kref+0x2c34:   	smulcc	%l7, %l6, %o5
	.word	0x87a0c9a2	! t0_kref+0x2c38:   	fdivs	%f3, %f2, %f3
	.word	0xee366016	! t0_kref+0x2c3c:   	sth	%l7, [%i1 + 0x16]
	.word	0x89a000a2	! t0_kref+0x2c40:   	fnegs	%f2, %f4
	.word	0xec26201c	! t0_kref+0x2c44:   	st	%l6, [%i0 + 0x1c]
	.word	0x9225c016	! t0_kref+0x2c48:   	sub	%l7, %l6, %o1
	.word	0x941d8016	! t0_kref+0x2c4c:   	xor	%l6, %l6, %o2
	.word	0x9335e007	! t0_kref+0x2c50:   	srl	%l7, 0x7, %o1
	.word	0xea6e3ff8	! t0_kref+0x2c54:   	ldstub	[%i0 - 8], %l5
	.word	0x85a00048	! t0_kref+0x2c58:   	fmovd	%f8, %f2
	.word	0xc51fbdc8	! t0_kref+0x2c5c:   	ldd	[%fp - 0x238], %f2
	.word	0x8610201b	! t0_kref+0x2c60:   	mov	0x1b, %g3
	.word	0x86a0e001	! t0_kref+0x2c64:   	subcc	%g3, 1, %g3
	.word	0x22800019	! t0_kref+0x2c68:   	be,a	_kref+0x2ccc
	.word	0x9b3da018	! t0_kref+0x2c6c:   	sra	%l6, 0x18, %o5
	.word	0x91418000	! t0_kref+0x2c70:   	mov	%fprs, %o0
	.word	0x9735e01e	! t0_kref+0x2c74:   	srl	%l7, 0x1e, %o3
	.word	0x85a01a20	! t0_kref+0x2c78:   	fstoi	%f0, %f2
	.word	0xe8680019	! t0_kref+0x2c7c:   	ldstub	[%g0 + %i1], %l4
	.word	0x81a9caa3	! t0_kref+0x2c80:   	fcmpes	%fcc0, %f7, %f3
	.word	0x9a9df29f	! t0_kref+0x2c84:   	xorcc	%l7, -0xd61, %o5
	.word	0x99258016	! t0_kref+0x2c88:   	mulscc	%l6, %l6, %o4
	.word	0x87a0c9a5	! t0_kref+0x2c8c:   	fdivs	%f3, %f5, %f3
	.word	0x9aa58017	! t0_kref+0x2c90:   	subcc	%l6, %l7, %o5
	.word	0x989db4e8	! t0_kref+0x2c94:   	xorcc	%l6, -0xb18, %o4
	.word	0x8da00140	! t0_kref+0x2c98:   	fabsd	%f0, %f6
	.word	0x81a01908	! t0_kref+0x2c9c:   	fitod	%f8, %f0
	.word	0x8ba018c2	! t0_kref+0x2ca0:   	fdtos	%f2, %f5
	.word	0x992de002	! t0_kref+0x2ca4:   	sll	%l7, 0x2, %o4
	.word	0x81aa4a25	! t0_kref+0x2ca8:   	fcmps	%fcc0, %f9, %f5
	.word	0xc53e2018	! t0_kref+0x2cac:   	std	%f2, [%i0 + 0x18]
	.word	0x9065ee4d	! t0_kref+0x2cb0:   	subc	%l7, 0xe4d, %o0
	.word	0x960d8016	! t0_kref+0x2cb4:   	and	%l6, %l6, %o3
	.word	0x81aa0ac8	! t0_kref+0x2cb8:   	fcmped	%fcc0, %f8, %f8
	.word	0xe968a006	! t0_kref+0x2cbc:   	prefetch	%g2 + 6, 20
	.word	0xc0ee9019	! t0_kref+0x2cc0:   	ldstuba	[%i2 + %i1]0x80, %g0
	.word	0x81a90a22	! t0_kref+0x2cc4:   	fcmps	%fcc0, %f4, %f2
	.word	0x9695aa14	! t0_kref+0x2cc8:   	orcc	%l6, 0xa14, %o3
	.word	0xe01e7fe0	! t0_kref+0x2ccc:   	ldd	[%i1 - 0x20], %l0
	sethi	%hi(2f), %o7
	.word	0xe40be110	! t0_kref+0x2cd4:   	ldub	[%o7 + 0x110], %l2
	.word	0xa41ca00c	! t0_kref+0x2cd8:   	xor	%l2, 0xc, %l2
	.word	0xe42be110	! t0_kref+0x2cdc:   	stb	%l2, [%o7 + 0x110]
	.word	0x81dbe110	! t0_kref+0x2ce0:   	flush	%o7 + 0x110
	.word	0xd4df5019	! t0_kref+0x2ce4:   	ldxa	[%i5 + %i1]0x80, %o2
	.word	0x905d8017	! t0_kref+0x2ce8:   	smul	%l6, %l7, %o0
	.word	0xd11fbc58	! t0_kref+0x2cec:   	ldd	[%fp - 0x3a8], %f8
	.word	0x91a20d21	! t0_kref+0x2cf0:   	fsmuld	%f8, %f1, %f8
	.word	0xc9264000	! t0_kref+0x2cf4:   	st	%f4, [%i1]
	.word	0x89a01924	! t0_kref+0x2cf8:   	fstod	%f4, %f4
	.word	0x908dc016	! t0_kref+0x2cfc:   	andcc	%l7, %l6, %o0
	.word	0xc13e7ff0	! t0_kref+0x2d00:   	std	%f0, [%i1 - 0x10]
	.word	0x98bdfa85	! t0_kref+0x2d04:   	xnorcc	%l7, -0x57b, %o4
	.word	0xc11fbe20	! t0_kref+0x2d08:   	ldd	[%fp - 0x1e0], %f0
	.word	0xc5266008	! t0_kref+0x2d0c:   	st	%f2, [%i1 + 8]
2:	.word	0xee263fe4	! t0_kref+0x2d10:   	st	%l7, [%i0 - 0x1c]
	.word	0xd43e3fe8	! t0_kref+0x2d14:   	std	%o2, [%i0 - 0x18]
	.word	0x91a00025	! t0_kref+0x2d18:   	fmovs	%f5, %f8
	.word	0x81a80aa6	! t0_kref+0x2d1c:   	fcmpes	%fcc0, %f0, %f6
	.word	0xee367ffa	! t0_kref+0x2d20:   	sth	%l7, [%i1 - 6]
	.word	0x85a01928	! t0_kref+0x2d24:   	fstod	%f8, %f2
	.word	0xd65e0000	! t0_kref+0x2d28:   	ldx	[%i0], %o3
	.word	0xd82839ab	! t0_kref+0x2d2c:   	stb	%o4, [%g0 - 0x655]
	.word	0x93a00824	! t0_kref+0x2d30:   	fadds	%f0, %f4, %f9
	.word	0x1b0f781c	! t0_kref+0x2d34:   	sethi	%hi(0x3de07000), %o5
	.word	0x8ba00028	! t0_kref+0x2d38:   	fmovs	%f8, %f5
	.word	0xd6066004	! t0_kref+0x2d3c:   	ld	[%i1 + 4], %o3
	.word	0x89a01040	! t0_kref+0x2d40:   	fdtox	%f0, %f4
	.word	0xec28a03b	! t0_kref+0x2d44:   	stb	%l6, [%g2 + 0x3b]
	.word	0x81a009a0	! t0_kref+0x2d48:   	fdivs	%f0, %f0, %f0
	.word	0xe3e61016	! t0_kref+0x2d4c:   	casa	[%i0]0x80, %l6, %l1
	.word	0xdbe61017	! t0_kref+0x2d50:   	casa	[%i0]0x80, %l7, %o5
	.word	0x91a00948	! t0_kref+0x2d54:   	fmuld	%f0, %f8, %f8
	sethi	%hi(1f), %o7
	jmpl	%o7+%lo(1f), %g1
	.empty
	.word	0x925df829	! t0_kref+0x2d60:   	smul	%l7, -0x7d7, %o1
	.word	0x80c5fde7	! t0_kref+0x2d64:   	addccc	%l7, -0x219, %g0
	.word	0xee367fe8	! t0_kref+0x2d68:   	sth	%l7, [%i1 - 0x18]
	.word	0x8143c000	! t0_kref+0x2d6c:   	stbar
	.word	0x98adf4c0	! t0_kref+0x2d70:   	andncc	%l7, -0xb40, %o4
	.word	0x81a01921	! t0_kref+0x2d74:   	fstod	%f1, %f0
1:	.word	0xe8780018	! t0_kref+0x2d78:   	swap	[%g0 + %i0], %l4
	.word	0x8fa000a0	! t0_kref+0x2d7c:   	fnegs	%f0, %f7
	.word	0xc7ee1016	! t0_kref+0x2d80:   	prefetcha	%i0 + %l6, 3
	.word	0x813d8016	! t0_kref+0x2d84:   	sra	%l6, %l6, %g0
	.word	0x9205a134	! t0_kref+0x2d88:   	add	%l6, 0x134, %o1
	.word	0x985d8016	! t0_kref+0x2d8c:   	smul	%l6, %l6, %o4
	.word	0xd1067ff0	! t0_kref+0x2d90:   	ld	[%i1 - 0x10], %f8
	.word	0x85a00948	! t0_kref+0x2d94:   	fmuld	%f0, %f8, %f2
	.word	0x81a80ac2	! t0_kref+0x2d98:   	fcmped	%fcc0, %f0, %f2
	.word	0x9a45b789	! t0_kref+0x2d9c:   	addc	%l6, -0x877, %o5
	.word	0xc19f1a59	! t0_kref+0x2da0:   	ldda	[%i4 + %i1]0xd2, %f0
	.word	0x9ac5c016	! t0_kref+0x2da4:   	addccc	%l7, %l6, %o5
	.word	0x8da00842	! t0_kref+0x2da8:   	faddd	%f0, %f2, %f6
	.word	0xc9be1a5d	! t0_kref+0x2dac:   	stda	%f4, [%i0 + %i5]0xd2
	.word	0xe83e3ff0	! t0_kref+0x2db0:   	std	%l4, [%i0 - 0x10]
	.word	0x9f40c000	! t0_kref+0x2db4:   	mov	%asi, %o7
	.word	0x81a88aa0	! t0_kref+0x2db8:   	fcmpes	%fcc0, %f2, %f0
	.word	0xc9be5896	! t0_kref+0x2dbc:   	stda	%f4, [%i1 + %l6]0xc4
	.word	0x9a65c017	! t0_kref+0x2dc0:   	subc	%l7, %l7, %o5
	.word	0xe40860b0	! t0_kref+0x2dc4:   	ldub	[%g1 + 0xb0], %l2
	.word	0xa41ca00c	! t0_kref+0x2dc8:   	xor	%l2, 0xc, %l2
	.word	0xe42860b0	! t0_kref+0x2dcc:   	stb	%l2, [%g1 + 0xb0]
	.word	0x81d860b0	! t0_kref+0x2dd0:   	flush	%g1 + 0xb0
	.word	0xc9be9a18	! t0_kref+0x2dd4:   	stda	%f4, [%i2 + %i0]0xd0
	.word	0xcd1e001d	! t0_kref+0x2dd8:   	ldd	[%i0 + %i5], %f6
	.word	0xc13e4000	! t0_kref+0x2ddc:   	std	%f0, [%i1]
	.word	0xcd3e0000	! t0_kref+0x2de0:   	std	%f6, [%i0]
	.word	0xe56e6000	! t0_kref+0x2de4:   	prefetch	%i1, 18
	.word	0x11310c59	! t0_kref+0x2de8:   	sethi	%hi(0xc4316400), %o0
	.word	0x93a00022	! t0_kref+0x2dec:   	fmovs	%f2, %f9
	.word	0xe83e7ff0	! t0_kref+0x2df0:   	std	%l4, [%i1 - 0x10]
	.word	0xd07e201c	! t0_kref+0x2df4:   	swap	[%i0 + 0x1c], %o0
	.word	0xde4e8018	! t0_kref+0x2df8:   	ldsb	[%i2 + %i0], %o7
	.word	0x8065a842	! t0_kref+0x2dfc:   	subc	%l6, 0x842, %g0
	.word	0x8d858017	! t0_kref+0x2e00:   	wr	%l6, %l7, %fprs
	.word	0xd83e2000	! t0_kref+0x2e04:   	std	%o4, [%i0]
	.word	0x81dd4000	! t0_kref+0x2e08:   	flush	%l5
2:	.word	0x9e958017	! t0_kref+0x2e0c:   	orcc	%l6, %l7, %o7
	.word	0x8095e59b	! t0_kref+0x2e10:   	orcc	%l7, 0x59b, %g0
	.word	0xecae9019	! t0_kref+0x2e14:   	stba	%l6, [%i2 + %i1]0x80
	.word	0x81dc7ce3	! t0_kref+0x2e18:   	flush	%l1 - 0x31d
	.word	0xd6c01018	! t0_kref+0x2e1c:   	ldswa	[%g0 + %i0]0x80, %o3
	.word	0x93a149a5	! t0_kref+0x2e20:   	fdivs	%f5, %f5, %f9
	.word	0xd24e001a	! t0_kref+0x2e24:   	ldsb	[%i0 + %i2], %o1
	.word	0x85a01901	! t0_kref+0x2e28:   	fitod	%f1, %f2
	.word	0x9ec5b6f0	! t0_kref+0x2e2c:   	addccc	%l6, -0x910, %o7
	.word	0x93400000	! t0_kref+0x2e30:   	mov	%y, %o1
	.word	0xcd00a000	! t0_kref+0x2e34:   	ld	[%g2], %f6
	.word	0x878020d0	! t0_kref+0x2e38:   	mov	0xd0, %asi
	.word	0xd83e0000	! t0_kref+0x2e3c:   	std	%o4, [%i0]
	.word	0xe81f4018	! t0_kref+0x2e40:   	ldd	[%i5 + %i0], %l4
	.word	0x80258016	! t0_kref+0x2e44:   	sub	%l6, %l6, %g0
	.word	0x9eadf689	! t0_kref+0x2e48:   	andncc	%l7, -0x977, %o7
	.word	0xec300018	! t0_kref+0x2e4c:   	sth	%l6, [%g0 + %i0]
	.word	0x87a149a8	! t0_kref+0x2e50:   	fdivs	%f5, %f8, %f3
	.word	0x9255b964	! t0_kref+0x2e54:   	umul	%l6, -0x69c, %o1
	.word	0xc19f5a59	! t0_kref+0x2e58:   	ldda	[%i5 + %i1]0xd2, %f0
	.word	0xec2e8018	! t0_kref+0x2e5c:   	stb	%l6, [%i2 + %i0]
	.word	0x9fc10000	! t0_kref+0x2e60:   	call	%g4
	.word	0xd03e001d	! t0_kref+0x2e64:   	std	%o0, [%i0 + %i5]
	.word	0x9865c017	! t0_kref+0x2e68:   	subc	%l7, %l7, %o4
	.word	0xd1be1817	! t0_kref+0x2e6c:   	stda	%f8, [%i0 + %l7]0xc0
	.word	0x89a188c2	! t0_kref+0x2e70:   	fsubd	%f6, %f2, %f4
	.word	0x9865c016	! t0_kref+0x2e74:   	subc	%l7, %l6, %o4
	.word	0xd19e5a5b	! t0_kref+0x2e78:   	ldda	[%i1 + %i3]0xd2, %f8
	.word	0x96e5bb1d	! t0_kref+0x2e7c:   	subccc	%l6, -0x4e3, %o3
	.word	0x90b5c016	! t0_kref+0x2e80:   	orncc	%l7, %l6, %o0
	.word	0xd040a02c	! t0_kref+0x2e84:   	ldsw	[%g2 + 0x2c], %o0
	sethi	%hi(2f), %o7
	.word	0xe40be2a4	! t0_kref+0x2e8c:   	ldub	[%o7 + 0x2a4], %l2
	.word	0xa41ca00c	! t0_kref+0x2e90:   	xor	%l2, 0xc, %l2
	.word	0xe42be2a4	! t0_kref+0x2e94:   	stb	%l2, [%o7 + 0x2a4]
	.word	0x81dbe2a4	! t0_kref+0x2e98:   	flush	%o7 + 0x2a4
	.word	0x90958017	! t0_kref+0x2e9c:   	orcc	%l6, %l7, %o0
	.word	0x9a758017	! t0_kref+0x2ea0:   	udiv	%l6, %l7, %o5
2:	.word	0xd83e2018	! t0_kref+0x2ea4:   	std	%o4, [%i0 + 0x18]
	.word	0x9aadc017	! t0_kref+0x2ea8:   	andncc	%l7, %l7, %o5
	.word	0x90bda156	! t0_kref+0x2eac:   	xnorcc	%l6, 0x156, %o0
	.word	0xd0163ff6	! t0_kref+0x2eb0:   	lduh	[%i0 - 0xa], %o0
	.word	0x933dc016	! t0_kref+0x2eb4:   	sra	%l7, %l6, %o1
	.word	0x9e25c016	! t0_kref+0x2eb8:   	sub	%l7, %l6, %o7
	.word	0x94c5c016	! t0_kref+0x2ebc:   	addccc	%l7, %l6, %o2
	.word	0x85a00842	! t0_kref+0x2ec0:   	faddd	%f0, %f2, %f2
	.word	0x9665b69c	! t0_kref+0x2ec4:   	subc	%l6, -0x964, %o3
	.word	0xd408a007	! t0_kref+0x2ec8:   	ldub	[%g2 + 7], %o2
	.word	0x89a08940	! t0_kref+0x2ecc:   	fmuld	%f2, %f0, %f4
	.word	0xc19f5a59	! t0_kref+0x2ed0:   	ldda	[%i5 + %i1]0xd2, %f0
	.word	0xc91fbf60	! t0_kref+0x2ed4:   	ldd	[%fp - 0xa0], %f4
	sethi	%hi(2f), %o7
	.word	0xe40be308	! t0_kref+0x2edc:   	ldub	[%o7 + 0x308], %l2
	.word	0xa41ca00c	! t0_kref+0x2ee0:   	xor	%l2, 0xc, %l2
	.word	0xe42be308	! t0_kref+0x2ee4:   	stb	%l2, [%o7 + 0x308]
	.word	0x81dbe308	! t0_kref+0x2ee8:   	flush	%o7 + 0x308
	.word	0x9abd8017	! t0_kref+0x2eec:   	xnorcc	%l6, %l7, %o5
	.word	0xec3f4019	! t0_kref+0x2ef0:   	std	%l6, [%i5 + %i1]
	.word	0x83a01882	! t0_kref+0x2ef4:   	fitos	%f2, %f1
	.word	0xc5263fe4	! t0_kref+0x2ef8:   	st	%f2, [%i0 - 0x1c]
	.word	0xec2e201e	! t0_kref+0x2efc:   	stb	%l6, [%i0 + 0x1e]
	.word	0xd19f5a58	! t0_kref+0x2f00:   	ldda	[%i5 + %i0]0xd2, %f8
	.word	0x9e75c017	! t0_kref+0x2f04:   	udiv	%l7, %l7, %o7
2:	.word	0x953dc017	! t0_kref+0x2f08:   	sra	%l7, %l7, %o2
	.word	0x89a000a4	! t0_kref+0x2f0c:   	fnegs	%f4, %f4
	.word	0x90758016	! t0_kref+0x2f10:   	udiv	%l6, %l6, %o0
	.word	0x91a10946	! t0_kref+0x2f14:   	fmuld	%f4, %f6, %f8
	.word	0x91a20946	! t0_kref+0x2f18:   	fmuld	%f8, %f6, %f8
	.word	0x8da089a4	! t0_kref+0x2f1c:   	fdivs	%f2, %f4, %f6
	.word	0xe8bf5019	! t0_kref+0x2f20:   	stda	%l4, [%i5 + %i1]0x80
	.word	0x83a01a28	! t0_kref+0x2f24:   	fstoi	%f8, %f1
	.word	0x9045b6c2	! t0_kref+0x2f28:   	addc	%l6, -0x93e, %o0
	.word	0xeea65000	! t0_kref+0x2f2c:   	sta	%l7, [%i1]0x80
	.word	0xe408620c	! t0_kref+0x2f30:   	ldub	[%g1 + 0x20c], %l2
	.word	0xa41ca00c	! t0_kref+0x2f34:   	xor	%l2, 0xc, %l2
	.word	0xe428620c	! t0_kref+0x2f38:   	stb	%l2, [%g1 + 0x20c]
	.word	0x81d8620c	! t0_kref+0x2f3c:   	flush	%g1 + 0x20c
	.word	0x9ac5f53a	! t0_kref+0x2f40:   	addccc	%l7, -0xac6, %o5
	.word	0x98358017	! t0_kref+0x2f44:   	orn	%l6, %l7, %o4
	.word	0xd210a018	! t0_kref+0x2f48:   	lduh	[%g2 + 0x18], %o1
	.word	0xc1be5816	! t0_kref+0x2f4c:   	stda	%f0, [%i1 + %l6]0xc0
	.word	0x83a01a28	! t0_kref+0x2f50:   	fstoi	%f8, %f1
	.word	0x91a01a46	! t0_kref+0x2f54:   	fdtoi	%f6, %f8
	.word	0x9e0d8017	! t0_kref+0x2f58:   	and	%l6, %l7, %o7
	.word	0x9a35f7ff	! t0_kref+0x2f5c:   	orn	%l7, -0x801, %o5
	.word	0x13185d54	! t0_kref+0x2f60:   	sethi	%hi(0x61755000), %o1
	.word	0x8da08944	! t0_kref+0x2f64:   	fmuld	%f2, %f4, %f6
2:	.word	0xded01018	! t0_kref+0x2f68:   	ldsha	[%g0 + %i0]0x80, %o7
	.word	0xc13f4018	! t0_kref+0x2f6c:   	std	%f0, [%i5 + %i0]
	.word	0x9425b82e	! t0_kref+0x2f70:   	sub	%l6, -0x7d2, %o2
	.word	0x92f5c017	! t0_kref+0x2f74:   	udivcc	%l7, %l7, %o1
	.word	0xd4164000	! t0_kref+0x2f78:   	lduh	[%i1], %o2
	.word	0x81dc3113	! t0_kref+0x2f7c:   	flush	%l0 - 0xeed
	.word	0xd606001c	! t0_kref+0x2f80:   	ld	[%i0 + %i4], %o3
	.word	0x9f2de000	! t0_kref+0x2f84:   	sll	%l7, 0x0, %o7
	.word	0x9895ae41	! t0_kref+0x2f88:   	orcc	%l6, 0xe41, %o4
	.word	0x2d800006	! t0_kref+0x2f8c:   	fbg,a	_kref+0x2fa4
	.word	0x92a5ff20	! t0_kref+0x2f90:   	subcc	%l7, -0xe0, %o1
	.word	0x9ae5c017	! t0_kref+0x2f94:   	subccc	%l7, %l7, %o5
	.word	0x970dbc9d	! t0_kref+0x2f98:   	tsubcc	%l6, -0x363, %o3
	.word	0x920db213	! t0_kref+0x2f9c:   	and	%l6, -0xded, %o1
	.word	0x9435ebb0	! t0_kref+0x2fa0:   	orn	%l7, 0xbb0, %o2
	.word	0xd27e3ff8	! t0_kref+0x2fa4:   	swap	[%i0 - 8], %o1
	.word	0xd6064000	! t0_kref+0x2fa8:   	ld	[%i1], %o3
	.word	0xd100a02c	! t0_kref+0x2fac:   	ld	[%g2 + 0x2c], %f8
	.word	0x8bab0023	! t0_kref+0x2fb0:   	fmovsuge	%fcc0, %f3, %f5
	.word	0x9fc00004	! t0_kref+0x2fb4:   	call	%g0 + %g4
	.word	0x99700017	! t0_kref+0x2fb8:   	popc	%l7, %o4
	.word	0x9445e6a2	! t0_kref+0x2fbc:   	addc	%l7, 0x6a2, %o2
	.word	0xf9ee501b	! t0_kref+0x2fc0:   	prefetcha	%i1 + %i3, 28
	.word	0xe1f61017	! t0_kref+0x2fc4:   	casxa	[%i0]0x80, %l7, %l0
	.word	0xd448a025	! t0_kref+0x2fc8:   	ldsb	[%g2 + 0x25], %o2
	.word	0xee7f0019	! t0_kref+0x2fcc:   	swap	[%i4 + %i1], %l7
	.word	0x9b35a00e	! t0_kref+0x2fd0:   	srl	%l6, 0xe, %o5
	.word	0x8ba089a4	! t0_kref+0x2fd4:   	fdivs	%f2, %f4, %f5
	.word	0x940db6aa	! t0_kref+0x2fd8:   	and	%l6, -0x956, %o2
	.word	0x98a5c017	! t0_kref+0x2fdc:   	subcc	%l7, %l7, %o4
	.word	0xc100a008	! t0_kref+0x2fe0:   	ld	[%g2 + 8], %f0
	.word	0x913da007	! t0_kref+0x2fe4:   	sra	%l6, 0x7, %o0
	.word	0xee36401b	! t0_kref+0x2fe8:   	sth	%l7, [%i1 + %i3]
	.word	0xc1be5817	! t0_kref+0x2fec:   	stda	%f0, [%i1 + %l7]0xc0
	.word	0xc040a008	! t0_kref+0x2ff0:   	ldsw	[%g2 + 8], %g0
	.word	0xee36001b	! t0_kref+0x2ff4:   	sth	%l7, [%i0 + %i3]
	call	1f
	.empty
	.word	0xf76e6010	! t0_kref+0x2ffc:   	prefetch	%i1 + 0x10, 27
1:	.word	0x83a01a23	! t0_kref+0x3000:   	fstoi	%f3, %f1
	.word	0x9525eaad	! t0_kref+0x3004:   	mulscc	%l7, 0xaad, %o2
	.word	0x98258017	! t0_kref+0x3008:   	sub	%l6, %l7, %o4
	.word	0x9525a30a	! t0_kref+0x300c:   	mulscc	%l6, 0x30a, %o2
	.word	0xcf266008	! t0_kref+0x3010:   	st	%f7, [%i1 + 8]
	.word	0x8095a2d4	! t0_kref+0x3014:   	orcc	%l6, 0x2d4, %g0
	.word	0x92658017	! t0_kref+0x3018:   	subc	%l6, %l7, %o1
	.word	0x92a5c017	! t0_kref+0x301c:   	subcc	%l7, %l7, %o1
	.word	0x8185c000	! t0_kref+0x3020:   	wr	%l7, %g0, %y
	.word	0x905dfeb7	! t0_kref+0x3024:   	smul	%l7, -0x149, %o0
	.word	0xd11fbcf8	! t0_kref+0x3028:   	ldd	[%fp - 0x308], %f8
	.word	0xc368a081	! t0_kref+0x302c:   	prefetch	%g2 + 0x81, 1
	.word	0x81aa4a20	! t0_kref+0x3030:   	fcmps	%fcc0, %f9, %f0
	.word	0x9fc00004	! t0_kref+0x3034:   	call	%g0 + %g4
	.word	0x9a9dc016	! t0_kref+0x3038:   	xorcc	%l7, %l6, %o5
	.word	0xc93e3fe0	! t0_kref+0x303c:   	std	%f4, [%i0 - 0x20]
	.word	0x878020d0	! t0_kref+0x3040:   	mov	0xd0, %asi
	.word	0x98bdc016	! t0_kref+0x3044:   	xnorcc	%l7, %l6, %o4
	.word	0x9e95c016	! t0_kref+0x3048:   	orcc	%l7, %l6, %o7
	.word	0xec364000	! t0_kref+0x304c:   	sth	%l6, [%i1]
	.word	0xd11fbd50	! t0_kref+0x3050:   	ldd	[%fp - 0x2b0], %f8
	.word	0x98dd8016	! t0_kref+0x3054:   	smulcc	%l6, %l6, %o4
	.word	0x81da772b	! t0_kref+0x3058:   	flush	%o1 - 0x8d5
	.word	0xc4183488	! t0_kref+0x305c:   	ldd	[%g0 - 0xb78], %g2
	.word	0xd83e6018	! t0_kref+0x3060:   	std	%o4, [%i1 + 0x18]
	.word	0xec36001b	! t0_kref+0x3064:   	sth	%l6, [%i0 + %i3]
	sethi	%hi(2f), %o7
	.word	0xe40be0b8	! t0_kref+0x306c:   	ldub	[%o7 + 0xb8], %l2
	.word	0xa41ca00c	! t0_kref+0x3070:   	xor	%l2, 0xc, %l2
	.word	0xe42be0b8	! t0_kref+0x3074:   	stb	%l2, [%o7 + 0xb8]
	.word	0x81dbe0b8	! t0_kref+0x3078:   	flush	%o7 + 0xb8
	.word	0x3f800004	! t0_kref+0x307c:   	fbo,a	_kref+0x308c
	.word	0xd44e0000	! t0_kref+0x3080:   	ldsb	[%i0], %o2
	.word	0x9875c016	! t0_kref+0x3084:   	udiv	%l7, %l6, %o4
	.word	0x31800003	! t0_kref+0x3088:   	fba,a	_kref+0x3094
	.word	0x85a01924	! t0_kref+0x308c:   	fstod	%f4, %f2
	.word	0x81a01a28	! t0_kref+0x3090:   	fstoi	%f8, %f0
	.word	0xefee101a	! t0_kref+0x3094:   	prefetcha	%i0 + %i2, 23
	.word	0x8143c000	! t0_kref+0x3098:   	stbar
	.word	0x908dc016	! t0_kref+0x309c:   	andcc	%l7, %l6, %o0
	.word	0x9f35e018	! t0_kref+0x30a0:   	srl	%l7, 0x18, %o7
	.word	0xd600a030	! t0_kref+0x30a4:   	ld	[%g2 + 0x30], %o3
	.word	0x87a0c9a3	! t0_kref+0x30a8:   	fdivs	%f3, %f3, %f3
	.word	0x81a18d29	! t0_kref+0x30ac:   	fsmuld	%f6, %f9, %f0
	.word	0x9ed58017	! t0_kref+0x30b0:   	umulcc	%l6, %l7, %o7
	.word	0x8da109c2	! t0_kref+0x30b4:   	fdivd	%f4, %f2, %f6
2:	.word	0xa0f5c017	! t0_kref+0x30b8:   	udivcc	%l7, %l7, %l0
	.word	0x9e658016	! t0_kref+0x30bc:   	subc	%l6, %l6, %o7
	.word	0xd0df5018	! t0_kref+0x30c0:   	ldxa	[%i5 + %i0]0x80, %o0
	.word	0x85a00846	! t0_kref+0x30c4:   	faddd	%f0, %f6, %f2
	.word	0x90958016	! t0_kref+0x30c8:   	orcc	%l6, %l6, %o0
	.word	0xf56e3fe8	! t0_kref+0x30cc:   	prefetch	%i0 - 0x18, 26
	.word	0xe1ee501a	! t0_kref+0x30d0:   	prefetcha	%i1 + %i2, 16
	.word	0x8143e040	! t0_kref+0x30d4:   	membar	0x40
	.word	0x94f5e8dd	! t0_kref+0x30d8:   	udivcc	%l7, 0x8dd, %o2
	.word	0x81a01909	! t0_kref+0x30dc:   	fitod	%f9, %f0
	.word	0x950db2f5	! t0_kref+0x30e0:   	tsubcc	%l6, -0xd0b, %o2
	.word	0x8025eac6	! t0_kref+0x30e4:   	sub	%l7, 0xac6, %g0
	.word	0x90f5b972	! t0_kref+0x30e8:   	udivcc	%l6, -0x68e, %o0
	.word	0xc11fbe78	! t0_kref+0x30ec:   	ldd	[%fp - 0x188], %f0
	.word	0xe7f61017	! t0_kref+0x30f0:   	casxa	[%i0]0x80, %l7, %l3
	.word	0x29800004	! t0_kref+0x30f4:   	fbl,a	_kref+0x3104
	.word	0x91a14d20	! t0_kref+0x30f8:   	fsmuld	%f5, %f0, %f8
	.word	0xc9be1a5b	! t0_kref+0x30fc:   	stda	%f4, [%i0 + %i3]0xd2
	.word	0x9405e532	! t0_kref+0x3100:   	add	%l7, 0x532, %o2
	.word	0xd0981019	! t0_kref+0x3104:   	ldda	[%g0 + %i1]0x80, %o0
	.word	0xe67e001c	! t0_kref+0x3108:   	swap	[%i0 + %i4], %l3
	.word	0x83c063b8	! t0_kref+0x310c:   	jmpl	%g1 + 0x3b8, %g1
	.word	0xd83f4018	! t0_kref+0x3110:   	std	%o4, [%i5 + %i0]
	.word	0x98b5c017	! t0_kref+0x3114:   	orncc	%l7, %l7, %o4
	.word	0x9a65af2d	! t0_kref+0x3118:   	subc	%l6, 0xf2d, %o5
	sethi	%hi(2f), %o7
	.word	0xe40be13c	! t0_kref+0x3120:   	ldub	[%o7 + 0x13c], %l2
	.word	0xa41ca00c	! t0_kref+0x3124:   	xor	%l2, 0xc, %l2
	.word	0xe42be13c	! t0_kref+0x3128:   	stb	%l2, [%o7 + 0x13c]
	.word	0x81dbe13c	! t0_kref+0x312c:   	flush	%o7 + 0x13c
	.word	0xd20e6007	! t0_kref+0x3130:   	ldub	[%i1 + 7], %o1
	.word	0xede61017	! t0_kref+0x3134:   	casa	[%i0]0x80, %l7, %l6
	.word	0xec2e3fe7	! t0_kref+0x3138:   	stb	%l6, [%i0 - 0x19]
2:	.word	0x9addf6d6	! t0_kref+0x313c:   	smulcc	%l7, -0x92a, %o5
	.word	0xd6fe101c	! t0_kref+0x3140:   	swapa	[%i0 + %i4]0x80, %o3
	.word	0x9295c016	! t0_kref+0x3144:   	orcc	%l7, %l6, %o1
	.word	0x85a01905	! t0_kref+0x3148:   	fitod	%f5, %f2
	.word	0xd9e65017	! t0_kref+0x314c:   	casa	[%i1]0x80, %l7, %o4
	.word	0xd11fbfb0	! t0_kref+0x3150:   	ldd	[%fp - 0x50], %f8
	.word	0xd47e001c	! t0_kref+0x3154:   	swap	[%i0 + %i4], %o2
	.word	0xc11fbde8	! t0_kref+0x3158:   	ldd	[%fp - 0x218], %f0
	.word	0x9a35c017	! t0_kref+0x315c:   	orn	%l7, %l7, %o5
	.word	0x81a8ca20	! t0_kref+0x3160:   	fcmps	%fcc0, %f3, %f0
	.word	0x81a208c6	! t0_kref+0x3164:   	fsubd	%f8, %f6, %f0
	.word	0xde4e201c	! t0_kref+0x3168:   	ldsb	[%i0 + 0x1c], %o7
	.word	0x83414000	! t0_kref+0x316c:   	mov	%pc, %g1
	.word	0x85a00946	! t0_kref+0x3170:   	fmuld	%f0, %f6, %f2
	.word	0x9fc10000	! t0_kref+0x3174:   	call	%g4
	.word	0x89a18942	! t0_kref+0x3178:   	fmuld	%f6, %f2, %f4
	.word	0xd450a02c	! t0_kref+0x317c:   	ldsh	[%g2 + 0x2c], %o2
	.word	0x9025f379	! t0_kref+0x3180:   	sub	%l7, -0xc87, %o0
	.word	0x81a94aa5	! t0_kref+0x3184:   	fcmpes	%fcc0, %f5, %f5
	.word	0x85a089c6	! t0_kref+0x3188:   	fdivd	%f2, %f6, %f2
	.word	0x81a90aa8	! t0_kref+0x318c:   	fcmpes	%fcc0, %f4, %f8
	.word	0xcb26600c	! t0_kref+0x3190:   	st	%f5, [%i1 + 0xc]
	.word	0x93a188a7	! t0_kref+0x3194:   	fsubs	%f6, %f7, %f9
	.word	0x9a95c017	! t0_kref+0x3198:   	orcc	%l7, %l7, %o5
	.word	0x933dc016	! t0_kref+0x319c:   	sra	%l7, %l6, %o1
	.word	0x81a88aa1	! t0_kref+0x31a0:   	fcmpes	%fcc0, %f2, %f1
	.word	0x9fc70000	! t0_kref+0x31a4:   	call	%i4
	.word	0x9695c016	! t0_kref+0x31a8:   	orcc	%l7, %l6, %o3
	.word	0x89a10940	! t0_kref+0x31ac:   	fmuld	%f4, %f0, %f4
	.word	0x96e5fbbe	! t0_kref+0x31b0:   	subccc	%l7, -0x442, %o3
	.word	0x89aac040	! t0_kref+0x31b4:   	fmovdge	%fcc0, %f0, %f4
	.word	0x2b800007	! t0_kref+0x31b8:   	fbug,a	_kref+0x31d4
	.word	0xd648a02d	! t0_kref+0x31bc:   	ldsb	[%g2 + 0x2d], %o3
	.word	0x89a209c8	! t0_kref+0x31c0:   	fdivd	%f8, %f8, %f4
	.word	0x9675a00b	! t0_kref+0x31c4:   	udiv	%l6, 0xb, %o3
	.word	0xd808a005	! t0_kref+0x31c8:   	ldub	[%g2 + 5], %o4
	.word	0xffee501b	! t0_kref+0x31cc:   	prefetcha	%i1 + %i3, 31
	.word	0x85a14d25	! t0_kref+0x31d0:   	fsmuld	%f5, %f5, %f2
	.word	0x9635b9d6	! t0_kref+0x31d4:   	orn	%l6, -0x62a, %o3
	.word	0x85a01887	! t0_kref+0x31d8:   	fitos	%f7, %f2
	.word	0x89a01925	! t0_kref+0x31dc:   	fstod	%f5, %f4
	.word	0x9b700016	! t0_kref+0x31e0:   	popc	%l6, %o5
	.word	0x8185c000	! t0_kref+0x31e4:   	wr	%l7, %g0, %y
	.word	0x968d8017	! t0_kref+0x31e8:   	andcc	%l6, %l7, %o3
	.word	0xe81e4000	! t0_kref+0x31ec:   	ldd	[%i1], %l4
	.word	0x86102001	! t0_kref+0x31f0:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x31f4:   	bne,a	_kref+0x31f4
	.word	0x86a0e001	! t0_kref+0x31f8:   	subcc	%g3, 1, %g3
	.word	0x85a188c8	! t0_kref+0x31fc:   	fsubd	%f6, %f8, %f2
	.word	0x94e5ea6f	! t0_kref+0x3200:   	subccc	%l7, 0xa6f, %o2
	.word	0xe56e3fe0	! t0_kref+0x3204:   	prefetch	%i0 - 0x20, 18
	.word	0x81a20844	! t0_kref+0x3208:   	faddd	%f8, %f4, %f0
	.word	0xe40860c0	! t0_kref+0x320c:   	ldub	[%g1 + 0xc0], %l2
	.word	0xa41ca00c	! t0_kref+0x3210:   	xor	%l2, 0xc, %l2
	.word	0xe42860c0	! t0_kref+0x3214:   	stb	%l2, [%g1 + 0xc0]
	.word	0x81d860c0	! t0_kref+0x3218:   	flush	%g1 + 0xc0
	.word	0x900d8016	! t0_kref+0x321c:   	and	%l6, %l6, %o0
	.word	0xedee101a	! t0_kref+0x3220:   	prefetcha	%i0 + %i2, 22
	.word	0x960dbae6	! t0_kref+0x3224:   	and	%l6, -0x51a, %o3
	.word	0x9eadc016	! t0_kref+0x3228:   	andncc	%l7, %l6, %o7
2:	.word	0xdbf65016	! t0_kref+0x322c:   	casxa	[%i1]0x80, %l6, %o5
	.word	0xd06e3fed	! t0_kref+0x3230:   	ldstub	[%i0 - 0x13], %o0
	.word	0x9ee5fa46	! t0_kref+0x3234:   	subccc	%l7, -0x5ba, %o7
	.word	0x81a88a22	! t0_kref+0x3238:   	fcmps	%fcc0, %f2, %f2
	.word	0xd6780018	! t0_kref+0x323c:   	swap	[%g0 + %i0], %o3
	.word	0x96c5ba8b	! t0_kref+0x3240:   	addccc	%l6, -0x575, %o3
	.word	0x960d8017	! t0_kref+0x3244:   	and	%l6, %l7, %o3
	.word	0x85a18944	! t0_kref+0x3248:   	fmuld	%f6, %f4, %f2
	.word	0xc93e3fe8	! t0_kref+0x324c:   	std	%f4, [%i0 - 0x18]
	.word	0x9e65c017	! t0_kref+0x3250:   	subc	%l7, %l7, %o7
	.word	0x87a01a29	! t0_kref+0x3254:   	fstoi	%f9, %f3
	.word	0xd0780018	! t0_kref+0x3258:   	swap	[%g0 + %i0], %o0
	.word	0x808dc017	! t0_kref+0x325c:   	btst	%l7, %l7
	.word	0xec266014	! t0_kref+0x3260:   	st	%l6, [%i1 + 0x14]
	.word	0x94e58017	! t0_kref+0x3264:   	subccc	%l6, %l7, %o2
	.word	0xc56e3ff8	! t0_kref+0x3268:   	prefetch	%i0 - 8, 2
	.word	0xd83e7fe8	! t0_kref+0x326c:   	std	%o4, [%i1 - 0x18]
	.word	0x961dfa06	! t0_kref+0x3270:   	xor	%l7, -0x5fa, %o3
	.word	0x1515d7f8	! t0_kref+0x3274:   	sethi	%hi(0x575fe000), %o2
	.word	0x9f358017	! t0_kref+0x3278:   	srl	%l6, %l7, %o7
	.word	0xc76e7ff8	! t0_kref+0x327c:   	prefetch	%i1 - 8, 3
	.word	0x9f400000	! t0_kref+0x3280:   	mov	%y, %o7
	.word	0x1b3181b9	! t0_kref+0x3284:   	sethi	%hi(0xc606e400), %o5
	.word	0xc51e7fe8	! t0_kref+0x3288:   	ldd	[%i1 - 0x18], %f2
	.word	0xe168a048	! t0_kref+0x328c:   	prefetch	%g2 + 0x48, 16
	.word	0x9fc10000	! t0_kref+0x3290:   	call	%g4
	.word	0x98b5c016	! t0_kref+0x3294:   	orncc	%l7, %l6, %o4
	.word	0x91a1cd25	! t0_kref+0x3298:   	fsmuld	%f7, %f5, %f8
	.word	0x95418000	! t0_kref+0x329c:   	mov	%fprs, %o2
	.word	0x81a000a8	! t0_kref+0x32a0:   	fnegs	%f8, %f0
	.word	0xed6e6008	! t0_kref+0x32a4:   	prefetch	%i1 + 8, 22
	.word	0x805d8016	! t0_kref+0x32a8:   	smul	%l6, %l6, %g0
	.word	0x9e05c017	! t0_kref+0x32ac:   	add	%l7, %l7, %o7
	.word	0x85a01904	! t0_kref+0x32b0:   	fitod	%f4, %f2
	.word	0x9ac5e1e8	! t0_kref+0x32b4:   	addccc	%l7, 0x1e8, %o5
	.word	0xc1be7ffc	! t0_kref+0x32b8:   	stda	%f0, [%i1 - 4]%asi
	.word	0x8045c017	! t0_kref+0x32bc:   	addc	%l7, %l7, %g0
	.word	0x9f25e127	! t0_kref+0x32c0:   	mulscc	%l7, 0x127, %o7
	call	SYM(t0_subr2)
	.word	0x9215aa6d	! t0_kref+0x32c8:   	or	%l6, 0xa6d, %o1
	.word	0xe5ee101a	! t0_kref+0x32cc:   	prefetcha	%i0 + %i2, 18
	.word	0x2d800001	! t0_kref+0x32d0:   	fbg,a	_kref+0x32d4
	.word	0xe52060c6	! t0_kref+0x32d4:   	st	%f18, [%g1 + 0xc6]
	.word	0x96158017	! t0_kref+0x32d8:   	or	%l6, %l7, %o3
	.word	0x87a00023	! t0_kref+0x32dc:   	fmovs	%f3, %f3
	.word	0x9ef5b8e8	! t0_kref+0x32e0:   	udivcc	%l6, -0x718, %o7
	.word	0xe40861b0	! t0_kref+0x32e4:   	ldub	[%g1 + 0x1b0], %l2
	.word	0xa41ca00c	! t0_kref+0x32e8:   	xor	%l2, 0xc, %l2
	.word	0xe42861b0	! t0_kref+0x32ec:   	stb	%l2, [%g1 + 0x1b0]
	.word	0x81d861b0	! t0_kref+0x32f0:   	flush	%g1 + 0x1b0
	.word	0x81dec01a	! t0_kref+0x32f4:   	flush	%i3 + %i2
	.word	0x8da01925	! t0_kref+0x32f8:   	fstod	%f5, %f6
	.word	0x89a018c4	! t0_kref+0x32fc:   	fdtos	%f4, %f4
	.word	0xd83e4000	! t0_kref+0x3300:   	std	%o4, [%i1]
	.word	0x9725c017	! t0_kref+0x3304:   	mulscc	%l7, %l7, %o3
	.word	0x89a01886	! t0_kref+0x3308:   	fitos	%f6, %f4
	.word	0x9b40c000	! t0_kref+0x330c:   	mov	%asi, %o5
	.word	0x81d925f0	! t0_kref+0x3310:   	flush	%g4 + 0x5f0
	.word	0x9fc10000	! t0_kref+0x3314:   	call	%g4
	.word	0xe56e401c	! t0_kref+0x3318:   	prefetch	%i1 + %i4, 18
2:	.word	0x9e75a8a9	! t0_kref+0x331c:   	udiv	%l6, 0x8a9, %o7
	.word	0x91a01908	! t0_kref+0x3320:   	fitod	%f8, %f8
	.word	0x80a58016	! t0_kref+0x3324:   	cmp	%l6, %l6
	.word	0x9095c017	! t0_kref+0x3328:   	orcc	%l7, %l7, %o0
	.word	0x81258017	! t0_kref+0x332c:   	mulscc	%l6, %l7, %g0
	.word	0xe56e401a	! t0_kref+0x3330:   	prefetch	%i1 + %i2, 18
	.word	0x8075a10f	! t0_kref+0x3334:   	udiv	%l6, 0x10f, %g0
	.word	0xd8560000	! t0_kref+0x3338:   	ldsh	[%i0], %o4
	.word	0x81aa0a20	! t0_kref+0x333c:   	fcmps	%fcc0, %f8, %f0
	.word	0xf207bfe0	! t0_kref+0x3340:   	ld	[%fp - 0x20], %i1
	.word	0xee28a033	! t0_kref+0x3344:   	stb	%l7, [%g2 + 0x33]
	.word	0x1526f187	! t0_kref+0x3348:   	sethi	%hi(0x9bc61c00), %o2
	.word	0x9635c017	! t0_kref+0x334c:   	orn	%l7, %l7, %o3
	.word	0x95358016	! t0_kref+0x3350:   	srl	%l6, %l6, %o2
	.word	0x9675aabf	! t0_kref+0x3354:   	udiv	%l6, 0xabf, %o3
	.word	0xeea71019	! t0_kref+0x3358:   	sta	%l7, [%i4 + %i1]0x80
	.word	0xc368a005	! t0_kref+0x335c:   	prefetch	%g2 + 5, 1
	.word	0x9e8dc017	! t0_kref+0x3360:   	andcc	%l7, %l7, %o7
	.word	0x8035f891	! t0_kref+0x3364:   	orn	%l7, -0x76f, %g0
	.word	0x92a5c016	! t0_kref+0x3368:   	subcc	%l7, %l6, %o1
	.word	0x9b418000	! t0_kref+0x336c:   	mov	%fprs, %o5
	.word	0x81a98a44	! t0_kref+0x3370:   	fcmpd	%fcc0, %f6, %f4
	.word	0xc568a044	! t0_kref+0x3374:   	prefetch	%g2 + 0x44, 2
	sethi	%hi(2f), %o7
	.word	0xe40be394	! t0_kref+0x337c:   	ldub	[%o7 + 0x394], %l2
	.word	0xa41ca00c	! t0_kref+0x3380:   	xor	%l2, 0xc, %l2
	.word	0xe42be394	! t0_kref+0x3384:   	stb	%l2, [%o7 + 0x394]
	.word	0x81dbe394	! t0_kref+0x3388:   	flush	%o7 + 0x394
	.word	0xc9000018	! t0_kref+0x338c:   	ld	[%g0 + %i0], %f4
	.word	0x81dd801e	! t0_kref+0x3390:   	flush	%l6 + %fp
2:	.word	0xd64e6012	! t0_kref+0x3394:   	ldsb	[%i1 + 0x12], %o3
	.word	0xd24e2015	! t0_kref+0x3398:   	ldsb	[%i0 + 0x15], %o1
	call	SYM(t0_subr2)
	.word	0x81a01925	! t0_kref+0x33a0:   	fstod	%f5, %f0
	.word	0x808d8016	! t0_kref+0x33a4:   	btst	%l6, %l6
	.word	0x9f35c016	! t0_kref+0x33a8:   	srl	%l7, %l6, %o7
	.word	0xe86e201a	! t0_kref+0x33ac:   	ldstub	[%i0 + 0x1a], %l4
	.word	0xd208a020	! t0_kref+0x33b0:   	ldub	[%g2 + 0x20], %o1
	.word	0x80758017	! t0_kref+0x33b4:   	udiv	%l6, %l7, %g0
	.word	0x9a75ec23	! t0_kref+0x33b8:   	udiv	%l7, 0xc23, %o5
	.word	0x81df8005	! t0_kref+0x33bc:   	flush	%fp + %g5
	.word	0x9f35e004	! t0_kref+0x33c0:   	srl	%l7, 0x4, %o7
	.word	0xda4e3ffd	! t0_kref+0x33c4:   	ldsb	[%i0 - 3], %o5
	.word	0x89a089c0	! t0_kref+0x33c8:   	fdivd	%f2, %f0, %f4
	.word	0xd216c018	! t0_kref+0x33cc:   	lduh	[%i3 + %i0], %o1
	.word	0x81a000c4	! t0_kref+0x33d0:   	fnegd	%f4, %f0
	.word	0x94d5b3db	! t0_kref+0x33d4:   	umulcc	%l6, -0xc25, %o2
	.word	0xc7263fe0	! t0_kref+0x33d8:   	st	%f3, [%i0 - 0x20]
	.word	0x90f58017	! t0_kref+0x33dc:   	udivcc	%l6, %l7, %o0
	.word	0x85a018c4	! t0_kref+0x33e0:   	fdtos	%f4, %f2
	.word	0x8125f75e	! t0_kref+0x33e4:   	mulscc	%l7, -0x8a2, %g0
	.word	0x85a20d21	! t0_kref+0x33e8:   	fsmuld	%f8, %f1, %f2
	.word	0x33800008	! t0_kref+0x33ec:   	fbe,a	_kref+0x340c
	.word	0x81d925b4	! t0_kref+0x33f0:   	flush	%g4 + 0x5b4
	.word	0x9e0dc016	! t0_kref+0x33f4:   	and	%l7, %l6, %o7
	.word	0xde10a00c	! t0_kref+0x33f8:   	lduh	[%g2 + 0xc], %o7
	.word	0x91418000	! t0_kref+0x33fc:   	mov	%fprs, %o0
	.word	0x9205a28f	! t0_kref+0x3400:   	add	%l6, 0x28f, %o1
	.word	0xc768a04c	! t0_kref+0x3404:   	prefetch	%g2 + 0x4c, 3
	.word	0xd8be501d	! t0_kref+0x3408:   	stda	%o4, [%i1 + %i5]0x80
	.word	0x85a01908	! t0_kref+0x340c:   	fitod	%f8, %f2
	.word	0x9295c017	! t0_kref+0x3410:   	orcc	%l7, %l7, %o1
	.word	0x87a01a25	! t0_kref+0x3414:   	fstoi	%f5, %f3
	.word	0x81a18944	! t0_kref+0x3418:   	fmuld	%f6, %f4, %f0
	call	1f
	.empty
	.word	0xf36e2008	! t0_kref+0x3420:   	prefetch	%i0 + 8, 25
	.word	0x9725a675	! t0_kref+0x3424:   	mulscc	%l6, 0x675, %o3
	.word	0x29800007	! t0_kref+0x3428:   	fbl,a	_kref+0x3444
	.word	0x8135e012	! t0_kref+0x342c:   	srl	%l7, 0x12, %g0
	.word	0xe2ee9019	! t0_kref+0x3430:   	ldstuba	[%i2 + %i1]0x80, %l1
	.word	0x9245ba76	! t0_kref+0x3434:   	addc	%l6, -0x58a, %o1
	.word	0x81a1c9a6	! t0_kref+0x3438:   	fdivs	%f7, %f6, %f0
1:	.word	0x89a149a0	! t0_kref+0x343c:   	fdivs	%f5, %f0, %f4
	.word	0x9fc00004	! t0_kref+0x3440:   	call	%g0 + %g4
	.word	0x9a458017	! t0_kref+0x3444:   	addc	%l6, %l7, %o5
	.word	0xd81f4019	! t0_kref+0x3448:   	ldd	[%i5 + %i1], %o4
	.word	0xec6e401a	! t0_kref+0x344c:   	ldstub	[%i1 + %i2], %l6
	.word	0x9e15a8e2	! t0_kref+0x3450:   	or	%l6, 0x8e2, %o7
	call	SYM(t0_subr3)
	.word	0x9ac58017	! t0_kref+0x3458:   	addccc	%l6, %l7, %o5
	.word	0x80f58016	! t0_kref+0x345c:   	udivcc	%l6, %l6, %g0
	.word	0xd0162012	! t0_kref+0x3460:   	lduh	[%i0 + 0x12], %o0
	.word	0xc168a00c	! t0_kref+0x3464:   	prefetch	%g2 + 0xc, 0
	.word	0x8ba1c9a5	! t0_kref+0x3468:   	fdivs	%f7, %f5, %f5
	.word	0x9a35a025	! t0_kref+0x346c:   	orn	%l6, 0x25, %o5
	.word	0x91a01102	! t0_kref+0x3470:   	fxtod	%f2, %f8
	.word	0x85a01a27	! t0_kref+0x3474:   	fstoi	%f7, %f2
	.word	0x8da24d22	! t0_kref+0x3478:   	fsmuld	%f9, %f2, %f6
	.word	0xe07f0018	! t0_kref+0x347c:   	swap	[%i4 + %i0], %l0
	.word	0xe83e001d	! t0_kref+0x3480:   	std	%l4, [%i0 + %i5]
	.word	0xc807bfe8	! t0_kref+0x3484:   	ld	[%fp - 0x18], %g4
	.word	0x9b258016	! t0_kref+0x3488:   	mulscc	%l6, %l6, %o5
	.word	0x89a000a3	! t0_kref+0x348c:   	fnegs	%f3, %f4
	.word	0xc7270018	! t0_kref+0x3490:   	st	%f3, [%i4 + %i0]
	.word	0x001fffff	! t0_kref+0x3494:   	illtrap	0x1fffff
	.word	0xd4801018	! t0_kref+0x3498:   	lda	[%g0 + %i0]0x80, %o2
	.word	0x93400000	! t0_kref+0x349c:   	mov	%y, %o1
	.word	0xcda6501c	! t0_kref+0x34a0:   	sta	%f6, [%i1 + %i4]0x80
	.word	0xda901018	! t0_kref+0x34a4:   	lduha	[%g0 + %i0]0x80, %o5
	.word	0x98d5bf77	! t0_kref+0x34a8:   	umulcc	%l6, -0x89, %o4
	.word	0xd06e7fe2	! t0_kref+0x34ac:   	ldstub	[%i1 - 0x1e], %o0
	.word	0x91a01104	! t0_kref+0x34b0:   	fxtod	%f4, %f8
	.word	0x31800007	! t0_kref+0x34b4:   	fba,a	_kref+0x34d0
	.word	0x8143c000	! t0_kref+0x34b8:   	stbar
	.word	0x8fa00023	! t0_kref+0x34bc:   	fmovs	%f3, %f7
	.word	0xc900a018	! t0_kref+0x34c0:   	ld	[%g2 + 0x18], %f4
	.word	0x96d5b42d	! t0_kref+0x34c4:   	umulcc	%l6, -0xbd3, %o3
	.word	0xc016c019	! t0_kref+0x34c8:   	lduh	[%i3 + %i1], %g0
	.word	0x90d5f1e2	! t0_kref+0x34cc:   	umulcc	%l7, -0xe1e, %o0
	.word	0xee270019	! t0_kref+0x34d0:   	st	%l7, [%i4 + %i1]
	.word	0x9a65a6e6	! t0_kref+0x34d4:   	subc	%l6, 0x6e6, %o5
	.word	0x8185c000	! t0_kref+0x34d8:   	wr	%l7, %g0, %y
	.word	0xc100a030	! t0_kref+0x34dc:   	ld	[%g2 + 0x30], %f0
	.word	0x9135c017	! t0_kref+0x34e0:   	srl	%l7, %l7, %o0
	.word	0xd850a002	! t0_kref+0x34e4:   	ldsh	[%g2 + 2], %o4
	.word	0xee367fe2	! t0_kref+0x34e8:   	sth	%l7, [%i1 - 0x1e]
	.word	0xee362006	! t0_kref+0x34ec:   	sth	%l7, [%i0 + 6]
	.word	0x8da01888	! t0_kref+0x34f0:   	fitos	%f8, %f6
	.word	0xc8683fdc	! t0_kref+0x34f4:   	ldstub	[%g0 - 0x24], %g4
	.word	0x2d800005	! t0_kref+0x34f8:   	fbg,a	_kref+0x350c
	.word	0x990dc016	! t0_kref+0x34fc:   	tsubcc	%l7, %l6, %o4
	.word	0x81a208c8	! t0_kref+0x3500:   	fsubd	%f8, %f8, %f0
	.word	0x9aadc017	! t0_kref+0x3504:   	andncc	%l7, %l7, %o5
	.word	0x9335e01f	! t0_kref+0x3508:   	srl	%l7, 0x1f, %o1
	.word	0xec263ffc	! t0_kref+0x350c:   	st	%l6, [%i0 - 4]
	.word	0xcd070019	! t0_kref+0x3510:   	ld	[%i4 + %i1], %f6
	.word	0xe40863cc	! t0_kref+0x3514:   	ldub	[%g1 + 0x3cc], %l2
	.word	0xa41ca00c	! t0_kref+0x3518:   	xor	%l2, 0xc, %l2
	.word	0xe42863cc	! t0_kref+0x351c:   	stb	%l2, [%g1 + 0x3cc]
	.word	0x81d863cc	! t0_kref+0x3520:   	flush	%g1 + 0x3cc
	.word	0xe07e6010	! t0_kref+0x3524:   	swap	[%i1 + 0x10], %l0
	.word	0x8fa00028	! t0_kref+0x3528:   	fmovs	%f8, %f7
	.word	0x960d8017	! t0_kref+0x352c:   	and	%l6, %l7, %o3
	.word	0x9275c017	! t0_kref+0x3530:   	udiv	%l7, %l7, %o1
	.word	0xee262018	! t0_kref+0x3534:   	st	%l7, [%i0 + 0x18]
2:	.word	0x91a00026	! t0_kref+0x3538:   	fmovs	%f6, %f8
	.word	0x96e5c017	! t0_kref+0x353c:   	subccc	%l7, %l7, %o3
	.word	0x9205c017	! t0_kref+0x3540:   	add	%l7, %l7, %o1
	.word	0x8da01926	! t0_kref+0x3544:   	fstod	%f6, %f6
	.word	0x81dc7e01	! t0_kref+0x3548:   	flush	%l1 - 0x1ff
	.word	0x25800005	! t0_kref+0x354c:   	fblg,a	_kref+0x3560
	.word	0x91a108c0	! t0_kref+0x3550:   	fsubd	%f4, %f0, %f8
	.word	0x85a008c4	! t0_kref+0x3554:   	fsubd	%f0, %f4, %f2
	.word	0xd208a039	! t0_kref+0x3558:   	ldub	[%g2 + 0x39], %o1
	.word	0xc9be5816	! t0_kref+0x355c:   	stda	%f4, [%i1 + %l6]0xc0
	.word	0x94b58016	! t0_kref+0x3560:   	orncc	%l6, %l6, %o2
	.word	0x98658016	! t0_kref+0x3564:   	subc	%l6, %l6, %o4
	.word	0xec2e4000	! t0_kref+0x3568:   	stb	%l6, [%i1]
	.word	0x3d800003	! t0_kref+0x356c:   	fbule,a	_kref+0x3578
	.word	0x9245b77a	! t0_kref+0x3570:   	addc	%l6, -0x886, %o1
	.word	0x96c58017	! t0_kref+0x3574:   	addccc	%l6, %l7, %o3
	.word	0x89a089a9	! t0_kref+0x3578:   	fdivs	%f2, %f9, %f4
	.word	0x973de012	! t0_kref+0x357c:   	sra	%l7, 0x12, %o3
	.word	0x9645b26e	! t0_kref+0x3580:   	addc	%l6, -0xd92, %o3
	.word	0xe1ee101b	! t0_kref+0x3584:   	prefetcha	%i0 + %i3, 16
	.word	0xe4086434	! t0_kref+0x3588:   	ldub	[%g1 + 0x434], %l2
	.word	0xa41ca00c	! t0_kref+0x358c:   	xor	%l2, 0xc, %l2
	.word	0xe4286434	! t0_kref+0x3590:   	stb	%l2, [%g1 + 0x434]
	.word	0x81d86434	! t0_kref+0x3594:   	flush	%g1 + 0x434
	.word	0xd09e501d	! t0_kref+0x3598:   	ldda	[%i1 + %i5]0x80, %o0
	.word	0xc768a047	! t0_kref+0x359c:   	prefetch	%g2 + 0x47, 3
2:	.word	0x9e65e952	! t0_kref+0x35a0:   	subc	%l7, 0x952, %o7
	.word	0xc050a032	! t0_kref+0x35a4:   	ldsh	[%g2 + 0x32], %g0
	.word	0xee36200a	! t0_kref+0x35a8:   	sth	%l7, [%i0 + 0xa]
	.word	0x96b5c016	! t0_kref+0x35ac:   	orncc	%l7, %l6, %o3
	.word	0x80d5e863	! t0_kref+0x35b0:   	umulcc	%l7, 0x863, %g0
	.word	0x9635fe0d	! t0_kref+0x35b4:   	orn	%l7, -0x1f3, %o3
	.word	0xc19e5a5c	! t0_kref+0x35b8:   	ldda	[%i1 + %i4]0xd2, %f0
	.word	0xd1be1856	! t0_kref+0x35bc:   	stda	%f8, [%i0 + %l6]0xc2
	.word	0xda6e6000	! t0_kref+0x35c0:   	ldstub	[%i1], %o5
	.word	0x91a01a42	! t0_kref+0x35c4:   	fdtoi	%f2, %f8
	.word	0xc13e6008	! t0_kref+0x35c8:   	std	%f0, [%i1 + 8]
	.word	0x85a08946	! t0_kref+0x35cc:   	fmuld	%f2, %f6, %f2
	.word	0x9f3de01f	! t0_kref+0x35d0:   	sra	%l7, 0x1f, %o7
	.word	0x9225ead7	! t0_kref+0x35d4:   	sub	%l7, 0xad7, %o1
	.word	0x9665eb77	! t0_kref+0x35d8:   	subc	%l7, 0xb77, %o3
	.word	0xd43e6000	! t0_kref+0x35dc:   	std	%o2, [%i1]
	.word	0x8ba00027	! t0_kref+0x35e0:   	fmovs	%f7, %f5
	.word	0x8075c016	! t0_kref+0x35e4:   	udiv	%l7, %l6, %g0
	.word	0xc19e5a5c	! t0_kref+0x35e8:   	ldda	[%i1 + %i4]0xd2, %f0
	.word	0x91a20948	! t0_kref+0x35ec:   	fmuld	%f8, %f8, %f8
	.word	0x9845a2ee	! t0_kref+0x35f0:   	addc	%l6, 0x2ee, %o4
	.word	0x9475c016	! t0_kref+0x35f4:   	udiv	%l7, %l6, %o2
	.word	0xcd1e001d	! t0_kref+0x35f8:   	ldd	[%i0 + %i5], %f6
	.word	0xc5b81018	! t0_kref+0x35fc:   	stda	%f2, [%g0 + %i0]0x80
	.word	0xc99e5a5c	! t0_kref+0x3600:   	ldda	[%i1 + %i4]0xd2, %f4
	.word	0x89a20942	! t0_kref+0x3604:   	fmuld	%f8, %f2, %f4
	.word	0x973dc016	! t0_kref+0x3608:   	sra	%l7, %l6, %o3
	.word	0xd25e6018	! t0_kref+0x360c:   	ldx	[%i1 + 0x18], %o1
	.word	0xc768a083	! t0_kref+0x3610:   	prefetch	%g2 + 0x83, 3
	.word	0x8143e040	! t0_kref+0x3614:   	membar	0x40
	.word	0x87a00021	! t0_kref+0x3618:   	fmovs	%f1, %f3
	call	SYM(t0_subr0)
	.word	0x8da00940	! t0_kref+0x3620:   	fmuld	%f0, %f0, %f6
	.word	0xec2e6006	! t0_kref+0x3624:   	stb	%l6, [%i1 + 6]
	.word	0x8045c016	! t0_kref+0x3628:   	addc	%l7, %l6, %g0
	.word	0x89a00d24	! t0_kref+0x362c:   	fsmuld	%f0, %f4, %f4
	.word	0x9275f710	! t0_kref+0x3630:   	udiv	%l7, -0x8f0, %o1
	.word	0x81a10846	! t0_kref+0x3634:   	faddd	%f4, %f6, %f0
	.word	0x98bdf666	! t0_kref+0x3638:   	xnorcc	%l7, -0x99a, %o4
	.word	0x85a10946	! t0_kref+0x363c:   	fmuld	%f4, %f6, %f2
	.word	0x91a01a24	! t0_kref+0x3640:   	fstoi	%f4, %f8
	.word	0x808db024	! t0_kref+0x3644:   	btst	0xfffff024, %l6
	.word	0xe4981019	! t0_kref+0x3648:   	ldda	[%g0 + %i1]0x80, %l2
	.word	0xc9ee1016	! t0_kref+0x364c:   	prefetcha	%i0 + %l6, 4
	call	SYM(t0_subr1)
	.word	0x9065f946	! t0_kref+0x3654:   	subc	%l7, -0x6ba, %o0
	.word	0x87a000a9	! t0_kref+0x3658:   	fnegs	%f9, %f3
	.word	0x81a089a5	! t0_kref+0x365c:   	fdivs	%f2, %f5, %f0
	.word	0x8055f908	! t0_kref+0x3660:   	umul	%l7, -0x6f8, %g0
	.word	0xde16c019	! t0_kref+0x3664:   	lduh	[%i3 + %i1], %o7
	.word	0xd11fbdd8	! t0_kref+0x3668:   	ldd	[%fp - 0x228], %f8
	.word	0x9b400000	! t0_kref+0x366c:   	mov	%y, %o5
	.word	0xc300a020	! t0_kref+0x3670:   	ld	[%g2 + 0x20], %f1
	.word	0x9e05c017	! t0_kref+0x3674:   	add	%l7, %l7, %o7
	.word	0xee200019	! t0_kref+0x3678:   	st	%l7, [%g0 + %i1]
	.word	0xec200018	! t0_kref+0x367c:   	st	%l6, [%g0 + %i0]
	.word	0xe76e6018	! t0_kref+0x3680:   	prefetch	%i1 + 0x18, 19
	.word	0x81a01a21	! t0_kref+0x3684:   	fstoi	%f1, %f0
	.word	0x9addc016	! t0_kref+0x3688:   	smulcc	%l7, %l6, %o5
	.word	0x8ba209a9	! t0_kref+0x368c:   	fdivs	%f8, %f9, %f5
	.word	0x98bdc017	! t0_kref+0x3690:   	xnorcc	%l7, %l7, %o4
	.word	0x9505b218	! t0_kref+0x3694:   	taddcc	%l6, -0xde8, %o2
	.word	0xd1263ff8	! t0_kref+0x3698:   	st	%f8, [%i0 - 8]
	.word	0xd1bf5a59	! t0_kref+0x369c:   	stda	%f8, [%i5 + %i1]0xd2
	.word	0x9735e01b	! t0_kref+0x36a0:   	srl	%l7, 0x1b, %o3
	.word	0x9ae5a848	! t0_kref+0x36a4:   	subccc	%l6, 0x848, %o5
	.word	0x8143e040	! t0_kref+0x36a8:   	membar	0x40
	.word	0x83a01a46	! t0_kref+0x36ac:   	fdtoi	%f6, %f1
	.word	0x95700016	! t0_kref+0x36b0:   	popc	%l6, %o2
	.word	0x92d5c016	! t0_kref+0x36b4:   	umulcc	%l7, %l6, %o1
	.word	0x913d8017	! t0_kref+0x36b8:   	sra	%l6, %l7, %o0
	.word	0x9ebd8016	! t0_kref+0x36bc:   	xnorcc	%l6, %l6, %o7
	.word	0x85a018c4	! t0_kref+0x36c0:   	fdtos	%f4, %f2
	.word	0x3d800001	! t0_kref+0x36c4:   	fbule,a	_kref+0x36c8
	.word	0x93a01a22	! t0_kref+0x36c8:   	fstoi	%f2, %f9
	.word	0xd27e6004	! t0_kref+0x36cc:   	swap	[%i1 + 4], %o1
	.word	0xec7e4000	! t0_kref+0x36d0:   	swap	[%i1], %l6
	.word	0x83a000a8	! t0_kref+0x36d4:   	fnegs	%f8, %f1
	.word	0x9695b6fc	! t0_kref+0x36d8:   	orcc	%l6, -0x904, %o3
	.word	0xc83f4005	! t0_kref+0x36dc:   	std	%g4, [%i5 + %g5]
	.word	0x94f5b147	! t0_kref+0x36e0:   	udivcc	%l6, -0xeb9, %o2
	.word	0x81d8001f	! t0_kref+0x36e4:   	flush	%g0 + %i7
	.word	0xe3ee501a	! t0_kref+0x36e8:   	prefetcha	%i1 + %i2, 17
	.word	0xe40865ac	! t0_kref+0x36ec:   	ldub	[%g1 + 0x5ac], %l2
	.word	0xa41ca00c	! t0_kref+0x36f0:   	xor	%l2, 0xc, %l2
	.word	0xe42865ac	! t0_kref+0x36f4:   	stb	%l2, [%g1 + 0x5ac]
	.word	0x81d865ac	! t0_kref+0x36f8:   	flush	%g1 + 0x5ac
	.word	0xec30a006	! t0_kref+0x36fc:   	sth	%l6, [%g2 + 6]
	.word	0x94358017	! t0_kref+0x3700:   	orn	%l6, %l7, %o2
	.word	0x9fc10000	! t0_kref+0x3704:   	call	%g4
	.word	0x83a000a1	! t0_kref+0x3708:   	fnegs	%f1, %f1
	.word	0x9435c017	! t0_kref+0x370c:   	orn	%l7, %l7, %o2
	.word	0x94bdc016	! t0_kref+0x3710:   	xnorcc	%l7, %l6, %o2
	.word	0x9ed5f9cb	! t0_kref+0x3714:   	umulcc	%l7, -0x635, %o7
2:	.word	0xa095c017	! t0_kref+0x3718:   	orcc	%l7, %l7, %l0
	.word	0xeeae501a	! t0_kref+0x371c:   	stba	%l7, [%i1 + %i2]0x80
	.word	0x98058016	! t0_kref+0x3720:   	add	%l6, %l6, %o4
	.word	0x98d58017	! t0_kref+0x3724:   	umulcc	%l6, %l7, %o4
	.word	0xec30a034	! t0_kref+0x3728:   	sth	%l6, [%g2 + 0x34]
	.word	0x81a01929	! t0_kref+0x372c:   	fstod	%f9, %f0
	.word	0x81a000a3	! t0_kref+0x3730:   	fnegs	%f3, %f0
	.word	0x8da20846	! t0_kref+0x3734:   	faddd	%f8, %f6, %f6
	.word	0x81aa0ac8	! t0_kref+0x3738:   	fcmped	%fcc0, %f8, %f8
	.word	0x91a01048	! t0_kref+0x373c:   	fdtox	%f8, %f8
	.word	0xd1266000	! t0_kref+0x3740:   	st	%f8, [%i1]
	.word	0x90a58016	! t0_kref+0x3744:   	subcc	%l6, %l6, %o0
	.word	0xd206201c	! t0_kref+0x3748:   	ld	[%i0 + 0x1c], %o1
	.word	0x93a000a2	! t0_kref+0x374c:   	fnegs	%f2, %f9
	.word	0x9ae5aeea	! t0_kref+0x3750:   	subccc	%l6, 0xeea, %o5
	.word	0x93a00029	! t0_kref+0x3754:   	fmovs	%f9, %f9
	.word	0x87a00526	! t0_kref+0x3758:   	fsqrts	%f6, %f3
	.word	0x89a20948	! t0_kref+0x375c:   	fmuld	%f8, %f8, %f4
	.word	0x9235c017	! t0_kref+0x3760:   	orn	%l7, %l7, %o1
	.word	0xd26e201a	! t0_kref+0x3764:   	ldstub	[%i0 + 0x1a], %o1
	.word	0x1328c22c	! t0_kref+0x3768:   	sethi	%hi(0xa308b000), %o1
	.word	0xcb20a038	! t0_kref+0x376c:   	st	%f5, [%g2 + 0x38]
	.word	0x81d87e9a	! t0_kref+0x3770:   	flush	%g1 - 0x166
	.word	0x8fa00025	! t0_kref+0x3774:   	fmovs	%f5, %f7
	.word	0x968db45c	! t0_kref+0x3778:   	andcc	%l6, -0xba4, %o3
	.word	0x9add8017	! t0_kref+0x377c:   	smulcc	%l6, %l7, %o5
	.word	0x801daa24	! t0_kref+0x3780:   	xor	%l6, 0xa24, %g0
	.word	0xec3e001d	! t0_kref+0x3784:   	std	%l6, [%i0 + %i5]
	.word	0x9f35e000	! t0_kref+0x3788:   	srl	%l7, 0x0, %o7
	.word	0xc76e7fe0	! t0_kref+0x378c:   	prefetch	%i1 - 0x20, 3
	.word	0x8da00023	! t0_kref+0x3790:   	fmovs	%f3, %f6
	.word	0xc9380018	! t0_kref+0x3794:   	std	%f4, [%g0 + %i0]
	.word	0x81d94013	! t0_kref+0x3798:   	flush	%g5 + %l3
	.word	0x8da08848	! t0_kref+0x379c:   	faddd	%f2, %f8, %f6
	.word	0x8da01027	! t0_kref+0x37a0:   	fstox	%f7, %f6
	.word	0xd3f65017	! t0_kref+0x37a4:   	casxa	[%i1]0x80, %l7, %o1
	.word	0xed68a00c	! t0_kref+0x37a8:   	prefetch	%g2 + 0xc, 22
	.word	0x9fc00004	! t0_kref+0x37ac:   	call	%g0 + %g4
	.word	0xe86e201d	! t0_kref+0x37b0:   	ldstub	[%i0 + 0x1d], %l4
	.word	0xed68a04d	! t0_kref+0x37b4:   	prefetch	%g2 + 0x4d, 22
	.word	0x83a0c927	! t0_kref+0x37b8:   	fmuls	%f3, %f7, %f1
	.word	0x2b800003	! t0_kref+0x37bc:   	fbug,a	_kref+0x37c8
	.word	0x85a01a44	! t0_kref+0x37c0:   	fdtoi	%f4, %f2
	.word	0xec28a02c	! t0_kref+0x37c4:   	stb	%l6, [%g2 + 0x2c]
	.word	0xcc1f4000	! t0_kref+0x37c8:   	ldd	[%i5], %g6
	call	SYM(t0_subr3)
	.word	0x923d8017	! t0_kref+0x37d0:   	xnor	%l6, %l7, %o1
	.word	0x87a000a8	! t0_kref+0x37d4:   	fnegs	%f8, %f3
	.word	0x9a8dbed8	! t0_kref+0x37d8:   	andcc	%l6, -0x128, %o5
	.word	0xc900a00c	! t0_kref+0x37dc:   	ld	[%g2 + 0xc], %f4
	.word	0xffee101c	! t0_kref+0x37e0:   	prefetcha	%i0 + %i4, 31
	.word	0xc0c6501c	! t0_kref+0x37e4:   	ldswa	[%i1 + %i4]0x80, %g0
	.word	0x85a249a1	! t0_kref+0x37e8:   	fdivs	%f9, %f1, %f2
	.word	0x9675b981	! t0_kref+0x37ec:   	udiv	%l6, -0x67f, %o3
	.word	0x8da20948	! t0_kref+0x37f0:   	fmuld	%f8, %f8, %f6
	.word	0xec36601a	! t0_kref+0x37f4:   	sth	%l6, [%i1 + 0x1a]
	.word	0x93703afc	! t0_kref+0x37f8:   	popc	-0x504, %o1
	.word	0x908d8017	! t0_kref+0x37fc:   	andcc	%l6, %l7, %o0
	.word	0x81a018c6	! t0_kref+0x3800:   	fdtos	%f6, %f0
	.word	0x96ad8017	! t0_kref+0x3804:   	andncc	%l6, %l7, %o3
	.word	0x85a01a24	! t0_kref+0x3808:   	fstoi	%f4, %f2
	.word	0x80a5f973	! t0_kref+0x380c:   	cmp	%l7, -0x68d
	.word	0x8da24d26	! t0_kref+0x3810:   	fsmuld	%f9, %f6, %f6
	.word	0xc3064000	! t0_kref+0x3814:   	ld	[%i1], %f1
	.word	0xc9bf5a18	! t0_kref+0x3818:   	stda	%f4, [%i5 + %i0]0xd0
	.word	0xec2e7fe6	! t0_kref+0x381c:   	stb	%l6, [%i1 - 0x1a]
	.word	0x8da18948	! t0_kref+0x3820:   	fmuld	%f6, %f8, %f6
	.word	0xc12e2000	! t0_kref+0x3824:   	st	%fsr, [%i0]
	.word	0x9e35c016	! t0_kref+0x3828:   	orn	%l7, %l6, %o7
	.word	0x920dbc8d	! t0_kref+0x382c:   	and	%l6, -0x373, %o1
	.word	0x9ac5aa2a	! t0_kref+0x3830:   	addccc	%l6, 0xa2a, %o5
	.word	0xf007bfe0	! t0_kref+0x3834:   	ld	[%fp - 0x20], %i0
	.word	0x9f3da019	! t0_kref+0x3838:   	sra	%l6, 0x19, %o7
	.word	0x80658017	! t0_kref+0x383c:   	subc	%l6, %l7, %g0
	.word	0x9e65e94a	! t0_kref+0x3840:   	subc	%l7, 0x94a, %o7
	sethi	%hi(2f), %o7
	.word	0xe40be084	! t0_kref+0x3848:   	ldub	[%o7 + 0x84], %l2
	.word	0xa41ca00c	! t0_kref+0x384c:   	xor	%l2, 0xc, %l2
	.word	0xe42be084	! t0_kref+0x3850:   	stb	%l2, [%o7 + 0x84]
	.word	0x81dbe084	! t0_kref+0x3854:   	flush	%o7 + 0x84
	.word	0x9235f5a2	! t0_kref+0x3858:   	orn	%l7, -0xa5e, %o1
	.word	0xd3266004	! t0_kref+0x385c:   	st	%f9, [%i1 + 4]
	.word	0x81a108c4	! t0_kref+0x3860:   	fsubd	%f4, %f4, %f0
	.word	0x85a000a4	! t0_kref+0x3864:   	fnegs	%f4, %f2
	.word	0x93a209a6	! t0_kref+0x3868:   	fdivs	%f8, %f6, %f9
	.word	0x9fc00004	! t0_kref+0x386c:   	call	%g0 + %g4
	.word	0xd050a00c	! t0_kref+0x3870:   	ldsh	[%g2 + 0xc], %o0
	.word	0xffee101c	! t0_kref+0x3874:   	prefetcha	%i0 + %i4, 31
	.word	0x96b58016	! t0_kref+0x3878:   	orncc	%l6, %l6, %o3
	.word	0x81aa0a29	! t0_kref+0x387c:   	fcmps	%fcc0, %f8, %f9
	.word	0x91a20d22	! t0_kref+0x3880:   	fsmuld	%f8, %f2, %f8
2:	.word	0xd240a028	! t0_kref+0x3884:   	ldsw	[%g2 + 0x28], %o1
	.word	0x81a01924	! t0_kref+0x3888:   	fstod	%f4, %f0
	.word	0x9645aea7	! t0_kref+0x388c:   	addc	%l6, 0xea7, %o3
	.word	0xc19eda58	! t0_kref+0x3890:   	ldda	[%i3 + %i0]0xd2, %f0
	.word	0x81a90a20	! t0_kref+0x3894:   	fcmps	%fcc0, %f4, %f0
	.word	0x81a01920	! t0_kref+0x3898:   	fstod	%f0, %f0
	.word	0x93058017	! t0_kref+0x389c:   	taddcc	%l6, %l7, %o1
	.word	0xd0067fec	! t0_kref+0x38a0:   	ld	[%i1 - 0x14], %o0
	.word	0xd4df5019	! t0_kref+0x38a4:   	ldxa	[%i5 + %i1]0x80, %o2
	.word	0x87a018c0	! t0_kref+0x38a8:   	fdtos	%f0, %f3
	.word	0x83a01a25	! t0_kref+0x38ac:   	fstoi	%f5, %f1
	.word	0x87a000a6	! t0_kref+0x38b0:   	fnegs	%f6, %f3
	.word	0xc3266008	! t0_kref+0x38b4:   	st	%f1, [%i1 + 8]
	.word	0x8da80044	! t0_kref+0x38b8:   	fmovdn	%fcc0, %f4, %f6
	.word	0x81a90a23	! t0_kref+0x38bc:   	fcmps	%fcc0, %f4, %f3
	.word	0x8143c000	! t0_kref+0x38c0:   	stbar
	.word	0xe47f0018	! t0_kref+0x38c4:   	swap	[%i4 + %i0], %l2
	.word	0x972d8017	! t0_kref+0x38c8:   	sll	%l6, %l7, %o3
	.word	0xd0981018	! t0_kref+0x38cc:   	ldda	[%g0 + %i0]0x80, %o0
	.word	0xd11e401d	! t0_kref+0x38d0:   	ldd	[%i1 + %i5], %f8
	.word	0x8fa049a0	! t0_kref+0x38d4:   	fdivs	%f1, %f0, %f7
	.word	0x81daa62c	! t0_kref+0x38d8:   	flush	%o2 + 0x62c
	.word	0x94b58016	! t0_kref+0x38dc:   	orncc	%l6, %l6, %o2
	.word	0xc51fbde8	! t0_kref+0x38e0:   	ldd	[%fp - 0x218], %f2
	.word	0xe40867ac	! t0_kref+0x38e4:   	ldub	[%g1 + 0x7ac], %l2
	.word	0xa41ca00c	! t0_kref+0x38e8:   	xor	%l2, 0xc, %l2
	.word	0xe42867ac	! t0_kref+0x38ec:   	stb	%l2, [%g1 + 0x7ac]
	.word	0x81d867ac	! t0_kref+0x38f0:   	flush	%g1 + 0x7ac
	.word	0xd83f4019	! t0_kref+0x38f4:   	std	%o4, [%i5 + %i1]
	.word	0x9245c017	! t0_kref+0x38f8:   	addc	%l7, %l7, %o1
	.word	0x8d85ad53	! t0_kref+0x38fc:   	wr	%l6, 0xd53, %fprs
	.word	0x80bd8017	! t0_kref+0x3900:   	xnorcc	%l6, %l7, %g0
	.word	0x83a018c0	! t0_kref+0x3904:   	fdtos	%f0, %f1
	.word	0x8fa018c2	! t0_kref+0x3908:   	fdtos	%f2, %f7
	.word	0xcfa01019	! t0_kref+0x390c:   	sta	%f7, [%g0 + %i1]0x80
	.word	0x9335a001	! t0_kref+0x3910:   	srl	%l6, 0x1, %o1
	.word	0x83414000	! t0_kref+0x3914:   	mov	%pc, %g1
2:	.word	0xda871040	! t0_kref+0x3918:   	lda	[%i4]0x82, %o5
	.word	0xde064000	! t0_kref+0x391c:   	ld	[%i1], %o7
	.word	0x81a80a42	! t0_kref+0x3920:   	fcmpd	%fcc0, %f0, %f2
	.word	0x9e65c017	! t0_kref+0x3924:   	subc	%l7, %l7, %o7
	.word	0xd06e4000	! t0_kref+0x3928:   	ldstub	[%i1], %o0
	.word	0x9addc017	! t0_kref+0x392c:   	smulcc	%l7, %l7, %o5
	.word	0x81a9caa9	! t0_kref+0x3930:   	fcmpes	%fcc0, %f7, %f9
	.word	0x809d8016	! t0_kref+0x3934:   	xorcc	%l6, %l6, %g0
	.word	0x89a148a2	! t0_kref+0x3938:   	fsubs	%f5, %f2, %f4
	.word	0xec30a036	! t0_kref+0x393c:   	sth	%l6, [%g2 + 0x36]
	.word	0xde96d040	! t0_kref+0x3940:   	lduha	[%i3]0x82, %o7
	.word	0x8610201f	! t0_kref+0x3944:   	mov	0x1f, %g3
	.word	0x86a0e001	! t0_kref+0x3948:   	subcc	%g3, 1, %g3
	.word	0x22800016	! t0_kref+0x394c:   	be,a	_kref+0x39a4
	.word	0x93a01a29	! t0_kref+0x3950:   	fstoi	%f9, %f9
	.word	0xd84e401a	! t0_kref+0x3954:   	ldsb	[%i1 + %i2], %o4
	.word	0xec2e8018	! t0_kref+0x3958:   	stb	%l6, [%i2 + %i0]
	.word	0xd1bf5a59	! t0_kref+0x395c:   	stda	%f8, [%i5 + %i1]0xd2
	.word	0xd24e601f	! t0_kref+0x3960:   	ldsb	[%i1 + 0x1f], %o1
	.word	0x81da7e1d	! t0_kref+0x3964:   	flush	%o1 - 0x1e3
	.word	0xc19f5a18	! t0_kref+0x3968:   	ldda	[%i5 + %i0]0xd0, %f0
	.word	0xee6e201d	! t0_kref+0x396c:   	ldstub	[%i0 + 0x1d], %l7
	.word	0x1734836c	! t0_kref+0x3970:   	sethi	%hi(0xd20db000), %o3
	.word	0xc3200018	! t0_kref+0x3974:   	st	%f1, [%g0 + %i0]
	.word	0x92258017	! t0_kref+0x3978:   	sub	%l6, %l7, %o1
	.word	0x3f800001	! t0_kref+0x397c:   	fbo,a	_kref+0x3980
	.word	0x9505c016	! t0_kref+0x3980:   	taddcc	%l7, %l6, %o2
	.word	0x9045bae9	! t0_kref+0x3984:   	addc	%l6, -0x517, %o0
	.word	0x96058016	! t0_kref+0x3988:   	add	%l6, %l6, %o3
	.word	0xc168a04c	! t0_kref+0x398c:   	prefetch	%g2 + 0x4c, 0
	.word	0x99258016	! t0_kref+0x3990:   	mulscc	%l6, %l6, %o4
	.word	0x87a00023	! t0_kref+0x3994:   	fmovs	%f3, %f3
	.word	0x81df8018	! t0_kref+0x3998:   	flush	%fp + %i0
	.word	0x96dda4d9	! t0_kref+0x399c:   	smulcc	%l6, 0x4d9, %o3
	.word	0x9ee5bf51	! t0_kref+0x39a0:   	subccc	%l6, -0xaf, %o7
	.word	0x9075fc83	! t0_kref+0x39a4:   	udiv	%l7, -0x37d, %o0
	.word	0x81a88a24	! t0_kref+0x39a8:   	fcmps	%fcc0, %f2, %f4
	.word	0xc9be7fef	! t0_kref+0x39ac:   	stda	%f4, [%i1 - 0x11]%asi
	.word	0x9fc00004	! t0_kref+0x39b0:   	call	%g0 + %g4
	.word	0x98c5ef66	! t0_kref+0x39b4:   	addccc	%l7, 0xf66, %o4
	.word	0xc040a030	! t0_kref+0x39b8:   	ldsw	[%g2 + 0x30], %g0
	.word	0xec267ff4	! t0_kref+0x39bc:   	st	%l6, [%i1 - 0xc]
	sethi	%hi(2f), %o7
	.word	0xe40be208	! t0_kref+0x39c4:   	ldub	[%o7 + 0x208], %l2
	.word	0xa41ca00c	! t0_kref+0x39c8:   	xor	%l2, 0xc, %l2
	.word	0xe42be208	! t0_kref+0x39cc:   	stb	%l2, [%o7 + 0x208]
	.word	0x81dbe208	! t0_kref+0x39d0:   	flush	%o7 + 0x208
	.word	0x9835c017	! t0_kref+0x39d4:   	orn	%l7, %l7, %o4
	.word	0x87a00024	! t0_kref+0x39d8:   	fmovs	%f4, %f3
	.word	0x23800005	! t0_kref+0x39dc:   	fbne,a	_kref+0x39f0
	.word	0x98c5a4bb	! t0_kref+0x39e0:   	addccc	%l6, 0x4bb, %o4
	.word	0x98558016	! t0_kref+0x39e4:   	umul	%l6, %l6, %o4
	.word	0xed68a04a	! t0_kref+0x39e8:   	prefetch	%g2 + 0x4a, 22
	.word	0x87a018c2	! t0_kref+0x39ec:   	fdtos	%f2, %f3
	.word	0xe6ee501a	! t0_kref+0x39f0:   	ldstuba	[%i1 + %i2]0x80, %l3
	.word	0xf96e6000	! t0_kref+0x39f4:   	prefetch	%i1, 28
	.word	0x81a00940	! t0_kref+0x39f8:   	fmuld	%f0, %f0, %f0
	.word	0xe06e4000	! t0_kref+0x39fc:   	ldstub	[%i1], %l0
	.word	0xda7e3fe8	! t0_kref+0x3a00:   	swap	[%i0 - 0x18], %o5
	.word	0xec7f0018	! t0_kref+0x3a04:   	swap	[%i4 + %i0], %l6
2:	.word	0x81a249a1	! t0_kref+0x3a08:   	fdivs	%f9, %f1, %f0
	.word	0xde48a029	! t0_kref+0x3a0c:   	ldsb	[%g2 + 0x29], %o7
	.word	0xd0162000	! t0_kref+0x3a10:   	lduh	[%i0], %o0
	.word	0xe0981019	! t0_kref+0x3a14:   	ldda	[%g0 + %i1]0x80, %l0
	.word	0xc5b81019	! t0_kref+0x3a18:   	stda	%f2, [%g0 + %i1]0x80
	.word	0xecae5000	! t0_kref+0x3a1c:   	stba	%l6, [%i1]0x80
	.word	0xec36c019	! t0_kref+0x3a20:   	sth	%l6, [%i3 + %i1]
	.word	0xffee101b	! t0_kref+0x3a24:   	prefetcha	%i0 + %i3, 31
	.word	0x9ae5c017	! t0_kref+0x3a28:   	subccc	%l7, %l7, %o5
	.word	0x965dc016	! t0_kref+0x3a2c:   	smul	%l7, %l6, %o3
	.word	0xe09f5018	! t0_kref+0x3a30:   	ldda	[%i5 + %i0]0x80, %l0
	.word	0x878020d2	! t0_kref+0x3a34:   	mov	0xd2, %asi
	.word	0x85a109a6	! t0_kref+0x3a38:   	fdivs	%f4, %f6, %f2
	.word	0xee300018	! t0_kref+0x3a3c:   	sth	%l7, [%g0 + %i0]
	.word	0x91a01900	! t0_kref+0x3a40:   	fitod	%f0, %f8
	.word	0xcc006802	! t0_kref+0x3a44:   	ld	[%g1 + 0x802], %g6
	.word	0x37800006	! t0_kref+0x3a48:   	fbge,a	_kref+0x3a60
	.word	0xda16c019	! t0_kref+0x3a4c:   	lduh	[%i3 + %i1], %o5
	.word	0x37800008	! t0_kref+0x3a50:   	fbge,a	_kref+0x3a70
	.word	0x92adeb8e	! t0_kref+0x3a54:   	andncc	%l7, 0xb8e, %o1
	.word	0x81a94aa5	! t0_kref+0x3a58:   	fcmpes	%fcc0, %f5, %f5
	.word	0xec30a004	! t0_kref+0x3a5c:   	sth	%l6, [%g2 + 4]
	.word	0xd810001b	! t0_kref+0x3a60:   	lduh	[%g0 + %i3], %o4
	.word	0xec267ff8	! t0_kref+0x3a64:   	st	%l6, [%i1 - 8]
	.word	0x8045a679	! t0_kref+0x3a68:   	addc	%l6, 0x679, %g0
	.word	0x9075b01b	! t0_kref+0x3a6c:   	udiv	%l6, -0xfe5, %o0
	.word	0x9325b03f	! t0_kref+0x3a70:   	mulscc	%l6, -0xfc1, %o1
	.word	0x8da00946	! t0_kref+0x3a74:   	fmuld	%f0, %f6, %f6
	.word	0x91a008c8	! t0_kref+0x3a78:   	fsubd	%f0, %f8, %f8
	.word	0x9835b36b	! t0_kref+0x3a7c:   	orn	%l6, -0xc95, %o4
	.word	0x801da08c	! t0_kref+0x3a80:   	xor	%l6, 0x8c, %g0
	.word	0xee267ff8	! t0_kref+0x3a84:   	st	%l7, [%i1 - 8]
	.word	0xde10a01e	! t0_kref+0x3a88:   	lduh	[%g2 + 0x1e], %o7
	.word	0x9a758016	! t0_kref+0x3a8c:   	udiv	%l6, %l6, %o5
	.word	0x86102011	! t0_kref+0x3a90:   	mov	0x11, %g3
	.word	0x86a0e001	! t0_kref+0x3a94:   	subcc	%g3, 1, %g3
	.word	0x22800001	! t0_kref+0x3a98:   	be,a	_kref+0x3a9c
	.word	0x909da143	! t0_kref+0x3a9c:   	xorcc	%l6, 0x143, %o0
	.word	0x83a01882	! t0_kref+0x3aa0:   	fitos	%f2, %f1
	.word	0x94d58017	! t0_kref+0x3aa4:   	umulcc	%l6, %l7, %o2
	.word	0x80e5e075	! t0_kref+0x3aa8:   	subccc	%l7, 0x75, %g0
	.word	0x81a1c826	! t0_kref+0x3aac:   	fadds	%f7, %f6, %f0
	.word	0xde961000	! t0_kref+0x3ab0:   	lduha	[%i0]0x80, %o7
	.word	0x8da01a23	! t0_kref+0x3ab4:   	fstoi	%f3, %f6
	.word	0xe27e0000	! t0_kref+0x3ab8:   	swap	[%i0], %l1
	.word	0xc12e401c	! t0_kref+0x3abc:   	st	%fsr, [%i1 + %i4]
	.word	0x90a58016	! t0_kref+0x3ac0:   	subcc	%l6, %l6, %o0
	.word	0x81aa0a24	! t0_kref+0x3ac4:   	fcmps	%fcc0, %f8, %f4
	.word	0x92ad8016	! t0_kref+0x3ac8:   	andncc	%l6, %l6, %o1
	call	SYM(t0_subr3)
	.word	0x91a208c4	! t0_kref+0x3ad0:   	fsubd	%f8, %f4, %f8
	.word	0xee36600a	! t0_kref+0x3ad4:   	sth	%l7, [%i1 + 0xa]
	.word	0x91058016	! t0_kref+0x3ad8:   	taddcc	%l6, %l6, %o0
	.word	0xd2167fec	! t0_kref+0x3adc:   	lduh	[%i1 - 0x14], %o1
	.word	0x95418000	! t0_kref+0x3ae0:   	mov	%fprs, %o2
	.word	0xee264000	! t0_kref+0x3ae4:   	st	%l7, [%i1]
	.word	0x89a01920	! t0_kref+0x3ae8:   	fstod	%f0, %f4
	.word	0xc12e001c	! t0_kref+0x3aec:   	st	%fsr, [%i0 + %i4]
	.word	0x980dbdc5	! t0_kref+0x3af0:   	and	%l6, -0x23b, %o4
	.word	0xde5e2000	! t0_kref+0x3af4:   	ldx	[%i0], %o7
	.word	0x8025a443	! t0_kref+0x3af8:   	sub	%l6, 0x443, %g0
	.word	0x9740c000	! t0_kref+0x3afc:   	mov	%asi, %o3
	.word	0xcd1fbce0	! t0_kref+0x3b00:   	ldd	[%fp - 0x320], %f6
	.word	0xc91fbdc0	! t0_kref+0x3b04:   	ldd	[%fp - 0x240], %f4
	.word	0x909dabb2	! t0_kref+0x3b08:   	xorcc	%l6, 0xbb2, %o0
	.word	0x9a65aab0	! t0_kref+0x3b0c:   	subc	%l6, 0xab0, %o5
	.word	0xee367ffa	! t0_kref+0x3b10:   	sth	%l7, [%i1 - 6]
	.word	0x9045c017	! t0_kref+0x3b14:   	addc	%l7, %l7, %o0
	.word	0x93a249a9	! t0_kref+0x3b18:   	fdivs	%f9, %f9, %f9
	.word	0x98bdb353	! t0_kref+0x3b1c:   	xnorcc	%l6, -0xcad, %o4
	.word	0xd600a014	! t0_kref+0x3b20:   	ld	[%g2 + 0x14], %o3
	.word	0x9825e3a5	! t0_kref+0x3b24:   	sub	%l7, 0x3a5, %o4
	.word	0x21800003	! t0_kref+0x3b28:   	fbn,a	_kref+0x3b34
	.word	0x85a00024	! t0_kref+0x3b2c:   	fmovs	%f4, %f2
	.word	0x949d8017	! t0_kref+0x3b30:   	xorcc	%l6, %l7, %o2
	.word	0x85a20942	! t0_kref+0x3b34:   	fmuld	%f8, %f2, %f2
	sethi	%hi(1f), %o7
	jmpl	%o7+%lo(1f), %g1
	.empty
	.word	0xc807bfec	! t0_kref+0x3b40:   	ld	[%fp - 0x14], %g4
	.word	0x89a01a40	! t0_kref+0x3b44:   	fdtoi	%f0, %f4
	.word	0x8fa01a24	! t0_kref+0x3b48:   	fstoi	%f4, %f7
	.word	0x2d800002	! t0_kref+0x3b4c:   	fbg,a	_kref+0x3b54
	.word	0x920d8016	! t0_kref+0x3b50:   	and	%l6, %l6, %o1
1:	.word	0xe4086040	! t0_kref+0x3b54:   	ldub	[%g1 + 0x40], %l2
	.word	0xa41ca00c	! t0_kref+0x3b58:   	xor	%l2, 0xc, %l2
	.word	0xe4286040	! t0_kref+0x3b5c:   	stb	%l2, [%g1 + 0x40]
	.word	0x81d86040	! t0_kref+0x3b60:   	flush	%g1 + 0x40
	.word	0x94b58016	! t0_kref+0x3b64:   	orncc	%l6, %l6, %o2
	.word	0xee7e3ffc	! t0_kref+0x3b68:   	swap	[%i0 - 4], %l7
	.word	0x85a188c0	! t0_kref+0x3b6c:   	fsubd	%f6, %f0, %f2
	.word	0x993de00c	! t0_kref+0x3b70:   	sra	%l7, 0xc, %o4
	.word	0x94f5c016	! t0_kref+0x3b74:   	udivcc	%l7, %l6, %o2
	.word	0x97400000	! t0_kref+0x3b78:   	mov	%y, %o3
2:	.word	0xc9be1856	! t0_kref+0x3b7c:   	stda	%f4, [%i0 + %l6]0xc2
	.word	0xd66e7feb	! t0_kref+0x3b80:   	ldstub	[%i1 - 0x15], %o3
	.word	0xeb68a004	! t0_kref+0x3b84:   	prefetch	%g2 + 4, 21
	.word	0xd11fbdf0	! t0_kref+0x3b88:   	ldd	[%fp - 0x210], %f8
	.word	0xd11e2000	! t0_kref+0x3b8c:   	ldd	[%i0], %f8
	.word	0xc9a71019	! t0_kref+0x3b90:   	sta	%f4, [%i4 + %i1]0x80
	.word	0x85a188c4	! t0_kref+0x3b94:   	fsubd	%f6, %f4, %f2
	.word	0x980dc016	! t0_kref+0x3b98:   	and	%l7, %l6, %o4
	.word	0x903dc016	! t0_kref+0x3b9c:   	xnor	%l7, %l6, %o0
	.word	0x91a18948	! t0_kref+0x3ba0:   	fmuld	%f6, %f8, %f8
	.word	0x9495bfb8	! t0_kref+0x3ba4:   	orcc	%l6, -0x48, %o2
	.word	0x9b0d8017	! t0_kref+0x3ba8:   	tsubcc	%l6, %l7, %o5
	.word	0x9865ff42	! t0_kref+0x3bac:   	subc	%l7, -0xbe, %o4
	.word	0xf76e401a	! t0_kref+0x3bb0:   	prefetch	%i1 + %i2, 27
	.word	0xc36e4017	! t0_kref+0x3bb4:   	prefetch	%i1 + %l7, 1
	.word	0x9e258017	! t0_kref+0x3bb8:   	sub	%l6, %l7, %o7
	.word	0xe40860a8	! t0_kref+0x3bbc:   	ldub	[%g1 + 0xa8], %l2
	.word	0xa41ca00c	! t0_kref+0x3bc0:   	xor	%l2, 0xc, %l2
	.word	0xe42860a8	! t0_kref+0x3bc4:   	stb	%l2, [%g1 + 0xa8]
	.word	0x81d860a8	! t0_kref+0x3bc8:   	flush	%g1 + 0xa8
	.word	0x9b25c017	! t0_kref+0x3bcc:   	mulscc	%l7, %l7, %o5
	.word	0xc11fbee8	! t0_kref+0x3bd0:   	ldd	[%fp - 0x118], %f0
	.word	0x81a00022	! t0_kref+0x3bd4:   	fmovs	%f2, %f0
	.word	0x98d5abe0	! t0_kref+0x3bd8:   	umulcc	%l6, 0xbe0, %o4
	.word	0x8da000a6	! t0_kref+0x3bdc:   	fnegs	%f6, %f6
	.word	0x989da88c	! t0_kref+0x3be0:   	xorcc	%l6, 0x88c, %o4
2:	.word	0xc5bf5018	! t0_kref+0x3be4:   	stda	%f2, [%i5 + %i0]0x80
	.word	0xd27e2008	! t0_kref+0x3be8:   	swap	[%i0 + 8], %o1
	.word	0x963dc017	! t0_kref+0x3bec:   	xnor	%l7, %l7, %o3
	.word	0x81a88aa8	! t0_kref+0x3bf0:   	fcmpes	%fcc0, %f2, %f8
	.word	0xc36e7fe8	! t0_kref+0x3bf4:   	prefetch	%i1 - 0x18, 1
	.word	0x81a9ca21	! t0_kref+0x3bf8:   	fcmps	%fcc0, %f7, %f1
	.word	0x94458016	! t0_kref+0x3bfc:   	addc	%l6, %l6, %o2
	.word	0xd43f4019	! t0_kref+0x3c00:   	std	%o2, [%i5 + %i1]
	sethi	%hi(2f), %o7
	.word	0xe40be044	! t0_kref+0x3c08:   	ldub	[%o7 + 0x44], %l2
	.word	0xa41ca00c	! t0_kref+0x3c0c:   	xor	%l2, 0xc, %l2
	.word	0xe42be044	! t0_kref+0x3c10:   	stb	%l2, [%o7 + 0x44]
	.word	0x81dbe044	! t0_kref+0x3c14:   	flush	%o7 + 0x44
	.word	0x81a00021	! t0_kref+0x3c18:   	fmovs	%f1, %f0
	.word	0xc1200018	! t0_kref+0x3c1c:   	st	%f0, [%g0 + %i0]
	.word	0xee260000	! t0_kref+0x3c20:   	st	%l7, [%i0]
	.word	0x9ac58016	! t0_kref+0x3c24:   	addccc	%l6, %l6, %o5
	.word	0x8da18946	! t0_kref+0x3c28:   	fmuld	%f6, %f6, %f6
	.word	0xc1beda18	! t0_kref+0x3c2c:   	stda	%f0, [%i3 + %i0]0xd0
	.word	0x81a9caa5	! t0_kref+0x3c30:   	fcmpes	%fcc0, %f7, %f5
	.word	0xc9ee5016	! t0_kref+0x3c34:   	prefetcha	%i1 + %l6, 4
	.word	0xd286101c	! t0_kref+0x3c38:   	lda	[%i0 + %i4]0x80, %o1
	.word	0x25800001	! t0_kref+0x3c3c:   	fblg,a	_kref+0x3c40
	.word	0x98c58017	! t0_kref+0x3c40:   	addccc	%l6, %l7, %o4
2:	.word	0x91a01a24	! t0_kref+0x3c44:   	fstoi	%f4, %f8
	.word	0x80ddc017	! t0_kref+0x3c48:   	smulcc	%l7, %l7, %g0
	.word	0xcd1f4018	! t0_kref+0x3c4c:   	ldd	[%i5 + %i0], %f6
	.word	0x9e558017	! t0_kref+0x3c50:   	umul	%l6, %l7, %o7
	.word	0x89a0c8a7	! t0_kref+0x3c54:   	fsubs	%f3, %f7, %f4
	call	SYM(t0_subr2)
	.word	0xcf263ff8	! t0_kref+0x3c5c:   	st	%f7, [%i0 - 8]
	.word	0xd610a01e	! t0_kref+0x3c60:   	lduh	[%g2 + 0x1e], %o3
	.word	0xc807bff0	! t0_kref+0x3c64:   	ld	[%fp - 0x10], %g4
	.word	0x8da00025	! t0_kref+0x3c68:   	fmovs	%f5, %f6
	.word	0x8143e040	! t0_kref+0x3c6c:   	membar	0x40
	.word	0x81a04822	! t0_kref+0x3c70:   	fadds	%f1, %f2, %f0
	.word	0x91700017	! t0_kref+0x3c74:   	popc	%l7, %o0
	.word	0x2f800002	! t0_kref+0x3c78:   	fbu,a	_kref+0x3c80
	.word	0x8143c000	! t0_kref+0x3c7c:   	stbar
	.word	0xc06e8019	! t0_kref+0x3c80:   	ldstub	[%i2 + %i1], %g0
	.word	0xf9ee501c	! t0_kref+0x3c84:   	prefetcha	%i1 + %i4, 28
	.word	0xd896d019	! t0_kref+0x3c88:   	lduha	[%i3 + %i1]0x80, %o4
	.word	0x21800004	! t0_kref+0x3c8c:   	fbn,a	_kref+0x3c9c
	.word	0xc51e2018	! t0_kref+0x3c90:   	ldd	[%i0 + 0x18], %f2
	.word	0xc0164000	! t0_kref+0x3c94:   	lduh	[%i1], %g0
	.word	0x9e35bddd	! t0_kref+0x3c98:   	orn	%l6, -0x223, %o7
	.word	0xc016001b	! t0_kref+0x3c9c:   	lduh	[%i0 + %i3], %g0
	.word	0x89a01929	! t0_kref+0x3ca0:   	fstod	%f9, %f4
	.word	0x80758017	! t0_kref+0x3ca4:   	udiv	%l6, %l7, %g0
	.word	0x98bdb63f	! t0_kref+0x3ca8:   	xnorcc	%l6, -0x9c1, %o4
	.word	0xc300a008	! t0_kref+0x3cac:   	ld	[%g2 + 8], %f1
	.word	0x81858000	! t0_kref+0x3cb0:   	wr	%l6, %g0, %y
	.word	0xd11fbc30	! t0_kref+0x3cb4:   	ldd	[%fp - 0x3d0], %f8
	.word	0x93400000	! t0_kref+0x3cb8:   	mov	%y, %o1
	.word	0xec3e401d	! t0_kref+0x3cbc:   	std	%l6, [%i1 + %i5]
	.word	0x85a000a4	! t0_kref+0x3cc0:   	fnegs	%f4, %f2
	.word	0xd25f4019	! t0_kref+0x3cc4:   	ldx	[%i5 + %i1], %o1
	.word	0x81dc8017	! t0_kref+0x3cc8:   	flush	%l2 + %l7
	.word	0xd2070005	! t0_kref+0x3ccc:   	ld	[%i4 + %g5], %o1
	.word	0xd46e4000	! t0_kref+0x3cd0:   	ldstub	[%i1], %o2
	.word	0x153ae117	! t0_kref+0x3cd4:   	sethi	%hi(0xeb845c00), %o2
	.word	0x90b5aa4b	! t0_kref+0x3cd8:   	orncc	%l6, 0xa4b, %o0
	.word	0x9e95f4aa	! t0_kref+0x3cdc:   	orcc	%l7, -0xb56, %o7
	.word	0x81dc401a	! t0_kref+0x3ce0:   	flush	%l1 + %i2
	.word	0x9695fb39	! t0_kref+0x3ce4:   	orcc	%l7, -0x4c7, %o3
	.word	0x9fc10000	! t0_kref+0x3ce8:   	call	%g4
	.word	0x9865be18	! t0_kref+0x3cec:   	subc	%l6, -0x1e8, %o4
	.word	0x8ba049a3	! t0_kref+0x3cf0:   	fdivs	%f1, %f3, %f5
	.word	0xe83e3ff0	! t0_kref+0x3cf4:   	std	%l4, [%i0 - 0x10]
	.word	0x9255e9ed	! t0_kref+0x3cf8:   	umul	%l7, 0x9ed, %o1
	.word	0x90758017	! t0_kref+0x3cfc:   	udiv	%l6, %l7, %o0
	.word	0xde480018	! t0_kref+0x3d00:   	ldsb	[%g0 + %i0], %o7
	.word	0xe068a007	! t0_kref+0x3d04:   	ldstub	[%g2 + 7], %l0
	call	SYM(t0_subr0)
	.word	0xc1180018	! t0_kref+0x3d0c:   	ldd	[%g0 + %i0], %f0
	.word	0x9a95c016	! t0_kref+0x3d10:   	orcc	%l7, %l6, %o5
	.word	0x91a01903	! t0_kref+0x3d14:   	fitod	%f3, %f8
	.word	0x929d8016	! t0_kref+0x3d18:   	xorcc	%l6, %l6, %o1
	.word	0x9ef58016	! t0_kref+0x3d1c:   	udivcc	%l6, %l6, %o7
	.word	0xec3e001d	! t0_kref+0x3d20:   	std	%l6, [%i0 + %i5]
	.word	0xc120a004	! t0_kref+0x3d24:   	st	%f0, [%g2 + 4]
	.word	0x86102010	! t0_kref+0x3d28:   	mov	0x10, %g3
	.word	0x86a0e001	! t0_kref+0x3d2c:   	subcc	%g3, 1, %g3
	.word	0x22800005	! t0_kref+0x3d30:   	be,a	_kref+0x3d44
	.word	0x81de8014	! t0_kref+0x3d34:   	flush	%i2 + %l4
	.word	0x85a20942	! t0_kref+0x3d38:   	fmuld	%f8, %f2, %f2
	.word	0xeeb6d019	! t0_kref+0x3d3c:   	stha	%l7, [%i3 + %i1]0x80
	.word	0x99400000	! t0_kref+0x3d40:   	mov	%y, %o4
	.word	0x9a0dbcdd	! t0_kref+0x3d44:   	and	%l6, -0x323, %o5
	.word	0x81258016	! t0_kref+0x3d48:   	mulscc	%l6, %l6, %g0
	.word	0x800d8017	! t0_kref+0x3d4c:   	and	%l6, %l7, %g0
	.word	0x9fc10000	! t0_kref+0x3d50:   	call	%g4
	.word	0x8185c000	! t0_kref+0x3d54:   	wr	%l7, %g0, %y
	.word	0xf9ee101b	! t0_kref+0x3d58:   	prefetcha	%i0 + %i3, 28
	.word	0xc1ee5017	! t0_kref+0x3d5c:   	prefetcha	%i1 + %l7, 0
	.word	0x80558017	! t0_kref+0x3d60:   	umul	%l6, %l7, %g0
	.word	0x9495c016	! t0_kref+0x3d64:   	orcc	%l7, %l6, %o2
	.word	0x9fc10000	! t0_kref+0x3d68:   	call	%g4
	.word	0x9235c016	! t0_kref+0x3d6c:   	orn	%l7, %l6, %o1
	.word	0x98ada28a	! t0_kref+0x3d70:   	andncc	%l6, 0x28a, %o4
	.word	0x9495e134	! t0_kref+0x3d74:   	orcc	%l7, 0x134, %o2
	.word	0x8143c000	! t0_kref+0x3d78:   	stbar
	.word	0xe7e65016	! t0_kref+0x3d7c:   	casa	[%i1]0x80, %l6, %l3
	.word	0x98358016	! t0_kref+0x3d80:   	orn	%l6, %l6, %o4
	.word	0xd1be5a1d	! t0_kref+0x3d84:   	stda	%f8, [%i1 + %i5]0xd0
	.word	0xee762000	! t0_kref+0x3d88:   	stx	%l7, [%i0]
	.word	0xee30a012	! t0_kref+0x3d8c:   	sth	%l7, [%g2 + 0x12]
	.word	0x9b400000	! t0_kref+0x3d90:   	mov	%y, %o5
	.word	0xec263ffc	! t0_kref+0x3d94:   	st	%l6, [%i0 - 4]
	.word	0x81aa0a25	! t0_kref+0x3d98:   	fcmps	%fcc0, %f8, %f5
	.word	0x9ef58017	! t0_kref+0x3d9c:   	udivcc	%l6, %l7, %o7
	.word	0xc91fbf80	! t0_kref+0x3da0:   	ldd	[%fp - 0x80], %f4
	.word	0x92a5ff1a	! t0_kref+0x3da4:   	subcc	%l7, -0xe6, %o1
	.word	0x8fa018c8	! t0_kref+0x3da8:   	fdtos	%f8, %f7
	.word	0x94958016	! t0_kref+0x3dac:   	orcc	%l6, %l6, %o2
	.word	0x81a01905	! t0_kref+0x3db0:   	fitod	%f5, %f0
	.word	0x90458017	! t0_kref+0x3db4:   	addc	%l6, %l7, %o0
	.word	0x9f3de002	! t0_kref+0x3db8:   	sra	%l7, 0x2, %o7
	.word	0x89a018c8	! t0_kref+0x3dbc:   	fdtos	%f8, %f4
	.word	0xf9ee101a	! t0_kref+0x3dc0:   	prefetcha	%i0 + %i2, 28
	.word	0x35800003	! t0_kref+0x3dc4:   	fbue,a	_kref+0x3dd0
	.word	0x9b2dc016	! t0_kref+0x3dc8:   	sll	%l7, %l6, %o5
	.word	0x91a188c0	! t0_kref+0x3dcc:   	fsubd	%f6, %f0, %f8
	.word	0x9905b189	! t0_kref+0x3dd0:   	taddcc	%l6, -0xe77, %o4
	.word	0x91a18846	! t0_kref+0x3dd4:   	faddd	%f6, %f6, %f8
	.word	0xe1f61017	! t0_kref+0x3dd8:   	casxa	[%i0]0x80, %l7, %l0
	.word	0x90d58016	! t0_kref+0x3ddc:   	umulcc	%l6, %l6, %o0
	.word	0x93a018c2	! t0_kref+0x3de0:   	fdtos	%f2, %f9
	.word	0xd13f4018	! t0_kref+0x3de4:   	std	%f8, [%i5 + %i0]
	.word	0x90558017	! t0_kref+0x3de8:   	umul	%l6, %l7, %o0
	.word	0xee30a006	! t0_kref+0x3dec:   	sth	%l7, [%g2 + 6]
	.word	0x96758017	! t0_kref+0x3df0:   	udiv	%l6, %l7, %o3
	.word	0x81a90a21	! t0_kref+0x3df4:   	fcmps	%fcc0, %f4, %f1
	.word	0x9e25c017	! t0_kref+0x3df8:   	sub	%l7, %l7, %o7
	.word	0x933d8016	! t0_kref+0x3dfc:   	sra	%l6, %l6, %o1
	.word	0x813da003	! t0_kref+0x3e00:   	sra	%l6, 0x3, %g0
	.word	0x91a01888	! t0_kref+0x3e04:   	fitos	%f8, %f8
	.word	0x90ddea3c	! t0_kref+0x3e08:   	smulcc	%l7, 0xa3c, %o0
	.word	0xc12e2014	! t0_kref+0x3e0c:   	st	%fsr, [%i0 + 0x14]
	.word	0xd87e001c	! t0_kref+0x3e10:   	swap	[%i0 + %i4], %o4
	.word	0x86102003	! t0_kref+0x3e14:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x3e18:   	bne,a	_kref+0x3e18
	.word	0x86a0e001	! t0_kref+0x3e1c:   	subcc	%g3, 1, %g3
	.word	0xda7e3ff4	! t0_kref+0x3e20:   	swap	[%i0 - 0xc], %o5
	.word	0x89a00944	! t0_kref+0x3e24:   	fmuld	%f0, %f4, %f4
	.word	0xee30a028	! t0_kref+0x3e28:   	sth	%l7, [%g2 + 0x28]
	.word	0xe87e6008	! t0_kref+0x3e2c:   	swap	[%i1 + 8], %l4
	.word	0xd1260000	! t0_kref+0x3e30:   	st	%f8, [%i0]
	.word	0x92d5acd8	! t0_kref+0x3e34:   	umulcc	%l6, 0xcd8, %o1
	.word	0x9f358017	! t0_kref+0x3e38:   	srl	%l6, %l7, %o7
	.word	0xed6e3ff8	! t0_kref+0x3e3c:   	prefetch	%i0 - 8, 22
	.word	0x878020d2	! t0_kref+0x3e40:   	mov	0xd2, %asi
	.word	0xc99e3fe0	! t0_kref+0x3e44:   	ldda	[%i0 - 0x20]%asi, %f4
	.word	0x81a84aa4	! t0_kref+0x3e48:   	fcmpes	%fcc0, %f1, %f4
	.word	0x8075e03d	! t0_kref+0x3e4c:   	udiv	%l7, 0x3d, %g0
	.word	0xd11fbd60	! t0_kref+0x3e50:   	ldd	[%fp - 0x2a0], %f8
	.word	0x81a0cd29	! t0_kref+0x3e54:   	fsmuld	%f3, %f9, %f0
	.word	0x92ddaad5	! t0_kref+0x3e58:   	smulcc	%l6, 0xad5, %o1
	.word	0x9e006324	! t0_kref+0x3e5c:   	add	%g1, 0x324, %o7
!	.word	0x314fb068	! t0_kref+0x3e60:   	fba,a,pt	%fcc0, SYM(t0_subr1)
	   	fba,a,pt	%fcc0, SYM(t0_subr1)
	.word	0x8185c000	! t0_kref+0x3e64:   	wr	%l7, %g0, %y
	.word	0x87a00020	! t0_kref+0x3e68:   	fmovs	%f0, %f3
	.word	0x86102004	! t0_kref+0x3e6c:   	mov	0x4, %g3
	.word	0x86a0e001	! t0_kref+0x3e70:   	subcc	%g3, 1, %g3
	.word	0x2280001e	! t0_kref+0x3e74:   	be,a	_kref+0x3eec
	.word	0x93a01a26	! t0_kref+0x3e78:   	fstoi	%f6, %f9
	.word	0xda48a030	! t0_kref+0x3e7c:   	ldsb	[%g2 + 0x30], %o5
	.word	0xd1be1856	! t0_kref+0x3e80:   	stda	%f8, [%i0 + %l6]0xc2
	.word	0xc11fbfc8	! t0_kref+0x3e84:   	ldd	[%fp - 0x38], %f0
	.word	0x9475a41e	! t0_kref+0x3e88:   	udiv	%l6, 0x41e, %o2
	.word	0x01200b19	! t0_kref+0x3e8c:   	sethi	%hi(0x802c6400), %g0
	.word	0xc06e8019	! t0_kref+0x3e90:   	ldstub	[%i2 + %i1], %g0
	.word	0x011dd4ca	! t0_kref+0x3e94:   	sethi	%hi(0x77532800), %g0
	.word	0xc040a014	! t0_kref+0x3e98:   	ldsw	[%g2 + 0x14], %g0
	.word	0x9065c016	! t0_kref+0x3e9c:   	subc	%l7, %l6, %o0
	.word	0xec1f4019	! t0_kref+0x3ea0:   	ldd	[%i5 + %i1], %l6
	.word	0x8d85b79a	! t0_kref+0x3ea4:   	wr	%l6, 0xfffff79a, %fprs
	.word	0x81a9caa2	! t0_kref+0x3ea8:   	fcmpes	%fcc0, %f7, %f2
	.word	0xc16e2010	! t0_kref+0x3eac:   	prefetch	%i0 + 0x10, 0
	.word	0x8045f565	! t0_kref+0x3eb0:   	addc	%l7, -0xa9b, %g0
	.word	0x9340c000	! t0_kref+0x3eb4:   	mov	%asi, %o1
	.word	0x9845fb6d	! t0_kref+0x3eb8:   	addc	%l7, -0x493, %o4
	.word	0x81a018c0	! t0_kref+0x3ebc:   	fdtos	%f0, %f0
	.word	0x9fc10000	! t0_kref+0x3ec0:   	call	%g4
	.word	0xd11fbd80	! t0_kref+0x3ec4:   	ldd	[%fp - 0x280], %f8
	.word	0x85a00942	! t0_kref+0x3ec8:   	fmuld	%f0, %f2, %f2
	.word	0x35bfffe9	! t0_kref+0x3ecc:   	fbue,a	_kref+0x3e70
	.word	0xe67e3ff8	! t0_kref+0x3ed0:   	swap	[%i0 - 8], %l3
	.word	0x98e5fbf6	! t0_kref+0x3ed4:   	subccc	%l7, -0x40a, %o4
	.word	0xc3063fec	! t0_kref+0x3ed8:   	ld	[%i0 - 0x14], %f1
	.word	0xee6e001a	! t0_kref+0x3edc:   	ldstub	[%i0 + %i2], %l7
	.word	0xe09e101d	! t0_kref+0x3ee0:   	ldda	[%i0 + %i5]0x80, %l0
	.word	0x8da1cd28	! t0_kref+0x3ee4:   	fsmuld	%f7, %f8, %f6
	.word	0x80c5e646	! t0_kref+0x3ee8:   	addccc	%l7, 0x646, %g0
	.word	0xeb68a04d	! t0_kref+0x3eec:   	prefetch	%g2 + 0x4d, 21
	.word	0xec36401b	! t0_kref+0x3ef0:   	sth	%l6, [%i1 + %i3]
	.word	0x8da01905	! t0_kref+0x3ef4:   	fitod	%f5, %f6
	.word	0x81a000c0	! t0_kref+0x3ef8:   	fnegd	%f0, %f0
	.word	0xc91fbec8	! t0_kref+0x3efc:   	ldd	[%fp - 0x138], %f4
	.word	0xec28a01d	! t0_kref+0x3f00:   	stb	%l6, [%g2 + 0x1d]
	.word	0x94658017	! t0_kref+0x3f04:   	subc	%l6, %l7, %o2
	.word	0xd13e401d	! t0_kref+0x3f08:   	std	%f8, [%i1 + %i5]
	.word	0x89a109a4	! t0_kref+0x3f0c:   	fdivs	%f4, %f4, %f4
	.word	0x23800004	! t0_kref+0x3f10:   	fbne,a	_kref+0x3f20
	.word	0xc9070018	! t0_kref+0x3f14:   	ld	[%i4 + %i0], %f4
	.word	0xec30a02e	! t0_kref+0x3f18:   	sth	%l6, [%g2 + 0x2e]
	.word	0x85a00946	! t0_kref+0x3f1c:   	fmuld	%f0, %f6, %f2
	.word	0x81a089c6	! t0_kref+0x3f20:   	fdivd	%f2, %f6, %f0
	.word	0x90c58016	! t0_kref+0x3f24:   	addccc	%l6, %l6, %o0
	.word	0x8143e040	! t0_kref+0x3f28:   	membar	0x40
	.word	0x8140c000	! t0_kref+0x3f2c:   	mov	%asi, %g0
	.word	0xc1be1817	! t0_kref+0x3f30:   	stda	%f0, [%i0 + %l7]0xc0
	.word	0x8fa109a5	! t0_kref+0x3f34:   	fdivs	%f4, %f5, %f7
	.word	0x9295bdf1	! t0_kref+0x3f38:   	orcc	%l6, -0x20f, %o1
	.word	0x9075e0d6	! t0_kref+0x3f3c:   	udiv	%l7, 0xd6, %o0
	.word	0x81a88a26	! t0_kref+0x3f40:   	fcmps	%fcc0, %f2, %f6
	.word	0x8da18942	! t0_kref+0x3f44:   	fmuld	%f6, %f2, %f6
	.word	0x9fc00004	! t0_kref+0x3f48:   	call	%g0 + %g4
	.word	0x91400000	! t0_kref+0x3f4c:   	mov	%y, %o0
	.word	0x8143c000	! t0_kref+0x3f50:   	stbar
	.word	0xc236c000	! t0_kref+0x3f54:   	sth	%g1, [%i3]
	.word	0xec2e0000	! t0_kref+0x3f58:   	stb	%l6, [%i0]
	.word	0xf5ee101a	! t0_kref+0x3f5c:   	prefetcha	%i0 + %i2, 26
	.word	0x9065c016	! t0_kref+0x3f60:   	subc	%l7, %l6, %o0
	.word	0x81a8ca24	! t0_kref+0x3f64:   	fcmps	%fcc0, %f3, %f4
	.word	0xee20a034	! t0_kref+0x3f68:   	st	%l7, [%g2 + 0x34]
	.word	0x8143e040	! t0_kref+0x3f6c:   	membar	0x40
	.word	0x965db74b	! t0_kref+0x3f70:   	smul	%l6, -0x8b5, %o3
	.word	0xee366014	! t0_kref+0x3f74:   	sth	%l7, [%i1 + 0x14]
	.word	0x81a208c0	! t0_kref+0x3f78:   	fsubd	%f8, %f0, %f0
	.word	0x8143c000	! t0_kref+0x3f7c:   	stbar
	.word	0x9045fcf5	! t0_kref+0x3f80:   	addc	%l7, -0x30b, %o0
	.word	0x90c5c016	! t0_kref+0x3f84:   	addccc	%l7, %l6, %o0
	.word	0x90c58017	! t0_kref+0x3f88:   	addccc	%l6, %l7, %o0
	.word	0xc168a00b	! t0_kref+0x3f8c:   	prefetch	%g2 + 0xb, 0
	.word	0x21800002	! t0_kref+0x3f90:   	fbn,a	_kref+0x3f98
	.word	0xc368a04e	! t0_kref+0x3f94:   	prefetch	%g2 + 0x4e, 1
	.word	0xd616401b	! t0_kref+0x3f98:   	lduh	[%i1 + %i3], %o3
	.word	0x8610201b	! t0_kref+0x3f9c:   	mov	0x1b, %g3
	.word	0x86a0e001	! t0_kref+0x3fa0:   	subcc	%g3, 1, %g3
	.word	0x2280000b	! t0_kref+0x3fa4:   	be,a	_kref+0x3fd0
	.word	0x8da00d26	! t0_kref+0x3fa8:   	fsmuld	%f0, %f6, %f6
	.word	0xc9180019	! t0_kref+0x3fac:   	ldd	[%g0 + %i1], %f4
	.word	0x905dafe1	! t0_kref+0x3fb0:   	smul	%l6, 0xfe1, %o0
	.word	0xc11f4019	! t0_kref+0x3fb4:   	ldd	[%i5 + %i1], %f0
	.word	0x89a000a5	! t0_kref+0x3fb8:   	fnegs	%f5, %f4
	.word	0xee30a006	! t0_kref+0x3fbc:   	sth	%l7, [%g2 + 6]
	.word	0x9865ff46	! t0_kref+0x3fc0:   	subc	%l7, -0xba, %o4
	.word	0xee30a010	! t0_kref+0x3fc4:   	sth	%l7, [%g2 + 0x10]
	.word	0x81858000	! t0_kref+0x3fc8:   	wr	%l6, %g0, %y
	.word	0x81a98aa9	! t0_kref+0x3fcc:   	fcmpes	%fcc0, %f6, %f9
	.word	0x80758017	! t0_kref+0x3fd0:   	udiv	%l6, %l7, %g0
	.word	0x93a00122	! t0_kref+0x3fd4:   	fabss	%f2, %f9
	.word	0xc16e0017	! t0_kref+0x3fd8:   	prefetch	%i0 + %l7, 0
	.word	0xd1270019	! t0_kref+0x3fdc:   	st	%f8, [%i4 + %i1]
	.word	0x8ba018c6	! t0_kref+0x3fe0:   	fdtos	%f6, %f5
	.word	0x9a5dc016	! t0_kref+0x3fe4:   	smul	%l7, %l6, %o5
	.word	0x80e5a265	! t0_kref+0x3fe8:   	subccc	%l6, 0x265, %g0
	.word	0xd4162010	! t0_kref+0x3fec:   	lduh	[%i0 + 0x10], %o2
	.word	0x86102004	! t0_kref+0x3ff0:   	mov	0x4, %g3
	.word	0x86a0e001	! t0_kref+0x3ff4:   	subcc	%g3, 1, %g3
	.word	0x22800006	! t0_kref+0x3ff8:   	be,a	_kref+0x4010
	.word	0x9435a837	! t0_kref+0x3ffc:   	orn	%l6, 0x837, %o2
	.word	0xda6e200a	! t0_kref+0x4000:   	ldstub	[%i0 + 0xa], %o5
	.word	0x81a98ac4	! t0_kref+0x4004:   	fcmped	%fcc0, %f6, %f4
	.word	0x973da000	! t0_kref+0x4008:   	sra	%l6, 0x0, %o3
	.word	0x8da109a3	! t0_kref+0x400c:   	fdivs	%f4, %f3, %f6
	.word	0xec30a00c	! t0_kref+0x4010:   	sth	%l6, [%g2 + 0xc]
	.word	0x99258017	! t0_kref+0x4014:   	mulscc	%l6, %l7, %o4
	.word	0xe86e8019	! t0_kref+0x4018:   	ldstub	[%i2 + %i1], %l4
	.word	0xc16e4017	! t0_kref+0x401c:   	prefetch	%i1 + %l7, 0
	.word	0x8005c016	! t0_kref+0x4020:   	add	%l7, %l6, %g0
	.word	0xf76e401a	! t0_kref+0x4024:   	prefetch	%i1 + %i2, 27
	.word	0x98258016	! t0_kref+0x4028:   	sub	%l6, %l6, %o4
	.word	0x92f58017	! t0_kref+0x402c:   	udivcc	%l6, %l7, %o1
	.word	0x9b35e011	! t0_kref+0x4030:   	srl	%l7, 0x11, %o5
	.word	0xd4d6101b	! t0_kref+0x4034:   	ldsha	[%i0 + %i3]0x80, %o2
	.word	0x132fedce	! t0_kref+0x4038:   	sethi	%hi(0xbfb73800), %o1
	.word	0x9005e649	! t0_kref+0x403c:   	add	%l7, 0x649, %o0
	.word	0xc5263fe8	! t0_kref+0x4040:   	st	%f2, [%i0 - 0x18]
	.word	0x85a009c4	! t0_kref+0x4044:   	fdivd	%f0, %f4, %f2
	.word	0xec270019	! t0_kref+0x4048:   	st	%l6, [%i4 + %i1]
	.word	0xe56e401c	! t0_kref+0x404c:   	prefetch	%i1 + %i4, 18
	.word	0xc07e7fe8	! t0_kref+0x4050:   	swap	[%i1 - 0x18], %g0
	.word	0x933da016	! t0_kref+0x4054:   	sra	%l6, 0x16, %o1
	.word	0x90c5c017	! t0_kref+0x4058:   	addccc	%l7, %l7, %o0
	.word	0x925dc017	! t0_kref+0x405c:   	smul	%l7, %l7, %o1
	.word	0x9665c017	! t0_kref+0x4060:   	subc	%l7, %l7, %o3
	.word	0x37800001	! t0_kref+0x4064:   	fbge,a	_kref+0x4068
	.word	0xec28a000	! t0_kref+0x4068:   	stb	%l6, [%g2]
	.word	0x83a018c4	! t0_kref+0x406c:   	fdtos	%f4, %f1
	.word	0xcd1fbd88	! t0_kref+0x4070:   	ldd	[%fp - 0x278], %f6
	.word	0x8143c000	! t0_kref+0x4074:   	stbar
	.word	0x913da018	! t0_kref+0x4078:   	sra	%l6, 0x18, %o0
	.word	0x92a5e88d	! t0_kref+0x407c:   	subcc	%l7, 0x88d, %o1
	.word	0x928d8017	! t0_kref+0x4080:   	andcc	%l6, %l7, %o1
	.word	0x913d8017	! t0_kref+0x4084:   	sra	%l6, %l7, %o0
	.word	0x9f414000	! t0_kref+0x4088:   	mov	%pc, %o7
!	.word	0x3c4fafdd	! t0_kref+0x408c:   	bpos,a,pt	%icc, SYM(t0_subr1)
	   	bpos,a,pt	%icc, SYM(t0_subr1)
	.word	0x92d5ae9f	! t0_kref+0x4090:   	umulcc	%l6, 0xe9f, %o1
	.word	0x85a01905	! t0_kref+0x4094:   	fitod	%f5, %f2
	.word	0xec270018	! t0_kref+0x4098:   	st	%l6, [%i4 + %i0]
	.word	0x8143c000	! t0_kref+0x409c:   	stbar
	.word	0xcd266008	! t0_kref+0x40a0:   	st	%f6, [%i1 + 8]
	.word	0xec3e001d	! t0_kref+0x40a4:   	std	%l6, [%i0 + %i5]
	.word	0x9035c017	! t0_kref+0x40a8:   	orn	%l7, %l7, %o0
	.word	0xec267fe0	! t0_kref+0x40ac:   	st	%l6, [%i1 - 0x20]
	.word	0x85a018c2	! t0_kref+0x40b0:   	fdtos	%f2, %f2
	.word	0xecae501a	! t0_kref+0x40b4:   	stba	%l6, [%i1 + %i2]0x80
	.word	0xcd1fbe68	! t0_kref+0x40b8:   	ldd	[%fp - 0x198], %f6
	.word	0xde16401b	! t0_kref+0x40bc:   	lduh	[%i1 + %i3], %o7
	.word	0x8da01084	! t0_kref+0x40c0:   	fxtos	%f4, %f6
	.word	0x80d5b8ec	! t0_kref+0x40c4:   	umulcc	%l6, -0x714, %g0
	.word	0x90e5e930	! t0_kref+0x40c8:   	subccc	%l7, 0x930, %o0
	.word	0x90d58017	! t0_kref+0x40cc:   	umulcc	%l6, %l7, %o0
	.word	0x81a9c040	! t0_kref+0x40d0:   	fmovdu	%fcc0, %f0, %f0
	.word	0x92d58017	! t0_kref+0x40d4:   	umulcc	%l6, %l7, %o1
	.word	0xe678a034	! t0_kref+0x40d8:   	swap	[%g2 + 0x34], %l3
	.word	0x9a45ecf9	! t0_kref+0x40dc:   	addc	%l7, 0xcf9, %o5
	.word	0x81a94aa6	! t0_kref+0x40e0:   	fcmpes	%fcc0, %f5, %f6
	.word	0x89a000a0	! t0_kref+0x40e4:   	fnegs	%f0, %f4
	sethi	%hi(2f), %o7
	.word	0xe40be12c	! t0_kref+0x40ec:   	ldub	[%o7 + 0x12c], %l2
	.word	0xa41ca00c	! t0_kref+0x40f0:   	xor	%l2, 0xc, %l2
	.word	0xe42be12c	! t0_kref+0x40f4:   	stb	%l2, [%o7 + 0x12c]
	.word	0x81dbe12c	! t0_kref+0x40f8:   	flush	%o7 + 0x12c
	.word	0x80c5f1a2	! t0_kref+0x40fc:   	addccc	%l7, -0xe5e, %g0
	.word	0xee362006	! t0_kref+0x4100:   	sth	%l7, [%i0 + 6]
	.word	0x87a000a6	! t0_kref+0x4104:   	fnegs	%f6, %f3
	.word	0x89a00844	! t0_kref+0x4108:   	faddd	%f0, %f4, %f4
	.word	0xc0865000	! t0_kref+0x410c:   	lda	[%i1]0x80, %g0
	.word	0x9af5f047	! t0_kref+0x4110:   	udivcc	%l7, -0xfb9, %o5
	.word	0xecf81019	! t0_kref+0x4114:   	swapa	[%g0 + %i1]0x80, %l6
	.word	0xee6e3ff9	! t0_kref+0x4118:   	ldstub	[%i0 - 7], %l7
	.word	0x8da01927	! t0_kref+0x411c:   	fstod	%f7, %f6
	.word	0xd8167fea	! t0_kref+0x4120:   	lduh	[%i1 - 0x16], %o4
	.word	0xf9ee101a	! t0_kref+0x4124:   	prefetcha	%i0 + %i2, 28
	.word	0x98bdc017	! t0_kref+0x4128:   	xnorcc	%l7, %l7, %o4
2:	.word	0xa135e014	! t0_kref+0x412c:   	srl	%l7, 0x14, %l0
	sethi	%hi(2f), %o7
	.word	0xe40be144	! t0_kref+0x4134:   	ldub	[%o7 + 0x144], %l2
	.word	0xa41ca00c	! t0_kref+0x4138:   	xor	%l2, 0xc, %l2
	.word	0xe42be144	! t0_kref+0x413c:   	stb	%l2, [%o7 + 0x144]
	.word	0x81dbe144	! t0_kref+0x4140:   	flush	%o7 + 0x144
2:	.word	0x91a01925	! t0_kref+0x4144:   	fstod	%f5, %f8
	.word	0x91a01880	! t0_kref+0x4148:   	fitos	%f0, %f8
	.word	0xecae9018	! t0_kref+0x414c:   	stba	%l6, [%i2 + %i0]0x80
	.word	0x808db497	! t0_kref+0x4150:   	btst	0xfffff497, %l6
	.word	0x8da008c0	! t0_kref+0x4154:   	fsubd	%f0, %f0, %f6
	.word	0x9e45c016	! t0_kref+0x4158:   	addc	%l7, %l6, %o7
	.word	0x17037f6d	! t0_kref+0x415c:   	sethi	%hi(0xdfdb400), %o3
	.word	0x9035b60a	! t0_kref+0x4160:   	orn	%l6, -0x9f6, %o0
	.word	0xee20a020	! t0_kref+0x4164:   	st	%l7, [%g2 + 0x20]
	.word	0x89a089a9	! t0_kref+0x4168:   	fdivs	%f2, %f9, %f4
	.word	0xda06401c	! t0_kref+0x416c:   	ld	[%i1 + %i4], %o5
	.word	0x9695ab44	! t0_kref+0x4170:   	orcc	%l6, 0xb44, %o3
	.word	0xefee501a	! t0_kref+0x4174:   	prefetcha	%i1 + %i2, 23
	.word	0x85a108c0	! t0_kref+0x4178:   	fsubd	%f4, %f0, %f2
	call	SYM(t0_subr0)
	.word	0xec20a02c	! t0_kref+0x4180:   	st	%l6, [%g2 + 0x2c]
	.word	0x9a058016	! t0_kref+0x4184:   	add	%l6, %l6, %o5
	.word	0xffee501b	! t0_kref+0x4188:   	prefetcha	%i1 + %i3, 31
	.word	0x90a58016	! t0_kref+0x418c:   	subcc	%l6, %l6, %o0
	.word	0x9135a011	! t0_kref+0x4190:   	srl	%l6, 0x11, %o0
	.word	0x96d5c017	! t0_kref+0x4194:   	umulcc	%l7, %l7, %o3
	.word	0x8da20942	! t0_kref+0x4198:   	fmuld	%f8, %f2, %f6
	.word	0xd6c71019	! t0_kref+0x419c:   	ldswa	[%i4 + %i1]0x80, %o3
	.word	0x81400000	! t0_kref+0x41a0:   	mov	%y, %g0
	.word	0xd648a036	! t0_kref+0x41a4:   	ldsb	[%g2 + 0x36], %o3
	.word	0xc1be5896	! t0_kref+0x41a8:   	stda	%f0, [%i1 + %l6]0xc4
	.word	0x8143c000	! t0_kref+0x41ac:   	stbar
	.word	0x23800008	! t0_kref+0x41b0:   	fbne,a	_kref+0x41d0
	.word	0x96a5f54a	! t0_kref+0x41b4:   	subcc	%l7, -0xab6, %o3
	.word	0x8da20844	! t0_kref+0x41b8:   	faddd	%f8, %f4, %f6
	.word	0x9e5dc017	! t0_kref+0x41bc:   	smul	%l7, %l7, %o7
	.word	0xd26e3fea	! t0_kref+0x41c0:   	ldstub	[%i0 - 0x16], %o1
	.word	0x85a00042	! t0_kref+0x41c4:   	fmovd	%f2, %f2
	.word	0x9045c016	! t0_kref+0x41c8:   	addc	%l7, %l6, %o0
	.word	0x963dadb7	! t0_kref+0x41cc:   	xnor	%l6, 0xdb7, %o3
	.word	0x9f414000	! t0_kref+0x41d0:   	mov	%pc, %o7
	.word	0x81a80ac0	! t0_kref+0x41d4:   	fcmped	%fcc0, %f0, %f0
	.word	0xc1be1896	! t0_kref+0x41d8:   	stda	%f0, [%i0 + %l6]0xc4
	.word	0xee2e6004	! t0_kref+0x41dc:   	stb	%l7, [%i1 + 4]
	.word	0xec366008	! t0_kref+0x41e0:   	sth	%l6, [%i1 + 8]
	.word	0x8da01906	! t0_kref+0x41e4:   	fitod	%f6, %f6
	.word	0xda062000	! t0_kref+0x41e8:   	ld	[%i0], %o5
	.word	0x94a5c017	! t0_kref+0x41ec:   	subcc	%l7, %l7, %o2
	.word	0x8ba01a25	! t0_kref+0x41f0:   	fstoi	%f5, %f5
	.word	0x9e35f88c	! t0_kref+0x41f4:   	orn	%l7, -0x774, %o7
	.word	0x98a5eb09	! t0_kref+0x41f8:   	subcc	%l7, 0xb09, %o4
	.word	0xe40866dc	! t0_kref+0x41fc:   	ldub	[%g1 + 0x6dc], %l2
	.word	0xa41ca00c	! t0_kref+0x4200:   	xor	%l2, 0xc, %l2
	.word	0xe42866dc	! t0_kref+0x4204:   	stb	%l2, [%g1 + 0x6dc]
	.word	0x81d866dc	! t0_kref+0x4208:   	flush	%g1 + 0x6dc
	.word	0xeef6501d	! t0_kref+0x420c:   	stxa	%l7, [%i1 + %i5]0x80
	.word	0xee36c019	! t0_kref+0x4210:   	sth	%l7, [%i3 + %i1]
	.word	0xd440a00c	! t0_kref+0x4214:   	ldsw	[%g2 + 0xc], %o2
2:	.word	0x1b06f967	! t0_kref+0x4218:   	sethi	%hi(0x1be59c00), %o5
	.word	0x8d85c016	! t0_kref+0x421c:   	wr	%l7, %l6, %fprs
	.word	0x8da008c0	! t0_kref+0x4220:   	fsubd	%f0, %f0, %f6
	.word	0xd4e81018	! t0_kref+0x4224:   	ldstuba	[%g0 + %i0]0x80, %o2
	.word	0xc368a000	! t0_kref+0x4228:   	prefetch	%g2, 1
	.word	0x90c5e1fb	! t0_kref+0x422c:   	addccc	%l7, 0x1fb, %o0
	.word	0xee362016	! t0_kref+0x4230:   	sth	%l7, [%i0 + 0x16]
	.word	0x91a01042	! t0_kref+0x4234:   	fdtox	%f2, %f8
	.word	0x8da00046	! t0_kref+0x4238:   	fmovd	%f6, %f6
	.word	0x8143c000	! t0_kref+0x423c:   	stbar
	.word	0xec36401b	! t0_kref+0x4240:   	sth	%l6, [%i1 + %i3]
	.word	0xec2e8018	! t0_kref+0x4244:   	stb	%l6, [%i2 + %i0]
	.word	0xd210a02a	! t0_kref+0x4248:   	lduh	[%g2 + 0x2a], %o1
	.word	0x81db0014	! t0_kref+0x424c:   	flush	%o4 + %l4
	.word	0x81a08842	! t0_kref+0x4250:   	faddd	%f2, %f2, %f0
	.word	0x91a018c2	! t0_kref+0x4254:   	fdtos	%f2, %f8
	.word	0xcd1fbf38	! t0_kref+0x4258:   	ldd	[%fp - 0xc8], %f6
	.word	0x13182815	! t0_kref+0x425c:   	sethi	%hi(0x60a05400), %o1
	.word	0xee763fe8	! t0_kref+0x4260:   	stx	%l7, [%i0 - 0x18]
	.word	0x81a088c2	! t0_kref+0x4264:   	fsubd	%f2, %f2, %f0
	.word	0xd0ee9018	! t0_kref+0x4268:   	ldstuba	[%i2 + %i0]0x80, %o0
	.word	0x89a08944	! t0_kref+0x426c:   	fmuld	%f2, %f4, %f4
	.word	0x89a188c2	! t0_kref+0x4270:   	fsubd	%f6, %f2, %f4
	.word	0x27800006	! t0_kref+0x4274:   	fbul,a	_kref+0x428c
	.word	0xee2e6004	! t0_kref+0x4278:   	stb	%l7, [%i1 + 4]
	.word	0x8fa089a8	! t0_kref+0x427c:   	fdivs	%f2, %f8, %f7
	.word	0x940dc016	! t0_kref+0x4280:   	and	%l7, %l6, %o2
	.word	0x81a01920	! t0_kref+0x4284:   	fstod	%f0, %f0
	.word	0x81aa4a28	! t0_kref+0x4288:   	fcmps	%fcc0, %f9, %f8
	.word	0x99258017	! t0_kref+0x428c:   	mulscc	%l6, %l7, %o4
	.word	0x8055b2a7	! t0_kref+0x4290:   	umul	%l6, -0xd59, %g0
	.word	0xba103fe0	! t0_kref+0x4294:   	mov	0xffffffe0, %i5
	.word	0xec262008	! t0_kref+0x4298:   	st	%l6, [%i0 + 8]
	.word	0x81a88aa1	! t0_kref+0x429c:   	fcmpes	%fcc0, %f2, %f1
	.word	0x8fa000a4	! t0_kref+0x42a0:   	fnegs	%f4, %f7
	call	SYM(t0_subr0)
	.word	0x8da18d21	! t0_kref+0x42a8:   	fsmuld	%f6, %f1, %f6
	.word	0x9fc00004	! t0_kref+0x42ac:   	call	%g0 + %g4
	.word	0xee367ff0	! t0_kref+0x42b0:   	sth	%l7, [%i1 - 0x10]
	.word	0xc726401c	! t0_kref+0x42b4:   	st	%f3, [%i1 + %i4]
	.word	0x929db564	! t0_kref+0x42b8:   	xorcc	%l6, -0xa9c, %o1
	.word	0x93a00022	! t0_kref+0x42bc:   	fmovs	%f2, %f9
	.word	0x80858016	! t0_kref+0x42c0:   	addcc	%l6, %l6, %g0
	.word	0x813da012	! t0_kref+0x42c4:   	sra	%l6, 0x12, %g0
	.word	0x9035b203	! t0_kref+0x42c8:   	orn	%l6, -0xdfd, %o0
	.word	0xc9bf5a59	! t0_kref+0x42cc:   	stda	%f4, [%i5 + %i1]0xd2
	.word	0x81a01921	! t0_kref+0x42d0:   	fstod	%f1, %f0
	.word	0x94d58016	! t0_kref+0x42d4:   	umulcc	%l6, %l6, %o2
	.word	0xd43e3ff0	! t0_kref+0x42d8:   	std	%o2, [%i0 - 0x10]
	.word	0x9f703397	! t0_kref+0x42dc:   	popc	-0xc69, %o7
	.word	0x81858000	! t0_kref+0x42e0:   	wr	%l6, %g0, %y
	.word	0x91a089c8	! t0_kref+0x42e4:   	fdivd	%f2, %f8, %f8
	.word	0xf207bfe0	! t0_kref+0x42e8:   	ld	[%fp - 0x20], %i1
	.word	0xe40867c8	! t0_kref+0x42ec:   	ldub	[%g1 + 0x7c8], %l2
	.word	0xa41ca00c	! t0_kref+0x42f0:   	xor	%l2, 0xc, %l2
	.word	0xe42867c8	! t0_kref+0x42f4:   	stb	%l2, [%g1 + 0x7c8]
	.word	0x81d867c8	! t0_kref+0x42f8:   	flush	%g1 + 0x7c8
	.word	0x81a209a0	! t0_kref+0x42fc:   	fdivs	%f8, %f0, %f0
	.word	0x93408000	! t0_kref+0x4300:   	mov	%ccr, %o1
2:	.word	0x98c5c016	! t0_kref+0x4304:   	addccc	%l7, %l6, %o4
	.word	0xc51fbc10	! t0_kref+0x4308:   	ldd	[%fp - 0x3f0], %f2
	.word	0xe40867f4	! t0_kref+0x430c:   	ldub	[%g1 + 0x7f4], %l2
	.word	0xa41ca00c	! t0_kref+0x4310:   	xor	%l2, 0xc, %l2
	.word	0xe42867f4	! t0_kref+0x4314:   	stb	%l2, [%g1 + 0x7f4]
	.word	0x81d867f4	! t0_kref+0x4318:   	flush	%g1 + 0x7f4
	.word	0x80a5fa41	! t0_kref+0x431c:   	cmp	%l7, -0x5bf
	.word	0xc16e7fe8	! t0_kref+0x4320:   	prefetch	%i1 - 0x18, 0
	.word	0xffee501d	! t0_kref+0x4324:   	prefetcha	%i1 + %i5, 31
	.word	0x87a000a9	! t0_kref+0x4328:   	fnegs	%f9, %f3
	.word	0x89a000c0	! t0_kref+0x432c:   	fnegd	%f0, %f4
2:	.word	0x85a018c2	! t0_kref+0x4330:   	fdtos	%f2, %f2
	.word	0x81a98a24	! t0_kref+0x4334:   	fcmps	%fcc0, %f6, %f4
	.word	0x9ea5c017	! t0_kref+0x4338:   	subcc	%l7, %l7, %o7
	.word	0x9a8de278	! t0_kref+0x433c:   	andcc	%l7, 0x278, %o5
	.word	0xd6166016	! t0_kref+0x4340:   	lduh	[%i1 + 0x16], %o3
	.word	0x86102002	! t0_kref+0x4344:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x4348:   	bne,a	_kref+0x4348
	.word	0x86a0e001	! t0_kref+0x434c:   	subcc	%g3, 1, %g3
	.word	0x85a01902	! t0_kref+0x4350:   	fitod	%f2, %f2
	.word	0xd27f0018	! t0_kref+0x4354:   	swap	[%i4 + %i0], %o1
	.word	0x89a08848	! t0_kref+0x4358:   	faddd	%f2, %f8, %f4
	.word	0x85a089c4	! t0_kref+0x435c:   	fdivd	%f2, %f4, %f2
	.word	0x9ea5f05e	! t0_kref+0x4360:   	subcc	%l7, -0xfa2, %o7
	.word	0x96d5a000	! t0_kref+0x4364:   	umulcc	%l6, 0, %o3
	.word	0xc7ee5017	! t0_kref+0x4368:   	prefetcha	%i1 + %l7, 3
	.word	0x94458016	! t0_kref+0x436c:   	addc	%l6, %l6, %o2
	.word	0x86102007	! t0_kref+0x4370:   	mov	0x7, %g3
	.word	0x86a0e001	! t0_kref+0x4374:   	subcc	%g3, 1, %g3
	.word	0x22800006	! t0_kref+0x4378:   	be,a	_kref+0x4390
	.word	0x9425bc0e	! t0_kref+0x437c:   	sub	%l6, -0x3f2, %o2
	.word	0x929d8017	! t0_kref+0x4380:   	xorcc	%l6, %l7, %o1
	.word	0x92358017	! t0_kref+0x4384:   	orn	%l6, %l7, %o1
	.word	0x2bbffffb	! t0_kref+0x4388:   	fbug,a	_kref+0x4374
	.word	0xd65e2000	! t0_kref+0x438c:   	ldx	[%i0], %o3
	.word	0x8da208c0	! t0_kref+0x4390:   	fsubd	%f8, %f0, %f6
	.word	0xc06e7ffa	! t0_kref+0x4394:   	ldstub	[%i1 - 6], %g0
	.word	0xee266000	! t0_kref+0x4398:   	st	%l7, [%i1]
	.word	0x9045e15d	! t0_kref+0x439c:   	addc	%l7, 0x15d, %o0
	.word	0xec28a01c	! t0_kref+0x43a0:   	stb	%l6, [%g2 + 0x1c]
	.word	0x8da089a0	! t0_kref+0x43a4:   	fdivs	%f2, %f0, %f6
	.word	0x80a5c016	! t0_kref+0x43a8:   	cmp	%l7, %l6
	.word	0x2b800008	! t0_kref+0x43ac:   	fbug,a	_kref+0x43cc
	.word	0xc520a03c	! t0_kref+0x43b0:   	st	%f2, [%g2 + 0x3c]
	.word	0x91a01a27	! t0_kref+0x43b4:   	fstoi	%f7, %f8
	.word	0x8ba1c9a3	! t0_kref+0x43b8:   	fdivs	%f7, %f3, %f5
	.word	0x812d8017	! t0_kref+0x43bc:   	sll	%l6, %l7, %g0
	.word	0x91a18d22	! t0_kref+0x43c0:   	fsmuld	%f6, %f2, %f8
	.word	0x96a5aaa0	! t0_kref+0x43c4:   	subcc	%l6, 0xaa0, %o3
	.word	0x993de005	! t0_kref+0x43c8:   	sra	%l7, 0x5, %o4
	.word	0x89a249a4	! t0_kref+0x43cc:   	fdivs	%f9, %f4, %f4
	.word	0x92f5e483	! t0_kref+0x43d0:   	udivcc	%l7, 0x483, %o1
	.word	0x8da1c9a5	! t0_kref+0x43d4:   	fdivs	%f7, %f5, %f6
	.word	0x8da018c2	! t0_kref+0x43d8:   	fdtos	%f2, %f6
	.word	0x81da001e	! t0_kref+0x43dc:   	flush	%o0 + %fp
	call	SYM(t0_subr3)
	.word	0xd84e8019	! t0_kref+0x43e4:   	ldsb	[%i2 + %i1], %o4
	.word	0xee362018	! t0_kref+0x43e8:   	sth	%l7, [%i0 + 0x18]
	.word	0x81db401a	! t0_kref+0x43ec:   	flush	%o5 + %i2
	.word	0xde16c019	! t0_kref+0x43f0:   	lduh	[%i3 + %i1], %o7
	.word	0x973da00d	! t0_kref+0x43f4:   	sra	%l6, 0xd, %o3
	.word	0xd240a00c	! t0_kref+0x43f8:   	ldsw	[%g2 + 0xc], %o1
	.word	0xeca65000	! t0_kref+0x43fc:   	sta	%l6, [%i1]0x80
	.word	0x91a01889	! t0_kref+0x4400:   	fitos	%f9, %f8
	.word	0x96158016	! t0_kref+0x4404:   	or	%l6, %l6, %o3
	.word	0x9e0dc017	! t0_kref+0x4408:   	and	%l7, %l7, %o7
	.word	0x81aa0aa7	! t0_kref+0x440c:   	fcmpes	%fcc0, %f8, %f7
	.word	0x81a8caa4	! t0_kref+0x4410:   	fcmpes	%fcc0, %f3, %f4
	.word	0xe40868f0	! t0_kref+0x4414:   	ldub	[%g1 + 0x8f0], %l2
	.word	0xa41ca00c	! t0_kref+0x4418:   	xor	%l2, 0xc, %l2
	.word	0xe42868f0	! t0_kref+0x441c:   	stb	%l2, [%g1 + 0x8f0]
	.word	0x81d868f0	! t0_kref+0x4420:   	flush	%g1 + 0x8f0
	.word	0xc068a012	! t0_kref+0x4424:   	ldstub	[%g2 + 0x12], %g0
	.word	0xc368a000	! t0_kref+0x4428:   	prefetch	%g2, 1
2:	.word	0xa08de142	! t0_kref+0x442c:   	andcc	%l7, 0x142, %l0
	.word	0xd3262008	! t0_kref+0x4430:   	st	%f9, [%i0 + 8]
	.word	0xe408693c	! t0_kref+0x4434:   	ldub	[%g1 + 0x93c], %l2
	.word	0xa41ca00c	! t0_kref+0x4438:   	xor	%l2, 0xc, %l2
	.word	0xe428693c	! t0_kref+0x443c:   	stb	%l2, [%g1 + 0x93c]
	.word	0x81d8693c	! t0_kref+0x4440:   	flush	%g1 + 0x93c
	.word	0xd210a020	! t0_kref+0x4444:   	lduh	[%g2 + 0x20], %o1
	.word	0x85a018c8	! t0_kref+0x4448:   	fdtos	%f8, %f2
	.word	0xec36c019	! t0_kref+0x444c:   	sth	%l6, [%i3 + %i1]
	.word	0x87a000a9	! t0_kref+0x4450:   	fnegs	%f9, %f3
	.word	0x81a88a22	! t0_kref+0x4454:   	fcmps	%fcc0, %f2, %f2
	.word	0x98758017	! t0_kref+0x4458:   	udiv	%l6, %l7, %o4
	.word	0x98c58016	! t0_kref+0x445c:   	addccc	%l6, %l6, %o4
	.word	0x98458017	! t0_kref+0x4460:   	addc	%l6, %l7, %o4
	.word	0xec267ff0	! t0_kref+0x4464:   	st	%l6, [%i1 - 0x10]
	.word	0xd200a01c	! t0_kref+0x4468:   	ld	[%g2 + 0x1c], %o1
	.word	0x80a5e83f	! t0_kref+0x446c:   	cmp	%l7, 0x83f
	.word	0x92d5fb52	! t0_kref+0x4470:   	umulcc	%l7, -0x4ae, %o1
	.word	0x91abc044	! t0_kref+0x4474:   	fmovdo	%fcc0, %f4, %f8
2:	.word	0x992dc016	! t0_kref+0x4478:   	sll	%l7, %l6, %o4
	.word	0xee28a01a	! t0_kref+0x447c:   	stb	%l7, [%g2 + 0x1a]
	.word	0xc19e2012	! t0_kref+0x4480:   	ldda	[%i0 + 0x12]%asi, %f0
	.word	0x9f25aae7	! t0_kref+0x4484:   	mulscc	%l6, 0xae7, %o7
	.word	0xd0b81019	! t0_kref+0x4488:   	stda	%o0, [%g0 + %i1]0x80
	.word	0x98d5c016	! t0_kref+0x448c:   	umulcc	%l7, %l6, %o4
	.word	0xec267ff4	! t0_kref+0x4490:   	st	%l6, [%i1 - 0xc]
	.word	0xea7e001c	! t0_kref+0x4494:   	swap	[%i0 + %i4], %l5
	.word	0x89a00140	! t0_kref+0x4498:   	fabsd	%f0, %f4
	.word	0x8fa000a3	! t0_kref+0x449c:   	fnegs	%f3, %f7
	.word	0x81dbf52d	! t0_kref+0x44a0:   	flush	%o7 - 0xad3
	.word	0x9fc10000	! t0_kref+0x44a4:   	call	%g4
	.word	0xc700a01c	! t0_kref+0x44a8:   	ld	[%g2 + 0x1c], %f3
	.word	0xecb6101b	! t0_kref+0x44ac:   	stha	%l6, [%i0 + %i3]0x80
	.word	0x985dc017	! t0_kref+0x44b0:   	smul	%l7, %l7, %o4
	.word	0x89a01a22	! t0_kref+0x44b4:   	fstoi	%f2, %f4
	.word	0x98a5e2bf	! t0_kref+0x44b8:   	subcc	%l7, 0x2bf, %o4
	.word	0x85a000a2	! t0_kref+0x44bc:   	fnegs	%f2, %f2
	.word	0x92d58016	! t0_kref+0x44c0:   	umulcc	%l6, %l6, %o1
	.word	0x93a000a5	! t0_kref+0x44c4:   	fnegs	%f5, %f9
	.word	0x9fc00004	! t0_kref+0x44c8:   	call	%g0 + %g4
	.word	0x9895e7b5	! t0_kref+0x44cc:   	orcc	%l7, 0x7b5, %o4
	.word	0x86102021	! t0_kref+0x44d0:   	mov	0x21, %g3
	.word	0x86a0e001	! t0_kref+0x44d4:   	subcc	%g3, 1, %g3
	.word	0x22800010	! t0_kref+0x44d8:   	be,a	_kref+0x4518
	.word	0xfb6e3fe0	! t0_kref+0x44dc:   	prefetch	%i0 - 0x20, 29
	.word	0xda00a028	! t0_kref+0x44e0:   	ld	[%g2 + 0x28], %o5
	.word	0x9415b772	! t0_kref+0x44e4:   	or	%l6, -0x88e, %o2
	.word	0x35800006	! t0_kref+0x44e8:   	fbue,a	_kref+0x4500
	.word	0xc3ee1016	! t0_kref+0x44ec:   	prefetcha	%i0 + %l6, 1
	.word	0x81a80a48	! t0_kref+0x44f0:   	fcmpd	%fcc0, %f0, %f8
	.word	0x87a00020	! t0_kref+0x44f4:   	fmovs	%f0, %f3
	.word	0xec30a016	! t0_kref+0x44f8:   	sth	%l6, [%g2 + 0x16]
	.word	0x94d58017	! t0_kref+0x44fc:   	umulcc	%l6, %l7, %o2
	.word	0x98a5c017	! t0_kref+0x4500:   	subcc	%l7, %l7, %o4
	.word	0xf56e6018	! t0_kref+0x4504:   	prefetch	%i1 + 0x18, 26
	.word	0x980dfad1	! t0_kref+0x4508:   	and	%l7, -0x52f, %o4
	.word	0x3bbffff2	! t0_kref+0x450c:   	fble,a	_kref+0x44d4
	.word	0xe87e3ff4	! t0_kref+0x4510:   	swap	[%i0 - 0xc], %l4
	.word	0x81dd401f	! t0_kref+0x4514:   	flush	%l5 + %i7
	.word	0xc16e7ff0	! t0_kref+0x4518:   	prefetch	%i1 - 0x10, 0
	.word	0x81a9ca27	! t0_kref+0x451c:   	fcmps	%fcc0, %f7, %f7
	.word	0x81a109a7	! t0_kref+0x4520:   	fdivs	%f4, %f7, %f0
	.word	0x94f5bbf1	! t0_kref+0x4524:   	udivcc	%l6, -0x40f, %o2
	.word	0x91a01108	! t0_kref+0x4528:   	fxtod	%f8, %f8
	.word	0x94d5c017	! t0_kref+0x452c:   	umulcc	%l7, %l7, %o2
	.word	0x9455bd57	! t0_kref+0x4530:   	umul	%l6, -0x2a9, %o2
	.word	0x93a00024	! t0_kref+0x4534:   	fmovs	%f4, %f9
	.word	0x81aa0aa5	! t0_kref+0x4538:   	fcmpes	%fcc0, %f8, %f5
	.word	0x9205e775	! t0_kref+0x453c:   	add	%l7, 0x775, %o1
	.word	0x8ba000a4	! t0_kref+0x4540:   	fnegs	%f4, %f5
	.word	0x94458016	! t0_kref+0x4544:   	addc	%l6, %l6, %o2
	.word	0x9e35f463	! t0_kref+0x4548:   	orn	%l7, -0xb9d, %o7
	.word	0xc807bfe4	! t0_kref+0x454c:   	ld	[%fp - 0x1c], %g4
	.word	0x1920f744	! t0_kref+0x4550:   	sethi	%hi(0x83dd1000), %o4
	.word	0x9f414000	! t0_kref+0x4554:   	mov	%pc, %o7
!	.word	0x2897cea8	! t0_kref+0x4558:   	bleu,a	SYM(t0_subr0)
	   	bleu,a	SYM(t0_subr0)
	.word	0x94258017	! t0_kref+0x455c:   	sub	%l6, %l7, %o2
	.word	0x8fa00025	! t0_kref+0x4560:   	fmovs	%f5, %f7
	.word	0x81aa0aa4	! t0_kref+0x4564:   	fcmpes	%fcc0, %f8, %f4
	.word	0x98d5ac5b	! t0_kref+0x4568:   	umulcc	%l6, 0xc5b, %o4
	.word	0x9295c016	! t0_kref+0x456c:   	orcc	%l7, %l6, %o1
	.word	0xc11fbfc8	! t0_kref+0x4570:   	ldd	[%fp - 0x38], %f0
	.word	0x81a8caa3	! t0_kref+0x4574:   	fcmpes	%fcc0, %f3, %f3
	.word	0x81aa0a42	! t0_kref+0x4578:   	fcmpd	%fcc0, %f8, %f2
	.word	0x903dfa19	! t0_kref+0x457c:   	xnor	%l7, -0x5e7, %o0
	.word	0x9a45af50	! t0_kref+0x4580:   	addc	%l6, 0xf50, %o5
	.word	0xd2070018	! t0_kref+0x4584:   	ld	[%i4 + %i0], %o1
	.word	0x8da01885	! t0_kref+0x4588:   	fitos	%f5, %f6
	call	SYM(t0_subr2)
	.word	0xa0d58017	! t0_kref+0x4590:   	umulcc	%l6, %l7, %l0
	.word	0xc9be1a5c	! t0_kref+0x4594:   	stda	%f4, [%i0 + %i4]0xd2
	.word	0xde480019	! t0_kref+0x4598:   	ldsb	[%g0 + %i1], %o7
	.word	0x92f5b6e3	! t0_kref+0x459c:   	udivcc	%l6, -0x91d, %o1
	.word	0x9ed5ecb0	! t0_kref+0x45a0:   	umulcc	%l7, 0xcb0, %o7
	.word	0x80f5c017	! t0_kref+0x45a4:   	udivcc	%l7, %l7, %g0
	.word	0xee362000	! t0_kref+0x45a8:   	sth	%l7, [%i0]
	.word	0x878020f0	! t0_kref+0x45ac:   	mov	0xf0, %asi
	.word	0x98a5e93e	! t0_kref+0x45b0:   	subcc	%l7, 0x93e, %o4
	.word	0x86102003	! t0_kref+0x45b4:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x45b8:   	bne,a	_kref+0x45b8
	.word	0x86a0e001	! t0_kref+0x45bc:   	subcc	%g3, 1, %g3
	.word	0x91a01904	! t0_kref+0x45c0:   	fitod	%f4, %f8
	.word	0x91a24922	! t0_kref+0x45c4:   	fmuls	%f9, %f2, %f8
	.word	0x85a018c6	! t0_kref+0x45c8:   	fdtos	%f6, %f2
	.word	0xcda6101c	! t0_kref+0x45cc:   	sta	%f6, [%i0 + %i4]0x80
	.word	0xd416c019	! t0_kref+0x45d0:   	lduh	[%i3 + %i1], %o2
	.word	0x8143e040	! t0_kref+0x45d4:   	membar	0x40
	.word	0x98958016	! t0_kref+0x45d8:   	orcc	%l6, %l6, %o4
	.word	0x9ac5ad65	! t0_kref+0x45dc:   	addccc	%l6, 0xd65, %o5
	.word	0x81a98a21	! t0_kref+0x45e0:   	fcmps	%fcc0, %f6, %f1
	.word	0x89a24d28	! t0_kref+0x45e4:   	fsmuld	%f9, %f8, %f4
	.word	0xd120a034	! t0_kref+0x45e8:   	st	%f8, [%g2 + 0x34]
	.word	0x8143c000	! t0_kref+0x45ec:   	stbar
	.word	0xe67e0000	! t0_kref+0x45f0:   	swap	[%i0], %l3
	.word	0x9a05aad8	! t0_kref+0x45f4:   	add	%l6, 0xad8, %o5
	.word	0x8005fa36	! t0_kref+0x45f8:   	add	%l7, -0x5ca, %g0
	.word	0x9ea5e111	! t0_kref+0x45fc:   	subcc	%l7, 0x111, %o7
	.word	0x9ea5e3a1	! t0_kref+0x4600:   	subcc	%l7, 0x3a1, %o7
	.word	0x87a00025	! t0_kref+0x4604:   	fmovs	%f5, %f3
	.word	0x19325c88	! t0_kref+0x4608:   	sethi	%hi(0xc9722000), %o4
	.word	0x9265e5ee	! t0_kref+0x460c:   	subc	%l7, 0x5ee, %o1
	.word	0x8da00d28	! t0_kref+0x4610:   	fsmuld	%f0, %f8, %f6
	.word	0x9875c017	! t0_kref+0x4614:   	udiv	%l7, %l7, %o4
	.word	0x90d5bb8d	! t0_kref+0x4618:   	umulcc	%l6, -0x473, %o0
	.word	0x9a058017	! t0_kref+0x461c:   	add	%l6, %l7, %o5
	.word	0xe168a04e	! t0_kref+0x4620:   	prefetch	%g2 + 0x4e, 16
	.word	0x968da9a0	! t0_kref+0x4624:   	andcc	%l6, 0x9a0, %o3
	.word	0x96d5c017	! t0_kref+0x4628:   	umulcc	%l7, %l7, %o3
	.word	0x0108752d	! t0_kref+0x462c:   	sethi	%hi(0x21d4b400), %g0
	.word	0x9a1d8016	! t0_kref+0x4630:   	xor	%l6, %l6, %o5
	.word	0x80b5a25f	! t0_kref+0x4634:   	orncc	%l6, 0x25f, %g0
	.word	0x80b58016	! t0_kref+0x4638:   	orncc	%l6, %l6, %g0
	.word	0x8da149a8	! t0_kref+0x463c:   	fdivs	%f5, %f8, %f6
	.word	0x91a000a0	! t0_kref+0x4640:   	fnegs	%f0, %f8
	.word	0x9935a013	! t0_kref+0x4644:   	srl	%l6, 0x13, %o4
	.word	0x89a00025	! t0_kref+0x4648:   	fmovs	%f5, %f4
	.word	0xd4503d34	! t0_kref+0x464c:   	ldsh	[%g0 - 0x2cc], %o2
	.word	0x87a88026	! t0_kref+0x4650:   	fmovslg	%fcc0, %f6, %f3
	.word	0xfb6e001c	! t0_kref+0x4654:   	prefetch	%i0 + %i4, 29
	.word	0xc9be1a1b	! t0_kref+0x4658:   	stda	%f4, [%i0 + %i3]0xd0
	.word	0x9abdc016	! t0_kref+0x465c:   	xnorcc	%l7, %l6, %o5
	.word	0xc1ee5017	! t0_kref+0x4660:   	prefetcha	%i1 + %l7, 0
	.word	0x85a188c8	! t0_kref+0x4664:   	fsubd	%f6, %f8, %f2
	.word	0x96d5c017	! t0_kref+0x4668:   	umulcc	%l7, %l7, %o3
	.word	0x81a088c0	! t0_kref+0x466c:   	fsubd	%f2, %f0, %f0
	.word	0x9695e346	! t0_kref+0x4670:   	orcc	%l7, 0x346, %o3
	.word	0x993d8016	! t0_kref+0x4674:   	sra	%l6, %l6, %o4
	.word	0x89a208c6	! t0_kref+0x4678:   	fsubd	%f8, %f6, %f4
	.word	0x93a01a20	! t0_kref+0x467c:   	fstoi	%f0, %f9
	.word	0x98a5bf4a	! t0_kref+0x4680:   	subcc	%l6, -0xb6, %o4
	.word	0xe3b8a040	! t0_kref+0x4684:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xe4086b84	! t0_kref+0x4688:   	ldub	[%g1 + 0xb84], %l2
	.word	0xa41ca00c	! t0_kref+0x468c:   	xor	%l2, 0xc, %l2
	.word	0xe4286b84	! t0_kref+0x4690:   	stb	%l2, [%g1 + 0xb84]
	.word	0x81d86b84	! t0_kref+0x4694:   	flush	%g1 + 0xb84
	.word	0x19236509	! t0_kref+0x4698:   	sethi	%hi(0x8d942400), %o4
	.word	0xe83e6010	! t0_kref+0x469c:   	std	%l4, [%i1 + 0x10]
	.word	0x928db8b5	! t0_kref+0x46a0:   	andcc	%l6, -0x74b, %o1
	.word	0x94258016	! t0_kref+0x46a4:   	sub	%l6, %l6, %o2
	.word	0x92958016	! t0_kref+0x46a8:   	orcc	%l6, %l6, %o1
	.word	0x8d85a1c7	! t0_kref+0x46ac:   	wr	%l6, 0x1c7, %fprs
	.word	0x9075c016	! t0_kref+0x46b0:   	udiv	%l7, %l6, %o0
	.word	0x9495e651	! t0_kref+0x46b4:   	orcc	%l7, 0x651, %o2
	.word	0xec364000	! t0_kref+0x46b8:   	sth	%l6, [%i1]
	.word	0xe168a083	! t0_kref+0x46bc:   	prefetch	%g2 + 0x83, 16
2:	.word	0x85a20846	! t0_kref+0x46c0:   	faddd	%f8, %f6, %f2
	.word	0xc398a080	! t0_kref+0x46c4:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0x001fffff	! t0_kref+0x46c8:   	illtrap	0x1fffff
	.word	0x87a009a7	! t0_kref+0x46cc:   	fdivs	%f0, %f7, %f3
	.word	0x8143c000	! t0_kref+0x46d0:   	stbar
	.word	0x9ead8017	! t0_kref+0x46d4:   	andncc	%l6, %l7, %o7
	.word	0xd3a01018	! t0_kref+0x46d8:   	sta	%f9, [%g0 + %i0]0x80
	.word	0x809dc016	! t0_kref+0x46dc:   	xorcc	%l7, %l6, %g0
	.word	0x9835a9d3	! t0_kref+0x46e0:   	orn	%l6, 0x9d3, %o4
	.word	0x8da01883	! t0_kref+0x46e4:   	fitos	%f3, %f6
	.word	0xd47e6008	! t0_kref+0x46e8:   	swap	[%i1 + 8], %o2
	.word	0x94dde383	! t0_kref+0x46ec:   	smulcc	%l7, 0x383, %o2
	.word	0xe4086bdc	! t0_kref+0x46f0:   	ldub	[%g1 + 0xbdc], %l2
	.word	0xa41ca00c	! t0_kref+0x46f4:   	xor	%l2, 0xc, %l2
	.word	0xe4286bdc	! t0_kref+0x46f8:   	stb	%l2, [%g1 + 0xbdc]
	.word	0x81d86bdc	! t0_kref+0x46fc:   	flush	%g1 + 0xbdc
	.word	0xe81e7ff8	! t0_kref+0x4700:   	ldd	[%i1 - 8], %l4
	.word	0xcd263ff8	! t0_kref+0x4704:   	st	%f6, [%i0 - 8]
	.word	0xeb68a049	! t0_kref+0x4708:   	prefetch	%g2 + 0x49, 21
	.word	0x98c58017	! t0_kref+0x470c:   	addccc	%l6, %l7, %o4
	.word	0x85a08923	! t0_kref+0x4710:   	fmuls	%f2, %f3, %f2
	.word	0x81a08940	! t0_kref+0x4714:   	fmuld	%f2, %f0, %f0
2:	.word	0x9a1db62c	! t0_kref+0x4718:   	xor	%l6, -0x9d4, %o5
	.word	0xd03e6000	! t0_kref+0x471c:   	std	%o0, [%i1]
	.word	0xd850a038	! t0_kref+0x4720:   	ldsh	[%g2 + 0x38], %o4
	.word	0xf207bfe0	! t0_kref+0x4724:   	ld	[%fp - 0x20], %i1
	.word	0xec28a01c	! t0_kref+0x4728:   	stb	%l6, [%g2 + 0x1c]
	.word	0xd0480019	! t0_kref+0x472c:   	ldsb	[%g0 + %i1], %o0
	.word	0xcd263ff4	! t0_kref+0x4730:   	st	%f6, [%i0 - 0xc]
	.word	0xe3b8a040	! t0_kref+0x4734:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x8fa000a9	! t0_kref+0x4738:   	fnegs	%f9, %f7
	.word	0xe83e6008	! t0_kref+0x473c:   	std	%l4, [%i1 + 8]
	.word	0xde4e201f	! t0_kref+0x4740:   	ldsb	[%i0 + 0x1f], %o7
	.word	0x83a149a4	! t0_kref+0x4744:   	fdivs	%f5, %f4, %f1
	.word	0xd49e101d	! t0_kref+0x4748:   	ldda	[%i0 + %i5]0x80, %o2
	.word	0x81aa0aa5	! t0_kref+0x474c:   	fcmpes	%fcc0, %f8, %f5
	.word	0xc1be5857	! t0_kref+0x4750:   	stda	%f0, [%i1 + %l7]0xc2
	.word	0x91258017	! t0_kref+0x4754:   	mulscc	%l6, %l7, %o0
	.word	0x8da01a20	! t0_kref+0x4758:   	fstoi	%f0, %f6
	.word	0x9855c017	! t0_kref+0x475c:   	umul	%l7, %l7, %o4
	.word	0xc5267ffc	! t0_kref+0x4760:   	st	%f2, [%i1 - 4]
	.word	0x91a01901	! t0_kref+0x4764:   	fitod	%f1, %f8
	.word	0x988df176	! t0_kref+0x4768:   	andcc	%l7, -0xe8a, %o4
	.word	0xcd1fbe90	! t0_kref+0x476c:   	ldd	[%fp - 0x170], %f6
	.word	0xe4086c54	! t0_kref+0x4770:   	ldub	[%g1 + 0xc54], %l2
	.word	0xa41ca00c	! t0_kref+0x4774:   	xor	%l2, 0xc, %l2
	.word	0xe4286c54	! t0_kref+0x4778:   	stb	%l2, [%g1 + 0xc54]
	.word	0x81d86c54	! t0_kref+0x477c:   	flush	%g1 + 0xc54
	.word	0x8135a019	! t0_kref+0x4780:   	srl	%l6, 0x19, %g0
	.word	0xec20a00c	! t0_kref+0x4784:   	st	%l6, [%g2 + 0xc]
	.word	0x81aa0aa4	! t0_kref+0x4788:   	fcmpes	%fcc0, %f8, %f4
	.word	0x9ac5b422	! t0_kref+0x478c:   	addccc	%l6, -0xbde, %o5
2:	.word	0x91a10944	! t0_kref+0x4790:   	fmuld	%f4, %f4, %f8
	.word	0xde10a00e	! t0_kref+0x4794:   	lduh	[%g2 + 0xe], %o7
	.word	0xf1ee501b	! t0_kref+0x4798:   	prefetcha	%i1 + %i3, 24
	.word	0x9875c016	! t0_kref+0x479c:   	udiv	%l7, %l6, %o4
	.word	0xd19f5019	! t0_kref+0x47a0:   	ldda	[%i5 + %i1]0x80, %f8
	.word	0x8da088c2	! t0_kref+0x47a4:   	fsubd	%f2, %f2, %f6
	.word	0x96c58016	! t0_kref+0x47a8:   	addccc	%l6, %l6, %o3
	.word	0x1311584a	! t0_kref+0x47ac:   	sethi	%hi(0x45612800), %o1
	.word	0xd66e3fea	! t0_kref+0x47b0:   	ldstub	[%i0 - 0x16], %o3
	.word	0xebee501b	! t0_kref+0x47b4:   	prefetcha	%i1 + %i3, 21
	.word	0x9a75c016	! t0_kref+0x47b8:   	udiv	%l7, %l6, %o5
	.word	0x8125c017	! t0_kref+0x47bc:   	mulscc	%l7, %l7, %g0
	.word	0x805da132	! t0_kref+0x47c0:   	smul	%l6, 0x132, %g0
	.word	0x9055efba	! t0_kref+0x47c4:   	umul	%l7, 0xfba, %o0
	.word	0x83a01a42	! t0_kref+0x47c8:   	fdtoi	%f2, %f1
	.word	0x33800004	! t0_kref+0x47cc:   	fbe,a	_kref+0x47dc
	.word	0x91418000	! t0_kref+0x47d0:   	mov	%fprs, %o0
	.word	0x9675f46e	! t0_kref+0x47d4:   	udiv	%l7, -0xb92, %o3
	.word	0x9e95c017	! t0_kref+0x47d8:   	orcc	%l7, %l7, %o7
	.word	0xe3b8a040	! t0_kref+0x47dc:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x37800005	! t0_kref+0x47e0:   	fbge,a	_kref+0x47f4
	.word	0x98a58017	! t0_kref+0x47e4:   	subcc	%l6, %l7, %o4
	.word	0x27800002	! t0_kref+0x47e8:   	fbul,a	_kref+0x47f0
	.word	0x96adc017	! t0_kref+0x47ec:   	andncc	%l7, %l7, %o3
	.word	0xe3b8a040	! t0_kref+0x47f0:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x97400000	! t0_kref+0x47f4:   	mov	%y, %o3
	.word	0x8035a141	! t0_kref+0x47f8:   	orn	%l6, 0x141, %g0
	.word	0x85a188c8	! t0_kref+0x47fc:   	fsubd	%f6, %f8, %f2
	.word	0x8185c000	! t0_kref+0x4800:   	wr	%l7, %g0, %y
	.word	0x83a109a1	! t0_kref+0x4804:   	fdivs	%f4, %f1, %f1
	.word	0x98e5b766	! t0_kref+0x4808:   	subccc	%l6, -0x89a, %o4
	.word	0x9fc00004	! t0_kref+0x480c:   	call	%g0 + %g4
	.word	0xa0d5c017	! t0_kref+0x4810:   	umulcc	%l7, %l7, %l0
	.word	0x81dfa5cf	! t0_kref+0x4814:   	flush	%fp + 0x5cf
	.word	0x90458016	! t0_kref+0x4818:   	addc	%l6, %l6, %o0
	.word	0x985de9dc	! t0_kref+0x481c:   	smul	%l7, 0x9dc, %o4
	.word	0x98f58016	! t0_kref+0x4820:   	udivcc	%l6, %l6, %o4
	.word	0xd11fbf58	! t0_kref+0x4824:   	ldd	[%fp - 0xa8], %f8
	.word	0x93a0c9a8	! t0_kref+0x4828:   	fdivs	%f3, %f8, %f9
	.word	0x9a458016	! t0_kref+0x482c:   	addc	%l6, %l6, %o5
	.word	0xec300019	! t0_kref+0x4830:   	sth	%l6, [%g0 + %i1]
	.word	0x92358016	! t0_kref+0x4834:   	orn	%l6, %l6, %o1
	.word	0x8da000a0	! t0_kref+0x4838:   	fnegs	%f0, %f6
	.word	0xd250a00a	! t0_kref+0x483c:   	ldsh	[%g2 + 0xa], %o1
	.word	0x9ea58016	! t0_kref+0x4840:   	subcc	%l6, %l6, %o7
	.word	0xc07e4000	! t0_kref+0x4844:   	swap	[%i1], %g0
	.word	0x86102002	! t0_kref+0x4848:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x484c:   	bne,a	_kref+0x484c
	.word	0x86a0e001	! t0_kref+0x4850:   	subcc	%g3, 1, %g3
	.word	0x81a9ca26	! t0_kref+0x4854:   	fcmps	%fcc0, %f7, %f6
	.word	0x9605f6dd	! t0_kref+0x4858:   	add	%l7, -0x923, %o3
	.word	0xe27e0000	! t0_kref+0x485c:   	swap	[%i0], %l1
	.word	0x85a108c8	! t0_kref+0x4860:   	fsubd	%f4, %f8, %f2
	.word	0x9f0dc017	! t0_kref+0x4864:   	tsubcc	%l7, %l7, %o7
	.word	0x93a00027	! t0_kref+0x4868:   	fmovs	%f7, %f9
	.word	0xee30a016	! t0_kref+0x486c:   	sth	%l7, [%g2 + 0x16]
	.word	0x33800006	! t0_kref+0x4870:   	fbe,a	_kref+0x4888
	.word	0x90a5f582	! t0_kref+0x4874:   	subcc	%l7, -0xa7e, %o0
	.word	0x91702ec6	! t0_kref+0x4878:   	popc	0xec6, %o0
	.word	0xe3b8a040	! t0_kref+0x487c:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x92358016	! t0_kref+0x4880:   	orn	%l6, %l6, %o1
	.word	0xc100a03c	! t0_kref+0x4884:   	ld	[%g2 + 0x3c], %f0
	.word	0xc398a080	! t0_kref+0x4888:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0xe3b8a040	! t0_kref+0x488c:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x903dc017	! t0_kref+0x4890:   	xnor	%l7, %l7, %o0
	.word	0xd8de5000	! t0_kref+0x4894:   	ldxa	[%i1]0x80, %o4
	.word	0x81dcf3e4	! t0_kref+0x4898:   	flush	%l3 - 0xc1c
	.word	0xec300019	! t0_kref+0x489c:   	sth	%l6, [%g0 + %i1]
	.word	0x9335c017	! t0_kref+0x48a0:   	srl	%l7, %l7, %o1
	.word	0x81858000	! t0_kref+0x48a4:   	wr	%l6, %g0, %y
	.word	0x8fa000a3	! t0_kref+0x48a8:   	fnegs	%f3, %f7
	.word	0x81a01a24	! t0_kref+0x48ac:   	fstoi	%f4, %f0
	.word	0x81a008c4	! t0_kref+0x48b0:   	fsubd	%f0, %f4, %f0
	.word	0xdede1000	! t0_kref+0x48b4:   	ldxa	[%i0]0x80, %o7
	.word	0x91a189c2	! t0_kref+0x48b8:   	fdivd	%f6, %f2, %f8
	.word	0xda6e8018	! t0_kref+0x48bc:   	ldstub	[%i2 + %i0], %o5
	.word	0x91400000	! t0_kref+0x48c0:   	mov	%y, %o0
	.word	0x81700017	! t0_kref+0x48c4:   	popc	%l7, %g0
	.word	0x90c5b16b	! t0_kref+0x48c8:   	addccc	%l6, -0xe95, %o0
	.word	0xd810a01e	! t0_kref+0x48cc:   	lduh	[%g2 + 0x1e], %o4
	.word	0x9ea5a9f7	! t0_kref+0x48d0:   	subcc	%l6, 0x9f7, %o7
	.word	0x81a1c927	! t0_kref+0x48d4:   	fmuls	%f7, %f7, %f0
	.word	0x81a84aa1	! t0_kref+0x48d8:   	fcmpes	%fcc0, %f1, %f1
	.word	0x9ea5f51f	! t0_kref+0x48dc:   	subcc	%l7, -0xae1, %o7
	.word	0x8fa01a20	! t0_kref+0x48e0:   	fstoi	%f0, %f7
	call	SYM(t0_subr0)
	.word	0x800d8016	! t0_kref+0x48e8:   	and	%l6, %l6, %g0
	.word	0x8da10846	! t0_kref+0x48ec:   	faddd	%f4, %f6, %f6
	.word	0x87a000a9	! t0_kref+0x48f0:   	fnegs	%f9, %f3
	.word	0x81a000a4	! t0_kref+0x48f4:   	fnegs	%f4, %f0
	.word	0x81a01923	! t0_kref+0x48f8:   	fstod	%f3, %f0
	.word	0xedee501b	! t0_kref+0x48fc:   	prefetcha	%i1 + %i3, 22
	.word	0x8da089c2	! t0_kref+0x4900:   	fdivd	%f2, %f2, %f6
	.word	0x9aa5efa9	! t0_kref+0x4904:   	subcc	%l7, 0xfa9, %o5
	.word	0x81a01a20	! t0_kref+0x4908:   	fstoi	%f0, %f0
	.word	0x81a01102	! t0_kref+0x490c:   	fxtod	%f2, %f0
	.word	0x94b5c016	! t0_kref+0x4910:   	orncc	%l7, %l6, %o2
	.word	0x9ed5b2d5	! t0_kref+0x4914:   	umulcc	%l6, -0xd2b, %o7
	.word	0x9f3dc017	! t0_kref+0x4918:   	sra	%l7, %l7, %o7
	.word	0x81a01921	! t0_kref+0x491c:   	fstod	%f1, %f0
	.word	0x96b5c016	! t0_kref+0x4920:   	orncc	%l7, %l6, %o3
	.word	0x001fffff	! t0_kref+0x4924:   	illtrap	0x1fffff
	.word	0x81a94aa2	! t0_kref+0x4928:   	fcmpes	%fcc0, %f5, %f2
	.word	0xd210a010	! t0_kref+0x492c:   	lduh	[%g2 + 0x10], %o1
	.word	0x9f2de00d	! t0_kref+0x4930:   	sll	%l7, 0xd, %o7
	.word	0xc91fbcc0	! t0_kref+0x4934:   	ldd	[%fp - 0x340], %f4
	.word	0x94adc017	! t0_kref+0x4938:   	andncc	%l7, %l7, %o2
	.word	0x8da00027	! t0_kref+0x493c:   	fmovs	%f7, %f6
	.word	0xd1266010	! t0_kref+0x4940:   	st	%f8, [%i1 + 0x10]
	.word	0x93a000a7	! t0_kref+0x4944:   	fnegs	%f7, %f9
	.word	0x81a98a28	! t0_kref+0x4948:   	fcmps	%fcc0, %f6, %f8
	.word	0xec2e3fe1	! t0_kref+0x494c:   	stb	%l6, [%i0 - 0x1f]
	.word	0x9405c017	! t0_kref+0x4950:   	add	%l7, %l7, %o2
	.word	0xd84e001a	! t0_kref+0x4954:   	ldsb	[%i0 + %i2], %o4
	.word	0x9ae5e1dc	! t0_kref+0x4958:   	subccc	%l7, 0x1dc, %o5
	.word	0x913da009	! t0_kref+0x495c:   	sra	%l6, 0x9, %o0
	.word	0x909dc016	! t0_kref+0x4960:   	xorcc	%l7, %l6, %o0
	.word	0xcb270019	! t0_kref+0x4964:   	st	%f5, [%i4 + %i1]
	.word	0xda00a030	! t0_kref+0x4968:   	ld	[%g2 + 0x30], %o5
	.word	0x91a209c2	! t0_kref+0x496c:   	fdivd	%f8, %f2, %f8
	.word	0xf36e6018	! t0_kref+0x4970:   	prefetch	%i1 + 0x18, 25
	.word	0xcd1fbdf0	! t0_kref+0x4974:   	ldd	[%fp - 0x210], %f6
	.word	0x85a000c6	! t0_kref+0x4978:   	fnegd	%f6, %f2
	.word	0xc168a046	! t0_kref+0x497c:   	prefetch	%g2 + 0x46, 0
	.word	0x89a209a5	! t0_kref+0x4980:   	fdivs	%f8, %f5, %f4
	.word	0xc11e6008	! t0_kref+0x4984:   	ldd	[%i1 + 8], %f0
	.word	0x99258016	! t0_kref+0x4988:   	mulscc	%l6, %l6, %o4
	.word	0x9a85f1c1	! t0_kref+0x498c:   	addcc	%l7, -0xe3f, %o5
	.word	0xe3b8a040	! t0_kref+0x4990:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xd816600c	! t0_kref+0x4994:   	lduh	[%i1 + 0xc], %o4
	.word	0xd19f1a59	! t0_kref+0x4998:   	ldda	[%i4 + %i1]0xd2, %f8
	.word	0xcd1fbea0	! t0_kref+0x499c:   	ldd	[%fp - 0x160], %f6
	.word	0xee780019	! t0_kref+0x49a0:   	swap	[%g0 + %i1], %l7
	.word	0xcf270019	! t0_kref+0x49a4:   	st	%f7, [%i4 + %i1]
	.word	0x8143c000	! t0_kref+0x49a8:   	stbar
	.word	0xee36001b	! t0_kref+0x49ac:   	sth	%l7, [%i0 + %i3]
	.word	0x9aa58017	! t0_kref+0x49b0:   	subcc	%l6, %l7, %o5
	.word	0x91a01903	! t0_kref+0x49b4:   	fitod	%f3, %f8
	.word	0xd010a00a	! t0_kref+0x49b8:   	lduh	[%g2 + 0xa], %o0
	.word	0x35800006	! t0_kref+0x49bc:   	fbue,a	_kref+0x49d4
	.word	0xee6e3fe1	! t0_kref+0x49c0:   	ldstub	[%i0 - 0x1f], %l7
	.word	0xd050a02e	! t0_kref+0x49c4:   	ldsh	[%g2 + 0x2e], %o0
	.word	0xe3b8a040	! t0_kref+0x49c8:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xc900a000	! t0_kref+0x49cc:   	ld	[%g2], %f4
	.word	0x9865c017	! t0_kref+0x49d0:   	subc	%l7, %l7, %o4
	.word	0x90458016	! t0_kref+0x49d4:   	addc	%l6, %l6, %o0
	.word	0xc1be1856	! t0_kref+0x49d8:   	stda	%f0, [%i0 + %l6]0xc2
	.word	0x9a0df362	! t0_kref+0x49dc:   	and	%l7, -0xc9e, %o5
	.word	0x8d85c016	! t0_kref+0x49e0:   	wr	%l7, %l6, %fprs
	.word	0x81a88a25	! t0_kref+0x49e4:   	fcmps	%fcc0, %f2, %f5
	.word	0xc91fbe90	! t0_kref+0x49e8:   	ldd	[%fp - 0x170], %f4
	.word	0x8da018c4	! t0_kref+0x49ec:   	fdtos	%f4, %f6
	.word	0x8da000a6	! t0_kref+0x49f0:   	fnegs	%f6, %f6
	.word	0xec36c018	! t0_kref+0x49f4:   	sth	%l6, [%i3 + %i0]
	.word	0xe1ee101c	! t0_kref+0x49f8:   	prefetcha	%i0 + %i4, 16
	.word	0x90bde78c	! t0_kref+0x49fc:   	xnorcc	%l7, 0x78c, %o0
	.word	0x8da01a28	! t0_kref+0x4a00:   	fstoi	%f8, %f6
	.word	0x8da109c6	! t0_kref+0x4a04:   	fdivd	%f4, %f6, %f6
	.word	0x94758017	! t0_kref+0x4a08:   	udiv	%l6, %l7, %o2
	.word	0xd2df5018	! t0_kref+0x4a0c:   	ldxa	[%i5 + %i0]0x80, %o1
	sethi	%hi(2f), %o7
	.word	0xe40be230	! t0_kref+0x4a14:   	ldub	[%o7 + 0x230], %l2
	.word	0xa41ca00c	! t0_kref+0x4a18:   	xor	%l2, 0xc, %l2
	.word	0xe42be230	! t0_kref+0x4a1c:   	stb	%l2, [%o7 + 0x230]
	.word	0x81dbe230	! t0_kref+0x4a20:   	flush	%o7 + 0x230
	.word	0x9695fcb8	! t0_kref+0x4a24:   	orcc	%l7, -0x348, %o3
	.word	0x9ef5aa17	! t0_kref+0x4a28:   	udivcc	%l6, 0xa17, %o7
	.word	0x81a88a48	! t0_kref+0x4a2c:   	fcmpd	%fcc0, %f2, %f8
2:	.word	0xc53e7fe8	! t0_kref+0x4a30:   	std	%f2, [%i1 - 0x18]
	.word	0xee680019	! t0_kref+0x4a34:   	ldstub	[%g0 + %i1], %l7
	.word	0x87a01a20	! t0_kref+0x4a38:   	fstoi	%f0, %f3
	.word	0x9095bb01	! t0_kref+0x4a3c:   	orcc	%l6, -0x4ff, %o0
	.word	0x8fa000a6	! t0_kref+0x4a40:   	fnegs	%f6, %f7
	.word	0x813de006	! t0_kref+0x4a44:   	sra	%l7, 0x6, %g0
	.word	0xf1ee101a	! t0_kref+0x4a48:   	prefetcha	%i0 + %i2, 24
	.word	0x9ebdc016	! t0_kref+0x4a4c:   	xnorcc	%l7, %l6, %o7
	.word	0x9a25edbe	! t0_kref+0x4a50:   	sub	%l7, 0xdbe, %o5
	.word	0x9235ae93	! t0_kref+0x4a54:   	orn	%l6, 0xe93, %o1
	.word	0x8143e040	! t0_kref+0x4a58:   	membar	0x40
	.word	0x945dba54	! t0_kref+0x4a5c:   	smul	%l6, -0x5ac, %o2
	.word	0x9fc00004	! t0_kref+0x4a60:   	call	%g0 + %g4
	.word	0xda5e6008	! t0_kref+0x4a64:   	ldx	[%i1 + 8], %o5
	.word	0xc9be5896	! t0_kref+0x4a68:   	stda	%f4, [%i1 + %l6]0xc4
	.word	0x83a01a48	! t0_kref+0x4a6c:   	fdtoi	%f8, %f1
	call	SYM(t0_subr2)
	.word	0x973d8016	! t0_kref+0x4a74:   	sra	%l6, %l6, %o3
	.word	0x81a000a2	! t0_kref+0x4a78:   	fnegs	%f2, %f0
	.word	0xd6901018	! t0_kref+0x4a7c:   	lduha	[%g0 + %i0]0x80, %o3
	.word	0xc398a040	! t0_kref+0x4a80:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0x8da01920	! t0_kref+0x4a84:   	fstod	%f0, %f6
	.word	0xc91fbc88	! t0_kref+0x4a88:   	ldd	[%fp - 0x378], %f4
	call	1f
	.empty
	.word	0xcd064000	! t0_kref+0x4a90:   	ld	[%i1], %f6
	.word	0x9ac58016	! t0_kref+0x4a94:   	addccc	%l6, %l6, %o5
1:	.word	0xe8fe101c	! t0_kref+0x4a98:   	swapa	[%i0 + %i4]0x80, %l4
	.word	0xc1be5a1b	! t0_kref+0x4a9c:   	stda	%f0, [%i1 + %i3]0xd0
	.word	0x2f800005	! t0_kref+0x4aa0:   	fbu,a	_kref+0x4ab4
	.word	0x193a7c00	! t0_kref+0x4aa4:   	sethi	%hi(0xe9f00000), %o4
	.word	0x990d8017	! t0_kref+0x4aa8:   	tsubcc	%l6, %l7, %o4
	.word	0x9255f6ae	! t0_kref+0x4aac:   	umul	%l7, -0x952, %o1
	.word	0x9fc00004	! t0_kref+0x4ab0:   	call	%g0 + %g4
	.word	0xd4164000	! t0_kref+0x4ab4:   	lduh	[%i1], %o2
	.word	0xd13e2000	! t0_kref+0x4ab8:   	std	%f8, [%i0]
	.word	0xda6e401a	! t0_kref+0x4abc:   	ldstub	[%i1 + %i2], %o5
	.word	0xd83e3fe8	! t0_kref+0x4ac0:   	std	%o4, [%i0 - 0x18]
	.word	0x8ba048a9	! t0_kref+0x4ac4:   	fsubs	%f1, %f9, %f5
	.word	0x9445f902	! t0_kref+0x4ac8:   	addc	%l7, -0x6fe, %o2
	.word	0xee260000	! t0_kref+0x4acc:   	st	%l7, [%i0]
	.word	0xc000a008	! t0_kref+0x4ad0:   	ld	[%g2 + 8], %g0
	.word	0x9b702cc5	! t0_kref+0x4ad4:   	popc	0xcc5, %o5
	.word	0xd11fbd70	! t0_kref+0x4ad8:   	ldd	[%fp - 0x290], %f8
	.word	0x8ba01080	! t0_kref+0x4adc:   	fxtos	%f0, %f5
	.word	0xeafe501c	! t0_kref+0x4ae0:   	swapa	[%i1 + %i4]0x80, %l5
	.word	0x9f3d8016	! t0_kref+0x4ae4:   	sra	%l6, %l6, %o7
	.word	0x878020f0	! t0_kref+0x4ae8:   	mov	0xf0, %asi
	.word	0x8143e040	! t0_kref+0x4aec:   	membar	0x40
	.word	0x91a188c2	! t0_kref+0x4af0:   	fsubd	%f6, %f2, %f8
	.word	0x89a208c8	! t0_kref+0x4af4:   	fsubd	%f8, %f8, %f4
	.word	0x85a189c8	! t0_kref+0x4af8:   	fdivd	%f6, %f8, %f2
	.word	0xc807bfe4	! t0_kref+0x4afc:   	ld	[%fp - 0x1c], %g4
	.word	0x97400000	! t0_kref+0x4b00:   	mov	%y, %o3
	.word	0xe07e7fe8	! t0_kref+0x4b04:   	swap	[%i1 - 0x18], %l0
	.word	0x9405b3b1	! t0_kref+0x4b08:   	add	%l6, -0xc4f, %o2
	.word	0xe27e4000	! t0_kref+0x4b0c:   	swap	[%i1], %l1
	.word	0x93a01a21	! t0_kref+0x4b10:   	fstoi	%f1, %f9
	.word	0x9a5dc016	! t0_kref+0x4b14:   	smul	%l7, %l6, %o5
	.word	0x81a01029	! t0_kref+0x4b18:   	fstox	%f9, %f0
	.word	0x0108953b	! t0_kref+0x4b1c:   	sethi	%hi(0x2254ec00), %g0
	.word	0x9ad5a22b	! t0_kref+0x4b20:   	umulcc	%l6, 0x22b, %o5
	.word	0x97400000	! t0_kref+0x4b24:   	mov	%y, %o3
	.word	0x83a089a5	! t0_kref+0x4b28:   	fdivs	%f2, %f5, %f1
	.word	0x91a009c4	! t0_kref+0x4b2c:   	fdivd	%f0, %f4, %f8
	.word	0x81a08948	! t0_kref+0x4b30:   	fmuld	%f2, %f8, %f0
	.word	0x8da01926	! t0_kref+0x4b34:   	fstod	%f6, %f6
	.word	0xd2871019	! t0_kref+0x4b38:   	lda	[%i4 + %i1]0x80, %o1
	.word	0x89a018c4	! t0_kref+0x4b3c:   	fdtos	%f4, %f4
	.word	0xc016401b	! t0_kref+0x4b40:   	lduh	[%i1 + %i3], %g0
	.word	0x8da149a9	! t0_kref+0x4b44:   	fdivs	%f5, %f9, %f6
	.word	0xeeb01018	! t0_kref+0x4b48:   	stha	%l7, [%g0 + %i0]0x80
	.word	0x985defdd	! t0_kref+0x4b4c:   	smul	%l7, 0xfdd, %o4
	.word	0x8fa000a3	! t0_kref+0x4b50:   	fnegs	%f3, %f7
	.word	0x92ddfb47	! t0_kref+0x4b54:   	smulcc	%l7, -0x4b9, %o1
	.word	0x8da088c6	! t0_kref+0x4b58:   	fsubd	%f2, %f6, %f6
	.word	0x9ac5c017	! t0_kref+0x4b5c:   	addccc	%l7, %l7, %o5
	call	SYM(t0_subr3)
	.word	0x94ade202	! t0_kref+0x4b64:   	andncc	%l7, 0x202, %o2
	.word	0x8143c000	! t0_kref+0x4b68:   	stbar
	.word	0x8da00844	! t0_kref+0x4b6c:   	faddd	%f0, %f4, %f6
	.word	0x85a01903	! t0_kref+0x4b70:   	fitod	%f3, %f2
	.word	0x81a98a21	! t0_kref+0x4b74:   	fcmps	%fcc0, %f6, %f1
	.word	0x9005ff99	! t0_kref+0x4b78:   	add	%l7, -0x67, %o0
	.word	0xd06e4000	! t0_kref+0x4b7c:   	ldstub	[%i1], %o0
	.word	0xc5a65000	! t0_kref+0x4b80:   	sta	%f2, [%i1]0x80
	.word	0x85a088c0	! t0_kref+0x4b84:   	fsubd	%f2, %f0, %f2
	.word	0x9e75ac3f	! t0_kref+0x4b88:   	udiv	%l6, 0xc3f, %o7
	.word	0x96558017	! t0_kref+0x4b8c:   	umul	%l6, %l7, %o3
	.word	0x96958017	! t0_kref+0x4b90:   	orcc	%l6, %l7, %o3
	.word	0xd24e6011	! t0_kref+0x4b94:   	ldsb	[%i1 + 0x11], %o1
	.word	0x9525c016	! t0_kref+0x4b98:   	mulscc	%l7, %l6, %o2
	.word	0xeb68a081	! t0_kref+0x4b9c:   	prefetch	%g2 + 0x81, 21
	.word	0xec3e6018	! t0_kref+0x4ba0:   	std	%l6, [%i1 + 0x18]
	.word	0x3f800006	! t0_kref+0x4ba4:   	fbo,a	_kref+0x4bbc
	.word	0xd24e8018	! t0_kref+0x4ba8:   	ldsb	[%i2 + %i0], %o1
	.word	0x96b5f9bc	! t0_kref+0x4bac:   	orncc	%l7, -0x644, %o3
	.word	0xe3b8a040	! t0_kref+0x4bb0:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xef68a006	! t0_kref+0x4bb4:   	prefetch	%g2 + 6, 23
	.word	0xe3b8a040	! t0_kref+0x4bb8:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x8185c000	! t0_kref+0x4bbc:   	wr	%l7, %g0, %y
	.word	0x92a5e810	! t0_kref+0x4bc0:   	subcc	%l7, 0x810, %o1
	.word	0x94c5bf53	! t0_kref+0x4bc4:   	addccc	%l6, -0xad, %o2
	.word	0x96a5ee4c	! t0_kref+0x4bc8:   	subcc	%l7, 0xe4c, %o3
	.word	0xe0ee101a	! t0_kref+0x4bcc:   	ldstuba	[%i0 + %i2]0x80, %l0
	.word	0xd450a002	! t0_kref+0x4bd0:   	ldsh	[%g2 + 2], %o2
	.word	0x81a94aa9	! t0_kref+0x4bd4:   	fcmpes	%fcc0, %f5, %f9
	.word	0xd53869b0	! t0_kref+0x4bd8:   	std	%f10, [%g1 + 0x9b0]
	.word	0xf9ee101c	! t0_kref+0x4bdc:   	prefetcha	%i0 + %i4, 28
	.word	0x9a45e55e	! t0_kref+0x4be0:   	addc	%l7, 0x55e, %o5
	.word	0xd0d81018	! t0_kref+0x4be4:   	ldxa	[%g0 + %i0]0x80, %o0
	.word	0x9105c016	! t0_kref+0x4be8:   	taddcc	%l7, %l6, %o0
	.word	0x98dde9fb	! t0_kref+0x4bec:   	smulcc	%l7, 0x9fb, %o4
	.word	0xc9be1a5c	! t0_kref+0x4bf0:   	stda	%f4, [%i0 + %i4]0xd2
	.word	0xc12e3fec	! t0_kref+0x4bf4:   	st	%fsr, [%i0 - 0x14]
	.word	0x8ba018c8	! t0_kref+0x4bf8:   	fdtos	%f8, %f5
	.word	0x8da008c0	! t0_kref+0x4bfc:   	fsubd	%f0, %f0, %f6
	.word	0x35800006	! t0_kref+0x4c00:   	fbue,a	_kref+0x4c18
	.word	0x81dcab70	! t0_kref+0x4c04:   	flush	%l2 + 0xb70
	.word	0x81a84a29	! t0_kref+0x4c08:   	fcmps	%fcc0, %f1, %f9
	.word	0xc300a02c	! t0_kref+0x4c0c:   	ld	[%g2 + 0x2c], %f1
	.word	0xec2e4000	! t0_kref+0x4c10:   	stb	%l6, [%i1]
	.word	0x81a8caa2	! t0_kref+0x4c14:   	fcmpes	%fcc0, %f3, %f2
	.word	0x9445b0be	! t0_kref+0x4c18:   	addc	%l6, -0xf42, %o2
	.word	0x968d8016	! t0_kref+0x4c1c:   	andcc	%l6, %l6, %o3
	.word	0x81700017	! t0_kref+0x4c20:   	popc	%l7, %g0
	.word	0xed68a007	! t0_kref+0x4c24:   	prefetch	%g2 + 7, 22
	.word	0x98e5c016	! t0_kref+0x4c28:   	subccc	%l7, %l6, %o4
	.word	0x91a009c0	! t0_kref+0x4c2c:   	fdivd	%f0, %f0, %f8
	.word	0xee7e6000	! t0_kref+0x4c30:   	swap	[%i1], %l7
	.word	0x89a04d20	! t0_kref+0x4c34:   	fsmuld	%f1, %f0, %f4
	.word	0x89a18942	! t0_kref+0x4c38:   	fmuld	%f6, %f2, %f4
	.word	0xd11fbc88	! t0_kref+0x4c3c:   	ldd	[%fp - 0x378], %f8
	.word	0x9b35e005	! t0_kref+0x4c40:   	srl	%l7, 0x5, %o5
	.word	0xc91fbcd0	! t0_kref+0x4c44:   	ldd	[%fp - 0x330], %f4
	.word	0x800dfd62	! t0_kref+0x4c48:   	and	%l7, -0x29e, %g0
	.word	0x83a000a9	! t0_kref+0x4c4c:   	fnegs	%f9, %f1
	.word	0xcd3e7ff8	! t0_kref+0x4c50:   	std	%f6, [%i1 - 8]
	.word	0x37800007	! t0_kref+0x4c54:   	fbge,a	_kref+0x4c70
	.word	0x81a209c2	! t0_kref+0x4c58:   	fdivd	%f8, %f2, %f0
	.word	0x85a000c4	! t0_kref+0x4c5c:   	fnegd	%f4, %f2
	.word	0x85a108c8	! t0_kref+0x4c60:   	fsubd	%f4, %f8, %f2
	.word	0xee363ff2	! t0_kref+0x4c64:   	sth	%l7, [%i0 - 0xe]
	.word	0xd448a010	! t0_kref+0x4c68:   	ldsb	[%g2 + 0x10], %o2
	.word	0xc93e6008	! t0_kref+0x4c6c:   	std	%f4, [%i1 + 8]
	.word	0x968df0aa	! t0_kref+0x4c70:   	andcc	%l7, -0xf56, %o3
	.word	0x90dd8017	! t0_kref+0x4c74:   	smulcc	%l6, %l7, %o0
	.word	0xc807bff0	! t0_kref+0x4c78:   	ld	[%fp - 0x10], %g4
	.word	0x9695c016	! t0_kref+0x4c7c:   	orcc	%l7, %l6, %o3
	.word	0xd0166008	! t0_kref+0x4c80:   	lduh	[%i1 + 8], %o0
	.word	0x86102016	! t0_kref+0x4c84:   	mov	0x16, %g3
	.word	0x86a0e001	! t0_kref+0x4c88:   	subcc	%g3, 1, %g3
	.word	0x22800008	! t0_kref+0x4c8c:   	be,a	_kref+0x4cac
	.word	0x81a00044	! t0_kref+0x4c90:   	fmovd	%f4, %f0
	.word	0xcd262018	! t0_kref+0x4c94:   	st	%f6, [%i0 + 0x18]
	.word	0x8185c000	! t0_kref+0x4c98:   	wr	%l7, %g0, %y
	.word	0x8da01a28	! t0_kref+0x4c9c:   	fstoi	%f8, %f6
	.word	0x8065c017	! t0_kref+0x4ca0:   	subc	%l7, %l7, %g0
	.word	0x8065bf02	! t0_kref+0x4ca4:   	subc	%l6, -0xfe, %g0
	.word	0x9245f569	! t0_kref+0x4ca8:   	addc	%l7, -0xa97, %o1
	.word	0x97358016	! t0_kref+0x4cac:   	srl	%l6, %l6, %o3
	.word	0x9ef58016	! t0_kref+0x4cb0:   	udivcc	%l6, %l6, %o7
	.word	0x81a01a20	! t0_kref+0x4cb4:   	fstoi	%f0, %f0
	.word	0xc1be1897	! t0_kref+0x4cb8:   	stda	%f0, [%i0 + %l7]0xc4
	.word	0x993de016	! t0_kref+0x4cbc:   	sra	%l7, 0x16, %o4
	.word	0x9e458017	! t0_kref+0x4cc0:   	addc	%l6, %l7, %o7
	.word	0x81aa0ac4	! t0_kref+0x4cc4:   	fcmped	%fcc0, %f8, %f4
	.word	0xe168a00e	! t0_kref+0x4cc8:   	prefetch	%g2 + 0xe, 16
	.word	0x91a189a2	! t0_kref+0x4ccc:   	fdivs	%f6, %f2, %f8
	.word	0x89a188c8	! t0_kref+0x4cd0:   	fsubd	%f6, %f8, %f4
	.word	0xc51fbec0	! t0_kref+0x4cd4:   	ldd	[%fp - 0x140], %f2
	.word	0xc91fbc68	! t0_kref+0x4cd8:   	ldd	[%fp - 0x398], %f4
	.word	0xd86e601a	! t0_kref+0x4cdc:   	ldstub	[%i1 + 0x1a], %o4
	.word	0x34480003	! t0_kref+0x4ce0:   	bg,a,pt	%icc, _kref+0x4cec
	.word	0x012e151e	! t0_kref+0x4ce4:   	sethi	%hi(0xb8547800), %g0
	.word	0xd03e3ff0	! t0_kref+0x4ce8:   	std	%o0, [%i0 - 0x10]
	.word	0xd11fbd18	! t0_kref+0x4cec:   	ldd	[%fp - 0x2e8], %f8
	.word	0xefee101b	! t0_kref+0x4cf0:   	prefetcha	%i0 + %i3, 23
	.word	0x8ba018c2	! t0_kref+0x4cf4:   	fdtos	%f2, %f5
	.word	0x92dda6cd	! t0_kref+0x4cf8:   	smulcc	%l6, 0x6cd, %o1
	.word	0xc526001c	! t0_kref+0x4cfc:   	st	%f2, [%i0 + %i4]
	.word	0xc51e7ff0	! t0_kref+0x4d00:   	ldd	[%i1 - 0x10], %f2
	.word	0xde06201c	! t0_kref+0x4d04:   	ld	[%i0 + 0x1c], %o7
	.word	0x91a008c2	! t0_kref+0x4d08:   	fsubd	%f0, %f2, %f8
	.word	0xef68a00c	! t0_kref+0x4d0c:   	prefetch	%g2 + 0xc, 23
!	.word	0x274facbc	! t0_kref+0x4d10:   	fbul,a,pt	%fcc0, SYM(t0_subr1)
	   	fbul,a,pt	%fcc0, SYM(t0_subr1)
	.word	0x9f414000	! t0_kref+0x4d14:   	mov	%pc, %o7
	.word	0xec263ff0	! t0_kref+0x4d18:   	st	%l6, [%i0 - 0x10]
	.word	0x9535e018	! t0_kref+0x4d1c:   	srl	%l7, 0x18, %o2
	.word	0x96f5c016	! t0_kref+0x4d20:   	udivcc	%l7, %l6, %o3
	.word	0x803dc016	! t0_kref+0x4d24:   	xnor	%l7, %l6, %g0
	.word	0xee264000	! t0_kref+0x4d28:   	st	%l7, [%i1]
	.word	0xc040a014	! t0_kref+0x4d2c:   	ldsw	[%g2 + 0x14], %g0
	.word	0x93a000a9	! t0_kref+0x4d30:   	fnegs	%f9, %f9
	.word	0x93a00021	! t0_kref+0x4d34:   	fmovs	%f1, %f9
	.word	0x8fa01a48	! t0_kref+0x4d38:   	fdtoi	%f8, %f7
	.word	0x81a8ca29	! t0_kref+0x4d3c:   	fcmps	%fcc0, %f3, %f9
	.word	0xee78a034	! t0_kref+0x4d40:   	swap	[%g2 + 0x34], %l7
	.word	0xde16c018	! t0_kref+0x4d44:   	lduh	[%i3 + %i0], %o7
	.word	0xd2070018	! t0_kref+0x4d48:   	ld	[%i4 + %i0], %o1
	.word	0x8610200c	! t0_kref+0x4d4c:   	mov	0xc, %g3
	.word	0x86a0e001	! t0_kref+0x4d50:   	subcc	%g3, 1, %g3
	.word	0x2280000c	! t0_kref+0x4d54:   	be,a	_kref+0x4d84
	.word	0xf9ee501c	! t0_kref+0x4d58:   	prefetcha	%i1 + %i4, 28
	.word	0xd1380018	! t0_kref+0x4d5c:   	std	%f8, [%g0 + %i0]
	.word	0x83a01a24	! t0_kref+0x4d60:   	fstoi	%f4, %f1
	.word	0x81a000a3	! t0_kref+0x4d64:   	fnegs	%f3, %f0
	.word	0xcd1e2018	! t0_kref+0x4d68:   	ldd	[%i0 + 0x18], %f6
	.word	0xc100a038	! t0_kref+0x4d6c:   	ld	[%g2 + 0x38], %f0
	.word	0xd20e3ff5	! t0_kref+0x4d70:   	ldub	[%i0 - 0xb], %o1
	.word	0xec263fe0	! t0_kref+0x4d74:   	st	%l6, [%i0 - 0x20]
	.word	0xde08a016	! t0_kref+0x4d78:   	ldub	[%g2 + 0x16], %o7
	.word	0xc1062010	! t0_kref+0x4d7c:   	ld	[%i0 + 0x10], %f0
	.word	0x9f05ab4d	! t0_kref+0x4d80:   	taddcc	%l6, 0xb4d, %o7
	.word	0x31800001	! t0_kref+0x4d84:   	fba,a	_kref+0x4d88
	.word	0x9e458017	! t0_kref+0x4d88:   	addc	%l6, %l7, %o7
	.word	0xcd3e4000	! t0_kref+0x4d8c:   	std	%f6, [%i1]
	.word	0x9695eb2a	! t0_kref+0x4d90:   	orcc	%l7, 0xb2a, %o3
	.word	0xe41e001d	! t0_kref+0x4d94:   	ldd	[%i0 + %i5], %l2
	.word	0x93a000a1	! t0_kref+0x4d98:   	fnegs	%f1, %f9
	.word	0x91a000a9	! t0_kref+0x4d9c:   	fnegs	%f9, %f8
	.word	0x9b25b17b	! t0_kref+0x4da0:   	mulscc	%l6, -0xe85, %o5
	.word	0x81a94aa5	! t0_kref+0x4da4:   	fcmpes	%fcc0, %f5, %f5
	.word	0x81a94a29	! t0_kref+0x4da8:   	fcmps	%fcc0, %f5, %f9
	.word	0xd048a02e	! t0_kref+0x4dac:   	ldsb	[%g2 + 0x2e], %o0
	.word	0xe3b8a040	! t0_kref+0x4db0:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x933da00f	! t0_kref+0x4db4:   	sra	%l6, 0xf, %o1
	.word	0x81a009a4	! t0_kref+0x4db8:   	fdivs	%f0, %f4, %f0
	.word	0x8da01021	! t0_kref+0x4dbc:   	fstox	%f1, %f6
	.word	0xec28a02b	! t0_kref+0x4dc0:   	stb	%l6, [%g2 + 0x2b]
	.word	0x9e25c016	! t0_kref+0x4dc4:   	sub	%l7, %l6, %o7
	.word	0xef6e7fe0	! t0_kref+0x4dc8:   	prefetch	%i1 - 0x20, 23
	.word	0x92f5a5c6	! t0_kref+0x4dcc:   	udivcc	%l6, 0x5c6, %o1
	.word	0xee28a031	! t0_kref+0x4dd0:   	stb	%l7, [%g2 + 0x31]
	.word	0x91a01906	! t0_kref+0x4dd4:   	fitod	%f6, %f8
	.word	0x8da08842	! t0_kref+0x4dd8:   	faddd	%f2, %f2, %f6
	.word	0xc19f5a58	! t0_kref+0x4ddc:   	ldda	[%i5 + %i0]0xd2, %f0
	.word	0xc568a04b	! t0_kref+0x4de0:   	prefetch	%g2 + 0x4b, 2
	.word	0x89a00844	! t0_kref+0x4de4:   	faddd	%f0, %f4, %f4
	.word	0x96f5a6cc	! t0_kref+0x4de8:   	udivcc	%l6, 0x6cc, %o3
	.word	0x9ac58017	! t0_kref+0x4dec:   	addccc	%l6, %l7, %o5
	.word	0x90e5e9b3	! t0_kref+0x4df0:   	subccc	%l7, 0x9b3, %o0
	.word	0xc9a71019	! t0_kref+0x4df4:   	sta	%f4, [%i4 + %i1]0x80
	.word	0x9aa5a9e3	! t0_kref+0x4df8:   	subcc	%l6, 0x9e3, %o5
	.word	0x35800007	! t0_kref+0x4dfc:   	fbue,a	_kref+0x4e18
	.word	0x8da08948	! t0_kref+0x4e00:   	fmuld	%f2, %f8, %f6
!	.word	0x214fac7f	! t0_kref+0x4e04:   	fbn,a,pt	%fcc0, SYM(t0_subr1)
	   	fbn,a,pt	%fcc0, SYM(t0_subr1)
	.word	0x9f414000	! t0_kref+0x4e08:   	mov	%pc, %o7
	.word	0xcc18001d	! t0_kref+0x4e0c:   	ldd	[%g0 + %i5], %g6
	.word	0xec3e4000	! t0_kref+0x4e10:   	std	%l6, [%i1]
	.word	0xee266010	! t0_kref+0x4e14:   	st	%l7, [%i1 + 0x10]
	.word	0x9125c016	! t0_kref+0x4e18:   	mulscc	%l7, %l6, %o0
	.word	0x80c5c017	! t0_kref+0x4e1c:   	addccc	%l7, %l7, %g0
	call	SYM(_kaos_done)
	.word	0x01000000	! t0_kref+0x4e24:   	nop
	KGLOBAL(t0_ktbl_end)
t0_ktbl_end:
t0_ktbl_page_end:

KTEXT_MODULE(t0_module_subr0, 0x00fe2000)
.seg "text"
t0_subr0_page_begin:
	.skip 8184
.global _t0_subr0; ENTRY(t0_subr0)
	.word	0xa6844012	! t0_subr0+0x0:   	addcc	%l1, %l2, %l3
	.word	0x81c3e008	! t0_subr0+0x4:   	retl
	.word	0xaa64c014	! t0_subr0+0x8:   	subc	%l3, %l4, %l5
t0_subr0_page_end:

KTEXT_MODULE(t0_module_subr1, 0x009da000)
.seg "text"
t0_subr1_page_begin:
	.skip 8192
.global _t0_subr1; ENTRY(t0_subr1)
	.word	0x9de3bfa0	! t0_subr1+0x0:   	save	%sp, -0x60, %sp
	.word	0xb29eaa5a	! t0_subr1+0x4:   	xorcc	%i2, 0xa5a, %i1
	.word	0x81c7e008	! t0_subr1+0x8:   	ret
	.word	0xa7ee6001	! t0_subr1+0xc:   	restore	%i1, 1, %l3
t0_subr1_page_end:

KTEXT_MODULE(t0_module_subr2, 0x00984000)
.seg "text"
t0_subr2_page_begin:
	.skip 8192
.global _t0_subr2; ENTRY(t0_subr2)
	.word	0x9de3bfa0	! t0_subr2+0x0:   	save	%sp, -0x60, %sp
	.word	0xb2066001	! t0_subr2+0x4:   	add	%i1, 1, %i1
	.word	0x81c7e008	! t0_subr2+0x8:   	ret
	.word	0xa3ee6001	! t0_subr2+0xc:   	restore	%i1, 1, %l1
t0_subr2_page_end:

KTEXT_MODULE(t0_module_subr3, 0x42f46000)
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
!  Total operations: 4716  
!
!  Operation frequencies
!
!  name               exp    obs
!  ldsb              0.78   0.87
!  ldub              0.17   0.11
!  ldsh              0.07   0.04
!  lduh              1.20   1.04
!  ld                0.63   0.66
!  ldd               0.27   0.32
!  swap              1.69   1.82
!  ldstub            1.17   1.23
!  stb               0.34   0.51
!  sth               1.64   1.70
!  st                0.88   1.08
!  std               1.43   1.36
!  add               0.72   0.74
!  addcc             0.16   0.17
!  addx              1.62   2.06
!  addxcc            1.32   1.55
!  taddcc            0.29   0.32
!  taddcctv          0.08   0.06
!  sub               0.90   0.93
!  subcc             1.44   1.84
!  subx              1.41   1.57
!  subxcc            0.82   1.00
!  tsubcc            0.24   0.28
!  tsubcctv          0.06   0.00
!  mulscc            0.91   0.93
!  and               0.93   0.95
!  andcc             0.82   0.89
!  andn              0.08   0.00
!  andncc            0.54   0.78
!  or                0.15   0.19
!  orcc              1.42   1.89
!  orn               1.48   1.46
!  orncc             0.50   0.53
!  xor               0.30   0.34
!  xorcc             0.65   0.74
!  xnor              0.68   0.64
!  xnorcc            0.88   0.89
!  sll               0.14   0.23
!  srl               0.93   1.04
!  sra               1.11   1.34
!  unimp             0.08   0.15
!  umul              0.72   0.66
!  smul              1.03   0.89
!  udiv              1.65   1.68
!  sdiv              0.03   0.02
!  umulcc            1.80   1.59
!  smulcc            0.68   0.74
!  udivcc            1.02   1.36
!  sdivcc            0.06   0.02
!  rdy               0.56   0.59
!  wry               0.76   0.59
!  bicc              0.06   0.02
!  sethi             0.82   0.89
!  jmpl              1.12   0.93
!  call              1.08   0.91
!  ticc              0.00   0.00
!  flush             0.99   1.23
!  save              0.03   0.00
!  restore           1.70   0.00
!  stbar             0.82   0.95
!  ldf               0.35   0.36
!  lddf              0.68   0.66
!  stf               1.56   1.55
!  stdf              0.72   0.81
!  fadds             0.14   0.17
!  fsubs             0.22   0.19
!  fmuls             0.16   0.19
!  fdivs             1.79   1.87
!  faddd             0.85   0.78
!  fsubd             1.38   1.51
!  fmuld             1.37   1.31
!  fdivd             0.87   0.89
!  faddq             0.00   0.00
!  fsubq             0.00   0.00
!  fmulq             0.00   0.00
!  fdivq             0.00   0.00
!  fsmuld            0.96   0.95
!  fdmulq            0.00   0.00
!  fitos             0.86   0.95
!  fitod             1.26   1.10
!  fitoq             0.00   0.00
!  fstoi             1.50   1.84
!  fstod             0.88   1.00
!  fstoq             0.00   0.00
!  fdtoi             0.38   0.42
!  fdtos             1.41   1.53
!  fdtoq             0.00   0.00
!  fqtoi             0.00   0.00
!  fqtos             0.00   0.00
!  fqtod             0.00   0.00
!  fmovs             1.39   1.53
!  fnegs             1.76   1.82
!  fabss             0.01   0.04
!  fsqrts            0.08   0.11
!  fsqrtd            0.00   0.00
!  fsqrtq            0.00   0.00
!  fcmps             1.72   1.55
!  fcmpd             0.29   0.30
!  fcmpq             0.00   0.00
!  fcmpes            1.31   1.15
!  fcmped            0.30   0.36
!  fcmpeq            0.00   0.00
!  fbfcc             2.37   2.33
!  ldfsr             0.00   0.00
!  stfsr             0.18   0.19
!  loop              1.06   0.93
!  offset            0.06   0.06
!  area              0.14   0.17
!  target            0.17   0.19
!  goto              0.34   0.23
!  sigsegv           0.29   0.38
!  sigbus            0.09   0.15
!  imodify           1.57   1.12
!  ldfsr_offset      0.03   0.00
!  fpattern          1.55   1.70
!  lbranch           0.26   0.23
!  shmld             2.30   2.78
!  shmst             1.77   1.97
!  shmpf             1.33   1.55
!  shmswap           0.16   0.15
!  shmblkld          0.98   0.06
!  shmblkst          1.60   0.23
!  shmblkchk         0.56   0.40
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
!  casa              0.22   0.21
!  rdasi             0.10   0.19
!  wrasi             0.32   0.25
!  bpcc              0.25   0.19
!  fbpfcc            0.06   0.02
!  fmovscc           0.08   0.15
!  fmovdcc           0.16   0.21
!  fmovqcc           0.00   0.00
!  movcc             0.03   0.00
!  flushw            0.00   0.00
!  membar            0.15   0.02
!  prefetch          1.39   1.57
!  rdpc              0.18   0.11
!  ldqf              0.00   0.00
!  stqf              0.00   0.00
!  ldfa              0.00   0.00
!  lddfa             0.23   0.15
!  ldqfa             0.00   0.00
!  ldsba             0.00   0.00
!  ldsha             0.16   0.11
!  lduba             0.08   0.04
!  lduha             0.30   0.25
!  lda               0.14   0.08
!  ldda              0.22   0.28
!  ldstuba           0.30   0.32
!  prefetcha         1.68   1.63
!  stfa              0.27   0.30
!  stdfa             0.18   0.17
!  stqfa             0.00   0.00
!  stba              0.33   0.34
!  stha              0.10   0.13
!  sta               0.08   0.13
!  stda              0.18   0.17
!  swapa             0.14   0.17
!  fmovd             0.15   0.19
!  fnegd             0.19   0.25
!  fabsd             0.12   0.15
!  fstox             0.17   0.17
!  fdtox             0.07   0.11
!  fxtos             0.09   0.04
!  fxtod             0.30   0.19
!  lds               0.02   0.00
!  ldsa              0.16   0.19
!  ldx               0.21   0.30
!  ldxa              0.34   0.40
!  nofault           0.14   0.11
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
!  partial_st8       0.27   0.25
!  partial_st16      0.27   0.25
!  partial_st32      0.25   0.28
!  short_st8         0.24   0.36
!  short_st16        0.32   0.28
!  short_ld8         0.02   0.02
!  short_ld16        0.35   0.61
!  blkld             0.00   0.00
!  blkst             0.10   0.00
!  blkld_offset      0.32   0.00
!  blkst_offset      0.10   0.00
!  blk_check         0.05   0.02
!  casxa             0.29   0.34
!  rdccr             0.05   0.04
!  rdfprs            0.34   0.25
!  wrccr             0.04   0.00
!  popc              0.31   0.38
!  wrfprs            0.27   0.30
!  stx               0.18   0.13
!  stxa              0.07   0.08
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
KDATA_MODULE(t0_module_offset_table, 0x497c4000)
.seg "data"
t0_offset_table_start:
t0_offset_table_size:	.word	0x00000008
t0_offset_table:
	.word	0x00000000
	.word	0xfffffff0
	.word	0x00000010
	.word	0x00000008
	.word	0x00000018
	.word	0xffffffe8
	.word	0xfffffff8
	.word	0xffffffe0
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

KDATA_MODULE(t0_module_data_in_regs, 0x4a864000)
.seg "data"
KGLOBAL(t0_data_in_regs)
t0_data_in_regs_start:
t0_data_in_regs:
	.word	0xbfd5aa03          ! %f0
	.word	0x3147bec0          ! %f1
	.word	0x5679b22b          ! %f2
	.word	0x9d9e77c4          ! %f3
	.word	0xc1db77ab          ! %f4
	.word	0x1b1196ff          ! %f5
	.word	0xf25b3658          ! %f6
	.word	0xbbe320a4          ! %f7
	.word	0x027c908b          ! %f8
	.word	0x345fb29b          ! %f9
	.word	0x0f90b91f          ! %f10
	.word	0xec9f9d06          ! %f11
	.word	0x6531d868          ! %f12
	.word	0x28caffaa          ! %f13
	.word	0x89bcde53          ! %f14
	.word	0x36ac04ec          ! %f15
	.word	0xbb4a314d          ! %f16
	.word	0xdfd2e742          ! %f17
	.word	0x302e48ac          ! %f18
	.word	0xaecebc4e          ! %f19
	.word	0xaf4d129f          ! %f20
	.word	0xe80398f7          ! %f21
	.word	0xe2b658fe          ! %f22
	.word	0x0ae4943e          ! %f23
	.word	0x4006fd6e          ! %f24
	.word	0x21370aa2          ! %f25
	.word	0x35d02cad          ! %f26
	.word	0xba075a4d          ! %f27
	.word	0x95f8620d          ! %f28
	.word	0x3b7fb064          ! %f29
	.word	0x79948f5f          ! %f30
	.word	0xef837a2d          ! %f31
	.word	0x9854cae3          ! %f32
	.word	0xbbb830ea          ! %f33
	.word	0xed8ed3f4          ! %f34
	.word	0x88539597          ! %f35
	.word	0x6b496083          ! %f36
	.word	0x34a399f1          ! %f37
	.word	0xe451c8b2          ! %f38
	.word	0x3ce3366e          ! %f39
	.word	0xfd1f1afb          ! %f40
	.word	0x683dd90c          ! %f41
	.word	0x8beb3ac4          ! %f42
	.word	0x8947ff24          ! %f43
	.word	0x9c3e3469          ! %f44
	.word	0x38947ca5          ! %f45
	.word	0x9f47bce5          ! %f46
	.word	0x1f32fd5d          ! %f47
	.word	0xb25db0d2          ! %f48
	.word	0x1e7c0141          ! %f49
	.word	0x077fa558          ! %f50
	.word	0x74d202d1          ! %f51
	.word	0xba830f36          ! %f52
	.word	0x36f62f07          ! %f53
	.word	0x3621771b          ! %f54
	.word	0x24f32876          ! %f55
	.word	0x352377df          ! %f56
	.word	0x92624b82          ! %f57
	.word	0x021d2a5b          ! %f58
	.word	0xc53adfdd          ! %f59
	.word	0x30f8fbf9          ! %f60
	.word	0x02d823a5          ! %f61
	.word	0x0337082a          ! %f62
	.word	0xa95f36dc          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0x134       ! %g1 (code pointer)
	.word	t0_data_in_shm_area ! %g2 (shared area pointer)
	.word	0xff7014a0          ! %g3 (loop index)
	.word	SYM(t0_subr0)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0xfe97a807          ! %o0
	.word	0x510d4bec          ! %o1
	.word	0x1504e9a6          ! %o2
	.word	0xd66b0708          ! %o3
	.word	0x3e867e7b          ! %o4
	.word	0xd41ba4de          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0x3d33ba67          ! %l0
	.word	0x2d9b320f          ! %l1
	.word	0xb3200d6e          ! %l2
	.word	0xb461316c          ! %l3
	.word	0x9bd7fdd3          ! %l4
	.word	0x9ea36591          ! %l5
	.word	0x1abd091d          ! %l6
	.word	0xf4e75dd5          ! %l7
	.word	t0_data_in_area0    ! %i0 (area pointer)
	.word	t0_data_in_area0    ! %i1 (area pointer)
	.word	0xffffffff          ! %i2 (byte offset)
	.word	0x0000001e          ! %i3 (halfword offset)
	.word	0x00000000          ! %i4 (word offset)
	.word	0x00000018          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0x7a71edb2          ! %y
	.word	0x0000000b          ! %icc (nzvc)
	.word	0x40000e1b          ! %fsr
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
.global t0_data_in_mtbl_size; t0_data_in_mtbl_size:	.word	253
t0_data_in_regs_end:

.skip 7708	! page align

KDATA_MODULE(t0_module_data_in_stack, 0x1edea000)
.seg "data"
KGLOBAL(t0_data_in_mtbl_size)
KGLOBAL(t0_data_in_mtbl)
KGLOBAL(t0_data_in_stack)
t0_data_in_stack_start:
	.word	0x89241542
	.word	0x1255c18c
	.word	0x99e287f4
	.word	0xd75ec179
	.word	0x7fbdc044
	.word	0xc5ddcfcc
	.word	0x898fed82
	.word	0xda7aa5a5
	.word	0x6c50cbbe
	.word	0x23fcdbde
	.word	0xcbf1cc17
	.word	0x3bf1ab82
	.word	0xb769b46d
	.word	0x96e84237
	.word	0x87c22986
	.word	0x5798d51f
	.word	0xfaf6a1e0
	.word	0x3b23e6bf
	.word	0x8dae5cc7
	.word	0xdc9d28e6
	.word	0xa5d5786e
	.word	0x4c1111b3
	.word	0x45cff30e
	.word	0x0e3d3321
	.word	0x12dc9669
	.word	0x5093b6cb
	.word	0xfd265219
	.word	0x85da9bc0
	.word	0xff95b093
	.word	0x5da28a9e
	.word	0x2057abc9
	.word	0x7668d459
	.word	0x966581d0
	.word	0x22f88a45
	.word	0x665516f4
	.word	0xfe0a226f
	.word	0xb452421d
	.word	0x3064d93f
	.word	0x5ae6e179
	.word	0x37fc89f6
	.word	0x0f4618c0
	.word	0x52a01994
	.word	0x0be36f94
	.word	0x030c5c16
	.word	0x35c9fdc1
	.word	0xcb5ca23c
	.word	0x55243c72
	.word	0x57da6e2f
	.word	0x9008be98
	.word	0xe3b937c0
	.word	0xbc71d008
	.word	0x62a03d1d
	.word	0x0ab11a27
	.word	0x30942b21
	.word	0x68d8be1f
	.word	0xadfc80bc
	.word	0x924927ea
	.word	0x3fb702f9
	.word	0x3d6702b3
	.word	0x9bf6f3ae
	.word	0x1ff47e6c
	.word	0x19b112e0
	.word	0xcf724f7e
	.word	0x4812535b
	.word	0xa2d1ccfc
	.word	0x80b9a511
	.word	0xf97d1ece
	.word	0x152fdc38
	.word	0x522bdca0
	.word	0x6f589a4c
	.word	0x66d99f9f
	.word	0x7c77c64c
	.word	0xe8052c4a
	.word	0x8c1ea3fd
	.word	0x2e86cee5
	.word	0xd3ae85f0
	.word	0x58449c49
	.word	0xf0a47c9d
	.word	0x8eb55228
	.word	0x5996d4d6
	.word	0xf23cdd02
	.word	0x439ac257
	.word	0x0b26e756
	.word	0xd27cc74b
	.word	0x8faf94df
	.word	0x262a57ef
	.word	0xa0747dd4
	.word	0xce0671c0
	.word	0xd1087186
	.word	0xde7f6fdf
	.word	0xca744cd5
	.word	0x862ae286
	.word	0x299b984e
	.word	0xea57a5c2
	.word	0xb5ba7aef
	.word	0x5df873d8
	.word	0x1b7629ee
	.word	0x4f0dc9f5
	.word	0xe0c42aeb
	.word	0xd9dfba1e
	.word	0xe006cd77
	.word	0x8724437b
	.word	0x8a0601dc
	.word	0x7ac89270
	.word	0x74cf7683
	.word	0x71f92c21
	.word	0xba147a72
	.word	0xf58b1558
	.word	0xa8b0daae
	.word	0xa75d8ae2
	.word	0x45ad998f
	.word	0x99be71db
	.word	0x1a734a45
	.word	0xa87b508c
	.word	0x5fd0d81b
	.word	0x696bf4ba
	.word	0xd337e03d
	.word	0x200bfaa3
	.word	0xe98b5614
	.word	0xf754bff5
	.word	0x32b83d66
	.word	0x679c0084
	.word	0x98ebaae8
	.word	0xef5cf690
	.word	0x9eea42e0
	.word	0xe4b56ecd
	.word	0xe3f1e706
	.word	0x8c976099
	.word	0xe8007fcd
	.word	0x398e54fc
	.word	0xbc859ab2
	.word	0xce98cb68
	.word	0x9c174648
	.word	0x4f7de955
	.word	0x10c4f618
	.word	0x1c6aaa28
	.word	0xd6699b94
	.word	0xa8458709
	.word	0x7c9d56a4
	.word	0x12e8ba96
	.word	0x1be87798
	.word	0x4468ea94
	.word	0x07ced590
	.word	0x66cdb208
	.word	0xf5c2078b
	.word	0x8aa35066
	.word	0x6381abbe
	.word	0x346f36b1
	.word	0x890de7eb
	.word	0x9d3d59c5
	.word	0x25ad7ec7
	.word	0x8069a923
	.word	0xf4ae89b3
	.word	0x37e1dbf1
	.word	0x9bffeb53
	.word	0x81808214
	.word	0xc2c736cc
	.word	0xb9cdfd88
	.word	0x2cf0e0aa
	.word	0x05004864
	.word	0xed2969c3
	.word	0x371b462c
	.word	0xe188a18b
	.word	0x983b635e
	.word	0x7b136cbb
	.word	0x06a88462
	.word	0xb6447e3c
	.word	0x5b8b4d3e
t0_data_in_sp:
	.word	0x75c573a5
	.word	0x1b10adbd
	.word	0x22c49be2
	.word	0x81d3e9f2
	.word	0x2811a5af
	.word	0xca6d1d3b
	.word	0xe7be5d12
	.word	0x8b1f0624
	.word	t0_data_in_area0
	.word	t0_data_in_area0
	.word	0x00000011
	.word	0xfffffffc
	.word	0xffffffe4
	.word	0x00000000
	.word	t0_data_in_fp
	.word	0x90509fde
	.word	0x14ad43d5
	.word	0x2fe1ef12
	.word	0x92238892
	.word	0x302e4d2d
	.word	0x7eb3307e
	.word	0xdf479b5a
	.word	0xd56aa0b8
	.word	0x148b457c
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
	.word   	0xf88048c4	! [%fp - 0xc]
	.word   	0xf7ab5e03	! [%fp - 0x8]
	.word   	0x0c1e36f6	! [%fp - 0x4]
.global t0_data_in_fp; t0_data_in_fp:
	.word	0x85fd418d
	.word	0x3f7a46de
	.word	0xbbfb1948
	.word	0x743d5a7a
	.word	0xadb5f129
	.word	0x38a1b02f
	.word	0xae1b3f78
	.word	0xc6ac0ade
	.word	0x9cc0bd44
	.word	0xb379d694
	.word	0x0e50dbb5
	.word	0xc7e90b9b
	.word	0xcc58085e
	.word	0xba5f1afd
	.word	0x483ce2f7
	.word	0xa188fabb
	.word	0xd3a3912b
	.word	0x2866453e
	.word	0x3b4d1157
	.word	0x13bf9ed2
	.word	0x5027db75
	.word	0x23390527
	.word	0x9006d78a
	.word	0x855ba02e
t0_data_in_stacktop:
	.word	0
t0_data_in_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_in_area0, 0x0ce0c000)
.seg "data"
t0_data_in_area0_start:
.skip 7168
t0_data_in_area0_begin:
	.word	0xb048c341	! t0_data_in_area0-0x20
	.word	0x8210f0d1	! t0_data_in_area0-0x1c
	.word	0x5ed51caa	! t0_data_in_area0-0x18
	.word	0x7e28214d	! t0_data_in_area0-0x14
	.word	0x20bf9e31	! t0_data_in_area0-0x10
	.word	0x8b33943a	! t0_data_in_area0-0xc
	.word	0x0849d83c	! t0_data_in_area0-0x8
	.word	0x1eeaea8f	! t0_data_in_area0-0x4
.global t0_data_in_area0; t0_data_in_area0:
	.word	0x61078f28	! t0_data_in_area0+0x0
	.word	0x0c676614	! t0_data_in_area0+0x4
	.word	0x3e50c86e	! t0_data_in_area0+0x8
	.word	0x9a6d1d2c	! t0_data_in_area0+0xc
	.word	0xadc8f033	! t0_data_in_area0+0x10
	.word	0x0202b5d9	! t0_data_in_area0+0x14
	.word	0x61e0c8a0	! t0_data_in_area0+0x18
	.word	0xa767a167	! t0_data_in_area0+0x1c
t0_data_in_area0_end:
.skip 960
t0_data_in_area0_stop:

KDATA_MODULE(t0_module_data_in_shm_area, 0x00dc4000)
.seg "data"
t0_data_in_shm_area_start:
t0_data_in_shm_area_begin:
.global t0_data_in_shm_area; t0_data_in_shm_area:
	.word	0x5d76f6a6	! t0_data_in_shm_area+0x0 (t0)
	.word	0x70b2e723	! t0_data_in_shm_area+0x4 (t0)
	.word	0xc58d8c25	! t0_data_in_shm_area+0x8 (t0)
	.word	0xeb0bc403	! t0_data_in_shm_area+0xc (t0)
	.word	0xb8e0f585	! t0_data_in_shm_area+0x10 (t0)
	.word	0x092b8e39	! t0_data_in_shm_area+0x14 (t0)
	.word	0x6333c14a	! t0_data_in_shm_area+0x18 (t0)
	.word	0xba73b6f6	! t0_data_in_shm_area+0x1c (t0)
	.word	0x29aae226	! t0_data_in_shm_area+0x20 (t0)
	.word	0xb7d241ec	! t0_data_in_shm_area+0x24 (t0)
	.word	0xae15e096	! t0_data_in_shm_area+0x28 (t0)
	.word	0x7dcde95c	! t0_data_in_shm_area+0x2c (t0)
	.word	0x11b6ff14	! t0_data_in_shm_area+0x30 (t0)
	.word	0x8e7536a4	! t0_data_in_shm_area+0x34 (t0)
	.word	0x73602c53	! t0_data_in_shm_area+0x38 (t0)
	.word	0xe5d16aae	! t0_data_in_shm_area+0x3c (t0)
	.word	0xaac4d135	! t0_data_in_shm_area+0x40 (t0 bload)
	.word	0x0067f6b5	! t0_data_in_shm_area+0x44
	.word	0x056ea44d	! t0_data_in_shm_area+0x48
	.word	0xe238cd33	! t0_data_in_shm_area+0x4c
	.word	0xbb27c32e	! t0_data_in_shm_area+0x50
	.word	0x4342cbf7	! t0_data_in_shm_area+0x54
	.word	0x1297f1d9	! t0_data_in_shm_area+0x58
	.word	0x71e43bb5	! t0_data_in_shm_area+0x5c
	.word	0xedba1b05	! t0_data_in_shm_area+0x60
	.word	0xb536ae94	! t0_data_in_shm_area+0x64
	.word	0xa2ec9018	! t0_data_in_shm_area+0x68
	.word	0x821ab678	! t0_data_in_shm_area+0x6c
	.word	0x46572608	! t0_data_in_shm_area+0x70
	.word	0x66b0cd23	! t0_data_in_shm_area+0x74
	.word	0x6989b47c	! t0_data_in_shm_area+0x78
	.word	0xdd6dab67	! t0_data_in_shm_area+0x7c
	.word	0xbb71beed	! t0_data_in_shm_area+0x80 (t0 bstore)
	.word	0x9d2601f6	! t0_data_in_shm_area+0x84
	.word	0x4213bb8b	! t0_data_in_shm_area+0x88
	.word	0xd3415d90	! t0_data_in_shm_area+0x8c
	.word	0x0f0a923a	! t0_data_in_shm_area+0x90
	.word	0x398fc9af	! t0_data_in_shm_area+0x94
	.word	0xc1e41de3	! t0_data_in_shm_area+0x98
	.word	0xaa2fcfd2	! t0_data_in_shm_area+0x9c
	.word	0xd79bc4e6	! t0_data_in_shm_area+0xa0
	.word	0x13a98f19	! t0_data_in_shm_area+0xa4
	.word	0xe2b3317d	! t0_data_in_shm_area+0xa8
	.word	0xf0a326d5	! t0_data_in_shm_area+0xac
	.word	0x6ac5e140	! t0_data_in_shm_area+0xb0
	.word	0x5c966034	! t0_data_in_shm_area+0xb4
	.word	0x2a463b35	! t0_data_in_shm_area+0xb8
	.word	0x635fb639	! t0_data_in_shm_area+0xbc
t0_data_in_shm_area_end:
t0_data_in_shm_area_stop:

KDATA_MODULE(t0_module_data_exp_regs, 0x18d9a000)
.seg "data"
KGLOBAL(t0_data_exp_regs)
t0_data_exp_regs_start:
t0_data_exp_regs:
	.word	0xbfd5aa03          ! %f0
	.word	0x3147bec0          ! %f1
	.word	0x5679b22b          ! %f2
	.word	0x9d9e77c4          ! %f3
	.word	0xc1db77ab          ! %f4
	.word	0x1b1196ff          ! %f5
	.word	0xf25b3658          ! %f6
	.word	0xbbe320a4          ! %f7
	.word	0x027c908b          ! %f8
	.word	0x345fb29b          ! %f9
	.word	0x0f90b91f          ! %f10
	.word	0xec9f9d06          ! %f11
	.word	0x6531d868          ! %f12
	.word	0x28caffaa          ! %f13
	.word	0x89bcde53          ! %f14
	.word	0x36ac04ec          ! %f15
	.word	0xbb4a314d          ! %f16
	.word	0xdfd2e742          ! %f17
	.word	0x302e48ac          ! %f18
	.word	0xaecebc4e          ! %f19
	.word	0xaf4d129f          ! %f20
	.word	0xe80398f7          ! %f21
	.word	0xe2b658fe          ! %f22
	.word	0x0ae4943e          ! %f23
	.word	0x4006fd6e          ! %f24
	.word	0x21370aa2          ! %f25
	.word	0x35d02cad          ! %f26
	.word	0xba075a4d          ! %f27
	.word	0x95f8620d          ! %f28
	.word	0x3b7fb064          ! %f29
	.word	0x79948f5f          ! %f30
	.word	0xef837a2d          ! %f31
	.word	0x9854cae3          ! %f32
	.word	0xbbb830ea          ! %f33
	.word	0xed8ed3f4          ! %f34
	.word	0x88539597          ! %f35
	.word	0x6b496083          ! %f36
	.word	0x34a399f1          ! %f37
	.word	0xe451c8b2          ! %f38
	.word	0x3ce3366e          ! %f39
	.word	0xfd1f1afb          ! %f40
	.word	0x683dd90c          ! %f41
	.word	0x8beb3ac4          ! %f42
	.word	0x8947ff24          ! %f43
	.word	0x9c3e3469          ! %f44
	.word	0x38947ca5          ! %f45
	.word	0x9f47bce5          ! %f46
	.word	0x1f32fd5d          ! %f47
	.word	0xb25db0d2          ! %f48
	.word	0x1e7c0141          ! %f49
	.word	0x077fa558          ! %f50
	.word	0x74d202d1          ! %f51
	.word	0xba830f36          ! %f52
	.word	0x36f62f07          ! %f53
	.word	0x3621771b          ! %f54
	.word	0x24f32876          ! %f55
	.word	0x352377df          ! %f56
	.word	0x92624b82          ! %f57
	.word	0x021d2a5b          ! %f58
	.word	0xc53adfdd          ! %f59
	.word	0x30f8fbf9          ! %f60
	.word	0x02d823a5          ! %f61
	.word	0x0337082a          ! %f62
	.word	0xa95f36dc          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0x134       ! %g1 (code pointer)
	.word	t0_data_exp_shm_area! %g2 (shared area pointer)
	.word	0xff7014a0          ! %g3 (loop index)
	.word	SYM(t0_subr0)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0xfe97a807          ! %o0
	.word	0x510d4bec          ! %o1
	.word	0x1504e9a6          ! %o2
	.word	0xd66b0708          ! %o3
	.word	0x3e867e7b          ! %o4
	.word	0xd41ba4de          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0x3d33ba67          ! %l0
	.word	0x2d9b320f          ! %l1
	.word	0xb3200d6e          ! %l2
	.word	0xb461316c          ! %l3
	.word	0x9bd7fdd3          ! %l4
	.word	0x9ea36591          ! %l5
	.word	0x1abd091d          ! %l6
	.word	0xf4e75dd5          ! %l7
	.word	t0_data_exp_area0   ! %i0 (area pointer)
	.word	t0_data_exp_area0   ! %i1 (area pointer)
	.word	0xffffffff          ! %i2 (byte offset)
	.word	0x0000001e          ! %i3 (halfword offset)
	.word	0x00000000          ! %i4 (word offset)
	.word	0x00000018          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0x7a71edb2          ! %y
	.word	0x0000000b          ! %icc (nzvc)
	.word	0x40000e1b          ! %fsr
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
t0_data_exp_mtbl_size:	.word	253
t0_data_exp_regs_end:

.skip 7708	! page align

KDATA_MODULE(t0_module_data_exp_stack, 0x007a8000)
.seg "data"
KGLOBAL(t0_data_exp_mtbl_size)
KGLOBAL(t0_data_exp_mtbl)
KGLOBAL(t0_data_exp_stack)
t0_data_exp_stack_start:
	.word	0x89241542
	.word	0x1255c18c
	.word	0x99e287f4
	.word	0xd75ec179
	.word	0x7fbdc044
	.word	0xc5ddcfcc
	.word	0x898fed82
	.word	0xda7aa5a5
	.word	0x6c50cbbe
	.word	0x23fcdbde
	.word	0xcbf1cc17
	.word	0x3bf1ab82
	.word	0xb769b46d
	.word	0x96e84237
	.word	0x87c22986
	.word	0x5798d51f
	.word	0xfaf6a1e0
	.word	0x3b23e6bf
	.word	0x8dae5cc7
	.word	0xdc9d28e6
	.word	0xa5d5786e
	.word	0x4c1111b3
	.word	0x45cff30e
	.word	0x0e3d3321
	.word	0x12dc9669
	.word	0x5093b6cb
	.word	0xfd265219
	.word	0x85da9bc0
	.word	0xff95b093
	.word	0x5da28a9e
	.word	0x2057abc9
	.word	0x7668d459
	.word	0x966581d0
	.word	0x22f88a45
	.word	0x665516f4
	.word	0xfe0a226f
	.word	0xb452421d
	.word	0x3064d93f
	.word	0x5ae6e179
	.word	0x37fc89f6
	.word	0x0f4618c0
	.word	0x52a01994
	.word	0x0be36f94
	.word	0x030c5c16
	.word	0x35c9fdc1
	.word	0xcb5ca23c
	.word	0x55243c72
	.word	0x57da6e2f
	.word	0x9008be98
	.word	0xe3b937c0
	.word	0xbc71d008
	.word	0x62a03d1d
	.word	0x0ab11a27
	.word	0x30942b21
	.word	0x68d8be1f
	.word	0xadfc80bc
	.word	0x924927ea
	.word	0x3fb702f9
	.word	0x3d6702b3
	.word	0x9bf6f3ae
	.word	0x1ff47e6c
	.word	0x19b112e0
	.word	0xcf724f7e
	.word	0x4812535b
	.word	0xa2d1ccfc
	.word	0x80b9a511
	.word	0xf97d1ece
	.word	0x152fdc38
	.word	0x522bdca0
	.word	0x6f589a4c
	.word	0x66d99f9f
	.word	0x7c77c64c
	.word	0xe8052c4a
	.word	0x8c1ea3fd
	.word	0x2e86cee5
	.word	0xd3ae85f0
	.word	0x58449c49
	.word	0xf0a47c9d
	.word	0x8eb55228
	.word	0x5996d4d6
	.word	0xf23cdd02
	.word	0x439ac257
	.word	0x0b26e756
	.word	0xd27cc74b
	.word	0x8faf94df
	.word	0x262a57ef
	.word	0xa0747dd4
	.word	0xce0671c0
	.word	0xd1087186
	.word	0xde7f6fdf
	.word	0xca744cd5
	.word	0x862ae286
	.word	0x299b984e
	.word	0xea57a5c2
	.word	0xb5ba7aef
	.word	0x5df873d8
	.word	0x1b7629ee
	.word	0x4f0dc9f5
	.word	0xe0c42aeb
	.word	0xd9dfba1e
	.word	0xe006cd77
	.word	0x8724437b
	.word	0x8a0601dc
	.word	0x7ac89270
	.word	0x74cf7683
	.word	0x71f92c21
	.word	0xba147a72
	.word	0xf58b1558
	.word	0xa8b0daae
	.word	0xa75d8ae2
	.word	0x45ad998f
	.word	0x99be71db
	.word	0x1a734a45
	.word	0xa87b508c
	.word	0x5fd0d81b
	.word	0x696bf4ba
	.word	0xd337e03d
	.word	0x200bfaa3
	.word	0xe98b5614
	.word	0xf754bff5
	.word	0x32b83d66
	.word	0x679c0084
	.word	0x98ebaae8
	.word	0xef5cf690
	.word	0x9eea42e0
	.word	0xe4b56ecd
	.word	0xe3f1e706
	.word	0x8c976099
	.word	0xe8007fcd
	.word	0x398e54fc
	.word	0xbc859ab2
	.word	0xce98cb68
	.word	0x9c174648
	.word	0x4f7de955
	.word	0x10c4f618
	.word	0x1c6aaa28
	.word	0xd6699b94
	.word	0xa8458709
	.word	0x7c9d56a4
	.word	0x12e8ba96
	.word	0x1be87798
	.word	0x4468ea94
	.word	0x07ced590
	.word	0x66cdb208
	.word	0xf5c2078b
	.word	0x8aa35066
	.word	0x6381abbe
	.word	0x346f36b1
	.word	0x890de7eb
	.word	0x9d3d59c5
	.word	0x25ad7ec7
	.word	0x8069a923
	.word	0xf4ae89b3
	.word	0x37e1dbf1
	.word	0x9bffeb53
	.word	0x81808214
	.word	0xc2c736cc
	.word	0xb9cdfd88
	.word	0x2cf0e0aa
	.word	0x05004864
	.word	0xed2969c3
	.word	0x371b462c
	.word	0xe188a18b
	.word	0x983b635e
	.word	0x7b136cbb
	.word	0x06a88462
	.word	0xb6447e3c
	.word	0x5b8b4d3e
t0_data_exp_sp:
	.word	0x75c573a5
	.word	0x1b10adbd
	.word	0x22c49be2
	.word	0x81d3e9f2
	.word	0x2811a5af
	.word	0xca6d1d3b
	.word	0xe7be5d12
	.word	0x8b1f0624
	.word	t0_data_exp_area0
	.word	t0_data_exp_area0
	.word	0x00000011
	.word	0xfffffffc
	.word	0xffffffe4
	.word	0x00000000
	.word	t0_data_exp_fp
	.word	0x90509fde
	.word	0x14ad43d5
	.word	0x2fe1ef12
	.word	0x92238892
	.word	0x302e4d2d
	.word	0x7eb3307e
	.word	0xdf479b5a
	.word	0xd56aa0b8
	.word	0x148b457c
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
	.word   	0xf88048c4	! [%fp - 0xc]
	.word   	0xf7ab5e03	! [%fp - 0x8]
	.word   	0x0c1e36f6	! [%fp - 0x4]
t0_data_exp_fp:
	.word	0x85fd418d
	.word	0x3f7a46de
	.word	0xbbfb1948
	.word	0x743d5a7a
	.word	0xadb5f129
	.word	0x38a1b02f
	.word	0xae1b3f78
	.word	0xc6ac0ade
	.word	0x9cc0bd44
	.word	0xb379d694
	.word	0x0e50dbb5
	.word	0xc7e90b9b
	.word	0xcc58085e
	.word	0xba5f1afd
	.word	0x483ce2f7
	.word	0xa188fabb
	.word	0xd3a3912b
	.word	0x2866453e
	.word	0x3b4d1157
	.word	0x13bf9ed2
	.word	0x5027db75
	.word	0x23390527
	.word	0x9006d78a
	.word	0x855ba02e
t0_data_exp_stacktop:
	.word	0
t0_data_exp_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_exp_area0, 0x74a58000)
.seg "data"
t0_data_exp_area0_start:
.skip 7168
t0_data_exp_area0_begin:
	.word	0xb048c341	! t0_data_exp_area0-0x20
	.word	0x8210f0d1	! t0_data_exp_area0-0x1c
	.word	0x5ed51caa	! t0_data_exp_area0-0x18
	.word	0x7e28214d	! t0_data_exp_area0-0x14
	.word	0x20bf9e31	! t0_data_exp_area0-0x10
	.word	0x8b33943a	! t0_data_exp_area0-0xc
	.word	0x0849d83c	! t0_data_exp_area0-0x8
	.word	0x1eeaea8f	! t0_data_exp_area0-0x4
.global t0_data_exp_area0; t0_data_exp_area0:
	.word	0x61078f28	! t0_data_exp_area0+0x0
	.word	0x0c676614	! t0_data_exp_area0+0x4
	.word	0x3e50c86e	! t0_data_exp_area0+0x8
	.word	0x9a6d1d2c	! t0_data_exp_area0+0xc
	.word	0xadc8f033	! t0_data_exp_area0+0x10
	.word	0x0202b5d9	! t0_data_exp_area0+0x14
	.word	0x61e0c8a0	! t0_data_exp_area0+0x18
	.word	0xa767a167	! t0_data_exp_area0+0x1c
t0_data_exp_area0_end:
.skip 960
t0_data_exp_area0_stop:

KDATA_MODULE(t0_module_data_exp_shm_area, 0x31bf0000)
.seg "data"
t0_data_exp_shm_area_start:
t0_data_exp_shm_area_begin:
.global t0_data_exp_shm_area; t0_data_exp_shm_area:
	.word	0x5d76f6a6	! t0_data_exp_shm_area+0x0 (t0)
	.word	0x70b2e723	! t0_data_exp_shm_area+0x4 (t0)
	.word	0xc58d8c25	! t0_data_exp_shm_area+0x8 (t0)
	.word	0xeb0bc403	! t0_data_exp_shm_area+0xc (t0)
	.word	0xb8e0f585	! t0_data_exp_shm_area+0x10 (t0)
	.word	0x092b8e39	! t0_data_exp_shm_area+0x14 (t0)
	.word	0x6333c14a	! t0_data_exp_shm_area+0x18 (t0)
	.word	0xba73b6f6	! t0_data_exp_shm_area+0x1c (t0)
	.word	0x29aae226	! t0_data_exp_shm_area+0x20 (t0)
	.word	0xb7d241ec	! t0_data_exp_shm_area+0x24 (t0)
	.word	0xae15e096	! t0_data_exp_shm_area+0x28 (t0)
	.word	0x7dcde95c	! t0_data_exp_shm_area+0x2c (t0)
	.word	0x11b6ff14	! t0_data_exp_shm_area+0x30 (t0)
	.word	0x8e7536a4	! t0_data_exp_shm_area+0x34 (t0)
	.word	0x73602c53	! t0_data_exp_shm_area+0x38 (t0)
	.word	0xe5d16aae	! t0_data_exp_shm_area+0x3c (t0)
	.word	0xaac4d135	! t0_data_exp_shm_area+0x40 (t0 bload)
	.word	0x0067f6b5	! t0_data_exp_shm_area+0x44
	.word	0x056ea44d	! t0_data_exp_shm_area+0x48
	.word	0xe238cd33	! t0_data_exp_shm_area+0x4c
	.word	0xbb27c32e	! t0_data_exp_shm_area+0x50
	.word	0x4342cbf7	! t0_data_exp_shm_area+0x54
	.word	0x1297f1d9	! t0_data_exp_shm_area+0x58
	.word	0x71e43bb5	! t0_data_exp_shm_area+0x5c
	.word	0xedba1b05	! t0_data_exp_shm_area+0x60
	.word	0xb536ae94	! t0_data_exp_shm_area+0x64
	.word	0xa2ec9018	! t0_data_exp_shm_area+0x68
	.word	0x821ab678	! t0_data_exp_shm_area+0x6c
	.word	0x46572608	! t0_data_exp_shm_area+0x70
	.word	0x66b0cd23	! t0_data_exp_shm_area+0x74
	.word	0x6989b47c	! t0_data_exp_shm_area+0x78
	.word	0xdd6dab67	! t0_data_exp_shm_area+0x7c
	.word	0xbb71beed	! t0_data_exp_shm_area+0x80 (t0 bstore)
	.word	0x9d2601f6	! t0_data_exp_shm_area+0x84
	.word	0x4213bb8b	! t0_data_exp_shm_area+0x88
	.word	0xd3415d90	! t0_data_exp_shm_area+0x8c
	.word	0x0f0a923a	! t0_data_exp_shm_area+0x90
	.word	0x398fc9af	! t0_data_exp_shm_area+0x94
	.word	0xc1e41de3	! t0_data_exp_shm_area+0x98
	.word	0xaa2fcfd2	! t0_data_exp_shm_area+0x9c
	.word	0xd79bc4e6	! t0_data_exp_shm_area+0xa0
	.word	0x13a98f19	! t0_data_exp_shm_area+0xa4
	.word	0xe2b3317d	! t0_data_exp_shm_area+0xa8
	.word	0xf0a326d5	! t0_data_exp_shm_area+0xac
	.word	0x6ac5e140	! t0_data_exp_shm_area+0xb0
	.word	0x5c966034	! t0_data_exp_shm_area+0xb4
	.word	0x2a463b35	! t0_data_exp_shm_area+0xb8
	.word	0x635fb639	! t0_data_exp_shm_area+0xbc
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
#define T0_KAOS_SEED          d2a03a6e7a00
#define T0_KAOS_ICOUNT        5000
#define T0_KAOS_AREAS         1
#define T0_KAOS_AREASIZE      64
#define T0_KAOS_AREAOFFSET    7168
#define T0_KAOS_PAGESIZE      8192
#define T0_KAOS_CODECOUNT     5002

#define T0_KAOS_BOOT_VA                  0x6ddee000
#define T0_KAOS_BOOT_PA                  0x0000000000bae000
#define T0_KAOS_BOOT_CACHEABLE           1
#define T0_KAOS_BOOT_NONCACHEABLE        0

#define T0_KAOS_STARTUP_VA               0x35eb6000
#define T0_KAOS_STARTUP_PA               0x0000000003270000
#define T0_KAOS_STARTUP_CACHEABLE        1
#define T0_KAOS_STARTUP_NONCACHEABLE     0

#define T0_KAOS_OFFSET_TBL_VA            0x497c4000
#define T0_KAOS_OFFSET_TBL_PA            0x0000000004696000
#define T0_KAOS_OFFSET_TBL_CACHEABLE     1
#define T0_KAOS_OFFSET_TBL_NONCACHEABLE  0

#define T0_KAOS_DONE_VA                  0x12506000
#define T0_KAOS_DONE_PA                  0x0000000007278000
#define T0_KAOS_DONE_CACHEABLE           1
#define T0_KAOS_DONE_NONCACHEABLE        0

#define T0_KAOS_KTBL_VA                  0x009ec000
#define T0_KAOS_KTBL_PA                  0x0000000009eaa000
#define T0_KAOS_KTBL_CACHEABLE           1
#define T0_KAOS_KTBL_NONCACHEABLE        0

#define T0_KAOS_SUBR0_VA                 0x00fe2000
#define T0_KAOS_SUBR0_PA                 0x000000000ac10000
#define T0_KAOS_SUBR0_CACHEABLE          1
#define T0_KAOS_SUBR0_NONCACHEABLE       0
#define T0_KAOS_SUBR1_VA                 0x009da000
#define T0_KAOS_SUBR1_PA                 0x000000000d5f4000
#define T0_KAOS_SUBR1_CACHEABLE          1
#define T0_KAOS_SUBR1_NONCACHEABLE       0
#define T0_KAOS_SUBR2_VA                 0x00984000
#define T0_KAOS_SUBR2_PA                 0x000000000e134000
#define T0_KAOS_SUBR2_CACHEABLE          1
#define T0_KAOS_SUBR2_NONCACHEABLE       0
#define T0_KAOS_SUBR3_VA                 0x42f46000
#define T0_KAOS_SUBR3_PA                 0x000000001142e000
#define T0_KAOS_SUBR3_CACHEABLE          1
#define T0_KAOS_SUBR3_NONCACHEABLE       0

#define T0_KAOS_EXP_REGS_VA              0x18d9a000
#define T0_KAOS_EXP_REGS_PA              0x00000000120bc000
#define T0_KAOS_EXP_REGS_CACHEABLE       1
#define T0_KAOS_EXP_REGS_NONCACHEABLE    0
#define T0_KAOS_RUN_REGS_VA              0x4a864000
#define T0_KAOS_RUN_REGS_PA              0x0000000014216000
#define T0_KAOS_RUN_REGS_CACHEABLE       1
#define T0_KAOS_RUN_REGS_NONCACHEABLE    0

#define T0_KAOS_EXP_STACK_VA             0x007a8000
#define T0_KAOS_EXP_STACK_PA             0x0000000016e4c000
#define T0_KAOS_EXP_STACK_CACHEABLE      1
#define T0_KAOS_EXP_STACK_NONCACHEABLE   0
#define T0_KAOS_RUN_STACK_VA             0x1edea000
#define T0_KAOS_RUN_STACK_PA             0x0000000019180000
#define T0_KAOS_RUN_STACK_CACHEABLE      1
#define T0_KAOS_RUN_STACK_NONCACHEABLE   0

#define T0_KAOS_AREA0
#define T0_KAOS_EXP_AREA0_VA             0x74a58000
#define T0_KAOS_EXP_AREA0_PA             0x000000001a156000
#define T0_KAOS_EXP_AREA0_CACHEABLE      1
#define T0_KAOS_EXP_AREA0_NONCACHEABLE   0
#define T0_KAOS_RUN_AREA0_VA             0x0ce0c000
#define T0_KAOS_RUN_AREA0_PA             0x000000001d000000
#define T0_KAOS_RUN_AREA0_CACHEABLE      1
#define T0_KAOS_RUN_AREA0_NONCACHEABLE   0

#define T0_KAOS_SHM_AREA
#define T0_KAOS_EXP_SHM_AREA_VA          0x31bf0000
#define T0_KAOS_EXP_SHM_AREA_PA          0x0000000000748000
#define T0_KAOS_EXP_SHM_AREA_CACHEABLE   1
#define T0_KAOS_EXP_SHM_AREA_NONCACHEABLE 0
#define T0_KAOS_RUN_SHM_AREA_VA          0x00dc4000
#define T0_KAOS_RUN_SHM_AREA_PA          0x00000000013c2000
#define T0_KAOS_RUN_SHM_AREA_CACHEABLE   1
#define T0_KAOS_RUN_SHM_AREA_NONCACHEABLE 0

#define T0_KAOS_RANVAL_00     0x51e42e10
#define T0_KAOS_RANVAL_01     0x15846091
#define T0_KAOS_RANVAL_02     0x442e9489
#define T0_KAOS_RANVAL_03     0xe8852d11
#define T0_KAOS_RANVAL_04     0xca6cd3fb
#define T0_KAOS_RANVAL_05     0x4a648ce0
#define T0_KAOS_RANVAL_06     0xc02ee9a1
#define T0_KAOS_RANVAL_07     0x3a119592
#define T0_KAOS_RANVAL_08     0xe363752b
#define T0_KAOS_RANVAL_09     0x9322a3c7
#define T0_KAOS_RANVAL_0a     0xcda7d38e
#define T0_KAOS_RANVAL_0b     0x74681c07
#define T0_KAOS_RANVAL_0c     0x446b1b2e
#define T0_KAOS_RANVAL_0d     0xf83247f4
#define T0_KAOS_RANVAL_0e     0x1abd52d6
#define T0_KAOS_RANVAL_0f     0x2f08d108
#define T0_KAOS_RANVAL_10     0xec6e9f1f
#define T0_KAOS_RANVAL_11     0xa703af75
#define T0_KAOS_RANVAL_12     0xf8faee30
#define T0_KAOS_RANVAL_13     0xdec5daea
#define T0_KAOS_RANVAL_14     0xfba4f003
#define T0_KAOS_RANVAL_15     0x69437446
#define T0_KAOS_RANVAL_16     0x1954798b
#define T0_KAOS_RANVAL_17     0x8495ca79
#define T0_KAOS_RANVAL_18     0x4928db74
#define T0_KAOS_RANVAL_19     0xe3ee5a2b
#define T0_KAOS_RANVAL_1a     0x62bdc954
#define T0_KAOS_RANVAL_1b     0x91ea06e4
#define T0_KAOS_RANVAL_1c     0x5db23c83
#define T0_KAOS_RANVAL_1d     0xaa7b1dc0
#define T0_KAOS_RANVAL_1e     0xe973d5f8
#define T0_KAOS_RANVAL_1f     0x1e6b84f8
#define T0_KAOS_RANVAL_20     0xdd78b4da
#define T0_KAOS_RANVAL_21     0xebe9a0cd
#define T0_KAOS_RANVAL_22     0xf5b613a8
#define T0_KAOS_RANVAL_23     0x2a6f3d91
#define T0_KAOS_RANVAL_24     0x41265421
#define T0_KAOS_RANVAL_25     0x3ca807df
#define T0_KAOS_RANVAL_26     0x6f57025b
#define T0_KAOS_RANVAL_27     0x8897174c
#define T0_KAOS_RANVAL_28     0x6b42d1a3
#define T0_KAOS_RANVAL_29     0xe6339d13
#define T0_KAOS_RANVAL_2a     0x44773a19
#define T0_KAOS_RANVAL_2b     0xef2b3781
#define T0_KAOS_RANVAL_2c     0x82e63c30
#define T0_KAOS_RANVAL_2d     0x6d648c34
#define T0_KAOS_RANVAL_2e     0x5d2e7775
#define T0_KAOS_RANVAL_2f     0x9a02ee70
#define T0_KAOS_RANVAL_30     0x000c4444
#define T0_KAOS_RANVAL_31     0x37b0cc08
#define T0_KAOS_RANVAL_32     0x081a6c5a
#define T0_KAOS_RANVAL_33     0x3f93b2b9
#define T0_KAOS_RANVAL_34     0xdfcf8468
#define T0_KAOS_RANVAL_35     0x7fa3c8e7
#define T0_KAOS_RANVAL_36     0x2d03590a
#define T0_KAOS_RANVAL_37     0x0a2fe011
#define T0_KAOS_RANVAL_38     0x09666bd8
#define T0_KAOS_RANVAL_39     0x168da48c
#define T0_KAOS_RANVAL_3a     0xe742b164
#define T0_KAOS_RANVAL_3b     0xe0e62d32
#define T0_KAOS_RANVAL_3c     0x6e31af65
#define T0_KAOS_RANVAL_3d     0xce461f2f
#define T0_KAOS_RANVAL_3e     0xe1985265
#define T0_KAOS_RANVAL_3f     0xdd0e0d13
#define T0_KAOS_RANVAL_40     0xe9c6649c
#define T0_KAOS_RANVAL_41     0x2f0c7dd2
#define T0_KAOS_RANVAL_42     0x1cdf0bf0
#define T0_KAOS_RANVAL_43     0x119c6f59
#define T0_KAOS_RANVAL_44     0x48dc2b28
#define T0_KAOS_RANVAL_45     0x444f01db
#define T0_KAOS_RANVAL_46     0xead982d1
#define T0_KAOS_RANVAL_47     0x3b1f940d
#define T0_KAOS_RANVAL_48     0xb9aa0874
#define T0_KAOS_RANVAL_49     0x94b9c5e2
#define T0_KAOS_RANVAL_4a     0x525caeff
#define T0_KAOS_RANVAL_4b     0xf1f7e68e
#define T0_KAOS_RANVAL_4c     0xb3c2d994
#define T0_KAOS_RANVAL_4d     0x9f9613cc
#define T0_KAOS_RANVAL_4e     0xcaad7a21
#define T0_KAOS_RANVAL_4f     0x274f13c8
#define T0_KAOS_RANVAL_50     0xbb2c7f65
#define T0_KAOS_RANVAL_51     0xa8808818
#define T0_KAOS_RANVAL_52     0x053b4253
#define T0_KAOS_RANVAL_53     0x1fadcfa5
#define T0_KAOS_RANVAL_54     0x407b28f2
#define T0_KAOS_RANVAL_55     0xf40d9678
#define T0_KAOS_RANVAL_56     0x1f394529
#define T0_KAOS_RANVAL_57     0x8723fdc3
#define T0_KAOS_RANVAL_58     0xe86c6019
#define T0_KAOS_RANVAL_59     0x715943a3
#define T0_KAOS_RANVAL_5a     0x1c3536f3
#define T0_KAOS_RANVAL_5b     0x59fe3168
#define T0_KAOS_RANVAL_5c     0x3f13bc6e
#define T0_KAOS_RANVAL_5d     0xcef82869
#define T0_KAOS_RANVAL_5e     0x87e98a42
#define T0_KAOS_RANVAL_5f     0x1d3eb8b2
#define T0_KAOS_RANVAL_60     0xef65605e
#define T0_KAOS_RANVAL_61     0x228d1207
#define T0_KAOS_RANVAL_62     0xe46e2bab
#define T0_KAOS_RANVAL_63     0xa2bfa712
#define T0_KAOS_RANVAL_64     0x1608a497
#define T0_KAOS_RANVAL_65     0x2aa7d3bc
#define T0_KAOS_RANVAL_66     0x72d2b5ca
#define T0_KAOS_RANVAL_67     0x694692fb
#define T0_KAOS_RANVAL_68     0xe01f95a7
#define T0_KAOS_RANVAL_69     0x2fc71d9c
#define T0_KAOS_RANVAL_6a     0x8b596189
#define T0_KAOS_RANVAL_6b     0x9829fad5
#define T0_KAOS_RANVAL_6c     0xf25627e3
#define T0_KAOS_RANVAL_6d     0x1ca06ca3
#define T0_KAOS_RANVAL_6e     0x403a36a2
#define T0_KAOS_RANVAL_6f     0xdbb38537
#define T0_KAOS_RANVAL_70     0xcc564589
#define T0_KAOS_RANVAL_71     0x5c6e680c
#define T0_KAOS_RANVAL_72     0x4e4a4061
#define T0_KAOS_RANVAL_73     0xb2699056
#define T0_KAOS_RANVAL_74     0x9eec1b28
#define T0_KAOS_RANVAL_75     0xc9373fe3
#define T0_KAOS_RANVAL_76     0x525acaae
#define T0_KAOS_RANVAL_77     0x6f1dc4b7
#define T0_KAOS_RANVAL_78     0x99f8463f
#define T0_KAOS_RANVAL_79     0xa901e0d9
#define T0_KAOS_RANVAL_7a     0x04e0eb4a
#define T0_KAOS_RANVAL_7b     0xa7459f2c
#define T0_KAOS_RANVAL_7c     0x3903ca24
#define T0_KAOS_RANVAL_7d     0xb10a1157
#define T0_KAOS_RANVAL_7e     0x8fb5db59
#define T0_KAOS_RANVAL_7f     0x83fd25fd
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
!    icount         5000
!    targetid       NIAGARA:SIM
!    hostid         NIAGARA:5.8
!    areas          1
!    areasize       64
!    areaoffset     7168
!    ncache         0
!    emulate_ncache 1
!    pagesize       8192
!    invsize        0
!    codecount      5002
!    code           009ec000
!    entry          009ec000
!    fsr_exceptions 00000000
!    fsr_roundmode  00000004
!    fsr_mask       c0000fff
!    seed           d2a03a6e7a00
!    va_map         0000000000400000,000000007fffffff
!    pa_cached      0000000000400000,000000007fffffff
!    pa_noncached   000001ff00000000,000001ff7fffffff
!    weights        /import/n2-aus-localdir1/ntran/n2cdmspp/verif/diag/assembly/kaos/weights_files/allv9.w
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

KTEXT_MODULE(t0_module_ktbl, 0x009ec000)
.seg "text"
	KGLOBAL(t0_ktbl)
t0_ktbl_page_begin:
.global t0_kref; t0_kref:
	.skip 0
t0_ktbl:
	.word	0x85a018c8	! t0_kref+0x0:   	fdtos	%f8, %f2
	.word	0x96bdc017	! t0_kref+0x4:   	xnorcc	%l7, %l7, %o3
	.word	0xec30a01c	! t0_kref+0x8:   	sth	%l6, [%g2 + 0x1c]
	.word	0xc100a01c	! t0_kref+0xc:   	ld	[%g2 + 0x1c], %f0
	.word	0x8fa000a9	! t0_kref+0x10:   	fnegs	%f9, %f7
	.word	0xc7266004	! t0_kref+0x14:   	st	%f3, [%i1 + 4]
	.word	0x9135c016	! t0_kref+0x18:   	srl	%l7, %l6, %o0
	.word	0x808dbd5f	! t0_kref+0x1c:   	btst	0xfffffd5f, %l6
	.word	0xec36c018	! t0_kref+0x20:   	sth	%l6, [%i3 + %i0]
	.word	0x2d800005	! t0_kref+0x24:   	fbg,a	_kref+0x38
	.word	0x001fffff	! t0_kref+0x28:   	illtrap	0x1fffff
	call	SYM(t0_subr0)
	.word	0x83a1c9a9	! t0_kref+0x30:   	fdivs	%f7, %f9, %f1
	.word	0xee2e8019	! t0_kref+0x34:   	stb	%l7, [%i2 + %i1]
	.word	0x1f2f578f	! t0_kref+0x38:   	sethi	%hi(0xbd5e3c00), %o7
	.word	0x81858000	! t0_kref+0x3c:   	wr	%l6, %g0, %y
	.word	0x940dc016	! t0_kref+0x40:   	and	%l7, %l6, %o2
	.word	0x81a94a21	! t0_kref+0x44:   	fcmps	%fcc0, %f5, %f1
	.word	0x9735a00e	! t0_kref+0x48:   	srl	%l6, 0xe, %o3
	.word	0xee30a036	! t0_kref+0x4c:   	sth	%l7, [%g2 + 0x36]
	.word	0x9a25c017	! t0_kref+0x50:   	sub	%l7, %l7, %o5
	.word	0xe8fe101c	! t0_kref+0x54:   	swapa	[%i0 + %i4]0x80, %l4
	.word	0x92bdc016	! t0_kref+0x58:   	xnorcc	%l7, %l6, %o1
	.word	0x93a01a21	! t0_kref+0x5c:   	fstoi	%f1, %f9
	.word	0xc300a010	! t0_kref+0x60:   	ld	[%g2 + 0x10], %f1
	.word	0x9895c016	! t0_kref+0x64:   	orcc	%l7, %l6, %o4
	.word	0x83a00024	! t0_kref+0x68:   	fmovs	%f4, %f1
	.word	0x86102015	! t0_kref+0x6c:   	mov	0x15, %g3
	.word	0x86a0e001	! t0_kref+0x70:   	subcc	%g3, 1, %g3
	.word	0x22800018	! t0_kref+0x74:   	be,a	_kref+0xd4
	.word	0xc0961000	! t0_kref+0x78:   	lduha	[%i0]0x80, %g0
	.word	0xee300019	! t0_kref+0x7c:   	sth	%l7, [%g0 + %i1]
	.word	0xee300019	! t0_kref+0x80:   	sth	%l7, [%g0 + %i1]
	.word	0x9035b8a9	! t0_kref+0x84:   	orn	%l6, -0x757, %o0
	.word	0xe168a001	! t0_kref+0x88:   	prefetch	%g2 + 1, 16
	.word	0x81a00848	! t0_kref+0x8c:   	faddd	%f0, %f8, %f0
	.word	0x244ffff8	! t0_kref+0x90:   	ble,a,pt	%icc, _kref+0x70
	.word	0x89a000c0	! t0_kref+0x94:   	fnegd	%f0, %f4
	.word	0xd45e001d	! t0_kref+0x98:   	ldx	[%i0 + %i5], %o2
	.word	0x80e5aa9e	! t0_kref+0x9c:   	subccc	%l6, 0xa9e, %g0
	.word	0x81a80a48	! t0_kref+0xa0:   	fcmpd	%fcc0, %f0, %f8
	.word	0xee360000	! t0_kref+0xa4:   	sth	%l7, [%i0]
	.word	0xef68a083	! t0_kref+0xa8:   	prefetch	%g2 + 0x83, 23
	.word	0x8fa000a2	! t0_kref+0xac:   	fnegs	%f2, %f7
	.word	0x9065bed2	! t0_kref+0xb0:   	subc	%l6, -0x12e, %o0
	.word	0x91a00940	! t0_kref+0xb4:   	fmuld	%f0, %f0, %f8
	.word	0xda7f0019	! t0_kref+0xb8:   	swap	[%i4 + %i1], %o5
	.word	0x9a758016	! t0_kref+0xbc:   	udiv	%l6, %l6, %o5
	.word	0x940dc016	! t0_kref+0xc0:   	and	%l7, %l6, %o2
	.word	0xec2e7fe2	! t0_kref+0xc4:   	stb	%l6, [%i1 - 0x1e]
	.word	0xee28a001	! t0_kref+0xc8:   	stb	%l7, [%g2 + 1]
	.word	0x9045ac00	! t0_kref+0xcc:   	addc	%l6, 0xc00, %o0
	.word	0xedee101a	! t0_kref+0xd0:   	prefetcha	%i0 + %i2, 22
	.word	0x91a00046	! t0_kref+0xd4:   	fmovd	%f6, %f8
	.word	0x96d5c017	! t0_kref+0xd8:   	umulcc	%l7, %l7, %o3
	.word	0x83a00125	! t0_kref+0xdc:   	fabss	%f5, %f1
	.word	0x920db414	! t0_kref+0xe0:   	and	%l6, -0xbec, %o1
	.word	0xeb6e001c	! t0_kref+0xe4:   	prefetch	%i0 + %i4, 21
	.word	0x81a98ac6	! t0_kref+0xe8:   	fcmped	%fcc0, %f6, %f6
	.word	0xec3f4019	! t0_kref+0xec:   	std	%l6, [%i5 + %i1]
	.word	0x8da01903	! t0_kref+0xf0:   	fitod	%f3, %f6
	.word	0x92c5f714	! t0_kref+0xf4:   	addccc	%l7, -0x8ec, %o1
	.word	0x81a00024	! t0_kref+0xf8:   	fmovs	%f4, %f0
	.word	0x945db1a7	! t0_kref+0xfc:   	smul	%l6, -0xe59, %o2
	.word	0x91a000a1	! t0_kref+0x100:   	fnegs	%f1, %f8
	.word	0x9a75c017	! t0_kref+0x104:   	udiv	%l7, %l7, %o5
	.word	0x85a10844	! t0_kref+0x108:   	faddd	%f4, %f4, %f2
	.word	0x81a01929	! t0_kref+0x10c:   	fstod	%f9, %f0
	.word	0x9ef5c016	! t0_kref+0x110:   	udivcc	%l7, %l6, %o7
	.word	0x9465c016	! t0_kref+0x114:   	subc	%l7, %l6, %o2
	.word	0x8143c000	! t0_kref+0x118:   	stbar
	.word	0x9e35ad5d	! t0_kref+0x11c:   	orn	%l6, 0xd5d, %o7
	.word	0x81a80aa1	! t0_kref+0x120:   	fcmpes	%fcc0, %f0, %f1
	.word	0x9fc10000	! t0_kref+0x124:   	call	%g4
	.word	0xc1bf5018	! t0_kref+0x128:   	stda	%f0, [%i5 + %i0]0x80
	.word	0xd84e3fee	! t0_kref+0x12c:   	ldsb	[%i0 - 0x12], %o4
	.word	0x87a01886	! t0_kref+0x130:   	fitos	%f6, %f3
	.word	0xd2780018	! t0_kref+0x134:   	swap	[%g0 + %i0], %o1
	.word	0xee363ffc	! t0_kref+0x138:   	sth	%l7, [%i0 - 4]
	.word	0x921d8016	! t0_kref+0x13c:   	xor	%l6, %l6, %o1
	.word	0xec28a03f	! t0_kref+0x140:   	stb	%l6, [%g2 + 0x3f]
	.word	0x81a01042	! t0_kref+0x144:   	fdtox	%f2, %f0
	.word	0x81a9ca21	! t0_kref+0x148:   	fcmps	%fcc0, %f7, %f1
	.word	0x81a90aa4	! t0_kref+0x14c:   	fcmpes	%fcc0, %f4, %f4
	.word	0xc91fbd38	! t0_kref+0x150:   	ldd	[%fp - 0x2c8], %f4
	.word	0xc568a040	! t0_kref+0x154:   	prefetch	%g2 + 0x40, 2
	.word	0xee36001b	! t0_kref+0x158:   	sth	%l7, [%i0 + %i3]
	.word	0xd0d01018	! t0_kref+0x15c:   	ldsha	[%g0 + %i0]0x80, %o0
	.word	0x8da01a22	! t0_kref+0x160:   	fstoi	%f2, %f6
	.word	0xec200019	! t0_kref+0x164:   	st	%l6, [%g0 + %i1]
	.word	0xc19f5a58	! t0_kref+0x168:   	ldda	[%i5 + %i0]0xd2, %f0
	.word	0x945dc016	! t0_kref+0x16c:   	smul	%l7, %l6, %o2
	.word	0xd3f65016	! t0_kref+0x170:   	casxa	[%i1]0x80, %l6, %o1
	.word	0x9e95fc2b	! t0_kref+0x174:   	orcc	%l7, -0x3d5, %o7
	.word	0x96dda700	! t0_kref+0x178:   	smulcc	%l6, 0x700, %o3
	.word	0x85a01a26	! t0_kref+0x17c:   	fstoi	%f6, %f2
	.word	0xc9be1897	! t0_kref+0x180:   	stda	%f4, [%i0 + %l7]0xc4
	.word	0x8da01886	! t0_kref+0x184:   	fitos	%f6, %f6
	.word	0xc9067fec	! t0_kref+0x188:   	ld	[%i1 - 0x14], %f4
	.word	0xc1be1816	! t0_kref+0x18c:   	stda	%f0, [%i0 + %l6]0xc0
	.word	0xd320a038	! t0_kref+0x190:   	st	%f9, [%g2 + 0x38]
	.word	0x9495b839	! t0_kref+0x194:   	orcc	%l6, -0x7c7, %o2
	.word	0xec30a034	! t0_kref+0x198:   	sth	%l6, [%g2 + 0x34]
	.word	0x98f5f2e6	! t0_kref+0x19c:   	udivcc	%l7, -0xd1a, %o4
	.word	0x8065e070	! t0_kref+0x1a0:   	subc	%l7, 0x70, %g0
	.word	0xec266014	! t0_kref+0x1a4:   	st	%l6, [%i1 + 0x14]
	.word	0x2d800002	! t0_kref+0x1a8:   	fbg,a	_kref+0x1b0
	.word	0x8143c000	! t0_kref+0x1ac:   	stbar
	.word	0x940dc016	! t0_kref+0x1b0:   	and	%l7, %l6, %o2
	.word	0xe968a007	! t0_kref+0x1b4:   	prefetch	%g2 + 7, 20
	.word	0x952dc017	! t0_kref+0x1b8:   	sll	%l7, %l7, %o2
	.word	0x9f3de018	! t0_kref+0x1bc:   	sra	%l7, 0x18, %o7
	.word	0xc51fbe70	! t0_kref+0x1c0:   	ldd	[%fp - 0x190], %f2
	.word	0x9f25e221	! t0_kref+0x1c4:   	mulscc	%l7, 0x221, %o7
	.word	0x9445fc4c	! t0_kref+0x1c8:   	addc	%l7, -0x3b4, %o2
	.word	0x90c5a174	! t0_kref+0x1cc:   	addccc	%l6, 0x174, %o0
	.word	0x93a009a5	! t0_kref+0x1d0:   	fdivs	%f0, %f5, %f9
	.word	0x949d8017	! t0_kref+0x1d4:   	xorcc	%l6, %l7, %o2
	.word	0xcf20a028	! t0_kref+0x1d8:   	st	%f7, [%g2 + 0x28]
	.word	0x993d8017	! t0_kref+0x1dc:   	sra	%l6, %l7, %o4
	.word	0xc168a002	! t0_kref+0x1e0:   	prefetch	%g2 + 2, 0
	.word	0x91a0c823	! t0_kref+0x1e4:   	fadds	%f3, %f3, %f8
	.word	0x81dd000a	! t0_kref+0x1e8:   	flush	%l4 + %o2
	.word	0x81de8010	! t0_kref+0x1ec:   	flush	%i2 + %l0
	.word	0xec267fe4	! t0_kref+0x1f0:   	st	%l6, [%i1 - 0x1c]
	.word	0xe40860f8	! t0_kref+0x1f4:   	ldub	[%g1 + 0xf8], %l2
	.word	0xa41ca00c	! t0_kref+0x1f8:   	xor	%l2, 0xc, %l2
	.word	0xe42860f8	! t0_kref+0x1fc:   	stb	%l2, [%g1 + 0xf8]
	.word	0x81d860f8	! t0_kref+0x200:   	flush	%g1 + 0xf8
	.word	0xc11fbf60	! t0_kref+0x204:   	ldd	[%fp - 0xa0], %f0
	.word	0xd87e7ff4	! t0_kref+0x208:   	swap	[%i1 - 0xc], %o4
	.word	0x968d8017	! t0_kref+0x20c:   	andcc	%l6, %l7, %o3
	.word	0x8ba01a23	! t0_kref+0x210:   	fstoi	%f3, %f5
	.word	0x9505c016	! t0_kref+0x214:   	taddcc	%l7, %l6, %o2
	.word	0xf3ee501c	! t0_kref+0x218:   	prefetcha	%i1 + %i4, 25
	.word	0x9ee5eac1	! t0_kref+0x21c:   	subccc	%l7, 0xac1, %o7
!	.word	0x2e4e6778	! t0_kref+0x220:   	bvs,a,pt	%icc, SYM(t0_subr2)
	   	bvs,a,pt	%icc, SYM(t0_subr2)
	.word	0x9e0060ec	! t0_kref+0x224:   	add	%g1, 0xec, %o7
	.word	0xd2965000	! t0_kref+0x228:   	lduha	[%i1]0x80, %o1
2:	.word	0x95400000	! t0_kref+0x22c:   	mov	%y, %o2
	.word	0x905d8016	! t0_kref+0x230:   	smul	%l6, %l6, %o0
	.word	0x9635bedf	! t0_kref+0x234:   	orn	%l6, -0x121, %o3
	.word	0x9435c016	! t0_kref+0x238:   	orn	%l7, %l6, %o2
	.word	0x9f414000	! t0_kref+0x23c:   	mov	%pc, %o7
	.word	0x81a90a21	! t0_kref+0x240:   	fcmps	%fcc0, %f4, %f1
	.word	0x9005fcd8	! t0_kref+0x244:   	add	%l7, -0x328, %o0
	.word	0x9e458017	! t0_kref+0x248:   	addc	%l6, %l7, %o7
	.word	0x98f5fac7	! t0_kref+0x24c:   	udivcc	%l7, -0x539, %o4
	.word	0x9fc0001c	! t0_kref+0x250:   	call	%g0 + %i4
	.word	0xa13d8016	! t0_kref+0x254:   	sra	%l6, %l6, %l0
	.word	0x81a18d26	! t0_kref+0x258:   	fsmuld	%f6, %f6, %f0
	.word	0x81d9617f	! t0_kref+0x25c:   	flush	%g5 + 0x17f
	.word	0x89a000a3	! t0_kref+0x260:   	fnegs	%f3, %f4
	call	SYM(t0_subr3)
	.word	0xa0a58017	! t0_kref+0x268:   	subcc	%l6, %l7, %l0
	.word	0x9a65f36a	! t0_kref+0x26c:   	subc	%l7, -0xc96, %o5
	.word	0x969d8016	! t0_kref+0x270:   	xorcc	%l6, %l6, %o3
	.word	0x31800005	! t0_kref+0x274:   	fba,a	_kref+0x288
	.word	0xd8160000	! t0_kref+0x278:   	lduh	[%i0], %o4
	.word	0x80ddb189	! t0_kref+0x27c:   	smulcc	%l6, -0xe77, %g0
	.word	0x89a01a42	! t0_kref+0x280:   	fdtoi	%f2, %f4
	.word	0x94c5c016	! t0_kref+0x284:   	addccc	%l7, %l6, %o2
	.word	0x945da036	! t0_kref+0x288:   	smul	%l6, 0x36, %o2
	.word	0xc168a04f	! t0_kref+0x28c:   	prefetch	%g2 + 0x4f, 0
	.word	0x85a188c2	! t0_kref+0x290:   	fsubd	%f6, %f2, %f2
	.word	0xecbf5018	! t0_kref+0x294:   	stda	%l6, [%i5 + %i0]0x80
	.word	0x94dd8016	! t0_kref+0x298:   	smulcc	%l6, %l6, %o2
	.word	0x985df212	! t0_kref+0x29c:   	smul	%l7, -0xdee, %o4
	.word	0x80adb4ee	! t0_kref+0x2a0:   	andncc	%l6, -0xb12, %g0
	.word	0xec763ff8	! t0_kref+0x2a4:   	stx	%l6, [%i0 - 8]
	.word	0x8143e040	! t0_kref+0x2a8:   	membar	0x40
	.word	0x9425b4a2	! t0_kref+0x2ac:   	sub	%l6, -0xb5e, %o2
	.word	0xc3200019	! t0_kref+0x2b0:   	st	%f1, [%g0 + %i1]
	.word	0x94d5e34a	! t0_kref+0x2b4:   	umulcc	%l7, 0x34a, %o2
	.word	0x949da65c	! t0_kref+0x2b8:   	xorcc	%l6, 0x65c, %o2
	.word	0x9235c017	! t0_kref+0x2bc:   	orn	%l7, %l7, %o1
	.word	0x92658017	! t0_kref+0x2c0:   	subc	%l6, %l7, %o1
	.word	0x81a90ac2	! t0_kref+0x2c4:   	fcmped	%fcc0, %f4, %f2
	.word	0x9f414000	! t0_kref+0x2c8:   	mov	%pc, %o7
!	.word	0x294e674d	! t0_kref+0x2cc:   	fbl,a,pt	%fcc0, SYM(t0_subr2)
	   	fbl,a,pt	%fcc0, SYM(t0_subr2)
	.word	0xc06e8018	! t0_kref+0x2d0:   	ldstub	[%i2 + %i0], %g0
	.word	0xeea81019	! t0_kref+0x2d4:   	stba	%l7, [%g0 + %i1]0x80
	.word	0x8143c000	! t0_kref+0x2d8:   	stbar
	.word	0x9645c016	! t0_kref+0x2dc:   	addc	%l7, %l6, %o3
	.word	0xd0380018	! t0_kref+0x2e0:   	std	%o0, [%g0 + %i0]
	.word	0x9a458016	! t0_kref+0x2e4:   	addc	%l6, %l6, %o5
	.word	0xe27e6018	! t0_kref+0x2e8:   	swap	[%i1 + 0x18], %l1
	.word	0xc36e3fe0	! t0_kref+0x2ec:   	prefetch	%i0 - 0x20, 1
	.word	0x85a018c8	! t0_kref+0x2f0:   	fdtos	%f8, %f2
	.word	0xd03e7fe8	! t0_kref+0x2f4:   	std	%o0, [%i1 - 0x18]
	.word	0x89a01907	! t0_kref+0x2f8:   	fitod	%f7, %f4
	.word	0xc0e81019	! t0_kref+0x2fc:   	ldstuba	[%g0 + %i1]0x80, %g0
	.word	0xd83e3ff8	! t0_kref+0x300:   	std	%o4, [%i0 - 8]
	.word	0x86102004	! t0_kref+0x304:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x308:   	bne,a	_kref+0x308
	.word	0x86a0e001	! t0_kref+0x30c:   	subcc	%g3, 1, %g3
	.word	0x9525f7f6	! t0_kref+0x310:   	mulscc	%l7, -0x80a, %o2
	.word	0xda4e4000	! t0_kref+0x314:   	ldsb	[%i1], %o5
	.word	0x81a01a20	! t0_kref+0x318:   	fstoi	%f0, %f0
	.word	0xeea81018	! t0_kref+0x31c:   	stba	%l7, [%g0 + %i0]0x80
	.word	0x9445ad92	! t0_kref+0x320:   	addc	%l6, 0xd92, %o2
	.word	0xd5f61017	! t0_kref+0x324:   	casxa	[%i0]0x80, %l7, %o2
	.word	0xe6ee501a	! t0_kref+0x328:   	ldstuba	[%i1 + %i2]0x80, %l3
	.word	0x9ac5adaf	! t0_kref+0x32c:   	addccc	%l6, 0xdaf, %o5
	.word	0xd67e3fe8	! t0_kref+0x330:   	swap	[%i0 - 0x18], %o3
	.word	0x8065e8f5	! t0_kref+0x334:   	subc	%l7, 0x8f5, %g0
	.word	0x98f58016	! t0_kref+0x338:   	udivcc	%l6, %l6, %o4
	.word	0x9e958016	! t0_kref+0x33c:   	orcc	%l6, %l6, %o7
	.word	0x9865b149	! t0_kref+0x340:   	subc	%l6, -0xeb7, %o4
	.word	0x83a018c2	! t0_kref+0x344:   	fdtos	%f2, %f1
	.word	0xd87e201c	! t0_kref+0x348:   	swap	[%i0 + 0x1c], %o4
	.word	0x8ba000a9	! t0_kref+0x34c:   	fnegs	%f9, %f5
	.word	0x98c58017	! t0_kref+0x350:   	addccc	%l6, %l7, %o4
	.word	0xd1e61016	! t0_kref+0x354:   	casa	[%i0]0x80, %l6, %o0
	.word	0x81a90aa9	! t0_kref+0x358:   	fcmpes	%fcc0, %f4, %f9
	.word	0x9a758017	! t0_kref+0x35c:   	udiv	%l6, %l7, %o5
	.word	0x9f3dc017	! t0_kref+0x360:   	sra	%l7, %l7, %o7
	.word	0x89a18842	! t0_kref+0x364:   	faddd	%f6, %f2, %f4
	.word	0xc9be9a18	! t0_kref+0x368:   	stda	%f4, [%i2 + %i0]0xd0
	.word	0x80458017	! t0_kref+0x36c:   	addc	%l6, %l7, %g0
	.word	0xe098105d	! t0_kref+0x370:   	ldda	[%g0 + %i5]0x82, %l0
	.word	0xec36200e	! t0_kref+0x374:   	sth	%l6, [%i0 + 0xe]
	.word	0xee26200c	! t0_kref+0x378:   	st	%l7, [%i0 + 0xc]
	.word	0x85a01900	! t0_kref+0x37c:   	fitod	%f0, %f2
	.word	0x86102002	! t0_kref+0x380:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x384:   	bne,a	_kref+0x384
	.word	0x86a0e001	! t0_kref+0x388:   	subcc	%g3, 1, %g3
	.word	0x83a000a4	! t0_kref+0x38c:   	fnegs	%f4, %f1
	.word	0xcb20a02c	! t0_kref+0x390:   	st	%f5, [%g2 + 0x2c]
	.word	0x81a14d23	! t0_kref+0x394:   	fsmuld	%f5, %f3, %f0
	.word	0x9335a017	! t0_kref+0x398:   	srl	%l6, 0x17, %o1
	.word	0xda68a03d	! t0_kref+0x39c:   	ldstub	[%g2 + 0x3d], %o5
	.word	0xef68a048	! t0_kref+0x3a0:   	prefetch	%g2 + 0x48, 23
	.word	0x81a018c0	! t0_kref+0x3a4:   	fdtos	%f0, %f0
	.word	0xec20a024	! t0_kref+0x3a8:   	st	%l6, [%g2 + 0x24]
	.word	0x81dce80f	! t0_kref+0x3ac:   	flush	%l3 + 0x80f
	.word	0x89a018c0	! t0_kref+0x3b0:   	fdtos	%f0, %f4
	.word	0x27800005	! t0_kref+0x3b4:   	fbul,a	_kref+0x3c8
	.word	0x9a05c016	! t0_kref+0x3b8:   	add	%l7, %l6, %o5
	.word	0x81df7066	! t0_kref+0x3bc:   	flush	%i5 - 0xf9a
	.word	0xc1ee5017	! t0_kref+0x3c0:   	prefetcha	%i1 + %l7, 0
	.word	0xc36e3ff8	! t0_kref+0x3c4:   	prefetch	%i0 - 8, 1
	.word	0x9eadc016	! t0_kref+0x3c8:   	andncc	%l7, %l6, %o7
	.word	0x81a20844	! t0_kref+0x3cc:   	faddd	%f8, %f4, %f0
	.word	0x9b418000	! t0_kref+0x3d0:   	mov	%fprs, %o5
	.word	0x913de011	! t0_kref+0x3d4:   	sra	%l7, 0x11, %o0
	.word	0x9225c017	! t0_kref+0x3d8:   	sub	%l7, %l7, %o1
	.word	0xee2e0000	! t0_kref+0x3dc:   	stb	%l7, [%i0]
	call	SYM(t0_subr3)
	.word	0xd04e7ff9	! t0_kref+0x3e4:   	ldsb	[%i1 - 7], %o0
	.word	0x91a000a4	! t0_kref+0x3e8:   	fnegs	%f4, %f8
	.word	0x94758016	! t0_kref+0x3ec:   	udiv	%l6, %l6, %o2
	.word	0x87a01a22	! t0_kref+0x3f0:   	fstoi	%f2, %f3
	.word	0x91a01900	! t0_kref+0x3f4:   	fitod	%f0, %f8
	.word	0xe5e65016	! t0_kref+0x3f8:   	casa	[%i1]0x80, %l6, %l2
	.word	0x83a1c9a2	! t0_kref+0x3fc:   	fdivs	%f7, %f2, %f1
	.word	0x973da009	! t0_kref+0x400:   	sra	%l6, 0x9, %o3
	.word	0x90d5b258	! t0_kref+0x404:   	umulcc	%l6, -0xda8, %o0
	.word	0xec3f4019	! t0_kref+0x408:   	std	%l6, [%i5 + %i1]
	.word	0x800dc017	! t0_kref+0x40c:   	and	%l7, %l7, %g0
	.word	0xefee501b	! t0_kref+0x410:   	prefetcha	%i1 + %i3, 23
	call	SYM(t0_subr3)
	.word	0xd27e2008	! t0_kref+0x418:   	swap	[%i0 + 8], %o1
	.word	0xd47e3fec	! t0_kref+0x41c:   	swap	[%i0 - 0x14], %o2
	.word	0xcd1fbee8	! t0_kref+0x420:   	ldd	[%fp - 0x118], %f6
	.word	0x91a208c2	! t0_kref+0x424:   	fsubd	%f8, %f2, %f8
	.word	0x9625c017	! t0_kref+0x428:   	sub	%l7, %l7, %o3
	.word	0x8185c000	! t0_kref+0x42c:   	wr	%l7, %g0, %y
	.word	0x85a20846	! t0_kref+0x430:   	faddd	%f8, %f6, %f2
	.word	0x9845f31b	! t0_kref+0x434:   	addc	%l7, -0xce5, %o4
	.word	0x81a8ca27	! t0_kref+0x438:   	fcmps	%fcc0, %f3, %f7
	.word	0xda6e2010	! t0_kref+0x43c:   	ldstub	[%i0 + 0x10], %o5
	.word	0x81a84a29	! t0_kref+0x440:   	fcmps	%fcc0, %f1, %f9
	.word	0x92a5e72b	! t0_kref+0x444:   	subcc	%l7, 0x72b, %o1
	.word	0xd43e0000	! t0_kref+0x448:   	std	%o2, [%i0]
	.word	0xf1ee101d	! t0_kref+0x44c:   	prefetcha	%i0 + %i5, 24
	.word	0xd040a024	! t0_kref+0x450:   	ldsw	[%g2 + 0x24], %o0
	.word	0x98c5e027	! t0_kref+0x454:   	addccc	%l7, 0x27, %o4
	.word	0x93a01a24	! t0_kref+0x458:   	fstoi	%f4, %f9
	.word	0x91a000c6	! t0_kref+0x45c:   	fnegd	%f6, %f8
	.word	0x81ab4048	! t0_kref+0x460:   	fmovdle	%fcc0, %f8, %f0
	.word	0x9245c017	! t0_kref+0x464:   	addc	%l7, %l7, %o1
	.word	0x31800005	! t0_kref+0x468:   	fba,a	_kref+0x47c
	.word	0xec367ff6	! t0_kref+0x46c:   	sth	%l6, [%i1 - 0xa]
	.word	0x9fc10000	! t0_kref+0x470:   	call	%g4
	.word	0x98558016	! t0_kref+0x474:   	umul	%l6, %l6, %o4
	call	SYM(t0_subr0)
	.word	0x81dc7b1c	! t0_kref+0x47c:   	flush	%l1 - 0x4e4
	.word	0x22480003	! t0_kref+0x480:   	be,a,pt	%icc, _kref+0x48c
	.word	0x81a018c6	! t0_kref+0x484:   	fdtos	%f6, %f0
	.word	0x808dad6c	! t0_kref+0x488:   	btst	0xd6c, %l6
	.word	0x91a018c0	! t0_kref+0x48c:   	fdtos	%f0, %f8
	.word	0xcb00a028	! t0_kref+0x490:   	ld	[%g2 + 0x28], %f5
	.word	0xeb68a005	! t0_kref+0x494:   	prefetch	%g2 + 5, 21
	.word	0x9075fd53	! t0_kref+0x498:   	udiv	%l7, -0x2ad, %o0
	.word	0x9045a54a	! t0_kref+0x49c:   	addc	%l6, 0x54a, %o0
	.word	0xd1180018	! t0_kref+0x4a0:   	ldd	[%g0 + %i0], %f8
	.word	0xc1be1897	! t0_kref+0x4a4:   	stda	%f0, [%i0 + %l7]0xc4
	.word	0x86102001	! t0_kref+0x4a8:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x4ac:   	bne,a	_kref+0x4ac
	.word	0x86a0e001	! t0_kref+0x4b0:   	subcc	%g3, 1, %g3
	.word	0x89a149a6	! t0_kref+0x4b4:   	fdivs	%f5, %f6, %f4
	.word	0xd13e3fe0	! t0_kref+0x4b8:   	std	%f8, [%i0 - 0x20]
	.word	0x96adf132	! t0_kref+0x4bc:   	andncc	%l7, -0xece, %o3
	.word	0x8da01029	! t0_kref+0x4c0:   	fstox	%f9, %f6
	.word	0x9a458017	! t0_kref+0x4c4:   	addc	%l6, %l7, %o5
	.word	0xec20a030	! t0_kref+0x4c8:   	st	%l6, [%g2 + 0x30]
	.word	0x96b58017	! t0_kref+0x4cc:   	orncc	%l6, %l7, %o3
	.word	0x9a358017	! t0_kref+0x4d0:   	orn	%l6, %l7, %o5
	.word	0x81a00027	! t0_kref+0x4d4:   	fmovs	%f7, %f0
	.word	0x8fa01889	! t0_kref+0x4d8:   	fitos	%f9, %f7
	.word	0x983dea4c	! t0_kref+0x4dc:   	xnor	%l7, 0xa4c, %o4
	.word	0xeea81018	! t0_kref+0x4e0:   	stba	%l7, [%g0 + %i0]0x80
	.word	0x98ad8017	! t0_kref+0x4e4:   	andncc	%l6, %l7, %o4
	.word	0x81a88ac4	! t0_kref+0x4e8:   	fcmped	%fcc0, %f2, %f4
	.word	0x9aada019	! t0_kref+0x4ec:   	andncc	%l6, 0x19, %o5
	.word	0x81858000	! t0_kref+0x4f0:   	wr	%l6, %g0, %y
	.word	0x98d5a886	! t0_kref+0x4f4:   	umulcc	%l6, 0x886, %o4
	.word	0x86102003	! t0_kref+0x4f8:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x4fc:   	bne,a	_kref+0x4fc
	.word	0x86a0e001	! t0_kref+0x500:   	subcc	%g3, 1, %g3
	.word	0x9ea5c016	! t0_kref+0x504:   	subcc	%l7, %l6, %o7
	.word	0x9125eada	! t0_kref+0x508:   	mulscc	%l7, 0xada, %o0
	.word	0xd25e401d	! t0_kref+0x50c:   	ldx	[%i1 + %i5], %o1
	.word	0xeb6e2000	! t0_kref+0x510:   	prefetch	%i0, 21
	.word	0xea780018	! t0_kref+0x514:   	swap	[%g0 + %i0], %l5
	.word	0xd86e600f	! t0_kref+0x518:   	ldstub	[%i1 + 0xf], %o4
	.word	0x81aa0a23	! t0_kref+0x51c:   	fcmps	%fcc0, %f8, %f3
	.word	0xda166012	! t0_kref+0x520:   	lduh	[%i1 + 0x12], %o5
	.word	0x988dc017	! t0_kref+0x524:   	andcc	%l7, %l7, %o4
	.word	0xc040a008	! t0_kref+0x528:   	ldsw	[%g2 + 8], %g0
	.word	0xe4086438	! t0_kref+0x52c:   	ldub	[%g1 + 0x438], %l2
	.word	0xa41ca00c	! t0_kref+0x530:   	xor	%l2, 0xc, %l2
	.word	0xe4286438	! t0_kref+0x534:   	stb	%l2, [%g1 + 0x438]
	.word	0x81d86438	! t0_kref+0x538:   	flush	%g1 + 0x438
	.word	0x85a000a8	! t0_kref+0x53c:   	fnegs	%f8, %f2
	.word	0x9085c016	! t0_kref+0x540:   	addcc	%l7, %l6, %o0
	.word	0xd13e0000	! t0_kref+0x544:   	std	%f8, [%i0]
	.word	0xef6e6018	! t0_kref+0x548:   	prefetch	%i1 + 0x18, 23
	.word	0xd4c71018	! t0_kref+0x54c:   	ldswa	[%i4 + %i0]0x80, %o2
	.word	0xda163fe2	! t0_kref+0x550:   	lduh	[%i0 - 0x1e], %o5
	.word	0xc128001c	! t0_kref+0x554:   	st	%fsr, [%g0 + %i4]
	.word	0x981df5ee	! t0_kref+0x558:   	xor	%l7, -0xa12, %o4
	.word	0x85a01a21	! t0_kref+0x55c:   	fstoi	%f1, %f2
	.word	0x94c5bc78	! t0_kref+0x560:   	addccc	%l6, -0x388, %o2
	.word	0xc5bf5019	! t0_kref+0x564:   	stda	%f2, [%i5 + %i1]0x80
	.word	0x83a01a21	! t0_kref+0x568:   	fstoi	%f1, %f1
2:	.word	0xa0c5f71e	! t0_kref+0x56c:   	addccc	%l7, -0x8e2, %l0
	.word	0x8143e040	! t0_kref+0x570:   	membar	0x40
	.word	0xec364000	! t0_kref+0x574:   	sth	%l6, [%i1]
	.word	0x9a8d8016	! t0_kref+0x578:   	andcc	%l6, %l6, %o5
	.word	0xee30a002	! t0_kref+0x57c:   	sth	%l7, [%g2 + 2]
	.word	0xc53f4019	! t0_kref+0x580:   	std	%f2, [%i5 + %i1]
	.word	0x969de38f	! t0_kref+0x584:   	xorcc	%l7, 0x38f, %o3
	.word	0x89a00948	! t0_kref+0x588:   	fmuld	%f0, %f8, %f4
	.word	0xec28a037	! t0_kref+0x58c:   	stb	%l6, [%g2 + 0x37]
	.word	0xf1ee101d	! t0_kref+0x590:   	prefetcha	%i0 + %i5, 24
	.word	0x91a01904	! t0_kref+0x594:   	fitod	%f4, %f8
	.word	0xc51fbe60	! t0_kref+0x598:   	ldd	[%fp - 0x1a0], %f2
	.word	0xec363ffc	! t0_kref+0x59c:   	sth	%l6, [%i0 - 4]
	.word	0x94ddfb4d	! t0_kref+0x5a0:   	smulcc	%l7, -0x4b3, %o2
	.word	0x91a10d26	! t0_kref+0x5a4:   	fsmuld	%f4, %f6, %f8
	.word	0x900dc016	! t0_kref+0x5a8:   	and	%l7, %l6, %o0
	.word	0x803d8016	! t0_kref+0x5ac:   	xnor	%l6, %l6, %g0
	.word	0x8d85bcc6	! t0_kref+0x5b0:   	wr	%l6, 0xfffffcc6, %fprs
	.word	0x86102003	! t0_kref+0x5b4:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x5b8:   	bne,a	_kref+0x5b8
	.word	0x86a0e001	! t0_kref+0x5bc:   	subcc	%g3, 1, %g3
	.word	0xc3ee1017	! t0_kref+0x5c0:   	prefetcha	%i0 + %l7, 1
	.word	0xfd6e3fe8	! t0_kref+0x5c4:   	prefetch	%i0 - 0x18, 30
	.word	0x9075be25	! t0_kref+0x5c8:   	udiv	%l6, -0x1db, %o0
	.word	0x1931de23	! t0_kref+0x5cc:   	sethi	%hi(0xc7788c00), %o4
	.word	0x81a98ac2	! t0_kref+0x5d0:   	fcmped	%fcc0, %f6, %f2
	.word	0x8da00d21	! t0_kref+0x5d4:   	fsmuld	%f0, %f1, %f6
	.word	0x89a00026	! t0_kref+0x5d8:   	fmovs	%f6, %f4
	.word	0xd11e4000	! t0_kref+0x5dc:   	ldd	[%i1], %f8
	.word	0x01271927	! t0_kref+0x5e0:   	sethi	%hi(0x9c649c00), %g0
	.word	0x80ddb87b	! t0_kref+0x5e4:   	smulcc	%l6, -0x785, %g0
	.word	0xc9200018	! t0_kref+0x5e8:   	st	%f4, [%g0 + %i0]
	.word	0x80d5c017	! t0_kref+0x5ec:   	umulcc	%l7, %l7, %g0
	.word	0xec366014	! t0_kref+0x5f0:   	sth	%l6, [%i1 + 0x14]
	.word	0xea6e0000	! t0_kref+0x5f4:   	ldstub	[%i0], %l5
	.word	0x91a01a26	! t0_kref+0x5f8:   	fstoi	%f6, %f8
	.word	0x9fc10000	! t0_kref+0x5fc:   	call	%g4
	.word	0xcf200019	! t0_kref+0x600:   	st	%f7, [%g0 + %i1]
	.word	0x81a00022	! t0_kref+0x604:   	fmovs	%f2, %f0
	.word	0x950d8017	! t0_kref+0x608:   	tsubcc	%l6, %l7, %o2
	.word	0xc5bf5018	! t0_kref+0x60c:   	stda	%f2, [%i5 + %i0]0x80
	.word	0x8610200f	! t0_kref+0x610:   	mov	0xf, %g3
	.word	0x86a0e001	! t0_kref+0x614:   	subcc	%g3, 1, %g3
	.word	0x22800007	! t0_kref+0x618:   	be,a	_kref+0x634
	.word	0x945da693	! t0_kref+0x61c:   	smul	%l6, 0x693, %o2
	.word	0xcd3e3ff8	! t0_kref+0x620:   	std	%f6, [%i0 - 8]
	.word	0x21bffffc	! t0_kref+0x624:   	fbn,a	_kref+0x614
	.word	0x8185c000	! t0_kref+0x628:   	wr	%l7, %g0, %y
	.word	0x96358017	! t0_kref+0x62c:   	orn	%l6, %l7, %o3
	.word	0x91a108c8	! t0_kref+0x630:   	fsubd	%f4, %f8, %f8
	.word	0x9725a24e	! t0_kref+0x634:   	mulscc	%l6, 0x24e, %o3
	.word	0x81a0cd29	! t0_kref+0x638:   	fsmuld	%f3, %f9, %f0
	.word	0xee362010	! t0_kref+0x63c:   	sth	%l7, [%i0 + 0x10]
	.word	0xd0d81019	! t0_kref+0x640:   	ldxa	[%g0 + %i1]0x80, %o0
	.word	0x81a90ac8	! t0_kref+0x644:   	fcmped	%fcc0, %f4, %f8
	.word	0x8143c000	! t0_kref+0x648:   	stbar
	.word	0xe36e2010	! t0_kref+0x64c:   	prefetch	%i0 + 0x10, 17
	.word	0xec28a00e	! t0_kref+0x650:   	stb	%l6, [%g2 + 0xe]
	.word	0xec30a00e	! t0_kref+0x654:   	sth	%l6, [%g2 + 0xe]
	.word	0x8005c017	! t0_kref+0x658:   	add	%l7, %l7, %g0
	.word	0xe4fe501c	! t0_kref+0x65c:   	swapa	[%i1 + %i4]0x80, %l2
	.word	0x9f35c017	! t0_kref+0x660:   	srl	%l7, %l7, %o7
	.word	0x8ba209a4	! t0_kref+0x664:   	fdivs	%f8, %f4, %f5
	.word	0xe06e8019	! t0_kref+0x668:   	ldstub	[%i2 + %i1], %l0
	.word	0x8ba000a5	! t0_kref+0x66c:   	fnegs	%f5, %f5
	.word	0x83a14926	! t0_kref+0x670:   	fmuls	%f5, %f6, %f1
	.word	0x993da01c	! t0_kref+0x674:   	sra	%l6, 0x1c, %o4
	.word	0xd0961000	! t0_kref+0x678:   	lduha	[%i0]0x80, %o0
	.word	0x3f800006	! t0_kref+0x67c:   	fbo,a	_kref+0x694
	.word	0xc9ee5017	! t0_kref+0x680:   	prefetcha	%i1 + %l7, 4
	.word	0xc56e2008	! t0_kref+0x684:   	prefetch	%i0 + 8, 2
	.word	0xf36e2018	! t0_kref+0x688:   	prefetch	%i0 + 0x18, 25
	.word	0xd050a01c	! t0_kref+0x68c:   	ldsh	[%g2 + 0x1c], %o0
	.word	0xee2e7fe4	! t0_kref+0x690:   	stb	%l7, [%i1 - 0x1c]
	.word	0x86102008	! t0_kref+0x694:   	mov	0x8, %g3
	.word	0x86a0e001	! t0_kref+0x698:   	subcc	%g3, 1, %g3
	.word	0x22800013	! t0_kref+0x69c:   	be,a	_kref+0x6e8
	.word	0x89a188c2	! t0_kref+0x6a0:   	fsubd	%f6, %f2, %f4
	.word	0x81a018c2	! t0_kref+0x6a4:   	fdtos	%f2, %f0
	.word	0x9f418000	! t0_kref+0x6a8:   	mov	%fprs, %o7
	.word	0x908db18a	! t0_kref+0x6ac:   	andcc	%l6, -0xe76, %o0
	.word	0x81aa0aa9	! t0_kref+0x6b0:   	fcmpes	%fcc0, %f8, %f9
	.word	0x89a009c8	! t0_kref+0x6b4:   	fdivd	%f0, %f8, %f4
	.word	0x89a018c6	! t0_kref+0x6b8:   	fdtos	%f6, %f4
	.word	0xee28a008	! t0_kref+0x6bc:   	stb	%l7, [%g2 + 8]
	.word	0xf56e3fe8	! t0_kref+0x6c0:   	prefetch	%i0 - 0x18, 26
	.word	0xeeae9019	! t0_kref+0x6c4:   	stba	%l7, [%i2 + %i1]0x80
	.word	0x9f0deb9a	! t0_kref+0x6c8:   	tsubcc	%l7, 0xb9a, %o7
	.word	0x85a01901	! t0_kref+0x6cc:   	fitod	%f1, %f2
	.word	0xec263fe4	! t0_kref+0x6d0:   	st	%l6, [%i0 - 0x1c]
	.word	0x8da01885	! t0_kref+0x6d4:   	fitos	%f5, %f6
	.word	0xd016c018	! t0_kref+0x6d8:   	lduh	[%i3 + %i0], %o0
	.word	0x89a01a21	! t0_kref+0x6dc:   	fstoi	%f1, %f4
	.word	0xda40a004	! t0_kref+0x6e0:   	ldsw	[%g2 + 4], %o5
	.word	0x91a01929	! t0_kref+0x6e4:   	fstod	%f9, %f8
	.word	0x90d5fa97	! t0_kref+0x6e8:   	umulcc	%l7, -0x569, %o0
	.word	0x929dc016	! t0_kref+0x6ec:   	xorcc	%l7, %l6, %o1
	.word	0x87a018c0	! t0_kref+0x6f0:   	fdtos	%f0, %f3
	.word	0xe4086608	! t0_kref+0x6f4:   	ldub	[%g1 + 0x608], %l2
	.word	0xa41ca00c	! t0_kref+0x6f8:   	xor	%l2, 0xc, %l2
	.word	0xe4286608	! t0_kref+0x6fc:   	stb	%l2, [%g1 + 0x608]
	.word	0x81d86608	! t0_kref+0x700:   	flush	%g1 + 0x608
	.word	0x81a8caa7	! t0_kref+0x704:   	fcmpes	%fcc0, %f3, %f7
	.word	0xeb68a081	! t0_kref+0x708:   	prefetch	%g2 + 0x81, 21
	.word	0xe41e0000	! t0_kref+0x70c:   	ldd	[%i0], %l2
	.word	0xebee501c	! t0_kref+0x710:   	prefetcha	%i1 + %i4, 21
	.word	0xc91e3ff8	! t0_kref+0x714:   	ldd	[%i0 - 8], %f4
	.word	0x87a01888	! t0_kref+0x718:   	fitos	%f8, %f3
	.word	0x9e65c017	! t0_kref+0x71c:   	subc	%l7, %l7, %o7
	.word	0x8125a65f	! t0_kref+0x720:   	mulscc	%l6, 0x65f, %g0
	.word	0x89a01924	! t0_kref+0x724:   	fstod	%f4, %f4
	.word	0x9e75c016	! t0_kref+0x728:   	udiv	%l7, %l6, %o7
	.word	0xde4e401a	! t0_kref+0x72c:   	ldsb	[%i1 + %i2], %o7
	.word	0x94a5b7cf	! t0_kref+0x730:   	subcc	%l6, -0x831, %o2
	.word	0xc0e81019	! t0_kref+0x734:   	ldstuba	[%g0 + %i1]0x80, %g0
	.word	0x81aa4a24	! t0_kref+0x738:   	fcmps	%fcc0, %f9, %f4
2:	.word	0x91a009c2	! t0_kref+0x73c:   	fdivd	%f0, %f2, %f8
	.word	0xd43e7ff0	! t0_kref+0x740:   	std	%o2, [%i1 - 0x10]
	.word	0xc1be1a1c	! t0_kref+0x744:   	stda	%f0, [%i0 + %i4]0xd0
	.word	0xd03e7ff0	! t0_kref+0x748:   	std	%o0, [%i1 - 0x10]
	.word	0x8ba01889	! t0_kref+0x74c:   	fitos	%f9, %f5
	.word	0x9065a4f1	! t0_kref+0x750:   	subc	%l6, 0x4f1, %o0
	call	SYM(t0_subr1)
	.word	0xecff1019	! t0_kref+0x758:   	swapa	[%i4 + %i1]0x80, %l6
	.word	0x81dec004	! t0_kref+0x75c:   	flush	%i3 + %g4
	.word	0x91358016	! t0_kref+0x760:   	srl	%l6, %l6, %o0
	.word	0x81aa0a44	! t0_kref+0x764:   	fcmpd	%fcc0, %f8, %f4
	call	SYM(t0_subr2)
	.word	0xec36c018	! t0_kref+0x76c:   	sth	%l6, [%i3 + %i0]
	.word	0x80d5a76d	! t0_kref+0x770:   	umulcc	%l6, 0x76d, %g0
	.word	0x94adbbd3	! t0_kref+0x774:   	andncc	%l6, -0x42d, %o2
	.word	0x9935c017	! t0_kref+0x778:   	srl	%l7, %l7, %o4
	.word	0xcf20a01c	! t0_kref+0x77c:   	st	%f7, [%g2 + 0x1c]
	.word	0xcf26401c	! t0_kref+0x780:   	st	%f7, [%i1 + %i4]
	.word	0x973da01b	! t0_kref+0x784:   	sra	%l6, 0x1b, %o3
	.word	0x912de00b	! t0_kref+0x788:   	sll	%l7, 0xb, %o0
	.word	0x85a018c6	! t0_kref+0x78c:   	fdtos	%f6, %f2
	.word	0x91a009a8	! t0_kref+0x790:   	fdivs	%f0, %f8, %f8
	.word	0xeeae501a	! t0_kref+0x794:   	stba	%l7, [%i1 + %i2]0x80
	.word	0xec36401b	! t0_kref+0x798:   	sth	%l6, [%i1 + %i3]
	.word	0x25800005	! t0_kref+0x79c:   	fblg,a	_kref+0x7b0
	.word	0xee36c018	! t0_kref+0x7a0:   	sth	%l7, [%i3 + %i0]
	.word	0xd640a000	! t0_kref+0x7a4:   	ldsw	[%g2], %o3
	.word	0x9f258016	! t0_kref+0x7a8:   	mulscc	%l6, %l6, %o7
	.word	0xcd1fbc30	! t0_kref+0x7ac:   	ldd	[%fp - 0x3d0], %f6
	.word	0x94bdbf44	! t0_kref+0x7b0:   	xnorcc	%l6, -0xbc, %o2
	.word	0x94e5c016	! t0_kref+0x7b4:   	subccc	%l7, %l6, %o2
	.word	0x9a65b5d1	! t0_kref+0x7b8:   	subc	%l6, -0xa2f, %o5
	.word	0x91a08846	! t0_kref+0x7bc:   	faddd	%f2, %f6, %f8
	.word	0x89a189c6	! t0_kref+0x7c0:   	fdivd	%f6, %f6, %f4
	.word	0x89a08d23	! t0_kref+0x7c4:   	fsmuld	%f2, %f3, %f4
	.word	0x39800008	! t0_kref+0x7c8:   	fbuge,a	_kref+0x7e8
	.word	0xd46e6004	! t0_kref+0x7cc:   	ldstub	[%i1 + 4], %o2
	.word	0x9835c017	! t0_kref+0x7d0:   	orn	%l7, %l7, %o4
	.word	0x39800003	! t0_kref+0x7d4:   	fbuge,a	_kref+0x7e0
	.word	0x9215c016	! t0_kref+0x7d8:   	or	%l7, %l6, %o1
	.word	0x89a01903	! t0_kref+0x7dc:   	fitod	%f3, %f4
	.word	0xc91fbf10	! t0_kref+0x7e0:   	ldd	[%fp - 0xf0], %f4
	.word	0x9e05b282	! t0_kref+0x7e4:   	add	%l6, -0xd7e, %o7
	.word	0xf7ee101a	! t0_kref+0x7e8:   	prefetcha	%i0 + %i2, 27
	.word	0x86102002	! t0_kref+0x7ec:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x7f0:   	bne,a	_kref+0x7f0
	.word	0x86a0e001	! t0_kref+0x7f4:   	subcc	%g3, 1, %g3
	.word	0x9fc00004	! t0_kref+0x7f8:   	call	%g0 + %g4
	.word	0x9835ffa3	! t0_kref+0x7fc:   	orn	%l7, -0x5d, %o4
	.word	0xec20a030	! t0_kref+0x800:   	st	%l6, [%g2 + 0x30]
	.word	0xc9be1896	! t0_kref+0x804:   	stda	%f4, [%i0 + %l6]0xc4
	.word	0x8ba00023	! t0_kref+0x808:   	fmovs	%f3, %f5
	.word	0x85a009c2	! t0_kref+0x80c:   	fdivd	%f0, %f2, %f2
	.word	0xd83e7ff0	! t0_kref+0x810:   	std	%o4, [%i1 - 0x10]
	.word	0x983dc016	! t0_kref+0x814:   	xnor	%l7, %l6, %o4
	.word	0x81aa0a24	! t0_kref+0x818:   	fcmps	%fcc0, %f8, %f4
	.word	0x89a01922	! t0_kref+0x81c:   	fstod	%f2, %f4
	.word	0xc9263fec	! t0_kref+0x820:   	st	%f4, [%i0 - 0x14]
	.word	0x81858000	! t0_kref+0x824:   	wr	%l6, %g0, %y
	.word	0x80c5c017	! t0_kref+0x828:   	addccc	%l7, %l7, %g0
	.word	0xef68a08d	! t0_kref+0x82c:   	prefetch	%g2 + 0x8d, 23
	.word	0xe968a08b	! t0_kref+0x830:   	prefetch	%g2 + 0x8b, 20
	.word	0x81a01904	! t0_kref+0x834:   	fitod	%f4, %f0
	.word	0xd6ee9018	! t0_kref+0x838:   	ldstuba	[%i2 + %i0]0x80, %o3
	.word	0x8143c000	! t0_kref+0x83c:   	stbar
	.word	0x94958017	! t0_kref+0x840:   	orcc	%l6, %l7, %o2
	.word	0x9445c016	! t0_kref+0x844:   	addc	%l7, %l6, %o2
	.word	0x90c58017	! t0_kref+0x848:   	addccc	%l6, %l7, %o0
	.word	0x9e65c016	! t0_kref+0x84c:   	subc	%l7, %l6, %o7
	.word	0x96a58016	! t0_kref+0x850:   	subcc	%l6, %l6, %o3
	.word	0x89a000a3	! t0_kref+0x854:   	fnegs	%f3, %f4
	call	SYM(t0_subr0)
	.word	0x9495c016	! t0_kref+0x85c:   	orcc	%l7, %l6, %o2
	.word	0x99400000	! t0_kref+0x860:   	mov	%y, %o4
	.word	0x8143c000	! t0_kref+0x864:   	stbar
	.word	0x85a109c0	! t0_kref+0x868:   	fdivd	%f4, %f0, %f2
	.word	0x93a00525	! t0_kref+0x86c:   	fsqrts	%f5, %f9
	.word	0xc016001b	! t0_kref+0x870:   	lduh	[%i0 + %i3], %g0
	.word	0xc500a024	! t0_kref+0x874:   	ld	[%g2 + 0x24], %f2
	.word	0x8fa018c8	! t0_kref+0x878:   	fdtos	%f8, %f7
	.word	0x9ed5f0cb	! t0_kref+0x87c:   	umulcc	%l7, -0xf35, %o7
	.word	0xc326401c	! t0_kref+0x880:   	st	%f1, [%i1 + %i4]
	.word	0xe808001a	! t0_kref+0x884:   	ldub	[%g0 + %i2], %l4
	.word	0xd6067fe0	! t0_kref+0x888:   	ld	[%i1 - 0x20], %o3
	.word	0x31800007	! t0_kref+0x88c:   	fba,a	_kref+0x8a8
	.word	0xedee101a	! t0_kref+0x890:   	prefetcha	%i0 + %i2, 22
	.word	0xd016c019	! t0_kref+0x894:   	lduh	[%i3 + %i1], %o0
	.word	0x93a000a0	! t0_kref+0x898:   	fnegs	%f0, %f9
	.word	0x9045f1e3	! t0_kref+0x89c:   	addc	%l7, -0xe1d, %o0
	.word	0xc568a006	! t0_kref+0x8a0:   	prefetch	%g2 + 6, 2
	.word	0xd26e4000	! t0_kref+0x8a4:   	ldstub	[%i1], %o1
	.word	0x81a90a24	! t0_kref+0x8a8:   	fcmps	%fcc0, %f4, %f4
	.word	0x81a90a21	! t0_kref+0x8ac:   	fcmps	%fcc0, %f4, %f1
	.word	0x96ddf4c3	! t0_kref+0x8b0:   	smulcc	%l7, -0xb3d, %o3
	.word	0x8ba01883	! t0_kref+0x8b4:   	fitos	%f3, %f5
	.word	0xd100a024	! t0_kref+0x8b8:   	ld	[%g2 + 0x24], %f8
	.word	0xd650a018	! t0_kref+0x8bc:   	ldsh	[%g2 + 0x18], %o3
	.word	0xec766008	! t0_kref+0x8c0:   	stx	%l6, [%i1 + 8]
	.word	0x81a88a46	! t0_kref+0x8c4:   	fcmpd	%fcc0, %f2, %f6
	.word	0x8da84040	! t0_kref+0x8c8:   	fmovdne	%fcc0, %f0, %f6
	.word	0x98058017	! t0_kref+0x8cc:   	add	%l6, %l7, %o4
	.word	0x86102004	! t0_kref+0x8d0:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x8d4:   	bne,a	_kref+0x8d4
	.word	0x86a0e001	! t0_kref+0x8d8:   	subcc	%g3, 1, %g3
	.word	0xe3ee501d	! t0_kref+0x8dc:   	prefetcha	%i1 + %i5, 17
	.word	0x83a01a27	! t0_kref+0x8e0:   	fstoi	%f7, %f1
	.word	0xe66e8018	! t0_kref+0x8e4:   	ldstub	[%i2 + %i0], %l3
	.word	0x80c58017	! t0_kref+0x8e8:   	addccc	%l6, %l7, %g0
	.word	0xc9be5a1a	! t0_kref+0x8ec:   	stda	%f4, [%i1 + %i2]0xd0
	.word	0x9e758016	! t0_kref+0x8f0:   	udiv	%l6, %l6, %o7
	.word	0x34480008	! t0_kref+0x8f4:   	bg,a,pt	%icc, _kref+0x914
	.word	0xe07e7ffc	! t0_kref+0x8f8:   	swap	[%i1 - 4], %l0
	.word	0x9a95b8bc	! t0_kref+0x8fc:   	orcc	%l6, -0x744, %o5
	.word	0x9ea5c017	! t0_kref+0x900:   	subcc	%l7, %l7, %o7
	.word	0xd448a03a	! t0_kref+0x904:   	ldsb	[%g2 + 0x3a], %o2
	.word	0xd2000019	! t0_kref+0x908:   	ld	[%g0 + %i1], %o1
	.word	0x89a08944	! t0_kref+0x90c:   	fmuld	%f2, %f4, %f4
	.word	0x8095ae4c	! t0_kref+0x910:   	orcc	%l6, 0xe4c, %g0
	.word	0x92f5e337	! t0_kref+0x914:   	udivcc	%l7, 0x337, %o1
	.word	0x9addf2fe	! t0_kref+0x918:   	smulcc	%l7, -0xd02, %o5
	.word	0xea7f0019	! t0_kref+0x91c:   	swap	[%i4 + %i1], %l5
	.word	0x9ea5f47a	! t0_kref+0x920:   	subcc	%l7, -0xb86, %o7
	.word	0x86102004	! t0_kref+0x924:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x928:   	bne,a	_kref+0x928
	.word	0x86a0e001	! t0_kref+0x92c:   	subcc	%g3, 1, %g3
	.word	0x9a45c016	! t0_kref+0x930:   	addc	%l7, %l6, %o5
	.word	0x91aac042	! t0_kref+0x934:   	fmovdge	%fcc0, %f2, %f8
	.word	0x94bda143	! t0_kref+0x938:   	xnorcc	%l6, 0x143, %o2
	.word	0xec200018	! t0_kref+0x93c:   	st	%l6, [%g0 + %i0]
	.word	0x81a84a25	! t0_kref+0x940:   	fcmps	%fcc0, %f1, %f5
	.word	0xc99e101d	! t0_kref+0x944:   	ldda	[%i0 + %i5]0x80, %f4
	.word	0x9e0dbc86	! t0_kref+0x948:   	and	%l6, -0x37a, %o7
	.word	0x1f0bc301	! t0_kref+0x94c:   	sethi	%hi(0x2f0c0400), %o7
	.word	0xcb270019	! t0_kref+0x950:   	st	%f5, [%i4 + %i1]
	.word	0x9e95fcff	! t0_kref+0x954:   	orcc	%l7, -0x301, %o7
	.word	0x81a98a23	! t0_kref+0x958:   	fcmps	%fcc0, %f6, %f3
	.word	0xeea65000	! t0_kref+0x95c:   	sta	%l7, [%i1]0x80
	call	SYM(t0_subr2)
	.word	0x963de792	! t0_kref+0x964:   	xnor	%l7, 0x792, %o3
	.word	0xec20a024	! t0_kref+0x968:   	st	%l6, [%g2 + 0x24]
	.word	0x80a5a2c2	! t0_kref+0x96c:   	cmp	%l6, 0x2c2
	.word	0x8da000a2	! t0_kref+0x970:   	fnegs	%f2, %f6
	.word	0x9e058016	! t0_kref+0x974:   	add	%l6, %l6, %o7
	.word	0xec3e401d	! t0_kref+0x978:   	std	%l6, [%i1 + %i5]
	.word	0xfbee501a	! t0_kref+0x97c:   	prefetcha	%i1 + %i2, 29
	.word	0x9a0d8016	! t0_kref+0x980:   	and	%l6, %l6, %o5
	.word	0x85a18948	! t0_kref+0x984:   	fmuld	%f6, %f8, %f2
	.word	0xeb68a045	! t0_kref+0x988:   	prefetch	%g2 + 0x45, 21
	.word	0xebf65017	! t0_kref+0x98c:   	casxa	[%i1]0x80, %l7, %l5
	.word	0x810dc016	! t0_kref+0x990:   	tsubcc	%l7, %l6, %g0
	.word	0x89a01027	! t0_kref+0x994:   	fstox	%f7, %f4
	.word	0x83c06884	! t0_kref+0x998:   	jmpl	%g1 + 0x884, %g1
	.word	0xd43e6000	! t0_kref+0x99c:   	std	%o2, [%i1]
	.word	0x90a5c016	! t0_kref+0x9a0:   	subcc	%l7, %l6, %o0
	.word	0xc368a009	! t0_kref+0x9a4:   	prefetch	%g2 + 9, 1
	.word	0x9addee02	! t0_kref+0x9a8:   	smulcc	%l7, 0xe02, %o5
	.word	0x93a01a20	! t0_kref+0x9ac:   	fstoi	%f0, %f9
	.word	0xc56e2000	! t0_kref+0x9b0:   	prefetch	%i0, 2
	.word	0x91a01900	! t0_kref+0x9b4:   	fitod	%f0, %f8
	.word	0x86102002	! t0_kref+0x9b8:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x9bc:   	bne,a	_kref+0x9bc
	.word	0x86a0e001	! t0_kref+0x9c0:   	subcc	%g3, 1, %g3
	.word	0x94458016	! t0_kref+0x9c4:   	addc	%l6, %l6, %o2
	.word	0x98458016	! t0_kref+0x9c8:   	addc	%l6, %l6, %o4
	.word	0x91a00040	! t0_kref+0x9cc:   	fmovd	%f0, %f8
	.word	0x91a01908	! t0_kref+0x9d0:   	fitod	%f8, %f8
	.word	0xd668a037	! t0_kref+0x9d4:   	ldstub	[%g2 + 0x37], %o3
	.word	0xc99e1a5c	! t0_kref+0x9d8:   	ldda	[%i0 + %i4]0xd2, %f4
	.word	0x89a00026	! t0_kref+0x9dc:   	fmovs	%f6, %f4
	.word	0xee26001c	! t0_kref+0x9e0:   	st	%l7, [%i0 + %i4]
	.word	0x81aa0a21	! t0_kref+0x9e4:   	fcmps	%fcc0, %f8, %f1
	.word	0x90458017	! t0_kref+0x9e8:   	addc	%l6, %l7, %o0
	.word	0x81a209c6	! t0_kref+0x9ec:   	fdivd	%f8, %f6, %f0
	.word	0x90758017	! t0_kref+0x9f0:   	udiv	%l6, %l7, %o0
	.word	0xee263ff8	! t0_kref+0x9f4:   	st	%l7, [%i0 - 8]
	.word	0x9095a050	! t0_kref+0x9f8:   	orcc	%l6, 0x50, %o0
	.word	0x8ba01a21	! t0_kref+0x9fc:   	fstoi	%f1, %f5
	.word	0xeb6e2008	! t0_kref+0xa00:   	prefetch	%i0 + 8, 21
	.word	0x9635a9e5	! t0_kref+0xa04:   	orn	%l6, 0x9e5, %o3
	.word	0xde4e8019	! t0_kref+0xa08:   	ldsb	[%i2 + %i1], %o7
	.word	0xef6e401d	! t0_kref+0xa0c:   	prefetch	%i1 + %i5, 23
	.word	0xc5ee5016	! t0_kref+0xa10:   	prefetcha	%i1 + %l6, 2
	.word	0xd250a02e	! t0_kref+0xa14:   	ldsh	[%g2 + 0x2e], %o1
	.word	0x85a108c8	! t0_kref+0xa18:   	fsubd	%f4, %f8, %f2
	.word	0x9e9dac56	! t0_kref+0xa1c:   	xorcc	%l6, 0xc56, %o7
	.word	0xc1be5897	! t0_kref+0xa20:   	stda	%f0, [%i1 + %l7]0xc4
	.word	0x001fffff	! t0_kref+0xa24:   	illtrap	0x1fffff
	.word	0x8135e00b	! t0_kref+0xa28:   	srl	%l7, 0xb, %g0
	.word	0x3b800007	! t0_kref+0xa2c:   	fble,a	_kref+0xa48
	.word	0x8035b507	! t0_kref+0xa30:   	orn	%l6, -0xaf9, %g0
	.word	0xef68a047	! t0_kref+0xa34:   	prefetch	%g2 + 0x47, 23
	.word	0x80d5a544	! t0_kref+0xa38:   	umulcc	%l6, 0x544, %g0
	.word	0xcf00a018	! t0_kref+0xa3c:   	ld	[%g2 + 0x18], %f7
	.word	0xd5f65017	! t0_kref+0xa40:   	casxa	[%i1]0x80, %l7, %o2
	.word	0x92f5c016	! t0_kref+0xa44:   	udivcc	%l7, %l6, %o1
	.word	0x81a14d23	! t0_kref+0xa48:   	fsmuld	%f5, %f3, %f0
	.word	0x8035aa4b	! t0_kref+0xa4c:   	orn	%l6, 0xa4b, %g0
	.word	0x9ee5f895	! t0_kref+0xa50:   	subccc	%l7, -0x76b, %o7
	.word	0x813d8016	! t0_kref+0xa54:   	sra	%l6, %l6, %g0
	.word	0xe968a04e	! t0_kref+0xa58:   	prefetch	%g2 + 0x4e, 20
	.word	0x90a5ed5e	! t0_kref+0xa5c:   	subcc	%l7, 0xd5e, %o0
	.word	0xec3e001d	! t0_kref+0xa60:   	std	%l6, [%i0 + %i5]
	.word	0xc1270019	! t0_kref+0xa64:   	st	%f0, [%i4 + %i1]
	.word	0xcd1fbd40	! t0_kref+0xa68:   	ldd	[%fp - 0x2c0], %f6
	.word	0x81a90aa3	! t0_kref+0xa6c:   	fcmpes	%fcc0, %f4, %f3
	.word	0x9455c017	! t0_kref+0xa70:   	umul	%l7, %l7, %o2
	.word	0x83a01a22	! t0_kref+0xa74:   	fstoi	%f2, %f1
	.word	0xe41e0000	! t0_kref+0xa78:   	ldd	[%i0], %l2
	.word	0x85a018c0	! t0_kref+0xa7c:   	fdtos	%f0, %f2
	.word	0x3f800001	! t0_kref+0xa80:   	fbo,a	_kref+0xa84
	.word	0xea680019	! t0_kref+0xa84:   	ldstub	[%g0 + %i1], %l5
	.word	0x9e558017	! t0_kref+0xa88:   	umul	%l6, %l7, %o7
	.word	0xc0df5018	! t0_kref+0xa8c:   	ldxa	[%i5 + %i0]0x80, %g0
	.word	0x96758017	! t0_kref+0xa90:   	udiv	%l6, %l7, %o3
	.word	0x9465bffe	! t0_kref+0xa94:   	subc	%l6, -0x2, %o2
	.word	0x98458016	! t0_kref+0xa98:   	addc	%l6, %l6, %o4
	call	SYM(t0_subr1)
	.word	0x9abdf1f8	! t0_kref+0xaa0:   	xnorcc	%l7, -0xe08, %o5
	.word	0x9fc10000	! t0_kref+0xaa4:   	call	%g4
	.word	0xd6d81019	! t0_kref+0xaa8:   	ldxa	[%g0 + %i1]0x80, %o3
	.word	0x81a088c2	! t0_kref+0xaac:   	fsubd	%f2, %f2, %f0
	.word	0x89a01900	! t0_kref+0xab0:   	fitod	%f0, %f4
	.word	0x90658017	! t0_kref+0xab4:   	subc	%l6, %l7, %o0
	.word	0x9035c016	! t0_kref+0xab8:   	orn	%l7, %l6, %o0
	.word	0x97258016	! t0_kref+0xabc:   	mulscc	%l6, %l6, %o3
	.word	0x89a018c4	! t0_kref+0xac0:   	fdtos	%f4, %f4
	.word	0x86102018	! t0_kref+0xac4:   	mov	0x18, %g3
	.word	0x86a0e001	! t0_kref+0xac8:   	subcc	%g3, 1, %g3
	.word	0x22800019	! t0_kref+0xacc:   	be,a	_kref+0xb30
	.word	0x9485c016	! t0_kref+0xad0:   	addcc	%l7, %l6, %o2
	.word	0x97258016	! t0_kref+0xad4:   	mulscc	%l6, %l6, %o3
	.word	0xc368a046	! t0_kref+0xad8:   	prefetch	%g2 + 0x46, 1
	.word	0x9abdc016	! t0_kref+0xadc:   	xnorcc	%l7, %l6, %o5
	.word	0xd606001c	! t0_kref+0xae0:   	ld	[%i0 + %i4], %o3
	.word	0x29bffff9	! t0_kref+0xae4:   	fbl,a	_kref+0xac8
	.word	0x94adc017	! t0_kref+0xae8:   	andncc	%l7, %l7, %o2
	.word	0x9af58017	! t0_kref+0xaec:   	udivcc	%l6, %l7, %o5
	.word	0xe07e0000	! t0_kref+0xaf0:   	swap	[%i0], %l0
	call	SYM(t0_subr3)
	.word	0xba103ff8	! t0_kref+0xaf8:   	mov	0xfffffff8, %i5
	.word	0x8da20823	! t0_kref+0xafc:   	fadds	%f8, %f3, %f6
	.word	0xd67e3ff8	! t0_kref+0xb00:   	swap	[%i0 - 8], %o3
	.word	0x8da00026	! t0_kref+0xb04:   	fmovs	%f6, %f6
	.word	0x91a1c9a5	! t0_kref+0xb08:   	fdivs	%f7, %f5, %f8
	.word	0x9095bff9	! t0_kref+0xb0c:   	orcc	%l6, -0x7, %o0
	.word	0x80a5c017	! t0_kref+0xb10:   	cmp	%l7, %l7
	.word	0x8085baed	! t0_kref+0xb14:   	addcc	%l6, -0x513, %g0
	.word	0x9025bd62	! t0_kref+0xb18:   	sub	%l6, -0x29e, %o0
	.word	0x9fc10000	! t0_kref+0xb1c:   	call	%g4
	.word	0x9895c017	! t0_kref+0xb20:   	orcc	%l7, %l7, %o4
	.word	0x85a189a7	! t0_kref+0xb24:   	fdivs	%f6, %f7, %f2
	.word	0xd27e3fec	! t0_kref+0xb28:   	swap	[%i0 - 0x14], %o1
	.word	0x87a01a27	! t0_kref+0xb2c:   	fstoi	%f7, %f3
	.word	0xee36c018	! t0_kref+0xb30:   	sth	%l7, [%i3 + %i0]
	.word	0x9b3da006	! t0_kref+0xb34:   	sra	%l6, 0x6, %o5
	.word	0x90c5b31e	! t0_kref+0xb38:   	addccc	%l6, -0xce2, %o0
	.word	0xd87e001c	! t0_kref+0xb3c:   	swap	[%i0 + %i4], %o4
	.word	0xc5267fe0	! t0_kref+0xb40:   	st	%f2, [%i1 - 0x20]
	.word	0xeb68a08f	! t0_kref+0xb44:   	prefetch	%g2 + 0x8f, 21
	.word	0x11308f4e	! t0_kref+0xb48:   	sethi	%hi(0xc23d3800), %o0
	.word	0x89a01922	! t0_kref+0xb4c:   	fstod	%f2, %f4
	.word	0xe83e7fe0	! t0_kref+0xb50:   	std	%l4, [%i1 - 0x20]
	.word	0xf56e001d	! t0_kref+0xb54:   	prefetch	%i0 + %i5, 26
	.word	0x96d5c016	! t0_kref+0xb58:   	umulcc	%l7, %l6, %o3
	.word	0xeea65000	! t0_kref+0xb5c:   	sta	%l7, [%i1]0x80
	.word	0x96dde62e	! t0_kref+0xb60:   	smulcc	%l7, 0x62e, %o3
	.word	0x81a84aa3	! t0_kref+0xb64:   	fcmpes	%fcc0, %f1, %f3
	.word	0x86102003	! t0_kref+0xb68:   	mov	0x3, %g3
	.word	0x86a0e001	! t0_kref+0xb6c:   	subcc	%g3, 1, %g3
	.word	0x22800014	! t0_kref+0xb70:   	be,a	_kref+0xbc0
	.word	0x9aa5ee93	! t0_kref+0xb74:   	subcc	%l7, 0xe93, %o5
	.word	0x94adc017	! t0_kref+0xb78:   	andncc	%l7, %l7, %o2
	.word	0xeb6e401a	! t0_kref+0xb7c:   	prefetch	%i1 + %i2, 21
	.word	0x81a9ca25	! t0_kref+0xb80:   	fcmps	%fcc0, %f7, %f5
	.word	0x8da00021	! t0_kref+0xb84:   	fmovs	%f1, %f6
	.word	0xed68a044	! t0_kref+0xb88:   	prefetch	%g2 + 0x44, 22
	.word	0x90c5eb08	! t0_kref+0xb8c:   	addccc	%l7, 0xb08, %o0
	.word	0x923db508	! t0_kref+0xb90:   	xnor	%l6, -0xaf8, %o1
	.word	0x83a0c921	! t0_kref+0xb94:   	fmuls	%f3, %f1, %f1
	.word	0xed68a00d	! t0_kref+0xb98:   	prefetch	%g2 + 0xd, 22
	.word	0x85a01a23	! t0_kref+0xb9c:   	fstoi	%f3, %f2
	.word	0xeb68a080	! t0_kref+0xba0:   	prefetch	%g2 + 0x80, 21
	.word	0xc3260000	! t0_kref+0xba4:   	st	%f1, [%i0]
	.word	0x8da008c6	! t0_kref+0xba8:   	fsubd	%f0, %f6, %f6
	.word	0x29800008	! t0_kref+0xbac:   	fbl,a	_kref+0xbcc
	.word	0x94a5c017	! t0_kref+0xbb0:   	subcc	%l7, %l7, %o2
	.word	0x81ddc012	! t0_kref+0xbb4:   	flush	%l7 + %l2
	.word	0xc19e1a5c	! t0_kref+0xbb8:   	ldda	[%i0 + %i4]0xd2, %f0
	.word	0xd87e201c	! t0_kref+0xbbc:   	swap	[%i0 + 0x1c], %o4
	.word	0xcf000019	! t0_kref+0xbc0:   	ld	[%g0 + %i1], %f7
	.word	0xec363fec	! t0_kref+0xbc4:   	sth	%l6, [%i0 - 0x14]
	.word	0xec363ffa	! t0_kref+0xbc8:   	sth	%l6, [%i0 - 6]
	.word	0xec7e601c	! t0_kref+0xbcc:   	swap	[%i1 + 0x1c], %l6
	.word	0x9fc10000	! t0_kref+0xbd0:   	call	%g4
	.word	0x9075f154	! t0_kref+0xbd4:   	udiv	%l7, -0xeac, %o0
	.word	0x85a10848	! t0_kref+0xbd8:   	faddd	%f4, %f8, %f2
	.word	0xe07e200c	! t0_kref+0xbdc:   	swap	[%i0 + 0xc], %l0
	.word	0x9ef5ea4d	! t0_kref+0xbe0:   	udivcc	%l7, 0xa4d, %o7
	.word	0x80a58017	! t0_kref+0xbe4:   	cmp	%l6, %l7
	.word	0xc040a010	! t0_kref+0xbe8:   	ldsw	[%g2 + 0x10], %g0
	.word	0x8ba018c2	! t0_kref+0xbec:   	fdtos	%f2, %f5
	.word	0x89a00029	! t0_kref+0xbf0:   	fmovs	%f9, %f4
	.word	0xc9be1857	! t0_kref+0xbf4:   	stda	%f4, [%i0 + %l7]0xc2
	.word	0xd68e101a	! t0_kref+0xbf8:   	lduba	[%i0 + %i2]0x80, %o3
	.word	0x9a758017	! t0_kref+0xbfc:   	udiv	%l6, %l7, %o5
	.word	0x8035f745	! t0_kref+0xc00:   	orn	%l7, -0x8bb, %g0
	.word	0x98c5c016	! t0_kref+0xc04:   	addccc	%l7, %l6, %o4
	.word	0x90658017	! t0_kref+0xc08:   	subc	%l6, %l7, %o0
	.word	0x90358016	! t0_kref+0xc0c:   	orn	%l6, %l6, %o0
	.word	0xde881019	! t0_kref+0xc10:   	lduba	[%g0 + %i1]0x80, %o7
	.word	0x9a658017	! t0_kref+0xc14:   	subc	%l6, %l7, %o5
	.word	0xee363ffa	! t0_kref+0xc18:   	sth	%l7, [%i0 - 6]
	.word	0xd6167ffa	! t0_kref+0xc1c:   	lduh	[%i1 - 6], %o3
	.word	0xdbf65017	! t0_kref+0xc20:   	casxa	[%i1]0x80, %l7, %o5
	.word	0xc91fbf00	! t0_kref+0xc24:   	ldd	[%fp - 0x100], %f4
	.word	0x92f5c016	! t0_kref+0xc28:   	udivcc	%l7, %l6, %o1
	.word	0x8da0c9a7	! t0_kref+0xc2c:   	fdivs	%f3, %f7, %f6
	.word	0xb6103fea	! t0_kref+0xc30:   	mov	0xffffffea, %i3
	.word	0xcd20a00c	! t0_kref+0xc34:   	st	%f6, [%g2 + 0xc]
	.word	0x8ba00021	! t0_kref+0xc38:   	fmovs	%f1, %f5
	.word	0x90b5c016	! t0_kref+0xc3c:   	orncc	%l7, %l6, %o0
	.word	0xee7e6014	! t0_kref+0xc40:   	swap	[%i1 + 0x14], %l7
	.word	0x87a00027	! t0_kref+0xc44:   	fmovs	%f7, %f3
	.word	0x9505f785	! t0_kref+0xc48:   	taddcc	%l7, -0x87b, %o2
	.word	0x89a189c2	! t0_kref+0xc4c:   	fdivd	%f6, %f2, %f4
	.word	0x9e5db737	! t0_kref+0xc50:   	smul	%l6, -0x8c9, %o7
	.word	0xc9be5856	! t0_kref+0xc54:   	stda	%f4, [%i1 + %l6]0xc2
	.word	0x8da01881	! t0_kref+0xc58:   	fitos	%f1, %f6
	.word	0xc1380019	! t0_kref+0xc5c:   	std	%f0, [%g0 + %i1]
	.word	0x96458016	! t0_kref+0xc60:   	addc	%l6, %l6, %o3
	.word	0xe89e5000	! t0_kref+0xc64:   	ldda	[%i1]0x80, %l4
	.word	0x988df2f3	! t0_kref+0xc68:   	andcc	%l7, -0xd0d, %o4
	.word	0x9495fe85	! t0_kref+0xc6c:   	orcc	%l7, -0x17b, %o2
	.word	0x9645c017	! t0_kref+0xc70:   	addc	%l7, %l7, %o3
	.word	0x89a01a48	! t0_kref+0xc74:   	fdtoi	%f8, %f4
	.word	0x9b058016	! t0_kref+0xc78:   	taddcc	%l6, %l6, %o5
	.word	0xd320a034	! t0_kref+0xc7c:   	st	%f9, [%g2 + 0x34]
	.word	0x86102015	! t0_kref+0xc80:   	mov	0x15, %g3
	.word	0x86a0e001	! t0_kref+0xc84:   	subcc	%g3, 1, %g3
	.word	0x22800004	! t0_kref+0xc88:   	be,a	_kref+0xc98
	.word	0x91a249a1	! t0_kref+0xc8c:   	fdivs	%f9, %f1, %f8
	.word	0x8da089c0	! t0_kref+0xc90:   	fdivd	%f2, %f0, %f6
	.word	0x89a01901	! t0_kref+0xc94:   	fitod	%f1, %f4
	.word	0xd0160000	! t0_kref+0xc98:   	lduh	[%i0], %o0
	.word	0x81a008c0	! t0_kref+0xc9c:   	fsubd	%f0, %f0, %f0
	.word	0x93400000	! t0_kref+0xca0:   	mov	%y, %o1
	.word	0x80f5b347	! t0_kref+0xca4:   	udivcc	%l6, -0xcb9, %g0
	.word	0x81400000	! t0_kref+0xca8:   	mov	%y, %g0
	.word	0xcb20a020	! t0_kref+0xcac:   	st	%f5, [%g2 + 0x20]
	.word	0xe4086348	! t0_kref+0xcb0:   	ldub	[%g1 + 0x348], %l2
	.word	0xa41ca00c	! t0_kref+0xcb4:   	xor	%l2, 0xc, %l2
	.word	0xe4286348	! t0_kref+0xcb8:   	stb	%l2, [%g1 + 0x348]
	.word	0x81d86348	! t0_kref+0xcbc:   	flush	%g1 + 0x348
	.word	0x85a01901	! t0_kref+0xcc0:   	fitod	%f1, %f2
	.word	0x81aa0a22	! t0_kref+0xcc4:   	fcmps	%fcc0, %f8, %f2
	.word	0xe76e401b	! t0_kref+0xcc8:   	prefetch	%i1 + %i3, 19
	.word	0x80558017	! t0_kref+0xccc:   	umul	%l6, %l7, %g0
	.word	0x9fc10000	! t0_kref+0xcd0:   	call	%g4
	.word	0x8da018c0	! t0_kref+0xcd4:   	fdtos	%f0, %f6
	.word	0xc51e0000	! t0_kref+0xcd8:   	ldd	[%i0], %f2
	.word	0x9495a3b1	! t0_kref+0xcdc:   	orcc	%l6, 0x3b1, %o2
2:	.word	0x81a209c4	! t0_kref+0xce0:   	fdivd	%f8, %f4, %f0
	.word	0x83a00024	! t0_kref+0xce4:   	fmovs	%f4, %f1
	.word	0x81a20946	! t0_kref+0xce8:   	fmuld	%f8, %f6, %f0
	.word	0x85a01909	! t0_kref+0xcec:   	fitod	%f9, %f2
	.word	0x9885b26f	! t0_kref+0xcf0:   	addcc	%l6, -0xd91, %o4
	.word	0x8140c000	! t0_kref+0xcf4:   	mov	%asi, %g0
	.word	0xcf270018	! t0_kref+0xcf8:   	st	%f7, [%i4 + %i0]
	.word	0x8fa000a9	! t0_kref+0xcfc:   	fnegs	%f9, %f7
	.word	0xee30a010	! t0_kref+0xd00:   	sth	%l7, [%g2 + 0x10]
	.word	0x81a90aa2	! t0_kref+0xd04:   	fcmpes	%fcc0, %f4, %f2
	.word	0x8fa01a26	! t0_kref+0xd08:   	fstoi	%f6, %f7
	.word	0x92e5e643	! t0_kref+0xd0c:   	subccc	%l7, 0x643, %o1
	.word	0x81a00023	! t0_kref+0xd10:   	fmovs	%f3, %f0
	.word	0x87802082	! t0_kref+0xd14:   	mov	0x82, %asi
	.word	0xe87e4000	! t0_kref+0xd18:   	swap	[%i1], %l4
	.word	0x9e658017	! t0_kref+0xd1c:   	subc	%l6, %l7, %o7
	.word	0x9e0d8016	! t0_kref+0xd20:   	and	%l6, %l6, %o7
	.word	0x8045fe52	! t0_kref+0xd24:   	addc	%l7, -0x1ae, %g0
	.word	0xee300019	! t0_kref+0xd28:   	sth	%l7, [%g0 + %i1]
	.word	0x9a45c016	! t0_kref+0xd2c:   	addc	%l7, %l6, %o5
	.word	0x9e3df034	! t0_kref+0xd30:   	xnor	%l7, -0xfcc, %o7
	.word	0x81a88a22	! t0_kref+0xd34:   	fcmps	%fcc0, %f2, %f2
	.word	0x9095f3bd	! t0_kref+0xd38:   	orcc	%l7, -0xc43, %o0
	.word	0x8fa018c2	! t0_kref+0xd3c:   	fdtos	%f2, %f7
	.word	0xd1267fe4	! t0_kref+0xd40:   	st	%f8, [%i1 - 0x1c]
	.word	0xd47e600c	! t0_kref+0xd44:   	swap	[%i1 + 0xc], %o2
	.word	0xd200a028	! t0_kref+0xd48:   	ld	[%g2 + 0x28], %o1
	.word	0x11298e7a	! t0_kref+0xd4c:   	sethi	%hi(0xa639e800), %o0
	.word	0x89a01a27	! t0_kref+0xd50:   	fstoi	%f7, %f4
	.word	0x89a018c6	! t0_kref+0xd54:   	fdtos	%f6, %f4
	.word	0x9b3d8016	! t0_kref+0xd58:   	sra	%l6, %l6, %o5
	.word	0x8fa00026	! t0_kref+0xd5c:   	fmovs	%f6, %f7
	.word	0x8143e027	! t0_kref+0xd60:   	membar	0x27
	.word	0x8143e040	! t0_kref+0xd64:   	membar	0x40
	.word	0x805de403	! t0_kref+0xd68:   	smul	%l7, 0x403, %g0
	.word	0xd0166004	! t0_kref+0xd6c:   	lduh	[%i1 + 4], %o0
	.word	0x81a88a28	! t0_kref+0xd70:   	fcmps	%fcc0, %f2, %f8
	.word	0x903d8017	! t0_kref+0xd74:   	xnor	%l6, %l7, %o0
	.word	0x81de400c	! t0_kref+0xd78:   	flush	%i1 + %o4
	.word	0xd67e7ff8	! t0_kref+0xd7c:   	swap	[%i1 - 8], %o3
	call	SYM(t0_subr0)
	.word	0xf207bfe0	! t0_kref+0xd84:   	ld	[%fp - 0x20], %i1
	.word	0x91a088c4	! t0_kref+0xd88:   	fsubd	%f2, %f4, %f8
	.word	0xd448a012	! t0_kref+0xd8c:   	ldsb	[%g2 + 0x12], %o2
	.word	0x81a88ac0	! t0_kref+0xd90:   	fcmped	%fcc0, %f2, %f0
	.word	0x9fc10000	! t0_kref+0xd94:   	call	%g4
	.word	0x9535a01e	! t0_kref+0xd98:   	srl	%l6, 0x1e, %o2
	.word	0xec3e6018	! t0_kref+0xd9c:   	std	%l6, [%i1 + 0x18]
	.word	0xd7e65017	! t0_kref+0xda0:   	casa	[%i1]0x80, %l7, %o3
	.word	0x9e3db5f3	! t0_kref+0xda4:   	xnor	%l6, -0xa0d, %o7
	.word	0x2b800002	! t0_kref+0xda8:   	fbug,a	_kref+0xdb0
	.word	0x98558017	! t0_kref+0xdac:   	umul	%l6, %l7, %o4
	.word	0x81a009c6	! t0_kref+0xdb0:   	fdivd	%f0, %f6, %f0
	.word	0x81a000a6	! t0_kref+0xdb4:   	fnegs	%f6, %f0
	.word	0x8da01907	! t0_kref+0xdb8:   	fitod	%f7, %f6
	.word	0x993dc016	! t0_kref+0xdbc:   	sra	%l7, %l6, %o4
	.word	0xc56e3ff0	! t0_kref+0xdc0:   	prefetch	%i0 - 0x10, 2
	.word	0x81858000	! t0_kref+0xdc4:   	wr	%l6, %g0, %y
	.word	0x9fc10000	! t0_kref+0xdc8:   	call	%g4
	.word	0x933de015	! t0_kref+0xdcc:   	sra	%l7, 0x15, %o1
	.word	0xec280018	! t0_kref+0xdd0:   	stb	%l6, [%g0 + %i0]
	.word	0xc07f0019	! t0_kref+0xdd4:   	swap	[%i4 + %i1], %g0
	.word	0x98a58017	! t0_kref+0xdd8:   	subcc	%l6, %l7, %o4
	.word	0x33800006	! t0_kref+0xddc:   	fbe,a	_kref+0xdf4
	.word	0x91aa4023	! t0_kref+0xde0:   	fmovse	%fcc0, %f3, %f8
	.word	0x8065c016	! t0_kref+0xde4:   	subc	%l7, %l6, %g0
	.word	0x8d85e87e	! t0_kref+0xde8:   	wr	%l7, 0x87e, %fprs
	.word	0x940dacf1	! t0_kref+0xdec:   	and	%l6, 0xcf1, %o2
	.word	0xc768a003	! t0_kref+0xdf0:   	prefetch	%g2 + 3, 3
	.word	0x80e5b671	! t0_kref+0xdf4:   	subccc	%l6, -0x98f, %g0
	.word	0x9495a185	! t0_kref+0xdf8:   	orcc	%l6, 0x185, %o2
	.word	0x983dc017	! t0_kref+0xdfc:   	xnor	%l7, %l7, %o4
	.word	0x8da01883	! t0_kref+0xe00:   	fitos	%f3, %f6
	.word	0xdadf5018	! t0_kref+0xe04:   	ldxa	[%i5 + %i0]0x80, %o5
	.word	0x85a108c2	! t0_kref+0xe08:   	fsubd	%f4, %f2, %f2
	.word	0x8da089c6	! t0_kref+0xe0c:   	fdivd	%f2, %f6, %f6
	.word	0x90458016	! t0_kref+0xe10:   	addc	%l6, %l6, %o0
	.word	0x8185c000	! t0_kref+0xe14:   	wr	%l7, %g0, %y
	.word	0xd4b81018	! t0_kref+0xe18:   	stda	%o2, [%g0 + %i0]0x80
	.word	0x85a01925	! t0_kref+0xe1c:   	fstod	%f5, %f2
	.word	0x85a000c8	! t0_kref+0xe20:   	fnegd	%f8, %f2
	.word	0xd11fbd28	! t0_kref+0xe24:   	ldd	[%fp - 0x2d8], %f8
	.word	0x91a01922	! t0_kref+0xe28:   	fstod	%f2, %f8
	.word	0xc51e3ff8	! t0_kref+0xe2c:   	ldd	[%i0 - 8], %f2
	.word	0x9a1da373	! t0_kref+0xe30:   	xor	%l6, 0x373, %o5
	.word	0xd65e6008	! t0_kref+0xe34:   	ldx	[%i1 + 8], %o3
	.word	0xec36001b	! t0_kref+0xe38:   	sth	%l6, [%i0 + %i3]
	.word	0xeee81019	! t0_kref+0xe3c:   	ldstuba	[%g0 + %i1]0x80, %l7
	.word	0x94f5fa2e	! t0_kref+0xe40:   	udivcc	%l7, -0x5d2, %o2
	.word	0x8ba1c9a9	! t0_kref+0xe44:   	fdivs	%f7, %f9, %f5
	.word	0x013493ce	! t0_kref+0xe48:   	sethi	%hi(0xd24f3800), %g0
	.word	0x9e0064b8	! t0_kref+0xe4c:   	add	%g1, 0x4b8, %o7
!	.word	0x234fbc6c	! t0_kref+0xe50:   	fbne,a,pt	%fcc0, SYM(t0_subr1)
	   	fbne,a,pt	%fcc0, SYM(t0_subr1)
	.word	0xec28a03b	! t0_kref+0xe54:   	stb	%l6, [%g2 + 0x3b]
	.word	0xcf270018	! t0_kref+0xe58:   	st	%f7, [%i4 + %i0]
	.word	0xc050a002	! t0_kref+0xe5c:   	ldsh	[%g2 + 2], %g0
	.word	0xef68a00c	! t0_kref+0xe60:   	prefetch	%g2 + 0xc, 23
	.word	0xc99e1a5c	! t0_kref+0xe64:   	ldda	[%i0 + %i4]0xd2, %f4
	.word	0x8143e040	! t0_kref+0xe68:   	membar	0x40
	.word	0xe27e6014	! t0_kref+0xe6c:   	swap	[%i1 + 0x14], %l1
	.word	0xc04e7fe5	! t0_kref+0xe70:   	ldsb	[%i1 - 0x1b], %g0
	.word	0x8125abc7	! t0_kref+0xe74:   	mulscc	%l6, 0xbc7, %g0
	.word	0x8fa00523	! t0_kref+0xe78:   	fsqrts	%f3, %f7
	.word	0xc1beda18	! t0_kref+0xe7c:   	stda	%f0, [%i3 + %i0]0xd0
	.word	0x85a08d21	! t0_kref+0xe80:   	fsmuld	%f2, %f1, %f2
	.word	0x9fc10000	! t0_kref+0xe84:   	call	%g4
	.word	0x9a75edc9	! t0_kref+0xe88:   	udiv	%l7, 0xdc9, %o5
	.word	0x9edda644	! t0_kref+0xe8c:   	smulcc	%l6, 0x644, %o7
	.word	0xd46e4000	! t0_kref+0xe90:   	ldstub	[%i1], %o2
	.word	0xc808001a	! t0_kref+0xe94:   	ldub	[%g0 + %i2], %g4
	.word	0xee263ff0	! t0_kref+0xe98:   	st	%l7, [%i0 - 0x10]
	.word	0x90e5c016	! t0_kref+0xe9c:   	subccc	%l7, %l6, %o0
	.word	0xd306001c	! t0_kref+0xea0:   	ld	[%i0 + %i4], %f9
	.word	0x9065c016	! t0_kref+0xea4:   	subc	%l7, %l6, %o0
	.word	0x89a000c0	! t0_kref+0xea8:   	fnegd	%f0, %f4
	.word	0x8da00026	! t0_kref+0xeac:   	fmovs	%f6, %f6
	sethi	%hi(2f), %o7
	.word	0xe40be2d8	! t0_kref+0xeb4:   	ldub	[%o7 + 0x2d8], %l2
	.word	0xa41ca00c	! t0_kref+0xeb8:   	xor	%l2, 0xc, %l2
	.word	0xe42be2d8	! t0_kref+0xebc:   	stb	%l2, [%o7 + 0x2d8]
	.word	0x81dbe2d8	! t0_kref+0xec0:   	flush	%o7 + 0x2d8
	.word	0xda40a038	! t0_kref+0xec4:   	ldsw	[%g2 + 0x38], %o5
	.word	0x39800007	! t0_kref+0xec8:   	fbuge,a	_kref+0xee4
	.word	0x90758017	! t0_kref+0xecc:   	udiv	%l6, %l7, %o0
	.word	0x8005fb9a	! t0_kref+0xed0:   	add	%l7, -0x466, %g0
	.word	0x31800007	! t0_kref+0xed4:   	fba,a	_kref+0xef0
2:	.word	0x9685fe43	! t0_kref+0xed8:   	addcc	%l7, -0x1bd, %o3
	.word	0x9895ee70	! t0_kref+0xedc:   	orcc	%l7, 0xe70, %o4
	.word	0xc700a03c	! t0_kref+0xee0:   	ld	[%g2 + 0x3c], %f3
	.word	0xda7e401c	! t0_kref+0xee4:   	swap	[%i1 + %i4], %o5
	.word	0x9e75c017	! t0_kref+0xee8:   	udiv	%l7, %l7, %o7
	.word	0x99400000	! t0_kref+0xeec:   	mov	%y, %o4
	.word	0xd43e3fe0	! t0_kref+0xef0:   	std	%o2, [%i0 - 0x20]
	.word	0x9f400000	! t0_kref+0xef4:   	mov	%y, %o7
	.word	0x9445eaaf	! t0_kref+0xef8:   	addc	%l7, 0xaaf, %o2
	.word	0x80f5a337	! t0_kref+0xefc:   	udivcc	%l6, 0x337, %g0
	.word	0x81a10829	! t0_kref+0xf00:   	fadds	%f4, %f9, %f0
	.word	0x87a1c8a9	! t0_kref+0xf04:   	fsubs	%f7, %f9, %f3
	.word	0x809da312	! t0_kref+0xf08:   	xorcc	%l6, 0x312, %g0
	.word	0xd8df5019	! t0_kref+0xf0c:   	ldxa	[%i5 + %i1]0x80, %o4
	.word	0xe36e001b	! t0_kref+0xf10:   	prefetch	%i0 + %i3, 17
	call	1f
	.empty
	.word	0x91a01a28	! t0_kref+0xf18:   	fstoi	%f8, %f8
	.word	0x923d8017	! t0_kref+0xf1c:   	xnor	%l6, %l7, %o1
	.word	0x90d5ebfb	! t0_kref+0xf20:   	umulcc	%l7, 0xbfb, %o0
	.word	0x80758017	! t0_kref+0xf24:   	udiv	%l6, %l7, %g0
	.word	0x94bd8017	! t0_kref+0xf28:   	xnorcc	%l6, %l7, %o2
	.word	0x91a009c4	! t0_kref+0xf2c:   	fdivd	%f0, %f4, %f8
	.word	0xec30a032	! t0_kref+0xf30:   	sth	%l6, [%g2 + 0x32]
	.word	0x949d8016	! t0_kref+0xf34:   	xorcc	%l6, %l6, %o2
1:	.word	0x93a01a42	! t0_kref+0xf38:   	fdtoi	%f2, %f9
	.word	0x93a01a22	! t0_kref+0xf3c:   	fstoi	%f2, %f9
	.word	0xc11e2008	! t0_kref+0xf40:   	ldd	[%i0 + 8], %f0
	.word	0x91a01900	! t0_kref+0xf44:   	fitod	%f0, %f8
	.word	0xefee101c	! t0_kref+0xf48:   	prefetcha	%i0 + %i4, 23
	.word	0x8da01900	! t0_kref+0xf4c:   	fitod	%f0, %f6
	.word	0x8fa109a1	! t0_kref+0xf50:   	fdivs	%f4, %f1, %f7
	.word	0xde40a02c	! t0_kref+0xf54:   	ldsw	[%g2 + 0x2c], %o7
	.word	0x9e35ebd6	! t0_kref+0xf58:   	orn	%l7, 0xbd6, %o7
	.word	0x98d58016	! t0_kref+0xf5c:   	umulcc	%l6, %l6, %o4
	.word	0x98bd8016	! t0_kref+0xf60:   	xnorcc	%l6, %l6, %o4
	.word	0x91a01903	! t0_kref+0xf64:   	fitod	%f3, %f8
	.word	0x89a149a0	! t0_kref+0xf68:   	fdivs	%f5, %f0, %f4
	.word	0x8185c000	! t0_kref+0xf6c:   	wr	%l7, %g0, %y
	.word	0xe1ee501a	! t0_kref+0xf70:   	prefetcha	%i1 + %i2, 16
	.word	0x83a248a8	! t0_kref+0xf74:   	fsubs	%f9, %f8, %f1
	.word	0xec28a033	! t0_kref+0xf78:   	stb	%l6, [%g2 + 0x33]
	.word	0xe40865f8	! t0_kref+0xf7c:   	ldub	[%g1 + 0x5f8], %l2
	.word	0xa41ca00c	! t0_kref+0xf80:   	xor	%l2, 0xc, %l2
	.word	0xe42865f8	! t0_kref+0xf84:   	stb	%l2, [%g1 + 0x5f8]
	.word	0x81d865f8	! t0_kref+0xf88:   	flush	%g1 + 0x5f8
	.word	0x9ec5fe23	! t0_kref+0xf8c:   	addccc	%l7, -0x1dd, %o7
2:	.word	0xa0558016	! t0_kref+0xf90:   	umul	%l6, %l6, %l0
	.word	0x93400000	! t0_kref+0xf94:   	mov	%y, %o1
	.word	0x80a5b488	! t0_kref+0xf98:   	cmp	%l6, -0xb78
	.word	0xea6e3ffe	! t0_kref+0xf9c:   	ldstub	[%i0 - 2], %l5
	.word	0x89a00024	! t0_kref+0xfa0:   	fmovs	%f4, %f4
	.word	0x9a758016	! t0_kref+0xfa4:   	udiv	%l6, %l6, %o5
	.word	0x3b800001	! t0_kref+0xfa8:   	fble,a	_kref+0xfac
	.word	0x85a0cd28	! t0_kref+0xfac:   	fsmuld	%f3, %f8, %f2
	.word	0x8da109c8	! t0_kref+0xfb0:   	fdivd	%f4, %f8, %f6
	.word	0xe7ee101a	! t0_kref+0xfb4:   	prefetcha	%i0 + %i2, 19
	.word	0x98d5ae4f	! t0_kref+0xfb8:   	umulcc	%l6, 0xe4f, %o4
	.word	0x89a01901	! t0_kref+0xfbc:   	fitod	%f1, %f4
	.word	0xde4e2010	! t0_kref+0xfc0:   	ldsb	[%i0 + 0x10], %o7
	.word	0x90ddab24	! t0_kref+0xfc4:   	smulcc	%l6, 0xb24, %o0
	.word	0xd84e8018	! t0_kref+0xfc8:   	ldsb	[%i2 + %i0], %o4
	.word	0x9235f7fc	! t0_kref+0xfcc:   	orn	%l7, -0x804, %o1
	.word	0x34480008	! t0_kref+0xfd0:   	bg,a,pt	%icc, _kref+0xff0
	.word	0x8185c000	! t0_kref+0xfd4:   	wr	%l7, %g0, %y
	.word	0x993da00a	! t0_kref+0xfd8:   	sra	%l6, 0xa, %o4
	.word	0x9465a705	! t0_kref+0xfdc:   	subc	%l6, 0x705, %o2
	.word	0xc9be5a5b	! t0_kref+0xfe0:   	stda	%f4, [%i1 + %i3]0xd2
	.word	0x81dac01c	! t0_kref+0xfe4:   	flush	%o3 + %i4
	.word	0x93258016	! t0_kref+0xfe8:   	mulscc	%l6, %l6, %o1
	.word	0x2e480002	! t0_kref+0xfec:   	bvs,a,pt	%icc, _kref+0xff4
	.word	0xee266000	! t0_kref+0xff0:   	st	%l7, [%i1]
	.word	0x9e1dc017	! t0_kref+0xff4:   	xor	%l7, %l7, %o7
	.word	0xee363ff0	! t0_kref+0xff8:   	sth	%l7, [%i0 - 0x10]
	.word	0x8da01907	! t0_kref+0xffc:   	fitod	%f7, %f6
	.word	0x83a000a5	! t0_kref+0x1000:   	fnegs	%f5, %f1
	.word	0x96758016	! t0_kref+0x1004:   	udiv	%l6, %l6, %o3
	.word	0x9425b3c5	! t0_kref+0x1008:   	sub	%l6, -0xc3b, %o2
	.word	0x878020d0	! t0_kref+0x100c:   	mov	0xd0, %asi
	.word	0x87a000a8	! t0_kref+0x1010:   	fnegs	%f8, %f3
	.word	0x92c5c017	! t0_kref+0x1014:   	addccc	%l7, %l7, %o1
	.word	0xd100a008	! t0_kref+0x1018:   	ld	[%g2 + 8], %f8
	.word	0x170d0ea2	! t0_kref+0x101c:   	sethi	%hi(0x343a8800), %o3
	.word	0xc3264000	! t0_kref+0x1020:   	st	%f1, [%i1]
	.word	0x81a018c6	! t0_kref+0x1024:   	fdtos	%f6, %f0
	.word	0xcf263ff8	! t0_kref+0x1028:   	st	%f7, [%i0 - 8]
	.word	0x8fa01884	! t0_kref+0x102c:   	fitos	%f4, %f7
	.word	0x9425e1bc	! t0_kref+0x1030:   	sub	%l7, 0x1bc, %o2
	.word	0xe40866e4	! t0_kref+0x1034:   	ldub	[%g1 + 0x6e4], %l2
	.word	0xa41ca00c	! t0_kref+0x1038:   	xor	%l2, 0xc, %l2
	.word	0xe42866e4	! t0_kref+0x103c:   	stb	%l2, [%g1 + 0x6e4]
	.word	0x81d866e4	! t0_kref+0x1040:   	flush	%g1 + 0x6e4
	.word	0x96adb01f	! t0_kref+0x1044:   	andncc	%l6, -0xfe1, %o3
	.word	0x913de00e	! t0_kref+0x1048:   	sra	%l7, 0xe, %o0
	.word	0x963dc017	! t0_kref+0x104c:   	xnor	%l7, %l7, %o3
	.word	0xcd20a02c	! t0_kref+0x1050:   	st	%f6, [%g2 + 0x2c]
	.word	0x3d800003	! t0_kref+0x1054:   	fbule,a	_kref+0x1060
	.word	0x9f35e013	! t0_kref+0x1058:   	srl	%l7, 0x13, %o7
	.word	0x93a01887	! t0_kref+0x105c:   	fitos	%f7, %f9
	.word	0x91a00827	! t0_kref+0x1060:   	fadds	%f0, %f7, %f8
	.word	0xc368a086	! t0_kref+0x1064:   	prefetch	%g2 + 0x86, 1
	.word	0x3f800002	! t0_kref+0x1068:   	fbo,a	_kref+0x1070
	.word	0x8da01a42	! t0_kref+0x106c:   	fdtoi	%f2, %f6
	.word	0x809de315	! t0_kref+0x1070:   	xorcc	%l7, 0x315, %g0
	call	SYM(t0_subr2)
	.word	0x903de9f5	! t0_kref+0x1078:   	xnor	%l7, 0x9f5, %o0
2:	.word	0xec366008	! t0_kref+0x107c:   	sth	%l6, [%i1 + 8]
	.word	0xc5380019	! t0_kref+0x1080:   	std	%f2, [%g0 + %i1]
	.word	0x9e65c016	! t0_kref+0x1084:   	subc	%l7, %l6, %o7
	.word	0xd6060000	! t0_kref+0x1088:   	ld	[%i0], %o3
	.word	0x81dbc015	! t0_kref+0x108c:   	flush	%o7 + %l5
	.word	0x92258017	! t0_kref+0x1090:   	sub	%l6, %l7, %o1
	.word	0x23800003	! t0_kref+0x1094:   	fbne,a	_kref+0x10a0
	.word	0x9aa58017	! t0_kref+0x1098:   	subcc	%l6, %l7, %o5
	.word	0xc1a6101c	! t0_kref+0x109c:   	sta	%f0, [%i0 + %i4]0x80
	.word	0xe408672c	! t0_kref+0x10a0:   	ldub	[%g1 + 0x72c], %l2
	.word	0xa41ca00c	! t0_kref+0x10a4:   	xor	%l2, 0xc, %l2
	.word	0xe428672c	! t0_kref+0x10a8:   	stb	%l2, [%g1 + 0x72c]
	.word	0x81d8672c	! t0_kref+0x10ac:   	flush	%g1 + 0x72c
	.word	0xc19f1a58	! t0_kref+0x10b0:   	ldda	[%i4 + %i0]0xd2, %f0
	.word	0xee270019	! t0_kref+0x10b4:   	st	%l7, [%i4 + %i1]
	.word	0xe468a00e	! t0_kref+0x10b8:   	ldstub	[%g2 + 0xe], %l2
	.word	0x96b5c017	! t0_kref+0x10bc:   	orncc	%l7, %l7, %o3
	.word	0x93a018c2	! t0_kref+0x10c0:   	fdtos	%f2, %f9
2:	.word	0x85a08940	! t0_kref+0x10c4:   	fmuld	%f2, %f0, %f2
	.word	0x27800008	! t0_kref+0x10c8:   	fbul,a	_kref+0x10e8
	.word	0xd43e2018	! t0_kref+0x10cc:   	std	%o2, [%i0 + 0x18]
	.word	0x9425c016	! t0_kref+0x10d0:   	sub	%l7, %l6, %o2
	.word	0x9ae5c016	! t0_kref+0x10d4:   	subccc	%l7, %l6, %o5
	.word	0xd13e6018	! t0_kref+0x10d8:   	std	%f8, [%i1 + 0x18]
	.word	0x89a00025	! t0_kref+0x10dc:   	fmovs	%f5, %f4
	.word	0x81a80a29	! t0_kref+0x10e0:   	fcmps	%fcc0, %f0, %f9
	.word	0x81a018c2	! t0_kref+0x10e4:   	fdtos	%f2, %f0
	.word	0x3f800004	! t0_kref+0x10e8:   	fbo,a	_kref+0x10f8
	.word	0x9265edf3	! t0_kref+0x10ec:   	subc	%l7, 0xdf3, %o1
	.word	0x9a9db36f	! t0_kref+0x10f0:   	xorcc	%l6, -0xc91, %o5
	.word	0xeb6e401b	! t0_kref+0x10f4:   	prefetch	%i1 + %i3, 21
	.word	0x80a5c017	! t0_kref+0x10f8:   	cmp	%l7, %l7
	.word	0x81a88a42	! t0_kref+0x10fc:   	fcmpd	%fcc0, %f2, %f2
	.word	0x9a558016	! t0_kref+0x1100:   	umul	%l6, %l6, %o5
	.word	0xc100a010	! t0_kref+0x1104:   	ld	[%g2 + 0x10], %f0
	.word	0x9ec5c016	! t0_kref+0x1108:   	addccc	%l7, %l6, %o7
	.word	0xee2e001a	! t0_kref+0x110c:   	stb	%l7, [%i0 + %i2]
	.word	0x800def91	! t0_kref+0x1110:   	and	%l7, 0xf91, %g0
	.word	0x98ddc016	! t0_kref+0x1114:   	smulcc	%l7, %l6, %o4
	.word	0x89a01884	! t0_kref+0x1118:   	fitos	%f4, %f4
	.word	0x81a94a20	! t0_kref+0x111c:   	fcmps	%fcc0, %f5, %f0
	.word	0xe0ee1000	! t0_kref+0x1120:   	ldstuba	[%i0]0x80, %l0
	.word	0xd1be5a5b	! t0_kref+0x1124:   	stda	%f8, [%i1 + %i3]0xd2
	.word	0x2d800008	! t0_kref+0x1128:   	fbg,a	_kref+0x1148
	.word	0x94adf539	! t0_kref+0x112c:   	andncc	%l7, -0xac7, %o2
	.word	0xee7e7fe4	! t0_kref+0x1130:   	swap	[%i1 - 0x1c], %l7
	.word	0xc1260000	! t0_kref+0x1134:   	st	%f0, [%i0]
	.word	0x9f414000	! t0_kref+0x1138:   	mov	%pc, %o7
	.word	0x913d8016	! t0_kref+0x113c:   	sra	%l6, %l6, %o0
	.word	0x81a209c6	! t0_kref+0x1140:   	fdivd	%f8, %f6, %f0
	.word	0x9ac5ef3c	! t0_kref+0x1144:   	addccc	%l7, 0xf3c, %o5
	call	0x000005ac
	.word	0x9940c000	! t0_kref+0x114c:   	mov	%asi, %o4
	.word	0xd04e8018	! t0_kref+0x1150:   	ldsb	[%i2 + %i0], %o0
	.word	0x9eade4ae	! t0_kref+0x1154:   	andncc	%l7, 0x4ae, %o7
	.word	0x8fa000a7	! t0_kref+0x1158:   	fnegs	%f7, %f7
	.word	0x9035c016	! t0_kref+0x115c:   	orn	%l7, %l6, %o0
	.word	0xc300a028	! t0_kref+0x1160:   	ld	[%g2 + 0x28], %f1
	.word	0xc000a028	! t0_kref+0x1164:   	ld	[%g2 + 0x28], %g0
	.word	0x91a01883	! t0_kref+0x1168:   	fitos	%f3, %f8
	.word	0xda5e6018	! t0_kref+0x116c:   	ldx	[%i1 + 0x18], %o5
	.word	0xee200019	! t0_kref+0x1170:   	st	%l7, [%g0 + %i1]
	call	SYM(t0_subr1)
	.word	0x96458016	! t0_kref+0x1178:   	addc	%l6, %l6, %o3
	.word	0xee36401b	! t0_kref+0x117c:   	sth	%l7, [%i1 + %i3]
	.word	0xec20a018	! t0_kref+0x1180:   	st	%l6, [%g2 + 0x18]
	.word	0xd44e8018	! t0_kref+0x1184:   	ldsb	[%i2 + %i0], %o2
	.word	0x8fa009a9	! t0_kref+0x1188:   	fdivs	%f0, %f9, %f7
	.word	0x91a01905	! t0_kref+0x118c:   	fitod	%f5, %f8
	.word	0xec30a03c	! t0_kref+0x1190:   	sth	%l6, [%g2 + 0x3c]
	.word	0xec263fec	! t0_kref+0x1194:   	st	%l6, [%i0 - 0x14]
	.word	0xec763ff0	! t0_kref+0x1198:   	stx	%l6, [%i0 - 0x10]
	.word	0x9075ad7e	! t0_kref+0x119c:   	udiv	%l6, 0xd7e, %o0
	.word	0xd400a000	! t0_kref+0x11a0:   	ld	[%g2], %o2
	.word	0xe408684c	! t0_kref+0x11a4:   	ldub	[%g1 + 0x84c], %l2
	.word	0xa41ca00c	! t0_kref+0x11a8:   	xor	%l2, 0xc, %l2
	.word	0xe428684c	! t0_kref+0x11ac:   	stb	%l2, [%g1 + 0x84c]
	.word	0x81d8684c	! t0_kref+0x11b0:   	flush	%g1 + 0x84c
	.word	0xc096501b	! t0_kref+0x11b4:   	lduha	[%i1 + %i3]0x80, %g0
	.word	0xd4901018	! t0_kref+0x11b8:   	lduha	[%g0 + %i0]0x80, %o2
	.word	0x9fc00004	! t0_kref+0x11bc:   	call	%g0 + %g4
	.word	0x9ac5c016	! t0_kref+0x11c0:   	addccc	%l7, %l6, %o5
	.word	0x81a88ac0	! t0_kref+0x11c4:   	fcmped	%fcc0, %f2, %f0
	.word	0x923df7e3	! t0_kref+0x11c8:   	xnor	%l7, -0x81d, %o1
	.word	0x9b25c016	! t0_kref+0x11cc:   	mulscc	%l7, %l6, %o5
	.word	0xe3ee101b	! t0_kref+0x11d0:   	prefetcha	%i0 + %i3, 17
	.word	0xe1e61017	! t0_kref+0x11d4:   	casa	[%i0]0x80, %l7, %l0
	.word	0x87a018c8	! t0_kref+0x11d8:   	fdtos	%f8, %f3
	.word	0x9e25c016	! t0_kref+0x11dc:   	sub	%l7, %l6, %o7
	.word	0x81a80a27	! t0_kref+0x11e0:   	fcmps	%fcc0, %f0, %f7
2:	.word	0x85a018c6	! t0_kref+0x11e4:   	fdtos	%f6, %f2
	.word	0x87a00022	! t0_kref+0x11e8:   	fmovs	%f2, %f3
	.word	0x3d800007	! t0_kref+0x11ec:   	fbule,a	_kref+0x1208
	.word	0xd67f0019	! t0_kref+0x11f0:   	swap	[%i4 + %i1], %o3
	.word	0x963dc016	! t0_kref+0x11f4:   	xnor	%l7, %l6, %o3
	.word	0xde16401b	! t0_kref+0x11f8:   	lduh	[%i1 + %i3], %o7
	.word	0xd4be501d	! t0_kref+0x11fc:   	stda	%o2, [%i1 + %i5]0x80
	.word	0x9875ead6	! t0_kref+0x1200:   	udiv	%l7, 0xad6, %o4
	.word	0x81aa0ac8	! t0_kref+0x1204:   	fcmped	%fcc0, %f8, %f8
	.word	0x8da01907	! t0_kref+0x1208:   	fitod	%f7, %f6
	.word	0xcd1e4000	! t0_kref+0x120c:   	ldd	[%i1], %f6
	.word	0x81a80a46	! t0_kref+0x1210:   	fcmpd	%fcc0, %f0, %f6
	.word	0xec7e0000	! t0_kref+0x1214:   	swap	[%i0], %l6
	.word	0xd610a014	! t0_kref+0x1218:   	lduh	[%g2 + 0x14], %o3
	.word	0x81a90a42	! t0_kref+0x121c:   	fcmpd	%fcc0, %f4, %f2
	.word	0x94bd8016	! t0_kref+0x1220:   	xnorcc	%l6, %l6, %o2
	.word	0xcd3e7fe8	! t0_kref+0x1224:   	std	%f6, [%i1 - 0x18]
	.word	0xdad6d059	! t0_kref+0x1228:   	ldsha	[%i3 + %i1]0x82, %o5
	.word	0x89a01106	! t0_kref+0x122c:   	fxtod	%f6, %f4
	.word	0x8095fb29	! t0_kref+0x1230:   	orcc	%l7, -0x4d7, %g0
	.word	0xfdee101b	! t0_kref+0x1234:   	prefetcha	%i0 + %i3, 30
	.word	0xde070018	! t0_kref+0x1238:   	ld	[%i4 + %i0], %o7
	.word	0xec28a002	! t0_kref+0x123c:   	stb	%l6, [%g2 + 2]
	.word	0x910d8017	! t0_kref+0x1240:   	tsubcc	%l6, %l7, %o0
	.word	0x81a8caa2	! t0_kref+0x1244:   	fcmpes	%fcc0, %f3, %f2
	.word	0x83a249a1	! t0_kref+0x1248:   	fdivs	%f9, %f1, %f1
	.word	0x89a01923	! t0_kref+0x124c:   	fstod	%f3, %f4
	.word	0x9fc10000	! t0_kref+0x1250:   	call	%g4
	.word	0x90f5bdd8	! t0_kref+0x1254:   	udivcc	%l6, -0x228, %o0
	.word	0xd8780019	! t0_kref+0x1258:   	swap	[%g0 + %i1], %o4
	.word	0xcd267ff8	! t0_kref+0x125c:   	st	%f6, [%i1 - 8]
	.word	0x81a01a29	! t0_kref+0x1260:   	fstoi	%f9, %f0
	.word	0x985dc016	! t0_kref+0x1264:   	smul	%l7, %l6, %o4
	.word	0xee20a00c	! t0_kref+0x1268:   	st	%l7, [%g2 + 0xc]
	.word	0x9835c016	! t0_kref+0x126c:   	orn	%l7, %l6, %o4
	.word	0xe49f5019	! t0_kref+0x1270:   	ldda	[%i5 + %i1]0x80, %l2
	.word	0x980dc017	! t0_kref+0x1274:   	and	%l7, %l7, %o4
	.word	0xc700a018	! t0_kref+0x1278:   	ld	[%g2 + 0x18], %f3
	.word	0xec20a034	! t0_kref+0x127c:   	st	%l6, [%g2 + 0x34]
	.word	0x81df0014	! t0_kref+0x1280:   	flush	%i4 + %l4
	.word	0x945d8016	! t0_kref+0x1284:   	smul	%l6, %l6, %o2
	.word	0x85a000a9	! t0_kref+0x1288:   	fnegs	%f9, %f2
	.word	0x81a018c4	! t0_kref+0x128c:   	fdtos	%f4, %f0
	sethi	%hi(2f), %o7
	.word	0xe40be2e0	! t0_kref+0x1294:   	ldub	[%o7 + 0x2e0], %l2
	.word	0xa41ca00c	! t0_kref+0x1298:   	xor	%l2, 0xc, %l2
	.word	0xe42be2e0	! t0_kref+0x129c:   	stb	%l2, [%o7 + 0x2e0]
	.word	0x81dbe2e0	! t0_kref+0x12a0:   	flush	%o7 + 0x2e0
	.word	0xc320a01c	! t0_kref+0x12a4:   	st	%f1, [%g2 + 0x1c]
	.word	0x85a188c4	! t0_kref+0x12a8:   	fsubd	%f6, %f4, %f2
	.word	0x1b214bbd	! t0_kref+0x12ac:   	sethi	%hi(0x852ef400), %o5
	.word	0x8125e753	! t0_kref+0x12b0:   	mulscc	%l7, 0x753, %g0
	.word	0xdc396f28	! t0_kref+0x12b4:   	std	%sp, [%g5 + 0xf28]
	.word	0xc9beda59	! t0_kref+0x12b8:   	stda	%f4, [%i3 + %i1]0xd2
	.word	0xec300019	! t0_kref+0x12bc:   	sth	%l6, [%g0 + %i1]
	.word	0xee366012	! t0_kref+0x12c0:   	sth	%l7, [%i1 + 0x12]
	.word	0x909de52c	! t0_kref+0x12c4:   	xorcc	%l7, 0x52c, %o0
	.word	0x94d5afaa	! t0_kref+0x12c8:   	umulcc	%l6, 0xfaa, %o2
	.word	0x8ba01a22	! t0_kref+0x12cc:   	fstoi	%f2, %f5
	.word	0x8ba01a25	! t0_kref+0x12d0:   	fstoi	%f5, %f5
	.word	0x89a00026	! t0_kref+0x12d4:   	fmovs	%f6, %f4
	.word	0x87a018c8	! t0_kref+0x12d8:   	fdtos	%f8, %f3
	.word	0x9e0d8017	! t0_kref+0x12dc:   	and	%l6, %l7, %o7
2:	.word	0x9925e34e	! t0_kref+0x12e0:   	mulscc	%l7, 0x34e, %o4
	.word	0x93a01880	! t0_kref+0x12e4:   	fitos	%f0, %f9
	.word	0x9a75fa15	! t0_kref+0x12e8:   	udiv	%l7, -0x5eb, %o5
	.word	0x85a00944	! t0_kref+0x12ec:   	fmuld	%f0, %f4, %f2
	.word	0xee20a018	! t0_kref+0x12f0:   	st	%l7, [%g2 + 0x18]
	.word	0xd1200018	! t0_kref+0x12f4:   	st	%f8, [%g0 + %i0]
	.word	0xd1be2013	! t0_kref+0x12f8:   	stda	%f8, [%i0 + 0x13]%asi
	.word	0xc1be1816	! t0_kref+0x12fc:   	stda	%f0, [%i0 + %l6]0xc0
	.word	0x878020f0	! t0_kref+0x1300:   	mov	0xf0, %asi
	.word	0x9855e960	! t0_kref+0x1304:   	umul	%l7, 0x960, %o4
	.word	0x81a01108	! t0_kref+0x1308:   	fxtod	%f8, %f0
	.word	0xef6e401b	! t0_kref+0x130c:   	prefetch	%i1 + %i3, 23
	.word	0xc500a024	! t0_kref+0x1310:   	ld	[%g2 + 0x24], %f2
	.word	0x9ec5bdcf	! t0_kref+0x1314:   	addccc	%l6, -0x231, %o7
	.word	0xec28a012	! t0_kref+0x1318:   	stb	%l6, [%g2 + 0x12]
	.word	0x81a1cd21	! t0_kref+0x131c:   	fsmuld	%f7, %f1, %f0
	.word	0xc19e101d	! t0_kref+0x1320:   	ldda	[%i0 + %i5]0x80, %f0
	.word	0x87802082	! t0_kref+0x1324:   	mov	0x82, %asi
	.word	0x83a04820	! t0_kref+0x1328:   	fadds	%f1, %f0, %f1
	.word	0x8da108c4	! t0_kref+0x132c:   	fsubd	%f4, %f4, %f6
	.word	0x8143c000	! t0_kref+0x1330:   	stbar
	.word	0x9eddf873	! t0_kref+0x1334:   	smulcc	%l7, -0x78d, %o7
	.word	0xcd9e101d	! t0_kref+0x1338:   	ldda	[%i0 + %i5]0x80, %f6
	.word	0x92358017	! t0_kref+0x133c:   	orn	%l6, %l7, %o1
	.word	0x9455b866	! t0_kref+0x1340:   	umul	%l6, -0x79a, %o2
	.word	0x8da000a8	! t0_kref+0x1344:   	fnegs	%f8, %f6
	.word	0xc12e7fe8	! t0_kref+0x1348:   	st	%fsr, [%i1 - 0x18]
	.word	0x8da189c4	! t0_kref+0x134c:   	fdivd	%f6, %f4, %f6
	sethi	%hi(2f), %o7
	.word	0xe40be384	! t0_kref+0x1354:   	ldub	[%o7 + 0x384], %l2
	.word	0xa41ca00c	! t0_kref+0x1358:   	xor	%l2, 0xc, %l2
	.word	0xe42be384	! t0_kref+0x135c:   	stb	%l2, [%o7 + 0x384]
	.word	0x81dbe384	! t0_kref+0x1360:   	flush	%o7 + 0x384
	.word	0x9740c000	! t0_kref+0x1364:   	mov	%asi, %o3
	.word	0x8143c000	! t0_kref+0x1368:   	stbar
	.word	0x9305a5a0	! t0_kref+0x136c:   	taddcc	%l6, 0x5a0, %o1
	.word	0x9645b1f7	! t0_kref+0x1370:   	addc	%l6, -0xe09, %o3
	.word	0x89a109c2	! t0_kref+0x1374:   	fdivd	%f4, %f2, %f4
	.word	0x9635f174	! t0_kref+0x1378:   	orn	%l7, -0xe8c, %o3
	.word	0x90bda004	! t0_kref+0x137c:   	xnorcc	%l6, 4, %o0
	.word	0xd40e001a	! t0_kref+0x1380:   	ldub	[%i0 + %i2], %o2
2:	.word	0x87a049a7	! t0_kref+0x1384:   	fdivs	%f1, %f7, %f3
	.word	0x8da018c8	! t0_kref+0x1388:   	fdtos	%f8, %f6
	.word	0x83a189a3	! t0_kref+0x138c:   	fdivs	%f6, %f3, %f1
	.word	0xc3000019	! t0_kref+0x1390:   	ld	[%g0 + %i1], %f1
	.word	0xd2e81019	! t0_kref+0x1394:   	ldstuba	[%g0 + %i1]0x80, %o1
	.word	0x9ebdf539	! t0_kref+0x1398:   	xnorcc	%l7, -0xac7, %o7
	.word	0x91a01909	! t0_kref+0x139c:   	fitod	%f9, %f8
	.word	0xd66e7fe6	! t0_kref+0x13a0:   	ldstub	[%i1 - 0x1a], %o3
	.word	0x81a10d26	! t0_kref+0x13a4:   	fsmuld	%f4, %f6, %f0
	.word	0xee36601e	! t0_kref+0x13a8:   	sth	%l7, [%i1 + 0x1e]
	.word	0x81a00148	! t0_kref+0x13ac:   	fabsd	%f8, %f0
	.word	0x89a08948	! t0_kref+0x13b0:   	fmuld	%f2, %f8, %f4
	.word	0xee30a01c	! t0_kref+0x13b4:   	sth	%l7, [%g2 + 0x1c]
	.word	0xec36c019	! t0_kref+0x13b8:   	sth	%l6, [%i3 + %i1]
	.word	0xed6e401c	! t0_kref+0x13bc:   	prefetch	%i1 + %i4, 22
	.word	0xee20a018	! t0_kref+0x13c0:   	st	%l7, [%g2 + 0x18]
	.word	0xd07f0019	! t0_kref+0x13c4:   	swap	[%i4 + %i1], %o0
	.word	0xe5ee101d	! t0_kref+0x13c8:   	prefetcha	%i0 + %i5, 18
	.word	0x9e45c016	! t0_kref+0x13cc:   	addc	%l7, %l6, %o7
	.word	0xc19e5a5d	! t0_kref+0x13d0:   	ldda	[%i1 + %i5]0xd2, %f0
	.word	0xc91f4018	! t0_kref+0x13d4:   	ldd	[%i5 + %i0], %f4
	.word	0x81dce088	! t0_kref+0x13d8:   	flush	%l3 + 0x88
	.word	0x89a0c9a8	! t0_kref+0x13dc:   	fdivs	%f3, %f8, %f4
	.word	0x8143c000	! t0_kref+0x13e0:   	stbar
	.word	0xff6e401b	! t0_kref+0x13e4:   	prefetch	%i1 + %i3, 31
	.word	0x8ba109a8	! t0_kref+0x13e8:   	fdivs	%f4, %f8, %f5
	.word	0xcd1fbeb8	! t0_kref+0x13ec:   	ldd	[%fp - 0x148], %f6
	.word	0xd04e401a	! t0_kref+0x13f0:   	ldsb	[%i1 + %i2], %o0
	.word	0x93a01a22	! t0_kref+0x13f4:   	fstoi	%f2, %f9
	.word	0x8025a06e	! t0_kref+0x13f8:   	sub	%l6, 0x6e, %g0
	.word	0xedee101d	! t0_kref+0x13fc:   	prefetcha	%i0 + %i5, 22
	.word	0x9ef58017	! t0_kref+0x1400:   	udivcc	%l6, %l7, %o7
	.word	0xec767ff0	! t0_kref+0x1404:   	stx	%l6, [%i1 - 0x10]
	.word	0x91a10948	! t0_kref+0x1408:   	fmuld	%f4, %f8, %f8
	.word	0x80c58016	! t0_kref+0x140c:   	addccc	%l6, %l6, %g0
	.word	0x9695bcce	! t0_kref+0x1410:   	orcc	%l6, -0x332, %o3
	.word	0x8185c000	! t0_kref+0x1414:   	wr	%l7, %g0, %y
	.word	0x94ade7ff	! t0_kref+0x1418:   	andncc	%l7, 0x7ff, %o2
	.word	0xd11e2018	! t0_kref+0x141c:   	ldd	[%i0 + 0x18], %f8
	.word	0x9e75c016	! t0_kref+0x1420:   	udiv	%l7, %l6, %o7
	.word	0x8125ef40	! t0_kref+0x1424:   	mulscc	%l7, 0xf40, %g0
	.word	0x96a58016	! t0_kref+0x1428:   	subcc	%l6, %l6, %o3
	.word	0x83a01889	! t0_kref+0x142c:   	fitos	%f9, %f1
	.word	0x133f26f9	! t0_kref+0x1430:   	sethi	%hi(0xfc9be400), %o1
	.word	0xe3ee501a	! t0_kref+0x1434:   	prefetcha	%i1 + %i2, 17
	.word	0x95358017	! t0_kref+0x1438:   	srl	%l6, %l7, %o2
	.word	0x89a088c8	! t0_kref+0x143c:   	fsubd	%f2, %f8, %f4
	.word	0xd26e401a	! t0_kref+0x1440:   	ldstub	[%i1 + %i2], %o1
	.word	0x2b800003	! t0_kref+0x1444:   	fbug,a	_kref+0x1450
	.word	0xf56e001b	! t0_kref+0x1448:   	prefetch	%i0 + %i3, 26
	.word	0xee2e4000	! t0_kref+0x144c:   	stb	%l7, [%i1]
	.word	0x94c5c016	! t0_kref+0x1450:   	addccc	%l7, %l6, %o2
	.word	0xd11fbc30	! t0_kref+0x1454:   	ldd	[%fp - 0x3d0], %f8
	.word	0xd7f65017	! t0_kref+0x1458:   	casxa	[%i1]0x80, %l7, %o3
	.word	0x81a018c0	! t0_kref+0x145c:   	fdtos	%f0, %f0
	.word	0x948db847	! t0_kref+0x1460:   	andcc	%l6, -0x7b9, %o2
	.word	0x985dc017	! t0_kref+0x1464:   	smul	%l7, %l7, %o4
	.word	0x993d8016	! t0_kref+0x1468:   	sra	%l6, %l6, %o4
	.word	0x9e0d8017	! t0_kref+0x146c:   	and	%l6, %l7, %o7
	.word	0x8da01929	! t0_kref+0x1470:   	fstod	%f9, %f6
	.word	0xd4fe101c	! t0_kref+0x1474:   	swapa	[%i0 + %i4]0x80, %o2
	.word	0x96258016	! t0_kref+0x1478:   	sub	%l6, %l6, %o3
	.word	0xf5ee501d	! t0_kref+0x147c:   	prefetcha	%i1 + %i5, 26
	.word	0x85a10848	! t0_kref+0x1480:   	faddd	%f4, %f8, %f2
	.word	0x9e65a815	! t0_kref+0x1484:   	subc	%l6, 0x815, %o7
	.word	0x8da208c6	! t0_kref+0x1488:   	fsubd	%f8, %f6, %f6
	.word	0x96358017	! t0_kref+0x148c:   	orn	%l6, %l7, %o3
	.word	0x80f5b15f	! t0_kref+0x1490:   	udivcc	%l6, -0xea1, %g0
	.word	0x9f7035ea	! t0_kref+0x1494:   	popc	-0xa16, %o7
	.word	0x9a1da774	! t0_kref+0x1498:   	xor	%l6, 0x774, %o5
	.word	0xc96e2000	! t0_kref+0x149c:   	prefetch	%i0, 4
	.word	0x80f5c017	! t0_kref+0x14a0:   	udivcc	%l7, %l7, %g0
	.word	0xd67e7ff0	! t0_kref+0x14a4:   	swap	[%i1 - 0x10], %o3
	.word	0xcd263ffc	! t0_kref+0x14a8:   	st	%f6, [%i0 - 4]
	.word	0xc1ee5017	! t0_kref+0x14ac:   	prefetcha	%i1 + %l7, 0
	.word	0x80adc016	! t0_kref+0x14b0:   	andncc	%l7, %l6, %g0
	.word	0xec362018	! t0_kref+0x14b4:   	sth	%l6, [%i0 + 0x18]
	.word	0x85a01880	! t0_kref+0x14b8:   	fitos	%f0, %f2
	.word	0xd1be5896	! t0_kref+0x14bc:   	stda	%f8, [%i1 + %l6]0xc4
	.word	0x9a75f2fa	! t0_kref+0x14c0:   	udiv	%l7, -0xd06, %o5
	.word	0xc807bfec	! t0_kref+0x14c4:   	ld	[%fp - 0x14], %g4
	.word	0x8143e040	! t0_kref+0x14c8:   	membar	0x40
	sethi	%hi(2f), %o7
	.word	0xe40be11c	! t0_kref+0x14d0:   	ldub	[%o7 + 0x11c], %l2
	.word	0xa41ca00c	! t0_kref+0x14d4:   	xor	%l2, 0xc, %l2
	.word	0xe42be11c	! t0_kref+0x14d8:   	stb	%l2, [%o7 + 0x11c]
	.word	0x81dbe11c	! t0_kref+0x14dc:   	flush	%o7 + 0x11c
	.word	0x9425e339	! t0_kref+0x14e0:   	sub	%l7, 0x339, %o2
	.word	0xdedf5019	! t0_kref+0x14e4:   	ldxa	[%i5 + %i1]0x80, %o7
	.word	0x8143c000	! t0_kref+0x14e8:   	stbar
	.word	0x93400000	! t0_kref+0x14ec:   	mov	%y, %o1
	.word	0x8143c000	! t0_kref+0x14f0:   	stbar
	.word	0xc3ee1017	! t0_kref+0x14f4:   	prefetcha	%i0 + %l7, 1
	.word	0xd300a034	! t0_kref+0x14f8:   	ld	[%g2 + 0x34], %f9
	.word	0x80b58016	! t0_kref+0x14fc:   	orncc	%l6, %l6, %g0
	.word	0x9e45f086	! t0_kref+0x1500:   	addc	%l7, -0xf7a, %o7
	.word	0x81a01904	! t0_kref+0x1504:   	fitod	%f4, %f0
	.word	0x96658016	! t0_kref+0x1508:   	subc	%l6, %l6, %o3
	.word	0x21800002	! t0_kref+0x150c:   	fbn,a	_kref+0x1514
	.word	0xd8162000	! t0_kref+0x1510:   	lduh	[%i0], %o4
	.word	0xd4480018	! t0_kref+0x1514:   	ldsb	[%g0 + %i0], %o2
	.word	0x9a55a369	! t0_kref+0x1518:   	umul	%l6, 0x369, %o5
2:	.word	0xd47e7ff8	! t0_kref+0x151c:   	swap	[%i1 - 8], %o2
	.word	0x9025c017	! t0_kref+0x1520:   	sub	%l7, %l7, %o0
	.word	0xcfa71019	! t0_kref+0x1524:   	sta	%f7, [%i4 + %i1]0x80
	.word	0x90358016	! t0_kref+0x1528:   	orn	%l6, %l6, %o0
	.word	0x85a01925	! t0_kref+0x152c:   	fstod	%f5, %f2
	.word	0x81deaaae	! t0_kref+0x1530:   	flush	%i2 + 0xaae
	.word	0x83a01886	! t0_kref+0x1534:   	fitos	%f6, %f1
	.word	0xd66e7ff9	! t0_kref+0x1538:   	ldstub	[%i1 - 7], %o3
	.word	0x81df25b8	! t0_kref+0x153c:   	flush	%i4 + 0x5b8
	.word	0x9645b61f	! t0_kref+0x1540:   	addc	%l6, -0x9e1, %o3
	.word	0xd11fbf80	! t0_kref+0x1544:   	ldd	[%fp - 0x80], %f8
	.word	0x94a5c017	! t0_kref+0x1548:   	subcc	%l7, %l7, %o2
	.word	0xcd1fbc40	! t0_kref+0x154c:   	ldd	[%fp - 0x3c0], %f6
	.word	0x8075c017	! t0_kref+0x1550:   	udiv	%l7, %l7, %g0
	.word	0xc120a00c	! t0_kref+0x1554:   	st	%f0, [%g2 + 0xc]
	.word	0xd11fbe80	! t0_kref+0x1558:   	ldd	[%fp - 0x180], %f8
	.word	0x9ec5a02b	! t0_kref+0x155c:   	addccc	%l6, 0x2b, %o7
	.word	0x9a758016	! t0_kref+0x1560:   	udiv	%l6, %l6, %o5
	.word	0x81de8008	! t0_kref+0x1564:   	flush	%i2 + %o0
	.word	0x878020d0	! t0_kref+0x1568:   	mov	0xd0, %asi
	.word	0xde06001c	! t0_kref+0x156c:   	ld	[%i0 + %i4], %o7
	.word	0xcd1fbcb8	! t0_kref+0x1570:   	ldd	[%fp - 0x348], %f6
	.word	0x8085c016	! t0_kref+0x1574:   	addcc	%l7, %l6, %g0
	.word	0xd67e401c	! t0_kref+0x1578:   	swap	[%i1 + %i4], %o3
	.word	0xee366004	! t0_kref+0x157c:   	sth	%l7, [%i1 + 4]
	.word	0xda7e001c	! t0_kref+0x1580:   	swap	[%i0 + %i4], %o5
	.word	0xc7262000	! t0_kref+0x1584:   	st	%f3, [%i0]
	.word	0x81aa4a23	! t0_kref+0x1588:   	fcmps	%fcc0, %f9, %f3
	.word	0x9875c017	! t0_kref+0x158c:   	udiv	%l7, %l7, %o4
	.word	0x9e5d8016	! t0_kref+0x1590:   	smul	%l6, %l6, %o7
	.word	0x98c5c016	! t0_kref+0x1594:   	addccc	%l7, %l6, %o4
	.word	0xe56e001d	! t0_kref+0x1598:   	prefetch	%i0 + %i5, 18
	.word	0xee360000	! t0_kref+0x159c:   	sth	%l7, [%i0]
	.word	0x81a20d27	! t0_kref+0x15a0:   	fsmuld	%f8, %f7, %f0
	.word	0x98658017	! t0_kref+0x15a4:   	subc	%l6, %l7, %o4
	.word	0x94e5c016	! t0_kref+0x15a8:   	subccc	%l7, %l6, %o2
	.word	0x8610201d	! t0_kref+0x15ac:   	mov	0x1d, %g3
	.word	0x86a0e001	! t0_kref+0x15b0:   	subcc	%g3, 1, %g3
	.word	0x2280000e	! t0_kref+0x15b4:   	be,a	_kref+0x15ec
	.word	0xec30a026	! t0_kref+0x15b8:   	sth	%l6, [%g2 + 0x26]
	.word	0xe2780018	! t0_kref+0x15bc:   	swap	[%g0 + %i0], %l1
	.word	0x805d8016	! t0_kref+0x15c0:   	smul	%l6, %l6, %g0
	.word	0x85a000a4	! t0_kref+0x15c4:   	fnegs	%f4, %f2
	.word	0x9a5d8016	! t0_kref+0x15c8:   	smul	%l6, %l6, %o5
	.word	0xc1be5817	! t0_kref+0x15cc:   	stda	%f0, [%i1 + %l7]0xc0
	.word	0x8075e0c2	! t0_kref+0x15d0:   	udiv	%l7, 0xc2, %g0
	.word	0x91a188c2	! t0_kref+0x15d4:   	fsubd	%f6, %f2, %f8
	.word	0xc16e3fe0	! t0_kref+0x15d8:   	prefetch	%i0 - 0x20, 0
	.word	0xd87e7ff8	! t0_kref+0x15dc:   	swap	[%i1 - 8], %o4
	.word	0xd5e65017	! t0_kref+0x15e0:   	casa	[%i1]0x80, %l7, %o2
	.word	0x81aa4a20	! t0_kref+0x15e4:   	fcmps	%fcc0, %f9, %f0
	.word	0xee36c018	! t0_kref+0x15e8:   	sth	%l7, [%i3 + %i0]
	.word	0xc13f4019	! t0_kref+0x15ec:   	std	%f0, [%i5 + %i1]
	.word	0xd46e4000	! t0_kref+0x15f0:   	ldstub	[%i1], %o2
	.word	0x9aa5c016	! t0_kref+0x15f4:   	subcc	%l7, %l6, %o5
	.word	0x91358016	! t0_kref+0x15f8:   	srl	%l6, %l6, %o0
	.word	0x9715c016	! t0_kref+0x15fc:   	taddcctv	%l7, %l6, %o3
	.word	0xc096d019	! t0_kref+0x1600:   	lduha	[%i3 + %i1]0x80, %g0
	.word	0x9255c016	! t0_kref+0x1604:   	umul	%l7, %l6, %o1
	.word	0x91a01a29	! t0_kref+0x1608:   	fstoi	%f9, %f8
	.word	0x89a000a7	! t0_kref+0x160c:   	fnegs	%f7, %f4
	.word	0x92358017	! t0_kref+0x1610:   	orn	%l6, %l7, %o1
	.word	0x98d5b1b9	! t0_kref+0x1614:   	umulcc	%l6, -0xe47, %o4
	.word	0xcba6501c	! t0_kref+0x1618:   	sta	%f5, [%i1 + %i4]0x80
	.word	0xd03f4018	! t0_kref+0x161c:   	std	%o0, [%i5 + %i0]
	.word	0x8d85e169	! t0_kref+0x1620:   	wr	%l7, 0x169, %fprs
	.word	0x9875f6ca	! t0_kref+0x1624:   	udiv	%l7, -0x936, %o4
	.word	0x90ad8016	! t0_kref+0x1628:   	andncc	%l6, %l6, %o0
	.word	0x96d58016	! t0_kref+0x162c:   	umulcc	%l6, %l6, %o3
	.word	0x8fa01a42	! t0_kref+0x1630:   	fdtoi	%f2, %f7
	.word	0xecae9018	! t0_kref+0x1634:   	stba	%l6, [%i2 + %i0]0x80
	.word	0x87a00025	! t0_kref+0x1638:   	fmovs	%f5, %f3
	.word	0x94bdc017	! t0_kref+0x163c:   	xnorcc	%l7, %l7, %o2
	.word	0x2d800002	! t0_kref+0x1640:   	fbg,a	_kref+0x1648
	.word	0xc51fbf80	! t0_kref+0x1644:   	ldd	[%fp - 0x80], %f2
	.word	0x85a018c8	! t0_kref+0x1648:   	fdtos	%f8, %f2
	.word	0x8da01022	! t0_kref+0x164c:   	fstox	%f2, %f6
	.word	0x9e8d8016	! t0_kref+0x1650:   	andcc	%l6, %l6, %o7
	.word	0x9495ee87	! t0_kref+0x1654:   	orcc	%l7, 0xe87, %o2
	.word	0xcd1fbfb8	! t0_kref+0x1658:   	ldd	[%fp - 0x48], %f6
	.word	0x8da01a26	! t0_kref+0x165c:   	fstoi	%f6, %f6
	.word	0x80758017	! t0_kref+0x1660:   	udiv	%l6, %l7, %g0
	.word	0x8da01a29	! t0_kref+0x1664:   	fstoi	%f9, %f6
	.word	0x9405c016	! t0_kref+0x1668:   	add	%l7, %l6, %o2
	call	SYM(t0_subr1)
	.word	0x8d85e93a	! t0_kref+0x1670:   	wr	%l7, 0x93a, %fprs
	.word	0x89a188c8	! t0_kref+0x1674:   	fsubd	%f6, %f8, %f4
	.word	0xe5ee101a	! t0_kref+0x1678:   	prefetcha	%i0 + %i2, 18
	.word	0xe7ee101a	! t0_kref+0x167c:   	prefetcha	%i0 + %i2, 19
	.word	0x91a008c4	! t0_kref+0x1680:   	fsubd	%f0, %f4, %f8
	.word	0x81d9401c	! t0_kref+0x1684:   	flush	%g5 + %i4
	.word	0x92d5c017	! t0_kref+0x1688:   	umulcc	%l7, %l7, %o1
	.word	0x81a8caa6	! t0_kref+0x168c:   	fcmpes	%fcc0, %f3, %f6
	.word	0x9e558017	! t0_kref+0x1690:   	umul	%l6, %l7, %o7
	.word	0x8da01925	! t0_kref+0x1694:   	fstod	%f5, %f6
	.word	0x90d5f2ec	! t0_kref+0x1698:   	umulcc	%l7, -0xd14, %o0
	.word	0x905de72d	! t0_kref+0x169c:   	smul	%l7, 0x72d, %o0
	.word	0xd448a001	! t0_kref+0x16a0:   	ldsb	[%g2 + 1], %o2
	.word	0xd86e8018	! t0_kref+0x16a4:   	ldstub	[%i2 + %i0], %o4
	.word	0x83c06d20	! t0_kref+0x16a8:   	jmpl	%g1 + 0xd20, %g1
	.word	0xc19e5a5c	! t0_kref+0x16ac:   	ldda	[%i1 + %i4]0xd2, %f0
	.word	0xc368a080	! t0_kref+0x16b0:   	prefetch	%g2 + 0x80, 1
	.word	0xc11fbd40	! t0_kref+0x16b4:   	ldd	[%fp - 0x2c0], %f0
	.word	0x9ad5e31c	! t0_kref+0x16b8:   	umulcc	%l7, 0x31c, %o5
	.word	0x81a8ca23	! t0_kref+0x16bc:   	fcmps	%fcc0, %f3, %f3
	.word	0x98f5f2e2	! t0_kref+0x16c0:   	udivcc	%l7, -0xd1e, %o4
	.word	0x933d8017	! t0_kref+0x16c4:   	sra	%l6, %l7, %o1
	.word	0xc51fbd78	! t0_kref+0x16c8:   	ldd	[%fp - 0x288], %f2
	.word	0xc010a008	! t0_kref+0x16cc:   	lduh	[%g2 + 8], %g0
	.word	0x878020d2	! t0_kref+0x16d0:   	mov	0xd2, %asi
	.word	0x92d58016	! t0_kref+0x16d4:   	umulcc	%l6, %l6, %o1
	.word	0x9ad5f1cc	! t0_kref+0x16d8:   	umulcc	%l7, -0xe34, %o5
	.word	0x9865edf1	! t0_kref+0x16dc:   	subc	%l7, 0xdf1, %o4
	.word	0x8065efd4	! t0_kref+0x16e0:   	subc	%l7, 0xfd4, %g0
	.word	0xc1200018	! t0_kref+0x16e4:   	st	%f0, [%g0 + %i0]
	.word	0x81df7c78	! t0_kref+0x16e8:   	flush	%i5 - 0x388
	.word	0x9a3de7d0	! t0_kref+0x16ec:   	xnor	%l7, 0x7d0, %o5
	.word	0x9275bb98	! t0_kref+0x16f0:   	udiv	%l6, -0x468, %o1
	.word	0x1f33ec9d	! t0_kref+0x16f4:   	sethi	%hi(0xcfb27400), %o7
	.word	0xd0be5000	! t0_kref+0x16f8:   	stda	%o0, [%i1]0x80
	.word	0x94758017	! t0_kref+0x16fc:   	udiv	%l6, %l7, %o2
	.word	0xc5b81018	! t0_kref+0x1700:   	stda	%f2, [%g0 + %i0]0x80
	.word	0xc1be5897	! t0_kref+0x1704:   	stda	%f0, [%i1 + %l7]0xc4
	.word	0x9a35c016	! t0_kref+0x1708:   	orn	%l7, %l6, %o5
	.word	0x8da089a5	! t0_kref+0x170c:   	fdivs	%f2, %f5, %f6
	.word	0xd0070018	! t0_kref+0x1710:   	ld	[%i4 + %i0], %o0
	.word	0x80958016	! t0_kref+0x1714:   	orcc	%l6, %l6, %g0
	.word	0x89a249a6	! t0_kref+0x1718:   	fdivs	%f9, %f6, %f4
	.word	0x9e758017	! t0_kref+0x171c:   	udiv	%l6, %l7, %o7
	.word	0x9875c016	! t0_kref+0x1720:   	udiv	%l7, %l6, %o4
	.word	0x9e658017	! t0_kref+0x1724:   	subc	%l6, %l7, %o7
	.word	0x27800002	! t0_kref+0x1728:   	fbul,a	_kref+0x1730
	.word	0x8075c016	! t0_kref+0x172c:   	udiv	%l7, %l6, %g0
	.word	0xc91fbd78	! t0_kref+0x1730:   	ldd	[%fp - 0x288], %f4
	.word	0x86102003	! t0_kref+0x1734:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x1738:   	bne,a	_kref+0x1738
	.word	0x86a0e001	! t0_kref+0x173c:   	subcc	%g3, 1, %g3
	.word	0x945dc016	! t0_kref+0x1740:   	smul	%l7, %l6, %o2
	.word	0xd8070018	! t0_kref+0x1744:   	ld	[%i4 + %i0], %o4
	.word	0x9e058017	! t0_kref+0x1748:   	add	%l6, %l7, %o7
	.word	0x81a88a29	! t0_kref+0x174c:   	fcmps	%fcc0, %f2, %f9
	.word	0x9ed5e69b	! t0_kref+0x1750:   	umulcc	%l7, 0x69b, %o7
	.word	0xc11fbcd0	! t0_kref+0x1754:   	ldd	[%fp - 0x330], %f0
	.word	0xec300018	! t0_kref+0x1758:   	sth	%l6, [%g0 + %i0]
	.word	0x001fffff	! t0_kref+0x175c:   	illtrap	0x1fffff
	.word	0x8da01925	! t0_kref+0x1760:   	fstod	%f5, %f6
	.word	0x933dc016	! t0_kref+0x1764:   	sra	%l7, %l6, %o1
	.word	0xd1267ffc	! t0_kref+0x1768:   	st	%f8, [%i1 - 4]
	.word	0x93400000	! t0_kref+0x176c:   	mov	%y, %o1
	.word	0xecae501a	! t0_kref+0x1770:   	stba	%l6, [%i1 + %i2]0x80
	.word	0x9a05c017	! t0_kref+0x1774:   	add	%l7, %l7, %o5
	.word	0xec260000	! t0_kref+0x1778:   	st	%l6, [%i0]
	.word	0xd2080018	! t0_kref+0x177c:   	ldub	[%g0 + %i0], %o1
	.word	0x92fd8017	! t0_kref+0x1780:   	sdivcc	%l6, %l7, %o1
	.word	0x91a108c8	! t0_kref+0x1784:   	fsubd	%f4, %f8, %f8
	.word	0x81a9ca20	! t0_kref+0x1788:   	fcmps	%fcc0, %f7, %f0
	.word	0xc920a004	! t0_kref+0x178c:   	st	%f4, [%g2 + 4]
	.word	0x9e8dffcf	! t0_kref+0x1790:   	andcc	%l7, -0x31, %o7
	.word	0x81aa0a20	! t0_kref+0x1794:   	fcmps	%fcc0, %f8, %f0
	.word	0xfdee101b	! t0_kref+0x1798:   	prefetcha	%i0 + %i3, 30
	.word	0x8143c000	! t0_kref+0x179c:   	stbar
	.word	0x8da01028	! t0_kref+0x17a0:   	fstox	%f8, %f6
	.word	0x80e58016	! t0_kref+0x17a4:   	subccc	%l6, %l6, %g0
	.word	0xc568a009	! t0_kref+0x17a8:   	prefetch	%g2 + 9, 2
	.word	0x9635c016	! t0_kref+0x17ac:   	orn	%l7, %l6, %o3
	.word	0xda08a026	! t0_kref+0x17b0:   	ldub	[%g2 + 0x26], %o5
	.word	0x9655c016	! t0_kref+0x17b4:   	umul	%l7, %l6, %o3
	.word	0x8025c016	! t0_kref+0x17b8:   	sub	%l7, %l6, %g0
	.word	0x9025bdf0	! t0_kref+0x17bc:   	sub	%l6, -0x210, %o0
	.word	0x93a000a2	! t0_kref+0x17c0:   	fnegs	%f2, %f9
	.word	0x9a55b2e9	! t0_kref+0x17c4:   	umul	%l6, -0xd17, %o5
	.word	0x95058017	! t0_kref+0x17c8:   	taddcc	%l6, %l7, %o2
	.word	0x9465c017	! t0_kref+0x17cc:   	subc	%l7, %l7, %o2
	.word	0xd410a01a	! t0_kref+0x17d0:   	lduh	[%g2 + 0x1a], %o2
	.word	0xf16e001d	! t0_kref+0x17d4:   	prefetch	%i0 + %i5, 24
	.word	0xd300a034	! t0_kref+0x17d8:   	ld	[%g2 + 0x34], %f9
	.word	0x9a45ab4f	! t0_kref+0x17dc:   	addc	%l6, 0xb4f, %o5
	.word	0x8ba209a4	! t0_kref+0x17e0:   	fdivs	%f8, %f4, %f5
	.word	0x8da00022	! t0_kref+0x17e4:   	fmovs	%f2, %f6
	.word	0x98dd8016	! t0_kref+0x17e8:   	smulcc	%l6, %l6, %o4
	.word	0x87a189a8	! t0_kref+0x17ec:   	fdivs	%f6, %f8, %f3
	.word	0x31800004	! t0_kref+0x17f0:   	fba,a	_kref+0x1800
	.word	0x89a000a8	! t0_kref+0x17f4:   	fnegs	%f8, %f4
	.word	0x9af5e0e7	! t0_kref+0x17f8:   	udivcc	%l7, 0xe7, %o5
	.word	0x98bdbe4e	! t0_kref+0x17fc:   	xnorcc	%l6, -0x1b2, %o4
	.word	0x86102001	! t0_kref+0x1800:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x1804:   	bne,a	_kref+0x1804
	.word	0x86a0e001	! t0_kref+0x1808:   	subcc	%g3, 1, %g3
	.word	0x91a01a24	! t0_kref+0x180c:   	fstoi	%f4, %f8
	.word	0xec3e3fe8	! t0_kref+0x1810:   	std	%l6, [%i0 - 0x18]
	.word	0x91a01a21	! t0_kref+0x1814:   	fstoi	%f1, %f8
	.word	0x9065c017	! t0_kref+0x1818:   	subc	%l7, %l7, %o0
	.word	0xe66e7fe1	! t0_kref+0x181c:   	ldstub	[%i1 - 0x1f], %l3
	.word	0x9b058016	! t0_kref+0x1820:   	taddcc	%l6, %l6, %o5
	.word	0xd11fbf28	! t0_kref+0x1824:   	ldd	[%fp - 0xd8], %f8
	.word	0x012d47dc	! t0_kref+0x1828:   	sethi	%hi(0xb51f7000), %g0
	.word	0x8da01924	! t0_kref+0x182c:   	fstod	%f4, %f6
	.word	0xec3e2010	! t0_kref+0x1830:   	std	%l6, [%i0 + 0x10]
	.word	0x94b5a30b	! t0_kref+0x1834:   	orncc	%l6, 0x30b, %o2
	.word	0x960dc016	! t0_kref+0x1838:   	and	%l7, %l6, %o3
	.word	0x8fa8c020	! t0_kref+0x183c:   	fmovsul	%fcc0, %f0, %f7
	.word	0x81a01a28	! t0_kref+0x1840:   	fstoi	%f8, %f0
	.word	0xd810a018	! t0_kref+0x1844:   	lduh	[%g2 + 0x18], %o4
	.word	0xec36401b	! t0_kref+0x1848:   	sth	%l6, [%i1 + %i3]
	.word	0x96d5aba1	! t0_kref+0x184c:   	umulcc	%l6, 0xba1, %o3
	.word	0x85a08948	! t0_kref+0x1850:   	fmuld	%f2, %f8, %f2
	.word	0x9b25c016	! t0_kref+0x1854:   	mulscc	%l7, %l6, %o5
	.word	0x9e75c016	! t0_kref+0x1858:   	udiv	%l7, %l6, %o7
	.word	0x81a9caa8	! t0_kref+0x185c:   	fcmpes	%fcc0, %f7, %f8
	.word	0x9a758016	! t0_kref+0x1860:   	udiv	%l6, %l6, %o5
	.word	0x9065aa26	! t0_kref+0x1864:   	subc	%l6, 0xa26, %o0
	call	SYM(t0_subr0)
	.word	0x8fa000a0	! t0_kref+0x186c:   	fnegs	%f0, %f7
	.word	0xc51fbc08	! t0_kref+0x1870:   	ldd	[%fp - 0x3f8], %f2
	sethi	%hi(2f), %o7
	.word	0xe40be0b4	! t0_kref+0x1878:   	ldub	[%o7 + 0xb4], %l2
	.word	0xa41ca00c	! t0_kref+0x187c:   	xor	%l2, 0xc, %l2
	.word	0xe42be0b4	! t0_kref+0x1880:   	stb	%l2, [%o7 + 0xb4]
	.word	0x81dbe0b4	! t0_kref+0x1884:   	flush	%o7 + 0xb4
	.word	0xc1267fe0	! t0_kref+0x1888:   	st	%f0, [%i1 - 0x20]
	.word	0xc53e7fe0	! t0_kref+0x188c:   	std	%f2, [%i1 - 0x20]
	.word	0x9e65a2f7	! t0_kref+0x1890:   	subc	%l6, 0x2f7, %o7
	.word	0x8ba018c6	! t0_kref+0x1894:   	fdtos	%f6, %f5
	.word	0xec3e401d	! t0_kref+0x1898:   	std	%l6, [%i1 + %i5]
	.word	0x8ba049a2	! t0_kref+0x189c:   	fdivs	%f1, %f2, %f5
	.word	0xee30a010	! t0_kref+0x18a0:   	sth	%l7, [%g2 + 0x10]
	.word	0x9e65fb4a	! t0_kref+0x18a4:   	subc	%l7, -0x4b6, %o7
	.word	0x94c58017	! t0_kref+0x18a8:   	addccc	%l6, %l7, %o2
	.word	0x89a01887	! t0_kref+0x18ac:   	fitos	%f7, %f4
	.word	0xc168a049	! t0_kref+0x18b0:   	prefetch	%g2 + 0x49, 0
2:	.word	0xd326001c	! t0_kref+0x18b4:   	st	%f9, [%i0 + %i4]
	.word	0x90158016	! t0_kref+0x18b8:   	or	%l6, %l6, %o0
	.word	0x8ba01a44	! t0_kref+0x18bc:   	fdtoi	%f4, %f5
	.word	0x85a01902	! t0_kref+0x18c0:   	fitod	%f2, %f2
	.word	0x9b3d8017	! t0_kref+0x18c4:   	sra	%l6, %l7, %o5
	.word	0x9895f6a3	! t0_kref+0x18c8:   	orcc	%l7, -0x95d, %o4
	.word	0x81a8ca25	! t0_kref+0x18cc:   	fcmps	%fcc0, %f3, %f5
	.word	0x941de3f9	! t0_kref+0x18d0:   	xor	%l7, 0x3f9, %o2
	.word	0xc0067fe0	! t0_kref+0x18d4:   	ld	[%i1 - 0x20], %g0
	.word	0xdade1000	! t0_kref+0x18d8:   	ldxa	[%i0]0x80, %o5
	.word	0xcd1fbd98	! t0_kref+0x18dc:   	ldd	[%fp - 0x268], %f6
	.word	0xc5a71019	! t0_kref+0x18e0:   	sta	%f2, [%i4 + %i1]0x80
	.word	0x93418000	! t0_kref+0x18e4:   	mov	%fprs, %o1
	.word	0x96adf1e8	! t0_kref+0x18e8:   	andncc	%l7, -0xe18, %o3
	.word	0x8d85fe5a	! t0_kref+0x18ec:   	wr	%l7, 0xfffffe5a, %fprs
	.word	0x23800004	! t0_kref+0x18f0:   	fbne,a	_kref+0x1900
	.word	0x9aa5a5fb	! t0_kref+0x18f4:   	subcc	%l6, 0x5fb, %o5
	.word	0xc9be1816	! t0_kref+0x18f8:   	stda	%f4, [%i0 + %l6]0xc0
	.word	0x8d85e887	! t0_kref+0x18fc:   	wr	%l7, 0x887, %fprs
	.word	0x81dd4001	! t0_kref+0x1900:   	flush	%l5 + %g1
	.word	0xd0df5018	! t0_kref+0x1904:   	ldxa	[%i5 + %i0]0x80, %o0
	.word	0x948db44e	! t0_kref+0x1908:   	andcc	%l6, -0xbb2, %o2
	.word	0x90c5c016	! t0_kref+0x190c:   	addccc	%l7, %l6, %o0
	.word	0xe968a002	! t0_kref+0x1910:   	prefetch	%g2 + 2, 20
	.word	0x8fa209a7	! t0_kref+0x1914:   	fdivs	%f8, %f7, %f7
	.word	0x9ebdecbb	! t0_kref+0x1918:   	xnorcc	%l7, 0xcbb, %o7
	.word	0x805da698	! t0_kref+0x191c:   	smul	%l6, 0x698, %g0
	.word	0x948df8dc	! t0_kref+0x1920:   	andcc	%l7, -0x724, %o2
	.word	0x80c5a453	! t0_kref+0x1924:   	addccc	%l6, 0x453, %g0
	.word	0x94bdc017	! t0_kref+0x1928:   	xnorcc	%l7, %l7, %o2
	.word	0xe40862b4	! t0_kref+0x192c:   	ldub	[%g1 + 0x2b4], %l2
	.word	0xa41ca00c	! t0_kref+0x1930:   	xor	%l2, 0xc, %l2
	.word	0xe42862b4	! t0_kref+0x1934:   	stb	%l2, [%g1 + 0x2b4]
	.word	0x81d862b4	! t0_kref+0x1938:   	flush	%g1 + 0x2b4
	.word	0x8da01927	! t0_kref+0x193c:   	fstod	%f7, %f6
	.word	0x81d94017	! t0_kref+0x1940:   	flush	%g5 + %l7
	.word	0x9b25e4e1	! t0_kref+0x1944:   	mulscc	%l7, 0x4e1, %o5
	.word	0x9665c016	! t0_kref+0x1948:   	subc	%l7, %l6, %o3
	.word	0x9f400000	! t0_kref+0x194c:   	mov	%y, %o7
	.word	0x9abdfec7	! t0_kref+0x1950:   	xnorcc	%l7, -0x139, %o5
	.word	0x96bdf091	! t0_kref+0x1954:   	xnorcc	%l7, -0xf6f, %o3
	.word	0x9ad5c016	! t0_kref+0x1958:   	umulcc	%l7, %l6, %o5
2:	.word	0xa045be92	! t0_kref+0x195c:   	addc	%l6, -0x16e, %l0
	.word	0x98e5ff06	! t0_kref+0x1960:   	subccc	%l7, -0xfa, %o4
	.word	0x81a049a3	! t0_kref+0x1964:   	fdivs	%f1, %f3, %f0
	.word	0x988dee3d	! t0_kref+0x1968:   	andcc	%l7, 0xe3d, %o4
	.word	0x9295b0ce	! t0_kref+0x196c:   	orcc	%l6, -0xf32, %o1
	.word	0x95418000	! t0_kref+0x1970:   	mov	%fprs, %o2
	.word	0x89a00148	! t0_kref+0x1974:   	fabsd	%f8, %f4
	.word	0x8d85f5ef	! t0_kref+0x1978:   	wr	%l7, 0xfffff5ef, %fprs
	.word	0x85a208c2	! t0_kref+0x197c:   	fsubd	%f8, %f2, %f2
	.word	0xe41e4000	! t0_kref+0x1980:   	ldd	[%i1], %l2
	.word	0x93a000a0	! t0_kref+0x1984:   	fnegs	%f0, %f9
	.word	0x81a249a3	! t0_kref+0x1988:   	fdivs	%f9, %f3, %f0
	.word	0x909dab7c	! t0_kref+0x198c:   	xorcc	%l6, 0xb7c, %o0
	.word	0xc900a034	! t0_kref+0x1990:   	ld	[%g2 + 0x34], %f4
	.word	0xee30a022	! t0_kref+0x1994:   	sth	%l7, [%g2 + 0x22]
	.word	0xd43f4019	! t0_kref+0x1998:   	std	%o2, [%i5 + %i1]
	.word	0x85a188c2	! t0_kref+0x199c:   	fsubd	%f6, %f2, %f2
	sethi	%hi(2f), %o7
	.word	0xe40be1dc	! t0_kref+0x19a4:   	ldub	[%o7 + 0x1dc], %l2
	.word	0xa41ca00c	! t0_kref+0x19a8:   	xor	%l2, 0xc, %l2
	.word	0xe42be1dc	! t0_kref+0x19ac:   	stb	%l2, [%o7 + 0x1dc]
	.word	0x81dbe1dc	! t0_kref+0x19b0:   	flush	%o7 + 0x1dc
	.word	0x9ee5c017	! t0_kref+0x19b4:   	subccc	%l7, %l7, %o7
	.word	0x812dc016	! t0_kref+0x19b8:   	sll	%l7, %l6, %g0
	.word	0x25800001	! t0_kref+0x19bc:   	fblg,a	_kref+0x19c0
	.word	0x93a01a28	! t0_kref+0x19c0:   	fstoi	%f8, %f9
	.word	0x8dab0046	! t0_kref+0x19c4:   	fmovduge	%fcc0, %f6, %f6
	.word	0xd0167fee	! t0_kref+0x19c8:   	lduh	[%i1 - 0x12], %o0
	.word	0x91408000	! t0_kref+0x19cc:   	mov	%ccr, %o0
	.word	0xee267ff4	! t0_kref+0x19d0:   	st	%l7, [%i1 - 0xc]
	.word	0x92e5c017	! t0_kref+0x19d4:   	subccc	%l7, %l7, %o1
	.word	0x89a04d25	! t0_kref+0x19d8:   	fsmuld	%f1, %f5, %f4
2:	.word	0x85a00020	! t0_kref+0x19dc:   	fmovs	%f0, %f2
	.word	0x91a018c2	! t0_kref+0x19e0:   	fdtos	%f2, %f8
	.word	0x8da089c6	! t0_kref+0x19e4:   	fdivd	%f2, %f6, %f6
	.word	0xea003134	! t0_kref+0x19e8:   	ld	[%g0 - 0xecc], %l5
	.word	0x9105afec	! t0_kref+0x19ec:   	taddcc	%l6, 0xfec, %o0
	.word	0x25800001	! t0_kref+0x19f0:   	fblg,a	_kref+0x19f4
	.word	0xd320a024	! t0_kref+0x19f4:   	st	%f9, [%g2 + 0x24]
	.word	0xc07e7ff0	! t0_kref+0x19f8:   	swap	[%i1 - 0x10], %g0
	.word	0x80d5c017	! t0_kref+0x19fc:   	umulcc	%l7, %l7, %g0
	.word	0x8ba000a4	! t0_kref+0x1a00:   	fnegs	%f4, %f5
	.word	0xd85e6018	! t0_kref+0x1a04:   	ldx	[%i1 + 0x18], %o4
	.word	0x9635b5f2	! t0_kref+0x1a08:   	orn	%l6, -0xa0e, %o3
	.word	0x85a00842	! t0_kref+0x1a0c:   	faddd	%f0, %f2, %f2
	.word	0x96a5eaed	! t0_kref+0x1a10:   	subcc	%l7, 0xaed, %o3
	.word	0xc7ee1016	! t0_kref+0x1a14:   	prefetcha	%i0 + %l6, 3
	.word	0xc7267fe4	! t0_kref+0x1a18:   	st	%f3, [%i1 - 0x1c]
	call	SYM(t0_subr0)
	.word	0x8ba01a20	! t0_kref+0x1a20:   	fstoi	%f0, %f5
	.word	0xc3200018	! t0_kref+0x1a24:   	st	%f1, [%g0 + %i0]
	.word	0x9aa58017	! t0_kref+0x1a28:   	subcc	%l6, %l7, %o5
	.word	0xc51fbd18	! t0_kref+0x1a2c:   	ldd	[%fp - 0x2e8], %f2
	.word	0xcd3e2018	! t0_kref+0x1a30:   	std	%f6, [%i0 + 0x18]
	sethi	%hi(2f), %o7
	.word	0xe40be260	! t0_kref+0x1a38:   	ldub	[%o7 + 0x260], %l2
	.word	0xa41ca00c	! t0_kref+0x1a3c:   	xor	%l2, 0xc, %l2
	.word	0xe42be260	! t0_kref+0x1a40:   	stb	%l2, [%o7 + 0x260]
	.word	0x81dbe260	! t0_kref+0x1a44:   	flush	%o7 + 0x260
	.word	0x96a5c016	! t0_kref+0x1a48:   	subcc	%l7, %l6, %o3
	.word	0x9e95f56a	! t0_kref+0x1a4c:   	orcc	%l7, -0xa96, %o7
	.word	0xd1066000	! t0_kref+0x1a50:   	ld	[%i1], %f8
	.word	0x9075f07e	! t0_kref+0x1a54:   	udiv	%l7, -0xf82, %o0
	.word	0xc99f5018	! t0_kref+0x1a58:   	ldda	[%i5 + %i0]0x80, %f4
	.word	0x8185c000	! t0_kref+0x1a5c:   	wr	%l7, %g0, %y
2:	.word	0xe41e2000	! t0_kref+0x1a60:   	ldd	[%i0], %l2
	.word	0x809d8017	! t0_kref+0x1a64:   	xorcc	%l6, %l7, %g0
	.word	0x81a20946	! t0_kref+0x1a68:   	fmuld	%f8, %f6, %f0
	.word	0x91a01a23	! t0_kref+0x1a6c:   	fstoi	%f3, %f8
	.word	0xe40863e4	! t0_kref+0x1a70:   	ldub	[%g1 + 0x3e4], %l2
	.word	0xa41ca00c	! t0_kref+0x1a74:   	xor	%l2, 0xc, %l2
	.word	0xe42863e4	! t0_kref+0x1a78:   	stb	%l2, [%g1 + 0x3e4]
	.word	0x81d863e4	! t0_kref+0x1a7c:   	flush	%g1 + 0x3e4
	.word	0xdedf5019	! t0_kref+0x1a80:   	ldxa	[%i5 + %i1]0x80, %o7
	.word	0x98c58017	! t0_kref+0x1a84:   	addccc	%l6, %l7, %o4
	.word	0xda7e6018	! t0_kref+0x1a88:   	swap	[%i1 + 0x18], %o5
2:	.word	0xec264000	! t0_kref+0x1a8c:   	st	%l6, [%i1]
	.word	0xc900a024	! t0_kref+0x1a90:   	ld	[%g2 + 0x24], %f4
	.word	0xee28a034	! t0_kref+0x1a94:   	stb	%l7, [%g2 + 0x34]
	.word	0x94b5ba14	! t0_kref+0x1a98:   	orncc	%l6, -0x5ec, %o2
	.word	0xde96101b	! t0_kref+0x1a9c:   	lduha	[%i0 + %i3]0x80, %o7
	.word	0xee264000	! t0_kref+0x1aa0:   	st	%l7, [%i1]
	.word	0x8095c017	! t0_kref+0x1aa4:   	orcc	%l7, %l7, %g0
	.word	0xec366010	! t0_kref+0x1aa8:   	sth	%l6, [%i1 + 0x10]
	call	SYM(t0_subr2)
	.word	0xcd26401c	! t0_kref+0x1ab0:   	st	%f6, [%i1 + %i4]
	.word	0x8143c000	! t0_kref+0x1ab4:   	stbar
	.word	0xc526401c	! t0_kref+0x1ab8:   	st	%f2, [%i1 + %i4]
	.word	0xd200a02c	! t0_kref+0x1abc:   	ld	[%g2 + 0x2c], %o1
	.word	0x87a01887	! t0_kref+0x1ac0:   	fitos	%f7, %f3
	.word	0x80958017	! t0_kref+0x1ac4:   	orcc	%l6, %l7, %g0
	.word	0x983d8016	! t0_kref+0x1ac8:   	xnor	%l6, %l6, %o4
	.word	0x9645f048	! t0_kref+0x1acc:   	addc	%l7, -0xfb8, %o3
	.word	0x9e35bf46	! t0_kref+0x1ad0:   	orn	%l6, -0xba, %o7
	.word	0xc96e7ff8	! t0_kref+0x1ad4:   	prefetch	%i1 - 8, 4
	.word	0xd4c6501c	! t0_kref+0x1ad8:   	ldswa	[%i1 + %i4]0x80, %o2
	.word	0x8143e040	! t0_kref+0x1adc:   	membar	0x40
	.word	0xc768a081	! t0_kref+0x1ae0:   	prefetch	%g2 + 0x81, 3
	.word	0x94a5c016	! t0_kref+0x1ae4:   	subcc	%l7, %l6, %o2
	.word	0xdad61000	! t0_kref+0x1ae8:   	ldsha	[%i0]0x80, %o5
	.word	0x90d5c017	! t0_kref+0x1aec:   	umulcc	%l7, %l7, %o0
	.word	0xe7ee101b	! t0_kref+0x1af0:   	prefetcha	%i0 + %i3, 19
	.word	0xeca81019	! t0_kref+0x1af4:   	stba	%l6, [%g0 + %i1]0x80
	.word	0xecae9019	! t0_kref+0x1af8:   	stba	%l6, [%i2 + %i1]0x80
	.word	0x11077684	! t0_kref+0x1afc:   	sethi	%hi(0x1dda1000), %o0
	.word	0xda10a008	! t0_kref+0x1b00:   	lduh	[%g2 + 8], %o5
	.word	0x8143c000	! t0_kref+0x1b04:   	stbar
	.word	0xc1ee1016	! t0_kref+0x1b08:   	prefetcha	%i0 + %l6, 0
	.word	0x8610201e	! t0_kref+0x1b0c:   	mov	0x1e, %g3
	.word	0x86a0e001	! t0_kref+0x1b10:   	subcc	%g3, 1, %g3
	.word	0x22800019	! t0_kref+0x1b14:   	be,a	_kref+0x1b78
	.word	0xd27e3ff8	! t0_kref+0x1b18:   	swap	[%i0 - 8], %o1
	.word	0x80adc017	! t0_kref+0x1b1c:   	andncc	%l7, %l7, %g0
	.word	0x8da01885	! t0_kref+0x1b20:   	fitos	%f5, %f6
	.word	0x81a108c0	! t0_kref+0x1b24:   	fsubd	%f4, %f0, %f0
	.word	0xfb6e401b	! t0_kref+0x1b28:   	prefetch	%i1 + %i3, 29
	.word	0x92958017	! t0_kref+0x1b2c:   	orcc	%l6, %l7, %o1
	.word	0x80f5abbf	! t0_kref+0x1b30:   	udivcc	%l6, 0xbbf, %g0
	.word	0x80458017	! t0_kref+0x1b34:   	addc	%l6, %l7, %g0
	.word	0x9fc10000	! t0_kref+0x1b38:   	call	%g4
	.word	0x9025e41d	! t0_kref+0x1b3c:   	sub	%l7, 0x41d, %o0
	.word	0x9535c017	! t0_kref+0x1b40:   	srl	%l7, %l7, %o2
	.word	0x9ea5f314	! t0_kref+0x1b44:   	subcc	%l7, -0xcec, %o7
	.word	0xc0162014	! t0_kref+0x1b48:   	lduh	[%i0 + 0x14], %g0
	call	SYM(t0_subr0)
	.word	0xecf6501d	! t0_kref+0x1b50:   	stxa	%l6, [%i1 + %i5]0x80
	.word	0x83a01881	! t0_kref+0x1b54:   	fitos	%f1, %f1
	.word	0x9a958016	! t0_kref+0x1b58:   	orcc	%l6, %l6, %o5
	.word	0x9e3dc016	! t0_kref+0x1b5c:   	xnor	%l7, %l6, %o7
	.word	0x8143c000	! t0_kref+0x1b60:   	stbar
	.word	0x8da01924	! t0_kref+0x1b64:   	fstod	%f4, %f6
	.word	0x9235e157	! t0_kref+0x1b68:   	orn	%l7, 0x157, %o1
	.word	0x81aa0aa6	! t0_kref+0x1b6c:   	fcmpes	%fcc0, %f8, %f6
	.word	0x85a00925	! t0_kref+0x1b70:   	fmuls	%f0, %f5, %f2
	.word	0x94f5c017	! t0_kref+0x1b74:   	udivcc	%l7, %l7, %o2
	.word	0xee260000	! t0_kref+0x1b78:   	st	%l7, [%i0]
	.word	0xf207bfe0	! t0_kref+0x1b7c:   	ld	[%fp - 0x20], %i1
	.word	0xd11e3ff8	! t0_kref+0x1b80:   	ldd	[%i0 - 8], %f8
	.word	0x81a90aa2	! t0_kref+0x1b84:   	fcmpes	%fcc0, %f4, %f2
	.word	0x9695e128	! t0_kref+0x1b88:   	orcc	%l7, 0x128, %o3
	.word	0xd27e6010	! t0_kref+0x1b8c:   	swap	[%i1 + 0x10], %o1
	.word	0xcd270018	! t0_kref+0x1b90:   	st	%f6, [%i4 + %i0]
	.word	0x9535c017	! t0_kref+0x1b94:   	srl	%l7, %l7, %o2
	.word	0x81a01a25	! t0_kref+0x1b98:   	fstoi	%f5, %f0
	.word	0x83a049a3	! t0_kref+0x1b9c:   	fdivs	%f1, %f3, %f1
	.word	0xc9be9a19	! t0_kref+0x1ba0:   	stda	%f4, [%i2 + %i1]0xd0
	.word	0xee360000	! t0_kref+0x1ba4:   	sth	%l7, [%i0]
	sethi	%hi(2f), %o7
	.word	0xe40be3ec	! t0_kref+0x1bac:   	ldub	[%o7 + 0x3ec], %l2
	.word	0xa41ca00c	! t0_kref+0x1bb0:   	xor	%l2, 0xc, %l2
	.word	0xe42be3ec	! t0_kref+0x1bb4:   	stb	%l2, [%o7 + 0x3ec]
	.word	0x81dbe3ec	! t0_kref+0x1bb8:   	flush	%o7 + 0x3ec
	.word	0xd608a013	! t0_kref+0x1bbc:   	ldub	[%g2 + 0x13], %o3
	.word	0x91a109a7	! t0_kref+0x1bc0:   	fdivs	%f4, %f7, %f8
	.word	0x9fc00004	! t0_kref+0x1bc4:   	call	%g0 + %g4
	.word	0xc0c71019	! t0_kref+0x1bc8:   	ldswa	[%i4 + %i1]0x80, %g0
	.word	0x81a98a21	! t0_kref+0x1bcc:   	fcmps	%fcc0, %f6, %f1
	.word	0x9935c017	! t0_kref+0x1bd0:   	srl	%l7, %l7, %o4
	.word	0xd11e2008	! t0_kref+0x1bd4:   	ldd	[%i0 + 8], %f8
	.word	0xd1f65017	! t0_kref+0x1bd8:   	casxa	[%i1]0x80, %l7, %o0
	.word	0xee20a004	! t0_kref+0x1bdc:   	st	%l7, [%g2 + 4]
	.word	0xec270019	! t0_kref+0x1be0:   	st	%l6, [%i4 + %i1]
	.word	0x9245c016	! t0_kref+0x1be4:   	addc	%l7, %l6, %o1
	.word	0xc11fbf98	! t0_kref+0x1be8:   	ldd	[%fp - 0x68], %f0
2:	.word	0x89a01a27	! t0_kref+0x1bec:   	fstoi	%f7, %f4
	.word	0xec780018	! t0_kref+0x1bf0:   	swap	[%g0 + %i0], %l6
	.word	0x813dc017	! t0_kref+0x1bf4:   	sra	%l7, %l7, %g0
	.word	0x81a01889	! t0_kref+0x1bf8:   	fitos	%f9, %f0
	.word	0x85a009c0	! t0_kref+0x1bfc:   	fdivd	%f0, %f0, %f2
	.word	0xd05e7fe8	! t0_kref+0x1c00:   	ldx	[%i1 - 0x18], %o0
	.word	0x908d8017	! t0_kref+0x1c04:   	andcc	%l6, %l7, %o0
	.word	0x87a01a22	! t0_kref+0x1c08:   	fstoi	%f2, %f3
	.word	0x8143c000	! t0_kref+0x1c0c:   	stbar
	.word	0x8135a007	! t0_kref+0x1c10:   	srl	%l6, 0x7, %g0
	.word	0xd83e6010	! t0_kref+0x1c14:   	std	%o4, [%i1 + 0x10]
	.word	0x94f58016	! t0_kref+0x1c18:   	udivcc	%l6, %l6, %o2
	.word	0x91a90029	! t0_kref+0x1c1c:   	fmovsl	%fcc0, %f9, %f8
	.word	0x903dfa58	! t0_kref+0x1c20:   	xnor	%l7, -0x5a8, %o0
	.word	0x92ddc017	! t0_kref+0x1c24:   	smulcc	%l7, %l7, %o1
	.word	0x969d8016	! t0_kref+0x1c28:   	xorcc	%l6, %l6, %o3
	.word	0x92e58017	! t0_kref+0x1c2c:   	subccc	%l6, %l7, %o1
	.word	0x98f5be39	! t0_kref+0x1c30:   	udivcc	%l6, -0x1c7, %o4
	sethi	%hi(2f), %o7
	.word	0xe40be060	! t0_kref+0x1c38:   	ldub	[%o7 + 0x60], %l2
	.word	0xa41ca00c	! t0_kref+0x1c3c:   	xor	%l2, 0xc, %l2
	.word	0xe42be060	! t0_kref+0x1c40:   	stb	%l2, [%o7 + 0x60]
	.word	0x81dbe060	! t0_kref+0x1c44:   	flush	%o7 + 0x60
	.word	0x113ed46f	! t0_kref+0x1c48:   	sethi	%hi(0xfb51bc00), %o0
	.word	0x920da8d6	! t0_kref+0x1c4c:   	and	%l6, 0x8d6, %o1
	.word	0x94d5a2cb	! t0_kref+0x1c50:   	umulcc	%l6, 0x2cb, %o2
	.word	0x9495c017	! t0_kref+0x1c54:   	orcc	%l7, %l7, %o2
	.word	0x97358016	! t0_kref+0x1c58:   	srl	%l6, %l6, %o3
	.word	0x81a18842	! t0_kref+0x1c5c:   	faddd	%f6, %f2, %f0
2:	.word	0x1b3b37a7	! t0_kref+0x1c60:   	sethi	%hi(0xecde9c00), %o5
	.word	0xfdee101c	! t0_kref+0x1c64:   	prefetcha	%i0 + %i4, 30
	.word	0x98d58016	! t0_kref+0x1c68:   	umulcc	%l6, %l6, %o4
	.word	0x905dbcc5	! t0_kref+0x1c6c:   	smul	%l6, -0x33b, %o0
	.word	0x89a009a5	! t0_kref+0x1c70:   	fdivs	%f0, %f5, %f4
	.word	0x85a088c8	! t0_kref+0x1c74:   	fsubd	%f2, %f8, %f2
	.word	0x93a00025	! t0_kref+0x1c78:   	fmovs	%f5, %f9
	.word	0xc16e3fe0	! t0_kref+0x1c7c:   	prefetch	%i0 - 0x20, 0
	.word	0x83a018c6	! t0_kref+0x1c80:   	fdtos	%f6, %f1
	sethi	%hi(2f), %o7
	.word	0xe40be098	! t0_kref+0x1c88:   	ldub	[%o7 + 0x98], %l2
	.word	0xa41ca00c	! t0_kref+0x1c8c:   	xor	%l2, 0xc, %l2
	.word	0xe42be098	! t0_kref+0x1c90:   	stb	%l2, [%o7 + 0x98]
	.word	0x81dbe098	! t0_kref+0x1c94:   	flush	%o7 + 0x98
2:	.word	0xa0d5adc4	! t0_kref+0x1c98:   	umulcc	%l6, 0xdc4, %l0
	.word	0x83a000a5	! t0_kref+0x1c9c:   	fnegs	%f5, %f1
	.word	0x9af5f58f	! t0_kref+0x1ca0:   	udivcc	%l7, -0xa71, %o5
	.word	0x98358016	! t0_kref+0x1ca4:   	orn	%l6, %l6, %o4
	.word	0x001fffff	! t0_kref+0x1ca8:   	illtrap	0x1fffff
	.word	0x21800006	! t0_kref+0x1cac:   	fbn,a	_kref+0x1cc4
	.word	0xd810a006	! t0_kref+0x1cb0:   	lduh	[%g2 + 6], %o4
	.word	0x9aadc016	! t0_kref+0x1cb4:   	andncc	%l7, %l6, %o5
	.word	0x9125edb6	! t0_kref+0x1cb8:   	mulscc	%l7, 0xdb6, %o0
	.word	0x8fa189a7	! t0_kref+0x1cbc:   	fdivs	%f6, %f7, %f7
	.word	0x9095c016	! t0_kref+0x1cc0:   	orcc	%l7, %l6, %o0
	.word	0xdac6501c	! t0_kref+0x1cc4:   	ldswa	[%i1 + %i4]0x80, %o5
	.word	0xe5ee501a	! t0_kref+0x1cc8:   	prefetcha	%i1 + %i2, 18
	.word	0x86102010	! t0_kref+0x1ccc:   	mov	0x10, %g3
	.word	0x86a0e001	! t0_kref+0x1cd0:   	subcc	%g3, 1, %g3
	.word	0x22800008	! t0_kref+0x1cd4:   	be,a	_kref+0x1cf4
	.word	0xc1be7ffa	! t0_kref+0x1cd8:   	stda	%f0, [%i1 - 6]%asi
!	.word	0x294fb8c9	! t0_kref+0x1cdc:   	fbl,a,pt	%fcc0, SYM(t0_subr1)
	   	fbl,a,pt	%fcc0, SYM(t0_subr1)
	.word	0x9f414000	! t0_kref+0x1ce0:   	mov	%pc, %o7
	.word	0x94d5b283	! t0_kref+0x1ce4:   	umulcc	%l6, -0xd7d, %o2
	.word	0x8ba000a5	! t0_kref+0x1ce8:   	fnegs	%f5, %f5
	.word	0x9065c017	! t0_kref+0x1cec:   	subc	%l7, %l7, %o0
	.word	0x96bd8017	! t0_kref+0x1cf0:   	xnorcc	%l6, %l7, %o3
	.word	0xec28a01c	! t0_kref+0x1cf4:   	stb	%l6, [%g2 + 0x1c]
	.word	0xc7ee1016	! t0_kref+0x1cf8:   	prefetcha	%i0 + %l6, 3
	.word	0x9f35e016	! t0_kref+0x1cfc:   	srl	%l7, 0x16, %o7
	.word	0xec363fe6	! t0_kref+0x1d00:   	sth	%l6, [%i0 - 0x1a]
	.word	0xcd200019	! t0_kref+0x1d04:   	st	%f6, [%g0 + %i1]
	.word	0x21800001	! t0_kref+0x1d08:   	fbn,a	_kref+0x1d0c
	.word	0x81a01929	! t0_kref+0x1d0c:   	fstod	%f9, %f0
	.word	0x93a249a3	! t0_kref+0x1d10:   	fdivs	%f9, %f3, %f9
	.word	0xf9ee501b	! t0_kref+0x1d14:   	prefetcha	%i1 + %i3, 28
	.word	0x90d5e33e	! t0_kref+0x1d18:   	umulcc	%l7, 0x33e, %o0
	.word	0xd100a034	! t0_kref+0x1d1c:   	ld	[%g2 + 0x34], %f8
	.word	0x81358017	! t0_kref+0x1d20:   	srl	%l6, %l7, %g0
	.word	0xc11fbef8	! t0_kref+0x1d24:   	ldd	[%fp - 0x108], %f0
	.word	0xc1be5856	! t0_kref+0x1d28:   	stda	%f0, [%i1 + %l6]0xc2
	.word	0x9645c016	! t0_kref+0x1d2c:   	addc	%l7, %l6, %o3
	.word	0x8ba00021	! t0_kref+0x1d30:   	fmovs	%f1, %f5
	.word	0x86102015	! t0_kref+0x1d34:   	mov	0x15, %g3
	.word	0x86a0e001	! t0_kref+0x1d38:   	subcc	%g3, 1, %g3
	.word	0x22800011	! t0_kref+0x1d3c:   	be,a	_kref+0x1d80
	.word	0x83a000a4	! t0_kref+0x1d40:   	fnegs	%f4, %f1
	.word	0xd840a008	! t0_kref+0x1d44:   	ldsw	[%g2 + 8], %o4
	.word	0x94f58016	! t0_kref+0x1d48:   	udivcc	%l6, %l6, %o2
	.word	0x8d85c017	! t0_kref+0x1d4c:   	wr	%l7, %l7, %fprs
	.word	0x92d5c017	! t0_kref+0x1d50:   	umulcc	%l7, %l7, %o1
	.word	0xee30a032	! t0_kref+0x1d54:   	sth	%l7, [%g2 + 0x32]
	.word	0x8143c000	! t0_kref+0x1d58:   	stbar
	.word	0x8da00024	! t0_kref+0x1d5c:   	fmovs	%f4, %f6
	.word	0x9ee5e667	! t0_kref+0x1d60:   	subccc	%l7, 0x667, %o7
	.word	0x90f58016	! t0_kref+0x1d64:   	udivcc	%l6, %l6, %o0
	.word	0x8da01923	! t0_kref+0x1d68:   	fstod	%f3, %f6
	.word	0xda167ffc	! t0_kref+0x1d6c:   	lduh	[%i1 - 4], %o5
	.word	0x913d8017	! t0_kref+0x1d70:   	sra	%l6, %l7, %o0
	.word	0x87a01a20	! t0_kref+0x1d74:   	fstoi	%f0, %f3
	.word	0xde40a038	! t0_kref+0x1d78:   	ldsw	[%g2 + 0x38], %o7
	.word	0x9925b51f	! t0_kref+0x1d7c:   	mulscc	%l6, -0xae1, %o4
	.word	0x81a008c6	! t0_kref+0x1d80:   	fsubd	%f0, %f6, %f0
	.word	0x98a5e2bc	! t0_kref+0x1d84:   	subcc	%l7, 0x2bc, %o4
	.word	0x91a01888	! t0_kref+0x1d88:   	fitos	%f8, %f8
	.word	0x87a01a27	! t0_kref+0x1d8c:   	fstoi	%f7, %f3
	.word	0x96e5b91c	! t0_kref+0x1d90:   	subccc	%l6, -0x6e4, %o3
	.word	0x9275e286	! t0_kref+0x1d94:   	udiv	%l7, 0x286, %o1
	.word	0x91400000	! t0_kref+0x1d98:   	mov	%y, %o0
	.word	0xd60e4000	! t0_kref+0x1d9c:   	ldub	[%i1], %o3
	.word	0x9495c017	! t0_kref+0x1da0:   	orcc	%l7, %l7, %o2
	.word	0xecae9019	! t0_kref+0x1da4:   	stba	%l6, [%i2 + %i1]0x80
	.word	0xf96e6018	! t0_kref+0x1da8:   	prefetch	%i1 + 0x18, 28
	.word	0x85a188c0	! t0_kref+0x1dac:   	fsubd	%f6, %f0, %f2
	.word	0x8143c000	! t0_kref+0x1db0:   	stbar
	.word	0x98058016	! t0_kref+0x1db4:   	add	%l6, %l6, %o4
	.word	0x809dc017	! t0_kref+0x1db8:   	xorcc	%l7, %l7, %g0
	.word	0xeb6e401a	! t0_kref+0x1dbc:   	prefetch	%i1 + %i2, 21
	.word	0x87a149a8	! t0_kref+0x1dc0:   	fdivs	%f5, %f8, %f3
	.word	0x8da20842	! t0_kref+0x1dc4:   	faddd	%f8, %f2, %f6
	.word	0x91a14d28	! t0_kref+0x1dc8:   	fsmuld	%f5, %f8, %f8
	.word	0x80f58016	! t0_kref+0x1dcc:   	udivcc	%l6, %l6, %g0
	.word	0xd6780018	! t0_kref+0x1dd0:   	swap	[%g0 + %i0], %o3
	.word	0x9fc10000	! t0_kref+0x1dd4:   	call	%g4
	.word	0x8da20842	! t0_kref+0x1dd8:   	faddd	%f8, %f2, %f6
	.word	0xec263ff8	! t0_kref+0x1ddc:   	st	%l6, [%i0 - 8]
	.word	0x99418000	! t0_kref+0x1de0:   	mov	%fprs, %o4
	.word	0xd4070018	! t0_kref+0x1de4:   	ld	[%i4 + %i0], %o2
	.word	0x81d82116	! t0_kref+0x1de8:   	flush	%g0 + 0x116
	.word	0x96bdc016	! t0_kref+0x1dec:   	xnorcc	%l7, %l6, %o3
	.word	0x81a01927	! t0_kref+0x1df0:   	fstod	%f7, %f0
	.word	0xd24e7ffc	! t0_kref+0x1df4:   	ldsb	[%i1 - 4], %o1
	.word	0x8fa000a9	! t0_kref+0x1df8:   	fnegs	%f9, %f7
	.word	0xcf267fe0	! t0_kref+0x1dfc:   	st	%f7, [%i1 - 0x20]
	.word	0xc12e001c	! t0_kref+0x1e00:   	st	%fsr, [%i0 + %i4]
	.word	0x81a208c6	! t0_kref+0x1e04:   	fsubd	%f8, %f6, %f0
	.word	0x3d800005	! t0_kref+0x1e08:   	fbule,a	_kref+0x1e1c
	.word	0x9695c016	! t0_kref+0x1e0c:   	orcc	%l7, %l6, %o3
	.word	0x96a58016	! t0_kref+0x1e10:   	subcc	%l6, %l6, %o3
	.word	0x90dda908	! t0_kref+0x1e14:   	smulcc	%l6, 0x908, %o0
	.word	0xecf01018	! t0_kref+0x1e18:   	stxa	%l6, [%g0 + %i0]0x80
	.word	0xc93f4018	! t0_kref+0x1e1c:   	std	%f4, [%i5 + %i0]
	.word	0xd24e4000	! t0_kref+0x1e20:   	ldsb	[%i1], %o1
	.word	0xebf65016	! t0_kref+0x1e24:   	casxa	[%i1]0x80, %l6, %l5
	.word	0xd0df5018	! t0_kref+0x1e28:   	ldxa	[%i5 + %i0]0x80, %o0
	.word	0x9fc10000	! t0_kref+0x1e2c:   	call	%g4
	.word	0x8ba01880	! t0_kref+0x1e30:   	fitos	%f0, %f5
	.word	0x92a5a9eb	! t0_kref+0x1e34:   	subcc	%l6, 0x9eb, %o1
	.word	0x9e1dc016	! t0_kref+0x1e38:   	xor	%l7, %l6, %o7
	.word	0xc568a043	! t0_kref+0x1e3c:   	prefetch	%g2 + 0x43, 2
	.word	0xc51fbe48	! t0_kref+0x1e40:   	ldd	[%fp - 0x1b8], %f2
	.word	0x960d8016	! t0_kref+0x1e44:   	and	%l6, %l6, %o3
	.word	0x81a089a0	! t0_kref+0x1e48:   	fdivs	%f2, %f0, %f0
	.word	0x909dbf2d	! t0_kref+0x1e4c:   	xorcc	%l6, -0xd3, %o0
	.word	0x89a20848	! t0_kref+0x1e50:   	faddd	%f8, %f8, %f4
	.word	0xc900a01c	! t0_kref+0x1e54:   	ld	[%g2 + 0x1c], %f4
	.word	0x81aa4a27	! t0_kref+0x1e58:   	fcmps	%fcc0, %f9, %f7
	.word	0x8da108c0	! t0_kref+0x1e5c:   	fsubd	%f4, %f0, %f6
	.word	0xd84e8018	! t0_kref+0x1e60:   	ldsb	[%i2 + %i0], %o4
	.word	0x89a10946	! t0_kref+0x1e64:   	fmuld	%f4, %f6, %f4
	.word	0x92f5b204	! t0_kref+0x1e68:   	udivcc	%l6, -0xdfc, %o1
	.word	0x91a00844	! t0_kref+0x1e6c:   	faddd	%f0, %f4, %f8
	.word	0x8da00020	! t0_kref+0x1e70:   	fmovs	%f0, %f6
	.word	0x90258017	! t0_kref+0x1e74:   	sub	%l6, %l7, %o0
	.word	0x81a84a28	! t0_kref+0x1e78:   	fcmps	%fcc0, %f1, %f8
	.word	0xe7f61016	! t0_kref+0x1e7c:   	casxa	[%i0]0x80, %l6, %l3
	.word	0x85a000a0	! t0_kref+0x1e80:   	fnegs	%f0, %f2
	.word	0x813de01c	! t0_kref+0x1e84:   	sra	%l7, 0x1c, %g0
	.word	0x33800003	! t0_kref+0x1e88:   	fbe,a	_kref+0x1e94
	.word	0x96dde27f	! t0_kref+0x1e8c:   	smulcc	%l7, 0x27f, %o3
	.word	0xd8981019	! t0_kref+0x1e90:   	ldda	[%g0 + %i1]0x80, %o4
	.word	0x9eb5efca	! t0_kref+0x1e94:   	orncc	%l7, 0xfca, %o7
	.word	0xf96e3fe8	! t0_kref+0x1e98:   	prefetch	%i0 - 0x18, 28
	.word	0xc568a00f	! t0_kref+0x1e9c:   	prefetch	%g2 + 0xf, 2
	.word	0x9a55c017	! t0_kref+0x1ea0:   	umul	%l7, %l7, %o5
	.word	0x8ba01887	! t0_kref+0x1ea4:   	fitos	%f7, %f5
	.word	0x8da00025	! t0_kref+0x1ea8:   	fmovs	%f5, %f6
	call	1f
	.empty
	.word	0xc53e4000	! t0_kref+0x1eb0:   	std	%f2, [%i1]
	.word	0x9ea58017	! t0_kref+0x1eb4:   	subcc	%l6, %l7, %o7
	.word	0xee36201a	! t0_kref+0x1eb8:   	sth	%l7, [%i0 + 0x1a]
	.word	0x89a01905	! t0_kref+0x1ebc:   	fitod	%f5, %f4
	.word	0x9ebd8016	! t0_kref+0x1ec0:   	xnorcc	%l6, %l6, %o7
	.word	0x98adef4e	! t0_kref+0x1ec4:   	andncc	%l7, 0xf4e, %o4
1:	.word	0x86102004	! t0_kref+0x1ec8:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x1ecc:   	bne,a	_kref+0x1ecc
	.word	0x86a0e001	! t0_kref+0x1ed0:   	subcc	%g3, 1, %g3
	.word	0x93a01880	! t0_kref+0x1ed4:   	fitos	%f0, %f9
	.word	0xe16e401a	! t0_kref+0x1ed8:   	prefetch	%i1 + %i2, 16
	.word	0x8045b97d	! t0_kref+0x1edc:   	addc	%l6, -0x683, %g0
	.word	0x91a088c6	! t0_kref+0x1ee0:   	fsubd	%f2, %f6, %f8
	.word	0x93a000a2	! t0_kref+0x1ee4:   	fnegs	%f2, %f9
	.word	0x91a018c8	! t0_kref+0x1ee8:   	fdtos	%f8, %f8
	.word	0x9af5f633	! t0_kref+0x1eec:   	udivcc	%l7, -0x9cd, %o5
	.word	0xec36600e	! t0_kref+0x1ef0:   	sth	%l6, [%i1 + 0xe]
	.word	0xc19e2010	! t0_kref+0x1ef4:   	ldda	[%i0 + 0x10]%asi, %f0
	.word	0xee270019	! t0_kref+0x1ef8:   	st	%l7, [%i4 + %i1]
	.word	0x98c58016	! t0_kref+0x1efc:   	addccc	%l6, %l6, %o4
	.word	0xc7a01018	! t0_kref+0x1f00:   	sta	%f3, [%g0 + %i0]0x80
	.word	0x8ba00027	! t0_kref+0x1f04:   	fmovs	%f7, %f5
	.word	0x9265bcfb	! t0_kref+0x1f08:   	subc	%l6, -0x305, %o1
	.word	0x81a08842	! t0_kref+0x1f0c:   	faddd	%f2, %f2, %f0
	.word	0x8143c000	! t0_kref+0x1f10:   	stbar
	.word	0x98958017	! t0_kref+0x1f14:   	orcc	%l6, %l7, %o4
	.word	0xd0480018	! t0_kref+0x1f18:   	ldsb	[%g0 + %i0], %o0
	.word	0x945d8016	! t0_kref+0x1f1c:   	smul	%l6, %l6, %o2
	.word	0x25800006	! t0_kref+0x1f20:   	fblg,a	_kref+0x1f38
	.word	0x8da109c0	! t0_kref+0x1f24:   	fdivd	%f4, %f0, %f6
	.word	0xcf200018	! t0_kref+0x1f28:   	st	%f7, [%g0 + %i0]
	.word	0x92058017	! t0_kref+0x1f2c:   	add	%l6, %l7, %o1
	.word	0x93a000a1	! t0_kref+0x1f30:   	fnegs	%f1, %f9
	.word	0xd210a01e	! t0_kref+0x1f34:   	lduh	[%g2 + 0x1e], %o1
	.word	0x91a01907	! t0_kref+0x1f38:   	fitod	%f7, %f8
	.word	0x89a189c4	! t0_kref+0x1f3c:   	fdivd	%f6, %f4, %f4
	.word	0x81a8ca24	! t0_kref+0x1f40:   	fcmps	%fcc0, %f3, %f4
	.word	0xc320a024	! t0_kref+0x1f44:   	st	%f1, [%g2 + 0x24]
	.word	0xc807bfe8	! t0_kref+0x1f48:   	ld	[%fp - 0x18], %g4
	.word	0x87a01886	! t0_kref+0x1f4c:   	fitos	%f6, %f3
	.word	0x131aab63	! t0_kref+0x1f50:   	sethi	%hi(0x6aad8c00), %o1
	.word	0x81a90aa1	! t0_kref+0x1f54:   	fcmpes	%fcc0, %f4, %f1
	.word	0x9ac5b838	! t0_kref+0x1f58:   	addccc	%l6, -0x7c8, %o5
	.word	0xcf260000	! t0_kref+0x1f5c:   	st	%f7, [%i0]
	.word	0x3d800008	! t0_kref+0x1f60:   	fbule,a	_kref+0x1f80
	.word	0x83a01a26	! t0_kref+0x1f64:   	fstoi	%f6, %f1
	.word	0x81a01929	! t0_kref+0x1f68:   	fstod	%f9, %f0
	.word	0x81da400f	! t0_kref+0x1f6c:   	flush	%o1 + %o7
	.word	0x98a5b2f5	! t0_kref+0x1f70:   	subcc	%l6, -0xd0b, %o4
	.word	0x9115be3f	! t0_kref+0x1f74:   	taddcctv	%l6, -0x1c1, %o0
	.word	0xd11fbcc8	! t0_kref+0x1f78:   	ldd	[%fp - 0x338], %f8
	.word	0x90f58016	! t0_kref+0x1f7c:   	udivcc	%l6, %l6, %o0
	.word	0xef68a001	! t0_kref+0x1f80:   	prefetch	%g2 + 1, 23
	.word	0x8005efd5	! t0_kref+0x1f84:   	add	%l7, 0xfd5, %g0
	.word	0xd83e001d	! t0_kref+0x1f88:   	std	%o4, [%i0 + %i5]
	.word	0x89a10844	! t0_kref+0x1f8c:   	faddd	%f4, %f4, %f4
	.word	0x8da000c2	! t0_kref+0x1f90:   	fnegd	%f2, %f6
	.word	0x9e45a22d	! t0_kref+0x1f94:   	addc	%l6, 0x22d, %o7
	.word	0x80a5c016	! t0_kref+0x1f98:   	cmp	%l7, %l6
	.word	0x9ac58016	! t0_kref+0x1f9c:   	addccc	%l6, %l6, %o5
	.word	0x8143e040	! t0_kref+0x1fa0:   	membar	0x40
	.word	0x92d5fda7	! t0_kref+0x1fa4:   	umulcc	%l7, -0x259, %o1
	.word	0x9b400000	! t0_kref+0x1fa8:   	mov	%y, %o5
	.word	0x9a8d8017	! t0_kref+0x1fac:   	andcc	%l6, %l7, %o5
	.word	0xd1b81018	! t0_kref+0x1fb0:   	stda	%f8, [%g0 + %i0]0x80
	.word	0xd8064000	! t0_kref+0x1fb4:   	ld	[%i1], %o4
	.word	0x81a24d26	! t0_kref+0x1fb8:   	fsmuld	%f9, %f6, %f0
	.word	0xd0100018	! t0_kref+0x1fbc:   	lduh	[%g0 + %i0], %o0
	.word	0x9addf8ad	! t0_kref+0x1fc0:   	smulcc	%l7, -0x753, %o5
	.word	0x83a018c4	! t0_kref+0x1fc4:   	fdtos	%f4, %f1
	.word	0xc568a080	! t0_kref+0x1fc8:   	prefetch	%g2 + 0x80, 2
	.word	0x98f5c017	! t0_kref+0x1fcc:   	udivcc	%l7, %l7, %o4
	.word	0x28480007	! t0_kref+0x1fd0:   	bleu,a,pt	%icc, _kref+0x1fec
	.word	0x8da24d27	! t0_kref+0x1fd4:   	fsmuld	%f9, %f7, %f6
	.word	0xee362002	! t0_kref+0x1fd8:   	sth	%l7, [%i0 + 2]
	.word	0xe27e4000	! t0_kref+0x1fdc:   	swap	[%i1], %l1
	.word	0xc1200018	! t0_kref+0x1fe0:   	st	%f0, [%g0 + %i0]
	.word	0x960da167	! t0_kref+0x1fe4:   	and	%l6, 0x167, %o3
	.word	0xcb26001c	! t0_kref+0x1fe8:   	st	%f5, [%i0 + %i4]
	.word	0x8ba01a28	! t0_kref+0x1fec:   	fstoi	%f8, %f5
	.word	0x8da10944	! t0_kref+0x1ff0:   	fmuld	%f4, %f4, %f6
	.word	0x8fa018c2	! t0_kref+0x1ff4:   	fdtos	%f2, %f7
	.word	0xc008a00f	! t0_kref+0x1ff8:   	ldub	[%g2 + 0xf], %g0
	.word	0xeeae5000	! t0_kref+0x1ffc:   	stba	%l7, [%i1]0x80
	.word	0x980d8016	! t0_kref+0x2000:   	and	%l6, %l6, %o4
	.word	0x920de1e9	! t0_kref+0x2004:   	and	%l7, 0x1e9, %o1
	.word	0x809d8017	! t0_kref+0x2008:   	xorcc	%l6, %l7, %g0
	.word	0xe89e101d	! t0_kref+0x200c:   	ldda	[%i0 + %i5]0x80, %l4
	.word	0x81a88a24	! t0_kref+0x2010:   	fcmps	%fcc0, %f2, %f4
	.word	0x81a88a42	! t0_kref+0x2014:   	fcmpd	%fcc0, %f2, %f2
	.word	0x9045c017	! t0_kref+0x2018:   	addc	%l7, %l7, %o0
	.word	0x91a018c2	! t0_kref+0x201c:   	fdtos	%f2, %f8
	.word	0x89a089a7	! t0_kref+0x2020:   	fdivs	%f2, %f7, %f4
	.word	0xc0d01018	! t0_kref+0x2024:   	ldsha	[%g0 + %i0]0x80, %g0
	.word	0x81a98aa9	! t0_kref+0x2028:   	fcmpes	%fcc0, %f6, %f9
	.word	0xcf270018	! t0_kref+0x202c:   	st	%f7, [%i4 + %i0]
	.word	0xe9ee101d	! t0_kref+0x2030:   	prefetcha	%i0 + %i5, 20
	.word	0x91a088c6	! t0_kref+0x2034:   	fsubd	%f2, %f6, %f8
	.word	0x8143c000	! t0_kref+0x2038:   	stbar
	.word	0x9fc00004	! t0_kref+0x203c:   	call	%g0 + %g4
	.word	0xd0380018	! t0_kref+0x2040:   	std	%o0, [%g0 + %i0]
	.word	0x87a01a28	! t0_kref+0x2044:   	fstoi	%f8, %f3
	.word	0x9095bf26	! t0_kref+0x2048:   	orcc	%l6, -0xda, %o0
	.word	0x8fa01a42	! t0_kref+0x204c:   	fdtoi	%f2, %f7
	.word	0x81aa4aa3	! t0_kref+0x2050:   	fcmpes	%fcc0, %f9, %f3
	.word	0xfbee501c	! t0_kref+0x2054:   	prefetcha	%i1 + %i4, 29
	.word	0xda166018	! t0_kref+0x2058:   	lduh	[%i1 + 0x18], %o5
	.word	0x89a000a6	! t0_kref+0x205c:   	fnegs	%f6, %f4
	.word	0xeb68a08c	! t0_kref+0x2060:   	prefetch	%g2 + 0x8c, 21
	.word	0x81a109c8	! t0_kref+0x2064:   	fdivd	%f4, %f8, %f0
	.word	0xee20a014	! t0_kref+0x2068:   	st	%l7, [%g2 + 0x14]
	.word	0x993de010	! t0_kref+0x206c:   	sra	%l7, 0x10, %o4
	.word	0x2b800003	! t0_kref+0x2070:   	fbug,a	_kref+0x207c
	.word	0xc91fbf60	! t0_kref+0x2074:   	ldd	[%fp - 0xa0], %f4
	.word	0x9a958016	! t0_kref+0x2078:   	orcc	%l6, %l6, %o5
	.word	0x87a01a46	! t0_kref+0x207c:   	fdtoi	%f6, %f3
	.word	0x9445ee26	! t0_kref+0x2080:   	addc	%l7, 0xe26, %o2
	.word	0x8da00142	! t0_kref+0x2084:   	fabsd	%f2, %f6
	.word	0xee20a014	! t0_kref+0x2088:   	st	%l7, [%g2 + 0x14]
	.word	0x94a58016	! t0_kref+0x208c:   	subcc	%l6, %l6, %o2
	.word	0x90bdc017	! t0_kref+0x2090:   	xnorcc	%l7, %l7, %o0
	.word	0x27800002	! t0_kref+0x2094:   	fbul,a	_kref+0x209c
	.word	0xc91fbc50	! t0_kref+0x2098:   	ldd	[%fp - 0x3b0], %f4
	.word	0x96f58017	! t0_kref+0x209c:   	udivcc	%l6, %l7, %o3
	.word	0x81aa4a28	! t0_kref+0x20a0:   	fcmps	%fcc0, %f9, %f8
	.word	0x8da109c8	! t0_kref+0x20a4:   	fdivd	%f4, %f8, %f6
	.word	0x81a88a21	! t0_kref+0x20a8:   	fcmps	%fcc0, %f2, %f1
	.word	0xc59f5019	! t0_kref+0x20ac:   	ldda	[%i5 + %i1]0x80, %f2
	.word	0xc1ee5017	! t0_kref+0x20b0:   	prefetcha	%i1 + %l7, 0
	.word	0x92a5b945	! t0_kref+0x20b4:   	subcc	%l6, -0x6bb, %o1
	.word	0x8ba000a0	! t0_kref+0x20b8:   	fnegs	%f0, %f5
	.word	0x81a9ca21	! t0_kref+0x20bc:   	fcmps	%fcc0, %f7, %f1
	.word	0xc99f5018	! t0_kref+0x20c0:   	ldda	[%i5 + %i0]0x80, %f4
	.word	0x85a01900	! t0_kref+0x20c4:   	fitod	%f0, %f2
	.word	0x91a01a23	! t0_kref+0x20c8:   	fstoi	%f3, %f8
	.word	0xd1be1816	! t0_kref+0x20cc:   	stda	%f8, [%i0 + %l6]0xc0
	.word	0x23800002	! t0_kref+0x20d0:   	fbne,a	_kref+0x20d8
	.word	0x89a01922	! t0_kref+0x20d4:   	fstod	%f2, %f4
	.word	0x80f5e213	! t0_kref+0x20d8:   	udivcc	%l7, 0x213, %g0
	.word	0x9f3de004	! t0_kref+0x20dc:   	sra	%l7, 0x4, %o7
	.word	0x98458016	! t0_kref+0x20e0:   	addc	%l6, %l6, %o4
	.word	0xd048a025	! t0_kref+0x20e4:   	ldsb	[%g2 + 0x25], %o0
	.word	0x89a008c0	! t0_kref+0x20e8:   	fsubd	%f0, %f0, %f4
	.word	0x89a1c9a0	! t0_kref+0x20ec:   	fdivs	%f7, %f0, %f4
	.word	0x81a01900	! t0_kref+0x20f0:   	fitod	%f0, %f0
	.word	0xf5ee501b	! t0_kref+0x20f4:   	prefetcha	%i1 + %i3, 26
	.word	0x8005eef6	! t0_kref+0x20f8:   	add	%l7, 0xef6, %g0
	.word	0xe01e7fe0	! t0_kref+0x20fc:   	ldd	[%i1 - 0x20], %l0
	.word	0xecb01018	! t0_kref+0x2100:   	stha	%l6, [%g0 + %i0]0x80
	.word	0xee7e7fe0	! t0_kref+0x2104:   	swap	[%i1 - 0x20], %l7
	.word	0x8075a95c	! t0_kref+0x2108:   	udiv	%l6, 0x95c, %g0
	.word	0x94d58016	! t0_kref+0x210c:   	umulcc	%l6, %l6, %o2
	.word	0xd03e2000	! t0_kref+0x2110:   	std	%o0, [%i0]
	.word	0x9465fe0b	! t0_kref+0x2114:   	subc	%l7, -0x1f5, %o2
	.word	0x948da805	! t0_kref+0x2118:   	andcc	%l6, 0x805, %o2
	.word	0x8da00840	! t0_kref+0x211c:   	faddd	%f0, %f0, %f6
	.word	0x990dc017	! t0_kref+0x2120:   	tsubcc	%l7, %l7, %o4
	.word	0xe01e401d	! t0_kref+0x2124:   	ldd	[%i1 + %i5], %l0
	.word	0xc11fbf60	! t0_kref+0x2128:   	ldd	[%fp - 0xa0], %f0
	.word	0xd13e6000	! t0_kref+0x212c:   	std	%f8, [%i1]
	.word	0x93a00026	! t0_kref+0x2130:   	fmovs	%f6, %f9
	.word	0xee262018	! t0_kref+0x2134:   	st	%l7, [%i0 + 0x18]
	.word	0x2b800004	! t0_kref+0x2138:   	fbug,a	_kref+0x2148
	.word	0x9415c017	! t0_kref+0x213c:   	or	%l7, %l7, %o2
	.word	0x9eddb27c	! t0_kref+0x2140:   	smulcc	%l6, -0xd84, %o7
	.word	0x81a088c4	! t0_kref+0x2144:   	fsubd	%f2, %f4, %f0
	.word	0x9045e145	! t0_kref+0x2148:   	addc	%l7, 0x145, %o0
	.word	0xee2e8018	! t0_kref+0x214c:   	stb	%l7, [%i2 + %i0]
	.word	0xc0500018	! t0_kref+0x2150:   	ldsh	[%g0 + %i0], %g0
	.word	0xc1be5856	! t0_kref+0x2154:   	stda	%f0, [%i1 + %l6]0xc2
	.word	0xe83e3fe0	! t0_kref+0x2158:   	std	%l4, [%i0 - 0x20]
	.word	0xec3f4018	! t0_kref+0x215c:   	std	%l6, [%i5 + %i0]
	.word	0x90e5f63d	! t0_kref+0x2160:   	subccc	%l7, -0x9c3, %o0
	.word	0xda6e8019	! t0_kref+0x2164:   	ldstub	[%i2 + %i1], %o5
	.word	0x9465c017	! t0_kref+0x2168:   	subc	%l7, %l7, %o2
	.word	0x91a000a5	! t0_kref+0x216c:   	fnegs	%f5, %f8
	.word	0x25800004	! t0_kref+0x2170:   	fblg,a	_kref+0x2180
	.word	0x80b58016	! t0_kref+0x2174:   	orncc	%l6, %l6, %g0
	.word	0x8ba01880	! t0_kref+0x2178:   	fitos	%f0, %f5
	.word	0x89a18d26	! t0_kref+0x217c:   	fsmuld	%f6, %f6, %f4
	.word	0xcb26001c	! t0_kref+0x2180:   	st	%f5, [%i0 + %i4]
	.word	0x91a01a26	! t0_kref+0x2184:   	fstoi	%f6, %f8
	.word	0x9ea5b297	! t0_kref+0x2188:   	subcc	%l6, -0xd69, %o7
	.word	0x9895c017	! t0_kref+0x218c:   	orcc	%l7, %l7, %o4
	.word	0xc1bf1a19	! t0_kref+0x2190:   	stda	%f0, [%i4 + %i1]0xd0
	.word	0x9fc00004	! t0_kref+0x2194:   	call	%g0 + %g4
	.word	0xd26e6016	! t0_kref+0x2198:   	ldstub	[%i1 + 0x16], %o1
	.word	0x91a18940	! t0_kref+0x219c:   	fmuld	%f6, %f0, %f8
	.word	0x90bdb457	! t0_kref+0x21a0:   	xnorcc	%l6, -0xba9, %o0
	.word	0x92bdc017	! t0_kref+0x21a4:   	xnorcc	%l7, %l7, %o1
	.word	0xc5063ffc	! t0_kref+0x21a8:   	ld	[%i0 - 4], %f2
	.word	0x85a01027	! t0_kref+0x21ac:   	fstox	%f7, %f2
	.word	0xd2163fe4	! t0_kref+0x21b0:   	lduh	[%i0 - 0x1c], %o1
	.word	0x9f35c016	! t0_kref+0x21b4:   	srl	%l7, %l6, %o7
	.word	0xc11fbe18	! t0_kref+0x21b8:   	ldd	[%fp - 0x1e8], %f0
	.word	0x900d8017	! t0_kref+0x21bc:   	and	%l6, %l7, %o0
	.word	0x81a00026	! t0_kref+0x21c0:   	fmovs	%f6, %f0
	.word	0xc5380019	! t0_kref+0x21c4:   	std	%f2, [%g0 + %i1]
	.word	0x89a089c8	! t0_kref+0x21c8:   	fdivd	%f2, %f8, %f4
	.word	0xf207bfe0	! t0_kref+0x21cc:   	ld	[%fp - 0x20], %i1
	.word	0x81a9ca26	! t0_kref+0x21d0:   	fcmps	%fcc0, %f7, %f6
	.word	0x9ab5c017	! t0_kref+0x21d4:   	orncc	%l7, %l7, %o5
	.word	0x98a58016	! t0_kref+0x21d8:   	subcc	%l6, %l6, %o4
	.word	0x86102003	! t0_kref+0x21dc:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x21e0:   	bne,a	_kref+0x21e0
	.word	0x86a0e001	! t0_kref+0x21e4:   	subcc	%g3, 1, %g3
	.word	0xed21608c	! t0_kref+0x21e8:   	st	%f22, [%g5 + 0x8c]
	.word	0x9895b637	! t0_kref+0x21ec:   	orcc	%l6, -0x9c9, %o4
	.word	0x80558016	! t0_kref+0x21f0:   	umul	%l6, %l6, %g0
	.word	0x81a88a44	! t0_kref+0x21f4:   	fcmpd	%fcc0, %f2, %f4
	.word	0x89a149a2	! t0_kref+0x21f8:   	fdivs	%f5, %f2, %f4
	.word	0xc06e8018	! t0_kref+0x21fc:   	ldstub	[%i2 + %i0], %g0
	.word	0x8095ff54	! t0_kref+0x2200:   	orcc	%l7, -0xac, %g0
	.word	0x81a00946	! t0_kref+0x2204:   	fmuld	%f0, %f6, %f0
	.word	0x92c58017	! t0_kref+0x2208:   	addccc	%l6, %l7, %o1
	.word	0x81dd4001	! t0_kref+0x220c:   	flush	%l5 + %g1
	.word	0x81deb3a6	! t0_kref+0x2210:   	flush	%i2 - 0xc5a
	.word	0x89a208a3	! t0_kref+0x2214:   	fsubs	%f8, %f3, %f4
	.word	0xec280019	! t0_kref+0x2218:   	stb	%l6, [%g0 + %i1]
	.word	0x98d5b028	! t0_kref+0x221c:   	umulcc	%l6, -0xfd8, %o4
	.word	0x8143c000	! t0_kref+0x2220:   	stbar
	.word	0x9ea5e664	! t0_kref+0x2224:   	subcc	%l7, 0x664, %o7
	.word	0x92f5a880	! t0_kref+0x2228:   	udivcc	%l6, 0x880, %o1
	.word	0xde16001b	! t0_kref+0x222c:   	lduh	[%i0 + %i3], %o7
	.word	0x973de005	! t0_kref+0x2230:   	sra	%l7, 0x5, %o3
	.word	0xc1a01019	! t0_kref+0x2234:   	sta	%f0, [%g0 + %i1]0x80
	.word	0xc51fbd00	! t0_kref+0x2238:   	ldd	[%fp - 0x300], %f2
	.word	0xec2e4000	! t0_kref+0x223c:   	stb	%l6, [%i1]
	.word	0x93a00024	! t0_kref+0x2240:   	fmovs	%f4, %f9
	.word	0x957034c0	! t0_kref+0x2244:   	popc	-0xb40, %o2
	.word	0xd640a024	! t0_kref+0x2248:   	ldsw	[%g2 + 0x24], %o3
	.word	0x81700017	! t0_kref+0x224c:   	popc	%l7, %g0
!	.word	0x2e4fb76c	! t0_kref+0x2250:   	bvs,a,pt	%icc, SYM(t0_subr1)
	   	bvs,a,pt	%icc, SYM(t0_subr1)
	.word	0x9f414000	! t0_kref+0x2254:   	mov	%pc, %o7
	.word	0x83a01a26	! t0_kref+0x2258:   	fstoi	%f6, %f1
	.word	0x8da00023	! t0_kref+0x225c:   	fmovs	%f3, %f6
	.word	0x90f5c016	! t0_kref+0x2260:   	udivcc	%l7, %l6, %o0
	.word	0x92f5c017	! t0_kref+0x2264:   	udivcc	%l7, %l7, %o1
	.word	0x8143c000	! t0_kref+0x2268:   	stbar
	.word	0x9a158017	! t0_kref+0x226c:   	or	%l6, %l7, %o5
	.word	0x85a18948	! t0_kref+0x2270:   	fmuld	%f6, %f8, %f2
	sethi	%hi(2f), %o7
	.word	0xe40be294	! t0_kref+0x2278:   	ldub	[%o7 + 0x294], %l2
	.word	0xa41ca00c	! t0_kref+0x227c:   	xor	%l2, 0xc, %l2
	.word	0xe42be294	! t0_kref+0x2280:   	stb	%l2, [%o7 + 0x294]
	.word	0x81dbe294	! t0_kref+0x2284:   	flush	%o7 + 0x294
	.word	0xd87e4000	! t0_kref+0x2288:   	swap	[%i1], %o4
	.word	0x81aa0aa1	! t0_kref+0x228c:   	fcmpes	%fcc0, %f8, %f1
	.word	0x81aa0aa7	! t0_kref+0x2290:   	fcmpes	%fcc0, %f8, %f7
2:	.word	0xec3e2018	! t0_kref+0x2294:   	std	%l6, [%i0 + 0x18]
	.word	0x81aa0a28	! t0_kref+0x2298:   	fcmps	%fcc0, %f8, %f8
	.word	0xd8062000	! t0_kref+0x229c:   	ld	[%i0], %o4
	.word	0x9845a849	! t0_kref+0x22a0:   	addc	%l6, 0x849, %o4
	.word	0xeb6e6000	! t0_kref+0x22a4:   	prefetch	%i1, 21
	.word	0x80a5e7dc	! t0_kref+0x22a8:   	cmp	%l7, 0x7dc
	.word	0xde40a000	! t0_kref+0x22ac:   	ldsw	[%g2], %o7
	.word	0x81dcc004	! t0_kref+0x22b0:   	flush	%l3 + %g4
	.word	0xc12e7fe4	! t0_kref+0x22b4:   	st	%fsr, [%i1 - 0x1c]
	call	SYM(t0_subr2)
	.word	0x91a20844	! t0_kref+0x22bc:   	faddd	%f8, %f4, %f8
	.word	0xeea6101c	! t0_kref+0x22c0:   	sta	%l7, [%i0 + %i4]0x80
	.word	0x8fa01a25	! t0_kref+0x22c4:   	fstoi	%f5, %f7
	.word	0x9ad5c016	! t0_kref+0x22c8:   	umulcc	%l7, %l6, %o5
	.word	0x83a000a9	! t0_kref+0x22cc:   	fnegs	%f9, %f1
	.word	0x81a98a27	! t0_kref+0x22d0:   	fcmps	%fcc0, %f6, %f7
	.word	0x9245b3ef	! t0_kref+0x22d4:   	addc	%l6, -0xc11, %o1
	.word	0xd250a00e	! t0_kref+0x22d8:   	ldsh	[%g2 + 0xe], %o1
	.word	0x9e958017	! t0_kref+0x22dc:   	orcc	%l6, %l7, %o7
	.word	0xec367fe8	! t0_kref+0x22e0:   	sth	%l6, [%i1 - 0x18]
	.word	0x80c5a10e	! t0_kref+0x22e4:   	addccc	%l6, 0x10e, %g0
	.word	0xc300a010	! t0_kref+0x22e8:   	ld	[%g2 + 0x10], %f1
	.word	0x92c5c016	! t0_kref+0x22ec:   	addccc	%l7, %l6, %o1
	.word	0xec20a000	! t0_kref+0x22f0:   	st	%l6, [%g2]
	.word	0x89a01886	! t0_kref+0x22f4:   	fitos	%f6, %f4
	.word	0xee30a008	! t0_kref+0x22f8:   	sth	%l7, [%g2 + 8]
	.word	0x81a88aa2	! t0_kref+0x22fc:   	fcmpes	%fcc0, %f2, %f2
	.word	0x89a00028	! t0_kref+0x2300:   	fmovs	%f8, %f4
	.word	0x9ed5fba1	! t0_kref+0x2304:   	umulcc	%l7, -0x45f, %o7
	.word	0x11060a1f	! t0_kref+0x2308:   	sethi	%hi(0x18287c00), %o0
	.word	0x961dc016	! t0_kref+0x230c:   	xor	%l7, %l6, %o3
	.word	0x9e05a7c7	! t0_kref+0x2310:   	add	%l6, 0x7c7, %o7
	.word	0x90e5fed6	! t0_kref+0x2314:   	subccc	%l7, -0x12a, %o0
	.word	0x8da01a22	! t0_kref+0x2318:   	fstoi	%f2, %f6
	.word	0x92ad8017	! t0_kref+0x231c:   	andncc	%l6, %l7, %o1
	.word	0x8ba018c4	! t0_kref+0x2320:   	fdtos	%f4, %f5
	.word	0x86102004	! t0_kref+0x2324:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x2328:   	bne,a	_kref+0x2328
	.word	0x86a0e001	! t0_kref+0x232c:   	subcc	%g3, 1, %g3
	.word	0xec26001c	! t0_kref+0x2330:   	st	%l6, [%i0 + %i4]
	.word	0x9f702f04	! t0_kref+0x2334:   	popc	0xf04, %o7
	.word	0x93a000a7	! t0_kref+0x2338:   	fnegs	%f7, %f9
	.word	0x91a00144	! t0_kref+0x233c:   	fabsd	%f4, %f8
	.word	0x96c58016	! t0_kref+0x2340:   	addccc	%l6, %l6, %o3
	.word	0x8da01a22	! t0_kref+0x2344:   	fstoi	%f2, %f6
	.word	0x960dc017	! t0_kref+0x2348:   	and	%l7, %l7, %o3
	.word	0xe66e3ff3	! t0_kref+0x234c:   	ldstub	[%i0 - 0xd], %l3
	.word	0x81aa4aa5	! t0_kref+0x2350:   	fcmpes	%fcc0, %f9, %f5
	.word	0xe26e3fef	! t0_kref+0x2354:   	ldstub	[%i0 - 0x11], %l1
	.word	0xedf65016	! t0_kref+0x2358:   	casxa	[%i1]0x80, %l6, %l6
	.word	0x98358017	! t0_kref+0x235c:   	orn	%l6, %l7, %o4
	.word	0x90458016	! t0_kref+0x2360:   	addc	%l6, %l6, %o0
	.word	0xc91e001d	! t0_kref+0x2364:   	ldd	[%i0 + %i5], %f4
	.word	0x81a18842	! t0_kref+0x2368:   	faddd	%f6, %f2, %f0
	.word	0xd0ee9018	! t0_kref+0x236c:   	ldstuba	[%i2 + %i0]0x80, %o0
	.word	0xe47e001c	! t0_kref+0x2370:   	swap	[%i0 + %i4], %l2
	.word	0x8143c000	! t0_kref+0x2374:   	stbar
	.word	0x83a000a1	! t0_kref+0x2378:   	fnegs	%f1, %f1
	.word	0x91a18842	! t0_kref+0x237c:   	faddd	%f6, %f2, %f8
	.word	0x3b800008	! t0_kref+0x2380:   	fble,a	_kref+0x23a0
	.word	0xee300018	! t0_kref+0x2384:   	sth	%l7, [%g0 + %i0]
	.word	0xd6166008	! t0_kref+0x2388:   	lduh	[%i1 + 8], %o3
	.word	0xcd1fbd98	! t0_kref+0x238c:   	ldd	[%fp - 0x268], %f6
	.word	0x2f800008	! t0_kref+0x2390:   	fbu,a	_kref+0x23b0
	.word	0xc93e6010	! t0_kref+0x2394:   	std	%f4, [%i1 + 0x10]
	.word	0x81a98ac6	! t0_kref+0x2398:   	fcmped	%fcc0, %f6, %f6
	.word	0x90adbb41	! t0_kref+0x239c:   	andncc	%l6, -0x4bf, %o0
	.word	0x98ad8016	! t0_kref+0x23a0:   	andncc	%l6, %l6, %o4
	.word	0xd848a037	! t0_kref+0x23a4:   	ldsb	[%g2 + 0x37], %o4
	.word	0xc9be1857	! t0_kref+0x23a8:   	stda	%f4, [%i0 + %l7]0xc2
	.word	0x81a018c0	! t0_kref+0x23ac:   	fdtos	%f0, %f0
	.word	0xc320a014	! t0_kref+0x23b0:   	st	%f1, [%g2 + 0x14]
	.word	0x91a01922	! t0_kref+0x23b4:   	fstod	%f2, %f8
	.word	0xc11fbe98	! t0_kref+0x23b8:   	ldd	[%fp - 0x168], %f0
	.word	0x8125a98a	! t0_kref+0x23bc:   	mulscc	%l6, 0x98a, %g0
	.word	0xeeb01019	! t0_kref+0x23c0:   	stha	%l7, [%g0 + %i1]0x80
	.word	0xda000018	! t0_kref+0x23c4:   	ld	[%g0 + %i0], %o5
	.word	0xd41e3ff8	! t0_kref+0x23c8:   	ldd	[%i0 - 8], %o2
	.word	0x961d8017	! t0_kref+0x23cc:   	xor	%l6, %l7, %o3
	.word	0x9b35c017	! t0_kref+0x23d0:   	srl	%l7, %l7, %o5
	.word	0x81dfc015	! t0_kref+0x23d4:   	flush	%i7 + %l5
	.word	0x8143c000	! t0_kref+0x23d8:   	stbar
	.word	0x89a18d28	! t0_kref+0x23dc:   	fsmuld	%f6, %f8, %f4
	.word	0x93700017	! t0_kref+0x23e0:   	popc	%l7, %o1
	.word	0x9835a38c	! t0_kref+0x23e4:   	orn	%l6, 0x38c, %o4
	.word	0x90a5a703	! t0_kref+0x23e8:   	subcc	%l6, 0x703, %o0
	.word	0x980dc017	! t0_kref+0x23ec:   	and	%l7, %l7, %o4
	.word	0xd6de1000	! t0_kref+0x23f0:   	ldxa	[%i0]0x80, %o3
	.word	0x8da188c4	! t0_kref+0x23f4:   	fsubd	%f6, %f4, %f6
	.word	0xee6e7ffb	! t0_kref+0x23f8:   	ldstub	[%i1 - 5], %l7
	.word	0xd600a038	! t0_kref+0x23fc:   	ld	[%g2 + 0x38], %o3
	.word	0x96e58017	! t0_kref+0x2400:   	subccc	%l6, %l7, %o3
	.word	0x29800005	! t0_kref+0x2404:   	fbl,a	_kref+0x2418
	.word	0xd04e3ffa	! t0_kref+0x2408:   	ldsb	[%i0 - 6], %o0
	.word	0x81a80aa6	! t0_kref+0x240c:   	fcmpes	%fcc0, %f0, %f6
	.word	0xc91fbeb0	! t0_kref+0x2410:   	ldd	[%fp - 0x150], %f4
	.word	0x91358016	! t0_kref+0x2414:   	srl	%l6, %l6, %o0
	.word	0x81a00d22	! t0_kref+0x2418:   	fsmuld	%f0, %f2, %f0
	.word	0x9875e350	! t0_kref+0x241c:   	udiv	%l7, 0x350, %o4
	.word	0x8143e040	! t0_kref+0x2420:   	membar	0x40
	.word	0x89a18d22	! t0_kref+0x2424:   	fsmuld	%f6, %f2, %f4
	.word	0x8ba000a1	! t0_kref+0x2428:   	fnegs	%f1, %f5
	.word	0xeeb01018	! t0_kref+0x242c:   	stha	%l7, [%g0 + %i0]0x80
	.word	0x85a01884	! t0_kref+0x2430:   	fitos	%f4, %f2
	.word	0xd83e3ff0	! t0_kref+0x2434:   	std	%o4, [%i0 - 0x10]
	.word	0x89a01a48	! t0_kref+0x2438:   	fdtoi	%f8, %f4
	.word	0x87a018c0	! t0_kref+0x243c:   	fdtos	%f0, %f3
	.word	0x91a01a24	! t0_kref+0x2440:   	fstoi	%f4, %f8
	.word	0x8045c016	! t0_kref+0x2444:   	addc	%l7, %l6, %g0
	.word	0x8143c000	! t0_kref+0x2448:   	stbar
	.word	0xc8183fa0	! t0_kref+0x244c:   	ldd	[%g0 - 0x60], %g4
	.word	0x80d5e97f	! t0_kref+0x2450:   	umulcc	%l7, 0x97f, %g0
	.word	0x94f5ab7d	! t0_kref+0x2454:   	udivcc	%l6, 0xb7d, %o2
	.word	0x9f35e019	! t0_kref+0x2458:   	srl	%l7, 0x19, %o7
	.word	0x8da18946	! t0_kref+0x245c:   	fmuld	%f6, %f6, %f6
	.word	0x9a95c016	! t0_kref+0x2460:   	orcc	%l7, %l6, %o5
	.word	0x9695e627	! t0_kref+0x2464:   	orcc	%l7, 0x627, %o3
	.word	0x81a00046	! t0_kref+0x2468:   	fmovd	%f6, %f0
	.word	0xc76e4016	! t0_kref+0x246c:   	prefetch	%i1 + %l6, 3
	.word	0x9a95be89	! t0_kref+0x2470:   	orcc	%l6, -0x177, %o5
	.word	0xed68a081	! t0_kref+0x2474:   	prefetch	%g2 + 0x81, 22
	.word	0x87a049a2	! t0_kref+0x2478:   	fdivs	%f1, %f2, %f3
	.word	0xd83e3fe8	! t0_kref+0x247c:   	std	%o4, [%i0 - 0x18]
	.word	0xd240a030	! t0_kref+0x2480:   	ldsw	[%g2 + 0x30], %o1
	.word	0x98a58016	! t0_kref+0x2484:   	subcc	%l6, %l6, %o4
	.word	0xd186105c	! t0_kref+0x2488:   	lda	[%i0 + %i4]0x82, %f8
	.word	0xc0067ff0	! t0_kref+0x248c:   	ld	[%i1 - 0x10], %g0
	.word	0x29800007	! t0_kref+0x2490:   	fbl,a	_kref+0x24ac
	.word	0x8da000c2	! t0_kref+0x2494:   	fnegd	%f2, %f6
	.word	0x81a000a9	! t0_kref+0x2498:   	fnegs	%f9, %f0
	.word	0x89a089c0	! t0_kref+0x249c:   	fdivd	%f2, %f0, %f4
	.word	0x94a5ad75	! t0_kref+0x24a0:   	subcc	%l6, 0xd75, %o2
	.word	0xd2162012	! t0_kref+0x24a4:   	lduh	[%i0 + 0x12], %o1
	.word	0x90b5b1ce	! t0_kref+0x24a8:   	orncc	%l6, -0xe32, %o0
	.word	0xee30a002	! t0_kref+0x24ac:   	sth	%l7, [%g2 + 2]
	.word	0xc91e7fe0	! t0_kref+0x24b0:   	ldd	[%i1 - 0x20], %f4
	.word	0x8143c000	! t0_kref+0x24b4:   	stbar
	.word	0x98a58017	! t0_kref+0x24b8:   	subcc	%l6, %l7, %o4
	.word	0x8da01a29	! t0_kref+0x24bc:   	fstoi	%f9, %f6
	.word	0xda063ffc	! t0_kref+0x24c0:   	ld	[%i0 - 4], %o5
	.word	0x969df19a	! t0_kref+0x24c4:   	xorcc	%l7, -0xe66, %o3
	.word	0x9a3d8016	! t0_kref+0x24c8:   	xnor	%l6, %l6, %o5
	.word	0x3d800007	! t0_kref+0x24cc:   	fbule,a	_kref+0x24e8
	.word	0x87a109a2	! t0_kref+0x24d0:   	fdivs	%f4, %f2, %f3
	.word	0xd300a008	! t0_kref+0x24d4:   	ld	[%g2 + 8], %f9
	.word	0xee363fe6	! t0_kref+0x24d8:   	sth	%l7, [%i0 - 0x1a]
	.word	0x905d8017	! t0_kref+0x24dc:   	smul	%l6, %l7, %o0
	.word	0x8da00d23	! t0_kref+0x24e0:   	fsmuld	%f0, %f3, %f6
	.word	0xd050a00e	! t0_kref+0x24e4:   	ldsh	[%g2 + 0xe], %o0
	.word	0x8143c000	! t0_kref+0x24e8:   	stbar
	.word	0x8095bcfa	! t0_kref+0x24ec:   	orcc	%l6, -0x306, %g0
	.word	0x8143c000	! t0_kref+0x24f0:   	stbar
	.word	0x9445fb3b	! t0_kref+0x24f4:   	addc	%l7, -0x4c5, %o2
	.word	0x9665c017	! t0_kref+0x24f8:   	subc	%l7, %l7, %o3
	.word	0x8fa048a3	! t0_kref+0x24fc:   	fsubs	%f1, %f3, %f7
	.word	0xd04e7ff5	! t0_kref+0x2500:   	ldsb	[%i1 - 0xb], %o0
	.word	0x9fc02ef4	! t0_kref+0x2504:   	call	%g0 + 0xef4
	.word	0xc9062010	! t0_kref+0x2508:   	ld	[%i0 + 0x10], %f4
	.word	0xd6c61000	! t0_kref+0x250c:   	ldswa	[%i0]0x80, %o3
	.word	0xd84e601c	! t0_kref+0x2510:   	ldsb	[%i1 + 0x1c], %o4
	.word	0x970db08f	! t0_kref+0x2514:   	tsubcc	%l6, -0xf71, %o3
	.word	0xc768a041	! t0_kref+0x2518:   	prefetch	%g2 + 0x41, 3
	.word	0x83a01a28	! t0_kref+0x251c:   	fstoi	%f8, %f1
	.word	0x93a20929	! t0_kref+0x2520:   	fmuls	%f8, %f9, %f9
	.word	0xd2100019	! t0_kref+0x2524:   	lduh	[%g0 + %i1], %o1
	.word	0xec367fe2	! t0_kref+0x2528:   	sth	%l6, [%i1 - 0x1e]
	.word	0xf007bfe0	! t0_kref+0x252c:   	ld	[%fp - 0x20], %i0
	.word	0xc12e7fe0	! t0_kref+0x2530:   	st	%fsr, [%i1 - 0x20]
	.word	0xef6e001a	! t0_kref+0x2534:   	prefetch	%i0 + %i2, 23
	.word	0x80e5c017	! t0_kref+0x2538:   	subccc	%l7, %l7, %g0
	.word	0x8da188c4	! t0_kref+0x253c:   	fsubd	%f6, %f4, %f6
	.word	0x96e5a823	! t0_kref+0x2540:   	subccc	%l6, 0x823, %o3
	.word	0x81d80012	! t0_kref+0x2544:   	flush	%g0 + %l2
	.word	0x9295fbce	! t0_kref+0x2548:   	orcc	%l7, -0x432, %o1
	.word	0x85a01a46	! t0_kref+0x254c:   	fdtoi	%f6, %f2
	.word	0x913dc017	! t0_kref+0x2550:   	sra	%l7, %l7, %o0
	.word	0x27800004	! t0_kref+0x2554:   	fbul,a	_kref+0x2564
	.word	0xec3e2000	! t0_kref+0x2558:   	std	%l6, [%i0]
	.word	0x933d8017	! t0_kref+0x255c:   	sra	%l6, %l7, %o1
	.word	0xd1f65017	! t0_kref+0x2560:   	casxa	[%i1]0x80, %l7, %o0
	.word	0x81def92e	! t0_kref+0x2564:   	flush	%i3 - 0x6d2
	.word	0xd27f0018	! t0_kref+0x2568:   	swap	[%i4 + %i0], %o1
	.word	0x969db4ac	! t0_kref+0x256c:   	xorcc	%l6, -0xb54, %o3
	.word	0x8da00024	! t0_kref+0x2570:   	fmovs	%f4, %f6
	.word	0x85a00020	! t0_kref+0x2574:   	fmovs	%f0, %f2
	.word	0x85a00524	! t0_kref+0x2578:   	fsqrts	%f4, %f2
	.word	0x29480003	! t0_kref+0x257c:   	fbl,a,pt	%fcc0, _kref+0x2588
	.word	0x9f0def0a	! t0_kref+0x2580:   	tsubcc	%l7, 0xf0a, %o7
	.word	0xef68a001	! t0_kref+0x2584:   	prefetch	%g2 + 1, 23
	.word	0x91400000	! t0_kref+0x2588:   	mov	%y, %o0
	.word	0x27800008	! t0_kref+0x258c:   	fbul,a	_kref+0x25ac
	.word	0x87a01880	! t0_kref+0x2590:   	fitos	%f0, %f3
	.word	0xc91fbe58	! t0_kref+0x2594:   	ldd	[%fp - 0x1a8], %f4
	.word	0xd83e401d	! t0_kref+0x2598:   	std	%o4, [%i1 + %i5]
	.word	0x81d94009	! t0_kref+0x259c:   	flush	%g5 + %o1
	.word	0x81a98ac8	! t0_kref+0x25a0:   	fcmped	%fcc0, %f6, %f8
	call	SYM(t0_subr0)
	.word	0x95700017	! t0_kref+0x25a8:   	popc	%l7, %o2
	.word	0xd606001c	! t0_kref+0x25ac:   	ld	[%i0 + %i4], %o3
	.word	0x9fc00004	! t0_kref+0x25b0:   	call	%g0 + %g4
	.word	0x81a0c8a2	! t0_kref+0x25b4:   	fsubs	%f3, %f2, %f0
	.word	0x81a90a40	! t0_kref+0x25b8:   	fcmpd	%fcc0, %f4, %f0
	.word	0xc19e6010	! t0_kref+0x25bc:   	ldda	[%i1 + 0x10]%asi, %f0
	.word	0xda4e8018	! t0_kref+0x25c0:   	ldsb	[%i2 + %i0], %o5
	.word	0xee36201a	! t0_kref+0x25c4:   	sth	%l7, [%i0 + 0x1a]
	.word	0x9add8017	! t0_kref+0x25c8:   	smulcc	%l6, %l7, %o5
	.word	0x9f40c000	! t0_kref+0x25cc:   	mov	%asi, %o7
	.word	0x87a00028	! t0_kref+0x25d0:   	fmovs	%f8, %f3
	.word	0xd208a018	! t0_kref+0x25d4:   	ldub	[%g2 + 0x18], %o1
	.word	0x94c58017	! t0_kref+0x25d8:   	addccc	%l6, %l7, %o2
	.word	0x81a01900	! t0_kref+0x25dc:   	fitod	%f0, %f0
	.word	0xd0162014	! t0_kref+0x25e0:   	lduh	[%i0 + 0x14], %o0
	.word	0xcd1e6008	! t0_kref+0x25e4:   	ldd	[%i1 + 8], %f6
	.word	0x9e358016	! t0_kref+0x25e8:   	orn	%l6, %l6, %o7
	.word	0x93a01a40	! t0_kref+0x25ec:   	fdtoi	%f0, %f9
	.word	0x86102009	! t0_kref+0x25f0:   	mov	0x9, %g3
	.word	0x86a0e001	! t0_kref+0x25f4:   	subcc	%g3, 1, %g3
	.word	0x2280001a	! t0_kref+0x25f8:   	be,a	_kref+0x2660
	.word	0x9b25b30c	! t0_kref+0x25fc:   	mulscc	%l6, -0xcf4, %o5
	.word	0xc368a084	! t0_kref+0x2600:   	prefetch	%g2 + 0x84, 1
	.word	0x8da018c4	! t0_kref+0x2604:   	fdtos	%f4, %f6
	.word	0x9025f487	! t0_kref+0x2608:   	sub	%l7, -0xb79, %o0
	.word	0xda10a02c	! t0_kref+0x260c:   	lduh	[%g2 + 0x2c], %o5
	call	SYM(t0_subr3)
	.word	0x91a149a6	! t0_kref+0x2614:   	fdivs	%f5, %f6, %f8
	.word	0x81a00024	! t0_kref+0x2618:   	fmovs	%f4, %f0
	.word	0x9245c017	! t0_kref+0x261c:   	addc	%l7, %l7, %o1
	.word	0x81a84aa9	! t0_kref+0x2620:   	fcmpes	%fcc0, %f1, %f9
	.word	0x81a10942	! t0_kref+0x2624:   	fmuld	%f4, %f2, %f0
	.word	0x89a04d23	! t0_kref+0x2628:   	fsmuld	%f1, %f3, %f4
	.word	0xc06e8018	! t0_kref+0x262c:   	ldstub	[%i2 + %i0], %g0
	.word	0xcb26001c	! t0_kref+0x2630:   	st	%f5, [%i0 + %i4]
	.word	0x9e5d8017	! t0_kref+0x2634:   	smul	%l6, %l7, %o7
	.word	0x85a109c0	! t0_kref+0x2638:   	fdivd	%f4, %f0, %f2
	.word	0x8035b71b	! t0_kref+0x263c:   	orn	%l6, -0x8e5, %g0
	call	SYM(t0_subr3)
	.word	0xec3e0000	! t0_kref+0x2644:   	std	%l6, [%i0]
	.word	0x81ddf782	! t0_kref+0x2648:   	flush	%l7 - 0x87e
	.word	0x80c5fe47	! t0_kref+0x264c:   	addccc	%l7, -0x1b9, %g0
	.word	0x9e358016	! t0_kref+0x2650:   	orn	%l6, %l6, %o7
	.word	0x9535e01a	! t0_kref+0x2654:   	srl	%l7, 0x1a, %o2
	.word	0xc5180019	! t0_kref+0x2658:   	ldd	[%g0 + %i1], %f2
	.word	0xd808a025	! t0_kref+0x265c:   	ldub	[%g2 + 0x25], %o4
	.word	0xd24e0000	! t0_kref+0x2660:   	ldsb	[%i0], %o1
	.word	0x8faac028	! t0_kref+0x2664:   	fmovsge	%fcc0, %f8, %f7
	.word	0x98bdc017	! t0_kref+0x2668:   	xnorcc	%l7, %l7, %o4
	.word	0xec200019	! t0_kref+0x266c:   	st	%l6, [%g0 + %i1]
	.word	0x92adfc81	! t0_kref+0x2670:   	andncc	%l7, -0x37f, %o1
	.word	0xee30a00c	! t0_kref+0x2674:   	sth	%l7, [%g2 + 0xc]
	.word	0x9e75c017	! t0_kref+0x2678:   	udiv	%l7, %l7, %o7
	.word	0xc9be1816	! t0_kref+0x267c:   	stda	%f4, [%i0 + %l6]0xc0
	.word	0x8fa00021	! t0_kref+0x2680:   	fmovs	%f1, %f7
	.word	0x3b800002	! t0_kref+0x2684:   	fble,a	_kref+0x268c
	.word	0xc9be5817	! t0_kref+0x2688:   	stda	%f4, [%i1 + %l7]0xc0
	.word	0x98958016	! t0_kref+0x268c:   	orcc	%l6, %l6, %o4
	.word	0x85a01108	! t0_kref+0x2690:   	fxtod	%f8, %f2
	.word	0x92c5e645	! t0_kref+0x2694:   	addccc	%l7, 0x645, %o1
	.word	0xc9be1a1b	! t0_kref+0x2698:   	stda	%f4, [%i0 + %i3]0xd0
	.word	0xd2167ff8	! t0_kref+0x269c:   	lduh	[%i1 - 8], %o1
	.word	0x94a5ad8a	! t0_kref+0x26a0:   	subcc	%l6, 0xd8a, %o2
	.word	0x81a98a29	! t0_kref+0x26a4:   	fcmps	%fcc0, %f6, %f9
	.word	0x86102016	! t0_kref+0x26a8:   	mov	0x16, %g3
	.word	0x86a0e001	! t0_kref+0x26ac:   	subcc	%g3, 1, %g3
	.word	0x2280001d	! t0_kref+0x26b0:   	be,a	_kref+0x2724
	.word	0xc706001c	! t0_kref+0x26b4:   	ld	[%i0 + %i4], %f3
	.word	0x85a01904	! t0_kref+0x26b8:   	fitod	%f4, %f2
	.word	0x85a00520	! t0_kref+0x26bc:   	fsqrts	%f0, %f2
	.word	0x8fa018c4	! t0_kref+0x26c0:   	fdtos	%f4, %f7
	.word	0x969d8017	! t0_kref+0x26c4:   	xorcc	%l6, %l7, %o3
	.word	0x91a00022	! t0_kref+0x26c8:   	fmovs	%f2, %f8
	.word	0x92958017	! t0_kref+0x26cc:   	orcc	%l6, %l7, %o1
	.word	0xe2ee9018	! t0_kref+0x26d0:   	ldstuba	[%i2 + %i0]0x80, %l1
	.word	0x37bffff6	! t0_kref+0x26d4:   	fbge,a	_kref+0x26ac
	.word	0xef6e401b	! t0_kref+0x26d8:   	prefetch	%i1 + %i3, 23
	.word	0x1700094a	! t0_kref+0x26dc:   	sethi	%hi(0x252800), %o3
	.word	0xd400a018	! t0_kref+0x26e0:   	ld	[%g2 + 0x18], %o2
	.word	0xfdee101b	! t0_kref+0x26e4:   	prefetcha	%i0 + %i3, 30
	.word	0x89a00148	! t0_kref+0x26e8:   	fabsd	%f8, %f4
	.word	0xd1be5856	! t0_kref+0x26ec:   	stda	%f8, [%i1 + %l6]0xc2
	.word	0xcf20a028	! t0_kref+0x26f0:   	st	%f7, [%g2 + 0x28]
	.word	0x81a90aa1	! t0_kref+0x26f4:   	fcmpes	%fcc0, %f4, %f1
	.word	0x9ac5a239	! t0_kref+0x26f8:   	addccc	%l6, 0x239, %o5
	.word	0xee2e2011	! t0_kref+0x26fc:   	stb	%l7, [%i0 + 0x11]
	.word	0x91a01921	! t0_kref+0x2700:   	fstod	%f1, %f8
	.word	0x9325be72	! t0_kref+0x2704:   	mulscc	%l6, -0x18e, %o1
	.word	0x85a00046	! t0_kref+0x2708:   	fmovd	%f6, %f2
	.word	0x89a01a46	! t0_kref+0x270c:   	fdtoi	%f6, %f4
	.word	0x925dc016	! t0_kref+0x2710:   	smul	%l7, %l6, %o1
	.word	0xf1ee501a	! t0_kref+0x2714:   	prefetcha	%i1 + %i2, 24
	.word	0xec30a02c	! t0_kref+0x2718:   	sth	%l6, [%g2 + 0x2c]
	.word	0x87a109a7	! t0_kref+0x271c:   	fdivs	%f4, %f7, %f3
	.word	0x29800003	! t0_kref+0x2720:   	fbl,a	_kref+0x272c
	.word	0xc05e3ff8	! t0_kref+0x2724:   	ldx	[%i0 - 8], %g0
	.word	0x9645c017	! t0_kref+0x2728:   	addc	%l7, %l7, %o3
	.word	0xcd380019	! t0_kref+0x272c:   	std	%f6, [%g0 + %i1]
	.word	0x9445ec0b	! t0_kref+0x2730:   	addc	%l7, 0xc0b, %o2
	.word	0xee7e6018	! t0_kref+0x2734:   	swap	[%i1 + 0x18], %l7
	.word	0x86102006	! t0_kref+0x2738:   	mov	0x6, %g3
	.word	0x86a0e001	! t0_kref+0x273c:   	subcc	%g3, 1, %g3
	.word	0x2280000b	! t0_kref+0x2740:   	be,a	_kref+0x276c
	.word	0x81a01924	! t0_kref+0x2744:   	fstod	%f4, %f0
	.word	0xc19e1a5c	! t0_kref+0x2748:   	ldda	[%i0 + %i4]0xd2, %f0
	.word	0x8da20948	! t0_kref+0x274c:   	fmuld	%f8, %f8, %f6
	.word	0x89a01a25	! t0_kref+0x2750:   	fstoi	%f5, %f4
	.word	0x9fc00004	! t0_kref+0x2754:   	call	%g0 + %g4
	.word	0x923dadae	! t0_kref+0x2758:   	xnor	%l6, 0xdae, %o1
	.word	0x932da004	! t0_kref+0x275c:   	sll	%l6, 0x4, %o1
	.word	0xee30a024	! t0_kref+0x2760:   	sth	%l7, [%g2 + 0x24]
	.word	0xec20a018	! t0_kref+0x2764:   	st	%l6, [%g2 + 0x18]
	.word	0x89a01929	! t0_kref+0x2768:   	fstod	%f9, %f4
	.word	0x98a5e28b	! t0_kref+0x276c:   	subcc	%l7, 0x28b, %o4
	.word	0x93a018c6	! t0_kref+0x2770:   	fdtos	%f6, %f9
	.word	0x9025f879	! t0_kref+0x2774:   	sub	%l7, -0x787, %o0
	.word	0x81aa0a24	! t0_kref+0x2778:   	fcmps	%fcc0, %f8, %f4
	.word	0x91a018c4	! t0_kref+0x277c:   	fdtos	%f4, %f8
	.word	0xc51e7fe0	! t0_kref+0x2780:   	ldd	[%i1 - 0x20], %f2
	.word	0xe36e401b	! t0_kref+0x2784:   	prefetch	%i1 + %i3, 17
	.word	0x9095fca4	! t0_kref+0x2788:   	orcc	%l7, -0x35c, %o0
	.word	0x89a18944	! t0_kref+0x278c:   	fmuld	%f6, %f4, %f4
	.word	0xef68a045	! t0_kref+0x2790:   	prefetch	%g2 + 0x45, 23
	.word	0x8185c000	! t0_kref+0x2794:   	wr	%l7, %g0, %y
	.word	0x9445bf06	! t0_kref+0x2798:   	addc	%l6, -0xfa, %o2
	.word	0xed6e001a	! t0_kref+0x279c:   	prefetch	%i0 + %i2, 22
	.word	0x91a01106	! t0_kref+0x27a0:   	fxtod	%f6, %f8
	.word	0x81a018c0	! t0_kref+0x27a4:   	fdtos	%f0, %f0
	.word	0x86102001	! t0_kref+0x27a8:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x27ac:   	bne,a	_kref+0x27ac
	.word	0x86a0e001	! t0_kref+0x27b0:   	subcc	%g3, 1, %g3
	.word	0x9ee58016	! t0_kref+0x27b4:   	subccc	%l6, %l6, %o7
	.word	0x87a018c2	! t0_kref+0x27b8:   	fdtos	%f2, %f3
	.word	0xcd26600c	! t0_kref+0x27bc:   	st	%f6, [%i1 + 0xc]
	.word	0xeb6e3fe0	! t0_kref+0x27c0:   	prefetch	%i0 - 0x20, 21
	.word	0xd19e5a5d	! t0_kref+0x27c4:   	ldda	[%i1 + %i5]0xd2, %f8
	.word	0x9ae5ef3a	! t0_kref+0x27c8:   	subccc	%l7, 0xf3a, %o5
	.word	0xc320a014	! t0_kref+0x27cc:   	st	%f1, [%g2 + 0x14]
	.word	0x91a208c2	! t0_kref+0x27d0:   	fsubd	%f8, %f2, %f8
	.word	0x988d8017	! t0_kref+0x27d4:   	andcc	%l6, %l7, %o4
	.word	0x98458017	! t0_kref+0x27d8:   	addc	%l6, %l7, %o4
	.word	0x93a018c4	! t0_kref+0x27dc:   	fdtos	%f4, %f9
	.word	0xc300a03c	! t0_kref+0x27e0:   	ld	[%g2 + 0x3c], %f1
	.word	0x813da013	! t0_kref+0x27e4:   	sra	%l6, 0x13, %g0
!	.word	0x20bfb606	! t0_kref+0x27e8:   	bn,a	SYM(t0_subr1)
	   	bn,a	SYM(t0_subr1)
	.word	0x9f414000	! t0_kref+0x27ec:   	mov	%pc, %o7
	.word	0x93a01a25	! t0_kref+0x27f0:   	fstoi	%f5, %f9
	.word	0xd65f4018	! t0_kref+0x27f4:   	ldx	[%i5 + %i0], %o3
	.word	0x9835e6e2	! t0_kref+0x27f8:   	orn	%l7, 0x6e2, %o4
	.word	0xd200a010	! t0_kref+0x27fc:   	ld	[%g2 + 0x10], %o1
	.word	0xd01f4000	! t0_kref+0x2800:   	ldd	[%i5], %o0
	.word	0x81aa0aa5	! t0_kref+0x2804:   	fcmpes	%fcc0, %f8, %f5
	.word	0x91358016	! t0_kref+0x2808:   	srl	%l6, %l6, %o0
	.word	0xd3067fe4	! t0_kref+0x280c:   	ld	[%i1 - 0x1c], %f9
	.word	0x91a000a2	! t0_kref+0x2810:   	fnegs	%f2, %f8
	.word	0x9fc10000	! t0_kref+0x2814:   	call	%g4
	.word	0x8da98046	! t0_kref+0x2818:   	fmovdg	%fcc0, %f6, %f6
	.word	0xfbee501d	! t0_kref+0x281c:   	prefetcha	%i1 + %i5, 29
	.word	0xe168a007	! t0_kref+0x2820:   	prefetch	%g2 + 7, 16
	call	SYM(t0_subr1)
	.word	0xd19e3fea	! t0_kref+0x2828:   	ldda	[%i0 - 0x16]%asi, %f8
	.word	0x9b15e304	! t0_kref+0x282c:   	taddcctv	%l7, 0x304, %o5
	.word	0xd6060000	! t0_kref+0x2830:   	ld	[%i0], %o3
	.word	0x3e480001	! t0_kref+0x2834:   	bvc,a,pt	%icc, _kref+0x2838
	.word	0xe66e601e	! t0_kref+0x2838:   	ldstub	[%i1 + 0x1e], %l3
	.word	0x9e8dc017	! t0_kref+0x283c:   	andcc	%l7, %l7, %o7
	.word	0xc920a018	! t0_kref+0x2840:   	st	%f4, [%g2 + 0x18]
	.word	0x81aa0aa0	! t0_kref+0x2844:   	fcmpes	%fcc0, %f8, %f0
	.word	0x9e75f327	! t0_kref+0x2848:   	udiv	%l7, -0xcd9, %o7
	.word	0x91a000c8	! t0_kref+0x284c:   	fnegd	%f8, %f8
	.word	0x921de9ef	! t0_kref+0x2850:   	xor	%l7, 0x9ef, %o1
	.word	0xd1267ffc	! t0_kref+0x2854:   	st	%f8, [%i1 - 4]
	call	SYM(t0_subr2)
	.word	0xd19e5a5d	! t0_kref+0x285c:   	ldda	[%i1 + %i5]0xd2, %f8
	.word	0x90a5c017	! t0_kref+0x2860:   	subcc	%l7, %l7, %o0
	.word	0x3d800003	! t0_kref+0x2864:   	fbule,a	_kref+0x2870
	.word	0x91a01928	! t0_kref+0x2868:   	fstod	%f8, %f8
	.word	0xc13e001d	! t0_kref+0x286c:   	std	%f0, [%i0 + %i5]
	.word	0x9035b23f	! t0_kref+0x2870:   	orn	%l6, -0xdc1, %o0
	.word	0xd0c71019	! t0_kref+0x2874:   	ldswa	[%i4 + %i1]0x80, %o0
	.word	0x91a049a5	! t0_kref+0x2878:   	fdivs	%f1, %f5, %f8
	.word	0xeef75018	! t0_kref+0x287c:   	stxa	%l7, [%i5 + %i0]0x80
	.word	0x8da90044	! t0_kref+0x2880:   	fmovdl	%fcc0, %f4, %f6
	sethi	%hi(2f), %o7
	.word	0xe40be0b8	! t0_kref+0x2888:   	ldub	[%o7 + 0xb8], %l2
	.word	0xa41ca00c	! t0_kref+0x288c:   	xor	%l2, 0xc, %l2
	.word	0xe42be0b8	! t0_kref+0x2890:   	stb	%l2, [%o7 + 0xb8]
	.word	0x81dbe0b8	! t0_kref+0x2894:   	flush	%o7 + 0xb8
	.word	0x81418000	! t0_kref+0x2898:   	mov	%fprs, %g0
	.word	0x8143c000	! t0_kref+0x289c:   	stbar
	.word	0xd640a020	! t0_kref+0x28a0:   	ldsw	[%g2 + 0x20], %o3
	.word	0x94bda3b6	! t0_kref+0x28a4:   	xnorcc	%l6, 0x3b6, %o2
	.word	0x81aa0aa4	! t0_kref+0x28a8:   	fcmpes	%fcc0, %f8, %f4
	.word	0xc53e0000	! t0_kref+0x28ac:   	std	%f2, [%i0]
	.word	0x9865b0d4	! t0_kref+0x28b0:   	subc	%l6, -0xf2c, %o4
	.word	0x9af5f12d	! t0_kref+0x28b4:   	udivcc	%l7, -0xed3, %o5
2:	.word	0x98f5b2d8	! t0_kref+0x28b8:   	udivcc	%l6, -0xd28, %o4
	.word	0xd83e3fe0	! t0_kref+0x28bc:   	std	%o4, [%i0 - 0x20]
	.word	0x9225a874	! t0_kref+0x28c0:   	sub	%l6, 0x874, %o1
	.word	0x969de756	! t0_kref+0x28c4:   	xorcc	%l7, 0x756, %o3
	.word	0x953de00b	! t0_kref+0x28c8:   	sra	%l7, 0xb, %o2
	.word	0x81a208c0	! t0_kref+0x28cc:   	fsubd	%f8, %f0, %f0
	.word	0x9e8d8017	! t0_kref+0x28d0:   	andcc	%l6, %l7, %o7
	.word	0x94ad8017	! t0_kref+0x28d4:   	andncc	%l6, %l7, %o2
	.word	0xc168a08c	! t0_kref+0x28d8:   	prefetch	%g2 + 0x8c, 0
	.word	0x9e258017	! t0_kref+0x28dc:   	sub	%l6, %l7, %o7
	.word	0x85a01901	! t0_kref+0x28e0:   	fitod	%f1, %f2
	.word	0xe0680019	! t0_kref+0x28e4:   	ldstub	[%g0 + %i1], %l0
	.word	0x29800004	! t0_kref+0x28e8:   	fbl,a	_kref+0x28f8
	.word	0x81de8015	! t0_kref+0x28ec:   	flush	%i2 + %l5
	.word	0x92958017	! t0_kref+0x28f0:   	orcc	%l6, %l7, %o1
	.word	0x83a00021	! t0_kref+0x28f4:   	fmovs	%f1, %f1
	.word	0xe66e3fe0	! t0_kref+0x28f8:   	ldstub	[%i0 - 0x20], %l3
	.word	0xec7e0000	! t0_kref+0x28fc:   	swap	[%i0], %l6
	.word	0xe96e001d	! t0_kref+0x2900:   	prefetch	%i0 + %i5, 20
	.word	0x92d5e871	! t0_kref+0x2904:   	umulcc	%l7, 0x871, %o1
	call	SYM(t0_subr3)
	.word	0xd696d019	! t0_kref+0x290c:   	lduha	[%i3 + %i1]0x80, %o3
	.word	0x80bdffcf	! t0_kref+0x2910:   	xnorcc	%l7, -0x31, %g0
	.word	0x80558017	! t0_kref+0x2914:   	umul	%l6, %l7, %g0
	.word	0x89a018c4	! t0_kref+0x2918:   	fdtos	%f4, %f4
	.word	0x9105c017	! t0_kref+0x291c:   	taddcc	%l7, %l7, %o0
	.word	0xd2063fe0	! t0_kref+0x2920:   	ld	[%i0 - 0x20], %o1
	.word	0x90f5f3f8	! t0_kref+0x2924:   	udivcc	%l7, -0xc08, %o0
	.word	0x81a00042	! t0_kref+0x2928:   	fmovd	%f2, %f0
	.word	0x85a04d25	! t0_kref+0x292c:   	fsmuld	%f1, %f5, %f2
	.word	0xd810a020	! t0_kref+0x2930:   	lduh	[%g2 + 0x20], %o4
	.word	0xc9be2004	! t0_kref+0x2934:   	stda	%f4, [%i0 + 4]%asi
	.word	0x8185c000	! t0_kref+0x2938:   	wr	%l7, %g0, %y
	.word	0x34800001	! t0_kref+0x293c:   	bg,a	_kref+0x2940
	.word	0xda166002	! t0_kref+0x2940:   	lduh	[%i1 + 2], %o5
	.word	0xea6e200a	! t0_kref+0x2944:   	ldstub	[%i0 + 0xa], %l5
	.word	0xe968a086	! t0_kref+0x2948:   	prefetch	%g2 + 0x86, 20
	.word	0xd840a014	! t0_kref+0x294c:   	ldsw	[%g2 + 0x14], %o4
	.word	0xe83f4018	! t0_kref+0x2950:   	std	%l4, [%i5 + %i0]
	.word	0xee36001b	! t0_kref+0x2954:   	sth	%l7, [%i0 + %i3]
	.word	0x21800007	! t0_kref+0x2958:   	fbn,a	_kref+0x2974
	.word	0xc9beda18	! t0_kref+0x295c:   	stda	%f4, [%i3 + %i0]0xd0
	.word	0xc5263ff8	! t0_kref+0x2960:   	st	%f2, [%i0 - 8]
	.word	0x85a00d27	! t0_kref+0x2964:   	fsmuld	%f0, %f7, %f2
	.word	0xd1be1897	! t0_kref+0x2968:   	stda	%f8, [%i0 + %l7]0xc4
	.word	0xd27e201c	! t0_kref+0x296c:   	swap	[%i0 + 0x1c], %o1
	.word	0x81a00942	! t0_kref+0x2970:   	fmuld	%f0, %f2, %f0
	.word	0x92458016	! t0_kref+0x2974:   	addc	%l6, %l6, %o1
	.word	0x8045c016	! t0_kref+0x2978:   	addc	%l7, %l6, %g0
	.word	0x9ea5f7fb	! t0_kref+0x297c:   	subcc	%l7, -0x805, %o7
	.word	0x933d8016	! t0_kref+0x2980:   	sra	%l6, %l6, %o1
	.word	0xc1be1857	! t0_kref+0x2984:   	stda	%f0, [%i0 + %l7]0xc2
	.word	0xc5262010	! t0_kref+0x2988:   	st	%f2, [%i0 + 0x10]
	.word	0xfbee501c	! t0_kref+0x298c:   	prefetcha	%i1 + %i4, 29
	.word	0xec267ff8	! t0_kref+0x2990:   	st	%l6, [%i1 - 8]
	.word	0x9665c016	! t0_kref+0x2994:   	subc	%l7, %l6, %o3
	.word	0xde16401b	! t0_kref+0x2998:   	lduh	[%i1 + %i3], %o7
	.word	0x96c5b15b	! t0_kref+0x299c:   	addccc	%l6, -0xea5, %o3
	.word	0x9b3de003	! t0_kref+0x29a0:   	sra	%l7, 0x3, %o5
	.word	0x85a01889	! t0_kref+0x29a4:   	fitos	%f9, %f2
	.word	0x81858000	! t0_kref+0x29a8:   	wr	%l6, %g0, %y
	.word	0x8025b150	! t0_kref+0x29ac:   	sub	%l6, -0xeb0, %g0
	.word	0x83a01a28	! t0_kref+0x29b0:   	fstoi	%f8, %f1
	.word	0x87a000a4	! t0_kref+0x29b4:   	fnegs	%f4, %f3
	.word	0x9005b1d1	! t0_kref+0x29b8:   	add	%l6, -0xe2f, %o0
	.word	0xd840a02c	! t0_kref+0x29bc:   	ldsw	[%g2 + 0x2c], %o4
	.word	0xc1266018	! t0_kref+0x29c0:   	st	%f0, [%i1 + 0x18]
	.word	0x80e58017	! t0_kref+0x29c4:   	subccc	%l6, %l7, %g0
	.word	0x8da1cd27	! t0_kref+0x29c8:   	fsmuld	%f7, %f7, %f6
	.word	0x81aa4a25	! t0_kref+0x29cc:   	fcmps	%fcc0, %f9, %f5
	.word	0x81258017	! t0_kref+0x29d0:   	mulscc	%l6, %l7, %g0
	.word	0x9e65c017	! t0_kref+0x29d4:   	subc	%l7, %l7, %o7
	.word	0x9845b586	! t0_kref+0x29d8:   	addc	%l6, -0xa7a, %o4
	.word	0x90658017	! t0_kref+0x29dc:   	subc	%l6, %l7, %o0
	.word	0xd1be1896	! t0_kref+0x29e0:   	stda	%f8, [%i0 + %l6]0xc4
	.word	0xd64e3fea	! t0_kref+0x29e4:   	ldsb	[%i0 - 0x16], %o3
	.word	0x9845b713	! t0_kref+0x29e8:   	addc	%l6, -0x8ed, %o4
	.word	0x9475f897	! t0_kref+0x29ec:   	udiv	%l7, -0x769, %o2
	.word	0x8185c000	! t0_kref+0x29f0:   	wr	%l7, %g0, %y
	.word	0xd1be3ffe	! t0_kref+0x29f4:   	stda	%f8, [%i0 - 2]%asi
	.word	0xd608a03c	! t0_kref+0x29f8:   	ldub	[%g2 + 0x3c], %o3
	.word	0x8da00029	! t0_kref+0x29fc:   	fmovs	%f9, %f6
	.word	0x9665e56f	! t0_kref+0x2a00:   	subc	%l7, 0x56f, %o3
	.word	0xd648a010	! t0_kref+0x2a04:   	ldsb	[%g2 + 0x10], %o3
	.word	0xec20a034	! t0_kref+0x2a08:   	st	%l6, [%g2 + 0x34]
	.word	0x80658016	! t0_kref+0x2a0c:   	subc	%l6, %l6, %g0
	.word	0x91a01880	! t0_kref+0x2a10:   	fitos	%f0, %f8
	.word	0xcd1fbf40	! t0_kref+0x2a14:   	ldd	[%fp - 0xc0], %f6
	.word	0x81a9ca24	! t0_kref+0x2a18:   	fcmps	%fcc0, %f7, %f4
	.word	0x8045c016	! t0_kref+0x2a1c:   	addc	%l7, %l6, %g0
	.word	0x908d8017	! t0_kref+0x2a20:   	andcc	%l6, %l7, %o0
	.word	0xcd3e4000	! t0_kref+0x2a24:   	std	%f6, [%i1]
	call	1f
	.empty
	.word	0xdade1000	! t0_kref+0x2a2c:   	ldxa	[%i0]0x80, %o5
1:	.word	0xd850a026	! t0_kref+0x2a30:   	ldsh	[%g2 + 0x26], %o4
	.word	0x9a5dbd98	! t0_kref+0x2a34:   	smul	%l6, -0x268, %o5
	.word	0x9ea5c016	! t0_kref+0x2a38:   	subcc	%l7, %l6, %o7
	.word	0xec367fe2	! t0_kref+0x2a3c:   	sth	%l6, [%i1 - 0x1e]
	.word	0x81a88a21	! t0_kref+0x2a40:   	fcmps	%fcc0, %f2, %f1
	.word	0x9e5dc017	! t0_kref+0x2a44:   	smul	%l7, %l7, %o7
	.word	0x91a209c4	! t0_kref+0x2a48:   	fdivd	%f8, %f4, %f8
	.word	0x9a9dad9d	! t0_kref+0x2a4c:   	xorcc	%l6, 0xd9d, %o5
	.word	0x8da24d25	! t0_kref+0x2a50:   	fsmuld	%f9, %f5, %f6
	.word	0x94558016	! t0_kref+0x2a54:   	umul	%l6, %l6, %o2
	.word	0x98f5e755	! t0_kref+0x2a58:   	udivcc	%l7, 0x755, %o4
	.word	0xd84e6001	! t0_kref+0x2a5c:   	ldsb	[%i1 + 1], %o4
	.word	0xd87e001c	! t0_kref+0x2a60:   	swap	[%i0 + %i4], %o4
	.word	0x9e75aa9a	! t0_kref+0x2a64:   	udiv	%l6, 0xa9a, %o7
	.word	0x9495b057	! t0_kref+0x2a68:   	orcc	%l6, -0xfa9, %o2
	.word	0x8045c017	! t0_kref+0x2a6c:   	addc	%l7, %l7, %g0
	.word	0x89a08940	! t0_kref+0x2a70:   	fmuld	%f2, %f0, %f4
	.word	0x9ae5c017	! t0_kref+0x2a74:   	subccc	%l7, %l7, %o5
	.word	0x9ae5e1c4	! t0_kref+0x2a78:   	subccc	%l7, 0x1c4, %o5
	.word	0x81a80aa8	! t0_kref+0x2a7c:   	fcmpes	%fcc0, %f0, %f8
	.word	0x9a3d8016	! t0_kref+0x2a80:   	xnor	%l6, %l6, %o5
	.word	0xd010a034	! t0_kref+0x2a84:   	lduh	[%g2 + 0x34], %o0
	.word	0x81a98a23	! t0_kref+0x2a88:   	fcmps	%fcc0, %f6, %f3
	.word	0x85a20944	! t0_kref+0x2a8c:   	fmuld	%f8, %f4, %f2
	.word	0x9ed58017	! t0_kref+0x2a90:   	umulcc	%l6, %l7, %o7
	.word	0x8170243c	! t0_kref+0x2a94:   	popc	0x43c, %g0
	.word	0x91a00923	! t0_kref+0x2a98:   	fmuls	%f0, %f3, %f8
	.word	0xc19e7ff0	! t0_kref+0x2a9c:   	ldda	[%i1 - 0x10]%asi, %f0
	.word	0x3c480007	! t0_kref+0x2aa0:   	bpos,a,pt	%icc, _kref+0x2abc
	.word	0xc99e6012	! t0_kref+0x2aa4:   	ldda	[%i1 + 0x12]%asi, %f4
	.word	0xe0180018	! t0_kref+0x2aa8:   	ldd	[%g0 + %i0], %l0
	.word	0x81a01881	! t0_kref+0x2aac:   	fitos	%f1, %f0
	.word	0x9275af9a	! t0_kref+0x2ab0:   	udiv	%l6, 0xf9a, %o1
	.word	0x9a0daa75	! t0_kref+0x2ab4:   	and	%l6, 0xa75, %o5
	.word	0x94d5c016	! t0_kref+0x2ab8:   	umulcc	%l7, %l6, %o2
	.word	0x968dc017	! t0_kref+0x2abc:   	andcc	%l7, %l7, %o3
	.word	0xd608a001	! t0_kref+0x2ac0:   	ldub	[%g2 + 1], %o3
	.word	0xc168a083	! t0_kref+0x2ac4:   	prefetch	%g2 + 0x83, 0
	.word	0xe8be101d	! t0_kref+0x2ac8:   	stda	%l4, [%i0 + %i5]0x80
	.word	0x85a01102	! t0_kref+0x2acc:   	fxtod	%f2, %f2
	.word	0x988db1ac	! t0_kref+0x2ad0:   	andcc	%l6, -0xe54, %o4
	.word	0x85a049a5	! t0_kref+0x2ad4:   	fdivs	%f1, %f5, %f2
	.word	0x39800004	! t0_kref+0x2ad8:   	fbuge,a	_kref+0x2ae8
	.word	0x85a04d23	! t0_kref+0x2adc:   	fsmuld	%f1, %f3, %f2
	.word	0x907dafa6	! t0_kref+0x2ae0:   	sdiv	%l6, 0xfa6, %o0
	.word	0x81a88ac0	! t0_kref+0x2ae4:   	fcmped	%fcc0, %f2, %f0
	.word	0x9045f5f5	! t0_kref+0x2ae8:   	addc	%l7, -0xa0b, %o0
	.word	0x92bdc016	! t0_kref+0x2aec:   	xnorcc	%l7, %l6, %o1
	.word	0xc006401c	! t0_kref+0x2af0:   	ld	[%i1 + %i4], %g0
	.word	0x80a5c016	! t0_kref+0x2af4:   	cmp	%l7, %l6
	.word	0xcd1f4018	! t0_kref+0x2af8:   	ldd	[%i5 + %i0], %f6
	.word	0x98e5b194	! t0_kref+0x2afc:   	subccc	%l6, -0xe6c, %o4
	.word	0x9025fef6	! t0_kref+0x2b00:   	sub	%l7, -0x10a, %o0
	.word	0x8da00942	! t0_kref+0x2b04:   	fmuld	%f0, %f2, %f6
	.word	0x8da00022	! t0_kref+0x2b08:   	fmovs	%f2, %f6
	.word	0xf36e6018	! t0_kref+0x2b0c:   	prefetch	%i1 + 0x18, 25
	.word	0xf96e401c	! t0_kref+0x2b10:   	prefetch	%i1 + %i4, 28
	.word	0x923dec07	! t0_kref+0x2b14:   	xnor	%l7, 0xc07, %o1
	.word	0xcba71019	! t0_kref+0x2b18:   	sta	%f5, [%i4 + %i1]0x80
	.word	0x89a01048	! t0_kref+0x2b1c:   	fdtox	%f8, %f4
	.word	0xc807bff0	! t0_kref+0x2b20:   	ld	[%fp - 0x10], %g4
	.word	0x9a45f682	! t0_kref+0x2b24:   	addc	%l7, -0x97e, %o5
	.word	0x87a0c9a8	! t0_kref+0x2b28:   	fdivs	%f3, %f8, %f3
	.word	0x27800008	! t0_kref+0x2b2c:   	fbul,a	_kref+0x2b4c
	.word	0x99400000	! t0_kref+0x2b30:   	mov	%y, %o4
	.word	0x81a00942	! t0_kref+0x2b34:   	fmuld	%f0, %f2, %f0
	.word	0xda063ffc	! t0_kref+0x2b38:   	ld	[%i0 - 4], %o5
	.word	0xd11e7fe8	! t0_kref+0x2b3c:   	ldd	[%i1 - 0x18], %f8
	.word	0x8ba018c0	! t0_kref+0x2b40:   	fdtos	%f0, %f5
	.word	0x93a000a4	! t0_kref+0x2b44:   	fnegs	%f4, %f9
	.word	0x2b800005	! t0_kref+0x2b48:   	fbug,a	_kref+0x2b5c
	.word	0x8da01921	! t0_kref+0x2b4c:   	fstod	%f1, %f6
	.word	0x2b800008	! t0_kref+0x2b50:   	fbug,a	_kref+0x2b70
	.word	0x85a01885	! t0_kref+0x2b54:   	fitos	%f5, %f2
	.word	0x96f5ffb7	! t0_kref+0x2b58:   	udivcc	%l7, -0x49, %o3
	.word	0xd11fbcf0	! t0_kref+0x2b5c:   	ldd	[%fp - 0x310], %f8
	.word	0x9235f763	! t0_kref+0x2b60:   	orn	%l7, -0x89d, %o1
	.word	0x93a189a3	! t0_kref+0x2b64:   	fdivs	%f6, %f3, %f9
	.word	0xd300a028	! t0_kref+0x2b68:   	ld	[%g2 + 0x28], %f9
	call	SYM(t0_subr2)
	.word	0xe8981018	! t0_kref+0x2b70:   	ldda	[%g0 + %i0]0x80, %l4
	.word	0xe87e200c	! t0_kref+0x2b74:   	swap	[%i0 + 0xc], %l4
	sethi	%hi(2f), %o7
	.word	0xe40be3c0	! t0_kref+0x2b7c:   	ldub	[%o7 + 0x3c0], %l2
	.word	0xa41ca00c	! t0_kref+0x2b80:   	xor	%l2, 0xc, %l2
	.word	0xe42be3c0	! t0_kref+0x2b84:   	stb	%l2, [%o7 + 0x3c0]
	.word	0x81dbe3c0	! t0_kref+0x2b88:   	flush	%o7 + 0x3c0
	.word	0x91a10946	! t0_kref+0x2b8c:   	fmuld	%f4, %f6, %f8
	.word	0xd24e001a	! t0_kref+0x2b90:   	ldsb	[%i0 + %i2], %o1
	.word	0x9075e9d8	! t0_kref+0x2b94:   	udiv	%l7, 0x9d8, %o0
	.word	0x803d8016	! t0_kref+0x2b98:   	xnor	%l6, %l6, %g0
	.word	0xc568a049	! t0_kref+0x2b9c:   	prefetch	%g2 + 0x49, 2
	.word	0x89a000a2	! t0_kref+0x2ba0:   	fnegs	%f2, %f4
	.word	0x9425bd91	! t0_kref+0x2ba4:   	sub	%l6, -0x26f, %o2
	.word	0x35800005	! t0_kref+0x2ba8:   	fbue,a	_kref+0x2bbc
	.word	0x87a8c025	! t0_kref+0x2bac:   	fmovsul	%fcc0, %f5, %f3
	.word	0x87a00025	! t0_kref+0x2bb0:   	fmovs	%f5, %f3
	.word	0xcd3e0000	! t0_kref+0x2bb4:   	std	%f6, [%i0]
	.word	0x9095c016	! t0_kref+0x2bb8:   	orcc	%l7, %l6, %o0
	.word	0x90ad8016	! t0_kref+0x2bbc:   	andncc	%l6, %l6, %o0
2:	.word	0x9445a147	! t0_kref+0x2bc0:   	addc	%l6, 0x147, %o2
	.word	0x91a01a23	! t0_kref+0x2bc4:   	fstoi	%f3, %f8
	.word	0x170a3e0b	! t0_kref+0x2bc8:   	sethi	%hi(0x28f82c00), %o3
	.word	0x3b800008	! t0_kref+0x2bcc:   	fble,a	_kref+0x2bec
	.word	0xee6e8018	! t0_kref+0x2bd0:   	ldstub	[%i2 + %i0], %l7
	.word	0x9495c016	! t0_kref+0x2bd4:   	orcc	%l7, %l6, %o2
	.word	0x808dc016	! t0_kref+0x2bd8:   	btst	%l6, %l7
	.word	0xc19eda58	! t0_kref+0x2bdc:   	ldda	[%i3 + %i0]0xd2, %f0
	.word	0xcb200018	! t0_kref+0x2be0:   	st	%f5, [%g0 + %i0]
	.word	0xee20a010	! t0_kref+0x2be4:   	st	%l7, [%g2 + 0x10]
	.word	0xd816c019	! t0_kref+0x2be8:   	lduh	[%i3 + %i1], %o4
	.word	0x91a01906	! t0_kref+0x2bec:   	fitod	%f6, %f8
	.word	0x805dae42	! t0_kref+0x2bf0:   	smul	%l6, 0xe42, %g0
	.word	0x85a188c8	! t0_kref+0x2bf4:   	fsubd	%f6, %f8, %f2
	.word	0x81a98a21	! t0_kref+0x2bf8:   	fcmps	%fcc0, %f6, %f1
	.word	0x9ea5be99	! t0_kref+0x2bfc:   	subcc	%l6, -0x167, %o7
	.word	0x91a088c2	! t0_kref+0x2c00:   	fsubd	%f2, %f2, %f8
	.word	0x9ab5e5af	! t0_kref+0x2c04:   	orncc	%l7, 0x5af, %o5
	.word	0xf96e6010	! t0_kref+0x2c08:   	prefetch	%i1 + 0x10, 28
	.word	0x9535a005	! t0_kref+0x2c0c:   	srl	%l6, 0x5, %o2
	.word	0x93a089a8	! t0_kref+0x2c10:   	fdivs	%f2, %f8, %f9
	.word	0x9ee58016	! t0_kref+0x2c14:   	subccc	%l6, %l6, %o7
	.word	0x91a008c8	! t0_kref+0x2c18:   	fsubd	%f0, %f8, %f8
	.word	0x81700017	! t0_kref+0x2c1c:   	popc	%l7, %g0
	.word	0x8185c000	! t0_kref+0x2c20:   	wr	%l7, %g0, %y
	.word	0x8143e040	! t0_kref+0x2c24:   	membar	0x40
	.word	0x8143e040	! t0_kref+0x2c28:   	membar	0x40
	.word	0x9095bf97	! t0_kref+0x2c2c:   	orcc	%l6, -0x69, %o0
	.word	0x953da009	! t0_kref+0x2c30:   	sra	%l6, 0x9, %o2
	.word	0x9addc016	! t0_kref+0x2c34:   	smulcc	%l7, %l6, %o5
	.word	0x87a0c9a2	! t0_kref+0x2c38:   	fdivs	%f3, %f2, %f3
	.word	0xee366016	! t0_kref+0x2c3c:   	sth	%l7, [%i1 + 0x16]
	.word	0x89a000a2	! t0_kref+0x2c40:   	fnegs	%f2, %f4
	.word	0xec26201c	! t0_kref+0x2c44:   	st	%l6, [%i0 + 0x1c]
	.word	0x9225c016	! t0_kref+0x2c48:   	sub	%l7, %l6, %o1
	.word	0x941d8016	! t0_kref+0x2c4c:   	xor	%l6, %l6, %o2
	.word	0x9335e007	! t0_kref+0x2c50:   	srl	%l7, 0x7, %o1
	.word	0xea6e3ff8	! t0_kref+0x2c54:   	ldstub	[%i0 - 8], %l5
	.word	0x85a00048	! t0_kref+0x2c58:   	fmovd	%f8, %f2
	.word	0xc51fbdc8	! t0_kref+0x2c5c:   	ldd	[%fp - 0x238], %f2
	.word	0x8610201b	! t0_kref+0x2c60:   	mov	0x1b, %g3
	.word	0x86a0e001	! t0_kref+0x2c64:   	subcc	%g3, 1, %g3
	.word	0x22800019	! t0_kref+0x2c68:   	be,a	_kref+0x2ccc
	.word	0x9b3da018	! t0_kref+0x2c6c:   	sra	%l6, 0x18, %o5
	.word	0x91418000	! t0_kref+0x2c70:   	mov	%fprs, %o0
	.word	0x9735e01e	! t0_kref+0x2c74:   	srl	%l7, 0x1e, %o3
	.word	0x85a01a20	! t0_kref+0x2c78:   	fstoi	%f0, %f2
	.word	0xe8680019	! t0_kref+0x2c7c:   	ldstub	[%g0 + %i1], %l4
	.word	0x81a9caa3	! t0_kref+0x2c80:   	fcmpes	%fcc0, %f7, %f3
	.word	0x9a9df29f	! t0_kref+0x2c84:   	xorcc	%l7, -0xd61, %o5
	.word	0x99258016	! t0_kref+0x2c88:   	mulscc	%l6, %l6, %o4
	.word	0x87a0c9a5	! t0_kref+0x2c8c:   	fdivs	%f3, %f5, %f3
	.word	0x9aa58017	! t0_kref+0x2c90:   	subcc	%l6, %l7, %o5
	.word	0x989db4e8	! t0_kref+0x2c94:   	xorcc	%l6, -0xb18, %o4
	.word	0x8da00140	! t0_kref+0x2c98:   	fabsd	%f0, %f6
	.word	0x81a01908	! t0_kref+0x2c9c:   	fitod	%f8, %f0
	.word	0x8ba018c2	! t0_kref+0x2ca0:   	fdtos	%f2, %f5
	.word	0x992de002	! t0_kref+0x2ca4:   	sll	%l7, 0x2, %o4
	.word	0x81aa4a25	! t0_kref+0x2ca8:   	fcmps	%fcc0, %f9, %f5
	.word	0xc53e2018	! t0_kref+0x2cac:   	std	%f2, [%i0 + 0x18]
	.word	0x9065ee4d	! t0_kref+0x2cb0:   	subc	%l7, 0xe4d, %o0
	.word	0x960d8016	! t0_kref+0x2cb4:   	and	%l6, %l6, %o3
	.word	0x81aa0ac8	! t0_kref+0x2cb8:   	fcmped	%fcc0, %f8, %f8
	.word	0xe968a006	! t0_kref+0x2cbc:   	prefetch	%g2 + 6, 20
	.word	0xc0ee9019	! t0_kref+0x2cc0:   	ldstuba	[%i2 + %i1]0x80, %g0
	.word	0x81a90a22	! t0_kref+0x2cc4:   	fcmps	%fcc0, %f4, %f2
	.word	0x9695aa14	! t0_kref+0x2cc8:   	orcc	%l6, 0xa14, %o3
	.word	0xe01e7fe0	! t0_kref+0x2ccc:   	ldd	[%i1 - 0x20], %l0
	sethi	%hi(2f), %o7
	.word	0xe40be110	! t0_kref+0x2cd4:   	ldub	[%o7 + 0x110], %l2
	.word	0xa41ca00c	! t0_kref+0x2cd8:   	xor	%l2, 0xc, %l2
	.word	0xe42be110	! t0_kref+0x2cdc:   	stb	%l2, [%o7 + 0x110]
	.word	0x81dbe110	! t0_kref+0x2ce0:   	flush	%o7 + 0x110
	.word	0xd4df5019	! t0_kref+0x2ce4:   	ldxa	[%i5 + %i1]0x80, %o2
	.word	0x905d8017	! t0_kref+0x2ce8:   	smul	%l6, %l7, %o0
	.word	0xd11fbc58	! t0_kref+0x2cec:   	ldd	[%fp - 0x3a8], %f8
	.word	0x91a20d21	! t0_kref+0x2cf0:   	fsmuld	%f8, %f1, %f8
	.word	0xc9264000	! t0_kref+0x2cf4:   	st	%f4, [%i1]
	.word	0x89a01924	! t0_kref+0x2cf8:   	fstod	%f4, %f4
	.word	0x908dc016	! t0_kref+0x2cfc:   	andcc	%l7, %l6, %o0
	.word	0xc13e7ff0	! t0_kref+0x2d00:   	std	%f0, [%i1 - 0x10]
	.word	0x98bdfa85	! t0_kref+0x2d04:   	xnorcc	%l7, -0x57b, %o4
	.word	0xc11fbe20	! t0_kref+0x2d08:   	ldd	[%fp - 0x1e0], %f0
	.word	0xc5266008	! t0_kref+0x2d0c:   	st	%f2, [%i1 + 8]
2:	.word	0xee263fe4	! t0_kref+0x2d10:   	st	%l7, [%i0 - 0x1c]
	.word	0xd43e3fe8	! t0_kref+0x2d14:   	std	%o2, [%i0 - 0x18]
	.word	0x91a00025	! t0_kref+0x2d18:   	fmovs	%f5, %f8
	.word	0x81a80aa6	! t0_kref+0x2d1c:   	fcmpes	%fcc0, %f0, %f6
	.word	0xee367ffa	! t0_kref+0x2d20:   	sth	%l7, [%i1 - 6]
	.word	0x85a01928	! t0_kref+0x2d24:   	fstod	%f8, %f2
	.word	0xd65e0000	! t0_kref+0x2d28:   	ldx	[%i0], %o3
	.word	0xd82839ab	! t0_kref+0x2d2c:   	stb	%o4, [%g0 - 0x655]
	.word	0x93a00824	! t0_kref+0x2d30:   	fadds	%f0, %f4, %f9
	.word	0x1b0f781c	! t0_kref+0x2d34:   	sethi	%hi(0x3de07000), %o5
	.word	0x8ba00028	! t0_kref+0x2d38:   	fmovs	%f8, %f5
	.word	0xd6066004	! t0_kref+0x2d3c:   	ld	[%i1 + 4], %o3
	.word	0x89a01040	! t0_kref+0x2d40:   	fdtox	%f0, %f4
	.word	0xec28a03b	! t0_kref+0x2d44:   	stb	%l6, [%g2 + 0x3b]
	.word	0x81a009a0	! t0_kref+0x2d48:   	fdivs	%f0, %f0, %f0
	.word	0xe3e61016	! t0_kref+0x2d4c:   	casa	[%i0]0x80, %l6, %l1
	.word	0xdbe61017	! t0_kref+0x2d50:   	casa	[%i0]0x80, %l7, %o5
	.word	0x91a00948	! t0_kref+0x2d54:   	fmuld	%f0, %f8, %f8
	sethi	%hi(1f), %o7
	jmpl	%o7+%lo(1f), %g1
	.empty
	.word	0x925df829	! t0_kref+0x2d60:   	smul	%l7, -0x7d7, %o1
	.word	0x80c5fde7	! t0_kref+0x2d64:   	addccc	%l7, -0x219, %g0
	.word	0xee367fe8	! t0_kref+0x2d68:   	sth	%l7, [%i1 - 0x18]
	.word	0x8143c000	! t0_kref+0x2d6c:   	stbar
	.word	0x98adf4c0	! t0_kref+0x2d70:   	andncc	%l7, -0xb40, %o4
	.word	0x81a01921	! t0_kref+0x2d74:   	fstod	%f1, %f0
1:	.word	0xe8780018	! t0_kref+0x2d78:   	swap	[%g0 + %i0], %l4
	.word	0x8fa000a0	! t0_kref+0x2d7c:   	fnegs	%f0, %f7
	.word	0xc7ee1016	! t0_kref+0x2d80:   	prefetcha	%i0 + %l6, 3
	.word	0x813d8016	! t0_kref+0x2d84:   	sra	%l6, %l6, %g0
	.word	0x9205a134	! t0_kref+0x2d88:   	add	%l6, 0x134, %o1
	.word	0x985d8016	! t0_kref+0x2d8c:   	smul	%l6, %l6, %o4
	.word	0xd1067ff0	! t0_kref+0x2d90:   	ld	[%i1 - 0x10], %f8
	.word	0x85a00948	! t0_kref+0x2d94:   	fmuld	%f0, %f8, %f2
	.word	0x81a80ac2	! t0_kref+0x2d98:   	fcmped	%fcc0, %f0, %f2
	.word	0x9a45b789	! t0_kref+0x2d9c:   	addc	%l6, -0x877, %o5
	.word	0xc19f1a59	! t0_kref+0x2da0:   	ldda	[%i4 + %i1]0xd2, %f0
	.word	0x9ac5c016	! t0_kref+0x2da4:   	addccc	%l7, %l6, %o5
	.word	0x8da00842	! t0_kref+0x2da8:   	faddd	%f0, %f2, %f6
	.word	0xc9be1a5d	! t0_kref+0x2dac:   	stda	%f4, [%i0 + %i5]0xd2
	.word	0xe83e3ff0	! t0_kref+0x2db0:   	std	%l4, [%i0 - 0x10]
	.word	0x9f40c000	! t0_kref+0x2db4:   	mov	%asi, %o7
	.word	0x81a88aa0	! t0_kref+0x2db8:   	fcmpes	%fcc0, %f2, %f0
	.word	0xc9be5896	! t0_kref+0x2dbc:   	stda	%f4, [%i1 + %l6]0xc4
	.word	0x9a65c017	! t0_kref+0x2dc0:   	subc	%l7, %l7, %o5
	.word	0xe40860b0	! t0_kref+0x2dc4:   	ldub	[%g1 + 0xb0], %l2
	.word	0xa41ca00c	! t0_kref+0x2dc8:   	xor	%l2, 0xc, %l2
	.word	0xe42860b0	! t0_kref+0x2dcc:   	stb	%l2, [%g1 + 0xb0]
	.word	0x81d860b0	! t0_kref+0x2dd0:   	flush	%g1 + 0xb0
	.word	0xc9be9a18	! t0_kref+0x2dd4:   	stda	%f4, [%i2 + %i0]0xd0
	.word	0xcd1e001d	! t0_kref+0x2dd8:   	ldd	[%i0 + %i5], %f6
	.word	0xc13e4000	! t0_kref+0x2ddc:   	std	%f0, [%i1]
	.word	0xcd3e0000	! t0_kref+0x2de0:   	std	%f6, [%i0]
	.word	0xe56e6000	! t0_kref+0x2de4:   	prefetch	%i1, 18
	.word	0x11310c59	! t0_kref+0x2de8:   	sethi	%hi(0xc4316400), %o0
	.word	0x93a00022	! t0_kref+0x2dec:   	fmovs	%f2, %f9
	.word	0xe83e7ff0	! t0_kref+0x2df0:   	std	%l4, [%i1 - 0x10]
	.word	0xd07e201c	! t0_kref+0x2df4:   	swap	[%i0 + 0x1c], %o0
	.word	0xde4e8018	! t0_kref+0x2df8:   	ldsb	[%i2 + %i0], %o7
	.word	0x8065a842	! t0_kref+0x2dfc:   	subc	%l6, 0x842, %g0
	.word	0x8d858017	! t0_kref+0x2e00:   	wr	%l6, %l7, %fprs
	.word	0xd83e2000	! t0_kref+0x2e04:   	std	%o4, [%i0]
	.word	0x81dd4000	! t0_kref+0x2e08:   	flush	%l5
2:	.word	0x9e958017	! t0_kref+0x2e0c:   	orcc	%l6, %l7, %o7
	.word	0x8095e59b	! t0_kref+0x2e10:   	orcc	%l7, 0x59b, %g0
	.word	0xecae9019	! t0_kref+0x2e14:   	stba	%l6, [%i2 + %i1]0x80
	.word	0x81dc7ce3	! t0_kref+0x2e18:   	flush	%l1 - 0x31d
	.word	0xd6c01018	! t0_kref+0x2e1c:   	ldswa	[%g0 + %i0]0x80, %o3
	.word	0x93a149a5	! t0_kref+0x2e20:   	fdivs	%f5, %f5, %f9
	.word	0xd24e001a	! t0_kref+0x2e24:   	ldsb	[%i0 + %i2], %o1
	.word	0x85a01901	! t0_kref+0x2e28:   	fitod	%f1, %f2
	.word	0x9ec5b6f0	! t0_kref+0x2e2c:   	addccc	%l6, -0x910, %o7
	.word	0x93400000	! t0_kref+0x2e30:   	mov	%y, %o1
	.word	0xcd00a000	! t0_kref+0x2e34:   	ld	[%g2], %f6
	.word	0x878020d0	! t0_kref+0x2e38:   	mov	0xd0, %asi
	.word	0xd83e0000	! t0_kref+0x2e3c:   	std	%o4, [%i0]
	.word	0xe81f4018	! t0_kref+0x2e40:   	ldd	[%i5 + %i0], %l4
	.word	0x80258016	! t0_kref+0x2e44:   	sub	%l6, %l6, %g0
	.word	0x9eadf689	! t0_kref+0x2e48:   	andncc	%l7, -0x977, %o7
	.word	0xec300018	! t0_kref+0x2e4c:   	sth	%l6, [%g0 + %i0]
	.word	0x87a149a8	! t0_kref+0x2e50:   	fdivs	%f5, %f8, %f3
	.word	0x9255b964	! t0_kref+0x2e54:   	umul	%l6, -0x69c, %o1
	.word	0xc19f5a59	! t0_kref+0x2e58:   	ldda	[%i5 + %i1]0xd2, %f0
	.word	0xec2e8018	! t0_kref+0x2e5c:   	stb	%l6, [%i2 + %i0]
	.word	0x9fc10000	! t0_kref+0x2e60:   	call	%g4
	.word	0xd03e001d	! t0_kref+0x2e64:   	std	%o0, [%i0 + %i5]
	.word	0x9865c017	! t0_kref+0x2e68:   	subc	%l7, %l7, %o4
	.word	0xd1be1817	! t0_kref+0x2e6c:   	stda	%f8, [%i0 + %l7]0xc0
	.word	0x89a188c2	! t0_kref+0x2e70:   	fsubd	%f6, %f2, %f4
	.word	0x9865c016	! t0_kref+0x2e74:   	subc	%l7, %l6, %o4
	.word	0xd19e5a5b	! t0_kref+0x2e78:   	ldda	[%i1 + %i3]0xd2, %f8
	.word	0x96e5bb1d	! t0_kref+0x2e7c:   	subccc	%l6, -0x4e3, %o3
	.word	0x90b5c016	! t0_kref+0x2e80:   	orncc	%l7, %l6, %o0
	.word	0xd040a02c	! t0_kref+0x2e84:   	ldsw	[%g2 + 0x2c], %o0
	sethi	%hi(2f), %o7
	.word	0xe40be2a4	! t0_kref+0x2e8c:   	ldub	[%o7 + 0x2a4], %l2
	.word	0xa41ca00c	! t0_kref+0x2e90:   	xor	%l2, 0xc, %l2
	.word	0xe42be2a4	! t0_kref+0x2e94:   	stb	%l2, [%o7 + 0x2a4]
	.word	0x81dbe2a4	! t0_kref+0x2e98:   	flush	%o7 + 0x2a4
	.word	0x90958017	! t0_kref+0x2e9c:   	orcc	%l6, %l7, %o0
	.word	0x9a758017	! t0_kref+0x2ea0:   	udiv	%l6, %l7, %o5
2:	.word	0xd83e2018	! t0_kref+0x2ea4:   	std	%o4, [%i0 + 0x18]
	.word	0x9aadc017	! t0_kref+0x2ea8:   	andncc	%l7, %l7, %o5
	.word	0x90bda156	! t0_kref+0x2eac:   	xnorcc	%l6, 0x156, %o0
	.word	0xd0163ff6	! t0_kref+0x2eb0:   	lduh	[%i0 - 0xa], %o0
	.word	0x933dc016	! t0_kref+0x2eb4:   	sra	%l7, %l6, %o1
	.word	0x9e25c016	! t0_kref+0x2eb8:   	sub	%l7, %l6, %o7
	.word	0x94c5c016	! t0_kref+0x2ebc:   	addccc	%l7, %l6, %o2
	.word	0x85a00842	! t0_kref+0x2ec0:   	faddd	%f0, %f2, %f2
	.word	0x9665b69c	! t0_kref+0x2ec4:   	subc	%l6, -0x964, %o3
	.word	0xd408a007	! t0_kref+0x2ec8:   	ldub	[%g2 + 7], %o2
	.word	0x89a08940	! t0_kref+0x2ecc:   	fmuld	%f2, %f0, %f4
	.word	0xc19f5a59	! t0_kref+0x2ed0:   	ldda	[%i5 + %i1]0xd2, %f0
	.word	0xc91fbf60	! t0_kref+0x2ed4:   	ldd	[%fp - 0xa0], %f4
	sethi	%hi(2f), %o7
	.word	0xe40be308	! t0_kref+0x2edc:   	ldub	[%o7 + 0x308], %l2
	.word	0xa41ca00c	! t0_kref+0x2ee0:   	xor	%l2, 0xc, %l2
	.word	0xe42be308	! t0_kref+0x2ee4:   	stb	%l2, [%o7 + 0x308]
	.word	0x81dbe308	! t0_kref+0x2ee8:   	flush	%o7 + 0x308
	.word	0x9abd8017	! t0_kref+0x2eec:   	xnorcc	%l6, %l7, %o5
	.word	0xec3f4019	! t0_kref+0x2ef0:   	std	%l6, [%i5 + %i1]
	.word	0x83a01882	! t0_kref+0x2ef4:   	fitos	%f2, %f1
	.word	0xc5263fe4	! t0_kref+0x2ef8:   	st	%f2, [%i0 - 0x1c]
	.word	0xec2e201e	! t0_kref+0x2efc:   	stb	%l6, [%i0 + 0x1e]
	.word	0xd19f5a58	! t0_kref+0x2f00:   	ldda	[%i5 + %i0]0xd2, %f8
	.word	0x9e75c017	! t0_kref+0x2f04:   	udiv	%l7, %l7, %o7
2:	.word	0x953dc017	! t0_kref+0x2f08:   	sra	%l7, %l7, %o2
	.word	0x89a000a4	! t0_kref+0x2f0c:   	fnegs	%f4, %f4
	.word	0x90758016	! t0_kref+0x2f10:   	udiv	%l6, %l6, %o0
	.word	0x91a10946	! t0_kref+0x2f14:   	fmuld	%f4, %f6, %f8
	.word	0x91a20946	! t0_kref+0x2f18:   	fmuld	%f8, %f6, %f8
	.word	0x8da089a4	! t0_kref+0x2f1c:   	fdivs	%f2, %f4, %f6
	.word	0xe8bf5019	! t0_kref+0x2f20:   	stda	%l4, [%i5 + %i1]0x80
	.word	0x83a01a28	! t0_kref+0x2f24:   	fstoi	%f8, %f1
	.word	0x9045b6c2	! t0_kref+0x2f28:   	addc	%l6, -0x93e, %o0
	.word	0xeea65000	! t0_kref+0x2f2c:   	sta	%l7, [%i1]0x80
	.word	0xe408620c	! t0_kref+0x2f30:   	ldub	[%g1 + 0x20c], %l2
	.word	0xa41ca00c	! t0_kref+0x2f34:   	xor	%l2, 0xc, %l2
	.word	0xe428620c	! t0_kref+0x2f38:   	stb	%l2, [%g1 + 0x20c]
	.word	0x81d8620c	! t0_kref+0x2f3c:   	flush	%g1 + 0x20c
	.word	0x9ac5f53a	! t0_kref+0x2f40:   	addccc	%l7, -0xac6, %o5
	.word	0x98358017	! t0_kref+0x2f44:   	orn	%l6, %l7, %o4
	.word	0xd210a018	! t0_kref+0x2f48:   	lduh	[%g2 + 0x18], %o1
	.word	0xc1be5816	! t0_kref+0x2f4c:   	stda	%f0, [%i1 + %l6]0xc0
	.word	0x83a01a28	! t0_kref+0x2f50:   	fstoi	%f8, %f1
	.word	0x91a01a46	! t0_kref+0x2f54:   	fdtoi	%f6, %f8
	.word	0x9e0d8017	! t0_kref+0x2f58:   	and	%l6, %l7, %o7
	.word	0x9a35f7ff	! t0_kref+0x2f5c:   	orn	%l7, -0x801, %o5
	.word	0x13185d54	! t0_kref+0x2f60:   	sethi	%hi(0x61755000), %o1
	.word	0x8da08944	! t0_kref+0x2f64:   	fmuld	%f2, %f4, %f6
2:	.word	0xded01018	! t0_kref+0x2f68:   	ldsha	[%g0 + %i0]0x80, %o7
	.word	0xc13f4018	! t0_kref+0x2f6c:   	std	%f0, [%i5 + %i0]
	.word	0x9425b82e	! t0_kref+0x2f70:   	sub	%l6, -0x7d2, %o2
	.word	0x92f5c017	! t0_kref+0x2f74:   	udivcc	%l7, %l7, %o1
	.word	0xd4164000	! t0_kref+0x2f78:   	lduh	[%i1], %o2
	.word	0x81dc3113	! t0_kref+0x2f7c:   	flush	%l0 - 0xeed
	.word	0xd606001c	! t0_kref+0x2f80:   	ld	[%i0 + %i4], %o3
	.word	0x9f2de000	! t0_kref+0x2f84:   	sll	%l7, 0x0, %o7
	.word	0x9895ae41	! t0_kref+0x2f88:   	orcc	%l6, 0xe41, %o4
	.word	0x2d800006	! t0_kref+0x2f8c:   	fbg,a	_kref+0x2fa4
	.word	0x92a5ff20	! t0_kref+0x2f90:   	subcc	%l7, -0xe0, %o1
	.word	0x9ae5c017	! t0_kref+0x2f94:   	subccc	%l7, %l7, %o5
	.word	0x970dbc9d	! t0_kref+0x2f98:   	tsubcc	%l6, -0x363, %o3
	.word	0x920db213	! t0_kref+0x2f9c:   	and	%l6, -0xded, %o1
	.word	0x9435ebb0	! t0_kref+0x2fa0:   	orn	%l7, 0xbb0, %o2
	.word	0xd27e3ff8	! t0_kref+0x2fa4:   	swap	[%i0 - 8], %o1
	.word	0xd6064000	! t0_kref+0x2fa8:   	ld	[%i1], %o3
	.word	0xd100a02c	! t0_kref+0x2fac:   	ld	[%g2 + 0x2c], %f8
	.word	0x8bab0023	! t0_kref+0x2fb0:   	fmovsuge	%fcc0, %f3, %f5
	.word	0x9fc00004	! t0_kref+0x2fb4:   	call	%g0 + %g4
	.word	0x99700017	! t0_kref+0x2fb8:   	popc	%l7, %o4
	.word	0x9445e6a2	! t0_kref+0x2fbc:   	addc	%l7, 0x6a2, %o2
	.word	0xf9ee501b	! t0_kref+0x2fc0:   	prefetcha	%i1 + %i3, 28
	.word	0xe1f61017	! t0_kref+0x2fc4:   	casxa	[%i0]0x80, %l7, %l0
	.word	0xd448a025	! t0_kref+0x2fc8:   	ldsb	[%g2 + 0x25], %o2
	.word	0xee7f0019	! t0_kref+0x2fcc:   	swap	[%i4 + %i1], %l7
	.word	0x9b35a00e	! t0_kref+0x2fd0:   	srl	%l6, 0xe, %o5
	.word	0x8ba089a4	! t0_kref+0x2fd4:   	fdivs	%f2, %f4, %f5
	.word	0x940db6aa	! t0_kref+0x2fd8:   	and	%l6, -0x956, %o2
	.word	0x98a5c017	! t0_kref+0x2fdc:   	subcc	%l7, %l7, %o4
	.word	0xc100a008	! t0_kref+0x2fe0:   	ld	[%g2 + 8], %f0
	.word	0x913da007	! t0_kref+0x2fe4:   	sra	%l6, 0x7, %o0
	.word	0xee36401b	! t0_kref+0x2fe8:   	sth	%l7, [%i1 + %i3]
	.word	0xc1be5817	! t0_kref+0x2fec:   	stda	%f0, [%i1 + %l7]0xc0
	.word	0xc040a008	! t0_kref+0x2ff0:   	ldsw	[%g2 + 8], %g0
	.word	0xee36001b	! t0_kref+0x2ff4:   	sth	%l7, [%i0 + %i3]
	call	1f
	.empty
	.word	0xf76e6010	! t0_kref+0x2ffc:   	prefetch	%i1 + 0x10, 27
1:	.word	0x83a01a23	! t0_kref+0x3000:   	fstoi	%f3, %f1
	.word	0x9525eaad	! t0_kref+0x3004:   	mulscc	%l7, 0xaad, %o2
	.word	0x98258017	! t0_kref+0x3008:   	sub	%l6, %l7, %o4
	.word	0x9525a30a	! t0_kref+0x300c:   	mulscc	%l6, 0x30a, %o2
	.word	0xcf266008	! t0_kref+0x3010:   	st	%f7, [%i1 + 8]
	.word	0x8095a2d4	! t0_kref+0x3014:   	orcc	%l6, 0x2d4, %g0
	.word	0x92658017	! t0_kref+0x3018:   	subc	%l6, %l7, %o1
	.word	0x92a5c017	! t0_kref+0x301c:   	subcc	%l7, %l7, %o1
	.word	0x8185c000	! t0_kref+0x3020:   	wr	%l7, %g0, %y
	.word	0x905dfeb7	! t0_kref+0x3024:   	smul	%l7, -0x149, %o0
	.word	0xd11fbcf8	! t0_kref+0x3028:   	ldd	[%fp - 0x308], %f8
	.word	0xc368a081	! t0_kref+0x302c:   	prefetch	%g2 + 0x81, 1
	.word	0x81aa4a20	! t0_kref+0x3030:   	fcmps	%fcc0, %f9, %f0
	.word	0x9fc00004	! t0_kref+0x3034:   	call	%g0 + %g4
	.word	0x9a9dc016	! t0_kref+0x3038:   	xorcc	%l7, %l6, %o5
	.word	0xc93e3fe0	! t0_kref+0x303c:   	std	%f4, [%i0 - 0x20]
	.word	0x878020d0	! t0_kref+0x3040:   	mov	0xd0, %asi
	.word	0x98bdc016	! t0_kref+0x3044:   	xnorcc	%l7, %l6, %o4
	.word	0x9e95c016	! t0_kref+0x3048:   	orcc	%l7, %l6, %o7
	.word	0xec364000	! t0_kref+0x304c:   	sth	%l6, [%i1]
	.word	0xd11fbd50	! t0_kref+0x3050:   	ldd	[%fp - 0x2b0], %f8
	.word	0x98dd8016	! t0_kref+0x3054:   	smulcc	%l6, %l6, %o4
	.word	0x81da772b	! t0_kref+0x3058:   	flush	%o1 - 0x8d5
	.word	0xc4183488	! t0_kref+0x305c:   	ldd	[%g0 - 0xb78], %g2
	.word	0xd83e6018	! t0_kref+0x3060:   	std	%o4, [%i1 + 0x18]
	.word	0xec36001b	! t0_kref+0x3064:   	sth	%l6, [%i0 + %i3]
	sethi	%hi(2f), %o7
	.word	0xe40be0b8	! t0_kref+0x306c:   	ldub	[%o7 + 0xb8], %l2
	.word	0xa41ca00c	! t0_kref+0x3070:   	xor	%l2, 0xc, %l2
	.word	0xe42be0b8	! t0_kref+0x3074:   	stb	%l2, [%o7 + 0xb8]
	.word	0x81dbe0b8	! t0_kref+0x3078:   	flush	%o7 + 0xb8
	.word	0x3f800004	! t0_kref+0x307c:   	fbo,a	_kref+0x308c
	.word	0xd44e0000	! t0_kref+0x3080:   	ldsb	[%i0], %o2
	.word	0x9875c016	! t0_kref+0x3084:   	udiv	%l7, %l6, %o4
	.word	0x31800003	! t0_kref+0x3088:   	fba,a	_kref+0x3094
	.word	0x85a01924	! t0_kref+0x308c:   	fstod	%f4, %f2
	.word	0x81a01a28	! t0_kref+0x3090:   	fstoi	%f8, %f0
	.word	0xefee101a	! t0_kref+0x3094:   	prefetcha	%i0 + %i2, 23
	.word	0x8143c000	! t0_kref+0x3098:   	stbar
	.word	0x908dc016	! t0_kref+0x309c:   	andcc	%l7, %l6, %o0
	.word	0x9f35e018	! t0_kref+0x30a0:   	srl	%l7, 0x18, %o7
	.word	0xd600a030	! t0_kref+0x30a4:   	ld	[%g2 + 0x30], %o3
	.word	0x87a0c9a3	! t0_kref+0x30a8:   	fdivs	%f3, %f3, %f3
	.word	0x81a18d29	! t0_kref+0x30ac:   	fsmuld	%f6, %f9, %f0
	.word	0x9ed58017	! t0_kref+0x30b0:   	umulcc	%l6, %l7, %o7
	.word	0x8da109c2	! t0_kref+0x30b4:   	fdivd	%f4, %f2, %f6
2:	.word	0xa0f5c017	! t0_kref+0x30b8:   	udivcc	%l7, %l7, %l0
	.word	0x9e658016	! t0_kref+0x30bc:   	subc	%l6, %l6, %o7
	.word	0xd0df5018	! t0_kref+0x30c0:   	ldxa	[%i5 + %i0]0x80, %o0
	.word	0x85a00846	! t0_kref+0x30c4:   	faddd	%f0, %f6, %f2
	.word	0x90958016	! t0_kref+0x30c8:   	orcc	%l6, %l6, %o0
	.word	0xf56e3fe8	! t0_kref+0x30cc:   	prefetch	%i0 - 0x18, 26
	.word	0xe1ee501a	! t0_kref+0x30d0:   	prefetcha	%i1 + %i2, 16
	.word	0x8143e040	! t0_kref+0x30d4:   	membar	0x40
	.word	0x94f5e8dd	! t0_kref+0x30d8:   	udivcc	%l7, 0x8dd, %o2
	.word	0x81a01909	! t0_kref+0x30dc:   	fitod	%f9, %f0
	.word	0x950db2f5	! t0_kref+0x30e0:   	tsubcc	%l6, -0xd0b, %o2
	.word	0x8025eac6	! t0_kref+0x30e4:   	sub	%l7, 0xac6, %g0
	.word	0x90f5b972	! t0_kref+0x30e8:   	udivcc	%l6, -0x68e, %o0
	.word	0xc11fbe78	! t0_kref+0x30ec:   	ldd	[%fp - 0x188], %f0
	.word	0xe7f61017	! t0_kref+0x30f0:   	casxa	[%i0]0x80, %l7, %l3
	.word	0x29800004	! t0_kref+0x30f4:   	fbl,a	_kref+0x3104
	.word	0x91a14d20	! t0_kref+0x30f8:   	fsmuld	%f5, %f0, %f8
	.word	0xc9be1a5b	! t0_kref+0x30fc:   	stda	%f4, [%i0 + %i3]0xd2
	.word	0x9405e532	! t0_kref+0x3100:   	add	%l7, 0x532, %o2
	.word	0xd0981019	! t0_kref+0x3104:   	ldda	[%g0 + %i1]0x80, %o0
	.word	0xe67e001c	! t0_kref+0x3108:   	swap	[%i0 + %i4], %l3
	.word	0x83c063b8	! t0_kref+0x310c:   	jmpl	%g1 + 0x3b8, %g1
	.word	0xd83f4018	! t0_kref+0x3110:   	std	%o4, [%i5 + %i0]
	.word	0x98b5c017	! t0_kref+0x3114:   	orncc	%l7, %l7, %o4
	.word	0x9a65af2d	! t0_kref+0x3118:   	subc	%l6, 0xf2d, %o5
	sethi	%hi(2f), %o7
	.word	0xe40be13c	! t0_kref+0x3120:   	ldub	[%o7 + 0x13c], %l2
	.word	0xa41ca00c	! t0_kref+0x3124:   	xor	%l2, 0xc, %l2
	.word	0xe42be13c	! t0_kref+0x3128:   	stb	%l2, [%o7 + 0x13c]
	.word	0x81dbe13c	! t0_kref+0x312c:   	flush	%o7 + 0x13c
	.word	0xd20e6007	! t0_kref+0x3130:   	ldub	[%i1 + 7], %o1
	.word	0xede61017	! t0_kref+0x3134:   	casa	[%i0]0x80, %l7, %l6
	.word	0xec2e3fe7	! t0_kref+0x3138:   	stb	%l6, [%i0 - 0x19]
2:	.word	0x9addf6d6	! t0_kref+0x313c:   	smulcc	%l7, -0x92a, %o5
	.word	0xd6fe101c	! t0_kref+0x3140:   	swapa	[%i0 + %i4]0x80, %o3
	.word	0x9295c016	! t0_kref+0x3144:   	orcc	%l7, %l6, %o1
	.word	0x85a01905	! t0_kref+0x3148:   	fitod	%f5, %f2
	.word	0xd9e65017	! t0_kref+0x314c:   	casa	[%i1]0x80, %l7, %o4
	.word	0xd11fbfb0	! t0_kref+0x3150:   	ldd	[%fp - 0x50], %f8
	.word	0xd47e001c	! t0_kref+0x3154:   	swap	[%i0 + %i4], %o2
	.word	0xc11fbde8	! t0_kref+0x3158:   	ldd	[%fp - 0x218], %f0
	.word	0x9a35c017	! t0_kref+0x315c:   	orn	%l7, %l7, %o5
	.word	0x81a8ca20	! t0_kref+0x3160:   	fcmps	%fcc0, %f3, %f0
	.word	0x81a208c6	! t0_kref+0x3164:   	fsubd	%f8, %f6, %f0
	.word	0xde4e201c	! t0_kref+0x3168:   	ldsb	[%i0 + 0x1c], %o7
	.word	0x83414000	! t0_kref+0x316c:   	mov	%pc, %g1
	.word	0x85a00946	! t0_kref+0x3170:   	fmuld	%f0, %f6, %f2
	.word	0x9fc10000	! t0_kref+0x3174:   	call	%g4
	.word	0x89a18942	! t0_kref+0x3178:   	fmuld	%f6, %f2, %f4
	.word	0xd450a02c	! t0_kref+0x317c:   	ldsh	[%g2 + 0x2c], %o2
	.word	0x9025f379	! t0_kref+0x3180:   	sub	%l7, -0xc87, %o0
	.word	0x81a94aa5	! t0_kref+0x3184:   	fcmpes	%fcc0, %f5, %f5
	.word	0x85a089c6	! t0_kref+0x3188:   	fdivd	%f2, %f6, %f2
	.word	0x81a90aa8	! t0_kref+0x318c:   	fcmpes	%fcc0, %f4, %f8
	.word	0xcb26600c	! t0_kref+0x3190:   	st	%f5, [%i1 + 0xc]
	.word	0x93a188a7	! t0_kref+0x3194:   	fsubs	%f6, %f7, %f9
	.word	0x9a95c017	! t0_kref+0x3198:   	orcc	%l7, %l7, %o5
	.word	0x933dc016	! t0_kref+0x319c:   	sra	%l7, %l6, %o1
	.word	0x81a88aa1	! t0_kref+0x31a0:   	fcmpes	%fcc0, %f2, %f1
	.word	0x9fc70000	! t0_kref+0x31a4:   	call	%i4
	.word	0x9695c016	! t0_kref+0x31a8:   	orcc	%l7, %l6, %o3
	.word	0x89a10940	! t0_kref+0x31ac:   	fmuld	%f4, %f0, %f4
	.word	0x96e5fbbe	! t0_kref+0x31b0:   	subccc	%l7, -0x442, %o3
	.word	0x89aac040	! t0_kref+0x31b4:   	fmovdge	%fcc0, %f0, %f4
	.word	0x2b800007	! t0_kref+0x31b8:   	fbug,a	_kref+0x31d4
	.word	0xd648a02d	! t0_kref+0x31bc:   	ldsb	[%g2 + 0x2d], %o3
	.word	0x89a209c8	! t0_kref+0x31c0:   	fdivd	%f8, %f8, %f4
	.word	0x9675a00b	! t0_kref+0x31c4:   	udiv	%l6, 0xb, %o3
	.word	0xd808a005	! t0_kref+0x31c8:   	ldub	[%g2 + 5], %o4
	.word	0xffee501b	! t0_kref+0x31cc:   	prefetcha	%i1 + %i3, 31
	.word	0x85a14d25	! t0_kref+0x31d0:   	fsmuld	%f5, %f5, %f2
	.word	0x9635b9d6	! t0_kref+0x31d4:   	orn	%l6, -0x62a, %o3
	.word	0x85a01887	! t0_kref+0x31d8:   	fitos	%f7, %f2
	.word	0x89a01925	! t0_kref+0x31dc:   	fstod	%f5, %f4
	.word	0x9b700016	! t0_kref+0x31e0:   	popc	%l6, %o5
	.word	0x8185c000	! t0_kref+0x31e4:   	wr	%l7, %g0, %y
	.word	0x968d8017	! t0_kref+0x31e8:   	andcc	%l6, %l7, %o3
	.word	0xe81e4000	! t0_kref+0x31ec:   	ldd	[%i1], %l4
	.word	0x86102001	! t0_kref+0x31f0:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x31f4:   	bne,a	_kref+0x31f4
	.word	0x86a0e001	! t0_kref+0x31f8:   	subcc	%g3, 1, %g3
	.word	0x85a188c8	! t0_kref+0x31fc:   	fsubd	%f6, %f8, %f2
	.word	0x94e5ea6f	! t0_kref+0x3200:   	subccc	%l7, 0xa6f, %o2
	.word	0xe56e3fe0	! t0_kref+0x3204:   	prefetch	%i0 - 0x20, 18
	.word	0x81a20844	! t0_kref+0x3208:   	faddd	%f8, %f4, %f0
	.word	0xe40860c0	! t0_kref+0x320c:   	ldub	[%g1 + 0xc0], %l2
	.word	0xa41ca00c	! t0_kref+0x3210:   	xor	%l2, 0xc, %l2
	.word	0xe42860c0	! t0_kref+0x3214:   	stb	%l2, [%g1 + 0xc0]
	.word	0x81d860c0	! t0_kref+0x3218:   	flush	%g1 + 0xc0
	.word	0x900d8016	! t0_kref+0x321c:   	and	%l6, %l6, %o0
	.word	0xedee101a	! t0_kref+0x3220:   	prefetcha	%i0 + %i2, 22
	.word	0x960dbae6	! t0_kref+0x3224:   	and	%l6, -0x51a, %o3
	.word	0x9eadc016	! t0_kref+0x3228:   	andncc	%l7, %l6, %o7
2:	.word	0xdbf65016	! t0_kref+0x322c:   	casxa	[%i1]0x80, %l6, %o5
	.word	0xd06e3fed	! t0_kref+0x3230:   	ldstub	[%i0 - 0x13], %o0
	.word	0x9ee5fa46	! t0_kref+0x3234:   	subccc	%l7, -0x5ba, %o7
	.word	0x81a88a22	! t0_kref+0x3238:   	fcmps	%fcc0, %f2, %f2
	.word	0xd6780018	! t0_kref+0x323c:   	swap	[%g0 + %i0], %o3
	.word	0x96c5ba8b	! t0_kref+0x3240:   	addccc	%l6, -0x575, %o3
	.word	0x960d8017	! t0_kref+0x3244:   	and	%l6, %l7, %o3
	.word	0x85a18944	! t0_kref+0x3248:   	fmuld	%f6, %f4, %f2
	.word	0xc93e3fe8	! t0_kref+0x324c:   	std	%f4, [%i0 - 0x18]
	.word	0x9e65c017	! t0_kref+0x3250:   	subc	%l7, %l7, %o7
	.word	0x87a01a29	! t0_kref+0x3254:   	fstoi	%f9, %f3
	.word	0xd0780018	! t0_kref+0x3258:   	swap	[%g0 + %i0], %o0
	.word	0x808dc017	! t0_kref+0x325c:   	btst	%l7, %l7
	.word	0xec266014	! t0_kref+0x3260:   	st	%l6, [%i1 + 0x14]
	.word	0x94e58017	! t0_kref+0x3264:   	subccc	%l6, %l7, %o2
	.word	0xc56e3ff8	! t0_kref+0x3268:   	prefetch	%i0 - 8, 2
	.word	0xd83e7fe8	! t0_kref+0x326c:   	std	%o4, [%i1 - 0x18]
	.word	0x961dfa06	! t0_kref+0x3270:   	xor	%l7, -0x5fa, %o3
	.word	0x1515d7f8	! t0_kref+0x3274:   	sethi	%hi(0x575fe000), %o2
	.word	0x9f358017	! t0_kref+0x3278:   	srl	%l6, %l7, %o7
	.word	0xc76e7ff8	! t0_kref+0x327c:   	prefetch	%i1 - 8, 3
	.word	0x9f400000	! t0_kref+0x3280:   	mov	%y, %o7
	.word	0x1b3181b9	! t0_kref+0x3284:   	sethi	%hi(0xc606e400), %o5
	.word	0xc51e7fe8	! t0_kref+0x3288:   	ldd	[%i1 - 0x18], %f2
	.word	0xe168a048	! t0_kref+0x328c:   	prefetch	%g2 + 0x48, 16
	.word	0x9fc10000	! t0_kref+0x3290:   	call	%g4
	.word	0x98b5c016	! t0_kref+0x3294:   	orncc	%l7, %l6, %o4
	.word	0x91a1cd25	! t0_kref+0x3298:   	fsmuld	%f7, %f5, %f8
	.word	0x95418000	! t0_kref+0x329c:   	mov	%fprs, %o2
	.word	0x81a000a8	! t0_kref+0x32a0:   	fnegs	%f8, %f0
	.word	0xed6e6008	! t0_kref+0x32a4:   	prefetch	%i1 + 8, 22
	.word	0x805d8016	! t0_kref+0x32a8:   	smul	%l6, %l6, %g0
	.word	0x9e05c017	! t0_kref+0x32ac:   	add	%l7, %l7, %o7
	.word	0x85a01904	! t0_kref+0x32b0:   	fitod	%f4, %f2
	.word	0x9ac5e1e8	! t0_kref+0x32b4:   	addccc	%l7, 0x1e8, %o5
	.word	0xc1be7ffc	! t0_kref+0x32b8:   	stda	%f0, [%i1 - 4]%asi
	.word	0x8045c017	! t0_kref+0x32bc:   	addc	%l7, %l7, %g0
	.word	0x9f25e127	! t0_kref+0x32c0:   	mulscc	%l7, 0x127, %o7
	call	SYM(t0_subr2)
	.word	0x9215aa6d	! t0_kref+0x32c8:   	or	%l6, 0xa6d, %o1
	.word	0xe5ee101a	! t0_kref+0x32cc:   	prefetcha	%i0 + %i2, 18
	.word	0x2d800001	! t0_kref+0x32d0:   	fbg,a	_kref+0x32d4
	.word	0xe52060c6	! t0_kref+0x32d4:   	st	%f18, [%g1 + 0xc6]
	.word	0x96158017	! t0_kref+0x32d8:   	or	%l6, %l7, %o3
	.word	0x87a00023	! t0_kref+0x32dc:   	fmovs	%f3, %f3
	.word	0x9ef5b8e8	! t0_kref+0x32e0:   	udivcc	%l6, -0x718, %o7
	.word	0xe40861b0	! t0_kref+0x32e4:   	ldub	[%g1 + 0x1b0], %l2
	.word	0xa41ca00c	! t0_kref+0x32e8:   	xor	%l2, 0xc, %l2
	.word	0xe42861b0	! t0_kref+0x32ec:   	stb	%l2, [%g1 + 0x1b0]
	.word	0x81d861b0	! t0_kref+0x32f0:   	flush	%g1 + 0x1b0
	.word	0x81dec01a	! t0_kref+0x32f4:   	flush	%i3 + %i2
	.word	0x8da01925	! t0_kref+0x32f8:   	fstod	%f5, %f6
	.word	0x89a018c4	! t0_kref+0x32fc:   	fdtos	%f4, %f4
	.word	0xd83e4000	! t0_kref+0x3300:   	std	%o4, [%i1]
	.word	0x9725c017	! t0_kref+0x3304:   	mulscc	%l7, %l7, %o3
	.word	0x89a01886	! t0_kref+0x3308:   	fitos	%f6, %f4
	.word	0x9b40c000	! t0_kref+0x330c:   	mov	%asi, %o5
	.word	0x81d925f0	! t0_kref+0x3310:   	flush	%g4 + 0x5f0
	.word	0x9fc10000	! t0_kref+0x3314:   	call	%g4
	.word	0xe56e401c	! t0_kref+0x3318:   	prefetch	%i1 + %i4, 18
2:	.word	0x9e75a8a9	! t0_kref+0x331c:   	udiv	%l6, 0x8a9, %o7
	.word	0x91a01908	! t0_kref+0x3320:   	fitod	%f8, %f8
	.word	0x80a58016	! t0_kref+0x3324:   	cmp	%l6, %l6
	.word	0x9095c017	! t0_kref+0x3328:   	orcc	%l7, %l7, %o0
	.word	0x81258017	! t0_kref+0x332c:   	mulscc	%l6, %l7, %g0
	.word	0xe56e401a	! t0_kref+0x3330:   	prefetch	%i1 + %i2, 18
	.word	0x8075a10f	! t0_kref+0x3334:   	udiv	%l6, 0x10f, %g0
	.word	0xd8560000	! t0_kref+0x3338:   	ldsh	[%i0], %o4
	.word	0x81aa0a20	! t0_kref+0x333c:   	fcmps	%fcc0, %f8, %f0
	.word	0xf207bfe0	! t0_kref+0x3340:   	ld	[%fp - 0x20], %i1
	.word	0xee28a033	! t0_kref+0x3344:   	stb	%l7, [%g2 + 0x33]
	.word	0x1526f187	! t0_kref+0x3348:   	sethi	%hi(0x9bc61c00), %o2
	.word	0x9635c017	! t0_kref+0x334c:   	orn	%l7, %l7, %o3
	.word	0x95358016	! t0_kref+0x3350:   	srl	%l6, %l6, %o2
	.word	0x9675aabf	! t0_kref+0x3354:   	udiv	%l6, 0xabf, %o3
	.word	0xeea71019	! t0_kref+0x3358:   	sta	%l7, [%i4 + %i1]0x80
	.word	0xc368a005	! t0_kref+0x335c:   	prefetch	%g2 + 5, 1
	.word	0x9e8dc017	! t0_kref+0x3360:   	andcc	%l7, %l7, %o7
	.word	0x8035f891	! t0_kref+0x3364:   	orn	%l7, -0x76f, %g0
	.word	0x92a5c016	! t0_kref+0x3368:   	subcc	%l7, %l6, %o1
	.word	0x9b418000	! t0_kref+0x336c:   	mov	%fprs, %o5
	.word	0x81a98a44	! t0_kref+0x3370:   	fcmpd	%fcc0, %f6, %f4
	.word	0xc568a044	! t0_kref+0x3374:   	prefetch	%g2 + 0x44, 2
	sethi	%hi(2f), %o7
	.word	0xe40be394	! t0_kref+0x337c:   	ldub	[%o7 + 0x394], %l2
	.word	0xa41ca00c	! t0_kref+0x3380:   	xor	%l2, 0xc, %l2
	.word	0xe42be394	! t0_kref+0x3384:   	stb	%l2, [%o7 + 0x394]
	.word	0x81dbe394	! t0_kref+0x3388:   	flush	%o7 + 0x394
	.word	0xc9000018	! t0_kref+0x338c:   	ld	[%g0 + %i0], %f4
	.word	0x81dd801e	! t0_kref+0x3390:   	flush	%l6 + %fp
2:	.word	0xd64e6012	! t0_kref+0x3394:   	ldsb	[%i1 + 0x12], %o3
	.word	0xd24e2015	! t0_kref+0x3398:   	ldsb	[%i0 + 0x15], %o1
	call	SYM(t0_subr2)
	.word	0x81a01925	! t0_kref+0x33a0:   	fstod	%f5, %f0
	.word	0x808d8016	! t0_kref+0x33a4:   	btst	%l6, %l6
	.word	0x9f35c016	! t0_kref+0x33a8:   	srl	%l7, %l6, %o7
	.word	0xe86e201a	! t0_kref+0x33ac:   	ldstub	[%i0 + 0x1a], %l4
	.word	0xd208a020	! t0_kref+0x33b0:   	ldub	[%g2 + 0x20], %o1
	.word	0x80758017	! t0_kref+0x33b4:   	udiv	%l6, %l7, %g0
	.word	0x9a75ec23	! t0_kref+0x33b8:   	udiv	%l7, 0xc23, %o5
	.word	0x81df8005	! t0_kref+0x33bc:   	flush	%fp + %g5
	.word	0x9f35e004	! t0_kref+0x33c0:   	srl	%l7, 0x4, %o7
	.word	0xda4e3ffd	! t0_kref+0x33c4:   	ldsb	[%i0 - 3], %o5
	.word	0x89a089c0	! t0_kref+0x33c8:   	fdivd	%f2, %f0, %f4
	.word	0xd216c018	! t0_kref+0x33cc:   	lduh	[%i3 + %i0], %o1
	.word	0x81a000c4	! t0_kref+0x33d0:   	fnegd	%f4, %f0
	.word	0x94d5b3db	! t0_kref+0x33d4:   	umulcc	%l6, -0xc25, %o2
	.word	0xc7263fe0	! t0_kref+0x33d8:   	st	%f3, [%i0 - 0x20]
	.word	0x90f58017	! t0_kref+0x33dc:   	udivcc	%l6, %l7, %o0
	.word	0x85a018c4	! t0_kref+0x33e0:   	fdtos	%f4, %f2
	.word	0x8125f75e	! t0_kref+0x33e4:   	mulscc	%l7, -0x8a2, %g0
	.word	0x85a20d21	! t0_kref+0x33e8:   	fsmuld	%f8, %f1, %f2
	.word	0x33800008	! t0_kref+0x33ec:   	fbe,a	_kref+0x340c
	.word	0x81d925b4	! t0_kref+0x33f0:   	flush	%g4 + 0x5b4
	.word	0x9e0dc016	! t0_kref+0x33f4:   	and	%l7, %l6, %o7
	.word	0xde10a00c	! t0_kref+0x33f8:   	lduh	[%g2 + 0xc], %o7
	.word	0x91418000	! t0_kref+0x33fc:   	mov	%fprs, %o0
	.word	0x9205a28f	! t0_kref+0x3400:   	add	%l6, 0x28f, %o1
	.word	0xc768a04c	! t0_kref+0x3404:   	prefetch	%g2 + 0x4c, 3
	.word	0xd8be501d	! t0_kref+0x3408:   	stda	%o4, [%i1 + %i5]0x80
	.word	0x85a01908	! t0_kref+0x340c:   	fitod	%f8, %f2
	.word	0x9295c017	! t0_kref+0x3410:   	orcc	%l7, %l7, %o1
	.word	0x87a01a25	! t0_kref+0x3414:   	fstoi	%f5, %f3
	.word	0x81a18944	! t0_kref+0x3418:   	fmuld	%f6, %f4, %f0
	call	1f
	.empty
	.word	0xf36e2008	! t0_kref+0x3420:   	prefetch	%i0 + 8, 25
	.word	0x9725a675	! t0_kref+0x3424:   	mulscc	%l6, 0x675, %o3
	.word	0x29800007	! t0_kref+0x3428:   	fbl,a	_kref+0x3444
	.word	0x8135e012	! t0_kref+0x342c:   	srl	%l7, 0x12, %g0
	.word	0xe2ee9019	! t0_kref+0x3430:   	ldstuba	[%i2 + %i1]0x80, %l1
	.word	0x9245ba76	! t0_kref+0x3434:   	addc	%l6, -0x58a, %o1
	.word	0x81a1c9a6	! t0_kref+0x3438:   	fdivs	%f7, %f6, %f0
1:	.word	0x89a149a0	! t0_kref+0x343c:   	fdivs	%f5, %f0, %f4
	.word	0x9fc00004	! t0_kref+0x3440:   	call	%g0 + %g4
	.word	0x9a458017	! t0_kref+0x3444:   	addc	%l6, %l7, %o5
	.word	0xd81f4019	! t0_kref+0x3448:   	ldd	[%i5 + %i1], %o4
	.word	0xec6e401a	! t0_kref+0x344c:   	ldstub	[%i1 + %i2], %l6
	.word	0x9e15a8e2	! t0_kref+0x3450:   	or	%l6, 0x8e2, %o7
	call	SYM(t0_subr3)
	.word	0x9ac58017	! t0_kref+0x3458:   	addccc	%l6, %l7, %o5
	.word	0x80f58016	! t0_kref+0x345c:   	udivcc	%l6, %l6, %g0
	.word	0xd0162012	! t0_kref+0x3460:   	lduh	[%i0 + 0x12], %o0
	.word	0xc168a00c	! t0_kref+0x3464:   	prefetch	%g2 + 0xc, 0
	.word	0x8ba1c9a5	! t0_kref+0x3468:   	fdivs	%f7, %f5, %f5
	.word	0x9a35a025	! t0_kref+0x346c:   	orn	%l6, 0x25, %o5
	.word	0x91a01102	! t0_kref+0x3470:   	fxtod	%f2, %f8
	.word	0x85a01a27	! t0_kref+0x3474:   	fstoi	%f7, %f2
	.word	0x8da24d22	! t0_kref+0x3478:   	fsmuld	%f9, %f2, %f6
	.word	0xe07f0018	! t0_kref+0x347c:   	swap	[%i4 + %i0], %l0
	.word	0xe83e001d	! t0_kref+0x3480:   	std	%l4, [%i0 + %i5]
	.word	0xc807bfe8	! t0_kref+0x3484:   	ld	[%fp - 0x18], %g4
	.word	0x9b258016	! t0_kref+0x3488:   	mulscc	%l6, %l6, %o5
	.word	0x89a000a3	! t0_kref+0x348c:   	fnegs	%f3, %f4
	.word	0xc7270018	! t0_kref+0x3490:   	st	%f3, [%i4 + %i0]
	.word	0x001fffff	! t0_kref+0x3494:   	illtrap	0x1fffff
	.word	0xd4801018	! t0_kref+0x3498:   	lda	[%g0 + %i0]0x80, %o2
	.word	0x93400000	! t0_kref+0x349c:   	mov	%y, %o1
	.word	0xcda6501c	! t0_kref+0x34a0:   	sta	%f6, [%i1 + %i4]0x80
	.word	0xda901018	! t0_kref+0x34a4:   	lduha	[%g0 + %i0]0x80, %o5
	.word	0x98d5bf77	! t0_kref+0x34a8:   	umulcc	%l6, -0x89, %o4
	.word	0xd06e7fe2	! t0_kref+0x34ac:   	ldstub	[%i1 - 0x1e], %o0
	.word	0x91a01104	! t0_kref+0x34b0:   	fxtod	%f4, %f8
	.word	0x31800007	! t0_kref+0x34b4:   	fba,a	_kref+0x34d0
	.word	0x8143c000	! t0_kref+0x34b8:   	stbar
	.word	0x8fa00023	! t0_kref+0x34bc:   	fmovs	%f3, %f7
	.word	0xc900a018	! t0_kref+0x34c0:   	ld	[%g2 + 0x18], %f4
	.word	0x96d5b42d	! t0_kref+0x34c4:   	umulcc	%l6, -0xbd3, %o3
	.word	0xc016c019	! t0_kref+0x34c8:   	lduh	[%i3 + %i1], %g0
	.word	0x90d5f1e2	! t0_kref+0x34cc:   	umulcc	%l7, -0xe1e, %o0
	.word	0xee270019	! t0_kref+0x34d0:   	st	%l7, [%i4 + %i1]
	.word	0x9a65a6e6	! t0_kref+0x34d4:   	subc	%l6, 0x6e6, %o5
	.word	0x8185c000	! t0_kref+0x34d8:   	wr	%l7, %g0, %y
	.word	0xc100a030	! t0_kref+0x34dc:   	ld	[%g2 + 0x30], %f0
	.word	0x9135c017	! t0_kref+0x34e0:   	srl	%l7, %l7, %o0
	.word	0xd850a002	! t0_kref+0x34e4:   	ldsh	[%g2 + 2], %o4
	.word	0xee367fe2	! t0_kref+0x34e8:   	sth	%l7, [%i1 - 0x1e]
	.word	0xee362006	! t0_kref+0x34ec:   	sth	%l7, [%i0 + 6]
	.word	0x8da01888	! t0_kref+0x34f0:   	fitos	%f8, %f6
	.word	0xc8683fdc	! t0_kref+0x34f4:   	ldstub	[%g0 - 0x24], %g4
	.word	0x2d800005	! t0_kref+0x34f8:   	fbg,a	_kref+0x350c
	.word	0x990dc016	! t0_kref+0x34fc:   	tsubcc	%l7, %l6, %o4
	.word	0x81a208c8	! t0_kref+0x3500:   	fsubd	%f8, %f8, %f0
	.word	0x9aadc017	! t0_kref+0x3504:   	andncc	%l7, %l7, %o5
	.word	0x9335e01f	! t0_kref+0x3508:   	srl	%l7, 0x1f, %o1
	.word	0xec263ffc	! t0_kref+0x350c:   	st	%l6, [%i0 - 4]
	.word	0xcd070019	! t0_kref+0x3510:   	ld	[%i4 + %i1], %f6
	.word	0xe40863cc	! t0_kref+0x3514:   	ldub	[%g1 + 0x3cc], %l2
	.word	0xa41ca00c	! t0_kref+0x3518:   	xor	%l2, 0xc, %l2
	.word	0xe42863cc	! t0_kref+0x351c:   	stb	%l2, [%g1 + 0x3cc]
	.word	0x81d863cc	! t0_kref+0x3520:   	flush	%g1 + 0x3cc
	.word	0xe07e6010	! t0_kref+0x3524:   	swap	[%i1 + 0x10], %l0
	.word	0x8fa00028	! t0_kref+0x3528:   	fmovs	%f8, %f7
	.word	0x960d8017	! t0_kref+0x352c:   	and	%l6, %l7, %o3
	.word	0x9275c017	! t0_kref+0x3530:   	udiv	%l7, %l7, %o1
	.word	0xee262018	! t0_kref+0x3534:   	st	%l7, [%i0 + 0x18]
2:	.word	0x91a00026	! t0_kref+0x3538:   	fmovs	%f6, %f8
	.word	0x96e5c017	! t0_kref+0x353c:   	subccc	%l7, %l7, %o3
	.word	0x9205c017	! t0_kref+0x3540:   	add	%l7, %l7, %o1
	.word	0x8da01926	! t0_kref+0x3544:   	fstod	%f6, %f6
	.word	0x81dc7e01	! t0_kref+0x3548:   	flush	%l1 - 0x1ff
	.word	0x25800005	! t0_kref+0x354c:   	fblg,a	_kref+0x3560
	.word	0x91a108c0	! t0_kref+0x3550:   	fsubd	%f4, %f0, %f8
	.word	0x85a008c4	! t0_kref+0x3554:   	fsubd	%f0, %f4, %f2
	.word	0xd208a039	! t0_kref+0x3558:   	ldub	[%g2 + 0x39], %o1
	.word	0xc9be5816	! t0_kref+0x355c:   	stda	%f4, [%i1 + %l6]0xc0
	.word	0x94b58016	! t0_kref+0x3560:   	orncc	%l6, %l6, %o2
	.word	0x98658016	! t0_kref+0x3564:   	subc	%l6, %l6, %o4
	.word	0xec2e4000	! t0_kref+0x3568:   	stb	%l6, [%i1]
	.word	0x3d800003	! t0_kref+0x356c:   	fbule,a	_kref+0x3578
	.word	0x9245b77a	! t0_kref+0x3570:   	addc	%l6, -0x886, %o1
	.word	0x96c58017	! t0_kref+0x3574:   	addccc	%l6, %l7, %o3
	.word	0x89a089a9	! t0_kref+0x3578:   	fdivs	%f2, %f9, %f4
	.word	0x973de012	! t0_kref+0x357c:   	sra	%l7, 0x12, %o3
	.word	0x9645b26e	! t0_kref+0x3580:   	addc	%l6, -0xd92, %o3
	.word	0xe1ee101b	! t0_kref+0x3584:   	prefetcha	%i0 + %i3, 16
	.word	0xe4086434	! t0_kref+0x3588:   	ldub	[%g1 + 0x434], %l2
	.word	0xa41ca00c	! t0_kref+0x358c:   	xor	%l2, 0xc, %l2
	.word	0xe4286434	! t0_kref+0x3590:   	stb	%l2, [%g1 + 0x434]
	.word	0x81d86434	! t0_kref+0x3594:   	flush	%g1 + 0x434
	.word	0xd09e501d	! t0_kref+0x3598:   	ldda	[%i1 + %i5]0x80, %o0
	.word	0xc768a047	! t0_kref+0x359c:   	prefetch	%g2 + 0x47, 3
2:	.word	0x9e65e952	! t0_kref+0x35a0:   	subc	%l7, 0x952, %o7
	.word	0xc050a032	! t0_kref+0x35a4:   	ldsh	[%g2 + 0x32], %g0
	.word	0xee36200a	! t0_kref+0x35a8:   	sth	%l7, [%i0 + 0xa]
	.word	0x96b5c016	! t0_kref+0x35ac:   	orncc	%l7, %l6, %o3
	.word	0x80d5e863	! t0_kref+0x35b0:   	umulcc	%l7, 0x863, %g0
	.word	0x9635fe0d	! t0_kref+0x35b4:   	orn	%l7, -0x1f3, %o3
	.word	0xc19e5a5c	! t0_kref+0x35b8:   	ldda	[%i1 + %i4]0xd2, %f0
	.word	0xd1be1856	! t0_kref+0x35bc:   	stda	%f8, [%i0 + %l6]0xc2
	.word	0xda6e6000	! t0_kref+0x35c0:   	ldstub	[%i1], %o5
	.word	0x91a01a42	! t0_kref+0x35c4:   	fdtoi	%f2, %f8
	.word	0xc13e6008	! t0_kref+0x35c8:   	std	%f0, [%i1 + 8]
	.word	0x85a08946	! t0_kref+0x35cc:   	fmuld	%f2, %f6, %f2
	.word	0x9f3de01f	! t0_kref+0x35d0:   	sra	%l7, 0x1f, %o7
	.word	0x9225ead7	! t0_kref+0x35d4:   	sub	%l7, 0xad7, %o1
	.word	0x9665eb77	! t0_kref+0x35d8:   	subc	%l7, 0xb77, %o3
	.word	0xd43e6000	! t0_kref+0x35dc:   	std	%o2, [%i1]
	.word	0x8ba00027	! t0_kref+0x35e0:   	fmovs	%f7, %f5
	.word	0x8075c016	! t0_kref+0x35e4:   	udiv	%l7, %l6, %g0
	.word	0xc19e5a5c	! t0_kref+0x35e8:   	ldda	[%i1 + %i4]0xd2, %f0
	.word	0x91a20948	! t0_kref+0x35ec:   	fmuld	%f8, %f8, %f8
	.word	0x9845a2ee	! t0_kref+0x35f0:   	addc	%l6, 0x2ee, %o4
	.word	0x9475c016	! t0_kref+0x35f4:   	udiv	%l7, %l6, %o2
	.word	0xcd1e001d	! t0_kref+0x35f8:   	ldd	[%i0 + %i5], %f6
	.word	0xc5b81018	! t0_kref+0x35fc:   	stda	%f2, [%g0 + %i0]0x80
	.word	0xc99e5a5c	! t0_kref+0x3600:   	ldda	[%i1 + %i4]0xd2, %f4
	.word	0x89a20942	! t0_kref+0x3604:   	fmuld	%f8, %f2, %f4
	.word	0x973dc016	! t0_kref+0x3608:   	sra	%l7, %l6, %o3
	.word	0xd25e6018	! t0_kref+0x360c:   	ldx	[%i1 + 0x18], %o1
	.word	0xc768a083	! t0_kref+0x3610:   	prefetch	%g2 + 0x83, 3
	.word	0x8143e040	! t0_kref+0x3614:   	membar	0x40
	.word	0x87a00021	! t0_kref+0x3618:   	fmovs	%f1, %f3
	call	SYM(t0_subr0)
	.word	0x8da00940	! t0_kref+0x3620:   	fmuld	%f0, %f0, %f6
	.word	0xec2e6006	! t0_kref+0x3624:   	stb	%l6, [%i1 + 6]
	.word	0x8045c016	! t0_kref+0x3628:   	addc	%l7, %l6, %g0
	.word	0x89a00d24	! t0_kref+0x362c:   	fsmuld	%f0, %f4, %f4
	.word	0x9275f710	! t0_kref+0x3630:   	udiv	%l7, -0x8f0, %o1
	.word	0x81a10846	! t0_kref+0x3634:   	faddd	%f4, %f6, %f0
	.word	0x98bdf666	! t0_kref+0x3638:   	xnorcc	%l7, -0x99a, %o4
	.word	0x85a10946	! t0_kref+0x363c:   	fmuld	%f4, %f6, %f2
	.word	0x91a01a24	! t0_kref+0x3640:   	fstoi	%f4, %f8
	.word	0x808db024	! t0_kref+0x3644:   	btst	0xfffff024, %l6
	.word	0xe4981019	! t0_kref+0x3648:   	ldda	[%g0 + %i1]0x80, %l2
	.word	0xc9ee1016	! t0_kref+0x364c:   	prefetcha	%i0 + %l6, 4
	call	SYM(t0_subr1)
	.word	0x9065f946	! t0_kref+0x3654:   	subc	%l7, -0x6ba, %o0
	.word	0x87a000a9	! t0_kref+0x3658:   	fnegs	%f9, %f3
	.word	0x81a089a5	! t0_kref+0x365c:   	fdivs	%f2, %f5, %f0
	.word	0x8055f908	! t0_kref+0x3660:   	umul	%l7, -0x6f8, %g0
	.word	0xde16c019	! t0_kref+0x3664:   	lduh	[%i3 + %i1], %o7
	.word	0xd11fbdd8	! t0_kref+0x3668:   	ldd	[%fp - 0x228], %f8
	.word	0x9b400000	! t0_kref+0x366c:   	mov	%y, %o5
	.word	0xc300a020	! t0_kref+0x3670:   	ld	[%g2 + 0x20], %f1
	.word	0x9e05c017	! t0_kref+0x3674:   	add	%l7, %l7, %o7
	.word	0xee200019	! t0_kref+0x3678:   	st	%l7, [%g0 + %i1]
	.word	0xec200018	! t0_kref+0x367c:   	st	%l6, [%g0 + %i0]
	.word	0xe76e6018	! t0_kref+0x3680:   	prefetch	%i1 + 0x18, 19
	.word	0x81a01a21	! t0_kref+0x3684:   	fstoi	%f1, %f0
	.word	0x9addc016	! t0_kref+0x3688:   	smulcc	%l7, %l6, %o5
	.word	0x8ba209a9	! t0_kref+0x368c:   	fdivs	%f8, %f9, %f5
	.word	0x98bdc017	! t0_kref+0x3690:   	xnorcc	%l7, %l7, %o4
	.word	0x9505b218	! t0_kref+0x3694:   	taddcc	%l6, -0xde8, %o2
	.word	0xd1263ff8	! t0_kref+0x3698:   	st	%f8, [%i0 - 8]
	.word	0xd1bf5a59	! t0_kref+0x369c:   	stda	%f8, [%i5 + %i1]0xd2
	.word	0x9735e01b	! t0_kref+0x36a0:   	srl	%l7, 0x1b, %o3
	.word	0x9ae5a848	! t0_kref+0x36a4:   	subccc	%l6, 0x848, %o5
	.word	0x8143e040	! t0_kref+0x36a8:   	membar	0x40
	.word	0x83a01a46	! t0_kref+0x36ac:   	fdtoi	%f6, %f1
	.word	0x95700016	! t0_kref+0x36b0:   	popc	%l6, %o2
	.word	0x92d5c016	! t0_kref+0x36b4:   	umulcc	%l7, %l6, %o1
	.word	0x913d8017	! t0_kref+0x36b8:   	sra	%l6, %l7, %o0
	.word	0x9ebd8016	! t0_kref+0x36bc:   	xnorcc	%l6, %l6, %o7
	.word	0x85a018c4	! t0_kref+0x36c0:   	fdtos	%f4, %f2
	.word	0x3d800001	! t0_kref+0x36c4:   	fbule,a	_kref+0x36c8
	.word	0x93a01a22	! t0_kref+0x36c8:   	fstoi	%f2, %f9
	.word	0xd27e6004	! t0_kref+0x36cc:   	swap	[%i1 + 4], %o1
	.word	0xec7e4000	! t0_kref+0x36d0:   	swap	[%i1], %l6
	.word	0x83a000a8	! t0_kref+0x36d4:   	fnegs	%f8, %f1
	.word	0x9695b6fc	! t0_kref+0x36d8:   	orcc	%l6, -0x904, %o3
	.word	0xc83f4005	! t0_kref+0x36dc:   	std	%g4, [%i5 + %g5]
	.word	0x94f5b147	! t0_kref+0x36e0:   	udivcc	%l6, -0xeb9, %o2
	.word	0x81d8001f	! t0_kref+0x36e4:   	flush	%g0 + %i7
	.word	0xe3ee501a	! t0_kref+0x36e8:   	prefetcha	%i1 + %i2, 17
	.word	0xe40865ac	! t0_kref+0x36ec:   	ldub	[%g1 + 0x5ac], %l2
	.word	0xa41ca00c	! t0_kref+0x36f0:   	xor	%l2, 0xc, %l2
	.word	0xe42865ac	! t0_kref+0x36f4:   	stb	%l2, [%g1 + 0x5ac]
	.word	0x81d865ac	! t0_kref+0x36f8:   	flush	%g1 + 0x5ac
	.word	0xec30a006	! t0_kref+0x36fc:   	sth	%l6, [%g2 + 6]
	.word	0x94358017	! t0_kref+0x3700:   	orn	%l6, %l7, %o2
	.word	0x9fc10000	! t0_kref+0x3704:   	call	%g4
	.word	0x83a000a1	! t0_kref+0x3708:   	fnegs	%f1, %f1
	.word	0x9435c017	! t0_kref+0x370c:   	orn	%l7, %l7, %o2
	.word	0x94bdc016	! t0_kref+0x3710:   	xnorcc	%l7, %l6, %o2
	.word	0x9ed5f9cb	! t0_kref+0x3714:   	umulcc	%l7, -0x635, %o7
2:	.word	0xa095c017	! t0_kref+0x3718:   	orcc	%l7, %l7, %l0
	.word	0xeeae501a	! t0_kref+0x371c:   	stba	%l7, [%i1 + %i2]0x80
	.word	0x98058016	! t0_kref+0x3720:   	add	%l6, %l6, %o4
	.word	0x98d58017	! t0_kref+0x3724:   	umulcc	%l6, %l7, %o4
	.word	0xec30a034	! t0_kref+0x3728:   	sth	%l6, [%g2 + 0x34]
	.word	0x81a01929	! t0_kref+0x372c:   	fstod	%f9, %f0
	.word	0x81a000a3	! t0_kref+0x3730:   	fnegs	%f3, %f0
	.word	0x8da20846	! t0_kref+0x3734:   	faddd	%f8, %f6, %f6
	.word	0x81aa0ac8	! t0_kref+0x3738:   	fcmped	%fcc0, %f8, %f8
	.word	0x91a01048	! t0_kref+0x373c:   	fdtox	%f8, %f8
	.word	0xd1266000	! t0_kref+0x3740:   	st	%f8, [%i1]
	.word	0x90a58016	! t0_kref+0x3744:   	subcc	%l6, %l6, %o0
	.word	0xd206201c	! t0_kref+0x3748:   	ld	[%i0 + 0x1c], %o1
	.word	0x93a000a2	! t0_kref+0x374c:   	fnegs	%f2, %f9
	.word	0x9ae5aeea	! t0_kref+0x3750:   	subccc	%l6, 0xeea, %o5
	.word	0x93a00029	! t0_kref+0x3754:   	fmovs	%f9, %f9
	.word	0x87a00526	! t0_kref+0x3758:   	fsqrts	%f6, %f3
	.word	0x89a20948	! t0_kref+0x375c:   	fmuld	%f8, %f8, %f4
	.word	0x9235c017	! t0_kref+0x3760:   	orn	%l7, %l7, %o1
	.word	0xd26e201a	! t0_kref+0x3764:   	ldstub	[%i0 + 0x1a], %o1
	.word	0x1328c22c	! t0_kref+0x3768:   	sethi	%hi(0xa308b000), %o1
	.word	0xcb20a038	! t0_kref+0x376c:   	st	%f5, [%g2 + 0x38]
	.word	0x81d87e9a	! t0_kref+0x3770:   	flush	%g1 - 0x166
	.word	0x8fa00025	! t0_kref+0x3774:   	fmovs	%f5, %f7
	.word	0x968db45c	! t0_kref+0x3778:   	andcc	%l6, -0xba4, %o3
	.word	0x9add8017	! t0_kref+0x377c:   	smulcc	%l6, %l7, %o5
	.word	0x801daa24	! t0_kref+0x3780:   	xor	%l6, 0xa24, %g0
	.word	0xec3e001d	! t0_kref+0x3784:   	std	%l6, [%i0 + %i5]
	.word	0x9f35e000	! t0_kref+0x3788:   	srl	%l7, 0x0, %o7
	.word	0xc76e7fe0	! t0_kref+0x378c:   	prefetch	%i1 - 0x20, 3
	.word	0x8da00023	! t0_kref+0x3790:   	fmovs	%f3, %f6
	.word	0xc9380018	! t0_kref+0x3794:   	std	%f4, [%g0 + %i0]
	.word	0x81d94013	! t0_kref+0x3798:   	flush	%g5 + %l3
	.word	0x8da08848	! t0_kref+0x379c:   	faddd	%f2, %f8, %f6
	.word	0x8da01027	! t0_kref+0x37a0:   	fstox	%f7, %f6
	.word	0xd3f65017	! t0_kref+0x37a4:   	casxa	[%i1]0x80, %l7, %o1
	.word	0xed68a00c	! t0_kref+0x37a8:   	prefetch	%g2 + 0xc, 22
	.word	0x9fc00004	! t0_kref+0x37ac:   	call	%g0 + %g4
	.word	0xe86e201d	! t0_kref+0x37b0:   	ldstub	[%i0 + 0x1d], %l4
	.word	0xed68a04d	! t0_kref+0x37b4:   	prefetch	%g2 + 0x4d, 22
	.word	0x83a0c927	! t0_kref+0x37b8:   	fmuls	%f3, %f7, %f1
	.word	0x2b800003	! t0_kref+0x37bc:   	fbug,a	_kref+0x37c8
	.word	0x85a01a44	! t0_kref+0x37c0:   	fdtoi	%f4, %f2
	.word	0xec28a02c	! t0_kref+0x37c4:   	stb	%l6, [%g2 + 0x2c]
	.word	0xcc1f4000	! t0_kref+0x37c8:   	ldd	[%i5], %g6
	call	SYM(t0_subr3)
	.word	0x923d8017	! t0_kref+0x37d0:   	xnor	%l6, %l7, %o1
	.word	0x87a000a8	! t0_kref+0x37d4:   	fnegs	%f8, %f3
	.word	0x9a8dbed8	! t0_kref+0x37d8:   	andcc	%l6, -0x128, %o5
	.word	0xc900a00c	! t0_kref+0x37dc:   	ld	[%g2 + 0xc], %f4
	.word	0xffee101c	! t0_kref+0x37e0:   	prefetcha	%i0 + %i4, 31
	.word	0xc0c6501c	! t0_kref+0x37e4:   	ldswa	[%i1 + %i4]0x80, %g0
	.word	0x85a249a1	! t0_kref+0x37e8:   	fdivs	%f9, %f1, %f2
	.word	0x9675b981	! t0_kref+0x37ec:   	udiv	%l6, -0x67f, %o3
	.word	0x8da20948	! t0_kref+0x37f0:   	fmuld	%f8, %f8, %f6
	.word	0xec36601a	! t0_kref+0x37f4:   	sth	%l6, [%i1 + 0x1a]
	.word	0x93703afc	! t0_kref+0x37f8:   	popc	-0x504, %o1
	.word	0x908d8017	! t0_kref+0x37fc:   	andcc	%l6, %l7, %o0
	.word	0x81a018c6	! t0_kref+0x3800:   	fdtos	%f6, %f0
	.word	0x96ad8017	! t0_kref+0x3804:   	andncc	%l6, %l7, %o3
	.word	0x85a01a24	! t0_kref+0x3808:   	fstoi	%f4, %f2
	.word	0x80a5f973	! t0_kref+0x380c:   	cmp	%l7, -0x68d
	.word	0x8da24d26	! t0_kref+0x3810:   	fsmuld	%f9, %f6, %f6
	.word	0xc3064000	! t0_kref+0x3814:   	ld	[%i1], %f1
	.word	0xc9bf5a18	! t0_kref+0x3818:   	stda	%f4, [%i5 + %i0]0xd0
	.word	0xec2e7fe6	! t0_kref+0x381c:   	stb	%l6, [%i1 - 0x1a]
	.word	0x8da18948	! t0_kref+0x3820:   	fmuld	%f6, %f8, %f6
	.word	0xc12e2000	! t0_kref+0x3824:   	st	%fsr, [%i0]
	.word	0x9e35c016	! t0_kref+0x3828:   	orn	%l7, %l6, %o7
	.word	0x920dbc8d	! t0_kref+0x382c:   	and	%l6, -0x373, %o1
	.word	0x9ac5aa2a	! t0_kref+0x3830:   	addccc	%l6, 0xa2a, %o5
	.word	0xf007bfe0	! t0_kref+0x3834:   	ld	[%fp - 0x20], %i0
	.word	0x9f3da019	! t0_kref+0x3838:   	sra	%l6, 0x19, %o7
	.word	0x80658017	! t0_kref+0x383c:   	subc	%l6, %l7, %g0
	.word	0x9e65e94a	! t0_kref+0x3840:   	subc	%l7, 0x94a, %o7
	sethi	%hi(2f), %o7
	.word	0xe40be084	! t0_kref+0x3848:   	ldub	[%o7 + 0x84], %l2
	.word	0xa41ca00c	! t0_kref+0x384c:   	xor	%l2, 0xc, %l2
	.word	0xe42be084	! t0_kref+0x3850:   	stb	%l2, [%o7 + 0x84]
	.word	0x81dbe084	! t0_kref+0x3854:   	flush	%o7 + 0x84
	.word	0x9235f5a2	! t0_kref+0x3858:   	orn	%l7, -0xa5e, %o1
	.word	0xd3266004	! t0_kref+0x385c:   	st	%f9, [%i1 + 4]
	.word	0x81a108c4	! t0_kref+0x3860:   	fsubd	%f4, %f4, %f0
	.word	0x85a000a4	! t0_kref+0x3864:   	fnegs	%f4, %f2
	.word	0x93a209a6	! t0_kref+0x3868:   	fdivs	%f8, %f6, %f9
	.word	0x9fc00004	! t0_kref+0x386c:   	call	%g0 + %g4
	.word	0xd050a00c	! t0_kref+0x3870:   	ldsh	[%g2 + 0xc], %o0
	.word	0xffee101c	! t0_kref+0x3874:   	prefetcha	%i0 + %i4, 31
	.word	0x96b58016	! t0_kref+0x3878:   	orncc	%l6, %l6, %o3
	.word	0x81aa0a29	! t0_kref+0x387c:   	fcmps	%fcc0, %f8, %f9
	.word	0x91a20d22	! t0_kref+0x3880:   	fsmuld	%f8, %f2, %f8
2:	.word	0xd240a028	! t0_kref+0x3884:   	ldsw	[%g2 + 0x28], %o1
	.word	0x81a01924	! t0_kref+0x3888:   	fstod	%f4, %f0
	.word	0x9645aea7	! t0_kref+0x388c:   	addc	%l6, 0xea7, %o3
	.word	0xc19eda58	! t0_kref+0x3890:   	ldda	[%i3 + %i0]0xd2, %f0
	.word	0x81a90a20	! t0_kref+0x3894:   	fcmps	%fcc0, %f4, %f0
	.word	0x81a01920	! t0_kref+0x3898:   	fstod	%f0, %f0
	.word	0x93058017	! t0_kref+0x389c:   	taddcc	%l6, %l7, %o1
	.word	0xd0067fec	! t0_kref+0x38a0:   	ld	[%i1 - 0x14], %o0
	.word	0xd4df5019	! t0_kref+0x38a4:   	ldxa	[%i5 + %i1]0x80, %o2
	.word	0x87a018c0	! t0_kref+0x38a8:   	fdtos	%f0, %f3
	.word	0x83a01a25	! t0_kref+0x38ac:   	fstoi	%f5, %f1
	.word	0x87a000a6	! t0_kref+0x38b0:   	fnegs	%f6, %f3
	.word	0xc3266008	! t0_kref+0x38b4:   	st	%f1, [%i1 + 8]
	.word	0x8da80044	! t0_kref+0x38b8:   	fmovdn	%fcc0, %f4, %f6
	.word	0x81a90a23	! t0_kref+0x38bc:   	fcmps	%fcc0, %f4, %f3
	.word	0x8143c000	! t0_kref+0x38c0:   	stbar
	.word	0xe47f0018	! t0_kref+0x38c4:   	swap	[%i4 + %i0], %l2
	.word	0x972d8017	! t0_kref+0x38c8:   	sll	%l6, %l7, %o3
	.word	0xd0981018	! t0_kref+0x38cc:   	ldda	[%g0 + %i0]0x80, %o0
	.word	0xd11e401d	! t0_kref+0x38d0:   	ldd	[%i1 + %i5], %f8
	.word	0x8fa049a0	! t0_kref+0x38d4:   	fdivs	%f1, %f0, %f7
	.word	0x81daa62c	! t0_kref+0x38d8:   	flush	%o2 + 0x62c
	.word	0x94b58016	! t0_kref+0x38dc:   	orncc	%l6, %l6, %o2
	.word	0xc51fbde8	! t0_kref+0x38e0:   	ldd	[%fp - 0x218], %f2
	.word	0xe40867ac	! t0_kref+0x38e4:   	ldub	[%g1 + 0x7ac], %l2
	.word	0xa41ca00c	! t0_kref+0x38e8:   	xor	%l2, 0xc, %l2
	.word	0xe42867ac	! t0_kref+0x38ec:   	stb	%l2, [%g1 + 0x7ac]
	.word	0x81d867ac	! t0_kref+0x38f0:   	flush	%g1 + 0x7ac
	.word	0xd83f4019	! t0_kref+0x38f4:   	std	%o4, [%i5 + %i1]
	.word	0x9245c017	! t0_kref+0x38f8:   	addc	%l7, %l7, %o1
	.word	0x8d85ad53	! t0_kref+0x38fc:   	wr	%l6, 0xd53, %fprs
	.word	0x80bd8017	! t0_kref+0x3900:   	xnorcc	%l6, %l7, %g0
	.word	0x83a018c0	! t0_kref+0x3904:   	fdtos	%f0, %f1
	.word	0x8fa018c2	! t0_kref+0x3908:   	fdtos	%f2, %f7
	.word	0xcfa01019	! t0_kref+0x390c:   	sta	%f7, [%g0 + %i1]0x80
	.word	0x9335a001	! t0_kref+0x3910:   	srl	%l6, 0x1, %o1
	.word	0x83414000	! t0_kref+0x3914:   	mov	%pc, %g1
2:	.word	0xda871040	! t0_kref+0x3918:   	lda	[%i4]0x82, %o5
	.word	0xde064000	! t0_kref+0x391c:   	ld	[%i1], %o7
	.word	0x81a80a42	! t0_kref+0x3920:   	fcmpd	%fcc0, %f0, %f2
	.word	0x9e65c017	! t0_kref+0x3924:   	subc	%l7, %l7, %o7
	.word	0xd06e4000	! t0_kref+0x3928:   	ldstub	[%i1], %o0
	.word	0x9addc017	! t0_kref+0x392c:   	smulcc	%l7, %l7, %o5
	.word	0x81a9caa9	! t0_kref+0x3930:   	fcmpes	%fcc0, %f7, %f9
	.word	0x809d8016	! t0_kref+0x3934:   	xorcc	%l6, %l6, %g0
	.word	0x89a148a2	! t0_kref+0x3938:   	fsubs	%f5, %f2, %f4
	.word	0xec30a036	! t0_kref+0x393c:   	sth	%l6, [%g2 + 0x36]
	.word	0xde96d040	! t0_kref+0x3940:   	lduha	[%i3]0x82, %o7
	.word	0x8610201f	! t0_kref+0x3944:   	mov	0x1f, %g3
	.word	0x86a0e001	! t0_kref+0x3948:   	subcc	%g3, 1, %g3
	.word	0x22800016	! t0_kref+0x394c:   	be,a	_kref+0x39a4
	.word	0x93a01a29	! t0_kref+0x3950:   	fstoi	%f9, %f9
	.word	0xd84e401a	! t0_kref+0x3954:   	ldsb	[%i1 + %i2], %o4
	.word	0xec2e8018	! t0_kref+0x3958:   	stb	%l6, [%i2 + %i0]
	.word	0xd1bf5a59	! t0_kref+0x395c:   	stda	%f8, [%i5 + %i1]0xd2
	.word	0xd24e601f	! t0_kref+0x3960:   	ldsb	[%i1 + 0x1f], %o1
	.word	0x81da7e1d	! t0_kref+0x3964:   	flush	%o1 - 0x1e3
	.word	0xc19f5a18	! t0_kref+0x3968:   	ldda	[%i5 + %i0]0xd0, %f0
	.word	0xee6e201d	! t0_kref+0x396c:   	ldstub	[%i0 + 0x1d], %l7
	.word	0x1734836c	! t0_kref+0x3970:   	sethi	%hi(0xd20db000), %o3
	.word	0xc3200018	! t0_kref+0x3974:   	st	%f1, [%g0 + %i0]
	.word	0x92258017	! t0_kref+0x3978:   	sub	%l6, %l7, %o1
	.word	0x3f800001	! t0_kref+0x397c:   	fbo,a	_kref+0x3980
	.word	0x9505c016	! t0_kref+0x3980:   	taddcc	%l7, %l6, %o2
	.word	0x9045bae9	! t0_kref+0x3984:   	addc	%l6, -0x517, %o0
	.word	0x96058016	! t0_kref+0x3988:   	add	%l6, %l6, %o3
	.word	0xc168a04c	! t0_kref+0x398c:   	prefetch	%g2 + 0x4c, 0
	.word	0x99258016	! t0_kref+0x3990:   	mulscc	%l6, %l6, %o4
	.word	0x87a00023	! t0_kref+0x3994:   	fmovs	%f3, %f3
	.word	0x81df8018	! t0_kref+0x3998:   	flush	%fp + %i0
	.word	0x96dda4d9	! t0_kref+0x399c:   	smulcc	%l6, 0x4d9, %o3
	.word	0x9ee5bf51	! t0_kref+0x39a0:   	subccc	%l6, -0xaf, %o7
	.word	0x9075fc83	! t0_kref+0x39a4:   	udiv	%l7, -0x37d, %o0
	.word	0x81a88a24	! t0_kref+0x39a8:   	fcmps	%fcc0, %f2, %f4
	.word	0xc9be7fef	! t0_kref+0x39ac:   	stda	%f4, [%i1 - 0x11]%asi
	.word	0x9fc00004	! t0_kref+0x39b0:   	call	%g0 + %g4
	.word	0x98c5ef66	! t0_kref+0x39b4:   	addccc	%l7, 0xf66, %o4
	.word	0xc040a030	! t0_kref+0x39b8:   	ldsw	[%g2 + 0x30], %g0
	.word	0xec267ff4	! t0_kref+0x39bc:   	st	%l6, [%i1 - 0xc]
	sethi	%hi(2f), %o7
	.word	0xe40be208	! t0_kref+0x39c4:   	ldub	[%o7 + 0x208], %l2
	.word	0xa41ca00c	! t0_kref+0x39c8:   	xor	%l2, 0xc, %l2
	.word	0xe42be208	! t0_kref+0x39cc:   	stb	%l2, [%o7 + 0x208]
	.word	0x81dbe208	! t0_kref+0x39d0:   	flush	%o7 + 0x208
	.word	0x9835c017	! t0_kref+0x39d4:   	orn	%l7, %l7, %o4
	.word	0x87a00024	! t0_kref+0x39d8:   	fmovs	%f4, %f3
	.word	0x23800005	! t0_kref+0x39dc:   	fbne,a	_kref+0x39f0
	.word	0x98c5a4bb	! t0_kref+0x39e0:   	addccc	%l6, 0x4bb, %o4
	.word	0x98558016	! t0_kref+0x39e4:   	umul	%l6, %l6, %o4
	.word	0xed68a04a	! t0_kref+0x39e8:   	prefetch	%g2 + 0x4a, 22
	.word	0x87a018c2	! t0_kref+0x39ec:   	fdtos	%f2, %f3
	.word	0xe6ee501a	! t0_kref+0x39f0:   	ldstuba	[%i1 + %i2]0x80, %l3
	.word	0xf96e6000	! t0_kref+0x39f4:   	prefetch	%i1, 28
	.word	0x81a00940	! t0_kref+0x39f8:   	fmuld	%f0, %f0, %f0
	.word	0xe06e4000	! t0_kref+0x39fc:   	ldstub	[%i1], %l0
	.word	0xda7e3fe8	! t0_kref+0x3a00:   	swap	[%i0 - 0x18], %o5
	.word	0xec7f0018	! t0_kref+0x3a04:   	swap	[%i4 + %i0], %l6
2:	.word	0x81a249a1	! t0_kref+0x3a08:   	fdivs	%f9, %f1, %f0
	.word	0xde48a029	! t0_kref+0x3a0c:   	ldsb	[%g2 + 0x29], %o7
	.word	0xd0162000	! t0_kref+0x3a10:   	lduh	[%i0], %o0
	.word	0xe0981019	! t0_kref+0x3a14:   	ldda	[%g0 + %i1]0x80, %l0
	.word	0xc5b81019	! t0_kref+0x3a18:   	stda	%f2, [%g0 + %i1]0x80
	.word	0xecae5000	! t0_kref+0x3a1c:   	stba	%l6, [%i1]0x80
	.word	0xec36c019	! t0_kref+0x3a20:   	sth	%l6, [%i3 + %i1]
	.word	0xffee101b	! t0_kref+0x3a24:   	prefetcha	%i0 + %i3, 31
	.word	0x9ae5c017	! t0_kref+0x3a28:   	subccc	%l7, %l7, %o5
	.word	0x965dc016	! t0_kref+0x3a2c:   	smul	%l7, %l6, %o3
	.word	0xe09f5018	! t0_kref+0x3a30:   	ldda	[%i5 + %i0]0x80, %l0
	.word	0x878020d2	! t0_kref+0x3a34:   	mov	0xd2, %asi
	.word	0x85a109a6	! t0_kref+0x3a38:   	fdivs	%f4, %f6, %f2
	.word	0xee300018	! t0_kref+0x3a3c:   	sth	%l7, [%g0 + %i0]
	.word	0x91a01900	! t0_kref+0x3a40:   	fitod	%f0, %f8
	.word	0xcc006802	! t0_kref+0x3a44:   	ld	[%g1 + 0x802], %g6
	.word	0x37800006	! t0_kref+0x3a48:   	fbge,a	_kref+0x3a60
	.word	0xda16c019	! t0_kref+0x3a4c:   	lduh	[%i3 + %i1], %o5
	.word	0x37800008	! t0_kref+0x3a50:   	fbge,a	_kref+0x3a70
	.word	0x92adeb8e	! t0_kref+0x3a54:   	andncc	%l7, 0xb8e, %o1
	.word	0x81a94aa5	! t0_kref+0x3a58:   	fcmpes	%fcc0, %f5, %f5
	.word	0xec30a004	! t0_kref+0x3a5c:   	sth	%l6, [%g2 + 4]
	.word	0xd810001b	! t0_kref+0x3a60:   	lduh	[%g0 + %i3], %o4
	.word	0xec267ff8	! t0_kref+0x3a64:   	st	%l6, [%i1 - 8]
	.word	0x8045a679	! t0_kref+0x3a68:   	addc	%l6, 0x679, %g0
	.word	0x9075b01b	! t0_kref+0x3a6c:   	udiv	%l6, -0xfe5, %o0
	.word	0x9325b03f	! t0_kref+0x3a70:   	mulscc	%l6, -0xfc1, %o1
	.word	0x8da00946	! t0_kref+0x3a74:   	fmuld	%f0, %f6, %f6
	.word	0x91a008c8	! t0_kref+0x3a78:   	fsubd	%f0, %f8, %f8
	.word	0x9835b36b	! t0_kref+0x3a7c:   	orn	%l6, -0xc95, %o4
	.word	0x801da08c	! t0_kref+0x3a80:   	xor	%l6, 0x8c, %g0
	.word	0xee267ff8	! t0_kref+0x3a84:   	st	%l7, [%i1 - 8]
	.word	0xde10a01e	! t0_kref+0x3a88:   	lduh	[%g2 + 0x1e], %o7
	.word	0x9a758016	! t0_kref+0x3a8c:   	udiv	%l6, %l6, %o5
	.word	0x86102011	! t0_kref+0x3a90:   	mov	0x11, %g3
	.word	0x86a0e001	! t0_kref+0x3a94:   	subcc	%g3, 1, %g3
	.word	0x22800001	! t0_kref+0x3a98:   	be,a	_kref+0x3a9c
	.word	0x909da143	! t0_kref+0x3a9c:   	xorcc	%l6, 0x143, %o0
	.word	0x83a01882	! t0_kref+0x3aa0:   	fitos	%f2, %f1
	.word	0x94d58017	! t0_kref+0x3aa4:   	umulcc	%l6, %l7, %o2
	.word	0x80e5e075	! t0_kref+0x3aa8:   	subccc	%l7, 0x75, %g0
	.word	0x81a1c826	! t0_kref+0x3aac:   	fadds	%f7, %f6, %f0
	.word	0xde961000	! t0_kref+0x3ab0:   	lduha	[%i0]0x80, %o7
	.word	0x8da01a23	! t0_kref+0x3ab4:   	fstoi	%f3, %f6
	.word	0xe27e0000	! t0_kref+0x3ab8:   	swap	[%i0], %l1
	.word	0xc12e401c	! t0_kref+0x3abc:   	st	%fsr, [%i1 + %i4]
	.word	0x90a58016	! t0_kref+0x3ac0:   	subcc	%l6, %l6, %o0
	.word	0x81aa0a24	! t0_kref+0x3ac4:   	fcmps	%fcc0, %f8, %f4
	.word	0x92ad8016	! t0_kref+0x3ac8:   	andncc	%l6, %l6, %o1
	call	SYM(t0_subr3)
	.word	0x91a208c4	! t0_kref+0x3ad0:   	fsubd	%f8, %f4, %f8
	.word	0xee36600a	! t0_kref+0x3ad4:   	sth	%l7, [%i1 + 0xa]
	.word	0x91058016	! t0_kref+0x3ad8:   	taddcc	%l6, %l6, %o0
	.word	0xd2167fec	! t0_kref+0x3adc:   	lduh	[%i1 - 0x14], %o1
	.word	0x95418000	! t0_kref+0x3ae0:   	mov	%fprs, %o2
	.word	0xee264000	! t0_kref+0x3ae4:   	st	%l7, [%i1]
	.word	0x89a01920	! t0_kref+0x3ae8:   	fstod	%f0, %f4
	.word	0xc12e001c	! t0_kref+0x3aec:   	st	%fsr, [%i0 + %i4]
	.word	0x980dbdc5	! t0_kref+0x3af0:   	and	%l6, -0x23b, %o4
	.word	0xde5e2000	! t0_kref+0x3af4:   	ldx	[%i0], %o7
	.word	0x8025a443	! t0_kref+0x3af8:   	sub	%l6, 0x443, %g0
	.word	0x9740c000	! t0_kref+0x3afc:   	mov	%asi, %o3
	.word	0xcd1fbce0	! t0_kref+0x3b00:   	ldd	[%fp - 0x320], %f6
	.word	0xc91fbdc0	! t0_kref+0x3b04:   	ldd	[%fp - 0x240], %f4
	.word	0x909dabb2	! t0_kref+0x3b08:   	xorcc	%l6, 0xbb2, %o0
	.word	0x9a65aab0	! t0_kref+0x3b0c:   	subc	%l6, 0xab0, %o5
	.word	0xee367ffa	! t0_kref+0x3b10:   	sth	%l7, [%i1 - 6]
	.word	0x9045c017	! t0_kref+0x3b14:   	addc	%l7, %l7, %o0
	.word	0x93a249a9	! t0_kref+0x3b18:   	fdivs	%f9, %f9, %f9
	.word	0x98bdb353	! t0_kref+0x3b1c:   	xnorcc	%l6, -0xcad, %o4
	.word	0xd600a014	! t0_kref+0x3b20:   	ld	[%g2 + 0x14], %o3
	.word	0x9825e3a5	! t0_kref+0x3b24:   	sub	%l7, 0x3a5, %o4
	.word	0x21800003	! t0_kref+0x3b28:   	fbn,a	_kref+0x3b34
	.word	0x85a00024	! t0_kref+0x3b2c:   	fmovs	%f4, %f2
	.word	0x949d8017	! t0_kref+0x3b30:   	xorcc	%l6, %l7, %o2
	.word	0x85a20942	! t0_kref+0x3b34:   	fmuld	%f8, %f2, %f2
	sethi	%hi(1f), %o7
	jmpl	%o7+%lo(1f), %g1
	.empty
	.word	0xc807bfec	! t0_kref+0x3b40:   	ld	[%fp - 0x14], %g4
	.word	0x89a01a40	! t0_kref+0x3b44:   	fdtoi	%f0, %f4
	.word	0x8fa01a24	! t0_kref+0x3b48:   	fstoi	%f4, %f7
	.word	0x2d800002	! t0_kref+0x3b4c:   	fbg,a	_kref+0x3b54
	.word	0x920d8016	! t0_kref+0x3b50:   	and	%l6, %l6, %o1
1:	.word	0xe4086040	! t0_kref+0x3b54:   	ldub	[%g1 + 0x40], %l2
	.word	0xa41ca00c	! t0_kref+0x3b58:   	xor	%l2, 0xc, %l2
	.word	0xe4286040	! t0_kref+0x3b5c:   	stb	%l2, [%g1 + 0x40]
	.word	0x81d86040	! t0_kref+0x3b60:   	flush	%g1 + 0x40
	.word	0x94b58016	! t0_kref+0x3b64:   	orncc	%l6, %l6, %o2
	.word	0xee7e3ffc	! t0_kref+0x3b68:   	swap	[%i0 - 4], %l7
	.word	0x85a188c0	! t0_kref+0x3b6c:   	fsubd	%f6, %f0, %f2
	.word	0x993de00c	! t0_kref+0x3b70:   	sra	%l7, 0xc, %o4
	.word	0x94f5c016	! t0_kref+0x3b74:   	udivcc	%l7, %l6, %o2
	.word	0x97400000	! t0_kref+0x3b78:   	mov	%y, %o3
2:	.word	0xc9be1856	! t0_kref+0x3b7c:   	stda	%f4, [%i0 + %l6]0xc2
	.word	0xd66e7feb	! t0_kref+0x3b80:   	ldstub	[%i1 - 0x15], %o3
	.word	0xeb68a004	! t0_kref+0x3b84:   	prefetch	%g2 + 4, 21
	.word	0xd11fbdf0	! t0_kref+0x3b88:   	ldd	[%fp - 0x210], %f8
	.word	0xd11e2000	! t0_kref+0x3b8c:   	ldd	[%i0], %f8
	.word	0xc9a71019	! t0_kref+0x3b90:   	sta	%f4, [%i4 + %i1]0x80
	.word	0x85a188c4	! t0_kref+0x3b94:   	fsubd	%f6, %f4, %f2
	.word	0x980dc016	! t0_kref+0x3b98:   	and	%l7, %l6, %o4
	.word	0x903dc016	! t0_kref+0x3b9c:   	xnor	%l7, %l6, %o0
	.word	0x91a18948	! t0_kref+0x3ba0:   	fmuld	%f6, %f8, %f8
	.word	0x9495bfb8	! t0_kref+0x3ba4:   	orcc	%l6, -0x48, %o2
	.word	0x9b0d8017	! t0_kref+0x3ba8:   	tsubcc	%l6, %l7, %o5
	.word	0x9865ff42	! t0_kref+0x3bac:   	subc	%l7, -0xbe, %o4
	.word	0xf76e401a	! t0_kref+0x3bb0:   	prefetch	%i1 + %i2, 27
	.word	0xc36e4017	! t0_kref+0x3bb4:   	prefetch	%i1 + %l7, 1
	.word	0x9e258017	! t0_kref+0x3bb8:   	sub	%l6, %l7, %o7
	.word	0xe40860a8	! t0_kref+0x3bbc:   	ldub	[%g1 + 0xa8], %l2
	.word	0xa41ca00c	! t0_kref+0x3bc0:   	xor	%l2, 0xc, %l2
	.word	0xe42860a8	! t0_kref+0x3bc4:   	stb	%l2, [%g1 + 0xa8]
	.word	0x81d860a8	! t0_kref+0x3bc8:   	flush	%g1 + 0xa8
	.word	0x9b25c017	! t0_kref+0x3bcc:   	mulscc	%l7, %l7, %o5
	.word	0xc11fbee8	! t0_kref+0x3bd0:   	ldd	[%fp - 0x118], %f0
	.word	0x81a00022	! t0_kref+0x3bd4:   	fmovs	%f2, %f0
	.word	0x98d5abe0	! t0_kref+0x3bd8:   	umulcc	%l6, 0xbe0, %o4
	.word	0x8da000a6	! t0_kref+0x3bdc:   	fnegs	%f6, %f6
	.word	0x989da88c	! t0_kref+0x3be0:   	xorcc	%l6, 0x88c, %o4
2:	.word	0xc5bf5018	! t0_kref+0x3be4:   	stda	%f2, [%i5 + %i0]0x80
	.word	0xd27e2008	! t0_kref+0x3be8:   	swap	[%i0 + 8], %o1
	.word	0x963dc017	! t0_kref+0x3bec:   	xnor	%l7, %l7, %o3
	.word	0x81a88aa8	! t0_kref+0x3bf0:   	fcmpes	%fcc0, %f2, %f8
	.word	0xc36e7fe8	! t0_kref+0x3bf4:   	prefetch	%i1 - 0x18, 1
	.word	0x81a9ca21	! t0_kref+0x3bf8:   	fcmps	%fcc0, %f7, %f1
	.word	0x94458016	! t0_kref+0x3bfc:   	addc	%l6, %l6, %o2
	.word	0xd43f4019	! t0_kref+0x3c00:   	std	%o2, [%i5 + %i1]
	sethi	%hi(2f), %o7
	.word	0xe40be044	! t0_kref+0x3c08:   	ldub	[%o7 + 0x44], %l2
	.word	0xa41ca00c	! t0_kref+0x3c0c:   	xor	%l2, 0xc, %l2
	.word	0xe42be044	! t0_kref+0x3c10:   	stb	%l2, [%o7 + 0x44]
	.word	0x81dbe044	! t0_kref+0x3c14:   	flush	%o7 + 0x44
	.word	0x81a00021	! t0_kref+0x3c18:   	fmovs	%f1, %f0
	.word	0xc1200018	! t0_kref+0x3c1c:   	st	%f0, [%g0 + %i0]
	.word	0xee260000	! t0_kref+0x3c20:   	st	%l7, [%i0]
	.word	0x9ac58016	! t0_kref+0x3c24:   	addccc	%l6, %l6, %o5
	.word	0x8da18946	! t0_kref+0x3c28:   	fmuld	%f6, %f6, %f6
	.word	0xc1beda18	! t0_kref+0x3c2c:   	stda	%f0, [%i3 + %i0]0xd0
	.word	0x81a9caa5	! t0_kref+0x3c30:   	fcmpes	%fcc0, %f7, %f5
	.word	0xc9ee5016	! t0_kref+0x3c34:   	prefetcha	%i1 + %l6, 4
	.word	0xd286101c	! t0_kref+0x3c38:   	lda	[%i0 + %i4]0x80, %o1
	.word	0x25800001	! t0_kref+0x3c3c:   	fblg,a	_kref+0x3c40
	.word	0x98c58017	! t0_kref+0x3c40:   	addccc	%l6, %l7, %o4
2:	.word	0x91a01a24	! t0_kref+0x3c44:   	fstoi	%f4, %f8
	.word	0x80ddc017	! t0_kref+0x3c48:   	smulcc	%l7, %l7, %g0
	.word	0xcd1f4018	! t0_kref+0x3c4c:   	ldd	[%i5 + %i0], %f6
	.word	0x9e558017	! t0_kref+0x3c50:   	umul	%l6, %l7, %o7
	.word	0x89a0c8a7	! t0_kref+0x3c54:   	fsubs	%f3, %f7, %f4
	call	SYM(t0_subr2)
	.word	0xcf263ff8	! t0_kref+0x3c5c:   	st	%f7, [%i0 - 8]
	.word	0xd610a01e	! t0_kref+0x3c60:   	lduh	[%g2 + 0x1e], %o3
	.word	0xc807bff0	! t0_kref+0x3c64:   	ld	[%fp - 0x10], %g4
	.word	0x8da00025	! t0_kref+0x3c68:   	fmovs	%f5, %f6
	.word	0x8143e040	! t0_kref+0x3c6c:   	membar	0x40
	.word	0x81a04822	! t0_kref+0x3c70:   	fadds	%f1, %f2, %f0
	.word	0x91700017	! t0_kref+0x3c74:   	popc	%l7, %o0
	.word	0x2f800002	! t0_kref+0x3c78:   	fbu,a	_kref+0x3c80
	.word	0x8143c000	! t0_kref+0x3c7c:   	stbar
	.word	0xc06e8019	! t0_kref+0x3c80:   	ldstub	[%i2 + %i1], %g0
	.word	0xf9ee501c	! t0_kref+0x3c84:   	prefetcha	%i1 + %i4, 28
	.word	0xd896d019	! t0_kref+0x3c88:   	lduha	[%i3 + %i1]0x80, %o4
	.word	0x21800004	! t0_kref+0x3c8c:   	fbn,a	_kref+0x3c9c
	.word	0xc51e2018	! t0_kref+0x3c90:   	ldd	[%i0 + 0x18], %f2
	.word	0xc0164000	! t0_kref+0x3c94:   	lduh	[%i1], %g0
	.word	0x9e35bddd	! t0_kref+0x3c98:   	orn	%l6, -0x223, %o7
	.word	0xc016001b	! t0_kref+0x3c9c:   	lduh	[%i0 + %i3], %g0
	.word	0x89a01929	! t0_kref+0x3ca0:   	fstod	%f9, %f4
	.word	0x80758017	! t0_kref+0x3ca4:   	udiv	%l6, %l7, %g0
	.word	0x98bdb63f	! t0_kref+0x3ca8:   	xnorcc	%l6, -0x9c1, %o4
	.word	0xc300a008	! t0_kref+0x3cac:   	ld	[%g2 + 8], %f1
	.word	0x81858000	! t0_kref+0x3cb0:   	wr	%l6, %g0, %y
	.word	0xd11fbc30	! t0_kref+0x3cb4:   	ldd	[%fp - 0x3d0], %f8
	.word	0x93400000	! t0_kref+0x3cb8:   	mov	%y, %o1
	.word	0xec3e401d	! t0_kref+0x3cbc:   	std	%l6, [%i1 + %i5]
	.word	0x85a000a4	! t0_kref+0x3cc0:   	fnegs	%f4, %f2
	.word	0xd25f4019	! t0_kref+0x3cc4:   	ldx	[%i5 + %i1], %o1
	.word	0x81dc8017	! t0_kref+0x3cc8:   	flush	%l2 + %l7
	.word	0xd2070005	! t0_kref+0x3ccc:   	ld	[%i4 + %g5], %o1
	.word	0xd46e4000	! t0_kref+0x3cd0:   	ldstub	[%i1], %o2
	.word	0x153ae117	! t0_kref+0x3cd4:   	sethi	%hi(0xeb845c00), %o2
	.word	0x90b5aa4b	! t0_kref+0x3cd8:   	orncc	%l6, 0xa4b, %o0
	.word	0x9e95f4aa	! t0_kref+0x3cdc:   	orcc	%l7, -0xb56, %o7
	.word	0x81dc401a	! t0_kref+0x3ce0:   	flush	%l1 + %i2
	.word	0x9695fb39	! t0_kref+0x3ce4:   	orcc	%l7, -0x4c7, %o3
	.word	0x9fc10000	! t0_kref+0x3ce8:   	call	%g4
	.word	0x9865be18	! t0_kref+0x3cec:   	subc	%l6, -0x1e8, %o4
	.word	0x8ba049a3	! t0_kref+0x3cf0:   	fdivs	%f1, %f3, %f5
	.word	0xe83e3ff0	! t0_kref+0x3cf4:   	std	%l4, [%i0 - 0x10]
	.word	0x9255e9ed	! t0_kref+0x3cf8:   	umul	%l7, 0x9ed, %o1
	.word	0x90758017	! t0_kref+0x3cfc:   	udiv	%l6, %l7, %o0
	.word	0xde480018	! t0_kref+0x3d00:   	ldsb	[%g0 + %i0], %o7
	.word	0xe068a007	! t0_kref+0x3d04:   	ldstub	[%g2 + 7], %l0
	call	SYM(t0_subr0)
	.word	0xc1180018	! t0_kref+0x3d0c:   	ldd	[%g0 + %i0], %f0
	.word	0x9a95c016	! t0_kref+0x3d10:   	orcc	%l7, %l6, %o5
	.word	0x91a01903	! t0_kref+0x3d14:   	fitod	%f3, %f8
	.word	0x929d8016	! t0_kref+0x3d18:   	xorcc	%l6, %l6, %o1
	.word	0x9ef58016	! t0_kref+0x3d1c:   	udivcc	%l6, %l6, %o7
	.word	0xec3e001d	! t0_kref+0x3d20:   	std	%l6, [%i0 + %i5]
	.word	0xc120a004	! t0_kref+0x3d24:   	st	%f0, [%g2 + 4]
	.word	0x86102010	! t0_kref+0x3d28:   	mov	0x10, %g3
	.word	0x86a0e001	! t0_kref+0x3d2c:   	subcc	%g3, 1, %g3
	.word	0x22800005	! t0_kref+0x3d30:   	be,a	_kref+0x3d44
	.word	0x81de8014	! t0_kref+0x3d34:   	flush	%i2 + %l4
	.word	0x85a20942	! t0_kref+0x3d38:   	fmuld	%f8, %f2, %f2
	.word	0xeeb6d019	! t0_kref+0x3d3c:   	stha	%l7, [%i3 + %i1]0x80
	.word	0x99400000	! t0_kref+0x3d40:   	mov	%y, %o4
	.word	0x9a0dbcdd	! t0_kref+0x3d44:   	and	%l6, -0x323, %o5
	.word	0x81258016	! t0_kref+0x3d48:   	mulscc	%l6, %l6, %g0
	.word	0x800d8017	! t0_kref+0x3d4c:   	and	%l6, %l7, %g0
	.word	0x9fc10000	! t0_kref+0x3d50:   	call	%g4
	.word	0x8185c000	! t0_kref+0x3d54:   	wr	%l7, %g0, %y
	.word	0xf9ee101b	! t0_kref+0x3d58:   	prefetcha	%i0 + %i3, 28
	.word	0xc1ee5017	! t0_kref+0x3d5c:   	prefetcha	%i1 + %l7, 0
	.word	0x80558017	! t0_kref+0x3d60:   	umul	%l6, %l7, %g0
	.word	0x9495c016	! t0_kref+0x3d64:   	orcc	%l7, %l6, %o2
	.word	0x9fc10000	! t0_kref+0x3d68:   	call	%g4
	.word	0x9235c016	! t0_kref+0x3d6c:   	orn	%l7, %l6, %o1
	.word	0x98ada28a	! t0_kref+0x3d70:   	andncc	%l6, 0x28a, %o4
	.word	0x9495e134	! t0_kref+0x3d74:   	orcc	%l7, 0x134, %o2
	.word	0x8143c000	! t0_kref+0x3d78:   	stbar
	.word	0xe7e65016	! t0_kref+0x3d7c:   	casa	[%i1]0x80, %l6, %l3
	.word	0x98358016	! t0_kref+0x3d80:   	orn	%l6, %l6, %o4
	.word	0xd1be5a1d	! t0_kref+0x3d84:   	stda	%f8, [%i1 + %i5]0xd0
	.word	0xee762000	! t0_kref+0x3d88:   	stx	%l7, [%i0]
	.word	0xee30a012	! t0_kref+0x3d8c:   	sth	%l7, [%g2 + 0x12]
	.word	0x9b400000	! t0_kref+0x3d90:   	mov	%y, %o5
	.word	0xec263ffc	! t0_kref+0x3d94:   	st	%l6, [%i0 - 4]
	.word	0x81aa0a25	! t0_kref+0x3d98:   	fcmps	%fcc0, %f8, %f5
	.word	0x9ef58017	! t0_kref+0x3d9c:   	udivcc	%l6, %l7, %o7
	.word	0xc91fbf80	! t0_kref+0x3da0:   	ldd	[%fp - 0x80], %f4
	.word	0x92a5ff1a	! t0_kref+0x3da4:   	subcc	%l7, -0xe6, %o1
	.word	0x8fa018c8	! t0_kref+0x3da8:   	fdtos	%f8, %f7
	.word	0x94958016	! t0_kref+0x3dac:   	orcc	%l6, %l6, %o2
	.word	0x81a01905	! t0_kref+0x3db0:   	fitod	%f5, %f0
	.word	0x90458017	! t0_kref+0x3db4:   	addc	%l6, %l7, %o0
	.word	0x9f3de002	! t0_kref+0x3db8:   	sra	%l7, 0x2, %o7
	.word	0x89a018c8	! t0_kref+0x3dbc:   	fdtos	%f8, %f4
	.word	0xf9ee101a	! t0_kref+0x3dc0:   	prefetcha	%i0 + %i2, 28
	.word	0x35800003	! t0_kref+0x3dc4:   	fbue,a	_kref+0x3dd0
	.word	0x9b2dc016	! t0_kref+0x3dc8:   	sll	%l7, %l6, %o5
	.word	0x91a188c0	! t0_kref+0x3dcc:   	fsubd	%f6, %f0, %f8
	.word	0x9905b189	! t0_kref+0x3dd0:   	taddcc	%l6, -0xe77, %o4
	.word	0x91a18846	! t0_kref+0x3dd4:   	faddd	%f6, %f6, %f8
	.word	0xe1f61017	! t0_kref+0x3dd8:   	casxa	[%i0]0x80, %l7, %l0
	.word	0x90d58016	! t0_kref+0x3ddc:   	umulcc	%l6, %l6, %o0
	.word	0x93a018c2	! t0_kref+0x3de0:   	fdtos	%f2, %f9
	.word	0xd13f4018	! t0_kref+0x3de4:   	std	%f8, [%i5 + %i0]
	.word	0x90558017	! t0_kref+0x3de8:   	umul	%l6, %l7, %o0
	.word	0xee30a006	! t0_kref+0x3dec:   	sth	%l7, [%g2 + 6]
	.word	0x96758017	! t0_kref+0x3df0:   	udiv	%l6, %l7, %o3
	.word	0x81a90a21	! t0_kref+0x3df4:   	fcmps	%fcc0, %f4, %f1
	.word	0x9e25c017	! t0_kref+0x3df8:   	sub	%l7, %l7, %o7
	.word	0x933d8016	! t0_kref+0x3dfc:   	sra	%l6, %l6, %o1
	.word	0x813da003	! t0_kref+0x3e00:   	sra	%l6, 0x3, %g0
	.word	0x91a01888	! t0_kref+0x3e04:   	fitos	%f8, %f8
	.word	0x90ddea3c	! t0_kref+0x3e08:   	smulcc	%l7, 0xa3c, %o0
	.word	0xc12e2014	! t0_kref+0x3e0c:   	st	%fsr, [%i0 + 0x14]
	.word	0xd87e001c	! t0_kref+0x3e10:   	swap	[%i0 + %i4], %o4
	.word	0x86102003	! t0_kref+0x3e14:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x3e18:   	bne,a	_kref+0x3e18
	.word	0x86a0e001	! t0_kref+0x3e1c:   	subcc	%g3, 1, %g3
	.word	0xda7e3ff4	! t0_kref+0x3e20:   	swap	[%i0 - 0xc], %o5
	.word	0x89a00944	! t0_kref+0x3e24:   	fmuld	%f0, %f4, %f4
	.word	0xee30a028	! t0_kref+0x3e28:   	sth	%l7, [%g2 + 0x28]
	.word	0xe87e6008	! t0_kref+0x3e2c:   	swap	[%i1 + 8], %l4
	.word	0xd1260000	! t0_kref+0x3e30:   	st	%f8, [%i0]
	.word	0x92d5acd8	! t0_kref+0x3e34:   	umulcc	%l6, 0xcd8, %o1
	.word	0x9f358017	! t0_kref+0x3e38:   	srl	%l6, %l7, %o7
	.word	0xed6e3ff8	! t0_kref+0x3e3c:   	prefetch	%i0 - 8, 22
	.word	0x878020d2	! t0_kref+0x3e40:   	mov	0xd2, %asi
	.word	0xc99e3fe0	! t0_kref+0x3e44:   	ldda	[%i0 - 0x20]%asi, %f4
	.word	0x81a84aa4	! t0_kref+0x3e48:   	fcmpes	%fcc0, %f1, %f4
	.word	0x8075e03d	! t0_kref+0x3e4c:   	udiv	%l7, 0x3d, %g0
	.word	0xd11fbd60	! t0_kref+0x3e50:   	ldd	[%fp - 0x2a0], %f8
	.word	0x81a0cd29	! t0_kref+0x3e54:   	fsmuld	%f3, %f9, %f0
	.word	0x92ddaad5	! t0_kref+0x3e58:   	smulcc	%l6, 0xad5, %o1
	.word	0x9e006324	! t0_kref+0x3e5c:   	add	%g1, 0x324, %o7
!	.word	0x314fb068	! t0_kref+0x3e60:   	fba,a,pt	%fcc0, SYM(t0_subr1)
	   	fba,a,pt	%fcc0, SYM(t0_subr1)
	.word	0x8185c000	! t0_kref+0x3e64:   	wr	%l7, %g0, %y
	.word	0x87a00020	! t0_kref+0x3e68:   	fmovs	%f0, %f3
	.word	0x86102004	! t0_kref+0x3e6c:   	mov	0x4, %g3
	.word	0x86a0e001	! t0_kref+0x3e70:   	subcc	%g3, 1, %g3
	.word	0x2280001e	! t0_kref+0x3e74:   	be,a	_kref+0x3eec
	.word	0x93a01a26	! t0_kref+0x3e78:   	fstoi	%f6, %f9
	.word	0xda48a030	! t0_kref+0x3e7c:   	ldsb	[%g2 + 0x30], %o5
	.word	0xd1be1856	! t0_kref+0x3e80:   	stda	%f8, [%i0 + %l6]0xc2
	.word	0xc11fbfc8	! t0_kref+0x3e84:   	ldd	[%fp - 0x38], %f0
	.word	0x9475a41e	! t0_kref+0x3e88:   	udiv	%l6, 0x41e, %o2
	.word	0x01200b19	! t0_kref+0x3e8c:   	sethi	%hi(0x802c6400), %g0
	.word	0xc06e8019	! t0_kref+0x3e90:   	ldstub	[%i2 + %i1], %g0
	.word	0x011dd4ca	! t0_kref+0x3e94:   	sethi	%hi(0x77532800), %g0
	.word	0xc040a014	! t0_kref+0x3e98:   	ldsw	[%g2 + 0x14], %g0
	.word	0x9065c016	! t0_kref+0x3e9c:   	subc	%l7, %l6, %o0
	.word	0xec1f4019	! t0_kref+0x3ea0:   	ldd	[%i5 + %i1], %l6
	.word	0x8d85b79a	! t0_kref+0x3ea4:   	wr	%l6, 0xfffff79a, %fprs
	.word	0x81a9caa2	! t0_kref+0x3ea8:   	fcmpes	%fcc0, %f7, %f2
	.word	0xc16e2010	! t0_kref+0x3eac:   	prefetch	%i0 + 0x10, 0
	.word	0x8045f565	! t0_kref+0x3eb0:   	addc	%l7, -0xa9b, %g0
	.word	0x9340c000	! t0_kref+0x3eb4:   	mov	%asi, %o1
	.word	0x9845fb6d	! t0_kref+0x3eb8:   	addc	%l7, -0x493, %o4
	.word	0x81a018c0	! t0_kref+0x3ebc:   	fdtos	%f0, %f0
	.word	0x9fc10000	! t0_kref+0x3ec0:   	call	%g4
	.word	0xd11fbd80	! t0_kref+0x3ec4:   	ldd	[%fp - 0x280], %f8
	.word	0x85a00942	! t0_kref+0x3ec8:   	fmuld	%f0, %f2, %f2
	.word	0x35bfffe9	! t0_kref+0x3ecc:   	fbue,a	_kref+0x3e70
	.word	0xe67e3ff8	! t0_kref+0x3ed0:   	swap	[%i0 - 8], %l3
	.word	0x98e5fbf6	! t0_kref+0x3ed4:   	subccc	%l7, -0x40a, %o4
	.word	0xc3063fec	! t0_kref+0x3ed8:   	ld	[%i0 - 0x14], %f1
	.word	0xee6e001a	! t0_kref+0x3edc:   	ldstub	[%i0 + %i2], %l7
	.word	0xe09e101d	! t0_kref+0x3ee0:   	ldda	[%i0 + %i5]0x80, %l0
	.word	0x8da1cd28	! t0_kref+0x3ee4:   	fsmuld	%f7, %f8, %f6
	.word	0x80c5e646	! t0_kref+0x3ee8:   	addccc	%l7, 0x646, %g0
	.word	0xeb68a04d	! t0_kref+0x3eec:   	prefetch	%g2 + 0x4d, 21
	.word	0xec36401b	! t0_kref+0x3ef0:   	sth	%l6, [%i1 + %i3]
	.word	0x8da01905	! t0_kref+0x3ef4:   	fitod	%f5, %f6
	.word	0x81a000c0	! t0_kref+0x3ef8:   	fnegd	%f0, %f0
	.word	0xc91fbec8	! t0_kref+0x3efc:   	ldd	[%fp - 0x138], %f4
	.word	0xec28a01d	! t0_kref+0x3f00:   	stb	%l6, [%g2 + 0x1d]
	.word	0x94658017	! t0_kref+0x3f04:   	subc	%l6, %l7, %o2
	.word	0xd13e401d	! t0_kref+0x3f08:   	std	%f8, [%i1 + %i5]
	.word	0x89a109a4	! t0_kref+0x3f0c:   	fdivs	%f4, %f4, %f4
	.word	0x23800004	! t0_kref+0x3f10:   	fbne,a	_kref+0x3f20
	.word	0xc9070018	! t0_kref+0x3f14:   	ld	[%i4 + %i0], %f4
	.word	0xec30a02e	! t0_kref+0x3f18:   	sth	%l6, [%g2 + 0x2e]
	.word	0x85a00946	! t0_kref+0x3f1c:   	fmuld	%f0, %f6, %f2
	.word	0x81a089c6	! t0_kref+0x3f20:   	fdivd	%f2, %f6, %f0
	.word	0x90c58016	! t0_kref+0x3f24:   	addccc	%l6, %l6, %o0
	.word	0x8143e040	! t0_kref+0x3f28:   	membar	0x40
	.word	0x8140c000	! t0_kref+0x3f2c:   	mov	%asi, %g0
	.word	0xc1be1817	! t0_kref+0x3f30:   	stda	%f0, [%i0 + %l7]0xc0
	.word	0x8fa109a5	! t0_kref+0x3f34:   	fdivs	%f4, %f5, %f7
	.word	0x9295bdf1	! t0_kref+0x3f38:   	orcc	%l6, -0x20f, %o1
	.word	0x9075e0d6	! t0_kref+0x3f3c:   	udiv	%l7, 0xd6, %o0
	.word	0x81a88a26	! t0_kref+0x3f40:   	fcmps	%fcc0, %f2, %f6
	.word	0x8da18942	! t0_kref+0x3f44:   	fmuld	%f6, %f2, %f6
	.word	0x9fc00004	! t0_kref+0x3f48:   	call	%g0 + %g4
	.word	0x91400000	! t0_kref+0x3f4c:   	mov	%y, %o0
	.word	0x8143c000	! t0_kref+0x3f50:   	stbar
	.word	0xc236c000	! t0_kref+0x3f54:   	sth	%g1, [%i3]
	.word	0xec2e0000	! t0_kref+0x3f58:   	stb	%l6, [%i0]
	.word	0xf5ee101a	! t0_kref+0x3f5c:   	prefetcha	%i0 + %i2, 26
	.word	0x9065c016	! t0_kref+0x3f60:   	subc	%l7, %l6, %o0
	.word	0x81a8ca24	! t0_kref+0x3f64:   	fcmps	%fcc0, %f3, %f4
	.word	0xee20a034	! t0_kref+0x3f68:   	st	%l7, [%g2 + 0x34]
	.word	0x8143e040	! t0_kref+0x3f6c:   	membar	0x40
	.word	0x965db74b	! t0_kref+0x3f70:   	smul	%l6, -0x8b5, %o3
	.word	0xee366014	! t0_kref+0x3f74:   	sth	%l7, [%i1 + 0x14]
	.word	0x81a208c0	! t0_kref+0x3f78:   	fsubd	%f8, %f0, %f0
	.word	0x8143c000	! t0_kref+0x3f7c:   	stbar
	.word	0x9045fcf5	! t0_kref+0x3f80:   	addc	%l7, -0x30b, %o0
	.word	0x90c5c016	! t0_kref+0x3f84:   	addccc	%l7, %l6, %o0
	.word	0x90c58017	! t0_kref+0x3f88:   	addccc	%l6, %l7, %o0
	.word	0xc168a00b	! t0_kref+0x3f8c:   	prefetch	%g2 + 0xb, 0
	.word	0x21800002	! t0_kref+0x3f90:   	fbn,a	_kref+0x3f98
	.word	0xc368a04e	! t0_kref+0x3f94:   	prefetch	%g2 + 0x4e, 1
	.word	0xd616401b	! t0_kref+0x3f98:   	lduh	[%i1 + %i3], %o3
	.word	0x8610201b	! t0_kref+0x3f9c:   	mov	0x1b, %g3
	.word	0x86a0e001	! t0_kref+0x3fa0:   	subcc	%g3, 1, %g3
	.word	0x2280000b	! t0_kref+0x3fa4:   	be,a	_kref+0x3fd0
	.word	0x8da00d26	! t0_kref+0x3fa8:   	fsmuld	%f0, %f6, %f6
	.word	0xc9180019	! t0_kref+0x3fac:   	ldd	[%g0 + %i1], %f4
	.word	0x905dafe1	! t0_kref+0x3fb0:   	smul	%l6, 0xfe1, %o0
	.word	0xc11f4019	! t0_kref+0x3fb4:   	ldd	[%i5 + %i1], %f0
	.word	0x89a000a5	! t0_kref+0x3fb8:   	fnegs	%f5, %f4
	.word	0xee30a006	! t0_kref+0x3fbc:   	sth	%l7, [%g2 + 6]
	.word	0x9865ff46	! t0_kref+0x3fc0:   	subc	%l7, -0xba, %o4
	.word	0xee30a010	! t0_kref+0x3fc4:   	sth	%l7, [%g2 + 0x10]
	.word	0x81858000	! t0_kref+0x3fc8:   	wr	%l6, %g0, %y
	.word	0x81a98aa9	! t0_kref+0x3fcc:   	fcmpes	%fcc0, %f6, %f9
	.word	0x80758017	! t0_kref+0x3fd0:   	udiv	%l6, %l7, %g0
	.word	0x93a00122	! t0_kref+0x3fd4:   	fabss	%f2, %f9
	.word	0xc16e0017	! t0_kref+0x3fd8:   	prefetch	%i0 + %l7, 0
	.word	0xd1270019	! t0_kref+0x3fdc:   	st	%f8, [%i4 + %i1]
	.word	0x8ba018c6	! t0_kref+0x3fe0:   	fdtos	%f6, %f5
	.word	0x9a5dc016	! t0_kref+0x3fe4:   	smul	%l7, %l6, %o5
	.word	0x80e5a265	! t0_kref+0x3fe8:   	subccc	%l6, 0x265, %g0
	.word	0xd4162010	! t0_kref+0x3fec:   	lduh	[%i0 + 0x10], %o2
	.word	0x86102004	! t0_kref+0x3ff0:   	mov	0x4, %g3
	.word	0x86a0e001	! t0_kref+0x3ff4:   	subcc	%g3, 1, %g3
	.word	0x22800006	! t0_kref+0x3ff8:   	be,a	_kref+0x4010
	.word	0x9435a837	! t0_kref+0x3ffc:   	orn	%l6, 0x837, %o2
	.word	0xda6e200a	! t0_kref+0x4000:   	ldstub	[%i0 + 0xa], %o5
	.word	0x81a98ac4	! t0_kref+0x4004:   	fcmped	%fcc0, %f6, %f4
	.word	0x973da000	! t0_kref+0x4008:   	sra	%l6, 0x0, %o3
	.word	0x8da109a3	! t0_kref+0x400c:   	fdivs	%f4, %f3, %f6
	.word	0xec30a00c	! t0_kref+0x4010:   	sth	%l6, [%g2 + 0xc]
	.word	0x99258017	! t0_kref+0x4014:   	mulscc	%l6, %l7, %o4
	.word	0xe86e8019	! t0_kref+0x4018:   	ldstub	[%i2 + %i1], %l4
	.word	0xc16e4017	! t0_kref+0x401c:   	prefetch	%i1 + %l7, 0
	.word	0x8005c016	! t0_kref+0x4020:   	add	%l7, %l6, %g0
	.word	0xf76e401a	! t0_kref+0x4024:   	prefetch	%i1 + %i2, 27
	.word	0x98258016	! t0_kref+0x4028:   	sub	%l6, %l6, %o4
	.word	0x92f58017	! t0_kref+0x402c:   	udivcc	%l6, %l7, %o1
	.word	0x9b35e011	! t0_kref+0x4030:   	srl	%l7, 0x11, %o5
	.word	0xd4d6101b	! t0_kref+0x4034:   	ldsha	[%i0 + %i3]0x80, %o2
	.word	0x132fedce	! t0_kref+0x4038:   	sethi	%hi(0xbfb73800), %o1
	.word	0x9005e649	! t0_kref+0x403c:   	add	%l7, 0x649, %o0
	.word	0xc5263fe8	! t0_kref+0x4040:   	st	%f2, [%i0 - 0x18]
	.word	0x85a009c4	! t0_kref+0x4044:   	fdivd	%f0, %f4, %f2
	.word	0xec270019	! t0_kref+0x4048:   	st	%l6, [%i4 + %i1]
	.word	0xe56e401c	! t0_kref+0x404c:   	prefetch	%i1 + %i4, 18
	.word	0xc07e7fe8	! t0_kref+0x4050:   	swap	[%i1 - 0x18], %g0
	.word	0x933da016	! t0_kref+0x4054:   	sra	%l6, 0x16, %o1
	.word	0x90c5c017	! t0_kref+0x4058:   	addccc	%l7, %l7, %o0
	.word	0x925dc017	! t0_kref+0x405c:   	smul	%l7, %l7, %o1
	.word	0x9665c017	! t0_kref+0x4060:   	subc	%l7, %l7, %o3
	.word	0x37800001	! t0_kref+0x4064:   	fbge,a	_kref+0x4068
	.word	0xec28a000	! t0_kref+0x4068:   	stb	%l6, [%g2]
	.word	0x83a018c4	! t0_kref+0x406c:   	fdtos	%f4, %f1
	.word	0xcd1fbd88	! t0_kref+0x4070:   	ldd	[%fp - 0x278], %f6
	.word	0x8143c000	! t0_kref+0x4074:   	stbar
	.word	0x913da018	! t0_kref+0x4078:   	sra	%l6, 0x18, %o0
	.word	0x92a5e88d	! t0_kref+0x407c:   	subcc	%l7, 0x88d, %o1
	.word	0x928d8017	! t0_kref+0x4080:   	andcc	%l6, %l7, %o1
	.word	0x913d8017	! t0_kref+0x4084:   	sra	%l6, %l7, %o0
	.word	0x9f414000	! t0_kref+0x4088:   	mov	%pc, %o7
!	.word	0x3c4fafdd	! t0_kref+0x408c:   	bpos,a,pt	%icc, SYM(t0_subr1)
	   	bpos,a,pt	%icc, SYM(t0_subr1)
	.word	0x92d5ae9f	! t0_kref+0x4090:   	umulcc	%l6, 0xe9f, %o1
	.word	0x85a01905	! t0_kref+0x4094:   	fitod	%f5, %f2
	.word	0xec270018	! t0_kref+0x4098:   	st	%l6, [%i4 + %i0]
	.word	0x8143c000	! t0_kref+0x409c:   	stbar
	.word	0xcd266008	! t0_kref+0x40a0:   	st	%f6, [%i1 + 8]
	.word	0xec3e001d	! t0_kref+0x40a4:   	std	%l6, [%i0 + %i5]
	.word	0x9035c017	! t0_kref+0x40a8:   	orn	%l7, %l7, %o0
	.word	0xec267fe0	! t0_kref+0x40ac:   	st	%l6, [%i1 - 0x20]
	.word	0x85a018c2	! t0_kref+0x40b0:   	fdtos	%f2, %f2
	.word	0xecae501a	! t0_kref+0x40b4:   	stba	%l6, [%i1 + %i2]0x80
	.word	0xcd1fbe68	! t0_kref+0x40b8:   	ldd	[%fp - 0x198], %f6
	.word	0xde16401b	! t0_kref+0x40bc:   	lduh	[%i1 + %i3], %o7
	.word	0x8da01084	! t0_kref+0x40c0:   	fxtos	%f4, %f6
	.word	0x80d5b8ec	! t0_kref+0x40c4:   	umulcc	%l6, -0x714, %g0
	.word	0x90e5e930	! t0_kref+0x40c8:   	subccc	%l7, 0x930, %o0
	.word	0x90d58017	! t0_kref+0x40cc:   	umulcc	%l6, %l7, %o0
	.word	0x81a9c040	! t0_kref+0x40d0:   	fmovdu	%fcc0, %f0, %f0
	.word	0x92d58017	! t0_kref+0x40d4:   	umulcc	%l6, %l7, %o1
	.word	0xe678a034	! t0_kref+0x40d8:   	swap	[%g2 + 0x34], %l3
	.word	0x9a45ecf9	! t0_kref+0x40dc:   	addc	%l7, 0xcf9, %o5
	.word	0x81a94aa6	! t0_kref+0x40e0:   	fcmpes	%fcc0, %f5, %f6
	.word	0x89a000a0	! t0_kref+0x40e4:   	fnegs	%f0, %f4
	sethi	%hi(2f), %o7
	.word	0xe40be12c	! t0_kref+0x40ec:   	ldub	[%o7 + 0x12c], %l2
	.word	0xa41ca00c	! t0_kref+0x40f0:   	xor	%l2, 0xc, %l2
	.word	0xe42be12c	! t0_kref+0x40f4:   	stb	%l2, [%o7 + 0x12c]
	.word	0x81dbe12c	! t0_kref+0x40f8:   	flush	%o7 + 0x12c
	.word	0x80c5f1a2	! t0_kref+0x40fc:   	addccc	%l7, -0xe5e, %g0
	.word	0xee362006	! t0_kref+0x4100:   	sth	%l7, [%i0 + 6]
	.word	0x87a000a6	! t0_kref+0x4104:   	fnegs	%f6, %f3
	.word	0x89a00844	! t0_kref+0x4108:   	faddd	%f0, %f4, %f4
	.word	0xc0865000	! t0_kref+0x410c:   	lda	[%i1]0x80, %g0
	.word	0x9af5f047	! t0_kref+0x4110:   	udivcc	%l7, -0xfb9, %o5
	.word	0xecf81019	! t0_kref+0x4114:   	swapa	[%g0 + %i1]0x80, %l6
	.word	0xee6e3ff9	! t0_kref+0x4118:   	ldstub	[%i0 - 7], %l7
	.word	0x8da01927	! t0_kref+0x411c:   	fstod	%f7, %f6
	.word	0xd8167fea	! t0_kref+0x4120:   	lduh	[%i1 - 0x16], %o4
	.word	0xf9ee101a	! t0_kref+0x4124:   	prefetcha	%i0 + %i2, 28
	.word	0x98bdc017	! t0_kref+0x4128:   	xnorcc	%l7, %l7, %o4
2:	.word	0xa135e014	! t0_kref+0x412c:   	srl	%l7, 0x14, %l0
	sethi	%hi(2f), %o7
	.word	0xe40be144	! t0_kref+0x4134:   	ldub	[%o7 + 0x144], %l2
	.word	0xa41ca00c	! t0_kref+0x4138:   	xor	%l2, 0xc, %l2
	.word	0xe42be144	! t0_kref+0x413c:   	stb	%l2, [%o7 + 0x144]
	.word	0x81dbe144	! t0_kref+0x4140:   	flush	%o7 + 0x144
2:	.word	0x91a01925	! t0_kref+0x4144:   	fstod	%f5, %f8
	.word	0x91a01880	! t0_kref+0x4148:   	fitos	%f0, %f8
	.word	0xecae9018	! t0_kref+0x414c:   	stba	%l6, [%i2 + %i0]0x80
	.word	0x808db497	! t0_kref+0x4150:   	btst	0xfffff497, %l6
	.word	0x8da008c0	! t0_kref+0x4154:   	fsubd	%f0, %f0, %f6
	.word	0x9e45c016	! t0_kref+0x4158:   	addc	%l7, %l6, %o7
	.word	0x17037f6d	! t0_kref+0x415c:   	sethi	%hi(0xdfdb400), %o3
	.word	0x9035b60a	! t0_kref+0x4160:   	orn	%l6, -0x9f6, %o0
	.word	0xee20a020	! t0_kref+0x4164:   	st	%l7, [%g2 + 0x20]
	.word	0x89a089a9	! t0_kref+0x4168:   	fdivs	%f2, %f9, %f4
	.word	0xda06401c	! t0_kref+0x416c:   	ld	[%i1 + %i4], %o5
	.word	0x9695ab44	! t0_kref+0x4170:   	orcc	%l6, 0xb44, %o3
	.word	0xefee501a	! t0_kref+0x4174:   	prefetcha	%i1 + %i2, 23
	.word	0x85a108c0	! t0_kref+0x4178:   	fsubd	%f4, %f0, %f2
	call	SYM(t0_subr0)
	.word	0xec20a02c	! t0_kref+0x4180:   	st	%l6, [%g2 + 0x2c]
	.word	0x9a058016	! t0_kref+0x4184:   	add	%l6, %l6, %o5
	.word	0xffee501b	! t0_kref+0x4188:   	prefetcha	%i1 + %i3, 31
	.word	0x90a58016	! t0_kref+0x418c:   	subcc	%l6, %l6, %o0
	.word	0x9135a011	! t0_kref+0x4190:   	srl	%l6, 0x11, %o0
	.word	0x96d5c017	! t0_kref+0x4194:   	umulcc	%l7, %l7, %o3
	.word	0x8da20942	! t0_kref+0x4198:   	fmuld	%f8, %f2, %f6
	.word	0xd6c71019	! t0_kref+0x419c:   	ldswa	[%i4 + %i1]0x80, %o3
	.word	0x81400000	! t0_kref+0x41a0:   	mov	%y, %g0
	.word	0xd648a036	! t0_kref+0x41a4:   	ldsb	[%g2 + 0x36], %o3
	.word	0xc1be5896	! t0_kref+0x41a8:   	stda	%f0, [%i1 + %l6]0xc4
	.word	0x8143c000	! t0_kref+0x41ac:   	stbar
	.word	0x23800008	! t0_kref+0x41b0:   	fbne,a	_kref+0x41d0
	.word	0x96a5f54a	! t0_kref+0x41b4:   	subcc	%l7, -0xab6, %o3
	.word	0x8da20844	! t0_kref+0x41b8:   	faddd	%f8, %f4, %f6
	.word	0x9e5dc017	! t0_kref+0x41bc:   	smul	%l7, %l7, %o7
	.word	0xd26e3fea	! t0_kref+0x41c0:   	ldstub	[%i0 - 0x16], %o1
	.word	0x85a00042	! t0_kref+0x41c4:   	fmovd	%f2, %f2
	.word	0x9045c016	! t0_kref+0x41c8:   	addc	%l7, %l6, %o0
	.word	0x963dadb7	! t0_kref+0x41cc:   	xnor	%l6, 0xdb7, %o3
	.word	0x9f414000	! t0_kref+0x41d0:   	mov	%pc, %o7
	.word	0x81a80ac0	! t0_kref+0x41d4:   	fcmped	%fcc0, %f0, %f0
	.word	0xc1be1896	! t0_kref+0x41d8:   	stda	%f0, [%i0 + %l6]0xc4
	.word	0xee2e6004	! t0_kref+0x41dc:   	stb	%l7, [%i1 + 4]
	.word	0xec366008	! t0_kref+0x41e0:   	sth	%l6, [%i1 + 8]
	.word	0x8da01906	! t0_kref+0x41e4:   	fitod	%f6, %f6
	.word	0xda062000	! t0_kref+0x41e8:   	ld	[%i0], %o5
	.word	0x94a5c017	! t0_kref+0x41ec:   	subcc	%l7, %l7, %o2
	.word	0x8ba01a25	! t0_kref+0x41f0:   	fstoi	%f5, %f5
	.word	0x9e35f88c	! t0_kref+0x41f4:   	orn	%l7, -0x774, %o7
	.word	0x98a5eb09	! t0_kref+0x41f8:   	subcc	%l7, 0xb09, %o4
	.word	0xe40866dc	! t0_kref+0x41fc:   	ldub	[%g1 + 0x6dc], %l2
	.word	0xa41ca00c	! t0_kref+0x4200:   	xor	%l2, 0xc, %l2
	.word	0xe42866dc	! t0_kref+0x4204:   	stb	%l2, [%g1 + 0x6dc]
	.word	0x81d866dc	! t0_kref+0x4208:   	flush	%g1 + 0x6dc
	.word	0xeef6501d	! t0_kref+0x420c:   	stxa	%l7, [%i1 + %i5]0x80
	.word	0xee36c019	! t0_kref+0x4210:   	sth	%l7, [%i3 + %i1]
	.word	0xd440a00c	! t0_kref+0x4214:   	ldsw	[%g2 + 0xc], %o2
2:	.word	0x1b06f967	! t0_kref+0x4218:   	sethi	%hi(0x1be59c00), %o5
	.word	0x8d85c016	! t0_kref+0x421c:   	wr	%l7, %l6, %fprs
	.word	0x8da008c0	! t0_kref+0x4220:   	fsubd	%f0, %f0, %f6
	.word	0xd4e81018	! t0_kref+0x4224:   	ldstuba	[%g0 + %i0]0x80, %o2
	.word	0xc368a000	! t0_kref+0x4228:   	prefetch	%g2, 1
	.word	0x90c5e1fb	! t0_kref+0x422c:   	addccc	%l7, 0x1fb, %o0
	.word	0xee362016	! t0_kref+0x4230:   	sth	%l7, [%i0 + 0x16]
	.word	0x91a01042	! t0_kref+0x4234:   	fdtox	%f2, %f8
	.word	0x8da00046	! t0_kref+0x4238:   	fmovd	%f6, %f6
	.word	0x8143c000	! t0_kref+0x423c:   	stbar
	.word	0xec36401b	! t0_kref+0x4240:   	sth	%l6, [%i1 + %i3]
	.word	0xec2e8018	! t0_kref+0x4244:   	stb	%l6, [%i2 + %i0]
	.word	0xd210a02a	! t0_kref+0x4248:   	lduh	[%g2 + 0x2a], %o1
	.word	0x81db0014	! t0_kref+0x424c:   	flush	%o4 + %l4
	.word	0x81a08842	! t0_kref+0x4250:   	faddd	%f2, %f2, %f0
	.word	0x91a018c2	! t0_kref+0x4254:   	fdtos	%f2, %f8
	.word	0xcd1fbf38	! t0_kref+0x4258:   	ldd	[%fp - 0xc8], %f6
	.word	0x13182815	! t0_kref+0x425c:   	sethi	%hi(0x60a05400), %o1
	.word	0xee763fe8	! t0_kref+0x4260:   	stx	%l7, [%i0 - 0x18]
	.word	0x81a088c2	! t0_kref+0x4264:   	fsubd	%f2, %f2, %f0
	.word	0xd0ee9018	! t0_kref+0x4268:   	ldstuba	[%i2 + %i0]0x80, %o0
	.word	0x89a08944	! t0_kref+0x426c:   	fmuld	%f2, %f4, %f4
	.word	0x89a188c2	! t0_kref+0x4270:   	fsubd	%f6, %f2, %f4
	.word	0x27800006	! t0_kref+0x4274:   	fbul,a	_kref+0x428c
	.word	0xee2e6004	! t0_kref+0x4278:   	stb	%l7, [%i1 + 4]
	.word	0x8fa089a8	! t0_kref+0x427c:   	fdivs	%f2, %f8, %f7
	.word	0x940dc016	! t0_kref+0x4280:   	and	%l7, %l6, %o2
	.word	0x81a01920	! t0_kref+0x4284:   	fstod	%f0, %f0
	.word	0x81aa4a28	! t0_kref+0x4288:   	fcmps	%fcc0, %f9, %f8
	.word	0x99258017	! t0_kref+0x428c:   	mulscc	%l6, %l7, %o4
	.word	0x8055b2a7	! t0_kref+0x4290:   	umul	%l6, -0xd59, %g0
	.word	0xba103fe0	! t0_kref+0x4294:   	mov	0xffffffe0, %i5
	.word	0xec262008	! t0_kref+0x4298:   	st	%l6, [%i0 + 8]
	.word	0x81a88aa1	! t0_kref+0x429c:   	fcmpes	%fcc0, %f2, %f1
	.word	0x8fa000a4	! t0_kref+0x42a0:   	fnegs	%f4, %f7
	call	SYM(t0_subr0)
	.word	0x8da18d21	! t0_kref+0x42a8:   	fsmuld	%f6, %f1, %f6
	.word	0x9fc00004	! t0_kref+0x42ac:   	call	%g0 + %g4
	.word	0xee367ff0	! t0_kref+0x42b0:   	sth	%l7, [%i1 - 0x10]
	.word	0xc726401c	! t0_kref+0x42b4:   	st	%f3, [%i1 + %i4]
	.word	0x929db564	! t0_kref+0x42b8:   	xorcc	%l6, -0xa9c, %o1
	.word	0x93a00022	! t0_kref+0x42bc:   	fmovs	%f2, %f9
	.word	0x80858016	! t0_kref+0x42c0:   	addcc	%l6, %l6, %g0
	.word	0x813da012	! t0_kref+0x42c4:   	sra	%l6, 0x12, %g0
	.word	0x9035b203	! t0_kref+0x42c8:   	orn	%l6, -0xdfd, %o0
	.word	0xc9bf5a59	! t0_kref+0x42cc:   	stda	%f4, [%i5 + %i1]0xd2
	.word	0x81a01921	! t0_kref+0x42d0:   	fstod	%f1, %f0
	.word	0x94d58016	! t0_kref+0x42d4:   	umulcc	%l6, %l6, %o2
	.word	0xd43e3ff0	! t0_kref+0x42d8:   	std	%o2, [%i0 - 0x10]
	.word	0x9f703397	! t0_kref+0x42dc:   	popc	-0xc69, %o7
	.word	0x81858000	! t0_kref+0x42e0:   	wr	%l6, %g0, %y
	.word	0x91a089c8	! t0_kref+0x42e4:   	fdivd	%f2, %f8, %f8
	.word	0xf207bfe0	! t0_kref+0x42e8:   	ld	[%fp - 0x20], %i1
	.word	0xe40867c8	! t0_kref+0x42ec:   	ldub	[%g1 + 0x7c8], %l2
	.word	0xa41ca00c	! t0_kref+0x42f0:   	xor	%l2, 0xc, %l2
	.word	0xe42867c8	! t0_kref+0x42f4:   	stb	%l2, [%g1 + 0x7c8]
	.word	0x81d867c8	! t0_kref+0x42f8:   	flush	%g1 + 0x7c8
	.word	0x81a209a0	! t0_kref+0x42fc:   	fdivs	%f8, %f0, %f0
	.word	0x93408000	! t0_kref+0x4300:   	mov	%ccr, %o1
2:	.word	0x98c5c016	! t0_kref+0x4304:   	addccc	%l7, %l6, %o4
	.word	0xc51fbc10	! t0_kref+0x4308:   	ldd	[%fp - 0x3f0], %f2
	.word	0xe40867f4	! t0_kref+0x430c:   	ldub	[%g1 + 0x7f4], %l2
	.word	0xa41ca00c	! t0_kref+0x4310:   	xor	%l2, 0xc, %l2
	.word	0xe42867f4	! t0_kref+0x4314:   	stb	%l2, [%g1 + 0x7f4]
	.word	0x81d867f4	! t0_kref+0x4318:   	flush	%g1 + 0x7f4
	.word	0x80a5fa41	! t0_kref+0x431c:   	cmp	%l7, -0x5bf
	.word	0xc16e7fe8	! t0_kref+0x4320:   	prefetch	%i1 - 0x18, 0
	.word	0xffee501d	! t0_kref+0x4324:   	prefetcha	%i1 + %i5, 31
	.word	0x87a000a9	! t0_kref+0x4328:   	fnegs	%f9, %f3
	.word	0x89a000c0	! t0_kref+0x432c:   	fnegd	%f0, %f4
2:	.word	0x85a018c2	! t0_kref+0x4330:   	fdtos	%f2, %f2
	.word	0x81a98a24	! t0_kref+0x4334:   	fcmps	%fcc0, %f6, %f4
	.word	0x9ea5c017	! t0_kref+0x4338:   	subcc	%l7, %l7, %o7
	.word	0x9a8de278	! t0_kref+0x433c:   	andcc	%l7, 0x278, %o5
	.word	0xd6166016	! t0_kref+0x4340:   	lduh	[%i1 + 0x16], %o3
	.word	0x86102002	! t0_kref+0x4344:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x4348:   	bne,a	_kref+0x4348
	.word	0x86a0e001	! t0_kref+0x434c:   	subcc	%g3, 1, %g3
	.word	0x85a01902	! t0_kref+0x4350:   	fitod	%f2, %f2
	.word	0xd27f0018	! t0_kref+0x4354:   	swap	[%i4 + %i0], %o1
	.word	0x89a08848	! t0_kref+0x4358:   	faddd	%f2, %f8, %f4
	.word	0x85a089c4	! t0_kref+0x435c:   	fdivd	%f2, %f4, %f2
	.word	0x9ea5f05e	! t0_kref+0x4360:   	subcc	%l7, -0xfa2, %o7
	.word	0x96d5a000	! t0_kref+0x4364:   	umulcc	%l6, 0, %o3
	.word	0xc7ee5017	! t0_kref+0x4368:   	prefetcha	%i1 + %l7, 3
	.word	0x94458016	! t0_kref+0x436c:   	addc	%l6, %l6, %o2
	.word	0x86102007	! t0_kref+0x4370:   	mov	0x7, %g3
	.word	0x86a0e001	! t0_kref+0x4374:   	subcc	%g3, 1, %g3
	.word	0x22800006	! t0_kref+0x4378:   	be,a	_kref+0x4390
	.word	0x9425bc0e	! t0_kref+0x437c:   	sub	%l6, -0x3f2, %o2
	.word	0x929d8017	! t0_kref+0x4380:   	xorcc	%l6, %l7, %o1
	.word	0x92358017	! t0_kref+0x4384:   	orn	%l6, %l7, %o1
	.word	0x2bbffffb	! t0_kref+0x4388:   	fbug,a	_kref+0x4374
	.word	0xd65e2000	! t0_kref+0x438c:   	ldx	[%i0], %o3
	.word	0x8da208c0	! t0_kref+0x4390:   	fsubd	%f8, %f0, %f6
	.word	0xc06e7ffa	! t0_kref+0x4394:   	ldstub	[%i1 - 6], %g0
	.word	0xee266000	! t0_kref+0x4398:   	st	%l7, [%i1]
	.word	0x9045e15d	! t0_kref+0x439c:   	addc	%l7, 0x15d, %o0
	.word	0xec28a01c	! t0_kref+0x43a0:   	stb	%l6, [%g2 + 0x1c]
	.word	0x8da089a0	! t0_kref+0x43a4:   	fdivs	%f2, %f0, %f6
	.word	0x80a5c016	! t0_kref+0x43a8:   	cmp	%l7, %l6
	.word	0x2b800008	! t0_kref+0x43ac:   	fbug,a	_kref+0x43cc
	.word	0xc520a03c	! t0_kref+0x43b0:   	st	%f2, [%g2 + 0x3c]
	.word	0x91a01a27	! t0_kref+0x43b4:   	fstoi	%f7, %f8
	.word	0x8ba1c9a3	! t0_kref+0x43b8:   	fdivs	%f7, %f3, %f5
	.word	0x812d8017	! t0_kref+0x43bc:   	sll	%l6, %l7, %g0
	.word	0x91a18d22	! t0_kref+0x43c0:   	fsmuld	%f6, %f2, %f8
	.word	0x96a5aaa0	! t0_kref+0x43c4:   	subcc	%l6, 0xaa0, %o3
	.word	0x993de005	! t0_kref+0x43c8:   	sra	%l7, 0x5, %o4
	.word	0x89a249a4	! t0_kref+0x43cc:   	fdivs	%f9, %f4, %f4
	.word	0x92f5e483	! t0_kref+0x43d0:   	udivcc	%l7, 0x483, %o1
	.word	0x8da1c9a5	! t0_kref+0x43d4:   	fdivs	%f7, %f5, %f6
	.word	0x8da018c2	! t0_kref+0x43d8:   	fdtos	%f2, %f6
	.word	0x81da001e	! t0_kref+0x43dc:   	flush	%o0 + %fp
	call	SYM(t0_subr3)
	.word	0xd84e8019	! t0_kref+0x43e4:   	ldsb	[%i2 + %i1], %o4
	.word	0xee362018	! t0_kref+0x43e8:   	sth	%l7, [%i0 + 0x18]
	.word	0x81db401a	! t0_kref+0x43ec:   	flush	%o5 + %i2
	.word	0xde16c019	! t0_kref+0x43f0:   	lduh	[%i3 + %i1], %o7
	.word	0x973da00d	! t0_kref+0x43f4:   	sra	%l6, 0xd, %o3
	.word	0xd240a00c	! t0_kref+0x43f8:   	ldsw	[%g2 + 0xc], %o1
	.word	0xeca65000	! t0_kref+0x43fc:   	sta	%l6, [%i1]0x80
	.word	0x91a01889	! t0_kref+0x4400:   	fitos	%f9, %f8
	.word	0x96158016	! t0_kref+0x4404:   	or	%l6, %l6, %o3
	.word	0x9e0dc017	! t0_kref+0x4408:   	and	%l7, %l7, %o7
	.word	0x81aa0aa7	! t0_kref+0x440c:   	fcmpes	%fcc0, %f8, %f7
	.word	0x81a8caa4	! t0_kref+0x4410:   	fcmpes	%fcc0, %f3, %f4
	.word	0xe40868f0	! t0_kref+0x4414:   	ldub	[%g1 + 0x8f0], %l2
	.word	0xa41ca00c	! t0_kref+0x4418:   	xor	%l2, 0xc, %l2
	.word	0xe42868f0	! t0_kref+0x441c:   	stb	%l2, [%g1 + 0x8f0]
	.word	0x81d868f0	! t0_kref+0x4420:   	flush	%g1 + 0x8f0
	.word	0xc068a012	! t0_kref+0x4424:   	ldstub	[%g2 + 0x12], %g0
	.word	0xc368a000	! t0_kref+0x4428:   	prefetch	%g2, 1
2:	.word	0xa08de142	! t0_kref+0x442c:   	andcc	%l7, 0x142, %l0
	.word	0xd3262008	! t0_kref+0x4430:   	st	%f9, [%i0 + 8]
	.word	0xe408693c	! t0_kref+0x4434:   	ldub	[%g1 + 0x93c], %l2
	.word	0xa41ca00c	! t0_kref+0x4438:   	xor	%l2, 0xc, %l2
	.word	0xe428693c	! t0_kref+0x443c:   	stb	%l2, [%g1 + 0x93c]
	.word	0x81d8693c	! t0_kref+0x4440:   	flush	%g1 + 0x93c
	.word	0xd210a020	! t0_kref+0x4444:   	lduh	[%g2 + 0x20], %o1
	.word	0x85a018c8	! t0_kref+0x4448:   	fdtos	%f8, %f2
	.word	0xec36c019	! t0_kref+0x444c:   	sth	%l6, [%i3 + %i1]
	.word	0x87a000a9	! t0_kref+0x4450:   	fnegs	%f9, %f3
	.word	0x81a88a22	! t0_kref+0x4454:   	fcmps	%fcc0, %f2, %f2
	.word	0x98758017	! t0_kref+0x4458:   	udiv	%l6, %l7, %o4
	.word	0x98c58016	! t0_kref+0x445c:   	addccc	%l6, %l6, %o4
	.word	0x98458017	! t0_kref+0x4460:   	addc	%l6, %l7, %o4
	.word	0xec267ff0	! t0_kref+0x4464:   	st	%l6, [%i1 - 0x10]
	.word	0xd200a01c	! t0_kref+0x4468:   	ld	[%g2 + 0x1c], %o1
	.word	0x80a5e83f	! t0_kref+0x446c:   	cmp	%l7, 0x83f
	.word	0x92d5fb52	! t0_kref+0x4470:   	umulcc	%l7, -0x4ae, %o1
	.word	0x91abc044	! t0_kref+0x4474:   	fmovdo	%fcc0, %f4, %f8
2:	.word	0x992dc016	! t0_kref+0x4478:   	sll	%l7, %l6, %o4
	.word	0xee28a01a	! t0_kref+0x447c:   	stb	%l7, [%g2 + 0x1a]
	.word	0xc19e2012	! t0_kref+0x4480:   	ldda	[%i0 + 0x12]%asi, %f0
	.word	0x9f25aae7	! t0_kref+0x4484:   	mulscc	%l6, 0xae7, %o7
	.word	0xd0b81019	! t0_kref+0x4488:   	stda	%o0, [%g0 + %i1]0x80
	.word	0x98d5c016	! t0_kref+0x448c:   	umulcc	%l7, %l6, %o4
	.word	0xec267ff4	! t0_kref+0x4490:   	st	%l6, [%i1 - 0xc]
	.word	0xea7e001c	! t0_kref+0x4494:   	swap	[%i0 + %i4], %l5
	.word	0x89a00140	! t0_kref+0x4498:   	fabsd	%f0, %f4
	.word	0x8fa000a3	! t0_kref+0x449c:   	fnegs	%f3, %f7
	.word	0x81dbf52d	! t0_kref+0x44a0:   	flush	%o7 - 0xad3
	.word	0x9fc10000	! t0_kref+0x44a4:   	call	%g4
	.word	0xc700a01c	! t0_kref+0x44a8:   	ld	[%g2 + 0x1c], %f3
	.word	0xecb6101b	! t0_kref+0x44ac:   	stha	%l6, [%i0 + %i3]0x80
	.word	0x985dc017	! t0_kref+0x44b0:   	smul	%l7, %l7, %o4
	.word	0x89a01a22	! t0_kref+0x44b4:   	fstoi	%f2, %f4
	.word	0x98a5e2bf	! t0_kref+0x44b8:   	subcc	%l7, 0x2bf, %o4
	.word	0x85a000a2	! t0_kref+0x44bc:   	fnegs	%f2, %f2
	.word	0x92d58016	! t0_kref+0x44c0:   	umulcc	%l6, %l6, %o1
	.word	0x93a000a5	! t0_kref+0x44c4:   	fnegs	%f5, %f9
	.word	0x9fc00004	! t0_kref+0x44c8:   	call	%g0 + %g4
	.word	0x9895e7b5	! t0_kref+0x44cc:   	orcc	%l7, 0x7b5, %o4
	.word	0x86102021	! t0_kref+0x44d0:   	mov	0x21, %g3
	.word	0x86a0e001	! t0_kref+0x44d4:   	subcc	%g3, 1, %g3
	.word	0x22800010	! t0_kref+0x44d8:   	be,a	_kref+0x4518
	.word	0xfb6e3fe0	! t0_kref+0x44dc:   	prefetch	%i0 - 0x20, 29
	.word	0xda00a028	! t0_kref+0x44e0:   	ld	[%g2 + 0x28], %o5
	.word	0x9415b772	! t0_kref+0x44e4:   	or	%l6, -0x88e, %o2
	.word	0x35800006	! t0_kref+0x44e8:   	fbue,a	_kref+0x4500
	.word	0xc3ee1016	! t0_kref+0x44ec:   	prefetcha	%i0 + %l6, 1
	.word	0x81a80a48	! t0_kref+0x44f0:   	fcmpd	%fcc0, %f0, %f8
	.word	0x87a00020	! t0_kref+0x44f4:   	fmovs	%f0, %f3
	.word	0xec30a016	! t0_kref+0x44f8:   	sth	%l6, [%g2 + 0x16]
	.word	0x94d58017	! t0_kref+0x44fc:   	umulcc	%l6, %l7, %o2
	.word	0x98a5c017	! t0_kref+0x4500:   	subcc	%l7, %l7, %o4
	.word	0xf56e6018	! t0_kref+0x4504:   	prefetch	%i1 + 0x18, 26
	.word	0x980dfad1	! t0_kref+0x4508:   	and	%l7, -0x52f, %o4
	.word	0x3bbffff2	! t0_kref+0x450c:   	fble,a	_kref+0x44d4
	.word	0xe87e3ff4	! t0_kref+0x4510:   	swap	[%i0 - 0xc], %l4
	.word	0x81dd401f	! t0_kref+0x4514:   	flush	%l5 + %i7
	.word	0xc16e7ff0	! t0_kref+0x4518:   	prefetch	%i1 - 0x10, 0
	.word	0x81a9ca27	! t0_kref+0x451c:   	fcmps	%fcc0, %f7, %f7
	.word	0x81a109a7	! t0_kref+0x4520:   	fdivs	%f4, %f7, %f0
	.word	0x94f5bbf1	! t0_kref+0x4524:   	udivcc	%l6, -0x40f, %o2
	.word	0x91a01108	! t0_kref+0x4528:   	fxtod	%f8, %f8
	.word	0x94d5c017	! t0_kref+0x452c:   	umulcc	%l7, %l7, %o2
	.word	0x9455bd57	! t0_kref+0x4530:   	umul	%l6, -0x2a9, %o2
	.word	0x93a00024	! t0_kref+0x4534:   	fmovs	%f4, %f9
	.word	0x81aa0aa5	! t0_kref+0x4538:   	fcmpes	%fcc0, %f8, %f5
	.word	0x9205e775	! t0_kref+0x453c:   	add	%l7, 0x775, %o1
	.word	0x8ba000a4	! t0_kref+0x4540:   	fnegs	%f4, %f5
	.word	0x94458016	! t0_kref+0x4544:   	addc	%l6, %l6, %o2
	.word	0x9e35f463	! t0_kref+0x4548:   	orn	%l7, -0xb9d, %o7
	.word	0xc807bfe4	! t0_kref+0x454c:   	ld	[%fp - 0x1c], %g4
	.word	0x1920f744	! t0_kref+0x4550:   	sethi	%hi(0x83dd1000), %o4
	.word	0x9f414000	! t0_kref+0x4554:   	mov	%pc, %o7
!	.word	0x2897cea8	! t0_kref+0x4558:   	bleu,a	SYM(t0_subr0)
	   	bleu,a	SYM(t0_subr0)
	.word	0x94258017	! t0_kref+0x455c:   	sub	%l6, %l7, %o2
	.word	0x8fa00025	! t0_kref+0x4560:   	fmovs	%f5, %f7
	.word	0x81aa0aa4	! t0_kref+0x4564:   	fcmpes	%fcc0, %f8, %f4
	.word	0x98d5ac5b	! t0_kref+0x4568:   	umulcc	%l6, 0xc5b, %o4
	.word	0x9295c016	! t0_kref+0x456c:   	orcc	%l7, %l6, %o1
	.word	0xc11fbfc8	! t0_kref+0x4570:   	ldd	[%fp - 0x38], %f0
	.word	0x81a8caa3	! t0_kref+0x4574:   	fcmpes	%fcc0, %f3, %f3
	.word	0x81aa0a42	! t0_kref+0x4578:   	fcmpd	%fcc0, %f8, %f2
	.word	0x903dfa19	! t0_kref+0x457c:   	xnor	%l7, -0x5e7, %o0
	.word	0x9a45af50	! t0_kref+0x4580:   	addc	%l6, 0xf50, %o5
	.word	0xd2070018	! t0_kref+0x4584:   	ld	[%i4 + %i0], %o1
	.word	0x8da01885	! t0_kref+0x4588:   	fitos	%f5, %f6
	call	SYM(t0_subr2)
	.word	0xa0d58017	! t0_kref+0x4590:   	umulcc	%l6, %l7, %l0
	.word	0xc9be1a5c	! t0_kref+0x4594:   	stda	%f4, [%i0 + %i4]0xd2
	.word	0xde480019	! t0_kref+0x4598:   	ldsb	[%g0 + %i1], %o7
	.word	0x92f5b6e3	! t0_kref+0x459c:   	udivcc	%l6, -0x91d, %o1
	.word	0x9ed5ecb0	! t0_kref+0x45a0:   	umulcc	%l7, 0xcb0, %o7
	.word	0x80f5c017	! t0_kref+0x45a4:   	udivcc	%l7, %l7, %g0
	.word	0xee362000	! t0_kref+0x45a8:   	sth	%l7, [%i0]
	.word	0x878020f0	! t0_kref+0x45ac:   	mov	0xf0, %asi
	.word	0x98a5e93e	! t0_kref+0x45b0:   	subcc	%l7, 0x93e, %o4
	.word	0x86102003	! t0_kref+0x45b4:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x45b8:   	bne,a	_kref+0x45b8
	.word	0x86a0e001	! t0_kref+0x45bc:   	subcc	%g3, 1, %g3
	.word	0x91a01904	! t0_kref+0x45c0:   	fitod	%f4, %f8
	.word	0x91a24922	! t0_kref+0x45c4:   	fmuls	%f9, %f2, %f8
	.word	0x85a018c6	! t0_kref+0x45c8:   	fdtos	%f6, %f2
	.word	0xcda6101c	! t0_kref+0x45cc:   	sta	%f6, [%i0 + %i4]0x80
	.word	0xd416c019	! t0_kref+0x45d0:   	lduh	[%i3 + %i1], %o2
	.word	0x8143e040	! t0_kref+0x45d4:   	membar	0x40
	.word	0x98958016	! t0_kref+0x45d8:   	orcc	%l6, %l6, %o4
	.word	0x9ac5ad65	! t0_kref+0x45dc:   	addccc	%l6, 0xd65, %o5
	.word	0x81a98a21	! t0_kref+0x45e0:   	fcmps	%fcc0, %f6, %f1
	.word	0x89a24d28	! t0_kref+0x45e4:   	fsmuld	%f9, %f8, %f4
	.word	0xd120a034	! t0_kref+0x45e8:   	st	%f8, [%g2 + 0x34]
	.word	0x8143c000	! t0_kref+0x45ec:   	stbar
	.word	0xe67e0000	! t0_kref+0x45f0:   	swap	[%i0], %l3
	.word	0x9a05aad8	! t0_kref+0x45f4:   	add	%l6, 0xad8, %o5
	.word	0x8005fa36	! t0_kref+0x45f8:   	add	%l7, -0x5ca, %g0
	.word	0x9ea5e111	! t0_kref+0x45fc:   	subcc	%l7, 0x111, %o7
	.word	0x9ea5e3a1	! t0_kref+0x4600:   	subcc	%l7, 0x3a1, %o7
	.word	0x87a00025	! t0_kref+0x4604:   	fmovs	%f5, %f3
	.word	0x19325c88	! t0_kref+0x4608:   	sethi	%hi(0xc9722000), %o4
	.word	0x9265e5ee	! t0_kref+0x460c:   	subc	%l7, 0x5ee, %o1
	.word	0x8da00d28	! t0_kref+0x4610:   	fsmuld	%f0, %f8, %f6
	.word	0x9875c017	! t0_kref+0x4614:   	udiv	%l7, %l7, %o4
	.word	0x90d5bb8d	! t0_kref+0x4618:   	umulcc	%l6, -0x473, %o0
	.word	0x9a058017	! t0_kref+0x461c:   	add	%l6, %l7, %o5
	.word	0xe168a04e	! t0_kref+0x4620:   	prefetch	%g2 + 0x4e, 16
	.word	0x968da9a0	! t0_kref+0x4624:   	andcc	%l6, 0x9a0, %o3
	.word	0x96d5c017	! t0_kref+0x4628:   	umulcc	%l7, %l7, %o3
	.word	0x0108752d	! t0_kref+0x462c:   	sethi	%hi(0x21d4b400), %g0
	.word	0x9a1d8016	! t0_kref+0x4630:   	xor	%l6, %l6, %o5
	.word	0x80b5a25f	! t0_kref+0x4634:   	orncc	%l6, 0x25f, %g0
	.word	0x80b58016	! t0_kref+0x4638:   	orncc	%l6, %l6, %g0
	.word	0x8da149a8	! t0_kref+0x463c:   	fdivs	%f5, %f8, %f6
	.word	0x91a000a0	! t0_kref+0x4640:   	fnegs	%f0, %f8
	.word	0x9935a013	! t0_kref+0x4644:   	srl	%l6, 0x13, %o4
	.word	0x89a00025	! t0_kref+0x4648:   	fmovs	%f5, %f4
	.word	0xd4503d34	! t0_kref+0x464c:   	ldsh	[%g0 - 0x2cc], %o2
	.word	0x87a88026	! t0_kref+0x4650:   	fmovslg	%fcc0, %f6, %f3
	.word	0xfb6e001c	! t0_kref+0x4654:   	prefetch	%i0 + %i4, 29
	.word	0xc9be1a1b	! t0_kref+0x4658:   	stda	%f4, [%i0 + %i3]0xd0
	.word	0x9abdc016	! t0_kref+0x465c:   	xnorcc	%l7, %l6, %o5
	.word	0xc1ee5017	! t0_kref+0x4660:   	prefetcha	%i1 + %l7, 0
	.word	0x85a188c8	! t0_kref+0x4664:   	fsubd	%f6, %f8, %f2
	.word	0x96d5c017	! t0_kref+0x4668:   	umulcc	%l7, %l7, %o3
	.word	0x81a088c0	! t0_kref+0x466c:   	fsubd	%f2, %f0, %f0
	.word	0x9695e346	! t0_kref+0x4670:   	orcc	%l7, 0x346, %o3
	.word	0x993d8016	! t0_kref+0x4674:   	sra	%l6, %l6, %o4
	.word	0x89a208c6	! t0_kref+0x4678:   	fsubd	%f8, %f6, %f4
	.word	0x93a01a20	! t0_kref+0x467c:   	fstoi	%f0, %f9
	.word	0x98a5bf4a	! t0_kref+0x4680:   	subcc	%l6, -0xb6, %o4
	.word	0xe3b8a040	! t0_kref+0x4684:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xe4086b84	! t0_kref+0x4688:   	ldub	[%g1 + 0xb84], %l2
	.word	0xa41ca00c	! t0_kref+0x468c:   	xor	%l2, 0xc, %l2
	.word	0xe4286b84	! t0_kref+0x4690:   	stb	%l2, [%g1 + 0xb84]
	.word	0x81d86b84	! t0_kref+0x4694:   	flush	%g1 + 0xb84
	.word	0x19236509	! t0_kref+0x4698:   	sethi	%hi(0x8d942400), %o4
	.word	0xe83e6010	! t0_kref+0x469c:   	std	%l4, [%i1 + 0x10]
	.word	0x928db8b5	! t0_kref+0x46a0:   	andcc	%l6, -0x74b, %o1
	.word	0x94258016	! t0_kref+0x46a4:   	sub	%l6, %l6, %o2
	.word	0x92958016	! t0_kref+0x46a8:   	orcc	%l6, %l6, %o1
	.word	0x8d85a1c7	! t0_kref+0x46ac:   	wr	%l6, 0x1c7, %fprs
	.word	0x9075c016	! t0_kref+0x46b0:   	udiv	%l7, %l6, %o0
	.word	0x9495e651	! t0_kref+0x46b4:   	orcc	%l7, 0x651, %o2
	.word	0xec364000	! t0_kref+0x46b8:   	sth	%l6, [%i1]
	.word	0xe168a083	! t0_kref+0x46bc:   	prefetch	%g2 + 0x83, 16
2:	.word	0x85a20846	! t0_kref+0x46c0:   	faddd	%f8, %f6, %f2
	.word	0xc398a080	! t0_kref+0x46c4:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0x001fffff	! t0_kref+0x46c8:   	illtrap	0x1fffff
	.word	0x87a009a7	! t0_kref+0x46cc:   	fdivs	%f0, %f7, %f3
	.word	0x8143c000	! t0_kref+0x46d0:   	stbar
	.word	0x9ead8017	! t0_kref+0x46d4:   	andncc	%l6, %l7, %o7
	.word	0xd3a01018	! t0_kref+0x46d8:   	sta	%f9, [%g0 + %i0]0x80
	.word	0x809dc016	! t0_kref+0x46dc:   	xorcc	%l7, %l6, %g0
	.word	0x9835a9d3	! t0_kref+0x46e0:   	orn	%l6, 0x9d3, %o4
	.word	0x8da01883	! t0_kref+0x46e4:   	fitos	%f3, %f6
	.word	0xd47e6008	! t0_kref+0x46e8:   	swap	[%i1 + 8], %o2
	.word	0x94dde383	! t0_kref+0x46ec:   	smulcc	%l7, 0x383, %o2
	.word	0xe4086bdc	! t0_kref+0x46f0:   	ldub	[%g1 + 0xbdc], %l2
	.word	0xa41ca00c	! t0_kref+0x46f4:   	xor	%l2, 0xc, %l2
	.word	0xe4286bdc	! t0_kref+0x46f8:   	stb	%l2, [%g1 + 0xbdc]
	.word	0x81d86bdc	! t0_kref+0x46fc:   	flush	%g1 + 0xbdc
	.word	0xe81e7ff8	! t0_kref+0x4700:   	ldd	[%i1 - 8], %l4
	.word	0xcd263ff8	! t0_kref+0x4704:   	st	%f6, [%i0 - 8]
	.word	0xeb68a049	! t0_kref+0x4708:   	prefetch	%g2 + 0x49, 21
	.word	0x98c58017	! t0_kref+0x470c:   	addccc	%l6, %l7, %o4
	.word	0x85a08923	! t0_kref+0x4710:   	fmuls	%f2, %f3, %f2
	.word	0x81a08940	! t0_kref+0x4714:   	fmuld	%f2, %f0, %f0
2:	.word	0x9a1db62c	! t0_kref+0x4718:   	xor	%l6, -0x9d4, %o5
	.word	0xd03e6000	! t0_kref+0x471c:   	std	%o0, [%i1]
	.word	0xd850a038	! t0_kref+0x4720:   	ldsh	[%g2 + 0x38], %o4
	.word	0xf207bfe0	! t0_kref+0x4724:   	ld	[%fp - 0x20], %i1
	.word	0xec28a01c	! t0_kref+0x4728:   	stb	%l6, [%g2 + 0x1c]
	.word	0xd0480019	! t0_kref+0x472c:   	ldsb	[%g0 + %i1], %o0
	.word	0xcd263ff4	! t0_kref+0x4730:   	st	%f6, [%i0 - 0xc]
	.word	0xe3b8a040	! t0_kref+0x4734:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x8fa000a9	! t0_kref+0x4738:   	fnegs	%f9, %f7
	.word	0xe83e6008	! t0_kref+0x473c:   	std	%l4, [%i1 + 8]
	.word	0xde4e201f	! t0_kref+0x4740:   	ldsb	[%i0 + 0x1f], %o7
	.word	0x83a149a4	! t0_kref+0x4744:   	fdivs	%f5, %f4, %f1
	.word	0xd49e101d	! t0_kref+0x4748:   	ldda	[%i0 + %i5]0x80, %o2
	.word	0x81aa0aa5	! t0_kref+0x474c:   	fcmpes	%fcc0, %f8, %f5
	.word	0xc1be5857	! t0_kref+0x4750:   	stda	%f0, [%i1 + %l7]0xc2
	.word	0x91258017	! t0_kref+0x4754:   	mulscc	%l6, %l7, %o0
	.word	0x8da01a20	! t0_kref+0x4758:   	fstoi	%f0, %f6
	.word	0x9855c017	! t0_kref+0x475c:   	umul	%l7, %l7, %o4
	.word	0xc5267ffc	! t0_kref+0x4760:   	st	%f2, [%i1 - 4]
	.word	0x91a01901	! t0_kref+0x4764:   	fitod	%f1, %f8
	.word	0x988df176	! t0_kref+0x4768:   	andcc	%l7, -0xe8a, %o4
	.word	0xcd1fbe90	! t0_kref+0x476c:   	ldd	[%fp - 0x170], %f6
	.word	0xe4086c54	! t0_kref+0x4770:   	ldub	[%g1 + 0xc54], %l2
	.word	0xa41ca00c	! t0_kref+0x4774:   	xor	%l2, 0xc, %l2
	.word	0xe4286c54	! t0_kref+0x4778:   	stb	%l2, [%g1 + 0xc54]
	.word	0x81d86c54	! t0_kref+0x477c:   	flush	%g1 + 0xc54
	.word	0x8135a019	! t0_kref+0x4780:   	srl	%l6, 0x19, %g0
	.word	0xec20a00c	! t0_kref+0x4784:   	st	%l6, [%g2 + 0xc]
	.word	0x81aa0aa4	! t0_kref+0x4788:   	fcmpes	%fcc0, %f8, %f4
	.word	0x9ac5b422	! t0_kref+0x478c:   	addccc	%l6, -0xbde, %o5
2:	.word	0x91a10944	! t0_kref+0x4790:   	fmuld	%f4, %f4, %f8
	.word	0xde10a00e	! t0_kref+0x4794:   	lduh	[%g2 + 0xe], %o7
	.word	0xf1ee501b	! t0_kref+0x4798:   	prefetcha	%i1 + %i3, 24
	.word	0x9875c016	! t0_kref+0x479c:   	udiv	%l7, %l6, %o4
	.word	0xd19f5019	! t0_kref+0x47a0:   	ldda	[%i5 + %i1]0x80, %f8
	.word	0x8da088c2	! t0_kref+0x47a4:   	fsubd	%f2, %f2, %f6
	.word	0x96c58016	! t0_kref+0x47a8:   	addccc	%l6, %l6, %o3
	.word	0x1311584a	! t0_kref+0x47ac:   	sethi	%hi(0x45612800), %o1
	.word	0xd66e3fea	! t0_kref+0x47b0:   	ldstub	[%i0 - 0x16], %o3
	.word	0xebee501b	! t0_kref+0x47b4:   	prefetcha	%i1 + %i3, 21
	.word	0x9a75c016	! t0_kref+0x47b8:   	udiv	%l7, %l6, %o5
	.word	0x8125c017	! t0_kref+0x47bc:   	mulscc	%l7, %l7, %g0
	.word	0x805da132	! t0_kref+0x47c0:   	smul	%l6, 0x132, %g0
	.word	0x9055efba	! t0_kref+0x47c4:   	umul	%l7, 0xfba, %o0
	.word	0x83a01a42	! t0_kref+0x47c8:   	fdtoi	%f2, %f1
	.word	0x33800004	! t0_kref+0x47cc:   	fbe,a	_kref+0x47dc
	.word	0x91418000	! t0_kref+0x47d0:   	mov	%fprs, %o0
	.word	0x9675f46e	! t0_kref+0x47d4:   	udiv	%l7, -0xb92, %o3
	.word	0x9e95c017	! t0_kref+0x47d8:   	orcc	%l7, %l7, %o7
	.word	0xe3b8a040	! t0_kref+0x47dc:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x37800005	! t0_kref+0x47e0:   	fbge,a	_kref+0x47f4
	.word	0x98a58017	! t0_kref+0x47e4:   	subcc	%l6, %l7, %o4
	.word	0x27800002	! t0_kref+0x47e8:   	fbul,a	_kref+0x47f0
	.word	0x96adc017	! t0_kref+0x47ec:   	andncc	%l7, %l7, %o3
	.word	0xe3b8a040	! t0_kref+0x47f0:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x97400000	! t0_kref+0x47f4:   	mov	%y, %o3
	.word	0x8035a141	! t0_kref+0x47f8:   	orn	%l6, 0x141, %g0
	.word	0x85a188c8	! t0_kref+0x47fc:   	fsubd	%f6, %f8, %f2
	.word	0x8185c000	! t0_kref+0x4800:   	wr	%l7, %g0, %y
	.word	0x83a109a1	! t0_kref+0x4804:   	fdivs	%f4, %f1, %f1
	.word	0x98e5b766	! t0_kref+0x4808:   	subccc	%l6, -0x89a, %o4
	.word	0x9fc00004	! t0_kref+0x480c:   	call	%g0 + %g4
	.word	0xa0d5c017	! t0_kref+0x4810:   	umulcc	%l7, %l7, %l0
	.word	0x81dfa5cf	! t0_kref+0x4814:   	flush	%fp + 0x5cf
	.word	0x90458016	! t0_kref+0x4818:   	addc	%l6, %l6, %o0
	.word	0x985de9dc	! t0_kref+0x481c:   	smul	%l7, 0x9dc, %o4
	.word	0x98f58016	! t0_kref+0x4820:   	udivcc	%l6, %l6, %o4
	.word	0xd11fbf58	! t0_kref+0x4824:   	ldd	[%fp - 0xa8], %f8
	.word	0x93a0c9a8	! t0_kref+0x4828:   	fdivs	%f3, %f8, %f9
	.word	0x9a458016	! t0_kref+0x482c:   	addc	%l6, %l6, %o5
	.word	0xec300019	! t0_kref+0x4830:   	sth	%l6, [%g0 + %i1]
	.word	0x92358016	! t0_kref+0x4834:   	orn	%l6, %l6, %o1
	.word	0x8da000a0	! t0_kref+0x4838:   	fnegs	%f0, %f6
	.word	0xd250a00a	! t0_kref+0x483c:   	ldsh	[%g2 + 0xa], %o1
	.word	0x9ea58016	! t0_kref+0x4840:   	subcc	%l6, %l6, %o7
	.word	0xc07e4000	! t0_kref+0x4844:   	swap	[%i1], %g0
	.word	0x86102002	! t0_kref+0x4848:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x484c:   	bne,a	_kref+0x484c
	.word	0x86a0e001	! t0_kref+0x4850:   	subcc	%g3, 1, %g3
	.word	0x81a9ca26	! t0_kref+0x4854:   	fcmps	%fcc0, %f7, %f6
	.word	0x9605f6dd	! t0_kref+0x4858:   	add	%l7, -0x923, %o3
	.word	0xe27e0000	! t0_kref+0x485c:   	swap	[%i0], %l1
	.word	0x85a108c8	! t0_kref+0x4860:   	fsubd	%f4, %f8, %f2
	.word	0x9f0dc017	! t0_kref+0x4864:   	tsubcc	%l7, %l7, %o7
	.word	0x93a00027	! t0_kref+0x4868:   	fmovs	%f7, %f9
	.word	0xee30a016	! t0_kref+0x486c:   	sth	%l7, [%g2 + 0x16]
	.word	0x33800006	! t0_kref+0x4870:   	fbe,a	_kref+0x4888
	.word	0x90a5f582	! t0_kref+0x4874:   	subcc	%l7, -0xa7e, %o0
	.word	0x91702ec6	! t0_kref+0x4878:   	popc	0xec6, %o0
	.word	0xe3b8a040	! t0_kref+0x487c:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x92358016	! t0_kref+0x4880:   	orn	%l6, %l6, %o1
	.word	0xc100a03c	! t0_kref+0x4884:   	ld	[%g2 + 0x3c], %f0
	.word	0xc398a080	! t0_kref+0x4888:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0xe3b8a040	! t0_kref+0x488c:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x903dc017	! t0_kref+0x4890:   	xnor	%l7, %l7, %o0
	.word	0xd8de5000	! t0_kref+0x4894:   	ldxa	[%i1]0x80, %o4
	.word	0x81dcf3e4	! t0_kref+0x4898:   	flush	%l3 - 0xc1c
	.word	0xec300019	! t0_kref+0x489c:   	sth	%l6, [%g0 + %i1]
	.word	0x9335c017	! t0_kref+0x48a0:   	srl	%l7, %l7, %o1
	.word	0x81858000	! t0_kref+0x48a4:   	wr	%l6, %g0, %y
	.word	0x8fa000a3	! t0_kref+0x48a8:   	fnegs	%f3, %f7
	.word	0x81a01a24	! t0_kref+0x48ac:   	fstoi	%f4, %f0
	.word	0x81a008c4	! t0_kref+0x48b0:   	fsubd	%f0, %f4, %f0
	.word	0xdede1000	! t0_kref+0x48b4:   	ldxa	[%i0]0x80, %o7
	.word	0x91a189c2	! t0_kref+0x48b8:   	fdivd	%f6, %f2, %f8
	.word	0xda6e8018	! t0_kref+0x48bc:   	ldstub	[%i2 + %i0], %o5
	.word	0x91400000	! t0_kref+0x48c0:   	mov	%y, %o0
	.word	0x81700017	! t0_kref+0x48c4:   	popc	%l7, %g0
	.word	0x90c5b16b	! t0_kref+0x48c8:   	addccc	%l6, -0xe95, %o0
	.word	0xd810a01e	! t0_kref+0x48cc:   	lduh	[%g2 + 0x1e], %o4
	.word	0x9ea5a9f7	! t0_kref+0x48d0:   	subcc	%l6, 0x9f7, %o7
	.word	0x81a1c927	! t0_kref+0x48d4:   	fmuls	%f7, %f7, %f0
	.word	0x81a84aa1	! t0_kref+0x48d8:   	fcmpes	%fcc0, %f1, %f1
	.word	0x9ea5f51f	! t0_kref+0x48dc:   	subcc	%l7, -0xae1, %o7
	.word	0x8fa01a20	! t0_kref+0x48e0:   	fstoi	%f0, %f7
	call	SYM(t0_subr0)
	.word	0x800d8016	! t0_kref+0x48e8:   	and	%l6, %l6, %g0
	.word	0x8da10846	! t0_kref+0x48ec:   	faddd	%f4, %f6, %f6
	.word	0x87a000a9	! t0_kref+0x48f0:   	fnegs	%f9, %f3
	.word	0x81a000a4	! t0_kref+0x48f4:   	fnegs	%f4, %f0
	.word	0x81a01923	! t0_kref+0x48f8:   	fstod	%f3, %f0
	.word	0xedee501b	! t0_kref+0x48fc:   	prefetcha	%i1 + %i3, 22
	.word	0x8da089c2	! t0_kref+0x4900:   	fdivd	%f2, %f2, %f6
	.word	0x9aa5efa9	! t0_kref+0x4904:   	subcc	%l7, 0xfa9, %o5
	.word	0x81a01a20	! t0_kref+0x4908:   	fstoi	%f0, %f0
	.word	0x81a01102	! t0_kref+0x490c:   	fxtod	%f2, %f0
	.word	0x94b5c016	! t0_kref+0x4910:   	orncc	%l7, %l6, %o2
	.word	0x9ed5b2d5	! t0_kref+0x4914:   	umulcc	%l6, -0xd2b, %o7
	.word	0x9f3dc017	! t0_kref+0x4918:   	sra	%l7, %l7, %o7
	.word	0x81a01921	! t0_kref+0x491c:   	fstod	%f1, %f0
	.word	0x96b5c016	! t0_kref+0x4920:   	orncc	%l7, %l6, %o3
	.word	0x001fffff	! t0_kref+0x4924:   	illtrap	0x1fffff
	.word	0x81a94aa2	! t0_kref+0x4928:   	fcmpes	%fcc0, %f5, %f2
	.word	0xd210a010	! t0_kref+0x492c:   	lduh	[%g2 + 0x10], %o1
	.word	0x9f2de00d	! t0_kref+0x4930:   	sll	%l7, 0xd, %o7
	.word	0xc91fbcc0	! t0_kref+0x4934:   	ldd	[%fp - 0x340], %f4
	.word	0x94adc017	! t0_kref+0x4938:   	andncc	%l7, %l7, %o2
	.word	0x8da00027	! t0_kref+0x493c:   	fmovs	%f7, %f6
	.word	0xd1266010	! t0_kref+0x4940:   	st	%f8, [%i1 + 0x10]
	.word	0x93a000a7	! t0_kref+0x4944:   	fnegs	%f7, %f9
	.word	0x81a98a28	! t0_kref+0x4948:   	fcmps	%fcc0, %f6, %f8
	.word	0xec2e3fe1	! t0_kref+0x494c:   	stb	%l6, [%i0 - 0x1f]
	.word	0x9405c017	! t0_kref+0x4950:   	add	%l7, %l7, %o2
	.word	0xd84e001a	! t0_kref+0x4954:   	ldsb	[%i0 + %i2], %o4
	.word	0x9ae5e1dc	! t0_kref+0x4958:   	subccc	%l7, 0x1dc, %o5
	.word	0x913da009	! t0_kref+0x495c:   	sra	%l6, 0x9, %o0
	.word	0x909dc016	! t0_kref+0x4960:   	xorcc	%l7, %l6, %o0
	.word	0xcb270019	! t0_kref+0x4964:   	st	%f5, [%i4 + %i1]
	.word	0xda00a030	! t0_kref+0x4968:   	ld	[%g2 + 0x30], %o5
	.word	0x91a209c2	! t0_kref+0x496c:   	fdivd	%f8, %f2, %f8
	.word	0xf36e6018	! t0_kref+0x4970:   	prefetch	%i1 + 0x18, 25
	.word	0xcd1fbdf0	! t0_kref+0x4974:   	ldd	[%fp - 0x210], %f6
	.word	0x85a000c6	! t0_kref+0x4978:   	fnegd	%f6, %f2
	.word	0xc168a046	! t0_kref+0x497c:   	prefetch	%g2 + 0x46, 0
	.word	0x89a209a5	! t0_kref+0x4980:   	fdivs	%f8, %f5, %f4
	.word	0xc11e6008	! t0_kref+0x4984:   	ldd	[%i1 + 8], %f0
	.word	0x99258016	! t0_kref+0x4988:   	mulscc	%l6, %l6, %o4
	.word	0x9a85f1c1	! t0_kref+0x498c:   	addcc	%l7, -0xe3f, %o5
	.word	0xe3b8a040	! t0_kref+0x4990:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xd816600c	! t0_kref+0x4994:   	lduh	[%i1 + 0xc], %o4
	.word	0xd19f1a59	! t0_kref+0x4998:   	ldda	[%i4 + %i1]0xd2, %f8
	.word	0xcd1fbea0	! t0_kref+0x499c:   	ldd	[%fp - 0x160], %f6
	.word	0xee780019	! t0_kref+0x49a0:   	swap	[%g0 + %i1], %l7
	.word	0xcf270019	! t0_kref+0x49a4:   	st	%f7, [%i4 + %i1]
	.word	0x8143c000	! t0_kref+0x49a8:   	stbar
	.word	0xee36001b	! t0_kref+0x49ac:   	sth	%l7, [%i0 + %i3]
	.word	0x9aa58017	! t0_kref+0x49b0:   	subcc	%l6, %l7, %o5
	.word	0x91a01903	! t0_kref+0x49b4:   	fitod	%f3, %f8
	.word	0xd010a00a	! t0_kref+0x49b8:   	lduh	[%g2 + 0xa], %o0
	.word	0x35800006	! t0_kref+0x49bc:   	fbue,a	_kref+0x49d4
	.word	0xee6e3fe1	! t0_kref+0x49c0:   	ldstub	[%i0 - 0x1f], %l7
	.word	0xd050a02e	! t0_kref+0x49c4:   	ldsh	[%g2 + 0x2e], %o0
	.word	0xe3b8a040	! t0_kref+0x49c8:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xc900a000	! t0_kref+0x49cc:   	ld	[%g2], %f4
	.word	0x9865c017	! t0_kref+0x49d0:   	subc	%l7, %l7, %o4
	.word	0x90458016	! t0_kref+0x49d4:   	addc	%l6, %l6, %o0
	.word	0xc1be1856	! t0_kref+0x49d8:   	stda	%f0, [%i0 + %l6]0xc2
	.word	0x9a0df362	! t0_kref+0x49dc:   	and	%l7, -0xc9e, %o5
	.word	0x8d85c016	! t0_kref+0x49e0:   	wr	%l7, %l6, %fprs
	.word	0x81a88a25	! t0_kref+0x49e4:   	fcmps	%fcc0, %f2, %f5
	.word	0xc91fbe90	! t0_kref+0x49e8:   	ldd	[%fp - 0x170], %f4
	.word	0x8da018c4	! t0_kref+0x49ec:   	fdtos	%f4, %f6
	.word	0x8da000a6	! t0_kref+0x49f0:   	fnegs	%f6, %f6
	.word	0xec36c018	! t0_kref+0x49f4:   	sth	%l6, [%i3 + %i0]
	.word	0xe1ee101c	! t0_kref+0x49f8:   	prefetcha	%i0 + %i4, 16
	.word	0x90bde78c	! t0_kref+0x49fc:   	xnorcc	%l7, 0x78c, %o0
	.word	0x8da01a28	! t0_kref+0x4a00:   	fstoi	%f8, %f6
	.word	0x8da109c6	! t0_kref+0x4a04:   	fdivd	%f4, %f6, %f6
	.word	0x94758017	! t0_kref+0x4a08:   	udiv	%l6, %l7, %o2
	.word	0xd2df5018	! t0_kref+0x4a0c:   	ldxa	[%i5 + %i0]0x80, %o1
	sethi	%hi(2f), %o7
	.word	0xe40be230	! t0_kref+0x4a14:   	ldub	[%o7 + 0x230], %l2
	.word	0xa41ca00c	! t0_kref+0x4a18:   	xor	%l2, 0xc, %l2
	.word	0xe42be230	! t0_kref+0x4a1c:   	stb	%l2, [%o7 + 0x230]
	.word	0x81dbe230	! t0_kref+0x4a20:   	flush	%o7 + 0x230
	.word	0x9695fcb8	! t0_kref+0x4a24:   	orcc	%l7, -0x348, %o3
	.word	0x9ef5aa17	! t0_kref+0x4a28:   	udivcc	%l6, 0xa17, %o7
	.word	0x81a88a48	! t0_kref+0x4a2c:   	fcmpd	%fcc0, %f2, %f8
2:	.word	0xc53e7fe8	! t0_kref+0x4a30:   	std	%f2, [%i1 - 0x18]
	.word	0xee680019	! t0_kref+0x4a34:   	ldstub	[%g0 + %i1], %l7
	.word	0x87a01a20	! t0_kref+0x4a38:   	fstoi	%f0, %f3
	.word	0x9095bb01	! t0_kref+0x4a3c:   	orcc	%l6, -0x4ff, %o0
	.word	0x8fa000a6	! t0_kref+0x4a40:   	fnegs	%f6, %f7
	.word	0x813de006	! t0_kref+0x4a44:   	sra	%l7, 0x6, %g0
	.word	0xf1ee101a	! t0_kref+0x4a48:   	prefetcha	%i0 + %i2, 24
	.word	0x9ebdc016	! t0_kref+0x4a4c:   	xnorcc	%l7, %l6, %o7
	.word	0x9a25edbe	! t0_kref+0x4a50:   	sub	%l7, 0xdbe, %o5
	.word	0x9235ae93	! t0_kref+0x4a54:   	orn	%l6, 0xe93, %o1
	.word	0x8143e040	! t0_kref+0x4a58:   	membar	0x40
	.word	0x945dba54	! t0_kref+0x4a5c:   	smul	%l6, -0x5ac, %o2
	.word	0x9fc00004	! t0_kref+0x4a60:   	call	%g0 + %g4
	.word	0xda5e6008	! t0_kref+0x4a64:   	ldx	[%i1 + 8], %o5
	.word	0xc9be5896	! t0_kref+0x4a68:   	stda	%f4, [%i1 + %l6]0xc4
	.word	0x83a01a48	! t0_kref+0x4a6c:   	fdtoi	%f8, %f1
	call	SYM(t0_subr2)
	.word	0x973d8016	! t0_kref+0x4a74:   	sra	%l6, %l6, %o3
	.word	0x81a000a2	! t0_kref+0x4a78:   	fnegs	%f2, %f0
	.word	0xd6901018	! t0_kref+0x4a7c:   	lduha	[%g0 + %i0]0x80, %o3
	.word	0xc398a040	! t0_kref+0x4a80:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0x8da01920	! t0_kref+0x4a84:   	fstod	%f0, %f6
	.word	0xc91fbc88	! t0_kref+0x4a88:   	ldd	[%fp - 0x378], %f4
	call	1f
	.empty
	.word	0xcd064000	! t0_kref+0x4a90:   	ld	[%i1], %f6
	.word	0x9ac58016	! t0_kref+0x4a94:   	addccc	%l6, %l6, %o5
1:	.word	0xe8fe101c	! t0_kref+0x4a98:   	swapa	[%i0 + %i4]0x80, %l4
	.word	0xc1be5a1b	! t0_kref+0x4a9c:   	stda	%f0, [%i1 + %i3]0xd0
	.word	0x2f800005	! t0_kref+0x4aa0:   	fbu,a	_kref+0x4ab4
	.word	0x193a7c00	! t0_kref+0x4aa4:   	sethi	%hi(0xe9f00000), %o4
	.word	0x990d8017	! t0_kref+0x4aa8:   	tsubcc	%l6, %l7, %o4
	.word	0x9255f6ae	! t0_kref+0x4aac:   	umul	%l7, -0x952, %o1
	.word	0x9fc00004	! t0_kref+0x4ab0:   	call	%g0 + %g4
	.word	0xd4164000	! t0_kref+0x4ab4:   	lduh	[%i1], %o2
	.word	0xd13e2000	! t0_kref+0x4ab8:   	std	%f8, [%i0]
	.word	0xda6e401a	! t0_kref+0x4abc:   	ldstub	[%i1 + %i2], %o5
	.word	0xd83e3fe8	! t0_kref+0x4ac0:   	std	%o4, [%i0 - 0x18]
	.word	0x8ba048a9	! t0_kref+0x4ac4:   	fsubs	%f1, %f9, %f5
	.word	0x9445f902	! t0_kref+0x4ac8:   	addc	%l7, -0x6fe, %o2
	.word	0xee260000	! t0_kref+0x4acc:   	st	%l7, [%i0]
	.word	0xc000a008	! t0_kref+0x4ad0:   	ld	[%g2 + 8], %g0
	.word	0x9b702cc5	! t0_kref+0x4ad4:   	popc	0xcc5, %o5
	.word	0xd11fbd70	! t0_kref+0x4ad8:   	ldd	[%fp - 0x290], %f8
	.word	0x8ba01080	! t0_kref+0x4adc:   	fxtos	%f0, %f5
	.word	0xeafe501c	! t0_kref+0x4ae0:   	swapa	[%i1 + %i4]0x80, %l5
	.word	0x9f3d8016	! t0_kref+0x4ae4:   	sra	%l6, %l6, %o7
	.word	0x878020f0	! t0_kref+0x4ae8:   	mov	0xf0, %asi
	.word	0x8143e040	! t0_kref+0x4aec:   	membar	0x40
	.word	0x91a188c2	! t0_kref+0x4af0:   	fsubd	%f6, %f2, %f8
	.word	0x89a208c8	! t0_kref+0x4af4:   	fsubd	%f8, %f8, %f4
	.word	0x85a189c8	! t0_kref+0x4af8:   	fdivd	%f6, %f8, %f2
	.word	0xc807bfe4	! t0_kref+0x4afc:   	ld	[%fp - 0x1c], %g4
	.word	0x97400000	! t0_kref+0x4b00:   	mov	%y, %o3
	.word	0xe07e7fe8	! t0_kref+0x4b04:   	swap	[%i1 - 0x18], %l0
	.word	0x9405b3b1	! t0_kref+0x4b08:   	add	%l6, -0xc4f, %o2
	.word	0xe27e4000	! t0_kref+0x4b0c:   	swap	[%i1], %l1
	.word	0x93a01a21	! t0_kref+0x4b10:   	fstoi	%f1, %f9
	.word	0x9a5dc016	! t0_kref+0x4b14:   	smul	%l7, %l6, %o5
	.word	0x81a01029	! t0_kref+0x4b18:   	fstox	%f9, %f0
	.word	0x0108953b	! t0_kref+0x4b1c:   	sethi	%hi(0x2254ec00), %g0
	.word	0x9ad5a22b	! t0_kref+0x4b20:   	umulcc	%l6, 0x22b, %o5
	.word	0x97400000	! t0_kref+0x4b24:   	mov	%y, %o3
	.word	0x83a089a5	! t0_kref+0x4b28:   	fdivs	%f2, %f5, %f1
	.word	0x91a009c4	! t0_kref+0x4b2c:   	fdivd	%f0, %f4, %f8
	.word	0x81a08948	! t0_kref+0x4b30:   	fmuld	%f2, %f8, %f0
	.word	0x8da01926	! t0_kref+0x4b34:   	fstod	%f6, %f6
	.word	0xd2871019	! t0_kref+0x4b38:   	lda	[%i4 + %i1]0x80, %o1
	.word	0x89a018c4	! t0_kref+0x4b3c:   	fdtos	%f4, %f4
	.word	0xc016401b	! t0_kref+0x4b40:   	lduh	[%i1 + %i3], %g0
	.word	0x8da149a9	! t0_kref+0x4b44:   	fdivs	%f5, %f9, %f6
	.word	0xeeb01018	! t0_kref+0x4b48:   	stha	%l7, [%g0 + %i0]0x80
	.word	0x985defdd	! t0_kref+0x4b4c:   	smul	%l7, 0xfdd, %o4
	.word	0x8fa000a3	! t0_kref+0x4b50:   	fnegs	%f3, %f7
	.word	0x92ddfb47	! t0_kref+0x4b54:   	smulcc	%l7, -0x4b9, %o1
	.word	0x8da088c6	! t0_kref+0x4b58:   	fsubd	%f2, %f6, %f6
	.word	0x9ac5c017	! t0_kref+0x4b5c:   	addccc	%l7, %l7, %o5
	call	SYM(t0_subr3)
	.word	0x94ade202	! t0_kref+0x4b64:   	andncc	%l7, 0x202, %o2
	.word	0x8143c000	! t0_kref+0x4b68:   	stbar
	.word	0x8da00844	! t0_kref+0x4b6c:   	faddd	%f0, %f4, %f6
	.word	0x85a01903	! t0_kref+0x4b70:   	fitod	%f3, %f2
	.word	0x81a98a21	! t0_kref+0x4b74:   	fcmps	%fcc0, %f6, %f1
	.word	0x9005ff99	! t0_kref+0x4b78:   	add	%l7, -0x67, %o0
	.word	0xd06e4000	! t0_kref+0x4b7c:   	ldstub	[%i1], %o0
	.word	0xc5a65000	! t0_kref+0x4b80:   	sta	%f2, [%i1]0x80
	.word	0x85a088c0	! t0_kref+0x4b84:   	fsubd	%f2, %f0, %f2
	.word	0x9e75ac3f	! t0_kref+0x4b88:   	udiv	%l6, 0xc3f, %o7
	.word	0x96558017	! t0_kref+0x4b8c:   	umul	%l6, %l7, %o3
	.word	0x96958017	! t0_kref+0x4b90:   	orcc	%l6, %l7, %o3
	.word	0xd24e6011	! t0_kref+0x4b94:   	ldsb	[%i1 + 0x11], %o1
	.word	0x9525c016	! t0_kref+0x4b98:   	mulscc	%l7, %l6, %o2
	.word	0xeb68a081	! t0_kref+0x4b9c:   	prefetch	%g2 + 0x81, 21
	.word	0xec3e6018	! t0_kref+0x4ba0:   	std	%l6, [%i1 + 0x18]
	.word	0x3f800006	! t0_kref+0x4ba4:   	fbo,a	_kref+0x4bbc
	.word	0xd24e8018	! t0_kref+0x4ba8:   	ldsb	[%i2 + %i0], %o1
	.word	0x96b5f9bc	! t0_kref+0x4bac:   	orncc	%l7, -0x644, %o3
	.word	0xe3b8a040	! t0_kref+0x4bb0:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xef68a006	! t0_kref+0x4bb4:   	prefetch	%g2 + 6, 23
	.word	0xe3b8a040	! t0_kref+0x4bb8:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x8185c000	! t0_kref+0x4bbc:   	wr	%l7, %g0, %y
	.word	0x92a5e810	! t0_kref+0x4bc0:   	subcc	%l7, 0x810, %o1
	.word	0x94c5bf53	! t0_kref+0x4bc4:   	addccc	%l6, -0xad, %o2
	.word	0x96a5ee4c	! t0_kref+0x4bc8:   	subcc	%l7, 0xe4c, %o3
	.word	0xe0ee101a	! t0_kref+0x4bcc:   	ldstuba	[%i0 + %i2]0x80, %l0
	.word	0xd450a002	! t0_kref+0x4bd0:   	ldsh	[%g2 + 2], %o2
	.word	0x81a94aa9	! t0_kref+0x4bd4:   	fcmpes	%fcc0, %f5, %f9
	.word	0xd53869b0	! t0_kref+0x4bd8:   	std	%f10, [%g1 + 0x9b0]
	.word	0xf9ee101c	! t0_kref+0x4bdc:   	prefetcha	%i0 + %i4, 28
	.word	0x9a45e55e	! t0_kref+0x4be0:   	addc	%l7, 0x55e, %o5
	.word	0xd0d81018	! t0_kref+0x4be4:   	ldxa	[%g0 + %i0]0x80, %o0
	.word	0x9105c016	! t0_kref+0x4be8:   	taddcc	%l7, %l6, %o0
	.word	0x98dde9fb	! t0_kref+0x4bec:   	smulcc	%l7, 0x9fb, %o4
	.word	0xc9be1a5c	! t0_kref+0x4bf0:   	stda	%f4, [%i0 + %i4]0xd2
	.word	0xc12e3fec	! t0_kref+0x4bf4:   	st	%fsr, [%i0 - 0x14]
	.word	0x8ba018c8	! t0_kref+0x4bf8:   	fdtos	%f8, %f5
	.word	0x8da008c0	! t0_kref+0x4bfc:   	fsubd	%f0, %f0, %f6
	.word	0x35800006	! t0_kref+0x4c00:   	fbue,a	_kref+0x4c18
	.word	0x81dcab70	! t0_kref+0x4c04:   	flush	%l2 + 0xb70
	.word	0x81a84a29	! t0_kref+0x4c08:   	fcmps	%fcc0, %f1, %f9
	.word	0xc300a02c	! t0_kref+0x4c0c:   	ld	[%g2 + 0x2c], %f1
	.word	0xec2e4000	! t0_kref+0x4c10:   	stb	%l6, [%i1]
	.word	0x81a8caa2	! t0_kref+0x4c14:   	fcmpes	%fcc0, %f3, %f2
	.word	0x9445b0be	! t0_kref+0x4c18:   	addc	%l6, -0xf42, %o2
	.word	0x968d8016	! t0_kref+0x4c1c:   	andcc	%l6, %l6, %o3
	.word	0x81700017	! t0_kref+0x4c20:   	popc	%l7, %g0
	.word	0xed68a007	! t0_kref+0x4c24:   	prefetch	%g2 + 7, 22
	.word	0x98e5c016	! t0_kref+0x4c28:   	subccc	%l7, %l6, %o4
	.word	0x91a009c0	! t0_kref+0x4c2c:   	fdivd	%f0, %f0, %f8
	.word	0xee7e6000	! t0_kref+0x4c30:   	swap	[%i1], %l7
	.word	0x89a04d20	! t0_kref+0x4c34:   	fsmuld	%f1, %f0, %f4
	.word	0x89a18942	! t0_kref+0x4c38:   	fmuld	%f6, %f2, %f4
	.word	0xd11fbc88	! t0_kref+0x4c3c:   	ldd	[%fp - 0x378], %f8
	.word	0x9b35e005	! t0_kref+0x4c40:   	srl	%l7, 0x5, %o5
	.word	0xc91fbcd0	! t0_kref+0x4c44:   	ldd	[%fp - 0x330], %f4
	.word	0x800dfd62	! t0_kref+0x4c48:   	and	%l7, -0x29e, %g0
	.word	0x83a000a9	! t0_kref+0x4c4c:   	fnegs	%f9, %f1
	.word	0xcd3e7ff8	! t0_kref+0x4c50:   	std	%f6, [%i1 - 8]
	.word	0x37800007	! t0_kref+0x4c54:   	fbge,a	_kref+0x4c70
	.word	0x81a209c2	! t0_kref+0x4c58:   	fdivd	%f8, %f2, %f0
	.word	0x85a000c4	! t0_kref+0x4c5c:   	fnegd	%f4, %f2
	.word	0x85a108c8	! t0_kref+0x4c60:   	fsubd	%f4, %f8, %f2
	.word	0xee363ff2	! t0_kref+0x4c64:   	sth	%l7, [%i0 - 0xe]
	.word	0xd448a010	! t0_kref+0x4c68:   	ldsb	[%g2 + 0x10], %o2
	.word	0xc93e6008	! t0_kref+0x4c6c:   	std	%f4, [%i1 + 8]
	.word	0x968df0aa	! t0_kref+0x4c70:   	andcc	%l7, -0xf56, %o3
	.word	0x90dd8017	! t0_kref+0x4c74:   	smulcc	%l6, %l7, %o0
	.word	0xc807bff0	! t0_kref+0x4c78:   	ld	[%fp - 0x10], %g4
	.word	0x9695c016	! t0_kref+0x4c7c:   	orcc	%l7, %l6, %o3
	.word	0xd0166008	! t0_kref+0x4c80:   	lduh	[%i1 + 8], %o0
	.word	0x86102016	! t0_kref+0x4c84:   	mov	0x16, %g3
	.word	0x86a0e001	! t0_kref+0x4c88:   	subcc	%g3, 1, %g3
	.word	0x22800008	! t0_kref+0x4c8c:   	be,a	_kref+0x4cac
	.word	0x81a00044	! t0_kref+0x4c90:   	fmovd	%f4, %f0
	.word	0xcd262018	! t0_kref+0x4c94:   	st	%f6, [%i0 + 0x18]
	.word	0x8185c000	! t0_kref+0x4c98:   	wr	%l7, %g0, %y
	.word	0x8da01a28	! t0_kref+0x4c9c:   	fstoi	%f8, %f6
	.word	0x8065c017	! t0_kref+0x4ca0:   	subc	%l7, %l7, %g0
	.word	0x8065bf02	! t0_kref+0x4ca4:   	subc	%l6, -0xfe, %g0
	.word	0x9245f569	! t0_kref+0x4ca8:   	addc	%l7, -0xa97, %o1
	.word	0x97358016	! t0_kref+0x4cac:   	srl	%l6, %l6, %o3
	.word	0x9ef58016	! t0_kref+0x4cb0:   	udivcc	%l6, %l6, %o7
	.word	0x81a01a20	! t0_kref+0x4cb4:   	fstoi	%f0, %f0
	.word	0xc1be1897	! t0_kref+0x4cb8:   	stda	%f0, [%i0 + %l7]0xc4
	.word	0x993de016	! t0_kref+0x4cbc:   	sra	%l7, 0x16, %o4
	.word	0x9e458017	! t0_kref+0x4cc0:   	addc	%l6, %l7, %o7
	.word	0x81aa0ac4	! t0_kref+0x4cc4:   	fcmped	%fcc0, %f8, %f4
	.word	0xe168a00e	! t0_kref+0x4cc8:   	prefetch	%g2 + 0xe, 16
	.word	0x91a189a2	! t0_kref+0x4ccc:   	fdivs	%f6, %f2, %f8
	.word	0x89a188c8	! t0_kref+0x4cd0:   	fsubd	%f6, %f8, %f4
	.word	0xc51fbec0	! t0_kref+0x4cd4:   	ldd	[%fp - 0x140], %f2
	.word	0xc91fbc68	! t0_kref+0x4cd8:   	ldd	[%fp - 0x398], %f4
	.word	0xd86e601a	! t0_kref+0x4cdc:   	ldstub	[%i1 + 0x1a], %o4
	.word	0x34480003	! t0_kref+0x4ce0:   	bg,a,pt	%icc, _kref+0x4cec
	.word	0x012e151e	! t0_kref+0x4ce4:   	sethi	%hi(0xb8547800), %g0
	.word	0xd03e3ff0	! t0_kref+0x4ce8:   	std	%o0, [%i0 - 0x10]
	.word	0xd11fbd18	! t0_kref+0x4cec:   	ldd	[%fp - 0x2e8], %f8
	.word	0xefee101b	! t0_kref+0x4cf0:   	prefetcha	%i0 + %i3, 23
	.word	0x8ba018c2	! t0_kref+0x4cf4:   	fdtos	%f2, %f5
	.word	0x92dda6cd	! t0_kref+0x4cf8:   	smulcc	%l6, 0x6cd, %o1
	.word	0xc526001c	! t0_kref+0x4cfc:   	st	%f2, [%i0 + %i4]
	.word	0xc51e7ff0	! t0_kref+0x4d00:   	ldd	[%i1 - 0x10], %f2
	.word	0xde06201c	! t0_kref+0x4d04:   	ld	[%i0 + 0x1c], %o7
	.word	0x91a008c2	! t0_kref+0x4d08:   	fsubd	%f0, %f2, %f8
	.word	0xef68a00c	! t0_kref+0x4d0c:   	prefetch	%g2 + 0xc, 23
!	.word	0x274facbc	! t0_kref+0x4d10:   	fbul,a,pt	%fcc0, SYM(t0_subr1)
	   	fbul,a,pt	%fcc0, SYM(t0_subr1)
	.word	0x9f414000	! t0_kref+0x4d14:   	mov	%pc, %o7
	.word	0xec263ff0	! t0_kref+0x4d18:   	st	%l6, [%i0 - 0x10]
	.word	0x9535e018	! t0_kref+0x4d1c:   	srl	%l7, 0x18, %o2
	.word	0x96f5c016	! t0_kref+0x4d20:   	udivcc	%l7, %l6, %o3
	.word	0x803dc016	! t0_kref+0x4d24:   	xnor	%l7, %l6, %g0
	.word	0xee264000	! t0_kref+0x4d28:   	st	%l7, [%i1]
	.word	0xc040a014	! t0_kref+0x4d2c:   	ldsw	[%g2 + 0x14], %g0
	.word	0x93a000a9	! t0_kref+0x4d30:   	fnegs	%f9, %f9
	.word	0x93a00021	! t0_kref+0x4d34:   	fmovs	%f1, %f9
	.word	0x8fa01a48	! t0_kref+0x4d38:   	fdtoi	%f8, %f7
	.word	0x81a8ca29	! t0_kref+0x4d3c:   	fcmps	%fcc0, %f3, %f9
	.word	0xee78a034	! t0_kref+0x4d40:   	swap	[%g2 + 0x34], %l7
	.word	0xde16c018	! t0_kref+0x4d44:   	lduh	[%i3 + %i0], %o7
	.word	0xd2070018	! t0_kref+0x4d48:   	ld	[%i4 + %i0], %o1
	.word	0x8610200c	! t0_kref+0x4d4c:   	mov	0xc, %g3
	.word	0x86a0e001	! t0_kref+0x4d50:   	subcc	%g3, 1, %g3
	.word	0x2280000c	! t0_kref+0x4d54:   	be,a	_kref+0x4d84
	.word	0xf9ee501c	! t0_kref+0x4d58:   	prefetcha	%i1 + %i4, 28
	.word	0xd1380018	! t0_kref+0x4d5c:   	std	%f8, [%g0 + %i0]
	.word	0x83a01a24	! t0_kref+0x4d60:   	fstoi	%f4, %f1
	.word	0x81a000a3	! t0_kref+0x4d64:   	fnegs	%f3, %f0
	.word	0xcd1e2018	! t0_kref+0x4d68:   	ldd	[%i0 + 0x18], %f6
	.word	0xc100a038	! t0_kref+0x4d6c:   	ld	[%g2 + 0x38], %f0
	.word	0xd20e3ff5	! t0_kref+0x4d70:   	ldub	[%i0 - 0xb], %o1
	.word	0xec263fe0	! t0_kref+0x4d74:   	st	%l6, [%i0 - 0x20]
	.word	0xde08a016	! t0_kref+0x4d78:   	ldub	[%g2 + 0x16], %o7
	.word	0xc1062010	! t0_kref+0x4d7c:   	ld	[%i0 + 0x10], %f0
	.word	0x9f05ab4d	! t0_kref+0x4d80:   	taddcc	%l6, 0xb4d, %o7
	.word	0x31800001	! t0_kref+0x4d84:   	fba,a	_kref+0x4d88
	.word	0x9e458017	! t0_kref+0x4d88:   	addc	%l6, %l7, %o7
	.word	0xcd3e4000	! t0_kref+0x4d8c:   	std	%f6, [%i1]
	.word	0x9695eb2a	! t0_kref+0x4d90:   	orcc	%l7, 0xb2a, %o3
	.word	0xe41e001d	! t0_kref+0x4d94:   	ldd	[%i0 + %i5], %l2
	.word	0x93a000a1	! t0_kref+0x4d98:   	fnegs	%f1, %f9
	.word	0x91a000a9	! t0_kref+0x4d9c:   	fnegs	%f9, %f8
	.word	0x9b25b17b	! t0_kref+0x4da0:   	mulscc	%l6, -0xe85, %o5
	.word	0x81a94aa5	! t0_kref+0x4da4:   	fcmpes	%fcc0, %f5, %f5
	.word	0x81a94a29	! t0_kref+0x4da8:   	fcmps	%fcc0, %f5, %f9
	.word	0xd048a02e	! t0_kref+0x4dac:   	ldsb	[%g2 + 0x2e], %o0
	.word	0xe3b8a040	! t0_kref+0x4db0:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x933da00f	! t0_kref+0x4db4:   	sra	%l6, 0xf, %o1
	.word	0x81a009a4	! t0_kref+0x4db8:   	fdivs	%f0, %f4, %f0
	.word	0x8da01021	! t0_kref+0x4dbc:   	fstox	%f1, %f6
	.word	0xec28a02b	! t0_kref+0x4dc0:   	stb	%l6, [%g2 + 0x2b]
	.word	0x9e25c016	! t0_kref+0x4dc4:   	sub	%l7, %l6, %o7
	.word	0xef6e7fe0	! t0_kref+0x4dc8:   	prefetch	%i1 - 0x20, 23
	.word	0x92f5a5c6	! t0_kref+0x4dcc:   	udivcc	%l6, 0x5c6, %o1
	.word	0xee28a031	! t0_kref+0x4dd0:   	stb	%l7, [%g2 + 0x31]
	.word	0x91a01906	! t0_kref+0x4dd4:   	fitod	%f6, %f8
	.word	0x8da08842	! t0_kref+0x4dd8:   	faddd	%f2, %f2, %f6
	.word	0xc19f5a58	! t0_kref+0x4ddc:   	ldda	[%i5 + %i0]0xd2, %f0
	.word	0xc568a04b	! t0_kref+0x4de0:   	prefetch	%g2 + 0x4b, 2
	.word	0x89a00844	! t0_kref+0x4de4:   	faddd	%f0, %f4, %f4
	.word	0x96f5a6cc	! t0_kref+0x4de8:   	udivcc	%l6, 0x6cc, %o3
	.word	0x9ac58017	! t0_kref+0x4dec:   	addccc	%l6, %l7, %o5
	.word	0x90e5e9b3	! t0_kref+0x4df0:   	subccc	%l7, 0x9b3, %o0
	.word	0xc9a71019	! t0_kref+0x4df4:   	sta	%f4, [%i4 + %i1]0x80
	.word	0x9aa5a9e3	! t0_kref+0x4df8:   	subcc	%l6, 0x9e3, %o5
	.word	0x35800007	! t0_kref+0x4dfc:   	fbue,a	_kref+0x4e18
	.word	0x8da08948	! t0_kref+0x4e00:   	fmuld	%f2, %f8, %f6
!	.word	0x214fac7f	! t0_kref+0x4e04:   	fbn,a,pt	%fcc0, SYM(t0_subr1)
	   	fbn,a,pt	%fcc0, SYM(t0_subr1)
	.word	0x9f414000	! t0_kref+0x4e08:   	mov	%pc, %o7
	.word	0xcc18001d	! t0_kref+0x4e0c:   	ldd	[%g0 + %i5], %g6
	.word	0xec3e4000	! t0_kref+0x4e10:   	std	%l6, [%i1]
	.word	0xee266010	! t0_kref+0x4e14:   	st	%l7, [%i1 + 0x10]
	.word	0x9125c016	! t0_kref+0x4e18:   	mulscc	%l7, %l6, %o0
	.word	0x80c5c017	! t0_kref+0x4e1c:   	addccc	%l7, %l7, %g0
	call	SYM(_kaos_done)
	.word	0x01000000	! t0_kref+0x4e24:   	nop
	KGLOBAL(t0_ktbl_end)
t0_ktbl_end:
t0_ktbl_page_end:

KTEXT_MODULE(t0_module_subr0, 0x00fe2000)
.seg "text"
t0_subr0_page_begin:
	.skip 8184
.global _t0_subr0; ENTRY(t0_subr0)
	.word	0xa6844012	! t0_subr0+0x0:   	addcc	%l1, %l2, %l3
	.word	0x81c3e008	! t0_subr0+0x4:   	retl
	.word	0xaa64c014	! t0_subr0+0x8:   	subc	%l3, %l4, %l5
t0_subr0_page_end:

KTEXT_MODULE(t0_module_subr1, 0x009da000)
.seg "text"
t0_subr1_page_begin:
	.skip 8192
.global _t0_subr1; ENTRY(t0_subr1)
	.word	0x9de3bfa0	! t0_subr1+0x0:   	save	%sp, -0x60, %sp
	.word	0xb29eaa5a	! t0_subr1+0x4:   	xorcc	%i2, 0xa5a, %i1
	.word	0x81c7e008	! t0_subr1+0x8:   	ret
	.word	0xa7ee6001	! t0_subr1+0xc:   	restore	%i1, 1, %l3
t0_subr1_page_end:

KTEXT_MODULE(t0_module_subr2, 0x00984000)
.seg "text"
t0_subr2_page_begin:
	.skip 8192
.global _t0_subr2; ENTRY(t0_subr2)
	.word	0x9de3bfa0	! t0_subr2+0x0:   	save	%sp, -0x60, %sp
	.word	0xb2066001	! t0_subr2+0x4:   	add	%i1, 1, %i1
	.word	0x81c7e008	! t0_subr2+0x8:   	ret
	.word	0xa3ee6001	! t0_subr2+0xc:   	restore	%i1, 1, %l1
t0_subr2_page_end:

KTEXT_MODULE(t0_module_subr3, 0x42f46000)
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
!  Total operations: 4716  
!
!  Operation frequencies
!
!  name               exp    obs
!  ldsb              0.78   0.87
!  ldub              0.17   0.11
!  ldsh              0.07   0.04
!  lduh              1.20   1.04
!  ld                0.63   0.66
!  ldd               0.27   0.32
!  swap              1.69   1.82
!  ldstub            1.17   1.23
!  stb               0.34   0.51
!  sth               1.64   1.70
!  st                0.88   1.08
!  std               1.43   1.36
!  add               0.72   0.74
!  addcc             0.16   0.17
!  addx              1.62   2.06
!  addxcc            1.32   1.55
!  taddcc            0.29   0.32
!  taddcctv          0.08   0.06
!  sub               0.90   0.93
!  subcc             1.44   1.84
!  subx              1.41   1.57
!  subxcc            0.82   1.00
!  tsubcc            0.24   0.28
!  tsubcctv          0.06   0.00
!  mulscc            0.91   0.93
!  and               0.93   0.95
!  andcc             0.82   0.89
!  andn              0.08   0.00
!  andncc            0.54   0.78
!  or                0.15   0.19
!  orcc              1.42   1.89
!  orn               1.48   1.46
!  orncc             0.50   0.53
!  xor               0.30   0.34
!  xorcc             0.65   0.74
!  xnor              0.68   0.64
!  xnorcc            0.88   0.89
!  sll               0.14   0.23
!  srl               0.93   1.04
!  sra               1.11   1.34
!  unimp             0.08   0.15
!  umul              0.72   0.66
!  smul              1.03   0.89
!  udiv              1.65   1.68
!  sdiv              0.03   0.02
!  umulcc            1.80   1.59
!  smulcc            0.68   0.74
!  udivcc            1.02   1.36
!  sdivcc            0.06   0.02
!  rdy               0.56   0.59
!  wry               0.76   0.59
!  bicc              0.06   0.02
!  sethi             0.82   0.89
!  jmpl              1.12   0.93
!  call              1.08   0.91
!  ticc              0.00   0.00
!  flush             0.99   1.23
!  save              0.03   0.00
!  restore           1.70   0.00
!  stbar             0.82   0.95
!  ldf               0.35   0.36
!  lddf              0.68   0.66
!  stf               1.56   1.55
!  stdf              0.72   0.81
!  fadds             0.14   0.17
!  fsubs             0.22   0.19
!  fmuls             0.16   0.19
!  fdivs             1.79   1.87
!  faddd             0.85   0.78
!  fsubd             1.38   1.51
!  fmuld             1.37   1.31
!  fdivd             0.87   0.89
!  faddq             0.00   0.00
!  fsubq             0.00   0.00
!  fmulq             0.00   0.00
!  fdivq             0.00   0.00
!  fsmuld            0.96   0.95
!  fdmulq            0.00   0.00
!  fitos             0.86   0.95
!  fitod             1.26   1.10
!  fitoq             0.00   0.00
!  fstoi             1.50   1.84
!  fstod             0.88   1.00
!  fstoq             0.00   0.00
!  fdtoi             0.38   0.42
!  fdtos             1.41   1.53
!  fdtoq             0.00   0.00
!  fqtoi             0.00   0.00
!  fqtos             0.00   0.00
!  fqtod             0.00   0.00
!  fmovs             1.39   1.53
!  fnegs             1.76   1.82
!  fabss             0.01   0.04
!  fsqrts            0.08   0.11
!  fsqrtd            0.00   0.00
!  fsqrtq            0.00   0.00
!  fcmps             1.72   1.55
!  fcmpd             0.29   0.30
!  fcmpq             0.00   0.00
!  fcmpes            1.31   1.15
!  fcmped            0.30   0.36
!  fcmpeq            0.00   0.00
!  fbfcc             2.37   2.33
!  ldfsr             0.00   0.00
!  stfsr             0.18   0.19
!  loop              1.06   0.93
!  offset            0.06   0.06
!  area              0.14   0.17
!  target            0.17   0.19
!  goto              0.34   0.23
!  sigsegv           0.29   0.38
!  sigbus            0.09   0.15
!  imodify           1.57   1.12
!  ldfsr_offset      0.03   0.00
!  fpattern          1.55   1.70
!  lbranch           0.26   0.23
!  shmld             2.30   2.78
!  shmst             1.77   1.97
!  shmpf             1.33   1.55
!  shmswap           0.16   0.15
!  shmblkld          0.98   0.06
!  shmblkst          1.60   0.23
!  shmblkchk         0.56   0.40
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
!  casa              0.22   0.21
!  rdasi             0.10   0.19
!  wrasi             0.32   0.25
!  bpcc              0.25   0.19
!  fbpfcc            0.06   0.02
!  fmovscc           0.08   0.15
!  fmovdcc           0.16   0.21
!  fmovqcc           0.00   0.00
!  movcc             0.03   0.00
!  flushw            0.00   0.00
!  membar            0.15   0.02
!  prefetch          1.39   1.57
!  rdpc              0.18   0.11
!  ldqf              0.00   0.00
!  stqf              0.00   0.00
!  ldfa              0.00   0.00
!  lddfa             0.23   0.15
!  ldqfa             0.00   0.00
!  ldsba             0.00   0.00
!  ldsha             0.16   0.11
!  lduba             0.08   0.04
!  lduha             0.30   0.25
!  lda               0.14   0.08
!  ldda              0.22   0.28
!  ldstuba           0.30   0.32
!  prefetcha         1.68   1.63
!  stfa              0.27   0.30
!  stdfa             0.18   0.17
!  stqfa             0.00   0.00
!  stba              0.33   0.34
!  stha              0.10   0.13
!  sta               0.08   0.13
!  stda              0.18   0.17
!  swapa             0.14   0.17
!  fmovd             0.15   0.19
!  fnegd             0.19   0.25
!  fabsd             0.12   0.15
!  fstox             0.17   0.17
!  fdtox             0.07   0.11
!  fxtos             0.09   0.04
!  fxtod             0.30   0.19
!  lds               0.02   0.00
!  ldsa              0.16   0.19
!  ldx               0.21   0.30
!  ldxa              0.34   0.40
!  nofault           0.14   0.11
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
!  partial_st8       0.27   0.25
!  partial_st16      0.27   0.25
!  partial_st32      0.25   0.28
!  short_st8         0.24   0.36
!  short_st16        0.32   0.28
!  short_ld8         0.02   0.02
!  short_ld16        0.35   0.61
!  blkld             0.00   0.00
!  blkst             0.10   0.00
!  blkld_offset      0.32   0.00
!  blkst_offset      0.10   0.00
!  blk_check         0.05   0.02
!  casxa             0.29   0.34
!  rdccr             0.05   0.04
!  rdfprs            0.34   0.25
!  wrccr             0.04   0.00
!  popc              0.31   0.38
!  wrfprs            0.27   0.30
!  stx               0.18   0.13
!  stxa              0.07   0.08
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
KDATA_MODULE(t0_module_offset_table, 0x497c4000)
.seg "data"
t0_offset_table_start:
t0_offset_table_size:	.word	0x00000008
t0_offset_table:
	.word	0x00000000
	.word	0xfffffff0
	.word	0x00000010
	.word	0x00000008
	.word	0x00000018
	.word	0xffffffe8
	.word	0xfffffff8
	.word	0xffffffe0
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

KDATA_MODULE(t0_module_data_in_regs, 0x4a864000)
.seg "data"
KGLOBAL(t0_data_in_regs)
t0_data_in_regs_start:
t0_data_in_regs:
	.word	0xbfd5aa03          ! %f0
	.word	0x3147bec0          ! %f1
	.word	0x5679b22b          ! %f2
	.word	0x9d9e77c4          ! %f3
	.word	0xc1db77ab          ! %f4
	.word	0x1b1196ff          ! %f5
	.word	0xf25b3658          ! %f6
	.word	0xbbe320a4          ! %f7
	.word	0x027c908b          ! %f8
	.word	0x345fb29b          ! %f9
	.word	0x0f90b91f          ! %f10
	.word	0xec9f9d06          ! %f11
	.word	0x6531d868          ! %f12
	.word	0x28caffaa          ! %f13
	.word	0x89bcde53          ! %f14
	.word	0x36ac04ec          ! %f15
	.word	0xbb4a314d          ! %f16
	.word	0xdfd2e742          ! %f17
	.word	0x302e48ac          ! %f18
	.word	0xaecebc4e          ! %f19
	.word	0xaf4d129f          ! %f20
	.word	0xe80398f7          ! %f21
	.word	0xe2b658fe          ! %f22
	.word	0x0ae4943e          ! %f23
	.word	0x4006fd6e          ! %f24
	.word	0x21370aa2          ! %f25
	.word	0x35d02cad          ! %f26
	.word	0xba075a4d          ! %f27
	.word	0x95f8620d          ! %f28
	.word	0x3b7fb064          ! %f29
	.word	0x79948f5f          ! %f30
	.word	0xef837a2d          ! %f31
	.word	0x9854cae3          ! %f32
	.word	0xbbb830ea          ! %f33
	.word	0xed8ed3f4          ! %f34
	.word	0x88539597          ! %f35
	.word	0x6b496083          ! %f36
	.word	0x34a399f1          ! %f37
	.word	0xe451c8b2          ! %f38
	.word	0x3ce3366e          ! %f39
	.word	0xfd1f1afb          ! %f40
	.word	0x683dd90c          ! %f41
	.word	0x8beb3ac4          ! %f42
	.word	0x8947ff24          ! %f43
	.word	0x9c3e3469          ! %f44
	.word	0x38947ca5          ! %f45
	.word	0x9f47bce5          ! %f46
	.word	0x1f32fd5d          ! %f47
	.word	0xb25db0d2          ! %f48
	.word	0x1e7c0141          ! %f49
	.word	0x077fa558          ! %f50
	.word	0x74d202d1          ! %f51
	.word	0xba830f36          ! %f52
	.word	0x36f62f07          ! %f53
	.word	0x3621771b          ! %f54
	.word	0x24f32876          ! %f55
	.word	0x352377df          ! %f56
	.word	0x92624b82          ! %f57
	.word	0x021d2a5b          ! %f58
	.word	0xc53adfdd          ! %f59
	.word	0x30f8fbf9          ! %f60
	.word	0x02d823a5          ! %f61
	.word	0x0337082a          ! %f62
	.word	0xa95f36dc          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0x134       ! %g1 (code pointer)
	.word	t0_data_in_shm_area ! %g2 (shared area pointer)
	.word	0xff7014a0          ! %g3 (loop index)
	.word	SYM(t0_subr0)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0xfe97a807          ! %o0
	.word	0x510d4bec          ! %o1
	.word	0x1504e9a6          ! %o2
	.word	0xd66b0708          ! %o3
	.word	0x3e867e7b          ! %o4
	.word	0xd41ba4de          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0x3d33ba67          ! %l0
	.word	0x2d9b320f          ! %l1
	.word	0xb3200d6e          ! %l2
	.word	0xb461316c          ! %l3
	.word	0x9bd7fdd3          ! %l4
	.word	0x9ea36591          ! %l5
	.word	0x1abd091d          ! %l6
	.word	0xf4e75dd5          ! %l7
	.word	t0_data_in_area0    ! %i0 (area pointer)
	.word	t0_data_in_area0    ! %i1 (area pointer)
	.word	0xffffffff          ! %i2 (byte offset)
	.word	0x0000001e          ! %i3 (halfword offset)
	.word	0x00000000          ! %i4 (word offset)
	.word	0x00000018          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0x7a71edb2          ! %y
	.word	0x0000000b          ! %icc (nzvc)
	.word	0x40000e1b          ! %fsr
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
.global t0_data_in_mtbl_size; t0_data_in_mtbl_size:	.word	253
t0_data_in_regs_end:

.skip 7708	! page align

KDATA_MODULE(t0_module_data_in_stack, 0x1edea000)
.seg "data"
KGLOBAL(t0_data_in_mtbl_size)
KGLOBAL(t0_data_in_mtbl)
KGLOBAL(t0_data_in_stack)
t0_data_in_stack_start:
	.word	0x89241542
	.word	0x1255c18c
	.word	0x99e287f4
	.word	0xd75ec179
	.word	0x7fbdc044
	.word	0xc5ddcfcc
	.word	0x898fed82
	.word	0xda7aa5a5
	.word	0x6c50cbbe
	.word	0x23fcdbde
	.word	0xcbf1cc17
	.word	0x3bf1ab82
	.word	0xb769b46d
	.word	0x96e84237
	.word	0x87c22986
	.word	0x5798d51f
	.word	0xfaf6a1e0
	.word	0x3b23e6bf
	.word	0x8dae5cc7
	.word	0xdc9d28e6
	.word	0xa5d5786e
	.word	0x4c1111b3
	.word	0x45cff30e
	.word	0x0e3d3321
	.word	0x12dc9669
	.word	0x5093b6cb
	.word	0xfd265219
	.word	0x85da9bc0
	.word	0xff95b093
	.word	0x5da28a9e
	.word	0x2057abc9
	.word	0x7668d459
	.word	0x966581d0
	.word	0x22f88a45
	.word	0x665516f4
	.word	0xfe0a226f
	.word	0xb452421d
	.word	0x3064d93f
	.word	0x5ae6e179
	.word	0x37fc89f6
	.word	0x0f4618c0
	.word	0x52a01994
	.word	0x0be36f94
	.word	0x030c5c16
	.word	0x35c9fdc1
	.word	0xcb5ca23c
	.word	0x55243c72
	.word	0x57da6e2f
	.word	0x9008be98
	.word	0xe3b937c0
	.word	0xbc71d008
	.word	0x62a03d1d
	.word	0x0ab11a27
	.word	0x30942b21
	.word	0x68d8be1f
	.word	0xadfc80bc
	.word	0x924927ea
	.word	0x3fb702f9
	.word	0x3d6702b3
	.word	0x9bf6f3ae
	.word	0x1ff47e6c
	.word	0x19b112e0
	.word	0xcf724f7e
	.word	0x4812535b
	.word	0xa2d1ccfc
	.word	0x80b9a511
	.word	0xf97d1ece
	.word	0x152fdc38
	.word	0x522bdca0
	.word	0x6f589a4c
	.word	0x66d99f9f
	.word	0x7c77c64c
	.word	0xe8052c4a
	.word	0x8c1ea3fd
	.word	0x2e86cee5
	.word	0xd3ae85f0
	.word	0x58449c49
	.word	0xf0a47c9d
	.word	0x8eb55228
	.word	0x5996d4d6
	.word	0xf23cdd02
	.word	0x439ac257
	.word	0x0b26e756
	.word	0xd27cc74b
	.word	0x8faf94df
	.word	0x262a57ef
	.word	0xa0747dd4
	.word	0xce0671c0
	.word	0xd1087186
	.word	0xde7f6fdf
	.word	0xca744cd5
	.word	0x862ae286
	.word	0x299b984e
	.word	0xea57a5c2
	.word	0xb5ba7aef
	.word	0x5df873d8
	.word	0x1b7629ee
	.word	0x4f0dc9f5
	.word	0xe0c42aeb
	.word	0xd9dfba1e
	.word	0xe006cd77
	.word	0x8724437b
	.word	0x8a0601dc
	.word	0x7ac89270
	.word	0x74cf7683
	.word	0x71f92c21
	.word	0xba147a72
	.word	0xf58b1558
	.word	0xa8b0daae
	.word	0xa75d8ae2
	.word	0x45ad998f
	.word	0x99be71db
	.word	0x1a734a45
	.word	0xa87b508c
	.word	0x5fd0d81b
	.word	0x696bf4ba
	.word	0xd337e03d
	.word	0x200bfaa3
	.word	0xe98b5614
	.word	0xf754bff5
	.word	0x32b83d66
	.word	0x679c0084
	.word	0x98ebaae8
	.word	0xef5cf690
	.word	0x9eea42e0
	.word	0xe4b56ecd
	.word	0xe3f1e706
	.word	0x8c976099
	.word	0xe8007fcd
	.word	0x398e54fc
	.word	0xbc859ab2
	.word	0xce98cb68
	.word	0x9c174648
	.word	0x4f7de955
	.word	0x10c4f618
	.word	0x1c6aaa28
	.word	0xd6699b94
	.word	0xa8458709
	.word	0x7c9d56a4
	.word	0x12e8ba96
	.word	0x1be87798
	.word	0x4468ea94
	.word	0x07ced590
	.word	0x66cdb208
	.word	0xf5c2078b
	.word	0x8aa35066
	.word	0x6381abbe
	.word	0x346f36b1
	.word	0x890de7eb
	.word	0x9d3d59c5
	.word	0x25ad7ec7
	.word	0x8069a923
	.word	0xf4ae89b3
	.word	0x37e1dbf1
	.word	0x9bffeb53
	.word	0x81808214
	.word	0xc2c736cc
	.word	0xb9cdfd88
	.word	0x2cf0e0aa
	.word	0x05004864
	.word	0xed2969c3
	.word	0x371b462c
	.word	0xe188a18b
	.word	0x983b635e
	.word	0x7b136cbb
	.word	0x06a88462
	.word	0xb6447e3c
	.word	0x5b8b4d3e
t0_data_in_sp:
	.word	0x75c573a5
	.word	0x1b10adbd
	.word	0x22c49be2
	.word	0x81d3e9f2
	.word	0x2811a5af
	.word	0xca6d1d3b
	.word	0xe7be5d12
	.word	0x8b1f0624
	.word	t0_data_in_area0
	.word	t0_data_in_area0
	.word	0x00000011
	.word	0xfffffffc
	.word	0xffffffe4
	.word	0x00000000
	.word	t0_data_in_fp
	.word	0x90509fde
	.word	0x14ad43d5
	.word	0x2fe1ef12
	.word	0x92238892
	.word	0x302e4d2d
	.word	0x7eb3307e
	.word	0xdf479b5a
	.word	0xd56aa0b8
	.word	0x148b457c
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
	.word   	0xf88048c4	! [%fp - 0xc]
	.word   	0xf7ab5e03	! [%fp - 0x8]
	.word   	0x0c1e36f6	! [%fp - 0x4]
.global t0_data_in_fp; t0_data_in_fp:
	.word	0x85fd418d
	.word	0x3f7a46de
	.word	0xbbfb1948
	.word	0x743d5a7a
	.word	0xadb5f129
	.word	0x38a1b02f
	.word	0xae1b3f78
	.word	0xc6ac0ade
	.word	0x9cc0bd44
	.word	0xb379d694
	.word	0x0e50dbb5
	.word	0xc7e90b9b
	.word	0xcc58085e
	.word	0xba5f1afd
	.word	0x483ce2f7
	.word	0xa188fabb
	.word	0xd3a3912b
	.word	0x2866453e
	.word	0x3b4d1157
	.word	0x13bf9ed2
	.word	0x5027db75
	.word	0x23390527
	.word	0x9006d78a
	.word	0x855ba02e
t0_data_in_stacktop:
	.word	0
t0_data_in_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_in_area0, 0x0ce0c000)
.seg "data"
t0_data_in_area0_start:
.skip 7168
t0_data_in_area0_begin:
	.word	0xb048c341	! t0_data_in_area0-0x20
	.word	0x8210f0d1	! t0_data_in_area0-0x1c
	.word	0x5ed51caa	! t0_data_in_area0-0x18
	.word	0x7e28214d	! t0_data_in_area0-0x14
	.word	0x20bf9e31	! t0_data_in_area0-0x10
	.word	0x8b33943a	! t0_data_in_area0-0xc
	.word	0x0849d83c	! t0_data_in_area0-0x8
	.word	0x1eeaea8f	! t0_data_in_area0-0x4
.global t0_data_in_area0; t0_data_in_area0:
	.word	0x61078f28	! t0_data_in_area0+0x0
	.word	0x0c676614	! t0_data_in_area0+0x4
	.word	0x3e50c86e	! t0_data_in_area0+0x8
	.word	0x9a6d1d2c	! t0_data_in_area0+0xc
	.word	0xadc8f033	! t0_data_in_area0+0x10
	.word	0x0202b5d9	! t0_data_in_area0+0x14
	.word	0x61e0c8a0	! t0_data_in_area0+0x18
	.word	0xa767a167	! t0_data_in_area0+0x1c
t0_data_in_area0_end:
.skip 960
t0_data_in_area0_stop:

KDATA_MODULE(t0_module_data_in_shm_area, 0x00dc4000)
.seg "data"
t0_data_in_shm_area_start:
t0_data_in_shm_area_begin:
.global t0_data_in_shm_area; t0_data_in_shm_area:
	.word	0x5d76f6a6	! t0_data_in_shm_area+0x0 (t0)
	.word	0x70b2e723	! t0_data_in_shm_area+0x4 (t0)
	.word	0xc58d8c25	! t0_data_in_shm_area+0x8 (t0)
	.word	0xeb0bc403	! t0_data_in_shm_area+0xc (t0)
	.word	0xb8e0f585	! t0_data_in_shm_area+0x10 (t0)
	.word	0x092b8e39	! t0_data_in_shm_area+0x14 (t0)
	.word	0x6333c14a	! t0_data_in_shm_area+0x18 (t0)
	.word	0xba73b6f6	! t0_data_in_shm_area+0x1c (t0)
	.word	0x29aae226	! t0_data_in_shm_area+0x20 (t0)
	.word	0xb7d241ec	! t0_data_in_shm_area+0x24 (t0)
	.word	0xae15e096	! t0_data_in_shm_area+0x28 (t0)
	.word	0x7dcde95c	! t0_data_in_shm_area+0x2c (t0)
	.word	0x11b6ff14	! t0_data_in_shm_area+0x30 (t0)
	.word	0x8e7536a4	! t0_data_in_shm_area+0x34 (t0)
	.word	0x73602c53	! t0_data_in_shm_area+0x38 (t0)
	.word	0xe5d16aae	! t0_data_in_shm_area+0x3c (t0)
	.word	0xaac4d135	! t0_data_in_shm_area+0x40 (t0 bload)
	.word	0x0067f6b5	! t0_data_in_shm_area+0x44
	.word	0x056ea44d	! t0_data_in_shm_area+0x48
	.word	0xe238cd33	! t0_data_in_shm_area+0x4c
	.word	0xbb27c32e	! t0_data_in_shm_area+0x50
	.word	0x4342cbf7	! t0_data_in_shm_area+0x54
	.word	0x1297f1d9	! t0_data_in_shm_area+0x58
	.word	0x71e43bb5	! t0_data_in_shm_area+0x5c
	.word	0xedba1b05	! t0_data_in_shm_area+0x60
	.word	0xb536ae94	! t0_data_in_shm_area+0x64
	.word	0xa2ec9018	! t0_data_in_shm_area+0x68
	.word	0x821ab678	! t0_data_in_shm_area+0x6c
	.word	0x46572608	! t0_data_in_shm_area+0x70
	.word	0x66b0cd23	! t0_data_in_shm_area+0x74
	.word	0x6989b47c	! t0_data_in_shm_area+0x78
	.word	0xdd6dab67	! t0_data_in_shm_area+0x7c
	.word	0xbb71beed	! t0_data_in_shm_area+0x80 (t0 bstore)
	.word	0x9d2601f6	! t0_data_in_shm_area+0x84
	.word	0x4213bb8b	! t0_data_in_shm_area+0x88
	.word	0xd3415d90	! t0_data_in_shm_area+0x8c
	.word	0x0f0a923a	! t0_data_in_shm_area+0x90
	.word	0x398fc9af	! t0_data_in_shm_area+0x94
	.word	0xc1e41de3	! t0_data_in_shm_area+0x98
	.word	0xaa2fcfd2	! t0_data_in_shm_area+0x9c
	.word	0xd79bc4e6	! t0_data_in_shm_area+0xa0
	.word	0x13a98f19	! t0_data_in_shm_area+0xa4
	.word	0xe2b3317d	! t0_data_in_shm_area+0xa8
	.word	0xf0a326d5	! t0_data_in_shm_area+0xac
	.word	0x6ac5e140	! t0_data_in_shm_area+0xb0
	.word	0x5c966034	! t0_data_in_shm_area+0xb4
	.word	0x2a463b35	! t0_data_in_shm_area+0xb8
	.word	0x635fb639	! t0_data_in_shm_area+0xbc
t0_data_in_shm_area_end:
t0_data_in_shm_area_stop:

KDATA_MODULE(t0_module_data_exp_regs, 0x18d9a000)
.seg "data"
KGLOBAL(t0_data_exp_regs)
t0_data_exp_regs_start:
t0_data_exp_regs:
	.word	0xbfd5aa03          ! %f0
	.word	0x3147bec0          ! %f1
	.word	0x5679b22b          ! %f2
	.word	0x9d9e77c4          ! %f3
	.word	0xc1db77ab          ! %f4
	.word	0x1b1196ff          ! %f5
	.word	0xf25b3658          ! %f6
	.word	0xbbe320a4          ! %f7
	.word	0x027c908b          ! %f8
	.word	0x345fb29b          ! %f9
	.word	0x0f90b91f          ! %f10
	.word	0xec9f9d06          ! %f11
	.word	0x6531d868          ! %f12
	.word	0x28caffaa          ! %f13
	.word	0x89bcde53          ! %f14
	.word	0x36ac04ec          ! %f15
	.word	0xbb4a314d          ! %f16
	.word	0xdfd2e742          ! %f17
	.word	0x302e48ac          ! %f18
	.word	0xaecebc4e          ! %f19
	.word	0xaf4d129f          ! %f20
	.word	0xe80398f7          ! %f21
	.word	0xe2b658fe          ! %f22
	.word	0x0ae4943e          ! %f23
	.word	0x4006fd6e          ! %f24
	.word	0x21370aa2          ! %f25
	.word	0x35d02cad          ! %f26
	.word	0xba075a4d          ! %f27
	.word	0x95f8620d          ! %f28
	.word	0x3b7fb064          ! %f29
	.word	0x79948f5f          ! %f30
	.word	0xef837a2d          ! %f31
	.word	0x9854cae3          ! %f32
	.word	0xbbb830ea          ! %f33
	.word	0xed8ed3f4          ! %f34
	.word	0x88539597          ! %f35
	.word	0x6b496083          ! %f36
	.word	0x34a399f1          ! %f37
	.word	0xe451c8b2          ! %f38
	.word	0x3ce3366e          ! %f39
	.word	0xfd1f1afb          ! %f40
	.word	0x683dd90c          ! %f41
	.word	0x8beb3ac4          ! %f42
	.word	0x8947ff24          ! %f43
	.word	0x9c3e3469          ! %f44
	.word	0x38947ca5          ! %f45
	.word	0x9f47bce5          ! %f46
	.word	0x1f32fd5d          ! %f47
	.word	0xb25db0d2          ! %f48
	.word	0x1e7c0141          ! %f49
	.word	0x077fa558          ! %f50
	.word	0x74d202d1          ! %f51
	.word	0xba830f36          ! %f52
	.word	0x36f62f07          ! %f53
	.word	0x3621771b          ! %f54
	.word	0x24f32876          ! %f55
	.word	0x352377df          ! %f56
	.word	0x92624b82          ! %f57
	.word	0x021d2a5b          ! %f58
	.word	0xc53adfdd          ! %f59
	.word	0x30f8fbf9          ! %f60
	.word	0x02d823a5          ! %f61
	.word	0x0337082a          ! %f62
	.word	0xa95f36dc          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0x134       ! %g1 (code pointer)
	.word	t0_data_exp_shm_area! %g2 (shared area pointer)
	.word	0xff7014a0          ! %g3 (loop index)
	.word	SYM(t0_subr0)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0xfe97a807          ! %o0
	.word	0x510d4bec          ! %o1
	.word	0x1504e9a6          ! %o2
	.word	0xd66b0708          ! %o3
	.word	0x3e867e7b          ! %o4
	.word	0xd41ba4de          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0x3d33ba67          ! %l0
	.word	0x2d9b320f          ! %l1
	.word	0xb3200d6e          ! %l2
	.word	0xb461316c          ! %l3
	.word	0x9bd7fdd3          ! %l4
	.word	0x9ea36591          ! %l5
	.word	0x1abd091d          ! %l6
	.word	0xf4e75dd5          ! %l7
	.word	t0_data_exp_area0   ! %i0 (area pointer)
	.word	t0_data_exp_area0   ! %i1 (area pointer)
	.word	0xffffffff          ! %i2 (byte offset)
	.word	0x0000001e          ! %i3 (halfword offset)
	.word	0x00000000          ! %i4 (word offset)
	.word	0x00000018          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0x7a71edb2          ! %y
	.word	0x0000000b          ! %icc (nzvc)
	.word	0x40000e1b          ! %fsr
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
t0_data_exp_mtbl_size:	.word	253
t0_data_exp_regs_end:

.skip 7708	! page align

KDATA_MODULE(t0_module_data_exp_stack, 0x007a8000)
.seg "data"
KGLOBAL(t0_data_exp_mtbl_size)
KGLOBAL(t0_data_exp_mtbl)
KGLOBAL(t0_data_exp_stack)
t0_data_exp_stack_start:
	.word	0x89241542
	.word	0x1255c18c
	.word	0x99e287f4
	.word	0xd75ec179
	.word	0x7fbdc044
	.word	0xc5ddcfcc
	.word	0x898fed82
	.word	0xda7aa5a5
	.word	0x6c50cbbe
	.word	0x23fcdbde
	.word	0xcbf1cc17
	.word	0x3bf1ab82
	.word	0xb769b46d
	.word	0x96e84237
	.word	0x87c22986
	.word	0x5798d51f
	.word	0xfaf6a1e0
	.word	0x3b23e6bf
	.word	0x8dae5cc7
	.word	0xdc9d28e6
	.word	0xa5d5786e
	.word	0x4c1111b3
	.word	0x45cff30e
	.word	0x0e3d3321
	.word	0x12dc9669
	.word	0x5093b6cb
	.word	0xfd265219
	.word	0x85da9bc0
	.word	0xff95b093
	.word	0x5da28a9e
	.word	0x2057abc9
	.word	0x7668d459
	.word	0x966581d0
	.word	0x22f88a45
	.word	0x665516f4
	.word	0xfe0a226f
	.word	0xb452421d
	.word	0x3064d93f
	.word	0x5ae6e179
	.word	0x37fc89f6
	.word	0x0f4618c0
	.word	0x52a01994
	.word	0x0be36f94
	.word	0x030c5c16
	.word	0x35c9fdc1
	.word	0xcb5ca23c
	.word	0x55243c72
	.word	0x57da6e2f
	.word	0x9008be98
	.word	0xe3b937c0
	.word	0xbc71d008
	.word	0x62a03d1d
	.word	0x0ab11a27
	.word	0x30942b21
	.word	0x68d8be1f
	.word	0xadfc80bc
	.word	0x924927ea
	.word	0x3fb702f9
	.word	0x3d6702b3
	.word	0x9bf6f3ae
	.word	0x1ff47e6c
	.word	0x19b112e0
	.word	0xcf724f7e
	.word	0x4812535b
	.word	0xa2d1ccfc
	.word	0x80b9a511
	.word	0xf97d1ece
	.word	0x152fdc38
	.word	0x522bdca0
	.word	0x6f589a4c
	.word	0x66d99f9f
	.word	0x7c77c64c
	.word	0xe8052c4a
	.word	0x8c1ea3fd
	.word	0x2e86cee5
	.word	0xd3ae85f0
	.word	0x58449c49
	.word	0xf0a47c9d
	.word	0x8eb55228
	.word	0x5996d4d6
	.word	0xf23cdd02
	.word	0x439ac257
	.word	0x0b26e756
	.word	0xd27cc74b
	.word	0x8faf94df
	.word	0x262a57ef
	.word	0xa0747dd4
	.word	0xce0671c0
	.word	0xd1087186
	.word	0xde7f6fdf
	.word	0xca744cd5
	.word	0x862ae286
	.word	0x299b984e
	.word	0xea57a5c2
	.word	0xb5ba7aef
	.word	0x5df873d8
	.word	0x1b7629ee
	.word	0x4f0dc9f5
	.word	0xe0c42aeb
	.word	0xd9dfba1e
	.word	0xe006cd77
	.word	0x8724437b
	.word	0x8a0601dc
	.word	0x7ac89270
	.word	0x74cf7683
	.word	0x71f92c21
	.word	0xba147a72
	.word	0xf58b1558
	.word	0xa8b0daae
	.word	0xa75d8ae2
	.word	0x45ad998f
	.word	0x99be71db
	.word	0x1a734a45
	.word	0xa87b508c
	.word	0x5fd0d81b
	.word	0x696bf4ba
	.word	0xd337e03d
	.word	0x200bfaa3
	.word	0xe98b5614
	.word	0xf754bff5
	.word	0x32b83d66
	.word	0x679c0084
	.word	0x98ebaae8
	.word	0xef5cf690
	.word	0x9eea42e0
	.word	0xe4b56ecd
	.word	0xe3f1e706
	.word	0x8c976099
	.word	0xe8007fcd
	.word	0x398e54fc
	.word	0xbc859ab2
	.word	0xce98cb68
	.word	0x9c174648
	.word	0x4f7de955
	.word	0x10c4f618
	.word	0x1c6aaa28
	.word	0xd6699b94
	.word	0xa8458709
	.word	0x7c9d56a4
	.word	0x12e8ba96
	.word	0x1be87798
	.word	0x4468ea94
	.word	0x07ced590
	.word	0x66cdb208
	.word	0xf5c2078b
	.word	0x8aa35066
	.word	0x6381abbe
	.word	0x346f36b1
	.word	0x890de7eb
	.word	0x9d3d59c5
	.word	0x25ad7ec7
	.word	0x8069a923
	.word	0xf4ae89b3
	.word	0x37e1dbf1
	.word	0x9bffeb53
	.word	0x81808214
	.word	0xc2c736cc
	.word	0xb9cdfd88
	.word	0x2cf0e0aa
	.word	0x05004864
	.word	0xed2969c3
	.word	0x371b462c
	.word	0xe188a18b
	.word	0x983b635e
	.word	0x7b136cbb
	.word	0x06a88462
	.word	0xb6447e3c
	.word	0x5b8b4d3e
t0_data_exp_sp:
	.word	0x75c573a5
	.word	0x1b10adbd
	.word	0x22c49be2
	.word	0x81d3e9f2
	.word	0x2811a5af
	.word	0xca6d1d3b
	.word	0xe7be5d12
	.word	0x8b1f0624
	.word	t0_data_exp_area0
	.word	t0_data_exp_area0
	.word	0x00000011
	.word	0xfffffffc
	.word	0xffffffe4
	.word	0x00000000
	.word	t0_data_exp_fp
	.word	0x90509fde
	.word	0x14ad43d5
	.word	0x2fe1ef12
	.word	0x92238892
	.word	0x302e4d2d
	.word	0x7eb3307e
	.word	0xdf479b5a
	.word	0xd56aa0b8
	.word	0x148b457c
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
	.word   	0xf88048c4	! [%fp - 0xc]
	.word   	0xf7ab5e03	! [%fp - 0x8]
	.word   	0x0c1e36f6	! [%fp - 0x4]
t0_data_exp_fp:
	.word	0x85fd418d
	.word	0x3f7a46de
	.word	0xbbfb1948
	.word	0x743d5a7a
	.word	0xadb5f129
	.word	0x38a1b02f
	.word	0xae1b3f78
	.word	0xc6ac0ade
	.word	0x9cc0bd44
	.word	0xb379d694
	.word	0x0e50dbb5
	.word	0xc7e90b9b
	.word	0xcc58085e
	.word	0xba5f1afd
	.word	0x483ce2f7
	.word	0xa188fabb
	.word	0xd3a3912b
	.word	0x2866453e
	.word	0x3b4d1157
	.word	0x13bf9ed2
	.word	0x5027db75
	.word	0x23390527
	.word	0x9006d78a
	.word	0x855ba02e
t0_data_exp_stacktop:
	.word	0
t0_data_exp_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_exp_area0, 0x74a58000)
.seg "data"
t0_data_exp_area0_start:
.skip 7168
t0_data_exp_area0_begin:
	.word	0xb048c341	! t0_data_exp_area0-0x20
	.word	0x8210f0d1	! t0_data_exp_area0-0x1c
	.word	0x5ed51caa	! t0_data_exp_area0-0x18
	.word	0x7e28214d	! t0_data_exp_area0-0x14
	.word	0x20bf9e31	! t0_data_exp_area0-0x10
	.word	0x8b33943a	! t0_data_exp_area0-0xc
	.word	0x0849d83c	! t0_data_exp_area0-0x8
	.word	0x1eeaea8f	! t0_data_exp_area0-0x4
.global t0_data_exp_area0; t0_data_exp_area0:
	.word	0x61078f28	! t0_data_exp_area0+0x0
	.word	0x0c676614	! t0_data_exp_area0+0x4
	.word	0x3e50c86e	! t0_data_exp_area0+0x8
	.word	0x9a6d1d2c	! t0_data_exp_area0+0xc
	.word	0xadc8f033	! t0_data_exp_area0+0x10
	.word	0x0202b5d9	! t0_data_exp_area0+0x14
	.word	0x61e0c8a0	! t0_data_exp_area0+0x18
	.word	0xa767a167	! t0_data_exp_area0+0x1c
t0_data_exp_area0_end:
.skip 960
t0_data_exp_area0_stop:

KDATA_MODULE(t0_module_data_exp_shm_area, 0x31bf0000)
.seg "data"
t0_data_exp_shm_area_start:
t0_data_exp_shm_area_begin:
.global t0_data_exp_shm_area; t0_data_exp_shm_area:
	.word	0x5d76f6a6	! t0_data_exp_shm_area+0x0 (t0)
	.word	0x70b2e723	! t0_data_exp_shm_area+0x4 (t0)
	.word	0xc58d8c25	! t0_data_exp_shm_area+0x8 (t0)
	.word	0xeb0bc403	! t0_data_exp_shm_area+0xc (t0)
	.word	0xb8e0f585	! t0_data_exp_shm_area+0x10 (t0)
	.word	0x092b8e39	! t0_data_exp_shm_area+0x14 (t0)
	.word	0x6333c14a	! t0_data_exp_shm_area+0x18 (t0)
	.word	0xba73b6f6	! t0_data_exp_shm_area+0x1c (t0)
	.word	0x29aae226	! t0_data_exp_shm_area+0x20 (t0)
	.word	0xb7d241ec	! t0_data_exp_shm_area+0x24 (t0)
	.word	0xae15e096	! t0_data_exp_shm_area+0x28 (t0)
	.word	0x7dcde95c	! t0_data_exp_shm_area+0x2c (t0)
	.word	0x11b6ff14	! t0_data_exp_shm_area+0x30 (t0)
	.word	0x8e7536a4	! t0_data_exp_shm_area+0x34 (t0)
	.word	0x73602c53	! t0_data_exp_shm_area+0x38 (t0)
	.word	0xe5d16aae	! t0_data_exp_shm_area+0x3c (t0)
	.word	0xaac4d135	! t0_data_exp_shm_area+0x40 (t0 bload)
	.word	0x0067f6b5	! t0_data_exp_shm_area+0x44
	.word	0x056ea44d	! t0_data_exp_shm_area+0x48
	.word	0xe238cd33	! t0_data_exp_shm_area+0x4c
	.word	0xbb27c32e	! t0_data_exp_shm_area+0x50
	.word	0x4342cbf7	! t0_data_exp_shm_area+0x54
	.word	0x1297f1d9	! t0_data_exp_shm_area+0x58
	.word	0x71e43bb5	! t0_data_exp_shm_area+0x5c
	.word	0xedba1b05	! t0_data_exp_shm_area+0x60
	.word	0xb536ae94	! t0_data_exp_shm_area+0x64
	.word	0xa2ec9018	! t0_data_exp_shm_area+0x68
	.word	0x821ab678	! t0_data_exp_shm_area+0x6c
	.word	0x46572608	! t0_data_exp_shm_area+0x70
	.word	0x66b0cd23	! t0_data_exp_shm_area+0x74
	.word	0x6989b47c	! t0_data_exp_shm_area+0x78
	.word	0xdd6dab67	! t0_data_exp_shm_area+0x7c
	.word	0xbb71beed	! t0_data_exp_shm_area+0x80 (t0 bstore)
	.word	0x9d2601f6	! t0_data_exp_shm_area+0x84
	.word	0x4213bb8b	! t0_data_exp_shm_area+0x88
	.word	0xd3415d90	! t0_data_exp_shm_area+0x8c
	.word	0x0f0a923a	! t0_data_exp_shm_area+0x90
	.word	0x398fc9af	! t0_data_exp_shm_area+0x94
	.word	0xc1e41de3	! t0_data_exp_shm_area+0x98
	.word	0xaa2fcfd2	! t0_data_exp_shm_area+0x9c
	.word	0xd79bc4e6	! t0_data_exp_shm_area+0xa0
	.word	0x13a98f19	! t0_data_exp_shm_area+0xa4
	.word	0xe2b3317d	! t0_data_exp_shm_area+0xa8
	.word	0xf0a326d5	! t0_data_exp_shm_area+0xac
	.word	0x6ac5e140	! t0_data_exp_shm_area+0xb0
	.word	0x5c966034	! t0_data_exp_shm_area+0xb4
	.word	0x2a463b35	! t0_data_exp_shm_area+0xb8
	.word	0x635fb639	! t0_data_exp_shm_area+0xbc
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



