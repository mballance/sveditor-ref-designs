/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: kaos_02_06_2004_71.s
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
#define T0_KAOS_SEED          d2b2ca91e25c
#define T0_KAOS_ICOUNT        4000
#define T0_KAOS_AREAS         1
#define T0_KAOS_AREASIZE      64
#define T0_KAOS_AREAOFFSET    5888
#define T0_KAOS_PAGESIZE      8192
#define T0_KAOS_CODECOUNT     4005

#define T0_KAOS_BOOT_VA                  0x3bae2000
#define T0_KAOS_BOOT_PA                  0x0000000001fe0000
#define T0_KAOS_BOOT_CACHEABLE           1
#define T0_KAOS_BOOT_NONCACHEABLE        0

#define T0_KAOS_STARTUP_VA               0x4b640000
#define T0_KAOS_STARTUP_PA               0x00000000037c4000
#define T0_KAOS_STARTUP_CACHEABLE        1
#define T0_KAOS_STARTUP_NONCACHEABLE     0

#define T0_KAOS_OFFSET_TBL_VA            0x1bcce000
#define T0_KAOS_OFFSET_TBL_PA            0x00000000050dc000
#define T0_KAOS_OFFSET_TBL_CACHEABLE     1
#define T0_KAOS_OFFSET_TBL_NONCACHEABLE  0

#define T0_KAOS_DONE_VA                  0x1ba9a000
#define T0_KAOS_DONE_PA                  0x0000000006aae000
#define T0_KAOS_DONE_CACHEABLE           1
#define T0_KAOS_DONE_NONCACHEABLE        0

#define T0_KAOS_KTBL_VA                  0x669e8000
#define T0_KAOS_KTBL_PA                  0x0000000008118000
#define T0_KAOS_KTBL_CACHEABLE           1
#define T0_KAOS_KTBL_NONCACHEABLE        0

#define T0_KAOS_SUBR0_VA                 0x7909a000
#define T0_KAOS_SUBR0_PA                 0x000000000a25c000
#define T0_KAOS_SUBR0_CACHEABLE          1
#define T0_KAOS_SUBR0_NONCACHEABLE       0
#define T0_KAOS_SUBR1_VA                 0x66aee000
#define T0_KAOS_SUBR1_PA                 0x000000000c7fe000
#define T0_KAOS_SUBR1_CACHEABLE          1
#define T0_KAOS_SUBR1_NONCACHEABLE       0
#define T0_KAOS_SUBR2_VA                 0x3f6ea000
#define T0_KAOS_SUBR2_PA                 0x000000000e8e4000
#define T0_KAOS_SUBR2_CACHEABLE          1
#define T0_KAOS_SUBR2_NONCACHEABLE       0
#define T0_KAOS_SUBR3_VA                 0x66a78000
#define T0_KAOS_SUBR3_PA                 0x0000000010d90000
#define T0_KAOS_SUBR3_CACHEABLE          1
#define T0_KAOS_SUBR3_NONCACHEABLE       0

#define T0_KAOS_EXP_REGS_VA              0x29d8c000
#define T0_KAOS_EXP_REGS_PA              0x0000000013b0c000
#define T0_KAOS_EXP_REGS_CACHEABLE       1
#define T0_KAOS_EXP_REGS_NONCACHEABLE    0
#define T0_KAOS_RUN_REGS_VA              0x3326e000
#define T0_KAOS_RUN_REGS_PA              0x0000000015b4a000
#define T0_KAOS_RUN_REGS_CACHEABLE       1
#define T0_KAOS_RUN_REGS_NONCACHEABLE    0

#define T0_KAOS_EXP_STACK_VA             0x4a92c000
#define T0_KAOS_EXP_STACK_PA             0x00000000165bc000
#define T0_KAOS_EXP_STACK_CACHEABLE      1
#define T0_KAOS_EXP_STACK_NONCACHEABLE   0
#define T0_KAOS_RUN_STACK_VA             0x73f9c000
#define T0_KAOS_RUN_STACK_PA             0x0000000019682000
#define T0_KAOS_RUN_STACK_CACHEABLE      1
#define T0_KAOS_RUN_STACK_NONCACHEABLE   0

#define T0_KAOS_AREA0
#define T0_KAOS_EXP_AREA0_VA             0x13c86000
#define T0_KAOS_EXP_AREA0_PA             0x000000001be64000
#define T0_KAOS_EXP_AREA0_CACHEABLE      1
#define T0_KAOS_EXP_AREA0_NONCACHEABLE   0
#define T0_KAOS_RUN_AREA0_VA             0x53032000
#define T0_KAOS_RUN_AREA0_PA             0x000000001cb96000
#define T0_KAOS_RUN_AREA0_CACHEABLE      1
#define T0_KAOS_RUN_AREA0_NONCACHEABLE   0

#define T0_KAOS_SHM_AREA
#define T0_KAOS_EXP_SHM_AREA_VA          0x7ac20000
#define T0_KAOS_EXP_SHM_AREA_PA          0x00000000013a0000
#define T0_KAOS_EXP_SHM_AREA_CACHEABLE   1
#define T0_KAOS_EXP_SHM_AREA_NONCACHEABLE 0
#define T0_KAOS_RUN_SHM_AREA_VA          0x55d84000
#define T0_KAOS_RUN_SHM_AREA_PA          0x00000000018e4000
#define T0_KAOS_RUN_SHM_AREA_CACHEABLE   1
#define T0_KAOS_RUN_SHM_AREA_NONCACHEABLE 0

#define T0_KAOS_RANVAL_00     0xdd2f4a8f
#define T0_KAOS_RANVAL_01     0x0fd75dac
#define T0_KAOS_RANVAL_02     0x7d760d5e
#define T0_KAOS_RANVAL_03     0xe2b9b05c
#define T0_KAOS_RANVAL_04     0xe35e8c2e
#define T0_KAOS_RANVAL_05     0xace0190a
#define T0_KAOS_RANVAL_06     0x577758e3
#define T0_KAOS_RANVAL_07     0xc8910577
#define T0_KAOS_RANVAL_08     0x009beced
#define T0_KAOS_RANVAL_09     0xe379f726
#define T0_KAOS_RANVAL_0a     0x9e159e25
#define T0_KAOS_RANVAL_0b     0x9516a38d
#define T0_KAOS_RANVAL_0c     0x933ccffb
#define T0_KAOS_RANVAL_0d     0x3bdaef05
#define T0_KAOS_RANVAL_0e     0x23ede23a
#define T0_KAOS_RANVAL_0f     0xdc347e37
#define T0_KAOS_RANVAL_10     0xd91eb3e4
#define T0_KAOS_RANVAL_11     0x0b3965dd
#define T0_KAOS_RANVAL_12     0x8f7a07f9
#define T0_KAOS_RANVAL_13     0x5be7c6fe
#define T0_KAOS_RANVAL_14     0x37178326
#define T0_KAOS_RANVAL_15     0x6773761e
#define T0_KAOS_RANVAL_16     0x52c7a4ac
#define T0_KAOS_RANVAL_17     0xe62335fa
#define T0_KAOS_RANVAL_18     0x4ac1da04
#define T0_KAOS_RANVAL_19     0x793522b6
#define T0_KAOS_RANVAL_1a     0x327aec04
#define T0_KAOS_RANVAL_1b     0x99fab8bc
#define T0_KAOS_RANVAL_1c     0x73675599
#define T0_KAOS_RANVAL_1d     0x8937fa91
#define T0_KAOS_RANVAL_1e     0x4c7fe74d
#define T0_KAOS_RANVAL_1f     0xf0a0ab6d
#define T0_KAOS_RANVAL_20     0xc058402f
#define T0_KAOS_RANVAL_21     0xf5daf05f
#define T0_KAOS_RANVAL_22     0xf63b6be2
#define T0_KAOS_RANVAL_23     0x209b0036
#define T0_KAOS_RANVAL_24     0xf8212ed1
#define T0_KAOS_RANVAL_25     0x0cf96a99
#define T0_KAOS_RANVAL_26     0xf13084e2
#define T0_KAOS_RANVAL_27     0xaf18f8e2
#define T0_KAOS_RANVAL_28     0xda04641e
#define T0_KAOS_RANVAL_29     0xeed4cfc4
#define T0_KAOS_RANVAL_2a     0x23264423
#define T0_KAOS_RANVAL_2b     0x0ab856c2
#define T0_KAOS_RANVAL_2c     0x0b260c5f
#define T0_KAOS_RANVAL_2d     0x025412f7
#define T0_KAOS_RANVAL_2e     0x2f252e66
#define T0_KAOS_RANVAL_2f     0x369324d1
#define T0_KAOS_RANVAL_30     0xe037a6dc
#define T0_KAOS_RANVAL_31     0xc511049b
#define T0_KAOS_RANVAL_32     0x6e62b6cc
#define T0_KAOS_RANVAL_33     0xbe5d8017
#define T0_KAOS_RANVAL_34     0x8460306b
#define T0_KAOS_RANVAL_35     0x8ae36b72
#define T0_KAOS_RANVAL_36     0xfea47d89
#define T0_KAOS_RANVAL_37     0xe6ed0251
#define T0_KAOS_RANVAL_38     0xd3e3e349
#define T0_KAOS_RANVAL_39     0xfd1629da
#define T0_KAOS_RANVAL_3a     0xfe0c45d6
#define T0_KAOS_RANVAL_3b     0xb7f9b2d1
#define T0_KAOS_RANVAL_3c     0xa5e7a02c
#define T0_KAOS_RANVAL_3d     0x4972f351
#define T0_KAOS_RANVAL_3e     0xe5d8d72c
#define T0_KAOS_RANVAL_3f     0x9e82a1a3
#define T0_KAOS_RANVAL_40     0x91d95498
#define T0_KAOS_RANVAL_41     0x2915563b
#define T0_KAOS_RANVAL_42     0x05b73dae
#define T0_KAOS_RANVAL_43     0xf13e90f1
#define T0_KAOS_RANVAL_44     0x6bc7f271
#define T0_KAOS_RANVAL_45     0x6ebe1de3
#define T0_KAOS_RANVAL_46     0xdb031de6
#define T0_KAOS_RANVAL_47     0x242350a8
#define T0_KAOS_RANVAL_48     0x848accd1
#define T0_KAOS_RANVAL_49     0x206c50bf
#define T0_KAOS_RANVAL_4a     0xca0c0fb3
#define T0_KAOS_RANVAL_4b     0x6b94b05a
#define T0_KAOS_RANVAL_4c     0x08416e1b
#define T0_KAOS_RANVAL_4d     0x40914ef7
#define T0_KAOS_RANVAL_4e     0x36613482
#define T0_KAOS_RANVAL_4f     0x8d762b65
#define T0_KAOS_RANVAL_50     0xccb23b50
#define T0_KAOS_RANVAL_51     0x1c89d528
#define T0_KAOS_RANVAL_52     0x29837cbc
#define T0_KAOS_RANVAL_53     0xa468b355
#define T0_KAOS_RANVAL_54     0x429f78a0
#define T0_KAOS_RANVAL_55     0x005de764
#define T0_KAOS_RANVAL_56     0x6872507f
#define T0_KAOS_RANVAL_57     0x4a303c86
#define T0_KAOS_RANVAL_58     0x9e8f8344
#define T0_KAOS_RANVAL_59     0x9f65e87d
#define T0_KAOS_RANVAL_5a     0xbf8d8f8f
#define T0_KAOS_RANVAL_5b     0x7fd2f10e
#define T0_KAOS_RANVAL_5c     0x57fe548a
#define T0_KAOS_RANVAL_5d     0xe6936183
#define T0_KAOS_RANVAL_5e     0x54831c8e
#define T0_KAOS_RANVAL_5f     0x66be2dd9
#define T0_KAOS_RANVAL_60     0xcebba231
#define T0_KAOS_RANVAL_61     0x9c003d8a
#define T0_KAOS_RANVAL_62     0x56ad676b
#define T0_KAOS_RANVAL_63     0x845bae14
#define T0_KAOS_RANVAL_64     0xce9a2ff6
#define T0_KAOS_RANVAL_65     0x804f7daf
#define T0_KAOS_RANVAL_66     0x82abab18
#define T0_KAOS_RANVAL_67     0x8b4388cf
#define T0_KAOS_RANVAL_68     0x2eca266e
#define T0_KAOS_RANVAL_69     0x3596a95d
#define T0_KAOS_RANVAL_6a     0xa553d27f
#define T0_KAOS_RANVAL_6b     0x18dde4dd
#define T0_KAOS_RANVAL_6c     0x65818316
#define T0_KAOS_RANVAL_6d     0x1d377ecc
#define T0_KAOS_RANVAL_6e     0xd7a938b6
#define T0_KAOS_RANVAL_6f     0x361186fe
#define T0_KAOS_RANVAL_70     0x6732f5a8
#define T0_KAOS_RANVAL_71     0x8e85a7ca
#define T0_KAOS_RANVAL_72     0x4082b870
#define T0_KAOS_RANVAL_73     0xd3ca9e40
#define T0_KAOS_RANVAL_74     0xebc4beaf
#define T0_KAOS_RANVAL_75     0x238c76be
#define T0_KAOS_RANVAL_76     0x243dbeb7
#define T0_KAOS_RANVAL_77     0xb2f772a1
#define T0_KAOS_RANVAL_78     0x713e635d
#define T0_KAOS_RANVAL_79     0x8c04efe8
#define T0_KAOS_RANVAL_7a     0x468354d7
#define T0_KAOS_RANVAL_7b     0xd14ed9f9
#define T0_KAOS_RANVAL_7c     0x537d4a9c
#define T0_KAOS_RANVAL_7d     0x10cca2ed
#define T0_KAOS_RANVAL_7e     0xa8ff559d
#define T0_KAOS_RANVAL_7f     0x5b0e9716
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
!    icount         4000
!    targetid       NIAGARA:SIM
!    hostid         NIAGARA:5.8
!    areas          1
!    areasize       64
!    areaoffset     5888
!    ncache         0
!    emulate_ncache 1
!    pagesize       8192
!    invsize        0
!    codecount      4005
!    code           669e8000
!    entry          669e8000
!    fsr_exceptions 00000000
!    fsr_roundmode  00000004
!    fsr_mask       c0000fff
!    seed           d2b2ca91e25c
!    va_map         0000000000400000,000000007fffffff
!    pa_cached      0000000000400000,000000007fffffff
!    pa_noncached   000001ff00000000,000001ff7fffffff
!    weights        /import/n2-aus-localdir1/ntran/n2cdmspp/verif/diag/assembly/kaos/weights_files/allv9_n2.w
!    begcount       0
!    endcount       4000
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

KTEXT_MODULE(t0_module_ktbl, 0x669e8000)
.seg "text"
	KGLOBAL(t0_ktbl)
t0_ktbl_page_begin:
.global t0_kref; t0_kref:
	.skip 0
t0_ktbl:
	.word	0x9685b697	! t0_kref+0x0:   	addcc	%l6, -0x969, %o3
	.word	0x81834000	! t0_kref+0x4:   	wr	%o5, %g0, %y
	.word	0x39480005	! t0_kref+0x8:   	fbuge,a,pt	%fcc0, _kref+0x1c
	.word	0x94c50013	! t0_kref+0xc:   	addccc	%l4, %l3, %o2
	.word	0xb3b44ea0	! t0_kref+0x10:   	fsrc1s	%f17, %f25
	.word	0x96bd4009	! t0_kref+0x14:   	xnorcc	%l5, %o1, %o3
	.word	0x26800007	! t0_kref+0x18:   	bl,a	_kref+0x34
	.word	0xb9b34d60	! t0_kref+0x1c:   	fnot1s	%f13, %f28
	.word	0x9a656bbd	! t0_kref+0x20:   	subc	%l5, 0xbbd, %o5
	.word	0x90bdc016	! t0_kref+0x24:   	xnorcc	%l7, %l6, %o0
	.word	0xf4266014	! t0_kref+0x28:   	st	%i2, [%i1 + 0x14]
	.word	0x905b0014	! t0_kref+0x2c:   	smul	%o4, %l4, %o0
	.word	0x32480007	! t0_kref+0x30:   	bne,a,pt	%icc, _kref+0x4c
	.word	0xd84e7ffc	! t0_kref+0x34:   	ldsb	[%i1 - 4], %o4
	.word	0x80646962	! t0_kref+0x38:   	subc	%l1, 0x962, %g0
	.word	0xe8263ffc	! t0_kref+0x3c:   	st	%l4, [%i0 - 4]
	.word	0x83a00538	! t0_kref+0x40:   	fsqrts	%f24, %f1
	.word	0x95a00558	! t0_kref+0x44:   	fsqrtd	%f24, %f10
	.word	0x21480007	! t0_kref+0x48:   	fbn,a,pt	%fcc0, _kref+0x64
	.word	0x97408000	! t0_kref+0x4c:   	mov	%ccr, %o3
	.word	0x3b800002	! t0_kref+0x50:   	fble,a	_kref+0x58
	.word	0x908b0010	! t0_kref+0x54:   	andcc	%o4, %l0, %o0
	.word	0x9bb2c30a	! t0_kref+0x58:   	alignaddr	%o3, %o2, %o5
	.word	0xd60e7ffd	! t0_kref+0x5c:   	ldub	[%i1 - 3], %o3
	.word	0x81850000	! t0_kref+0x60:   	wr	%l4, %g0, %y
	.word	0x80b34010	! t0_kref+0x64:   	orncc	%o5, %l0, %g0
	.word	0xec3e7fe0	! t0_kref+0x68:   	std	%l6, [%i1 - 0x20]
	.word	0xe9e6500b	! t0_kref+0x6c:   	casa	[%i1]0x80, %o3, %l4
	.word	0xe8ee101a	! t0_kref+0x70:   	ldstuba	[%i0 + %i2]0x80, %l4
	.word	0x34480002	! t0_kref+0x74:   	bg,a,pt	%icc, _kref+0x7c
	.word	0xa5a00550	! t0_kref+0x78:   	fsqrtd	%f16, %f18
	.word	0x9f25bcf6	! t0_kref+0x7c:   	mulscc	%l6, -0x30a, %o7
	.word	0x9bb30033	! t0_kref+0x80:   	edge8n	%o4, %l3, %o5
	.word	0x80a5c010	! t0_kref+0x84:   	cmp	%l7, %l0
	.word	0x2e480008	! t0_kref+0x88:   	bvs,a,pt	%icc, _kref+0xa8
	.word	0xa1a549ac	! t0_kref+0x8c:   	fdivs	%f21, %f12, %f16
	.word	0x94828017	! t0_kref+0x90:   	addcc	%o2, %l7, %o2
	.word	0x38800005	! t0_kref+0x94:   	bgu,a	_kref+0xa8
	.word	0xdd063fe8	! t0_kref+0x98:   	ld	[%i0 - 0x18], %f14
	.word	0x9484ad10	! t0_kref+0x9c:   	addcc	%l2, 0xd10, %o2
	.word	0x95b5c055	! t0_kref+0xa0:   	edge8l	%l7, %l5, %o2
	.word	0x94bc4000	! t0_kref+0xa4:   	xnorcc	%l1, %g0, %o2
	.word	0xa1a018d6	! t0_kref+0xa8:   	fdtos	%f22, %f16
	.word	0xadb28e80	! t0_kref+0xac:   	fsrc1	%f10, %f22
	.word	0xc368a081	! t0_kref+0xb0:   	prefetch	%g2 + 0x81, 1
	.word	0xc031401b	! t0_kref+0xb4:   	clrh	[%g5 + %i3]
	.word	0x21800005	! t0_kref+0xb8:   	fbn,a	_kref+0xcc
	.word	0x81840000	! t0_kref+0xbc:   	wr	%l0, %g0, %y
	.word	0xd80e8019	! t0_kref+0xc0:   	ldub	[%i2 + %i1], %o4
	.word	0xafb48097	! t0_kref+0xc4:   	edge16	%l2, %l7, %l7
	.word	0x2e480007	! t0_kref+0xc8:   	bvs,a,pt	%icc, _kref+0xe4
	.word	0xf4267ff8	! t0_kref+0xcc:   	st	%i2, [%i1 - 8]
	.word	0xf1be188d	! t0_kref+0xd0:   	stda	%f24, [%i0 + %o5]0xc4
	.word	0xa5b00cc6	! t0_kref+0xd4:   	fnot2	%f6, %f18
	.word	0x36480006	! t0_kref+0xd8:   	bge,a,pt	%icc, _kref+0xf0
	.word	0xe968a04f	! t0_kref+0xdc:   	prefetch	%g2 + 0x4f, 20
	.word	0x9efb4010	! t0_kref+0xe0:   	sdivcc	%o5, %l0, %o7
	.word	0x8143e012	! t0_kref+0xe4:   	membar	0x12
	.word	0x36800004	! t0_kref+0xe8:   	bge,a	_kref+0xf8
	.word	0xa7a449a5	! t0_kref+0xec:   	fdivs	%f17, %f5, %f19
	.word	0x2a800001	! t0_kref+0xf0:   	bcs,a	_kref+0xf4
	.word	0xa1b007a4	! t0_kref+0xf4:   	fpackfix	%f4, %f16
	.word	0xa5b686dc	! t0_kref+0xf8:   	fmul8sux16	%f26, %f28, %f18
	.word	0xd6861000	! t0_kref+0xfc:   	lda	[%i0]0x80, %o3
	.word	0xae2d4013	! t0_kref+0x100:   	andn	%l5, %l3, %l7
	.word	0xb1b406b8	! t0_kref+0x104:   	fmul8x16al	%f16, %f24, %f24
	.word	0x95b20312	! t0_kref+0x108:   	alignaddr	%o0, %l2, %o2
	.word	0xeb6e3fe8	! t0_kref+0x10c:   	prefetch	%i0 - 0x18, 21
	.word	0x3d800003	! t0_kref+0x110:   	fbule,a	_kref+0x11c
	.word	0x9a9a8015	! t0_kref+0x114:   	xorcc	%o2, %l5, %o5
	.word	0x905c8010	! t0_kref+0x118:   	smul	%l2, %l0, %o0
	.word	0x909d800c	! t0_kref+0x11c:   	xorcc	%l6, %o4, %o0
	.word	0xf007bfe0	! t0_kref+0x120:   	ld	[%fp - 0x20], %i0
	.word	0x9bb3055a	! t0_kref+0x124:   	fcmpeq16	%f12, %f26, %o5
	.word	0x2b480005	! t0_kref+0x128:   	fbug,a,pt	%fcc0, _kref+0x13c
	.word	0x95b680b0	! t0_kref+0x12c:   	edge16n	%i2, %l0, %o2
	.word	0x22800006	! t0_kref+0x130:   	be,a	_kref+0x148
	.word	0xc7267ff4	! t0_kref+0x134:   	st	%f3, [%i1 - 0xc]
	.word	0x36480003	! t0_kref+0x138:   	bge,a,pt	%icc, _kref+0x144
	.word	0x9e2d8011	! t0_kref+0x13c:   	andn	%l6, %l1, %o7
	.word	0xb5a00130	! t0_kref+0x140:   	fabss	%f16, %f26
	.word	0x91702a5d	! t0_kref+0x144:   	popc	0xa5d, %o0
	.word	0xa5a00542	! t0_kref+0x148:   	fsqrtd	%f2, %f18
	.word	0x9e282ad3	! t0_kref+0x14c:   	andn	%g0, 0xad3, %o7
	.word	0x9eb4f736	! t0_kref+0x150:   	orncc	%l3, -0x8ca, %o7
	.word	0xd228a03f	! t0_kref+0x154:   	stb	%o1, [%g2 + 0x3f]
	.word	0xdbe61016	! t0_kref+0x158:   	casa	[%i0]0x80, %l6, %o5
	.word	0xd250a022	! t0_kref+0x15c:   	ldsh	[%g2 + 0x22], %o1
	.word	0xc807bfe4	! t0_kref+0x160:   	ld	[%fp - 0x1c], %g4
	.word	0x907c7eed	! t0_kref+0x164:   	sdiv	%l1, -0x113, %o0
	.word	0x9f2ce010	! t0_kref+0x168:   	sll	%l3, 0x10, %o7
	.word	0xb9a589c8	! t0_kref+0x16c:   	fdivd	%f22, %f8, %f28
	.word	0x37800008	! t0_kref+0x170:   	fbge,a	_kref+0x190
	.word	0x9472800c	! t0_kref+0x174:   	udiv	%o2, %o4, %o2
	.word	0xb5b00f27	! t0_kref+0x178:   	fsrc2s	%f7, %f26
	.word	0xd8166012	! t0_kref+0x17c:   	lduh	[%i1 + 0x12], %o4
	.word	0xec767ff0	! t0_kref+0x180:   	stx	%l6, [%i1 - 0x10]
	.word	0x94b28000	! t0_kref+0x184:   	orncc	%o2, %g0, %o2
	.word	0x90da8013	! t0_kref+0x188:   	smulcc	%o2, %l3, %o0
	.word	0x81de800a	! t0_kref+0x18c:   	flush	%i2 + %o2
	.word	0xa7a01a58	! t0_kref+0x190:   	fdtoi	%f24, %f19
	.word	0x9ae22e92	! t0_kref+0x194:   	subccc	%o0, 0xe92, %o5
	.word	0x9916b4bd	! t0_kref+0x198:   	taddcctv	%i2, -0xb43, %o4
	.word	0x9ebd400d	! t0_kref+0x19c:   	xnorcc	%l5, %o5, %o7
	.word	0x9294400a	! t0_kref+0x1a0:   	orcc	%l1, %o2, %o1
	.word	0xf42e2006	! t0_kref+0x1a4:   	stb	%i2, [%i0 + 6]
	.word	0x80132baa	! t0_kref+0x1a8:   	or	%o4, 0xbaa, %g0
	.word	0x3c480005	! t0_kref+0x1ac:   	bpos,a,pt	%icc, _kref+0x1c0
	.word	0xd47e001c	! t0_kref+0x1b0:   	swap	[%i0 + %i4], %o2
	.word	0x81df801b	! t0_kref+0x1b4:   	flush	%fp + %i3
	.word	0xb9a01922	! t0_kref+0x1b8:   	fstod	%f2, %f28
	.word	0xec1e3ff8	! t0_kref+0x1bc:   	ldd	[%i0 - 8], %l6
	.word	0x81ae0a46	! t0_kref+0x1c0:   	fcmpd	%fcc0, %f24, %f6
	.word	0xcd1fbd00	! t0_kref+0x1c4:   	ldd	[%fp - 0x300], %f6
	.word	0xd428a03d	! t0_kref+0x1c8:   	stb	%o2, [%g2 + 0x3d]
	.word	0xa7a3c927	! t0_kref+0x1cc:   	fmuls	%f15, %f7, %f19
	.word	0xecae9019	! t0_kref+0x1d0:   	stba	%l6, [%i2 + %i1]0x80
	.word	0x1b29cf79	! t0_kref+0x1d4:   	sethi	%hi(0xa73de400), %o5
	.word	0x3b480006	! t0_kref+0x1d8:   	fble,a,pt	%fcc0, _kref+0x1f0
	.word	0xd0266014	! t0_kref+0x1dc:   	st	%o0, [%i1 + 0x14]
	.word	0xe53f4019	! t0_kref+0x1e0:   	std	%f18, [%i5 + %i1]
	.word	0xa1a388a3	! t0_kref+0x1e4:   	fsubs	%f14, %f3, %f16
	.word	0xf11fbd58	! t0_kref+0x1e8:   	ldd	[%fp - 0x2a8], %f24
	.word	0xb1b40c4c	! t0_kref+0x1ec:   	fnor	%f16, %f12, %f24
	.word	0x170a975a	! t0_kref+0x1f0:   	sethi	%hi(0x2a5d6800), %o3
	.word	0xa5b4463a	! t0_kref+0x1f4:   	fmul8x16	%f17, %f26, %f18
	.word	0x9ba2c9b8	! t0_kref+0x1f8:   	fdivs	%f11, %f24, %f13
	.word	0x97a00128	! t0_kref+0x1fc:   	fabss	%f8, %f11
	.word	0xae12c010	! t0_kref+0x200:   	or	%o3, %l0, %l7
	.word	0x9b2ca005	! t0_kref+0x204:   	sll	%l2, 0x5, %o5
	.word	0x951aec95	! t0_kref+0x208:   	tsubcctv	%o3, 0xc95, %o2
	.word	0xf207bfe0	! t0_kref+0x20c:   	ld	[%fp - 0x20], %i1
	.word	0x3a480008	! t0_kref+0x210:   	bcc,a,pt	%icc, _kref+0x230
	.word	0x81844000	! t0_kref+0x214:   	wr	%l1, %g0, %y
	.word	0xd8ae1000	! t0_kref+0x218:   	stba	%o4, [%i0]0x80
	.word	0xb1a0192e	! t0_kref+0x21c:   	fstod	%f14, %f24
	.word	0xd428a02e	! t0_kref+0x220:   	stb	%o2, [%g2 + 0x2e]
	.word	0xd8263ffc	! t0_kref+0x224:   	st	%o4, [%i0 - 4]
	.word	0x85a0052a	! t0_kref+0x228:   	fsqrts	%f10, %f2
	.word	0xb9b18f77	! t0_kref+0x22c:   	fornot1s	%f6, %f23, %f28
	.word	0x93b00c20	! t0_kref+0x230:   	fzeros	%f9
	.word	0xeb68a084	! t0_kref+0x234:   	prefetch	%g2 + 0x84, 21
	.word	0x33480003	! t0_kref+0x238:   	fbe,a,pt	%fcc0, _kref+0x244
	.word	0xe3f6500a	! t0_kref+0x23c:   	casxa	[%i1]0x80, %o2, %l1
	call	SYM(t0_subr0)
	.word	0x91b74a2d	! t0_kref+0x244:   	fpadd16s	%f29, %f13, %f8
	.word	0x92d50000	! t0_kref+0x248:   	umulcc	%l4, %g0, %o1
	.word	0x2f480003	! t0_kref+0x24c:   	fbu,a,pt	%fcc0, _kref+0x258
	.word	0xc216c000	! t0_kref+0x250:   	lduh	[%i3], %g1
	.word	0x9eda2107	! t0_kref+0x254:   	smulcc	%o0, 0x107, %o7
	.word	0x36480006	! t0_kref+0x258:   	bge,a,pt	%icc, _kref+0x270
	.word	0x809b0017	! t0_kref+0x25c:   	xorcc	%o4, %l7, %g0
	.word	0xb7a01a25	! t0_kref+0x260:   	fstoi	%f5, %f27
	.word	0x81b4040a	! t0_kref+0x264:   	fcmple16	%f16, %f10, %g0
	.word	0x21480001	! t0_kref+0x268:   	fbn,a,pt	%fcc0, _kref+0x26c
	.word	0xe8180018	! t0_kref+0x26c:   	ldd	[%g0 + %i0], %l4
	.word	0xf91fbe50	! t0_kref+0x270:   	ldd	[%fp - 0x1b0], %f28
	.word	0xb5a01a2e	! t0_kref+0x274:   	fstoi	%f14, %f26
	.word	0x9ba00121	! t0_kref+0x278:   	fabss	%f1, %f13
	.word	0xd630a028	! t0_kref+0x27c:   	sth	%o3, [%g2 + 0x28]
	.word	0xaed28014	! t0_kref+0x280:   	umulcc	%o2, %l4, %l7
	.word	0x110f5dfa	! t0_kref+0x284:   	sethi	%hi(0x3d77e800), %o0
	.word	0x952ea018	! t0_kref+0x288:   	sll	%i2, 0x18, %o2
	.word	0xb5a00540	! t0_kref+0x28c:   	fsqrtd	%f0, %f26
	.word	0x98644014	! t0_kref+0x290:   	subc	%l1, %l4, %o4
	.word	0xb5b30ae1	! t0_kref+0x294:   	fpsub32s	%f12, %f1, %f26
	.word	0xe4267fe4	! t0_kref+0x298:   	st	%l2, [%i1 - 0x1c]
	.word	0x81334009	! t0_kref+0x29c:   	srl	%o5, %o1, %g0
	.word	0x93a000ac	! t0_kref+0x2a0:   	fnegs	%f12, %f9
	.word	0x31800008	! t0_kref+0x2a4:   	fba,a	_kref+0x2c4
	.word	0x9da0012e	! t0_kref+0x2a8:   	fabss	%f14, %f14
	.word	0x36480001	! t0_kref+0x2ac:   	bge,a,pt	%icc, _kref+0x2b0
	.word	0xe86e001a	! t0_kref+0x2b0:   	ldstub	[%i0 + %i2], %l4
	.word	0x99b40444	! t0_kref+0x2b4:   	fcmpne16	%f16, %f4, %o4
	.word	0x81580000	! t0_kref+0x2b8:   	flushw
	.word	0x9fa4c934	! t0_kref+0x2bc:   	fmuls	%f19, %f20, %f15
	.word	0xec28a02a	! t0_kref+0x2c0:   	stb	%l6, [%g2 + 0x2a]
	.word	0xb1a00944	! t0_kref+0x2c4:   	fmuld	%f0, %f4, %f24
	.word	0x93b680d1	! t0_kref+0x2c8:   	edge16l	%i2, %l1, %o1
	.word	0xd6062010	! t0_kref+0x2cc:   	ld	[%i0 + 0x10], %o3
	.word	0x81a0191c	! t0_kref+0x2d0:   	fitod	%f28, %f0
	.word	0x948d6aab	! t0_kref+0x2d4:   	andcc	%l5, 0xaab, %o2
	call	SYM(t0_subr2)
	.word	0x80168000	! t0_kref+0x2dc:   	or	%i2, %g0, %g0
	.word	0x9a7c387c	! t0_kref+0x2e0:   	sdiv	%l0, -0x784, %o5
	.word	0x9da0192c	! t0_kref+0x2e4:   	fstod	%f12, %f14
	.word	0xb5a3c938	! t0_kref+0x2e8:   	fmuls	%f15, %f24, %f26
	.word	0x91a0054c	! t0_kref+0x2ec:   	fsqrtd	%f12, %f8
	.word	0x3b480008	! t0_kref+0x2f0:   	fble,a,pt	%fcc0, _kref+0x310
	.word	0xd82e6015	! t0_kref+0x2f4:   	stb	%o4, [%i1 + 0x15]
	.word	0x973ae010	! t0_kref+0x2f8:   	sra	%o3, 0x10, %o3
	.word	0xc19f5019	! t0_kref+0x2fc:   	ldda	[%i5 + %i1]0x80, %f0
	.word	0xee30a028	! t0_kref+0x300:   	sth	%l7, [%g2 + 0x28]
	.word	0xaec5e5d7	! t0_kref+0x304:   	addccc	%l7, 0x5d7, %l7
	.word	0xeab6101b	! t0_kref+0x308:   	stha	%l5, [%i0 + %i3]0x80
	.word	0x26480008	! t0_kref+0x30c:   	bl,a,pt	%icc, _kref+0x32c
	.word	0x8da109d4	! t0_kref+0x310:   	fdivd	%f4, %f20, %f6
	.word	0x3c800001	! t0_kref+0x314:   	bpos,a	_kref+0x318
	.word	0xd91e3fe8	! t0_kref+0x318:   	ldd	[%i0 - 0x18], %f12
	.word	0x81858000	! t0_kref+0x31c:   	wr	%l6, %g0, %y
	call	SYM(t0_subr0)
	.word	0xcf063fe8	! t0_kref+0x324:   	ld	[%i0 - 0x18], %f7
	.word	0x91a0012c	! t0_kref+0x328:   	fabss	%f12, %f8
	.word	0xd62e7fe1	! t0_kref+0x32c:   	stb	%o3, [%i1 - 0x1f]
	.word	0x81de401b	! t0_kref+0x330:   	flush	%i1 + %i3
	.word	0xae15800b	! t0_kref+0x334:   	or	%l6, %o3, %l7
	.word	0x95408000	! t0_kref+0x338:   	mov	%ccr, %o2
	.word	0x89b40af5	! t0_kref+0x33c:   	fpsub32s	%f16, %f21, %f4
	.word	0x29800008	! t0_kref+0x340:   	fbl,a	_kref+0x360
	.word	0x92dc800d	! t0_kref+0x344:   	smulcc	%l2, %o5, %o1
	.word	0x83b5caf6	! t0_kref+0x348:   	fpsub32s	%f23, %f22, %f1
	.word	0x81ddb4e8	! t0_kref+0x34c:   	flush	%l6 - 0xb18
	.word	0xed06001c	! t0_kref+0x350:   	ld	[%i0 + %i4], %f22
	.word	0x801d0008	! t0_kref+0x354:   	xor	%l4, %o0, %g0
	.word	0xa1a01929	! t0_kref+0x358:   	fstod	%f9, %f16
	.word	0x81a84a27	! t0_kref+0x35c:   	fcmps	%fcc0, %f1, %f7
	.word	0x93a249bb	! t0_kref+0x360:   	fdivs	%f9, %f27, %f9
	.word	0x8143e040	! t0_kref+0x364:   	membar	0x40
	.word	0x35480004	! t0_kref+0x368:   	fbue,a,pt	%fcc0, _kref+0x378
	.word	0xaeac0014	! t0_kref+0x36c:   	andncc	%l0, %l4, %l7
	.word	0xc04e8018	! t0_kref+0x370:   	ldsb	[%i2 + %i0], %g0
	.word	0x95a28848	! t0_kref+0x374:   	faddd	%f10, %f8, %f10
	.word	0x9e9cc017	! t0_kref+0x378:   	xorcc	%l3, %l7, %o7
	.word	0xe078a020	! t0_kref+0x37c:   	swap	[%g2 + 0x20], %l0
	.word	0xec6e3fec	! t0_kref+0x380:   	ldstub	[%i0 - 0x14], %l6
	.word	0xb7a000a9	! t0_kref+0x384:   	fnegs	%f9, %f27
	.word	0x813c8011	! t0_kref+0x388:   	sra	%l2, %l1, %g0
	.word	0x36480001	! t0_kref+0x38c:   	bge,a,pt	%icc, _kref+0x390
	.word	0xd8ee9018	! t0_kref+0x390:   	ldstuba	[%i2 + %i0]0x80, %o4
	.word	0x1b025f74	! t0_kref+0x394:   	sethi	%hi(0x97dd000), %o5
	.word	0xe4380019	! t0_kref+0x398:   	std	%l2, [%g0 + %i1]
	.word	0x932da006	! t0_kref+0x39c:   	sll	%l6, 0x6, %o1
	.word	0x85b40c92	! t0_kref+0x3a0:   	fandnot2	%f16, %f18, %f2
	.word	0xa9b186bb	! t0_kref+0x3a4:   	fmul8x16al	%f6, %f27, %f20
	.word	0xbba000ba	! t0_kref+0x3a8:   	fnegs	%f26, %f29
	.word	0xd83e4000	! t0_kref+0x3ac:   	std	%o4, [%i1]
	.word	0x170f675b	! t0_kref+0x3b0:   	sethi	%hi(0x3d9d6c00), %o3
	.word	0x941b78dd	! t0_kref+0x3b4:   	xor	%o5, -0x723, %o2
	call	SYM(t0_subr1)
	.word	0xe428a00f	! t0_kref+0x3bc:   	stb	%l2, [%g2 + 0xf]
	.word	0xe11fbca8	! t0_kref+0x3c0:   	ldd	[%fp - 0x358], %f16
	.word	0x91a01919	! t0_kref+0x3c4:   	fitod	%f25, %f8
	.word	0x21800004	! t0_kref+0x3c8:   	fbn,a	_kref+0x3d8
	.word	0x81848000	! t0_kref+0x3cc:   	wr	%l2, %g0, %y
	.word	0x81de800c	! t0_kref+0x3d0:   	flush	%i2 + %o4
	.word	0xf430a026	! t0_kref+0x3d4:   	sth	%i2, [%g2 + 0x26]
	.word	0xdec81018	! t0_kref+0x3d8:   	ldsba	[%g0 + %i0]0x80, %o7
	.word	0xe2280018	! t0_kref+0x3dc:   	stb	%l1, [%g0 + %i0]
	.word	0x92342ad1	! t0_kref+0x3e0:   	orn	%l0, 0xad1, %o1
	.word	0x93258013	! t0_kref+0x3e4:   	mulscc	%l6, %l3, %o1
	.word	0x969a400a	! t0_kref+0x3e8:   	xorcc	%o1, %o2, %o3
	.word	0xda480019	! t0_kref+0x3ec:   	ldsb	[%g0 + %i1], %o5
	.word	0x8184c000	! t0_kref+0x3f0:   	wr	%l3, %g0, %y
	.word	0x89a01929	! t0_kref+0x3f4:   	fstod	%f9, %f4
	.word	0xc168a04f	! t0_kref+0x3f8:   	prefetch	%g2 + 0x4f, 0
	.word	0xd42e2002	! t0_kref+0x3fc:   	stb	%o2, [%i0 + 2]
	.word	0x8da0103a	! t0_kref+0x400:   	fstox	%f26, %f6
	.word	0x30480001	! t0_kref+0x404:   	ba,a,pt	%icc, _kref+0x408
	.word	0xfd6e001b	! t0_kref+0x408:   	prefetch	%i0 + %i3, 30
	.word	0xfb6e001c	! t0_kref+0x40c:   	prefetch	%i0 + %i4, 29
	.word	0xcd1fbea0	! t0_kref+0x410:   	ldd	[%fp - 0x160], %f6
	.word	0x81db4016	! t0_kref+0x414:   	flush	%o5 + %l6
	.word	0x31480008	! t0_kref+0x418:   	fba,a,pt	%fcc0, _kref+0x438
	.word	0x95a50858	! t0_kref+0x41c:   	faddd	%f20, %f24, %f10
	.word	0x99a0191d	! t0_kref+0x420:   	fitod	%f29, %f12
	.word	0x3d480001	! t0_kref+0x424:   	fbule,a,pt	%fcc0, _kref+0x428
	.word	0xd42e2015	! t0_kref+0x428:   	stb	%o2, [%i0 + 0x15]
	.word	0x97268009	! t0_kref+0x42c:   	mulscc	%i2, %o1, %o3
	.word	0x9fa000a6	! t0_kref+0x430:   	fnegs	%f6, %f15
	.word	0xe9be1814	! t0_kref+0x434:   	stda	%f20, [%i0 + %l4]0xc0
	.word	0xd4366004	! t0_kref+0x438:   	sth	%o2, [%i1 + 4]
	.word	0x9bb084d8	! t0_kref+0x43c:   	fcmpne32	%f2, %f24, %o5
	.word	0xb9b70ae3	! t0_kref+0x440:   	fpsub32s	%f28, %f3, %f28
	.word	0x9da28854	! t0_kref+0x444:   	faddd	%f10, %f20, %f14
	.word	0x949ac009	! t0_kref+0x448:   	xorcc	%o3, %o1, %o2
	.word	0x27480003	! t0_kref+0x44c:   	fbul,a,pt	%fcc0, _kref+0x458
	.word	0x81b01020	! t0_kref+0x450:   	siam	0x0
	.word	0xb1a00031	! t0_kref+0x454:   	fmovs	%f17, %f24
	.word	0x33800007	! t0_kref+0x458:   	fbe,a	_kref+0x474
	.word	0x94630011	! t0_kref+0x45c:   	subc	%o4, %l1, %o2
	.word	0x9eac0012	! t0_kref+0x460:   	andncc	%l0, %l2, %o7
	.word	0x99a01a4e	! t0_kref+0x464:   	fdtoi	%f14, %f12
	.word	0x9da149aa	! t0_kref+0x468:   	fdivs	%f5, %f10, %f14
	.word	0xa9a018c4	! t0_kref+0x46c:   	fdtos	%f4, %f20
	.word	0x26800005	! t0_kref+0x470:   	bl,a	_kref+0x484
	.word	0x969cec2c	! t0_kref+0x474:   	xorcc	%l3, 0xc2c, %o3
	.word	0x907ebd38	! t0_kref+0x478:   	sdiv	%i2, -0x2c8, %o0
	.word	0x81ad8a58	! t0_kref+0x47c:   	fcmpd	%fcc0, %f22, %f24
	.word	0xf430a026	! t0_kref+0x480:   	sth	%i2, [%g2 + 0x26]
	.word	0x26480004	! t0_kref+0x484:   	bl,a,pt	%icc, _kref+0x494
	.word	0x9fa20932	! t0_kref+0x488:   	fmuls	%f8, %f18, %f15
	.word	0x3b480003	! t0_kref+0x48c:   	fble,a,pt	%fcc0, _kref+0x498
	.word	0x94054009	! t0_kref+0x490:   	add	%l5, %o1, %o2
	.word	0x92fc800d	! t0_kref+0x494:   	sdivcc	%l2, %o5, %o1
	.word	0xaeda4014	! t0_kref+0x498:   	smulcc	%o1, %l4, %l7
	.word	0xada01937	! t0_kref+0x49c:   	fstod	%f23, %f22
	.word	0xee4e6002	! t0_kref+0x4a0:   	ldsb	[%i1 + 2], %l7
	.word	0x9a5cc009	! t0_kref+0x4a4:   	smul	%l3, %o1, %o5
	.word	0xe1beda19	! t0_kref+0x4a8:   	stda	%f16, [%i3 + %i1]0xd0
	.word	0xb9a01922	! t0_kref+0x4ac:   	fstod	%f2, %f28
	.word	0x31480005	! t0_kref+0x4b0:   	fba,a,pt	%fcc0, _kref+0x4c4
	.word	0xec762008	! t0_kref+0x4b4:   	stx	%l6, [%i0 + 8]
	.word	0x93a01a54	! t0_kref+0x4b8:   	fdtoi	%f20, %f9
	.word	0x9fc10000	! t0_kref+0x4bc:   	call	%g4
	.word	0xadb70752	! t0_kref+0x4c0:   	fpack32	%f28, %f18, %f22
	.word	0x96c4000d	! t0_kref+0x4c4:   	addccc	%l0, %o5, %o3
	.word	0x9e324013	! t0_kref+0x4c8:   	orn	%o1, %l3, %o7
	.word	0x3f480001	! t0_kref+0x4cc:   	fbo,a,pt	%fcc0, _kref+0x4d0
	.word	0x81848000	! t0_kref+0x4d0:   	wr	%l2, %g0, %y
	.word	0x97b00cfc	! t0_kref+0x4d4:   	fnot2s	%f28, %f11
	.word	0x948a800a	! t0_kref+0x4d8:   	andcc	%o2, %o2, %o2
	.word	0x9a0dae1e	! t0_kref+0x4dc:   	and	%l6, 0xe1e, %o5
	.word	0xcd063ff4	! t0_kref+0x4e0:   	ld	[%i0 - 0xc], %f6
	.word	0x8da00554	! t0_kref+0x4e4:   	fsqrtd	%f20, %f6
	.word	0xda28a00a	! t0_kref+0x4e8:   	stb	%o5, [%g2 + 0xa]
	.word	0x97700009	! t0_kref+0x4ec:   	popc	%o1, %o3
	.word	0x90fcbcad	! t0_kref+0x4f0:   	sdivcc	%l2, -0x353, %o0
	.word	0xe27e7fec	! t0_kref+0x4f4:   	swap	[%i1 - 0x14], %l1
	.word	0x8fa5883a	! t0_kref+0x4f8:   	fadds	%f22, %f26, %f7
	.word	0x908c4016	! t0_kref+0x4fc:   	andcc	%l1, %l6, %o0
	.word	0x96dd2294	! t0_kref+0x500:   	smulcc	%l4, 0x294, %o3
	.word	0xe0680019	! t0_kref+0x504:   	ldstub	[%g0 + %i1], %l0
	.word	0x96dd4009	! t0_kref+0x508:   	smulcc	%l5, %o1, %o3
	.word	0xb9a000a5	! t0_kref+0x50c:   	fnegs	%f5, %f28
	.word	0x85a289d2	! t0_kref+0x510:   	fdivd	%f10, %f18, %f2
	.word	0xe626001c	! t0_kref+0x514:   	st	%l3, [%i0 + %i4]
	.word	0xd030a002	! t0_kref+0x518:   	sth	%o0, [%g2 + 2]
	.word	0xa5b70f46	! t0_kref+0x51c:   	fornot1	%f28, %f6, %f18
	.word	0x9fc00004	! t0_kref+0x520:   	call	%g0 + %g4
	.word	0xda28a009	! t0_kref+0x524:   	stb	%o5, [%g2 + 9]
	.word	0xa1a01903	! t0_kref+0x528:   	fitod	%f3, %f16
	.word	0x2e800002	! t0_kref+0x52c:   	bvs,a	_kref+0x534
	.word	0x99b70408	! t0_kref+0x530:   	fcmple16	%f28, %f8, %o4
	.word	0xe6266008	! t0_kref+0x534:   	st	%l3, [%i1 + 8]
	.word	0x99358016	! t0_kref+0x538:   	srl	%l6, %l6, %o4
	.word	0xb1b00ce4	! t0_kref+0x53c:   	fnot2s	%f4, %f24
	.word	0xa5b007ba	! t0_kref+0x540:   	fpackfix	%f26, %f18
	.word	0xe81e7ff0	! t0_kref+0x544:   	ldd	[%i1 - 0x10], %l4
	.word	0xe76e3ff0	! t0_kref+0x548:   	prefetch	%i0 - 0x10, 19
	.word	0x21480007	! t0_kref+0x54c:   	fbn,a,pt	%fcc0, _kref+0x568
	.word	0xe16e7fe8	! t0_kref+0x550:   	prefetch	%i1 - 0x18, 16
	.word	0x9a34c013	! t0_kref+0x554:   	orn	%l3, %l3, %o5
	.word	0x805deb06	! t0_kref+0x558:   	smul	%l7, 0xb06, %g0
	.word	0xb9a018ca	! t0_kref+0x55c:   	fdtos	%f10, %f28
	.word	0x8da00548	! t0_kref+0x560:   	fsqrtd	%f8, %f6
	.word	0xadb48e02	! t0_kref+0x564:   	fand	%f18, %f2, %f22
	.word	0x21480005	! t0_kref+0x568:   	fbn,a,pt	%fcc0, _kref+0x57c
	.word	0xee0e001a	! t0_kref+0x56c:   	ldub	[%i0 + %i2], %l7
	.word	0x2a480007	! t0_kref+0x570:   	bcs,a,pt	%icc, _kref+0x58c
	.word	0xb5a01923	! t0_kref+0x574:   	fstod	%f3, %f26
	.word	0xc7270019	! t0_kref+0x578:   	st	%f3, [%i4 + %i1]
	.word	0x89a1082f	! t0_kref+0x57c:   	fadds	%f4, %f15, %f4
	.word	0x94802790	! t0_kref+0x580:   	addcc	%g0, 0x790, %o2
	.word	0x9a3b6810	! t0_kref+0x584:   	xnor	%o5, 0x810, %o5
	.word	0xda560000	! t0_kref+0x588:   	ldsh	[%i0], %o5
	.word	0xde4e6015	! t0_kref+0x58c:   	ldsb	[%i1 + 0x15], %o7
	.word	0xc51fbda0	! t0_kref+0x590:   	ldd	[%fp - 0x260], %f2
	.word	0x96ddf1b5	! t0_kref+0x594:   	smulcc	%l7, -0xe4b, %o3
	.word	0x87a48922	! t0_kref+0x598:   	fmuls	%f18, %f2, %f3
	.word	0x81dcb94f	! t0_kref+0x59c:   	flush	%l2 - 0x6b1
	.word	0x81b68c52	! t0_kref+0x5a0:   	fnor	%f26, %f18, %f0
	.word	0xc0200019	! t0_kref+0x5a4:   	clr	[%g0 + %i1]
	.word	0xee28a01f	! t0_kref+0x5a8:   	stb	%l7, [%g2 + 0x1f]
	.word	0xc1ee5011	! t0_kref+0x5ac:   	prefetcha	%i1 + %l1, 0
	.word	0xd2263fec	! t0_kref+0x5b0:   	st	%o1, [%i0 - 0x14]
	.word	0xa9a4c826	! t0_kref+0x5b4:   	fadds	%f19, %f6, %f20
	.word	0xc05e3ff8	! t0_kref+0x5b8:   	ldx	[%i0 - 8], %g0
	.word	0x97b10480	! t0_kref+0x5bc:   	fcmple32	%f4, %f0, %o3
	.word	0x90a68009	! t0_kref+0x5c0:   	subcc	%i2, %o1, %o0
	.word	0xd20e2005	! t0_kref+0x5c4:   	ldub	[%i0 + 5], %o1
	.word	0x90db387a	! t0_kref+0x5c8:   	smulcc	%o4, -0x786, %o0
	.word	0x929d7101	! t0_kref+0x5cc:   	xorcc	%l5, -0xeff, %o1
	.word	0x9f400000	! t0_kref+0x5d0:   	mov	%y, %o7
	.word	0x9ba01a28	! t0_kref+0x5d4:   	fstoi	%f8, %f13
	.word	0xa7a708a7	! t0_kref+0x5d8:   	fsubs	%f28, %f7, %f19
	.word	0x8062b66c	! t0_kref+0x5dc:   	subc	%o2, -0x994, %g0
	.word	0xa1a0190f	! t0_kref+0x5e0:   	fitod	%f15, %f16
	.word	0x9884401a	! t0_kref+0x5e4:   	addcc	%l1, %i2, %o4
	.word	0xaba00137	! t0_kref+0x5e8:   	fabss	%f23, %f21
	.word	0x907d8014	! t0_kref+0x5ec:   	sdiv	%l6, %l4, %o0
	.word	0x81a01904	! t0_kref+0x5f0:   	fitod	%f4, %f0
	.word	0x943b400b	! t0_kref+0x5f4:   	xnor	%o5, %o3, %o2
	.word	0x9fa018ce	! t0_kref+0x5f8:   	fdtos	%f14, %f15
	.word	0x89a000b5	! t0_kref+0x5fc:   	fnegs	%f21, %f4
	.word	0x960ac00d	! t0_kref+0x600:   	and	%o3, %o5, %o3
	.word	0xe100a02c	! t0_kref+0x604:   	ld	[%g2 + 0x2c], %f16
	.word	0xe19f5a59	! t0_kref+0x608:   	ldda	[%i5 + %i1]0xd2, %f16
	.word	0x89b10d0c	! t0_kref+0x60c:   	fandnot1	%f4, %f12, %f4
	.word	0xe6e81018	! t0_kref+0x610:   	ldstuba	[%g0 + %i0]0x80, %l3
	.word	0x91b3874a	! t0_kref+0x614:   	fpack32	%f14, %f10, %f8
	.word	0xee30a016	! t0_kref+0x618:   	sth	%l7, [%g2 + 0x16]
	.word	0x3a800005	! t0_kref+0x61c:   	bcc,a	_kref+0x630
	.word	0x91a01921	! t0_kref+0x620:   	fstod	%f1, %f8
	.word	0x8db48c80	! t0_kref+0x624:   	fandnot2	%f18, %f0, %f6
	.word	0x81aeca36	! t0_kref+0x628:   	fcmps	%fcc0, %f27, %f22
	.word	0x95a01a5a	! t0_kref+0x62c:   	fdtoi	%f26, %f10
	.word	0x9bb1848e	! t0_kref+0x630:   	fcmple32	%f6, %f14, %o5
	.word	0xc04e601f	! t0_kref+0x634:   	ldsb	[%i1 + 0x1f], %g0
	.word	0x99a0192d	! t0_kref+0x638:   	fstod	%f13, %f12
	.word	0x81b01025	! t0_kref+0x63c:   	siam	0x5
	.word	0xa5a70858	! t0_kref+0x640:   	faddd	%f28, %f24, %f18
	.word	0x8da0012e	! t0_kref+0x644:   	fabss	%f14, %f6
	.word	0xb9a00535	! t0_kref+0x648:   	fsqrts	%f21, %f28
	.word	0x2f800003	! t0_kref+0x64c:   	fbu,a	_kref+0x658
	.word	0x92b5400a	! t0_kref+0x650:   	orncc	%l5, %o2, %o1
	.word	0x81348009	! t0_kref+0x654:   	srl	%l2, %o1, %g0
	.word	0x91418000	! t0_kref+0x658:   	mov	%fprs, %o0
	.word	0xd4266004	! t0_kref+0x65c:   	st	%o2, [%i1 + 4]
	.word	0x905b0010	! t0_kref+0x660:   	smul	%o4, %l0, %o0
	.word	0xa1a189c0	! t0_kref+0x664:   	fdivd	%f6, %f0, %f16
	.word	0x9722400c	! t0_kref+0x668:   	mulscc	%o1, %o4, %o3
	.word	0xc768a088	! t0_kref+0x66c:   	prefetch	%g2 + 0x88, 3
	.word	0x945c401a	! t0_kref+0x670:   	smul	%l1, %i2, %o2
	.word	0x97a01a46	! t0_kref+0x674:   	fdtoi	%f6, %f11
	.word	0x29480008	! t0_kref+0x678:   	fbl,a,pt	%fcc0, _kref+0x698
	.word	0x91a089ca	! t0_kref+0x67c:   	fdivd	%f2, %f10, %f8
	.word	0xf91fbe90	! t0_kref+0x680:   	ldd	[%fp - 0x170], %f28
	.word	0x28800001	! t0_kref+0x684:   	bleu,a	_kref+0x688
	.word	0x9e748009	! t0_kref+0x688:   	udiv	%l2, %o1, %o7
	.word	0xae84342a	! t0_kref+0x68c:   	addcc	%l0, -0xbd6, %l7
	.word	0x87a00138	! t0_kref+0x690:   	fabss	%f24, %f3
	.word	0x3c480002	! t0_kref+0x694:   	bpos,a,pt	%icc, _kref+0x69c
	.word	0x980ca3c6	! t0_kref+0x698:   	and	%l2, 0x3c6, %o4
	.word	0x95b08e54	! t0_kref+0x69c:   	fxnor	%f2, %f20, %f10
	.word	0xd00e401a	! t0_kref+0x6a0:   	ldub	[%i1 + %i2], %o0
	.word	0x90da800b	! t0_kref+0x6a4:   	smulcc	%o2, %o3, %o0
	.word	0x8143e067	! t0_kref+0x6a8:   	membar	0x67
	.word	0x80dac016	! t0_kref+0x6ac:   	smulcc	%o3, %l6, %g0
	.word	0xe3063ff4	! t0_kref+0x6b0:   	ld	[%i0 - 0xc], %f17
	.word	0x91408000	! t0_kref+0x6b4:   	mov	%ccr, %o0
	.word	0xae5af70b	! t0_kref+0x6b8:   	smul	%o3, -0x8f5, %l7
	.word	0x2d480006	! t0_kref+0x6bc:   	fbg,a,pt	%fcc0, _kref+0x6d4
	.word	0x9f040014	! t0_kref+0x6c0:   	taddcc	%l0, %l4, %o7
	.word	0xe43f4019	! t0_kref+0x6c4:   	std	%l2, [%i5 + %i1]
	.word	0x85a0192d	! t0_kref+0x6c8:   	fstod	%f13, %f2
	.word	0x81ac0ac4	! t0_kref+0x6cc:   	fcmped	%fcc0, %f16, %f4
	.word	0xafa5c9a1	! t0_kref+0x6d0:   	fdivs	%f23, %f1, %f23
	.word	0x99b3405a	! t0_kref+0x6d4:   	edge8l	%o5, %i2, %o4
	.word	0x2a480007	! t0_kref+0x6d8:   	bcs,a,pt	%icc, _kref+0x6f4
	.word	0x19285ef3	! t0_kref+0x6dc:   	sethi	%hi(0xa17bcc00), %o4
	.word	0xa9a0192f	! t0_kref+0x6e0:   	fstod	%f15, %f20
	.word	0xaed80009	! t0_kref+0x6e4:   	smulcc	%g0, %o1, %l7
	.word	0xa1a189da	! t0_kref+0x6e8:   	fdivd	%f6, %f26, %f16
	.word	0x8170001a	! t0_kref+0x6ec:   	popc	%i2, %g0
	.word	0xd010a03c	! t0_kref+0x6f0:   	lduh	[%g2 + 0x3c], %o0
	.word	0xae5cc014	! t0_kref+0x6f4:   	smul	%l3, %l4, %l7
	.word	0x8143e040	! t0_kref+0x6f8:   	membar	0x40
	.word	0x83a3c9b6	! t0_kref+0x6fc:   	fdivs	%f15, %f22, %f1
	.word	0xa5a689d0	! t0_kref+0x700:   	fdivd	%f26, %f16, %f18
	.word	0xaeb52fde	! t0_kref+0x704:   	orncc	%l4, 0xfde, %l7
	.word	0xee4e6011	! t0_kref+0x708:   	ldsb	[%i1 + 0x11], %l7
	.word	0xae2c4015	! t0_kref+0x70c:   	andn	%l1, %l5, %l7
	.word	0xec1e2018	! t0_kref+0x710:   	ldd	[%i0 + 0x18], %l6
	.word	0x31800004	! t0_kref+0x714:   	fba,a	_kref+0x724
	.word	0xe43e4000	! t0_kref+0x718:   	std	%l2, [%i1]
	.word	0x26480005	! t0_kref+0x71c:   	bl,a,pt	%icc, _kref+0x730
	.word	0xa3b00f2f	! t0_kref+0x720:   	fsrc2s	%f15, %f17
	.word	0x80da7755	! t0_kref+0x724:   	smulcc	%o1, -0x8ab, %g0
	.word	0x8012c010	! t0_kref+0x728:   	or	%o3, %l0, %g0
	.word	0x23800003	! t0_kref+0x72c:   	fbne,a	_kref+0x738
	.word	0xc056001b	! t0_kref+0x730:   	ldsh	[%i0 + %i3], %g0
	.word	0xa5a2c924	! t0_kref+0x734:   	fmuls	%f11, %f4, %f18
	.word	0x1b102617	! t0_kref+0x738:   	sethi	%hi(0x40985c00), %o5
	.word	0x91a449a1	! t0_kref+0x73c:   	fdivs	%f17, %f1, %f8
	.word	0xb1b007b4	! t0_kref+0x740:   	fpackfix	%f20, %f24
	.word	0x31480007	! t0_kref+0x744:   	fba,a,pt	%fcc0, _kref+0x760
	.word	0xc00e0000	! t0_kref+0x748:   	ldub	[%i0], %g0
	.word	0xa9a0012c	! t0_kref+0x74c:   	fabss	%f12, %f20
	.word	0x97b00fe0	! t0_kref+0x750:   	fones	%f11
	.word	0xd43e7ff8	! t0_kref+0x754:   	std	%o2, [%i1 - 8]
	.word	0xa9a00524	! t0_kref+0x758:   	fsqrts	%f4, %f20
	.word	0x99b680ec	! t0_kref+0x75c:   	edge16ln	%i2, %o4, %o4
	.word	0x94aa8000	! t0_kref+0x760:   	andncc	%o2, %g0, %o2
	.word	0x81580000	! t0_kref+0x764:   	flushw
	.word	0xfd6e001d	! t0_kref+0x768:   	prefetch	%i0 + %i5, 30
	.word	0x9da00544	! t0_kref+0x76c:   	fsqrtd	%f4, %f14
	.word	0xa5a58856	! t0_kref+0x770:   	faddd	%f22, %f22, %f18
	.word	0x81db39e2	! t0_kref+0x774:   	flush	%o4 - 0x61e
	.word	0x8da00540	! t0_kref+0x778:   	fsqrtd	%f0, %f6
	.word	0xd1063fec	! t0_kref+0x77c:   	ld	[%i0 - 0x14], %f8
	.word	0x3e800002	! t0_kref+0x780:   	bvc,a	_kref+0x788
	.word	0x89a509d0	! t0_kref+0x784:   	fdivd	%f20, %f16, %f4
	.word	0x952ea007	! t0_kref+0x788:   	sll	%i2, 0x7, %o2
	.word	0xada609d2	! t0_kref+0x78c:   	fdivd	%f24, %f18, %f22
	.word	0x85a0055a	! t0_kref+0x790:   	fsqrtd	%f26, %f2
	.word	0x9e1d619d	! t0_kref+0x794:   	xor	%l5, 0x19d, %o7
	.word	0x2f800003	! t0_kref+0x798:   	fbu,a	_kref+0x7a4
	.word	0x9a58000c	! t0_kref+0x79c:   	smul	%g0, %o4, %o5
	.word	0xe67e6008	! t0_kref+0x7a0:   	swap	[%i1 + 8], %l3
	.word	0xae0b4008	! t0_kref+0x7a4:   	and	%o5, %o0, %l7
	call	SYM(t0_subr3)
	.word	0xa086b486	! t0_kref+0x7ac:   	addcc	%i2, -0xb7a, %l0
	.word	0x85a609bc	! t0_kref+0x7b0:   	fdivs	%f24, %f28, %f2
	.word	0xe56e001b	! t0_kref+0x7b4:   	prefetch	%i0 + %i3, 18
	.word	0xc00e7fef	! t0_kref+0x7b8:   	ldub	[%i1 - 0x11], %g0
	.word	0x81d83c98	! t0_kref+0x7bc:   	flush	%g0 - 0x368
	.word	0x94fc7399	! t0_kref+0x7c0:   	sdivcc	%l1, -0xc67, %o2
	.word	0x9bb500d5	! t0_kref+0x7c4:   	edge16l	%l4, %l5, %o5
	.word	0x81a80ada	! t0_kref+0x7c8:   	fcmped	%fcc0, %f0, %f26
	.word	0x85a189dc	! t0_kref+0x7cc:   	fdivd	%f6, %f28, %f2
	.word	0x8da00548	! t0_kref+0x7d0:   	fsqrtd	%f8, %f6
	.word	0x89a48832	! t0_kref+0x7d4:   	fadds	%f18, %f18, %f4
	.word	0x23480003	! t0_kref+0x7d8:   	fbne,a,pt	%fcc0, _kref+0x7e4
	.word	0xa1a0052d	! t0_kref+0x7dc:   	fsqrts	%f13, %f16
	.word	0xa9b14e22	! t0_kref+0x7e0:   	fands	%f5, %f2, %f20
	.word	0x95a649bb	! t0_kref+0x7e4:   	fdivs	%f25, %f27, %f10
	.word	0xa1a00544	! t0_kref+0x7e8:   	fsqrtd	%f4, %f16
	.word	0xee801019	! t0_kref+0x7ec:   	lda	[%g0 + %i1]0x80, %l7
	.word	0x2f480002	! t0_kref+0x7f0:   	fbu,a,pt	%fcc0, _kref+0x7f8
	.word	0xda067ffc	! t0_kref+0x7f4:   	ld	[%i1 - 4], %o5
	.word	0xa1a4092a	! t0_kref+0x7f8:   	fmuls	%f16, %f10, %f16
	.word	0x91b5014d	! t0_kref+0x7fc:   	edge32l	%l4, %o5, %o0
	.word	0xada01921	! t0_kref+0x800:   	fstod	%f1, %f22
	.word	0x90dd800a	! t0_kref+0x804:   	smulcc	%l6, %o2, %o0
	.word	0x9bb3408a	! t0_kref+0x808:   	edge16	%o5, %o2, %o5
	.word	0x33800008	! t0_kref+0x80c:   	fbe,a	_kref+0x82c
	.word	0x94a8000b	! t0_kref+0x810:   	andncc	%g0, %o3, %o2
	.word	0x81b540e0	! t0_kref+0x814:   	edge16ln	%l5, %g0, %g0
	.word	0x20800003	! t0_kref+0x818:   	bn,a	_kref+0x824
	.word	0x92b26ded	! t0_kref+0x81c:   	orncc	%o1, 0xded, %o1
	.word	0x010baf9a	! t0_kref+0x820:   	sethi	%hi(0x2ebe6800), %g0
	.word	0xa1a0053d	! t0_kref+0x824:   	fsqrts	%f29, %f16
	.word	0x91a0104a	! t0_kref+0x828:   	fdtox	%f10, %f8
	.word	0x2e800002	! t0_kref+0x82c:   	bvs,a	_kref+0x834
	.word	0xb9a01a26	! t0_kref+0x830:   	fstoi	%f6, %f28
	.word	0xee080018	! t0_kref+0x834:   	ldub	[%g0 + %i0], %l7
	.word	0xef68a046	! t0_kref+0x838:   	prefetch	%g2 + 0x46, 23
	.word	0x95b6090c	! t0_kref+0x83c:   	faligndata	%f24, %f12, %f10
	.word	0x89a0012c	! t0_kref+0x840:   	fabss	%f12, %f4
	.word	0xde861000	! t0_kref+0x844:   	lda	[%i0]0x80, %o7
	.word	0x81820000	! t0_kref+0x848:   	wr	%o0, %g0, %y
	.word	0x2a480006	! t0_kref+0x84c:   	bcs,a,pt	%icc, _kref+0x864
	.word	0xa1b00f2f	! t0_kref+0x850:   	fsrc2s	%f15, %f16
	.word	0x992a200d	! t0_kref+0x854:   	sll	%o0, 0xd, %o4
	.word	0x3c800004	! t0_kref+0x858:   	bpos,a	_kref+0x868
	.word	0xd2564000	! t0_kref+0x85c:   	ldsh	[%i1], %o1
	.word	0x27480003	! t0_kref+0x860:   	fbul,a,pt	%fcc0, _kref+0x86c
	.word	0x9bb480d4	! t0_kref+0x864:   	edge16l	%l2, %l4, %o5
	.word	0xe6200018	! t0_kref+0x868:   	st	%l3, [%g0 + %i0]
	.word	0xde96d019	! t0_kref+0x86c:   	lduha	[%i3 + %i1]0x80, %o7
	.word	0x9e9db3a3	! t0_kref+0x870:   	xorcc	%l6, -0xc5d, %o7
	.word	0x001fffff	! t0_kref+0x874:   	illtrap	0x1fffff
	.word	0x9476b85b	! t0_kref+0x878:   	udiv	%i2, -0x7a5, %o2
	.word	0x95a0052b	! t0_kref+0x87c:   	fsqrts	%f11, %f10
	.word	0x9e8567e4	! t0_kref+0x880:   	addcc	%l5, 0x7e4, %o7
	.word	0x38800003	! t0_kref+0x884:   	bgu,a	_kref+0x890
	.word	0x94556bfb	! t0_kref+0x888:   	umul	%l5, 0xbfb, %o2
	.word	0x2e480005	! t0_kref+0x88c:   	bvs,a,pt	%icc, _kref+0x8a0
	.word	0xae0ea9b2	! t0_kref+0x890:   	and	%i2, 0x9b2, %l7
	.word	0x93b5c240	! t0_kref+0x894:   	array16	%l7, %g0, %o1
	.word	0xe2e81018	! t0_kref+0x898:   	ldstuba	[%g0 + %i0]0x80, %l1
	.word	0xe028a011	! t0_kref+0x89c:   	stb	%l0, [%g2 + 0x11]
	.word	0x81aa8ac0	! t0_kref+0x8a0:   	fcmped	%fcc0, %f10, %f0
	.word	0x99b10c80	! t0_kref+0x8a4:   	fandnot2	%f4, %f0, %f12
	.word	0xf11fbe80	! t0_kref+0x8a8:   	ldd	[%fp - 0x180], %f24
	.word	0x25800005	! t0_kref+0x8ac:   	fblg,a	_kref+0x8c0
	.word	0xee6e7feb	! t0_kref+0x8b0:   	ldstub	[%i1 - 0x15], %l7
	.word	0x948daf03	! t0_kref+0x8b4:   	andcc	%l6, 0xf03, %o2
	.word	0x9a5aa7a4	! t0_kref+0x8b8:   	smul	%o2, 0x7a4, %o5
	.word	0x9ae24014	! t0_kref+0x8bc:   	subccc	%o1, %l4, %o5
	.word	0x81a98a4c	! t0_kref+0x8c0:   	fcmpd	%fcc0, %f6, %f12
	.word	0x9f414000	! t0_kref+0x8c4:   	mov	%pc, %o7
	.word	0xd8566008	! t0_kref+0x8c8:   	ldsh	[%i1 + 8], %o4
	.word	0xb1a01a29	! t0_kref+0x8cc:   	fstoi	%f9, %f24
	.word	0xd2267fec	! t0_kref+0x8d0:   	st	%o1, [%i1 - 0x14]
	.word	0x94fac00c	! t0_kref+0x8d4:   	sdivcc	%o3, %o4, %o2
	.word	0xada00150	! t0_kref+0x8d8:   	fabsd	%f16, %f22
	.word	0x9524bb72	! t0_kref+0x8dc:   	mulscc	%l2, -0x48e, %o2
	.word	0xa9b706e8	! t0_kref+0x8e0:   	fmul8ulx16	%f28, %f8, %f20
	.word	0x8da189d8	! t0_kref+0x8e4:   	fdivd	%f6, %f24, %f6
	.word	0x95b400ea	! t0_kref+0x8e8:   	edge16ln	%l0, %o2, %o2
	.word	0x11075fe8	! t0_kref+0x8ec:   	sethi	%hi(0x1d7fa000), %o0
	.word	0x928dacd1	! t0_kref+0x8f0:   	andcc	%l6, 0xcd1, %o1
	.word	0x1129e8fa	! t0_kref+0x8f4:   	sethi	%hi(0xa7a3e800), %o0
	.word	0xd6774019	! t0_kref+0x8f8:   	stx	%o3, [%i5 + %i1]
	.word	0xb7a249ad	! t0_kref+0x8fc:   	fdivs	%f9, %f13, %f27
	.word	0x28800007	! t0_kref+0x900:   	bleu,a	_kref+0x91c
	.word	0xa1b40a40	! t0_kref+0x904:   	fpadd32	%f16, %f0, %f16
	.word	0xee0e4000	! t0_kref+0x908:   	ldub	[%i1], %l7
	.word	0xae658011	! t0_kref+0x90c:   	subc	%l6, %l1, %l7
	.word	0xadb406a2	! t0_kref+0x910:   	fmul8x16al	%f16, %f2, %f22
	.word	0x2b800005	! t0_kref+0x914:   	fbug,a	_kref+0x928
	.word	0x94db320b	! t0_kref+0x918:   	smulcc	%o4, -0xdf5, %o2
	.word	0xf3ee101c	! t0_kref+0x91c:   	prefetcha	%i0 + %i4, 25
	.word	0x92b379b7	! t0_kref+0x920:   	orncc	%o5, -0x649, %o1
	.word	0x89a0055c	! t0_kref+0x924:   	fsqrtd	%f28, %f4
	.word	0x8fb00cf8	! t0_kref+0x928:   	fnot2s	%f24, %f7
	.word	0xa1a01a2c	! t0_kref+0x92c:   	fstoi	%f12, %f16
	.word	0x95b10582	! t0_kref+0x930:   	fcmpgt32	%f4, %f2, %o2
	.word	0x80a5c000	! t0_kref+0x934:   	cmp	%l7, %g0
	.word	0x23480002	! t0_kref+0x938:   	fbne,a,pt	%fcc0, _kref+0x940
	.word	0xada01933	! t0_kref+0x93c:   	fstod	%f19, %f22
	.word	0xa3a449a9	! t0_kref+0x940:   	fdivs	%f17, %f9, %f17
	.word	0x96dc7863	! t0_kref+0x944:   	smulcc	%l1, -0x79d, %o3
	.word	0x35480003	! t0_kref+0x948:   	fbue,a,pt	%fcc0, _kref+0x954
	.word	0x9b40c000	! t0_kref+0x94c:   	mov	%asi, %o5
	.word	0xc5067ff8	! t0_kref+0x950:   	ld	[%i1 - 8], %f2
	.word	0xae1caa6a	! t0_kref+0x954:   	xor	%l2, 0xa6a, %l7
	.word	0x9adc24fd	! t0_kref+0x958:   	smulcc	%l0, 0x4fd, %o5
	.word	0x33480001	! t0_kref+0x95c:   	fbe,a,pt	%fcc0, _kref+0x960
	.word	0x945d8010	! t0_kref+0x960:   	smul	%l6, %l0, %o2
	.word	0xb9a01a52	! t0_kref+0x964:   	fdtoi	%f18, %f28
	.word	0xb5a00556	! t0_kref+0x968:   	fsqrtd	%f22, %f26
	.word	0xb9b30d94	! t0_kref+0x96c:   	fxor	%f12, %f20, %f28
	.word	0xa5a1094e	! t0_kref+0x970:   	fmuld	%f4, %f14, %f18
	.word	0xc900a028	! t0_kref+0x974:   	ld	[%g2 + 0x28], %f4
	.word	0xb1a00134	! t0_kref+0x978:   	fabss	%f20, %f24
	.word	0xc056401b	! t0_kref+0x97c:   	ldsh	[%i1 + %i3], %g0
	.word	0x81dd8000	! t0_kref+0x980:   	flush	%l6
	.word	0xee067ffc	! t0_kref+0x984:   	ld	[%i1 - 4], %l7
	.word	0x908c0013	! t0_kref+0x988:   	andcc	%l0, %l3, %o0
	.word	0x94a2c00d	! t0_kref+0x98c:   	subcc	%o3, %o5, %o2
	.word	0xb9a01a48	! t0_kref+0x990:   	fdtoi	%f8, %f28
	.word	0xe3e6100b	! t0_kref+0x994:   	casa	[%i0]0x80, %o3, %l1
	.word	0x95a00544	! t0_kref+0x998:   	fsqrtd	%f4, %f10
	.word	0xeec81019	! t0_kref+0x99c:   	ldsba	[%g0 + %i1]0x80, %l7
	.word	0xd056c018	! t0_kref+0x9a0:   	ldsh	[%i3 + %i0], %o0
	.word	0x36480001	! t0_kref+0x9a4:   	bge,a,pt	%icc, _kref+0x9a8
	.word	0x9afc000c	! t0_kref+0x9a8:   	sdivcc	%l0, %o4, %o5
	.word	0xea266018	! t0_kref+0x9ac:   	st	%l5, [%i1 + 0x18]
	.word	0x3b480007	! t0_kref+0x9b0:   	fble,a,pt	%fcc0, _kref+0x9cc
	.word	0xd19f5019	! t0_kref+0x9b4:   	ldda	[%i5 + %i1]0x80, %f8
	.word	0x96b6af10	! t0_kref+0x9b8:   	orncc	%i2, 0xf10, %o3
	.word	0x94348017	! t0_kref+0x9bc:   	orn	%l2, %l7, %o2
	.word	0x9245b328	! t0_kref+0x9c0:   	addc	%l6, -0xcd8, %o1
	.word	0x81dbae56	! t0_kref+0x9c4:   	flush	%sp + 0xe56
	.word	0x972cc010	! t0_kref+0x9c8:   	sll	%l3, %l0, %o3
	.word	0x36800006	! t0_kref+0x9cc:   	bge,a	_kref+0x9e4
	.word	0x8db20628	! t0_kref+0x9d0:   	fmul8x16	%f8, %f8, %f6
	.word	0x81ac0ac8	! t0_kref+0x9d4:   	fcmped	%fcc0, %f16, %f8
	.word	0xc02e3feb	! t0_kref+0x9d8:   	clrb	[%i0 - 0x15]
	.word	0x8db5c638	! t0_kref+0x9dc:   	fmul8x16	%f23, %f24, %f6
	.word	0x81a01926	! t0_kref+0x9e0:   	fstod	%f6, %f0
	.word	0x86102001	! t0_kref+0x9e4:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x9e8:   	bne,a	_kref+0x9e8
	.word	0x86a0e001	! t0_kref+0x9ec:   	subcc	%g3, 1, %g3
	.word	0xb9b00fc0	! t0_kref+0x9f0:   	fone	%f28
	.word	0xf207bfe0	! t0_kref+0x9f4:   	ld	[%fp - 0x20], %i1
	.word	0x30480003	! t0_kref+0x9f8:   	ba,a,pt	%icc, _kref+0xa04
	.word	0xada00532	! t0_kref+0x9fc:   	fsqrts	%f18, %f22
	.word	0x92d24009	! t0_kref+0xa00:   	umulcc	%o1, %o1, %o1
	.word	0x94833d1d	! t0_kref+0xa04:   	addcc	%o4, -0x2e3, %o2
	.word	0x9613213a	! t0_kref+0xa08:   	or	%o4, 0x13a, %o3
	.word	0x80d267ca	! t0_kref+0xa0c:   	umulcc	%o1, 0x7ca, %g0
	.word	0xd4263ff8	! t0_kref+0xa10:   	st	%o2, [%i0 - 8]
	.word	0x91b50504	! t0_kref+0xa14:   	fcmpgt16	%f20, %f4, %o0
	.word	0x8db60c42	! t0_kref+0xa18:   	fnor	%f24, %f2, %f6
	.word	0x98548000	! t0_kref+0xa1c:   	umul	%l2, %g0, %o4
	.word	0x9bb0855a	! t0_kref+0xa20:   	fcmpeq16	%f2, %f26, %o5
	.word	0x9462800c	! t0_kref+0xa24:   	subc	%o2, %o4, %o2
	.word	0xc0a65000	! t0_kref+0xa28:   	sta	%g0, [%i1]0x80
	.word	0x9e128017	! t0_kref+0xa2c:   	or	%o2, %l7, %o7
	.word	0x83a409b4	! t0_kref+0xa30:   	fdivs	%f16, %f20, %f1
	.word	0xf3801019	! t0_kref+0xa34:   	lda	[%g0 + %i1]0x80, %f25
	.word	0x8143e002	! t0_kref+0xa38:   	membar	0x2
	.word	0xd6df5019	! t0_kref+0xa3c:   	ldxa	[%i5 + %i1]0x80, %o3
	.word	0x9e537516	! t0_kref+0xa40:   	umul	%o5, -0xaea, %o7
	.word	0xb5a01a4a	! t0_kref+0xa44:   	fdtoi	%f10, %f26
	.word	0xf76e3fe0	! t0_kref+0xa48:   	prefetch	%i0 - 0x20, 27
	.word	0xe22e8018	! t0_kref+0xa4c:   	stb	%l1, [%i2 + %i0]
	.word	0x85a01048	! t0_kref+0xa50:   	fdtox	%f8, %f2
	.word	0x37800006	! t0_kref+0xa54:   	fbge,a	_kref+0xa6c
	.word	0x9875a46c	! t0_kref+0xa58:   	udiv	%l6, 0x46c, %o4
	.word	0x94c43953	! t0_kref+0xa5c:   	addccc	%l0, -0x6ad, %o2
	.word	0x3d480001	! t0_kref+0xa60:   	fbule,a,pt	%fcc0, _kref+0xa64
	.word	0x98a4c013	! t0_kref+0xa64:   	subcc	%l3, %l3, %o4
	.word	0xb5b68906	! t0_kref+0xa68:   	faligndata	%f26, %f6, %f26
	.word	0x22480006	! t0_kref+0xa6c:   	be,a,pt	%icc, _kref+0xa84
	.word	0x925cb829	! t0_kref+0xa70:   	smul	%l2, -0x7d7, %o1
	.word	0x23480008	! t0_kref+0xa74:   	fbne,a,pt	%fcc0, _kref+0xa94
	.word	0xd04e0000	! t0_kref+0xa78:   	ldsb	[%i0], %o0
	.word	0x9a3d000a	! t0_kref+0xa7c:   	xnor	%l4, %o2, %o5
	.word	0xeeae1000	! t0_kref+0xa80:   	stba	%l7, [%i0]0x80
	.word	0x9f40c000	! t0_kref+0xa84:   	mov	%asi, %o7
	.word	0x9a5a7d99	! t0_kref+0xa88:   	smul	%o1, -0x267, %o5
	.word	0x98debb1e	! t0_kref+0xa8c:   	smulcc	%i2, -0x4e2, %o4
	.word	0x9afb0015	! t0_kref+0xa90:   	sdivcc	%o4, %l5, %o5
	.word	0x81b34240	! t0_kref+0xa94:   	array16	%o5, %g0, %g0
	.word	0xec1e4000	! t0_kref+0xa98:   	ldd	[%i1], %l6
	.word	0xc0480018	! t0_kref+0xa9c:   	ldsb	[%g0 + %i0], %g0
	.word	0xe6b6d018	! t0_kref+0xaa0:   	stha	%l3, [%i3 + %i0]0x80
	.word	0xec6e6018	! t0_kref+0xaa4:   	ldstub	[%i1 + 0x18], %l6
	.word	0xe420a030	! t0_kref+0xaa8:   	st	%l2, [%g2 + 0x30]
	.word	0xf76e7ff8	! t0_kref+0xaac:   	prefetch	%i1 - 8, 27
	.word	0x927a0017	! t0_kref+0xab0:   	sdiv	%o0, %l7, %o1
	.word	0x967a4015	! t0_kref+0xab4:   	sdiv	%o1, %l5, %o3
	.word	0x9a5b376b	! t0_kref+0xab8:   	smul	%o4, -0x895, %o5
	.word	0xd6460000	! t0_kref+0xabc:   	ldsw	[%i0], %o3
	.word	0xb5a1c929	! t0_kref+0xac0:   	fmuls	%f7, %f9, %f26
	.word	0x9ad02678	! t0_kref+0xac4:   	umulcc	%g0, 0x678, %o5
	.word	0xc0567ff2	! t0_kref+0xac8:   	ldsh	[%i1 - 0xe], %g0
	.word	0xb7a00121	! t0_kref+0xacc:   	fabss	%f1, %f27
	.word	0x81dfc01f	! t0_kref+0xad0:   	flush	%i7 + %i7
	.word	0xb5a00537	! t0_kref+0xad4:   	fsqrts	%f23, %f26
	.word	0xa5a589ad	! t0_kref+0xad8:   	fdivs	%f22, %f13, %f18
	.word	0xec280018	! t0_kref+0xadc:   	stb	%l6, [%g0 + %i0]
	.word	0xf1be5817	! t0_kref+0xae0:   	stda	%f24, [%i1 + %l7]0xc0
	.word	0xe81e7ff8	! t0_kref+0xae4:   	ldd	[%i1 - 8], %l4
	.word	0x81830000	! t0_kref+0xae8:   	wr	%o4, %g0, %y
	.word	0x9e0dfe30	! t0_kref+0xaec:   	and	%l7, -0x1d0, %o7
	.word	0xde564000	! t0_kref+0xaf0:   	ldsh	[%i1], %o7
	.word	0x9b400000	! t0_kref+0xaf4:   	mov	%y, %o5
	.word	0xf43e0000	! t0_kref+0xaf8:   	std	%i2, [%i0]
	.word	0x85a01909	! t0_kref+0xafc:   	fitod	%f9, %f2
	.word	0xd04e201f	! t0_kref+0xb00:   	ldsb	[%i0 + 0x1f], %o0
	.word	0x24800006	! t0_kref+0xb04:   	ble,a	_kref+0xb1c
	.word	0xa9b086d6	! t0_kref+0xb08:   	fmul8sux16	%f2, %f22, %f20
	.word	0xd84e7ff1	! t0_kref+0xb0c:   	ldsb	[%i1 - 0xf], %o4
	.word	0xeb68a041	! t0_kref+0xb10:   	prefetch	%g2 + 0x41, 21
	.word	0xee4e7fe7	! t0_kref+0xb14:   	ldsb	[%i1 - 0x19], %l7
	.word	0xada0054c	! t0_kref+0xb18:   	fsqrtd	%f12, %f22
	.word	0x97b00772	! t0_kref+0xb1c:   	fpack16	%f18, %f11
	call	SYM(t0_subr1)
	.word	0xe8b81019	! t0_kref+0xb24:   	stda	%l4, [%g0 + %i1]0x80
	.word	0x9fb4434a	! t0_kref+0xb28:   	alignaddrl	%l1, %o2, %o7
	.word	0x81848000	! t0_kref+0xb2c:   	wr	%l2, %g0, %y
	.word	0x90c43642	! t0_kref+0xb30:   	addccc	%l0, -0x9be, %o0
	.word	0x95b58088	! t0_kref+0xb34:   	edge16	%l6, %o0, %o2
	.word	0x9722346f	! t0_kref+0xb38:   	mulscc	%o0, -0xb91, %o3
	.word	0x81aaca37	! t0_kref+0xb3c:   	fcmps	%fcc0, %f11, %f23
	.word	0xe4f81019	! t0_kref+0xb40:   	swapa	[%g0 + %i1]0x80, %l2
	.word	0xe1e65015	! t0_kref+0xb44:   	casa	[%i1]0x80, %l5, %l0
	.word	0x36480003	! t0_kref+0xb48:   	bge,a,pt	%icc, _kref+0xb54
	.word	0x98da4010	! t0_kref+0xb4c:   	smulcc	%o1, %l0, %o4
	.word	0x2e480001	! t0_kref+0xb50:   	bvs,a,pt	%icc, _kref+0xb54
	.word	0xb3b5ce2d	! t0_kref+0xb54:   	fands	%f23, %f13, %f25
	.word	0xa7a000b5	! t0_kref+0xb58:   	fnegs	%f21, %f19
	.word	0xef68a044	! t0_kref+0xb5c:   	prefetch	%g2 + 0x44, 23
	.word	0x99b2ccba	! t0_kref+0xb60:   	fandnot2s	%f11, %f26, %f12
	.word	0x38800008	! t0_kref+0xb64:   	bgu,a	_kref+0xb84
	.word	0xd030a028	! t0_kref+0xb68:   	sth	%o0, [%g2 + 0x28]
	.word	0x2f800003	! t0_kref+0xb6c:   	fbu,a	_kref+0xb78
	.word	0xa9b28e06	! t0_kref+0xb70:   	fand	%f10, %f6, %f20
	.word	0x9db30dd2	! t0_kref+0xb74:   	fnand	%f12, %f18, %f14
	.word	0xafa00131	! t0_kref+0xb78:   	fabss	%f17, %f23
	.word	0x81dba490	! t0_kref+0xb7c:   	flush	%sp + 0x490
	.word	0x31480006	! t0_kref+0xb80:   	fba,a,pt	%fcc0, _kref+0xb98
	.word	0x92b34011	! t0_kref+0xb84:   	orncc	%o5, %l1, %o1
	.word	0x2e800002	! t0_kref+0xb88:   	bvs,a	_kref+0xb90
	.word	0x96fd6a83	! t0_kref+0xb8c:   	sdivcc	%l5, 0xa83, %o3
	.word	0x29480006	! t0_kref+0xb90:   	fbl,a,pt	%fcc0, _kref+0xba8
	.word	0xd03e6008	! t0_kref+0xb94:   	std	%o0, [%i1 + 8]
	.word	0x93a5892e	! t0_kref+0xb98:   	fmuls	%f22, %f14, %f9
	.word	0x81b2030d	! t0_kref+0xb9c:   	alignaddr	%o0, %o5, %g0
	.word	0xda266010	! t0_kref+0xba0:   	st	%o5, [%i1 + 0x10]
	.word	0xb5a00558	! t0_kref+0xba4:   	fsqrtd	%f24, %f26
	.word	0x21800003	! t0_kref+0xba8:   	fbn,a	_kref+0xbb4
	.word	0xb5a01923	! t0_kref+0xbac:   	fstod	%f3, %f26
	.word	0xaeb2be86	! t0_kref+0xbb0:   	orncc	%o2, -0x17a, %l7
	.word	0x89a01917	! t0_kref+0xbb4:   	fitod	%f23, %f4
	.word	0xa7a01a46	! t0_kref+0xbb8:   	fdtoi	%f6, %f19
	.word	0x95b484cc	! t0_kref+0xbbc:   	fcmpne32	%f18, %f12, %o2
	.word	0x28800002	! t0_kref+0xbc0:   	bleu,a	_kref+0xbc8
	.word	0x992c6017	! t0_kref+0xbc4:   	sll	%l1, 0x17, %o4
	.word	0x91a00139	! t0_kref+0xbc8:   	fabss	%f25, %f8
	.word	0x97b2c0ad	! t0_kref+0xbcc:   	edge16n	%o3, %o5, %o3
	.word	0x9bb5c354	! t0_kref+0xbd0:   	alignaddrl	%l7, %l4, %o5
	.word	0x8185c000	! t0_kref+0xbd4:   	wr	%l7, %g0, %y
	.word	0xd2080019	! t0_kref+0xbd8:   	ldub	[%g0 + %i1], %o1
	.word	0x8da00546	! t0_kref+0xbdc:   	fsqrtd	%f6, %f6
	.word	0x93a01a26	! t0_kref+0xbe0:   	fstoi	%f6, %f9
	.word	0x34800005	! t0_kref+0xbe4:   	bg,a	_kref+0xbf8
	.word	0xb9a28956	! t0_kref+0xbe8:   	fmuld	%f10, %f22, %f28
	.word	0xd8080018	! t0_kref+0xbec:   	ldub	[%g0 + %i0], %o4
	.word	0x95b606f6	! t0_kref+0xbf0:   	fmul8ulx16	%f24, %f22, %f10
	.word	0xafa00521	! t0_kref+0xbf4:   	fsqrts	%f1, %f23
	.word	0x99b00fe0	! t0_kref+0xbf8:   	fones	%f12
	.word	0x97b0cab5	! t0_kref+0xbfc:   	fpsub16s	%f3, %f21, %f11
	.word	0x85b10744	! t0_kref+0xc00:   	fpack32	%f4, %f4, %f2
	.word	0x9fb50240	! t0_kref+0xc04:   	array16	%l4, %g0, %o7
	.word	0x99a2085a	! t0_kref+0xc08:   	faddd	%f8, %f26, %f12
	.word	0x80b6801a	! t0_kref+0xc0c:   	orncc	%i2, %i2, %g0
	.word	0x953da013	! t0_kref+0xc10:   	sra	%l6, 0x13, %o2
	.word	0xde000019	! t0_kref+0xc14:   	ld	[%g0 + %i1], %o7
	.word	0x81ac0ac6	! t0_kref+0xc18:   	fcmped	%fcc0, %f16, %f6
	.word	0x31480006	! t0_kref+0xc1c:   	fba,a,pt	%fcc0, _kref+0xc34
	.word	0x85a00137	! t0_kref+0xc20:   	fabss	%f23, %f2
	.word	0x987d4014	! t0_kref+0xc24:   	sdiv	%l5, %l4, %o4
	.word	0x90168009	! t0_kref+0xc28:   	or	%i2, %o1, %o0
	.word	0x92e362f6	! t0_kref+0xc2c:   	subccc	%o5, 0x2f6, %o1
	.word	0x25480002	! t0_kref+0xc30:   	fblg,a,pt	%fcc0, _kref+0xc38
	.word	0x99a00552	! t0_kref+0xc34:   	fsqrtd	%f18, %f12
	.word	0x38480008	! t0_kref+0xc38:   	bgu,a,pt	%icc, _kref+0xc58
	.word	0x9458001a	! t0_kref+0xc3c:   	smul	%g0, %i2, %o2
	.word	0x9e9df088	! t0_kref+0xc40:   	xorcc	%l7, -0xf78, %o7
	.word	0xc056001b	! t0_kref+0xc44:   	ldsh	[%i0 + %i3], %g0
	.word	0xe300a010	! t0_kref+0xc48:   	ld	[%g2 + 0x10], %f17
	.word	0x93226746	! t0_kref+0xc4c:   	mulscc	%o1, 0x746, %o1
	.word	0xc96e2018	! t0_kref+0xc50:   	prefetch	%i0 + 0x18, 4
	.word	0xcb070018	! t0_kref+0xc54:   	ld	[%i4 + %i0], %f5
	.word	0x89a018da	! t0_kref+0xc58:   	fdtos	%f26, %f4
	.word	0xa1a588ca	! t0_kref+0xc5c:   	fsubd	%f22, %f10, %f16
	.word	0x99b10c5c	! t0_kref+0xc60:   	fnor	%f4, %f28, %f12
	.word	0xc91e2000	! t0_kref+0xc64:   	ldd	[%i0], %f4
	.word	0x8fb00c20	! t0_kref+0xc68:   	fzeros	%f7
	.word	0x21480003	! t0_kref+0xc6c:   	fbn,a,pt	%fcc0, _kref+0xc78
	.word	0xd820a00c	! t0_kref+0xc70:   	st	%o4, [%g2 + 0xc]
	.word	0x91b680fa	! t0_kref+0xc74:   	edge16ln	%i2, %i2, %o0
	.word	0x25800002	! t0_kref+0xc78:   	fblg,a	_kref+0xc80
	.word	0x932c400b	! t0_kref+0xc7c:   	sll	%l1, %o3, %o1
	.word	0x21480001	! t0_kref+0xc80:   	fbn,a,pt	%fcc0, _kref+0xc84
	.word	0x91a01921	! t0_kref+0xc84:   	fstod	%f1, %f8
	.word	0x99b28c42	! t0_kref+0xc88:   	fnor	%f10, %f2, %f12
	.word	0x95b1cdab	! t0_kref+0xc8c:   	fxors	%f7, %f11, %f10
	.word	0xafb007b0	! t0_kref+0xc90:   	fpackfix	%f16, %f23
	.word	0xda266008	! t0_kref+0xc94:   	st	%o5, [%i1 + 8]
	.word	0x81830000	! t0_kref+0xc98:   	wr	%o4, %g0, %y
	.word	0x98340015	! t0_kref+0xc9c:   	orn	%l0, %l5, %o4
	.word	0xe428a017	! t0_kref+0xca0:   	stb	%l2, [%g2 + 0x17]
	.word	0xe0b65000	! t0_kref+0xca4:   	stha	%l0, [%i1]0x80
	.word	0xe220a02c	! t0_kref+0xca8:   	st	%l1, [%g2 + 0x2c]
	.word	0xc96e3ff8	! t0_kref+0xcac:   	prefetch	%i0 - 8, 4
	.word	0x907af0e3	! t0_kref+0xcb0:   	sdiv	%o3, -0xf1d, %o0
	.word	0x35800005	! t0_kref+0xcb4:   	fbue,a	_kref+0xcc8
	.word	0x9f3b0000	! t0_kref+0xcb8:   	sra	%o4, %g0, %o7
	.word	0xef00a004	! t0_kref+0xcbc:   	ld	[%g2 + 4], %f23
	.word	0xc0780018	! t0_kref+0xcc0:   	swap	[%g0 + %i0], %g0
	.word	0x99a01a25	! t0_kref+0xcc4:   	fstoi	%f5, %f12
	.word	0x91aac048	! t0_kref+0xcc8:   	fmovdge	%fcc0, %f8, %f8
	.word	0x921339dc	! t0_kref+0xccc:   	or	%o4, -0x624, %o1
	.word	0x81d94005	! t0_kref+0xcd0:   	flush	%g5 + %g5
	.word	0xf91f4019	! t0_kref+0xcd4:   	ldd	[%i5 + %i1], %f28
	.word	0xf36e001b	! t0_kref+0xcd8:   	prefetch	%i0 + %i3, 25
	.word	0x8fa14821	! t0_kref+0xcdc:   	fadds	%f5, %f1, %f7
	.word	0x91a01a42	! t0_kref+0xce0:   	fdtoi	%f2, %f8
	.word	0x32800006	! t0_kref+0xce4:   	bne,a	_kref+0xcfc
	.word	0x9e1824e8	! t0_kref+0xce8:   	xor	%g0, 0x4e8, %o7
	.word	0x27800004	! t0_kref+0xcec:   	fbul,a	_kref+0xcfc
	.word	0xe2ee1000	! t0_kref+0xcf0:   	ldstuba	[%i0]0x80, %l1
	.word	0xe91fbd10	! t0_kref+0xcf4:   	ldd	[%fp - 0x2f0], %f20
	.word	0x9740c000	! t0_kref+0xcf8:   	mov	%asi, %o3
	.word	0xbbb00c20	! t0_kref+0xcfc:   	fzeros	%f29
	.word	0x908a7a11	! t0_kref+0xd00:   	andcc	%o1, -0x5ef, %o0
	.word	0xa5a689c6	! t0_kref+0xd04:   	fdivd	%f26, %f6, %f18
	.word	0x8da0012e	! t0_kref+0xd08:   	fabss	%f14, %f6
	.word	0x927d000c	! t0_kref+0xd0c:   	sdiv	%l4, %o4, %o1
	.word	0xe520a018	! t0_kref+0xd10:   	st	%f18, [%g2 + 0x18]
	.word	0x93b200f3	! t0_kref+0xd14:   	edge16ln	%o0, %l3, %o1
	.word	0xb1a14d3a	! t0_kref+0xd18:   	fsmuld	%f5, %f26, %f24
	.word	0x85b38630	! t0_kref+0xd1c:   	fmul8x16	%f14, %f16, %f2
	.word	0x8bb74ab7	! t0_kref+0xd20:   	fpsub16s	%f29, %f23, %f5
	.word	0xc0566016	! t0_kref+0xd24:   	ldsh	[%i1 + 0x16], %g0
	.word	0xa9a01909	! t0_kref+0xd28:   	fitod	%f9, %f20
	.word	0xdade501d	! t0_kref+0xd2c:   	ldxa	[%i1 + %i5]0x80, %o5
	.word	0x8072800c	! t0_kref+0xd30:   	udiv	%o2, %o4, %g0
	.word	0x33800006	! t0_kref+0xd34:   	fbe,a	_kref+0xd4c
	.word	0x9e657625	! t0_kref+0xd38:   	subc	%l5, -0x9db, %o7
	.word	0x83a6c936	! t0_kref+0xd3c:   	fmuls	%f27, %f22, %f1
	.word	0x8db40d0e	! t0_kref+0xd40:   	fandnot1	%f16, %f14, %f6
	.word	0x81ac0a5a	! t0_kref+0xd44:   	fcmpd	%fcc0, %f16, %f26
	.word	0x38800004	! t0_kref+0xd48:   	bgu,a	_kref+0xd58
	.word	0xc168a084	! t0_kref+0xd4c:   	prefetch	%g2 + 0x84, 0
	.word	0x17078626	! t0_kref+0xd50:   	sethi	%hi(0x1e189800), %o3
	.word	0xc3ee5011	! t0_kref+0xd54:   	prefetcha	%i1 + %l1, 1
	.word	0x9a9c8013	! t0_kref+0xd58:   	xorcc	%l2, %l3, %o5
	.word	0x22480002	! t0_kref+0xd5c:   	be,a,pt	%icc, _kref+0xd64
	.word	0xdad65000	! t0_kref+0xd60:   	ldsha	[%i1]0x80, %o5
	.word	0x9de3bfa0	! t0_kref+0xd64:   	save	%sp, -0x60, %sp
	.word	0xbb06801a	! t0_kref+0xd68:   	taddcc	%i2, %i2, %i5
	.word	0xafef330a	! t0_kref+0xd6c:   	restore	%i4, -0xcf6, %l7
	.word	0xd44e2008	! t0_kref+0xd70:   	ldsb	[%i0 + 8], %o2
	.word	0xd40e4000	! t0_kref+0xd74:   	ldub	[%i1], %o2
	.word	0x92ba4011	! t0_kref+0xd78:   	xnorcc	%o1, %l1, %o1
	.word	0x9065c00d	! t0_kref+0xd7c:   	subc	%l7, %o5, %o0
	.word	0x9a9423c9	! t0_kref+0xd80:   	orcc	%l0, 0x3c9, %o5
	.word	0xb9c162ac	! t0_kref+0xd84:   	jmpl	%g5 + 0x2ac, %i4
	.word	0xeed65000	! t0_kref+0xd88:   	ldsha	[%i1]0x80, %l7
	.word	0x9ee2000b	! t0_kref+0xd8c:   	subccc	%o0, %o3, %o7
	.word	0x33800001	! t0_kref+0xd90:   	fbe,a	_kref+0xd94
	.word	0x9edd7495	! t0_kref+0xd94:   	smulcc	%l5, -0xb6b, %o7
	.word	0xc12f0000	! t0_kref+0xd98:   	st	%fsr, [%i4]
	.word	0x21480006	! t0_kref+0xd9c:   	fbn,a,pt	%fcc0, _kref+0xdb4
	.word	0x95b2851c	! t0_kref+0xda0:   	fcmpgt16	%f10, %f28, %o2
	.word	0xcd3e7fe8	! t0_kref+0xda4:   	std	%f6, [%i1 - 0x18]
	.word	0x97b1cda6	! t0_kref+0xda8:   	fxors	%f7, %f6, %f11
	.word	0xada10856	! t0_kref+0xdac:   	faddd	%f4, %f22, %f22
	.word	0x89b00cd6	! t0_kref+0xdb0:   	fnot2	%f22, %f4
	.word	0x8034fc03	! t0_kref+0xdb4:   	orn	%l3, -0x3fd, %g0
	.word	0x95b50040	! t0_kref+0xdb8:   	edge8l	%l4, %g0, %o2
	.word	0x2c800006	! t0_kref+0xdbc:   	bneg,a	_kref+0xdd4
	.word	0x807c801a	! t0_kref+0xdc0:   	sdiv	%l2, %i2, %g0
	.word	0x989a4012	! t0_kref+0xdc4:   	xorcc	%o1, %l2, %o4
	.word	0xe6262018	! t0_kref+0xdc8:   	st	%l3, [%i0 + 0x18]
	.word	0x9bb54100	! t0_kref+0xdcc:   	edge32	%l5, %g0, %o5
	.word	0xd8ce9019	! t0_kref+0xdd0:   	ldsba	[%i2 + %i1]0x80, %o4
	.word	0x81858000	! t0_kref+0xdd4:   	wr	%l6, %g0, %y
	.word	0xa3a018cc	! t0_kref+0xdd8:   	fdtos	%f12, %f17
	.word	0x9a0c8013	! t0_kref+0xddc:   	and	%l2, %l3, %o5
	.word	0x968d8013	! t0_kref+0xde0:   	andcc	%l6, %l3, %o3
	call	SYM(t0_subr3)
	.word	0x81de001e	! t0_kref+0xde8:   	flush	%i0 + %fp
	.word	0x952c601a	! t0_kref+0xdec:   	sll	%l1, 0x1a, %o2
	.word	0xabb007b2	! t0_kref+0xdf0:   	fpackfix	%f18, %f21
	.word	0x94b24008	! t0_kref+0xdf4:   	orncc	%o1, %o0, %o2
	.word	0x912a0009	! t0_kref+0xdf8:   	sll	%o0, %o1, %o0
	.word	0xe43e6010	! t0_kref+0xdfc:   	std	%l2, [%i1 + 0x10]
	.word	0x3d480003	! t0_kref+0xe00:   	fbule,a,pt	%fcc0, _kref+0xe0c
	.word	0x81580000	! t0_kref+0xe04:   	flushw
	.word	0x8fa4493b	! t0_kref+0xe08:   	fmuls	%f17, %f27, %f7
	.word	0x99b48f82	! t0_kref+0xe0c:   	for	%f18, %f2, %f12
	.word	0x9da68833	! t0_kref+0xe10:   	fadds	%f26, %f19, %f14
	.word	0x941b778b	! t0_kref+0xe14:   	xor	%o5, -0x875, %o2
	.word	0xd8066004	! t0_kref+0xe18:   	ld	[%i1 + 4], %o4
	.word	0x9a3d8012	! t0_kref+0xe1c:   	xnor	%l6, %l2, %o5
	.word	0x9a8c8010	! t0_kref+0xe20:   	andcc	%l2, %l0, %o5
	.word	0xda0e401a	! t0_kref+0xe24:   	ldub	[%i1 + %i2], %o5
	.word	0x9fc10000	! t0_kref+0xe28:   	call	%g4
	.word	0xd4060000	! t0_kref+0xe2c:   	ld	[%i0], %o2
	.word	0x85b48e80	! t0_kref+0xe30:   	fsrc1	%f18, %f2
	.word	0xa5b0cdb4	! t0_kref+0xe34:   	fxors	%f3, %f20, %f18
	.word	0xada40837	! t0_kref+0xe38:   	fadds	%f16, %f23, %f22
	.word	0x8da0012f	! t0_kref+0xe3c:   	fabss	%f15, %f6
	.word	0xe428a014	! t0_kref+0xe40:   	stb	%l2, [%g2 + 0x14]
	.word	0xc36e6000	! t0_kref+0xe44:   	prefetch	%i1, 1
	.word	0xd2500018	! t0_kref+0xe48:   	ldsh	[%g0 + %i0], %o1
	.word	0xada01917	! t0_kref+0xe4c:   	fitod	%f23, %f22
	.word	0x20800006	! t0_kref+0xe50:   	bn,a	_kref+0xe68
	.word	0x9655b757	! t0_kref+0xe54:   	umul	%l6, -0x8a9, %o3
	.word	0xee080019	! t0_kref+0xe58:   	ldub	[%g0 + %i1], %l7
	.word	0xd4803fec	! t0_kref+0xe5c:   	lda	[%g0 - 0x14]%asi, %o2
	.word	0xa7a00122	! t0_kref+0xe60:   	fabss	%f2, %f19
	.word	0xaea6bae7	! t0_kref+0xe64:   	subcc	%i2, -0x519, %l7
	.word	0xede65014	! t0_kref+0xe68:   	casa	[%i1]0x80, %l4, %l6
	.word	0xd60e7ff2	! t0_kref+0xe6c:   	ldub	[%i1 - 0xe], %o3
	.word	0xee28a036	! t0_kref+0xe70:   	stb	%l7, [%g2 + 0x36]
	.word	0x35800008	! t0_kref+0xe74:   	fbue,a	_kref+0xe94
	.word	0x80b50013	! t0_kref+0xe78:   	orncc	%l4, %l3, %g0
	.word	0x95a2c839	! t0_kref+0xe7c:   	fadds	%f11, %f25, %f10
	.word	0x90820000	! t0_kref+0xe80:   	addcc	%o0, %g0, %o0
	.word	0x93b4c335	! t0_kref+0xe84:   	bmask	%l3, %l5, %o1
	.word	0xd1be580a	! t0_kref+0xe88:   	stda	%f8, [%i1 + %o2]0xc0
	.word	0xae62224a	! t0_kref+0xe8c:   	subc	%o0, 0x24a, %l7
	.word	0x9eb53ec9	! t0_kref+0xe90:   	orncc	%l4, -0x137, %o7
	.word	0x8ba000ad	! t0_kref+0xe94:   	fnegs	%f13, %f5
	.word	0xc0480018	! t0_kref+0xe98:   	ldsb	[%g0 + %i0], %g0
	.word	0x9da018ca	! t0_kref+0xe9c:   	fdtos	%f10, %f14
	.word	0x3d800005	! t0_kref+0xea0:   	fbule,a	_kref+0xeb4
	.word	0x81a00556	! t0_kref+0xea4:   	fsqrtd	%f22, %f0
	.word	0xd5e61008	! t0_kref+0xea8:   	casa	[%i0]0x80, %o0, %o2
	.word	0x89a00131	! t0_kref+0xeac:   	fabss	%f17, %f4
	.word	0x2f800003	! t0_kref+0xeb0:   	fbu,a	_kref+0xebc
	.word	0xe62e4000	! t0_kref+0xeb4:   	stb	%l3, [%i1]
	.word	0x9e7cc012	! t0_kref+0xeb8:   	sdiv	%l3, %l2, %o7
	call	SYM(t0_subr3)
	.word	0x9adb0008	! t0_kref+0xec0:   	smulcc	%o4, %o0, %o5
	.word	0x3c800001	! t0_kref+0xec4:   	bpos,a	_kref+0xec8
	.word	0x85b0870d	! t0_kref+0xec8:   	fmuld8sux16	%f2, %f13, %f2
	.word	0xff6e401a	! t0_kref+0xecc:   	prefetch	%i1 + %i2, 31
	.word	0xde4e3ff3	! t0_kref+0xed0:   	ldsb	[%i0 - 0xd], %o7
	.word	0x25800006	! t0_kref+0xed4:   	fblg,a	_kref+0xeec
	.word	0xd60e4000	! t0_kref+0xed8:   	ldub	[%i1], %o3
	.word	0xae34e915	! t0_kref+0xedc:   	orn	%l3, 0x915, %l7
	.word	0x91a01913	! t0_kref+0xee0:   	fitod	%f19, %f8
	.word	0x99a3482a	! t0_kref+0xee4:   	fadds	%f13, %f10, %f12
	.word	0xe81e4000	! t0_kref+0xee8:   	ldd	[%i1], %l4
	.word	0x983d0014	! t0_kref+0xeec:   	xnor	%l4, %l4, %o4
	.word	0xe43e7ff8	! t0_kref+0xef0:   	std	%l2, [%i1 - 8]
	.word	0x89a000b9	! t0_kref+0xef4:   	fnegs	%f25, %f4
	.word	0x3e800006	! t0_kref+0xef8:   	bvc,a	_kref+0xf10
	.word	0x96352ea2	! t0_kref+0xefc:   	orn	%l4, 0xea2, %o3
	.word	0xa5a01918	! t0_kref+0xf00:   	fitod	%f24, %f18
	.word	0xee4e7ff7	! t0_kref+0xf04:   	ldsb	[%i1 - 9], %l7
	.word	0xd91fbe98	! t0_kref+0xf08:   	ldd	[%fp - 0x168], %f12
	.word	0x87a0053a	! t0_kref+0xf0c:   	fsqrts	%f26, %f3
	.word	0x99b70556	! t0_kref+0xf10:   	fcmpeq16	%f28, %f22, %o4
	.word	0xf93e3ff0	! t0_kref+0xf14:   	std	%f28, [%i0 - 0x10]
	.word	0xb5b68e58	! t0_kref+0xf18:   	fxnor	%f26, %f24, %f26
	.word	0xb1ab8046	! t0_kref+0xf1c:   	fmovdule	%fcc0, %f6, %f24
	.word	0x91a68844	! t0_kref+0xf20:   	faddd	%f26, %f4, %f8
	.word	0x81800000	! t0_kref+0xf24:   	mov	%g0, %y
	.word	0x91b007b6	! t0_kref+0xf28:   	fpackfix	%f22, %f8
	.word	0x95a01a22	! t0_kref+0xf2c:   	fstoi	%f2, %f10
	.word	0xf11e6010	! t0_kref+0xf30:   	ldd	[%i1 + 0x10], %f24
	.word	0x95b58e46	! t0_kref+0xf34:   	fxnor	%f22, %f6, %f10
	.word	0x81a80ad8	! t0_kref+0xf38:   	fcmped	%fcc0, %f0, %f24
	.word	0xcd20a000	! t0_kref+0xf3c:   	st	%f6, [%g2]
	.word	0xe1064000	! t0_kref+0xf40:   	ld	[%i1], %f16
	.word	0xae9d3961	! t0_kref+0xf44:   	xorcc	%l4, -0x69f, %l7
	.word	0x99a0192e	! t0_kref+0xf48:   	fstod	%f14, %f12
	.word	0xaf408000	! t0_kref+0xf4c:   	mov	%ccr, %l7
	.word	0xaf600013	! t0_kref+0xf50:   	movn	%fcc0, %l3, %l7
	.word	0x24800004	! t0_kref+0xf54:   	ble,a	_kref+0xf64
	.word	0x94827b8f	! t0_kref+0xf58:   	addcc	%o1, -0x471, %o2
	.word	0x3f800006	! t0_kref+0xf5c:   	fbo,a	_kref+0xf74
	.word	0xee0e2009	! t0_kref+0xf60:   	ldub	[%i0 + 9], %l7
	.word	0x2f480002	! t0_kref+0xf64:   	fbu,a,pt	%fcc0, _kref+0xf6c
	.word	0x92928010	! t0_kref+0xf68:   	orcc	%o2, %l0, %o1
	.word	0xa7a01a2f	! t0_kref+0xf6c:   	fstoi	%f15, %f19
	.word	0x985476ce	! t0_kref+0xf70:   	umul	%l1, -0x932, %o4
	.word	0x94b28016	! t0_kref+0xf74:   	orncc	%o2, %l6, %o2
	.word	0xfb6e401d	! t0_kref+0xf78:   	prefetch	%i1 + %i5, 29
	.word	0xec1f4018	! t0_kref+0xf7c:   	ldd	[%i5 + %i0], %l6
	.word	0xafb5434c	! t0_kref+0xf80:   	alignaddrl	%l5, %o4, %l7
	.word	0xb5b48754	! t0_kref+0xf84:   	fpack32	%f18, %f20, %f26
	.word	0x29480007	! t0_kref+0xf88:   	fbl,a,pt	%fcc0, _kref+0xfa4
	.word	0xee08a006	! t0_kref+0xf8c:   	ldub	[%g2 + 6], %l7
	.word	0x3b480003	! t0_kref+0xf90:   	fble,a,pt	%fcc0, _kref+0xf9c
	.word	0xd22e3fea	! t0_kref+0xf94:   	stb	%o1, [%i0 - 0x16]
	.word	0x9da01909	! t0_kref+0xf98:   	fitod	%f9, %f14
	.word	0xb5a01a5a	! t0_kref+0xf9c:   	fdtoi	%f26, %f26
	.word	0xed1fbd30	! t0_kref+0xfa0:   	ldd	[%fp - 0x2d0], %f22
	.word	0x91b48dbb	! t0_kref+0xfa4:   	fxors	%f18, %f27, %f8
	.word	0x89b58ea0	! t0_kref+0xfa8:   	fsrc1s	%f22, %f4
	.word	0x9fc00004	! t0_kref+0xfac:   	call	%g0 + %g4
	.word	0xe106601c	! t0_kref+0xfb0:   	ld	[%i1 + 0x1c], %f16
	.word	0x928568bb	! t0_kref+0xfb4:   	addcc	%l5, 0x8bb, %o1
	.word	0xe83e3fe8	! t0_kref+0xfb8:   	std	%l4, [%i0 - 0x18]
	.word	0x9fc10000	! t0_kref+0xfbc:   	call	%g4
	.word	0xaebda031	! t0_kref+0xfc0:   	xnorcc	%l6, 0x31, %l7
	.word	0xf007bfe0	! t0_kref+0xfc4:   	ld	[%fp - 0x20], %i0
	.word	0xeedf5019	! t0_kref+0xfc8:   	ldxa	[%i5 + %i1]0x80, %l7
	.word	0x9da209c2	! t0_kref+0xfcc:   	fdivd	%f8, %f2, %f14
	.word	0x81858000	! t0_kref+0xfd0:   	wr	%l6, %g0, %y
	.word	0x969aa0ca	! t0_kref+0xfd4:   	xorcc	%o2, 0xca, %o3
	.word	0xe168a00b	! t0_kref+0xfd8:   	prefetch	%g2 + 0xb, 16
	.word	0xb1b50758	! t0_kref+0xfdc:   	fpack32	%f20, %f24, %f24
	.word	0x9e7c7e15	! t0_kref+0xfe0:   	sdiv	%l1, -0x1eb, %o7
	.word	0x9f408000	! t0_kref+0xfe4:   	mov	%ccr, %o7
	.word	0xe1bf1a59	! t0_kref+0xfe8:   	stda	%f16, [%i4 + %i1]0xd2
	.word	0x3c800003	! t0_kref+0xfec:   	bpos,a	_kref+0xff8
	.word	0xa5a000d6	! t0_kref+0xff0:   	fnegd	%f22, %f18
	.word	0x97a00124	! t0_kref+0xff4:   	fabss	%f4, %f11
	.word	0x81820000	! t0_kref+0xff8:   	wr	%o0, %g0, %y
	.word	0x99a01a54	! t0_kref+0xffc:   	fdtoi	%f20, %f12
	.word	0xd1e6500d	! t0_kref+0x1000:   	casa	[%i1]0x80, %o5, %o0
	.word	0xc028a035	! t0_kref+0x1004:   	clrb	[%g2 + 0x35]
	.word	0x92ac8000	! t0_kref+0x1008:   	andncc	%l2, %g0, %o1
	.word	0xaeb57fbb	! t0_kref+0x100c:   	orncc	%l5, -0x45, %l7
	.word	0xb9a0191d	! t0_kref+0x1010:   	fitod	%f29, %f28
	.word	0x908828f0	! t0_kref+0x1014:   	andcc	%g0, 0x8f0, %o0
	.word	0xafb000b7	! t0_kref+0x1018:   	edge16n	%g0, %l7, %l7
	.word	0x952ac014	! t0_kref+0x101c:   	sll	%o3, %l4, %o2
	.word	0x2b480003	! t0_kref+0x1020:   	fbug,a,pt	%fcc0, _kref+0x102c
	.word	0x8185c000	! t0_kref+0x1024:   	wr	%l7, %g0, %y
	.word	0xd8ae9018	! t0_kref+0x1028:   	stba	%o4, [%i2 + %i0]0x80
	.word	0x94d8000c	! t0_kref+0x102c:   	smulcc	%g0, %o4, %o2
	.word	0xc00e6013	! t0_kref+0x1030:   	ldub	[%i1 + 0x13], %g0
	.word	0x99a01901	! t0_kref+0x1034:   	fitod	%f1, %f12
	.word	0xc99eda58	! t0_kref+0x1038:   	ldda	[%i3 + %i0]0xd2, %f4
	.word	0x987a7d6f	! t0_kref+0x103c:   	sdiv	%o1, -0x291, %o4
	.word	0xec1e6000	! t0_kref+0x1040:   	ldd	[%i1], %l6
	.word	0xf500a000	! t0_kref+0x1044:   	ld	[%g2], %f26
	.word	0x28480004	! t0_kref+0x1048:   	bleu,a,pt	%icc, _kref+0x1058
	.word	0xd4680018	! t0_kref+0x104c:   	ldstub	[%g0 + %i0], %o2
	.word	0xc04e7fe3	! t0_kref+0x1050:   	ldsb	[%i1 - 0x1d], %g0
	.word	0xec1e2018	! t0_kref+0x1054:   	ldd	[%i0 + 0x18], %l6
	.word	0x21800004	! t0_kref+0x1058:   	fbn,a	_kref+0x1068
	.word	0x9b2c400d	! t0_kref+0x105c:   	sll	%l1, %o5, %o5
	.word	0xa5b28f88	! t0_kref+0x1060:   	for	%f10, %f8, %f18
	.word	0x2f480007	! t0_kref+0x1064:   	fbu,a,pt	%fcc0, _kref+0x1080
	.word	0x81b2c0cb	! t0_kref+0x1068:   	edge16l	%o3, %o3, %g0
	.word	0x9fb34140	! t0_kref+0x106c:   	edge32l	%o5, %g0, %o7
	.word	0x9f3c8009	! t0_kref+0x1070:   	sra	%l2, %o1, %o7
	.word	0xea2e7fe8	! t0_kref+0x1074:   	stb	%l5, [%i1 - 0x18]
	.word	0x30800003	! t0_kref+0x1078:   	ba,a	_kref+0x1084
	.word	0xda480019	! t0_kref+0x107c:   	ldsb	[%g0 + %i1], %o5
	.word	0x81b01025	! t0_kref+0x1080:   	siam	0x5
	.word	0x9fa01a36	! t0_kref+0x1084:   	fstoi	%f22, %f15
	.word	0xe1be180b	! t0_kref+0x1088:   	stda	%f16, [%i0 + %o3]0xc0
	.word	0x902c34f7	! t0_kref+0x108c:   	andn	%l0, -0xb09, %o0
	.word	0x97224017	! t0_kref+0x1090:   	mulscc	%o1, %l7, %o3
	.word	0x9e7c3755	! t0_kref+0x1094:   	sdiv	%l0, -0x8ab, %o7
	.word	0xe99e5a5c	! t0_kref+0x1098:   	ldda	[%i1 + %i4]0xd2, %f20
	.word	0xaf25f5d3	! t0_kref+0x109c:   	mulscc	%l7, -0xa2d, %l7
	.word	0x95b20356	! t0_kref+0x10a0:   	alignaddrl	%o0, %l6, %o2
	.word	0x33480002	! t0_kref+0x10a4:   	fbe,a,pt	%fcc0, _kref+0x10ac
	.word	0xec1e6008	! t0_kref+0x10a8:   	ldd	[%i1 + 8], %l6
	.word	0xc99f5058	! t0_kref+0x10ac:   	ldda	[%i5 + %i0]0x82, %f4
	.word	0xb5b4063a	! t0_kref+0x10b0:   	fmul8x16	%f16, %f26, %f26
	.word	0x8143e040	! t0_kref+0x10b4:   	membar	0x40
	.word	0x98342faa	! t0_kref+0x10b8:   	orn	%l0, 0xfaa, %o4
	.word	0x9db30e80	! t0_kref+0x10bc:   	fsrc1	%f12, %f14
	.word	0xd40e7fea	! t0_kref+0x10c0:   	ldub	[%i1 - 0x16], %o2
	.word	0x80a30016	! t0_kref+0x10c4:   	cmp	%o4, %l6
	.word	0xee20a00c	! t0_kref+0x10c8:   	st	%l7, [%g2 + 0xc]
	.word	0xb9a08946	! t0_kref+0x10cc:   	fmuld	%f2, %f6, %f28
	.word	0xadb28f8c	! t0_kref+0x10d0:   	for	%f10, %f12, %f22
	.word	0xe36e401d	! t0_kref+0x10d4:   	prefetch	%i1 + %i5, 17
	.word	0x9262800c	! t0_kref+0x10d8:   	subc	%o2, %o4, %o1
	.word	0x3e480008	! t0_kref+0x10dc:   	bvc,a,pt	%icc, _kref+0x10fc
	.word	0x9e1a400c	! t0_kref+0x10e0:   	xor	%o1, %o4, %o7
	.word	0x20800005	! t0_kref+0x10e4:   	bn,a	_kref+0x10f8
	.word	0x173d0eb2	! t0_kref+0x10e8:   	sethi	%hi(0xf43ac800), %o3
	.word	0xe47e7ffc	! t0_kref+0x10ec:   	swap	[%i1 - 4], %l2
	.word	0x29480008	! t0_kref+0x10f0:   	fbl,a,pt	%fcc0, _kref+0x1110
	.word	0xd8280018	! t0_kref+0x10f4:   	stb	%o4, [%g0 + %i0]
	.word	0x95268013	! t0_kref+0x10f8:   	mulscc	%i2, %l3, %o2
	.word	0x33800003	! t0_kref+0x10fc:   	fbe,a	_kref+0x1108
	.word	0x9264e0e0	! t0_kref+0x1100:   	subc	%l3, 0xe0, %o1
	.word	0x9324400c	! t0_kref+0x1104:   	mulscc	%l1, %o4, %o1
	.word	0xa9a00522	! t0_kref+0x1108:   	fsqrts	%f2, %f20
	.word	0x9482c009	! t0_kref+0x110c:   	addcc	%o3, %o1, %o2
	.word	0xb5a3c8a6	! t0_kref+0x1110:   	fsubs	%f15, %f6, %f26
	.word	0x9fc10000	! t0_kref+0x1114:   	call	%g4
	.word	0xa1b40151	! t0_kref+0x1118:   	edge32l	%l0, %l1, %l0
	.word	0x91b240ca	! t0_kref+0x111c:   	edge16l	%o1, %o2, %o0
	.word	0xd60e3fef	! t0_kref+0x1120:   	ldub	[%i0 - 0x11], %o3
	.word	0xb3b24d3d	! t0_kref+0x1124:   	fandnot1s	%f9, %f29, %f25
	.word	0xae9d000b	! t0_kref+0x1128:   	xorcc	%l4, %o3, %l7
	.word	0x38800004	! t0_kref+0x112c:   	bgu,a	_kref+0x113c
	.word	0x93228014	! t0_kref+0x1130:   	mulscc	%o2, %l4, %o1
	.word	0xd2562004	! t0_kref+0x1134:   	ldsh	[%i0 + 4], %o1
	.word	0x987b400d	! t0_kref+0x1138:   	sdiv	%o5, %o5, %o4
	.word	0x81ab8a56	! t0_kref+0x113c:   	fcmpd	%fcc0, %f14, %f22
	.word	0x98ad0009	! t0_kref+0x1140:   	andncc	%l4, %o1, %o4
	.word	0xee262014	! t0_kref+0x1144:   	st	%l7, [%i0 + 0x14]
	.word	0xe43e3ff0	! t0_kref+0x1148:   	std	%l2, [%i0 - 0x10]
	.word	0xd24e2007	! t0_kref+0x114c:   	ldsb	[%i0 + 7], %o1
	.word	0x30800006	! t0_kref+0x1150:   	ba,a	_kref+0x1168
	.word	0xe51fbd38	! t0_kref+0x1154:   	ldd	[%fp - 0x2c8], %f18
	.word	0xa7b54a6e	! t0_kref+0x1158:   	fpadd32s	%f21, %f14, %f19
	.word	0x26480001	! t0_kref+0x115c:   	bl,a,pt	%icc, _kref+0x1160
	.word	0x9da01a24	! t0_kref+0x1160:   	fstoi	%f4, %f14
	.word	0x90600013	! t0_kref+0x1164:   	subc	%g0, %l3, %o0
	.word	0xef68a005	! t0_kref+0x1168:   	prefetch	%g2 + 5, 23
	.word	0x85a38848	! t0_kref+0x116c:   	faddd	%f14, %f8, %f2
	.word	0x96be8017	! t0_kref+0x1170:   	xnorcc	%i2, %l7, %o3
	.word	0xa1a01a3b	! t0_kref+0x1174:   	fstoi	%f27, %f16
	.word	0xae5b0014	! t0_kref+0x1178:   	smul	%o4, %l4, %l7
	.word	0x25800001	! t0_kref+0x117c:   	fblg,a	_kref+0x1180
	.word	0x9e3b3617	! t0_kref+0x1180:   	xnor	%o4, -0x9e9, %o7
	.word	0x96834016	! t0_kref+0x1184:   	addcc	%o5, %l6, %o3
	.word	0xd2d01018	! t0_kref+0x1188:   	ldsha	[%g0 + %i0]0x80, %o1
	.word	0xec2e6006	! t0_kref+0x118c:   	stb	%l6, [%i1 + 6]
	.word	0x90c4c012	! t0_kref+0x1190:   	addccc	%l3, %l2, %o0
	.word	0x99b340ec	! t0_kref+0x1194:   	edge16ln	%o5, %o4, %o4
	.word	0x31480008	! t0_kref+0x1198:   	fba,a,pt	%fcc0, _kref+0x11b8
	.word	0x96b3338f	! t0_kref+0x119c:   	orncc	%o4, -0xc71, %o3
	.word	0xf1be1855	! t0_kref+0x11a0:   	stda	%f24, [%i0 + %l5]0xc2
	.word	0xd610a01e	! t0_kref+0x11a4:   	lduh	[%g2 + 0x1e], %o3
	.word	0x95a0110e	! t0_kref+0x11a8:   	fxtod	%f14, %f10
	.word	0xd8b6101b	! t0_kref+0x11ac:   	stha	%o4, [%i0 + %i3]0x80
	.word	0x933b0015	! t0_kref+0x11b0:   	sra	%o4, %l5, %o1
	.word	0x963d6bfe	! t0_kref+0x11b4:   	xnor	%l5, 0xbfe, %o3
	.word	0x95b3415a	! t0_kref+0x11b8:   	edge32l	%o5, %i2, %o2
	.word	0x92d4800b	! t0_kref+0x11bc:   	umulcc	%l2, %o3, %o1
	.word	0xb9a00027	! t0_kref+0x11c0:   	fmovs	%f7, %f28
	.word	0x9fb3840c	! t0_kref+0x11c4:   	fcmple16	%f14, %f12, %o7
	.word	0x36480006	! t0_kref+0x11c8:   	bge,a,pt	%icc, _kref+0x11e0
	.word	0xd84e7ff1	! t0_kref+0x11cc:   	ldsb	[%i1 - 0xf], %o4
	.word	0x21800006	! t0_kref+0x11d0:   	fbn,a	_kref+0x11e8
	.word	0xc768a043	! t0_kref+0x11d4:   	prefetch	%g2 + 0x43, 3
	.word	0x81858000	! t0_kref+0x11d8:   	wr	%l6, %g0, %y
	.word	0x92bab615	! t0_kref+0x11dc:   	xnorcc	%o2, -0x9eb, %o1
	.word	0xdae81019	! t0_kref+0x11e0:   	ldstuba	[%g0 + %i1]0x80, %o5
	.word	0x80668015	! t0_kref+0x11e4:   	subc	%i2, %l5, %g0
	call	SYM(t0_subr1)
	.word	0x97b20492	! t0_kref+0x11ec:   	fcmple32	%f8, %f18, %o3
	.word	0x980d21bf	! t0_kref+0x11f0:   	and	%l4, 0x1bf, %o4
	.word	0xf91fbc98	! t0_kref+0x11f4:   	ldd	[%fp - 0x368], %f28
	.word	0x800d4016	! t0_kref+0x11f8:   	and	%l5, %l6, %g0
	.word	0x22800003	! t0_kref+0x11fc:   	be,a	_kref+0x1208
	.word	0xe22e3ffd	! t0_kref+0x1200:   	stb	%l1, [%i0 - 3]
	.word	0x85a00127	! t0_kref+0x1204:   	fabss	%f7, %f2
	.word	0x1b0286dc	! t0_kref+0x1208:   	sethi	%hi(0xa1b7000), %o5
	.word	0xd2062014	! t0_kref+0x120c:   	ld	[%i0 + 0x14], %o1
	.word	0x29480004	! t0_kref+0x1210:   	fbl,a,pt	%fcc0, _kref+0x1220
	.word	0x952c8008	! t0_kref+0x1214:   	sll	%l2, %o0, %o2
	.word	0x967d400c	! t0_kref+0x1218:   	sdiv	%l5, %o4, %o3
	.word	0xd40e4000	! t0_kref+0x121c:   	ldub	[%i1], %o2
	.word	0x96deba45	! t0_kref+0x1220:   	smulcc	%i2, -0x5bb, %o3
	.word	0xe4266000	! t0_kref+0x1224:   	st	%l2, [%i1]
	.word	0x3d800001	! t0_kref+0x1228:   	fbule,a	_kref+0x122c
	.word	0xd8f75018	! t0_kref+0x122c:   	stxa	%o4, [%i5 + %i0]0x80
	.word	0x3c480003	! t0_kref+0x1230:   	bpos,a,pt	%icc, _kref+0x123c
	.word	0xa5a00146	! t0_kref+0x1234:   	fabsd	%f6, %f18
	.word	0x20480003	! t0_kref+0x1238:   	bn,a,pt	%icc, _kref+0x1244
	.word	0xea30a020	! t0_kref+0x123c:   	sth	%l5, [%g2 + 0x20]
	.word	0x20800004	! t0_kref+0x1240:   	bn,a	_kref+0x1250
	.word	0xe4fe501c	! t0_kref+0x1244:   	swapa	[%i1 + %i4]0x80, %l2
	.word	0xc07f0018	! t0_kref+0x1248:   	swap	[%i4 + %i0], %g0
	.word	0x961d2704	! t0_kref+0x124c:   	xor	%l4, 0x704, %o3
	.word	0xd856c018	! t0_kref+0x1250:   	ldsh	[%i3 + %i0], %o4
	.word	0x811b75ec	! t0_kref+0x1254:   	tsubcctv	%o5, -0xa14, %g0
	.word	0x9834772a	! t0_kref+0x1258:   	orn	%l1, -0x8d6, %o4
	.word	0x112c88ed	! t0_kref+0x125c:   	sethi	%hi(0xb223b400), %o0
	.word	0xa5b0875c	! t0_kref+0x1260:   	fpack32	%f2, %f28, %f18
	.word	0xd4d6501b	! t0_kref+0x1264:   	ldsha	[%i1 + %i3]0x80, %o2
	.word	0x921abea8	! t0_kref+0x1268:   	xor	%o2, -0x158, %o1
	.word	0xb5a60848	! t0_kref+0x126c:   	faddd	%f24, %f8, %f26
	.word	0xdace1000	! t0_kref+0x1270:   	ldsba	[%i0]0x80, %o5
	.word	0xed6e401b	! t0_kref+0x1274:   	prefetch	%i1 + %i3, 22
	.word	0xb5b38918	! t0_kref+0x1278:   	faligndata	%f14, %f24, %f26
	.word	0xb1a01a4c	! t0_kref+0x127c:   	fdtoi	%f12, %f24
	.word	0xe9ee501d	! t0_kref+0x1280:   	prefetcha	%i1 + %i5, 20
	.word	0xa1a0193a	! t0_kref+0x1284:   	fstod	%f26, %f16
	.word	0x9f003e26	! t0_kref+0x1288:   	taddcc	%g0, -0x1da, %o7
	.word	0xe67f0019	! t0_kref+0x128c:   	swap	[%i4 + %i1], %l3
	.word	0x94802b5c	! t0_kref+0x1290:   	addcc	%g0, 0xb5c, %o2
	.word	0x9ed37fff	! t0_kref+0x1294:   	umulcc	%o5, -0x1, %o7
	.word	0xafa018d8	! t0_kref+0x1298:   	fdtos	%f24, %f23
	.word	0x2d480004	! t0_kref+0x129c:   	fbg,a,pt	%fcc0, _kref+0x12ac
	.word	0xde56200e	! t0_kref+0x12a0:   	ldsh	[%i0 + 0xe], %o7
	.word	0x2c800003	! t0_kref+0x12a4:   	bneg,a	_kref+0x12b0
	.word	0xd6563ff0	! t0_kref+0x12a8:   	ldsh	[%i0 - 0x10], %o3
	.word	0xaba01a4c	! t0_kref+0x12ac:   	fdtoi	%f12, %f21
	.word	0xa9b58e12	! t0_kref+0x12b0:   	fand	%f22, %f18, %f20
	.word	0x985e800d	! t0_kref+0x12b4:   	smul	%i2, %o5, %o4
	.word	0x2f34a5a2	! t0_kref+0x12b8:   	sethi	%hi(0xd2968800), %l7
	.word	0x98e68014	! t0_kref+0x12bc:   	subccc	%i2, %l4, %o4
	.word	0x9665c000	! t0_kref+0x12c0:   	subc	%l7, %g0, %o3
	.word	0x9eb57f86	! t0_kref+0x12c4:   	orncc	%l5, -0x7a, %o7
	.word	0x2f1bf4be	! t0_kref+0x12c8:   	sethi	%hi(0x6fd2f800), %l7
	.word	0x927afab9	! t0_kref+0x12cc:   	sdiv	%o3, -0x547, %o1
	.word	0x94640017	! t0_kref+0x12d0:   	subc	%l0, %l7, %o2
	call	SYM(t0_subr3)
	.word	0x81b50151	! t0_kref+0x12d8:   	edge32l	%l4, %l1, %g0
	.word	0x9db286cc	! t0_kref+0x12dc:   	fmul8sux16	%f10, %f12, %f14
	.word	0x21800008	! t0_kref+0x12e0:   	fbn,a	_kref+0x1300
	.word	0x927a8008	! t0_kref+0x12e4:   	sdiv	%o2, %o0, %o1
	.word	0x3f480004	! t0_kref+0x12e8:   	fbo,a,pt	%fcc0, _kref+0x12f8
	.word	0xc76e3ff8	! t0_kref+0x12ec:   	prefetch	%i0 - 8, 3
	.word	0x29480006	! t0_kref+0x12f0:   	fbl,a,pt	%fcc0, _kref+0x1308
	.word	0xa1a0055c	! t0_kref+0x12f4:   	fsqrtd	%f28, %f16
	.word	0xb1b70ed2	! t0_kref+0x12f8:   	fornot2	%f28, %f18, %f24
	.word	0x80823411	! t0_kref+0x12fc:   	addcc	%o0, -0xbef, %g0
	.word	0xae7ea5e4	! t0_kref+0x1300:   	sdiv	%i2, 0x5e4, %l7
	.word	0x9f60c014	! t0_kref+0x1304:   	movul	%fcc0, %l4, %o7
	.word	0xefee101b	! t0_kref+0x1308:   	prefetcha	%i0 + %i3, 23
	.word	0x2d480003	! t0_kref+0x130c:   	fbg,a,pt	%fcc0, _kref+0x1318
	.word	0xeaae1000	! t0_kref+0x1310:   	stba	%l5, [%i0]0x80
	.word	0x98856a72	! t0_kref+0x1314:   	addcc	%l5, 0xa72, %o4
	.word	0x3a800006	! t0_kref+0x1318:   	bcc,a	_kref+0x1330
	.word	0xe51fbdd0	! t0_kref+0x131c:   	ldd	[%fp - 0x230], %f18
	.word	0x9322400b	! t0_kref+0x1320:   	mulscc	%o1, %o3, %o1
	.word	0x9fa01a21	! t0_kref+0x1324:   	fstoi	%f1, %f15
	.word	0x9a2d0013	! t0_kref+0x1328:   	andn	%l4, %l3, %o5
	.word	0x971cc014	! t0_kref+0x132c:   	tsubcctv	%l3, %l4, %o3
	.word	0xe67e001c	! t0_kref+0x1330:   	swap	[%i0 + %i4], %l3
	call	SYM(t0_subr2)
	.word	0xafb54090	! t0_kref+0x1338:   	edge16	%l5, %l0, %l7
	.word	0x933a6017	! t0_kref+0x133c:   	sra	%o1, 0x17, %o1
	.word	0x9db00fc0	! t0_kref+0x1340:   	fone	%f14
	.word	0x93a1c827	! t0_kref+0x1344:   	fadds	%f7, %f7, %f9
	.word	0x9f243c4d	! t0_kref+0x1348:   	mulscc	%l0, -0x3b3, %o7
	.word	0x81a9ca26	! t0_kref+0x134c:   	fcmps	%fcc0, %f7, %f6
	.word	0xa1a0054a	! t0_kref+0x1350:   	fsqrtd	%f10, %f16
	.word	0x27480004	! t0_kref+0x1354:   	fbul,a,pt	%fcc0, _kref+0x1364
	.word	0x9db08e48	! t0_kref+0x1358:   	fxnor	%f2, %f8, %f14
	.word	0x97b20050	! t0_kref+0x135c:   	edge8l	%o0, %l0, %o3
	.word	0xe06e3ff8	! t0_kref+0x1360:   	ldstub	[%i0 - 8], %l0
	.word	0xada01a44	! t0_kref+0x1364:   	fdtoi	%f4, %f22
	.word	0xaba0013c	! t0_kref+0x1368:   	fabss	%f28, %f21
	.word	0x2b480007	! t0_kref+0x136c:   	fbug,a,pt	%fcc0, _kref+0x1388
	.word	0x85a01114	! t0_kref+0x1370:   	fxtod	%f20, %f2
	.word	0x21480001	! t0_kref+0x1374:   	fbn,a,pt	%fcc0, _kref+0x1378
	.word	0x9ba0109c	! t0_kref+0x1378:   	fxtos	%f28, %f13
	.word	0xf207bfe0	! t0_kref+0x137c:   	ld	[%fp - 0x20], %i1
	.word	0x33480004	! t0_kref+0x1380:   	fbe,a,pt	%fcc0, _kref+0x1390
	.word	0x9263000b	! t0_kref+0x1384:   	subc	%o4, %o3, %o1
	.word	0xae90000b	! t0_kref+0x1388:   	orcc	%g0, %o3, %l7
	.word	0x9da00556	! t0_kref+0x138c:   	fsqrtd	%f22, %f14
	.word	0xc00e4000	! t0_kref+0x1390:   	ldub	[%i1], %g0
	.word	0xc168a087	! t0_kref+0x1394:   	prefetch	%g2 + 0x87, 0
	.word	0x9b35201f	! t0_kref+0x1398:   	srl	%l4, 0x1f, %o5
	.word	0xea20a018	! t0_kref+0x139c:   	st	%l5, [%g2 + 0x18]
	.word	0x81dcf98f	! t0_kref+0x13a0:   	flush	%l3 - 0x671
	.word	0x25800006	! t0_kref+0x13a4:   	fblg,a	_kref+0x13bc
	.word	0x94bcc012	! t0_kref+0x13a8:   	xnorcc	%l3, %l2, %o2
	.word	0xda0e3fe5	! t0_kref+0x13ac:   	ldub	[%i0 - 0x1b], %o5
	.word	0xde0e6013	! t0_kref+0x13b0:   	ldub	[%i1 + 0x13], %o7
	.word	0x9ebd4008	! t0_kref+0x13b4:   	xnorcc	%l5, %o0, %o7
	.word	0xa9b70d00	! t0_kref+0x13b8:   	fandnot1	%f28, %f0, %f20
	.word	0x32480008	! t0_kref+0x13bc:   	bne,a,pt	%icc, _kref+0x13dc
	.word	0xc00e2002	! t0_kref+0x13c0:   	ldub	[%i0 + 2], %g0
	.word	0xe076001d	! t0_kref+0x13c4:   	stx	%l0, [%i0 + %i5]
	.word	0xe830a002	! t0_kref+0x13c8:   	sth	%l4, [%g2 + 2]
	.word	0x9da000a3	! t0_kref+0x13cc:   	fnegs	%f3, %f14
	.word	0xa5b44d60	! t0_kref+0x13d0:   	fnot1s	%f17, %f18
	.word	0xa1a089c6	! t0_kref+0x13d4:   	fdivd	%f2, %f6, %f16
	.word	0x20800001	! t0_kref+0x13d8:   	bn,a	_kref+0x13dc
	.word	0x94b5ae5a	! t0_kref+0x13dc:   	orncc	%l6, 0xe5a, %o2
	.word	0x99a01034	! t0_kref+0x13e0:   	fstox	%f20, %f12
	.word	0x3b800001	! t0_kref+0x13e4:   	fble,a	_kref+0x13e8
	.word	0x90556f30	! t0_kref+0x13e8:   	umul	%l5, 0xf30, %o0
	.word	0x968d0012	! t0_kref+0x13ec:   	andcc	%l4, %l2, %o3
	.word	0x803ebf23	! t0_kref+0x13f0:   	xnor	%i2, -0xdd, %g0
	.word	0x22800004	! t0_kref+0x13f4:   	be,a	_kref+0x1404
	.word	0x9524800d	! t0_kref+0x13f8:   	mulscc	%l2, %o5, %o2
	.word	0x3b800008	! t0_kref+0x13fc:   	fble,a	_kref+0x141c
	.word	0x1324144d	! t0_kref+0x1400:   	sethi	%hi(0x90513400), %o1
	.word	0x97b580d3	! t0_kref+0x1404:   	edge16l	%l6, %l3, %o3
	.word	0x30480001	! t0_kref+0x1408:   	ba,a,pt	%icc, _kref+0x140c
	.word	0x97b68aa9	! t0_kref+0x140c:   	fpsub16s	%f26, %f9, %f11
	.word	0x2e800006	! t0_kref+0x1410:   	bvs,a	_kref+0x1428
	.word	0x92122338	! t0_kref+0x1414:   	or	%o0, 0x338, %o1
	.word	0x95a01a28	! t0_kref+0x1418:   	fstoi	%f8, %f10
	.word	0x95a018d4	! t0_kref+0x141c:   	fdtos	%f20, %f10
	.word	0x811c4014	! t0_kref+0x1420:   	tsubcctv	%l1, %l4, %g0
	.word	0x33800002	! t0_kref+0x1424:   	fbe,a	_kref+0x142c
	.word	0xee36c018	! t0_kref+0x1428:   	sth	%l7, [%i3 + %i0]
	.word	0xe020a004	! t0_kref+0x142c:   	st	%l0, [%g2 + 4]
	.word	0x9db18c58	! t0_kref+0x1430:   	fnor	%f6, %f24, %f14
	.word	0xaefc8009	! t0_kref+0x1434:   	sdivcc	%l2, %o1, %l7
	.word	0xe81e401d	! t0_kref+0x1438:   	ldd	[%i1 + %i5], %l4
	.word	0x81a01934	! t0_kref+0x143c:   	fstod	%f20, %f0
	.word	0xae7aaf59	! t0_kref+0x1440:   	sdiv	%o2, 0xf59, %l7
	.word	0xae142ccf	! t0_kref+0x1444:   	or	%l0, 0xccf, %l7
	.word	0x26800004	! t0_kref+0x1448:   	bl,a	_kref+0x1458
	.word	0x9e523c99	! t0_kref+0x144c:   	umul	%o0, -0x367, %o7
	.word	0x97b44348	! t0_kref+0x1450:   	alignaddrl	%l1, %o0, %o3
	.word	0xeb68a04e	! t0_kref+0x1454:   	prefetch	%g2 + 0x4e, 21
	.word	0x9e65f33a	! t0_kref+0x1458:   	subc	%l7, -0xcc6, %o7
	.word	0x9add7b08	! t0_kref+0x145c:   	smulcc	%l5, -0x4f8, %o5
	.word	0xa5b00f88	! t0_kref+0x1460:   	for	%f0, %f8, %f18
	.word	0xa9a449ae	! t0_kref+0x1464:   	fdivs	%f17, %f14, %f20
	.word	0x011f2510	! t0_kref+0x1468:   	sethi	%hi(0x7c944000), %g0
	.word	0xd6360000	! t0_kref+0x146c:   	sth	%o3, [%i0]
	.word	0x992da00d	! t0_kref+0x1470:   	sll	%l6, 0xd, %o4
	.word	0xb3a649b4	! t0_kref+0x1474:   	fdivs	%f25, %f20, %f25
	.word	0x973d400c	! t0_kref+0x1478:   	sra	%l5, %o4, %o3
	.word	0xe1e61015	! t0_kref+0x147c:   	casa	[%i0]0x80, %l5, %l0
	.word	0x92a2400c	! t0_kref+0x1480:   	subcc	%o1, %o4, %o1
	.word	0xbba00531	! t0_kref+0x1484:   	fsqrts	%f17, %f29
	.word	0xd208a02b	! t0_kref+0x1488:   	ldub	[%g2 + 0x2b], %o1
	.word	0xa1b68902	! t0_kref+0x148c:   	faligndata	%f26, %f2, %f16
	.word	0xe53f4018	! t0_kref+0x1490:   	std	%f18, [%i5 + %i0]
	.word	0x905225cf	! t0_kref+0x1494:   	umul	%o0, 0x5cf, %o0
	.word	0x981ac017	! t0_kref+0x1498:   	xor	%o3, %l7, %o4
	.word	0x36480005	! t0_kref+0x149c:   	bge,a,pt	%icc, _kref+0x14b0
	.word	0x94648010	! t0_kref+0x14a0:   	subc	%l2, %l0, %o2
	.word	0x81830000	! t0_kref+0x14a4:   	wr	%o4, %g0, %y
	.word	0x28480007	! t0_kref+0x14a8:   	bleu,a,pt	%icc, _kref+0x14c4
	.word	0xd256001b	! t0_kref+0x14ac:   	ldsh	[%i0 + %i3], %o1
	.word	0x29800003	! t0_kref+0x14b0:   	fbl,a	_kref+0x14bc
	.word	0xa5a01050	! t0_kref+0x14b4:   	fdtox	%f16, %f18
	.word	0x2d800006	! t0_kref+0x14b8:   	fbg,a	_kref+0x14d0
	.word	0x949e801a	! t0_kref+0x14bc:   	xorcc	%i2, %i2, %o2
	.word	0x952c0010	! t0_kref+0x14c0:   	sll	%l0, %l0, %o2
	.word	0x9266b745	! t0_kref+0x14c4:   	subc	%i2, -0x8bb, %o1
	.word	0x94ac4011	! t0_kref+0x14c8:   	andncc	%l1, %l1, %o2
	.word	0x2c800008	! t0_kref+0x14cc:   	bneg,a	_kref+0x14ec
	.word	0x95a00532	! t0_kref+0x14d0:   	fsqrts	%f18, %f10
	.word	0xde865000	! t0_kref+0x14d4:   	lda	[%i1]0x80, %o7
	.word	0x81858000	! t0_kref+0x14d8:   	wr	%l6, %g0, %y
	.word	0x33480005	! t0_kref+0x14dc:   	fbe,a,pt	%fcc0, _kref+0x14f0
	.word	0xaf2c401a	! t0_kref+0x14e0:   	sll	%l1, %i2, %l7
	.word	0x99aa804c	! t0_kref+0x14e4:   	fmovdue	%fcc0, %f12, %f12
	.word	0xa9a01919	! t0_kref+0x14e8:   	fitod	%f25, %f20
	.word	0xd808a038	! t0_kref+0x14ec:   	ldub	[%g2 + 0x38], %o4
	.word	0x932b200c	! t0_kref+0x14f0:   	sll	%o4, 0xc, %o1
	.word	0x8112000d	! t0_kref+0x14f4:   	taddcctv	%o0, %o5, %g0
	.word	0x37480008	! t0_kref+0x14f8:   	fbge,a,pt	%fcc0, _kref+0x1518
	.word	0xeab6101b	! t0_kref+0x14fc:   	stha	%l5, [%i0 + %i3]0x80
	.word	0x96fa8010	! t0_kref+0x1500:   	sdivcc	%o2, %l0, %o3
	.word	0x38480006	! t0_kref+0x1504:   	bgu,a,pt	%icc, _kref+0x151c
	.word	0x9635000a	! t0_kref+0x1508:   	orn	%l4, %o2, %o3
	.word	0xda28a019	! t0_kref+0x150c:   	stb	%o5, [%g2 + 0x19]
	.word	0x81ab0a4e	! t0_kref+0x1510:   	fcmpd	%fcc0, %f12, %f14
	.word	0x9a5de249	! t0_kref+0x1514:   	smul	%l7, 0x249, %o5
	.word	0xd60e6010	! t0_kref+0x1518:   	ldub	[%i1 + 0x10], %o3
	.word	0x90656152	! t0_kref+0x151c:   	subc	%l5, 0x152, %o0
	.word	0xef68a00c	! t0_kref+0x1520:   	prefetch	%g2 + 0xc, 23
	.word	0x90846449	! t0_kref+0x1524:   	addcc	%l1, 0x449, %o0
	.word	0x81dd23a4	! t0_kref+0x1528:   	flush	%l4 + 0x3a4
	.word	0x9a1de28d	! t0_kref+0x152c:   	xor	%l7, 0x28d, %o5
	.word	0xd67e001c	! t0_kref+0x1530:   	swap	[%i0 + %i4], %o3
	.word	0xd24e2003	! t0_kref+0x1534:   	ldsb	[%i0 + 3], %o1
	.word	0xec180018	! t0_kref+0x1538:   	ldd	[%g0 + %i0], %l6
	call	SYM(t0_subr0)
	.word	0x9bb5812b	! t0_kref+0x1540:   	edge32n	%l6, %o3, %o5
	.word	0xada01905	! t0_kref+0x1544:   	fitod	%f5, %f22
	.word	0x85b48c54	! t0_kref+0x1548:   	fnor	%f18, %f20, %f2
	.word	0x980a23f6	! t0_kref+0x154c:   	and	%o0, 0x3f6, %o4
	.word	0x81b40482	! t0_kref+0x1550:   	fcmple32	%f16, %f2, %g0
	.word	0x31800003	! t0_kref+0x1554:   	fba,a	_kref+0x1560
	.word	0x9f200014	! t0_kref+0x1558:   	mulscc	%g0, %l4, %o7
	.word	0xa9b70982	! t0_kref+0x155c:   	bshuffle	%f28, %f2, %f20
	.word	0x85b007ae	! t0_kref+0x1560:   	fpackfix	%f14, %f2
	.word	0x93a01a28	! t0_kref+0x1564:   	fstoi	%f8, %f9
	.word	0x992a0008	! t0_kref+0x1568:   	sll	%o0, %o0, %o4
	.word	0x9da01a5c	! t0_kref+0x156c:   	fdtoi	%f28, %f14
	.word	0x9e64334e	! t0_kref+0x1570:   	subc	%l0, -0xcb2, %o7
	.word	0x80bb2ebe	! t0_kref+0x1574:   	xnorcc	%o4, 0xebe, %g0
	.word	0xec262018	! t0_kref+0x1578:   	st	%l6, [%i0 + 0x18]
	.word	0x36480001	! t0_kref+0x157c:   	bge,a,pt	%icc, _kref+0x1580
	.word	0xc568a089	! t0_kref+0x1580:   	prefetch	%g2 + 0x89, 2
	.word	0xf4ae101a	! t0_kref+0x1584:   	stba	%i2, [%i0 + %i2]0x80
	.word	0xc00e8019	! t0_kref+0x1588:   	ldub	[%i2 + %i1], %g0
	.word	0x985e800b	! t0_kref+0x158c:   	smul	%i2, %o3, %o4
	.word	0x809a4017	! t0_kref+0x1590:   	xorcc	%o1, %l7, %g0
	.word	0x83a3082a	! t0_kref+0x1594:   	fadds	%f12, %f10, %f1
	.word	0x2e480008	! t0_kref+0x1598:   	bvs,a,pt	%icc, _kref+0x15b8
	.word	0x81830000	! t0_kref+0x159c:   	wr	%o4, %g0, %y
	.word	0x9a1dc013	! t0_kref+0x15a0:   	xor	%l7, %l3, %o5
	.word	0xc900a01c	! t0_kref+0x15a4:   	ld	[%g2 + 0x1c], %f4
	.word	0xaba01a2e	! t0_kref+0x15a8:   	fstoi	%f14, %f21
	.word	0xd27e2014	! t0_kref+0x15ac:   	swap	[%i0 + 0x14], %o1
	.word	0x19161c7c	! t0_kref+0x15b0:   	sethi	%hi(0x5871f000), %o4
	.word	0xb5a01a46	! t0_kref+0x15b4:   	fdtoi	%f6, %f26
	call	SYM(t0_subr3)
	.word	0xe2e81018	! t0_kref+0x15bc:   	ldstuba	[%g0 + %i0]0x80, %l1
	.word	0x81a01905	! t0_kref+0x15c0:   	fitod	%f5, %f0
	.word	0x9ec36b6f	! t0_kref+0x15c4:   	addccc	%o5, 0xb6f, %o7
	.word	0xa1b00c20	! t0_kref+0x15c8:   	fzeros	%f16
	.word	0xc9ee5011	! t0_kref+0x15cc:   	prefetcha	%i1 + %l1, 4
	.word	0x80db0016	! t0_kref+0x15d0:   	smulcc	%o4, %l6, %g0
	.word	0x81830000	! t0_kref+0x15d4:   	wr	%o4, %g0, %y
	.word	0x9a5ceded	! t0_kref+0x15d8:   	smul	%l3, 0xded, %o5
	.word	0xee0e001a	! t0_kref+0x15dc:   	ldub	[%i0 + %i2], %l7
	.word	0x32480006	! t0_kref+0x15e0:   	bne,a,pt	%icc, _kref+0x15f8
	.word	0x90d2a2f3	! t0_kref+0x15e4:   	umulcc	%o2, 0x2f3, %o0
	.word	0xded81019	! t0_kref+0x15e8:   	ldxa	[%g0 + %i1]0x80, %o7
	.word	0x9fa018d8	! t0_kref+0x15ec:   	fdtos	%f24, %f15
	.word	0x35480005	! t0_kref+0x15f0:   	fbue,a,pt	%fcc0, _kref+0x1604
	.word	0x9ed23729	! t0_kref+0x15f4:   	umulcc	%o0, -0x8d7, %o7
	.word	0xc1be5a5d	! t0_kref+0x15f8:   	stda	%f0, [%i1 + %i5]0xd2
	.word	0x929cba14	! t0_kref+0x15fc:   	xorcc	%l2, -0x5ec, %o1
	.word	0xd0d01019	! t0_kref+0x1600:   	ldsha	[%g0 + %i1]0x80, %o0
	.word	0x91b30410	! t0_kref+0x1604:   	fcmple16	%f12, %f16, %o0
	.word	0xf91fbfa8	! t0_kref+0x1608:   	ldd	[%fp - 0x58], %f28
	.word	0x9e2da46f	! t0_kref+0x160c:   	andn	%l6, 0x46f, %o7
	.word	0x9a7d642e	! t0_kref+0x1610:   	sdiv	%l5, 0x42e, %o5
	.word	0xc0280019	! t0_kref+0x1614:   	clrb	[%g0 + %i1]
	.word	0x99a20854	! t0_kref+0x1618:   	faddd	%f8, %f20, %f12
	.word	0x99b18af8	! t0_kref+0x161c:   	fpsub32s	%f6, %f24, %f12
	.word	0xed1fbcb0	! t0_kref+0x1620:   	ldd	[%fp - 0x350], %f22
	.word	0x81ac0a52	! t0_kref+0x1624:   	fcmpd	%fcc0, %f16, %f18
	.word	0x2c800006	! t0_kref+0x1628:   	bneg,a	_kref+0x1640
	.word	0xada0102c	! t0_kref+0x162c:   	fstox	%f12, %f22
	.word	0xe9beda18	! t0_kref+0x1630:   	stda	%f20, [%i3 + %i0]0xd0
	.word	0x81a01114	! t0_kref+0x1634:   	fxtod	%f20, %f0
	.word	0xd04e2017	! t0_kref+0x1638:   	ldsb	[%i0 + 0x17], %o0
	.word	0x80056eea	! t0_kref+0x163c:   	add	%l5, 0xeea, %g0
	.word	0x9fb1848a	! t0_kref+0x1640:   	fcmple32	%f6, %f10, %o7
	call	1f
	.empty
	.word	0x92d2c008	! t0_kref+0x1648:   	umulcc	%o3, %o0, %o1
	.word	0xee78a018	! t0_kref+0x164c:   	swap	[%g2 + 0x18], %l7
	.word	0x28800005	! t0_kref+0x1650:   	bleu,a	_kref+0x1664
	.word	0x9db48f90	! t0_kref+0x1654:   	for	%f18, %f16, %f14
	.word	0xec6e200e	! t0_kref+0x1658:   	ldstub	[%i0 + 0xe], %l6
	.word	0xd896d019	! t0_kref+0x165c:   	lduha	[%i3 + %i1]0x80, %o4
1:	.word	0x9e2dfc28	! t0_kref+0x1660:   	andn	%l7, -0x3d8, %o7
	.word	0x39800003	! t0_kref+0x1664:   	fbuge,a	_kref+0x1670
	.word	0x91254000	! t0_kref+0x1668:   	mulscc	%l5, %g0, %o0
	.word	0x31800006	! t0_kref+0x166c:   	fba,a	_kref+0x1684
	.word	0x932d600f	! t0_kref+0x1670:   	sll	%l5, 0xf, %o1
	.word	0x90d40000	! t0_kref+0x1674:   	umulcc	%l0, %g0, %o0
	.word	0x809c0009	! t0_kref+0x1678:   	xorcc	%l0, %o1, %g0
	.word	0xa9b30dd8	! t0_kref+0x167c:   	fnand	%f12, %f24, %f20
	.word	0x3b800006	! t0_kref+0x1680:   	fble,a	_kref+0x1698
	.word	0xa3a01a2e	! t0_kref+0x1684:   	fstoi	%f14, %f17
	.word	0xadb68ea0	! t0_kref+0x1688:   	fsrc1s	%f26, %f22
	.word	0xd80e401a	! t0_kref+0x168c:   	ldub	[%i1 + %i2], %o4
	.word	0xec2e401a	! t0_kref+0x1690:   	stb	%l6, [%i1 + %i2]
	.word	0x90fc800c	! t0_kref+0x1694:   	sdivcc	%l2, %o4, %o0
	.word	0xc04e200e	! t0_kref+0x1698:   	ldsb	[%i0 + 0xe], %g0
	.word	0x96fc8008	! t0_kref+0x169c:   	sdivcc	%l2, %o0, %o3
	.word	0x81b30280	! t0_kref+0x16a0:   	array32	%o4, %g0, %g0
	.word	0x2c800003	! t0_kref+0x16a4:   	bneg,a	_kref+0x16b0
	.word	0x8ba348b7	! t0_kref+0x16a8:   	fsubs	%f13, %f23, %f5
	.word	0x9aaac008	! t0_kref+0x16ac:   	andncc	%o3, %o0, %o5
	.word	0x9e9c3a49	! t0_kref+0x16b0:   	xorcc	%l0, -0x5b7, %o7
	.word	0x36800008	! t0_kref+0x16b4:   	bge,a	_kref+0x16d4
	.word	0xf207bfe0	! t0_kref+0x16b8:   	ld	[%fp - 0x20], %i1
	.word	0x20480004	! t0_kref+0x16bc:   	bn,a,pt	%icc, _kref+0x16cc
	.word	0x90380016	! t0_kref+0x16c0:   	xnor	%g0, %l6, %o0
	.word	0x8170255c	! t0_kref+0x16c4:   	popc	0x55c, %g0
	.word	0xa1a00550	! t0_kref+0x16c8:   	fsqrtd	%f16, %f16
	.word	0x9a5028f6	! t0_kref+0x16cc:   	umul	%g0, 0x8f6, %o5
	.word	0x85b44aeb	! t0_kref+0x16d0:   	fpsub32s	%f17, %f11, %f2
	.word	0x9ad5c016	! t0_kref+0x16d4:   	umulcc	%l7, %l6, %o5
	.word	0xed062008	! t0_kref+0x16d8:   	ld	[%i0 + 8], %f22
	.word	0x8fa5c82b	! t0_kref+0x16dc:   	fadds	%f23, %f11, %f7
	.word	0xb5b406aa	! t0_kref+0x16e0:   	fmul8x16al	%f16, %f10, %f26
	.word	0x81580000	! t0_kref+0x16e4:   	flushw
	.word	0xe19e5a1d	! t0_kref+0x16e8:   	ldda	[%i1 + %i5]0xd0, %f16
	.word	0xebe6501a	! t0_kref+0x16ec:   	casa	[%i1]0x80, %i2, %l5
	.word	0x20800002	! t0_kref+0x16f0:   	bn,a	_kref+0x16f8
	.word	0x9a7ae391	! t0_kref+0x16f4:   	sdiv	%o3, 0x391, %o5
	.word	0xe81e401d	! t0_kref+0x16f8:   	ldd	[%i1 + %i5], %l4
	.word	0xd3266000	! t0_kref+0x16fc:   	st	%f9, [%i1]
	.word	0xc279627c	! t0_kref+0x1700:   	swap	[%g5 + 0x27c], %g1
	.word	0xdece5000	! t0_kref+0x1704:   	ldsba	[%i1]0x80, %o7
	.word	0xcd1fbd20	! t0_kref+0x1708:   	ldd	[%fp - 0x2e0], %f6
	.word	0xd80e3ffb	! t0_kref+0x170c:   	ldub	[%i0 - 5], %o4
	.word	0xd51fbc68	! t0_kref+0x1710:   	ldd	[%fp - 0x398], %f10
	.word	0xd03e001d	! t0_kref+0x1714:   	std	%o0, [%i0 + %i5]
	.word	0xa9a58837	! t0_kref+0x1718:   	fadds	%f22, %f23, %f20
	.word	0xec1e6018	! t0_kref+0x171c:   	ldd	[%i1 + 0x18], %l6
	.word	0x9ba00525	! t0_kref+0x1720:   	fsqrts	%f5, %f13
	.word	0x96a50013	! t0_kref+0x1724:   	subcc	%l4, %l3, %o3
	.word	0x90da4009	! t0_kref+0x1728:   	smulcc	%o1, %o1, %o0
	.word	0x9e32c014	! t0_kref+0x172c:   	orn	%o3, %l4, %o7
	.word	0xaf2c800a	! t0_kref+0x1730:   	sll	%l2, %o2, %l7
	.word	0xae30209b	! t0_kref+0x1734:   	orn	%g0, 0x9b, %l7
	.word	0xd03e6018	! t0_kref+0x1738:   	std	%o0, [%i1 + 0x18]
	.word	0x89a50d27	! t0_kref+0x173c:   	fsmuld	%f20, %f7, %f4
	.word	0xc7ee5013	! t0_kref+0x1740:   	prefetcha	%i1 + %l3, 3
	.word	0x81824000	! t0_kref+0x1744:   	wr	%o1, %g0, %y
	.word	0xd86e201a	! t0_kref+0x1748:   	ldstub	[%i0 + 0x1a], %o4
	.word	0x972b2009	! t0_kref+0x174c:   	sll	%o4, 0x9, %o3
	.word	0x80a50017	! t0_kref+0x1750:   	cmp	%l4, %l7
	.word	0xf56e001a	! t0_kref+0x1754:   	prefetch	%i0 + %i2, 26
	.word	0x81ab8ad8	! t0_kref+0x1758:   	fcmped	%fcc0, %f14, %f24
	.word	0x93400000	! t0_kref+0x175c:   	mov	%y, %o1
	.word	0xc050a028	! t0_kref+0x1760:   	ldsh	[%g2 + 0x28], %g0
	.word	0x98bac00c	! t0_kref+0x1764:   	xnorcc	%o3, %o4, %o4
	.word	0x81aa8a4c	! t0_kref+0x1768:   	fcmpd	%fcc0, %f10, %f12
	.word	0x8124e122	! t0_kref+0x176c:   	mulscc	%l3, 0x122, %g0
	.word	0x91b38a02	! t0_kref+0x1770:   	fpadd16	%f14, %f2, %f8
	.word	0x8da0054e	! t0_kref+0x1774:   	fsqrtd	%f14, %f6
	.word	0x3d800006	! t0_kref+0x1778:   	fbule,a	_kref+0x1790
	.word	0xae8c7189	! t0_kref+0x177c:   	andcc	%l1, -0xe77, %l7
	.word	0x91a0054a	! t0_kref+0x1780:   	fsqrtd	%f10, %f8
	.word	0x20800001	! t0_kref+0x1784:   	bn,a	_kref+0x1788
	.word	0x967b635b	! t0_kref+0x1788:   	sdiv	%o5, 0x35b, %o3
	.word	0xf19e1a1d	! t0_kref+0x178c:   	ldda	[%i0 + %i5]0xd0, %f24
	.word	0xe51fbf50	! t0_kref+0x1790:   	ldd	[%fp - 0xb0], %f18
	.word	0x9662c011	! t0_kref+0x1794:   	subc	%o3, %l1, %o3
	.word	0xc12e001c	! t0_kref+0x1798:   	st	%fsr, [%i0 + %i4]
	.word	0xc7067ffc	! t0_kref+0x179c:   	ld	[%i1 - 4], %f3
	.word	0xee865000	! t0_kref+0x17a0:   	lda	[%i1]0x80, %l7
	.word	0xa5a488b0	! t0_kref+0x17a4:   	fsubs	%f18, %f16, %f18
	.word	0xea2e8018	! t0_kref+0x17a8:   	stb	%l5, [%i2 + %i0]
	.word	0xa1a28927	! t0_kref+0x17ac:   	fmuls	%f10, %f7, %f16
	.word	0x97b68e29	! t0_kref+0x17b0:   	fands	%f26, %f9, %f11
	.word	0xb9a0c935	! t0_kref+0x17b4:   	fmuls	%f3, %f21, %f28
	.word	0xdbe6501a	! t0_kref+0x17b8:   	casa	[%i1]0x80, %i2, %o5
	.word	0x36480006	! t0_kref+0x17bc:   	bge,a,pt	%icc, _kref+0x17d4
	.word	0x8bb00c20	! t0_kref+0x17c0:   	fzeros	%f5
	.word	0x9fc10000	! t0_kref+0x17c4:   	call	%g4
	.word	0x91b30100	! t0_kref+0x17c8:   	edge32	%o4, %g0, %o0
	.word	0xf5396c78	! t0_kref+0x17cc:   	std	%f26, [%g5 + 0xc78]
	.word	0x90344015	! t0_kref+0x17d0:   	orn	%l1, %l5, %o0
	.word	0xe8767fe0	! t0_kref+0x17d4:   	stx	%l4, [%i1 - 0x20]
	.word	0x801eb11e	! t0_kref+0x17d8:   	xor	%i2, -0xee2, %g0
	.word	0x99a589c6	! t0_kref+0x17dc:   	fdivd	%f22, %f6, %f12
	.word	0x81da72aa	! t0_kref+0x17e0:   	flush	%o1 - 0xd56
	.word	0xc04e001a	! t0_kref+0x17e4:   	ldsb	[%i0 + %i2], %g0
	.word	0x905a3139	! t0_kref+0x17e8:   	smul	%o0, -0xec7, %o0
	.word	0xd2560000	! t0_kref+0x17ec:   	ldsh	[%i0], %o1
	.word	0x22800001	! t0_kref+0x17f0:   	be,a	_kref+0x17f4
	.word	0x94dcc017	! t0_kref+0x17f4:   	smulcc	%l3, %l7, %o2
	.word	0x985b001a	! t0_kref+0x17f8:   	smul	%o4, %i2, %o4
	.word	0x80540012	! t0_kref+0x17fc:   	umul	%l0, %l2, %g0
	.word	0x80b2eabd	! t0_kref+0x1800:   	orncc	%o3, 0xabd, %g0
	.word	0xd500a02c	! t0_kref+0x1804:   	ld	[%g2 + 0x2c], %f10
	.word	0xaf22a37f	! t0_kref+0x1808:   	mulscc	%o2, 0x37f, %l7
	.word	0x9434400d	! t0_kref+0x180c:   	orn	%l1, %o5, %o2
	.word	0x31480004	! t0_kref+0x1810:   	fba,a,pt	%fcc0, _kref+0x1820
	.word	0xa9a0893c	! t0_kref+0x1814:   	fmuls	%f2, %f28, %f20
	.word	0xde0e0000	! t0_kref+0x1818:   	ldub	[%i0], %o7
	.word	0x9fa388ac	! t0_kref+0x181c:   	fsubs	%f14, %f12, %f15
	.word	0x99400000	! t0_kref+0x1820:   	mov	%y, %o4
	.word	0x9f134017	! t0_kref+0x1824:   	taddcctv	%o5, %l7, %o7
	.word	0x32480007	! t0_kref+0x1828:   	bne,a,pt	%icc, _kref+0x1844
	.word	0xda20a02c	! t0_kref+0x182c:   	st	%o5, [%g2 + 0x2c]
	.word	0x91a3885a	! t0_kref+0x1830:   	faddd	%f14, %f26, %f8
	.word	0xada00532	! t0_kref+0x1834:   	fsqrts	%f18, %f22
	.word	0xefee501b	! t0_kref+0x1838:   	prefetcha	%i1 + %i3, 23
	.word	0xb7a01a5c	! t0_kref+0x183c:   	fdtoi	%f28, %f27
	.word	0xe620a02c	! t0_kref+0x1840:   	st	%l3, [%g2 + 0x2c]
	.word	0xef68a04e	! t0_kref+0x1844:   	prefetch	%g2 + 0x4e, 23
	.word	0x9fa3083a	! t0_kref+0x1848:   	fadds	%f12, %f26, %f15
	.word	0x3b480007	! t0_kref+0x184c:   	fble,a,pt	%fcc0, _kref+0x1868
	.word	0x89a000ad	! t0_kref+0x1850:   	fnegs	%f13, %f4
	.word	0xe02e8019	! t0_kref+0x1854:   	stb	%l0, [%i2 + %i1]
	.word	0xe87e3ff8	! t0_kref+0x1858:   	swap	[%i0 - 8], %l4
	.word	0x932ce011	! t0_kref+0x185c:   	sll	%l3, 0x11, %o1
	.word	0x9bb54176	! t0_kref+0x1860:   	edge32ln	%l5, %l6, %o5
	.word	0xc0063ffc	! t0_kref+0x1864:   	ld	[%i0 - 4], %g0
	.word	0xae9b4011	! t0_kref+0x1868:   	xorcc	%o5, %l1, %l7
	.word	0xa1a01a5c	! t0_kref+0x186c:   	fdtoi	%f28, %f16
	.word	0xf9067ffc	! t0_kref+0x1870:   	ld	[%i1 - 4], %f28
	.word	0x9ba01a2f	! t0_kref+0x1874:   	fstoi	%f15, %f13
	.word	0xe76e401c	! t0_kref+0x1878:   	prefetch	%i1 + %i4, 19
	.word	0xd6200019	! t0_kref+0x187c:   	st	%o3, [%g0 + %i1]
	.word	0x9906b41d	! t0_kref+0x1880:   	taddcc	%i2, -0xbe3, %o4
	.word	0xb1a049ac	! t0_kref+0x1884:   	fdivs	%f1, %f12, %f24
	.word	0x9de3bfa0	! t0_kref+0x1888:   	save	%sp, -0x60, %sp
	.word	0x97eec01b	! t0_kref+0x188c:   	restore	%i3, %i3, %o3
	.word	0xe76e401d	! t0_kref+0x1890:   	prefetch	%i1 + %i5, 19
	.word	0xae33000c	! t0_kref+0x1894:   	orn	%o4, %o4, %l7
!	.word	0x3a4a41cb	! t0_kref+0x1898:   	bcc,a,pt	%icc, SYM(t0_subr3)
	   	bcc,a,pt	%icc, SYM(t0_subr3)
	.word	0x9f414000	! t0_kref+0x189c:   	mov	%pc, %o7
	.word	0xc91fbd90	! t0_kref+0x18a0:   	ldd	[%fp - 0x270], %f4
	.word	0xb3a00529	! t0_kref+0x18a4:   	fsqrts	%f9, %f25
	.word	0x81ab8ac2	! t0_kref+0x18a8:   	fcmped	%fcc0, %f14, %f2
	.word	0x3c800001	! t0_kref+0x18ac:   	bpos,a	_kref+0x18b0
	.word	0x81d8401b	! t0_kref+0x18b0:   	flush	%g1 + %i3
	.word	0x93a30923	! t0_kref+0x18b4:   	fmuls	%f12, %f3, %f9
	.word	0x20800002	! t0_kref+0x18b8:   	bn,a	_kref+0x18c0
	.word	0xdd1fbd98	! t0_kref+0x18bc:   	ldd	[%fp - 0x268], %f14
	.word	0xb7a0052c	! t0_kref+0x18c0:   	fsqrts	%f12, %f27
	.word	0x9afd0015	! t0_kref+0x18c4:   	sdivcc	%l4, %l5, %o5
	.word	0xd106001c	! t0_kref+0x18c8:   	ld	[%i0 + %i4], %f8
	.word	0x8033401a	! t0_kref+0x18cc:   	orn	%o5, %i2, %g0
	.word	0x22800007	! t0_kref+0x18d0:   	be,a	_kref+0x18ec
	.word	0xef00a02c	! t0_kref+0x18d4:   	ld	[%g2 + 0x2c], %f23
	.word	0x9aab3e66	! t0_kref+0x18d8:   	andncc	%o4, -0x19a, %o5
	.word	0x95b58e04	! t0_kref+0x18dc:   	fand	%f22, %f4, %f10
	.word	0xe96e401a	! t0_kref+0x18e0:   	prefetch	%i1 + %i2, 20
	.word	0x982b3642	! t0_kref+0x18e4:   	andn	%o4, -0x9be, %o4
	.word	0x9b61e302	! t0_kref+0x18e8:   	movu	%fcc0, 0x302, %o5
	.word	0xb9b30e80	! t0_kref+0x18ec:   	fsrc1	%f12, %f28
	.word	0x9db44710	! t0_kref+0x18f0:   	fmuld8sux16	%f17, %f16, %f14
	.word	0xde480019	! t0_kref+0x18f4:   	ldsb	[%g0 + %i1], %o7
	.word	0xf16e3fe8	! t0_kref+0x18f8:   	prefetch	%i0 - 0x18, 24
	.word	0x91a000b8	! t0_kref+0x18fc:   	fnegs	%f24, %f8
	.word	0xc168a00b	! t0_kref+0x1900:   	prefetch	%g2 + 0xb, 0
	.word	0xd82e0000	! t0_kref+0x1904:   	stb	%o4, [%i0]
	.word	0xd1be588d	! t0_kref+0x1908:   	stda	%f8, [%i1 + %o5]0xc4
	.word	0xd2b61000	! t0_kref+0x190c:   	stha	%o1, [%i0]0x80
	.word	0x906422d8	! t0_kref+0x1910:   	subc	%l0, 0x2d8, %o0
	.word	0x9122c012	! t0_kref+0x1914:   	mulscc	%o3, %l2, %o0
	.word	0x3a480006	! t0_kref+0x1918:   	bcc,a,pt	%icc, _kref+0x1930
	.word	0x92368016	! t0_kref+0x191c:   	orn	%i2, %l6, %o1
	.word	0x9522800a	! t0_kref+0x1920:   	mulscc	%o2, %o2, %o2
	.word	0xe5266004	! t0_kref+0x1924:   	st	%f18, [%i1 + 4]
	.word	0x922dc00c	! t0_kref+0x1928:   	andn	%l7, %o4, %o1
	.word	0xe76e2008	! t0_kref+0x192c:   	prefetch	%i0 + 8, 19
	.word	0x2b800008	! t0_kref+0x1930:   	fbug,a	_kref+0x1950
	.word	0xec3e001d	! t0_kref+0x1934:   	std	%l6, [%i0 + %i5]
	.word	0x96a28011	! t0_kref+0x1938:   	subcc	%o2, %l1, %o3
	.word	0x81aa0ac6	! t0_kref+0x193c:   	fcmped	%fcc0, %f8, %f6
	.word	0x81834000	! t0_kref+0x1940:   	wr	%o5, %g0, %y
	.word	0x94858016	! t0_kref+0x1944:   	addcc	%l6, %l6, %o2
	.word	0xae72ab7d	! t0_kref+0x1948:   	udiv	%o2, 0xb7d, %l7
	.word	0xa3a38927	! t0_kref+0x194c:   	fmuls	%f14, %f7, %f17
	.word	0x989ac00c	! t0_kref+0x1950:   	xorcc	%o3, %o4, %o4
	.word	0x92bc6308	! t0_kref+0x1954:   	xnorcc	%l1, 0x308, %o1
	.word	0x26800008	! t0_kref+0x1958:   	bl,a	_kref+0x1978
	.word	0xea68a03b	! t0_kref+0x195c:   	ldstub	[%g2 + 0x3b], %l5
	.word	0xcd260000	! t0_kref+0x1960:   	st	%f6, [%i0]
	.word	0x39800003	! t0_kref+0x1964:   	fbuge,a	_kref+0x1970
	.word	0x9fa00537	! t0_kref+0x1968:   	fsqrts	%f23, %f15
	.word	0xd43f4019	! t0_kref+0x196c:   	std	%o2, [%i5 + %i1]
	.word	0x28480007	! t0_kref+0x1970:   	bleu,a,pt	%icc, _kref+0x198c
	.word	0xc368a041	! t0_kref+0x1974:   	prefetch	%g2 + 0x41, 1
	.word	0x81824000	! t0_kref+0x1978:   	wr	%o1, %g0, %y
	.word	0x31800003	! t0_kref+0x197c:   	fba,a	_kref+0x1988
	.word	0xae34000b	! t0_kref+0x1980:   	orn	%l0, %o3, %l7
	.word	0x81ddc004	! t0_kref+0x1984:   	flush	%l7 + %g4
	.word	0x9fb4848e	! t0_kref+0x1988:   	fcmple32	%f18, %f14, %o7
	.word	0x85b60ecc	! t0_kref+0x198c:   	fornot2	%f24, %f12, %f2
	.word	0x33480002	! t0_kref+0x1990:   	fbe,a,pt	%fcc0, _kref+0x1998
	.word	0x95b18c82	! t0_kref+0x1994:   	fandnot2	%f6, %f2, %f10
	.word	0x90122409	! t0_kref+0x1998:   	or	%o0, 0x409, %o0
	.word	0x28480002	! t0_kref+0x199c:   	bleu,a,pt	%icc, _kref+0x19a4
	.word	0x90a5801a	! t0_kref+0x19a0:   	subcc	%l6, %i2, %o0
	.word	0xeed6501b	! t0_kref+0x19a4:   	ldsha	[%i1 + %i3]0x80, %l7
	.word	0x94036875	! t0_kref+0x19a8:   	add	%o5, 0x875, %o2
	.word	0x9a803063	! t0_kref+0x19ac:   	addcc	%g0, -0xf9d, %o5
	.word	0xafb200e8	! t0_kref+0x19b0:   	edge16ln	%o0, %o0, %l7
	.word	0x9eda0016	! t0_kref+0x19b4:   	smulcc	%o0, %l6, %o7
	.word	0xa7b20af8	! t0_kref+0x19b8:   	fpsub32s	%f8, %f24, %f19
	.word	0x23480003	! t0_kref+0x19bc:   	fbne,a,pt	%fcc0, _kref+0x19c8
	.word	0x947c7ef1	! t0_kref+0x19c0:   	sdiv	%l1, -0x10f, %o2
	.word	0x90dc2780	! t0_kref+0x19c4:   	smulcc	%l0, 0x780, %o0
	.word	0x3a480006	! t0_kref+0x19c8:   	bcc,a,pt	%icc, _kref+0x19e0
	.word	0x9878000c	! t0_kref+0x19cc:   	sdiv	%g0, %o4, %o4
	.word	0x93b4c16d	! t0_kref+0x19d0:   	edge32ln	%l3, %o5, %o1
	.word	0xd8871018	! t0_kref+0x19d4:   	lda	[%i4 + %i0]0x80, %o4
	.word	0x87a2c827	! t0_kref+0x19d8:   	fadds	%f11, %f7, %f3
	.word	0x2f04a878	! t0_kref+0x19dc:   	sethi	%hi(0x12a1e000), %l7
	.word	0xd926401c	! t0_kref+0x19e0:   	st	%f12, [%i1 + %i4]
	.word	0x32480008	! t0_kref+0x19e4:   	bne,a,pt	%icc, _kref+0x1a04
	.word	0xf8380019	! t0_kref+0x19e8:   	std	%i4, [%g0 + %i1]
	.word	0x39480004	! t0_kref+0x19ec:   	fbuge,a,pt	%fcc0, _kref+0x19fc
	.word	0x905a8009	! t0_kref+0x19f0:   	smul	%o2, %o1, %o0
	.word	0x29800004	! t0_kref+0x19f4:   	fbl,a	_kref+0x1a04
	.word	0x9bb1851a	! t0_kref+0x19f8:   	fcmpgt16	%f6, %f26, %o5
	.word	0xada00522	! t0_kref+0x19fc:   	fsqrts	%f2, %f22
	.word	0xfd6e401a	! t0_kref+0x1a00:   	prefetch	%i1 + %i2, 30
	.word	0x9fb400b1	! t0_kref+0x1a04:   	edge16n	%l0, %l1, %o7
	.word	0xde566010	! t0_kref+0x1a08:   	ldsh	[%i1 + 0x10], %o7
	.word	0xf4ae9018	! t0_kref+0x1a0c:   	stba	%i2, [%i2 + %i0]0x80
	.word	0x35480003	! t0_kref+0x1a10:   	fbue,a,pt	%fcc0, _kref+0x1a1c
	.word	0xaeb24013	! t0_kref+0x1a14:   	orncc	%o1, %l3, %l7
	.word	0x9234269d	! t0_kref+0x1a18:   	orn	%l0, 0x69d, %o1
	.word	0x9fc10000	! t0_kref+0x1a1c:   	call	%g4
	.word	0x947a800b	! t0_kref+0x1a20:   	sdiv	%o2, %o3, %o2
	.word	0xb1b00cd0	! t0_kref+0x1a24:   	fnot2	%f16, %f24
	.word	0xe11f4018	! t0_kref+0x1a28:   	ldd	[%i5 + %i0], %f16
	.word	0x3d800004	! t0_kref+0x1a2c:   	fbule,a	_kref+0x1a3c
	.word	0xd8567fea	! t0_kref+0x1a30:   	ldsh	[%i1 - 0x16], %o4
	.word	0xd44e3ffd	! t0_kref+0x1a34:   	ldsb	[%i0 - 3], %o2
	.word	0xaf1b2c0d	! t0_kref+0x1a38:   	tsubcctv	%o4, 0xc0d, %l7
	.word	0xae280011	! t0_kref+0x1a3c:   	andn	%g0, %l1, %l7
	.word	0xae2dc011	! t0_kref+0x1a40:   	andn	%l7, %l1, %l7
	.word	0xa5a389c2	! t0_kref+0x1a44:   	fdivd	%f14, %f2, %f18
	.word	0xd6961000	! t0_kref+0x1a48:   	lduha	[%i0]0x80, %o3
	.word	0x95b0874a	! t0_kref+0x1a4c:   	fpack32	%f2, %f10, %f10
	.word	0x91a00123	! t0_kref+0x1a50:   	fabss	%f3, %f8
	.word	0x24800006	! t0_kref+0x1a54:   	ble,a	_kref+0x1a6c
	.word	0x85a01907	! t0_kref+0x1a58:   	fitod	%f7, %f2
	.word	0x81a90a23	! t0_kref+0x1a5c:   	fcmps	%fcc0, %f4, %f3
	.word	0xb3b54a78	! t0_kref+0x1a60:   	fpadd32s	%f21, %f24, %f25
	.word	0xd22e7ffc	! t0_kref+0x1a64:   	stb	%o1, [%i1 - 4]
	.word	0x9eaeaded	! t0_kref+0x1a68:   	andncc	%i2, 0xded, %o7
	.word	0x8062801a	! t0_kref+0x1a6c:   	subc	%o2, %i2, %g0
	.word	0x9e9daec9	! t0_kref+0x1a70:   	xorcc	%l6, 0xec9, %o7
	.word	0x99b18558	! t0_kref+0x1a74:   	fcmpeq16	%f6, %f24, %o4
	.word	0x81ad8ac4	! t0_kref+0x1a78:   	fcmped	%fcc0, %f22, %f4
	.word	0x90d2801a	! t0_kref+0x1a7c:   	umulcc	%o2, %i2, %o0
	.word	0x9de3bfa0	! t0_kref+0x1a80:   	save	%sp, -0x60, %sp
	.word	0x91eec01c	! t0_kref+0x1a84:   	restore	%i3, %i4, %o0
	.word	0x36800007	! t0_kref+0x1a88:   	bge,a	_kref+0x1aa4
	.word	0xb5a689d8	! t0_kref+0x1a8c:   	fdivd	%f26, %f24, %f26
	.word	0xe06e001a	! t0_kref+0x1a90:   	ldstub	[%i0 + %i2], %l0
	.word	0x1104948f	! t0_kref+0x1a94:   	sethi	%hi(0x12523c00), %o0
	.word	0x93400000	! t0_kref+0x1a98:   	mov	%y, %o1
	.word	0xb9a289c4	! t0_kref+0x1a9c:   	fdivd	%f10, %f4, %f28
	.word	0xec180018	! t0_kref+0x1aa0:   	ldd	[%g0 + %i0], %l6
	.word	0xe07e6004	! t0_kref+0x1aa4:   	swap	[%i1 + 4], %l0
	.word	0x9ba01a2b	! t0_kref+0x1aa8:   	fstoi	%f11, %f13
	.word	0xd22e7ff3	! t0_kref+0x1aac:   	stb	%o1, [%i1 - 0xd]
	.word	0x2d480005	! t0_kref+0x1ab0:   	fbg,a,pt	%fcc0, _kref+0x1ac4
	.word	0x9af3400a	! t0_kref+0x1ab4:   	udivcc	%o5, %o2, %o5
	.word	0xd2080019	! t0_kref+0x1ab8:   	ldub	[%g0 + %i1], %o1
	.word	0x94b5000a	! t0_kref+0x1abc:   	orncc	%l4, %o2, %o2
	.word	0x93b08514	! t0_kref+0x1ac0:   	fcmpgt16	%f2, %f20, %o1
	.word	0xa9a01905	! t0_kref+0x1ac4:   	fitod	%f5, %f20
	.word	0xa9a01a39	! t0_kref+0x1ac8:   	fstoi	%f25, %f20
	.word	0x9a52801a	! t0_kref+0x1acc:   	umul	%o2, %i2, %o5
	.word	0xb5b08f92	! t0_kref+0x1ad0:   	for	%f2, %f18, %f26
	.word	0xf526001c	! t0_kref+0x1ad4:   	st	%f26, [%i0 + %i4]
	.word	0x942c000c	! t0_kref+0x1ad8:   	andn	%l0, %o4, %o2
	.word	0x8015c008	! t0_kref+0x1adc:   	or	%l7, %o0, %g0
	.word	0x32800002	! t0_kref+0x1ae0:   	bne,a	_kref+0x1ae8
	.word	0x81da6512	! t0_kref+0x1ae4:   	flush	%o1 + 0x512
	.word	0x9e9de392	! t0_kref+0x1ae8:   	xorcc	%l7, 0x392, %o7
	.word	0x98f80017	! t0_kref+0x1aec:   	sdivcc	%g0, %l7, %o4
	.word	0x949a400d	! t0_kref+0x1af0:   	xorcc	%o1, %o5, %o2
	.word	0x81ad0ac6	! t0_kref+0x1af4:   	fcmped	%fcc0, %f20, %f6
	.word	0xb5a01933	! t0_kref+0x1af8:   	fstod	%f19, %f26
	.word	0x99408000	! t0_kref+0x1afc:   	mov	%ccr, %o4
	.word	0xa7a2c9b8	! t0_kref+0x1b00:   	fdivs	%f11, %f24, %f19
	.word	0x2b480003	! t0_kref+0x1b04:   	fbug,a,pt	%fcc0, _kref+0x1b10
	.word	0x9e1ce8f4	! t0_kref+0x1b08:   	xor	%l3, 0x8f4, %o7
	.word	0x9456a4cf	! t0_kref+0x1b0c:   	umul	%i2, 0x4cf, %o2
	.word	0xd648a025	! t0_kref+0x1b10:   	ldsb	[%g2 + 0x25], %o3
	.word	0xa1b44daa	! t0_kref+0x1b14:   	fxors	%f17, %f10, %f16
	.word	0xd67e3fe4	! t0_kref+0x1b18:   	swap	[%i0 - 0x1c], %o3
	.word	0xa7a18837	! t0_kref+0x1b1c:   	fadds	%f6, %f23, %f19
	.word	0xae82c01a	! t0_kref+0x1b20:   	addcc	%o3, %i2, %l7
	.word	0x98183d96	! t0_kref+0x1b24:   	xor	%g0, -0x26a, %o4
	.word	0xeb68a083	! t0_kref+0x1b28:   	prefetch	%g2 + 0x83, 21
	.word	0x972a4012	! t0_kref+0x1b2c:   	sll	%o1, %l2, %o3
	.word	0xa1a01901	! t0_kref+0x1b30:   	fitod	%f1, %f16
	.word	0x81ab0ad6	! t0_kref+0x1b34:   	fcmped	%fcc0, %f12, %f22
	.word	0x9e9aeb9e	! t0_kref+0x1b38:   	xorcc	%o3, 0xb9e, %o7
	.word	0x989d8012	! t0_kref+0x1b3c:   	xorcc	%l6, %l2, %o4
	.word	0x98e4ec5c	! t0_kref+0x1b40:   	subccc	%l3, 0xc5c, %o4
	.word	0xe120a02c	! t0_kref+0x1b44:   	st	%f16, [%g2 + 0x2c]
	.word	0x83b34c69	! t0_kref+0x1b48:   	fnors	%f13, %f9, %f1
	.word	0x948de277	! t0_kref+0x1b4c:   	andcc	%l7, 0x277, %o2
	.word	0x8da00521	! t0_kref+0x1b50:   	fsqrts	%f1, %f6
	.word	0x9a9d4014	! t0_kref+0x1b54:   	xorcc	%l5, %l4, %o5
	.word	0xea7e201c	! t0_kref+0x1b58:   	swap	[%i0 + 0x1c], %l5
	.word	0x9fc00004	! t0_kref+0x1b5c:   	call	%g0 + %g4
	.word	0xe51fbf38	! t0_kref+0x1b60:   	ldd	[%fp - 0xc8], %f18
	.word	0x38800007	! t0_kref+0x1b64:   	bgu,a	_kref+0x1b80
	.word	0xa3a01a33	! t0_kref+0x1b68:   	fstoi	%f19, %f17
	.word	0x34800006	! t0_kref+0x1b6c:   	bg,a	_kref+0x1b84
	.word	0xae0c000c	! t0_kref+0x1b70:   	and	%l0, %o4, %l7
	.word	0x81aa0adc	! t0_kref+0x1b74:   	fcmped	%fcc0, %f8, %f28
	.word	0x99b20516	! t0_kref+0x1b78:   	fcmpgt16	%f8, %f22, %o4
	.word	0x93b240d2	! t0_kref+0x1b7c:   	edge16l	%o1, %l2, %o1
	.word	0xd40e401a	! t0_kref+0x1b80:   	ldub	[%i1 + %i2], %o2
	.word	0xed68a04c	! t0_kref+0x1b84:   	prefetch	%g2 + 0x4c, 22
	.word	0xd02e4000	! t0_kref+0x1b88:   	stb	%o0, [%i1]
	.word	0x99a000a1	! t0_kref+0x1b8c:   	fnegs	%f1, %f12
	.word	0xaba00134	! t0_kref+0x1b90:   	fabss	%f20, %f21
	.word	0xd656c018	! t0_kref+0x1b94:   	ldsh	[%i3 + %i0], %o3
	.word	0xc06e401a	! t0_kref+0x1b98:   	ldstub	[%i1 + %i2], %g0
	.word	0x1322f0a4	! t0_kref+0x1b9c:   	sethi	%hi(0x8bc29000), %o1
	.word	0xaefb4015	! t0_kref+0x1ba0:   	sdivcc	%o5, %l5, %l7
	.word	0xd4ae5000	! t0_kref+0x1ba4:   	stba	%o2, [%i1]0x80
	.word	0x34800001	! t0_kref+0x1ba8:   	bg,a	_kref+0x1bac
	.word	0x805de168	! t0_kref+0x1bac:   	smul	%l7, 0x168, %g0
	.word	0x81800000	! t0_kref+0x1bb0:   	mov	%g0, %y
	.word	0x012b91f4	! t0_kref+0x1bb4:   	sethi	%hi(0xae47d000), %g0
	.word	0x91a688a7	! t0_kref+0x1bb8:   	fsubs	%f26, %f7, %f8
	.word	0x9f414000	! t0_kref+0x1bbc:   	mov	%pc, %o7
!	.word	0x2e84190f	! t0_kref+0x1bc0:   	bvs,a	SYM(t0_subr1)
	   	bvs,a	SYM(t0_subr1)
	.word	0xe43e401d	! t0_kref+0x1bc4:   	std	%l2, [%i1 + %i5]
	.word	0x85b68e0a	! t0_kref+0x1bc8:   	fand	%f26, %f10, %f2
	.word	0xb5a00534	! t0_kref+0x1bcc:   	fsqrts	%f20, %f26
	.word	0x9ba01a5a	! t0_kref+0x1bd0:   	fdtoi	%f26, %f13
	.word	0xc9be1a5d	! t0_kref+0x1bd4:   	stda	%f4, [%i0 + %i5]0xd2
	.word	0x87b10af5	! t0_kref+0x1bd8:   	fpsub32s	%f4, %f21, %f3
	.word	0xd7067fec	! t0_kref+0x1bdc:   	ld	[%i1 - 0x14], %f11
	.word	0x92aa7647	! t0_kref+0x1be0:   	andncc	%o1, -0x9b9, %o1
	.word	0xd8500018	! t0_kref+0x1be4:   	ldsh	[%g0 + %i0], %o4
	.word	0x96322df1	! t0_kref+0x1be8:   	orn	%o0, 0xdf1, %o3
	.word	0x969d400b	! t0_kref+0x1bec:   	xorcc	%l5, %o3, %o3
	.word	0x9da70930	! t0_kref+0x1bf0:   	fmuls	%f28, %f16, %f14
	.word	0xaebb29c7	! t0_kref+0x1bf4:   	xnorcc	%o4, 0x9c7, %l7
	.word	0x33480003	! t0_kref+0x1bf8:   	fbe,a,pt	%fcc0, _kref+0x1c04
	.word	0xc5ee101a	! t0_kref+0x1bfc:   	prefetcha	%i0 + %i2, 2
	.word	0xc900a024	! t0_kref+0x1c00:   	ld	[%g2 + 0x24], %f4
	.word	0x907b4008	! t0_kref+0x1c04:   	sdiv	%o5, %o0, %o0
	.word	0xde563fe8	! t0_kref+0x1c08:   	ldsh	[%i0 - 0x18], %o7
	.word	0x9ba14931	! t0_kref+0x1c0c:   	fmuls	%f5, %f17, %f13
	.word	0x9252ebd5	! t0_kref+0x1c10:   	umul	%o3, 0xbd5, %o1
	.word	0x9eb28017	! t0_kref+0x1c14:   	orncc	%o2, %l7, %o7
	.word	0x962a8000	! t0_kref+0x1c18:   	andn	%o2, %g0, %o3
	.word	0x8db6c6b5	! t0_kref+0x1c1c:   	fmul8x16al	%f27, %f21, %f6
	.word	0x8da389d4	! t0_kref+0x1c20:   	fdivd	%f14, %f20, %f6
	.word	0x81ae0a4a	! t0_kref+0x1c24:   	fcmpd	%fcc0, %f24, %f10
	.word	0xcb070018	! t0_kref+0x1c28:   	ld	[%i4 + %i0], %f5
	.word	0xafa01a25	! t0_kref+0x1c2c:   	fstoi	%f5, %f23
	.word	0xe66e6013	! t0_kref+0x1c30:   	ldstub	[%i1 + 0x13], %l3
	.word	0x97a0052e	! t0_kref+0x1c34:   	fsqrts	%f14, %f11
	call	SYM(t0_subr1)
	.word	0xf9267ff0	! t0_kref+0x1c3c:   	st	%f28, [%i1 - 0x10]
	.word	0x81a509dc	! t0_kref+0x1c40:   	fdivd	%f20, %f28, %f0
	.word	0x39480005	! t0_kref+0x1c44:   	fbuge,a,pt	%fcc0, _kref+0x1c58
	.word	0xe6280019	! t0_kref+0x1c48:   	stb	%l3, [%g0 + %i1]
	.word	0x36480005	! t0_kref+0x1c4c:   	bge,a,pt	%icc, _kref+0x1c60
	.word	0xeb68a047	! t0_kref+0x1c50:   	prefetch	%g2 + 0x47, 21
	.word	0xc19e501d	! t0_kref+0x1c54:   	ldda	[%i1 + %i5]0x80, %f0
	.word	0xa3b007b2	! t0_kref+0x1c58:   	fpackfix	%f18, %f17
	.word	0xe66e3fe4	! t0_kref+0x1c5c:   	ldstub	[%i0 - 0x1c], %l3
	.word	0x9fa0052e	! t0_kref+0x1c60:   	fsqrts	%f14, %f15
	.word	0x809a000d	! t0_kref+0x1c64:   	xorcc	%o0, %o5, %g0
	.word	0xdd1fbdf0	! t0_kref+0x1c68:   	ldd	[%fp - 0x210], %f14
	.word	0x80fa7428	! t0_kref+0x1c6c:   	sdivcc	%o1, -0xbd8, %g0
	.word	0x28800003	! t0_kref+0x1c70:   	bleu,a	_kref+0x1c7c
	.word	0x95a488a3	! t0_kref+0x1c74:   	fsubs	%f18, %f3, %f10
	.word	0x9e0d0009	! t0_kref+0x1c78:   	and	%l4, %o1, %o7
	.word	0xc008a00b	! t0_kref+0x1c7c:   	ldub	[%g2 + 0xb], %g0
	.word	0xf4b6d018	! t0_kref+0x1c80:   	stha	%i2, [%i3 + %i0]0x80
	.word	0x89b086f6	! t0_kref+0x1c84:   	fmul8ulx16	%f2, %f22, %f4
	.word	0x81a88a48	! t0_kref+0x1c88:   	fcmpd	%fcc0, %f2, %f8
	.word	0x21480005	! t0_kref+0x1c8c:   	fbn,a,pt	%fcc0, _kref+0x1ca0
	.word	0xda0e3ff4	! t0_kref+0x1c90:   	ldub	[%i0 - 0xc], %o5
	.word	0xafb38548	! t0_kref+0x1c94:   	fcmpeq16	%f14, %f8, %l7
	.word	0xafb3014a	! t0_kref+0x1c98:   	edge32l	%o4, %o2, %l7
	.word	0xdd1fbf70	! t0_kref+0x1c9c:   	ldd	[%fp - 0x90], %f14
	.word	0xc99f5a59	! t0_kref+0x1ca0:   	ldda	[%i5 + %i1]0xd2, %f4
	.word	0xf83f4018	! t0_kref+0x1ca4:   	std	%i4, [%i5 + %i0]
	.word	0x3e480003	! t0_kref+0x1ca8:   	bvc,a,pt	%icc, _kref+0x1cb4
	.word	0x9efb3fbf	! t0_kref+0x1cac:   	sdivcc	%o4, -0x41, %o7
	.word	0xb9a0191c	! t0_kref+0x1cb0:   	fitod	%f28, %f28
	.word	0x8ba00532	! t0_kref+0x1cb4:   	fsqrts	%f18, %f5
	.word	0x81dfc00f	! t0_kref+0x1cb8:   	flush	%i7 + %o7
	.word	0x9a84aca8	! t0_kref+0x1cbc:   	addcc	%l2, 0xca8, %o5
	.word	0x9483400b	! t0_kref+0x1cc0:   	addcc	%o5, %o3, %o2
	.word	0x9a33310e	! t0_kref+0x1cc4:   	orn	%o4, -0xef2, %o5
	.word	0xd9180019	! t0_kref+0x1cc8:   	ldd	[%g0 + %i1], %f12
	.word	0xa5a01927	! t0_kref+0x1ccc:   	fstod	%f7, %f18
	.word	0x93b3433a	! t0_kref+0x1cd0:   	bmask	%o5, %i2, %o1
	.word	0x9634800d	! t0_kref+0x1cd4:   	orn	%l2, %o5, %o3
	.word	0xada5093b	! t0_kref+0x1cd8:   	fmuls	%f20, %f27, %f22
	.word	0x9a32b4ac	! t0_kref+0x1cdc:   	orn	%o2, -0xb54, %o5
	.word	0x29480003	! t0_kref+0x1ce0:   	fbl,a,pt	%fcc0, _kref+0x1cec
	.word	0x9e74c01a	! t0_kref+0x1ce4:   	udiv	%l3, %i2, %o7
	.word	0xd26e0000	! t0_kref+0x1ce8:   	ldstub	[%i0], %o1
	.word	0xcd1fbdc8	! t0_kref+0x1cec:   	ldd	[%fp - 0x238], %f6
	.word	0x98122a7a	! t0_kref+0x1cf0:   	or	%o0, 0xa7a, %o4
	.word	0x9ea0307b	! t0_kref+0x1cf4:   	subcc	%g0, -0xf85, %o7
	.word	0x99a10931	! t0_kref+0x1cf8:   	fmuls	%f4, %f17, %f12
	.word	0x2f480008	! t0_kref+0x1cfc:   	fbu,a,pt	%fcc0, _kref+0x1d1c
	.word	0xc00e7ff7	! t0_kref+0x1d00:   	ldub	[%i1 - 9], %g0
	.word	0xc00e4000	! t0_kref+0x1d04:   	ldub	[%i1], %g0
	.word	0xd8d61000	! t0_kref+0x1d08:   	ldsha	[%i0]0x80, %o4
	.word	0xb5a0054e	! t0_kref+0x1d0c:   	fsqrtd	%f14, %f26
	.word	0x3f800008	! t0_kref+0x1d10:   	fbo,a	_kref+0x1d30
	.word	0xc026200c	! t0_kref+0x1d14:   	clr	[%i0 + 0xc]
	.word	0xf43f4019	! t0_kref+0x1d18:   	std	%i2, [%i5 + %i1]
	.word	0x35800007	! t0_kref+0x1d1c:   	fbue,a	_kref+0x1d38
	.word	0x80a4c013	! t0_kref+0x1d20:   	cmp	%l3, %l3
	.word	0xef20a038	! t0_kref+0x1d24:   	st	%f23, [%g2 + 0x38]
	.word	0xf207bfe0	! t0_kref+0x1d28:   	ld	[%fp - 0x20], %i1
	.word	0x9a980008	! t0_kref+0x1d2c:   	xorcc	%g0, %o0, %o5
	.word	0xd7e65009	! t0_kref+0x1d30:   	casa	[%i1]0x80, %o1, %o3
	.word	0x90a2fb36	! t0_kref+0x1d34:   	subcc	%o3, -0x4ca, %o0
	.word	0xa9a409ae	! t0_kref+0x1d38:   	fdivs	%f16, %f14, %f20
	.word	0x985c2ef9	! t0_kref+0x1d3c:   	smul	%l0, 0xef9, %o4
	.word	0xe9ee101d	! t0_kref+0x1d40:   	prefetcha	%i0 + %i5, 20
	.word	0x2c480007	! t0_kref+0x1d44:   	bneg,a,pt	%icc, _kref+0x1d60
	.word	0xe9b81018	! t0_kref+0x1d48:   	stda	%f20, [%g0 + %i0]0x80
	.word	0x90bcc010	! t0_kref+0x1d4c:   	xnorcc	%l3, %l0, %o0
	.word	0xa5a00546	! t0_kref+0x1d50:   	fsqrtd	%f6, %f18
	.word	0xae446555	! t0_kref+0x1d54:   	addc	%l1, 0x555, %l7
	.word	0x99b00cd0	! t0_kref+0x1d58:   	fnot2	%f16, %f12
	.word	0xd020a018	! t0_kref+0x1d5c:   	st	%o0, [%g2 + 0x18]
	.word	0x80624017	! t0_kref+0x1d60:   	subc	%o1, %l7, %g0
	.word	0x3b480004	! t0_kref+0x1d64:   	fble,a,pt	%fcc0, _kref+0x1d74
	.word	0x89b0874a	! t0_kref+0x1d68:   	fpack32	%f2, %f10, %f4
	.word	0xa5a6083d	! t0_kref+0x1d6c:   	fadds	%f24, %f29, %f18
	.word	0x97b284d0	! t0_kref+0x1d70:   	fcmpne32	%f10, %f16, %o3
	.word	0xada00544	! t0_kref+0x1d74:   	fsqrtd	%f4, %f22
	.word	0xcd981019	! t0_kref+0x1d78:   	ldda	[%g0 + %i1]0x80, %f6
	.word	0x99a01a2d	! t0_kref+0x1d7c:   	fstoi	%f13, %f12
	.word	0x90bde733	! t0_kref+0x1d80:   	xnorcc	%l7, 0x733, %o0
	.word	0x89a0085c	! t0_kref+0x1d84:   	faddd	%f0, %f28, %f4
	.word	0x33480004	! t0_kref+0x1d88:   	fbe,a,pt	%fcc0, _kref+0x1d98
	.word	0xb5a0191d	! t0_kref+0x1d8c:   	fitod	%f29, %f26
	.word	0x9f248009	! t0_kref+0x1d90:   	mulscc	%l2, %o1, %o7
	.word	0xb5a000a9	! t0_kref+0x1d94:   	fnegs	%f9, %f26
	.word	0x95b5c029	! t0_kref+0x1d98:   	edge8n	%l7, %o1, %o2
	.word	0x96053e85	! t0_kref+0x1d9c:   	add	%l4, -0x17b, %o3
	.word	0xd8d01019	! t0_kref+0x1da0:   	ldsha	[%g0 + %i1]0x80, %o4
	.word	0xf9266018	! t0_kref+0x1da4:   	st	%f28, [%i1 + 0x18]
	.word	0x909c8016	! t0_kref+0x1da8:   	xorcc	%l2, %l6, %o0
	.word	0xd8d6d018	! t0_kref+0x1dac:   	ldsha	[%i3 + %i0]0x80, %o4
	.word	0x81b10c50	! t0_kref+0x1db0:   	fnor	%f4, %f16, %f0
	.word	0x81b284d0	! t0_kref+0x1db4:   	fcmpne32	%f10, %f16, %g0
	.word	0x95b1862a	! t0_kref+0x1db8:   	fmul8x16	%f6, %f10, %f10
	.word	0x903d001a	! t0_kref+0x1dbc:   	xnor	%l4, %i2, %o0
	.word	0xaf234010	! t0_kref+0x1dc0:   	mulscc	%o5, %l0, %l7
	.word	0xb5a0191b	! t0_kref+0x1dc4:   	fitod	%f27, %f26
	.word	0xd7062004	! t0_kref+0x1dc8:   	ld	[%i0 + 4], %f11
	.word	0xec1e3ff0	! t0_kref+0x1dcc:   	ldd	[%i0 - 0x10], %l6
	.word	0x81b68502	! t0_kref+0x1dd0:   	fcmpgt16	%f26, %f2, %g0
	.word	0xdc39401d	! t0_kref+0x1dd4:   	std	%sp, [%g5 + %i5]
	.word	0xadb2891c	! t0_kref+0x1dd8:   	faligndata	%f10, %f28, %f22
	.word	0xb1a3884e	! t0_kref+0x1ddc:   	faddd	%f14, %f14, %f24
	.word	0x80634013	! t0_kref+0x1de0:   	subc	%o5, %l3, %g0
	.word	0x3c480003	! t0_kref+0x1de4:   	bpos,a,pt	%icc, _kref+0x1df0
	.word	0x96547ffa	! t0_kref+0x1de8:   	umul	%l1, -0x6, %o3
	.word	0x9a7b4013	! t0_kref+0x1dec:   	sdiv	%o5, %l3, %o5
	.word	0xa5b1863a	! t0_kref+0x1df0:   	fmul8x16	%f6, %f26, %f18
	.word	0xa1a01a5c	! t0_kref+0x1df4:   	fdtoi	%f28, %f16
	.word	0x991c6fb7	! t0_kref+0x1df8:   	tsubcctv	%l1, 0xfb7, %o4
	.word	0xae35a9ab	! t0_kref+0x1dfc:   	orn	%l6, 0x9ab, %l7
	.word	0xb1a00525	! t0_kref+0x1e00:   	fsqrts	%f5, %f24
	.word	0x81af0a4a	! t0_kref+0x1e04:   	fcmpd	%fcc0, %f28, %f10
	.word	0xda0e401a	! t0_kref+0x1e08:   	ldub	[%i1 + %i2], %o5
	.word	0x9e32000c	! t0_kref+0x1e0c:   	orn	%o0, %o4, %o7
	.word	0x8143e04c	! t0_kref+0x1e10:   	membar	0x4c
	.word	0x97b684d4	! t0_kref+0x1e14:   	fcmpne32	%f26, %f20, %o3
	.word	0x96bc0017	! t0_kref+0x1e18:   	xnorcc	%l0, %l7, %o3
	.word	0x9f414000	! t0_kref+0x1e1c:   	mov	%pc, %o7
	.word	0x9efab2b1	! t0_kref+0x1e20:   	sdivcc	%o2, -0xd4f, %o7
	.word	0x81854000	! t0_kref+0x1e24:   	wr	%l5, %g0, %y
	.word	0xef68a084	! t0_kref+0x1e28:   	prefetch	%g2 + 0x84, 23
	.word	0x813ae018	! t0_kref+0x1e2c:   	sra	%o3, 0x18, %g0
	.word	0x33800008	! t0_kref+0x1e30:   	fbe,a	_kref+0x1e50
	.word	0xcd1fbd38	! t0_kref+0x1e34:   	ldd	[%fp - 0x2c8], %f6
	.word	0x91b00fc0	! t0_kref+0x1e38:   	fone	%f8
	.word	0x8db40630	! t0_kref+0x1e3c:   	fmul8x16	%f16, %f16, %f6
	.word	0x800d7d10	! t0_kref+0x1e40:   	and	%l5, -0x2f0, %g0
	.word	0xa9b18624	! t0_kref+0x1e44:   	fmul8x16	%f6, %f4, %f20
	.word	0xf51e7fe8	! t0_kref+0x1e48:   	ldd	[%i1 - 0x18], %f26
	.word	0xb5b70f98	! t0_kref+0x1e4c:   	for	%f28, %f24, %f26
	.word	0x93220010	! t0_kref+0x1e50:   	mulscc	%o0, %l0, %o1
	.word	0x89a7085a	! t0_kref+0x1e54:   	faddd	%f28, %f26, %f4
	.word	0x31800007	! t0_kref+0x1e58:   	fba,a	_kref+0x1e74
	.word	0x81848000	! t0_kref+0x1e5c:   	wr	%l2, %g0, %y
	.word	0x92dc7b87	! t0_kref+0x1e60:   	smulcc	%l1, -0x479, %o1
	.word	0xa5a01027	! t0_kref+0x1e64:   	fstox	%f7, %f18
	.word	0x33800006	! t0_kref+0x1e68:   	fbe,a	_kref+0x1e80
	.word	0xa1a409d2	! t0_kref+0x1e6c:   	fdivd	%f16, %f18, %f16
	.word	0x972d000d	! t0_kref+0x1e70:   	sll	%l4, %o5, %o3
	.word	0x9534e01d	! t0_kref+0x1e74:   	srl	%l3, 0x1d, %o2
	.word	0x81ae8ad8	! t0_kref+0x1e78:   	fcmped	%fcc0, %f26, %f24
	.word	0xb7a01a40	! t0_kref+0x1e7c:   	fdtoi	%f0, %f27
	.word	0xdb070018	! t0_kref+0x1e80:   	ld	[%i4 + %i0], %f13
	.word	0x99b10e46	! t0_kref+0x1e84:   	fxnor	%f4, %f6, %f12
	.word	0x92c5c014	! t0_kref+0x1e88:   	addccc	%l7, %l4, %o1
	.word	0x9e82eb81	! t0_kref+0x1e8c:   	addcc	%o3, 0xb81, %o7
	call	SYM(t0_subr2)
	.word	0xda961000	! t0_kref+0x1e94:   	lduha	[%i0]0x80, %o5
	.word	0x98800015	! t0_kref+0x1e98:   	addcc	%g0, %l5, %o4
	.word	0xbbb50ca8	! t0_kref+0x1e9c:   	fandnot2s	%f20, %f8, %f29
	.word	0x961e8011	! t0_kref+0x1ea0:   	xor	%i2, %l1, %o3
	.word	0xae722379	! t0_kref+0x1ea4:   	udiv	%o0, 0x379, %l7
	.word	0x94a435cf	! t0_kref+0x1ea8:   	subcc	%l0, -0xa31, %o2
	.word	0xee4e8019	! t0_kref+0x1eac:   	ldsb	[%i2 + %i1], %l7
	.word	0x3b800005	! t0_kref+0x1eb0:   	fble,a	_kref+0x1ec4
	.word	0xa5a01909	! t0_kref+0x1eb4:   	fitod	%f9, %f18
	.word	0x925cfbbc	! t0_kref+0x1eb8:   	smul	%l3, -0x444, %o1
	.word	0x809ea16c	! t0_kref+0x1ebc:   	xorcc	%i2, 0x16c, %g0
	.word	0x97b5814c	! t0_kref+0x1ec0:   	edge32l	%l6, %o4, %o3
	.word	0x93b00149	! t0_kref+0x1ec4:   	edge32l	%g0, %o1, %o1
	.word	0xc048a00b	! t0_kref+0x1ec8:   	ldsb	[%g2 + 0xb], %g0
	.word	0xda566010	! t0_kref+0x1ecc:   	ldsh	[%i1 + 0x10], %o5
	.word	0xf720a034	! t0_kref+0x1ed0:   	st	%f27, [%g2 + 0x34]
	.word	0x972b400d	! t0_kref+0x1ed4:   	sll	%o5, %o5, %o3
	.word	0x27800001	! t0_kref+0x1ed8:   	fbul,a	_kref+0x1edc
	.word	0x92b0214f	! t0_kref+0x1edc:   	orncc	%g0, 0x14f, %o1
	.word	0xc386501c	! t0_kref+0x1ee0:   	lda	[%i1 + %i4]0x80, %f1
	.word	0xb7a00129	! t0_kref+0x1ee4:   	fabss	%f9, %f27
	.word	0xd2680018	! t0_kref+0x1ee8:   	ldstub	[%g0 + %i0], %o1
	.word	0x27480007	! t0_kref+0x1eec:   	fbul,a,pt	%fcc0, _kref+0x1f08
	.word	0xb5ab8054	! t0_kref+0x1ef0:   	fmovdule	%fcc0, %f20, %f26
	.word	0x87b007bc	! t0_kref+0x1ef4:   	fpackfix	%f28, %f3
	.word	0x99a0053d	! t0_kref+0x1ef8:   	fsqrts	%f29, %f12
	.word	0x8fa2492a	! t0_kref+0x1efc:   	fmuls	%f9, %f10, %f7
	.word	0xb9a00542	! t0_kref+0x1f00:   	fsqrtd	%f2, %f28
	.word	0x80b4b44b	! t0_kref+0x1f04:   	orncc	%l2, -0xbb5, %g0
	.word	0xe3067fe4	! t0_kref+0x1f08:   	ld	[%i1 - 0x1c], %f17
	.word	0xa5a0052d	! t0_kref+0x1f0c:   	fsqrts	%f13, %f18
	.word	0x85b68acc	! t0_kref+0x1f10:   	fpsub32	%f26, %f12, %f2
	.word	0x95b5c350	! t0_kref+0x1f14:   	alignaddrl	%l7, %l0, %o2
	.word	0xb9a00548	! t0_kref+0x1f18:   	fsqrtd	%f8, %f28
	.word	0xa1a00542	! t0_kref+0x1f1c:   	fsqrtd	%f2, %f16
	.word	0x9db30e80	! t0_kref+0x1f20:   	fsrc1	%f12, %f14
	.word	0x9fb007bc	! t0_kref+0x1f24:   	fpackfix	%f28, %f15
	.word	0x9885001a	! t0_kref+0x1f28:   	addcc	%l4, %i2, %o4
	.word	0xd03e6000	! t0_kref+0x1f2c:   	std	%o0, [%i1]
	.word	0x9e32c000	! t0_kref+0x1f30:   	orn	%o3, %g0, %o7
	.word	0x9ab2c00a	! t0_kref+0x1f34:   	orncc	%o3, %o2, %o5
	.word	0x94bd264b	! t0_kref+0x1f38:   	xnorcc	%l4, 0x64b, %o2
	.word	0x8db30e2e	! t0_kref+0x1f3c:   	fands	%f12, %f14, %f6
	.word	0x17310f17	! t0_kref+0x1f40:   	sethi	%hi(0xc43c5c00), %o3
	.word	0x2d800003	! t0_kref+0x1f44:   	fbg,a	_kref+0x1f50
	.word	0xd2fe101c	! t0_kref+0x1f48:   	swapa	[%i0 + %i4]0x80, %o1
	.word	0x3c800005	! t0_kref+0x1f4c:   	bpos,a	_kref+0x1f60
	.word	0x92c4c011	! t0_kref+0x1f50:   	addccc	%l3, %l1, %o1
	.word	0xae3a8017	! t0_kref+0x1f54:   	xnor	%o2, %l7, %l7
	.word	0x97b384d8	! t0_kref+0x1f58:   	fcmpne32	%f14, %f24, %o3
	.word	0x91b406f6	! t0_kref+0x1f5c:   	fmul8ulx16	%f16, %f22, %f8
	.word	0x3a800006	! t0_kref+0x1f60:   	bcc,a	_kref+0x1f78
	.word	0xa1a0052e	! t0_kref+0x1f64:   	fsqrts	%f14, %f16
	.word	0x90baa75a	! t0_kref+0x1f68:   	xnorcc	%o2, 0x75a, %o0
	.word	0xd6270018	! t0_kref+0x1f6c:   	st	%o3, [%i4 + %i0]
	.word	0xd82e6003	! t0_kref+0x1f70:   	stb	%o4, [%i1 + 3]
	.word	0x99a00550	! t0_kref+0x1f74:   	fsqrtd	%f16, %f12
	.word	0xd8080018	! t0_kref+0x1f78:   	ldub	[%g0 + %i0], %o4
	.word	0x2e800002	! t0_kref+0x1f7c:   	bvs,a	_kref+0x1f84
	.word	0xd02e0000	! t0_kref+0x1f80:   	stb	%o0, [%i0]
	.word	0x9da0190b	! t0_kref+0x1f84:   	fitod	%f11, %f14
	.word	0x80d22ec8	! t0_kref+0x1f88:   	umulcc	%o0, 0xec8, %g0
	.word	0x9a3daf42	! t0_kref+0x1f8c:   	xnor	%l6, 0xf42, %o5
	.word	0x91b580f6	! t0_kref+0x1f90:   	edge16ln	%l6, %l6, %o0
	.word	0x9adb6a15	! t0_kref+0x1f94:   	smulcc	%o5, 0xa15, %o5
	.word	0xf42e7fe2	! t0_kref+0x1f98:   	stb	%i2, [%i1 - 0x1e]
	.word	0x95400000	! t0_kref+0x1f9c:   	mov	%y, %o2
	.word	0xe720a030	! t0_kref+0x1fa0:   	st	%f19, [%g2 + 0x30]
	.word	0xafa00521	! t0_kref+0x1fa4:   	fsqrts	%f1, %f23
	.word	0xec180019	! t0_kref+0x1fa8:   	ldd	[%g0 + %i1], %l6
	.word	0x907c6428	! t0_kref+0x1fac:   	sdiv	%l1, 0x428, %o0
	.word	0xe13e001d	! t0_kref+0x1fb0:   	std	%f16, [%i0 + %i5]
	.word	0xb1a6493b	! t0_kref+0x1fb4:   	fmuls	%f25, %f27, %f24
	.word	0xa5b0ce68	! t0_kref+0x1fb8:   	fxnors	%f3, %f8, %f18
	.word	0x3d480002	! t0_kref+0x1fbc:   	fbule,a,pt	%fcc0, _kref+0x1fc4
	.word	0x98c3400a	! t0_kref+0x1fc0:   	addccc	%o5, %o2, %o4
	.word	0x35800007	! t0_kref+0x1fc4:   	fbue,a	_kref+0x1fe0
	.word	0x99a01936	! t0_kref+0x1fc8:   	fstod	%f22, %f12
	.word	0x3c800003	! t0_kref+0x1fcc:   	bpos,a	_kref+0x1fd8
	.word	0x90fb6ea1	! t0_kref+0x1fd0:   	sdivcc	%o5, 0xea1, %o0
	.word	0x931d6381	! t0_kref+0x1fd4:   	tsubcctv	%l5, 0x381, %o1
	.word	0xaec48009	! t0_kref+0x1fd8:   	addccc	%l2, %o1, %l7
	.word	0x33480006	! t0_kref+0x1fdc:   	fbe,a,pt	%fcc0, _kref+0x1ff4
	.word	0x9842c012	! t0_kref+0x1fe0:   	addc	%o3, %l2, %o4
	.word	0xe83e3ff0	! t0_kref+0x1fe4:   	std	%l4, [%i0 - 0x10]
	.word	0x2f1935af	! t0_kref+0x1fe8:   	sethi	%hi(0x64d6bc00), %l7
	.word	0xd640a034	! t0_kref+0x1fec:   	ldsw	[%g2 + 0x34], %o3
	.word	0x92b4c016	! t0_kref+0x1ff0:   	orncc	%l3, %l6, %o1
	.word	0x32480006	! t0_kref+0x1ff4:   	bne,a,pt	%icc, _kref+0x200c
	.word	0xd46e7fff	! t0_kref+0x1ff8:   	ldstub	[%i1 - 1], %o2
	.word	0x91b60d08	! t0_kref+0x1ffc:   	fandnot1	%f24, %f8, %f8
	.word	0x3e480006	! t0_kref+0x2000:   	bvc,a,pt	%icc, _kref+0x2018
	.word	0xc000a038	! t0_kref+0x2004:   	ld	[%g2 + 0x38], %g0
	.word	0xb7a389b5	! t0_kref+0x2008:   	fdivs	%f14, %f21, %f27
	.word	0xae3e800d	! t0_kref+0x200c:   	xnor	%i2, %o5, %l7
	.word	0xada00533	! t0_kref+0x2010:   	fsqrts	%f19, %f22
	.word	0xb7a000a3	! t0_kref+0x2014:   	fnegs	%f3, %f27
	.word	0x91a00129	! t0_kref+0x2018:   	fabss	%f9, %f8
	.word	0x87802082	! t0_kref+0x201c:   	mov	0x82, %asi
	.word	0x9edd8015	! t0_kref+0x2020:   	smulcc	%l6, %l5, %o7
	.word	0xc0080018	! t0_kref+0x2024:   	ldub	[%g0 + %i0], %g0
	.word	0x982ac015	! t0_kref+0x2028:   	andn	%o3, %l5, %o4
	.word	0x97b54049	! t0_kref+0x202c:   	edge8l	%l5, %o1, %o3
	.word	0x98fa4011	! t0_kref+0x2030:   	sdivcc	%o1, %l1, %o4
	.word	0xb5a01a4c	! t0_kref+0x2034:   	fdtoi	%f12, %f26
	.word	0xf4270018	! t0_kref+0x2038:   	st	%i2, [%i4 + %i0]
	.word	0xda68a033	! t0_kref+0x203c:   	ldstub	[%g2 + 0x33], %o5
	.word	0x99a588c6	! t0_kref+0x2040:   	fsubd	%f22, %f6, %f12
	.word	0x9a9dc015	! t0_kref+0x2044:   	xorcc	%l7, %l5, %o5
	.word	0x32480005	! t0_kref+0x2048:   	bne,a,pt	%icc, _kref+0x205c
	.word	0x9113221a	! t0_kref+0x204c:   	taddcctv	%o4, 0x21a, %o0
	.word	0x9a5b264e	! t0_kref+0x2050:   	smul	%o4, 0x64e, %o5
	.word	0x83a54925	! t0_kref+0x2054:   	fmuls	%f21, %f5, %f1
	.word	0x23480005	! t0_kref+0x2058:   	fbne,a,pt	%fcc0, _kref+0x206c
	.word	0xabb007a6	! t0_kref+0x205c:   	fpackfix	%f6, %f21
	.word	0x8033000d	! t0_kref+0x2060:   	orn	%o4, %o5, %g0
	.word	0xd27e001c	! t0_kref+0x2064:   	swap	[%i0 + %i4], %o1
	.word	0x36800007	! t0_kref+0x2068:   	bge,a	_kref+0x2084
	.word	0xe51fbe90	! t0_kref+0x206c:   	ldd	[%fp - 0x170], %f18
	.word	0xed9e1000	! t0_kref+0x2070:   	ldda	[%i0]0x80, %f22
	.word	0x9085800a	! t0_kref+0x2074:   	addcc	%l6, %o2, %o0
	.word	0x80bc360c	! t0_kref+0x2078:   	xnorcc	%l0, -0x9f4, %g0
	.word	0xe278a02c	! t0_kref+0x207c:   	swap	[%g2 + 0x2c], %l1
	.word	0x9db00e4a	! t0_kref+0x2080:   	fxnor	%f0, %f10, %f14
	.word	0xd51fbe58	! t0_kref+0x2084:   	ldd	[%fp - 0x1a8], %f10
	.word	0xb5b6caaa	! t0_kref+0x2088:   	fpsub16s	%f27, %f10, %f26
	.word	0x95a0191d	! t0_kref+0x208c:   	fitod	%f29, %f10
	.word	0x91a00127	! t0_kref+0x2090:   	fabss	%f7, %f8
	.word	0xd59e1000	! t0_kref+0x2094:   	ldda	[%i0]0x80, %f10
	.word	0xa5a0013d	! t0_kref+0x2098:   	fabss	%f29, %f18
	.word	0x9da409d4	! t0_kref+0x209c:   	fdivd	%f16, %f20, %f14
	.word	0x813de016	! t0_kref+0x20a0:   	sra	%l7, 0x16, %g0
	.word	0x26800006	! t0_kref+0x20a4:   	bl,a	_kref+0x20bc
	.word	0xa9a589c2	! t0_kref+0x20a8:   	fdivd	%f22, %f2, %f20
	.word	0x92b0000b	! t0_kref+0x20ac:   	orncc	%g0, %o3, %o1
	.word	0xda0e3ff6	! t0_kref+0x20b0:   	ldub	[%i0 - 0xa], %o5
	.word	0xd82e4000	! t0_kref+0x20b4:   	stb	%o4, [%i1]
	.word	0xd4801019	! t0_kref+0x20b8:   	lda	[%g0 + %i1]0x80, %o2
	.word	0xa1a0c83c	! t0_kref+0x20bc:   	fadds	%f3, %f28, %f16
	.word	0x80553870	! t0_kref+0x20c0:   	umul	%l4, -0x790, %g0
	.word	0xa9a209ce	! t0_kref+0x20c4:   	fdivd	%f8, %f14, %f20
	.word	0x39800001	! t0_kref+0x20c8:   	fbuge,a	_kref+0x20cc
	.word	0xf99eda59	! t0_kref+0x20cc:   	ldda	[%i3 + %i1]0xd2, %f28
	.word	0x89a00523	! t0_kref+0x20d0:   	fsqrts	%f3, %f4
	.word	0x8db38a88	! t0_kref+0x20d4:   	fpsub16	%f14, %f8, %f6
	.word	0x90b5c013	! t0_kref+0x20d8:   	orncc	%l7, %l3, %o0
	.word	0x81858000	! t0_kref+0x20dc:   	wr	%l6, %g0, %y
	.word	0xa1b00cf3	! t0_kref+0x20e0:   	fnot2s	%f19, %f16
	.word	0xf007bfe0	! t0_kref+0x20e4:   	ld	[%fp - 0x20], %i0
	.word	0x81ae8a5a	! t0_kref+0x20e8:   	fcmpd	%fcc0, %f26, %f26
	.word	0x92c523ee	! t0_kref+0x20ec:   	addccc	%l4, 0x3ee, %o1
	.word	0x2d800002	! t0_kref+0x20f0:   	fbg,a	_kref+0x20f8
	.word	0xec1f4019	! t0_kref+0x20f4:   	ldd	[%i5 + %i1], %l6
	.word	0xa5a01901	! t0_kref+0x20f8:   	fitod	%f1, %f18
	.word	0xc807bfe4	! t0_kref+0x20fc:   	ld	[%fp - 0x1c], %g4
	.word	0x96d5f4f3	! t0_kref+0x2100:   	umulcc	%l7, -0xb0d, %o3
	.word	0x81ac0a44	! t0_kref+0x2104:   	fcmpd	%fcc0, %f16, %f4
	.word	0xd03e0000	! t0_kref+0x2108:   	std	%o0, [%i0]
	.word	0xb9a389c6	! t0_kref+0x210c:   	fdivd	%f14, %f6, %f28
	.word	0x94dcc009	! t0_kref+0x2110:   	smulcc	%l3, %o1, %o2
	.word	0x9de3bfa0	! t0_kref+0x2114:   	save	%sp, -0x60, %sp
	.word	0xb48efeea	! t0_kref+0x2118:   	andcc	%i3, -0x116, %i2
	.word	0x93ee401d	! t0_kref+0x211c:   	restore	%i1, %i5, %o1
	.word	0xe16e3ff0	! t0_kref+0x2120:   	prefetch	%i0 - 0x10, 16
	.word	0x81ad0ac8	! t0_kref+0x2124:   	fcmped	%fcc0, %f20, %f8
	.word	0xec180018	! t0_kref+0x2128:   	ldd	[%g0 + %i0], %l6
	.word	0xd620a00c	! t0_kref+0x212c:   	st	%o3, [%g2 + 0xc]
	.word	0xb3a58837	! t0_kref+0x2130:   	fadds	%f22, %f23, %f25
	.word	0xbba018d6	! t0_kref+0x2134:   	fdtos	%f22, %f29
	.word	0x81aa0ad2	! t0_kref+0x2138:   	fcmped	%fcc0, %f8, %f18
	.word	0x81a88a44	! t0_kref+0x213c:   	fcmpd	%fcc0, %f2, %f4
	.word	0xec180019	! t0_kref+0x2140:   	ldd	[%g0 + %i1], %l6
	.word	0xcd1f4019	! t0_kref+0x2144:   	ldd	[%i5 + %i1], %f6
	.word	0x9fc00004	! t0_kref+0x2148:   	call	%g0 + %g4
	.word	0x905c0000	! t0_kref+0x214c:   	smul	%l0, %g0, %o0
	.word	0x972b2000	! t0_kref+0x2150:   	sll	%o4, 0x0, %o3
	.word	0x8143c000	! t0_kref+0x2154:   	stbar
	.word	0xf11fbfd0	! t0_kref+0x2158:   	ldd	[%fp - 0x30], %f24
	.word	0xec1f4018	! t0_kref+0x215c:   	ldd	[%i5 + %i0], %l6
	.word	0xa9b68a54	! t0_kref+0x2160:   	fpadd32	%f26, %f20, %f20
	.word	0x80fa8016	! t0_kref+0x2164:   	sdivcc	%o2, %l6, %g0
	.word	0x80b44013	! t0_kref+0x2168:   	orncc	%l1, %l3, %g0
	.word	0x33480008	! t0_kref+0x216c:   	fbe,a,pt	%fcc0, _kref+0x218c
	.word	0x81830000	! t0_kref+0x2170:   	wr	%o4, %g0, %y
	.word	0xaebaf840	! t0_kref+0x2174:   	xnorcc	%o3, -0x7c0, %l7
	.word	0x9db00ce5	! t0_kref+0x2178:   	fnot2s	%f5, %f14
	.word	0x3e480007	! t0_kref+0x217c:   	bvc,a,pt	%icc, _kref+0x2198
	.word	0x95b204ce	! t0_kref+0x2180:   	fcmpne32	%f8, %f14, %o2
	.word	0x81aa0ac4	! t0_kref+0x2184:   	fcmped	%fcc0, %f8, %f4
	.word	0xd6270019	! t0_kref+0x2188:   	st	%o3, [%i4 + %i1]
	.word	0xae9c4015	! t0_kref+0x218c:   	xorcc	%l1, %l5, %l7
	.word	0x81aa0aae	! t0_kref+0x2190:   	fcmpes	%fcc0, %f8, %f14
	.word	0x98368008	! t0_kref+0x2194:   	orn	%i2, %o0, %o4
	.word	0xb9a00152	! t0_kref+0x2198:   	fabsd	%f18, %f28
	.word	0x3c800001	! t0_kref+0x219c:   	bpos,a	_kref+0x21a0
	.word	0xec6e7ffd	! t0_kref+0x21a0:   	ldstub	[%i1 - 3], %l6
	.word	0x81ae4aad	! t0_kref+0x21a4:   	fcmpes	%fcc0, %f25, %f13
	.word	0xd40e001a	! t0_kref+0x21a8:   	ldub	[%i0 + %i2], %o2
	.word	0x3c480003	! t0_kref+0x21ac:   	bpos,a,pt	%icc, _kref+0x21b8
	.word	0xa1a7083c	! t0_kref+0x21b0:   	fadds	%f28, %f28, %f16
	.word	0x90868011	! t0_kref+0x21b4:   	addcc	%i2, %l1, %o0
	.word	0xd02e4000	! t0_kref+0x21b8:   	stb	%o0, [%i1]
	.word	0x937024af	! t0_kref+0x21bc:   	popc	0x4af, %o1
	.word	0x963c4009	! t0_kref+0x21c0:   	xnor	%l1, %o1, %o3
	.word	0x9e300009	! t0_kref+0x21c4:   	orn	%g0, %o1, %o7
	.word	0x93b200d6	! t0_kref+0x21c8:   	edge16l	%o0, %l6, %o1
	.word	0xee363fec	! t0_kref+0x21cc:   	sth	%l7, [%i0 - 0x14]
	.word	0x99b68756	! t0_kref+0x21d0:   	fpack32	%f26, %f22, %f12
	.word	0x95b28080	! t0_kref+0x21d4:   	edge16	%o2, %g0, %o2
	.word	0x9a5cc009	! t0_kref+0x21d8:   	smul	%l3, %o1, %o5
	.word	0x32480008	! t0_kref+0x21dc:   	bne,a,pt	%icc, _kref+0x21fc
	.word	0x96f80015	! t0_kref+0x21e0:   	sdivcc	%g0, %l5, %o3
	.word	0x9f400000	! t0_kref+0x21e4:   	mov	%y, %o7
	.word	0xc010a00c	! t0_kref+0x21e8:   	lduh	[%g2 + 0xc], %g0
	.word	0xe62e7fe8	! t0_kref+0x21ec:   	stb	%l3, [%i1 - 0x18]
	.word	0x11232d7a	! t0_kref+0x21f0:   	sethi	%hi(0x8cb5e800), %o0
	.word	0xd8562012	! t0_kref+0x21f4:   	ldsh	[%i0 + 0x12], %o4
	.word	0x80fc4000	! t0_kref+0x21f8:   	sdivcc	%l1, %g0, %g0
	.word	0x8ba00136	! t0_kref+0x21fc:   	fabss	%f22, %f5
	.word	0xaed43886	! t0_kref+0x2200:   	umulcc	%l0, -0x77a, %l7
	.word	0x9da0192f	! t0_kref+0x2204:   	fstod	%f15, %f14
	.word	0x87802080	! t0_kref+0x2208:   	mov	0x80, %asi
	.word	0x25480003	! t0_kref+0x220c:   	fblg,a,pt	%fcc0, _kref+0x2218
	.word	0xc93e3fe8	! t0_kref+0x2210:   	std	%f4, [%i0 - 0x18]
	.word	0x96352ec1	! t0_kref+0x2214:   	orn	%l4, 0xec1, %o3
	.word	0xaf24658d	! t0_kref+0x2218:   	mulscc	%l1, 0x58d, %l7
	.word	0x21800006	! t0_kref+0x221c:   	fbn,a	_kref+0x2234
	.word	0x9fb44009	! t0_kref+0x2220:   	edge8	%l1, %o1, %o7
	.word	0xadb10dda	! t0_kref+0x2224:   	fnand	%f4, %f26, %f22
	.word	0xde0e0000	! t0_kref+0x2228:   	ldub	[%i0], %o7
	.word	0x97a0c8b5	! t0_kref+0x222c:   	fsubs	%f3, %f21, %f11
	.word	0x32800003	! t0_kref+0x2230:   	bne,a	_kref+0x223c
	.word	0xa9b286c8	! t0_kref+0x2234:   	fmul8sux16	%f10, %f8, %f20
	.word	0x81a90ac4	! t0_kref+0x2238:   	fcmped	%fcc0, %f4, %f4
	.word	0x2a800002	! t0_kref+0x223c:   	bcs,a	_kref+0x2244
	.word	0xa1b0471b	! t0_kref+0x2240:   	fmuld8sux16	%f1, %f27, %f16
	.word	0xd62e8019	! t0_kref+0x2244:   	stb	%o3, [%i2 + %i1]
	.word	0xf91e401d	! t0_kref+0x2248:   	ldd	[%i1 + %i5], %f28
	.word	0xa1b30f8a	! t0_kref+0x224c:   	for	%f12, %f10, %f16
	.word	0x9aa42e69	! t0_kref+0x2250:   	subcc	%l0, 0xe69, %o5
	.word	0xd8b63fee	! t0_kref+0x2254:   	stha	%o4, [%i0 - 0x12]%asi
	.word	0xd2270018	! t0_kref+0x2258:   	st	%o1, [%i4 + %i0]
	.word	0xaf3c801a	! t0_kref+0x225c:   	sra	%l2, %i2, %l7
	.word	0xec180018	! t0_kref+0x2260:   	ldd	[%g0 + %i0], %l6
	.word	0x39800003	! t0_kref+0x2264:   	fbuge,a	_kref+0x2270
	.word	0xec1e4000	! t0_kref+0x2268:   	ldd	[%i1], %l6
	.word	0xcd262010	! t0_kref+0x226c:   	st	%f6, [%i0 + 0x10]
	.word	0x927ac000	! t0_kref+0x2270:   	sdiv	%o3, %g0, %o1
	.word	0x95400000	! t0_kref+0x2274:   	mov	%y, %o2
	.word	0x905b4012	! t0_kref+0x2278:   	smul	%o5, %l2, %o0
	.word	0xec760000	! t0_kref+0x227c:   	stx	%l6, [%i0]
	.word	0xafb2cdb6	! t0_kref+0x2280:   	fxors	%f11, %f22, %f23
	.word	0x801a6b23	! t0_kref+0x2284:   	xor	%o1, 0xb23, %g0
	.word	0xa9b50d10	! t0_kref+0x2288:   	fandnot1	%f20, %f16, %f20
	.word	0x965ac009	! t0_kref+0x228c:   	smul	%o3, %o1, %o3
	.word	0x81854000	! t0_kref+0x2290:   	wr	%l5, %g0, %y
	.word	0x27480007	! t0_kref+0x2294:   	fbul,a,pt	%fcc0, _kref+0x22b0
	.word	0x989dc00a	! t0_kref+0x2298:   	xorcc	%l7, %o2, %o4
	.word	0xa5b40990	! t0_kref+0x229c:   	bshuffle	%f16, %f16, %f18
	.word	0x2e480005	! t0_kref+0x22a0:   	bvs,a,pt	%icc, _kref+0x22b4
	.word	0x8014299f	! t0_kref+0x22a4:   	or	%l0, 0x99f, %g0
	.word	0x9da01910	! t0_kref+0x22a8:   	fitod	%f16, %f14
	.word	0xd87f0019	! t0_kref+0x22ac:   	swap	[%i4 + %i1], %o4
	.word	0x99202dd9	! t0_kref+0x22b0:   	mulscc	%g0, 0xdd9, %o4
	.word	0x2d480006	! t0_kref+0x22b4:   	fbg,a,pt	%fcc0, _kref+0x22cc
	.word	0x90c2e828	! t0_kref+0x22b8:   	addccc	%o3, 0x828, %o0
	.word	0xd4ce9018	! t0_kref+0x22bc:   	ldsba	[%i2 + %i0]0x80, %o2
	.word	0xa5b10f86	! t0_kref+0x22c0:   	for	%f4, %f6, %f18
	.word	0x8182c000	! t0_kref+0x22c4:   	wr	%o3, %g0, %y
	.word	0xec78a02c	! t0_kref+0x22c8:   	swap	[%g2 + 0x2c], %l6
	.word	0xb9b40626	! t0_kref+0x22cc:   	fmul8x16	%f16, %f6, %f28
	.word	0x81aaca34	! t0_kref+0x22d0:   	fcmps	%fcc0, %f11, %f20
	.word	0xafb00550	! t0_kref+0x22d4:   	fcmpeq16	%f0, %f16, %l7
	.word	0xefee501c	! t0_kref+0x22d8:   	prefetcha	%i1 + %i4, 23
	.word	0xaf25c01a	! t0_kref+0x22dc:   	mulscc	%l7, %i2, %l7
	.word	0x91b74df2	! t0_kref+0x22e0:   	fnands	%f29, %f18, %f8
	.word	0x9a380011	! t0_kref+0x22e4:   	xnor	%g0, %l1, %o5
	.word	0x8bb74f7d	! t0_kref+0x22e8:   	fornot1s	%f29, %f29, %f5
	.word	0xae0c4011	! t0_kref+0x22ec:   	and	%l1, %l1, %l7
	.word	0x37480005	! t0_kref+0x22f0:   	fbge,a,pt	%fcc0, _kref+0x2304
	.word	0xd2f81018	! t0_kref+0x22f4:   	swapa	[%g0 + %i0]0x80, %o1
	.word	0x9123000b	! t0_kref+0x22f8:   	mulscc	%o4, %o3, %o0
	.word	0xff6e001d	! t0_kref+0x22fc:   	prefetch	%i0 + %i5, 31
	.word	0x95a00558	! t0_kref+0x2300:   	fsqrtd	%f24, %f10
	.word	0xc00e001a	! t0_kref+0x2304:   	ldub	[%i0 + %i2], %g0
	.word	0x943da27b	! t0_kref+0x2308:   	xnor	%l6, 0x27b, %o2
	.word	0xf3063ff0	! t0_kref+0x230c:   	ld	[%i0 - 0x10], %f25
	.word	0xaedc0014	! t0_kref+0x2310:   	smulcc	%l0, %l4, %l7
	.word	0x81ac0a52	! t0_kref+0x2314:   	fcmpd	%fcc0, %f16, %f18
	.word	0x9e9cf9af	! t0_kref+0x2318:   	xorcc	%l3, -0x651, %o7
	.word	0xc807bfec	! t0_kref+0x231c:   	ld	[%fp - 0x14], %g4
	.word	0xa5a00526	! t0_kref+0x2320:   	fsqrts	%f6, %f18
	.word	0x9f156f49	! t0_kref+0x2324:   	taddcctv	%l5, 0xf49, %o7
	.word	0xae95000d	! t0_kref+0x2328:   	orcc	%l4, %o5, %l7
	.word	0x922b400a	! t0_kref+0x232c:   	andn	%o5, %o2, %o1
	.word	0x3a480005	! t0_kref+0x2330:   	bcc,a,pt	%icc, _kref+0x2344
	.word	0xa5a01a22	! t0_kref+0x2334:   	fstoi	%f2, %f18
	.word	0x929c800c	! t0_kref+0x2338:   	xorcc	%l2, %o4, %o1
	.word	0xa1a58854	! t0_kref+0x233c:   	faddd	%f22, %f20, %f16
	.word	0xe4be2018	! t0_kref+0x2340:   	stda	%l2, [%i0 + 0x18]%asi
	.word	0x932ce013	! t0_kref+0x2344:   	sll	%l3, 0x13, %o1
	.word	0xe22e601b	! t0_kref+0x2348:   	stb	%l1, [%i1 + 0x1b]
	.word	0x99a689dc	! t0_kref+0x234c:   	fdivd	%f26, %f28, %f12
	.word	0xc11fbc08	! t0_kref+0x2350:   	ldd	[%fp - 0x3f8], %f0
	.word	0x9f400000	! t0_kref+0x2354:   	mov	%y, %o7
	.word	0x87a0109a	! t0_kref+0x2358:   	fxtos	%f26, %f3
	.word	0x32480008	! t0_kref+0x235c:   	bne,a,pt	%icc, _kref+0x237c
	.word	0xafb20170	! t0_kref+0x2360:   	edge32ln	%o0, %l0, %l7
	.word	0xa9a000bd	! t0_kref+0x2364:   	fnegs	%f29, %f20
	.word	0xcd9f5019	! t0_kref+0x2368:   	ldda	[%i5 + %i1]0x80, %f6
	.word	0x3f480004	! t0_kref+0x236c:   	fbo,a,pt	%fcc0, _kref+0x237c
	.word	0xb5a01a30	! t0_kref+0x2370:   	fstoi	%f16, %f26
	.word	0xda0e8018	! t0_kref+0x2374:   	ldub	[%i2 + %i0], %o5
	.word	0x9b2d8009	! t0_kref+0x2378:   	sll	%l6, %o1, %o5
	.word	0x920c8009	! t0_kref+0x237c:   	and	%l2, %o1, %o1
	.word	0xc00e4000	! t0_kref+0x2380:   	ldub	[%i1], %g0
	.word	0xebee501a	! t0_kref+0x2384:   	prefetcha	%i1 + %i2, 21
	.word	0x9de3bfa0	! t0_kref+0x2388:   	save	%sp, -0x60, %sp
	.word	0xb28eac7a	! t0_kref+0x238c:   	andcc	%i2, 0xc7a, %i1
	.word	0x93ef401a	! t0_kref+0x2390:   	restore	%i5, %i2, %o1
	.word	0x23800008	! t0_kref+0x2394:   	fbne,a	_kref+0x23b4
	.word	0x94fa2bbd	! t0_kref+0x2398:   	sdivcc	%o0, 0xbbd, %o2
	.word	0xd20e200a	! t0_kref+0x239c:   	ldub	[%i0 + 0xa], %o1
	.word	0xa1a01911	! t0_kref+0x23a0:   	fitod	%f17, %f16
	.word	0xa5b20c9c	! t0_kref+0x23a4:   	fandnot2	%f8, %f28, %f18
	.word	0x34480006	! t0_kref+0x23a8:   	bg,a,pt	%icc, _kref+0x23c0
	.word	0xe82e201e	! t0_kref+0x23ac:   	stb	%l4, [%i0 + 0x1e]
	.word	0x2a800007	! t0_kref+0x23b0:   	bcs,a	_kref+0x23cc
	.word	0xaba04832	! t0_kref+0x23b4:   	fadds	%f1, %f18, %f21
	.word	0xd0070018	! t0_kref+0x23b8:   	ld	[%i4 + %i0], %o0
	.word	0x909c62e3	! t0_kref+0x23bc:   	xorcc	%l1, 0x2e3, %o0
	.word	0xecb0a000	! t0_kref+0x23c0:   	stha	%l6, [%g2]%asi
	.word	0x81b00fc0	! t0_kref+0x23c4:   	fone	%f0
	.word	0x3b480006	! t0_kref+0x23c8:   	fble,a,pt	%fcc0, _kref+0x23e0
	.word	0xd04e3ffd	! t0_kref+0x23cc:   	ldsb	[%i0 - 3], %o0
	.word	0x9fc00004	! t0_kref+0x23d0:   	call	%g0 + %g4
	.word	0x99b007b2	! t0_kref+0x23d4:   	fpackfix	%f18, %f12
	.word	0x9e932d81	! t0_kref+0x23d8:   	orcc	%o4, 0xd81, %o7
	.word	0x943d4015	! t0_kref+0x23dc:   	xnor	%l5, %l5, %o2
	.word	0x95a00554	! t0_kref+0x23e0:   	fsqrtd	%f20, %f10
	.word	0xe0fe7ff4	! t0_kref+0x23e4:   	swapa	[%i1 - 0xc]%asi, %l0
	.word	0xd6766000	! t0_kref+0x23e8:   	stx	%o3, [%i1]
	.word	0xdaf61000	! t0_kref+0x23ec:   	stxa	%o5, [%i0]0x80
	.word	0xd91fbea8	! t0_kref+0x23f0:   	ldd	[%fp - 0x158], %f12
	.word	0x9aba4010	! t0_kref+0x23f4:   	xnorcc	%o1, %l0, %o5
	.word	0x94fa4016	! t0_kref+0x23f8:   	sdivcc	%o1, %l6, %o2
	.word	0xd40e001a	! t0_kref+0x23fc:   	ldub	[%i0 + %i2], %o2
	.word	0x9ead401a	! t0_kref+0x2400:   	andncc	%l5, %i2, %o7
	.word	0xa9a7493a	! t0_kref+0x2404:   	fmuls	%f29, %f26, %f20
	.word	0x81352003	! t0_kref+0x2408:   	srl	%l4, 0x3, %g0
	.word	0xe430a006	! t0_kref+0x240c:   	sth	%l2, [%g2 + 6]
	.word	0xec1e0000	! t0_kref+0x2410:   	ldd	[%i0], %l6
	.word	0x9e12b0c8	! t0_kref+0x2414:   	or	%o2, -0xf38, %o7
	.word	0x91a01919	! t0_kref+0x2418:   	fitod	%f25, %f8
	.word	0xae330013	! t0_kref+0x241c:   	orn	%o4, %l3, %l7
	.word	0xee7e6018	! t0_kref+0x2420:   	swap	[%i1 + 0x18], %l7
	.word	0x9a1d8000	! t0_kref+0x2424:   	xor	%l6, %g0, %o5
	.word	0x25800001	! t0_kref+0x2428:   	fblg,a	_kref+0x242c
	.word	0x99a288c4	! t0_kref+0x242c:   	fsubd	%f10, %f4, %f12
	.word	0x81aa0adc	! t0_kref+0x2430:   	fcmped	%fcc0, %f8, %f28
	.word	0xe8762018	! t0_kref+0x2434:   	stx	%l4, [%i0 + 0x18]
	.word	0x963b3e2d	! t0_kref+0x2438:   	xnor	%o4, -0x1d3, %o3
	.word	0x36480004	! t0_kref+0x243c:   	bge,a,pt	%icc, _kref+0x244c
	.word	0x973de012	! t0_kref+0x2440:   	sra	%l7, 0x12, %o3
	.word	0xafb48057	! t0_kref+0x2444:   	edge8l	%l2, %l7, %l7
	.word	0x81ad8a32	! t0_kref+0x2448:   	fcmps	%fcc0, %f22, %f18
	.word	0xbbb44a25	! t0_kref+0x244c:   	fpadd16s	%f17, %f5, %f29
	.word	0xcf266000	! t0_kref+0x2450:   	st	%f7, [%i1]
	.word	0x97a0052b	! t0_kref+0x2454:   	fsqrts	%f11, %f11
	.word	0x2e480005	! t0_kref+0x2458:   	bvs,a,pt	%icc, _kref+0x246c
	.word	0x95a8405c	! t0_kref+0x245c:   	fmovdne	%fcc0, %f28, %f10
	.word	0x9ba68836	! t0_kref+0x2460:   	fadds	%f26, %f22, %f13
	.word	0xc0270019	! t0_kref+0x2464:   	clr	[%i4 + %i1]
	.word	0x21800006	! t0_kref+0x2468:   	fbn,a	_kref+0x2480
	.word	0x98a4e796	! t0_kref+0x246c:   	subcc	%l3, 0x796, %o4
	.word	0xf1be5817	! t0_kref+0x2470:   	stda	%f24, [%i1 + %l7]0xc0
	.word	0x91b300ec	! t0_kref+0x2474:   	edge16ln	%o4, %o4, %o0
	.word	0x8da0054c	! t0_kref+0x2478:   	fsqrtd	%f12, %f6
	.word	0x91b586ec	! t0_kref+0x247c:   	fmul8ulx16	%f22, %f12, %f8
	.word	0x9462c008	! t0_kref+0x2480:   	subc	%o3, %o0, %o2
	.word	0x9fa28932	! t0_kref+0x2484:   	fmuls	%f10, %f18, %f15
	.word	0xb9b48c8e	! t0_kref+0x2488:   	fandnot2	%f18, %f14, %f28
	.word	0xa1a01023	! t0_kref+0x248c:   	fstox	%f3, %f16
	sethi	%hi(1f), %o7
	jmpl	%o7+%lo(1f), %g1
	.empty
	.word	0xf91fbf70	! t0_kref+0x2498:   	ldd	[%fp - 0x90], %f28
!	.word	0x22823eca	! t0_kref+0x249c:   	be,a	SYM(t0_subr3)
	   	be,a	SYM(t0_subr3)
	.word	0x9e006008	! t0_kref+0x24a0:   	add	%g1, 8, %o7
	.word	0xe46e601e	! t0_kref+0x24a4:   	ldstub	[%i1 + 0x1e], %l2
1:	.word	0x36480004	! t0_kref+0x24a8:   	bge,a,pt	%icc, _kref+0x24b8
	.word	0x91a08933	! t0_kref+0x24ac:   	fmuls	%f2, %f19, %f8
	.word	0xa5b14aa7	! t0_kref+0x24b0:   	fpsub16s	%f5, %f7, %f18
	.word	0xb5b04df6	! t0_kref+0x24b4:   	fnands	%f1, %f22, %f26
	.word	0xe87e3fe0	! t0_kref+0x24b8:   	swap	[%i0 - 0x20], %l4
	.word	0xada44937	! t0_kref+0x24bc:   	fmuls	%f17, %f23, %f22
	.word	0xd0566008	! t0_kref+0x24c0:   	ldsh	[%i1 + 8], %o0
	.word	0x85a189c6	! t0_kref+0x24c4:   	fdivd	%f6, %f6, %f2
	.word	0x9bb3034b	! t0_kref+0x24c8:   	alignaddrl	%o4, %o3, %o5
	.word	0xada60927	! t0_kref+0x24cc:   	fmuls	%f24, %f7, %f22
	.word	0x33480005	! t0_kref+0x24d0:   	fbe,a,pt	%fcc0, _kref+0x24e4
	.word	0x92c4aef5	! t0_kref+0x24d4:   	addccc	%l2, 0xef5, %o1
	.word	0x9eda4017	! t0_kref+0x24d8:   	smulcc	%o1, %l7, %o7
	.word	0x81800000	! t0_kref+0x24dc:   	mov	%g0, %y
	.word	0x87a28938	! t0_kref+0x24e0:   	fmuls	%f10, %f24, %f3
	.word	0x3d800005	! t0_kref+0x24e4:   	fbule,a	_kref+0x24f8
	.word	0xa5a01116	! t0_kref+0x24e8:   	fxtod	%f22, %f18
	.word	0x9834000c	! t0_kref+0x24ec:   	orn	%l0, %o4, %o4
	.word	0x9fb2c0f4	! t0_kref+0x24f0:   	edge16ln	%o3, %l4, %o7
	.word	0xb1a01906	! t0_kref+0x24f4:   	fitod	%f6, %f24
	.word	0x8fa01a23	! t0_kref+0x24f8:   	fstoi	%f3, %f7
	.word	0xc0780019	! t0_kref+0x24fc:   	swap	[%g0 + %i1], %g0
	.word	0x81b50492	! t0_kref+0x2500:   	fcmple32	%f20, %f18, %g0
	.word	0xc0563fe6	! t0_kref+0x2504:   	ldsh	[%i0 - 0x1a], %g0
	.word	0x811a000c	! t0_kref+0x2508:   	tsubcctv	%o0, %o4, %g0
	.word	0xa1a589d8	! t0_kref+0x250c:   	fdivd	%f22, %f24, %f16
	.word	0x9e583967	! t0_kref+0x2510:   	smul	%g0, -0x699, %o7
	.word	0x90548017	! t0_kref+0x2514:   	umul	%l2, %l7, %o0
	.word	0xc000a020	! t0_kref+0x2518:   	ld	[%g2 + 0x20], %g0
	.word	0x25800002	! t0_kref+0x251c:   	fblg,a	_kref+0x2524
	.word	0x9ae03587	! t0_kref+0x2520:   	subccc	%g0, -0xa79, %o5
	.word	0xec1e3fe8	! t0_kref+0x2524:   	ldd	[%i0 - 0x18], %l6
	.word	0x97a18931	! t0_kref+0x2528:   	fmuls	%f6, %f17, %f11
	.word	0xe8360000	! t0_kref+0x252c:   	sth	%l4, [%i0]
	.word	0xe96e7ff0	! t0_kref+0x2530:   	prefetch	%i1 - 0x10, 20
	.word	0x9e92800c	! t0_kref+0x2534:   	orcc	%o2, %o4, %o7
	.word	0x95b4c091	! t0_kref+0x2538:   	edge16	%l3, %l1, %o2
	.word	0x9bb304c6	! t0_kref+0x253c:   	fcmpne32	%f12, %f6, %o5
	.word	0xd0780018	! t0_kref+0x2540:   	swap	[%g0 + %i0], %o0
	.word	0x94fc7b4b	! t0_kref+0x2544:   	sdivcc	%l1, -0x4b5, %o2
	call	SYM(t0_subr0)
	.word	0xd4480019	! t0_kref+0x254c:   	ldsb	[%g0 + %i1], %o2
	.word	0x2c800006	! t0_kref+0x2550:   	bneg,a	_kref+0x2568
	.word	0xc526201c	! t0_kref+0x2554:   	st	%f2, [%i0 + 0x1c]
	.word	0xa9a488d8	! t0_kref+0x2558:   	fsubd	%f18, %f24, %f20
	.word	0xa1b18f86	! t0_kref+0x255c:   	for	%f6, %f6, %f16
	.word	0x29480004	! t0_kref+0x2560:   	fbl,a,pt	%fcc0, _kref+0x2570
	.word	0x95b540ad	! t0_kref+0x2564:   	edge16n	%l5, %o5, %o2
	.word	0x80656d68	! t0_kref+0x2568:   	subc	%l5, 0xd68, %g0
	.word	0x31800002	! t0_kref+0x256c:   	fba,a	_kref+0x2574
	.word	0xd9be1812	! t0_kref+0x2570:   	stda	%f12, [%i0 + %l2]0xc0
	.word	0x91a00550	! t0_kref+0x2574:   	fsqrtd	%f16, %f8
	.word	0x96fa77d8	! t0_kref+0x2578:   	sdivcc	%o1, -0x828, %o3
	.word	0xc16e3ff0	! t0_kref+0x257c:   	prefetch	%i0 - 0x10, 0
	.word	0xdd1fbd70	! t0_kref+0x2580:   	ldd	[%fp - 0x290], %f14
	.word	0x99247dc5	! t0_kref+0x2584:   	mulscc	%l1, -0x23b, %o4
	.word	0xd2801018	! t0_kref+0x2588:   	lda	[%g0 + %i0]0x80, %o1
	.word	0xafa089ab	! t0_kref+0x258c:   	fdivs	%f2, %f11, %f23
	.word	0x9ab2800d	! t0_kref+0x2590:   	orncc	%o2, %o5, %o5
	.word	0x9255a8b3	! t0_kref+0x2594:   	umul	%l6, 0x8b3, %o1
	.word	0xa5a30d3d	! t0_kref+0x2598:   	fsmuld	%f12, %f29, %f18
	.word	0x9bb50050	! t0_kref+0x259c:   	edge8l	%l4, %l0, %o5
	.word	0x37480007	! t0_kref+0x25a0:   	fbge,a,pt	%fcc0, _kref+0x25bc
	.word	0xa9a01a3d	! t0_kref+0x25a4:   	fstoi	%f29, %f20
	.word	0x39800004	! t0_kref+0x25a8:   	fbuge,a	_kref+0x25b8
	.word	0xaead39d4	! t0_kref+0x25ac:   	andncc	%l4, -0x62c, %l7
	.word	0x90aae179	! t0_kref+0x25b0:   	andncc	%o3, 0x179, %o0
	.word	0xc51fbf48	! t0_kref+0x25b4:   	ldd	[%fp - 0xb8], %f2
	.word	0x81580000	! t0_kref+0x25b8:   	flushw
	.word	0x85a00544	! t0_kref+0x25bc:   	fsqrtd	%f4, %f2
	.word	0x31480008	! t0_kref+0x25c0:   	fba,a,pt	%fcc0, _kref+0x25e0
	.word	0x89b40e80	! t0_kref+0x25c4:   	fsrc1	%f16, %f4
	.word	0x81ac8ad8	! t0_kref+0x25c8:   	fcmped	%fcc0, %f18, %f24
	.word	0x92d83a98	! t0_kref+0x25cc:   	smulcc	%g0, -0x568, %o1
	.word	0x9254c00b	! t0_kref+0x25d0:   	umul	%l3, %o3, %o1
	.word	0xc9070018	! t0_kref+0x25d4:   	ld	[%i4 + %i0], %f4
	.word	0x21800002	! t0_kref+0x25d8:   	fbn,a	_kref+0x25e0
	.word	0xda500018	! t0_kref+0x25dc:   	ldsh	[%g0 + %i0], %o5
	.word	0xdb20a034	! t0_kref+0x25e0:   	st	%f13, [%g2 + 0x34]
	.word	0xe8700019	! t0_kref+0x25e4:   	stx	%l4, [%g0 + %i1]
	.word	0x22800005	! t0_kref+0x25e8:   	be,a	_kref+0x25fc
	.word	0x95400000	! t0_kref+0x25ec:   	mov	%y, %o2
	.word	0x85a18858	! t0_kref+0x25f0:   	faddd	%f6, %f24, %f2
	.word	0x23800002	! t0_kref+0x25f4:   	fbne,a	_kref+0x25fc
	.word	0xd0267ff4	! t0_kref+0x25f8:   	st	%o0, [%i1 - 0xc]
	.word	0xadb38c96	! t0_kref+0x25fc:   	fandnot2	%f14, %f22, %f22
	.word	0x89a34832	! t0_kref+0x2600:   	fadds	%f13, %f18, %f4
	.word	0x3d800008	! t0_kref+0x2604:   	fbule,a	_kref+0x2624
	.word	0xd83f4019	! t0_kref+0x2608:   	std	%o4, [%i5 + %i1]
	.word	0xc36e6018	! t0_kref+0x260c:   	prefetch	%i1 + 0x18, 1
	.word	0x36480007	! t0_kref+0x2610:   	bge,a,pt	%icc, _kref+0x262c
	.word	0x947ac012	! t0_kref+0x2614:   	sdiv	%o3, %l2, %o2
	.word	0x9eb5c017	! t0_kref+0x2618:   	orncc	%l7, %l7, %o7
	.word	0x9da00148	! t0_kref+0x261c:   	fabsd	%f8, %f14
	.word	0xa5a00122	! t0_kref+0x2620:   	fabss	%f2, %f18
	.word	0x95a0190f	! t0_kref+0x2624:   	fitod	%f15, %f10
	.word	0x24480008	! t0_kref+0x2628:   	ble,a,pt	%icc, _kref+0x2648
	.word	0xa7a00538	! t0_kref+0x262c:   	fsqrts	%f24, %f19
	.word	0x9da01905	! t0_kref+0x2630:   	fitod	%f5, %f14
	.word	0x3e480001	! t0_kref+0x2634:   	bvc,a,pt	%icc, _kref+0x2638
	.word	0x903b7538	! t0_kref+0x2638:   	xnor	%o5, -0xac8, %o0
	.word	0x9322c00d	! t0_kref+0x263c:   	mulscc	%o3, %o5, %o1
	.word	0x1b3e8807	! t0_kref+0x2640:   	sethi	%hi(0xfa201c00), %o5
	.word	0x89a5c8a4	! t0_kref+0x2644:   	fsubs	%f23, %f4, %f4
	.word	0xd1bf1a19	! t0_kref+0x2648:   	stda	%f8, [%i4 + %i1]0xd0
	.word	0x92952fb5	! t0_kref+0x264c:   	orcc	%l4, 0xfb5, %o1
	.word	0xb9b5871b	! t0_kref+0x2650:   	fmuld8sux16	%f22, %f27, %f28
	.word	0xf207bfe0	! t0_kref+0x2654:   	ld	[%fp - 0x20], %i1
	.word	0x2f3f8324	! t0_kref+0x2658:   	sethi	%hi(0xfe0c9000), %l7
	.word	0x20480003	! t0_kref+0x265c:   	bn,a,pt	%icc, _kref+0x2668
	.word	0x94d5000b	! t0_kref+0x2660:   	umulcc	%l4, %o3, %o2
	.word	0x85a3084e	! t0_kref+0x2664:   	faddd	%f12, %f14, %f2
	.word	0xe168a086	! t0_kref+0x2668:   	prefetch	%g2 + 0x86, 16
	.word	0x980d0008	! t0_kref+0x266c:   	and	%l4, %o0, %o4
	.word	0x27480008	! t0_kref+0x2670:   	fbul,a,pt	%fcc0, _kref+0x2690
	.word	0x8db5c622	! t0_kref+0x2674:   	fmul8x16	%f23, %f2, %f6
	.word	0x38480008	! t0_kref+0x2678:   	bgu,a,pt	%icc, _kref+0x2698
	.word	0x9452ef7b	! t0_kref+0x267c:   	umul	%o3, 0xf7b, %o2
	.word	0x90823268	! t0_kref+0x2680:   	addcc	%o0, -0xd98, %o0
	.word	0xc768a083	! t0_kref+0x2684:   	prefetch	%g2 + 0x83, 3
	.word	0xf4767fe0	! t0_kref+0x2688:   	stx	%i2, [%i1 - 0x20]
	.word	0xe13e2008	! t0_kref+0x268c:   	std	%f16, [%i0 + 8]
	.word	0x36800007	! t0_kref+0x2690:   	bge,a	_kref+0x26ac
	.word	0x93a01a52	! t0_kref+0x2694:   	fdtoi	%f18, %f9
	.word	0x94bc4015	! t0_kref+0x2698:   	xnorcc	%l1, %l5, %o2
	.word	0x96b4fc78	! t0_kref+0x269c:   	orncc	%l3, -0x388, %o3
	.word	0xaebdc00d	! t0_kref+0x26a0:   	xnorcc	%l7, %o5, %l7
	.word	0x95b08ed0	! t0_kref+0x26a4:   	fornot2	%f2, %f16, %f10
	.word	0x812c4000	! t0_kref+0x26a8:   	sll	%l1, %g0, %g0
	.word	0x2b800001	! t0_kref+0x26ac:   	fbug,a	_kref+0x26b0
	.word	0x9682f3de	! t0_kref+0x26b0:   	addcc	%o3, -0xc22, %o3
	.word	0xb7b007aa	! t0_kref+0x26b4:   	fpackfix	%f10, %f27
	.word	0x9515000b	! t0_kref+0x26b8:   	taddcctv	%l4, %o3, %o2
	.word	0x2b800005	! t0_kref+0x26bc:   	fbug,a	_kref+0x26d0
	.word	0xa9a4885c	! t0_kref+0x26c0:   	faddd	%f18, %f28, %f20
	.word	0xada0105c	! t0_kref+0x26c4:   	fdtox	%f28, %f22
	.word	0x81a88a46	! t0_kref+0x26c8:   	fcmpd	%fcc0, %f2, %f6
	.word	0x81ae8ad6	! t0_kref+0x26cc:   	fcmped	%fcc0, %f26, %f22
	.word	0xe16e401a	! t0_kref+0x26d0:   	prefetch	%i1 + %i2, 16
	.word	0x96fea98c	! t0_kref+0x26d4:   	sdivcc	%i2, 0x98c, %o3
	.word	0xe8180019	! t0_kref+0x26d8:   	ldd	[%g0 + %i1], %l4
	.word	0x9db20c88	! t0_kref+0x26dc:   	fandnot2	%f8, %f8, %f14
	.word	0x91a01913	! t0_kref+0x26e0:   	fitod	%f19, %f8
	.word	0xada0110c	! t0_kref+0x26e4:   	fxtod	%f12, %f22
	.word	0x3a480008	! t0_kref+0x26e8:   	bcc,a,pt	%icc, _kref+0x2708
	.word	0x8d840015	! t0_kref+0x26ec:   	wr	%l0, %l5, %fprs
	.word	0xec7e7ffc	! t0_kref+0x26f0:   	swap	[%i1 - 4], %l6
	.word	0x91b50c96	! t0_kref+0x26f4:   	fandnot2	%f20, %f22, %f8
	.word	0xf5be7fe0	! t0_kref+0x26f8:   	stda	%f26, [%i1 - 0x20]%asi
	.word	0x9a240016	! t0_kref+0x26fc:   	sub	%l0, %l6, %o5
	.word	0x90db7f03	! t0_kref+0x2700:   	smulcc	%o5, -0xfd, %o0
	.word	0x8035bdd4	! t0_kref+0x2704:   	orn	%l6, -0x22c, %g0
	.word	0x80b20014	! t0_kref+0x2708:   	orncc	%o0, %l4, %g0
	.word	0xd256c018	! t0_kref+0x270c:   	ldsh	[%i3 + %i0], %o1
	.word	0xd60e0000	! t0_kref+0x2710:   	ldub	[%i0], %o3
	.word	0x3b480002	! t0_kref+0x2714:   	fble,a,pt	%fcc0, _kref+0x271c
	.word	0xae830011	! t0_kref+0x2718:   	addcc	%o4, %l1, %l7
	.word	0x30480002	! t0_kref+0x271c:   	ba,a,pt	%icc, _kref+0x2724
	.word	0x985c3fb6	! t0_kref+0x2720:   	smul	%l0, -0x4a, %o4
	.word	0x3d480003	! t0_kref+0x2724:   	fbule,a,pt	%fcc0, _kref+0x2730
	.word	0xd11fbed0	! t0_kref+0x2728:   	ldd	[%fp - 0x130], %f8
	.word	0xb9a00554	! t0_kref+0x272c:   	fsqrtd	%f20, %f28
	.word	0x26800005	! t0_kref+0x2730:   	bl,a	_kref+0x2744
	.word	0x9da0c839	! t0_kref+0x2734:   	fadds	%f3, %f25, %f14
	.word	0xd07e3fe8	! t0_kref+0x2738:   	swap	[%i0 - 0x18], %o0
	.word	0x85b20a9a	! t0_kref+0x273c:   	fpsub16	%f8, %f26, %f2
	.word	0xb5a109c0	! t0_kref+0x2740:   	fdivd	%f4, %f0, %f26
	.word	0x87a00539	! t0_kref+0x2744:   	fsqrts	%f25, %f3
	.word	0x989d39d6	! t0_kref+0x2748:   	xorcc	%l4, -0x62a, %o4
	.word	0xec1e0000	! t0_kref+0x274c:   	ldd	[%i0], %l6
	.word	0xe51fbcc8	! t0_kref+0x2750:   	ldd	[%fp - 0x338], %f18
	.word	0x89a349b3	! t0_kref+0x2754:   	fdivs	%f13, %f19, %f4
	.word	0xe89e101d	! t0_kref+0x2758:   	ldda	[%i0 + %i5]0x80, %l4
	.word	0xda2e8018	! t0_kref+0x275c:   	stb	%o5, [%i2 + %i0]
	call	1f
	.empty
	.word	0xdb262018	! t0_kref+0x2764:   	st	%f13, [%i0 + 0x18]
	.word	0xb1b686f8	! t0_kref+0x2768:   	fmul8ulx16	%f26, %f24, %f24
	.word	0xbba01a4c	! t0_kref+0x276c:   	fdtoi	%f12, %f29
1:	.word	0x95b4432c	! t0_kref+0x2770:   	bmask	%l1, %o4, %o2
	.word	0x33480003	! t0_kref+0x2774:   	fbe,a,pt	%fcc0, _kref+0x2780
	.word	0x9862a769	! t0_kref+0x2778:   	subc	%o2, 0x769, %o4
	.word	0x971ca486	! t0_kref+0x277c:   	tsubcctv	%l2, 0x486, %o3
	.word	0xf007bfe0	! t0_kref+0x2780:   	ld	[%fp - 0x20], %i0
	.word	0xe91fbf88	! t0_kref+0x2784:   	ldd	[%fp - 0x78], %f20
	.word	0x37480008	! t0_kref+0x2788:   	fbge,a,pt	%fcc0, _kref+0x27a8
	.word	0x9a62c017	! t0_kref+0x278c:   	subc	%o3, %l7, %o5
	.word	0xeb68a00d	! t0_kref+0x2790:   	prefetch	%g2 + 0xd, 21
	.word	0x992dc012	! t0_kref+0x2794:   	sll	%l7, %l2, %o4
	.word	0x96d44015	! t0_kref+0x2798:   	umulcc	%l1, %l5, %o3
	.word	0x9da3c936	! t0_kref+0x279c:   	fmuls	%f15, %f22, %f14
	.word	0xada0054a	! t0_kref+0x27a0:   	fsqrtd	%f10, %f22
	.word	0x8da01905	! t0_kref+0x27a4:   	fitod	%f5, %f6
	.word	0x9682800d	! t0_kref+0x27a8:   	addcc	%o2, %o5, %o3
	.word	0x29480007	! t0_kref+0x27ac:   	fbl,a,pt	%fcc0, _kref+0x27c8
	.word	0x9e0d72a3	! t0_kref+0x27b0:   	and	%l5, -0xd5d, %o7
	.word	0x99a00148	! t0_kref+0x27b4:   	fabsd	%f8, %f12
	.word	0x3a480003	! t0_kref+0x27b8:   	bcc,a,pt	%icc, _kref+0x27c4
	.word	0xa5b007a4	! t0_kref+0x27bc:   	fpackfix	%f4, %f18
	.word	0x8db18a28	! t0_kref+0x27c0:   	fpadd16s	%f6, %f8, %f6
	.word	0x3f800007	! t0_kref+0x27c4:   	fbo,a	_kref+0x27e0
	.word	0xd0866004	! t0_kref+0x27c8:   	lda	[%i1 + 4]%asi, %o0
	.word	0x92e28017	! t0_kref+0x27cc:   	subccc	%o2, %l7, %o1
	.word	0xaf408000	! t0_kref+0x27d0:   	mov	%ccr, %l7
	.word	0x99a8004a	! t0_kref+0x27d4:   	fmovdn	%fcc0, %f10, %f12
	.word	0x81a90a56	! t0_kref+0x27d8:   	fcmpd	%fcc0, %f4, %f22
	.word	0x99a0055c	! t0_kref+0x27dc:   	fsqrtd	%f28, %f12
	.word	0xecf6501d	! t0_kref+0x27e0:   	stxa	%l6, [%i1 + %i5]0x80
	.word	0x3d480005	! t0_kref+0x27e4:   	fbule,a,pt	%fcc0, _kref+0x27f8
	.word	0x97b2040c	! t0_kref+0x27e8:   	fcmple16	%f8, %f12, %o3
	.word	0xe81e6010	! t0_kref+0x27ec:   	ldd	[%i1 + 0x10], %l4
	.word	0x9a44401a	! t0_kref+0x27f0:   	addc	%l1, %i2, %o5
	.word	0x31800001	! t0_kref+0x27f4:   	fba,a	_kref+0x27f8
	.word	0xd8564000	! t0_kref+0x27f8:   	ldsh	[%i1], %o4
	.word	0x97a000a4	! t0_kref+0x27fc:   	fnegs	%f4, %f11
	.word	0x2a480003	! t0_kref+0x2800:   	bcs,a,pt	%icc, _kref+0x280c
	.word	0x99a0193a	! t0_kref+0x2804:   	fstod	%f26, %f12
	.word	0x9f320014	! t0_kref+0x2808:   	srl	%o0, %l4, %o7
	.word	0xe99e1a1b	! t0_kref+0x280c:   	ldda	[%i0 + %i3]0xd0, %f20
	.word	0x1b24fe47	! t0_kref+0x2810:   	sethi	%hi(0x93f91c00), %o5
	.word	0x91b00111	! t0_kref+0x2814:   	edge32	%g0, %l1, %o0
	.word	0x99a00130	! t0_kref+0x2818:   	fabss	%f16, %f12
	.word	0xb9a0013d	! t0_kref+0x281c:   	fabss	%f29, %f28
	.word	0x2e480002	! t0_kref+0x2820:   	bvs,a,pt	%icc, _kref+0x2828
	.word	0xd47e601c	! t0_kref+0x2824:   	swap	[%i1 + 0x1c], %o2
	.word	0x24800003	! t0_kref+0x2828:   	ble,a	_kref+0x2834
	.word	0xd67f0019	! t0_kref+0x282c:   	swap	[%i4 + %i1], %o3
	.word	0xb1a6892f	! t0_kref+0x2830:   	fmuls	%f26, %f15, %f24
	.word	0x9e16b738	! t0_kref+0x2834:   	or	%i2, -0x8c8, %o7
	.word	0x9db40a08	! t0_kref+0x2838:   	fpadd16	%f16, %f8, %f14
	.word	0xd04e8019	! t0_kref+0x283c:   	ldsb	[%i2 + %i1], %o0
	.word	0x905cebb4	! t0_kref+0x2840:   	smul	%l3, 0xbb4, %o0
	.word	0x35800008	! t0_kref+0x2844:   	fbue,a	_kref+0x2864
	.word	0xc46e8000	! t0_kref+0x2848:   	ldstub	[%i2], %g2
	.word	0xd91fbea8	! t0_kref+0x284c:   	ldd	[%fp - 0x158], %f12
	.word	0xd226200c	! t0_kref+0x2850:   	st	%o1, [%i0 + 0xc]
	.word	0xc51fbc40	! t0_kref+0x2854:   	ldd	[%fp - 0x3c0], %f2
	.word	0x9b2dc012	! t0_kref+0x2858:   	sll	%l7, %l2, %o5
	.word	0xb5a01098	! t0_kref+0x285c:   	fxtos	%f24, %f26
	.word	0x806270c9	! t0_kref+0x2860:   	subc	%o1, -0xf37, %g0
	.word	0x26480002	! t0_kref+0x2864:   	bl,a,pt	%icc, _kref+0x286c
	.word	0xee4e001a	! t0_kref+0x2868:   	ldsb	[%i0 + %i2], %l7
	.word	0x81ac0a4a	! t0_kref+0x286c:   	fcmpd	%fcc0, %f16, %f10
	.word	0x9a627696	! t0_kref+0x2870:   	subc	%o1, -0x96a, %o5
	.word	0xb1b38a08	! t0_kref+0x2874:   	fpadd16	%f14, %f8, %f24
	.word	0x95b6c634	! t0_kref+0x2878:   	fmul8x16	%f27, %f20, %f10
	.word	0x2e800001	! t0_kref+0x287c:   	bvs,a	_kref+0x2880
	.word	0x9110000b	! t0_kref+0x2880:   	taddcctv	%g0, %o3, %o0
	.word	0xa1a000a1	! t0_kref+0x2884:   	fnegs	%f1, %f16
	.word	0xda263fec	! t0_kref+0x2888:   	st	%o5, [%i0 - 0x14]
	.word	0x9de3bfa0	! t0_kref+0x288c:   	save	%sp, -0x60, %sp
	.word	0x97ef324f	! t0_kref+0x2890:   	restore	%i4, -0xdb1, %o3
	.word	0x36480007	! t0_kref+0x2894:   	bge,a,pt	%icc, _kref+0x28b0
	.word	0xe22e2012	! t0_kref+0x2898:   	stb	%l1, [%i0 + 0x12]
	.word	0x802b0014	! t0_kref+0x289c:   	andn	%o4, %l4, %g0
	.word	0x95b5c354	! t0_kref+0x28a0:   	alignaddrl	%l7, %l4, %o2
	.word	0x1b178845	! t0_kref+0x28a4:   	sethi	%hi(0x5e211400), %o5
	.word	0xb3a5c83a	! t0_kref+0x28a8:   	fadds	%f23, %f26, %f25
	.word	0x9bb58048	! t0_kref+0x28ac:   	edge8l	%l6, %o0, %o5
	.word	0x9db206fc	! t0_kref+0x28b0:   	fmul8ulx16	%f8, %f28, %f14
	.word	0x83414000	! t0_kref+0x28b4:   	mov	%pc, %g1
	.word	0x9da2084a	! t0_kref+0x28b8:   	faddd	%f8, %f10, %f14
	.word	0x98a68011	! t0_kref+0x28bc:   	subcc	%i2, %l1, %o4
	.word	0xd300a028	! t0_kref+0x28c0:   	ld	[%g2 + 0x28], %f9
	.word	0xe2f8a000	! t0_kref+0x28c4:   	swapa	[%g2]%asi, %l1
	.word	0x83414000	! t0_kref+0x28c8:   	mov	%pc, %g1
	.word	0x92bb284d	! t0_kref+0x28cc:   	xnorcc	%o4, 0x84d, %o1
	.word	0x9e8d4012	! t0_kref+0x28d0:   	andcc	%l5, %l2, %o7
	.word	0x972026bf	! t0_kref+0x28d4:   	mulscc	%g0, 0x6bf, %o3
	.word	0x92853785	! t0_kref+0x28d8:   	addcc	%l4, -0x87b, %o1
	.word	0x8fb00ce3	! t0_kref+0x28dc:   	fnot2s	%f3, %f7
	.word	0x921e800d	! t0_kref+0x28e0:   	xor	%i2, %o5, %o1
	.word	0x28480006	! t0_kref+0x28e4:   	bleu,a,pt	%icc, _kref+0x28fc
	.word	0x91224015	! t0_kref+0x28e8:   	mulscc	%o1, %l5, %o0
	.word	0x81868000	! t0_kref+0x28ec:   	wr	%i2, %g0, %y
	.word	0x9764c009	! t0_kref+0x28f0:   	movl	%icc, %o1, %o3
	.word	0xa1a01a54	! t0_kref+0x28f4:   	fdtoi	%f20, %f16
	.word	0x81b54056	! t0_kref+0x28f8:   	edge8l	%l5, %l6, %g0
	.word	0xc020a000	! t0_kref+0x28fc:   	clr	[%g2]
	.word	0xfb00a008	! t0_kref+0x2900:   	ld	[%g2 + 8], %f29
	.word	0xde861000	! t0_kref+0x2904:   	lda	[%i0]0x80, %o7
	.word	0x81a84aa8	! t0_kref+0x2908:   	fcmpes	%fcc0, %f1, %f8
	.word	0x94b48017	! t0_kref+0x290c:   	orncc	%l2, %l7, %o2
	.word	0xc04e8019	! t0_kref+0x2910:   	ldsb	[%i2 + %i1], %g0
	.word	0x9fb4cda2	! t0_kref+0x2914:   	fxors	%f19, %f2, %f15
	.word	0x2b800006	! t0_kref+0x2918:   	fbug,a	_kref+0x2930
	.word	0xd51fbe88	! t0_kref+0x291c:   	ldd	[%fp - 0x178], %f10
	.word	0xe43e6018	! t0_kref+0x2920:   	std	%l2, [%i1 + 0x18]
	.word	0xb9a509ca	! t0_kref+0x2924:   	fdivd	%f20, %f10, %f28
	.word	0x971ca31d	! t0_kref+0x2928:   	tsubcctv	%l2, 0x31d, %o3
	.word	0x9edc0009	! t0_kref+0x292c:   	smulcc	%l0, %o1, %o7
	.word	0xda36c019	! t0_kref+0x2930:   	sth	%o5, [%i3 + %i1]
	.word	0xd890a018	! t0_kref+0x2934:   	lduha	[%g2 + 0x18]%asi, %o4
	.word	0x32800002	! t0_kref+0x2938:   	bne,a	_kref+0x2940
	.word	0xada01a30	! t0_kref+0x293c:   	fstoi	%f16, %f22
	.word	0xb9a00552	! t0_kref+0x2940:   	fsqrtd	%f18, %f28
	.word	0x85a189d2	! t0_kref+0x2944:   	fdivd	%f6, %f18, %f2
	.word	0x9b24355f	! t0_kref+0x2948:   	mulscc	%l0, -0xaa1, %o5
	.word	0xb5a000c2	! t0_kref+0x294c:   	fnegd	%f2, %f26
	.word	0xee40a01c	! t0_kref+0x2950:   	ldsw	[%g2 + 0x1c], %l7
	.word	0x85a01932	! t0_kref+0x2954:   	fstod	%f18, %f2
	.word	0x87802080	! t0_kref+0x2958:   	mov	0x80, %asi
	.word	0x81ad4aa3	! t0_kref+0x295c:   	fcmpes	%fcc0, %f21, %f3
	.word	0x93a00526	! t0_kref+0x2960:   	fsqrts	%f6, %f9
	.word	0x89a01a34	! t0_kref+0x2964:   	fstoi	%f20, %f4
	.word	0xa7a289ba	! t0_kref+0x2968:   	fdivs	%f10, %f26, %f19
	.word	0x90157fed	! t0_kref+0x296c:   	or	%l5, -0x13, %o0
	.word	0x923c800d	! t0_kref+0x2970:   	xnor	%l2, %o5, %o1
	.word	0x9b70000d	! t0_kref+0x2974:   	popc	%o5, %o5
	.word	0xd20e001a	! t0_kref+0x2978:   	ldub	[%i0 + %i2], %o1
	.word	0x31800005	! t0_kref+0x297c:   	fba,a	_kref+0x2990
	.word	0xd0380018	! t0_kref+0x2980:   	std	%o0, [%g0 + %i0]
	.word	0x809cbf91	! t0_kref+0x2984:   	xorcc	%l2, -0x6f, %g0
	.word	0xd2a8a036	! t0_kref+0x2988:   	stba	%o1, [%g2 + 0x36]%asi
	.word	0x91b2ce3a	! t0_kref+0x298c:   	fands	%f11, %f26, %f8
	.word	0x80a54014	! t0_kref+0x2990:   	cmp	%l5, %l4
	.word	0x91b68f90	! t0_kref+0x2994:   	for	%f26, %f16, %f8
	.word	0x808a000b	! t0_kref+0x2998:   	btst	%o3, %o0
	.word	0x2d800001	! t0_kref+0x299c:   	fbg,a	_kref+0x29a0
	.word	0xb1b64dfc	! t0_kref+0x29a0:   	fnands	%f25, %f28, %f24
	.word	0x981a000b	! t0_kref+0x29a4:   	xor	%o0, %o3, %o4
	.word	0x9524b560	! t0_kref+0x29a8:   	mulscc	%l2, -0xaa0, %o2
	.word	0xdc3826c0	! t0_kref+0x29ac:   	std	%sp, [%g0 + 0x6c0]
	.word	0x80c68012	! t0_kref+0x29b0:   	addccc	%i2, %l2, %g0
	.word	0x27800007	! t0_kref+0x29b4:   	fbul,a	_kref+0x29d0
	.word	0x93b48176	! t0_kref+0x29b8:   	edge32ln	%l2, %l6, %o1
	.word	0x9da00554	! t0_kref+0x29bc:   	fsqrtd	%f20, %f14
	.word	0x81b6048a	! t0_kref+0x29c0:   	fcmple32	%f24, %f10, %g0
	.word	0xe91e6008	! t0_kref+0x29c4:   	ldd	[%i1 + 8], %f20
	.word	0x15360454	! t0_kref+0x29c8:   	sethi	%hi(0xd8115000), %o2
	.word	0xa5a01912	! t0_kref+0x29cc:   	fitod	%f18, %f18
	.word	0x81848000	! t0_kref+0x29d0:   	wr	%l2, %g0, %y
	.word	0xa1b28756	! t0_kref+0x29d4:   	fpack32	%f10, %f22, %f16
	.word	0xf4a8a035	! t0_kref+0x29d8:   	stba	%i2, [%g2 + 0x35]%asi
	.word	0x80642303	! t0_kref+0x29dc:   	subc	%l0, 0x303, %g0
	.word	0x800577c7	! t0_kref+0x29e0:   	add	%l5, -0x839, %g0
	.word	0x9add2860	! t0_kref+0x29e4:   	smulcc	%l4, 0x860, %o5
	.word	0xe62e600c	! t0_kref+0x29e8:   	stb	%l3, [%i1 + 0xc]
	.word	0x9e8cc01a	! t0_kref+0x29ec:   	andcc	%l3, %i2, %o7
	.word	0x32800003	! t0_kref+0x29f0:   	bne,a	_kref+0x29fc
	.word	0xae9a2952	! t0_kref+0x29f4:   	xorcc	%o0, 0x952, %l7
	.word	0x963c6eca	! t0_kref+0x29f8:   	xnor	%l1, 0xeca, %o3
	.word	0xd91fbd28	! t0_kref+0x29fc:   	ldd	[%fp - 0x2d8], %f12
	.word	0x31800001	! t0_kref+0x2a00:   	fba,a	_kref+0x2a04
	.word	0xf19e5a1a	! t0_kref+0x2a04:   	ldda	[%i1 + %i2]0xd0, %f24
	.word	0x89a5c8ae	! t0_kref+0x2a08:   	fsubs	%f23, %f14, %f4
	.word	0xc04e7fff	! t0_kref+0x2a0c:   	ldsb	[%i1 - 1], %g0
	.word	0x95b48624	! t0_kref+0x2a10:   	fmul8x16	%f18, %f4, %f10
	.word	0xec6e3ffb	! t0_kref+0x2a14:   	ldstub	[%i0 - 5], %l6
	.word	0x81aa8ad0	! t0_kref+0x2a18:   	fcmped	%fcc0, %f10, %f16
	.word	0x89b48c82	! t0_kref+0x2a1c:   	fandnot2	%f18, %f2, %f4
	.word	0xa7a00524	! t0_kref+0x2a20:   	fsqrts	%f4, %f19
	.word	0xf83e4000	! t0_kref+0x2a24:   	std	%i4, [%i1]
	.word	0xe76e6000	! t0_kref+0x2a28:   	prefetch	%i1, 19
	.word	0xda862000	! t0_kref+0x2a2c:   	lda	[%i0]%asi, %o5
	.word	0x87a00136	! t0_kref+0x2a30:   	fabss	%f22, %f3
	.word	0x83414000	! t0_kref+0x2a34:   	mov	%pc, %g1
	.word	0x9a524014	! t0_kref+0x2a38:   	umul	%o1, %l4, %o5
	.word	0x85b70af8	! t0_kref+0x2a3c:   	fpsub32s	%f28, %f24, %f2
	.word	0x130319ce	! t0_kref+0x2a40:   	sethi	%hi(0xc673800), %o1
	.word	0x81db8015	! t0_kref+0x2a44:   	flush	%sp + %l5
	.word	0x9a72e177	! t0_kref+0x2a48:   	udiv	%o3, 0x177, %o5
	.word	0xb7a00527	! t0_kref+0x2a4c:   	fsqrts	%f7, %f27
	.word	0xda26001c	! t0_kref+0x2a50:   	st	%o5, [%i0 + %i4]
	.word	0x81ad8ac4	! t0_kref+0x2a54:   	fcmped	%fcc0, %f22, %f4
	.word	0xae7ac00b	! t0_kref+0x2a58:   	sdiv	%o3, %o3, %l7
	.word	0x9da00522	! t0_kref+0x2a5c:   	fsqrts	%f2, %f14
	.word	0xc11fbc10	! t0_kref+0x2a60:   	ldd	[%fp - 0x3f0], %f0
	.word	0xd6000019	! t0_kref+0x2a64:   	ld	[%g0 + %i1], %o3
	.word	0x81220014	! t0_kref+0x2a68:   	mulscc	%o0, %l4, %g0
	call	SYM(t0_subr3)
	.word	0xf120a034	! t0_kref+0x2a70:   	st	%f24, [%g2 + 0x34]
	.word	0x912da013	! t0_kref+0x2a74:   	sll	%l6, 0x13, %o0
	.word	0x9eda8010	! t0_kref+0x2a78:   	smulcc	%o2, %l0, %o7
	.word	0xd46e3ff9	! t0_kref+0x2a7c:   	ldstub	[%i0 - 7], %o2
	.word	0x92dd8009	! t0_kref+0x2a80:   	smulcc	%l6, %o1, %o1
	.word	0xb9b00fc0	! t0_kref+0x2a84:   	fone	%f28
	.word	0xda96601e	! t0_kref+0x2a88:   	lduha	[%i1 + 0x1e]%asi, %o5
	.word	0x808278f1	! t0_kref+0x2a8c:   	addcc	%o1, -0x70f, %g0
	.word	0x8064f521	! t0_kref+0x2a90:   	subc	%l3, -0xadf, %g0
	.word	0x83b00c20	! t0_kref+0x2a94:   	fzeros	%f1
	.word	0xa5b18630	! t0_kref+0x2a98:   	fmul8x16	%f6, %f16, %f18
	.word	0x23480004	! t0_kref+0x2a9c:   	fbne,a,pt	%fcc0, _kref+0x2aac
	.word	0x949c7e9f	! t0_kref+0x2aa0:   	xorcc	%l1, -0x161, %o2
	.word	0x24480007	! t0_kref+0x2aa4:   	ble,a,pt	%icc, _kref+0x2ac0
	.word	0x1b3d5ac8	! t0_kref+0x2aa8:   	sethi	%hi(0xf56b2000), %o5
	.word	0x9865662c	! t0_kref+0x2aac:   	subc	%l5, 0x62c, %o4
	.word	0xfdee501a	! t0_kref+0x2ab0:   	prefetcha	%i1 + %i2, 30
	.word	0x89b686e2	! t0_kref+0x2ab4:   	fmul8ulx16	%f26, %f2, %f4
	.word	0x1b3ab640	! t0_kref+0x2ab8:   	sethi	%hi(0xead90000), %o5
	.word	0x20800007	! t0_kref+0x2abc:   	bn,a	_kref+0x2ad8
	.word	0x9b2278e5	! t0_kref+0x2ac0:   	mulscc	%o1, -0x71b, %o5
	.word	0x24800004	! t0_kref+0x2ac4:   	ble,a	_kref+0x2ad4
	.word	0xa9a01907	! t0_kref+0x2ac8:   	fitod	%f7, %f20
	.word	0x80868012	! t0_kref+0x2acc:   	addcc	%i2, %l2, %g0
	.word	0xaf22aba6	! t0_kref+0x2ad0:   	mulscc	%o2, 0xba6, %l7
	.word	0x99b54171	! t0_kref+0x2ad4:   	edge32ln	%l5, %l1, %o4
	.word	0x013d34a6	! t0_kref+0x2ad8:   	sethi	%hi(0xf4d29800), %g0
	.word	0x90548014	! t0_kref+0x2adc:   	umul	%l2, %l4, %o0
	.word	0xada509cc	! t0_kref+0x2ae0:   	fdivd	%f20, %f12, %f22
	.word	0x2f480003	! t0_kref+0x2ae4:   	fbu,a,pt	%fcc0, _kref+0x2af0
	.word	0xde563ff8	! t0_kref+0x2ae8:   	ldsh	[%i0 - 8], %o7
	.word	0x8ba209ab	! t0_kref+0x2aec:   	fdivs	%f8, %f11, %f5
	.word	0x9bb30116	! t0_kref+0x2af0:   	edge32	%o4, %l6, %o5
	.word	0x81824000	! t0_kref+0x2af4:   	wr	%o1, %g0, %y
	.word	0x30800001	! t0_kref+0x2af8:   	ba,a	_kref+0x2afc
	.word	0xeb066010	! t0_kref+0x2afc:   	ld	[%i1 + 0x10], %f21
	.word	0x949eb6f5	! t0_kref+0x2b00:   	xorcc	%i2, -0x90b, %o2
	.word	0x27800004	! t0_kref+0x2b04:   	fbul,a	_kref+0x2b14
	.word	0x1f2bdfd5	! t0_kref+0x2b08:   	sethi	%hi(0xaf7f5400), %o7
	.word	0x9a144008	! t0_kref+0x2b0c:   	or	%l1, %o0, %o5
	.word	0x81ad0aac	! t0_kref+0x2b10:   	fcmpes	%fcc0, %f20, %f12
	.word	0x81aa0acc	! t0_kref+0x2b14:   	fcmped	%fcc0, %f8, %f12
	.word	0x91b48169	! t0_kref+0x2b18:   	edge32ln	%l2, %o1, %o0
	.word	0x95a44829	! t0_kref+0x2b1c:   	fadds	%f17, %f9, %f10
	.word	0x9afeb34f	! t0_kref+0x2b20:   	sdivcc	%i2, -0xcb1, %o5
	.word	0x9e327eb6	! t0_kref+0x2b24:   	orn	%o1, -0x14a, %o7
	.word	0x8db00fc0	! t0_kref+0x2b28:   	fone	%f6
	.word	0xec1e4000	! t0_kref+0x2b2c:   	ldd	[%i1], %l6
	.word	0x80fa6da6	! t0_kref+0x2b30:   	sdivcc	%o1, 0xda6, %g0
	.word	0xa9b00fe0	! t0_kref+0x2b34:   	fones	%f20
	.word	0x9fc10000	! t0_kref+0x2b38:   	call	%g4
	.word	0x9abb2f76	! t0_kref+0x2b3c:   	xnorcc	%o4, 0xf76, %o5
	.word	0xf4a71018	! t0_kref+0x2b40:   	sta	%i2, [%i4 + %i0]0x80
	.word	0x36480003	! t0_kref+0x2b44:   	bge,a,pt	%icc, _kref+0x2b50
	.word	0x9e824012	! t0_kref+0x2b48:   	addcc	%o1, %l2, %o7
	.word	0xe26e3fe7	! t0_kref+0x2b4c:   	ldstub	[%i0 - 0x19], %l1
	.word	0x81a00556	! t0_kref+0x2b50:   	fsqrtd	%f22, %f0
	.word	0x81ae4a26	! t0_kref+0x2b54:   	fcmps	%fcc0, %f25, %f6
	.word	0xec9e3fe8	! t0_kref+0x2b58:   	ldda	[%i0 - 0x18]%asi, %l6
	.word	0xda0e0000	! t0_kref+0x2b5c:   	ldub	[%i0], %o5
	.word	0xbba000a1	! t0_kref+0x2b60:   	fnegs	%f1, %f29
	.word	0x9b240017	! t0_kref+0x2b64:   	mulscc	%l0, %l7, %o5
	.word	0x80152111	! t0_kref+0x2b68:   	or	%l4, 0x111, %g0
	.word	0x2b800002	! t0_kref+0x2b6c:   	fbug,a	_kref+0x2b74
	.word	0xc04e600d	! t0_kref+0x2b70:   	ldsb	[%i1 + 0xd], %g0
	.word	0x28480008	! t0_kref+0x2b74:   	bleu,a,pt	%icc, _kref+0x2b94
	.word	0xa5a348b4	! t0_kref+0x2b78:   	fsubs	%f13, %f20, %f18
	.word	0xd4a0a030	! t0_kref+0x2b7c:   	sta	%o2, [%g2 + 0x30]%asi
	.word	0xe6262008	! t0_kref+0x2b80:   	st	%l3, [%i0 + 8]
	.word	0x9635af2b	! t0_kref+0x2b84:   	orn	%l6, 0xf2b, %o3
	.word	0x963c000b	! t0_kref+0x2b88:   	xnor	%l0, %o3, %o3
	.word	0xb9a01937	! t0_kref+0x2b8c:   	fstod	%f23, %f28
	.word	0x35480001	! t0_kref+0x2b90:   	fbue,a,pt	%fcc0, _kref+0x2b94
	.word	0x92ba0008	! t0_kref+0x2b94:   	xnorcc	%o0, %o0, %o1
	.word	0xb9b60a7c	! t0_kref+0x2b98:   	fpadd32s	%f24, %f28, %f28
	.word	0xa1b1062c	! t0_kref+0x2b9c:   	fmul8x16	%f4, %f12, %f16
	.word	0x3d800002	! t0_kref+0x2ba0:   	fbule,a	_kref+0x2ba8
	.word	0x95a0104c	! t0_kref+0x2ba4:   	fdtox	%f12, %f10
	.word	0x9fa2093b	! t0_kref+0x2ba8:   	fmuls	%f8, %f27, %f15
	.word	0x89b50f5c	! t0_kref+0x2bac:   	fornot1	%f20, %f28, %f4
	.word	0xe220a008	! t0_kref+0x2bb0:   	st	%l1, [%g2 + 8]
	.word	0xc5262018	! t0_kref+0x2bb4:   	st	%f2, [%i0 + 0x18]
	.word	0x9de3bfa0	! t0_kref+0x2bb8:   	save	%sp, -0x60, %sp
	.word	0x93ef401d	! t0_kref+0x2bbc:   	restore	%i5, %i5, %o1
	.word	0xed68a04c	! t0_kref+0x2bc0:   	prefetch	%g2 + 0x4c, 22
	.word	0x24800008	! t0_kref+0x2bc4:   	ble,a	_kref+0x2be4
	.word	0x8bb40a6a	! t0_kref+0x2bc8:   	fpadd32s	%f16, %f10, %f5
	.word	0x80fd7e4b	! t0_kref+0x2bcc:   	sdivcc	%l5, -0x1b5, %g0
	.word	0xc06e7fe0	! t0_kref+0x2bd0:   	ldstub	[%i1 - 0x20], %g0
	.word	0xd4b0a024	! t0_kref+0x2bd4:   	stha	%o2, [%g2 + 0x24]%asi
	.word	0xc00e8019	! t0_kref+0x2bd8:   	ldub	[%i2 + %i1], %g0
	.word	0x81ad0a46	! t0_kref+0x2bdc:   	fcmpd	%fcc0, %f20, %f6
	.word	0x2a800003	! t0_kref+0x2be0:   	bcs,a	_kref+0x2bec
	.word	0x85a0014c	! t0_kref+0x2be4:   	fabsd	%f12, %f2
	.word	0x9f414000	! t0_kref+0x2be8:   	mov	%pc, %o7
	.word	0x878020d0	! t0_kref+0x2bec:   	mov	0xd0, %asi
	.word	0x81a90aca	! t0_kref+0x2bf0:   	fcmped	%fcc0, %f4, %f10
	.word	0x9055aa51	! t0_kref+0x2bf4:   	umul	%l6, 0xa51, %o0
	.word	0x9e9ac013	! t0_kref+0x2bf8:   	xorcc	%o3, %l3, %o7
	.word	0x991b7076	! t0_kref+0x2bfc:   	tsubcctv	%o5, -0xf8a, %o4
	.word	0x95a2092e	! t0_kref+0x2c00:   	fmuls	%f8, %f14, %f10
	.word	0xd44e4000	! t0_kref+0x2c04:   	ldsb	[%i1], %o2
	.word	0xd900a008	! t0_kref+0x2c08:   	ld	[%g2 + 8], %f12
	.word	0x9b70000c	! t0_kref+0x2c0c:   	popc	%o4, %o5
	.word	0xe300a004	! t0_kref+0x2c10:   	ld	[%g2 + 4], %f17
	.word	0x81a98ad4	! t0_kref+0x2c14:   	fcmped	%fcc0, %f6, %f20
	.word	0xae7d33ad	! t0_kref+0x2c18:   	sdiv	%l4, -0xc53, %l7
	.word	0xafa000bd	! t0_kref+0x2c1c:   	fnegs	%f29, %f23
	.word	0x992b201b	! t0_kref+0x2c20:   	sll	%o4, 0x1b, %o4
	.word	0x9f24e6d0	! t0_kref+0x2c24:   	mulscc	%l3, 0x6d0, %o7
	.word	0xf007bfe0	! t0_kref+0x2c28:   	ld	[%fp - 0x20], %i0
	.word	0x920d001a	! t0_kref+0x2c2c:   	and	%l4, %i2, %o1
	.word	0xa9a00538	! t0_kref+0x2c30:   	fsqrts	%f24, %f20
	.word	0x91b68170	! t0_kref+0x2c34:   	edge32ln	%i2, %l0, %o0
	.word	0x9e940016	! t0_kref+0x2c38:   	orcc	%l0, %l6, %o7
	.word	0xaba01a22	! t0_kref+0x2c3c:   	fstoi	%f2, %f21
	.word	0xee0e201e	! t0_kref+0x2c40:   	ldub	[%i0 + 0x1e], %l7
	.word	0xd91fbf58	! t0_kref+0x2c44:   	ldd	[%fp - 0xa8], %f12
	.word	0xae93000b	! t0_kref+0x2c48:   	orcc	%o4, %o3, %l7
	.word	0x2e480007	! t0_kref+0x2c4c:   	bvs,a,pt	%icc, _kref+0x2c68
	.word	0x9ba249b0	! t0_kref+0x2c50:   	fdivs	%f9, %f16, %f13
	.word	0x927cf0a6	! t0_kref+0x2c54:   	sdiv	%l3, -0xf5a, %o1
	.word	0xbbb5ce27	! t0_kref+0x2c58:   	fands	%f23, %f7, %f29
	.word	0x987e8011	! t0_kref+0x2c5c:   	sdiv	%i2, %l1, %o4
	.word	0xe7ee501d	! t0_kref+0x2c60:   	prefetcha	%i1 + %i5, 19
	.word	0xd468a023	! t0_kref+0x2c64:   	ldstub	[%g2 + 0x23], %o2
	.word	0x81b50542	! t0_kref+0x2c68:   	fcmpeq16	%f20, %f2, %g0
	.word	0x933d0011	! t0_kref+0x2c6c:   	sra	%l4, %l1, %o1
	.word	0x24800006	! t0_kref+0x2c70:   	ble,a	_kref+0x2c88
	.word	0xb1a00521	! t0_kref+0x2c74:   	fsqrts	%f1, %f24
	.word	0x9a637ff3	! t0_kref+0x2c78:   	subc	%o5, -0xd, %o5
	.word	0x9a7ca8e8	! t0_kref+0x2c7c:   	sdiv	%l2, 0x8e8, %o5
	.word	0x8da01928	! t0_kref+0x2c80:   	fstod	%f8, %f6
	.word	0x81a98aca	! t0_kref+0x2c84:   	fcmped	%fcc0, %f6, %f10
	.word	0x151bd439	! t0_kref+0x2c88:   	sethi	%hi(0x6f50e400), %o2
	.word	0x94a44016	! t0_kref+0x2c8c:   	subcc	%l1, %l6, %o2
	.word	0x38480006	! t0_kref+0x2c90:   	bgu,a,pt	%icc, _kref+0x2ca8
	.word	0xc368a00b	! t0_kref+0x2c94:   	prefetch	%g2 + 0xb, 1
	.word	0x985dc00a	! t0_kref+0x2c98:   	smul	%l7, %o2, %o4
	.word	0x8fa00536	! t0_kref+0x2c9c:   	fsqrts	%f22, %f7
	.word	0x2c480004	! t0_kref+0x2ca0:   	bneg,a,pt	%icc, _kref+0x2cb0
	.word	0x96dcc008	! t0_kref+0x2ca4:   	smulcc	%l3, %o0, %o3
	.word	0xe66e8018	! t0_kref+0x2ca8:   	ldstub	[%i2 + %i0], %l3
	.word	0x38480006	! t0_kref+0x2cac:   	bgu,a,pt	%icc, _kref+0x2cc4
	.word	0xada009d0	! t0_kref+0x2cb0:   	fdivd	%f0, %f16, %f22
	.word	0xa9a0193a	! t0_kref+0x2cb4:   	fstod	%f26, %f20
	.word	0x9f614014	! t0_kref+0x2cb8:   	movug	%fcc0, %l4, %o7
	.word	0xa5a689ce	! t0_kref+0x2cbc:   	fdivd	%f26, %f14, %f18
	.word	0x91a01915	! t0_kref+0x2cc0:   	fitod	%f21, %f8
	.word	0xbba00023	! t0_kref+0x2cc4:   	fmovs	%f3, %f29
	.word	0xae123e91	! t0_kref+0x2cc8:   	or	%o0, -0x16f, %l7
	.word	0xc00e3ff8	! t0_kref+0x2ccc:   	ldub	[%i0 - 8], %g0
	.word	0xbbb00c20	! t0_kref+0x2cd0:   	fzeros	%f29
	.word	0x92bc6278	! t0_kref+0x2cd4:   	xnorcc	%l1, 0x278, %o1
	.word	0xeece5000	! t0_kref+0x2cd8:   	ldsba	[%i1]0x80, %l7
	.word	0xc04e3ff5	! t0_kref+0x2cdc:   	ldsb	[%i0 - 0xb], %g0
	.word	0x24800007	! t0_kref+0x2ce0:   	ble,a	_kref+0x2cfc
	.word	0xaebc000d	! t0_kref+0x2ce4:   	xnorcc	%l0, %o5, %l7
	.word	0xed6e7fe8	! t0_kref+0x2ce8:   	prefetch	%i1 - 0x18, 22
	.word	0x3c480001	! t0_kref+0x2cec:   	bpos,a,pt	%icc, _kref+0x2cf0
	.word	0xa5b28a06	! t0_kref+0x2cf0:   	fpadd16	%f10, %f6, %f18
	.word	0xe82e3ffa	! t0_kref+0x2cf4:   	stb	%l4, [%i0 - 6]
	.word	0x8da01921	! t0_kref+0x2cf8:   	fstod	%f1, %f6
	.word	0x9fa00534	! t0_kref+0x2cfc:   	fsqrts	%f20, %f15
	.word	0x9924bc1a	! t0_kref+0x2d00:   	mulscc	%l2, -0x3e6, %o4
	.word	0x2a800003	! t0_kref+0x2d04:   	bcs,a	_kref+0x2d10
	.word	0x9935a007	! t0_kref+0x2d08:   	srl	%l6, 0x7, %o4
	.word	0x91a01904	! t0_kref+0x2d0c:   	fitod	%f4, %f8
	.word	0xd096d019	! t0_kref+0x2d10:   	lduha	[%i3 + %i1]0x80, %o0
	.word	0x9a983b0a	! t0_kref+0x2d14:   	xorcc	%g0, -0x4f6, %o5
	.word	0xaebd8012	! t0_kref+0x2d18:   	xnorcc	%l6, %l2, %l7
	.word	0x80d82aab	! t0_kref+0x2d1c:   	smulcc	%g0, 0xaab, %g0
	.word	0xdaf6501d	! t0_kref+0x2d20:   	stxa	%o5, [%i1 + %i5]0x80
	.word	0x94356567	! t0_kref+0x2d24:   	orn	%l5, 0x567, %o2
	.word	0x98650010	! t0_kref+0x2d28:   	subc	%l4, %l0, %o4
	.word	0xe81e001d	! t0_kref+0x2d2c:   	ldd	[%i0 + %i5], %l4
	.word	0x3b800006	! t0_kref+0x2d30:   	fble,a	_kref+0x2d48
	.word	0x95b206a3	! t0_kref+0x2d34:   	fmul8x16al	%f8, %f3, %f10
	.word	0x900aed82	! t0_kref+0x2d38:   	and	%o3, 0xd82, %o0
	.word	0xe07e4000	! t0_kref+0x2d3c:   	swap	[%i1], %l0
	.word	0x909a323a	! t0_kref+0x2d40:   	xorcc	%o0, -0xdc6, %o0
	.word	0x89b70e06	! t0_kref+0x2d44:   	fand	%f28, %f6, %f4
	.word	0x92a4e28f	! t0_kref+0x2d48:   	subcc	%l3, 0x28f, %o1
	.word	0xd11e6008	! t0_kref+0x2d4c:   	ldd	[%i1 + 8], %f8
	.word	0x94646d15	! t0_kref+0x2d50:   	subc	%l1, 0xd15, %o2
	.word	0x89a2c8ac	! t0_kref+0x2d54:   	fsubs	%f11, %f12, %f4
	.word	0xe020a020	! t0_kref+0x2d58:   	st	%l0, [%g2 + 0x20]
	.word	0x3a480004	! t0_kref+0x2d5c:   	bcc,a,pt	%icc, _kref+0x2d6c
	.word	0xee763ff8	! t0_kref+0x2d60:   	stx	%l7, [%i0 - 8]
	.word	0x9b2ea005	! t0_kref+0x2d64:   	sll	%i2, 0x5, %o5
	.word	0x8da0c92e	! t0_kref+0x2d68:   	fmuls	%f3, %f14, %f6
	.word	0x9ea48008	! t0_kref+0x2d6c:   	subcc	%l2, %o0, %o7
	.word	0xcd1fbf70	! t0_kref+0x2d70:   	ldd	[%fp - 0x90], %f6
	.word	0x81800000	! t0_kref+0x2d74:   	mov	%g0, %y
	.word	0xd60e0000	! t0_kref+0x2d78:   	ldub	[%i0], %o3
	.word	0x81b68177	! t0_kref+0x2d7c:   	edge32ln	%i2, %l7, %g0
	.word	0xe168a00e	! t0_kref+0x2d80:   	prefetch	%g2 + 0xe, 16
	.word	0xa1a00548	! t0_kref+0x2d84:   	fsqrtd	%f8, %f16
	.word	0x2c480001	! t0_kref+0x2d88:   	bneg,a,pt	%icc, _kref+0x2d8c
	.word	0x81220017	! t0_kref+0x2d8c:   	mulscc	%o0, %l7, %g0
	.word	0xf3270018	! t0_kref+0x2d90:   	st	%f25, [%i4 + %i0]
	.word	0x9f38201c	! t0_kref+0x2d94:   	sra	%g0, 0x1c, %o7
	.word	0x24800002	! t0_kref+0x2d98:   	ble,a	_kref+0x2da0
	.word	0x99a5095a	! t0_kref+0x2d9c:   	fmuld	%f20, %f26, %f12
	.word	0x9e62f8fb	! t0_kref+0x2da0:   	subc	%o3, -0x705, %o7
	.word	0x992b2000	! t0_kref+0x2da4:   	sll	%o4, 0x0, %o4
	.word	0x93380000	! t0_kref+0x2da8:   	sra	%g0, %g0, %o1
	.word	0xd0480018	! t0_kref+0x2dac:   	ldsb	[%g0 + %i0], %o0
	.word	0x91a689a6	! t0_kref+0x2db0:   	fdivs	%f26, %f6, %f8
	.word	0x952c2009	! t0_kref+0x2db4:   	sll	%l0, 0x9, %o2
	.word	0x97b2034a	! t0_kref+0x2db8:   	alignaddrl	%o0, %o2, %o3
	.word	0x34800003	! t0_kref+0x2dbc:   	bg,a	_kref+0x2dc8
	.word	0xae43400c	! t0_kref+0x2dc0:   	addc	%o5, %o4, %l7
	.word	0x37800005	! t0_kref+0x2dc4:   	fbge,a	_kref+0x2dd8
	.word	0xee881018	! t0_kref+0x2dc8:   	lduba	[%g0 + %i0]0x80, %l7
	.word	0x8054fcef	! t0_kref+0x2dcc:   	umul	%l3, -0x311, %g0
	.word	0xe86e001a	! t0_kref+0x2dd0:   	ldstub	[%i0 + %i2], %l4
	.word	0x2f480005	! t0_kref+0x2dd4:   	fbu,a,pt	%fcc0, _kref+0x2de8
	.word	0x98bde099	! t0_kref+0x2dd8:   	xnorcc	%l7, 0x99, %o4
	.word	0xe4366010	! t0_kref+0x2ddc:   	sth	%l2, [%i1 + 0x10]
	.word	0x9bb00240	! t0_kref+0x2de0:   	array16	%g0, %g0, %o5
	.word	0xe9be584c	! t0_kref+0x2de4:   	stda	%f20, [%i1 + %o4]0xc2
	call	SYM(t0_subr2)
	.word	0x808d79bb	! t0_kref+0x2dec:   	btst	0xfffff9bb, %l5
	.word	0x97b40171	! t0_kref+0x2df0:   	edge32ln	%l0, %l1, %o3
	.word	0x982b0008	! t0_kref+0x2df4:   	andn	%o4, %o0, %o4
	.word	0x96540013	! t0_kref+0x2df8:   	umul	%l0, %l3, %o3
	.word	0x81df7c37	! t0_kref+0x2dfc:   	flush	%i5 - 0x3c9
	.word	0x22800007	! t0_kref+0x2e00:   	be,a	_kref+0x2e1c
	.word	0x9ea48015	! t0_kref+0x2e04:   	subcc	%l2, %l5, %o7
	.word	0x91a0052b	! t0_kref+0x2e08:   	fsqrts	%f11, %f8
	.word	0xd22e3feb	! t0_kref+0x2e0c:   	stb	%o1, [%i0 - 0x15]
	.word	0xa5a0054a	! t0_kref+0x2e10:   	fsqrtd	%f10, %f18
	.word	0x85a0193d	! t0_kref+0x2e14:   	fstod	%f29, %f2
	.word	0x91a00525	! t0_kref+0x2e18:   	fsqrts	%f5, %f8
	.word	0x2c800002	! t0_kref+0x2e1c:   	bneg,a	_kref+0x2e24
	.word	0xa5b00c20	! t0_kref+0x2e20:   	fzeros	%f18
	.word	0xc36e6010	! t0_kref+0x2e24:   	prefetch	%i1 + 0x10, 1
	.word	0x9eddf7ef	! t0_kref+0x2e28:   	smulcc	%l7, -0x811, %o7
	.word	0x942d400d	! t0_kref+0x2e2c:   	andn	%l5, %o5, %o2
	.word	0x3d480007	! t0_kref+0x2e30:   	fbule,a,pt	%fcc0, _kref+0x2e4c
	.word	0x80ad4013	! t0_kref+0x2e34:   	andncc	%l5, %l3, %g0
	.word	0x97a00528	! t0_kref+0x2e38:   	fsqrts	%f8, %f11
	.word	0x90d27e19	! t0_kref+0x2e3c:   	umulcc	%o1, -0x1e7, %o0
	.word	0x9085001a	! t0_kref+0x2e40:   	addcc	%l4, %i2, %o0
	.word	0xe87e6018	! t0_kref+0x2e44:   	swap	[%i1 + 0x18], %l4
	.word	0xd60e7ffe	! t0_kref+0x2e48:   	ldub	[%i1 - 2], %o3
	.word	0xb1a01937	! t0_kref+0x2e4c:   	fstod	%f23, %f24
	.word	0xd04e2015	! t0_kref+0x2e50:   	ldsb	[%i0 + 0x15], %o0
	.word	0x33800007	! t0_kref+0x2e54:   	fbe,a	_kref+0x2e70
	.word	0xe2e81019	! t0_kref+0x2e58:   	ldstuba	[%g0 + %i1]0x80, %l1
	.word	0xb1a0104e	! t0_kref+0x2e5c:   	fdtox	%f14, %f24
	.word	0x87b00776	! t0_kref+0x2e60:   	fpack16	%f22, %f3
	.word	0x81df2d3a	! t0_kref+0x2e64:   	flush	%i4 + 0xd3a
	.word	0x9f414000	! t0_kref+0x2e68:   	mov	%pc, %o7
	.word	0x33480006	! t0_kref+0x2e6c:   	fbe,a,pt	%fcc0, _kref+0x2e84
	.word	0xb9a6883c	! t0_kref+0x2e70:   	fadds	%f26, %f28, %f28
	.word	0x925d400b	! t0_kref+0x2e74:   	smul	%l5, %o3, %o1
	.word	0x9bb4802b	! t0_kref+0x2e78:   	edge8n	%l2, %o3, %o5
	.word	0x90b57912	! t0_kref+0x2e7c:   	orncc	%l5, -0x6ee, %o0
	.word	0x3a800004	! t0_kref+0x2e80:   	bcc,a	_kref+0x2e90
	.word	0x80bb3f08	! t0_kref+0x2e84:   	xnorcc	%o4, -0xf8, %g0
	.word	0x97048017	! t0_kref+0x2e88:   	taddcc	%l2, %l7, %o3
	.word	0x9a068011	! t0_kref+0x2e8c:   	add	%i2, %l1, %o5
	.word	0x9a5a662c	! t0_kref+0x2e90:   	smul	%o1, 0x62c, %o5
	.word	0x908c8016	! t0_kref+0x2e94:   	andcc	%l2, %l6, %o0
	.word	0x9fc10000	! t0_kref+0x2e98:   	call	%g4
	.word	0x99b5c315	! t0_kref+0x2e9c:   	alignaddr	%l7, %l5, %o4
	.word	0xd2080019	! t0_kref+0x2ea0:   	ldub	[%g0 + %i1], %o1
	.word	0x8fb00fe0	! t0_kref+0x2ea4:   	fones	%f7
	.word	0xf11fbef8	! t0_kref+0x2ea8:   	ldd	[%fp - 0x108], %f24
	.word	0xec9e101d	! t0_kref+0x2eac:   	ldda	[%i0 + %i5]0x80, %l6
	.word	0xc91fbd88	! t0_kref+0x2eb0:   	ldd	[%fp - 0x278], %f4
	.word	0xb9b306f0	! t0_kref+0x2eb4:   	fmul8ulx16	%f12, %f16, %f28
	.word	0x94332888	! t0_kref+0x2eb8:   	orn	%o4, 0x888, %o2
	.word	0xc010a018	! t0_kref+0x2ebc:   	lduh	[%g2 + 0x18], %g0
	.word	0x34800006	! t0_kref+0x2ec0:   	bg,a	_kref+0x2ed8
	.word	0xae8a2773	! t0_kref+0x2ec4:   	andcc	%o0, 0x773, %l7
	.word	0x37800007	! t0_kref+0x2ec8:   	fbge,a	_kref+0x2ee4
	.word	0x97a01a27	! t0_kref+0x2ecc:   	fstoi	%f7, %f11
	.word	0xb9b68d0c	! t0_kref+0x2ed0:   	fandnot1	%f26, %f12, %f28
	.word	0xe81e401d	! t0_kref+0x2ed4:   	ldd	[%i1 + %i5], %l4
	.word	0xee00a020	! t0_kref+0x2ed8:   	ld	[%g2 + 0x20], %l7
	.word	0xde4e401a	! t0_kref+0x2edc:   	ldsb	[%i1 + %i2], %o7
	.word	0xd4166014	! t0_kref+0x2ee0:   	lduh	[%i1 + 0x14], %o2
	.word	0xd22e2014	! t0_kref+0x2ee4:   	stb	%o1, [%i0 + 0x14]
	.word	0xafb48114	! t0_kref+0x2ee8:   	edge32	%l2, %l4, %l7
	.word	0x34800005	! t0_kref+0x2eec:   	bg,a	_kref+0x2f00
	.word	0x95b5cdbb	! t0_kref+0x2ef0:   	fxors	%f23, %f27, %f10
	.word	0xa9b20a24	! t0_kref+0x2ef4:   	fpadd16s	%f8, %f4, %f20
	.word	0x81b01023	! t0_kref+0x2ef8:   	siam	0x3
	.word	0x947a6ee0	! t0_kref+0x2efc:   	sdiv	%o1, 0xee0, %o2
	.word	0xada089ce	! t0_kref+0x2f00:   	fdivd	%f2, %f14, %f22
	.word	0x9aa2b798	! t0_kref+0x2f04:   	subcc	%o2, -0x868, %o5
	.word	0x38800004	! t0_kref+0x2f08:   	bgu,a	_kref+0x2f18
	.word	0x945df313	! t0_kref+0x2f0c:   	smul	%l7, -0xced, %o2
	.word	0x9eb8000b	! t0_kref+0x2f10:   	xnorcc	%g0, %o3, %o7
	.word	0x9ba00122	! t0_kref+0x2f14:   	fabss	%f2, %f13
	.word	0xec266000	! t0_kref+0x2f18:   	st	%l6, [%i1]
	.word	0xee56401b	! t0_kref+0x2f1c:   	ldsh	[%i1 + %i3], %l7
	.word	0x26480008	! t0_kref+0x2f20:   	bl,a,pt	%icc, _kref+0x2f40
	.word	0xaba00526	! t0_kref+0x2f24:   	fsqrts	%f6, %f21
	.word	0x91a000b5	! t0_kref+0x2f28:   	fnegs	%f21, %f8
	.word	0xb7b00760	! t0_kref+0x2f2c:   	fpack16	%f0, %f27
	.word	0xe81e6010	! t0_kref+0x2f30:   	ldd	[%i1 + 0x10], %l4
	.word	0xda000019	! t0_kref+0x2f34:   	ld	[%g0 + %i1], %o5
	.word	0xd24e7fe8	! t0_kref+0x2f38:   	ldsb	[%i1 - 0x18], %o1
	.word	0xda86501c	! t0_kref+0x2f3c:   	lda	[%i1 + %i4]0x80, %o5
	.word	0x8035322e	! t0_kref+0x2f40:   	orn	%l4, -0xdd2, %g0
	.word	0x8143c000	! t0_kref+0x2f44:   	stbar
	.word	0x35480004	! t0_kref+0x2f48:   	fbue,a,pt	%fcc0, _kref+0x2f58
	.word	0x8ba00133	! t0_kref+0x2f4c:   	fabss	%f19, %f5
	.word	0xa9a00552	! t0_kref+0x2f50:   	fsqrtd	%f18, %f20
	.word	0xb5a28854	! t0_kref+0x2f54:   	faddd	%f10, %f20, %f26
	.word	0xe1be5890	! t0_kref+0x2f58:   	stda	%f16, [%i1 + %l0]0xc4
	.word	0xaf26800c	! t0_kref+0x2f5c:   	mulscc	%i2, %o4, %l7
	.word	0x3c480006	! t0_kref+0x2f60:   	bpos,a,pt	%icc, _kref+0x2f78
	.word	0x98c44013	! t0_kref+0x2f64:   	addccc	%l1, %l3, %o4
	.word	0xee780019	! t0_kref+0x2f68:   	swap	[%g0 + %i1], %l7
	.word	0x1325739f	! t0_kref+0x2f6c:   	sethi	%hi(0x95ce7c00), %o1
	.word	0xf007bfe0	! t0_kref+0x2f70:   	ld	[%fp - 0x20], %i0
	.word	0xe83e6018	! t0_kref+0x2f74:   	std	%l4, [%i1 + 0x18]
	.word	0xc0564000	! t0_kref+0x2f78:   	ldsh	[%i1], %g0
	.word	0x22800004	! t0_kref+0x2f7c:   	be,a	_kref+0x2f8c
	.word	0xcb00a00c	! t0_kref+0x2f80:   	ld	[%g2 + 0xc], %f5
	.word	0x9f382014	! t0_kref+0x2f84:   	sra	%g0, 0x14, %o7
	.word	0x9db5097c	! t0_kref+0x2f88:   	fpmerge	%f20, %f28, %f14
	.word	0x27800005	! t0_kref+0x2f8c:   	fbul,a	_kref+0x2fa0
	.word	0xd44e6004	! t0_kref+0x2f90:   	ldsb	[%i1 + 4], %o2
	.word	0x9ec2780b	! t0_kref+0x2f94:   	addccc	%o1, -0x7f5, %o7
	.word	0x988a8008	! t0_kref+0x2f98:   	andcc	%o2, %o0, %o4
	.word	0xd878a010	! t0_kref+0x2f9c:   	swap	[%g2 + 0x10], %o4
	.word	0xd59f5018	! t0_kref+0x2fa0:   	ldda	[%i5 + %i0]0x80, %f10
	.word	0xde0e8019	! t0_kref+0x2fa4:   	ldub	[%i2 + %i1], %o7
	.word	0x95b20080	! t0_kref+0x2fa8:   	edge16	%o0, %g0, %o2
	.word	0x9afd4009	! t0_kref+0x2fac:   	sdivcc	%l5, %o1, %o5
	.word	0x96f28012	! t0_kref+0x2fb0:   	udivcc	%o2, %l2, %o3
	.word	0x8104801a	! t0_kref+0x2fb4:   	taddcc	%l2, %i2, %g0
	.word	0x90a8001a	! t0_kref+0x2fb8:   	andncc	%g0, %i2, %o0
	.word	0x98c232c7	! t0_kref+0x2fbc:   	addccc	%o0, -0xd39, %o4
	.word	0x95b686aa	! t0_kref+0x2fc0:   	fmul8x16al	%f26, %f10, %f10
	.word	0xa9a0191d	! t0_kref+0x2fc4:   	fitod	%f29, %f20
	.word	0x9834237c	! t0_kref+0x2fc8:   	orn	%l0, 0x37c, %o4
	call	SYM(t0_subr0)
	.word	0xa1b38d94	! t0_kref+0x2fd0:   	fxor	%f14, %f20, %f16
	.word	0x20480001	! t0_kref+0x2fd4:   	bn,a,pt	%icc, _kref+0x2fd8
	.word	0xd24e0000	! t0_kref+0x2fd8:   	ldsb	[%i0], %o1
	.word	0x39480002	! t0_kref+0x2fdc:   	fbuge,a,pt	%fcc0, _kref+0x2fe4
	.word	0x8082c013	! t0_kref+0x2fe0:   	addcc	%o3, %l3, %g0
	.word	0x90780000	! t0_kref+0x2fe4:   	sdiv	%g0, %g0, %o0
	.word	0x99b20037	! t0_kref+0x2fe8:   	edge8n	%o0, %l7, %o4
	.word	0xd5070019	! t0_kref+0x2fec:   	ld	[%i4 + %i1], %f10
	.word	0x9fc10000	! t0_kref+0x2ff0:   	call	%g4
	.word	0xec1e6010	! t0_kref+0x2ff4:   	ldd	[%i1 + 0x10], %l6
	.word	0x952a8011	! t0_kref+0x2ff8:   	sll	%o2, %l1, %o2
	.word	0x81844000	! t0_kref+0x2ffc:   	wr	%l1, %g0, %y
	.word	0x912a4011	! t0_kref+0x3000:   	sll	%o1, %l1, %o0
	.word	0xada08942	! t0_kref+0x3004:   	fmuld	%f2, %f2, %f22
	.word	0x920c0014	! t0_kref+0x3008:   	and	%l0, %l4, %o1
	.word	0x92b83753	! t0_kref+0x300c:   	xnorcc	%g0, -0x8ad, %o1
	.word	0xb1a01931	! t0_kref+0x3010:   	fstod	%f17, %f24
	call	SYM(t0_subr2)
	.word	0x907a000b	! t0_kref+0x3018:   	sdiv	%o0, %o3, %o0
	.word	0xda08a00a	! t0_kref+0x301c:   	ldub	[%g2 + 0xa], %o5
	.word	0xafb3848c	! t0_kref+0x3020:   	fcmple32	%f14, %f12, %l7
	.word	0x83a00528	! t0_kref+0x3024:   	fsqrts	%f8, %f1
	.word	0x98bb0017	! t0_kref+0x3028:   	xnorcc	%o4, %l7, %o4
	.word	0xe3000019	! t0_kref+0x302c:   	ld	[%g0 + %i1], %f17
	.word	0x89a609c2	! t0_kref+0x3030:   	fdivd	%f24, %f2, %f4
	.word	0x960d800c	! t0_kref+0x3034:   	and	%l6, %o4, %o3
	.word	0x805e801a	! t0_kref+0x3038:   	smul	%i2, %i2, %g0
	.word	0xc0000018	! t0_kref+0x303c:   	ld	[%g0 + %i0], %g0
	.word	0xd248a02e	! t0_kref+0x3040:   	ldsb	[%g2 + 0x2e], %o1
	.word	0x2a480003	! t0_kref+0x3044:   	bcs,a,pt	%icc, _kref+0x3050
	.word	0x9eda8014	! t0_kref+0x3048:   	smulcc	%o2, %l4, %o7
	.word	0x953dc00b	! t0_kref+0x304c:   	sra	%l7, %o3, %o2
	.word	0xbbb3cda9	! t0_kref+0x3050:   	fxors	%f15, %f9, %f29
	.word	0xaefcff49	! t0_kref+0x3054:   	sdivcc	%l3, -0xb7, %l7
	.word	0x9322001a	! t0_kref+0x3058:   	mulscc	%o0, %i2, %o1
	.word	0x960b23d3	! t0_kref+0x305c:   	and	%o4, 0x3d3, %o3
	.word	0x9bb2848c	! t0_kref+0x3060:   	fcmple32	%f10, %f12, %o5
	.word	0x9125000d	! t0_kref+0x3064:   	mulscc	%l4, %o5, %o0
	.word	0xa1a00548	! t0_kref+0x3068:   	fsqrtd	%f8, %f16
	.word	0x89b68a54	! t0_kref+0x306c:   	fpadd32	%f26, %f20, %f4
	.word	0xc9063fec	! t0_kref+0x3070:   	ld	[%i0 - 0x14], %f4
	.word	0x34800004	! t0_kref+0x3074:   	bg,a	_kref+0x3084
	.word	0xd11fbce0	! t0_kref+0x3078:   	ldd	[%fp - 0x320], %f8
	.word	0x01199998	! t0_kref+0x307c:   	sethi	%hi(0x66666000), %g0
	.word	0x87a489a7	! t0_kref+0x3080:   	fdivs	%f18, %f7, %f3
	.word	0xc0160000	! t0_kref+0x3084:   	lduh	[%i0], %g0
	.word	0x2d480003	! t0_kref+0x3088:   	fbg,a,pt	%fcc0, _kref+0x3094
	.word	0x9da000b0	! t0_kref+0x308c:   	fnegs	%f16, %f14
	.word	0x3b800001	! t0_kref+0x3090:   	fble,a	_kref+0x3094
	.word	0x98724016	! t0_kref+0x3094:   	udiv	%o1, %l6, %o4
	.word	0x9a2a723d	! t0_kref+0x3098:   	andn	%o1, -0xdc3, %o5
	.word	0xb5a00133	! t0_kref+0x309c:   	fabss	%f19, %f26
	.word	0x3c480004	! t0_kref+0x30a0:   	bpos,a,pt	%icc, _kref+0x30b0
	.word	0xda4e201a	! t0_kref+0x30a4:   	ldsb	[%i0 + 0x1a], %o5
	.word	0x901a64fd	! t0_kref+0x30a8:   	xor	%o1, 0x4fd, %o0
	.word	0xec1e4000	! t0_kref+0x30ac:   	ldd	[%i1], %l6
	.word	0xd0260000	! t0_kref+0x30b0:   	st	%o0, [%i0]
	.word	0xae75c012	! t0_kref+0x30b4:   	udiv	%l7, %l2, %l7
	.word	0x81a88a54	! t0_kref+0x30b8:   	fcmpd	%fcc0, %f2, %f20
	.word	0x9a9ceed4	! t0_kref+0x30bc:   	xorcc	%l3, 0xed4, %o5
	.word	0x905ea238	! t0_kref+0x30c0:   	smul	%i2, 0x238, %o0
	.word	0x3f480008	! t0_kref+0x30c4:   	fbo,a,pt	%fcc0, _kref+0x30e4
	.word	0x85b24717	! t0_kref+0x30c8:   	fmuld8sux16	%f9, %f23, %f2
	.word	0xd60e401a	! t0_kref+0x30cc:   	ldub	[%i1 + %i2], %o3
	.word	0x9f3b4016	! t0_kref+0x30d0:   	sra	%o5, %l6, %o7
	.word	0x95a00156	! t0_kref+0x30d4:   	fabsd	%f22, %f10
	.word	0x22800007	! t0_kref+0x30d8:   	be,a	_kref+0x30f4
	.word	0x96dc800b	! t0_kref+0x30dc:   	smulcc	%l2, %o3, %o3
	.word	0x2f800002	! t0_kref+0x30e0:   	fbu,a	_kref+0x30e8
	.word	0xfbee501a	! t0_kref+0x30e4:   	prefetcha	%i1 + %i2, 29
	.word	0x9e3dc01a	! t0_kref+0x30e8:   	xnor	%l7, %i2, %o7
	.word	0x24480005	! t0_kref+0x30ec:   	ble,a,pt	%icc, _kref+0x3100
	.word	0xc568a044	! t0_kref+0x30f0:   	prefetch	%g2 + 0x44, 2
	.word	0xb1b58a50	! t0_kref+0x30f4:   	fpadd32	%f22, %f16, %f24
	.word	0x2e480006	! t0_kref+0x30f8:   	bvs,a,pt	%icc, _kref+0x3110
	.word	0xc520a008	! t0_kref+0x30fc:   	st	%f2, [%g2 + 8]
	.word	0x9b380013	! t0_kref+0x3100:   	sra	%g0, %l3, %o5
	.word	0xc168a00a	! t0_kref+0x3104:   	prefetch	%g2 + 0xa, 0
	.word	0xaf2ae010	! t0_kref+0x3108:   	sll	%o3, 0x10, %l7
	.word	0xee4e601a	! t0_kref+0x310c:   	ldsb	[%i1 + 0x1a], %l7
	.word	0x23480007	! t0_kref+0x3110:   	fbne,a,pt	%fcc0, _kref+0x312c
	.word	0xa5a01916	! t0_kref+0x3114:   	fitod	%f22, %f18
	.word	0x2b800006	! t0_kref+0x3118:   	fbug,a	_kref+0x3130
	.word	0xc368a045	! t0_kref+0x311c:   	prefetch	%g2 + 0x45, 1
	.word	0x91a30837	! t0_kref+0x3120:   	fadds	%f12, %f23, %f8
	.word	0x9eac001a	! t0_kref+0x3124:   	andncc	%l0, %i2, %o7
	.word	0x99a01a23	! t0_kref+0x3128:   	fstoi	%f3, %f12
	.word	0x948a8015	! t0_kref+0x312c:   	andcc	%o2, %l5, %o2
	.word	0x90e3001a	! t0_kref+0x3130:   	subccc	%o4, %i2, %o0
	.word	0xf11fbf08	! t0_kref+0x3134:   	ldd	[%fp - 0xf8], %f24
	.word	0x2b480008	! t0_kref+0x3138:   	fbug,a,pt	%fcc0, _kref+0x3158
	.word	0xada0054e	! t0_kref+0x313c:   	fsqrtd	%f14, %f22
	.word	0xc36e3ff0	! t0_kref+0x3140:   	prefetch	%i0 - 0x10, 1
	.word	0xaeb33beb	! t0_kref+0x3144:   	orncc	%o4, -0x415, %l7
	.word	0xd51fbe48	! t0_kref+0x3148:   	ldd	[%fp - 0x1b8], %f10
	.word	0xec3e3ff0	! t0_kref+0x314c:   	std	%l6, [%i0 - 0x10]
	.word	0x9b2de003	! t0_kref+0x3150:   	sll	%l7, 0x3, %o5
	.word	0x21800005	! t0_kref+0x3154:   	fbn,a	_kref+0x3168
	.word	0xe120a004	! t0_kref+0x3158:   	st	%f16, [%g2 + 4]
	.word	0xe7263ff0	! t0_kref+0x315c:   	st	%f19, [%i0 - 0x10]
	.word	0xee2e8019	! t0_kref+0x3160:   	stb	%l7, [%i2 + %i1]
	.word	0x95a0054c	! t0_kref+0x3164:   	fsqrtd	%f12, %f10
	.word	0xafb2412d	! t0_kref+0x3168:   	edge32n	%o1, %o5, %l7
	.word	0xd27e7fe4	! t0_kref+0x316c:   	swap	[%i1 - 0x1c], %o1
	.word	0x86102004	! t0_kref+0x3170:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x3174:   	bne,a	_kref+0x3174
	.word	0x86a0e001	! t0_kref+0x3178:   	subcc	%g3, 1, %g3
	.word	0x80b2c00a	! t0_kref+0x317c:   	orncc	%o3, %o2, %g0
	.word	0x90b5c00b	! t0_kref+0x3180:   	orncc	%l7, %o3, %o0
	.word	0xd00e8018	! t0_kref+0x3184:   	ldub	[%i2 + %i0], %o0
	.word	0x81868000	! t0_kref+0x3188:   	wr	%i2, %g0, %y
	.word	0xae7d0013	! t0_kref+0x318c:   	sdiv	%l4, %l3, %l7
	.word	0x9fc10000	! t0_kref+0x3190:   	call	%g4
	.word	0xee070019	! t0_kref+0x3194:   	ld	[%i4 + %i1], %l7
	.word	0x94b4c008	! t0_kref+0x3198:   	orncc	%l3, %o0, %o2
	.word	0xe51fbcd0	! t0_kref+0x319c:   	ldd	[%fp - 0x330], %f18
	.word	0x3b800002	! t0_kref+0x31a0:   	fble,a	_kref+0x31a8
	.word	0xd5196508	! t0_kref+0x31a4:   	ldd	[%g5 + 0x508], %f10
	.word	0x23480007	! t0_kref+0x31a8:   	fbne,a,pt	%fcc0, _kref+0x31c4
	.word	0xf4262008	! t0_kref+0x31ac:   	st	%i2, [%i0 + 8]
	.word	0xb9b50db2	! t0_kref+0x31b0:   	fxors	%f20, %f18, %f28
	.word	0x91a01a22	! t0_kref+0x31b4:   	fstoi	%f2, %f8
	.word	0xc7063fec	! t0_kref+0x31b8:   	ld	[%i0 - 0x14], %f3
	.word	0xe820a02c	! t0_kref+0x31bc:   	st	%l4, [%g2 + 0x2c]
	.word	0x95b50069	! t0_kref+0x31c0:   	edge8ln	%l4, %o1, %o2
	.word	0x9da0013a	! t0_kref+0x31c4:   	fabss	%f26, %f14
	.word	0x9add8011	! t0_kref+0x31c8:   	smulcc	%l6, %l1, %o5
	.word	0x90826c9d	! t0_kref+0x31cc:   	addcc	%o1, 0xc9d, %o0
	.word	0x96d34008	! t0_kref+0x31d0:   	umulcc	%o5, %o0, %o3
	.word	0xb9a01936	! t0_kref+0x31d4:   	fstod	%f22, %f28
	.word	0x9b242502	! t0_kref+0x31d8:   	mulscc	%l0, 0x502, %o5
	.word	0x33480005	! t0_kref+0x31dc:   	fbe,a,pt	%fcc0, _kref+0x31f0
	.word	0x89b08e0a	! t0_kref+0x31e0:   	fand	%f2, %f10, %f4
	.word	0xae2b0011	! t0_kref+0x31e4:   	andn	%o4, %l1, %l7
	.word	0x21480003	! t0_kref+0x31e8:   	fbn,a,pt	%fcc0, _kref+0x31f4
	.word	0xb7a20937	! t0_kref+0x31ec:   	fmuls	%f8, %f23, %f27
	.word	0xaba00522	! t0_kref+0x31f0:   	fsqrts	%f2, %f21
	.word	0x947a4012	! t0_kref+0x31f4:   	sdiv	%o1, %l2, %o2
	.word	0x9a532310	! t0_kref+0x31f8:   	umul	%o4, 0x310, %o5
	.word	0x87a01a56	! t0_kref+0x31fc:   	fdtoi	%f22, %f3
	.word	0xd8380018	! t0_kref+0x3200:   	std	%o4, [%g0 + %i0]
	.word	0x9252c011	! t0_kref+0x3204:   	umul	%o3, %l1, %o1
	.word	0xc168a04f	! t0_kref+0x3208:   	prefetch	%g2 + 0x4f, 0
	.word	0x87a6c924	! t0_kref+0x320c:   	fmuls	%f27, %f4, %f3
	.word	0x91a01a5c	! t0_kref+0x3210:   	fdtoi	%f28, %f8
	.word	0x80b2c011	! t0_kref+0x3214:   	orncc	%o3, %l1, %g0
	.word	0x36480003	! t0_kref+0x3218:   	bge,a,pt	%icc, _kref+0x3224
	.word	0x812339ff	! t0_kref+0x321c:   	mulscc	%o4, -0x601, %g0
	.word	0xd450a028	! t0_kref+0x3220:   	ldsh	[%g2 + 0x28], %o2
	.word	0x89a01912	! t0_kref+0x3224:   	fitod	%f18, %f4
	.word	0xa9a00142	! t0_kref+0x3228:   	fabsd	%f2, %f20
	.word	0x3c480007	! t0_kref+0x322c:   	bpos,a,pt	%icc, _kref+0x3248
	.word	0x9e3d0016	! t0_kref+0x3230:   	xnor	%l4, %l6, %o7
	.word	0x9bb44313	! t0_kref+0x3234:   	alignaddr	%l1, %l3, %o5
	.word	0x81858000	! t0_kref+0x3238:   	wr	%l6, %g0, %y
	.word	0x2e800007	! t0_kref+0x323c:   	bvs,a	_kref+0x3258
	.word	0x90b34016	! t0_kref+0x3240:   	orncc	%o5, %l6, %o0
	.word	0x8fa000b5	! t0_kref+0x3244:   	fnegs	%f21, %f7
	.word	0x908d0000	! t0_kref+0x3248:   	andcc	%l4, %g0, %o0
	.word	0xd9062014	! t0_kref+0x324c:   	ld	[%i0 + 0x14], %f12
	.word	0x85a00152	! t0_kref+0x3250:   	fabsd	%f18, %f2
	.word	0xd676001d	! t0_kref+0x3254:   	stx	%o3, [%i0 + %i5]
	.word	0x95280017	! t0_kref+0x3258:   	sll	%g0, %l7, %o2
	.word	0x9efafcc1	! t0_kref+0x325c:   	sdivcc	%o3, -0x33f, %o7
	.word	0x9b200014	! t0_kref+0x3260:   	mulscc	%g0, %l4, %o5
	.word	0x81dac00e	! t0_kref+0x3264:   	flush	%o3 + %sp
	.word	0x81db302c	! t0_kref+0x3268:   	flush	%o4 - 0xfd4
	.word	0x22480003	! t0_kref+0x326c:   	be,a,pt	%icc, _kref+0x3278
	.word	0xb3b64a3d	! t0_kref+0x3270:   	fpadd16s	%f25, %f29, %f25
	.word	0xd64e0000	! t0_kref+0x3274:   	ldsb	[%i0], %o3
	.word	0x80dcc000	! t0_kref+0x3278:   	smulcc	%l3, %g0, %g0
	.word	0x83414000	! t0_kref+0x327c:   	mov	%pc, %g1
	.word	0xaee56eac	! t0_kref+0x3280:   	subccc	%l5, 0xeac, %l7
	.word	0xd11e401d	! t0_kref+0x3284:   	ldd	[%i1 + %i5], %f8
	.word	0xf53e401d	! t0_kref+0x3288:   	std	%f26, [%i1 + %i5]
	.word	0xb9b60d0a	! t0_kref+0x328c:   	fandnot1	%f24, %f10, %f28
	.word	0xaba00536	! t0_kref+0x3290:   	fsqrts	%f22, %f21
	.word	0x81d90009	! t0_kref+0x3294:   	flush	%g4 + %o1
	.word	0xadb18a8c	! t0_kref+0x3298:   	fpsub16	%f6, %f12, %f22
	.word	0xea6e2012	! t0_kref+0x329c:   	ldstub	[%i0 + 0x12], %l5
	.word	0x9e383938	! t0_kref+0x32a0:   	xnor	%g0, -0x6c8, %o7
	.word	0x81a80a44	! t0_kref+0x32a4:   	fcmpd	%fcc0, %f0, %f4
	.word	0x91a01935	! t0_kref+0x32a8:   	fstod	%f21, %f8
	.word	0x98440008	! t0_kref+0x32ac:   	addc	%l0, %o0, %o4
	.word	0xe2fe101c	! t0_kref+0x32b0:   	swapa	[%i0 + %i4]0x80, %l1
	.word	0xb5b58f84	! t0_kref+0x32b4:   	for	%f22, %f4, %f26
	.word	0x81db8005	! t0_kref+0x32b8:   	flush	%sp + %g5
	.word	0x9924400c	! t0_kref+0x32bc:   	mulscc	%l1, %o4, %o4
	.word	0x9e82f921	! t0_kref+0x32c0:   	addcc	%o3, -0x6df, %o7
	.word	0x3e480005	! t0_kref+0x32c4:   	bvc,a,pt	%icc, _kref+0x32d8
	.word	0xe420a024	! t0_kref+0x32c8:   	st	%l2, [%g2 + 0x24]
	.word	0x89b40750	! t0_kref+0x32cc:   	fpack32	%f16, %f16, %f4
	.word	0xdaee1000	! t0_kref+0x32d0:   	ldstuba	[%i0]0x80, %o5
	.word	0x94b3000a	! t0_kref+0x32d4:   	orncc	%o4, %o2, %o2
	.word	0xada189ce	! t0_kref+0x32d8:   	fdivd	%f6, %f14, %f22
	.word	0x9de3bfa0	! t0_kref+0x32dc:   	save	%sp, -0x60, %sp
	.word	0xb266aa26	! t0_kref+0x32e0:   	subc	%i2, 0xa26, %i1
	.word	0x9bee001a	! t0_kref+0x32e4:   	restore	%i0, %i2, %o5
	.word	0xd62e8019	! t0_kref+0x32e8:   	stb	%o3, [%i2 + %i1]
	.word	0xae836e1b	! t0_kref+0x32ec:   	addcc	%o5, 0xe1b, %l7
	.word	0x33480005	! t0_kref+0x32f0:   	fbe,a,pt	%fcc0, _kref+0x3304
	.word	0xf720a014	! t0_kref+0x32f4:   	st	%f27, [%g2 + 0x14]
	.word	0x907eb6b2	! t0_kref+0x32f8:   	sdiv	%i2, -0x94e, %o0
	.word	0x90b28010	! t0_kref+0x32fc:   	orncc	%o2, %l0, %o0
	.word	0xee20a034	! t0_kref+0x3300:   	st	%l7, [%g2 + 0x34]
	.word	0x9f248000	! t0_kref+0x3304:   	mulscc	%l2, %g0, %o7
	.word	0xe230a01e	! t0_kref+0x3308:   	sth	%l1, [%g2 + 0x1e]
	.word	0x23800006	! t0_kref+0x330c:   	fbne,a	_kref+0x3324
	.word	0xed6e401d	! t0_kref+0x3310:   	prefetch	%i1 + %i5, 22
	.word	0x1b13ae7b	! t0_kref+0x3314:   	sethi	%hi(0x4eb9ec00), %o5
	.word	0x3b800002	! t0_kref+0x3318:   	fble,a	_kref+0x3320
	.word	0x9e7eab31	! t0_kref+0x331c:   	sdiv	%i2, 0xb31, %o7
	.word	0xb9a0055a	! t0_kref+0x3320:   	fsqrtd	%f26, %f28
	.word	0xa9a01923	! t0_kref+0x3324:   	fstod	%f3, %f20
	.word	0xa9b086e6	! t0_kref+0x3328:   	fmul8ulx16	%f2, %f6, %f20
	.word	0x8143e05c	! t0_kref+0x332c:   	membar	0x5c
	.word	0xada009c6	! t0_kref+0x3330:   	fdivd	%f0, %f6, %f22
	.word	0xa1a289d6	! t0_kref+0x3334:   	fdivd	%f10, %f22, %f16
	.word	0x26480004	! t0_kref+0x3338:   	bl,a,pt	%icc, _kref+0x3348
	.word	0x91b60a1c	! t0_kref+0x333c:   	fpadd16	%f24, %f28, %f8
	.word	0xa5a018d8	! t0_kref+0x3340:   	fdtos	%f24, %f18
	.word	0x805c73f7	! t0_kref+0x3344:   	smul	%l1, -0xc09, %g0
	.word	0x8da01904	! t0_kref+0x3348:   	fitod	%f4, %f6
	.word	0x91b10e12	! t0_kref+0x334c:   	fand	%f4, %f18, %f8
	.word	0x8143c000	! t0_kref+0x3350:   	stbar
	.word	0x90c02fc5	! t0_kref+0x3354:   	addccc	%g0, 0xfc5, %o0
	.word	0x8da548a5	! t0_kref+0x3358:   	fsubs	%f21, %f5, %f6
	.word	0x95b10748	! t0_kref+0x335c:   	fpack32	%f4, %f8, %f10
	.word	0xc768a08c	! t0_kref+0x3360:   	prefetch	%g2 + 0x8c, 3
	.word	0x81aaca24	! t0_kref+0x3364:   	fcmps	%fcc0, %f11, %f4
	.word	0x81db281f	! t0_kref+0x3368:   	flush	%o4 + 0x81f
	.word	0xe91e6008	! t0_kref+0x336c:   	ldd	[%i1 + 8], %f20
	.word	0xc04e8018	! t0_kref+0x3370:   	ldsb	[%i2 + %i0], %g0
	call	1f
	.empty
	.word	0xaea2001a	! t0_kref+0x3378:   	subcc	%o0, %i2, %l7
	.word	0x9612c012	! t0_kref+0x337c:   	or	%o3, %l2, %o3
	.word	0xc1296658	! t0_kref+0x3380:   	st	%fsr, [%g5 + 0x658]
1:	.word	0xf51fbef8	! t0_kref+0x3384:   	ldd	[%fp - 0x108], %f26
	.word	0xf8380019	! t0_kref+0x3388:   	std	%i4, [%g0 + %i1]
	.word	0xae35fbb6	! t0_kref+0x338c:   	orn	%l7, -0x44a, %l7
	.word	0x9885400d	! t0_kref+0x3390:   	addcc	%l5, %o5, %o4
	.word	0x91a1895c	! t0_kref+0x3394:   	fmuld	%f6, %f28, %f8
	.word	0x989cef05	! t0_kref+0x3398:   	xorcc	%l3, 0xf05, %o4
	.word	0x9fc00004	! t0_kref+0x339c:   	call	%g0 + %g4
	.word	0x9432000a	! t0_kref+0x33a0:   	orn	%o0, %o2, %o2
	.word	0x9da01933	! t0_kref+0x33a4:   	fstod	%f19, %f14
	.word	0xdd3e401d	! t0_kref+0x33a8:   	std	%f14, [%i1 + %i5]
	.word	0x93a018c8	! t0_kref+0x33ac:   	fdtos	%f8, %f9
	.word	0x9da089c8	! t0_kref+0x33b0:   	fdivd	%f2, %f8, %f14
	.word	0x91b08f4a	! t0_kref+0x33b4:   	fornot1	%f2, %f10, %f8
	.word	0x91b2810c	! t0_kref+0x33b8:   	edge32	%o2, %o4, %o0
	.word	0xa9a0055a	! t0_kref+0x33bc:   	fsqrtd	%f26, %f20
	.word	0xe100a024	! t0_kref+0x33c0:   	ld	[%g2 + 0x24], %f16
	.word	0x95b50400	! t0_kref+0x33c4:   	fcmple16	%f20, %f0, %o2
	.word	0xa7a01a58	! t0_kref+0x33c8:   	fdtoi	%f24, %f19
	.word	0xaba00134	! t0_kref+0x33cc:   	fabss	%f20, %f21
	.word	0x812ac01a	! t0_kref+0x33d0:   	sll	%o3, %i2, %g0
	.word	0x24480007	! t0_kref+0x33d4:   	ble,a,pt	%icc, _kref+0x33f0
	.word	0x91b60914	! t0_kref+0x33d8:   	faligndata	%f24, %f20, %f8
	.word	0xdaae5000	! t0_kref+0x33dc:   	stba	%o5, [%i1]0x80
	.word	0xe13e7ff0	! t0_kref+0x33e0:   	std	%f16, [%i1 - 0x10]
	.word	0x81840000	! t0_kref+0x33e4:   	wr	%l0, %g0, %y
	.word	0x25800005	! t0_kref+0x33e8:   	fblg,a	_kref+0x33fc
	.word	0xec1e4000	! t0_kref+0x33ec:   	ldd	[%i1], %l6
	.word	0x809df6ea	! t0_kref+0x33f0:   	xorcc	%l7, -0x916, %g0
	.word	0x95b18512	! t0_kref+0x33f4:   	fcmpgt16	%f6, %f18, %o2
	.word	0x3e800006	! t0_kref+0x33f8:   	bvc,a	_kref+0x3410
	.word	0x80db3d90	! t0_kref+0x33fc:   	smulcc	%o4, -0x270, %g0
	.word	0x92b24009	! t0_kref+0x3400:   	orncc	%o1, %o1, %o1
	.word	0x93a01a42	! t0_kref+0x3404:   	fdtoi	%f2, %f9
	.word	0xf207bfe0	! t0_kref+0x3408:   	ld	[%fp - 0x20], %i1
	.word	0x973d400c	! t0_kref+0x340c:   	sra	%l5, %o4, %o3
	.word	0xd93e6000	! t0_kref+0x3410:   	std	%f12, [%i1]
	.word	0x9edc7c50	! t0_kref+0x3414:   	smulcc	%l1, -0x3b0, %o7
	.word	0x8da00529	! t0_kref+0x3418:   	fsqrts	%f9, %f6
	.word	0x01165610	! t0_kref+0x341c:   	sethi	%hi(0x59584000), %g0
	.word	0x3c800003	! t0_kref+0x3420:   	bpos,a	_kref+0x342c
	.word	0xda4e001a	! t0_kref+0x3424:   	ldsb	[%i0 + %i2], %o5
	.word	0xc06e3ff6	! t0_kref+0x3428:   	ldstub	[%i0 - 0xa], %g0
	.word	0xd6560000	! t0_kref+0x342c:   	ldsh	[%i0], %o3
	.word	0xef68a000	! t0_kref+0x3430:   	prefetch	%g2, 23
	.word	0x9a84b92f	! t0_kref+0x3434:   	addcc	%l2, -0x6d1, %o5
	.word	0x9de3bfa0	! t0_kref+0x3438:   	save	%sp, -0x60, %sp
	.word	0x91e80018	! t0_kref+0x343c:   	restore	%g0, %i0, %o0
	.word	0xcd1fbd30	! t0_kref+0x3440:   	ldd	[%fp - 0x2d0], %f6
	.word	0x903321a0	! t0_kref+0x3444:   	orn	%o4, 0x1a0, %o0
	.word	0xada088d0	! t0_kref+0x3448:   	fsubd	%f2, %f16, %f22
	.word	0xd24e401a	! t0_kref+0x344c:   	ldsb	[%i1 + %i2], %o1
	.word	0xe46e0000	! t0_kref+0x3450:   	ldstub	[%i0], %l2
	.word	0xf11fbc98	! t0_kref+0x3454:   	ldd	[%fp - 0x368], %f24
	.word	0x81df001f	! t0_kref+0x3458:   	flush	%i4 + %i7
	.word	0x38480006	! t0_kref+0x345c:   	bgu,a,pt	%icc, _kref+0x3474
	.word	0x81828000	! t0_kref+0x3460:   	wr	%o2, %g0, %y
	.word	0x8d828008	! t0_kref+0x3464:   	wr	%o2, %o0, %fprs
	.word	0x80a2a846	! t0_kref+0x3468:   	cmp	%o2, 0x846
	.word	0x9ea0001a	! t0_kref+0x346c:   	subcc	%g0, %i2, %o7
	.word	0x95a01932	! t0_kref+0x3470:   	fstod	%f18, %f10
	.word	0x3f800007	! t0_kref+0x3474:   	fbo,a	_kref+0x3490
	.word	0x9844400d	! t0_kref+0x3478:   	addc	%l1, %o5, %o4
	.word	0x9e2d0012	! t0_kref+0x347c:   	andn	%l4, %l2, %o7
	.word	0x9e303b81	! t0_kref+0x3480:   	orn	%g0, -0x47f, %o7
	.word	0x28480004	! t0_kref+0x3484:   	bleu,a,pt	%icc, _kref+0x3494
	.word	0x95a000a2	! t0_kref+0x3488:   	fnegs	%f2, %f10
	.word	0x9e9e8009	! t0_kref+0x348c:   	xorcc	%i2, %o1, %o7
	.word	0x9b35400a	! t0_kref+0x3490:   	srl	%l5, %o2, %o5
	.word	0xa5a589ce	! t0_kref+0x3494:   	fdivd	%f22, %f14, %f18
	.word	0x172787ec	! t0_kref+0x3498:   	sethi	%hi(0x9e1fb000), %o3
	.word	0xae380012	! t0_kref+0x349c:   	xnor	%g0, %l2, %l7
	.word	0x91a000ad	! t0_kref+0x34a0:   	fnegs	%f13, %f8
	.word	0x81580000	! t0_kref+0x34a4:   	flushw
	.word	0xf207bfe0	! t0_kref+0x34a8:   	ld	[%fp - 0x20], %i1
	.word	0xe8e81019	! t0_kref+0x34ac:   	ldstuba	[%g0 + %i1]0x80, %l4
	.word	0xada000b9	! t0_kref+0x34b0:   	fnegs	%f25, %f22
	.word	0xd6780019	! t0_kref+0x34b4:   	swap	[%g0 + %i1], %o3
	.word	0xd3e65015	! t0_kref+0x34b8:   	casa	[%i1]0x80, %l5, %o1
	.word	0xc056c018	! t0_kref+0x34bc:   	ldsh	[%i3 + %i0], %g0
	.word	0xa1b44622	! t0_kref+0x34c0:   	fmul8x16	%f17, %f2, %f16
	.word	0xf43e2018	! t0_kref+0x34c4:   	std	%i2, [%i0 + 0x18]
	.word	0xc91fbcd0	! t0_kref+0x34c8:   	ldd	[%fp - 0x330], %f4
	.word	0xec7e4000	! t0_kref+0x34cc:   	swap	[%i1], %l6
	.word	0x8143e040	! t0_kref+0x34d0:   	membar	0x40
	.word	0xa5a0192a	! t0_kref+0x34d4:   	fstod	%f10, %f18
	.word	0x90bd800a	! t0_kref+0x34d8:   	xnorcc	%l6, %o2, %o0
	.word	0xee20a008	! t0_kref+0x34dc:   	st	%l7, [%g2 + 8]
	.word	0x8db50c50	! t0_kref+0x34e0:   	fnor	%f20, %f16, %f6
	.word	0x98a68016	! t0_kref+0x34e4:   	subcc	%i2, %l6, %o4
	.word	0xd19e5a1a	! t0_kref+0x34e8:   	ldda	[%i1 + %i2]0xd0, %f8
	.word	0xd62e3fef	! t0_kref+0x34ec:   	stb	%o3, [%i0 - 0x11]
	.word	0x98842e5a	! t0_kref+0x34f0:   	addcc	%l0, 0xe5a, %o4
	.word	0x90b32b4b	! t0_kref+0x34f4:   	orncc	%o4, 0xb4b, %o0
	.word	0x9de3bfa0	! t0_kref+0x34f8:   	save	%sp, -0x60, %sp
	.word	0xb6a6c019	! t0_kref+0x34fc:   	subcc	%i3, %i1, %i3
	.word	0xafe8001c	! t0_kref+0x3500:   	restore	%g0, %i4, %l7
	.word	0x9a834017	! t0_kref+0x3504:   	addcc	%o5, %l7, %o5
	.word	0xaf22e1a1	! t0_kref+0x3508:   	mulscc	%o3, 0x1a1, %l7
	.word	0x81b48542	! t0_kref+0x350c:   	fcmpeq16	%f18, %f2, %g0
	.word	0x1f1a434b	! t0_kref+0x3510:   	sethi	%hi(0x690d2c00), %o7
	.word	0xec981019	! t0_kref+0x3514:   	ldda	[%g0 + %i1]0x80, %l6
	.word	0xee774019	! t0_kref+0x3518:   	stx	%l7, [%i5 + %i1]
	.word	0x80822f3a	! t0_kref+0x351c:   	addcc	%o0, 0xf3a, %g0
	.word	0xadb30a58	! t0_kref+0x3520:   	fpadd32	%f12, %f24, %f22
	.word	0xd028a005	! t0_kref+0x3524:   	stb	%o0, [%g2 + 5]
	.word	0x95b40492	! t0_kref+0x3528:   	fcmple32	%f16, %f18, %o2
	.word	0x9685b6ba	! t0_kref+0x352c:   	addcc	%l6, -0x946, %o3
	.word	0x3a480001	! t0_kref+0x3530:   	bcc,a,pt	%icc, _kref+0x3534
	.word	0xe91fbf58	! t0_kref+0x3534:   	ldd	[%fp - 0xa8], %f20
	.word	0x25800006	! t0_kref+0x3538:   	fblg,a	_kref+0x3550
	.word	0x9265c00d	! t0_kref+0x353c:   	subc	%l7, %o5, %o1
	.word	0xd6567fe2	! t0_kref+0x3540:   	ldsh	[%i1 - 0x1e], %o3
	.word	0xa1a74826	! t0_kref+0x3544:   	fadds	%f29, %f6, %f16
	.word	0xcd1fbe28	! t0_kref+0x3548:   	ldd	[%fp - 0x1d8], %f6
	.word	0xa5a0193d	! t0_kref+0x354c:   	fstod	%f29, %f18
	.word	0xbbb1ca6b	! t0_kref+0x3550:   	fpadd32s	%f7, %f11, %f29
	.word	0xae646777	! t0_kref+0x3554:   	subc	%l1, 0x777, %l7
	.word	0x80834000	! t0_kref+0x3558:   	addcc	%o5, %g0, %g0
	.word	0x35480007	! t0_kref+0x355c:   	fbue,a,pt	%fcc0, _kref+0x3578
	.word	0x9a1c800b	! t0_kref+0x3560:   	xor	%l2, %o3, %o5
	.word	0x30480004	! t0_kref+0x3564:   	ba,a,pt	%icc, _kref+0x3574
	.word	0xd51fbe90	! t0_kref+0x3568:   	ldd	[%fp - 0x170], %f10
	.word	0x9866801a	! t0_kref+0x356c:   	subc	%i2, %i2, %o4
	.word	0x94552aeb	! t0_kref+0x3570:   	umul	%l4, 0xaeb, %o2
	.word	0x9ebb336f	! t0_kref+0x3574:   	xnorcc	%o4, -0xc91, %o7
	.word	0x97b34333	! t0_kref+0x3578:   	bmask	%o5, %l3, %o3
	.word	0x190d5691	! t0_kref+0x357c:   	sethi	%hi(0x355a4400), %o4
	.word	0x905c8014	! t0_kref+0x3580:   	smul	%l2, %l4, %o0
	.word	0xd828a02b	! t0_kref+0x3584:   	stb	%o4, [%g2 + 0x2b]
	.word	0x3c480008	! t0_kref+0x3588:   	bpos,a,pt	%icc, _kref+0x35a8
	.word	0x98c428c8	! t0_kref+0x358c:   	addccc	%l0, 0x8c8, %o4
	.word	0x3a480006	! t0_kref+0x3590:   	bcc,a,pt	%icc, _kref+0x35a8
	.word	0x932dc017	! t0_kref+0x3594:   	sll	%l7, %l7, %o1
	.word	0x85a01a42	! t0_kref+0x3598:   	fdtoi	%f2, %f2
	.word	0xa9a0190e	! t0_kref+0x359c:   	fitod	%f14, %f20
	.word	0x2b800002	! t0_kref+0x35a0:   	fbug,a	_kref+0x35a8
	.word	0xe43e001d	! t0_kref+0x35a4:   	std	%l2, [%i0 + %i5]
	.word	0x21480007	! t0_kref+0x35a8:   	fbn,a,pt	%fcc0, _kref+0x35c4
	.word	0xada2892d	! t0_kref+0x35ac:   	fmuls	%f10, %f13, %f22
	.word	0x90ba8012	! t0_kref+0x35b0:   	xnorcc	%o2, %l2, %o0
	.word	0x28800008	! t0_kref+0x35b4:   	bleu,a	_kref+0x35d4
	.word	0x9ebb3ea8	! t0_kref+0x35b8:   	xnorcc	%o4, -0x158, %o7
	.word	0xa9a34921	! t0_kref+0x35bc:   	fmuls	%f13, %f1, %f20
	.word	0x93b68498	! t0_kref+0x35c0:   	fcmple32	%f26, %f24, %o1
	.word	0x85a6884c	! t0_kref+0x35c4:   	faddd	%f26, %f12, %f2
	.word	0x89a74d30	! t0_kref+0x35c8:   	fsmuld	%f29, %f16, %f4
	.word	0xd8567ffa	! t0_kref+0x35cc:   	ldsh	[%i1 - 6], %o4
	.word	0xec180019	! t0_kref+0x35d0:   	ldd	[%g0 + %i1], %l6
	.word	0xe13e3fe8	! t0_kref+0x35d4:   	std	%f16, [%i0 - 0x18]
	.word	0x99a289c6	! t0_kref+0x35d8:   	fdivd	%f10, %f6, %f12
	.word	0xd8901019	! t0_kref+0x35dc:   	lduha	[%g0 + %i1]0x80, %o4
	.word	0x2a480006	! t0_kref+0x35e0:   	bcs,a,pt	%icc, _kref+0x35f8
	.word	0xa9b60f42	! t0_kref+0x35e4:   	fornot1	%f24, %f2, %f20
	.word	0x25480005	! t0_kref+0x35e8:   	fblg,a,pt	%fcc0, _kref+0x35fc
	.word	0xb1b74dad	! t0_kref+0x35ec:   	fxors	%f29, %f13, %f24
	.word	0xae0dfa0f	! t0_kref+0x35f0:   	and	%l7, -0x5f1, %l7
	.word	0xb1a20933	! t0_kref+0x35f4:   	fmuls	%f8, %f19, %f24
	.word	0xda0e2004	! t0_kref+0x35f8:   	ldub	[%i0 + 4], %o5
	.word	0xafb30048	! t0_kref+0x35fc:   	edge8l	%o4, %o0, %l7
	.word	0xfb6e001a	! t0_kref+0x3600:   	prefetch	%i0 + %i2, 29
	.word	0x22800001	! t0_kref+0x3604:   	be,a	_kref+0x3608
	.word	0x95b2c168	! t0_kref+0x3608:   	edge32ln	%o3, %o0, %o2
	.word	0x94e32a45	! t0_kref+0x360c:   	subccc	%o4, 0xa45, %o2
	.word	0xd4b81018	! t0_kref+0x3610:   	stda	%o2, [%g0 + %i0]0x80
	.word	0x89a01908	! t0_kref+0x3614:   	fitod	%f8, %f4
	.word	0x8db0076e	! t0_kref+0x3618:   	fpack16	%f14, %f6
	.word	0x81db000d	! t0_kref+0x361c:   	flush	%o4 + %o5
	.word	0x9da0004c	! t0_kref+0x3620:   	fmovd	%f12, %f14
	.word	0x3e800004	! t0_kref+0x3624:   	bvc,a	_kref+0x3634
	.word	0xd24e600f	! t0_kref+0x3628:   	ldsb	[%i1 + 0xf], %o1
	.word	0x9e7a4011	! t0_kref+0x362c:   	sdiv	%o1, %l1, %o7
	.word	0x9ef4b163	! t0_kref+0x3630:   	udivcc	%l2, -0xe9d, %o7
	.word	0xd43e001d	! t0_kref+0x3634:   	std	%o2, [%i0 + %i5]
	.word	0xbba01082	! t0_kref+0x3638:   	fxtos	%f2, %f29
	.word	0x903a0013	! t0_kref+0x363c:   	xnor	%o0, %l3, %o0
	.word	0x8143e040	! t0_kref+0x3640:   	membar	0x40
	.word	0xee30a03a	! t0_kref+0x3644:   	sth	%l7, [%g2 + 0x3a]
	.word	0x9da609d4	! t0_kref+0x3648:   	fdivd	%f24, %f20, %f14
	.word	0xd850a024	! t0_kref+0x364c:   	ldsh	[%g2 + 0x24], %o4
	.word	0xcd1fbe50	! t0_kref+0x3650:   	ldd	[%fp - 0x1b0], %f6
	.word	0x8185c000	! t0_kref+0x3654:   	wr	%l7, %g0, %y
	call	1f
	.empty
	.word	0xda5e3fe0	! t0_kref+0x365c:   	ldx	[%i0 - 0x20], %o5
1:	.word	0x15392764	! t0_kref+0x3660:   	sethi	%hi(0xe49d9000), %o2
	.word	0x99254013	! t0_kref+0x3664:   	mulscc	%l5, %l3, %o4
	.word	0xe62e601c	! t0_kref+0x3668:   	stb	%l3, [%i1 + 0x1c]
	.word	0xa5a0193a	! t0_kref+0x366c:   	fstod	%f26, %f18
	.word	0x81580000	! t0_kref+0x3670:   	flushw
	.word	0x9fc10000	! t0_kref+0x3674:   	call	%g4
	.word	0xe43e6000	! t0_kref+0x3678:   	std	%l2, [%i1]
	.word	0x85a34834	! t0_kref+0x367c:   	fadds	%f13, %f20, %f2
	.word	0x9485c015	! t0_kref+0x3680:   	addcc	%l7, %l5, %o2
	.word	0x97b50ae3	! t0_kref+0x3684:   	fpsub32s	%f20, %f3, %f11
	.word	0x96ba8010	! t0_kref+0x3688:   	xnorcc	%o2, %l0, %o3
	.word	0x98db73a2	! t0_kref+0x368c:   	smulcc	%o5, -0xc5e, %o4
	.word	0xd856200a	! t0_kref+0x3690:   	ldsh	[%i0 + 0xa], %o4
	.word	0x9fb4417a	! t0_kref+0x3694:   	edge32ln	%l1, %i2, %o7
	.word	0x81580000	! t0_kref+0x3698:   	flushw
	.word	0xd878a034	! t0_kref+0x369c:   	swap	[%g2 + 0x34], %o4
	.word	0x3d480002	! t0_kref+0x36a0:   	fbule,a,pt	%fcc0, _kref+0x36a8
	.word	0xa5a388af	! t0_kref+0x36a4:   	fsubs	%f14, %f15, %f18
	.word	0x2b800002	! t0_kref+0x36a8:   	fbug,a	_kref+0x36b0
	.word	0xa9a449a3	! t0_kref+0x36ac:   	fdivs	%f17, %f3, %f20
	.word	0xd8070019	! t0_kref+0x36b0:   	ld	[%i4 + %i1], %o4
	.word	0x89a0052c	! t0_kref+0x36b4:   	fsqrts	%f12, %f4
	.word	0x37800003	! t0_kref+0x36b8:   	fbge,a	_kref+0x36c4
	.word	0x983a7708	! t0_kref+0x36bc:   	xnor	%o1, -0x8f8, %o4
	.word	0x85a018da	! t0_kref+0x36c0:   	fdtos	%f26, %f2
	.word	0x27800003	! t0_kref+0x36c4:   	fbul,a	_kref+0x36d0
	.word	0xb3a4092f	! t0_kref+0x36c8:   	fmuls	%f16, %f15, %f25
	.word	0xe5063ff0	! t0_kref+0x36cc:   	ld	[%i0 - 0x10], %f18
	.word	0xe99e1a5d	! t0_kref+0x36d0:   	ldda	[%i0 + %i5]0xd2, %f20
	.word	0x9db00fc0	! t0_kref+0x36d4:   	fone	%f14
	.word	0x9b244008	! t0_kref+0x36d8:   	mulscc	%l1, %o0, %o5
	.word	0x97134009	! t0_kref+0x36dc:   	taddcctv	%o5, %o1, %o3
	.word	0xafa4c9ac	! t0_kref+0x36e0:   	fdivs	%f19, %f12, %f23
	.word	0x92547710	! t0_kref+0x36e4:   	umul	%l1, -0x8f0, %o1
	.word	0xf19e101d	! t0_kref+0x36e8:   	ldda	[%i0 + %i5]0x80, %f24
	.word	0xe628a028	! t0_kref+0x36ec:   	stb	%l3, [%g2 + 0x28]
	.word	0xae9ceb2c	! t0_kref+0x36f0:   	xorcc	%l3, 0xb2c, %l7
	.word	0x81858000	! t0_kref+0x36f4:   	wr	%l6, %g0, %y
	.word	0x96bd2374	! t0_kref+0x36f8:   	xnorcc	%l4, 0x374, %o3
	.word	0x9eadba7a	! t0_kref+0x36fc:   	andncc	%l6, -0x586, %o7
	.word	0x95b34240	! t0_kref+0x3700:   	array16	%o5, %g0, %o2
	.word	0xda0e001a	! t0_kref+0x3704:   	ldub	[%i0 + %i2], %o5
	.word	0xb3a3c92f	! t0_kref+0x3708:   	fmuls	%f15, %f15, %f25
	.word	0xd886101c	! t0_kref+0x370c:   	lda	[%i0 + %i4]0x80, %o4
	.word	0x3e480005	! t0_kref+0x3710:   	bvc,a,pt	%icc, _kref+0x3724
	.word	0x98aa800b	! t0_kref+0x3714:   	andncc	%o2, %o3, %o4
	.word	0x9722335c	! t0_kref+0x3718:   	mulscc	%o0, -0xca4, %o3
	.word	0x992b4000	! t0_kref+0x371c:   	sll	%o5, %g0, %o4
	.word	0x28800006	! t0_kref+0x3720:   	bleu,a	_kref+0x3738
	.word	0xeb68a005	! t0_kref+0x3724:   	prefetch	%g2 + 5, 21
	.word	0x3a800002	! t0_kref+0x3728:   	bcc,a	_kref+0x3730
	.word	0x967c3689	! t0_kref+0x372c:   	sdiv	%l0, -0x977, %o3
	.word	0x90b229e1	! t0_kref+0x3730:   	orncc	%o0, 0x9e1, %o0
	.word	0x94330000	! t0_kref+0x3734:   	orn	%o4, %g0, %o2
	.word	0x2f800004	! t0_kref+0x3738:   	fbu,a	_kref+0x3748
	.word	0xec3e001d	! t0_kref+0x373c:   	std	%l6, [%i0 + %i5]
	.word	0x81858000	! t0_kref+0x3740:   	wr	%l6, %g0, %y
	.word	0x81df8012	! t0_kref+0x3744:   	flush	%fp + %l2
	.word	0x29480007	! t0_kref+0x3748:   	fbl,a,pt	%fcc0, _kref+0x3764
	.word	0xf16e7ff8	! t0_kref+0x374c:   	prefetch	%i1 - 8, 24
	.word	0x920d8012	! t0_kref+0x3750:   	and	%l6, %l2, %o1
	.word	0x23800002	! t0_kref+0x3754:   	fbne,a	_kref+0x375c
	.word	0x87a0052d	! t0_kref+0x3758:   	fsqrts	%f13, %f3
	.word	0x32480001	! t0_kref+0x375c:   	bne,a,pt	%icc, _kref+0x3760
	.word	0x9bb38a67	! t0_kref+0x3760:   	fpadd32s	%f14, %f7, %f13
	.word	0x9fc00004	! t0_kref+0x3764:   	call	%g0 + %g4
	.word	0xae7a2844	! t0_kref+0x3768:   	sdiv	%o0, 0x844, %l7
	.word	0x23480007	! t0_kref+0x376c:   	fbne,a,pt	%fcc0, _kref+0x3788
	.word	0xd60e0000	! t0_kref+0x3770:   	ldub	[%i0], %o3
	.word	0xd6560000	! t0_kref+0x3774:   	ldsh	[%i0], %o3
	.word	0x95a00125	! t0_kref+0x3778:   	fabss	%f5, %f10
	.word	0xa9a000ae	! t0_kref+0x377c:   	fnegs	%f14, %f20
	.word	0x9eb23c2f	! t0_kref+0x3780:   	orncc	%o0, -0x3d1, %o7
	.word	0x928c798e	! t0_kref+0x3784:   	andcc	%l1, -0x672, %o1
	.word	0x81ad0ada	! t0_kref+0x3788:   	fcmped	%fcc0, %f20, %f26
	.word	0xe81f4018	! t0_kref+0x378c:   	ldd	[%i5 + %i0], %l4
	.word	0x85a01a25	! t0_kref+0x3790:   	fstoi	%f5, %f2
	.word	0x9ec2ef1a	! t0_kref+0x3794:   	addccc	%o3, 0xf1a, %o7
	.word	0x36480002	! t0_kref+0x3798:   	bge,a,pt	%icc, _kref+0x37a0
	.word	0xadb486a9	! t0_kref+0x379c:   	fmul8x16al	%f18, %f9, %f22
	.word	0x3d480008	! t0_kref+0x37a0:   	fbule,a,pt	%fcc0, _kref+0x37c0
	.word	0x9fb60e38	! t0_kref+0x37a4:   	fands	%f24, %f24, %f15
	.word	0xb5b1caf0	! t0_kref+0x37a8:   	fpsub32s	%f7, %f16, %f26
	.word	0x9db7470d	! t0_kref+0x37ac:   	fmuld8sux16	%f29, %f13, %f14
	.word	0xe81e6000	! t0_kref+0x37b0:   	ldd	[%i1], %l4
	.word	0x81ab0ada	! t0_kref+0x37b4:   	fcmped	%fcc0, %f12, %f26
	.word	0xe4262004	! t0_kref+0x37b8:   	st	%l2, [%i0 + 4]
	.word	0xb3a00134	! t0_kref+0x37bc:   	fabss	%f20, %f25
	.word	0x91a189ca	! t0_kref+0x37c0:   	fdivd	%f6, %f10, %f8
	.word	0x9e8dc00a	! t0_kref+0x37c4:   	andcc	%l7, %o2, %o7
	.word	0xe4ee101a	! t0_kref+0x37c8:   	ldstuba	[%i0 + %i2]0x80, %l2
	.word	0xda2e2002	! t0_kref+0x37cc:   	stb	%o5, [%i0 + 2]
	.word	0xc00e2001	! t0_kref+0x37d0:   	ldub	[%i0 + 1], %g0
	.word	0x31800004	! t0_kref+0x37d4:   	fba,a	_kref+0x37e4
	.word	0x9410245b	! t0_kref+0x37d8:   	mov	0x45b, %o2
	.word	0xec1e7ff8	! t0_kref+0x37dc:   	ldd	[%i1 - 8], %l6
	.word	0xf83e001d	! t0_kref+0x37e0:   	std	%i4, [%i0 + %i5]
	.word	0xada000a3	! t0_kref+0x37e4:   	fnegs	%f3, %f22
	.word	0x37800003	! t0_kref+0x37e8:   	fbge,a	_kref+0x37f4
	.word	0xed68a00d	! t0_kref+0x37ec:   	prefetch	%g2 + 0xd, 22
	.word	0x33480008	! t0_kref+0x37f0:   	fbe,a,pt	%fcc0, _kref+0x3810
	.word	0x85b08f88	! t0_kref+0x37f4:   	for	%f2, %f8, %f2
	.word	0xe16e2018	! t0_kref+0x37f8:   	prefetch	%i0 + 0x18, 16
	.word	0x96e47d0e	! t0_kref+0x37fc:   	subccc	%l1, -0x2f2, %o3
	.word	0x9eb83757	! t0_kref+0x3800:   	xnorcc	%g0, -0x8a9, %o7
	.word	0xb9a0054a	! t0_kref+0x3804:   	fsqrtd	%f10, %f28
	.word	0xda4e6012	! t0_kref+0x3808:   	ldsb	[%i1 + 0x12], %o5
	.word	0xa3a1c932	! t0_kref+0x380c:   	fmuls	%f7, %f18, %f17
	.word	0x80153fcd	! t0_kref+0x3810:   	or	%l4, -0x33, %g0
	.word	0xada01930	! t0_kref+0x3814:   	fstod	%f16, %f22
	.word	0x2a480001	! t0_kref+0x3818:   	bcs,a,pt	%icc, _kref+0x381c
	.word	0xe91fbf00	! t0_kref+0x381c:   	ldd	[%fp - 0x100], %f20
	.word	0x98be800c	! t0_kref+0x3820:   	xnorcc	%i2, %o4, %o4
	.word	0xd9be5840	! t0_kref+0x3824:   	stda	%f12, [%i1]0xc2
	.word	0x8da01917	! t0_kref+0x3828:   	fitod	%f23, %f6
	.word	0xb1a01a5c	! t0_kref+0x382c:   	fdtoi	%f28, %f24
	.word	0x90e2c009	! t0_kref+0x3830:   	subccc	%o3, %o1, %o0
	.word	0x981cbec4	! t0_kref+0x3834:   	xor	%l2, -0x13c, %o4
	.word	0x81a98ad6	! t0_kref+0x3838:   	fcmped	%fcc0, %f6, %f22
	.word	0xd608a000	! t0_kref+0x383c:   	ldub	[%g2], %o3
	.word	0xda7e3ff4	! t0_kref+0x3840:   	swap	[%i0 - 0xc], %o5
	.word	0x9bb54120	! t0_kref+0x3844:   	edge32n	%l5, %g0, %o5
	.word	0x9a080012	! t0_kref+0x3848:   	and	%g0, %l2, %o5
	.word	0xa1a449a5	! t0_kref+0x384c:   	fdivs	%f17, %f5, %f16
	.word	0xe91e6000	! t0_kref+0x3850:   	ldd	[%i1], %f20
	.word	0x3d480003	! t0_kref+0x3854:   	fbule,a,pt	%fcc0, _kref+0x3860
	.word	0xe91fbdd8	! t0_kref+0x3858:   	ldd	[%fp - 0x228], %f20
	.word	0xb5a0190c	! t0_kref+0x385c:   	fitod	%f12, %f26
	.word	0x972a400a	! t0_kref+0x3860:   	sll	%o1, %o2, %o3
	.word	0x9e2c6cc2	! t0_kref+0x3864:   	andn	%l1, 0xcc2, %o7
	.word	0x9e9dc00b	! t0_kref+0x3868:   	xorcc	%l7, %o3, %o7
	.word	0x89a01911	! t0_kref+0x386c:   	fitod	%f17, %f4
	.word	0x28800007	! t0_kref+0x3870:   	bleu,a	_kref+0x388c
	.word	0x90dac00c	! t0_kref+0x3874:   	smulcc	%o3, %o4, %o0
	.word	0x35800005	! t0_kref+0x3878:   	fbue,a	_kref+0x388c
	.word	0xaeb33335	! t0_kref+0x387c:   	orncc	%o4, -0xccb, %l7
	.word	0x91b40490	! t0_kref+0x3880:   	fcmple32	%f16, %f16, %o0
	.word	0x8ba5c8ac	! t0_kref+0x3884:   	fsubs	%f23, %f12, %f5
	.word	0xf4200018	! t0_kref+0x3888:   	st	%i2, [%g0 + %i0]
	.word	0xe43e001d	! t0_kref+0x388c:   	std	%l2, [%i0 + %i5]
	.word	0x923a0010	! t0_kref+0x3890:   	xnor	%o0, %l0, %o1
	.word	0x95030012	! t0_kref+0x3894:   	taddcc	%o4, %l2, %o2
	.word	0xd8380018	! t0_kref+0x3898:   	std	%o4, [%g0 + %i0]
	.word	0xc368a04f	! t0_kref+0x389c:   	prefetch	%g2 + 0x4f, 1
	.word	0x9da708ce	! t0_kref+0x38a0:   	fsubd	%f28, %f14, %f14
	.word	0xada01927	! t0_kref+0x38a4:   	fstod	%f7, %f22
	.word	0x81a88a52	! t0_kref+0x38a8:   	fcmpd	%fcc0, %f2, %f18
	.word	0xa3b00768	! t0_kref+0x38ac:   	fpack16	%f8, %f17
	.word	0xd8480018	! t0_kref+0x38b0:   	ldsb	[%g0 + %i0], %o4
	.word	0x9db00cc8	! t0_kref+0x38b4:   	fnot2	%f8, %f14
	.word	0x929a000c	! t0_kref+0x38b8:   	xorcc	%o0, %o4, %o1
	.word	0xde56c019	! t0_kref+0x38bc:   	ldsh	[%i3 + %i1], %o7
	.word	0x80dd396e	! t0_kref+0x38c0:   	smulcc	%l4, -0x692, %g0
	.word	0x97400000	! t0_kref+0x38c4:   	mov	%y, %o3
	.word	0xd43f4018	! t0_kref+0x38c8:   	std	%o2, [%i5 + %i0]
	.word	0x91b206f8	! t0_kref+0x38cc:   	fmul8ulx16	%f8, %f24, %f8
	.word	0x9e1dc012	! t0_kref+0x38d0:   	xor	%l7, %l2, %o7
	.word	0x9f24bed5	! t0_kref+0x38d4:   	mulscc	%l2, -0x12b, %o7
	.word	0xe828a00a	! t0_kref+0x38d8:   	stb	%l4, [%g2 + 0xa]
	.word	0xe5200019	! t0_kref+0x38dc:   	st	%f18, [%g0 + %i1]
	.word	0xe3067ff8	! t0_kref+0x38e0:   	ld	[%i1 - 8], %f17
	.word	0xe3ee101d	! t0_kref+0x38e4:   	prefetcha	%i0 + %i5, 17
	.word	0x91227008	! t0_kref+0x38e8:   	mulscc	%o1, -0xff8, %o0
	.word	0xa7a01a2f	! t0_kref+0x38ec:   	fstoi	%f15, %f19
	.word	0xe07f0019	! t0_kref+0x38f0:   	swap	[%i4 + %i1], %l0
	.word	0x9fc10000	! t0_kref+0x38f4:   	call	%g4
	.word	0x81b10544	! t0_kref+0x38f8:   	fcmpeq16	%f4, %f4, %g0
	.word	0x8fb54de6	! t0_kref+0x38fc:   	fnands	%f21, %f6, %f7
	.word	0x945cc010	! t0_kref+0x3900:   	smul	%l3, %l0, %o2
	.word	0xa1a0002c	! t0_kref+0x3904:   	fmovs	%f12, %f16
	.word	0x81400000	! t0_kref+0x3908:   	mov	%y, %g0
	.word	0xa3a0052a	! t0_kref+0x390c:   	fsqrts	%f10, %f17
	.word	0xa1b68c90	! t0_kref+0x3910:   	fandnot2	%f26, %f16, %f16
	.word	0xa9b48e52	! t0_kref+0x3914:   	fxnor	%f18, %f18, %f20
	.word	0x811d8016	! t0_kref+0x3918:   	tsubcctv	%l6, %l6, %g0
	.word	0xe67e3ffc	! t0_kref+0x391c:   	swap	[%i0 - 4], %l3
	.word	0xaba00523	! t0_kref+0x3920:   	fsqrts	%f3, %f21
	.word	0x9da00152	! t0_kref+0x3924:   	fabsd	%f18, %f14
	.word	0xd82e6002	! t0_kref+0x3928:   	stb	%o4, [%i1 + 2]
	.word	0x38800003	! t0_kref+0x392c:   	bgu,a	_kref+0x3938
	.word	0x9ed24012	! t0_kref+0x3930:   	umulcc	%o1, %l2, %o7
	.word	0x85b546bd	! t0_kref+0x3934:   	fmul8x16al	%f21, %f29, %f2
	.word	0x94528010	! t0_kref+0x3938:   	umul	%o2, %l0, %o2
	.word	0xec7e200c	! t0_kref+0x393c:   	swap	[%i0 + 0xc], %l6
	.word	0xda4e8019	! t0_kref+0x3940:   	ldsb	[%i2 + %i1], %o5
	.word	0x80aac015	! t0_kref+0x3944:   	andncc	%o3, %l5, %g0
	.word	0x81aa0a48	! t0_kref+0x3948:   	fcmpd	%fcc0, %f8, %f8
	.word	0x2e800006	! t0_kref+0x394c:   	bvs,a	_kref+0x3964
	.word	0x97408000	! t0_kref+0x3950:   	mov	%ccr, %o3
	.word	0x967c8011	! t0_kref+0x3954:   	sdiv	%l2, %l1, %o3
	.word	0x31800008	! t0_kref+0x3958:   	fba,a	_kref+0x3978
	.word	0xae65c000	! t0_kref+0x395c:   	subc	%l7, %g0, %l7
	.word	0x81a88a5a	! t0_kref+0x3960:   	fcmpd	%fcc0, %f2, %f26
	.word	0xb9a18940	! t0_kref+0x3964:   	fmuld	%f6, %f0, %f28
	.word	0xa1a000ae	! t0_kref+0x3968:   	fnegs	%f14, %f16
	.word	0x2e800005	! t0_kref+0x396c:   	bvs,a	_kref+0x3980
	.word	0x91a01084	! t0_kref+0x3970:   	fxtos	%f4, %f8
	.word	0xd0ee9018	! t0_kref+0x3974:   	ldstuba	[%i2 + %i0]0x80, %o0
	.word	0xd43f4018	! t0_kref+0x3978:   	std	%o2, [%i5 + %i0]
	.word	0x32480002	! t0_kref+0x397c:   	bne,a,pt	%icc, _kref+0x3984
	.word	0xb5b5cafb	! t0_kref+0x3980:   	fpsub32s	%f23, %f27, %f26
	.word	0x85a00548	! t0_kref+0x3984:   	fsqrtd	%f8, %f2
	.word	0xd47e2018	! t0_kref+0x3988:   	swap	[%i0 + 0x18], %o2
	.word	0xea266008	! t0_kref+0x398c:   	st	%l5, [%i1 + 8]
	.word	0xc96e7fe0	! t0_kref+0x3990:   	prefetch	%i1 - 0x20, 4
	.word	0x25480006	! t0_kref+0x3994:   	fblg,a,pt	%fcc0, _kref+0x39ac
	.word	0xe626401c	! t0_kref+0x3998:   	st	%l3, [%i1 + %i4]
	.word	0x91a01058	! t0_kref+0x399c:   	fdtox	%f24, %f8
	.word	0x34480005	! t0_kref+0x39a0:   	bg,a,pt	%icc, _kref+0x39b4
	.word	0x80c4c00c	! t0_kref+0x39a4:   	addccc	%l3, %o4, %g0
	.word	0xd13e2018	! t0_kref+0x39a8:   	std	%f8, [%i0 + 0x18]
	.word	0x2b800006	! t0_kref+0x39ac:   	fbug,a	_kref+0x39c4
	.word	0x9a634016	! t0_kref+0x39b0:   	subc	%o5, %l6, %o5
	.word	0x9aa5000a	! t0_kref+0x39b4:   	subcc	%l4, %o2, %o5
	.word	0x81850000	! t0_kref+0x39b8:   	wr	%l4, %g0, %y
	.word	0xb7a01a5c	! t0_kref+0x39bc:   	fdtoi	%f28, %f27
	.word	0x81a01904	! t0_kref+0x39c0:   	fitod	%f4, %f0
	.word	0x8143e040	! t0_kref+0x39c4:   	membar	0x40
	.word	0xe05068eb	! t0_kref+0x39c8:   	ldsh	[%g1 + 0x8eb], %l0
	.word	0x801429ef	! t0_kref+0x39cc:   	or	%l0, 0x9ef, %g0
	.word	0x94a33a9e	! t0_kref+0x39d0:   	subcc	%o4, -0x562, %o2
	.word	0xcf20a024	! t0_kref+0x39d4:   	st	%f7, [%g2 + 0x24]
	.word	0xf007bfe0	! t0_kref+0x39d8:   	ld	[%fp - 0x20], %i0
	.word	0xf91fbfc8	! t0_kref+0x39dc:   	ldd	[%fp - 0x38], %f28
	.word	0xc1be188b	! t0_kref+0x39e0:   	stda	%f0, [%i0 + %o3]0xc4
	.word	0xc9be1848	! t0_kref+0x39e4:   	stda	%f4, [%i0 + %o0]0xc2
	.word	0xde4e3fec	! t0_kref+0x39e8:   	ldsb	[%i0 - 0x14], %o7
	.word	0xd800a010	! t0_kref+0x39ec:   	ld	[%g2 + 0x10], %o4
	.word	0x947ca762	! t0_kref+0x39f0:   	sdiv	%l2, 0x762, %o2
	.word	0x98b47657	! t0_kref+0x39f4:   	orncc	%l1, -0x9a9, %o4
	.word	0xae14622e	! t0_kref+0x39f8:   	or	%l1, 0x22e, %l7
	.word	0x38800002	! t0_kref+0x39fc:   	bgu,a	_kref+0x3a04
	.word	0x1b02d00b	! t0_kref+0x3a00:   	sethi	%hi(0xb402c00), %o5
	.word	0xe81e401d	! t0_kref+0x3a04:   	ldd	[%i1 + %i5], %l4
	.word	0x80fa0009	! t0_kref+0x3a08:   	sdivcc	%o0, %o1, %g0
	.word	0xae2c000a	! t0_kref+0x3a0c:   	andn	%l0, %o2, %l7
	.word	0xd228a03e	! t0_kref+0x3a10:   	stb	%o1, [%g2 + 0x3e]
	.word	0x9f700014	! t0_kref+0x3a14:   	popc	%l4, %o7
	.word	0x81de000f	! t0_kref+0x3a18:   	flush	%i0 + %o7
	.word	0x96736143	! t0_kref+0x3a1c:   	udiv	%o5, 0x143, %o3
	.word	0x3f480006	! t0_kref+0x3a20:   	fbo,a,pt	%fcc0, _kref+0x3a38
	.word	0xe830a00c	! t0_kref+0x3a24:   	sth	%l4, [%g2 + 0xc]
	.word	0xc0901018	! t0_kref+0x3a28:   	lduha	[%g0 + %i0]0x80, %g0
	.word	0x93a01a2c	! t0_kref+0x3a2c:   	fstoi	%f12, %f9
	.word	0xf430a032	! t0_kref+0x3a30:   	sth	%i2, [%g2 + 0x32]
	.word	0x9a2a3b99	! t0_kref+0x3a34:   	andn	%o0, -0x467, %o5
	.word	0x24480002	! t0_kref+0x3a38:   	ble,a,pt	%icc, _kref+0x3a40
	.word	0x8da00530	! t0_kref+0x3a3c:   	fsqrts	%f16, %f6
	.word	0x85b60914	! t0_kref+0x3a40:   	faligndata	%f24, %f20, %f2
	.word	0xc5060000	! t0_kref+0x3a44:   	ld	[%i0], %f2
	.word	0x97b20055	! t0_kref+0x3a48:   	edge8l	%o0, %l5, %o3
	.word	0x2f480005	! t0_kref+0x3a4c:   	fbu,a,pt	%fcc0, _kref+0x3a60
	.word	0xb9b64ae8	! t0_kref+0x3a50:   	fpsub32s	%f25, %f8, %f28
	.word	0xe0786e86	! t0_kref+0x3a54:   	swap	[%g1 + 0xe86], %l0
	.word	0x9832c011	! t0_kref+0x3a58:   	orn	%o3, %l1, %o4
	.word	0x8da0191c	! t0_kref+0x3a5c:   	fitod	%f28, %f6
	.word	0x87a00529	! t0_kref+0x3a60:   	fsqrts	%f9, %f3
	.word	0xd4f81019	! t0_kref+0x3a64:   	swapa	[%g0 + %i1]0x80, %o2
	.word	0xb9a648a9	! t0_kref+0x3a68:   	fsubs	%f25, %f9, %f28
	.word	0x97700017	! t0_kref+0x3a6c:   	popc	%l7, %o3
	.word	0x91a01104	! t0_kref+0x3a70:   	fxtod	%f4, %f8
	.word	0x8ba44928	! t0_kref+0x3a74:   	fmuls	%f17, %f8, %f5
	.word	0x8bb10af3	! t0_kref+0x3a78:   	fpsub32s	%f4, %f19, %f5
	.word	0x91a0104a	! t0_kref+0x3a7c:   	fdtox	%f10, %f8
	.word	0x8d844010	! t0_kref+0x3a80:   	wr	%l1, %l0, %fprs
	.word	0x89a00546	! t0_kref+0x3a84:   	fsqrtd	%f6, %f4
	.word	0x38800002	! t0_kref+0x3a88:   	bgu,a	_kref+0x3a90
	.word	0xa1a08848	! t0_kref+0x3a8c:   	faddd	%f2, %f8, %f16
	.word	0xcb00a018	! t0_kref+0x3a90:   	ld	[%g2 + 0x18], %f5
	.word	0xb9a0052f	! t0_kref+0x3a94:   	fsqrts	%f15, %f28
	.word	0x9262c015	! t0_kref+0x3a98:   	subc	%o3, %l5, %o1
	.word	0x9aa26d10	! t0_kref+0x3a9c:   	subcc	%o1, 0xd10, %o5
	.word	0xd60e6005	! t0_kref+0x3aa0:   	ldub	[%i1 + 5], %o3
	.word	0x91a0055c	! t0_kref+0x3aa4:   	fsqrtd	%f28, %f8
	call	1f
	.empty
	.word	0xd520a038	! t0_kref+0x3aac:   	st	%f10, [%g2 + 0x38]
	.word	0xf51e401d	! t0_kref+0x3ab0:   	ldd	[%i1 + %i5], %f26
	.word	0x93b34280	! t0_kref+0x3ab4:   	array32	%o5, %g0, %o1
1:	.word	0x8db08dc6	! t0_kref+0x3ab8:   	fnand	%f2, %f6, %f6
	.word	0xb7a48925	! t0_kref+0x3abc:   	fmuls	%f18, %f5, %f27
	.word	0xc0360000	! t0_kref+0x3ac0:   	clrh	[%i0]
	.word	0x89b00cca	! t0_kref+0x3ac4:   	fnot2	%f10, %f4
	.word	0x30800007	! t0_kref+0x3ac8:   	ba,a	_kref+0x3ae4
	.word	0x8ba1c9a5	! t0_kref+0x3acc:   	fdivs	%f7, %f5, %f5
	.word	0x94ad31db	! t0_kref+0x3ad0:   	andncc	%l4, -0xe25, %o2
	.word	0x99a01909	! t0_kref+0x3ad4:   	fitod	%f9, %f12
	.word	0x90bd000b	! t0_kref+0x3ad8:   	xnorcc	%l4, %o3, %o0
	.word	0xaebb6fb2	! t0_kref+0x3adc:   	xnorcc	%o5, 0xfb2, %l7
	.word	0x93b20558	! t0_kref+0x3ae0:   	fcmpeq16	%f8, %f24, %o1
	.word	0xd87e6008	! t0_kref+0x3ae4:   	swap	[%i1 + 8], %o4
	.word	0x9f2a2009	! t0_kref+0x3ae8:   	sll	%o0, 0x9, %o7
	.word	0x15111f5c	! t0_kref+0x3aec:   	sethi	%hi(0x447d7000), %o2
	.word	0x98620017	! t0_kref+0x3af0:   	subc	%o0, %l7, %o4
	.word	0x90dd800d	! t0_kref+0x3af4:   	smulcc	%l6, %o5, %o0
	.word	0xe43e7fe8	! t0_kref+0x3af8:   	std	%l2, [%i1 - 0x18]
	.word	0xb5b007aa	! t0_kref+0x3afc:   	fpackfix	%f10, %f26
	.word	0xa5a01930	! t0_kref+0x3b00:   	fstod	%f16, %f18
	.word	0x90b2fe95	! t0_kref+0x3b04:   	orncc	%o3, -0x16b, %o0
	.word	0xde40a030	! t0_kref+0x3b08:   	ldsw	[%g2 + 0x30], %o7
	.word	0xae9ae896	! t0_kref+0x3b0c:   	xorcc	%o3, 0x896, %l7
	.word	0x973b4015	! t0_kref+0x3b10:   	sra	%o5, %l5, %o3
	.word	0x8143e040	! t0_kref+0x3b14:   	membar	0x40
	.word	0x80a34000	! t0_kref+0x3b18:   	cmp	%o5, %g0
	.word	0x21800004	! t0_kref+0x3b1c:   	fbn,a	_kref+0x3b2c
	.word	0x912d400c	! t0_kref+0x3b20:   	sll	%l5, %o4, %o0
	.word	0x27800007	! t0_kref+0x3b24:   	fbul,a	_kref+0x3b40
	.word	0x95b30404	! t0_kref+0x3b28:   	fcmple16	%f12, %f4, %o2
	.word	0xe22e001a	! t0_kref+0x3b2c:   	stb	%l1, [%i0 + %i2]
	.word	0x81d86fcf	! t0_kref+0x3b30:   	flush	%g1 + 0xfcf
	.word	0x3f800003	! t0_kref+0x3b34:   	fbo,a	_kref+0x3b40
	.word	0x81d80013	! t0_kref+0x3b38:   	flush	%g0 + %l3
	.word	0x9ef50014	! t0_kref+0x3b3c:   	udivcc	%l4, %l4, %o7
	.word	0x89a00135	! t0_kref+0x3b40:   	fabss	%f21, %f4
	.word	0x905d8010	! t0_kref+0x3b44:   	smul	%l6, %l0, %o0
	.word	0x2c800007	! t0_kref+0x3b48:   	bneg,a	_kref+0x3b64
	.word	0xa9a01a2b	! t0_kref+0x3b4c:   	fstoi	%f11, %f20
	.word	0x93b30177	! t0_kref+0x3b50:   	edge32ln	%o4, %l7, %o1
	.word	0xae9b3a94	! t0_kref+0x3b54:   	xorcc	%o4, -0x56c, %l7
	.word	0x2f480008	! t0_kref+0x3b58:   	fbu,a,pt	%fcc0, _kref+0x3b78
	.word	0x9e72801a	! t0_kref+0x3b5c:   	udiv	%o2, %i2, %o7
	.word	0xda4e3ff1	! t0_kref+0x3b60:   	ldsb	[%i0 - 0xf], %o5
	.word	0x90c40008	! t0_kref+0x3b64:   	addccc	%l0, %o0, %o0
	.word	0x9a954014	! t0_kref+0x3b68:   	orcc	%l5, %l4, %o5
	.word	0xdad81019	! t0_kref+0x3b6c:   	ldxa	[%g0 + %i1]0x80, %o5
	.word	0xd82e8018	! t0_kref+0x3b70:   	stb	%o4, [%i2 + %i0]
	.word	0x801d62e3	! t0_kref+0x3b74:   	xor	%l5, 0x2e3, %g0
	.word	0xe43e3ff0	! t0_kref+0x3b78:   	std	%l2, [%i0 - 0x10]
	.word	0xb9a00158	! t0_kref+0x3b7c:   	fabsd	%f24, %f28
	.word	0xe1bf1a58	! t0_kref+0x3b80:   	stda	%f16, [%i4 + %i0]0xd2
	.word	0x97a0052d	! t0_kref+0x3b84:   	fsqrts	%f13, %f11
	.word	0x9ec48017	! t0_kref+0x3b88:   	addccc	%l2, %l7, %o7
	.word	0xae1cc013	! t0_kref+0x3b8c:   	xor	%l3, %l3, %l7
	.word	0xd9266018	! t0_kref+0x3b90:   	st	%f12, [%i1 + 0x18]
	.word	0xa5a0190a	! t0_kref+0x3b94:   	fitod	%f10, %f18
	.word	0x95a0104c	! t0_kref+0x3b98:   	fdtox	%f12, %f10
	.word	0x807b0010	! t0_kref+0x3b9c:   	sdiv	%o4, %l0, %g0
	.word	0x3e480008	! t0_kref+0x3ba0:   	bvc,a,pt	%icc, _kref+0x3bc0
	.word	0xecff1019	! t0_kref+0x3ba4:   	swapa	[%i4 + %i1]0x80, %l6
	.word	0xd53e0000	! t0_kref+0x3ba8:   	std	%f10, [%i0]
	.word	0x85b58a1c	! t0_kref+0x3bac:   	fpadd16	%f22, %f28, %f2
	.word	0xb1b38748	! t0_kref+0x3bb0:   	fpack32	%f14, %f8, %f24
	.word	0x2b800007	! t0_kref+0x3bb4:   	fbug,a	_kref+0x3bd0
	.word	0x83b10af6	! t0_kref+0x3bb8:   	fpsub32s	%f4, %f22, %f1
	.word	0x807a4011	! t0_kref+0x3bbc:   	sdiv	%o1, %l1, %g0
	.word	0xe4280019	! t0_kref+0x3bc0:   	stb	%l2, [%g0 + %i1]
	.word	0xaee24013	! t0_kref+0x3bc4:   	subccc	%o1, %l3, %l7
	.word	0x3a480006	! t0_kref+0x3bc8:   	bcc,a,pt	%icc, _kref+0x3be0
	.word	0x9ba01a38	! t0_kref+0x3bcc:   	fstoi	%f24, %f13
	.word	0x9a5d400a	! t0_kref+0x3bd0:   	smul	%l5, %o2, %o5
	.word	0xbba1882a	! t0_kref+0x3bd4:   	fadds	%f6, %f10, %f29
	.word	0x24800001	! t0_kref+0x3bd8:   	ble,a	_kref+0x3bdc
	.word	0xd60e8019	! t0_kref+0x3bdc:   	ldub	[%i2 + %i1], %o3
	.word	0x90bcf09f	! t0_kref+0x3be0:   	xnorcc	%l3, -0xf61, %o0
	.word	0x81580000	! t0_kref+0x3be4:   	flushw
	.word	0x91b184cc	! t0_kref+0x3be8:   	fcmpne32	%f6, %f12, %o0
	.word	0x32480007	! t0_kref+0x3bec:   	bne,a,pt	%icc, _kref+0x3c08
	.word	0xc520a018	! t0_kref+0x3bf0:   	st	%f2, [%g2 + 0x18]
	.word	0x99a01894	! t0_kref+0x3bf4:   	fitos	%f20, %f12
	.word	0x900a000a	! t0_kref+0x3bf8:   	and	%o0, %o2, %o0
	.word	0xf3ee101c	! t0_kref+0x3bfc:   	prefetcha	%i0 + %i4, 25
	.word	0x8fa289aa	! t0_kref+0x3c00:   	fdivs	%f10, %f10, %f7
	.word	0x29800004	! t0_kref+0x3c04:   	fbl,a	_kref+0x3c14
	.word	0xb5a00544	! t0_kref+0x3c08:   	fsqrtd	%f4, %f26
	.word	0xc11fbe90	! t0_kref+0x3c0c:   	ldd	[%fp - 0x170], %f0
	.word	0xf007bfe0	! t0_kref+0x3c10:   	ld	[%fp - 0x20], %i0
	.word	0xae500014	! t0_kref+0x3c14:   	umul	%g0, %l4, %l7
	.word	0x9eba8000	! t0_kref+0x3c18:   	xnorcc	%o2, %g0, %o7
	.word	0x99b20404	! t0_kref+0x3c1c:   	fcmple16	%f8, %f4, %o4
	.word	0xb5a01913	! t0_kref+0x3c20:   	fitod	%f19, %f26
	.word	0x85b2ca21	! t0_kref+0x3c24:   	fpadd16s	%f11, %f1, %f2
	.word	0xa9b586d2	! t0_kref+0x3c28:   	fmul8sux16	%f22, %f18, %f20
	.word	0x80858015	! t0_kref+0x3c2c:   	addcc	%l6, %l5, %g0
	.word	0xb9b08dd2	! t0_kref+0x3c30:   	fnand	%f2, %f18, %f28
	.word	0x947b7dc7	! t0_kref+0x3c34:   	sdiv	%o5, -0x239, %o2
	.word	0x98b46c5d	! t0_kref+0x3c38:   	orncc	%l1, 0xc5d, %o4
	.word	0x27480006	! t0_kref+0x3c3c:   	fbul,a,pt	%fcc0, _kref+0x3c54
	.word	0xa9b08f4a	! t0_kref+0x3c40:   	fornot1	%f2, %f10, %f20
	.word	0xb1abc04c	! t0_kref+0x3c44:   	fmovdo	%fcc0, %f12, %f24
	.word	0x35800003	! t0_kref+0x3c48:   	fbue,a	_kref+0x3c54
	.word	0x80324013	! t0_kref+0x3c4c:   	orn	%o1, %l3, %g0
	.word	0xd91fbf08	! t0_kref+0x3c50:   	ldd	[%fp - 0xf8], %f12
	.word	0xee566008	! t0_kref+0x3c54:   	ldsh	[%i1 + 8], %l7
	.word	0xeb68a045	! t0_kref+0x3c58:   	prefetch	%g2 + 0x45, 21
	.word	0x99b50a9c	! t0_kref+0x3c5c:   	fpsub16	%f20, %f28, %f12
	.word	0x81820000	! t0_kref+0x3c60:   	wr	%o0, %g0, %y
	.word	0x2e800002	! t0_kref+0x3c64:   	bvs,a	_kref+0x3c6c
	.word	0x80d5c00c	! t0_kref+0x3c68:   	umulcc	%l7, %o4, %g0
	.word	0x903a4000	! t0_kref+0x3c6c:   	not	%o1, %o0
	.word	0xe5067fe4	! t0_kref+0x3c70:   	ld	[%i1 - 0x1c], %f18
	.word	0xaf3a800d	! t0_kref+0x3c74:   	sra	%o2, %o5, %l7
	.word	0xb9a0193c	! t0_kref+0x3c78:   	fstod	%f28, %f28
	.word	0x20800003	! t0_kref+0x3c7c:   	bn,a	_kref+0x3c88
	.word	0x9a5461f0	! t0_kref+0x3c80:   	umul	%l1, 0x1f0, %o5
	.word	0x91a01938	! t0_kref+0x3c84:   	fstod	%f24, %f8
	.word	0x35800006	! t0_kref+0x3c88:   	fbue,a	_kref+0x3ca0
	.word	0xae72a424	! t0_kref+0x3c8c:   	udiv	%o2, 0x424, %l7
	.word	0xaf1dc000	! t0_kref+0x3c90:   	tsubcctv	%l7, %g0, %l7
	.word	0x85a2c92e	! t0_kref+0x3c94:   	fmuls	%f11, %f14, %f2
	.word	0x37480001	! t0_kref+0x3c98:   	fbge,a,pt	%fcc0, _kref+0x3c9c
	.word	0xaba00532	! t0_kref+0x3c9c:   	fsqrts	%f18, %f21
	.word	0x3a800006	! t0_kref+0x3ca0:   	bcc,a	_kref+0x3cb8
	.word	0xe1ee501c	! t0_kref+0x3ca4:   	prefetcha	%i1 + %i4, 16
	.word	0x807d4008	! t0_kref+0x3ca8:   	sdiv	%l5, %o0, %g0
	.word	0x927d68e7	! t0_kref+0x3cac:   	sdiv	%l5, 0x8e7, %o1
	.word	0x91a3c83b	! t0_kref+0x3cb0:   	fadds	%f15, %f27, %f8
	.word	0x805eb87d	! t0_kref+0x3cb4:   	smul	%i2, -0x783, %g0
	.word	0xaedac00a	! t0_kref+0x3cb8:   	smulcc	%o3, %o2, %l7
	.word	0x98dc32b7	! t0_kref+0x3cbc:   	smulcc	%l0, -0xd49, %o4
	.word	0x92b40015	! t0_kref+0x3cc0:   	orncc	%l0, %l5, %o1
	.word	0xae344011	! t0_kref+0x3cc4:   	orn	%l1, %l1, %l7
	.word	0x97b2414d	! t0_kref+0x3cc8:   	edge32l	%o1, %o5, %o3
	.word	0xe230a012	! t0_kref+0x3ccc:   	sth	%l1, [%g2 + 0x12]
	.word	0x90c2000d	! t0_kref+0x3cd0:   	addccc	%o0, %o5, %o0
	.word	0x97b68d3d	! t0_kref+0x3cd4:   	fandnot1s	%f26, %f29, %f11
	.word	0x9b63e4ad	! t0_kref+0x3cd8:   	movo	%fcc0, -0x353, %o5
	.word	0xc0080018	! t0_kref+0x3cdc:   	ldub	[%g0 + %i0], %g0
	.word	0xbbb00762	! t0_kref+0x3ce0:   	fpack16	%f2, %f29
	.word	0x81daa155	! t0_kref+0x3ce4:   	flush	%o2 + 0x155
	.word	0x30800003	! t0_kref+0x3ce8:   	ba,a	_kref+0x3cf4
	.word	0x89b10a78	! t0_kref+0x3cec:   	fpadd32s	%f4, %f24, %f4
	.word	0xb9a38925	! t0_kref+0x3cf0:   	fmuls	%f14, %f5, %f28
	.word	0x80b54015	! t0_kref+0x3cf4:   	orncc	%l5, %l5, %g0
	.word	0xd42e2008	! t0_kref+0x3cf8:   	stb	%o2, [%i0 + 8]
	.word	0x3d800004	! t0_kref+0x3cfc:   	fbule,a	_kref+0x3d0c
	.word	0x81b01022	! t0_kref+0x3d00:   	siam	0x2
	.word	0x8185c000	! t0_kref+0x3d04:   	wr	%l7, %g0, %y
	.word	0x3a480004	! t0_kref+0x3d08:   	bcc,a,pt	%icc, _kref+0x3d18
	.word	0x90b40013	! t0_kref+0x3d0c:   	orncc	%l0, %l3, %o0
	.word	0x9a7d736b	! t0_kref+0x3d10:   	sdiv	%l5, -0xc95, %o5
	.word	0xa3a01a2d	! t0_kref+0x3d14:   	fstoi	%f13, %f17
	.word	0xa9b58e58	! t0_kref+0x3d18:   	fxnor	%f22, %f24, %f20
	.word	0x9275400d	! t0_kref+0x3d1c:   	udiv	%l5, %o5, %o1
	.word	0x81ad8aca	! t0_kref+0x3d20:   	fcmped	%fcc0, %f22, %f10
	.word	0x96fb0014	! t0_kref+0x3d24:   	sdivcc	%o4, %l4, %o3
	.word	0x3a480006	! t0_kref+0x3d28:   	bcc,a,pt	%icc, _kref+0x3d40
	.word	0x1310069b	! t0_kref+0x3d2c:   	sethi	%hi(0x401a6c00), %o1
	.word	0xc19e7fff	! t0_kref+0x3d30:   	ldda	[%i1 - 1]%asi, %f0
	.word	0x89b00c20	! t0_kref+0x3d34:   	fzeros	%f4
	.word	0x93700012	! t0_kref+0x3d38:   	popc	%l2, %o1
	.word	0x81dfe06b	! t0_kref+0x3d3c:   	flush	%i7 + 0x6b
	.word	0x95b5862c	! t0_kref+0x3d40:   	fmul8x16	%f22, %f12, %f10
	.word	0xef20a034	! t0_kref+0x3d44:   	st	%f23, [%g2 + 0x34]
	.word	0x95b00cd0	! t0_kref+0x3d48:   	fnot2	%f16, %f10
	.word	0x01077355	! t0_kref+0x3d4c:   	sethi	%hi(0x1dcd5400), %g0
	.word	0x9484706f	! t0_kref+0x3d50:   	addcc	%l1, -0xf91, %o2
	.word	0xd028a036	! t0_kref+0x3d54:   	stb	%o0, [%g2 + 0x36]
	.word	0x92044015	! t0_kref+0x3d58:   	add	%l1, %l5, %o1
	.word	0x34800004	! t0_kref+0x3d5c:   	bg,a	_kref+0x3d6c
	.word	0x91a00548	! t0_kref+0x3d60:   	fsqrtd	%f8, %f8
	.word	0x26800007	! t0_kref+0x3d64:   	bl,a	_kref+0x3d80
	.word	0x80d2ede8	! t0_kref+0x3d68:   	umulcc	%o3, 0xde8, %g0
	.word	0xa5a00036	! t0_kref+0x3d6c:   	fmovs	%f22, %f18
	.word	0x96dc6d55	! t0_kref+0x3d70:   	smulcc	%l1, 0xd55, %o3
	.word	0x3c800001	! t0_kref+0x3d74:   	bpos,a	_kref+0x3d78
	.word	0xa3a6082d	! t0_kref+0x3d78:   	fadds	%f24, %f13, %f17
	.word	0xc368a005	! t0_kref+0x3d7c:   	prefetch	%g2 + 5, 1
	.word	0x96527d44	! t0_kref+0x3d80:   	umul	%o1, -0x2bc, %o3
	.word	0x81dec01e	! t0_kref+0x3d84:   	flush	%i3 + %fp
	.word	0x9340c000	! t0_kref+0x3d88:   	mov	%asi, %o1
	.word	0x30480006	! t0_kref+0x3d8c:   	ba,a,pt	%icc, _kref+0x3da4
	.word	0x92db4013	! t0_kref+0x3d90:   	smulcc	%o5, %l3, %o1
	.word	0xe27e4000	! t0_kref+0x3d94:   	swap	[%i1], %l1
	.word	0x9fa01a39	! t0_kref+0x3d98:   	fstoi	%f25, %f15
	.word	0x99a5c9b8	! t0_kref+0x3d9c:   	fdivs	%f23, %f24, %f12
	.word	0xafa00523	! t0_kref+0x3da0:   	fsqrts	%f3, %f23
	.word	0x9014000b	! t0_kref+0x3da4:   	or	%l0, %o3, %o0
	.word	0x9a3a4009	! t0_kref+0x3da8:   	xnor	%o1, %o1, %o5
	.word	0x92824013	! t0_kref+0x3dac:   	addcc	%o1, %l3, %o1
	.word	0x98fb39ef	! t0_kref+0x3db0:   	sdivcc	%o4, -0x611, %o4
	.word	0x22480003	! t0_kref+0x3db4:   	be,a,pt	%icc, _kref+0x3dc0
	.word	0xde500019	! t0_kref+0x3db8:   	ldsh	[%g0 + %i1], %o7
	.word	0xb1a209c0	! t0_kref+0x3dbc:   	fdivd	%f8, %f0, %f24
	.word	0x85a01888	! t0_kref+0x3dc0:   	fitos	%f8, %f2
	.word	0xb7a54936	! t0_kref+0x3dc4:   	fmuls	%f21, %f22, %f27
	.word	0x23480006	! t0_kref+0x3dc8:   	fbne,a,pt	%fcc0, _kref+0x3de0
	.word	0xc1bf5a58	! t0_kref+0x3dcc:   	stda	%f0, [%i5 + %i0]0xd2
	.word	0x905b4000	! t0_kref+0x3dd0:   	smul	%o5, %g0, %o0
	.word	0xed20a01c	! t0_kref+0x3dd4:   	st	%f22, [%g2 + 0x1c]
	.word	0xada4482a	! t0_kref+0x3dd8:   	fadds	%f17, %f10, %f22
	.word	0x99b2c154	! t0_kref+0x3ddc:   	edge32l	%o3, %l4, %o4
	.word	0x96fcc00d	! t0_kref+0x3de0:   	sdivcc	%l3, %o5, %o3
	.word	0xda4e401a	! t0_kref+0x3de4:   	ldsb	[%i1 + %i2], %o5
	.word	0xd27e7ff4	! t0_kref+0x3de8:   	swap	[%i1 - 0xc], %o1
	.word	0x35800006	! t0_kref+0x3dec:   	fbue,a	_kref+0x3e04
	.word	0x95a20936	! t0_kref+0x3df0:   	fmuls	%f8, %f22, %f10
	.word	0x9ebe8010	! t0_kref+0x3df4:   	xnorcc	%i2, %l0, %o7
	.word	0x3b480002	! t0_kref+0x3df8:   	fble,a,pt	%fcc0, _kref+0x3e00
	.word	0xd450a036	! t0_kref+0x3dfc:   	ldsh	[%g2 + 0x36], %o2
	.word	0xe53f4018	! t0_kref+0x3e00:   	std	%f18, [%i5 + %i0]
	.word	0x9da209b5	! t0_kref+0x3e04:   	fdivs	%f8, %f21, %f14
	.word	0xd44e3fe1	! t0_kref+0x3e08:   	ldsb	[%i0 - 0x1f], %o2
	.word	0xae2db4dc	! t0_kref+0x3e0c:   	andn	%l6, -0xb24, %l7
	.word	0x98fc8009	! t0_kref+0x3e10:   	sdivcc	%l2, %o1, %o4
	.word	0x933c800d	! t0_kref+0x3e14:   	sra	%l2, %o5, %o1
	.word	0x2f800007	! t0_kref+0x3e18:   	fbu,a	_kref+0x3e34
	.word	0x9db68a58	! t0_kref+0x3e1c:   	fpadd32	%f26, %f24, %f14
	.word	0x3b800004	! t0_kref+0x3e20:   	fble,a	_kref+0x3e30
	.word	0xc04e7ff8	! t0_kref+0x3e24:   	ldsb	[%i1 - 8], %g0
	.word	0x8db64d33	! t0_kref+0x3e28:   	fandnot1s	%f25, %f19, %f6
	.word	0xde08a003	! t0_kref+0x3e2c:   	ldub	[%g2 + 3], %o7
	.word	0x9054000b	! t0_kref+0x3e30:   	umul	%l0, %o3, %o0
	.word	0xc168a04f	! t0_kref+0x3e34:   	prefetch	%g2 + 0x4f, 0
	.word	0x9613001a	! t0_kref+0x3e38:   	or	%o4, %i2, %o3
	.word	0xec1e2010	! t0_kref+0x3e3c:   	ldd	[%i0 + 0x10], %l6
	.word	0xe51fbfc8	! t0_kref+0x3e40:   	ldd	[%fp - 0x38], %f18
	.word	0x81ad8ac4	! t0_kref+0x3e44:   	fcmped	%fcc0, %f22, %f4
	.word	0x9862c010	! t0_kref+0x3e48:   	subc	%o3, %l0, %o4
	.word	0x9882800d	! t0_kref+0x3e4c:   	addcc	%o2, %o5, %o4
	.word	0xd4d81018	! t0_kref+0x3e50:   	ldxa	[%g0 + %i0]0x80, %o2
	.word	0x22480004	! t0_kref+0x3e54:   	be,a,pt	%icc, _kref+0x3e64
	.word	0xf007bfe0	! t0_kref+0x3e58:   	ld	[%fp - 0x20], %i0
	.word	0xa9a00546	! t0_kref+0x3e5c:   	fsqrtd	%f6, %f20
	.word	0xd4801019	! t0_kref+0x3e60:   	lda	[%g0 + %i1]0x80, %o2
	.word	0x8fa01a5a	! t0_kref+0x3e64:   	fdtoi	%f26, %f7
	.word	0x982dbb83	! t0_kref+0x3e68:   	andn	%l6, -0x47d, %o4
	.word	0x8185c000	! t0_kref+0x3e6c:   	wr	%l7, %g0, %y
	.word	0x3a480007	! t0_kref+0x3e70:   	bcc,a,pt	%icc, _kref+0x3e8c
	.word	0x9b254013	! t0_kref+0x3e74:   	mulscc	%l5, %l3, %o5
	.word	0xa5a0003c	! t0_kref+0x3e78:   	fmovs	%f28, %f18
	.word	0x99254011	! t0_kref+0x3e7c:   	mulscc	%l5, %l1, %o4
	.word	0x01000000	! t0_kref+0x3e80:   	nop
	.word	0x01000000	! t0_kref+0x3e84:   	nop
	.word	0x01000000	! t0_kref+0x3e88:   	nop
	call	SYM(_kaos_done)
	.word	0x01000000	! t0_kref+0x3e90:   	nop
	KGLOBAL(t0_ktbl_end)
t0_ktbl_end:
t0_ktbl_page_end:

KTEXT_MODULE(t0_module_subr0, 0x7909a000)
.seg "text"
t0_subr0_page_begin:
	.skip 8192
.global _t0_subr0; ENTRY(t0_subr0)
	.word	0xa6844012	! t0_subr0+0x0:   	addcc	%l1, %l2, %l3
	.word	0x81c3e008	! t0_subr0+0x4:   	retl
	.word	0xaa64c014	! t0_subr0+0x8:   	subc	%l3, %l4, %l5
t0_subr0_page_end:

KTEXT_MODULE(t0_module_subr1, 0x66aee000)
.seg "text"
t0_subr1_page_begin:
	.skip 8188
.global _t0_subr1; ENTRY(t0_subr1)
	.word	0x9de3bfa0	! t0_subr1+0x0:   	save	%sp, -0x60, %sp
	.word	0xb29eaa5a	! t0_subr1+0x4:   	xorcc	%i2, 0xa5a, %i1
	.word	0x81c7e008	! t0_subr1+0x8:   	ret
	.word	0xa7ee6001	! t0_subr1+0xc:   	restore	%i1, 1, %l3
t0_subr1_page_end:

KTEXT_MODULE(t0_module_subr2, 0x3f6ea000)
.seg "text"
t0_subr2_page_begin:
	.skip 8180
.global _t0_subr2; ENTRY(t0_subr2)
	.word	0x9de3bfa0	! t0_subr2+0x0:   	save	%sp, -0x60, %sp
	.word	0xb2066001	! t0_subr2+0x4:   	add	%i1, 1, %i1
	.word	0x81c7e008	! t0_subr2+0x8:   	ret
	.word	0xa3ee6001	! t0_subr2+0xc:   	restore	%i1, 1, %l1
t0_subr2_page_end:

KTEXT_MODULE(t0_module_subr3, 0x66a78000)
.seg "text"
t0_subr3_page_begin:
	.skip 8132
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
!  Total operations: 3978  
!
!  Operation frequencies
!
!  name               exp    obs
!  ldsb              1.37   1.43
!  ldub              1.32   1.66
!  ldsh              1.03   1.03
!  lduh              0.08   0.08
!  ld                0.38   0.35
!  ldd               0.90   1.06
!  swap              0.85   0.96
!  ldstub            0.51   0.68
!  stb               1.20   1.23
!  sth               0.26   0.20
!  st                0.77   1.01
!  std               1.06   1.08
!  add               0.24   0.18
!  addcc             1.22   1.33
!  addx              0.13   0.18
!  addxcc            0.43   0.63
!  taddcc            0.16   0.15
!  taddcctv          0.18   0.20
!  sub               0.13   0.03
!  subcc             0.80   0.83
!  subx              1.06   1.21
!  subxcc            0.27   0.35
!  tsubcc            0.01   0.00
!  tsubcctv          0.23   0.33
!  mulscc            1.20   1.43
!  and               0.74   0.65
!  andcc             0.48   0.63
!  andn              0.60   0.68
!  andncc            0.44   0.53
!  or                0.44   0.70
!  orcc              0.21   0.28
!  orn               0.93   1.21
!  orncc             1.35   1.38
!  xor               0.52   0.65
!  xorcc             1.19   1.41
!  xnor              0.56   0.78
!  xnorcc            1.00   1.21
!  sll               1.11   1.21
!  srl               0.23   0.23
!  sra               0.63   0.58
!  unimp             0.07   0.03
!  umul              0.69   0.83
!  smul              0.98   1.18
!  udiv              0.28   0.38
!  sdiv              1.10   1.36
!  umulcc            0.53   0.58
!  smulcc            1.32   1.43
!  udivcc            0.12   0.10
!  sdivcc            0.99   0.98
!  rdy               0.23   0.30
!  wry               0.84   1.26
!  bicc              3.70   3.07
!  sethi             1.09   1.23
!  jmpl              0.71   0.48
!  call              0.50   0.50
!  ticc              0.00   0.00
!  flush             0.91   0.98
!  save              0.41   0.25
!  restore           1.13   0.00
!  stbar             0.07   0.08
!  ldf               0.69   0.78
!  lddf              0.23   0.38
!  stf               0.55   0.45
!  stdf              0.42   0.38
!  fadds             0.88   0.85
!  fsubs             0.40   0.43
!  fmuls             1.23   1.23
!  fdivs             0.92   0.85
!  faddd             0.73   0.58
!  fsubd             0.17   0.15
!  fmuld             0.16   0.20
!  fdivd             1.12   1.13
!  faddq             0.00   0.00
!  fsubq             0.00   0.00
!  fmulq             0.00   0.00
!  fdivq             0.00   0.00
!  fsmuld            0.19   0.10
!  fdmulq            0.00   0.00
!  fitos             0.12   0.05
!  fitod             1.31   1.36
!  fitoq             0.00   0.00
!  fstoi             0.91   1.03
!  fstod             1.09   1.16
!  fstoq             0.00   0.00
!  fdtoi             0.81   0.85
!  fdtos             0.22   0.35
!  fdtoq             0.00   0.00
!  fqtoi             0.00   0.00
!  fqtos             0.00   0.00
!  fqtod             0.00   0.00
!  fmovs             0.12   0.15
!  fnegs             0.84   0.73
!  fabss             1.10   1.03
!  fsqrts            1.16   1.56
!  fsqrtd            1.55   1.48
!  fsqrtq            0.00   0.00
!  fcmps             0.25   0.23
!  fcmpd             0.64   0.60
!  fcmpq             0.00   0.00
!  fcmpes            0.18   0.13
!  fcmped            1.27   0.80
!  fcmpeq            0.00   0.00
!  fbfcc             3.65   3.09
!  ldfsr             0.23   0.00
!  stfsr             0.09   0.03
!  loop              0.21   0.05
!  offset            0.02   0.00
!  area              0.19   0.43
!  target            0.17   0.08
!  goto              0.27   0.15
!  sigsegv           0.09   0.10
!  sigbus            0.19   0.23
!  imodify           0.00   0.00
!  ldfsr_offset      0.15   0.00
!  fpattern          1.31   1.61
!  lbranch           0.13   0.08
!  shmld             0.80   1.08
!  shmst             1.56   1.84
!  shmpf             1.00   1.03
!  shmswap           0.16   0.25
!  shmblkld          1.04   0.00
!  shmblkst          0.51   0.00
!  shmblkchk         0.28   0.18
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
!  casa              0.24   0.30
!  rdasi             0.12   0.10
!  wrasi             0.08   0.10
!  bpcc              3.33   3.14
!  fbpfcc            3.65   3.19
!  fmovscc           0.01   0.00
!  fmovdcc           0.27   0.18
!  fmovqcc           0.00   0.00
!  movcc             0.10   0.15
!  flushw            0.22   0.23
!  membar            0.19   0.13
!  prefetch          0.83   1.01
!  rdpc              0.09   0.20
!  ldqf              0.00   0.00
!  stqf              0.00   0.00
!  ldfa              0.12   0.05
!  lddfa             0.28   0.23
!  ldqfa             0.00   0.00
!  ldsba             0.24   0.18
!  ldsha             0.21   0.23
!  lduba             0.06   0.03
!  lduha             0.20   0.20
!  lda               0.27   0.35
!  ldda              0.06   0.10
!  ldstuba           0.25   0.30
!  prefetcha         0.44   0.45
!  stfa              0.00   0.00
!  stdfa             0.05   0.05
!  stqfa             0.00   0.00
!  stba              0.18   0.23
!  stha              0.23   0.20
!  sta               0.06   0.05
!  stda              0.09   0.08
!  swapa             0.22   0.20
!  fmovd             0.07   0.03
!  fnegd             0.16   0.05
!  fabsd             0.25   0.28
!  fstox             0.09   0.13
!  fdtox             0.19   0.23
!  fxtos             0.08   0.13
!  fxtod             0.22   0.15
!  lds               0.01   0.03
!  ldsa              0.01   0.00
!  ldx               0.10   0.05
!  ldxa              0.22   0.15
!  nofault           0.04   0.05
!  rdgsr             0.05   0.00
!  wrgsr             0.00   0.00
!  fpadd16           0.14   0.15
!  fpadd16s          0.05   0.15
!  fpadd32           0.16   0.15
!  fpadd32s          0.23   0.18
!  fpsub16           0.12   0.10
!  fpsub16s          0.18   0.13
!  fpsub32           0.05   0.03
!  fpsub32s          0.24   0.38
!  fpack16           0.14   0.15
!  fpack32           0.22   0.33
!  fpackfix          0.23   0.38
!  fexpand           0.00   0.00
!  fpmerge           0.02   0.03
!  fmul8x16          0.28   0.43
!  fmul8x16au        0.01   0.00
!  fmul8x16al        0.26   0.23
!  fmul8sux16        0.23   0.13
!  fmul8ulx16        0.22   0.28
!  fmuld8sux16       0.17   0.15
!  fmuld8ulx16       0.00   0.00
!  alignaddr         0.27   0.13
!  alignaddrl        0.21   0.23
!  faligndata        0.23   0.18
!  fzero             0.00   0.00
!  fzeros            0.17   0.23
!  fone              0.21   0.18
!  fones             0.10   0.10
!  fsrc1             0.19   0.15
!  fsrc1s            0.09   0.08
!  fsrc2             0.04   0.00
!  fsrc2s            0.08   0.08
!  fnot1             0.00   0.00
!  fnot1s            0.05   0.05
!  fnot2             0.12   0.18
!  fnot2s            0.17   0.15
!  for               0.26   0.33
!  fors              0.01   0.00
!  fnor              0.21   0.23
!  fnors             0.01   0.03
!  fand              0.10   0.20
!  fands             0.15   0.18
!  fnand             0.17   0.13
!  fnands            0.21   0.10
!  fxor              0.06   0.05
!  fxors             0.19   0.28
!  fxnor             0.21   0.20
!  fxnors            0.06   0.03
!  fornot1           0.22   0.13
!  fornot1s          0.02   0.05
!  fornot2           0.04   0.08
!  fornot2s          0.01   0.00
!  fandnot1          0.15   0.18
!  fandnot1s         0.08   0.08
!  fandnot2          0.26   0.28
!  fandnot2s         0.09   0.05
!  fcmpgt16          0.11   0.18
!  fcmpgt32          0.02   0.03
!  fcmple16          0.20   0.20
!  fcmple32          0.27   0.33
!  fcmpne16          0.04   0.03
!  fcmpne32          0.27   0.23
!  fcmpeq16          0.22   0.25
!  fcmpeq32          0.00   0.00
!  edge8             0.07   0.03
!  edge8l            0.24   0.28
!  edge16            0.12   0.18
!  edge16l           0.17   0.20
!  edge32            0.13   0.15
!  edge32l           0.24   0.25
!  pdist             0.05   0.00
!  partial_st8       0.25   0.15
!  partial_st16      0.08   0.10
!  partial_st32      0.10   0.10
!  short_st8         0.03   0.08
!  short_st16        0.06   0.13
!  short_ld8         0.07   0.15
!  short_ld16        0.12   0.15
!  blkld             0.18   0.00
!  blkst             0.08   0.00
!  blkld_offset      0.06   0.00
!  blkst_offset      0.08   0.00
!  blk_check         0.06   0.03
!  casxa             0.04   0.03
!  rdccr             0.26   0.20
!  rdfprs            0.15   0.03
!  wrccr             0.06   0.00
!  popc              0.12   0.25
!  wrfprs            0.06   0.08
!  stx               0.16   0.33
!  stxa              0.15   0.10
!  cflush            0.00   0.00
!  array8            0.01   0.00
!  array16           0.13   0.13
!  array32           0.10   0.05
!  edge8n            0.13   0.10
!  edge8ln           0.09   0.03
!  edge16n           0.10   0.13
!  edge16ln          0.21   0.25
!  edge32n           0.08   0.08
!  edge32ln          0.23   0.30
!  bmask             0.24   0.10
!  bshuffle          0.02   0.05
!  siam              0.17   0.13
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
KDATA_MODULE(t0_module_offset_table, 0x1bcce000)
.seg "data"
t0_offset_table_start:
t0_offset_table_size:	.word	0x00000008
t0_offset_table:
	.word	0xfffffff0
	.word	0xfffffff8
	.word	0x00000010
	.word	0xffffffe0
	.word	0x00000008
	.word	0x00000018
	.word	0x00000000
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

KDATA_MODULE(t0_module_data_in_regs, 0x3326e000)
.seg "data"
KGLOBAL(t0_data_in_regs)
t0_data_in_regs_start:
t0_data_in_regs:
	.word	0xb9f77568          ! %f0
	.word	0xed5f3219          ! %f1
	.word	0x18e9f1b2          ! %f2
	.word	0xc6c73a02          ! %f3
	.word	0xcd38e73e          ! %f4
	.word	0x3ee8525a          ! %f5
	.word	0x4fac7a4c          ! %f6
	.word	0x06f0244a          ! %f7
	.word	0xe4d50f58          ! %f8
	.word	0x7a30cdfe          ! %f9
	.word	0x7c590791          ! %f10
	.word	0xd9d61b98          ! %f11
	.word	0x2650224e          ! %f12
	.word	0xc35f4d56          ! %f13
	.word	0x48089c01          ! %f14
	.word	0xa71ada76          ! %f15
	.word	0x7ef2b7b4          ! %f16
	.word	0xfe323f9b          ! %f17
	.word	0x72d6ae16          ! %f18
	.word	0x891db8c8          ! %f19
	.word	0x05e695a0          ! %f20
	.word	0x88cb1a22          ! %f21
	.word	0x5323c961          ! %f22
	.word	0x1e50a01f          ! %f23
	.word	0x86563069          ! %f24
	.word	0x1891d6ce          ! %f25
	.word	0x70fe9df2          ! %f26
	.word	0x00f7714f          ! %f27
	.word	0x6d9de2b1          ! %f28
	.word	0x792d65c5          ! %f29
	.word	0xf60421fd          ! %f30
	.word	0x02ffaf3e          ! %f31
	.word	0x5d0a21a6          ! %f32
	.word	0xa4250665          ! %f33
	.word	0x4beda9b9          ! %f34
	.word	0x182782fe          ! %f35
	.word	0x048e3184          ! %f36
	.word	0xe889bb79          ! %f37
	.word	0x760e198b          ! %f38
	.word	0x5c886d1e          ! %f39
	.word	0xd8931e5d          ! %f40
	.word	0x94464ea7          ! %f41
	.word	0xd26d9664          ! %f42
	.word	0x820b383d          ! %f43
	.word	0xd0b6fd1c          ! %f44
	.word	0x67a7972d          ! %f45
	.word	0x00455866          ! %f46
	.word	0x999000df          ! %f47
	.word	0x1450b8c7          ! %f48
	.word	0xa695f7cc          ! %f49
	.word	0x919383cd          ! %f50
	.word	0x2dee6683          ! %f51
	.word	0x3c0cf003          ! %f52
	.word	0xa5144803          ! %f53
	.word	0xf6992c0c          ! %f54
	.word	0xdc9f39f4          ! %f55
	.word	0x523ca6dd          ! %f56
	.word	0x75279c80          ! %f57
	.word	0x2a92e536          ! %f58
	.word	0x73223cdf          ! %f59
	.word	0xb5b6d0c7          ! %f60
	.word	0xd68ea2d3          ! %f61
	.word	0x231e879f          ! %f62
	.word	0x5e47c6a5          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0x64        ! %g1 (code pointer)
	.word	t0_data_in_shm_area ! %g2 (shared area pointer)
	.word	0x59adfb63          ! %g3 (loop index)
	.word	SYM(t0_subr3)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0x086653d1          ! %o0
	.word	0x733ace8d          ! %o1
	.word	0x6d3534fb          ! %o2
	.word	0x18bd64f3          ! %o3
	.word	0xc622fd2a          ! %o4
	.word	0xf29a253d          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0x71b9f6df          ! %l0
	.word	0x9be68464          ! %l1
	.word	0xd5c709c3          ! %l2
	.word	0x42af6272          ! %l3
	.word	0x004b7e77          ! %l4
	.word	0x804684a7          ! %l5
	.word	0xeb599465          ! %l6
	.word	0x9149ba8e          ! %l7
	.word	t0_data_in_area0    ! %i0 (area pointer)
	.word	t0_data_in_area0    ! %i1 (area pointer)
	.word	0xfffffffb          ! %i2 (byte offset)
	.word	0xffffffe2          ! %i3 (halfword offset)
	.word	0xfffffff0          ! %i4 (word offset)
	.word	0xffffffe8          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0xfff8d249          ! %y
	.word	0x0000000e          ! %icc (nzvc)
	.word	0x80000683          ! %fsr
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

KDATA_MODULE(t0_module_data_in_stack, 0x73f9c000)
.seg "data"
KGLOBAL(t0_data_in_mtbl_size)
KGLOBAL(t0_data_in_mtbl)
KGLOBAL(t0_data_in_stack)
t0_data_in_stack_start:
	.word	0x75bf4543
	.word	0xb3257e17
	.word	0x43c9f45d
	.word	0x0e650dbe
	.word	0xc2699656
	.word	0x43807645
	.word	0x7d7f79df
	.word	0x8013820d
	.word	0xd8492fe3
	.word	0xe9e8a103
	.word	0xf2674ffb
	.word	0x19eb3c58
	.word	0xb60c70de
	.word	0x0add14a2
	.word	0x8e117f3e
	.word	0xae5328af
	.word	0x2a2de7b0
	.word	0x0840c09c
	.word	0x907ffc94
	.word	0x8319b7ea
	.word	0x98b5af17
	.word	0x8853d2a3
	.word	0x5d96aac6
	.word	0x23321cd9
	.word	0xd1b9354a
	.word	0x6435d8f7
	.word	0x72cb7043
	.word	0x36eba8c0
	.word	0xb0edd160
	.word	0xbbb735f7
	.word	0xe99b6522
	.word	0x3addfb01
	.word	0x4504caf1
	.word	0xa995b8fb
	.word	0x62165d67
	.word	0x2a3bf81b
	.word	0x1fcdb7fd
	.word	0x88a97060
	.word	0xbe225384
	.word	0x75eabbd3
	.word	0x8886550c
	.word	0x954408e3
	.word	0x402c7723
	.word	0xbdd8faaf
	.word	0x568d3b97
	.word	0x77564e32
	.word	0xef15e422
	.word	0x38e686ab
	.word	0x9e1f1aa6
	.word	0x3f14a0c0
	.word	0x618645df
	.word	0x0072eb27
	.word	0x591c55ba
	.word	0x000c74d8
	.word	0x94aeeab4
	.word	0x3aa5541e
	.word	0x3d4f2dec
	.word	0x3b2a2ef5
	.word	0x4a2d0bc5
	.word	0x80ef349d
	.word	0xce88d955
	.word	0x004ff150
	.word	0xae624cf8
	.word	0xb26e6071
	.word	0xdf6e2cb0
	.word	0x41132eb9
	.word	0x1886b944
	.word	0x6aea8d22
	.word	0x7632bb3e
	.word	0x714016aa
	.word	0x7027bf2f
	.word	0x92756e20
	.word	0xe50b90e9
	.word	0xd41f2e98
	.word	0xccfbf191
	.word	0x5673e03c
	.word	0xb710eaac
	.word	0xd86aac8c
	.word	0xe62b909d
	.word	0x7e49d859
	.word	0x5bd89131
	.word	0x9da666f2
	.word	0xc9aa1f21
	.word	0x8b4a0962
	.word	0xa488b9bb
	.word	0x35666db1
	.word	0x8b3d880c
	.word	0xb825757e
	.word	0xb6bd9146
	.word	0xc73da07b
	.word	0x59939831
	.word	0x77265e82
	.word	0x0299d5eb
	.word	0x5fced665
	.word	0xe68ed04a
	.word	0xf34549a7
	.word	0x9bfd2289
	.word	0xa8106ab9
	.word	0xcaffd33e
	.word	0xbdde0a7c
	.word	0x8960d0a1
	.word	0xe27b430b
	.word	0x8590f4a6
	.word	0xd4b6091e
	.word	0xc7869482
	.word	0x85dba28a
	.word	0xacfdab8d
	.word	0x996437a5
	.word	0xe63237a5
	.word	0x620b5e97
	.word	0xaf07ed77
	.word	0xef3e6ae1
	.word	0xe1da155a
	.word	0xff42489b
	.word	0x0c39b5a4
	.word	0x36f70a45
	.word	0xbed03da3
	.word	0x8622e115
	.word	0xfca13c95
	.word	0x32514b23
	.word	0x1620625f
	.word	0xf276a7f1
	.word	0x1f9aa3cf
	.word	0x5e016b19
	.word	0x497cf2aa
	.word	0x2dee9e20
	.word	0xa0a219de
	.word	0x17319dcb
	.word	0x24580883
	.word	0x5871cc64
	.word	0xb155ba9c
	.word	0xf47ba1d1
	.word	0xe2eb0cb0
	.word	0x71cce36b
	.word	0x7d7eafb2
	.word	0x52b230f3
	.word	0xa6ba34de
	.word	0x9a33491f
	.word	0xb56d555f
	.word	0xe3d4bf93
	.word	0x694f400b
	.word	0x9533273c
	.word	0x5d6c6778
	.word	0x753b3f6a
	.word	0x43b91528
	.word	0x5ac34f22
	.word	0xeacb7aaf
	.word	0x78aed976
	.word	0x0a1427f9
	.word	0x952b06ec
	.word	0x88414617
	.word	0xadffd333
	.word	0x9039c840
	.word	0x8df113c0
	.word	0x186a80e7
	.word	0x96f81308
	.word	0x9df2bf19
	.word	0x71009568
	.word	0xae32587d
	.word	0xd98cf804
	.word	0x77ebdea7
	.word	0xf9078721
	.word	0x743dc2a6
	.word	0x032a78c9
	.word	0xa57167f0
	.word	0xa3fbf9b3
	.word	0x9e43301c
	.word	0x1f1cbdc8
t0_data_in_sp:
	.word	0x1be06b05
	.word	0xe7f25ac1
	.word	0x05cc634f
	.word	0x90bcaaae
	.word	0x760b8566
	.word	0x88405d62
	.word	0x87786f68
	.word	0xa3570b1d
	.word	t0_data_in_area0
	.word	t0_data_in_area0
	.word	0xffffffe7
	.word	0xffffffee
	.word	0x00000010
	.word	0xffffffe8
	.word	t0_data_in_fp
	.word	0x842a2b1e
	.word	0x941f665a
	.word	0x426a3fd7
	.word	0x58540df0
	.word	0x4b18064f
	.word	0xf76a45c1
	.word	0x1d5382f9
	.word	0x97222ec1
	.word	0xf4c69d26
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
	.word   	0x86bcbef0	! [%fp - 0xc]
	.word   	0xd6a5a77b	! [%fp - 0x8]
	.word   	0x280e48fd	! [%fp - 0x4]
.global t0_data_in_fp; t0_data_in_fp:
	.word	0x8407a259
	.word	0x2b4082a4
	.word	0x8d5da90c
	.word	0x28e2beeb
	.word	0xc13e9bca
	.word	0xa07439ab
	.word	0x4bffbbc5
	.word	0xc10c5400
	.word	0xe8b163d8
	.word	0x12140da5
	.word	0x3c299f9d
	.word	0x14d1ed3d
	.word	0x644eebf1
	.word	0x80fb7a0f
	.word	0xa4323722
	.word	0xa99d73d5
	.word	0x2187146b
	.word	0x0b64a97d
	.word	0x8a9f5566
	.word	0x4b1dbe12
	.word	0x0227ad94
	.word	0xe069e326
	.word	0x1a55f736
	.word	0xdb23a278
t0_data_in_stacktop:
	.word	0
t0_data_in_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_in_area0, 0x53032000)
.seg "data"
t0_data_in_area0_start:
.skip 5888
t0_data_in_area0_begin:
	.word	0xd9dff607	! t0_data_in_area0-0x20
	.word	0xa1f1cca5	! t0_data_in_area0-0x1c
	.word	0x2ff85b92	! t0_data_in_area0-0x18
	.word	0x2f9a992a	! t0_data_in_area0-0x14
	.word	0xd24d2a40	! t0_data_in_area0-0x10
	.word	0xfb7783fe	! t0_data_in_area0-0xc
	.word	0xc828af58	! t0_data_in_area0-0x8
	.word	0x4d1f8f8c	! t0_data_in_area0-0x4
.global t0_data_in_area0; t0_data_in_area0:
	.word	0x3287f973	! t0_data_in_area0+0x0
	.word	0x3babd5de	! t0_data_in_area0+0x4
	.word	0x3e9e4041	! t0_data_in_area0+0x8
	.word	0xdfbed229	! t0_data_in_area0+0xc
	.word	0xbe53f398	! t0_data_in_area0+0x10
	.word	0x4afd1426	! t0_data_in_area0+0x14
	.word	0x8a666b11	! t0_data_in_area0+0x18
	.word	0xe88c30d7	! t0_data_in_area0+0x1c
t0_data_in_area0_end:
.skip 2240
t0_data_in_area0_stop:

KDATA_MODULE(t0_module_data_in_shm_area, 0x55d84000)
.seg "data"
t0_data_in_shm_area_start:
t0_data_in_shm_area_begin:
.global t0_data_in_shm_area; t0_data_in_shm_area:
	.word	0xd98f44ca	! t0_data_in_shm_area+0x0 (t0)
	.word	0xade750aa	! t0_data_in_shm_area+0x4 (t0)
	.word	0x7389b90a	! t0_data_in_shm_area+0x8 (t0)
	.word	0xac56c119	! t0_data_in_shm_area+0xc (t0)
	.word	0x979251d1	! t0_data_in_shm_area+0x10 (t0)
	.word	0xa7c70035	! t0_data_in_shm_area+0x14 (t0)
	.word	0x64e0e0a1	! t0_data_in_shm_area+0x18 (t0)
	.word	0x27ebe2c3	! t0_data_in_shm_area+0x1c (t0)
	.word	0xf11409fd	! t0_data_in_shm_area+0x20 (t0)
	.word	0x960449d0	! t0_data_in_shm_area+0x24 (t0)
	.word	0x316c9d74	! t0_data_in_shm_area+0x28 (t0)
	.word	0xaf736ae4	! t0_data_in_shm_area+0x2c (t0)
	.word	0xaf210235	! t0_data_in_shm_area+0x30 (t0)
	.word	0x4c0d8643	! t0_data_in_shm_area+0x34 (t0)
	.word	0x523e937a	! t0_data_in_shm_area+0x38 (t0)
	.word	0x12a918df	! t0_data_in_shm_area+0x3c (t0)
	.word	0xac00ad4f	! t0_data_in_shm_area+0x40 (t0 bload)
	.word	0x6afbb3dc	! t0_data_in_shm_area+0x44
	.word	0xa830b17b	! t0_data_in_shm_area+0x48
	.word	0x3555b9db	! t0_data_in_shm_area+0x4c
	.word	0xecc545a1	! t0_data_in_shm_area+0x50
	.word	0x3c23e26e	! t0_data_in_shm_area+0x54
	.word	0x3e8bc6c3	! t0_data_in_shm_area+0x58
	.word	0xb4ac9e5d	! t0_data_in_shm_area+0x5c
	.word	0xacf83bd7	! t0_data_in_shm_area+0x60
	.word	0x9884db9c	! t0_data_in_shm_area+0x64
	.word	0x70954012	! t0_data_in_shm_area+0x68
	.word	0x05584632	! t0_data_in_shm_area+0x6c
	.word	0xba9e3f06	! t0_data_in_shm_area+0x70
	.word	0x80308b57	! t0_data_in_shm_area+0x74
	.word	0xe7073fd6	! t0_data_in_shm_area+0x78
	.word	0xad4b6691	! t0_data_in_shm_area+0x7c
	.word	0xc0eb3201	! t0_data_in_shm_area+0x80 (t0 bstore)
	.word	0x98c4eca4	! t0_data_in_shm_area+0x84
	.word	0x52f5859b	! t0_data_in_shm_area+0x88
	.word	0x7619ae81	! t0_data_in_shm_area+0x8c
	.word	0x3cafa1eb	! t0_data_in_shm_area+0x90
	.word	0x41007ea2	! t0_data_in_shm_area+0x94
	.word	0x7cd4d8c2	! t0_data_in_shm_area+0x98
	.word	0xf2eded78	! t0_data_in_shm_area+0x9c
	.word	0x840e920d	! t0_data_in_shm_area+0xa0
	.word	0xedba85cb	! t0_data_in_shm_area+0xa4
	.word	0x0781ea70	! t0_data_in_shm_area+0xa8
	.word	0x9e698044	! t0_data_in_shm_area+0xac
	.word	0x54a3b0e9	! t0_data_in_shm_area+0xb0
	.word	0x4a479d7a	! t0_data_in_shm_area+0xb4
	.word	0x337fe2c9	! t0_data_in_shm_area+0xb8
	.word	0x7313282e	! t0_data_in_shm_area+0xbc
t0_data_in_shm_area_end:
t0_data_in_shm_area_stop:

KDATA_MODULE(t0_module_data_exp_regs, 0x29d8c000)
.seg "data"
KGLOBAL(t0_data_exp_regs)
t0_data_exp_regs_start:
t0_data_exp_regs:
	.word	0xb9f77568          ! %f0
	.word	0xed5f3219          ! %f1
	.word	0x18e9f1b2          ! %f2
	.word	0xc6c73a02          ! %f3
	.word	0xcd38e73e          ! %f4
	.word	0x3ee8525a          ! %f5
	.word	0x4fac7a4c          ! %f6
	.word	0x06f0244a          ! %f7
	.word	0xe4d50f58          ! %f8
	.word	0x7a30cdfe          ! %f9
	.word	0x7c590791          ! %f10
	.word	0xd9d61b98          ! %f11
	.word	0x2650224e          ! %f12
	.word	0xc35f4d56          ! %f13
	.word	0x48089c01          ! %f14
	.word	0xa71ada76          ! %f15
	.word	0x7ef2b7b4          ! %f16
	.word	0xfe323f9b          ! %f17
	.word	0x72d6ae16          ! %f18
	.word	0x891db8c8          ! %f19
	.word	0x05e695a0          ! %f20
	.word	0x88cb1a22          ! %f21
	.word	0x5323c961          ! %f22
	.word	0x1e50a01f          ! %f23
	.word	0x86563069          ! %f24
	.word	0x1891d6ce          ! %f25
	.word	0x70fe9df2          ! %f26
	.word	0x00f7714f          ! %f27
	.word	0x6d9de2b1          ! %f28
	.word	0x792d65c5          ! %f29
	.word	0xf60421fd          ! %f30
	.word	0x02ffaf3e          ! %f31
	.word	0x5d0a21a6          ! %f32
	.word	0xa4250665          ! %f33
	.word	0x4beda9b9          ! %f34
	.word	0x182782fe          ! %f35
	.word	0x048e3184          ! %f36
	.word	0xe889bb79          ! %f37
	.word	0x760e198b          ! %f38
	.word	0x5c886d1e          ! %f39
	.word	0xd8931e5d          ! %f40
	.word	0x94464ea7          ! %f41
	.word	0xd26d9664          ! %f42
	.word	0x820b383d          ! %f43
	.word	0xd0b6fd1c          ! %f44
	.word	0x67a7972d          ! %f45
	.word	0x00455866          ! %f46
	.word	0x999000df          ! %f47
	.word	0x1450b8c7          ! %f48
	.word	0xa695f7cc          ! %f49
	.word	0x919383cd          ! %f50
	.word	0x2dee6683          ! %f51
	.word	0x3c0cf003          ! %f52
	.word	0xa5144803          ! %f53
	.word	0xf6992c0c          ! %f54
	.word	0xdc9f39f4          ! %f55
	.word	0x523ca6dd          ! %f56
	.word	0x75279c80          ! %f57
	.word	0x2a92e536          ! %f58
	.word	0x73223cdf          ! %f59
	.word	0xb5b6d0c7          ! %f60
	.word	0xd68ea2d3          ! %f61
	.word	0x231e879f          ! %f62
	.word	0x5e47c6a5          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0x64        ! %g1 (code pointer)
	.word	t0_data_exp_shm_area! %g2 (shared area pointer)
	.word	0x59adfb63          ! %g3 (loop index)
	.word	SYM(t0_subr3)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0x086653d1          ! %o0
	.word	0x733ace8d          ! %o1
	.word	0x6d3534fb          ! %o2
	.word	0x18bd64f3          ! %o3
	.word	0xc622fd2a          ! %o4
	.word	0xf29a253d          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0x71b9f6df          ! %l0
	.word	0x9be68464          ! %l1
	.word	0xd5c709c3          ! %l2
	.word	0x42af6272          ! %l3
	.word	0x004b7e77          ! %l4
	.word	0x804684a7          ! %l5
	.word	0xeb599465          ! %l6
	.word	0x9149ba8e          ! %l7
	.word	t0_data_exp_area0   ! %i0 (area pointer)
	.word	t0_data_exp_area0   ! %i1 (area pointer)
	.word	0xfffffffb          ! %i2 (byte offset)
	.word	0xffffffe2          ! %i3 (halfword offset)
	.word	0xfffffff0          ! %i4 (word offset)
	.word	0xffffffe8          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0xfff8d249          ! %y
	.word	0x0000000e          ! %icc (nzvc)
	.word	0x80000683          ! %fsr
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

KDATA_MODULE(t0_module_data_exp_stack, 0x4a92c000)
.seg "data"
KGLOBAL(t0_data_exp_mtbl_size)
KGLOBAL(t0_data_exp_mtbl)
KGLOBAL(t0_data_exp_stack)
t0_data_exp_stack_start:
	.word	0x75bf4543
	.word	0xb3257e17
	.word	0x43c9f45d
	.word	0x0e650dbe
	.word	0xc2699656
	.word	0x43807645
	.word	0x7d7f79df
	.word	0x8013820d
	.word	0xd8492fe3
	.word	0xe9e8a103
	.word	0xf2674ffb
	.word	0x19eb3c58
	.word	0xb60c70de
	.word	0x0add14a2
	.word	0x8e117f3e
	.word	0xae5328af
	.word	0x2a2de7b0
	.word	0x0840c09c
	.word	0x907ffc94
	.word	0x8319b7ea
	.word	0x98b5af17
	.word	0x8853d2a3
	.word	0x5d96aac6
	.word	0x23321cd9
	.word	0xd1b9354a
	.word	0x6435d8f7
	.word	0x72cb7043
	.word	0x36eba8c0
	.word	0xb0edd160
	.word	0xbbb735f7
	.word	0xe99b6522
	.word	0x3addfb01
	.word	0x4504caf1
	.word	0xa995b8fb
	.word	0x62165d67
	.word	0x2a3bf81b
	.word	0x1fcdb7fd
	.word	0x88a97060
	.word	0xbe225384
	.word	0x75eabbd3
	.word	0x8886550c
	.word	0x954408e3
	.word	0x402c7723
	.word	0xbdd8faaf
	.word	0x568d3b97
	.word	0x77564e32
	.word	0xef15e422
	.word	0x38e686ab
	.word	0x9e1f1aa6
	.word	0x3f14a0c0
	.word	0x618645df
	.word	0x0072eb27
	.word	0x591c55ba
	.word	0x000c74d8
	.word	0x94aeeab4
	.word	0x3aa5541e
	.word	0x3d4f2dec
	.word	0x3b2a2ef5
	.word	0x4a2d0bc5
	.word	0x80ef349d
	.word	0xce88d955
	.word	0x004ff150
	.word	0xae624cf8
	.word	0xb26e6071
	.word	0xdf6e2cb0
	.word	0x41132eb9
	.word	0x1886b944
	.word	0x6aea8d22
	.word	0x7632bb3e
	.word	0x714016aa
	.word	0x7027bf2f
	.word	0x92756e20
	.word	0xe50b90e9
	.word	0xd41f2e98
	.word	0xccfbf191
	.word	0x5673e03c
	.word	0xb710eaac
	.word	0xd86aac8c
	.word	0xe62b909d
	.word	0x7e49d859
	.word	0x5bd89131
	.word	0x9da666f2
	.word	0xc9aa1f21
	.word	0x8b4a0962
	.word	0xa488b9bb
	.word	0x35666db1
	.word	0x8b3d880c
	.word	0xb825757e
	.word	0xb6bd9146
	.word	0xc73da07b
	.word	0x59939831
	.word	0x77265e82
	.word	0x0299d5eb
	.word	0x5fced665
	.word	0xe68ed04a
	.word	0xf34549a7
	.word	0x9bfd2289
	.word	0xa8106ab9
	.word	0xcaffd33e
	.word	0xbdde0a7c
	.word	0x8960d0a1
	.word	0xe27b430b
	.word	0x8590f4a6
	.word	0xd4b6091e
	.word	0xc7869482
	.word	0x85dba28a
	.word	0xacfdab8d
	.word	0x996437a5
	.word	0xe63237a5
	.word	0x620b5e97
	.word	0xaf07ed77
	.word	0xef3e6ae1
	.word	0xe1da155a
	.word	0xff42489b
	.word	0x0c39b5a4
	.word	0x36f70a45
	.word	0xbed03da3
	.word	0x8622e115
	.word	0xfca13c95
	.word	0x32514b23
	.word	0x1620625f
	.word	0xf276a7f1
	.word	0x1f9aa3cf
	.word	0x5e016b19
	.word	0x497cf2aa
	.word	0x2dee9e20
	.word	0xa0a219de
	.word	0x17319dcb
	.word	0x24580883
	.word	0x5871cc64
	.word	0xb155ba9c
	.word	0xf47ba1d1
	.word	0xe2eb0cb0
	.word	0x71cce36b
	.word	0x7d7eafb2
	.word	0x52b230f3
	.word	0xa6ba34de
	.word	0x9a33491f
	.word	0xb56d555f
	.word	0xe3d4bf93
	.word	0x694f400b
	.word	0x9533273c
	.word	0x5d6c6778
	.word	0x753b3f6a
	.word	0x43b91528
	.word	0x5ac34f22
	.word	0xeacb7aaf
	.word	0x78aed976
	.word	0x0a1427f9
	.word	0x952b06ec
	.word	0x88414617
	.word	0xadffd333
	.word	0x9039c840
	.word	0x8df113c0
	.word	0x186a80e7
	.word	0x96f81308
	.word	0x9df2bf19
	.word	0x71009568
	.word	0xae32587d
	.word	0xd98cf804
	.word	0x77ebdea7
	.word	0xf9078721
	.word	0x743dc2a6
	.word	0x032a78c9
	.word	0xa57167f0
	.word	0xa3fbf9b3
	.word	0x9e43301c
	.word	0x1f1cbdc8
t0_data_exp_sp:
	.word	0x1be06b05
	.word	0xe7f25ac1
	.word	0x05cc634f
	.word	0x90bcaaae
	.word	0x760b8566
	.word	0x88405d62
	.word	0x87786f68
	.word	0xa3570b1d
	.word	t0_data_exp_area0
	.word	t0_data_exp_area0
	.word	0xffffffe7
	.word	0xffffffee
	.word	0x00000010
	.word	0xffffffe8
	.word	t0_data_exp_fp
	.word	0x842a2b1e
	.word	0x941f665a
	.word	0x426a3fd7
	.word	0x58540df0
	.word	0x4b18064f
	.word	0xf76a45c1
	.word	0x1d5382f9
	.word	0x97222ec1
	.word	0xf4c69d26
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
	.word   	0x86bcbef0	! [%fp - 0xc]
	.word   	0xd6a5a77b	! [%fp - 0x8]
	.word   	0x280e48fd	! [%fp - 0x4]
t0_data_exp_fp:
	.word	0x8407a259
	.word	0x2b4082a4
	.word	0x8d5da90c
	.word	0x28e2beeb
	.word	0xc13e9bca
	.word	0xa07439ab
	.word	0x4bffbbc5
	.word	0xc10c5400
	.word	0xe8b163d8
	.word	0x12140da5
	.word	0x3c299f9d
	.word	0x14d1ed3d
	.word	0x644eebf1
	.word	0x80fb7a0f
	.word	0xa4323722
	.word	0xa99d73d5
	.word	0x2187146b
	.word	0x0b64a97d
	.word	0x8a9f5566
	.word	0x4b1dbe12
	.word	0x0227ad94
	.word	0xe069e326
	.word	0x1a55f736
	.word	0xdb23a278
t0_data_exp_stacktop:
	.word	0
t0_data_exp_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_exp_area0, 0x13c86000)
.seg "data"
t0_data_exp_area0_start:
.skip 5888
t0_data_exp_area0_begin:
	.word	0xd9dff607	! t0_data_exp_area0-0x20
	.word	0xa1f1cca5	! t0_data_exp_area0-0x1c
	.word	0x2ff85b92	! t0_data_exp_area0-0x18
	.word	0x2f9a992a	! t0_data_exp_area0-0x14
	.word	0xd24d2a40	! t0_data_exp_area0-0x10
	.word	0xfb7783fe	! t0_data_exp_area0-0xc
	.word	0xc828af58	! t0_data_exp_area0-0x8
	.word	0x4d1f8f8c	! t0_data_exp_area0-0x4
.global t0_data_exp_area0; t0_data_exp_area0:
	.word	0x3287f973	! t0_data_exp_area0+0x0
	.word	0x3babd5de	! t0_data_exp_area0+0x4
	.word	0x3e9e4041	! t0_data_exp_area0+0x8
	.word	0xdfbed229	! t0_data_exp_area0+0xc
	.word	0xbe53f398	! t0_data_exp_area0+0x10
	.word	0x4afd1426	! t0_data_exp_area0+0x14
	.word	0x8a666b11	! t0_data_exp_area0+0x18
	.word	0xe88c30d7	! t0_data_exp_area0+0x1c
t0_data_exp_area0_end:
.skip 2240
t0_data_exp_area0_stop:

KDATA_MODULE(t0_module_data_exp_shm_area, 0x7ac20000)
.seg "data"
t0_data_exp_shm_area_start:
t0_data_exp_shm_area_begin:
.global t0_data_exp_shm_area; t0_data_exp_shm_area:
	.word	0xd98f44ca	! t0_data_exp_shm_area+0x0 (t0)
	.word	0xade750aa	! t0_data_exp_shm_area+0x4 (t0)
	.word	0x7389b90a	! t0_data_exp_shm_area+0x8 (t0)
	.word	0xac56c119	! t0_data_exp_shm_area+0xc (t0)
	.word	0x979251d1	! t0_data_exp_shm_area+0x10 (t0)
	.word	0xa7c70035	! t0_data_exp_shm_area+0x14 (t0)
	.word	0x64e0e0a1	! t0_data_exp_shm_area+0x18 (t0)
	.word	0x27ebe2c3	! t0_data_exp_shm_area+0x1c (t0)
	.word	0xf11409fd	! t0_data_exp_shm_area+0x20 (t0)
	.word	0x960449d0	! t0_data_exp_shm_area+0x24 (t0)
	.word	0x316c9d74	! t0_data_exp_shm_area+0x28 (t0)
	.word	0xaf736ae4	! t0_data_exp_shm_area+0x2c (t0)
	.word	0xaf210235	! t0_data_exp_shm_area+0x30 (t0)
	.word	0x4c0d8643	! t0_data_exp_shm_area+0x34 (t0)
	.word	0x523e937a	! t0_data_exp_shm_area+0x38 (t0)
	.word	0x12a918df	! t0_data_exp_shm_area+0x3c (t0)
	.word	0xac00ad4f	! t0_data_exp_shm_area+0x40 (t0 bload)
	.word	0x6afbb3dc	! t0_data_exp_shm_area+0x44
	.word	0xa830b17b	! t0_data_exp_shm_area+0x48
	.word	0x3555b9db	! t0_data_exp_shm_area+0x4c
	.word	0xecc545a1	! t0_data_exp_shm_area+0x50
	.word	0x3c23e26e	! t0_data_exp_shm_area+0x54
	.word	0x3e8bc6c3	! t0_data_exp_shm_area+0x58
	.word	0xb4ac9e5d	! t0_data_exp_shm_area+0x5c
	.word	0xacf83bd7	! t0_data_exp_shm_area+0x60
	.word	0x9884db9c	! t0_data_exp_shm_area+0x64
	.word	0x70954012	! t0_data_exp_shm_area+0x68
	.word	0x05584632	! t0_data_exp_shm_area+0x6c
	.word	0xba9e3f06	! t0_data_exp_shm_area+0x70
	.word	0x80308b57	! t0_data_exp_shm_area+0x74
	.word	0xe7073fd6	! t0_data_exp_shm_area+0x78
	.word	0xad4b6691	! t0_data_exp_shm_area+0x7c
	.word	0xc0eb3201	! t0_data_exp_shm_area+0x80 (t0 bstore)
	.word	0x98c4eca4	! t0_data_exp_shm_area+0x84
	.word	0x52f5859b	! t0_data_exp_shm_area+0x88
	.word	0x7619ae81	! t0_data_exp_shm_area+0x8c
	.word	0x3cafa1eb	! t0_data_exp_shm_area+0x90
	.word	0x41007ea2	! t0_data_exp_shm_area+0x94
	.word	0x7cd4d8c2	! t0_data_exp_shm_area+0x98
	.word	0xf2eded78	! t0_data_exp_shm_area+0x9c
	.word	0x840e920d	! t0_data_exp_shm_area+0xa0
	.word	0xedba85cb	! t0_data_exp_shm_area+0xa4
	.word	0x0781ea70	! t0_data_exp_shm_area+0xa8
	.word	0x9e698044	! t0_data_exp_shm_area+0xac
	.word	0x54a3b0e9	! t0_data_exp_shm_area+0xb0
	.word	0x4a479d7a	! t0_data_exp_shm_area+0xb4
	.word	0x337fe2c9	! t0_data_exp_shm_area+0xb8
	.word	0x7313282e	! t0_data_exp_shm_area+0xbc
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
#define T0_KAOS_SEED          d2b2ca91e25c
#define T0_KAOS_ICOUNT        4000
#define T0_KAOS_AREAS         1
#define T0_KAOS_AREASIZE      64
#define T0_KAOS_AREAOFFSET    5888
#define T0_KAOS_PAGESIZE      8192
#define T0_KAOS_CODECOUNT     4005

#define T0_KAOS_BOOT_VA                  0x3bae2000
#define T0_KAOS_BOOT_PA                  0x0000000001fe0000
#define T0_KAOS_BOOT_CACHEABLE           1
#define T0_KAOS_BOOT_NONCACHEABLE        0

#define T0_KAOS_STARTUP_VA               0x4b640000
#define T0_KAOS_STARTUP_PA               0x00000000037c4000
#define T0_KAOS_STARTUP_CACHEABLE        1
#define T0_KAOS_STARTUP_NONCACHEABLE     0

#define T0_KAOS_OFFSET_TBL_VA            0x1bcce000
#define T0_KAOS_OFFSET_TBL_PA            0x00000000050dc000
#define T0_KAOS_OFFSET_TBL_CACHEABLE     1
#define T0_KAOS_OFFSET_TBL_NONCACHEABLE  0

#define T0_KAOS_DONE_VA                  0x1ba9a000
#define T0_KAOS_DONE_PA                  0x0000000006aae000
#define T0_KAOS_DONE_CACHEABLE           1
#define T0_KAOS_DONE_NONCACHEABLE        0

#define T0_KAOS_KTBL_VA                  0x669e8000
#define T0_KAOS_KTBL_PA                  0x0000000008118000
#define T0_KAOS_KTBL_CACHEABLE           1
#define T0_KAOS_KTBL_NONCACHEABLE        0

#define T0_KAOS_SUBR0_VA                 0x7909a000
#define T0_KAOS_SUBR0_PA                 0x000000000a25c000
#define T0_KAOS_SUBR0_CACHEABLE          1
#define T0_KAOS_SUBR0_NONCACHEABLE       0
#define T0_KAOS_SUBR1_VA                 0x66aee000
#define T0_KAOS_SUBR1_PA                 0x000000000c7fe000
#define T0_KAOS_SUBR1_CACHEABLE          1
#define T0_KAOS_SUBR1_NONCACHEABLE       0
#define T0_KAOS_SUBR2_VA                 0x3f6ea000
#define T0_KAOS_SUBR2_PA                 0x000000000e8e4000
#define T0_KAOS_SUBR2_CACHEABLE          1
#define T0_KAOS_SUBR2_NONCACHEABLE       0
#define T0_KAOS_SUBR3_VA                 0x66a78000
#define T0_KAOS_SUBR3_PA                 0x0000000010d90000
#define T0_KAOS_SUBR3_CACHEABLE          1
#define T0_KAOS_SUBR3_NONCACHEABLE       0

#define T0_KAOS_EXP_REGS_VA              0x29d8c000
#define T0_KAOS_EXP_REGS_PA              0x0000000013b0c000
#define T0_KAOS_EXP_REGS_CACHEABLE       1
#define T0_KAOS_EXP_REGS_NONCACHEABLE    0
#define T0_KAOS_RUN_REGS_VA              0x3326e000
#define T0_KAOS_RUN_REGS_PA              0x0000000015b4a000
#define T0_KAOS_RUN_REGS_CACHEABLE       1
#define T0_KAOS_RUN_REGS_NONCACHEABLE    0

#define T0_KAOS_EXP_STACK_VA             0x4a92c000
#define T0_KAOS_EXP_STACK_PA             0x00000000165bc000
#define T0_KAOS_EXP_STACK_CACHEABLE      1
#define T0_KAOS_EXP_STACK_NONCACHEABLE   0
#define T0_KAOS_RUN_STACK_VA             0x73f9c000
#define T0_KAOS_RUN_STACK_PA             0x0000000019682000
#define T0_KAOS_RUN_STACK_CACHEABLE      1
#define T0_KAOS_RUN_STACK_NONCACHEABLE   0

#define T0_KAOS_AREA0
#define T0_KAOS_EXP_AREA0_VA             0x13c86000
#define T0_KAOS_EXP_AREA0_PA             0x000000001be64000
#define T0_KAOS_EXP_AREA0_CACHEABLE      1
#define T0_KAOS_EXP_AREA0_NONCACHEABLE   0
#define T0_KAOS_RUN_AREA0_VA             0x53032000
#define T0_KAOS_RUN_AREA0_PA             0x000000001cb96000
#define T0_KAOS_RUN_AREA0_CACHEABLE      1
#define T0_KAOS_RUN_AREA0_NONCACHEABLE   0

#define T0_KAOS_SHM_AREA
#define T0_KAOS_EXP_SHM_AREA_VA          0x7ac20000
#define T0_KAOS_EXP_SHM_AREA_PA          0x00000000013a0000
#define T0_KAOS_EXP_SHM_AREA_CACHEABLE   1
#define T0_KAOS_EXP_SHM_AREA_NONCACHEABLE 0
#define T0_KAOS_RUN_SHM_AREA_VA          0x55d84000
#define T0_KAOS_RUN_SHM_AREA_PA          0x00000000018e4000
#define T0_KAOS_RUN_SHM_AREA_CACHEABLE   1
#define T0_KAOS_RUN_SHM_AREA_NONCACHEABLE 0

#define T0_KAOS_RANVAL_00     0xdd2f4a8f
#define T0_KAOS_RANVAL_01     0x0fd75dac
#define T0_KAOS_RANVAL_02     0x7d760d5e
#define T0_KAOS_RANVAL_03     0xe2b9b05c
#define T0_KAOS_RANVAL_04     0xe35e8c2e
#define T0_KAOS_RANVAL_05     0xace0190a
#define T0_KAOS_RANVAL_06     0x577758e3
#define T0_KAOS_RANVAL_07     0xc8910577
#define T0_KAOS_RANVAL_08     0x009beced
#define T0_KAOS_RANVAL_09     0xe379f726
#define T0_KAOS_RANVAL_0a     0x9e159e25
#define T0_KAOS_RANVAL_0b     0x9516a38d
#define T0_KAOS_RANVAL_0c     0x933ccffb
#define T0_KAOS_RANVAL_0d     0x3bdaef05
#define T0_KAOS_RANVAL_0e     0x23ede23a
#define T0_KAOS_RANVAL_0f     0xdc347e37
#define T0_KAOS_RANVAL_10     0xd91eb3e4
#define T0_KAOS_RANVAL_11     0x0b3965dd
#define T0_KAOS_RANVAL_12     0x8f7a07f9
#define T0_KAOS_RANVAL_13     0x5be7c6fe
#define T0_KAOS_RANVAL_14     0x37178326
#define T0_KAOS_RANVAL_15     0x6773761e
#define T0_KAOS_RANVAL_16     0x52c7a4ac
#define T0_KAOS_RANVAL_17     0xe62335fa
#define T0_KAOS_RANVAL_18     0x4ac1da04
#define T0_KAOS_RANVAL_19     0x793522b6
#define T0_KAOS_RANVAL_1a     0x327aec04
#define T0_KAOS_RANVAL_1b     0x99fab8bc
#define T0_KAOS_RANVAL_1c     0x73675599
#define T0_KAOS_RANVAL_1d     0x8937fa91
#define T0_KAOS_RANVAL_1e     0x4c7fe74d
#define T0_KAOS_RANVAL_1f     0xf0a0ab6d
#define T0_KAOS_RANVAL_20     0xc058402f
#define T0_KAOS_RANVAL_21     0xf5daf05f
#define T0_KAOS_RANVAL_22     0xf63b6be2
#define T0_KAOS_RANVAL_23     0x209b0036
#define T0_KAOS_RANVAL_24     0xf8212ed1
#define T0_KAOS_RANVAL_25     0x0cf96a99
#define T0_KAOS_RANVAL_26     0xf13084e2
#define T0_KAOS_RANVAL_27     0xaf18f8e2
#define T0_KAOS_RANVAL_28     0xda04641e
#define T0_KAOS_RANVAL_29     0xeed4cfc4
#define T0_KAOS_RANVAL_2a     0x23264423
#define T0_KAOS_RANVAL_2b     0x0ab856c2
#define T0_KAOS_RANVAL_2c     0x0b260c5f
#define T0_KAOS_RANVAL_2d     0x025412f7
#define T0_KAOS_RANVAL_2e     0x2f252e66
#define T0_KAOS_RANVAL_2f     0x369324d1
#define T0_KAOS_RANVAL_30     0xe037a6dc
#define T0_KAOS_RANVAL_31     0xc511049b
#define T0_KAOS_RANVAL_32     0x6e62b6cc
#define T0_KAOS_RANVAL_33     0xbe5d8017
#define T0_KAOS_RANVAL_34     0x8460306b
#define T0_KAOS_RANVAL_35     0x8ae36b72
#define T0_KAOS_RANVAL_36     0xfea47d89
#define T0_KAOS_RANVAL_37     0xe6ed0251
#define T0_KAOS_RANVAL_38     0xd3e3e349
#define T0_KAOS_RANVAL_39     0xfd1629da
#define T0_KAOS_RANVAL_3a     0xfe0c45d6
#define T0_KAOS_RANVAL_3b     0xb7f9b2d1
#define T0_KAOS_RANVAL_3c     0xa5e7a02c
#define T0_KAOS_RANVAL_3d     0x4972f351
#define T0_KAOS_RANVAL_3e     0xe5d8d72c
#define T0_KAOS_RANVAL_3f     0x9e82a1a3
#define T0_KAOS_RANVAL_40     0x91d95498
#define T0_KAOS_RANVAL_41     0x2915563b
#define T0_KAOS_RANVAL_42     0x05b73dae
#define T0_KAOS_RANVAL_43     0xf13e90f1
#define T0_KAOS_RANVAL_44     0x6bc7f271
#define T0_KAOS_RANVAL_45     0x6ebe1de3
#define T0_KAOS_RANVAL_46     0xdb031de6
#define T0_KAOS_RANVAL_47     0x242350a8
#define T0_KAOS_RANVAL_48     0x848accd1
#define T0_KAOS_RANVAL_49     0x206c50bf
#define T0_KAOS_RANVAL_4a     0xca0c0fb3
#define T0_KAOS_RANVAL_4b     0x6b94b05a
#define T0_KAOS_RANVAL_4c     0x08416e1b
#define T0_KAOS_RANVAL_4d     0x40914ef7
#define T0_KAOS_RANVAL_4e     0x36613482
#define T0_KAOS_RANVAL_4f     0x8d762b65
#define T0_KAOS_RANVAL_50     0xccb23b50
#define T0_KAOS_RANVAL_51     0x1c89d528
#define T0_KAOS_RANVAL_52     0x29837cbc
#define T0_KAOS_RANVAL_53     0xa468b355
#define T0_KAOS_RANVAL_54     0x429f78a0
#define T0_KAOS_RANVAL_55     0x005de764
#define T0_KAOS_RANVAL_56     0x6872507f
#define T0_KAOS_RANVAL_57     0x4a303c86
#define T0_KAOS_RANVAL_58     0x9e8f8344
#define T0_KAOS_RANVAL_59     0x9f65e87d
#define T0_KAOS_RANVAL_5a     0xbf8d8f8f
#define T0_KAOS_RANVAL_5b     0x7fd2f10e
#define T0_KAOS_RANVAL_5c     0x57fe548a
#define T0_KAOS_RANVAL_5d     0xe6936183
#define T0_KAOS_RANVAL_5e     0x54831c8e
#define T0_KAOS_RANVAL_5f     0x66be2dd9
#define T0_KAOS_RANVAL_60     0xcebba231
#define T0_KAOS_RANVAL_61     0x9c003d8a
#define T0_KAOS_RANVAL_62     0x56ad676b
#define T0_KAOS_RANVAL_63     0x845bae14
#define T0_KAOS_RANVAL_64     0xce9a2ff6
#define T0_KAOS_RANVAL_65     0x804f7daf
#define T0_KAOS_RANVAL_66     0x82abab18
#define T0_KAOS_RANVAL_67     0x8b4388cf
#define T0_KAOS_RANVAL_68     0x2eca266e
#define T0_KAOS_RANVAL_69     0x3596a95d
#define T0_KAOS_RANVAL_6a     0xa553d27f
#define T0_KAOS_RANVAL_6b     0x18dde4dd
#define T0_KAOS_RANVAL_6c     0x65818316
#define T0_KAOS_RANVAL_6d     0x1d377ecc
#define T0_KAOS_RANVAL_6e     0xd7a938b6
#define T0_KAOS_RANVAL_6f     0x361186fe
#define T0_KAOS_RANVAL_70     0x6732f5a8
#define T0_KAOS_RANVAL_71     0x8e85a7ca
#define T0_KAOS_RANVAL_72     0x4082b870
#define T0_KAOS_RANVAL_73     0xd3ca9e40
#define T0_KAOS_RANVAL_74     0xebc4beaf
#define T0_KAOS_RANVAL_75     0x238c76be
#define T0_KAOS_RANVAL_76     0x243dbeb7
#define T0_KAOS_RANVAL_77     0xb2f772a1
#define T0_KAOS_RANVAL_78     0x713e635d
#define T0_KAOS_RANVAL_79     0x8c04efe8
#define T0_KAOS_RANVAL_7a     0x468354d7
#define T0_KAOS_RANVAL_7b     0xd14ed9f9
#define T0_KAOS_RANVAL_7c     0x537d4a9c
#define T0_KAOS_RANVAL_7d     0x10cca2ed
#define T0_KAOS_RANVAL_7e     0xa8ff559d
#define T0_KAOS_RANVAL_7f     0x5b0e9716
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
!    icount         4000
!    targetid       NIAGARA:SIM
!    hostid         NIAGARA:5.8
!    areas          1
!    areasize       64
!    areaoffset     5888
!    ncache         0
!    emulate_ncache 1
!    pagesize       8192
!    invsize        0
!    codecount      4005
!    code           669e8000
!    entry          669e8000
!    fsr_exceptions 00000000
!    fsr_roundmode  00000004
!    fsr_mask       c0000fff
!    seed           d2b2ca91e25c
!    va_map         0000000000400000,000000007fffffff
!    pa_cached      0000000000400000,000000007fffffff
!    pa_noncached   000001ff00000000,000001ff7fffffff
!    weights        /import/n2-aus-localdir1/ntran/n2cdmspp/verif/diag/assembly/kaos/weights_files/allv9_n2.w
!    begcount       0
!    endcount       4000
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

KTEXT_MODULE(t0_module_ktbl, 0x669e8000)
.seg "text"
	KGLOBAL(t0_ktbl)
t0_ktbl_page_begin:
.global t0_kref; t0_kref:
	.skip 0
t0_ktbl:
	.word	0x9685b697	! t0_kref+0x0:   	addcc	%l6, -0x969, %o3
	.word	0x81834000	! t0_kref+0x4:   	wr	%o5, %g0, %y
	.word	0x39480005	! t0_kref+0x8:   	fbuge,a,pt	%fcc0, _kref+0x1c
	.word	0x94c50013	! t0_kref+0xc:   	addccc	%l4, %l3, %o2
	.word	0xb3b44ea0	! t0_kref+0x10:   	fsrc1s	%f17, %f25
	.word	0x96bd4009	! t0_kref+0x14:   	xnorcc	%l5, %o1, %o3
	.word	0x26800007	! t0_kref+0x18:   	bl,a	_kref+0x34
	.word	0xb9b34d60	! t0_kref+0x1c:   	fnot1s	%f13, %f28
	.word	0x9a656bbd	! t0_kref+0x20:   	subc	%l5, 0xbbd, %o5
	.word	0x90bdc016	! t0_kref+0x24:   	xnorcc	%l7, %l6, %o0
	.word	0xf4266014	! t0_kref+0x28:   	st	%i2, [%i1 + 0x14]
	.word	0x905b0014	! t0_kref+0x2c:   	smul	%o4, %l4, %o0
	.word	0x32480007	! t0_kref+0x30:   	bne,a,pt	%icc, _kref+0x4c
	.word	0xd84e7ffc	! t0_kref+0x34:   	ldsb	[%i1 - 4], %o4
	.word	0x80646962	! t0_kref+0x38:   	subc	%l1, 0x962, %g0
	.word	0xe8263ffc	! t0_kref+0x3c:   	st	%l4, [%i0 - 4]
	.word	0x83a00538	! t0_kref+0x40:   	fsqrts	%f24, %f1
	.word	0x95a00558	! t0_kref+0x44:   	fsqrtd	%f24, %f10
	.word	0x21480007	! t0_kref+0x48:   	fbn,a,pt	%fcc0, _kref+0x64
	.word	0x97408000	! t0_kref+0x4c:   	mov	%ccr, %o3
	.word	0x3b800002	! t0_kref+0x50:   	fble,a	_kref+0x58
	.word	0x908b0010	! t0_kref+0x54:   	andcc	%o4, %l0, %o0
	.word	0x9bb2c30a	! t0_kref+0x58:   	alignaddr	%o3, %o2, %o5
	.word	0xd60e7ffd	! t0_kref+0x5c:   	ldub	[%i1 - 3], %o3
	.word	0x81850000	! t0_kref+0x60:   	wr	%l4, %g0, %y
	.word	0x80b34010	! t0_kref+0x64:   	orncc	%o5, %l0, %g0
	.word	0xec3e7fe0	! t0_kref+0x68:   	std	%l6, [%i1 - 0x20]
	.word	0xe9e6500b	! t0_kref+0x6c:   	casa	[%i1]0x80, %o3, %l4
	.word	0xe8ee101a	! t0_kref+0x70:   	ldstuba	[%i0 + %i2]0x80, %l4
	.word	0x34480002	! t0_kref+0x74:   	bg,a,pt	%icc, _kref+0x7c
	.word	0xa5a00550	! t0_kref+0x78:   	fsqrtd	%f16, %f18
	.word	0x9f25bcf6	! t0_kref+0x7c:   	mulscc	%l6, -0x30a, %o7
	.word	0x9bb30033	! t0_kref+0x80:   	edge8n	%o4, %l3, %o5
	.word	0x80a5c010	! t0_kref+0x84:   	cmp	%l7, %l0
	.word	0x2e480008	! t0_kref+0x88:   	bvs,a,pt	%icc, _kref+0xa8
	.word	0xa1a549ac	! t0_kref+0x8c:   	fdivs	%f21, %f12, %f16
	.word	0x94828017	! t0_kref+0x90:   	addcc	%o2, %l7, %o2
	.word	0x38800005	! t0_kref+0x94:   	bgu,a	_kref+0xa8
	.word	0xdd063fe8	! t0_kref+0x98:   	ld	[%i0 - 0x18], %f14
	.word	0x9484ad10	! t0_kref+0x9c:   	addcc	%l2, 0xd10, %o2
	.word	0x95b5c055	! t0_kref+0xa0:   	edge8l	%l7, %l5, %o2
	.word	0x94bc4000	! t0_kref+0xa4:   	xnorcc	%l1, %g0, %o2
	.word	0xa1a018d6	! t0_kref+0xa8:   	fdtos	%f22, %f16
	.word	0xadb28e80	! t0_kref+0xac:   	fsrc1	%f10, %f22
	.word	0xc368a081	! t0_kref+0xb0:   	prefetch	%g2 + 0x81, 1
	.word	0xc031401b	! t0_kref+0xb4:   	clrh	[%g5 + %i3]
	.word	0x21800005	! t0_kref+0xb8:   	fbn,a	_kref+0xcc
	.word	0x81840000	! t0_kref+0xbc:   	wr	%l0, %g0, %y
	.word	0xd80e8019	! t0_kref+0xc0:   	ldub	[%i2 + %i1], %o4
	.word	0xafb48097	! t0_kref+0xc4:   	edge16	%l2, %l7, %l7
	.word	0x2e480007	! t0_kref+0xc8:   	bvs,a,pt	%icc, _kref+0xe4
	.word	0xf4267ff8	! t0_kref+0xcc:   	st	%i2, [%i1 - 8]
	.word	0xf1be188d	! t0_kref+0xd0:   	stda	%f24, [%i0 + %o5]0xc4
	.word	0xa5b00cc6	! t0_kref+0xd4:   	fnot2	%f6, %f18
	.word	0x36480006	! t0_kref+0xd8:   	bge,a,pt	%icc, _kref+0xf0
	.word	0xe968a04f	! t0_kref+0xdc:   	prefetch	%g2 + 0x4f, 20
	.word	0x9efb4010	! t0_kref+0xe0:   	sdivcc	%o5, %l0, %o7
	.word	0x8143e012	! t0_kref+0xe4:   	membar	0x12
	.word	0x36800004	! t0_kref+0xe8:   	bge,a	_kref+0xf8
	.word	0xa7a449a5	! t0_kref+0xec:   	fdivs	%f17, %f5, %f19
	.word	0x2a800001	! t0_kref+0xf0:   	bcs,a	_kref+0xf4
	.word	0xa1b007a4	! t0_kref+0xf4:   	fpackfix	%f4, %f16
	.word	0xa5b686dc	! t0_kref+0xf8:   	fmul8sux16	%f26, %f28, %f18
	.word	0xd6861000	! t0_kref+0xfc:   	lda	[%i0]0x80, %o3
	.word	0xae2d4013	! t0_kref+0x100:   	andn	%l5, %l3, %l7
	.word	0xb1b406b8	! t0_kref+0x104:   	fmul8x16al	%f16, %f24, %f24
	.word	0x95b20312	! t0_kref+0x108:   	alignaddr	%o0, %l2, %o2
	.word	0xeb6e3fe8	! t0_kref+0x10c:   	prefetch	%i0 - 0x18, 21
	.word	0x3d800003	! t0_kref+0x110:   	fbule,a	_kref+0x11c
	.word	0x9a9a8015	! t0_kref+0x114:   	xorcc	%o2, %l5, %o5
	.word	0x905c8010	! t0_kref+0x118:   	smul	%l2, %l0, %o0
	.word	0x909d800c	! t0_kref+0x11c:   	xorcc	%l6, %o4, %o0
	.word	0xf007bfe0	! t0_kref+0x120:   	ld	[%fp - 0x20], %i0
	.word	0x9bb3055a	! t0_kref+0x124:   	fcmpeq16	%f12, %f26, %o5
	.word	0x2b480005	! t0_kref+0x128:   	fbug,a,pt	%fcc0, _kref+0x13c
	.word	0x95b680b0	! t0_kref+0x12c:   	edge16n	%i2, %l0, %o2
	.word	0x22800006	! t0_kref+0x130:   	be,a	_kref+0x148
	.word	0xc7267ff4	! t0_kref+0x134:   	st	%f3, [%i1 - 0xc]
	.word	0x36480003	! t0_kref+0x138:   	bge,a,pt	%icc, _kref+0x144
	.word	0x9e2d8011	! t0_kref+0x13c:   	andn	%l6, %l1, %o7
	.word	0xb5a00130	! t0_kref+0x140:   	fabss	%f16, %f26
	.word	0x91702a5d	! t0_kref+0x144:   	popc	0xa5d, %o0
	.word	0xa5a00542	! t0_kref+0x148:   	fsqrtd	%f2, %f18
	.word	0x9e282ad3	! t0_kref+0x14c:   	andn	%g0, 0xad3, %o7
	.word	0x9eb4f736	! t0_kref+0x150:   	orncc	%l3, -0x8ca, %o7
	.word	0xd228a03f	! t0_kref+0x154:   	stb	%o1, [%g2 + 0x3f]
	.word	0xdbe61016	! t0_kref+0x158:   	casa	[%i0]0x80, %l6, %o5
	.word	0xd250a022	! t0_kref+0x15c:   	ldsh	[%g2 + 0x22], %o1
	.word	0xc807bfe4	! t0_kref+0x160:   	ld	[%fp - 0x1c], %g4
	.word	0x907c7eed	! t0_kref+0x164:   	sdiv	%l1, -0x113, %o0
	.word	0x9f2ce010	! t0_kref+0x168:   	sll	%l3, 0x10, %o7
	.word	0xb9a589c8	! t0_kref+0x16c:   	fdivd	%f22, %f8, %f28
	.word	0x37800008	! t0_kref+0x170:   	fbge,a	_kref+0x190
	.word	0x9472800c	! t0_kref+0x174:   	udiv	%o2, %o4, %o2
	.word	0xb5b00f27	! t0_kref+0x178:   	fsrc2s	%f7, %f26
	.word	0xd8166012	! t0_kref+0x17c:   	lduh	[%i1 + 0x12], %o4
	.word	0xec767ff0	! t0_kref+0x180:   	stx	%l6, [%i1 - 0x10]
	.word	0x94b28000	! t0_kref+0x184:   	orncc	%o2, %g0, %o2
	.word	0x90da8013	! t0_kref+0x188:   	smulcc	%o2, %l3, %o0
	.word	0x81de800a	! t0_kref+0x18c:   	flush	%i2 + %o2
	.word	0xa7a01a58	! t0_kref+0x190:   	fdtoi	%f24, %f19
	.word	0x9ae22e92	! t0_kref+0x194:   	subccc	%o0, 0xe92, %o5
	.word	0x9916b4bd	! t0_kref+0x198:   	taddcctv	%i2, -0xb43, %o4
	.word	0x9ebd400d	! t0_kref+0x19c:   	xnorcc	%l5, %o5, %o7
	.word	0x9294400a	! t0_kref+0x1a0:   	orcc	%l1, %o2, %o1
	.word	0xf42e2006	! t0_kref+0x1a4:   	stb	%i2, [%i0 + 6]
	.word	0x80132baa	! t0_kref+0x1a8:   	or	%o4, 0xbaa, %g0
	.word	0x3c480005	! t0_kref+0x1ac:   	bpos,a,pt	%icc, _kref+0x1c0
	.word	0xd47e001c	! t0_kref+0x1b0:   	swap	[%i0 + %i4], %o2
	.word	0x81df801b	! t0_kref+0x1b4:   	flush	%fp + %i3
	.word	0xb9a01922	! t0_kref+0x1b8:   	fstod	%f2, %f28
	.word	0xec1e3ff8	! t0_kref+0x1bc:   	ldd	[%i0 - 8], %l6
	.word	0x81ae0a46	! t0_kref+0x1c0:   	fcmpd	%fcc0, %f24, %f6
	.word	0xcd1fbd00	! t0_kref+0x1c4:   	ldd	[%fp - 0x300], %f6
	.word	0xd428a03d	! t0_kref+0x1c8:   	stb	%o2, [%g2 + 0x3d]
	.word	0xa7a3c927	! t0_kref+0x1cc:   	fmuls	%f15, %f7, %f19
	.word	0xecae9019	! t0_kref+0x1d0:   	stba	%l6, [%i2 + %i1]0x80
	.word	0x1b29cf79	! t0_kref+0x1d4:   	sethi	%hi(0xa73de400), %o5
	.word	0x3b480006	! t0_kref+0x1d8:   	fble,a,pt	%fcc0, _kref+0x1f0
	.word	0xd0266014	! t0_kref+0x1dc:   	st	%o0, [%i1 + 0x14]
	.word	0xe53f4019	! t0_kref+0x1e0:   	std	%f18, [%i5 + %i1]
	.word	0xa1a388a3	! t0_kref+0x1e4:   	fsubs	%f14, %f3, %f16
	.word	0xf11fbd58	! t0_kref+0x1e8:   	ldd	[%fp - 0x2a8], %f24
	.word	0xb1b40c4c	! t0_kref+0x1ec:   	fnor	%f16, %f12, %f24
	.word	0x170a975a	! t0_kref+0x1f0:   	sethi	%hi(0x2a5d6800), %o3
	.word	0xa5b4463a	! t0_kref+0x1f4:   	fmul8x16	%f17, %f26, %f18
	.word	0x9ba2c9b8	! t0_kref+0x1f8:   	fdivs	%f11, %f24, %f13
	.word	0x97a00128	! t0_kref+0x1fc:   	fabss	%f8, %f11
	.word	0xae12c010	! t0_kref+0x200:   	or	%o3, %l0, %l7
	.word	0x9b2ca005	! t0_kref+0x204:   	sll	%l2, 0x5, %o5
	.word	0x951aec95	! t0_kref+0x208:   	tsubcctv	%o3, 0xc95, %o2
	.word	0xf207bfe0	! t0_kref+0x20c:   	ld	[%fp - 0x20], %i1
	.word	0x3a480008	! t0_kref+0x210:   	bcc,a,pt	%icc, _kref+0x230
	.word	0x81844000	! t0_kref+0x214:   	wr	%l1, %g0, %y
	.word	0xd8ae1000	! t0_kref+0x218:   	stba	%o4, [%i0]0x80
	.word	0xb1a0192e	! t0_kref+0x21c:   	fstod	%f14, %f24
	.word	0xd428a02e	! t0_kref+0x220:   	stb	%o2, [%g2 + 0x2e]
	.word	0xd8263ffc	! t0_kref+0x224:   	st	%o4, [%i0 - 4]
	.word	0x85a0052a	! t0_kref+0x228:   	fsqrts	%f10, %f2
	.word	0xb9b18f77	! t0_kref+0x22c:   	fornot1s	%f6, %f23, %f28
	.word	0x93b00c20	! t0_kref+0x230:   	fzeros	%f9
	.word	0xeb68a084	! t0_kref+0x234:   	prefetch	%g2 + 0x84, 21
	.word	0x33480003	! t0_kref+0x238:   	fbe,a,pt	%fcc0, _kref+0x244
	.word	0xe3f6500a	! t0_kref+0x23c:   	casxa	[%i1]0x80, %o2, %l1
	call	SYM(t0_subr0)
	.word	0x91b74a2d	! t0_kref+0x244:   	fpadd16s	%f29, %f13, %f8
	.word	0x92d50000	! t0_kref+0x248:   	umulcc	%l4, %g0, %o1
	.word	0x2f480003	! t0_kref+0x24c:   	fbu,a,pt	%fcc0, _kref+0x258
	.word	0xc216c000	! t0_kref+0x250:   	lduh	[%i3], %g1
	.word	0x9eda2107	! t0_kref+0x254:   	smulcc	%o0, 0x107, %o7
	.word	0x36480006	! t0_kref+0x258:   	bge,a,pt	%icc, _kref+0x270
	.word	0x809b0017	! t0_kref+0x25c:   	xorcc	%o4, %l7, %g0
	.word	0xb7a01a25	! t0_kref+0x260:   	fstoi	%f5, %f27
	.word	0x81b4040a	! t0_kref+0x264:   	fcmple16	%f16, %f10, %g0
	.word	0x21480001	! t0_kref+0x268:   	fbn,a,pt	%fcc0, _kref+0x26c
	.word	0xe8180018	! t0_kref+0x26c:   	ldd	[%g0 + %i0], %l4
	.word	0xf91fbe50	! t0_kref+0x270:   	ldd	[%fp - 0x1b0], %f28
	.word	0xb5a01a2e	! t0_kref+0x274:   	fstoi	%f14, %f26
	.word	0x9ba00121	! t0_kref+0x278:   	fabss	%f1, %f13
	.word	0xd630a028	! t0_kref+0x27c:   	sth	%o3, [%g2 + 0x28]
	.word	0xaed28014	! t0_kref+0x280:   	umulcc	%o2, %l4, %l7
	.word	0x110f5dfa	! t0_kref+0x284:   	sethi	%hi(0x3d77e800), %o0
	.word	0x952ea018	! t0_kref+0x288:   	sll	%i2, 0x18, %o2
	.word	0xb5a00540	! t0_kref+0x28c:   	fsqrtd	%f0, %f26
	.word	0x98644014	! t0_kref+0x290:   	subc	%l1, %l4, %o4
	.word	0xb5b30ae1	! t0_kref+0x294:   	fpsub32s	%f12, %f1, %f26
	.word	0xe4267fe4	! t0_kref+0x298:   	st	%l2, [%i1 - 0x1c]
	.word	0x81334009	! t0_kref+0x29c:   	srl	%o5, %o1, %g0
	.word	0x93a000ac	! t0_kref+0x2a0:   	fnegs	%f12, %f9
	.word	0x31800008	! t0_kref+0x2a4:   	fba,a	_kref+0x2c4
	.word	0x9da0012e	! t0_kref+0x2a8:   	fabss	%f14, %f14
	.word	0x36480001	! t0_kref+0x2ac:   	bge,a,pt	%icc, _kref+0x2b0
	.word	0xe86e001a	! t0_kref+0x2b0:   	ldstub	[%i0 + %i2], %l4
	.word	0x99b40444	! t0_kref+0x2b4:   	fcmpne16	%f16, %f4, %o4
	.word	0x81580000	! t0_kref+0x2b8:   	flushw
	.word	0x9fa4c934	! t0_kref+0x2bc:   	fmuls	%f19, %f20, %f15
	.word	0xec28a02a	! t0_kref+0x2c0:   	stb	%l6, [%g2 + 0x2a]
	.word	0xb1a00944	! t0_kref+0x2c4:   	fmuld	%f0, %f4, %f24
	.word	0x93b680d1	! t0_kref+0x2c8:   	edge16l	%i2, %l1, %o1
	.word	0xd6062010	! t0_kref+0x2cc:   	ld	[%i0 + 0x10], %o3
	.word	0x81a0191c	! t0_kref+0x2d0:   	fitod	%f28, %f0
	.word	0x948d6aab	! t0_kref+0x2d4:   	andcc	%l5, 0xaab, %o2
	call	SYM(t0_subr2)
	.word	0x80168000	! t0_kref+0x2dc:   	or	%i2, %g0, %g0
	.word	0x9a7c387c	! t0_kref+0x2e0:   	sdiv	%l0, -0x784, %o5
	.word	0x9da0192c	! t0_kref+0x2e4:   	fstod	%f12, %f14
	.word	0xb5a3c938	! t0_kref+0x2e8:   	fmuls	%f15, %f24, %f26
	.word	0x91a0054c	! t0_kref+0x2ec:   	fsqrtd	%f12, %f8
	.word	0x3b480008	! t0_kref+0x2f0:   	fble,a,pt	%fcc0, _kref+0x310
	.word	0xd82e6015	! t0_kref+0x2f4:   	stb	%o4, [%i1 + 0x15]
	.word	0x973ae010	! t0_kref+0x2f8:   	sra	%o3, 0x10, %o3
	.word	0xc19f5019	! t0_kref+0x2fc:   	ldda	[%i5 + %i1]0x80, %f0
	.word	0xee30a028	! t0_kref+0x300:   	sth	%l7, [%g2 + 0x28]
	.word	0xaec5e5d7	! t0_kref+0x304:   	addccc	%l7, 0x5d7, %l7
	.word	0xeab6101b	! t0_kref+0x308:   	stha	%l5, [%i0 + %i3]0x80
	.word	0x26480008	! t0_kref+0x30c:   	bl,a,pt	%icc, _kref+0x32c
	.word	0x8da109d4	! t0_kref+0x310:   	fdivd	%f4, %f20, %f6
	.word	0x3c800001	! t0_kref+0x314:   	bpos,a	_kref+0x318
	.word	0xd91e3fe8	! t0_kref+0x318:   	ldd	[%i0 - 0x18], %f12
	.word	0x81858000	! t0_kref+0x31c:   	wr	%l6, %g0, %y
	call	SYM(t0_subr0)
	.word	0xcf063fe8	! t0_kref+0x324:   	ld	[%i0 - 0x18], %f7
	.word	0x91a0012c	! t0_kref+0x328:   	fabss	%f12, %f8
	.word	0xd62e7fe1	! t0_kref+0x32c:   	stb	%o3, [%i1 - 0x1f]
	.word	0x81de401b	! t0_kref+0x330:   	flush	%i1 + %i3
	.word	0xae15800b	! t0_kref+0x334:   	or	%l6, %o3, %l7
	.word	0x95408000	! t0_kref+0x338:   	mov	%ccr, %o2
	.word	0x89b40af5	! t0_kref+0x33c:   	fpsub32s	%f16, %f21, %f4
	.word	0x29800008	! t0_kref+0x340:   	fbl,a	_kref+0x360
	.word	0x92dc800d	! t0_kref+0x344:   	smulcc	%l2, %o5, %o1
	.word	0x83b5caf6	! t0_kref+0x348:   	fpsub32s	%f23, %f22, %f1
	.word	0x81ddb4e8	! t0_kref+0x34c:   	flush	%l6 - 0xb18
	.word	0xed06001c	! t0_kref+0x350:   	ld	[%i0 + %i4], %f22
	.word	0x801d0008	! t0_kref+0x354:   	xor	%l4, %o0, %g0
	.word	0xa1a01929	! t0_kref+0x358:   	fstod	%f9, %f16
	.word	0x81a84a27	! t0_kref+0x35c:   	fcmps	%fcc0, %f1, %f7
	.word	0x93a249bb	! t0_kref+0x360:   	fdivs	%f9, %f27, %f9
	.word	0x8143e040	! t0_kref+0x364:   	membar	0x40
	.word	0x35480004	! t0_kref+0x368:   	fbue,a,pt	%fcc0, _kref+0x378
	.word	0xaeac0014	! t0_kref+0x36c:   	andncc	%l0, %l4, %l7
	.word	0xc04e8018	! t0_kref+0x370:   	ldsb	[%i2 + %i0], %g0
	.word	0x95a28848	! t0_kref+0x374:   	faddd	%f10, %f8, %f10
	.word	0x9e9cc017	! t0_kref+0x378:   	xorcc	%l3, %l7, %o7
	.word	0xe078a020	! t0_kref+0x37c:   	swap	[%g2 + 0x20], %l0
	.word	0xec6e3fec	! t0_kref+0x380:   	ldstub	[%i0 - 0x14], %l6
	.word	0xb7a000a9	! t0_kref+0x384:   	fnegs	%f9, %f27
	.word	0x813c8011	! t0_kref+0x388:   	sra	%l2, %l1, %g0
	.word	0x36480001	! t0_kref+0x38c:   	bge,a,pt	%icc, _kref+0x390
	.word	0xd8ee9018	! t0_kref+0x390:   	ldstuba	[%i2 + %i0]0x80, %o4
	.word	0x1b025f74	! t0_kref+0x394:   	sethi	%hi(0x97dd000), %o5
	.word	0xe4380019	! t0_kref+0x398:   	std	%l2, [%g0 + %i1]
	.word	0x932da006	! t0_kref+0x39c:   	sll	%l6, 0x6, %o1
	.word	0x85b40c92	! t0_kref+0x3a0:   	fandnot2	%f16, %f18, %f2
	.word	0xa9b186bb	! t0_kref+0x3a4:   	fmul8x16al	%f6, %f27, %f20
	.word	0xbba000ba	! t0_kref+0x3a8:   	fnegs	%f26, %f29
	.word	0xd83e4000	! t0_kref+0x3ac:   	std	%o4, [%i1]
	.word	0x170f675b	! t0_kref+0x3b0:   	sethi	%hi(0x3d9d6c00), %o3
	.word	0x941b78dd	! t0_kref+0x3b4:   	xor	%o5, -0x723, %o2
	call	SYM(t0_subr1)
	.word	0xe428a00f	! t0_kref+0x3bc:   	stb	%l2, [%g2 + 0xf]
	.word	0xe11fbca8	! t0_kref+0x3c0:   	ldd	[%fp - 0x358], %f16
	.word	0x91a01919	! t0_kref+0x3c4:   	fitod	%f25, %f8
	.word	0x21800004	! t0_kref+0x3c8:   	fbn,a	_kref+0x3d8
	.word	0x81848000	! t0_kref+0x3cc:   	wr	%l2, %g0, %y
	.word	0x81de800c	! t0_kref+0x3d0:   	flush	%i2 + %o4
	.word	0xf430a026	! t0_kref+0x3d4:   	sth	%i2, [%g2 + 0x26]
	.word	0xdec81018	! t0_kref+0x3d8:   	ldsba	[%g0 + %i0]0x80, %o7
	.word	0xe2280018	! t0_kref+0x3dc:   	stb	%l1, [%g0 + %i0]
	.word	0x92342ad1	! t0_kref+0x3e0:   	orn	%l0, 0xad1, %o1
	.word	0x93258013	! t0_kref+0x3e4:   	mulscc	%l6, %l3, %o1
	.word	0x969a400a	! t0_kref+0x3e8:   	xorcc	%o1, %o2, %o3
	.word	0xda480019	! t0_kref+0x3ec:   	ldsb	[%g0 + %i1], %o5
	.word	0x8184c000	! t0_kref+0x3f0:   	wr	%l3, %g0, %y
	.word	0x89a01929	! t0_kref+0x3f4:   	fstod	%f9, %f4
	.word	0xc168a04f	! t0_kref+0x3f8:   	prefetch	%g2 + 0x4f, 0
	.word	0xd42e2002	! t0_kref+0x3fc:   	stb	%o2, [%i0 + 2]
	.word	0x8da0103a	! t0_kref+0x400:   	fstox	%f26, %f6
	.word	0x30480001	! t0_kref+0x404:   	ba,a,pt	%icc, _kref+0x408
	.word	0xfd6e001b	! t0_kref+0x408:   	prefetch	%i0 + %i3, 30
	.word	0xfb6e001c	! t0_kref+0x40c:   	prefetch	%i0 + %i4, 29
	.word	0xcd1fbea0	! t0_kref+0x410:   	ldd	[%fp - 0x160], %f6
	.word	0x81db4016	! t0_kref+0x414:   	flush	%o5 + %l6
	.word	0x31480008	! t0_kref+0x418:   	fba,a,pt	%fcc0, _kref+0x438
	.word	0x95a50858	! t0_kref+0x41c:   	faddd	%f20, %f24, %f10
	.word	0x99a0191d	! t0_kref+0x420:   	fitod	%f29, %f12
	.word	0x3d480001	! t0_kref+0x424:   	fbule,a,pt	%fcc0, _kref+0x428
	.word	0xd42e2015	! t0_kref+0x428:   	stb	%o2, [%i0 + 0x15]
	.word	0x97268009	! t0_kref+0x42c:   	mulscc	%i2, %o1, %o3
	.word	0x9fa000a6	! t0_kref+0x430:   	fnegs	%f6, %f15
	.word	0xe9be1814	! t0_kref+0x434:   	stda	%f20, [%i0 + %l4]0xc0
	.word	0xd4366004	! t0_kref+0x438:   	sth	%o2, [%i1 + 4]
	.word	0x9bb084d8	! t0_kref+0x43c:   	fcmpne32	%f2, %f24, %o5
	.word	0xb9b70ae3	! t0_kref+0x440:   	fpsub32s	%f28, %f3, %f28
	.word	0x9da28854	! t0_kref+0x444:   	faddd	%f10, %f20, %f14
	.word	0x949ac009	! t0_kref+0x448:   	xorcc	%o3, %o1, %o2
	.word	0x27480003	! t0_kref+0x44c:   	fbul,a,pt	%fcc0, _kref+0x458
	.word	0x81b01020	! t0_kref+0x450:   	siam	0x0
	.word	0xb1a00031	! t0_kref+0x454:   	fmovs	%f17, %f24
	.word	0x33800007	! t0_kref+0x458:   	fbe,a	_kref+0x474
	.word	0x94630011	! t0_kref+0x45c:   	subc	%o4, %l1, %o2
	.word	0x9eac0012	! t0_kref+0x460:   	andncc	%l0, %l2, %o7
	.word	0x99a01a4e	! t0_kref+0x464:   	fdtoi	%f14, %f12
	.word	0x9da149aa	! t0_kref+0x468:   	fdivs	%f5, %f10, %f14
	.word	0xa9a018c4	! t0_kref+0x46c:   	fdtos	%f4, %f20
	.word	0x26800005	! t0_kref+0x470:   	bl,a	_kref+0x484
	.word	0x969cec2c	! t0_kref+0x474:   	xorcc	%l3, 0xc2c, %o3
	.word	0x907ebd38	! t0_kref+0x478:   	sdiv	%i2, -0x2c8, %o0
	.word	0x81ad8a58	! t0_kref+0x47c:   	fcmpd	%fcc0, %f22, %f24
	.word	0xf430a026	! t0_kref+0x480:   	sth	%i2, [%g2 + 0x26]
	.word	0x26480004	! t0_kref+0x484:   	bl,a,pt	%icc, _kref+0x494
	.word	0x9fa20932	! t0_kref+0x488:   	fmuls	%f8, %f18, %f15
	.word	0x3b480003	! t0_kref+0x48c:   	fble,a,pt	%fcc0, _kref+0x498
	.word	0x94054009	! t0_kref+0x490:   	add	%l5, %o1, %o2
	.word	0x92fc800d	! t0_kref+0x494:   	sdivcc	%l2, %o5, %o1
	.word	0xaeda4014	! t0_kref+0x498:   	smulcc	%o1, %l4, %l7
	.word	0xada01937	! t0_kref+0x49c:   	fstod	%f23, %f22
	.word	0xee4e6002	! t0_kref+0x4a0:   	ldsb	[%i1 + 2], %l7
	.word	0x9a5cc009	! t0_kref+0x4a4:   	smul	%l3, %o1, %o5
	.word	0xe1beda19	! t0_kref+0x4a8:   	stda	%f16, [%i3 + %i1]0xd0
	.word	0xb9a01922	! t0_kref+0x4ac:   	fstod	%f2, %f28
	.word	0x31480005	! t0_kref+0x4b0:   	fba,a,pt	%fcc0, _kref+0x4c4
	.word	0xec762008	! t0_kref+0x4b4:   	stx	%l6, [%i0 + 8]
	.word	0x93a01a54	! t0_kref+0x4b8:   	fdtoi	%f20, %f9
	.word	0x9fc10000	! t0_kref+0x4bc:   	call	%g4
	.word	0xadb70752	! t0_kref+0x4c0:   	fpack32	%f28, %f18, %f22
	.word	0x96c4000d	! t0_kref+0x4c4:   	addccc	%l0, %o5, %o3
	.word	0x9e324013	! t0_kref+0x4c8:   	orn	%o1, %l3, %o7
	.word	0x3f480001	! t0_kref+0x4cc:   	fbo,a,pt	%fcc0, _kref+0x4d0
	.word	0x81848000	! t0_kref+0x4d0:   	wr	%l2, %g0, %y
	.word	0x97b00cfc	! t0_kref+0x4d4:   	fnot2s	%f28, %f11
	.word	0x948a800a	! t0_kref+0x4d8:   	andcc	%o2, %o2, %o2
	.word	0x9a0dae1e	! t0_kref+0x4dc:   	and	%l6, 0xe1e, %o5
	.word	0xcd063ff4	! t0_kref+0x4e0:   	ld	[%i0 - 0xc], %f6
	.word	0x8da00554	! t0_kref+0x4e4:   	fsqrtd	%f20, %f6
	.word	0xda28a00a	! t0_kref+0x4e8:   	stb	%o5, [%g2 + 0xa]
	.word	0x97700009	! t0_kref+0x4ec:   	popc	%o1, %o3
	.word	0x90fcbcad	! t0_kref+0x4f0:   	sdivcc	%l2, -0x353, %o0
	.word	0xe27e7fec	! t0_kref+0x4f4:   	swap	[%i1 - 0x14], %l1
	.word	0x8fa5883a	! t0_kref+0x4f8:   	fadds	%f22, %f26, %f7
	.word	0x908c4016	! t0_kref+0x4fc:   	andcc	%l1, %l6, %o0
	.word	0x96dd2294	! t0_kref+0x500:   	smulcc	%l4, 0x294, %o3
	.word	0xe0680019	! t0_kref+0x504:   	ldstub	[%g0 + %i1], %l0
	.word	0x96dd4009	! t0_kref+0x508:   	smulcc	%l5, %o1, %o3
	.word	0xb9a000a5	! t0_kref+0x50c:   	fnegs	%f5, %f28
	.word	0x85a289d2	! t0_kref+0x510:   	fdivd	%f10, %f18, %f2
	.word	0xe626001c	! t0_kref+0x514:   	st	%l3, [%i0 + %i4]
	.word	0xd030a002	! t0_kref+0x518:   	sth	%o0, [%g2 + 2]
	.word	0xa5b70f46	! t0_kref+0x51c:   	fornot1	%f28, %f6, %f18
	.word	0x9fc00004	! t0_kref+0x520:   	call	%g0 + %g4
	.word	0xda28a009	! t0_kref+0x524:   	stb	%o5, [%g2 + 9]
	.word	0xa1a01903	! t0_kref+0x528:   	fitod	%f3, %f16
	.word	0x2e800002	! t0_kref+0x52c:   	bvs,a	_kref+0x534
	.word	0x99b70408	! t0_kref+0x530:   	fcmple16	%f28, %f8, %o4
	.word	0xe6266008	! t0_kref+0x534:   	st	%l3, [%i1 + 8]
	.word	0x99358016	! t0_kref+0x538:   	srl	%l6, %l6, %o4
	.word	0xb1b00ce4	! t0_kref+0x53c:   	fnot2s	%f4, %f24
	.word	0xa5b007ba	! t0_kref+0x540:   	fpackfix	%f26, %f18
	.word	0xe81e7ff0	! t0_kref+0x544:   	ldd	[%i1 - 0x10], %l4
	.word	0xe76e3ff0	! t0_kref+0x548:   	prefetch	%i0 - 0x10, 19
	.word	0x21480007	! t0_kref+0x54c:   	fbn,a,pt	%fcc0, _kref+0x568
	.word	0xe16e7fe8	! t0_kref+0x550:   	prefetch	%i1 - 0x18, 16
	.word	0x9a34c013	! t0_kref+0x554:   	orn	%l3, %l3, %o5
	.word	0x805deb06	! t0_kref+0x558:   	smul	%l7, 0xb06, %g0
	.word	0xb9a018ca	! t0_kref+0x55c:   	fdtos	%f10, %f28
	.word	0x8da00548	! t0_kref+0x560:   	fsqrtd	%f8, %f6
	.word	0xadb48e02	! t0_kref+0x564:   	fand	%f18, %f2, %f22
	.word	0x21480005	! t0_kref+0x568:   	fbn,a,pt	%fcc0, _kref+0x57c
	.word	0xee0e001a	! t0_kref+0x56c:   	ldub	[%i0 + %i2], %l7
	.word	0x2a480007	! t0_kref+0x570:   	bcs,a,pt	%icc, _kref+0x58c
	.word	0xb5a01923	! t0_kref+0x574:   	fstod	%f3, %f26
	.word	0xc7270019	! t0_kref+0x578:   	st	%f3, [%i4 + %i1]
	.word	0x89a1082f	! t0_kref+0x57c:   	fadds	%f4, %f15, %f4
	.word	0x94802790	! t0_kref+0x580:   	addcc	%g0, 0x790, %o2
	.word	0x9a3b6810	! t0_kref+0x584:   	xnor	%o5, 0x810, %o5
	.word	0xda560000	! t0_kref+0x588:   	ldsh	[%i0], %o5
	.word	0xde4e6015	! t0_kref+0x58c:   	ldsb	[%i1 + 0x15], %o7
	.word	0xc51fbda0	! t0_kref+0x590:   	ldd	[%fp - 0x260], %f2
	.word	0x96ddf1b5	! t0_kref+0x594:   	smulcc	%l7, -0xe4b, %o3
	.word	0x87a48922	! t0_kref+0x598:   	fmuls	%f18, %f2, %f3
	.word	0x81dcb94f	! t0_kref+0x59c:   	flush	%l2 - 0x6b1
	.word	0x81b68c52	! t0_kref+0x5a0:   	fnor	%f26, %f18, %f0
	.word	0xc0200019	! t0_kref+0x5a4:   	clr	[%g0 + %i1]
	.word	0xee28a01f	! t0_kref+0x5a8:   	stb	%l7, [%g2 + 0x1f]
	.word	0xc1ee5011	! t0_kref+0x5ac:   	prefetcha	%i1 + %l1, 0
	.word	0xd2263fec	! t0_kref+0x5b0:   	st	%o1, [%i0 - 0x14]
	.word	0xa9a4c826	! t0_kref+0x5b4:   	fadds	%f19, %f6, %f20
	.word	0xc05e3ff8	! t0_kref+0x5b8:   	ldx	[%i0 - 8], %g0
	.word	0x97b10480	! t0_kref+0x5bc:   	fcmple32	%f4, %f0, %o3
	.word	0x90a68009	! t0_kref+0x5c0:   	subcc	%i2, %o1, %o0
	.word	0xd20e2005	! t0_kref+0x5c4:   	ldub	[%i0 + 5], %o1
	.word	0x90db387a	! t0_kref+0x5c8:   	smulcc	%o4, -0x786, %o0
	.word	0x929d7101	! t0_kref+0x5cc:   	xorcc	%l5, -0xeff, %o1
	.word	0x9f400000	! t0_kref+0x5d0:   	mov	%y, %o7
	.word	0x9ba01a28	! t0_kref+0x5d4:   	fstoi	%f8, %f13
	.word	0xa7a708a7	! t0_kref+0x5d8:   	fsubs	%f28, %f7, %f19
	.word	0x8062b66c	! t0_kref+0x5dc:   	subc	%o2, -0x994, %g0
	.word	0xa1a0190f	! t0_kref+0x5e0:   	fitod	%f15, %f16
	.word	0x9884401a	! t0_kref+0x5e4:   	addcc	%l1, %i2, %o4
	.word	0xaba00137	! t0_kref+0x5e8:   	fabss	%f23, %f21
	.word	0x907d8014	! t0_kref+0x5ec:   	sdiv	%l6, %l4, %o0
	.word	0x81a01904	! t0_kref+0x5f0:   	fitod	%f4, %f0
	.word	0x943b400b	! t0_kref+0x5f4:   	xnor	%o5, %o3, %o2
	.word	0x9fa018ce	! t0_kref+0x5f8:   	fdtos	%f14, %f15
	.word	0x89a000b5	! t0_kref+0x5fc:   	fnegs	%f21, %f4
	.word	0x960ac00d	! t0_kref+0x600:   	and	%o3, %o5, %o3
	.word	0xe100a02c	! t0_kref+0x604:   	ld	[%g2 + 0x2c], %f16
	.word	0xe19f5a59	! t0_kref+0x608:   	ldda	[%i5 + %i1]0xd2, %f16
	.word	0x89b10d0c	! t0_kref+0x60c:   	fandnot1	%f4, %f12, %f4
	.word	0xe6e81018	! t0_kref+0x610:   	ldstuba	[%g0 + %i0]0x80, %l3
	.word	0x91b3874a	! t0_kref+0x614:   	fpack32	%f14, %f10, %f8
	.word	0xee30a016	! t0_kref+0x618:   	sth	%l7, [%g2 + 0x16]
	.word	0x3a800005	! t0_kref+0x61c:   	bcc,a	_kref+0x630
	.word	0x91a01921	! t0_kref+0x620:   	fstod	%f1, %f8
	.word	0x8db48c80	! t0_kref+0x624:   	fandnot2	%f18, %f0, %f6
	.word	0x81aeca36	! t0_kref+0x628:   	fcmps	%fcc0, %f27, %f22
	.word	0x95a01a5a	! t0_kref+0x62c:   	fdtoi	%f26, %f10
	.word	0x9bb1848e	! t0_kref+0x630:   	fcmple32	%f6, %f14, %o5
	.word	0xc04e601f	! t0_kref+0x634:   	ldsb	[%i1 + 0x1f], %g0
	.word	0x99a0192d	! t0_kref+0x638:   	fstod	%f13, %f12
	.word	0x81b01025	! t0_kref+0x63c:   	siam	0x5
	.word	0xa5a70858	! t0_kref+0x640:   	faddd	%f28, %f24, %f18
	.word	0x8da0012e	! t0_kref+0x644:   	fabss	%f14, %f6
	.word	0xb9a00535	! t0_kref+0x648:   	fsqrts	%f21, %f28
	.word	0x2f800003	! t0_kref+0x64c:   	fbu,a	_kref+0x658
	.word	0x92b5400a	! t0_kref+0x650:   	orncc	%l5, %o2, %o1
	.word	0x81348009	! t0_kref+0x654:   	srl	%l2, %o1, %g0
	.word	0x91418000	! t0_kref+0x658:   	mov	%fprs, %o0
	.word	0xd4266004	! t0_kref+0x65c:   	st	%o2, [%i1 + 4]
	.word	0x905b0010	! t0_kref+0x660:   	smul	%o4, %l0, %o0
	.word	0xa1a189c0	! t0_kref+0x664:   	fdivd	%f6, %f0, %f16
	.word	0x9722400c	! t0_kref+0x668:   	mulscc	%o1, %o4, %o3
	.word	0xc768a088	! t0_kref+0x66c:   	prefetch	%g2 + 0x88, 3
	.word	0x945c401a	! t0_kref+0x670:   	smul	%l1, %i2, %o2
	.word	0x97a01a46	! t0_kref+0x674:   	fdtoi	%f6, %f11
	.word	0x29480008	! t0_kref+0x678:   	fbl,a,pt	%fcc0, _kref+0x698
	.word	0x91a089ca	! t0_kref+0x67c:   	fdivd	%f2, %f10, %f8
	.word	0xf91fbe90	! t0_kref+0x680:   	ldd	[%fp - 0x170], %f28
	.word	0x28800001	! t0_kref+0x684:   	bleu,a	_kref+0x688
	.word	0x9e748009	! t0_kref+0x688:   	udiv	%l2, %o1, %o7
	.word	0xae84342a	! t0_kref+0x68c:   	addcc	%l0, -0xbd6, %l7
	.word	0x87a00138	! t0_kref+0x690:   	fabss	%f24, %f3
	.word	0x3c480002	! t0_kref+0x694:   	bpos,a,pt	%icc, _kref+0x69c
	.word	0x980ca3c6	! t0_kref+0x698:   	and	%l2, 0x3c6, %o4
	.word	0x95b08e54	! t0_kref+0x69c:   	fxnor	%f2, %f20, %f10
	.word	0xd00e401a	! t0_kref+0x6a0:   	ldub	[%i1 + %i2], %o0
	.word	0x90da800b	! t0_kref+0x6a4:   	smulcc	%o2, %o3, %o0
	.word	0x8143e067	! t0_kref+0x6a8:   	membar	0x67
	.word	0x80dac016	! t0_kref+0x6ac:   	smulcc	%o3, %l6, %g0
	.word	0xe3063ff4	! t0_kref+0x6b0:   	ld	[%i0 - 0xc], %f17
	.word	0x91408000	! t0_kref+0x6b4:   	mov	%ccr, %o0
	.word	0xae5af70b	! t0_kref+0x6b8:   	smul	%o3, -0x8f5, %l7
	.word	0x2d480006	! t0_kref+0x6bc:   	fbg,a,pt	%fcc0, _kref+0x6d4
	.word	0x9f040014	! t0_kref+0x6c0:   	taddcc	%l0, %l4, %o7
	.word	0xe43f4019	! t0_kref+0x6c4:   	std	%l2, [%i5 + %i1]
	.word	0x85a0192d	! t0_kref+0x6c8:   	fstod	%f13, %f2
	.word	0x81ac0ac4	! t0_kref+0x6cc:   	fcmped	%fcc0, %f16, %f4
	.word	0xafa5c9a1	! t0_kref+0x6d0:   	fdivs	%f23, %f1, %f23
	.word	0x99b3405a	! t0_kref+0x6d4:   	edge8l	%o5, %i2, %o4
	.word	0x2a480007	! t0_kref+0x6d8:   	bcs,a,pt	%icc, _kref+0x6f4
	.word	0x19285ef3	! t0_kref+0x6dc:   	sethi	%hi(0xa17bcc00), %o4
	.word	0xa9a0192f	! t0_kref+0x6e0:   	fstod	%f15, %f20
	.word	0xaed80009	! t0_kref+0x6e4:   	smulcc	%g0, %o1, %l7
	.word	0xa1a189da	! t0_kref+0x6e8:   	fdivd	%f6, %f26, %f16
	.word	0x8170001a	! t0_kref+0x6ec:   	popc	%i2, %g0
	.word	0xd010a03c	! t0_kref+0x6f0:   	lduh	[%g2 + 0x3c], %o0
	.word	0xae5cc014	! t0_kref+0x6f4:   	smul	%l3, %l4, %l7
	.word	0x8143e040	! t0_kref+0x6f8:   	membar	0x40
	.word	0x83a3c9b6	! t0_kref+0x6fc:   	fdivs	%f15, %f22, %f1
	.word	0xa5a689d0	! t0_kref+0x700:   	fdivd	%f26, %f16, %f18
	.word	0xaeb52fde	! t0_kref+0x704:   	orncc	%l4, 0xfde, %l7
	.word	0xee4e6011	! t0_kref+0x708:   	ldsb	[%i1 + 0x11], %l7
	.word	0xae2c4015	! t0_kref+0x70c:   	andn	%l1, %l5, %l7
	.word	0xec1e2018	! t0_kref+0x710:   	ldd	[%i0 + 0x18], %l6
	.word	0x31800004	! t0_kref+0x714:   	fba,a	_kref+0x724
	.word	0xe43e4000	! t0_kref+0x718:   	std	%l2, [%i1]
	.word	0x26480005	! t0_kref+0x71c:   	bl,a,pt	%icc, _kref+0x730
	.word	0xa3b00f2f	! t0_kref+0x720:   	fsrc2s	%f15, %f17
	.word	0x80da7755	! t0_kref+0x724:   	smulcc	%o1, -0x8ab, %g0
	.word	0x8012c010	! t0_kref+0x728:   	or	%o3, %l0, %g0
	.word	0x23800003	! t0_kref+0x72c:   	fbne,a	_kref+0x738
	.word	0xc056001b	! t0_kref+0x730:   	ldsh	[%i0 + %i3], %g0
	.word	0xa5a2c924	! t0_kref+0x734:   	fmuls	%f11, %f4, %f18
	.word	0x1b102617	! t0_kref+0x738:   	sethi	%hi(0x40985c00), %o5
	.word	0x91a449a1	! t0_kref+0x73c:   	fdivs	%f17, %f1, %f8
	.word	0xb1b007b4	! t0_kref+0x740:   	fpackfix	%f20, %f24
	.word	0x31480007	! t0_kref+0x744:   	fba,a,pt	%fcc0, _kref+0x760
	.word	0xc00e0000	! t0_kref+0x748:   	ldub	[%i0], %g0
	.word	0xa9a0012c	! t0_kref+0x74c:   	fabss	%f12, %f20
	.word	0x97b00fe0	! t0_kref+0x750:   	fones	%f11
	.word	0xd43e7ff8	! t0_kref+0x754:   	std	%o2, [%i1 - 8]
	.word	0xa9a00524	! t0_kref+0x758:   	fsqrts	%f4, %f20
	.word	0x99b680ec	! t0_kref+0x75c:   	edge16ln	%i2, %o4, %o4
	.word	0x94aa8000	! t0_kref+0x760:   	andncc	%o2, %g0, %o2
	.word	0x81580000	! t0_kref+0x764:   	flushw
	.word	0xfd6e001d	! t0_kref+0x768:   	prefetch	%i0 + %i5, 30
	.word	0x9da00544	! t0_kref+0x76c:   	fsqrtd	%f4, %f14
	.word	0xa5a58856	! t0_kref+0x770:   	faddd	%f22, %f22, %f18
	.word	0x81db39e2	! t0_kref+0x774:   	flush	%o4 - 0x61e
	.word	0x8da00540	! t0_kref+0x778:   	fsqrtd	%f0, %f6
	.word	0xd1063fec	! t0_kref+0x77c:   	ld	[%i0 - 0x14], %f8
	.word	0x3e800002	! t0_kref+0x780:   	bvc,a	_kref+0x788
	.word	0x89a509d0	! t0_kref+0x784:   	fdivd	%f20, %f16, %f4
	.word	0x952ea007	! t0_kref+0x788:   	sll	%i2, 0x7, %o2
	.word	0xada609d2	! t0_kref+0x78c:   	fdivd	%f24, %f18, %f22
	.word	0x85a0055a	! t0_kref+0x790:   	fsqrtd	%f26, %f2
	.word	0x9e1d619d	! t0_kref+0x794:   	xor	%l5, 0x19d, %o7
	.word	0x2f800003	! t0_kref+0x798:   	fbu,a	_kref+0x7a4
	.word	0x9a58000c	! t0_kref+0x79c:   	smul	%g0, %o4, %o5
	.word	0xe67e6008	! t0_kref+0x7a0:   	swap	[%i1 + 8], %l3
	.word	0xae0b4008	! t0_kref+0x7a4:   	and	%o5, %o0, %l7
	call	SYM(t0_subr3)
	.word	0xa086b486	! t0_kref+0x7ac:   	addcc	%i2, -0xb7a, %l0
	.word	0x85a609bc	! t0_kref+0x7b0:   	fdivs	%f24, %f28, %f2
	.word	0xe56e001b	! t0_kref+0x7b4:   	prefetch	%i0 + %i3, 18
	.word	0xc00e7fef	! t0_kref+0x7b8:   	ldub	[%i1 - 0x11], %g0
	.word	0x81d83c98	! t0_kref+0x7bc:   	flush	%g0 - 0x368
	.word	0x94fc7399	! t0_kref+0x7c0:   	sdivcc	%l1, -0xc67, %o2
	.word	0x9bb500d5	! t0_kref+0x7c4:   	edge16l	%l4, %l5, %o5
	.word	0x81a80ada	! t0_kref+0x7c8:   	fcmped	%fcc0, %f0, %f26
	.word	0x85a189dc	! t0_kref+0x7cc:   	fdivd	%f6, %f28, %f2
	.word	0x8da00548	! t0_kref+0x7d0:   	fsqrtd	%f8, %f6
	.word	0x89a48832	! t0_kref+0x7d4:   	fadds	%f18, %f18, %f4
	.word	0x23480003	! t0_kref+0x7d8:   	fbne,a,pt	%fcc0, _kref+0x7e4
	.word	0xa1a0052d	! t0_kref+0x7dc:   	fsqrts	%f13, %f16
	.word	0xa9b14e22	! t0_kref+0x7e0:   	fands	%f5, %f2, %f20
	.word	0x95a649bb	! t0_kref+0x7e4:   	fdivs	%f25, %f27, %f10
	.word	0xa1a00544	! t0_kref+0x7e8:   	fsqrtd	%f4, %f16
	.word	0xee801019	! t0_kref+0x7ec:   	lda	[%g0 + %i1]0x80, %l7
	.word	0x2f480002	! t0_kref+0x7f0:   	fbu,a,pt	%fcc0, _kref+0x7f8
	.word	0xda067ffc	! t0_kref+0x7f4:   	ld	[%i1 - 4], %o5
	.word	0xa1a4092a	! t0_kref+0x7f8:   	fmuls	%f16, %f10, %f16
	.word	0x91b5014d	! t0_kref+0x7fc:   	edge32l	%l4, %o5, %o0
	.word	0xada01921	! t0_kref+0x800:   	fstod	%f1, %f22
	.word	0x90dd800a	! t0_kref+0x804:   	smulcc	%l6, %o2, %o0
	.word	0x9bb3408a	! t0_kref+0x808:   	edge16	%o5, %o2, %o5
	.word	0x33800008	! t0_kref+0x80c:   	fbe,a	_kref+0x82c
	.word	0x94a8000b	! t0_kref+0x810:   	andncc	%g0, %o3, %o2
	.word	0x81b540e0	! t0_kref+0x814:   	edge16ln	%l5, %g0, %g0
	.word	0x20800003	! t0_kref+0x818:   	bn,a	_kref+0x824
	.word	0x92b26ded	! t0_kref+0x81c:   	orncc	%o1, 0xded, %o1
	.word	0x010baf9a	! t0_kref+0x820:   	sethi	%hi(0x2ebe6800), %g0
	.word	0xa1a0053d	! t0_kref+0x824:   	fsqrts	%f29, %f16
	.word	0x91a0104a	! t0_kref+0x828:   	fdtox	%f10, %f8
	.word	0x2e800002	! t0_kref+0x82c:   	bvs,a	_kref+0x834
	.word	0xb9a01a26	! t0_kref+0x830:   	fstoi	%f6, %f28
	.word	0xee080018	! t0_kref+0x834:   	ldub	[%g0 + %i0], %l7
	.word	0xef68a046	! t0_kref+0x838:   	prefetch	%g2 + 0x46, 23
	.word	0x95b6090c	! t0_kref+0x83c:   	faligndata	%f24, %f12, %f10
	.word	0x89a0012c	! t0_kref+0x840:   	fabss	%f12, %f4
	.word	0xde861000	! t0_kref+0x844:   	lda	[%i0]0x80, %o7
	.word	0x81820000	! t0_kref+0x848:   	wr	%o0, %g0, %y
	.word	0x2a480006	! t0_kref+0x84c:   	bcs,a,pt	%icc, _kref+0x864
	.word	0xa1b00f2f	! t0_kref+0x850:   	fsrc2s	%f15, %f16
	.word	0x992a200d	! t0_kref+0x854:   	sll	%o0, 0xd, %o4
	.word	0x3c800004	! t0_kref+0x858:   	bpos,a	_kref+0x868
	.word	0xd2564000	! t0_kref+0x85c:   	ldsh	[%i1], %o1
	.word	0x27480003	! t0_kref+0x860:   	fbul,a,pt	%fcc0, _kref+0x86c
	.word	0x9bb480d4	! t0_kref+0x864:   	edge16l	%l2, %l4, %o5
	.word	0xe6200018	! t0_kref+0x868:   	st	%l3, [%g0 + %i0]
	.word	0xde96d019	! t0_kref+0x86c:   	lduha	[%i3 + %i1]0x80, %o7
	.word	0x9e9db3a3	! t0_kref+0x870:   	xorcc	%l6, -0xc5d, %o7
	.word	0x001fffff	! t0_kref+0x874:   	illtrap	0x1fffff
	.word	0x9476b85b	! t0_kref+0x878:   	udiv	%i2, -0x7a5, %o2
	.word	0x95a0052b	! t0_kref+0x87c:   	fsqrts	%f11, %f10
	.word	0x9e8567e4	! t0_kref+0x880:   	addcc	%l5, 0x7e4, %o7
	.word	0x38800003	! t0_kref+0x884:   	bgu,a	_kref+0x890
	.word	0x94556bfb	! t0_kref+0x888:   	umul	%l5, 0xbfb, %o2
	.word	0x2e480005	! t0_kref+0x88c:   	bvs,a,pt	%icc, _kref+0x8a0
	.word	0xae0ea9b2	! t0_kref+0x890:   	and	%i2, 0x9b2, %l7
	.word	0x93b5c240	! t0_kref+0x894:   	array16	%l7, %g0, %o1
	.word	0xe2e81018	! t0_kref+0x898:   	ldstuba	[%g0 + %i0]0x80, %l1
	.word	0xe028a011	! t0_kref+0x89c:   	stb	%l0, [%g2 + 0x11]
	.word	0x81aa8ac0	! t0_kref+0x8a0:   	fcmped	%fcc0, %f10, %f0
	.word	0x99b10c80	! t0_kref+0x8a4:   	fandnot2	%f4, %f0, %f12
	.word	0xf11fbe80	! t0_kref+0x8a8:   	ldd	[%fp - 0x180], %f24
	.word	0x25800005	! t0_kref+0x8ac:   	fblg,a	_kref+0x8c0
	.word	0xee6e7feb	! t0_kref+0x8b0:   	ldstub	[%i1 - 0x15], %l7
	.word	0x948daf03	! t0_kref+0x8b4:   	andcc	%l6, 0xf03, %o2
	.word	0x9a5aa7a4	! t0_kref+0x8b8:   	smul	%o2, 0x7a4, %o5
	.word	0x9ae24014	! t0_kref+0x8bc:   	subccc	%o1, %l4, %o5
	.word	0x81a98a4c	! t0_kref+0x8c0:   	fcmpd	%fcc0, %f6, %f12
	.word	0x9f414000	! t0_kref+0x8c4:   	mov	%pc, %o7
	.word	0xd8566008	! t0_kref+0x8c8:   	ldsh	[%i1 + 8], %o4
	.word	0xb1a01a29	! t0_kref+0x8cc:   	fstoi	%f9, %f24
	.word	0xd2267fec	! t0_kref+0x8d0:   	st	%o1, [%i1 - 0x14]
	.word	0x94fac00c	! t0_kref+0x8d4:   	sdivcc	%o3, %o4, %o2
	.word	0xada00150	! t0_kref+0x8d8:   	fabsd	%f16, %f22
	.word	0x9524bb72	! t0_kref+0x8dc:   	mulscc	%l2, -0x48e, %o2
	.word	0xa9b706e8	! t0_kref+0x8e0:   	fmul8ulx16	%f28, %f8, %f20
	.word	0x8da189d8	! t0_kref+0x8e4:   	fdivd	%f6, %f24, %f6
	.word	0x95b400ea	! t0_kref+0x8e8:   	edge16ln	%l0, %o2, %o2
	.word	0x11075fe8	! t0_kref+0x8ec:   	sethi	%hi(0x1d7fa000), %o0
	.word	0x928dacd1	! t0_kref+0x8f0:   	andcc	%l6, 0xcd1, %o1
	.word	0x1129e8fa	! t0_kref+0x8f4:   	sethi	%hi(0xa7a3e800), %o0
	.word	0xd6774019	! t0_kref+0x8f8:   	stx	%o3, [%i5 + %i1]
	.word	0xb7a249ad	! t0_kref+0x8fc:   	fdivs	%f9, %f13, %f27
	.word	0x28800007	! t0_kref+0x900:   	bleu,a	_kref+0x91c
	.word	0xa1b40a40	! t0_kref+0x904:   	fpadd32	%f16, %f0, %f16
	.word	0xee0e4000	! t0_kref+0x908:   	ldub	[%i1], %l7
	.word	0xae658011	! t0_kref+0x90c:   	subc	%l6, %l1, %l7
	.word	0xadb406a2	! t0_kref+0x910:   	fmul8x16al	%f16, %f2, %f22
	.word	0x2b800005	! t0_kref+0x914:   	fbug,a	_kref+0x928
	.word	0x94db320b	! t0_kref+0x918:   	smulcc	%o4, -0xdf5, %o2
	.word	0xf3ee101c	! t0_kref+0x91c:   	prefetcha	%i0 + %i4, 25
	.word	0x92b379b7	! t0_kref+0x920:   	orncc	%o5, -0x649, %o1
	.word	0x89a0055c	! t0_kref+0x924:   	fsqrtd	%f28, %f4
	.word	0x8fb00cf8	! t0_kref+0x928:   	fnot2s	%f24, %f7
	.word	0xa1a01a2c	! t0_kref+0x92c:   	fstoi	%f12, %f16
	.word	0x95b10582	! t0_kref+0x930:   	fcmpgt32	%f4, %f2, %o2
	.word	0x80a5c000	! t0_kref+0x934:   	cmp	%l7, %g0
	.word	0x23480002	! t0_kref+0x938:   	fbne,a,pt	%fcc0, _kref+0x940
	.word	0xada01933	! t0_kref+0x93c:   	fstod	%f19, %f22
	.word	0xa3a449a9	! t0_kref+0x940:   	fdivs	%f17, %f9, %f17
	.word	0x96dc7863	! t0_kref+0x944:   	smulcc	%l1, -0x79d, %o3
	.word	0x35480003	! t0_kref+0x948:   	fbue,a,pt	%fcc0, _kref+0x954
	.word	0x9b40c000	! t0_kref+0x94c:   	mov	%asi, %o5
	.word	0xc5067ff8	! t0_kref+0x950:   	ld	[%i1 - 8], %f2
	.word	0xae1caa6a	! t0_kref+0x954:   	xor	%l2, 0xa6a, %l7
	.word	0x9adc24fd	! t0_kref+0x958:   	smulcc	%l0, 0x4fd, %o5
	.word	0x33480001	! t0_kref+0x95c:   	fbe,a,pt	%fcc0, _kref+0x960
	.word	0x945d8010	! t0_kref+0x960:   	smul	%l6, %l0, %o2
	.word	0xb9a01a52	! t0_kref+0x964:   	fdtoi	%f18, %f28
	.word	0xb5a00556	! t0_kref+0x968:   	fsqrtd	%f22, %f26
	.word	0xb9b30d94	! t0_kref+0x96c:   	fxor	%f12, %f20, %f28
	.word	0xa5a1094e	! t0_kref+0x970:   	fmuld	%f4, %f14, %f18
	.word	0xc900a028	! t0_kref+0x974:   	ld	[%g2 + 0x28], %f4
	.word	0xb1a00134	! t0_kref+0x978:   	fabss	%f20, %f24
	.word	0xc056401b	! t0_kref+0x97c:   	ldsh	[%i1 + %i3], %g0
	.word	0x81dd8000	! t0_kref+0x980:   	flush	%l6
	.word	0xee067ffc	! t0_kref+0x984:   	ld	[%i1 - 4], %l7
	.word	0x908c0013	! t0_kref+0x988:   	andcc	%l0, %l3, %o0
	.word	0x94a2c00d	! t0_kref+0x98c:   	subcc	%o3, %o5, %o2
	.word	0xb9a01a48	! t0_kref+0x990:   	fdtoi	%f8, %f28
	.word	0xe3e6100b	! t0_kref+0x994:   	casa	[%i0]0x80, %o3, %l1
	.word	0x95a00544	! t0_kref+0x998:   	fsqrtd	%f4, %f10
	.word	0xeec81019	! t0_kref+0x99c:   	ldsba	[%g0 + %i1]0x80, %l7
	.word	0xd056c018	! t0_kref+0x9a0:   	ldsh	[%i3 + %i0], %o0
	.word	0x36480001	! t0_kref+0x9a4:   	bge,a,pt	%icc, _kref+0x9a8
	.word	0x9afc000c	! t0_kref+0x9a8:   	sdivcc	%l0, %o4, %o5
	.word	0xea266018	! t0_kref+0x9ac:   	st	%l5, [%i1 + 0x18]
	.word	0x3b480007	! t0_kref+0x9b0:   	fble,a,pt	%fcc0, _kref+0x9cc
	.word	0xd19f5019	! t0_kref+0x9b4:   	ldda	[%i5 + %i1]0x80, %f8
	.word	0x96b6af10	! t0_kref+0x9b8:   	orncc	%i2, 0xf10, %o3
	.word	0x94348017	! t0_kref+0x9bc:   	orn	%l2, %l7, %o2
	.word	0x9245b328	! t0_kref+0x9c0:   	addc	%l6, -0xcd8, %o1
	.word	0x81dbae56	! t0_kref+0x9c4:   	flush	%sp + 0xe56
	.word	0x972cc010	! t0_kref+0x9c8:   	sll	%l3, %l0, %o3
	.word	0x36800006	! t0_kref+0x9cc:   	bge,a	_kref+0x9e4
	.word	0x8db20628	! t0_kref+0x9d0:   	fmul8x16	%f8, %f8, %f6
	.word	0x81ac0ac8	! t0_kref+0x9d4:   	fcmped	%fcc0, %f16, %f8
	.word	0xc02e3feb	! t0_kref+0x9d8:   	clrb	[%i0 - 0x15]
	.word	0x8db5c638	! t0_kref+0x9dc:   	fmul8x16	%f23, %f24, %f6
	.word	0x81a01926	! t0_kref+0x9e0:   	fstod	%f6, %f0
	.word	0x86102001	! t0_kref+0x9e4:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x9e8:   	bne,a	_kref+0x9e8
	.word	0x86a0e001	! t0_kref+0x9ec:   	subcc	%g3, 1, %g3
	.word	0xb9b00fc0	! t0_kref+0x9f0:   	fone	%f28
	.word	0xf207bfe0	! t0_kref+0x9f4:   	ld	[%fp - 0x20], %i1
	.word	0x30480003	! t0_kref+0x9f8:   	ba,a,pt	%icc, _kref+0xa04
	.word	0xada00532	! t0_kref+0x9fc:   	fsqrts	%f18, %f22
	.word	0x92d24009	! t0_kref+0xa00:   	umulcc	%o1, %o1, %o1
	.word	0x94833d1d	! t0_kref+0xa04:   	addcc	%o4, -0x2e3, %o2
	.word	0x9613213a	! t0_kref+0xa08:   	or	%o4, 0x13a, %o3
	.word	0x80d267ca	! t0_kref+0xa0c:   	umulcc	%o1, 0x7ca, %g0
	.word	0xd4263ff8	! t0_kref+0xa10:   	st	%o2, [%i0 - 8]
	.word	0x91b50504	! t0_kref+0xa14:   	fcmpgt16	%f20, %f4, %o0
	.word	0x8db60c42	! t0_kref+0xa18:   	fnor	%f24, %f2, %f6
	.word	0x98548000	! t0_kref+0xa1c:   	umul	%l2, %g0, %o4
	.word	0x9bb0855a	! t0_kref+0xa20:   	fcmpeq16	%f2, %f26, %o5
	.word	0x9462800c	! t0_kref+0xa24:   	subc	%o2, %o4, %o2
	.word	0xc0a65000	! t0_kref+0xa28:   	sta	%g0, [%i1]0x80
	.word	0x9e128017	! t0_kref+0xa2c:   	or	%o2, %l7, %o7
	.word	0x83a409b4	! t0_kref+0xa30:   	fdivs	%f16, %f20, %f1
	.word	0xf3801019	! t0_kref+0xa34:   	lda	[%g0 + %i1]0x80, %f25
	.word	0x8143e002	! t0_kref+0xa38:   	membar	0x2
	.word	0xd6df5019	! t0_kref+0xa3c:   	ldxa	[%i5 + %i1]0x80, %o3
	.word	0x9e537516	! t0_kref+0xa40:   	umul	%o5, -0xaea, %o7
	.word	0xb5a01a4a	! t0_kref+0xa44:   	fdtoi	%f10, %f26
	.word	0xf76e3fe0	! t0_kref+0xa48:   	prefetch	%i0 - 0x20, 27
	.word	0xe22e8018	! t0_kref+0xa4c:   	stb	%l1, [%i2 + %i0]
	.word	0x85a01048	! t0_kref+0xa50:   	fdtox	%f8, %f2
	.word	0x37800006	! t0_kref+0xa54:   	fbge,a	_kref+0xa6c
	.word	0x9875a46c	! t0_kref+0xa58:   	udiv	%l6, 0x46c, %o4
	.word	0x94c43953	! t0_kref+0xa5c:   	addccc	%l0, -0x6ad, %o2
	.word	0x3d480001	! t0_kref+0xa60:   	fbule,a,pt	%fcc0, _kref+0xa64
	.word	0x98a4c013	! t0_kref+0xa64:   	subcc	%l3, %l3, %o4
	.word	0xb5b68906	! t0_kref+0xa68:   	faligndata	%f26, %f6, %f26
	.word	0x22480006	! t0_kref+0xa6c:   	be,a,pt	%icc, _kref+0xa84
	.word	0x925cb829	! t0_kref+0xa70:   	smul	%l2, -0x7d7, %o1
	.word	0x23480008	! t0_kref+0xa74:   	fbne,a,pt	%fcc0, _kref+0xa94
	.word	0xd04e0000	! t0_kref+0xa78:   	ldsb	[%i0], %o0
	.word	0x9a3d000a	! t0_kref+0xa7c:   	xnor	%l4, %o2, %o5
	.word	0xeeae1000	! t0_kref+0xa80:   	stba	%l7, [%i0]0x80
	.word	0x9f40c000	! t0_kref+0xa84:   	mov	%asi, %o7
	.word	0x9a5a7d99	! t0_kref+0xa88:   	smul	%o1, -0x267, %o5
	.word	0x98debb1e	! t0_kref+0xa8c:   	smulcc	%i2, -0x4e2, %o4
	.word	0x9afb0015	! t0_kref+0xa90:   	sdivcc	%o4, %l5, %o5
	.word	0x81b34240	! t0_kref+0xa94:   	array16	%o5, %g0, %g0
	.word	0xec1e4000	! t0_kref+0xa98:   	ldd	[%i1], %l6
	.word	0xc0480018	! t0_kref+0xa9c:   	ldsb	[%g0 + %i0], %g0
	.word	0xe6b6d018	! t0_kref+0xaa0:   	stha	%l3, [%i3 + %i0]0x80
	.word	0xec6e6018	! t0_kref+0xaa4:   	ldstub	[%i1 + 0x18], %l6
	.word	0xe420a030	! t0_kref+0xaa8:   	st	%l2, [%g2 + 0x30]
	.word	0xf76e7ff8	! t0_kref+0xaac:   	prefetch	%i1 - 8, 27
	.word	0x927a0017	! t0_kref+0xab0:   	sdiv	%o0, %l7, %o1
	.word	0x967a4015	! t0_kref+0xab4:   	sdiv	%o1, %l5, %o3
	.word	0x9a5b376b	! t0_kref+0xab8:   	smul	%o4, -0x895, %o5
	.word	0xd6460000	! t0_kref+0xabc:   	ldsw	[%i0], %o3
	.word	0xb5a1c929	! t0_kref+0xac0:   	fmuls	%f7, %f9, %f26
	.word	0x9ad02678	! t0_kref+0xac4:   	umulcc	%g0, 0x678, %o5
	.word	0xc0567ff2	! t0_kref+0xac8:   	ldsh	[%i1 - 0xe], %g0
	.word	0xb7a00121	! t0_kref+0xacc:   	fabss	%f1, %f27
	.word	0x81dfc01f	! t0_kref+0xad0:   	flush	%i7 + %i7
	.word	0xb5a00537	! t0_kref+0xad4:   	fsqrts	%f23, %f26
	.word	0xa5a589ad	! t0_kref+0xad8:   	fdivs	%f22, %f13, %f18
	.word	0xec280018	! t0_kref+0xadc:   	stb	%l6, [%g0 + %i0]
	.word	0xf1be5817	! t0_kref+0xae0:   	stda	%f24, [%i1 + %l7]0xc0
	.word	0xe81e7ff8	! t0_kref+0xae4:   	ldd	[%i1 - 8], %l4
	.word	0x81830000	! t0_kref+0xae8:   	wr	%o4, %g0, %y
	.word	0x9e0dfe30	! t0_kref+0xaec:   	and	%l7, -0x1d0, %o7
	.word	0xde564000	! t0_kref+0xaf0:   	ldsh	[%i1], %o7
	.word	0x9b400000	! t0_kref+0xaf4:   	mov	%y, %o5
	.word	0xf43e0000	! t0_kref+0xaf8:   	std	%i2, [%i0]
	.word	0x85a01909	! t0_kref+0xafc:   	fitod	%f9, %f2
	.word	0xd04e201f	! t0_kref+0xb00:   	ldsb	[%i0 + 0x1f], %o0
	.word	0x24800006	! t0_kref+0xb04:   	ble,a	_kref+0xb1c
	.word	0xa9b086d6	! t0_kref+0xb08:   	fmul8sux16	%f2, %f22, %f20
	.word	0xd84e7ff1	! t0_kref+0xb0c:   	ldsb	[%i1 - 0xf], %o4
	.word	0xeb68a041	! t0_kref+0xb10:   	prefetch	%g2 + 0x41, 21
	.word	0xee4e7fe7	! t0_kref+0xb14:   	ldsb	[%i1 - 0x19], %l7
	.word	0xada0054c	! t0_kref+0xb18:   	fsqrtd	%f12, %f22
	.word	0x97b00772	! t0_kref+0xb1c:   	fpack16	%f18, %f11
	call	SYM(t0_subr1)
	.word	0xe8b81019	! t0_kref+0xb24:   	stda	%l4, [%g0 + %i1]0x80
	.word	0x9fb4434a	! t0_kref+0xb28:   	alignaddrl	%l1, %o2, %o7
	.word	0x81848000	! t0_kref+0xb2c:   	wr	%l2, %g0, %y
	.word	0x90c43642	! t0_kref+0xb30:   	addccc	%l0, -0x9be, %o0
	.word	0x95b58088	! t0_kref+0xb34:   	edge16	%l6, %o0, %o2
	.word	0x9722346f	! t0_kref+0xb38:   	mulscc	%o0, -0xb91, %o3
	.word	0x81aaca37	! t0_kref+0xb3c:   	fcmps	%fcc0, %f11, %f23
	.word	0xe4f81019	! t0_kref+0xb40:   	swapa	[%g0 + %i1]0x80, %l2
	.word	0xe1e65015	! t0_kref+0xb44:   	casa	[%i1]0x80, %l5, %l0
	.word	0x36480003	! t0_kref+0xb48:   	bge,a,pt	%icc, _kref+0xb54
	.word	0x98da4010	! t0_kref+0xb4c:   	smulcc	%o1, %l0, %o4
	.word	0x2e480001	! t0_kref+0xb50:   	bvs,a,pt	%icc, _kref+0xb54
	.word	0xb3b5ce2d	! t0_kref+0xb54:   	fands	%f23, %f13, %f25
	.word	0xa7a000b5	! t0_kref+0xb58:   	fnegs	%f21, %f19
	.word	0xef68a044	! t0_kref+0xb5c:   	prefetch	%g2 + 0x44, 23
	.word	0x99b2ccba	! t0_kref+0xb60:   	fandnot2s	%f11, %f26, %f12
	.word	0x38800008	! t0_kref+0xb64:   	bgu,a	_kref+0xb84
	.word	0xd030a028	! t0_kref+0xb68:   	sth	%o0, [%g2 + 0x28]
	.word	0x2f800003	! t0_kref+0xb6c:   	fbu,a	_kref+0xb78
	.word	0xa9b28e06	! t0_kref+0xb70:   	fand	%f10, %f6, %f20
	.word	0x9db30dd2	! t0_kref+0xb74:   	fnand	%f12, %f18, %f14
	.word	0xafa00131	! t0_kref+0xb78:   	fabss	%f17, %f23
	.word	0x81dba490	! t0_kref+0xb7c:   	flush	%sp + 0x490
	.word	0x31480006	! t0_kref+0xb80:   	fba,a,pt	%fcc0, _kref+0xb98
	.word	0x92b34011	! t0_kref+0xb84:   	orncc	%o5, %l1, %o1
	.word	0x2e800002	! t0_kref+0xb88:   	bvs,a	_kref+0xb90
	.word	0x96fd6a83	! t0_kref+0xb8c:   	sdivcc	%l5, 0xa83, %o3
	.word	0x29480006	! t0_kref+0xb90:   	fbl,a,pt	%fcc0, _kref+0xba8
	.word	0xd03e6008	! t0_kref+0xb94:   	std	%o0, [%i1 + 8]
	.word	0x93a5892e	! t0_kref+0xb98:   	fmuls	%f22, %f14, %f9
	.word	0x81b2030d	! t0_kref+0xb9c:   	alignaddr	%o0, %o5, %g0
	.word	0xda266010	! t0_kref+0xba0:   	st	%o5, [%i1 + 0x10]
	.word	0xb5a00558	! t0_kref+0xba4:   	fsqrtd	%f24, %f26
	.word	0x21800003	! t0_kref+0xba8:   	fbn,a	_kref+0xbb4
	.word	0xb5a01923	! t0_kref+0xbac:   	fstod	%f3, %f26
	.word	0xaeb2be86	! t0_kref+0xbb0:   	orncc	%o2, -0x17a, %l7
	.word	0x89a01917	! t0_kref+0xbb4:   	fitod	%f23, %f4
	.word	0xa7a01a46	! t0_kref+0xbb8:   	fdtoi	%f6, %f19
	.word	0x95b484cc	! t0_kref+0xbbc:   	fcmpne32	%f18, %f12, %o2
	.word	0x28800002	! t0_kref+0xbc0:   	bleu,a	_kref+0xbc8
	.word	0x992c6017	! t0_kref+0xbc4:   	sll	%l1, 0x17, %o4
	.word	0x91a00139	! t0_kref+0xbc8:   	fabss	%f25, %f8
	.word	0x97b2c0ad	! t0_kref+0xbcc:   	edge16n	%o3, %o5, %o3
	.word	0x9bb5c354	! t0_kref+0xbd0:   	alignaddrl	%l7, %l4, %o5
	.word	0x8185c000	! t0_kref+0xbd4:   	wr	%l7, %g0, %y
	.word	0xd2080019	! t0_kref+0xbd8:   	ldub	[%g0 + %i1], %o1
	.word	0x8da00546	! t0_kref+0xbdc:   	fsqrtd	%f6, %f6
	.word	0x93a01a26	! t0_kref+0xbe0:   	fstoi	%f6, %f9
	.word	0x34800005	! t0_kref+0xbe4:   	bg,a	_kref+0xbf8
	.word	0xb9a28956	! t0_kref+0xbe8:   	fmuld	%f10, %f22, %f28
	.word	0xd8080018	! t0_kref+0xbec:   	ldub	[%g0 + %i0], %o4
	.word	0x95b606f6	! t0_kref+0xbf0:   	fmul8ulx16	%f24, %f22, %f10
	.word	0xafa00521	! t0_kref+0xbf4:   	fsqrts	%f1, %f23
	.word	0x99b00fe0	! t0_kref+0xbf8:   	fones	%f12
	.word	0x97b0cab5	! t0_kref+0xbfc:   	fpsub16s	%f3, %f21, %f11
	.word	0x85b10744	! t0_kref+0xc00:   	fpack32	%f4, %f4, %f2
	.word	0x9fb50240	! t0_kref+0xc04:   	array16	%l4, %g0, %o7
	.word	0x99a2085a	! t0_kref+0xc08:   	faddd	%f8, %f26, %f12
	.word	0x80b6801a	! t0_kref+0xc0c:   	orncc	%i2, %i2, %g0
	.word	0x953da013	! t0_kref+0xc10:   	sra	%l6, 0x13, %o2
	.word	0xde000019	! t0_kref+0xc14:   	ld	[%g0 + %i1], %o7
	.word	0x81ac0ac6	! t0_kref+0xc18:   	fcmped	%fcc0, %f16, %f6
	.word	0x31480006	! t0_kref+0xc1c:   	fba,a,pt	%fcc0, _kref+0xc34
	.word	0x85a00137	! t0_kref+0xc20:   	fabss	%f23, %f2
	.word	0x987d4014	! t0_kref+0xc24:   	sdiv	%l5, %l4, %o4
	.word	0x90168009	! t0_kref+0xc28:   	or	%i2, %o1, %o0
	.word	0x92e362f6	! t0_kref+0xc2c:   	subccc	%o5, 0x2f6, %o1
	.word	0x25480002	! t0_kref+0xc30:   	fblg,a,pt	%fcc0, _kref+0xc38
	.word	0x99a00552	! t0_kref+0xc34:   	fsqrtd	%f18, %f12
	.word	0x38480008	! t0_kref+0xc38:   	bgu,a,pt	%icc, _kref+0xc58
	.word	0x9458001a	! t0_kref+0xc3c:   	smul	%g0, %i2, %o2
	.word	0x9e9df088	! t0_kref+0xc40:   	xorcc	%l7, -0xf78, %o7
	.word	0xc056001b	! t0_kref+0xc44:   	ldsh	[%i0 + %i3], %g0
	.word	0xe300a010	! t0_kref+0xc48:   	ld	[%g2 + 0x10], %f17
	.word	0x93226746	! t0_kref+0xc4c:   	mulscc	%o1, 0x746, %o1
	.word	0xc96e2018	! t0_kref+0xc50:   	prefetch	%i0 + 0x18, 4
	.word	0xcb070018	! t0_kref+0xc54:   	ld	[%i4 + %i0], %f5
	.word	0x89a018da	! t0_kref+0xc58:   	fdtos	%f26, %f4
	.word	0xa1a588ca	! t0_kref+0xc5c:   	fsubd	%f22, %f10, %f16
	.word	0x99b10c5c	! t0_kref+0xc60:   	fnor	%f4, %f28, %f12
	.word	0xc91e2000	! t0_kref+0xc64:   	ldd	[%i0], %f4
	.word	0x8fb00c20	! t0_kref+0xc68:   	fzeros	%f7
	.word	0x21480003	! t0_kref+0xc6c:   	fbn,a,pt	%fcc0, _kref+0xc78
	.word	0xd820a00c	! t0_kref+0xc70:   	st	%o4, [%g2 + 0xc]
	.word	0x91b680fa	! t0_kref+0xc74:   	edge16ln	%i2, %i2, %o0
	.word	0x25800002	! t0_kref+0xc78:   	fblg,a	_kref+0xc80
	.word	0x932c400b	! t0_kref+0xc7c:   	sll	%l1, %o3, %o1
	.word	0x21480001	! t0_kref+0xc80:   	fbn,a,pt	%fcc0, _kref+0xc84
	.word	0x91a01921	! t0_kref+0xc84:   	fstod	%f1, %f8
	.word	0x99b28c42	! t0_kref+0xc88:   	fnor	%f10, %f2, %f12
	.word	0x95b1cdab	! t0_kref+0xc8c:   	fxors	%f7, %f11, %f10
	.word	0xafb007b0	! t0_kref+0xc90:   	fpackfix	%f16, %f23
	.word	0xda266008	! t0_kref+0xc94:   	st	%o5, [%i1 + 8]
	.word	0x81830000	! t0_kref+0xc98:   	wr	%o4, %g0, %y
	.word	0x98340015	! t0_kref+0xc9c:   	orn	%l0, %l5, %o4
	.word	0xe428a017	! t0_kref+0xca0:   	stb	%l2, [%g2 + 0x17]
	.word	0xe0b65000	! t0_kref+0xca4:   	stha	%l0, [%i1]0x80
	.word	0xe220a02c	! t0_kref+0xca8:   	st	%l1, [%g2 + 0x2c]
	.word	0xc96e3ff8	! t0_kref+0xcac:   	prefetch	%i0 - 8, 4
	.word	0x907af0e3	! t0_kref+0xcb0:   	sdiv	%o3, -0xf1d, %o0
	.word	0x35800005	! t0_kref+0xcb4:   	fbue,a	_kref+0xcc8
	.word	0x9f3b0000	! t0_kref+0xcb8:   	sra	%o4, %g0, %o7
	.word	0xef00a004	! t0_kref+0xcbc:   	ld	[%g2 + 4], %f23
	.word	0xc0780018	! t0_kref+0xcc0:   	swap	[%g0 + %i0], %g0
	.word	0x99a01a25	! t0_kref+0xcc4:   	fstoi	%f5, %f12
	.word	0x91aac048	! t0_kref+0xcc8:   	fmovdge	%fcc0, %f8, %f8
	.word	0x921339dc	! t0_kref+0xccc:   	or	%o4, -0x624, %o1
	.word	0x81d94005	! t0_kref+0xcd0:   	flush	%g5 + %g5
	.word	0xf91f4019	! t0_kref+0xcd4:   	ldd	[%i5 + %i1], %f28
	.word	0xf36e001b	! t0_kref+0xcd8:   	prefetch	%i0 + %i3, 25
	.word	0x8fa14821	! t0_kref+0xcdc:   	fadds	%f5, %f1, %f7
	.word	0x91a01a42	! t0_kref+0xce0:   	fdtoi	%f2, %f8
	.word	0x32800006	! t0_kref+0xce4:   	bne,a	_kref+0xcfc
	.word	0x9e1824e8	! t0_kref+0xce8:   	xor	%g0, 0x4e8, %o7
	.word	0x27800004	! t0_kref+0xcec:   	fbul,a	_kref+0xcfc
	.word	0xe2ee1000	! t0_kref+0xcf0:   	ldstuba	[%i0]0x80, %l1
	.word	0xe91fbd10	! t0_kref+0xcf4:   	ldd	[%fp - 0x2f0], %f20
	.word	0x9740c000	! t0_kref+0xcf8:   	mov	%asi, %o3
	.word	0xbbb00c20	! t0_kref+0xcfc:   	fzeros	%f29
	.word	0x908a7a11	! t0_kref+0xd00:   	andcc	%o1, -0x5ef, %o0
	.word	0xa5a689c6	! t0_kref+0xd04:   	fdivd	%f26, %f6, %f18
	.word	0x8da0012e	! t0_kref+0xd08:   	fabss	%f14, %f6
	.word	0x927d000c	! t0_kref+0xd0c:   	sdiv	%l4, %o4, %o1
	.word	0xe520a018	! t0_kref+0xd10:   	st	%f18, [%g2 + 0x18]
	.word	0x93b200f3	! t0_kref+0xd14:   	edge16ln	%o0, %l3, %o1
	.word	0xb1a14d3a	! t0_kref+0xd18:   	fsmuld	%f5, %f26, %f24
	.word	0x85b38630	! t0_kref+0xd1c:   	fmul8x16	%f14, %f16, %f2
	.word	0x8bb74ab7	! t0_kref+0xd20:   	fpsub16s	%f29, %f23, %f5
	.word	0xc0566016	! t0_kref+0xd24:   	ldsh	[%i1 + 0x16], %g0
	.word	0xa9a01909	! t0_kref+0xd28:   	fitod	%f9, %f20
	.word	0xdade501d	! t0_kref+0xd2c:   	ldxa	[%i1 + %i5]0x80, %o5
	.word	0x8072800c	! t0_kref+0xd30:   	udiv	%o2, %o4, %g0
	.word	0x33800006	! t0_kref+0xd34:   	fbe,a	_kref+0xd4c
	.word	0x9e657625	! t0_kref+0xd38:   	subc	%l5, -0x9db, %o7
	.word	0x83a6c936	! t0_kref+0xd3c:   	fmuls	%f27, %f22, %f1
	.word	0x8db40d0e	! t0_kref+0xd40:   	fandnot1	%f16, %f14, %f6
	.word	0x81ac0a5a	! t0_kref+0xd44:   	fcmpd	%fcc0, %f16, %f26
	.word	0x38800004	! t0_kref+0xd48:   	bgu,a	_kref+0xd58
	.word	0xc168a084	! t0_kref+0xd4c:   	prefetch	%g2 + 0x84, 0
	.word	0x17078626	! t0_kref+0xd50:   	sethi	%hi(0x1e189800), %o3
	.word	0xc3ee5011	! t0_kref+0xd54:   	prefetcha	%i1 + %l1, 1
	.word	0x9a9c8013	! t0_kref+0xd58:   	xorcc	%l2, %l3, %o5
	.word	0x22480002	! t0_kref+0xd5c:   	be,a,pt	%icc, _kref+0xd64
	.word	0xdad65000	! t0_kref+0xd60:   	ldsha	[%i1]0x80, %o5
	.word	0x9de3bfa0	! t0_kref+0xd64:   	save	%sp, -0x60, %sp
	.word	0xbb06801a	! t0_kref+0xd68:   	taddcc	%i2, %i2, %i5
	.word	0xafef330a	! t0_kref+0xd6c:   	restore	%i4, -0xcf6, %l7
	.word	0xd44e2008	! t0_kref+0xd70:   	ldsb	[%i0 + 8], %o2
	.word	0xd40e4000	! t0_kref+0xd74:   	ldub	[%i1], %o2
	.word	0x92ba4011	! t0_kref+0xd78:   	xnorcc	%o1, %l1, %o1
	.word	0x9065c00d	! t0_kref+0xd7c:   	subc	%l7, %o5, %o0
	.word	0x9a9423c9	! t0_kref+0xd80:   	orcc	%l0, 0x3c9, %o5
	.word	0xb9c162ac	! t0_kref+0xd84:   	jmpl	%g5 + 0x2ac, %i4
	.word	0xeed65000	! t0_kref+0xd88:   	ldsha	[%i1]0x80, %l7
	.word	0x9ee2000b	! t0_kref+0xd8c:   	subccc	%o0, %o3, %o7
	.word	0x33800001	! t0_kref+0xd90:   	fbe,a	_kref+0xd94
	.word	0x9edd7495	! t0_kref+0xd94:   	smulcc	%l5, -0xb6b, %o7
	.word	0xc12f0000	! t0_kref+0xd98:   	st	%fsr, [%i4]
	.word	0x21480006	! t0_kref+0xd9c:   	fbn,a,pt	%fcc0, _kref+0xdb4
	.word	0x95b2851c	! t0_kref+0xda0:   	fcmpgt16	%f10, %f28, %o2
	.word	0xcd3e7fe8	! t0_kref+0xda4:   	std	%f6, [%i1 - 0x18]
	.word	0x97b1cda6	! t0_kref+0xda8:   	fxors	%f7, %f6, %f11
	.word	0xada10856	! t0_kref+0xdac:   	faddd	%f4, %f22, %f22
	.word	0x89b00cd6	! t0_kref+0xdb0:   	fnot2	%f22, %f4
	.word	0x8034fc03	! t0_kref+0xdb4:   	orn	%l3, -0x3fd, %g0
	.word	0x95b50040	! t0_kref+0xdb8:   	edge8l	%l4, %g0, %o2
	.word	0x2c800006	! t0_kref+0xdbc:   	bneg,a	_kref+0xdd4
	.word	0x807c801a	! t0_kref+0xdc0:   	sdiv	%l2, %i2, %g0
	.word	0x989a4012	! t0_kref+0xdc4:   	xorcc	%o1, %l2, %o4
	.word	0xe6262018	! t0_kref+0xdc8:   	st	%l3, [%i0 + 0x18]
	.word	0x9bb54100	! t0_kref+0xdcc:   	edge32	%l5, %g0, %o5
	.word	0xd8ce9019	! t0_kref+0xdd0:   	ldsba	[%i2 + %i1]0x80, %o4
	.word	0x81858000	! t0_kref+0xdd4:   	wr	%l6, %g0, %y
	.word	0xa3a018cc	! t0_kref+0xdd8:   	fdtos	%f12, %f17
	.word	0x9a0c8013	! t0_kref+0xddc:   	and	%l2, %l3, %o5
	.word	0x968d8013	! t0_kref+0xde0:   	andcc	%l6, %l3, %o3
	call	SYM(t0_subr3)
	.word	0x81de001e	! t0_kref+0xde8:   	flush	%i0 + %fp
	.word	0x952c601a	! t0_kref+0xdec:   	sll	%l1, 0x1a, %o2
	.word	0xabb007b2	! t0_kref+0xdf0:   	fpackfix	%f18, %f21
	.word	0x94b24008	! t0_kref+0xdf4:   	orncc	%o1, %o0, %o2
	.word	0x912a0009	! t0_kref+0xdf8:   	sll	%o0, %o1, %o0
	.word	0xe43e6010	! t0_kref+0xdfc:   	std	%l2, [%i1 + 0x10]
	.word	0x3d480003	! t0_kref+0xe00:   	fbule,a,pt	%fcc0, _kref+0xe0c
	.word	0x81580000	! t0_kref+0xe04:   	flushw
	.word	0x8fa4493b	! t0_kref+0xe08:   	fmuls	%f17, %f27, %f7
	.word	0x99b48f82	! t0_kref+0xe0c:   	for	%f18, %f2, %f12
	.word	0x9da68833	! t0_kref+0xe10:   	fadds	%f26, %f19, %f14
	.word	0x941b778b	! t0_kref+0xe14:   	xor	%o5, -0x875, %o2
	.word	0xd8066004	! t0_kref+0xe18:   	ld	[%i1 + 4], %o4
	.word	0x9a3d8012	! t0_kref+0xe1c:   	xnor	%l6, %l2, %o5
	.word	0x9a8c8010	! t0_kref+0xe20:   	andcc	%l2, %l0, %o5
	.word	0xda0e401a	! t0_kref+0xe24:   	ldub	[%i1 + %i2], %o5
	.word	0x9fc10000	! t0_kref+0xe28:   	call	%g4
	.word	0xd4060000	! t0_kref+0xe2c:   	ld	[%i0], %o2
	.word	0x85b48e80	! t0_kref+0xe30:   	fsrc1	%f18, %f2
	.word	0xa5b0cdb4	! t0_kref+0xe34:   	fxors	%f3, %f20, %f18
	.word	0xada40837	! t0_kref+0xe38:   	fadds	%f16, %f23, %f22
	.word	0x8da0012f	! t0_kref+0xe3c:   	fabss	%f15, %f6
	.word	0xe428a014	! t0_kref+0xe40:   	stb	%l2, [%g2 + 0x14]
	.word	0xc36e6000	! t0_kref+0xe44:   	prefetch	%i1, 1
	.word	0xd2500018	! t0_kref+0xe48:   	ldsh	[%g0 + %i0], %o1
	.word	0xada01917	! t0_kref+0xe4c:   	fitod	%f23, %f22
	.word	0x20800006	! t0_kref+0xe50:   	bn,a	_kref+0xe68
	.word	0x9655b757	! t0_kref+0xe54:   	umul	%l6, -0x8a9, %o3
	.word	0xee080019	! t0_kref+0xe58:   	ldub	[%g0 + %i1], %l7
	.word	0xd4803fec	! t0_kref+0xe5c:   	lda	[%g0 - 0x14]%asi, %o2
	.word	0xa7a00122	! t0_kref+0xe60:   	fabss	%f2, %f19
	.word	0xaea6bae7	! t0_kref+0xe64:   	subcc	%i2, -0x519, %l7
	.word	0xede65014	! t0_kref+0xe68:   	casa	[%i1]0x80, %l4, %l6
	.word	0xd60e7ff2	! t0_kref+0xe6c:   	ldub	[%i1 - 0xe], %o3
	.word	0xee28a036	! t0_kref+0xe70:   	stb	%l7, [%g2 + 0x36]
	.word	0x35800008	! t0_kref+0xe74:   	fbue,a	_kref+0xe94
	.word	0x80b50013	! t0_kref+0xe78:   	orncc	%l4, %l3, %g0
	.word	0x95a2c839	! t0_kref+0xe7c:   	fadds	%f11, %f25, %f10
	.word	0x90820000	! t0_kref+0xe80:   	addcc	%o0, %g0, %o0
	.word	0x93b4c335	! t0_kref+0xe84:   	bmask	%l3, %l5, %o1
	.word	0xd1be580a	! t0_kref+0xe88:   	stda	%f8, [%i1 + %o2]0xc0
	.word	0xae62224a	! t0_kref+0xe8c:   	subc	%o0, 0x24a, %l7
	.word	0x9eb53ec9	! t0_kref+0xe90:   	orncc	%l4, -0x137, %o7
	.word	0x8ba000ad	! t0_kref+0xe94:   	fnegs	%f13, %f5
	.word	0xc0480018	! t0_kref+0xe98:   	ldsb	[%g0 + %i0], %g0
	.word	0x9da018ca	! t0_kref+0xe9c:   	fdtos	%f10, %f14
	.word	0x3d800005	! t0_kref+0xea0:   	fbule,a	_kref+0xeb4
	.word	0x81a00556	! t0_kref+0xea4:   	fsqrtd	%f22, %f0
	.word	0xd5e61008	! t0_kref+0xea8:   	casa	[%i0]0x80, %o0, %o2
	.word	0x89a00131	! t0_kref+0xeac:   	fabss	%f17, %f4
	.word	0x2f800003	! t0_kref+0xeb0:   	fbu,a	_kref+0xebc
	.word	0xe62e4000	! t0_kref+0xeb4:   	stb	%l3, [%i1]
	.word	0x9e7cc012	! t0_kref+0xeb8:   	sdiv	%l3, %l2, %o7
	call	SYM(t0_subr3)
	.word	0x9adb0008	! t0_kref+0xec0:   	smulcc	%o4, %o0, %o5
	.word	0x3c800001	! t0_kref+0xec4:   	bpos,a	_kref+0xec8
	.word	0x85b0870d	! t0_kref+0xec8:   	fmuld8sux16	%f2, %f13, %f2
	.word	0xff6e401a	! t0_kref+0xecc:   	prefetch	%i1 + %i2, 31
	.word	0xde4e3ff3	! t0_kref+0xed0:   	ldsb	[%i0 - 0xd], %o7
	.word	0x25800006	! t0_kref+0xed4:   	fblg,a	_kref+0xeec
	.word	0xd60e4000	! t0_kref+0xed8:   	ldub	[%i1], %o3
	.word	0xae34e915	! t0_kref+0xedc:   	orn	%l3, 0x915, %l7
	.word	0x91a01913	! t0_kref+0xee0:   	fitod	%f19, %f8
	.word	0x99a3482a	! t0_kref+0xee4:   	fadds	%f13, %f10, %f12
	.word	0xe81e4000	! t0_kref+0xee8:   	ldd	[%i1], %l4
	.word	0x983d0014	! t0_kref+0xeec:   	xnor	%l4, %l4, %o4
	.word	0xe43e7ff8	! t0_kref+0xef0:   	std	%l2, [%i1 - 8]
	.word	0x89a000b9	! t0_kref+0xef4:   	fnegs	%f25, %f4
	.word	0x3e800006	! t0_kref+0xef8:   	bvc,a	_kref+0xf10
	.word	0x96352ea2	! t0_kref+0xefc:   	orn	%l4, 0xea2, %o3
	.word	0xa5a01918	! t0_kref+0xf00:   	fitod	%f24, %f18
	.word	0xee4e7ff7	! t0_kref+0xf04:   	ldsb	[%i1 - 9], %l7
	.word	0xd91fbe98	! t0_kref+0xf08:   	ldd	[%fp - 0x168], %f12
	.word	0x87a0053a	! t0_kref+0xf0c:   	fsqrts	%f26, %f3
	.word	0x99b70556	! t0_kref+0xf10:   	fcmpeq16	%f28, %f22, %o4
	.word	0xf93e3ff0	! t0_kref+0xf14:   	std	%f28, [%i0 - 0x10]
	.word	0xb5b68e58	! t0_kref+0xf18:   	fxnor	%f26, %f24, %f26
	.word	0xb1ab8046	! t0_kref+0xf1c:   	fmovdule	%fcc0, %f6, %f24
	.word	0x91a68844	! t0_kref+0xf20:   	faddd	%f26, %f4, %f8
	.word	0x81800000	! t0_kref+0xf24:   	mov	%g0, %y
	.word	0x91b007b6	! t0_kref+0xf28:   	fpackfix	%f22, %f8
	.word	0x95a01a22	! t0_kref+0xf2c:   	fstoi	%f2, %f10
	.word	0xf11e6010	! t0_kref+0xf30:   	ldd	[%i1 + 0x10], %f24
	.word	0x95b58e46	! t0_kref+0xf34:   	fxnor	%f22, %f6, %f10
	.word	0x81a80ad8	! t0_kref+0xf38:   	fcmped	%fcc0, %f0, %f24
	.word	0xcd20a000	! t0_kref+0xf3c:   	st	%f6, [%g2]
	.word	0xe1064000	! t0_kref+0xf40:   	ld	[%i1], %f16
	.word	0xae9d3961	! t0_kref+0xf44:   	xorcc	%l4, -0x69f, %l7
	.word	0x99a0192e	! t0_kref+0xf48:   	fstod	%f14, %f12
	.word	0xaf408000	! t0_kref+0xf4c:   	mov	%ccr, %l7
	.word	0xaf600013	! t0_kref+0xf50:   	movn	%fcc0, %l3, %l7
	.word	0x24800004	! t0_kref+0xf54:   	ble,a	_kref+0xf64
	.word	0x94827b8f	! t0_kref+0xf58:   	addcc	%o1, -0x471, %o2
	.word	0x3f800006	! t0_kref+0xf5c:   	fbo,a	_kref+0xf74
	.word	0xee0e2009	! t0_kref+0xf60:   	ldub	[%i0 + 9], %l7
	.word	0x2f480002	! t0_kref+0xf64:   	fbu,a,pt	%fcc0, _kref+0xf6c
	.word	0x92928010	! t0_kref+0xf68:   	orcc	%o2, %l0, %o1
	.word	0xa7a01a2f	! t0_kref+0xf6c:   	fstoi	%f15, %f19
	.word	0x985476ce	! t0_kref+0xf70:   	umul	%l1, -0x932, %o4
	.word	0x94b28016	! t0_kref+0xf74:   	orncc	%o2, %l6, %o2
	.word	0xfb6e401d	! t0_kref+0xf78:   	prefetch	%i1 + %i5, 29
	.word	0xec1f4018	! t0_kref+0xf7c:   	ldd	[%i5 + %i0], %l6
	.word	0xafb5434c	! t0_kref+0xf80:   	alignaddrl	%l5, %o4, %l7
	.word	0xb5b48754	! t0_kref+0xf84:   	fpack32	%f18, %f20, %f26
	.word	0x29480007	! t0_kref+0xf88:   	fbl,a,pt	%fcc0, _kref+0xfa4
	.word	0xee08a006	! t0_kref+0xf8c:   	ldub	[%g2 + 6], %l7
	.word	0x3b480003	! t0_kref+0xf90:   	fble,a,pt	%fcc0, _kref+0xf9c
	.word	0xd22e3fea	! t0_kref+0xf94:   	stb	%o1, [%i0 - 0x16]
	.word	0x9da01909	! t0_kref+0xf98:   	fitod	%f9, %f14
	.word	0xb5a01a5a	! t0_kref+0xf9c:   	fdtoi	%f26, %f26
	.word	0xed1fbd30	! t0_kref+0xfa0:   	ldd	[%fp - 0x2d0], %f22
	.word	0x91b48dbb	! t0_kref+0xfa4:   	fxors	%f18, %f27, %f8
	.word	0x89b58ea0	! t0_kref+0xfa8:   	fsrc1s	%f22, %f4
	.word	0x9fc00004	! t0_kref+0xfac:   	call	%g0 + %g4
	.word	0xe106601c	! t0_kref+0xfb0:   	ld	[%i1 + 0x1c], %f16
	.word	0x928568bb	! t0_kref+0xfb4:   	addcc	%l5, 0x8bb, %o1
	.word	0xe83e3fe8	! t0_kref+0xfb8:   	std	%l4, [%i0 - 0x18]
	.word	0x9fc10000	! t0_kref+0xfbc:   	call	%g4
	.word	0xaebda031	! t0_kref+0xfc0:   	xnorcc	%l6, 0x31, %l7
	.word	0xf007bfe0	! t0_kref+0xfc4:   	ld	[%fp - 0x20], %i0
	.word	0xeedf5019	! t0_kref+0xfc8:   	ldxa	[%i5 + %i1]0x80, %l7
	.word	0x9da209c2	! t0_kref+0xfcc:   	fdivd	%f8, %f2, %f14
	.word	0x81858000	! t0_kref+0xfd0:   	wr	%l6, %g0, %y
	.word	0x969aa0ca	! t0_kref+0xfd4:   	xorcc	%o2, 0xca, %o3
	.word	0xe168a00b	! t0_kref+0xfd8:   	prefetch	%g2 + 0xb, 16
	.word	0xb1b50758	! t0_kref+0xfdc:   	fpack32	%f20, %f24, %f24
	.word	0x9e7c7e15	! t0_kref+0xfe0:   	sdiv	%l1, -0x1eb, %o7
	.word	0x9f408000	! t0_kref+0xfe4:   	mov	%ccr, %o7
	.word	0xe1bf1a59	! t0_kref+0xfe8:   	stda	%f16, [%i4 + %i1]0xd2
	.word	0x3c800003	! t0_kref+0xfec:   	bpos,a	_kref+0xff8
	.word	0xa5a000d6	! t0_kref+0xff0:   	fnegd	%f22, %f18
	.word	0x97a00124	! t0_kref+0xff4:   	fabss	%f4, %f11
	.word	0x81820000	! t0_kref+0xff8:   	wr	%o0, %g0, %y
	.word	0x99a01a54	! t0_kref+0xffc:   	fdtoi	%f20, %f12
	.word	0xd1e6500d	! t0_kref+0x1000:   	casa	[%i1]0x80, %o5, %o0
	.word	0xc028a035	! t0_kref+0x1004:   	clrb	[%g2 + 0x35]
	.word	0x92ac8000	! t0_kref+0x1008:   	andncc	%l2, %g0, %o1
	.word	0xaeb57fbb	! t0_kref+0x100c:   	orncc	%l5, -0x45, %l7
	.word	0xb9a0191d	! t0_kref+0x1010:   	fitod	%f29, %f28
	.word	0x908828f0	! t0_kref+0x1014:   	andcc	%g0, 0x8f0, %o0
	.word	0xafb000b7	! t0_kref+0x1018:   	edge16n	%g0, %l7, %l7
	.word	0x952ac014	! t0_kref+0x101c:   	sll	%o3, %l4, %o2
	.word	0x2b480003	! t0_kref+0x1020:   	fbug,a,pt	%fcc0, _kref+0x102c
	.word	0x8185c000	! t0_kref+0x1024:   	wr	%l7, %g0, %y
	.word	0xd8ae9018	! t0_kref+0x1028:   	stba	%o4, [%i2 + %i0]0x80
	.word	0x94d8000c	! t0_kref+0x102c:   	smulcc	%g0, %o4, %o2
	.word	0xc00e6013	! t0_kref+0x1030:   	ldub	[%i1 + 0x13], %g0
	.word	0x99a01901	! t0_kref+0x1034:   	fitod	%f1, %f12
	.word	0xc99eda58	! t0_kref+0x1038:   	ldda	[%i3 + %i0]0xd2, %f4
	.word	0x987a7d6f	! t0_kref+0x103c:   	sdiv	%o1, -0x291, %o4
	.word	0xec1e6000	! t0_kref+0x1040:   	ldd	[%i1], %l6
	.word	0xf500a000	! t0_kref+0x1044:   	ld	[%g2], %f26
	.word	0x28480004	! t0_kref+0x1048:   	bleu,a,pt	%icc, _kref+0x1058
	.word	0xd4680018	! t0_kref+0x104c:   	ldstub	[%g0 + %i0], %o2
	.word	0xc04e7fe3	! t0_kref+0x1050:   	ldsb	[%i1 - 0x1d], %g0
	.word	0xec1e2018	! t0_kref+0x1054:   	ldd	[%i0 + 0x18], %l6
	.word	0x21800004	! t0_kref+0x1058:   	fbn,a	_kref+0x1068
	.word	0x9b2c400d	! t0_kref+0x105c:   	sll	%l1, %o5, %o5
	.word	0xa5b28f88	! t0_kref+0x1060:   	for	%f10, %f8, %f18
	.word	0x2f480007	! t0_kref+0x1064:   	fbu,a,pt	%fcc0, _kref+0x1080
	.word	0x81b2c0cb	! t0_kref+0x1068:   	edge16l	%o3, %o3, %g0
	.word	0x9fb34140	! t0_kref+0x106c:   	edge32l	%o5, %g0, %o7
	.word	0x9f3c8009	! t0_kref+0x1070:   	sra	%l2, %o1, %o7
	.word	0xea2e7fe8	! t0_kref+0x1074:   	stb	%l5, [%i1 - 0x18]
	.word	0x30800003	! t0_kref+0x1078:   	ba,a	_kref+0x1084
	.word	0xda480019	! t0_kref+0x107c:   	ldsb	[%g0 + %i1], %o5
	.word	0x81b01025	! t0_kref+0x1080:   	siam	0x5
	.word	0x9fa01a36	! t0_kref+0x1084:   	fstoi	%f22, %f15
	.word	0xe1be180b	! t0_kref+0x1088:   	stda	%f16, [%i0 + %o3]0xc0
	.word	0x902c34f7	! t0_kref+0x108c:   	andn	%l0, -0xb09, %o0
	.word	0x97224017	! t0_kref+0x1090:   	mulscc	%o1, %l7, %o3
	.word	0x9e7c3755	! t0_kref+0x1094:   	sdiv	%l0, -0x8ab, %o7
	.word	0xe99e5a5c	! t0_kref+0x1098:   	ldda	[%i1 + %i4]0xd2, %f20
	.word	0xaf25f5d3	! t0_kref+0x109c:   	mulscc	%l7, -0xa2d, %l7
	.word	0x95b20356	! t0_kref+0x10a0:   	alignaddrl	%o0, %l6, %o2
	.word	0x33480002	! t0_kref+0x10a4:   	fbe,a,pt	%fcc0, _kref+0x10ac
	.word	0xec1e6008	! t0_kref+0x10a8:   	ldd	[%i1 + 8], %l6
	.word	0xc99f5058	! t0_kref+0x10ac:   	ldda	[%i5 + %i0]0x82, %f4
	.word	0xb5b4063a	! t0_kref+0x10b0:   	fmul8x16	%f16, %f26, %f26
	.word	0x8143e040	! t0_kref+0x10b4:   	membar	0x40
	.word	0x98342faa	! t0_kref+0x10b8:   	orn	%l0, 0xfaa, %o4
	.word	0x9db30e80	! t0_kref+0x10bc:   	fsrc1	%f12, %f14
	.word	0xd40e7fea	! t0_kref+0x10c0:   	ldub	[%i1 - 0x16], %o2
	.word	0x80a30016	! t0_kref+0x10c4:   	cmp	%o4, %l6
	.word	0xee20a00c	! t0_kref+0x10c8:   	st	%l7, [%g2 + 0xc]
	.word	0xb9a08946	! t0_kref+0x10cc:   	fmuld	%f2, %f6, %f28
	.word	0xadb28f8c	! t0_kref+0x10d0:   	for	%f10, %f12, %f22
	.word	0xe36e401d	! t0_kref+0x10d4:   	prefetch	%i1 + %i5, 17
	.word	0x9262800c	! t0_kref+0x10d8:   	subc	%o2, %o4, %o1
	.word	0x3e480008	! t0_kref+0x10dc:   	bvc,a,pt	%icc, _kref+0x10fc
	.word	0x9e1a400c	! t0_kref+0x10e0:   	xor	%o1, %o4, %o7
	.word	0x20800005	! t0_kref+0x10e4:   	bn,a	_kref+0x10f8
	.word	0x173d0eb2	! t0_kref+0x10e8:   	sethi	%hi(0xf43ac800), %o3
	.word	0xe47e7ffc	! t0_kref+0x10ec:   	swap	[%i1 - 4], %l2
	.word	0x29480008	! t0_kref+0x10f0:   	fbl,a,pt	%fcc0, _kref+0x1110
	.word	0xd8280018	! t0_kref+0x10f4:   	stb	%o4, [%g0 + %i0]
	.word	0x95268013	! t0_kref+0x10f8:   	mulscc	%i2, %l3, %o2
	.word	0x33800003	! t0_kref+0x10fc:   	fbe,a	_kref+0x1108
	.word	0x9264e0e0	! t0_kref+0x1100:   	subc	%l3, 0xe0, %o1
	.word	0x9324400c	! t0_kref+0x1104:   	mulscc	%l1, %o4, %o1
	.word	0xa9a00522	! t0_kref+0x1108:   	fsqrts	%f2, %f20
	.word	0x9482c009	! t0_kref+0x110c:   	addcc	%o3, %o1, %o2
	.word	0xb5a3c8a6	! t0_kref+0x1110:   	fsubs	%f15, %f6, %f26
	.word	0x9fc10000	! t0_kref+0x1114:   	call	%g4
	.word	0xa1b40151	! t0_kref+0x1118:   	edge32l	%l0, %l1, %l0
	.word	0x91b240ca	! t0_kref+0x111c:   	edge16l	%o1, %o2, %o0
	.word	0xd60e3fef	! t0_kref+0x1120:   	ldub	[%i0 - 0x11], %o3
	.word	0xb3b24d3d	! t0_kref+0x1124:   	fandnot1s	%f9, %f29, %f25
	.word	0xae9d000b	! t0_kref+0x1128:   	xorcc	%l4, %o3, %l7
	.word	0x38800004	! t0_kref+0x112c:   	bgu,a	_kref+0x113c
	.word	0x93228014	! t0_kref+0x1130:   	mulscc	%o2, %l4, %o1
	.word	0xd2562004	! t0_kref+0x1134:   	ldsh	[%i0 + 4], %o1
	.word	0x987b400d	! t0_kref+0x1138:   	sdiv	%o5, %o5, %o4
	.word	0x81ab8a56	! t0_kref+0x113c:   	fcmpd	%fcc0, %f14, %f22
	.word	0x98ad0009	! t0_kref+0x1140:   	andncc	%l4, %o1, %o4
	.word	0xee262014	! t0_kref+0x1144:   	st	%l7, [%i0 + 0x14]
	.word	0xe43e3ff0	! t0_kref+0x1148:   	std	%l2, [%i0 - 0x10]
	.word	0xd24e2007	! t0_kref+0x114c:   	ldsb	[%i0 + 7], %o1
	.word	0x30800006	! t0_kref+0x1150:   	ba,a	_kref+0x1168
	.word	0xe51fbd38	! t0_kref+0x1154:   	ldd	[%fp - 0x2c8], %f18
	.word	0xa7b54a6e	! t0_kref+0x1158:   	fpadd32s	%f21, %f14, %f19
	.word	0x26480001	! t0_kref+0x115c:   	bl,a,pt	%icc, _kref+0x1160
	.word	0x9da01a24	! t0_kref+0x1160:   	fstoi	%f4, %f14
	.word	0x90600013	! t0_kref+0x1164:   	subc	%g0, %l3, %o0
	.word	0xef68a005	! t0_kref+0x1168:   	prefetch	%g2 + 5, 23
	.word	0x85a38848	! t0_kref+0x116c:   	faddd	%f14, %f8, %f2
	.word	0x96be8017	! t0_kref+0x1170:   	xnorcc	%i2, %l7, %o3
	.word	0xa1a01a3b	! t0_kref+0x1174:   	fstoi	%f27, %f16
	.word	0xae5b0014	! t0_kref+0x1178:   	smul	%o4, %l4, %l7
	.word	0x25800001	! t0_kref+0x117c:   	fblg,a	_kref+0x1180
	.word	0x9e3b3617	! t0_kref+0x1180:   	xnor	%o4, -0x9e9, %o7
	.word	0x96834016	! t0_kref+0x1184:   	addcc	%o5, %l6, %o3
	.word	0xd2d01018	! t0_kref+0x1188:   	ldsha	[%g0 + %i0]0x80, %o1
	.word	0xec2e6006	! t0_kref+0x118c:   	stb	%l6, [%i1 + 6]
	.word	0x90c4c012	! t0_kref+0x1190:   	addccc	%l3, %l2, %o0
	.word	0x99b340ec	! t0_kref+0x1194:   	edge16ln	%o5, %o4, %o4
	.word	0x31480008	! t0_kref+0x1198:   	fba,a,pt	%fcc0, _kref+0x11b8
	.word	0x96b3338f	! t0_kref+0x119c:   	orncc	%o4, -0xc71, %o3
	.word	0xf1be1855	! t0_kref+0x11a0:   	stda	%f24, [%i0 + %l5]0xc2
	.word	0xd610a01e	! t0_kref+0x11a4:   	lduh	[%g2 + 0x1e], %o3
	.word	0x95a0110e	! t0_kref+0x11a8:   	fxtod	%f14, %f10
	.word	0xd8b6101b	! t0_kref+0x11ac:   	stha	%o4, [%i0 + %i3]0x80
	.word	0x933b0015	! t0_kref+0x11b0:   	sra	%o4, %l5, %o1
	.word	0x963d6bfe	! t0_kref+0x11b4:   	xnor	%l5, 0xbfe, %o3
	.word	0x95b3415a	! t0_kref+0x11b8:   	edge32l	%o5, %i2, %o2
	.word	0x92d4800b	! t0_kref+0x11bc:   	umulcc	%l2, %o3, %o1
	.word	0xb9a00027	! t0_kref+0x11c0:   	fmovs	%f7, %f28
	.word	0x9fb3840c	! t0_kref+0x11c4:   	fcmple16	%f14, %f12, %o7
	.word	0x36480006	! t0_kref+0x11c8:   	bge,a,pt	%icc, _kref+0x11e0
	.word	0xd84e7ff1	! t0_kref+0x11cc:   	ldsb	[%i1 - 0xf], %o4
	.word	0x21800006	! t0_kref+0x11d0:   	fbn,a	_kref+0x11e8
	.word	0xc768a043	! t0_kref+0x11d4:   	prefetch	%g2 + 0x43, 3
	.word	0x81858000	! t0_kref+0x11d8:   	wr	%l6, %g0, %y
	.word	0x92bab615	! t0_kref+0x11dc:   	xnorcc	%o2, -0x9eb, %o1
	.word	0xdae81019	! t0_kref+0x11e0:   	ldstuba	[%g0 + %i1]0x80, %o5
	.word	0x80668015	! t0_kref+0x11e4:   	subc	%i2, %l5, %g0
	call	SYM(t0_subr1)
	.word	0x97b20492	! t0_kref+0x11ec:   	fcmple32	%f8, %f18, %o3
	.word	0x980d21bf	! t0_kref+0x11f0:   	and	%l4, 0x1bf, %o4
	.word	0xf91fbc98	! t0_kref+0x11f4:   	ldd	[%fp - 0x368], %f28
	.word	0x800d4016	! t0_kref+0x11f8:   	and	%l5, %l6, %g0
	.word	0x22800003	! t0_kref+0x11fc:   	be,a	_kref+0x1208
	.word	0xe22e3ffd	! t0_kref+0x1200:   	stb	%l1, [%i0 - 3]
	.word	0x85a00127	! t0_kref+0x1204:   	fabss	%f7, %f2
	.word	0x1b0286dc	! t0_kref+0x1208:   	sethi	%hi(0xa1b7000), %o5
	.word	0xd2062014	! t0_kref+0x120c:   	ld	[%i0 + 0x14], %o1
	.word	0x29480004	! t0_kref+0x1210:   	fbl,a,pt	%fcc0, _kref+0x1220
	.word	0x952c8008	! t0_kref+0x1214:   	sll	%l2, %o0, %o2
	.word	0x967d400c	! t0_kref+0x1218:   	sdiv	%l5, %o4, %o3
	.word	0xd40e4000	! t0_kref+0x121c:   	ldub	[%i1], %o2
	.word	0x96deba45	! t0_kref+0x1220:   	smulcc	%i2, -0x5bb, %o3
	.word	0xe4266000	! t0_kref+0x1224:   	st	%l2, [%i1]
	.word	0x3d800001	! t0_kref+0x1228:   	fbule,a	_kref+0x122c
	.word	0xd8f75018	! t0_kref+0x122c:   	stxa	%o4, [%i5 + %i0]0x80
	.word	0x3c480003	! t0_kref+0x1230:   	bpos,a,pt	%icc, _kref+0x123c
	.word	0xa5a00146	! t0_kref+0x1234:   	fabsd	%f6, %f18
	.word	0x20480003	! t0_kref+0x1238:   	bn,a,pt	%icc, _kref+0x1244
	.word	0xea30a020	! t0_kref+0x123c:   	sth	%l5, [%g2 + 0x20]
	.word	0x20800004	! t0_kref+0x1240:   	bn,a	_kref+0x1250
	.word	0xe4fe501c	! t0_kref+0x1244:   	swapa	[%i1 + %i4]0x80, %l2
	.word	0xc07f0018	! t0_kref+0x1248:   	swap	[%i4 + %i0], %g0
	.word	0x961d2704	! t0_kref+0x124c:   	xor	%l4, 0x704, %o3
	.word	0xd856c018	! t0_kref+0x1250:   	ldsh	[%i3 + %i0], %o4
	.word	0x811b75ec	! t0_kref+0x1254:   	tsubcctv	%o5, -0xa14, %g0
	.word	0x9834772a	! t0_kref+0x1258:   	orn	%l1, -0x8d6, %o4
	.word	0x112c88ed	! t0_kref+0x125c:   	sethi	%hi(0xb223b400), %o0
	.word	0xa5b0875c	! t0_kref+0x1260:   	fpack32	%f2, %f28, %f18
	.word	0xd4d6501b	! t0_kref+0x1264:   	ldsha	[%i1 + %i3]0x80, %o2
	.word	0x921abea8	! t0_kref+0x1268:   	xor	%o2, -0x158, %o1
	.word	0xb5a60848	! t0_kref+0x126c:   	faddd	%f24, %f8, %f26
	.word	0xdace1000	! t0_kref+0x1270:   	ldsba	[%i0]0x80, %o5
	.word	0xed6e401b	! t0_kref+0x1274:   	prefetch	%i1 + %i3, 22
	.word	0xb5b38918	! t0_kref+0x1278:   	faligndata	%f14, %f24, %f26
	.word	0xb1a01a4c	! t0_kref+0x127c:   	fdtoi	%f12, %f24
	.word	0xe9ee501d	! t0_kref+0x1280:   	prefetcha	%i1 + %i5, 20
	.word	0xa1a0193a	! t0_kref+0x1284:   	fstod	%f26, %f16
	.word	0x9f003e26	! t0_kref+0x1288:   	taddcc	%g0, -0x1da, %o7
	.word	0xe67f0019	! t0_kref+0x128c:   	swap	[%i4 + %i1], %l3
	.word	0x94802b5c	! t0_kref+0x1290:   	addcc	%g0, 0xb5c, %o2
	.word	0x9ed37fff	! t0_kref+0x1294:   	umulcc	%o5, -0x1, %o7
	.word	0xafa018d8	! t0_kref+0x1298:   	fdtos	%f24, %f23
	.word	0x2d480004	! t0_kref+0x129c:   	fbg,a,pt	%fcc0, _kref+0x12ac
	.word	0xde56200e	! t0_kref+0x12a0:   	ldsh	[%i0 + 0xe], %o7
	.word	0x2c800003	! t0_kref+0x12a4:   	bneg,a	_kref+0x12b0
	.word	0xd6563ff0	! t0_kref+0x12a8:   	ldsh	[%i0 - 0x10], %o3
	.word	0xaba01a4c	! t0_kref+0x12ac:   	fdtoi	%f12, %f21
	.word	0xa9b58e12	! t0_kref+0x12b0:   	fand	%f22, %f18, %f20
	.word	0x985e800d	! t0_kref+0x12b4:   	smul	%i2, %o5, %o4
	.word	0x2f34a5a2	! t0_kref+0x12b8:   	sethi	%hi(0xd2968800), %l7
	.word	0x98e68014	! t0_kref+0x12bc:   	subccc	%i2, %l4, %o4
	.word	0x9665c000	! t0_kref+0x12c0:   	subc	%l7, %g0, %o3
	.word	0x9eb57f86	! t0_kref+0x12c4:   	orncc	%l5, -0x7a, %o7
	.word	0x2f1bf4be	! t0_kref+0x12c8:   	sethi	%hi(0x6fd2f800), %l7
	.word	0x927afab9	! t0_kref+0x12cc:   	sdiv	%o3, -0x547, %o1
	.word	0x94640017	! t0_kref+0x12d0:   	subc	%l0, %l7, %o2
	call	SYM(t0_subr3)
	.word	0x81b50151	! t0_kref+0x12d8:   	edge32l	%l4, %l1, %g0
	.word	0x9db286cc	! t0_kref+0x12dc:   	fmul8sux16	%f10, %f12, %f14
	.word	0x21800008	! t0_kref+0x12e0:   	fbn,a	_kref+0x1300
	.word	0x927a8008	! t0_kref+0x12e4:   	sdiv	%o2, %o0, %o1
	.word	0x3f480004	! t0_kref+0x12e8:   	fbo,a,pt	%fcc0, _kref+0x12f8
	.word	0xc76e3ff8	! t0_kref+0x12ec:   	prefetch	%i0 - 8, 3
	.word	0x29480006	! t0_kref+0x12f0:   	fbl,a,pt	%fcc0, _kref+0x1308
	.word	0xa1a0055c	! t0_kref+0x12f4:   	fsqrtd	%f28, %f16
	.word	0xb1b70ed2	! t0_kref+0x12f8:   	fornot2	%f28, %f18, %f24
	.word	0x80823411	! t0_kref+0x12fc:   	addcc	%o0, -0xbef, %g0
	.word	0xae7ea5e4	! t0_kref+0x1300:   	sdiv	%i2, 0x5e4, %l7
	.word	0x9f60c014	! t0_kref+0x1304:   	movul	%fcc0, %l4, %o7
	.word	0xefee101b	! t0_kref+0x1308:   	prefetcha	%i0 + %i3, 23
	.word	0x2d480003	! t0_kref+0x130c:   	fbg,a,pt	%fcc0, _kref+0x1318
	.word	0xeaae1000	! t0_kref+0x1310:   	stba	%l5, [%i0]0x80
	.word	0x98856a72	! t0_kref+0x1314:   	addcc	%l5, 0xa72, %o4
	.word	0x3a800006	! t0_kref+0x1318:   	bcc,a	_kref+0x1330
	.word	0xe51fbdd0	! t0_kref+0x131c:   	ldd	[%fp - 0x230], %f18
	.word	0x9322400b	! t0_kref+0x1320:   	mulscc	%o1, %o3, %o1
	.word	0x9fa01a21	! t0_kref+0x1324:   	fstoi	%f1, %f15
	.word	0x9a2d0013	! t0_kref+0x1328:   	andn	%l4, %l3, %o5
	.word	0x971cc014	! t0_kref+0x132c:   	tsubcctv	%l3, %l4, %o3
	.word	0xe67e001c	! t0_kref+0x1330:   	swap	[%i0 + %i4], %l3
	call	SYM(t0_subr2)
	.word	0xafb54090	! t0_kref+0x1338:   	edge16	%l5, %l0, %l7
	.word	0x933a6017	! t0_kref+0x133c:   	sra	%o1, 0x17, %o1
	.word	0x9db00fc0	! t0_kref+0x1340:   	fone	%f14
	.word	0x93a1c827	! t0_kref+0x1344:   	fadds	%f7, %f7, %f9
	.word	0x9f243c4d	! t0_kref+0x1348:   	mulscc	%l0, -0x3b3, %o7
	.word	0x81a9ca26	! t0_kref+0x134c:   	fcmps	%fcc0, %f7, %f6
	.word	0xa1a0054a	! t0_kref+0x1350:   	fsqrtd	%f10, %f16
	.word	0x27480004	! t0_kref+0x1354:   	fbul,a,pt	%fcc0, _kref+0x1364
	.word	0x9db08e48	! t0_kref+0x1358:   	fxnor	%f2, %f8, %f14
	.word	0x97b20050	! t0_kref+0x135c:   	edge8l	%o0, %l0, %o3
	.word	0xe06e3ff8	! t0_kref+0x1360:   	ldstub	[%i0 - 8], %l0
	.word	0xada01a44	! t0_kref+0x1364:   	fdtoi	%f4, %f22
	.word	0xaba0013c	! t0_kref+0x1368:   	fabss	%f28, %f21
	.word	0x2b480007	! t0_kref+0x136c:   	fbug,a,pt	%fcc0, _kref+0x1388
	.word	0x85a01114	! t0_kref+0x1370:   	fxtod	%f20, %f2
	.word	0x21480001	! t0_kref+0x1374:   	fbn,a,pt	%fcc0, _kref+0x1378
	.word	0x9ba0109c	! t0_kref+0x1378:   	fxtos	%f28, %f13
	.word	0xf207bfe0	! t0_kref+0x137c:   	ld	[%fp - 0x20], %i1
	.word	0x33480004	! t0_kref+0x1380:   	fbe,a,pt	%fcc0, _kref+0x1390
	.word	0x9263000b	! t0_kref+0x1384:   	subc	%o4, %o3, %o1
	.word	0xae90000b	! t0_kref+0x1388:   	orcc	%g0, %o3, %l7
	.word	0x9da00556	! t0_kref+0x138c:   	fsqrtd	%f22, %f14
	.word	0xc00e4000	! t0_kref+0x1390:   	ldub	[%i1], %g0
	.word	0xc168a087	! t0_kref+0x1394:   	prefetch	%g2 + 0x87, 0
	.word	0x9b35201f	! t0_kref+0x1398:   	srl	%l4, 0x1f, %o5
	.word	0xea20a018	! t0_kref+0x139c:   	st	%l5, [%g2 + 0x18]
	.word	0x81dcf98f	! t0_kref+0x13a0:   	flush	%l3 - 0x671
	.word	0x25800006	! t0_kref+0x13a4:   	fblg,a	_kref+0x13bc
	.word	0x94bcc012	! t0_kref+0x13a8:   	xnorcc	%l3, %l2, %o2
	.word	0xda0e3fe5	! t0_kref+0x13ac:   	ldub	[%i0 - 0x1b], %o5
	.word	0xde0e6013	! t0_kref+0x13b0:   	ldub	[%i1 + 0x13], %o7
	.word	0x9ebd4008	! t0_kref+0x13b4:   	xnorcc	%l5, %o0, %o7
	.word	0xa9b70d00	! t0_kref+0x13b8:   	fandnot1	%f28, %f0, %f20
	.word	0x32480008	! t0_kref+0x13bc:   	bne,a,pt	%icc, _kref+0x13dc
	.word	0xc00e2002	! t0_kref+0x13c0:   	ldub	[%i0 + 2], %g0
	.word	0xe076001d	! t0_kref+0x13c4:   	stx	%l0, [%i0 + %i5]
	.word	0xe830a002	! t0_kref+0x13c8:   	sth	%l4, [%g2 + 2]
	.word	0x9da000a3	! t0_kref+0x13cc:   	fnegs	%f3, %f14
	.word	0xa5b44d60	! t0_kref+0x13d0:   	fnot1s	%f17, %f18
	.word	0xa1a089c6	! t0_kref+0x13d4:   	fdivd	%f2, %f6, %f16
	.word	0x20800001	! t0_kref+0x13d8:   	bn,a	_kref+0x13dc
	.word	0x94b5ae5a	! t0_kref+0x13dc:   	orncc	%l6, 0xe5a, %o2
	.word	0x99a01034	! t0_kref+0x13e0:   	fstox	%f20, %f12
	.word	0x3b800001	! t0_kref+0x13e4:   	fble,a	_kref+0x13e8
	.word	0x90556f30	! t0_kref+0x13e8:   	umul	%l5, 0xf30, %o0
	.word	0x968d0012	! t0_kref+0x13ec:   	andcc	%l4, %l2, %o3
	.word	0x803ebf23	! t0_kref+0x13f0:   	xnor	%i2, -0xdd, %g0
	.word	0x22800004	! t0_kref+0x13f4:   	be,a	_kref+0x1404
	.word	0x9524800d	! t0_kref+0x13f8:   	mulscc	%l2, %o5, %o2
	.word	0x3b800008	! t0_kref+0x13fc:   	fble,a	_kref+0x141c
	.word	0x1324144d	! t0_kref+0x1400:   	sethi	%hi(0x90513400), %o1
	.word	0x97b580d3	! t0_kref+0x1404:   	edge16l	%l6, %l3, %o3
	.word	0x30480001	! t0_kref+0x1408:   	ba,a,pt	%icc, _kref+0x140c
	.word	0x97b68aa9	! t0_kref+0x140c:   	fpsub16s	%f26, %f9, %f11
	.word	0x2e800006	! t0_kref+0x1410:   	bvs,a	_kref+0x1428
	.word	0x92122338	! t0_kref+0x1414:   	or	%o0, 0x338, %o1
	.word	0x95a01a28	! t0_kref+0x1418:   	fstoi	%f8, %f10
	.word	0x95a018d4	! t0_kref+0x141c:   	fdtos	%f20, %f10
	.word	0x811c4014	! t0_kref+0x1420:   	tsubcctv	%l1, %l4, %g0
	.word	0x33800002	! t0_kref+0x1424:   	fbe,a	_kref+0x142c
	.word	0xee36c018	! t0_kref+0x1428:   	sth	%l7, [%i3 + %i0]
	.word	0xe020a004	! t0_kref+0x142c:   	st	%l0, [%g2 + 4]
	.word	0x9db18c58	! t0_kref+0x1430:   	fnor	%f6, %f24, %f14
	.word	0xaefc8009	! t0_kref+0x1434:   	sdivcc	%l2, %o1, %l7
	.word	0xe81e401d	! t0_kref+0x1438:   	ldd	[%i1 + %i5], %l4
	.word	0x81a01934	! t0_kref+0x143c:   	fstod	%f20, %f0
	.word	0xae7aaf59	! t0_kref+0x1440:   	sdiv	%o2, 0xf59, %l7
	.word	0xae142ccf	! t0_kref+0x1444:   	or	%l0, 0xccf, %l7
	.word	0x26800004	! t0_kref+0x1448:   	bl,a	_kref+0x1458
	.word	0x9e523c99	! t0_kref+0x144c:   	umul	%o0, -0x367, %o7
	.word	0x97b44348	! t0_kref+0x1450:   	alignaddrl	%l1, %o0, %o3
	.word	0xeb68a04e	! t0_kref+0x1454:   	prefetch	%g2 + 0x4e, 21
	.word	0x9e65f33a	! t0_kref+0x1458:   	subc	%l7, -0xcc6, %o7
	.word	0x9add7b08	! t0_kref+0x145c:   	smulcc	%l5, -0x4f8, %o5
	.word	0xa5b00f88	! t0_kref+0x1460:   	for	%f0, %f8, %f18
	.word	0xa9a449ae	! t0_kref+0x1464:   	fdivs	%f17, %f14, %f20
	.word	0x011f2510	! t0_kref+0x1468:   	sethi	%hi(0x7c944000), %g0
	.word	0xd6360000	! t0_kref+0x146c:   	sth	%o3, [%i0]
	.word	0x992da00d	! t0_kref+0x1470:   	sll	%l6, 0xd, %o4
	.word	0xb3a649b4	! t0_kref+0x1474:   	fdivs	%f25, %f20, %f25
	.word	0x973d400c	! t0_kref+0x1478:   	sra	%l5, %o4, %o3
	.word	0xe1e61015	! t0_kref+0x147c:   	casa	[%i0]0x80, %l5, %l0
	.word	0x92a2400c	! t0_kref+0x1480:   	subcc	%o1, %o4, %o1
	.word	0xbba00531	! t0_kref+0x1484:   	fsqrts	%f17, %f29
	.word	0xd208a02b	! t0_kref+0x1488:   	ldub	[%g2 + 0x2b], %o1
	.word	0xa1b68902	! t0_kref+0x148c:   	faligndata	%f26, %f2, %f16
	.word	0xe53f4018	! t0_kref+0x1490:   	std	%f18, [%i5 + %i0]
	.word	0x905225cf	! t0_kref+0x1494:   	umul	%o0, 0x5cf, %o0
	.word	0x981ac017	! t0_kref+0x1498:   	xor	%o3, %l7, %o4
	.word	0x36480005	! t0_kref+0x149c:   	bge,a,pt	%icc, _kref+0x14b0
	.word	0x94648010	! t0_kref+0x14a0:   	subc	%l2, %l0, %o2
	.word	0x81830000	! t0_kref+0x14a4:   	wr	%o4, %g0, %y
	.word	0x28480007	! t0_kref+0x14a8:   	bleu,a,pt	%icc, _kref+0x14c4
	.word	0xd256001b	! t0_kref+0x14ac:   	ldsh	[%i0 + %i3], %o1
	.word	0x29800003	! t0_kref+0x14b0:   	fbl,a	_kref+0x14bc
	.word	0xa5a01050	! t0_kref+0x14b4:   	fdtox	%f16, %f18
	.word	0x2d800006	! t0_kref+0x14b8:   	fbg,a	_kref+0x14d0
	.word	0x949e801a	! t0_kref+0x14bc:   	xorcc	%i2, %i2, %o2
	.word	0x952c0010	! t0_kref+0x14c0:   	sll	%l0, %l0, %o2
	.word	0x9266b745	! t0_kref+0x14c4:   	subc	%i2, -0x8bb, %o1
	.word	0x94ac4011	! t0_kref+0x14c8:   	andncc	%l1, %l1, %o2
	.word	0x2c800008	! t0_kref+0x14cc:   	bneg,a	_kref+0x14ec
	.word	0x95a00532	! t0_kref+0x14d0:   	fsqrts	%f18, %f10
	.word	0xde865000	! t0_kref+0x14d4:   	lda	[%i1]0x80, %o7
	.word	0x81858000	! t0_kref+0x14d8:   	wr	%l6, %g0, %y
	.word	0x33480005	! t0_kref+0x14dc:   	fbe,a,pt	%fcc0, _kref+0x14f0
	.word	0xaf2c401a	! t0_kref+0x14e0:   	sll	%l1, %i2, %l7
	.word	0x99aa804c	! t0_kref+0x14e4:   	fmovdue	%fcc0, %f12, %f12
	.word	0xa9a01919	! t0_kref+0x14e8:   	fitod	%f25, %f20
	.word	0xd808a038	! t0_kref+0x14ec:   	ldub	[%g2 + 0x38], %o4
	.word	0x932b200c	! t0_kref+0x14f0:   	sll	%o4, 0xc, %o1
	.word	0x8112000d	! t0_kref+0x14f4:   	taddcctv	%o0, %o5, %g0
	.word	0x37480008	! t0_kref+0x14f8:   	fbge,a,pt	%fcc0, _kref+0x1518
	.word	0xeab6101b	! t0_kref+0x14fc:   	stha	%l5, [%i0 + %i3]0x80
	.word	0x96fa8010	! t0_kref+0x1500:   	sdivcc	%o2, %l0, %o3
	.word	0x38480006	! t0_kref+0x1504:   	bgu,a,pt	%icc, _kref+0x151c
	.word	0x9635000a	! t0_kref+0x1508:   	orn	%l4, %o2, %o3
	.word	0xda28a019	! t0_kref+0x150c:   	stb	%o5, [%g2 + 0x19]
	.word	0x81ab0a4e	! t0_kref+0x1510:   	fcmpd	%fcc0, %f12, %f14
	.word	0x9a5de249	! t0_kref+0x1514:   	smul	%l7, 0x249, %o5
	.word	0xd60e6010	! t0_kref+0x1518:   	ldub	[%i1 + 0x10], %o3
	.word	0x90656152	! t0_kref+0x151c:   	subc	%l5, 0x152, %o0
	.word	0xef68a00c	! t0_kref+0x1520:   	prefetch	%g2 + 0xc, 23
	.word	0x90846449	! t0_kref+0x1524:   	addcc	%l1, 0x449, %o0
	.word	0x81dd23a4	! t0_kref+0x1528:   	flush	%l4 + 0x3a4
	.word	0x9a1de28d	! t0_kref+0x152c:   	xor	%l7, 0x28d, %o5
	.word	0xd67e001c	! t0_kref+0x1530:   	swap	[%i0 + %i4], %o3
	.word	0xd24e2003	! t0_kref+0x1534:   	ldsb	[%i0 + 3], %o1
	.word	0xec180018	! t0_kref+0x1538:   	ldd	[%g0 + %i0], %l6
	call	SYM(t0_subr0)
	.word	0x9bb5812b	! t0_kref+0x1540:   	edge32n	%l6, %o3, %o5
	.word	0xada01905	! t0_kref+0x1544:   	fitod	%f5, %f22
	.word	0x85b48c54	! t0_kref+0x1548:   	fnor	%f18, %f20, %f2
	.word	0x980a23f6	! t0_kref+0x154c:   	and	%o0, 0x3f6, %o4
	.word	0x81b40482	! t0_kref+0x1550:   	fcmple32	%f16, %f2, %g0
	.word	0x31800003	! t0_kref+0x1554:   	fba,a	_kref+0x1560
	.word	0x9f200014	! t0_kref+0x1558:   	mulscc	%g0, %l4, %o7
	.word	0xa9b70982	! t0_kref+0x155c:   	bshuffle	%f28, %f2, %f20
	.word	0x85b007ae	! t0_kref+0x1560:   	fpackfix	%f14, %f2
	.word	0x93a01a28	! t0_kref+0x1564:   	fstoi	%f8, %f9
	.word	0x992a0008	! t0_kref+0x1568:   	sll	%o0, %o0, %o4
	.word	0x9da01a5c	! t0_kref+0x156c:   	fdtoi	%f28, %f14
	.word	0x9e64334e	! t0_kref+0x1570:   	subc	%l0, -0xcb2, %o7
	.word	0x80bb2ebe	! t0_kref+0x1574:   	xnorcc	%o4, 0xebe, %g0
	.word	0xec262018	! t0_kref+0x1578:   	st	%l6, [%i0 + 0x18]
	.word	0x36480001	! t0_kref+0x157c:   	bge,a,pt	%icc, _kref+0x1580
	.word	0xc568a089	! t0_kref+0x1580:   	prefetch	%g2 + 0x89, 2
	.word	0xf4ae101a	! t0_kref+0x1584:   	stba	%i2, [%i0 + %i2]0x80
	.word	0xc00e8019	! t0_kref+0x1588:   	ldub	[%i2 + %i1], %g0
	.word	0x985e800b	! t0_kref+0x158c:   	smul	%i2, %o3, %o4
	.word	0x809a4017	! t0_kref+0x1590:   	xorcc	%o1, %l7, %g0
	.word	0x83a3082a	! t0_kref+0x1594:   	fadds	%f12, %f10, %f1
	.word	0x2e480008	! t0_kref+0x1598:   	bvs,a,pt	%icc, _kref+0x15b8
	.word	0x81830000	! t0_kref+0x159c:   	wr	%o4, %g0, %y
	.word	0x9a1dc013	! t0_kref+0x15a0:   	xor	%l7, %l3, %o5
	.word	0xc900a01c	! t0_kref+0x15a4:   	ld	[%g2 + 0x1c], %f4
	.word	0xaba01a2e	! t0_kref+0x15a8:   	fstoi	%f14, %f21
	.word	0xd27e2014	! t0_kref+0x15ac:   	swap	[%i0 + 0x14], %o1
	.word	0x19161c7c	! t0_kref+0x15b0:   	sethi	%hi(0x5871f000), %o4
	.word	0xb5a01a46	! t0_kref+0x15b4:   	fdtoi	%f6, %f26
	call	SYM(t0_subr3)
	.word	0xe2e81018	! t0_kref+0x15bc:   	ldstuba	[%g0 + %i0]0x80, %l1
	.word	0x81a01905	! t0_kref+0x15c0:   	fitod	%f5, %f0
	.word	0x9ec36b6f	! t0_kref+0x15c4:   	addccc	%o5, 0xb6f, %o7
	.word	0xa1b00c20	! t0_kref+0x15c8:   	fzeros	%f16
	.word	0xc9ee5011	! t0_kref+0x15cc:   	prefetcha	%i1 + %l1, 4
	.word	0x80db0016	! t0_kref+0x15d0:   	smulcc	%o4, %l6, %g0
	.word	0x81830000	! t0_kref+0x15d4:   	wr	%o4, %g0, %y
	.word	0x9a5ceded	! t0_kref+0x15d8:   	smul	%l3, 0xded, %o5
	.word	0xee0e001a	! t0_kref+0x15dc:   	ldub	[%i0 + %i2], %l7
	.word	0x32480006	! t0_kref+0x15e0:   	bne,a,pt	%icc, _kref+0x15f8
	.word	0x90d2a2f3	! t0_kref+0x15e4:   	umulcc	%o2, 0x2f3, %o0
	.word	0xded81019	! t0_kref+0x15e8:   	ldxa	[%g0 + %i1]0x80, %o7
	.word	0x9fa018d8	! t0_kref+0x15ec:   	fdtos	%f24, %f15
	.word	0x35480005	! t0_kref+0x15f0:   	fbue,a,pt	%fcc0, _kref+0x1604
	.word	0x9ed23729	! t0_kref+0x15f4:   	umulcc	%o0, -0x8d7, %o7
	.word	0xc1be5a5d	! t0_kref+0x15f8:   	stda	%f0, [%i1 + %i5]0xd2
	.word	0x929cba14	! t0_kref+0x15fc:   	xorcc	%l2, -0x5ec, %o1
	.word	0xd0d01019	! t0_kref+0x1600:   	ldsha	[%g0 + %i1]0x80, %o0
	.word	0x91b30410	! t0_kref+0x1604:   	fcmple16	%f12, %f16, %o0
	.word	0xf91fbfa8	! t0_kref+0x1608:   	ldd	[%fp - 0x58], %f28
	.word	0x9e2da46f	! t0_kref+0x160c:   	andn	%l6, 0x46f, %o7
	.word	0x9a7d642e	! t0_kref+0x1610:   	sdiv	%l5, 0x42e, %o5
	.word	0xc0280019	! t0_kref+0x1614:   	clrb	[%g0 + %i1]
	.word	0x99a20854	! t0_kref+0x1618:   	faddd	%f8, %f20, %f12
	.word	0x99b18af8	! t0_kref+0x161c:   	fpsub32s	%f6, %f24, %f12
	.word	0xed1fbcb0	! t0_kref+0x1620:   	ldd	[%fp - 0x350], %f22
	.word	0x81ac0a52	! t0_kref+0x1624:   	fcmpd	%fcc0, %f16, %f18
	.word	0x2c800006	! t0_kref+0x1628:   	bneg,a	_kref+0x1640
	.word	0xada0102c	! t0_kref+0x162c:   	fstox	%f12, %f22
	.word	0xe9beda18	! t0_kref+0x1630:   	stda	%f20, [%i3 + %i0]0xd0
	.word	0x81a01114	! t0_kref+0x1634:   	fxtod	%f20, %f0
	.word	0xd04e2017	! t0_kref+0x1638:   	ldsb	[%i0 + 0x17], %o0
	.word	0x80056eea	! t0_kref+0x163c:   	add	%l5, 0xeea, %g0
	.word	0x9fb1848a	! t0_kref+0x1640:   	fcmple32	%f6, %f10, %o7
	call	1f
	.empty
	.word	0x92d2c008	! t0_kref+0x1648:   	umulcc	%o3, %o0, %o1
	.word	0xee78a018	! t0_kref+0x164c:   	swap	[%g2 + 0x18], %l7
	.word	0x28800005	! t0_kref+0x1650:   	bleu,a	_kref+0x1664
	.word	0x9db48f90	! t0_kref+0x1654:   	for	%f18, %f16, %f14
	.word	0xec6e200e	! t0_kref+0x1658:   	ldstub	[%i0 + 0xe], %l6
	.word	0xd896d019	! t0_kref+0x165c:   	lduha	[%i3 + %i1]0x80, %o4
1:	.word	0x9e2dfc28	! t0_kref+0x1660:   	andn	%l7, -0x3d8, %o7
	.word	0x39800003	! t0_kref+0x1664:   	fbuge,a	_kref+0x1670
	.word	0x91254000	! t0_kref+0x1668:   	mulscc	%l5, %g0, %o0
	.word	0x31800006	! t0_kref+0x166c:   	fba,a	_kref+0x1684
	.word	0x932d600f	! t0_kref+0x1670:   	sll	%l5, 0xf, %o1
	.word	0x90d40000	! t0_kref+0x1674:   	umulcc	%l0, %g0, %o0
	.word	0x809c0009	! t0_kref+0x1678:   	xorcc	%l0, %o1, %g0
	.word	0xa9b30dd8	! t0_kref+0x167c:   	fnand	%f12, %f24, %f20
	.word	0x3b800006	! t0_kref+0x1680:   	fble,a	_kref+0x1698
	.word	0xa3a01a2e	! t0_kref+0x1684:   	fstoi	%f14, %f17
	.word	0xadb68ea0	! t0_kref+0x1688:   	fsrc1s	%f26, %f22
	.word	0xd80e401a	! t0_kref+0x168c:   	ldub	[%i1 + %i2], %o4
	.word	0xec2e401a	! t0_kref+0x1690:   	stb	%l6, [%i1 + %i2]
	.word	0x90fc800c	! t0_kref+0x1694:   	sdivcc	%l2, %o4, %o0
	.word	0xc04e200e	! t0_kref+0x1698:   	ldsb	[%i0 + 0xe], %g0
	.word	0x96fc8008	! t0_kref+0x169c:   	sdivcc	%l2, %o0, %o3
	.word	0x81b30280	! t0_kref+0x16a0:   	array32	%o4, %g0, %g0
	.word	0x2c800003	! t0_kref+0x16a4:   	bneg,a	_kref+0x16b0
	.word	0x8ba348b7	! t0_kref+0x16a8:   	fsubs	%f13, %f23, %f5
	.word	0x9aaac008	! t0_kref+0x16ac:   	andncc	%o3, %o0, %o5
	.word	0x9e9c3a49	! t0_kref+0x16b0:   	xorcc	%l0, -0x5b7, %o7
	.word	0x36800008	! t0_kref+0x16b4:   	bge,a	_kref+0x16d4
	.word	0xf207bfe0	! t0_kref+0x16b8:   	ld	[%fp - 0x20], %i1
	.word	0x20480004	! t0_kref+0x16bc:   	bn,a,pt	%icc, _kref+0x16cc
	.word	0x90380016	! t0_kref+0x16c0:   	xnor	%g0, %l6, %o0
	.word	0x8170255c	! t0_kref+0x16c4:   	popc	0x55c, %g0
	.word	0xa1a00550	! t0_kref+0x16c8:   	fsqrtd	%f16, %f16
	.word	0x9a5028f6	! t0_kref+0x16cc:   	umul	%g0, 0x8f6, %o5
	.word	0x85b44aeb	! t0_kref+0x16d0:   	fpsub32s	%f17, %f11, %f2
	.word	0x9ad5c016	! t0_kref+0x16d4:   	umulcc	%l7, %l6, %o5
	.word	0xed062008	! t0_kref+0x16d8:   	ld	[%i0 + 8], %f22
	.word	0x8fa5c82b	! t0_kref+0x16dc:   	fadds	%f23, %f11, %f7
	.word	0xb5b406aa	! t0_kref+0x16e0:   	fmul8x16al	%f16, %f10, %f26
	.word	0x81580000	! t0_kref+0x16e4:   	flushw
	.word	0xe19e5a1d	! t0_kref+0x16e8:   	ldda	[%i1 + %i5]0xd0, %f16
	.word	0xebe6501a	! t0_kref+0x16ec:   	casa	[%i1]0x80, %i2, %l5
	.word	0x20800002	! t0_kref+0x16f0:   	bn,a	_kref+0x16f8
	.word	0x9a7ae391	! t0_kref+0x16f4:   	sdiv	%o3, 0x391, %o5
	.word	0xe81e401d	! t0_kref+0x16f8:   	ldd	[%i1 + %i5], %l4
	.word	0xd3266000	! t0_kref+0x16fc:   	st	%f9, [%i1]
	.word	0xc279627c	! t0_kref+0x1700:   	swap	[%g5 + 0x27c], %g1
	.word	0xdece5000	! t0_kref+0x1704:   	ldsba	[%i1]0x80, %o7
	.word	0xcd1fbd20	! t0_kref+0x1708:   	ldd	[%fp - 0x2e0], %f6
	.word	0xd80e3ffb	! t0_kref+0x170c:   	ldub	[%i0 - 5], %o4
	.word	0xd51fbc68	! t0_kref+0x1710:   	ldd	[%fp - 0x398], %f10
	.word	0xd03e001d	! t0_kref+0x1714:   	std	%o0, [%i0 + %i5]
	.word	0xa9a58837	! t0_kref+0x1718:   	fadds	%f22, %f23, %f20
	.word	0xec1e6018	! t0_kref+0x171c:   	ldd	[%i1 + 0x18], %l6
	.word	0x9ba00525	! t0_kref+0x1720:   	fsqrts	%f5, %f13
	.word	0x96a50013	! t0_kref+0x1724:   	subcc	%l4, %l3, %o3
	.word	0x90da4009	! t0_kref+0x1728:   	smulcc	%o1, %o1, %o0
	.word	0x9e32c014	! t0_kref+0x172c:   	orn	%o3, %l4, %o7
	.word	0xaf2c800a	! t0_kref+0x1730:   	sll	%l2, %o2, %l7
	.word	0xae30209b	! t0_kref+0x1734:   	orn	%g0, 0x9b, %l7
	.word	0xd03e6018	! t0_kref+0x1738:   	std	%o0, [%i1 + 0x18]
	.word	0x89a50d27	! t0_kref+0x173c:   	fsmuld	%f20, %f7, %f4
	.word	0xc7ee5013	! t0_kref+0x1740:   	prefetcha	%i1 + %l3, 3
	.word	0x81824000	! t0_kref+0x1744:   	wr	%o1, %g0, %y
	.word	0xd86e201a	! t0_kref+0x1748:   	ldstub	[%i0 + 0x1a], %o4
	.word	0x972b2009	! t0_kref+0x174c:   	sll	%o4, 0x9, %o3
	.word	0x80a50017	! t0_kref+0x1750:   	cmp	%l4, %l7
	.word	0xf56e001a	! t0_kref+0x1754:   	prefetch	%i0 + %i2, 26
	.word	0x81ab8ad8	! t0_kref+0x1758:   	fcmped	%fcc0, %f14, %f24
	.word	0x93400000	! t0_kref+0x175c:   	mov	%y, %o1
	.word	0xc050a028	! t0_kref+0x1760:   	ldsh	[%g2 + 0x28], %g0
	.word	0x98bac00c	! t0_kref+0x1764:   	xnorcc	%o3, %o4, %o4
	.word	0x81aa8a4c	! t0_kref+0x1768:   	fcmpd	%fcc0, %f10, %f12
	.word	0x8124e122	! t0_kref+0x176c:   	mulscc	%l3, 0x122, %g0
	.word	0x91b38a02	! t0_kref+0x1770:   	fpadd16	%f14, %f2, %f8
	.word	0x8da0054e	! t0_kref+0x1774:   	fsqrtd	%f14, %f6
	.word	0x3d800006	! t0_kref+0x1778:   	fbule,a	_kref+0x1790
	.word	0xae8c7189	! t0_kref+0x177c:   	andcc	%l1, -0xe77, %l7
	.word	0x91a0054a	! t0_kref+0x1780:   	fsqrtd	%f10, %f8
	.word	0x20800001	! t0_kref+0x1784:   	bn,a	_kref+0x1788
	.word	0x967b635b	! t0_kref+0x1788:   	sdiv	%o5, 0x35b, %o3
	.word	0xf19e1a1d	! t0_kref+0x178c:   	ldda	[%i0 + %i5]0xd0, %f24
	.word	0xe51fbf50	! t0_kref+0x1790:   	ldd	[%fp - 0xb0], %f18
	.word	0x9662c011	! t0_kref+0x1794:   	subc	%o3, %l1, %o3
	.word	0xc12e001c	! t0_kref+0x1798:   	st	%fsr, [%i0 + %i4]
	.word	0xc7067ffc	! t0_kref+0x179c:   	ld	[%i1 - 4], %f3
	.word	0xee865000	! t0_kref+0x17a0:   	lda	[%i1]0x80, %l7
	.word	0xa5a488b0	! t0_kref+0x17a4:   	fsubs	%f18, %f16, %f18
	.word	0xea2e8018	! t0_kref+0x17a8:   	stb	%l5, [%i2 + %i0]
	.word	0xa1a28927	! t0_kref+0x17ac:   	fmuls	%f10, %f7, %f16
	.word	0x97b68e29	! t0_kref+0x17b0:   	fands	%f26, %f9, %f11
	.word	0xb9a0c935	! t0_kref+0x17b4:   	fmuls	%f3, %f21, %f28
	.word	0xdbe6501a	! t0_kref+0x17b8:   	casa	[%i1]0x80, %i2, %o5
	.word	0x36480006	! t0_kref+0x17bc:   	bge,a,pt	%icc, _kref+0x17d4
	.word	0x8bb00c20	! t0_kref+0x17c0:   	fzeros	%f5
	.word	0x9fc10000	! t0_kref+0x17c4:   	call	%g4
	.word	0x91b30100	! t0_kref+0x17c8:   	edge32	%o4, %g0, %o0
	.word	0xf5396c78	! t0_kref+0x17cc:   	std	%f26, [%g5 + 0xc78]
	.word	0x90344015	! t0_kref+0x17d0:   	orn	%l1, %l5, %o0
	.word	0xe8767fe0	! t0_kref+0x17d4:   	stx	%l4, [%i1 - 0x20]
	.word	0x801eb11e	! t0_kref+0x17d8:   	xor	%i2, -0xee2, %g0
	.word	0x99a589c6	! t0_kref+0x17dc:   	fdivd	%f22, %f6, %f12
	.word	0x81da72aa	! t0_kref+0x17e0:   	flush	%o1 - 0xd56
	.word	0xc04e001a	! t0_kref+0x17e4:   	ldsb	[%i0 + %i2], %g0
	.word	0x905a3139	! t0_kref+0x17e8:   	smul	%o0, -0xec7, %o0
	.word	0xd2560000	! t0_kref+0x17ec:   	ldsh	[%i0], %o1
	.word	0x22800001	! t0_kref+0x17f0:   	be,a	_kref+0x17f4
	.word	0x94dcc017	! t0_kref+0x17f4:   	smulcc	%l3, %l7, %o2
	.word	0x985b001a	! t0_kref+0x17f8:   	smul	%o4, %i2, %o4
	.word	0x80540012	! t0_kref+0x17fc:   	umul	%l0, %l2, %g0
	.word	0x80b2eabd	! t0_kref+0x1800:   	orncc	%o3, 0xabd, %g0
	.word	0xd500a02c	! t0_kref+0x1804:   	ld	[%g2 + 0x2c], %f10
	.word	0xaf22a37f	! t0_kref+0x1808:   	mulscc	%o2, 0x37f, %l7
	.word	0x9434400d	! t0_kref+0x180c:   	orn	%l1, %o5, %o2
	.word	0x31480004	! t0_kref+0x1810:   	fba,a,pt	%fcc0, _kref+0x1820
	.word	0xa9a0893c	! t0_kref+0x1814:   	fmuls	%f2, %f28, %f20
	.word	0xde0e0000	! t0_kref+0x1818:   	ldub	[%i0], %o7
	.word	0x9fa388ac	! t0_kref+0x181c:   	fsubs	%f14, %f12, %f15
	.word	0x99400000	! t0_kref+0x1820:   	mov	%y, %o4
	.word	0x9f134017	! t0_kref+0x1824:   	taddcctv	%o5, %l7, %o7
	.word	0x32480007	! t0_kref+0x1828:   	bne,a,pt	%icc, _kref+0x1844
	.word	0xda20a02c	! t0_kref+0x182c:   	st	%o5, [%g2 + 0x2c]
	.word	0x91a3885a	! t0_kref+0x1830:   	faddd	%f14, %f26, %f8
	.word	0xada00532	! t0_kref+0x1834:   	fsqrts	%f18, %f22
	.word	0xefee501b	! t0_kref+0x1838:   	prefetcha	%i1 + %i3, 23
	.word	0xb7a01a5c	! t0_kref+0x183c:   	fdtoi	%f28, %f27
	.word	0xe620a02c	! t0_kref+0x1840:   	st	%l3, [%g2 + 0x2c]
	.word	0xef68a04e	! t0_kref+0x1844:   	prefetch	%g2 + 0x4e, 23
	.word	0x9fa3083a	! t0_kref+0x1848:   	fadds	%f12, %f26, %f15
	.word	0x3b480007	! t0_kref+0x184c:   	fble,a,pt	%fcc0, _kref+0x1868
	.word	0x89a000ad	! t0_kref+0x1850:   	fnegs	%f13, %f4
	.word	0xe02e8019	! t0_kref+0x1854:   	stb	%l0, [%i2 + %i1]
	.word	0xe87e3ff8	! t0_kref+0x1858:   	swap	[%i0 - 8], %l4
	.word	0x932ce011	! t0_kref+0x185c:   	sll	%l3, 0x11, %o1
	.word	0x9bb54176	! t0_kref+0x1860:   	edge32ln	%l5, %l6, %o5
	.word	0xc0063ffc	! t0_kref+0x1864:   	ld	[%i0 - 4], %g0
	.word	0xae9b4011	! t0_kref+0x1868:   	xorcc	%o5, %l1, %l7
	.word	0xa1a01a5c	! t0_kref+0x186c:   	fdtoi	%f28, %f16
	.word	0xf9067ffc	! t0_kref+0x1870:   	ld	[%i1 - 4], %f28
	.word	0x9ba01a2f	! t0_kref+0x1874:   	fstoi	%f15, %f13
	.word	0xe76e401c	! t0_kref+0x1878:   	prefetch	%i1 + %i4, 19
	.word	0xd6200019	! t0_kref+0x187c:   	st	%o3, [%g0 + %i1]
	.word	0x9906b41d	! t0_kref+0x1880:   	taddcc	%i2, -0xbe3, %o4
	.word	0xb1a049ac	! t0_kref+0x1884:   	fdivs	%f1, %f12, %f24
	.word	0x9de3bfa0	! t0_kref+0x1888:   	save	%sp, -0x60, %sp
	.word	0x97eec01b	! t0_kref+0x188c:   	restore	%i3, %i3, %o3
	.word	0xe76e401d	! t0_kref+0x1890:   	prefetch	%i1 + %i5, 19
	.word	0xae33000c	! t0_kref+0x1894:   	orn	%o4, %o4, %l7
!	.word	0x3a4a41cb	! t0_kref+0x1898:   	bcc,a,pt	%icc, SYM(t0_subr3)
	   	bcc,a,pt	%icc, SYM(t0_subr3)
	.word	0x9f414000	! t0_kref+0x189c:   	mov	%pc, %o7
	.word	0xc91fbd90	! t0_kref+0x18a0:   	ldd	[%fp - 0x270], %f4
	.word	0xb3a00529	! t0_kref+0x18a4:   	fsqrts	%f9, %f25
	.word	0x81ab8ac2	! t0_kref+0x18a8:   	fcmped	%fcc0, %f14, %f2
	.word	0x3c800001	! t0_kref+0x18ac:   	bpos,a	_kref+0x18b0
	.word	0x81d8401b	! t0_kref+0x18b0:   	flush	%g1 + %i3
	.word	0x93a30923	! t0_kref+0x18b4:   	fmuls	%f12, %f3, %f9
	.word	0x20800002	! t0_kref+0x18b8:   	bn,a	_kref+0x18c0
	.word	0xdd1fbd98	! t0_kref+0x18bc:   	ldd	[%fp - 0x268], %f14
	.word	0xb7a0052c	! t0_kref+0x18c0:   	fsqrts	%f12, %f27
	.word	0x9afd0015	! t0_kref+0x18c4:   	sdivcc	%l4, %l5, %o5
	.word	0xd106001c	! t0_kref+0x18c8:   	ld	[%i0 + %i4], %f8
	.word	0x8033401a	! t0_kref+0x18cc:   	orn	%o5, %i2, %g0
	.word	0x22800007	! t0_kref+0x18d0:   	be,a	_kref+0x18ec
	.word	0xef00a02c	! t0_kref+0x18d4:   	ld	[%g2 + 0x2c], %f23
	.word	0x9aab3e66	! t0_kref+0x18d8:   	andncc	%o4, -0x19a, %o5
	.word	0x95b58e04	! t0_kref+0x18dc:   	fand	%f22, %f4, %f10
	.word	0xe96e401a	! t0_kref+0x18e0:   	prefetch	%i1 + %i2, 20
	.word	0x982b3642	! t0_kref+0x18e4:   	andn	%o4, -0x9be, %o4
	.word	0x9b61e302	! t0_kref+0x18e8:   	movu	%fcc0, 0x302, %o5
	.word	0xb9b30e80	! t0_kref+0x18ec:   	fsrc1	%f12, %f28
	.word	0x9db44710	! t0_kref+0x18f0:   	fmuld8sux16	%f17, %f16, %f14
	.word	0xde480019	! t0_kref+0x18f4:   	ldsb	[%g0 + %i1], %o7
	.word	0xf16e3fe8	! t0_kref+0x18f8:   	prefetch	%i0 - 0x18, 24
	.word	0x91a000b8	! t0_kref+0x18fc:   	fnegs	%f24, %f8
	.word	0xc168a00b	! t0_kref+0x1900:   	prefetch	%g2 + 0xb, 0
	.word	0xd82e0000	! t0_kref+0x1904:   	stb	%o4, [%i0]
	.word	0xd1be588d	! t0_kref+0x1908:   	stda	%f8, [%i1 + %o5]0xc4
	.word	0xd2b61000	! t0_kref+0x190c:   	stha	%o1, [%i0]0x80
	.word	0x906422d8	! t0_kref+0x1910:   	subc	%l0, 0x2d8, %o0
	.word	0x9122c012	! t0_kref+0x1914:   	mulscc	%o3, %l2, %o0
	.word	0x3a480006	! t0_kref+0x1918:   	bcc,a,pt	%icc, _kref+0x1930
	.word	0x92368016	! t0_kref+0x191c:   	orn	%i2, %l6, %o1
	.word	0x9522800a	! t0_kref+0x1920:   	mulscc	%o2, %o2, %o2
	.word	0xe5266004	! t0_kref+0x1924:   	st	%f18, [%i1 + 4]
	.word	0x922dc00c	! t0_kref+0x1928:   	andn	%l7, %o4, %o1
	.word	0xe76e2008	! t0_kref+0x192c:   	prefetch	%i0 + 8, 19
	.word	0x2b800008	! t0_kref+0x1930:   	fbug,a	_kref+0x1950
	.word	0xec3e001d	! t0_kref+0x1934:   	std	%l6, [%i0 + %i5]
	.word	0x96a28011	! t0_kref+0x1938:   	subcc	%o2, %l1, %o3
	.word	0x81aa0ac6	! t0_kref+0x193c:   	fcmped	%fcc0, %f8, %f6
	.word	0x81834000	! t0_kref+0x1940:   	wr	%o5, %g0, %y
	.word	0x94858016	! t0_kref+0x1944:   	addcc	%l6, %l6, %o2
	.word	0xae72ab7d	! t0_kref+0x1948:   	udiv	%o2, 0xb7d, %l7
	.word	0xa3a38927	! t0_kref+0x194c:   	fmuls	%f14, %f7, %f17
	.word	0x989ac00c	! t0_kref+0x1950:   	xorcc	%o3, %o4, %o4
	.word	0x92bc6308	! t0_kref+0x1954:   	xnorcc	%l1, 0x308, %o1
	.word	0x26800008	! t0_kref+0x1958:   	bl,a	_kref+0x1978
	.word	0xea68a03b	! t0_kref+0x195c:   	ldstub	[%g2 + 0x3b], %l5
	.word	0xcd260000	! t0_kref+0x1960:   	st	%f6, [%i0]
	.word	0x39800003	! t0_kref+0x1964:   	fbuge,a	_kref+0x1970
	.word	0x9fa00537	! t0_kref+0x1968:   	fsqrts	%f23, %f15
	.word	0xd43f4019	! t0_kref+0x196c:   	std	%o2, [%i5 + %i1]
	.word	0x28480007	! t0_kref+0x1970:   	bleu,a,pt	%icc, _kref+0x198c
	.word	0xc368a041	! t0_kref+0x1974:   	prefetch	%g2 + 0x41, 1
	.word	0x81824000	! t0_kref+0x1978:   	wr	%o1, %g0, %y
	.word	0x31800003	! t0_kref+0x197c:   	fba,a	_kref+0x1988
	.word	0xae34000b	! t0_kref+0x1980:   	orn	%l0, %o3, %l7
	.word	0x81ddc004	! t0_kref+0x1984:   	flush	%l7 + %g4
	.word	0x9fb4848e	! t0_kref+0x1988:   	fcmple32	%f18, %f14, %o7
	.word	0x85b60ecc	! t0_kref+0x198c:   	fornot2	%f24, %f12, %f2
	.word	0x33480002	! t0_kref+0x1990:   	fbe,a,pt	%fcc0, _kref+0x1998
	.word	0x95b18c82	! t0_kref+0x1994:   	fandnot2	%f6, %f2, %f10
	.word	0x90122409	! t0_kref+0x1998:   	or	%o0, 0x409, %o0
	.word	0x28480002	! t0_kref+0x199c:   	bleu,a,pt	%icc, _kref+0x19a4
	.word	0x90a5801a	! t0_kref+0x19a0:   	subcc	%l6, %i2, %o0
	.word	0xeed6501b	! t0_kref+0x19a4:   	ldsha	[%i1 + %i3]0x80, %l7
	.word	0x94036875	! t0_kref+0x19a8:   	add	%o5, 0x875, %o2
	.word	0x9a803063	! t0_kref+0x19ac:   	addcc	%g0, -0xf9d, %o5
	.word	0xafb200e8	! t0_kref+0x19b0:   	edge16ln	%o0, %o0, %l7
	.word	0x9eda0016	! t0_kref+0x19b4:   	smulcc	%o0, %l6, %o7
	.word	0xa7b20af8	! t0_kref+0x19b8:   	fpsub32s	%f8, %f24, %f19
	.word	0x23480003	! t0_kref+0x19bc:   	fbne,a,pt	%fcc0, _kref+0x19c8
	.word	0x947c7ef1	! t0_kref+0x19c0:   	sdiv	%l1, -0x10f, %o2
	.word	0x90dc2780	! t0_kref+0x19c4:   	smulcc	%l0, 0x780, %o0
	.word	0x3a480006	! t0_kref+0x19c8:   	bcc,a,pt	%icc, _kref+0x19e0
	.word	0x9878000c	! t0_kref+0x19cc:   	sdiv	%g0, %o4, %o4
	.word	0x93b4c16d	! t0_kref+0x19d0:   	edge32ln	%l3, %o5, %o1
	.word	0xd8871018	! t0_kref+0x19d4:   	lda	[%i4 + %i0]0x80, %o4
	.word	0x87a2c827	! t0_kref+0x19d8:   	fadds	%f11, %f7, %f3
	.word	0x2f04a878	! t0_kref+0x19dc:   	sethi	%hi(0x12a1e000), %l7
	.word	0xd926401c	! t0_kref+0x19e0:   	st	%f12, [%i1 + %i4]
	.word	0x32480008	! t0_kref+0x19e4:   	bne,a,pt	%icc, _kref+0x1a04
	.word	0xf8380019	! t0_kref+0x19e8:   	std	%i4, [%g0 + %i1]
	.word	0x39480004	! t0_kref+0x19ec:   	fbuge,a,pt	%fcc0, _kref+0x19fc
	.word	0x905a8009	! t0_kref+0x19f0:   	smul	%o2, %o1, %o0
	.word	0x29800004	! t0_kref+0x19f4:   	fbl,a	_kref+0x1a04
	.word	0x9bb1851a	! t0_kref+0x19f8:   	fcmpgt16	%f6, %f26, %o5
	.word	0xada00522	! t0_kref+0x19fc:   	fsqrts	%f2, %f22
	.word	0xfd6e401a	! t0_kref+0x1a00:   	prefetch	%i1 + %i2, 30
	.word	0x9fb400b1	! t0_kref+0x1a04:   	edge16n	%l0, %l1, %o7
	.word	0xde566010	! t0_kref+0x1a08:   	ldsh	[%i1 + 0x10], %o7
	.word	0xf4ae9018	! t0_kref+0x1a0c:   	stba	%i2, [%i2 + %i0]0x80
	.word	0x35480003	! t0_kref+0x1a10:   	fbue,a,pt	%fcc0, _kref+0x1a1c
	.word	0xaeb24013	! t0_kref+0x1a14:   	orncc	%o1, %l3, %l7
	.word	0x9234269d	! t0_kref+0x1a18:   	orn	%l0, 0x69d, %o1
	.word	0x9fc10000	! t0_kref+0x1a1c:   	call	%g4
	.word	0x947a800b	! t0_kref+0x1a20:   	sdiv	%o2, %o3, %o2
	.word	0xb1b00cd0	! t0_kref+0x1a24:   	fnot2	%f16, %f24
	.word	0xe11f4018	! t0_kref+0x1a28:   	ldd	[%i5 + %i0], %f16
	.word	0x3d800004	! t0_kref+0x1a2c:   	fbule,a	_kref+0x1a3c
	.word	0xd8567fea	! t0_kref+0x1a30:   	ldsh	[%i1 - 0x16], %o4
	.word	0xd44e3ffd	! t0_kref+0x1a34:   	ldsb	[%i0 - 3], %o2
	.word	0xaf1b2c0d	! t0_kref+0x1a38:   	tsubcctv	%o4, 0xc0d, %l7
	.word	0xae280011	! t0_kref+0x1a3c:   	andn	%g0, %l1, %l7
	.word	0xae2dc011	! t0_kref+0x1a40:   	andn	%l7, %l1, %l7
	.word	0xa5a389c2	! t0_kref+0x1a44:   	fdivd	%f14, %f2, %f18
	.word	0xd6961000	! t0_kref+0x1a48:   	lduha	[%i0]0x80, %o3
	.word	0x95b0874a	! t0_kref+0x1a4c:   	fpack32	%f2, %f10, %f10
	.word	0x91a00123	! t0_kref+0x1a50:   	fabss	%f3, %f8
	.word	0x24800006	! t0_kref+0x1a54:   	ble,a	_kref+0x1a6c
	.word	0x85a01907	! t0_kref+0x1a58:   	fitod	%f7, %f2
	.word	0x81a90a23	! t0_kref+0x1a5c:   	fcmps	%fcc0, %f4, %f3
	.word	0xb3b54a78	! t0_kref+0x1a60:   	fpadd32s	%f21, %f24, %f25
	.word	0xd22e7ffc	! t0_kref+0x1a64:   	stb	%o1, [%i1 - 4]
	.word	0x9eaeaded	! t0_kref+0x1a68:   	andncc	%i2, 0xded, %o7
	.word	0x8062801a	! t0_kref+0x1a6c:   	subc	%o2, %i2, %g0
	.word	0x9e9daec9	! t0_kref+0x1a70:   	xorcc	%l6, 0xec9, %o7
	.word	0x99b18558	! t0_kref+0x1a74:   	fcmpeq16	%f6, %f24, %o4
	.word	0x81ad8ac4	! t0_kref+0x1a78:   	fcmped	%fcc0, %f22, %f4
	.word	0x90d2801a	! t0_kref+0x1a7c:   	umulcc	%o2, %i2, %o0
	.word	0x9de3bfa0	! t0_kref+0x1a80:   	save	%sp, -0x60, %sp
	.word	0x91eec01c	! t0_kref+0x1a84:   	restore	%i3, %i4, %o0
	.word	0x36800007	! t0_kref+0x1a88:   	bge,a	_kref+0x1aa4
	.word	0xb5a689d8	! t0_kref+0x1a8c:   	fdivd	%f26, %f24, %f26
	.word	0xe06e001a	! t0_kref+0x1a90:   	ldstub	[%i0 + %i2], %l0
	.word	0x1104948f	! t0_kref+0x1a94:   	sethi	%hi(0x12523c00), %o0
	.word	0x93400000	! t0_kref+0x1a98:   	mov	%y, %o1
	.word	0xb9a289c4	! t0_kref+0x1a9c:   	fdivd	%f10, %f4, %f28
	.word	0xec180018	! t0_kref+0x1aa0:   	ldd	[%g0 + %i0], %l6
	.word	0xe07e6004	! t0_kref+0x1aa4:   	swap	[%i1 + 4], %l0
	.word	0x9ba01a2b	! t0_kref+0x1aa8:   	fstoi	%f11, %f13
	.word	0xd22e7ff3	! t0_kref+0x1aac:   	stb	%o1, [%i1 - 0xd]
	.word	0x2d480005	! t0_kref+0x1ab0:   	fbg,a,pt	%fcc0, _kref+0x1ac4
	.word	0x9af3400a	! t0_kref+0x1ab4:   	udivcc	%o5, %o2, %o5
	.word	0xd2080019	! t0_kref+0x1ab8:   	ldub	[%g0 + %i1], %o1
	.word	0x94b5000a	! t0_kref+0x1abc:   	orncc	%l4, %o2, %o2
	.word	0x93b08514	! t0_kref+0x1ac0:   	fcmpgt16	%f2, %f20, %o1
	.word	0xa9a01905	! t0_kref+0x1ac4:   	fitod	%f5, %f20
	.word	0xa9a01a39	! t0_kref+0x1ac8:   	fstoi	%f25, %f20
	.word	0x9a52801a	! t0_kref+0x1acc:   	umul	%o2, %i2, %o5
	.word	0xb5b08f92	! t0_kref+0x1ad0:   	for	%f2, %f18, %f26
	.word	0xf526001c	! t0_kref+0x1ad4:   	st	%f26, [%i0 + %i4]
	.word	0x942c000c	! t0_kref+0x1ad8:   	andn	%l0, %o4, %o2
	.word	0x8015c008	! t0_kref+0x1adc:   	or	%l7, %o0, %g0
	.word	0x32800002	! t0_kref+0x1ae0:   	bne,a	_kref+0x1ae8
	.word	0x81da6512	! t0_kref+0x1ae4:   	flush	%o1 + 0x512
	.word	0x9e9de392	! t0_kref+0x1ae8:   	xorcc	%l7, 0x392, %o7
	.word	0x98f80017	! t0_kref+0x1aec:   	sdivcc	%g0, %l7, %o4
	.word	0x949a400d	! t0_kref+0x1af0:   	xorcc	%o1, %o5, %o2
	.word	0x81ad0ac6	! t0_kref+0x1af4:   	fcmped	%fcc0, %f20, %f6
	.word	0xb5a01933	! t0_kref+0x1af8:   	fstod	%f19, %f26
	.word	0x99408000	! t0_kref+0x1afc:   	mov	%ccr, %o4
	.word	0xa7a2c9b8	! t0_kref+0x1b00:   	fdivs	%f11, %f24, %f19
	.word	0x2b480003	! t0_kref+0x1b04:   	fbug,a,pt	%fcc0, _kref+0x1b10
	.word	0x9e1ce8f4	! t0_kref+0x1b08:   	xor	%l3, 0x8f4, %o7
	.word	0x9456a4cf	! t0_kref+0x1b0c:   	umul	%i2, 0x4cf, %o2
	.word	0xd648a025	! t0_kref+0x1b10:   	ldsb	[%g2 + 0x25], %o3
	.word	0xa1b44daa	! t0_kref+0x1b14:   	fxors	%f17, %f10, %f16
	.word	0xd67e3fe4	! t0_kref+0x1b18:   	swap	[%i0 - 0x1c], %o3
	.word	0xa7a18837	! t0_kref+0x1b1c:   	fadds	%f6, %f23, %f19
	.word	0xae82c01a	! t0_kref+0x1b20:   	addcc	%o3, %i2, %l7
	.word	0x98183d96	! t0_kref+0x1b24:   	xor	%g0, -0x26a, %o4
	.word	0xeb68a083	! t0_kref+0x1b28:   	prefetch	%g2 + 0x83, 21
	.word	0x972a4012	! t0_kref+0x1b2c:   	sll	%o1, %l2, %o3
	.word	0xa1a01901	! t0_kref+0x1b30:   	fitod	%f1, %f16
	.word	0x81ab0ad6	! t0_kref+0x1b34:   	fcmped	%fcc0, %f12, %f22
	.word	0x9e9aeb9e	! t0_kref+0x1b38:   	xorcc	%o3, 0xb9e, %o7
	.word	0x989d8012	! t0_kref+0x1b3c:   	xorcc	%l6, %l2, %o4
	.word	0x98e4ec5c	! t0_kref+0x1b40:   	subccc	%l3, 0xc5c, %o4
	.word	0xe120a02c	! t0_kref+0x1b44:   	st	%f16, [%g2 + 0x2c]
	.word	0x83b34c69	! t0_kref+0x1b48:   	fnors	%f13, %f9, %f1
	.word	0x948de277	! t0_kref+0x1b4c:   	andcc	%l7, 0x277, %o2
	.word	0x8da00521	! t0_kref+0x1b50:   	fsqrts	%f1, %f6
	.word	0x9a9d4014	! t0_kref+0x1b54:   	xorcc	%l5, %l4, %o5
	.word	0xea7e201c	! t0_kref+0x1b58:   	swap	[%i0 + 0x1c], %l5
	.word	0x9fc00004	! t0_kref+0x1b5c:   	call	%g0 + %g4
	.word	0xe51fbf38	! t0_kref+0x1b60:   	ldd	[%fp - 0xc8], %f18
	.word	0x38800007	! t0_kref+0x1b64:   	bgu,a	_kref+0x1b80
	.word	0xa3a01a33	! t0_kref+0x1b68:   	fstoi	%f19, %f17
	.word	0x34800006	! t0_kref+0x1b6c:   	bg,a	_kref+0x1b84
	.word	0xae0c000c	! t0_kref+0x1b70:   	and	%l0, %o4, %l7
	.word	0x81aa0adc	! t0_kref+0x1b74:   	fcmped	%fcc0, %f8, %f28
	.word	0x99b20516	! t0_kref+0x1b78:   	fcmpgt16	%f8, %f22, %o4
	.word	0x93b240d2	! t0_kref+0x1b7c:   	edge16l	%o1, %l2, %o1
	.word	0xd40e401a	! t0_kref+0x1b80:   	ldub	[%i1 + %i2], %o2
	.word	0xed68a04c	! t0_kref+0x1b84:   	prefetch	%g2 + 0x4c, 22
	.word	0xd02e4000	! t0_kref+0x1b88:   	stb	%o0, [%i1]
	.word	0x99a000a1	! t0_kref+0x1b8c:   	fnegs	%f1, %f12
	.word	0xaba00134	! t0_kref+0x1b90:   	fabss	%f20, %f21
	.word	0xd656c018	! t0_kref+0x1b94:   	ldsh	[%i3 + %i0], %o3
	.word	0xc06e401a	! t0_kref+0x1b98:   	ldstub	[%i1 + %i2], %g0
	.word	0x1322f0a4	! t0_kref+0x1b9c:   	sethi	%hi(0x8bc29000), %o1
	.word	0xaefb4015	! t0_kref+0x1ba0:   	sdivcc	%o5, %l5, %l7
	.word	0xd4ae5000	! t0_kref+0x1ba4:   	stba	%o2, [%i1]0x80
	.word	0x34800001	! t0_kref+0x1ba8:   	bg,a	_kref+0x1bac
	.word	0x805de168	! t0_kref+0x1bac:   	smul	%l7, 0x168, %g0
	.word	0x81800000	! t0_kref+0x1bb0:   	mov	%g0, %y
	.word	0x012b91f4	! t0_kref+0x1bb4:   	sethi	%hi(0xae47d000), %g0
	.word	0x91a688a7	! t0_kref+0x1bb8:   	fsubs	%f26, %f7, %f8
	.word	0x9f414000	! t0_kref+0x1bbc:   	mov	%pc, %o7
!	.word	0x2e84190f	! t0_kref+0x1bc0:   	bvs,a	SYM(t0_subr1)
	   	bvs,a	SYM(t0_subr1)
	.word	0xe43e401d	! t0_kref+0x1bc4:   	std	%l2, [%i1 + %i5]
	.word	0x85b68e0a	! t0_kref+0x1bc8:   	fand	%f26, %f10, %f2
	.word	0xb5a00534	! t0_kref+0x1bcc:   	fsqrts	%f20, %f26
	.word	0x9ba01a5a	! t0_kref+0x1bd0:   	fdtoi	%f26, %f13
	.word	0xc9be1a5d	! t0_kref+0x1bd4:   	stda	%f4, [%i0 + %i5]0xd2
	.word	0x87b10af5	! t0_kref+0x1bd8:   	fpsub32s	%f4, %f21, %f3
	.word	0xd7067fec	! t0_kref+0x1bdc:   	ld	[%i1 - 0x14], %f11
	.word	0x92aa7647	! t0_kref+0x1be0:   	andncc	%o1, -0x9b9, %o1
	.word	0xd8500018	! t0_kref+0x1be4:   	ldsh	[%g0 + %i0], %o4
	.word	0x96322df1	! t0_kref+0x1be8:   	orn	%o0, 0xdf1, %o3
	.word	0x969d400b	! t0_kref+0x1bec:   	xorcc	%l5, %o3, %o3
	.word	0x9da70930	! t0_kref+0x1bf0:   	fmuls	%f28, %f16, %f14
	.word	0xaebb29c7	! t0_kref+0x1bf4:   	xnorcc	%o4, 0x9c7, %l7
	.word	0x33480003	! t0_kref+0x1bf8:   	fbe,a,pt	%fcc0, _kref+0x1c04
	.word	0xc5ee101a	! t0_kref+0x1bfc:   	prefetcha	%i0 + %i2, 2
	.word	0xc900a024	! t0_kref+0x1c00:   	ld	[%g2 + 0x24], %f4
	.word	0x907b4008	! t0_kref+0x1c04:   	sdiv	%o5, %o0, %o0
	.word	0xde563fe8	! t0_kref+0x1c08:   	ldsh	[%i0 - 0x18], %o7
	.word	0x9ba14931	! t0_kref+0x1c0c:   	fmuls	%f5, %f17, %f13
	.word	0x9252ebd5	! t0_kref+0x1c10:   	umul	%o3, 0xbd5, %o1
	.word	0x9eb28017	! t0_kref+0x1c14:   	orncc	%o2, %l7, %o7
	.word	0x962a8000	! t0_kref+0x1c18:   	andn	%o2, %g0, %o3
	.word	0x8db6c6b5	! t0_kref+0x1c1c:   	fmul8x16al	%f27, %f21, %f6
	.word	0x8da389d4	! t0_kref+0x1c20:   	fdivd	%f14, %f20, %f6
	.word	0x81ae0a4a	! t0_kref+0x1c24:   	fcmpd	%fcc0, %f24, %f10
	.word	0xcb070018	! t0_kref+0x1c28:   	ld	[%i4 + %i0], %f5
	.word	0xafa01a25	! t0_kref+0x1c2c:   	fstoi	%f5, %f23
	.word	0xe66e6013	! t0_kref+0x1c30:   	ldstub	[%i1 + 0x13], %l3
	.word	0x97a0052e	! t0_kref+0x1c34:   	fsqrts	%f14, %f11
	call	SYM(t0_subr1)
	.word	0xf9267ff0	! t0_kref+0x1c3c:   	st	%f28, [%i1 - 0x10]
	.word	0x81a509dc	! t0_kref+0x1c40:   	fdivd	%f20, %f28, %f0
	.word	0x39480005	! t0_kref+0x1c44:   	fbuge,a,pt	%fcc0, _kref+0x1c58
	.word	0xe6280019	! t0_kref+0x1c48:   	stb	%l3, [%g0 + %i1]
	.word	0x36480005	! t0_kref+0x1c4c:   	bge,a,pt	%icc, _kref+0x1c60
	.word	0xeb68a047	! t0_kref+0x1c50:   	prefetch	%g2 + 0x47, 21
	.word	0xc19e501d	! t0_kref+0x1c54:   	ldda	[%i1 + %i5]0x80, %f0
	.word	0xa3b007b2	! t0_kref+0x1c58:   	fpackfix	%f18, %f17
	.word	0xe66e3fe4	! t0_kref+0x1c5c:   	ldstub	[%i0 - 0x1c], %l3
	.word	0x9fa0052e	! t0_kref+0x1c60:   	fsqrts	%f14, %f15
	.word	0x809a000d	! t0_kref+0x1c64:   	xorcc	%o0, %o5, %g0
	.word	0xdd1fbdf0	! t0_kref+0x1c68:   	ldd	[%fp - 0x210], %f14
	.word	0x80fa7428	! t0_kref+0x1c6c:   	sdivcc	%o1, -0xbd8, %g0
	.word	0x28800003	! t0_kref+0x1c70:   	bleu,a	_kref+0x1c7c
	.word	0x95a488a3	! t0_kref+0x1c74:   	fsubs	%f18, %f3, %f10
	.word	0x9e0d0009	! t0_kref+0x1c78:   	and	%l4, %o1, %o7
	.word	0xc008a00b	! t0_kref+0x1c7c:   	ldub	[%g2 + 0xb], %g0
	.word	0xf4b6d018	! t0_kref+0x1c80:   	stha	%i2, [%i3 + %i0]0x80
	.word	0x89b086f6	! t0_kref+0x1c84:   	fmul8ulx16	%f2, %f22, %f4
	.word	0x81a88a48	! t0_kref+0x1c88:   	fcmpd	%fcc0, %f2, %f8
	.word	0x21480005	! t0_kref+0x1c8c:   	fbn,a,pt	%fcc0, _kref+0x1ca0
	.word	0xda0e3ff4	! t0_kref+0x1c90:   	ldub	[%i0 - 0xc], %o5
	.word	0xafb38548	! t0_kref+0x1c94:   	fcmpeq16	%f14, %f8, %l7
	.word	0xafb3014a	! t0_kref+0x1c98:   	edge32l	%o4, %o2, %l7
	.word	0xdd1fbf70	! t0_kref+0x1c9c:   	ldd	[%fp - 0x90], %f14
	.word	0xc99f5a59	! t0_kref+0x1ca0:   	ldda	[%i5 + %i1]0xd2, %f4
	.word	0xf83f4018	! t0_kref+0x1ca4:   	std	%i4, [%i5 + %i0]
	.word	0x3e480003	! t0_kref+0x1ca8:   	bvc,a,pt	%icc, _kref+0x1cb4
	.word	0x9efb3fbf	! t0_kref+0x1cac:   	sdivcc	%o4, -0x41, %o7
	.word	0xb9a0191c	! t0_kref+0x1cb0:   	fitod	%f28, %f28
	.word	0x8ba00532	! t0_kref+0x1cb4:   	fsqrts	%f18, %f5
	.word	0x81dfc00f	! t0_kref+0x1cb8:   	flush	%i7 + %o7
	.word	0x9a84aca8	! t0_kref+0x1cbc:   	addcc	%l2, 0xca8, %o5
	.word	0x9483400b	! t0_kref+0x1cc0:   	addcc	%o5, %o3, %o2
	.word	0x9a33310e	! t0_kref+0x1cc4:   	orn	%o4, -0xef2, %o5
	.word	0xd9180019	! t0_kref+0x1cc8:   	ldd	[%g0 + %i1], %f12
	.word	0xa5a01927	! t0_kref+0x1ccc:   	fstod	%f7, %f18
	.word	0x93b3433a	! t0_kref+0x1cd0:   	bmask	%o5, %i2, %o1
	.word	0x9634800d	! t0_kref+0x1cd4:   	orn	%l2, %o5, %o3
	.word	0xada5093b	! t0_kref+0x1cd8:   	fmuls	%f20, %f27, %f22
	.word	0x9a32b4ac	! t0_kref+0x1cdc:   	orn	%o2, -0xb54, %o5
	.word	0x29480003	! t0_kref+0x1ce0:   	fbl,a,pt	%fcc0, _kref+0x1cec
	.word	0x9e74c01a	! t0_kref+0x1ce4:   	udiv	%l3, %i2, %o7
	.word	0xd26e0000	! t0_kref+0x1ce8:   	ldstub	[%i0], %o1
	.word	0xcd1fbdc8	! t0_kref+0x1cec:   	ldd	[%fp - 0x238], %f6
	.word	0x98122a7a	! t0_kref+0x1cf0:   	or	%o0, 0xa7a, %o4
	.word	0x9ea0307b	! t0_kref+0x1cf4:   	subcc	%g0, -0xf85, %o7
	.word	0x99a10931	! t0_kref+0x1cf8:   	fmuls	%f4, %f17, %f12
	.word	0x2f480008	! t0_kref+0x1cfc:   	fbu,a,pt	%fcc0, _kref+0x1d1c
	.word	0xc00e7ff7	! t0_kref+0x1d00:   	ldub	[%i1 - 9], %g0
	.word	0xc00e4000	! t0_kref+0x1d04:   	ldub	[%i1], %g0
	.word	0xd8d61000	! t0_kref+0x1d08:   	ldsha	[%i0]0x80, %o4
	.word	0xb5a0054e	! t0_kref+0x1d0c:   	fsqrtd	%f14, %f26
	.word	0x3f800008	! t0_kref+0x1d10:   	fbo,a	_kref+0x1d30
	.word	0xc026200c	! t0_kref+0x1d14:   	clr	[%i0 + 0xc]
	.word	0xf43f4019	! t0_kref+0x1d18:   	std	%i2, [%i5 + %i1]
	.word	0x35800007	! t0_kref+0x1d1c:   	fbue,a	_kref+0x1d38
	.word	0x80a4c013	! t0_kref+0x1d20:   	cmp	%l3, %l3
	.word	0xef20a038	! t0_kref+0x1d24:   	st	%f23, [%g2 + 0x38]
	.word	0xf207bfe0	! t0_kref+0x1d28:   	ld	[%fp - 0x20], %i1
	.word	0x9a980008	! t0_kref+0x1d2c:   	xorcc	%g0, %o0, %o5
	.word	0xd7e65009	! t0_kref+0x1d30:   	casa	[%i1]0x80, %o1, %o3
	.word	0x90a2fb36	! t0_kref+0x1d34:   	subcc	%o3, -0x4ca, %o0
	.word	0xa9a409ae	! t0_kref+0x1d38:   	fdivs	%f16, %f14, %f20
	.word	0x985c2ef9	! t0_kref+0x1d3c:   	smul	%l0, 0xef9, %o4
	.word	0xe9ee101d	! t0_kref+0x1d40:   	prefetcha	%i0 + %i5, 20
	.word	0x2c480007	! t0_kref+0x1d44:   	bneg,a,pt	%icc, _kref+0x1d60
	.word	0xe9b81018	! t0_kref+0x1d48:   	stda	%f20, [%g0 + %i0]0x80
	.word	0x90bcc010	! t0_kref+0x1d4c:   	xnorcc	%l3, %l0, %o0
	.word	0xa5a00546	! t0_kref+0x1d50:   	fsqrtd	%f6, %f18
	.word	0xae446555	! t0_kref+0x1d54:   	addc	%l1, 0x555, %l7
	.word	0x99b00cd0	! t0_kref+0x1d58:   	fnot2	%f16, %f12
	.word	0xd020a018	! t0_kref+0x1d5c:   	st	%o0, [%g2 + 0x18]
	.word	0x80624017	! t0_kref+0x1d60:   	subc	%o1, %l7, %g0
	.word	0x3b480004	! t0_kref+0x1d64:   	fble,a,pt	%fcc0, _kref+0x1d74
	.word	0x89b0874a	! t0_kref+0x1d68:   	fpack32	%f2, %f10, %f4
	.word	0xa5a6083d	! t0_kref+0x1d6c:   	fadds	%f24, %f29, %f18
	.word	0x97b284d0	! t0_kref+0x1d70:   	fcmpne32	%f10, %f16, %o3
	.word	0xada00544	! t0_kref+0x1d74:   	fsqrtd	%f4, %f22
	.word	0xcd981019	! t0_kref+0x1d78:   	ldda	[%g0 + %i1]0x80, %f6
	.word	0x99a01a2d	! t0_kref+0x1d7c:   	fstoi	%f13, %f12
	.word	0x90bde733	! t0_kref+0x1d80:   	xnorcc	%l7, 0x733, %o0
	.word	0x89a0085c	! t0_kref+0x1d84:   	faddd	%f0, %f28, %f4
	.word	0x33480004	! t0_kref+0x1d88:   	fbe,a,pt	%fcc0, _kref+0x1d98
	.word	0xb5a0191d	! t0_kref+0x1d8c:   	fitod	%f29, %f26
	.word	0x9f248009	! t0_kref+0x1d90:   	mulscc	%l2, %o1, %o7
	.word	0xb5a000a9	! t0_kref+0x1d94:   	fnegs	%f9, %f26
	.word	0x95b5c029	! t0_kref+0x1d98:   	edge8n	%l7, %o1, %o2
	.word	0x96053e85	! t0_kref+0x1d9c:   	add	%l4, -0x17b, %o3
	.word	0xd8d01019	! t0_kref+0x1da0:   	ldsha	[%g0 + %i1]0x80, %o4
	.word	0xf9266018	! t0_kref+0x1da4:   	st	%f28, [%i1 + 0x18]
	.word	0x909c8016	! t0_kref+0x1da8:   	xorcc	%l2, %l6, %o0
	.word	0xd8d6d018	! t0_kref+0x1dac:   	ldsha	[%i3 + %i0]0x80, %o4
	.word	0x81b10c50	! t0_kref+0x1db0:   	fnor	%f4, %f16, %f0
	.word	0x81b284d0	! t0_kref+0x1db4:   	fcmpne32	%f10, %f16, %g0
	.word	0x95b1862a	! t0_kref+0x1db8:   	fmul8x16	%f6, %f10, %f10
	.word	0x903d001a	! t0_kref+0x1dbc:   	xnor	%l4, %i2, %o0
	.word	0xaf234010	! t0_kref+0x1dc0:   	mulscc	%o5, %l0, %l7
	.word	0xb5a0191b	! t0_kref+0x1dc4:   	fitod	%f27, %f26
	.word	0xd7062004	! t0_kref+0x1dc8:   	ld	[%i0 + 4], %f11
	.word	0xec1e3ff0	! t0_kref+0x1dcc:   	ldd	[%i0 - 0x10], %l6
	.word	0x81b68502	! t0_kref+0x1dd0:   	fcmpgt16	%f26, %f2, %g0
	.word	0xdc39401d	! t0_kref+0x1dd4:   	std	%sp, [%g5 + %i5]
	.word	0xadb2891c	! t0_kref+0x1dd8:   	faligndata	%f10, %f28, %f22
	.word	0xb1a3884e	! t0_kref+0x1ddc:   	faddd	%f14, %f14, %f24
	.word	0x80634013	! t0_kref+0x1de0:   	subc	%o5, %l3, %g0
	.word	0x3c480003	! t0_kref+0x1de4:   	bpos,a,pt	%icc, _kref+0x1df0
	.word	0x96547ffa	! t0_kref+0x1de8:   	umul	%l1, -0x6, %o3
	.word	0x9a7b4013	! t0_kref+0x1dec:   	sdiv	%o5, %l3, %o5
	.word	0xa5b1863a	! t0_kref+0x1df0:   	fmul8x16	%f6, %f26, %f18
	.word	0xa1a01a5c	! t0_kref+0x1df4:   	fdtoi	%f28, %f16
	.word	0x991c6fb7	! t0_kref+0x1df8:   	tsubcctv	%l1, 0xfb7, %o4
	.word	0xae35a9ab	! t0_kref+0x1dfc:   	orn	%l6, 0x9ab, %l7
	.word	0xb1a00525	! t0_kref+0x1e00:   	fsqrts	%f5, %f24
	.word	0x81af0a4a	! t0_kref+0x1e04:   	fcmpd	%fcc0, %f28, %f10
	.word	0xda0e401a	! t0_kref+0x1e08:   	ldub	[%i1 + %i2], %o5
	.word	0x9e32000c	! t0_kref+0x1e0c:   	orn	%o0, %o4, %o7
	.word	0x8143e04c	! t0_kref+0x1e10:   	membar	0x4c
	.word	0x97b684d4	! t0_kref+0x1e14:   	fcmpne32	%f26, %f20, %o3
	.word	0x96bc0017	! t0_kref+0x1e18:   	xnorcc	%l0, %l7, %o3
	.word	0x9f414000	! t0_kref+0x1e1c:   	mov	%pc, %o7
	.word	0x9efab2b1	! t0_kref+0x1e20:   	sdivcc	%o2, -0xd4f, %o7
	.word	0x81854000	! t0_kref+0x1e24:   	wr	%l5, %g0, %y
	.word	0xef68a084	! t0_kref+0x1e28:   	prefetch	%g2 + 0x84, 23
	.word	0x813ae018	! t0_kref+0x1e2c:   	sra	%o3, 0x18, %g0
	.word	0x33800008	! t0_kref+0x1e30:   	fbe,a	_kref+0x1e50
	.word	0xcd1fbd38	! t0_kref+0x1e34:   	ldd	[%fp - 0x2c8], %f6
	.word	0x91b00fc0	! t0_kref+0x1e38:   	fone	%f8
	.word	0x8db40630	! t0_kref+0x1e3c:   	fmul8x16	%f16, %f16, %f6
	.word	0x800d7d10	! t0_kref+0x1e40:   	and	%l5, -0x2f0, %g0
	.word	0xa9b18624	! t0_kref+0x1e44:   	fmul8x16	%f6, %f4, %f20
	.word	0xf51e7fe8	! t0_kref+0x1e48:   	ldd	[%i1 - 0x18], %f26
	.word	0xb5b70f98	! t0_kref+0x1e4c:   	for	%f28, %f24, %f26
	.word	0x93220010	! t0_kref+0x1e50:   	mulscc	%o0, %l0, %o1
	.word	0x89a7085a	! t0_kref+0x1e54:   	faddd	%f28, %f26, %f4
	.word	0x31800007	! t0_kref+0x1e58:   	fba,a	_kref+0x1e74
	.word	0x81848000	! t0_kref+0x1e5c:   	wr	%l2, %g0, %y
	.word	0x92dc7b87	! t0_kref+0x1e60:   	smulcc	%l1, -0x479, %o1
	.word	0xa5a01027	! t0_kref+0x1e64:   	fstox	%f7, %f18
	.word	0x33800006	! t0_kref+0x1e68:   	fbe,a	_kref+0x1e80
	.word	0xa1a409d2	! t0_kref+0x1e6c:   	fdivd	%f16, %f18, %f16
	.word	0x972d000d	! t0_kref+0x1e70:   	sll	%l4, %o5, %o3
	.word	0x9534e01d	! t0_kref+0x1e74:   	srl	%l3, 0x1d, %o2
	.word	0x81ae8ad8	! t0_kref+0x1e78:   	fcmped	%fcc0, %f26, %f24
	.word	0xb7a01a40	! t0_kref+0x1e7c:   	fdtoi	%f0, %f27
	.word	0xdb070018	! t0_kref+0x1e80:   	ld	[%i4 + %i0], %f13
	.word	0x99b10e46	! t0_kref+0x1e84:   	fxnor	%f4, %f6, %f12
	.word	0x92c5c014	! t0_kref+0x1e88:   	addccc	%l7, %l4, %o1
	.word	0x9e82eb81	! t0_kref+0x1e8c:   	addcc	%o3, 0xb81, %o7
	call	SYM(t0_subr2)
	.word	0xda961000	! t0_kref+0x1e94:   	lduha	[%i0]0x80, %o5
	.word	0x98800015	! t0_kref+0x1e98:   	addcc	%g0, %l5, %o4
	.word	0xbbb50ca8	! t0_kref+0x1e9c:   	fandnot2s	%f20, %f8, %f29
	.word	0x961e8011	! t0_kref+0x1ea0:   	xor	%i2, %l1, %o3
	.word	0xae722379	! t0_kref+0x1ea4:   	udiv	%o0, 0x379, %l7
	.word	0x94a435cf	! t0_kref+0x1ea8:   	subcc	%l0, -0xa31, %o2
	.word	0xee4e8019	! t0_kref+0x1eac:   	ldsb	[%i2 + %i1], %l7
	.word	0x3b800005	! t0_kref+0x1eb0:   	fble,a	_kref+0x1ec4
	.word	0xa5a01909	! t0_kref+0x1eb4:   	fitod	%f9, %f18
	.word	0x925cfbbc	! t0_kref+0x1eb8:   	smul	%l3, -0x444, %o1
	.word	0x809ea16c	! t0_kref+0x1ebc:   	xorcc	%i2, 0x16c, %g0
	.word	0x97b5814c	! t0_kref+0x1ec0:   	edge32l	%l6, %o4, %o3
	.word	0x93b00149	! t0_kref+0x1ec4:   	edge32l	%g0, %o1, %o1
	.word	0xc048a00b	! t0_kref+0x1ec8:   	ldsb	[%g2 + 0xb], %g0
	.word	0xda566010	! t0_kref+0x1ecc:   	ldsh	[%i1 + 0x10], %o5
	.word	0xf720a034	! t0_kref+0x1ed0:   	st	%f27, [%g2 + 0x34]
	.word	0x972b400d	! t0_kref+0x1ed4:   	sll	%o5, %o5, %o3
	.word	0x27800001	! t0_kref+0x1ed8:   	fbul,a	_kref+0x1edc
	.word	0x92b0214f	! t0_kref+0x1edc:   	orncc	%g0, 0x14f, %o1
	.word	0xc386501c	! t0_kref+0x1ee0:   	lda	[%i1 + %i4]0x80, %f1
	.word	0xb7a00129	! t0_kref+0x1ee4:   	fabss	%f9, %f27
	.word	0xd2680018	! t0_kref+0x1ee8:   	ldstub	[%g0 + %i0], %o1
	.word	0x27480007	! t0_kref+0x1eec:   	fbul,a,pt	%fcc0, _kref+0x1f08
	.word	0xb5ab8054	! t0_kref+0x1ef0:   	fmovdule	%fcc0, %f20, %f26
	.word	0x87b007bc	! t0_kref+0x1ef4:   	fpackfix	%f28, %f3
	.word	0x99a0053d	! t0_kref+0x1ef8:   	fsqrts	%f29, %f12
	.word	0x8fa2492a	! t0_kref+0x1efc:   	fmuls	%f9, %f10, %f7
	.word	0xb9a00542	! t0_kref+0x1f00:   	fsqrtd	%f2, %f28
	.word	0x80b4b44b	! t0_kref+0x1f04:   	orncc	%l2, -0xbb5, %g0
	.word	0xe3067fe4	! t0_kref+0x1f08:   	ld	[%i1 - 0x1c], %f17
	.word	0xa5a0052d	! t0_kref+0x1f0c:   	fsqrts	%f13, %f18
	.word	0x85b68acc	! t0_kref+0x1f10:   	fpsub32	%f26, %f12, %f2
	.word	0x95b5c350	! t0_kref+0x1f14:   	alignaddrl	%l7, %l0, %o2
	.word	0xb9a00548	! t0_kref+0x1f18:   	fsqrtd	%f8, %f28
	.word	0xa1a00542	! t0_kref+0x1f1c:   	fsqrtd	%f2, %f16
	.word	0x9db30e80	! t0_kref+0x1f20:   	fsrc1	%f12, %f14
	.word	0x9fb007bc	! t0_kref+0x1f24:   	fpackfix	%f28, %f15
	.word	0x9885001a	! t0_kref+0x1f28:   	addcc	%l4, %i2, %o4
	.word	0xd03e6000	! t0_kref+0x1f2c:   	std	%o0, [%i1]
	.word	0x9e32c000	! t0_kref+0x1f30:   	orn	%o3, %g0, %o7
	.word	0x9ab2c00a	! t0_kref+0x1f34:   	orncc	%o3, %o2, %o5
	.word	0x94bd264b	! t0_kref+0x1f38:   	xnorcc	%l4, 0x64b, %o2
	.word	0x8db30e2e	! t0_kref+0x1f3c:   	fands	%f12, %f14, %f6
	.word	0x17310f17	! t0_kref+0x1f40:   	sethi	%hi(0xc43c5c00), %o3
	.word	0x2d800003	! t0_kref+0x1f44:   	fbg,a	_kref+0x1f50
	.word	0xd2fe101c	! t0_kref+0x1f48:   	swapa	[%i0 + %i4]0x80, %o1
	.word	0x3c800005	! t0_kref+0x1f4c:   	bpos,a	_kref+0x1f60
	.word	0x92c4c011	! t0_kref+0x1f50:   	addccc	%l3, %l1, %o1
	.word	0xae3a8017	! t0_kref+0x1f54:   	xnor	%o2, %l7, %l7
	.word	0x97b384d8	! t0_kref+0x1f58:   	fcmpne32	%f14, %f24, %o3
	.word	0x91b406f6	! t0_kref+0x1f5c:   	fmul8ulx16	%f16, %f22, %f8
	.word	0x3a800006	! t0_kref+0x1f60:   	bcc,a	_kref+0x1f78
	.word	0xa1a0052e	! t0_kref+0x1f64:   	fsqrts	%f14, %f16
	.word	0x90baa75a	! t0_kref+0x1f68:   	xnorcc	%o2, 0x75a, %o0
	.word	0xd6270018	! t0_kref+0x1f6c:   	st	%o3, [%i4 + %i0]
	.word	0xd82e6003	! t0_kref+0x1f70:   	stb	%o4, [%i1 + 3]
	.word	0x99a00550	! t0_kref+0x1f74:   	fsqrtd	%f16, %f12
	.word	0xd8080018	! t0_kref+0x1f78:   	ldub	[%g0 + %i0], %o4
	.word	0x2e800002	! t0_kref+0x1f7c:   	bvs,a	_kref+0x1f84
	.word	0xd02e0000	! t0_kref+0x1f80:   	stb	%o0, [%i0]
	.word	0x9da0190b	! t0_kref+0x1f84:   	fitod	%f11, %f14
	.word	0x80d22ec8	! t0_kref+0x1f88:   	umulcc	%o0, 0xec8, %g0
	.word	0x9a3daf42	! t0_kref+0x1f8c:   	xnor	%l6, 0xf42, %o5
	.word	0x91b580f6	! t0_kref+0x1f90:   	edge16ln	%l6, %l6, %o0
	.word	0x9adb6a15	! t0_kref+0x1f94:   	smulcc	%o5, 0xa15, %o5
	.word	0xf42e7fe2	! t0_kref+0x1f98:   	stb	%i2, [%i1 - 0x1e]
	.word	0x95400000	! t0_kref+0x1f9c:   	mov	%y, %o2
	.word	0xe720a030	! t0_kref+0x1fa0:   	st	%f19, [%g2 + 0x30]
	.word	0xafa00521	! t0_kref+0x1fa4:   	fsqrts	%f1, %f23
	.word	0xec180019	! t0_kref+0x1fa8:   	ldd	[%g0 + %i1], %l6
	.word	0x907c6428	! t0_kref+0x1fac:   	sdiv	%l1, 0x428, %o0
	.word	0xe13e001d	! t0_kref+0x1fb0:   	std	%f16, [%i0 + %i5]
	.word	0xb1a6493b	! t0_kref+0x1fb4:   	fmuls	%f25, %f27, %f24
	.word	0xa5b0ce68	! t0_kref+0x1fb8:   	fxnors	%f3, %f8, %f18
	.word	0x3d480002	! t0_kref+0x1fbc:   	fbule,a,pt	%fcc0, _kref+0x1fc4
	.word	0x98c3400a	! t0_kref+0x1fc0:   	addccc	%o5, %o2, %o4
	.word	0x35800007	! t0_kref+0x1fc4:   	fbue,a	_kref+0x1fe0
	.word	0x99a01936	! t0_kref+0x1fc8:   	fstod	%f22, %f12
	.word	0x3c800003	! t0_kref+0x1fcc:   	bpos,a	_kref+0x1fd8
	.word	0x90fb6ea1	! t0_kref+0x1fd0:   	sdivcc	%o5, 0xea1, %o0
	.word	0x931d6381	! t0_kref+0x1fd4:   	tsubcctv	%l5, 0x381, %o1
	.word	0xaec48009	! t0_kref+0x1fd8:   	addccc	%l2, %o1, %l7
	.word	0x33480006	! t0_kref+0x1fdc:   	fbe,a,pt	%fcc0, _kref+0x1ff4
	.word	0x9842c012	! t0_kref+0x1fe0:   	addc	%o3, %l2, %o4
	.word	0xe83e3ff0	! t0_kref+0x1fe4:   	std	%l4, [%i0 - 0x10]
	.word	0x2f1935af	! t0_kref+0x1fe8:   	sethi	%hi(0x64d6bc00), %l7
	.word	0xd640a034	! t0_kref+0x1fec:   	ldsw	[%g2 + 0x34], %o3
	.word	0x92b4c016	! t0_kref+0x1ff0:   	orncc	%l3, %l6, %o1
	.word	0x32480006	! t0_kref+0x1ff4:   	bne,a,pt	%icc, _kref+0x200c
	.word	0xd46e7fff	! t0_kref+0x1ff8:   	ldstub	[%i1 - 1], %o2
	.word	0x91b60d08	! t0_kref+0x1ffc:   	fandnot1	%f24, %f8, %f8
	.word	0x3e480006	! t0_kref+0x2000:   	bvc,a,pt	%icc, _kref+0x2018
	.word	0xc000a038	! t0_kref+0x2004:   	ld	[%g2 + 0x38], %g0
	.word	0xb7a389b5	! t0_kref+0x2008:   	fdivs	%f14, %f21, %f27
	.word	0xae3e800d	! t0_kref+0x200c:   	xnor	%i2, %o5, %l7
	.word	0xada00533	! t0_kref+0x2010:   	fsqrts	%f19, %f22
	.word	0xb7a000a3	! t0_kref+0x2014:   	fnegs	%f3, %f27
	.word	0x91a00129	! t0_kref+0x2018:   	fabss	%f9, %f8
	.word	0x87802082	! t0_kref+0x201c:   	mov	0x82, %asi
	.word	0x9edd8015	! t0_kref+0x2020:   	smulcc	%l6, %l5, %o7
	.word	0xc0080018	! t0_kref+0x2024:   	ldub	[%g0 + %i0], %g0
	.word	0x982ac015	! t0_kref+0x2028:   	andn	%o3, %l5, %o4
	.word	0x97b54049	! t0_kref+0x202c:   	edge8l	%l5, %o1, %o3
	.word	0x98fa4011	! t0_kref+0x2030:   	sdivcc	%o1, %l1, %o4
	.word	0xb5a01a4c	! t0_kref+0x2034:   	fdtoi	%f12, %f26
	.word	0xf4270018	! t0_kref+0x2038:   	st	%i2, [%i4 + %i0]
	.word	0xda68a033	! t0_kref+0x203c:   	ldstub	[%g2 + 0x33], %o5
	.word	0x99a588c6	! t0_kref+0x2040:   	fsubd	%f22, %f6, %f12
	.word	0x9a9dc015	! t0_kref+0x2044:   	xorcc	%l7, %l5, %o5
	.word	0x32480005	! t0_kref+0x2048:   	bne,a,pt	%icc, _kref+0x205c
	.word	0x9113221a	! t0_kref+0x204c:   	taddcctv	%o4, 0x21a, %o0
	.word	0x9a5b264e	! t0_kref+0x2050:   	smul	%o4, 0x64e, %o5
	.word	0x83a54925	! t0_kref+0x2054:   	fmuls	%f21, %f5, %f1
	.word	0x23480005	! t0_kref+0x2058:   	fbne,a,pt	%fcc0, _kref+0x206c
	.word	0xabb007a6	! t0_kref+0x205c:   	fpackfix	%f6, %f21
	.word	0x8033000d	! t0_kref+0x2060:   	orn	%o4, %o5, %g0
	.word	0xd27e001c	! t0_kref+0x2064:   	swap	[%i0 + %i4], %o1
	.word	0x36800007	! t0_kref+0x2068:   	bge,a	_kref+0x2084
	.word	0xe51fbe90	! t0_kref+0x206c:   	ldd	[%fp - 0x170], %f18
	.word	0xed9e1000	! t0_kref+0x2070:   	ldda	[%i0]0x80, %f22
	.word	0x9085800a	! t0_kref+0x2074:   	addcc	%l6, %o2, %o0
	.word	0x80bc360c	! t0_kref+0x2078:   	xnorcc	%l0, -0x9f4, %g0
	.word	0xe278a02c	! t0_kref+0x207c:   	swap	[%g2 + 0x2c], %l1
	.word	0x9db00e4a	! t0_kref+0x2080:   	fxnor	%f0, %f10, %f14
	.word	0xd51fbe58	! t0_kref+0x2084:   	ldd	[%fp - 0x1a8], %f10
	.word	0xb5b6caaa	! t0_kref+0x2088:   	fpsub16s	%f27, %f10, %f26
	.word	0x95a0191d	! t0_kref+0x208c:   	fitod	%f29, %f10
	.word	0x91a00127	! t0_kref+0x2090:   	fabss	%f7, %f8
	.word	0xd59e1000	! t0_kref+0x2094:   	ldda	[%i0]0x80, %f10
	.word	0xa5a0013d	! t0_kref+0x2098:   	fabss	%f29, %f18
	.word	0x9da409d4	! t0_kref+0x209c:   	fdivd	%f16, %f20, %f14
	.word	0x813de016	! t0_kref+0x20a0:   	sra	%l7, 0x16, %g0
	.word	0x26800006	! t0_kref+0x20a4:   	bl,a	_kref+0x20bc
	.word	0xa9a589c2	! t0_kref+0x20a8:   	fdivd	%f22, %f2, %f20
	.word	0x92b0000b	! t0_kref+0x20ac:   	orncc	%g0, %o3, %o1
	.word	0xda0e3ff6	! t0_kref+0x20b0:   	ldub	[%i0 - 0xa], %o5
	.word	0xd82e4000	! t0_kref+0x20b4:   	stb	%o4, [%i1]
	.word	0xd4801019	! t0_kref+0x20b8:   	lda	[%g0 + %i1]0x80, %o2
	.word	0xa1a0c83c	! t0_kref+0x20bc:   	fadds	%f3, %f28, %f16
	.word	0x80553870	! t0_kref+0x20c0:   	umul	%l4, -0x790, %g0
	.word	0xa9a209ce	! t0_kref+0x20c4:   	fdivd	%f8, %f14, %f20
	.word	0x39800001	! t0_kref+0x20c8:   	fbuge,a	_kref+0x20cc
	.word	0xf99eda59	! t0_kref+0x20cc:   	ldda	[%i3 + %i1]0xd2, %f28
	.word	0x89a00523	! t0_kref+0x20d0:   	fsqrts	%f3, %f4
	.word	0x8db38a88	! t0_kref+0x20d4:   	fpsub16	%f14, %f8, %f6
	.word	0x90b5c013	! t0_kref+0x20d8:   	orncc	%l7, %l3, %o0
	.word	0x81858000	! t0_kref+0x20dc:   	wr	%l6, %g0, %y
	.word	0xa1b00cf3	! t0_kref+0x20e0:   	fnot2s	%f19, %f16
	.word	0xf007bfe0	! t0_kref+0x20e4:   	ld	[%fp - 0x20], %i0
	.word	0x81ae8a5a	! t0_kref+0x20e8:   	fcmpd	%fcc0, %f26, %f26
	.word	0x92c523ee	! t0_kref+0x20ec:   	addccc	%l4, 0x3ee, %o1
	.word	0x2d800002	! t0_kref+0x20f0:   	fbg,a	_kref+0x20f8
	.word	0xec1f4019	! t0_kref+0x20f4:   	ldd	[%i5 + %i1], %l6
	.word	0xa5a01901	! t0_kref+0x20f8:   	fitod	%f1, %f18
	.word	0xc807bfe4	! t0_kref+0x20fc:   	ld	[%fp - 0x1c], %g4
	.word	0x96d5f4f3	! t0_kref+0x2100:   	umulcc	%l7, -0xb0d, %o3
	.word	0x81ac0a44	! t0_kref+0x2104:   	fcmpd	%fcc0, %f16, %f4
	.word	0xd03e0000	! t0_kref+0x2108:   	std	%o0, [%i0]
	.word	0xb9a389c6	! t0_kref+0x210c:   	fdivd	%f14, %f6, %f28
	.word	0x94dcc009	! t0_kref+0x2110:   	smulcc	%l3, %o1, %o2
	.word	0x9de3bfa0	! t0_kref+0x2114:   	save	%sp, -0x60, %sp
	.word	0xb48efeea	! t0_kref+0x2118:   	andcc	%i3, -0x116, %i2
	.word	0x93ee401d	! t0_kref+0x211c:   	restore	%i1, %i5, %o1
	.word	0xe16e3ff0	! t0_kref+0x2120:   	prefetch	%i0 - 0x10, 16
	.word	0x81ad0ac8	! t0_kref+0x2124:   	fcmped	%fcc0, %f20, %f8
	.word	0xec180018	! t0_kref+0x2128:   	ldd	[%g0 + %i0], %l6
	.word	0xd620a00c	! t0_kref+0x212c:   	st	%o3, [%g2 + 0xc]
	.word	0xb3a58837	! t0_kref+0x2130:   	fadds	%f22, %f23, %f25
	.word	0xbba018d6	! t0_kref+0x2134:   	fdtos	%f22, %f29
	.word	0x81aa0ad2	! t0_kref+0x2138:   	fcmped	%fcc0, %f8, %f18
	.word	0x81a88a44	! t0_kref+0x213c:   	fcmpd	%fcc0, %f2, %f4
	.word	0xec180019	! t0_kref+0x2140:   	ldd	[%g0 + %i1], %l6
	.word	0xcd1f4019	! t0_kref+0x2144:   	ldd	[%i5 + %i1], %f6
	.word	0x9fc00004	! t0_kref+0x2148:   	call	%g0 + %g4
	.word	0x905c0000	! t0_kref+0x214c:   	smul	%l0, %g0, %o0
	.word	0x972b2000	! t0_kref+0x2150:   	sll	%o4, 0x0, %o3
	.word	0x8143c000	! t0_kref+0x2154:   	stbar
	.word	0xf11fbfd0	! t0_kref+0x2158:   	ldd	[%fp - 0x30], %f24
	.word	0xec1f4018	! t0_kref+0x215c:   	ldd	[%i5 + %i0], %l6
	.word	0xa9b68a54	! t0_kref+0x2160:   	fpadd32	%f26, %f20, %f20
	.word	0x80fa8016	! t0_kref+0x2164:   	sdivcc	%o2, %l6, %g0
	.word	0x80b44013	! t0_kref+0x2168:   	orncc	%l1, %l3, %g0
	.word	0x33480008	! t0_kref+0x216c:   	fbe,a,pt	%fcc0, _kref+0x218c
	.word	0x81830000	! t0_kref+0x2170:   	wr	%o4, %g0, %y
	.word	0xaebaf840	! t0_kref+0x2174:   	xnorcc	%o3, -0x7c0, %l7
	.word	0x9db00ce5	! t0_kref+0x2178:   	fnot2s	%f5, %f14
	.word	0x3e480007	! t0_kref+0x217c:   	bvc,a,pt	%icc, _kref+0x2198
	.word	0x95b204ce	! t0_kref+0x2180:   	fcmpne32	%f8, %f14, %o2
	.word	0x81aa0ac4	! t0_kref+0x2184:   	fcmped	%fcc0, %f8, %f4
	.word	0xd6270019	! t0_kref+0x2188:   	st	%o3, [%i4 + %i1]
	.word	0xae9c4015	! t0_kref+0x218c:   	xorcc	%l1, %l5, %l7
	.word	0x81aa0aae	! t0_kref+0x2190:   	fcmpes	%fcc0, %f8, %f14
	.word	0x98368008	! t0_kref+0x2194:   	orn	%i2, %o0, %o4
	.word	0xb9a00152	! t0_kref+0x2198:   	fabsd	%f18, %f28
	.word	0x3c800001	! t0_kref+0x219c:   	bpos,a	_kref+0x21a0
	.word	0xec6e7ffd	! t0_kref+0x21a0:   	ldstub	[%i1 - 3], %l6
	.word	0x81ae4aad	! t0_kref+0x21a4:   	fcmpes	%fcc0, %f25, %f13
	.word	0xd40e001a	! t0_kref+0x21a8:   	ldub	[%i0 + %i2], %o2
	.word	0x3c480003	! t0_kref+0x21ac:   	bpos,a,pt	%icc, _kref+0x21b8
	.word	0xa1a7083c	! t0_kref+0x21b0:   	fadds	%f28, %f28, %f16
	.word	0x90868011	! t0_kref+0x21b4:   	addcc	%i2, %l1, %o0
	.word	0xd02e4000	! t0_kref+0x21b8:   	stb	%o0, [%i1]
	.word	0x937024af	! t0_kref+0x21bc:   	popc	0x4af, %o1
	.word	0x963c4009	! t0_kref+0x21c0:   	xnor	%l1, %o1, %o3
	.word	0x9e300009	! t0_kref+0x21c4:   	orn	%g0, %o1, %o7
	.word	0x93b200d6	! t0_kref+0x21c8:   	edge16l	%o0, %l6, %o1
	.word	0xee363fec	! t0_kref+0x21cc:   	sth	%l7, [%i0 - 0x14]
	.word	0x99b68756	! t0_kref+0x21d0:   	fpack32	%f26, %f22, %f12
	.word	0x95b28080	! t0_kref+0x21d4:   	edge16	%o2, %g0, %o2
	.word	0x9a5cc009	! t0_kref+0x21d8:   	smul	%l3, %o1, %o5
	.word	0x32480008	! t0_kref+0x21dc:   	bne,a,pt	%icc, _kref+0x21fc
	.word	0x96f80015	! t0_kref+0x21e0:   	sdivcc	%g0, %l5, %o3
	.word	0x9f400000	! t0_kref+0x21e4:   	mov	%y, %o7
	.word	0xc010a00c	! t0_kref+0x21e8:   	lduh	[%g2 + 0xc], %g0
	.word	0xe62e7fe8	! t0_kref+0x21ec:   	stb	%l3, [%i1 - 0x18]
	.word	0x11232d7a	! t0_kref+0x21f0:   	sethi	%hi(0x8cb5e800), %o0
	.word	0xd8562012	! t0_kref+0x21f4:   	ldsh	[%i0 + 0x12], %o4
	.word	0x80fc4000	! t0_kref+0x21f8:   	sdivcc	%l1, %g0, %g0
	.word	0x8ba00136	! t0_kref+0x21fc:   	fabss	%f22, %f5
	.word	0xaed43886	! t0_kref+0x2200:   	umulcc	%l0, -0x77a, %l7
	.word	0x9da0192f	! t0_kref+0x2204:   	fstod	%f15, %f14
	.word	0x87802080	! t0_kref+0x2208:   	mov	0x80, %asi
	.word	0x25480003	! t0_kref+0x220c:   	fblg,a,pt	%fcc0, _kref+0x2218
	.word	0xc93e3fe8	! t0_kref+0x2210:   	std	%f4, [%i0 - 0x18]
	.word	0x96352ec1	! t0_kref+0x2214:   	orn	%l4, 0xec1, %o3
	.word	0xaf24658d	! t0_kref+0x2218:   	mulscc	%l1, 0x58d, %l7
	.word	0x21800006	! t0_kref+0x221c:   	fbn,a	_kref+0x2234
	.word	0x9fb44009	! t0_kref+0x2220:   	edge8	%l1, %o1, %o7
	.word	0xadb10dda	! t0_kref+0x2224:   	fnand	%f4, %f26, %f22
	.word	0xde0e0000	! t0_kref+0x2228:   	ldub	[%i0], %o7
	.word	0x97a0c8b5	! t0_kref+0x222c:   	fsubs	%f3, %f21, %f11
	.word	0x32800003	! t0_kref+0x2230:   	bne,a	_kref+0x223c
	.word	0xa9b286c8	! t0_kref+0x2234:   	fmul8sux16	%f10, %f8, %f20
	.word	0x81a90ac4	! t0_kref+0x2238:   	fcmped	%fcc0, %f4, %f4
	.word	0x2a800002	! t0_kref+0x223c:   	bcs,a	_kref+0x2244
	.word	0xa1b0471b	! t0_kref+0x2240:   	fmuld8sux16	%f1, %f27, %f16
	.word	0xd62e8019	! t0_kref+0x2244:   	stb	%o3, [%i2 + %i1]
	.word	0xf91e401d	! t0_kref+0x2248:   	ldd	[%i1 + %i5], %f28
	.word	0xa1b30f8a	! t0_kref+0x224c:   	for	%f12, %f10, %f16
	.word	0x9aa42e69	! t0_kref+0x2250:   	subcc	%l0, 0xe69, %o5
	.word	0xd8b63fee	! t0_kref+0x2254:   	stha	%o4, [%i0 - 0x12]%asi
	.word	0xd2270018	! t0_kref+0x2258:   	st	%o1, [%i4 + %i0]
	.word	0xaf3c801a	! t0_kref+0x225c:   	sra	%l2, %i2, %l7
	.word	0xec180018	! t0_kref+0x2260:   	ldd	[%g0 + %i0], %l6
	.word	0x39800003	! t0_kref+0x2264:   	fbuge,a	_kref+0x2270
	.word	0xec1e4000	! t0_kref+0x2268:   	ldd	[%i1], %l6
	.word	0xcd262010	! t0_kref+0x226c:   	st	%f6, [%i0 + 0x10]
	.word	0x927ac000	! t0_kref+0x2270:   	sdiv	%o3, %g0, %o1
	.word	0x95400000	! t0_kref+0x2274:   	mov	%y, %o2
	.word	0x905b4012	! t0_kref+0x2278:   	smul	%o5, %l2, %o0
	.word	0xec760000	! t0_kref+0x227c:   	stx	%l6, [%i0]
	.word	0xafb2cdb6	! t0_kref+0x2280:   	fxors	%f11, %f22, %f23
	.word	0x801a6b23	! t0_kref+0x2284:   	xor	%o1, 0xb23, %g0
	.word	0xa9b50d10	! t0_kref+0x2288:   	fandnot1	%f20, %f16, %f20
	.word	0x965ac009	! t0_kref+0x228c:   	smul	%o3, %o1, %o3
	.word	0x81854000	! t0_kref+0x2290:   	wr	%l5, %g0, %y
	.word	0x27480007	! t0_kref+0x2294:   	fbul,a,pt	%fcc0, _kref+0x22b0
	.word	0x989dc00a	! t0_kref+0x2298:   	xorcc	%l7, %o2, %o4
	.word	0xa5b40990	! t0_kref+0x229c:   	bshuffle	%f16, %f16, %f18
	.word	0x2e480005	! t0_kref+0x22a0:   	bvs,a,pt	%icc, _kref+0x22b4
	.word	0x8014299f	! t0_kref+0x22a4:   	or	%l0, 0x99f, %g0
	.word	0x9da01910	! t0_kref+0x22a8:   	fitod	%f16, %f14
	.word	0xd87f0019	! t0_kref+0x22ac:   	swap	[%i4 + %i1], %o4
	.word	0x99202dd9	! t0_kref+0x22b0:   	mulscc	%g0, 0xdd9, %o4
	.word	0x2d480006	! t0_kref+0x22b4:   	fbg,a,pt	%fcc0, _kref+0x22cc
	.word	0x90c2e828	! t0_kref+0x22b8:   	addccc	%o3, 0x828, %o0
	.word	0xd4ce9018	! t0_kref+0x22bc:   	ldsba	[%i2 + %i0]0x80, %o2
	.word	0xa5b10f86	! t0_kref+0x22c0:   	for	%f4, %f6, %f18
	.word	0x8182c000	! t0_kref+0x22c4:   	wr	%o3, %g0, %y
	.word	0xec78a02c	! t0_kref+0x22c8:   	swap	[%g2 + 0x2c], %l6
	.word	0xb9b40626	! t0_kref+0x22cc:   	fmul8x16	%f16, %f6, %f28
	.word	0x81aaca34	! t0_kref+0x22d0:   	fcmps	%fcc0, %f11, %f20
	.word	0xafb00550	! t0_kref+0x22d4:   	fcmpeq16	%f0, %f16, %l7
	.word	0xefee501c	! t0_kref+0x22d8:   	prefetcha	%i1 + %i4, 23
	.word	0xaf25c01a	! t0_kref+0x22dc:   	mulscc	%l7, %i2, %l7
	.word	0x91b74df2	! t0_kref+0x22e0:   	fnands	%f29, %f18, %f8
	.word	0x9a380011	! t0_kref+0x22e4:   	xnor	%g0, %l1, %o5
	.word	0x8bb74f7d	! t0_kref+0x22e8:   	fornot1s	%f29, %f29, %f5
	.word	0xae0c4011	! t0_kref+0x22ec:   	and	%l1, %l1, %l7
	.word	0x37480005	! t0_kref+0x22f0:   	fbge,a,pt	%fcc0, _kref+0x2304
	.word	0xd2f81018	! t0_kref+0x22f4:   	swapa	[%g0 + %i0]0x80, %o1
	.word	0x9123000b	! t0_kref+0x22f8:   	mulscc	%o4, %o3, %o0
	.word	0xff6e001d	! t0_kref+0x22fc:   	prefetch	%i0 + %i5, 31
	.word	0x95a00558	! t0_kref+0x2300:   	fsqrtd	%f24, %f10
	.word	0xc00e001a	! t0_kref+0x2304:   	ldub	[%i0 + %i2], %g0
	.word	0x943da27b	! t0_kref+0x2308:   	xnor	%l6, 0x27b, %o2
	.word	0xf3063ff0	! t0_kref+0x230c:   	ld	[%i0 - 0x10], %f25
	.word	0xaedc0014	! t0_kref+0x2310:   	smulcc	%l0, %l4, %l7
	.word	0x81ac0a52	! t0_kref+0x2314:   	fcmpd	%fcc0, %f16, %f18
	.word	0x9e9cf9af	! t0_kref+0x2318:   	xorcc	%l3, -0x651, %o7
	.word	0xc807bfec	! t0_kref+0x231c:   	ld	[%fp - 0x14], %g4
	.word	0xa5a00526	! t0_kref+0x2320:   	fsqrts	%f6, %f18
	.word	0x9f156f49	! t0_kref+0x2324:   	taddcctv	%l5, 0xf49, %o7
	.word	0xae95000d	! t0_kref+0x2328:   	orcc	%l4, %o5, %l7
	.word	0x922b400a	! t0_kref+0x232c:   	andn	%o5, %o2, %o1
	.word	0x3a480005	! t0_kref+0x2330:   	bcc,a,pt	%icc, _kref+0x2344
	.word	0xa5a01a22	! t0_kref+0x2334:   	fstoi	%f2, %f18
	.word	0x929c800c	! t0_kref+0x2338:   	xorcc	%l2, %o4, %o1
	.word	0xa1a58854	! t0_kref+0x233c:   	faddd	%f22, %f20, %f16
	.word	0xe4be2018	! t0_kref+0x2340:   	stda	%l2, [%i0 + 0x18]%asi
	.word	0x932ce013	! t0_kref+0x2344:   	sll	%l3, 0x13, %o1
	.word	0xe22e601b	! t0_kref+0x2348:   	stb	%l1, [%i1 + 0x1b]
	.word	0x99a689dc	! t0_kref+0x234c:   	fdivd	%f26, %f28, %f12
	.word	0xc11fbc08	! t0_kref+0x2350:   	ldd	[%fp - 0x3f8], %f0
	.word	0x9f400000	! t0_kref+0x2354:   	mov	%y, %o7
	.word	0x87a0109a	! t0_kref+0x2358:   	fxtos	%f26, %f3
	.word	0x32480008	! t0_kref+0x235c:   	bne,a,pt	%icc, _kref+0x237c
	.word	0xafb20170	! t0_kref+0x2360:   	edge32ln	%o0, %l0, %l7
	.word	0xa9a000bd	! t0_kref+0x2364:   	fnegs	%f29, %f20
	.word	0xcd9f5019	! t0_kref+0x2368:   	ldda	[%i5 + %i1]0x80, %f6
	.word	0x3f480004	! t0_kref+0x236c:   	fbo,a,pt	%fcc0, _kref+0x237c
	.word	0xb5a01a30	! t0_kref+0x2370:   	fstoi	%f16, %f26
	.word	0xda0e8018	! t0_kref+0x2374:   	ldub	[%i2 + %i0], %o5
	.word	0x9b2d8009	! t0_kref+0x2378:   	sll	%l6, %o1, %o5
	.word	0x920c8009	! t0_kref+0x237c:   	and	%l2, %o1, %o1
	.word	0xc00e4000	! t0_kref+0x2380:   	ldub	[%i1], %g0
	.word	0xebee501a	! t0_kref+0x2384:   	prefetcha	%i1 + %i2, 21
	.word	0x9de3bfa0	! t0_kref+0x2388:   	save	%sp, -0x60, %sp
	.word	0xb28eac7a	! t0_kref+0x238c:   	andcc	%i2, 0xc7a, %i1
	.word	0x93ef401a	! t0_kref+0x2390:   	restore	%i5, %i2, %o1
	.word	0x23800008	! t0_kref+0x2394:   	fbne,a	_kref+0x23b4
	.word	0x94fa2bbd	! t0_kref+0x2398:   	sdivcc	%o0, 0xbbd, %o2
	.word	0xd20e200a	! t0_kref+0x239c:   	ldub	[%i0 + 0xa], %o1
	.word	0xa1a01911	! t0_kref+0x23a0:   	fitod	%f17, %f16
	.word	0xa5b20c9c	! t0_kref+0x23a4:   	fandnot2	%f8, %f28, %f18
	.word	0x34480006	! t0_kref+0x23a8:   	bg,a,pt	%icc, _kref+0x23c0
	.word	0xe82e201e	! t0_kref+0x23ac:   	stb	%l4, [%i0 + 0x1e]
	.word	0x2a800007	! t0_kref+0x23b0:   	bcs,a	_kref+0x23cc
	.word	0xaba04832	! t0_kref+0x23b4:   	fadds	%f1, %f18, %f21
	.word	0xd0070018	! t0_kref+0x23b8:   	ld	[%i4 + %i0], %o0
	.word	0x909c62e3	! t0_kref+0x23bc:   	xorcc	%l1, 0x2e3, %o0
	.word	0xecb0a000	! t0_kref+0x23c0:   	stha	%l6, [%g2]%asi
	.word	0x81b00fc0	! t0_kref+0x23c4:   	fone	%f0
	.word	0x3b480006	! t0_kref+0x23c8:   	fble,a,pt	%fcc0, _kref+0x23e0
	.word	0xd04e3ffd	! t0_kref+0x23cc:   	ldsb	[%i0 - 3], %o0
	.word	0x9fc00004	! t0_kref+0x23d0:   	call	%g0 + %g4
	.word	0x99b007b2	! t0_kref+0x23d4:   	fpackfix	%f18, %f12
	.word	0x9e932d81	! t0_kref+0x23d8:   	orcc	%o4, 0xd81, %o7
	.word	0x943d4015	! t0_kref+0x23dc:   	xnor	%l5, %l5, %o2
	.word	0x95a00554	! t0_kref+0x23e0:   	fsqrtd	%f20, %f10
	.word	0xe0fe7ff4	! t0_kref+0x23e4:   	swapa	[%i1 - 0xc]%asi, %l0
	.word	0xd6766000	! t0_kref+0x23e8:   	stx	%o3, [%i1]
	.word	0xdaf61000	! t0_kref+0x23ec:   	stxa	%o5, [%i0]0x80
	.word	0xd91fbea8	! t0_kref+0x23f0:   	ldd	[%fp - 0x158], %f12
	.word	0x9aba4010	! t0_kref+0x23f4:   	xnorcc	%o1, %l0, %o5
	.word	0x94fa4016	! t0_kref+0x23f8:   	sdivcc	%o1, %l6, %o2
	.word	0xd40e001a	! t0_kref+0x23fc:   	ldub	[%i0 + %i2], %o2
	.word	0x9ead401a	! t0_kref+0x2400:   	andncc	%l5, %i2, %o7
	.word	0xa9a7493a	! t0_kref+0x2404:   	fmuls	%f29, %f26, %f20
	.word	0x81352003	! t0_kref+0x2408:   	srl	%l4, 0x3, %g0
	.word	0xe430a006	! t0_kref+0x240c:   	sth	%l2, [%g2 + 6]
	.word	0xec1e0000	! t0_kref+0x2410:   	ldd	[%i0], %l6
	.word	0x9e12b0c8	! t0_kref+0x2414:   	or	%o2, -0xf38, %o7
	.word	0x91a01919	! t0_kref+0x2418:   	fitod	%f25, %f8
	.word	0xae330013	! t0_kref+0x241c:   	orn	%o4, %l3, %l7
	.word	0xee7e6018	! t0_kref+0x2420:   	swap	[%i1 + 0x18], %l7
	.word	0x9a1d8000	! t0_kref+0x2424:   	xor	%l6, %g0, %o5
	.word	0x25800001	! t0_kref+0x2428:   	fblg,a	_kref+0x242c
	.word	0x99a288c4	! t0_kref+0x242c:   	fsubd	%f10, %f4, %f12
	.word	0x81aa0adc	! t0_kref+0x2430:   	fcmped	%fcc0, %f8, %f28
	.word	0xe8762018	! t0_kref+0x2434:   	stx	%l4, [%i0 + 0x18]
	.word	0x963b3e2d	! t0_kref+0x2438:   	xnor	%o4, -0x1d3, %o3
	.word	0x36480004	! t0_kref+0x243c:   	bge,a,pt	%icc, _kref+0x244c
	.word	0x973de012	! t0_kref+0x2440:   	sra	%l7, 0x12, %o3
	.word	0xafb48057	! t0_kref+0x2444:   	edge8l	%l2, %l7, %l7
	.word	0x81ad8a32	! t0_kref+0x2448:   	fcmps	%fcc0, %f22, %f18
	.word	0xbbb44a25	! t0_kref+0x244c:   	fpadd16s	%f17, %f5, %f29
	.word	0xcf266000	! t0_kref+0x2450:   	st	%f7, [%i1]
	.word	0x97a0052b	! t0_kref+0x2454:   	fsqrts	%f11, %f11
	.word	0x2e480005	! t0_kref+0x2458:   	bvs,a,pt	%icc, _kref+0x246c
	.word	0x95a8405c	! t0_kref+0x245c:   	fmovdne	%fcc0, %f28, %f10
	.word	0x9ba68836	! t0_kref+0x2460:   	fadds	%f26, %f22, %f13
	.word	0xc0270019	! t0_kref+0x2464:   	clr	[%i4 + %i1]
	.word	0x21800006	! t0_kref+0x2468:   	fbn,a	_kref+0x2480
	.word	0x98a4e796	! t0_kref+0x246c:   	subcc	%l3, 0x796, %o4
	.word	0xf1be5817	! t0_kref+0x2470:   	stda	%f24, [%i1 + %l7]0xc0
	.word	0x91b300ec	! t0_kref+0x2474:   	edge16ln	%o4, %o4, %o0
	.word	0x8da0054c	! t0_kref+0x2478:   	fsqrtd	%f12, %f6
	.word	0x91b586ec	! t0_kref+0x247c:   	fmul8ulx16	%f22, %f12, %f8
	.word	0x9462c008	! t0_kref+0x2480:   	subc	%o3, %o0, %o2
	.word	0x9fa28932	! t0_kref+0x2484:   	fmuls	%f10, %f18, %f15
	.word	0xb9b48c8e	! t0_kref+0x2488:   	fandnot2	%f18, %f14, %f28
	.word	0xa1a01023	! t0_kref+0x248c:   	fstox	%f3, %f16
	sethi	%hi(1f), %o7
	jmpl	%o7+%lo(1f), %g1
	.empty
	.word	0xf91fbf70	! t0_kref+0x2498:   	ldd	[%fp - 0x90], %f28
!	.word	0x22823eca	! t0_kref+0x249c:   	be,a	SYM(t0_subr3)
	   	be,a	SYM(t0_subr3)
	.word	0x9e006008	! t0_kref+0x24a0:   	add	%g1, 8, %o7
	.word	0xe46e601e	! t0_kref+0x24a4:   	ldstub	[%i1 + 0x1e], %l2
1:	.word	0x36480004	! t0_kref+0x24a8:   	bge,a,pt	%icc, _kref+0x24b8
	.word	0x91a08933	! t0_kref+0x24ac:   	fmuls	%f2, %f19, %f8
	.word	0xa5b14aa7	! t0_kref+0x24b0:   	fpsub16s	%f5, %f7, %f18
	.word	0xb5b04df6	! t0_kref+0x24b4:   	fnands	%f1, %f22, %f26
	.word	0xe87e3fe0	! t0_kref+0x24b8:   	swap	[%i0 - 0x20], %l4
	.word	0xada44937	! t0_kref+0x24bc:   	fmuls	%f17, %f23, %f22
	.word	0xd0566008	! t0_kref+0x24c0:   	ldsh	[%i1 + 8], %o0
	.word	0x85a189c6	! t0_kref+0x24c4:   	fdivd	%f6, %f6, %f2
	.word	0x9bb3034b	! t0_kref+0x24c8:   	alignaddrl	%o4, %o3, %o5
	.word	0xada60927	! t0_kref+0x24cc:   	fmuls	%f24, %f7, %f22
	.word	0x33480005	! t0_kref+0x24d0:   	fbe,a,pt	%fcc0, _kref+0x24e4
	.word	0x92c4aef5	! t0_kref+0x24d4:   	addccc	%l2, 0xef5, %o1
	.word	0x9eda4017	! t0_kref+0x24d8:   	smulcc	%o1, %l7, %o7
	.word	0x81800000	! t0_kref+0x24dc:   	mov	%g0, %y
	.word	0x87a28938	! t0_kref+0x24e0:   	fmuls	%f10, %f24, %f3
	.word	0x3d800005	! t0_kref+0x24e4:   	fbule,a	_kref+0x24f8
	.word	0xa5a01116	! t0_kref+0x24e8:   	fxtod	%f22, %f18
	.word	0x9834000c	! t0_kref+0x24ec:   	orn	%l0, %o4, %o4
	.word	0x9fb2c0f4	! t0_kref+0x24f0:   	edge16ln	%o3, %l4, %o7
	.word	0xb1a01906	! t0_kref+0x24f4:   	fitod	%f6, %f24
	.word	0x8fa01a23	! t0_kref+0x24f8:   	fstoi	%f3, %f7
	.word	0xc0780019	! t0_kref+0x24fc:   	swap	[%g0 + %i1], %g0
	.word	0x81b50492	! t0_kref+0x2500:   	fcmple32	%f20, %f18, %g0
	.word	0xc0563fe6	! t0_kref+0x2504:   	ldsh	[%i0 - 0x1a], %g0
	.word	0x811a000c	! t0_kref+0x2508:   	tsubcctv	%o0, %o4, %g0
	.word	0xa1a589d8	! t0_kref+0x250c:   	fdivd	%f22, %f24, %f16
	.word	0x9e583967	! t0_kref+0x2510:   	smul	%g0, -0x699, %o7
	.word	0x90548017	! t0_kref+0x2514:   	umul	%l2, %l7, %o0
	.word	0xc000a020	! t0_kref+0x2518:   	ld	[%g2 + 0x20], %g0
	.word	0x25800002	! t0_kref+0x251c:   	fblg,a	_kref+0x2524
	.word	0x9ae03587	! t0_kref+0x2520:   	subccc	%g0, -0xa79, %o5
	.word	0xec1e3fe8	! t0_kref+0x2524:   	ldd	[%i0 - 0x18], %l6
	.word	0x97a18931	! t0_kref+0x2528:   	fmuls	%f6, %f17, %f11
	.word	0xe8360000	! t0_kref+0x252c:   	sth	%l4, [%i0]
	.word	0xe96e7ff0	! t0_kref+0x2530:   	prefetch	%i1 - 0x10, 20
	.word	0x9e92800c	! t0_kref+0x2534:   	orcc	%o2, %o4, %o7
	.word	0x95b4c091	! t0_kref+0x2538:   	edge16	%l3, %l1, %o2
	.word	0x9bb304c6	! t0_kref+0x253c:   	fcmpne32	%f12, %f6, %o5
	.word	0xd0780018	! t0_kref+0x2540:   	swap	[%g0 + %i0], %o0
	.word	0x94fc7b4b	! t0_kref+0x2544:   	sdivcc	%l1, -0x4b5, %o2
	call	SYM(t0_subr0)
	.word	0xd4480019	! t0_kref+0x254c:   	ldsb	[%g0 + %i1], %o2
	.word	0x2c800006	! t0_kref+0x2550:   	bneg,a	_kref+0x2568
	.word	0xc526201c	! t0_kref+0x2554:   	st	%f2, [%i0 + 0x1c]
	.word	0xa9a488d8	! t0_kref+0x2558:   	fsubd	%f18, %f24, %f20
	.word	0xa1b18f86	! t0_kref+0x255c:   	for	%f6, %f6, %f16
	.word	0x29480004	! t0_kref+0x2560:   	fbl,a,pt	%fcc0, _kref+0x2570
	.word	0x95b540ad	! t0_kref+0x2564:   	edge16n	%l5, %o5, %o2
	.word	0x80656d68	! t0_kref+0x2568:   	subc	%l5, 0xd68, %g0
	.word	0x31800002	! t0_kref+0x256c:   	fba,a	_kref+0x2574
	.word	0xd9be1812	! t0_kref+0x2570:   	stda	%f12, [%i0 + %l2]0xc0
	.word	0x91a00550	! t0_kref+0x2574:   	fsqrtd	%f16, %f8
	.word	0x96fa77d8	! t0_kref+0x2578:   	sdivcc	%o1, -0x828, %o3
	.word	0xc16e3ff0	! t0_kref+0x257c:   	prefetch	%i0 - 0x10, 0
	.word	0xdd1fbd70	! t0_kref+0x2580:   	ldd	[%fp - 0x290], %f14
	.word	0x99247dc5	! t0_kref+0x2584:   	mulscc	%l1, -0x23b, %o4
	.word	0xd2801018	! t0_kref+0x2588:   	lda	[%g0 + %i0]0x80, %o1
	.word	0xafa089ab	! t0_kref+0x258c:   	fdivs	%f2, %f11, %f23
	.word	0x9ab2800d	! t0_kref+0x2590:   	orncc	%o2, %o5, %o5
	.word	0x9255a8b3	! t0_kref+0x2594:   	umul	%l6, 0x8b3, %o1
	.word	0xa5a30d3d	! t0_kref+0x2598:   	fsmuld	%f12, %f29, %f18
	.word	0x9bb50050	! t0_kref+0x259c:   	edge8l	%l4, %l0, %o5
	.word	0x37480007	! t0_kref+0x25a0:   	fbge,a,pt	%fcc0, _kref+0x25bc
	.word	0xa9a01a3d	! t0_kref+0x25a4:   	fstoi	%f29, %f20
	.word	0x39800004	! t0_kref+0x25a8:   	fbuge,a	_kref+0x25b8
	.word	0xaead39d4	! t0_kref+0x25ac:   	andncc	%l4, -0x62c, %l7
	.word	0x90aae179	! t0_kref+0x25b0:   	andncc	%o3, 0x179, %o0
	.word	0xc51fbf48	! t0_kref+0x25b4:   	ldd	[%fp - 0xb8], %f2
	.word	0x81580000	! t0_kref+0x25b8:   	flushw
	.word	0x85a00544	! t0_kref+0x25bc:   	fsqrtd	%f4, %f2
	.word	0x31480008	! t0_kref+0x25c0:   	fba,a,pt	%fcc0, _kref+0x25e0
	.word	0x89b40e80	! t0_kref+0x25c4:   	fsrc1	%f16, %f4
	.word	0x81ac8ad8	! t0_kref+0x25c8:   	fcmped	%fcc0, %f18, %f24
	.word	0x92d83a98	! t0_kref+0x25cc:   	smulcc	%g0, -0x568, %o1
	.word	0x9254c00b	! t0_kref+0x25d0:   	umul	%l3, %o3, %o1
	.word	0xc9070018	! t0_kref+0x25d4:   	ld	[%i4 + %i0], %f4
	.word	0x21800002	! t0_kref+0x25d8:   	fbn,a	_kref+0x25e0
	.word	0xda500018	! t0_kref+0x25dc:   	ldsh	[%g0 + %i0], %o5
	.word	0xdb20a034	! t0_kref+0x25e0:   	st	%f13, [%g2 + 0x34]
	.word	0xe8700019	! t0_kref+0x25e4:   	stx	%l4, [%g0 + %i1]
	.word	0x22800005	! t0_kref+0x25e8:   	be,a	_kref+0x25fc
	.word	0x95400000	! t0_kref+0x25ec:   	mov	%y, %o2
	.word	0x85a18858	! t0_kref+0x25f0:   	faddd	%f6, %f24, %f2
	.word	0x23800002	! t0_kref+0x25f4:   	fbne,a	_kref+0x25fc
	.word	0xd0267ff4	! t0_kref+0x25f8:   	st	%o0, [%i1 - 0xc]
	.word	0xadb38c96	! t0_kref+0x25fc:   	fandnot2	%f14, %f22, %f22
	.word	0x89a34832	! t0_kref+0x2600:   	fadds	%f13, %f18, %f4
	.word	0x3d800008	! t0_kref+0x2604:   	fbule,a	_kref+0x2624
	.word	0xd83f4019	! t0_kref+0x2608:   	std	%o4, [%i5 + %i1]
	.word	0xc36e6018	! t0_kref+0x260c:   	prefetch	%i1 + 0x18, 1
	.word	0x36480007	! t0_kref+0x2610:   	bge,a,pt	%icc, _kref+0x262c
	.word	0x947ac012	! t0_kref+0x2614:   	sdiv	%o3, %l2, %o2
	.word	0x9eb5c017	! t0_kref+0x2618:   	orncc	%l7, %l7, %o7
	.word	0x9da00148	! t0_kref+0x261c:   	fabsd	%f8, %f14
	.word	0xa5a00122	! t0_kref+0x2620:   	fabss	%f2, %f18
	.word	0x95a0190f	! t0_kref+0x2624:   	fitod	%f15, %f10
	.word	0x24480008	! t0_kref+0x2628:   	ble,a,pt	%icc, _kref+0x2648
	.word	0xa7a00538	! t0_kref+0x262c:   	fsqrts	%f24, %f19
	.word	0x9da01905	! t0_kref+0x2630:   	fitod	%f5, %f14
	.word	0x3e480001	! t0_kref+0x2634:   	bvc,a,pt	%icc, _kref+0x2638
	.word	0x903b7538	! t0_kref+0x2638:   	xnor	%o5, -0xac8, %o0
	.word	0x9322c00d	! t0_kref+0x263c:   	mulscc	%o3, %o5, %o1
	.word	0x1b3e8807	! t0_kref+0x2640:   	sethi	%hi(0xfa201c00), %o5
	.word	0x89a5c8a4	! t0_kref+0x2644:   	fsubs	%f23, %f4, %f4
	.word	0xd1bf1a19	! t0_kref+0x2648:   	stda	%f8, [%i4 + %i1]0xd0
	.word	0x92952fb5	! t0_kref+0x264c:   	orcc	%l4, 0xfb5, %o1
	.word	0xb9b5871b	! t0_kref+0x2650:   	fmuld8sux16	%f22, %f27, %f28
	.word	0xf207bfe0	! t0_kref+0x2654:   	ld	[%fp - 0x20], %i1
	.word	0x2f3f8324	! t0_kref+0x2658:   	sethi	%hi(0xfe0c9000), %l7
	.word	0x20480003	! t0_kref+0x265c:   	bn,a,pt	%icc, _kref+0x2668
	.word	0x94d5000b	! t0_kref+0x2660:   	umulcc	%l4, %o3, %o2
	.word	0x85a3084e	! t0_kref+0x2664:   	faddd	%f12, %f14, %f2
	.word	0xe168a086	! t0_kref+0x2668:   	prefetch	%g2 + 0x86, 16
	.word	0x980d0008	! t0_kref+0x266c:   	and	%l4, %o0, %o4
	.word	0x27480008	! t0_kref+0x2670:   	fbul,a,pt	%fcc0, _kref+0x2690
	.word	0x8db5c622	! t0_kref+0x2674:   	fmul8x16	%f23, %f2, %f6
	.word	0x38480008	! t0_kref+0x2678:   	bgu,a,pt	%icc, _kref+0x2698
	.word	0x9452ef7b	! t0_kref+0x267c:   	umul	%o3, 0xf7b, %o2
	.word	0x90823268	! t0_kref+0x2680:   	addcc	%o0, -0xd98, %o0
	.word	0xc768a083	! t0_kref+0x2684:   	prefetch	%g2 + 0x83, 3
	.word	0xf4767fe0	! t0_kref+0x2688:   	stx	%i2, [%i1 - 0x20]
	.word	0xe13e2008	! t0_kref+0x268c:   	std	%f16, [%i0 + 8]
	.word	0x36800007	! t0_kref+0x2690:   	bge,a	_kref+0x26ac
	.word	0x93a01a52	! t0_kref+0x2694:   	fdtoi	%f18, %f9
	.word	0x94bc4015	! t0_kref+0x2698:   	xnorcc	%l1, %l5, %o2
	.word	0x96b4fc78	! t0_kref+0x269c:   	orncc	%l3, -0x388, %o3
	.word	0xaebdc00d	! t0_kref+0x26a0:   	xnorcc	%l7, %o5, %l7
	.word	0x95b08ed0	! t0_kref+0x26a4:   	fornot2	%f2, %f16, %f10
	.word	0x812c4000	! t0_kref+0x26a8:   	sll	%l1, %g0, %g0
	.word	0x2b800001	! t0_kref+0x26ac:   	fbug,a	_kref+0x26b0
	.word	0x9682f3de	! t0_kref+0x26b0:   	addcc	%o3, -0xc22, %o3
	.word	0xb7b007aa	! t0_kref+0x26b4:   	fpackfix	%f10, %f27
	.word	0x9515000b	! t0_kref+0x26b8:   	taddcctv	%l4, %o3, %o2
	.word	0x2b800005	! t0_kref+0x26bc:   	fbug,a	_kref+0x26d0
	.word	0xa9a4885c	! t0_kref+0x26c0:   	faddd	%f18, %f28, %f20
	.word	0xada0105c	! t0_kref+0x26c4:   	fdtox	%f28, %f22
	.word	0x81a88a46	! t0_kref+0x26c8:   	fcmpd	%fcc0, %f2, %f6
	.word	0x81ae8ad6	! t0_kref+0x26cc:   	fcmped	%fcc0, %f26, %f22
	.word	0xe16e401a	! t0_kref+0x26d0:   	prefetch	%i1 + %i2, 16
	.word	0x96fea98c	! t0_kref+0x26d4:   	sdivcc	%i2, 0x98c, %o3
	.word	0xe8180019	! t0_kref+0x26d8:   	ldd	[%g0 + %i1], %l4
	.word	0x9db20c88	! t0_kref+0x26dc:   	fandnot2	%f8, %f8, %f14
	.word	0x91a01913	! t0_kref+0x26e0:   	fitod	%f19, %f8
	.word	0xada0110c	! t0_kref+0x26e4:   	fxtod	%f12, %f22
	.word	0x3a480008	! t0_kref+0x26e8:   	bcc,a,pt	%icc, _kref+0x2708
	.word	0x8d840015	! t0_kref+0x26ec:   	wr	%l0, %l5, %fprs
	.word	0xec7e7ffc	! t0_kref+0x26f0:   	swap	[%i1 - 4], %l6
	.word	0x91b50c96	! t0_kref+0x26f4:   	fandnot2	%f20, %f22, %f8
	.word	0xf5be7fe0	! t0_kref+0x26f8:   	stda	%f26, [%i1 - 0x20]%asi
	.word	0x9a240016	! t0_kref+0x26fc:   	sub	%l0, %l6, %o5
	.word	0x90db7f03	! t0_kref+0x2700:   	smulcc	%o5, -0xfd, %o0
	.word	0x8035bdd4	! t0_kref+0x2704:   	orn	%l6, -0x22c, %g0
	.word	0x80b20014	! t0_kref+0x2708:   	orncc	%o0, %l4, %g0
	.word	0xd256c018	! t0_kref+0x270c:   	ldsh	[%i3 + %i0], %o1
	.word	0xd60e0000	! t0_kref+0x2710:   	ldub	[%i0], %o3
	.word	0x3b480002	! t0_kref+0x2714:   	fble,a,pt	%fcc0, _kref+0x271c
	.word	0xae830011	! t0_kref+0x2718:   	addcc	%o4, %l1, %l7
	.word	0x30480002	! t0_kref+0x271c:   	ba,a,pt	%icc, _kref+0x2724
	.word	0x985c3fb6	! t0_kref+0x2720:   	smul	%l0, -0x4a, %o4
	.word	0x3d480003	! t0_kref+0x2724:   	fbule,a,pt	%fcc0, _kref+0x2730
	.word	0xd11fbed0	! t0_kref+0x2728:   	ldd	[%fp - 0x130], %f8
	.word	0xb9a00554	! t0_kref+0x272c:   	fsqrtd	%f20, %f28
	.word	0x26800005	! t0_kref+0x2730:   	bl,a	_kref+0x2744
	.word	0x9da0c839	! t0_kref+0x2734:   	fadds	%f3, %f25, %f14
	.word	0xd07e3fe8	! t0_kref+0x2738:   	swap	[%i0 - 0x18], %o0
	.word	0x85b20a9a	! t0_kref+0x273c:   	fpsub16	%f8, %f26, %f2
	.word	0xb5a109c0	! t0_kref+0x2740:   	fdivd	%f4, %f0, %f26
	.word	0x87a00539	! t0_kref+0x2744:   	fsqrts	%f25, %f3
	.word	0x989d39d6	! t0_kref+0x2748:   	xorcc	%l4, -0x62a, %o4
	.word	0xec1e0000	! t0_kref+0x274c:   	ldd	[%i0], %l6
	.word	0xe51fbcc8	! t0_kref+0x2750:   	ldd	[%fp - 0x338], %f18
	.word	0x89a349b3	! t0_kref+0x2754:   	fdivs	%f13, %f19, %f4
	.word	0xe89e101d	! t0_kref+0x2758:   	ldda	[%i0 + %i5]0x80, %l4
	.word	0xda2e8018	! t0_kref+0x275c:   	stb	%o5, [%i2 + %i0]
	call	1f
	.empty
	.word	0xdb262018	! t0_kref+0x2764:   	st	%f13, [%i0 + 0x18]
	.word	0xb1b686f8	! t0_kref+0x2768:   	fmul8ulx16	%f26, %f24, %f24
	.word	0xbba01a4c	! t0_kref+0x276c:   	fdtoi	%f12, %f29
1:	.word	0x95b4432c	! t0_kref+0x2770:   	bmask	%l1, %o4, %o2
	.word	0x33480003	! t0_kref+0x2774:   	fbe,a,pt	%fcc0, _kref+0x2780
	.word	0x9862a769	! t0_kref+0x2778:   	subc	%o2, 0x769, %o4
	.word	0x971ca486	! t0_kref+0x277c:   	tsubcctv	%l2, 0x486, %o3
	.word	0xf007bfe0	! t0_kref+0x2780:   	ld	[%fp - 0x20], %i0
	.word	0xe91fbf88	! t0_kref+0x2784:   	ldd	[%fp - 0x78], %f20
	.word	0x37480008	! t0_kref+0x2788:   	fbge,a,pt	%fcc0, _kref+0x27a8
	.word	0x9a62c017	! t0_kref+0x278c:   	subc	%o3, %l7, %o5
	.word	0xeb68a00d	! t0_kref+0x2790:   	prefetch	%g2 + 0xd, 21
	.word	0x992dc012	! t0_kref+0x2794:   	sll	%l7, %l2, %o4
	.word	0x96d44015	! t0_kref+0x2798:   	umulcc	%l1, %l5, %o3
	.word	0x9da3c936	! t0_kref+0x279c:   	fmuls	%f15, %f22, %f14
	.word	0xada0054a	! t0_kref+0x27a0:   	fsqrtd	%f10, %f22
	.word	0x8da01905	! t0_kref+0x27a4:   	fitod	%f5, %f6
	.word	0x9682800d	! t0_kref+0x27a8:   	addcc	%o2, %o5, %o3
	.word	0x29480007	! t0_kref+0x27ac:   	fbl,a,pt	%fcc0, _kref+0x27c8
	.word	0x9e0d72a3	! t0_kref+0x27b0:   	and	%l5, -0xd5d, %o7
	.word	0x99a00148	! t0_kref+0x27b4:   	fabsd	%f8, %f12
	.word	0x3a480003	! t0_kref+0x27b8:   	bcc,a,pt	%icc, _kref+0x27c4
	.word	0xa5b007a4	! t0_kref+0x27bc:   	fpackfix	%f4, %f18
	.word	0x8db18a28	! t0_kref+0x27c0:   	fpadd16s	%f6, %f8, %f6
	.word	0x3f800007	! t0_kref+0x27c4:   	fbo,a	_kref+0x27e0
	.word	0xd0866004	! t0_kref+0x27c8:   	lda	[%i1 + 4]%asi, %o0
	.word	0x92e28017	! t0_kref+0x27cc:   	subccc	%o2, %l7, %o1
	.word	0xaf408000	! t0_kref+0x27d0:   	mov	%ccr, %l7
	.word	0x99a8004a	! t0_kref+0x27d4:   	fmovdn	%fcc0, %f10, %f12
	.word	0x81a90a56	! t0_kref+0x27d8:   	fcmpd	%fcc0, %f4, %f22
	.word	0x99a0055c	! t0_kref+0x27dc:   	fsqrtd	%f28, %f12
	.word	0xecf6501d	! t0_kref+0x27e0:   	stxa	%l6, [%i1 + %i5]0x80
	.word	0x3d480005	! t0_kref+0x27e4:   	fbule,a,pt	%fcc0, _kref+0x27f8
	.word	0x97b2040c	! t0_kref+0x27e8:   	fcmple16	%f8, %f12, %o3
	.word	0xe81e6010	! t0_kref+0x27ec:   	ldd	[%i1 + 0x10], %l4
	.word	0x9a44401a	! t0_kref+0x27f0:   	addc	%l1, %i2, %o5
	.word	0x31800001	! t0_kref+0x27f4:   	fba,a	_kref+0x27f8
	.word	0xd8564000	! t0_kref+0x27f8:   	ldsh	[%i1], %o4
	.word	0x97a000a4	! t0_kref+0x27fc:   	fnegs	%f4, %f11
	.word	0x2a480003	! t0_kref+0x2800:   	bcs,a,pt	%icc, _kref+0x280c
	.word	0x99a0193a	! t0_kref+0x2804:   	fstod	%f26, %f12
	.word	0x9f320014	! t0_kref+0x2808:   	srl	%o0, %l4, %o7
	.word	0xe99e1a1b	! t0_kref+0x280c:   	ldda	[%i0 + %i3]0xd0, %f20
	.word	0x1b24fe47	! t0_kref+0x2810:   	sethi	%hi(0x93f91c00), %o5
	.word	0x91b00111	! t0_kref+0x2814:   	edge32	%g0, %l1, %o0
	.word	0x99a00130	! t0_kref+0x2818:   	fabss	%f16, %f12
	.word	0xb9a0013d	! t0_kref+0x281c:   	fabss	%f29, %f28
	.word	0x2e480002	! t0_kref+0x2820:   	bvs,a,pt	%icc, _kref+0x2828
	.word	0xd47e601c	! t0_kref+0x2824:   	swap	[%i1 + 0x1c], %o2
	.word	0x24800003	! t0_kref+0x2828:   	ble,a	_kref+0x2834
	.word	0xd67f0019	! t0_kref+0x282c:   	swap	[%i4 + %i1], %o3
	.word	0xb1a6892f	! t0_kref+0x2830:   	fmuls	%f26, %f15, %f24
	.word	0x9e16b738	! t0_kref+0x2834:   	or	%i2, -0x8c8, %o7
	.word	0x9db40a08	! t0_kref+0x2838:   	fpadd16	%f16, %f8, %f14
	.word	0xd04e8019	! t0_kref+0x283c:   	ldsb	[%i2 + %i1], %o0
	.word	0x905cebb4	! t0_kref+0x2840:   	smul	%l3, 0xbb4, %o0
	.word	0x35800008	! t0_kref+0x2844:   	fbue,a	_kref+0x2864
	.word	0xc46e8000	! t0_kref+0x2848:   	ldstub	[%i2], %g2
	.word	0xd91fbea8	! t0_kref+0x284c:   	ldd	[%fp - 0x158], %f12
	.word	0xd226200c	! t0_kref+0x2850:   	st	%o1, [%i0 + 0xc]
	.word	0xc51fbc40	! t0_kref+0x2854:   	ldd	[%fp - 0x3c0], %f2
	.word	0x9b2dc012	! t0_kref+0x2858:   	sll	%l7, %l2, %o5
	.word	0xb5a01098	! t0_kref+0x285c:   	fxtos	%f24, %f26
	.word	0x806270c9	! t0_kref+0x2860:   	subc	%o1, -0xf37, %g0
	.word	0x26480002	! t0_kref+0x2864:   	bl,a,pt	%icc, _kref+0x286c
	.word	0xee4e001a	! t0_kref+0x2868:   	ldsb	[%i0 + %i2], %l7
	.word	0x81ac0a4a	! t0_kref+0x286c:   	fcmpd	%fcc0, %f16, %f10
	.word	0x9a627696	! t0_kref+0x2870:   	subc	%o1, -0x96a, %o5
	.word	0xb1b38a08	! t0_kref+0x2874:   	fpadd16	%f14, %f8, %f24
	.word	0x95b6c634	! t0_kref+0x2878:   	fmul8x16	%f27, %f20, %f10
	.word	0x2e800001	! t0_kref+0x287c:   	bvs,a	_kref+0x2880
	.word	0x9110000b	! t0_kref+0x2880:   	taddcctv	%g0, %o3, %o0
	.word	0xa1a000a1	! t0_kref+0x2884:   	fnegs	%f1, %f16
	.word	0xda263fec	! t0_kref+0x2888:   	st	%o5, [%i0 - 0x14]
	.word	0x9de3bfa0	! t0_kref+0x288c:   	save	%sp, -0x60, %sp
	.word	0x97ef324f	! t0_kref+0x2890:   	restore	%i4, -0xdb1, %o3
	.word	0x36480007	! t0_kref+0x2894:   	bge,a,pt	%icc, _kref+0x28b0
	.word	0xe22e2012	! t0_kref+0x2898:   	stb	%l1, [%i0 + 0x12]
	.word	0x802b0014	! t0_kref+0x289c:   	andn	%o4, %l4, %g0
	.word	0x95b5c354	! t0_kref+0x28a0:   	alignaddrl	%l7, %l4, %o2
	.word	0x1b178845	! t0_kref+0x28a4:   	sethi	%hi(0x5e211400), %o5
	.word	0xb3a5c83a	! t0_kref+0x28a8:   	fadds	%f23, %f26, %f25
	.word	0x9bb58048	! t0_kref+0x28ac:   	edge8l	%l6, %o0, %o5
	.word	0x9db206fc	! t0_kref+0x28b0:   	fmul8ulx16	%f8, %f28, %f14
	.word	0x83414000	! t0_kref+0x28b4:   	mov	%pc, %g1
	.word	0x9da2084a	! t0_kref+0x28b8:   	faddd	%f8, %f10, %f14
	.word	0x98a68011	! t0_kref+0x28bc:   	subcc	%i2, %l1, %o4
	.word	0xd300a028	! t0_kref+0x28c0:   	ld	[%g2 + 0x28], %f9
	.word	0xe2f8a000	! t0_kref+0x28c4:   	swapa	[%g2]%asi, %l1
	.word	0x83414000	! t0_kref+0x28c8:   	mov	%pc, %g1
	.word	0x92bb284d	! t0_kref+0x28cc:   	xnorcc	%o4, 0x84d, %o1
	.word	0x9e8d4012	! t0_kref+0x28d0:   	andcc	%l5, %l2, %o7
	.word	0x972026bf	! t0_kref+0x28d4:   	mulscc	%g0, 0x6bf, %o3
	.word	0x92853785	! t0_kref+0x28d8:   	addcc	%l4, -0x87b, %o1
	.word	0x8fb00ce3	! t0_kref+0x28dc:   	fnot2s	%f3, %f7
	.word	0x921e800d	! t0_kref+0x28e0:   	xor	%i2, %o5, %o1
	.word	0x28480006	! t0_kref+0x28e4:   	bleu,a,pt	%icc, _kref+0x28fc
	.word	0x91224015	! t0_kref+0x28e8:   	mulscc	%o1, %l5, %o0
	.word	0x81868000	! t0_kref+0x28ec:   	wr	%i2, %g0, %y
	.word	0x9764c009	! t0_kref+0x28f0:   	movl	%icc, %o1, %o3
	.word	0xa1a01a54	! t0_kref+0x28f4:   	fdtoi	%f20, %f16
	.word	0x81b54056	! t0_kref+0x28f8:   	edge8l	%l5, %l6, %g0
	.word	0xc020a000	! t0_kref+0x28fc:   	clr	[%g2]
	.word	0xfb00a008	! t0_kref+0x2900:   	ld	[%g2 + 8], %f29
	.word	0xde861000	! t0_kref+0x2904:   	lda	[%i0]0x80, %o7
	.word	0x81a84aa8	! t0_kref+0x2908:   	fcmpes	%fcc0, %f1, %f8
	.word	0x94b48017	! t0_kref+0x290c:   	orncc	%l2, %l7, %o2
	.word	0xc04e8019	! t0_kref+0x2910:   	ldsb	[%i2 + %i1], %g0
	.word	0x9fb4cda2	! t0_kref+0x2914:   	fxors	%f19, %f2, %f15
	.word	0x2b800006	! t0_kref+0x2918:   	fbug,a	_kref+0x2930
	.word	0xd51fbe88	! t0_kref+0x291c:   	ldd	[%fp - 0x178], %f10
	.word	0xe43e6018	! t0_kref+0x2920:   	std	%l2, [%i1 + 0x18]
	.word	0xb9a509ca	! t0_kref+0x2924:   	fdivd	%f20, %f10, %f28
	.word	0x971ca31d	! t0_kref+0x2928:   	tsubcctv	%l2, 0x31d, %o3
	.word	0x9edc0009	! t0_kref+0x292c:   	smulcc	%l0, %o1, %o7
	.word	0xda36c019	! t0_kref+0x2930:   	sth	%o5, [%i3 + %i1]
	.word	0xd890a018	! t0_kref+0x2934:   	lduha	[%g2 + 0x18]%asi, %o4
	.word	0x32800002	! t0_kref+0x2938:   	bne,a	_kref+0x2940
	.word	0xada01a30	! t0_kref+0x293c:   	fstoi	%f16, %f22
	.word	0xb9a00552	! t0_kref+0x2940:   	fsqrtd	%f18, %f28
	.word	0x85a189d2	! t0_kref+0x2944:   	fdivd	%f6, %f18, %f2
	.word	0x9b24355f	! t0_kref+0x2948:   	mulscc	%l0, -0xaa1, %o5
	.word	0xb5a000c2	! t0_kref+0x294c:   	fnegd	%f2, %f26
	.word	0xee40a01c	! t0_kref+0x2950:   	ldsw	[%g2 + 0x1c], %l7
	.word	0x85a01932	! t0_kref+0x2954:   	fstod	%f18, %f2
	.word	0x87802080	! t0_kref+0x2958:   	mov	0x80, %asi
	.word	0x81ad4aa3	! t0_kref+0x295c:   	fcmpes	%fcc0, %f21, %f3
	.word	0x93a00526	! t0_kref+0x2960:   	fsqrts	%f6, %f9
	.word	0x89a01a34	! t0_kref+0x2964:   	fstoi	%f20, %f4
	.word	0xa7a289ba	! t0_kref+0x2968:   	fdivs	%f10, %f26, %f19
	.word	0x90157fed	! t0_kref+0x296c:   	or	%l5, -0x13, %o0
	.word	0x923c800d	! t0_kref+0x2970:   	xnor	%l2, %o5, %o1
	.word	0x9b70000d	! t0_kref+0x2974:   	popc	%o5, %o5
	.word	0xd20e001a	! t0_kref+0x2978:   	ldub	[%i0 + %i2], %o1
	.word	0x31800005	! t0_kref+0x297c:   	fba,a	_kref+0x2990
	.word	0xd0380018	! t0_kref+0x2980:   	std	%o0, [%g0 + %i0]
	.word	0x809cbf91	! t0_kref+0x2984:   	xorcc	%l2, -0x6f, %g0
	.word	0xd2a8a036	! t0_kref+0x2988:   	stba	%o1, [%g2 + 0x36]%asi
	.word	0x91b2ce3a	! t0_kref+0x298c:   	fands	%f11, %f26, %f8
	.word	0x80a54014	! t0_kref+0x2990:   	cmp	%l5, %l4
	.word	0x91b68f90	! t0_kref+0x2994:   	for	%f26, %f16, %f8
	.word	0x808a000b	! t0_kref+0x2998:   	btst	%o3, %o0
	.word	0x2d800001	! t0_kref+0x299c:   	fbg,a	_kref+0x29a0
	.word	0xb1b64dfc	! t0_kref+0x29a0:   	fnands	%f25, %f28, %f24
	.word	0x981a000b	! t0_kref+0x29a4:   	xor	%o0, %o3, %o4
	.word	0x9524b560	! t0_kref+0x29a8:   	mulscc	%l2, -0xaa0, %o2
	.word	0xdc3826c0	! t0_kref+0x29ac:   	std	%sp, [%g0 + 0x6c0]
	.word	0x80c68012	! t0_kref+0x29b0:   	addccc	%i2, %l2, %g0
	.word	0x27800007	! t0_kref+0x29b4:   	fbul,a	_kref+0x29d0
	.word	0x93b48176	! t0_kref+0x29b8:   	edge32ln	%l2, %l6, %o1
	.word	0x9da00554	! t0_kref+0x29bc:   	fsqrtd	%f20, %f14
	.word	0x81b6048a	! t0_kref+0x29c0:   	fcmple32	%f24, %f10, %g0
	.word	0xe91e6008	! t0_kref+0x29c4:   	ldd	[%i1 + 8], %f20
	.word	0x15360454	! t0_kref+0x29c8:   	sethi	%hi(0xd8115000), %o2
	.word	0xa5a01912	! t0_kref+0x29cc:   	fitod	%f18, %f18
	.word	0x81848000	! t0_kref+0x29d0:   	wr	%l2, %g0, %y
	.word	0xa1b28756	! t0_kref+0x29d4:   	fpack32	%f10, %f22, %f16
	.word	0xf4a8a035	! t0_kref+0x29d8:   	stba	%i2, [%g2 + 0x35]%asi
	.word	0x80642303	! t0_kref+0x29dc:   	subc	%l0, 0x303, %g0
	.word	0x800577c7	! t0_kref+0x29e0:   	add	%l5, -0x839, %g0
	.word	0x9add2860	! t0_kref+0x29e4:   	smulcc	%l4, 0x860, %o5
	.word	0xe62e600c	! t0_kref+0x29e8:   	stb	%l3, [%i1 + 0xc]
	.word	0x9e8cc01a	! t0_kref+0x29ec:   	andcc	%l3, %i2, %o7
	.word	0x32800003	! t0_kref+0x29f0:   	bne,a	_kref+0x29fc
	.word	0xae9a2952	! t0_kref+0x29f4:   	xorcc	%o0, 0x952, %l7
	.word	0x963c6eca	! t0_kref+0x29f8:   	xnor	%l1, 0xeca, %o3
	.word	0xd91fbd28	! t0_kref+0x29fc:   	ldd	[%fp - 0x2d8], %f12
	.word	0x31800001	! t0_kref+0x2a00:   	fba,a	_kref+0x2a04
	.word	0xf19e5a1a	! t0_kref+0x2a04:   	ldda	[%i1 + %i2]0xd0, %f24
	.word	0x89a5c8ae	! t0_kref+0x2a08:   	fsubs	%f23, %f14, %f4
	.word	0xc04e7fff	! t0_kref+0x2a0c:   	ldsb	[%i1 - 1], %g0
	.word	0x95b48624	! t0_kref+0x2a10:   	fmul8x16	%f18, %f4, %f10
	.word	0xec6e3ffb	! t0_kref+0x2a14:   	ldstub	[%i0 - 5], %l6
	.word	0x81aa8ad0	! t0_kref+0x2a18:   	fcmped	%fcc0, %f10, %f16
	.word	0x89b48c82	! t0_kref+0x2a1c:   	fandnot2	%f18, %f2, %f4
	.word	0xa7a00524	! t0_kref+0x2a20:   	fsqrts	%f4, %f19
	.word	0xf83e4000	! t0_kref+0x2a24:   	std	%i4, [%i1]
	.word	0xe76e6000	! t0_kref+0x2a28:   	prefetch	%i1, 19
	.word	0xda862000	! t0_kref+0x2a2c:   	lda	[%i0]%asi, %o5
	.word	0x87a00136	! t0_kref+0x2a30:   	fabss	%f22, %f3
	.word	0x83414000	! t0_kref+0x2a34:   	mov	%pc, %g1
	.word	0x9a524014	! t0_kref+0x2a38:   	umul	%o1, %l4, %o5
	.word	0x85b70af8	! t0_kref+0x2a3c:   	fpsub32s	%f28, %f24, %f2
	.word	0x130319ce	! t0_kref+0x2a40:   	sethi	%hi(0xc673800), %o1
	.word	0x81db8015	! t0_kref+0x2a44:   	flush	%sp + %l5
	.word	0x9a72e177	! t0_kref+0x2a48:   	udiv	%o3, 0x177, %o5
	.word	0xb7a00527	! t0_kref+0x2a4c:   	fsqrts	%f7, %f27
	.word	0xda26001c	! t0_kref+0x2a50:   	st	%o5, [%i0 + %i4]
	.word	0x81ad8ac4	! t0_kref+0x2a54:   	fcmped	%fcc0, %f22, %f4
	.word	0xae7ac00b	! t0_kref+0x2a58:   	sdiv	%o3, %o3, %l7
	.word	0x9da00522	! t0_kref+0x2a5c:   	fsqrts	%f2, %f14
	.word	0xc11fbc10	! t0_kref+0x2a60:   	ldd	[%fp - 0x3f0], %f0
	.word	0xd6000019	! t0_kref+0x2a64:   	ld	[%g0 + %i1], %o3
	.word	0x81220014	! t0_kref+0x2a68:   	mulscc	%o0, %l4, %g0
	call	SYM(t0_subr3)
	.word	0xf120a034	! t0_kref+0x2a70:   	st	%f24, [%g2 + 0x34]
	.word	0x912da013	! t0_kref+0x2a74:   	sll	%l6, 0x13, %o0
	.word	0x9eda8010	! t0_kref+0x2a78:   	smulcc	%o2, %l0, %o7
	.word	0xd46e3ff9	! t0_kref+0x2a7c:   	ldstub	[%i0 - 7], %o2
	.word	0x92dd8009	! t0_kref+0x2a80:   	smulcc	%l6, %o1, %o1
	.word	0xb9b00fc0	! t0_kref+0x2a84:   	fone	%f28
	.word	0xda96601e	! t0_kref+0x2a88:   	lduha	[%i1 + 0x1e]%asi, %o5
	.word	0x808278f1	! t0_kref+0x2a8c:   	addcc	%o1, -0x70f, %g0
	.word	0x8064f521	! t0_kref+0x2a90:   	subc	%l3, -0xadf, %g0
	.word	0x83b00c20	! t0_kref+0x2a94:   	fzeros	%f1
	.word	0xa5b18630	! t0_kref+0x2a98:   	fmul8x16	%f6, %f16, %f18
	.word	0x23480004	! t0_kref+0x2a9c:   	fbne,a,pt	%fcc0, _kref+0x2aac
	.word	0x949c7e9f	! t0_kref+0x2aa0:   	xorcc	%l1, -0x161, %o2
	.word	0x24480007	! t0_kref+0x2aa4:   	ble,a,pt	%icc, _kref+0x2ac0
	.word	0x1b3d5ac8	! t0_kref+0x2aa8:   	sethi	%hi(0xf56b2000), %o5
	.word	0x9865662c	! t0_kref+0x2aac:   	subc	%l5, 0x62c, %o4
	.word	0xfdee501a	! t0_kref+0x2ab0:   	prefetcha	%i1 + %i2, 30
	.word	0x89b686e2	! t0_kref+0x2ab4:   	fmul8ulx16	%f26, %f2, %f4
	.word	0x1b3ab640	! t0_kref+0x2ab8:   	sethi	%hi(0xead90000), %o5
	.word	0x20800007	! t0_kref+0x2abc:   	bn,a	_kref+0x2ad8
	.word	0x9b2278e5	! t0_kref+0x2ac0:   	mulscc	%o1, -0x71b, %o5
	.word	0x24800004	! t0_kref+0x2ac4:   	ble,a	_kref+0x2ad4
	.word	0xa9a01907	! t0_kref+0x2ac8:   	fitod	%f7, %f20
	.word	0x80868012	! t0_kref+0x2acc:   	addcc	%i2, %l2, %g0
	.word	0xaf22aba6	! t0_kref+0x2ad0:   	mulscc	%o2, 0xba6, %l7
	.word	0x99b54171	! t0_kref+0x2ad4:   	edge32ln	%l5, %l1, %o4
	.word	0x013d34a6	! t0_kref+0x2ad8:   	sethi	%hi(0xf4d29800), %g0
	.word	0x90548014	! t0_kref+0x2adc:   	umul	%l2, %l4, %o0
	.word	0xada509cc	! t0_kref+0x2ae0:   	fdivd	%f20, %f12, %f22
	.word	0x2f480003	! t0_kref+0x2ae4:   	fbu,a,pt	%fcc0, _kref+0x2af0
	.word	0xde563ff8	! t0_kref+0x2ae8:   	ldsh	[%i0 - 8], %o7
	.word	0x8ba209ab	! t0_kref+0x2aec:   	fdivs	%f8, %f11, %f5
	.word	0x9bb30116	! t0_kref+0x2af0:   	edge32	%o4, %l6, %o5
	.word	0x81824000	! t0_kref+0x2af4:   	wr	%o1, %g0, %y
	.word	0x30800001	! t0_kref+0x2af8:   	ba,a	_kref+0x2afc
	.word	0xeb066010	! t0_kref+0x2afc:   	ld	[%i1 + 0x10], %f21
	.word	0x949eb6f5	! t0_kref+0x2b00:   	xorcc	%i2, -0x90b, %o2
	.word	0x27800004	! t0_kref+0x2b04:   	fbul,a	_kref+0x2b14
	.word	0x1f2bdfd5	! t0_kref+0x2b08:   	sethi	%hi(0xaf7f5400), %o7
	.word	0x9a144008	! t0_kref+0x2b0c:   	or	%l1, %o0, %o5
	.word	0x81ad0aac	! t0_kref+0x2b10:   	fcmpes	%fcc0, %f20, %f12
	.word	0x81aa0acc	! t0_kref+0x2b14:   	fcmped	%fcc0, %f8, %f12
	.word	0x91b48169	! t0_kref+0x2b18:   	edge32ln	%l2, %o1, %o0
	.word	0x95a44829	! t0_kref+0x2b1c:   	fadds	%f17, %f9, %f10
	.word	0x9afeb34f	! t0_kref+0x2b20:   	sdivcc	%i2, -0xcb1, %o5
	.word	0x9e327eb6	! t0_kref+0x2b24:   	orn	%o1, -0x14a, %o7
	.word	0x8db00fc0	! t0_kref+0x2b28:   	fone	%f6
	.word	0xec1e4000	! t0_kref+0x2b2c:   	ldd	[%i1], %l6
	.word	0x80fa6da6	! t0_kref+0x2b30:   	sdivcc	%o1, 0xda6, %g0
	.word	0xa9b00fe0	! t0_kref+0x2b34:   	fones	%f20
	.word	0x9fc10000	! t0_kref+0x2b38:   	call	%g4
	.word	0x9abb2f76	! t0_kref+0x2b3c:   	xnorcc	%o4, 0xf76, %o5
	.word	0xf4a71018	! t0_kref+0x2b40:   	sta	%i2, [%i4 + %i0]0x80
	.word	0x36480003	! t0_kref+0x2b44:   	bge,a,pt	%icc, _kref+0x2b50
	.word	0x9e824012	! t0_kref+0x2b48:   	addcc	%o1, %l2, %o7
	.word	0xe26e3fe7	! t0_kref+0x2b4c:   	ldstub	[%i0 - 0x19], %l1
	.word	0x81a00556	! t0_kref+0x2b50:   	fsqrtd	%f22, %f0
	.word	0x81ae4a26	! t0_kref+0x2b54:   	fcmps	%fcc0, %f25, %f6
	.word	0xec9e3fe8	! t0_kref+0x2b58:   	ldda	[%i0 - 0x18]%asi, %l6
	.word	0xda0e0000	! t0_kref+0x2b5c:   	ldub	[%i0], %o5
	.word	0xbba000a1	! t0_kref+0x2b60:   	fnegs	%f1, %f29
	.word	0x9b240017	! t0_kref+0x2b64:   	mulscc	%l0, %l7, %o5
	.word	0x80152111	! t0_kref+0x2b68:   	or	%l4, 0x111, %g0
	.word	0x2b800002	! t0_kref+0x2b6c:   	fbug,a	_kref+0x2b74
	.word	0xc04e600d	! t0_kref+0x2b70:   	ldsb	[%i1 + 0xd], %g0
	.word	0x28480008	! t0_kref+0x2b74:   	bleu,a,pt	%icc, _kref+0x2b94
	.word	0xa5a348b4	! t0_kref+0x2b78:   	fsubs	%f13, %f20, %f18
	.word	0xd4a0a030	! t0_kref+0x2b7c:   	sta	%o2, [%g2 + 0x30]%asi
	.word	0xe6262008	! t0_kref+0x2b80:   	st	%l3, [%i0 + 8]
	.word	0x9635af2b	! t0_kref+0x2b84:   	orn	%l6, 0xf2b, %o3
	.word	0x963c000b	! t0_kref+0x2b88:   	xnor	%l0, %o3, %o3
	.word	0xb9a01937	! t0_kref+0x2b8c:   	fstod	%f23, %f28
	.word	0x35480001	! t0_kref+0x2b90:   	fbue,a,pt	%fcc0, _kref+0x2b94
	.word	0x92ba0008	! t0_kref+0x2b94:   	xnorcc	%o0, %o0, %o1
	.word	0xb9b60a7c	! t0_kref+0x2b98:   	fpadd32s	%f24, %f28, %f28
	.word	0xa1b1062c	! t0_kref+0x2b9c:   	fmul8x16	%f4, %f12, %f16
	.word	0x3d800002	! t0_kref+0x2ba0:   	fbule,a	_kref+0x2ba8
	.word	0x95a0104c	! t0_kref+0x2ba4:   	fdtox	%f12, %f10
	.word	0x9fa2093b	! t0_kref+0x2ba8:   	fmuls	%f8, %f27, %f15
	.word	0x89b50f5c	! t0_kref+0x2bac:   	fornot1	%f20, %f28, %f4
	.word	0xe220a008	! t0_kref+0x2bb0:   	st	%l1, [%g2 + 8]
	.word	0xc5262018	! t0_kref+0x2bb4:   	st	%f2, [%i0 + 0x18]
	.word	0x9de3bfa0	! t0_kref+0x2bb8:   	save	%sp, -0x60, %sp
	.word	0x93ef401d	! t0_kref+0x2bbc:   	restore	%i5, %i5, %o1
	.word	0xed68a04c	! t0_kref+0x2bc0:   	prefetch	%g2 + 0x4c, 22
	.word	0x24800008	! t0_kref+0x2bc4:   	ble,a	_kref+0x2be4
	.word	0x8bb40a6a	! t0_kref+0x2bc8:   	fpadd32s	%f16, %f10, %f5
	.word	0x80fd7e4b	! t0_kref+0x2bcc:   	sdivcc	%l5, -0x1b5, %g0
	.word	0xc06e7fe0	! t0_kref+0x2bd0:   	ldstub	[%i1 - 0x20], %g0
	.word	0xd4b0a024	! t0_kref+0x2bd4:   	stha	%o2, [%g2 + 0x24]%asi
	.word	0xc00e8019	! t0_kref+0x2bd8:   	ldub	[%i2 + %i1], %g0
	.word	0x81ad0a46	! t0_kref+0x2bdc:   	fcmpd	%fcc0, %f20, %f6
	.word	0x2a800003	! t0_kref+0x2be0:   	bcs,a	_kref+0x2bec
	.word	0x85a0014c	! t0_kref+0x2be4:   	fabsd	%f12, %f2
	.word	0x9f414000	! t0_kref+0x2be8:   	mov	%pc, %o7
	.word	0x878020d0	! t0_kref+0x2bec:   	mov	0xd0, %asi
	.word	0x81a90aca	! t0_kref+0x2bf0:   	fcmped	%fcc0, %f4, %f10
	.word	0x9055aa51	! t0_kref+0x2bf4:   	umul	%l6, 0xa51, %o0
	.word	0x9e9ac013	! t0_kref+0x2bf8:   	xorcc	%o3, %l3, %o7
	.word	0x991b7076	! t0_kref+0x2bfc:   	tsubcctv	%o5, -0xf8a, %o4
	.word	0x95a2092e	! t0_kref+0x2c00:   	fmuls	%f8, %f14, %f10
	.word	0xd44e4000	! t0_kref+0x2c04:   	ldsb	[%i1], %o2
	.word	0xd900a008	! t0_kref+0x2c08:   	ld	[%g2 + 8], %f12
	.word	0x9b70000c	! t0_kref+0x2c0c:   	popc	%o4, %o5
	.word	0xe300a004	! t0_kref+0x2c10:   	ld	[%g2 + 4], %f17
	.word	0x81a98ad4	! t0_kref+0x2c14:   	fcmped	%fcc0, %f6, %f20
	.word	0xae7d33ad	! t0_kref+0x2c18:   	sdiv	%l4, -0xc53, %l7
	.word	0xafa000bd	! t0_kref+0x2c1c:   	fnegs	%f29, %f23
	.word	0x992b201b	! t0_kref+0x2c20:   	sll	%o4, 0x1b, %o4
	.word	0x9f24e6d0	! t0_kref+0x2c24:   	mulscc	%l3, 0x6d0, %o7
	.word	0xf007bfe0	! t0_kref+0x2c28:   	ld	[%fp - 0x20], %i0
	.word	0x920d001a	! t0_kref+0x2c2c:   	and	%l4, %i2, %o1
	.word	0xa9a00538	! t0_kref+0x2c30:   	fsqrts	%f24, %f20
	.word	0x91b68170	! t0_kref+0x2c34:   	edge32ln	%i2, %l0, %o0
	.word	0x9e940016	! t0_kref+0x2c38:   	orcc	%l0, %l6, %o7
	.word	0xaba01a22	! t0_kref+0x2c3c:   	fstoi	%f2, %f21
	.word	0xee0e201e	! t0_kref+0x2c40:   	ldub	[%i0 + 0x1e], %l7
	.word	0xd91fbf58	! t0_kref+0x2c44:   	ldd	[%fp - 0xa8], %f12
	.word	0xae93000b	! t0_kref+0x2c48:   	orcc	%o4, %o3, %l7
	.word	0x2e480007	! t0_kref+0x2c4c:   	bvs,a,pt	%icc, _kref+0x2c68
	.word	0x9ba249b0	! t0_kref+0x2c50:   	fdivs	%f9, %f16, %f13
	.word	0x927cf0a6	! t0_kref+0x2c54:   	sdiv	%l3, -0xf5a, %o1
	.word	0xbbb5ce27	! t0_kref+0x2c58:   	fands	%f23, %f7, %f29
	.word	0x987e8011	! t0_kref+0x2c5c:   	sdiv	%i2, %l1, %o4
	.word	0xe7ee501d	! t0_kref+0x2c60:   	prefetcha	%i1 + %i5, 19
	.word	0xd468a023	! t0_kref+0x2c64:   	ldstub	[%g2 + 0x23], %o2
	.word	0x81b50542	! t0_kref+0x2c68:   	fcmpeq16	%f20, %f2, %g0
	.word	0x933d0011	! t0_kref+0x2c6c:   	sra	%l4, %l1, %o1
	.word	0x24800006	! t0_kref+0x2c70:   	ble,a	_kref+0x2c88
	.word	0xb1a00521	! t0_kref+0x2c74:   	fsqrts	%f1, %f24
	.word	0x9a637ff3	! t0_kref+0x2c78:   	subc	%o5, -0xd, %o5
	.word	0x9a7ca8e8	! t0_kref+0x2c7c:   	sdiv	%l2, 0x8e8, %o5
	.word	0x8da01928	! t0_kref+0x2c80:   	fstod	%f8, %f6
	.word	0x81a98aca	! t0_kref+0x2c84:   	fcmped	%fcc0, %f6, %f10
	.word	0x151bd439	! t0_kref+0x2c88:   	sethi	%hi(0x6f50e400), %o2
	.word	0x94a44016	! t0_kref+0x2c8c:   	subcc	%l1, %l6, %o2
	.word	0x38480006	! t0_kref+0x2c90:   	bgu,a,pt	%icc, _kref+0x2ca8
	.word	0xc368a00b	! t0_kref+0x2c94:   	prefetch	%g2 + 0xb, 1
	.word	0x985dc00a	! t0_kref+0x2c98:   	smul	%l7, %o2, %o4
	.word	0x8fa00536	! t0_kref+0x2c9c:   	fsqrts	%f22, %f7
	.word	0x2c480004	! t0_kref+0x2ca0:   	bneg,a,pt	%icc, _kref+0x2cb0
	.word	0x96dcc008	! t0_kref+0x2ca4:   	smulcc	%l3, %o0, %o3
	.word	0xe66e8018	! t0_kref+0x2ca8:   	ldstub	[%i2 + %i0], %l3
	.word	0x38480006	! t0_kref+0x2cac:   	bgu,a,pt	%icc, _kref+0x2cc4
	.word	0xada009d0	! t0_kref+0x2cb0:   	fdivd	%f0, %f16, %f22
	.word	0xa9a0193a	! t0_kref+0x2cb4:   	fstod	%f26, %f20
	.word	0x9f614014	! t0_kref+0x2cb8:   	movug	%fcc0, %l4, %o7
	.word	0xa5a689ce	! t0_kref+0x2cbc:   	fdivd	%f26, %f14, %f18
	.word	0x91a01915	! t0_kref+0x2cc0:   	fitod	%f21, %f8
	.word	0xbba00023	! t0_kref+0x2cc4:   	fmovs	%f3, %f29
	.word	0xae123e91	! t0_kref+0x2cc8:   	or	%o0, -0x16f, %l7
	.word	0xc00e3ff8	! t0_kref+0x2ccc:   	ldub	[%i0 - 8], %g0
	.word	0xbbb00c20	! t0_kref+0x2cd0:   	fzeros	%f29
	.word	0x92bc6278	! t0_kref+0x2cd4:   	xnorcc	%l1, 0x278, %o1
	.word	0xeece5000	! t0_kref+0x2cd8:   	ldsba	[%i1]0x80, %l7
	.word	0xc04e3ff5	! t0_kref+0x2cdc:   	ldsb	[%i0 - 0xb], %g0
	.word	0x24800007	! t0_kref+0x2ce0:   	ble,a	_kref+0x2cfc
	.word	0xaebc000d	! t0_kref+0x2ce4:   	xnorcc	%l0, %o5, %l7
	.word	0xed6e7fe8	! t0_kref+0x2ce8:   	prefetch	%i1 - 0x18, 22
	.word	0x3c480001	! t0_kref+0x2cec:   	bpos,a,pt	%icc, _kref+0x2cf0
	.word	0xa5b28a06	! t0_kref+0x2cf0:   	fpadd16	%f10, %f6, %f18
	.word	0xe82e3ffa	! t0_kref+0x2cf4:   	stb	%l4, [%i0 - 6]
	.word	0x8da01921	! t0_kref+0x2cf8:   	fstod	%f1, %f6
	.word	0x9fa00534	! t0_kref+0x2cfc:   	fsqrts	%f20, %f15
	.word	0x9924bc1a	! t0_kref+0x2d00:   	mulscc	%l2, -0x3e6, %o4
	.word	0x2a800003	! t0_kref+0x2d04:   	bcs,a	_kref+0x2d10
	.word	0x9935a007	! t0_kref+0x2d08:   	srl	%l6, 0x7, %o4
	.word	0x91a01904	! t0_kref+0x2d0c:   	fitod	%f4, %f8
	.word	0xd096d019	! t0_kref+0x2d10:   	lduha	[%i3 + %i1]0x80, %o0
	.word	0x9a983b0a	! t0_kref+0x2d14:   	xorcc	%g0, -0x4f6, %o5
	.word	0xaebd8012	! t0_kref+0x2d18:   	xnorcc	%l6, %l2, %l7
	.word	0x80d82aab	! t0_kref+0x2d1c:   	smulcc	%g0, 0xaab, %g0
	.word	0xdaf6501d	! t0_kref+0x2d20:   	stxa	%o5, [%i1 + %i5]0x80
	.word	0x94356567	! t0_kref+0x2d24:   	orn	%l5, 0x567, %o2
	.word	0x98650010	! t0_kref+0x2d28:   	subc	%l4, %l0, %o4
	.word	0xe81e001d	! t0_kref+0x2d2c:   	ldd	[%i0 + %i5], %l4
	.word	0x3b800006	! t0_kref+0x2d30:   	fble,a	_kref+0x2d48
	.word	0x95b206a3	! t0_kref+0x2d34:   	fmul8x16al	%f8, %f3, %f10
	.word	0x900aed82	! t0_kref+0x2d38:   	and	%o3, 0xd82, %o0
	.word	0xe07e4000	! t0_kref+0x2d3c:   	swap	[%i1], %l0
	.word	0x909a323a	! t0_kref+0x2d40:   	xorcc	%o0, -0xdc6, %o0
	.word	0x89b70e06	! t0_kref+0x2d44:   	fand	%f28, %f6, %f4
	.word	0x92a4e28f	! t0_kref+0x2d48:   	subcc	%l3, 0x28f, %o1
	.word	0xd11e6008	! t0_kref+0x2d4c:   	ldd	[%i1 + 8], %f8
	.word	0x94646d15	! t0_kref+0x2d50:   	subc	%l1, 0xd15, %o2
	.word	0x89a2c8ac	! t0_kref+0x2d54:   	fsubs	%f11, %f12, %f4
	.word	0xe020a020	! t0_kref+0x2d58:   	st	%l0, [%g2 + 0x20]
	.word	0x3a480004	! t0_kref+0x2d5c:   	bcc,a,pt	%icc, _kref+0x2d6c
	.word	0xee763ff8	! t0_kref+0x2d60:   	stx	%l7, [%i0 - 8]
	.word	0x9b2ea005	! t0_kref+0x2d64:   	sll	%i2, 0x5, %o5
	.word	0x8da0c92e	! t0_kref+0x2d68:   	fmuls	%f3, %f14, %f6
	.word	0x9ea48008	! t0_kref+0x2d6c:   	subcc	%l2, %o0, %o7
	.word	0xcd1fbf70	! t0_kref+0x2d70:   	ldd	[%fp - 0x90], %f6
	.word	0x81800000	! t0_kref+0x2d74:   	mov	%g0, %y
	.word	0xd60e0000	! t0_kref+0x2d78:   	ldub	[%i0], %o3
	.word	0x81b68177	! t0_kref+0x2d7c:   	edge32ln	%i2, %l7, %g0
	.word	0xe168a00e	! t0_kref+0x2d80:   	prefetch	%g2 + 0xe, 16
	.word	0xa1a00548	! t0_kref+0x2d84:   	fsqrtd	%f8, %f16
	.word	0x2c480001	! t0_kref+0x2d88:   	bneg,a,pt	%icc, _kref+0x2d8c
	.word	0x81220017	! t0_kref+0x2d8c:   	mulscc	%o0, %l7, %g0
	.word	0xf3270018	! t0_kref+0x2d90:   	st	%f25, [%i4 + %i0]
	.word	0x9f38201c	! t0_kref+0x2d94:   	sra	%g0, 0x1c, %o7
	.word	0x24800002	! t0_kref+0x2d98:   	ble,a	_kref+0x2da0
	.word	0x99a5095a	! t0_kref+0x2d9c:   	fmuld	%f20, %f26, %f12
	.word	0x9e62f8fb	! t0_kref+0x2da0:   	subc	%o3, -0x705, %o7
	.word	0x992b2000	! t0_kref+0x2da4:   	sll	%o4, 0x0, %o4
	.word	0x93380000	! t0_kref+0x2da8:   	sra	%g0, %g0, %o1
	.word	0xd0480018	! t0_kref+0x2dac:   	ldsb	[%g0 + %i0], %o0
	.word	0x91a689a6	! t0_kref+0x2db0:   	fdivs	%f26, %f6, %f8
	.word	0x952c2009	! t0_kref+0x2db4:   	sll	%l0, 0x9, %o2
	.word	0x97b2034a	! t0_kref+0x2db8:   	alignaddrl	%o0, %o2, %o3
	.word	0x34800003	! t0_kref+0x2dbc:   	bg,a	_kref+0x2dc8
	.word	0xae43400c	! t0_kref+0x2dc0:   	addc	%o5, %o4, %l7
	.word	0x37800005	! t0_kref+0x2dc4:   	fbge,a	_kref+0x2dd8
	.word	0xee881018	! t0_kref+0x2dc8:   	lduba	[%g0 + %i0]0x80, %l7
	.word	0x8054fcef	! t0_kref+0x2dcc:   	umul	%l3, -0x311, %g0
	.word	0xe86e001a	! t0_kref+0x2dd0:   	ldstub	[%i0 + %i2], %l4
	.word	0x2f480005	! t0_kref+0x2dd4:   	fbu,a,pt	%fcc0, _kref+0x2de8
	.word	0x98bde099	! t0_kref+0x2dd8:   	xnorcc	%l7, 0x99, %o4
	.word	0xe4366010	! t0_kref+0x2ddc:   	sth	%l2, [%i1 + 0x10]
	.word	0x9bb00240	! t0_kref+0x2de0:   	array16	%g0, %g0, %o5
	.word	0xe9be584c	! t0_kref+0x2de4:   	stda	%f20, [%i1 + %o4]0xc2
	call	SYM(t0_subr2)
	.word	0x808d79bb	! t0_kref+0x2dec:   	btst	0xfffff9bb, %l5
	.word	0x97b40171	! t0_kref+0x2df0:   	edge32ln	%l0, %l1, %o3
	.word	0x982b0008	! t0_kref+0x2df4:   	andn	%o4, %o0, %o4
	.word	0x96540013	! t0_kref+0x2df8:   	umul	%l0, %l3, %o3
	.word	0x81df7c37	! t0_kref+0x2dfc:   	flush	%i5 - 0x3c9
	.word	0x22800007	! t0_kref+0x2e00:   	be,a	_kref+0x2e1c
	.word	0x9ea48015	! t0_kref+0x2e04:   	subcc	%l2, %l5, %o7
	.word	0x91a0052b	! t0_kref+0x2e08:   	fsqrts	%f11, %f8
	.word	0xd22e3feb	! t0_kref+0x2e0c:   	stb	%o1, [%i0 - 0x15]
	.word	0xa5a0054a	! t0_kref+0x2e10:   	fsqrtd	%f10, %f18
	.word	0x85a0193d	! t0_kref+0x2e14:   	fstod	%f29, %f2
	.word	0x91a00525	! t0_kref+0x2e18:   	fsqrts	%f5, %f8
	.word	0x2c800002	! t0_kref+0x2e1c:   	bneg,a	_kref+0x2e24
	.word	0xa5b00c20	! t0_kref+0x2e20:   	fzeros	%f18
	.word	0xc36e6010	! t0_kref+0x2e24:   	prefetch	%i1 + 0x10, 1
	.word	0x9eddf7ef	! t0_kref+0x2e28:   	smulcc	%l7, -0x811, %o7
	.word	0x942d400d	! t0_kref+0x2e2c:   	andn	%l5, %o5, %o2
	.word	0x3d480007	! t0_kref+0x2e30:   	fbule,a,pt	%fcc0, _kref+0x2e4c
	.word	0x80ad4013	! t0_kref+0x2e34:   	andncc	%l5, %l3, %g0
	.word	0x97a00528	! t0_kref+0x2e38:   	fsqrts	%f8, %f11
	.word	0x90d27e19	! t0_kref+0x2e3c:   	umulcc	%o1, -0x1e7, %o0
	.word	0x9085001a	! t0_kref+0x2e40:   	addcc	%l4, %i2, %o0
	.word	0xe87e6018	! t0_kref+0x2e44:   	swap	[%i1 + 0x18], %l4
	.word	0xd60e7ffe	! t0_kref+0x2e48:   	ldub	[%i1 - 2], %o3
	.word	0xb1a01937	! t0_kref+0x2e4c:   	fstod	%f23, %f24
	.word	0xd04e2015	! t0_kref+0x2e50:   	ldsb	[%i0 + 0x15], %o0
	.word	0x33800007	! t0_kref+0x2e54:   	fbe,a	_kref+0x2e70
	.word	0xe2e81019	! t0_kref+0x2e58:   	ldstuba	[%g0 + %i1]0x80, %l1
	.word	0xb1a0104e	! t0_kref+0x2e5c:   	fdtox	%f14, %f24
	.word	0x87b00776	! t0_kref+0x2e60:   	fpack16	%f22, %f3
	.word	0x81df2d3a	! t0_kref+0x2e64:   	flush	%i4 + 0xd3a
	.word	0x9f414000	! t0_kref+0x2e68:   	mov	%pc, %o7
	.word	0x33480006	! t0_kref+0x2e6c:   	fbe,a,pt	%fcc0, _kref+0x2e84
	.word	0xb9a6883c	! t0_kref+0x2e70:   	fadds	%f26, %f28, %f28
	.word	0x925d400b	! t0_kref+0x2e74:   	smul	%l5, %o3, %o1
	.word	0x9bb4802b	! t0_kref+0x2e78:   	edge8n	%l2, %o3, %o5
	.word	0x90b57912	! t0_kref+0x2e7c:   	orncc	%l5, -0x6ee, %o0
	.word	0x3a800004	! t0_kref+0x2e80:   	bcc,a	_kref+0x2e90
	.word	0x80bb3f08	! t0_kref+0x2e84:   	xnorcc	%o4, -0xf8, %g0
	.word	0x97048017	! t0_kref+0x2e88:   	taddcc	%l2, %l7, %o3
	.word	0x9a068011	! t0_kref+0x2e8c:   	add	%i2, %l1, %o5
	.word	0x9a5a662c	! t0_kref+0x2e90:   	smul	%o1, 0x62c, %o5
	.word	0x908c8016	! t0_kref+0x2e94:   	andcc	%l2, %l6, %o0
	.word	0x9fc10000	! t0_kref+0x2e98:   	call	%g4
	.word	0x99b5c315	! t0_kref+0x2e9c:   	alignaddr	%l7, %l5, %o4
	.word	0xd2080019	! t0_kref+0x2ea0:   	ldub	[%g0 + %i1], %o1
	.word	0x8fb00fe0	! t0_kref+0x2ea4:   	fones	%f7
	.word	0xf11fbef8	! t0_kref+0x2ea8:   	ldd	[%fp - 0x108], %f24
	.word	0xec9e101d	! t0_kref+0x2eac:   	ldda	[%i0 + %i5]0x80, %l6
	.word	0xc91fbd88	! t0_kref+0x2eb0:   	ldd	[%fp - 0x278], %f4
	.word	0xb9b306f0	! t0_kref+0x2eb4:   	fmul8ulx16	%f12, %f16, %f28
	.word	0x94332888	! t0_kref+0x2eb8:   	orn	%o4, 0x888, %o2
	.word	0xc010a018	! t0_kref+0x2ebc:   	lduh	[%g2 + 0x18], %g0
	.word	0x34800006	! t0_kref+0x2ec0:   	bg,a	_kref+0x2ed8
	.word	0xae8a2773	! t0_kref+0x2ec4:   	andcc	%o0, 0x773, %l7
	.word	0x37800007	! t0_kref+0x2ec8:   	fbge,a	_kref+0x2ee4
	.word	0x97a01a27	! t0_kref+0x2ecc:   	fstoi	%f7, %f11
	.word	0xb9b68d0c	! t0_kref+0x2ed0:   	fandnot1	%f26, %f12, %f28
	.word	0xe81e401d	! t0_kref+0x2ed4:   	ldd	[%i1 + %i5], %l4
	.word	0xee00a020	! t0_kref+0x2ed8:   	ld	[%g2 + 0x20], %l7
	.word	0xde4e401a	! t0_kref+0x2edc:   	ldsb	[%i1 + %i2], %o7
	.word	0xd4166014	! t0_kref+0x2ee0:   	lduh	[%i1 + 0x14], %o2
	.word	0xd22e2014	! t0_kref+0x2ee4:   	stb	%o1, [%i0 + 0x14]
	.word	0xafb48114	! t0_kref+0x2ee8:   	edge32	%l2, %l4, %l7
	.word	0x34800005	! t0_kref+0x2eec:   	bg,a	_kref+0x2f00
	.word	0x95b5cdbb	! t0_kref+0x2ef0:   	fxors	%f23, %f27, %f10
	.word	0xa9b20a24	! t0_kref+0x2ef4:   	fpadd16s	%f8, %f4, %f20
	.word	0x81b01023	! t0_kref+0x2ef8:   	siam	0x3
	.word	0x947a6ee0	! t0_kref+0x2efc:   	sdiv	%o1, 0xee0, %o2
	.word	0xada089ce	! t0_kref+0x2f00:   	fdivd	%f2, %f14, %f22
	.word	0x9aa2b798	! t0_kref+0x2f04:   	subcc	%o2, -0x868, %o5
	.word	0x38800004	! t0_kref+0x2f08:   	bgu,a	_kref+0x2f18
	.word	0x945df313	! t0_kref+0x2f0c:   	smul	%l7, -0xced, %o2
	.word	0x9eb8000b	! t0_kref+0x2f10:   	xnorcc	%g0, %o3, %o7
	.word	0x9ba00122	! t0_kref+0x2f14:   	fabss	%f2, %f13
	.word	0xec266000	! t0_kref+0x2f18:   	st	%l6, [%i1]
	.word	0xee56401b	! t0_kref+0x2f1c:   	ldsh	[%i1 + %i3], %l7
	.word	0x26480008	! t0_kref+0x2f20:   	bl,a,pt	%icc, _kref+0x2f40
	.word	0xaba00526	! t0_kref+0x2f24:   	fsqrts	%f6, %f21
	.word	0x91a000b5	! t0_kref+0x2f28:   	fnegs	%f21, %f8
	.word	0xb7b00760	! t0_kref+0x2f2c:   	fpack16	%f0, %f27
	.word	0xe81e6010	! t0_kref+0x2f30:   	ldd	[%i1 + 0x10], %l4
	.word	0xda000019	! t0_kref+0x2f34:   	ld	[%g0 + %i1], %o5
	.word	0xd24e7fe8	! t0_kref+0x2f38:   	ldsb	[%i1 - 0x18], %o1
	.word	0xda86501c	! t0_kref+0x2f3c:   	lda	[%i1 + %i4]0x80, %o5
	.word	0x8035322e	! t0_kref+0x2f40:   	orn	%l4, -0xdd2, %g0
	.word	0x8143c000	! t0_kref+0x2f44:   	stbar
	.word	0x35480004	! t0_kref+0x2f48:   	fbue,a,pt	%fcc0, _kref+0x2f58
	.word	0x8ba00133	! t0_kref+0x2f4c:   	fabss	%f19, %f5
	.word	0xa9a00552	! t0_kref+0x2f50:   	fsqrtd	%f18, %f20
	.word	0xb5a28854	! t0_kref+0x2f54:   	faddd	%f10, %f20, %f26
	.word	0xe1be5890	! t0_kref+0x2f58:   	stda	%f16, [%i1 + %l0]0xc4
	.word	0xaf26800c	! t0_kref+0x2f5c:   	mulscc	%i2, %o4, %l7
	.word	0x3c480006	! t0_kref+0x2f60:   	bpos,a,pt	%icc, _kref+0x2f78
	.word	0x98c44013	! t0_kref+0x2f64:   	addccc	%l1, %l3, %o4
	.word	0xee780019	! t0_kref+0x2f68:   	swap	[%g0 + %i1], %l7
	.word	0x1325739f	! t0_kref+0x2f6c:   	sethi	%hi(0x95ce7c00), %o1
	.word	0xf007bfe0	! t0_kref+0x2f70:   	ld	[%fp - 0x20], %i0
	.word	0xe83e6018	! t0_kref+0x2f74:   	std	%l4, [%i1 + 0x18]
	.word	0xc0564000	! t0_kref+0x2f78:   	ldsh	[%i1], %g0
	.word	0x22800004	! t0_kref+0x2f7c:   	be,a	_kref+0x2f8c
	.word	0xcb00a00c	! t0_kref+0x2f80:   	ld	[%g2 + 0xc], %f5
	.word	0x9f382014	! t0_kref+0x2f84:   	sra	%g0, 0x14, %o7
	.word	0x9db5097c	! t0_kref+0x2f88:   	fpmerge	%f20, %f28, %f14
	.word	0x27800005	! t0_kref+0x2f8c:   	fbul,a	_kref+0x2fa0
	.word	0xd44e6004	! t0_kref+0x2f90:   	ldsb	[%i1 + 4], %o2
	.word	0x9ec2780b	! t0_kref+0x2f94:   	addccc	%o1, -0x7f5, %o7
	.word	0x988a8008	! t0_kref+0x2f98:   	andcc	%o2, %o0, %o4
	.word	0xd878a010	! t0_kref+0x2f9c:   	swap	[%g2 + 0x10], %o4
	.word	0xd59f5018	! t0_kref+0x2fa0:   	ldda	[%i5 + %i0]0x80, %f10
	.word	0xde0e8019	! t0_kref+0x2fa4:   	ldub	[%i2 + %i1], %o7
	.word	0x95b20080	! t0_kref+0x2fa8:   	edge16	%o0, %g0, %o2
	.word	0x9afd4009	! t0_kref+0x2fac:   	sdivcc	%l5, %o1, %o5
	.word	0x96f28012	! t0_kref+0x2fb0:   	udivcc	%o2, %l2, %o3
	.word	0x8104801a	! t0_kref+0x2fb4:   	taddcc	%l2, %i2, %g0
	.word	0x90a8001a	! t0_kref+0x2fb8:   	andncc	%g0, %i2, %o0
	.word	0x98c232c7	! t0_kref+0x2fbc:   	addccc	%o0, -0xd39, %o4
	.word	0x95b686aa	! t0_kref+0x2fc0:   	fmul8x16al	%f26, %f10, %f10
	.word	0xa9a0191d	! t0_kref+0x2fc4:   	fitod	%f29, %f20
	.word	0x9834237c	! t0_kref+0x2fc8:   	orn	%l0, 0x37c, %o4
	call	SYM(t0_subr0)
	.word	0xa1b38d94	! t0_kref+0x2fd0:   	fxor	%f14, %f20, %f16
	.word	0x20480001	! t0_kref+0x2fd4:   	bn,a,pt	%icc, _kref+0x2fd8
	.word	0xd24e0000	! t0_kref+0x2fd8:   	ldsb	[%i0], %o1
	.word	0x39480002	! t0_kref+0x2fdc:   	fbuge,a,pt	%fcc0, _kref+0x2fe4
	.word	0x8082c013	! t0_kref+0x2fe0:   	addcc	%o3, %l3, %g0
	.word	0x90780000	! t0_kref+0x2fe4:   	sdiv	%g0, %g0, %o0
	.word	0x99b20037	! t0_kref+0x2fe8:   	edge8n	%o0, %l7, %o4
	.word	0xd5070019	! t0_kref+0x2fec:   	ld	[%i4 + %i1], %f10
	.word	0x9fc10000	! t0_kref+0x2ff0:   	call	%g4
	.word	0xec1e6010	! t0_kref+0x2ff4:   	ldd	[%i1 + 0x10], %l6
	.word	0x952a8011	! t0_kref+0x2ff8:   	sll	%o2, %l1, %o2
	.word	0x81844000	! t0_kref+0x2ffc:   	wr	%l1, %g0, %y
	.word	0x912a4011	! t0_kref+0x3000:   	sll	%o1, %l1, %o0
	.word	0xada08942	! t0_kref+0x3004:   	fmuld	%f2, %f2, %f22
	.word	0x920c0014	! t0_kref+0x3008:   	and	%l0, %l4, %o1
	.word	0x92b83753	! t0_kref+0x300c:   	xnorcc	%g0, -0x8ad, %o1
	.word	0xb1a01931	! t0_kref+0x3010:   	fstod	%f17, %f24
	call	SYM(t0_subr2)
	.word	0x907a000b	! t0_kref+0x3018:   	sdiv	%o0, %o3, %o0
	.word	0xda08a00a	! t0_kref+0x301c:   	ldub	[%g2 + 0xa], %o5
	.word	0xafb3848c	! t0_kref+0x3020:   	fcmple32	%f14, %f12, %l7
	.word	0x83a00528	! t0_kref+0x3024:   	fsqrts	%f8, %f1
	.word	0x98bb0017	! t0_kref+0x3028:   	xnorcc	%o4, %l7, %o4
	.word	0xe3000019	! t0_kref+0x302c:   	ld	[%g0 + %i1], %f17
	.word	0x89a609c2	! t0_kref+0x3030:   	fdivd	%f24, %f2, %f4
	.word	0x960d800c	! t0_kref+0x3034:   	and	%l6, %o4, %o3
	.word	0x805e801a	! t0_kref+0x3038:   	smul	%i2, %i2, %g0
	.word	0xc0000018	! t0_kref+0x303c:   	ld	[%g0 + %i0], %g0
	.word	0xd248a02e	! t0_kref+0x3040:   	ldsb	[%g2 + 0x2e], %o1
	.word	0x2a480003	! t0_kref+0x3044:   	bcs,a,pt	%icc, _kref+0x3050
	.word	0x9eda8014	! t0_kref+0x3048:   	smulcc	%o2, %l4, %o7
	.word	0x953dc00b	! t0_kref+0x304c:   	sra	%l7, %o3, %o2
	.word	0xbbb3cda9	! t0_kref+0x3050:   	fxors	%f15, %f9, %f29
	.word	0xaefcff49	! t0_kref+0x3054:   	sdivcc	%l3, -0xb7, %l7
	.word	0x9322001a	! t0_kref+0x3058:   	mulscc	%o0, %i2, %o1
	.word	0x960b23d3	! t0_kref+0x305c:   	and	%o4, 0x3d3, %o3
	.word	0x9bb2848c	! t0_kref+0x3060:   	fcmple32	%f10, %f12, %o5
	.word	0x9125000d	! t0_kref+0x3064:   	mulscc	%l4, %o5, %o0
	.word	0xa1a00548	! t0_kref+0x3068:   	fsqrtd	%f8, %f16
	.word	0x89b68a54	! t0_kref+0x306c:   	fpadd32	%f26, %f20, %f4
	.word	0xc9063fec	! t0_kref+0x3070:   	ld	[%i0 - 0x14], %f4
	.word	0x34800004	! t0_kref+0x3074:   	bg,a	_kref+0x3084
	.word	0xd11fbce0	! t0_kref+0x3078:   	ldd	[%fp - 0x320], %f8
	.word	0x01199998	! t0_kref+0x307c:   	sethi	%hi(0x66666000), %g0
	.word	0x87a489a7	! t0_kref+0x3080:   	fdivs	%f18, %f7, %f3
	.word	0xc0160000	! t0_kref+0x3084:   	lduh	[%i0], %g0
	.word	0x2d480003	! t0_kref+0x3088:   	fbg,a,pt	%fcc0, _kref+0x3094
	.word	0x9da000b0	! t0_kref+0x308c:   	fnegs	%f16, %f14
	.word	0x3b800001	! t0_kref+0x3090:   	fble,a	_kref+0x3094
	.word	0x98724016	! t0_kref+0x3094:   	udiv	%o1, %l6, %o4
	.word	0x9a2a723d	! t0_kref+0x3098:   	andn	%o1, -0xdc3, %o5
	.word	0xb5a00133	! t0_kref+0x309c:   	fabss	%f19, %f26
	.word	0x3c480004	! t0_kref+0x30a0:   	bpos,a,pt	%icc, _kref+0x30b0
	.word	0xda4e201a	! t0_kref+0x30a4:   	ldsb	[%i0 + 0x1a], %o5
	.word	0x901a64fd	! t0_kref+0x30a8:   	xor	%o1, 0x4fd, %o0
	.word	0xec1e4000	! t0_kref+0x30ac:   	ldd	[%i1], %l6
	.word	0xd0260000	! t0_kref+0x30b0:   	st	%o0, [%i0]
	.word	0xae75c012	! t0_kref+0x30b4:   	udiv	%l7, %l2, %l7
	.word	0x81a88a54	! t0_kref+0x30b8:   	fcmpd	%fcc0, %f2, %f20
	.word	0x9a9ceed4	! t0_kref+0x30bc:   	xorcc	%l3, 0xed4, %o5
	.word	0x905ea238	! t0_kref+0x30c0:   	smul	%i2, 0x238, %o0
	.word	0x3f480008	! t0_kref+0x30c4:   	fbo,a,pt	%fcc0, _kref+0x30e4
	.word	0x85b24717	! t0_kref+0x30c8:   	fmuld8sux16	%f9, %f23, %f2
	.word	0xd60e401a	! t0_kref+0x30cc:   	ldub	[%i1 + %i2], %o3
	.word	0x9f3b4016	! t0_kref+0x30d0:   	sra	%o5, %l6, %o7
	.word	0x95a00156	! t0_kref+0x30d4:   	fabsd	%f22, %f10
	.word	0x22800007	! t0_kref+0x30d8:   	be,a	_kref+0x30f4
	.word	0x96dc800b	! t0_kref+0x30dc:   	smulcc	%l2, %o3, %o3
	.word	0x2f800002	! t0_kref+0x30e0:   	fbu,a	_kref+0x30e8
	.word	0xfbee501a	! t0_kref+0x30e4:   	prefetcha	%i1 + %i2, 29
	.word	0x9e3dc01a	! t0_kref+0x30e8:   	xnor	%l7, %i2, %o7
	.word	0x24480005	! t0_kref+0x30ec:   	ble,a,pt	%icc, _kref+0x3100
	.word	0xc568a044	! t0_kref+0x30f0:   	prefetch	%g2 + 0x44, 2
	.word	0xb1b58a50	! t0_kref+0x30f4:   	fpadd32	%f22, %f16, %f24
	.word	0x2e480006	! t0_kref+0x30f8:   	bvs,a,pt	%icc, _kref+0x3110
	.word	0xc520a008	! t0_kref+0x30fc:   	st	%f2, [%g2 + 8]
	.word	0x9b380013	! t0_kref+0x3100:   	sra	%g0, %l3, %o5
	.word	0xc168a00a	! t0_kref+0x3104:   	prefetch	%g2 + 0xa, 0
	.word	0xaf2ae010	! t0_kref+0x3108:   	sll	%o3, 0x10, %l7
	.word	0xee4e601a	! t0_kref+0x310c:   	ldsb	[%i1 + 0x1a], %l7
	.word	0x23480007	! t0_kref+0x3110:   	fbne,a,pt	%fcc0, _kref+0x312c
	.word	0xa5a01916	! t0_kref+0x3114:   	fitod	%f22, %f18
	.word	0x2b800006	! t0_kref+0x3118:   	fbug,a	_kref+0x3130
	.word	0xc368a045	! t0_kref+0x311c:   	prefetch	%g2 + 0x45, 1
	.word	0x91a30837	! t0_kref+0x3120:   	fadds	%f12, %f23, %f8
	.word	0x9eac001a	! t0_kref+0x3124:   	andncc	%l0, %i2, %o7
	.word	0x99a01a23	! t0_kref+0x3128:   	fstoi	%f3, %f12
	.word	0x948a8015	! t0_kref+0x312c:   	andcc	%o2, %l5, %o2
	.word	0x90e3001a	! t0_kref+0x3130:   	subccc	%o4, %i2, %o0
	.word	0xf11fbf08	! t0_kref+0x3134:   	ldd	[%fp - 0xf8], %f24
	.word	0x2b480008	! t0_kref+0x3138:   	fbug,a,pt	%fcc0, _kref+0x3158
	.word	0xada0054e	! t0_kref+0x313c:   	fsqrtd	%f14, %f22
	.word	0xc36e3ff0	! t0_kref+0x3140:   	prefetch	%i0 - 0x10, 1
	.word	0xaeb33beb	! t0_kref+0x3144:   	orncc	%o4, -0x415, %l7
	.word	0xd51fbe48	! t0_kref+0x3148:   	ldd	[%fp - 0x1b8], %f10
	.word	0xec3e3ff0	! t0_kref+0x314c:   	std	%l6, [%i0 - 0x10]
	.word	0x9b2de003	! t0_kref+0x3150:   	sll	%l7, 0x3, %o5
	.word	0x21800005	! t0_kref+0x3154:   	fbn,a	_kref+0x3168
	.word	0xe120a004	! t0_kref+0x3158:   	st	%f16, [%g2 + 4]
	.word	0xe7263ff0	! t0_kref+0x315c:   	st	%f19, [%i0 - 0x10]
	.word	0xee2e8019	! t0_kref+0x3160:   	stb	%l7, [%i2 + %i1]
	.word	0x95a0054c	! t0_kref+0x3164:   	fsqrtd	%f12, %f10
	.word	0xafb2412d	! t0_kref+0x3168:   	edge32n	%o1, %o5, %l7
	.word	0xd27e7fe4	! t0_kref+0x316c:   	swap	[%i1 - 0x1c], %o1
	.word	0x86102004	! t0_kref+0x3170:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x3174:   	bne,a	_kref+0x3174
	.word	0x86a0e001	! t0_kref+0x3178:   	subcc	%g3, 1, %g3
	.word	0x80b2c00a	! t0_kref+0x317c:   	orncc	%o3, %o2, %g0
	.word	0x90b5c00b	! t0_kref+0x3180:   	orncc	%l7, %o3, %o0
	.word	0xd00e8018	! t0_kref+0x3184:   	ldub	[%i2 + %i0], %o0
	.word	0x81868000	! t0_kref+0x3188:   	wr	%i2, %g0, %y
	.word	0xae7d0013	! t0_kref+0x318c:   	sdiv	%l4, %l3, %l7
	.word	0x9fc10000	! t0_kref+0x3190:   	call	%g4
	.word	0xee070019	! t0_kref+0x3194:   	ld	[%i4 + %i1], %l7
	.word	0x94b4c008	! t0_kref+0x3198:   	orncc	%l3, %o0, %o2
	.word	0xe51fbcd0	! t0_kref+0x319c:   	ldd	[%fp - 0x330], %f18
	.word	0x3b800002	! t0_kref+0x31a0:   	fble,a	_kref+0x31a8
	.word	0xd5196508	! t0_kref+0x31a4:   	ldd	[%g5 + 0x508], %f10
	.word	0x23480007	! t0_kref+0x31a8:   	fbne,a,pt	%fcc0, _kref+0x31c4
	.word	0xf4262008	! t0_kref+0x31ac:   	st	%i2, [%i0 + 8]
	.word	0xb9b50db2	! t0_kref+0x31b0:   	fxors	%f20, %f18, %f28
	.word	0x91a01a22	! t0_kref+0x31b4:   	fstoi	%f2, %f8
	.word	0xc7063fec	! t0_kref+0x31b8:   	ld	[%i0 - 0x14], %f3
	.word	0xe820a02c	! t0_kref+0x31bc:   	st	%l4, [%g2 + 0x2c]
	.word	0x95b50069	! t0_kref+0x31c0:   	edge8ln	%l4, %o1, %o2
	.word	0x9da0013a	! t0_kref+0x31c4:   	fabss	%f26, %f14
	.word	0x9add8011	! t0_kref+0x31c8:   	smulcc	%l6, %l1, %o5
	.word	0x90826c9d	! t0_kref+0x31cc:   	addcc	%o1, 0xc9d, %o0
	.word	0x96d34008	! t0_kref+0x31d0:   	umulcc	%o5, %o0, %o3
	.word	0xb9a01936	! t0_kref+0x31d4:   	fstod	%f22, %f28
	.word	0x9b242502	! t0_kref+0x31d8:   	mulscc	%l0, 0x502, %o5
	.word	0x33480005	! t0_kref+0x31dc:   	fbe,a,pt	%fcc0, _kref+0x31f0
	.word	0x89b08e0a	! t0_kref+0x31e0:   	fand	%f2, %f10, %f4
	.word	0xae2b0011	! t0_kref+0x31e4:   	andn	%o4, %l1, %l7
	.word	0x21480003	! t0_kref+0x31e8:   	fbn,a,pt	%fcc0, _kref+0x31f4
	.word	0xb7a20937	! t0_kref+0x31ec:   	fmuls	%f8, %f23, %f27
	.word	0xaba00522	! t0_kref+0x31f0:   	fsqrts	%f2, %f21
	.word	0x947a4012	! t0_kref+0x31f4:   	sdiv	%o1, %l2, %o2
	.word	0x9a532310	! t0_kref+0x31f8:   	umul	%o4, 0x310, %o5
	.word	0x87a01a56	! t0_kref+0x31fc:   	fdtoi	%f22, %f3
	.word	0xd8380018	! t0_kref+0x3200:   	std	%o4, [%g0 + %i0]
	.word	0x9252c011	! t0_kref+0x3204:   	umul	%o3, %l1, %o1
	.word	0xc168a04f	! t0_kref+0x3208:   	prefetch	%g2 + 0x4f, 0
	.word	0x87a6c924	! t0_kref+0x320c:   	fmuls	%f27, %f4, %f3
	.word	0x91a01a5c	! t0_kref+0x3210:   	fdtoi	%f28, %f8
	.word	0x80b2c011	! t0_kref+0x3214:   	orncc	%o3, %l1, %g0
	.word	0x36480003	! t0_kref+0x3218:   	bge,a,pt	%icc, _kref+0x3224
	.word	0x812339ff	! t0_kref+0x321c:   	mulscc	%o4, -0x601, %g0
	.word	0xd450a028	! t0_kref+0x3220:   	ldsh	[%g2 + 0x28], %o2
	.word	0x89a01912	! t0_kref+0x3224:   	fitod	%f18, %f4
	.word	0xa9a00142	! t0_kref+0x3228:   	fabsd	%f2, %f20
	.word	0x3c480007	! t0_kref+0x322c:   	bpos,a,pt	%icc, _kref+0x3248
	.word	0x9e3d0016	! t0_kref+0x3230:   	xnor	%l4, %l6, %o7
	.word	0x9bb44313	! t0_kref+0x3234:   	alignaddr	%l1, %l3, %o5
	.word	0x81858000	! t0_kref+0x3238:   	wr	%l6, %g0, %y
	.word	0x2e800007	! t0_kref+0x323c:   	bvs,a	_kref+0x3258
	.word	0x90b34016	! t0_kref+0x3240:   	orncc	%o5, %l6, %o0
	.word	0x8fa000b5	! t0_kref+0x3244:   	fnegs	%f21, %f7
	.word	0x908d0000	! t0_kref+0x3248:   	andcc	%l4, %g0, %o0
	.word	0xd9062014	! t0_kref+0x324c:   	ld	[%i0 + 0x14], %f12
	.word	0x85a00152	! t0_kref+0x3250:   	fabsd	%f18, %f2
	.word	0xd676001d	! t0_kref+0x3254:   	stx	%o3, [%i0 + %i5]
	.word	0x95280017	! t0_kref+0x3258:   	sll	%g0, %l7, %o2
	.word	0x9efafcc1	! t0_kref+0x325c:   	sdivcc	%o3, -0x33f, %o7
	.word	0x9b200014	! t0_kref+0x3260:   	mulscc	%g0, %l4, %o5
	.word	0x81dac00e	! t0_kref+0x3264:   	flush	%o3 + %sp
	.word	0x81db302c	! t0_kref+0x3268:   	flush	%o4 - 0xfd4
	.word	0x22480003	! t0_kref+0x326c:   	be,a,pt	%icc, _kref+0x3278
	.word	0xb3b64a3d	! t0_kref+0x3270:   	fpadd16s	%f25, %f29, %f25
	.word	0xd64e0000	! t0_kref+0x3274:   	ldsb	[%i0], %o3
	.word	0x80dcc000	! t0_kref+0x3278:   	smulcc	%l3, %g0, %g0
	.word	0x83414000	! t0_kref+0x327c:   	mov	%pc, %g1
	.word	0xaee56eac	! t0_kref+0x3280:   	subccc	%l5, 0xeac, %l7
	.word	0xd11e401d	! t0_kref+0x3284:   	ldd	[%i1 + %i5], %f8
	.word	0xf53e401d	! t0_kref+0x3288:   	std	%f26, [%i1 + %i5]
	.word	0xb9b60d0a	! t0_kref+0x328c:   	fandnot1	%f24, %f10, %f28
	.word	0xaba00536	! t0_kref+0x3290:   	fsqrts	%f22, %f21
	.word	0x81d90009	! t0_kref+0x3294:   	flush	%g4 + %o1
	.word	0xadb18a8c	! t0_kref+0x3298:   	fpsub16	%f6, %f12, %f22
	.word	0xea6e2012	! t0_kref+0x329c:   	ldstub	[%i0 + 0x12], %l5
	.word	0x9e383938	! t0_kref+0x32a0:   	xnor	%g0, -0x6c8, %o7
	.word	0x81a80a44	! t0_kref+0x32a4:   	fcmpd	%fcc0, %f0, %f4
	.word	0x91a01935	! t0_kref+0x32a8:   	fstod	%f21, %f8
	.word	0x98440008	! t0_kref+0x32ac:   	addc	%l0, %o0, %o4
	.word	0xe2fe101c	! t0_kref+0x32b0:   	swapa	[%i0 + %i4]0x80, %l1
	.word	0xb5b58f84	! t0_kref+0x32b4:   	for	%f22, %f4, %f26
	.word	0x81db8005	! t0_kref+0x32b8:   	flush	%sp + %g5
	.word	0x9924400c	! t0_kref+0x32bc:   	mulscc	%l1, %o4, %o4
	.word	0x9e82f921	! t0_kref+0x32c0:   	addcc	%o3, -0x6df, %o7
	.word	0x3e480005	! t0_kref+0x32c4:   	bvc,a,pt	%icc, _kref+0x32d8
	.word	0xe420a024	! t0_kref+0x32c8:   	st	%l2, [%g2 + 0x24]
	.word	0x89b40750	! t0_kref+0x32cc:   	fpack32	%f16, %f16, %f4
	.word	0xdaee1000	! t0_kref+0x32d0:   	ldstuba	[%i0]0x80, %o5
	.word	0x94b3000a	! t0_kref+0x32d4:   	orncc	%o4, %o2, %o2
	.word	0xada189ce	! t0_kref+0x32d8:   	fdivd	%f6, %f14, %f22
	.word	0x9de3bfa0	! t0_kref+0x32dc:   	save	%sp, -0x60, %sp
	.word	0xb266aa26	! t0_kref+0x32e0:   	subc	%i2, 0xa26, %i1
	.word	0x9bee001a	! t0_kref+0x32e4:   	restore	%i0, %i2, %o5
	.word	0xd62e8019	! t0_kref+0x32e8:   	stb	%o3, [%i2 + %i1]
	.word	0xae836e1b	! t0_kref+0x32ec:   	addcc	%o5, 0xe1b, %l7
	.word	0x33480005	! t0_kref+0x32f0:   	fbe,a,pt	%fcc0, _kref+0x3304
	.word	0xf720a014	! t0_kref+0x32f4:   	st	%f27, [%g2 + 0x14]
	.word	0x907eb6b2	! t0_kref+0x32f8:   	sdiv	%i2, -0x94e, %o0
	.word	0x90b28010	! t0_kref+0x32fc:   	orncc	%o2, %l0, %o0
	.word	0xee20a034	! t0_kref+0x3300:   	st	%l7, [%g2 + 0x34]
	.word	0x9f248000	! t0_kref+0x3304:   	mulscc	%l2, %g0, %o7
	.word	0xe230a01e	! t0_kref+0x3308:   	sth	%l1, [%g2 + 0x1e]
	.word	0x23800006	! t0_kref+0x330c:   	fbne,a	_kref+0x3324
	.word	0xed6e401d	! t0_kref+0x3310:   	prefetch	%i1 + %i5, 22
	.word	0x1b13ae7b	! t0_kref+0x3314:   	sethi	%hi(0x4eb9ec00), %o5
	.word	0x3b800002	! t0_kref+0x3318:   	fble,a	_kref+0x3320
	.word	0x9e7eab31	! t0_kref+0x331c:   	sdiv	%i2, 0xb31, %o7
	.word	0xb9a0055a	! t0_kref+0x3320:   	fsqrtd	%f26, %f28
	.word	0xa9a01923	! t0_kref+0x3324:   	fstod	%f3, %f20
	.word	0xa9b086e6	! t0_kref+0x3328:   	fmul8ulx16	%f2, %f6, %f20
	.word	0x8143e05c	! t0_kref+0x332c:   	membar	0x5c
	.word	0xada009c6	! t0_kref+0x3330:   	fdivd	%f0, %f6, %f22
	.word	0xa1a289d6	! t0_kref+0x3334:   	fdivd	%f10, %f22, %f16
	.word	0x26480004	! t0_kref+0x3338:   	bl,a,pt	%icc, _kref+0x3348
	.word	0x91b60a1c	! t0_kref+0x333c:   	fpadd16	%f24, %f28, %f8
	.word	0xa5a018d8	! t0_kref+0x3340:   	fdtos	%f24, %f18
	.word	0x805c73f7	! t0_kref+0x3344:   	smul	%l1, -0xc09, %g0
	.word	0x8da01904	! t0_kref+0x3348:   	fitod	%f4, %f6
	.word	0x91b10e12	! t0_kref+0x334c:   	fand	%f4, %f18, %f8
	.word	0x8143c000	! t0_kref+0x3350:   	stbar
	.word	0x90c02fc5	! t0_kref+0x3354:   	addccc	%g0, 0xfc5, %o0
	.word	0x8da548a5	! t0_kref+0x3358:   	fsubs	%f21, %f5, %f6
	.word	0x95b10748	! t0_kref+0x335c:   	fpack32	%f4, %f8, %f10
	.word	0xc768a08c	! t0_kref+0x3360:   	prefetch	%g2 + 0x8c, 3
	.word	0x81aaca24	! t0_kref+0x3364:   	fcmps	%fcc0, %f11, %f4
	.word	0x81db281f	! t0_kref+0x3368:   	flush	%o4 + 0x81f
	.word	0xe91e6008	! t0_kref+0x336c:   	ldd	[%i1 + 8], %f20
	.word	0xc04e8018	! t0_kref+0x3370:   	ldsb	[%i2 + %i0], %g0
	call	1f
	.empty
	.word	0xaea2001a	! t0_kref+0x3378:   	subcc	%o0, %i2, %l7
	.word	0x9612c012	! t0_kref+0x337c:   	or	%o3, %l2, %o3
	.word	0xc1296658	! t0_kref+0x3380:   	st	%fsr, [%g5 + 0x658]
1:	.word	0xf51fbef8	! t0_kref+0x3384:   	ldd	[%fp - 0x108], %f26
	.word	0xf8380019	! t0_kref+0x3388:   	std	%i4, [%g0 + %i1]
	.word	0xae35fbb6	! t0_kref+0x338c:   	orn	%l7, -0x44a, %l7
	.word	0x9885400d	! t0_kref+0x3390:   	addcc	%l5, %o5, %o4
	.word	0x91a1895c	! t0_kref+0x3394:   	fmuld	%f6, %f28, %f8
	.word	0x989cef05	! t0_kref+0x3398:   	xorcc	%l3, 0xf05, %o4
	.word	0x9fc00004	! t0_kref+0x339c:   	call	%g0 + %g4
	.word	0x9432000a	! t0_kref+0x33a0:   	orn	%o0, %o2, %o2
	.word	0x9da01933	! t0_kref+0x33a4:   	fstod	%f19, %f14
	.word	0xdd3e401d	! t0_kref+0x33a8:   	std	%f14, [%i1 + %i5]
	.word	0x93a018c8	! t0_kref+0x33ac:   	fdtos	%f8, %f9
	.word	0x9da089c8	! t0_kref+0x33b0:   	fdivd	%f2, %f8, %f14
	.word	0x91b08f4a	! t0_kref+0x33b4:   	fornot1	%f2, %f10, %f8
	.word	0x91b2810c	! t0_kref+0x33b8:   	edge32	%o2, %o4, %o0
	.word	0xa9a0055a	! t0_kref+0x33bc:   	fsqrtd	%f26, %f20
	.word	0xe100a024	! t0_kref+0x33c0:   	ld	[%g2 + 0x24], %f16
	.word	0x95b50400	! t0_kref+0x33c4:   	fcmple16	%f20, %f0, %o2
	.word	0xa7a01a58	! t0_kref+0x33c8:   	fdtoi	%f24, %f19
	.word	0xaba00134	! t0_kref+0x33cc:   	fabss	%f20, %f21
	.word	0x812ac01a	! t0_kref+0x33d0:   	sll	%o3, %i2, %g0
	.word	0x24480007	! t0_kref+0x33d4:   	ble,a,pt	%icc, _kref+0x33f0
	.word	0x91b60914	! t0_kref+0x33d8:   	faligndata	%f24, %f20, %f8
	.word	0xdaae5000	! t0_kref+0x33dc:   	stba	%o5, [%i1]0x80
	.word	0xe13e7ff0	! t0_kref+0x33e0:   	std	%f16, [%i1 - 0x10]
	.word	0x81840000	! t0_kref+0x33e4:   	wr	%l0, %g0, %y
	.word	0x25800005	! t0_kref+0x33e8:   	fblg,a	_kref+0x33fc
	.word	0xec1e4000	! t0_kref+0x33ec:   	ldd	[%i1], %l6
	.word	0x809df6ea	! t0_kref+0x33f0:   	xorcc	%l7, -0x916, %g0
	.word	0x95b18512	! t0_kref+0x33f4:   	fcmpgt16	%f6, %f18, %o2
	.word	0x3e800006	! t0_kref+0x33f8:   	bvc,a	_kref+0x3410
	.word	0x80db3d90	! t0_kref+0x33fc:   	smulcc	%o4, -0x270, %g0
	.word	0x92b24009	! t0_kref+0x3400:   	orncc	%o1, %o1, %o1
	.word	0x93a01a42	! t0_kref+0x3404:   	fdtoi	%f2, %f9
	.word	0xf207bfe0	! t0_kref+0x3408:   	ld	[%fp - 0x20], %i1
	.word	0x973d400c	! t0_kref+0x340c:   	sra	%l5, %o4, %o3
	.word	0xd93e6000	! t0_kref+0x3410:   	std	%f12, [%i1]
	.word	0x9edc7c50	! t0_kref+0x3414:   	smulcc	%l1, -0x3b0, %o7
	.word	0x8da00529	! t0_kref+0x3418:   	fsqrts	%f9, %f6
	.word	0x01165610	! t0_kref+0x341c:   	sethi	%hi(0x59584000), %g0
	.word	0x3c800003	! t0_kref+0x3420:   	bpos,a	_kref+0x342c
	.word	0xda4e001a	! t0_kref+0x3424:   	ldsb	[%i0 + %i2], %o5
	.word	0xc06e3ff6	! t0_kref+0x3428:   	ldstub	[%i0 - 0xa], %g0
	.word	0xd6560000	! t0_kref+0x342c:   	ldsh	[%i0], %o3
	.word	0xef68a000	! t0_kref+0x3430:   	prefetch	%g2, 23
	.word	0x9a84b92f	! t0_kref+0x3434:   	addcc	%l2, -0x6d1, %o5
	.word	0x9de3bfa0	! t0_kref+0x3438:   	save	%sp, -0x60, %sp
	.word	0x91e80018	! t0_kref+0x343c:   	restore	%g0, %i0, %o0
	.word	0xcd1fbd30	! t0_kref+0x3440:   	ldd	[%fp - 0x2d0], %f6
	.word	0x903321a0	! t0_kref+0x3444:   	orn	%o4, 0x1a0, %o0
	.word	0xada088d0	! t0_kref+0x3448:   	fsubd	%f2, %f16, %f22
	.word	0xd24e401a	! t0_kref+0x344c:   	ldsb	[%i1 + %i2], %o1
	.word	0xe46e0000	! t0_kref+0x3450:   	ldstub	[%i0], %l2
	.word	0xf11fbc98	! t0_kref+0x3454:   	ldd	[%fp - 0x368], %f24
	.word	0x81df001f	! t0_kref+0x3458:   	flush	%i4 + %i7
	.word	0x38480006	! t0_kref+0x345c:   	bgu,a,pt	%icc, _kref+0x3474
	.word	0x81828000	! t0_kref+0x3460:   	wr	%o2, %g0, %y
	.word	0x8d828008	! t0_kref+0x3464:   	wr	%o2, %o0, %fprs
	.word	0x80a2a846	! t0_kref+0x3468:   	cmp	%o2, 0x846
	.word	0x9ea0001a	! t0_kref+0x346c:   	subcc	%g0, %i2, %o7
	.word	0x95a01932	! t0_kref+0x3470:   	fstod	%f18, %f10
	.word	0x3f800007	! t0_kref+0x3474:   	fbo,a	_kref+0x3490
	.word	0x9844400d	! t0_kref+0x3478:   	addc	%l1, %o5, %o4
	.word	0x9e2d0012	! t0_kref+0x347c:   	andn	%l4, %l2, %o7
	.word	0x9e303b81	! t0_kref+0x3480:   	orn	%g0, -0x47f, %o7
	.word	0x28480004	! t0_kref+0x3484:   	bleu,a,pt	%icc, _kref+0x3494
	.word	0x95a000a2	! t0_kref+0x3488:   	fnegs	%f2, %f10
	.word	0x9e9e8009	! t0_kref+0x348c:   	xorcc	%i2, %o1, %o7
	.word	0x9b35400a	! t0_kref+0x3490:   	srl	%l5, %o2, %o5
	.word	0xa5a589ce	! t0_kref+0x3494:   	fdivd	%f22, %f14, %f18
	.word	0x172787ec	! t0_kref+0x3498:   	sethi	%hi(0x9e1fb000), %o3
	.word	0xae380012	! t0_kref+0x349c:   	xnor	%g0, %l2, %l7
	.word	0x91a000ad	! t0_kref+0x34a0:   	fnegs	%f13, %f8
	.word	0x81580000	! t0_kref+0x34a4:   	flushw
	.word	0xf207bfe0	! t0_kref+0x34a8:   	ld	[%fp - 0x20], %i1
	.word	0xe8e81019	! t0_kref+0x34ac:   	ldstuba	[%g0 + %i1]0x80, %l4
	.word	0xada000b9	! t0_kref+0x34b0:   	fnegs	%f25, %f22
	.word	0xd6780019	! t0_kref+0x34b4:   	swap	[%g0 + %i1], %o3
	.word	0xd3e65015	! t0_kref+0x34b8:   	casa	[%i1]0x80, %l5, %o1
	.word	0xc056c018	! t0_kref+0x34bc:   	ldsh	[%i3 + %i0], %g0
	.word	0xa1b44622	! t0_kref+0x34c0:   	fmul8x16	%f17, %f2, %f16
	.word	0xf43e2018	! t0_kref+0x34c4:   	std	%i2, [%i0 + 0x18]
	.word	0xc91fbcd0	! t0_kref+0x34c8:   	ldd	[%fp - 0x330], %f4
	.word	0xec7e4000	! t0_kref+0x34cc:   	swap	[%i1], %l6
	.word	0x8143e040	! t0_kref+0x34d0:   	membar	0x40
	.word	0xa5a0192a	! t0_kref+0x34d4:   	fstod	%f10, %f18
	.word	0x90bd800a	! t0_kref+0x34d8:   	xnorcc	%l6, %o2, %o0
	.word	0xee20a008	! t0_kref+0x34dc:   	st	%l7, [%g2 + 8]
	.word	0x8db50c50	! t0_kref+0x34e0:   	fnor	%f20, %f16, %f6
	.word	0x98a68016	! t0_kref+0x34e4:   	subcc	%i2, %l6, %o4
	.word	0xd19e5a1a	! t0_kref+0x34e8:   	ldda	[%i1 + %i2]0xd0, %f8
	.word	0xd62e3fef	! t0_kref+0x34ec:   	stb	%o3, [%i0 - 0x11]
	.word	0x98842e5a	! t0_kref+0x34f0:   	addcc	%l0, 0xe5a, %o4
	.word	0x90b32b4b	! t0_kref+0x34f4:   	orncc	%o4, 0xb4b, %o0
	.word	0x9de3bfa0	! t0_kref+0x34f8:   	save	%sp, -0x60, %sp
	.word	0xb6a6c019	! t0_kref+0x34fc:   	subcc	%i3, %i1, %i3
	.word	0xafe8001c	! t0_kref+0x3500:   	restore	%g0, %i4, %l7
	.word	0x9a834017	! t0_kref+0x3504:   	addcc	%o5, %l7, %o5
	.word	0xaf22e1a1	! t0_kref+0x3508:   	mulscc	%o3, 0x1a1, %l7
	.word	0x81b48542	! t0_kref+0x350c:   	fcmpeq16	%f18, %f2, %g0
	.word	0x1f1a434b	! t0_kref+0x3510:   	sethi	%hi(0x690d2c00), %o7
	.word	0xec981019	! t0_kref+0x3514:   	ldda	[%g0 + %i1]0x80, %l6
	.word	0xee774019	! t0_kref+0x3518:   	stx	%l7, [%i5 + %i1]
	.word	0x80822f3a	! t0_kref+0x351c:   	addcc	%o0, 0xf3a, %g0
	.word	0xadb30a58	! t0_kref+0x3520:   	fpadd32	%f12, %f24, %f22
	.word	0xd028a005	! t0_kref+0x3524:   	stb	%o0, [%g2 + 5]
	.word	0x95b40492	! t0_kref+0x3528:   	fcmple32	%f16, %f18, %o2
	.word	0x9685b6ba	! t0_kref+0x352c:   	addcc	%l6, -0x946, %o3
	.word	0x3a480001	! t0_kref+0x3530:   	bcc,a,pt	%icc, _kref+0x3534
	.word	0xe91fbf58	! t0_kref+0x3534:   	ldd	[%fp - 0xa8], %f20
	.word	0x25800006	! t0_kref+0x3538:   	fblg,a	_kref+0x3550
	.word	0x9265c00d	! t0_kref+0x353c:   	subc	%l7, %o5, %o1
	.word	0xd6567fe2	! t0_kref+0x3540:   	ldsh	[%i1 - 0x1e], %o3
	.word	0xa1a74826	! t0_kref+0x3544:   	fadds	%f29, %f6, %f16
	.word	0xcd1fbe28	! t0_kref+0x3548:   	ldd	[%fp - 0x1d8], %f6
	.word	0xa5a0193d	! t0_kref+0x354c:   	fstod	%f29, %f18
	.word	0xbbb1ca6b	! t0_kref+0x3550:   	fpadd32s	%f7, %f11, %f29
	.word	0xae646777	! t0_kref+0x3554:   	subc	%l1, 0x777, %l7
	.word	0x80834000	! t0_kref+0x3558:   	addcc	%o5, %g0, %g0
	.word	0x35480007	! t0_kref+0x355c:   	fbue,a,pt	%fcc0, _kref+0x3578
	.word	0x9a1c800b	! t0_kref+0x3560:   	xor	%l2, %o3, %o5
	.word	0x30480004	! t0_kref+0x3564:   	ba,a,pt	%icc, _kref+0x3574
	.word	0xd51fbe90	! t0_kref+0x3568:   	ldd	[%fp - 0x170], %f10
	.word	0x9866801a	! t0_kref+0x356c:   	subc	%i2, %i2, %o4
	.word	0x94552aeb	! t0_kref+0x3570:   	umul	%l4, 0xaeb, %o2
	.word	0x9ebb336f	! t0_kref+0x3574:   	xnorcc	%o4, -0xc91, %o7
	.word	0x97b34333	! t0_kref+0x3578:   	bmask	%o5, %l3, %o3
	.word	0x190d5691	! t0_kref+0x357c:   	sethi	%hi(0x355a4400), %o4
	.word	0x905c8014	! t0_kref+0x3580:   	smul	%l2, %l4, %o0
	.word	0xd828a02b	! t0_kref+0x3584:   	stb	%o4, [%g2 + 0x2b]
	.word	0x3c480008	! t0_kref+0x3588:   	bpos,a,pt	%icc, _kref+0x35a8
	.word	0x98c428c8	! t0_kref+0x358c:   	addccc	%l0, 0x8c8, %o4
	.word	0x3a480006	! t0_kref+0x3590:   	bcc,a,pt	%icc, _kref+0x35a8
	.word	0x932dc017	! t0_kref+0x3594:   	sll	%l7, %l7, %o1
	.word	0x85a01a42	! t0_kref+0x3598:   	fdtoi	%f2, %f2
	.word	0xa9a0190e	! t0_kref+0x359c:   	fitod	%f14, %f20
	.word	0x2b800002	! t0_kref+0x35a0:   	fbug,a	_kref+0x35a8
	.word	0xe43e001d	! t0_kref+0x35a4:   	std	%l2, [%i0 + %i5]
	.word	0x21480007	! t0_kref+0x35a8:   	fbn,a,pt	%fcc0, _kref+0x35c4
	.word	0xada2892d	! t0_kref+0x35ac:   	fmuls	%f10, %f13, %f22
	.word	0x90ba8012	! t0_kref+0x35b0:   	xnorcc	%o2, %l2, %o0
	.word	0x28800008	! t0_kref+0x35b4:   	bleu,a	_kref+0x35d4
	.word	0x9ebb3ea8	! t0_kref+0x35b8:   	xnorcc	%o4, -0x158, %o7
	.word	0xa9a34921	! t0_kref+0x35bc:   	fmuls	%f13, %f1, %f20
	.word	0x93b68498	! t0_kref+0x35c0:   	fcmple32	%f26, %f24, %o1
	.word	0x85a6884c	! t0_kref+0x35c4:   	faddd	%f26, %f12, %f2
	.word	0x89a74d30	! t0_kref+0x35c8:   	fsmuld	%f29, %f16, %f4
	.word	0xd8567ffa	! t0_kref+0x35cc:   	ldsh	[%i1 - 6], %o4
	.word	0xec180019	! t0_kref+0x35d0:   	ldd	[%g0 + %i1], %l6
	.word	0xe13e3fe8	! t0_kref+0x35d4:   	std	%f16, [%i0 - 0x18]
	.word	0x99a289c6	! t0_kref+0x35d8:   	fdivd	%f10, %f6, %f12
	.word	0xd8901019	! t0_kref+0x35dc:   	lduha	[%g0 + %i1]0x80, %o4
	.word	0x2a480006	! t0_kref+0x35e0:   	bcs,a,pt	%icc, _kref+0x35f8
	.word	0xa9b60f42	! t0_kref+0x35e4:   	fornot1	%f24, %f2, %f20
	.word	0x25480005	! t0_kref+0x35e8:   	fblg,a,pt	%fcc0, _kref+0x35fc
	.word	0xb1b74dad	! t0_kref+0x35ec:   	fxors	%f29, %f13, %f24
	.word	0xae0dfa0f	! t0_kref+0x35f0:   	and	%l7, -0x5f1, %l7
	.word	0xb1a20933	! t0_kref+0x35f4:   	fmuls	%f8, %f19, %f24
	.word	0xda0e2004	! t0_kref+0x35f8:   	ldub	[%i0 + 4], %o5
	.word	0xafb30048	! t0_kref+0x35fc:   	edge8l	%o4, %o0, %l7
	.word	0xfb6e001a	! t0_kref+0x3600:   	prefetch	%i0 + %i2, 29
	.word	0x22800001	! t0_kref+0x3604:   	be,a	_kref+0x3608
	.word	0x95b2c168	! t0_kref+0x3608:   	edge32ln	%o3, %o0, %o2
	.word	0x94e32a45	! t0_kref+0x360c:   	subccc	%o4, 0xa45, %o2
	.word	0xd4b81018	! t0_kref+0x3610:   	stda	%o2, [%g0 + %i0]0x80
	.word	0x89a01908	! t0_kref+0x3614:   	fitod	%f8, %f4
	.word	0x8db0076e	! t0_kref+0x3618:   	fpack16	%f14, %f6
	.word	0x81db000d	! t0_kref+0x361c:   	flush	%o4 + %o5
	.word	0x9da0004c	! t0_kref+0x3620:   	fmovd	%f12, %f14
	.word	0x3e800004	! t0_kref+0x3624:   	bvc,a	_kref+0x3634
	.word	0xd24e600f	! t0_kref+0x3628:   	ldsb	[%i1 + 0xf], %o1
	.word	0x9e7a4011	! t0_kref+0x362c:   	sdiv	%o1, %l1, %o7
	.word	0x9ef4b163	! t0_kref+0x3630:   	udivcc	%l2, -0xe9d, %o7
	.word	0xd43e001d	! t0_kref+0x3634:   	std	%o2, [%i0 + %i5]
	.word	0xbba01082	! t0_kref+0x3638:   	fxtos	%f2, %f29
	.word	0x903a0013	! t0_kref+0x363c:   	xnor	%o0, %l3, %o0
	.word	0x8143e040	! t0_kref+0x3640:   	membar	0x40
	.word	0xee30a03a	! t0_kref+0x3644:   	sth	%l7, [%g2 + 0x3a]
	.word	0x9da609d4	! t0_kref+0x3648:   	fdivd	%f24, %f20, %f14
	.word	0xd850a024	! t0_kref+0x364c:   	ldsh	[%g2 + 0x24], %o4
	.word	0xcd1fbe50	! t0_kref+0x3650:   	ldd	[%fp - 0x1b0], %f6
	.word	0x8185c000	! t0_kref+0x3654:   	wr	%l7, %g0, %y
	call	1f
	.empty
	.word	0xda5e3fe0	! t0_kref+0x365c:   	ldx	[%i0 - 0x20], %o5
1:	.word	0x15392764	! t0_kref+0x3660:   	sethi	%hi(0xe49d9000), %o2
	.word	0x99254013	! t0_kref+0x3664:   	mulscc	%l5, %l3, %o4
	.word	0xe62e601c	! t0_kref+0x3668:   	stb	%l3, [%i1 + 0x1c]
	.word	0xa5a0193a	! t0_kref+0x366c:   	fstod	%f26, %f18
	.word	0x81580000	! t0_kref+0x3670:   	flushw
	.word	0x9fc10000	! t0_kref+0x3674:   	call	%g4
	.word	0xe43e6000	! t0_kref+0x3678:   	std	%l2, [%i1]
	.word	0x85a34834	! t0_kref+0x367c:   	fadds	%f13, %f20, %f2
	.word	0x9485c015	! t0_kref+0x3680:   	addcc	%l7, %l5, %o2
	.word	0x97b50ae3	! t0_kref+0x3684:   	fpsub32s	%f20, %f3, %f11
	.word	0x96ba8010	! t0_kref+0x3688:   	xnorcc	%o2, %l0, %o3
	.word	0x98db73a2	! t0_kref+0x368c:   	smulcc	%o5, -0xc5e, %o4
	.word	0xd856200a	! t0_kref+0x3690:   	ldsh	[%i0 + 0xa], %o4
	.word	0x9fb4417a	! t0_kref+0x3694:   	edge32ln	%l1, %i2, %o7
	.word	0x81580000	! t0_kref+0x3698:   	flushw
	.word	0xd878a034	! t0_kref+0x369c:   	swap	[%g2 + 0x34], %o4
	.word	0x3d480002	! t0_kref+0x36a0:   	fbule,a,pt	%fcc0, _kref+0x36a8
	.word	0xa5a388af	! t0_kref+0x36a4:   	fsubs	%f14, %f15, %f18
	.word	0x2b800002	! t0_kref+0x36a8:   	fbug,a	_kref+0x36b0
	.word	0xa9a449a3	! t0_kref+0x36ac:   	fdivs	%f17, %f3, %f20
	.word	0xd8070019	! t0_kref+0x36b0:   	ld	[%i4 + %i1], %o4
	.word	0x89a0052c	! t0_kref+0x36b4:   	fsqrts	%f12, %f4
	.word	0x37800003	! t0_kref+0x36b8:   	fbge,a	_kref+0x36c4
	.word	0x983a7708	! t0_kref+0x36bc:   	xnor	%o1, -0x8f8, %o4
	.word	0x85a018da	! t0_kref+0x36c0:   	fdtos	%f26, %f2
	.word	0x27800003	! t0_kref+0x36c4:   	fbul,a	_kref+0x36d0
	.word	0xb3a4092f	! t0_kref+0x36c8:   	fmuls	%f16, %f15, %f25
	.word	0xe5063ff0	! t0_kref+0x36cc:   	ld	[%i0 - 0x10], %f18
	.word	0xe99e1a5d	! t0_kref+0x36d0:   	ldda	[%i0 + %i5]0xd2, %f20
	.word	0x9db00fc0	! t0_kref+0x36d4:   	fone	%f14
	.word	0x9b244008	! t0_kref+0x36d8:   	mulscc	%l1, %o0, %o5
	.word	0x97134009	! t0_kref+0x36dc:   	taddcctv	%o5, %o1, %o3
	.word	0xafa4c9ac	! t0_kref+0x36e0:   	fdivs	%f19, %f12, %f23
	.word	0x92547710	! t0_kref+0x36e4:   	umul	%l1, -0x8f0, %o1
	.word	0xf19e101d	! t0_kref+0x36e8:   	ldda	[%i0 + %i5]0x80, %f24
	.word	0xe628a028	! t0_kref+0x36ec:   	stb	%l3, [%g2 + 0x28]
	.word	0xae9ceb2c	! t0_kref+0x36f0:   	xorcc	%l3, 0xb2c, %l7
	.word	0x81858000	! t0_kref+0x36f4:   	wr	%l6, %g0, %y
	.word	0x96bd2374	! t0_kref+0x36f8:   	xnorcc	%l4, 0x374, %o3
	.word	0x9eadba7a	! t0_kref+0x36fc:   	andncc	%l6, -0x586, %o7
	.word	0x95b34240	! t0_kref+0x3700:   	array16	%o5, %g0, %o2
	.word	0xda0e001a	! t0_kref+0x3704:   	ldub	[%i0 + %i2], %o5
	.word	0xb3a3c92f	! t0_kref+0x3708:   	fmuls	%f15, %f15, %f25
	.word	0xd886101c	! t0_kref+0x370c:   	lda	[%i0 + %i4]0x80, %o4
	.word	0x3e480005	! t0_kref+0x3710:   	bvc,a,pt	%icc, _kref+0x3724
	.word	0x98aa800b	! t0_kref+0x3714:   	andncc	%o2, %o3, %o4
	.word	0x9722335c	! t0_kref+0x3718:   	mulscc	%o0, -0xca4, %o3
	.word	0x992b4000	! t0_kref+0x371c:   	sll	%o5, %g0, %o4
	.word	0x28800006	! t0_kref+0x3720:   	bleu,a	_kref+0x3738
	.word	0xeb68a005	! t0_kref+0x3724:   	prefetch	%g2 + 5, 21
	.word	0x3a800002	! t0_kref+0x3728:   	bcc,a	_kref+0x3730
	.word	0x967c3689	! t0_kref+0x372c:   	sdiv	%l0, -0x977, %o3
	.word	0x90b229e1	! t0_kref+0x3730:   	orncc	%o0, 0x9e1, %o0
	.word	0x94330000	! t0_kref+0x3734:   	orn	%o4, %g0, %o2
	.word	0x2f800004	! t0_kref+0x3738:   	fbu,a	_kref+0x3748
	.word	0xec3e001d	! t0_kref+0x373c:   	std	%l6, [%i0 + %i5]
	.word	0x81858000	! t0_kref+0x3740:   	wr	%l6, %g0, %y
	.word	0x81df8012	! t0_kref+0x3744:   	flush	%fp + %l2
	.word	0x29480007	! t0_kref+0x3748:   	fbl,a,pt	%fcc0, _kref+0x3764
	.word	0xf16e7ff8	! t0_kref+0x374c:   	prefetch	%i1 - 8, 24
	.word	0x920d8012	! t0_kref+0x3750:   	and	%l6, %l2, %o1
	.word	0x23800002	! t0_kref+0x3754:   	fbne,a	_kref+0x375c
	.word	0x87a0052d	! t0_kref+0x3758:   	fsqrts	%f13, %f3
	.word	0x32480001	! t0_kref+0x375c:   	bne,a,pt	%icc, _kref+0x3760
	.word	0x9bb38a67	! t0_kref+0x3760:   	fpadd32s	%f14, %f7, %f13
	.word	0x9fc00004	! t0_kref+0x3764:   	call	%g0 + %g4
	.word	0xae7a2844	! t0_kref+0x3768:   	sdiv	%o0, 0x844, %l7
	.word	0x23480007	! t0_kref+0x376c:   	fbne,a,pt	%fcc0, _kref+0x3788
	.word	0xd60e0000	! t0_kref+0x3770:   	ldub	[%i0], %o3
	.word	0xd6560000	! t0_kref+0x3774:   	ldsh	[%i0], %o3
	.word	0x95a00125	! t0_kref+0x3778:   	fabss	%f5, %f10
	.word	0xa9a000ae	! t0_kref+0x377c:   	fnegs	%f14, %f20
	.word	0x9eb23c2f	! t0_kref+0x3780:   	orncc	%o0, -0x3d1, %o7
	.word	0x928c798e	! t0_kref+0x3784:   	andcc	%l1, -0x672, %o1
	.word	0x81ad0ada	! t0_kref+0x3788:   	fcmped	%fcc0, %f20, %f26
	.word	0xe81f4018	! t0_kref+0x378c:   	ldd	[%i5 + %i0], %l4
	.word	0x85a01a25	! t0_kref+0x3790:   	fstoi	%f5, %f2
	.word	0x9ec2ef1a	! t0_kref+0x3794:   	addccc	%o3, 0xf1a, %o7
	.word	0x36480002	! t0_kref+0x3798:   	bge,a,pt	%icc, _kref+0x37a0
	.word	0xadb486a9	! t0_kref+0x379c:   	fmul8x16al	%f18, %f9, %f22
	.word	0x3d480008	! t0_kref+0x37a0:   	fbule,a,pt	%fcc0, _kref+0x37c0
	.word	0x9fb60e38	! t0_kref+0x37a4:   	fands	%f24, %f24, %f15
	.word	0xb5b1caf0	! t0_kref+0x37a8:   	fpsub32s	%f7, %f16, %f26
	.word	0x9db7470d	! t0_kref+0x37ac:   	fmuld8sux16	%f29, %f13, %f14
	.word	0xe81e6000	! t0_kref+0x37b0:   	ldd	[%i1], %l4
	.word	0x81ab0ada	! t0_kref+0x37b4:   	fcmped	%fcc0, %f12, %f26
	.word	0xe4262004	! t0_kref+0x37b8:   	st	%l2, [%i0 + 4]
	.word	0xb3a00134	! t0_kref+0x37bc:   	fabss	%f20, %f25
	.word	0x91a189ca	! t0_kref+0x37c0:   	fdivd	%f6, %f10, %f8
	.word	0x9e8dc00a	! t0_kref+0x37c4:   	andcc	%l7, %o2, %o7
	.word	0xe4ee101a	! t0_kref+0x37c8:   	ldstuba	[%i0 + %i2]0x80, %l2
	.word	0xda2e2002	! t0_kref+0x37cc:   	stb	%o5, [%i0 + 2]
	.word	0xc00e2001	! t0_kref+0x37d0:   	ldub	[%i0 + 1], %g0
	.word	0x31800004	! t0_kref+0x37d4:   	fba,a	_kref+0x37e4
	.word	0x9410245b	! t0_kref+0x37d8:   	mov	0x45b, %o2
	.word	0xec1e7ff8	! t0_kref+0x37dc:   	ldd	[%i1 - 8], %l6
	.word	0xf83e001d	! t0_kref+0x37e0:   	std	%i4, [%i0 + %i5]
	.word	0xada000a3	! t0_kref+0x37e4:   	fnegs	%f3, %f22
	.word	0x37800003	! t0_kref+0x37e8:   	fbge,a	_kref+0x37f4
	.word	0xed68a00d	! t0_kref+0x37ec:   	prefetch	%g2 + 0xd, 22
	.word	0x33480008	! t0_kref+0x37f0:   	fbe,a,pt	%fcc0, _kref+0x3810
	.word	0x85b08f88	! t0_kref+0x37f4:   	for	%f2, %f8, %f2
	.word	0xe16e2018	! t0_kref+0x37f8:   	prefetch	%i0 + 0x18, 16
	.word	0x96e47d0e	! t0_kref+0x37fc:   	subccc	%l1, -0x2f2, %o3
	.word	0x9eb83757	! t0_kref+0x3800:   	xnorcc	%g0, -0x8a9, %o7
	.word	0xb9a0054a	! t0_kref+0x3804:   	fsqrtd	%f10, %f28
	.word	0xda4e6012	! t0_kref+0x3808:   	ldsb	[%i1 + 0x12], %o5
	.word	0xa3a1c932	! t0_kref+0x380c:   	fmuls	%f7, %f18, %f17
	.word	0x80153fcd	! t0_kref+0x3810:   	or	%l4, -0x33, %g0
	.word	0xada01930	! t0_kref+0x3814:   	fstod	%f16, %f22
	.word	0x2a480001	! t0_kref+0x3818:   	bcs,a,pt	%icc, _kref+0x381c
	.word	0xe91fbf00	! t0_kref+0x381c:   	ldd	[%fp - 0x100], %f20
	.word	0x98be800c	! t0_kref+0x3820:   	xnorcc	%i2, %o4, %o4
	.word	0xd9be5840	! t0_kref+0x3824:   	stda	%f12, [%i1]0xc2
	.word	0x8da01917	! t0_kref+0x3828:   	fitod	%f23, %f6
	.word	0xb1a01a5c	! t0_kref+0x382c:   	fdtoi	%f28, %f24
	.word	0x90e2c009	! t0_kref+0x3830:   	subccc	%o3, %o1, %o0
	.word	0x981cbec4	! t0_kref+0x3834:   	xor	%l2, -0x13c, %o4
	.word	0x81a98ad6	! t0_kref+0x3838:   	fcmped	%fcc0, %f6, %f22
	.word	0xd608a000	! t0_kref+0x383c:   	ldub	[%g2], %o3
	.word	0xda7e3ff4	! t0_kref+0x3840:   	swap	[%i0 - 0xc], %o5
	.word	0x9bb54120	! t0_kref+0x3844:   	edge32n	%l5, %g0, %o5
	.word	0x9a080012	! t0_kref+0x3848:   	and	%g0, %l2, %o5
	.word	0xa1a449a5	! t0_kref+0x384c:   	fdivs	%f17, %f5, %f16
	.word	0xe91e6000	! t0_kref+0x3850:   	ldd	[%i1], %f20
	.word	0x3d480003	! t0_kref+0x3854:   	fbule,a,pt	%fcc0, _kref+0x3860
	.word	0xe91fbdd8	! t0_kref+0x3858:   	ldd	[%fp - 0x228], %f20
	.word	0xb5a0190c	! t0_kref+0x385c:   	fitod	%f12, %f26
	.word	0x972a400a	! t0_kref+0x3860:   	sll	%o1, %o2, %o3
	.word	0x9e2c6cc2	! t0_kref+0x3864:   	andn	%l1, 0xcc2, %o7
	.word	0x9e9dc00b	! t0_kref+0x3868:   	xorcc	%l7, %o3, %o7
	.word	0x89a01911	! t0_kref+0x386c:   	fitod	%f17, %f4
	.word	0x28800007	! t0_kref+0x3870:   	bleu,a	_kref+0x388c
	.word	0x90dac00c	! t0_kref+0x3874:   	smulcc	%o3, %o4, %o0
	.word	0x35800005	! t0_kref+0x3878:   	fbue,a	_kref+0x388c
	.word	0xaeb33335	! t0_kref+0x387c:   	orncc	%o4, -0xccb, %l7
	.word	0x91b40490	! t0_kref+0x3880:   	fcmple32	%f16, %f16, %o0
	.word	0x8ba5c8ac	! t0_kref+0x3884:   	fsubs	%f23, %f12, %f5
	.word	0xf4200018	! t0_kref+0x3888:   	st	%i2, [%g0 + %i0]
	.word	0xe43e001d	! t0_kref+0x388c:   	std	%l2, [%i0 + %i5]
	.word	0x923a0010	! t0_kref+0x3890:   	xnor	%o0, %l0, %o1
	.word	0x95030012	! t0_kref+0x3894:   	taddcc	%o4, %l2, %o2
	.word	0xd8380018	! t0_kref+0x3898:   	std	%o4, [%g0 + %i0]
	.word	0xc368a04f	! t0_kref+0x389c:   	prefetch	%g2 + 0x4f, 1
	.word	0x9da708ce	! t0_kref+0x38a0:   	fsubd	%f28, %f14, %f14
	.word	0xada01927	! t0_kref+0x38a4:   	fstod	%f7, %f22
	.word	0x81a88a52	! t0_kref+0x38a8:   	fcmpd	%fcc0, %f2, %f18
	.word	0xa3b00768	! t0_kref+0x38ac:   	fpack16	%f8, %f17
	.word	0xd8480018	! t0_kref+0x38b0:   	ldsb	[%g0 + %i0], %o4
	.word	0x9db00cc8	! t0_kref+0x38b4:   	fnot2	%f8, %f14
	.word	0x929a000c	! t0_kref+0x38b8:   	xorcc	%o0, %o4, %o1
	.word	0xde56c019	! t0_kref+0x38bc:   	ldsh	[%i3 + %i1], %o7
	.word	0x80dd396e	! t0_kref+0x38c0:   	smulcc	%l4, -0x692, %g0
	.word	0x97400000	! t0_kref+0x38c4:   	mov	%y, %o3
	.word	0xd43f4018	! t0_kref+0x38c8:   	std	%o2, [%i5 + %i0]
	.word	0x91b206f8	! t0_kref+0x38cc:   	fmul8ulx16	%f8, %f24, %f8
	.word	0x9e1dc012	! t0_kref+0x38d0:   	xor	%l7, %l2, %o7
	.word	0x9f24bed5	! t0_kref+0x38d4:   	mulscc	%l2, -0x12b, %o7
	.word	0xe828a00a	! t0_kref+0x38d8:   	stb	%l4, [%g2 + 0xa]
	.word	0xe5200019	! t0_kref+0x38dc:   	st	%f18, [%g0 + %i1]
	.word	0xe3067ff8	! t0_kref+0x38e0:   	ld	[%i1 - 8], %f17
	.word	0xe3ee101d	! t0_kref+0x38e4:   	prefetcha	%i0 + %i5, 17
	.word	0x91227008	! t0_kref+0x38e8:   	mulscc	%o1, -0xff8, %o0
	.word	0xa7a01a2f	! t0_kref+0x38ec:   	fstoi	%f15, %f19
	.word	0xe07f0019	! t0_kref+0x38f0:   	swap	[%i4 + %i1], %l0
	.word	0x9fc10000	! t0_kref+0x38f4:   	call	%g4
	.word	0x81b10544	! t0_kref+0x38f8:   	fcmpeq16	%f4, %f4, %g0
	.word	0x8fb54de6	! t0_kref+0x38fc:   	fnands	%f21, %f6, %f7
	.word	0x945cc010	! t0_kref+0x3900:   	smul	%l3, %l0, %o2
	.word	0xa1a0002c	! t0_kref+0x3904:   	fmovs	%f12, %f16
	.word	0x81400000	! t0_kref+0x3908:   	mov	%y, %g0
	.word	0xa3a0052a	! t0_kref+0x390c:   	fsqrts	%f10, %f17
	.word	0xa1b68c90	! t0_kref+0x3910:   	fandnot2	%f26, %f16, %f16
	.word	0xa9b48e52	! t0_kref+0x3914:   	fxnor	%f18, %f18, %f20
	.word	0x811d8016	! t0_kref+0x3918:   	tsubcctv	%l6, %l6, %g0
	.word	0xe67e3ffc	! t0_kref+0x391c:   	swap	[%i0 - 4], %l3
	.word	0xaba00523	! t0_kref+0x3920:   	fsqrts	%f3, %f21
	.word	0x9da00152	! t0_kref+0x3924:   	fabsd	%f18, %f14
	.word	0xd82e6002	! t0_kref+0x3928:   	stb	%o4, [%i1 + 2]
	.word	0x38800003	! t0_kref+0x392c:   	bgu,a	_kref+0x3938
	.word	0x9ed24012	! t0_kref+0x3930:   	umulcc	%o1, %l2, %o7
	.word	0x85b546bd	! t0_kref+0x3934:   	fmul8x16al	%f21, %f29, %f2
	.word	0x94528010	! t0_kref+0x3938:   	umul	%o2, %l0, %o2
	.word	0xec7e200c	! t0_kref+0x393c:   	swap	[%i0 + 0xc], %l6
	.word	0xda4e8019	! t0_kref+0x3940:   	ldsb	[%i2 + %i1], %o5
	.word	0x80aac015	! t0_kref+0x3944:   	andncc	%o3, %l5, %g0
	.word	0x81aa0a48	! t0_kref+0x3948:   	fcmpd	%fcc0, %f8, %f8
	.word	0x2e800006	! t0_kref+0x394c:   	bvs,a	_kref+0x3964
	.word	0x97408000	! t0_kref+0x3950:   	mov	%ccr, %o3
	.word	0x967c8011	! t0_kref+0x3954:   	sdiv	%l2, %l1, %o3
	.word	0x31800008	! t0_kref+0x3958:   	fba,a	_kref+0x3978
	.word	0xae65c000	! t0_kref+0x395c:   	subc	%l7, %g0, %l7
	.word	0x81a88a5a	! t0_kref+0x3960:   	fcmpd	%fcc0, %f2, %f26
	.word	0xb9a18940	! t0_kref+0x3964:   	fmuld	%f6, %f0, %f28
	.word	0xa1a000ae	! t0_kref+0x3968:   	fnegs	%f14, %f16
	.word	0x2e800005	! t0_kref+0x396c:   	bvs,a	_kref+0x3980
	.word	0x91a01084	! t0_kref+0x3970:   	fxtos	%f4, %f8
	.word	0xd0ee9018	! t0_kref+0x3974:   	ldstuba	[%i2 + %i0]0x80, %o0
	.word	0xd43f4018	! t0_kref+0x3978:   	std	%o2, [%i5 + %i0]
	.word	0x32480002	! t0_kref+0x397c:   	bne,a,pt	%icc, _kref+0x3984
	.word	0xb5b5cafb	! t0_kref+0x3980:   	fpsub32s	%f23, %f27, %f26
	.word	0x85a00548	! t0_kref+0x3984:   	fsqrtd	%f8, %f2
	.word	0xd47e2018	! t0_kref+0x3988:   	swap	[%i0 + 0x18], %o2
	.word	0xea266008	! t0_kref+0x398c:   	st	%l5, [%i1 + 8]
	.word	0xc96e7fe0	! t0_kref+0x3990:   	prefetch	%i1 - 0x20, 4
	.word	0x25480006	! t0_kref+0x3994:   	fblg,a,pt	%fcc0, _kref+0x39ac
	.word	0xe626401c	! t0_kref+0x3998:   	st	%l3, [%i1 + %i4]
	.word	0x91a01058	! t0_kref+0x399c:   	fdtox	%f24, %f8
	.word	0x34480005	! t0_kref+0x39a0:   	bg,a,pt	%icc, _kref+0x39b4
	.word	0x80c4c00c	! t0_kref+0x39a4:   	addccc	%l3, %o4, %g0
	.word	0xd13e2018	! t0_kref+0x39a8:   	std	%f8, [%i0 + 0x18]
	.word	0x2b800006	! t0_kref+0x39ac:   	fbug,a	_kref+0x39c4
	.word	0x9a634016	! t0_kref+0x39b0:   	subc	%o5, %l6, %o5
	.word	0x9aa5000a	! t0_kref+0x39b4:   	subcc	%l4, %o2, %o5
	.word	0x81850000	! t0_kref+0x39b8:   	wr	%l4, %g0, %y
	.word	0xb7a01a5c	! t0_kref+0x39bc:   	fdtoi	%f28, %f27
	.word	0x81a01904	! t0_kref+0x39c0:   	fitod	%f4, %f0
	.word	0x8143e040	! t0_kref+0x39c4:   	membar	0x40
	.word	0xe05068eb	! t0_kref+0x39c8:   	ldsh	[%g1 + 0x8eb], %l0
	.word	0x801429ef	! t0_kref+0x39cc:   	or	%l0, 0x9ef, %g0
	.word	0x94a33a9e	! t0_kref+0x39d0:   	subcc	%o4, -0x562, %o2
	.word	0xcf20a024	! t0_kref+0x39d4:   	st	%f7, [%g2 + 0x24]
	.word	0xf007bfe0	! t0_kref+0x39d8:   	ld	[%fp - 0x20], %i0
	.word	0xf91fbfc8	! t0_kref+0x39dc:   	ldd	[%fp - 0x38], %f28
	.word	0xc1be188b	! t0_kref+0x39e0:   	stda	%f0, [%i0 + %o3]0xc4
	.word	0xc9be1848	! t0_kref+0x39e4:   	stda	%f4, [%i0 + %o0]0xc2
	.word	0xde4e3fec	! t0_kref+0x39e8:   	ldsb	[%i0 - 0x14], %o7
	.word	0xd800a010	! t0_kref+0x39ec:   	ld	[%g2 + 0x10], %o4
	.word	0x947ca762	! t0_kref+0x39f0:   	sdiv	%l2, 0x762, %o2
	.word	0x98b47657	! t0_kref+0x39f4:   	orncc	%l1, -0x9a9, %o4
	.word	0xae14622e	! t0_kref+0x39f8:   	or	%l1, 0x22e, %l7
	.word	0x38800002	! t0_kref+0x39fc:   	bgu,a	_kref+0x3a04
	.word	0x1b02d00b	! t0_kref+0x3a00:   	sethi	%hi(0xb402c00), %o5
	.word	0xe81e401d	! t0_kref+0x3a04:   	ldd	[%i1 + %i5], %l4
	.word	0x80fa0009	! t0_kref+0x3a08:   	sdivcc	%o0, %o1, %g0
	.word	0xae2c000a	! t0_kref+0x3a0c:   	andn	%l0, %o2, %l7
	.word	0xd228a03e	! t0_kref+0x3a10:   	stb	%o1, [%g2 + 0x3e]
	.word	0x9f700014	! t0_kref+0x3a14:   	popc	%l4, %o7
	.word	0x81de000f	! t0_kref+0x3a18:   	flush	%i0 + %o7
	.word	0x96736143	! t0_kref+0x3a1c:   	udiv	%o5, 0x143, %o3
	.word	0x3f480006	! t0_kref+0x3a20:   	fbo,a,pt	%fcc0, _kref+0x3a38
	.word	0xe830a00c	! t0_kref+0x3a24:   	sth	%l4, [%g2 + 0xc]
	.word	0xc0901018	! t0_kref+0x3a28:   	lduha	[%g0 + %i0]0x80, %g0
	.word	0x93a01a2c	! t0_kref+0x3a2c:   	fstoi	%f12, %f9
	.word	0xf430a032	! t0_kref+0x3a30:   	sth	%i2, [%g2 + 0x32]
	.word	0x9a2a3b99	! t0_kref+0x3a34:   	andn	%o0, -0x467, %o5
	.word	0x24480002	! t0_kref+0x3a38:   	ble,a,pt	%icc, _kref+0x3a40
	.word	0x8da00530	! t0_kref+0x3a3c:   	fsqrts	%f16, %f6
	.word	0x85b60914	! t0_kref+0x3a40:   	faligndata	%f24, %f20, %f2
	.word	0xc5060000	! t0_kref+0x3a44:   	ld	[%i0], %f2
	.word	0x97b20055	! t0_kref+0x3a48:   	edge8l	%o0, %l5, %o3
	.word	0x2f480005	! t0_kref+0x3a4c:   	fbu,a,pt	%fcc0, _kref+0x3a60
	.word	0xb9b64ae8	! t0_kref+0x3a50:   	fpsub32s	%f25, %f8, %f28
	.word	0xe0786e86	! t0_kref+0x3a54:   	swap	[%g1 + 0xe86], %l0
	.word	0x9832c011	! t0_kref+0x3a58:   	orn	%o3, %l1, %o4
	.word	0x8da0191c	! t0_kref+0x3a5c:   	fitod	%f28, %f6
	.word	0x87a00529	! t0_kref+0x3a60:   	fsqrts	%f9, %f3
	.word	0xd4f81019	! t0_kref+0x3a64:   	swapa	[%g0 + %i1]0x80, %o2
	.word	0xb9a648a9	! t0_kref+0x3a68:   	fsubs	%f25, %f9, %f28
	.word	0x97700017	! t0_kref+0x3a6c:   	popc	%l7, %o3
	.word	0x91a01104	! t0_kref+0x3a70:   	fxtod	%f4, %f8
	.word	0x8ba44928	! t0_kref+0x3a74:   	fmuls	%f17, %f8, %f5
	.word	0x8bb10af3	! t0_kref+0x3a78:   	fpsub32s	%f4, %f19, %f5
	.word	0x91a0104a	! t0_kref+0x3a7c:   	fdtox	%f10, %f8
	.word	0x8d844010	! t0_kref+0x3a80:   	wr	%l1, %l0, %fprs
	.word	0x89a00546	! t0_kref+0x3a84:   	fsqrtd	%f6, %f4
	.word	0x38800002	! t0_kref+0x3a88:   	bgu,a	_kref+0x3a90
	.word	0xa1a08848	! t0_kref+0x3a8c:   	faddd	%f2, %f8, %f16
	.word	0xcb00a018	! t0_kref+0x3a90:   	ld	[%g2 + 0x18], %f5
	.word	0xb9a0052f	! t0_kref+0x3a94:   	fsqrts	%f15, %f28
	.word	0x9262c015	! t0_kref+0x3a98:   	subc	%o3, %l5, %o1
	.word	0x9aa26d10	! t0_kref+0x3a9c:   	subcc	%o1, 0xd10, %o5
	.word	0xd60e6005	! t0_kref+0x3aa0:   	ldub	[%i1 + 5], %o3
	.word	0x91a0055c	! t0_kref+0x3aa4:   	fsqrtd	%f28, %f8
	call	1f
	.empty
	.word	0xd520a038	! t0_kref+0x3aac:   	st	%f10, [%g2 + 0x38]
	.word	0xf51e401d	! t0_kref+0x3ab0:   	ldd	[%i1 + %i5], %f26
	.word	0x93b34280	! t0_kref+0x3ab4:   	array32	%o5, %g0, %o1
1:	.word	0x8db08dc6	! t0_kref+0x3ab8:   	fnand	%f2, %f6, %f6
	.word	0xb7a48925	! t0_kref+0x3abc:   	fmuls	%f18, %f5, %f27
	.word	0xc0360000	! t0_kref+0x3ac0:   	clrh	[%i0]
	.word	0x89b00cca	! t0_kref+0x3ac4:   	fnot2	%f10, %f4
	.word	0x30800007	! t0_kref+0x3ac8:   	ba,a	_kref+0x3ae4
	.word	0x8ba1c9a5	! t0_kref+0x3acc:   	fdivs	%f7, %f5, %f5
	.word	0x94ad31db	! t0_kref+0x3ad0:   	andncc	%l4, -0xe25, %o2
	.word	0x99a01909	! t0_kref+0x3ad4:   	fitod	%f9, %f12
	.word	0x90bd000b	! t0_kref+0x3ad8:   	xnorcc	%l4, %o3, %o0
	.word	0xaebb6fb2	! t0_kref+0x3adc:   	xnorcc	%o5, 0xfb2, %l7
	.word	0x93b20558	! t0_kref+0x3ae0:   	fcmpeq16	%f8, %f24, %o1
	.word	0xd87e6008	! t0_kref+0x3ae4:   	swap	[%i1 + 8], %o4
	.word	0x9f2a2009	! t0_kref+0x3ae8:   	sll	%o0, 0x9, %o7
	.word	0x15111f5c	! t0_kref+0x3aec:   	sethi	%hi(0x447d7000), %o2
	.word	0x98620017	! t0_kref+0x3af0:   	subc	%o0, %l7, %o4
	.word	0x90dd800d	! t0_kref+0x3af4:   	smulcc	%l6, %o5, %o0
	.word	0xe43e7fe8	! t0_kref+0x3af8:   	std	%l2, [%i1 - 0x18]
	.word	0xb5b007aa	! t0_kref+0x3afc:   	fpackfix	%f10, %f26
	.word	0xa5a01930	! t0_kref+0x3b00:   	fstod	%f16, %f18
	.word	0x90b2fe95	! t0_kref+0x3b04:   	orncc	%o3, -0x16b, %o0
	.word	0xde40a030	! t0_kref+0x3b08:   	ldsw	[%g2 + 0x30], %o7
	.word	0xae9ae896	! t0_kref+0x3b0c:   	xorcc	%o3, 0x896, %l7
	.word	0x973b4015	! t0_kref+0x3b10:   	sra	%o5, %l5, %o3
	.word	0x8143e040	! t0_kref+0x3b14:   	membar	0x40
	.word	0x80a34000	! t0_kref+0x3b18:   	cmp	%o5, %g0
	.word	0x21800004	! t0_kref+0x3b1c:   	fbn,a	_kref+0x3b2c
	.word	0x912d400c	! t0_kref+0x3b20:   	sll	%l5, %o4, %o0
	.word	0x27800007	! t0_kref+0x3b24:   	fbul,a	_kref+0x3b40
	.word	0x95b30404	! t0_kref+0x3b28:   	fcmple16	%f12, %f4, %o2
	.word	0xe22e001a	! t0_kref+0x3b2c:   	stb	%l1, [%i0 + %i2]
	.word	0x81d86fcf	! t0_kref+0x3b30:   	flush	%g1 + 0xfcf
	.word	0x3f800003	! t0_kref+0x3b34:   	fbo,a	_kref+0x3b40
	.word	0x81d80013	! t0_kref+0x3b38:   	flush	%g0 + %l3
	.word	0x9ef50014	! t0_kref+0x3b3c:   	udivcc	%l4, %l4, %o7
	.word	0x89a00135	! t0_kref+0x3b40:   	fabss	%f21, %f4
	.word	0x905d8010	! t0_kref+0x3b44:   	smul	%l6, %l0, %o0
	.word	0x2c800007	! t0_kref+0x3b48:   	bneg,a	_kref+0x3b64
	.word	0xa9a01a2b	! t0_kref+0x3b4c:   	fstoi	%f11, %f20
	.word	0x93b30177	! t0_kref+0x3b50:   	edge32ln	%o4, %l7, %o1
	.word	0xae9b3a94	! t0_kref+0x3b54:   	xorcc	%o4, -0x56c, %l7
	.word	0x2f480008	! t0_kref+0x3b58:   	fbu,a,pt	%fcc0, _kref+0x3b78
	.word	0x9e72801a	! t0_kref+0x3b5c:   	udiv	%o2, %i2, %o7
	.word	0xda4e3ff1	! t0_kref+0x3b60:   	ldsb	[%i0 - 0xf], %o5
	.word	0x90c40008	! t0_kref+0x3b64:   	addccc	%l0, %o0, %o0
	.word	0x9a954014	! t0_kref+0x3b68:   	orcc	%l5, %l4, %o5
	.word	0xdad81019	! t0_kref+0x3b6c:   	ldxa	[%g0 + %i1]0x80, %o5
	.word	0xd82e8018	! t0_kref+0x3b70:   	stb	%o4, [%i2 + %i0]
	.word	0x801d62e3	! t0_kref+0x3b74:   	xor	%l5, 0x2e3, %g0
	.word	0xe43e3ff0	! t0_kref+0x3b78:   	std	%l2, [%i0 - 0x10]
	.word	0xb9a00158	! t0_kref+0x3b7c:   	fabsd	%f24, %f28
	.word	0xe1bf1a58	! t0_kref+0x3b80:   	stda	%f16, [%i4 + %i0]0xd2
	.word	0x97a0052d	! t0_kref+0x3b84:   	fsqrts	%f13, %f11
	.word	0x9ec48017	! t0_kref+0x3b88:   	addccc	%l2, %l7, %o7
	.word	0xae1cc013	! t0_kref+0x3b8c:   	xor	%l3, %l3, %l7
	.word	0xd9266018	! t0_kref+0x3b90:   	st	%f12, [%i1 + 0x18]
	.word	0xa5a0190a	! t0_kref+0x3b94:   	fitod	%f10, %f18
	.word	0x95a0104c	! t0_kref+0x3b98:   	fdtox	%f12, %f10
	.word	0x807b0010	! t0_kref+0x3b9c:   	sdiv	%o4, %l0, %g0
	.word	0x3e480008	! t0_kref+0x3ba0:   	bvc,a,pt	%icc, _kref+0x3bc0
	.word	0xecff1019	! t0_kref+0x3ba4:   	swapa	[%i4 + %i1]0x80, %l6
	.word	0xd53e0000	! t0_kref+0x3ba8:   	std	%f10, [%i0]
	.word	0x85b58a1c	! t0_kref+0x3bac:   	fpadd16	%f22, %f28, %f2
	.word	0xb1b38748	! t0_kref+0x3bb0:   	fpack32	%f14, %f8, %f24
	.word	0x2b800007	! t0_kref+0x3bb4:   	fbug,a	_kref+0x3bd0
	.word	0x83b10af6	! t0_kref+0x3bb8:   	fpsub32s	%f4, %f22, %f1
	.word	0x807a4011	! t0_kref+0x3bbc:   	sdiv	%o1, %l1, %g0
	.word	0xe4280019	! t0_kref+0x3bc0:   	stb	%l2, [%g0 + %i1]
	.word	0xaee24013	! t0_kref+0x3bc4:   	subccc	%o1, %l3, %l7
	.word	0x3a480006	! t0_kref+0x3bc8:   	bcc,a,pt	%icc, _kref+0x3be0
	.word	0x9ba01a38	! t0_kref+0x3bcc:   	fstoi	%f24, %f13
	.word	0x9a5d400a	! t0_kref+0x3bd0:   	smul	%l5, %o2, %o5
	.word	0xbba1882a	! t0_kref+0x3bd4:   	fadds	%f6, %f10, %f29
	.word	0x24800001	! t0_kref+0x3bd8:   	ble,a	_kref+0x3bdc
	.word	0xd60e8019	! t0_kref+0x3bdc:   	ldub	[%i2 + %i1], %o3
	.word	0x90bcf09f	! t0_kref+0x3be0:   	xnorcc	%l3, -0xf61, %o0
	.word	0x81580000	! t0_kref+0x3be4:   	flushw
	.word	0x91b184cc	! t0_kref+0x3be8:   	fcmpne32	%f6, %f12, %o0
	.word	0x32480007	! t0_kref+0x3bec:   	bne,a,pt	%icc, _kref+0x3c08
	.word	0xc520a018	! t0_kref+0x3bf0:   	st	%f2, [%g2 + 0x18]
	.word	0x99a01894	! t0_kref+0x3bf4:   	fitos	%f20, %f12
	.word	0x900a000a	! t0_kref+0x3bf8:   	and	%o0, %o2, %o0
	.word	0xf3ee101c	! t0_kref+0x3bfc:   	prefetcha	%i0 + %i4, 25
	.word	0x8fa289aa	! t0_kref+0x3c00:   	fdivs	%f10, %f10, %f7
	.word	0x29800004	! t0_kref+0x3c04:   	fbl,a	_kref+0x3c14
	.word	0xb5a00544	! t0_kref+0x3c08:   	fsqrtd	%f4, %f26
	.word	0xc11fbe90	! t0_kref+0x3c0c:   	ldd	[%fp - 0x170], %f0
	.word	0xf007bfe0	! t0_kref+0x3c10:   	ld	[%fp - 0x20], %i0
	.word	0xae500014	! t0_kref+0x3c14:   	umul	%g0, %l4, %l7
	.word	0x9eba8000	! t0_kref+0x3c18:   	xnorcc	%o2, %g0, %o7
	.word	0x99b20404	! t0_kref+0x3c1c:   	fcmple16	%f8, %f4, %o4
	.word	0xb5a01913	! t0_kref+0x3c20:   	fitod	%f19, %f26
	.word	0x85b2ca21	! t0_kref+0x3c24:   	fpadd16s	%f11, %f1, %f2
	.word	0xa9b586d2	! t0_kref+0x3c28:   	fmul8sux16	%f22, %f18, %f20
	.word	0x80858015	! t0_kref+0x3c2c:   	addcc	%l6, %l5, %g0
	.word	0xb9b08dd2	! t0_kref+0x3c30:   	fnand	%f2, %f18, %f28
	.word	0x947b7dc7	! t0_kref+0x3c34:   	sdiv	%o5, -0x239, %o2
	.word	0x98b46c5d	! t0_kref+0x3c38:   	orncc	%l1, 0xc5d, %o4
	.word	0x27480006	! t0_kref+0x3c3c:   	fbul,a,pt	%fcc0, _kref+0x3c54
	.word	0xa9b08f4a	! t0_kref+0x3c40:   	fornot1	%f2, %f10, %f20
	.word	0xb1abc04c	! t0_kref+0x3c44:   	fmovdo	%fcc0, %f12, %f24
	.word	0x35800003	! t0_kref+0x3c48:   	fbue,a	_kref+0x3c54
	.word	0x80324013	! t0_kref+0x3c4c:   	orn	%o1, %l3, %g0
	.word	0xd91fbf08	! t0_kref+0x3c50:   	ldd	[%fp - 0xf8], %f12
	.word	0xee566008	! t0_kref+0x3c54:   	ldsh	[%i1 + 8], %l7
	.word	0xeb68a045	! t0_kref+0x3c58:   	prefetch	%g2 + 0x45, 21
	.word	0x99b50a9c	! t0_kref+0x3c5c:   	fpsub16	%f20, %f28, %f12
	.word	0x81820000	! t0_kref+0x3c60:   	wr	%o0, %g0, %y
	.word	0x2e800002	! t0_kref+0x3c64:   	bvs,a	_kref+0x3c6c
	.word	0x80d5c00c	! t0_kref+0x3c68:   	umulcc	%l7, %o4, %g0
	.word	0x903a4000	! t0_kref+0x3c6c:   	not	%o1, %o0
	.word	0xe5067fe4	! t0_kref+0x3c70:   	ld	[%i1 - 0x1c], %f18
	.word	0xaf3a800d	! t0_kref+0x3c74:   	sra	%o2, %o5, %l7
	.word	0xb9a0193c	! t0_kref+0x3c78:   	fstod	%f28, %f28
	.word	0x20800003	! t0_kref+0x3c7c:   	bn,a	_kref+0x3c88
	.word	0x9a5461f0	! t0_kref+0x3c80:   	umul	%l1, 0x1f0, %o5
	.word	0x91a01938	! t0_kref+0x3c84:   	fstod	%f24, %f8
	.word	0x35800006	! t0_kref+0x3c88:   	fbue,a	_kref+0x3ca0
	.word	0xae72a424	! t0_kref+0x3c8c:   	udiv	%o2, 0x424, %l7
	.word	0xaf1dc000	! t0_kref+0x3c90:   	tsubcctv	%l7, %g0, %l7
	.word	0x85a2c92e	! t0_kref+0x3c94:   	fmuls	%f11, %f14, %f2
	.word	0x37480001	! t0_kref+0x3c98:   	fbge,a,pt	%fcc0, _kref+0x3c9c
	.word	0xaba00532	! t0_kref+0x3c9c:   	fsqrts	%f18, %f21
	.word	0x3a800006	! t0_kref+0x3ca0:   	bcc,a	_kref+0x3cb8
	.word	0xe1ee501c	! t0_kref+0x3ca4:   	prefetcha	%i1 + %i4, 16
	.word	0x807d4008	! t0_kref+0x3ca8:   	sdiv	%l5, %o0, %g0
	.word	0x927d68e7	! t0_kref+0x3cac:   	sdiv	%l5, 0x8e7, %o1
	.word	0x91a3c83b	! t0_kref+0x3cb0:   	fadds	%f15, %f27, %f8
	.word	0x805eb87d	! t0_kref+0x3cb4:   	smul	%i2, -0x783, %g0
	.word	0xaedac00a	! t0_kref+0x3cb8:   	smulcc	%o3, %o2, %l7
	.word	0x98dc32b7	! t0_kref+0x3cbc:   	smulcc	%l0, -0xd49, %o4
	.word	0x92b40015	! t0_kref+0x3cc0:   	orncc	%l0, %l5, %o1
	.word	0xae344011	! t0_kref+0x3cc4:   	orn	%l1, %l1, %l7
	.word	0x97b2414d	! t0_kref+0x3cc8:   	edge32l	%o1, %o5, %o3
	.word	0xe230a012	! t0_kref+0x3ccc:   	sth	%l1, [%g2 + 0x12]
	.word	0x90c2000d	! t0_kref+0x3cd0:   	addccc	%o0, %o5, %o0
	.word	0x97b68d3d	! t0_kref+0x3cd4:   	fandnot1s	%f26, %f29, %f11
	.word	0x9b63e4ad	! t0_kref+0x3cd8:   	movo	%fcc0, -0x353, %o5
	.word	0xc0080018	! t0_kref+0x3cdc:   	ldub	[%g0 + %i0], %g0
	.word	0xbbb00762	! t0_kref+0x3ce0:   	fpack16	%f2, %f29
	.word	0x81daa155	! t0_kref+0x3ce4:   	flush	%o2 + 0x155
	.word	0x30800003	! t0_kref+0x3ce8:   	ba,a	_kref+0x3cf4
	.word	0x89b10a78	! t0_kref+0x3cec:   	fpadd32s	%f4, %f24, %f4
	.word	0xb9a38925	! t0_kref+0x3cf0:   	fmuls	%f14, %f5, %f28
	.word	0x80b54015	! t0_kref+0x3cf4:   	orncc	%l5, %l5, %g0
	.word	0xd42e2008	! t0_kref+0x3cf8:   	stb	%o2, [%i0 + 8]
	.word	0x3d800004	! t0_kref+0x3cfc:   	fbule,a	_kref+0x3d0c
	.word	0x81b01022	! t0_kref+0x3d00:   	siam	0x2
	.word	0x8185c000	! t0_kref+0x3d04:   	wr	%l7, %g0, %y
	.word	0x3a480004	! t0_kref+0x3d08:   	bcc,a,pt	%icc, _kref+0x3d18
	.word	0x90b40013	! t0_kref+0x3d0c:   	orncc	%l0, %l3, %o0
	.word	0x9a7d736b	! t0_kref+0x3d10:   	sdiv	%l5, -0xc95, %o5
	.word	0xa3a01a2d	! t0_kref+0x3d14:   	fstoi	%f13, %f17
	.word	0xa9b58e58	! t0_kref+0x3d18:   	fxnor	%f22, %f24, %f20
	.word	0x9275400d	! t0_kref+0x3d1c:   	udiv	%l5, %o5, %o1
	.word	0x81ad8aca	! t0_kref+0x3d20:   	fcmped	%fcc0, %f22, %f10
	.word	0x96fb0014	! t0_kref+0x3d24:   	sdivcc	%o4, %l4, %o3
	.word	0x3a480006	! t0_kref+0x3d28:   	bcc,a,pt	%icc, _kref+0x3d40
	.word	0x1310069b	! t0_kref+0x3d2c:   	sethi	%hi(0x401a6c00), %o1
	.word	0xc19e7fff	! t0_kref+0x3d30:   	ldda	[%i1 - 1]%asi, %f0
	.word	0x89b00c20	! t0_kref+0x3d34:   	fzeros	%f4
	.word	0x93700012	! t0_kref+0x3d38:   	popc	%l2, %o1
	.word	0x81dfe06b	! t0_kref+0x3d3c:   	flush	%i7 + 0x6b
	.word	0x95b5862c	! t0_kref+0x3d40:   	fmul8x16	%f22, %f12, %f10
	.word	0xef20a034	! t0_kref+0x3d44:   	st	%f23, [%g2 + 0x34]
	.word	0x95b00cd0	! t0_kref+0x3d48:   	fnot2	%f16, %f10
	.word	0x01077355	! t0_kref+0x3d4c:   	sethi	%hi(0x1dcd5400), %g0
	.word	0x9484706f	! t0_kref+0x3d50:   	addcc	%l1, -0xf91, %o2
	.word	0xd028a036	! t0_kref+0x3d54:   	stb	%o0, [%g2 + 0x36]
	.word	0x92044015	! t0_kref+0x3d58:   	add	%l1, %l5, %o1
	.word	0x34800004	! t0_kref+0x3d5c:   	bg,a	_kref+0x3d6c
	.word	0x91a00548	! t0_kref+0x3d60:   	fsqrtd	%f8, %f8
	.word	0x26800007	! t0_kref+0x3d64:   	bl,a	_kref+0x3d80
	.word	0x80d2ede8	! t0_kref+0x3d68:   	umulcc	%o3, 0xde8, %g0
	.word	0xa5a00036	! t0_kref+0x3d6c:   	fmovs	%f22, %f18
	.word	0x96dc6d55	! t0_kref+0x3d70:   	smulcc	%l1, 0xd55, %o3
	.word	0x3c800001	! t0_kref+0x3d74:   	bpos,a	_kref+0x3d78
	.word	0xa3a6082d	! t0_kref+0x3d78:   	fadds	%f24, %f13, %f17
	.word	0xc368a005	! t0_kref+0x3d7c:   	prefetch	%g2 + 5, 1
	.word	0x96527d44	! t0_kref+0x3d80:   	umul	%o1, -0x2bc, %o3
	.word	0x81dec01e	! t0_kref+0x3d84:   	flush	%i3 + %fp
	.word	0x9340c000	! t0_kref+0x3d88:   	mov	%asi, %o1
	.word	0x30480006	! t0_kref+0x3d8c:   	ba,a,pt	%icc, _kref+0x3da4
	.word	0x92db4013	! t0_kref+0x3d90:   	smulcc	%o5, %l3, %o1
	.word	0xe27e4000	! t0_kref+0x3d94:   	swap	[%i1], %l1
	.word	0x9fa01a39	! t0_kref+0x3d98:   	fstoi	%f25, %f15
	.word	0x99a5c9b8	! t0_kref+0x3d9c:   	fdivs	%f23, %f24, %f12
	.word	0xafa00523	! t0_kref+0x3da0:   	fsqrts	%f3, %f23
	.word	0x9014000b	! t0_kref+0x3da4:   	or	%l0, %o3, %o0
	.word	0x9a3a4009	! t0_kref+0x3da8:   	xnor	%o1, %o1, %o5
	.word	0x92824013	! t0_kref+0x3dac:   	addcc	%o1, %l3, %o1
	.word	0x98fb39ef	! t0_kref+0x3db0:   	sdivcc	%o4, -0x611, %o4
	.word	0x22480003	! t0_kref+0x3db4:   	be,a,pt	%icc, _kref+0x3dc0
	.word	0xde500019	! t0_kref+0x3db8:   	ldsh	[%g0 + %i1], %o7
	.word	0xb1a209c0	! t0_kref+0x3dbc:   	fdivd	%f8, %f0, %f24
	.word	0x85a01888	! t0_kref+0x3dc0:   	fitos	%f8, %f2
	.word	0xb7a54936	! t0_kref+0x3dc4:   	fmuls	%f21, %f22, %f27
	.word	0x23480006	! t0_kref+0x3dc8:   	fbne,a,pt	%fcc0, _kref+0x3de0
	.word	0xc1bf5a58	! t0_kref+0x3dcc:   	stda	%f0, [%i5 + %i0]0xd2
	.word	0x905b4000	! t0_kref+0x3dd0:   	smul	%o5, %g0, %o0
	.word	0xed20a01c	! t0_kref+0x3dd4:   	st	%f22, [%g2 + 0x1c]
	.word	0xada4482a	! t0_kref+0x3dd8:   	fadds	%f17, %f10, %f22
	.word	0x99b2c154	! t0_kref+0x3ddc:   	edge32l	%o3, %l4, %o4
	.word	0x96fcc00d	! t0_kref+0x3de0:   	sdivcc	%l3, %o5, %o3
	.word	0xda4e401a	! t0_kref+0x3de4:   	ldsb	[%i1 + %i2], %o5
	.word	0xd27e7ff4	! t0_kref+0x3de8:   	swap	[%i1 - 0xc], %o1
	.word	0x35800006	! t0_kref+0x3dec:   	fbue,a	_kref+0x3e04
	.word	0x95a20936	! t0_kref+0x3df0:   	fmuls	%f8, %f22, %f10
	.word	0x9ebe8010	! t0_kref+0x3df4:   	xnorcc	%i2, %l0, %o7
	.word	0x3b480002	! t0_kref+0x3df8:   	fble,a,pt	%fcc0, _kref+0x3e00
	.word	0xd450a036	! t0_kref+0x3dfc:   	ldsh	[%g2 + 0x36], %o2
	.word	0xe53f4018	! t0_kref+0x3e00:   	std	%f18, [%i5 + %i0]
	.word	0x9da209b5	! t0_kref+0x3e04:   	fdivs	%f8, %f21, %f14
	.word	0xd44e3fe1	! t0_kref+0x3e08:   	ldsb	[%i0 - 0x1f], %o2
	.word	0xae2db4dc	! t0_kref+0x3e0c:   	andn	%l6, -0xb24, %l7
	.word	0x98fc8009	! t0_kref+0x3e10:   	sdivcc	%l2, %o1, %o4
	.word	0x933c800d	! t0_kref+0x3e14:   	sra	%l2, %o5, %o1
	.word	0x2f800007	! t0_kref+0x3e18:   	fbu,a	_kref+0x3e34
	.word	0x9db68a58	! t0_kref+0x3e1c:   	fpadd32	%f26, %f24, %f14
	.word	0x3b800004	! t0_kref+0x3e20:   	fble,a	_kref+0x3e30
	.word	0xc04e7ff8	! t0_kref+0x3e24:   	ldsb	[%i1 - 8], %g0
	.word	0x8db64d33	! t0_kref+0x3e28:   	fandnot1s	%f25, %f19, %f6
	.word	0xde08a003	! t0_kref+0x3e2c:   	ldub	[%g2 + 3], %o7
	.word	0x9054000b	! t0_kref+0x3e30:   	umul	%l0, %o3, %o0
	.word	0xc168a04f	! t0_kref+0x3e34:   	prefetch	%g2 + 0x4f, 0
	.word	0x9613001a	! t0_kref+0x3e38:   	or	%o4, %i2, %o3
	.word	0xec1e2010	! t0_kref+0x3e3c:   	ldd	[%i0 + 0x10], %l6
	.word	0xe51fbfc8	! t0_kref+0x3e40:   	ldd	[%fp - 0x38], %f18
	.word	0x81ad8ac4	! t0_kref+0x3e44:   	fcmped	%fcc0, %f22, %f4
	.word	0x9862c010	! t0_kref+0x3e48:   	subc	%o3, %l0, %o4
	.word	0x9882800d	! t0_kref+0x3e4c:   	addcc	%o2, %o5, %o4
	.word	0xd4d81018	! t0_kref+0x3e50:   	ldxa	[%g0 + %i0]0x80, %o2
	.word	0x22480004	! t0_kref+0x3e54:   	be,a,pt	%icc, _kref+0x3e64
	.word	0xf007bfe0	! t0_kref+0x3e58:   	ld	[%fp - 0x20], %i0
	.word	0xa9a00546	! t0_kref+0x3e5c:   	fsqrtd	%f6, %f20
	.word	0xd4801019	! t0_kref+0x3e60:   	lda	[%g0 + %i1]0x80, %o2
	.word	0x8fa01a5a	! t0_kref+0x3e64:   	fdtoi	%f26, %f7
	.word	0x982dbb83	! t0_kref+0x3e68:   	andn	%l6, -0x47d, %o4
	.word	0x8185c000	! t0_kref+0x3e6c:   	wr	%l7, %g0, %y
	.word	0x3a480007	! t0_kref+0x3e70:   	bcc,a,pt	%icc, _kref+0x3e8c
	.word	0x9b254013	! t0_kref+0x3e74:   	mulscc	%l5, %l3, %o5
	.word	0xa5a0003c	! t0_kref+0x3e78:   	fmovs	%f28, %f18
	.word	0x99254011	! t0_kref+0x3e7c:   	mulscc	%l5, %l1, %o4
	.word	0x01000000	! t0_kref+0x3e80:   	nop
	.word	0x01000000	! t0_kref+0x3e84:   	nop
	.word	0x01000000	! t0_kref+0x3e88:   	nop
	call	SYM(_kaos_done)
	.word	0x01000000	! t0_kref+0x3e90:   	nop
	KGLOBAL(t0_ktbl_end)
t0_ktbl_end:
t0_ktbl_page_end:

KTEXT_MODULE(t0_module_subr0, 0x7909a000)
.seg "text"
t0_subr0_page_begin:
	.skip 8192
.global _t0_subr0; ENTRY(t0_subr0)
	.word	0xa6844012	! t0_subr0+0x0:   	addcc	%l1, %l2, %l3
	.word	0x81c3e008	! t0_subr0+0x4:   	retl
	.word	0xaa64c014	! t0_subr0+0x8:   	subc	%l3, %l4, %l5
t0_subr0_page_end:

KTEXT_MODULE(t0_module_subr1, 0x66aee000)
.seg "text"
t0_subr1_page_begin:
	.skip 8188
.global _t0_subr1; ENTRY(t0_subr1)
	.word	0x9de3bfa0	! t0_subr1+0x0:   	save	%sp, -0x60, %sp
	.word	0xb29eaa5a	! t0_subr1+0x4:   	xorcc	%i2, 0xa5a, %i1
	.word	0x81c7e008	! t0_subr1+0x8:   	ret
	.word	0xa7ee6001	! t0_subr1+0xc:   	restore	%i1, 1, %l3
t0_subr1_page_end:

KTEXT_MODULE(t0_module_subr2, 0x3f6ea000)
.seg "text"
t0_subr2_page_begin:
	.skip 8180
.global _t0_subr2; ENTRY(t0_subr2)
	.word	0x9de3bfa0	! t0_subr2+0x0:   	save	%sp, -0x60, %sp
	.word	0xb2066001	! t0_subr2+0x4:   	add	%i1, 1, %i1
	.word	0x81c7e008	! t0_subr2+0x8:   	ret
	.word	0xa3ee6001	! t0_subr2+0xc:   	restore	%i1, 1, %l1
t0_subr2_page_end:

KTEXT_MODULE(t0_module_subr3, 0x66a78000)
.seg "text"
t0_subr3_page_begin:
	.skip 8132
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
!  Total operations: 3978  
!
!  Operation frequencies
!
!  name               exp    obs
!  ldsb              1.37   1.43
!  ldub              1.32   1.66
!  ldsh              1.03   1.03
!  lduh              0.08   0.08
!  ld                0.38   0.35
!  ldd               0.90   1.06
!  swap              0.85   0.96
!  ldstub            0.51   0.68
!  stb               1.20   1.23
!  sth               0.26   0.20
!  st                0.77   1.01
!  std               1.06   1.08
!  add               0.24   0.18
!  addcc             1.22   1.33
!  addx              0.13   0.18
!  addxcc            0.43   0.63
!  taddcc            0.16   0.15
!  taddcctv          0.18   0.20
!  sub               0.13   0.03
!  subcc             0.80   0.83
!  subx              1.06   1.21
!  subxcc            0.27   0.35
!  tsubcc            0.01   0.00
!  tsubcctv          0.23   0.33
!  mulscc            1.20   1.43
!  and               0.74   0.65
!  andcc             0.48   0.63
!  andn              0.60   0.68
!  andncc            0.44   0.53
!  or                0.44   0.70
!  orcc              0.21   0.28
!  orn               0.93   1.21
!  orncc             1.35   1.38
!  xor               0.52   0.65
!  xorcc             1.19   1.41
!  xnor              0.56   0.78
!  xnorcc            1.00   1.21
!  sll               1.11   1.21
!  srl               0.23   0.23
!  sra               0.63   0.58
!  unimp             0.07   0.03
!  umul              0.69   0.83
!  smul              0.98   1.18
!  udiv              0.28   0.38
!  sdiv              1.10   1.36
!  umulcc            0.53   0.58
!  smulcc            1.32   1.43
!  udivcc            0.12   0.10
!  sdivcc            0.99   0.98
!  rdy               0.23   0.30
!  wry               0.84   1.26
!  bicc              3.70   3.07
!  sethi             1.09   1.23
!  jmpl              0.71   0.48
!  call              0.50   0.50
!  ticc              0.00   0.00
!  flush             0.91   0.98
!  save              0.41   0.25
!  restore           1.13   0.00
!  stbar             0.07   0.08
!  ldf               0.69   0.78
!  lddf              0.23   0.38
!  stf               0.55   0.45
!  stdf              0.42   0.38
!  fadds             0.88   0.85
!  fsubs             0.40   0.43
!  fmuls             1.23   1.23
!  fdivs             0.92   0.85
!  faddd             0.73   0.58
!  fsubd             0.17   0.15
!  fmuld             0.16   0.20
!  fdivd             1.12   1.13
!  faddq             0.00   0.00
!  fsubq             0.00   0.00
!  fmulq             0.00   0.00
!  fdivq             0.00   0.00
!  fsmuld            0.19   0.10
!  fdmulq            0.00   0.00
!  fitos             0.12   0.05
!  fitod             1.31   1.36
!  fitoq             0.00   0.00
!  fstoi             0.91   1.03
!  fstod             1.09   1.16
!  fstoq             0.00   0.00
!  fdtoi             0.81   0.85
!  fdtos             0.22   0.35
!  fdtoq             0.00   0.00
!  fqtoi             0.00   0.00
!  fqtos             0.00   0.00
!  fqtod             0.00   0.00
!  fmovs             0.12   0.15
!  fnegs             0.84   0.73
!  fabss             1.10   1.03
!  fsqrts            1.16   1.56
!  fsqrtd            1.55   1.48
!  fsqrtq            0.00   0.00
!  fcmps             0.25   0.23
!  fcmpd             0.64   0.60
!  fcmpq             0.00   0.00
!  fcmpes            0.18   0.13
!  fcmped            1.27   0.80
!  fcmpeq            0.00   0.00
!  fbfcc             3.65   3.09
!  ldfsr             0.23   0.00
!  stfsr             0.09   0.03
!  loop              0.21   0.05
!  offset            0.02   0.00
!  area              0.19   0.43
!  target            0.17   0.08
!  goto              0.27   0.15
!  sigsegv           0.09   0.10
!  sigbus            0.19   0.23
!  imodify           0.00   0.00
!  ldfsr_offset      0.15   0.00
!  fpattern          1.31   1.61
!  lbranch           0.13   0.08
!  shmld             0.80   1.08
!  shmst             1.56   1.84
!  shmpf             1.00   1.03
!  shmswap           0.16   0.25
!  shmblkld          1.04   0.00
!  shmblkst          0.51   0.00
!  shmblkchk         0.28   0.18
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
!  casa              0.24   0.30
!  rdasi             0.12   0.10
!  wrasi             0.08   0.10
!  bpcc              3.33   3.14
!  fbpfcc            3.65   3.19
!  fmovscc           0.01   0.00
!  fmovdcc           0.27   0.18
!  fmovqcc           0.00   0.00
!  movcc             0.10   0.15
!  flushw            0.22   0.23
!  membar            0.19   0.13
!  prefetch          0.83   1.01
!  rdpc              0.09   0.20
!  ldqf              0.00   0.00
!  stqf              0.00   0.00
!  ldfa              0.12   0.05
!  lddfa             0.28   0.23
!  ldqfa             0.00   0.00
!  ldsba             0.24   0.18
!  ldsha             0.21   0.23
!  lduba             0.06   0.03
!  lduha             0.20   0.20
!  lda               0.27   0.35
!  ldda              0.06   0.10
!  ldstuba           0.25   0.30
!  prefetcha         0.44   0.45
!  stfa              0.00   0.00
!  stdfa             0.05   0.05
!  stqfa             0.00   0.00
!  stba              0.18   0.23
!  stha              0.23   0.20
!  sta               0.06   0.05
!  stda              0.09   0.08
!  swapa             0.22   0.20
!  fmovd             0.07   0.03
!  fnegd             0.16   0.05
!  fabsd             0.25   0.28
!  fstox             0.09   0.13
!  fdtox             0.19   0.23
!  fxtos             0.08   0.13
!  fxtod             0.22   0.15
!  lds               0.01   0.03
!  ldsa              0.01   0.00
!  ldx               0.10   0.05
!  ldxa              0.22   0.15
!  nofault           0.04   0.05
!  rdgsr             0.05   0.00
!  wrgsr             0.00   0.00
!  fpadd16           0.14   0.15
!  fpadd16s          0.05   0.15
!  fpadd32           0.16   0.15
!  fpadd32s          0.23   0.18
!  fpsub16           0.12   0.10
!  fpsub16s          0.18   0.13
!  fpsub32           0.05   0.03
!  fpsub32s          0.24   0.38
!  fpack16           0.14   0.15
!  fpack32           0.22   0.33
!  fpackfix          0.23   0.38
!  fexpand           0.00   0.00
!  fpmerge           0.02   0.03
!  fmul8x16          0.28   0.43
!  fmul8x16au        0.01   0.00
!  fmul8x16al        0.26   0.23
!  fmul8sux16        0.23   0.13
!  fmul8ulx16        0.22   0.28
!  fmuld8sux16       0.17   0.15
!  fmuld8ulx16       0.00   0.00
!  alignaddr         0.27   0.13
!  alignaddrl        0.21   0.23
!  faligndata        0.23   0.18
!  fzero             0.00   0.00
!  fzeros            0.17   0.23
!  fone              0.21   0.18
!  fones             0.10   0.10
!  fsrc1             0.19   0.15
!  fsrc1s            0.09   0.08
!  fsrc2             0.04   0.00
!  fsrc2s            0.08   0.08
!  fnot1             0.00   0.00
!  fnot1s            0.05   0.05
!  fnot2             0.12   0.18
!  fnot2s            0.17   0.15
!  for               0.26   0.33
!  fors              0.01   0.00
!  fnor              0.21   0.23
!  fnors             0.01   0.03
!  fand              0.10   0.20
!  fands             0.15   0.18
!  fnand             0.17   0.13
!  fnands            0.21   0.10
!  fxor              0.06   0.05
!  fxors             0.19   0.28
!  fxnor             0.21   0.20
!  fxnors            0.06   0.03
!  fornot1           0.22   0.13
!  fornot1s          0.02   0.05
!  fornot2           0.04   0.08
!  fornot2s          0.01   0.00
!  fandnot1          0.15   0.18
!  fandnot1s         0.08   0.08
!  fandnot2          0.26   0.28
!  fandnot2s         0.09   0.05
!  fcmpgt16          0.11   0.18
!  fcmpgt32          0.02   0.03
!  fcmple16          0.20   0.20
!  fcmple32          0.27   0.33
!  fcmpne16          0.04   0.03
!  fcmpne32          0.27   0.23
!  fcmpeq16          0.22   0.25
!  fcmpeq32          0.00   0.00
!  edge8             0.07   0.03
!  edge8l            0.24   0.28
!  edge16            0.12   0.18
!  edge16l           0.17   0.20
!  edge32            0.13   0.15
!  edge32l           0.24   0.25
!  pdist             0.05   0.00
!  partial_st8       0.25   0.15
!  partial_st16      0.08   0.10
!  partial_st32      0.10   0.10
!  short_st8         0.03   0.08
!  short_st16        0.06   0.13
!  short_ld8         0.07   0.15
!  short_ld16        0.12   0.15
!  blkld             0.18   0.00
!  blkst             0.08   0.00
!  blkld_offset      0.06   0.00
!  blkst_offset      0.08   0.00
!  blk_check         0.06   0.03
!  casxa             0.04   0.03
!  rdccr             0.26   0.20
!  rdfprs            0.15   0.03
!  wrccr             0.06   0.00
!  popc              0.12   0.25
!  wrfprs            0.06   0.08
!  stx               0.16   0.33
!  stxa              0.15   0.10
!  cflush            0.00   0.00
!  array8            0.01   0.00
!  array16           0.13   0.13
!  array32           0.10   0.05
!  edge8n            0.13   0.10
!  edge8ln           0.09   0.03
!  edge16n           0.10   0.13
!  edge16ln          0.21   0.25
!  edge32n           0.08   0.08
!  edge32ln          0.23   0.30
!  bmask             0.24   0.10
!  bshuffle          0.02   0.05
!  siam              0.17   0.13
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
KDATA_MODULE(t0_module_offset_table, 0x1bcce000)
.seg "data"
t0_offset_table_start:
t0_offset_table_size:	.word	0x00000008
t0_offset_table:
	.word	0xfffffff0
	.word	0xfffffff8
	.word	0x00000010
	.word	0xffffffe0
	.word	0x00000008
	.word	0x00000018
	.word	0x00000000
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

KDATA_MODULE(t0_module_data_in_regs, 0x3326e000)
.seg "data"
KGLOBAL(t0_data_in_regs)
t0_data_in_regs_start:
t0_data_in_regs:
	.word	0xb9f77568          ! %f0
	.word	0xed5f3219          ! %f1
	.word	0x18e9f1b2          ! %f2
	.word	0xc6c73a02          ! %f3
	.word	0xcd38e73e          ! %f4
	.word	0x3ee8525a          ! %f5
	.word	0x4fac7a4c          ! %f6
	.word	0x06f0244a          ! %f7
	.word	0xe4d50f58          ! %f8
	.word	0x7a30cdfe          ! %f9
	.word	0x7c590791          ! %f10
	.word	0xd9d61b98          ! %f11
	.word	0x2650224e          ! %f12
	.word	0xc35f4d56          ! %f13
	.word	0x48089c01          ! %f14
	.word	0xa71ada76          ! %f15
	.word	0x7ef2b7b4          ! %f16
	.word	0xfe323f9b          ! %f17
	.word	0x72d6ae16          ! %f18
	.word	0x891db8c8          ! %f19
	.word	0x05e695a0          ! %f20
	.word	0x88cb1a22          ! %f21
	.word	0x5323c961          ! %f22
	.word	0x1e50a01f          ! %f23
	.word	0x86563069          ! %f24
	.word	0x1891d6ce          ! %f25
	.word	0x70fe9df2          ! %f26
	.word	0x00f7714f          ! %f27
	.word	0x6d9de2b1          ! %f28
	.word	0x792d65c5          ! %f29
	.word	0xf60421fd          ! %f30
	.word	0x02ffaf3e          ! %f31
	.word	0x5d0a21a6          ! %f32
	.word	0xa4250665          ! %f33
	.word	0x4beda9b9          ! %f34
	.word	0x182782fe          ! %f35
	.word	0x048e3184          ! %f36
	.word	0xe889bb79          ! %f37
	.word	0x760e198b          ! %f38
	.word	0x5c886d1e          ! %f39
	.word	0xd8931e5d          ! %f40
	.word	0x94464ea7          ! %f41
	.word	0xd26d9664          ! %f42
	.word	0x820b383d          ! %f43
	.word	0xd0b6fd1c          ! %f44
	.word	0x67a7972d          ! %f45
	.word	0x00455866          ! %f46
	.word	0x999000df          ! %f47
	.word	0x1450b8c7          ! %f48
	.word	0xa695f7cc          ! %f49
	.word	0x919383cd          ! %f50
	.word	0x2dee6683          ! %f51
	.word	0x3c0cf003          ! %f52
	.word	0xa5144803          ! %f53
	.word	0xf6992c0c          ! %f54
	.word	0xdc9f39f4          ! %f55
	.word	0x523ca6dd          ! %f56
	.word	0x75279c80          ! %f57
	.word	0x2a92e536          ! %f58
	.word	0x73223cdf          ! %f59
	.word	0xb5b6d0c7          ! %f60
	.word	0xd68ea2d3          ! %f61
	.word	0x231e879f          ! %f62
	.word	0x5e47c6a5          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0x64        ! %g1 (code pointer)
	.word	t0_data_in_shm_area ! %g2 (shared area pointer)
	.word	0x59adfb63          ! %g3 (loop index)
	.word	SYM(t0_subr3)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0x086653d1          ! %o0
	.word	0x733ace8d          ! %o1
	.word	0x6d3534fb          ! %o2
	.word	0x18bd64f3          ! %o3
	.word	0xc622fd2a          ! %o4
	.word	0xf29a253d          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0x71b9f6df          ! %l0
	.word	0x9be68464          ! %l1
	.word	0xd5c709c3          ! %l2
	.word	0x42af6272          ! %l3
	.word	0x004b7e77          ! %l4
	.word	0x804684a7          ! %l5
	.word	0xeb599465          ! %l6
	.word	0x9149ba8e          ! %l7
	.word	t0_data_in_area0    ! %i0 (area pointer)
	.word	t0_data_in_area0    ! %i1 (area pointer)
	.word	0xfffffffb          ! %i2 (byte offset)
	.word	0xffffffe2          ! %i3 (halfword offset)
	.word	0xfffffff0          ! %i4 (word offset)
	.word	0xffffffe8          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0xfff8d249          ! %y
	.word	0x0000000e          ! %icc (nzvc)
	.word	0x80000683          ! %fsr
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

KDATA_MODULE(t0_module_data_in_stack, 0x73f9c000)
.seg "data"
KGLOBAL(t0_data_in_mtbl_size)
KGLOBAL(t0_data_in_mtbl)
KGLOBAL(t0_data_in_stack)
t0_data_in_stack_start:
	.word	0x75bf4543
	.word	0xb3257e17
	.word	0x43c9f45d
	.word	0x0e650dbe
	.word	0xc2699656
	.word	0x43807645
	.word	0x7d7f79df
	.word	0x8013820d
	.word	0xd8492fe3
	.word	0xe9e8a103
	.word	0xf2674ffb
	.word	0x19eb3c58
	.word	0xb60c70de
	.word	0x0add14a2
	.word	0x8e117f3e
	.word	0xae5328af
	.word	0x2a2de7b0
	.word	0x0840c09c
	.word	0x907ffc94
	.word	0x8319b7ea
	.word	0x98b5af17
	.word	0x8853d2a3
	.word	0x5d96aac6
	.word	0x23321cd9
	.word	0xd1b9354a
	.word	0x6435d8f7
	.word	0x72cb7043
	.word	0x36eba8c0
	.word	0xb0edd160
	.word	0xbbb735f7
	.word	0xe99b6522
	.word	0x3addfb01
	.word	0x4504caf1
	.word	0xa995b8fb
	.word	0x62165d67
	.word	0x2a3bf81b
	.word	0x1fcdb7fd
	.word	0x88a97060
	.word	0xbe225384
	.word	0x75eabbd3
	.word	0x8886550c
	.word	0x954408e3
	.word	0x402c7723
	.word	0xbdd8faaf
	.word	0x568d3b97
	.word	0x77564e32
	.word	0xef15e422
	.word	0x38e686ab
	.word	0x9e1f1aa6
	.word	0x3f14a0c0
	.word	0x618645df
	.word	0x0072eb27
	.word	0x591c55ba
	.word	0x000c74d8
	.word	0x94aeeab4
	.word	0x3aa5541e
	.word	0x3d4f2dec
	.word	0x3b2a2ef5
	.word	0x4a2d0bc5
	.word	0x80ef349d
	.word	0xce88d955
	.word	0x004ff150
	.word	0xae624cf8
	.word	0xb26e6071
	.word	0xdf6e2cb0
	.word	0x41132eb9
	.word	0x1886b944
	.word	0x6aea8d22
	.word	0x7632bb3e
	.word	0x714016aa
	.word	0x7027bf2f
	.word	0x92756e20
	.word	0xe50b90e9
	.word	0xd41f2e98
	.word	0xccfbf191
	.word	0x5673e03c
	.word	0xb710eaac
	.word	0xd86aac8c
	.word	0xe62b909d
	.word	0x7e49d859
	.word	0x5bd89131
	.word	0x9da666f2
	.word	0xc9aa1f21
	.word	0x8b4a0962
	.word	0xa488b9bb
	.word	0x35666db1
	.word	0x8b3d880c
	.word	0xb825757e
	.word	0xb6bd9146
	.word	0xc73da07b
	.word	0x59939831
	.word	0x77265e82
	.word	0x0299d5eb
	.word	0x5fced665
	.word	0xe68ed04a
	.word	0xf34549a7
	.word	0x9bfd2289
	.word	0xa8106ab9
	.word	0xcaffd33e
	.word	0xbdde0a7c
	.word	0x8960d0a1
	.word	0xe27b430b
	.word	0x8590f4a6
	.word	0xd4b6091e
	.word	0xc7869482
	.word	0x85dba28a
	.word	0xacfdab8d
	.word	0x996437a5
	.word	0xe63237a5
	.word	0x620b5e97
	.word	0xaf07ed77
	.word	0xef3e6ae1
	.word	0xe1da155a
	.word	0xff42489b
	.word	0x0c39b5a4
	.word	0x36f70a45
	.word	0xbed03da3
	.word	0x8622e115
	.word	0xfca13c95
	.word	0x32514b23
	.word	0x1620625f
	.word	0xf276a7f1
	.word	0x1f9aa3cf
	.word	0x5e016b19
	.word	0x497cf2aa
	.word	0x2dee9e20
	.word	0xa0a219de
	.word	0x17319dcb
	.word	0x24580883
	.word	0x5871cc64
	.word	0xb155ba9c
	.word	0xf47ba1d1
	.word	0xe2eb0cb0
	.word	0x71cce36b
	.word	0x7d7eafb2
	.word	0x52b230f3
	.word	0xa6ba34de
	.word	0x9a33491f
	.word	0xb56d555f
	.word	0xe3d4bf93
	.word	0x694f400b
	.word	0x9533273c
	.word	0x5d6c6778
	.word	0x753b3f6a
	.word	0x43b91528
	.word	0x5ac34f22
	.word	0xeacb7aaf
	.word	0x78aed976
	.word	0x0a1427f9
	.word	0x952b06ec
	.word	0x88414617
	.word	0xadffd333
	.word	0x9039c840
	.word	0x8df113c0
	.word	0x186a80e7
	.word	0x96f81308
	.word	0x9df2bf19
	.word	0x71009568
	.word	0xae32587d
	.word	0xd98cf804
	.word	0x77ebdea7
	.word	0xf9078721
	.word	0x743dc2a6
	.word	0x032a78c9
	.word	0xa57167f0
	.word	0xa3fbf9b3
	.word	0x9e43301c
	.word	0x1f1cbdc8
t0_data_in_sp:
	.word	0x1be06b05
	.word	0xe7f25ac1
	.word	0x05cc634f
	.word	0x90bcaaae
	.word	0x760b8566
	.word	0x88405d62
	.word	0x87786f68
	.word	0xa3570b1d
	.word	t0_data_in_area0
	.word	t0_data_in_area0
	.word	0xffffffe7
	.word	0xffffffee
	.word	0x00000010
	.word	0xffffffe8
	.word	t0_data_in_fp
	.word	0x842a2b1e
	.word	0x941f665a
	.word	0x426a3fd7
	.word	0x58540df0
	.word	0x4b18064f
	.word	0xf76a45c1
	.word	0x1d5382f9
	.word	0x97222ec1
	.word	0xf4c69d26
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
	.word   	0x86bcbef0	! [%fp - 0xc]
	.word   	0xd6a5a77b	! [%fp - 0x8]
	.word   	0x280e48fd	! [%fp - 0x4]
.global t0_data_in_fp; t0_data_in_fp:
	.word	0x8407a259
	.word	0x2b4082a4
	.word	0x8d5da90c
	.word	0x28e2beeb
	.word	0xc13e9bca
	.word	0xa07439ab
	.word	0x4bffbbc5
	.word	0xc10c5400
	.word	0xe8b163d8
	.word	0x12140da5
	.word	0x3c299f9d
	.word	0x14d1ed3d
	.word	0x644eebf1
	.word	0x80fb7a0f
	.word	0xa4323722
	.word	0xa99d73d5
	.word	0x2187146b
	.word	0x0b64a97d
	.word	0x8a9f5566
	.word	0x4b1dbe12
	.word	0x0227ad94
	.word	0xe069e326
	.word	0x1a55f736
	.word	0xdb23a278
t0_data_in_stacktop:
	.word	0
t0_data_in_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_in_area0, 0x53032000)
.seg "data"
t0_data_in_area0_start:
.skip 5888
t0_data_in_area0_begin:
	.word	0xd9dff607	! t0_data_in_area0-0x20
	.word	0xa1f1cca5	! t0_data_in_area0-0x1c
	.word	0x2ff85b92	! t0_data_in_area0-0x18
	.word	0x2f9a992a	! t0_data_in_area0-0x14
	.word	0xd24d2a40	! t0_data_in_area0-0x10
	.word	0xfb7783fe	! t0_data_in_area0-0xc
	.word	0xc828af58	! t0_data_in_area0-0x8
	.word	0x4d1f8f8c	! t0_data_in_area0-0x4
.global t0_data_in_area0; t0_data_in_area0:
	.word	0x3287f973	! t0_data_in_area0+0x0
	.word	0x3babd5de	! t0_data_in_area0+0x4
	.word	0x3e9e4041	! t0_data_in_area0+0x8
	.word	0xdfbed229	! t0_data_in_area0+0xc
	.word	0xbe53f398	! t0_data_in_area0+0x10
	.word	0x4afd1426	! t0_data_in_area0+0x14
	.word	0x8a666b11	! t0_data_in_area0+0x18
	.word	0xe88c30d7	! t0_data_in_area0+0x1c
t0_data_in_area0_end:
.skip 2240
t0_data_in_area0_stop:

KDATA_MODULE(t0_module_data_in_shm_area, 0x55d84000)
.seg "data"
t0_data_in_shm_area_start:
t0_data_in_shm_area_begin:
.global t0_data_in_shm_area; t0_data_in_shm_area:
	.word	0xd98f44ca	! t0_data_in_shm_area+0x0 (t0)
	.word	0xade750aa	! t0_data_in_shm_area+0x4 (t0)
	.word	0x7389b90a	! t0_data_in_shm_area+0x8 (t0)
	.word	0xac56c119	! t0_data_in_shm_area+0xc (t0)
	.word	0x979251d1	! t0_data_in_shm_area+0x10 (t0)
	.word	0xa7c70035	! t0_data_in_shm_area+0x14 (t0)
	.word	0x64e0e0a1	! t0_data_in_shm_area+0x18 (t0)
	.word	0x27ebe2c3	! t0_data_in_shm_area+0x1c (t0)
	.word	0xf11409fd	! t0_data_in_shm_area+0x20 (t0)
	.word	0x960449d0	! t0_data_in_shm_area+0x24 (t0)
	.word	0x316c9d74	! t0_data_in_shm_area+0x28 (t0)
	.word	0xaf736ae4	! t0_data_in_shm_area+0x2c (t0)
	.word	0xaf210235	! t0_data_in_shm_area+0x30 (t0)
	.word	0x4c0d8643	! t0_data_in_shm_area+0x34 (t0)
	.word	0x523e937a	! t0_data_in_shm_area+0x38 (t0)
	.word	0x12a918df	! t0_data_in_shm_area+0x3c (t0)
	.word	0xac00ad4f	! t0_data_in_shm_area+0x40 (t0 bload)
	.word	0x6afbb3dc	! t0_data_in_shm_area+0x44
	.word	0xa830b17b	! t0_data_in_shm_area+0x48
	.word	0x3555b9db	! t0_data_in_shm_area+0x4c
	.word	0xecc545a1	! t0_data_in_shm_area+0x50
	.word	0x3c23e26e	! t0_data_in_shm_area+0x54
	.word	0x3e8bc6c3	! t0_data_in_shm_area+0x58
	.word	0xb4ac9e5d	! t0_data_in_shm_area+0x5c
	.word	0xacf83bd7	! t0_data_in_shm_area+0x60
	.word	0x9884db9c	! t0_data_in_shm_area+0x64
	.word	0x70954012	! t0_data_in_shm_area+0x68
	.word	0x05584632	! t0_data_in_shm_area+0x6c
	.word	0xba9e3f06	! t0_data_in_shm_area+0x70
	.word	0x80308b57	! t0_data_in_shm_area+0x74
	.word	0xe7073fd6	! t0_data_in_shm_area+0x78
	.word	0xad4b6691	! t0_data_in_shm_area+0x7c
	.word	0xc0eb3201	! t0_data_in_shm_area+0x80 (t0 bstore)
	.word	0x98c4eca4	! t0_data_in_shm_area+0x84
	.word	0x52f5859b	! t0_data_in_shm_area+0x88
	.word	0x7619ae81	! t0_data_in_shm_area+0x8c
	.word	0x3cafa1eb	! t0_data_in_shm_area+0x90
	.word	0x41007ea2	! t0_data_in_shm_area+0x94
	.word	0x7cd4d8c2	! t0_data_in_shm_area+0x98
	.word	0xf2eded78	! t0_data_in_shm_area+0x9c
	.word	0x840e920d	! t0_data_in_shm_area+0xa0
	.word	0xedba85cb	! t0_data_in_shm_area+0xa4
	.word	0x0781ea70	! t0_data_in_shm_area+0xa8
	.word	0x9e698044	! t0_data_in_shm_area+0xac
	.word	0x54a3b0e9	! t0_data_in_shm_area+0xb0
	.word	0x4a479d7a	! t0_data_in_shm_area+0xb4
	.word	0x337fe2c9	! t0_data_in_shm_area+0xb8
	.word	0x7313282e	! t0_data_in_shm_area+0xbc
t0_data_in_shm_area_end:
t0_data_in_shm_area_stop:

KDATA_MODULE(t0_module_data_exp_regs, 0x29d8c000)
.seg "data"
KGLOBAL(t0_data_exp_regs)
t0_data_exp_regs_start:
t0_data_exp_regs:
	.word	0xb9f77568          ! %f0
	.word	0xed5f3219          ! %f1
	.word	0x18e9f1b2          ! %f2
	.word	0xc6c73a02          ! %f3
	.word	0xcd38e73e          ! %f4
	.word	0x3ee8525a          ! %f5
	.word	0x4fac7a4c          ! %f6
	.word	0x06f0244a          ! %f7
	.word	0xe4d50f58          ! %f8
	.word	0x7a30cdfe          ! %f9
	.word	0x7c590791          ! %f10
	.word	0xd9d61b98          ! %f11
	.word	0x2650224e          ! %f12
	.word	0xc35f4d56          ! %f13
	.word	0x48089c01          ! %f14
	.word	0xa71ada76          ! %f15
	.word	0x7ef2b7b4          ! %f16
	.word	0xfe323f9b          ! %f17
	.word	0x72d6ae16          ! %f18
	.word	0x891db8c8          ! %f19
	.word	0x05e695a0          ! %f20
	.word	0x88cb1a22          ! %f21
	.word	0x5323c961          ! %f22
	.word	0x1e50a01f          ! %f23
	.word	0x86563069          ! %f24
	.word	0x1891d6ce          ! %f25
	.word	0x70fe9df2          ! %f26
	.word	0x00f7714f          ! %f27
	.word	0x6d9de2b1          ! %f28
	.word	0x792d65c5          ! %f29
	.word	0xf60421fd          ! %f30
	.word	0x02ffaf3e          ! %f31
	.word	0x5d0a21a6          ! %f32
	.word	0xa4250665          ! %f33
	.word	0x4beda9b9          ! %f34
	.word	0x182782fe          ! %f35
	.word	0x048e3184          ! %f36
	.word	0xe889bb79          ! %f37
	.word	0x760e198b          ! %f38
	.word	0x5c886d1e          ! %f39
	.word	0xd8931e5d          ! %f40
	.word	0x94464ea7          ! %f41
	.word	0xd26d9664          ! %f42
	.word	0x820b383d          ! %f43
	.word	0xd0b6fd1c          ! %f44
	.word	0x67a7972d          ! %f45
	.word	0x00455866          ! %f46
	.word	0x999000df          ! %f47
	.word	0x1450b8c7          ! %f48
	.word	0xa695f7cc          ! %f49
	.word	0x919383cd          ! %f50
	.word	0x2dee6683          ! %f51
	.word	0x3c0cf003          ! %f52
	.word	0xa5144803          ! %f53
	.word	0xf6992c0c          ! %f54
	.word	0xdc9f39f4          ! %f55
	.word	0x523ca6dd          ! %f56
	.word	0x75279c80          ! %f57
	.word	0x2a92e536          ! %f58
	.word	0x73223cdf          ! %f59
	.word	0xb5b6d0c7          ! %f60
	.word	0xd68ea2d3          ! %f61
	.word	0x231e879f          ! %f62
	.word	0x5e47c6a5          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0x64        ! %g1 (code pointer)
	.word	t0_data_exp_shm_area! %g2 (shared area pointer)
	.word	0x59adfb63          ! %g3 (loop index)
	.word	SYM(t0_subr3)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0x086653d1          ! %o0
	.word	0x733ace8d          ! %o1
	.word	0x6d3534fb          ! %o2
	.word	0x18bd64f3          ! %o3
	.word	0xc622fd2a          ! %o4
	.word	0xf29a253d          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0x71b9f6df          ! %l0
	.word	0x9be68464          ! %l1
	.word	0xd5c709c3          ! %l2
	.word	0x42af6272          ! %l3
	.word	0x004b7e77          ! %l4
	.word	0x804684a7          ! %l5
	.word	0xeb599465          ! %l6
	.word	0x9149ba8e          ! %l7
	.word	t0_data_exp_area0   ! %i0 (area pointer)
	.word	t0_data_exp_area0   ! %i1 (area pointer)
	.word	0xfffffffb          ! %i2 (byte offset)
	.word	0xffffffe2          ! %i3 (halfword offset)
	.word	0xfffffff0          ! %i4 (word offset)
	.word	0xffffffe8          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0xfff8d249          ! %y
	.word	0x0000000e          ! %icc (nzvc)
	.word	0x80000683          ! %fsr
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

KDATA_MODULE(t0_module_data_exp_stack, 0x4a92c000)
.seg "data"
KGLOBAL(t0_data_exp_mtbl_size)
KGLOBAL(t0_data_exp_mtbl)
KGLOBAL(t0_data_exp_stack)
t0_data_exp_stack_start:
	.word	0x75bf4543
	.word	0xb3257e17
	.word	0x43c9f45d
	.word	0x0e650dbe
	.word	0xc2699656
	.word	0x43807645
	.word	0x7d7f79df
	.word	0x8013820d
	.word	0xd8492fe3
	.word	0xe9e8a103
	.word	0xf2674ffb
	.word	0x19eb3c58
	.word	0xb60c70de
	.word	0x0add14a2
	.word	0x8e117f3e
	.word	0xae5328af
	.word	0x2a2de7b0
	.word	0x0840c09c
	.word	0x907ffc94
	.word	0x8319b7ea
	.word	0x98b5af17
	.word	0x8853d2a3
	.word	0x5d96aac6
	.word	0x23321cd9
	.word	0xd1b9354a
	.word	0x6435d8f7
	.word	0x72cb7043
	.word	0x36eba8c0
	.word	0xb0edd160
	.word	0xbbb735f7
	.word	0xe99b6522
	.word	0x3addfb01
	.word	0x4504caf1
	.word	0xa995b8fb
	.word	0x62165d67
	.word	0x2a3bf81b
	.word	0x1fcdb7fd
	.word	0x88a97060
	.word	0xbe225384
	.word	0x75eabbd3
	.word	0x8886550c
	.word	0x954408e3
	.word	0x402c7723
	.word	0xbdd8faaf
	.word	0x568d3b97
	.word	0x77564e32
	.word	0xef15e422
	.word	0x38e686ab
	.word	0x9e1f1aa6
	.word	0x3f14a0c0
	.word	0x618645df
	.word	0x0072eb27
	.word	0x591c55ba
	.word	0x000c74d8
	.word	0x94aeeab4
	.word	0x3aa5541e
	.word	0x3d4f2dec
	.word	0x3b2a2ef5
	.word	0x4a2d0bc5
	.word	0x80ef349d
	.word	0xce88d955
	.word	0x004ff150
	.word	0xae624cf8
	.word	0xb26e6071
	.word	0xdf6e2cb0
	.word	0x41132eb9
	.word	0x1886b944
	.word	0x6aea8d22
	.word	0x7632bb3e
	.word	0x714016aa
	.word	0x7027bf2f
	.word	0x92756e20
	.word	0xe50b90e9
	.word	0xd41f2e98
	.word	0xccfbf191
	.word	0x5673e03c
	.word	0xb710eaac
	.word	0xd86aac8c
	.word	0xe62b909d
	.word	0x7e49d859
	.word	0x5bd89131
	.word	0x9da666f2
	.word	0xc9aa1f21
	.word	0x8b4a0962
	.word	0xa488b9bb
	.word	0x35666db1
	.word	0x8b3d880c
	.word	0xb825757e
	.word	0xb6bd9146
	.word	0xc73da07b
	.word	0x59939831
	.word	0x77265e82
	.word	0x0299d5eb
	.word	0x5fced665
	.word	0xe68ed04a
	.word	0xf34549a7
	.word	0x9bfd2289
	.word	0xa8106ab9
	.word	0xcaffd33e
	.word	0xbdde0a7c
	.word	0x8960d0a1
	.word	0xe27b430b
	.word	0x8590f4a6
	.word	0xd4b6091e
	.word	0xc7869482
	.word	0x85dba28a
	.word	0xacfdab8d
	.word	0x996437a5
	.word	0xe63237a5
	.word	0x620b5e97
	.word	0xaf07ed77
	.word	0xef3e6ae1
	.word	0xe1da155a
	.word	0xff42489b
	.word	0x0c39b5a4
	.word	0x36f70a45
	.word	0xbed03da3
	.word	0x8622e115
	.word	0xfca13c95
	.word	0x32514b23
	.word	0x1620625f
	.word	0xf276a7f1
	.word	0x1f9aa3cf
	.word	0x5e016b19
	.word	0x497cf2aa
	.word	0x2dee9e20
	.word	0xa0a219de
	.word	0x17319dcb
	.word	0x24580883
	.word	0x5871cc64
	.word	0xb155ba9c
	.word	0xf47ba1d1
	.word	0xe2eb0cb0
	.word	0x71cce36b
	.word	0x7d7eafb2
	.word	0x52b230f3
	.word	0xa6ba34de
	.word	0x9a33491f
	.word	0xb56d555f
	.word	0xe3d4bf93
	.word	0x694f400b
	.word	0x9533273c
	.word	0x5d6c6778
	.word	0x753b3f6a
	.word	0x43b91528
	.word	0x5ac34f22
	.word	0xeacb7aaf
	.word	0x78aed976
	.word	0x0a1427f9
	.word	0x952b06ec
	.word	0x88414617
	.word	0xadffd333
	.word	0x9039c840
	.word	0x8df113c0
	.word	0x186a80e7
	.word	0x96f81308
	.word	0x9df2bf19
	.word	0x71009568
	.word	0xae32587d
	.word	0xd98cf804
	.word	0x77ebdea7
	.word	0xf9078721
	.word	0x743dc2a6
	.word	0x032a78c9
	.word	0xa57167f0
	.word	0xa3fbf9b3
	.word	0x9e43301c
	.word	0x1f1cbdc8
t0_data_exp_sp:
	.word	0x1be06b05
	.word	0xe7f25ac1
	.word	0x05cc634f
	.word	0x90bcaaae
	.word	0x760b8566
	.word	0x88405d62
	.word	0x87786f68
	.word	0xa3570b1d
	.word	t0_data_exp_area0
	.word	t0_data_exp_area0
	.word	0xffffffe7
	.word	0xffffffee
	.word	0x00000010
	.word	0xffffffe8
	.word	t0_data_exp_fp
	.word	0x842a2b1e
	.word	0x941f665a
	.word	0x426a3fd7
	.word	0x58540df0
	.word	0x4b18064f
	.word	0xf76a45c1
	.word	0x1d5382f9
	.word	0x97222ec1
	.word	0xf4c69d26
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
	.word   	0x86bcbef0	! [%fp - 0xc]
	.word   	0xd6a5a77b	! [%fp - 0x8]
	.word   	0x280e48fd	! [%fp - 0x4]
t0_data_exp_fp:
	.word	0x8407a259
	.word	0x2b4082a4
	.word	0x8d5da90c
	.word	0x28e2beeb
	.word	0xc13e9bca
	.word	0xa07439ab
	.word	0x4bffbbc5
	.word	0xc10c5400
	.word	0xe8b163d8
	.word	0x12140da5
	.word	0x3c299f9d
	.word	0x14d1ed3d
	.word	0x644eebf1
	.word	0x80fb7a0f
	.word	0xa4323722
	.word	0xa99d73d5
	.word	0x2187146b
	.word	0x0b64a97d
	.word	0x8a9f5566
	.word	0x4b1dbe12
	.word	0x0227ad94
	.word	0xe069e326
	.word	0x1a55f736
	.word	0xdb23a278
t0_data_exp_stacktop:
	.word	0
t0_data_exp_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_exp_area0, 0x13c86000)
.seg "data"
t0_data_exp_area0_start:
.skip 5888
t0_data_exp_area0_begin:
	.word	0xd9dff607	! t0_data_exp_area0-0x20
	.word	0xa1f1cca5	! t0_data_exp_area0-0x1c
	.word	0x2ff85b92	! t0_data_exp_area0-0x18
	.word	0x2f9a992a	! t0_data_exp_area0-0x14
	.word	0xd24d2a40	! t0_data_exp_area0-0x10
	.word	0xfb7783fe	! t0_data_exp_area0-0xc
	.word	0xc828af58	! t0_data_exp_area0-0x8
	.word	0x4d1f8f8c	! t0_data_exp_area0-0x4
.global t0_data_exp_area0; t0_data_exp_area0:
	.word	0x3287f973	! t0_data_exp_area0+0x0
	.word	0x3babd5de	! t0_data_exp_area0+0x4
	.word	0x3e9e4041	! t0_data_exp_area0+0x8
	.word	0xdfbed229	! t0_data_exp_area0+0xc
	.word	0xbe53f398	! t0_data_exp_area0+0x10
	.word	0x4afd1426	! t0_data_exp_area0+0x14
	.word	0x8a666b11	! t0_data_exp_area0+0x18
	.word	0xe88c30d7	! t0_data_exp_area0+0x1c
t0_data_exp_area0_end:
.skip 2240
t0_data_exp_area0_stop:

KDATA_MODULE(t0_module_data_exp_shm_area, 0x7ac20000)
.seg "data"
t0_data_exp_shm_area_start:
t0_data_exp_shm_area_begin:
.global t0_data_exp_shm_area; t0_data_exp_shm_area:
	.word	0xd98f44ca	! t0_data_exp_shm_area+0x0 (t0)
	.word	0xade750aa	! t0_data_exp_shm_area+0x4 (t0)
	.word	0x7389b90a	! t0_data_exp_shm_area+0x8 (t0)
	.word	0xac56c119	! t0_data_exp_shm_area+0xc (t0)
	.word	0x979251d1	! t0_data_exp_shm_area+0x10 (t0)
	.word	0xa7c70035	! t0_data_exp_shm_area+0x14 (t0)
	.word	0x64e0e0a1	! t0_data_exp_shm_area+0x18 (t0)
	.word	0x27ebe2c3	! t0_data_exp_shm_area+0x1c (t0)
	.word	0xf11409fd	! t0_data_exp_shm_area+0x20 (t0)
	.word	0x960449d0	! t0_data_exp_shm_area+0x24 (t0)
	.word	0x316c9d74	! t0_data_exp_shm_area+0x28 (t0)
	.word	0xaf736ae4	! t0_data_exp_shm_area+0x2c (t0)
	.word	0xaf210235	! t0_data_exp_shm_area+0x30 (t0)
	.word	0x4c0d8643	! t0_data_exp_shm_area+0x34 (t0)
	.word	0x523e937a	! t0_data_exp_shm_area+0x38 (t0)
	.word	0x12a918df	! t0_data_exp_shm_area+0x3c (t0)
	.word	0xac00ad4f	! t0_data_exp_shm_area+0x40 (t0 bload)
	.word	0x6afbb3dc	! t0_data_exp_shm_area+0x44
	.word	0xa830b17b	! t0_data_exp_shm_area+0x48
	.word	0x3555b9db	! t0_data_exp_shm_area+0x4c
	.word	0xecc545a1	! t0_data_exp_shm_area+0x50
	.word	0x3c23e26e	! t0_data_exp_shm_area+0x54
	.word	0x3e8bc6c3	! t0_data_exp_shm_area+0x58
	.word	0xb4ac9e5d	! t0_data_exp_shm_area+0x5c
	.word	0xacf83bd7	! t0_data_exp_shm_area+0x60
	.word	0x9884db9c	! t0_data_exp_shm_area+0x64
	.word	0x70954012	! t0_data_exp_shm_area+0x68
	.word	0x05584632	! t0_data_exp_shm_area+0x6c
	.word	0xba9e3f06	! t0_data_exp_shm_area+0x70
	.word	0x80308b57	! t0_data_exp_shm_area+0x74
	.word	0xe7073fd6	! t0_data_exp_shm_area+0x78
	.word	0xad4b6691	! t0_data_exp_shm_area+0x7c
	.word	0xc0eb3201	! t0_data_exp_shm_area+0x80 (t0 bstore)
	.word	0x98c4eca4	! t0_data_exp_shm_area+0x84
	.word	0x52f5859b	! t0_data_exp_shm_area+0x88
	.word	0x7619ae81	! t0_data_exp_shm_area+0x8c
	.word	0x3cafa1eb	! t0_data_exp_shm_area+0x90
	.word	0x41007ea2	! t0_data_exp_shm_area+0x94
	.word	0x7cd4d8c2	! t0_data_exp_shm_area+0x98
	.word	0xf2eded78	! t0_data_exp_shm_area+0x9c
	.word	0x840e920d	! t0_data_exp_shm_area+0xa0
	.word	0xedba85cb	! t0_data_exp_shm_area+0xa4
	.word	0x0781ea70	! t0_data_exp_shm_area+0xa8
	.word	0x9e698044	! t0_data_exp_shm_area+0xac
	.word	0x54a3b0e9	! t0_data_exp_shm_area+0xb0
	.word	0x4a479d7a	! t0_data_exp_shm_area+0xb4
	.word	0x337fe2c9	! t0_data_exp_shm_area+0xb8
	.word	0x7313282e	! t0_data_exp_shm_area+0xbc
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



