/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: v9_kao_02_14_04_101.s
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
#define T0_KAOS_SEED          d33f281e4af9
#define T0_KAOS_ICOUNT        5000
#define T0_KAOS_AREAS         1
#define T0_KAOS_AREASIZE      64
#define T0_KAOS_AREAOFFSET    6656
#define T0_KAOS_PAGESIZE      8192
#define T0_KAOS_CODECOUNT     5002

#define T0_KAOS_BOOT_VA                  0x0a078000
#define T0_KAOS_BOOT_PA                  0x0000000001d72000
#define T0_KAOS_BOOT_CACHEABLE           1
#define T0_KAOS_BOOT_NONCACHEABLE        0

#define T0_KAOS_STARTUP_VA               0x2d286000
#define T0_KAOS_STARTUP_PA               0x000000000257c000
#define T0_KAOS_STARTUP_CACHEABLE        1
#define T0_KAOS_STARTUP_NONCACHEABLE     0

#define T0_KAOS_OFFSET_TBL_VA            0x5b0aa000
#define T0_KAOS_OFFSET_TBL_PA            0x00000000052e4000
#define T0_KAOS_OFFSET_TBL_CACHEABLE     1
#define T0_KAOS_OFFSET_TBL_NONCACHEABLE  0

#define T0_KAOS_DONE_VA                  0x7207a000
#define T0_KAOS_DONE_PA                  0x0000000006f54000
#define T0_KAOS_DONE_CACHEABLE           1
#define T0_KAOS_DONE_NONCACHEABLE        0

#define T0_KAOS_KTBL_VA                  0x420ba000
#define T0_KAOS_KTBL_PA                  0x0000000008b4e000
#define T0_KAOS_KTBL_CACHEABLE           1
#define T0_KAOS_KTBL_NONCACHEABLE        0

#define T0_KAOS_SUBR0_VA                 0x60222000
#define T0_KAOS_SUBR0_PA                 0x000000000b06a000
#define T0_KAOS_SUBR0_CACHEABLE          1
#define T0_KAOS_SUBR0_NONCACHEABLE       0
#define T0_KAOS_SUBR1_VA                 0x3720e000
#define T0_KAOS_SUBR1_PA                 0x000000000dd6a000
#define T0_KAOS_SUBR1_CACHEABLE          1
#define T0_KAOS_SUBR1_NONCACHEABLE       0
#define T0_KAOS_SUBR2_VA                 0x41a36000
#define T0_KAOS_SUBR2_PA                 0x000000000e7e6000
#define T0_KAOS_SUBR2_CACHEABLE          1
#define T0_KAOS_SUBR2_NONCACHEABLE       0
#define T0_KAOS_SUBR3_VA                 0x41f88000
#define T0_KAOS_SUBR3_PA                 0x00000000106c4000
#define T0_KAOS_SUBR3_CACHEABLE          1
#define T0_KAOS_SUBR3_NONCACHEABLE       0

#define T0_KAOS_EXP_REGS_VA              0x7ad34000
#define T0_KAOS_EXP_REGS_PA              0x0000000012baa000
#define T0_KAOS_EXP_REGS_CACHEABLE       1
#define T0_KAOS_EXP_REGS_NONCACHEABLE    0
#define T0_KAOS_RUN_REGS_VA              0x7d93e000
#define T0_KAOS_RUN_REGS_PA              0x0000000015e20000
#define T0_KAOS_RUN_REGS_CACHEABLE       1
#define T0_KAOS_RUN_REGS_NONCACHEABLE    0

#define T0_KAOS_EXP_STACK_VA             0x65044000
#define T0_KAOS_EXP_STACK_PA             0x0000000017052000
#define T0_KAOS_EXP_STACK_CACHEABLE      1
#define T0_KAOS_EXP_STACK_NONCACHEABLE   0
#define T0_KAOS_RUN_STACK_VA             0x43e62000
#define T0_KAOS_RUN_STACK_PA             0x000000001967c000
#define T0_KAOS_RUN_STACK_CACHEABLE      1
#define T0_KAOS_RUN_STACK_NONCACHEABLE   0

#define T0_KAOS_AREA0
#define T0_KAOS_EXP_AREA0_VA             0x26942000
#define T0_KAOS_EXP_AREA0_PA             0x000000001a976000
#define T0_KAOS_EXP_AREA0_CACHEABLE      1
#define T0_KAOS_EXP_AREA0_NONCACHEABLE   0
#define T0_KAOS_RUN_AREA0_VA             0x14d4c000
#define T0_KAOS_RUN_AREA0_PA             0x000000001c7e2000
#define T0_KAOS_RUN_AREA0_CACHEABLE      1
#define T0_KAOS_RUN_AREA0_NONCACHEABLE   0

#define T0_KAOS_SHM_AREA
#define T0_KAOS_EXP_SHM_AREA_VA          0x2cc80000
#define T0_KAOS_EXP_SHM_AREA_PA          0x0000000000496000
#define T0_KAOS_EXP_SHM_AREA_CACHEABLE   1
#define T0_KAOS_EXP_SHM_AREA_NONCACHEABLE 0
#define T0_KAOS_RUN_SHM_AREA_VA          0x76e46000
#define T0_KAOS_RUN_SHM_AREA_PA          0x0000000000b34000
#define T0_KAOS_RUN_SHM_AREA_CACHEABLE   1
#define T0_KAOS_RUN_SHM_AREA_NONCACHEABLE 0

#define T0_KAOS_RANVAL_00     0xdc5a0b53
#define T0_KAOS_RANVAL_01     0x60f25309
#define T0_KAOS_RANVAL_02     0xe8c8340c
#define T0_KAOS_RANVAL_03     0x1a60f41f
#define T0_KAOS_RANVAL_04     0x2dad8517
#define T0_KAOS_RANVAL_05     0x1687be0d
#define T0_KAOS_RANVAL_06     0x41778fca
#define T0_KAOS_RANVAL_07     0x8a8cd5ab
#define T0_KAOS_RANVAL_08     0x30ff759a
#define T0_KAOS_RANVAL_09     0xf0d94914
#define T0_KAOS_RANVAL_0a     0x86c93f09
#define T0_KAOS_RANVAL_0b     0xada9d07d
#define T0_KAOS_RANVAL_0c     0xa80fb157
#define T0_KAOS_RANVAL_0d     0xa93286f7
#define T0_KAOS_RANVAL_0e     0x6d83d4fc
#define T0_KAOS_RANVAL_0f     0x89191873
#define T0_KAOS_RANVAL_10     0xae88023a
#define T0_KAOS_RANVAL_11     0xf459e4b9
#define T0_KAOS_RANVAL_12     0x2031be50
#define T0_KAOS_RANVAL_13     0x98fd033e
#define T0_KAOS_RANVAL_14     0xf3dd4b0a
#define T0_KAOS_RANVAL_15     0xb436f9ec
#define T0_KAOS_RANVAL_16     0xa35b53c4
#define T0_KAOS_RANVAL_17     0x2213e968
#define T0_KAOS_RANVAL_18     0x235aee22
#define T0_KAOS_RANVAL_19     0x48e2fb54
#define T0_KAOS_RANVAL_1a     0x07b701ff
#define T0_KAOS_RANVAL_1b     0x63719398
#define T0_KAOS_RANVAL_1c     0x5af16b67
#define T0_KAOS_RANVAL_1d     0xfd7b33c9
#define T0_KAOS_RANVAL_1e     0x02939a9d
#define T0_KAOS_RANVAL_1f     0x170bb815
#define T0_KAOS_RANVAL_20     0x4d7c6975
#define T0_KAOS_RANVAL_21     0x2027a761
#define T0_KAOS_RANVAL_22     0xbc6e228a
#define T0_KAOS_RANVAL_23     0x0c524c88
#define T0_KAOS_RANVAL_24     0x47c39e1b
#define T0_KAOS_RANVAL_25     0xd74644cd
#define T0_KAOS_RANVAL_26     0xa2e5b193
#define T0_KAOS_RANVAL_27     0x1c54b005
#define T0_KAOS_RANVAL_28     0xbbbd4a09
#define T0_KAOS_RANVAL_29     0x49cd4903
#define T0_KAOS_RANVAL_2a     0x1355373a
#define T0_KAOS_RANVAL_2b     0x3f80f14b
#define T0_KAOS_RANVAL_2c     0x1ad03bc7
#define T0_KAOS_RANVAL_2d     0x2cfdb91d
#define T0_KAOS_RANVAL_2e     0x1f8438c9
#define T0_KAOS_RANVAL_2f     0xaa1ab54b
#define T0_KAOS_RANVAL_30     0xc13e8de9
#define T0_KAOS_RANVAL_31     0x57a91681
#define T0_KAOS_RANVAL_32     0x2b5cdca9
#define T0_KAOS_RANVAL_33     0xca5b81e6
#define T0_KAOS_RANVAL_34     0x11c19480
#define T0_KAOS_RANVAL_35     0x19dbb141
#define T0_KAOS_RANVAL_36     0xf2a6d6f3
#define T0_KAOS_RANVAL_37     0x1a0670fb
#define T0_KAOS_RANVAL_38     0xe3f2add3
#define T0_KAOS_RANVAL_39     0xe8ef3cc3
#define T0_KAOS_RANVAL_3a     0xbdac0b47
#define T0_KAOS_RANVAL_3b     0x79558fa0
#define T0_KAOS_RANVAL_3c     0x49a3ea4f
#define T0_KAOS_RANVAL_3d     0x7a1f8aa4
#define T0_KAOS_RANVAL_3e     0x54a4f7dc
#define T0_KAOS_RANVAL_3f     0x4ac76dae
#define T0_KAOS_RANVAL_40     0xda06bfbb
#define T0_KAOS_RANVAL_41     0xd2f58fd9
#define T0_KAOS_RANVAL_42     0x19183dd8
#define T0_KAOS_RANVAL_43     0x9ab7a183
#define T0_KAOS_RANVAL_44     0x04ae3baf
#define T0_KAOS_RANVAL_45     0xb57b1817
#define T0_KAOS_RANVAL_46     0xa339dae2
#define T0_KAOS_RANVAL_47     0x1b154402
#define T0_KAOS_RANVAL_48     0xfd5d6946
#define T0_KAOS_RANVAL_49     0x506bcb74
#define T0_KAOS_RANVAL_4a     0x3d0be7f4
#define T0_KAOS_RANVAL_4b     0xbf36a8de
#define T0_KAOS_RANVAL_4c     0x2369de12
#define T0_KAOS_RANVAL_4d     0x57be6a4e
#define T0_KAOS_RANVAL_4e     0x8ecbf175
#define T0_KAOS_RANVAL_4f     0xedf9d718
#define T0_KAOS_RANVAL_50     0x1785a250
#define T0_KAOS_RANVAL_51     0xda2b636b
#define T0_KAOS_RANVAL_52     0x15553c86
#define T0_KAOS_RANVAL_53     0xf55585c5
#define T0_KAOS_RANVAL_54     0x3042e85c
#define T0_KAOS_RANVAL_55     0xeb042861
#define T0_KAOS_RANVAL_56     0x6cd18d9b
#define T0_KAOS_RANVAL_57     0x1276a114
#define T0_KAOS_RANVAL_58     0x8bd74767
#define T0_KAOS_RANVAL_59     0xcf00e438
#define T0_KAOS_RANVAL_5a     0xcd97444e
#define T0_KAOS_RANVAL_5b     0xa8c29b8f
#define T0_KAOS_RANVAL_5c     0x73cb6d66
#define T0_KAOS_RANVAL_5d     0xece0784d
#define T0_KAOS_RANVAL_5e     0x17ace06f
#define T0_KAOS_RANVAL_5f     0x58d70fa1
#define T0_KAOS_RANVAL_60     0x309f7c4d
#define T0_KAOS_RANVAL_61     0x9a10e379
#define T0_KAOS_RANVAL_62     0x9057445f
#define T0_KAOS_RANVAL_63     0x83237558
#define T0_KAOS_RANVAL_64     0x473b867c
#define T0_KAOS_RANVAL_65     0xa6547771
#define T0_KAOS_RANVAL_66     0xb599489e
#define T0_KAOS_RANVAL_67     0x5841f06a
#define T0_KAOS_RANVAL_68     0x9b86de79
#define T0_KAOS_RANVAL_69     0x99ba806f
#define T0_KAOS_RANVAL_6a     0xcae074a1
#define T0_KAOS_RANVAL_6b     0x28007a7d
#define T0_KAOS_RANVAL_6c     0x41f82de0
#define T0_KAOS_RANVAL_6d     0x24884312
#define T0_KAOS_RANVAL_6e     0x9983f0e8
#define T0_KAOS_RANVAL_6f     0xe75beda2
#define T0_KAOS_RANVAL_70     0x409b8797
#define T0_KAOS_RANVAL_71     0xa3197482
#define T0_KAOS_RANVAL_72     0x3c780650
#define T0_KAOS_RANVAL_73     0x69c2b322
#define T0_KAOS_RANVAL_74     0xee2ae945
#define T0_KAOS_RANVAL_75     0x8e8d90d7
#define T0_KAOS_RANVAL_76     0x31e9bea5
#define T0_KAOS_RANVAL_77     0x130d1a7d
#define T0_KAOS_RANVAL_78     0x86a8e004
#define T0_KAOS_RANVAL_79     0xa089b3ba
#define T0_KAOS_RANVAL_7a     0xac9b7a7b
#define T0_KAOS_RANVAL_7b     0xa1f59caf
#define T0_KAOS_RANVAL_7c     0x67b44454
#define T0_KAOS_RANVAL_7d     0x9aacd74d
#define T0_KAOS_RANVAL_7e     0xa314903d
#define T0_KAOS_RANVAL_7f     0x6ebb8fb5
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
!    icount         5000
!    targetid       NIAGARA:SIM
!    hostid         NIAGARA:5.8
!    areas          1
!    areasize       64
!    areaoffset     6656
!    ncache         0
!    emulate_ncache 1
!    pagesize       8192
!    invsize        0
!    codecount      5002
!    code           420ba000
!    entry          420ba000
!    fsr_exceptions 00000000
!    fsr_roundmode  00000004
!    fsr_mask       c0000fff
!    seed           d33f281e4af9
!    va_map         0000000000400000,000000007fffffff
!    pa_cached      0000000000400000,000000007fffffff
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

KTEXT_MODULE(t0_module_ktbl, 0x420ba000)
.seg "text"
	KGLOBAL(t0_ktbl)
t0_ktbl_page_begin:
.global t0_kref; t0_kref:
	.skip 0
t0_ktbl:
	.word	0x89a01a44	! t0_kref+0x0:   	fdtoi	%f4, %f4
	.word	0x89a10824	! t0_kref+0x4:   	fadds	%f4, %f4, %f4
	.word	0xc99e101d	! t0_kref+0x8:   	ldda	[%i0 + %i5]0x80, %f4
	.word	0x89a01104	! t0_kref+0xc:   	fxtod	%f4, %f4
	.word	0xdec65000	! t0_kref+0x10:   	ldswa	[%i1]0x80, %o7
	.word	0x2c800005	! t0_kref+0x14:   	bneg,a	_kref+0x28
	.word	0x9a500000	! t0_kref+0x18:   	umul	%g0, %g0, %o5
	.word	0x9130200f	! t0_kref+0x1c:   	srl	%g0, 0xf, %o0
	.word	0x89a108c4	! t0_kref+0x20:   	fsubd	%f4, %f4, %f4
	.word	0x89a10824	! t0_kref+0x24:   	fadds	%f4, %f4, %f4
	.word	0x86102004	! t0_kref+0x28:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x2c:   	bne,a	_kref+0x2c
	.word	0x86a0e001	! t0_kref+0x30:   	subcc	%g3, 1, %g3
	.word	0xee4e7fe4	! t0_kref+0x34:   	ldsb	[%i1 - 0x1c], %l7
	.word	0x38480007	! t0_kref+0x38:   	bgu,a,pt	%icc, _kref+0x54
	.word	0x89a01924	! t0_kref+0x3c:   	fstod	%f4, %f4
	.word	0xe2e81019	! t0_kref+0x40:   	ldstuba	[%g0 + %i1]0x80, %l1
	.word	0x81a90a24	! t0_kref+0x44:   	fcmps	%fcc0, %f4, %f4
	.word	0x98180000	! t0_kref+0x48:   	xor	%g0, %g0, %o4
	.word	0x89b10a24	! t0_kref+0x4c:   	fpadd16s	%f4, %f4, %f4
	.word	0x81800000	! t0_kref+0x50:   	mov	%g0, %y
	.word	0x81a90a24	! t0_kref+0x54:   	fcmps	%fcc0, %f4, %f4
	.word	0x92b00000	! t0_kref+0x58:   	orncc	%g0, %g0, %o1
	.word	0x89a108a4	! t0_kref+0x5c:   	fsubs	%f4, %f4, %f4
	.word	0xd43e0000	! t0_kref+0x60:   	std	%o2, [%i0]
	.word	0x2e800008	! t0_kref+0x64:   	bvs,a	_kref+0x84
	.word	0xaf380000	! t0_kref+0x68:   	sra	%g0, %g0, %l7
	.word	0x89a109c4	! t0_kref+0x6c:   	fdivd	%f4, %f4, %f4
	.word	0x9aa827b7	! t0_kref+0x70:   	andncc	%g0, 0x7b7, %o5
	.word	0xafb00000	! t0_kref+0x74:   	edge8	%g0, %g0, %l7
	.word	0x80800000	! t0_kref+0x78:   	addcc	%g0, %g0, %g0
	.word	0x89b10aa4	! t0_kref+0x7c:   	fpsub16s	%f4, %f4, %f4
	.word	0x8143c000	! t0_kref+0x80:   	stbar
	.word	0xc9bf5a59	! t0_kref+0x84:   	stda	%f4, [%i5 + %i1]0xd2
	.word	0x92000000	! t0_kref+0x88:   	add	%g0, %g0, %o1
	.word	0xee7e7ffc	! t0_kref+0x8c:   	swap	[%i1 - 4], %l7
	.word	0x89a8c024	! t0_kref+0x90:   	fmovsul	%fcc0, %f4, %f4
	.word	0x89a000a4	! t0_kref+0x94:   	fnegs	%f4, %f4
	.word	0xd4060000	! t0_kref+0x98:   	ld	[%i0], %o2
	.word	0xc020a038	! t0_kref+0x9c:   	clr	[%g2 + 0x38]
	call	SYM(t0_subr3)
	.word	0x96a82a34	! t0_kref+0xa4:   	andncc	%g0, 0xa34, %o3
	.word	0x81a90ac4	! t0_kref+0xa8:   	fcmped	%fcc0, %f4, %f4
	.word	0xf5ee501c	! t0_kref+0xac:   	prefetcha	%i1 + %i4, 26
	.word	0xc030a01a	! t0_kref+0xb0:   	clrh	[%g2 + 0x1a]
	.word	0x9e10275d	! t0_kref+0xb4:   	mov	0x75d, %o7
	.word	0xd400a018	! t0_kref+0xb8:   	ld	[%g2 + 0x18], %o2
	.word	0x89a10824	! t0_kref+0xbc:   	fadds	%f4, %f4, %f4
	.word	0xda4e001a	! t0_kref+0xc0:   	ldsb	[%i0 + %i2], %o5
	.word	0x89b10e80	! t0_kref+0xc4:   	fsrc1	%f4, %f4
	.word	0x89b10e64	! t0_kref+0xc8:   	fxnors	%f4, %f4, %f4
	.word	0xd416c019	! t0_kref+0xcc:   	lduh	[%i3 + %i1], %o2
	.word	0x80503350	! t0_kref+0xd0:   	umul	%g0, -0xcb0, %g0
	.word	0xe7ee501b	! t0_kref+0xd4:   	prefetcha	%i1 + %i3, 19
	.word	0x99200000	! t0_kref+0xd8:   	mulscc	%g0, %g0, %o4
	.word	0xda4e6005	! t0_kref+0xdc:   	ldsb	[%i1 + 5], %o5
	.word	0x81a90ac4	! t0_kref+0xe0:   	fcmped	%fcc0, %f4, %f4
	.word	0x89a01904	! t0_kref+0xe4:   	fitod	%f4, %f4
	.word	0x94982351	! t0_kref+0xe8:   	xorcc	%g0, 0x351, %o2
	.word	0x95400000	! t0_kref+0xec:   	mov	%y, %o2
	.word	0x981038a7	! t0_kref+0xf0:   	mov	0xfffff8a7, %o4
	.word	0xd24e001a	! t0_kref+0xf4:   	ldsb	[%i0 + %i2], %o1
	.word	0x93400000	! t0_kref+0xf8:   	mov	%y, %o1
	.word	0xc99e1000	! t0_kref+0xfc:   	ldda	[%i0]0x80, %f4
	.word	0x89a00524	! t0_kref+0x100:   	fsqrts	%f4, %f4
	.word	0x89b00764	! t0_kref+0x104:   	fpack16	%f4, %f4
	.word	0xae88257c	! t0_kref+0x108:   	andcc	%g0, 0x57c, %l7
	.word	0xd4d01018	! t0_kref+0x10c:   	ldsha	[%g0 + %i0]0x80, %o2
	.word	0xc900a02c	! t0_kref+0x110:   	ld	[%g2 + 0x2c], %f4
	.word	0x89a01a24	! t0_kref+0x114:   	fstoi	%f4, %f4
	.word	0x9a100000	! t0_kref+0x118:   	clr	%o5
	.word	0x89a10944	! t0_kref+0x11c:   	fmuld	%f4, %f4, %f4
	.word	0x89a01904	! t0_kref+0x120:   	fitod	%f4, %f4
	.word	0x89a10944	! t0_kref+0x124:   	fmuld	%f4, %f4, %f4
	.word	0x89b106a4	! t0_kref+0x128:   	fmul8x16al	%f4, %f4, %f4
	.word	0x90183618	! t0_kref+0x12c:   	xor	%g0, -0x9e8, %o0
	.word	0xd47e7ffc	! t0_kref+0x130:   	swap	[%i1 - 4], %o2
	.word	0x001fffff	! t0_kref+0x134:   	illtrap	0x1fffff
	.word	0x89a00524	! t0_kref+0x138:   	fsqrts	%f4, %f4
	.word	0x8008328a	! t0_kref+0x13c:   	and	%g0, -0xd76, %g0
	.word	0xd20e4000	! t0_kref+0x140:   	ldub	[%i1], %o1
	.word	0x89a10924	! t0_kref+0x144:   	fmuls	%f4, %f4, %f4
	.word	0x89a000a4	! t0_kref+0x148:   	fnegs	%f4, %f4
	.word	0xd250a004	! t0_kref+0x14c:   	ldsh	[%g2 + 4], %o1
	.word	0x81a90a24	! t0_kref+0x150:   	fcmps	%fcc0, %f4, %f4
	.word	0xd0500018	! t0_kref+0x154:   	ldsh	[%g0 + %i0], %o0
	.word	0xd406001c	! t0_kref+0x158:   	ld	[%i0 + %i4], %o2
	.word	0x86102009	! t0_kref+0x15c:   	mov	0x9, %g3
	.word	0x86a0e001	! t0_kref+0x160:   	subcc	%g3, 1, %g3
	.word	0x22800018	! t0_kref+0x164:   	be,a	_kref+0x1c4
	.word	0x89a10924	! t0_kref+0x168:   	fmuls	%f4, %f4, %f4
	.word	0x89a01924	! t0_kref+0x16c:   	fstod	%f4, %f4
	.word	0x9ec0349a	! t0_kref+0x170:   	addccc	%g0, -0xb66, %o7
	.word	0x89a01904	! t0_kref+0x174:   	fitod	%f4, %f4
	.word	0x90102a00	! t0_kref+0x178:   	mov	0xa00, %o0
	.word	0x89a10924	! t0_kref+0x17c:   	fmuls	%f4, %f4, %f4
	.word	0xb410201a	! t0_kref+0x180:   	mov	0x1a, %i2
	.word	0x96d80000	! t0_kref+0x184:   	smulcc	%g0, %g0, %o3
	.word	0xde08a025	! t0_kref+0x188:   	ldub	[%g2 + 0x25], %o7
	.word	0xe01e3fe0	! t0_kref+0x18c:   	ldd	[%i0 - 0x20], %l0
	.word	0x89a00524	! t0_kref+0x190:   	fsqrts	%f4, %f4
	.word	0x9f100000	! t0_kref+0x194:   	taddcctv	%g0, %g0, %o7
	.word	0xc030a010	! t0_kref+0x198:   	clrh	[%g2 + 0x10]
	.word	0x97b10404	! t0_kref+0x19c:   	fcmple16	%f4, %f4, %o3
	.word	0x89b10e80	! t0_kref+0x1a0:   	fsrc1	%f4, %f4
	.word	0xee50a034	! t0_kref+0x1a4:   	ldsh	[%g2 + 0x34], %l7
	.word	0x9a103036	! t0_kref+0x1a8:   	mov	0xfffff036, %o5
	call	SYM(t0_subr0)
	.word	0xc93e001d	! t0_kref+0x1b0:   	std	%f4, [%i0 + %i5]
	.word	0xc900a010	! t0_kref+0x1b4:   	ld	[%g2 + 0x10], %f4
	.word	0xaef80000	! t0_kref+0x1b8:   	sdivcc	%g0, %g0, %l7
	.word	0x81800000	! t0_kref+0x1bc:   	mov	%g0, %y
	.word	0x89a10824	! t0_kref+0x1c0:   	fadds	%f4, %f4, %f4
	.word	0xde066008	! t0_kref+0x1c4:   	ld	[%i1 + 8], %o7
	.word	0x94002a83	! t0_kref+0x1c8:   	add	%g0, 0xa83, %o2
	.word	0x89b10fa4	! t0_kref+0x1cc:   	fors	%f4, %f4, %f4
	.word	0x89b10ee4	! t0_kref+0x1d0:   	fornot2s	%f4, %f4, %f4
	.word	0xec9f5019	! t0_kref+0x1d4:   	ldda	[%i5 + %i1]0x80, %l6
	.word	0x89b007a4	! t0_kref+0x1d8:   	fpackfix	%f4, %f4
	.word	0x89a00524	! t0_kref+0x1dc:   	fsqrts	%f4, %f4
	.word	0x89a01084	! t0_kref+0x1e0:   	fxtos	%f4, %f4
	.word	0x94a82000	! t0_kref+0x1e4:   	andncc	%g0, 0, %o2
	.word	0x89a10924	! t0_kref+0x1e8:   	fmuls	%f4, %f4, %f4
	.word	0xc900a004	! t0_kref+0x1ec:   	ld	[%g2 + 4], %f4
	.word	0x89b10e24	! t0_kref+0x1f0:   	fands	%f4, %f4, %f4
	.word	0x9de3bfa0	! t0_kref+0x1f4:   	save	%sp, -0x60, %sp
	.word	0x801e401a	! t0_kref+0x1f8:   	xor	%i1, %i2, %g0
	.word	0x97ef4019	! t0_kref+0x1fc:   	restore	%i5, %i1, %o3
	.word	0xc91fbd88	! t0_kref+0x200:   	ldd	[%fp - 0x278], %f4
	.word	0x89b10e80	! t0_kref+0x204:   	fsrc1	%f4, %f4
	.word	0x94800000	! t0_kref+0x208:   	addcc	%g0, %g0, %o2
	.word	0x9e980000	! t0_kref+0x20c:   	xorcc	%g0, %g0, %o7
	.word	0xc99e101d	! t0_kref+0x210:   	ldda	[%i0 + %i5]0x80, %f4
	.word	0x89b10ae4	! t0_kref+0x214:   	fpsub32s	%f4, %f4, %f4
	.word	0xc91fbde0	! t0_kref+0x218:   	ldd	[%fp - 0x220], %f4
	.word	0xee16c018	! t0_kref+0x21c:   	lduh	[%i3 + %i0], %l7
	.word	0xc91fbfb0	! t0_kref+0x220:   	ldd	[%fp - 0x50], %f4
	.word	0x90700000	! t0_kref+0x224:   	udiv	%g0, %g0, %o0
	.word	0x89a00524	! t0_kref+0x228:   	fsqrts	%f4, %f4
	.word	0xc91fbe50	! t0_kref+0x22c:   	ldd	[%fp - 0x1b0], %f4
	.word	0x8143c000	! t0_kref+0x230:   	stbar
	.word	0x81dda9d2	! t0_kref+0x234:   	flush	%l6 + 0x9d2
	.word	0xc028a038	! t0_kref+0x238:   	clrb	[%g2 + 0x38]
	.word	0x96402a6d	! t0_kref+0x23c:   	addc	%g0, 0xa6d, %o3
	.word	0xd4563fee	! t0_kref+0x240:   	ldsh	[%i0 - 0x12], %o2
	.word	0x98800000	! t0_kref+0x244:   	addcc	%g0, %g0, %o4
	.word	0xc99f5018	! t0_kref+0x248:   	ldda	[%i5 + %i0]0x80, %f4
	.word	0x91400000	! t0_kref+0x24c:   	mov	%y, %o0
	.word	0x98980000	! t0_kref+0x250:   	xorcc	%g0, %g0, %o4
	.word	0x89a01a44	! t0_kref+0x254:   	fdtoi	%f4, %f4
	.word	0x81580000	! t0_kref+0x258:   	flushw
	.word	0x992027e8	! t0_kref+0x25c:   	mulscc	%g0, 0x7e8, %o4
	.word	0x89a00524	! t0_kref+0x260:   	fsqrts	%f4, %f4
	.word	0xc9180019	! t0_kref+0x264:   	ldd	[%g0 + %i1], %f4
	.word	0x9fc10000	! t0_kref+0x268:   	call	%g4
	.word	0x81400000	! t0_kref+0x26c:   	mov	%y, %g0
	.word	0xd4961000	! t0_kref+0x270:   	lduha	[%i0]0x80, %o2
	.word	0xaf418000	! t0_kref+0x274:   	mov	%fprs, %l7
	.word	0x89a00124	! t0_kref+0x278:   	fabss	%f4, %f4
	.word	0xee4e7fe1	! t0_kref+0x27c:   	ldsb	[%i1 - 0x1f], %l7
	.word	0xd03e6010	! t0_kref+0x280:   	std	%o0, [%i1 + 0x10]
	.word	0x89b00f24	! t0_kref+0x284:   	fsrc2s	%f4, %f4
	.word	0x89b10f64	! t0_kref+0x288:   	fornot1s	%f4, %f4, %f4
	.word	0xde40a038	! t0_kref+0x28c:   	ldsw	[%g2 + 0x38], %o7
	.word	0x90803c40	! t0_kref+0x290:   	addcc	%g0, -0x3c0, %o0
	.word	0xc020a010	! t0_kref+0x294:   	clr	[%g2 + 0x10]
	.word	0xfdee501b	! t0_kref+0x298:   	prefetcha	%i1 + %i3, 30
	.word	0x89b10ea0	! t0_kref+0x29c:   	fsrc1s	%f4, %f4
	.word	0x98e00000	! t0_kref+0x2a0:   	subccc	%g0, %g0, %o4
	.word	0x94980000	! t0_kref+0x2a4:   	xorcc	%g0, %g0, %o2
	.word	0xaea80000	! t0_kref+0x2a8:   	andncc	%g0, %g0, %l7
	.word	0x9e100000	! t0_kref+0x2ac:   	clr	%o7
	.word	0x89a01a44	! t0_kref+0x2b0:   	fdtoi	%f4, %f4
	.word	0x89a01044	! t0_kref+0x2b4:   	fdtox	%f4, %f4
	.word	0x8143c000	! t0_kref+0x2b8:   	stbar
	.word	0x28800005	! t0_kref+0x2bc:   	bleu,a	_kref+0x2d0
	.word	0x96103351	! t0_kref+0x2c0:   	mov	0xfffff351, %o3
	.word	0xe3b8a080	! t0_kref+0x2c4:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x89a01924	! t0_kref+0x2c8:   	fstod	%f4, %f4
	.word	0xc030a02a	! t0_kref+0x2cc:   	clrh	[%g2 + 0x2a]
	.word	0x97280000	! t0_kref+0x2d0:   	sll	%g0, %g0, %o3
	.word	0x2b480004	! t0_kref+0x2d4:   	fbug,a,pt	%fcc0, _kref+0x2e4
	.word	0x94900000	! t0_kref+0x2d8:   	orcc	%g0, %g0, %o2
	.word	0x93700000	! t0_kref+0x2dc:   	popc	%g0, %o1
	.word	0xc000a000	! t0_kref+0x2e0:   	ld	[%g2], %g0
	.word	0x90203f4b	! t0_kref+0x2e4:   	sub	%g0, -0xb5, %o0
	.word	0xd6fe5000	! t0_kref+0x2e8:   	swapa	[%i1]0x80, %o3
	.word	0xc0280018	! t0_kref+0x2ec:   	clrb	[%g0 + %i0]
	.word	0x89a10824	! t0_kref+0x2f0:   	fadds	%f4, %f4, %f4
	.word	0x81400000	! t0_kref+0x2f4:   	mov	%y, %g0
	.word	0xc030a00c	! t0_kref+0x2f8:   	clrh	[%g2 + 0xc]
	.word	0x89b10f44	! t0_kref+0x2fc:   	fornot1	%f4, %f4, %f4
	.word	0x89a00524	! t0_kref+0x300:   	fsqrts	%f4, %f4
	.word	0x91302008	! t0_kref+0x304:   	srl	%g0, 0x8, %o0
	.word	0x22480004	! t0_kref+0x308:   	be,a,pt	%icc, _kref+0x318
	.word	0x89b10d40	! t0_kref+0x30c:   	fnot1	%f4, %f4
	.word	0x89a10944	! t0_kref+0x310:   	fmuld	%f4, %f4, %f4
	.word	0x90403d77	! t0_kref+0x314:   	addc	%g0, -0x289, %o0
	.word	0xc920a014	! t0_kref+0x318:   	st	%f4, [%g2 + 0x14]
	.word	0xda10a00c	! t0_kref+0x31c:   	lduh	[%g2 + 0xc], %o5
	.word	0xc008a02f	! t0_kref+0x320:   	ldub	[%g2 + 0x2f], %g0
	.word	0x28800001	! t0_kref+0x324:   	bleu,a	_kref+0x328
	.word	0x89a01924	! t0_kref+0x328:   	fstod	%f4, %f4
	.word	0xd208a017	! t0_kref+0x32c:   	ldub	[%g2 + 0x17], %o1
	.word	0x89a10844	! t0_kref+0x330:   	faddd	%f4, %f4, %f4
	.word	0x81a90a44	! t0_kref+0x334:   	fcmpd	%fcc0, %f4, %f4
	.word	0xc900a024	! t0_kref+0x338:   	ld	[%g2 + 0x24], %f4
	.word	0xc807bfe8	! t0_kref+0x33c:   	ld	[%fp - 0x18], %g4
	.word	0x89b10aa4	! t0_kref+0x340:   	fpsub16s	%f4, %f4, %f4
	.word	0x89b00764	! t0_kref+0x344:   	fpack16	%f4, %f4
	.word	0x9ef80000	! t0_kref+0x348:   	sdivcc	%g0, %g0, %o7
	.word	0x89a108a4	! t0_kref+0x34c:   	fsubs	%f4, %f4, %f4
	.word	0x99400000	! t0_kref+0x350:   	mov	%y, %o4
	.word	0xa7800000	! t0_kref+0x354:   	mov	%g0, %gsr
	.word	0x81dc8010	! t0_kref+0x358:   	flush	%l2 + %l0
	.word	0xaeb00000	! t0_kref+0x35c:   	orncc	%g0, %g0, %l7
	.word	0x89a10824	! t0_kref+0x360:   	fadds	%f4, %f4, %f4
	.word	0x90f80000	! t0_kref+0x364:   	sdivcc	%g0, %g0, %o0
	.word	0x96900000	! t0_kref+0x368:   	orcc	%g0, %g0, %o3
	.word	0x89a10824	! t0_kref+0x36c:   	fadds	%f4, %f4, %f4
	.word	0xc020a004	! t0_kref+0x370:   	clr	[%g2 + 4]
	.word	0x801821bd	! t0_kref+0x374:   	xor	%g0, 0x1bd, %g0
	.word	0xd0566006	! t0_kref+0x378:   	ldsh	[%i1 + 6], %o0
	.word	0xd44e2000	! t0_kref+0x37c:   	ldsb	[%i0], %o2
	.word	0x89a01a24	! t0_kref+0x380:   	fstoi	%f4, %f4
	.word	0x89b10ea0	! t0_kref+0x384:   	fsrc1s	%f4, %f4
	.word	0x95b00020	! t0_kref+0x388:   	edge8n	%g0, %g0, %o2
	.word	0x81b104c4	! t0_kref+0x38c:   	fcmpne32	%f4, %f4, %g0
	.word	0x89a10844	! t0_kref+0x390:   	faddd	%f4, %f4, %f4
	.word	0xd850a00a	! t0_kref+0x394:   	ldsh	[%g2 + 0xa], %o4
	.word	0x95102b8c	! t0_kref+0x398:   	taddcctv	%g0, 0xb8c, %o2
	.word	0x89a01884	! t0_kref+0x39c:   	fitos	%f4, %f4
	.word	0xde56201a	! t0_kref+0x3a0:   	ldsh	[%i0 + 0x1a], %o7
	.word	0xaf300000	! t0_kref+0x3a4:   	srl	%g0, %g0, %l7
	.word	0x90d82e38	! t0_kref+0x3a8:   	smulcc	%g0, 0xe38, %o0
	.word	0x9a10263f	! t0_kref+0x3ac:   	mov	0x63f, %o5
	.word	0x98e02475	! t0_kref+0x3b0:   	subccc	%g0, 0x475, %o4
	.word	0x9f302008	! t0_kref+0x3b4:   	srl	%g0, 0x8, %o7
	.word	0x89a000a4	! t0_kref+0x3b8:   	fnegs	%f4, %f4
	.word	0xd806401c	! t0_kref+0x3bc:   	ld	[%i1 + %i4], %o4
	.word	0xc028a03b	! t0_kref+0x3c0:   	clrb	[%g2 + 0x3b]
	.word	0x99280000	! t0_kref+0x3c4:   	sll	%g0, %g0, %o4
	.word	0x81db7153	! t0_kref+0x3c8:   	flush	%o5 - 0xead
	.word	0x89a9c044	! t0_kref+0x3cc:   	fmovdu	%fcc0, %f4, %f4
	.word	0x21480008	! t0_kref+0x3d0:   	fbn,a,pt	%fcc0, _kref+0x3f0
	.word	0x89a10824	! t0_kref+0x3d4:   	fadds	%f4, %f4, %f4
	.word	0x89a01a24	! t0_kref+0x3d8:   	fstoi	%f4, %f4
	.word	0x9e980000	! t0_kref+0x3dc:   	xorcc	%g0, %g0, %o7
	.word	0xc9063ffc	! t0_kref+0x3e0:   	ld	[%i0 - 4], %f4
	.word	0x89a01a44	! t0_kref+0x3e4:   	fdtoi	%f4, %f4
	.word	0x9ef83761	! t0_kref+0x3e8:   	sdivcc	%g0, -0x89f, %o7
	.word	0xc02e200d	! t0_kref+0x3ec:   	clrb	[%i0 + 0xd]
	.word	0xc900a030	! t0_kref+0x3f0:   	ld	[%g2 + 0x30], %f4
	.word	0x94400000	! t0_kref+0x3f4:   	addc	%g0, %g0, %o2
	.word	0x89a108a4	! t0_kref+0x3f8:   	fsubs	%f4, %f4, %f4
	.word	0xd41e6018	! t0_kref+0x3fc:   	ldd	[%i1 + 0x18], %o2
	.word	0x9fc10000	! t0_kref+0x400:   	call	%g4
	.word	0x89a01a24	! t0_kref+0x404:   	fstoi	%f4, %f4
	.word	0xc99f5018	! t0_kref+0x408:   	ldda	[%i5 + %i0]0x80, %f4
	.word	0x89b00ce4	! t0_kref+0x40c:   	fnot2s	%f4, %f4
	.word	0x80882cd5	! t0_kref+0x410:   	btst	0xcd5, %g0
	.word	0x89b106e4	! t0_kref+0x414:   	fmul8ulx16	%f4, %f4, %f4
	.word	0xc9b81019	! t0_kref+0x418:   	stda	%f4, [%g0 + %i1]0x80
	.word	0xdae81019	! t0_kref+0x41c:   	ldstuba	[%g0 + %i1]0x80, %o5
	.word	0x99b00000	! t0_kref+0x420:   	edge8	%g0, %g0, %o4
	.word	0xc9a6501c	! t0_kref+0x424:   	sta	%f4, [%i1 + %i4]0x80
	.word	0x80b03d7f	! t0_kref+0x428:   	orncc	%g0, -0x281, %g0
	.word	0x90700000	! t0_kref+0x42c:   	udiv	%g0, %g0, %o0
	.word	0x81a90a24	! t0_kref+0x430:   	fcmps	%fcc0, %f4, %f4
	.word	0x89a00144	! t0_kref+0x434:   	fabsd	%f4, %f4
	.word	0x9a703427	! t0_kref+0x438:   	udiv	%g0, -0xbd9, %o5
	.word	0x81da4017	! t0_kref+0x43c:   	flush	%o1 + %l7
	.word	0xc028a027	! t0_kref+0x440:   	clrb	[%g2 + 0x27]
	.word	0xaea83853	! t0_kref+0x444:   	andncc	%g0, -0x7ad, %l7
	.word	0xc028a01c	! t0_kref+0x448:   	clrb	[%g2 + 0x1c]
	.word	0xafb00020	! t0_kref+0x44c:   	edge8n	%g0, %g0, %l7
	.word	0x24800005	! t0_kref+0x450:   	ble,a	_kref+0x464
	.word	0xeed6105b	! t0_kref+0x454:   	ldsha	[%i0 + %i3]0x82, %l7
	.word	0x89a10d24	! t0_kref+0x458:   	fsmuld	%f4, %f4, %f4
	.word	0x89a00124	! t0_kref+0x45c:   	fabss	%f4, %f4
	.word	0x2a480001	! t0_kref+0x460:   	bcs,a,pt	%icc, _kref+0x464
	.word	0x9ea80000	! t0_kref+0x464:   	andncc	%g0, %g0, %o7
	.word	0x89b10984	! t0_kref+0x468:   	bshuffle	%f4, %f4, %f4
	.word	0x9ae00000	! t0_kref+0x46c:   	subccc	%g0, %g0, %o5
	.word	0x89b10e64	! t0_kref+0x470:   	fxnors	%f4, %f4, %f4
	.word	0x89a108c4	! t0_kref+0x474:   	fsubd	%f4, %f4, %f4
	.word	0xe43e3fe0	! t0_kref+0x478:   	std	%l2, [%i0 - 0x20]
	.word	0x94203885	! t0_kref+0x47c:   	sub	%g0, -0x77b, %o2
	.word	0x89a10924	! t0_kref+0x480:   	fmuls	%f4, %f4, %f4
	.word	0x81300000	! t0_kref+0x484:   	srl	%g0, %g0, %g0
	.word	0x91b10504	! t0_kref+0x488:   	fcmpgt16	%f4, %f4, %o0
	.word	0x81a90ac4	! t0_kref+0x48c:   	fcmped	%fcc0, %f4, %f4
	.word	0xe4ee9019	! t0_kref+0x490:   	ldstuba	[%i2 + %i1]0x80, %l2
	.word	0x81da8004	! t0_kref+0x494:   	flush	%o2 + %g4
	.word	0xee48a021	! t0_kref+0x498:   	ldsb	[%g2 + 0x21], %l7
	call	SYM(t0_subr3)
	.word	0x89a00524	! t0_kref+0x4a0:   	fsqrts	%f4, %f4
	.word	0xd810a01e	! t0_kref+0x4a4:   	lduh	[%g2 + 0x1e], %o4
	.word	0x91b00080	! t0_kref+0x4a8:   	edge16	%g0, %g0, %o0
	.word	0xaf44c000	! t0_kref+0x4ac:   	mov	%gsr, %l7
	.word	0xa78022f6	! t0_kref+0x4b0:   	mov	0x2f6, %gsr
	.word	0x945032f0	! t0_kref+0x4b4:   	umul	%g0, -0xd10, %o2
	.word	0xd20e6008	! t0_kref+0x4b8:   	ldub	[%i1 + 8], %o1
	.word	0xae8037eb	! t0_kref+0x4bc:   	addcc	%g0, -0x815, %l7
	.word	0x9e902d6b	! t0_kref+0x4c0:   	orcc	%g0, 0xd6b, %o7
	.word	0xc0200018	! t0_kref+0x4c4:   	clr	[%g0 + %i0]
	.word	0xee0e0000	! t0_kref+0x4c8:   	ldub	[%i0], %l7
	.word	0x89a10924	! t0_kref+0x4cc:   	fmuls	%f4, %f4, %f4
	.word	0xc030a02a	! t0_kref+0x4d0:   	clrh	[%g2 + 0x2a]
	.word	0x96183d1d	! t0_kref+0x4d4:   	xor	%g0, -0x2e3, %o3
	.word	0x9ed833b5	! t0_kref+0x4d8:   	smulcc	%g0, -0xc4b, %o7
	.word	0x9ad00000	! t0_kref+0x4dc:   	umulcc	%g0, %g0, %o5
	.word	0x98102f0a	! t0_kref+0x4e0:   	mov	0xf0a, %o4
	.word	0x80a80000	! t0_kref+0x4e4:   	andncc	%g0, %g0, %g0
	call	SYM(t0_subr1)
	.word	0x8d80305d	! t0_kref+0x4ec:   	mov	0xfffff05d, %fprs
	.word	0xae503051	! t0_kref+0x4f0:   	umul	%g0, -0xfaf, %l7
	.word	0xc0280018	! t0_kref+0x4f4:   	clrb	[%g0 + %i0]
	.word	0xc9a71019	! t0_kref+0x4f8:   	sta	%f4, [%i4 + %i1]0x80
	.word	0x89a00124	! t0_kref+0x4fc:   	fabss	%f4, %f4
	.word	0x9af82add	! t0_kref+0x500:   	sdivcc	%g0, 0xadd, %o5
	.word	0x89a01904	! t0_kref+0x504:   	fitod	%f4, %f4
	.word	0x9a4031ea	! t0_kref+0x508:   	addc	%g0, -0xe16, %o5
	.word	0x28800007	! t0_kref+0x50c:   	bleu,a	_kref+0x528
	.word	0x9e500000	! t0_kref+0x510:   	umul	%g0, %g0, %o7
	.word	0x89a109c4	! t0_kref+0x514:   	fdivd	%f4, %f4, %f4
	.word	0x89a10844	! t0_kref+0x518:   	faddd	%f4, %f4, %f4
	.word	0x91b000a0	! t0_kref+0x51c:   	edge16n	%g0, %g0, %o0
	.word	0x93280000	! t0_kref+0x520:   	sll	%g0, %g0, %o1
	.word	0x89a00544	! t0_kref+0x524:   	fsqrtd	%f4, %f4
	.word	0x96e00000	! t0_kref+0x528:   	subccc	%g0, %g0, %o3
	.word	0x92100000	! t0_kref+0x52c:   	clr	%o1
	.word	0x89b10aa4	! t0_kref+0x530:   	fpsub16s	%f4, %f4, %f4
	.word	0xaea83066	! t0_kref+0x534:   	andncc	%g0, -0xf9a, %l7
	.word	0x81dbc017	! t0_kref+0x538:   	flush	%o7 + %l7
	.word	0x9ac00000	! t0_kref+0x53c:   	addccc	%g0, %g0, %o5
	.word	0x89a000a4	! t0_kref+0x540:   	fnegs	%f4, %f4
	.word	0x9fc0001c	! t0_kref+0x544:   	call	%g0 + %i4
	.word	0xd6070018	! t0_kref+0x548:   	ld	[%i4 + %i0], %o3
	.word	0x80180000	! t0_kref+0x54c:   	xor	%g0, %g0, %g0
	.word	0x89a01904	! t0_kref+0x550:   	fitod	%f4, %f4
	.word	0xf36e401b	! t0_kref+0x554:   	prefetch	%i1 + %i3, 25
	.word	0x8143e03c	! t0_kref+0x558:   	membar	0x3c
	.word	0x9de3bfa0	! t0_kref+0x55c:   	save	%sp, -0x60, %sp
	.word	0x95ee2cac	! t0_kref+0x560:   	restore	%i0, 0xcac, %o2
	.word	0x9fc10000	! t0_kref+0x564:   	call	%g4
	.word	0x98003d44	! t0_kref+0x568:   	add	%g0, -0x2bc, %o4
	.word	0x9aa80000	! t0_kref+0x56c:   	andncc	%g0, %g0, %o5
	.word	0x001fffff	! t0_kref+0x570:   	illtrap	0x1fffff
	.word	0x89a00524	! t0_kref+0x574:   	fsqrts	%f4, %f4
	.word	0xc9200019	! t0_kref+0x578:   	st	%f4, [%g0 + %i1]
	.word	0x21800005	! t0_kref+0x57c:   	fbn,a	_kref+0x590
	.word	0x90800000	! t0_kref+0x580:   	addcc	%g0, %g0, %o0
	.word	0x81a90ac4	! t0_kref+0x584:   	fcmped	%fcc0, %f4, %f4
	.word	0x89a00124	! t0_kref+0x588:   	fabss	%f4, %f4
	.word	0x89b10ae4	! t0_kref+0x58c:   	fpsub32s	%f4, %f4, %f4
	.word	0xc368a043	! t0_kref+0x590:   	prefetch	%g2 + 0x43, 1
	.word	0x94002788	! t0_kref+0x594:   	add	%g0, 0x788, %o2
	.word	0x38800003	! t0_kref+0x598:   	bgu,a	_kref+0x5a4
	.word	0x89a109c4	! t0_kref+0x59c:   	fdivd	%f4, %f4, %f4
	.word	0x89a00144	! t0_kref+0x5a0:   	fabsd	%f4, %f4
	.word	0x89a00144	! t0_kref+0x5a4:   	fabsd	%f4, %f4
	.word	0x8d800000	! t0_kref+0x5a8:   	mov	%g0, %fprs
	.word	0x98100000	! t0_kref+0x5ac:   	clr	%o4
	.word	0x9208287d	! t0_kref+0x5b0:   	and	%g0, 0x87d, %o1
	.word	0x89a108a4	! t0_kref+0x5b4:   	fsubs	%f4, %f4, %f4
	.word	0x966037f5	! t0_kref+0x5b8:   	subc	%g0, -0x80b, %o3
	.word	0x92e00000	! t0_kref+0x5bc:   	subccc	%g0, %g0, %o1
	.word	0x89a108a4	! t0_kref+0x5c0:   	fsubs	%f4, %f4, %f4
	.word	0x89a018c4	! t0_kref+0x5c4:   	fdtos	%f4, %f4
	.word	0xee000018	! t0_kref+0x5c8:   	ld	[%g0 + %i0], %l7
	.word	0x9f300000	! t0_kref+0x5cc:   	srl	%g0, %g0, %o7
	.word	0x89a10944	! t0_kref+0x5d0:   	fmuld	%f4, %f4, %f4
	.word	0xc028a01c	! t0_kref+0x5d4:   	clrb	[%g2 + 0x1c]
	.word	0x89a000c4	! t0_kref+0x5d8:   	fnegd	%f4, %f4
	.word	0x9ad82328	! t0_kref+0x5dc:   	smulcc	%g0, 0x328, %o5
	.word	0x81580000	! t0_kref+0x5e0:   	flushw
	.word	0x97b00140	! t0_kref+0x5e4:   	edge32l	%g0, %g0, %o3
	.word	0xee08a009	! t0_kref+0x5e8:   	ldub	[%g2 + 9], %l7
	.word	0xc0ee1000	! t0_kref+0x5ec:   	ldstuba	[%i0]0x80, %g0
	.word	0x81a90a24	! t0_kref+0x5f0:   	fcmps	%fcc0, %f4, %f4
	.word	0x89a01a24	! t0_kref+0x5f4:   	fstoi	%f4, %f4
	.word	0xd43f4018	! t0_kref+0x5f8:   	std	%o2, [%i5 + %i0]
	.word	0x8143e04b	! t0_kref+0x5fc:   	membar	0x4b
	.word	0x8d800000	! t0_kref+0x600:   	mov	%g0, %fprs
	.word	0xd810a03a	! t0_kref+0x604:   	lduh	[%g2 + 0x3a], %o4
	.word	0x95b104c4	! t0_kref+0x608:   	fcmpne32	%f4, %f4, %o2
	.word	0x89a00124	! t0_kref+0x60c:   	fabss	%f4, %f4
	.word	0x89a01924	! t0_kref+0x610:   	fstod	%f4, %f4
	.word	0x89a018c4	! t0_kref+0x614:   	fdtos	%f4, %f4
	.word	0xec3e4000	! t0_kref+0x618:   	std	%l6, [%i1]
	.word	0x89a108a4	! t0_kref+0x61c:   	fsubs	%f4, %f4, %f4
	.word	0x98800000	! t0_kref+0x620:   	addcc	%g0, %g0, %o4
	.word	0xefe61000	! t0_kref+0x624:   	casa	[%i0]0x80, %g0, %l7
	.word	0xd016001b	! t0_kref+0x628:   	lduh	[%i0 + %i3], %o0
	.word	0x9e503392	! t0_kref+0x62c:   	umul	%g0, -0xc6e, %o7
	.word	0xd848a015	! t0_kref+0x630:   	ldsb	[%g2 + 0x15], %o4
	.word	0x89a108c4	! t0_kref+0x634:   	fsubd	%f4, %f4, %f4
	.word	0xec3e001d	! t0_kref+0x638:   	std	%l6, [%i0 + %i5]
	.word	0x89a01924	! t0_kref+0x63c:   	fstod	%f4, %f4
	.word	0x94500000	! t0_kref+0x640:   	umul	%g0, %g0, %o2
	.word	0xd840a038	! t0_kref+0x644:   	ldsw	[%g2 + 0x38], %o4
	.word	0xc028a020	! t0_kref+0x648:   	clrb	[%g2 + 0x20]
	.word	0xc900a02c	! t0_kref+0x64c:   	ld	[%g2 + 0x2c], %f4
	.word	0x89b10744	! t0_kref+0x650:   	fpack32	%f4, %f4, %f4
	.word	0x95703d7a	! t0_kref+0x654:   	popc	-0x286, %o2
	.word	0x9bb10544	! t0_kref+0x658:   	fcmpeq16	%f4, %f4, %o5
	.word	0x89b106e4	! t0_kref+0x65c:   	fmul8ulx16	%f4, %f4, %f4
	.word	0x89b10fa4	! t0_kref+0x660:   	fors	%f4, %f4, %f4
	.word	0x89a10924	! t0_kref+0x664:   	fmuls	%f4, %f4, %f4
	.word	0x95280000	! t0_kref+0x668:   	sll	%g0, %g0, %o2
	.word	0x89a10924	! t0_kref+0x66c:   	fmuls	%f4, %f4, %f4
	.word	0xc04e001a	! t0_kref+0x670:   	ldsb	[%i0 + %i2], %g0
	.word	0x89a10844	! t0_kref+0x674:   	faddd	%f4, %f4, %f4
	.word	0x89a10844	! t0_kref+0x678:   	faddd	%f4, %f4, %f4
	.word	0x89ab0024	! t0_kref+0x67c:   	fmovsuge	%fcc0, %f4, %f4
	.word	0x89a10844	! t0_kref+0x680:   	faddd	%f4, %f4, %f4
	.word	0x22800002	! t0_kref+0x684:   	be,a	_kref+0x68c
	.word	0xc99f5019	! t0_kref+0x688:   	ldda	[%i5 + %i1]0x80, %f4
	.word	0x86102008	! t0_kref+0x68c:   	mov	0x8, %g3
	.word	0x86a0e001	! t0_kref+0x690:   	subcc	%g3, 1, %g3
	.word	0x22800002	! t0_kref+0x694:   	be,a	_kref+0x69c
	.word	0x98b80000	! t0_kref+0x698:   	xnorcc	%g0, %g0, %o4
	.word	0x86102016	! t0_kref+0x69c:   	mov	0x16, %g3
	.word	0x86a0e001	! t0_kref+0x6a0:   	subcc	%g3, 1, %g3
	.word	0x22800017	! t0_kref+0x6a4:   	be,a	_kref+0x700
	.word	0xd616c018	! t0_kref+0x6a8:   	lduh	[%i3 + %i0], %o3
	.word	0x9010200f	! t0_kref+0x6ac:   	mov	0xf, %o0
	.word	0x81a90a44	! t0_kref+0x6b0:   	fcmpd	%fcc0, %f4, %f4
	.word	0x92d80000	! t0_kref+0x6b4:   	smulcc	%g0, %g0, %o1
	.word	0x91400000	! t0_kref+0x6b8:   	mov	%y, %o0
	.word	0x92800000	! t0_kref+0x6bc:   	addcc	%g0, %g0, %o1
	.word	0x96100000	! t0_kref+0x6c0:   	clr	%o3
	.word	0x89a000a4	! t0_kref+0x6c4:   	fnegs	%f4, %f4
	.word	0x89a00544	! t0_kref+0x6c8:   	fsqrtd	%f4, %f4
	.word	0x89a108a4	! t0_kref+0x6cc:   	fsubs	%f4, %f4, %f4
	.word	0x89b10e64	! t0_kref+0x6d0:   	fxnors	%f4, %f4, %f4
	.word	0x9eb02cc8	! t0_kref+0x6d4:   	orncc	%g0, 0xcc8, %o7
	.word	0xc3ee5000	! t0_kref+0x6d8:   	prefetcha	%i1, 1
	.word	0x81a90ac4	! t0_kref+0x6dc:   	fcmped	%fcc0, %f4, %f4
	.word	0x80b03f86	! t0_kref+0x6e0:   	orncc	%g0, -0x7a, %g0
	.word	0xec3e3fe0	! t0_kref+0x6e4:   	std	%l6, [%i0 - 0x20]
	.word	0xae90209d	! t0_kref+0x6e8:   	orcc	%g0, 0x9d, %l7
	.word	0x9fc00004	! t0_kref+0x6ec:   	call	%g0 + %g4
	.word	0xc9be501d	! t0_kref+0x6f0:   	stda	%f4, [%i1 + %i5]0x80
	.word	0x99180000	! t0_kref+0x6f4:   	tsubcctv	%g0, %g0, %o4
	.word	0x89a10844	! t0_kref+0x6f8:   	faddd	%f4, %f4, %f4
	.word	0x89a109c4	! t0_kref+0x6fc:   	fdivd	%f4, %f4, %f4
	.word	0x24800003	! t0_kref+0x700:   	ble,a	_kref+0x70c
	.word	0x97202a34	! t0_kref+0x704:   	mulscc	%g0, 0xa34, %o3
	.word	0x90a83cde	! t0_kref+0x708:   	andncc	%g0, -0x322, %o0
	.word	0x89b10744	! t0_kref+0x70c:   	fpack32	%f4, %f4, %f4
	.word	0x89a00544	! t0_kref+0x710:   	fsqrtd	%f4, %f4
	.word	0x89a01a44	! t0_kref+0x714:   	fdtoi	%f4, %f4
	.word	0x8d800000	! t0_kref+0x718:   	mov	%g0, %fprs
	.word	0x81dd2fd5	! t0_kref+0x71c:   	flush	%l4 + 0xfd5
	.word	0x89b10e64	! t0_kref+0x720:   	fxnors	%f4, %f4, %f4
	.word	0xd04e0000	! t0_kref+0x724:   	ldsb	[%i0], %o0
	.word	0xc00e3fe9	! t0_kref+0x728:   	ldub	[%i0 - 0x17], %g0
	.word	0x9aa82dd6	! t0_kref+0x72c:   	andncc	%g0, 0xdd6, %o5
	.word	0x89b10d24	! t0_kref+0x730:   	fandnot1s	%f4, %f4, %f4
	.word	0xe9f61000	! t0_kref+0x734:   	casxa	[%i0]0x80, %g0, %l4
	call	SYM(t0_subr0)
	.word	0xc99e101d	! t0_kref+0x73c:   	ldda	[%i0 + %i5]0x80, %f4
	.word	0xd608a01d	! t0_kref+0x740:   	ldub	[%g2 + 0x1d], %o3
	.word	0xde480019	! t0_kref+0x744:   	ldsb	[%g0 + %i1], %o7
	.word	0xd01e2000	! t0_kref+0x748:   	ldd	[%i0], %o0
	.word	0x95200000	! t0_kref+0x74c:   	mulscc	%g0, %g0, %o2
	.word	0x89a018c4	! t0_kref+0x750:   	fdtos	%f4, %f4
	.word	0xd6070018	! t0_kref+0x754:   	ld	[%i4 + %i0], %o3
	.word	0x96000000	! t0_kref+0x758:   	add	%g0, %g0, %o3
	.word	0xd440a028	! t0_kref+0x75c:   	ldsw	[%g2 + 0x28], %o2
	.word	0x89b00ce4	! t0_kref+0x760:   	fnot2s	%f4, %f4
	call	SYM(t0_subr2)
	.word	0x81580000	! t0_kref+0x768:   	flushw
	.word	0xc99e501d	! t0_kref+0x76c:   	ldda	[%i1 + %i5]0x80, %f4
	.word	0xc91fbd40	! t0_kref+0x770:   	ldd	[%fp - 0x2c0], %f4
	.word	0x9ae029ce	! t0_kref+0x774:   	subccc	%g0, 0x9ce, %o5
	.word	0xaef82a77	! t0_kref+0x778:   	sdivcc	%g0, 0xa77, %l7
	.word	0x89b10e44	! t0_kref+0x77c:   	fxnor	%f4, %f4, %f4
	.word	0x99b10484	! t0_kref+0x780:   	fcmple32	%f4, %f4, %o4
	.word	0xae180000	! t0_kref+0x784:   	xor	%g0, %g0, %l7
	.word	0xe67e3fe8	! t0_kref+0x788:   	swap	[%i0 - 0x18], %l3
	.word	0x92803b53	! t0_kref+0x78c:   	addcc	%g0, -0x4ad, %o1
	.word	0x81800000	! t0_kref+0x790:   	mov	%g0, %y
	.word	0x89a00524	! t0_kref+0x794:   	fsqrts	%f4, %f4
	.word	0x9fc10000	! t0_kref+0x798:   	call	%g4
	.word	0x89a01904	! t0_kref+0x79c:   	fitod	%f4, %f4
	.word	0x8610200a	! t0_kref+0x7a0:   	mov	0xa, %g3
	.word	0x86a0e001	! t0_kref+0x7a4:   	subcc	%g3, 1, %g3
	.word	0x22800015	! t0_kref+0x7a8:   	be,a	_kref+0x7fc
	.word	0xc028a01b	! t0_kref+0x7ac:   	clrb	[%g2 + 0x1b]
	.word	0x95200000	! t0_kref+0x7b0:   	mulscc	%g0, %g0, %o2
	.word	0xc030a020	! t0_kref+0x7b4:   	clrh	[%g2 + 0x20]
	.word	0x92d80000	! t0_kref+0x7b8:   	smulcc	%g0, %g0, %o1
	.word	0x89a01904	! t0_kref+0x7bc:   	fitod	%f4, %f4
	.word	0x91400000	! t0_kref+0x7c0:   	mov	%y, %o0
	.word	0xe83f4019	! t0_kref+0x7c4:   	std	%l4, [%i5 + %i1]
	.word	0x9e50233e	! t0_kref+0x7c8:   	umul	%g0, 0x33e, %o7
	.word	0x81800000	! t0_kref+0x7cc:   	mov	%g0, %y
	.word	0x93300000	! t0_kref+0x7d0:   	srl	%g0, %g0, %o1
	.word	0xf82e8000	! t0_kref+0x7d4:   	stb	%i4, [%i2]
	.word	0x81a90aa4	! t0_kref+0x7d8:   	fcmpes	%fcc0, %f4, %f4
	.word	0x9e9822af	! t0_kref+0x7dc:   	xorcc	%g0, 0x2af, %o7
	.word	0x89b10a04	! t0_kref+0x7e0:   	fpadd16	%f4, %f4, %f4
	.word	0x9b400000	! t0_kref+0x7e4:   	mov	%y, %o5
	.word	0x89a00524	! t0_kref+0x7e8:   	fsqrts	%f4, %f4
	.word	0xd2c01018	! t0_kref+0x7ec:   	ldswa	[%g0 + %i0]0x80, %o1
	.word	0x30bfffed	! t0_kref+0x7f0:   	ba,a	_kref+0x7a4
	.word	0x95b00040	! t0_kref+0x7f4:   	edge8l	%g0, %g0, %o2
	.word	0x89a000a4	! t0_kref+0x7f8:   	fnegs	%f4, %f4
	call	SYM(t0_subr3)
	.word	0x81800000	! t0_kref+0x800:   	mov	%g0, %y
	.word	0x89a10944	! t0_kref+0x804:   	fmuld	%f4, %f4, %f4
	.word	0xc0ae101a	! t0_kref+0x808:   	stba	%g0, [%i0 + %i2]0x80
	.word	0x89b00c00	! t0_kref+0x80c:   	fzero	%f4
	.word	0x89a00544	! t0_kref+0x810:   	fsqrtd	%f4, %f4
	.word	0x94b824bc	! t0_kref+0x814:   	xnorcc	%g0, 0x4bc, %o2
	.word	0x89a000c4	! t0_kref+0x818:   	fnegd	%f4, %f4
	.word	0x89a01924	! t0_kref+0x81c:   	fstod	%f4, %f4
	.word	0x89a01924	! t0_kref+0x820:   	fstod	%f4, %f4
	.word	0x94f80000	! t0_kref+0x824:   	sdivcc	%g0, %g0, %o2
	.word	0x90100000	! t0_kref+0x828:   	clr	%o0
	.word	0x89a10824	! t0_kref+0x82c:   	fadds	%f4, %f4, %f4
	.word	0x92d80000	! t0_kref+0x830:   	smulcc	%g0, %g0, %o1
	.word	0x89b10664	! t0_kref+0x834:   	fmul8x16au	%f4, %f4, %f4
	.word	0xc010a01e	! t0_kref+0x838:   	lduh	[%g2 + 0x1e], %g0
	.word	0xd01f4019	! t0_kref+0x83c:   	ldd	[%i5 + %i1], %o0
	.word	0xe41e7fe0	! t0_kref+0x840:   	ldd	[%i1 - 0x20], %l2
	.word	0x94100000	! t0_kref+0x844:   	clr	%o2
	.word	0xe09e101d	! t0_kref+0x848:   	ldda	[%i0 + %i5]0x80, %l0
	.word	0xd65e4000	! t0_kref+0x84c:   	ldx	[%i1], %o3
	.word	0x89a000a4	! t0_kref+0x850:   	fnegs	%f4, %f4
	.word	0xc0070019	! t0_kref+0x854:   	ld	[%i4 + %i1], %g0
	.word	0xde50a010	! t0_kref+0x858:   	ldsh	[%g2 + 0x10], %o7
	.word	0x9b300000	! t0_kref+0x85c:   	srl	%g0, %g0, %o5
	.word	0x2a480008	! t0_kref+0x860:   	bcs,a,pt	%icc, _kref+0x880
	.word	0x89a109c4	! t0_kref+0x864:   	fdivd	%f4, %f4, %f4
	.word	0xaec03c6e	! t0_kref+0x868:   	addccc	%g0, -0x392, %l7
	.word	0x89b00764	! t0_kref+0x86c:   	fpack16	%f4, %f4
	.word	0x89b10f84	! t0_kref+0x870:   	for	%f4, %f4, %f4
	.word	0x96a80000	! t0_kref+0x874:   	andncc	%g0, %g0, %o3
	.word	0x92d00000	! t0_kref+0x878:   	umulcc	%g0, %g0, %o1
	.word	0x98a80000	! t0_kref+0x87c:   	andncc	%g0, %g0, %o4
	.word	0xc920a014	! t0_kref+0x880:   	st	%f4, [%g2 + 0x14]
	.word	0x94a00000	! t0_kref+0x884:   	subcc	%g0, %g0, %o2
	.word	0x89a10844	! t0_kref+0x888:   	faddd	%f4, %f4, %f4
	.word	0x89b106a4	! t0_kref+0x88c:   	fmul8x16al	%f4, %f4, %f4
	.word	0x86102001	! t0_kref+0x890:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x894:   	bne,a	_kref+0x894
	.word	0x86a0e001	! t0_kref+0x898:   	subcc	%g3, 1, %g3
	.word	0x9af80000	! t0_kref+0x89c:   	sdivcc	%g0, %g0, %o5
	.word	0xb4102018	! t0_kref+0x8a0:   	mov	0x18, %i2
	.word	0xd4066008	! t0_kref+0x8a4:   	ld	[%i1 + 8], %o2
	.word	0x91b10504	! t0_kref+0x8a8:   	fcmpgt16	%f4, %f4, %o0
	.word	0x81a90ac4	! t0_kref+0x8ac:   	fcmped	%fcc0, %f4, %f4
	.word	0x8143c000	! t0_kref+0x8b0:   	stbar
	.word	0x36800006	! t0_kref+0x8b4:   	bge,a	_kref+0x8cc
	.word	0x89b107c4	! t0_kref+0x8b8:   	pdist	%f4, %f4, %f4
	.word	0x89a01904	! t0_kref+0x8bc:   	fitod	%f4, %f4
	.word	0x89b10ca4	! t0_kref+0x8c0:   	fandnot2s	%f4, %f4, %f4
	.word	0x9b400000	! t0_kref+0x8c4:   	mov	%y, %o5
	.word	0x97200000	! t0_kref+0x8c8:   	mulscc	%g0, %g0, %o3
	.word	0x81df0015	! t0_kref+0x8cc:   	flush	%i4 + %l5
	.word	0xae180000	! t0_kref+0x8d0:   	xor	%g0, %g0, %l7
	.word	0x94c03574	! t0_kref+0x8d4:   	addccc	%g0, -0xa8c, %o2
	.word	0xc9be1a5c	! t0_kref+0x8d8:   	stda	%f4, [%i0 + %i4]0xd2
	.word	0x9e000000	! t0_kref+0x8dc:   	add	%g0, %g0, %o7
	.word	0x89a00124	! t0_kref+0x8e0:   	fabss	%f4, %f4
	.word	0x86102015	! t0_kref+0x8e4:   	mov	0x15, %g3
	.word	0x86a0e001	! t0_kref+0x8e8:   	subcc	%g3, 1, %g3
	.word	0x2280000b	! t0_kref+0x8ec:   	be,a	_kref+0x918
	.word	0x95b10484	! t0_kref+0x8f0:   	fcmple32	%f4, %f4, %o2
	.word	0x89b10aa4	! t0_kref+0x8f4:   	fpsub16s	%f4, %f4, %f4
	.word	0x3c480002	! t0_kref+0x8f8:   	bpos,a,pt	%icc, _kref+0x900
	.word	0xc030a004	! t0_kref+0x8fc:   	clrh	[%g2 + 4]
	.word	0x89a01924	! t0_kref+0x900:   	fstod	%f4, %f4
	.word	0xe16e7fe0	! t0_kref+0x904:   	prefetch	%i1 - 0x20, 16
	.word	0x90b00000	! t0_kref+0x908:   	orncc	%g0, %g0, %o0
	.word	0xd8080018	! t0_kref+0x90c:   	ldub	[%g0 + %i0], %o4
	.word	0x89a10924	! t0_kref+0x910:   	fmuls	%f4, %f4, %f4
	.word	0x89a01904	! t0_kref+0x914:   	fitod	%f4, %f4
	.word	0x89a109a4	! t0_kref+0x918:   	fdivs	%f4, %f4, %f4
	.word	0x89b10ec4	! t0_kref+0x91c:   	fornot2	%f4, %f4, %f4
	.word	0xc0200019	! t0_kref+0x920:   	clr	[%g0 + %i1]
	.word	0x81580000	! t0_kref+0x924:   	flushw
	.word	0x89a108c4	! t0_kref+0x928:   	fsubd	%f4, %f4, %f4
	.word	0x89b10744	! t0_kref+0x92c:   	fpack32	%f4, %f4, %f4
	.word	0x80b825c5	! t0_kref+0x930:   	xnorcc	%g0, 0x5c5, %g0
	.word	0x20800002	! t0_kref+0x934:   	bn,a	_kref+0x93c
	.word	0xc9067fe0	! t0_kref+0x938:   	ld	[%i1 - 0x20], %f4
	.word	0x80202c70	! t0_kref+0x93c:   	sub	%g0, 0xc70, %g0
	.word	0x20800001	! t0_kref+0x940:   	bn,a	_kref+0x944
	.word	0xc040a030	! t0_kref+0x944:   	ldsw	[%g2 + 0x30], %g0
	.word	0x89b10c84	! t0_kref+0x948:   	fandnot2	%f4, %f4, %f4
	.word	0xee4e8019	! t0_kref+0x94c:   	ldsb	[%i2 + %i1], %l7
	.word	0x89a10944	! t0_kref+0x950:   	fmuld	%f4, %f4, %f4
	.word	0x89a94024	! t0_kref+0x954:   	fmovsug	%fcc0, %f4, %f4
	.word	0x24800007	! t0_kref+0x958:   	ble,a	_kref+0x974
	.word	0x90500000	! t0_kref+0x95c:   	umul	%g0, %g0, %o0
	.word	0x90d02f65	! t0_kref+0x960:   	umulcc	%g0, 0xf65, %o0
	call	SYM(t0_subr3)
	.word	0xa0500000	! t0_kref+0x968:   	umul	%g0, %g0, %l0
	.word	0x98000000	! t0_kref+0x96c:   	add	%g0, %g0, %o4
	.word	0x96b00000	! t0_kref+0x970:   	orncc	%g0, %g0, %o3
	.word	0x89a10924	! t0_kref+0x974:   	fmuls	%f4, %f4, %f4
	.word	0x9f203244	! t0_kref+0x978:   	mulscc	%g0, -0xdbc, %o7
	.word	0xe0be501d	! t0_kref+0x97c:   	stda	%l0, [%i1 + %i5]0x80
	.word	0x89b10e64	! t0_kref+0x980:   	fxnors	%f4, %f4, %f4
	.word	0x9ed83b85	! t0_kref+0x984:   	smulcc	%g0, -0x47b, %o7
	.word	0xc028a019	! t0_kref+0x988:   	clrb	[%g2 + 0x19]
	.word	0x96a80000	! t0_kref+0x98c:   	andncc	%g0, %g0, %o3
	.word	0x81a90a24	! t0_kref+0x990:   	fcmps	%fcc0, %f4, %f4
	.word	0x8143c000	! t0_kref+0x994:   	stbar
	.word	0x9fc00004	! t0_kref+0x998:   	call	%g0 + %g4
	.word	0xae703b5f	! t0_kref+0x99c:   	udiv	%g0, -0x4a1, %l7
	.word	0x93200000	! t0_kref+0x9a0:   	mulscc	%g0, %g0, %o1
	.word	0x91400000	! t0_kref+0x9a4:   	mov	%y, %o0
	.word	0x99b00100	! t0_kref+0x9a8:   	edge32	%g0, %g0, %o4
	.word	0x89a00124	! t0_kref+0x9ac:   	fabss	%f4, %f4
	.word	0x89a00524	! t0_kref+0x9b0:   	fsqrts	%f4, %f4
	.word	0xd03e4000	! t0_kref+0x9b4:   	std	%o0, [%i1]
	.word	0x9b200000	! t0_kref+0x9b8:   	mulscc	%g0, %g0, %o5
	.word	0x92702196	! t0_kref+0x9bc:   	udiv	%g0, 0x196, %o1
	.word	0x81b00140	! t0_kref+0x9c0:   	edge32l	%g0, %g0, %g0
	.word	0x89a108a4	! t0_kref+0x9c4:   	fsubs	%f4, %f4, %f4
	.word	0xc9266004	! t0_kref+0x9c8:   	st	%f4, [%i1 + 4]
	.word	0x80603571	! t0_kref+0x9cc:   	subc	%g0, -0xa8f, %g0
	.word	0x9fc10000	! t0_kref+0x9d0:   	call	%g4
	.word	0x96400000	! t0_kref+0x9d4:   	addc	%g0, %g0, %o3
	.word	0x89a108a4	! t0_kref+0x9d8:   	fsubs	%f4, %f4, %f4
	.word	0x89a108a4	! t0_kref+0x9dc:   	fsubs	%f4, %f4, %f4
	.word	0xc9063ff0	! t0_kref+0x9e0:   	ld	[%i0 - 0x10], %f4
	.word	0x89b10ea0	! t0_kref+0x9e4:   	fsrc1s	%f4, %f4
	.word	0x983033a9	! t0_kref+0x9e8:   	orn	%g0, -0xc57, %o4
	.word	0xc920a034	! t0_kref+0x9ec:   	st	%f4, [%g2 + 0x34]
	.word	0x96300000	! t0_kref+0x9f0:   	orn	%g0, %g0, %o3
	.word	0x89b10c44	! t0_kref+0x9f4:   	fnor	%f4, %f4, %f4
	.word	0xae200000	! t0_kref+0x9f8:   	neg	%g0, %l7
	.word	0xc0a01019	! t0_kref+0x9fc:   	sta	%g0, [%g0 + %i1]0x80
	.word	0x80080000	! t0_kref+0xa00:   	and	%g0, %g0, %g0
	.word	0x89a00044	! t0_kref+0xa04:   	fmovd	%f4, %f4
	.word	0x89a108c4	! t0_kref+0xa08:   	fsubd	%f4, %f4, %f4
	.word	0x80802a37	! t0_kref+0xa0c:   	addcc	%g0, 0xa37, %g0
	.word	0x89b10624	! t0_kref+0xa10:   	fmul8x16	%f4, %f4, %f4
	.word	0x91100000	! t0_kref+0xa14:   	taddcctv	%g0, %g0, %o0
	.word	0xc020a008	! t0_kref+0xa18:   	clr	[%g2 + 8]
	.word	0x89b10d84	! t0_kref+0xa1c:   	fxor	%f4, %f4, %f4
	.word	0x89a01904	! t0_kref+0xa20:   	fitod	%f4, %f4
	.word	0x9e9022fd	! t0_kref+0xa24:   	orcc	%g0, 0x2fd, %o7
	.word	0x81a90a24	! t0_kref+0xa28:   	fcmps	%fcc0, %f4, %f4
	.word	0xc900a010	! t0_kref+0xa2c:   	ld	[%g2 + 0x10], %f4
	.word	0x38800006	! t0_kref+0xa30:   	bgu,a	_kref+0xa48
	.word	0x81d83a8d	! t0_kref+0xa34:   	flush	%g0 - 0x573
	.word	0x89b10e44	! t0_kref+0xa38:   	fxnor	%f4, %f4, %f4
	.word	0xc91e7fe0	! t0_kref+0xa3c:   	ldd	[%i1 - 0x20], %f4
	.word	0xf36e3fe8	! t0_kref+0xa40:   	prefetch	%i0 - 0x18, 25
	.word	0xde00a038	! t0_kref+0xa44:   	ld	[%g2 + 0x38], %o7
	.word	0x89a00524	! t0_kref+0xa48:   	fsqrts	%f4, %f4
	.word	0xc368a00b	! t0_kref+0xa4c:   	prefetch	%g2 + 0xb, 1
	.word	0x912039c7	! t0_kref+0xa50:   	mulscc	%g0, -0x639, %o0
	.word	0x949826c2	! t0_kref+0xa54:   	xorcc	%g0, 0x6c2, %o2
	.word	0xc9be5a5c	! t0_kref+0xa58:   	stda	%f4, [%i1 + %i4]0xd2
	.word	0x89a01924	! t0_kref+0xa5c:   	fstod	%f4, %f4
	.word	0xc02e001a	! t0_kref+0xa60:   	clrb	[%i0 + %i2]
	.word	0x89a000a4	! t0_kref+0xa64:   	fnegs	%f4, %f4
	.word	0xfa16c000	! t0_kref+0xa68:   	lduh	[%i3], %i5
	.word	0x96a80000	! t0_kref+0xa6c:   	andncc	%g0, %g0, %o3
	.word	0x89a00124	! t0_kref+0xa70:   	fabss	%f4, %f4
	.word	0xc028a03d	! t0_kref+0xa74:   	clrb	[%g2 + 0x3d]
	.word	0xe81e7fe0	! t0_kref+0xa78:   	ldd	[%i1 - 0x20], %l4
	call	SYM(t0_subr2)
	.word	0xc028a028	! t0_kref+0xa80:   	clrb	[%g2 + 0x28]
	.word	0x89a10d24	! t0_kref+0xa84:   	fsmuld	%f4, %f4, %f4
	.word	0x91b00020	! t0_kref+0xa88:   	edge8n	%g0, %g0, %o0
	.word	0x89b10e44	! t0_kref+0xa8c:   	fxnor	%f4, %f4, %f4
	.word	0x89a00124	! t0_kref+0xa90:   	fabss	%f4, %f4
	.word	0x89a00044	! t0_kref+0xa94:   	fmovd	%f4, %f4
	.word	0x86102003	! t0_kref+0xa98:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0xa9c:   	bne,a	_kref+0xa9c
	.word	0x86a0e001	! t0_kref+0xaa0:   	subcc	%g3, 1, %g3
	.word	0x80900000	! t0_kref+0xaa4:   	tst	%g0
	.word	0x80183b90	! t0_kref+0xaa8:   	xor	%g0, -0x470, %g0
	.word	0x24800005	! t0_kref+0xaac:   	ble,a	_kref+0xac0
	.word	0xc906001c	! t0_kref+0xab0:   	ld	[%i0 + %i4], %f4
	.word	0xc020a028	! t0_kref+0xab4:   	clr	[%g2 + 0x28]
	.word	0x3a800002	! t0_kref+0xab8:   	bcc,a	_kref+0xac0
	.word	0x8143c000	! t0_kref+0xabc:   	stbar
	.word	0xafb10504	! t0_kref+0xac0:   	fcmpgt16	%f4, %f4, %l7
	.word	0xc02e7ff6	! t0_kref+0xac4:   	clrb	[%i1 - 0xa]
	.word	0x99280000	! t0_kref+0xac8:   	sll	%g0, %g0, %o4
	.word	0xa78023c8	! t0_kref+0xacc:   	mov	0x3c8, %gsr
	.word	0xeede1000	! t0_kref+0xad0:   	ldxa	[%i0]0x80, %l7
	.word	0xd0567ffa	! t0_kref+0xad4:   	ldsh	[%i1 - 6], %o0
	.word	0x89a108a4	! t0_kref+0xad8:   	fsubs	%f4, %f4, %f4
	.word	0xc030a000	! t0_kref+0xadc:   	clrh	[%g2]
	.word	0x89b00fe0	! t0_kref+0xae0:   	fones	%f4
	.word	0x80100000	! t0_kref+0xae4:   	clr	%g0
	.word	0xc02e8019	! t0_kref+0xae8:   	clrb	[%i2 + %i1]
	.word	0x89b10da4	! t0_kref+0xaec:   	fxors	%f4, %f4, %f4
	.word	0x90500000	! t0_kref+0xaf0:   	umul	%g0, %g0, %o0
	.word	0x9ea00000	! t0_kref+0xaf4:   	subcc	%g0, %g0, %o7
	.word	0x99280000	! t0_kref+0xaf8:   	sll	%g0, %g0, %o4
	call	SYM(t0_subr3)
	.word	0x99400000	! t0_kref+0xb00:   	mov	%y, %o4
	.word	0xc9865000	! t0_kref+0xb04:   	lda	[%i1]0x80, %f4
	.word	0x89b00c00	! t0_kref+0xb08:   	fzero	%f4
	.word	0x90500000	! t0_kref+0xb0c:   	umul	%g0, %g0, %o0
	.word	0x9ad80000	! t0_kref+0xb10:   	smulcc	%g0, %g0, %o5
	.word	0x90b03ad8	! t0_kref+0xb14:   	orncc	%g0, -0x528, %o0
	.word	0xde50a034	! t0_kref+0xb18:   	ldsh	[%g2 + 0x34], %o7
	.word	0x89a00124	! t0_kref+0xb1c:   	fabss	%f4, %f4
	.word	0xd200a004	! t0_kref+0xb20:   	ld	[%g2 + 4], %o1
	.word	0x8098367d	! t0_kref+0xb24:   	xorcc	%g0, -0x983, %g0
	.word	0xc028a00a	! t0_kref+0xb28:   	clrb	[%g2 + 0xa]
	.word	0x89b00764	! t0_kref+0xb2c:   	fpack16	%f4, %f4
	.word	0xda000018	! t0_kref+0xb30:   	ld	[%g0 + %i0], %o5
	.word	0x89a10944	! t0_kref+0xb34:   	fmuld	%f4, %f4, %f4
	.word	0x89a108a4	! t0_kref+0xb38:   	fsubs	%f4, %f4, %f4
	.word	0x89a01884	! t0_kref+0xb3c:   	fitos	%f4, %f4
	.word	0x001fffff	! t0_kref+0xb40:   	illtrap	0x1fffff
	.word	0x9a500000	! t0_kref+0xb44:   	umul	%g0, %g0, %o5
	.word	0x98b82845	! t0_kref+0xb48:   	xnorcc	%g0, 0x845, %o4
	.word	0x9fc00004	! t0_kref+0xb4c:   	call	%g0 + %g4
	.word	0x98800000	! t0_kref+0xb50:   	addcc	%g0, %g0, %o4
	.word	0x9b302017	! t0_kref+0xb54:   	srl	%g0, 0x17, %o5
	.word	0xd40e7ff5	! t0_kref+0xb58:   	ldub	[%i1 - 0xb], %o2
	.word	0x9a302acf	! t0_kref+0xb5c:   	orn	%g0, 0xacf, %o5
	.word	0x89b10704	! t0_kref+0xb60:   	fmuld8sux16	%f4, %f4, %f4
	.word	0xc00e8018	! t0_kref+0xb64:   	ldub	[%i2 + %i0], %g0
	.word	0xc0270019	! t0_kref+0xb68:   	clr	[%i4 + %i1]
	.word	0x81d96a25	! t0_kref+0xb6c:   	flush	%g5 + 0xa25
	.word	0x89a000a4	! t0_kref+0xb70:   	fnegs	%f4, %f4
	.word	0x89b10a64	! t0_kref+0xb74:   	fpadd32s	%f4, %f4, %f4
	.word	0xae882426	! t0_kref+0xb78:   	andcc	%g0, 0x426, %l7
	.word	0x89a10824	! t0_kref+0xb7c:   	fadds	%f4, %f4, %f4
	.word	0x89a01084	! t0_kref+0xb80:   	fxtos	%f4, %f4
	.word	0x34800008	! t0_kref+0xb84:   	bg,a	_kref+0xba4
	.word	0x89b10d24	! t0_kref+0xb88:   	fandnot1s	%f4, %f4, %f4
	.word	0x89a00044	! t0_kref+0xb8c:   	fmovd	%f4, %f4
	.word	0x92180000	! t0_kref+0xb90:   	xor	%g0, %g0, %o1
	.word	0xe3f61000	! t0_kref+0xb94:   	casxa	[%i0]0x80, %g0, %l1
	.word	0xd2063ff4	! t0_kref+0xb98:   	ld	[%i0 - 0xc], %o1
	.word	0x9fc10000	! t0_kref+0xb9c:   	call	%g4
	.word	0xd86e2002	! t0_kref+0xba0:   	ldstub	[%i0 + 2], %o4
	.word	0x81a90aa4	! t0_kref+0xba4:   	fcmpes	%fcc0, %f4, %f4
	.word	0x89a108c4	! t0_kref+0xba8:   	fsubd	%f4, %f4, %f4
	call	SYM(t0_subr1)
	.word	0x89a10844	! t0_kref+0xbb0:   	faddd	%f4, %f4, %f4
	.word	0x3e800003	! t0_kref+0xbb4:   	bvc,a	_kref+0xbc0
	.word	0x89a108c4	! t0_kref+0xbb8:   	fsubd	%f4, %f4, %f4
	.word	0x98400000	! t0_kref+0xbbc:   	addc	%g0, %g0, %o4
	.word	0x89a10924	! t0_kref+0xbc0:   	fmuls	%f4, %f4, %f4
	.word	0x80a80000	! t0_kref+0xbc4:   	andncc	%g0, %g0, %g0
	.word	0xde063ffc	! t0_kref+0xbc8:   	ld	[%i0 - 4], %o7
	.word	0xae5028a2	! t0_kref+0xbcc:   	umul	%g0, 0x8a2, %l7
	.word	0x977038b9	! t0_kref+0xbd0:   	popc	-0x747, %o3
	.word	0x80b00000	! t0_kref+0xbd4:   	orncc	%g0, %g0, %g0
	.word	0x9de3bfa0	! t0_kref+0xbd8:   	save	%sp, -0x60, %sp
	.word	0xb60e236b	! t0_kref+0xbdc:   	and	%i0, 0x36b, %i3
	.word	0x9feea361	! t0_kref+0xbe0:   	restore	%i2, 0x361, %o7
	.word	0x9b302004	! t0_kref+0xbe4:   	srl	%g0, 0x4, %o5
	.word	0xd83e4000	! t0_kref+0xbe8:   	std	%o4, [%i1]
	.word	0xd856001b	! t0_kref+0xbec:   	ldsh	[%i0 + %i3], %o4
	.word	0x89a000a4	! t0_kref+0xbf0:   	fnegs	%f4, %f4
	.word	0xc920a024	! t0_kref+0xbf4:   	st	%f4, [%g2 + 0x24]
	.word	0xd208a027	! t0_kref+0xbf8:   	ldub	[%g2 + 0x27], %o1
	.word	0x89a00544	! t0_kref+0xbfc:   	fsqrtd	%f4, %f4
	.word	0x9aa0307f	! t0_kref+0xc00:   	subcc	%g0, -0xf81, %o5
	.word	0x34800001	! t0_kref+0xc04:   	bg,a	_kref+0xc08
	.word	0x89a01a44	! t0_kref+0xc08:   	fdtoi	%f4, %f4
	call	SYM(t0_subr2)
	.word	0xc807bfe8	! t0_kref+0xc10:   	ld	[%fp - 0x18], %g4
	.word	0xd60e8019	! t0_kref+0xc14:   	ldub	[%i2 + %i1], %o3
	.word	0xae502d5d	! t0_kref+0xc18:   	umul	%g0, 0xd5d, %l7
	.word	0x89a00124	! t0_kref+0xc1c:   	fabss	%f4, %f4
	.word	0xae380000	! t0_kref+0xc20:   	not	%g0, %l7
	.word	0x81a90aa4	! t0_kref+0xc24:   	fcmpes	%fcc0, %f4, %f4
	.word	0x9140c000	! t0_kref+0xc28:   	mov	%asi, %o0
	.word	0x9fb10504	! t0_kref+0xc2c:   	fcmpgt16	%f4, %f4, %o7
	.word	0x91100000	! t0_kref+0xc30:   	taddcctv	%g0, %g0, %o0
	.word	0xc91fbf68	! t0_kref+0xc34:   	ldd	[%fp - 0x98], %f4
	.word	0x89a10924	! t0_kref+0xc38:   	fmuls	%f4, %f4, %f4
	.word	0xc028a020	! t0_kref+0xc3c:   	clrb	[%g2 + 0x20]
	.word	0x89a108a4	! t0_kref+0xc40:   	fsubs	%f4, %f4, %f4
	.word	0xf16e001a	! t0_kref+0xc44:   	prefetch	%i0 + %i2, 24
	.word	0x80503e85	! t0_kref+0xc48:   	umul	%g0, -0x17b, %g0
	.word	0x001fffff	! t0_kref+0xc4c:   	illtrap	0x1fffff
	.word	0x81a90a24	! t0_kref+0xc50:   	fcmps	%fcc0, %f4, %f4
	.word	0x86102002	! t0_kref+0xc54:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0xc58:   	bne,a	_kref+0xc58
	.word	0x86a0e001	! t0_kref+0xc5c:   	subcc	%g3, 1, %g3
	.word	0x89b10ca4	! t0_kref+0xc60:   	fandnot2s	%f4, %f4, %f4
	.word	0xe96e001c	! t0_kref+0xc64:   	prefetch	%i0 + %i4, 20
	.word	0x89b10624	! t0_kref+0xc68:   	fmul8x16	%f4, %f4, %f4
	.word	0x38800006	! t0_kref+0xc6c:   	bgu,a	_kref+0xc84
	.word	0x89aa4044	! t0_kref+0xc70:   	fmovde	%fcc0, %f4, %f4
	.word	0x89b10964	! t0_kref+0xc74:   	fpmerge	%f4, %f4, %f4
	.word	0x89a10844	! t0_kref+0xc78:   	faddd	%f4, %f4, %f4
	.word	0x89a01904	! t0_kref+0xc7c:   	fitod	%f4, %f4
	.word	0x89a10844	! t0_kref+0xc80:   	faddd	%f4, %f4, %f4
	.word	0xee10a024	! t0_kref+0xc84:   	lduh	[%g2 + 0x24], %l7
	.word	0xee0e401a	! t0_kref+0xc88:   	ldub	[%i1 + %i2], %l7
	.word	0x89a01a44	! t0_kref+0xc8c:   	fdtoi	%f4, %f4
	.word	0x86102001	! t0_kref+0xc90:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0xc94:   	bne,a	_kref+0xc94
	.word	0x86a0e001	! t0_kref+0xc98:   	subcc	%g3, 1, %g3
	.word	0x32800003	! t0_kref+0xc9c:   	bne,a	_kref+0xca8
	.word	0x89a00124	! t0_kref+0xca0:   	fabss	%f4, %f4
	.word	0x8143c000	! t0_kref+0xca4:   	stbar
	.word	0x89a10844	! t0_kref+0xca8:   	faddd	%f4, %f4, %f4
	.word	0xc1ee5000	! t0_kref+0xcac:   	prefetcha	%i1, 0
	.word	0x96e00000	! t0_kref+0xcb0:   	subccc	%g0, %g0, %o3
	.word	0x95b10404	! t0_kref+0xcb4:   	fcmple16	%f4, %f4, %o2
	.word	0x3e800002	! t0_kref+0xcb8:   	bvc,a	_kref+0xcc0
	.word	0x89a10924	! t0_kref+0xcbc:   	fmuls	%f4, %f4, %f4
	.word	0x89a10844	! t0_kref+0xcc0:   	faddd	%f4, %f4, %f4
	.word	0xe3202e10	! t0_kref+0xcc4:   	st	%f17, [%g0 + 0xe10]
	.word	0x9a500000	! t0_kref+0xcc8:   	umul	%g0, %g0, %o5
	.word	0x81dfa6b7	! t0_kref+0xccc:   	flush	%fp + 0x6b7
	.word	0xc91fbea0	! t0_kref+0xcd0:   	ldd	[%fp - 0x160], %f4
	.word	0xc028a01b	! t0_kref+0xcd4:   	clrb	[%g2 + 0x1b]
	.word	0xc0262010	! t0_kref+0xcd8:   	clr	[%i0 + 0x10]
	.word	0xd83e2018	! t0_kref+0xcdc:   	std	%o4, [%i0 + 0x18]
	.word	0x89b10d24	! t0_kref+0xce0:   	fandnot1s	%f4, %f4, %f4
	.word	0x9a300000	! t0_kref+0xce4:   	orn	%g0, %g0, %o5
	.word	0x89a108c4	! t0_kref+0xce8:   	fsubd	%f4, %f4, %f4
	.word	0x80c00000	! t0_kref+0xcec:   	addccc	%g0, %g0, %g0
	.word	0x34480008	! t0_kref+0xcf0:   	bg,a,pt	%icc, _kref+0xd10
	.word	0xaf400000	! t0_kref+0xcf4:   	mov	%y, %l7
	.word	0xc91fbfd8	! t0_kref+0xcf8:   	ldd	[%fp - 0x28], %f4
	.word	0xd0bf5018	! t0_kref+0xcfc:   	stda	%o0, [%i5 + %i0]0x80
	.word	0xd610a012	! t0_kref+0xd00:   	lduh	[%g2 + 0x12], %o3
	.word	0x9b282010	! t0_kref+0xd04:   	sll	%g0, 0x10, %o5
	.word	0x89b10f44	! t0_kref+0xd08:   	fornot1	%f4, %f4, %f4
	.word	0xc900a008	! t0_kref+0xd0c:   	ld	[%g2 + 8], %f4
	.word	0x89a000a4	! t0_kref+0xd10:   	fnegs	%f4, %f4
	.word	0x9f414000	! t0_kref+0xd14:   	mov	%pc, %o7
	.word	0x99400000	! t0_kref+0xd18:   	mov	%y, %o4
	.word	0x98900000	! t0_kref+0xd1c:   	orcc	%g0, %g0, %o4
	.word	0xc028a03c	! t0_kref+0xd20:   	clrb	[%g2 + 0x3c]
	.word	0xc028a00c	! t0_kref+0xd24:   	clrb	[%g2 + 0xc]
	.word	0x89a10824	! t0_kref+0xd28:   	fadds	%f4, %f4, %f4
	.word	0xd83e401d	! t0_kref+0xd2c:   	std	%o4, [%i1 + %i5]
	.word	0x89a01904	! t0_kref+0xd30:   	fitod	%f4, %f4
	.word	0x90500000	! t0_kref+0xd34:   	umul	%g0, %g0, %o0
	.word	0x89a10944	! t0_kref+0xd38:   	fmuld	%f4, %f4, %f4
	.word	0xc030a02a	! t0_kref+0xd3c:   	clrh	[%g2 + 0x2a]
	.word	0xc9000018	! t0_kref+0xd40:   	ld	[%g0 + %i0], %f4
	.word	0xd440a004	! t0_kref+0xd44:   	ldsw	[%g2 + 4], %o2
	.word	0x89a00524	! t0_kref+0xd48:   	fsqrts	%f4, %f4
	.word	0x9de3bfa0	! t0_kref+0xd4c:   	save	%sp, -0x60, %sp
	.word	0x9bef0000	! t0_kref+0xd50:   	restore	%i4, %g0, %o5
	call	SYM(t0_subr1)
	.word	0xa0983e84	! t0_kref+0xd58:   	xorcc	%g0, -0x17c, %l0
	.word	0xd610a01a	! t0_kref+0xd5c:   	lduh	[%g2 + 0x1a], %o3
	.word	0xc028a028	! t0_kref+0xd60:   	clrb	[%g2 + 0x28]
	.word	0xee7e600c	! t0_kref+0xd64:   	swap	[%i1 + 0xc], %l7
	.word	0x8143c000	! t0_kref+0xd68:   	stbar
	.word	0x81b10404	! t0_kref+0xd6c:   	fcmple16	%f4, %f4, %g0
	.word	0x99b00020	! t0_kref+0xd70:   	edge8n	%g0, %g0, %o4
	.word	0x89a109c4	! t0_kref+0xd74:   	fdivd	%f4, %f4, %f4
	.word	0x89a108a4	! t0_kref+0xd78:   	fsubs	%f4, %f4, %f4
	.word	0x91280000	! t0_kref+0xd7c:   	sll	%g0, %g0, %o0
	.word	0xec7e401c	! t0_kref+0xd80:   	swap	[%i1 + %i4], %l6
	.word	0xc99e101d	! t0_kref+0xd84:   	ldda	[%i0 + %i5]0x80, %f4
	.word	0x9fc00004	! t0_kref+0xd88:   	call	%g0 + %g4
	.word	0x8143c000	! t0_kref+0xd8c:   	stbar
	.word	0xaf30201b	! t0_kref+0xd90:   	srl	%g0, 0x1b, %l7
	.word	0x89a018c4	! t0_kref+0xd94:   	fdtos	%f4, %f4
	.word	0x89b00764	! t0_kref+0xd98:   	fpack16	%f4, %f4
	.word	0x89a000a4	! t0_kref+0xd9c:   	fnegs	%f4, %f4
	.word	0x89a00524	! t0_kref+0xda0:   	fsqrts	%f4, %f4
	.word	0x8143c000	! t0_kref+0xda4:   	stbar
	.word	0x9930200f	! t0_kref+0xda8:   	srl	%g0, 0xf, %o4
	.word	0xd896d018	! t0_kref+0xdac:   	lduha	[%i3 + %i0]0x80, %o4
	.word	0xc040a028	! t0_kref+0xdb0:   	ldsw	[%g2 + 0x28], %g0
	.word	0x38800005	! t0_kref+0xdb4:   	bgu,a	_kref+0xdc8
	.word	0xe81e2000	! t0_kref+0xdb8:   	ldd	[%i0], %l4
	.word	0x9e883f90	! t0_kref+0xdbc:   	andcc	%g0, -0x70, %o7
	.word	0x2a800005	! t0_kref+0xdc0:   	bcs,a	_kref+0xdd4
	.word	0xc9ee1000	! t0_kref+0xdc4:   	prefetcha	%i0, 4
	.word	0x89a108a4	! t0_kref+0xdc8:   	fsubs	%f4, %f4, %f4
	.word	0x89a108c4	! t0_kref+0xdcc:   	fsubd	%f4, %f4, %f4
	.word	0x9e183571	! t0_kref+0xdd0:   	xor	%g0, -0xa8f, %o7
	.word	0x32800003	! t0_kref+0xdd4:   	bne,a	_kref+0xde0
	.word	0xae003f3c	! t0_kref+0xdd8:   	add	%g0, -0xc4, %l7
	.word	0x99b105c4	! t0_kref+0xddc:   	fcmpeq32	%f4, %f4, %o4
	.word	0x30800005	! t0_kref+0xde0:   	ba,a	_kref+0xdf4
	.word	0xd04e2017	! t0_kref+0xde4:   	ldsb	[%i0 + 0x17], %o0
	.word	0x89b10ae4	! t0_kref+0xde8:   	fpsub32s	%f4, %f4, %f4
	.word	0xc0280018	! t0_kref+0xdec:   	clrb	[%g0 + %i0]
	.word	0xd406401c	! t0_kref+0xdf0:   	ld	[%i1 + %i4], %o2
	.word	0xd2000018	! t0_kref+0xdf4:   	ld	[%g0 + %i0], %o1
	.word	0x89a00524	! t0_kref+0xdf8:   	fsqrts	%f4, %f4
	.word	0x97b00140	! t0_kref+0xdfc:   	edge32l	%g0, %g0, %o3
	.word	0x89a10824	! t0_kref+0xe00:   	fadds	%f4, %f4, %f4
	.word	0x30800001	! t0_kref+0xe04:   	ba,a	_kref+0xe08
	.word	0x91b10544	! t0_kref+0xe08:   	fcmpeq16	%f4, %f4, %o0
	.word	0x90d80000	! t0_kref+0xe0c:   	smulcc	%g0, %g0, %o0
	.word	0xd648a002	! t0_kref+0xe10:   	ldsb	[%g2 + 2], %o3
	.word	0xaef80000	! t0_kref+0xe14:   	sdivcc	%g0, %g0, %l7
	.word	0x89a00124	! t0_kref+0xe18:   	fabss	%f4, %f4
	.word	0x9ed02817	! t0_kref+0xe1c:   	umulcc	%g0, 0x817, %o7
	.word	0xda0e600e	! t0_kref+0xe20:   	ldub	[%i1 + 0xe], %o5
	.word	0x89a01044	! t0_kref+0xe24:   	fdtox	%f4, %f4
	.word	0xe83e4000	! t0_kref+0xe28:   	std	%l4, [%i1]
	.word	0xd440a028	! t0_kref+0xe2c:   	ldsw	[%g2 + 0x28], %o2
	.word	0xd008a00c	! t0_kref+0xe30:   	ldub	[%g2 + 0xc], %o0
	.word	0x94b825a4	! t0_kref+0xe34:   	xnorcc	%g0, 0x5a4, %o2
	.word	0xd4562004	! t0_kref+0xe38:   	ldsh	[%i0 + 4], %o2
	.word	0x97200000	! t0_kref+0xe3c:   	mulscc	%g0, %g0, %o3
	.word	0x89aac024	! t0_kref+0xe40:   	fmovsge	%fcc0, %f4, %f4
	.word	0xc030a012	! t0_kref+0xe44:   	clrh	[%g2 + 0x12]
	.word	0x32800005	! t0_kref+0xe48:   	bne,a	_kref+0xe5c
	.word	0x89a10844	! t0_kref+0xe4c:   	faddd	%f4, %f4, %f4
	.word	0x90d80000	! t0_kref+0xe50:   	smulcc	%g0, %g0, %o0
	.word	0x89b10fa4	! t0_kref+0xe54:   	fors	%f4, %f4, %f4
	.word	0xc807bfe8	! t0_kref+0xe58:   	ld	[%fp - 0x18], %g4
	.word	0x89a108c4	! t0_kref+0xe5c:   	fsubd	%f4, %f4, %f4
	.word	0xc920a030	! t0_kref+0xe60:   	st	%f4, [%g2 + 0x30]
	.word	0xafb000a0	! t0_kref+0xe64:   	edge16n	%g0, %g0, %l7
	.word	0x96080000	! t0_kref+0xe68:   	and	%g0, %g0, %o3
	.word	0x22800003	! t0_kref+0xe6c:   	be,a	_kref+0xe78
	.word	0x001fffff	! t0_kref+0xe70:   	illtrap	0x1fffff
	.word	0x24800007	! t0_kref+0xe74:   	ble,a	_kref+0xe90
	.word	0xc91fbc18	! t0_kref+0xe78:   	ldd	[%fp - 0x3e8], %f4
	.word	0x97202df7	! t0_kref+0xe7c:   	mulscc	%g0, 0xdf7, %o3
	.word	0x89ab4024	! t0_kref+0xe80:   	fmovsle	%fcc0, %f4, %f4
	.word	0x96203c36	! t0_kref+0xe84:   	sub	%g0, -0x3ca, %o3
	.word	0x89a00524	! t0_kref+0xe88:   	fsqrts	%f4, %f4
	.word	0x81da0001	! t0_kref+0xe8c:   	flush	%o0 + %g1
	.word	0xc9be1a1a	! t0_kref+0xe90:   	stda	%f4, [%i0 + %i2]0xd0
	.word	0xc9180019	! t0_kref+0xe94:   	ldd	[%g0 + %i1], %f4
	.word	0xc0500019	! t0_kref+0xe98:   	ldsh	[%g0 + %i1], %g0
	.word	0xda0e8018	! t0_kref+0xe9c:   	ldub	[%i2 + %i0], %o5
	.word	0x89a01044	! t0_kref+0xea0:   	fdtox	%f4, %f4
	.word	0xe41e7ff8	! t0_kref+0xea4:   	ldd	[%i1 - 8], %l2
	.word	0x3a800001	! t0_kref+0xea8:   	bcc,a	_kref+0xeac
	.word	0x89b00c20	! t0_kref+0xeac:   	fzeros	%f4
	.word	0x89b00c00	! t0_kref+0xeb0:   	fzero	%f4
	.word	0x9ac00000	! t0_kref+0xeb4:   	addccc	%g0, %g0, %o5
	.word	0x81a90a44	! t0_kref+0xeb8:   	fcmpd	%fcc0, %f4, %f4
	.word	0x97b105c4	! t0_kref+0xebc:   	fcmpeq32	%f4, %f4, %o3
	.word	0x80880000	! t0_kref+0xec0:   	btst	%g0, %g0
	.word	0xc006200c	! t0_kref+0xec4:   	ld	[%i0 + 0xc], %g0
	.word	0x98600000	! t0_kref+0xec8:   	subc	%g0, %g0, %o4
	.word	0x9ee00000	! t0_kref+0xecc:   	subccc	%g0, %g0, %o7
	.word	0x91280000	! t0_kref+0xed0:   	sll	%g0, %g0, %o0
	.word	0x8143c000	! t0_kref+0xed4:   	stbar
	.word	0x81a90a44	! t0_kref+0xed8:   	fcmpd	%fcc0, %f4, %f4
	.word	0xc900a01c	! t0_kref+0xedc:   	ld	[%g2 + 0x1c], %f4
	.word	0x98d83c63	! t0_kref+0xee0:   	smulcc	%g0, -0x39d, %o4
	.word	0xaea80000	! t0_kref+0xee4:   	andncc	%g0, %g0, %l7
	.word	0xda080018	! t0_kref+0xee8:   	ldub	[%g0 + %i0], %o5
	.word	0xaed80000	! t0_kref+0xeec:   	smulcc	%g0, %g0, %l7
	.word	0x9b400000	! t0_kref+0xef0:   	mov	%y, %o5
	.word	0x99280000	! t0_kref+0xef4:   	sll	%g0, %g0, %o4
	.word	0x89a00524	! t0_kref+0xef8:   	fsqrts	%f4, %f4
	.word	0x35480002	! t0_kref+0xefc:   	fbue,a,pt	%fcc0, _kref+0xf04
	.word	0x95200000	! t0_kref+0xf00:   	mulscc	%g0, %g0, %o2
	.word	0xaf202b3a	! t0_kref+0xf04:   	mulscc	%g0, 0xb3a, %l7
	.word	0x9fc10000	! t0_kref+0xf08:   	call	%g4
	.word	0x9aa83cb6	! t0_kref+0xf0c:   	andncc	%g0, -0x34a, %o5
	.word	0x89b10664	! t0_kref+0xf10:   	fmul8x16au	%f4, %f4, %f4
	.word	0x89a10844	! t0_kref+0xf14:   	faddd	%f4, %f4, %f4
	.word	0xc900a03c	! t0_kref+0xf18:   	ld	[%g2 + 0x3c], %f4
	.word	0x81b00080	! t0_kref+0xf1c:   	edge16	%g0, %g0, %g0
	.word	0xae000000	! t0_kref+0xf20:   	add	%g0, %g0, %l7
	.word	0xd03e0000	! t0_kref+0xf24:   	std	%o0, [%i0]
	.word	0xe1ee101a	! t0_kref+0xf28:   	prefetcha	%i0 + %i2, 16
	.word	0x89a00524	! t0_kref+0xf2c:   	fsqrts	%f4, %f4
	.word	0x97400000	! t0_kref+0xf30:   	mov	%y, %o3
	.word	0x89b10ca4	! t0_kref+0xf34:   	fandnot2s	%f4, %f4, %f4
	.word	0x8610200c	! t0_kref+0xf38:   	mov	0xc, %g3
	.word	0x86a0e001	! t0_kref+0xf3c:   	subcc	%g3, 1, %g3
	.word	0x2280001a	! t0_kref+0xf40:   	be,a	_kref+0xfa8
	.word	0xd85f4019	! t0_kref+0xf44:   	ldx	[%i5 + %i1], %o4
	.word	0x3c800001	! t0_kref+0xf48:   	bpos,a	_kref+0xf4c
	.word	0x96e032d5	! t0_kref+0xf4c:   	subccc	%g0, -0xd2b, %o3
	.word	0x89a10924	! t0_kref+0xf50:   	fmuls	%f4, %f4, %f4
	.word	0x89b10ca4	! t0_kref+0xf54:   	fandnot2s	%f4, %f4, %f4
	.word	0xc900a014	! t0_kref+0xf58:   	ld	[%g2 + 0x14], %f4
	.word	0x9aa8221c	! t0_kref+0xf5c:   	andncc	%g0, 0x21c, %o5
	.word	0x89b106c4	! t0_kref+0xf60:   	fmul8sux16	%f4, %f4, %f4
	.word	0xc91fbc08	! t0_kref+0xf64:   	ldd	[%fp - 0x3f8], %f4
	.word	0x38480004	! t0_kref+0xf68:   	bgu,a,pt	%icc, _kref+0xf78
	.word	0x9520252b	! t0_kref+0xf6c:   	mulscc	%g0, 0x52b, %o2
	.word	0xd4de501d	! t0_kref+0xf70:   	ldxa	[%i1 + %i5]0x80, %o2
	.word	0x80d82f81	! t0_kref+0xf74:   	smulcc	%g0, 0xf81, %g0
	.word	0xc91fbec8	! t0_kref+0xf78:   	ldd	[%fp - 0x138], %f4
	.word	0x89a01924	! t0_kref+0xf7c:   	fstod	%f4, %f4
	.word	0xc02e4000	! t0_kref+0xf80:   	clrb	[%i1]
	.word	0x89b10c44	! t0_kref+0xf84:   	fnor	%f4, %f4, %f4
	.word	0xf207bfe0	! t0_kref+0xf88:   	ld	[%fp - 0x20], %i1
	.word	0x9fc00004	! t0_kref+0xf8c:   	call	%g0 + %g4
	.word	0xa1400000	! t0_kref+0xf90:   	mov	%y, %l0
	.word	0x81a90ac4	! t0_kref+0xf94:   	fcmped	%fcc0, %f4, %f4
	.word	0x94903922	! t0_kref+0xf98:   	orcc	%g0, -0x6de, %o2
	.word	0x98a834cd	! t0_kref+0xf9c:   	andncc	%g0, -0xb33, %o4
	.word	0xec3f4018	! t0_kref+0xfa0:   	std	%l6, [%i5 + %i0]
	.word	0xd8d81018	! t0_kref+0xfa4:   	ldxa	[%g0 + %i0]0x80, %o4
	.word	0x99300000	! t0_kref+0xfa8:   	srl	%g0, %g0, %o4
	.word	0xd640a030	! t0_kref+0xfac:   	ldsw	[%g2 + 0x30], %o3
	.word	0xc9bf5a58	! t0_kref+0xfb0:   	stda	%f4, [%i5 + %i0]0xd2
	.word	0xc0262000	! t0_kref+0xfb4:   	clr	[%i0]
	.word	0x30800005	! t0_kref+0xfb8:   	ba,a	_kref+0xfcc
	.word	0xc807bfe8	! t0_kref+0xfbc:   	ld	[%fp - 0x18], %g4
	.word	0x93203725	! t0_kref+0xfc0:   	mulscc	%g0, -0x8db, %o1
	.word	0x89a00524	! t0_kref+0xfc4:   	fsqrts	%f4, %f4
	.word	0xc9200018	! t0_kref+0xfc8:   	st	%f4, [%g0 + %i0]
	.word	0x9f282007	! t0_kref+0xfcc:   	sll	%g0, 0x7, %o7
	.word	0xc91e4000	! t0_kref+0xfd0:   	ldd	[%i1], %f4
	.word	0x9a900000	! t0_kref+0xfd4:   	orcc	%g0, %g0, %o5
	.word	0x89a00124	! t0_kref+0xfd8:   	fabss	%f4, %f4
	.word	0x89a018c4	! t0_kref+0xfdc:   	fdtos	%f4, %f4
	.word	0x34800006	! t0_kref+0xfe0:   	bg,a	_kref+0xff8
	.word	0x89b10ea0	! t0_kref+0xfe4:   	fsrc1s	%f4, %f4
	.word	0x99b00060	! t0_kref+0xfe8:   	edge8ln	%g0, %g0, %o4
	.word	0xb410200c	! t0_kref+0xfec:   	mov	0xc, %i2
	.word	0xf248001a	! t0_kref+0xff0:   	ldsb	[%g0 + %i2], %i1
	.word	0x89a01a24	! t0_kref+0xff4:   	fstoi	%f4, %f4
	.word	0x26800007	! t0_kref+0xff8:   	bl,a	_kref+0x1014
	.word	0x81b00080	! t0_kref+0xffc:   	edge16	%g0, %g0, %g0
	.word	0x89a10924	! t0_kref+0x1000:   	fmuls	%f4, %f4, %f4
	.word	0xae8026a7	! t0_kref+0x1004:   	addcc	%g0, 0x6a7, %l7
	.word	0xc0264000	! t0_kref+0x1008:   	clr	[%i1]
	.word	0x89a00144	! t0_kref+0x100c:   	fabsd	%f4, %f4
	.word	0x89a10944	! t0_kref+0x1010:   	fmuld	%f4, %f4, %f4
	.word	0x86102001	! t0_kref+0x1014:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x1018:   	bne,a	_kref+0x1018
	.word	0x86a0e001	! t0_kref+0x101c:   	subcc	%g3, 1, %g3
	.word	0xc030a008	! t0_kref+0x1020:   	clrh	[%g2 + 8]
	.word	0x93400000	! t0_kref+0x1024:   	mov	%y, %o1
	.word	0x89a108c4	! t0_kref+0x1028:   	fsubd	%f4, %f4, %f4
	.word	0x8610201e	! t0_kref+0x102c:   	mov	0x1e, %g3
	.word	0x86a0e001	! t0_kref+0x1030:   	subcc	%g3, 1, %g3
	.word	0x2280001f	! t0_kref+0x1034:   	be,a	_kref+0x10b0
	.word	0x89a01924	! t0_kref+0x1038:   	fstod	%f4, %f4
	.word	0x3cbffffd	! t0_kref+0x103c:   	bpos,a	_kref+0x1030
	.word	0x97b00060	! t0_kref+0x1040:   	edge8ln	%g0, %g0, %o3
	.word	0xde4e401a	! t0_kref+0x1044:   	ldsb	[%i1 + %i2], %o7
	.word	0xc056601a	! t0_kref+0x1048:   	ldsh	[%i1 + 0x1a], %g0
	.word	0x94c0326c	! t0_kref+0x104c:   	addccc	%g0, -0xd94, %o2
	.word	0xe81f4018	! t0_kref+0x1050:   	ldd	[%i5 + %i0], %l4
	.word	0x89a00024	! t0_kref+0x1054:   	fmovs	%f4, %f4
	.word	0x89a00544	! t0_kref+0x1058:   	fsqrtd	%f4, %f4
	.word	0x89a108a4	! t0_kref+0x105c:   	fsubs	%f4, %f4, %f4
	.word	0x80d03864	! t0_kref+0x1060:   	umulcc	%g0, -0x79c, %g0
	.word	0xc030a004	! t0_kref+0x1064:   	clrh	[%g2 + 4]
	.word	0xc030a03e	! t0_kref+0x1068:   	clrh	[%g2 + 0x3e]
	.word	0x89a00524	! t0_kref+0x106c:   	fsqrts	%f4, %f4
	.word	0x98f83720	! t0_kref+0x1070:   	sdivcc	%g0, -0x8e0, %o4
	.word	0x89a10824	! t0_kref+0x1074:   	fadds	%f4, %f4, %f4
	.word	0x92502e20	! t0_kref+0x1078:   	umul	%g0, 0xe20, %o1
	.word	0xda08a01d	! t0_kref+0x107c:   	ldub	[%g2 + 0x1d], %o5
	.word	0x89b00f04	! t0_kref+0x1080:   	fsrc2	%f4, %f4
	.word	0x89a01904	! t0_kref+0x1084:   	fitod	%f4, %f4
	.word	0x89a00524	! t0_kref+0x1088:   	fsqrts	%f4, %f4
	.word	0x81db401d	! t0_kref+0x108c:   	flush	%o5 + %i5
	.word	0x001fffff	! t0_kref+0x1090:   	illtrap	0x1fffff
	.word	0x89a000a4	! t0_kref+0x1094:   	fnegs	%f4, %f4
	.word	0x96702cfd	! t0_kref+0x1098:   	udiv	%g0, 0xcfd, %o3
	.word	0x95b10544	! t0_kref+0x109c:   	fcmpeq16	%f4, %f4, %o2
	.word	0x89a10824	! t0_kref+0x10a0:   	fadds	%f4, %f4, %f4
	.word	0x9a703cae	! t0_kref+0x10a4:   	udiv	%g0, -0x352, %o5
	.word	0x9530200b	! t0_kref+0x10a8:   	srl	%g0, 0xb, %o2
	.word	0x89a01a44	! t0_kref+0x10ac:   	fdtoi	%f4, %f4
	.word	0xd440a034	! t0_kref+0x10b0:   	ldsw	[%g2 + 0x34], %o2
	.word	0x94f80000	! t0_kref+0x10b4:   	sdivcc	%g0, %g0, %o2
	.word	0xc9be9a18	! t0_kref+0x10b8:   	stda	%f4, [%i2 + %i0]0xd0
	.word	0xe3b8a080	! t0_kref+0x10bc:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xc9be1a1a	! t0_kref+0x10c0:   	stda	%f4, [%i0 + %i2]0xd0
	.word	0xc0ae501a	! t0_kref+0x10c4:   	stba	%g0, [%i1 + %i2]0x80
	.word	0xc99f5019	! t0_kref+0x10c8:   	ldda	[%i5 + %i1]0x80, %f4
	.word	0x9e600000	! t0_kref+0x10cc:   	subc	%g0, %g0, %o7
	.word	0xc0300019	! t0_kref+0x10d0:   	clrh	[%g0 + %i1]
	.word	0xd4500019	! t0_kref+0x10d4:   	ldsh	[%g0 + %i1], %o2
	.word	0x91b00000	! t0_kref+0x10d8:   	edge8	%g0, %g0, %o0
	.word	0xc0f81018	! t0_kref+0x10dc:   	swapa	[%g0 + %i0]0x80, %g0
	.word	0xb4103ff8	! t0_kref+0x10e0:   	mov	0xfffffff8, %i2
	.word	0x9fc00004	! t0_kref+0x10e4:   	call	%g0 + %g4
	.word	0x89b10ac4	! t0_kref+0x10e8:   	fpsub32	%f4, %f4, %f4
	.word	0xd00e8018	! t0_kref+0x10ec:   	ldub	[%i2 + %i0], %o0
	.word	0x89a00124	! t0_kref+0x10f0:   	fabss	%f4, %f4
	.word	0x38480006	! t0_kref+0x10f4:   	bgu,a,pt	%icc, _kref+0x110c
	.word	0x91b10484	! t0_kref+0x10f8:   	fcmple32	%f4, %f4, %o0
	.word	0x9fb10484	! t0_kref+0x10fc:   	fcmple32	%f4, %f4, %o7
	.word	0x9e080000	! t0_kref+0x1100:   	and	%g0, %g0, %o7
	.word	0x89a018c4	! t0_kref+0x1104:   	fdtos	%f4, %f4
	.word	0xd44e8019	! t0_kref+0x1108:   	ldsb	[%i2 + %i1], %o2
	.word	0x89a108c4	! t0_kref+0x110c:   	fsubd	%f4, %f4, %f4
	.word	0x24480006	! t0_kref+0x1110:   	ble,a,pt	%icc, _kref+0x1128
	.word	0x89a000a4	! t0_kref+0x1114:   	fnegs	%f4, %f4
	.word	0xc99f5018	! t0_kref+0x1118:   	ldda	[%i5 + %i0]0x80, %f4
	.word	0x81a90a44	! t0_kref+0x111c:   	fcmpd	%fcc0, %f4, %f4
	.word	0x9f302001	! t0_kref+0x1120:   	srl	%g0, 0x1, %o7
	.word	0xc920a008	! t0_kref+0x1124:   	st	%f4, [%g2 + 8]
	.word	0x89a000a4	! t0_kref+0x1128:   	fnegs	%f4, %f4
	.word	0x96f82db7	! t0_kref+0x112c:   	sdivcc	%g0, 0xdb7, %o3
	.word	0x94b00000	! t0_kref+0x1130:   	orncc	%g0, %g0, %o2
	.word	0xae000000	! t0_kref+0x1134:   	add	%g0, %g0, %l7
	.word	0x89a01a24	! t0_kref+0x1138:   	fstoi	%f4, %f4
	.word	0xc91e001d	! t0_kref+0x113c:   	ldd	[%i0 + %i5], %f4
	.word	0x81dcade8	! t0_kref+0x1140:   	flush	%l2 + 0xde8
	.word	0x9a10331f	! t0_kref+0x1144:   	mov	0xfffff31f, %o5
	.word	0xd00e2015	! t0_kref+0x1148:   	ldub	[%i0 + 0x15], %o0
	.word	0x89a01904	! t0_kref+0x114c:   	fitod	%f4, %f4
	.word	0x98983bd9	! t0_kref+0x1150:   	xorcc	%g0, -0x427, %o4
	.word	0x8143e014	! t0_kref+0x1154:   	membar	0x14
	.word	0xc036600c	! t0_kref+0x1158:   	clrh	[%i1 + 0xc]
	.word	0xae383cfe	! t0_kref+0x115c:   	xnor	%g0, -0x302, %l7
	.word	0x86102002	! t0_kref+0x1160:   	mov	0x2, %g3
	.word	0x86a0e001	! t0_kref+0x1164:   	subcc	%g3, 1, %g3
	.word	0x22800003	! t0_kref+0x1168:   	be,a	_kref+0x1174
	.word	0xd64e6005	! t0_kref+0x116c:   	ldsb	[%i1 + 5], %o3
	.word	0x98b02535	! t0_kref+0x1170:   	orncc	%g0, 0x535, %o4
	.word	0x89a000a4	! t0_kref+0x1174:   	fnegs	%f4, %f4
	.word	0x89b007a4	! t0_kref+0x1178:   	fpackfix	%f4, %f4
	.word	0x2c800003	! t0_kref+0x117c:   	bneg,a	_kref+0x1188
	.word	0xc0200018	! t0_kref+0x1180:   	clr	[%g0 + %i0]
	.word	0x81a90ac4	! t0_kref+0x1184:   	fcmped	%fcc0, %f4, %f4
	.word	0xec78a000	! t0_kref+0x1188:   	swap	[%g2], %l6
	.word	0x81300000	! t0_kref+0x118c:   	srl	%g0, %g0, %g0
	.word	0xfb6e7ff8	! t0_kref+0x1190:   	prefetch	%i1 - 8, 29
	.word	0xc9a71019	! t0_kref+0x1194:   	sta	%f4, [%i4 + %i1]0x80
	.word	0xd450a034	! t0_kref+0x1198:   	ldsh	[%g2 + 0x34], %o2
	.word	0x9fb00240	! t0_kref+0x119c:   	array16	%g0, %g0, %o7
	.word	0x27480004	! t0_kref+0x11a0:   	fbul,a,pt	%fcc0, _kref+0x11b0
	.word	0x89a01a44	! t0_kref+0x11a4:   	fdtoi	%f4, %f4
	.word	0x91b00040	! t0_kref+0x11a8:   	edge8l	%g0, %g0, %o0
	.word	0xc0b01019	! t0_kref+0x11ac:   	stha	%g0, [%g0 + %i1]0x80
	.word	0x81a90a44	! t0_kref+0x11b0:   	fcmpd	%fcc0, %f4, %f4
	.word	0x9ed0205f	! t0_kref+0x11b4:   	umulcc	%g0, 0x5f, %o7
	.word	0xc020a020	! t0_kref+0x11b8:   	clr	[%g2 + 0x20]
	.word	0xee10a03a	! t0_kref+0x11bc:   	lduh	[%g2 + 0x3a], %l7
	.word	0x97300000	! t0_kref+0x11c0:   	srl	%g0, %g0, %o3
	.word	0x98300000	! t0_kref+0x11c4:   	orn	%g0, %g0, %o4
	.word	0x9de3bfa0	! t0_kref+0x11c8:   	save	%sp, -0x60, %sp
	.word	0xbae64019	! t0_kref+0x11cc:   	subccc	%i1, %i1, %i5
	.word	0x81ee8018	! t0_kref+0x11d0:   	restore	%i2, %i0, %g0
	.word	0xc02e8018	! t0_kref+0x11d4:   	clrb	[%i2 + %i0]
	.word	0xc920a01c	! t0_kref+0x11d8:   	st	%f4, [%g2 + 0x1c]
	.word	0x81a90aa4	! t0_kref+0x11dc:   	fcmpes	%fcc0, %f4, %f4
	.word	0x89a10924	! t0_kref+0x11e0:   	fmuls	%f4, %f4, %f4
	.word	0xae382d84	! t0_kref+0x11e4:   	xnor	%g0, 0xd84, %l7
	.word	0x878020e0	! t0_kref+0x11e8:   	mov	0xe0, %asi
	.word	0xd2080018	! t0_kref+0x11ec:   	ldub	[%g0 + %i0], %o1
	.word	0x89a10844	! t0_kref+0x11f0:   	faddd	%f4, %f4, %f4
	.word	0x89b10e44	! t0_kref+0x11f4:   	fxnor	%f4, %f4, %f4
	.word	0xc04e7ff1	! t0_kref+0x11f8:   	ldsb	[%i1 - 0xf], %g0
	.word	0x81a90a44	! t0_kref+0x11fc:   	fcmpd	%fcc0, %f4, %f4
	.word	0xd696505b	! t0_kref+0x1200:   	lduha	[%i1 + %i3]0x82, %o3
	.word	0xae400000	! t0_kref+0x1204:   	addc	%g0, %g0, %l7
	.word	0x81a90a44	! t0_kref+0x1208:   	fcmpd	%fcc0, %f4, %f4
	.word	0xc02e8019	! t0_kref+0x120c:   	clrb	[%i2 + %i1]
	.word	0x961022b1	! t0_kref+0x1210:   	mov	0x2b1, %o3
	.word	0x89a10944	! t0_kref+0x1214:   	fmuld	%f4, %f4, %f4
	.word	0x26800006	! t0_kref+0x1218:   	bl,a	_kref+0x1230
	.word	0xe5ee101a	! t0_kref+0x121c:   	prefetcha	%i0 + %i2, 18
	.word	0x91200000	! t0_kref+0x1220:   	mulscc	%g0, %g0, %o0
	.word	0xc02e8019	! t0_kref+0x1224:   	clrb	[%i2 + %i1]
	.word	0x89a01904	! t0_kref+0x1228:   	fitod	%f4, %f4
	.word	0xde10a032	! t0_kref+0x122c:   	lduh	[%g2 + 0x32], %o7
	.word	0x89a00524	! t0_kref+0x1230:   	fsqrts	%f4, %f4
	.word	0x8143c000	! t0_kref+0x1234:   	stbar
	.word	0xd6d81018	! t0_kref+0x1238:   	ldxa	[%g0 + %i0]0x80, %o3
	.word	0xc028a023	! t0_kref+0x123c:   	clrb	[%g2 + 0x23]
	.word	0x9a800000	! t0_kref+0x1240:   	addcc	%g0, %g0, %o5
	.word	0x2a800008	! t0_kref+0x1244:   	bcs,a	_kref+0x1264
	.word	0xc9bf5a59	! t0_kref+0x1248:   	stda	%f4, [%i5 + %i1]0xd2
	.word	0x9bb000c0	! t0_kref+0x124c:   	edge16l	%g0, %g0, %o5
	.word	0xc91fbf40	! t0_kref+0x1250:   	ldd	[%fp - 0xc0], %f4
	.word	0x98e03582	! t0_kref+0x1254:   	subccc	%g0, -0xa7e, %o4
	.word	0x80603542	! t0_kref+0x1258:   	subc	%g0, -0xabe, %g0
	.word	0x34480001	! t0_kref+0x125c:   	bg,a,pt	%icc, _kref+0x1260
	.word	0x9080355f	! t0_kref+0x1260:   	addcc	%g0, -0xaa1, %o0
	.word	0x001fffff	! t0_kref+0x1264:   	illtrap	0x1fffff
	.word	0xc0ae101a	! t0_kref+0x1268:   	stba	%g0, [%i0 + %i2]0x80
	.word	0xc76e2010	! t0_kref+0x126c:   	prefetch	%i0 + 0x10, 3
	.word	0x89a108c4	! t0_kref+0x1270:   	fsubd	%f4, %f4, %f4
	.word	0x89a10944	! t0_kref+0x1274:   	fmuld	%f4, %f4, %f4
	.word	0x89b10d84	! t0_kref+0x1278:   	fxor	%f4, %f4, %f4
	.word	0xc0067ffc	! t0_kref+0x127c:   	ld	[%i1 - 4], %g0
	.word	0xc920a008	! t0_kref+0x1280:   	st	%f4, [%g2 + 8]
	.word	0x89a90044	! t0_kref+0x1284:   	fmovdl	%fcc0, %f4, %f4
	.word	0x89a10824	! t0_kref+0x1288:   	fadds	%f4, %f4, %f4
	.word	0x94800000	! t0_kref+0x128c:   	addcc	%g0, %g0, %o2
	.word	0x89b10de4	! t0_kref+0x1290:   	fnands	%f4, %f4, %f4
	.word	0x89a108a4	! t0_kref+0x1294:   	fsubs	%f4, %f4, %f4
	.word	0x9f282014	! t0_kref+0x1298:   	sll	%g0, 0x14, %o7
	.word	0x3c800002	! t0_kref+0x129c:   	bpos,a	_kref+0x12a4
	.word	0x89a10944	! t0_kref+0x12a0:   	fmuld	%f4, %f4, %f4
	.word	0x81800000	! t0_kref+0x12a4:   	mov	%g0, %y
	.word	0x86102004	! t0_kref+0x12a8:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x12ac:   	bne,a	_kref+0x12ac
	.word	0x86a0e001	! t0_kref+0x12b0:   	subcc	%g3, 1, %g3
	.word	0x89a00544	! t0_kref+0x12b4:   	fsqrtd	%f4, %f4
	.word	0xc0062008	! t0_kref+0x12b8:   	ld	[%i0 + 8], %g0
	.word	0x93b10504	! t0_kref+0x12bc:   	fcmpgt16	%f4, %f4, %o1
	.word	0x89a01884	! t0_kref+0x12c0:   	fitos	%f4, %f4
	.word	0x99b00000	! t0_kref+0x12c4:   	edge8	%g0, %g0, %o4
	.word	0xd610a01c	! t0_kref+0x12c8:   	lduh	[%g2 + 0x1c], %o3
	.word	0xc807bff0	! t0_kref+0x12cc:   	ld	[%fp - 0x10], %g4
	.word	0x89b10964	! t0_kref+0x12d0:   	fpmerge	%f4, %f4, %f4
	.word	0x81400000	! t0_kref+0x12d4:   	mov	%y, %g0
	.word	0xd01e7fe0	! t0_kref+0x12d8:   	ldd	[%i1 - 0x20], %o0
	.word	0x89a10824	! t0_kref+0x12dc:   	fadds	%f4, %f4, %f4
	.word	0x89a000a4	! t0_kref+0x12e0:   	fnegs	%f4, %f4
	.word	0x89a01a24	! t0_kref+0x12e4:   	fstoi	%f4, %f4
	.word	0xee80105c	! t0_kref+0x12e8:   	lda	[%g0 + %i4]0x82, %l7
	.word	0x96b00000	! t0_kref+0x12ec:   	orncc	%g0, %g0, %o3
	.word	0x89a000a4	! t0_kref+0x12f0:   	fnegs	%f4, %f4
	.word	0xd248a00b	! t0_kref+0x12f4:   	ldsb	[%g2 + 0xb], %o1
	.word	0xe81e2018	! t0_kref+0x12f8:   	ldd	[%i0 + 0x18], %l4
	.word	0x9e80292b	! t0_kref+0x12fc:   	addcc	%g0, 0x92b, %o7
	.word	0x89a108a4	! t0_kref+0x1300:   	fsubs	%f4, %f4, %f4
	.word	0xfdee101a	! t0_kref+0x1304:   	prefetcha	%i0 + %i2, 30
	.word	0x94a82758	! t0_kref+0x1308:   	andncc	%g0, 0x758, %o2
	.word	0x89a80024	! t0_kref+0x130c:   	fmovsn	%fcc0, %f4, %f4
	.word	0x800034f8	! t0_kref+0x1310:   	add	%g0, -0xb08, %g0
	.word	0x89b10ac4	! t0_kref+0x1314:   	fpsub32	%f4, %f4, %f4
	.word	0x997039f6	! t0_kref+0x1318:   	popc	-0x60a, %o4
	.word	0xc906200c	! t0_kref+0x131c:   	ld	[%i0 + 0xc], %f4
	.word	0xc0200019	! t0_kref+0x1320:   	clr	[%g0 + %i1]
	.word	0xc900a034	! t0_kref+0x1324:   	ld	[%g2 + 0x34], %f4
	.word	0xc920a020	! t0_kref+0x1328:   	st	%f4, [%g2 + 0x20]
	.word	0xd056401b	! t0_kref+0x132c:   	ldsh	[%i1 + %i3], %o0
	.word	0x81a90a44	! t0_kref+0x1330:   	fcmpd	%fcc0, %f4, %f4
	.word	0x22800006	! t0_kref+0x1334:   	be,a	_kref+0x134c
	.word	0x80a02ea6	! t0_kref+0x1338:   	cmp	%g0, 0xea6
	.word	0x8128200e	! t0_kref+0x133c:   	sll	%g0, 0xe, %g0
	.word	0xd810a016	! t0_kref+0x1340:   	lduh	[%g2 + 0x16], %o4
	.word	0x89a10844	! t0_kref+0x1344:   	faddd	%f4, %f4, %f4
	.word	0x81a90a44	! t0_kref+0x1348:   	fcmpd	%fcc0, %f4, %f4
	.word	0xc9070018	! t0_kref+0x134c:   	ld	[%i4 + %i0], %f4
	.word	0x89a00524	! t0_kref+0x1350:   	fsqrts	%f4, %f4
	.word	0xd0566012	! t0_kref+0x1354:   	ldsh	[%i1 + 0x12], %o0
	.word	0x8143c000	! t0_kref+0x1358:   	stbar
	.word	0xae800000	! t0_kref+0x135c:   	addcc	%g0, %g0, %l7
	.word	0x8143c000	! t0_kref+0x1360:   	stbar
	.word	0xc028a005	! t0_kref+0x1364:   	clrb	[%g2 + 5]
	.word	0xc91fbd48	! t0_kref+0x1368:   	ldd	[%fp - 0x2b8], %f4
	.word	0x96100000	! t0_kref+0x136c:   	clr	%o3
	.word	0xaed021a6	! t0_kref+0x1370:   	umulcc	%g0, 0x1a6, %l7
	.word	0x9e502513	! t0_kref+0x1374:   	umul	%g0, 0x513, %o7
	.word	0x2b800002	! t0_kref+0x1378:   	fbug,a	_kref+0x1380
	.word	0x96d034aa	! t0_kref+0x137c:   	umulcc	%g0, -0xb56, %o3
	.word	0xc91e4000	! t0_kref+0x1380:   	ldd	[%i1], %f4
	.word	0x9b302018	! t0_kref+0x1384:   	srl	%g0, 0x18, %o5
	.word	0x96700000	! t0_kref+0x1388:   	udiv	%g0, %g0, %o3
	.word	0x98c00000	! t0_kref+0x138c:   	addccc	%g0, %g0, %o4
	.word	0xaea822d1	! t0_kref+0x1390:   	andncc	%g0, 0x2d1, %l7
	.word	0x89a109c4	! t0_kref+0x1394:   	fdivd	%f4, %f4, %f4
	.word	0xc02e8019	! t0_kref+0x1398:   	clrb	[%i2 + %i1]
	.word	0x9b280000	! t0_kref+0x139c:   	sll	%g0, %g0, %o5
	.word	0x89b10904	! t0_kref+0x13a0:   	faligndata	%f4, %f4, %f4
	.word	0xae08204c	! t0_kref+0x13a4:   	and	%g0, 0x4c, %l7
	.word	0xd81e7ff8	! t0_kref+0x13a8:   	ldd	[%i1 - 8], %o4
	.word	0xc568a081	! t0_kref+0x13ac:   	prefetch	%g2 + 0x81, 2
	call	SYM(t0_subr0)
	.word	0xaf200000	! t0_kref+0x13b4:   	mulscc	%g0, %g0, %l7
	.word	0xe26e8018	! t0_kref+0x13b8:   	ldstub	[%i2 + %i0], %l1
	.word	0x89b10a24	! t0_kref+0x13bc:   	fpadd16s	%f4, %f4, %f4
	.word	0x92100000	! t0_kref+0x13c0:   	clr	%o1
	.word	0xc030a00c	! t0_kref+0x13c4:   	clrh	[%g2 + 0xc]
	.word	0x89a00124	! t0_kref+0x13c8:   	fabss	%f4, %f4
	.word	0x9f280000	! t0_kref+0x13cc:   	sll	%g0, %g0, %o7
	.word	0xc920a024	! t0_kref+0x13d0:   	st	%f4, [%g2 + 0x24]
	.word	0x89a01904	! t0_kref+0x13d4:   	fitod	%f4, %f4
	.word	0x96e00000	! t0_kref+0x13d8:   	subccc	%g0, %g0, %o3
	.word	0x80d03ae3	! t0_kref+0x13dc:   	umulcc	%g0, -0x51d, %g0
	.word	0x8143c000	! t0_kref+0x13e0:   	stbar
	.word	0xc020a024	! t0_kref+0x13e4:   	clr	[%g2 + 0x24]
	.word	0x30800001	! t0_kref+0x13e8:   	ba,a	_kref+0x13ec
	.word	0xe7ee501a	! t0_kref+0x13ec:   	prefetcha	%i1 + %i2, 19
	.word	0xc0267fe0	! t0_kref+0x13f0:   	clr	[%i1 - 0x20]
	.word	0xd83e6018	! t0_kref+0x13f4:   	std	%o4, [%i1 + 0x18]
	.word	0xebee501a	! t0_kref+0x13f8:   	prefetcha	%i1 + %i2, 21
	.word	0x89b00f24	! t0_kref+0x13fc:   	fsrc2s	%f4, %f4
	.word	0x9ad8310e	! t0_kref+0x1400:   	smulcc	%g0, -0xef2, %o5
	.word	0x89a109c4	! t0_kref+0x1404:   	fdivd	%f4, %f4, %f4
	.word	0x98c00000	! t0_kref+0x1408:   	addccc	%g0, %g0, %o4
	.word	0x92602435	! t0_kref+0x140c:   	subc	%g0, 0x435, %o1
	.word	0x81a90aa4	! t0_kref+0x1410:   	fcmpes	%fcc0, %f4, %f4
	.word	0x89a00544	! t0_kref+0x1414:   	fsqrtd	%f4, %f4
	.word	0x9de3bfa0	! t0_kref+0x1418:   	save	%sp, -0x60, %sp
	.word	0xb8672cf2	! t0_kref+0x141c:   	subc	%i4, 0xcf2, %i4
	.word	0xafee7d49	! t0_kref+0x1420:   	restore	%i1, -0x2b7, %l7
	.word	0x94400000	! t0_kref+0x1424:   	addc	%g0, %g0, %o2
	.word	0x151ae45c	! t0_kref+0x1428:   	sethi	%hi(0x6b917000), %o2
	.word	0x9fc00004	! t0_kref+0x142c:   	call	%g0 + %g4
	.word	0xf1ee101b	! t0_kref+0x1430:   	prefetcha	%i0 + %i3, 24
	.word	0x81b00020	! t0_kref+0x1434:   	edge8n	%g0, %g0, %g0
	.word	0x80180000	! t0_kref+0x1438:   	xor	%g0, %g0, %g0
	.word	0xae100000	! t0_kref+0x143c:   	clr	%l7
	.word	0x901037b2	! t0_kref+0x1440:   	mov	0xfffff7b2, %o0
	.word	0x89a01a24	! t0_kref+0x1444:   	fstoi	%f4, %f4
	.word	0x9a003222	! t0_kref+0x1448:   	add	%g0, -0xdde, %o5
	.word	0x97b00200	! t0_kref+0x144c:   	array8	%g0, %g0, %o3
	.word	0x81580000	! t0_kref+0x1450:   	flushw
	.word	0xae6036f5	! t0_kref+0x1454:   	subc	%g0, -0x90b, %l7
	.word	0xc91fbf60	! t0_kref+0x1458:   	ldd	[%fp - 0xa0], %f4
	.word	0xaf30200a	! t0_kref+0x145c:   	srl	%g0, 0xa, %l7
	.word	0x99400000	! t0_kref+0x1460:   	mov	%y, %o4
	.word	0xc920a01c	! t0_kref+0x1464:   	st	%f4, [%g2 + 0x1c]
	.word	0x89a108c4	! t0_kref+0x1468:   	fsubd	%f4, %f4, %f4
	.word	0xc07e7fe0	! t0_kref+0x146c:   	swap	[%i1 - 0x20], %g0
	.word	0xd41e3ff0	! t0_kref+0x1470:   	ldd	[%i0 - 0x10], %o2
	.word	0xd28e9019	! t0_kref+0x1474:   	lduba	[%i2 + %i1]0x80, %o1
	.word	0xe0180019	! t0_kref+0x1478:   	ldd	[%g0 + %i1], %l0
	.word	0xf007bfe0	! t0_kref+0x147c:   	ld	[%fp - 0x20], %i0
	.word	0xc030a016	! t0_kref+0x1480:   	clrh	[%g2 + 0x16]
	.word	0x89b00fe0	! t0_kref+0x1484:   	fones	%f4
	.word	0x94980000	! t0_kref+0x1488:   	xorcc	%g0, %g0, %o2
	.word	0x92603dce	! t0_kref+0x148c:   	subc	%g0, -0x232, %o1
	.word	0xd850a020	! t0_kref+0x1490:   	ldsh	[%g2 + 0x20], %o4
	.word	0x89a10924	! t0_kref+0x1494:   	fmuls	%f4, %f4, %f4
	.word	0xf207bfe0	! t0_kref+0x1498:   	ld	[%fp - 0x20], %i1
	.word	0x89b10e80	! t0_kref+0x149c:   	fsrc1	%f4, %f4
	.word	0xc9be1840	! t0_kref+0x14a0:   	stda	%f4, [%i0]0xc2
	.word	0x81a90a24	! t0_kref+0x14a4:   	fcmps	%fcc0, %f4, %f4
	.word	0xafb00020	! t0_kref+0x14a8:   	edge8n	%g0, %g0, %l7
	.word	0xea7e3fe0	! t0_kref+0x14ac:   	swap	[%i0 - 0x20], %l5
	.word	0x28480003	! t0_kref+0x14b0:   	bleu,a,pt	%icc, _kref+0x14bc
	.word	0xd00e2015	! t0_kref+0x14b4:   	ldub	[%i0 + 0x15], %o0
	.word	0x3c480007	! t0_kref+0x14b8:   	bpos,a,pt	%icc, _kref+0x14d4
	.word	0x89a00124	! t0_kref+0x14bc:   	fabss	%f4, %f4
	.word	0xc000a018	! t0_kref+0x14c0:   	ld	[%g2 + 0x18], %g0
	.word	0x97300000	! t0_kref+0x14c4:   	srl	%g0, %g0, %o3
	.word	0xfbee101b	! t0_kref+0x14c8:   	prefetcha	%i0 + %i3, 29
	.word	0x91b000a0	! t0_kref+0x14cc:   	edge16n	%g0, %g0, %o0
	.word	0x81a90a44	! t0_kref+0x14d0:   	fcmpd	%fcc0, %f4, %f4
	.word	0xc00e601b	! t0_kref+0x14d4:   	ldub	[%i1 + 0x1b], %g0
	.word	0x89b10724	! t0_kref+0x14d8:   	fmuld8ulx16	%f4, %f4, %f4
	.word	0x22800003	! t0_kref+0x14dc:   	be,a	_kref+0x14e8
	.word	0x94c00000	! t0_kref+0x14e0:   	addccc	%g0, %g0, %o2
	.word	0x80f80000	! t0_kref+0x14e4:   	sdivcc	%g0, %g0, %g0
	.word	0x94500000	! t0_kref+0x14e8:   	umul	%g0, %g0, %o2
	.word	0x89a00524	! t0_kref+0x14ec:   	fsqrts	%f4, %f4
	.word	0x99180000	! t0_kref+0x14f0:   	tsubcctv	%g0, %g0, %o4
	.word	0x98a8229b	! t0_kref+0x14f4:   	andncc	%g0, 0x29b, %o4
	.word	0x81580000	! t0_kref+0x14f8:   	flushw
	.word	0x3e800001	! t0_kref+0x14fc:   	bvc,a	_kref+0x1500
	.word	0x98603f18	! t0_kref+0x1500:   	subc	%g0, -0xe8, %o4
	.word	0xc91fbd08	! t0_kref+0x1504:   	ldd	[%fp - 0x2f8], %f4
	.word	0x89a00524	! t0_kref+0x1508:   	fsqrts	%f4, %f4
	.word	0x89a018c4	! t0_kref+0x150c:   	fdtos	%f4, %f4
	.word	0xda00a020	! t0_kref+0x1510:   	ld	[%g2 + 0x20], %o5
	.word	0x24800001	! t0_kref+0x1514:   	ble,a	_kref+0x1518
	.word	0x89a10844	! t0_kref+0x1518:   	faddd	%f4, %f4, %f4
	call	SYM(t0_subr3)
	.word	0x95b00040	! t0_kref+0x1520:   	edge8l	%g0, %g0, %o2
	.word	0x89a109a4	! t0_kref+0x1524:   	fdivs	%f4, %f4, %f4
	.word	0xd650a024	! t0_kref+0x1528:   	ldsh	[%g2 + 0x24], %o3
	.word	0xaf400000	! t0_kref+0x152c:   	mov	%y, %l7
	.word	0xda4e8019	! t0_kref+0x1530:   	ldsb	[%i2 + %i1], %o5
	.word	0x90e00000	! t0_kref+0x1534:   	subccc	%g0, %g0, %o0
	.word	0x94802a4f	! t0_kref+0x1538:   	addcc	%g0, 0xa4f, %o2
	.word	0x89a10824	! t0_kref+0x153c:   	fadds	%f4, %f4, %f4
	.word	0x30800007	! t0_kref+0x1540:   	ba,a	_kref+0x155c
	.word	0x92a80000	! t0_kref+0x1544:   	andncc	%g0, %g0, %o1
	.word	0x97b000a0	! t0_kref+0x1548:   	edge16n	%g0, %g0, %o3
	.word	0xc91fbc38	! t0_kref+0x154c:   	ldd	[%fp - 0x3c8], %f4
	.word	0xc920a008	! t0_kref+0x1550:   	st	%f4, [%g2 + 8]
	.word	0x89a10924	! t0_kref+0x1554:   	fmuls	%f4, %f4, %f4
	.word	0x34800002	! t0_kref+0x1558:   	bg,a	_kref+0x1560
	.word	0x9690312a	! t0_kref+0x155c:   	orcc	%g0, -0xed6, %o3
	.word	0x97b10584	! t0_kref+0x1560:   	fcmpgt32	%f4, %f4, %o3
	.word	0x89a018c4	! t0_kref+0x1564:   	fdtos	%f4, %f4
	.word	0x89a10844	! t0_kref+0x1568:   	faddd	%f4, %f4, %f4
	.word	0x89a000a4	! t0_kref+0x156c:   	fnegs	%f4, %f4
	.word	0x96980000	! t0_kref+0x1570:   	xorcc	%g0, %g0, %o3
	.word	0x97400000	! t0_kref+0x1574:   	mov	%y, %o3
	.word	0x90400000	! t0_kref+0x1578:   	addc	%g0, %g0, %o0
	.word	0x9ec00000	! t0_kref+0x157c:   	addccc	%g0, %g0, %o7
	.word	0x90300000	! t0_kref+0x1580:   	orn	%g0, %g0, %o0
	.word	0x89a01904	! t0_kref+0x1584:   	fitod	%f4, %f4
	.word	0x89a10944	! t0_kref+0x1588:   	fmuld	%f4, %f4, %f4
	.word	0x89b10664	! t0_kref+0x158c:   	fmul8x16au	%f4, %f4, %f4
	.word	0xc91fbca0	! t0_kref+0x1590:   	ldd	[%fp - 0x360], %f4
	.word	0xee067fec	! t0_kref+0x1594:   	ld	[%i1 - 0x14], %l7
	.word	0xd20e001a	! t0_kref+0x1598:   	ldub	[%i0 + %i2], %o1
	.word	0x81dd6dc1	! t0_kref+0x159c:   	flush	%l5 + 0xdc1
	.word	0x2c800006	! t0_kref+0x15a0:   	bneg,a	_kref+0x15b8
	.word	0xc920a038	! t0_kref+0x15a4:   	st	%f4, [%g2 + 0x38]
	.word	0x24800003	! t0_kref+0x15a8:   	ble,a	_kref+0x15b4
	.word	0xc91fbd48	! t0_kref+0x15ac:   	ldd	[%fp - 0x2b8], %f4
	.word	0xd2080018	! t0_kref+0x15b0:   	ldub	[%g0 + %i0], %o1
	.word	0x89a01a44	! t0_kref+0x15b4:   	fdtoi	%f4, %f4
	.word	0x86102003	! t0_kref+0x15b8:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x15bc:   	bne,a	_kref+0x15bc
	.word	0x86a0e001	! t0_kref+0x15c0:   	subcc	%g3, 1, %g3
	.word	0x89a01904	! t0_kref+0x15c4:   	fitod	%f4, %f4
	.word	0x89a018c4	! t0_kref+0x15c8:   	fdtos	%f4, %f4
	.word	0x89b10e24	! t0_kref+0x15cc:   	fands	%f4, %f4, %f4
	.word	0x9ec00000	! t0_kref+0x15d0:   	addccc	%g0, %g0, %o7
	.word	0xaef80000	! t0_kref+0x15d4:   	sdivcc	%g0, %g0, %l7
	.word	0x89a00524	! t0_kref+0x15d8:   	fsqrts	%f4, %f4
	.word	0x92300000	! t0_kref+0x15dc:   	orn	%g0, %g0, %o1
	.word	0x9aa02db4	! t0_kref+0x15e0:   	subcc	%g0, 0xdb4, %o5
	.word	0x9008238c	! t0_kref+0x15e4:   	and	%g0, 0x38c, %o0
	.word	0x92d83b07	! t0_kref+0x15e8:   	smulcc	%g0, -0x4f9, %o1
	.word	0x96d80000	! t0_kref+0x15ec:   	smulcc	%g0, %g0, %o3
	.word	0x89a10844	! t0_kref+0x15f0:   	faddd	%f4, %f4, %f4
	.word	0x98402274	! t0_kref+0x15f4:   	addc	%g0, 0x274, %o4
	.word	0x92d839de	! t0_kref+0x15f8:   	smulcc	%g0, -0x622, %o1
	.word	0xc920a038	! t0_kref+0x15fc:   	st	%f4, [%g2 + 0x38]
	.word	0xc9063fe8	! t0_kref+0x1600:   	ld	[%i0 - 0x18], %f4
	.word	0x91b10484	! t0_kref+0x1604:   	fcmple32	%f4, %f4, %o0
	.word	0x89a10824	! t0_kref+0x1608:   	fadds	%f4, %f4, %f4
	.word	0x92e02e95	! t0_kref+0x160c:   	subccc	%g0, 0xe95, %o1
	.word	0x89a108a4	! t0_kref+0x1610:   	fsubs	%f4, %f4, %f4
	.word	0xc920a01c	! t0_kref+0x1614:   	st	%f4, [%g2 + 0x1c]
	.word	0xc920a004	! t0_kref+0x1618:   	st	%f4, [%g2 + 4]
	.word	0xaf380000	! t0_kref+0x161c:   	sra	%g0, %g0, %l7
	.word	0xc0363ffc	! t0_kref+0x1620:   	clrh	[%i0 - 4]
	.word	0x9898212f	! t0_kref+0x1624:   	xorcc	%g0, 0x12f, %o4
	.word	0x985035cf	! t0_kref+0x1628:   	umul	%g0, -0xa31, %o4
	.word	0x89b00764	! t0_kref+0x162c:   	fpack16	%f4, %f4
	.word	0x8143c000	! t0_kref+0x1630:   	stbar
	.word	0x89a10824	! t0_kref+0x1634:   	fadds	%f4, %f4, %f4
	.word	0x89aa4024	! t0_kref+0x1638:   	fmovse	%fcc0, %f4, %f4
	.word	0x9de3bfa0	! t0_kref+0x163c:   	save	%sp, -0x60, %sp
	.word	0xb4a6401a	! t0_kref+0x1640:   	subcc	%i1, %i2, %i2
	.word	0x97eee5b6	! t0_kref+0x1644:   	restore	%i3, 0x5b6, %o3
	.word	0x9920251a	! t0_kref+0x1648:   	mulscc	%g0, 0x51a, %o4
	.word	0x34480008	! t0_kref+0x164c:   	bg,a,pt	%icc, _kref+0x166c
	.word	0xc010a006	! t0_kref+0x1650:   	lduh	[%g2 + 6], %g0
	.word	0xd43e4000	! t0_kref+0x1654:   	std	%o2, [%i1]
	.word	0x89a01884	! t0_kref+0x1658:   	fitos	%f4, %f4
	.word	0xc020a014	! t0_kref+0x165c:   	clr	[%g2 + 0x14]
	.word	0x89a10d24	! t0_kref+0x1660:   	fsmuld	%f4, %f4, %f4
	.word	0xd8df5019	! t0_kref+0x1664:   	ldxa	[%i5 + %i1]0x80, %o4
	.word	0x27480008	! t0_kref+0x1668:   	fbul,a,pt	%fcc0, _kref+0x1688
	.word	0x89a00524	! t0_kref+0x166c:   	fsqrts	%f4, %f4
	.word	0xda08001a	! t0_kref+0x1670:   	ldub	[%g0 + %i2], %o5
	.word	0x80a00000	! t0_kref+0x1674:   	cmp	%g0, %g0
	.word	0x98303f2d	! t0_kref+0x1678:   	orn	%g0, -0xd3, %o4
	.word	0x9b400000	! t0_kref+0x167c:   	mov	%y, %o5
	.word	0x81a90a44	! t0_kref+0x1680:   	fcmpd	%fcc0, %f4, %f4
	.word	0x89a10944	! t0_kref+0x1684:   	fmuld	%f4, %f4, %f4
	.word	0x980824de	! t0_kref+0x1688:   	and	%g0, 0x4de, %o4
	.word	0x89a10924	! t0_kref+0x168c:   	fmuls	%f4, %f4, %f4
	.word	0xd208a03a	! t0_kref+0x1690:   	ldub	[%g2 + 0x3a], %o1
	call	SYM(t0_subr1)
	.word	0x89a00524	! t0_kref+0x1698:   	fsqrts	%f4, %f4
	.word	0x89a10924	! t0_kref+0x169c:   	fmuls	%f4, %f4, %f4
	.word	0x90080000	! t0_kref+0x16a0:   	and	%g0, %g0, %o0
	.word	0x89a000a4	! t0_kref+0x16a4:   	fnegs	%f4, %f4
	.word	0xe3b8a080	! t0_kref+0x16a8:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x89b00c20	! t0_kref+0x16ac:   	fzeros	%f4
	.word	0xc9000018	! t0_kref+0x16b0:   	ld	[%g0 + %i0], %f4
	.word	0x8d803b7d	! t0_kref+0x16b4:   	mov	0xfffffb7d, %fprs
	.word	0x90d00000	! t0_kref+0x16b8:   	umulcc	%g0, %g0, %o0
	.word	0x89b107c4	! t0_kref+0x16bc:   	pdist	%f4, %f4, %f4
	.word	0xc920a018	! t0_kref+0x16c0:   	st	%f4, [%g2 + 0x18]
	.word	0x90302d74	! t0_kref+0x16c4:   	orn	%g0, 0xd74, %o0
	.word	0x81a90a44	! t0_kref+0x16c8:   	fcmpd	%fcc0, %f4, %f4
	.word	0x89a00144	! t0_kref+0x16cc:   	fabsd	%f4, %f4
	.word	0x92d037b5	! t0_kref+0x16d0:   	umulcc	%g0, -0x84b, %o1
	.word	0xe07e001c	! t0_kref+0x16d4:   	swap	[%i0 + %i4], %l0
	.word	0x38800007	! t0_kref+0x16d8:   	bgu,a	_kref+0x16f4
	.word	0x951020f0	! t0_kref+0x16dc:   	taddcctv	%g0, 0xf0, %o2
	.word	0x98b038b1	! t0_kref+0x16e0:   	orncc	%g0, -0x74f, %o4
	.word	0x966029b4	! t0_kref+0x16e4:   	subc	%g0, 0x9b4, %o3
	.word	0x89b107c4	! t0_kref+0x16e8:   	pdist	%f4, %f4, %f4
	.word	0x89a108a4	! t0_kref+0x16ec:   	fsubs	%f4, %f4, %f4
	.word	0x80100000	! t0_kref+0x16f0:   	clr	%g0
	.word	0x89a10924	! t0_kref+0x16f4:   	fmuls	%f4, %f4, %f4
	.word	0xd6567fe4	! t0_kref+0x16f8:   	ldsh	[%i1 - 0x1c], %o3
	.word	0xc0a81018	! t0_kref+0x16fc:   	stba	%g0, [%g0 + %i0]0x80
	.word	0x81d94013	! t0_kref+0x1700:   	flush	%g5 + %l3
	.word	0x89b00c00	! t0_kref+0x1704:   	fzero	%f4
	.word	0x93282003	! t0_kref+0x1708:   	sll	%g0, 0x3, %o1
	.word	0x95b00100	! t0_kref+0x170c:   	edge32	%g0, %g0, %o2
	.word	0xd01e2008	! t0_kref+0x1710:   	ldd	[%i0 + 8], %o0
	.word	0x89b00fe0	! t0_kref+0x1714:   	fones	%f4
	.word	0x8d80201e	! t0_kref+0x1718:   	mov	0x1e, %fprs
	.word	0x9e5826da	! t0_kref+0x171c:   	smul	%g0, 0x6da, %o7
	.word	0x86102018	! t0_kref+0x1720:   	mov	0x18, %g3
	.word	0x86a0e001	! t0_kref+0x1724:   	subcc	%g3, 1, %g3
	.word	0x2280000c	! t0_kref+0x1728:   	be,a	_kref+0x1758
	.word	0x89a10824	! t0_kref+0x172c:   	fadds	%f4, %f4, %f4
	.word	0x80500000	! t0_kref+0x1730:   	umul	%g0, %g0, %g0
	.word	0x91b00200	! t0_kref+0x1734:   	array8	%g0, %g0, %o0
	.word	0xc920a01c	! t0_kref+0x1738:   	st	%f4, [%g2 + 0x1c]
	.word	0x89a000a4	! t0_kref+0x173c:   	fnegs	%f4, %f4
	.word	0xc91fbce0	! t0_kref+0x1740:   	ldd	[%fp - 0x320], %f4
	.word	0x89a01a24	! t0_kref+0x1744:   	fstoi	%f4, %f4
	.word	0x81a90aa4	! t0_kref+0x1748:   	fcmpes	%fcc0, %f4, %f4
	.word	0x89b10ea0	! t0_kref+0x174c:   	fsrc1s	%f4, %f4
	.word	0x89b10e04	! t0_kref+0x1750:   	fand	%f4, %f4, %f4
	.word	0x81a90aa4	! t0_kref+0x1754:   	fcmpes	%fcc0, %f4, %f4
	.word	0x81a90a24	! t0_kref+0x1758:   	fcmps	%fcc0, %f4, %f4
	.word	0x98800000	! t0_kref+0x175c:   	addcc	%g0, %g0, %o4
	.word	0x9a80309d	! t0_kref+0x1760:   	addcc	%g0, -0xf63, %o5
	.word	0xc91f4018	! t0_kref+0x1764:   	ldd	[%i5 + %i0], %f4
	.word	0x89b106a4	! t0_kref+0x1768:   	fmul8x16al	%f4, %f4, %f4
	.word	0x89a90044	! t0_kref+0x176c:   	fmovdl	%fcc0, %f4, %f4
	.word	0xed6e3ff8	! t0_kref+0x1770:   	prefetch	%i0 - 8, 22
	.word	0xae502e9a	! t0_kref+0x1774:   	umul	%g0, 0xe9a, %l7
	.word	0x81a90a44	! t0_kref+0x1778:   	fcmpd	%fcc0, %f4, %f4
	.word	0x81b00160	! t0_kref+0x177c:   	edge32ln	%g0, %g0, %g0
	.word	0xc0480019	! t0_kref+0x1780:   	ldsb	[%g0 + %i1], %g0
	.word	0x94802f62	! t0_kref+0x1784:   	addcc	%g0, 0xf62, %o2
	.word	0x9fc00004	! t0_kref+0x1788:   	call	%g0 + %g4
	.word	0x89a00124	! t0_kref+0x178c:   	fabss	%f4, %f4
	.word	0xc028a025	! t0_kref+0x1790:   	clrb	[%g2 + 0x25]
	.word	0x89a01a44	! t0_kref+0x1794:   	fdtoi	%f4, %f4
	.word	0x89a10924	! t0_kref+0x1798:   	fmuls	%f4, %f4, %f4
	.word	0x92003c38	! t0_kref+0x179c:   	add	%g0, -0x3c8, %o1
	.word	0x89b10c44	! t0_kref+0x17a0:   	fnor	%f4, %f4, %f4
	.word	0x9e502424	! t0_kref+0x17a4:   	umul	%g0, 0x424, %o7
	.word	0x89b10964	! t0_kref+0x17a8:   	fpmerge	%f4, %f4, %f4
	.word	0x89a109c4	! t0_kref+0x17ac:   	fdivd	%f4, %f4, %f4
	.word	0xe41e0000	! t0_kref+0x17b0:   	ldd	[%i0], %l2
	.word	0x92d80000	! t0_kref+0x17b4:   	smulcc	%g0, %g0, %o1
	.word	0x89a10944	! t0_kref+0x17b8:   	fmuld	%f4, %f4, %f4
	.word	0x9e9827ae	! t0_kref+0x17bc:   	xorcc	%g0, 0x7ae, %o7
	.word	0xc91fbde8	! t0_kref+0x17c0:   	ldd	[%fp - 0x218], %f4
	.word	0xe0380019	! t0_kref+0x17c4:   	std	%l0, [%g0 + %i1]
	.word	0x99b00100	! t0_kref+0x17c8:   	edge32	%g0, %g0, %o4
	.word	0x9fb00340	! t0_kref+0x17cc:   	alignaddrl	%g0, %g0, %o7
	.word	0xc0a6501c	! t0_kref+0x17d0:   	sta	%g0, [%i1 + %i4]0x80
	.word	0x89a00524	! t0_kref+0x17d4:   	fsqrts	%f4, %f4
	.word	0x89a01924	! t0_kref+0x17d8:   	fstod	%f4, %f4
	.word	0x89a10824	! t0_kref+0x17dc:   	fadds	%f4, %f4, %f4
	.word	0x89b10f64	! t0_kref+0x17e0:   	fornot1s	%f4, %f4, %f4
	.word	0xde8e101a	! t0_kref+0x17e4:   	lduba	[%i0 + %i2]0x80, %o7
	.word	0xd656401b	! t0_kref+0x17e8:   	ldsh	[%i1 + %i3], %o3
	.word	0xaee00000	! t0_kref+0x17ec:   	subccc	%g0, %g0, %l7
	.word	0x9de3bfa0	! t0_kref+0x17f0:   	save	%sp, -0x60, %sp
	.word	0xb487401a	! t0_kref+0x17f4:   	addcc	%i5, %i2, %i2
	.word	0x81ef2b7b	! t0_kref+0x17f8:   	restore	%i4, 0xb7b, %g0
	call	SYM(t0_subr2)
	.word	0x89a01a24	! t0_kref+0x1800:   	fstoi	%f4, %f4
	.word	0x89a00524	! t0_kref+0x1804:   	fsqrts	%f4, %f4
	.word	0x98b00000	! t0_kref+0x1808:   	orncc	%g0, %g0, %o4
	.word	0x89a01a44	! t0_kref+0x180c:   	fdtoi	%f4, %f4
	.word	0x89b10624	! t0_kref+0x1810:   	fmul8x16	%f4, %f4, %f4
	.word	0x89a10944	! t0_kref+0x1814:   	fmuld	%f4, %f4, %f4
	.word	0xd80e8019	! t0_kref+0x1818:   	ldub	[%i2 + %i1], %o4
	.word	0x81dc800c	! t0_kref+0x181c:   	flush	%l2 + %o4
	.word	0x89b00c00	! t0_kref+0x1820:   	fzero	%f4
	.word	0xe41f4018	! t0_kref+0x1824:   	ldd	[%i5 + %i0], %l2
	.word	0x89b10ae4	! t0_kref+0x1828:   	fpsub32s	%f4, %f4, %f4
	.word	0xc0a65000	! t0_kref+0x182c:   	sta	%g0, [%i1]0x80
	.word	0x81a90ac4	! t0_kref+0x1830:   	fcmped	%fcc0, %f4, %f4
	.word	0xc030a038	! t0_kref+0x1834:   	clrh	[%g2 + 0x38]
	.word	0x9ad822c9	! t0_kref+0x1838:   	smulcc	%g0, 0x2c9, %o5
	.word	0x81a90ac4	! t0_kref+0x183c:   	fcmped	%fcc0, %f4, %f4
	.word	0xde08a01f	! t0_kref+0x1840:   	ldub	[%g2 + 0x1f], %o7
	.word	0x89b10724	! t0_kref+0x1844:   	fmuld8ulx16	%f4, %f4, %f4
	.word	0xd2fe101c	! t0_kref+0x1848:   	swapa	[%i0 + %i4]0x80, %o1
	.word	0x89a01a44	! t0_kref+0x184c:   	fdtoi	%f4, %f4
	.word	0x98800000	! t0_kref+0x1850:   	addcc	%g0, %g0, %o4
	.word	0x89aa8024	! t0_kref+0x1854:   	fmovsue	%fcc0, %f4, %f4
	.word	0x89a01924	! t0_kref+0x1858:   	fstod	%f4, %f4
	.word	0x89a109c4	! t0_kref+0x185c:   	fdivd	%f4, %f4, %f4
	.word	0x9e880000	! t0_kref+0x1860:   	andcc	%g0, %g0, %o7
	.word	0xc020a028	! t0_kref+0x1864:   	clr	[%g2 + 0x28]
	.word	0x28800001	! t0_kref+0x1868:   	bleu,a	_kref+0x186c
	.word	0x93b000c0	! t0_kref+0x186c:   	edge16l	%g0, %g0, %o1
	.word	0x9fc10000	! t0_kref+0x1870:   	call	%g4
	.word	0xe41e7ff8	! t0_kref+0x1874:   	ldd	[%i1 - 8], %l2
	.word	0x89a108c4	! t0_kref+0x1878:   	fsubd	%f4, %f4, %f4
	.word	0x969829fe	! t0_kref+0x187c:   	xorcc	%g0, 0x9fe, %o3
	.word	0x3e800008	! t0_kref+0x1880:   	bvc,a	_kref+0x18a0
	.word	0x89a109c4	! t0_kref+0x1884:   	fdivd	%f4, %f4, %f4
	.word	0x81b10404	! t0_kref+0x1888:   	fcmple16	%f4, %f4, %g0
	.word	0x92e0383a	! t0_kref+0x188c:   	subccc	%g0, -0x7c6, %o1
	.word	0x80400000	! t0_kref+0x1890:   	addc	%g0, %g0, %g0
	.word	0x9bb00000	! t0_kref+0x1894:   	edge8	%g0, %g0, %o5
	.word	0xda10a018	! t0_kref+0x1898:   	lduh	[%g2 + 0x18], %o5
	.word	0x98180000	! t0_kref+0x189c:   	xor	%g0, %g0, %o4
	.word	0x81a90aa4	! t0_kref+0x18a0:   	fcmpes	%fcc0, %f4, %f4
	.word	0x9b302010	! t0_kref+0x18a4:   	srl	%g0, 0x10, %o5
	.word	0xd09f5018	! t0_kref+0x18a8:   	ldda	[%i5 + %i0]0x80, %o0
	.word	0xc91fbe30	! t0_kref+0x18ac:   	ldd	[%fp - 0x1d0], %f4
	.word	0x9fc00004	! t0_kref+0x18b0:   	call	%g0 + %g4
	.word	0xa1200000	! t0_kref+0x18b4:   	mulscc	%g0, %g0, %l0
	.word	0x89a000a4	! t0_kref+0x18b8:   	fnegs	%f4, %f4
	.word	0xc020a02c	! t0_kref+0x18bc:   	clr	[%g2 + 0x2c]
	.word	0xc020a030	! t0_kref+0x18c0:   	clr	[%g2 + 0x30]
	.word	0x91302019	! t0_kref+0x18c4:   	srl	%g0, 0x19, %o0
	.word	0xc020a03c	! t0_kref+0x18c8:   	clr	[%g2 + 0x3c]
	.word	0xd448a01f	! t0_kref+0x18cc:   	ldsb	[%g2 + 0x1f], %o2
	.word	0xafb10484	! t0_kref+0x18d0:   	fcmple32	%f4, %f4, %l7
	.word	0xd4080019	! t0_kref+0x18d4:   	ldub	[%g0 + %i1], %o2
	.word	0x9890334c	! t0_kref+0x18d8:   	orcc	%g0, -0xcb4, %o4
	.word	0x9fc10000	! t0_kref+0x18dc:   	call	%g4
	.word	0x9a880000	! t0_kref+0x18e0:   	andcc	%g0, %g0, %o5
	.word	0xae880000	! t0_kref+0x18e4:   	andcc	%g0, %g0, %l7
	.word	0x9e800000	! t0_kref+0x18e8:   	addcc	%g0, %g0, %o7
	.word	0x89a108a4	! t0_kref+0x18ec:   	fsubs	%f4, %f4, %f4
	.word	0x9de3bfa0	! t0_kref+0x18f0:   	save	%sp, -0x60, %sp
	.word	0xb2e6b5b7	! t0_kref+0x18f4:   	subccc	%i2, -0xa49, %i1
	.word	0x97ee001c	! t0_kref+0x18f8:   	restore	%i0, %i4, %o3
	.word	0x81400000	! t0_kref+0x18fc:   	mov	%y, %g0
	.word	0x89a00524	! t0_kref+0x1900:   	fsqrts	%f4, %f4
	.word	0xc028a005	! t0_kref+0x1904:   	clrb	[%g2 + 5]
	.word	0x9de3bfa0	! t0_kref+0x1908:   	save	%sp, -0x60, %sp
	.word	0x8097001d	! t0_kref+0x190c:   	orcc	%i4, %i5, %g0
	.word	0x97ee0018	! t0_kref+0x1910:   	restore	%i0, %i0, %o3
	.word	0x9f28200b	! t0_kref+0x1914:   	sll	%g0, 0xb, %o7
	.word	0xd810a03c	! t0_kref+0x1918:   	lduh	[%g2 + 0x3c], %o4
	.word	0x89a108a4	! t0_kref+0x191c:   	fsubs	%f4, %f4, %f4
	.word	0x89a10824	! t0_kref+0x1920:   	fadds	%f4, %f4, %f4
	.word	0x9de3bfa0	! t0_kref+0x1924:   	save	%sp, -0x60, %sp
	.word	0xb2273884	! t0_kref+0x1928:   	sub	%i4, -0x77c, %i1
	.word	0xafe83a74	! t0_kref+0x192c:   	restore	%g0, -0x58c, %l7
	.word	0xc986101c	! t0_kref+0x1930:   	lda	[%i0 + %i4]0x80, %f4
	.word	0x89b107c4	! t0_kref+0x1934:   	pdist	%f4, %f4, %f4
	.word	0xc02e8018	! t0_kref+0x1938:   	clrb	[%i2 + %i0]
	.word	0x9de3bfa0	! t0_kref+0x193c:   	save	%sp, -0x60, %sp
	.word	0x99ef7e65	! t0_kref+0x1940:   	restore	%i5, -0x19b, %o4
	.word	0xc026401c	! t0_kref+0x1944:   	clr	[%i1 + %i4]
	.word	0x89b10a24	! t0_kref+0x1948:   	fpadd16s	%f4, %f4, %f4
	.word	0x96500000	! t0_kref+0x194c:   	umul	%g0, %g0, %o3
	.word	0xc91fbe58	! t0_kref+0x1950:   	ldd	[%fp - 0x1a8], %f4
	.word	0x17254af9	! t0_kref+0x1954:   	sethi	%hi(0x952be400), %o3
	.word	0xf36e7fe0	! t0_kref+0x1958:   	prefetch	%i1 - 0x20, 25
	.word	0x89a108c4	! t0_kref+0x195c:   	fsubd	%f4, %f4, %f4
	.word	0xd848a01d	! t0_kref+0x1960:   	ldsb	[%g2 + 0x1d], %o4
	.word	0x89b00fe0	! t0_kref+0x1964:   	fones	%f4
	.word	0xd6063ff0	! t0_kref+0x1968:   	ld	[%i0 - 0x10], %o3
	.word	0xc900a030	! t0_kref+0x196c:   	ld	[%g2 + 0x30], %f4
	.word	0x3c800004	! t0_kref+0x1970:   	bpos,a	_kref+0x1980
	.word	0x89a10824	! t0_kref+0x1974:   	fadds	%f4, %f4, %f4
	.word	0x8143c000	! t0_kref+0x1978:   	stbar
	.word	0xda00a038	! t0_kref+0x197c:   	ld	[%g2 + 0x38], %o5
	.word	0x80a8250e	! t0_kref+0x1980:   	andncc	%g0, 0x50e, %g0
	.word	0x86102003	! t0_kref+0x1984:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x1988:   	bne,a	_kref+0x1988
	.word	0x86a0e001	! t0_kref+0x198c:   	subcc	%g3, 1, %g3
	.word	0x001fffff	! t0_kref+0x1990:   	illtrap	0x1fffff
	.word	0x89a00544	! t0_kref+0x1994:   	fsqrtd	%f4, %f4
	.word	0x97400000	! t0_kref+0x1998:   	mov	%y, %o3
	.word	0x36800008	! t0_kref+0x199c:   	bge,a	_kref+0x19bc
	.word	0x89a00544	! t0_kref+0x19a0:   	fsqrtd	%f4, %f4
	.word	0x80e00000	! t0_kref+0x19a4:   	subccc	%g0, %g0, %g0
	.word	0x89a01904	! t0_kref+0x19a8:   	fitod	%f4, %f4
	.word	0x9fc10000	! t0_kref+0x19ac:   	call	%g4
	.word	0xc99e501d	! t0_kref+0x19b0:   	ldda	[%i1 + %i5]0x80, %f4
	.word	0x89a00524	! t0_kref+0x19b4:   	fsqrts	%f4, %f4
	.word	0xec9f5019	! t0_kref+0x19b8:   	ldda	[%i5 + %i1]0x80, %l6
	.word	0x32800008	! t0_kref+0x19bc:   	bne,a	_kref+0x19dc
	.word	0x89a01904	! t0_kref+0x19c0:   	fitod	%f4, %f4
	.word	0xaee02641	! t0_kref+0x19c4:   	subccc	%g0, 0x641, %l7
	.word	0x921833f5	! t0_kref+0x19c8:   	xor	%g0, -0xc0b, %o1
	.word	0x3e800003	! t0_kref+0x19cc:   	bvc,a	_kref+0x19d8
	.word	0x90c02b37	! t0_kref+0x19d0:   	addccc	%g0, 0xb37, %o0
	.word	0xc020a004	! t0_kref+0x19d4:   	clr	[%g2 + 4]
	.word	0x89b10fa4	! t0_kref+0x19d8:   	fors	%f4, %f4, %f4
	.word	0xc91fbe70	! t0_kref+0x19dc:   	ldd	[%fp - 0x190], %f4
	.word	0x89a00024	! t0_kref+0x19e0:   	fmovs	%f4, %f4
	.word	0x99280000	! t0_kref+0x19e4:   	sll	%g0, %g0, %o4
	.word	0x89a00544	! t0_kref+0x19e8:   	fsqrtd	%f4, %f4
	.word	0x98f82a38	! t0_kref+0x19ec:   	sdivcc	%g0, 0xa38, %o4
	.word	0xc0263fe8	! t0_kref+0x19f0:   	clr	[%i0 - 0x18]
	.word	0x9f100000	! t0_kref+0x19f4:   	taddcctv	%g0, %g0, %o7
	.word	0x93b000c0	! t0_kref+0x19f8:   	edge16l	%g0, %g0, %o1
	.word	0xc030a020	! t0_kref+0x19fc:   	clrh	[%g2 + 0x20]
	.word	0x91300000	! t0_kref+0x1a00:   	srl	%g0, %g0, %o0
	.word	0xc9871019	! t0_kref+0x1a04:   	lda	[%i4 + %i1]0x80, %f4
	.word	0xda100019	! t0_kref+0x1a08:   	lduh	[%g0 + %i1], %o5
	.word	0xaf644000	! t0_kref+0x1a0c:   	move	%icc, %g0, %l7
	.word	0x97b00340	! t0_kref+0x1a10:   	alignaddrl	%g0, %g0, %o3
	.word	0xd206001c	! t0_kref+0x1a14:   	ld	[%i0 + %i4], %o1
	.word	0x80400000	! t0_kref+0x1a18:   	addc	%g0, %g0, %g0
	.word	0xc0270018	! t0_kref+0x1a1c:   	clr	[%i4 + %i0]
	.word	0xe49e501d	! t0_kref+0x1a20:   	ldda	[%i1 + %i5]0x80, %l2
	.word	0x98200000	! t0_kref+0x1a24:   	neg	%g0, %o4
	.word	0x90600000	! t0_kref+0x1a28:   	subc	%g0, %g0, %o0
	.word	0x89a018c4	! t0_kref+0x1a2c:   	fdtos	%f4, %f4
	.word	0xec1e6010	! t0_kref+0x1a30:   	ldd	[%i1 + 0x10], %l6
	.word	0x94d80000	! t0_kref+0x1a34:   	smulcc	%g0, %g0, %o2
	.word	0x98e0376e	! t0_kref+0x1a38:   	subccc	%g0, -0x892, %o4
	.word	0xda48a035	! t0_kref+0x1a3c:   	ldsb	[%g2 + 0x35], %o5
	.word	0xc020a018	! t0_kref+0x1a40:   	clr	[%g2 + 0x18]
	.word	0x9ab00000	! t0_kref+0x1a44:   	orncc	%g0, %g0, %o5
	.word	0x86102012	! t0_kref+0x1a48:   	mov	0x12, %g3
	.word	0x86a0e001	! t0_kref+0x1a4c:   	subcc	%g3, 1, %g3
	.word	0x2280000d	! t0_kref+0x1a50:   	be,a	_kref+0x1a84
	.word	0x89a108c4	! t0_kref+0x1a54:   	fsubd	%f4, %f4, %f4
	.word	0xc0260000	! t0_kref+0x1a58:   	clr	[%i0]
	.word	0xaf400000	! t0_kref+0x1a5c:   	mov	%y, %l7
	.word	0x89a108c4	! t0_kref+0x1a60:   	fsubd	%f4, %f4, %f4
	.word	0x89a10944	! t0_kref+0x1a64:   	fmuld	%f4, %f4, %f4
	.word	0x99b105c4	! t0_kref+0x1a68:   	fcmpeq32	%f4, %f4, %o4
	.word	0xaf083e8d	! t0_kref+0x1a6c:   	tsubcc	%g0, -0x173, %l7
	.word	0xd60e601e	! t0_kref+0x1a70:   	ldub	[%i1 + 0x1e], %o3
	.word	0x81a90ac4	! t0_kref+0x1a74:   	fcmped	%fcc0, %f4, %f4
	.word	0x81a90aa4	! t0_kref+0x1a78:   	fcmpes	%fcc0, %f4, %f4
	.word	0x89a10824	! t0_kref+0x1a7c:   	fadds	%f4, %f4, %f4
	.word	0x96182c33	! t0_kref+0x1a80:   	xor	%g0, 0xc33, %o3
	.word	0x89a00124	! t0_kref+0x1a84:   	fabss	%f4, %f4
	.word	0x8143c000	! t0_kref+0x1a88:   	stbar
	.word	0x89a00524	! t0_kref+0x1a8c:   	fsqrts	%f4, %f4
	.word	0xc020a018	! t0_kref+0x1a90:   	clr	[%g2 + 0x18]
	.word	0x89a10924	! t0_kref+0x1a94:   	fmuls	%f4, %f4, %f4
	.word	0xd650a00c	! t0_kref+0x1a98:   	ldsh	[%g2 + 0xc], %o3
	.word	0x81a90aa4	! t0_kref+0x1a9c:   	fcmpes	%fcc0, %f4, %f4
	.word	0xee10a012	! t0_kref+0x1aa0:   	lduh	[%g2 + 0x12], %l7
	.word	0x2e800002	! t0_kref+0x1aa4:   	bvs,a	_kref+0x1aac
	.word	0x89a00524	! t0_kref+0x1aa8:   	fsqrts	%f4, %f4
	.word	0xc920a038	! t0_kref+0x1aac:   	st	%f4, [%g2 + 0x38]
	.word	0x89a018c4	! t0_kref+0x1ab0:   	fdtos	%f4, %f4
	.word	0x89a00124	! t0_kref+0x1ab4:   	fabss	%f4, %f4
	.word	0x80380000	! t0_kref+0x1ab8:   	not	%g0
	.word	0x91b00100	! t0_kref+0x1abc:   	edge32	%g0, %g0, %o0
	.word	0xc900a02c	! t0_kref+0x1ac0:   	ld	[%g2 + 0x2c], %f4
	.word	0xc020a030	! t0_kref+0x1ac4:   	clr	[%g2 + 0x30]
	.word	0x81a90ac4	! t0_kref+0x1ac8:   	fcmped	%fcc0, %f4, %f4
	.word	0x89a00124	! t0_kref+0x1acc:   	fabss	%f4, %f4
	call	SYM(t0_subr1)
	.word	0xd240a034	! t0_kref+0x1ad4:   	ldsw	[%g2 + 0x34], %o1
	.word	0x89a10924	! t0_kref+0x1ad8:   	fmuls	%f4, %f4, %f4
	.word	0xaec00000	! t0_kref+0x1adc:   	addccc	%g0, %g0, %l7
	.word	0x91300000	! t0_kref+0x1ae0:   	srl	%g0, %g0, %o0
	.word	0xc020a01c	! t0_kref+0x1ae4:   	clr	[%g2 + 0x1c]
	.word	0x89b10aa4	! t0_kref+0x1ae8:   	fpsub16s	%f4, %f4, %f4
	.word	0x9fc10000	! t0_kref+0x1aec:   	call	%g4
	.word	0x89b009a4	! t0_kref+0x1af0:   	fexpand	%f4, %f4
	.word	0x9e7824f3	! t0_kref+0x1af4:   	sdiv	%g0, 0x4f3, %o7
	.word	0x89a00524	! t0_kref+0x1af8:   	fsqrts	%f4, %f4
	.word	0xaea83b67	! t0_kref+0x1afc:   	andncc	%g0, -0x499, %l7
	.word	0x80f80000	! t0_kref+0x1b00:   	sdivcc	%g0, %g0, %g0
	.word	0x89a10824	! t0_kref+0x1b04:   	fadds	%f4, %f4, %f4
	.word	0x89a00524	! t0_kref+0x1b08:   	fsqrts	%f4, %f4
	.word	0xde0e8018	! t0_kref+0x1b0c:   	ldub	[%i2 + %i0], %o7
	.word	0xc9be5a1a	! t0_kref+0x1b10:   	stda	%f4, [%i1 + %i2]0xd0
	.word	0x89a84044	! t0_kref+0x1b14:   	fmovdne	%fcc0, %f4, %f4
	.word	0xda78a010	! t0_kref+0x1b18:   	swap	[%g2 + 0x10], %o5
	.word	0x9a003718	! t0_kref+0x1b1c:   	add	%g0, -0x8e8, %o5
	.word	0x89b106c4	! t0_kref+0x1b20:   	fmul8sux16	%f4, %f4, %f4
	.word	0x904034e3	! t0_kref+0x1b24:   	addc	%g0, -0xb1d, %o0
	.word	0xd60e601d	! t0_kref+0x1b28:   	ldub	[%i1 + 0x1d], %o3
	.word	0x89a000a4	! t0_kref+0x1b2c:   	fnegs	%f4, %f4
	.word	0x89b10ae4	! t0_kref+0x1b30:   	fpsub32s	%f4, %f4, %f4
	.word	0x89b107c4	! t0_kref+0x1b34:   	pdist	%f4, %f4, %f4
	.word	0x9a800000	! t0_kref+0x1b38:   	addcc	%g0, %g0, %o5
	.word	0x9f203947	! t0_kref+0x1b3c:   	mulscc	%g0, -0x6b9, %o7
	.word	0xc9180019	! t0_kref+0x1b40:   	ldd	[%g0 + %i1], %f4
	.word	0x92780000	! t0_kref+0x1b44:   	sdiv	%g0, %g0, %o1
	.word	0x89a108a4	! t0_kref+0x1b48:   	fsubs	%f4, %f4, %f4
	.word	0x3c480008	! t0_kref+0x1b4c:   	bpos,a,pt	%icc, _kref+0x1b6c
	.word	0x8143c000	! t0_kref+0x1b50:   	stbar
	.word	0x80f80000	! t0_kref+0x1b54:   	sdivcc	%g0, %g0, %g0
	.word	0xd80e4000	! t0_kref+0x1b58:   	ldub	[%i1], %o4
	.word	0xc920a008	! t0_kref+0x1b5c:   	st	%f4, [%g2 + 8]
	.word	0xc9be1a5d	! t0_kref+0x1b60:   	stda	%f4, [%i0 + %i5]0xd2
	.word	0x2d480007	! t0_kref+0x1b64:   	fbg,a,pt	%fcc0, _kref+0x1b80
	.word	0xda4e401a	! t0_kref+0x1b68:   	ldsb	[%i1 + %i2], %o5
	.word	0xc9070018	! t0_kref+0x1b6c:   	ld	[%i4 + %i0], %f4
	.word	0xe81e7ff8	! t0_kref+0x1b70:   	ldd	[%i1 - 8], %l4
	.word	0x89a01924	! t0_kref+0x1b74:   	fstod	%f4, %f4
	call	SYM(t0_subr3)
	.word	0x89a10824	! t0_kref+0x1b7c:   	fadds	%f4, %f4, %f4
	.word	0xe2ee5000	! t0_kref+0x1b80:   	ldstuba	[%i1]0x80, %l1
	.word	0xc9063fe8	! t0_kref+0x1b84:   	ld	[%i0 - 0x18], %f4
	.word	0x89b10ea0	! t0_kref+0x1b88:   	fsrc1s	%f4, %f4
	.word	0x9f280000	! t0_kref+0x1b8c:   	sll	%g0, %g0, %o7
	.word	0x89b00f24	! t0_kref+0x1b90:   	fsrc2s	%f4, %f4
	.word	0x81800000	! t0_kref+0x1b94:   	mov	%g0, %y
	.word	0x89a108a4	! t0_kref+0x1b98:   	fsubs	%f4, %f4, %f4
	.word	0x81a90aa4	! t0_kref+0x1b9c:   	fcmpes	%fcc0, %f4, %f4
	.word	0xd2100019	! t0_kref+0x1ba0:   	lduh	[%g0 + %i1], %o1
	.word	0xc020a03c	! t0_kref+0x1ba4:   	clr	[%g2 + 0x3c]
	.word	0x981032ba	! t0_kref+0x1ba8:   	mov	0xfffff2ba, %o4
	.word	0xc91fbd58	! t0_kref+0x1bac:   	ldd	[%fp - 0x2a8], %f4
	.word	0x96c02df4	! t0_kref+0x1bb0:   	addccc	%g0, 0xdf4, %o3
	.word	0x89a000a4	! t0_kref+0x1bb4:   	fnegs	%f4, %f4
	.word	0x89a108a4	! t0_kref+0x1bb8:   	fsubs	%f4, %f4, %f4
	.word	0x89a018c4	! t0_kref+0x1bbc:   	fdtos	%f4, %f4
	.word	0x9bb00020	! t0_kref+0x1bc0:   	edge8n	%g0, %g0, %o5
	.word	0x89b00c20	! t0_kref+0x1bc4:   	fzeros	%f4
	.word	0x89a000a4	! t0_kref+0x1bc8:   	fnegs	%f4, %f4
	.word	0xc900a034	! t0_kref+0x1bcc:   	ld	[%g2 + 0x34], %f4
	.word	0x93400000	! t0_kref+0x1bd0:   	mov	%y, %o1
	.word	0xc920a038	! t0_kref+0x1bd4:   	st	%f4, [%g2 + 0x38]
	.word	0x89a00524	! t0_kref+0x1bd8:   	fsqrts	%f4, %f4
	.word	0x91b000a0	! t0_kref+0x1bdc:   	edge16n	%g0, %g0, %o0
	.word	0x28480007	! t0_kref+0x1be0:   	bleu,a,pt	%icc, _kref+0x1bfc
	.word	0x926035a1	! t0_kref+0x1be4:   	subc	%g0, -0xa5f, %o1
	.word	0xfbee101c	! t0_kref+0x1be8:   	prefetcha	%i0 + %i4, 29
	.word	0xd210a03a	! t0_kref+0x1bec:   	lduh	[%g2 + 0x3a], %o1
	.word	0x89a00124	! t0_kref+0x1bf0:   	fabss	%f4, %f4
	.word	0xc768a044	! t0_kref+0x1bf4:   	prefetch	%g2 + 0x44, 3
	.word	0x95700000	! t0_kref+0x1bf8:   	popc	%g0, %o2
	.word	0xd9f65000	! t0_kref+0x1bfc:   	casxa	[%i1]0x80, %g0, %o4
	.word	0x89a00524	! t0_kref+0x1c00:   	fsqrts	%f4, %f4
	.word	0xe5ee501c	! t0_kref+0x1c04:   	prefetcha	%i1 + %i4, 18
	.word	0x96180000	! t0_kref+0x1c08:   	xor	%g0, %g0, %o3
	.word	0xd60e3fef	! t0_kref+0x1c0c:   	ldub	[%i0 - 0x11], %o3
	.word	0x96700000	! t0_kref+0x1c10:   	udiv	%g0, %g0, %o3
	.word	0x9f400000	! t0_kref+0x1c14:   	mov	%y, %o7
	.word	0x9a98274d	! t0_kref+0x1c18:   	xorcc	%g0, 0x74d, %o5
	.word	0x91180000	! t0_kref+0x1c1c:   	tsubcctv	%g0, %g0, %o0
	.word	0x89a00524	! t0_kref+0x1c20:   	fsqrts	%f4, %f4
	.word	0x98180000	! t0_kref+0x1c24:   	xor	%g0, %g0, %o4
	.word	0x89b10f84	! t0_kref+0x1c28:   	for	%f4, %f4, %f4
	.word	0xd6100018	! t0_kref+0x1c2c:   	lduh	[%g0 + %i0], %o3
	.word	0x94a82ae7	! t0_kref+0x1c30:   	andncc	%g0, 0xae7, %o2
	.word	0x86102012	! t0_kref+0x1c34:   	mov	0x12, %g3
	.word	0x86a0e001	! t0_kref+0x1c38:   	subcc	%g3, 1, %g3
	.word	0x2280000d	! t0_kref+0x1c3c:   	be,a	_kref+0x1c70
	.word	0x945029d3	! t0_kref+0x1c40:   	umul	%g0, 0x9d3, %o2
	.word	0x89a10d24	! t0_kref+0x1c44:   	fsmuld	%f4, %f4, %f4
	.word	0x89a00524	! t0_kref+0x1c48:   	fsqrts	%f4, %f4
	.word	0x89a108c4	! t0_kref+0x1c4c:   	fsubd	%f4, %f4, %f4
	.word	0x98400000	! t0_kref+0x1c50:   	addc	%g0, %g0, %o4
	.word	0x94600000	! t0_kref+0x1c54:   	subc	%g0, %g0, %o2
	.word	0xc030a012	! t0_kref+0x1c58:   	clrh	[%g2 + 0x12]
	.word	0x27480001	! t0_kref+0x1c5c:   	fbul,a,pt	%fcc0, _kref+0x1c60
	.word	0x8030242b	! t0_kref+0x1c60:   	orn	%g0, 0x42b, %g0
	.word	0xd80e7fff	! t0_kref+0x1c64:   	ldub	[%i1 - 1], %o4
	.word	0xc020a03c	! t0_kref+0x1c68:   	clr	[%g2 + 0x3c]
	.word	0x90d00000	! t0_kref+0x1c6c:   	umulcc	%g0, %g0, %o0
	.word	0x89a00544	! t0_kref+0x1c70:   	fsqrtd	%f4, %f4
	.word	0x9fc00004	! t0_kref+0x1c74:   	call	%g0 + %g4
	.word	0x89b10e64	! t0_kref+0x1c78:   	fxnors	%f4, %f4, %f4
	.word	0xd84e0000	! t0_kref+0x1c7c:   	ldsb	[%i0], %o4
	.word	0xd240a038	! t0_kref+0x1c80:   	ldsw	[%g2 + 0x38], %o1
	.word	0x97280000	! t0_kref+0x1c84:   	sll	%g0, %g0, %o3
	.word	0xee5e2000	! t0_kref+0x1c88:   	ldx	[%i0], %l7
	.word	0x89b106c4	! t0_kref+0x1c8c:   	fmul8sux16	%f4, %f4, %f4
	.word	0x30800007	! t0_kref+0x1c90:   	ba,a	_kref+0x1cac
	.word	0x89a00524	! t0_kref+0x1c94:   	fsqrts	%f4, %f4
	.word	0x80500000	! t0_kref+0x1c98:   	umul	%g0, %g0, %g0
	.word	0x9e002d10	! t0_kref+0x1c9c:   	add	%g0, 0xd10, %o7
	.word	0x89b10de4	! t0_kref+0x1ca0:   	fnands	%f4, %f4, %f4
	.word	0x99b00100	! t0_kref+0x1ca4:   	edge32	%g0, %g0, %o4
	.word	0x9fc10000	! t0_kref+0x1ca8:   	call	%g4
	.word	0x9a1820cb	! t0_kref+0x1cac:   	xor	%g0, 0xcb, %o5
	.word	0x95418000	! t0_kref+0x1cb0:   	mov	%fprs, %o2
	.word	0xc9be5a5b	! t0_kref+0x1cb4:   	stda	%f4, [%i1 + %i3]0xd2
	.word	0x89a108c4	! t0_kref+0x1cb8:   	fsubd	%f4, %f4, %f4
	.word	0x81dc211e	! t0_kref+0x1cbc:   	flush	%l0 + 0x11e
	call	SYM(t0_subr3)
	.word	0xae800000	! t0_kref+0x1cc4:   	addcc	%g0, %g0, %l7
	.word	0x81dfeeb8	! t0_kref+0x1cc8:   	flush	%i7 + 0xeb8
	.word	0xda10a014	! t0_kref+0x1ccc:   	lduh	[%g2 + 0x14], %o5
	.word	0x9ad00000	! t0_kref+0x1cd0:   	umulcc	%g0, %g0, %o5
	.word	0xc906401c	! t0_kref+0x1cd4:   	ld	[%i1 + %i4], %f4
	.word	0x2c800006	! t0_kref+0x1cd8:   	bneg,a	_kref+0x1cf0
	.word	0x89a01924	! t0_kref+0x1cdc:   	fstod	%f4, %f4
	.word	0x9a080000	! t0_kref+0x1ce0:   	and	%g0, %g0, %o5
	.word	0xd5f65000	! t0_kref+0x1ce4:   	casxa	[%i1]0x80, %g0, %o2
	.word	0x81a90a24	! t0_kref+0x1ce8:   	fcmps	%fcc0, %f4, %f4
	.word	0x89a108c4	! t0_kref+0x1cec:   	fsubd	%f4, %f4, %f4
	.word	0x81a90a44	! t0_kref+0x1cf0:   	fcmpd	%fcc0, %f4, %f4
	.word	0xffee501c	! t0_kref+0x1cf4:   	prefetcha	%i1 + %i4, 31
	.word	0xd84e7ff8	! t0_kref+0x1cf8:   	ldsb	[%i1 - 8], %o4
	.word	0x89a108a4	! t0_kref+0x1cfc:   	fsubs	%f4, %f4, %f4
	.word	0xc900a038	! t0_kref+0x1d00:   	ld	[%g2 + 0x38], %f4
	.word	0xd44e3ffd	! t0_kref+0x1d04:   	ldsb	[%i0 - 3], %o2
	.word	0x9e903e4c	! t0_kref+0x1d08:   	orcc	%g0, -0x1b4, %o7
	.word	0x9fc10000	! t0_kref+0x1d0c:   	call	%g4
	.word	0x9aa825f0	! t0_kref+0x1d10:   	andncc	%g0, 0x5f0, %o5
	.word	0x89a10844	! t0_kref+0x1d14:   	faddd	%f4, %f4, %f4
	.word	0x2c480002	! t0_kref+0x1d18:   	bneg,a,pt	%icc, _kref+0x1d20
	.word	0xc040a038	! t0_kref+0x1d1c:   	ldsw	[%g2 + 0x38], %g0
	.word	0x80b80000	! t0_kref+0x1d20:   	xnorcc	%g0, %g0, %g0
	.word	0xc02e7feb	! t0_kref+0x1d24:   	clrb	[%i1 - 0x15]
	.word	0x944026ed	! t0_kref+0x1d28:   	addc	%g0, 0x6ed, %o2
	.word	0xc030a01e	! t0_kref+0x1d2c:   	clrh	[%g2 + 0x1e]
	.word	0xd8380018	! t0_kref+0x1d30:   	std	%o4, [%g0 + %i0]
	.word	0xc9262010	! t0_kref+0x1d34:   	st	%f4, [%i0 + 0x10]
	.word	0x89a00524	! t0_kref+0x1d38:   	fsqrts	%f4, %f4
	.word	0x89a108a4	! t0_kref+0x1d3c:   	fsubs	%f4, %f4, %f4
	.word	0x80183a2a	! t0_kref+0x1d40:   	xor	%g0, -0x5d6, %g0
	.word	0x95b10444	! t0_kref+0x1d44:   	fcmpne16	%f4, %f4, %o2
	.word	0x89b10a04	! t0_kref+0x1d48:   	fpadd16	%f4, %f4, %f4
	.word	0x81a90aa4	! t0_kref+0x1d4c:   	fcmpes	%fcc0, %f4, %f4
	.word	0x89a00124	! t0_kref+0x1d50:   	fabss	%f4, %f4
	.word	0x9bb00140	! t0_kref+0x1d54:   	edge32l	%g0, %g0, %o5
	.word	0xc900a038	! t0_kref+0x1d58:   	ld	[%g2 + 0x38], %f4
	.word	0x2a800004	! t0_kref+0x1d5c:   	bcs,a	_kref+0x1d6c
	.word	0xd0fe501c	! t0_kref+0x1d60:   	swapa	[%i1 + %i4]0x80, %o0
	.word	0x89a00524	! t0_kref+0x1d64:   	fsqrts	%f4, %f4
	.word	0x24800007	! t0_kref+0x1d68:   	ble,a	_kref+0x1d84
	.word	0x89a00544	! t0_kref+0x1d6c:   	fsqrtd	%f4, %f4
	.word	0x89a01a44	! t0_kref+0x1d70:   	fdtoi	%f4, %f4
	.word	0xc91e6010	! t0_kref+0x1d74:   	ldd	[%i1 + 0x10], %f4
	.word	0xc04e2005	! t0_kref+0x1d78:   	ldsb	[%i0 + 5], %g0
	.word	0x81a90a24	! t0_kref+0x1d7c:   	fcmps	%fcc0, %f4, %f4
	.word	0xc93e6018	! t0_kref+0x1d80:   	std	%f4, [%i1 + 0x18]
	.word	0x89a018c4	! t0_kref+0x1d84:   	fdtos	%f4, %f4
	.word	0x89a109a4	! t0_kref+0x1d88:   	fdivs	%f4, %f4, %f4
	.word	0xe89f5018	! t0_kref+0x1d8c:   	ldda	[%i5 + %i0]0x80, %l4
	.word	0xec9f5058	! t0_kref+0x1d90:   	ldda	[%i5 + %i0]0x82, %l6
	.word	0x89b00764	! t0_kref+0x1d94:   	fpack16	%f4, %f4
	.word	0x89b10c44	! t0_kref+0x1d98:   	fnor	%f4, %f4, %f4
	.word	0x89a00144	! t0_kref+0x1d9c:   	fabsd	%f4, %f4
	.word	0x9de3bfa0	! t0_kref+0x1da0:   	save	%sp, -0x60, %sp
	.word	0x91ee7852	! t0_kref+0x1da4:   	restore	%i1, -0x7ae, %o0
	.word	0xd408a009	! t0_kref+0x1da8:   	ldub	[%g2 + 9], %o2
	.word	0x89a01a24	! t0_kref+0x1dac:   	fstoi	%f4, %f4
	.word	0xef68a04f	! t0_kref+0x1db0:   	prefetch	%g2 + 0x4f, 23
	.word	0x9b408000	! t0_kref+0x1db4:   	mov	%ccr, %o5
	.word	0x94080000	! t0_kref+0x1db8:   	and	%g0, %g0, %o2
	.word	0x99400000	! t0_kref+0x1dbc:   	mov	%y, %o4
	.word	0x96f00000	! t0_kref+0x1dc0:   	udivcc	%g0, %g0, %o3
	.word	0x9a980000	! t0_kref+0x1dc4:   	xorcc	%g0, %g0, %o5
	.word	0x90d83b27	! t0_kref+0x1dc8:   	smulcc	%g0, -0x4d9, %o0
	.word	0xc920a004	! t0_kref+0x1dcc:   	st	%f4, [%g2 + 4]
	.word	0x941023af	! t0_kref+0x1dd0:   	mov	0x3af, %o2
	.word	0x89a108a4	! t0_kref+0x1dd4:   	fsubs	%f4, %f4, %f4
	.word	0x9ea82633	! t0_kref+0x1dd8:   	andncc	%g0, 0x633, %o7
	.word	0xd456201a	! t0_kref+0x1ddc:   	ldsh	[%i0 + 0x1a], %o2
	.word	0x89b00fe0	! t0_kref+0x1de0:   	fones	%f4
	.word	0x89a108a4	! t0_kref+0x1de4:   	fsubs	%f4, %f4, %f4
	.word	0x89a01904	! t0_kref+0x1de8:   	fitod	%f4, %f4
	.word	0x89a108a4	! t0_kref+0x1dec:   	fsubs	%f4, %f4, %f4
	.word	0x964039a9	! t0_kref+0x1df0:   	addc	%g0, -0x657, %o3
	.word	0x95400000	! t0_kref+0x1df4:   	mov	%y, %o2
	.word	0x9a302aa6	! t0_kref+0x1df8:   	orn	%g0, 0xaa6, %o5
	.word	0x80a83001	! t0_kref+0x1dfc:   	andncc	%g0, -0xfff, %g0
	.word	0xee4e4000	! t0_kref+0x1e00:   	ldsb	[%i1], %l7
	.word	0xe43e6000	! t0_kref+0x1e04:   	std	%l2, [%i1]
	.word	0x89a109a4	! t0_kref+0x1e08:   	fdivs	%f4, %f4, %f4
	.word	0xd20e7fef	! t0_kref+0x1e0c:   	ldub	[%i1 - 0x11], %o1
	.word	0x89b10624	! t0_kref+0x1e10:   	fmul8x16	%f4, %f4, %f4
	.word	0x89a94044	! t0_kref+0x1e14:   	fmovdug	%fcc0, %f4, %f4
	.word	0x97400000	! t0_kref+0x1e18:   	mov	%y, %o3
	.word	0x9fc10000	! t0_kref+0x1e1c:   	call	%g4
	.word	0x89a01924	! t0_kref+0x1e20:   	fstod	%f4, %f4
	.word	0xde00a01c	! t0_kref+0x1e24:   	ld	[%g2 + 0x1c], %o7
	.word	0x001fffff	! t0_kref+0x1e28:   	illtrap	0x1fffff
	.word	0x89b10d24	! t0_kref+0x1e2c:   	fandnot1s	%f4, %f4, %f4
	.word	0x89a10924	! t0_kref+0x1e30:   	fmuls	%f4, %f4, %f4
	.word	0x89a00124	! t0_kref+0x1e34:   	fabss	%f4, %f4
	.word	0xc920a010	! t0_kref+0x1e38:   	st	%f4, [%g2 + 0x10]
	.word	0xc028a004	! t0_kref+0x1e3c:   	clrb	[%g2 + 4]
	.word	0x89b10e44	! t0_kref+0x1e40:   	fxnor	%f4, %f4, %f4
	.word	0xaea00000	! t0_kref+0x1e44:   	subcc	%g0, %g0, %l7
	.word	0xd85e2008	! t0_kref+0x1e48:   	ldx	[%i0 + 8], %o4
	.word	0xc0267ff8	! t0_kref+0x1e4c:   	clr	[%i1 - 8]
	.word	0x89a108c4	! t0_kref+0x1e50:   	fsubd	%f4, %f4, %f4
	.word	0xc900a01c	! t0_kref+0x1e54:   	ld	[%g2 + 0x1c], %f4
	.word	0x94102aa8	! t0_kref+0x1e58:   	mov	0xaa8, %o2
	.word	0x34800002	! t0_kref+0x1e5c:   	bg,a	_kref+0x1e64
	.word	0x9e883c33	! t0_kref+0x1e60:   	andcc	%g0, -0x3cd, %o7
	.word	0x89a00124	! t0_kref+0x1e64:   	fabss	%f4, %f4
	.word	0xc026601c	! t0_kref+0x1e68:   	clr	[%i1 + 0x1c]
	.word	0xd5f65000	! t0_kref+0x1e6c:   	casxa	[%i1]0x80, %g0, %o2
	.word	0x81a90a44	! t0_kref+0x1e70:   	fcmpd	%fcc0, %f4, %f4
	.word	0x90a80000	! t0_kref+0x1e74:   	andncc	%g0, %g0, %o0
	.word	0x93b10584	! t0_kref+0x1e78:   	fcmpgt32	%f4, %f4, %o1
	.word	0x32800008	! t0_kref+0x1e7c:   	bne,a	_kref+0x1e9c
	.word	0x96f83e3c	! t0_kref+0x1e80:   	sdivcc	%g0, -0x1c4, %o3
	.word	0xc020a000	! t0_kref+0x1e84:   	clr	[%g2]
	.word	0xe03e001d	! t0_kref+0x1e88:   	std	%l0, [%i0 + %i5]
	.word	0xc9be1880	! t0_kref+0x1e8c:   	stda	%f4, [%i0]0xc4
	.word	0xd810a03a	! t0_kref+0x1e90:   	lduh	[%g2 + 0x3a], %o4
	.word	0x89a108a4	! t0_kref+0x1e94:   	fsubs	%f4, %f4, %f4
	.word	0x81a90a24	! t0_kref+0x1e98:   	fcmps	%fcc0, %f4, %f4
	.word	0x81a90ac4	! t0_kref+0x1e9c:   	fcmped	%fcc0, %f4, %f4
	.word	0x89a10824	! t0_kref+0x1ea0:   	fadds	%f4, %f4, %f4
	.word	0x89a10944	! t0_kref+0x1ea4:   	fmuld	%f4, %f4, %f4
	.word	0x90700000	! t0_kref+0x1ea8:   	udiv	%g0, %g0, %o0
	.word	0x99b105c4	! t0_kref+0x1eac:   	fcmpeq32	%f4, %f4, %o4
	.word	0x22800007	! t0_kref+0x1eb0:   	be,a	_kref+0x1ecc
	.word	0x93202e94	! t0_kref+0x1eb4:   	mulscc	%g0, 0xe94, %o1
	.word	0x89a000a4	! t0_kref+0x1eb8:   	fnegs	%f4, %f4
	.word	0x30800004	! t0_kref+0x1ebc:   	ba,a	_kref+0x1ecc
	.word	0x89a01904	! t0_kref+0x1ec0:   	fitod	%f4, %f4
	.word	0x97b00020	! t0_kref+0x1ec4:   	edge8n	%g0, %g0, %o3
	.word	0xc020a034	! t0_kref+0x1ec8:   	clr	[%g2 + 0x34]
	.word	0x86102001	! t0_kref+0x1ecc:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x1ed0:   	bne,a	_kref+0x1ed0
	.word	0x86a0e001	! t0_kref+0x1ed4:   	subcc	%g3, 1, %g3
	.word	0x91b00280	! t0_kref+0x1ed8:   	array32	%g0, %g0, %o0
	.word	0xd0067fec	! t0_kref+0x1edc:   	ld	[%i1 - 0x14], %o0
	.word	0x81800000	! t0_kref+0x1ee0:   	mov	%g0, %y
	.word	0x89a00124	! t0_kref+0x1ee4:   	fabss	%f4, %f4
	.word	0x9a280000	! t0_kref+0x1ee8:   	andn	%g0, %g0, %o5
	.word	0x2c800002	! t0_kref+0x1eec:   	bneg,a	_kref+0x1ef4
	.word	0x89a00524	! t0_kref+0x1ef0:   	fsqrts	%f4, %f4
	.word	0xf207bfe0	! t0_kref+0x1ef4:   	ld	[%fp - 0x20], %i1
	.word	0x89a01a24	! t0_kref+0x1ef8:   	fstoi	%f4, %f4
	call	SYM(t0_subr0)
	.word	0x89a108a4	! t0_kref+0x1f00:   	fsubs	%f4, %f4, %f4
	.word	0x80c00000	! t0_kref+0x1f04:   	addccc	%g0, %g0, %g0
	.word	0x80300000	! t0_kref+0x1f08:   	orn	%g0, %g0, %g0
	.word	0xc920a030	! t0_kref+0x1f0c:   	st	%f4, [%g2 + 0x30]
	.word	0xd286501c	! t0_kref+0x1f10:   	lda	[%i1 + %i4]0x80, %o1
	.word	0x89a01904	! t0_kref+0x1f14:   	fitod	%f4, %f4
	.word	0xc91fbec0	! t0_kref+0x1f18:   	ldd	[%fp - 0x140], %f4
	.word	0x89a10844	! t0_kref+0x1f1c:   	faddd	%f4, %f4, %f4
	.word	0xe3b8a080	! t0_kref+0x1f20:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x38800004	! t0_kref+0x1f24:   	bgu,a	_kref+0x1f34
	.word	0xd248a02d	! t0_kref+0x1f28:   	ldsb	[%g2 + 0x2d], %o1
	.word	0xc028a03f	! t0_kref+0x1f2c:   	clrb	[%g2 + 0x3f]
	.word	0xc0260000	! t0_kref+0x1f30:   	clr	[%i0]
	.word	0x89b10ca4	! t0_kref+0x1f34:   	fandnot2s	%f4, %f4, %f4
	.word	0x9fc00004	! t0_kref+0x1f38:   	call	%g0 + %g4
	.word	0xe0067fe4	! t0_kref+0x1f3c:   	ld	[%i1 - 0x1c], %l0
	.word	0x80e00000	! t0_kref+0x1f40:   	subccc	%g0, %g0, %g0
	.word	0x9eb80000	! t0_kref+0x1f44:   	xnorcc	%g0, %g0, %o7
	.word	0x9b400000	! t0_kref+0x1f48:   	mov	%y, %o5
	.word	0x98003006	! t0_kref+0x1f4c:   	add	%g0, -0xffa, %o4
	.word	0xd20e0000	! t0_kref+0x1f50:   	ldub	[%i0], %o1
	.word	0xc028a01c	! t0_kref+0x1f54:   	clrb	[%g2 + 0x1c]
	.word	0x95b00200	! t0_kref+0x1f58:   	array8	%g0, %g0, %o2
	.word	0xd8180018	! t0_kref+0x1f5c:   	ldd	[%g0 + %i0], %o4
	.word	0xe3f65000	! t0_kref+0x1f60:   	casxa	[%i1]0x80, %g0, %l1
	.word	0x89b10704	! t0_kref+0x1f64:   	fmuld8sux16	%f4, %f4, %f4
	.word	0xee7e6014	! t0_kref+0x1f68:   	swap	[%i1 + 0x14], %l7
	.word	0xc020a02c	! t0_kref+0x1f6c:   	clr	[%g2 + 0x2c]
	.word	0xc9267fe8	! t0_kref+0x1f70:   	st	%f4, [%i1 - 0x18]
	.word	0x9490309d	! t0_kref+0x1f74:   	orcc	%g0, -0xf63, %o2
	.word	0x89a01904	! t0_kref+0x1f78:   	fitod	%f4, %f4
	.word	0x81da4019	! t0_kref+0x1f7c:   	flush	%o1 + %i1
	.word	0xc9062010	! t0_kref+0x1f80:   	ld	[%i0 + 0x10], %f4
	.word	0xe1ee501d	! t0_kref+0x1f84:   	prefetcha	%i1 + %i5, 16
	.word	0x2e800001	! t0_kref+0x1f88:   	bvs,a	_kref+0x1f8c
	.word	0xe26e4000	! t0_kref+0x1f8c:   	ldstub	[%i1], %l1
	.word	0x90100000	! t0_kref+0x1f90:   	clr	%o0
	.word	0x95202101	! t0_kref+0x1f94:   	mulscc	%g0, 0x101, %o2
	.word	0x89b007a4	! t0_kref+0x1f98:   	fpackfix	%f4, %f4
	.word	0x89a01084	! t0_kref+0x1f9c:   	fxtos	%f4, %f4
	.word	0x86102002	! t0_kref+0x1fa0:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x1fa4:   	bne,a	_kref+0x1fa4
	.word	0x86a0e001	! t0_kref+0x1fa8:   	subcc	%g3, 1, %g3
	.word	0x9a182e1a	! t0_kref+0x1fac:   	xor	%g0, 0xe1a, %o5
	.word	0x89b00764	! t0_kref+0x1fb0:   	fpack16	%f4, %f4
	.word	0xc807bfe8	! t0_kref+0x1fb4:   	ld	[%fp - 0x18], %g4
	.word	0x97300000	! t0_kref+0x1fb8:   	srl	%g0, %g0, %o3
	.word	0x9b280000	! t0_kref+0x1fbc:   	sll	%g0, %g0, %o5
	.word	0x9a600000	! t0_kref+0x1fc0:   	subc	%g0, %g0, %o5
	.word	0x2e800008	! t0_kref+0x1fc4:   	bvs,a	_kref+0x1fe4
	.word	0xd8180018	! t0_kref+0x1fc8:   	ldd	[%g0 + %i0], %o4
	.word	0x98380000	! t0_kref+0x1fcc:   	not	%g0, %o4
	.word	0x2e480007	! t0_kref+0x1fd0:   	bvs,a,pt	%icc, _kref+0x1fec
	.word	0xc0260000	! t0_kref+0x1fd4:   	clr	[%i0]
	.word	0x89a01924	! t0_kref+0x1fd8:   	fstod	%f4, %f4
	.word	0x9fc00004	! t0_kref+0x1fdc:   	call	%g0 + %g4
	.word	0x89a00524	! t0_kref+0x1fe0:   	fsqrts	%f4, %f4
	.word	0x96182b3f	! t0_kref+0x1fe4:   	xor	%g0, 0xb3f, %o3
	.word	0xe9ee501d	! t0_kref+0x1fe8:   	prefetcha	%i1 + %i5, 20
	.word	0x99400000	! t0_kref+0x1fec:   	mov	%y, %o4
	.word	0xc920a014	! t0_kref+0x1ff0:   	st	%f4, [%g2 + 0x14]
	.word	0x89b10fa4	! t0_kref+0x1ff4:   	fors	%f4, %f4, %f4
	.word	0x94300000	! t0_kref+0x1ff8:   	orn	%g0, %g0, %o2
	.word	0xc9be5a1c	! t0_kref+0x1ffc:   	stda	%f4, [%i1 + %i4]0xd0
	.word	0x9344c000	! t0_kref+0x2000:   	mov	%gsr, %o1
	.word	0x81a90aa4	! t0_kref+0x2004:   	fcmpes	%fcc0, %f4, %f4
	.word	0xd4063fe8	! t0_kref+0x2008:   	ld	[%i0 - 0x18], %o2
	.word	0x36800003	! t0_kref+0x200c:   	bge,a	_kref+0x2018
	.word	0x81d977c6	! t0_kref+0x2010:   	flush	%g5 - 0x83a
	.word	0x89a10844	! t0_kref+0x2014:   	faddd	%f4, %f4, %f4
	.word	0x9b418000	! t0_kref+0x2018:   	mov	%fprs, %o5
	.word	0x90583e33	! t0_kref+0x201c:   	smul	%g0, -0x1cd, %o0
	.word	0xc9871058	! t0_kref+0x2020:   	lda	[%i4 + %i0]0x82, %f4
	.word	0x90600000	! t0_kref+0x2024:   	subc	%g0, %g0, %o0
	.word	0x97302009	! t0_kref+0x2028:   	srl	%g0, 0x9, %o3
	.word	0x98803978	! t0_kref+0x202c:   	addcc	%g0, -0x688, %o4
	.word	0x92200000	! t0_kref+0x2030:   	neg	%g0, %o1
	.word	0x96a83768	! t0_kref+0x2034:   	andncc	%g0, -0x898, %o3
	.word	0x89b10664	! t0_kref+0x2038:   	fmul8x16au	%f4, %f4, %f4
	.word	0x8058273a	! t0_kref+0x203c:   	smul	%g0, 0x73a, %g0
	.word	0x90100000	! t0_kref+0x2040:   	clr	%o0
	.word	0x89a10944	! t0_kref+0x2044:   	fmuld	%f4, %f4, %f4
	.word	0x98c03ef3	! t0_kref+0x2048:   	addccc	%g0, -0x10d, %o4
	.word	0x89b10d60	! t0_kref+0x204c:   	fnot1s	%f4, %f4
	.word	0x89b10724	! t0_kref+0x2050:   	fmuld8ulx16	%f4, %f4, %f4
	.word	0x9bb00000	! t0_kref+0x2054:   	edge8	%g0, %g0, %o5
	.word	0xa7800000	! t0_kref+0x2058:   	mov	%g0, %gsr
	.word	0xec380018	! t0_kref+0x205c:   	std	%l6, [%g0 + %i0]
	.word	0xda10a036	! t0_kref+0x2060:   	lduh	[%g2 + 0x36], %o5
	.word	0x81a90aa4	! t0_kref+0x2064:   	fcmpes	%fcc0, %f4, %f4
	.word	0xc9bf5a19	! t0_kref+0x2068:   	stda	%f4, [%i5 + %i1]0xd0
	.word	0x89a00124	! t0_kref+0x206c:   	fabss	%f4, %f4
	.word	0x38800005	! t0_kref+0x2070:   	bgu,a	_kref+0x2084
	.word	0xd816001b	! t0_kref+0x2074:   	lduh	[%i0 + %i3], %o4
	.word	0x99400000	! t0_kref+0x2078:   	mov	%y, %o4
	.word	0x89a108c4	! t0_kref+0x207c:   	fsubd	%f4, %f4, %f4
	.word	0xc807bfec	! t0_kref+0x2080:   	ld	[%fp - 0x14], %g4
	.word	0x2a480008	! t0_kref+0x2084:   	bcs,a,pt	%icc, _kref+0x20a4
	.word	0x89a00124	! t0_kref+0x2088:   	fabss	%f4, %f4
	.word	0x94183172	! t0_kref+0x208c:   	xor	%g0, -0xe8e, %o2
	.word	0x89a108c4	! t0_kref+0x2090:   	fsubd	%f4, %f4, %f4
	call	SYM(t0_subr1)
	.word	0x97b00020	! t0_kref+0x2098:   	edge8n	%g0, %g0, %o3
	.word	0xef6e7fe0	! t0_kref+0x209c:   	prefetch	%i1 - 0x20, 23
	.word	0xec3e001d	! t0_kref+0x20a0:   	std	%l6, [%i0 + %i5]
	.word	0x968035ce	! t0_kref+0x20a4:   	addcc	%g0, -0xa32, %o3
	.word	0xc028a035	! t0_kref+0x20a8:   	clrb	[%g2 + 0x35]
	.word	0x89a10844	! t0_kref+0x20ac:   	faddd	%f4, %f4, %f4
	.word	0x89a109c4	! t0_kref+0x20b0:   	fdivd	%f4, %f4, %f4
	.word	0x9fc10000	! t0_kref+0x20b4:   	call	%g4
	.word	0xe0064000	! t0_kref+0x20b8:   	ld	[%i1], %l0
	.word	0xee100019	! t0_kref+0x20bc:   	lduh	[%g0 + %i1], %l7
	.word	0x89a01924	! t0_kref+0x20c0:   	fstod	%f4, %f4
	.word	0x89b10e44	! t0_kref+0x20c4:   	fxnor	%f4, %f4, %f4
	.word	0x89b106c4	! t0_kref+0x20c8:   	fmul8sux16	%f4, %f4, %f4
	.word	0xaea80000	! t0_kref+0x20cc:   	andncc	%g0, %g0, %l7
	.word	0xaec031fa	! t0_kref+0x20d0:   	addccc	%g0, -0xe06, %l7
	.word	0xae1025cf	! t0_kref+0x20d4:   	mov	0x5cf, %l7
	.word	0x89b00f04	! t0_kref+0x20d8:   	fsrc2	%f4, %f4
	.word	0x89a000a4	! t0_kref+0x20dc:   	fnegs	%f4, %f4
	.word	0xa7802a3c	! t0_kref+0x20e0:   	mov	0xa3c, %gsr
	.word	0x89b10e64	! t0_kref+0x20e4:   	fxnors	%f4, %f4, %f4
	.word	0xc7ee1000	! t0_kref+0x20e8:   	prefetcha	%i0, 3
	.word	0x89a00044	! t0_kref+0x20ec:   	fmovd	%f4, %f4
	.word	0x9fc10000	! t0_kref+0x20f0:   	call	%g4
	.word	0x89a01924	! t0_kref+0x20f4:   	fstod	%f4, %f4
	.word	0xc9000018	! t0_kref+0x20f8:   	ld	[%g0 + %i0], %f4
	.word	0x22800001	! t0_kref+0x20fc:   	be,a	_kref+0x2100
	.word	0x89a01924	! t0_kref+0x2100:   	fstod	%f4, %f4
	.word	0xd4166016	! t0_kref+0x2104:   	lduh	[%i1 + 0x16], %o2
	.word	0xaf28201a	! t0_kref+0x2108:   	sll	%g0, 0x1a, %l7
	.word	0x89a01a44	! t0_kref+0x210c:   	fdtoi	%f4, %f4
	.word	0x90500000	! t0_kref+0x2110:   	umul	%g0, %g0, %o0
	.word	0x98180000	! t0_kref+0x2114:   	xor	%g0, %g0, %o4
	.word	0x34800006	! t0_kref+0x2118:   	bg,a	_kref+0x2130
	.word	0x98880000	! t0_kref+0x211c:   	andcc	%g0, %g0, %o4
	.word	0xc9bf5a58	! t0_kref+0x2120:   	stda	%f4, [%i5 + %i0]0xd2
	.word	0x89a10944	! t0_kref+0x2124:   	fmuld	%f4, %f4, %f4
	.word	0x89a00044	! t0_kref+0x2128:   	fmovd	%f4, %f4
	.word	0xe41e3fe0	! t0_kref+0x212c:   	ldd	[%i0 - 0x20], %l2
	.word	0x9a702aa9	! t0_kref+0x2130:   	udiv	%g0, 0xaa9, %o5
	.word	0xae600000	! t0_kref+0x2134:   	subc	%g0, %g0, %l7
	.word	0x9af838d3	! t0_kref+0x2138:   	sdivcc	%g0, -0x72d, %o5
	.word	0x89a109a4	! t0_kref+0x213c:   	fdivs	%f4, %f4, %f4
	.word	0x9ef83e1b	! t0_kref+0x2140:   	sdivcc	%g0, -0x1e5, %o7
	.word	0x34800007	! t0_kref+0x2144:   	bg,a	_kref+0x2160
	.word	0x81400000	! t0_kref+0x2148:   	mov	%y, %g0
	.word	0x92e036dc	! t0_kref+0x214c:   	subccc	%g0, -0x924, %o1
	.word	0x89a10844	! t0_kref+0x2150:   	faddd	%f4, %f4, %f4
	.word	0x89a00124	! t0_kref+0x2154:   	fabss	%f4, %f4
	.word	0xc0163fe4	! t0_kref+0x2158:   	lduh	[%i0 - 0x1c], %g0
	.word	0x9ef829fc	! t0_kref+0x215c:   	sdivcc	%g0, 0x9fc, %o7
	.word	0x92200000	! t0_kref+0x2160:   	neg	%g0, %o1
	.word	0xe81e7ff8	! t0_kref+0x2164:   	ldd	[%i1 - 8], %l4
	.word	0x89b10e24	! t0_kref+0x2168:   	fands	%f4, %f4, %f4
	.word	0xd40e6014	! t0_kref+0x216c:   	ldub	[%i1 + 0x14], %o2
	.word	0x89aa0044	! t0_kref+0x2170:   	fmovda	%fcc0, %f4, %f4
	.word	0xc9267ff0	! t0_kref+0x2174:   	st	%f4, [%i1 - 0x10]
	.word	0xc0364000	! t0_kref+0x2178:   	clrh	[%i1]
	.word	0xd0560000	! t0_kref+0x217c:   	ldsh	[%i0], %o0
	.word	0x96100000	! t0_kref+0x2180:   	clr	%o3
	.word	0x94802708	! t0_kref+0x2184:   	addcc	%g0, 0x708, %o2
	.word	0x89a00144	! t0_kref+0x2188:   	fabsd	%f4, %f4
	.word	0xd84e7fe3	! t0_kref+0x218c:   	ldsb	[%i1 - 0x1d], %o4
	.word	0x9610352a	! t0_kref+0x2190:   	mov	0xfffff52a, %o3
	.word	0x89a108c4	! t0_kref+0x2194:   	fsubd	%f4, %f4, %f4
	.word	0x89b106a4	! t0_kref+0x2198:   	fmul8x16al	%f4, %f4, %f4
	.word	0xee78a010	! t0_kref+0x219c:   	swap	[%g2 + 0x10], %l7
	call	SYM(t0_subr2)
	.word	0x811822f6	! t0_kref+0x21a4:   	tsubcctv	%g0, 0x2f6, %g0
	.word	0x97b10404	! t0_kref+0x21a8:   	fcmple16	%f4, %f4, %o3
	.word	0x96e00000	! t0_kref+0x21ac:   	subccc	%g0, %g0, %o3
	.word	0x36800007	! t0_kref+0x21b0:   	bge,a	_kref+0x21cc
	.word	0xda4e401a	! t0_kref+0x21b4:   	ldsb	[%i1 + %i2], %o5
	.word	0x89a00124	! t0_kref+0x21b8:   	fabss	%f4, %f4
	.word	0x81800000	! t0_kref+0x21bc:   	mov	%g0, %y
	call	SYM(t0_subr1)
	.word	0x89a109c4	! t0_kref+0x21c4:   	fdivd	%f4, %f4, %f4
	.word	0x89b10f44	! t0_kref+0x21c8:   	fornot1	%f4, %f4, %f4
	.word	0x93100000	! t0_kref+0x21cc:   	taddcctv	%g0, %g0, %o1
	.word	0x89a10924	! t0_kref+0x21d0:   	fmuls	%f4, %f4, %f4
	.word	0x89b10ae4	! t0_kref+0x21d4:   	fpsub32s	%f4, %f4, %f4
	.word	0x97300000	! t0_kref+0x21d8:   	srl	%g0, %g0, %o3
	.word	0x89a10924	! t0_kref+0x21dc:   	fmuls	%f4, %f4, %f4
	.word	0xde48a025	! t0_kref+0x21e0:   	ldsb	[%g2 + 0x25], %o7
	.word	0x89b10624	! t0_kref+0x21e4:   	fmul8x16	%f4, %f4, %f4
	.word	0x95b10484	! t0_kref+0x21e8:   	fcmple32	%f4, %f4, %o2
	.word	0x89a10924	! t0_kref+0x21ec:   	fmuls	%f4, %f4, %f4
	.word	0xc9861000	! t0_kref+0x21f0:   	lda	[%i0]0x80, %f4
	.word	0x95280000	! t0_kref+0x21f4:   	sll	%g0, %g0, %o2
	.word	0x9ef80000	! t0_kref+0x21f8:   	sdivcc	%g0, %g0, %o7
	.word	0x81a90ac4	! t0_kref+0x21fc:   	fcmped	%fcc0, %f4, %f4
	.word	0x89a01904	! t0_kref+0x2200:   	fitod	%f4, %f4
	.word	0xde4e001a	! t0_kref+0x2204:   	ldsb	[%i0 + %i2], %o7
	.word	0x89b10d24	! t0_kref+0x2208:   	fandnot1s	%f4, %f4, %f4
	.word	0x9b400000	! t0_kref+0x220c:   	mov	%y, %o5
	.word	0x96a8245f	! t0_kref+0x2210:   	andncc	%g0, 0x45f, %o3
	.word	0xc0200019	! t0_kref+0x2214:   	clr	[%g0 + %i1]
	.word	0x89a00124	! t0_kref+0x2218:   	fabss	%f4, %f4
	.word	0x89a10844	! t0_kref+0x221c:   	faddd	%f4, %f4, %f4
	.word	0x94000000	! t0_kref+0x2220:   	add	%g0, %g0, %o2
	.word	0x94f828ac	! t0_kref+0x2224:   	sdivcc	%g0, 0x8ac, %o2
	.word	0x96b00000	! t0_kref+0x2228:   	orncc	%g0, %g0, %o3
	.word	0x89a10824	! t0_kref+0x222c:   	fadds	%f4, %f4, %f4
	.word	0x89a108a4	! t0_kref+0x2230:   	fsubs	%f4, %f4, %f4
	.word	0x9600235a	! t0_kref+0x2234:   	add	%g0, 0x35a, %o3
	call	SYM(t0_subr3)
	.word	0x89a10d24	! t0_kref+0x223c:   	fsmuld	%f4, %f4, %f4
	.word	0x943827ab	! t0_kref+0x2240:   	xnor	%g0, 0x7ab, %o2
	.word	0x9e800000	! t0_kref+0x2244:   	addcc	%g0, %g0, %o7
	.word	0x89a10824	! t0_kref+0x2248:   	fadds	%f4, %f4, %f4
	.word	0x89a01904	! t0_kref+0x224c:   	fitod	%f4, %f4
	.word	0x89a01884	! t0_kref+0x2250:   	fitos	%f4, %f4
	.word	0x98b00000	! t0_kref+0x2254:   	orncc	%g0, %g0, %o4
	.word	0x89a10824	! t0_kref+0x2258:   	fadds	%f4, %f4, %f4
	.word	0x89a84024	! t0_kref+0x225c:   	fmovsne	%fcc0, %f4, %f4
	.word	0x89b10984	! t0_kref+0x2260:   	bshuffle	%f4, %f4, %f4
	call	SYM(t0_subr2)
	.word	0x98100000	! t0_kref+0x2268:   	clr	%o4
	.word	0x89a01924	! t0_kref+0x226c:   	fstod	%f4, %f4
	.word	0xc91fbc38	! t0_kref+0x2270:   	ldd	[%fp - 0x3c8], %f4
	.word	0xc000a008	! t0_kref+0x2274:   	ld	[%g2 + 8], %g0
	.word	0x89a108a4	! t0_kref+0x2278:   	fsubs	%f4, %f4, %f4
	.word	0xc02e4000	! t0_kref+0x227c:   	clrb	[%i1]
	.word	0x99300000	! t0_kref+0x2280:   	srl	%g0, %g0, %o4
	.word	0x81df400a	! t0_kref+0x2284:   	flush	%i5 + %o2
	.word	0xc926401c	! t0_kref+0x2288:   	st	%f4, [%i1 + %i4]
	.word	0x34800004	! t0_kref+0x228c:   	bg,a	_kref+0x229c
	.word	0x89b10da4	! t0_kref+0x2290:   	fxors	%f4, %f4, %f4
	.word	0xc028a018	! t0_kref+0x2294:   	clrb	[%g2 + 0x18]
	.word	0x8143c000	! t0_kref+0x2298:   	stbar
	.word	0x89a00524	! t0_kref+0x229c:   	fsqrts	%f4, %f4
	.word	0xc00e8018	! t0_kref+0x22a0:   	ldub	[%i2 + %i0], %g0
	.word	0x89b00c20	! t0_kref+0x22a4:   	fzeros	%f4
	.word	0x89a00024	! t0_kref+0x22a8:   	fmovs	%f4, %f4
	.word	0x81a90a24	! t0_kref+0x22ac:   	fcmps	%fcc0, %f4, %f4
	.word	0x81580000	! t0_kref+0x22b0:   	flushw
	.word	0x94100000	! t0_kref+0x22b4:   	clr	%o2
	.word	0x92c00000	! t0_kref+0x22b8:   	addccc	%g0, %g0, %o1
	.word	0xd010a008	! t0_kref+0x22bc:   	lduh	[%g2 + 8], %o0
	.word	0xe03e6018	! t0_kref+0x22c0:   	std	%l0, [%i1 + 0x18]
	.word	0x89a000a4	! t0_kref+0x22c4:   	fnegs	%f4, %f4
	.word	0x89a01a44	! t0_kref+0x22c8:   	fdtoi	%f4, %f4
	.word	0x81a90ac4	! t0_kref+0x22cc:   	fcmped	%fcc0, %f4, %f4
	.word	0x94c02b33	! t0_kref+0x22d0:   	addccc	%g0, 0xb33, %o2
	.word	0x89a01a44	! t0_kref+0x22d4:   	fdtoi	%f4, %f4
	.word	0x89a10944	! t0_kref+0x22d8:   	fmuld	%f4, %f4, %f4
	.word	0x89a10844	! t0_kref+0x22dc:   	faddd	%f4, %f4, %f4
	.word	0x80200000	! t0_kref+0x22e0:   	neg	%g0
	.word	0x89a10844	! t0_kref+0x22e4:   	faddd	%f4, %f4, %f4
	.word	0xaee00000	! t0_kref+0x22e8:   	subccc	%g0, %g0, %l7
	.word	0x97b00340	! t0_kref+0x22ec:   	alignaddrl	%g0, %g0, %o3
	.word	0x9fc00004	! t0_kref+0x22f0:   	call	%g0 + %g4
	.word	0x81702e9d	! t0_kref+0x22f4:   	popc	0xe9d, %g0
	.word	0xd840a004	! t0_kref+0x22f8:   	ldsw	[%g2 + 4], %o4
	.word	0x89a10944	! t0_kref+0x22fc:   	fmuld	%f4, %f4, %f4
	.word	0x80200000	! t0_kref+0x2300:   	neg	%g0
	.word	0x89b10964	! t0_kref+0x2304:   	fpmerge	%f4, %f4, %f4
	call	SYM(t0_subr0)
	.word	0xaed00000	! t0_kref+0x230c:   	umulcc	%g0, %g0, %l7
	.word	0x9b080000	! t0_kref+0x2310:   	tsubcc	%g0, %g0, %o5
	.word	0x92c00000	! t0_kref+0x2314:   	addccc	%g0, %g0, %o1
	.word	0x90880000	! t0_kref+0x2318:   	andcc	%g0, %g0, %o0
	.word	0xd856401b	! t0_kref+0x231c:   	ldsh	[%i1 + %i3], %o4
	.word	0x89a000c4	! t0_kref+0x2320:   	fnegd	%f4, %f4
	.word	0xee08a01b	! t0_kref+0x2324:   	ldub	[%g2 + 0x1b], %l7
	.word	0x95702954	! t0_kref+0x2328:   	popc	0x954, %o2
	.word	0x26800002	! t0_kref+0x232c:   	bl,a	_kref+0x2334
	.word	0x90580000	! t0_kref+0x2330:   	smul	%g0, %g0, %o0
	.word	0x89a10924	! t0_kref+0x2334:   	fmuls	%f4, %f4, %f4
	.word	0x81a90a24	! t0_kref+0x2338:   	fcmps	%fcc0, %f4, %f4
	call	SYM(t0_subr2)
	.word	0x89a000a4	! t0_kref+0x2340:   	fnegs	%f4, %f4
	.word	0xd7f65000	! t0_kref+0x2344:   	casxa	[%i1]0x80, %g0, %o3
	.word	0x85803208	! t0_kref+0x2348:   	mov	0xfffff208, %ccr
	.word	0x95400000	! t0_kref+0x234c:   	mov	%y, %o2
	.word	0x96d031c0	! t0_kref+0x2350:   	umulcc	%g0, -0xe40, %o3
	.word	0xf3ee101c	! t0_kref+0x2354:   	prefetcha	%i0 + %i4, 25
	.word	0x89a108a4	! t0_kref+0x2358:   	fsubs	%f4, %f4, %f4
	.word	0x91b00040	! t0_kref+0x235c:   	edge8l	%g0, %g0, %o0
	.word	0xc030a00e	! t0_kref+0x2360:   	clrh	[%g2 + 0xe]
	.word	0x89b10e24	! t0_kref+0x2364:   	fands	%f4, %f4, %f4
	.word	0xd440a028	! t0_kref+0x2368:   	ldsw	[%g2 + 0x28], %o2
	.word	0xc028a03b	! t0_kref+0x236c:   	clrb	[%g2 + 0x3b]
	.word	0x89a10824	! t0_kref+0x2370:   	fadds	%f4, %f4, %f4
	.word	0x90202a9c	! t0_kref+0x2374:   	sub	%g0, 0xa9c, %o0
	.word	0xd6164000	! t0_kref+0x2378:   	lduh	[%i1], %o3
	.word	0xda4e8019	! t0_kref+0x237c:   	ldsb	[%i2 + %i1], %o5
	.word	0xc030a02e	! t0_kref+0x2380:   	clrh	[%g2 + 0x2e]
	.word	0x96502cfc	! t0_kref+0x2384:   	umul	%g0, 0xcfc, %o3
	.word	0x89b10d04	! t0_kref+0x2388:   	fandnot1	%f4, %f4, %f4
	.word	0x93b10484	! t0_kref+0x238c:   	fcmple32	%f4, %f4, %o1
	.word	0x89b106c4	! t0_kref+0x2390:   	fmul8sux16	%f4, %f4, %f4
	.word	0xecee1000	! t0_kref+0x2394:   	ldstuba	[%i0]0x80, %l6
	.word	0x89a108c4	! t0_kref+0x2398:   	fsubd	%f4, %f4, %f4
	.word	0xaf300000	! t0_kref+0x239c:   	srl	%g0, %g0, %l7
	.word	0xc020a02c	! t0_kref+0x23a0:   	clr	[%g2 + 0x2c]
	.word	0x89a01904	! t0_kref+0x23a4:   	fitod	%f4, %f4
	.word	0x80500000	! t0_kref+0x23a8:   	umul	%g0, %g0, %g0
	.word	0x89a01924	! t0_kref+0x23ac:   	fstod	%f4, %f4
	.word	0x89a00544	! t0_kref+0x23b0:   	fsqrtd	%f4, %f4
	.word	0x89a00124	! t0_kref+0x23b4:   	fabss	%f4, %f4
	.word	0x94500000	! t0_kref+0x23b8:   	umul	%g0, %g0, %o2
	.word	0xc0567ff8	! t0_kref+0x23bc:   	ldsh	[%i1 - 8], %g0
	.word	0x95400000	! t0_kref+0x23c0:   	mov	%y, %o2
	.word	0xc020a010	! t0_kref+0x23c4:   	clr	[%g2 + 0x10]
	.word	0x89b00c00	! t0_kref+0x23c8:   	fzero	%f4
	.word	0x89a01924	! t0_kref+0x23cc:   	fstod	%f4, %f4
	.word	0x92880000	! t0_kref+0x23d0:   	andcc	%g0, %g0, %o1
	.word	0x86102007	! t0_kref+0x23d4:   	mov	0x7, %g3
	.word	0x86a0e001	! t0_kref+0x23d8:   	subcc	%g3, 1, %g3
	.word	0x22800018	! t0_kref+0x23dc:   	be,a	_kref+0x243c
	.word	0x92583019	! t0_kref+0x23e0:   	smul	%g0, -0xfe7, %o1
	.word	0x89a10924	! t0_kref+0x23e4:   	fmuls	%f4, %f4, %f4
	.word	0x96d829ae	! t0_kref+0x23e8:   	smulcc	%g0, 0x9ae, %o3
	.word	0x89b10a24	! t0_kref+0x23ec:   	fpadd16s	%f4, %f4, %f4
	.word	0x92300000	! t0_kref+0x23f0:   	orn	%g0, %g0, %o1
	.word	0xde06200c	! t0_kref+0x23f4:   	ld	[%i0 + 0xc], %o7
	.word	0x80900000	! t0_kref+0x23f8:   	tst	%g0
	.word	0x8143c000	! t0_kref+0x23fc:   	stbar
	.word	0xecb81018	! t0_kref+0x2400:   	stda	%l6, [%g0 + %i0]0x80
	.word	0x89a10944	! t0_kref+0x2404:   	fmuld	%f4, %f4, %f4
	.word	0x80300000	! t0_kref+0x2408:   	orn	%g0, %g0, %g0
	.word	0xd2d81019	! t0_kref+0x240c:   	ldxa	[%g0 + %i1]0x80, %o1
	.word	0xae580000	! t0_kref+0x2410:   	smul	%g0, %g0, %l7
	.word	0xd808a029	! t0_kref+0x2414:   	ldub	[%g2 + 0x29], %o4
	.word	0x89a10924	! t0_kref+0x2418:   	fmuls	%f4, %f4, %f4
	.word	0x89a10944	! t0_kref+0x241c:   	fmuld	%f4, %f4, %f4
	.word	0xc9871059	! t0_kref+0x2420:   	lda	[%i4 + %i1]0x82, %f4
	.word	0x99280000	! t0_kref+0x2424:   	sll	%g0, %g0, %o4
	.word	0x81580000	! t0_kref+0x2428:   	flushw
	.word	0x26bfffeb	! t0_kref+0x242c:   	bl,a	_kref+0x23d8
	.word	0x80400000	! t0_kref+0x2430:   	addc	%g0, %g0, %g0
	.word	0x89a00124	! t0_kref+0x2434:   	fabss	%f4, %f4
	.word	0x94c03751	! t0_kref+0x2438:   	addccc	%g0, -0x8af, %o2
	.word	0x81a90a44	! t0_kref+0x243c:   	fcmpd	%fcc0, %f4, %f4
	.word	0xda08a016	! t0_kref+0x2440:   	ldub	[%g2 + 0x16], %o5
	.word	0x81db001f	! t0_kref+0x2444:   	flush	%o4 + %i7
	.word	0x20800005	! t0_kref+0x2448:   	bn,a	_kref+0x245c
	.word	0x89a01924	! t0_kref+0x244c:   	fstod	%f4, %f4
	.word	0x92b80000	! t0_kref+0x2450:   	xnorcc	%g0, %g0, %o1
	.word	0x80180000	! t0_kref+0x2454:   	xor	%g0, %g0, %g0
	.word	0x2e480007	! t0_kref+0x2458:   	bvs,a,pt	%icc, _kref+0x2474
	.word	0x90080000	! t0_kref+0x245c:   	and	%g0, %g0, %o0
	.word	0x89a10844	! t0_kref+0x2460:   	faddd	%f4, %f4, %f4
	.word	0x9108246c	! t0_kref+0x2464:   	tsubcc	%g0, 0x46c, %o0
	.word	0x89a10844	! t0_kref+0x2468:   	faddd	%f4, %f4, %f4
	.word	0xea7e7fec	! t0_kref+0x246c:   	swap	[%i1 - 0x14], %l5
	.word	0xd800a03c	! t0_kref+0x2470:   	ld	[%g2 + 0x3c], %o4
	.word	0xaf700000	! t0_kref+0x2474:   	popc	%g0, %l7
	.word	0xc900a014	! t0_kref+0x2478:   	ld	[%g2 + 0x14], %f4
	.word	0x9e18205b	! t0_kref+0x247c:   	xor	%g0, 0x5b, %o7
	.word	0xe03e0000	! t0_kref+0x2480:   	std	%l0, [%i0]
	.word	0x89a00524	! t0_kref+0x2484:   	fsqrts	%f4, %f4
	.word	0x89a00524	! t0_kref+0x2488:   	fsqrts	%f4, %f4
	.word	0x2c480008	! t0_kref+0x248c:   	bneg,a,pt	%icc, _kref+0x24ac
	.word	0x89b10e80	! t0_kref+0x2490:   	fsrc1	%f4, %f4
	.word	0x89b10e44	! t0_kref+0x2494:   	fxnor	%f4, %f4, %f4
	.word	0xc9be5840	! t0_kref+0x2498:   	stda	%f4, [%i1]0xc2
	.word	0x8143c000	! t0_kref+0x249c:   	stbar
	.word	0x90c00000	! t0_kref+0x24a0:   	addccc	%g0, %g0, %o0
	.word	0x89a10924	! t0_kref+0x24a4:   	fmuls	%f4, %f4, %f4
	.word	0xd43e3ff0	! t0_kref+0x24a8:   	std	%o2, [%i0 - 0x10]
	.word	0x9bb00140	! t0_kref+0x24ac:   	edge32l	%g0, %g0, %o5
	.word	0xdec71018	! t0_kref+0x24b0:   	ldswa	[%i4 + %i0]0x80, %o7
	.word	0x89a108c4	! t0_kref+0x24b4:   	fsubd	%f4, %f4, %f4
	.word	0xda50a032	! t0_kref+0x24b8:   	ldsh	[%g2 + 0x32], %o5
	.word	0xfdee101c	! t0_kref+0x24bc:   	prefetcha	%i0 + %i4, 30
	.word	0xc91fbf68	! t0_kref+0x24c0:   	ldd	[%fp - 0x98], %f4
	.word	0x99b00020	! t0_kref+0x24c4:   	edge8n	%g0, %g0, %o4
	.word	0xee08a037	! t0_kref+0x24c8:   	ldub	[%g2 + 0x37], %l7
	.word	0x89b107c4	! t0_kref+0x24cc:   	pdist	%f4, %f4, %f4
	.word	0xc920a00c	! t0_kref+0x24d0:   	st	%f4, [%g2 + 0xc]
	.word	0xc9270019	! t0_kref+0x24d4:   	st	%f4, [%i4 + %i1]
	.word	0xc0063fe4	! t0_kref+0x24d8:   	ld	[%i0 - 0x1c], %g0
	.word	0x89a000a4	! t0_kref+0x24dc:   	fnegs	%f4, %f4
	.word	0xf56e401b	! t0_kref+0x24e0:   	prefetch	%i1 + %i3, 26
	.word	0x89a10844	! t0_kref+0x24e4:   	faddd	%f4, %f4, %f4
	.word	0x22800006	! t0_kref+0x24e8:   	be,a	_kref+0x2500
	.word	0x8143c000	! t0_kref+0x24ec:   	stbar
	.word	0xd64e8019	! t0_kref+0x24f0:   	ldsb	[%i2 + %i1], %o3
	.word	0x89a01904	! t0_kref+0x24f4:   	fitod	%f4, %f4
	.word	0xc020a020	! t0_kref+0x24f8:   	clr	[%g2 + 0x20]
	.word	0x89a018c4	! t0_kref+0x24fc:   	fdtos	%f4, %f4
	call	SYM(t0_subr3)
	.word	0x81400000	! t0_kref+0x2504:   	mov	%y, %g0
	.word	0x89a00544	! t0_kref+0x2508:   	fsqrtd	%f4, %f4
	.word	0xae800000	! t0_kref+0x250c:   	addcc	%g0, %g0, %l7
	.word	0x9320330c	! t0_kref+0x2510:   	mulscc	%g0, -0xcf4, %o1
	.word	0xc807bfe8	! t0_kref+0x2514:   	ld	[%fp - 0x18], %g4
	.word	0x89a00524	! t0_kref+0x2518:   	fsqrts	%f4, %f4
	.word	0x89a108c4	! t0_kref+0x251c:   	fsubd	%f4, %f4, %f4
	.word	0x89a10844	! t0_kref+0x2520:   	faddd	%f4, %f4, %f4
	.word	0x81280000	! t0_kref+0x2524:   	sll	%g0, %g0, %g0
	.word	0xc9263fe4	! t0_kref+0x2528:   	st	%f4, [%i0 - 0x1c]
	.word	0x9bb00060	! t0_kref+0x252c:   	edge8ln	%g0, %g0, %o5
	.word	0xc920a008	! t0_kref+0x2530:   	st	%f4, [%g2 + 8]
	.word	0x89a01884	! t0_kref+0x2534:   	fitos	%f4, %f4
	.word	0x38800001	! t0_kref+0x2538:   	bgu,a	_kref+0x253c
	.word	0x89a108c4	! t0_kref+0x253c:   	fsubd	%f4, %f4, %f4
	.word	0x89b00c00	! t0_kref+0x2540:   	fzero	%f4
	.word	0x91302016	! t0_kref+0x2544:   	srl	%g0, 0x16, %o0
	.word	0x97b00160	! t0_kref+0x2548:   	edge32ln	%g0, %g0, %o3
	.word	0x89a10844	! t0_kref+0x254c:   	faddd	%f4, %f4, %f4
	.word	0xd45e2018	! t0_kref+0x2550:   	ldx	[%i0 + 0x18], %o2
	.word	0x98702e52	! t0_kref+0x2554:   	udiv	%g0, 0xe52, %o4
	.word	0x89a10944	! t0_kref+0x2558:   	fmuld	%f4, %f4, %f4
	.word	0xc02e0000	! t0_kref+0x255c:   	clrb	[%i0]
	.word	0xd840a02c	! t0_kref+0x2560:   	ldsw	[%g2 + 0x2c], %o4
	.word	0x89a108a4	! t0_kref+0x2564:   	fsubs	%f4, %f4, %f4
	.word	0x98800000	! t0_kref+0x2568:   	addcc	%g0, %g0, %o4
	.word	0x89b10624	! t0_kref+0x256c:   	fmul8x16	%f4, %f4, %f4
	.word	0x89a10844	! t0_kref+0x2570:   	faddd	%f4, %f4, %f4
	.word	0xc91fbcf8	! t0_kref+0x2574:   	ldd	[%fp - 0x308], %f4
	.word	0xd050a018	! t0_kref+0x2578:   	ldsh	[%g2 + 0x18], %o0
	.word	0x89a10944	! t0_kref+0x257c:   	fmuld	%f4, %f4, %f4
	.word	0xc02e401a	! t0_kref+0x2580:   	clrb	[%i1 + %i2]
	.word	0xec3e4000	! t0_kref+0x2584:   	std	%l6, [%i1]
	.word	0x81a90aa4	! t0_kref+0x2588:   	fcmpes	%fcc0, %f4, %f4
	.word	0x80a83290	! t0_kref+0x258c:   	andncc	%g0, -0xd70, %g0
	.word	0xc030a004	! t0_kref+0x2590:   	clrh	[%g2 + 4]
	.word	0x89b10aa4	! t0_kref+0x2594:   	fpsub16s	%f4, %f4, %f4
	.word	0xd000a02c	! t0_kref+0x2598:   	ld	[%g2 + 0x2c], %o0
	.word	0xc0262008	! t0_kref+0x259c:   	clr	[%i0 + 8]
	.word	0xc91fbef0	! t0_kref+0x25a0:   	ldd	[%fp - 0x110], %f4
	.word	0x89a10944	! t0_kref+0x25a4:   	fmuld	%f4, %f4, %f4
	.word	0xd816001b	! t0_kref+0x25a8:   	lduh	[%i0 + %i3], %o4
	.word	0x89b00f24	! t0_kref+0x25ac:   	fsrc2s	%f4, %f4
	.word	0x80e035cb	! t0_kref+0x25b0:   	subccc	%g0, -0xa35, %g0
	.word	0xc900a038	! t0_kref+0x25b4:   	ld	[%g2 + 0x38], %f4
	.word	0x89a00524	! t0_kref+0x25b8:   	fsqrts	%f4, %f4
	.word	0xd41e3ff0	! t0_kref+0x25bc:   	ldd	[%i0 - 0x10], %o2
	.word	0xe7ee501a	! t0_kref+0x25c0:   	prefetcha	%i1 + %i2, 19
	.word	0x9fc10000	! t0_kref+0x25c4:   	call	%g4
	.word	0x89a01924	! t0_kref+0x25c8:   	fstod	%f4, %f4
	.word	0x93418000	! t0_kref+0x25cc:   	mov	%fprs, %o1
	.word	0xc900a024	! t0_kref+0x25d0:   	ld	[%g2 + 0x24], %f4
	.word	0xd67e7ff8	! t0_kref+0x25d4:   	swap	[%i1 - 8], %o3
	.word	0x9a803fe6	! t0_kref+0x25d8:   	addcc	%g0, -0x1a, %o5
	.word	0x89b10a24	! t0_kref+0x25dc:   	fpadd16s	%f4, %f4, %f4
	.word	0xd6060000	! t0_kref+0x25e0:   	ld	[%i0], %o3
	.word	0x89a109c4	! t0_kref+0x25e4:   	fdivd	%f4, %f4, %f4
	.word	0x92e033ab	! t0_kref+0x25e8:   	subccc	%g0, -0xc55, %o1
	.word	0xc020a00c	! t0_kref+0x25ec:   	clr	[%g2 + 0xc]
	.word	0x26480005	! t0_kref+0x25f0:   	bl,a,pt	%icc, _kref+0x2604
	.word	0x90a832fe	! t0_kref+0x25f4:   	andncc	%g0, -0xd02, %o0
	.word	0x80f82965	! t0_kref+0x25f8:   	sdivcc	%g0, 0x965, %g0
	.word	0x36800004	! t0_kref+0x25fc:   	bge,a	_kref+0x260c
	.word	0x96300000	! t0_kref+0x2600:   	orn	%g0, %g0, %o3
	.word	0x97b10584	! t0_kref+0x2604:   	fcmpgt32	%f4, %f4, %o3
	.word	0x92e00000	! t0_kref+0x2608:   	subccc	%g0, %g0, %o1
	.word	0x9e083f97	! t0_kref+0x260c:   	and	%g0, -0x69, %o7
	.word	0xc9be5800	! t0_kref+0x2610:   	stda	%f4, [%i1]0xc0
	.word	0x929826c4	! t0_kref+0x2614:   	xorcc	%g0, 0x6c4, %o1
	.word	0x9de3bfa0	! t0_kref+0x2618:   	save	%sp, -0x60, %sp
	.word	0x95ef401d	! t0_kref+0x261c:   	restore	%i5, %i5, %o2
	.word	0x89a00024	! t0_kref+0x2620:   	fmovs	%f4, %f4
	.word	0x81a90ac4	! t0_kref+0x2624:   	fcmped	%fcc0, %f4, %f4
	.word	0xc91fbf20	! t0_kref+0x2628:   	ldd	[%fp - 0xe0], %f4
	.word	0xd016001b	! t0_kref+0x262c:   	lduh	[%i0 + %i3], %o0
	.word	0xc9066018	! t0_kref+0x2630:   	ld	[%i1 + 0x18], %f4
	.word	0x89a01904	! t0_kref+0x2634:   	fitod	%f4, %f4
	.word	0xda7e7fe4	! t0_kref+0x2638:   	swap	[%i1 - 0x1c], %o5
	.word	0x193c177b	! t0_kref+0x263c:   	sethi	%hi(0xf05dec00), %o4
	.word	0xafb00200	! t0_kref+0x2640:   	array8	%g0, %g0, %l7
	.word	0x99b00140	! t0_kref+0x2644:   	edge32l	%g0, %g0, %o4
	.word	0x38800002	! t0_kref+0x2648:   	bgu,a	_kref+0x2650
	.word	0x81df6936	! t0_kref+0x264c:   	flush	%i5 + 0x936
	.word	0xc030a000	! t0_kref+0x2650:   	clrh	[%g2]
	.word	0xc020a024	! t0_kref+0x2654:   	clr	[%g2 + 0x24]
	.word	0x90202261	! t0_kref+0x2658:   	sub	%g0, 0x261, %o0
	.word	0x89a10944	! t0_kref+0x265c:   	fmuld	%f4, %f4, %f4
	.word	0x94300000	! t0_kref+0x2660:   	orn	%g0, %g0, %o2
	.word	0xae182682	! t0_kref+0x2664:   	xor	%g0, 0x682, %l7
	.word	0x89b107c4	! t0_kref+0x2668:   	pdist	%f4, %f4, %f4
	.word	0x90900000	! t0_kref+0x266c:   	orcc	%g0, %g0, %o0
	.word	0xaf302015	! t0_kref+0x2670:   	srl	%g0, 0x15, %l7
	.word	0x89a018c4	! t0_kref+0x2674:   	fdtos	%f4, %f4
	.word	0xd04e0000	! t0_kref+0x2678:   	ldsb	[%i0], %o0
	.word	0x944031f8	! t0_kref+0x267c:   	addc	%g0, -0xe08, %o2
	.word	0x98102f88	! t0_kref+0x2680:   	mov	0xf88, %o4
	.word	0x9ae028a6	! t0_kref+0x2684:   	subccc	%g0, 0x8a6, %o5
	.word	0x90983c95	! t0_kref+0x2688:   	xorcc	%g0, -0x36b, %o0
	.word	0xc028a007	! t0_kref+0x268c:   	clrb	[%g2 + 7]
	.word	0x89a00124	! t0_kref+0x2690:   	fabss	%f4, %f4
	.word	0x89b10f84	! t0_kref+0x2694:   	for	%f4, %f4, %f4
	.word	0x89a01904	! t0_kref+0x2698:   	fitod	%f4, %f4
	.word	0x81300000	! t0_kref+0x269c:   	srl	%g0, %g0, %g0
	.word	0x94f80000	! t0_kref+0x26a0:   	sdivcc	%g0, %g0, %o2
	.word	0x89a018c4	! t0_kref+0x26a4:   	fdtos	%f4, %f4
	.word	0x89a01a44	! t0_kref+0x26a8:   	fdtoi	%f4, %f4
	.word	0x89b10744	! t0_kref+0x26ac:   	fpack32	%f4, %f4, %f4
	.word	0x89a10844	! t0_kref+0x26b0:   	faddd	%f4, %f4, %f4
	.word	0xc807bff0	! t0_kref+0x26b4:   	ld	[%fp - 0x10], %g4
	.word	0x89a00044	! t0_kref+0x26b8:   	fmovd	%f4, %f4
	.word	0x92f82d55	! t0_kref+0x26bc:   	sdivcc	%g0, 0xd55, %o1
	.word	0x81580000	! t0_kref+0x26c0:   	flushw
	.word	0x981022c2	! t0_kref+0x26c4:   	mov	0x2c2, %o4
	.word	0x9fc00004	! t0_kref+0x26c8:   	call	%g0 + %g4
	.word	0x91200000	! t0_kref+0x26cc:   	mulscc	%g0, %g0, %o0
	.word	0x89b10c84	! t0_kref+0x26d0:   	fandnot2	%f4, %f4, %f4
	.word	0x89a10824	! t0_kref+0x26d4:   	fadds	%f4, %f4, %f4
	.word	0x89b10e64	! t0_kref+0x26d8:   	fxnors	%f4, %f4, %f4
	.word	0x81a90a44	! t0_kref+0x26dc:   	fcmpd	%fcc0, %f4, %f4
	.word	0x89a000a4	! t0_kref+0x26e0:   	fnegs	%f4, %f4
	.word	0x86102002	! t0_kref+0x26e4:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x26e8:   	bne,a	_kref+0x26e8
	.word	0x86a0e001	! t0_kref+0x26ec:   	subcc	%g3, 1, %g3
	.word	0x89b10744	! t0_kref+0x26f0:   	fpack32	%f4, %f4, %f4
	.word	0xc91fbef8	! t0_kref+0x26f4:   	ldd	[%fp - 0x108], %f4
	.word	0x89a00524	! t0_kref+0x26f8:   	fsqrts	%f4, %f4
	.word	0x96e00000	! t0_kref+0x26fc:   	subccc	%g0, %g0, %o3
	.word	0x928032ea	! t0_kref+0x2700:   	addcc	%g0, -0xd16, %o1
	.word	0xc91fbda0	! t0_kref+0x2704:   	ldd	[%fp - 0x260], %f4
	.word	0xd41e7ff8	! t0_kref+0x2708:   	ldd	[%i1 - 8], %o2
	.word	0x30800002	! t0_kref+0x270c:   	ba,a	_kref+0x2714
	.word	0x89b00c20	! t0_kref+0x2710:   	fzeros	%f4
	.word	0x89a01924	! t0_kref+0x2714:   	fstod	%f4, %f4
	.word	0x95400000	! t0_kref+0x2718:   	mov	%y, %o2
	.word	0xd80e6018	! t0_kref+0x271c:   	ldub	[%i1 + 0x18], %o4
	.word	0xda06401c	! t0_kref+0x2720:   	ld	[%i1 + %i4], %o5
	.word	0xc020a00c	! t0_kref+0x2724:   	clr	[%g2 + 0xc]
	.word	0x80900000	! t0_kref+0x2728:   	tst	%g0
	.word	0x96c00000	! t0_kref+0x272c:   	addccc	%g0, %g0, %o3
	.word	0x26480006	! t0_kref+0x2730:   	bl,a,pt	%icc, _kref+0x2748
	.word	0xc91fbce8	! t0_kref+0x2734:   	ldd	[%fp - 0x318], %f4
	.word	0x9ef80000	! t0_kref+0x2738:   	sdivcc	%g0, %g0, %o7
	.word	0x89a108c4	! t0_kref+0x273c:   	fsubd	%f4, %f4, %f4
	.word	0xe27e3fec	! t0_kref+0x2740:   	swap	[%i0 - 0x14], %l1
	.word	0x89a00524	! t0_kref+0x2744:   	fsqrts	%f4, %f4
	.word	0x22800004	! t0_kref+0x2748:   	be,a	_kref+0x2758
	.word	0x9af82fa7	! t0_kref+0x274c:   	sdivcc	%g0, 0xfa7, %o5
	.word	0x89b10744	! t0_kref+0x2750:   	fpack32	%f4, %f4, %f4
	.word	0x89b10d24	! t0_kref+0x2754:   	fandnot1s	%f4, %f4, %f4
	.word	0x9f300000	! t0_kref+0x2758:   	srl	%g0, %g0, %o7
	.word	0x89a000a4	! t0_kref+0x275c:   	fnegs	%f4, %f4
	.word	0x89b10d24	! t0_kref+0x2760:   	fandnot1s	%f4, %f4, %f4
	.word	0x9ad00000	! t0_kref+0x2764:   	umulcc	%g0, %g0, %o5
	.word	0xeefe5000	! t0_kref+0x2768:   	swapa	[%i1]0x80, %l7
	.word	0xc9be1800	! t0_kref+0x276c:   	stda	%f4, [%i0]0xc0
	call	SYM(t0_subr0)
	.word	0x93b10404	! t0_kref+0x2774:   	fcmple16	%f4, %f4, %o1
	.word	0x92f82d4a	! t0_kref+0x2778:   	sdivcc	%g0, 0xd4a, %o1
	.word	0x98500000	! t0_kref+0x277c:   	umul	%g0, %g0, %o4
	.word	0x29480004	! t0_kref+0x2780:   	fbl,a,pt	%fcc0, _kref+0x2790
	.word	0xae303548	! t0_kref+0x2784:   	orn	%g0, -0xab8, %l7
	.word	0xc99e5a1d	! t0_kref+0x2788:   	ldda	[%i1 + %i5]0xd0, %f4
	.word	0xd41f4019	! t0_kref+0x278c:   	ldd	[%i5 + %i1], %o2
	.word	0x89b10964	! t0_kref+0x2790:   	fpmerge	%f4, %f4, %f4
	.word	0xee0e401a	! t0_kref+0x2794:   	ldub	[%i1 + %i2], %l7
	.word	0xaed80000	! t0_kref+0x2798:   	smulcc	%g0, %g0, %l7
	.word	0x89b10664	! t0_kref+0x279c:   	fmul8x16au	%f4, %f4, %f4
	.word	0xc030a030	! t0_kref+0x27a0:   	clrh	[%g2 + 0x30]
	.word	0x93b00000	! t0_kref+0x27a4:   	edge8	%g0, %g0, %o1
	.word	0xc0767ff8	! t0_kref+0x27a8:   	stx	%g0, [%i1 - 8]
	.word	0xaeb80000	! t0_kref+0x27ac:   	xnorcc	%g0, %g0, %l7
	.word	0x89b00c20	! t0_kref+0x27b0:   	fzeros	%f4
	.word	0x98f80000	! t0_kref+0x27b4:   	sdivcc	%g0, %g0, %o4
	.word	0x89a10844	! t0_kref+0x27b8:   	faddd	%f4, %f4, %f4
	.word	0x92c03e4c	! t0_kref+0x27bc:   	addccc	%g0, -0x1b4, %o1
	.word	0xda0e7feb	! t0_kref+0x27c0:   	ldub	[%i1 - 0x15], %o5
	.word	0x96e0254c	! t0_kref+0x27c4:   	subccc	%g0, 0x54c, %o3
	.word	0x9e080000	! t0_kref+0x27c8:   	and	%g0, %g0, %o7
	.word	0xc020a018	! t0_kref+0x27cc:   	clr	[%g2 + 0x18]
	call	SYM(t0_subr0)
	.word	0x9928201f	! t0_kref+0x27d4:   	sll	%g0, 0x1f, %o4
	.word	0x89a108c4	! t0_kref+0x27d8:   	fsubd	%f4, %f4, %f4
	.word	0x2a800001	! t0_kref+0x27dc:   	bcs,a	_kref+0x27e0
	.word	0x89a10844	! t0_kref+0x27e0:   	faddd	%f4, %f4, %f4
	.word	0xd2de5000	! t0_kref+0x27e4:   	ldxa	[%i1]0x80, %o1
	.word	0x96c02d69	! t0_kref+0x27e8:   	addccc	%g0, 0xd69, %o3
	.word	0x89a01924	! t0_kref+0x27ec:   	fstod	%f4, %f4
	.word	0xaf200000	! t0_kref+0x27f0:   	mulscc	%g0, %g0, %l7
	.word	0x89a01904	! t0_kref+0x27f4:   	fitod	%f4, %f4
	.word	0xd43e3ff8	! t0_kref+0x27f8:   	std	%o2, [%i0 - 8]
	.word	0xd6ee5000	! t0_kref+0x27fc:   	ldstuba	[%i1]0x80, %o3
	.word	0xc008a01e	! t0_kref+0x2800:   	ldub	[%g2 + 0x1e], %g0
	.word	0xd20e3ff7	! t0_kref+0x2804:   	ldub	[%i0 - 9], %o1
	.word	0xc0066008	! t0_kref+0x2808:   	ld	[%i1 + 8], %g0
	.word	0xe9ee101d	! t0_kref+0x280c:   	prefetcha	%i0 + %i5, 20
	.word	0x9a783740	! t0_kref+0x2810:   	sdiv	%g0, -0x8c0, %o5
	.word	0xda48a015	! t0_kref+0x2814:   	ldsb	[%g2 + 0x15], %o5
	call	SYM(t0_subr2)
	.word	0x89a00044	! t0_kref+0x281c:   	fmovd	%f4, %f4
	.word	0x81b01021	! t0_kref+0x2820:   	siam	0x1
	.word	0xc91fbd30	! t0_kref+0x2824:   	ldd	[%fp - 0x2d0], %f4
	.word	0x89a10944	! t0_kref+0x2828:   	fmuld	%f4, %f4, %f4
	.word	0x26800006	! t0_kref+0x282c:   	bl,a	_kref+0x2844
	.word	0xc028a001	! t0_kref+0x2830:   	clrb	[%g2 + 1]
	.word	0xc030a008	! t0_kref+0x2834:   	clrh	[%g2 + 8]
	.word	0x34480002	! t0_kref+0x2838:   	bg,a,pt	%icc, _kref+0x2840
	.word	0x98880000	! t0_kref+0x283c:   	andcc	%g0, %g0, %o4
	.word	0x89b00c00	! t0_kref+0x2840:   	fzero	%f4
	.word	0x81b10504	! t0_kref+0x2844:   	fcmpgt16	%f4, %f4, %g0
	.word	0x81a90ac4	! t0_kref+0x2848:   	fcmped	%fcc0, %f4, %f4
	.word	0xd2871040	! t0_kref+0x284c:   	lda	[%i4]0x82, %o1
	.word	0x98300000	! t0_kref+0x2850:   	orn	%g0, %g0, %o4
	.word	0x89a01924	! t0_kref+0x2854:   	fstod	%f4, %f4
	.word	0x94800000	! t0_kref+0x2858:   	addcc	%g0, %g0, %o2
	.word	0xc91e401d	! t0_kref+0x285c:   	ldd	[%i1 + %i5], %f4
	.word	0x89b10f64	! t0_kref+0x2860:   	fornot1s	%f4, %f4, %f4
	.word	0x89a000c4	! t0_kref+0x2864:   	fnegd	%f4, %f4
	.word	0x9e383352	! t0_kref+0x2868:   	xnor	%g0, -0xcae, %o7
	.word	0xd040a01c	! t0_kref+0x286c:   	ldsw	[%g2 + 0x1c], %o0
	.word	0x9e20371f	! t0_kref+0x2870:   	sub	%g0, -0x8e1, %o7
	.word	0xc028a01e	! t0_kref+0x2874:   	clrb	[%g2 + 0x1e]
	.word	0x89a108c4	! t0_kref+0x2878:   	fsubd	%f4, %f4, %f4
	.word	0x8143c000	! t0_kref+0x287c:   	stbar
	.word	0xd808a012	! t0_kref+0x2880:   	ldub	[%g2 + 0x12], %o4
	.word	0xd00e4000	! t0_kref+0x2884:   	ldub	[%i1], %o0
	.word	0x9af83461	! t0_kref+0x2888:   	sdivcc	%g0, -0xb9f, %o5
	.word	0xffee101d	! t0_kref+0x288c:   	prefetcha	%i0 + %i5, 31
	.word	0x89b10ac4	! t0_kref+0x2890:   	fpsub32	%f4, %f4, %f4
	.word	0x89a10844	! t0_kref+0x2894:   	faddd	%f4, %f4, %f4
	.word	0xc0260000	! t0_kref+0x2898:   	clr	[%i0]
	.word	0xc028a03e	! t0_kref+0x289c:   	clrb	[%g2 + 0x3e]
	.word	0x90600000	! t0_kref+0x28a0:   	subc	%g0, %g0, %o0
	.word	0x92180000	! t0_kref+0x28a4:   	xor	%g0, %g0, %o1
	.word	0x9a080000	! t0_kref+0x28a8:   	and	%g0, %g0, %o5
	.word	0x89a000a4	! t0_kref+0x28ac:   	fnegs	%f4, %f4
	.word	0x91b00160	! t0_kref+0x28b0:   	edge32ln	%g0, %g0, %o0
	.word	0x9a402af8	! t0_kref+0x28b4:   	addc	%g0, 0xaf8, %o5
	.word	0x89a10924	! t0_kref+0x28b8:   	fmuls	%f4, %f4, %f4
	.word	0xae980000	! t0_kref+0x28bc:   	xorcc	%g0, %g0, %l7
	.word	0x89a10944	! t0_kref+0x28c0:   	fmuld	%f4, %f4, %f4
	.word	0x9aa80000	! t0_kref+0x28c4:   	andncc	%g0, %g0, %o5
	.word	0xaea80000	! t0_kref+0x28c8:   	andncc	%g0, %g0, %l7
	.word	0xc020a020	! t0_kref+0x28cc:   	clr	[%g2 + 0x20]
	.word	0x89b10624	! t0_kref+0x28d0:   	fmul8x16	%f4, %f4, %f4
	.word	0x89a000a4	! t0_kref+0x28d4:   	fnegs	%f4, %f4
	.word	0xec180018	! t0_kref+0x28d8:   	ldd	[%g0 + %i0], %l6
	.word	0xde08a02c	! t0_kref+0x28dc:   	ldub	[%g2 + 0x2c], %o7
	.word	0xda066000	! t0_kref+0x28e0:   	ld	[%i1], %o5
	.word	0x89a00544	! t0_kref+0x28e4:   	fsqrtd	%f4, %f4
	.word	0x86102001	! t0_kref+0x28e8:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x28ec:   	bne,a	_kref+0x28ec
	.word	0x86a0e001	! t0_kref+0x28f0:   	subcc	%g3, 1, %g3
	.word	0xc028a000	! t0_kref+0x28f4:   	clrb	[%g2]
	.word	0x89a01884	! t0_kref+0x28f8:   	fitos	%f4, %f4
	.word	0x80403cb2	! t0_kref+0x28fc:   	addc	%g0, -0x34e, %g0
	.word	0x9de3bfa0	! t0_kref+0x2900:   	save	%sp, -0x60, %sp
	.word	0x81ee4018	! t0_kref+0x2904:   	restore	%i1, %i0, %g0
	.word	0x96980000	! t0_kref+0x2908:   	xorcc	%g0, %g0, %o3
	.word	0x9fc10000	! t0_kref+0x290c:   	call	%g4
	.word	0xc91fbf30	! t0_kref+0x2910:   	ldd	[%fp - 0xd0], %f4
	.word	0x9ac03bef	! t0_kref+0x2914:   	addccc	%g0, -0x411, %o5
	.word	0x89a10844	! t0_kref+0x2918:   	faddd	%f4, %f4, %f4
	.word	0x96502ddf	! t0_kref+0x291c:   	umul	%g0, 0xddf, %o3
	.word	0x20800007	! t0_kref+0x2920:   	bn,a	_kref+0x293c
	.word	0xe41e4000	! t0_kref+0x2924:   	ldd	[%i1], %l2
	.word	0xfd6e6010	! t0_kref+0x2928:   	prefetch	%i1 + 0x10, 30
	.word	0x89a10924	! t0_kref+0x292c:   	fmuls	%f4, %f4, %f4
	.word	0x91b00140	! t0_kref+0x2930:   	edge32l	%g0, %g0, %o0
	.word	0xaef80000	! t0_kref+0x2934:   	sdivcc	%g0, %g0, %l7
	.word	0x91b10504	! t0_kref+0x2938:   	fcmpgt16	%f4, %f4, %o0
	.word	0x80300000	! t0_kref+0x293c:   	orn	%g0, %g0, %g0
	.word	0xe3b8a080	! t0_kref+0x2940:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x80603ecc	! t0_kref+0x2944:   	subc	%g0, -0x134, %g0
	.word	0x9fc10000	! t0_kref+0x2948:   	call	%g4
	.word	0xc9063fe8	! t0_kref+0x294c:   	ld	[%i0 - 0x18], %f4
	.word	0xd83e2008	! t0_kref+0x2950:   	std	%o4, [%i0 + 8]
	.word	0x99b00140	! t0_kref+0x2954:   	edge32l	%g0, %g0, %o4
	.word	0x89a108a4	! t0_kref+0x2958:   	fsubs	%f4, %f4, %f4
	.word	0x89a00124	! t0_kref+0x295c:   	fabss	%f4, %f4
	.word	0x89a10924	! t0_kref+0x2960:   	fmuls	%f4, %f4, %f4
	.word	0x9bb00140	! t0_kref+0x2964:   	edge32l	%g0, %g0, %o5
	.word	0xc026201c	! t0_kref+0x2968:   	clr	[%i0 + 0x1c]
	.word	0x89a01a44	! t0_kref+0x296c:   	fdtoi	%f4, %f4
	.word	0x89a000a4	! t0_kref+0x2970:   	fnegs	%f4, %f4
	.word	0x89a01924	! t0_kref+0x2974:   	fstod	%f4, %f4
	.word	0x89b10964	! t0_kref+0x2978:   	fpmerge	%f4, %f4, %f4
	.word	0x89a000a4	! t0_kref+0x297c:   	fnegs	%f4, %f4
	.word	0x89b10f84	! t0_kref+0x2980:   	for	%f4, %f4, %f4
	.word	0xc91fbc50	! t0_kref+0x2984:   	ldd	[%fp - 0x3b0], %f4
	.word	0x96500000	! t0_kref+0x2988:   	umul	%g0, %g0, %o3
	.word	0xc0762008	! t0_kref+0x298c:   	stx	%g0, [%i0 + 8]
	.word	0x89a108c4	! t0_kref+0x2990:   	fsubd	%f4, %f4, %f4
	.word	0x34800003	! t0_kref+0x2994:   	bg,a	_kref+0x29a0
	.word	0xc9be5a5d	! t0_kref+0x2998:   	stda	%f4, [%i1 + %i5]0xd2
	.word	0x89a109c4	! t0_kref+0x299c:   	fdivd	%f4, %f4, %f4
	.word	0x96403e73	! t0_kref+0x29a0:   	addc	%g0, -0x18d, %o3
	.word	0xc028a00b	! t0_kref+0x29a4:   	clrb	[%g2 + 0xb]
	.word	0x80a83a7b	! t0_kref+0x29a8:   	andncc	%g0, -0x585, %g0
	.word	0x81a90aa4	! t0_kref+0x29ac:   	fcmpes	%fcc0, %f4, %f4
	.word	0xc02e8019	! t0_kref+0x29b0:   	clrb	[%i2 + %i1]
	.word	0x95302014	! t0_kref+0x29b4:   	srl	%g0, 0x14, %o2
	.word	0x3e800007	! t0_kref+0x29b8:   	bvc,a	_kref+0x29d4
	.word	0xc807bfe4	! t0_kref+0x29bc:   	ld	[%fp - 0x1c], %g4
	.word	0x30800003	! t0_kref+0x29c0:   	ba,a	_kref+0x29cc
	.word	0x91b00020	! t0_kref+0x29c4:   	edge8n	%g0, %g0, %o0
	.word	0x92503c42	! t0_kref+0x29c8:   	umul	%g0, -0x3be, %o1
	.word	0xf5ee501d	! t0_kref+0x29cc:   	prefetcha	%i1 + %i5, 26
	.word	0x93202bf6	! t0_kref+0x29d0:   	mulscc	%g0, 0xbf6, %o1
	.word	0x9a500000	! t0_kref+0x29d4:   	umul	%g0, %g0, %o5
	.word	0x89a01904	! t0_kref+0x29d8:   	fitod	%f4, %f4
	.word	0x97b00020	! t0_kref+0x29dc:   	edge8n	%g0, %g0, %o3
	.word	0x89a00144	! t0_kref+0x29e0:   	fabsd	%f4, %f4
	.word	0x86102001	! t0_kref+0x29e4:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x29e8:   	bne,a	_kref+0x29e8
	.word	0x86a0e001	! t0_kref+0x29ec:   	subcc	%g3, 1, %g3
	.word	0x95280000	! t0_kref+0x29f0:   	sll	%g0, %g0, %o2
	.word	0x99b00020	! t0_kref+0x29f4:   	edge8n	%g0, %g0, %o4
	.word	0x2e800001	! t0_kref+0x29f8:   	bvs,a	_kref+0x29fc
	.word	0xc020a038	! t0_kref+0x29fc:   	clr	[%g2 + 0x38]
	.word	0x89a00544	! t0_kref+0x2a00:   	fsqrtd	%f4, %f4
	.word	0x90703db2	! t0_kref+0x2a04:   	udiv	%g0, -0x24e, %o0
	.word	0x98d82ac1	! t0_kref+0x2a08:   	smulcc	%g0, 0xac1, %o4
	.word	0xd6060000	! t0_kref+0x2a0c:   	ld	[%i0], %o3
	.word	0x89a10944	! t0_kref+0x2a10:   	fmuld	%f4, %f4, %f4
	.word	0x9de3bfa0	! t0_kref+0x2a14:   	save	%sp, -0x60, %sp
	.word	0x99eeb2ca	! t0_kref+0x2a18:   	restore	%i2, -0xd36, %o4
	.word	0x9b408000	! t0_kref+0x2a1c:   	mov	%ccr, %o5
	.word	0x81a90aa4	! t0_kref+0x2a20:   	fcmpes	%fcc0, %f4, %f4
	.word	0xc028a036	! t0_kref+0x2a24:   	clrb	[%g2 + 0x36]
	.word	0x81a90a24	! t0_kref+0x2a28:   	fcmps	%fcc0, %f4, %f4
	.word	0x86102004	! t0_kref+0x2a2c:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x2a30:   	bne,a	_kref+0x2a30
	.word	0x86a0e001	! t0_kref+0x2a34:   	subcc	%g3, 1, %g3
	.word	0x92400000	! t0_kref+0x2a38:   	addc	%g0, %g0, %o1
	.word	0x89b10e64	! t0_kref+0x2a3c:   	fxnors	%f4, %f4, %f4
	.word	0x89a000a4	! t0_kref+0x2a40:   	fnegs	%f4, %f4
	.word	0x94b82637	! t0_kref+0x2a44:   	xnorcc	%g0, 0x637, %o2
	.word	0x89a000a4	! t0_kref+0x2a48:   	fnegs	%f4, %f4
	.word	0x9ef80000	! t0_kref+0x2a4c:   	sdivcc	%g0, %g0, %o7
	.word	0x89b10da4	! t0_kref+0x2a50:   	fxors	%f4, %f4, %f4
	.word	0x89a9c024	! t0_kref+0x2a54:   	fmovsu	%fcc0, %f4, %f4
	.word	0x3c480001	! t0_kref+0x2a58:   	bpos,a,pt	%icc, _kref+0x2a5c
	.word	0xc096d019	! t0_kref+0x2a5c:   	lduha	[%i3 + %i1]0x80, %g0
	.word	0xd816401b	! t0_kref+0x2a60:   	lduh	[%i1 + %i3], %o4
	.word	0xc000a028	! t0_kref+0x2a64:   	ld	[%g2 + 0x28], %g0
	.word	0xc0b6101b	! t0_kref+0x2a68:   	stha	%g0, [%i0 + %i3]0x80
	.word	0x89a00124	! t0_kref+0x2a6c:   	fabss	%f4, %f4
	.word	0xdac71019	! t0_kref+0x2a70:   	ldswa	[%i4 + %i1]0x80, %o5
	.word	0x89a108c4	! t0_kref+0x2a74:   	fsubd	%f4, %f4, %f4
	.word	0x89b00c20	! t0_kref+0x2a78:   	fzeros	%f4
	.word	0x90402e93	! t0_kref+0x2a7c:   	addc	%g0, 0xe93, %o0
	.word	0x9af80000	! t0_kref+0x2a80:   	sdivcc	%g0, %g0, %o5
	.word	0x989027bf	! t0_kref+0x2a84:   	orcc	%g0, 0x7bf, %o4
	.word	0x92400000	! t0_kref+0x2a88:   	addc	%g0, %g0, %o1
	.word	0xc91fbeb0	! t0_kref+0x2a8c:   	ldd	[%fp - 0x150], %f4
	.word	0x89a00544	! t0_kref+0x2a90:   	fsqrtd	%f4, %f4
	.word	0xf007bfe0	! t0_kref+0x2a94:   	ld	[%fp - 0x20], %i0
	.word	0xc030a00c	! t0_kref+0x2a98:   	clrh	[%g2 + 0xc]
	.word	0xc91fbf40	! t0_kref+0x2a9c:   	ldd	[%fp - 0xc0], %f4
	.word	0xe3b8a080	! t0_kref+0x2aa0:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xef68a083	! t0_kref+0x2aa4:   	prefetch	%g2 + 0x83, 23
	.word	0x9fc10000	! t0_kref+0x2aa8:   	call	%g4
	.word	0xc020a01c	! t0_kref+0x2aac:   	clr	[%g2 + 0x1c]
	.word	0x9bb00060	! t0_kref+0x2ab0:   	edge8ln	%g0, %g0, %o5
	.word	0x96700000	! t0_kref+0x2ab4:   	udiv	%g0, %g0, %o3
	.word	0x81dec010	! t0_kref+0x2ab8:   	flush	%i3 + %l0
	.word	0x89a10944	! t0_kref+0x2abc:   	fmuld	%f4, %f4, %f4
	.word	0x96000000	! t0_kref+0x2ac0:   	add	%g0, %g0, %o3
	.word	0x89b10f44	! t0_kref+0x2ac4:   	fornot1	%f4, %f4, %f4
	.word	0x98d0286c	! t0_kref+0x2ac8:   	umulcc	%g0, 0x86c, %o4
	.word	0x9ea80000	! t0_kref+0x2acc:   	andncc	%g0, %g0, %o7
	.word	0x89a10824	! t0_kref+0x2ad0:   	fadds	%f4, %f4, %f4
	.word	0x89a10844	! t0_kref+0x2ad4:   	faddd	%f4, %f4, %f4
	.word	0x90700000	! t0_kref+0x2ad8:   	udiv	%g0, %g0, %o0
	call	SYM(t0_subr0)
	.word	0x89a108a4	! t0_kref+0x2ae0:   	fsubs	%f4, %f4, %f4
	.word	0x9ae00000	! t0_kref+0x2ae4:   	subccc	%g0, %g0, %o5
	.word	0x89b00764	! t0_kref+0x2ae8:   	fpack16	%f4, %f4
	.word	0xd8de5000	! t0_kref+0x2aec:   	ldxa	[%i1]0x80, %o4
	.word	0xc920a018	! t0_kref+0x2af0:   	st	%f4, [%g2 + 0x18]
	.word	0x98e02bd5	! t0_kref+0x2af4:   	subccc	%g0, 0xbd5, %o4
	.word	0x89a108c4	! t0_kref+0x2af8:   	fsubd	%f4, %f4, %f4
	.word	0xc020a028	! t0_kref+0x2afc:   	clr	[%g2 + 0x28]
	.word	0x89a10944	! t0_kref+0x2b00:   	fmuld	%f4, %f4, %f4
	.word	0x89b10ea0	! t0_kref+0x2b04:   	fsrc1s	%f4, %f4
	.word	0xc900a008	! t0_kref+0x2b08:   	ld	[%g2 + 8], %f4
	.word	0x95202579	! t0_kref+0x2b0c:   	mulscc	%g0, 0x579, %o2
	.word	0xc108001c	! t0_kref+0x2b10:   	ld	[%g0 + %i4], %fsr
	.word	0x89a01a24	! t0_kref+0x2b14:   	fstoi	%f4, %f4
	.word	0xd44e8018	! t0_kref+0x2b18:   	ldsb	[%i2 + %i0], %o2
	.word	0x94a83248	! t0_kref+0x2b1c:   	andncc	%g0, -0xdb8, %o2
	.word	0x99b00200	! t0_kref+0x2b20:   	array8	%g0, %g0, %o4
	.word	0x89a01924	! t0_kref+0x2b24:   	fstod	%f4, %f4
	.word	0xd8500018	! t0_kref+0x2b28:   	ldsh	[%g0 + %i0], %o4
	.word	0xd03e401d	! t0_kref+0x2b2c:   	std	%o0, [%i1 + %i5]
	.word	0x9fb00140	! t0_kref+0x2b30:   	edge32l	%g0, %g0, %o7
	.word	0xd408a034	! t0_kref+0x2b34:   	ldub	[%g2 + 0x34], %o2
	.word	0x89a10844	! t0_kref+0x2b38:   	faddd	%f4, %f4, %f4
	.word	0xda16c018	! t0_kref+0x2b3c:   	lduh	[%i3 + %i0], %o5
	.word	0x89b10e24	! t0_kref+0x2b40:   	fands	%f4, %f4, %f4
	.word	0xc129401c	! t0_kref+0x2b44:   	st	%fsr, [%g5 + %i4]
	.word	0x80b03dd3	! t0_kref+0x2b48:   	orncc	%g0, -0x22d, %g0
	.word	0x95b000a0	! t0_kref+0x2b4c:   	edge16n	%g0, %g0, %o2
	.word	0xc9064000	! t0_kref+0x2b50:   	ld	[%i1], %f4
	.word	0xc026401c	! t0_kref+0x2b54:   	clr	[%i1 + %i4]
	.word	0xaf700000	! t0_kref+0x2b58:   	popc	%g0, %l7
	.word	0x90900000	! t0_kref+0x2b5c:   	orcc	%g0, %g0, %o0
	.word	0x89a000a4	! t0_kref+0x2b60:   	fnegs	%f4, %f4
	.word	0x94403c65	! t0_kref+0x2b64:   	addc	%g0, -0x39b, %o2
	.word	0x89a10924	! t0_kref+0x2b68:   	fmuls	%f4, %f4, %f4
	.word	0xdac6101c	! t0_kref+0x2b6c:   	ldswa	[%i0 + %i4]0x80, %o5
	.word	0x89a00144	! t0_kref+0x2b70:   	fabsd	%f4, %f4
	.word	0x81a90ac4	! t0_kref+0x2b74:   	fcmped	%fcc0, %f4, %f4
	.word	0xc9be5a5c	! t0_kref+0x2b78:   	stda	%f4, [%i1 + %i4]0xd2
	.word	0x89a00524	! t0_kref+0x2b7c:   	fsqrts	%f4, %f4
	.word	0xd8064000	! t0_kref+0x2b80:   	ld	[%i1], %o4
	.word	0xd80e3feb	! t0_kref+0x2b84:   	ldub	[%i0 - 0x15], %o4
	.word	0xaf300000	! t0_kref+0x2b88:   	srl	%g0, %g0, %l7
	.word	0x901832c4	! t0_kref+0x2b8c:   	xor	%g0, -0xd3c, %o0
	.word	0x89a10844	! t0_kref+0x2b90:   	faddd	%f4, %f4, %f4
	.word	0x89a108c4	! t0_kref+0x2b94:   	fsubd	%f4, %f4, %f4
	.word	0x89a000a4	! t0_kref+0x2b98:   	fnegs	%f4, %f4
	.word	0x89a00544	! t0_kref+0x2b9c:   	fsqrtd	%f4, %f4
	.word	0x8143c000	! t0_kref+0x2ba0:   	stbar
	.word	0x94c00000	! t0_kref+0x2ba4:   	addccc	%g0, %g0, %o2
	.word	0x2e480002	! t0_kref+0x2ba8:   	bvs,a,pt	%icc, _kref+0x2bb0
	.word	0x92b00000	! t0_kref+0x2bac:   	orncc	%g0, %g0, %o1
	.word	0x89a01904	! t0_kref+0x2bb0:   	fitod	%f4, %f4
	.word	0x8000319d	! t0_kref+0x2bb4:   	add	%g0, -0xe63, %g0
	.word	0xc9062000	! t0_kref+0x2bb8:   	ld	[%i0], %f4
	.word	0x94000000	! t0_kref+0x2bbc:   	add	%g0, %g0, %o2
	.word	0x89a10844	! t0_kref+0x2bc0:   	faddd	%f4, %f4, %f4
	.word	0xa7800000	! t0_kref+0x2bc4:   	mov	%g0, %gsr
	.word	0x89a018c4	! t0_kref+0x2bc8:   	fdtos	%f4, %f4
	.word	0x81a90a24	! t0_kref+0x2bcc:   	fcmps	%fcc0, %f4, %f4
	.word	0x98980000	! t0_kref+0x2bd0:   	xorcc	%g0, %g0, %o4
	.word	0x89a00524	! t0_kref+0x2bd4:   	fsqrts	%f4, %f4
	.word	0x89b10a04	! t0_kref+0x2bd8:   	fpadd16	%f4, %f4, %f4
	.word	0x92100000	! t0_kref+0x2bdc:   	clr	%o1
	.word	0xc3ee5000	! t0_kref+0x2be0:   	prefetcha	%i1, 1
	.word	0xc030a038	! t0_kref+0x2be4:   	clrh	[%g2 + 0x38]
	.word	0x94000000	! t0_kref+0x2be8:   	add	%g0, %g0, %o2
	.word	0x92e00000	! t0_kref+0x2bec:   	subccc	%g0, %g0, %o1
	.word	0x98f82b4a	! t0_kref+0x2bf0:   	sdivcc	%g0, 0xb4a, %o4
	.word	0xc986101c	! t0_kref+0x2bf4:   	lda	[%i0 + %i4]0x80, %f4
	.word	0xc91fbfa8	! t0_kref+0x2bf8:   	ldd	[%fp - 0x58], %f4
	.word	0x89a000a4	! t0_kref+0x2bfc:   	fnegs	%f4, %f4
	.word	0xe01e7fe0	! t0_kref+0x2c00:   	ldd	[%i1 - 0x20], %l0
	.word	0xec380018	! t0_kref+0x2c04:   	std	%l6, [%g0 + %i0]
	.word	0x9a000000	! t0_kref+0x2c08:   	add	%g0, %g0, %o5
	.word	0x81a90a44	! t0_kref+0x2c0c:   	fcmpd	%fcc0, %f4, %f4
	.word	0x908026eb	! t0_kref+0x2c10:   	addcc	%g0, 0x6eb, %o0
	.word	0x89a108a4	! t0_kref+0x2c14:   	fsubs	%f4, %f4, %f4
	.word	0x81a90ac4	! t0_kref+0x2c18:   	fcmped	%fcc0, %f4, %f4
	.word	0x99280000	! t0_kref+0x2c1c:   	sll	%g0, %g0, %o4
	.word	0xd0064000	! t0_kref+0x2c20:   	ld	[%i1], %o0
	.word	0x34800003	! t0_kref+0x2c24:   	bg,a	_kref+0x2c30
	.word	0xee50a004	! t0_kref+0x2c28:   	ldsh	[%g2 + 4], %l7
	.word	0x89a00124	! t0_kref+0x2c2c:   	fabss	%f4, %f4
	.word	0x94a836d6	! t0_kref+0x2c30:   	andncc	%g0, -0x92a, %o2
	.word	0xf007bfe0	! t0_kref+0x2c34:   	ld	[%fp - 0x20], %i0
	.word	0xaf302012	! t0_kref+0x2c38:   	srl	%g0, 0x12, %l7
	.word	0x92402ec1	! t0_kref+0x2c3c:   	addc	%g0, 0xec1, %o1
	.word	0x89a00524	! t0_kref+0x2c40:   	fsqrts	%f4, %f4
	.word	0x89a108c4	! t0_kref+0x2c44:   	fsubd	%f4, %f4, %f4
	.word	0x9808316c	! t0_kref+0x2c48:   	and	%g0, -0xe94, %o4
	.word	0x9f418000	! t0_kref+0x2c4c:   	mov	%fprs, %o7
	.word	0x90180000	! t0_kref+0x2c50:   	xor	%g0, %g0, %o0
	.word	0xda56001b	! t0_kref+0x2c54:   	ldsh	[%i0 + %i3], %o5
	.word	0x89a00524	! t0_kref+0x2c58:   	fsqrts	%f4, %f4
	.word	0x95400000	! t0_kref+0x2c5c:   	mov	%y, %o2
	.word	0x8d800000	! t0_kref+0x2c60:   	mov	%g0, %fprs
	.word	0x89b106c4	! t0_kref+0x2c64:   	fmul8sux16	%f4, %f4, %f4
	.word	0xeaee9018	! t0_kref+0x2c68:   	ldstuba	[%i2 + %i0]0x80, %l5
	.word	0x90800000	! t0_kref+0x2c6c:   	addcc	%g0, %g0, %o0
	.word	0xc920a024	! t0_kref+0x2c70:   	st	%f4, [%g2 + 0x24]
	.word	0xc920a034	! t0_kref+0x2c74:   	st	%f4, [%g2 + 0x34]
	.word	0x86102002	! t0_kref+0x2c78:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x2c7c:   	bne,a	_kref+0x2c7c
	.word	0x86a0e001	! t0_kref+0x2c80:   	subcc	%g3, 1, %g3
	.word	0x89a00544	! t0_kref+0x2c84:   	fsqrtd	%f4, %f4
	.word	0x9ef80000	! t0_kref+0x2c88:   	sdivcc	%g0, %g0, %o7
	.word	0xd208a00d	! t0_kref+0x2c8c:   	ldub	[%g2 + 0xd], %o1
	.word	0x9b400000	! t0_kref+0x2c90:   	mov	%y, %o5
	.word	0x9e000000	! t0_kref+0x2c94:   	add	%g0, %g0, %o7
	.word	0x89a10844	! t0_kref+0x2c98:   	faddd	%f4, %f4, %f4
	.word	0x89a01904	! t0_kref+0x2c9c:   	fitod	%f4, %f4
	.word	0x9b620000	! t0_kref+0x2ca0:   	mova	%fcc0, %g0, %o5
	.word	0x81b00320	! t0_kref+0x2ca4:   	bmask	%g0, %g0, %g0
	.word	0xd6067ff0	! t0_kref+0x2ca8:   	ld	[%i1 - 0x10], %o3
	.word	0xd09e5000	! t0_kref+0x2cac:   	ldda	[%i1]0x80, %o0
	.word	0x81a90a24	! t0_kref+0x2cb0:   	fcmps	%fcc0, %f4, %f4
	.word	0x89a10824	! t0_kref+0x2cb4:   	fadds	%f4, %f4, %f4
	.word	0x81a90a44	! t0_kref+0x2cb8:   	fcmpd	%fcc0, %f4, %f4
	.word	0xc030a026	! t0_kref+0x2cbc:   	clrh	[%g2 + 0x26]
	.word	0x89a10924	! t0_kref+0x2cc0:   	fmuls	%f4, %f4, %f4
	.word	0x89a01a24	! t0_kref+0x2cc4:   	fstoi	%f4, %f4
	.word	0x9a200000	! t0_kref+0x2cc8:   	neg	%g0, %o5
	.word	0x9fc00004	! t0_kref+0x2ccc:   	call	%g0 + %g4
	.word	0x89a01904	! t0_kref+0x2cd0:   	fitod	%f4, %f4
	.word	0x878020d0	! t0_kref+0x2cd4:   	mov	0xd0, %asi
	.word	0x89a01904	! t0_kref+0x2cd8:   	fitod	%f4, %f4
	.word	0x86102003	! t0_kref+0x2cdc:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x2ce0:   	bne,a	_kref+0x2ce0
	.word	0x86a0e001	! t0_kref+0x2ce4:   	subcc	%g3, 1, %g3
	.word	0xc0f81018	! t0_kref+0x2ce8:   	swapa	[%g0 + %i0]0x80, %g0
	.word	0x89a00124	! t0_kref+0x2cec:   	fabss	%f4, %f4
	.word	0x81b00160	! t0_kref+0x2cf0:   	edge32ln	%g0, %g0, %g0
	.word	0xd0563ff6	! t0_kref+0x2cf4:   	ldsh	[%i0 - 0xa], %o0
	.word	0x89a00544	! t0_kref+0x2cf8:   	fsqrtd	%f4, %f4
	.word	0xde56601a	! t0_kref+0x2cfc:   	ldsh	[%i1 + 0x1a], %o7
	.word	0x93200000	! t0_kref+0x2d00:   	mulscc	%g0, %g0, %o1
	.word	0xee0e3ff0	! t0_kref+0x2d04:   	ldub	[%i0 - 0x10], %l7
	.word	0x89b10964	! t0_kref+0x2d08:   	fpmerge	%f4, %f4, %f4
	.word	0xaea00000	! t0_kref+0x2d0c:   	subcc	%g0, %g0, %l7
	.word	0xc9bf5a59	! t0_kref+0x2d10:   	stda	%f4, [%i5 + %i1]0xd2
	.word	0xc920a018	! t0_kref+0x2d14:   	st	%f4, [%g2 + 0x18]
	.word	0x89b10da4	! t0_kref+0x2d18:   	fxors	%f4, %f4, %f4
	.word	0x9aa80000	! t0_kref+0x2d1c:   	andncc	%g0, %g0, %o5
	.word	0x9fc00004	! t0_kref+0x2d20:   	call	%g0 + %g4
	.word	0x89b10d24	! t0_kref+0x2d24:   	fandnot1s	%f4, %f4, %f4
	.word	0xc93e7fe8	! t0_kref+0x2d28:   	std	%f4, [%i1 - 0x18]
	.word	0x98c03699	! t0_kref+0x2d2c:   	addccc	%g0, -0x967, %o4
	.word	0x89b106a4	! t0_kref+0x2d30:   	fmul8x16al	%f4, %f4, %f4
	.word	0x81a90aa4	! t0_kref+0x2d34:   	fcmpes	%fcc0, %f4, %f4
	call	SYM(t0_subr3)
	.word	0xa1b10504	! t0_kref+0x2d3c:   	fcmpgt16	%f4, %f4, %l0
	.word	0x97b104c4	! t0_kref+0x2d40:   	fcmpne32	%f4, %f4, %o3
	.word	0x80100000	! t0_kref+0x2d44:   	clr	%g0
	.word	0x86102003	! t0_kref+0x2d48:   	mov	0x3, %g3
	.word	0x86a0e001	! t0_kref+0x2d4c:   	subcc	%g3, 1, %g3
	.word	0x2280001c	! t0_kref+0x2d50:   	be,a	_kref+0x2dc0
	.word	0x89a10824	! t0_kref+0x2d54:   	fadds	%f4, %f4, %f4
	.word	0x89b10fa4	! t0_kref+0x2d58:   	fors	%f4, %f4, %f4
	.word	0x89a01a24	! t0_kref+0x2d5c:   	fstoi	%f4, %f4
	.word	0x89a00524	! t0_kref+0x2d60:   	fsqrts	%f4, %f4
	.word	0x9e400000	! t0_kref+0x2d64:   	addc	%g0, %g0, %o7
	.word	0x8143c000	! t0_kref+0x2d68:   	stbar
	.word	0x9e5022ae	! t0_kref+0x2d6c:   	umul	%g0, 0x2ae, %o7
	.word	0xe41e2018	! t0_kref+0x2d70:   	ldd	[%i0 + 0x18], %l2
	.word	0x80080000	! t0_kref+0x2d74:   	and	%g0, %g0, %g0
	.word	0x3c4ffff5	! t0_kref+0x2d78:   	bpos,a,pt	%icc, _kref+0x2d4c
	.word	0x89a00524	! t0_kref+0x2d7c:   	fsqrts	%f4, %f4
	.word	0xc9a01018	! t0_kref+0x2d80:   	sta	%f4, [%g0 + %i0]0x80
	.word	0x9740c000	! t0_kref+0x2d84:   	mov	%asi, %o3
	.word	0xc0262014	! t0_kref+0x2d88:   	clr	[%i0 + 0x14]
	.word	0x81a90a24	! t0_kref+0x2d8c:   	fcmps	%fcc0, %f4, %f4
	.word	0x98900000	! t0_kref+0x2d90:   	orcc	%g0, %g0, %o4
	.word	0x89aa4024	! t0_kref+0x2d94:   	fmovse	%fcc0, %f4, %f4
	.word	0x20480001	! t0_kref+0x2d98:   	bn,a,pt	%icc, _kref+0x2d9c
	.word	0x89a00544	! t0_kref+0x2d9c:   	fsqrtd	%f4, %f4
	.word	0x92a82005	! t0_kref+0x2da0:   	andncc	%g0, 5, %o1
	.word	0xd80e001a	! t0_kref+0x2da4:   	ldub	[%i0 + %i2], %o4
	.word	0xeefe501c	! t0_kref+0x2da8:   	swapa	[%i1 + %i4]0x80, %l7
	.word	0xd410a00c	! t0_kref+0x2dac:   	lduh	[%g2 + 0xc], %o2
	.word	0x98600000	! t0_kref+0x2db0:   	subc	%g0, %g0, %o4
	.word	0xee08a020	! t0_kref+0x2db4:   	ldub	[%g2 + 0x20], %l7
	.word	0x97b10484	! t0_kref+0x2db8:   	fcmple32	%f4, %f4, %o3
	.word	0x89b10a04	! t0_kref+0x2dbc:   	fpadd16	%f4, %f4, %f4
	.word	0xe67e6004	! t0_kref+0x2dc0:   	swap	[%i1 + 4], %l3
	.word	0x89b10e44	! t0_kref+0x2dc4:   	fxnor	%f4, %f4, %f4
	.word	0xc0060000	! t0_kref+0x2dc8:   	ld	[%i0], %g0
	.word	0x89a00524	! t0_kref+0x2dcc:   	fsqrts	%f4, %f4
	.word	0x94082a5d	! t0_kref+0x2dd0:   	and	%g0, 0xa5d, %o2
	.word	0xc9070019	! t0_kref+0x2dd4:   	ld	[%i4 + %i1], %f4
	.word	0x81a90aa4	! t0_kref+0x2dd8:   	fcmpes	%fcc0, %f4, %f4
	.word	0x9a880000	! t0_kref+0x2ddc:   	andcc	%g0, %g0, %o5
	.word	0x89b10d24	! t0_kref+0x2de0:   	fandnot1s	%f4, %f4, %f4
	.word	0xd84e8019	! t0_kref+0x2de4:   	ldsb	[%i2 + %i1], %o4
	.word	0x91b00320	! t0_kref+0x2de8:   	bmask	%g0, %g0, %o0
	.word	0x89a10824	! t0_kref+0x2dec:   	fadds	%f4, %f4, %f4
	.word	0x90a83592	! t0_kref+0x2df0:   	andncc	%g0, -0xa6e, %o0
	.word	0x81a90a44	! t0_kref+0x2df4:   	fcmpd	%fcc0, %f4, %f4
	.word	0x34800007	! t0_kref+0x2df8:   	bg,a	_kref+0x2e14
	.word	0x89a10844	! t0_kref+0x2dfc:   	faddd	%f4, %f4, %f4
	.word	0xd408a009	! t0_kref+0x2e00:   	ldub	[%g2 + 9], %o2
	.word	0xda563fe4	! t0_kref+0x2e04:   	ldsh	[%i0 - 0x1c], %o5
	.word	0x89a00024	! t0_kref+0x2e08:   	fmovs	%f4, %f4
	.word	0x99400000	! t0_kref+0x2e0c:   	mov	%y, %o4
	.word	0x89a10944	! t0_kref+0x2e10:   	fmuld	%f4, %f4, %f4
	.word	0x92d8394f	! t0_kref+0x2e14:   	smulcc	%g0, -0x6b1, %o1
	.word	0x94080000	! t0_kref+0x2e18:   	and	%g0, %g0, %o2
	.word	0x9410220e	! t0_kref+0x2e1c:   	mov	0x20e, %o2
	.word	0x97300000	! t0_kref+0x2e20:   	srl	%g0, %g0, %o3
	.word	0x9fc00004	! t0_kref+0x2e24:   	call	%g0 + %g4
	.word	0x89b10964	! t0_kref+0x2e28:   	fpmerge	%f4, %f4, %f4
	.word	0x89a00524	! t0_kref+0x2e2c:   	fsqrts	%f4, %f4
	.word	0x89b10724	! t0_kref+0x2e30:   	fmuld8ulx16	%f4, %f4, %f4
	.word	0x81580000	! t0_kref+0x2e34:   	flushw
	.word	0xc051401b	! t0_kref+0x2e38:   	ldsh	[%g5 + %i3], %g0
	.word	0xc0200018	! t0_kref+0x2e3c:   	clr	[%g0 + %i0]
	.word	0xc99f5018	! t0_kref+0x2e40:   	ldda	[%i5 + %i0]0x80, %f4
	.word	0xd656001b	! t0_kref+0x2e44:   	ldsh	[%i0 + %i3], %o3
	.word	0x90f8316c	! t0_kref+0x2e48:   	sdivcc	%g0, -0xe94, %o0
	.word	0x95b10504	! t0_kref+0x2e4c:   	fcmpgt16	%f4, %f4, %o2
	.word	0x89b10ae4	! t0_kref+0x2e50:   	fpsub32s	%f4, %f4, %f4
	.word	0x89a00544	! t0_kref+0x2e54:   	fsqrtd	%f4, %f4
	.word	0xd4500018	! t0_kref+0x2e58:   	ldsh	[%g0 + %i0], %o2
	.word	0x90d00000	! t0_kref+0x2e5c:   	umulcc	%g0, %g0, %o0
	.word	0xc030a032	! t0_kref+0x2e60:   	clrh	[%g2 + 0x32]
	.word	0x89a108a4	! t0_kref+0x2e64:   	fsubs	%f4, %f4, %f4
	.word	0xc10835dc	! t0_kref+0x2e68:   	ld	[%g0 - 0xa24], %fsr
	.word	0x89a10824	! t0_kref+0x2e6c:   	fadds	%f4, %f4, %f4
	.word	0x86102001	! t0_kref+0x2e70:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x2e74:   	bne,a	_kref+0x2e74
	.word	0x86a0e001	! t0_kref+0x2e78:   	subcc	%g3, 1, %g3
	.word	0xc91fbe50	! t0_kref+0x2e7c:   	ldd	[%fp - 0x1b0], %f4
	.word	0x9a40380d	! t0_kref+0x2e80:   	addc	%g0, -0x7f3, %o5
	.word	0x89a109c4	! t0_kref+0x2e84:   	fdivd	%f4, %f4, %f4
	.word	0xd848a038	! t0_kref+0x2e88:   	ldsb	[%g2 + 0x38], %o4
	.word	0x96a8368d	! t0_kref+0x2e8c:   	andncc	%g0, -0x973, %o3
	.word	0x89a01a44	! t0_kref+0x2e90:   	fdtoi	%f4, %f4
	.word	0x32480004	! t0_kref+0x2e94:   	bne,a,pt	%icc, _kref+0x2ea4
	.word	0x81280000	! t0_kref+0x2e98:   	sll	%g0, %g0, %g0
	.word	0xc030a03e	! t0_kref+0x2e9c:   	clrh	[%g2 + 0x3e]
	.word	0xe03e4000	! t0_kref+0x2ea0:   	std	%l0, [%i1]
	.word	0x89a109c4	! t0_kref+0x2ea4:   	fdivd	%f4, %f4, %f4
	.word	0x34800008	! t0_kref+0x2ea8:   	bg,a	_kref+0x2ec8
	.word	0x89a108a4	! t0_kref+0x2eac:   	fsubs	%f4, %f4, %f4
	.word	0x94500000	! t0_kref+0x2eb0:   	umul	%g0, %g0, %o2
	.word	0x901027ea	! t0_kref+0x2eb4:   	mov	0x7ea, %o0
	.word	0xc030a02a	! t0_kref+0x2eb8:   	clrh	[%g2 + 0x2a]
	.word	0xd000a000	! t0_kref+0x2ebc:   	ld	[%g2], %o0
	.word	0x89b10d24	! t0_kref+0x2ec0:   	fandnot1s	%f4, %f4, %f4
	.word	0x91100000	! t0_kref+0x2ec4:   	taddcctv	%g0, %g0, %o0
	.word	0x89a10824	! t0_kref+0x2ec8:   	fadds	%f4, %f4, %f4
	.word	0x32480005	! t0_kref+0x2ecc:   	bne,a,pt	%icc, _kref+0x2ee0
	.word	0xc920a018	! t0_kref+0x2ed0:   	st	%f4, [%g2 + 0x18]
	.word	0x89a01924	! t0_kref+0x2ed4:   	fstod	%f4, %f4
	.word	0x30800007	! t0_kref+0x2ed8:   	ba,a	_kref+0x2ef4
	.word	0x89a00124	! t0_kref+0x2edc:   	fabss	%f4, %f4
	.word	0x90800000	! t0_kref+0x2ee0:   	addcc	%g0, %g0, %o0
	.word	0x8d80337e	! t0_kref+0x2ee4:   	mov	0xfffff37e, %fprs
	.word	0x91b00100	! t0_kref+0x2ee8:   	edge32	%g0, %g0, %o0
	.word	0x80400000	! t0_kref+0x2eec:   	addc	%g0, %g0, %g0
	.word	0x90e00000	! t0_kref+0x2ef0:   	subccc	%g0, %g0, %o0
	.word	0x98103c30	! t0_kref+0x2ef4:   	mov	0xfffffc30, %o4
	.word	0xc000a034	! t0_kref+0x2ef8:   	ld	[%g2 + 0x34], %g0
	.word	0x89a108a4	! t0_kref+0x2efc:   	fsubs	%f4, %f4, %f4
	.word	0xc91fbd70	! t0_kref+0x2f00:   	ldd	[%fp - 0x290], %f4
	.word	0xc91fbd68	! t0_kref+0x2f04:   	ldd	[%fp - 0x298], %f4
	.word	0x89a00524	! t0_kref+0x2f08:   	fsqrts	%f4, %f4
	.word	0x89b10da4	! t0_kref+0x2f0c:   	fxors	%f4, %f4, %f4
	.word	0x80180000	! t0_kref+0x2f10:   	xor	%g0, %g0, %g0
	.word	0xd656001b	! t0_kref+0x2f14:   	ldsh	[%i0 + %i3], %o3
	.word	0xe8380019	! t0_kref+0x2f18:   	std	%l4, [%g0 + %i1]
	.word	0x95302010	! t0_kref+0x2f1c:   	srl	%g0, 0x10, %o2
	.word	0x92e00000	! t0_kref+0x2f20:   	subccc	%g0, %g0, %o1
	.word	0xc807bfe4	! t0_kref+0x2f24:   	ld	[%fp - 0x1c], %g4
	.word	0x89a10844	! t0_kref+0x2f28:   	faddd	%f4, %f4, %f4
	.word	0x89a00524	! t0_kref+0x2f2c:   	fsqrts	%f4, %f4
	.word	0xee000018	! t0_kref+0x2f30:   	ld	[%g0 + %i0], %l7
	.word	0x92983136	! t0_kref+0x2f34:   	xorcc	%g0, -0xeca, %o1
	.word	0x81a90a44	! t0_kref+0x2f38:   	fcmpd	%fcc0, %f4, %f4
	.word	0x30800004	! t0_kref+0x2f3c:   	ba,a	_kref+0x2f4c
	.word	0x89a109a4	! t0_kref+0x2f40:   	fdivs	%f4, %f4, %f4
	.word	0xda064000	! t0_kref+0x2f44:   	ld	[%i1], %o5
	.word	0x90a039fa	! t0_kref+0x2f48:   	subcc	%g0, -0x606, %o0
	.word	0x9aa83c2a	! t0_kref+0x2f4c:   	andncc	%g0, -0x3d6, %o5
	.word	0x89a10824	! t0_kref+0x2f50:   	fadds	%f4, %f4, %f4
	.word	0x98a03997	! t0_kref+0x2f54:   	subcc	%g0, -0x669, %o4
	.word	0x98603ec1	! t0_kref+0x2f58:   	subc	%g0, -0x13f, %o4
	.word	0xc7ee5000	! t0_kref+0x2f5c:   	prefetcha	%i1, 3
	.word	0x89a00544	! t0_kref+0x2f60:   	fsqrtd	%f4, %f4
	.word	0xec3e6008	! t0_kref+0x2f64:   	std	%l6, [%i1 + 8]
	.word	0x9b282017	! t0_kref+0x2f68:   	sll	%g0, 0x17, %o5
	.word	0x9fc00004	! t0_kref+0x2f6c:   	call	%g0 + %g4
	.word	0x92b80000	! t0_kref+0x2f70:   	xnorcc	%g0, %g0, %o1
	.word	0xd0062018	! t0_kref+0x2f74:   	ld	[%i0 + 0x18], %o0
	.word	0xc91fbc48	! t0_kref+0x2f78:   	ldd	[%fp - 0x3b8], %f4
	.word	0x9800285e	! t0_kref+0x2f7c:   	add	%g0, 0x85e, %o4
	.word	0xd610a02a	! t0_kref+0x2f80:   	lduh	[%g2 + 0x2a], %o3
	.word	0x81a90aa4	! t0_kref+0x2f84:   	fcmpes	%fcc0, %f4, %f4
	.word	0x9330201f	! t0_kref+0x2f88:   	srl	%g0, 0x1f, %o1
	.word	0x89a000a4	! t0_kref+0x2f8c:   	fnegs	%f4, %f4
	.word	0x81400000	! t0_kref+0x2f90:   	mov	%y, %g0
	.word	0x89b10e64	! t0_kref+0x2f94:   	fxnors	%f4, %f4, %f4
	.word	0x95282017	! t0_kref+0x2f98:   	sll	%g0, 0x17, %o2
	.word	0xf9ee101b	! t0_kref+0x2f9c:   	prefetcha	%i0 + %i3, 28
	.word	0xc9066004	! t0_kref+0x2fa0:   	ld	[%i1 + 4], %f4
	.word	0x97282006	! t0_kref+0x2fa4:   	sll	%g0, 0x6, %o3
	.word	0x93b105c4	! t0_kref+0x2fa8:   	fcmpeq32	%f4, %f4, %o1
	.word	0xc5ee5000	! t0_kref+0x2fac:   	prefetcha	%i1, 2
	.word	0x901032de	! t0_kref+0x2fb0:   	mov	0xfffff2de, %o0
	.word	0xedf65000	! t0_kref+0x2fb4:   	casxa	[%i1]0x80, %g0, %l6
	.word	0x816464c6	! t0_kref+0x2fb8:   	move	%icc, -0x33a, %g0
	.word	0xfd6e001c	! t0_kref+0x2fbc:   	prefetch	%i0 + %i4, 30
	.word	0x89a00144	! t0_kref+0x2fc0:   	fabsd	%f4, %f4
	.word	0x89b10ac4	! t0_kref+0x2fc4:   	fpsub32	%f4, %f4, %f4
	.word	0xe83e401d	! t0_kref+0x2fc8:   	std	%l4, [%i1 + %i5]
	.word	0x89a10824	! t0_kref+0x2fcc:   	fadds	%f4, %f4, %f4
	.word	0x9e000000	! t0_kref+0x2fd0:   	add	%g0, %g0, %o7
	.word	0x89b10964	! t0_kref+0x2fd4:   	fpmerge	%f4, %f4, %f4
	.word	0x89b10f44	! t0_kref+0x2fd8:   	fornot1	%f4, %f4, %f4
	.word	0x89a10944	! t0_kref+0x2fdc:   	fmuld	%f4, %f4, %f4
	.word	0x89b10f44	! t0_kref+0x2fe0:   	fornot1	%f4, %f4, %f4
	.word	0xc920a03c	! t0_kref+0x2fe4:   	st	%f4, [%g2 + 0x3c]
	.word	0xda0e2003	! t0_kref+0x2fe8:   	ldub	[%i0 + 3], %o5
	.word	0x89b10d24	! t0_kref+0x2fec:   	fandnot1s	%f4, %f4, %f4
	.word	0x89a01a44	! t0_kref+0x2ff0:   	fdtoi	%f4, %f4
	.word	0x96003237	! t0_kref+0x2ff4:   	add	%g0, -0xdc9, %o3
	.word	0xc020a014	! t0_kref+0x2ff8:   	clr	[%g2 + 0x14]
	.word	0xe2fe1000	! t0_kref+0x2ffc:   	swapa	[%i0]0x80, %l1
	.word	0x81a90a44	! t0_kref+0x3000:   	fcmpd	%fcc0, %f4, %f4
	.word	0xd2500019	! t0_kref+0x3004:   	ldsh	[%g0 + %i1], %o1
	.word	0x89a109a4	! t0_kref+0x3008:   	fdivs	%f4, %f4, %f4
	.word	0x38800008	! t0_kref+0x300c:   	bgu,a	_kref+0x302c
	.word	0x89a10844	! t0_kref+0x3010:   	faddd	%f4, %f4, %f4
	.word	0x93b00140	! t0_kref+0x3014:   	edge32l	%g0, %g0, %o1
	.word	0x89a10d24	! t0_kref+0x3018:   	fsmuld	%f4, %f4, %f4
	.word	0x81db3c1b	! t0_kref+0x301c:   	flush	%o4 - 0x3e5
	.word	0x001fffff	! t0_kref+0x3020:   	illtrap	0x1fffff
	.word	0x89a01884	! t0_kref+0x3024:   	fitos	%f4, %f4
	.word	0x81a90aa4	! t0_kref+0x3028:   	fcmpes	%fcc0, %f4, %f4
	.word	0x9fc00004	! t0_kref+0x302c:   	call	%g0 + %g4
	.word	0xc9066008	! t0_kref+0x3030:   	ld	[%i1 + 8], %f4
	.word	0xd808a015	! t0_kref+0x3034:   	ldub	[%g2 + 0x15], %o4
	.word	0xd83e6010	! t0_kref+0x3038:   	std	%o4, [%i1 + 0x10]
	.word	0x80f80000	! t0_kref+0x303c:   	sdivcc	%g0, %g0, %g0
	.word	0x97200000	! t0_kref+0x3040:   	mulscc	%g0, %g0, %o3
	.word	0x989029f6	! t0_kref+0x3044:   	orcc	%g0, 0x9f6, %o4
	.word	0x99b00060	! t0_kref+0x3048:   	edge8ln	%g0, %g0, %o4
	.word	0xd848a018	! t0_kref+0x304c:   	ldsb	[%g2 + 0x18], %o4
	.word	0x89a00544	! t0_kref+0x3050:   	fsqrtd	%f4, %f4
	.word	0x89b10da4	! t0_kref+0x3054:   	fxors	%f4, %f4, %f4
	.word	0xc9861000	! t0_kref+0x3058:   	lda	[%i0]0x80, %f4
	.word	0x81800000	! t0_kref+0x305c:   	mov	%g0, %y
	.word	0x89a01924	! t0_kref+0x3060:   	fstod	%f4, %f4
	.word	0xd0063ff0	! t0_kref+0x3064:   	ld	[%i0 - 0x10], %o0
	.word	0x89a10824	! t0_kref+0x3068:   	fadds	%f4, %f4, %f4
	.word	0x81a90aa4	! t0_kref+0x306c:   	fcmpes	%fcc0, %f4, %f4
	.word	0xc020a030	! t0_kref+0x3070:   	clr	[%g2 + 0x30]
	.word	0x22800006	! t0_kref+0x3074:   	be,a	_kref+0x308c
	.word	0xc020a030	! t0_kref+0x3078:   	clr	[%g2 + 0x30]
	.word	0x89a000a4	! t0_kref+0x307c:   	fnegs	%f4, %f4
	.word	0x9af80000	! t0_kref+0x3080:   	sdivcc	%g0, %g0, %o5
	.word	0xd44e0000	! t0_kref+0x3084:   	ldsb	[%i0], %o2
	.word	0x89a10924	! t0_kref+0x3088:   	fmuls	%f4, %f4, %f4
	.word	0xd00e6015	! t0_kref+0x308c:   	ldub	[%i1 + 0x15], %o0
	.word	0xd20e001a	! t0_kref+0x3090:   	ldub	[%i0 + %i2], %o1
	.word	0x93b00060	! t0_kref+0x3094:   	edge8ln	%g0, %g0, %o1
	.word	0x13184f2a	! t0_kref+0x3098:   	sethi	%hi(0x613ca800), %o1
	.word	0x9f60a4ff	! t0_kref+0x309c:   	movlg	%fcc0, -0x301, %o7
	.word	0x9fc10000	! t0_kref+0x30a0:   	call	%g4
	.word	0xc9067ffc	! t0_kref+0x30a4:   	ld	[%i1 - 4], %f4
	.word	0xd84e8019	! t0_kref+0x30a8:   	ldsb	[%i2 + %i1], %o4
	.word	0xc02e401a	! t0_kref+0x30ac:   	clrb	[%i1 + %i2]
	.word	0x89a00144	! t0_kref+0x30b0:   	fabsd	%f4, %f4
	.word	0x89a000a4	! t0_kref+0x30b4:   	fnegs	%f4, %f4
	call	SYM(t0_subr3)
	.word	0xc920a038	! t0_kref+0x30bc:   	st	%f4, [%g2 + 0x38]
	.word	0x9e980000	! t0_kref+0x30c0:   	xorcc	%g0, %g0, %o7
	.word	0x89a00044	! t0_kref+0x30c4:   	fmovd	%f4, %f4
	.word	0xd03f4018	! t0_kref+0x30c8:   	std	%o0, [%i5 + %i0]
	.word	0xc020a020	! t0_kref+0x30cc:   	clr	[%g2 + 0x20]
	.word	0x96d02775	! t0_kref+0x30d0:   	umulcc	%g0, 0x775, %o3
	.word	0xd0000019	! t0_kref+0x30d4:   	ld	[%g0 + %i1], %o0
	.word	0x90d03579	! t0_kref+0x30d8:   	umulcc	%g0, -0xa87, %o0
	.word	0xec1e001d	! t0_kref+0x30dc:   	ldd	[%i0 + %i5], %l6
	.word	0x89a00124	! t0_kref+0x30e0:   	fabss	%f4, %f4
	.word	0x89a00524	! t0_kref+0x30e4:   	fsqrts	%f4, %f4
	.word	0xc020a034	! t0_kref+0x30e8:   	clr	[%g2 + 0x34]
	.word	0x89a01a44	! t0_kref+0x30ec:   	fdtoi	%f4, %f4
	.word	0xc0300019	! t0_kref+0x30f0:   	clrh	[%g0 + %i1]
	.word	0xd050a02a	! t0_kref+0x30f4:   	ldsh	[%g2 + 0x2a], %o0
	.word	0x89b10f44	! t0_kref+0x30f8:   	fornot1	%f4, %f4, %f4
	.word	0x89a00144	! t0_kref+0x30fc:   	fabsd	%f4, %f4
	.word	0x89a10944	! t0_kref+0x3100:   	fmuld	%f4, %f4, %f4
	.word	0x94a80000	! t0_kref+0x3104:   	andncc	%g0, %g0, %o2
	.word	0xd0070019	! t0_kref+0x3108:   	ld	[%i4 + %i1], %o0
	.word	0x89b10da4	! t0_kref+0x310c:   	fxors	%f4, %f4, %f4
	.word	0x89b10f44	! t0_kref+0x3110:   	fornot1	%f4, %f4, %f4
	.word	0x90d83809	! t0_kref+0x3114:   	smulcc	%g0, -0x7f7, %o0
	.word	0xd04e8019	! t0_kref+0x3118:   	ldsb	[%i2 + %i1], %o0
	.word	0x89a01084	! t0_kref+0x311c:   	fxtos	%f4, %f4
	.word	0x91400000	! t0_kref+0x3120:   	mov	%y, %o0
	.word	0x9a102589	! t0_kref+0x3124:   	mov	0x589, %o5
	.word	0xc9262008	! t0_kref+0x3128:   	st	%f4, [%i0 + 8]
	.word	0x8610201f	! t0_kref+0x312c:   	mov	0x1f, %g3
	.word	0x86a0e001	! t0_kref+0x3130:   	subcc	%g3, 1, %g3
	.word	0x22800018	! t0_kref+0x3134:   	be,a	_kref+0x3194
	.word	0xae080000	! t0_kref+0x3138:   	and	%g0, %g0, %l7
	.word	0xc91fbee0	! t0_kref+0x313c:   	ldd	[%fp - 0x120], %f4
	.word	0xd448a00e	! t0_kref+0x3140:   	ldsb	[%g2 + 0xe], %o2
	.word	0xaea827df	! t0_kref+0x3144:   	andncc	%g0, 0x7df, %l7
	.word	0xd610a018	! t0_kref+0x3148:   	lduh	[%g2 + 0x18], %o3
	.word	0xae603446	! t0_kref+0x314c:   	subc	%g0, -0xbba, %l7
	.word	0x30bffff8	! t0_kref+0x3150:   	ba,a	_kref+0x3130
	.word	0xc91fbfb8	! t0_kref+0x3154:   	ldd	[%fp - 0x48], %f4
	.word	0xd09e1000	! t0_kref+0x3158:   	ldda	[%i0]0x80, %o0
	.word	0x96d00000	! t0_kref+0x315c:   	umulcc	%g0, %g0, %o3
	.word	0x90c00000	! t0_kref+0x3160:   	addccc	%g0, %g0, %o0
	.word	0xe01e7ff0	! t0_kref+0x3164:   	ldd	[%i1 - 0x10], %l0
	.word	0x89a00124	! t0_kref+0x3168:   	fabss	%f4, %f4
	.word	0x81de401f	! t0_kref+0x316c:   	flush	%i1 + %i7
	.word	0x94500000	! t0_kref+0x3170:   	umul	%g0, %g0, %o2
	.word	0x89a108c4	! t0_kref+0x3174:   	fsubd	%f4, %f4, %f4
	.word	0x97b000a0	! t0_kref+0x3178:   	edge16n	%g0, %g0, %o3
	.word	0x89a109c4	! t0_kref+0x317c:   	fdivd	%f4, %f4, %f4
	.word	0x89a01104	! t0_kref+0x3180:   	fxtod	%f4, %f4
	.word	0xc91fbcc8	! t0_kref+0x3184:   	ldd	[%fp - 0x338], %f4
	.word	0x81800000	! t0_kref+0x3188:   	mov	%g0, %y
	.word	0x89b10704	! t0_kref+0x318c:   	fmuld8sux16	%f4, %f4, %f4
	.word	0x96200000	! t0_kref+0x3190:   	neg	%g0, %o3
	.word	0x96e02980	! t0_kref+0x3194:   	subccc	%g0, 0x980, %o3
	.word	0x89a10824	! t0_kref+0x3198:   	fadds	%f4, %f4, %f4
	.word	0xd650a032	! t0_kref+0x319c:   	ldsh	[%g2 + 0x32], %o3
	.word	0x8143e076	! t0_kref+0x31a0:   	membar	0x76
	.word	0x38480003	! t0_kref+0x31a4:   	bgu,a,pt	%icc, _kref+0x31b0
	.word	0xd248a005	! t0_kref+0x31a8:   	ldsb	[%g2 + 5], %o1
	.word	0xd8500019	! t0_kref+0x31ac:   	ldsh	[%g0 + %i1], %o4
	.word	0x89a108a4	! t0_kref+0x31b0:   	fsubs	%f4, %f4, %f4
	.word	0xd696501b	! t0_kref+0x31b4:   	lduha	[%i1 + %i3]0x80, %o3
	.word	0x92f80000	! t0_kref+0x31b8:   	sdivcc	%g0, %g0, %o1
	.word	0xd616001b	! t0_kref+0x31bc:   	lduh	[%i0 + %i3], %o3
	.word	0x89b106a4	! t0_kref+0x31c0:   	fmul8x16al	%f4, %f4, %f4
	.word	0x94f80000	! t0_kref+0x31c4:   	sdivcc	%g0, %g0, %o2
	.word	0xc0260000	! t0_kref+0x31c8:   	clr	[%i0]
	.word	0xc0a61000	! t0_kref+0x31cc:   	sta	%g0, [%i0]0x80
	.word	0x94380000	! t0_kref+0x31d0:   	not	%g0, %o2
	.word	0xc020a024	! t0_kref+0x31d4:   	clr	[%g2 + 0x24]
	.word	0x81a90aa4	! t0_kref+0x31d8:   	fcmpes	%fcc0, %f4, %f4
	.word	0xd800a034	! t0_kref+0x31dc:   	ld	[%g2 + 0x34], %o4
	.word	0x89b10ae4	! t0_kref+0x31e0:   	fpsub32s	%f4, %f4, %f4
	.word	0x89a01904	! t0_kref+0x31e4:   	fitod	%f4, %f4
	.word	0xd048a023	! t0_kref+0x31e8:   	ldsb	[%g2 + 0x23], %o0
	.word	0x89a000a4	! t0_kref+0x31ec:   	fnegs	%f4, %f4
	.word	0xc99e501d	! t0_kref+0x31f0:   	ldda	[%i1 + %i5]0x80, %f4
	.word	0x97382001	! t0_kref+0x31f4:   	sra	%g0, 0x1, %o3
	.word	0x9a700000	! t0_kref+0x31f8:   	udiv	%g0, %g0, %o5
	.word	0x89b10ae4	! t0_kref+0x31fc:   	fpsub32s	%f4, %f4, %f4
	.word	0xc030a030	! t0_kref+0x3200:   	clrh	[%g2 + 0x30]
	.word	0x81db260a	! t0_kref+0x3204:   	flush	%o4 + 0x60a
	.word	0x89a01084	! t0_kref+0x3208:   	fxtos	%f4, %f4
	.word	0xc926001c	! t0_kref+0x320c:   	st	%f4, [%i0 + %i4]
	.word	0xe56e3fe8	! t0_kref+0x3210:   	prefetch	%i0 - 0x18, 18
	.word	0x9a880000	! t0_kref+0x3214:   	andcc	%g0, %g0, %o5
	.word	0xc0763ff8	! t0_kref+0x3218:   	stx	%g0, [%i0 - 8]
	.word	0xd408a004	! t0_kref+0x321c:   	ldub	[%g2 + 4], %o2
	.word	0xedee101a	! t0_kref+0x3220:   	prefetcha	%i0 + %i2, 22
	.word	0xe83e7ff0	! t0_kref+0x3224:   	std	%l4, [%i1 - 0x10]
	.word	0xc020a020	! t0_kref+0x3228:   	clr	[%g2 + 0x20]
	.word	0x99664000	! t0_kref+0x322c:   	movne	%icc, %g0, %o4
	.word	0x96e00000	! t0_kref+0x3230:   	subccc	%g0, %g0, %o3
	.word	0xc0264000	! t0_kref+0x3234:   	clr	[%i1]
	.word	0x81defc81	! t0_kref+0x3238:   	flush	%i3 - 0x37f
	.word	0x89a10d24	! t0_kref+0x323c:   	fsmuld	%f4, %f4, %f4
	.word	0x9fb10584	! t0_kref+0x3240:   	fcmpgt32	%f4, %f4, %o7
	.word	0xc0367ff2	! t0_kref+0x3244:   	clrh	[%i1 - 0xe]
	.word	0x9fc10000	! t0_kref+0x3248:   	call	%g4
	.word	0xd06e6019	! t0_kref+0x324c:   	ldstub	[%i1 + 0x19], %o0
	.word	0x89a00524	! t0_kref+0x3250:   	fsqrts	%f4, %f4
	.word	0x89a00124	! t0_kref+0x3254:   	fabss	%f4, %f4
	.word	0x99400000	! t0_kref+0x3258:   	mov	%y, %o4
	.word	0xe83e0000	! t0_kref+0x325c:   	std	%l4, [%i0]
	.word	0x80e00000	! t0_kref+0x3260:   	subccc	%g0, %g0, %g0
	.word	0x89a10d24	! t0_kref+0x3264:   	fsmuld	%f4, %f4, %f4
	.word	0x92882fad	! t0_kref+0x3268:   	andcc	%g0, 0xfad, %o1
	.word	0x95b10404	! t0_kref+0x326c:   	fcmple16	%f4, %f4, %o2
	.word	0x89b10624	! t0_kref+0x3270:   	fmul8x16	%f4, %f4, %f4
	.word	0x94182879	! t0_kref+0x3274:   	xor	%g0, 0x879, %o2
	.word	0x81300000	! t0_kref+0x3278:   	srl	%g0, %g0, %g0
	.word	0xde48a009	! t0_kref+0x327c:   	ldsb	[%g2 + 9], %o7
	.word	0x95b00020	! t0_kref+0x3280:   	edge8n	%g0, %g0, %o2
	.word	0xc99e501d	! t0_kref+0x3284:   	ldda	[%i1 + %i5]0x80, %f4
	.word	0x81a90ac4	! t0_kref+0x3288:   	fcmped	%fcc0, %f4, %f4
	.word	0xd6567ffc	! t0_kref+0x328c:   	ldsh	[%i1 - 4], %o3
	.word	0xaf280000	! t0_kref+0x3290:   	sll	%g0, %g0, %l7
	.word	0x89a01924	! t0_kref+0x3294:   	fstod	%f4, %f4
	.word	0x89b10d04	! t0_kref+0x3298:   	fandnot1	%f4, %f4, %f4
	.word	0x92e00000	! t0_kref+0x329c:   	subccc	%g0, %g0, %o1
	.word	0xe878a010	! t0_kref+0x32a0:   	swap	[%g2 + 0x10], %l4
	.word	0xe41e3fe0	! t0_kref+0x32a4:   	ldd	[%i0 - 0x20], %l2
	.word	0xde10a034	! t0_kref+0x32a8:   	lduh	[%g2 + 0x34], %o7
	.word	0x89a10944	! t0_kref+0x32ac:   	fmuld	%f4, %f4, %f4
	.word	0x81a90a44	! t0_kref+0x32b0:   	fcmpd	%fcc0, %f4, %f4
	.word	0x87802080	! t0_kref+0x32b4:   	mov	0x80, %asi
	.word	0xae8024f9	! t0_kref+0x32b8:   	addcc	%g0, 0x4f9, %l7
	.word	0x9fb000a0	! t0_kref+0x32bc:   	edge16n	%g0, %g0, %o7
	.word	0x89a10844	! t0_kref+0x32c0:   	faddd	%f4, %f4, %f4
	.word	0xc9a0a038	! t0_kref+0x32c4:   	sta	%f4, [%g2 + 0x38]%asi
	.word	0x9a980000	! t0_kref+0x32c8:   	xorcc	%g0, %g0, %o5
	.word	0x89a01924	! t0_kref+0x32cc:   	fstod	%f4, %f4
	.word	0xe2ee101a	! t0_kref+0x32d0:   	ldstuba	[%i0 + %i2]0x80, %l1
	.word	0xc0a8a002	! t0_kref+0x32d4:   	stba	%g0, [%g2 + 2]%asi
	.word	0xc5ee1000	! t0_kref+0x32d8:   	prefetcha	%i0, 2
	.word	0x89a10824	! t0_kref+0x32dc:   	fadds	%f4, %f4, %f4
	.word	0xd2f8a034	! t0_kref+0x32e0:   	swapa	[%g2 + 0x34]%asi, %o1
	.word	0x89b10624	! t0_kref+0x32e4:   	fmul8x16	%f4, %f4, %f4
	.word	0x80982aa5	! t0_kref+0x32e8:   	xorcc	%g0, 0xaa5, %g0
	.word	0xc02e401a	! t0_kref+0x32ec:   	clrb	[%i1 + %i2]
	.word	0x2a800001	! t0_kref+0x32f0:   	bcs,a	_kref+0x32f4
	.word	0x929828c9	! t0_kref+0x32f4:   	xorcc	%g0, 0x8c9, %o1
	.word	0xd896501b	! t0_kref+0x32f8:   	lduha	[%i1 + %i3]0x80, %o4
	.word	0x89a10824	! t0_kref+0x32fc:   	fadds	%f4, %f4, %f4
	.word	0x89b10704	! t0_kref+0x3300:   	fmuld8sux16	%f4, %f4, %f4
	.word	0x99200000	! t0_kref+0x3304:   	mulscc	%g0, %g0, %o4
	.word	0x9e403a7f	! t0_kref+0x3308:   	addc	%g0, -0x581, %o7
	.word	0x981828f8	! t0_kref+0x330c:   	xor	%g0, 0x8f8, %o4
	.word	0x8020224c	! t0_kref+0x3310:   	sub	%g0, 0x24c, %g0
	.word	0x89a10924	! t0_kref+0x3314:   	fmuls	%f4, %f4, %f4
	.word	0x89a10944	! t0_kref+0x3318:   	fmuld	%f4, %f4, %f4
	.word	0x81a90aa4	! t0_kref+0x331c:   	fcmpes	%fcc0, %f4, %f4
	.word	0xc00e601e	! t0_kref+0x3320:   	ldub	[%i1 + 0x1e], %g0
	.word	0xc0a0a014	! t0_kref+0x3324:   	sta	%g0, [%g2 + 0x14]%asi
	.word	0x9fc10000	! t0_kref+0x3328:   	call	%g4
	.word	0x9af83686	! t0_kref+0x332c:   	sdivcc	%g0, -0x97a, %o5
	.word	0xd24e2018	! t0_kref+0x3330:   	ldsb	[%i0 + 0x18], %o1
	.word	0xd0ce9018	! t0_kref+0x3334:   	ldsba	[%i2 + %i0]0x80, %o0
	.word	0x81df6d13	! t0_kref+0x3338:   	flush	%i5 + 0xd13
	.word	0x89a10824	! t0_kref+0x333c:   	fadds	%f4, %f4, %f4
	.word	0xc02e8019	! t0_kref+0x3340:   	clrb	[%i2 + %i1]
	.word	0x89a000a4	! t0_kref+0x3344:   	fnegs	%f4, %f4
	.word	0x9f100000	! t0_kref+0x3348:   	taddcctv	%g0, %g0, %o7
	.word	0x89a00124	! t0_kref+0x334c:   	fabss	%f4, %f4
	.word	0xd0566002	! t0_kref+0x3350:   	ldsh	[%i1 + 2], %o0
	.word	0xc900a00c	! t0_kref+0x3354:   	ld	[%g2 + 0xc], %f4
	.word	0xc0b0a00c	! t0_kref+0x3358:   	stha	%g0, [%g2 + 0xc]%asi
	.word	0x89a01a24	! t0_kref+0x335c:   	fstoi	%f4, %f4
	.word	0x90f80000	! t0_kref+0x3360:   	sdivcc	%g0, %g0, %o0
	.word	0x9130200c	! t0_kref+0x3364:   	srl	%g0, 0xc, %o0
	.word	0x92100000	! t0_kref+0x3368:   	clr	%o1
	.word	0x1f02a47e	! t0_kref+0x336c:   	sethi	%hi(0xa91f800), %o7
	.word	0x81a90ac4	! t0_kref+0x3370:   	fcmped	%fcc0, %f4, %f4
	.word	0xc9066004	! t0_kref+0x3374:   	ld	[%i1 + 4], %f4
	.word	0x9e503bf7	! t0_kref+0x3378:   	umul	%g0, -0x409, %o7
	.word	0x94d00000	! t0_kref+0x337c:   	umulcc	%g0, %g0, %o2
	.word	0x89a10844	! t0_kref+0x3380:   	faddd	%f4, %f4, %f4
	.word	0x89a000a4	! t0_kref+0x3384:   	fnegs	%f4, %f4
	.word	0x89a10d24	! t0_kref+0x3388:   	fsmuld	%f4, %f4, %f4
	.word	0x909035d9	! t0_kref+0x338c:   	orcc	%g0, -0xa27, %o0
	.word	0x89a01924	! t0_kref+0x3390:   	fstod	%f4, %f4
	.word	0x89a00124	! t0_kref+0x3394:   	fabss	%f4, %f4
	.word	0x89a00524	! t0_kref+0x3398:   	fsqrts	%f4, %f4
	.word	0x9ef03c75	! t0_kref+0x339c:   	udivcc	%g0, -0x38b, %o7
	.word	0x90d02d8c	! t0_kref+0x33a0:   	umulcc	%g0, 0xd8c, %o0
	.word	0xd2166012	! t0_kref+0x33a4:   	lduh	[%i1 + 0x12], %o1
	.word	0xd80e8019	! t0_kref+0x33a8:   	ldub	[%i2 + %i1], %o4
	.word	0xc0080019	! t0_kref+0x33ac:   	ldub	[%g0 + %i1], %g0
	.word	0x81418000	! t0_kref+0x33b0:   	mov	%fprs, %g0
	.word	0x90500000	! t0_kref+0x33b4:   	umul	%g0, %g0, %o0
	.word	0x95302002	! t0_kref+0x33b8:   	srl	%g0, 0x2, %o2
	.word	0x97400000	! t0_kref+0x33bc:   	mov	%y, %o3
	.word	0xeff65000	! t0_kref+0x33c0:   	casxa	[%i1]0x80, %g0, %l7
	.word	0x89b10e64	! t0_kref+0x33c4:   	fxnors	%f4, %f4, %f4
	.word	0x89a01a44	! t0_kref+0x33c8:   	fdtoi	%f4, %f4
	.word	0x80f8399b	! t0_kref+0x33cc:   	sdivcc	%g0, -0x665, %g0
	.word	0x9e502085	! t0_kref+0x33d0:   	umul	%g0, 0x85, %o7
	.word	0x92c02bba	! t0_kref+0x33d4:   	addccc	%g0, 0xbba, %o1
	.word	0x95b00060	! t0_kref+0x33d8:   	edge8ln	%g0, %g0, %o2
	.word	0x89a00524	! t0_kref+0x33dc:   	fsqrts	%f4, %f4
	.word	0x89a108c4	! t0_kref+0x33e0:   	fsubd	%f4, %f4, %f4
	.word	0x91b00140	! t0_kref+0x33e4:   	edge32l	%g0, %g0, %o0
	.word	0x94a80000	! t0_kref+0x33e8:   	andncc	%g0, %g0, %o2
	.word	0xc9a0a000	! t0_kref+0x33ec:   	sta	%f4, [%g2]%asi
	.word	0x31480004	! t0_kref+0x33f0:   	fba,a,pt	%fcc0, _kref+0x3400
	.word	0xc030a022	! t0_kref+0x33f4:   	clrh	[%g2 + 0x22]
	.word	0x28800008	! t0_kref+0x33f8:   	bleu,a	_kref+0x3418
	.word	0x95282018	! t0_kref+0x33fc:   	sll	%g0, 0x18, %o2
	.word	0xe81e6018	! t0_kref+0x3400:   	ldd	[%i1 + 0x18], %l4
	.word	0x80b00000	! t0_kref+0x3404:   	orncc	%g0, %g0, %g0
	.word	0x81580000	! t0_kref+0x3408:   	flushw
	.word	0x94100000	! t0_kref+0x340c:   	clr	%o2
	.word	0xdf01401c	! t0_kref+0x3410:   	ld	[%g5 + %i4], %f15
	.word	0x89a00524	! t0_kref+0x3414:   	fsqrts	%f4, %f4
	.word	0xc91fbe38	! t0_kref+0x3418:   	ldd	[%fp - 0x1c8], %f4
	.word	0x89a10844	! t0_kref+0x341c:   	faddd	%f4, %f4, %f4
	.word	0x98e00000	! t0_kref+0x3420:   	subccc	%g0, %g0, %o4
	.word	0x89a01084	! t0_kref+0x3424:   	fxtos	%f4, %f4
	.word	0x89a108c4	! t0_kref+0x3428:   	fsubd	%f4, %f4, %f4
	.word	0x9af80000	! t0_kref+0x342c:   	sdivcc	%g0, %g0, %o5
	.word	0x2c800002	! t0_kref+0x3430:   	bneg,a	_kref+0x3438
	.word	0xd610a03c	! t0_kref+0x3434:   	lduh	[%g2 + 0x3c], %o3
	.word	0x9a000000	! t0_kref+0x3438:   	add	%g0, %g0, %o5
	.word	0xae983f59	! t0_kref+0x343c:   	xorcc	%g0, -0xa7, %l7
	.word	0x95b00340	! t0_kref+0x3440:   	alignaddrl	%g0, %g0, %o2
	.word	0x89b00fc0	! t0_kref+0x3444:   	fone	%f4
	.word	0x89a00524	! t0_kref+0x3448:   	fsqrts	%f4, %f4
	.word	0x89a000a4	! t0_kref+0x344c:   	fnegs	%f4, %f4
	.word	0xc9ee1000	! t0_kref+0x3450:   	prefetcha	%i0, 4
	.word	0x9f200000	! t0_kref+0x3454:   	mulscc	%g0, %g0, %o7
	.word	0x91400000	! t0_kref+0x3458:   	mov	%y, %o0
	.word	0x89a000a4	! t0_kref+0x345c:   	fnegs	%f4, %f4
	.word	0x89b10704	! t0_kref+0x3460:   	fmuld8sux16	%f4, %f4, %f4
	.word	0x932031fa	! t0_kref+0x3464:   	mulscc	%g0, -0xe06, %o1
	.word	0x89a01a44	! t0_kref+0x3468:   	fdtoi	%f4, %f4
	.word	0x92802015	! t0_kref+0x346c:   	addcc	%g0, 0x15, %o1
	.word	0x97203a18	! t0_kref+0x3470:   	mulscc	%g0, -0x5e8, %o3
	.word	0xee4e3ff2	! t0_kref+0x3474:   	ldsb	[%i0 - 0xe], %l7
	.word	0x90980000	! t0_kref+0x3478:   	xorcc	%g0, %g0, %o0
	.word	0x94500000	! t0_kref+0x347c:   	umul	%g0, %g0, %o2
	.word	0x89b10e64	! t0_kref+0x3480:   	fxnors	%f4, %f4, %f4
	.word	0x89b10ae4	! t0_kref+0x3484:   	fpsub32s	%f4, %f4, %f4
	.word	0x20480001	! t0_kref+0x3488:   	bn,a,pt	%icc, _kref+0x348c
	.word	0xc91fbc90	! t0_kref+0x348c:   	ldd	[%fp - 0x370], %f4
	.word	0x9aa80000	! t0_kref+0x3490:   	andncc	%g0, %g0, %o5
	.word	0x89b00fe0	! t0_kref+0x3494:   	fones	%f4
	.word	0x92280000	! t0_kref+0x3498:   	andn	%g0, %g0, %o1
	.word	0xc906001c	! t0_kref+0x349c:   	ld	[%i0 + %i4], %f4
	.word	0x3c800005	! t0_kref+0x34a0:   	bpos,a	_kref+0x34b4
	.word	0xd60e401a	! t0_kref+0x34a4:   	ldub	[%i1 + %i2], %o3
	.word	0xde4e2003	! t0_kref+0x34a8:   	ldsb	[%i0 + 3], %o7
	.word	0x81b00020	! t0_kref+0x34ac:   	edge8n	%g0, %g0, %g0
	.word	0x89a000a4	! t0_kref+0x34b0:   	fnegs	%f4, %f4
	.word	0xd8563fea	! t0_kref+0x34b4:   	ldsh	[%i0 - 0x16], %o4
	.word	0x9b200000	! t0_kref+0x34b8:   	mulscc	%g0, %g0, %o5
	.word	0x89b10ee4	! t0_kref+0x34bc:   	fornot2s	%f4, %f4, %f4
	.word	0x96080000	! t0_kref+0x34c0:   	and	%g0, %g0, %o3
	.word	0x89b10744	! t0_kref+0x34c4:   	fpack32	%f4, %f4, %f4
	.word	0xd280a000	! t0_kref+0x34c8:   	lda	[%g2]%asi, %o1
	.word	0x81a90a44	! t0_kref+0x34cc:   	fcmpd	%fcc0, %f4, %f4
	.word	0x89b10f64	! t0_kref+0x34d0:   	fornot1s	%f4, %f4, %f4
	.word	0xd8000018	! t0_kref+0x34d4:   	ld	[%g0 + %i0], %o4
	.word	0xd4d0a030	! t0_kref+0x34d8:   	ldsha	[%g2 + 0x30]%asi, %o2
	.word	0xd80e401a	! t0_kref+0x34dc:   	ldub	[%i1 + %i2], %o4
	.word	0x89a10844	! t0_kref+0x34e0:   	faddd	%f4, %f4, %f4
	.word	0x89a10844	! t0_kref+0x34e4:   	faddd	%f4, %f4, %f4
	.word	0xc0b0a012	! t0_kref+0x34e8:   	stha	%g0, [%g2 + 0x12]%asi
	.word	0x81d9000d	! t0_kref+0x34ec:   	flush	%g4 + %o5
	.word	0x962031b0	! t0_kref+0x34f0:   	sub	%g0, -0xe50, %o3
	.word	0xc02e3ff7	! t0_kref+0x34f4:   	clrb	[%i0 - 9]
	.word	0xc0766000	! t0_kref+0x34f8:   	stx	%g0, [%i1]
	.word	0xd80e7ffa	! t0_kref+0x34fc:   	ldub	[%i1 - 6], %o4
	.word	0x89a10844	! t0_kref+0x3500:   	faddd	%f4, %f4, %f4
	.word	0x89b10744	! t0_kref+0x3504:   	fpack32	%f4, %f4, %f4
	.word	0x89b107c4	! t0_kref+0x3508:   	pdist	%f4, %f4, %f4
	.word	0x93400000	! t0_kref+0x350c:   	mov	%y, %o1
	.word	0x89b10624	! t0_kref+0x3510:   	fmul8x16	%f4, %f4, %f4
	.word	0x89a01904	! t0_kref+0x3514:   	fitod	%f4, %f4
	.word	0x89b10964	! t0_kref+0x3518:   	fpmerge	%f4, %f4, %f4
	.word	0x89a00524	! t0_kref+0x351c:   	fsqrts	%f4, %f4
	.word	0x89a108a4	! t0_kref+0x3520:   	fsubs	%f4, %f4, %f4
	.word	0xda4e200d	! t0_kref+0x3524:   	ldsb	[%i0 + 0xd], %o5
	.word	0x9de3bfa0	! t0_kref+0x3528:   	save	%sp, -0x60, %sp
	.word	0xb88f001c	! t0_kref+0x352c:   	andcc	%i4, %i4, %i4
	.word	0x91eeb18e	! t0_kref+0x3530:   	restore	%i2, -0xe72, %o0
	.word	0x98b80000	! t0_kref+0x3534:   	xnorcc	%g0, %g0, %o4
	.word	0xc090a03c	! t0_kref+0x3538:   	lduha	[%g2 + 0x3c]%asi, %g0
	.word	0x9b300000	! t0_kref+0x353c:   	srl	%g0, %g0, %o5
	.word	0xd00e600e	! t0_kref+0x3540:   	ldub	[%i1 + 0xe], %o0
	.word	0x81a90a44	! t0_kref+0x3544:   	fcmpd	%fcc0, %f4, %f4
	.word	0x89b106c4	! t0_kref+0x3548:   	fmul8sux16	%f4, %f4, %f4
	.word	0x803021f2	! t0_kref+0x354c:   	orn	%g0, 0x1f2, %g0
	.word	0x90d020e2	! t0_kref+0x3550:   	umulcc	%g0, 0xe2, %o0
	.word	0xc0a0a004	! t0_kref+0x3554:   	sta	%g0, [%g2 + 4]%asi
	.word	0x87802080	! t0_kref+0x3558:   	mov	0x80, %asi
	.word	0xde062008	! t0_kref+0x355c:   	ld	[%i0 + 8], %o7
	.word	0x81dfc004	! t0_kref+0x3560:   	flush	%i7 + %g4
	.word	0xdac0a024	! t0_kref+0x3564:   	ldswa	[%g2 + 0x24]%asi, %o5
	.word	0x34800001	! t0_kref+0x3568:   	bg,a	_kref+0x356c
	.word	0x8143c000	! t0_kref+0x356c:   	stbar
	.word	0x89a10944	! t0_kref+0x3570:   	fmuld	%f4, %f4, %f4
	.word	0x89b10984	! t0_kref+0x3574:   	bshuffle	%f4, %f4, %f4
	.word	0x9bb00020	! t0_kref+0x3578:   	edge8n	%g0, %g0, %o5
	.word	0x89ab8044	! t0_kref+0x357c:   	fmovdule	%fcc0, %f4, %f4
	.word	0x89a00544	! t0_kref+0x3580:   	fsqrtd	%f4, %f4
	.word	0xd448a01d	! t0_kref+0x3584:   	ldsb	[%g2 + 0x1d], %o2
	.word	0x92f80000	! t0_kref+0x3588:   	sdivcc	%g0, %g0, %o1
	.word	0x98a8314d	! t0_kref+0x358c:   	andncc	%g0, -0xeb3, %o4
	.word	0x81580000	! t0_kref+0x3590:   	flushw
	.word	0x89a01a44	! t0_kref+0x3594:   	fdtoi	%f4, %f4
	.word	0xeec8a022	! t0_kref+0x3598:   	ldsba	[%g2 + 0x22]%asi, %l7
	.word	0x89a108c4	! t0_kref+0x359c:   	fsubd	%f4, %f4, %f4
	.word	0x89b10964	! t0_kref+0x35a0:   	fpmerge	%f4, %f4, %f4
	.word	0xd25e0000	! t0_kref+0x35a4:   	ldx	[%i0], %o1
	.word	0x89aa0024	! t0_kref+0x35a8:   	fmovsa	%fcc0, %f4, %f4
	.word	0x89a01904	! t0_kref+0x35ac:   	fitod	%f4, %f4
	.word	0x81a90a44	! t0_kref+0x35b0:   	fcmpd	%fcc0, %f4, %f4
	.word	0x9ee00000	! t0_kref+0x35b4:   	subccc	%g0, %g0, %o7
	.word	0x9bb00140	! t0_kref+0x35b8:   	edge32l	%g0, %g0, %o5
	.word	0x3c800008	! t0_kref+0x35bc:   	bpos,a	_kref+0x35dc
	.word	0x89a00524	! t0_kref+0x35c0:   	fsqrts	%f4, %f4
	.word	0x9e180000	! t0_kref+0x35c4:   	xor	%g0, %g0, %o7
	.word	0x24800001	! t0_kref+0x35c8:   	ble,a	_kref+0x35cc
	.word	0x89a01a24	! t0_kref+0x35cc:   	fstoi	%f4, %f4
	.word	0xc020a038	! t0_kref+0x35d0:   	clr	[%g2 + 0x38]
	.word	0x89a00124	! t0_kref+0x35d4:   	fabss	%f4, %f4
	.word	0xaec039fa	! t0_kref+0x35d8:   	addccc	%g0, -0x606, %l7
	.word	0x9a902006	! t0_kref+0x35dc:   	orcc	%g0, 6, %o5
	.word	0xc0264000	! t0_kref+0x35e0:   	clr	[%i1]
	.word	0xc0262018	! t0_kref+0x35e4:   	clr	[%i0 + 0x18]
	.word	0xda0e8019	! t0_kref+0x35e8:   	ldub	[%i2 + %i1], %o5
	.word	0x81a90aa4	! t0_kref+0x35ec:   	fcmpes	%fcc0, %f4, %f4
	.word	0x81d93735	! t0_kref+0x35f0:   	flush	%g4 - 0x8cb
	.word	0x9ea80000	! t0_kref+0x35f4:   	andncc	%g0, %g0, %o7
	.word	0x89a00544	! t0_kref+0x35f8:   	fsqrtd	%f4, %f4
	.word	0x81a90a24	! t0_kref+0x35fc:   	fcmps	%fcc0, %f4, %f4
	.word	0x81d90019	! t0_kref+0x3600:   	flush	%g4 + %i1
	.word	0x80b82a57	! t0_kref+0x3604:   	xnorcc	%g0, 0xa57, %g0
	.word	0xd600a030	! t0_kref+0x3608:   	ld	[%g2 + 0x30], %o3
	.word	0x93b10404	! t0_kref+0x360c:   	fcmple16	%f4, %f4, %o1
	.word	0xec1e6010	! t0_kref+0x3610:   	ldd	[%i1 + 0x10], %l6
	.word	0x93703a28	! t0_kref+0x3614:   	popc	-0x5d8, %o1
	.word	0xde4e8018	! t0_kref+0x3618:   	ldsb	[%i2 + %i0], %o7
	.word	0xda50a034	! t0_kref+0x361c:   	ldsh	[%g2 + 0x34], %o5
	.word	0x9fc00004	! t0_kref+0x3620:   	call	%g0 + %g4
	.word	0xc920a010	! t0_kref+0x3624:   	st	%f4, [%g2 + 0x10]
	.word	0x94300000	! t0_kref+0x3628:   	orn	%g0, %g0, %o2
	.word	0xc028a000	! t0_kref+0x362c:   	clrb	[%g2]
	.word	0xc9070019	! t0_kref+0x3630:   	ld	[%i4 + %i1], %f4
	.word	0xe01e001d	! t0_kref+0x3634:   	ldd	[%i0 + %i5], %l0
	.word	0xe03e3fe0	! t0_kref+0x3638:   	std	%l0, [%i0 - 0x20]
	.word	0x38800001	! t0_kref+0x363c:   	bgu,a	_kref+0x3640
	.word	0x89a01924	! t0_kref+0x3640:   	fstod	%f4, %f4
	.word	0x80703c1c	! t0_kref+0x3644:   	udiv	%g0, -0x3e4, %g0
	.word	0x81a90a24	! t0_kref+0x3648:   	fcmps	%fcc0, %f4, %f4
	.word	0x80102237	! t0_kref+0x364c:   	mov	0x237, %g0
	.word	0x20800008	! t0_kref+0x3650:   	bn,a	_kref+0x3670
	.word	0x98a00000	! t0_kref+0x3654:   	subcc	%g0, %g0, %o4
	.word	0xe41e2010	! t0_kref+0x3658:   	ldd	[%i0 + 0x10], %l2
	.word	0xc900a008	! t0_kref+0x365c:   	ld	[%g2 + 8], %f4
	.word	0xde0e7fe2	! t0_kref+0x3660:   	ldub	[%i1 - 0x1e], %o7
	.word	0xd64e601d	! t0_kref+0x3664:   	ldsb	[%i1 + 0x1d], %o3
	.word	0xedee101c	! t0_kref+0x3668:   	prefetcha	%i0 + %i4, 22
	.word	0x81a90aa4	! t0_kref+0x366c:   	fcmpes	%fcc0, %f4, %f4
	.word	0x89a01884	! t0_kref+0x3670:   	fitos	%f4, %f4
	.word	0x89a10844	! t0_kref+0x3674:   	faddd	%f4, %f4, %f4
	.word	0xe41e2010	! t0_kref+0x3678:   	ldd	[%i0 + 0x10], %l2
	.word	0xc0b0a006	! t0_kref+0x367c:   	stha	%g0, [%g2 + 6]%asi
	.word	0x89b10ac4	! t0_kref+0x3680:   	fpsub32	%f4, %f4, %f4
	.word	0x8128201e	! t0_kref+0x3684:   	sll	%g0, 0x1e, %g0
	.word	0xc0263fe8	! t0_kref+0x3688:   	clr	[%i0 - 0x18]
	.word	0x92880000	! t0_kref+0x368c:   	andcc	%g0, %g0, %o1
	.word	0x96d80000	! t0_kref+0x3690:   	smulcc	%g0, %g0, %o3
	.word	0xc900a038	! t0_kref+0x3694:   	ld	[%g2 + 0x38], %f4
	.word	0x9de3bfa0	! t0_kref+0x3698:   	save	%sp, -0x60, %sp
	.word	0x9feec01a	! t0_kref+0x369c:   	restore	%i3, %i2, %o7
	.word	0x89b10984	! t0_kref+0x36a0:   	bshuffle	%f4, %f4, %f4
	.word	0xee4e7ff4	! t0_kref+0x36a4:   	ldsb	[%i1 - 0xc], %l7
	.word	0x94500000	! t0_kref+0x36a8:   	umul	%g0, %g0, %o2
	.word	0x89a108c4	! t0_kref+0x36ac:   	fsubd	%f4, %f4, %f4
	.word	0xd47e601c	! t0_kref+0x36b0:   	swap	[%i1 + 0x1c], %o2
	.word	0xc906001c	! t0_kref+0x36b4:   	ld	[%i0 + %i4], %f4
	.word	0x81a90a44	! t0_kref+0x36b8:   	fcmpd	%fcc0, %f4, %f4
	.word	0xaed80000	! t0_kref+0x36bc:   	smulcc	%g0, %g0, %l7
	.word	0xc920a008	! t0_kref+0x36c0:   	st	%f4, [%g2 + 8]
	.word	0x89b00f04	! t0_kref+0x36c4:   	fsrc2	%f4, %f4
	.word	0x98200000	! t0_kref+0x36c8:   	neg	%g0, %o4
	.word	0xc9a0a01c	! t0_kref+0x36cc:   	sta	%f4, [%g2 + 0x1c]%asi
	.word	0x89b10624	! t0_kref+0x36d0:   	fmul8x16	%f4, %f4, %f4
	.word	0x2c800002	! t0_kref+0x36d4:   	bneg,a	_kref+0x36dc
	.word	0xd0566004	! t0_kref+0x36d8:   	ldsh	[%i1 + 4], %o0
	.word	0xe41e001d	! t0_kref+0x36dc:   	ldd	[%i0 + %i5], %l2
	.word	0xc900a034	! t0_kref+0x36e0:   	ld	[%g2 + 0x34], %f4
	.word	0xc99e3fe8	! t0_kref+0x36e4:   	ldda	[%i0 - 0x18]%asi, %f4
	.word	0x20480005	! t0_kref+0x36e8:   	bn,a,pt	%icc, _kref+0x36fc
	.word	0x9ab80000	! t0_kref+0x36ec:   	xnorcc	%g0, %g0, %o5
	.word	0x97b00160	! t0_kref+0x36f0:   	edge32ln	%g0, %g0, %o3
	.word	0x89a01904	! t0_kref+0x36f4:   	fitod	%f4, %f4
	.word	0x89a108c4	! t0_kref+0x36f8:   	fsubd	%f4, %f4, %f4
	.word	0x81280000	! t0_kref+0x36fc:   	sll	%g0, %g0, %g0
	.word	0xdad0a00e	! t0_kref+0x3700:   	ldsha	[%g2 + 0xe]%asi, %o5
	.word	0x89b106c4	! t0_kref+0x3704:   	fmul8sux16	%f4, %f4, %f4
	.word	0x81a90aa4	! t0_kref+0x3708:   	fcmpes	%fcc0, %f4, %f4
	.word	0x89a01a24	! t0_kref+0x370c:   	fstoi	%f4, %f4
	.word	0x96182e10	! t0_kref+0x3710:   	xor	%g0, 0xe10, %o3
	.word	0x81a90a44	! t0_kref+0x3714:   	fcmpd	%fcc0, %f4, %f4
	.word	0xc9981018	! t0_kref+0x3718:   	ldda	[%g0 + %i0]0x80, %f4
	.word	0x89a01044	! t0_kref+0x371c:   	fdtox	%f4, %f4
	.word	0x89a10944	! t0_kref+0x3720:   	fmuld	%f4, %f4, %f4
	call	SYM(t0_subr1)
	.word	0x89b10ea0	! t0_kref+0x3728:   	fsrc1s	%f4, %f4
	.word	0x89a01924	! t0_kref+0x372c:   	fstod	%f4, %f4
	.word	0x97700000	! t0_kref+0x3730:   	popc	%g0, %o3
	.word	0xae1035d5	! t0_kref+0x3734:   	mov	0xfffff5d5, %l7
	.word	0x92e00000	! t0_kref+0x3738:   	subccc	%g0, %g0, %o1
	.word	0x89a00124	! t0_kref+0x373c:   	fabss	%f4, %f4
	.word	0xd81e401d	! t0_kref+0x3740:   	ldd	[%i1 + %i5], %o4
	.word	0xae403516	! t0_kref+0x3744:   	addc	%g0, -0xaea, %l7
	.word	0x98a80000	! t0_kref+0x3748:   	andncc	%g0, %g0, %o4
	.word	0x95202bfb	! t0_kref+0x374c:   	mulscc	%g0, 0xbfb, %o2
	.word	0x24800008	! t0_kref+0x3750:   	ble,a	_kref+0x3770
	.word	0x981026b8	! t0_kref+0x3754:   	mov	0x6b8, %o4
	.word	0x89b10e64	! t0_kref+0x3758:   	fxnors	%f4, %f4, %f4
	.word	0x923826b9	! t0_kref+0x375c:   	xnor	%g0, 0x6b9, %o1
	.word	0x9fb00200	! t0_kref+0x3760:   	array8	%g0, %g0, %o7
	.word	0x9e9830bd	! t0_kref+0x3764:   	xorcc	%g0, -0xf43, %o7
	.word	0x95b00160	! t0_kref+0x3768:   	edge32ln	%g0, %g0, %o2
	.word	0xc807bfe4	! t0_kref+0x376c:   	ld	[%fp - 0x1c], %g4
	.word	0x89a00524	! t0_kref+0x3770:   	fsqrts	%f4, %f4
	.word	0x89a108c4	! t0_kref+0x3774:   	fsubd	%f4, %f4, %f4
	.word	0x89b10da4	! t0_kref+0x3778:   	fxors	%f4, %f4, %f4
	.word	0xc0a0a014	! t0_kref+0x377c:   	sta	%g0, [%g2 + 0x14]%asi
	.word	0x89a00124	! t0_kref+0x3780:   	fabss	%f4, %f4
	.word	0x81a90a24	! t0_kref+0x3784:   	fcmps	%fcc0, %f4, %f4
	.word	0x9fc10000	! t0_kref+0x3788:   	call	%g4
	.word	0x89a108c4	! t0_kref+0x378c:   	fsubd	%f4, %f4, %f4
	.word	0xe83e3fe0	! t0_kref+0x3790:   	std	%l4, [%i0 - 0x20]
	.word	0xe83f4018	! t0_kref+0x3794:   	std	%l4, [%i5 + %i0]
	.word	0x81b000a0	! t0_kref+0x3798:   	edge16n	%g0, %g0, %g0
	.word	0xd488a028	! t0_kref+0x379c:   	lduba	[%g2 + 0x28]%asi, %o2
	.word	0x3e800003	! t0_kref+0x37a0:   	bvc,a	_kref+0x37ac
	.word	0xe03e6010	! t0_kref+0x37a4:   	std	%l0, [%i1 + 0x10]
	.word	0x89a000a4	! t0_kref+0x37a8:   	fnegs	%f4, %f4
	.word	0xd0000019	! t0_kref+0x37ac:   	ld	[%g0 + %i1], %o0
	.word	0x34480001	! t0_kref+0x37b0:   	bg,a,pt	%icc, _kref+0x37b4
	.word	0x89b10fa4	! t0_kref+0x37b4:   	fors	%f4, %f4, %f4
	.word	0x9de3bfa0	! t0_kref+0x37b8:   	save	%sp, -0x60, %sp
	.word	0x81ee28b1	! t0_kref+0x37bc:   	restore	%i0, 0x8b1, %g0
	.word	0xc920a008	! t0_kref+0x37c0:   	st	%f4, [%g2 + 8]
	.word	0xd4de2000	! t0_kref+0x37c4:   	ldxa	[%i0]%asi, %o2
	.word	0x3e800008	! t0_kref+0x37c8:   	bvc,a	_kref+0x37e8
	.word	0xc0a8a03b	! t0_kref+0x37cc:   	stba	%g0, [%g2 + 0x3b]%asi
	.word	0x9ab00000	! t0_kref+0x37d0:   	orncc	%g0, %g0, %o5
	.word	0xde96601e	! t0_kref+0x37d4:   	lduha	[%i1 + 0x1e]%asi, %o7
	.word	0x89a10924	! t0_kref+0x37d8:   	fmuls	%f4, %f4, %f4
	.word	0x98600000	! t0_kref+0x37dc:   	subc	%g0, %g0, %o4
	.word	0x9ac00000	! t0_kref+0x37e0:   	addccc	%g0, %g0, %o5
	.word	0xae000000	! t0_kref+0x37e4:   	add	%g0, %g0, %l7
	.word	0x89a108a4	! t0_kref+0x37e8:   	fsubs	%f4, %f4, %f4
	.word	0x89a108c4	! t0_kref+0x37ec:   	fsubd	%f4, %f4, %f4
	.word	0x89a108a4	! t0_kref+0x37f0:   	fsubs	%f4, %f4, %f4
	.word	0xd25e001d	! t0_kref+0x37f4:   	ldx	[%i0 + %i5], %o1
	.word	0xc91fbc58	! t0_kref+0x37f8:   	ldd	[%fp - 0x3a8], %f4
	.word	0x95b10504	! t0_kref+0x37fc:   	fcmpgt16	%f4, %f4, %o2
	.word	0x89b10e80	! t0_kref+0x3800:   	fsrc1	%f4, %f4
	.word	0xc020a03c	! t0_kref+0x3804:   	clr	[%g2 + 0x3c]
	.word	0x89b00764	! t0_kref+0x3808:   	fpack16	%f4, %f4
	.word	0xd64e7fe9	! t0_kref+0x380c:   	ldsb	[%i1 - 0x17], %o3
	.word	0xaee00000	! t0_kref+0x3810:   	subccc	%g0, %g0, %l7
	.word	0xd2563ff4	! t0_kref+0x3814:   	ldsh	[%i0 - 0xc], %o1
	.word	0x89a108c4	! t0_kref+0x3818:   	fsubd	%f4, %f4, %f4
	.word	0x99b00160	! t0_kref+0x381c:   	edge32ln	%g0, %g0, %o4
	.word	0x89b10a24	! t0_kref+0x3820:   	fpadd16s	%f4, %f4, %f4
	.word	0x98f80000	! t0_kref+0x3824:   	sdivcc	%g0, %g0, %o4
	.word	0x28480006	! t0_kref+0x3828:   	bleu,a,pt	%icc, _kref+0x3840
	.word	0x89a108a4	! t0_kref+0x382c:   	fsubs	%f4, %f4, %f4
	.word	0x80a80000	! t0_kref+0x3830:   	andncc	%g0, %g0, %g0
	.word	0x20800006	! t0_kref+0x3834:   	bn,a	_kref+0x384c
	.word	0xc030a014	! t0_kref+0x3838:   	clrh	[%g2 + 0x14]
	.word	0x89a00544	! t0_kref+0x383c:   	fsqrtd	%f4, %f4
	.word	0x89a00124	! t0_kref+0x3840:   	fabss	%f4, %f4
	.word	0x89a01904	! t0_kref+0x3844:   	fitod	%f4, %f4
	.word	0x89a10844	! t0_kref+0x3848:   	faddd	%f4, %f4, %f4
	.word	0x89a10824	! t0_kref+0x384c:   	fadds	%f4, %f4, %f4
	.word	0x99200000	! t0_kref+0x3850:   	mulscc	%g0, %g0, %o4
	.word	0x81a90a24	! t0_kref+0x3854:   	fcmps	%fcc0, %f4, %f4
	call	SYM(t0_subr2)
	.word	0xedf61000	! t0_kref+0x385c:   	casxa	[%i0]0x80, %g0, %l6
	.word	0xd810a00a	! t0_kref+0x3860:   	lduh	[%g2 + 0xa], %o4
	.word	0x86102004	! t0_kref+0x3864:   	mov	0x4, %g3
	.word	0x86a0e001	! t0_kref+0x3868:   	subcc	%g3, 1, %g3
	.word	0x22800012	! t0_kref+0x386c:   	be,a	_kref+0x38b4
	.word	0x89b10f64	! t0_kref+0x3870:   	fornot1s	%f4, %f4, %f4
	.word	0x89a108a4	! t0_kref+0x3874:   	fsubs	%f4, %f4, %f4
	.word	0x93300000	! t0_kref+0x3878:   	srl	%g0, %g0, %o1
	.word	0x89a01a44	! t0_kref+0x387c:   	fdtoi	%f4, %f4
	.word	0x2a800003	! t0_kref+0x3880:   	bcs,a	_kref+0x388c
	.word	0x90802244	! t0_kref+0x3884:   	addcc	%g0, 0x244, %o0
	.word	0x89a109c4	! t0_kref+0x3888:   	fdivd	%f4, %f4, %f4
	.word	0xe49e501d	! t0_kref+0x388c:   	ldda	[%i1 + %i5]0x80, %l2
	.word	0x91b10404	! t0_kref+0x3890:   	fcmple16	%f4, %f4, %o0
	.word	0xea6e4000	! t0_kref+0x3894:   	ldstub	[%i1], %l5
	.word	0xd080a03c	! t0_kref+0x3898:   	lda	[%g2 + 0x3c]%asi, %o0
	.word	0xc030a00a	! t0_kref+0x389c:   	clrh	[%g2 + 0xa]
	.word	0x89b00c20	! t0_kref+0x38a0:   	fzeros	%f4
	.word	0xea7e6004	! t0_kref+0x38a4:   	swap	[%i1 + 4], %l5
	.word	0x97b00140	! t0_kref+0x38a8:   	edge32l	%g0, %g0, %o3
	.word	0x89b10a04	! t0_kref+0x38ac:   	fpadd16	%f4, %f4, %f4
	.word	0x97b00120	! t0_kref+0x38b0:   	edge32n	%g0, %g0, %o3
	.word	0xc0b0a014	! t0_kref+0x38b4:   	stha	%g0, [%g2 + 0x14]%asi
	.word	0x83414000	! t0_kref+0x38b8:   	mov	%pc, %g1
	.word	0x89a01904	! t0_kref+0x38bc:   	fitod	%f4, %f4
	.word	0x89a108c4	! t0_kref+0x38c0:   	fsubd	%f4, %f4, %f4
	.word	0xc026201c	! t0_kref+0x38c4:   	clr	[%i0 + 0x1c]
	.word	0xd888a00e	! t0_kref+0x38c8:   	lduba	[%g2 + 0xe]%asi, %o4
	.word	0xee0e4000	! t0_kref+0x38cc:   	ldub	[%i1], %l7
	.word	0xc028a03b	! t0_kref+0x38d0:   	clrb	[%g2 + 0x3b]
	.word	0xc028a017	! t0_kref+0x38d4:   	clrb	[%g2 + 0x17]
	.word	0x96a80000	! t0_kref+0x38d8:   	andncc	%g0, %g0, %o3
	.word	0x8d80319d	! t0_kref+0x38dc:   	mov	0xfffff19d, %fprs
	.word	0x93400000	! t0_kref+0x38e0:   	mov	%y, %o1
	.word	0xc0b0a014	! t0_kref+0x38e4:   	stha	%g0, [%g2 + 0x14]%asi
	.word	0xd65e7ff8	! t0_kref+0x38e8:   	ldx	[%i1 - 8], %o3
	.word	0x89a10944	! t0_kref+0x38ec:   	fmuld	%f4, %f4, %f4
	.word	0x81a90a24	! t0_kref+0x38f0:   	fcmps	%fcc0, %f4, %f4
	call	SYM(t0_subr1)
	.word	0x89a00124	! t0_kref+0x38f8:   	fabss	%f4, %f4
	.word	0x89b106e4	! t0_kref+0x38fc:   	fmul8ulx16	%f4, %f4, %f4
	.word	0x90b0399d	! t0_kref+0x3900:   	orncc	%g0, -0x663, %o0
	.word	0xaef80000	! t0_kref+0x3904:   	sdivcc	%g0, %g0, %l7
	.word	0xae180000	! t0_kref+0x3908:   	xor	%g0, %g0, %l7
	.word	0x99200000	! t0_kref+0x390c:   	mulscc	%g0, %g0, %o4
	.word	0xda0e7fee	! t0_kref+0x3910:   	ldub	[%i1 - 0x12], %o5
	.word	0x9a580000	! t0_kref+0x3914:   	smul	%g0, %g0, %o5
	.word	0x96000000	! t0_kref+0x3918:   	add	%g0, %g0, %o3
	.word	0x89a00524	! t0_kref+0x391c:   	fsqrts	%f4, %f4
	.word	0x92700000	! t0_kref+0x3920:   	udiv	%g0, %g0, %o1
	.word	0x89b10d24	! t0_kref+0x3924:   	fandnot1s	%f4, %f4, %f4
	.word	0xee567ff4	! t0_kref+0x3928:   	ldsh	[%i1 - 0xc], %l7
	.word	0xc0a0a004	! t0_kref+0x392c:   	sta	%g0, [%g2 + 4]%asi
	.word	0x89b10704	! t0_kref+0x3930:   	fmuld8sux16	%f4, %f4, %f4
	.word	0xec1e2010	! t0_kref+0x3934:   	ldd	[%i0 + 0x10], %l6
	.word	0x89a000a4	! t0_kref+0x3938:   	fnegs	%f4, %f4
	.word	0x34800007	! t0_kref+0x393c:   	bg,a	_kref+0x3958
	.word	0x89b106a4	! t0_kref+0x3940:   	fmul8x16al	%f4, %f4, %f4
	.word	0xc980a038	! t0_kref+0x3944:   	lda	[%g2 + 0x38]%asi, %f4
	.word	0xe83e0000	! t0_kref+0x3948:   	std	%l4, [%i0]
	.word	0x3c800006	! t0_kref+0x394c:   	bpos,a	_kref+0x3964
	.word	0x89a00544	! t0_kref+0x3950:   	fsqrtd	%f4, %f4
	.word	0x81a90a44	! t0_kref+0x3954:   	fcmpd	%fcc0, %f4, %f4
	.word	0x81400000	! t0_kref+0x3958:   	mov	%y, %g0
	.word	0xc99e7ff0	! t0_kref+0x395c:   	ldda	[%i1 - 0x10]%asi, %f4
	.word	0xd8ce1000	! t0_kref+0x3960:   	ldsba	[%i0]0x80, %o4
	.word	0xae600000	! t0_kref+0x3964:   	subc	%g0, %g0, %l7
	.word	0xc0a0a034	! t0_kref+0x3968:   	sta	%g0, [%g2 + 0x34]%asi
	.word	0x9680393b	! t0_kref+0x396c:   	addcc	%g0, -0x6c5, %o3
	.word	0xae180000	! t0_kref+0x3970:   	xor	%g0, %g0, %l7
	.word	0x81a90a24	! t0_kref+0x3974:   	fcmps	%fcc0, %f4, %f4
	.word	0x90a80000	! t0_kref+0x3978:   	andncc	%g0, %g0, %o0
	.word	0x89a10824	! t0_kref+0x397c:   	fadds	%f4, %f4, %f4
	.word	0x89a01904	! t0_kref+0x3980:   	fitod	%f4, %f4
	.word	0x89b10d24	! t0_kref+0x3984:   	fandnot1s	%f4, %f4, %f4
	.word	0x95280000	! t0_kref+0x3988:   	sll	%g0, %g0, %o2
	.word	0x805030a4	! t0_kref+0x398c:   	umul	%g0, -0xf5c, %g0
	.word	0x89a10824	! t0_kref+0x3990:   	fadds	%f4, %f4, %f4
	.word	0x89b10c44	! t0_kref+0x3994:   	fnor	%f4, %f4, %f4
	.word	0x98a836e9	! t0_kref+0x3998:   	andncc	%g0, -0x917, %o4
	.word	0x81a90ac4	! t0_kref+0x399c:   	fcmped	%fcc0, %f4, %f4
	.word	0x89a01924	! t0_kref+0x39a0:   	fstod	%f4, %f4
	.word	0x9b400000	! t0_kref+0x39a4:   	mov	%y, %o5
	.word	0xd01e7ff8	! t0_kref+0x39a8:   	ldd	[%i1 - 8], %o0
	.word	0x87802082	! t0_kref+0x39ac:   	mov	0x82, %asi
	.word	0x89a108c4	! t0_kref+0x39b0:   	fsubd	%f4, %f4, %f4
	.word	0x89b10e24	! t0_kref+0x39b4:   	fands	%f4, %f4, %f4
	.word	0xaf28201d	! t0_kref+0x39b8:   	sll	%g0, 0x1d, %l7
	.word	0x89b10e24	! t0_kref+0x39bc:   	fands	%f4, %f4, %f4
	.word	0x95b10584	! t0_kref+0x39c0:   	fcmpgt32	%f4, %f4, %o2
	.word	0x81b000c0	! t0_kref+0x39c4:   	edge16l	%g0, %g0, %g0
	.word	0x90f03c12	! t0_kref+0x39c8:   	udivcc	%g0, -0x3ee, %o0
	.word	0x89a108a4	! t0_kref+0x39cc:   	fsubs	%f4, %f4, %f4
	.word	0x86102008	! t0_kref+0x39d0:   	mov	0x8, %g3
	.word	0x86a0e001	! t0_kref+0x39d4:   	subcc	%g3, 1, %g3
	.word	0x22800006	! t0_kref+0x39d8:   	be,a	_kref+0x39f0
	.word	0xd43f4019	! t0_kref+0x39dc:   	std	%o2, [%i5 + %i1]
	.word	0xc9be1840	! t0_kref+0x39e0:   	stda	%f4, [%i0]0xc2
	.word	0x81df699c	! t0_kref+0x39e4:   	flush	%i5 + 0x99c
	.word	0x89b10e24	! t0_kref+0x39e8:   	fands	%f4, %f4, %f4
	.word	0xc030a02a	! t0_kref+0x39ec:   	clrh	[%g2 + 0x2a]
	.word	0xc920a02c	! t0_kref+0x39f0:   	st	%f4, [%g2 + 0x2c]
	.word	0x89b10724	! t0_kref+0x39f4:   	fmuld8ulx16	%f4, %f4, %f4
	.word	0x89a01924	! t0_kref+0x39f8:   	fstod	%f4, %f4
	.word	0x986022f1	! t0_kref+0x39fc:   	subc	%g0, 0x2f1, %o4
	.word	0x81a90a24	! t0_kref+0x3a00:   	fcmps	%fcc0, %f4, %f4
	.word	0x9a182105	! t0_kref+0x3a04:   	xor	%g0, 0x105, %o5
	.word	0xc920a020	! t0_kref+0x3a08:   	st	%f4, [%g2 + 0x20]
	.word	0xae000000	! t0_kref+0x3a0c:   	add	%g0, %g0, %l7
	.word	0x89a00024	! t0_kref+0x3a10:   	fmovs	%f4, %f4
	.word	0x89a108a4	! t0_kref+0x3a14:   	fsubs	%f4, %f4, %f4
	.word	0x89a00524	! t0_kref+0x3a18:   	fsqrts	%f4, %f4
	.word	0x89a01904	! t0_kref+0x3a1c:   	fitod	%f4, %f4
	.word	0x36480004	! t0_kref+0x3a20:   	bge,a,pt	%icc, _kref+0x3a30
	.word	0x92a83df4	! t0_kref+0x3a24:   	andncc	%g0, -0x20c, %o1
	.word	0x96a80000	! t0_kref+0x3a28:   	andncc	%g0, %g0, %o3
	.word	0x81a90aa4	! t0_kref+0x3a2c:   	fcmpes	%fcc0, %f4, %f4
	.word	0x89a10824	! t0_kref+0x3a30:   	fadds	%f4, %f4, %f4
	.word	0x96982680	! t0_kref+0x3a34:   	xorcc	%g0, 0x680, %o3
	.word	0xd408a019	! t0_kref+0x3a38:   	ldub	[%g2 + 0x19], %o2
	.word	0x89a01044	! t0_kref+0x3a3c:   	fdtox	%f4, %f4
	.word	0x89b10744	! t0_kref+0x3a40:   	fpack32	%f4, %f4, %f4
	.word	0x89b10a04	! t0_kref+0x3a44:   	fpadd16	%f4, %f4, %f4
	.word	0x89a10824	! t0_kref+0x3a48:   	fadds	%f4, %f4, %f4
	.word	0x2f35cf7e	! t0_kref+0x3a4c:   	sethi	%hi(0xd73df800), %l7
	.word	0x997024ad	! t0_kref+0x3a50:   	popc	0x4ad, %o4
	.word	0x89a10844	! t0_kref+0x3a54:   	faddd	%f4, %f4, %f4
	.word	0x81d87d8c	! t0_kref+0x3a58:   	flush	%g1 - 0x274
	.word	0x89a00544	! t0_kref+0x3a5c:   	fsqrtd	%f4, %f4
	.word	0x81a90a44	! t0_kref+0x3a60:   	fcmpd	%fcc0, %f4, %f4
	.word	0x89a00124	! t0_kref+0x3a64:   	fabss	%f4, %f4
	.word	0x9e800000	! t0_kref+0x3a68:   	addcc	%g0, %g0, %o7
	.word	0x96400000	! t0_kref+0x3a6c:   	addc	%g0, %g0, %o3
	.word	0x99b00160	! t0_kref+0x3a70:   	edge32ln	%g0, %g0, %o4
	.word	0xaec0322f	! t0_kref+0x3a74:   	addccc	%g0, -0xdd1, %l7
	.word	0xc020a020	! t0_kref+0x3a78:   	clr	[%g2 + 0x20]
	.word	0x3e800001	! t0_kref+0x3a7c:   	bvc,a	_kref+0x3a80
	.word	0x9e8021e2	! t0_kref+0x3a80:   	addcc	%g0, 0x1e2, %o7
	.word	0x81a90a44	! t0_kref+0x3a84:   	fcmpd	%fcc0, %f4, %f4
	.word	0x89a10924	! t0_kref+0x3a88:   	fmuls	%f4, %f4, %f4
	.word	0x89b10704	! t0_kref+0x3a8c:   	fmuld8sux16	%f4, %f4, %f4
	.word	0x911024e3	! t0_kref+0x3a90:   	taddcctv	%g0, 0x4e3, %o0
	.word	0x90700000	! t0_kref+0x3a94:   	udiv	%g0, %g0, %o0
	call	SYM(t0_subr3)
	.word	0x909037c3	! t0_kref+0x3a9c:   	orcc	%g0, -0x83d, %o0
	.word	0x89a018c4	! t0_kref+0x3aa0:   	fdtos	%f4, %f4
	.word	0xc900a028	! t0_kref+0x3aa4:   	ld	[%g2 + 0x28], %f4
	.word	0x3c800001	! t0_kref+0x3aa8:   	bpos,a	_kref+0x3aac
	.word	0xc91fbf48	! t0_kref+0x3aac:   	ldd	[%fp - 0xb8], %f4
	.word	0xaea836a6	! t0_kref+0x3ab0:   	andncc	%g0, -0x95a, %l7
	.word	0xc020a038	! t0_kref+0x3ab4:   	clr	[%g2 + 0x38]
	.word	0xd856401b	! t0_kref+0x3ab8:   	ldsh	[%i1 + %i3], %o4
	.word	0x94f80000	! t0_kref+0x3abc:   	sdivcc	%g0, %g0, %o2
	.word	0x81a90a24	! t0_kref+0x3ac0:   	fcmps	%fcc0, %f4, %f4
	.word	0x89b10ea0	! t0_kref+0x3ac4:   	fsrc1s	%f4, %f4
	.word	0x86102003	! t0_kref+0x3ac8:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x3acc:   	bne,a	_kref+0x3acc
	.word	0x86a0e001	! t0_kref+0x3ad0:   	subcc	%g3, 1, %g3
	.word	0x9a603a7f	! t0_kref+0x3ad4:   	subc	%g0, -0x581, %o5
	.word	0x89b10ae4	! t0_kref+0x3ad8:   	fpsub32s	%f4, %f4, %f4
	.word	0xc026001c	! t0_kref+0x3adc:   	clr	[%i0 + %i4]
	.word	0x89a108c4	! t0_kref+0x3ae0:   	fsubd	%f4, %f4, %f4
	.word	0x9b100000	! t0_kref+0x3ae4:   	taddcctv	%g0, %g0, %o5
	.word	0xd800a010	! t0_kref+0x3ae8:   	ld	[%g2 + 0x10], %o4
	.word	0x89a109c4	! t0_kref+0x3aec:   	fdivd	%f4, %f4, %f4
	.word	0x81b00100	! t0_kref+0x3af0:   	edge32	%g0, %g0, %g0
	.word	0x9bb10544	! t0_kref+0x3af4:   	fcmpeq16	%f4, %f4, %o5
	.word	0xc02e200a	! t0_kref+0x3af8:   	clrb	[%i0 + 0xa]
	.word	0x9aa830a9	! t0_kref+0x3afc:   	andncc	%g0, -0xf57, %o5
	.word	0x89a018c4	! t0_kref+0x3b00:   	fdtos	%f4, %f4
	.word	0x81a90a24	! t0_kref+0x3b04:   	fcmps	%fcc0, %f4, %f4
	.word	0x9bb000a0	! t0_kref+0x3b08:   	edge16n	%g0, %g0, %o5
	.word	0x9de3bfa0	! t0_kref+0x3b0c:   	save	%sp, -0x60, %sp
	.word	0x81ee2012	! t0_kref+0x3b10:   	restore	%i0, 0x12, %g0
	.word	0xeb68a081	! t0_kref+0x3b14:   	prefetch	%g2 + 0x81, 21
	.word	0x89a10844	! t0_kref+0x3b18:   	faddd	%f4, %f4, %f4
	.word	0xd650a038	! t0_kref+0x3b1c:   	ldsh	[%g2 + 0x38], %o3
	.word	0x80f80000	! t0_kref+0x3b20:   	sdivcc	%g0, %g0, %g0
	.word	0x89b107c4	! t0_kref+0x3b24:   	pdist	%f4, %f4, %f4
	.word	0x94100000	! t0_kref+0x3b28:   	clr	%o2
	.word	0xc0264000	! t0_kref+0x3b2c:   	clr	[%i1]
	.word	0x89a00524	! t0_kref+0x3b30:   	fsqrts	%f4, %f4
	.word	0xc030a004	! t0_kref+0x3b34:   	clrh	[%g2 + 4]
	.word	0x9fc10000	! t0_kref+0x3b38:   	call	%g4
	.word	0xc000a034	! t0_kref+0x3b3c:   	ld	[%g2 + 0x34], %g0
	.word	0x9bb10504	! t0_kref+0x3b40:   	fcmpgt16	%f4, %f4, %o5
	.word	0x89a01904	! t0_kref+0x3b44:   	fitod	%f4, %f4
	.word	0x89a10824	! t0_kref+0x3b48:   	fadds	%f4, %f4, %f4
	.word	0x89a00124	! t0_kref+0x3b4c:   	fabss	%f4, %f4
	.word	0x98700000	! t0_kref+0x3b50:   	udiv	%g0, %g0, %o4
	.word	0x9aa80000	! t0_kref+0x3b54:   	andncc	%g0, %g0, %o5
	.word	0x89a01a24	! t0_kref+0x3b58:   	fstoi	%f4, %f4
	.word	0xe01e4000	! t0_kref+0x3b5c:   	ldd	[%i1], %l0
	.word	0x89a108a4	! t0_kref+0x3b60:   	fsubs	%f4, %f4, %f4
	.word	0x9ef80000	! t0_kref+0x3b64:   	sdivcc	%g0, %g0, %o7
	.word	0x9ef80000	! t0_kref+0x3b68:   	sdivcc	%g0, %g0, %o7
	.word	0x89b00764	! t0_kref+0x3b6c:   	fpack16	%f4, %f4
	.word	0xee070019	! t0_kref+0x3b70:   	ld	[%i4 + %i1], %l7
	.word	0xc02e8019	! t0_kref+0x3b74:   	clrb	[%i2 + %i1]
	.word	0x9a802a07	! t0_kref+0x3b78:   	addcc	%g0, 0xa07, %o5
	.word	0xc020a010	! t0_kref+0x3b7c:   	clr	[%g2 + 0x10]
	.word	0x81a90a44	! t0_kref+0x3b80:   	fcmpd	%fcc0, %f4, %f4
	.word	0x2c800007	! t0_kref+0x3b84:   	bneg,a	_kref+0x3ba0
	.word	0xf007bfe0	! t0_kref+0x3b88:   	ld	[%fp - 0x20], %i0
	.word	0x89a10824	! t0_kref+0x3b8c:   	fadds	%f4, %f4, %f4
	.word	0xc91fbe30	! t0_kref+0x3b90:   	ldd	[%fp - 0x1d0], %f4
	.word	0xc028a037	! t0_kref+0x3b94:   	clrb	[%g2 + 0x37]
	.word	0x89b10ac4	! t0_kref+0x3b98:   	fpsub32	%f4, %f4, %f4
	.word	0x9fb000e0	! t0_kref+0x3b9c:   	edge16ln	%g0, %g0, %o7
	.word	0xd41026c4	! t0_kref+0x3ba0:   	lduh	[%g0 + 0x6c4], %o2
	.word	0x89a109a4	! t0_kref+0x3ba4:   	fdivs	%f4, %f4, %f4
	.word	0x89abc044	! t0_kref+0x3ba8:   	fmovdo	%fcc0, %f4, %f4
	.word	0x89a108c4	! t0_kref+0x3bac:   	fsubd	%f4, %f4, %f4
	.word	0x86102001	! t0_kref+0x3bb0:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x3bb4:   	bne,a	_kref+0x3bb4
	.word	0x86a0e001	! t0_kref+0x3bb8:   	subcc	%g3, 1, %g3
	.word	0xc008a03f	! t0_kref+0x3bbc:   	ldub	[%g2 + 0x3f], %g0
	.word	0xc020a01c	! t0_kref+0x3bc0:   	clr	[%g2 + 0x1c]
	.word	0x96e0303b	! t0_kref+0x3bc4:   	subccc	%g0, -0xfc5, %o3
	.word	0x81a90a24	! t0_kref+0x3bc8:   	fcmps	%fcc0, %f4, %f4
	.word	0x9e5035ac	! t0_kref+0x3bcc:   	umul	%g0, -0xa54, %o7
	.word	0x89a108c4	! t0_kref+0x3bd0:   	fsubd	%f4, %f4, %f4
	.word	0x9840256e	! t0_kref+0x3bd4:   	addc	%g0, 0x56e, %o4
	.word	0xd248a039	! t0_kref+0x3bd8:   	ldsb	[%g2 + 0x39], %o1
	.word	0x81a90a24	! t0_kref+0x3bdc:   	fcmps	%fcc0, %f4, %f4
	.word	0xd656001b	! t0_kref+0x3be0:   	ldsh	[%i0 + %i3], %o3
	.word	0x99400000	! t0_kref+0x3be4:   	mov	%y, %o4
	.word	0xc91fbca8	! t0_kref+0x3be8:   	ldd	[%fp - 0x358], %f4
	.word	0x89a10844	! t0_kref+0x3bec:   	faddd	%f4, %f4, %f4
	.word	0x89b00f04	! t0_kref+0x3bf0:   	fsrc2	%f4, %f4
	.word	0x94180000	! t0_kref+0x3bf4:   	xor	%g0, %g0, %o2
	.word	0xc807bff0	! t0_kref+0x3bf8:   	ld	[%fp - 0x10], %g4
	.word	0xec68a03b	! t0_kref+0x3bfc:   	ldstub	[%g2 + 0x3b], %l6
	.word	0xc920a01c	! t0_kref+0x3c00:   	st	%f4, [%g2 + 0x1c]
	.word	0x89a10824	! t0_kref+0x3c04:   	fadds	%f4, %f4, %f4
	.word	0x97b00200	! t0_kref+0x3c08:   	array8	%g0, %g0, %o3
	.word	0xd408a02e	! t0_kref+0x3c0c:   	ldub	[%g2 + 0x2e], %o2
	.word	0x8143c000	! t0_kref+0x3c10:   	stbar
	.word	0xd221401c	! t0_kref+0x3c14:   	st	%o1, [%g5 + %i4]
	.word	0xc9be101d	! t0_kref+0x3c18:   	stda	%f4, [%i0 + %i5]0x80
	.word	0x89a10824	! t0_kref+0x3c1c:   	fadds	%f4, %f4, %f4
	.word	0x81da4019	! t0_kref+0x3c20:   	flush	%o1 + %i1
	.word	0x89b106c4	! t0_kref+0x3c24:   	fmul8sux16	%f4, %f4, %f4
	.word	0x93b00060	! t0_kref+0x3c28:   	edge8ln	%g0, %g0, %o1
	.word	0x81a90aa4	! t0_kref+0x3c2c:   	fcmpes	%fcc0, %f4, %f4
	.word	0xed68a000	! t0_kref+0x3c30:   	prefetch	%g2, 22
	.word	0x89b10724	! t0_kref+0x3c34:   	fmuld8ulx16	%f4, %f4, %f4
	.word	0x89a10844	! t0_kref+0x3c38:   	faddd	%f4, %f4, %f4
	.word	0x89b10ca4	! t0_kref+0x3c3c:   	fandnot2s	%f4, %f4, %f4
	.word	0x9fc00004	! t0_kref+0x3c40:   	call	%g0 + %g4
	.word	0x94003cb9	! t0_kref+0x3c44:   	add	%g0, -0x347, %o2
	.word	0x93300000	! t0_kref+0x3c48:   	srl	%g0, %g0, %o1
	.word	0x89a01904	! t0_kref+0x3c4c:   	fitod	%f4, %f4
	.word	0x9e403b4e	! t0_kref+0x3c50:   	addc	%g0, -0x4b2, %o7
	.word	0x89a10824	! t0_kref+0x3c54:   	fadds	%f4, %f4, %f4
	.word	0x8143e055	! t0_kref+0x3c58:   	membar	0x55
	.word	0x36800002	! t0_kref+0x3c5c:   	bge,a	_kref+0x3c64
	.word	0xc0ae9018	! t0_kref+0x3c60:   	stba	%g0, [%i2 + %i0]0x80
	.word	0x89a000a4	! t0_kref+0x3c64:   	fnegs	%f4, %f4
	.word	0xaeb0213b	! t0_kref+0x3c68:   	orncc	%g0, 0x13b, %l7
	.word	0x89a108c4	! t0_kref+0x3c6c:   	fsubd	%f4, %f4, %f4
	.word	0xc02e6013	! t0_kref+0x3c70:   	clrb	[%i1 + 0x13]
	.word	0x98100000	! t0_kref+0x3c74:   	clr	%o4
	.word	0x2e800004	! t0_kref+0x3c78:   	bvs,a	_kref+0x3c88
	.word	0xc008a00e	! t0_kref+0x3c7c:   	ldub	[%g2 + 0xe], %g0
	.word	0x96202f41	! t0_kref+0x3c80:   	sub	%g0, 0xf41, %o3
	.word	0x89a108c4	! t0_kref+0x3c84:   	fsubd	%f4, %f4, %f4
	.word	0x8143c000	! t0_kref+0x3c88:   	stbar
	.word	0x89b10c44	! t0_kref+0x3c8c:   	fnor	%f4, %f4, %f4
	.word	0x3a480006	! t0_kref+0x3c90:   	bcc,a,pt	%icc, _kref+0x3ca8
	.word	0xf007bfe0	! t0_kref+0x3c94:   	ld	[%fp - 0x20], %i0
	.word	0x89a01a44	! t0_kref+0x3c98:   	fdtoi	%f4, %f4
	.word	0xc028a031	! t0_kref+0x3c9c:   	clrb	[%g2 + 0x31]
	.word	0x89b00fe0	! t0_kref+0x3ca0:   	fones	%f4
	.word	0x3c480003	! t0_kref+0x3ca4:   	bpos,a,pt	%icc, _kref+0x3cb0
	.word	0xc4383fb8	! t0_kref+0x3ca8:   	std	%g2, [%g0 - 0x48]
	.word	0x9fc00004	! t0_kref+0x3cac:   	call	%g0 + %g4
	.word	0xc91fbc80	! t0_kref+0x3cb0:   	ldd	[%fp - 0x380], %f4
	.word	0x89a01a24	! t0_kref+0x3cb4:   	fstoi	%f4, %f4
	.word	0x93300000	! t0_kref+0x3cb8:   	srl	%g0, %g0, %o1
	.word	0x89a109c4	! t0_kref+0x3cbc:   	fdivd	%f4, %f4, %f4
	.word	0x952025eb	! t0_kref+0x3cc0:   	mulscc	%g0, 0x5eb, %o2
	.word	0x9de3bfa0	! t0_kref+0x3cc4:   	save	%sp, -0x60, %sp
	.word	0x9be83b69	! t0_kref+0x3cc8:   	restore	%g0, -0x497, %o5
	.word	0x89a00524	! t0_kref+0x3ccc:   	fsqrts	%f4, %f4
	.word	0x89b10e80	! t0_kref+0x3cd0:   	fsrc1	%f4, %f4
	.word	0x94700000	! t0_kref+0x3cd4:   	udiv	%g0, %g0, %o2
	.word	0xd4067fe0	! t0_kref+0x3cd8:   	ld	[%i1 - 0x20], %o2
	.word	0x90200000	! t0_kref+0x3cdc:   	neg	%g0, %o0
	.word	0xd200a034	! t0_kref+0x3ce0:   	ld	[%g2 + 0x34], %o1
	.word	0x24480003	! t0_kref+0x3ce4:   	ble,a,pt	%icc, _kref+0x3cf0
	.word	0x9ee03df2	! t0_kref+0x3ce8:   	subccc	%g0, -0x20e, %o7
	.word	0xc048a019	! t0_kref+0x3cec:   	ldsb	[%g2 + 0x19], %g0
	.word	0x89b009a4	! t0_kref+0x3cf0:   	fexpand	%f4, %f4
	.word	0xd0580019	! t0_kref+0x3cf4:   	ldx	[%g0 + %i1], %o0
	.word	0x96a80000	! t0_kref+0x3cf8:   	andncc	%g0, %g0, %o3
	.word	0xc028a030	! t0_kref+0x3cfc:   	clrb	[%g2 + 0x30]
	.word	0x96b00000	! t0_kref+0x3d00:   	orncc	%g0, %g0, %o3
	.word	0x99400000	! t0_kref+0x3d04:   	mov	%y, %o4
	.word	0x940027ee	! t0_kref+0x3d08:   	add	%g0, 0x7ee, %o2
	.word	0xc900a008	! t0_kref+0x3d0c:   	ld	[%g2 + 8], %f4
	.word	0x9a182687	! t0_kref+0x3d10:   	xor	%g0, 0x687, %o5
	.word	0x89a10844	! t0_kref+0x3d14:   	faddd	%f4, %f4, %f4
	.word	0x96d80000	! t0_kref+0x3d18:   	smulcc	%g0, %g0, %o3
	.word	0x94802951	! t0_kref+0x3d1c:   	addcc	%g0, 0x951, %o2
	.word	0xc900a01c	! t0_kref+0x3d20:   	ld	[%g2 + 0x1c], %f4
	.word	0xc028a03f	! t0_kref+0x3d24:   	clrb	[%g2 + 0x3f]
	.word	0x97400000	! t0_kref+0x3d28:   	mov	%y, %o3
	.word	0xd248a01b	! t0_kref+0x3d2c:   	ldsb	[%g2 + 0x1b], %o1
	.word	0x89a00524	! t0_kref+0x3d30:   	fsqrts	%f4, %f4
	.word	0x3e480008	! t0_kref+0x3d34:   	bvc,a,pt	%icc, _kref+0x3d54
	.word	0x9ef80000	! t0_kref+0x3d38:   	sdivcc	%g0, %g0, %o7
	.word	0x89a00044	! t0_kref+0x3d3c:   	fmovd	%f4, %f4
	.word	0x81a90a44	! t0_kref+0x3d40:   	fcmpd	%fcc0, %f4, %f4
	.word	0x81a90ac4	! t0_kref+0x3d44:   	fcmped	%fcc0, %f4, %f4
	.word	0x3e800002	! t0_kref+0x3d48:   	bvc,a	_kref+0x3d50
	.word	0xd840a00c	! t0_kref+0x3d4c:   	ldsw	[%g2 + 0xc], %o4
	.word	0x89a00524	! t0_kref+0x3d50:   	fsqrts	%f4, %f4
	.word	0x89a00124	! t0_kref+0x3d54:   	fabss	%f4, %f4
	.word	0x2e800004	! t0_kref+0x3d58:   	bvs,a	_kref+0x3d68
	.word	0x89a00524	! t0_kref+0x3d5c:   	fsqrts	%f4, %f4
	.word	0x89a00524	! t0_kref+0x3d60:   	fsqrts	%f4, %f4
	.word	0xc028a019	! t0_kref+0x3d64:   	clrb	[%g2 + 0x19]
	call	SYM(t0_subr0)
	.word	0x8143c000	! t0_kref+0x3d6c:   	stbar
	.word	0x89b10a04	! t0_kref+0x3d70:   	fpadd16	%f4, %f4, %f4
	.word	0x944021a1	! t0_kref+0x3d74:   	addc	%g0, 0x1a1, %o2
	.word	0xc9be5a5b	! t0_kref+0x3d78:   	stda	%f4, [%i1 + %i3]0xd2
	.word	0xc9270018	! t0_kref+0x3d7c:   	st	%f4, [%i4 + %i0]
	.word	0x81dde0c1	! t0_kref+0x3d80:   	flush	%l7 + 0xc1
	.word	0xc91fbc40	! t0_kref+0x3d84:   	ldd	[%fp - 0x3c0], %f4
	.word	0xc91e3fe0	! t0_kref+0x3d88:   	ldd	[%i0 - 0x20], %f4
	.word	0x81a90a44	! t0_kref+0x3d8c:   	fcmpd	%fcc0, %f4, %f4
	.word	0x89a109a4	! t0_kref+0x3d90:   	fdivs	%f4, %f4, %f4
	.word	0xc02e7ffd	! t0_kref+0x3d94:   	clrb	[%i1 - 3]
	.word	0x34800002	! t0_kref+0x3d98:   	bg,a	_kref+0x3da0
	.word	0xd0480019	! t0_kref+0x3d9c:   	ldsb	[%g0 + %i1], %o0
	.word	0x99200000	! t0_kref+0x3da0:   	mulscc	%g0, %g0, %o4
	.word	0xde16001b	! t0_kref+0x3da4:   	lduh	[%i0 + %i3], %o7
	.word	0x9de3bfa0	! t0_kref+0x3da8:   	save	%sp, -0x60, %sp
	.word	0xb607401a	! t0_kref+0x3dac:   	add	%i5, %i2, %i3
	.word	0xafee801c	! t0_kref+0x3db0:   	restore	%i2, %i4, %l7
	.word	0x89b10ca4	! t0_kref+0x3db4:   	fandnot2s	%f4, %f4, %f4
	.word	0x9330201b	! t0_kref+0x3db8:   	srl	%g0, 0x1b, %o1
	.word	0x96700000	! t0_kref+0x3dbc:   	udiv	%g0, %g0, %o3
	.word	0x89a01904	! t0_kref+0x3dc0:   	fitod	%f4, %f4
	.word	0x89a10944	! t0_kref+0x3dc4:   	fmuld	%f4, %f4, %f4
	.word	0x91400000	! t0_kref+0x3dc8:   	mov	%y, %o0
	call	SYM(t0_subr2)
	.word	0xd24e7ff1	! t0_kref+0x3dd0:   	ldsb	[%i1 - 0xf], %o1
	.word	0x89a108c4	! t0_kref+0x3dd4:   	fsubd	%f4, %f4, %f4
	.word	0x8143c000	! t0_kref+0x3dd8:   	stbar
	.word	0x98a82df1	! t0_kref+0x3ddc:   	andncc	%g0, 0xdf1, %o4
	.word	0xda08a030	! t0_kref+0x3de0:   	ldub	[%g2 + 0x30], %o5
	.word	0x9aa83a35	! t0_kref+0x3de4:   	andncc	%g0, -0x5cb, %o5
	.word	0xc9064000	! t0_kref+0x3de8:   	ld	[%i1], %f4
	.word	0x99b105c4	! t0_kref+0x3dec:   	fcmpeq32	%f4, %f4, %o4
	.word	0x80500000	! t0_kref+0x3df0:   	umul	%g0, %g0, %g0
	call	SYM(t0_subr1)
	.word	0x89b10ea0	! t0_kref+0x3df8:   	fsrc1s	%f4, %f4
	.word	0x89a000a4	! t0_kref+0x3dfc:   	fnegs	%f4, %f4
	.word	0x878020d2	! t0_kref+0x3e00:   	mov	0xd2, %asi
	.word	0x83414000	! t0_kref+0x3e04:   	mov	%pc, %g1
	.word	0xd068a025	! t0_kref+0x3e08:   	ldstub	[%g2 + 0x25], %o0
	.word	0x81a90a24	! t0_kref+0x3e0c:   	fcmps	%fcc0, %f4, %f4
	.word	0x89b10ac4	! t0_kref+0x3e10:   	fpsub32	%f4, %f4, %f4
	.word	0x8d800000	! t0_kref+0x3e14:   	mov	%g0, %fprs
	.word	0xaea80000	! t0_kref+0x3e18:   	andncc	%g0, %g0, %l7
	.word	0x89a10944	! t0_kref+0x3e1c:   	fmuld	%f4, %f4, %f4
	.word	0xd8380018	! t0_kref+0x3e20:   	std	%o4, [%g0 + %i0]
	.word	0xc030a02c	! t0_kref+0x3e24:   	clrh	[%g2 + 0x2c]
	.word	0x89a108c4	! t0_kref+0x3e28:   	fsubd	%f4, %f4, %f4
	.word	0x8d800000	! t0_kref+0x3e2c:   	mov	%g0, %fprs
	.word	0x81dcc01c	! t0_kref+0x3e30:   	flush	%l3 + %i4
	.word	0x89b00c00	! t0_kref+0x3e34:   	fzero	%f4
	.word	0x9f400000	! t0_kref+0x3e38:   	mov	%y, %o7
	.word	0x95b00160	! t0_kref+0x3e3c:   	edge32ln	%g0, %g0, %o2
	.word	0x89a00524	! t0_kref+0x3e40:   	fsqrts	%f4, %f4
	.word	0xec9e1000	! t0_kref+0x3e44:   	ldda	[%i0]0x80, %l6
	.word	0x89a108c4	! t0_kref+0x3e48:   	fsubd	%f4, %f4, %f4
	.word	0xc028a021	! t0_kref+0x3e4c:   	clrb	[%g2 + 0x21]
	.word	0xd4180019	! t0_kref+0x3e50:   	ldd	[%g0 + %i1], %o2
	.word	0x89b10ac4	! t0_kref+0x3e54:   	fpsub32	%f4, %f4, %f4
	.word	0xc920a024	! t0_kref+0x3e58:   	st	%f4, [%g2 + 0x24]
	.word	0x90080000	! t0_kref+0x3e5c:   	and	%g0, %g0, %o0
	.word	0xc020a00c	! t0_kref+0x3e60:   	clr	[%g2 + 0xc]
	.word	0xc920a02c	! t0_kref+0x3e64:   	st	%f4, [%g2 + 0x2c]
	.word	0xc9a01018	! t0_kref+0x3e68:   	sta	%f4, [%g0 + %i0]0x80
	.word	0xae400000	! t0_kref+0x3e6c:   	addc	%g0, %g0, %l7
	.word	0x81400000	! t0_kref+0x3e70:   	mov	%y, %g0
	.word	0xda00a03c	! t0_kref+0x3e74:   	ld	[%g2 + 0x3c], %o5
	.word	0x89a000a4	! t0_kref+0x3e78:   	fnegs	%f4, %f4
	.word	0x81800000	! t0_kref+0x3e7c:   	mov	%g0, %y
	.word	0xc920a038	! t0_kref+0x3e80:   	st	%f4, [%g2 + 0x38]
	.word	0x93282001	! t0_kref+0x3e84:   	sll	%g0, 0x1, %o1
	call	SYM(t0_subr3)
	.word	0xaf400000	! t0_kref+0x3e8c:   	mov	%y, %l7
	.word	0x89a00144	! t0_kref+0x3e90:   	fabsd	%f4, %f4
	.word	0x89a10844	! t0_kref+0x3e94:   	faddd	%f4, %f4, %f4
	.word	0x9aa80000	! t0_kref+0x3e98:   	andncc	%g0, %g0, %o5
	.word	0x89a108a4	! t0_kref+0x3e9c:   	fsubs	%f4, %f4, %f4
	.word	0xc0270018	! t0_kref+0x3ea0:   	clr	[%i4 + %i0]
	.word	0x97b00140	! t0_kref+0x3ea4:   	edge32l	%g0, %g0, %o3
	.word	0xc906200c	! t0_kref+0x3ea8:   	ld	[%i0 + 0xc], %f4
	.word	0x89a000a4	! t0_kref+0x3eac:   	fnegs	%f4, %f4
	.word	0xe0981019	! t0_kref+0x3eb0:   	ldda	[%g0 + %i1]0x80, %l0
	.word	0x9ae00000	! t0_kref+0x3eb4:   	subccc	%g0, %g0, %o5
	.word	0x89a108c4	! t0_kref+0x3eb8:   	fsubd	%f4, %f4, %f4
	.word	0xc920a028	! t0_kref+0x3ebc:   	st	%f4, [%g2 + 0x28]
	.word	0x94600000	! t0_kref+0x3ec0:   	subc	%g0, %g0, %o2
	.word	0xec3f4019	! t0_kref+0x3ec4:   	std	%l6, [%i5 + %i1]
	.word	0xd2162018	! t0_kref+0x3ec8:   	lduh	[%i0 + 0x18], %o1
	.word	0x9144c000	! t0_kref+0x3ecc:   	mov	%gsr, %o0
	.word	0x91b000c0	! t0_kref+0x3ed0:   	edge16l	%g0, %g0, %o0
	.word	0x98d83e08	! t0_kref+0x3ed4:   	smulcc	%g0, -0x1f8, %o4
	.word	0xee563ff6	! t0_kref+0x3ed8:   	ldsh	[%i0 - 0xa], %l7
	.word	0x9540c000	! t0_kref+0x3edc:   	mov	%asi, %o2
	.word	0xc0364000	! t0_kref+0x3ee0:   	clrh	[%i1]
	.word	0xc807bff0	! t0_kref+0x3ee4:   	ld	[%fp - 0x10], %g4
	.word	0xc0a65000	! t0_kref+0x3ee8:   	sta	%g0, [%i1]0x80
	.word	0x9ef80000	! t0_kref+0x3eec:   	sdivcc	%g0, %g0, %o7
	.word	0x89b10624	! t0_kref+0x3ef0:   	fmul8x16	%f4, %f4, %f4
	.word	0x80980000	! t0_kref+0x3ef4:   	xorcc	%g0, %g0, %g0
	.word	0x96180000	! t0_kref+0x3ef8:   	xor	%g0, %g0, %o3
	.word	0x90a82ebc	! t0_kref+0x3efc:   	andncc	%g0, 0xebc, %o0
	.word	0x89a10844	! t0_kref+0x3f00:   	faddd	%f4, %f4, %f4
	.word	0x89a01924	! t0_kref+0x3f04:   	fstod	%f4, %f4
	.word	0x2c800006	! t0_kref+0x3f08:   	bneg,a	_kref+0x3f20
	.word	0x80f83e55	! t0_kref+0x3f0c:   	sdivcc	%g0, -0x1ab, %g0
	.word	0x9530200e	! t0_kref+0x3f10:   	srl	%g0, 0xe, %o2
	.word	0xd00e7fe1	! t0_kref+0x3f14:   	ldub	[%i1 - 0x1f], %o0
	.word	0x9bb00100	! t0_kref+0x3f18:   	edge32	%g0, %g0, %o5
	.word	0xd610a000	! t0_kref+0x3f1c:   	lduh	[%g2], %o3
	.word	0x98c00000	! t0_kref+0x3f20:   	addccc	%g0, %g0, %o4
	.word	0x89a108a4	! t0_kref+0x3f24:   	fsubs	%f4, %f4, %f4
	.word	0xc048a009	! t0_kref+0x3f28:   	ldsb	[%g2 + 9], %g0
	.word	0xae882e40	! t0_kref+0x3f2c:   	andcc	%g0, 0xe40, %l7
	.word	0x86102012	! t0_kref+0x3f30:   	mov	0x12, %g3
	.word	0x86a0e001	! t0_kref+0x3f34:   	subcc	%g3, 1, %g3
	.word	0x22800013	! t0_kref+0x3f38:   	be,a	_kref+0x3f84
	.word	0x981025a4	! t0_kref+0x3f3c:   	mov	0x5a4, %o4
	.word	0xd80e3ffe	! t0_kref+0x3f40:   	ldub	[%i0 - 2], %o4
	.word	0x89a000a4	! t0_kref+0x3f44:   	fnegs	%f4, %f4
	.word	0x89a10d24	! t0_kref+0x3f48:   	fsmuld	%f4, %f4, %f4
	.word	0xaf300000	! t0_kref+0x3f4c:   	srl	%g0, %g0, %l7
	.word	0x80800000	! t0_kref+0x3f50:   	addcc	%g0, %g0, %g0
	.word	0x81a90aa4	! t0_kref+0x3f54:   	fcmpes	%fcc0, %f4, %f4
	.word	0x94c00000	! t0_kref+0x3f58:   	addccc	%g0, %g0, %o2
	.word	0xd89f5018	! t0_kref+0x3f5c:   	ldda	[%i5 + %i0]0x80, %o4
	.word	0x89a00524	! t0_kref+0x3f60:   	fsqrts	%f4, %f4
	.word	0x89b00fe0	! t0_kref+0x3f64:   	fones	%f4
	.word	0x89a01a44	! t0_kref+0x3f68:   	fdtoi	%f4, %f4
	.word	0x97b00060	! t0_kref+0x3f6c:   	edge8ln	%g0, %g0, %o3
	.word	0xc9060000	! t0_kref+0x3f70:   	ld	[%i0], %f4
	.word	0x946032a4	! t0_kref+0x3f74:   	subc	%g0, -0xd5c, %o2
	.word	0xc020a034	! t0_kref+0x3f78:   	clr	[%g2 + 0x34]
	.word	0x90102cd9	! t0_kref+0x3f7c:   	mov	0xcd9, %o0
	.word	0xd45f4019	! t0_kref+0x3f80:   	ldx	[%i5 + %i1], %o2
	.word	0xc020a038	! t0_kref+0x3f84:   	clr	[%g2 + 0x38]
	.word	0xc91e7fe0	! t0_kref+0x3f88:   	ldd	[%i1 - 0x20], %f4
	.word	0x81a90ac4	! t0_kref+0x3f8c:   	fcmped	%fcc0, %f4, %f4
	.word	0x988026c6	! t0_kref+0x3f90:   	addcc	%g0, 0x6c6, %o4
	.word	0xc9060000	! t0_kref+0x3f94:   	ld	[%i0], %f4
	.word	0xc9180019	! t0_kref+0x3f98:   	ldd	[%g0 + %i1], %f4
	.word	0x133dead8	! t0_kref+0x3f9c:   	sethi	%hi(0xf7ab6000), %o1
	.word	0x94200000	! t0_kref+0x3fa0:   	neg	%g0, %o2
	.word	0x89b107c4	! t0_kref+0x3fa4:   	pdist	%f4, %f4, %f4
	.word	0x94b03646	! t0_kref+0x3fa8:   	orncc	%g0, -0x9ba, %o2
	.word	0x89a00124	! t0_kref+0x3fac:   	fabss	%f4, %f4
	.word	0x89b107c4	! t0_kref+0x3fb0:   	pdist	%f4, %f4, %f4
	.word	0x89a000a4	! t0_kref+0x3fb4:   	fnegs	%f4, %f4
	.word	0xd6166010	! t0_kref+0x3fb8:   	lduh	[%i1 + 0x10], %o3
	.word	0x89a108c4	! t0_kref+0x3fbc:   	fsubd	%f4, %f4, %f4
	.word	0x89a108c4	! t0_kref+0x3fc0:   	fsubd	%f4, %f4, %f4
	.word	0x81a90aa4	! t0_kref+0x3fc4:   	fcmpes	%fcc0, %f4, %f4
	.word	0x9a002e1d	! t0_kref+0x3fc8:   	add	%g0, 0xe1d, %o5
	.word	0x9e00229a	! t0_kref+0x3fcc:   	add	%g0, 0x29a, %o7
	.word	0x81a90a24	! t0_kref+0x3fd0:   	fcmps	%fcc0, %f4, %f4
	.word	0xaf44c000	! t0_kref+0x3fd4:   	mov	%gsr, %l7
	.word	0xafb00020	! t0_kref+0x3fd8:   	edge8n	%g0, %g0, %l7
	.word	0xd810a012	! t0_kref+0x3fdc:   	lduh	[%g2 + 0x12], %o4
	.word	0xc1ee1000	! t0_kref+0x3fe0:   	prefetcha	%i0, 0
	.word	0x89b007a4	! t0_kref+0x3fe4:   	fpackfix	%f4, %f4
	.word	0x81b10484	! t0_kref+0x3fe8:   	fcmple32	%f4, %f4, %g0
	.word	0x89a108c4	! t0_kref+0x3fec:   	fsubd	%f4, %f4, %f4
	.word	0x81a90a44	! t0_kref+0x3ff0:   	fcmpd	%fcc0, %f4, %f4
	.word	0x2c800001	! t0_kref+0x3ff4:   	bneg,a	_kref+0x3ff8
	.word	0x89a10924	! t0_kref+0x3ff8:   	fmuls	%f4, %f4, %f4
	.word	0x81ddece1	! t0_kref+0x3ffc:   	flush	%l7 + 0xce1
	.word	0x9a803eea	! t0_kref+0x4000:   	addcc	%g0, -0x116, %o5
	.word	0x89b10904	! t0_kref+0x4004:   	faligndata	%f4, %f4, %f4
	.word	0x9bb00320	! t0_kref+0x4008:   	bmask	%g0, %g0, %o5
	.word	0x89a018c4	! t0_kref+0x400c:   	fdtos	%f4, %f4
	.word	0xc9be1840	! t0_kref+0x4010:   	stda	%f4, [%i0]0xc2
	.word	0x81a90aa4	! t0_kref+0x4014:   	fcmpes	%fcc0, %f4, %f4
	.word	0x89a000a4	! t0_kref+0x4018:   	fnegs	%f4, %f4
	.word	0x89a10824	! t0_kref+0x401c:   	fadds	%f4, %f4, %f4
	.word	0xc9062004	! t0_kref+0x4020:   	ld	[%i0 + 4], %f4
	.word	0x91b00200	! t0_kref+0x4024:   	array8	%g0, %g0, %o0
	.word	0x9330201b	! t0_kref+0x4028:   	srl	%g0, 0x1b, %o1
	.word	0x90400000	! t0_kref+0x402c:   	addc	%g0, %g0, %o0
	.word	0x94300000	! t0_kref+0x4030:   	orn	%g0, %g0, %o2
	.word	0x81a90aa4	! t0_kref+0x4034:   	fcmpes	%fcc0, %f4, %f4
	.word	0x89a00544	! t0_kref+0x4038:   	fsqrtd	%f4, %f4
	.word	0x9b418000	! t0_kref+0x403c:   	mov	%fprs, %o5
	.word	0xc028a005	! t0_kref+0x4040:   	clrb	[%g2 + 5]
	.word	0x9b280000	! t0_kref+0x4044:   	sll	%g0, %g0, %o5
	.word	0xc9267ff4	! t0_kref+0x4048:   	st	%f4, [%i1 - 0xc]
	.word	0xde0e6013	! t0_kref+0x404c:   	ldub	[%i1 + 0x13], %o7
	.word	0xed68a084	! t0_kref+0x4050:   	prefetch	%g2 + 0x84, 22
	.word	0x89a10924	! t0_kref+0x4054:   	fmuls	%f4, %f4, %f4
	.word	0xc91fbec0	! t0_kref+0x4058:   	ldd	[%fp - 0x140], %f4
	.word	0x9fc10000	! t0_kref+0x405c:   	call	%g4
	.word	0x89a10944	! t0_kref+0x4060:   	fmuld	%f4, %f4, %f4
	call	SYM(t0_subr2)
	.word	0x945034ff	! t0_kref+0x4068:   	umul	%g0, -0xb01, %o2
	.word	0xc00e6002	! t0_kref+0x406c:   	ldub	[%i1 + 2], %g0
	.word	0xae702c0c	! t0_kref+0x4070:   	udiv	%g0, 0xc0c, %l7
	.word	0x9e180000	! t0_kref+0x4074:   	xor	%g0, %g0, %o7
	.word	0x89b10fa4	! t0_kref+0x4078:   	fors	%f4, %f4, %f4
	.word	0x94c00000	! t0_kref+0x407c:   	addccc	%g0, %g0, %o2
	.word	0x91b00020	! t0_kref+0x4080:   	edge8n	%g0, %g0, %o0
	.word	0x89a109c4	! t0_kref+0x4084:   	fdivd	%f4, %f4, %f4
	.word	0x89b10d24	! t0_kref+0x4088:   	fandnot1s	%f4, %f4, %f4
	.word	0x90000000	! t0_kref+0x408c:   	add	%g0, %g0, %o0
	.word	0x9a980000	! t0_kref+0x4090:   	xorcc	%g0, %g0, %o5
	.word	0x89a10924	! t0_kref+0x4094:   	fmuls	%f4, %f4, %f4
	.word	0x93b105c4	! t0_kref+0x4098:   	fcmpeq32	%f4, %f4, %o1
	.word	0x94d0272a	! t0_kref+0x409c:   	umulcc	%g0, 0x72a, %o2
	.word	0x89b107c4	! t0_kref+0x40a0:   	pdist	%f4, %f4, %f4
	.word	0x99b00040	! t0_kref+0x40a4:   	edge8l	%g0, %g0, %o4
	.word	0x9de3bfa0	! t0_kref+0x40a8:   	save	%sp, -0x60, %sp
	.word	0xb29e001a	! t0_kref+0x40ac:   	xorcc	%i0, %i2, %i1
	.word	0x9bef2b4c	! t0_kref+0x40b0:   	restore	%i4, 0xb4c, %o5
	.word	0x89a80044	! t0_kref+0x40b4:   	fmovdn	%fcc0, %f4, %f4
	.word	0x89a108c4	! t0_kref+0x40b8:   	fsubd	%f4, %f4, %f4
	.word	0x89a108a4	! t0_kref+0x40bc:   	fsubs	%f4, %f4, %f4
	.word	0xc050a03c	! t0_kref+0x40c0:   	ldsh	[%g2 + 0x3c], %g0
	.word	0x8d800000	! t0_kref+0x40c4:   	mov	%g0, %fprs
	.word	0x89a10924	! t0_kref+0x40c8:   	fmuls	%f4, %f4, %f4
	.word	0xaef80000	! t0_kref+0x40cc:   	sdivcc	%g0, %g0, %l7
	.word	0x89a108c4	! t0_kref+0x40d0:   	fsubd	%f4, %f4, %f4
	.word	0xa9c067fe	! t0_kref+0x40d4:   	jmpl	%g1 + 0x7fe, %l4
	.word	0x8610200c	! t0_kref+0x40d8:   	mov	0xc, %g3
	.word	0x86a0e001	! t0_kref+0x40dc:   	subcc	%g3, 1, %g3
	.word	0x22800007	! t0_kref+0x40e0:   	be,a	_kref+0x40fc
	.word	0x89a108a4	! t0_kref+0x40e4:   	fsubs	%f4, %f4, %f4
	.word	0x92182efc	! t0_kref+0x40e8:   	xor	%g0, 0xefc, %o1
	.word	0x81a90aa4	! t0_kref+0x40ec:   	fcmpes	%fcc0, %f4, %f4
	.word	0xae6035c8	! t0_kref+0x40f0:   	subc	%g0, -0xa38, %l7
	.word	0x9bb00200	! t0_kref+0x40f4:   	array8	%g0, %g0, %o5
	.word	0xc028a00d	! t0_kref+0x40f8:   	clrb	[%g2 + 0xd]
	.word	0x89b10ca4	! t0_kref+0x40fc:   	fandnot2s	%f4, %f4, %f4
	.word	0x89a10844	! t0_kref+0x4100:   	faddd	%f4, %f4, %f4
	.word	0x28800008	! t0_kref+0x4104:   	bleu,a	_kref+0x4124
	.word	0xd640a01c	! t0_kref+0x4108:   	ldsw	[%g2 + 0x1c], %o3
	.word	0xd240a020	! t0_kref+0x410c:   	ldsw	[%g2 + 0x20], %o1
	.word	0x9e703584	! t0_kref+0x4110:   	udiv	%g0, -0xa7c, %o7
	.word	0xc00e0000	! t0_kref+0x4114:   	ldub	[%i0], %g0
	.word	0x89a108c4	! t0_kref+0x4118:   	fsubd	%f4, %f4, %f4
	.word	0x984022c4	! t0_kref+0x411c:   	addc	%g0, 0x2c4, %o4
	.word	0x9af83fea	! t0_kref+0x4120:   	sdivcc	%g0, -0x16, %o5
	.word	0x94182030	! t0_kref+0x4124:   	xor	%g0, 0x30, %o2
	.word	0x94400000	! t0_kref+0x4128:   	addc	%g0, %g0, %o2
	.word	0x949825c6	! t0_kref+0x412c:   	xorcc	%g0, 0x5c6, %o2
	.word	0xc9865000	! t0_kref+0x4130:   	lda	[%i1]0x80, %f4
	.word	0x92a83e8e	! t0_kref+0x4134:   	andncc	%g0, -0x172, %o1
	.word	0x89a00524	! t0_kref+0x4138:   	fsqrts	%f4, %f4
	.word	0x89a00044	! t0_kref+0x413c:   	fmovd	%f4, %f4
	.word	0x32800004	! t0_kref+0x4140:   	bne,a	_kref+0x4150
	.word	0xaf083cb9	! t0_kref+0x4144:   	tsubcc	%g0, -0x347, %l7
	.word	0x81dcb823	! t0_kref+0x4148:   	flush	%l2 - 0x7dd
	.word	0xc9180018	! t0_kref+0x414c:   	ldd	[%g0 + %i0], %f4
	.word	0xe41e3fe0	! t0_kref+0x4150:   	ldd	[%i0 - 0x20], %l2
	.word	0x89a01904	! t0_kref+0x4154:   	fitod	%f4, %f4
	.word	0x9de3bfa0	! t0_kref+0x4158:   	save	%sp, -0x60, %sp
	.word	0xb69f2057	! t0_kref+0x415c:   	xorcc	%i4, 0x57, %i3
	.word	0x97ee801b	! t0_kref+0x4160:   	restore	%i2, %i3, %o3
	.word	0x97280000	! t0_kref+0x4164:   	sll	%g0, %g0, %o3
	.word	0x98a80000	! t0_kref+0x4168:   	andncc	%g0, %g0, %o4
	.word	0x89a00544	! t0_kref+0x416c:   	fsqrtd	%f4, %f4
	.word	0x89a01924	! t0_kref+0x4170:   	fstod	%f4, %f4
	.word	0xc0267ff0	! t0_kref+0x4174:   	clr	[%i1 - 0x10]
	.word	0x81800000	! t0_kref+0x4178:   	mov	%g0, %y
	.word	0x89b00c00	! t0_kref+0x417c:   	fzero	%f4
	.word	0x92180000	! t0_kref+0x4180:   	xor	%g0, %g0, %o1
	.word	0x89a00124	! t0_kref+0x4184:   	fabss	%f4, %f4
	.word	0x001fffff	! t0_kref+0x4188:   	illtrap	0x1fffff
	.word	0xc920a010	! t0_kref+0x418c:   	st	%f4, [%g2 + 0x10]
	.word	0xc030a01a	! t0_kref+0x4190:   	clrh	[%g2 + 0x1a]
	.word	0x89b00764	! t0_kref+0x4194:   	fpack16	%f4, %f4
	.word	0xc9070018	! t0_kref+0x4198:   	ld	[%i4 + %i0], %f4
	.word	0x89a01044	! t0_kref+0x419c:   	fdtox	%f4, %f4
	.word	0x97400000	! t0_kref+0x41a0:   	mov	%y, %o3
	.word	0x92983f0d	! t0_kref+0x41a4:   	xorcc	%g0, -0xf3, %o1
	call	SYM(t0_subr0)
	.word	0x89b10624	! t0_kref+0x41ac:   	fmul8x16	%f4, %f4, %f4
	.word	0x90403f1c	! t0_kref+0x41b0:   	addc	%g0, -0xe4, %o0
	.word	0xae702437	! t0_kref+0x41b4:   	udiv	%g0, 0x437, %l7
	.word	0x89a108c4	! t0_kref+0x41b8:   	fsubd	%f4, %f4, %f4
	.word	0xc030a00e	! t0_kref+0x41bc:   	clrh	[%g2 + 0xe]
	.word	0xd050a030	! t0_kref+0x41c0:   	ldsh	[%g2 + 0x30], %o0
	.word	0x2e800001	! t0_kref+0x41c4:   	bvs,a	_kref+0x41c8
	.word	0xde0e200e	! t0_kref+0x41c8:   	ldub	[%i0 + 0xe], %o7
	.word	0xc9be6016	! t0_kref+0x41cc:   	stda	%f4, [%i1 + 0x16]%asi
	.word	0x95300000	! t0_kref+0x41d0:   	srl	%g0, %g0, %o2
	.word	0x81300000	! t0_kref+0x41d4:   	srl	%g0, %g0, %g0
	.word	0x89a00524	! t0_kref+0x41d8:   	fsqrts	%f4, %f4
	.word	0x89a01924	! t0_kref+0x41dc:   	fstod	%f4, %f4
	.word	0x89b10e04	! t0_kref+0x41e0:   	fand	%f4, %f4, %f4
	.word	0x89a10d24	! t0_kref+0x41e4:   	fsmuld	%f4, %f4, %f4
	.word	0x90900000	! t0_kref+0x41e8:   	orcc	%g0, %g0, %o0
	.word	0x89a109a4	! t0_kref+0x41ec:   	fdivs	%f4, %f4, %f4
	.word	0xc91fbdc8	! t0_kref+0x41f0:   	ldd	[%fp - 0x238], %f4
	.word	0x89a10944	! t0_kref+0x41f4:   	fmuld	%f4, %f4, %f4
	call	SYM(t0_subr3)
	.word	0x89b10e24	! t0_kref+0x41fc:   	fands	%f4, %f4, %f4
	.word	0xaf408000	! t0_kref+0x4200:   	mov	%ccr, %l7
	.word	0x89a00124	! t0_kref+0x4204:   	fabss	%f4, %f4
	.word	0xeaf81018	! t0_kref+0x4208:   	swapa	[%g0 + %i0]0x80, %l5
	.word	0xc9000019	! t0_kref+0x420c:   	ld	[%g0 + %i1], %f4
	.word	0xda480018	! t0_kref+0x4210:   	ldsb	[%g0 + %i0], %o5
	.word	0x89b10ea0	! t0_kref+0x4214:   	fsrc1s	%f4, %f4
	.word	0x81da000b	! t0_kref+0x4218:   	flush	%o0 + %o3
	.word	0x20800008	! t0_kref+0x421c:   	bn,a	_kref+0x423c
	.word	0xc0ae9019	! t0_kref+0x4220:   	stba	%g0, [%i2 + %i1]0x80
	.word	0x9fc00004	! t0_kref+0x4224:   	call	%g0 + %g4
	.word	0x97400000	! t0_kref+0x4228:   	mov	%y, %o3
	.word	0x9bb000a0	! t0_kref+0x422c:   	edge16n	%g0, %g0, %o5
	.word	0x89a10924	! t0_kref+0x4230:   	fmuls	%f4, %f4, %f4
	.word	0x89a10924	! t0_kref+0x4234:   	fmuls	%f4, %f4, %f4
	.word	0xc020a030	! t0_kref+0x4238:   	clr	[%g2 + 0x30]
	.word	0x81400000	! t0_kref+0x423c:   	mov	%y, %g0
	.word	0xafb10484	! t0_kref+0x4240:   	fcmple32	%f4, %f4, %l7
	.word	0xc030a02a	! t0_kref+0x4244:   	clrh	[%g2 + 0x2a]
	.word	0xc99f5018	! t0_kref+0x4248:   	ldda	[%i5 + %i0]0x80, %f4
	.word	0x89a10824	! t0_kref+0x424c:   	fadds	%f4, %f4, %f4
	.word	0x90f8382f	! t0_kref+0x4250:   	sdivcc	%g0, -0x7d1, %o0
	.word	0x97b10584	! t0_kref+0x4254:   	fcmpgt32	%f4, %f4, %o3
	.word	0x89b106e4	! t0_kref+0x4258:   	fmul8ulx16	%f4, %f4, %f4
	.word	0x89a01924	! t0_kref+0x425c:   	fstod	%f4, %f4
	.word	0x90700000	! t0_kref+0x4260:   	udiv	%g0, %g0, %o0
	.word	0x95302010	! t0_kref+0x4264:   	srl	%g0, 0x10, %o2
	.word	0x89b10ec4	! t0_kref+0x4268:   	fornot2	%f4, %f4, %f4
	.word	0xaea83084	! t0_kref+0x426c:   	andncc	%g0, -0xf7c, %l7
	.word	0xaf282006	! t0_kref+0x4270:   	sll	%g0, 0x6, %l7
	.word	0xe1182ed0	! t0_kref+0x4274:   	ldd	[%g0 + 0xed0], %f16
	.word	0x9a883f52	! t0_kref+0x4278:   	andcc	%g0, -0xae, %o5
	.word	0x92a80000	! t0_kref+0x427c:   	andncc	%g0, %g0, %o1
	.word	0xda080019	! t0_kref+0x4280:   	ldub	[%g0 + %i1], %o5
	.word	0x98e03934	! t0_kref+0x4284:   	subccc	%g0, -0x6cc, %o4
	.word	0x95200000	! t0_kref+0x4288:   	mulscc	%g0, %g0, %o2
	.word	0x94180000	! t0_kref+0x428c:   	xor	%g0, %g0, %o2
	.word	0x89b10c44	! t0_kref+0x4290:   	fnor	%f4, %f4, %f4
	.word	0x98103f28	! t0_kref+0x4294:   	mov	0xffffff28, %o4
	.word	0x9840294d	! t0_kref+0x4298:   	addc	%g0, 0x94d, %o4
	.word	0x81a90aa4	! t0_kref+0x429c:   	fcmpes	%fcc0, %f4, %f4
	.word	0x89b00fc0	! t0_kref+0x42a0:   	fone	%f4
	.word	0xd84e7fea	! t0_kref+0x42a4:   	ldsb	[%i1 - 0x16], %o4
	.word	0x80b00000	! t0_kref+0x42a8:   	orncc	%g0, %g0, %g0
	.word	0x93b00200	! t0_kref+0x42ac:   	array8	%g0, %g0, %o1
	.word	0xae3026f9	! t0_kref+0x42b0:   	orn	%g0, 0x6f9, %l7
	.word	0xc0264000	! t0_kref+0x42b4:   	clr	[%i1]
	.word	0x9e802b91	! t0_kref+0x42b8:   	addcc	%g0, 0xb91, %o7
	.word	0x89b10ae4	! t0_kref+0x42bc:   	fpsub32s	%f4, %f4, %f4
	.word	0xc030a016	! t0_kref+0x42c0:   	clrh	[%g2 + 0x16]
	.word	0xc0266004	! t0_kref+0x42c4:   	clr	[%i1 + 4]
	.word	0x92800000	! t0_kref+0x42c8:   	addcc	%g0, %g0, %o1
	.word	0x99b10404	! t0_kref+0x42cc:   	fcmple16	%f4, %f4, %o4
	.word	0x89b10724	! t0_kref+0x42d0:   	fmuld8ulx16	%f4, %f4, %f4
	call	SYM(t0_subr3)
	.word	0x94280000	! t0_kref+0x42d8:   	andn	%g0, %g0, %o2
	.word	0x8143c000	! t0_kref+0x42dc:   	stbar
	.word	0xee0e7fe5	! t0_kref+0x42e0:   	ldub	[%i1 - 0x1b], %l7
	.word	0xd01e4000	! t0_kref+0x42e4:   	ldd	[%i1], %o0
	.word	0x89a01a44	! t0_kref+0x42e8:   	fdtoi	%f4, %f4
	.word	0x90782e49	! t0_kref+0x42ec:   	sdiv	%g0, 0xe49, %o0
	.word	0x80a00000	! t0_kref+0x42f0:   	cmp	%g0, %g0
	.word	0x94303a0c	! t0_kref+0x42f4:   	orn	%g0, -0x5f4, %o2
	.word	0x8144c000	! t0_kref+0x42f8:   	mov	%gsr, %g0
	.word	0x89a01904	! t0_kref+0x42fc:   	fitod	%f4, %f4
	.word	0x9ac00000	! t0_kref+0x4300:   	addccc	%g0, %g0, %o5
	.word	0xc9801019	! t0_kref+0x4304:   	lda	[%g0 + %i1]0x80, %f4
	.word	0x89abc044	! t0_kref+0x4308:   	fmovdo	%fcc0, %f4, %f4
	.word	0x89b10f84	! t0_kref+0x430c:   	for	%f4, %f4, %f4
	.word	0x89a108c4	! t0_kref+0x4310:   	fsubd	%f4, %f4, %f4
	.word	0xc02e401a	! t0_kref+0x4314:   	clrb	[%i1 + %i2]
	.word	0x81b00240	! t0_kref+0x4318:   	array16	%g0, %g0, %g0
	.word	0x89a10924	! t0_kref+0x431c:   	fmuls	%f4, %f4, %f4
	.word	0x89a10924	! t0_kref+0x4320:   	fmuls	%f4, %f4, %f4
	.word	0x89a10844	! t0_kref+0x4324:   	faddd	%f4, %f4, %f4
	.word	0x89a109c4	! t0_kref+0x4328:   	fdivd	%f4, %f4, %f4
	.word	0xafb105c4	! t0_kref+0x432c:   	fcmpeq32	%f4, %f4, %l7
	.word	0x89b10f44	! t0_kref+0x4330:   	fornot1	%f4, %f4, %f4
	.word	0xc04e601b	! t0_kref+0x4334:   	ldsb	[%i1 + 0x1b], %g0
	.word	0x89b10744	! t0_kref+0x4338:   	fpack32	%f4, %f4, %f4
	.word	0x20800004	! t0_kref+0x433c:   	bn,a	_kref+0x434c
	.word	0x9bb00060	! t0_kref+0x4340:   	edge8ln	%g0, %g0, %o5
	.word	0x89a000a4	! t0_kref+0x4344:   	fnegs	%f4, %f4
	.word	0x89a000a4	! t0_kref+0x4348:   	fnegs	%f4, %f4
	.word	0x89b10ac4	! t0_kref+0x434c:   	fpsub32	%f4, %f4, %f4
	call	SYM(t0_subr2)
	.word	0xe050a01e	! t0_kref+0x4354:   	ldsh	[%g2 + 0x1e], %l0
	.word	0x99400000	! t0_kref+0x4358:   	mov	%y, %o4
	.word	0x9b700000	! t0_kref+0x435c:   	popc	%g0, %o5
	.word	0x89a10924	! t0_kref+0x4360:   	fmuls	%f4, %f4, %f4
	.word	0x95b10504	! t0_kref+0x4364:   	fcmpgt16	%f4, %f4, %o2
	.word	0x95282012	! t0_kref+0x4368:   	sll	%g0, 0x12, %o2
	.word	0x81400000	! t0_kref+0x436c:   	mov	%y, %g0
	.word	0xae50324f	! t0_kref+0x4370:   	umul	%g0, -0xdb1, %l7
	.word	0xc030a016	! t0_kref+0x4374:   	clrh	[%g2 + 0x16]
	.word	0x89b106c4	! t0_kref+0x4378:   	fmul8sux16	%f4, %f4, %f4
	.word	0x80700000	! t0_kref+0x437c:   	udiv	%g0, %g0, %g0
	.word	0x9fc00004	! t0_kref+0x4380:   	call	%g0 + %g4
	.word	0x89a00544	! t0_kref+0x4384:   	fsqrtd	%f4, %f4
	.word	0x912030b6	! t0_kref+0x4388:   	mulscc	%g0, -0xf4a, %o0
	.word	0xc028a015	! t0_kref+0x438c:   	clrb	[%g2 + 0x15]
	.word	0x9fc00004	! t0_kref+0x4390:   	call	%g0 + %g4
	.word	0x80d00000	! t0_kref+0x4394:   	umulcc	%g0, %g0, %g0
	.word	0xc91fbee8	! t0_kref+0x4398:   	ldd	[%fp - 0x118], %f4
	.word	0x89a108a4	! t0_kref+0x439c:   	fsubs	%f4, %f4, %f4
	.word	0x89a108c4	! t0_kref+0x43a0:   	fsubd	%f4, %f4, %f4
	.word	0x98883ccc	! t0_kref+0x43a4:   	andcc	%g0, -0x334, %o4
	.word	0x89a108a4	! t0_kref+0x43a8:   	fsubs	%f4, %f4, %f4
	.word	0x89a01904	! t0_kref+0x43ac:   	fitod	%f4, %f4
	.word	0xc030a028	! t0_kref+0x43b0:   	clrh	[%g2 + 0x28]
	.word	0x20800002	! t0_kref+0x43b4:   	bn,a	_kref+0x43bc
	.word	0xd6ee101a	! t0_kref+0x43b8:   	ldstuba	[%i0 + %i2]0x80, %o3
	.word	0x89a000a4	! t0_kref+0x43bc:   	fnegs	%f4, %f4
	.word	0x905035b7	! t0_kref+0x43c0:   	umul	%g0, -0xa49, %o0
	.word	0x3c800001	! t0_kref+0x43c4:   	bpos,a	_kref+0x43c8
	.word	0x89a00144	! t0_kref+0x43c8:   	fabsd	%f4, %f4
	.word	0x94f80000	! t0_kref+0x43cc:   	sdivcc	%g0, %g0, %o2
	.word	0x97280000	! t0_kref+0x43d0:   	sll	%g0, %g0, %o3
	.word	0xc020a01c	! t0_kref+0x43d4:   	clr	[%g2 + 0x1c]
	.word	0xd5f65000	! t0_kref+0x43d8:   	casxa	[%i1]0x80, %g0, %o2
	.word	0x9f30200a	! t0_kref+0x43dc:   	srl	%g0, 0xa, %o7
	.word	0x98002496	! t0_kref+0x43e0:   	add	%g0, 0x496, %o4
	.word	0xe81e2010	! t0_kref+0x43e4:   	ldd	[%i0 + 0x10], %l4
	.word	0xd806401c	! t0_kref+0x43e8:   	ld	[%i1 + %i4], %o4
	.word	0xc0266008	! t0_kref+0x43ec:   	clr	[%i1 + 8]
	.word	0x89a10924	! t0_kref+0x43f0:   	fmuls	%f4, %f4, %f4
	.word	0x96000000	! t0_kref+0x43f4:   	add	%g0, %g0, %o3
	.word	0x94403d15	! t0_kref+0x43f8:   	addc	%g0, -0x2eb, %o2
	.word	0x89a108a4	! t0_kref+0x43fc:   	fsubs	%f4, %f4, %f4
	.word	0xc920a024	! t0_kref+0x4400:   	st	%f4, [%g2 + 0x24]
	.word	0x30480008	! t0_kref+0x4404:   	ba,a,pt	%icc, _kref+0x4424
	.word	0xc028a01e	! t0_kref+0x4408:   	clrb	[%g2 + 0x1e]
	.word	0x96100000	! t0_kref+0x440c:   	clr	%o3
	.word	0x92f80000	! t0_kref+0x4410:   	sdivcc	%g0, %g0, %o1
	.word	0x89a01924	! t0_kref+0x4414:   	fstod	%f4, %f4
	.word	0x89b10724	! t0_kref+0x4418:   	fmuld8ulx16	%f4, %f4, %f4
	.word	0x81a90aa4	! t0_kref+0x441c:   	fcmpes	%fcc0, %f4, %f4
	.word	0x24800001	! t0_kref+0x4420:   	ble,a	_kref+0x4424
	.word	0x95380000	! t0_kref+0x4424:   	sra	%g0, %g0, %o2
	.word	0x99380000	! t0_kref+0x4428:   	sra	%g0, %g0, %o4
	.word	0x90e00000	! t0_kref+0x442c:   	subccc	%g0, %g0, %o0
	.word	0xe8380019	! t0_kref+0x4430:   	std	%l4, [%g0 + %i1]
	.word	0xe43e7fe8	! t0_kref+0x4434:   	std	%l2, [%i1 - 0x18]
	.word	0x96f83cd9	! t0_kref+0x4438:   	sdivcc	%g0, -0x327, %o3
	.word	0x81580000	! t0_kref+0x443c:   	flushw
	.word	0x86102001	! t0_kref+0x4440:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x4444:   	bne,a	_kref+0x4444
	.word	0x86a0e001	! t0_kref+0x4448:   	subcc	%g3, 1, %g3
	.word	0x9fb00080	! t0_kref+0x444c:   	edge16	%g0, %g0, %o7
	.word	0xae800000	! t0_kref+0x4450:   	addcc	%g0, %g0, %l7
	.word	0xc9be1840	! t0_kref+0x4454:   	stda	%f4, [%i0]0xc2
	.word	0x89a01904	! t0_kref+0x4458:   	fitod	%f4, %f4
	.word	0x9e8033f0	! t0_kref+0x445c:   	addcc	%g0, -0xc10, %o7
	.word	0xc9067fe4	! t0_kref+0x4460:   	ld	[%i1 - 0x1c], %f4
	.word	0x89a00544	! t0_kref+0x4464:   	fsqrtd	%f4, %f4
	.word	0x9de3bfa0	! t0_kref+0x4468:   	save	%sp, -0x60, %sp
	.word	0xb0c6001d	! t0_kref+0x446c:   	addccc	%i0, %i5, %i0
	.word	0x81e8001d	! t0_kref+0x4470:   	restore	%g0, %i5, %g0
	.word	0xc99e501d	! t0_kref+0x4474:   	ldda	[%i1 + %i5]0x80, %f4
	.word	0xc020a024	! t0_kref+0x4478:   	clr	[%g2 + 0x24]
	.word	0x89a01a44	! t0_kref+0x447c:   	fdtoi	%f4, %f4
	.word	0xd256401b	! t0_kref+0x4480:   	ldsh	[%i1 + %i3], %o1
	.word	0x89a00124	! t0_kref+0x4484:   	fabss	%f4, %f4
	.word	0x81a90aa4	! t0_kref+0x4488:   	fcmpes	%fcc0, %f4, %f4
	.word	0x89a10d24	! t0_kref+0x448c:   	fsmuld	%f4, %f4, %f4
	.word	0xc906401c	! t0_kref+0x4490:   	ld	[%i1 + %i4], %f4
	.word	0x98002689	! t0_kref+0x4494:   	add	%g0, 0x689, %o4
	.word	0x89b10ae4	! t0_kref+0x4498:   	fpsub32s	%f4, %f4, %f4
	.word	0x89a01044	! t0_kref+0x449c:   	fdtox	%f4, %f4
	.word	0x32800004	! t0_kref+0x44a0:   	bne,a	_kref+0x44b0
	.word	0xd210a026	! t0_kref+0x44a4:   	lduh	[%g2 + 0x26], %o1
	.word	0x38800004	! t0_kref+0x44a8:   	bgu,a	_kref+0x44b8
	.word	0x90700000	! t0_kref+0x44ac:   	udiv	%g0, %g0, %o0
	.word	0x89b10744	! t0_kref+0x44b0:   	fpack32	%f4, %f4, %f4
	.word	0x8144c000	! t0_kref+0x44b4:   	mov	%gsr, %g0
	.word	0xd0881019	! t0_kref+0x44b8:   	lduba	[%g0 + %i1]0x80, %o0
	.word	0x91280000	! t0_kref+0x44bc:   	sll	%g0, %g0, %o0
	.word	0xc0266010	! t0_kref+0x44c0:   	clr	[%i1 + 0x10]
	.word	0x89b10aa4	! t0_kref+0x44c4:   	fpsub16s	%f4, %f4, %f4
	.word	0x89a01a44	! t0_kref+0x44c8:   	fdtoi	%f4, %f4
	.word	0x38800005	! t0_kref+0x44cc:   	bgu,a	_kref+0x44e0
	.word	0xd8463fe4	! t0_kref+0x44d0:   	ldsw	[%i0 - 0x1c], %o4
	.word	0x89a00124	! t0_kref+0x44d4:   	fabss	%f4, %f4
	.word	0x89a10844	! t0_kref+0x44d8:   	faddd	%f4, %f4, %f4
	.word	0x89a108a4	! t0_kref+0x44dc:   	fsubs	%f4, %f4, %f4
	.word	0xd440a004	! t0_kref+0x44e0:   	ldsw	[%g2 + 4], %o2
	.word	0x81a90a44	! t0_kref+0x44e4:   	fcmpd	%fcc0, %f4, %f4
	.word	0x89b10c44	! t0_kref+0x44e8:   	fnor	%f4, %f4, %f4
	.word	0xc91fbdd0	! t0_kref+0x44ec:   	ldd	[%fp - 0x230], %f4
	.word	0xc998105d	! t0_kref+0x44f0:   	ldda	[%g0 + %i5]0x82, %f4
	.word	0x89a01904	! t0_kref+0x44f4:   	fitod	%f4, %f4
	.word	0xe49e5000	! t0_kref+0x44f8:   	ldda	[%i1]0x80, %l2
	.word	0x81ddc018	! t0_kref+0x44fc:   	flush	%l7 + %i0
	.word	0x9ef80000	! t0_kref+0x4500:   	sdivcc	%g0, %g0, %o7
	.word	0x80d821fb	! t0_kref+0x4504:   	smulcc	%g0, 0x1fb, %g0
	.word	0x81200000	! t0_kref+0x4508:   	mulscc	%g0, %g0, %g0
	.word	0xde56c019	! t0_kref+0x450c:   	ldsh	[%i3 + %i1], %o7
	.word	0x91b00240	! t0_kref+0x4510:   	array16	%g0, %g0, %o0
	.word	0x89a10824	! t0_kref+0x4514:   	fadds	%f4, %f4, %f4
	.word	0xd8df5019	! t0_kref+0x4518:   	ldxa	[%i5 + %i1]0x80, %o4
	.word	0x89b10ae4	! t0_kref+0x451c:   	fpsub32s	%f4, %f4, %f4
	.word	0x9e50288b	! t0_kref+0x4520:   	umul	%g0, 0x88b, %o7
	.word	0x98080000	! t0_kref+0x4524:   	and	%g0, %g0, %o4
	.word	0xd808a01f	! t0_kref+0x4528:   	ldub	[%g2 + 0x1f], %o4
	.word	0xc0466014	! t0_kref+0x452c:   	ldsw	[%i1 + 0x14], %g0
	.word	0x89b107c4	! t0_kref+0x4530:   	pdist	%f4, %f4, %f4
	.word	0x96d02499	! t0_kref+0x4534:   	umulcc	%g0, 0x499, %o3
	.word	0xd610a038	! t0_kref+0x4538:   	lduh	[%g2 + 0x38], %o3
	.word	0xaf300000	! t0_kref+0x453c:   	srl	%g0, %g0, %l7
	.word	0x93280000	! t0_kref+0x4540:   	sll	%g0, %g0, %o1
	.word	0x95302004	! t0_kref+0x4544:   	srl	%g0, 0x4, %o2
	.word	0x89a108c4	! t0_kref+0x4548:   	fsubd	%f4, %f4, %f4
	.word	0x81b01026	! t0_kref+0x454c:   	siam	0x6
	.word	0xc07e7ff0	! t0_kref+0x4550:   	swap	[%i1 - 0x10], %g0
	.word	0x89a00124	! t0_kref+0x4554:   	fabss	%f4, %f4
	.word	0x89a00144	! t0_kref+0x4558:   	fabsd	%f4, %f4
	.word	0x99400000	! t0_kref+0x455c:   	mov	%y, %o4
	.word	0x92c00000	! t0_kref+0x4560:   	addccc	%g0, %g0, %o1
	.word	0xafb00000	! t0_kref+0x4564:   	edge8	%g0, %g0, %l7
	.word	0x89a108c4	! t0_kref+0x4568:   	fsubd	%f4, %f4, %f4
	.word	0x8d800000	! t0_kref+0x456c:   	mov	%g0, %fprs
	.word	0x9fc00004	! t0_kref+0x4570:   	call	%g0 + %g4
	.word	0x92600000	! t0_kref+0x4574:   	subc	%g0, %g0, %o1
	.word	0x38480008	! t0_kref+0x4578:   	bgu,a,pt	%icc, _kref+0x4598
	.word	0x89a01924	! t0_kref+0x457c:   	fstod	%f4, %f4
	.word	0xc9be5840	! t0_kref+0x4580:   	stda	%f4, [%i1]0xc2
	.word	0x81dbe58c	! t0_kref+0x4584:   	flush	%o7 + 0x58c
	.word	0x8143c000	! t0_kref+0x4588:   	stbar
	.word	0x89a10824	! t0_kref+0x458c:   	fadds	%f4, %f4, %f4
	.word	0x81a90a24	! t0_kref+0x4590:   	fcmps	%fcc0, %f4, %f4
	.word	0x89b10aa4	! t0_kref+0x4594:   	fpsub16s	%f4, %f4, %f4
	call	SYM(t0_subr1)
	.word	0x96702fa1	! t0_kref+0x459c:   	udiv	%g0, 0xfa1, %o3
	.word	0xd84e001a	! t0_kref+0x45a0:   	ldsb	[%i0 + %i2], %o4
	.word	0x9ad80000	! t0_kref+0x45a4:   	smulcc	%g0, %g0, %o5
	.word	0x89a10924	! t0_kref+0x45a8:   	fmuls	%f4, %f4, %f4
	.word	0xe49e101d	! t0_kref+0x45ac:   	ldda	[%i0 + %i5]0x80, %l2
	.word	0xaea80000	! t0_kref+0x45b0:   	andncc	%g0, %g0, %l7
	.word	0xca6e8000	! t0_kref+0x45b4:   	ldstub	[%i2], %g5
	.word	0x98a03c1f	! t0_kref+0x45b8:   	subcc	%g0, -0x3e1, %o4
	.word	0x89a10844	! t0_kref+0x45bc:   	faddd	%f4, %f4, %f4
	.word	0xe01e7ff0	! t0_kref+0x45c0:   	ldd	[%i1 - 0x10], %l0
	.word	0xc9be1a5c	! t0_kref+0x45c4:   	stda	%f4, [%i0 + %i4]0xd2
	.word	0x9f282013	! t0_kref+0x45c8:   	sll	%g0, 0x13, %o7
	.word	0x89a00124	! t0_kref+0x45cc:   	fabss	%f4, %f4
	.word	0x81a90a24	! t0_kref+0x45d0:   	fcmps	%fcc0, %f4, %f4
	.word	0xe3ee101d	! t0_kref+0x45d4:   	prefetcha	%i0 + %i5, 17
	.word	0x26480006	! t0_kref+0x45d8:   	bl,a,pt	%icc, _kref+0x45f0
	.word	0x89a10844	! t0_kref+0x45dc:   	faddd	%f4, %f4, %f4
	.word	0xde062010	! t0_kref+0x45e0:   	ld	[%i0 + 0x10], %o7
	.word	0x81a90ac4	! t0_kref+0x45e4:   	fcmped	%fcc0, %f4, %f4
	.word	0x89a00544	! t0_kref+0x45e8:   	fsqrtd	%f4, %f4
	.word	0x9fc00004	! t0_kref+0x45ec:   	call	%g0 + %g4
	.word	0xe0480018	! t0_kref+0x45f0:   	ldsb	[%g0 + %i0], %l0
	.word	0x89b00f04	! t0_kref+0x45f4:   	fsrc2	%f4, %f4
	.word	0x89a109a4	! t0_kref+0x45f8:   	fdivs	%f4, %f4, %f4
	.word	0x89a00524	! t0_kref+0x45fc:   	fsqrts	%f4, %f4
	.word	0x89b106a4	! t0_kref+0x4600:   	fmul8x16al	%f4, %f4, %f4
	.word	0x89a108c4	! t0_kref+0x4604:   	fsubd	%f4, %f4, %f4
	.word	0x90e02b9e	! t0_kref+0x4608:   	subccc	%g0, 0xb9e, %o0
	.word	0x89a108a4	! t0_kref+0x460c:   	fsubs	%f4, %f4, %f4
	.word	0x81daadf9	! t0_kref+0x4610:   	flush	%o2 + 0xdf9
	.word	0x89a10824	! t0_kref+0x4614:   	fadds	%f4, %f4, %f4
	.word	0x91282007	! t0_kref+0x4618:   	sll	%g0, 0x7, %o0
	.word	0xd8780019	! t0_kref+0x461c:   	swap	[%g0 + %i1], %o4
	.word	0x89a00124	! t0_kref+0x4620:   	fabss	%f4, %f4
	.word	0xd44e001a	! t0_kref+0x4624:   	ldsb	[%i0 + %i2], %o2
	.word	0x94080000	! t0_kref+0x4628:   	and	%g0, %g0, %o2
	.word	0xd256c018	! t0_kref+0x462c:   	ldsh	[%i3 + %i0], %o1
	.word	0x89a10824	! t0_kref+0x4630:   	fadds	%f4, %f4, %f4
	.word	0x89a000a4	! t0_kref+0x4634:   	fnegs	%f4, %f4
	.word	0x9ad0214a	! t0_kref+0x4638:   	umulcc	%g0, 0x14a, %o5
	.word	0x9f40c000	! t0_kref+0x463c:   	mov	%asi, %o7
	.word	0x89a00544	! t0_kref+0x4640:   	fsqrtd	%f4, %f4
	.word	0x89a10844	! t0_kref+0x4644:   	faddd	%f4, %f4, %f4
	.word	0xebee101c	! t0_kref+0x4648:   	prefetcha	%i0 + %i4, 21
	.word	0x98002ea4	! t0_kref+0x464c:   	add	%g0, 0xea4, %o4
	.word	0x89a00524	! t0_kref+0x4650:   	fsqrts	%f4, %f4
	.word	0x32800001	! t0_kref+0x4654:   	bne,a	_kref+0x4658
	.word	0xec1e401d	! t0_kref+0x4658:   	ldd	[%i1 + %i5], %l6
	.word	0x89a10824	! t0_kref+0x465c:   	fadds	%f4, %f4, %f4
	.word	0xc0270019	! t0_kref+0x4660:   	clr	[%i4 + %i1]
	call	SYM(t0_subr1)
	.word	0x94d838ec	! t0_kref+0x4668:   	smulcc	%g0, -0x714, %o2
	.word	0x91b00100	! t0_kref+0x466c:   	edge32	%g0, %g0, %o0
	.word	0x81580000	! t0_kref+0x4670:   	flushw
	.word	0x9e300000	! t0_kref+0x4674:   	orn	%g0, %g0, %o7
	.word	0x89a108a4	! t0_kref+0x4678:   	fsubs	%f4, %f4, %f4
	.word	0xc91fbf48	! t0_kref+0x467c:   	ldd	[%fp - 0xb8], %f4
	.word	0x9ab824b7	! t0_kref+0x4680:   	xnorcc	%g0, 0x4b7, %o5
	.word	0xc0ae9018	! t0_kref+0x4684:   	stba	%g0, [%i2 + %i0]0x80
	.word	0x89a000a4	! t0_kref+0x4688:   	fnegs	%f4, %f4
	.word	0xae800000	! t0_kref+0x468c:   	addcc	%g0, %g0, %l7
	.word	0xc028a003	! t0_kref+0x4690:   	clrb	[%g2 + 3]
	.word	0x9e180000	! t0_kref+0x4694:   	xor	%g0, %g0, %o7
	.word	0x96c00000	! t0_kref+0x4698:   	addccc	%g0, %g0, %o3
	.word	0xc900a014	! t0_kref+0x469c:   	ld	[%g2 + 0x14], %f4
	.word	0xc99f5018	! t0_kref+0x46a0:   	ldda	[%i5 + %i0]0x80, %f4
	.word	0x81a90aa4	! t0_kref+0x46a4:   	fcmpes	%fcc0, %f4, %f4
	.word	0x9970213c	! t0_kref+0x46a8:   	popc	0x13c, %o4
	.word	0x89a01104	! t0_kref+0x46ac:   	fxtod	%f4, %f4
	.word	0x89a10844	! t0_kref+0x46b0:   	faddd	%f4, %f4, %f4
	.word	0xd8ee101a	! t0_kref+0x46b4:   	ldstuba	[%i0 + %i2]0x80, %o4
	call	SYM(t0_subr1)
	.word	0x89a00124	! t0_kref+0x46bc:   	fabss	%f4, %f4
	.word	0x89a01884	! t0_kref+0x46c0:   	fitos	%f4, %f4
	.word	0xf207bfe0	! t0_kref+0x46c4:   	ld	[%fp - 0x20], %i1
	.word	0xd0de101d	! t0_kref+0x46c8:   	ldxa	[%i0 + %i5]0x80, %o0
	.word	0x89a108c4	! t0_kref+0x46cc:   	fsubd	%f4, %f4, %f4
	.word	0x113d5e2a	! t0_kref+0x46d0:   	sethi	%hi(0xf578a800), %o0
	.word	0x96d00000	! t0_kref+0x46d4:   	umulcc	%g0, %g0, %o3
	.word	0x89b10d84	! t0_kref+0x46d8:   	fxor	%f4, %f4, %f4
	.word	0x9b200000	! t0_kref+0x46dc:   	mulscc	%g0, %g0, %o5
	.word	0x92a82ebe	! t0_kref+0x46e0:   	andncc	%g0, 0xebe, %o1
	.word	0x89a10844	! t0_kref+0x46e4:   	faddd	%f4, %f4, %f4
	.word	0x89a10844	! t0_kref+0x46e8:   	faddd	%f4, %f4, %f4
	.word	0xc807bfec	! t0_kref+0x46ec:   	ld	[%fp - 0x14], %g4
	.word	0x89a01924	! t0_kref+0x46f0:   	fstod	%f4, %f4
	.word	0x8143c000	! t0_kref+0x46f4:   	stbar
	.word	0x2a800007	! t0_kref+0x46f8:   	bcs,a	_kref+0x4714
	.word	0x9e180000	! t0_kref+0x46fc:   	xor	%g0, %g0, %o7
	.word	0x89a108a4	! t0_kref+0x4700:   	fsubs	%f4, %f4, %f4
	.word	0x38800005	! t0_kref+0x4704:   	bgu,a	_kref+0x4718
	.word	0x89a00024	! t0_kref+0x4708:   	fmovs	%f4, %f4
	.word	0x9a000000	! t0_kref+0x470c:   	add	%g0, %g0, %o5
	.word	0x9f280000	! t0_kref+0x4710:   	sll	%g0, %g0, %o7
	.word	0xae700000	! t0_kref+0x4714:   	udiv	%g0, %g0, %l7
	.word	0x89a10924	! t0_kref+0x4718:   	fmuls	%f4, %f4, %f4
	.word	0x86102004	! t0_kref+0x471c:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x4720:   	bne,a	_kref+0x4720
	.word	0x86a0e001	! t0_kref+0x4724:   	subcc	%g3, 1, %g3
	.word	0x89b10724	! t0_kref+0x4728:   	fmuld8ulx16	%f4, %f4, %f4
	.word	0x89a00124	! t0_kref+0x472c:   	fabss	%f4, %f4
	.word	0x89a01924	! t0_kref+0x4730:   	fstod	%f4, %f4
	.word	0x89a108a4	! t0_kref+0x4734:   	fsubs	%f4, %f4, %f4
	.word	0x91b000a0	! t0_kref+0x4738:   	edge16n	%g0, %g0, %o0
	.word	0x89a000a4	! t0_kref+0x473c:   	fnegs	%f4, %f4
	.word	0x98700000	! t0_kref+0x4740:   	udiv	%g0, %g0, %o4
	.word	0xd80e8018	! t0_kref+0x4744:   	ldub	[%i2 + %i0], %o4
	.word	0xc920a038	! t0_kref+0x4748:   	st	%f4, [%g2 + 0x38]
	.word	0xda163fe6	! t0_kref+0x474c:   	lduh	[%i0 - 0x1a], %o5
	.word	0x89b00fe0	! t0_kref+0x4750:   	fones	%f4
	.word	0x80f82125	! t0_kref+0x4754:   	sdivcc	%g0, 0x125, %g0
	.word	0x81a90aa4	! t0_kref+0x4758:   	fcmpes	%fcc0, %f4, %f4
	.word	0x89a018c4	! t0_kref+0x475c:   	fdtos	%f4, %f4
	.word	0x97280000	! t0_kref+0x4760:   	sll	%g0, %g0, %o3
	call	SYM(t0_subr0)
	.word	0x991830e7	! t0_kref+0x4768:   	tsubcctv	%g0, -0xf19, %o4
	.word	0x95200000	! t0_kref+0x476c:   	mulscc	%g0, %g0, %o2
	.word	0x9f100000	! t0_kref+0x4770:   	taddcctv	%g0, %g0, %o7
	.word	0x97203715	! t0_kref+0x4774:   	mulscc	%g0, -0x8eb, %o3
	.word	0xafb00200	! t0_kref+0x4778:   	array8	%g0, %g0, %l7
	.word	0x89a01904	! t0_kref+0x477c:   	fitod	%f4, %f4
	.word	0xda48a004	! t0_kref+0x4780:   	ldsb	[%g2 + 4], %o5
	.word	0x95b00000	! t0_kref+0x4784:   	edge8	%g0, %g0, %o2
	.word	0x89b10f84	! t0_kref+0x4788:   	for	%f4, %f4, %f4
	.word	0x98400000	! t0_kref+0x478c:   	addc	%g0, %g0, %o4
	.word	0xc99f5040	! t0_kref+0x4790:   	ldda	[%i5]0x82, %f4
	.word	0x972036ba	! t0_kref+0x4794:   	mulscc	%g0, -0x946, %o3
	.word	0x89b10904	! t0_kref+0x4798:   	faligndata	%f4, %f4, %f4
	.word	0xe83e2000	! t0_kref+0x479c:   	std	%l4, [%i0]
	.word	0xc028a007	! t0_kref+0x47a0:   	clrb	[%g2 + 7]
	.word	0x9a300000	! t0_kref+0x47a4:   	orn	%g0, %g0, %o5
	.word	0x98c00000	! t0_kref+0x47a8:   	addccc	%g0, %g0, %o4
	.word	0xc02e8018	! t0_kref+0x47ac:   	clrb	[%i2 + %i0]
	.word	0x9a100000	! t0_kref+0x47b0:   	clr	%o5
	.word	0x89a108a4	! t0_kref+0x47b4:   	fsubs	%f4, %f4, %f4
	.word	0xae100000	! t0_kref+0x47b8:   	clr	%l7
	.word	0xd656001b	! t0_kref+0x47bc:   	ldsh	[%i0 + %i3], %o3
	.word	0x90b83ce2	! t0_kref+0x47c0:   	xnorcc	%g0, -0x31e, %o0
	.word	0x93b00200	! t0_kref+0x47c4:   	array8	%g0, %g0, %o1
	.word	0x89a00144	! t0_kref+0x47c8:   	fabsd	%f4, %f4
	.word	0xaec00000	! t0_kref+0x47cc:   	addccc	%g0, %g0, %l7
	.word	0x89a108c4	! t0_kref+0x47d0:   	fsubd	%f4, %f4, %f4
	.word	0x9a002474	! t0_kref+0x47d4:   	add	%g0, 0x474, %o5
	.word	0x89aa8044	! t0_kref+0x47d8:   	fmovdue	%fcc0, %f4, %f4
	.word	0x80d827da	! t0_kref+0x47dc:   	smulcc	%g0, 0x7da, %g0
	.word	0xd84e8019	! t0_kref+0x47e0:   	ldsb	[%i2 + %i1], %o4
	.word	0x90f83a85	! t0_kref+0x47e4:   	sdivcc	%g0, -0x57b, %o0
	.word	0x9fc00004	! t0_kref+0x47e8:   	call	%g0 + %g4
	.word	0x93b00140	! t0_kref+0x47ec:   	edge32l	%g0, %g0, %o1
	.word	0xde56c018	! t0_kref+0x47f0:   	ldsh	[%i3 + %i0], %o7
	.word	0x89a109c4	! t0_kref+0x47f4:   	fdivd	%f4, %f4, %f4
	.word	0x89b10f44	! t0_kref+0x47f8:   	fornot1	%f4, %f4, %f4
	.word	0x89a10944	! t0_kref+0x47fc:   	fmuld	%f4, %f4, %f4
	.word	0x89b10ac4	! t0_kref+0x4800:   	fpsub32	%f4, %f4, %f4
	call	SYM(t0_subr0)
	.word	0x94180000	! t0_kref+0x4808:   	xor	%g0, %g0, %o2
	.word	0xc028a01e	! t0_kref+0x480c:   	clrb	[%g2 + 0x1e]
	.word	0x93b10504	! t0_kref+0x4810:   	fcmpgt16	%f4, %f4, %o1
	.word	0xde0e6012	! t0_kref+0x4814:   	ldub	[%i1 + 0x12], %o7
	.word	0x89a108a4	! t0_kref+0x4818:   	fsubs	%f4, %f4, %f4
	.word	0x89b00fe0	! t0_kref+0x481c:   	fones	%f4
	.word	0x89a108c4	! t0_kref+0x4820:   	fsubd	%f4, %f4, %f4
	.word	0x962820d9	! t0_kref+0x4824:   	andn	%g0, 0xd9, %o3
	.word	0xae1026a8	! t0_kref+0x4828:   	mov	0x6a8, %l7
	.word	0x9a603821	! t0_kref+0x482c:   	subc	%g0, -0x7df, %o5
	.word	0x9a182898	! t0_kref+0x4830:   	xor	%g0, 0x898, %o5
	.word	0x91300000	! t0_kref+0x4834:   	srl	%g0, %g0, %o0
	.word	0x81d80004	! t0_kref+0x4838:   	flush	%g0 + %g4
	.word	0x89a000a4	! t0_kref+0x483c:   	fnegs	%f4, %f4
	.word	0x32480003	! t0_kref+0x4840:   	bne,a,pt	%icc, _kref+0x484c
	.word	0x89a10944	! t0_kref+0x4844:   	fmuld	%f4, %f4, %f4
	.word	0x89a10924	! t0_kref+0x4848:   	fmuls	%f4, %f4, %f4
	.word	0xc0f81018	! t0_kref+0x484c:   	swapa	[%g0 + %i0]0x80, %g0
	.word	0x94f80000	! t0_kref+0x4850:   	sdivcc	%g0, %g0, %o2
	.word	0xc91e2008	! t0_kref+0x4854:   	ldd	[%i0 + 8], %f4
	.word	0x80f83c64	! t0_kref+0x4858:   	sdivcc	%g0, -0x39c, %g0
	.word	0xd04e7fe5	! t0_kref+0x485c:   	ldsb	[%i1 - 0x1b], %o0
	.word	0x89a00544	! t0_kref+0x4860:   	fsqrtd	%f4, %f4
	.word	0xc920a03c	! t0_kref+0x4864:   	st	%f4, [%g2 + 0x3c]
	.word	0x89b10e24	! t0_kref+0x4868:   	fands	%f4, %f4, %f4
	.word	0x89a00124	! t0_kref+0x486c:   	fabss	%f4, %f4
	.word	0x9a980000	! t0_kref+0x4870:   	xorcc	%g0, %g0, %o5
	.word	0x89a00524	! t0_kref+0x4874:   	fsqrts	%f4, %f4
	.word	0x28800008	! t0_kref+0x4878:   	bleu,a	_kref+0x4898
	.word	0x89b00764	! t0_kref+0x487c:   	fpack16	%f4, %f4
	.word	0xc020a00c	! t0_kref+0x4880:   	clr	[%g2 + 0xc]
	.word	0x90702925	! t0_kref+0x4884:   	udiv	%g0, 0x925, %o0
	.word	0xc920a030	! t0_kref+0x4888:   	st	%f4, [%g2 + 0x30]
	.word	0x2a480005	! t0_kref+0x488c:   	bcs,a,pt	%icc, _kref+0x48a0
	.word	0x90500000	! t0_kref+0x4890:   	umul	%g0, %g0, %o0
	call	SYM(t0_subr1)
	.word	0x81200000	! t0_kref+0x4898:   	mulscc	%g0, %g0, %g0
	.word	0xc920a030	! t0_kref+0x489c:   	st	%f4, [%g2 + 0x30]
	.word	0xc0262018	! t0_kref+0x48a0:   	clr	[%i0 + 0x18]
	.word	0x89a00524	! t0_kref+0x48a4:   	fsqrts	%f4, %f4
	.word	0xc030a02a	! t0_kref+0x48a8:   	clrh	[%g2 + 0x2a]
	.word	0xc030a018	! t0_kref+0x48ac:   	clrh	[%g2 + 0x18]
	.word	0xaeb80000	! t0_kref+0x48b0:   	xnorcc	%g0, %g0, %l7
	.word	0x89a108c4	! t0_kref+0x48b4:   	fsubd	%f4, %f4, %f4
	.word	0x81a90a44	! t0_kref+0x48b8:   	fcmpd	%fcc0, %f4, %f4
	.word	0x89b10964	! t0_kref+0x48bc:   	fpmerge	%f4, %f4, %f4
	.word	0xc020a010	! t0_kref+0x48c0:   	clr	[%g2 + 0x10]
	.word	0xc0280018	! t0_kref+0x48c4:   	clrb	[%g0 + %i0]
	.word	0xde4e001a	! t0_kref+0x48c8:   	ldsb	[%i0 + %i2], %o7
	.word	0x81a90ac4	! t0_kref+0x48cc:   	fcmped	%fcc0, %f4, %f4
	.word	0x89a00124	! t0_kref+0x48d0:   	fabss	%f4, %f4
	.word	0x81a90aa4	! t0_kref+0x48d4:   	fcmpes	%fcc0, %f4, %f4
	.word	0xaf400000	! t0_kref+0x48d8:   	mov	%y, %l7
	.word	0x86102005	! t0_kref+0x48dc:   	mov	0x5, %g3
	.word	0x86a0e001	! t0_kref+0x48e0:   	subcc	%g3, 1, %g3
	.word	0x2280000a	! t0_kref+0x48e4:   	be,a	_kref+0x490c
	.word	0x89a10844	! t0_kref+0x48e8:   	faddd	%f4, %f4, %f4
	.word	0x89a00044	! t0_kref+0x48ec:   	fmovd	%f4, %f4
	.word	0x89a108a4	! t0_kref+0x48f0:   	fsubs	%f4, %f4, %f4
	.word	0xc030a02c	! t0_kref+0x48f4:   	clrh	[%g2 + 0x2c]
	.word	0xc020a02c	! t0_kref+0x48f8:   	clr	[%g2 + 0x2c]
	.word	0x89b00fc0	! t0_kref+0x48fc:   	fone	%f4
	.word	0x89b10ee4	! t0_kref+0x4900:   	fornot2s	%f4, %f4, %f4
	.word	0xe83e3fe0	! t0_kref+0x4904:   	std	%l4, [%i0 - 0x20]
	.word	0x89a00044	! t0_kref+0x4908:   	fmovd	%f4, %f4
	.word	0x9fc00004	! t0_kref+0x490c:   	call	%g0 + %g4
	.word	0x98000000	! t0_kref+0x4910:   	add	%g0, %g0, %o4
	call	SYM(t0_subr3)
	.word	0xc008a03c	! t0_kref+0x4918:   	ldub	[%g2 + 0x3c], %g0
	.word	0x9a0024b5	! t0_kref+0x491c:   	add	%g0, 0x4b5, %o5
	.word	0xc0266018	! t0_kref+0x4920:   	clr	[%i1 + 0x18]
	.word	0x89a10844	! t0_kref+0x4924:   	faddd	%f4, %f4, %f4
	.word	0xc9066014	! t0_kref+0x4928:   	ld	[%i1 + 0x14], %f4
	.word	0x987033b1	! t0_kref+0x492c:   	udiv	%g0, -0xc4f, %o4
	.word	0xc9066018	! t0_kref+0x4930:   	ld	[%i1 + 0x18], %f4
	.word	0x89b00fe0	! t0_kref+0x4934:   	fones	%f4
	.word	0xc807bfe4	! t0_kref+0x4938:   	ld	[%fp - 0x1c], %g4
	.word	0x81a90a24	! t0_kref+0x493c:   	fcmps	%fcc0, %f4, %f4
	.word	0xc920a02c	! t0_kref+0x4940:   	st	%f4, [%g2 + 0x2c]
	.word	0xe5f65000	! t0_kref+0x4944:   	casxa	[%i1]0x80, %g0, %l2
	.word	0xc91fbc28	! t0_kref+0x4948:   	ldd	[%fp - 0x3d8], %f4
	.word	0x90d83170	! t0_kref+0x494c:   	smulcc	%g0, -0xe90, %o0
	.word	0x89a10944	! t0_kref+0x4950:   	fmuld	%f4, %f4, %f4
	.word	0x9fc00004	! t0_kref+0x4954:   	call	%g0 + %g4
	.word	0x89b10d04	! t0_kref+0x4958:   	fandnot1	%f4, %f4, %f4
	.word	0x9e500000	! t0_kref+0x495c:   	umul	%g0, %g0, %o7
	.word	0xd64e0000	! t0_kref+0x4960:   	ldsb	[%i0], %o3
	.word	0x89a10824	! t0_kref+0x4964:   	fadds	%f4, %f4, %f4
	.word	0x81a90ac4	! t0_kref+0x4968:   	fcmped	%fcc0, %f4, %f4
	.word	0x81a90a44	! t0_kref+0x496c:   	fcmpd	%fcc0, %f4, %f4
	.word	0x89a00544	! t0_kref+0x4970:   	fsqrtd	%f4, %f4
	.word	0x9a400000	! t0_kref+0x4974:   	addc	%g0, %g0, %o5
	.word	0x89a00524	! t0_kref+0x4978:   	fsqrts	%f4, %f4
	.word	0xee50a028	! t0_kref+0x497c:   	ldsh	[%g2 + 0x28], %l7
	.word	0xc0262018	! t0_kref+0x4980:   	clr	[%i0 + 0x18]
	.word	0xe01e3ff8	! t0_kref+0x4984:   	ldd	[%i0 - 8], %l0
	.word	0x89a109a4	! t0_kref+0x4988:   	fdivs	%f4, %f4, %f4
	.word	0x89a109c4	! t0_kref+0x498c:   	fdivd	%f4, %f4, %f4
	.word	0xe41f4018	! t0_kref+0x4990:   	ldd	[%i5 + %i0], %l2
	.word	0x9de3bfa0	! t0_kref+0x4994:   	save	%sp, -0x60, %sp
	.word	0xafee0019	! t0_kref+0x4998:   	restore	%i0, %i1, %l7
	.word	0x81a90ac4	! t0_kref+0x499c:   	fcmped	%fcc0, %f4, %f4
	.word	0x81dc67c8	! t0_kref+0x49a0:   	flush	%l1 + 0x7c8
	.word	0xd03e6018	! t0_kref+0x49a4:   	std	%o0, [%i1 + 0x18]
	.word	0xc9865000	! t0_kref+0x49a8:   	lda	[%i1]0x80, %f4
	.word	0x9af032c8	! t0_kref+0x49ac:   	udivcc	%g0, -0xd38, %o5
	.word	0x97b10544	! t0_kref+0x49b0:   	fcmpeq16	%f4, %f4, %o3
	.word	0xd678a024	! t0_kref+0x49b4:   	swap	[%g2 + 0x24], %o3
	.word	0x89a00124	! t0_kref+0x49b8:   	fabss	%f4, %f4
	.word	0x99b00200	! t0_kref+0x49bc:   	array8	%g0, %g0, %o4
	.word	0xd800a010	! t0_kref+0x49c0:   	ld	[%g2 + 0x10], %o4
	.word	0x9b302014	! t0_kref+0x49c4:   	srl	%g0, 0x14, %o5
	.word	0x89a108c4	! t0_kref+0x49c8:   	fsubd	%f4, %f4, %f4
	.word	0xc028a007	! t0_kref+0x49cc:   	clrb	[%g2 + 7]
	.word	0x89b00fe0	! t0_kref+0x49d0:   	fones	%f4
	.word	0xe03e401d	! t0_kref+0x49d4:   	std	%l0, [%i1 + %i5]
	.word	0x89a00044	! t0_kref+0x49d8:   	fmovd	%f4, %f4
	.word	0xde06001c	! t0_kref+0x49dc:   	ld	[%i0 + %i4], %o7
	.word	0x9b102358	! t0_kref+0x49e0:   	taddcctv	%g0, 0x358, %o5
	.word	0x9a180000	! t0_kref+0x49e4:   	xor	%g0, %g0, %o5
	.word	0x92980000	! t0_kref+0x49e8:   	xorcc	%g0, %g0, %o1
	.word	0xde164000	! t0_kref+0x49ec:   	lduh	[%i1], %o7
	.word	0x89a109a4	! t0_kref+0x49f0:   	fdivs	%f4, %f4, %f4
	.word	0x81a90aa4	! t0_kref+0x49f4:   	fcmpes	%fcc0, %f4, %f4
	.word	0x90300000	! t0_kref+0x49f8:   	orn	%g0, %g0, %o0
	.word	0x80980000	! t0_kref+0x49fc:   	xorcc	%g0, %g0, %g0
	.word	0x89b106a4	! t0_kref+0x4a00:   	fmul8x16al	%f4, %f4, %f4
	.word	0x90980000	! t0_kref+0x4a04:   	xorcc	%g0, %g0, %o0
	.word	0x89a01a44	! t0_kref+0x4a08:   	fdtoi	%f4, %f4
	.word	0x89b10ca4	! t0_kref+0x4a0c:   	fandnot2s	%f4, %f4, %f4
	.word	0xc030a006	! t0_kref+0x4a10:   	clrh	[%g2 + 6]
	.word	0x81dcc011	! t0_kref+0x4a14:   	flush	%l3 + %l1
	.word	0x3a800006	! t0_kref+0x4a18:   	bcc,a	_kref+0x4a30
	.word	0x89a10944	! t0_kref+0x4a1c:   	fmuld	%f4, %f4, %f4
	.word	0x89a00524	! t0_kref+0x4a20:   	fsqrts	%f4, %f4
	.word	0xda40a00c	! t0_kref+0x4a24:   	ldsw	[%g2 + 0xc], %o5
	.word	0xc7ee1000	! t0_kref+0x4a28:   	prefetcha	%i0, 3
	.word	0x89a00524	! t0_kref+0x4a2c:   	fsqrts	%f4, %f4
	.word	0x89b10624	! t0_kref+0x4a30:   	fmul8x16	%f4, %f4, %f4
	.word	0xc900a028	! t0_kref+0x4a34:   	ld	[%g2 + 0x28], %f4
	.word	0x89a00544	! t0_kref+0x4a38:   	fsqrtd	%f4, %f4
	.word	0x89a10944	! t0_kref+0x4a3c:   	fmuld	%f4, %f4, %f4
	.word	0xede61000	! t0_kref+0x4a40:   	casa	[%i0]0x80, %g0, %l6
	.word	0xd8ff1019	! t0_kref+0x4a44:   	swapa	[%i4 + %i1]0x80, %o4
	.word	0xc900a018	! t0_kref+0x4a48:   	ld	[%g2 + 0x18], %f4
	.word	0x3e800002	! t0_kref+0x4a4c:   	bvc,a	_kref+0x4a54
	.word	0xd6562010	! t0_kref+0x4a50:   	ldsh	[%i0 + 0x10], %o3
	.word	0xae20255f	! t0_kref+0x4a54:   	sub	%g0, 0x55f, %l7
	.word	0xd810a006	! t0_kref+0x4a58:   	lduh	[%g2 + 6], %o4
	.word	0x30800001	! t0_kref+0x4a5c:   	ba,a	_kref+0x4a60
	.word	0xd0063fec	! t0_kref+0x4a60:   	ld	[%i0 - 0x14], %o0
	.word	0x89a00524	! t0_kref+0x4a64:   	fsqrts	%f4, %f4
	.word	0x81a90aa4	! t0_kref+0x4a68:   	fcmpes	%fcc0, %f4, %f4
	.word	0x89a00544	! t0_kref+0x4a6c:   	fsqrtd	%f4, %f4
	.word	0x89a00524	! t0_kref+0x4a70:   	fsqrts	%f4, %f4
	.word	0x89a00524	! t0_kref+0x4a74:   	fsqrts	%f4, %f4
	.word	0x38800007	! t0_kref+0x4a78:   	bgu,a	_kref+0x4a94
	.word	0x94002c68	! t0_kref+0x4a7c:   	add	%g0, 0xc68, %o2
	.word	0xc020a038	! t0_kref+0x4a80:   	clr	[%g2 + 0x38]
	.word	0xd4564000	! t0_kref+0x4a84:   	ldsh	[%i1], %o2
	.word	0x89b10c44	! t0_kref+0x4a88:   	fnor	%f4, %f4, %f4
	.word	0x30800002	! t0_kref+0x4a8c:   	ba,a	_kref+0x4a94
	.word	0x89a018c4	! t0_kref+0x4a90:   	fdtos	%f4, %f4
	.word	0xd6163fe8	! t0_kref+0x4a94:   	lduh	[%i0 - 0x18], %o3
	.word	0x001fffff	! t0_kref+0x4a98:   	illtrap	0x1fffff
	.word	0x81a90a44	! t0_kref+0x4a9c:   	fcmpd	%fcc0, %f4, %f4
	.word	0x89a10824	! t0_kref+0x4aa0:   	fadds	%f4, %f4, %f4
	.word	0xc030a000	! t0_kref+0x4aa4:   	clrh	[%g2]
	.word	0x38480005	! t0_kref+0x4aa8:   	bgu,a,pt	%icc, _kref+0x4abc
	.word	0x90c00000	! t0_kref+0x4aac:   	addccc	%g0, %g0, %o0
	.word	0xd206201c	! t0_kref+0x4ab0:   	ld	[%i0 + 0x1c], %o1
	.word	0x89a01924	! t0_kref+0x4ab4:   	fstod	%f4, %f4
	.word	0x89b10964	! t0_kref+0x4ab8:   	fpmerge	%f4, %f4, %f4
	.word	0x90400000	! t0_kref+0x4abc:   	addc	%g0, %g0, %o0
	.word	0x81a90a24	! t0_kref+0x4ac0:   	fcmps	%fcc0, %f4, %f4
	.word	0xc920a02c	! t0_kref+0x4ac4:   	st	%f4, [%g2 + 0x2c]
	.word	0x22800002	! t0_kref+0x4ac8:   	be,a	_kref+0x4ad0
	.word	0x90103104	! t0_kref+0x4acc:   	mov	0xfffff104, %o0
	.word	0x89b10a24	! t0_kref+0x4ad0:   	fpadd16s	%f4, %f4, %f4
	.word	0x89a01924	! t0_kref+0x4ad4:   	fstod	%f4, %f4
	.word	0xd6563fe8	! t0_kref+0x4ad8:   	ldsh	[%i0 - 0x18], %o3
	.word	0x81a90a24	! t0_kref+0x4adc:   	fcmps	%fcc0, %f4, %f4
	.word	0x89a00044	! t0_kref+0x4ae0:   	fmovd	%f4, %f4
	.word	0x89a01924	! t0_kref+0x4ae4:   	fstod	%f4, %f4
	.word	0xee50a00e	! t0_kref+0x4ae8:   	ldsh	[%g2 + 0xe], %l7
	.word	0xc900a004	! t0_kref+0x4aec:   	ld	[%g2 + 4], %f4
	.word	0x9ae02819	! t0_kref+0x4af0:   	subccc	%g0, 0x819, %o5
	.word	0xc91fbe60	! t0_kref+0x4af4:   	ldd	[%fp - 0x1a0], %f4
	.word	0x9af831fb	! t0_kref+0x4af8:   	sdivcc	%g0, -0xe05, %o5
	.word	0x93b00140	! t0_kref+0x4afc:   	edge32l	%g0, %g0, %o1
	.word	0x981824a5	! t0_kref+0x4b00:   	xor	%g0, 0x4a5, %o4
	.word	0x81580000	! t0_kref+0x4b04:   	flushw
	.word	0x89a10924	! t0_kref+0x4b08:   	fmuls	%f4, %f4, %f4
	.word	0xd4164000	! t0_kref+0x4b0c:   	lduh	[%i1], %o2
	.word	0x9538200b	! t0_kref+0x4b10:   	sra	%g0, 0xb, %o2
	.word	0x81302004	! t0_kref+0x4b14:   	srl	%g0, 0x4, %g0
	.word	0x89a00544	! t0_kref+0x4b18:   	fsqrtd	%f4, %f4
	.word	0x8610201b	! t0_kref+0x4b1c:   	mov	0x1b, %g3
	.word	0x86a0e001	! t0_kref+0x4b20:   	subcc	%g3, 1, %g3
	.word	0x2280000b	! t0_kref+0x4b24:   	be,a	_kref+0x4b50
	.word	0x95300000	! t0_kref+0x4b28:   	srl	%g0, %g0, %o2
	.word	0x89a01924	! t0_kref+0x4b2c:   	fstod	%f4, %f4
	.word	0x94080000	! t0_kref+0x4b30:   	and	%g0, %g0, %o2
	.word	0xd0567fec	! t0_kref+0x4b34:   	ldsh	[%i1 - 0x14], %o0
	.word	0x90402cdb	! t0_kref+0x4b38:   	addc	%g0, 0xcdb, %o0
	.word	0xc920a01c	! t0_kref+0x4b3c:   	st	%f4, [%g2 + 0x1c]
	.word	0x93418000	! t0_kref+0x4b40:   	mov	%fprs, %o1
	.word	0x97b00280	! t0_kref+0x4b44:   	array32	%g0, %g0, %o3
	.word	0x89a000a4	! t0_kref+0x4b48:   	fnegs	%f4, %f4
	.word	0x94500000	! t0_kref+0x4b4c:   	umul	%g0, %g0, %o2
	.word	0x96a83b51	! t0_kref+0x4b50:   	andncc	%g0, -0x4af, %o3
	.word	0x81a90a44	! t0_kref+0x4b54:   	fcmpd	%fcc0, %f4, %f4
	.word	0x89a10d24	! t0_kref+0x4b58:   	fsmuld	%f4, %f4, %f4
	.word	0x89b107c4	! t0_kref+0x4b5c:   	pdist	%f4, %f4, %f4
	.word	0x89a01904	! t0_kref+0x4b60:   	fitod	%f4, %f4
	.word	0xae100000	! t0_kref+0x4b64:   	clr	%l7
	.word	0x2e480005	! t0_kref+0x4b68:   	bvs,a,pt	%icc, _kref+0x4b7c
	.word	0x97b10484	! t0_kref+0x4b6c:   	fcmple32	%f4, %f4, %o3
	.word	0xee066010	! t0_kref+0x4b70:   	ld	[%i1 + 0x10], %l7
	.word	0x3e480002	! t0_kref+0x4b74:   	bvc,a,pt	%icc, _kref+0x4b7c
	.word	0x89a01924	! t0_kref+0x4b78:   	fstod	%f4, %f4
	.word	0xc9000018	! t0_kref+0x4b7c:   	ld	[%g0 + %i0], %f4
	.word	0xc030a018	! t0_kref+0x4b80:   	clrh	[%g2 + 0x18]
	.word	0xd84e0000	! t0_kref+0x4b84:   	ldsb	[%i0], %o4
	.word	0xc920a034	! t0_kref+0x4b88:   	st	%f4, [%g2 + 0x34]
	.word	0xc9a01019	! t0_kref+0x4b8c:   	sta	%f4, [%g0 + %i1]0x80
	.word	0xc93e401d	! t0_kref+0x4b90:   	std	%f4, [%i1 + %i5]
	.word	0x89b10a24	! t0_kref+0x4b94:   	fpadd16s	%f4, %f4, %f4
	.word	0x89a00524	! t0_kref+0x4b98:   	fsqrts	%f4, %f4
	.word	0xc9064000	! t0_kref+0x4b9c:   	ld	[%i1], %f4
	.word	0x98803155	! t0_kref+0x4ba0:   	addcc	%g0, -0xeab, %o4
	.word	0x89a00044	! t0_kref+0x4ba4:   	fmovd	%f4, %f4
	.word	0x89a108a4	! t0_kref+0x4ba8:   	fsubs	%f4, %f4, %f4
	.word	0x89a108a4	! t0_kref+0x4bac:   	fsubs	%f4, %f4, %f4
	.word	0xec1e6010	! t0_kref+0x4bb0:   	ldd	[%i1 + 0x10], %l6
	.word	0x90882a84	! t0_kref+0x4bb4:   	andcc	%g0, 0xa84, %o0
	.word	0xd6462010	! t0_kref+0x4bb8:   	ldsw	[%i0 + 0x10], %o3
	.word	0xe81e7fe0	! t0_kref+0x4bbc:   	ldd	[%i1 - 0x20], %l4
	.word	0x89a00544	! t0_kref+0x4bc0:   	fsqrtd	%f4, %f4
	.word	0x8610201a	! t0_kref+0x4bc4:   	mov	0x1a, %g3
	.word	0x86a0e001	! t0_kref+0x4bc8:   	subcc	%g3, 1, %g3
	.word	0x22800003	! t0_kref+0x4bcc:   	be,a	_kref+0x4bd8
	.word	0x90400000	! t0_kref+0x4bd0:   	addc	%g0, %g0, %o0
	.word	0xc048a000	! t0_kref+0x4bd4:   	ldsb	[%g2], %g0
	.word	0x9e0028c0	! t0_kref+0x4bd8:   	add	%g0, 0x8c0, %o7
	.word	0x38800007	! t0_kref+0x4bdc:   	bgu,a	_kref+0x4bf8
	.word	0x89a10824	! t0_kref+0x4be0:   	fadds	%f4, %f4, %f4
	.word	0x90a80000	! t0_kref+0x4be4:   	andncc	%g0, %g0, %o0
	.word	0x9a6027be	! t0_kref+0x4be8:   	subc	%g0, 0x7be, %o5
	.word	0xde50a032	! t0_kref+0x4bec:   	ldsh	[%g2 + 0x32], %o7
	.word	0x89a10944	! t0_kref+0x4bf0:   	fmuld	%f4, %f4, %f4
	.word	0x9e500000	! t0_kref+0x4bf4:   	umul	%g0, %g0, %o7
	.word	0x9bb00160	! t0_kref+0x4bf8:   	edge32ln	%g0, %g0, %o5
	.word	0xc028a00a	! t0_kref+0x4bfc:   	clrb	[%g2 + 0xa]
	call	SYM(t0_subr1)
	.word	0xc91e4000	! t0_kref+0x4c04:   	ldd	[%i1], %f4
	.word	0xaea838ee	! t0_kref+0x4c08:   	andncc	%g0, -0x712, %l7
	.word	0xe8380019	! t0_kref+0x4c0c:   	std	%l4, [%g0 + %i1]
	.word	0x26480004	! t0_kref+0x4c10:   	bl,a,pt	%icc, _kref+0x4c20
	.word	0x89a01a44	! t0_kref+0x4c14:   	fdtoi	%f4, %f4
	.word	0xd800a008	! t0_kref+0x4c18:   	ld	[%g2 + 8], %o4
	.word	0x89a01884	! t0_kref+0x4c1c:   	fitos	%f4, %f4
	.word	0xc920a024	! t0_kref+0x4c20:   	st	%f4, [%g2 + 0x24]
	.word	0xae300000	! t0_kref+0x4c24:   	orn	%g0, %g0, %l7
	.word	0x89a108c4	! t0_kref+0x4c28:   	fsubd	%f4, %f4, %f4
	.word	0x9ab80000	! t0_kref+0x4c2c:   	xnorcc	%g0, %g0, %o5
	.word	0xc036001b	! t0_kref+0x4c30:   	clrh	[%i0 + %i3]
	.word	0x94880000	! t0_kref+0x4c34:   	andcc	%g0, %g0, %o2
	.word	0x9a300000	! t0_kref+0x4c38:   	orn	%g0, %g0, %o5
	.word	0x816421be	! t0_kref+0x4c3c:   	movn	%icc, 0x1be, %g0
	.word	0x81a90a44	! t0_kref+0x4c40:   	fcmpd	%fcc0, %f4, %f4
	.word	0x80900000	! t0_kref+0x4c44:   	tst	%g0
	.word	0x91b00160	! t0_kref+0x4c48:   	edge32ln	%g0, %g0, %o0
	.word	0x89a01a24	! t0_kref+0x4c4c:   	fstoi	%f4, %f4
	.word	0xec1f4019	! t0_kref+0x4c50:   	ldd	[%i5 + %i1], %l6
	.word	0x20800005	! t0_kref+0x4c54:   	bn,a	_kref+0x4c68
	.word	0x89a10844	! t0_kref+0x4c58:   	faddd	%f4, %f4, %f4
	.word	0xc020a000	! t0_kref+0x4c5c:   	clr	[%g2]
	.word	0x8143c000	! t0_kref+0x4c60:   	stbar
	.word	0x89b10ac4	! t0_kref+0x4c64:   	fpsub32	%f4, %f4, %f4
	.word	0x3e800003	! t0_kref+0x4c68:   	bvc,a	_kref+0x4c74
	.word	0x89a108a4	! t0_kref+0x4c6c:   	fsubs	%f4, %f4, %f4
	.word	0x89a10824	! t0_kref+0x4c70:   	fadds	%f4, %f4, %f4
	.word	0x3a800005	! t0_kref+0x4c74:   	bcc,a	_kref+0x4c88
	.word	0x90e00000	! t0_kref+0x4c78:   	subccc	%g0, %g0, %o0
	.word	0xc0300019	! t0_kref+0x4c7c:   	clrh	[%g0 + %i1]
	.word	0xe5183638	! t0_kref+0x4c80:   	ldd	[%g0 - 0x9c8], %f18
	.word	0x81b10484	! t0_kref+0x4c84:   	fcmple32	%f4, %f4, %g0
	.word	0x9330201e	! t0_kref+0x4c88:   	srl	%g0, 0x1e, %o1
	.word	0x89a10944	! t0_kref+0x4c8c:   	fmuld	%f4, %f4, %f4
	.word	0xde86101c	! t0_kref+0x4c90:   	lda	[%i0 + %i4]0x80, %o7
	.word	0x89a00544	! t0_kref+0x4c94:   	fsqrtd	%f4, %f4
	.word	0xee00a03c	! t0_kref+0x4c98:   	ld	[%g2 + 0x3c], %l7
	.word	0x81b00000	! t0_kref+0x4c9c:   	edge8	%g0, %g0, %g0
	.word	0x81dafac1	! t0_kref+0x4ca0:   	flush	%o3 - 0x53f
	.word	0x89a108a4	! t0_kref+0x4ca4:   	fsubs	%f4, %f4, %f4
	.word	0x2e800005	! t0_kref+0x4ca8:   	bvs,a	_kref+0x4cbc
	.word	0xe83e401d	! t0_kref+0x4cac:   	std	%l4, [%i1 + %i5]
	.word	0x89b00fe0	! t0_kref+0x4cb0:   	fones	%f4
	.word	0x89a00124	! t0_kref+0x4cb4:   	fabss	%f4, %f4
	.word	0x89a018c4	! t0_kref+0x4cb8:   	fdtos	%f4, %f4
	.word	0x968022ff	! t0_kref+0x4cbc:   	addcc	%g0, 0x2ff, %o3
	.word	0xae80383b	! t0_kref+0x4cc0:   	addcc	%g0, -0x7c5, %l7
	.word	0xd01f4005	! t0_kref+0x4cc4:   	ldd	[%i5 + %g5], %o0
	.word	0xae380000	! t0_kref+0x4cc8:   	not	%g0, %l7
	.word	0x89b00fe0	! t0_kref+0x4ccc:   	fones	%f4
	.word	0x9a102cac	! t0_kref+0x4cd0:   	mov	0xcac, %o5
	.word	0x81203071	! t0_kref+0x4cd4:   	mulscc	%g0, -0xf8f, %g0
	.word	0xae080000	! t0_kref+0x4cd8:   	and	%g0, %g0, %l7
	.word	0x943025c6	! t0_kref+0x4cdc:   	orn	%g0, 0x5c6, %o2
	.word	0xc900a008	! t0_kref+0x4ce0:   	ld	[%g2 + 8], %f4
	.word	0x9b100000	! t0_kref+0x4ce4:   	taddcctv	%g0, %g0, %o5
	.word	0x3a800005	! t0_kref+0x4ce8:   	bcc,a	_kref+0x4cfc
	.word	0x93b10484	! t0_kref+0x4cec:   	fcmple32	%f4, %f4, %o1
	call	SYM(t0_subr0)
	.word	0xc920a02c	! t0_kref+0x4cf4:   	st	%f4, [%g2 + 0x2c]
	.word	0xe07e3ff0	! t0_kref+0x4cf8:   	swap	[%i0 - 0x10], %l0
	.word	0x9e502146	! t0_kref+0x4cfc:   	umul	%g0, 0x146, %o7
	.word	0xd24e3ff3	! t0_kref+0x4d00:   	ldsb	[%i0 - 0xd], %o1
	.word	0x9e600000	! t0_kref+0x4d04:   	subc	%g0, %g0, %o7
	.word	0x89a01a24	! t0_kref+0x4d08:   	fstoi	%f4, %f4
	.word	0x89a10824	! t0_kref+0x4d0c:   	fadds	%f4, %f4, %f4
	.word	0x807030e1	! t0_kref+0x4d10:   	udiv	%g0, -0xf1f, %g0
	.word	0x89a01924	! t0_kref+0x4d14:   	fstod	%f4, %f4
	.word	0x81a90a24	! t0_kref+0x4d18:   	fcmps	%fcc0, %f4, %f4
	.word	0xc030a02a	! t0_kref+0x4d1c:   	clrh	[%g2 + 0x2a]
	.word	0x89b00fe0	! t0_kref+0x4d20:   	fones	%f4
	.word	0x89a10844	! t0_kref+0x4d24:   	faddd	%f4, %f4, %f4
	.word	0x89b10de4	! t0_kref+0x4d28:   	fnands	%f4, %f4, %f4
	.word	0x89a00124	! t0_kref+0x4d2c:   	fabss	%f4, %f4
	.word	0xc906401c	! t0_kref+0x4d30:   	ld	[%i1 + %i4], %f4
	.word	0x86102014	! t0_kref+0x4d34:   	mov	0x14, %g3
	.word	0x86a0e001	! t0_kref+0x4d38:   	subcc	%g3, 1, %g3
	.word	0x2280000b	! t0_kref+0x4d3c:   	be,a	_kref+0x4d68
	.word	0xd83e7fe0	! t0_kref+0x4d40:   	std	%o4, [%i1 - 0x20]
	.word	0x89a10924	! t0_kref+0x4d44:   	fmuls	%f4, %f4, %f4
	.word	0x91b00140	! t0_kref+0x4d48:   	edge32l	%g0, %g0, %o0
	.word	0x9af83732	! t0_kref+0x4d4c:   	sdivcc	%g0, -0x8ce, %o5
	.word	0x89a10924	! t0_kref+0x4d50:   	fmuls	%f4, %f4, %f4
	.word	0x98a82c9d	! t0_kref+0x4d54:   	andncc	%g0, 0xc9d, %o4
	.word	0x965033f6	! t0_kref+0x4d58:   	umul	%g0, -0xc0a, %o3
	.word	0xafb00000	! t0_kref+0x4d5c:   	edge8	%g0, %g0, %l7
	.word	0x9ab80000	! t0_kref+0x4d60:   	xnorcc	%g0, %g0, %o5
	.word	0x94102ea4	! t0_kref+0x4d64:   	mov	0xea4, %o2
	.word	0x30800005	! t0_kref+0x4d68:   	ba,a	_kref+0x4d7c
	.word	0xc91fbd38	! t0_kref+0x4d6c:   	ldd	[%fp - 0x2c8], %f4
	.word	0x91282008	! t0_kref+0x4d70:   	sll	%g0, 0x8, %o0
	.word	0x81defe50	! t0_kref+0x4d74:   	flush	%i3 - 0x1b0
	.word	0xd0180018	! t0_kref+0x4d78:   	ldd	[%g0 + %i0], %o0
	.word	0x89a00544	! t0_kref+0x4d7c:   	fsqrtd	%f4, %f4
	.word	0x89a00124	! t0_kref+0x4d80:   	fabss	%f4, %f4
	.word	0x80e02aca	! t0_kref+0x4d84:   	subccc	%g0, 0xaca, %g0
	.word	0x81a90a44	! t0_kref+0x4d88:   	fcmpd	%fcc0, %f4, %f4
	.word	0x90200000	! t0_kref+0x4d8c:   	neg	%g0, %o0
	.word	0x90400000	! t0_kref+0x4d90:   	addc	%g0, %g0, %o0
	.word	0x89b10ac4	! t0_kref+0x4d94:   	fpsub32	%f4, %f4, %f4
	.word	0x89b10984	! t0_kref+0x4d98:   	bshuffle	%f4, %f4, %f4
	.word	0xde000019	! t0_kref+0x4d9c:   	ld	[%g0 + %i1], %o7
	.word	0x89a10924	! t0_kref+0x4da0:   	fmuls	%f4, %f4, %f4
	.word	0x89a018c4	! t0_kref+0x4da4:   	fdtos	%f4, %f4
	.word	0xc0266010	! t0_kref+0x4da8:   	clr	[%i1 + 0x10]
	.word	0xc0363ff8	! t0_kref+0x4dac:   	clrh	[%i0 - 8]
	.word	0x81a90a24	! t0_kref+0x4db0:   	fcmps	%fcc0, %f4, %f4
	.word	0x94700000	! t0_kref+0x4db4:   	udiv	%g0, %g0, %o2
	.word	0x89b00f24	! t0_kref+0x4db8:   	fsrc2s	%f4, %f4
	.word	0x3a800003	! t0_kref+0x4dbc:   	bcc,a	_kref+0x4dc8
	.word	0x9a980000	! t0_kref+0x4dc0:   	xorcc	%g0, %g0, %o5
	.word	0x89b10ea0	! t0_kref+0x4dc4:   	fsrc1s	%f4, %f4
	.word	0xd01e0000	! t0_kref+0x4dc8:   	ldd	[%i0], %o0
	.word	0xd08e9040	! t0_kref+0x4dcc:   	lduba	[%i2]0x82, %o0
	.word	0xc900a028	! t0_kref+0x4dd0:   	ld	[%g2 + 0x28], %f4
	.word	0xc030a014	! t0_kref+0x4dd4:   	clrh	[%g2 + 0x14]
	.word	0xc028a026	! t0_kref+0x4dd8:   	clrb	[%g2 + 0x26]
	.word	0xc920a02c	! t0_kref+0x4ddc:   	st	%f4, [%g2 + 0x2c]
	.word	0x92802ed3	! t0_kref+0x4de0:   	addcc	%g0, 0xed3, %o1
	.word	0xc030a004	! t0_kref+0x4de4:   	clrh	[%g2 + 4]
	.word	0x92e00000	! t0_kref+0x4de8:   	subccc	%g0, %g0, %o1
	.word	0x94d8320b	! t0_kref+0x4dec:   	smulcc	%g0, -0xdf5, %o2
	.word	0x80900000	! t0_kref+0x4df0:   	tst	%g0
	.word	0x81100000	! t0_kref+0x4df4:   	taddcctv	%g0, %g0, %g0
	.word	0x89b00fe0	! t0_kref+0x4df8:   	fones	%f4
	.word	0x2e480004	! t0_kref+0x4dfc:   	bvs,a,pt	%icc, _kref+0x4e0c
	.word	0x94103a83	! t0_kref+0x4e00:   	mov	0xfffffa83, %o2
	.word	0x89b107c4	! t0_kref+0x4e04:   	pdist	%f4, %f4, %f4
	.word	0xc91fbd78	! t0_kref+0x4e08:   	ldd	[%fp - 0x288], %f4
	.word	0x97382016	! t0_kref+0x4e0c:   	sra	%g0, 0x16, %o3
	.word	0x89a108c4	! t0_kref+0x4e10:   	fsubd	%f4, %f4, %f4
	call	SYM(t0_subr2)
	.word	0x89a00124	! t0_kref+0x4e18:   	fabss	%f4, %f4
	.word	0x90e00000	! t0_kref+0x4e1c:   	subccc	%g0, %g0, %o0
	call	SYM(_kaos_done)
	.word	0x01000000	! t0_kref+0x4e24:   	nop
	KGLOBAL(t0_ktbl_end)
t0_ktbl_end:
t0_ktbl_page_end:

KTEXT_MODULE(t0_module_subr0, 0x60222000)
.seg "text"
t0_subr0_page_begin:
	.skip 8192
.global _t0_subr0; ENTRY(t0_subr0)
	.word	0xa6844012	! t0_subr0+0x0:   	addcc	%l1, %l2, %l3
	.word	0x81c3e008	! t0_subr0+0x4:   	retl
	.word	0xaa64c014	! t0_subr0+0x8:   	subc	%l3, %l4, %l5
t0_subr0_page_end:

KTEXT_MODULE(t0_module_subr1, 0x3720e000)
.seg "text"
t0_subr1_page_begin:
	.skip 8188
.global _t0_subr1; ENTRY(t0_subr1)
	.word	0x9de3bfa0	! t0_subr1+0x0:   	save	%sp, -0x60, %sp
	.word	0xb29eaa5a	! t0_subr1+0x4:   	xorcc	%i2, 0xa5a, %i1
	.word	0x81c7e008	! t0_subr1+0x8:   	ret
	.word	0xa7ee6001	! t0_subr1+0xc:   	restore	%i1, 1, %l3
t0_subr1_page_end:

KTEXT_MODULE(t0_module_subr2, 0x41a36000)
.seg "text"
t0_subr2_page_begin:
	.skip 8180
.global _t0_subr2; ENTRY(t0_subr2)
	.word	0x9de3bfa0	! t0_subr2+0x0:   	save	%sp, -0x60, %sp
	.word	0xb2066001	! t0_subr2+0x4:   	add	%i1, 1, %i1
	.word	0x81c7e008	! t0_subr2+0x8:   	ret
	.word	0xa3ee6001	! t0_subr2+0xc:   	restore	%i1, 1, %l1
t0_subr2_page_end:

KTEXT_MODULE(t0_module_subr3, 0x41f88000)
.seg "text"
t0_subr3_page_begin:
	.skip 8188
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
!  Total operations: 4880  
!
!  Operation frequencies
!
!  name               exp    obs
!  ldsb              1.01   1.15
!  ldub              1.20   1.29
!  ldsh              1.08   0.94
!  lduh              0.59   0.51
!  ld                1.19   1.09
!  ldd               1.01   1.17
!  swap              0.37   0.39
!  ldstub            0.09   0.10
!  stb               0.51   0.59
!  sth               0.21   0.20
!  st                0.65   0.88
!  std               1.28   1.15
!  add               1.00   0.94
!  addcc             1.20   1.17
!  addx              0.94   0.98
!  addxcc            0.80   0.88
!  taddcc            0.03   0.00
!  taddcctv          0.27   0.31
!  sub               0.51   0.47
!  subcc             0.16   0.27
!  subx              0.64   0.66
!  subxcc            0.91   1.07
!  tsubcc            0.25   0.08
!  tsubcctv          0.12   0.10
!  mulscc            0.73   1.00
!  and               0.50   0.53
!  andcc             0.53   0.45
!  andn              0.06   0.08
!  andncc            1.29   1.62
!  or                1.18   1.25
!  orcc              0.67   0.53
!  orn               0.53   0.64
!  orncc             0.72   0.53
!  xor               1.10   1.02
!  xorcc             0.70   0.82
!  xnor              0.10   0.20
!  xnorcc            0.41   0.39
!  sll               0.91   1.05
!  srl               1.27   1.25
!  sra               0.16   0.14
!  unimp             0.22   0.25
!  umul              1.14   1.19
!  smul              0.15   0.14
!  udiv              0.52   0.72
!  sdiv              0.11   0.08
!  umulcc            0.53   0.59
!  smulcc            0.81   0.76
!  udivcc            0.07   0.08
!  sdivcc            1.29   1.39
!  rdy               1.28   1.35
!  wry               0.20   0.27
!  bicc              3.34   3.22
!  sethi             0.13   0.16
!  jmpl              1.12   1.15
!  call              1.27   1.19
!  ticc              0.00   0.00
!  flush             0.65   1.02
!  save              0.75   0.53
!  restore           1.34   0.00
!  stbar             0.89   0.72
!  ldf               0.76   0.82
!  lddf              0.46   0.33
!  stf               0.23   0.27
!  stdf              0.15   0.08
!  fadds             1.34   1.37
!  fsubs             1.09   1.43
!  fmuls             1.06   1.19
!  fdivs             0.42   0.27
!  faddd             1.33   1.54
!  fsubd             1.32   1.58
!  fmuld             1.07   1.07
!  fdivd             0.44   0.51
!  faddq             0.00   0.00
!  fsubq             0.00   0.00
!  fmulq             0.00   0.00
!  fdivq             0.00   0.00
!  fsmuld            0.34   0.27
!  fdmulq            0.00   0.00
!  fitos             0.23   0.23
!  fitod             0.98   1.11
!  fitoq             0.00   0.00
!  fstoi             0.43   0.47
!  fstod             1.04   1.11
!  fstoq             0.00   0.00
!  fdtoi             0.58   0.68
!  fdtos             0.66   0.49
!  fdtoq             0.00   0.00
!  fqtoi             0.00   0.00
!  fqtos             0.00   0.00
!  fqtod             0.00   0.00
!  fmovs             0.12   0.14
!  fnegs             1.24   1.37
!  fabss             1.24   1.41
!  fsqrts            1.97   1.95
!  fsqrtd            0.78   0.90
!  fsqrtq            0.00   0.00
!  fcmps             0.86   0.80
!  fcmpd             0.79   0.88
!  fcmpq             0.00   0.00
!  fcmpes            0.75   0.86
!  fcmped            0.71   0.57
!  fcmpeq            0.00   0.00
!  fbfcc             0.13   0.04
!  ldfsr             0.05   0.00
!  stfsr             0.04   0.00
!  loop              1.21   0.90
!  offset            0.06   0.08
!  area              0.19   0.18
!  target            0.21   0.33
!  goto              0.09   0.00
!  sigsegv           0.27   0.27
!  sigbus            0.15   0.12
!  imodify           0.00   0.00
!  ldfsr_offset      0.27   0.00
!  fpattern          1.02   1.29
!  lbranch           0.01   0.00
!  shmld             3.43   4.02
!  shmst             4.75   4.80
!  shmpf             0.20   0.18
!  shmswap           0.16   0.16
!  shmblkld          0.86   0.00
!  shmblkst          0.22   0.12
!  shmblkchk         0.03   0.00
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
!  casa              0.08   0.04
!  rdasi             0.11   0.08
!  wrasi             0.18   0.12
!  bpcc              1.02   1.00
!  fbpfcc            0.20   0.18
!  fmovscc           0.20   0.25
!  fmovdcc           0.21   0.25
!  fmovqcc           0.00   0.00
!  movcc             0.20   0.12
!  flushw            0.19   0.31
!  membar            0.15   0.10
!  prefetch          0.21   0.29
!  rdpc              0.09   0.06
!  ldqf              0.00   0.00
!  stqf              0.00   0.00
!  ldfa              0.23   0.18
!  lddfa             0.27   0.43
!  ldqfa             0.00   0.00
!  ldsba             0.09   0.04
!  ldsha             0.04   0.02
!  lduba             0.04   0.06
!  lduha             0.19   0.12
!  lda               0.06   0.04
!  ldda              0.25   0.29
!  ldstuba           0.19   0.23
!  prefetcha         0.82   0.76
!  stfa              0.11   0.12
!  stdfa             0.05   0.06
!  stqfa             0.00   0.00
!  stba              0.11   0.14
!  stha              0.10   0.04
!  sta               0.19   0.10
!  stda              0.16   0.06
!  swapa             0.19   0.23
!  fmovd             0.25   0.31
!  fnegd             0.20   0.08
!  fabsd             0.24   0.33
!  fstox             0.02   0.00
!  fdtox             0.12   0.14
!  fxtos             0.13   0.12
!  fxtod             0.11   0.06
!  lds               0.06   0.06
!  ldsa              0.12   0.10
!  ldx               0.17   0.20
!  ldxa              0.14   0.23
!  nofault           0.20   0.20
!  rdgsr             0.11   0.12
!  wrgsr             0.18   0.12
!  fpadd16           0.13   0.14
!  fpadd16s          0.20   0.16
!  fpadd32           0.00   0.00
!  fpadd32s          0.03   0.02
!  fpsub16           0.00   0.00
!  fpsub16s          0.21   0.16
!  fpsub32           0.20   0.25
!  fpsub32s          0.24   0.29
!  fpack16           0.15   0.27
!  fpack32           0.22   0.23
!  fpackfix          0.18   0.08
!  fexpand           0.07   0.04
!  fpmerge           0.18   0.27
!  fmul8x16          0.23   0.29
!  fmul8x16au        0.18   0.10
!  fmul8x16al        0.10   0.18
!  fmul8sux16        0.24   0.20
!  fmul8ulx16        0.09   0.08
!  fmuld8sux16       0.15   0.14
!  fmuld8ulx16       0.17   0.18
!  alignaddr         0.01   0.00
!  alignaddrl        0.14   0.08
!  faligndata        0.08   0.06
!  fzero             0.22   0.20
!  fzeros            0.13   0.16
!  fone              0.12   0.06
!  fones             0.22   0.33
!  fsrc1             0.10   0.14
!  fsrc1s            0.18   0.25
!  fsrc2             0.13   0.10
!  fsrc2s            0.17   0.10
!  fnot1             0.15   0.02
!  fnot1s            0.03   0.02
!  fnot2             0.01   0.00
!  fnot2s            0.20   0.04
!  for               0.20   0.12
!  fors              0.16   0.16
!  fnor              0.17   0.18
!  fnors             0.04   0.00
!  fand              0.05   0.04
!  fands             0.15   0.20
!  fnand             0.03   0.00
!  fnands            0.09   0.06
!  fxor              0.15   0.06
!  fxors             0.24   0.16
!  fxnor             0.13   0.16
!  fxnors            0.24   0.27
!  fornot1           0.13   0.20
!  fornot1s          0.06   0.10
!  fornot2           0.10   0.04
!  fornot2s          0.07   0.06
!  fandnot1          0.09   0.06
!  fandnot1s         0.23   0.29
!  fandnot2          0.15   0.04
!  fandnot2s         0.12   0.18
!  fcmpgt16          0.25   0.27
!  fcmpgt32          0.16   0.12
!  fcmple16          0.19   0.20
!  fcmple32          0.26   0.29
!  fcmpne16          0.01   0.02
!  fcmpne32          0.06   0.06
!  fcmpeq16          0.12   0.10
!  fcmpeq32          0.25   0.16
!  edge8             0.22   0.23
!  edge8l            0.14   0.10
!  edge16            0.09   0.08
!  edge16l           0.07   0.10
!  edge32            0.17   0.18
!  edge32l           0.23   0.37
!  pdist             0.19   0.31
!  partial_st8       0.05   0.04
!  partial_st16      0.15   0.12
!  partial_st32      0.01   0.02
!  short_st8         0.17   0.12
!  short_st16        0.23   0.29
!  short_ld8         0.01   0.02
!  short_ld16        0.00   0.00
!  blkld             0.14   0.00
!  blkst             0.19   0.00
!  blkld_offset      0.05   0.00
!  blkst_offset      0.12   0.00
!  blk_check         0.20   0.16
!  casxa             0.15   0.25
!  rdccr             0.06   0.06
!  rdfprs            0.13   0.16
!  wrccr             0.08   0.02
!  popc              0.25   0.29
!  wrfprs            0.26   0.27
!  stx               0.07   0.08
!  stxa              0.01   0.00
!  cflush            0.00   0.00
!  array8            0.17   0.27
!  array16           0.13   0.06
!  array32           0.08   0.04
!  edge8n            0.22   0.37
!  edge8ln           0.08   0.20
!  edge16n           0.18   0.25
!  edge16ln          0.05   0.02
!  edge32n           0.01   0.02
!  edge32ln          0.17   0.23
!  bmask             0.06   0.06
!  bshuffle          0.12   0.10
!  siam              0.12   0.04
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
KDATA_MODULE(t0_module_offset_table, 0x5b0aa000)
.seg "data"
t0_offset_table_start:
t0_offset_table_size:	.word	0x00000008
t0_offset_table:
	.word	0x00000000
	.word	0xffffffe0
	.word	0xfffffff0
	.word	0xfffffff8
	.word	0x00000008
	.word	0xffffffe8
	.word	0x00000018
	.word	0x00000010
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

KDATA_MODULE(t0_module_data_in_regs, 0x7d93e000)
.seg "data"
KGLOBAL(t0_data_in_regs)
t0_data_in_regs_start:
t0_data_in_regs:
	.word	0xfe9135f3          ! %f0
	.word	0x9c72e30a          ! %f1
	.word	0x9361202b          ! %f2
	.word	0x9469b1e3          ! %f3
	.word	0x5382f503          ! %f4
	.word	0xc2c0b18c          ! %f5
	.word	0xa260249c          ! %f6
	.word	0x08a4c925          ! %f7
	.word	0xa84a70d9          ! %f8
	.word	0xffb4b893          ! %f9
	.word	0xd284276d          ! %f10
	.word	0xf3c0414e          ! %f11
	.word	0x1fa098ee          ! %f12
	.word	0x3fd42ea7          ! %f13
	.word	0x42d79f4f          ! %f14
	.word	0xd36843bf          ! %f15
	.word	0x0b04906e          ! %f16
	.word	0xe84d72b6          ! %f17
	.word	0xb78d2d92          ! %f18
	.word	0x95367fe5          ! %f19
	.word	0xe2b10f1a          ! %f20
	.word	0xe9af2525          ! %f21
	.word	0x88ed43a4          ! %f22
	.word	0xe2463c66          ! %f23
	.word	0x6f0c6c6f          ! %f24
	.word	0x8bcf3e27          ! %f25
	.word	0x803a1cd7          ! %f26
	.word	0x375bc796          ! %f27
	.word	0xc36bb908          ! %f28
	.word	0x9bdcb552          ! %f29
	.word	0x26331066          ! %f30
	.word	0x622dfb2f          ! %f31
	.word	0x24a38a40          ! %f32
	.word	0xa22b8e6f          ! %f33
	.word	0xa9ec7fb9          ! %f34
	.word	0x6a17c741          ! %f35
	.word	0x50675c1b          ! %f36
	.word	0xedf45f91          ! %f37
	.word	0xe641e4e7          ! %f38
	.word	0x3462f867          ! %f39
	.word	0x6f22ad65          ! %f40
	.word	0xc73da468          ! %f41
	.word	0xec7bc57d          ! %f42
	.word	0x69bcad3b          ! %f43
	.word	0x47053a1b          ! %f44
	.word	0xb3b672d6          ! %f45
	.word	0xa41b8d7d          ! %f46
	.word	0x06772f0b          ! %f47
	.word	0xaeadf80a          ! %f48
	.word	0x07af64c3          ! %f49
	.word	0x8e5b96a9          ! %f50
	.word	0x494421cc          ! %f51
	.word	0x4676b9b6          ! %f52
	.word	0xa1d7cb2d          ! %f53
	.word	0x2011e001          ! %f54
	.word	0x4f4d3f4e          ! %f55
	.word	0xd31c9b7c          ! %f56
	.word	0xac327e82          ! %f57
	.word	0xc2883989          ! %f58
	.word	0xf84111b1          ! %f59
	.word	0x419f9efa          ! %f60
	.word	0x2016e031          ! %f61
	.word	0xbbc4e84e          ! %f62
	.word	0xbc4c6117          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0xa88       ! %g1 (code pointer)
	.word	t0_data_in_shm_area ! %g2 (shared area pointer)
	.word	0xb6cd6951          ! %g3 (loop index)
	.word	SYM(t0_subr1)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0xeba710b5          ! %o0
	.word	0xb70f84e2          ! %o1
	.word	0x4e28ed63          ! %o2
	.word	0x8511dbad          ! %o3
	.word	0x22c7c0b5          ! %o4
	.word	0xc4a7af9f          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0x14f618ae          ! %l0
	.word	0xfb47e17e          ! %l1
	.word	0x9ceb06ab          ! %l2
	.word	0xf850489a          ! %l3
	.word	0x58d6d3dd          ! %l4
	.word	0x0a742395          ! %l5
	.word	0x820a24c8          ! %l6
	.word	0x15302680          ! %l7
	.word	t0_data_in_area0    ! %i0 (area pointer)
	.word	t0_data_in_area0    ! %i1 (area pointer)
	.word	0x0000000e          ! %i2 (byte offset)
	.word	0x00000002          ! %i3 (halfword offset)
	.word	0x00000000          ! %i4 (word offset)
	.word	0x00000018          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0x08ced2d2          ! %y
	.word	0x00000008          ! %icc (nzvc)
	.word	0x800001b5          ! %fsr
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

KDATA_MODULE(t0_module_data_in_stack, 0x43e62000)
.seg "data"
KGLOBAL(t0_data_in_mtbl_size)
KGLOBAL(t0_data_in_mtbl)
KGLOBAL(t0_data_in_stack)
t0_data_in_stack_start:
	.word	0x52fd6f42
	.word	0xd1b9ff14
	.word	0xa0e2e146
	.word	0x9e810f9f
	.word	0x71470849
	.word	0x140b5b96
	.word	0x732e54d1
	.word	0x627fff81
	.word	0x86902405
	.word	0x76602b99
	.word	0xf99e93d1
	.word	0xa9ff9268
	.word	0xe4e21367
	.word	0xa267ff4c
	.word	0xa6e8ae44
	.word	0x249f3be9
	.word	0xbd35e016
	.word	0xdf3496cf
	.word	0x8d63aa3c
	.word	0xe95b9adf
	.word	0x296737b7
	.word	0x67b7262e
	.word	0xfa5baac1
	.word	0xe016e07e
	.word	0x0654476e
	.word	0xbf39648a
	.word	0x4d3620f6
	.word	0x655814a8
	.word	0x59214ba3
	.word	0x02fbda98
	.word	0xdd456b79
	.word	0xeec9cb7f
	.word	0xecbed808
	.word	0x7cc6244f
	.word	0xa62c880f
	.word	0xfe76203a
	.word	0xd93e1bdb
	.word	0xddcd19dd
	.word	0x7d99bb81
	.word	0x3447093c
	.word	0x1d6ea668
	.word	0x071e13da
	.word	0xc02953c0
	.word	0xd62f5962
	.word	0x80f56fd1
	.word	0x0bfdbebf
	.word	0x0cafe84f
	.word	0x58d2029c
	.word	0xc1c52a11
	.word	0xce9c3199
	.word	0xcf3dbce1
	.word	0xc1c26dbf
	.word	0x07dc1e3e
	.word	0xcf673bf9
	.word	0xee232a41
	.word	0xb2d1fb98
	.word	0xadac1a0e
	.word	0x4e5f1f2e
	.word	0xed583171
	.word	0x688c0343
	.word	0x4ed5319b
	.word	0xf36126b5
	.word	0xbe279d16
	.word	0x6642e1bd
	.word	0x7a24596a
	.word	0xc99ed3f0
	.word	0x44205513
	.word	0x3525eeb8
	.word	0x53531ca9
	.word	0x5aaf9116
	.word	0x5355c872
	.word	0xdb016aae
	.word	0x6515f3b8
	.word	0x3a161f6b
	.word	0xa922918b
	.word	0x2dc6ba39
	.word	0x20dafeea
	.word	0xe9f234b0
	.word	0x9e2eb85f
	.word	0x2c0c82a0
	.word	0x5773298b
	.word	0xf029fbdb
	.word	0x30ad3744
	.word	0x1d9b7bb4
	.word	0xe0fbf925
	.word	0x6fde6d0b
	.word	0x8edaa5c7
	.word	0x9b160add
	.word	0xc3008cff
	.word	0x10b8b0b5
	.word	0xa6012dcd
	.word	0x3615fb6f
	.word	0x3e2c91e6
	.word	0x4bce0223
	.word	0xf7e42efb
	.word	0x64fce842
	.word	0x21542e2f
	.word	0xefbac51f
	.word	0x49b83457
	.word	0x74692a80
	.word	0xaa4029fb
	.word	0x5a6cc2eb
	.word	0xbaf2202f
	.word	0x8d0a61c0
	.word	0xbdddd7bc
	.word	0x421fc273
	.word	0xb182b239
	.word	0xa4ade954
	.word	0xbd6680f8
	.word	0x1f8eefc5
	.word	0x6ac1cbfb
	.word	0x560ccede
	.word	0x1d0a5b4d
	.word	0x4490c6c0
	.word	0x269f176d
	.word	0xd16a1e29
	.word	0xcee749b4
	.word	0x3b7a750b
	.word	0xf3e3f3db
	.word	0x29a99635
	.word	0xc2d3ee09
	.word	0x4002e749
	.word	0x6aaccd10
	.word	0x4b741b93
	.word	0x1d0bceca
	.word	0xf92cf58a
	.word	0xcbfe40b0
	.word	0x9f807bf3
	.word	0x5351951e
	.word	0x48436304
	.word	0x5cbcb5e5
	.word	0x3b6c56fb
	.word	0x55e8a719
	.word	0x2a68a502
	.word	0x9d934b3e
	.word	0x2efa4059
	.word	0x0817a23e
	.word	0xabe7a51b
	.word	0x92c13ed3
	.word	0xdb476f1b
	.word	0x16f97a45
	.word	0x9591f2a7
	.word	0x649334ac
	.word	0xd7dc8e3d
	.word	0x3d7b401d
	.word	0x504b176f
	.word	0x9dbfff63
	.word	0x0ba28283
	.word	0x05c0d533
	.word	0xf0a803a3
	.word	0x7636cf07
	.word	0xb6fd3989
	.word	0x6b0b0ef4
	.word	0x1f84c510
	.word	0x5966ea43
	.word	0xf5dbd618
	.word	0x77de0e91
	.word	0xc3e1fd91
	.word	0xfce755be
	.word	0x0daecdba
	.word	0x32ced101
	.word	0xc17eccc6
	.word	0x59e70dc5
	.word	0xd129cb8f
	.word	0x3d4b3b4b
	.word	0x95bb2104
	.word	0x0734b627
	.word	0xbbc06c61
t0_data_in_sp:
	.word	0x53202705
	.word	0x1499a38b
	.word	0x4536e460
	.word	0xae2a27f6
	.word	0x03b53317
	.word	0x7177b3fe
	.word	0x671c67f9
	.word	0x8d2afba6
	.word	t0_data_in_area0
	.word	t0_data_in_area0
	.word	0x00000009
	.word	0x00000010
	.word	0x0000001c
	.word	0x00000008
	.word	t0_data_in_fp
	.word	0x306cbc79
	.word	0x4522d5d0
	.word	0x05c5a4c0
	.word	0x527f4589
	.word	0xb1398033
	.word	0x99ad846d
	.word	0x4473f164
	.word	0xb0473b81
	.word	0xed948ae2
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
	.word   	0x790155ad	! [%fp - 0xc]
	.word   	0x869ba27e	! [%fp - 0x8]
	.word   	0xcbff289f	! [%fp - 0x4]
.global t0_data_in_fp; t0_data_in_fp:
	.word	0x4f39d58e
	.word	0x6e0313fe
	.word	0x83e3b3a6
	.word	0x5973d1da
	.word	0xb23a1498
	.word	0x6feab173
	.word	0xc1bd5fc1
	.word	0x7d71bdd9
	.word	0x7d8acdeb
	.word	0x5b7f73e9
	.word	0x2adb444e
	.word	0xbeacb7b8
	.word	0xb9c51e72
	.word	0xa6a83f6b
	.word	0x72a6e5ff
	.word	0x84563a0b
	.word	0x3b06e2c9
	.word	0x1dcba2d7
	.word	0xe1b16a8b
	.word	0x90810622
	.word	0xa1f13736
	.word	0x84118ac1
	.word	0x3a959bc2
	.word	0xb1906b8e
t0_data_in_stacktop:
	.word	0
t0_data_in_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_in_area0, 0x14d4c000)
.seg "data"
t0_data_in_area0_start:
.skip 6656
t0_data_in_area0_begin:
	.word	0x47fa82da	! t0_data_in_area0-0x20
	.word	0x5452be96	! t0_data_in_area0-0x1c
	.word	0x9f8e87e1	! t0_data_in_area0-0x18
	.word	0x7cd603e4	! t0_data_in_area0-0x14
	.word	0x7bf98223	! t0_data_in_area0-0x10
	.word	0xaea08c04	! t0_data_in_area0-0xc
	.word	0x51675327	! t0_data_in_area0-0x8
	.word	0x9d68e6c0	! t0_data_in_area0-0x4
.global t0_data_in_area0; t0_data_in_area0:
	.word	0xd8320484	! t0_data_in_area0+0x0
	.word	0x68114499	! t0_data_in_area0+0x4
	.word	0x2d9e0ea8	! t0_data_in_area0+0x8
	.word	0xb96d9a0c	! t0_data_in_area0+0xc
	.word	0xfa835168	! t0_data_in_area0+0x10
	.word	0xce2471aa	! t0_data_in_area0+0x14
	.word	0x74dca860	! t0_data_in_area0+0x18
	.word	0x45b64282	! t0_data_in_area0+0x1c
t0_data_in_area0_end:
.skip 1472
t0_data_in_area0_stop:

KDATA_MODULE(t0_module_data_in_shm_area, 0x76e46000)
.seg "data"
t0_data_in_shm_area_start:
t0_data_in_shm_area_begin:
.global t0_data_in_shm_area; t0_data_in_shm_area:
	.word	0xbce36863	! t0_data_in_shm_area+0x0 (t0)
	.word	0xb6dbe276	! t0_data_in_shm_area+0x4 (t0)
	.word	0x6988488a	! t0_data_in_shm_area+0x8 (t0)
	.word	0xb816d86e	! t0_data_in_shm_area+0xc (t0)
	.word	0xe75190aa	! t0_data_in_shm_area+0x10 (t0)
	.word	0x08d4f88a	! t0_data_in_shm_area+0x14 (t0)
	.word	0x2158b032	! t0_data_in_shm_area+0x18 (t0)
	.word	0x4c4164b8	! t0_data_in_shm_area+0x1c (t0)
	.word	0x981debc5	! t0_data_in_shm_area+0x20 (t0)
	.word	0xc57fd666	! t0_data_in_shm_area+0x24 (t0)
	.word	0xa9ee6d09	! t0_data_in_shm_area+0x28 (t0)
	.word	0x29ba8a21	! t0_data_in_shm_area+0x2c (t0)
	.word	0xa30aff82	! t0_data_in_shm_area+0x30 (t0)
	.word	0x71485460	! t0_data_in_shm_area+0x34 (t0)
	.word	0xa877f678	! t0_data_in_shm_area+0x38 (t0)
	.word	0xdbb6decc	! t0_data_in_shm_area+0x3c (t0)
	.word	0x76a96b2c	! t0_data_in_shm_area+0x40 (t0 bload)
	.word	0x445edfc8	! t0_data_in_shm_area+0x44
	.word	0x84e307f7	! t0_data_in_shm_area+0x48
	.word	0x29b5da00	! t0_data_in_shm_area+0x4c
	.word	0xb09d3bfd	! t0_data_in_shm_area+0x50
	.word	0x090da84c	! t0_data_in_shm_area+0x54
	.word	0x2b18cc9e	! t0_data_in_shm_area+0x58
	.word	0xf1b75a2c	! t0_data_in_shm_area+0x5c
	.word	0x207f94d0	! t0_data_in_shm_area+0x60
	.word	0xc468bf9e	! t0_data_in_shm_area+0x64
	.word	0x7d98affb	! t0_data_in_shm_area+0x68
	.word	0x6735072a	! t0_data_in_shm_area+0x6c
	.word	0x35069d1a	! t0_data_in_shm_area+0x70
	.word	0xf1ee0f53	! t0_data_in_shm_area+0x74
	.word	0xd5aee826	! t0_data_in_shm_area+0x78
	.word	0x4cd914c8	! t0_data_in_shm_area+0x7c
	.word	0x8b48eb1b	! t0_data_in_shm_area+0x80 (t0 bstore)
	.word	0x1494490e	! t0_data_in_shm_area+0x84
	.word	0xcbc10d13	! t0_data_in_shm_area+0x88
	.word	0x66802983	! t0_data_in_shm_area+0x8c
	.word	0xe390dd4f	! t0_data_in_shm_area+0x90
	.word	0xe61634dd	! t0_data_in_shm_area+0x94
	.word	0xfefc5127	! t0_data_in_shm_area+0x98
	.word	0x85ac6d95	! t0_data_in_shm_area+0x9c
	.word	0x1d87972b	! t0_data_in_shm_area+0xa0
	.word	0x623a01e2	! t0_data_in_shm_area+0xa4
	.word	0x84562f0d	! t0_data_in_shm_area+0xa8
	.word	0x806c0631	! t0_data_in_shm_area+0xac
	.word	0x05c69505	! t0_data_in_shm_area+0xb0
	.word	0x15aa7d35	! t0_data_in_shm_area+0xb4
	.word	0xf289a0c9	! t0_data_in_shm_area+0xb8
	.word	0xea15810c	! t0_data_in_shm_area+0xbc
t0_data_in_shm_area_end:
t0_data_in_shm_area_stop:

KDATA_MODULE(t0_module_data_exp_regs, 0x7ad34000)
.seg "data"
KGLOBAL(t0_data_exp_regs)
t0_data_exp_regs_start:
t0_data_exp_regs:
	.word	0xfe9135f3          ! %f0
	.word	0x9c72e30a          ! %f1
	.word	0x9361202b          ! %f2
	.word	0x9469b1e3          ! %f3
	.word	0x5382f503          ! %f4
	.word	0xc2c0b18c          ! %f5
	.word	0xa260249c          ! %f6
	.word	0x08a4c925          ! %f7
	.word	0xa84a70d9          ! %f8
	.word	0xffb4b893          ! %f9
	.word	0xd284276d          ! %f10
	.word	0xf3c0414e          ! %f11
	.word	0x1fa098ee          ! %f12
	.word	0x3fd42ea7          ! %f13
	.word	0x42d79f4f          ! %f14
	.word	0xd36843bf          ! %f15
	.word	0x0b04906e          ! %f16
	.word	0xe84d72b6          ! %f17
	.word	0xb78d2d92          ! %f18
	.word	0x95367fe5          ! %f19
	.word	0xe2b10f1a          ! %f20
	.word	0xe9af2525          ! %f21
	.word	0x88ed43a4          ! %f22
	.word	0xe2463c66          ! %f23
	.word	0x6f0c6c6f          ! %f24
	.word	0x8bcf3e27          ! %f25
	.word	0x803a1cd7          ! %f26
	.word	0x375bc796          ! %f27
	.word	0xc36bb908          ! %f28
	.word	0x9bdcb552          ! %f29
	.word	0x26331066          ! %f30
	.word	0x622dfb2f          ! %f31
	.word	0x24a38a40          ! %f32
	.word	0xa22b8e6f          ! %f33
	.word	0xa9ec7fb9          ! %f34
	.word	0x6a17c741          ! %f35
	.word	0x50675c1b          ! %f36
	.word	0xedf45f91          ! %f37
	.word	0xe641e4e7          ! %f38
	.word	0x3462f867          ! %f39
	.word	0x6f22ad65          ! %f40
	.word	0xc73da468          ! %f41
	.word	0xec7bc57d          ! %f42
	.word	0x69bcad3b          ! %f43
	.word	0x47053a1b          ! %f44
	.word	0xb3b672d6          ! %f45
	.word	0xa41b8d7d          ! %f46
	.word	0x06772f0b          ! %f47
	.word	0xaeadf80a          ! %f48
	.word	0x07af64c3          ! %f49
	.word	0x8e5b96a9          ! %f50
	.word	0x494421cc          ! %f51
	.word	0x4676b9b6          ! %f52
	.word	0xa1d7cb2d          ! %f53
	.word	0x2011e001          ! %f54
	.word	0x4f4d3f4e          ! %f55
	.word	0xd31c9b7c          ! %f56
	.word	0xac327e82          ! %f57
	.word	0xc2883989          ! %f58
	.word	0xf84111b1          ! %f59
	.word	0x419f9efa          ! %f60
	.word	0x2016e031          ! %f61
	.word	0xbbc4e84e          ! %f62
	.word	0xbc4c6117          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0xa88       ! %g1 (code pointer)
	.word	t0_data_exp_shm_area! %g2 (shared area pointer)
	.word	0xb6cd6951          ! %g3 (loop index)
	.word	SYM(t0_subr1)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0xeba710b5          ! %o0
	.word	0xb70f84e2          ! %o1
	.word	0x4e28ed63          ! %o2
	.word	0x8511dbad          ! %o3
	.word	0x22c7c0b5          ! %o4
	.word	0xc4a7af9f          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0x14f618ae          ! %l0
	.word	0xfb47e17e          ! %l1
	.word	0x9ceb06ab          ! %l2
	.word	0xf850489a          ! %l3
	.word	0x58d6d3dd          ! %l4
	.word	0x0a742395          ! %l5
	.word	0x820a24c8          ! %l6
	.word	0x15302680          ! %l7
	.word	t0_data_exp_area0   ! %i0 (area pointer)
	.word	t0_data_exp_area0   ! %i1 (area pointer)
	.word	0x0000000e          ! %i2 (byte offset)
	.word	0x00000002          ! %i3 (halfword offset)
	.word	0x00000000          ! %i4 (word offset)
	.word	0x00000018          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0x08ced2d2          ! %y
	.word	0x00000008          ! %icc (nzvc)
	.word	0x800001b5          ! %fsr
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

KDATA_MODULE(t0_module_data_exp_stack, 0x65044000)
.seg "data"
KGLOBAL(t0_data_exp_mtbl_size)
KGLOBAL(t0_data_exp_mtbl)
KGLOBAL(t0_data_exp_stack)
t0_data_exp_stack_start:
	.word	0x52fd6f42
	.word	0xd1b9ff14
	.word	0xa0e2e146
	.word	0x9e810f9f
	.word	0x71470849
	.word	0x140b5b96
	.word	0x732e54d1
	.word	0x627fff81
	.word	0x86902405
	.word	0x76602b99
	.word	0xf99e93d1
	.word	0xa9ff9268
	.word	0xe4e21367
	.word	0xa267ff4c
	.word	0xa6e8ae44
	.word	0x249f3be9
	.word	0xbd35e016
	.word	0xdf3496cf
	.word	0x8d63aa3c
	.word	0xe95b9adf
	.word	0x296737b7
	.word	0x67b7262e
	.word	0xfa5baac1
	.word	0xe016e07e
	.word	0x0654476e
	.word	0xbf39648a
	.word	0x4d3620f6
	.word	0x655814a8
	.word	0x59214ba3
	.word	0x02fbda98
	.word	0xdd456b79
	.word	0xeec9cb7f
	.word	0xecbed808
	.word	0x7cc6244f
	.word	0xa62c880f
	.word	0xfe76203a
	.word	0xd93e1bdb
	.word	0xddcd19dd
	.word	0x7d99bb81
	.word	0x3447093c
	.word	0x1d6ea668
	.word	0x071e13da
	.word	0xc02953c0
	.word	0xd62f5962
	.word	0x80f56fd1
	.word	0x0bfdbebf
	.word	0x0cafe84f
	.word	0x58d2029c
	.word	0xc1c52a11
	.word	0xce9c3199
	.word	0xcf3dbce1
	.word	0xc1c26dbf
	.word	0x07dc1e3e
	.word	0xcf673bf9
	.word	0xee232a41
	.word	0xb2d1fb98
	.word	0xadac1a0e
	.word	0x4e5f1f2e
	.word	0xed583171
	.word	0x688c0343
	.word	0x4ed5319b
	.word	0xf36126b5
	.word	0xbe279d16
	.word	0x6642e1bd
	.word	0x7a24596a
	.word	0xc99ed3f0
	.word	0x44205513
	.word	0x3525eeb8
	.word	0x53531ca9
	.word	0x5aaf9116
	.word	0x5355c872
	.word	0xdb016aae
	.word	0x6515f3b8
	.word	0x3a161f6b
	.word	0xa922918b
	.word	0x2dc6ba39
	.word	0x20dafeea
	.word	0xe9f234b0
	.word	0x9e2eb85f
	.word	0x2c0c82a0
	.word	0x5773298b
	.word	0xf029fbdb
	.word	0x30ad3744
	.word	0x1d9b7bb4
	.word	0xe0fbf925
	.word	0x6fde6d0b
	.word	0x8edaa5c7
	.word	0x9b160add
	.word	0xc3008cff
	.word	0x10b8b0b5
	.word	0xa6012dcd
	.word	0x3615fb6f
	.word	0x3e2c91e6
	.word	0x4bce0223
	.word	0xf7e42efb
	.word	0x64fce842
	.word	0x21542e2f
	.word	0xefbac51f
	.word	0x49b83457
	.word	0x74692a80
	.word	0xaa4029fb
	.word	0x5a6cc2eb
	.word	0xbaf2202f
	.word	0x8d0a61c0
	.word	0xbdddd7bc
	.word	0x421fc273
	.word	0xb182b239
	.word	0xa4ade954
	.word	0xbd6680f8
	.word	0x1f8eefc5
	.word	0x6ac1cbfb
	.word	0x560ccede
	.word	0x1d0a5b4d
	.word	0x4490c6c0
	.word	0x269f176d
	.word	0xd16a1e29
	.word	0xcee749b4
	.word	0x3b7a750b
	.word	0xf3e3f3db
	.word	0x29a99635
	.word	0xc2d3ee09
	.word	0x4002e749
	.word	0x6aaccd10
	.word	0x4b741b93
	.word	0x1d0bceca
	.word	0xf92cf58a
	.word	0xcbfe40b0
	.word	0x9f807bf3
	.word	0x5351951e
	.word	0x48436304
	.word	0x5cbcb5e5
	.word	0x3b6c56fb
	.word	0x55e8a719
	.word	0x2a68a502
	.word	0x9d934b3e
	.word	0x2efa4059
	.word	0x0817a23e
	.word	0xabe7a51b
	.word	0x92c13ed3
	.word	0xdb476f1b
	.word	0x16f97a45
	.word	0x9591f2a7
	.word	0x649334ac
	.word	0xd7dc8e3d
	.word	0x3d7b401d
	.word	0x504b176f
	.word	0x9dbfff63
	.word	0x0ba28283
	.word	0x05c0d533
	.word	0xf0a803a3
	.word	0x7636cf07
	.word	0xb6fd3989
	.word	0x6b0b0ef4
	.word	0x1f84c510
	.word	0x5966ea43
	.word	0xf5dbd618
	.word	0x77de0e91
	.word	0xc3e1fd91
	.word	0xfce755be
	.word	0x0daecdba
	.word	0x32ced101
	.word	0xc17eccc6
	.word	0x59e70dc5
	.word	0xd129cb8f
	.word	0x3d4b3b4b
	.word	0x95bb2104
	.word	0x0734b627
	.word	0xbbc06c61
t0_data_exp_sp:
	.word	0x53202705
	.word	0x1499a38b
	.word	0x4536e460
	.word	0xae2a27f6
	.word	0x03b53317
	.word	0x7177b3fe
	.word	0x671c67f9
	.word	0x8d2afba6
	.word	t0_data_exp_area0
	.word	t0_data_exp_area0
	.word	0x00000009
	.word	0x00000010
	.word	0x0000001c
	.word	0x00000008
	.word	t0_data_exp_fp
	.word	0x306cbc79
	.word	0x4522d5d0
	.word	0x05c5a4c0
	.word	0x527f4589
	.word	0xb1398033
	.word	0x99ad846d
	.word	0x4473f164
	.word	0xb0473b81
	.word	0xed948ae2
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
	.word   	0x790155ad	! [%fp - 0xc]
	.word   	0x869ba27e	! [%fp - 0x8]
	.word   	0xcbff289f	! [%fp - 0x4]
t0_data_exp_fp:
	.word	0x4f39d58e
	.word	0x6e0313fe
	.word	0x83e3b3a6
	.word	0x5973d1da
	.word	0xb23a1498
	.word	0x6feab173
	.word	0xc1bd5fc1
	.word	0x7d71bdd9
	.word	0x7d8acdeb
	.word	0x5b7f73e9
	.word	0x2adb444e
	.word	0xbeacb7b8
	.word	0xb9c51e72
	.word	0xa6a83f6b
	.word	0x72a6e5ff
	.word	0x84563a0b
	.word	0x3b06e2c9
	.word	0x1dcba2d7
	.word	0xe1b16a8b
	.word	0x90810622
	.word	0xa1f13736
	.word	0x84118ac1
	.word	0x3a959bc2
	.word	0xb1906b8e
t0_data_exp_stacktop:
	.word	0
t0_data_exp_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_exp_area0, 0x26942000)
.seg "data"
t0_data_exp_area0_start:
.skip 6656
t0_data_exp_area0_begin:
	.word	0x47fa82da	! t0_data_exp_area0-0x20
	.word	0x5452be96	! t0_data_exp_area0-0x1c
	.word	0x9f8e87e1	! t0_data_exp_area0-0x18
	.word	0x7cd603e4	! t0_data_exp_area0-0x14
	.word	0x7bf98223	! t0_data_exp_area0-0x10
	.word	0xaea08c04	! t0_data_exp_area0-0xc
	.word	0x51675327	! t0_data_exp_area0-0x8
	.word	0x9d68e6c0	! t0_data_exp_area0-0x4
.global t0_data_exp_area0; t0_data_exp_area0:
	.word	0xd8320484	! t0_data_exp_area0+0x0
	.word	0x68114499	! t0_data_exp_area0+0x4
	.word	0x2d9e0ea8	! t0_data_exp_area0+0x8
	.word	0xb96d9a0c	! t0_data_exp_area0+0xc
	.word	0xfa835168	! t0_data_exp_area0+0x10
	.word	0xce2471aa	! t0_data_exp_area0+0x14
	.word	0x74dca860	! t0_data_exp_area0+0x18
	.word	0x45b64282	! t0_data_exp_area0+0x1c
t0_data_exp_area0_end:
.skip 1472
t0_data_exp_area0_stop:

KDATA_MODULE(t0_module_data_exp_shm_area, 0x2cc80000)
.seg "data"
t0_data_exp_shm_area_start:
t0_data_exp_shm_area_begin:
.global t0_data_exp_shm_area; t0_data_exp_shm_area:
	.word	0xbce36863	! t0_data_exp_shm_area+0x0 (t0)
	.word	0xb6dbe276	! t0_data_exp_shm_area+0x4 (t0)
	.word	0x6988488a	! t0_data_exp_shm_area+0x8 (t0)
	.word	0xb816d86e	! t0_data_exp_shm_area+0xc (t0)
	.word	0xe75190aa	! t0_data_exp_shm_area+0x10 (t0)
	.word	0x08d4f88a	! t0_data_exp_shm_area+0x14 (t0)
	.word	0x2158b032	! t0_data_exp_shm_area+0x18 (t0)
	.word	0x4c4164b8	! t0_data_exp_shm_area+0x1c (t0)
	.word	0x981debc5	! t0_data_exp_shm_area+0x20 (t0)
	.word	0xc57fd666	! t0_data_exp_shm_area+0x24 (t0)
	.word	0xa9ee6d09	! t0_data_exp_shm_area+0x28 (t0)
	.word	0x29ba8a21	! t0_data_exp_shm_area+0x2c (t0)
	.word	0xa30aff82	! t0_data_exp_shm_area+0x30 (t0)
	.word	0x71485460	! t0_data_exp_shm_area+0x34 (t0)
	.word	0xa877f678	! t0_data_exp_shm_area+0x38 (t0)
	.word	0xdbb6decc	! t0_data_exp_shm_area+0x3c (t0)
	.word	0x76a96b2c	! t0_data_exp_shm_area+0x40 (t0 bload)
	.word	0x445edfc8	! t0_data_exp_shm_area+0x44
	.word	0x84e307f7	! t0_data_exp_shm_area+0x48
	.word	0x29b5da00	! t0_data_exp_shm_area+0x4c
	.word	0xb09d3bfd	! t0_data_exp_shm_area+0x50
	.word	0x090da84c	! t0_data_exp_shm_area+0x54
	.word	0x2b18cc9e	! t0_data_exp_shm_area+0x58
	.word	0xf1b75a2c	! t0_data_exp_shm_area+0x5c
	.word	0x207f94d0	! t0_data_exp_shm_area+0x60
	.word	0xc468bf9e	! t0_data_exp_shm_area+0x64
	.word	0x7d98affb	! t0_data_exp_shm_area+0x68
	.word	0x6735072a	! t0_data_exp_shm_area+0x6c
	.word	0x35069d1a	! t0_data_exp_shm_area+0x70
	.word	0xf1ee0f53	! t0_data_exp_shm_area+0x74
	.word	0xd5aee826	! t0_data_exp_shm_area+0x78
	.word	0x4cd914c8	! t0_data_exp_shm_area+0x7c
	.word	0x8b48eb1b	! t0_data_exp_shm_area+0x80 (t0 bstore)
	.word	0x1494490e	! t0_data_exp_shm_area+0x84
	.word	0xcbc10d13	! t0_data_exp_shm_area+0x88
	.word	0x66802983	! t0_data_exp_shm_area+0x8c
	.word	0xe390dd4f	! t0_data_exp_shm_area+0x90
	.word	0xe61634dd	! t0_data_exp_shm_area+0x94
	.word	0xfefc5127	! t0_data_exp_shm_area+0x98
	.word	0x85ac6d95	! t0_data_exp_shm_area+0x9c
	.word	0x1d87972b	! t0_data_exp_shm_area+0xa0
	.word	0x623a01e2	! t0_data_exp_shm_area+0xa4
	.word	0x84562f0d	! t0_data_exp_shm_area+0xa8
	.word	0x806c0631	! t0_data_exp_shm_area+0xac
	.word	0x05c69505	! t0_data_exp_shm_area+0xb0
	.word	0x15aa7d35	! t0_data_exp_shm_area+0xb4
	.word	0xf289a0c9	! t0_data_exp_shm_area+0xb8
	.word	0xea15810c	! t0_data_exp_shm_area+0xbc
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
#define T0_KAOS_SEED          d33f281e4af9
#define T0_KAOS_ICOUNT        5000
#define T0_KAOS_AREAS         1
#define T0_KAOS_AREASIZE      64
#define T0_KAOS_AREAOFFSET    6656
#define T0_KAOS_PAGESIZE      8192
#define T0_KAOS_CODECOUNT     5002

#define T0_KAOS_BOOT_VA                  0x0a078000
#define T0_KAOS_BOOT_PA                  0x0000000001d72000
#define T0_KAOS_BOOT_CACHEABLE           1
#define T0_KAOS_BOOT_NONCACHEABLE        0

#define T0_KAOS_STARTUP_VA               0x2d286000
#define T0_KAOS_STARTUP_PA               0x000000000257c000
#define T0_KAOS_STARTUP_CACHEABLE        1
#define T0_KAOS_STARTUP_NONCACHEABLE     0

#define T0_KAOS_OFFSET_TBL_VA            0x5b0aa000
#define T0_KAOS_OFFSET_TBL_PA            0x00000000052e4000
#define T0_KAOS_OFFSET_TBL_CACHEABLE     1
#define T0_KAOS_OFFSET_TBL_NONCACHEABLE  0

#define T0_KAOS_DONE_VA                  0x7207a000
#define T0_KAOS_DONE_PA                  0x0000000006f54000
#define T0_KAOS_DONE_CACHEABLE           1
#define T0_KAOS_DONE_NONCACHEABLE        0

#define T0_KAOS_KTBL_VA                  0x420ba000
#define T0_KAOS_KTBL_PA                  0x0000000008b4e000
#define T0_KAOS_KTBL_CACHEABLE           1
#define T0_KAOS_KTBL_NONCACHEABLE        0

#define T0_KAOS_SUBR0_VA                 0x60222000
#define T0_KAOS_SUBR0_PA                 0x000000000b06a000
#define T0_KAOS_SUBR0_CACHEABLE          1
#define T0_KAOS_SUBR0_NONCACHEABLE       0
#define T0_KAOS_SUBR1_VA                 0x3720e000
#define T0_KAOS_SUBR1_PA                 0x000000000dd6a000
#define T0_KAOS_SUBR1_CACHEABLE          1
#define T0_KAOS_SUBR1_NONCACHEABLE       0
#define T0_KAOS_SUBR2_VA                 0x41a36000
#define T0_KAOS_SUBR2_PA                 0x000000000e7e6000
#define T0_KAOS_SUBR2_CACHEABLE          1
#define T0_KAOS_SUBR2_NONCACHEABLE       0
#define T0_KAOS_SUBR3_VA                 0x41f88000
#define T0_KAOS_SUBR3_PA                 0x00000000106c4000
#define T0_KAOS_SUBR3_CACHEABLE          1
#define T0_KAOS_SUBR3_NONCACHEABLE       0

#define T0_KAOS_EXP_REGS_VA              0x7ad34000
#define T0_KAOS_EXP_REGS_PA              0x0000000012baa000
#define T0_KAOS_EXP_REGS_CACHEABLE       1
#define T0_KAOS_EXP_REGS_NONCACHEABLE    0
#define T0_KAOS_RUN_REGS_VA              0x7d93e000
#define T0_KAOS_RUN_REGS_PA              0x0000000015e20000
#define T0_KAOS_RUN_REGS_CACHEABLE       1
#define T0_KAOS_RUN_REGS_NONCACHEABLE    0

#define T0_KAOS_EXP_STACK_VA             0x65044000
#define T0_KAOS_EXP_STACK_PA             0x0000000017052000
#define T0_KAOS_EXP_STACK_CACHEABLE      1
#define T0_KAOS_EXP_STACK_NONCACHEABLE   0
#define T0_KAOS_RUN_STACK_VA             0x43e62000
#define T0_KAOS_RUN_STACK_PA             0x000000001967c000
#define T0_KAOS_RUN_STACK_CACHEABLE      1
#define T0_KAOS_RUN_STACK_NONCACHEABLE   0

#define T0_KAOS_AREA0
#define T0_KAOS_EXP_AREA0_VA             0x26942000
#define T0_KAOS_EXP_AREA0_PA             0x000000001a976000
#define T0_KAOS_EXP_AREA0_CACHEABLE      1
#define T0_KAOS_EXP_AREA0_NONCACHEABLE   0
#define T0_KAOS_RUN_AREA0_VA             0x14d4c000
#define T0_KAOS_RUN_AREA0_PA             0x000000001c7e2000
#define T0_KAOS_RUN_AREA0_CACHEABLE      1
#define T0_KAOS_RUN_AREA0_NONCACHEABLE   0

#define T0_KAOS_SHM_AREA
#define T0_KAOS_EXP_SHM_AREA_VA          0x2cc80000
#define T0_KAOS_EXP_SHM_AREA_PA          0x0000000000496000
#define T0_KAOS_EXP_SHM_AREA_CACHEABLE   1
#define T0_KAOS_EXP_SHM_AREA_NONCACHEABLE 0
#define T0_KAOS_RUN_SHM_AREA_VA          0x76e46000
#define T0_KAOS_RUN_SHM_AREA_PA          0x0000000000b34000
#define T0_KAOS_RUN_SHM_AREA_CACHEABLE   1
#define T0_KAOS_RUN_SHM_AREA_NONCACHEABLE 0

#define T0_KAOS_RANVAL_00     0xdc5a0b53
#define T0_KAOS_RANVAL_01     0x60f25309
#define T0_KAOS_RANVAL_02     0xe8c8340c
#define T0_KAOS_RANVAL_03     0x1a60f41f
#define T0_KAOS_RANVAL_04     0x2dad8517
#define T0_KAOS_RANVAL_05     0x1687be0d
#define T0_KAOS_RANVAL_06     0x41778fca
#define T0_KAOS_RANVAL_07     0x8a8cd5ab
#define T0_KAOS_RANVAL_08     0x30ff759a
#define T0_KAOS_RANVAL_09     0xf0d94914
#define T0_KAOS_RANVAL_0a     0x86c93f09
#define T0_KAOS_RANVAL_0b     0xada9d07d
#define T0_KAOS_RANVAL_0c     0xa80fb157
#define T0_KAOS_RANVAL_0d     0xa93286f7
#define T0_KAOS_RANVAL_0e     0x6d83d4fc
#define T0_KAOS_RANVAL_0f     0x89191873
#define T0_KAOS_RANVAL_10     0xae88023a
#define T0_KAOS_RANVAL_11     0xf459e4b9
#define T0_KAOS_RANVAL_12     0x2031be50
#define T0_KAOS_RANVAL_13     0x98fd033e
#define T0_KAOS_RANVAL_14     0xf3dd4b0a
#define T0_KAOS_RANVAL_15     0xb436f9ec
#define T0_KAOS_RANVAL_16     0xa35b53c4
#define T0_KAOS_RANVAL_17     0x2213e968
#define T0_KAOS_RANVAL_18     0x235aee22
#define T0_KAOS_RANVAL_19     0x48e2fb54
#define T0_KAOS_RANVAL_1a     0x07b701ff
#define T0_KAOS_RANVAL_1b     0x63719398
#define T0_KAOS_RANVAL_1c     0x5af16b67
#define T0_KAOS_RANVAL_1d     0xfd7b33c9
#define T0_KAOS_RANVAL_1e     0x02939a9d
#define T0_KAOS_RANVAL_1f     0x170bb815
#define T0_KAOS_RANVAL_20     0x4d7c6975
#define T0_KAOS_RANVAL_21     0x2027a761
#define T0_KAOS_RANVAL_22     0xbc6e228a
#define T0_KAOS_RANVAL_23     0x0c524c88
#define T0_KAOS_RANVAL_24     0x47c39e1b
#define T0_KAOS_RANVAL_25     0xd74644cd
#define T0_KAOS_RANVAL_26     0xa2e5b193
#define T0_KAOS_RANVAL_27     0x1c54b005
#define T0_KAOS_RANVAL_28     0xbbbd4a09
#define T0_KAOS_RANVAL_29     0x49cd4903
#define T0_KAOS_RANVAL_2a     0x1355373a
#define T0_KAOS_RANVAL_2b     0x3f80f14b
#define T0_KAOS_RANVAL_2c     0x1ad03bc7
#define T0_KAOS_RANVAL_2d     0x2cfdb91d
#define T0_KAOS_RANVAL_2e     0x1f8438c9
#define T0_KAOS_RANVAL_2f     0xaa1ab54b
#define T0_KAOS_RANVAL_30     0xc13e8de9
#define T0_KAOS_RANVAL_31     0x57a91681
#define T0_KAOS_RANVAL_32     0x2b5cdca9
#define T0_KAOS_RANVAL_33     0xca5b81e6
#define T0_KAOS_RANVAL_34     0x11c19480
#define T0_KAOS_RANVAL_35     0x19dbb141
#define T0_KAOS_RANVAL_36     0xf2a6d6f3
#define T0_KAOS_RANVAL_37     0x1a0670fb
#define T0_KAOS_RANVAL_38     0xe3f2add3
#define T0_KAOS_RANVAL_39     0xe8ef3cc3
#define T0_KAOS_RANVAL_3a     0xbdac0b47
#define T0_KAOS_RANVAL_3b     0x79558fa0
#define T0_KAOS_RANVAL_3c     0x49a3ea4f
#define T0_KAOS_RANVAL_3d     0x7a1f8aa4
#define T0_KAOS_RANVAL_3e     0x54a4f7dc
#define T0_KAOS_RANVAL_3f     0x4ac76dae
#define T0_KAOS_RANVAL_40     0xda06bfbb
#define T0_KAOS_RANVAL_41     0xd2f58fd9
#define T0_KAOS_RANVAL_42     0x19183dd8
#define T0_KAOS_RANVAL_43     0x9ab7a183
#define T0_KAOS_RANVAL_44     0x04ae3baf
#define T0_KAOS_RANVAL_45     0xb57b1817
#define T0_KAOS_RANVAL_46     0xa339dae2
#define T0_KAOS_RANVAL_47     0x1b154402
#define T0_KAOS_RANVAL_48     0xfd5d6946
#define T0_KAOS_RANVAL_49     0x506bcb74
#define T0_KAOS_RANVAL_4a     0x3d0be7f4
#define T0_KAOS_RANVAL_4b     0xbf36a8de
#define T0_KAOS_RANVAL_4c     0x2369de12
#define T0_KAOS_RANVAL_4d     0x57be6a4e
#define T0_KAOS_RANVAL_4e     0x8ecbf175
#define T0_KAOS_RANVAL_4f     0xedf9d718
#define T0_KAOS_RANVAL_50     0x1785a250
#define T0_KAOS_RANVAL_51     0xda2b636b
#define T0_KAOS_RANVAL_52     0x15553c86
#define T0_KAOS_RANVAL_53     0xf55585c5
#define T0_KAOS_RANVAL_54     0x3042e85c
#define T0_KAOS_RANVAL_55     0xeb042861
#define T0_KAOS_RANVAL_56     0x6cd18d9b
#define T0_KAOS_RANVAL_57     0x1276a114
#define T0_KAOS_RANVAL_58     0x8bd74767
#define T0_KAOS_RANVAL_59     0xcf00e438
#define T0_KAOS_RANVAL_5a     0xcd97444e
#define T0_KAOS_RANVAL_5b     0xa8c29b8f
#define T0_KAOS_RANVAL_5c     0x73cb6d66
#define T0_KAOS_RANVAL_5d     0xece0784d
#define T0_KAOS_RANVAL_5e     0x17ace06f
#define T0_KAOS_RANVAL_5f     0x58d70fa1
#define T0_KAOS_RANVAL_60     0x309f7c4d
#define T0_KAOS_RANVAL_61     0x9a10e379
#define T0_KAOS_RANVAL_62     0x9057445f
#define T0_KAOS_RANVAL_63     0x83237558
#define T0_KAOS_RANVAL_64     0x473b867c
#define T0_KAOS_RANVAL_65     0xa6547771
#define T0_KAOS_RANVAL_66     0xb599489e
#define T0_KAOS_RANVAL_67     0x5841f06a
#define T0_KAOS_RANVAL_68     0x9b86de79
#define T0_KAOS_RANVAL_69     0x99ba806f
#define T0_KAOS_RANVAL_6a     0xcae074a1
#define T0_KAOS_RANVAL_6b     0x28007a7d
#define T0_KAOS_RANVAL_6c     0x41f82de0
#define T0_KAOS_RANVAL_6d     0x24884312
#define T0_KAOS_RANVAL_6e     0x9983f0e8
#define T0_KAOS_RANVAL_6f     0xe75beda2
#define T0_KAOS_RANVAL_70     0x409b8797
#define T0_KAOS_RANVAL_71     0xa3197482
#define T0_KAOS_RANVAL_72     0x3c780650
#define T0_KAOS_RANVAL_73     0x69c2b322
#define T0_KAOS_RANVAL_74     0xee2ae945
#define T0_KAOS_RANVAL_75     0x8e8d90d7
#define T0_KAOS_RANVAL_76     0x31e9bea5
#define T0_KAOS_RANVAL_77     0x130d1a7d
#define T0_KAOS_RANVAL_78     0x86a8e004
#define T0_KAOS_RANVAL_79     0xa089b3ba
#define T0_KAOS_RANVAL_7a     0xac9b7a7b
#define T0_KAOS_RANVAL_7b     0xa1f59caf
#define T0_KAOS_RANVAL_7c     0x67b44454
#define T0_KAOS_RANVAL_7d     0x9aacd74d
#define T0_KAOS_RANVAL_7e     0xa314903d
#define T0_KAOS_RANVAL_7f     0x6ebb8fb5
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
!    areaoffset     6656
!    ncache         0
!    emulate_ncache 1
!    pagesize       8192
!    invsize        0
!    codecount      5002
!    code           420ba000
!    entry          420ba000
!    fsr_exceptions 00000000
!    fsr_roundmode  00000004
!    fsr_mask       c0000fff
!    seed           d33f281e4af9
!    va_map         0000000000400000,000000007fffffff
!    pa_cached      0000000000400000,000000007fffffff
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

KTEXT_MODULE(t0_module_ktbl, 0x420ba000)
.seg "text"
	KGLOBAL(t0_ktbl)
t0_ktbl_page_begin:
.global t0_kref; t0_kref:
	.skip 0
t0_ktbl:
	.word	0x89a01a44	! t0_kref+0x0:   	fdtoi	%f4, %f4
	.word	0x89a10824	! t0_kref+0x4:   	fadds	%f4, %f4, %f4
	.word	0xc99e101d	! t0_kref+0x8:   	ldda	[%i0 + %i5]0x80, %f4
	.word	0x89a01104	! t0_kref+0xc:   	fxtod	%f4, %f4
	.word	0xdec65000	! t0_kref+0x10:   	ldswa	[%i1]0x80, %o7
	.word	0x2c800005	! t0_kref+0x14:   	bneg,a	_kref+0x28
	.word	0x9a500000	! t0_kref+0x18:   	umul	%g0, %g0, %o5
	.word	0x9130200f	! t0_kref+0x1c:   	srl	%g0, 0xf, %o0
	.word	0x89a108c4	! t0_kref+0x20:   	fsubd	%f4, %f4, %f4
	.word	0x89a10824	! t0_kref+0x24:   	fadds	%f4, %f4, %f4
	.word	0x86102004	! t0_kref+0x28:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x2c:   	bne,a	_kref+0x2c
	.word	0x86a0e001	! t0_kref+0x30:   	subcc	%g3, 1, %g3
	.word	0xee4e7fe4	! t0_kref+0x34:   	ldsb	[%i1 - 0x1c], %l7
	.word	0x38480007	! t0_kref+0x38:   	bgu,a,pt	%icc, _kref+0x54
	.word	0x89a01924	! t0_kref+0x3c:   	fstod	%f4, %f4
	.word	0xe2e81019	! t0_kref+0x40:   	ldstuba	[%g0 + %i1]0x80, %l1
	.word	0x81a90a24	! t0_kref+0x44:   	fcmps	%fcc0, %f4, %f4
	.word	0x98180000	! t0_kref+0x48:   	xor	%g0, %g0, %o4
	.word	0x89b10a24	! t0_kref+0x4c:   	fpadd16s	%f4, %f4, %f4
	.word	0x81800000	! t0_kref+0x50:   	mov	%g0, %y
	.word	0x81a90a24	! t0_kref+0x54:   	fcmps	%fcc0, %f4, %f4
	.word	0x92b00000	! t0_kref+0x58:   	orncc	%g0, %g0, %o1
	.word	0x89a108a4	! t0_kref+0x5c:   	fsubs	%f4, %f4, %f4
	.word	0xd43e0000	! t0_kref+0x60:   	std	%o2, [%i0]
	.word	0x2e800008	! t0_kref+0x64:   	bvs,a	_kref+0x84
	.word	0xaf380000	! t0_kref+0x68:   	sra	%g0, %g0, %l7
	.word	0x89a109c4	! t0_kref+0x6c:   	fdivd	%f4, %f4, %f4
	.word	0x9aa827b7	! t0_kref+0x70:   	andncc	%g0, 0x7b7, %o5
	.word	0xafb00000	! t0_kref+0x74:   	edge8	%g0, %g0, %l7
	.word	0x80800000	! t0_kref+0x78:   	addcc	%g0, %g0, %g0
	.word	0x89b10aa4	! t0_kref+0x7c:   	fpsub16s	%f4, %f4, %f4
	.word	0x8143c000	! t0_kref+0x80:   	stbar
	.word	0xc9bf5a59	! t0_kref+0x84:   	stda	%f4, [%i5 + %i1]0xd2
	.word	0x92000000	! t0_kref+0x88:   	add	%g0, %g0, %o1
	.word	0xee7e7ffc	! t0_kref+0x8c:   	swap	[%i1 - 4], %l7
	.word	0x89a8c024	! t0_kref+0x90:   	fmovsul	%fcc0, %f4, %f4
	.word	0x89a000a4	! t0_kref+0x94:   	fnegs	%f4, %f4
	.word	0xd4060000	! t0_kref+0x98:   	ld	[%i0], %o2
	.word	0xc020a038	! t0_kref+0x9c:   	clr	[%g2 + 0x38]
	call	SYM(t0_subr3)
	.word	0x96a82a34	! t0_kref+0xa4:   	andncc	%g0, 0xa34, %o3
	.word	0x81a90ac4	! t0_kref+0xa8:   	fcmped	%fcc0, %f4, %f4
	.word	0xf5ee501c	! t0_kref+0xac:   	prefetcha	%i1 + %i4, 26
	.word	0xc030a01a	! t0_kref+0xb0:   	clrh	[%g2 + 0x1a]
	.word	0x9e10275d	! t0_kref+0xb4:   	mov	0x75d, %o7
	.word	0xd400a018	! t0_kref+0xb8:   	ld	[%g2 + 0x18], %o2
	.word	0x89a10824	! t0_kref+0xbc:   	fadds	%f4, %f4, %f4
	.word	0xda4e001a	! t0_kref+0xc0:   	ldsb	[%i0 + %i2], %o5
	.word	0x89b10e80	! t0_kref+0xc4:   	fsrc1	%f4, %f4
	.word	0x89b10e64	! t0_kref+0xc8:   	fxnors	%f4, %f4, %f4
	.word	0xd416c019	! t0_kref+0xcc:   	lduh	[%i3 + %i1], %o2
	.word	0x80503350	! t0_kref+0xd0:   	umul	%g0, -0xcb0, %g0
	.word	0xe7ee501b	! t0_kref+0xd4:   	prefetcha	%i1 + %i3, 19
	.word	0x99200000	! t0_kref+0xd8:   	mulscc	%g0, %g0, %o4
	.word	0xda4e6005	! t0_kref+0xdc:   	ldsb	[%i1 + 5], %o5
	.word	0x81a90ac4	! t0_kref+0xe0:   	fcmped	%fcc0, %f4, %f4
	.word	0x89a01904	! t0_kref+0xe4:   	fitod	%f4, %f4
	.word	0x94982351	! t0_kref+0xe8:   	xorcc	%g0, 0x351, %o2
	.word	0x95400000	! t0_kref+0xec:   	mov	%y, %o2
	.word	0x981038a7	! t0_kref+0xf0:   	mov	0xfffff8a7, %o4
	.word	0xd24e001a	! t0_kref+0xf4:   	ldsb	[%i0 + %i2], %o1
	.word	0x93400000	! t0_kref+0xf8:   	mov	%y, %o1
	.word	0xc99e1000	! t0_kref+0xfc:   	ldda	[%i0]0x80, %f4
	.word	0x89a00524	! t0_kref+0x100:   	fsqrts	%f4, %f4
	.word	0x89b00764	! t0_kref+0x104:   	fpack16	%f4, %f4
	.word	0xae88257c	! t0_kref+0x108:   	andcc	%g0, 0x57c, %l7
	.word	0xd4d01018	! t0_kref+0x10c:   	ldsha	[%g0 + %i0]0x80, %o2
	.word	0xc900a02c	! t0_kref+0x110:   	ld	[%g2 + 0x2c], %f4
	.word	0x89a01a24	! t0_kref+0x114:   	fstoi	%f4, %f4
	.word	0x9a100000	! t0_kref+0x118:   	clr	%o5
	.word	0x89a10944	! t0_kref+0x11c:   	fmuld	%f4, %f4, %f4
	.word	0x89a01904	! t0_kref+0x120:   	fitod	%f4, %f4
	.word	0x89a10944	! t0_kref+0x124:   	fmuld	%f4, %f4, %f4
	.word	0x89b106a4	! t0_kref+0x128:   	fmul8x16al	%f4, %f4, %f4
	.word	0x90183618	! t0_kref+0x12c:   	xor	%g0, -0x9e8, %o0
	.word	0xd47e7ffc	! t0_kref+0x130:   	swap	[%i1 - 4], %o2
	.word	0x001fffff	! t0_kref+0x134:   	illtrap	0x1fffff
	.word	0x89a00524	! t0_kref+0x138:   	fsqrts	%f4, %f4
	.word	0x8008328a	! t0_kref+0x13c:   	and	%g0, -0xd76, %g0
	.word	0xd20e4000	! t0_kref+0x140:   	ldub	[%i1], %o1
	.word	0x89a10924	! t0_kref+0x144:   	fmuls	%f4, %f4, %f4
	.word	0x89a000a4	! t0_kref+0x148:   	fnegs	%f4, %f4
	.word	0xd250a004	! t0_kref+0x14c:   	ldsh	[%g2 + 4], %o1
	.word	0x81a90a24	! t0_kref+0x150:   	fcmps	%fcc0, %f4, %f4
	.word	0xd0500018	! t0_kref+0x154:   	ldsh	[%g0 + %i0], %o0
	.word	0xd406001c	! t0_kref+0x158:   	ld	[%i0 + %i4], %o2
	.word	0x86102009	! t0_kref+0x15c:   	mov	0x9, %g3
	.word	0x86a0e001	! t0_kref+0x160:   	subcc	%g3, 1, %g3
	.word	0x22800018	! t0_kref+0x164:   	be,a	_kref+0x1c4
	.word	0x89a10924	! t0_kref+0x168:   	fmuls	%f4, %f4, %f4
	.word	0x89a01924	! t0_kref+0x16c:   	fstod	%f4, %f4
	.word	0x9ec0349a	! t0_kref+0x170:   	addccc	%g0, -0xb66, %o7
	.word	0x89a01904	! t0_kref+0x174:   	fitod	%f4, %f4
	.word	0x90102a00	! t0_kref+0x178:   	mov	0xa00, %o0
	.word	0x89a10924	! t0_kref+0x17c:   	fmuls	%f4, %f4, %f4
	.word	0xb410201a	! t0_kref+0x180:   	mov	0x1a, %i2
	.word	0x96d80000	! t0_kref+0x184:   	smulcc	%g0, %g0, %o3
	.word	0xde08a025	! t0_kref+0x188:   	ldub	[%g2 + 0x25], %o7
	.word	0xe01e3fe0	! t0_kref+0x18c:   	ldd	[%i0 - 0x20], %l0
	.word	0x89a00524	! t0_kref+0x190:   	fsqrts	%f4, %f4
	.word	0x9f100000	! t0_kref+0x194:   	taddcctv	%g0, %g0, %o7
	.word	0xc030a010	! t0_kref+0x198:   	clrh	[%g2 + 0x10]
	.word	0x97b10404	! t0_kref+0x19c:   	fcmple16	%f4, %f4, %o3
	.word	0x89b10e80	! t0_kref+0x1a0:   	fsrc1	%f4, %f4
	.word	0xee50a034	! t0_kref+0x1a4:   	ldsh	[%g2 + 0x34], %l7
	.word	0x9a103036	! t0_kref+0x1a8:   	mov	0xfffff036, %o5
	call	SYM(t0_subr0)
	.word	0xc93e001d	! t0_kref+0x1b0:   	std	%f4, [%i0 + %i5]
	.word	0xc900a010	! t0_kref+0x1b4:   	ld	[%g2 + 0x10], %f4
	.word	0xaef80000	! t0_kref+0x1b8:   	sdivcc	%g0, %g0, %l7
	.word	0x81800000	! t0_kref+0x1bc:   	mov	%g0, %y
	.word	0x89a10824	! t0_kref+0x1c0:   	fadds	%f4, %f4, %f4
	.word	0xde066008	! t0_kref+0x1c4:   	ld	[%i1 + 8], %o7
	.word	0x94002a83	! t0_kref+0x1c8:   	add	%g0, 0xa83, %o2
	.word	0x89b10fa4	! t0_kref+0x1cc:   	fors	%f4, %f4, %f4
	.word	0x89b10ee4	! t0_kref+0x1d0:   	fornot2s	%f4, %f4, %f4
	.word	0xec9f5019	! t0_kref+0x1d4:   	ldda	[%i5 + %i1]0x80, %l6
	.word	0x89b007a4	! t0_kref+0x1d8:   	fpackfix	%f4, %f4
	.word	0x89a00524	! t0_kref+0x1dc:   	fsqrts	%f4, %f4
	.word	0x89a01084	! t0_kref+0x1e0:   	fxtos	%f4, %f4
	.word	0x94a82000	! t0_kref+0x1e4:   	andncc	%g0, 0, %o2
	.word	0x89a10924	! t0_kref+0x1e8:   	fmuls	%f4, %f4, %f4
	.word	0xc900a004	! t0_kref+0x1ec:   	ld	[%g2 + 4], %f4
	.word	0x89b10e24	! t0_kref+0x1f0:   	fands	%f4, %f4, %f4
	.word	0x9de3bfa0	! t0_kref+0x1f4:   	save	%sp, -0x60, %sp
	.word	0x801e401a	! t0_kref+0x1f8:   	xor	%i1, %i2, %g0
	.word	0x97ef4019	! t0_kref+0x1fc:   	restore	%i5, %i1, %o3
	.word	0xc91fbd88	! t0_kref+0x200:   	ldd	[%fp - 0x278], %f4
	.word	0x89b10e80	! t0_kref+0x204:   	fsrc1	%f4, %f4
	.word	0x94800000	! t0_kref+0x208:   	addcc	%g0, %g0, %o2
	.word	0x9e980000	! t0_kref+0x20c:   	xorcc	%g0, %g0, %o7
	.word	0xc99e101d	! t0_kref+0x210:   	ldda	[%i0 + %i5]0x80, %f4
	.word	0x89b10ae4	! t0_kref+0x214:   	fpsub32s	%f4, %f4, %f4
	.word	0xc91fbde0	! t0_kref+0x218:   	ldd	[%fp - 0x220], %f4
	.word	0xee16c018	! t0_kref+0x21c:   	lduh	[%i3 + %i0], %l7
	.word	0xc91fbfb0	! t0_kref+0x220:   	ldd	[%fp - 0x50], %f4
	.word	0x90700000	! t0_kref+0x224:   	udiv	%g0, %g0, %o0
	.word	0x89a00524	! t0_kref+0x228:   	fsqrts	%f4, %f4
	.word	0xc91fbe50	! t0_kref+0x22c:   	ldd	[%fp - 0x1b0], %f4
	.word	0x8143c000	! t0_kref+0x230:   	stbar
	.word	0x81dda9d2	! t0_kref+0x234:   	flush	%l6 + 0x9d2
	.word	0xc028a038	! t0_kref+0x238:   	clrb	[%g2 + 0x38]
	.word	0x96402a6d	! t0_kref+0x23c:   	addc	%g0, 0xa6d, %o3
	.word	0xd4563fee	! t0_kref+0x240:   	ldsh	[%i0 - 0x12], %o2
	.word	0x98800000	! t0_kref+0x244:   	addcc	%g0, %g0, %o4
	.word	0xc99f5018	! t0_kref+0x248:   	ldda	[%i5 + %i0]0x80, %f4
	.word	0x91400000	! t0_kref+0x24c:   	mov	%y, %o0
	.word	0x98980000	! t0_kref+0x250:   	xorcc	%g0, %g0, %o4
	.word	0x89a01a44	! t0_kref+0x254:   	fdtoi	%f4, %f4
	.word	0x81580000	! t0_kref+0x258:   	flushw
	.word	0x992027e8	! t0_kref+0x25c:   	mulscc	%g0, 0x7e8, %o4
	.word	0x89a00524	! t0_kref+0x260:   	fsqrts	%f4, %f4
	.word	0xc9180019	! t0_kref+0x264:   	ldd	[%g0 + %i1], %f4
	.word	0x9fc10000	! t0_kref+0x268:   	call	%g4
	.word	0x81400000	! t0_kref+0x26c:   	mov	%y, %g0
	.word	0xd4961000	! t0_kref+0x270:   	lduha	[%i0]0x80, %o2
	.word	0xaf418000	! t0_kref+0x274:   	mov	%fprs, %l7
	.word	0x89a00124	! t0_kref+0x278:   	fabss	%f4, %f4
	.word	0xee4e7fe1	! t0_kref+0x27c:   	ldsb	[%i1 - 0x1f], %l7
	.word	0xd03e6010	! t0_kref+0x280:   	std	%o0, [%i1 + 0x10]
	.word	0x89b00f24	! t0_kref+0x284:   	fsrc2s	%f4, %f4
	.word	0x89b10f64	! t0_kref+0x288:   	fornot1s	%f4, %f4, %f4
	.word	0xde40a038	! t0_kref+0x28c:   	ldsw	[%g2 + 0x38], %o7
	.word	0x90803c40	! t0_kref+0x290:   	addcc	%g0, -0x3c0, %o0
	.word	0xc020a010	! t0_kref+0x294:   	clr	[%g2 + 0x10]
	.word	0xfdee501b	! t0_kref+0x298:   	prefetcha	%i1 + %i3, 30
	.word	0x89b10ea0	! t0_kref+0x29c:   	fsrc1s	%f4, %f4
	.word	0x98e00000	! t0_kref+0x2a0:   	subccc	%g0, %g0, %o4
	.word	0x94980000	! t0_kref+0x2a4:   	xorcc	%g0, %g0, %o2
	.word	0xaea80000	! t0_kref+0x2a8:   	andncc	%g0, %g0, %l7
	.word	0x9e100000	! t0_kref+0x2ac:   	clr	%o7
	.word	0x89a01a44	! t0_kref+0x2b0:   	fdtoi	%f4, %f4
	.word	0x89a01044	! t0_kref+0x2b4:   	fdtox	%f4, %f4
	.word	0x8143c000	! t0_kref+0x2b8:   	stbar
	.word	0x28800005	! t0_kref+0x2bc:   	bleu,a	_kref+0x2d0
	.word	0x96103351	! t0_kref+0x2c0:   	mov	0xfffff351, %o3
	.word	0xe3b8a080	! t0_kref+0x2c4:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x89a01924	! t0_kref+0x2c8:   	fstod	%f4, %f4
	.word	0xc030a02a	! t0_kref+0x2cc:   	clrh	[%g2 + 0x2a]
	.word	0x97280000	! t0_kref+0x2d0:   	sll	%g0, %g0, %o3
	.word	0x2b480004	! t0_kref+0x2d4:   	fbug,a,pt	%fcc0, _kref+0x2e4
	.word	0x94900000	! t0_kref+0x2d8:   	orcc	%g0, %g0, %o2
	.word	0x93700000	! t0_kref+0x2dc:   	popc	%g0, %o1
	.word	0xc000a000	! t0_kref+0x2e0:   	ld	[%g2], %g0
	.word	0x90203f4b	! t0_kref+0x2e4:   	sub	%g0, -0xb5, %o0
	.word	0xd6fe5000	! t0_kref+0x2e8:   	swapa	[%i1]0x80, %o3
	.word	0xc0280018	! t0_kref+0x2ec:   	clrb	[%g0 + %i0]
	.word	0x89a10824	! t0_kref+0x2f0:   	fadds	%f4, %f4, %f4
	.word	0x81400000	! t0_kref+0x2f4:   	mov	%y, %g0
	.word	0xc030a00c	! t0_kref+0x2f8:   	clrh	[%g2 + 0xc]
	.word	0x89b10f44	! t0_kref+0x2fc:   	fornot1	%f4, %f4, %f4
	.word	0x89a00524	! t0_kref+0x300:   	fsqrts	%f4, %f4
	.word	0x91302008	! t0_kref+0x304:   	srl	%g0, 0x8, %o0
	.word	0x22480004	! t0_kref+0x308:   	be,a,pt	%icc, _kref+0x318
	.word	0x89b10d40	! t0_kref+0x30c:   	fnot1	%f4, %f4
	.word	0x89a10944	! t0_kref+0x310:   	fmuld	%f4, %f4, %f4
	.word	0x90403d77	! t0_kref+0x314:   	addc	%g0, -0x289, %o0
	.word	0xc920a014	! t0_kref+0x318:   	st	%f4, [%g2 + 0x14]
	.word	0xda10a00c	! t0_kref+0x31c:   	lduh	[%g2 + 0xc], %o5
	.word	0xc008a02f	! t0_kref+0x320:   	ldub	[%g2 + 0x2f], %g0
	.word	0x28800001	! t0_kref+0x324:   	bleu,a	_kref+0x328
	.word	0x89a01924	! t0_kref+0x328:   	fstod	%f4, %f4
	.word	0xd208a017	! t0_kref+0x32c:   	ldub	[%g2 + 0x17], %o1
	.word	0x89a10844	! t0_kref+0x330:   	faddd	%f4, %f4, %f4
	.word	0x81a90a44	! t0_kref+0x334:   	fcmpd	%fcc0, %f4, %f4
	.word	0xc900a024	! t0_kref+0x338:   	ld	[%g2 + 0x24], %f4
	.word	0xc807bfe8	! t0_kref+0x33c:   	ld	[%fp - 0x18], %g4
	.word	0x89b10aa4	! t0_kref+0x340:   	fpsub16s	%f4, %f4, %f4
	.word	0x89b00764	! t0_kref+0x344:   	fpack16	%f4, %f4
	.word	0x9ef80000	! t0_kref+0x348:   	sdivcc	%g0, %g0, %o7
	.word	0x89a108a4	! t0_kref+0x34c:   	fsubs	%f4, %f4, %f4
	.word	0x99400000	! t0_kref+0x350:   	mov	%y, %o4
	.word	0xa7800000	! t0_kref+0x354:   	mov	%g0, %gsr
	.word	0x81dc8010	! t0_kref+0x358:   	flush	%l2 + %l0
	.word	0xaeb00000	! t0_kref+0x35c:   	orncc	%g0, %g0, %l7
	.word	0x89a10824	! t0_kref+0x360:   	fadds	%f4, %f4, %f4
	.word	0x90f80000	! t0_kref+0x364:   	sdivcc	%g0, %g0, %o0
	.word	0x96900000	! t0_kref+0x368:   	orcc	%g0, %g0, %o3
	.word	0x89a10824	! t0_kref+0x36c:   	fadds	%f4, %f4, %f4
	.word	0xc020a004	! t0_kref+0x370:   	clr	[%g2 + 4]
	.word	0x801821bd	! t0_kref+0x374:   	xor	%g0, 0x1bd, %g0
	.word	0xd0566006	! t0_kref+0x378:   	ldsh	[%i1 + 6], %o0
	.word	0xd44e2000	! t0_kref+0x37c:   	ldsb	[%i0], %o2
	.word	0x89a01a24	! t0_kref+0x380:   	fstoi	%f4, %f4
	.word	0x89b10ea0	! t0_kref+0x384:   	fsrc1s	%f4, %f4
	.word	0x95b00020	! t0_kref+0x388:   	edge8n	%g0, %g0, %o2
	.word	0x81b104c4	! t0_kref+0x38c:   	fcmpne32	%f4, %f4, %g0
	.word	0x89a10844	! t0_kref+0x390:   	faddd	%f4, %f4, %f4
	.word	0xd850a00a	! t0_kref+0x394:   	ldsh	[%g2 + 0xa], %o4
	.word	0x95102b8c	! t0_kref+0x398:   	taddcctv	%g0, 0xb8c, %o2
	.word	0x89a01884	! t0_kref+0x39c:   	fitos	%f4, %f4
	.word	0xde56201a	! t0_kref+0x3a0:   	ldsh	[%i0 + 0x1a], %o7
	.word	0xaf300000	! t0_kref+0x3a4:   	srl	%g0, %g0, %l7
	.word	0x90d82e38	! t0_kref+0x3a8:   	smulcc	%g0, 0xe38, %o0
	.word	0x9a10263f	! t0_kref+0x3ac:   	mov	0x63f, %o5
	.word	0x98e02475	! t0_kref+0x3b0:   	subccc	%g0, 0x475, %o4
	.word	0x9f302008	! t0_kref+0x3b4:   	srl	%g0, 0x8, %o7
	.word	0x89a000a4	! t0_kref+0x3b8:   	fnegs	%f4, %f4
	.word	0xd806401c	! t0_kref+0x3bc:   	ld	[%i1 + %i4], %o4
	.word	0xc028a03b	! t0_kref+0x3c0:   	clrb	[%g2 + 0x3b]
	.word	0x99280000	! t0_kref+0x3c4:   	sll	%g0, %g0, %o4
	.word	0x81db7153	! t0_kref+0x3c8:   	flush	%o5 - 0xead
	.word	0x89a9c044	! t0_kref+0x3cc:   	fmovdu	%fcc0, %f4, %f4
	.word	0x21480008	! t0_kref+0x3d0:   	fbn,a,pt	%fcc0, _kref+0x3f0
	.word	0x89a10824	! t0_kref+0x3d4:   	fadds	%f4, %f4, %f4
	.word	0x89a01a24	! t0_kref+0x3d8:   	fstoi	%f4, %f4
	.word	0x9e980000	! t0_kref+0x3dc:   	xorcc	%g0, %g0, %o7
	.word	0xc9063ffc	! t0_kref+0x3e0:   	ld	[%i0 - 4], %f4
	.word	0x89a01a44	! t0_kref+0x3e4:   	fdtoi	%f4, %f4
	.word	0x9ef83761	! t0_kref+0x3e8:   	sdivcc	%g0, -0x89f, %o7
	.word	0xc02e200d	! t0_kref+0x3ec:   	clrb	[%i0 + 0xd]
	.word	0xc900a030	! t0_kref+0x3f0:   	ld	[%g2 + 0x30], %f4
	.word	0x94400000	! t0_kref+0x3f4:   	addc	%g0, %g0, %o2
	.word	0x89a108a4	! t0_kref+0x3f8:   	fsubs	%f4, %f4, %f4
	.word	0xd41e6018	! t0_kref+0x3fc:   	ldd	[%i1 + 0x18], %o2
	.word	0x9fc10000	! t0_kref+0x400:   	call	%g4
	.word	0x89a01a24	! t0_kref+0x404:   	fstoi	%f4, %f4
	.word	0xc99f5018	! t0_kref+0x408:   	ldda	[%i5 + %i0]0x80, %f4
	.word	0x89b00ce4	! t0_kref+0x40c:   	fnot2s	%f4, %f4
	.word	0x80882cd5	! t0_kref+0x410:   	btst	0xcd5, %g0
	.word	0x89b106e4	! t0_kref+0x414:   	fmul8ulx16	%f4, %f4, %f4
	.word	0xc9b81019	! t0_kref+0x418:   	stda	%f4, [%g0 + %i1]0x80
	.word	0xdae81019	! t0_kref+0x41c:   	ldstuba	[%g0 + %i1]0x80, %o5
	.word	0x99b00000	! t0_kref+0x420:   	edge8	%g0, %g0, %o4
	.word	0xc9a6501c	! t0_kref+0x424:   	sta	%f4, [%i1 + %i4]0x80
	.word	0x80b03d7f	! t0_kref+0x428:   	orncc	%g0, -0x281, %g0
	.word	0x90700000	! t0_kref+0x42c:   	udiv	%g0, %g0, %o0
	.word	0x81a90a24	! t0_kref+0x430:   	fcmps	%fcc0, %f4, %f4
	.word	0x89a00144	! t0_kref+0x434:   	fabsd	%f4, %f4
	.word	0x9a703427	! t0_kref+0x438:   	udiv	%g0, -0xbd9, %o5
	.word	0x81da4017	! t0_kref+0x43c:   	flush	%o1 + %l7
	.word	0xc028a027	! t0_kref+0x440:   	clrb	[%g2 + 0x27]
	.word	0xaea83853	! t0_kref+0x444:   	andncc	%g0, -0x7ad, %l7
	.word	0xc028a01c	! t0_kref+0x448:   	clrb	[%g2 + 0x1c]
	.word	0xafb00020	! t0_kref+0x44c:   	edge8n	%g0, %g0, %l7
	.word	0x24800005	! t0_kref+0x450:   	ble,a	_kref+0x464
	.word	0xeed6105b	! t0_kref+0x454:   	ldsha	[%i0 + %i3]0x82, %l7
	.word	0x89a10d24	! t0_kref+0x458:   	fsmuld	%f4, %f4, %f4
	.word	0x89a00124	! t0_kref+0x45c:   	fabss	%f4, %f4
	.word	0x2a480001	! t0_kref+0x460:   	bcs,a,pt	%icc, _kref+0x464
	.word	0x9ea80000	! t0_kref+0x464:   	andncc	%g0, %g0, %o7
	.word	0x89b10984	! t0_kref+0x468:   	bshuffle	%f4, %f4, %f4
	.word	0x9ae00000	! t0_kref+0x46c:   	subccc	%g0, %g0, %o5
	.word	0x89b10e64	! t0_kref+0x470:   	fxnors	%f4, %f4, %f4
	.word	0x89a108c4	! t0_kref+0x474:   	fsubd	%f4, %f4, %f4
	.word	0xe43e3fe0	! t0_kref+0x478:   	std	%l2, [%i0 - 0x20]
	.word	0x94203885	! t0_kref+0x47c:   	sub	%g0, -0x77b, %o2
	.word	0x89a10924	! t0_kref+0x480:   	fmuls	%f4, %f4, %f4
	.word	0x81300000	! t0_kref+0x484:   	srl	%g0, %g0, %g0
	.word	0x91b10504	! t0_kref+0x488:   	fcmpgt16	%f4, %f4, %o0
	.word	0x81a90ac4	! t0_kref+0x48c:   	fcmped	%fcc0, %f4, %f4
	.word	0xe4ee9019	! t0_kref+0x490:   	ldstuba	[%i2 + %i1]0x80, %l2
	.word	0x81da8004	! t0_kref+0x494:   	flush	%o2 + %g4
	.word	0xee48a021	! t0_kref+0x498:   	ldsb	[%g2 + 0x21], %l7
	call	SYM(t0_subr3)
	.word	0x89a00524	! t0_kref+0x4a0:   	fsqrts	%f4, %f4
	.word	0xd810a01e	! t0_kref+0x4a4:   	lduh	[%g2 + 0x1e], %o4
	.word	0x91b00080	! t0_kref+0x4a8:   	edge16	%g0, %g0, %o0
	.word	0xaf44c000	! t0_kref+0x4ac:   	mov	%gsr, %l7
	.word	0xa78022f6	! t0_kref+0x4b0:   	mov	0x2f6, %gsr
	.word	0x945032f0	! t0_kref+0x4b4:   	umul	%g0, -0xd10, %o2
	.word	0xd20e6008	! t0_kref+0x4b8:   	ldub	[%i1 + 8], %o1
	.word	0xae8037eb	! t0_kref+0x4bc:   	addcc	%g0, -0x815, %l7
	.word	0x9e902d6b	! t0_kref+0x4c0:   	orcc	%g0, 0xd6b, %o7
	.word	0xc0200018	! t0_kref+0x4c4:   	clr	[%g0 + %i0]
	.word	0xee0e0000	! t0_kref+0x4c8:   	ldub	[%i0], %l7
	.word	0x89a10924	! t0_kref+0x4cc:   	fmuls	%f4, %f4, %f4
	.word	0xc030a02a	! t0_kref+0x4d0:   	clrh	[%g2 + 0x2a]
	.word	0x96183d1d	! t0_kref+0x4d4:   	xor	%g0, -0x2e3, %o3
	.word	0x9ed833b5	! t0_kref+0x4d8:   	smulcc	%g0, -0xc4b, %o7
	.word	0x9ad00000	! t0_kref+0x4dc:   	umulcc	%g0, %g0, %o5
	.word	0x98102f0a	! t0_kref+0x4e0:   	mov	0xf0a, %o4
	.word	0x80a80000	! t0_kref+0x4e4:   	andncc	%g0, %g0, %g0
	call	SYM(t0_subr1)
	.word	0x8d80305d	! t0_kref+0x4ec:   	mov	0xfffff05d, %fprs
	.word	0xae503051	! t0_kref+0x4f0:   	umul	%g0, -0xfaf, %l7
	.word	0xc0280018	! t0_kref+0x4f4:   	clrb	[%g0 + %i0]
	.word	0xc9a71019	! t0_kref+0x4f8:   	sta	%f4, [%i4 + %i1]0x80
	.word	0x89a00124	! t0_kref+0x4fc:   	fabss	%f4, %f4
	.word	0x9af82add	! t0_kref+0x500:   	sdivcc	%g0, 0xadd, %o5
	.word	0x89a01904	! t0_kref+0x504:   	fitod	%f4, %f4
	.word	0x9a4031ea	! t0_kref+0x508:   	addc	%g0, -0xe16, %o5
	.word	0x28800007	! t0_kref+0x50c:   	bleu,a	_kref+0x528
	.word	0x9e500000	! t0_kref+0x510:   	umul	%g0, %g0, %o7
	.word	0x89a109c4	! t0_kref+0x514:   	fdivd	%f4, %f4, %f4
	.word	0x89a10844	! t0_kref+0x518:   	faddd	%f4, %f4, %f4
	.word	0x91b000a0	! t0_kref+0x51c:   	edge16n	%g0, %g0, %o0
	.word	0x93280000	! t0_kref+0x520:   	sll	%g0, %g0, %o1
	.word	0x89a00544	! t0_kref+0x524:   	fsqrtd	%f4, %f4
	.word	0x96e00000	! t0_kref+0x528:   	subccc	%g0, %g0, %o3
	.word	0x92100000	! t0_kref+0x52c:   	clr	%o1
	.word	0x89b10aa4	! t0_kref+0x530:   	fpsub16s	%f4, %f4, %f4
	.word	0xaea83066	! t0_kref+0x534:   	andncc	%g0, -0xf9a, %l7
	.word	0x81dbc017	! t0_kref+0x538:   	flush	%o7 + %l7
	.word	0x9ac00000	! t0_kref+0x53c:   	addccc	%g0, %g0, %o5
	.word	0x89a000a4	! t0_kref+0x540:   	fnegs	%f4, %f4
	.word	0x9fc0001c	! t0_kref+0x544:   	call	%g0 + %i4
	.word	0xd6070018	! t0_kref+0x548:   	ld	[%i4 + %i0], %o3
	.word	0x80180000	! t0_kref+0x54c:   	xor	%g0, %g0, %g0
	.word	0x89a01904	! t0_kref+0x550:   	fitod	%f4, %f4
	.word	0xf36e401b	! t0_kref+0x554:   	prefetch	%i1 + %i3, 25
	.word	0x8143e03c	! t0_kref+0x558:   	membar	0x3c
	.word	0x9de3bfa0	! t0_kref+0x55c:   	save	%sp, -0x60, %sp
	.word	0x95ee2cac	! t0_kref+0x560:   	restore	%i0, 0xcac, %o2
	.word	0x9fc10000	! t0_kref+0x564:   	call	%g4
	.word	0x98003d44	! t0_kref+0x568:   	add	%g0, -0x2bc, %o4
	.word	0x9aa80000	! t0_kref+0x56c:   	andncc	%g0, %g0, %o5
	.word	0x001fffff	! t0_kref+0x570:   	illtrap	0x1fffff
	.word	0x89a00524	! t0_kref+0x574:   	fsqrts	%f4, %f4
	.word	0xc9200019	! t0_kref+0x578:   	st	%f4, [%g0 + %i1]
	.word	0x21800005	! t0_kref+0x57c:   	fbn,a	_kref+0x590
	.word	0x90800000	! t0_kref+0x580:   	addcc	%g0, %g0, %o0
	.word	0x81a90ac4	! t0_kref+0x584:   	fcmped	%fcc0, %f4, %f4
	.word	0x89a00124	! t0_kref+0x588:   	fabss	%f4, %f4
	.word	0x89b10ae4	! t0_kref+0x58c:   	fpsub32s	%f4, %f4, %f4
	.word	0xc368a043	! t0_kref+0x590:   	prefetch	%g2 + 0x43, 1
	.word	0x94002788	! t0_kref+0x594:   	add	%g0, 0x788, %o2
	.word	0x38800003	! t0_kref+0x598:   	bgu,a	_kref+0x5a4
	.word	0x89a109c4	! t0_kref+0x59c:   	fdivd	%f4, %f4, %f4
	.word	0x89a00144	! t0_kref+0x5a0:   	fabsd	%f4, %f4
	.word	0x89a00144	! t0_kref+0x5a4:   	fabsd	%f4, %f4
	.word	0x8d800000	! t0_kref+0x5a8:   	mov	%g0, %fprs
	.word	0x98100000	! t0_kref+0x5ac:   	clr	%o4
	.word	0x9208287d	! t0_kref+0x5b0:   	and	%g0, 0x87d, %o1
	.word	0x89a108a4	! t0_kref+0x5b4:   	fsubs	%f4, %f4, %f4
	.word	0x966037f5	! t0_kref+0x5b8:   	subc	%g0, -0x80b, %o3
	.word	0x92e00000	! t0_kref+0x5bc:   	subccc	%g0, %g0, %o1
	.word	0x89a108a4	! t0_kref+0x5c0:   	fsubs	%f4, %f4, %f4
	.word	0x89a018c4	! t0_kref+0x5c4:   	fdtos	%f4, %f4
	.word	0xee000018	! t0_kref+0x5c8:   	ld	[%g0 + %i0], %l7
	.word	0x9f300000	! t0_kref+0x5cc:   	srl	%g0, %g0, %o7
	.word	0x89a10944	! t0_kref+0x5d0:   	fmuld	%f4, %f4, %f4
	.word	0xc028a01c	! t0_kref+0x5d4:   	clrb	[%g2 + 0x1c]
	.word	0x89a000c4	! t0_kref+0x5d8:   	fnegd	%f4, %f4
	.word	0x9ad82328	! t0_kref+0x5dc:   	smulcc	%g0, 0x328, %o5
	.word	0x81580000	! t0_kref+0x5e0:   	flushw
	.word	0x97b00140	! t0_kref+0x5e4:   	edge32l	%g0, %g0, %o3
	.word	0xee08a009	! t0_kref+0x5e8:   	ldub	[%g2 + 9], %l7
	.word	0xc0ee1000	! t0_kref+0x5ec:   	ldstuba	[%i0]0x80, %g0
	.word	0x81a90a24	! t0_kref+0x5f0:   	fcmps	%fcc0, %f4, %f4
	.word	0x89a01a24	! t0_kref+0x5f4:   	fstoi	%f4, %f4
	.word	0xd43f4018	! t0_kref+0x5f8:   	std	%o2, [%i5 + %i0]
	.word	0x8143e04b	! t0_kref+0x5fc:   	membar	0x4b
	.word	0x8d800000	! t0_kref+0x600:   	mov	%g0, %fprs
	.word	0xd810a03a	! t0_kref+0x604:   	lduh	[%g2 + 0x3a], %o4
	.word	0x95b104c4	! t0_kref+0x608:   	fcmpne32	%f4, %f4, %o2
	.word	0x89a00124	! t0_kref+0x60c:   	fabss	%f4, %f4
	.word	0x89a01924	! t0_kref+0x610:   	fstod	%f4, %f4
	.word	0x89a018c4	! t0_kref+0x614:   	fdtos	%f4, %f4
	.word	0xec3e4000	! t0_kref+0x618:   	std	%l6, [%i1]
	.word	0x89a108a4	! t0_kref+0x61c:   	fsubs	%f4, %f4, %f4
	.word	0x98800000	! t0_kref+0x620:   	addcc	%g0, %g0, %o4
	.word	0xefe61000	! t0_kref+0x624:   	casa	[%i0]0x80, %g0, %l7
	.word	0xd016001b	! t0_kref+0x628:   	lduh	[%i0 + %i3], %o0
	.word	0x9e503392	! t0_kref+0x62c:   	umul	%g0, -0xc6e, %o7
	.word	0xd848a015	! t0_kref+0x630:   	ldsb	[%g2 + 0x15], %o4
	.word	0x89a108c4	! t0_kref+0x634:   	fsubd	%f4, %f4, %f4
	.word	0xec3e001d	! t0_kref+0x638:   	std	%l6, [%i0 + %i5]
	.word	0x89a01924	! t0_kref+0x63c:   	fstod	%f4, %f4
	.word	0x94500000	! t0_kref+0x640:   	umul	%g0, %g0, %o2
	.word	0xd840a038	! t0_kref+0x644:   	ldsw	[%g2 + 0x38], %o4
	.word	0xc028a020	! t0_kref+0x648:   	clrb	[%g2 + 0x20]
	.word	0xc900a02c	! t0_kref+0x64c:   	ld	[%g2 + 0x2c], %f4
	.word	0x89b10744	! t0_kref+0x650:   	fpack32	%f4, %f4, %f4
	.word	0x95703d7a	! t0_kref+0x654:   	popc	-0x286, %o2
	.word	0x9bb10544	! t0_kref+0x658:   	fcmpeq16	%f4, %f4, %o5
	.word	0x89b106e4	! t0_kref+0x65c:   	fmul8ulx16	%f4, %f4, %f4
	.word	0x89b10fa4	! t0_kref+0x660:   	fors	%f4, %f4, %f4
	.word	0x89a10924	! t0_kref+0x664:   	fmuls	%f4, %f4, %f4
	.word	0x95280000	! t0_kref+0x668:   	sll	%g0, %g0, %o2
	.word	0x89a10924	! t0_kref+0x66c:   	fmuls	%f4, %f4, %f4
	.word	0xc04e001a	! t0_kref+0x670:   	ldsb	[%i0 + %i2], %g0
	.word	0x89a10844	! t0_kref+0x674:   	faddd	%f4, %f4, %f4
	.word	0x89a10844	! t0_kref+0x678:   	faddd	%f4, %f4, %f4
	.word	0x89ab0024	! t0_kref+0x67c:   	fmovsuge	%fcc0, %f4, %f4
	.word	0x89a10844	! t0_kref+0x680:   	faddd	%f4, %f4, %f4
	.word	0x22800002	! t0_kref+0x684:   	be,a	_kref+0x68c
	.word	0xc99f5019	! t0_kref+0x688:   	ldda	[%i5 + %i1]0x80, %f4
	.word	0x86102008	! t0_kref+0x68c:   	mov	0x8, %g3
	.word	0x86a0e001	! t0_kref+0x690:   	subcc	%g3, 1, %g3
	.word	0x22800002	! t0_kref+0x694:   	be,a	_kref+0x69c
	.word	0x98b80000	! t0_kref+0x698:   	xnorcc	%g0, %g0, %o4
	.word	0x86102016	! t0_kref+0x69c:   	mov	0x16, %g3
	.word	0x86a0e001	! t0_kref+0x6a0:   	subcc	%g3, 1, %g3
	.word	0x22800017	! t0_kref+0x6a4:   	be,a	_kref+0x700
	.word	0xd616c018	! t0_kref+0x6a8:   	lduh	[%i3 + %i0], %o3
	.word	0x9010200f	! t0_kref+0x6ac:   	mov	0xf, %o0
	.word	0x81a90a44	! t0_kref+0x6b0:   	fcmpd	%fcc0, %f4, %f4
	.word	0x92d80000	! t0_kref+0x6b4:   	smulcc	%g0, %g0, %o1
	.word	0x91400000	! t0_kref+0x6b8:   	mov	%y, %o0
	.word	0x92800000	! t0_kref+0x6bc:   	addcc	%g0, %g0, %o1
	.word	0x96100000	! t0_kref+0x6c0:   	clr	%o3
	.word	0x89a000a4	! t0_kref+0x6c4:   	fnegs	%f4, %f4
	.word	0x89a00544	! t0_kref+0x6c8:   	fsqrtd	%f4, %f4
	.word	0x89a108a4	! t0_kref+0x6cc:   	fsubs	%f4, %f4, %f4
	.word	0x89b10e64	! t0_kref+0x6d0:   	fxnors	%f4, %f4, %f4
	.word	0x9eb02cc8	! t0_kref+0x6d4:   	orncc	%g0, 0xcc8, %o7
	.word	0xc3ee5000	! t0_kref+0x6d8:   	prefetcha	%i1, 1
	.word	0x81a90ac4	! t0_kref+0x6dc:   	fcmped	%fcc0, %f4, %f4
	.word	0x80b03f86	! t0_kref+0x6e0:   	orncc	%g0, -0x7a, %g0
	.word	0xec3e3fe0	! t0_kref+0x6e4:   	std	%l6, [%i0 - 0x20]
	.word	0xae90209d	! t0_kref+0x6e8:   	orcc	%g0, 0x9d, %l7
	.word	0x9fc00004	! t0_kref+0x6ec:   	call	%g0 + %g4
	.word	0xc9be501d	! t0_kref+0x6f0:   	stda	%f4, [%i1 + %i5]0x80
	.word	0x99180000	! t0_kref+0x6f4:   	tsubcctv	%g0, %g0, %o4
	.word	0x89a10844	! t0_kref+0x6f8:   	faddd	%f4, %f4, %f4
	.word	0x89a109c4	! t0_kref+0x6fc:   	fdivd	%f4, %f4, %f4
	.word	0x24800003	! t0_kref+0x700:   	ble,a	_kref+0x70c
	.word	0x97202a34	! t0_kref+0x704:   	mulscc	%g0, 0xa34, %o3
	.word	0x90a83cde	! t0_kref+0x708:   	andncc	%g0, -0x322, %o0
	.word	0x89b10744	! t0_kref+0x70c:   	fpack32	%f4, %f4, %f4
	.word	0x89a00544	! t0_kref+0x710:   	fsqrtd	%f4, %f4
	.word	0x89a01a44	! t0_kref+0x714:   	fdtoi	%f4, %f4
	.word	0x8d800000	! t0_kref+0x718:   	mov	%g0, %fprs
	.word	0x81dd2fd5	! t0_kref+0x71c:   	flush	%l4 + 0xfd5
	.word	0x89b10e64	! t0_kref+0x720:   	fxnors	%f4, %f4, %f4
	.word	0xd04e0000	! t0_kref+0x724:   	ldsb	[%i0], %o0
	.word	0xc00e3fe9	! t0_kref+0x728:   	ldub	[%i0 - 0x17], %g0
	.word	0x9aa82dd6	! t0_kref+0x72c:   	andncc	%g0, 0xdd6, %o5
	.word	0x89b10d24	! t0_kref+0x730:   	fandnot1s	%f4, %f4, %f4
	.word	0xe9f61000	! t0_kref+0x734:   	casxa	[%i0]0x80, %g0, %l4
	call	SYM(t0_subr0)
	.word	0xc99e101d	! t0_kref+0x73c:   	ldda	[%i0 + %i5]0x80, %f4
	.word	0xd608a01d	! t0_kref+0x740:   	ldub	[%g2 + 0x1d], %o3
	.word	0xde480019	! t0_kref+0x744:   	ldsb	[%g0 + %i1], %o7
	.word	0xd01e2000	! t0_kref+0x748:   	ldd	[%i0], %o0
	.word	0x95200000	! t0_kref+0x74c:   	mulscc	%g0, %g0, %o2
	.word	0x89a018c4	! t0_kref+0x750:   	fdtos	%f4, %f4
	.word	0xd6070018	! t0_kref+0x754:   	ld	[%i4 + %i0], %o3
	.word	0x96000000	! t0_kref+0x758:   	add	%g0, %g0, %o3
	.word	0xd440a028	! t0_kref+0x75c:   	ldsw	[%g2 + 0x28], %o2
	.word	0x89b00ce4	! t0_kref+0x760:   	fnot2s	%f4, %f4
	call	SYM(t0_subr2)
	.word	0x81580000	! t0_kref+0x768:   	flushw
	.word	0xc99e501d	! t0_kref+0x76c:   	ldda	[%i1 + %i5]0x80, %f4
	.word	0xc91fbd40	! t0_kref+0x770:   	ldd	[%fp - 0x2c0], %f4
	.word	0x9ae029ce	! t0_kref+0x774:   	subccc	%g0, 0x9ce, %o5
	.word	0xaef82a77	! t0_kref+0x778:   	sdivcc	%g0, 0xa77, %l7
	.word	0x89b10e44	! t0_kref+0x77c:   	fxnor	%f4, %f4, %f4
	.word	0x99b10484	! t0_kref+0x780:   	fcmple32	%f4, %f4, %o4
	.word	0xae180000	! t0_kref+0x784:   	xor	%g0, %g0, %l7
	.word	0xe67e3fe8	! t0_kref+0x788:   	swap	[%i0 - 0x18], %l3
	.word	0x92803b53	! t0_kref+0x78c:   	addcc	%g0, -0x4ad, %o1
	.word	0x81800000	! t0_kref+0x790:   	mov	%g0, %y
	.word	0x89a00524	! t0_kref+0x794:   	fsqrts	%f4, %f4
	.word	0x9fc10000	! t0_kref+0x798:   	call	%g4
	.word	0x89a01904	! t0_kref+0x79c:   	fitod	%f4, %f4
	.word	0x8610200a	! t0_kref+0x7a0:   	mov	0xa, %g3
	.word	0x86a0e001	! t0_kref+0x7a4:   	subcc	%g3, 1, %g3
	.word	0x22800015	! t0_kref+0x7a8:   	be,a	_kref+0x7fc
	.word	0xc028a01b	! t0_kref+0x7ac:   	clrb	[%g2 + 0x1b]
	.word	0x95200000	! t0_kref+0x7b0:   	mulscc	%g0, %g0, %o2
	.word	0xc030a020	! t0_kref+0x7b4:   	clrh	[%g2 + 0x20]
	.word	0x92d80000	! t0_kref+0x7b8:   	smulcc	%g0, %g0, %o1
	.word	0x89a01904	! t0_kref+0x7bc:   	fitod	%f4, %f4
	.word	0x91400000	! t0_kref+0x7c0:   	mov	%y, %o0
	.word	0xe83f4019	! t0_kref+0x7c4:   	std	%l4, [%i5 + %i1]
	.word	0x9e50233e	! t0_kref+0x7c8:   	umul	%g0, 0x33e, %o7
	.word	0x81800000	! t0_kref+0x7cc:   	mov	%g0, %y
	.word	0x93300000	! t0_kref+0x7d0:   	srl	%g0, %g0, %o1
	.word	0xf82e8000	! t0_kref+0x7d4:   	stb	%i4, [%i2]
	.word	0x81a90aa4	! t0_kref+0x7d8:   	fcmpes	%fcc0, %f4, %f4
	.word	0x9e9822af	! t0_kref+0x7dc:   	xorcc	%g0, 0x2af, %o7
	.word	0x89b10a04	! t0_kref+0x7e0:   	fpadd16	%f4, %f4, %f4
	.word	0x9b400000	! t0_kref+0x7e4:   	mov	%y, %o5
	.word	0x89a00524	! t0_kref+0x7e8:   	fsqrts	%f4, %f4
	.word	0xd2c01018	! t0_kref+0x7ec:   	ldswa	[%g0 + %i0]0x80, %o1
	.word	0x30bfffed	! t0_kref+0x7f0:   	ba,a	_kref+0x7a4
	.word	0x95b00040	! t0_kref+0x7f4:   	edge8l	%g0, %g0, %o2
	.word	0x89a000a4	! t0_kref+0x7f8:   	fnegs	%f4, %f4
	call	SYM(t0_subr3)
	.word	0x81800000	! t0_kref+0x800:   	mov	%g0, %y
	.word	0x89a10944	! t0_kref+0x804:   	fmuld	%f4, %f4, %f4
	.word	0xc0ae101a	! t0_kref+0x808:   	stba	%g0, [%i0 + %i2]0x80
	.word	0x89b00c00	! t0_kref+0x80c:   	fzero	%f4
	.word	0x89a00544	! t0_kref+0x810:   	fsqrtd	%f4, %f4
	.word	0x94b824bc	! t0_kref+0x814:   	xnorcc	%g0, 0x4bc, %o2
	.word	0x89a000c4	! t0_kref+0x818:   	fnegd	%f4, %f4
	.word	0x89a01924	! t0_kref+0x81c:   	fstod	%f4, %f4
	.word	0x89a01924	! t0_kref+0x820:   	fstod	%f4, %f4
	.word	0x94f80000	! t0_kref+0x824:   	sdivcc	%g0, %g0, %o2
	.word	0x90100000	! t0_kref+0x828:   	clr	%o0
	.word	0x89a10824	! t0_kref+0x82c:   	fadds	%f4, %f4, %f4
	.word	0x92d80000	! t0_kref+0x830:   	smulcc	%g0, %g0, %o1
	.word	0x89b10664	! t0_kref+0x834:   	fmul8x16au	%f4, %f4, %f4
	.word	0xc010a01e	! t0_kref+0x838:   	lduh	[%g2 + 0x1e], %g0
	.word	0xd01f4019	! t0_kref+0x83c:   	ldd	[%i5 + %i1], %o0
	.word	0xe41e7fe0	! t0_kref+0x840:   	ldd	[%i1 - 0x20], %l2
	.word	0x94100000	! t0_kref+0x844:   	clr	%o2
	.word	0xe09e101d	! t0_kref+0x848:   	ldda	[%i0 + %i5]0x80, %l0
	.word	0xd65e4000	! t0_kref+0x84c:   	ldx	[%i1], %o3
	.word	0x89a000a4	! t0_kref+0x850:   	fnegs	%f4, %f4
	.word	0xc0070019	! t0_kref+0x854:   	ld	[%i4 + %i1], %g0
	.word	0xde50a010	! t0_kref+0x858:   	ldsh	[%g2 + 0x10], %o7
	.word	0x9b300000	! t0_kref+0x85c:   	srl	%g0, %g0, %o5
	.word	0x2a480008	! t0_kref+0x860:   	bcs,a,pt	%icc, _kref+0x880
	.word	0x89a109c4	! t0_kref+0x864:   	fdivd	%f4, %f4, %f4
	.word	0xaec03c6e	! t0_kref+0x868:   	addccc	%g0, -0x392, %l7
	.word	0x89b00764	! t0_kref+0x86c:   	fpack16	%f4, %f4
	.word	0x89b10f84	! t0_kref+0x870:   	for	%f4, %f4, %f4
	.word	0x96a80000	! t0_kref+0x874:   	andncc	%g0, %g0, %o3
	.word	0x92d00000	! t0_kref+0x878:   	umulcc	%g0, %g0, %o1
	.word	0x98a80000	! t0_kref+0x87c:   	andncc	%g0, %g0, %o4
	.word	0xc920a014	! t0_kref+0x880:   	st	%f4, [%g2 + 0x14]
	.word	0x94a00000	! t0_kref+0x884:   	subcc	%g0, %g0, %o2
	.word	0x89a10844	! t0_kref+0x888:   	faddd	%f4, %f4, %f4
	.word	0x89b106a4	! t0_kref+0x88c:   	fmul8x16al	%f4, %f4, %f4
	.word	0x86102001	! t0_kref+0x890:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x894:   	bne,a	_kref+0x894
	.word	0x86a0e001	! t0_kref+0x898:   	subcc	%g3, 1, %g3
	.word	0x9af80000	! t0_kref+0x89c:   	sdivcc	%g0, %g0, %o5
	.word	0xb4102018	! t0_kref+0x8a0:   	mov	0x18, %i2
	.word	0xd4066008	! t0_kref+0x8a4:   	ld	[%i1 + 8], %o2
	.word	0x91b10504	! t0_kref+0x8a8:   	fcmpgt16	%f4, %f4, %o0
	.word	0x81a90ac4	! t0_kref+0x8ac:   	fcmped	%fcc0, %f4, %f4
	.word	0x8143c000	! t0_kref+0x8b0:   	stbar
	.word	0x36800006	! t0_kref+0x8b4:   	bge,a	_kref+0x8cc
	.word	0x89b107c4	! t0_kref+0x8b8:   	pdist	%f4, %f4, %f4
	.word	0x89a01904	! t0_kref+0x8bc:   	fitod	%f4, %f4
	.word	0x89b10ca4	! t0_kref+0x8c0:   	fandnot2s	%f4, %f4, %f4
	.word	0x9b400000	! t0_kref+0x8c4:   	mov	%y, %o5
	.word	0x97200000	! t0_kref+0x8c8:   	mulscc	%g0, %g0, %o3
	.word	0x81df0015	! t0_kref+0x8cc:   	flush	%i4 + %l5
	.word	0xae180000	! t0_kref+0x8d0:   	xor	%g0, %g0, %l7
	.word	0x94c03574	! t0_kref+0x8d4:   	addccc	%g0, -0xa8c, %o2
	.word	0xc9be1a5c	! t0_kref+0x8d8:   	stda	%f4, [%i0 + %i4]0xd2
	.word	0x9e000000	! t0_kref+0x8dc:   	add	%g0, %g0, %o7
	.word	0x89a00124	! t0_kref+0x8e0:   	fabss	%f4, %f4
	.word	0x86102015	! t0_kref+0x8e4:   	mov	0x15, %g3
	.word	0x86a0e001	! t0_kref+0x8e8:   	subcc	%g3, 1, %g3
	.word	0x2280000b	! t0_kref+0x8ec:   	be,a	_kref+0x918
	.word	0x95b10484	! t0_kref+0x8f0:   	fcmple32	%f4, %f4, %o2
	.word	0x89b10aa4	! t0_kref+0x8f4:   	fpsub16s	%f4, %f4, %f4
	.word	0x3c480002	! t0_kref+0x8f8:   	bpos,a,pt	%icc, _kref+0x900
	.word	0xc030a004	! t0_kref+0x8fc:   	clrh	[%g2 + 4]
	.word	0x89a01924	! t0_kref+0x900:   	fstod	%f4, %f4
	.word	0xe16e7fe0	! t0_kref+0x904:   	prefetch	%i1 - 0x20, 16
	.word	0x90b00000	! t0_kref+0x908:   	orncc	%g0, %g0, %o0
	.word	0xd8080018	! t0_kref+0x90c:   	ldub	[%g0 + %i0], %o4
	.word	0x89a10924	! t0_kref+0x910:   	fmuls	%f4, %f4, %f4
	.word	0x89a01904	! t0_kref+0x914:   	fitod	%f4, %f4
	.word	0x89a109a4	! t0_kref+0x918:   	fdivs	%f4, %f4, %f4
	.word	0x89b10ec4	! t0_kref+0x91c:   	fornot2	%f4, %f4, %f4
	.word	0xc0200019	! t0_kref+0x920:   	clr	[%g0 + %i1]
	.word	0x81580000	! t0_kref+0x924:   	flushw
	.word	0x89a108c4	! t0_kref+0x928:   	fsubd	%f4, %f4, %f4
	.word	0x89b10744	! t0_kref+0x92c:   	fpack32	%f4, %f4, %f4
	.word	0x80b825c5	! t0_kref+0x930:   	xnorcc	%g0, 0x5c5, %g0
	.word	0x20800002	! t0_kref+0x934:   	bn,a	_kref+0x93c
	.word	0xc9067fe0	! t0_kref+0x938:   	ld	[%i1 - 0x20], %f4
	.word	0x80202c70	! t0_kref+0x93c:   	sub	%g0, 0xc70, %g0
	.word	0x20800001	! t0_kref+0x940:   	bn,a	_kref+0x944
	.word	0xc040a030	! t0_kref+0x944:   	ldsw	[%g2 + 0x30], %g0
	.word	0x89b10c84	! t0_kref+0x948:   	fandnot2	%f4, %f4, %f4
	.word	0xee4e8019	! t0_kref+0x94c:   	ldsb	[%i2 + %i1], %l7
	.word	0x89a10944	! t0_kref+0x950:   	fmuld	%f4, %f4, %f4
	.word	0x89a94024	! t0_kref+0x954:   	fmovsug	%fcc0, %f4, %f4
	.word	0x24800007	! t0_kref+0x958:   	ble,a	_kref+0x974
	.word	0x90500000	! t0_kref+0x95c:   	umul	%g0, %g0, %o0
	.word	0x90d02f65	! t0_kref+0x960:   	umulcc	%g0, 0xf65, %o0
	call	SYM(t0_subr3)
	.word	0xa0500000	! t0_kref+0x968:   	umul	%g0, %g0, %l0
	.word	0x98000000	! t0_kref+0x96c:   	add	%g0, %g0, %o4
	.word	0x96b00000	! t0_kref+0x970:   	orncc	%g0, %g0, %o3
	.word	0x89a10924	! t0_kref+0x974:   	fmuls	%f4, %f4, %f4
	.word	0x9f203244	! t0_kref+0x978:   	mulscc	%g0, -0xdbc, %o7
	.word	0xe0be501d	! t0_kref+0x97c:   	stda	%l0, [%i1 + %i5]0x80
	.word	0x89b10e64	! t0_kref+0x980:   	fxnors	%f4, %f4, %f4
	.word	0x9ed83b85	! t0_kref+0x984:   	smulcc	%g0, -0x47b, %o7
	.word	0xc028a019	! t0_kref+0x988:   	clrb	[%g2 + 0x19]
	.word	0x96a80000	! t0_kref+0x98c:   	andncc	%g0, %g0, %o3
	.word	0x81a90a24	! t0_kref+0x990:   	fcmps	%fcc0, %f4, %f4
	.word	0x8143c000	! t0_kref+0x994:   	stbar
	.word	0x9fc00004	! t0_kref+0x998:   	call	%g0 + %g4
	.word	0xae703b5f	! t0_kref+0x99c:   	udiv	%g0, -0x4a1, %l7
	.word	0x93200000	! t0_kref+0x9a0:   	mulscc	%g0, %g0, %o1
	.word	0x91400000	! t0_kref+0x9a4:   	mov	%y, %o0
	.word	0x99b00100	! t0_kref+0x9a8:   	edge32	%g0, %g0, %o4
	.word	0x89a00124	! t0_kref+0x9ac:   	fabss	%f4, %f4
	.word	0x89a00524	! t0_kref+0x9b0:   	fsqrts	%f4, %f4
	.word	0xd03e4000	! t0_kref+0x9b4:   	std	%o0, [%i1]
	.word	0x9b200000	! t0_kref+0x9b8:   	mulscc	%g0, %g0, %o5
	.word	0x92702196	! t0_kref+0x9bc:   	udiv	%g0, 0x196, %o1
	.word	0x81b00140	! t0_kref+0x9c0:   	edge32l	%g0, %g0, %g0
	.word	0x89a108a4	! t0_kref+0x9c4:   	fsubs	%f4, %f4, %f4
	.word	0xc9266004	! t0_kref+0x9c8:   	st	%f4, [%i1 + 4]
	.word	0x80603571	! t0_kref+0x9cc:   	subc	%g0, -0xa8f, %g0
	.word	0x9fc10000	! t0_kref+0x9d0:   	call	%g4
	.word	0x96400000	! t0_kref+0x9d4:   	addc	%g0, %g0, %o3
	.word	0x89a108a4	! t0_kref+0x9d8:   	fsubs	%f4, %f4, %f4
	.word	0x89a108a4	! t0_kref+0x9dc:   	fsubs	%f4, %f4, %f4
	.word	0xc9063ff0	! t0_kref+0x9e0:   	ld	[%i0 - 0x10], %f4
	.word	0x89b10ea0	! t0_kref+0x9e4:   	fsrc1s	%f4, %f4
	.word	0x983033a9	! t0_kref+0x9e8:   	orn	%g0, -0xc57, %o4
	.word	0xc920a034	! t0_kref+0x9ec:   	st	%f4, [%g2 + 0x34]
	.word	0x96300000	! t0_kref+0x9f0:   	orn	%g0, %g0, %o3
	.word	0x89b10c44	! t0_kref+0x9f4:   	fnor	%f4, %f4, %f4
	.word	0xae200000	! t0_kref+0x9f8:   	neg	%g0, %l7
	.word	0xc0a01019	! t0_kref+0x9fc:   	sta	%g0, [%g0 + %i1]0x80
	.word	0x80080000	! t0_kref+0xa00:   	and	%g0, %g0, %g0
	.word	0x89a00044	! t0_kref+0xa04:   	fmovd	%f4, %f4
	.word	0x89a108c4	! t0_kref+0xa08:   	fsubd	%f4, %f4, %f4
	.word	0x80802a37	! t0_kref+0xa0c:   	addcc	%g0, 0xa37, %g0
	.word	0x89b10624	! t0_kref+0xa10:   	fmul8x16	%f4, %f4, %f4
	.word	0x91100000	! t0_kref+0xa14:   	taddcctv	%g0, %g0, %o0
	.word	0xc020a008	! t0_kref+0xa18:   	clr	[%g2 + 8]
	.word	0x89b10d84	! t0_kref+0xa1c:   	fxor	%f4, %f4, %f4
	.word	0x89a01904	! t0_kref+0xa20:   	fitod	%f4, %f4
	.word	0x9e9022fd	! t0_kref+0xa24:   	orcc	%g0, 0x2fd, %o7
	.word	0x81a90a24	! t0_kref+0xa28:   	fcmps	%fcc0, %f4, %f4
	.word	0xc900a010	! t0_kref+0xa2c:   	ld	[%g2 + 0x10], %f4
	.word	0x38800006	! t0_kref+0xa30:   	bgu,a	_kref+0xa48
	.word	0x81d83a8d	! t0_kref+0xa34:   	flush	%g0 - 0x573
	.word	0x89b10e44	! t0_kref+0xa38:   	fxnor	%f4, %f4, %f4
	.word	0xc91e7fe0	! t0_kref+0xa3c:   	ldd	[%i1 - 0x20], %f4
	.word	0xf36e3fe8	! t0_kref+0xa40:   	prefetch	%i0 - 0x18, 25
	.word	0xde00a038	! t0_kref+0xa44:   	ld	[%g2 + 0x38], %o7
	.word	0x89a00524	! t0_kref+0xa48:   	fsqrts	%f4, %f4
	.word	0xc368a00b	! t0_kref+0xa4c:   	prefetch	%g2 + 0xb, 1
	.word	0x912039c7	! t0_kref+0xa50:   	mulscc	%g0, -0x639, %o0
	.word	0x949826c2	! t0_kref+0xa54:   	xorcc	%g0, 0x6c2, %o2
	.word	0xc9be5a5c	! t0_kref+0xa58:   	stda	%f4, [%i1 + %i4]0xd2
	.word	0x89a01924	! t0_kref+0xa5c:   	fstod	%f4, %f4
	.word	0xc02e001a	! t0_kref+0xa60:   	clrb	[%i0 + %i2]
	.word	0x89a000a4	! t0_kref+0xa64:   	fnegs	%f4, %f4
	.word	0xfa16c000	! t0_kref+0xa68:   	lduh	[%i3], %i5
	.word	0x96a80000	! t0_kref+0xa6c:   	andncc	%g0, %g0, %o3
	.word	0x89a00124	! t0_kref+0xa70:   	fabss	%f4, %f4
	.word	0xc028a03d	! t0_kref+0xa74:   	clrb	[%g2 + 0x3d]
	.word	0xe81e7fe0	! t0_kref+0xa78:   	ldd	[%i1 - 0x20], %l4
	call	SYM(t0_subr2)
	.word	0xc028a028	! t0_kref+0xa80:   	clrb	[%g2 + 0x28]
	.word	0x89a10d24	! t0_kref+0xa84:   	fsmuld	%f4, %f4, %f4
	.word	0x91b00020	! t0_kref+0xa88:   	edge8n	%g0, %g0, %o0
	.word	0x89b10e44	! t0_kref+0xa8c:   	fxnor	%f4, %f4, %f4
	.word	0x89a00124	! t0_kref+0xa90:   	fabss	%f4, %f4
	.word	0x89a00044	! t0_kref+0xa94:   	fmovd	%f4, %f4
	.word	0x86102003	! t0_kref+0xa98:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0xa9c:   	bne,a	_kref+0xa9c
	.word	0x86a0e001	! t0_kref+0xaa0:   	subcc	%g3, 1, %g3
	.word	0x80900000	! t0_kref+0xaa4:   	tst	%g0
	.word	0x80183b90	! t0_kref+0xaa8:   	xor	%g0, -0x470, %g0
	.word	0x24800005	! t0_kref+0xaac:   	ble,a	_kref+0xac0
	.word	0xc906001c	! t0_kref+0xab0:   	ld	[%i0 + %i4], %f4
	.word	0xc020a028	! t0_kref+0xab4:   	clr	[%g2 + 0x28]
	.word	0x3a800002	! t0_kref+0xab8:   	bcc,a	_kref+0xac0
	.word	0x8143c000	! t0_kref+0xabc:   	stbar
	.word	0xafb10504	! t0_kref+0xac0:   	fcmpgt16	%f4, %f4, %l7
	.word	0xc02e7ff6	! t0_kref+0xac4:   	clrb	[%i1 - 0xa]
	.word	0x99280000	! t0_kref+0xac8:   	sll	%g0, %g0, %o4
	.word	0xa78023c8	! t0_kref+0xacc:   	mov	0x3c8, %gsr
	.word	0xeede1000	! t0_kref+0xad0:   	ldxa	[%i0]0x80, %l7
	.word	0xd0567ffa	! t0_kref+0xad4:   	ldsh	[%i1 - 6], %o0
	.word	0x89a108a4	! t0_kref+0xad8:   	fsubs	%f4, %f4, %f4
	.word	0xc030a000	! t0_kref+0xadc:   	clrh	[%g2]
	.word	0x89b00fe0	! t0_kref+0xae0:   	fones	%f4
	.word	0x80100000	! t0_kref+0xae4:   	clr	%g0
	.word	0xc02e8019	! t0_kref+0xae8:   	clrb	[%i2 + %i1]
	.word	0x89b10da4	! t0_kref+0xaec:   	fxors	%f4, %f4, %f4
	.word	0x90500000	! t0_kref+0xaf0:   	umul	%g0, %g0, %o0
	.word	0x9ea00000	! t0_kref+0xaf4:   	subcc	%g0, %g0, %o7
	.word	0x99280000	! t0_kref+0xaf8:   	sll	%g0, %g0, %o4
	call	SYM(t0_subr3)
	.word	0x99400000	! t0_kref+0xb00:   	mov	%y, %o4
	.word	0xc9865000	! t0_kref+0xb04:   	lda	[%i1]0x80, %f4
	.word	0x89b00c00	! t0_kref+0xb08:   	fzero	%f4
	.word	0x90500000	! t0_kref+0xb0c:   	umul	%g0, %g0, %o0
	.word	0x9ad80000	! t0_kref+0xb10:   	smulcc	%g0, %g0, %o5
	.word	0x90b03ad8	! t0_kref+0xb14:   	orncc	%g0, -0x528, %o0
	.word	0xde50a034	! t0_kref+0xb18:   	ldsh	[%g2 + 0x34], %o7
	.word	0x89a00124	! t0_kref+0xb1c:   	fabss	%f4, %f4
	.word	0xd200a004	! t0_kref+0xb20:   	ld	[%g2 + 4], %o1
	.word	0x8098367d	! t0_kref+0xb24:   	xorcc	%g0, -0x983, %g0
	.word	0xc028a00a	! t0_kref+0xb28:   	clrb	[%g2 + 0xa]
	.word	0x89b00764	! t0_kref+0xb2c:   	fpack16	%f4, %f4
	.word	0xda000018	! t0_kref+0xb30:   	ld	[%g0 + %i0], %o5
	.word	0x89a10944	! t0_kref+0xb34:   	fmuld	%f4, %f4, %f4
	.word	0x89a108a4	! t0_kref+0xb38:   	fsubs	%f4, %f4, %f4
	.word	0x89a01884	! t0_kref+0xb3c:   	fitos	%f4, %f4
	.word	0x001fffff	! t0_kref+0xb40:   	illtrap	0x1fffff
	.word	0x9a500000	! t0_kref+0xb44:   	umul	%g0, %g0, %o5
	.word	0x98b82845	! t0_kref+0xb48:   	xnorcc	%g0, 0x845, %o4
	.word	0x9fc00004	! t0_kref+0xb4c:   	call	%g0 + %g4
	.word	0x98800000	! t0_kref+0xb50:   	addcc	%g0, %g0, %o4
	.word	0x9b302017	! t0_kref+0xb54:   	srl	%g0, 0x17, %o5
	.word	0xd40e7ff5	! t0_kref+0xb58:   	ldub	[%i1 - 0xb], %o2
	.word	0x9a302acf	! t0_kref+0xb5c:   	orn	%g0, 0xacf, %o5
	.word	0x89b10704	! t0_kref+0xb60:   	fmuld8sux16	%f4, %f4, %f4
	.word	0xc00e8018	! t0_kref+0xb64:   	ldub	[%i2 + %i0], %g0
	.word	0xc0270019	! t0_kref+0xb68:   	clr	[%i4 + %i1]
	.word	0x81d96a25	! t0_kref+0xb6c:   	flush	%g5 + 0xa25
	.word	0x89a000a4	! t0_kref+0xb70:   	fnegs	%f4, %f4
	.word	0x89b10a64	! t0_kref+0xb74:   	fpadd32s	%f4, %f4, %f4
	.word	0xae882426	! t0_kref+0xb78:   	andcc	%g0, 0x426, %l7
	.word	0x89a10824	! t0_kref+0xb7c:   	fadds	%f4, %f4, %f4
	.word	0x89a01084	! t0_kref+0xb80:   	fxtos	%f4, %f4
	.word	0x34800008	! t0_kref+0xb84:   	bg,a	_kref+0xba4
	.word	0x89b10d24	! t0_kref+0xb88:   	fandnot1s	%f4, %f4, %f4
	.word	0x89a00044	! t0_kref+0xb8c:   	fmovd	%f4, %f4
	.word	0x92180000	! t0_kref+0xb90:   	xor	%g0, %g0, %o1
	.word	0xe3f61000	! t0_kref+0xb94:   	casxa	[%i0]0x80, %g0, %l1
	.word	0xd2063ff4	! t0_kref+0xb98:   	ld	[%i0 - 0xc], %o1
	.word	0x9fc10000	! t0_kref+0xb9c:   	call	%g4
	.word	0xd86e2002	! t0_kref+0xba0:   	ldstub	[%i0 + 2], %o4
	.word	0x81a90aa4	! t0_kref+0xba4:   	fcmpes	%fcc0, %f4, %f4
	.word	0x89a108c4	! t0_kref+0xba8:   	fsubd	%f4, %f4, %f4
	call	SYM(t0_subr1)
	.word	0x89a10844	! t0_kref+0xbb0:   	faddd	%f4, %f4, %f4
	.word	0x3e800003	! t0_kref+0xbb4:   	bvc,a	_kref+0xbc0
	.word	0x89a108c4	! t0_kref+0xbb8:   	fsubd	%f4, %f4, %f4
	.word	0x98400000	! t0_kref+0xbbc:   	addc	%g0, %g0, %o4
	.word	0x89a10924	! t0_kref+0xbc0:   	fmuls	%f4, %f4, %f4
	.word	0x80a80000	! t0_kref+0xbc4:   	andncc	%g0, %g0, %g0
	.word	0xde063ffc	! t0_kref+0xbc8:   	ld	[%i0 - 4], %o7
	.word	0xae5028a2	! t0_kref+0xbcc:   	umul	%g0, 0x8a2, %l7
	.word	0x977038b9	! t0_kref+0xbd0:   	popc	-0x747, %o3
	.word	0x80b00000	! t0_kref+0xbd4:   	orncc	%g0, %g0, %g0
	.word	0x9de3bfa0	! t0_kref+0xbd8:   	save	%sp, -0x60, %sp
	.word	0xb60e236b	! t0_kref+0xbdc:   	and	%i0, 0x36b, %i3
	.word	0x9feea361	! t0_kref+0xbe0:   	restore	%i2, 0x361, %o7
	.word	0x9b302004	! t0_kref+0xbe4:   	srl	%g0, 0x4, %o5
	.word	0xd83e4000	! t0_kref+0xbe8:   	std	%o4, [%i1]
	.word	0xd856001b	! t0_kref+0xbec:   	ldsh	[%i0 + %i3], %o4
	.word	0x89a000a4	! t0_kref+0xbf0:   	fnegs	%f4, %f4
	.word	0xc920a024	! t0_kref+0xbf4:   	st	%f4, [%g2 + 0x24]
	.word	0xd208a027	! t0_kref+0xbf8:   	ldub	[%g2 + 0x27], %o1
	.word	0x89a00544	! t0_kref+0xbfc:   	fsqrtd	%f4, %f4
	.word	0x9aa0307f	! t0_kref+0xc00:   	subcc	%g0, -0xf81, %o5
	.word	0x34800001	! t0_kref+0xc04:   	bg,a	_kref+0xc08
	.word	0x89a01a44	! t0_kref+0xc08:   	fdtoi	%f4, %f4
	call	SYM(t0_subr2)
	.word	0xc807bfe8	! t0_kref+0xc10:   	ld	[%fp - 0x18], %g4
	.word	0xd60e8019	! t0_kref+0xc14:   	ldub	[%i2 + %i1], %o3
	.word	0xae502d5d	! t0_kref+0xc18:   	umul	%g0, 0xd5d, %l7
	.word	0x89a00124	! t0_kref+0xc1c:   	fabss	%f4, %f4
	.word	0xae380000	! t0_kref+0xc20:   	not	%g0, %l7
	.word	0x81a90aa4	! t0_kref+0xc24:   	fcmpes	%fcc0, %f4, %f4
	.word	0x9140c000	! t0_kref+0xc28:   	mov	%asi, %o0
	.word	0x9fb10504	! t0_kref+0xc2c:   	fcmpgt16	%f4, %f4, %o7
	.word	0x91100000	! t0_kref+0xc30:   	taddcctv	%g0, %g0, %o0
	.word	0xc91fbf68	! t0_kref+0xc34:   	ldd	[%fp - 0x98], %f4
	.word	0x89a10924	! t0_kref+0xc38:   	fmuls	%f4, %f4, %f4
	.word	0xc028a020	! t0_kref+0xc3c:   	clrb	[%g2 + 0x20]
	.word	0x89a108a4	! t0_kref+0xc40:   	fsubs	%f4, %f4, %f4
	.word	0xf16e001a	! t0_kref+0xc44:   	prefetch	%i0 + %i2, 24
	.word	0x80503e85	! t0_kref+0xc48:   	umul	%g0, -0x17b, %g0
	.word	0x001fffff	! t0_kref+0xc4c:   	illtrap	0x1fffff
	.word	0x81a90a24	! t0_kref+0xc50:   	fcmps	%fcc0, %f4, %f4
	.word	0x86102002	! t0_kref+0xc54:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0xc58:   	bne,a	_kref+0xc58
	.word	0x86a0e001	! t0_kref+0xc5c:   	subcc	%g3, 1, %g3
	.word	0x89b10ca4	! t0_kref+0xc60:   	fandnot2s	%f4, %f4, %f4
	.word	0xe96e001c	! t0_kref+0xc64:   	prefetch	%i0 + %i4, 20
	.word	0x89b10624	! t0_kref+0xc68:   	fmul8x16	%f4, %f4, %f4
	.word	0x38800006	! t0_kref+0xc6c:   	bgu,a	_kref+0xc84
	.word	0x89aa4044	! t0_kref+0xc70:   	fmovde	%fcc0, %f4, %f4
	.word	0x89b10964	! t0_kref+0xc74:   	fpmerge	%f4, %f4, %f4
	.word	0x89a10844	! t0_kref+0xc78:   	faddd	%f4, %f4, %f4
	.word	0x89a01904	! t0_kref+0xc7c:   	fitod	%f4, %f4
	.word	0x89a10844	! t0_kref+0xc80:   	faddd	%f4, %f4, %f4
	.word	0xee10a024	! t0_kref+0xc84:   	lduh	[%g2 + 0x24], %l7
	.word	0xee0e401a	! t0_kref+0xc88:   	ldub	[%i1 + %i2], %l7
	.word	0x89a01a44	! t0_kref+0xc8c:   	fdtoi	%f4, %f4
	.word	0x86102001	! t0_kref+0xc90:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0xc94:   	bne,a	_kref+0xc94
	.word	0x86a0e001	! t0_kref+0xc98:   	subcc	%g3, 1, %g3
	.word	0x32800003	! t0_kref+0xc9c:   	bne,a	_kref+0xca8
	.word	0x89a00124	! t0_kref+0xca0:   	fabss	%f4, %f4
	.word	0x8143c000	! t0_kref+0xca4:   	stbar
	.word	0x89a10844	! t0_kref+0xca8:   	faddd	%f4, %f4, %f4
	.word	0xc1ee5000	! t0_kref+0xcac:   	prefetcha	%i1, 0
	.word	0x96e00000	! t0_kref+0xcb0:   	subccc	%g0, %g0, %o3
	.word	0x95b10404	! t0_kref+0xcb4:   	fcmple16	%f4, %f4, %o2
	.word	0x3e800002	! t0_kref+0xcb8:   	bvc,a	_kref+0xcc0
	.word	0x89a10924	! t0_kref+0xcbc:   	fmuls	%f4, %f4, %f4
	.word	0x89a10844	! t0_kref+0xcc0:   	faddd	%f4, %f4, %f4
	.word	0xe3202e10	! t0_kref+0xcc4:   	st	%f17, [%g0 + 0xe10]
	.word	0x9a500000	! t0_kref+0xcc8:   	umul	%g0, %g0, %o5
	.word	0x81dfa6b7	! t0_kref+0xccc:   	flush	%fp + 0x6b7
	.word	0xc91fbea0	! t0_kref+0xcd0:   	ldd	[%fp - 0x160], %f4
	.word	0xc028a01b	! t0_kref+0xcd4:   	clrb	[%g2 + 0x1b]
	.word	0xc0262010	! t0_kref+0xcd8:   	clr	[%i0 + 0x10]
	.word	0xd83e2018	! t0_kref+0xcdc:   	std	%o4, [%i0 + 0x18]
	.word	0x89b10d24	! t0_kref+0xce0:   	fandnot1s	%f4, %f4, %f4
	.word	0x9a300000	! t0_kref+0xce4:   	orn	%g0, %g0, %o5
	.word	0x89a108c4	! t0_kref+0xce8:   	fsubd	%f4, %f4, %f4
	.word	0x80c00000	! t0_kref+0xcec:   	addccc	%g0, %g0, %g0
	.word	0x34480008	! t0_kref+0xcf0:   	bg,a,pt	%icc, _kref+0xd10
	.word	0xaf400000	! t0_kref+0xcf4:   	mov	%y, %l7
	.word	0xc91fbfd8	! t0_kref+0xcf8:   	ldd	[%fp - 0x28], %f4
	.word	0xd0bf5018	! t0_kref+0xcfc:   	stda	%o0, [%i5 + %i0]0x80
	.word	0xd610a012	! t0_kref+0xd00:   	lduh	[%g2 + 0x12], %o3
	.word	0x9b282010	! t0_kref+0xd04:   	sll	%g0, 0x10, %o5
	.word	0x89b10f44	! t0_kref+0xd08:   	fornot1	%f4, %f4, %f4
	.word	0xc900a008	! t0_kref+0xd0c:   	ld	[%g2 + 8], %f4
	.word	0x89a000a4	! t0_kref+0xd10:   	fnegs	%f4, %f4
	.word	0x9f414000	! t0_kref+0xd14:   	mov	%pc, %o7
	.word	0x99400000	! t0_kref+0xd18:   	mov	%y, %o4
	.word	0x98900000	! t0_kref+0xd1c:   	orcc	%g0, %g0, %o4
	.word	0xc028a03c	! t0_kref+0xd20:   	clrb	[%g2 + 0x3c]
	.word	0xc028a00c	! t0_kref+0xd24:   	clrb	[%g2 + 0xc]
	.word	0x89a10824	! t0_kref+0xd28:   	fadds	%f4, %f4, %f4
	.word	0xd83e401d	! t0_kref+0xd2c:   	std	%o4, [%i1 + %i5]
	.word	0x89a01904	! t0_kref+0xd30:   	fitod	%f4, %f4
	.word	0x90500000	! t0_kref+0xd34:   	umul	%g0, %g0, %o0
	.word	0x89a10944	! t0_kref+0xd38:   	fmuld	%f4, %f4, %f4
	.word	0xc030a02a	! t0_kref+0xd3c:   	clrh	[%g2 + 0x2a]
	.word	0xc9000018	! t0_kref+0xd40:   	ld	[%g0 + %i0], %f4
	.word	0xd440a004	! t0_kref+0xd44:   	ldsw	[%g2 + 4], %o2
	.word	0x89a00524	! t0_kref+0xd48:   	fsqrts	%f4, %f4
	.word	0x9de3bfa0	! t0_kref+0xd4c:   	save	%sp, -0x60, %sp
	.word	0x9bef0000	! t0_kref+0xd50:   	restore	%i4, %g0, %o5
	call	SYM(t0_subr1)
	.word	0xa0983e84	! t0_kref+0xd58:   	xorcc	%g0, -0x17c, %l0
	.word	0xd610a01a	! t0_kref+0xd5c:   	lduh	[%g2 + 0x1a], %o3
	.word	0xc028a028	! t0_kref+0xd60:   	clrb	[%g2 + 0x28]
	.word	0xee7e600c	! t0_kref+0xd64:   	swap	[%i1 + 0xc], %l7
	.word	0x8143c000	! t0_kref+0xd68:   	stbar
	.word	0x81b10404	! t0_kref+0xd6c:   	fcmple16	%f4, %f4, %g0
	.word	0x99b00020	! t0_kref+0xd70:   	edge8n	%g0, %g0, %o4
	.word	0x89a109c4	! t0_kref+0xd74:   	fdivd	%f4, %f4, %f4
	.word	0x89a108a4	! t0_kref+0xd78:   	fsubs	%f4, %f4, %f4
	.word	0x91280000	! t0_kref+0xd7c:   	sll	%g0, %g0, %o0
	.word	0xec7e401c	! t0_kref+0xd80:   	swap	[%i1 + %i4], %l6
	.word	0xc99e101d	! t0_kref+0xd84:   	ldda	[%i0 + %i5]0x80, %f4
	.word	0x9fc00004	! t0_kref+0xd88:   	call	%g0 + %g4
	.word	0x8143c000	! t0_kref+0xd8c:   	stbar
	.word	0xaf30201b	! t0_kref+0xd90:   	srl	%g0, 0x1b, %l7
	.word	0x89a018c4	! t0_kref+0xd94:   	fdtos	%f4, %f4
	.word	0x89b00764	! t0_kref+0xd98:   	fpack16	%f4, %f4
	.word	0x89a000a4	! t0_kref+0xd9c:   	fnegs	%f4, %f4
	.word	0x89a00524	! t0_kref+0xda0:   	fsqrts	%f4, %f4
	.word	0x8143c000	! t0_kref+0xda4:   	stbar
	.word	0x9930200f	! t0_kref+0xda8:   	srl	%g0, 0xf, %o4
	.word	0xd896d018	! t0_kref+0xdac:   	lduha	[%i3 + %i0]0x80, %o4
	.word	0xc040a028	! t0_kref+0xdb0:   	ldsw	[%g2 + 0x28], %g0
	.word	0x38800005	! t0_kref+0xdb4:   	bgu,a	_kref+0xdc8
	.word	0xe81e2000	! t0_kref+0xdb8:   	ldd	[%i0], %l4
	.word	0x9e883f90	! t0_kref+0xdbc:   	andcc	%g0, -0x70, %o7
	.word	0x2a800005	! t0_kref+0xdc0:   	bcs,a	_kref+0xdd4
	.word	0xc9ee1000	! t0_kref+0xdc4:   	prefetcha	%i0, 4
	.word	0x89a108a4	! t0_kref+0xdc8:   	fsubs	%f4, %f4, %f4
	.word	0x89a108c4	! t0_kref+0xdcc:   	fsubd	%f4, %f4, %f4
	.word	0x9e183571	! t0_kref+0xdd0:   	xor	%g0, -0xa8f, %o7
	.word	0x32800003	! t0_kref+0xdd4:   	bne,a	_kref+0xde0
	.word	0xae003f3c	! t0_kref+0xdd8:   	add	%g0, -0xc4, %l7
	.word	0x99b105c4	! t0_kref+0xddc:   	fcmpeq32	%f4, %f4, %o4
	.word	0x30800005	! t0_kref+0xde0:   	ba,a	_kref+0xdf4
	.word	0xd04e2017	! t0_kref+0xde4:   	ldsb	[%i0 + 0x17], %o0
	.word	0x89b10ae4	! t0_kref+0xde8:   	fpsub32s	%f4, %f4, %f4
	.word	0xc0280018	! t0_kref+0xdec:   	clrb	[%g0 + %i0]
	.word	0xd406401c	! t0_kref+0xdf0:   	ld	[%i1 + %i4], %o2
	.word	0xd2000018	! t0_kref+0xdf4:   	ld	[%g0 + %i0], %o1
	.word	0x89a00524	! t0_kref+0xdf8:   	fsqrts	%f4, %f4
	.word	0x97b00140	! t0_kref+0xdfc:   	edge32l	%g0, %g0, %o3
	.word	0x89a10824	! t0_kref+0xe00:   	fadds	%f4, %f4, %f4
	.word	0x30800001	! t0_kref+0xe04:   	ba,a	_kref+0xe08
	.word	0x91b10544	! t0_kref+0xe08:   	fcmpeq16	%f4, %f4, %o0
	.word	0x90d80000	! t0_kref+0xe0c:   	smulcc	%g0, %g0, %o0
	.word	0xd648a002	! t0_kref+0xe10:   	ldsb	[%g2 + 2], %o3
	.word	0xaef80000	! t0_kref+0xe14:   	sdivcc	%g0, %g0, %l7
	.word	0x89a00124	! t0_kref+0xe18:   	fabss	%f4, %f4
	.word	0x9ed02817	! t0_kref+0xe1c:   	umulcc	%g0, 0x817, %o7
	.word	0xda0e600e	! t0_kref+0xe20:   	ldub	[%i1 + 0xe], %o5
	.word	0x89a01044	! t0_kref+0xe24:   	fdtox	%f4, %f4
	.word	0xe83e4000	! t0_kref+0xe28:   	std	%l4, [%i1]
	.word	0xd440a028	! t0_kref+0xe2c:   	ldsw	[%g2 + 0x28], %o2
	.word	0xd008a00c	! t0_kref+0xe30:   	ldub	[%g2 + 0xc], %o0
	.word	0x94b825a4	! t0_kref+0xe34:   	xnorcc	%g0, 0x5a4, %o2
	.word	0xd4562004	! t0_kref+0xe38:   	ldsh	[%i0 + 4], %o2
	.word	0x97200000	! t0_kref+0xe3c:   	mulscc	%g0, %g0, %o3
	.word	0x89aac024	! t0_kref+0xe40:   	fmovsge	%fcc0, %f4, %f4
	.word	0xc030a012	! t0_kref+0xe44:   	clrh	[%g2 + 0x12]
	.word	0x32800005	! t0_kref+0xe48:   	bne,a	_kref+0xe5c
	.word	0x89a10844	! t0_kref+0xe4c:   	faddd	%f4, %f4, %f4
	.word	0x90d80000	! t0_kref+0xe50:   	smulcc	%g0, %g0, %o0
	.word	0x89b10fa4	! t0_kref+0xe54:   	fors	%f4, %f4, %f4
	.word	0xc807bfe8	! t0_kref+0xe58:   	ld	[%fp - 0x18], %g4
	.word	0x89a108c4	! t0_kref+0xe5c:   	fsubd	%f4, %f4, %f4
	.word	0xc920a030	! t0_kref+0xe60:   	st	%f4, [%g2 + 0x30]
	.word	0xafb000a0	! t0_kref+0xe64:   	edge16n	%g0, %g0, %l7
	.word	0x96080000	! t0_kref+0xe68:   	and	%g0, %g0, %o3
	.word	0x22800003	! t0_kref+0xe6c:   	be,a	_kref+0xe78
	.word	0x001fffff	! t0_kref+0xe70:   	illtrap	0x1fffff
	.word	0x24800007	! t0_kref+0xe74:   	ble,a	_kref+0xe90
	.word	0xc91fbc18	! t0_kref+0xe78:   	ldd	[%fp - 0x3e8], %f4
	.word	0x97202df7	! t0_kref+0xe7c:   	mulscc	%g0, 0xdf7, %o3
	.word	0x89ab4024	! t0_kref+0xe80:   	fmovsle	%fcc0, %f4, %f4
	.word	0x96203c36	! t0_kref+0xe84:   	sub	%g0, -0x3ca, %o3
	.word	0x89a00524	! t0_kref+0xe88:   	fsqrts	%f4, %f4
	.word	0x81da0001	! t0_kref+0xe8c:   	flush	%o0 + %g1
	.word	0xc9be1a1a	! t0_kref+0xe90:   	stda	%f4, [%i0 + %i2]0xd0
	.word	0xc9180019	! t0_kref+0xe94:   	ldd	[%g0 + %i1], %f4
	.word	0xc0500019	! t0_kref+0xe98:   	ldsh	[%g0 + %i1], %g0
	.word	0xda0e8018	! t0_kref+0xe9c:   	ldub	[%i2 + %i0], %o5
	.word	0x89a01044	! t0_kref+0xea0:   	fdtox	%f4, %f4
	.word	0xe41e7ff8	! t0_kref+0xea4:   	ldd	[%i1 - 8], %l2
	.word	0x3a800001	! t0_kref+0xea8:   	bcc,a	_kref+0xeac
	.word	0x89b00c20	! t0_kref+0xeac:   	fzeros	%f4
	.word	0x89b00c00	! t0_kref+0xeb0:   	fzero	%f4
	.word	0x9ac00000	! t0_kref+0xeb4:   	addccc	%g0, %g0, %o5
	.word	0x81a90a44	! t0_kref+0xeb8:   	fcmpd	%fcc0, %f4, %f4
	.word	0x97b105c4	! t0_kref+0xebc:   	fcmpeq32	%f4, %f4, %o3
	.word	0x80880000	! t0_kref+0xec0:   	btst	%g0, %g0
	.word	0xc006200c	! t0_kref+0xec4:   	ld	[%i0 + 0xc], %g0
	.word	0x98600000	! t0_kref+0xec8:   	subc	%g0, %g0, %o4
	.word	0x9ee00000	! t0_kref+0xecc:   	subccc	%g0, %g0, %o7
	.word	0x91280000	! t0_kref+0xed0:   	sll	%g0, %g0, %o0
	.word	0x8143c000	! t0_kref+0xed4:   	stbar
	.word	0x81a90a44	! t0_kref+0xed8:   	fcmpd	%fcc0, %f4, %f4
	.word	0xc900a01c	! t0_kref+0xedc:   	ld	[%g2 + 0x1c], %f4
	.word	0x98d83c63	! t0_kref+0xee0:   	smulcc	%g0, -0x39d, %o4
	.word	0xaea80000	! t0_kref+0xee4:   	andncc	%g0, %g0, %l7
	.word	0xda080018	! t0_kref+0xee8:   	ldub	[%g0 + %i0], %o5
	.word	0xaed80000	! t0_kref+0xeec:   	smulcc	%g0, %g0, %l7
	.word	0x9b400000	! t0_kref+0xef0:   	mov	%y, %o5
	.word	0x99280000	! t0_kref+0xef4:   	sll	%g0, %g0, %o4
	.word	0x89a00524	! t0_kref+0xef8:   	fsqrts	%f4, %f4
	.word	0x35480002	! t0_kref+0xefc:   	fbue,a,pt	%fcc0, _kref+0xf04
	.word	0x95200000	! t0_kref+0xf00:   	mulscc	%g0, %g0, %o2
	.word	0xaf202b3a	! t0_kref+0xf04:   	mulscc	%g0, 0xb3a, %l7
	.word	0x9fc10000	! t0_kref+0xf08:   	call	%g4
	.word	0x9aa83cb6	! t0_kref+0xf0c:   	andncc	%g0, -0x34a, %o5
	.word	0x89b10664	! t0_kref+0xf10:   	fmul8x16au	%f4, %f4, %f4
	.word	0x89a10844	! t0_kref+0xf14:   	faddd	%f4, %f4, %f4
	.word	0xc900a03c	! t0_kref+0xf18:   	ld	[%g2 + 0x3c], %f4
	.word	0x81b00080	! t0_kref+0xf1c:   	edge16	%g0, %g0, %g0
	.word	0xae000000	! t0_kref+0xf20:   	add	%g0, %g0, %l7
	.word	0xd03e0000	! t0_kref+0xf24:   	std	%o0, [%i0]
	.word	0xe1ee101a	! t0_kref+0xf28:   	prefetcha	%i0 + %i2, 16
	.word	0x89a00524	! t0_kref+0xf2c:   	fsqrts	%f4, %f4
	.word	0x97400000	! t0_kref+0xf30:   	mov	%y, %o3
	.word	0x89b10ca4	! t0_kref+0xf34:   	fandnot2s	%f4, %f4, %f4
	.word	0x8610200c	! t0_kref+0xf38:   	mov	0xc, %g3
	.word	0x86a0e001	! t0_kref+0xf3c:   	subcc	%g3, 1, %g3
	.word	0x2280001a	! t0_kref+0xf40:   	be,a	_kref+0xfa8
	.word	0xd85f4019	! t0_kref+0xf44:   	ldx	[%i5 + %i1], %o4
	.word	0x3c800001	! t0_kref+0xf48:   	bpos,a	_kref+0xf4c
	.word	0x96e032d5	! t0_kref+0xf4c:   	subccc	%g0, -0xd2b, %o3
	.word	0x89a10924	! t0_kref+0xf50:   	fmuls	%f4, %f4, %f4
	.word	0x89b10ca4	! t0_kref+0xf54:   	fandnot2s	%f4, %f4, %f4
	.word	0xc900a014	! t0_kref+0xf58:   	ld	[%g2 + 0x14], %f4
	.word	0x9aa8221c	! t0_kref+0xf5c:   	andncc	%g0, 0x21c, %o5
	.word	0x89b106c4	! t0_kref+0xf60:   	fmul8sux16	%f4, %f4, %f4
	.word	0xc91fbc08	! t0_kref+0xf64:   	ldd	[%fp - 0x3f8], %f4
	.word	0x38480004	! t0_kref+0xf68:   	bgu,a,pt	%icc, _kref+0xf78
	.word	0x9520252b	! t0_kref+0xf6c:   	mulscc	%g0, 0x52b, %o2
	.word	0xd4de501d	! t0_kref+0xf70:   	ldxa	[%i1 + %i5]0x80, %o2
	.word	0x80d82f81	! t0_kref+0xf74:   	smulcc	%g0, 0xf81, %g0
	.word	0xc91fbec8	! t0_kref+0xf78:   	ldd	[%fp - 0x138], %f4
	.word	0x89a01924	! t0_kref+0xf7c:   	fstod	%f4, %f4
	.word	0xc02e4000	! t0_kref+0xf80:   	clrb	[%i1]
	.word	0x89b10c44	! t0_kref+0xf84:   	fnor	%f4, %f4, %f4
	.word	0xf207bfe0	! t0_kref+0xf88:   	ld	[%fp - 0x20], %i1
	.word	0x9fc00004	! t0_kref+0xf8c:   	call	%g0 + %g4
	.word	0xa1400000	! t0_kref+0xf90:   	mov	%y, %l0
	.word	0x81a90ac4	! t0_kref+0xf94:   	fcmped	%fcc0, %f4, %f4
	.word	0x94903922	! t0_kref+0xf98:   	orcc	%g0, -0x6de, %o2
	.word	0x98a834cd	! t0_kref+0xf9c:   	andncc	%g0, -0xb33, %o4
	.word	0xec3f4018	! t0_kref+0xfa0:   	std	%l6, [%i5 + %i0]
	.word	0xd8d81018	! t0_kref+0xfa4:   	ldxa	[%g0 + %i0]0x80, %o4
	.word	0x99300000	! t0_kref+0xfa8:   	srl	%g0, %g0, %o4
	.word	0xd640a030	! t0_kref+0xfac:   	ldsw	[%g2 + 0x30], %o3
	.word	0xc9bf5a58	! t0_kref+0xfb0:   	stda	%f4, [%i5 + %i0]0xd2
	.word	0xc0262000	! t0_kref+0xfb4:   	clr	[%i0]
	.word	0x30800005	! t0_kref+0xfb8:   	ba,a	_kref+0xfcc
	.word	0xc807bfe8	! t0_kref+0xfbc:   	ld	[%fp - 0x18], %g4
	.word	0x93203725	! t0_kref+0xfc0:   	mulscc	%g0, -0x8db, %o1
	.word	0x89a00524	! t0_kref+0xfc4:   	fsqrts	%f4, %f4
	.word	0xc9200018	! t0_kref+0xfc8:   	st	%f4, [%g0 + %i0]
	.word	0x9f282007	! t0_kref+0xfcc:   	sll	%g0, 0x7, %o7
	.word	0xc91e4000	! t0_kref+0xfd0:   	ldd	[%i1], %f4
	.word	0x9a900000	! t0_kref+0xfd4:   	orcc	%g0, %g0, %o5
	.word	0x89a00124	! t0_kref+0xfd8:   	fabss	%f4, %f4
	.word	0x89a018c4	! t0_kref+0xfdc:   	fdtos	%f4, %f4
	.word	0x34800006	! t0_kref+0xfe0:   	bg,a	_kref+0xff8
	.word	0x89b10ea0	! t0_kref+0xfe4:   	fsrc1s	%f4, %f4
	.word	0x99b00060	! t0_kref+0xfe8:   	edge8ln	%g0, %g0, %o4
	.word	0xb410200c	! t0_kref+0xfec:   	mov	0xc, %i2
	.word	0xf248001a	! t0_kref+0xff0:   	ldsb	[%g0 + %i2], %i1
	.word	0x89a01a24	! t0_kref+0xff4:   	fstoi	%f4, %f4
	.word	0x26800007	! t0_kref+0xff8:   	bl,a	_kref+0x1014
	.word	0x81b00080	! t0_kref+0xffc:   	edge16	%g0, %g0, %g0
	.word	0x89a10924	! t0_kref+0x1000:   	fmuls	%f4, %f4, %f4
	.word	0xae8026a7	! t0_kref+0x1004:   	addcc	%g0, 0x6a7, %l7
	.word	0xc0264000	! t0_kref+0x1008:   	clr	[%i1]
	.word	0x89a00144	! t0_kref+0x100c:   	fabsd	%f4, %f4
	.word	0x89a10944	! t0_kref+0x1010:   	fmuld	%f4, %f4, %f4
	.word	0x86102001	! t0_kref+0x1014:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x1018:   	bne,a	_kref+0x1018
	.word	0x86a0e001	! t0_kref+0x101c:   	subcc	%g3, 1, %g3
	.word	0xc030a008	! t0_kref+0x1020:   	clrh	[%g2 + 8]
	.word	0x93400000	! t0_kref+0x1024:   	mov	%y, %o1
	.word	0x89a108c4	! t0_kref+0x1028:   	fsubd	%f4, %f4, %f4
	.word	0x8610201e	! t0_kref+0x102c:   	mov	0x1e, %g3
	.word	0x86a0e001	! t0_kref+0x1030:   	subcc	%g3, 1, %g3
	.word	0x2280001f	! t0_kref+0x1034:   	be,a	_kref+0x10b0
	.word	0x89a01924	! t0_kref+0x1038:   	fstod	%f4, %f4
	.word	0x3cbffffd	! t0_kref+0x103c:   	bpos,a	_kref+0x1030
	.word	0x97b00060	! t0_kref+0x1040:   	edge8ln	%g0, %g0, %o3
	.word	0xde4e401a	! t0_kref+0x1044:   	ldsb	[%i1 + %i2], %o7
	.word	0xc056601a	! t0_kref+0x1048:   	ldsh	[%i1 + 0x1a], %g0
	.word	0x94c0326c	! t0_kref+0x104c:   	addccc	%g0, -0xd94, %o2
	.word	0xe81f4018	! t0_kref+0x1050:   	ldd	[%i5 + %i0], %l4
	.word	0x89a00024	! t0_kref+0x1054:   	fmovs	%f4, %f4
	.word	0x89a00544	! t0_kref+0x1058:   	fsqrtd	%f4, %f4
	.word	0x89a108a4	! t0_kref+0x105c:   	fsubs	%f4, %f4, %f4
	.word	0x80d03864	! t0_kref+0x1060:   	umulcc	%g0, -0x79c, %g0
	.word	0xc030a004	! t0_kref+0x1064:   	clrh	[%g2 + 4]
	.word	0xc030a03e	! t0_kref+0x1068:   	clrh	[%g2 + 0x3e]
	.word	0x89a00524	! t0_kref+0x106c:   	fsqrts	%f4, %f4
	.word	0x98f83720	! t0_kref+0x1070:   	sdivcc	%g0, -0x8e0, %o4
	.word	0x89a10824	! t0_kref+0x1074:   	fadds	%f4, %f4, %f4
	.word	0x92502e20	! t0_kref+0x1078:   	umul	%g0, 0xe20, %o1
	.word	0xda08a01d	! t0_kref+0x107c:   	ldub	[%g2 + 0x1d], %o5
	.word	0x89b00f04	! t0_kref+0x1080:   	fsrc2	%f4, %f4
	.word	0x89a01904	! t0_kref+0x1084:   	fitod	%f4, %f4
	.word	0x89a00524	! t0_kref+0x1088:   	fsqrts	%f4, %f4
	.word	0x81db401d	! t0_kref+0x108c:   	flush	%o5 + %i5
	.word	0x001fffff	! t0_kref+0x1090:   	illtrap	0x1fffff
	.word	0x89a000a4	! t0_kref+0x1094:   	fnegs	%f4, %f4
	.word	0x96702cfd	! t0_kref+0x1098:   	udiv	%g0, 0xcfd, %o3
	.word	0x95b10544	! t0_kref+0x109c:   	fcmpeq16	%f4, %f4, %o2
	.word	0x89a10824	! t0_kref+0x10a0:   	fadds	%f4, %f4, %f4
	.word	0x9a703cae	! t0_kref+0x10a4:   	udiv	%g0, -0x352, %o5
	.word	0x9530200b	! t0_kref+0x10a8:   	srl	%g0, 0xb, %o2
	.word	0x89a01a44	! t0_kref+0x10ac:   	fdtoi	%f4, %f4
	.word	0xd440a034	! t0_kref+0x10b0:   	ldsw	[%g2 + 0x34], %o2
	.word	0x94f80000	! t0_kref+0x10b4:   	sdivcc	%g0, %g0, %o2
	.word	0xc9be9a18	! t0_kref+0x10b8:   	stda	%f4, [%i2 + %i0]0xd0
	.word	0xe3b8a080	! t0_kref+0x10bc:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xc9be1a1a	! t0_kref+0x10c0:   	stda	%f4, [%i0 + %i2]0xd0
	.word	0xc0ae501a	! t0_kref+0x10c4:   	stba	%g0, [%i1 + %i2]0x80
	.word	0xc99f5019	! t0_kref+0x10c8:   	ldda	[%i5 + %i1]0x80, %f4
	.word	0x9e600000	! t0_kref+0x10cc:   	subc	%g0, %g0, %o7
	.word	0xc0300019	! t0_kref+0x10d0:   	clrh	[%g0 + %i1]
	.word	0xd4500019	! t0_kref+0x10d4:   	ldsh	[%g0 + %i1], %o2
	.word	0x91b00000	! t0_kref+0x10d8:   	edge8	%g0, %g0, %o0
	.word	0xc0f81018	! t0_kref+0x10dc:   	swapa	[%g0 + %i0]0x80, %g0
	.word	0xb4103ff8	! t0_kref+0x10e0:   	mov	0xfffffff8, %i2
	.word	0x9fc00004	! t0_kref+0x10e4:   	call	%g0 + %g4
	.word	0x89b10ac4	! t0_kref+0x10e8:   	fpsub32	%f4, %f4, %f4
	.word	0xd00e8018	! t0_kref+0x10ec:   	ldub	[%i2 + %i0], %o0
	.word	0x89a00124	! t0_kref+0x10f0:   	fabss	%f4, %f4
	.word	0x38480006	! t0_kref+0x10f4:   	bgu,a,pt	%icc, _kref+0x110c
	.word	0x91b10484	! t0_kref+0x10f8:   	fcmple32	%f4, %f4, %o0
	.word	0x9fb10484	! t0_kref+0x10fc:   	fcmple32	%f4, %f4, %o7
	.word	0x9e080000	! t0_kref+0x1100:   	and	%g0, %g0, %o7
	.word	0x89a018c4	! t0_kref+0x1104:   	fdtos	%f4, %f4
	.word	0xd44e8019	! t0_kref+0x1108:   	ldsb	[%i2 + %i1], %o2
	.word	0x89a108c4	! t0_kref+0x110c:   	fsubd	%f4, %f4, %f4
	.word	0x24480006	! t0_kref+0x1110:   	ble,a,pt	%icc, _kref+0x1128
	.word	0x89a000a4	! t0_kref+0x1114:   	fnegs	%f4, %f4
	.word	0xc99f5018	! t0_kref+0x1118:   	ldda	[%i5 + %i0]0x80, %f4
	.word	0x81a90a44	! t0_kref+0x111c:   	fcmpd	%fcc0, %f4, %f4
	.word	0x9f302001	! t0_kref+0x1120:   	srl	%g0, 0x1, %o7
	.word	0xc920a008	! t0_kref+0x1124:   	st	%f4, [%g2 + 8]
	.word	0x89a000a4	! t0_kref+0x1128:   	fnegs	%f4, %f4
	.word	0x96f82db7	! t0_kref+0x112c:   	sdivcc	%g0, 0xdb7, %o3
	.word	0x94b00000	! t0_kref+0x1130:   	orncc	%g0, %g0, %o2
	.word	0xae000000	! t0_kref+0x1134:   	add	%g0, %g0, %l7
	.word	0x89a01a24	! t0_kref+0x1138:   	fstoi	%f4, %f4
	.word	0xc91e001d	! t0_kref+0x113c:   	ldd	[%i0 + %i5], %f4
	.word	0x81dcade8	! t0_kref+0x1140:   	flush	%l2 + 0xde8
	.word	0x9a10331f	! t0_kref+0x1144:   	mov	0xfffff31f, %o5
	.word	0xd00e2015	! t0_kref+0x1148:   	ldub	[%i0 + 0x15], %o0
	.word	0x89a01904	! t0_kref+0x114c:   	fitod	%f4, %f4
	.word	0x98983bd9	! t0_kref+0x1150:   	xorcc	%g0, -0x427, %o4
	.word	0x8143e014	! t0_kref+0x1154:   	membar	0x14
	.word	0xc036600c	! t0_kref+0x1158:   	clrh	[%i1 + 0xc]
	.word	0xae383cfe	! t0_kref+0x115c:   	xnor	%g0, -0x302, %l7
	.word	0x86102002	! t0_kref+0x1160:   	mov	0x2, %g3
	.word	0x86a0e001	! t0_kref+0x1164:   	subcc	%g3, 1, %g3
	.word	0x22800003	! t0_kref+0x1168:   	be,a	_kref+0x1174
	.word	0xd64e6005	! t0_kref+0x116c:   	ldsb	[%i1 + 5], %o3
	.word	0x98b02535	! t0_kref+0x1170:   	orncc	%g0, 0x535, %o4
	.word	0x89a000a4	! t0_kref+0x1174:   	fnegs	%f4, %f4
	.word	0x89b007a4	! t0_kref+0x1178:   	fpackfix	%f4, %f4
	.word	0x2c800003	! t0_kref+0x117c:   	bneg,a	_kref+0x1188
	.word	0xc0200018	! t0_kref+0x1180:   	clr	[%g0 + %i0]
	.word	0x81a90ac4	! t0_kref+0x1184:   	fcmped	%fcc0, %f4, %f4
	.word	0xec78a000	! t0_kref+0x1188:   	swap	[%g2], %l6
	.word	0x81300000	! t0_kref+0x118c:   	srl	%g0, %g0, %g0
	.word	0xfb6e7ff8	! t0_kref+0x1190:   	prefetch	%i1 - 8, 29
	.word	0xc9a71019	! t0_kref+0x1194:   	sta	%f4, [%i4 + %i1]0x80
	.word	0xd450a034	! t0_kref+0x1198:   	ldsh	[%g2 + 0x34], %o2
	.word	0x9fb00240	! t0_kref+0x119c:   	array16	%g0, %g0, %o7
	.word	0x27480004	! t0_kref+0x11a0:   	fbul,a,pt	%fcc0, _kref+0x11b0
	.word	0x89a01a44	! t0_kref+0x11a4:   	fdtoi	%f4, %f4
	.word	0x91b00040	! t0_kref+0x11a8:   	edge8l	%g0, %g0, %o0
	.word	0xc0b01019	! t0_kref+0x11ac:   	stha	%g0, [%g0 + %i1]0x80
	.word	0x81a90a44	! t0_kref+0x11b0:   	fcmpd	%fcc0, %f4, %f4
	.word	0x9ed0205f	! t0_kref+0x11b4:   	umulcc	%g0, 0x5f, %o7
	.word	0xc020a020	! t0_kref+0x11b8:   	clr	[%g2 + 0x20]
	.word	0xee10a03a	! t0_kref+0x11bc:   	lduh	[%g2 + 0x3a], %l7
	.word	0x97300000	! t0_kref+0x11c0:   	srl	%g0, %g0, %o3
	.word	0x98300000	! t0_kref+0x11c4:   	orn	%g0, %g0, %o4
	.word	0x9de3bfa0	! t0_kref+0x11c8:   	save	%sp, -0x60, %sp
	.word	0xbae64019	! t0_kref+0x11cc:   	subccc	%i1, %i1, %i5
	.word	0x81ee8018	! t0_kref+0x11d0:   	restore	%i2, %i0, %g0
	.word	0xc02e8018	! t0_kref+0x11d4:   	clrb	[%i2 + %i0]
	.word	0xc920a01c	! t0_kref+0x11d8:   	st	%f4, [%g2 + 0x1c]
	.word	0x81a90aa4	! t0_kref+0x11dc:   	fcmpes	%fcc0, %f4, %f4
	.word	0x89a10924	! t0_kref+0x11e0:   	fmuls	%f4, %f4, %f4
	.word	0xae382d84	! t0_kref+0x11e4:   	xnor	%g0, 0xd84, %l7
	.word	0x878020e0	! t0_kref+0x11e8:   	mov	0xe0, %asi
	.word	0xd2080018	! t0_kref+0x11ec:   	ldub	[%g0 + %i0], %o1
	.word	0x89a10844	! t0_kref+0x11f0:   	faddd	%f4, %f4, %f4
	.word	0x89b10e44	! t0_kref+0x11f4:   	fxnor	%f4, %f4, %f4
	.word	0xc04e7ff1	! t0_kref+0x11f8:   	ldsb	[%i1 - 0xf], %g0
	.word	0x81a90a44	! t0_kref+0x11fc:   	fcmpd	%fcc0, %f4, %f4
	.word	0xd696505b	! t0_kref+0x1200:   	lduha	[%i1 + %i3]0x82, %o3
	.word	0xae400000	! t0_kref+0x1204:   	addc	%g0, %g0, %l7
	.word	0x81a90a44	! t0_kref+0x1208:   	fcmpd	%fcc0, %f4, %f4
	.word	0xc02e8019	! t0_kref+0x120c:   	clrb	[%i2 + %i1]
	.word	0x961022b1	! t0_kref+0x1210:   	mov	0x2b1, %o3
	.word	0x89a10944	! t0_kref+0x1214:   	fmuld	%f4, %f4, %f4
	.word	0x26800006	! t0_kref+0x1218:   	bl,a	_kref+0x1230
	.word	0xe5ee101a	! t0_kref+0x121c:   	prefetcha	%i0 + %i2, 18
	.word	0x91200000	! t0_kref+0x1220:   	mulscc	%g0, %g0, %o0
	.word	0xc02e8019	! t0_kref+0x1224:   	clrb	[%i2 + %i1]
	.word	0x89a01904	! t0_kref+0x1228:   	fitod	%f4, %f4
	.word	0xde10a032	! t0_kref+0x122c:   	lduh	[%g2 + 0x32], %o7
	.word	0x89a00524	! t0_kref+0x1230:   	fsqrts	%f4, %f4
	.word	0x8143c000	! t0_kref+0x1234:   	stbar
	.word	0xd6d81018	! t0_kref+0x1238:   	ldxa	[%g0 + %i0]0x80, %o3
	.word	0xc028a023	! t0_kref+0x123c:   	clrb	[%g2 + 0x23]
	.word	0x9a800000	! t0_kref+0x1240:   	addcc	%g0, %g0, %o5
	.word	0x2a800008	! t0_kref+0x1244:   	bcs,a	_kref+0x1264
	.word	0xc9bf5a59	! t0_kref+0x1248:   	stda	%f4, [%i5 + %i1]0xd2
	.word	0x9bb000c0	! t0_kref+0x124c:   	edge16l	%g0, %g0, %o5
	.word	0xc91fbf40	! t0_kref+0x1250:   	ldd	[%fp - 0xc0], %f4
	.word	0x98e03582	! t0_kref+0x1254:   	subccc	%g0, -0xa7e, %o4
	.word	0x80603542	! t0_kref+0x1258:   	subc	%g0, -0xabe, %g0
	.word	0x34480001	! t0_kref+0x125c:   	bg,a,pt	%icc, _kref+0x1260
	.word	0x9080355f	! t0_kref+0x1260:   	addcc	%g0, -0xaa1, %o0
	.word	0x001fffff	! t0_kref+0x1264:   	illtrap	0x1fffff
	.word	0xc0ae101a	! t0_kref+0x1268:   	stba	%g0, [%i0 + %i2]0x80
	.word	0xc76e2010	! t0_kref+0x126c:   	prefetch	%i0 + 0x10, 3
	.word	0x89a108c4	! t0_kref+0x1270:   	fsubd	%f4, %f4, %f4
	.word	0x89a10944	! t0_kref+0x1274:   	fmuld	%f4, %f4, %f4
	.word	0x89b10d84	! t0_kref+0x1278:   	fxor	%f4, %f4, %f4
	.word	0xc0067ffc	! t0_kref+0x127c:   	ld	[%i1 - 4], %g0
	.word	0xc920a008	! t0_kref+0x1280:   	st	%f4, [%g2 + 8]
	.word	0x89a90044	! t0_kref+0x1284:   	fmovdl	%fcc0, %f4, %f4
	.word	0x89a10824	! t0_kref+0x1288:   	fadds	%f4, %f4, %f4
	.word	0x94800000	! t0_kref+0x128c:   	addcc	%g0, %g0, %o2
	.word	0x89b10de4	! t0_kref+0x1290:   	fnands	%f4, %f4, %f4
	.word	0x89a108a4	! t0_kref+0x1294:   	fsubs	%f4, %f4, %f4
	.word	0x9f282014	! t0_kref+0x1298:   	sll	%g0, 0x14, %o7
	.word	0x3c800002	! t0_kref+0x129c:   	bpos,a	_kref+0x12a4
	.word	0x89a10944	! t0_kref+0x12a0:   	fmuld	%f4, %f4, %f4
	.word	0x81800000	! t0_kref+0x12a4:   	mov	%g0, %y
	.word	0x86102004	! t0_kref+0x12a8:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x12ac:   	bne,a	_kref+0x12ac
	.word	0x86a0e001	! t0_kref+0x12b0:   	subcc	%g3, 1, %g3
	.word	0x89a00544	! t0_kref+0x12b4:   	fsqrtd	%f4, %f4
	.word	0xc0062008	! t0_kref+0x12b8:   	ld	[%i0 + 8], %g0
	.word	0x93b10504	! t0_kref+0x12bc:   	fcmpgt16	%f4, %f4, %o1
	.word	0x89a01884	! t0_kref+0x12c0:   	fitos	%f4, %f4
	.word	0x99b00000	! t0_kref+0x12c4:   	edge8	%g0, %g0, %o4
	.word	0xd610a01c	! t0_kref+0x12c8:   	lduh	[%g2 + 0x1c], %o3
	.word	0xc807bff0	! t0_kref+0x12cc:   	ld	[%fp - 0x10], %g4
	.word	0x89b10964	! t0_kref+0x12d0:   	fpmerge	%f4, %f4, %f4
	.word	0x81400000	! t0_kref+0x12d4:   	mov	%y, %g0
	.word	0xd01e7fe0	! t0_kref+0x12d8:   	ldd	[%i1 - 0x20], %o0
	.word	0x89a10824	! t0_kref+0x12dc:   	fadds	%f4, %f4, %f4
	.word	0x89a000a4	! t0_kref+0x12e0:   	fnegs	%f4, %f4
	.word	0x89a01a24	! t0_kref+0x12e4:   	fstoi	%f4, %f4
	.word	0xee80105c	! t0_kref+0x12e8:   	lda	[%g0 + %i4]0x82, %l7
	.word	0x96b00000	! t0_kref+0x12ec:   	orncc	%g0, %g0, %o3
	.word	0x89a000a4	! t0_kref+0x12f0:   	fnegs	%f4, %f4
	.word	0xd248a00b	! t0_kref+0x12f4:   	ldsb	[%g2 + 0xb], %o1
	.word	0xe81e2018	! t0_kref+0x12f8:   	ldd	[%i0 + 0x18], %l4
	.word	0x9e80292b	! t0_kref+0x12fc:   	addcc	%g0, 0x92b, %o7
	.word	0x89a108a4	! t0_kref+0x1300:   	fsubs	%f4, %f4, %f4
	.word	0xfdee101a	! t0_kref+0x1304:   	prefetcha	%i0 + %i2, 30
	.word	0x94a82758	! t0_kref+0x1308:   	andncc	%g0, 0x758, %o2
	.word	0x89a80024	! t0_kref+0x130c:   	fmovsn	%fcc0, %f4, %f4
	.word	0x800034f8	! t0_kref+0x1310:   	add	%g0, -0xb08, %g0
	.word	0x89b10ac4	! t0_kref+0x1314:   	fpsub32	%f4, %f4, %f4
	.word	0x997039f6	! t0_kref+0x1318:   	popc	-0x60a, %o4
	.word	0xc906200c	! t0_kref+0x131c:   	ld	[%i0 + 0xc], %f4
	.word	0xc0200019	! t0_kref+0x1320:   	clr	[%g0 + %i1]
	.word	0xc900a034	! t0_kref+0x1324:   	ld	[%g2 + 0x34], %f4
	.word	0xc920a020	! t0_kref+0x1328:   	st	%f4, [%g2 + 0x20]
	.word	0xd056401b	! t0_kref+0x132c:   	ldsh	[%i1 + %i3], %o0
	.word	0x81a90a44	! t0_kref+0x1330:   	fcmpd	%fcc0, %f4, %f4
	.word	0x22800006	! t0_kref+0x1334:   	be,a	_kref+0x134c
	.word	0x80a02ea6	! t0_kref+0x1338:   	cmp	%g0, 0xea6
	.word	0x8128200e	! t0_kref+0x133c:   	sll	%g0, 0xe, %g0
	.word	0xd810a016	! t0_kref+0x1340:   	lduh	[%g2 + 0x16], %o4
	.word	0x89a10844	! t0_kref+0x1344:   	faddd	%f4, %f4, %f4
	.word	0x81a90a44	! t0_kref+0x1348:   	fcmpd	%fcc0, %f4, %f4
	.word	0xc9070018	! t0_kref+0x134c:   	ld	[%i4 + %i0], %f4
	.word	0x89a00524	! t0_kref+0x1350:   	fsqrts	%f4, %f4
	.word	0xd0566012	! t0_kref+0x1354:   	ldsh	[%i1 + 0x12], %o0
	.word	0x8143c000	! t0_kref+0x1358:   	stbar
	.word	0xae800000	! t0_kref+0x135c:   	addcc	%g0, %g0, %l7
	.word	0x8143c000	! t0_kref+0x1360:   	stbar
	.word	0xc028a005	! t0_kref+0x1364:   	clrb	[%g2 + 5]
	.word	0xc91fbd48	! t0_kref+0x1368:   	ldd	[%fp - 0x2b8], %f4
	.word	0x96100000	! t0_kref+0x136c:   	clr	%o3
	.word	0xaed021a6	! t0_kref+0x1370:   	umulcc	%g0, 0x1a6, %l7
	.word	0x9e502513	! t0_kref+0x1374:   	umul	%g0, 0x513, %o7
	.word	0x2b800002	! t0_kref+0x1378:   	fbug,a	_kref+0x1380
	.word	0x96d034aa	! t0_kref+0x137c:   	umulcc	%g0, -0xb56, %o3
	.word	0xc91e4000	! t0_kref+0x1380:   	ldd	[%i1], %f4
	.word	0x9b302018	! t0_kref+0x1384:   	srl	%g0, 0x18, %o5
	.word	0x96700000	! t0_kref+0x1388:   	udiv	%g0, %g0, %o3
	.word	0x98c00000	! t0_kref+0x138c:   	addccc	%g0, %g0, %o4
	.word	0xaea822d1	! t0_kref+0x1390:   	andncc	%g0, 0x2d1, %l7
	.word	0x89a109c4	! t0_kref+0x1394:   	fdivd	%f4, %f4, %f4
	.word	0xc02e8019	! t0_kref+0x1398:   	clrb	[%i2 + %i1]
	.word	0x9b280000	! t0_kref+0x139c:   	sll	%g0, %g0, %o5
	.word	0x89b10904	! t0_kref+0x13a0:   	faligndata	%f4, %f4, %f4
	.word	0xae08204c	! t0_kref+0x13a4:   	and	%g0, 0x4c, %l7
	.word	0xd81e7ff8	! t0_kref+0x13a8:   	ldd	[%i1 - 8], %o4
	.word	0xc568a081	! t0_kref+0x13ac:   	prefetch	%g2 + 0x81, 2
	call	SYM(t0_subr0)
	.word	0xaf200000	! t0_kref+0x13b4:   	mulscc	%g0, %g0, %l7
	.word	0xe26e8018	! t0_kref+0x13b8:   	ldstub	[%i2 + %i0], %l1
	.word	0x89b10a24	! t0_kref+0x13bc:   	fpadd16s	%f4, %f4, %f4
	.word	0x92100000	! t0_kref+0x13c0:   	clr	%o1
	.word	0xc030a00c	! t0_kref+0x13c4:   	clrh	[%g2 + 0xc]
	.word	0x89a00124	! t0_kref+0x13c8:   	fabss	%f4, %f4
	.word	0x9f280000	! t0_kref+0x13cc:   	sll	%g0, %g0, %o7
	.word	0xc920a024	! t0_kref+0x13d0:   	st	%f4, [%g2 + 0x24]
	.word	0x89a01904	! t0_kref+0x13d4:   	fitod	%f4, %f4
	.word	0x96e00000	! t0_kref+0x13d8:   	subccc	%g0, %g0, %o3
	.word	0x80d03ae3	! t0_kref+0x13dc:   	umulcc	%g0, -0x51d, %g0
	.word	0x8143c000	! t0_kref+0x13e0:   	stbar
	.word	0xc020a024	! t0_kref+0x13e4:   	clr	[%g2 + 0x24]
	.word	0x30800001	! t0_kref+0x13e8:   	ba,a	_kref+0x13ec
	.word	0xe7ee501a	! t0_kref+0x13ec:   	prefetcha	%i1 + %i2, 19
	.word	0xc0267fe0	! t0_kref+0x13f0:   	clr	[%i1 - 0x20]
	.word	0xd83e6018	! t0_kref+0x13f4:   	std	%o4, [%i1 + 0x18]
	.word	0xebee501a	! t0_kref+0x13f8:   	prefetcha	%i1 + %i2, 21
	.word	0x89b00f24	! t0_kref+0x13fc:   	fsrc2s	%f4, %f4
	.word	0x9ad8310e	! t0_kref+0x1400:   	smulcc	%g0, -0xef2, %o5
	.word	0x89a109c4	! t0_kref+0x1404:   	fdivd	%f4, %f4, %f4
	.word	0x98c00000	! t0_kref+0x1408:   	addccc	%g0, %g0, %o4
	.word	0x92602435	! t0_kref+0x140c:   	subc	%g0, 0x435, %o1
	.word	0x81a90aa4	! t0_kref+0x1410:   	fcmpes	%fcc0, %f4, %f4
	.word	0x89a00544	! t0_kref+0x1414:   	fsqrtd	%f4, %f4
	.word	0x9de3bfa0	! t0_kref+0x1418:   	save	%sp, -0x60, %sp
	.word	0xb8672cf2	! t0_kref+0x141c:   	subc	%i4, 0xcf2, %i4
	.word	0xafee7d49	! t0_kref+0x1420:   	restore	%i1, -0x2b7, %l7
	.word	0x94400000	! t0_kref+0x1424:   	addc	%g0, %g0, %o2
	.word	0x151ae45c	! t0_kref+0x1428:   	sethi	%hi(0x6b917000), %o2
	.word	0x9fc00004	! t0_kref+0x142c:   	call	%g0 + %g4
	.word	0xf1ee101b	! t0_kref+0x1430:   	prefetcha	%i0 + %i3, 24
	.word	0x81b00020	! t0_kref+0x1434:   	edge8n	%g0, %g0, %g0
	.word	0x80180000	! t0_kref+0x1438:   	xor	%g0, %g0, %g0
	.word	0xae100000	! t0_kref+0x143c:   	clr	%l7
	.word	0x901037b2	! t0_kref+0x1440:   	mov	0xfffff7b2, %o0
	.word	0x89a01a24	! t0_kref+0x1444:   	fstoi	%f4, %f4
	.word	0x9a003222	! t0_kref+0x1448:   	add	%g0, -0xdde, %o5
	.word	0x97b00200	! t0_kref+0x144c:   	array8	%g0, %g0, %o3
	.word	0x81580000	! t0_kref+0x1450:   	flushw
	.word	0xae6036f5	! t0_kref+0x1454:   	subc	%g0, -0x90b, %l7
	.word	0xc91fbf60	! t0_kref+0x1458:   	ldd	[%fp - 0xa0], %f4
	.word	0xaf30200a	! t0_kref+0x145c:   	srl	%g0, 0xa, %l7
	.word	0x99400000	! t0_kref+0x1460:   	mov	%y, %o4
	.word	0xc920a01c	! t0_kref+0x1464:   	st	%f4, [%g2 + 0x1c]
	.word	0x89a108c4	! t0_kref+0x1468:   	fsubd	%f4, %f4, %f4
	.word	0xc07e7fe0	! t0_kref+0x146c:   	swap	[%i1 - 0x20], %g0
	.word	0xd41e3ff0	! t0_kref+0x1470:   	ldd	[%i0 - 0x10], %o2
	.word	0xd28e9019	! t0_kref+0x1474:   	lduba	[%i2 + %i1]0x80, %o1
	.word	0xe0180019	! t0_kref+0x1478:   	ldd	[%g0 + %i1], %l0
	.word	0xf007bfe0	! t0_kref+0x147c:   	ld	[%fp - 0x20], %i0
	.word	0xc030a016	! t0_kref+0x1480:   	clrh	[%g2 + 0x16]
	.word	0x89b00fe0	! t0_kref+0x1484:   	fones	%f4
	.word	0x94980000	! t0_kref+0x1488:   	xorcc	%g0, %g0, %o2
	.word	0x92603dce	! t0_kref+0x148c:   	subc	%g0, -0x232, %o1
	.word	0xd850a020	! t0_kref+0x1490:   	ldsh	[%g2 + 0x20], %o4
	.word	0x89a10924	! t0_kref+0x1494:   	fmuls	%f4, %f4, %f4
	.word	0xf207bfe0	! t0_kref+0x1498:   	ld	[%fp - 0x20], %i1
	.word	0x89b10e80	! t0_kref+0x149c:   	fsrc1	%f4, %f4
	.word	0xc9be1840	! t0_kref+0x14a0:   	stda	%f4, [%i0]0xc2
	.word	0x81a90a24	! t0_kref+0x14a4:   	fcmps	%fcc0, %f4, %f4
	.word	0xafb00020	! t0_kref+0x14a8:   	edge8n	%g0, %g0, %l7
	.word	0xea7e3fe0	! t0_kref+0x14ac:   	swap	[%i0 - 0x20], %l5
	.word	0x28480003	! t0_kref+0x14b0:   	bleu,a,pt	%icc, _kref+0x14bc
	.word	0xd00e2015	! t0_kref+0x14b4:   	ldub	[%i0 + 0x15], %o0
	.word	0x3c480007	! t0_kref+0x14b8:   	bpos,a,pt	%icc, _kref+0x14d4
	.word	0x89a00124	! t0_kref+0x14bc:   	fabss	%f4, %f4
	.word	0xc000a018	! t0_kref+0x14c0:   	ld	[%g2 + 0x18], %g0
	.word	0x97300000	! t0_kref+0x14c4:   	srl	%g0, %g0, %o3
	.word	0xfbee101b	! t0_kref+0x14c8:   	prefetcha	%i0 + %i3, 29
	.word	0x91b000a0	! t0_kref+0x14cc:   	edge16n	%g0, %g0, %o0
	.word	0x81a90a44	! t0_kref+0x14d0:   	fcmpd	%fcc0, %f4, %f4
	.word	0xc00e601b	! t0_kref+0x14d4:   	ldub	[%i1 + 0x1b], %g0
	.word	0x89b10724	! t0_kref+0x14d8:   	fmuld8ulx16	%f4, %f4, %f4
	.word	0x22800003	! t0_kref+0x14dc:   	be,a	_kref+0x14e8
	.word	0x94c00000	! t0_kref+0x14e0:   	addccc	%g0, %g0, %o2
	.word	0x80f80000	! t0_kref+0x14e4:   	sdivcc	%g0, %g0, %g0
	.word	0x94500000	! t0_kref+0x14e8:   	umul	%g0, %g0, %o2
	.word	0x89a00524	! t0_kref+0x14ec:   	fsqrts	%f4, %f4
	.word	0x99180000	! t0_kref+0x14f0:   	tsubcctv	%g0, %g0, %o4
	.word	0x98a8229b	! t0_kref+0x14f4:   	andncc	%g0, 0x29b, %o4
	.word	0x81580000	! t0_kref+0x14f8:   	flushw
	.word	0x3e800001	! t0_kref+0x14fc:   	bvc,a	_kref+0x1500
	.word	0x98603f18	! t0_kref+0x1500:   	subc	%g0, -0xe8, %o4
	.word	0xc91fbd08	! t0_kref+0x1504:   	ldd	[%fp - 0x2f8], %f4
	.word	0x89a00524	! t0_kref+0x1508:   	fsqrts	%f4, %f4
	.word	0x89a018c4	! t0_kref+0x150c:   	fdtos	%f4, %f4
	.word	0xda00a020	! t0_kref+0x1510:   	ld	[%g2 + 0x20], %o5
	.word	0x24800001	! t0_kref+0x1514:   	ble,a	_kref+0x1518
	.word	0x89a10844	! t0_kref+0x1518:   	faddd	%f4, %f4, %f4
	call	SYM(t0_subr3)
	.word	0x95b00040	! t0_kref+0x1520:   	edge8l	%g0, %g0, %o2
	.word	0x89a109a4	! t0_kref+0x1524:   	fdivs	%f4, %f4, %f4
	.word	0xd650a024	! t0_kref+0x1528:   	ldsh	[%g2 + 0x24], %o3
	.word	0xaf400000	! t0_kref+0x152c:   	mov	%y, %l7
	.word	0xda4e8019	! t0_kref+0x1530:   	ldsb	[%i2 + %i1], %o5
	.word	0x90e00000	! t0_kref+0x1534:   	subccc	%g0, %g0, %o0
	.word	0x94802a4f	! t0_kref+0x1538:   	addcc	%g0, 0xa4f, %o2
	.word	0x89a10824	! t0_kref+0x153c:   	fadds	%f4, %f4, %f4
	.word	0x30800007	! t0_kref+0x1540:   	ba,a	_kref+0x155c
	.word	0x92a80000	! t0_kref+0x1544:   	andncc	%g0, %g0, %o1
	.word	0x97b000a0	! t0_kref+0x1548:   	edge16n	%g0, %g0, %o3
	.word	0xc91fbc38	! t0_kref+0x154c:   	ldd	[%fp - 0x3c8], %f4
	.word	0xc920a008	! t0_kref+0x1550:   	st	%f4, [%g2 + 8]
	.word	0x89a10924	! t0_kref+0x1554:   	fmuls	%f4, %f4, %f4
	.word	0x34800002	! t0_kref+0x1558:   	bg,a	_kref+0x1560
	.word	0x9690312a	! t0_kref+0x155c:   	orcc	%g0, -0xed6, %o3
	.word	0x97b10584	! t0_kref+0x1560:   	fcmpgt32	%f4, %f4, %o3
	.word	0x89a018c4	! t0_kref+0x1564:   	fdtos	%f4, %f4
	.word	0x89a10844	! t0_kref+0x1568:   	faddd	%f4, %f4, %f4
	.word	0x89a000a4	! t0_kref+0x156c:   	fnegs	%f4, %f4
	.word	0x96980000	! t0_kref+0x1570:   	xorcc	%g0, %g0, %o3
	.word	0x97400000	! t0_kref+0x1574:   	mov	%y, %o3
	.word	0x90400000	! t0_kref+0x1578:   	addc	%g0, %g0, %o0
	.word	0x9ec00000	! t0_kref+0x157c:   	addccc	%g0, %g0, %o7
	.word	0x90300000	! t0_kref+0x1580:   	orn	%g0, %g0, %o0
	.word	0x89a01904	! t0_kref+0x1584:   	fitod	%f4, %f4
	.word	0x89a10944	! t0_kref+0x1588:   	fmuld	%f4, %f4, %f4
	.word	0x89b10664	! t0_kref+0x158c:   	fmul8x16au	%f4, %f4, %f4
	.word	0xc91fbca0	! t0_kref+0x1590:   	ldd	[%fp - 0x360], %f4
	.word	0xee067fec	! t0_kref+0x1594:   	ld	[%i1 - 0x14], %l7
	.word	0xd20e001a	! t0_kref+0x1598:   	ldub	[%i0 + %i2], %o1
	.word	0x81dd6dc1	! t0_kref+0x159c:   	flush	%l5 + 0xdc1
	.word	0x2c800006	! t0_kref+0x15a0:   	bneg,a	_kref+0x15b8
	.word	0xc920a038	! t0_kref+0x15a4:   	st	%f4, [%g2 + 0x38]
	.word	0x24800003	! t0_kref+0x15a8:   	ble,a	_kref+0x15b4
	.word	0xc91fbd48	! t0_kref+0x15ac:   	ldd	[%fp - 0x2b8], %f4
	.word	0xd2080018	! t0_kref+0x15b0:   	ldub	[%g0 + %i0], %o1
	.word	0x89a01a44	! t0_kref+0x15b4:   	fdtoi	%f4, %f4
	.word	0x86102003	! t0_kref+0x15b8:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x15bc:   	bne,a	_kref+0x15bc
	.word	0x86a0e001	! t0_kref+0x15c0:   	subcc	%g3, 1, %g3
	.word	0x89a01904	! t0_kref+0x15c4:   	fitod	%f4, %f4
	.word	0x89a018c4	! t0_kref+0x15c8:   	fdtos	%f4, %f4
	.word	0x89b10e24	! t0_kref+0x15cc:   	fands	%f4, %f4, %f4
	.word	0x9ec00000	! t0_kref+0x15d0:   	addccc	%g0, %g0, %o7
	.word	0xaef80000	! t0_kref+0x15d4:   	sdivcc	%g0, %g0, %l7
	.word	0x89a00524	! t0_kref+0x15d8:   	fsqrts	%f4, %f4
	.word	0x92300000	! t0_kref+0x15dc:   	orn	%g0, %g0, %o1
	.word	0x9aa02db4	! t0_kref+0x15e0:   	subcc	%g0, 0xdb4, %o5
	.word	0x9008238c	! t0_kref+0x15e4:   	and	%g0, 0x38c, %o0
	.word	0x92d83b07	! t0_kref+0x15e8:   	smulcc	%g0, -0x4f9, %o1
	.word	0x96d80000	! t0_kref+0x15ec:   	smulcc	%g0, %g0, %o3
	.word	0x89a10844	! t0_kref+0x15f0:   	faddd	%f4, %f4, %f4
	.word	0x98402274	! t0_kref+0x15f4:   	addc	%g0, 0x274, %o4
	.word	0x92d839de	! t0_kref+0x15f8:   	smulcc	%g0, -0x622, %o1
	.word	0xc920a038	! t0_kref+0x15fc:   	st	%f4, [%g2 + 0x38]
	.word	0xc9063fe8	! t0_kref+0x1600:   	ld	[%i0 - 0x18], %f4
	.word	0x91b10484	! t0_kref+0x1604:   	fcmple32	%f4, %f4, %o0
	.word	0x89a10824	! t0_kref+0x1608:   	fadds	%f4, %f4, %f4
	.word	0x92e02e95	! t0_kref+0x160c:   	subccc	%g0, 0xe95, %o1
	.word	0x89a108a4	! t0_kref+0x1610:   	fsubs	%f4, %f4, %f4
	.word	0xc920a01c	! t0_kref+0x1614:   	st	%f4, [%g2 + 0x1c]
	.word	0xc920a004	! t0_kref+0x1618:   	st	%f4, [%g2 + 4]
	.word	0xaf380000	! t0_kref+0x161c:   	sra	%g0, %g0, %l7
	.word	0xc0363ffc	! t0_kref+0x1620:   	clrh	[%i0 - 4]
	.word	0x9898212f	! t0_kref+0x1624:   	xorcc	%g0, 0x12f, %o4
	.word	0x985035cf	! t0_kref+0x1628:   	umul	%g0, -0xa31, %o4
	.word	0x89b00764	! t0_kref+0x162c:   	fpack16	%f4, %f4
	.word	0x8143c000	! t0_kref+0x1630:   	stbar
	.word	0x89a10824	! t0_kref+0x1634:   	fadds	%f4, %f4, %f4
	.word	0x89aa4024	! t0_kref+0x1638:   	fmovse	%fcc0, %f4, %f4
	.word	0x9de3bfa0	! t0_kref+0x163c:   	save	%sp, -0x60, %sp
	.word	0xb4a6401a	! t0_kref+0x1640:   	subcc	%i1, %i2, %i2
	.word	0x97eee5b6	! t0_kref+0x1644:   	restore	%i3, 0x5b6, %o3
	.word	0x9920251a	! t0_kref+0x1648:   	mulscc	%g0, 0x51a, %o4
	.word	0x34480008	! t0_kref+0x164c:   	bg,a,pt	%icc, _kref+0x166c
	.word	0xc010a006	! t0_kref+0x1650:   	lduh	[%g2 + 6], %g0
	.word	0xd43e4000	! t0_kref+0x1654:   	std	%o2, [%i1]
	.word	0x89a01884	! t0_kref+0x1658:   	fitos	%f4, %f4
	.word	0xc020a014	! t0_kref+0x165c:   	clr	[%g2 + 0x14]
	.word	0x89a10d24	! t0_kref+0x1660:   	fsmuld	%f4, %f4, %f4
	.word	0xd8df5019	! t0_kref+0x1664:   	ldxa	[%i5 + %i1]0x80, %o4
	.word	0x27480008	! t0_kref+0x1668:   	fbul,a,pt	%fcc0, _kref+0x1688
	.word	0x89a00524	! t0_kref+0x166c:   	fsqrts	%f4, %f4
	.word	0xda08001a	! t0_kref+0x1670:   	ldub	[%g0 + %i2], %o5
	.word	0x80a00000	! t0_kref+0x1674:   	cmp	%g0, %g0
	.word	0x98303f2d	! t0_kref+0x1678:   	orn	%g0, -0xd3, %o4
	.word	0x9b400000	! t0_kref+0x167c:   	mov	%y, %o5
	.word	0x81a90a44	! t0_kref+0x1680:   	fcmpd	%fcc0, %f4, %f4
	.word	0x89a10944	! t0_kref+0x1684:   	fmuld	%f4, %f4, %f4
	.word	0x980824de	! t0_kref+0x1688:   	and	%g0, 0x4de, %o4
	.word	0x89a10924	! t0_kref+0x168c:   	fmuls	%f4, %f4, %f4
	.word	0xd208a03a	! t0_kref+0x1690:   	ldub	[%g2 + 0x3a], %o1
	call	SYM(t0_subr1)
	.word	0x89a00524	! t0_kref+0x1698:   	fsqrts	%f4, %f4
	.word	0x89a10924	! t0_kref+0x169c:   	fmuls	%f4, %f4, %f4
	.word	0x90080000	! t0_kref+0x16a0:   	and	%g0, %g0, %o0
	.word	0x89a000a4	! t0_kref+0x16a4:   	fnegs	%f4, %f4
	.word	0xe3b8a080	! t0_kref+0x16a8:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x89b00c20	! t0_kref+0x16ac:   	fzeros	%f4
	.word	0xc9000018	! t0_kref+0x16b0:   	ld	[%g0 + %i0], %f4
	.word	0x8d803b7d	! t0_kref+0x16b4:   	mov	0xfffffb7d, %fprs
	.word	0x90d00000	! t0_kref+0x16b8:   	umulcc	%g0, %g0, %o0
	.word	0x89b107c4	! t0_kref+0x16bc:   	pdist	%f4, %f4, %f4
	.word	0xc920a018	! t0_kref+0x16c0:   	st	%f4, [%g2 + 0x18]
	.word	0x90302d74	! t0_kref+0x16c4:   	orn	%g0, 0xd74, %o0
	.word	0x81a90a44	! t0_kref+0x16c8:   	fcmpd	%fcc0, %f4, %f4
	.word	0x89a00144	! t0_kref+0x16cc:   	fabsd	%f4, %f4
	.word	0x92d037b5	! t0_kref+0x16d0:   	umulcc	%g0, -0x84b, %o1
	.word	0xe07e001c	! t0_kref+0x16d4:   	swap	[%i0 + %i4], %l0
	.word	0x38800007	! t0_kref+0x16d8:   	bgu,a	_kref+0x16f4
	.word	0x951020f0	! t0_kref+0x16dc:   	taddcctv	%g0, 0xf0, %o2
	.word	0x98b038b1	! t0_kref+0x16e0:   	orncc	%g0, -0x74f, %o4
	.word	0x966029b4	! t0_kref+0x16e4:   	subc	%g0, 0x9b4, %o3
	.word	0x89b107c4	! t0_kref+0x16e8:   	pdist	%f4, %f4, %f4
	.word	0x89a108a4	! t0_kref+0x16ec:   	fsubs	%f4, %f4, %f4
	.word	0x80100000	! t0_kref+0x16f0:   	clr	%g0
	.word	0x89a10924	! t0_kref+0x16f4:   	fmuls	%f4, %f4, %f4
	.word	0xd6567fe4	! t0_kref+0x16f8:   	ldsh	[%i1 - 0x1c], %o3
	.word	0xc0a81018	! t0_kref+0x16fc:   	stba	%g0, [%g0 + %i0]0x80
	.word	0x81d94013	! t0_kref+0x1700:   	flush	%g5 + %l3
	.word	0x89b00c00	! t0_kref+0x1704:   	fzero	%f4
	.word	0x93282003	! t0_kref+0x1708:   	sll	%g0, 0x3, %o1
	.word	0x95b00100	! t0_kref+0x170c:   	edge32	%g0, %g0, %o2
	.word	0xd01e2008	! t0_kref+0x1710:   	ldd	[%i0 + 8], %o0
	.word	0x89b00fe0	! t0_kref+0x1714:   	fones	%f4
	.word	0x8d80201e	! t0_kref+0x1718:   	mov	0x1e, %fprs
	.word	0x9e5826da	! t0_kref+0x171c:   	smul	%g0, 0x6da, %o7
	.word	0x86102018	! t0_kref+0x1720:   	mov	0x18, %g3
	.word	0x86a0e001	! t0_kref+0x1724:   	subcc	%g3, 1, %g3
	.word	0x2280000c	! t0_kref+0x1728:   	be,a	_kref+0x1758
	.word	0x89a10824	! t0_kref+0x172c:   	fadds	%f4, %f4, %f4
	.word	0x80500000	! t0_kref+0x1730:   	umul	%g0, %g0, %g0
	.word	0x91b00200	! t0_kref+0x1734:   	array8	%g0, %g0, %o0
	.word	0xc920a01c	! t0_kref+0x1738:   	st	%f4, [%g2 + 0x1c]
	.word	0x89a000a4	! t0_kref+0x173c:   	fnegs	%f4, %f4
	.word	0xc91fbce0	! t0_kref+0x1740:   	ldd	[%fp - 0x320], %f4
	.word	0x89a01a24	! t0_kref+0x1744:   	fstoi	%f4, %f4
	.word	0x81a90aa4	! t0_kref+0x1748:   	fcmpes	%fcc0, %f4, %f4
	.word	0x89b10ea0	! t0_kref+0x174c:   	fsrc1s	%f4, %f4
	.word	0x89b10e04	! t0_kref+0x1750:   	fand	%f4, %f4, %f4
	.word	0x81a90aa4	! t0_kref+0x1754:   	fcmpes	%fcc0, %f4, %f4
	.word	0x81a90a24	! t0_kref+0x1758:   	fcmps	%fcc0, %f4, %f4
	.word	0x98800000	! t0_kref+0x175c:   	addcc	%g0, %g0, %o4
	.word	0x9a80309d	! t0_kref+0x1760:   	addcc	%g0, -0xf63, %o5
	.word	0xc91f4018	! t0_kref+0x1764:   	ldd	[%i5 + %i0], %f4
	.word	0x89b106a4	! t0_kref+0x1768:   	fmul8x16al	%f4, %f4, %f4
	.word	0x89a90044	! t0_kref+0x176c:   	fmovdl	%fcc0, %f4, %f4
	.word	0xed6e3ff8	! t0_kref+0x1770:   	prefetch	%i0 - 8, 22
	.word	0xae502e9a	! t0_kref+0x1774:   	umul	%g0, 0xe9a, %l7
	.word	0x81a90a44	! t0_kref+0x1778:   	fcmpd	%fcc0, %f4, %f4
	.word	0x81b00160	! t0_kref+0x177c:   	edge32ln	%g0, %g0, %g0
	.word	0xc0480019	! t0_kref+0x1780:   	ldsb	[%g0 + %i1], %g0
	.word	0x94802f62	! t0_kref+0x1784:   	addcc	%g0, 0xf62, %o2
	.word	0x9fc00004	! t0_kref+0x1788:   	call	%g0 + %g4
	.word	0x89a00124	! t0_kref+0x178c:   	fabss	%f4, %f4
	.word	0xc028a025	! t0_kref+0x1790:   	clrb	[%g2 + 0x25]
	.word	0x89a01a44	! t0_kref+0x1794:   	fdtoi	%f4, %f4
	.word	0x89a10924	! t0_kref+0x1798:   	fmuls	%f4, %f4, %f4
	.word	0x92003c38	! t0_kref+0x179c:   	add	%g0, -0x3c8, %o1
	.word	0x89b10c44	! t0_kref+0x17a0:   	fnor	%f4, %f4, %f4
	.word	0x9e502424	! t0_kref+0x17a4:   	umul	%g0, 0x424, %o7
	.word	0x89b10964	! t0_kref+0x17a8:   	fpmerge	%f4, %f4, %f4
	.word	0x89a109c4	! t0_kref+0x17ac:   	fdivd	%f4, %f4, %f4
	.word	0xe41e0000	! t0_kref+0x17b0:   	ldd	[%i0], %l2
	.word	0x92d80000	! t0_kref+0x17b4:   	smulcc	%g0, %g0, %o1
	.word	0x89a10944	! t0_kref+0x17b8:   	fmuld	%f4, %f4, %f4
	.word	0x9e9827ae	! t0_kref+0x17bc:   	xorcc	%g0, 0x7ae, %o7
	.word	0xc91fbde8	! t0_kref+0x17c0:   	ldd	[%fp - 0x218], %f4
	.word	0xe0380019	! t0_kref+0x17c4:   	std	%l0, [%g0 + %i1]
	.word	0x99b00100	! t0_kref+0x17c8:   	edge32	%g0, %g0, %o4
	.word	0x9fb00340	! t0_kref+0x17cc:   	alignaddrl	%g0, %g0, %o7
	.word	0xc0a6501c	! t0_kref+0x17d0:   	sta	%g0, [%i1 + %i4]0x80
	.word	0x89a00524	! t0_kref+0x17d4:   	fsqrts	%f4, %f4
	.word	0x89a01924	! t0_kref+0x17d8:   	fstod	%f4, %f4
	.word	0x89a10824	! t0_kref+0x17dc:   	fadds	%f4, %f4, %f4
	.word	0x89b10f64	! t0_kref+0x17e0:   	fornot1s	%f4, %f4, %f4
	.word	0xde8e101a	! t0_kref+0x17e4:   	lduba	[%i0 + %i2]0x80, %o7
	.word	0xd656401b	! t0_kref+0x17e8:   	ldsh	[%i1 + %i3], %o3
	.word	0xaee00000	! t0_kref+0x17ec:   	subccc	%g0, %g0, %l7
	.word	0x9de3bfa0	! t0_kref+0x17f0:   	save	%sp, -0x60, %sp
	.word	0xb487401a	! t0_kref+0x17f4:   	addcc	%i5, %i2, %i2
	.word	0x81ef2b7b	! t0_kref+0x17f8:   	restore	%i4, 0xb7b, %g0
	call	SYM(t0_subr2)
	.word	0x89a01a24	! t0_kref+0x1800:   	fstoi	%f4, %f4
	.word	0x89a00524	! t0_kref+0x1804:   	fsqrts	%f4, %f4
	.word	0x98b00000	! t0_kref+0x1808:   	orncc	%g0, %g0, %o4
	.word	0x89a01a44	! t0_kref+0x180c:   	fdtoi	%f4, %f4
	.word	0x89b10624	! t0_kref+0x1810:   	fmul8x16	%f4, %f4, %f4
	.word	0x89a10944	! t0_kref+0x1814:   	fmuld	%f4, %f4, %f4
	.word	0xd80e8019	! t0_kref+0x1818:   	ldub	[%i2 + %i1], %o4
	.word	0x81dc800c	! t0_kref+0x181c:   	flush	%l2 + %o4
	.word	0x89b00c00	! t0_kref+0x1820:   	fzero	%f4
	.word	0xe41f4018	! t0_kref+0x1824:   	ldd	[%i5 + %i0], %l2
	.word	0x89b10ae4	! t0_kref+0x1828:   	fpsub32s	%f4, %f4, %f4
	.word	0xc0a65000	! t0_kref+0x182c:   	sta	%g0, [%i1]0x80
	.word	0x81a90ac4	! t0_kref+0x1830:   	fcmped	%fcc0, %f4, %f4
	.word	0xc030a038	! t0_kref+0x1834:   	clrh	[%g2 + 0x38]
	.word	0x9ad822c9	! t0_kref+0x1838:   	smulcc	%g0, 0x2c9, %o5
	.word	0x81a90ac4	! t0_kref+0x183c:   	fcmped	%fcc0, %f4, %f4
	.word	0xde08a01f	! t0_kref+0x1840:   	ldub	[%g2 + 0x1f], %o7
	.word	0x89b10724	! t0_kref+0x1844:   	fmuld8ulx16	%f4, %f4, %f4
	.word	0xd2fe101c	! t0_kref+0x1848:   	swapa	[%i0 + %i4]0x80, %o1
	.word	0x89a01a44	! t0_kref+0x184c:   	fdtoi	%f4, %f4
	.word	0x98800000	! t0_kref+0x1850:   	addcc	%g0, %g0, %o4
	.word	0x89aa8024	! t0_kref+0x1854:   	fmovsue	%fcc0, %f4, %f4
	.word	0x89a01924	! t0_kref+0x1858:   	fstod	%f4, %f4
	.word	0x89a109c4	! t0_kref+0x185c:   	fdivd	%f4, %f4, %f4
	.word	0x9e880000	! t0_kref+0x1860:   	andcc	%g0, %g0, %o7
	.word	0xc020a028	! t0_kref+0x1864:   	clr	[%g2 + 0x28]
	.word	0x28800001	! t0_kref+0x1868:   	bleu,a	_kref+0x186c
	.word	0x93b000c0	! t0_kref+0x186c:   	edge16l	%g0, %g0, %o1
	.word	0x9fc10000	! t0_kref+0x1870:   	call	%g4
	.word	0xe41e7ff8	! t0_kref+0x1874:   	ldd	[%i1 - 8], %l2
	.word	0x89a108c4	! t0_kref+0x1878:   	fsubd	%f4, %f4, %f4
	.word	0x969829fe	! t0_kref+0x187c:   	xorcc	%g0, 0x9fe, %o3
	.word	0x3e800008	! t0_kref+0x1880:   	bvc,a	_kref+0x18a0
	.word	0x89a109c4	! t0_kref+0x1884:   	fdivd	%f4, %f4, %f4
	.word	0x81b10404	! t0_kref+0x1888:   	fcmple16	%f4, %f4, %g0
	.word	0x92e0383a	! t0_kref+0x188c:   	subccc	%g0, -0x7c6, %o1
	.word	0x80400000	! t0_kref+0x1890:   	addc	%g0, %g0, %g0
	.word	0x9bb00000	! t0_kref+0x1894:   	edge8	%g0, %g0, %o5
	.word	0xda10a018	! t0_kref+0x1898:   	lduh	[%g2 + 0x18], %o5
	.word	0x98180000	! t0_kref+0x189c:   	xor	%g0, %g0, %o4
	.word	0x81a90aa4	! t0_kref+0x18a0:   	fcmpes	%fcc0, %f4, %f4
	.word	0x9b302010	! t0_kref+0x18a4:   	srl	%g0, 0x10, %o5
	.word	0xd09f5018	! t0_kref+0x18a8:   	ldda	[%i5 + %i0]0x80, %o0
	.word	0xc91fbe30	! t0_kref+0x18ac:   	ldd	[%fp - 0x1d0], %f4
	.word	0x9fc00004	! t0_kref+0x18b0:   	call	%g0 + %g4
	.word	0xa1200000	! t0_kref+0x18b4:   	mulscc	%g0, %g0, %l0
	.word	0x89a000a4	! t0_kref+0x18b8:   	fnegs	%f4, %f4
	.word	0xc020a02c	! t0_kref+0x18bc:   	clr	[%g2 + 0x2c]
	.word	0xc020a030	! t0_kref+0x18c0:   	clr	[%g2 + 0x30]
	.word	0x91302019	! t0_kref+0x18c4:   	srl	%g0, 0x19, %o0
	.word	0xc020a03c	! t0_kref+0x18c8:   	clr	[%g2 + 0x3c]
	.word	0xd448a01f	! t0_kref+0x18cc:   	ldsb	[%g2 + 0x1f], %o2
	.word	0xafb10484	! t0_kref+0x18d0:   	fcmple32	%f4, %f4, %l7
	.word	0xd4080019	! t0_kref+0x18d4:   	ldub	[%g0 + %i1], %o2
	.word	0x9890334c	! t0_kref+0x18d8:   	orcc	%g0, -0xcb4, %o4
	.word	0x9fc10000	! t0_kref+0x18dc:   	call	%g4
	.word	0x9a880000	! t0_kref+0x18e0:   	andcc	%g0, %g0, %o5
	.word	0xae880000	! t0_kref+0x18e4:   	andcc	%g0, %g0, %l7
	.word	0x9e800000	! t0_kref+0x18e8:   	addcc	%g0, %g0, %o7
	.word	0x89a108a4	! t0_kref+0x18ec:   	fsubs	%f4, %f4, %f4
	.word	0x9de3bfa0	! t0_kref+0x18f0:   	save	%sp, -0x60, %sp
	.word	0xb2e6b5b7	! t0_kref+0x18f4:   	subccc	%i2, -0xa49, %i1
	.word	0x97ee001c	! t0_kref+0x18f8:   	restore	%i0, %i4, %o3
	.word	0x81400000	! t0_kref+0x18fc:   	mov	%y, %g0
	.word	0x89a00524	! t0_kref+0x1900:   	fsqrts	%f4, %f4
	.word	0xc028a005	! t0_kref+0x1904:   	clrb	[%g2 + 5]
	.word	0x9de3bfa0	! t0_kref+0x1908:   	save	%sp, -0x60, %sp
	.word	0x8097001d	! t0_kref+0x190c:   	orcc	%i4, %i5, %g0
	.word	0x97ee0018	! t0_kref+0x1910:   	restore	%i0, %i0, %o3
	.word	0x9f28200b	! t0_kref+0x1914:   	sll	%g0, 0xb, %o7
	.word	0xd810a03c	! t0_kref+0x1918:   	lduh	[%g2 + 0x3c], %o4
	.word	0x89a108a4	! t0_kref+0x191c:   	fsubs	%f4, %f4, %f4
	.word	0x89a10824	! t0_kref+0x1920:   	fadds	%f4, %f4, %f4
	.word	0x9de3bfa0	! t0_kref+0x1924:   	save	%sp, -0x60, %sp
	.word	0xb2273884	! t0_kref+0x1928:   	sub	%i4, -0x77c, %i1
	.word	0xafe83a74	! t0_kref+0x192c:   	restore	%g0, -0x58c, %l7
	.word	0xc986101c	! t0_kref+0x1930:   	lda	[%i0 + %i4]0x80, %f4
	.word	0x89b107c4	! t0_kref+0x1934:   	pdist	%f4, %f4, %f4
	.word	0xc02e8018	! t0_kref+0x1938:   	clrb	[%i2 + %i0]
	.word	0x9de3bfa0	! t0_kref+0x193c:   	save	%sp, -0x60, %sp
	.word	0x99ef7e65	! t0_kref+0x1940:   	restore	%i5, -0x19b, %o4
	.word	0xc026401c	! t0_kref+0x1944:   	clr	[%i1 + %i4]
	.word	0x89b10a24	! t0_kref+0x1948:   	fpadd16s	%f4, %f4, %f4
	.word	0x96500000	! t0_kref+0x194c:   	umul	%g0, %g0, %o3
	.word	0xc91fbe58	! t0_kref+0x1950:   	ldd	[%fp - 0x1a8], %f4
	.word	0x17254af9	! t0_kref+0x1954:   	sethi	%hi(0x952be400), %o3
	.word	0xf36e7fe0	! t0_kref+0x1958:   	prefetch	%i1 - 0x20, 25
	.word	0x89a108c4	! t0_kref+0x195c:   	fsubd	%f4, %f4, %f4
	.word	0xd848a01d	! t0_kref+0x1960:   	ldsb	[%g2 + 0x1d], %o4
	.word	0x89b00fe0	! t0_kref+0x1964:   	fones	%f4
	.word	0xd6063ff0	! t0_kref+0x1968:   	ld	[%i0 - 0x10], %o3
	.word	0xc900a030	! t0_kref+0x196c:   	ld	[%g2 + 0x30], %f4
	.word	0x3c800004	! t0_kref+0x1970:   	bpos,a	_kref+0x1980
	.word	0x89a10824	! t0_kref+0x1974:   	fadds	%f4, %f4, %f4
	.word	0x8143c000	! t0_kref+0x1978:   	stbar
	.word	0xda00a038	! t0_kref+0x197c:   	ld	[%g2 + 0x38], %o5
	.word	0x80a8250e	! t0_kref+0x1980:   	andncc	%g0, 0x50e, %g0
	.word	0x86102003	! t0_kref+0x1984:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x1988:   	bne,a	_kref+0x1988
	.word	0x86a0e001	! t0_kref+0x198c:   	subcc	%g3, 1, %g3
	.word	0x001fffff	! t0_kref+0x1990:   	illtrap	0x1fffff
	.word	0x89a00544	! t0_kref+0x1994:   	fsqrtd	%f4, %f4
	.word	0x97400000	! t0_kref+0x1998:   	mov	%y, %o3
	.word	0x36800008	! t0_kref+0x199c:   	bge,a	_kref+0x19bc
	.word	0x89a00544	! t0_kref+0x19a0:   	fsqrtd	%f4, %f4
	.word	0x80e00000	! t0_kref+0x19a4:   	subccc	%g0, %g0, %g0
	.word	0x89a01904	! t0_kref+0x19a8:   	fitod	%f4, %f4
	.word	0x9fc10000	! t0_kref+0x19ac:   	call	%g4
	.word	0xc99e501d	! t0_kref+0x19b0:   	ldda	[%i1 + %i5]0x80, %f4
	.word	0x89a00524	! t0_kref+0x19b4:   	fsqrts	%f4, %f4
	.word	0xec9f5019	! t0_kref+0x19b8:   	ldda	[%i5 + %i1]0x80, %l6
	.word	0x32800008	! t0_kref+0x19bc:   	bne,a	_kref+0x19dc
	.word	0x89a01904	! t0_kref+0x19c0:   	fitod	%f4, %f4
	.word	0xaee02641	! t0_kref+0x19c4:   	subccc	%g0, 0x641, %l7
	.word	0x921833f5	! t0_kref+0x19c8:   	xor	%g0, -0xc0b, %o1
	.word	0x3e800003	! t0_kref+0x19cc:   	bvc,a	_kref+0x19d8
	.word	0x90c02b37	! t0_kref+0x19d0:   	addccc	%g0, 0xb37, %o0
	.word	0xc020a004	! t0_kref+0x19d4:   	clr	[%g2 + 4]
	.word	0x89b10fa4	! t0_kref+0x19d8:   	fors	%f4, %f4, %f4
	.word	0xc91fbe70	! t0_kref+0x19dc:   	ldd	[%fp - 0x190], %f4
	.word	0x89a00024	! t0_kref+0x19e0:   	fmovs	%f4, %f4
	.word	0x99280000	! t0_kref+0x19e4:   	sll	%g0, %g0, %o4
	.word	0x89a00544	! t0_kref+0x19e8:   	fsqrtd	%f4, %f4
	.word	0x98f82a38	! t0_kref+0x19ec:   	sdivcc	%g0, 0xa38, %o4
	.word	0xc0263fe8	! t0_kref+0x19f0:   	clr	[%i0 - 0x18]
	.word	0x9f100000	! t0_kref+0x19f4:   	taddcctv	%g0, %g0, %o7
	.word	0x93b000c0	! t0_kref+0x19f8:   	edge16l	%g0, %g0, %o1
	.word	0xc030a020	! t0_kref+0x19fc:   	clrh	[%g2 + 0x20]
	.word	0x91300000	! t0_kref+0x1a00:   	srl	%g0, %g0, %o0
	.word	0xc9871019	! t0_kref+0x1a04:   	lda	[%i4 + %i1]0x80, %f4
	.word	0xda100019	! t0_kref+0x1a08:   	lduh	[%g0 + %i1], %o5
	.word	0xaf644000	! t0_kref+0x1a0c:   	move	%icc, %g0, %l7
	.word	0x97b00340	! t0_kref+0x1a10:   	alignaddrl	%g0, %g0, %o3
	.word	0xd206001c	! t0_kref+0x1a14:   	ld	[%i0 + %i4], %o1
	.word	0x80400000	! t0_kref+0x1a18:   	addc	%g0, %g0, %g0
	.word	0xc0270018	! t0_kref+0x1a1c:   	clr	[%i4 + %i0]
	.word	0xe49e501d	! t0_kref+0x1a20:   	ldda	[%i1 + %i5]0x80, %l2
	.word	0x98200000	! t0_kref+0x1a24:   	neg	%g0, %o4
	.word	0x90600000	! t0_kref+0x1a28:   	subc	%g0, %g0, %o0
	.word	0x89a018c4	! t0_kref+0x1a2c:   	fdtos	%f4, %f4
	.word	0xec1e6010	! t0_kref+0x1a30:   	ldd	[%i1 + 0x10], %l6
	.word	0x94d80000	! t0_kref+0x1a34:   	smulcc	%g0, %g0, %o2
	.word	0x98e0376e	! t0_kref+0x1a38:   	subccc	%g0, -0x892, %o4
	.word	0xda48a035	! t0_kref+0x1a3c:   	ldsb	[%g2 + 0x35], %o5
	.word	0xc020a018	! t0_kref+0x1a40:   	clr	[%g2 + 0x18]
	.word	0x9ab00000	! t0_kref+0x1a44:   	orncc	%g0, %g0, %o5
	.word	0x86102012	! t0_kref+0x1a48:   	mov	0x12, %g3
	.word	0x86a0e001	! t0_kref+0x1a4c:   	subcc	%g3, 1, %g3
	.word	0x2280000d	! t0_kref+0x1a50:   	be,a	_kref+0x1a84
	.word	0x89a108c4	! t0_kref+0x1a54:   	fsubd	%f4, %f4, %f4
	.word	0xc0260000	! t0_kref+0x1a58:   	clr	[%i0]
	.word	0xaf400000	! t0_kref+0x1a5c:   	mov	%y, %l7
	.word	0x89a108c4	! t0_kref+0x1a60:   	fsubd	%f4, %f4, %f4
	.word	0x89a10944	! t0_kref+0x1a64:   	fmuld	%f4, %f4, %f4
	.word	0x99b105c4	! t0_kref+0x1a68:   	fcmpeq32	%f4, %f4, %o4
	.word	0xaf083e8d	! t0_kref+0x1a6c:   	tsubcc	%g0, -0x173, %l7
	.word	0xd60e601e	! t0_kref+0x1a70:   	ldub	[%i1 + 0x1e], %o3
	.word	0x81a90ac4	! t0_kref+0x1a74:   	fcmped	%fcc0, %f4, %f4
	.word	0x81a90aa4	! t0_kref+0x1a78:   	fcmpes	%fcc0, %f4, %f4
	.word	0x89a10824	! t0_kref+0x1a7c:   	fadds	%f4, %f4, %f4
	.word	0x96182c33	! t0_kref+0x1a80:   	xor	%g0, 0xc33, %o3
	.word	0x89a00124	! t0_kref+0x1a84:   	fabss	%f4, %f4
	.word	0x8143c000	! t0_kref+0x1a88:   	stbar
	.word	0x89a00524	! t0_kref+0x1a8c:   	fsqrts	%f4, %f4
	.word	0xc020a018	! t0_kref+0x1a90:   	clr	[%g2 + 0x18]
	.word	0x89a10924	! t0_kref+0x1a94:   	fmuls	%f4, %f4, %f4
	.word	0xd650a00c	! t0_kref+0x1a98:   	ldsh	[%g2 + 0xc], %o3
	.word	0x81a90aa4	! t0_kref+0x1a9c:   	fcmpes	%fcc0, %f4, %f4
	.word	0xee10a012	! t0_kref+0x1aa0:   	lduh	[%g2 + 0x12], %l7
	.word	0x2e800002	! t0_kref+0x1aa4:   	bvs,a	_kref+0x1aac
	.word	0x89a00524	! t0_kref+0x1aa8:   	fsqrts	%f4, %f4
	.word	0xc920a038	! t0_kref+0x1aac:   	st	%f4, [%g2 + 0x38]
	.word	0x89a018c4	! t0_kref+0x1ab0:   	fdtos	%f4, %f4
	.word	0x89a00124	! t0_kref+0x1ab4:   	fabss	%f4, %f4
	.word	0x80380000	! t0_kref+0x1ab8:   	not	%g0
	.word	0x91b00100	! t0_kref+0x1abc:   	edge32	%g0, %g0, %o0
	.word	0xc900a02c	! t0_kref+0x1ac0:   	ld	[%g2 + 0x2c], %f4
	.word	0xc020a030	! t0_kref+0x1ac4:   	clr	[%g2 + 0x30]
	.word	0x81a90ac4	! t0_kref+0x1ac8:   	fcmped	%fcc0, %f4, %f4
	.word	0x89a00124	! t0_kref+0x1acc:   	fabss	%f4, %f4
	call	SYM(t0_subr1)
	.word	0xd240a034	! t0_kref+0x1ad4:   	ldsw	[%g2 + 0x34], %o1
	.word	0x89a10924	! t0_kref+0x1ad8:   	fmuls	%f4, %f4, %f4
	.word	0xaec00000	! t0_kref+0x1adc:   	addccc	%g0, %g0, %l7
	.word	0x91300000	! t0_kref+0x1ae0:   	srl	%g0, %g0, %o0
	.word	0xc020a01c	! t0_kref+0x1ae4:   	clr	[%g2 + 0x1c]
	.word	0x89b10aa4	! t0_kref+0x1ae8:   	fpsub16s	%f4, %f4, %f4
	.word	0x9fc10000	! t0_kref+0x1aec:   	call	%g4
	.word	0x89b009a4	! t0_kref+0x1af0:   	fexpand	%f4, %f4
	.word	0x9e7824f3	! t0_kref+0x1af4:   	sdiv	%g0, 0x4f3, %o7
	.word	0x89a00524	! t0_kref+0x1af8:   	fsqrts	%f4, %f4
	.word	0xaea83b67	! t0_kref+0x1afc:   	andncc	%g0, -0x499, %l7
	.word	0x80f80000	! t0_kref+0x1b00:   	sdivcc	%g0, %g0, %g0
	.word	0x89a10824	! t0_kref+0x1b04:   	fadds	%f4, %f4, %f4
	.word	0x89a00524	! t0_kref+0x1b08:   	fsqrts	%f4, %f4
	.word	0xde0e8018	! t0_kref+0x1b0c:   	ldub	[%i2 + %i0], %o7
	.word	0xc9be5a1a	! t0_kref+0x1b10:   	stda	%f4, [%i1 + %i2]0xd0
	.word	0x89a84044	! t0_kref+0x1b14:   	fmovdne	%fcc0, %f4, %f4
	.word	0xda78a010	! t0_kref+0x1b18:   	swap	[%g2 + 0x10], %o5
	.word	0x9a003718	! t0_kref+0x1b1c:   	add	%g0, -0x8e8, %o5
	.word	0x89b106c4	! t0_kref+0x1b20:   	fmul8sux16	%f4, %f4, %f4
	.word	0x904034e3	! t0_kref+0x1b24:   	addc	%g0, -0xb1d, %o0
	.word	0xd60e601d	! t0_kref+0x1b28:   	ldub	[%i1 + 0x1d], %o3
	.word	0x89a000a4	! t0_kref+0x1b2c:   	fnegs	%f4, %f4
	.word	0x89b10ae4	! t0_kref+0x1b30:   	fpsub32s	%f4, %f4, %f4
	.word	0x89b107c4	! t0_kref+0x1b34:   	pdist	%f4, %f4, %f4
	.word	0x9a800000	! t0_kref+0x1b38:   	addcc	%g0, %g0, %o5
	.word	0x9f203947	! t0_kref+0x1b3c:   	mulscc	%g0, -0x6b9, %o7
	.word	0xc9180019	! t0_kref+0x1b40:   	ldd	[%g0 + %i1], %f4
	.word	0x92780000	! t0_kref+0x1b44:   	sdiv	%g0, %g0, %o1
	.word	0x89a108a4	! t0_kref+0x1b48:   	fsubs	%f4, %f4, %f4
	.word	0x3c480008	! t0_kref+0x1b4c:   	bpos,a,pt	%icc, _kref+0x1b6c
	.word	0x8143c000	! t0_kref+0x1b50:   	stbar
	.word	0x80f80000	! t0_kref+0x1b54:   	sdivcc	%g0, %g0, %g0
	.word	0xd80e4000	! t0_kref+0x1b58:   	ldub	[%i1], %o4
	.word	0xc920a008	! t0_kref+0x1b5c:   	st	%f4, [%g2 + 8]
	.word	0xc9be1a5d	! t0_kref+0x1b60:   	stda	%f4, [%i0 + %i5]0xd2
	.word	0x2d480007	! t0_kref+0x1b64:   	fbg,a,pt	%fcc0, _kref+0x1b80
	.word	0xda4e401a	! t0_kref+0x1b68:   	ldsb	[%i1 + %i2], %o5
	.word	0xc9070018	! t0_kref+0x1b6c:   	ld	[%i4 + %i0], %f4
	.word	0xe81e7ff8	! t0_kref+0x1b70:   	ldd	[%i1 - 8], %l4
	.word	0x89a01924	! t0_kref+0x1b74:   	fstod	%f4, %f4
	call	SYM(t0_subr3)
	.word	0x89a10824	! t0_kref+0x1b7c:   	fadds	%f4, %f4, %f4
	.word	0xe2ee5000	! t0_kref+0x1b80:   	ldstuba	[%i1]0x80, %l1
	.word	0xc9063fe8	! t0_kref+0x1b84:   	ld	[%i0 - 0x18], %f4
	.word	0x89b10ea0	! t0_kref+0x1b88:   	fsrc1s	%f4, %f4
	.word	0x9f280000	! t0_kref+0x1b8c:   	sll	%g0, %g0, %o7
	.word	0x89b00f24	! t0_kref+0x1b90:   	fsrc2s	%f4, %f4
	.word	0x81800000	! t0_kref+0x1b94:   	mov	%g0, %y
	.word	0x89a108a4	! t0_kref+0x1b98:   	fsubs	%f4, %f4, %f4
	.word	0x81a90aa4	! t0_kref+0x1b9c:   	fcmpes	%fcc0, %f4, %f4
	.word	0xd2100019	! t0_kref+0x1ba0:   	lduh	[%g0 + %i1], %o1
	.word	0xc020a03c	! t0_kref+0x1ba4:   	clr	[%g2 + 0x3c]
	.word	0x981032ba	! t0_kref+0x1ba8:   	mov	0xfffff2ba, %o4
	.word	0xc91fbd58	! t0_kref+0x1bac:   	ldd	[%fp - 0x2a8], %f4
	.word	0x96c02df4	! t0_kref+0x1bb0:   	addccc	%g0, 0xdf4, %o3
	.word	0x89a000a4	! t0_kref+0x1bb4:   	fnegs	%f4, %f4
	.word	0x89a108a4	! t0_kref+0x1bb8:   	fsubs	%f4, %f4, %f4
	.word	0x89a018c4	! t0_kref+0x1bbc:   	fdtos	%f4, %f4
	.word	0x9bb00020	! t0_kref+0x1bc0:   	edge8n	%g0, %g0, %o5
	.word	0x89b00c20	! t0_kref+0x1bc4:   	fzeros	%f4
	.word	0x89a000a4	! t0_kref+0x1bc8:   	fnegs	%f4, %f4
	.word	0xc900a034	! t0_kref+0x1bcc:   	ld	[%g2 + 0x34], %f4
	.word	0x93400000	! t0_kref+0x1bd0:   	mov	%y, %o1
	.word	0xc920a038	! t0_kref+0x1bd4:   	st	%f4, [%g2 + 0x38]
	.word	0x89a00524	! t0_kref+0x1bd8:   	fsqrts	%f4, %f4
	.word	0x91b000a0	! t0_kref+0x1bdc:   	edge16n	%g0, %g0, %o0
	.word	0x28480007	! t0_kref+0x1be0:   	bleu,a,pt	%icc, _kref+0x1bfc
	.word	0x926035a1	! t0_kref+0x1be4:   	subc	%g0, -0xa5f, %o1
	.word	0xfbee101c	! t0_kref+0x1be8:   	prefetcha	%i0 + %i4, 29
	.word	0xd210a03a	! t0_kref+0x1bec:   	lduh	[%g2 + 0x3a], %o1
	.word	0x89a00124	! t0_kref+0x1bf0:   	fabss	%f4, %f4
	.word	0xc768a044	! t0_kref+0x1bf4:   	prefetch	%g2 + 0x44, 3
	.word	0x95700000	! t0_kref+0x1bf8:   	popc	%g0, %o2
	.word	0xd9f65000	! t0_kref+0x1bfc:   	casxa	[%i1]0x80, %g0, %o4
	.word	0x89a00524	! t0_kref+0x1c00:   	fsqrts	%f4, %f4
	.word	0xe5ee501c	! t0_kref+0x1c04:   	prefetcha	%i1 + %i4, 18
	.word	0x96180000	! t0_kref+0x1c08:   	xor	%g0, %g0, %o3
	.word	0xd60e3fef	! t0_kref+0x1c0c:   	ldub	[%i0 - 0x11], %o3
	.word	0x96700000	! t0_kref+0x1c10:   	udiv	%g0, %g0, %o3
	.word	0x9f400000	! t0_kref+0x1c14:   	mov	%y, %o7
	.word	0x9a98274d	! t0_kref+0x1c18:   	xorcc	%g0, 0x74d, %o5
	.word	0x91180000	! t0_kref+0x1c1c:   	tsubcctv	%g0, %g0, %o0
	.word	0x89a00524	! t0_kref+0x1c20:   	fsqrts	%f4, %f4
	.word	0x98180000	! t0_kref+0x1c24:   	xor	%g0, %g0, %o4
	.word	0x89b10f84	! t0_kref+0x1c28:   	for	%f4, %f4, %f4
	.word	0xd6100018	! t0_kref+0x1c2c:   	lduh	[%g0 + %i0], %o3
	.word	0x94a82ae7	! t0_kref+0x1c30:   	andncc	%g0, 0xae7, %o2
	.word	0x86102012	! t0_kref+0x1c34:   	mov	0x12, %g3
	.word	0x86a0e001	! t0_kref+0x1c38:   	subcc	%g3, 1, %g3
	.word	0x2280000d	! t0_kref+0x1c3c:   	be,a	_kref+0x1c70
	.word	0x945029d3	! t0_kref+0x1c40:   	umul	%g0, 0x9d3, %o2
	.word	0x89a10d24	! t0_kref+0x1c44:   	fsmuld	%f4, %f4, %f4
	.word	0x89a00524	! t0_kref+0x1c48:   	fsqrts	%f4, %f4
	.word	0x89a108c4	! t0_kref+0x1c4c:   	fsubd	%f4, %f4, %f4
	.word	0x98400000	! t0_kref+0x1c50:   	addc	%g0, %g0, %o4
	.word	0x94600000	! t0_kref+0x1c54:   	subc	%g0, %g0, %o2
	.word	0xc030a012	! t0_kref+0x1c58:   	clrh	[%g2 + 0x12]
	.word	0x27480001	! t0_kref+0x1c5c:   	fbul,a,pt	%fcc0, _kref+0x1c60
	.word	0x8030242b	! t0_kref+0x1c60:   	orn	%g0, 0x42b, %g0
	.word	0xd80e7fff	! t0_kref+0x1c64:   	ldub	[%i1 - 1], %o4
	.word	0xc020a03c	! t0_kref+0x1c68:   	clr	[%g2 + 0x3c]
	.word	0x90d00000	! t0_kref+0x1c6c:   	umulcc	%g0, %g0, %o0
	.word	0x89a00544	! t0_kref+0x1c70:   	fsqrtd	%f4, %f4
	.word	0x9fc00004	! t0_kref+0x1c74:   	call	%g0 + %g4
	.word	0x89b10e64	! t0_kref+0x1c78:   	fxnors	%f4, %f4, %f4
	.word	0xd84e0000	! t0_kref+0x1c7c:   	ldsb	[%i0], %o4
	.word	0xd240a038	! t0_kref+0x1c80:   	ldsw	[%g2 + 0x38], %o1
	.word	0x97280000	! t0_kref+0x1c84:   	sll	%g0, %g0, %o3
	.word	0xee5e2000	! t0_kref+0x1c88:   	ldx	[%i0], %l7
	.word	0x89b106c4	! t0_kref+0x1c8c:   	fmul8sux16	%f4, %f4, %f4
	.word	0x30800007	! t0_kref+0x1c90:   	ba,a	_kref+0x1cac
	.word	0x89a00524	! t0_kref+0x1c94:   	fsqrts	%f4, %f4
	.word	0x80500000	! t0_kref+0x1c98:   	umul	%g0, %g0, %g0
	.word	0x9e002d10	! t0_kref+0x1c9c:   	add	%g0, 0xd10, %o7
	.word	0x89b10de4	! t0_kref+0x1ca0:   	fnands	%f4, %f4, %f4
	.word	0x99b00100	! t0_kref+0x1ca4:   	edge32	%g0, %g0, %o4
	.word	0x9fc10000	! t0_kref+0x1ca8:   	call	%g4
	.word	0x9a1820cb	! t0_kref+0x1cac:   	xor	%g0, 0xcb, %o5
	.word	0x95418000	! t0_kref+0x1cb0:   	mov	%fprs, %o2
	.word	0xc9be5a5b	! t0_kref+0x1cb4:   	stda	%f4, [%i1 + %i3]0xd2
	.word	0x89a108c4	! t0_kref+0x1cb8:   	fsubd	%f4, %f4, %f4
	.word	0x81dc211e	! t0_kref+0x1cbc:   	flush	%l0 + 0x11e
	call	SYM(t0_subr3)
	.word	0xae800000	! t0_kref+0x1cc4:   	addcc	%g0, %g0, %l7
	.word	0x81dfeeb8	! t0_kref+0x1cc8:   	flush	%i7 + 0xeb8
	.word	0xda10a014	! t0_kref+0x1ccc:   	lduh	[%g2 + 0x14], %o5
	.word	0x9ad00000	! t0_kref+0x1cd0:   	umulcc	%g0, %g0, %o5
	.word	0xc906401c	! t0_kref+0x1cd4:   	ld	[%i1 + %i4], %f4
	.word	0x2c800006	! t0_kref+0x1cd8:   	bneg,a	_kref+0x1cf0
	.word	0x89a01924	! t0_kref+0x1cdc:   	fstod	%f4, %f4
	.word	0x9a080000	! t0_kref+0x1ce0:   	and	%g0, %g0, %o5
	.word	0xd5f65000	! t0_kref+0x1ce4:   	casxa	[%i1]0x80, %g0, %o2
	.word	0x81a90a24	! t0_kref+0x1ce8:   	fcmps	%fcc0, %f4, %f4
	.word	0x89a108c4	! t0_kref+0x1cec:   	fsubd	%f4, %f4, %f4
	.word	0x81a90a44	! t0_kref+0x1cf0:   	fcmpd	%fcc0, %f4, %f4
	.word	0xffee501c	! t0_kref+0x1cf4:   	prefetcha	%i1 + %i4, 31
	.word	0xd84e7ff8	! t0_kref+0x1cf8:   	ldsb	[%i1 - 8], %o4
	.word	0x89a108a4	! t0_kref+0x1cfc:   	fsubs	%f4, %f4, %f4
	.word	0xc900a038	! t0_kref+0x1d00:   	ld	[%g2 + 0x38], %f4
	.word	0xd44e3ffd	! t0_kref+0x1d04:   	ldsb	[%i0 - 3], %o2
	.word	0x9e903e4c	! t0_kref+0x1d08:   	orcc	%g0, -0x1b4, %o7
	.word	0x9fc10000	! t0_kref+0x1d0c:   	call	%g4
	.word	0x9aa825f0	! t0_kref+0x1d10:   	andncc	%g0, 0x5f0, %o5
	.word	0x89a10844	! t0_kref+0x1d14:   	faddd	%f4, %f4, %f4
	.word	0x2c480002	! t0_kref+0x1d18:   	bneg,a,pt	%icc, _kref+0x1d20
	.word	0xc040a038	! t0_kref+0x1d1c:   	ldsw	[%g2 + 0x38], %g0
	.word	0x80b80000	! t0_kref+0x1d20:   	xnorcc	%g0, %g0, %g0
	.word	0xc02e7feb	! t0_kref+0x1d24:   	clrb	[%i1 - 0x15]
	.word	0x944026ed	! t0_kref+0x1d28:   	addc	%g0, 0x6ed, %o2
	.word	0xc030a01e	! t0_kref+0x1d2c:   	clrh	[%g2 + 0x1e]
	.word	0xd8380018	! t0_kref+0x1d30:   	std	%o4, [%g0 + %i0]
	.word	0xc9262010	! t0_kref+0x1d34:   	st	%f4, [%i0 + 0x10]
	.word	0x89a00524	! t0_kref+0x1d38:   	fsqrts	%f4, %f4
	.word	0x89a108a4	! t0_kref+0x1d3c:   	fsubs	%f4, %f4, %f4
	.word	0x80183a2a	! t0_kref+0x1d40:   	xor	%g0, -0x5d6, %g0
	.word	0x95b10444	! t0_kref+0x1d44:   	fcmpne16	%f4, %f4, %o2
	.word	0x89b10a04	! t0_kref+0x1d48:   	fpadd16	%f4, %f4, %f4
	.word	0x81a90aa4	! t0_kref+0x1d4c:   	fcmpes	%fcc0, %f4, %f4
	.word	0x89a00124	! t0_kref+0x1d50:   	fabss	%f4, %f4
	.word	0x9bb00140	! t0_kref+0x1d54:   	edge32l	%g0, %g0, %o5
	.word	0xc900a038	! t0_kref+0x1d58:   	ld	[%g2 + 0x38], %f4
	.word	0x2a800004	! t0_kref+0x1d5c:   	bcs,a	_kref+0x1d6c
	.word	0xd0fe501c	! t0_kref+0x1d60:   	swapa	[%i1 + %i4]0x80, %o0
	.word	0x89a00524	! t0_kref+0x1d64:   	fsqrts	%f4, %f4
	.word	0x24800007	! t0_kref+0x1d68:   	ble,a	_kref+0x1d84
	.word	0x89a00544	! t0_kref+0x1d6c:   	fsqrtd	%f4, %f4
	.word	0x89a01a44	! t0_kref+0x1d70:   	fdtoi	%f4, %f4
	.word	0xc91e6010	! t0_kref+0x1d74:   	ldd	[%i1 + 0x10], %f4
	.word	0xc04e2005	! t0_kref+0x1d78:   	ldsb	[%i0 + 5], %g0
	.word	0x81a90a24	! t0_kref+0x1d7c:   	fcmps	%fcc0, %f4, %f4
	.word	0xc93e6018	! t0_kref+0x1d80:   	std	%f4, [%i1 + 0x18]
	.word	0x89a018c4	! t0_kref+0x1d84:   	fdtos	%f4, %f4
	.word	0x89a109a4	! t0_kref+0x1d88:   	fdivs	%f4, %f4, %f4
	.word	0xe89f5018	! t0_kref+0x1d8c:   	ldda	[%i5 + %i0]0x80, %l4
	.word	0xec9f5058	! t0_kref+0x1d90:   	ldda	[%i5 + %i0]0x82, %l6
	.word	0x89b00764	! t0_kref+0x1d94:   	fpack16	%f4, %f4
	.word	0x89b10c44	! t0_kref+0x1d98:   	fnor	%f4, %f4, %f4
	.word	0x89a00144	! t0_kref+0x1d9c:   	fabsd	%f4, %f4
	.word	0x9de3bfa0	! t0_kref+0x1da0:   	save	%sp, -0x60, %sp
	.word	0x91ee7852	! t0_kref+0x1da4:   	restore	%i1, -0x7ae, %o0
	.word	0xd408a009	! t0_kref+0x1da8:   	ldub	[%g2 + 9], %o2
	.word	0x89a01a24	! t0_kref+0x1dac:   	fstoi	%f4, %f4
	.word	0xef68a04f	! t0_kref+0x1db0:   	prefetch	%g2 + 0x4f, 23
	.word	0x9b408000	! t0_kref+0x1db4:   	mov	%ccr, %o5
	.word	0x94080000	! t0_kref+0x1db8:   	and	%g0, %g0, %o2
	.word	0x99400000	! t0_kref+0x1dbc:   	mov	%y, %o4
	.word	0x96f00000	! t0_kref+0x1dc0:   	udivcc	%g0, %g0, %o3
	.word	0x9a980000	! t0_kref+0x1dc4:   	xorcc	%g0, %g0, %o5
	.word	0x90d83b27	! t0_kref+0x1dc8:   	smulcc	%g0, -0x4d9, %o0
	.word	0xc920a004	! t0_kref+0x1dcc:   	st	%f4, [%g2 + 4]
	.word	0x941023af	! t0_kref+0x1dd0:   	mov	0x3af, %o2
	.word	0x89a108a4	! t0_kref+0x1dd4:   	fsubs	%f4, %f4, %f4
	.word	0x9ea82633	! t0_kref+0x1dd8:   	andncc	%g0, 0x633, %o7
	.word	0xd456201a	! t0_kref+0x1ddc:   	ldsh	[%i0 + 0x1a], %o2
	.word	0x89b00fe0	! t0_kref+0x1de0:   	fones	%f4
	.word	0x89a108a4	! t0_kref+0x1de4:   	fsubs	%f4, %f4, %f4
	.word	0x89a01904	! t0_kref+0x1de8:   	fitod	%f4, %f4
	.word	0x89a108a4	! t0_kref+0x1dec:   	fsubs	%f4, %f4, %f4
	.word	0x964039a9	! t0_kref+0x1df0:   	addc	%g0, -0x657, %o3
	.word	0x95400000	! t0_kref+0x1df4:   	mov	%y, %o2
	.word	0x9a302aa6	! t0_kref+0x1df8:   	orn	%g0, 0xaa6, %o5
	.word	0x80a83001	! t0_kref+0x1dfc:   	andncc	%g0, -0xfff, %g0
	.word	0xee4e4000	! t0_kref+0x1e00:   	ldsb	[%i1], %l7
	.word	0xe43e6000	! t0_kref+0x1e04:   	std	%l2, [%i1]
	.word	0x89a109a4	! t0_kref+0x1e08:   	fdivs	%f4, %f4, %f4
	.word	0xd20e7fef	! t0_kref+0x1e0c:   	ldub	[%i1 - 0x11], %o1
	.word	0x89b10624	! t0_kref+0x1e10:   	fmul8x16	%f4, %f4, %f4
	.word	0x89a94044	! t0_kref+0x1e14:   	fmovdug	%fcc0, %f4, %f4
	.word	0x97400000	! t0_kref+0x1e18:   	mov	%y, %o3
	.word	0x9fc10000	! t0_kref+0x1e1c:   	call	%g4
	.word	0x89a01924	! t0_kref+0x1e20:   	fstod	%f4, %f4
	.word	0xde00a01c	! t0_kref+0x1e24:   	ld	[%g2 + 0x1c], %o7
	.word	0x001fffff	! t0_kref+0x1e28:   	illtrap	0x1fffff
	.word	0x89b10d24	! t0_kref+0x1e2c:   	fandnot1s	%f4, %f4, %f4
	.word	0x89a10924	! t0_kref+0x1e30:   	fmuls	%f4, %f4, %f4
	.word	0x89a00124	! t0_kref+0x1e34:   	fabss	%f4, %f4
	.word	0xc920a010	! t0_kref+0x1e38:   	st	%f4, [%g2 + 0x10]
	.word	0xc028a004	! t0_kref+0x1e3c:   	clrb	[%g2 + 4]
	.word	0x89b10e44	! t0_kref+0x1e40:   	fxnor	%f4, %f4, %f4
	.word	0xaea00000	! t0_kref+0x1e44:   	subcc	%g0, %g0, %l7
	.word	0xd85e2008	! t0_kref+0x1e48:   	ldx	[%i0 + 8], %o4
	.word	0xc0267ff8	! t0_kref+0x1e4c:   	clr	[%i1 - 8]
	.word	0x89a108c4	! t0_kref+0x1e50:   	fsubd	%f4, %f4, %f4
	.word	0xc900a01c	! t0_kref+0x1e54:   	ld	[%g2 + 0x1c], %f4
	.word	0x94102aa8	! t0_kref+0x1e58:   	mov	0xaa8, %o2
	.word	0x34800002	! t0_kref+0x1e5c:   	bg,a	_kref+0x1e64
	.word	0x9e883c33	! t0_kref+0x1e60:   	andcc	%g0, -0x3cd, %o7
	.word	0x89a00124	! t0_kref+0x1e64:   	fabss	%f4, %f4
	.word	0xc026601c	! t0_kref+0x1e68:   	clr	[%i1 + 0x1c]
	.word	0xd5f65000	! t0_kref+0x1e6c:   	casxa	[%i1]0x80, %g0, %o2
	.word	0x81a90a44	! t0_kref+0x1e70:   	fcmpd	%fcc0, %f4, %f4
	.word	0x90a80000	! t0_kref+0x1e74:   	andncc	%g0, %g0, %o0
	.word	0x93b10584	! t0_kref+0x1e78:   	fcmpgt32	%f4, %f4, %o1
	.word	0x32800008	! t0_kref+0x1e7c:   	bne,a	_kref+0x1e9c
	.word	0x96f83e3c	! t0_kref+0x1e80:   	sdivcc	%g0, -0x1c4, %o3
	.word	0xc020a000	! t0_kref+0x1e84:   	clr	[%g2]
	.word	0xe03e001d	! t0_kref+0x1e88:   	std	%l0, [%i0 + %i5]
	.word	0xc9be1880	! t0_kref+0x1e8c:   	stda	%f4, [%i0]0xc4
	.word	0xd810a03a	! t0_kref+0x1e90:   	lduh	[%g2 + 0x3a], %o4
	.word	0x89a108a4	! t0_kref+0x1e94:   	fsubs	%f4, %f4, %f4
	.word	0x81a90a24	! t0_kref+0x1e98:   	fcmps	%fcc0, %f4, %f4
	.word	0x81a90ac4	! t0_kref+0x1e9c:   	fcmped	%fcc0, %f4, %f4
	.word	0x89a10824	! t0_kref+0x1ea0:   	fadds	%f4, %f4, %f4
	.word	0x89a10944	! t0_kref+0x1ea4:   	fmuld	%f4, %f4, %f4
	.word	0x90700000	! t0_kref+0x1ea8:   	udiv	%g0, %g0, %o0
	.word	0x99b105c4	! t0_kref+0x1eac:   	fcmpeq32	%f4, %f4, %o4
	.word	0x22800007	! t0_kref+0x1eb0:   	be,a	_kref+0x1ecc
	.word	0x93202e94	! t0_kref+0x1eb4:   	mulscc	%g0, 0xe94, %o1
	.word	0x89a000a4	! t0_kref+0x1eb8:   	fnegs	%f4, %f4
	.word	0x30800004	! t0_kref+0x1ebc:   	ba,a	_kref+0x1ecc
	.word	0x89a01904	! t0_kref+0x1ec0:   	fitod	%f4, %f4
	.word	0x97b00020	! t0_kref+0x1ec4:   	edge8n	%g0, %g0, %o3
	.word	0xc020a034	! t0_kref+0x1ec8:   	clr	[%g2 + 0x34]
	.word	0x86102001	! t0_kref+0x1ecc:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x1ed0:   	bne,a	_kref+0x1ed0
	.word	0x86a0e001	! t0_kref+0x1ed4:   	subcc	%g3, 1, %g3
	.word	0x91b00280	! t0_kref+0x1ed8:   	array32	%g0, %g0, %o0
	.word	0xd0067fec	! t0_kref+0x1edc:   	ld	[%i1 - 0x14], %o0
	.word	0x81800000	! t0_kref+0x1ee0:   	mov	%g0, %y
	.word	0x89a00124	! t0_kref+0x1ee4:   	fabss	%f4, %f4
	.word	0x9a280000	! t0_kref+0x1ee8:   	andn	%g0, %g0, %o5
	.word	0x2c800002	! t0_kref+0x1eec:   	bneg,a	_kref+0x1ef4
	.word	0x89a00524	! t0_kref+0x1ef0:   	fsqrts	%f4, %f4
	.word	0xf207bfe0	! t0_kref+0x1ef4:   	ld	[%fp - 0x20], %i1
	.word	0x89a01a24	! t0_kref+0x1ef8:   	fstoi	%f4, %f4
	call	SYM(t0_subr0)
	.word	0x89a108a4	! t0_kref+0x1f00:   	fsubs	%f4, %f4, %f4
	.word	0x80c00000	! t0_kref+0x1f04:   	addccc	%g0, %g0, %g0
	.word	0x80300000	! t0_kref+0x1f08:   	orn	%g0, %g0, %g0
	.word	0xc920a030	! t0_kref+0x1f0c:   	st	%f4, [%g2 + 0x30]
	.word	0xd286501c	! t0_kref+0x1f10:   	lda	[%i1 + %i4]0x80, %o1
	.word	0x89a01904	! t0_kref+0x1f14:   	fitod	%f4, %f4
	.word	0xc91fbec0	! t0_kref+0x1f18:   	ldd	[%fp - 0x140], %f4
	.word	0x89a10844	! t0_kref+0x1f1c:   	faddd	%f4, %f4, %f4
	.word	0xe3b8a080	! t0_kref+0x1f20:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x38800004	! t0_kref+0x1f24:   	bgu,a	_kref+0x1f34
	.word	0xd248a02d	! t0_kref+0x1f28:   	ldsb	[%g2 + 0x2d], %o1
	.word	0xc028a03f	! t0_kref+0x1f2c:   	clrb	[%g2 + 0x3f]
	.word	0xc0260000	! t0_kref+0x1f30:   	clr	[%i0]
	.word	0x89b10ca4	! t0_kref+0x1f34:   	fandnot2s	%f4, %f4, %f4
	.word	0x9fc00004	! t0_kref+0x1f38:   	call	%g0 + %g4
	.word	0xe0067fe4	! t0_kref+0x1f3c:   	ld	[%i1 - 0x1c], %l0
	.word	0x80e00000	! t0_kref+0x1f40:   	subccc	%g0, %g0, %g0
	.word	0x9eb80000	! t0_kref+0x1f44:   	xnorcc	%g0, %g0, %o7
	.word	0x9b400000	! t0_kref+0x1f48:   	mov	%y, %o5
	.word	0x98003006	! t0_kref+0x1f4c:   	add	%g0, -0xffa, %o4
	.word	0xd20e0000	! t0_kref+0x1f50:   	ldub	[%i0], %o1
	.word	0xc028a01c	! t0_kref+0x1f54:   	clrb	[%g2 + 0x1c]
	.word	0x95b00200	! t0_kref+0x1f58:   	array8	%g0, %g0, %o2
	.word	0xd8180018	! t0_kref+0x1f5c:   	ldd	[%g0 + %i0], %o4
	.word	0xe3f65000	! t0_kref+0x1f60:   	casxa	[%i1]0x80, %g0, %l1
	.word	0x89b10704	! t0_kref+0x1f64:   	fmuld8sux16	%f4, %f4, %f4
	.word	0xee7e6014	! t0_kref+0x1f68:   	swap	[%i1 + 0x14], %l7
	.word	0xc020a02c	! t0_kref+0x1f6c:   	clr	[%g2 + 0x2c]
	.word	0xc9267fe8	! t0_kref+0x1f70:   	st	%f4, [%i1 - 0x18]
	.word	0x9490309d	! t0_kref+0x1f74:   	orcc	%g0, -0xf63, %o2
	.word	0x89a01904	! t0_kref+0x1f78:   	fitod	%f4, %f4
	.word	0x81da4019	! t0_kref+0x1f7c:   	flush	%o1 + %i1
	.word	0xc9062010	! t0_kref+0x1f80:   	ld	[%i0 + 0x10], %f4
	.word	0xe1ee501d	! t0_kref+0x1f84:   	prefetcha	%i1 + %i5, 16
	.word	0x2e800001	! t0_kref+0x1f88:   	bvs,a	_kref+0x1f8c
	.word	0xe26e4000	! t0_kref+0x1f8c:   	ldstub	[%i1], %l1
	.word	0x90100000	! t0_kref+0x1f90:   	clr	%o0
	.word	0x95202101	! t0_kref+0x1f94:   	mulscc	%g0, 0x101, %o2
	.word	0x89b007a4	! t0_kref+0x1f98:   	fpackfix	%f4, %f4
	.word	0x89a01084	! t0_kref+0x1f9c:   	fxtos	%f4, %f4
	.word	0x86102002	! t0_kref+0x1fa0:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x1fa4:   	bne,a	_kref+0x1fa4
	.word	0x86a0e001	! t0_kref+0x1fa8:   	subcc	%g3, 1, %g3
	.word	0x9a182e1a	! t0_kref+0x1fac:   	xor	%g0, 0xe1a, %o5
	.word	0x89b00764	! t0_kref+0x1fb0:   	fpack16	%f4, %f4
	.word	0xc807bfe8	! t0_kref+0x1fb4:   	ld	[%fp - 0x18], %g4
	.word	0x97300000	! t0_kref+0x1fb8:   	srl	%g0, %g0, %o3
	.word	0x9b280000	! t0_kref+0x1fbc:   	sll	%g0, %g0, %o5
	.word	0x9a600000	! t0_kref+0x1fc0:   	subc	%g0, %g0, %o5
	.word	0x2e800008	! t0_kref+0x1fc4:   	bvs,a	_kref+0x1fe4
	.word	0xd8180018	! t0_kref+0x1fc8:   	ldd	[%g0 + %i0], %o4
	.word	0x98380000	! t0_kref+0x1fcc:   	not	%g0, %o4
	.word	0x2e480007	! t0_kref+0x1fd0:   	bvs,a,pt	%icc, _kref+0x1fec
	.word	0xc0260000	! t0_kref+0x1fd4:   	clr	[%i0]
	.word	0x89a01924	! t0_kref+0x1fd8:   	fstod	%f4, %f4
	.word	0x9fc00004	! t0_kref+0x1fdc:   	call	%g0 + %g4
	.word	0x89a00524	! t0_kref+0x1fe0:   	fsqrts	%f4, %f4
	.word	0x96182b3f	! t0_kref+0x1fe4:   	xor	%g0, 0xb3f, %o3
	.word	0xe9ee501d	! t0_kref+0x1fe8:   	prefetcha	%i1 + %i5, 20
	.word	0x99400000	! t0_kref+0x1fec:   	mov	%y, %o4
	.word	0xc920a014	! t0_kref+0x1ff0:   	st	%f4, [%g2 + 0x14]
	.word	0x89b10fa4	! t0_kref+0x1ff4:   	fors	%f4, %f4, %f4
	.word	0x94300000	! t0_kref+0x1ff8:   	orn	%g0, %g0, %o2
	.word	0xc9be5a1c	! t0_kref+0x1ffc:   	stda	%f4, [%i1 + %i4]0xd0
	.word	0x9344c000	! t0_kref+0x2000:   	mov	%gsr, %o1
	.word	0x81a90aa4	! t0_kref+0x2004:   	fcmpes	%fcc0, %f4, %f4
	.word	0xd4063fe8	! t0_kref+0x2008:   	ld	[%i0 - 0x18], %o2
	.word	0x36800003	! t0_kref+0x200c:   	bge,a	_kref+0x2018
	.word	0x81d977c6	! t0_kref+0x2010:   	flush	%g5 - 0x83a
	.word	0x89a10844	! t0_kref+0x2014:   	faddd	%f4, %f4, %f4
	.word	0x9b418000	! t0_kref+0x2018:   	mov	%fprs, %o5
	.word	0x90583e33	! t0_kref+0x201c:   	smul	%g0, -0x1cd, %o0
	.word	0xc9871058	! t0_kref+0x2020:   	lda	[%i4 + %i0]0x82, %f4
	.word	0x90600000	! t0_kref+0x2024:   	subc	%g0, %g0, %o0
	.word	0x97302009	! t0_kref+0x2028:   	srl	%g0, 0x9, %o3
	.word	0x98803978	! t0_kref+0x202c:   	addcc	%g0, -0x688, %o4
	.word	0x92200000	! t0_kref+0x2030:   	neg	%g0, %o1
	.word	0x96a83768	! t0_kref+0x2034:   	andncc	%g0, -0x898, %o3
	.word	0x89b10664	! t0_kref+0x2038:   	fmul8x16au	%f4, %f4, %f4
	.word	0x8058273a	! t0_kref+0x203c:   	smul	%g0, 0x73a, %g0
	.word	0x90100000	! t0_kref+0x2040:   	clr	%o0
	.word	0x89a10944	! t0_kref+0x2044:   	fmuld	%f4, %f4, %f4
	.word	0x98c03ef3	! t0_kref+0x2048:   	addccc	%g0, -0x10d, %o4
	.word	0x89b10d60	! t0_kref+0x204c:   	fnot1s	%f4, %f4
	.word	0x89b10724	! t0_kref+0x2050:   	fmuld8ulx16	%f4, %f4, %f4
	.word	0x9bb00000	! t0_kref+0x2054:   	edge8	%g0, %g0, %o5
	.word	0xa7800000	! t0_kref+0x2058:   	mov	%g0, %gsr
	.word	0xec380018	! t0_kref+0x205c:   	std	%l6, [%g0 + %i0]
	.word	0xda10a036	! t0_kref+0x2060:   	lduh	[%g2 + 0x36], %o5
	.word	0x81a90aa4	! t0_kref+0x2064:   	fcmpes	%fcc0, %f4, %f4
	.word	0xc9bf5a19	! t0_kref+0x2068:   	stda	%f4, [%i5 + %i1]0xd0
	.word	0x89a00124	! t0_kref+0x206c:   	fabss	%f4, %f4
	.word	0x38800005	! t0_kref+0x2070:   	bgu,a	_kref+0x2084
	.word	0xd816001b	! t0_kref+0x2074:   	lduh	[%i0 + %i3], %o4
	.word	0x99400000	! t0_kref+0x2078:   	mov	%y, %o4
	.word	0x89a108c4	! t0_kref+0x207c:   	fsubd	%f4, %f4, %f4
	.word	0xc807bfec	! t0_kref+0x2080:   	ld	[%fp - 0x14], %g4
	.word	0x2a480008	! t0_kref+0x2084:   	bcs,a,pt	%icc, _kref+0x20a4
	.word	0x89a00124	! t0_kref+0x2088:   	fabss	%f4, %f4
	.word	0x94183172	! t0_kref+0x208c:   	xor	%g0, -0xe8e, %o2
	.word	0x89a108c4	! t0_kref+0x2090:   	fsubd	%f4, %f4, %f4
	call	SYM(t0_subr1)
	.word	0x97b00020	! t0_kref+0x2098:   	edge8n	%g0, %g0, %o3
	.word	0xef6e7fe0	! t0_kref+0x209c:   	prefetch	%i1 - 0x20, 23
	.word	0xec3e001d	! t0_kref+0x20a0:   	std	%l6, [%i0 + %i5]
	.word	0x968035ce	! t0_kref+0x20a4:   	addcc	%g0, -0xa32, %o3
	.word	0xc028a035	! t0_kref+0x20a8:   	clrb	[%g2 + 0x35]
	.word	0x89a10844	! t0_kref+0x20ac:   	faddd	%f4, %f4, %f4
	.word	0x89a109c4	! t0_kref+0x20b0:   	fdivd	%f4, %f4, %f4
	.word	0x9fc10000	! t0_kref+0x20b4:   	call	%g4
	.word	0xe0064000	! t0_kref+0x20b8:   	ld	[%i1], %l0
	.word	0xee100019	! t0_kref+0x20bc:   	lduh	[%g0 + %i1], %l7
	.word	0x89a01924	! t0_kref+0x20c0:   	fstod	%f4, %f4
	.word	0x89b10e44	! t0_kref+0x20c4:   	fxnor	%f4, %f4, %f4
	.word	0x89b106c4	! t0_kref+0x20c8:   	fmul8sux16	%f4, %f4, %f4
	.word	0xaea80000	! t0_kref+0x20cc:   	andncc	%g0, %g0, %l7
	.word	0xaec031fa	! t0_kref+0x20d0:   	addccc	%g0, -0xe06, %l7
	.word	0xae1025cf	! t0_kref+0x20d4:   	mov	0x5cf, %l7
	.word	0x89b00f04	! t0_kref+0x20d8:   	fsrc2	%f4, %f4
	.word	0x89a000a4	! t0_kref+0x20dc:   	fnegs	%f4, %f4
	.word	0xa7802a3c	! t0_kref+0x20e0:   	mov	0xa3c, %gsr
	.word	0x89b10e64	! t0_kref+0x20e4:   	fxnors	%f4, %f4, %f4
	.word	0xc7ee1000	! t0_kref+0x20e8:   	prefetcha	%i0, 3
	.word	0x89a00044	! t0_kref+0x20ec:   	fmovd	%f4, %f4
	.word	0x9fc10000	! t0_kref+0x20f0:   	call	%g4
	.word	0x89a01924	! t0_kref+0x20f4:   	fstod	%f4, %f4
	.word	0xc9000018	! t0_kref+0x20f8:   	ld	[%g0 + %i0], %f4
	.word	0x22800001	! t0_kref+0x20fc:   	be,a	_kref+0x2100
	.word	0x89a01924	! t0_kref+0x2100:   	fstod	%f4, %f4
	.word	0xd4166016	! t0_kref+0x2104:   	lduh	[%i1 + 0x16], %o2
	.word	0xaf28201a	! t0_kref+0x2108:   	sll	%g0, 0x1a, %l7
	.word	0x89a01a44	! t0_kref+0x210c:   	fdtoi	%f4, %f4
	.word	0x90500000	! t0_kref+0x2110:   	umul	%g0, %g0, %o0
	.word	0x98180000	! t0_kref+0x2114:   	xor	%g0, %g0, %o4
	.word	0x34800006	! t0_kref+0x2118:   	bg,a	_kref+0x2130
	.word	0x98880000	! t0_kref+0x211c:   	andcc	%g0, %g0, %o4
	.word	0xc9bf5a58	! t0_kref+0x2120:   	stda	%f4, [%i5 + %i0]0xd2
	.word	0x89a10944	! t0_kref+0x2124:   	fmuld	%f4, %f4, %f4
	.word	0x89a00044	! t0_kref+0x2128:   	fmovd	%f4, %f4
	.word	0xe41e3fe0	! t0_kref+0x212c:   	ldd	[%i0 - 0x20], %l2
	.word	0x9a702aa9	! t0_kref+0x2130:   	udiv	%g0, 0xaa9, %o5
	.word	0xae600000	! t0_kref+0x2134:   	subc	%g0, %g0, %l7
	.word	0x9af838d3	! t0_kref+0x2138:   	sdivcc	%g0, -0x72d, %o5
	.word	0x89a109a4	! t0_kref+0x213c:   	fdivs	%f4, %f4, %f4
	.word	0x9ef83e1b	! t0_kref+0x2140:   	sdivcc	%g0, -0x1e5, %o7
	.word	0x34800007	! t0_kref+0x2144:   	bg,a	_kref+0x2160
	.word	0x81400000	! t0_kref+0x2148:   	mov	%y, %g0
	.word	0x92e036dc	! t0_kref+0x214c:   	subccc	%g0, -0x924, %o1
	.word	0x89a10844	! t0_kref+0x2150:   	faddd	%f4, %f4, %f4
	.word	0x89a00124	! t0_kref+0x2154:   	fabss	%f4, %f4
	.word	0xc0163fe4	! t0_kref+0x2158:   	lduh	[%i0 - 0x1c], %g0
	.word	0x9ef829fc	! t0_kref+0x215c:   	sdivcc	%g0, 0x9fc, %o7
	.word	0x92200000	! t0_kref+0x2160:   	neg	%g0, %o1
	.word	0xe81e7ff8	! t0_kref+0x2164:   	ldd	[%i1 - 8], %l4
	.word	0x89b10e24	! t0_kref+0x2168:   	fands	%f4, %f4, %f4
	.word	0xd40e6014	! t0_kref+0x216c:   	ldub	[%i1 + 0x14], %o2
	.word	0x89aa0044	! t0_kref+0x2170:   	fmovda	%fcc0, %f4, %f4
	.word	0xc9267ff0	! t0_kref+0x2174:   	st	%f4, [%i1 - 0x10]
	.word	0xc0364000	! t0_kref+0x2178:   	clrh	[%i1]
	.word	0xd0560000	! t0_kref+0x217c:   	ldsh	[%i0], %o0
	.word	0x96100000	! t0_kref+0x2180:   	clr	%o3
	.word	0x94802708	! t0_kref+0x2184:   	addcc	%g0, 0x708, %o2
	.word	0x89a00144	! t0_kref+0x2188:   	fabsd	%f4, %f4
	.word	0xd84e7fe3	! t0_kref+0x218c:   	ldsb	[%i1 - 0x1d], %o4
	.word	0x9610352a	! t0_kref+0x2190:   	mov	0xfffff52a, %o3
	.word	0x89a108c4	! t0_kref+0x2194:   	fsubd	%f4, %f4, %f4
	.word	0x89b106a4	! t0_kref+0x2198:   	fmul8x16al	%f4, %f4, %f4
	.word	0xee78a010	! t0_kref+0x219c:   	swap	[%g2 + 0x10], %l7
	call	SYM(t0_subr2)
	.word	0x811822f6	! t0_kref+0x21a4:   	tsubcctv	%g0, 0x2f6, %g0
	.word	0x97b10404	! t0_kref+0x21a8:   	fcmple16	%f4, %f4, %o3
	.word	0x96e00000	! t0_kref+0x21ac:   	subccc	%g0, %g0, %o3
	.word	0x36800007	! t0_kref+0x21b0:   	bge,a	_kref+0x21cc
	.word	0xda4e401a	! t0_kref+0x21b4:   	ldsb	[%i1 + %i2], %o5
	.word	0x89a00124	! t0_kref+0x21b8:   	fabss	%f4, %f4
	.word	0x81800000	! t0_kref+0x21bc:   	mov	%g0, %y
	call	SYM(t0_subr1)
	.word	0x89a109c4	! t0_kref+0x21c4:   	fdivd	%f4, %f4, %f4
	.word	0x89b10f44	! t0_kref+0x21c8:   	fornot1	%f4, %f4, %f4
	.word	0x93100000	! t0_kref+0x21cc:   	taddcctv	%g0, %g0, %o1
	.word	0x89a10924	! t0_kref+0x21d0:   	fmuls	%f4, %f4, %f4
	.word	0x89b10ae4	! t0_kref+0x21d4:   	fpsub32s	%f4, %f4, %f4
	.word	0x97300000	! t0_kref+0x21d8:   	srl	%g0, %g0, %o3
	.word	0x89a10924	! t0_kref+0x21dc:   	fmuls	%f4, %f4, %f4
	.word	0xde48a025	! t0_kref+0x21e0:   	ldsb	[%g2 + 0x25], %o7
	.word	0x89b10624	! t0_kref+0x21e4:   	fmul8x16	%f4, %f4, %f4
	.word	0x95b10484	! t0_kref+0x21e8:   	fcmple32	%f4, %f4, %o2
	.word	0x89a10924	! t0_kref+0x21ec:   	fmuls	%f4, %f4, %f4
	.word	0xc9861000	! t0_kref+0x21f0:   	lda	[%i0]0x80, %f4
	.word	0x95280000	! t0_kref+0x21f4:   	sll	%g0, %g0, %o2
	.word	0x9ef80000	! t0_kref+0x21f8:   	sdivcc	%g0, %g0, %o7
	.word	0x81a90ac4	! t0_kref+0x21fc:   	fcmped	%fcc0, %f4, %f4
	.word	0x89a01904	! t0_kref+0x2200:   	fitod	%f4, %f4
	.word	0xde4e001a	! t0_kref+0x2204:   	ldsb	[%i0 + %i2], %o7
	.word	0x89b10d24	! t0_kref+0x2208:   	fandnot1s	%f4, %f4, %f4
	.word	0x9b400000	! t0_kref+0x220c:   	mov	%y, %o5
	.word	0x96a8245f	! t0_kref+0x2210:   	andncc	%g0, 0x45f, %o3
	.word	0xc0200019	! t0_kref+0x2214:   	clr	[%g0 + %i1]
	.word	0x89a00124	! t0_kref+0x2218:   	fabss	%f4, %f4
	.word	0x89a10844	! t0_kref+0x221c:   	faddd	%f4, %f4, %f4
	.word	0x94000000	! t0_kref+0x2220:   	add	%g0, %g0, %o2
	.word	0x94f828ac	! t0_kref+0x2224:   	sdivcc	%g0, 0x8ac, %o2
	.word	0x96b00000	! t0_kref+0x2228:   	orncc	%g0, %g0, %o3
	.word	0x89a10824	! t0_kref+0x222c:   	fadds	%f4, %f4, %f4
	.word	0x89a108a4	! t0_kref+0x2230:   	fsubs	%f4, %f4, %f4
	.word	0x9600235a	! t0_kref+0x2234:   	add	%g0, 0x35a, %o3
	call	SYM(t0_subr3)
	.word	0x89a10d24	! t0_kref+0x223c:   	fsmuld	%f4, %f4, %f4
	.word	0x943827ab	! t0_kref+0x2240:   	xnor	%g0, 0x7ab, %o2
	.word	0x9e800000	! t0_kref+0x2244:   	addcc	%g0, %g0, %o7
	.word	0x89a10824	! t0_kref+0x2248:   	fadds	%f4, %f4, %f4
	.word	0x89a01904	! t0_kref+0x224c:   	fitod	%f4, %f4
	.word	0x89a01884	! t0_kref+0x2250:   	fitos	%f4, %f4
	.word	0x98b00000	! t0_kref+0x2254:   	orncc	%g0, %g0, %o4
	.word	0x89a10824	! t0_kref+0x2258:   	fadds	%f4, %f4, %f4
	.word	0x89a84024	! t0_kref+0x225c:   	fmovsne	%fcc0, %f4, %f4
	.word	0x89b10984	! t0_kref+0x2260:   	bshuffle	%f4, %f4, %f4
	call	SYM(t0_subr2)
	.word	0x98100000	! t0_kref+0x2268:   	clr	%o4
	.word	0x89a01924	! t0_kref+0x226c:   	fstod	%f4, %f4
	.word	0xc91fbc38	! t0_kref+0x2270:   	ldd	[%fp - 0x3c8], %f4
	.word	0xc000a008	! t0_kref+0x2274:   	ld	[%g2 + 8], %g0
	.word	0x89a108a4	! t0_kref+0x2278:   	fsubs	%f4, %f4, %f4
	.word	0xc02e4000	! t0_kref+0x227c:   	clrb	[%i1]
	.word	0x99300000	! t0_kref+0x2280:   	srl	%g0, %g0, %o4
	.word	0x81df400a	! t0_kref+0x2284:   	flush	%i5 + %o2
	.word	0xc926401c	! t0_kref+0x2288:   	st	%f4, [%i1 + %i4]
	.word	0x34800004	! t0_kref+0x228c:   	bg,a	_kref+0x229c
	.word	0x89b10da4	! t0_kref+0x2290:   	fxors	%f4, %f4, %f4
	.word	0xc028a018	! t0_kref+0x2294:   	clrb	[%g2 + 0x18]
	.word	0x8143c000	! t0_kref+0x2298:   	stbar
	.word	0x89a00524	! t0_kref+0x229c:   	fsqrts	%f4, %f4
	.word	0xc00e8018	! t0_kref+0x22a0:   	ldub	[%i2 + %i0], %g0
	.word	0x89b00c20	! t0_kref+0x22a4:   	fzeros	%f4
	.word	0x89a00024	! t0_kref+0x22a8:   	fmovs	%f4, %f4
	.word	0x81a90a24	! t0_kref+0x22ac:   	fcmps	%fcc0, %f4, %f4
	.word	0x81580000	! t0_kref+0x22b0:   	flushw
	.word	0x94100000	! t0_kref+0x22b4:   	clr	%o2
	.word	0x92c00000	! t0_kref+0x22b8:   	addccc	%g0, %g0, %o1
	.word	0xd010a008	! t0_kref+0x22bc:   	lduh	[%g2 + 8], %o0
	.word	0xe03e6018	! t0_kref+0x22c0:   	std	%l0, [%i1 + 0x18]
	.word	0x89a000a4	! t0_kref+0x22c4:   	fnegs	%f4, %f4
	.word	0x89a01a44	! t0_kref+0x22c8:   	fdtoi	%f4, %f4
	.word	0x81a90ac4	! t0_kref+0x22cc:   	fcmped	%fcc0, %f4, %f4
	.word	0x94c02b33	! t0_kref+0x22d0:   	addccc	%g0, 0xb33, %o2
	.word	0x89a01a44	! t0_kref+0x22d4:   	fdtoi	%f4, %f4
	.word	0x89a10944	! t0_kref+0x22d8:   	fmuld	%f4, %f4, %f4
	.word	0x89a10844	! t0_kref+0x22dc:   	faddd	%f4, %f4, %f4
	.word	0x80200000	! t0_kref+0x22e0:   	neg	%g0
	.word	0x89a10844	! t0_kref+0x22e4:   	faddd	%f4, %f4, %f4
	.word	0xaee00000	! t0_kref+0x22e8:   	subccc	%g0, %g0, %l7
	.word	0x97b00340	! t0_kref+0x22ec:   	alignaddrl	%g0, %g0, %o3
	.word	0x9fc00004	! t0_kref+0x22f0:   	call	%g0 + %g4
	.word	0x81702e9d	! t0_kref+0x22f4:   	popc	0xe9d, %g0
	.word	0xd840a004	! t0_kref+0x22f8:   	ldsw	[%g2 + 4], %o4
	.word	0x89a10944	! t0_kref+0x22fc:   	fmuld	%f4, %f4, %f4
	.word	0x80200000	! t0_kref+0x2300:   	neg	%g0
	.word	0x89b10964	! t0_kref+0x2304:   	fpmerge	%f4, %f4, %f4
	call	SYM(t0_subr0)
	.word	0xaed00000	! t0_kref+0x230c:   	umulcc	%g0, %g0, %l7
	.word	0x9b080000	! t0_kref+0x2310:   	tsubcc	%g0, %g0, %o5
	.word	0x92c00000	! t0_kref+0x2314:   	addccc	%g0, %g0, %o1
	.word	0x90880000	! t0_kref+0x2318:   	andcc	%g0, %g0, %o0
	.word	0xd856401b	! t0_kref+0x231c:   	ldsh	[%i1 + %i3], %o4
	.word	0x89a000c4	! t0_kref+0x2320:   	fnegd	%f4, %f4
	.word	0xee08a01b	! t0_kref+0x2324:   	ldub	[%g2 + 0x1b], %l7
	.word	0x95702954	! t0_kref+0x2328:   	popc	0x954, %o2
	.word	0x26800002	! t0_kref+0x232c:   	bl,a	_kref+0x2334
	.word	0x90580000	! t0_kref+0x2330:   	smul	%g0, %g0, %o0
	.word	0x89a10924	! t0_kref+0x2334:   	fmuls	%f4, %f4, %f4
	.word	0x81a90a24	! t0_kref+0x2338:   	fcmps	%fcc0, %f4, %f4
	call	SYM(t0_subr2)
	.word	0x89a000a4	! t0_kref+0x2340:   	fnegs	%f4, %f4
	.word	0xd7f65000	! t0_kref+0x2344:   	casxa	[%i1]0x80, %g0, %o3
	.word	0x85803208	! t0_kref+0x2348:   	mov	0xfffff208, %ccr
	.word	0x95400000	! t0_kref+0x234c:   	mov	%y, %o2
	.word	0x96d031c0	! t0_kref+0x2350:   	umulcc	%g0, -0xe40, %o3
	.word	0xf3ee101c	! t0_kref+0x2354:   	prefetcha	%i0 + %i4, 25
	.word	0x89a108a4	! t0_kref+0x2358:   	fsubs	%f4, %f4, %f4
	.word	0x91b00040	! t0_kref+0x235c:   	edge8l	%g0, %g0, %o0
	.word	0xc030a00e	! t0_kref+0x2360:   	clrh	[%g2 + 0xe]
	.word	0x89b10e24	! t0_kref+0x2364:   	fands	%f4, %f4, %f4
	.word	0xd440a028	! t0_kref+0x2368:   	ldsw	[%g2 + 0x28], %o2
	.word	0xc028a03b	! t0_kref+0x236c:   	clrb	[%g2 + 0x3b]
	.word	0x89a10824	! t0_kref+0x2370:   	fadds	%f4, %f4, %f4
	.word	0x90202a9c	! t0_kref+0x2374:   	sub	%g0, 0xa9c, %o0
	.word	0xd6164000	! t0_kref+0x2378:   	lduh	[%i1], %o3
	.word	0xda4e8019	! t0_kref+0x237c:   	ldsb	[%i2 + %i1], %o5
	.word	0xc030a02e	! t0_kref+0x2380:   	clrh	[%g2 + 0x2e]
	.word	0x96502cfc	! t0_kref+0x2384:   	umul	%g0, 0xcfc, %o3
	.word	0x89b10d04	! t0_kref+0x2388:   	fandnot1	%f4, %f4, %f4
	.word	0x93b10484	! t0_kref+0x238c:   	fcmple32	%f4, %f4, %o1
	.word	0x89b106c4	! t0_kref+0x2390:   	fmul8sux16	%f4, %f4, %f4
	.word	0xecee1000	! t0_kref+0x2394:   	ldstuba	[%i0]0x80, %l6
	.word	0x89a108c4	! t0_kref+0x2398:   	fsubd	%f4, %f4, %f4
	.word	0xaf300000	! t0_kref+0x239c:   	srl	%g0, %g0, %l7
	.word	0xc020a02c	! t0_kref+0x23a0:   	clr	[%g2 + 0x2c]
	.word	0x89a01904	! t0_kref+0x23a4:   	fitod	%f4, %f4
	.word	0x80500000	! t0_kref+0x23a8:   	umul	%g0, %g0, %g0
	.word	0x89a01924	! t0_kref+0x23ac:   	fstod	%f4, %f4
	.word	0x89a00544	! t0_kref+0x23b0:   	fsqrtd	%f4, %f4
	.word	0x89a00124	! t0_kref+0x23b4:   	fabss	%f4, %f4
	.word	0x94500000	! t0_kref+0x23b8:   	umul	%g0, %g0, %o2
	.word	0xc0567ff8	! t0_kref+0x23bc:   	ldsh	[%i1 - 8], %g0
	.word	0x95400000	! t0_kref+0x23c0:   	mov	%y, %o2
	.word	0xc020a010	! t0_kref+0x23c4:   	clr	[%g2 + 0x10]
	.word	0x89b00c00	! t0_kref+0x23c8:   	fzero	%f4
	.word	0x89a01924	! t0_kref+0x23cc:   	fstod	%f4, %f4
	.word	0x92880000	! t0_kref+0x23d0:   	andcc	%g0, %g0, %o1
	.word	0x86102007	! t0_kref+0x23d4:   	mov	0x7, %g3
	.word	0x86a0e001	! t0_kref+0x23d8:   	subcc	%g3, 1, %g3
	.word	0x22800018	! t0_kref+0x23dc:   	be,a	_kref+0x243c
	.word	0x92583019	! t0_kref+0x23e0:   	smul	%g0, -0xfe7, %o1
	.word	0x89a10924	! t0_kref+0x23e4:   	fmuls	%f4, %f4, %f4
	.word	0x96d829ae	! t0_kref+0x23e8:   	smulcc	%g0, 0x9ae, %o3
	.word	0x89b10a24	! t0_kref+0x23ec:   	fpadd16s	%f4, %f4, %f4
	.word	0x92300000	! t0_kref+0x23f0:   	orn	%g0, %g0, %o1
	.word	0xde06200c	! t0_kref+0x23f4:   	ld	[%i0 + 0xc], %o7
	.word	0x80900000	! t0_kref+0x23f8:   	tst	%g0
	.word	0x8143c000	! t0_kref+0x23fc:   	stbar
	.word	0xecb81018	! t0_kref+0x2400:   	stda	%l6, [%g0 + %i0]0x80
	.word	0x89a10944	! t0_kref+0x2404:   	fmuld	%f4, %f4, %f4
	.word	0x80300000	! t0_kref+0x2408:   	orn	%g0, %g0, %g0
	.word	0xd2d81019	! t0_kref+0x240c:   	ldxa	[%g0 + %i1]0x80, %o1
	.word	0xae580000	! t0_kref+0x2410:   	smul	%g0, %g0, %l7
	.word	0xd808a029	! t0_kref+0x2414:   	ldub	[%g2 + 0x29], %o4
	.word	0x89a10924	! t0_kref+0x2418:   	fmuls	%f4, %f4, %f4
	.word	0x89a10944	! t0_kref+0x241c:   	fmuld	%f4, %f4, %f4
	.word	0xc9871059	! t0_kref+0x2420:   	lda	[%i4 + %i1]0x82, %f4
	.word	0x99280000	! t0_kref+0x2424:   	sll	%g0, %g0, %o4
	.word	0x81580000	! t0_kref+0x2428:   	flushw
	.word	0x26bfffeb	! t0_kref+0x242c:   	bl,a	_kref+0x23d8
	.word	0x80400000	! t0_kref+0x2430:   	addc	%g0, %g0, %g0
	.word	0x89a00124	! t0_kref+0x2434:   	fabss	%f4, %f4
	.word	0x94c03751	! t0_kref+0x2438:   	addccc	%g0, -0x8af, %o2
	.word	0x81a90a44	! t0_kref+0x243c:   	fcmpd	%fcc0, %f4, %f4
	.word	0xda08a016	! t0_kref+0x2440:   	ldub	[%g2 + 0x16], %o5
	.word	0x81db001f	! t0_kref+0x2444:   	flush	%o4 + %i7
	.word	0x20800005	! t0_kref+0x2448:   	bn,a	_kref+0x245c
	.word	0x89a01924	! t0_kref+0x244c:   	fstod	%f4, %f4
	.word	0x92b80000	! t0_kref+0x2450:   	xnorcc	%g0, %g0, %o1
	.word	0x80180000	! t0_kref+0x2454:   	xor	%g0, %g0, %g0
	.word	0x2e480007	! t0_kref+0x2458:   	bvs,a,pt	%icc, _kref+0x2474
	.word	0x90080000	! t0_kref+0x245c:   	and	%g0, %g0, %o0
	.word	0x89a10844	! t0_kref+0x2460:   	faddd	%f4, %f4, %f4
	.word	0x9108246c	! t0_kref+0x2464:   	tsubcc	%g0, 0x46c, %o0
	.word	0x89a10844	! t0_kref+0x2468:   	faddd	%f4, %f4, %f4
	.word	0xea7e7fec	! t0_kref+0x246c:   	swap	[%i1 - 0x14], %l5
	.word	0xd800a03c	! t0_kref+0x2470:   	ld	[%g2 + 0x3c], %o4
	.word	0xaf700000	! t0_kref+0x2474:   	popc	%g0, %l7
	.word	0xc900a014	! t0_kref+0x2478:   	ld	[%g2 + 0x14], %f4
	.word	0x9e18205b	! t0_kref+0x247c:   	xor	%g0, 0x5b, %o7
	.word	0xe03e0000	! t0_kref+0x2480:   	std	%l0, [%i0]
	.word	0x89a00524	! t0_kref+0x2484:   	fsqrts	%f4, %f4
	.word	0x89a00524	! t0_kref+0x2488:   	fsqrts	%f4, %f4
	.word	0x2c480008	! t0_kref+0x248c:   	bneg,a,pt	%icc, _kref+0x24ac
	.word	0x89b10e80	! t0_kref+0x2490:   	fsrc1	%f4, %f4
	.word	0x89b10e44	! t0_kref+0x2494:   	fxnor	%f4, %f4, %f4
	.word	0xc9be5840	! t0_kref+0x2498:   	stda	%f4, [%i1]0xc2
	.word	0x8143c000	! t0_kref+0x249c:   	stbar
	.word	0x90c00000	! t0_kref+0x24a0:   	addccc	%g0, %g0, %o0
	.word	0x89a10924	! t0_kref+0x24a4:   	fmuls	%f4, %f4, %f4
	.word	0xd43e3ff0	! t0_kref+0x24a8:   	std	%o2, [%i0 - 0x10]
	.word	0x9bb00140	! t0_kref+0x24ac:   	edge32l	%g0, %g0, %o5
	.word	0xdec71018	! t0_kref+0x24b0:   	ldswa	[%i4 + %i0]0x80, %o7
	.word	0x89a108c4	! t0_kref+0x24b4:   	fsubd	%f4, %f4, %f4
	.word	0xda50a032	! t0_kref+0x24b8:   	ldsh	[%g2 + 0x32], %o5
	.word	0xfdee101c	! t0_kref+0x24bc:   	prefetcha	%i0 + %i4, 30
	.word	0xc91fbf68	! t0_kref+0x24c0:   	ldd	[%fp - 0x98], %f4
	.word	0x99b00020	! t0_kref+0x24c4:   	edge8n	%g0, %g0, %o4
	.word	0xee08a037	! t0_kref+0x24c8:   	ldub	[%g2 + 0x37], %l7
	.word	0x89b107c4	! t0_kref+0x24cc:   	pdist	%f4, %f4, %f4
	.word	0xc920a00c	! t0_kref+0x24d0:   	st	%f4, [%g2 + 0xc]
	.word	0xc9270019	! t0_kref+0x24d4:   	st	%f4, [%i4 + %i1]
	.word	0xc0063fe4	! t0_kref+0x24d8:   	ld	[%i0 - 0x1c], %g0
	.word	0x89a000a4	! t0_kref+0x24dc:   	fnegs	%f4, %f4
	.word	0xf56e401b	! t0_kref+0x24e0:   	prefetch	%i1 + %i3, 26
	.word	0x89a10844	! t0_kref+0x24e4:   	faddd	%f4, %f4, %f4
	.word	0x22800006	! t0_kref+0x24e8:   	be,a	_kref+0x2500
	.word	0x8143c000	! t0_kref+0x24ec:   	stbar
	.word	0xd64e8019	! t0_kref+0x24f0:   	ldsb	[%i2 + %i1], %o3
	.word	0x89a01904	! t0_kref+0x24f4:   	fitod	%f4, %f4
	.word	0xc020a020	! t0_kref+0x24f8:   	clr	[%g2 + 0x20]
	.word	0x89a018c4	! t0_kref+0x24fc:   	fdtos	%f4, %f4
	call	SYM(t0_subr3)
	.word	0x81400000	! t0_kref+0x2504:   	mov	%y, %g0
	.word	0x89a00544	! t0_kref+0x2508:   	fsqrtd	%f4, %f4
	.word	0xae800000	! t0_kref+0x250c:   	addcc	%g0, %g0, %l7
	.word	0x9320330c	! t0_kref+0x2510:   	mulscc	%g0, -0xcf4, %o1
	.word	0xc807bfe8	! t0_kref+0x2514:   	ld	[%fp - 0x18], %g4
	.word	0x89a00524	! t0_kref+0x2518:   	fsqrts	%f4, %f4
	.word	0x89a108c4	! t0_kref+0x251c:   	fsubd	%f4, %f4, %f4
	.word	0x89a10844	! t0_kref+0x2520:   	faddd	%f4, %f4, %f4
	.word	0x81280000	! t0_kref+0x2524:   	sll	%g0, %g0, %g0
	.word	0xc9263fe4	! t0_kref+0x2528:   	st	%f4, [%i0 - 0x1c]
	.word	0x9bb00060	! t0_kref+0x252c:   	edge8ln	%g0, %g0, %o5
	.word	0xc920a008	! t0_kref+0x2530:   	st	%f4, [%g2 + 8]
	.word	0x89a01884	! t0_kref+0x2534:   	fitos	%f4, %f4
	.word	0x38800001	! t0_kref+0x2538:   	bgu,a	_kref+0x253c
	.word	0x89a108c4	! t0_kref+0x253c:   	fsubd	%f4, %f4, %f4
	.word	0x89b00c00	! t0_kref+0x2540:   	fzero	%f4
	.word	0x91302016	! t0_kref+0x2544:   	srl	%g0, 0x16, %o0
	.word	0x97b00160	! t0_kref+0x2548:   	edge32ln	%g0, %g0, %o3
	.word	0x89a10844	! t0_kref+0x254c:   	faddd	%f4, %f4, %f4
	.word	0xd45e2018	! t0_kref+0x2550:   	ldx	[%i0 + 0x18], %o2
	.word	0x98702e52	! t0_kref+0x2554:   	udiv	%g0, 0xe52, %o4
	.word	0x89a10944	! t0_kref+0x2558:   	fmuld	%f4, %f4, %f4
	.word	0xc02e0000	! t0_kref+0x255c:   	clrb	[%i0]
	.word	0xd840a02c	! t0_kref+0x2560:   	ldsw	[%g2 + 0x2c], %o4
	.word	0x89a108a4	! t0_kref+0x2564:   	fsubs	%f4, %f4, %f4
	.word	0x98800000	! t0_kref+0x2568:   	addcc	%g0, %g0, %o4
	.word	0x89b10624	! t0_kref+0x256c:   	fmul8x16	%f4, %f4, %f4
	.word	0x89a10844	! t0_kref+0x2570:   	faddd	%f4, %f4, %f4
	.word	0xc91fbcf8	! t0_kref+0x2574:   	ldd	[%fp - 0x308], %f4
	.word	0xd050a018	! t0_kref+0x2578:   	ldsh	[%g2 + 0x18], %o0
	.word	0x89a10944	! t0_kref+0x257c:   	fmuld	%f4, %f4, %f4
	.word	0xc02e401a	! t0_kref+0x2580:   	clrb	[%i1 + %i2]
	.word	0xec3e4000	! t0_kref+0x2584:   	std	%l6, [%i1]
	.word	0x81a90aa4	! t0_kref+0x2588:   	fcmpes	%fcc0, %f4, %f4
	.word	0x80a83290	! t0_kref+0x258c:   	andncc	%g0, -0xd70, %g0
	.word	0xc030a004	! t0_kref+0x2590:   	clrh	[%g2 + 4]
	.word	0x89b10aa4	! t0_kref+0x2594:   	fpsub16s	%f4, %f4, %f4
	.word	0xd000a02c	! t0_kref+0x2598:   	ld	[%g2 + 0x2c], %o0
	.word	0xc0262008	! t0_kref+0x259c:   	clr	[%i0 + 8]
	.word	0xc91fbef0	! t0_kref+0x25a0:   	ldd	[%fp - 0x110], %f4
	.word	0x89a10944	! t0_kref+0x25a4:   	fmuld	%f4, %f4, %f4
	.word	0xd816001b	! t0_kref+0x25a8:   	lduh	[%i0 + %i3], %o4
	.word	0x89b00f24	! t0_kref+0x25ac:   	fsrc2s	%f4, %f4
	.word	0x80e035cb	! t0_kref+0x25b0:   	subccc	%g0, -0xa35, %g0
	.word	0xc900a038	! t0_kref+0x25b4:   	ld	[%g2 + 0x38], %f4
	.word	0x89a00524	! t0_kref+0x25b8:   	fsqrts	%f4, %f4
	.word	0xd41e3ff0	! t0_kref+0x25bc:   	ldd	[%i0 - 0x10], %o2
	.word	0xe7ee501a	! t0_kref+0x25c0:   	prefetcha	%i1 + %i2, 19
	.word	0x9fc10000	! t0_kref+0x25c4:   	call	%g4
	.word	0x89a01924	! t0_kref+0x25c8:   	fstod	%f4, %f4
	.word	0x93418000	! t0_kref+0x25cc:   	mov	%fprs, %o1
	.word	0xc900a024	! t0_kref+0x25d0:   	ld	[%g2 + 0x24], %f4
	.word	0xd67e7ff8	! t0_kref+0x25d4:   	swap	[%i1 - 8], %o3
	.word	0x9a803fe6	! t0_kref+0x25d8:   	addcc	%g0, -0x1a, %o5
	.word	0x89b10a24	! t0_kref+0x25dc:   	fpadd16s	%f4, %f4, %f4
	.word	0xd6060000	! t0_kref+0x25e0:   	ld	[%i0], %o3
	.word	0x89a109c4	! t0_kref+0x25e4:   	fdivd	%f4, %f4, %f4
	.word	0x92e033ab	! t0_kref+0x25e8:   	subccc	%g0, -0xc55, %o1
	.word	0xc020a00c	! t0_kref+0x25ec:   	clr	[%g2 + 0xc]
	.word	0x26480005	! t0_kref+0x25f0:   	bl,a,pt	%icc, _kref+0x2604
	.word	0x90a832fe	! t0_kref+0x25f4:   	andncc	%g0, -0xd02, %o0
	.word	0x80f82965	! t0_kref+0x25f8:   	sdivcc	%g0, 0x965, %g0
	.word	0x36800004	! t0_kref+0x25fc:   	bge,a	_kref+0x260c
	.word	0x96300000	! t0_kref+0x2600:   	orn	%g0, %g0, %o3
	.word	0x97b10584	! t0_kref+0x2604:   	fcmpgt32	%f4, %f4, %o3
	.word	0x92e00000	! t0_kref+0x2608:   	subccc	%g0, %g0, %o1
	.word	0x9e083f97	! t0_kref+0x260c:   	and	%g0, -0x69, %o7
	.word	0xc9be5800	! t0_kref+0x2610:   	stda	%f4, [%i1]0xc0
	.word	0x929826c4	! t0_kref+0x2614:   	xorcc	%g0, 0x6c4, %o1
	.word	0x9de3bfa0	! t0_kref+0x2618:   	save	%sp, -0x60, %sp
	.word	0x95ef401d	! t0_kref+0x261c:   	restore	%i5, %i5, %o2
	.word	0x89a00024	! t0_kref+0x2620:   	fmovs	%f4, %f4
	.word	0x81a90ac4	! t0_kref+0x2624:   	fcmped	%fcc0, %f4, %f4
	.word	0xc91fbf20	! t0_kref+0x2628:   	ldd	[%fp - 0xe0], %f4
	.word	0xd016001b	! t0_kref+0x262c:   	lduh	[%i0 + %i3], %o0
	.word	0xc9066018	! t0_kref+0x2630:   	ld	[%i1 + 0x18], %f4
	.word	0x89a01904	! t0_kref+0x2634:   	fitod	%f4, %f4
	.word	0xda7e7fe4	! t0_kref+0x2638:   	swap	[%i1 - 0x1c], %o5
	.word	0x193c177b	! t0_kref+0x263c:   	sethi	%hi(0xf05dec00), %o4
	.word	0xafb00200	! t0_kref+0x2640:   	array8	%g0, %g0, %l7
	.word	0x99b00140	! t0_kref+0x2644:   	edge32l	%g0, %g0, %o4
	.word	0x38800002	! t0_kref+0x2648:   	bgu,a	_kref+0x2650
	.word	0x81df6936	! t0_kref+0x264c:   	flush	%i5 + 0x936
	.word	0xc030a000	! t0_kref+0x2650:   	clrh	[%g2]
	.word	0xc020a024	! t0_kref+0x2654:   	clr	[%g2 + 0x24]
	.word	0x90202261	! t0_kref+0x2658:   	sub	%g0, 0x261, %o0
	.word	0x89a10944	! t0_kref+0x265c:   	fmuld	%f4, %f4, %f4
	.word	0x94300000	! t0_kref+0x2660:   	orn	%g0, %g0, %o2
	.word	0xae182682	! t0_kref+0x2664:   	xor	%g0, 0x682, %l7
	.word	0x89b107c4	! t0_kref+0x2668:   	pdist	%f4, %f4, %f4
	.word	0x90900000	! t0_kref+0x266c:   	orcc	%g0, %g0, %o0
	.word	0xaf302015	! t0_kref+0x2670:   	srl	%g0, 0x15, %l7
	.word	0x89a018c4	! t0_kref+0x2674:   	fdtos	%f4, %f4
	.word	0xd04e0000	! t0_kref+0x2678:   	ldsb	[%i0], %o0
	.word	0x944031f8	! t0_kref+0x267c:   	addc	%g0, -0xe08, %o2
	.word	0x98102f88	! t0_kref+0x2680:   	mov	0xf88, %o4
	.word	0x9ae028a6	! t0_kref+0x2684:   	subccc	%g0, 0x8a6, %o5
	.word	0x90983c95	! t0_kref+0x2688:   	xorcc	%g0, -0x36b, %o0
	.word	0xc028a007	! t0_kref+0x268c:   	clrb	[%g2 + 7]
	.word	0x89a00124	! t0_kref+0x2690:   	fabss	%f4, %f4
	.word	0x89b10f84	! t0_kref+0x2694:   	for	%f4, %f4, %f4
	.word	0x89a01904	! t0_kref+0x2698:   	fitod	%f4, %f4
	.word	0x81300000	! t0_kref+0x269c:   	srl	%g0, %g0, %g0
	.word	0x94f80000	! t0_kref+0x26a0:   	sdivcc	%g0, %g0, %o2
	.word	0x89a018c4	! t0_kref+0x26a4:   	fdtos	%f4, %f4
	.word	0x89a01a44	! t0_kref+0x26a8:   	fdtoi	%f4, %f4
	.word	0x89b10744	! t0_kref+0x26ac:   	fpack32	%f4, %f4, %f4
	.word	0x89a10844	! t0_kref+0x26b0:   	faddd	%f4, %f4, %f4
	.word	0xc807bff0	! t0_kref+0x26b4:   	ld	[%fp - 0x10], %g4
	.word	0x89a00044	! t0_kref+0x26b8:   	fmovd	%f4, %f4
	.word	0x92f82d55	! t0_kref+0x26bc:   	sdivcc	%g0, 0xd55, %o1
	.word	0x81580000	! t0_kref+0x26c0:   	flushw
	.word	0x981022c2	! t0_kref+0x26c4:   	mov	0x2c2, %o4
	.word	0x9fc00004	! t0_kref+0x26c8:   	call	%g0 + %g4
	.word	0x91200000	! t0_kref+0x26cc:   	mulscc	%g0, %g0, %o0
	.word	0x89b10c84	! t0_kref+0x26d0:   	fandnot2	%f4, %f4, %f4
	.word	0x89a10824	! t0_kref+0x26d4:   	fadds	%f4, %f4, %f4
	.word	0x89b10e64	! t0_kref+0x26d8:   	fxnors	%f4, %f4, %f4
	.word	0x81a90a44	! t0_kref+0x26dc:   	fcmpd	%fcc0, %f4, %f4
	.word	0x89a000a4	! t0_kref+0x26e0:   	fnegs	%f4, %f4
	.word	0x86102002	! t0_kref+0x26e4:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x26e8:   	bne,a	_kref+0x26e8
	.word	0x86a0e001	! t0_kref+0x26ec:   	subcc	%g3, 1, %g3
	.word	0x89b10744	! t0_kref+0x26f0:   	fpack32	%f4, %f4, %f4
	.word	0xc91fbef8	! t0_kref+0x26f4:   	ldd	[%fp - 0x108], %f4
	.word	0x89a00524	! t0_kref+0x26f8:   	fsqrts	%f4, %f4
	.word	0x96e00000	! t0_kref+0x26fc:   	subccc	%g0, %g0, %o3
	.word	0x928032ea	! t0_kref+0x2700:   	addcc	%g0, -0xd16, %o1
	.word	0xc91fbda0	! t0_kref+0x2704:   	ldd	[%fp - 0x260], %f4
	.word	0xd41e7ff8	! t0_kref+0x2708:   	ldd	[%i1 - 8], %o2
	.word	0x30800002	! t0_kref+0x270c:   	ba,a	_kref+0x2714
	.word	0x89b00c20	! t0_kref+0x2710:   	fzeros	%f4
	.word	0x89a01924	! t0_kref+0x2714:   	fstod	%f4, %f4
	.word	0x95400000	! t0_kref+0x2718:   	mov	%y, %o2
	.word	0xd80e6018	! t0_kref+0x271c:   	ldub	[%i1 + 0x18], %o4
	.word	0xda06401c	! t0_kref+0x2720:   	ld	[%i1 + %i4], %o5
	.word	0xc020a00c	! t0_kref+0x2724:   	clr	[%g2 + 0xc]
	.word	0x80900000	! t0_kref+0x2728:   	tst	%g0
	.word	0x96c00000	! t0_kref+0x272c:   	addccc	%g0, %g0, %o3
	.word	0x26480006	! t0_kref+0x2730:   	bl,a,pt	%icc, _kref+0x2748
	.word	0xc91fbce8	! t0_kref+0x2734:   	ldd	[%fp - 0x318], %f4
	.word	0x9ef80000	! t0_kref+0x2738:   	sdivcc	%g0, %g0, %o7
	.word	0x89a108c4	! t0_kref+0x273c:   	fsubd	%f4, %f4, %f4
	.word	0xe27e3fec	! t0_kref+0x2740:   	swap	[%i0 - 0x14], %l1
	.word	0x89a00524	! t0_kref+0x2744:   	fsqrts	%f4, %f4
	.word	0x22800004	! t0_kref+0x2748:   	be,a	_kref+0x2758
	.word	0x9af82fa7	! t0_kref+0x274c:   	sdivcc	%g0, 0xfa7, %o5
	.word	0x89b10744	! t0_kref+0x2750:   	fpack32	%f4, %f4, %f4
	.word	0x89b10d24	! t0_kref+0x2754:   	fandnot1s	%f4, %f4, %f4
	.word	0x9f300000	! t0_kref+0x2758:   	srl	%g0, %g0, %o7
	.word	0x89a000a4	! t0_kref+0x275c:   	fnegs	%f4, %f4
	.word	0x89b10d24	! t0_kref+0x2760:   	fandnot1s	%f4, %f4, %f4
	.word	0x9ad00000	! t0_kref+0x2764:   	umulcc	%g0, %g0, %o5
	.word	0xeefe5000	! t0_kref+0x2768:   	swapa	[%i1]0x80, %l7
	.word	0xc9be1800	! t0_kref+0x276c:   	stda	%f4, [%i0]0xc0
	call	SYM(t0_subr0)
	.word	0x93b10404	! t0_kref+0x2774:   	fcmple16	%f4, %f4, %o1
	.word	0x92f82d4a	! t0_kref+0x2778:   	sdivcc	%g0, 0xd4a, %o1
	.word	0x98500000	! t0_kref+0x277c:   	umul	%g0, %g0, %o4
	.word	0x29480004	! t0_kref+0x2780:   	fbl,a,pt	%fcc0, _kref+0x2790
	.word	0xae303548	! t0_kref+0x2784:   	orn	%g0, -0xab8, %l7
	.word	0xc99e5a1d	! t0_kref+0x2788:   	ldda	[%i1 + %i5]0xd0, %f4
	.word	0xd41f4019	! t0_kref+0x278c:   	ldd	[%i5 + %i1], %o2
	.word	0x89b10964	! t0_kref+0x2790:   	fpmerge	%f4, %f4, %f4
	.word	0xee0e401a	! t0_kref+0x2794:   	ldub	[%i1 + %i2], %l7
	.word	0xaed80000	! t0_kref+0x2798:   	smulcc	%g0, %g0, %l7
	.word	0x89b10664	! t0_kref+0x279c:   	fmul8x16au	%f4, %f4, %f4
	.word	0xc030a030	! t0_kref+0x27a0:   	clrh	[%g2 + 0x30]
	.word	0x93b00000	! t0_kref+0x27a4:   	edge8	%g0, %g0, %o1
	.word	0xc0767ff8	! t0_kref+0x27a8:   	stx	%g0, [%i1 - 8]
	.word	0xaeb80000	! t0_kref+0x27ac:   	xnorcc	%g0, %g0, %l7
	.word	0x89b00c20	! t0_kref+0x27b0:   	fzeros	%f4
	.word	0x98f80000	! t0_kref+0x27b4:   	sdivcc	%g0, %g0, %o4
	.word	0x89a10844	! t0_kref+0x27b8:   	faddd	%f4, %f4, %f4
	.word	0x92c03e4c	! t0_kref+0x27bc:   	addccc	%g0, -0x1b4, %o1
	.word	0xda0e7feb	! t0_kref+0x27c0:   	ldub	[%i1 - 0x15], %o5
	.word	0x96e0254c	! t0_kref+0x27c4:   	subccc	%g0, 0x54c, %o3
	.word	0x9e080000	! t0_kref+0x27c8:   	and	%g0, %g0, %o7
	.word	0xc020a018	! t0_kref+0x27cc:   	clr	[%g2 + 0x18]
	call	SYM(t0_subr0)
	.word	0x9928201f	! t0_kref+0x27d4:   	sll	%g0, 0x1f, %o4
	.word	0x89a108c4	! t0_kref+0x27d8:   	fsubd	%f4, %f4, %f4
	.word	0x2a800001	! t0_kref+0x27dc:   	bcs,a	_kref+0x27e0
	.word	0x89a10844	! t0_kref+0x27e0:   	faddd	%f4, %f4, %f4
	.word	0xd2de5000	! t0_kref+0x27e4:   	ldxa	[%i1]0x80, %o1
	.word	0x96c02d69	! t0_kref+0x27e8:   	addccc	%g0, 0xd69, %o3
	.word	0x89a01924	! t0_kref+0x27ec:   	fstod	%f4, %f4
	.word	0xaf200000	! t0_kref+0x27f0:   	mulscc	%g0, %g0, %l7
	.word	0x89a01904	! t0_kref+0x27f4:   	fitod	%f4, %f4
	.word	0xd43e3ff8	! t0_kref+0x27f8:   	std	%o2, [%i0 - 8]
	.word	0xd6ee5000	! t0_kref+0x27fc:   	ldstuba	[%i1]0x80, %o3
	.word	0xc008a01e	! t0_kref+0x2800:   	ldub	[%g2 + 0x1e], %g0
	.word	0xd20e3ff7	! t0_kref+0x2804:   	ldub	[%i0 - 9], %o1
	.word	0xc0066008	! t0_kref+0x2808:   	ld	[%i1 + 8], %g0
	.word	0xe9ee101d	! t0_kref+0x280c:   	prefetcha	%i0 + %i5, 20
	.word	0x9a783740	! t0_kref+0x2810:   	sdiv	%g0, -0x8c0, %o5
	.word	0xda48a015	! t0_kref+0x2814:   	ldsb	[%g2 + 0x15], %o5
	call	SYM(t0_subr2)
	.word	0x89a00044	! t0_kref+0x281c:   	fmovd	%f4, %f4
	.word	0x81b01021	! t0_kref+0x2820:   	siam	0x1
	.word	0xc91fbd30	! t0_kref+0x2824:   	ldd	[%fp - 0x2d0], %f4
	.word	0x89a10944	! t0_kref+0x2828:   	fmuld	%f4, %f4, %f4
	.word	0x26800006	! t0_kref+0x282c:   	bl,a	_kref+0x2844
	.word	0xc028a001	! t0_kref+0x2830:   	clrb	[%g2 + 1]
	.word	0xc030a008	! t0_kref+0x2834:   	clrh	[%g2 + 8]
	.word	0x34480002	! t0_kref+0x2838:   	bg,a,pt	%icc, _kref+0x2840
	.word	0x98880000	! t0_kref+0x283c:   	andcc	%g0, %g0, %o4
	.word	0x89b00c00	! t0_kref+0x2840:   	fzero	%f4
	.word	0x81b10504	! t0_kref+0x2844:   	fcmpgt16	%f4, %f4, %g0
	.word	0x81a90ac4	! t0_kref+0x2848:   	fcmped	%fcc0, %f4, %f4
	.word	0xd2871040	! t0_kref+0x284c:   	lda	[%i4]0x82, %o1
	.word	0x98300000	! t0_kref+0x2850:   	orn	%g0, %g0, %o4
	.word	0x89a01924	! t0_kref+0x2854:   	fstod	%f4, %f4
	.word	0x94800000	! t0_kref+0x2858:   	addcc	%g0, %g0, %o2
	.word	0xc91e401d	! t0_kref+0x285c:   	ldd	[%i1 + %i5], %f4
	.word	0x89b10f64	! t0_kref+0x2860:   	fornot1s	%f4, %f4, %f4
	.word	0x89a000c4	! t0_kref+0x2864:   	fnegd	%f4, %f4
	.word	0x9e383352	! t0_kref+0x2868:   	xnor	%g0, -0xcae, %o7
	.word	0xd040a01c	! t0_kref+0x286c:   	ldsw	[%g2 + 0x1c], %o0
	.word	0x9e20371f	! t0_kref+0x2870:   	sub	%g0, -0x8e1, %o7
	.word	0xc028a01e	! t0_kref+0x2874:   	clrb	[%g2 + 0x1e]
	.word	0x89a108c4	! t0_kref+0x2878:   	fsubd	%f4, %f4, %f4
	.word	0x8143c000	! t0_kref+0x287c:   	stbar
	.word	0xd808a012	! t0_kref+0x2880:   	ldub	[%g2 + 0x12], %o4
	.word	0xd00e4000	! t0_kref+0x2884:   	ldub	[%i1], %o0
	.word	0x9af83461	! t0_kref+0x2888:   	sdivcc	%g0, -0xb9f, %o5
	.word	0xffee101d	! t0_kref+0x288c:   	prefetcha	%i0 + %i5, 31
	.word	0x89b10ac4	! t0_kref+0x2890:   	fpsub32	%f4, %f4, %f4
	.word	0x89a10844	! t0_kref+0x2894:   	faddd	%f4, %f4, %f4
	.word	0xc0260000	! t0_kref+0x2898:   	clr	[%i0]
	.word	0xc028a03e	! t0_kref+0x289c:   	clrb	[%g2 + 0x3e]
	.word	0x90600000	! t0_kref+0x28a0:   	subc	%g0, %g0, %o0
	.word	0x92180000	! t0_kref+0x28a4:   	xor	%g0, %g0, %o1
	.word	0x9a080000	! t0_kref+0x28a8:   	and	%g0, %g0, %o5
	.word	0x89a000a4	! t0_kref+0x28ac:   	fnegs	%f4, %f4
	.word	0x91b00160	! t0_kref+0x28b0:   	edge32ln	%g0, %g0, %o0
	.word	0x9a402af8	! t0_kref+0x28b4:   	addc	%g0, 0xaf8, %o5
	.word	0x89a10924	! t0_kref+0x28b8:   	fmuls	%f4, %f4, %f4
	.word	0xae980000	! t0_kref+0x28bc:   	xorcc	%g0, %g0, %l7
	.word	0x89a10944	! t0_kref+0x28c0:   	fmuld	%f4, %f4, %f4
	.word	0x9aa80000	! t0_kref+0x28c4:   	andncc	%g0, %g0, %o5
	.word	0xaea80000	! t0_kref+0x28c8:   	andncc	%g0, %g0, %l7
	.word	0xc020a020	! t0_kref+0x28cc:   	clr	[%g2 + 0x20]
	.word	0x89b10624	! t0_kref+0x28d0:   	fmul8x16	%f4, %f4, %f4
	.word	0x89a000a4	! t0_kref+0x28d4:   	fnegs	%f4, %f4
	.word	0xec180018	! t0_kref+0x28d8:   	ldd	[%g0 + %i0], %l6
	.word	0xde08a02c	! t0_kref+0x28dc:   	ldub	[%g2 + 0x2c], %o7
	.word	0xda066000	! t0_kref+0x28e0:   	ld	[%i1], %o5
	.word	0x89a00544	! t0_kref+0x28e4:   	fsqrtd	%f4, %f4
	.word	0x86102001	! t0_kref+0x28e8:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x28ec:   	bne,a	_kref+0x28ec
	.word	0x86a0e001	! t0_kref+0x28f0:   	subcc	%g3, 1, %g3
	.word	0xc028a000	! t0_kref+0x28f4:   	clrb	[%g2]
	.word	0x89a01884	! t0_kref+0x28f8:   	fitos	%f4, %f4
	.word	0x80403cb2	! t0_kref+0x28fc:   	addc	%g0, -0x34e, %g0
	.word	0x9de3bfa0	! t0_kref+0x2900:   	save	%sp, -0x60, %sp
	.word	0x81ee4018	! t0_kref+0x2904:   	restore	%i1, %i0, %g0
	.word	0x96980000	! t0_kref+0x2908:   	xorcc	%g0, %g0, %o3
	.word	0x9fc10000	! t0_kref+0x290c:   	call	%g4
	.word	0xc91fbf30	! t0_kref+0x2910:   	ldd	[%fp - 0xd0], %f4
	.word	0x9ac03bef	! t0_kref+0x2914:   	addccc	%g0, -0x411, %o5
	.word	0x89a10844	! t0_kref+0x2918:   	faddd	%f4, %f4, %f4
	.word	0x96502ddf	! t0_kref+0x291c:   	umul	%g0, 0xddf, %o3
	.word	0x20800007	! t0_kref+0x2920:   	bn,a	_kref+0x293c
	.word	0xe41e4000	! t0_kref+0x2924:   	ldd	[%i1], %l2
	.word	0xfd6e6010	! t0_kref+0x2928:   	prefetch	%i1 + 0x10, 30
	.word	0x89a10924	! t0_kref+0x292c:   	fmuls	%f4, %f4, %f4
	.word	0x91b00140	! t0_kref+0x2930:   	edge32l	%g0, %g0, %o0
	.word	0xaef80000	! t0_kref+0x2934:   	sdivcc	%g0, %g0, %l7
	.word	0x91b10504	! t0_kref+0x2938:   	fcmpgt16	%f4, %f4, %o0
	.word	0x80300000	! t0_kref+0x293c:   	orn	%g0, %g0, %g0
	.word	0xe3b8a080	! t0_kref+0x2940:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x80603ecc	! t0_kref+0x2944:   	subc	%g0, -0x134, %g0
	.word	0x9fc10000	! t0_kref+0x2948:   	call	%g4
	.word	0xc9063fe8	! t0_kref+0x294c:   	ld	[%i0 - 0x18], %f4
	.word	0xd83e2008	! t0_kref+0x2950:   	std	%o4, [%i0 + 8]
	.word	0x99b00140	! t0_kref+0x2954:   	edge32l	%g0, %g0, %o4
	.word	0x89a108a4	! t0_kref+0x2958:   	fsubs	%f4, %f4, %f4
	.word	0x89a00124	! t0_kref+0x295c:   	fabss	%f4, %f4
	.word	0x89a10924	! t0_kref+0x2960:   	fmuls	%f4, %f4, %f4
	.word	0x9bb00140	! t0_kref+0x2964:   	edge32l	%g0, %g0, %o5
	.word	0xc026201c	! t0_kref+0x2968:   	clr	[%i0 + 0x1c]
	.word	0x89a01a44	! t0_kref+0x296c:   	fdtoi	%f4, %f4
	.word	0x89a000a4	! t0_kref+0x2970:   	fnegs	%f4, %f4
	.word	0x89a01924	! t0_kref+0x2974:   	fstod	%f4, %f4
	.word	0x89b10964	! t0_kref+0x2978:   	fpmerge	%f4, %f4, %f4
	.word	0x89a000a4	! t0_kref+0x297c:   	fnegs	%f4, %f4
	.word	0x89b10f84	! t0_kref+0x2980:   	for	%f4, %f4, %f4
	.word	0xc91fbc50	! t0_kref+0x2984:   	ldd	[%fp - 0x3b0], %f4
	.word	0x96500000	! t0_kref+0x2988:   	umul	%g0, %g0, %o3
	.word	0xc0762008	! t0_kref+0x298c:   	stx	%g0, [%i0 + 8]
	.word	0x89a108c4	! t0_kref+0x2990:   	fsubd	%f4, %f4, %f4
	.word	0x34800003	! t0_kref+0x2994:   	bg,a	_kref+0x29a0
	.word	0xc9be5a5d	! t0_kref+0x2998:   	stda	%f4, [%i1 + %i5]0xd2
	.word	0x89a109c4	! t0_kref+0x299c:   	fdivd	%f4, %f4, %f4
	.word	0x96403e73	! t0_kref+0x29a0:   	addc	%g0, -0x18d, %o3
	.word	0xc028a00b	! t0_kref+0x29a4:   	clrb	[%g2 + 0xb]
	.word	0x80a83a7b	! t0_kref+0x29a8:   	andncc	%g0, -0x585, %g0
	.word	0x81a90aa4	! t0_kref+0x29ac:   	fcmpes	%fcc0, %f4, %f4
	.word	0xc02e8019	! t0_kref+0x29b0:   	clrb	[%i2 + %i1]
	.word	0x95302014	! t0_kref+0x29b4:   	srl	%g0, 0x14, %o2
	.word	0x3e800007	! t0_kref+0x29b8:   	bvc,a	_kref+0x29d4
	.word	0xc807bfe4	! t0_kref+0x29bc:   	ld	[%fp - 0x1c], %g4
	.word	0x30800003	! t0_kref+0x29c0:   	ba,a	_kref+0x29cc
	.word	0x91b00020	! t0_kref+0x29c4:   	edge8n	%g0, %g0, %o0
	.word	0x92503c42	! t0_kref+0x29c8:   	umul	%g0, -0x3be, %o1
	.word	0xf5ee501d	! t0_kref+0x29cc:   	prefetcha	%i1 + %i5, 26
	.word	0x93202bf6	! t0_kref+0x29d0:   	mulscc	%g0, 0xbf6, %o1
	.word	0x9a500000	! t0_kref+0x29d4:   	umul	%g0, %g0, %o5
	.word	0x89a01904	! t0_kref+0x29d8:   	fitod	%f4, %f4
	.word	0x97b00020	! t0_kref+0x29dc:   	edge8n	%g0, %g0, %o3
	.word	0x89a00144	! t0_kref+0x29e0:   	fabsd	%f4, %f4
	.word	0x86102001	! t0_kref+0x29e4:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x29e8:   	bne,a	_kref+0x29e8
	.word	0x86a0e001	! t0_kref+0x29ec:   	subcc	%g3, 1, %g3
	.word	0x95280000	! t0_kref+0x29f0:   	sll	%g0, %g0, %o2
	.word	0x99b00020	! t0_kref+0x29f4:   	edge8n	%g0, %g0, %o4
	.word	0x2e800001	! t0_kref+0x29f8:   	bvs,a	_kref+0x29fc
	.word	0xc020a038	! t0_kref+0x29fc:   	clr	[%g2 + 0x38]
	.word	0x89a00544	! t0_kref+0x2a00:   	fsqrtd	%f4, %f4
	.word	0x90703db2	! t0_kref+0x2a04:   	udiv	%g0, -0x24e, %o0
	.word	0x98d82ac1	! t0_kref+0x2a08:   	smulcc	%g0, 0xac1, %o4
	.word	0xd6060000	! t0_kref+0x2a0c:   	ld	[%i0], %o3
	.word	0x89a10944	! t0_kref+0x2a10:   	fmuld	%f4, %f4, %f4
	.word	0x9de3bfa0	! t0_kref+0x2a14:   	save	%sp, -0x60, %sp
	.word	0x99eeb2ca	! t0_kref+0x2a18:   	restore	%i2, -0xd36, %o4
	.word	0x9b408000	! t0_kref+0x2a1c:   	mov	%ccr, %o5
	.word	0x81a90aa4	! t0_kref+0x2a20:   	fcmpes	%fcc0, %f4, %f4
	.word	0xc028a036	! t0_kref+0x2a24:   	clrb	[%g2 + 0x36]
	.word	0x81a90a24	! t0_kref+0x2a28:   	fcmps	%fcc0, %f4, %f4
	.word	0x86102004	! t0_kref+0x2a2c:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x2a30:   	bne,a	_kref+0x2a30
	.word	0x86a0e001	! t0_kref+0x2a34:   	subcc	%g3, 1, %g3
	.word	0x92400000	! t0_kref+0x2a38:   	addc	%g0, %g0, %o1
	.word	0x89b10e64	! t0_kref+0x2a3c:   	fxnors	%f4, %f4, %f4
	.word	0x89a000a4	! t0_kref+0x2a40:   	fnegs	%f4, %f4
	.word	0x94b82637	! t0_kref+0x2a44:   	xnorcc	%g0, 0x637, %o2
	.word	0x89a000a4	! t0_kref+0x2a48:   	fnegs	%f4, %f4
	.word	0x9ef80000	! t0_kref+0x2a4c:   	sdivcc	%g0, %g0, %o7
	.word	0x89b10da4	! t0_kref+0x2a50:   	fxors	%f4, %f4, %f4
	.word	0x89a9c024	! t0_kref+0x2a54:   	fmovsu	%fcc0, %f4, %f4
	.word	0x3c480001	! t0_kref+0x2a58:   	bpos,a,pt	%icc, _kref+0x2a5c
	.word	0xc096d019	! t0_kref+0x2a5c:   	lduha	[%i3 + %i1]0x80, %g0
	.word	0xd816401b	! t0_kref+0x2a60:   	lduh	[%i1 + %i3], %o4
	.word	0xc000a028	! t0_kref+0x2a64:   	ld	[%g2 + 0x28], %g0
	.word	0xc0b6101b	! t0_kref+0x2a68:   	stha	%g0, [%i0 + %i3]0x80
	.word	0x89a00124	! t0_kref+0x2a6c:   	fabss	%f4, %f4
	.word	0xdac71019	! t0_kref+0x2a70:   	ldswa	[%i4 + %i1]0x80, %o5
	.word	0x89a108c4	! t0_kref+0x2a74:   	fsubd	%f4, %f4, %f4
	.word	0x89b00c20	! t0_kref+0x2a78:   	fzeros	%f4
	.word	0x90402e93	! t0_kref+0x2a7c:   	addc	%g0, 0xe93, %o0
	.word	0x9af80000	! t0_kref+0x2a80:   	sdivcc	%g0, %g0, %o5
	.word	0x989027bf	! t0_kref+0x2a84:   	orcc	%g0, 0x7bf, %o4
	.word	0x92400000	! t0_kref+0x2a88:   	addc	%g0, %g0, %o1
	.word	0xc91fbeb0	! t0_kref+0x2a8c:   	ldd	[%fp - 0x150], %f4
	.word	0x89a00544	! t0_kref+0x2a90:   	fsqrtd	%f4, %f4
	.word	0xf007bfe0	! t0_kref+0x2a94:   	ld	[%fp - 0x20], %i0
	.word	0xc030a00c	! t0_kref+0x2a98:   	clrh	[%g2 + 0xc]
	.word	0xc91fbf40	! t0_kref+0x2a9c:   	ldd	[%fp - 0xc0], %f4
	.word	0xe3b8a080	! t0_kref+0x2aa0:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xef68a083	! t0_kref+0x2aa4:   	prefetch	%g2 + 0x83, 23
	.word	0x9fc10000	! t0_kref+0x2aa8:   	call	%g4
	.word	0xc020a01c	! t0_kref+0x2aac:   	clr	[%g2 + 0x1c]
	.word	0x9bb00060	! t0_kref+0x2ab0:   	edge8ln	%g0, %g0, %o5
	.word	0x96700000	! t0_kref+0x2ab4:   	udiv	%g0, %g0, %o3
	.word	0x81dec010	! t0_kref+0x2ab8:   	flush	%i3 + %l0
	.word	0x89a10944	! t0_kref+0x2abc:   	fmuld	%f4, %f4, %f4
	.word	0x96000000	! t0_kref+0x2ac0:   	add	%g0, %g0, %o3
	.word	0x89b10f44	! t0_kref+0x2ac4:   	fornot1	%f4, %f4, %f4
	.word	0x98d0286c	! t0_kref+0x2ac8:   	umulcc	%g0, 0x86c, %o4
	.word	0x9ea80000	! t0_kref+0x2acc:   	andncc	%g0, %g0, %o7
	.word	0x89a10824	! t0_kref+0x2ad0:   	fadds	%f4, %f4, %f4
	.word	0x89a10844	! t0_kref+0x2ad4:   	faddd	%f4, %f4, %f4
	.word	0x90700000	! t0_kref+0x2ad8:   	udiv	%g0, %g0, %o0
	call	SYM(t0_subr0)
	.word	0x89a108a4	! t0_kref+0x2ae0:   	fsubs	%f4, %f4, %f4
	.word	0x9ae00000	! t0_kref+0x2ae4:   	subccc	%g0, %g0, %o5
	.word	0x89b00764	! t0_kref+0x2ae8:   	fpack16	%f4, %f4
	.word	0xd8de5000	! t0_kref+0x2aec:   	ldxa	[%i1]0x80, %o4
	.word	0xc920a018	! t0_kref+0x2af0:   	st	%f4, [%g2 + 0x18]
	.word	0x98e02bd5	! t0_kref+0x2af4:   	subccc	%g0, 0xbd5, %o4
	.word	0x89a108c4	! t0_kref+0x2af8:   	fsubd	%f4, %f4, %f4
	.word	0xc020a028	! t0_kref+0x2afc:   	clr	[%g2 + 0x28]
	.word	0x89a10944	! t0_kref+0x2b00:   	fmuld	%f4, %f4, %f4
	.word	0x89b10ea0	! t0_kref+0x2b04:   	fsrc1s	%f4, %f4
	.word	0xc900a008	! t0_kref+0x2b08:   	ld	[%g2 + 8], %f4
	.word	0x95202579	! t0_kref+0x2b0c:   	mulscc	%g0, 0x579, %o2
	.word	0xc108001c	! t0_kref+0x2b10:   	ld	[%g0 + %i4], %fsr
	.word	0x89a01a24	! t0_kref+0x2b14:   	fstoi	%f4, %f4
	.word	0xd44e8018	! t0_kref+0x2b18:   	ldsb	[%i2 + %i0], %o2
	.word	0x94a83248	! t0_kref+0x2b1c:   	andncc	%g0, -0xdb8, %o2
	.word	0x99b00200	! t0_kref+0x2b20:   	array8	%g0, %g0, %o4
	.word	0x89a01924	! t0_kref+0x2b24:   	fstod	%f4, %f4
	.word	0xd8500018	! t0_kref+0x2b28:   	ldsh	[%g0 + %i0], %o4
	.word	0xd03e401d	! t0_kref+0x2b2c:   	std	%o0, [%i1 + %i5]
	.word	0x9fb00140	! t0_kref+0x2b30:   	edge32l	%g0, %g0, %o7
	.word	0xd408a034	! t0_kref+0x2b34:   	ldub	[%g2 + 0x34], %o2
	.word	0x89a10844	! t0_kref+0x2b38:   	faddd	%f4, %f4, %f4
	.word	0xda16c018	! t0_kref+0x2b3c:   	lduh	[%i3 + %i0], %o5
	.word	0x89b10e24	! t0_kref+0x2b40:   	fands	%f4, %f4, %f4
	.word	0xc129401c	! t0_kref+0x2b44:   	st	%fsr, [%g5 + %i4]
	.word	0x80b03dd3	! t0_kref+0x2b48:   	orncc	%g0, -0x22d, %g0
	.word	0x95b000a0	! t0_kref+0x2b4c:   	edge16n	%g0, %g0, %o2
	.word	0xc9064000	! t0_kref+0x2b50:   	ld	[%i1], %f4
	.word	0xc026401c	! t0_kref+0x2b54:   	clr	[%i1 + %i4]
	.word	0xaf700000	! t0_kref+0x2b58:   	popc	%g0, %l7
	.word	0x90900000	! t0_kref+0x2b5c:   	orcc	%g0, %g0, %o0
	.word	0x89a000a4	! t0_kref+0x2b60:   	fnegs	%f4, %f4
	.word	0x94403c65	! t0_kref+0x2b64:   	addc	%g0, -0x39b, %o2
	.word	0x89a10924	! t0_kref+0x2b68:   	fmuls	%f4, %f4, %f4
	.word	0xdac6101c	! t0_kref+0x2b6c:   	ldswa	[%i0 + %i4]0x80, %o5
	.word	0x89a00144	! t0_kref+0x2b70:   	fabsd	%f4, %f4
	.word	0x81a90ac4	! t0_kref+0x2b74:   	fcmped	%fcc0, %f4, %f4
	.word	0xc9be5a5c	! t0_kref+0x2b78:   	stda	%f4, [%i1 + %i4]0xd2
	.word	0x89a00524	! t0_kref+0x2b7c:   	fsqrts	%f4, %f4
	.word	0xd8064000	! t0_kref+0x2b80:   	ld	[%i1], %o4
	.word	0xd80e3feb	! t0_kref+0x2b84:   	ldub	[%i0 - 0x15], %o4
	.word	0xaf300000	! t0_kref+0x2b88:   	srl	%g0, %g0, %l7
	.word	0x901832c4	! t0_kref+0x2b8c:   	xor	%g0, -0xd3c, %o0
	.word	0x89a10844	! t0_kref+0x2b90:   	faddd	%f4, %f4, %f4
	.word	0x89a108c4	! t0_kref+0x2b94:   	fsubd	%f4, %f4, %f4
	.word	0x89a000a4	! t0_kref+0x2b98:   	fnegs	%f4, %f4
	.word	0x89a00544	! t0_kref+0x2b9c:   	fsqrtd	%f4, %f4
	.word	0x8143c000	! t0_kref+0x2ba0:   	stbar
	.word	0x94c00000	! t0_kref+0x2ba4:   	addccc	%g0, %g0, %o2
	.word	0x2e480002	! t0_kref+0x2ba8:   	bvs,a,pt	%icc, _kref+0x2bb0
	.word	0x92b00000	! t0_kref+0x2bac:   	orncc	%g0, %g0, %o1
	.word	0x89a01904	! t0_kref+0x2bb0:   	fitod	%f4, %f4
	.word	0x8000319d	! t0_kref+0x2bb4:   	add	%g0, -0xe63, %g0
	.word	0xc9062000	! t0_kref+0x2bb8:   	ld	[%i0], %f4
	.word	0x94000000	! t0_kref+0x2bbc:   	add	%g0, %g0, %o2
	.word	0x89a10844	! t0_kref+0x2bc0:   	faddd	%f4, %f4, %f4
	.word	0xa7800000	! t0_kref+0x2bc4:   	mov	%g0, %gsr
	.word	0x89a018c4	! t0_kref+0x2bc8:   	fdtos	%f4, %f4
	.word	0x81a90a24	! t0_kref+0x2bcc:   	fcmps	%fcc0, %f4, %f4
	.word	0x98980000	! t0_kref+0x2bd0:   	xorcc	%g0, %g0, %o4
	.word	0x89a00524	! t0_kref+0x2bd4:   	fsqrts	%f4, %f4
	.word	0x89b10a04	! t0_kref+0x2bd8:   	fpadd16	%f4, %f4, %f4
	.word	0x92100000	! t0_kref+0x2bdc:   	clr	%o1
	.word	0xc3ee5000	! t0_kref+0x2be0:   	prefetcha	%i1, 1
	.word	0xc030a038	! t0_kref+0x2be4:   	clrh	[%g2 + 0x38]
	.word	0x94000000	! t0_kref+0x2be8:   	add	%g0, %g0, %o2
	.word	0x92e00000	! t0_kref+0x2bec:   	subccc	%g0, %g0, %o1
	.word	0x98f82b4a	! t0_kref+0x2bf0:   	sdivcc	%g0, 0xb4a, %o4
	.word	0xc986101c	! t0_kref+0x2bf4:   	lda	[%i0 + %i4]0x80, %f4
	.word	0xc91fbfa8	! t0_kref+0x2bf8:   	ldd	[%fp - 0x58], %f4
	.word	0x89a000a4	! t0_kref+0x2bfc:   	fnegs	%f4, %f4
	.word	0xe01e7fe0	! t0_kref+0x2c00:   	ldd	[%i1 - 0x20], %l0
	.word	0xec380018	! t0_kref+0x2c04:   	std	%l6, [%g0 + %i0]
	.word	0x9a000000	! t0_kref+0x2c08:   	add	%g0, %g0, %o5
	.word	0x81a90a44	! t0_kref+0x2c0c:   	fcmpd	%fcc0, %f4, %f4
	.word	0x908026eb	! t0_kref+0x2c10:   	addcc	%g0, 0x6eb, %o0
	.word	0x89a108a4	! t0_kref+0x2c14:   	fsubs	%f4, %f4, %f4
	.word	0x81a90ac4	! t0_kref+0x2c18:   	fcmped	%fcc0, %f4, %f4
	.word	0x99280000	! t0_kref+0x2c1c:   	sll	%g0, %g0, %o4
	.word	0xd0064000	! t0_kref+0x2c20:   	ld	[%i1], %o0
	.word	0x34800003	! t0_kref+0x2c24:   	bg,a	_kref+0x2c30
	.word	0xee50a004	! t0_kref+0x2c28:   	ldsh	[%g2 + 4], %l7
	.word	0x89a00124	! t0_kref+0x2c2c:   	fabss	%f4, %f4
	.word	0x94a836d6	! t0_kref+0x2c30:   	andncc	%g0, -0x92a, %o2
	.word	0xf007bfe0	! t0_kref+0x2c34:   	ld	[%fp - 0x20], %i0
	.word	0xaf302012	! t0_kref+0x2c38:   	srl	%g0, 0x12, %l7
	.word	0x92402ec1	! t0_kref+0x2c3c:   	addc	%g0, 0xec1, %o1
	.word	0x89a00524	! t0_kref+0x2c40:   	fsqrts	%f4, %f4
	.word	0x89a108c4	! t0_kref+0x2c44:   	fsubd	%f4, %f4, %f4
	.word	0x9808316c	! t0_kref+0x2c48:   	and	%g0, -0xe94, %o4
	.word	0x9f418000	! t0_kref+0x2c4c:   	mov	%fprs, %o7
	.word	0x90180000	! t0_kref+0x2c50:   	xor	%g0, %g0, %o0
	.word	0xda56001b	! t0_kref+0x2c54:   	ldsh	[%i0 + %i3], %o5
	.word	0x89a00524	! t0_kref+0x2c58:   	fsqrts	%f4, %f4
	.word	0x95400000	! t0_kref+0x2c5c:   	mov	%y, %o2
	.word	0x8d800000	! t0_kref+0x2c60:   	mov	%g0, %fprs
	.word	0x89b106c4	! t0_kref+0x2c64:   	fmul8sux16	%f4, %f4, %f4
	.word	0xeaee9018	! t0_kref+0x2c68:   	ldstuba	[%i2 + %i0]0x80, %l5
	.word	0x90800000	! t0_kref+0x2c6c:   	addcc	%g0, %g0, %o0
	.word	0xc920a024	! t0_kref+0x2c70:   	st	%f4, [%g2 + 0x24]
	.word	0xc920a034	! t0_kref+0x2c74:   	st	%f4, [%g2 + 0x34]
	.word	0x86102002	! t0_kref+0x2c78:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x2c7c:   	bne,a	_kref+0x2c7c
	.word	0x86a0e001	! t0_kref+0x2c80:   	subcc	%g3, 1, %g3
	.word	0x89a00544	! t0_kref+0x2c84:   	fsqrtd	%f4, %f4
	.word	0x9ef80000	! t0_kref+0x2c88:   	sdivcc	%g0, %g0, %o7
	.word	0xd208a00d	! t0_kref+0x2c8c:   	ldub	[%g2 + 0xd], %o1
	.word	0x9b400000	! t0_kref+0x2c90:   	mov	%y, %o5
	.word	0x9e000000	! t0_kref+0x2c94:   	add	%g0, %g0, %o7
	.word	0x89a10844	! t0_kref+0x2c98:   	faddd	%f4, %f4, %f4
	.word	0x89a01904	! t0_kref+0x2c9c:   	fitod	%f4, %f4
	.word	0x9b620000	! t0_kref+0x2ca0:   	mova	%fcc0, %g0, %o5
	.word	0x81b00320	! t0_kref+0x2ca4:   	bmask	%g0, %g0, %g0
	.word	0xd6067ff0	! t0_kref+0x2ca8:   	ld	[%i1 - 0x10], %o3
	.word	0xd09e5000	! t0_kref+0x2cac:   	ldda	[%i1]0x80, %o0
	.word	0x81a90a24	! t0_kref+0x2cb0:   	fcmps	%fcc0, %f4, %f4
	.word	0x89a10824	! t0_kref+0x2cb4:   	fadds	%f4, %f4, %f4
	.word	0x81a90a44	! t0_kref+0x2cb8:   	fcmpd	%fcc0, %f4, %f4
	.word	0xc030a026	! t0_kref+0x2cbc:   	clrh	[%g2 + 0x26]
	.word	0x89a10924	! t0_kref+0x2cc0:   	fmuls	%f4, %f4, %f4
	.word	0x89a01a24	! t0_kref+0x2cc4:   	fstoi	%f4, %f4
	.word	0x9a200000	! t0_kref+0x2cc8:   	neg	%g0, %o5
	.word	0x9fc00004	! t0_kref+0x2ccc:   	call	%g0 + %g4
	.word	0x89a01904	! t0_kref+0x2cd0:   	fitod	%f4, %f4
	.word	0x878020d0	! t0_kref+0x2cd4:   	mov	0xd0, %asi
	.word	0x89a01904	! t0_kref+0x2cd8:   	fitod	%f4, %f4
	.word	0x86102003	! t0_kref+0x2cdc:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x2ce0:   	bne,a	_kref+0x2ce0
	.word	0x86a0e001	! t0_kref+0x2ce4:   	subcc	%g3, 1, %g3
	.word	0xc0f81018	! t0_kref+0x2ce8:   	swapa	[%g0 + %i0]0x80, %g0
	.word	0x89a00124	! t0_kref+0x2cec:   	fabss	%f4, %f4
	.word	0x81b00160	! t0_kref+0x2cf0:   	edge32ln	%g0, %g0, %g0
	.word	0xd0563ff6	! t0_kref+0x2cf4:   	ldsh	[%i0 - 0xa], %o0
	.word	0x89a00544	! t0_kref+0x2cf8:   	fsqrtd	%f4, %f4
	.word	0xde56601a	! t0_kref+0x2cfc:   	ldsh	[%i1 + 0x1a], %o7
	.word	0x93200000	! t0_kref+0x2d00:   	mulscc	%g0, %g0, %o1
	.word	0xee0e3ff0	! t0_kref+0x2d04:   	ldub	[%i0 - 0x10], %l7
	.word	0x89b10964	! t0_kref+0x2d08:   	fpmerge	%f4, %f4, %f4
	.word	0xaea00000	! t0_kref+0x2d0c:   	subcc	%g0, %g0, %l7
	.word	0xc9bf5a59	! t0_kref+0x2d10:   	stda	%f4, [%i5 + %i1]0xd2
	.word	0xc920a018	! t0_kref+0x2d14:   	st	%f4, [%g2 + 0x18]
	.word	0x89b10da4	! t0_kref+0x2d18:   	fxors	%f4, %f4, %f4
	.word	0x9aa80000	! t0_kref+0x2d1c:   	andncc	%g0, %g0, %o5
	.word	0x9fc00004	! t0_kref+0x2d20:   	call	%g0 + %g4
	.word	0x89b10d24	! t0_kref+0x2d24:   	fandnot1s	%f4, %f4, %f4
	.word	0xc93e7fe8	! t0_kref+0x2d28:   	std	%f4, [%i1 - 0x18]
	.word	0x98c03699	! t0_kref+0x2d2c:   	addccc	%g0, -0x967, %o4
	.word	0x89b106a4	! t0_kref+0x2d30:   	fmul8x16al	%f4, %f4, %f4
	.word	0x81a90aa4	! t0_kref+0x2d34:   	fcmpes	%fcc0, %f4, %f4
	call	SYM(t0_subr3)
	.word	0xa1b10504	! t0_kref+0x2d3c:   	fcmpgt16	%f4, %f4, %l0
	.word	0x97b104c4	! t0_kref+0x2d40:   	fcmpne32	%f4, %f4, %o3
	.word	0x80100000	! t0_kref+0x2d44:   	clr	%g0
	.word	0x86102003	! t0_kref+0x2d48:   	mov	0x3, %g3
	.word	0x86a0e001	! t0_kref+0x2d4c:   	subcc	%g3, 1, %g3
	.word	0x2280001c	! t0_kref+0x2d50:   	be,a	_kref+0x2dc0
	.word	0x89a10824	! t0_kref+0x2d54:   	fadds	%f4, %f4, %f4
	.word	0x89b10fa4	! t0_kref+0x2d58:   	fors	%f4, %f4, %f4
	.word	0x89a01a24	! t0_kref+0x2d5c:   	fstoi	%f4, %f4
	.word	0x89a00524	! t0_kref+0x2d60:   	fsqrts	%f4, %f4
	.word	0x9e400000	! t0_kref+0x2d64:   	addc	%g0, %g0, %o7
	.word	0x8143c000	! t0_kref+0x2d68:   	stbar
	.word	0x9e5022ae	! t0_kref+0x2d6c:   	umul	%g0, 0x2ae, %o7
	.word	0xe41e2018	! t0_kref+0x2d70:   	ldd	[%i0 + 0x18], %l2
	.word	0x80080000	! t0_kref+0x2d74:   	and	%g0, %g0, %g0
	.word	0x3c4ffff5	! t0_kref+0x2d78:   	bpos,a,pt	%icc, _kref+0x2d4c
	.word	0x89a00524	! t0_kref+0x2d7c:   	fsqrts	%f4, %f4
	.word	0xc9a01018	! t0_kref+0x2d80:   	sta	%f4, [%g0 + %i0]0x80
	.word	0x9740c000	! t0_kref+0x2d84:   	mov	%asi, %o3
	.word	0xc0262014	! t0_kref+0x2d88:   	clr	[%i0 + 0x14]
	.word	0x81a90a24	! t0_kref+0x2d8c:   	fcmps	%fcc0, %f4, %f4
	.word	0x98900000	! t0_kref+0x2d90:   	orcc	%g0, %g0, %o4
	.word	0x89aa4024	! t0_kref+0x2d94:   	fmovse	%fcc0, %f4, %f4
	.word	0x20480001	! t0_kref+0x2d98:   	bn,a,pt	%icc, _kref+0x2d9c
	.word	0x89a00544	! t0_kref+0x2d9c:   	fsqrtd	%f4, %f4
	.word	0x92a82005	! t0_kref+0x2da0:   	andncc	%g0, 5, %o1
	.word	0xd80e001a	! t0_kref+0x2da4:   	ldub	[%i0 + %i2], %o4
	.word	0xeefe501c	! t0_kref+0x2da8:   	swapa	[%i1 + %i4]0x80, %l7
	.word	0xd410a00c	! t0_kref+0x2dac:   	lduh	[%g2 + 0xc], %o2
	.word	0x98600000	! t0_kref+0x2db0:   	subc	%g0, %g0, %o4
	.word	0xee08a020	! t0_kref+0x2db4:   	ldub	[%g2 + 0x20], %l7
	.word	0x97b10484	! t0_kref+0x2db8:   	fcmple32	%f4, %f4, %o3
	.word	0x89b10a04	! t0_kref+0x2dbc:   	fpadd16	%f4, %f4, %f4
	.word	0xe67e6004	! t0_kref+0x2dc0:   	swap	[%i1 + 4], %l3
	.word	0x89b10e44	! t0_kref+0x2dc4:   	fxnor	%f4, %f4, %f4
	.word	0xc0060000	! t0_kref+0x2dc8:   	ld	[%i0], %g0
	.word	0x89a00524	! t0_kref+0x2dcc:   	fsqrts	%f4, %f4
	.word	0x94082a5d	! t0_kref+0x2dd0:   	and	%g0, 0xa5d, %o2
	.word	0xc9070019	! t0_kref+0x2dd4:   	ld	[%i4 + %i1], %f4
	.word	0x81a90aa4	! t0_kref+0x2dd8:   	fcmpes	%fcc0, %f4, %f4
	.word	0x9a880000	! t0_kref+0x2ddc:   	andcc	%g0, %g0, %o5
	.word	0x89b10d24	! t0_kref+0x2de0:   	fandnot1s	%f4, %f4, %f4
	.word	0xd84e8019	! t0_kref+0x2de4:   	ldsb	[%i2 + %i1], %o4
	.word	0x91b00320	! t0_kref+0x2de8:   	bmask	%g0, %g0, %o0
	.word	0x89a10824	! t0_kref+0x2dec:   	fadds	%f4, %f4, %f4
	.word	0x90a83592	! t0_kref+0x2df0:   	andncc	%g0, -0xa6e, %o0
	.word	0x81a90a44	! t0_kref+0x2df4:   	fcmpd	%fcc0, %f4, %f4
	.word	0x34800007	! t0_kref+0x2df8:   	bg,a	_kref+0x2e14
	.word	0x89a10844	! t0_kref+0x2dfc:   	faddd	%f4, %f4, %f4
	.word	0xd408a009	! t0_kref+0x2e00:   	ldub	[%g2 + 9], %o2
	.word	0xda563fe4	! t0_kref+0x2e04:   	ldsh	[%i0 - 0x1c], %o5
	.word	0x89a00024	! t0_kref+0x2e08:   	fmovs	%f4, %f4
	.word	0x99400000	! t0_kref+0x2e0c:   	mov	%y, %o4
	.word	0x89a10944	! t0_kref+0x2e10:   	fmuld	%f4, %f4, %f4
	.word	0x92d8394f	! t0_kref+0x2e14:   	smulcc	%g0, -0x6b1, %o1
	.word	0x94080000	! t0_kref+0x2e18:   	and	%g0, %g0, %o2
	.word	0x9410220e	! t0_kref+0x2e1c:   	mov	0x20e, %o2
	.word	0x97300000	! t0_kref+0x2e20:   	srl	%g0, %g0, %o3
	.word	0x9fc00004	! t0_kref+0x2e24:   	call	%g0 + %g4
	.word	0x89b10964	! t0_kref+0x2e28:   	fpmerge	%f4, %f4, %f4
	.word	0x89a00524	! t0_kref+0x2e2c:   	fsqrts	%f4, %f4
	.word	0x89b10724	! t0_kref+0x2e30:   	fmuld8ulx16	%f4, %f4, %f4
	.word	0x81580000	! t0_kref+0x2e34:   	flushw
	.word	0xc051401b	! t0_kref+0x2e38:   	ldsh	[%g5 + %i3], %g0
	.word	0xc0200018	! t0_kref+0x2e3c:   	clr	[%g0 + %i0]
	.word	0xc99f5018	! t0_kref+0x2e40:   	ldda	[%i5 + %i0]0x80, %f4
	.word	0xd656001b	! t0_kref+0x2e44:   	ldsh	[%i0 + %i3], %o3
	.word	0x90f8316c	! t0_kref+0x2e48:   	sdivcc	%g0, -0xe94, %o0
	.word	0x95b10504	! t0_kref+0x2e4c:   	fcmpgt16	%f4, %f4, %o2
	.word	0x89b10ae4	! t0_kref+0x2e50:   	fpsub32s	%f4, %f4, %f4
	.word	0x89a00544	! t0_kref+0x2e54:   	fsqrtd	%f4, %f4
	.word	0xd4500018	! t0_kref+0x2e58:   	ldsh	[%g0 + %i0], %o2
	.word	0x90d00000	! t0_kref+0x2e5c:   	umulcc	%g0, %g0, %o0
	.word	0xc030a032	! t0_kref+0x2e60:   	clrh	[%g2 + 0x32]
	.word	0x89a108a4	! t0_kref+0x2e64:   	fsubs	%f4, %f4, %f4
	.word	0xc10835dc	! t0_kref+0x2e68:   	ld	[%g0 - 0xa24], %fsr
	.word	0x89a10824	! t0_kref+0x2e6c:   	fadds	%f4, %f4, %f4
	.word	0x86102001	! t0_kref+0x2e70:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x2e74:   	bne,a	_kref+0x2e74
	.word	0x86a0e001	! t0_kref+0x2e78:   	subcc	%g3, 1, %g3
	.word	0xc91fbe50	! t0_kref+0x2e7c:   	ldd	[%fp - 0x1b0], %f4
	.word	0x9a40380d	! t0_kref+0x2e80:   	addc	%g0, -0x7f3, %o5
	.word	0x89a109c4	! t0_kref+0x2e84:   	fdivd	%f4, %f4, %f4
	.word	0xd848a038	! t0_kref+0x2e88:   	ldsb	[%g2 + 0x38], %o4
	.word	0x96a8368d	! t0_kref+0x2e8c:   	andncc	%g0, -0x973, %o3
	.word	0x89a01a44	! t0_kref+0x2e90:   	fdtoi	%f4, %f4
	.word	0x32480004	! t0_kref+0x2e94:   	bne,a,pt	%icc, _kref+0x2ea4
	.word	0x81280000	! t0_kref+0x2e98:   	sll	%g0, %g0, %g0
	.word	0xc030a03e	! t0_kref+0x2e9c:   	clrh	[%g2 + 0x3e]
	.word	0xe03e4000	! t0_kref+0x2ea0:   	std	%l0, [%i1]
	.word	0x89a109c4	! t0_kref+0x2ea4:   	fdivd	%f4, %f4, %f4
	.word	0x34800008	! t0_kref+0x2ea8:   	bg,a	_kref+0x2ec8
	.word	0x89a108a4	! t0_kref+0x2eac:   	fsubs	%f4, %f4, %f4
	.word	0x94500000	! t0_kref+0x2eb0:   	umul	%g0, %g0, %o2
	.word	0x901027ea	! t0_kref+0x2eb4:   	mov	0x7ea, %o0
	.word	0xc030a02a	! t0_kref+0x2eb8:   	clrh	[%g2 + 0x2a]
	.word	0xd000a000	! t0_kref+0x2ebc:   	ld	[%g2], %o0
	.word	0x89b10d24	! t0_kref+0x2ec0:   	fandnot1s	%f4, %f4, %f4
	.word	0x91100000	! t0_kref+0x2ec4:   	taddcctv	%g0, %g0, %o0
	.word	0x89a10824	! t0_kref+0x2ec8:   	fadds	%f4, %f4, %f4
	.word	0x32480005	! t0_kref+0x2ecc:   	bne,a,pt	%icc, _kref+0x2ee0
	.word	0xc920a018	! t0_kref+0x2ed0:   	st	%f4, [%g2 + 0x18]
	.word	0x89a01924	! t0_kref+0x2ed4:   	fstod	%f4, %f4
	.word	0x30800007	! t0_kref+0x2ed8:   	ba,a	_kref+0x2ef4
	.word	0x89a00124	! t0_kref+0x2edc:   	fabss	%f4, %f4
	.word	0x90800000	! t0_kref+0x2ee0:   	addcc	%g0, %g0, %o0
	.word	0x8d80337e	! t0_kref+0x2ee4:   	mov	0xfffff37e, %fprs
	.word	0x91b00100	! t0_kref+0x2ee8:   	edge32	%g0, %g0, %o0
	.word	0x80400000	! t0_kref+0x2eec:   	addc	%g0, %g0, %g0
	.word	0x90e00000	! t0_kref+0x2ef0:   	subccc	%g0, %g0, %o0
	.word	0x98103c30	! t0_kref+0x2ef4:   	mov	0xfffffc30, %o4
	.word	0xc000a034	! t0_kref+0x2ef8:   	ld	[%g2 + 0x34], %g0
	.word	0x89a108a4	! t0_kref+0x2efc:   	fsubs	%f4, %f4, %f4
	.word	0xc91fbd70	! t0_kref+0x2f00:   	ldd	[%fp - 0x290], %f4
	.word	0xc91fbd68	! t0_kref+0x2f04:   	ldd	[%fp - 0x298], %f4
	.word	0x89a00524	! t0_kref+0x2f08:   	fsqrts	%f4, %f4
	.word	0x89b10da4	! t0_kref+0x2f0c:   	fxors	%f4, %f4, %f4
	.word	0x80180000	! t0_kref+0x2f10:   	xor	%g0, %g0, %g0
	.word	0xd656001b	! t0_kref+0x2f14:   	ldsh	[%i0 + %i3], %o3
	.word	0xe8380019	! t0_kref+0x2f18:   	std	%l4, [%g0 + %i1]
	.word	0x95302010	! t0_kref+0x2f1c:   	srl	%g0, 0x10, %o2
	.word	0x92e00000	! t0_kref+0x2f20:   	subccc	%g0, %g0, %o1
	.word	0xc807bfe4	! t0_kref+0x2f24:   	ld	[%fp - 0x1c], %g4
	.word	0x89a10844	! t0_kref+0x2f28:   	faddd	%f4, %f4, %f4
	.word	0x89a00524	! t0_kref+0x2f2c:   	fsqrts	%f4, %f4
	.word	0xee000018	! t0_kref+0x2f30:   	ld	[%g0 + %i0], %l7
	.word	0x92983136	! t0_kref+0x2f34:   	xorcc	%g0, -0xeca, %o1
	.word	0x81a90a44	! t0_kref+0x2f38:   	fcmpd	%fcc0, %f4, %f4
	.word	0x30800004	! t0_kref+0x2f3c:   	ba,a	_kref+0x2f4c
	.word	0x89a109a4	! t0_kref+0x2f40:   	fdivs	%f4, %f4, %f4
	.word	0xda064000	! t0_kref+0x2f44:   	ld	[%i1], %o5
	.word	0x90a039fa	! t0_kref+0x2f48:   	subcc	%g0, -0x606, %o0
	.word	0x9aa83c2a	! t0_kref+0x2f4c:   	andncc	%g0, -0x3d6, %o5
	.word	0x89a10824	! t0_kref+0x2f50:   	fadds	%f4, %f4, %f4
	.word	0x98a03997	! t0_kref+0x2f54:   	subcc	%g0, -0x669, %o4
	.word	0x98603ec1	! t0_kref+0x2f58:   	subc	%g0, -0x13f, %o4
	.word	0xc7ee5000	! t0_kref+0x2f5c:   	prefetcha	%i1, 3
	.word	0x89a00544	! t0_kref+0x2f60:   	fsqrtd	%f4, %f4
	.word	0xec3e6008	! t0_kref+0x2f64:   	std	%l6, [%i1 + 8]
	.word	0x9b282017	! t0_kref+0x2f68:   	sll	%g0, 0x17, %o5
	.word	0x9fc00004	! t0_kref+0x2f6c:   	call	%g0 + %g4
	.word	0x92b80000	! t0_kref+0x2f70:   	xnorcc	%g0, %g0, %o1
	.word	0xd0062018	! t0_kref+0x2f74:   	ld	[%i0 + 0x18], %o0
	.word	0xc91fbc48	! t0_kref+0x2f78:   	ldd	[%fp - 0x3b8], %f4
	.word	0x9800285e	! t0_kref+0x2f7c:   	add	%g0, 0x85e, %o4
	.word	0xd610a02a	! t0_kref+0x2f80:   	lduh	[%g2 + 0x2a], %o3
	.word	0x81a90aa4	! t0_kref+0x2f84:   	fcmpes	%fcc0, %f4, %f4
	.word	0x9330201f	! t0_kref+0x2f88:   	srl	%g0, 0x1f, %o1
	.word	0x89a000a4	! t0_kref+0x2f8c:   	fnegs	%f4, %f4
	.word	0x81400000	! t0_kref+0x2f90:   	mov	%y, %g0
	.word	0x89b10e64	! t0_kref+0x2f94:   	fxnors	%f4, %f4, %f4
	.word	0x95282017	! t0_kref+0x2f98:   	sll	%g0, 0x17, %o2
	.word	0xf9ee101b	! t0_kref+0x2f9c:   	prefetcha	%i0 + %i3, 28
	.word	0xc9066004	! t0_kref+0x2fa0:   	ld	[%i1 + 4], %f4
	.word	0x97282006	! t0_kref+0x2fa4:   	sll	%g0, 0x6, %o3
	.word	0x93b105c4	! t0_kref+0x2fa8:   	fcmpeq32	%f4, %f4, %o1
	.word	0xc5ee5000	! t0_kref+0x2fac:   	prefetcha	%i1, 2
	.word	0x901032de	! t0_kref+0x2fb0:   	mov	0xfffff2de, %o0
	.word	0xedf65000	! t0_kref+0x2fb4:   	casxa	[%i1]0x80, %g0, %l6
	.word	0x816464c6	! t0_kref+0x2fb8:   	move	%icc, -0x33a, %g0
	.word	0xfd6e001c	! t0_kref+0x2fbc:   	prefetch	%i0 + %i4, 30
	.word	0x89a00144	! t0_kref+0x2fc0:   	fabsd	%f4, %f4
	.word	0x89b10ac4	! t0_kref+0x2fc4:   	fpsub32	%f4, %f4, %f4
	.word	0xe83e401d	! t0_kref+0x2fc8:   	std	%l4, [%i1 + %i5]
	.word	0x89a10824	! t0_kref+0x2fcc:   	fadds	%f4, %f4, %f4
	.word	0x9e000000	! t0_kref+0x2fd0:   	add	%g0, %g0, %o7
	.word	0x89b10964	! t0_kref+0x2fd4:   	fpmerge	%f4, %f4, %f4
	.word	0x89b10f44	! t0_kref+0x2fd8:   	fornot1	%f4, %f4, %f4
	.word	0x89a10944	! t0_kref+0x2fdc:   	fmuld	%f4, %f4, %f4
	.word	0x89b10f44	! t0_kref+0x2fe0:   	fornot1	%f4, %f4, %f4
	.word	0xc920a03c	! t0_kref+0x2fe4:   	st	%f4, [%g2 + 0x3c]
	.word	0xda0e2003	! t0_kref+0x2fe8:   	ldub	[%i0 + 3], %o5
	.word	0x89b10d24	! t0_kref+0x2fec:   	fandnot1s	%f4, %f4, %f4
	.word	0x89a01a44	! t0_kref+0x2ff0:   	fdtoi	%f4, %f4
	.word	0x96003237	! t0_kref+0x2ff4:   	add	%g0, -0xdc9, %o3
	.word	0xc020a014	! t0_kref+0x2ff8:   	clr	[%g2 + 0x14]
	.word	0xe2fe1000	! t0_kref+0x2ffc:   	swapa	[%i0]0x80, %l1
	.word	0x81a90a44	! t0_kref+0x3000:   	fcmpd	%fcc0, %f4, %f4
	.word	0xd2500019	! t0_kref+0x3004:   	ldsh	[%g0 + %i1], %o1
	.word	0x89a109a4	! t0_kref+0x3008:   	fdivs	%f4, %f4, %f4
	.word	0x38800008	! t0_kref+0x300c:   	bgu,a	_kref+0x302c
	.word	0x89a10844	! t0_kref+0x3010:   	faddd	%f4, %f4, %f4
	.word	0x93b00140	! t0_kref+0x3014:   	edge32l	%g0, %g0, %o1
	.word	0x89a10d24	! t0_kref+0x3018:   	fsmuld	%f4, %f4, %f4
	.word	0x81db3c1b	! t0_kref+0x301c:   	flush	%o4 - 0x3e5
	.word	0x001fffff	! t0_kref+0x3020:   	illtrap	0x1fffff
	.word	0x89a01884	! t0_kref+0x3024:   	fitos	%f4, %f4
	.word	0x81a90aa4	! t0_kref+0x3028:   	fcmpes	%fcc0, %f4, %f4
	.word	0x9fc00004	! t0_kref+0x302c:   	call	%g0 + %g4
	.word	0xc9066008	! t0_kref+0x3030:   	ld	[%i1 + 8], %f4
	.word	0xd808a015	! t0_kref+0x3034:   	ldub	[%g2 + 0x15], %o4
	.word	0xd83e6010	! t0_kref+0x3038:   	std	%o4, [%i1 + 0x10]
	.word	0x80f80000	! t0_kref+0x303c:   	sdivcc	%g0, %g0, %g0
	.word	0x97200000	! t0_kref+0x3040:   	mulscc	%g0, %g0, %o3
	.word	0x989029f6	! t0_kref+0x3044:   	orcc	%g0, 0x9f6, %o4
	.word	0x99b00060	! t0_kref+0x3048:   	edge8ln	%g0, %g0, %o4
	.word	0xd848a018	! t0_kref+0x304c:   	ldsb	[%g2 + 0x18], %o4
	.word	0x89a00544	! t0_kref+0x3050:   	fsqrtd	%f4, %f4
	.word	0x89b10da4	! t0_kref+0x3054:   	fxors	%f4, %f4, %f4
	.word	0xc9861000	! t0_kref+0x3058:   	lda	[%i0]0x80, %f4
	.word	0x81800000	! t0_kref+0x305c:   	mov	%g0, %y
	.word	0x89a01924	! t0_kref+0x3060:   	fstod	%f4, %f4
	.word	0xd0063ff0	! t0_kref+0x3064:   	ld	[%i0 - 0x10], %o0
	.word	0x89a10824	! t0_kref+0x3068:   	fadds	%f4, %f4, %f4
	.word	0x81a90aa4	! t0_kref+0x306c:   	fcmpes	%fcc0, %f4, %f4
	.word	0xc020a030	! t0_kref+0x3070:   	clr	[%g2 + 0x30]
	.word	0x22800006	! t0_kref+0x3074:   	be,a	_kref+0x308c
	.word	0xc020a030	! t0_kref+0x3078:   	clr	[%g2 + 0x30]
	.word	0x89a000a4	! t0_kref+0x307c:   	fnegs	%f4, %f4
	.word	0x9af80000	! t0_kref+0x3080:   	sdivcc	%g0, %g0, %o5
	.word	0xd44e0000	! t0_kref+0x3084:   	ldsb	[%i0], %o2
	.word	0x89a10924	! t0_kref+0x3088:   	fmuls	%f4, %f4, %f4
	.word	0xd00e6015	! t0_kref+0x308c:   	ldub	[%i1 + 0x15], %o0
	.word	0xd20e001a	! t0_kref+0x3090:   	ldub	[%i0 + %i2], %o1
	.word	0x93b00060	! t0_kref+0x3094:   	edge8ln	%g0, %g0, %o1
	.word	0x13184f2a	! t0_kref+0x3098:   	sethi	%hi(0x613ca800), %o1
	.word	0x9f60a4ff	! t0_kref+0x309c:   	movlg	%fcc0, -0x301, %o7
	.word	0x9fc10000	! t0_kref+0x30a0:   	call	%g4
	.word	0xc9067ffc	! t0_kref+0x30a4:   	ld	[%i1 - 4], %f4
	.word	0xd84e8019	! t0_kref+0x30a8:   	ldsb	[%i2 + %i1], %o4
	.word	0xc02e401a	! t0_kref+0x30ac:   	clrb	[%i1 + %i2]
	.word	0x89a00144	! t0_kref+0x30b0:   	fabsd	%f4, %f4
	.word	0x89a000a4	! t0_kref+0x30b4:   	fnegs	%f4, %f4
	call	SYM(t0_subr3)
	.word	0xc920a038	! t0_kref+0x30bc:   	st	%f4, [%g2 + 0x38]
	.word	0x9e980000	! t0_kref+0x30c0:   	xorcc	%g0, %g0, %o7
	.word	0x89a00044	! t0_kref+0x30c4:   	fmovd	%f4, %f4
	.word	0xd03f4018	! t0_kref+0x30c8:   	std	%o0, [%i5 + %i0]
	.word	0xc020a020	! t0_kref+0x30cc:   	clr	[%g2 + 0x20]
	.word	0x96d02775	! t0_kref+0x30d0:   	umulcc	%g0, 0x775, %o3
	.word	0xd0000019	! t0_kref+0x30d4:   	ld	[%g0 + %i1], %o0
	.word	0x90d03579	! t0_kref+0x30d8:   	umulcc	%g0, -0xa87, %o0
	.word	0xec1e001d	! t0_kref+0x30dc:   	ldd	[%i0 + %i5], %l6
	.word	0x89a00124	! t0_kref+0x30e0:   	fabss	%f4, %f4
	.word	0x89a00524	! t0_kref+0x30e4:   	fsqrts	%f4, %f4
	.word	0xc020a034	! t0_kref+0x30e8:   	clr	[%g2 + 0x34]
	.word	0x89a01a44	! t0_kref+0x30ec:   	fdtoi	%f4, %f4
	.word	0xc0300019	! t0_kref+0x30f0:   	clrh	[%g0 + %i1]
	.word	0xd050a02a	! t0_kref+0x30f4:   	ldsh	[%g2 + 0x2a], %o0
	.word	0x89b10f44	! t0_kref+0x30f8:   	fornot1	%f4, %f4, %f4
	.word	0x89a00144	! t0_kref+0x30fc:   	fabsd	%f4, %f4
	.word	0x89a10944	! t0_kref+0x3100:   	fmuld	%f4, %f4, %f4
	.word	0x94a80000	! t0_kref+0x3104:   	andncc	%g0, %g0, %o2
	.word	0xd0070019	! t0_kref+0x3108:   	ld	[%i4 + %i1], %o0
	.word	0x89b10da4	! t0_kref+0x310c:   	fxors	%f4, %f4, %f4
	.word	0x89b10f44	! t0_kref+0x3110:   	fornot1	%f4, %f4, %f4
	.word	0x90d83809	! t0_kref+0x3114:   	smulcc	%g0, -0x7f7, %o0
	.word	0xd04e8019	! t0_kref+0x3118:   	ldsb	[%i2 + %i1], %o0
	.word	0x89a01084	! t0_kref+0x311c:   	fxtos	%f4, %f4
	.word	0x91400000	! t0_kref+0x3120:   	mov	%y, %o0
	.word	0x9a102589	! t0_kref+0x3124:   	mov	0x589, %o5
	.word	0xc9262008	! t0_kref+0x3128:   	st	%f4, [%i0 + 8]
	.word	0x8610201f	! t0_kref+0x312c:   	mov	0x1f, %g3
	.word	0x86a0e001	! t0_kref+0x3130:   	subcc	%g3, 1, %g3
	.word	0x22800018	! t0_kref+0x3134:   	be,a	_kref+0x3194
	.word	0xae080000	! t0_kref+0x3138:   	and	%g0, %g0, %l7
	.word	0xc91fbee0	! t0_kref+0x313c:   	ldd	[%fp - 0x120], %f4
	.word	0xd448a00e	! t0_kref+0x3140:   	ldsb	[%g2 + 0xe], %o2
	.word	0xaea827df	! t0_kref+0x3144:   	andncc	%g0, 0x7df, %l7
	.word	0xd610a018	! t0_kref+0x3148:   	lduh	[%g2 + 0x18], %o3
	.word	0xae603446	! t0_kref+0x314c:   	subc	%g0, -0xbba, %l7
	.word	0x30bffff8	! t0_kref+0x3150:   	ba,a	_kref+0x3130
	.word	0xc91fbfb8	! t0_kref+0x3154:   	ldd	[%fp - 0x48], %f4
	.word	0xd09e1000	! t0_kref+0x3158:   	ldda	[%i0]0x80, %o0
	.word	0x96d00000	! t0_kref+0x315c:   	umulcc	%g0, %g0, %o3
	.word	0x90c00000	! t0_kref+0x3160:   	addccc	%g0, %g0, %o0
	.word	0xe01e7ff0	! t0_kref+0x3164:   	ldd	[%i1 - 0x10], %l0
	.word	0x89a00124	! t0_kref+0x3168:   	fabss	%f4, %f4
	.word	0x81de401f	! t0_kref+0x316c:   	flush	%i1 + %i7
	.word	0x94500000	! t0_kref+0x3170:   	umul	%g0, %g0, %o2
	.word	0x89a108c4	! t0_kref+0x3174:   	fsubd	%f4, %f4, %f4
	.word	0x97b000a0	! t0_kref+0x3178:   	edge16n	%g0, %g0, %o3
	.word	0x89a109c4	! t0_kref+0x317c:   	fdivd	%f4, %f4, %f4
	.word	0x89a01104	! t0_kref+0x3180:   	fxtod	%f4, %f4
	.word	0xc91fbcc8	! t0_kref+0x3184:   	ldd	[%fp - 0x338], %f4
	.word	0x81800000	! t0_kref+0x3188:   	mov	%g0, %y
	.word	0x89b10704	! t0_kref+0x318c:   	fmuld8sux16	%f4, %f4, %f4
	.word	0x96200000	! t0_kref+0x3190:   	neg	%g0, %o3
	.word	0x96e02980	! t0_kref+0x3194:   	subccc	%g0, 0x980, %o3
	.word	0x89a10824	! t0_kref+0x3198:   	fadds	%f4, %f4, %f4
	.word	0xd650a032	! t0_kref+0x319c:   	ldsh	[%g2 + 0x32], %o3
	.word	0x8143e076	! t0_kref+0x31a0:   	membar	0x76
	.word	0x38480003	! t0_kref+0x31a4:   	bgu,a,pt	%icc, _kref+0x31b0
	.word	0xd248a005	! t0_kref+0x31a8:   	ldsb	[%g2 + 5], %o1
	.word	0xd8500019	! t0_kref+0x31ac:   	ldsh	[%g0 + %i1], %o4
	.word	0x89a108a4	! t0_kref+0x31b0:   	fsubs	%f4, %f4, %f4
	.word	0xd696501b	! t0_kref+0x31b4:   	lduha	[%i1 + %i3]0x80, %o3
	.word	0x92f80000	! t0_kref+0x31b8:   	sdivcc	%g0, %g0, %o1
	.word	0xd616001b	! t0_kref+0x31bc:   	lduh	[%i0 + %i3], %o3
	.word	0x89b106a4	! t0_kref+0x31c0:   	fmul8x16al	%f4, %f4, %f4
	.word	0x94f80000	! t0_kref+0x31c4:   	sdivcc	%g0, %g0, %o2
	.word	0xc0260000	! t0_kref+0x31c8:   	clr	[%i0]
	.word	0xc0a61000	! t0_kref+0x31cc:   	sta	%g0, [%i0]0x80
	.word	0x94380000	! t0_kref+0x31d0:   	not	%g0, %o2
	.word	0xc020a024	! t0_kref+0x31d4:   	clr	[%g2 + 0x24]
	.word	0x81a90aa4	! t0_kref+0x31d8:   	fcmpes	%fcc0, %f4, %f4
	.word	0xd800a034	! t0_kref+0x31dc:   	ld	[%g2 + 0x34], %o4
	.word	0x89b10ae4	! t0_kref+0x31e0:   	fpsub32s	%f4, %f4, %f4
	.word	0x89a01904	! t0_kref+0x31e4:   	fitod	%f4, %f4
	.word	0xd048a023	! t0_kref+0x31e8:   	ldsb	[%g2 + 0x23], %o0
	.word	0x89a000a4	! t0_kref+0x31ec:   	fnegs	%f4, %f4
	.word	0xc99e501d	! t0_kref+0x31f0:   	ldda	[%i1 + %i5]0x80, %f4
	.word	0x97382001	! t0_kref+0x31f4:   	sra	%g0, 0x1, %o3
	.word	0x9a700000	! t0_kref+0x31f8:   	udiv	%g0, %g0, %o5
	.word	0x89b10ae4	! t0_kref+0x31fc:   	fpsub32s	%f4, %f4, %f4
	.word	0xc030a030	! t0_kref+0x3200:   	clrh	[%g2 + 0x30]
	.word	0x81db260a	! t0_kref+0x3204:   	flush	%o4 + 0x60a
	.word	0x89a01084	! t0_kref+0x3208:   	fxtos	%f4, %f4
	.word	0xc926001c	! t0_kref+0x320c:   	st	%f4, [%i0 + %i4]
	.word	0xe56e3fe8	! t0_kref+0x3210:   	prefetch	%i0 - 0x18, 18
	.word	0x9a880000	! t0_kref+0x3214:   	andcc	%g0, %g0, %o5
	.word	0xc0763ff8	! t0_kref+0x3218:   	stx	%g0, [%i0 - 8]
	.word	0xd408a004	! t0_kref+0x321c:   	ldub	[%g2 + 4], %o2
	.word	0xedee101a	! t0_kref+0x3220:   	prefetcha	%i0 + %i2, 22
	.word	0xe83e7ff0	! t0_kref+0x3224:   	std	%l4, [%i1 - 0x10]
	.word	0xc020a020	! t0_kref+0x3228:   	clr	[%g2 + 0x20]
	.word	0x99664000	! t0_kref+0x322c:   	movne	%icc, %g0, %o4
	.word	0x96e00000	! t0_kref+0x3230:   	subccc	%g0, %g0, %o3
	.word	0xc0264000	! t0_kref+0x3234:   	clr	[%i1]
	.word	0x81defc81	! t0_kref+0x3238:   	flush	%i3 - 0x37f
	.word	0x89a10d24	! t0_kref+0x323c:   	fsmuld	%f4, %f4, %f4
	.word	0x9fb10584	! t0_kref+0x3240:   	fcmpgt32	%f4, %f4, %o7
	.word	0xc0367ff2	! t0_kref+0x3244:   	clrh	[%i1 - 0xe]
	.word	0x9fc10000	! t0_kref+0x3248:   	call	%g4
	.word	0xd06e6019	! t0_kref+0x324c:   	ldstub	[%i1 + 0x19], %o0
	.word	0x89a00524	! t0_kref+0x3250:   	fsqrts	%f4, %f4
	.word	0x89a00124	! t0_kref+0x3254:   	fabss	%f4, %f4
	.word	0x99400000	! t0_kref+0x3258:   	mov	%y, %o4
	.word	0xe83e0000	! t0_kref+0x325c:   	std	%l4, [%i0]
	.word	0x80e00000	! t0_kref+0x3260:   	subccc	%g0, %g0, %g0
	.word	0x89a10d24	! t0_kref+0x3264:   	fsmuld	%f4, %f4, %f4
	.word	0x92882fad	! t0_kref+0x3268:   	andcc	%g0, 0xfad, %o1
	.word	0x95b10404	! t0_kref+0x326c:   	fcmple16	%f4, %f4, %o2
	.word	0x89b10624	! t0_kref+0x3270:   	fmul8x16	%f4, %f4, %f4
	.word	0x94182879	! t0_kref+0x3274:   	xor	%g0, 0x879, %o2
	.word	0x81300000	! t0_kref+0x3278:   	srl	%g0, %g0, %g0
	.word	0xde48a009	! t0_kref+0x327c:   	ldsb	[%g2 + 9], %o7
	.word	0x95b00020	! t0_kref+0x3280:   	edge8n	%g0, %g0, %o2
	.word	0xc99e501d	! t0_kref+0x3284:   	ldda	[%i1 + %i5]0x80, %f4
	.word	0x81a90ac4	! t0_kref+0x3288:   	fcmped	%fcc0, %f4, %f4
	.word	0xd6567ffc	! t0_kref+0x328c:   	ldsh	[%i1 - 4], %o3
	.word	0xaf280000	! t0_kref+0x3290:   	sll	%g0, %g0, %l7
	.word	0x89a01924	! t0_kref+0x3294:   	fstod	%f4, %f4
	.word	0x89b10d04	! t0_kref+0x3298:   	fandnot1	%f4, %f4, %f4
	.word	0x92e00000	! t0_kref+0x329c:   	subccc	%g0, %g0, %o1
	.word	0xe878a010	! t0_kref+0x32a0:   	swap	[%g2 + 0x10], %l4
	.word	0xe41e3fe0	! t0_kref+0x32a4:   	ldd	[%i0 - 0x20], %l2
	.word	0xde10a034	! t0_kref+0x32a8:   	lduh	[%g2 + 0x34], %o7
	.word	0x89a10944	! t0_kref+0x32ac:   	fmuld	%f4, %f4, %f4
	.word	0x81a90a44	! t0_kref+0x32b0:   	fcmpd	%fcc0, %f4, %f4
	.word	0x87802080	! t0_kref+0x32b4:   	mov	0x80, %asi
	.word	0xae8024f9	! t0_kref+0x32b8:   	addcc	%g0, 0x4f9, %l7
	.word	0x9fb000a0	! t0_kref+0x32bc:   	edge16n	%g0, %g0, %o7
	.word	0x89a10844	! t0_kref+0x32c0:   	faddd	%f4, %f4, %f4
	.word	0xc9a0a038	! t0_kref+0x32c4:   	sta	%f4, [%g2 + 0x38]%asi
	.word	0x9a980000	! t0_kref+0x32c8:   	xorcc	%g0, %g0, %o5
	.word	0x89a01924	! t0_kref+0x32cc:   	fstod	%f4, %f4
	.word	0xe2ee101a	! t0_kref+0x32d0:   	ldstuba	[%i0 + %i2]0x80, %l1
	.word	0xc0a8a002	! t0_kref+0x32d4:   	stba	%g0, [%g2 + 2]%asi
	.word	0xc5ee1000	! t0_kref+0x32d8:   	prefetcha	%i0, 2
	.word	0x89a10824	! t0_kref+0x32dc:   	fadds	%f4, %f4, %f4
	.word	0xd2f8a034	! t0_kref+0x32e0:   	swapa	[%g2 + 0x34]%asi, %o1
	.word	0x89b10624	! t0_kref+0x32e4:   	fmul8x16	%f4, %f4, %f4
	.word	0x80982aa5	! t0_kref+0x32e8:   	xorcc	%g0, 0xaa5, %g0
	.word	0xc02e401a	! t0_kref+0x32ec:   	clrb	[%i1 + %i2]
	.word	0x2a800001	! t0_kref+0x32f0:   	bcs,a	_kref+0x32f4
	.word	0x929828c9	! t0_kref+0x32f4:   	xorcc	%g0, 0x8c9, %o1
	.word	0xd896501b	! t0_kref+0x32f8:   	lduha	[%i1 + %i3]0x80, %o4
	.word	0x89a10824	! t0_kref+0x32fc:   	fadds	%f4, %f4, %f4
	.word	0x89b10704	! t0_kref+0x3300:   	fmuld8sux16	%f4, %f4, %f4
	.word	0x99200000	! t0_kref+0x3304:   	mulscc	%g0, %g0, %o4
	.word	0x9e403a7f	! t0_kref+0x3308:   	addc	%g0, -0x581, %o7
	.word	0x981828f8	! t0_kref+0x330c:   	xor	%g0, 0x8f8, %o4
	.word	0x8020224c	! t0_kref+0x3310:   	sub	%g0, 0x24c, %g0
	.word	0x89a10924	! t0_kref+0x3314:   	fmuls	%f4, %f4, %f4
	.word	0x89a10944	! t0_kref+0x3318:   	fmuld	%f4, %f4, %f4
	.word	0x81a90aa4	! t0_kref+0x331c:   	fcmpes	%fcc0, %f4, %f4
	.word	0xc00e601e	! t0_kref+0x3320:   	ldub	[%i1 + 0x1e], %g0
	.word	0xc0a0a014	! t0_kref+0x3324:   	sta	%g0, [%g2 + 0x14]%asi
	.word	0x9fc10000	! t0_kref+0x3328:   	call	%g4
	.word	0x9af83686	! t0_kref+0x332c:   	sdivcc	%g0, -0x97a, %o5
	.word	0xd24e2018	! t0_kref+0x3330:   	ldsb	[%i0 + 0x18], %o1
	.word	0xd0ce9018	! t0_kref+0x3334:   	ldsba	[%i2 + %i0]0x80, %o0
	.word	0x81df6d13	! t0_kref+0x3338:   	flush	%i5 + 0xd13
	.word	0x89a10824	! t0_kref+0x333c:   	fadds	%f4, %f4, %f4
	.word	0xc02e8019	! t0_kref+0x3340:   	clrb	[%i2 + %i1]
	.word	0x89a000a4	! t0_kref+0x3344:   	fnegs	%f4, %f4
	.word	0x9f100000	! t0_kref+0x3348:   	taddcctv	%g0, %g0, %o7
	.word	0x89a00124	! t0_kref+0x334c:   	fabss	%f4, %f4
	.word	0xd0566002	! t0_kref+0x3350:   	ldsh	[%i1 + 2], %o0
	.word	0xc900a00c	! t0_kref+0x3354:   	ld	[%g2 + 0xc], %f4
	.word	0xc0b0a00c	! t0_kref+0x3358:   	stha	%g0, [%g2 + 0xc]%asi
	.word	0x89a01a24	! t0_kref+0x335c:   	fstoi	%f4, %f4
	.word	0x90f80000	! t0_kref+0x3360:   	sdivcc	%g0, %g0, %o0
	.word	0x9130200c	! t0_kref+0x3364:   	srl	%g0, 0xc, %o0
	.word	0x92100000	! t0_kref+0x3368:   	clr	%o1
	.word	0x1f02a47e	! t0_kref+0x336c:   	sethi	%hi(0xa91f800), %o7
	.word	0x81a90ac4	! t0_kref+0x3370:   	fcmped	%fcc0, %f4, %f4
	.word	0xc9066004	! t0_kref+0x3374:   	ld	[%i1 + 4], %f4
	.word	0x9e503bf7	! t0_kref+0x3378:   	umul	%g0, -0x409, %o7
	.word	0x94d00000	! t0_kref+0x337c:   	umulcc	%g0, %g0, %o2
	.word	0x89a10844	! t0_kref+0x3380:   	faddd	%f4, %f4, %f4
	.word	0x89a000a4	! t0_kref+0x3384:   	fnegs	%f4, %f4
	.word	0x89a10d24	! t0_kref+0x3388:   	fsmuld	%f4, %f4, %f4
	.word	0x909035d9	! t0_kref+0x338c:   	orcc	%g0, -0xa27, %o0
	.word	0x89a01924	! t0_kref+0x3390:   	fstod	%f4, %f4
	.word	0x89a00124	! t0_kref+0x3394:   	fabss	%f4, %f4
	.word	0x89a00524	! t0_kref+0x3398:   	fsqrts	%f4, %f4
	.word	0x9ef03c75	! t0_kref+0x339c:   	udivcc	%g0, -0x38b, %o7
	.word	0x90d02d8c	! t0_kref+0x33a0:   	umulcc	%g0, 0xd8c, %o0
	.word	0xd2166012	! t0_kref+0x33a4:   	lduh	[%i1 + 0x12], %o1
	.word	0xd80e8019	! t0_kref+0x33a8:   	ldub	[%i2 + %i1], %o4
	.word	0xc0080019	! t0_kref+0x33ac:   	ldub	[%g0 + %i1], %g0
	.word	0x81418000	! t0_kref+0x33b0:   	mov	%fprs, %g0
	.word	0x90500000	! t0_kref+0x33b4:   	umul	%g0, %g0, %o0
	.word	0x95302002	! t0_kref+0x33b8:   	srl	%g0, 0x2, %o2
	.word	0x97400000	! t0_kref+0x33bc:   	mov	%y, %o3
	.word	0xeff65000	! t0_kref+0x33c0:   	casxa	[%i1]0x80, %g0, %l7
	.word	0x89b10e64	! t0_kref+0x33c4:   	fxnors	%f4, %f4, %f4
	.word	0x89a01a44	! t0_kref+0x33c8:   	fdtoi	%f4, %f4
	.word	0x80f8399b	! t0_kref+0x33cc:   	sdivcc	%g0, -0x665, %g0
	.word	0x9e502085	! t0_kref+0x33d0:   	umul	%g0, 0x85, %o7
	.word	0x92c02bba	! t0_kref+0x33d4:   	addccc	%g0, 0xbba, %o1
	.word	0x95b00060	! t0_kref+0x33d8:   	edge8ln	%g0, %g0, %o2
	.word	0x89a00524	! t0_kref+0x33dc:   	fsqrts	%f4, %f4
	.word	0x89a108c4	! t0_kref+0x33e0:   	fsubd	%f4, %f4, %f4
	.word	0x91b00140	! t0_kref+0x33e4:   	edge32l	%g0, %g0, %o0
	.word	0x94a80000	! t0_kref+0x33e8:   	andncc	%g0, %g0, %o2
	.word	0xc9a0a000	! t0_kref+0x33ec:   	sta	%f4, [%g2]%asi
	.word	0x31480004	! t0_kref+0x33f0:   	fba,a,pt	%fcc0, _kref+0x3400
	.word	0xc030a022	! t0_kref+0x33f4:   	clrh	[%g2 + 0x22]
	.word	0x28800008	! t0_kref+0x33f8:   	bleu,a	_kref+0x3418
	.word	0x95282018	! t0_kref+0x33fc:   	sll	%g0, 0x18, %o2
	.word	0xe81e6018	! t0_kref+0x3400:   	ldd	[%i1 + 0x18], %l4
	.word	0x80b00000	! t0_kref+0x3404:   	orncc	%g0, %g0, %g0
	.word	0x81580000	! t0_kref+0x3408:   	flushw
	.word	0x94100000	! t0_kref+0x340c:   	clr	%o2
	.word	0xdf01401c	! t0_kref+0x3410:   	ld	[%g5 + %i4], %f15
	.word	0x89a00524	! t0_kref+0x3414:   	fsqrts	%f4, %f4
	.word	0xc91fbe38	! t0_kref+0x3418:   	ldd	[%fp - 0x1c8], %f4
	.word	0x89a10844	! t0_kref+0x341c:   	faddd	%f4, %f4, %f4
	.word	0x98e00000	! t0_kref+0x3420:   	subccc	%g0, %g0, %o4
	.word	0x89a01084	! t0_kref+0x3424:   	fxtos	%f4, %f4
	.word	0x89a108c4	! t0_kref+0x3428:   	fsubd	%f4, %f4, %f4
	.word	0x9af80000	! t0_kref+0x342c:   	sdivcc	%g0, %g0, %o5
	.word	0x2c800002	! t0_kref+0x3430:   	bneg,a	_kref+0x3438
	.word	0xd610a03c	! t0_kref+0x3434:   	lduh	[%g2 + 0x3c], %o3
	.word	0x9a000000	! t0_kref+0x3438:   	add	%g0, %g0, %o5
	.word	0xae983f59	! t0_kref+0x343c:   	xorcc	%g0, -0xa7, %l7
	.word	0x95b00340	! t0_kref+0x3440:   	alignaddrl	%g0, %g0, %o2
	.word	0x89b00fc0	! t0_kref+0x3444:   	fone	%f4
	.word	0x89a00524	! t0_kref+0x3448:   	fsqrts	%f4, %f4
	.word	0x89a000a4	! t0_kref+0x344c:   	fnegs	%f4, %f4
	.word	0xc9ee1000	! t0_kref+0x3450:   	prefetcha	%i0, 4
	.word	0x9f200000	! t0_kref+0x3454:   	mulscc	%g0, %g0, %o7
	.word	0x91400000	! t0_kref+0x3458:   	mov	%y, %o0
	.word	0x89a000a4	! t0_kref+0x345c:   	fnegs	%f4, %f4
	.word	0x89b10704	! t0_kref+0x3460:   	fmuld8sux16	%f4, %f4, %f4
	.word	0x932031fa	! t0_kref+0x3464:   	mulscc	%g0, -0xe06, %o1
	.word	0x89a01a44	! t0_kref+0x3468:   	fdtoi	%f4, %f4
	.word	0x92802015	! t0_kref+0x346c:   	addcc	%g0, 0x15, %o1
	.word	0x97203a18	! t0_kref+0x3470:   	mulscc	%g0, -0x5e8, %o3
	.word	0xee4e3ff2	! t0_kref+0x3474:   	ldsb	[%i0 - 0xe], %l7
	.word	0x90980000	! t0_kref+0x3478:   	xorcc	%g0, %g0, %o0
	.word	0x94500000	! t0_kref+0x347c:   	umul	%g0, %g0, %o2
	.word	0x89b10e64	! t0_kref+0x3480:   	fxnors	%f4, %f4, %f4
	.word	0x89b10ae4	! t0_kref+0x3484:   	fpsub32s	%f4, %f4, %f4
	.word	0x20480001	! t0_kref+0x3488:   	bn,a,pt	%icc, _kref+0x348c
	.word	0xc91fbc90	! t0_kref+0x348c:   	ldd	[%fp - 0x370], %f4
	.word	0x9aa80000	! t0_kref+0x3490:   	andncc	%g0, %g0, %o5
	.word	0x89b00fe0	! t0_kref+0x3494:   	fones	%f4
	.word	0x92280000	! t0_kref+0x3498:   	andn	%g0, %g0, %o1
	.word	0xc906001c	! t0_kref+0x349c:   	ld	[%i0 + %i4], %f4
	.word	0x3c800005	! t0_kref+0x34a0:   	bpos,a	_kref+0x34b4
	.word	0xd60e401a	! t0_kref+0x34a4:   	ldub	[%i1 + %i2], %o3
	.word	0xde4e2003	! t0_kref+0x34a8:   	ldsb	[%i0 + 3], %o7
	.word	0x81b00020	! t0_kref+0x34ac:   	edge8n	%g0, %g0, %g0
	.word	0x89a000a4	! t0_kref+0x34b0:   	fnegs	%f4, %f4
	.word	0xd8563fea	! t0_kref+0x34b4:   	ldsh	[%i0 - 0x16], %o4
	.word	0x9b200000	! t0_kref+0x34b8:   	mulscc	%g0, %g0, %o5
	.word	0x89b10ee4	! t0_kref+0x34bc:   	fornot2s	%f4, %f4, %f4
	.word	0x96080000	! t0_kref+0x34c0:   	and	%g0, %g0, %o3
	.word	0x89b10744	! t0_kref+0x34c4:   	fpack32	%f4, %f4, %f4
	.word	0xd280a000	! t0_kref+0x34c8:   	lda	[%g2]%asi, %o1
	.word	0x81a90a44	! t0_kref+0x34cc:   	fcmpd	%fcc0, %f4, %f4
	.word	0x89b10f64	! t0_kref+0x34d0:   	fornot1s	%f4, %f4, %f4
	.word	0xd8000018	! t0_kref+0x34d4:   	ld	[%g0 + %i0], %o4
	.word	0xd4d0a030	! t0_kref+0x34d8:   	ldsha	[%g2 + 0x30]%asi, %o2
	.word	0xd80e401a	! t0_kref+0x34dc:   	ldub	[%i1 + %i2], %o4
	.word	0x89a10844	! t0_kref+0x34e0:   	faddd	%f4, %f4, %f4
	.word	0x89a10844	! t0_kref+0x34e4:   	faddd	%f4, %f4, %f4
	.word	0xc0b0a012	! t0_kref+0x34e8:   	stha	%g0, [%g2 + 0x12]%asi
	.word	0x81d9000d	! t0_kref+0x34ec:   	flush	%g4 + %o5
	.word	0x962031b0	! t0_kref+0x34f0:   	sub	%g0, -0xe50, %o3
	.word	0xc02e3ff7	! t0_kref+0x34f4:   	clrb	[%i0 - 9]
	.word	0xc0766000	! t0_kref+0x34f8:   	stx	%g0, [%i1]
	.word	0xd80e7ffa	! t0_kref+0x34fc:   	ldub	[%i1 - 6], %o4
	.word	0x89a10844	! t0_kref+0x3500:   	faddd	%f4, %f4, %f4
	.word	0x89b10744	! t0_kref+0x3504:   	fpack32	%f4, %f4, %f4
	.word	0x89b107c4	! t0_kref+0x3508:   	pdist	%f4, %f4, %f4
	.word	0x93400000	! t0_kref+0x350c:   	mov	%y, %o1
	.word	0x89b10624	! t0_kref+0x3510:   	fmul8x16	%f4, %f4, %f4
	.word	0x89a01904	! t0_kref+0x3514:   	fitod	%f4, %f4
	.word	0x89b10964	! t0_kref+0x3518:   	fpmerge	%f4, %f4, %f4
	.word	0x89a00524	! t0_kref+0x351c:   	fsqrts	%f4, %f4
	.word	0x89a108a4	! t0_kref+0x3520:   	fsubs	%f4, %f4, %f4
	.word	0xda4e200d	! t0_kref+0x3524:   	ldsb	[%i0 + 0xd], %o5
	.word	0x9de3bfa0	! t0_kref+0x3528:   	save	%sp, -0x60, %sp
	.word	0xb88f001c	! t0_kref+0x352c:   	andcc	%i4, %i4, %i4
	.word	0x91eeb18e	! t0_kref+0x3530:   	restore	%i2, -0xe72, %o0
	.word	0x98b80000	! t0_kref+0x3534:   	xnorcc	%g0, %g0, %o4
	.word	0xc090a03c	! t0_kref+0x3538:   	lduha	[%g2 + 0x3c]%asi, %g0
	.word	0x9b300000	! t0_kref+0x353c:   	srl	%g0, %g0, %o5
	.word	0xd00e600e	! t0_kref+0x3540:   	ldub	[%i1 + 0xe], %o0
	.word	0x81a90a44	! t0_kref+0x3544:   	fcmpd	%fcc0, %f4, %f4
	.word	0x89b106c4	! t0_kref+0x3548:   	fmul8sux16	%f4, %f4, %f4
	.word	0x803021f2	! t0_kref+0x354c:   	orn	%g0, 0x1f2, %g0
	.word	0x90d020e2	! t0_kref+0x3550:   	umulcc	%g0, 0xe2, %o0
	.word	0xc0a0a004	! t0_kref+0x3554:   	sta	%g0, [%g2 + 4]%asi
	.word	0x87802080	! t0_kref+0x3558:   	mov	0x80, %asi
	.word	0xde062008	! t0_kref+0x355c:   	ld	[%i0 + 8], %o7
	.word	0x81dfc004	! t0_kref+0x3560:   	flush	%i7 + %g4
	.word	0xdac0a024	! t0_kref+0x3564:   	ldswa	[%g2 + 0x24]%asi, %o5
	.word	0x34800001	! t0_kref+0x3568:   	bg,a	_kref+0x356c
	.word	0x8143c000	! t0_kref+0x356c:   	stbar
	.word	0x89a10944	! t0_kref+0x3570:   	fmuld	%f4, %f4, %f4
	.word	0x89b10984	! t0_kref+0x3574:   	bshuffle	%f4, %f4, %f4
	.word	0x9bb00020	! t0_kref+0x3578:   	edge8n	%g0, %g0, %o5
	.word	0x89ab8044	! t0_kref+0x357c:   	fmovdule	%fcc0, %f4, %f4
	.word	0x89a00544	! t0_kref+0x3580:   	fsqrtd	%f4, %f4
	.word	0xd448a01d	! t0_kref+0x3584:   	ldsb	[%g2 + 0x1d], %o2
	.word	0x92f80000	! t0_kref+0x3588:   	sdivcc	%g0, %g0, %o1
	.word	0x98a8314d	! t0_kref+0x358c:   	andncc	%g0, -0xeb3, %o4
	.word	0x81580000	! t0_kref+0x3590:   	flushw
	.word	0x89a01a44	! t0_kref+0x3594:   	fdtoi	%f4, %f4
	.word	0xeec8a022	! t0_kref+0x3598:   	ldsba	[%g2 + 0x22]%asi, %l7
	.word	0x89a108c4	! t0_kref+0x359c:   	fsubd	%f4, %f4, %f4
	.word	0x89b10964	! t0_kref+0x35a0:   	fpmerge	%f4, %f4, %f4
	.word	0xd25e0000	! t0_kref+0x35a4:   	ldx	[%i0], %o1
	.word	0x89aa0024	! t0_kref+0x35a8:   	fmovsa	%fcc0, %f4, %f4
	.word	0x89a01904	! t0_kref+0x35ac:   	fitod	%f4, %f4
	.word	0x81a90a44	! t0_kref+0x35b0:   	fcmpd	%fcc0, %f4, %f4
	.word	0x9ee00000	! t0_kref+0x35b4:   	subccc	%g0, %g0, %o7
	.word	0x9bb00140	! t0_kref+0x35b8:   	edge32l	%g0, %g0, %o5
	.word	0x3c800008	! t0_kref+0x35bc:   	bpos,a	_kref+0x35dc
	.word	0x89a00524	! t0_kref+0x35c0:   	fsqrts	%f4, %f4
	.word	0x9e180000	! t0_kref+0x35c4:   	xor	%g0, %g0, %o7
	.word	0x24800001	! t0_kref+0x35c8:   	ble,a	_kref+0x35cc
	.word	0x89a01a24	! t0_kref+0x35cc:   	fstoi	%f4, %f4
	.word	0xc020a038	! t0_kref+0x35d0:   	clr	[%g2 + 0x38]
	.word	0x89a00124	! t0_kref+0x35d4:   	fabss	%f4, %f4
	.word	0xaec039fa	! t0_kref+0x35d8:   	addccc	%g0, -0x606, %l7
	.word	0x9a902006	! t0_kref+0x35dc:   	orcc	%g0, 6, %o5
	.word	0xc0264000	! t0_kref+0x35e0:   	clr	[%i1]
	.word	0xc0262018	! t0_kref+0x35e4:   	clr	[%i0 + 0x18]
	.word	0xda0e8019	! t0_kref+0x35e8:   	ldub	[%i2 + %i1], %o5
	.word	0x81a90aa4	! t0_kref+0x35ec:   	fcmpes	%fcc0, %f4, %f4
	.word	0x81d93735	! t0_kref+0x35f0:   	flush	%g4 - 0x8cb
	.word	0x9ea80000	! t0_kref+0x35f4:   	andncc	%g0, %g0, %o7
	.word	0x89a00544	! t0_kref+0x35f8:   	fsqrtd	%f4, %f4
	.word	0x81a90a24	! t0_kref+0x35fc:   	fcmps	%fcc0, %f4, %f4
	.word	0x81d90019	! t0_kref+0x3600:   	flush	%g4 + %i1
	.word	0x80b82a57	! t0_kref+0x3604:   	xnorcc	%g0, 0xa57, %g0
	.word	0xd600a030	! t0_kref+0x3608:   	ld	[%g2 + 0x30], %o3
	.word	0x93b10404	! t0_kref+0x360c:   	fcmple16	%f4, %f4, %o1
	.word	0xec1e6010	! t0_kref+0x3610:   	ldd	[%i1 + 0x10], %l6
	.word	0x93703a28	! t0_kref+0x3614:   	popc	-0x5d8, %o1
	.word	0xde4e8018	! t0_kref+0x3618:   	ldsb	[%i2 + %i0], %o7
	.word	0xda50a034	! t0_kref+0x361c:   	ldsh	[%g2 + 0x34], %o5
	.word	0x9fc00004	! t0_kref+0x3620:   	call	%g0 + %g4
	.word	0xc920a010	! t0_kref+0x3624:   	st	%f4, [%g2 + 0x10]
	.word	0x94300000	! t0_kref+0x3628:   	orn	%g0, %g0, %o2
	.word	0xc028a000	! t0_kref+0x362c:   	clrb	[%g2]
	.word	0xc9070019	! t0_kref+0x3630:   	ld	[%i4 + %i1], %f4
	.word	0xe01e001d	! t0_kref+0x3634:   	ldd	[%i0 + %i5], %l0
	.word	0xe03e3fe0	! t0_kref+0x3638:   	std	%l0, [%i0 - 0x20]
	.word	0x38800001	! t0_kref+0x363c:   	bgu,a	_kref+0x3640
	.word	0x89a01924	! t0_kref+0x3640:   	fstod	%f4, %f4
	.word	0x80703c1c	! t0_kref+0x3644:   	udiv	%g0, -0x3e4, %g0
	.word	0x81a90a24	! t0_kref+0x3648:   	fcmps	%fcc0, %f4, %f4
	.word	0x80102237	! t0_kref+0x364c:   	mov	0x237, %g0
	.word	0x20800008	! t0_kref+0x3650:   	bn,a	_kref+0x3670
	.word	0x98a00000	! t0_kref+0x3654:   	subcc	%g0, %g0, %o4
	.word	0xe41e2010	! t0_kref+0x3658:   	ldd	[%i0 + 0x10], %l2
	.word	0xc900a008	! t0_kref+0x365c:   	ld	[%g2 + 8], %f4
	.word	0xde0e7fe2	! t0_kref+0x3660:   	ldub	[%i1 - 0x1e], %o7
	.word	0xd64e601d	! t0_kref+0x3664:   	ldsb	[%i1 + 0x1d], %o3
	.word	0xedee101c	! t0_kref+0x3668:   	prefetcha	%i0 + %i4, 22
	.word	0x81a90aa4	! t0_kref+0x366c:   	fcmpes	%fcc0, %f4, %f4
	.word	0x89a01884	! t0_kref+0x3670:   	fitos	%f4, %f4
	.word	0x89a10844	! t0_kref+0x3674:   	faddd	%f4, %f4, %f4
	.word	0xe41e2010	! t0_kref+0x3678:   	ldd	[%i0 + 0x10], %l2
	.word	0xc0b0a006	! t0_kref+0x367c:   	stha	%g0, [%g2 + 6]%asi
	.word	0x89b10ac4	! t0_kref+0x3680:   	fpsub32	%f4, %f4, %f4
	.word	0x8128201e	! t0_kref+0x3684:   	sll	%g0, 0x1e, %g0
	.word	0xc0263fe8	! t0_kref+0x3688:   	clr	[%i0 - 0x18]
	.word	0x92880000	! t0_kref+0x368c:   	andcc	%g0, %g0, %o1
	.word	0x96d80000	! t0_kref+0x3690:   	smulcc	%g0, %g0, %o3
	.word	0xc900a038	! t0_kref+0x3694:   	ld	[%g2 + 0x38], %f4
	.word	0x9de3bfa0	! t0_kref+0x3698:   	save	%sp, -0x60, %sp
	.word	0x9feec01a	! t0_kref+0x369c:   	restore	%i3, %i2, %o7
	.word	0x89b10984	! t0_kref+0x36a0:   	bshuffle	%f4, %f4, %f4
	.word	0xee4e7ff4	! t0_kref+0x36a4:   	ldsb	[%i1 - 0xc], %l7
	.word	0x94500000	! t0_kref+0x36a8:   	umul	%g0, %g0, %o2
	.word	0x89a108c4	! t0_kref+0x36ac:   	fsubd	%f4, %f4, %f4
	.word	0xd47e601c	! t0_kref+0x36b0:   	swap	[%i1 + 0x1c], %o2
	.word	0xc906001c	! t0_kref+0x36b4:   	ld	[%i0 + %i4], %f4
	.word	0x81a90a44	! t0_kref+0x36b8:   	fcmpd	%fcc0, %f4, %f4
	.word	0xaed80000	! t0_kref+0x36bc:   	smulcc	%g0, %g0, %l7
	.word	0xc920a008	! t0_kref+0x36c0:   	st	%f4, [%g2 + 8]
	.word	0x89b00f04	! t0_kref+0x36c4:   	fsrc2	%f4, %f4
	.word	0x98200000	! t0_kref+0x36c8:   	neg	%g0, %o4
	.word	0xc9a0a01c	! t0_kref+0x36cc:   	sta	%f4, [%g2 + 0x1c]%asi
	.word	0x89b10624	! t0_kref+0x36d0:   	fmul8x16	%f4, %f4, %f4
	.word	0x2c800002	! t0_kref+0x36d4:   	bneg,a	_kref+0x36dc
	.word	0xd0566004	! t0_kref+0x36d8:   	ldsh	[%i1 + 4], %o0
	.word	0xe41e001d	! t0_kref+0x36dc:   	ldd	[%i0 + %i5], %l2
	.word	0xc900a034	! t0_kref+0x36e0:   	ld	[%g2 + 0x34], %f4
	.word	0xc99e3fe8	! t0_kref+0x36e4:   	ldda	[%i0 - 0x18]%asi, %f4
	.word	0x20480005	! t0_kref+0x36e8:   	bn,a,pt	%icc, _kref+0x36fc
	.word	0x9ab80000	! t0_kref+0x36ec:   	xnorcc	%g0, %g0, %o5
	.word	0x97b00160	! t0_kref+0x36f0:   	edge32ln	%g0, %g0, %o3
	.word	0x89a01904	! t0_kref+0x36f4:   	fitod	%f4, %f4
	.word	0x89a108c4	! t0_kref+0x36f8:   	fsubd	%f4, %f4, %f4
	.word	0x81280000	! t0_kref+0x36fc:   	sll	%g0, %g0, %g0
	.word	0xdad0a00e	! t0_kref+0x3700:   	ldsha	[%g2 + 0xe]%asi, %o5
	.word	0x89b106c4	! t0_kref+0x3704:   	fmul8sux16	%f4, %f4, %f4
	.word	0x81a90aa4	! t0_kref+0x3708:   	fcmpes	%fcc0, %f4, %f4
	.word	0x89a01a24	! t0_kref+0x370c:   	fstoi	%f4, %f4
	.word	0x96182e10	! t0_kref+0x3710:   	xor	%g0, 0xe10, %o3
	.word	0x81a90a44	! t0_kref+0x3714:   	fcmpd	%fcc0, %f4, %f4
	.word	0xc9981018	! t0_kref+0x3718:   	ldda	[%g0 + %i0]0x80, %f4
	.word	0x89a01044	! t0_kref+0x371c:   	fdtox	%f4, %f4
	.word	0x89a10944	! t0_kref+0x3720:   	fmuld	%f4, %f4, %f4
	call	SYM(t0_subr1)
	.word	0x89b10ea0	! t0_kref+0x3728:   	fsrc1s	%f4, %f4
	.word	0x89a01924	! t0_kref+0x372c:   	fstod	%f4, %f4
	.word	0x97700000	! t0_kref+0x3730:   	popc	%g0, %o3
	.word	0xae1035d5	! t0_kref+0x3734:   	mov	0xfffff5d5, %l7
	.word	0x92e00000	! t0_kref+0x3738:   	subccc	%g0, %g0, %o1
	.word	0x89a00124	! t0_kref+0x373c:   	fabss	%f4, %f4
	.word	0xd81e401d	! t0_kref+0x3740:   	ldd	[%i1 + %i5], %o4
	.word	0xae403516	! t0_kref+0x3744:   	addc	%g0, -0xaea, %l7
	.word	0x98a80000	! t0_kref+0x3748:   	andncc	%g0, %g0, %o4
	.word	0x95202bfb	! t0_kref+0x374c:   	mulscc	%g0, 0xbfb, %o2
	.word	0x24800008	! t0_kref+0x3750:   	ble,a	_kref+0x3770
	.word	0x981026b8	! t0_kref+0x3754:   	mov	0x6b8, %o4
	.word	0x89b10e64	! t0_kref+0x3758:   	fxnors	%f4, %f4, %f4
	.word	0x923826b9	! t0_kref+0x375c:   	xnor	%g0, 0x6b9, %o1
	.word	0x9fb00200	! t0_kref+0x3760:   	array8	%g0, %g0, %o7
	.word	0x9e9830bd	! t0_kref+0x3764:   	xorcc	%g0, -0xf43, %o7
	.word	0x95b00160	! t0_kref+0x3768:   	edge32ln	%g0, %g0, %o2
	.word	0xc807bfe4	! t0_kref+0x376c:   	ld	[%fp - 0x1c], %g4
	.word	0x89a00524	! t0_kref+0x3770:   	fsqrts	%f4, %f4
	.word	0x89a108c4	! t0_kref+0x3774:   	fsubd	%f4, %f4, %f4
	.word	0x89b10da4	! t0_kref+0x3778:   	fxors	%f4, %f4, %f4
	.word	0xc0a0a014	! t0_kref+0x377c:   	sta	%g0, [%g2 + 0x14]%asi
	.word	0x89a00124	! t0_kref+0x3780:   	fabss	%f4, %f4
	.word	0x81a90a24	! t0_kref+0x3784:   	fcmps	%fcc0, %f4, %f4
	.word	0x9fc10000	! t0_kref+0x3788:   	call	%g4
	.word	0x89a108c4	! t0_kref+0x378c:   	fsubd	%f4, %f4, %f4
	.word	0xe83e3fe0	! t0_kref+0x3790:   	std	%l4, [%i0 - 0x20]
	.word	0xe83f4018	! t0_kref+0x3794:   	std	%l4, [%i5 + %i0]
	.word	0x81b000a0	! t0_kref+0x3798:   	edge16n	%g0, %g0, %g0
	.word	0xd488a028	! t0_kref+0x379c:   	lduba	[%g2 + 0x28]%asi, %o2
	.word	0x3e800003	! t0_kref+0x37a0:   	bvc,a	_kref+0x37ac
	.word	0xe03e6010	! t0_kref+0x37a4:   	std	%l0, [%i1 + 0x10]
	.word	0x89a000a4	! t0_kref+0x37a8:   	fnegs	%f4, %f4
	.word	0xd0000019	! t0_kref+0x37ac:   	ld	[%g0 + %i1], %o0
	.word	0x34480001	! t0_kref+0x37b0:   	bg,a,pt	%icc, _kref+0x37b4
	.word	0x89b10fa4	! t0_kref+0x37b4:   	fors	%f4, %f4, %f4
	.word	0x9de3bfa0	! t0_kref+0x37b8:   	save	%sp, -0x60, %sp
	.word	0x81ee28b1	! t0_kref+0x37bc:   	restore	%i0, 0x8b1, %g0
	.word	0xc920a008	! t0_kref+0x37c0:   	st	%f4, [%g2 + 8]
	.word	0xd4de2000	! t0_kref+0x37c4:   	ldxa	[%i0]%asi, %o2
	.word	0x3e800008	! t0_kref+0x37c8:   	bvc,a	_kref+0x37e8
	.word	0xc0a8a03b	! t0_kref+0x37cc:   	stba	%g0, [%g2 + 0x3b]%asi
	.word	0x9ab00000	! t0_kref+0x37d0:   	orncc	%g0, %g0, %o5
	.word	0xde96601e	! t0_kref+0x37d4:   	lduha	[%i1 + 0x1e]%asi, %o7
	.word	0x89a10924	! t0_kref+0x37d8:   	fmuls	%f4, %f4, %f4
	.word	0x98600000	! t0_kref+0x37dc:   	subc	%g0, %g0, %o4
	.word	0x9ac00000	! t0_kref+0x37e0:   	addccc	%g0, %g0, %o5
	.word	0xae000000	! t0_kref+0x37e4:   	add	%g0, %g0, %l7
	.word	0x89a108a4	! t0_kref+0x37e8:   	fsubs	%f4, %f4, %f4
	.word	0x89a108c4	! t0_kref+0x37ec:   	fsubd	%f4, %f4, %f4
	.word	0x89a108a4	! t0_kref+0x37f0:   	fsubs	%f4, %f4, %f4
	.word	0xd25e001d	! t0_kref+0x37f4:   	ldx	[%i0 + %i5], %o1
	.word	0xc91fbc58	! t0_kref+0x37f8:   	ldd	[%fp - 0x3a8], %f4
	.word	0x95b10504	! t0_kref+0x37fc:   	fcmpgt16	%f4, %f4, %o2
	.word	0x89b10e80	! t0_kref+0x3800:   	fsrc1	%f4, %f4
	.word	0xc020a03c	! t0_kref+0x3804:   	clr	[%g2 + 0x3c]
	.word	0x89b00764	! t0_kref+0x3808:   	fpack16	%f4, %f4
	.word	0xd64e7fe9	! t0_kref+0x380c:   	ldsb	[%i1 - 0x17], %o3
	.word	0xaee00000	! t0_kref+0x3810:   	subccc	%g0, %g0, %l7
	.word	0xd2563ff4	! t0_kref+0x3814:   	ldsh	[%i0 - 0xc], %o1
	.word	0x89a108c4	! t0_kref+0x3818:   	fsubd	%f4, %f4, %f4
	.word	0x99b00160	! t0_kref+0x381c:   	edge32ln	%g0, %g0, %o4
	.word	0x89b10a24	! t0_kref+0x3820:   	fpadd16s	%f4, %f4, %f4
	.word	0x98f80000	! t0_kref+0x3824:   	sdivcc	%g0, %g0, %o4
	.word	0x28480006	! t0_kref+0x3828:   	bleu,a,pt	%icc, _kref+0x3840
	.word	0x89a108a4	! t0_kref+0x382c:   	fsubs	%f4, %f4, %f4
	.word	0x80a80000	! t0_kref+0x3830:   	andncc	%g0, %g0, %g0
	.word	0x20800006	! t0_kref+0x3834:   	bn,a	_kref+0x384c
	.word	0xc030a014	! t0_kref+0x3838:   	clrh	[%g2 + 0x14]
	.word	0x89a00544	! t0_kref+0x383c:   	fsqrtd	%f4, %f4
	.word	0x89a00124	! t0_kref+0x3840:   	fabss	%f4, %f4
	.word	0x89a01904	! t0_kref+0x3844:   	fitod	%f4, %f4
	.word	0x89a10844	! t0_kref+0x3848:   	faddd	%f4, %f4, %f4
	.word	0x89a10824	! t0_kref+0x384c:   	fadds	%f4, %f4, %f4
	.word	0x99200000	! t0_kref+0x3850:   	mulscc	%g0, %g0, %o4
	.word	0x81a90a24	! t0_kref+0x3854:   	fcmps	%fcc0, %f4, %f4
	call	SYM(t0_subr2)
	.word	0xedf61000	! t0_kref+0x385c:   	casxa	[%i0]0x80, %g0, %l6
	.word	0xd810a00a	! t0_kref+0x3860:   	lduh	[%g2 + 0xa], %o4
	.word	0x86102004	! t0_kref+0x3864:   	mov	0x4, %g3
	.word	0x86a0e001	! t0_kref+0x3868:   	subcc	%g3, 1, %g3
	.word	0x22800012	! t0_kref+0x386c:   	be,a	_kref+0x38b4
	.word	0x89b10f64	! t0_kref+0x3870:   	fornot1s	%f4, %f4, %f4
	.word	0x89a108a4	! t0_kref+0x3874:   	fsubs	%f4, %f4, %f4
	.word	0x93300000	! t0_kref+0x3878:   	srl	%g0, %g0, %o1
	.word	0x89a01a44	! t0_kref+0x387c:   	fdtoi	%f4, %f4
	.word	0x2a800003	! t0_kref+0x3880:   	bcs,a	_kref+0x388c
	.word	0x90802244	! t0_kref+0x3884:   	addcc	%g0, 0x244, %o0
	.word	0x89a109c4	! t0_kref+0x3888:   	fdivd	%f4, %f4, %f4
	.word	0xe49e501d	! t0_kref+0x388c:   	ldda	[%i1 + %i5]0x80, %l2
	.word	0x91b10404	! t0_kref+0x3890:   	fcmple16	%f4, %f4, %o0
	.word	0xea6e4000	! t0_kref+0x3894:   	ldstub	[%i1], %l5
	.word	0xd080a03c	! t0_kref+0x3898:   	lda	[%g2 + 0x3c]%asi, %o0
	.word	0xc030a00a	! t0_kref+0x389c:   	clrh	[%g2 + 0xa]
	.word	0x89b00c20	! t0_kref+0x38a0:   	fzeros	%f4
	.word	0xea7e6004	! t0_kref+0x38a4:   	swap	[%i1 + 4], %l5
	.word	0x97b00140	! t0_kref+0x38a8:   	edge32l	%g0, %g0, %o3
	.word	0x89b10a04	! t0_kref+0x38ac:   	fpadd16	%f4, %f4, %f4
	.word	0x97b00120	! t0_kref+0x38b0:   	edge32n	%g0, %g0, %o3
	.word	0xc0b0a014	! t0_kref+0x38b4:   	stha	%g0, [%g2 + 0x14]%asi
	.word	0x83414000	! t0_kref+0x38b8:   	mov	%pc, %g1
	.word	0x89a01904	! t0_kref+0x38bc:   	fitod	%f4, %f4
	.word	0x89a108c4	! t0_kref+0x38c0:   	fsubd	%f4, %f4, %f4
	.word	0xc026201c	! t0_kref+0x38c4:   	clr	[%i0 + 0x1c]
	.word	0xd888a00e	! t0_kref+0x38c8:   	lduba	[%g2 + 0xe]%asi, %o4
	.word	0xee0e4000	! t0_kref+0x38cc:   	ldub	[%i1], %l7
	.word	0xc028a03b	! t0_kref+0x38d0:   	clrb	[%g2 + 0x3b]
	.word	0xc028a017	! t0_kref+0x38d4:   	clrb	[%g2 + 0x17]
	.word	0x96a80000	! t0_kref+0x38d8:   	andncc	%g0, %g0, %o3
	.word	0x8d80319d	! t0_kref+0x38dc:   	mov	0xfffff19d, %fprs
	.word	0x93400000	! t0_kref+0x38e0:   	mov	%y, %o1
	.word	0xc0b0a014	! t0_kref+0x38e4:   	stha	%g0, [%g2 + 0x14]%asi
	.word	0xd65e7ff8	! t0_kref+0x38e8:   	ldx	[%i1 - 8], %o3
	.word	0x89a10944	! t0_kref+0x38ec:   	fmuld	%f4, %f4, %f4
	.word	0x81a90a24	! t0_kref+0x38f0:   	fcmps	%fcc0, %f4, %f4
	call	SYM(t0_subr1)
	.word	0x89a00124	! t0_kref+0x38f8:   	fabss	%f4, %f4
	.word	0x89b106e4	! t0_kref+0x38fc:   	fmul8ulx16	%f4, %f4, %f4
	.word	0x90b0399d	! t0_kref+0x3900:   	orncc	%g0, -0x663, %o0
	.word	0xaef80000	! t0_kref+0x3904:   	sdivcc	%g0, %g0, %l7
	.word	0xae180000	! t0_kref+0x3908:   	xor	%g0, %g0, %l7
	.word	0x99200000	! t0_kref+0x390c:   	mulscc	%g0, %g0, %o4
	.word	0xda0e7fee	! t0_kref+0x3910:   	ldub	[%i1 - 0x12], %o5
	.word	0x9a580000	! t0_kref+0x3914:   	smul	%g0, %g0, %o5
	.word	0x96000000	! t0_kref+0x3918:   	add	%g0, %g0, %o3
	.word	0x89a00524	! t0_kref+0x391c:   	fsqrts	%f4, %f4
	.word	0x92700000	! t0_kref+0x3920:   	udiv	%g0, %g0, %o1
	.word	0x89b10d24	! t0_kref+0x3924:   	fandnot1s	%f4, %f4, %f4
	.word	0xee567ff4	! t0_kref+0x3928:   	ldsh	[%i1 - 0xc], %l7
	.word	0xc0a0a004	! t0_kref+0x392c:   	sta	%g0, [%g2 + 4]%asi
	.word	0x89b10704	! t0_kref+0x3930:   	fmuld8sux16	%f4, %f4, %f4
	.word	0xec1e2010	! t0_kref+0x3934:   	ldd	[%i0 + 0x10], %l6
	.word	0x89a000a4	! t0_kref+0x3938:   	fnegs	%f4, %f4
	.word	0x34800007	! t0_kref+0x393c:   	bg,a	_kref+0x3958
	.word	0x89b106a4	! t0_kref+0x3940:   	fmul8x16al	%f4, %f4, %f4
	.word	0xc980a038	! t0_kref+0x3944:   	lda	[%g2 + 0x38]%asi, %f4
	.word	0xe83e0000	! t0_kref+0x3948:   	std	%l4, [%i0]
	.word	0x3c800006	! t0_kref+0x394c:   	bpos,a	_kref+0x3964
	.word	0x89a00544	! t0_kref+0x3950:   	fsqrtd	%f4, %f4
	.word	0x81a90a44	! t0_kref+0x3954:   	fcmpd	%fcc0, %f4, %f4
	.word	0x81400000	! t0_kref+0x3958:   	mov	%y, %g0
	.word	0xc99e7ff0	! t0_kref+0x395c:   	ldda	[%i1 - 0x10]%asi, %f4
	.word	0xd8ce1000	! t0_kref+0x3960:   	ldsba	[%i0]0x80, %o4
	.word	0xae600000	! t0_kref+0x3964:   	subc	%g0, %g0, %l7
	.word	0xc0a0a034	! t0_kref+0x3968:   	sta	%g0, [%g2 + 0x34]%asi
	.word	0x9680393b	! t0_kref+0x396c:   	addcc	%g0, -0x6c5, %o3
	.word	0xae180000	! t0_kref+0x3970:   	xor	%g0, %g0, %l7
	.word	0x81a90a24	! t0_kref+0x3974:   	fcmps	%fcc0, %f4, %f4
	.word	0x90a80000	! t0_kref+0x3978:   	andncc	%g0, %g0, %o0
	.word	0x89a10824	! t0_kref+0x397c:   	fadds	%f4, %f4, %f4
	.word	0x89a01904	! t0_kref+0x3980:   	fitod	%f4, %f4
	.word	0x89b10d24	! t0_kref+0x3984:   	fandnot1s	%f4, %f4, %f4
	.word	0x95280000	! t0_kref+0x3988:   	sll	%g0, %g0, %o2
	.word	0x805030a4	! t0_kref+0x398c:   	umul	%g0, -0xf5c, %g0
	.word	0x89a10824	! t0_kref+0x3990:   	fadds	%f4, %f4, %f4
	.word	0x89b10c44	! t0_kref+0x3994:   	fnor	%f4, %f4, %f4
	.word	0x98a836e9	! t0_kref+0x3998:   	andncc	%g0, -0x917, %o4
	.word	0x81a90ac4	! t0_kref+0x399c:   	fcmped	%fcc0, %f4, %f4
	.word	0x89a01924	! t0_kref+0x39a0:   	fstod	%f4, %f4
	.word	0x9b400000	! t0_kref+0x39a4:   	mov	%y, %o5
	.word	0xd01e7ff8	! t0_kref+0x39a8:   	ldd	[%i1 - 8], %o0
	.word	0x87802082	! t0_kref+0x39ac:   	mov	0x82, %asi
	.word	0x89a108c4	! t0_kref+0x39b0:   	fsubd	%f4, %f4, %f4
	.word	0x89b10e24	! t0_kref+0x39b4:   	fands	%f4, %f4, %f4
	.word	0xaf28201d	! t0_kref+0x39b8:   	sll	%g0, 0x1d, %l7
	.word	0x89b10e24	! t0_kref+0x39bc:   	fands	%f4, %f4, %f4
	.word	0x95b10584	! t0_kref+0x39c0:   	fcmpgt32	%f4, %f4, %o2
	.word	0x81b000c0	! t0_kref+0x39c4:   	edge16l	%g0, %g0, %g0
	.word	0x90f03c12	! t0_kref+0x39c8:   	udivcc	%g0, -0x3ee, %o0
	.word	0x89a108a4	! t0_kref+0x39cc:   	fsubs	%f4, %f4, %f4
	.word	0x86102008	! t0_kref+0x39d0:   	mov	0x8, %g3
	.word	0x86a0e001	! t0_kref+0x39d4:   	subcc	%g3, 1, %g3
	.word	0x22800006	! t0_kref+0x39d8:   	be,a	_kref+0x39f0
	.word	0xd43f4019	! t0_kref+0x39dc:   	std	%o2, [%i5 + %i1]
	.word	0xc9be1840	! t0_kref+0x39e0:   	stda	%f4, [%i0]0xc2
	.word	0x81df699c	! t0_kref+0x39e4:   	flush	%i5 + 0x99c
	.word	0x89b10e24	! t0_kref+0x39e8:   	fands	%f4, %f4, %f4
	.word	0xc030a02a	! t0_kref+0x39ec:   	clrh	[%g2 + 0x2a]
	.word	0xc920a02c	! t0_kref+0x39f0:   	st	%f4, [%g2 + 0x2c]
	.word	0x89b10724	! t0_kref+0x39f4:   	fmuld8ulx16	%f4, %f4, %f4
	.word	0x89a01924	! t0_kref+0x39f8:   	fstod	%f4, %f4
	.word	0x986022f1	! t0_kref+0x39fc:   	subc	%g0, 0x2f1, %o4
	.word	0x81a90a24	! t0_kref+0x3a00:   	fcmps	%fcc0, %f4, %f4
	.word	0x9a182105	! t0_kref+0x3a04:   	xor	%g0, 0x105, %o5
	.word	0xc920a020	! t0_kref+0x3a08:   	st	%f4, [%g2 + 0x20]
	.word	0xae000000	! t0_kref+0x3a0c:   	add	%g0, %g0, %l7
	.word	0x89a00024	! t0_kref+0x3a10:   	fmovs	%f4, %f4
	.word	0x89a108a4	! t0_kref+0x3a14:   	fsubs	%f4, %f4, %f4
	.word	0x89a00524	! t0_kref+0x3a18:   	fsqrts	%f4, %f4
	.word	0x89a01904	! t0_kref+0x3a1c:   	fitod	%f4, %f4
	.word	0x36480004	! t0_kref+0x3a20:   	bge,a,pt	%icc, _kref+0x3a30
	.word	0x92a83df4	! t0_kref+0x3a24:   	andncc	%g0, -0x20c, %o1
	.word	0x96a80000	! t0_kref+0x3a28:   	andncc	%g0, %g0, %o3
	.word	0x81a90aa4	! t0_kref+0x3a2c:   	fcmpes	%fcc0, %f4, %f4
	.word	0x89a10824	! t0_kref+0x3a30:   	fadds	%f4, %f4, %f4
	.word	0x96982680	! t0_kref+0x3a34:   	xorcc	%g0, 0x680, %o3
	.word	0xd408a019	! t0_kref+0x3a38:   	ldub	[%g2 + 0x19], %o2
	.word	0x89a01044	! t0_kref+0x3a3c:   	fdtox	%f4, %f4
	.word	0x89b10744	! t0_kref+0x3a40:   	fpack32	%f4, %f4, %f4
	.word	0x89b10a04	! t0_kref+0x3a44:   	fpadd16	%f4, %f4, %f4
	.word	0x89a10824	! t0_kref+0x3a48:   	fadds	%f4, %f4, %f4
	.word	0x2f35cf7e	! t0_kref+0x3a4c:   	sethi	%hi(0xd73df800), %l7
	.word	0x997024ad	! t0_kref+0x3a50:   	popc	0x4ad, %o4
	.word	0x89a10844	! t0_kref+0x3a54:   	faddd	%f4, %f4, %f4
	.word	0x81d87d8c	! t0_kref+0x3a58:   	flush	%g1 - 0x274
	.word	0x89a00544	! t0_kref+0x3a5c:   	fsqrtd	%f4, %f4
	.word	0x81a90a44	! t0_kref+0x3a60:   	fcmpd	%fcc0, %f4, %f4
	.word	0x89a00124	! t0_kref+0x3a64:   	fabss	%f4, %f4
	.word	0x9e800000	! t0_kref+0x3a68:   	addcc	%g0, %g0, %o7
	.word	0x96400000	! t0_kref+0x3a6c:   	addc	%g0, %g0, %o3
	.word	0x99b00160	! t0_kref+0x3a70:   	edge32ln	%g0, %g0, %o4
	.word	0xaec0322f	! t0_kref+0x3a74:   	addccc	%g0, -0xdd1, %l7
	.word	0xc020a020	! t0_kref+0x3a78:   	clr	[%g2 + 0x20]
	.word	0x3e800001	! t0_kref+0x3a7c:   	bvc,a	_kref+0x3a80
	.word	0x9e8021e2	! t0_kref+0x3a80:   	addcc	%g0, 0x1e2, %o7
	.word	0x81a90a44	! t0_kref+0x3a84:   	fcmpd	%fcc0, %f4, %f4
	.word	0x89a10924	! t0_kref+0x3a88:   	fmuls	%f4, %f4, %f4
	.word	0x89b10704	! t0_kref+0x3a8c:   	fmuld8sux16	%f4, %f4, %f4
	.word	0x911024e3	! t0_kref+0x3a90:   	taddcctv	%g0, 0x4e3, %o0
	.word	0x90700000	! t0_kref+0x3a94:   	udiv	%g0, %g0, %o0
	call	SYM(t0_subr3)
	.word	0x909037c3	! t0_kref+0x3a9c:   	orcc	%g0, -0x83d, %o0
	.word	0x89a018c4	! t0_kref+0x3aa0:   	fdtos	%f4, %f4
	.word	0xc900a028	! t0_kref+0x3aa4:   	ld	[%g2 + 0x28], %f4
	.word	0x3c800001	! t0_kref+0x3aa8:   	bpos,a	_kref+0x3aac
	.word	0xc91fbf48	! t0_kref+0x3aac:   	ldd	[%fp - 0xb8], %f4
	.word	0xaea836a6	! t0_kref+0x3ab0:   	andncc	%g0, -0x95a, %l7
	.word	0xc020a038	! t0_kref+0x3ab4:   	clr	[%g2 + 0x38]
	.word	0xd856401b	! t0_kref+0x3ab8:   	ldsh	[%i1 + %i3], %o4
	.word	0x94f80000	! t0_kref+0x3abc:   	sdivcc	%g0, %g0, %o2
	.word	0x81a90a24	! t0_kref+0x3ac0:   	fcmps	%fcc0, %f4, %f4
	.word	0x89b10ea0	! t0_kref+0x3ac4:   	fsrc1s	%f4, %f4
	.word	0x86102003	! t0_kref+0x3ac8:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x3acc:   	bne,a	_kref+0x3acc
	.word	0x86a0e001	! t0_kref+0x3ad0:   	subcc	%g3, 1, %g3
	.word	0x9a603a7f	! t0_kref+0x3ad4:   	subc	%g0, -0x581, %o5
	.word	0x89b10ae4	! t0_kref+0x3ad8:   	fpsub32s	%f4, %f4, %f4
	.word	0xc026001c	! t0_kref+0x3adc:   	clr	[%i0 + %i4]
	.word	0x89a108c4	! t0_kref+0x3ae0:   	fsubd	%f4, %f4, %f4
	.word	0x9b100000	! t0_kref+0x3ae4:   	taddcctv	%g0, %g0, %o5
	.word	0xd800a010	! t0_kref+0x3ae8:   	ld	[%g2 + 0x10], %o4
	.word	0x89a109c4	! t0_kref+0x3aec:   	fdivd	%f4, %f4, %f4
	.word	0x81b00100	! t0_kref+0x3af0:   	edge32	%g0, %g0, %g0
	.word	0x9bb10544	! t0_kref+0x3af4:   	fcmpeq16	%f4, %f4, %o5
	.word	0xc02e200a	! t0_kref+0x3af8:   	clrb	[%i0 + 0xa]
	.word	0x9aa830a9	! t0_kref+0x3afc:   	andncc	%g0, -0xf57, %o5
	.word	0x89a018c4	! t0_kref+0x3b00:   	fdtos	%f4, %f4
	.word	0x81a90a24	! t0_kref+0x3b04:   	fcmps	%fcc0, %f4, %f4
	.word	0x9bb000a0	! t0_kref+0x3b08:   	edge16n	%g0, %g0, %o5
	.word	0x9de3bfa0	! t0_kref+0x3b0c:   	save	%sp, -0x60, %sp
	.word	0x81ee2012	! t0_kref+0x3b10:   	restore	%i0, 0x12, %g0
	.word	0xeb68a081	! t0_kref+0x3b14:   	prefetch	%g2 + 0x81, 21
	.word	0x89a10844	! t0_kref+0x3b18:   	faddd	%f4, %f4, %f4
	.word	0xd650a038	! t0_kref+0x3b1c:   	ldsh	[%g2 + 0x38], %o3
	.word	0x80f80000	! t0_kref+0x3b20:   	sdivcc	%g0, %g0, %g0
	.word	0x89b107c4	! t0_kref+0x3b24:   	pdist	%f4, %f4, %f4
	.word	0x94100000	! t0_kref+0x3b28:   	clr	%o2
	.word	0xc0264000	! t0_kref+0x3b2c:   	clr	[%i1]
	.word	0x89a00524	! t0_kref+0x3b30:   	fsqrts	%f4, %f4
	.word	0xc030a004	! t0_kref+0x3b34:   	clrh	[%g2 + 4]
	.word	0x9fc10000	! t0_kref+0x3b38:   	call	%g4
	.word	0xc000a034	! t0_kref+0x3b3c:   	ld	[%g2 + 0x34], %g0
	.word	0x9bb10504	! t0_kref+0x3b40:   	fcmpgt16	%f4, %f4, %o5
	.word	0x89a01904	! t0_kref+0x3b44:   	fitod	%f4, %f4
	.word	0x89a10824	! t0_kref+0x3b48:   	fadds	%f4, %f4, %f4
	.word	0x89a00124	! t0_kref+0x3b4c:   	fabss	%f4, %f4
	.word	0x98700000	! t0_kref+0x3b50:   	udiv	%g0, %g0, %o4
	.word	0x9aa80000	! t0_kref+0x3b54:   	andncc	%g0, %g0, %o5
	.word	0x89a01a24	! t0_kref+0x3b58:   	fstoi	%f4, %f4
	.word	0xe01e4000	! t0_kref+0x3b5c:   	ldd	[%i1], %l0
	.word	0x89a108a4	! t0_kref+0x3b60:   	fsubs	%f4, %f4, %f4
	.word	0x9ef80000	! t0_kref+0x3b64:   	sdivcc	%g0, %g0, %o7
	.word	0x9ef80000	! t0_kref+0x3b68:   	sdivcc	%g0, %g0, %o7
	.word	0x89b00764	! t0_kref+0x3b6c:   	fpack16	%f4, %f4
	.word	0xee070019	! t0_kref+0x3b70:   	ld	[%i4 + %i1], %l7
	.word	0xc02e8019	! t0_kref+0x3b74:   	clrb	[%i2 + %i1]
	.word	0x9a802a07	! t0_kref+0x3b78:   	addcc	%g0, 0xa07, %o5
	.word	0xc020a010	! t0_kref+0x3b7c:   	clr	[%g2 + 0x10]
	.word	0x81a90a44	! t0_kref+0x3b80:   	fcmpd	%fcc0, %f4, %f4
	.word	0x2c800007	! t0_kref+0x3b84:   	bneg,a	_kref+0x3ba0
	.word	0xf007bfe0	! t0_kref+0x3b88:   	ld	[%fp - 0x20], %i0
	.word	0x89a10824	! t0_kref+0x3b8c:   	fadds	%f4, %f4, %f4
	.word	0xc91fbe30	! t0_kref+0x3b90:   	ldd	[%fp - 0x1d0], %f4
	.word	0xc028a037	! t0_kref+0x3b94:   	clrb	[%g2 + 0x37]
	.word	0x89b10ac4	! t0_kref+0x3b98:   	fpsub32	%f4, %f4, %f4
	.word	0x9fb000e0	! t0_kref+0x3b9c:   	edge16ln	%g0, %g0, %o7
	.word	0xd41026c4	! t0_kref+0x3ba0:   	lduh	[%g0 + 0x6c4], %o2
	.word	0x89a109a4	! t0_kref+0x3ba4:   	fdivs	%f4, %f4, %f4
	.word	0x89abc044	! t0_kref+0x3ba8:   	fmovdo	%fcc0, %f4, %f4
	.word	0x89a108c4	! t0_kref+0x3bac:   	fsubd	%f4, %f4, %f4
	.word	0x86102001	! t0_kref+0x3bb0:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x3bb4:   	bne,a	_kref+0x3bb4
	.word	0x86a0e001	! t0_kref+0x3bb8:   	subcc	%g3, 1, %g3
	.word	0xc008a03f	! t0_kref+0x3bbc:   	ldub	[%g2 + 0x3f], %g0
	.word	0xc020a01c	! t0_kref+0x3bc0:   	clr	[%g2 + 0x1c]
	.word	0x96e0303b	! t0_kref+0x3bc4:   	subccc	%g0, -0xfc5, %o3
	.word	0x81a90a24	! t0_kref+0x3bc8:   	fcmps	%fcc0, %f4, %f4
	.word	0x9e5035ac	! t0_kref+0x3bcc:   	umul	%g0, -0xa54, %o7
	.word	0x89a108c4	! t0_kref+0x3bd0:   	fsubd	%f4, %f4, %f4
	.word	0x9840256e	! t0_kref+0x3bd4:   	addc	%g0, 0x56e, %o4
	.word	0xd248a039	! t0_kref+0x3bd8:   	ldsb	[%g2 + 0x39], %o1
	.word	0x81a90a24	! t0_kref+0x3bdc:   	fcmps	%fcc0, %f4, %f4
	.word	0xd656001b	! t0_kref+0x3be0:   	ldsh	[%i0 + %i3], %o3
	.word	0x99400000	! t0_kref+0x3be4:   	mov	%y, %o4
	.word	0xc91fbca8	! t0_kref+0x3be8:   	ldd	[%fp - 0x358], %f4
	.word	0x89a10844	! t0_kref+0x3bec:   	faddd	%f4, %f4, %f4
	.word	0x89b00f04	! t0_kref+0x3bf0:   	fsrc2	%f4, %f4
	.word	0x94180000	! t0_kref+0x3bf4:   	xor	%g0, %g0, %o2
	.word	0xc807bff0	! t0_kref+0x3bf8:   	ld	[%fp - 0x10], %g4
	.word	0xec68a03b	! t0_kref+0x3bfc:   	ldstub	[%g2 + 0x3b], %l6
	.word	0xc920a01c	! t0_kref+0x3c00:   	st	%f4, [%g2 + 0x1c]
	.word	0x89a10824	! t0_kref+0x3c04:   	fadds	%f4, %f4, %f4
	.word	0x97b00200	! t0_kref+0x3c08:   	array8	%g0, %g0, %o3
	.word	0xd408a02e	! t0_kref+0x3c0c:   	ldub	[%g2 + 0x2e], %o2
	.word	0x8143c000	! t0_kref+0x3c10:   	stbar
	.word	0xd221401c	! t0_kref+0x3c14:   	st	%o1, [%g5 + %i4]
	.word	0xc9be101d	! t0_kref+0x3c18:   	stda	%f4, [%i0 + %i5]0x80
	.word	0x89a10824	! t0_kref+0x3c1c:   	fadds	%f4, %f4, %f4
	.word	0x81da4019	! t0_kref+0x3c20:   	flush	%o1 + %i1
	.word	0x89b106c4	! t0_kref+0x3c24:   	fmul8sux16	%f4, %f4, %f4
	.word	0x93b00060	! t0_kref+0x3c28:   	edge8ln	%g0, %g0, %o1
	.word	0x81a90aa4	! t0_kref+0x3c2c:   	fcmpes	%fcc0, %f4, %f4
	.word	0xed68a000	! t0_kref+0x3c30:   	prefetch	%g2, 22
	.word	0x89b10724	! t0_kref+0x3c34:   	fmuld8ulx16	%f4, %f4, %f4
	.word	0x89a10844	! t0_kref+0x3c38:   	faddd	%f4, %f4, %f4
	.word	0x89b10ca4	! t0_kref+0x3c3c:   	fandnot2s	%f4, %f4, %f4
	.word	0x9fc00004	! t0_kref+0x3c40:   	call	%g0 + %g4
	.word	0x94003cb9	! t0_kref+0x3c44:   	add	%g0, -0x347, %o2
	.word	0x93300000	! t0_kref+0x3c48:   	srl	%g0, %g0, %o1
	.word	0x89a01904	! t0_kref+0x3c4c:   	fitod	%f4, %f4
	.word	0x9e403b4e	! t0_kref+0x3c50:   	addc	%g0, -0x4b2, %o7
	.word	0x89a10824	! t0_kref+0x3c54:   	fadds	%f4, %f4, %f4
	.word	0x8143e055	! t0_kref+0x3c58:   	membar	0x55
	.word	0x36800002	! t0_kref+0x3c5c:   	bge,a	_kref+0x3c64
	.word	0xc0ae9018	! t0_kref+0x3c60:   	stba	%g0, [%i2 + %i0]0x80
	.word	0x89a000a4	! t0_kref+0x3c64:   	fnegs	%f4, %f4
	.word	0xaeb0213b	! t0_kref+0x3c68:   	orncc	%g0, 0x13b, %l7
	.word	0x89a108c4	! t0_kref+0x3c6c:   	fsubd	%f4, %f4, %f4
	.word	0xc02e6013	! t0_kref+0x3c70:   	clrb	[%i1 + 0x13]
	.word	0x98100000	! t0_kref+0x3c74:   	clr	%o4
	.word	0x2e800004	! t0_kref+0x3c78:   	bvs,a	_kref+0x3c88
	.word	0xc008a00e	! t0_kref+0x3c7c:   	ldub	[%g2 + 0xe], %g0
	.word	0x96202f41	! t0_kref+0x3c80:   	sub	%g0, 0xf41, %o3
	.word	0x89a108c4	! t0_kref+0x3c84:   	fsubd	%f4, %f4, %f4
	.word	0x8143c000	! t0_kref+0x3c88:   	stbar
	.word	0x89b10c44	! t0_kref+0x3c8c:   	fnor	%f4, %f4, %f4
	.word	0x3a480006	! t0_kref+0x3c90:   	bcc,a,pt	%icc, _kref+0x3ca8
	.word	0xf007bfe0	! t0_kref+0x3c94:   	ld	[%fp - 0x20], %i0
	.word	0x89a01a44	! t0_kref+0x3c98:   	fdtoi	%f4, %f4
	.word	0xc028a031	! t0_kref+0x3c9c:   	clrb	[%g2 + 0x31]
	.word	0x89b00fe0	! t0_kref+0x3ca0:   	fones	%f4
	.word	0x3c480003	! t0_kref+0x3ca4:   	bpos,a,pt	%icc, _kref+0x3cb0
	.word	0xc4383fb8	! t0_kref+0x3ca8:   	std	%g2, [%g0 - 0x48]
	.word	0x9fc00004	! t0_kref+0x3cac:   	call	%g0 + %g4
	.word	0xc91fbc80	! t0_kref+0x3cb0:   	ldd	[%fp - 0x380], %f4
	.word	0x89a01a24	! t0_kref+0x3cb4:   	fstoi	%f4, %f4
	.word	0x93300000	! t0_kref+0x3cb8:   	srl	%g0, %g0, %o1
	.word	0x89a109c4	! t0_kref+0x3cbc:   	fdivd	%f4, %f4, %f4
	.word	0x952025eb	! t0_kref+0x3cc0:   	mulscc	%g0, 0x5eb, %o2
	.word	0x9de3bfa0	! t0_kref+0x3cc4:   	save	%sp, -0x60, %sp
	.word	0x9be83b69	! t0_kref+0x3cc8:   	restore	%g0, -0x497, %o5
	.word	0x89a00524	! t0_kref+0x3ccc:   	fsqrts	%f4, %f4
	.word	0x89b10e80	! t0_kref+0x3cd0:   	fsrc1	%f4, %f4
	.word	0x94700000	! t0_kref+0x3cd4:   	udiv	%g0, %g0, %o2
	.word	0xd4067fe0	! t0_kref+0x3cd8:   	ld	[%i1 - 0x20], %o2
	.word	0x90200000	! t0_kref+0x3cdc:   	neg	%g0, %o0
	.word	0xd200a034	! t0_kref+0x3ce0:   	ld	[%g2 + 0x34], %o1
	.word	0x24480003	! t0_kref+0x3ce4:   	ble,a,pt	%icc, _kref+0x3cf0
	.word	0x9ee03df2	! t0_kref+0x3ce8:   	subccc	%g0, -0x20e, %o7
	.word	0xc048a019	! t0_kref+0x3cec:   	ldsb	[%g2 + 0x19], %g0
	.word	0x89b009a4	! t0_kref+0x3cf0:   	fexpand	%f4, %f4
	.word	0xd0580019	! t0_kref+0x3cf4:   	ldx	[%g0 + %i1], %o0
	.word	0x96a80000	! t0_kref+0x3cf8:   	andncc	%g0, %g0, %o3
	.word	0xc028a030	! t0_kref+0x3cfc:   	clrb	[%g2 + 0x30]
	.word	0x96b00000	! t0_kref+0x3d00:   	orncc	%g0, %g0, %o3
	.word	0x99400000	! t0_kref+0x3d04:   	mov	%y, %o4
	.word	0x940027ee	! t0_kref+0x3d08:   	add	%g0, 0x7ee, %o2
	.word	0xc900a008	! t0_kref+0x3d0c:   	ld	[%g2 + 8], %f4
	.word	0x9a182687	! t0_kref+0x3d10:   	xor	%g0, 0x687, %o5
	.word	0x89a10844	! t0_kref+0x3d14:   	faddd	%f4, %f4, %f4
	.word	0x96d80000	! t0_kref+0x3d18:   	smulcc	%g0, %g0, %o3
	.word	0x94802951	! t0_kref+0x3d1c:   	addcc	%g0, 0x951, %o2
	.word	0xc900a01c	! t0_kref+0x3d20:   	ld	[%g2 + 0x1c], %f4
	.word	0xc028a03f	! t0_kref+0x3d24:   	clrb	[%g2 + 0x3f]
	.word	0x97400000	! t0_kref+0x3d28:   	mov	%y, %o3
	.word	0xd248a01b	! t0_kref+0x3d2c:   	ldsb	[%g2 + 0x1b], %o1
	.word	0x89a00524	! t0_kref+0x3d30:   	fsqrts	%f4, %f4
	.word	0x3e480008	! t0_kref+0x3d34:   	bvc,a,pt	%icc, _kref+0x3d54
	.word	0x9ef80000	! t0_kref+0x3d38:   	sdivcc	%g0, %g0, %o7
	.word	0x89a00044	! t0_kref+0x3d3c:   	fmovd	%f4, %f4
	.word	0x81a90a44	! t0_kref+0x3d40:   	fcmpd	%fcc0, %f4, %f4
	.word	0x81a90ac4	! t0_kref+0x3d44:   	fcmped	%fcc0, %f4, %f4
	.word	0x3e800002	! t0_kref+0x3d48:   	bvc,a	_kref+0x3d50
	.word	0xd840a00c	! t0_kref+0x3d4c:   	ldsw	[%g2 + 0xc], %o4
	.word	0x89a00524	! t0_kref+0x3d50:   	fsqrts	%f4, %f4
	.word	0x89a00124	! t0_kref+0x3d54:   	fabss	%f4, %f4
	.word	0x2e800004	! t0_kref+0x3d58:   	bvs,a	_kref+0x3d68
	.word	0x89a00524	! t0_kref+0x3d5c:   	fsqrts	%f4, %f4
	.word	0x89a00524	! t0_kref+0x3d60:   	fsqrts	%f4, %f4
	.word	0xc028a019	! t0_kref+0x3d64:   	clrb	[%g2 + 0x19]
	call	SYM(t0_subr0)
	.word	0x8143c000	! t0_kref+0x3d6c:   	stbar
	.word	0x89b10a04	! t0_kref+0x3d70:   	fpadd16	%f4, %f4, %f4
	.word	0x944021a1	! t0_kref+0x3d74:   	addc	%g0, 0x1a1, %o2
	.word	0xc9be5a5b	! t0_kref+0x3d78:   	stda	%f4, [%i1 + %i3]0xd2
	.word	0xc9270018	! t0_kref+0x3d7c:   	st	%f4, [%i4 + %i0]
	.word	0x81dde0c1	! t0_kref+0x3d80:   	flush	%l7 + 0xc1
	.word	0xc91fbc40	! t0_kref+0x3d84:   	ldd	[%fp - 0x3c0], %f4
	.word	0xc91e3fe0	! t0_kref+0x3d88:   	ldd	[%i0 - 0x20], %f4
	.word	0x81a90a44	! t0_kref+0x3d8c:   	fcmpd	%fcc0, %f4, %f4
	.word	0x89a109a4	! t0_kref+0x3d90:   	fdivs	%f4, %f4, %f4
	.word	0xc02e7ffd	! t0_kref+0x3d94:   	clrb	[%i1 - 3]
	.word	0x34800002	! t0_kref+0x3d98:   	bg,a	_kref+0x3da0
	.word	0xd0480019	! t0_kref+0x3d9c:   	ldsb	[%g0 + %i1], %o0
	.word	0x99200000	! t0_kref+0x3da0:   	mulscc	%g0, %g0, %o4
	.word	0xde16001b	! t0_kref+0x3da4:   	lduh	[%i0 + %i3], %o7
	.word	0x9de3bfa0	! t0_kref+0x3da8:   	save	%sp, -0x60, %sp
	.word	0xb607401a	! t0_kref+0x3dac:   	add	%i5, %i2, %i3
	.word	0xafee801c	! t0_kref+0x3db0:   	restore	%i2, %i4, %l7
	.word	0x89b10ca4	! t0_kref+0x3db4:   	fandnot2s	%f4, %f4, %f4
	.word	0x9330201b	! t0_kref+0x3db8:   	srl	%g0, 0x1b, %o1
	.word	0x96700000	! t0_kref+0x3dbc:   	udiv	%g0, %g0, %o3
	.word	0x89a01904	! t0_kref+0x3dc0:   	fitod	%f4, %f4
	.word	0x89a10944	! t0_kref+0x3dc4:   	fmuld	%f4, %f4, %f4
	.word	0x91400000	! t0_kref+0x3dc8:   	mov	%y, %o0
	call	SYM(t0_subr2)
	.word	0xd24e7ff1	! t0_kref+0x3dd0:   	ldsb	[%i1 - 0xf], %o1
	.word	0x89a108c4	! t0_kref+0x3dd4:   	fsubd	%f4, %f4, %f4
	.word	0x8143c000	! t0_kref+0x3dd8:   	stbar
	.word	0x98a82df1	! t0_kref+0x3ddc:   	andncc	%g0, 0xdf1, %o4
	.word	0xda08a030	! t0_kref+0x3de0:   	ldub	[%g2 + 0x30], %o5
	.word	0x9aa83a35	! t0_kref+0x3de4:   	andncc	%g0, -0x5cb, %o5
	.word	0xc9064000	! t0_kref+0x3de8:   	ld	[%i1], %f4
	.word	0x99b105c4	! t0_kref+0x3dec:   	fcmpeq32	%f4, %f4, %o4
	.word	0x80500000	! t0_kref+0x3df0:   	umul	%g0, %g0, %g0
	call	SYM(t0_subr1)
	.word	0x89b10ea0	! t0_kref+0x3df8:   	fsrc1s	%f4, %f4
	.word	0x89a000a4	! t0_kref+0x3dfc:   	fnegs	%f4, %f4
	.word	0x878020d2	! t0_kref+0x3e00:   	mov	0xd2, %asi
	.word	0x83414000	! t0_kref+0x3e04:   	mov	%pc, %g1
	.word	0xd068a025	! t0_kref+0x3e08:   	ldstub	[%g2 + 0x25], %o0
	.word	0x81a90a24	! t0_kref+0x3e0c:   	fcmps	%fcc0, %f4, %f4
	.word	0x89b10ac4	! t0_kref+0x3e10:   	fpsub32	%f4, %f4, %f4
	.word	0x8d800000	! t0_kref+0x3e14:   	mov	%g0, %fprs
	.word	0xaea80000	! t0_kref+0x3e18:   	andncc	%g0, %g0, %l7
	.word	0x89a10944	! t0_kref+0x3e1c:   	fmuld	%f4, %f4, %f4
	.word	0xd8380018	! t0_kref+0x3e20:   	std	%o4, [%g0 + %i0]
	.word	0xc030a02c	! t0_kref+0x3e24:   	clrh	[%g2 + 0x2c]
	.word	0x89a108c4	! t0_kref+0x3e28:   	fsubd	%f4, %f4, %f4
	.word	0x8d800000	! t0_kref+0x3e2c:   	mov	%g0, %fprs
	.word	0x81dcc01c	! t0_kref+0x3e30:   	flush	%l3 + %i4
	.word	0x89b00c00	! t0_kref+0x3e34:   	fzero	%f4
	.word	0x9f400000	! t0_kref+0x3e38:   	mov	%y, %o7
	.word	0x95b00160	! t0_kref+0x3e3c:   	edge32ln	%g0, %g0, %o2
	.word	0x89a00524	! t0_kref+0x3e40:   	fsqrts	%f4, %f4
	.word	0xec9e1000	! t0_kref+0x3e44:   	ldda	[%i0]0x80, %l6
	.word	0x89a108c4	! t0_kref+0x3e48:   	fsubd	%f4, %f4, %f4
	.word	0xc028a021	! t0_kref+0x3e4c:   	clrb	[%g2 + 0x21]
	.word	0xd4180019	! t0_kref+0x3e50:   	ldd	[%g0 + %i1], %o2
	.word	0x89b10ac4	! t0_kref+0x3e54:   	fpsub32	%f4, %f4, %f4
	.word	0xc920a024	! t0_kref+0x3e58:   	st	%f4, [%g2 + 0x24]
	.word	0x90080000	! t0_kref+0x3e5c:   	and	%g0, %g0, %o0
	.word	0xc020a00c	! t0_kref+0x3e60:   	clr	[%g2 + 0xc]
	.word	0xc920a02c	! t0_kref+0x3e64:   	st	%f4, [%g2 + 0x2c]
	.word	0xc9a01018	! t0_kref+0x3e68:   	sta	%f4, [%g0 + %i0]0x80
	.word	0xae400000	! t0_kref+0x3e6c:   	addc	%g0, %g0, %l7
	.word	0x81400000	! t0_kref+0x3e70:   	mov	%y, %g0
	.word	0xda00a03c	! t0_kref+0x3e74:   	ld	[%g2 + 0x3c], %o5
	.word	0x89a000a4	! t0_kref+0x3e78:   	fnegs	%f4, %f4
	.word	0x81800000	! t0_kref+0x3e7c:   	mov	%g0, %y
	.word	0xc920a038	! t0_kref+0x3e80:   	st	%f4, [%g2 + 0x38]
	.word	0x93282001	! t0_kref+0x3e84:   	sll	%g0, 0x1, %o1
	call	SYM(t0_subr3)
	.word	0xaf400000	! t0_kref+0x3e8c:   	mov	%y, %l7
	.word	0x89a00144	! t0_kref+0x3e90:   	fabsd	%f4, %f4
	.word	0x89a10844	! t0_kref+0x3e94:   	faddd	%f4, %f4, %f4
	.word	0x9aa80000	! t0_kref+0x3e98:   	andncc	%g0, %g0, %o5
	.word	0x89a108a4	! t0_kref+0x3e9c:   	fsubs	%f4, %f4, %f4
	.word	0xc0270018	! t0_kref+0x3ea0:   	clr	[%i4 + %i0]
	.word	0x97b00140	! t0_kref+0x3ea4:   	edge32l	%g0, %g0, %o3
	.word	0xc906200c	! t0_kref+0x3ea8:   	ld	[%i0 + 0xc], %f4
	.word	0x89a000a4	! t0_kref+0x3eac:   	fnegs	%f4, %f4
	.word	0xe0981019	! t0_kref+0x3eb0:   	ldda	[%g0 + %i1]0x80, %l0
	.word	0x9ae00000	! t0_kref+0x3eb4:   	subccc	%g0, %g0, %o5
	.word	0x89a108c4	! t0_kref+0x3eb8:   	fsubd	%f4, %f4, %f4
	.word	0xc920a028	! t0_kref+0x3ebc:   	st	%f4, [%g2 + 0x28]
	.word	0x94600000	! t0_kref+0x3ec0:   	subc	%g0, %g0, %o2
	.word	0xec3f4019	! t0_kref+0x3ec4:   	std	%l6, [%i5 + %i1]
	.word	0xd2162018	! t0_kref+0x3ec8:   	lduh	[%i0 + 0x18], %o1
	.word	0x9144c000	! t0_kref+0x3ecc:   	mov	%gsr, %o0
	.word	0x91b000c0	! t0_kref+0x3ed0:   	edge16l	%g0, %g0, %o0
	.word	0x98d83e08	! t0_kref+0x3ed4:   	smulcc	%g0, -0x1f8, %o4
	.word	0xee563ff6	! t0_kref+0x3ed8:   	ldsh	[%i0 - 0xa], %l7
	.word	0x9540c000	! t0_kref+0x3edc:   	mov	%asi, %o2
	.word	0xc0364000	! t0_kref+0x3ee0:   	clrh	[%i1]
	.word	0xc807bff0	! t0_kref+0x3ee4:   	ld	[%fp - 0x10], %g4
	.word	0xc0a65000	! t0_kref+0x3ee8:   	sta	%g0, [%i1]0x80
	.word	0x9ef80000	! t0_kref+0x3eec:   	sdivcc	%g0, %g0, %o7
	.word	0x89b10624	! t0_kref+0x3ef0:   	fmul8x16	%f4, %f4, %f4
	.word	0x80980000	! t0_kref+0x3ef4:   	xorcc	%g0, %g0, %g0
	.word	0x96180000	! t0_kref+0x3ef8:   	xor	%g0, %g0, %o3
	.word	0x90a82ebc	! t0_kref+0x3efc:   	andncc	%g0, 0xebc, %o0
	.word	0x89a10844	! t0_kref+0x3f00:   	faddd	%f4, %f4, %f4
	.word	0x89a01924	! t0_kref+0x3f04:   	fstod	%f4, %f4
	.word	0x2c800006	! t0_kref+0x3f08:   	bneg,a	_kref+0x3f20
	.word	0x80f83e55	! t0_kref+0x3f0c:   	sdivcc	%g0, -0x1ab, %g0
	.word	0x9530200e	! t0_kref+0x3f10:   	srl	%g0, 0xe, %o2
	.word	0xd00e7fe1	! t0_kref+0x3f14:   	ldub	[%i1 - 0x1f], %o0
	.word	0x9bb00100	! t0_kref+0x3f18:   	edge32	%g0, %g0, %o5
	.word	0xd610a000	! t0_kref+0x3f1c:   	lduh	[%g2], %o3
	.word	0x98c00000	! t0_kref+0x3f20:   	addccc	%g0, %g0, %o4
	.word	0x89a108a4	! t0_kref+0x3f24:   	fsubs	%f4, %f4, %f4
	.word	0xc048a009	! t0_kref+0x3f28:   	ldsb	[%g2 + 9], %g0
	.word	0xae882e40	! t0_kref+0x3f2c:   	andcc	%g0, 0xe40, %l7
	.word	0x86102012	! t0_kref+0x3f30:   	mov	0x12, %g3
	.word	0x86a0e001	! t0_kref+0x3f34:   	subcc	%g3, 1, %g3
	.word	0x22800013	! t0_kref+0x3f38:   	be,a	_kref+0x3f84
	.word	0x981025a4	! t0_kref+0x3f3c:   	mov	0x5a4, %o4
	.word	0xd80e3ffe	! t0_kref+0x3f40:   	ldub	[%i0 - 2], %o4
	.word	0x89a000a4	! t0_kref+0x3f44:   	fnegs	%f4, %f4
	.word	0x89a10d24	! t0_kref+0x3f48:   	fsmuld	%f4, %f4, %f4
	.word	0xaf300000	! t0_kref+0x3f4c:   	srl	%g0, %g0, %l7
	.word	0x80800000	! t0_kref+0x3f50:   	addcc	%g0, %g0, %g0
	.word	0x81a90aa4	! t0_kref+0x3f54:   	fcmpes	%fcc0, %f4, %f4
	.word	0x94c00000	! t0_kref+0x3f58:   	addccc	%g0, %g0, %o2
	.word	0xd89f5018	! t0_kref+0x3f5c:   	ldda	[%i5 + %i0]0x80, %o4
	.word	0x89a00524	! t0_kref+0x3f60:   	fsqrts	%f4, %f4
	.word	0x89b00fe0	! t0_kref+0x3f64:   	fones	%f4
	.word	0x89a01a44	! t0_kref+0x3f68:   	fdtoi	%f4, %f4
	.word	0x97b00060	! t0_kref+0x3f6c:   	edge8ln	%g0, %g0, %o3
	.word	0xc9060000	! t0_kref+0x3f70:   	ld	[%i0], %f4
	.word	0x946032a4	! t0_kref+0x3f74:   	subc	%g0, -0xd5c, %o2
	.word	0xc020a034	! t0_kref+0x3f78:   	clr	[%g2 + 0x34]
	.word	0x90102cd9	! t0_kref+0x3f7c:   	mov	0xcd9, %o0
	.word	0xd45f4019	! t0_kref+0x3f80:   	ldx	[%i5 + %i1], %o2
	.word	0xc020a038	! t0_kref+0x3f84:   	clr	[%g2 + 0x38]
	.word	0xc91e7fe0	! t0_kref+0x3f88:   	ldd	[%i1 - 0x20], %f4
	.word	0x81a90ac4	! t0_kref+0x3f8c:   	fcmped	%fcc0, %f4, %f4
	.word	0x988026c6	! t0_kref+0x3f90:   	addcc	%g0, 0x6c6, %o4
	.word	0xc9060000	! t0_kref+0x3f94:   	ld	[%i0], %f4
	.word	0xc9180019	! t0_kref+0x3f98:   	ldd	[%g0 + %i1], %f4
	.word	0x133dead8	! t0_kref+0x3f9c:   	sethi	%hi(0xf7ab6000), %o1
	.word	0x94200000	! t0_kref+0x3fa0:   	neg	%g0, %o2
	.word	0x89b107c4	! t0_kref+0x3fa4:   	pdist	%f4, %f4, %f4
	.word	0x94b03646	! t0_kref+0x3fa8:   	orncc	%g0, -0x9ba, %o2
	.word	0x89a00124	! t0_kref+0x3fac:   	fabss	%f4, %f4
	.word	0x89b107c4	! t0_kref+0x3fb0:   	pdist	%f4, %f4, %f4
	.word	0x89a000a4	! t0_kref+0x3fb4:   	fnegs	%f4, %f4
	.word	0xd6166010	! t0_kref+0x3fb8:   	lduh	[%i1 + 0x10], %o3
	.word	0x89a108c4	! t0_kref+0x3fbc:   	fsubd	%f4, %f4, %f4
	.word	0x89a108c4	! t0_kref+0x3fc0:   	fsubd	%f4, %f4, %f4
	.word	0x81a90aa4	! t0_kref+0x3fc4:   	fcmpes	%fcc0, %f4, %f4
	.word	0x9a002e1d	! t0_kref+0x3fc8:   	add	%g0, 0xe1d, %o5
	.word	0x9e00229a	! t0_kref+0x3fcc:   	add	%g0, 0x29a, %o7
	.word	0x81a90a24	! t0_kref+0x3fd0:   	fcmps	%fcc0, %f4, %f4
	.word	0xaf44c000	! t0_kref+0x3fd4:   	mov	%gsr, %l7
	.word	0xafb00020	! t0_kref+0x3fd8:   	edge8n	%g0, %g0, %l7
	.word	0xd810a012	! t0_kref+0x3fdc:   	lduh	[%g2 + 0x12], %o4
	.word	0xc1ee1000	! t0_kref+0x3fe0:   	prefetcha	%i0, 0
	.word	0x89b007a4	! t0_kref+0x3fe4:   	fpackfix	%f4, %f4
	.word	0x81b10484	! t0_kref+0x3fe8:   	fcmple32	%f4, %f4, %g0
	.word	0x89a108c4	! t0_kref+0x3fec:   	fsubd	%f4, %f4, %f4
	.word	0x81a90a44	! t0_kref+0x3ff0:   	fcmpd	%fcc0, %f4, %f4
	.word	0x2c800001	! t0_kref+0x3ff4:   	bneg,a	_kref+0x3ff8
	.word	0x89a10924	! t0_kref+0x3ff8:   	fmuls	%f4, %f4, %f4
	.word	0x81ddece1	! t0_kref+0x3ffc:   	flush	%l7 + 0xce1
	.word	0x9a803eea	! t0_kref+0x4000:   	addcc	%g0, -0x116, %o5
	.word	0x89b10904	! t0_kref+0x4004:   	faligndata	%f4, %f4, %f4
	.word	0x9bb00320	! t0_kref+0x4008:   	bmask	%g0, %g0, %o5
	.word	0x89a018c4	! t0_kref+0x400c:   	fdtos	%f4, %f4
	.word	0xc9be1840	! t0_kref+0x4010:   	stda	%f4, [%i0]0xc2
	.word	0x81a90aa4	! t0_kref+0x4014:   	fcmpes	%fcc0, %f4, %f4
	.word	0x89a000a4	! t0_kref+0x4018:   	fnegs	%f4, %f4
	.word	0x89a10824	! t0_kref+0x401c:   	fadds	%f4, %f4, %f4
	.word	0xc9062004	! t0_kref+0x4020:   	ld	[%i0 + 4], %f4
	.word	0x91b00200	! t0_kref+0x4024:   	array8	%g0, %g0, %o0
	.word	0x9330201b	! t0_kref+0x4028:   	srl	%g0, 0x1b, %o1
	.word	0x90400000	! t0_kref+0x402c:   	addc	%g0, %g0, %o0
	.word	0x94300000	! t0_kref+0x4030:   	orn	%g0, %g0, %o2
	.word	0x81a90aa4	! t0_kref+0x4034:   	fcmpes	%fcc0, %f4, %f4
	.word	0x89a00544	! t0_kref+0x4038:   	fsqrtd	%f4, %f4
	.word	0x9b418000	! t0_kref+0x403c:   	mov	%fprs, %o5
	.word	0xc028a005	! t0_kref+0x4040:   	clrb	[%g2 + 5]
	.word	0x9b280000	! t0_kref+0x4044:   	sll	%g0, %g0, %o5
	.word	0xc9267ff4	! t0_kref+0x4048:   	st	%f4, [%i1 - 0xc]
	.word	0xde0e6013	! t0_kref+0x404c:   	ldub	[%i1 + 0x13], %o7
	.word	0xed68a084	! t0_kref+0x4050:   	prefetch	%g2 + 0x84, 22
	.word	0x89a10924	! t0_kref+0x4054:   	fmuls	%f4, %f4, %f4
	.word	0xc91fbec0	! t0_kref+0x4058:   	ldd	[%fp - 0x140], %f4
	.word	0x9fc10000	! t0_kref+0x405c:   	call	%g4
	.word	0x89a10944	! t0_kref+0x4060:   	fmuld	%f4, %f4, %f4
	call	SYM(t0_subr2)
	.word	0x945034ff	! t0_kref+0x4068:   	umul	%g0, -0xb01, %o2
	.word	0xc00e6002	! t0_kref+0x406c:   	ldub	[%i1 + 2], %g0
	.word	0xae702c0c	! t0_kref+0x4070:   	udiv	%g0, 0xc0c, %l7
	.word	0x9e180000	! t0_kref+0x4074:   	xor	%g0, %g0, %o7
	.word	0x89b10fa4	! t0_kref+0x4078:   	fors	%f4, %f4, %f4
	.word	0x94c00000	! t0_kref+0x407c:   	addccc	%g0, %g0, %o2
	.word	0x91b00020	! t0_kref+0x4080:   	edge8n	%g0, %g0, %o0
	.word	0x89a109c4	! t0_kref+0x4084:   	fdivd	%f4, %f4, %f4
	.word	0x89b10d24	! t0_kref+0x4088:   	fandnot1s	%f4, %f4, %f4
	.word	0x90000000	! t0_kref+0x408c:   	add	%g0, %g0, %o0
	.word	0x9a980000	! t0_kref+0x4090:   	xorcc	%g0, %g0, %o5
	.word	0x89a10924	! t0_kref+0x4094:   	fmuls	%f4, %f4, %f4
	.word	0x93b105c4	! t0_kref+0x4098:   	fcmpeq32	%f4, %f4, %o1
	.word	0x94d0272a	! t0_kref+0x409c:   	umulcc	%g0, 0x72a, %o2
	.word	0x89b107c4	! t0_kref+0x40a0:   	pdist	%f4, %f4, %f4
	.word	0x99b00040	! t0_kref+0x40a4:   	edge8l	%g0, %g0, %o4
	.word	0x9de3bfa0	! t0_kref+0x40a8:   	save	%sp, -0x60, %sp
	.word	0xb29e001a	! t0_kref+0x40ac:   	xorcc	%i0, %i2, %i1
	.word	0x9bef2b4c	! t0_kref+0x40b0:   	restore	%i4, 0xb4c, %o5
	.word	0x89a80044	! t0_kref+0x40b4:   	fmovdn	%fcc0, %f4, %f4
	.word	0x89a108c4	! t0_kref+0x40b8:   	fsubd	%f4, %f4, %f4
	.word	0x89a108a4	! t0_kref+0x40bc:   	fsubs	%f4, %f4, %f4
	.word	0xc050a03c	! t0_kref+0x40c0:   	ldsh	[%g2 + 0x3c], %g0
	.word	0x8d800000	! t0_kref+0x40c4:   	mov	%g0, %fprs
	.word	0x89a10924	! t0_kref+0x40c8:   	fmuls	%f4, %f4, %f4
	.word	0xaef80000	! t0_kref+0x40cc:   	sdivcc	%g0, %g0, %l7
	.word	0x89a108c4	! t0_kref+0x40d0:   	fsubd	%f4, %f4, %f4
	.word	0xa9c067fe	! t0_kref+0x40d4:   	jmpl	%g1 + 0x7fe, %l4
	.word	0x8610200c	! t0_kref+0x40d8:   	mov	0xc, %g3
	.word	0x86a0e001	! t0_kref+0x40dc:   	subcc	%g3, 1, %g3
	.word	0x22800007	! t0_kref+0x40e0:   	be,a	_kref+0x40fc
	.word	0x89a108a4	! t0_kref+0x40e4:   	fsubs	%f4, %f4, %f4
	.word	0x92182efc	! t0_kref+0x40e8:   	xor	%g0, 0xefc, %o1
	.word	0x81a90aa4	! t0_kref+0x40ec:   	fcmpes	%fcc0, %f4, %f4
	.word	0xae6035c8	! t0_kref+0x40f0:   	subc	%g0, -0xa38, %l7
	.word	0x9bb00200	! t0_kref+0x40f4:   	array8	%g0, %g0, %o5
	.word	0xc028a00d	! t0_kref+0x40f8:   	clrb	[%g2 + 0xd]
	.word	0x89b10ca4	! t0_kref+0x40fc:   	fandnot2s	%f4, %f4, %f4
	.word	0x89a10844	! t0_kref+0x4100:   	faddd	%f4, %f4, %f4
	.word	0x28800008	! t0_kref+0x4104:   	bleu,a	_kref+0x4124
	.word	0xd640a01c	! t0_kref+0x4108:   	ldsw	[%g2 + 0x1c], %o3
	.word	0xd240a020	! t0_kref+0x410c:   	ldsw	[%g2 + 0x20], %o1
	.word	0x9e703584	! t0_kref+0x4110:   	udiv	%g0, -0xa7c, %o7
	.word	0xc00e0000	! t0_kref+0x4114:   	ldub	[%i0], %g0
	.word	0x89a108c4	! t0_kref+0x4118:   	fsubd	%f4, %f4, %f4
	.word	0x984022c4	! t0_kref+0x411c:   	addc	%g0, 0x2c4, %o4
	.word	0x9af83fea	! t0_kref+0x4120:   	sdivcc	%g0, -0x16, %o5
	.word	0x94182030	! t0_kref+0x4124:   	xor	%g0, 0x30, %o2
	.word	0x94400000	! t0_kref+0x4128:   	addc	%g0, %g0, %o2
	.word	0x949825c6	! t0_kref+0x412c:   	xorcc	%g0, 0x5c6, %o2
	.word	0xc9865000	! t0_kref+0x4130:   	lda	[%i1]0x80, %f4
	.word	0x92a83e8e	! t0_kref+0x4134:   	andncc	%g0, -0x172, %o1
	.word	0x89a00524	! t0_kref+0x4138:   	fsqrts	%f4, %f4
	.word	0x89a00044	! t0_kref+0x413c:   	fmovd	%f4, %f4
	.word	0x32800004	! t0_kref+0x4140:   	bne,a	_kref+0x4150
	.word	0xaf083cb9	! t0_kref+0x4144:   	tsubcc	%g0, -0x347, %l7
	.word	0x81dcb823	! t0_kref+0x4148:   	flush	%l2 - 0x7dd
	.word	0xc9180018	! t0_kref+0x414c:   	ldd	[%g0 + %i0], %f4
	.word	0xe41e3fe0	! t0_kref+0x4150:   	ldd	[%i0 - 0x20], %l2
	.word	0x89a01904	! t0_kref+0x4154:   	fitod	%f4, %f4
	.word	0x9de3bfa0	! t0_kref+0x4158:   	save	%sp, -0x60, %sp
	.word	0xb69f2057	! t0_kref+0x415c:   	xorcc	%i4, 0x57, %i3
	.word	0x97ee801b	! t0_kref+0x4160:   	restore	%i2, %i3, %o3
	.word	0x97280000	! t0_kref+0x4164:   	sll	%g0, %g0, %o3
	.word	0x98a80000	! t0_kref+0x4168:   	andncc	%g0, %g0, %o4
	.word	0x89a00544	! t0_kref+0x416c:   	fsqrtd	%f4, %f4
	.word	0x89a01924	! t0_kref+0x4170:   	fstod	%f4, %f4
	.word	0xc0267ff0	! t0_kref+0x4174:   	clr	[%i1 - 0x10]
	.word	0x81800000	! t0_kref+0x4178:   	mov	%g0, %y
	.word	0x89b00c00	! t0_kref+0x417c:   	fzero	%f4
	.word	0x92180000	! t0_kref+0x4180:   	xor	%g0, %g0, %o1
	.word	0x89a00124	! t0_kref+0x4184:   	fabss	%f4, %f4
	.word	0x001fffff	! t0_kref+0x4188:   	illtrap	0x1fffff
	.word	0xc920a010	! t0_kref+0x418c:   	st	%f4, [%g2 + 0x10]
	.word	0xc030a01a	! t0_kref+0x4190:   	clrh	[%g2 + 0x1a]
	.word	0x89b00764	! t0_kref+0x4194:   	fpack16	%f4, %f4
	.word	0xc9070018	! t0_kref+0x4198:   	ld	[%i4 + %i0], %f4
	.word	0x89a01044	! t0_kref+0x419c:   	fdtox	%f4, %f4
	.word	0x97400000	! t0_kref+0x41a0:   	mov	%y, %o3
	.word	0x92983f0d	! t0_kref+0x41a4:   	xorcc	%g0, -0xf3, %o1
	call	SYM(t0_subr0)
	.word	0x89b10624	! t0_kref+0x41ac:   	fmul8x16	%f4, %f4, %f4
	.word	0x90403f1c	! t0_kref+0x41b0:   	addc	%g0, -0xe4, %o0
	.word	0xae702437	! t0_kref+0x41b4:   	udiv	%g0, 0x437, %l7
	.word	0x89a108c4	! t0_kref+0x41b8:   	fsubd	%f4, %f4, %f4
	.word	0xc030a00e	! t0_kref+0x41bc:   	clrh	[%g2 + 0xe]
	.word	0xd050a030	! t0_kref+0x41c0:   	ldsh	[%g2 + 0x30], %o0
	.word	0x2e800001	! t0_kref+0x41c4:   	bvs,a	_kref+0x41c8
	.word	0xde0e200e	! t0_kref+0x41c8:   	ldub	[%i0 + 0xe], %o7
	.word	0xc9be6016	! t0_kref+0x41cc:   	stda	%f4, [%i1 + 0x16]%asi
	.word	0x95300000	! t0_kref+0x41d0:   	srl	%g0, %g0, %o2
	.word	0x81300000	! t0_kref+0x41d4:   	srl	%g0, %g0, %g0
	.word	0x89a00524	! t0_kref+0x41d8:   	fsqrts	%f4, %f4
	.word	0x89a01924	! t0_kref+0x41dc:   	fstod	%f4, %f4
	.word	0x89b10e04	! t0_kref+0x41e0:   	fand	%f4, %f4, %f4
	.word	0x89a10d24	! t0_kref+0x41e4:   	fsmuld	%f4, %f4, %f4
	.word	0x90900000	! t0_kref+0x41e8:   	orcc	%g0, %g0, %o0
	.word	0x89a109a4	! t0_kref+0x41ec:   	fdivs	%f4, %f4, %f4
	.word	0xc91fbdc8	! t0_kref+0x41f0:   	ldd	[%fp - 0x238], %f4
	.word	0x89a10944	! t0_kref+0x41f4:   	fmuld	%f4, %f4, %f4
	call	SYM(t0_subr3)
	.word	0x89b10e24	! t0_kref+0x41fc:   	fands	%f4, %f4, %f4
	.word	0xaf408000	! t0_kref+0x4200:   	mov	%ccr, %l7
	.word	0x89a00124	! t0_kref+0x4204:   	fabss	%f4, %f4
	.word	0xeaf81018	! t0_kref+0x4208:   	swapa	[%g0 + %i0]0x80, %l5
	.word	0xc9000019	! t0_kref+0x420c:   	ld	[%g0 + %i1], %f4
	.word	0xda480018	! t0_kref+0x4210:   	ldsb	[%g0 + %i0], %o5
	.word	0x89b10ea0	! t0_kref+0x4214:   	fsrc1s	%f4, %f4
	.word	0x81da000b	! t0_kref+0x4218:   	flush	%o0 + %o3
	.word	0x20800008	! t0_kref+0x421c:   	bn,a	_kref+0x423c
	.word	0xc0ae9019	! t0_kref+0x4220:   	stba	%g0, [%i2 + %i1]0x80
	.word	0x9fc00004	! t0_kref+0x4224:   	call	%g0 + %g4
	.word	0x97400000	! t0_kref+0x4228:   	mov	%y, %o3
	.word	0x9bb000a0	! t0_kref+0x422c:   	edge16n	%g0, %g0, %o5
	.word	0x89a10924	! t0_kref+0x4230:   	fmuls	%f4, %f4, %f4
	.word	0x89a10924	! t0_kref+0x4234:   	fmuls	%f4, %f4, %f4
	.word	0xc020a030	! t0_kref+0x4238:   	clr	[%g2 + 0x30]
	.word	0x81400000	! t0_kref+0x423c:   	mov	%y, %g0
	.word	0xafb10484	! t0_kref+0x4240:   	fcmple32	%f4, %f4, %l7
	.word	0xc030a02a	! t0_kref+0x4244:   	clrh	[%g2 + 0x2a]
	.word	0xc99f5018	! t0_kref+0x4248:   	ldda	[%i5 + %i0]0x80, %f4
	.word	0x89a10824	! t0_kref+0x424c:   	fadds	%f4, %f4, %f4
	.word	0x90f8382f	! t0_kref+0x4250:   	sdivcc	%g0, -0x7d1, %o0
	.word	0x97b10584	! t0_kref+0x4254:   	fcmpgt32	%f4, %f4, %o3
	.word	0x89b106e4	! t0_kref+0x4258:   	fmul8ulx16	%f4, %f4, %f4
	.word	0x89a01924	! t0_kref+0x425c:   	fstod	%f4, %f4
	.word	0x90700000	! t0_kref+0x4260:   	udiv	%g0, %g0, %o0
	.word	0x95302010	! t0_kref+0x4264:   	srl	%g0, 0x10, %o2
	.word	0x89b10ec4	! t0_kref+0x4268:   	fornot2	%f4, %f4, %f4
	.word	0xaea83084	! t0_kref+0x426c:   	andncc	%g0, -0xf7c, %l7
	.word	0xaf282006	! t0_kref+0x4270:   	sll	%g0, 0x6, %l7
	.word	0xe1182ed0	! t0_kref+0x4274:   	ldd	[%g0 + 0xed0], %f16
	.word	0x9a883f52	! t0_kref+0x4278:   	andcc	%g0, -0xae, %o5
	.word	0x92a80000	! t0_kref+0x427c:   	andncc	%g0, %g0, %o1
	.word	0xda080019	! t0_kref+0x4280:   	ldub	[%g0 + %i1], %o5
	.word	0x98e03934	! t0_kref+0x4284:   	subccc	%g0, -0x6cc, %o4
	.word	0x95200000	! t0_kref+0x4288:   	mulscc	%g0, %g0, %o2
	.word	0x94180000	! t0_kref+0x428c:   	xor	%g0, %g0, %o2
	.word	0x89b10c44	! t0_kref+0x4290:   	fnor	%f4, %f4, %f4
	.word	0x98103f28	! t0_kref+0x4294:   	mov	0xffffff28, %o4
	.word	0x9840294d	! t0_kref+0x4298:   	addc	%g0, 0x94d, %o4
	.word	0x81a90aa4	! t0_kref+0x429c:   	fcmpes	%fcc0, %f4, %f4
	.word	0x89b00fc0	! t0_kref+0x42a0:   	fone	%f4
	.word	0xd84e7fea	! t0_kref+0x42a4:   	ldsb	[%i1 - 0x16], %o4
	.word	0x80b00000	! t0_kref+0x42a8:   	orncc	%g0, %g0, %g0
	.word	0x93b00200	! t0_kref+0x42ac:   	array8	%g0, %g0, %o1
	.word	0xae3026f9	! t0_kref+0x42b0:   	orn	%g0, 0x6f9, %l7
	.word	0xc0264000	! t0_kref+0x42b4:   	clr	[%i1]
	.word	0x9e802b91	! t0_kref+0x42b8:   	addcc	%g0, 0xb91, %o7
	.word	0x89b10ae4	! t0_kref+0x42bc:   	fpsub32s	%f4, %f4, %f4
	.word	0xc030a016	! t0_kref+0x42c0:   	clrh	[%g2 + 0x16]
	.word	0xc0266004	! t0_kref+0x42c4:   	clr	[%i1 + 4]
	.word	0x92800000	! t0_kref+0x42c8:   	addcc	%g0, %g0, %o1
	.word	0x99b10404	! t0_kref+0x42cc:   	fcmple16	%f4, %f4, %o4
	.word	0x89b10724	! t0_kref+0x42d0:   	fmuld8ulx16	%f4, %f4, %f4
	call	SYM(t0_subr3)
	.word	0x94280000	! t0_kref+0x42d8:   	andn	%g0, %g0, %o2
	.word	0x8143c000	! t0_kref+0x42dc:   	stbar
	.word	0xee0e7fe5	! t0_kref+0x42e0:   	ldub	[%i1 - 0x1b], %l7
	.word	0xd01e4000	! t0_kref+0x42e4:   	ldd	[%i1], %o0
	.word	0x89a01a44	! t0_kref+0x42e8:   	fdtoi	%f4, %f4
	.word	0x90782e49	! t0_kref+0x42ec:   	sdiv	%g0, 0xe49, %o0
	.word	0x80a00000	! t0_kref+0x42f0:   	cmp	%g0, %g0
	.word	0x94303a0c	! t0_kref+0x42f4:   	orn	%g0, -0x5f4, %o2
	.word	0x8144c000	! t0_kref+0x42f8:   	mov	%gsr, %g0
	.word	0x89a01904	! t0_kref+0x42fc:   	fitod	%f4, %f4
	.word	0x9ac00000	! t0_kref+0x4300:   	addccc	%g0, %g0, %o5
	.word	0xc9801019	! t0_kref+0x4304:   	lda	[%g0 + %i1]0x80, %f4
	.word	0x89abc044	! t0_kref+0x4308:   	fmovdo	%fcc0, %f4, %f4
	.word	0x89b10f84	! t0_kref+0x430c:   	for	%f4, %f4, %f4
	.word	0x89a108c4	! t0_kref+0x4310:   	fsubd	%f4, %f4, %f4
	.word	0xc02e401a	! t0_kref+0x4314:   	clrb	[%i1 + %i2]
	.word	0x81b00240	! t0_kref+0x4318:   	array16	%g0, %g0, %g0
	.word	0x89a10924	! t0_kref+0x431c:   	fmuls	%f4, %f4, %f4
	.word	0x89a10924	! t0_kref+0x4320:   	fmuls	%f4, %f4, %f4
	.word	0x89a10844	! t0_kref+0x4324:   	faddd	%f4, %f4, %f4
	.word	0x89a109c4	! t0_kref+0x4328:   	fdivd	%f4, %f4, %f4
	.word	0xafb105c4	! t0_kref+0x432c:   	fcmpeq32	%f4, %f4, %l7
	.word	0x89b10f44	! t0_kref+0x4330:   	fornot1	%f4, %f4, %f4
	.word	0xc04e601b	! t0_kref+0x4334:   	ldsb	[%i1 + 0x1b], %g0
	.word	0x89b10744	! t0_kref+0x4338:   	fpack32	%f4, %f4, %f4
	.word	0x20800004	! t0_kref+0x433c:   	bn,a	_kref+0x434c
	.word	0x9bb00060	! t0_kref+0x4340:   	edge8ln	%g0, %g0, %o5
	.word	0x89a000a4	! t0_kref+0x4344:   	fnegs	%f4, %f4
	.word	0x89a000a4	! t0_kref+0x4348:   	fnegs	%f4, %f4
	.word	0x89b10ac4	! t0_kref+0x434c:   	fpsub32	%f4, %f4, %f4
	call	SYM(t0_subr2)
	.word	0xe050a01e	! t0_kref+0x4354:   	ldsh	[%g2 + 0x1e], %l0
	.word	0x99400000	! t0_kref+0x4358:   	mov	%y, %o4
	.word	0x9b700000	! t0_kref+0x435c:   	popc	%g0, %o5
	.word	0x89a10924	! t0_kref+0x4360:   	fmuls	%f4, %f4, %f4
	.word	0x95b10504	! t0_kref+0x4364:   	fcmpgt16	%f4, %f4, %o2
	.word	0x95282012	! t0_kref+0x4368:   	sll	%g0, 0x12, %o2
	.word	0x81400000	! t0_kref+0x436c:   	mov	%y, %g0
	.word	0xae50324f	! t0_kref+0x4370:   	umul	%g0, -0xdb1, %l7
	.word	0xc030a016	! t0_kref+0x4374:   	clrh	[%g2 + 0x16]
	.word	0x89b106c4	! t0_kref+0x4378:   	fmul8sux16	%f4, %f4, %f4
	.word	0x80700000	! t0_kref+0x437c:   	udiv	%g0, %g0, %g0
	.word	0x9fc00004	! t0_kref+0x4380:   	call	%g0 + %g4
	.word	0x89a00544	! t0_kref+0x4384:   	fsqrtd	%f4, %f4
	.word	0x912030b6	! t0_kref+0x4388:   	mulscc	%g0, -0xf4a, %o0
	.word	0xc028a015	! t0_kref+0x438c:   	clrb	[%g2 + 0x15]
	.word	0x9fc00004	! t0_kref+0x4390:   	call	%g0 + %g4
	.word	0x80d00000	! t0_kref+0x4394:   	umulcc	%g0, %g0, %g0
	.word	0xc91fbee8	! t0_kref+0x4398:   	ldd	[%fp - 0x118], %f4
	.word	0x89a108a4	! t0_kref+0x439c:   	fsubs	%f4, %f4, %f4
	.word	0x89a108c4	! t0_kref+0x43a0:   	fsubd	%f4, %f4, %f4
	.word	0x98883ccc	! t0_kref+0x43a4:   	andcc	%g0, -0x334, %o4
	.word	0x89a108a4	! t0_kref+0x43a8:   	fsubs	%f4, %f4, %f4
	.word	0x89a01904	! t0_kref+0x43ac:   	fitod	%f4, %f4
	.word	0xc030a028	! t0_kref+0x43b0:   	clrh	[%g2 + 0x28]
	.word	0x20800002	! t0_kref+0x43b4:   	bn,a	_kref+0x43bc
	.word	0xd6ee101a	! t0_kref+0x43b8:   	ldstuba	[%i0 + %i2]0x80, %o3
	.word	0x89a000a4	! t0_kref+0x43bc:   	fnegs	%f4, %f4
	.word	0x905035b7	! t0_kref+0x43c0:   	umul	%g0, -0xa49, %o0
	.word	0x3c800001	! t0_kref+0x43c4:   	bpos,a	_kref+0x43c8
	.word	0x89a00144	! t0_kref+0x43c8:   	fabsd	%f4, %f4
	.word	0x94f80000	! t0_kref+0x43cc:   	sdivcc	%g0, %g0, %o2
	.word	0x97280000	! t0_kref+0x43d0:   	sll	%g0, %g0, %o3
	.word	0xc020a01c	! t0_kref+0x43d4:   	clr	[%g2 + 0x1c]
	.word	0xd5f65000	! t0_kref+0x43d8:   	casxa	[%i1]0x80, %g0, %o2
	.word	0x9f30200a	! t0_kref+0x43dc:   	srl	%g0, 0xa, %o7
	.word	0x98002496	! t0_kref+0x43e0:   	add	%g0, 0x496, %o4
	.word	0xe81e2010	! t0_kref+0x43e4:   	ldd	[%i0 + 0x10], %l4
	.word	0xd806401c	! t0_kref+0x43e8:   	ld	[%i1 + %i4], %o4
	.word	0xc0266008	! t0_kref+0x43ec:   	clr	[%i1 + 8]
	.word	0x89a10924	! t0_kref+0x43f0:   	fmuls	%f4, %f4, %f4
	.word	0x96000000	! t0_kref+0x43f4:   	add	%g0, %g0, %o3
	.word	0x94403d15	! t0_kref+0x43f8:   	addc	%g0, -0x2eb, %o2
	.word	0x89a108a4	! t0_kref+0x43fc:   	fsubs	%f4, %f4, %f4
	.word	0xc920a024	! t0_kref+0x4400:   	st	%f4, [%g2 + 0x24]
	.word	0x30480008	! t0_kref+0x4404:   	ba,a,pt	%icc, _kref+0x4424
	.word	0xc028a01e	! t0_kref+0x4408:   	clrb	[%g2 + 0x1e]
	.word	0x96100000	! t0_kref+0x440c:   	clr	%o3
	.word	0x92f80000	! t0_kref+0x4410:   	sdivcc	%g0, %g0, %o1
	.word	0x89a01924	! t0_kref+0x4414:   	fstod	%f4, %f4
	.word	0x89b10724	! t0_kref+0x4418:   	fmuld8ulx16	%f4, %f4, %f4
	.word	0x81a90aa4	! t0_kref+0x441c:   	fcmpes	%fcc0, %f4, %f4
	.word	0x24800001	! t0_kref+0x4420:   	ble,a	_kref+0x4424
	.word	0x95380000	! t0_kref+0x4424:   	sra	%g0, %g0, %o2
	.word	0x99380000	! t0_kref+0x4428:   	sra	%g0, %g0, %o4
	.word	0x90e00000	! t0_kref+0x442c:   	subccc	%g0, %g0, %o0
	.word	0xe8380019	! t0_kref+0x4430:   	std	%l4, [%g0 + %i1]
	.word	0xe43e7fe8	! t0_kref+0x4434:   	std	%l2, [%i1 - 0x18]
	.word	0x96f83cd9	! t0_kref+0x4438:   	sdivcc	%g0, -0x327, %o3
	.word	0x81580000	! t0_kref+0x443c:   	flushw
	.word	0x86102001	! t0_kref+0x4440:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x4444:   	bne,a	_kref+0x4444
	.word	0x86a0e001	! t0_kref+0x4448:   	subcc	%g3, 1, %g3
	.word	0x9fb00080	! t0_kref+0x444c:   	edge16	%g0, %g0, %o7
	.word	0xae800000	! t0_kref+0x4450:   	addcc	%g0, %g0, %l7
	.word	0xc9be1840	! t0_kref+0x4454:   	stda	%f4, [%i0]0xc2
	.word	0x89a01904	! t0_kref+0x4458:   	fitod	%f4, %f4
	.word	0x9e8033f0	! t0_kref+0x445c:   	addcc	%g0, -0xc10, %o7
	.word	0xc9067fe4	! t0_kref+0x4460:   	ld	[%i1 - 0x1c], %f4
	.word	0x89a00544	! t0_kref+0x4464:   	fsqrtd	%f4, %f4
	.word	0x9de3bfa0	! t0_kref+0x4468:   	save	%sp, -0x60, %sp
	.word	0xb0c6001d	! t0_kref+0x446c:   	addccc	%i0, %i5, %i0
	.word	0x81e8001d	! t0_kref+0x4470:   	restore	%g0, %i5, %g0
	.word	0xc99e501d	! t0_kref+0x4474:   	ldda	[%i1 + %i5]0x80, %f4
	.word	0xc020a024	! t0_kref+0x4478:   	clr	[%g2 + 0x24]
	.word	0x89a01a44	! t0_kref+0x447c:   	fdtoi	%f4, %f4
	.word	0xd256401b	! t0_kref+0x4480:   	ldsh	[%i1 + %i3], %o1
	.word	0x89a00124	! t0_kref+0x4484:   	fabss	%f4, %f4
	.word	0x81a90aa4	! t0_kref+0x4488:   	fcmpes	%fcc0, %f4, %f4
	.word	0x89a10d24	! t0_kref+0x448c:   	fsmuld	%f4, %f4, %f4
	.word	0xc906401c	! t0_kref+0x4490:   	ld	[%i1 + %i4], %f4
	.word	0x98002689	! t0_kref+0x4494:   	add	%g0, 0x689, %o4
	.word	0x89b10ae4	! t0_kref+0x4498:   	fpsub32s	%f4, %f4, %f4
	.word	0x89a01044	! t0_kref+0x449c:   	fdtox	%f4, %f4
	.word	0x32800004	! t0_kref+0x44a0:   	bne,a	_kref+0x44b0
	.word	0xd210a026	! t0_kref+0x44a4:   	lduh	[%g2 + 0x26], %o1
	.word	0x38800004	! t0_kref+0x44a8:   	bgu,a	_kref+0x44b8
	.word	0x90700000	! t0_kref+0x44ac:   	udiv	%g0, %g0, %o0
	.word	0x89b10744	! t0_kref+0x44b0:   	fpack32	%f4, %f4, %f4
	.word	0x8144c000	! t0_kref+0x44b4:   	mov	%gsr, %g0
	.word	0xd0881019	! t0_kref+0x44b8:   	lduba	[%g0 + %i1]0x80, %o0
	.word	0x91280000	! t0_kref+0x44bc:   	sll	%g0, %g0, %o0
	.word	0xc0266010	! t0_kref+0x44c0:   	clr	[%i1 + 0x10]
	.word	0x89b10aa4	! t0_kref+0x44c4:   	fpsub16s	%f4, %f4, %f4
	.word	0x89a01a44	! t0_kref+0x44c8:   	fdtoi	%f4, %f4
	.word	0x38800005	! t0_kref+0x44cc:   	bgu,a	_kref+0x44e0
	.word	0xd8463fe4	! t0_kref+0x44d0:   	ldsw	[%i0 - 0x1c], %o4
	.word	0x89a00124	! t0_kref+0x44d4:   	fabss	%f4, %f4
	.word	0x89a10844	! t0_kref+0x44d8:   	faddd	%f4, %f4, %f4
	.word	0x89a108a4	! t0_kref+0x44dc:   	fsubs	%f4, %f4, %f4
	.word	0xd440a004	! t0_kref+0x44e0:   	ldsw	[%g2 + 4], %o2
	.word	0x81a90a44	! t0_kref+0x44e4:   	fcmpd	%fcc0, %f4, %f4
	.word	0x89b10c44	! t0_kref+0x44e8:   	fnor	%f4, %f4, %f4
	.word	0xc91fbdd0	! t0_kref+0x44ec:   	ldd	[%fp - 0x230], %f4
	.word	0xc998105d	! t0_kref+0x44f0:   	ldda	[%g0 + %i5]0x82, %f4
	.word	0x89a01904	! t0_kref+0x44f4:   	fitod	%f4, %f4
	.word	0xe49e5000	! t0_kref+0x44f8:   	ldda	[%i1]0x80, %l2
	.word	0x81ddc018	! t0_kref+0x44fc:   	flush	%l7 + %i0
	.word	0x9ef80000	! t0_kref+0x4500:   	sdivcc	%g0, %g0, %o7
	.word	0x80d821fb	! t0_kref+0x4504:   	smulcc	%g0, 0x1fb, %g0
	.word	0x81200000	! t0_kref+0x4508:   	mulscc	%g0, %g0, %g0
	.word	0xde56c019	! t0_kref+0x450c:   	ldsh	[%i3 + %i1], %o7
	.word	0x91b00240	! t0_kref+0x4510:   	array16	%g0, %g0, %o0
	.word	0x89a10824	! t0_kref+0x4514:   	fadds	%f4, %f4, %f4
	.word	0xd8df5019	! t0_kref+0x4518:   	ldxa	[%i5 + %i1]0x80, %o4
	.word	0x89b10ae4	! t0_kref+0x451c:   	fpsub32s	%f4, %f4, %f4
	.word	0x9e50288b	! t0_kref+0x4520:   	umul	%g0, 0x88b, %o7
	.word	0x98080000	! t0_kref+0x4524:   	and	%g0, %g0, %o4
	.word	0xd808a01f	! t0_kref+0x4528:   	ldub	[%g2 + 0x1f], %o4
	.word	0xc0466014	! t0_kref+0x452c:   	ldsw	[%i1 + 0x14], %g0
	.word	0x89b107c4	! t0_kref+0x4530:   	pdist	%f4, %f4, %f4
	.word	0x96d02499	! t0_kref+0x4534:   	umulcc	%g0, 0x499, %o3
	.word	0xd610a038	! t0_kref+0x4538:   	lduh	[%g2 + 0x38], %o3
	.word	0xaf300000	! t0_kref+0x453c:   	srl	%g0, %g0, %l7
	.word	0x93280000	! t0_kref+0x4540:   	sll	%g0, %g0, %o1
	.word	0x95302004	! t0_kref+0x4544:   	srl	%g0, 0x4, %o2
	.word	0x89a108c4	! t0_kref+0x4548:   	fsubd	%f4, %f4, %f4
	.word	0x81b01026	! t0_kref+0x454c:   	siam	0x6
	.word	0xc07e7ff0	! t0_kref+0x4550:   	swap	[%i1 - 0x10], %g0
	.word	0x89a00124	! t0_kref+0x4554:   	fabss	%f4, %f4
	.word	0x89a00144	! t0_kref+0x4558:   	fabsd	%f4, %f4
	.word	0x99400000	! t0_kref+0x455c:   	mov	%y, %o4
	.word	0x92c00000	! t0_kref+0x4560:   	addccc	%g0, %g0, %o1
	.word	0xafb00000	! t0_kref+0x4564:   	edge8	%g0, %g0, %l7
	.word	0x89a108c4	! t0_kref+0x4568:   	fsubd	%f4, %f4, %f4
	.word	0x8d800000	! t0_kref+0x456c:   	mov	%g0, %fprs
	.word	0x9fc00004	! t0_kref+0x4570:   	call	%g0 + %g4
	.word	0x92600000	! t0_kref+0x4574:   	subc	%g0, %g0, %o1
	.word	0x38480008	! t0_kref+0x4578:   	bgu,a,pt	%icc, _kref+0x4598
	.word	0x89a01924	! t0_kref+0x457c:   	fstod	%f4, %f4
	.word	0xc9be5840	! t0_kref+0x4580:   	stda	%f4, [%i1]0xc2
	.word	0x81dbe58c	! t0_kref+0x4584:   	flush	%o7 + 0x58c
	.word	0x8143c000	! t0_kref+0x4588:   	stbar
	.word	0x89a10824	! t0_kref+0x458c:   	fadds	%f4, %f4, %f4
	.word	0x81a90a24	! t0_kref+0x4590:   	fcmps	%fcc0, %f4, %f4
	.word	0x89b10aa4	! t0_kref+0x4594:   	fpsub16s	%f4, %f4, %f4
	call	SYM(t0_subr1)
	.word	0x96702fa1	! t0_kref+0x459c:   	udiv	%g0, 0xfa1, %o3
	.word	0xd84e001a	! t0_kref+0x45a0:   	ldsb	[%i0 + %i2], %o4
	.word	0x9ad80000	! t0_kref+0x45a4:   	smulcc	%g0, %g0, %o5
	.word	0x89a10924	! t0_kref+0x45a8:   	fmuls	%f4, %f4, %f4
	.word	0xe49e101d	! t0_kref+0x45ac:   	ldda	[%i0 + %i5]0x80, %l2
	.word	0xaea80000	! t0_kref+0x45b0:   	andncc	%g0, %g0, %l7
	.word	0xca6e8000	! t0_kref+0x45b4:   	ldstub	[%i2], %g5
	.word	0x98a03c1f	! t0_kref+0x45b8:   	subcc	%g0, -0x3e1, %o4
	.word	0x89a10844	! t0_kref+0x45bc:   	faddd	%f4, %f4, %f4
	.word	0xe01e7ff0	! t0_kref+0x45c0:   	ldd	[%i1 - 0x10], %l0
	.word	0xc9be1a5c	! t0_kref+0x45c4:   	stda	%f4, [%i0 + %i4]0xd2
	.word	0x9f282013	! t0_kref+0x45c8:   	sll	%g0, 0x13, %o7
	.word	0x89a00124	! t0_kref+0x45cc:   	fabss	%f4, %f4
	.word	0x81a90a24	! t0_kref+0x45d0:   	fcmps	%fcc0, %f4, %f4
	.word	0xe3ee101d	! t0_kref+0x45d4:   	prefetcha	%i0 + %i5, 17
	.word	0x26480006	! t0_kref+0x45d8:   	bl,a,pt	%icc, _kref+0x45f0
	.word	0x89a10844	! t0_kref+0x45dc:   	faddd	%f4, %f4, %f4
	.word	0xde062010	! t0_kref+0x45e0:   	ld	[%i0 + 0x10], %o7
	.word	0x81a90ac4	! t0_kref+0x45e4:   	fcmped	%fcc0, %f4, %f4
	.word	0x89a00544	! t0_kref+0x45e8:   	fsqrtd	%f4, %f4
	.word	0x9fc00004	! t0_kref+0x45ec:   	call	%g0 + %g4
	.word	0xe0480018	! t0_kref+0x45f0:   	ldsb	[%g0 + %i0], %l0
	.word	0x89b00f04	! t0_kref+0x45f4:   	fsrc2	%f4, %f4
	.word	0x89a109a4	! t0_kref+0x45f8:   	fdivs	%f4, %f4, %f4
	.word	0x89a00524	! t0_kref+0x45fc:   	fsqrts	%f4, %f4
	.word	0x89b106a4	! t0_kref+0x4600:   	fmul8x16al	%f4, %f4, %f4
	.word	0x89a108c4	! t0_kref+0x4604:   	fsubd	%f4, %f4, %f4
	.word	0x90e02b9e	! t0_kref+0x4608:   	subccc	%g0, 0xb9e, %o0
	.word	0x89a108a4	! t0_kref+0x460c:   	fsubs	%f4, %f4, %f4
	.word	0x81daadf9	! t0_kref+0x4610:   	flush	%o2 + 0xdf9
	.word	0x89a10824	! t0_kref+0x4614:   	fadds	%f4, %f4, %f4
	.word	0x91282007	! t0_kref+0x4618:   	sll	%g0, 0x7, %o0
	.word	0xd8780019	! t0_kref+0x461c:   	swap	[%g0 + %i1], %o4
	.word	0x89a00124	! t0_kref+0x4620:   	fabss	%f4, %f4
	.word	0xd44e001a	! t0_kref+0x4624:   	ldsb	[%i0 + %i2], %o2
	.word	0x94080000	! t0_kref+0x4628:   	and	%g0, %g0, %o2
	.word	0xd256c018	! t0_kref+0x462c:   	ldsh	[%i3 + %i0], %o1
	.word	0x89a10824	! t0_kref+0x4630:   	fadds	%f4, %f4, %f4
	.word	0x89a000a4	! t0_kref+0x4634:   	fnegs	%f4, %f4
	.word	0x9ad0214a	! t0_kref+0x4638:   	umulcc	%g0, 0x14a, %o5
	.word	0x9f40c000	! t0_kref+0x463c:   	mov	%asi, %o7
	.word	0x89a00544	! t0_kref+0x4640:   	fsqrtd	%f4, %f4
	.word	0x89a10844	! t0_kref+0x4644:   	faddd	%f4, %f4, %f4
	.word	0xebee101c	! t0_kref+0x4648:   	prefetcha	%i0 + %i4, 21
	.word	0x98002ea4	! t0_kref+0x464c:   	add	%g0, 0xea4, %o4
	.word	0x89a00524	! t0_kref+0x4650:   	fsqrts	%f4, %f4
	.word	0x32800001	! t0_kref+0x4654:   	bne,a	_kref+0x4658
	.word	0xec1e401d	! t0_kref+0x4658:   	ldd	[%i1 + %i5], %l6
	.word	0x89a10824	! t0_kref+0x465c:   	fadds	%f4, %f4, %f4
	.word	0xc0270019	! t0_kref+0x4660:   	clr	[%i4 + %i1]
	call	SYM(t0_subr1)
	.word	0x94d838ec	! t0_kref+0x4668:   	smulcc	%g0, -0x714, %o2
	.word	0x91b00100	! t0_kref+0x466c:   	edge32	%g0, %g0, %o0
	.word	0x81580000	! t0_kref+0x4670:   	flushw
	.word	0x9e300000	! t0_kref+0x4674:   	orn	%g0, %g0, %o7
	.word	0x89a108a4	! t0_kref+0x4678:   	fsubs	%f4, %f4, %f4
	.word	0xc91fbf48	! t0_kref+0x467c:   	ldd	[%fp - 0xb8], %f4
	.word	0x9ab824b7	! t0_kref+0x4680:   	xnorcc	%g0, 0x4b7, %o5
	.word	0xc0ae9018	! t0_kref+0x4684:   	stba	%g0, [%i2 + %i0]0x80
	.word	0x89a000a4	! t0_kref+0x4688:   	fnegs	%f4, %f4
	.word	0xae800000	! t0_kref+0x468c:   	addcc	%g0, %g0, %l7
	.word	0xc028a003	! t0_kref+0x4690:   	clrb	[%g2 + 3]
	.word	0x9e180000	! t0_kref+0x4694:   	xor	%g0, %g0, %o7
	.word	0x96c00000	! t0_kref+0x4698:   	addccc	%g0, %g0, %o3
	.word	0xc900a014	! t0_kref+0x469c:   	ld	[%g2 + 0x14], %f4
	.word	0xc99f5018	! t0_kref+0x46a0:   	ldda	[%i5 + %i0]0x80, %f4
	.word	0x81a90aa4	! t0_kref+0x46a4:   	fcmpes	%fcc0, %f4, %f4
	.word	0x9970213c	! t0_kref+0x46a8:   	popc	0x13c, %o4
	.word	0x89a01104	! t0_kref+0x46ac:   	fxtod	%f4, %f4
	.word	0x89a10844	! t0_kref+0x46b0:   	faddd	%f4, %f4, %f4
	.word	0xd8ee101a	! t0_kref+0x46b4:   	ldstuba	[%i0 + %i2]0x80, %o4
	call	SYM(t0_subr1)
	.word	0x89a00124	! t0_kref+0x46bc:   	fabss	%f4, %f4
	.word	0x89a01884	! t0_kref+0x46c0:   	fitos	%f4, %f4
	.word	0xf207bfe0	! t0_kref+0x46c4:   	ld	[%fp - 0x20], %i1
	.word	0xd0de101d	! t0_kref+0x46c8:   	ldxa	[%i0 + %i5]0x80, %o0
	.word	0x89a108c4	! t0_kref+0x46cc:   	fsubd	%f4, %f4, %f4
	.word	0x113d5e2a	! t0_kref+0x46d0:   	sethi	%hi(0xf578a800), %o0
	.word	0x96d00000	! t0_kref+0x46d4:   	umulcc	%g0, %g0, %o3
	.word	0x89b10d84	! t0_kref+0x46d8:   	fxor	%f4, %f4, %f4
	.word	0x9b200000	! t0_kref+0x46dc:   	mulscc	%g0, %g0, %o5
	.word	0x92a82ebe	! t0_kref+0x46e0:   	andncc	%g0, 0xebe, %o1
	.word	0x89a10844	! t0_kref+0x46e4:   	faddd	%f4, %f4, %f4
	.word	0x89a10844	! t0_kref+0x46e8:   	faddd	%f4, %f4, %f4
	.word	0xc807bfec	! t0_kref+0x46ec:   	ld	[%fp - 0x14], %g4
	.word	0x89a01924	! t0_kref+0x46f0:   	fstod	%f4, %f4
	.word	0x8143c000	! t0_kref+0x46f4:   	stbar
	.word	0x2a800007	! t0_kref+0x46f8:   	bcs,a	_kref+0x4714
	.word	0x9e180000	! t0_kref+0x46fc:   	xor	%g0, %g0, %o7
	.word	0x89a108a4	! t0_kref+0x4700:   	fsubs	%f4, %f4, %f4
	.word	0x38800005	! t0_kref+0x4704:   	bgu,a	_kref+0x4718
	.word	0x89a00024	! t0_kref+0x4708:   	fmovs	%f4, %f4
	.word	0x9a000000	! t0_kref+0x470c:   	add	%g0, %g0, %o5
	.word	0x9f280000	! t0_kref+0x4710:   	sll	%g0, %g0, %o7
	.word	0xae700000	! t0_kref+0x4714:   	udiv	%g0, %g0, %l7
	.word	0x89a10924	! t0_kref+0x4718:   	fmuls	%f4, %f4, %f4
	.word	0x86102004	! t0_kref+0x471c:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x4720:   	bne,a	_kref+0x4720
	.word	0x86a0e001	! t0_kref+0x4724:   	subcc	%g3, 1, %g3
	.word	0x89b10724	! t0_kref+0x4728:   	fmuld8ulx16	%f4, %f4, %f4
	.word	0x89a00124	! t0_kref+0x472c:   	fabss	%f4, %f4
	.word	0x89a01924	! t0_kref+0x4730:   	fstod	%f4, %f4
	.word	0x89a108a4	! t0_kref+0x4734:   	fsubs	%f4, %f4, %f4
	.word	0x91b000a0	! t0_kref+0x4738:   	edge16n	%g0, %g0, %o0
	.word	0x89a000a4	! t0_kref+0x473c:   	fnegs	%f4, %f4
	.word	0x98700000	! t0_kref+0x4740:   	udiv	%g0, %g0, %o4
	.word	0xd80e8018	! t0_kref+0x4744:   	ldub	[%i2 + %i0], %o4
	.word	0xc920a038	! t0_kref+0x4748:   	st	%f4, [%g2 + 0x38]
	.word	0xda163fe6	! t0_kref+0x474c:   	lduh	[%i0 - 0x1a], %o5
	.word	0x89b00fe0	! t0_kref+0x4750:   	fones	%f4
	.word	0x80f82125	! t0_kref+0x4754:   	sdivcc	%g0, 0x125, %g0
	.word	0x81a90aa4	! t0_kref+0x4758:   	fcmpes	%fcc0, %f4, %f4
	.word	0x89a018c4	! t0_kref+0x475c:   	fdtos	%f4, %f4
	.word	0x97280000	! t0_kref+0x4760:   	sll	%g0, %g0, %o3
	call	SYM(t0_subr0)
	.word	0x991830e7	! t0_kref+0x4768:   	tsubcctv	%g0, -0xf19, %o4
	.word	0x95200000	! t0_kref+0x476c:   	mulscc	%g0, %g0, %o2
	.word	0x9f100000	! t0_kref+0x4770:   	taddcctv	%g0, %g0, %o7
	.word	0x97203715	! t0_kref+0x4774:   	mulscc	%g0, -0x8eb, %o3
	.word	0xafb00200	! t0_kref+0x4778:   	array8	%g0, %g0, %l7
	.word	0x89a01904	! t0_kref+0x477c:   	fitod	%f4, %f4
	.word	0xda48a004	! t0_kref+0x4780:   	ldsb	[%g2 + 4], %o5
	.word	0x95b00000	! t0_kref+0x4784:   	edge8	%g0, %g0, %o2
	.word	0x89b10f84	! t0_kref+0x4788:   	for	%f4, %f4, %f4
	.word	0x98400000	! t0_kref+0x478c:   	addc	%g0, %g0, %o4
	.word	0xc99f5040	! t0_kref+0x4790:   	ldda	[%i5]0x82, %f4
	.word	0x972036ba	! t0_kref+0x4794:   	mulscc	%g0, -0x946, %o3
	.word	0x89b10904	! t0_kref+0x4798:   	faligndata	%f4, %f4, %f4
	.word	0xe83e2000	! t0_kref+0x479c:   	std	%l4, [%i0]
	.word	0xc028a007	! t0_kref+0x47a0:   	clrb	[%g2 + 7]
	.word	0x9a300000	! t0_kref+0x47a4:   	orn	%g0, %g0, %o5
	.word	0x98c00000	! t0_kref+0x47a8:   	addccc	%g0, %g0, %o4
	.word	0xc02e8018	! t0_kref+0x47ac:   	clrb	[%i2 + %i0]
	.word	0x9a100000	! t0_kref+0x47b0:   	clr	%o5
	.word	0x89a108a4	! t0_kref+0x47b4:   	fsubs	%f4, %f4, %f4
	.word	0xae100000	! t0_kref+0x47b8:   	clr	%l7
	.word	0xd656001b	! t0_kref+0x47bc:   	ldsh	[%i0 + %i3], %o3
	.word	0x90b83ce2	! t0_kref+0x47c0:   	xnorcc	%g0, -0x31e, %o0
	.word	0x93b00200	! t0_kref+0x47c4:   	array8	%g0, %g0, %o1
	.word	0x89a00144	! t0_kref+0x47c8:   	fabsd	%f4, %f4
	.word	0xaec00000	! t0_kref+0x47cc:   	addccc	%g0, %g0, %l7
	.word	0x89a108c4	! t0_kref+0x47d0:   	fsubd	%f4, %f4, %f4
	.word	0x9a002474	! t0_kref+0x47d4:   	add	%g0, 0x474, %o5
	.word	0x89aa8044	! t0_kref+0x47d8:   	fmovdue	%fcc0, %f4, %f4
	.word	0x80d827da	! t0_kref+0x47dc:   	smulcc	%g0, 0x7da, %g0
	.word	0xd84e8019	! t0_kref+0x47e0:   	ldsb	[%i2 + %i1], %o4
	.word	0x90f83a85	! t0_kref+0x47e4:   	sdivcc	%g0, -0x57b, %o0
	.word	0x9fc00004	! t0_kref+0x47e8:   	call	%g0 + %g4
	.word	0x93b00140	! t0_kref+0x47ec:   	edge32l	%g0, %g0, %o1
	.word	0xde56c018	! t0_kref+0x47f0:   	ldsh	[%i3 + %i0], %o7
	.word	0x89a109c4	! t0_kref+0x47f4:   	fdivd	%f4, %f4, %f4
	.word	0x89b10f44	! t0_kref+0x47f8:   	fornot1	%f4, %f4, %f4
	.word	0x89a10944	! t0_kref+0x47fc:   	fmuld	%f4, %f4, %f4
	.word	0x89b10ac4	! t0_kref+0x4800:   	fpsub32	%f4, %f4, %f4
	call	SYM(t0_subr0)
	.word	0x94180000	! t0_kref+0x4808:   	xor	%g0, %g0, %o2
	.word	0xc028a01e	! t0_kref+0x480c:   	clrb	[%g2 + 0x1e]
	.word	0x93b10504	! t0_kref+0x4810:   	fcmpgt16	%f4, %f4, %o1
	.word	0xde0e6012	! t0_kref+0x4814:   	ldub	[%i1 + 0x12], %o7
	.word	0x89a108a4	! t0_kref+0x4818:   	fsubs	%f4, %f4, %f4
	.word	0x89b00fe0	! t0_kref+0x481c:   	fones	%f4
	.word	0x89a108c4	! t0_kref+0x4820:   	fsubd	%f4, %f4, %f4
	.word	0x962820d9	! t0_kref+0x4824:   	andn	%g0, 0xd9, %o3
	.word	0xae1026a8	! t0_kref+0x4828:   	mov	0x6a8, %l7
	.word	0x9a603821	! t0_kref+0x482c:   	subc	%g0, -0x7df, %o5
	.word	0x9a182898	! t0_kref+0x4830:   	xor	%g0, 0x898, %o5
	.word	0x91300000	! t0_kref+0x4834:   	srl	%g0, %g0, %o0
	.word	0x81d80004	! t0_kref+0x4838:   	flush	%g0 + %g4
	.word	0x89a000a4	! t0_kref+0x483c:   	fnegs	%f4, %f4
	.word	0x32480003	! t0_kref+0x4840:   	bne,a,pt	%icc, _kref+0x484c
	.word	0x89a10944	! t0_kref+0x4844:   	fmuld	%f4, %f4, %f4
	.word	0x89a10924	! t0_kref+0x4848:   	fmuls	%f4, %f4, %f4
	.word	0xc0f81018	! t0_kref+0x484c:   	swapa	[%g0 + %i0]0x80, %g0
	.word	0x94f80000	! t0_kref+0x4850:   	sdivcc	%g0, %g0, %o2
	.word	0xc91e2008	! t0_kref+0x4854:   	ldd	[%i0 + 8], %f4
	.word	0x80f83c64	! t0_kref+0x4858:   	sdivcc	%g0, -0x39c, %g0
	.word	0xd04e7fe5	! t0_kref+0x485c:   	ldsb	[%i1 - 0x1b], %o0
	.word	0x89a00544	! t0_kref+0x4860:   	fsqrtd	%f4, %f4
	.word	0xc920a03c	! t0_kref+0x4864:   	st	%f4, [%g2 + 0x3c]
	.word	0x89b10e24	! t0_kref+0x4868:   	fands	%f4, %f4, %f4
	.word	0x89a00124	! t0_kref+0x486c:   	fabss	%f4, %f4
	.word	0x9a980000	! t0_kref+0x4870:   	xorcc	%g0, %g0, %o5
	.word	0x89a00524	! t0_kref+0x4874:   	fsqrts	%f4, %f4
	.word	0x28800008	! t0_kref+0x4878:   	bleu,a	_kref+0x4898
	.word	0x89b00764	! t0_kref+0x487c:   	fpack16	%f4, %f4
	.word	0xc020a00c	! t0_kref+0x4880:   	clr	[%g2 + 0xc]
	.word	0x90702925	! t0_kref+0x4884:   	udiv	%g0, 0x925, %o0
	.word	0xc920a030	! t0_kref+0x4888:   	st	%f4, [%g2 + 0x30]
	.word	0x2a480005	! t0_kref+0x488c:   	bcs,a,pt	%icc, _kref+0x48a0
	.word	0x90500000	! t0_kref+0x4890:   	umul	%g0, %g0, %o0
	call	SYM(t0_subr1)
	.word	0x81200000	! t0_kref+0x4898:   	mulscc	%g0, %g0, %g0
	.word	0xc920a030	! t0_kref+0x489c:   	st	%f4, [%g2 + 0x30]
	.word	0xc0262018	! t0_kref+0x48a0:   	clr	[%i0 + 0x18]
	.word	0x89a00524	! t0_kref+0x48a4:   	fsqrts	%f4, %f4
	.word	0xc030a02a	! t0_kref+0x48a8:   	clrh	[%g2 + 0x2a]
	.word	0xc030a018	! t0_kref+0x48ac:   	clrh	[%g2 + 0x18]
	.word	0xaeb80000	! t0_kref+0x48b0:   	xnorcc	%g0, %g0, %l7
	.word	0x89a108c4	! t0_kref+0x48b4:   	fsubd	%f4, %f4, %f4
	.word	0x81a90a44	! t0_kref+0x48b8:   	fcmpd	%fcc0, %f4, %f4
	.word	0x89b10964	! t0_kref+0x48bc:   	fpmerge	%f4, %f4, %f4
	.word	0xc020a010	! t0_kref+0x48c0:   	clr	[%g2 + 0x10]
	.word	0xc0280018	! t0_kref+0x48c4:   	clrb	[%g0 + %i0]
	.word	0xde4e001a	! t0_kref+0x48c8:   	ldsb	[%i0 + %i2], %o7
	.word	0x81a90ac4	! t0_kref+0x48cc:   	fcmped	%fcc0, %f4, %f4
	.word	0x89a00124	! t0_kref+0x48d0:   	fabss	%f4, %f4
	.word	0x81a90aa4	! t0_kref+0x48d4:   	fcmpes	%fcc0, %f4, %f4
	.word	0xaf400000	! t0_kref+0x48d8:   	mov	%y, %l7
	.word	0x86102005	! t0_kref+0x48dc:   	mov	0x5, %g3
	.word	0x86a0e001	! t0_kref+0x48e0:   	subcc	%g3, 1, %g3
	.word	0x2280000a	! t0_kref+0x48e4:   	be,a	_kref+0x490c
	.word	0x89a10844	! t0_kref+0x48e8:   	faddd	%f4, %f4, %f4
	.word	0x89a00044	! t0_kref+0x48ec:   	fmovd	%f4, %f4
	.word	0x89a108a4	! t0_kref+0x48f0:   	fsubs	%f4, %f4, %f4
	.word	0xc030a02c	! t0_kref+0x48f4:   	clrh	[%g2 + 0x2c]
	.word	0xc020a02c	! t0_kref+0x48f8:   	clr	[%g2 + 0x2c]
	.word	0x89b00fc0	! t0_kref+0x48fc:   	fone	%f4
	.word	0x89b10ee4	! t0_kref+0x4900:   	fornot2s	%f4, %f4, %f4
	.word	0xe83e3fe0	! t0_kref+0x4904:   	std	%l4, [%i0 - 0x20]
	.word	0x89a00044	! t0_kref+0x4908:   	fmovd	%f4, %f4
	.word	0x9fc00004	! t0_kref+0x490c:   	call	%g0 + %g4
	.word	0x98000000	! t0_kref+0x4910:   	add	%g0, %g0, %o4
	call	SYM(t0_subr3)
	.word	0xc008a03c	! t0_kref+0x4918:   	ldub	[%g2 + 0x3c], %g0
	.word	0x9a0024b5	! t0_kref+0x491c:   	add	%g0, 0x4b5, %o5
	.word	0xc0266018	! t0_kref+0x4920:   	clr	[%i1 + 0x18]
	.word	0x89a10844	! t0_kref+0x4924:   	faddd	%f4, %f4, %f4
	.word	0xc9066014	! t0_kref+0x4928:   	ld	[%i1 + 0x14], %f4
	.word	0x987033b1	! t0_kref+0x492c:   	udiv	%g0, -0xc4f, %o4
	.word	0xc9066018	! t0_kref+0x4930:   	ld	[%i1 + 0x18], %f4
	.word	0x89b00fe0	! t0_kref+0x4934:   	fones	%f4
	.word	0xc807bfe4	! t0_kref+0x4938:   	ld	[%fp - 0x1c], %g4
	.word	0x81a90a24	! t0_kref+0x493c:   	fcmps	%fcc0, %f4, %f4
	.word	0xc920a02c	! t0_kref+0x4940:   	st	%f4, [%g2 + 0x2c]
	.word	0xe5f65000	! t0_kref+0x4944:   	casxa	[%i1]0x80, %g0, %l2
	.word	0xc91fbc28	! t0_kref+0x4948:   	ldd	[%fp - 0x3d8], %f4
	.word	0x90d83170	! t0_kref+0x494c:   	smulcc	%g0, -0xe90, %o0
	.word	0x89a10944	! t0_kref+0x4950:   	fmuld	%f4, %f4, %f4
	.word	0x9fc00004	! t0_kref+0x4954:   	call	%g0 + %g4
	.word	0x89b10d04	! t0_kref+0x4958:   	fandnot1	%f4, %f4, %f4
	.word	0x9e500000	! t0_kref+0x495c:   	umul	%g0, %g0, %o7
	.word	0xd64e0000	! t0_kref+0x4960:   	ldsb	[%i0], %o3
	.word	0x89a10824	! t0_kref+0x4964:   	fadds	%f4, %f4, %f4
	.word	0x81a90ac4	! t0_kref+0x4968:   	fcmped	%fcc0, %f4, %f4
	.word	0x81a90a44	! t0_kref+0x496c:   	fcmpd	%fcc0, %f4, %f4
	.word	0x89a00544	! t0_kref+0x4970:   	fsqrtd	%f4, %f4
	.word	0x9a400000	! t0_kref+0x4974:   	addc	%g0, %g0, %o5
	.word	0x89a00524	! t0_kref+0x4978:   	fsqrts	%f4, %f4
	.word	0xee50a028	! t0_kref+0x497c:   	ldsh	[%g2 + 0x28], %l7
	.word	0xc0262018	! t0_kref+0x4980:   	clr	[%i0 + 0x18]
	.word	0xe01e3ff8	! t0_kref+0x4984:   	ldd	[%i0 - 8], %l0
	.word	0x89a109a4	! t0_kref+0x4988:   	fdivs	%f4, %f4, %f4
	.word	0x89a109c4	! t0_kref+0x498c:   	fdivd	%f4, %f4, %f4
	.word	0xe41f4018	! t0_kref+0x4990:   	ldd	[%i5 + %i0], %l2
	.word	0x9de3bfa0	! t0_kref+0x4994:   	save	%sp, -0x60, %sp
	.word	0xafee0019	! t0_kref+0x4998:   	restore	%i0, %i1, %l7
	.word	0x81a90ac4	! t0_kref+0x499c:   	fcmped	%fcc0, %f4, %f4
	.word	0x81dc67c8	! t0_kref+0x49a0:   	flush	%l1 + 0x7c8
	.word	0xd03e6018	! t0_kref+0x49a4:   	std	%o0, [%i1 + 0x18]
	.word	0xc9865000	! t0_kref+0x49a8:   	lda	[%i1]0x80, %f4
	.word	0x9af032c8	! t0_kref+0x49ac:   	udivcc	%g0, -0xd38, %o5
	.word	0x97b10544	! t0_kref+0x49b0:   	fcmpeq16	%f4, %f4, %o3
	.word	0xd678a024	! t0_kref+0x49b4:   	swap	[%g2 + 0x24], %o3
	.word	0x89a00124	! t0_kref+0x49b8:   	fabss	%f4, %f4
	.word	0x99b00200	! t0_kref+0x49bc:   	array8	%g0, %g0, %o4
	.word	0xd800a010	! t0_kref+0x49c0:   	ld	[%g2 + 0x10], %o4
	.word	0x9b302014	! t0_kref+0x49c4:   	srl	%g0, 0x14, %o5
	.word	0x89a108c4	! t0_kref+0x49c8:   	fsubd	%f4, %f4, %f4
	.word	0xc028a007	! t0_kref+0x49cc:   	clrb	[%g2 + 7]
	.word	0x89b00fe0	! t0_kref+0x49d0:   	fones	%f4
	.word	0xe03e401d	! t0_kref+0x49d4:   	std	%l0, [%i1 + %i5]
	.word	0x89a00044	! t0_kref+0x49d8:   	fmovd	%f4, %f4
	.word	0xde06001c	! t0_kref+0x49dc:   	ld	[%i0 + %i4], %o7
	.word	0x9b102358	! t0_kref+0x49e0:   	taddcctv	%g0, 0x358, %o5
	.word	0x9a180000	! t0_kref+0x49e4:   	xor	%g0, %g0, %o5
	.word	0x92980000	! t0_kref+0x49e8:   	xorcc	%g0, %g0, %o1
	.word	0xde164000	! t0_kref+0x49ec:   	lduh	[%i1], %o7
	.word	0x89a109a4	! t0_kref+0x49f0:   	fdivs	%f4, %f4, %f4
	.word	0x81a90aa4	! t0_kref+0x49f4:   	fcmpes	%fcc0, %f4, %f4
	.word	0x90300000	! t0_kref+0x49f8:   	orn	%g0, %g0, %o0
	.word	0x80980000	! t0_kref+0x49fc:   	xorcc	%g0, %g0, %g0
	.word	0x89b106a4	! t0_kref+0x4a00:   	fmul8x16al	%f4, %f4, %f4
	.word	0x90980000	! t0_kref+0x4a04:   	xorcc	%g0, %g0, %o0
	.word	0x89a01a44	! t0_kref+0x4a08:   	fdtoi	%f4, %f4
	.word	0x89b10ca4	! t0_kref+0x4a0c:   	fandnot2s	%f4, %f4, %f4
	.word	0xc030a006	! t0_kref+0x4a10:   	clrh	[%g2 + 6]
	.word	0x81dcc011	! t0_kref+0x4a14:   	flush	%l3 + %l1
	.word	0x3a800006	! t0_kref+0x4a18:   	bcc,a	_kref+0x4a30
	.word	0x89a10944	! t0_kref+0x4a1c:   	fmuld	%f4, %f4, %f4
	.word	0x89a00524	! t0_kref+0x4a20:   	fsqrts	%f4, %f4
	.word	0xda40a00c	! t0_kref+0x4a24:   	ldsw	[%g2 + 0xc], %o5
	.word	0xc7ee1000	! t0_kref+0x4a28:   	prefetcha	%i0, 3
	.word	0x89a00524	! t0_kref+0x4a2c:   	fsqrts	%f4, %f4
	.word	0x89b10624	! t0_kref+0x4a30:   	fmul8x16	%f4, %f4, %f4
	.word	0xc900a028	! t0_kref+0x4a34:   	ld	[%g2 + 0x28], %f4
	.word	0x89a00544	! t0_kref+0x4a38:   	fsqrtd	%f4, %f4
	.word	0x89a10944	! t0_kref+0x4a3c:   	fmuld	%f4, %f4, %f4
	.word	0xede61000	! t0_kref+0x4a40:   	casa	[%i0]0x80, %g0, %l6
	.word	0xd8ff1019	! t0_kref+0x4a44:   	swapa	[%i4 + %i1]0x80, %o4
	.word	0xc900a018	! t0_kref+0x4a48:   	ld	[%g2 + 0x18], %f4
	.word	0x3e800002	! t0_kref+0x4a4c:   	bvc,a	_kref+0x4a54
	.word	0xd6562010	! t0_kref+0x4a50:   	ldsh	[%i0 + 0x10], %o3
	.word	0xae20255f	! t0_kref+0x4a54:   	sub	%g0, 0x55f, %l7
	.word	0xd810a006	! t0_kref+0x4a58:   	lduh	[%g2 + 6], %o4
	.word	0x30800001	! t0_kref+0x4a5c:   	ba,a	_kref+0x4a60
	.word	0xd0063fec	! t0_kref+0x4a60:   	ld	[%i0 - 0x14], %o0
	.word	0x89a00524	! t0_kref+0x4a64:   	fsqrts	%f4, %f4
	.word	0x81a90aa4	! t0_kref+0x4a68:   	fcmpes	%fcc0, %f4, %f4
	.word	0x89a00544	! t0_kref+0x4a6c:   	fsqrtd	%f4, %f4
	.word	0x89a00524	! t0_kref+0x4a70:   	fsqrts	%f4, %f4
	.word	0x89a00524	! t0_kref+0x4a74:   	fsqrts	%f4, %f4
	.word	0x38800007	! t0_kref+0x4a78:   	bgu,a	_kref+0x4a94
	.word	0x94002c68	! t0_kref+0x4a7c:   	add	%g0, 0xc68, %o2
	.word	0xc020a038	! t0_kref+0x4a80:   	clr	[%g2 + 0x38]
	.word	0xd4564000	! t0_kref+0x4a84:   	ldsh	[%i1], %o2
	.word	0x89b10c44	! t0_kref+0x4a88:   	fnor	%f4, %f4, %f4
	.word	0x30800002	! t0_kref+0x4a8c:   	ba,a	_kref+0x4a94
	.word	0x89a018c4	! t0_kref+0x4a90:   	fdtos	%f4, %f4
	.word	0xd6163fe8	! t0_kref+0x4a94:   	lduh	[%i0 - 0x18], %o3
	.word	0x001fffff	! t0_kref+0x4a98:   	illtrap	0x1fffff
	.word	0x81a90a44	! t0_kref+0x4a9c:   	fcmpd	%fcc0, %f4, %f4
	.word	0x89a10824	! t0_kref+0x4aa0:   	fadds	%f4, %f4, %f4
	.word	0xc030a000	! t0_kref+0x4aa4:   	clrh	[%g2]
	.word	0x38480005	! t0_kref+0x4aa8:   	bgu,a,pt	%icc, _kref+0x4abc
	.word	0x90c00000	! t0_kref+0x4aac:   	addccc	%g0, %g0, %o0
	.word	0xd206201c	! t0_kref+0x4ab0:   	ld	[%i0 + 0x1c], %o1
	.word	0x89a01924	! t0_kref+0x4ab4:   	fstod	%f4, %f4
	.word	0x89b10964	! t0_kref+0x4ab8:   	fpmerge	%f4, %f4, %f4
	.word	0x90400000	! t0_kref+0x4abc:   	addc	%g0, %g0, %o0
	.word	0x81a90a24	! t0_kref+0x4ac0:   	fcmps	%fcc0, %f4, %f4
	.word	0xc920a02c	! t0_kref+0x4ac4:   	st	%f4, [%g2 + 0x2c]
	.word	0x22800002	! t0_kref+0x4ac8:   	be,a	_kref+0x4ad0
	.word	0x90103104	! t0_kref+0x4acc:   	mov	0xfffff104, %o0
	.word	0x89b10a24	! t0_kref+0x4ad0:   	fpadd16s	%f4, %f4, %f4
	.word	0x89a01924	! t0_kref+0x4ad4:   	fstod	%f4, %f4
	.word	0xd6563fe8	! t0_kref+0x4ad8:   	ldsh	[%i0 - 0x18], %o3
	.word	0x81a90a24	! t0_kref+0x4adc:   	fcmps	%fcc0, %f4, %f4
	.word	0x89a00044	! t0_kref+0x4ae0:   	fmovd	%f4, %f4
	.word	0x89a01924	! t0_kref+0x4ae4:   	fstod	%f4, %f4
	.word	0xee50a00e	! t0_kref+0x4ae8:   	ldsh	[%g2 + 0xe], %l7
	.word	0xc900a004	! t0_kref+0x4aec:   	ld	[%g2 + 4], %f4
	.word	0x9ae02819	! t0_kref+0x4af0:   	subccc	%g0, 0x819, %o5
	.word	0xc91fbe60	! t0_kref+0x4af4:   	ldd	[%fp - 0x1a0], %f4
	.word	0x9af831fb	! t0_kref+0x4af8:   	sdivcc	%g0, -0xe05, %o5
	.word	0x93b00140	! t0_kref+0x4afc:   	edge32l	%g0, %g0, %o1
	.word	0x981824a5	! t0_kref+0x4b00:   	xor	%g0, 0x4a5, %o4
	.word	0x81580000	! t0_kref+0x4b04:   	flushw
	.word	0x89a10924	! t0_kref+0x4b08:   	fmuls	%f4, %f4, %f4
	.word	0xd4164000	! t0_kref+0x4b0c:   	lduh	[%i1], %o2
	.word	0x9538200b	! t0_kref+0x4b10:   	sra	%g0, 0xb, %o2
	.word	0x81302004	! t0_kref+0x4b14:   	srl	%g0, 0x4, %g0
	.word	0x89a00544	! t0_kref+0x4b18:   	fsqrtd	%f4, %f4
	.word	0x8610201b	! t0_kref+0x4b1c:   	mov	0x1b, %g3
	.word	0x86a0e001	! t0_kref+0x4b20:   	subcc	%g3, 1, %g3
	.word	0x2280000b	! t0_kref+0x4b24:   	be,a	_kref+0x4b50
	.word	0x95300000	! t0_kref+0x4b28:   	srl	%g0, %g0, %o2
	.word	0x89a01924	! t0_kref+0x4b2c:   	fstod	%f4, %f4
	.word	0x94080000	! t0_kref+0x4b30:   	and	%g0, %g0, %o2
	.word	0xd0567fec	! t0_kref+0x4b34:   	ldsh	[%i1 - 0x14], %o0
	.word	0x90402cdb	! t0_kref+0x4b38:   	addc	%g0, 0xcdb, %o0
	.word	0xc920a01c	! t0_kref+0x4b3c:   	st	%f4, [%g2 + 0x1c]
	.word	0x93418000	! t0_kref+0x4b40:   	mov	%fprs, %o1
	.word	0x97b00280	! t0_kref+0x4b44:   	array32	%g0, %g0, %o3
	.word	0x89a000a4	! t0_kref+0x4b48:   	fnegs	%f4, %f4
	.word	0x94500000	! t0_kref+0x4b4c:   	umul	%g0, %g0, %o2
	.word	0x96a83b51	! t0_kref+0x4b50:   	andncc	%g0, -0x4af, %o3
	.word	0x81a90a44	! t0_kref+0x4b54:   	fcmpd	%fcc0, %f4, %f4
	.word	0x89a10d24	! t0_kref+0x4b58:   	fsmuld	%f4, %f4, %f4
	.word	0x89b107c4	! t0_kref+0x4b5c:   	pdist	%f4, %f4, %f4
	.word	0x89a01904	! t0_kref+0x4b60:   	fitod	%f4, %f4
	.word	0xae100000	! t0_kref+0x4b64:   	clr	%l7
	.word	0x2e480005	! t0_kref+0x4b68:   	bvs,a,pt	%icc, _kref+0x4b7c
	.word	0x97b10484	! t0_kref+0x4b6c:   	fcmple32	%f4, %f4, %o3
	.word	0xee066010	! t0_kref+0x4b70:   	ld	[%i1 + 0x10], %l7
	.word	0x3e480002	! t0_kref+0x4b74:   	bvc,a,pt	%icc, _kref+0x4b7c
	.word	0x89a01924	! t0_kref+0x4b78:   	fstod	%f4, %f4
	.word	0xc9000018	! t0_kref+0x4b7c:   	ld	[%g0 + %i0], %f4
	.word	0xc030a018	! t0_kref+0x4b80:   	clrh	[%g2 + 0x18]
	.word	0xd84e0000	! t0_kref+0x4b84:   	ldsb	[%i0], %o4
	.word	0xc920a034	! t0_kref+0x4b88:   	st	%f4, [%g2 + 0x34]
	.word	0xc9a01019	! t0_kref+0x4b8c:   	sta	%f4, [%g0 + %i1]0x80
	.word	0xc93e401d	! t0_kref+0x4b90:   	std	%f4, [%i1 + %i5]
	.word	0x89b10a24	! t0_kref+0x4b94:   	fpadd16s	%f4, %f4, %f4
	.word	0x89a00524	! t0_kref+0x4b98:   	fsqrts	%f4, %f4
	.word	0xc9064000	! t0_kref+0x4b9c:   	ld	[%i1], %f4
	.word	0x98803155	! t0_kref+0x4ba0:   	addcc	%g0, -0xeab, %o4
	.word	0x89a00044	! t0_kref+0x4ba4:   	fmovd	%f4, %f4
	.word	0x89a108a4	! t0_kref+0x4ba8:   	fsubs	%f4, %f4, %f4
	.word	0x89a108a4	! t0_kref+0x4bac:   	fsubs	%f4, %f4, %f4
	.word	0xec1e6010	! t0_kref+0x4bb0:   	ldd	[%i1 + 0x10], %l6
	.word	0x90882a84	! t0_kref+0x4bb4:   	andcc	%g0, 0xa84, %o0
	.word	0xd6462010	! t0_kref+0x4bb8:   	ldsw	[%i0 + 0x10], %o3
	.word	0xe81e7fe0	! t0_kref+0x4bbc:   	ldd	[%i1 - 0x20], %l4
	.word	0x89a00544	! t0_kref+0x4bc0:   	fsqrtd	%f4, %f4
	.word	0x8610201a	! t0_kref+0x4bc4:   	mov	0x1a, %g3
	.word	0x86a0e001	! t0_kref+0x4bc8:   	subcc	%g3, 1, %g3
	.word	0x22800003	! t0_kref+0x4bcc:   	be,a	_kref+0x4bd8
	.word	0x90400000	! t0_kref+0x4bd0:   	addc	%g0, %g0, %o0
	.word	0xc048a000	! t0_kref+0x4bd4:   	ldsb	[%g2], %g0
	.word	0x9e0028c0	! t0_kref+0x4bd8:   	add	%g0, 0x8c0, %o7
	.word	0x38800007	! t0_kref+0x4bdc:   	bgu,a	_kref+0x4bf8
	.word	0x89a10824	! t0_kref+0x4be0:   	fadds	%f4, %f4, %f4
	.word	0x90a80000	! t0_kref+0x4be4:   	andncc	%g0, %g0, %o0
	.word	0x9a6027be	! t0_kref+0x4be8:   	subc	%g0, 0x7be, %o5
	.word	0xde50a032	! t0_kref+0x4bec:   	ldsh	[%g2 + 0x32], %o7
	.word	0x89a10944	! t0_kref+0x4bf0:   	fmuld	%f4, %f4, %f4
	.word	0x9e500000	! t0_kref+0x4bf4:   	umul	%g0, %g0, %o7
	.word	0x9bb00160	! t0_kref+0x4bf8:   	edge32ln	%g0, %g0, %o5
	.word	0xc028a00a	! t0_kref+0x4bfc:   	clrb	[%g2 + 0xa]
	call	SYM(t0_subr1)
	.word	0xc91e4000	! t0_kref+0x4c04:   	ldd	[%i1], %f4
	.word	0xaea838ee	! t0_kref+0x4c08:   	andncc	%g0, -0x712, %l7
	.word	0xe8380019	! t0_kref+0x4c0c:   	std	%l4, [%g0 + %i1]
	.word	0x26480004	! t0_kref+0x4c10:   	bl,a,pt	%icc, _kref+0x4c20
	.word	0x89a01a44	! t0_kref+0x4c14:   	fdtoi	%f4, %f4
	.word	0xd800a008	! t0_kref+0x4c18:   	ld	[%g2 + 8], %o4
	.word	0x89a01884	! t0_kref+0x4c1c:   	fitos	%f4, %f4
	.word	0xc920a024	! t0_kref+0x4c20:   	st	%f4, [%g2 + 0x24]
	.word	0xae300000	! t0_kref+0x4c24:   	orn	%g0, %g0, %l7
	.word	0x89a108c4	! t0_kref+0x4c28:   	fsubd	%f4, %f4, %f4
	.word	0x9ab80000	! t0_kref+0x4c2c:   	xnorcc	%g0, %g0, %o5
	.word	0xc036001b	! t0_kref+0x4c30:   	clrh	[%i0 + %i3]
	.word	0x94880000	! t0_kref+0x4c34:   	andcc	%g0, %g0, %o2
	.word	0x9a300000	! t0_kref+0x4c38:   	orn	%g0, %g0, %o5
	.word	0x816421be	! t0_kref+0x4c3c:   	movn	%icc, 0x1be, %g0
	.word	0x81a90a44	! t0_kref+0x4c40:   	fcmpd	%fcc0, %f4, %f4
	.word	0x80900000	! t0_kref+0x4c44:   	tst	%g0
	.word	0x91b00160	! t0_kref+0x4c48:   	edge32ln	%g0, %g0, %o0
	.word	0x89a01a24	! t0_kref+0x4c4c:   	fstoi	%f4, %f4
	.word	0xec1f4019	! t0_kref+0x4c50:   	ldd	[%i5 + %i1], %l6
	.word	0x20800005	! t0_kref+0x4c54:   	bn,a	_kref+0x4c68
	.word	0x89a10844	! t0_kref+0x4c58:   	faddd	%f4, %f4, %f4
	.word	0xc020a000	! t0_kref+0x4c5c:   	clr	[%g2]
	.word	0x8143c000	! t0_kref+0x4c60:   	stbar
	.word	0x89b10ac4	! t0_kref+0x4c64:   	fpsub32	%f4, %f4, %f4
	.word	0x3e800003	! t0_kref+0x4c68:   	bvc,a	_kref+0x4c74
	.word	0x89a108a4	! t0_kref+0x4c6c:   	fsubs	%f4, %f4, %f4
	.word	0x89a10824	! t0_kref+0x4c70:   	fadds	%f4, %f4, %f4
	.word	0x3a800005	! t0_kref+0x4c74:   	bcc,a	_kref+0x4c88
	.word	0x90e00000	! t0_kref+0x4c78:   	subccc	%g0, %g0, %o0
	.word	0xc0300019	! t0_kref+0x4c7c:   	clrh	[%g0 + %i1]
	.word	0xe5183638	! t0_kref+0x4c80:   	ldd	[%g0 - 0x9c8], %f18
	.word	0x81b10484	! t0_kref+0x4c84:   	fcmple32	%f4, %f4, %g0
	.word	0x9330201e	! t0_kref+0x4c88:   	srl	%g0, 0x1e, %o1
	.word	0x89a10944	! t0_kref+0x4c8c:   	fmuld	%f4, %f4, %f4
	.word	0xde86101c	! t0_kref+0x4c90:   	lda	[%i0 + %i4]0x80, %o7
	.word	0x89a00544	! t0_kref+0x4c94:   	fsqrtd	%f4, %f4
	.word	0xee00a03c	! t0_kref+0x4c98:   	ld	[%g2 + 0x3c], %l7
	.word	0x81b00000	! t0_kref+0x4c9c:   	edge8	%g0, %g0, %g0
	.word	0x81dafac1	! t0_kref+0x4ca0:   	flush	%o3 - 0x53f
	.word	0x89a108a4	! t0_kref+0x4ca4:   	fsubs	%f4, %f4, %f4
	.word	0x2e800005	! t0_kref+0x4ca8:   	bvs,a	_kref+0x4cbc
	.word	0xe83e401d	! t0_kref+0x4cac:   	std	%l4, [%i1 + %i5]
	.word	0x89b00fe0	! t0_kref+0x4cb0:   	fones	%f4
	.word	0x89a00124	! t0_kref+0x4cb4:   	fabss	%f4, %f4
	.word	0x89a018c4	! t0_kref+0x4cb8:   	fdtos	%f4, %f4
	.word	0x968022ff	! t0_kref+0x4cbc:   	addcc	%g0, 0x2ff, %o3
	.word	0xae80383b	! t0_kref+0x4cc0:   	addcc	%g0, -0x7c5, %l7
	.word	0xd01f4005	! t0_kref+0x4cc4:   	ldd	[%i5 + %g5], %o0
	.word	0xae380000	! t0_kref+0x4cc8:   	not	%g0, %l7
	.word	0x89b00fe0	! t0_kref+0x4ccc:   	fones	%f4
	.word	0x9a102cac	! t0_kref+0x4cd0:   	mov	0xcac, %o5
	.word	0x81203071	! t0_kref+0x4cd4:   	mulscc	%g0, -0xf8f, %g0
	.word	0xae080000	! t0_kref+0x4cd8:   	and	%g0, %g0, %l7
	.word	0x943025c6	! t0_kref+0x4cdc:   	orn	%g0, 0x5c6, %o2
	.word	0xc900a008	! t0_kref+0x4ce0:   	ld	[%g2 + 8], %f4
	.word	0x9b100000	! t0_kref+0x4ce4:   	taddcctv	%g0, %g0, %o5
	.word	0x3a800005	! t0_kref+0x4ce8:   	bcc,a	_kref+0x4cfc
	.word	0x93b10484	! t0_kref+0x4cec:   	fcmple32	%f4, %f4, %o1
	call	SYM(t0_subr0)
	.word	0xc920a02c	! t0_kref+0x4cf4:   	st	%f4, [%g2 + 0x2c]
	.word	0xe07e3ff0	! t0_kref+0x4cf8:   	swap	[%i0 - 0x10], %l0
	.word	0x9e502146	! t0_kref+0x4cfc:   	umul	%g0, 0x146, %o7
	.word	0xd24e3ff3	! t0_kref+0x4d00:   	ldsb	[%i0 - 0xd], %o1
	.word	0x9e600000	! t0_kref+0x4d04:   	subc	%g0, %g0, %o7
	.word	0x89a01a24	! t0_kref+0x4d08:   	fstoi	%f4, %f4
	.word	0x89a10824	! t0_kref+0x4d0c:   	fadds	%f4, %f4, %f4
	.word	0x807030e1	! t0_kref+0x4d10:   	udiv	%g0, -0xf1f, %g0
	.word	0x89a01924	! t0_kref+0x4d14:   	fstod	%f4, %f4
	.word	0x81a90a24	! t0_kref+0x4d18:   	fcmps	%fcc0, %f4, %f4
	.word	0xc030a02a	! t0_kref+0x4d1c:   	clrh	[%g2 + 0x2a]
	.word	0x89b00fe0	! t0_kref+0x4d20:   	fones	%f4
	.word	0x89a10844	! t0_kref+0x4d24:   	faddd	%f4, %f4, %f4
	.word	0x89b10de4	! t0_kref+0x4d28:   	fnands	%f4, %f4, %f4
	.word	0x89a00124	! t0_kref+0x4d2c:   	fabss	%f4, %f4
	.word	0xc906401c	! t0_kref+0x4d30:   	ld	[%i1 + %i4], %f4
	.word	0x86102014	! t0_kref+0x4d34:   	mov	0x14, %g3
	.word	0x86a0e001	! t0_kref+0x4d38:   	subcc	%g3, 1, %g3
	.word	0x2280000b	! t0_kref+0x4d3c:   	be,a	_kref+0x4d68
	.word	0xd83e7fe0	! t0_kref+0x4d40:   	std	%o4, [%i1 - 0x20]
	.word	0x89a10924	! t0_kref+0x4d44:   	fmuls	%f4, %f4, %f4
	.word	0x91b00140	! t0_kref+0x4d48:   	edge32l	%g0, %g0, %o0
	.word	0x9af83732	! t0_kref+0x4d4c:   	sdivcc	%g0, -0x8ce, %o5
	.word	0x89a10924	! t0_kref+0x4d50:   	fmuls	%f4, %f4, %f4
	.word	0x98a82c9d	! t0_kref+0x4d54:   	andncc	%g0, 0xc9d, %o4
	.word	0x965033f6	! t0_kref+0x4d58:   	umul	%g0, -0xc0a, %o3
	.word	0xafb00000	! t0_kref+0x4d5c:   	edge8	%g0, %g0, %l7
	.word	0x9ab80000	! t0_kref+0x4d60:   	xnorcc	%g0, %g0, %o5
	.word	0x94102ea4	! t0_kref+0x4d64:   	mov	0xea4, %o2
	.word	0x30800005	! t0_kref+0x4d68:   	ba,a	_kref+0x4d7c
	.word	0xc91fbd38	! t0_kref+0x4d6c:   	ldd	[%fp - 0x2c8], %f4
	.word	0x91282008	! t0_kref+0x4d70:   	sll	%g0, 0x8, %o0
	.word	0x81defe50	! t0_kref+0x4d74:   	flush	%i3 - 0x1b0
	.word	0xd0180018	! t0_kref+0x4d78:   	ldd	[%g0 + %i0], %o0
	.word	0x89a00544	! t0_kref+0x4d7c:   	fsqrtd	%f4, %f4
	.word	0x89a00124	! t0_kref+0x4d80:   	fabss	%f4, %f4
	.word	0x80e02aca	! t0_kref+0x4d84:   	subccc	%g0, 0xaca, %g0
	.word	0x81a90a44	! t0_kref+0x4d88:   	fcmpd	%fcc0, %f4, %f4
	.word	0x90200000	! t0_kref+0x4d8c:   	neg	%g0, %o0
	.word	0x90400000	! t0_kref+0x4d90:   	addc	%g0, %g0, %o0
	.word	0x89b10ac4	! t0_kref+0x4d94:   	fpsub32	%f4, %f4, %f4
	.word	0x89b10984	! t0_kref+0x4d98:   	bshuffle	%f4, %f4, %f4
	.word	0xde000019	! t0_kref+0x4d9c:   	ld	[%g0 + %i1], %o7
	.word	0x89a10924	! t0_kref+0x4da0:   	fmuls	%f4, %f4, %f4
	.word	0x89a018c4	! t0_kref+0x4da4:   	fdtos	%f4, %f4
	.word	0xc0266010	! t0_kref+0x4da8:   	clr	[%i1 + 0x10]
	.word	0xc0363ff8	! t0_kref+0x4dac:   	clrh	[%i0 - 8]
	.word	0x81a90a24	! t0_kref+0x4db0:   	fcmps	%fcc0, %f4, %f4
	.word	0x94700000	! t0_kref+0x4db4:   	udiv	%g0, %g0, %o2
	.word	0x89b00f24	! t0_kref+0x4db8:   	fsrc2s	%f4, %f4
	.word	0x3a800003	! t0_kref+0x4dbc:   	bcc,a	_kref+0x4dc8
	.word	0x9a980000	! t0_kref+0x4dc0:   	xorcc	%g0, %g0, %o5
	.word	0x89b10ea0	! t0_kref+0x4dc4:   	fsrc1s	%f4, %f4
	.word	0xd01e0000	! t0_kref+0x4dc8:   	ldd	[%i0], %o0
	.word	0xd08e9040	! t0_kref+0x4dcc:   	lduba	[%i2]0x82, %o0
	.word	0xc900a028	! t0_kref+0x4dd0:   	ld	[%g2 + 0x28], %f4
	.word	0xc030a014	! t0_kref+0x4dd4:   	clrh	[%g2 + 0x14]
	.word	0xc028a026	! t0_kref+0x4dd8:   	clrb	[%g2 + 0x26]
	.word	0xc920a02c	! t0_kref+0x4ddc:   	st	%f4, [%g2 + 0x2c]
	.word	0x92802ed3	! t0_kref+0x4de0:   	addcc	%g0, 0xed3, %o1
	.word	0xc030a004	! t0_kref+0x4de4:   	clrh	[%g2 + 4]
	.word	0x92e00000	! t0_kref+0x4de8:   	subccc	%g0, %g0, %o1
	.word	0x94d8320b	! t0_kref+0x4dec:   	smulcc	%g0, -0xdf5, %o2
	.word	0x80900000	! t0_kref+0x4df0:   	tst	%g0
	.word	0x81100000	! t0_kref+0x4df4:   	taddcctv	%g0, %g0, %g0
	.word	0x89b00fe0	! t0_kref+0x4df8:   	fones	%f4
	.word	0x2e480004	! t0_kref+0x4dfc:   	bvs,a,pt	%icc, _kref+0x4e0c
	.word	0x94103a83	! t0_kref+0x4e00:   	mov	0xfffffa83, %o2
	.word	0x89b107c4	! t0_kref+0x4e04:   	pdist	%f4, %f4, %f4
	.word	0xc91fbd78	! t0_kref+0x4e08:   	ldd	[%fp - 0x288], %f4
	.word	0x97382016	! t0_kref+0x4e0c:   	sra	%g0, 0x16, %o3
	.word	0x89a108c4	! t0_kref+0x4e10:   	fsubd	%f4, %f4, %f4
	call	SYM(t0_subr2)
	.word	0x89a00124	! t0_kref+0x4e18:   	fabss	%f4, %f4
	.word	0x90e00000	! t0_kref+0x4e1c:   	subccc	%g0, %g0, %o0
	call	SYM(_kaos_done)
	.word	0x01000000	! t0_kref+0x4e24:   	nop
	KGLOBAL(t0_ktbl_end)
t0_ktbl_end:
t0_ktbl_page_end:

KTEXT_MODULE(t0_module_subr0, 0x60222000)
.seg "text"
t0_subr0_page_begin:
	.skip 8192
.global _t0_subr0; ENTRY(t0_subr0)
	.word	0xa6844012	! t0_subr0+0x0:   	addcc	%l1, %l2, %l3
	.word	0x81c3e008	! t0_subr0+0x4:   	retl
	.word	0xaa64c014	! t0_subr0+0x8:   	subc	%l3, %l4, %l5
t0_subr0_page_end:

KTEXT_MODULE(t0_module_subr1, 0x3720e000)
.seg "text"
t0_subr1_page_begin:
	.skip 8188
.global _t0_subr1; ENTRY(t0_subr1)
	.word	0x9de3bfa0	! t0_subr1+0x0:   	save	%sp, -0x60, %sp
	.word	0xb29eaa5a	! t0_subr1+0x4:   	xorcc	%i2, 0xa5a, %i1
	.word	0x81c7e008	! t0_subr1+0x8:   	ret
	.word	0xa7ee6001	! t0_subr1+0xc:   	restore	%i1, 1, %l3
t0_subr1_page_end:

KTEXT_MODULE(t0_module_subr2, 0x41a36000)
.seg "text"
t0_subr2_page_begin:
	.skip 8180
.global _t0_subr2; ENTRY(t0_subr2)
	.word	0x9de3bfa0	! t0_subr2+0x0:   	save	%sp, -0x60, %sp
	.word	0xb2066001	! t0_subr2+0x4:   	add	%i1, 1, %i1
	.word	0x81c7e008	! t0_subr2+0x8:   	ret
	.word	0xa3ee6001	! t0_subr2+0xc:   	restore	%i1, 1, %l1
t0_subr2_page_end:

KTEXT_MODULE(t0_module_subr3, 0x41f88000)
.seg "text"
t0_subr3_page_begin:
	.skip 8188
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
!  Total operations: 4880  
!
!  Operation frequencies
!
!  name               exp    obs
!  ldsb              1.01   1.15
!  ldub              1.20   1.29
!  ldsh              1.08   0.94
!  lduh              0.59   0.51
!  ld                1.19   1.09
!  ldd               1.01   1.17
!  swap              0.37   0.39
!  ldstub            0.09   0.10
!  stb               0.51   0.59
!  sth               0.21   0.20
!  st                0.65   0.88
!  std               1.28   1.15
!  add               1.00   0.94
!  addcc             1.20   1.17
!  addx              0.94   0.98
!  addxcc            0.80   0.88
!  taddcc            0.03   0.00
!  taddcctv          0.27   0.31
!  sub               0.51   0.47
!  subcc             0.16   0.27
!  subx              0.64   0.66
!  subxcc            0.91   1.07
!  tsubcc            0.25   0.08
!  tsubcctv          0.12   0.10
!  mulscc            0.73   1.00
!  and               0.50   0.53
!  andcc             0.53   0.45
!  andn              0.06   0.08
!  andncc            1.29   1.62
!  or                1.18   1.25
!  orcc              0.67   0.53
!  orn               0.53   0.64
!  orncc             0.72   0.53
!  xor               1.10   1.02
!  xorcc             0.70   0.82
!  xnor              0.10   0.20
!  xnorcc            0.41   0.39
!  sll               0.91   1.05
!  srl               1.27   1.25
!  sra               0.16   0.14
!  unimp             0.22   0.25
!  umul              1.14   1.19
!  smul              0.15   0.14
!  udiv              0.52   0.72
!  sdiv              0.11   0.08
!  umulcc            0.53   0.59
!  smulcc            0.81   0.76
!  udivcc            0.07   0.08
!  sdivcc            1.29   1.39
!  rdy               1.28   1.35
!  wry               0.20   0.27
!  bicc              3.34   3.22
!  sethi             0.13   0.16
!  jmpl              1.12   1.15
!  call              1.27   1.19
!  ticc              0.00   0.00
!  flush             0.65   1.02
!  save              0.75   0.53
!  restore           1.34   0.00
!  stbar             0.89   0.72
!  ldf               0.76   0.82
!  lddf              0.46   0.33
!  stf               0.23   0.27
!  stdf              0.15   0.08
!  fadds             1.34   1.37
!  fsubs             1.09   1.43
!  fmuls             1.06   1.19
!  fdivs             0.42   0.27
!  faddd             1.33   1.54
!  fsubd             1.32   1.58
!  fmuld             1.07   1.07
!  fdivd             0.44   0.51
!  faddq             0.00   0.00
!  fsubq             0.00   0.00
!  fmulq             0.00   0.00
!  fdivq             0.00   0.00
!  fsmuld            0.34   0.27
!  fdmulq            0.00   0.00
!  fitos             0.23   0.23
!  fitod             0.98   1.11
!  fitoq             0.00   0.00
!  fstoi             0.43   0.47
!  fstod             1.04   1.11
!  fstoq             0.00   0.00
!  fdtoi             0.58   0.68
!  fdtos             0.66   0.49
!  fdtoq             0.00   0.00
!  fqtoi             0.00   0.00
!  fqtos             0.00   0.00
!  fqtod             0.00   0.00
!  fmovs             0.12   0.14
!  fnegs             1.24   1.37
!  fabss             1.24   1.41
!  fsqrts            1.97   1.95
!  fsqrtd            0.78   0.90
!  fsqrtq            0.00   0.00
!  fcmps             0.86   0.80
!  fcmpd             0.79   0.88
!  fcmpq             0.00   0.00
!  fcmpes            0.75   0.86
!  fcmped            0.71   0.57
!  fcmpeq            0.00   0.00
!  fbfcc             0.13   0.04
!  ldfsr             0.05   0.00
!  stfsr             0.04   0.00
!  loop              1.21   0.90
!  offset            0.06   0.08
!  area              0.19   0.18
!  target            0.21   0.33
!  goto              0.09   0.00
!  sigsegv           0.27   0.27
!  sigbus            0.15   0.12
!  imodify           0.00   0.00
!  ldfsr_offset      0.27   0.00
!  fpattern          1.02   1.29
!  lbranch           0.01   0.00
!  shmld             3.43   4.02
!  shmst             4.75   4.80
!  shmpf             0.20   0.18
!  shmswap           0.16   0.16
!  shmblkld          0.86   0.00
!  shmblkst          0.22   0.12
!  shmblkchk         0.03   0.00
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
!  casa              0.08   0.04
!  rdasi             0.11   0.08
!  wrasi             0.18   0.12
!  bpcc              1.02   1.00
!  fbpfcc            0.20   0.18
!  fmovscc           0.20   0.25
!  fmovdcc           0.21   0.25
!  fmovqcc           0.00   0.00
!  movcc             0.20   0.12
!  flushw            0.19   0.31
!  membar            0.15   0.10
!  prefetch          0.21   0.29
!  rdpc              0.09   0.06
!  ldqf              0.00   0.00
!  stqf              0.00   0.00
!  ldfa              0.23   0.18
!  lddfa             0.27   0.43
!  ldqfa             0.00   0.00
!  ldsba             0.09   0.04
!  ldsha             0.04   0.02
!  lduba             0.04   0.06
!  lduha             0.19   0.12
!  lda               0.06   0.04
!  ldda              0.25   0.29
!  ldstuba           0.19   0.23
!  prefetcha         0.82   0.76
!  stfa              0.11   0.12
!  stdfa             0.05   0.06
!  stqfa             0.00   0.00
!  stba              0.11   0.14
!  stha              0.10   0.04
!  sta               0.19   0.10
!  stda              0.16   0.06
!  swapa             0.19   0.23
!  fmovd             0.25   0.31
!  fnegd             0.20   0.08
!  fabsd             0.24   0.33
!  fstox             0.02   0.00
!  fdtox             0.12   0.14
!  fxtos             0.13   0.12
!  fxtod             0.11   0.06
!  lds               0.06   0.06
!  ldsa              0.12   0.10
!  ldx               0.17   0.20
!  ldxa              0.14   0.23
!  nofault           0.20   0.20
!  rdgsr             0.11   0.12
!  wrgsr             0.18   0.12
!  fpadd16           0.13   0.14
!  fpadd16s          0.20   0.16
!  fpadd32           0.00   0.00
!  fpadd32s          0.03   0.02
!  fpsub16           0.00   0.00
!  fpsub16s          0.21   0.16
!  fpsub32           0.20   0.25
!  fpsub32s          0.24   0.29
!  fpack16           0.15   0.27
!  fpack32           0.22   0.23
!  fpackfix          0.18   0.08
!  fexpand           0.07   0.04
!  fpmerge           0.18   0.27
!  fmul8x16          0.23   0.29
!  fmul8x16au        0.18   0.10
!  fmul8x16al        0.10   0.18
!  fmul8sux16        0.24   0.20
!  fmul8ulx16        0.09   0.08
!  fmuld8sux16       0.15   0.14
!  fmuld8ulx16       0.17   0.18
!  alignaddr         0.01   0.00
!  alignaddrl        0.14   0.08
!  faligndata        0.08   0.06
!  fzero             0.22   0.20
!  fzeros            0.13   0.16
!  fone              0.12   0.06
!  fones             0.22   0.33
!  fsrc1             0.10   0.14
!  fsrc1s            0.18   0.25
!  fsrc2             0.13   0.10
!  fsrc2s            0.17   0.10
!  fnot1             0.15   0.02
!  fnot1s            0.03   0.02
!  fnot2             0.01   0.00
!  fnot2s            0.20   0.04
!  for               0.20   0.12
!  fors              0.16   0.16
!  fnor              0.17   0.18
!  fnors             0.04   0.00
!  fand              0.05   0.04
!  fands             0.15   0.20
!  fnand             0.03   0.00
!  fnands            0.09   0.06
!  fxor              0.15   0.06
!  fxors             0.24   0.16
!  fxnor             0.13   0.16
!  fxnors            0.24   0.27
!  fornot1           0.13   0.20
!  fornot1s          0.06   0.10
!  fornot2           0.10   0.04
!  fornot2s          0.07   0.06
!  fandnot1          0.09   0.06
!  fandnot1s         0.23   0.29
!  fandnot2          0.15   0.04
!  fandnot2s         0.12   0.18
!  fcmpgt16          0.25   0.27
!  fcmpgt32          0.16   0.12
!  fcmple16          0.19   0.20
!  fcmple32          0.26   0.29
!  fcmpne16          0.01   0.02
!  fcmpne32          0.06   0.06
!  fcmpeq16          0.12   0.10
!  fcmpeq32          0.25   0.16
!  edge8             0.22   0.23
!  edge8l            0.14   0.10
!  edge16            0.09   0.08
!  edge16l           0.07   0.10
!  edge32            0.17   0.18
!  edge32l           0.23   0.37
!  pdist             0.19   0.31
!  partial_st8       0.05   0.04
!  partial_st16      0.15   0.12
!  partial_st32      0.01   0.02
!  short_st8         0.17   0.12
!  short_st16        0.23   0.29
!  short_ld8         0.01   0.02
!  short_ld16        0.00   0.00
!  blkld             0.14   0.00
!  blkst             0.19   0.00
!  blkld_offset      0.05   0.00
!  blkst_offset      0.12   0.00
!  blk_check         0.20   0.16
!  casxa             0.15   0.25
!  rdccr             0.06   0.06
!  rdfprs            0.13   0.16
!  wrccr             0.08   0.02
!  popc              0.25   0.29
!  wrfprs            0.26   0.27
!  stx               0.07   0.08
!  stxa              0.01   0.00
!  cflush            0.00   0.00
!  array8            0.17   0.27
!  array16           0.13   0.06
!  array32           0.08   0.04
!  edge8n            0.22   0.37
!  edge8ln           0.08   0.20
!  edge16n           0.18   0.25
!  edge16ln          0.05   0.02
!  edge32n           0.01   0.02
!  edge32ln          0.17   0.23
!  bmask             0.06   0.06
!  bshuffle          0.12   0.10
!  siam              0.12   0.04
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
KDATA_MODULE(t0_module_offset_table, 0x5b0aa000)
.seg "data"
t0_offset_table_start:
t0_offset_table_size:	.word	0x00000008
t0_offset_table:
	.word	0x00000000
	.word	0xffffffe0
	.word	0xfffffff0
	.word	0xfffffff8
	.word	0x00000008
	.word	0xffffffe8
	.word	0x00000018
	.word	0x00000010
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

KDATA_MODULE(t0_module_data_in_regs, 0x7d93e000)
.seg "data"
KGLOBAL(t0_data_in_regs)
t0_data_in_regs_start:
t0_data_in_regs:
	.word	0xfe9135f3          ! %f0
	.word	0x9c72e30a          ! %f1
	.word	0x9361202b          ! %f2
	.word	0x9469b1e3          ! %f3
	.word	0x5382f503          ! %f4
	.word	0xc2c0b18c          ! %f5
	.word	0xa260249c          ! %f6
	.word	0x08a4c925          ! %f7
	.word	0xa84a70d9          ! %f8
	.word	0xffb4b893          ! %f9
	.word	0xd284276d          ! %f10
	.word	0xf3c0414e          ! %f11
	.word	0x1fa098ee          ! %f12
	.word	0x3fd42ea7          ! %f13
	.word	0x42d79f4f          ! %f14
	.word	0xd36843bf          ! %f15
	.word	0x0b04906e          ! %f16
	.word	0xe84d72b6          ! %f17
	.word	0xb78d2d92          ! %f18
	.word	0x95367fe5          ! %f19
	.word	0xe2b10f1a          ! %f20
	.word	0xe9af2525          ! %f21
	.word	0x88ed43a4          ! %f22
	.word	0xe2463c66          ! %f23
	.word	0x6f0c6c6f          ! %f24
	.word	0x8bcf3e27          ! %f25
	.word	0x803a1cd7          ! %f26
	.word	0x375bc796          ! %f27
	.word	0xc36bb908          ! %f28
	.word	0x9bdcb552          ! %f29
	.word	0x26331066          ! %f30
	.word	0x622dfb2f          ! %f31
	.word	0x24a38a40          ! %f32
	.word	0xa22b8e6f          ! %f33
	.word	0xa9ec7fb9          ! %f34
	.word	0x6a17c741          ! %f35
	.word	0x50675c1b          ! %f36
	.word	0xedf45f91          ! %f37
	.word	0xe641e4e7          ! %f38
	.word	0x3462f867          ! %f39
	.word	0x6f22ad65          ! %f40
	.word	0xc73da468          ! %f41
	.word	0xec7bc57d          ! %f42
	.word	0x69bcad3b          ! %f43
	.word	0x47053a1b          ! %f44
	.word	0xb3b672d6          ! %f45
	.word	0xa41b8d7d          ! %f46
	.word	0x06772f0b          ! %f47
	.word	0xaeadf80a          ! %f48
	.word	0x07af64c3          ! %f49
	.word	0x8e5b96a9          ! %f50
	.word	0x494421cc          ! %f51
	.word	0x4676b9b6          ! %f52
	.word	0xa1d7cb2d          ! %f53
	.word	0x2011e001          ! %f54
	.word	0x4f4d3f4e          ! %f55
	.word	0xd31c9b7c          ! %f56
	.word	0xac327e82          ! %f57
	.word	0xc2883989          ! %f58
	.word	0xf84111b1          ! %f59
	.word	0x419f9efa          ! %f60
	.word	0x2016e031          ! %f61
	.word	0xbbc4e84e          ! %f62
	.word	0xbc4c6117          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0xa88       ! %g1 (code pointer)
	.word	t0_data_in_shm_area ! %g2 (shared area pointer)
	.word	0xb6cd6951          ! %g3 (loop index)
	.word	SYM(t0_subr1)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0xeba710b5          ! %o0
	.word	0xb70f84e2          ! %o1
	.word	0x4e28ed63          ! %o2
	.word	0x8511dbad          ! %o3
	.word	0x22c7c0b5          ! %o4
	.word	0xc4a7af9f          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0x14f618ae          ! %l0
	.word	0xfb47e17e          ! %l1
	.word	0x9ceb06ab          ! %l2
	.word	0xf850489a          ! %l3
	.word	0x58d6d3dd          ! %l4
	.word	0x0a742395          ! %l5
	.word	0x820a24c8          ! %l6
	.word	0x15302680          ! %l7
	.word	t0_data_in_area0    ! %i0 (area pointer)
	.word	t0_data_in_area0    ! %i1 (area pointer)
	.word	0x0000000e          ! %i2 (byte offset)
	.word	0x00000002          ! %i3 (halfword offset)
	.word	0x00000000          ! %i4 (word offset)
	.word	0x00000018          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0x08ced2d2          ! %y
	.word	0x00000008          ! %icc (nzvc)
	.word	0x800001b5          ! %fsr
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

KDATA_MODULE(t0_module_data_in_stack, 0x43e62000)
.seg "data"
KGLOBAL(t0_data_in_mtbl_size)
KGLOBAL(t0_data_in_mtbl)
KGLOBAL(t0_data_in_stack)
t0_data_in_stack_start:
	.word	0x52fd6f42
	.word	0xd1b9ff14
	.word	0xa0e2e146
	.word	0x9e810f9f
	.word	0x71470849
	.word	0x140b5b96
	.word	0x732e54d1
	.word	0x627fff81
	.word	0x86902405
	.word	0x76602b99
	.word	0xf99e93d1
	.word	0xa9ff9268
	.word	0xe4e21367
	.word	0xa267ff4c
	.word	0xa6e8ae44
	.word	0x249f3be9
	.word	0xbd35e016
	.word	0xdf3496cf
	.word	0x8d63aa3c
	.word	0xe95b9adf
	.word	0x296737b7
	.word	0x67b7262e
	.word	0xfa5baac1
	.word	0xe016e07e
	.word	0x0654476e
	.word	0xbf39648a
	.word	0x4d3620f6
	.word	0x655814a8
	.word	0x59214ba3
	.word	0x02fbda98
	.word	0xdd456b79
	.word	0xeec9cb7f
	.word	0xecbed808
	.word	0x7cc6244f
	.word	0xa62c880f
	.word	0xfe76203a
	.word	0xd93e1bdb
	.word	0xddcd19dd
	.word	0x7d99bb81
	.word	0x3447093c
	.word	0x1d6ea668
	.word	0x071e13da
	.word	0xc02953c0
	.word	0xd62f5962
	.word	0x80f56fd1
	.word	0x0bfdbebf
	.word	0x0cafe84f
	.word	0x58d2029c
	.word	0xc1c52a11
	.word	0xce9c3199
	.word	0xcf3dbce1
	.word	0xc1c26dbf
	.word	0x07dc1e3e
	.word	0xcf673bf9
	.word	0xee232a41
	.word	0xb2d1fb98
	.word	0xadac1a0e
	.word	0x4e5f1f2e
	.word	0xed583171
	.word	0x688c0343
	.word	0x4ed5319b
	.word	0xf36126b5
	.word	0xbe279d16
	.word	0x6642e1bd
	.word	0x7a24596a
	.word	0xc99ed3f0
	.word	0x44205513
	.word	0x3525eeb8
	.word	0x53531ca9
	.word	0x5aaf9116
	.word	0x5355c872
	.word	0xdb016aae
	.word	0x6515f3b8
	.word	0x3a161f6b
	.word	0xa922918b
	.word	0x2dc6ba39
	.word	0x20dafeea
	.word	0xe9f234b0
	.word	0x9e2eb85f
	.word	0x2c0c82a0
	.word	0x5773298b
	.word	0xf029fbdb
	.word	0x30ad3744
	.word	0x1d9b7bb4
	.word	0xe0fbf925
	.word	0x6fde6d0b
	.word	0x8edaa5c7
	.word	0x9b160add
	.word	0xc3008cff
	.word	0x10b8b0b5
	.word	0xa6012dcd
	.word	0x3615fb6f
	.word	0x3e2c91e6
	.word	0x4bce0223
	.word	0xf7e42efb
	.word	0x64fce842
	.word	0x21542e2f
	.word	0xefbac51f
	.word	0x49b83457
	.word	0x74692a80
	.word	0xaa4029fb
	.word	0x5a6cc2eb
	.word	0xbaf2202f
	.word	0x8d0a61c0
	.word	0xbdddd7bc
	.word	0x421fc273
	.word	0xb182b239
	.word	0xa4ade954
	.word	0xbd6680f8
	.word	0x1f8eefc5
	.word	0x6ac1cbfb
	.word	0x560ccede
	.word	0x1d0a5b4d
	.word	0x4490c6c0
	.word	0x269f176d
	.word	0xd16a1e29
	.word	0xcee749b4
	.word	0x3b7a750b
	.word	0xf3e3f3db
	.word	0x29a99635
	.word	0xc2d3ee09
	.word	0x4002e749
	.word	0x6aaccd10
	.word	0x4b741b93
	.word	0x1d0bceca
	.word	0xf92cf58a
	.word	0xcbfe40b0
	.word	0x9f807bf3
	.word	0x5351951e
	.word	0x48436304
	.word	0x5cbcb5e5
	.word	0x3b6c56fb
	.word	0x55e8a719
	.word	0x2a68a502
	.word	0x9d934b3e
	.word	0x2efa4059
	.word	0x0817a23e
	.word	0xabe7a51b
	.word	0x92c13ed3
	.word	0xdb476f1b
	.word	0x16f97a45
	.word	0x9591f2a7
	.word	0x649334ac
	.word	0xd7dc8e3d
	.word	0x3d7b401d
	.word	0x504b176f
	.word	0x9dbfff63
	.word	0x0ba28283
	.word	0x05c0d533
	.word	0xf0a803a3
	.word	0x7636cf07
	.word	0xb6fd3989
	.word	0x6b0b0ef4
	.word	0x1f84c510
	.word	0x5966ea43
	.word	0xf5dbd618
	.word	0x77de0e91
	.word	0xc3e1fd91
	.word	0xfce755be
	.word	0x0daecdba
	.word	0x32ced101
	.word	0xc17eccc6
	.word	0x59e70dc5
	.word	0xd129cb8f
	.word	0x3d4b3b4b
	.word	0x95bb2104
	.word	0x0734b627
	.word	0xbbc06c61
t0_data_in_sp:
	.word	0x53202705
	.word	0x1499a38b
	.word	0x4536e460
	.word	0xae2a27f6
	.word	0x03b53317
	.word	0x7177b3fe
	.word	0x671c67f9
	.word	0x8d2afba6
	.word	t0_data_in_area0
	.word	t0_data_in_area0
	.word	0x00000009
	.word	0x00000010
	.word	0x0000001c
	.word	0x00000008
	.word	t0_data_in_fp
	.word	0x306cbc79
	.word	0x4522d5d0
	.word	0x05c5a4c0
	.word	0x527f4589
	.word	0xb1398033
	.word	0x99ad846d
	.word	0x4473f164
	.word	0xb0473b81
	.word	0xed948ae2
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
	.word   	0x790155ad	! [%fp - 0xc]
	.word   	0x869ba27e	! [%fp - 0x8]
	.word   	0xcbff289f	! [%fp - 0x4]
.global t0_data_in_fp; t0_data_in_fp:
	.word	0x4f39d58e
	.word	0x6e0313fe
	.word	0x83e3b3a6
	.word	0x5973d1da
	.word	0xb23a1498
	.word	0x6feab173
	.word	0xc1bd5fc1
	.word	0x7d71bdd9
	.word	0x7d8acdeb
	.word	0x5b7f73e9
	.word	0x2adb444e
	.word	0xbeacb7b8
	.word	0xb9c51e72
	.word	0xa6a83f6b
	.word	0x72a6e5ff
	.word	0x84563a0b
	.word	0x3b06e2c9
	.word	0x1dcba2d7
	.word	0xe1b16a8b
	.word	0x90810622
	.word	0xa1f13736
	.word	0x84118ac1
	.word	0x3a959bc2
	.word	0xb1906b8e
t0_data_in_stacktop:
	.word	0
t0_data_in_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_in_area0, 0x14d4c000)
.seg "data"
t0_data_in_area0_start:
.skip 6656
t0_data_in_area0_begin:
	.word	0x47fa82da	! t0_data_in_area0-0x20
	.word	0x5452be96	! t0_data_in_area0-0x1c
	.word	0x9f8e87e1	! t0_data_in_area0-0x18
	.word	0x7cd603e4	! t0_data_in_area0-0x14
	.word	0x7bf98223	! t0_data_in_area0-0x10
	.word	0xaea08c04	! t0_data_in_area0-0xc
	.word	0x51675327	! t0_data_in_area0-0x8
	.word	0x9d68e6c0	! t0_data_in_area0-0x4
.global t0_data_in_area0; t0_data_in_area0:
	.word	0xd8320484	! t0_data_in_area0+0x0
	.word	0x68114499	! t0_data_in_area0+0x4
	.word	0x2d9e0ea8	! t0_data_in_area0+0x8
	.word	0xb96d9a0c	! t0_data_in_area0+0xc
	.word	0xfa835168	! t0_data_in_area0+0x10
	.word	0xce2471aa	! t0_data_in_area0+0x14
	.word	0x74dca860	! t0_data_in_area0+0x18
	.word	0x45b64282	! t0_data_in_area0+0x1c
t0_data_in_area0_end:
.skip 1472
t0_data_in_area0_stop:

KDATA_MODULE(t0_module_data_in_shm_area, 0x76e46000)
.seg "data"
t0_data_in_shm_area_start:
t0_data_in_shm_area_begin:
.global t0_data_in_shm_area; t0_data_in_shm_area:
	.word	0xbce36863	! t0_data_in_shm_area+0x0 (t0)
	.word	0xb6dbe276	! t0_data_in_shm_area+0x4 (t0)
	.word	0x6988488a	! t0_data_in_shm_area+0x8 (t0)
	.word	0xb816d86e	! t0_data_in_shm_area+0xc (t0)
	.word	0xe75190aa	! t0_data_in_shm_area+0x10 (t0)
	.word	0x08d4f88a	! t0_data_in_shm_area+0x14 (t0)
	.word	0x2158b032	! t0_data_in_shm_area+0x18 (t0)
	.word	0x4c4164b8	! t0_data_in_shm_area+0x1c (t0)
	.word	0x981debc5	! t0_data_in_shm_area+0x20 (t0)
	.word	0xc57fd666	! t0_data_in_shm_area+0x24 (t0)
	.word	0xa9ee6d09	! t0_data_in_shm_area+0x28 (t0)
	.word	0x29ba8a21	! t0_data_in_shm_area+0x2c (t0)
	.word	0xa30aff82	! t0_data_in_shm_area+0x30 (t0)
	.word	0x71485460	! t0_data_in_shm_area+0x34 (t0)
	.word	0xa877f678	! t0_data_in_shm_area+0x38 (t0)
	.word	0xdbb6decc	! t0_data_in_shm_area+0x3c (t0)
	.word	0x76a96b2c	! t0_data_in_shm_area+0x40 (t0 bload)
	.word	0x445edfc8	! t0_data_in_shm_area+0x44
	.word	0x84e307f7	! t0_data_in_shm_area+0x48
	.word	0x29b5da00	! t0_data_in_shm_area+0x4c
	.word	0xb09d3bfd	! t0_data_in_shm_area+0x50
	.word	0x090da84c	! t0_data_in_shm_area+0x54
	.word	0x2b18cc9e	! t0_data_in_shm_area+0x58
	.word	0xf1b75a2c	! t0_data_in_shm_area+0x5c
	.word	0x207f94d0	! t0_data_in_shm_area+0x60
	.word	0xc468bf9e	! t0_data_in_shm_area+0x64
	.word	0x7d98affb	! t0_data_in_shm_area+0x68
	.word	0x6735072a	! t0_data_in_shm_area+0x6c
	.word	0x35069d1a	! t0_data_in_shm_area+0x70
	.word	0xf1ee0f53	! t0_data_in_shm_area+0x74
	.word	0xd5aee826	! t0_data_in_shm_area+0x78
	.word	0x4cd914c8	! t0_data_in_shm_area+0x7c
	.word	0x8b48eb1b	! t0_data_in_shm_area+0x80 (t0 bstore)
	.word	0x1494490e	! t0_data_in_shm_area+0x84
	.word	0xcbc10d13	! t0_data_in_shm_area+0x88
	.word	0x66802983	! t0_data_in_shm_area+0x8c
	.word	0xe390dd4f	! t0_data_in_shm_area+0x90
	.word	0xe61634dd	! t0_data_in_shm_area+0x94
	.word	0xfefc5127	! t0_data_in_shm_area+0x98
	.word	0x85ac6d95	! t0_data_in_shm_area+0x9c
	.word	0x1d87972b	! t0_data_in_shm_area+0xa0
	.word	0x623a01e2	! t0_data_in_shm_area+0xa4
	.word	0x84562f0d	! t0_data_in_shm_area+0xa8
	.word	0x806c0631	! t0_data_in_shm_area+0xac
	.word	0x05c69505	! t0_data_in_shm_area+0xb0
	.word	0x15aa7d35	! t0_data_in_shm_area+0xb4
	.word	0xf289a0c9	! t0_data_in_shm_area+0xb8
	.word	0xea15810c	! t0_data_in_shm_area+0xbc
t0_data_in_shm_area_end:
t0_data_in_shm_area_stop:

KDATA_MODULE(t0_module_data_exp_regs, 0x7ad34000)
.seg "data"
KGLOBAL(t0_data_exp_regs)
t0_data_exp_regs_start:
t0_data_exp_regs:
	.word	0xfe9135f3          ! %f0
	.word	0x9c72e30a          ! %f1
	.word	0x9361202b          ! %f2
	.word	0x9469b1e3          ! %f3
	.word	0x5382f503          ! %f4
	.word	0xc2c0b18c          ! %f5
	.word	0xa260249c          ! %f6
	.word	0x08a4c925          ! %f7
	.word	0xa84a70d9          ! %f8
	.word	0xffb4b893          ! %f9
	.word	0xd284276d          ! %f10
	.word	0xf3c0414e          ! %f11
	.word	0x1fa098ee          ! %f12
	.word	0x3fd42ea7          ! %f13
	.word	0x42d79f4f          ! %f14
	.word	0xd36843bf          ! %f15
	.word	0x0b04906e          ! %f16
	.word	0xe84d72b6          ! %f17
	.word	0xb78d2d92          ! %f18
	.word	0x95367fe5          ! %f19
	.word	0xe2b10f1a          ! %f20
	.word	0xe9af2525          ! %f21
	.word	0x88ed43a4          ! %f22
	.word	0xe2463c66          ! %f23
	.word	0x6f0c6c6f          ! %f24
	.word	0x8bcf3e27          ! %f25
	.word	0x803a1cd7          ! %f26
	.word	0x375bc796          ! %f27
	.word	0xc36bb908          ! %f28
	.word	0x9bdcb552          ! %f29
	.word	0x26331066          ! %f30
	.word	0x622dfb2f          ! %f31
	.word	0x24a38a40          ! %f32
	.word	0xa22b8e6f          ! %f33
	.word	0xa9ec7fb9          ! %f34
	.word	0x6a17c741          ! %f35
	.word	0x50675c1b          ! %f36
	.word	0xedf45f91          ! %f37
	.word	0xe641e4e7          ! %f38
	.word	0x3462f867          ! %f39
	.word	0x6f22ad65          ! %f40
	.word	0xc73da468          ! %f41
	.word	0xec7bc57d          ! %f42
	.word	0x69bcad3b          ! %f43
	.word	0x47053a1b          ! %f44
	.word	0xb3b672d6          ! %f45
	.word	0xa41b8d7d          ! %f46
	.word	0x06772f0b          ! %f47
	.word	0xaeadf80a          ! %f48
	.word	0x07af64c3          ! %f49
	.word	0x8e5b96a9          ! %f50
	.word	0x494421cc          ! %f51
	.word	0x4676b9b6          ! %f52
	.word	0xa1d7cb2d          ! %f53
	.word	0x2011e001          ! %f54
	.word	0x4f4d3f4e          ! %f55
	.word	0xd31c9b7c          ! %f56
	.word	0xac327e82          ! %f57
	.word	0xc2883989          ! %f58
	.word	0xf84111b1          ! %f59
	.word	0x419f9efa          ! %f60
	.word	0x2016e031          ! %f61
	.word	0xbbc4e84e          ! %f62
	.word	0xbc4c6117          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0xa88       ! %g1 (code pointer)
	.word	t0_data_exp_shm_area! %g2 (shared area pointer)
	.word	0xb6cd6951          ! %g3 (loop index)
	.word	SYM(t0_subr1)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0xeba710b5          ! %o0
	.word	0xb70f84e2          ! %o1
	.word	0x4e28ed63          ! %o2
	.word	0x8511dbad          ! %o3
	.word	0x22c7c0b5          ! %o4
	.word	0xc4a7af9f          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0x14f618ae          ! %l0
	.word	0xfb47e17e          ! %l1
	.word	0x9ceb06ab          ! %l2
	.word	0xf850489a          ! %l3
	.word	0x58d6d3dd          ! %l4
	.word	0x0a742395          ! %l5
	.word	0x820a24c8          ! %l6
	.word	0x15302680          ! %l7
	.word	t0_data_exp_area0   ! %i0 (area pointer)
	.word	t0_data_exp_area0   ! %i1 (area pointer)
	.word	0x0000000e          ! %i2 (byte offset)
	.word	0x00000002          ! %i3 (halfword offset)
	.word	0x00000000          ! %i4 (word offset)
	.word	0x00000018          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0x08ced2d2          ! %y
	.word	0x00000008          ! %icc (nzvc)
	.word	0x800001b5          ! %fsr
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

KDATA_MODULE(t0_module_data_exp_stack, 0x65044000)
.seg "data"
KGLOBAL(t0_data_exp_mtbl_size)
KGLOBAL(t0_data_exp_mtbl)
KGLOBAL(t0_data_exp_stack)
t0_data_exp_stack_start:
	.word	0x52fd6f42
	.word	0xd1b9ff14
	.word	0xa0e2e146
	.word	0x9e810f9f
	.word	0x71470849
	.word	0x140b5b96
	.word	0x732e54d1
	.word	0x627fff81
	.word	0x86902405
	.word	0x76602b99
	.word	0xf99e93d1
	.word	0xa9ff9268
	.word	0xe4e21367
	.word	0xa267ff4c
	.word	0xa6e8ae44
	.word	0x249f3be9
	.word	0xbd35e016
	.word	0xdf3496cf
	.word	0x8d63aa3c
	.word	0xe95b9adf
	.word	0x296737b7
	.word	0x67b7262e
	.word	0xfa5baac1
	.word	0xe016e07e
	.word	0x0654476e
	.word	0xbf39648a
	.word	0x4d3620f6
	.word	0x655814a8
	.word	0x59214ba3
	.word	0x02fbda98
	.word	0xdd456b79
	.word	0xeec9cb7f
	.word	0xecbed808
	.word	0x7cc6244f
	.word	0xa62c880f
	.word	0xfe76203a
	.word	0xd93e1bdb
	.word	0xddcd19dd
	.word	0x7d99bb81
	.word	0x3447093c
	.word	0x1d6ea668
	.word	0x071e13da
	.word	0xc02953c0
	.word	0xd62f5962
	.word	0x80f56fd1
	.word	0x0bfdbebf
	.word	0x0cafe84f
	.word	0x58d2029c
	.word	0xc1c52a11
	.word	0xce9c3199
	.word	0xcf3dbce1
	.word	0xc1c26dbf
	.word	0x07dc1e3e
	.word	0xcf673bf9
	.word	0xee232a41
	.word	0xb2d1fb98
	.word	0xadac1a0e
	.word	0x4e5f1f2e
	.word	0xed583171
	.word	0x688c0343
	.word	0x4ed5319b
	.word	0xf36126b5
	.word	0xbe279d16
	.word	0x6642e1bd
	.word	0x7a24596a
	.word	0xc99ed3f0
	.word	0x44205513
	.word	0x3525eeb8
	.word	0x53531ca9
	.word	0x5aaf9116
	.word	0x5355c872
	.word	0xdb016aae
	.word	0x6515f3b8
	.word	0x3a161f6b
	.word	0xa922918b
	.word	0x2dc6ba39
	.word	0x20dafeea
	.word	0xe9f234b0
	.word	0x9e2eb85f
	.word	0x2c0c82a0
	.word	0x5773298b
	.word	0xf029fbdb
	.word	0x30ad3744
	.word	0x1d9b7bb4
	.word	0xe0fbf925
	.word	0x6fde6d0b
	.word	0x8edaa5c7
	.word	0x9b160add
	.word	0xc3008cff
	.word	0x10b8b0b5
	.word	0xa6012dcd
	.word	0x3615fb6f
	.word	0x3e2c91e6
	.word	0x4bce0223
	.word	0xf7e42efb
	.word	0x64fce842
	.word	0x21542e2f
	.word	0xefbac51f
	.word	0x49b83457
	.word	0x74692a80
	.word	0xaa4029fb
	.word	0x5a6cc2eb
	.word	0xbaf2202f
	.word	0x8d0a61c0
	.word	0xbdddd7bc
	.word	0x421fc273
	.word	0xb182b239
	.word	0xa4ade954
	.word	0xbd6680f8
	.word	0x1f8eefc5
	.word	0x6ac1cbfb
	.word	0x560ccede
	.word	0x1d0a5b4d
	.word	0x4490c6c0
	.word	0x269f176d
	.word	0xd16a1e29
	.word	0xcee749b4
	.word	0x3b7a750b
	.word	0xf3e3f3db
	.word	0x29a99635
	.word	0xc2d3ee09
	.word	0x4002e749
	.word	0x6aaccd10
	.word	0x4b741b93
	.word	0x1d0bceca
	.word	0xf92cf58a
	.word	0xcbfe40b0
	.word	0x9f807bf3
	.word	0x5351951e
	.word	0x48436304
	.word	0x5cbcb5e5
	.word	0x3b6c56fb
	.word	0x55e8a719
	.word	0x2a68a502
	.word	0x9d934b3e
	.word	0x2efa4059
	.word	0x0817a23e
	.word	0xabe7a51b
	.word	0x92c13ed3
	.word	0xdb476f1b
	.word	0x16f97a45
	.word	0x9591f2a7
	.word	0x649334ac
	.word	0xd7dc8e3d
	.word	0x3d7b401d
	.word	0x504b176f
	.word	0x9dbfff63
	.word	0x0ba28283
	.word	0x05c0d533
	.word	0xf0a803a3
	.word	0x7636cf07
	.word	0xb6fd3989
	.word	0x6b0b0ef4
	.word	0x1f84c510
	.word	0x5966ea43
	.word	0xf5dbd618
	.word	0x77de0e91
	.word	0xc3e1fd91
	.word	0xfce755be
	.word	0x0daecdba
	.word	0x32ced101
	.word	0xc17eccc6
	.word	0x59e70dc5
	.word	0xd129cb8f
	.word	0x3d4b3b4b
	.word	0x95bb2104
	.word	0x0734b627
	.word	0xbbc06c61
t0_data_exp_sp:
	.word	0x53202705
	.word	0x1499a38b
	.word	0x4536e460
	.word	0xae2a27f6
	.word	0x03b53317
	.word	0x7177b3fe
	.word	0x671c67f9
	.word	0x8d2afba6
	.word	t0_data_exp_area0
	.word	t0_data_exp_area0
	.word	0x00000009
	.word	0x00000010
	.word	0x0000001c
	.word	0x00000008
	.word	t0_data_exp_fp
	.word	0x306cbc79
	.word	0x4522d5d0
	.word	0x05c5a4c0
	.word	0x527f4589
	.word	0xb1398033
	.word	0x99ad846d
	.word	0x4473f164
	.word	0xb0473b81
	.word	0xed948ae2
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
	.word   	0x790155ad	! [%fp - 0xc]
	.word   	0x869ba27e	! [%fp - 0x8]
	.word   	0xcbff289f	! [%fp - 0x4]
t0_data_exp_fp:
	.word	0x4f39d58e
	.word	0x6e0313fe
	.word	0x83e3b3a6
	.word	0x5973d1da
	.word	0xb23a1498
	.word	0x6feab173
	.word	0xc1bd5fc1
	.word	0x7d71bdd9
	.word	0x7d8acdeb
	.word	0x5b7f73e9
	.word	0x2adb444e
	.word	0xbeacb7b8
	.word	0xb9c51e72
	.word	0xa6a83f6b
	.word	0x72a6e5ff
	.word	0x84563a0b
	.word	0x3b06e2c9
	.word	0x1dcba2d7
	.word	0xe1b16a8b
	.word	0x90810622
	.word	0xa1f13736
	.word	0x84118ac1
	.word	0x3a959bc2
	.word	0xb1906b8e
t0_data_exp_stacktop:
	.word	0
t0_data_exp_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_exp_area0, 0x26942000)
.seg "data"
t0_data_exp_area0_start:
.skip 6656
t0_data_exp_area0_begin:
	.word	0x47fa82da	! t0_data_exp_area0-0x20
	.word	0x5452be96	! t0_data_exp_area0-0x1c
	.word	0x9f8e87e1	! t0_data_exp_area0-0x18
	.word	0x7cd603e4	! t0_data_exp_area0-0x14
	.word	0x7bf98223	! t0_data_exp_area0-0x10
	.word	0xaea08c04	! t0_data_exp_area0-0xc
	.word	0x51675327	! t0_data_exp_area0-0x8
	.word	0x9d68e6c0	! t0_data_exp_area0-0x4
.global t0_data_exp_area0; t0_data_exp_area0:
	.word	0xd8320484	! t0_data_exp_area0+0x0
	.word	0x68114499	! t0_data_exp_area0+0x4
	.word	0x2d9e0ea8	! t0_data_exp_area0+0x8
	.word	0xb96d9a0c	! t0_data_exp_area0+0xc
	.word	0xfa835168	! t0_data_exp_area0+0x10
	.word	0xce2471aa	! t0_data_exp_area0+0x14
	.word	0x74dca860	! t0_data_exp_area0+0x18
	.word	0x45b64282	! t0_data_exp_area0+0x1c
t0_data_exp_area0_end:
.skip 1472
t0_data_exp_area0_stop:

KDATA_MODULE(t0_module_data_exp_shm_area, 0x2cc80000)
.seg "data"
t0_data_exp_shm_area_start:
t0_data_exp_shm_area_begin:
.global t0_data_exp_shm_area; t0_data_exp_shm_area:
	.word	0xbce36863	! t0_data_exp_shm_area+0x0 (t0)
	.word	0xb6dbe276	! t0_data_exp_shm_area+0x4 (t0)
	.word	0x6988488a	! t0_data_exp_shm_area+0x8 (t0)
	.word	0xb816d86e	! t0_data_exp_shm_area+0xc (t0)
	.word	0xe75190aa	! t0_data_exp_shm_area+0x10 (t0)
	.word	0x08d4f88a	! t0_data_exp_shm_area+0x14 (t0)
	.word	0x2158b032	! t0_data_exp_shm_area+0x18 (t0)
	.word	0x4c4164b8	! t0_data_exp_shm_area+0x1c (t0)
	.word	0x981debc5	! t0_data_exp_shm_area+0x20 (t0)
	.word	0xc57fd666	! t0_data_exp_shm_area+0x24 (t0)
	.word	0xa9ee6d09	! t0_data_exp_shm_area+0x28 (t0)
	.word	0x29ba8a21	! t0_data_exp_shm_area+0x2c (t0)
	.word	0xa30aff82	! t0_data_exp_shm_area+0x30 (t0)
	.word	0x71485460	! t0_data_exp_shm_area+0x34 (t0)
	.word	0xa877f678	! t0_data_exp_shm_area+0x38 (t0)
	.word	0xdbb6decc	! t0_data_exp_shm_area+0x3c (t0)
	.word	0x76a96b2c	! t0_data_exp_shm_area+0x40 (t0 bload)
	.word	0x445edfc8	! t0_data_exp_shm_area+0x44
	.word	0x84e307f7	! t0_data_exp_shm_area+0x48
	.word	0x29b5da00	! t0_data_exp_shm_area+0x4c
	.word	0xb09d3bfd	! t0_data_exp_shm_area+0x50
	.word	0x090da84c	! t0_data_exp_shm_area+0x54
	.word	0x2b18cc9e	! t0_data_exp_shm_area+0x58
	.word	0xf1b75a2c	! t0_data_exp_shm_area+0x5c
	.word	0x207f94d0	! t0_data_exp_shm_area+0x60
	.word	0xc468bf9e	! t0_data_exp_shm_area+0x64
	.word	0x7d98affb	! t0_data_exp_shm_area+0x68
	.word	0x6735072a	! t0_data_exp_shm_area+0x6c
	.word	0x35069d1a	! t0_data_exp_shm_area+0x70
	.word	0xf1ee0f53	! t0_data_exp_shm_area+0x74
	.word	0xd5aee826	! t0_data_exp_shm_area+0x78
	.word	0x4cd914c8	! t0_data_exp_shm_area+0x7c
	.word	0x8b48eb1b	! t0_data_exp_shm_area+0x80 (t0 bstore)
	.word	0x1494490e	! t0_data_exp_shm_area+0x84
	.word	0xcbc10d13	! t0_data_exp_shm_area+0x88
	.word	0x66802983	! t0_data_exp_shm_area+0x8c
	.word	0xe390dd4f	! t0_data_exp_shm_area+0x90
	.word	0xe61634dd	! t0_data_exp_shm_area+0x94
	.word	0xfefc5127	! t0_data_exp_shm_area+0x98
	.word	0x85ac6d95	! t0_data_exp_shm_area+0x9c
	.word	0x1d87972b	! t0_data_exp_shm_area+0xa0
	.word	0x623a01e2	! t0_data_exp_shm_area+0xa4
	.word	0x84562f0d	! t0_data_exp_shm_area+0xa8
	.word	0x806c0631	! t0_data_exp_shm_area+0xac
	.word	0x05c69505	! t0_data_exp_shm_area+0xb0
	.word	0x15aa7d35	! t0_data_exp_shm_area+0xb4
	.word	0xf289a0c9	! t0_data_exp_shm_area+0xb8
	.word	0xea15810c	! t0_data_exp_shm_area+0xbc
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



