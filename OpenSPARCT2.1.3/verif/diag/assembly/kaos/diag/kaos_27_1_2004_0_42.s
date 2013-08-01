/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: kaos_27_1_2004_0_42.s
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
#define T0_KAOS_SEED          d1e9d0832304
#define T0_KAOS_ICOUNT        2513
#define T0_KAOS_AREAS         1
#define T0_KAOS_AREASIZE      64
#define T0_KAOS_AREAOFFSET    4480
#define T0_KAOS_PAGESIZE      8192
#define T0_KAOS_CODECOUNT     2519

#define T0_KAOS_BOOT_VA                  0x13278000
#define T0_KAOS_BOOT_PA                  0x0000000001616000
#define T0_KAOS_BOOT_CACHEABLE           1
#define T0_KAOS_BOOT_NONCACHEABLE        0

#define T0_KAOS_STARTUP_VA               0x2f836000
#define T0_KAOS_STARTUP_PA               0x000000000357e000
#define T0_KAOS_STARTUP_CACHEABLE        1
#define T0_KAOS_STARTUP_NONCACHEABLE     0

#define T0_KAOS_OFFSET_TBL_VA            0x0fd12000
#define T0_KAOS_OFFSET_TBL_PA            0x0000000004096000
#define T0_KAOS_OFFSET_TBL_CACHEABLE     1
#define T0_KAOS_OFFSET_TBL_NONCACHEABLE  0

#define T0_KAOS_DONE_VA                  0x42a94000
#define T0_KAOS_DONE_PA                  0x0000000006fd4000
#define T0_KAOS_DONE_CACHEABLE           1
#define T0_KAOS_DONE_NONCACHEABLE        0

#define T0_KAOS_KTBL_VA                  0x482b4000
#define T0_KAOS_KTBL_PA                  0x0000000009174000
#define T0_KAOS_KTBL_CACHEABLE           1
#define T0_KAOS_KTBL_NONCACHEABLE        0

#define T0_KAOS_SUBR0_VA                 0x47ea0000
#define T0_KAOS_SUBR0_PA                 0x000000000b40a000
#define T0_KAOS_SUBR0_CACHEABLE          1
#define T0_KAOS_SUBR0_NONCACHEABLE       0
#define T0_KAOS_SUBR1_VA                 0x486e6000
#define T0_KAOS_SUBR1_PA                 0x000000000db8e000
#define T0_KAOS_SUBR1_CACHEABLE          1
#define T0_KAOS_SUBR1_NONCACHEABLE       0
#define T0_KAOS_SUBR2_VA                 0x47b72000
#define T0_KAOS_SUBR2_PA                 0x000000000e546000
#define T0_KAOS_SUBR2_CACHEABLE          1
#define T0_KAOS_SUBR2_NONCACHEABLE       0
#define T0_KAOS_SUBR3_VA                 0x6836a000
#define T0_KAOS_SUBR3_PA                 0x0000000010282000
#define T0_KAOS_SUBR3_CACHEABLE          1
#define T0_KAOS_SUBR3_NONCACHEABLE       0

#define T0_KAOS_EXP_REGS_VA              0x19056000
#define T0_KAOS_EXP_REGS_PA              0x0000000012b1c000
#define T0_KAOS_EXP_REGS_CACHEABLE       1
#define T0_KAOS_EXP_REGS_NONCACHEABLE    0
#define T0_KAOS_RUN_REGS_VA              0x373e0000
#define T0_KAOS_RUN_REGS_PA              0x0000000014284000
#define T0_KAOS_RUN_REGS_CACHEABLE       1
#define T0_KAOS_RUN_REGS_NONCACHEABLE    0

#define T0_KAOS_EXP_STACK_VA             0x69904000
#define T0_KAOS_EXP_STACK_PA             0x0000000016186000
#define T0_KAOS_EXP_STACK_CACHEABLE      1
#define T0_KAOS_EXP_STACK_NONCACHEABLE   0
#define T0_KAOS_RUN_STACK_VA             0x4d03c000
#define T0_KAOS_RUN_STACK_PA             0x0000000018b60000
#define T0_KAOS_RUN_STACK_CACHEABLE      1
#define T0_KAOS_RUN_STACK_NONCACHEABLE   0

#define T0_KAOS_AREA0
#define T0_KAOS_EXP_AREA0_VA             0x0d056000
#define T0_KAOS_EXP_AREA0_PA             0x000000001bd04000
#define T0_KAOS_EXP_AREA0_CACHEABLE      1
#define T0_KAOS_EXP_AREA0_NONCACHEABLE   0
#define T0_KAOS_RUN_AREA0_VA             0x15606000
#define T0_KAOS_RUN_AREA0_PA             0x000000001d8ee000
#define T0_KAOS_RUN_AREA0_CACHEABLE      1
#define T0_KAOS_RUN_AREA0_NONCACHEABLE   0

#define T0_KAOS_SHM_AREA
#define T0_KAOS_EXP_SHM_AREA_VA          0x0835e000
#define T0_KAOS_EXP_SHM_AREA_PA          0x0000000000dc2000
#define T0_KAOS_EXP_SHM_AREA_CACHEABLE   1
#define T0_KAOS_EXP_SHM_AREA_NONCACHEABLE 0
#define T0_KAOS_RUN_SHM_AREA_VA          0x553fc000
#define T0_KAOS_RUN_SHM_AREA_PA          0x0000000001736000
#define T0_KAOS_RUN_SHM_AREA_CACHEABLE   1
#define T0_KAOS_RUN_SHM_AREA_NONCACHEABLE 0

#define T0_KAOS_RANVAL_00     0xb02a1627
#define T0_KAOS_RANVAL_01     0x1f87b659
#define T0_KAOS_RANVAL_02     0xcdc53de8
#define T0_KAOS_RANVAL_03     0xffc929c7
#define T0_KAOS_RANVAL_04     0x13d5356e
#define T0_KAOS_RANVAL_05     0x0c90fc32
#define T0_KAOS_RANVAL_06     0x0370cd00
#define T0_KAOS_RANVAL_07     0x2c649381
#define T0_KAOS_RANVAL_08     0x806f6e97
#define T0_KAOS_RANVAL_09     0x320f2460
#define T0_KAOS_RANVAL_0a     0x5dc3fc7d
#define T0_KAOS_RANVAL_0b     0x1bc6f2c1
#define T0_KAOS_RANVAL_0c     0xd9a057d0
#define T0_KAOS_RANVAL_0d     0x0eb5cce1
#define T0_KAOS_RANVAL_0e     0x4354b5f4
#define T0_KAOS_RANVAL_0f     0x1bdd8f2e
#define T0_KAOS_RANVAL_10     0x522c173a
#define T0_KAOS_RANVAL_11     0x5f7569c7
#define T0_KAOS_RANVAL_12     0xaf476e40
#define T0_KAOS_RANVAL_13     0x7dbe346d
#define T0_KAOS_RANVAL_14     0x87b6a6de
#define T0_KAOS_RANVAL_15     0x9d9c6c1a
#define T0_KAOS_RANVAL_16     0x408d8c96
#define T0_KAOS_RANVAL_17     0x82450da1
#define T0_KAOS_RANVAL_18     0xeae2e3e0
#define T0_KAOS_RANVAL_19     0x57a972fc
#define T0_KAOS_RANVAL_1a     0x68baaed5
#define T0_KAOS_RANVAL_1b     0xbbb63535
#define T0_KAOS_RANVAL_1c     0xf8f6dcf5
#define T0_KAOS_RANVAL_1d     0x45aceb0e
#define T0_KAOS_RANVAL_1e     0x76f95f22
#define T0_KAOS_RANVAL_1f     0x4f81fcd8
#define T0_KAOS_RANVAL_20     0x70d21412
#define T0_KAOS_RANVAL_21     0xbf1ac012
#define T0_KAOS_RANVAL_22     0x231d0eb4
#define T0_KAOS_RANVAL_23     0x67b731c9
#define T0_KAOS_RANVAL_24     0x3099a765
#define T0_KAOS_RANVAL_25     0x22d304d2
#define T0_KAOS_RANVAL_26     0x1e5869eb
#define T0_KAOS_RANVAL_27     0x7a9ee154
#define T0_KAOS_RANVAL_28     0x47499588
#define T0_KAOS_RANVAL_29     0xcd32b53f
#define T0_KAOS_RANVAL_2a     0x17fc59a7
#define T0_KAOS_RANVAL_2b     0xfcb1619b
#define T0_KAOS_RANVAL_2c     0xec9990f4
#define T0_KAOS_RANVAL_2d     0xc16bf6dc
#define T0_KAOS_RANVAL_2e     0x361545d7
#define T0_KAOS_RANVAL_2f     0xbdcca299
#define T0_KAOS_RANVAL_30     0x259716b3
#define T0_KAOS_RANVAL_31     0x35777b5c
#define T0_KAOS_RANVAL_32     0xb1016d50
#define T0_KAOS_RANVAL_33     0x0a900b64
#define T0_KAOS_RANVAL_34     0x743dbc59
#define T0_KAOS_RANVAL_35     0xa0e6e98a
#define T0_KAOS_RANVAL_36     0x977466df
#define T0_KAOS_RANVAL_37     0x9e4267b1
#define T0_KAOS_RANVAL_38     0xd771e934
#define T0_KAOS_RANVAL_39     0xd0fa7068
#define T0_KAOS_RANVAL_3a     0x9b091fa1
#define T0_KAOS_RANVAL_3b     0x34eaa99d
#define T0_KAOS_RANVAL_3c     0xd6516ec2
#define T0_KAOS_RANVAL_3d     0x45d9e89b
#define T0_KAOS_RANVAL_3e     0x95c4ea91
#define T0_KAOS_RANVAL_3f     0xd88c83aa
#define T0_KAOS_RANVAL_40     0x4910b463
#define T0_KAOS_RANVAL_41     0xcff42805
#define T0_KAOS_RANVAL_42     0x84037562
#define T0_KAOS_RANVAL_43     0xd4061f07
#define T0_KAOS_RANVAL_44     0xf1d26a4f
#define T0_KAOS_RANVAL_45     0xff8d6bb3
#define T0_KAOS_RANVAL_46     0x4d6cb68e
#define T0_KAOS_RANVAL_47     0x0a1c7213
#define T0_KAOS_RANVAL_48     0xdc52f7c9
#define T0_KAOS_RANVAL_49     0x95affbfa
#define T0_KAOS_RANVAL_4a     0x981328ae
#define T0_KAOS_RANVAL_4b     0x8c17fb24
#define T0_KAOS_RANVAL_4c     0x73201894
#define T0_KAOS_RANVAL_4d     0x43406edc
#define T0_KAOS_RANVAL_4e     0x43e9e70c
#define T0_KAOS_RANVAL_4f     0xf92be383
#define T0_KAOS_RANVAL_50     0x87a85da6
#define T0_KAOS_RANVAL_51     0xc3292caf
#define T0_KAOS_RANVAL_52     0x27a77f76
#define T0_KAOS_RANVAL_53     0xfafdcebb
#define T0_KAOS_RANVAL_54     0x66f5851b
#define T0_KAOS_RANVAL_55     0xc5a71b00
#define T0_KAOS_RANVAL_56     0x64238d54
#define T0_KAOS_RANVAL_57     0x2c44da13
#define T0_KAOS_RANVAL_58     0xea9fdd6c
#define T0_KAOS_RANVAL_59     0x5efb91b4
#define T0_KAOS_RANVAL_5a     0x9d8a71fc
#define T0_KAOS_RANVAL_5b     0xb0da9058
#define T0_KAOS_RANVAL_5c     0x23b827e0
#define T0_KAOS_RANVAL_5d     0x4965fe70
#define T0_KAOS_RANVAL_5e     0xb3a3be45
#define T0_KAOS_RANVAL_5f     0x9b00d5df
#define T0_KAOS_RANVAL_60     0x5748ae41
#define T0_KAOS_RANVAL_61     0x7b89da3a
#define T0_KAOS_RANVAL_62     0x111d215a
#define T0_KAOS_RANVAL_63     0x044c10c9
#define T0_KAOS_RANVAL_64     0x10e57fd3
#define T0_KAOS_RANVAL_65     0x6f8bd560
#define T0_KAOS_RANVAL_66     0x5694f0d0
#define T0_KAOS_RANVAL_67     0x21d11188
#define T0_KAOS_RANVAL_68     0xcacf0981
#define T0_KAOS_RANVAL_69     0x367b5d98
#define T0_KAOS_RANVAL_6a     0x4e3c9df9
#define T0_KAOS_RANVAL_6b     0xf72a7fa2
#define T0_KAOS_RANVAL_6c     0x43a97d59
#define T0_KAOS_RANVAL_6d     0xb54be268
#define T0_KAOS_RANVAL_6e     0x999cac7a
#define T0_KAOS_RANVAL_6f     0x0ae1ceb4
#define T0_KAOS_RANVAL_70     0xf2febd3a
#define T0_KAOS_RANVAL_71     0x6ef37bc7
#define T0_KAOS_RANVAL_72     0x2188fe1a
#define T0_KAOS_RANVAL_73     0x4d03ffba
#define T0_KAOS_RANVAL_74     0xfee7bccc
#define T0_KAOS_RANVAL_75     0x307ad704
#define T0_KAOS_RANVAL_76     0xc1ed87dd
#define T0_KAOS_RANVAL_77     0x6e6ab28d
#define T0_KAOS_RANVAL_78     0xa9958eaf
#define T0_KAOS_RANVAL_79     0x1a248de7
#define T0_KAOS_RANVAL_7a     0x1508c451
#define T0_KAOS_RANVAL_7b     0x28c64bac
#define T0_KAOS_RANVAL_7c     0xe44190f6
#define T0_KAOS_RANVAL_7d     0x8a904c15
#define T0_KAOS_RANVAL_7e     0x552a7726
#define T0_KAOS_RANVAL_7f     0x64fe323e
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
!    icount         2513
!    targetid       NIAGARA:SIM
!    hostid         NIAGARA:5.8
!    areas          1
!    areasize       64
!    areaoffset     4480
!    ncache         0
!    emulate_ncache 1
!    pagesize       8192
!    invsize        0
!    codecount      2519
!    code           482b4000
!    entry          482b4000
!    fsr_exceptions 00000000
!    fsr_roundmode  00000004
!    fsr_mask       c0000fff
!    seed           d1e9d0832304
!    va_map         0000000000400000,000000007fffffff
!    pa_cached      0000000000400000,000000007fffffff
!    pa_noncached   000001ff00000000,000001ff7fffffff
!    weights        /import/n2-aus-localdir1/ntran/n2cdmspp/verif/diag/assembly/kaos/weights_files/allv9.w
!    begcount       0
!    endcount       2513
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

KTEXT_MODULE(t0_module_ktbl, 0x482b4000)
.seg "text"
	KGLOBAL(t0_ktbl)
t0_ktbl_page_begin:
.global t0_kref; t0_kref:
	.skip 0
t0_ktbl:
	.word	0xb1a54d24	! t0_kref+0x0:   	fsmuld	%f21, %f4, %f24
	.word	0x8fa0c924	! t0_kref+0x4:   	fmuls	%f3, %f4, %f7
	.word	0xc93e2010	! t0_kref+0x8:   	std	%f4, [%i0 + 0x10]
	.word	0x9de3bfa0	! t0_kref+0xc:   	save	%sp, -0x60, %sp
	.word	0x80a67465	! t0_kref+0x10:   	cmp	%i1, -0xb9b
	.word	0xadef61c2	! t0_kref+0x14:   	restore	%i5, 0x1c2, %l6
	.word	0xaaad0014	! t0_kref+0x18:   	andncc	%l4, %l4, %l5
	.word	0xaa32b5dd	! t0_kref+0x1c:   	orn	%o2, -0xa23, %l5
	.word	0xac728015	! t0_kref+0x20:   	udiv	%o2, %l5, %l6
	.word	0xaf22f51d	! t0_kref+0x24:   	mulscc	%o3, -0xae3, %l7
	.word	0x91a0012d	! t0_kref+0x28:   	fabss	%f13, %f8
	.word	0xaafd6c1d	! t0_kref+0x2c:   	sdivcc	%l5, 0xc1d, %l5
	.word	0xea167fee	! t0_kref+0x30:   	lduh	[%i1 - 0x12], %l5
	.word	0x8da188b5	! t0_kref+0x34:   	fsubs	%f6, %f21, %f6
	.word	0xec166016	! t0_kref+0x38:   	lduh	[%i1 + 0x16], %l6
	.word	0x001fffff	! t0_kref+0x3c:   	illtrap	0x1fffff
	.word	0x2a480005	! t0_kref+0x40:   	bcs,a,pt	%icc, _kref+0x54
	.word	0xec064000	! t0_kref+0x44:   	ld	[%i1], %l6
	.word	0xdb06401c	! t0_kref+0x48:   	ld	[%i1 + %i4], %f13
	.word	0xe968a00f	! t0_kref+0x4c:   	prefetch	%g2 + 0xf, 20
	.word	0x81dc8004	! t0_kref+0x50:   	flush	%l2 + %g4
	.word	0xa8d74015	! t0_kref+0x54:   	umulcc	%i5, %l5, %l4
	.word	0x28480005	! t0_kref+0x58:   	bleu,a,pt	%icc, _kref+0x6c
	.word	0xac768017	! t0_kref+0x5c:   	udiv	%i2, %l7, %l6
	.word	0xa85f4000	! t0_kref+0x60:   	smul	%i5, %g0, %l4
	.word	0x81dd3b6f	! t0_kref+0x64:   	flush	%l4 - 0x491
	.word	0xaeb5f2e1	! t0_kref+0x68:   	orncc	%l7, -0xd1f, %l7
	.word	0xf53f4018	! t0_kref+0x6c:   	std	%f26, [%i5 + %i0]
	.word	0xa60d8000	! t0_kref+0x70:   	and	%l6, %g0, %l3
	.word	0x8da54d3a	! t0_kref+0x74:   	fsmuld	%f21, %f26, %f6
	.word	0xe656c018	! t0_kref+0x78:   	ldsh	[%i3 + %i0], %l3
	.word	0xec562018	! t0_kref+0x7c:   	ldsh	[%i0 + 0x18], %l6
	.word	0x91a3084c	! t0_kref+0x80:   	faddd	%f12, %f12, %f8
	.word	0xac50001c	! t0_kref+0x84:   	umul	%g0, %i4, %l6
	.word	0xaf3f200c	! t0_kref+0x88:   	sra	%i4, 0xc, %l7
	.word	0x34480001	! t0_kref+0x8c:   	bg,a,pt	%icc, _kref+0x90
	.word	0xee564000	! t0_kref+0x90:   	ldsh	[%i1], %l7
	.word	0x86102021	! t0_kref+0x94:   	mov	0x21, %g3
	.word	0x86a0e001	! t0_kref+0x98:   	subcc	%g3, 1, %g3
	.word	0x22800004	! t0_kref+0x9c:   	be,a	_kref+0xac
	.word	0xea00a020	! t0_kref+0xa0:   	ld	[%g2 + 0x20], %l5
	.word	0x907321d3	! t0_kref+0xa4:   	udiv	%o4, 0x1d3, %o0
	.word	0x907f001c	! t0_kref+0xa8:   	sdiv	%i4, %i4, %o0
	.word	0xe46e4000	! t0_kref+0xac:   	ldstub	[%i1], %l2
	.word	0x8185c000	! t0_kref+0xb0:   	wr	%l7, %g0, %y
	.word	0xecd61000	! t0_kref+0xb4:   	ldsha	[%i0]0x80, %l6
	.word	0x8fa00136	! t0_kref+0xb8:   	fabss	%f22, %f7
	.word	0x912b4016	! t0_kref+0xbc:   	sll	%o5, %l6, %o0
	.word	0xe9b81018	! t0_kref+0xc0:   	stda	%f20, [%g0 + %i0]0x80
	.word	0xa9a28d3b	! t0_kref+0xc4:   	fsmuld	%f10, %f27, %f20
	.word	0xe600a02c	! t0_kref+0xc8:   	ld	[%g2 + 0x2c], %l3
	.word	0xf007bfe0	! t0_kref+0xcc:   	ld	[%fp - 0x20], %i0
	.word	0xd010a00e	! t0_kref+0xd0:   	lduh	[%g2 + 0xe], %o0
	.word	0x9072400c	! t0_kref+0xd4:   	udiv	%o1, %o4, %o0
	.word	0x89a0012c	! t0_kref+0xd8:   	fabss	%f12, %f4
	.word	0xa6c58009	! t0_kref+0xdc:   	addccc	%l6, %o1, %l3
	.word	0xd13f4018	! t0_kref+0xe0:   	std	%f8, [%i5 + %i0]
	.word	0xec28a014	! t0_kref+0xe4:   	stb	%l6, [%g2 + 0x14]
	.word	0x86102003	! t0_kref+0xe8:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0xec:   	bne,a	_kref+0xec
	.word	0x86a0e001	! t0_kref+0xf0:   	subcc	%g3, 1, %g3
	.word	0xb7a01885	! t0_kref+0xf4:   	fitos	%f5, %f27
	.word	0xa5a01897	! t0_kref+0xf8:   	fitos	%f23, %f18
	.word	0xec562016	! t0_kref+0xfc:   	ldsh	[%i0 + 0x16], %l6
	.word	0xaac5ec21	! t0_kref+0x100:   	addccc	%l7, 0xc21, %l5
	.word	0xaf418000	! t0_kref+0x104:   	mov	%fprs, %l7
	.word	0x91a00142	! t0_kref+0x108:   	fabsd	%f2, %f8
	.word	0x9fc10000	! t0_kref+0x10c:   	call	%g4
	.word	0xecd81019	! t0_kref+0x110:   	ldxa	[%g0 + %i1]0x80, %l6
	.word	0x24800008	! t0_kref+0x114:   	ble,a	_kref+0x134
	.word	0xacde800a	! t0_kref+0x118:   	smulcc	%i2, %o2, %l6
	.word	0xaf2b600d	! t0_kref+0x11c:   	sll	%o5, 0xd, %l7
	.word	0xad400000	! t0_kref+0x120:   	mov	%y, %l6
	.word	0x909f000a	! t0_kref+0x124:   	xorcc	%i4, %o2, %o0
	.word	0x89a01a35	! t0_kref+0x128:   	fstoi	%f21, %f4
	.word	0x91a00154	! t0_kref+0x12c:   	fabsd	%f20, %f8
	.word	0xa7400000	! t0_kref+0x130:   	mov	%y, %l3
	.word	0x81acca3a	! t0_kref+0x134:   	fcmps	%fcc0, %f19, %f26
	.word	0xdd3e4000	! t0_kref+0x138:   	std	%f14, [%i1]
	.word	0xd0567ff6	! t0_kref+0x13c:   	ldsh	[%i1 - 0xa], %o0
	.word	0x90b3401a	! t0_kref+0x140:   	orncc	%o5, %i2, %o0
	.word	0x26800002	! t0_kref+0x144:   	bl,a	_kref+0x14c
	.word	0xedee501a	! t0_kref+0x148:   	prefetcha	%i1 + %i2, 22
	.word	0xf3ee101d	! t0_kref+0x14c:   	prefetcha	%i0 + %i5, 25
	.word	0x24480002	! t0_kref+0x150:   	ble,a,pt	%icc, _kref+0x158
	.word	0xecf81018	! t0_kref+0x154:   	swapa	[%g0 + %i0]0x80, %l6
	.word	0xac7dc000	! t0_kref+0x158:   	sdiv	%l7, %g0, %l6
	.word	0xaaa2f596	! t0_kref+0x15c:   	subcc	%o3, -0xa6a, %l5
	.word	0xe800a024	! t0_kref+0x160:   	ld	[%g2 + 0x24], %l4
	.word	0x3b800001	! t0_kref+0x164:   	fble,a	_kref+0x168
	.word	0xe64e0000	! t0_kref+0x168:   	ldsb	[%i0], %l3
	.word	0xea16001b	! t0_kref+0x16c:   	lduh	[%i0 + %i3], %l5
	.word	0xaa768016	! t0_kref+0x170:   	udiv	%i2, %l6, %l5
	.word	0x91400000	! t0_kref+0x174:   	mov	%y, %o0
	.word	0xa70ec000	! t0_kref+0x178:   	tsubcc	%i3, %g0, %l3
	.word	0xa70b0017	! t0_kref+0x17c:   	tsubcc	%o4, %l7, %l3
	.word	0xa7400000	! t0_kref+0x180:   	mov	%y, %l3
	.word	0xa85d6234	! t0_kref+0x184:   	smul	%l5, 0x234, %l4
	.word	0xacda801d	! t0_kref+0x188:   	smulcc	%o2, %i5, %l6
	.word	0xaeb82dc7	! t0_kref+0x18c:   	xnorcc	%g0, 0xdc7, %l7
	.word	0xc9067ff8	! t0_kref+0x190:   	ld	[%i1 - 8], %f4
	.word	0x9fc00004	! t0_kref+0x194:   	call	%g0 + %g4
	.word	0xd43e001d	! t0_kref+0x198:   	std	%o2, [%i0 + %i5]
	.word	0x81d97fd9	! t0_kref+0x19c:   	flush	%g5 - 0x27
	.word	0xa81af5a8	! t0_kref+0x1a0:   	xor	%o3, -0xa58, %l4
	.word	0xa730200d	! t0_kref+0x1a4:   	srl	%g0, 0xd, %l3
	.word	0xaa9d4008	! t0_kref+0x1a8:   	xorcc	%l5, %o0, %l5
	.word	0x81820000	! t0_kref+0x1ac:   	wr	%o0, %g0, %y
	.word	0xab2f401c	! t0_kref+0x1b0:   	sll	%i5, %i4, %l5
	.word	0x91354009	! t0_kref+0x1b4:   	srl	%l5, %o1, %o0
	.word	0xa1a00133	! t0_kref+0x1b8:   	fabss	%f19, %f16
	.word	0x8daa0026	! t0_kref+0x1bc:   	fmovsa	%fcc0, %f6, %f6
	.word	0xd700a030	! t0_kref+0x1c0:   	ld	[%g2 + 0x30], %f11
	.word	0xd43e7fe8	! t0_kref+0x1c4:   	std	%o2, [%i1 - 0x18]
	.word	0xaa976cfc	! t0_kref+0x1c8:   	orcc	%i5, 0xcfc, %l5
	.word	0x81ae8a29	! t0_kref+0x1cc:   	fcmps	%fcc0, %f26, %f9
	.word	0xe4086200	! t0_kref+0x1d0:   	ldub	[%g1 + 0x200], %l2
	.word	0xa41ca00c	! t0_kref+0x1d4:   	xor	%l2, 0xc, %l2
	.word	0xe4286200	! t0_kref+0x1d8:   	stb	%l2, [%g1 + 0x200]
	.word	0x81d86200	! t0_kref+0x1dc:   	flush	%g1 + 0x200
	.word	0x9fc00004	! t0_kref+0x1e0:   	call	%g0 + %g4
	.word	0xd04e7fec	! t0_kref+0x1e4:   	ldsb	[%i1 - 0x14], %o0
	.word	0xaefb0017	! t0_kref+0x1e8:   	sdivcc	%o4, %l7, %l7
	.word	0xa68d000c	! t0_kref+0x1ec:   	andcc	%l4, %o4, %l3
	.word	0xad1ebb4d	! t0_kref+0x1f0:   	tsubcctv	%i2, -0x4b3, %l6
	.word	0xc700a030	! t0_kref+0x1f4:   	ld	[%g2 + 0x30], %f3
	.word	0xae55000d	! t0_kref+0x1f8:   	umul	%l4, %o5, %l7
	.word	0x90c5c000	! t0_kref+0x1fc:   	addccc	%l7, %g0, %o0
2:	.word	0xe60e001a	! t0_kref+0x200:   	ldub	[%i0 + %i2], %l3
	.word	0xad3da017	! t0_kref+0x204:   	sra	%l6, 0x17, %l6
	.word	0xefee101b	! t0_kref+0x208:   	prefetcha	%i0 + %i3, 23
	.word	0x2d480002	! t0_kref+0x20c:   	fbg,a,pt	%fcc0, _kref+0x214
	.word	0xc10f0005	! t0_kref+0x210:   	ld	[%i4 + %g5], %fsr
	.word	0x81ae8a48	! t0_kref+0x214:   	fcmpd	%fcc0, %f26, %f8
	.word	0xe64e4000	! t0_kref+0x218:   	ldsb	[%i1], %l3
	.word	0xb9a20838	! t0_kref+0x21c:   	fadds	%f8, %f24, %f28
	.word	0xd6263ff0	! t0_kref+0x220:   	st	%o3, [%i0 - 0x10]
	.word	0x858262bd	! t0_kref+0x224:   	wr	%o1, 0x2bd, %ccr
	.word	0xaf02ae8c	! t0_kref+0x228:   	taddcc	%o2, 0xe8c, %l7
	.word	0xc12e7fe8	! t0_kref+0x22c:   	st	%fsr, [%i1 - 0x18]
	.word	0x81ae0a2b	! t0_kref+0x230:   	fcmps	%fcc0, %f24, %f11
	.word	0xaba2092a	! t0_kref+0x234:   	fmuls	%f8, %f10, %f21
	.word	0x905b36b5	! t0_kref+0x238:   	smul	%o4, -0x94b, %o0
	.word	0xc36e0000	! t0_kref+0x23c:   	prefetch	%i0, 1
	.word	0xb5a34937	! t0_kref+0x240:   	fmuls	%f13, %f23, %f26
	.word	0xada80046	! t0_kref+0x244:   	fmovdn	%fcc0, %f6, %f22
	.word	0xe1e6500a	! t0_kref+0x248:   	casa	[%i1]0x80, %o2, %l0
	.word	0xa9400000	! t0_kref+0x24c:   	mov	%y, %l4
	.word	0xc168a000	! t0_kref+0x250:   	prefetch	%g2, 0
	.word	0xa63a801a	! t0_kref+0x254:   	xnor	%o2, %i2, %l3
	.word	0xad703305	! t0_kref+0x258:   	popc	-0xcfb, %l6
	.word	0x9ba0188d	! t0_kref+0x25c:   	fitos	%f13, %f13
	.word	0x81df7a45	! t0_kref+0x260:   	flush	%i5 - 0x5bb
	.word	0xaed24017	! t0_kref+0x264:   	umulcc	%o1, %l7, %l7
	.word	0x95a509ce	! t0_kref+0x268:   	fdivd	%f20, %f14, %f10
	.word	0xd828a03a	! t0_kref+0x26c:   	stb	%o4, [%g2 + 0x3a]
	.word	0xd13e6000	! t0_kref+0x270:   	std	%f8, [%i1]
	.word	0xa8aec00c	! t0_kref+0x274:   	andncc	%i3, %o4, %l4
	.word	0xa6da2fef	! t0_kref+0x278:   	smulcc	%o0, 0xfef, %l3
	call	1f
	.empty
	.word	0xa9a00535	! t0_kref+0x280:   	fsqrts	%f21, %f20
1:	.word	0x81acca2f	! t0_kref+0x284:   	fcmps	%fcc0, %f19, %f15
	.word	0xab3d6014	! t0_kref+0x288:   	sra	%l5, 0x14, %l5
	.word	0xe5267fe0	! t0_kref+0x28c:   	st	%f18, [%i1 - 0x20]
	.word	0xab400000	! t0_kref+0x290:   	mov	%y, %l5
	.word	0xec560000	! t0_kref+0x294:   	ldsh	[%i0], %l6
	.word	0xaaaee491	! t0_kref+0x298:   	andncc	%i3, 0x491, %l5
	.word	0xaaad401d	! t0_kref+0x29c:   	andncc	%l5, %i5, %l5
	call	1f
	.empty
	.word	0x11005fc7	! t0_kref+0x2a4:   	sethi	%hi(0x17f1c00), %o0
	.word	0xcf00a034	! t0_kref+0x2a8:   	ld	[%g2 + 0x34], %f7
	.word	0xd5f65009	! t0_kref+0x2ac:   	casxa	[%i1]0x80, %o1, %o2
	.word	0xb5a60852	! t0_kref+0x2b0:   	faddd	%f24, %f18, %f26
	.word	0x95a40852	! t0_kref+0x2b4:   	faddd	%f16, %f18, %f10
	.word	0xaeaaf96d	! t0_kref+0x2b8:   	andncc	%o3, -0x693, %l7
	.word	0xd906201c	! t0_kref+0x2bc:   	ld	[%i0 + 0x1c], %f12
1:	.word	0x8143c000	! t0_kref+0x2c0:   	stbar
	.word	0xae66b7c3	! t0_kref+0x2c4:   	subc	%i2, -0x83d, %l7
	.word	0x9fa648a7	! t0_kref+0x2c8:   	fsubs	%f25, %f7, %f15
	.word	0xb9a488aa	! t0_kref+0x2cc:   	fsubs	%f18, %f10, %f28
	.word	0xa5a0002b	! t0_kref+0x2d0:   	fmovs	%f11, %f18
	.word	0xa61ec009	! t0_kref+0x2d4:   	xor	%i3, %o1, %l3
	call	SYM(t0_subr0)
	.word	0xaeb5bc2b	! t0_kref+0x2dc:   	orncc	%l6, -0x3d5, %l7
	.word	0xdd270019	! t0_kref+0x2e0:   	st	%f14, [%i4 + %i1]
	.word	0xaee56348	! t0_kref+0x2e4:   	subccc	%l5, 0x348, %l7
	.word	0xacfa3b7d	! t0_kref+0x2e8:   	sdivcc	%o0, -0x483, %l6
	.word	0xd53e7fe8	! t0_kref+0x2ec:   	std	%f10, [%i1 - 0x18]
	.word	0x90024008	! t0_kref+0x2f0:   	add	%o1, %o0, %o0
	.word	0xd1be1a5b	! t0_kref+0x2f4:   	stda	%f8, [%i0 + %i3]0xd2
	.word	0x9fa00527	! t0_kref+0x2f8:   	fsqrts	%f7, %f15
	.word	0x86102001	! t0_kref+0x2fc:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x300:   	bne,a	_kref+0x300
	.word	0x86a0e001	! t0_kref+0x304:   	subcc	%g3, 1, %g3
	.word	0xeb68a08b	! t0_kref+0x308:   	prefetch	%g2 + 0x8b, 21
	.word	0x903ef4a4	! t0_kref+0x30c:   	xnor	%i3, -0xb5c, %o0
	.word	0xaf080008	! t0_kref+0x310:   	tsubcc	%g0, %o0, %l7
	.word	0xf99f1a58	! t0_kref+0x314:   	ldda	[%i4 + %i0]0xd2, %f28
	.word	0xa6f2fc13	! t0_kref+0x318:   	udivcc	%o3, -0x3ed, %l3
	.word	0xa6f68000	! t0_kref+0x31c:   	udivcc	%i2, %g0, %l3
	.word	0x8da14831	! t0_kref+0x320:   	fadds	%f5, %f17, %f6
	.word	0x38800008	! t0_kref+0x324:   	bgu,a	_kref+0x344
	.word	0xea5e7ff0	! t0_kref+0x328:   	ldx	[%i1 - 0x10], %l5
	.word	0xac068014	! t0_kref+0x32c:   	add	%i2, %l4, %l6
	.word	0x9063400b	! t0_kref+0x330:   	subc	%o5, %o3, %o0
	.word	0xf420a00c	! t0_kref+0x334:   	st	%i2, [%g2 + 0xc]
	.word	0xe9262018	! t0_kref+0x338:   	st	%f20, [%i0 + 0x18]
	.word	0xf320a018	! t0_kref+0x33c:   	st	%f25, [%g2 + 0x18]
	.word	0xac02a54d	! t0_kref+0x340:   	add	%o2, 0x54d, %l6
	.word	0x81ad0a52	! t0_kref+0x344:   	fcmpd	%fcc0, %f20, %f18
	.word	0x81db401d	! t0_kref+0x348:   	flush	%o5 + %i5
	.word	0xe1be1a1b	! t0_kref+0x34c:   	stda	%f16, [%i0 + %i3]0xd0
	.word	0xe9be1895	! t0_kref+0x350:   	stda	%f20, [%i0 + %l5]0xc4
	.word	0x9f414000	! t0_kref+0x354:   	mov	%pc, %o7
!	.word	0x2fa2ff28	! t0_kref+0x358:   	fbu,a	SYM(t0_subr2)
	   	fbu,a	SYM(t0_subr2)
	.word	0xea4e3fee	! t0_kref+0x35c:   	ldsb	[%i0 - 0x12], %l5
	.word	0x001fffff	! t0_kref+0x360:   	illtrap	0x1fffff
	.word	0xdd3e0000	! t0_kref+0x364:   	std	%f14, [%i0]
	.word	0xa8df7f32	! t0_kref+0x368:   	smulcc	%i5, -0xce, %l4
	.word	0xee066010	! t0_kref+0x36c:   	ld	[%i1 + 0x10], %l7
	.word	0x907e8000	! t0_kref+0x370:   	sdiv	%i2, %g0, %o0
	.word	0xb3a01899	! t0_kref+0x374:   	fitos	%f25, %f25
	.word	0xe47e6004	! t0_kref+0x378:   	swap	[%i1 + 4], %l2
	.word	0x81ab8aa3	! t0_kref+0x37c:   	fcmpes	%fcc0, %f14, %f3
	.word	0xdf00a03c	! t0_kref+0x380:   	ld	[%g2 + 0x3c], %f15
	.word	0xae434015	! t0_kref+0x384:   	addc	%o5, %l5, %l7
	.word	0xe168a08e	! t0_kref+0x388:   	prefetch	%g2 + 0x8e, 16
	.word	0xaeb24000	! t0_kref+0x38c:   	orncc	%o1, %g0, %l7
	.word	0xa645c015	! t0_kref+0x390:   	addc	%l7, %l5, %l3
	.word	0xe616401b	! t0_kref+0x394:   	lduh	[%i1 + %i3], %l3
	.word	0x93a00537	! t0_kref+0x398:   	fsqrts	%f23, %f9
	.word	0xe850a014	! t0_kref+0x39c:   	ldsh	[%g2 + 0x14], %l4
	.word	0x8da018da	! t0_kref+0x3a0:   	fdtos	%f26, %f6
	.word	0xb9a48854	! t0_kref+0x3a4:   	faddd	%f18, %f20, %f28
	.word	0x9042c01a	! t0_kref+0x3a8:   	addc	%o3, %i2, %o0
	.word	0xa1a68d32	! t0_kref+0x3ac:   	fsmuld	%f26, %f18, %f16
	.word	0xa5a409d4	! t0_kref+0x3b0:   	fdivd	%f16, %f20, %f18
	.word	0xa8456ab8	! t0_kref+0x3b4:   	addc	%l5, 0xab8, %l4
	.word	0x81ae0a25	! t0_kref+0x3b8:   	fcmps	%fcc0, %f24, %f5
	.word	0x8da20d36	! t0_kref+0x3bc:   	fsmuld	%f8, %f22, %f6
	.word	0xa6a83e90	! t0_kref+0x3c0:   	andncc	%g0, -0x170, %l3
	.word	0xa8d54016	! t0_kref+0x3c4:   	umulcc	%l5, %l6, %l4
	.word	0xac323410	! t0_kref+0x3c8:   	orn	%o0, -0xbf0, %l6
	.word	0xa847001b	! t0_kref+0x3cc:   	addc	%i4, %i3, %l4
	.word	0x81a94a2b	! t0_kref+0x3d0:   	fcmps	%fcc0, %f5, %f11
	.word	0xb5a01919	! t0_kref+0x3d4:   	fitod	%f25, %f26
	.word	0xaeaeb34f	! t0_kref+0x3d8:   	andncc	%i2, -0xcb1, %l7
	.word	0xa3a00538	! t0_kref+0x3dc:   	fsqrts	%f24, %f17
	.word	0xf19e1a5c	! t0_kref+0x3e0:   	ldda	[%i0 + %i4]0xd2, %f24
	.word	0xacfd000a	! t0_kref+0x3e4:   	sdivcc	%l4, %o2, %l6
	.word	0xe650a016	! t0_kref+0x3e8:   	ldsh	[%g2 + 0x16], %l3
	.word	0xec060000	! t0_kref+0x3ec:   	ld	[%i0], %l6
	.word	0xad6165d8	! t0_kref+0x3f0:   	movug	%fcc0, -0x228, %l6
	.word	0xaebdc00b	! t0_kref+0x3f4:   	xnorcc	%l7, %o3, %l7
	.word	0x90d6c01d	! t0_kref+0x3f8:   	umulcc	%i3, %i5, %o0
	.word	0xaa7f400b	! t0_kref+0x3fc:   	sdiv	%i5, %o3, %l5
	.word	0xa8fe801a	! t0_kref+0x400:   	sdivcc	%i2, %i2, %l4
	.word	0xa696b9d5	! t0_kref+0x404:   	orcc	%i2, -0x62b, %l3
	.word	0x8610201a	! t0_kref+0x408:   	mov	0x1a, %g3
	.word	0x86a0e001	! t0_kref+0x40c:   	subcc	%g3, 1, %g3
	.word	0x22800002	! t0_kref+0x410:   	be,a	_kref+0x418
	.word	0x95a0191c	! t0_kref+0x414:   	fitod	%f28, %f10
	.word	0xaca00015	! t0_kref+0x418:   	subcc	%g0, %l5, %l6
	.word	0xee20a000	! t0_kref+0x41c:   	st	%l7, [%g2]
	.word	0xa65f705f	! t0_kref+0x420:   	smul	%i5, -0xfa1, %l3
	.word	0xaea57438	! t0_kref+0x424:   	subcc	%l5, -0xbc8, %l7
	.word	0xee00a020	! t0_kref+0x428:   	ld	[%g2 + 0x20], %l7
	.word	0xf6ae9019	! t0_kref+0x42c:   	stba	%i3, [%i2 + %i1]0x80
	.word	0xea10a014	! t0_kref+0x430:   	lduh	[%g2 + 0x14], %l5
	.word	0x90602b99	! t0_kref+0x434:   	subc	%g0, 0xb99, %o0
	.word	0x8ba0052c	! t0_kref+0x438:   	fsqrts	%f12, %f5
	.word	0x85868000	! t0_kref+0x43c:   	wr	%i2, %g0, %ccr
	.word	0xac9f3ce6	! t0_kref+0x440:   	xorcc	%i4, -0x31a, %l6
	.word	0xaba208b3	! t0_kref+0x444:   	fsubs	%f8, %f19, %f21
	.word	0xd706001c	! t0_kref+0x448:   	ld	[%i0 + %i4], %f11
	.word	0x33800007	! t0_kref+0x44c:   	fbe,a	_kref+0x468
	.word	0x910d001b	! t0_kref+0x450:   	tsubcc	%l4, %i3, %o0
	.word	0x90528015	! t0_kref+0x454:   	umul	%o2, %l5, %o0
	.word	0xaebea7ca	! t0_kref+0x458:   	xnorcc	%i2, 0x7ca, %l7
	.word	0xd83e001d	! t0_kref+0x45c:   	std	%o4, [%i0 + %i5]
	.word	0xd9be5894	! t0_kref+0x460:   	stda	%f12, [%i1 + %l4]0xc4
	.word	0xaac5f3d8	! t0_kref+0x464:   	addccc	%l7, -0xc28, %l5
	.word	0xc91fbeb8	! t0_kref+0x468:   	ldd	[%fp - 0x148], %f4
	.word	0xc831401b	! t0_kref+0x46c:   	sth	%g4, [%g5 + %i3]
	.word	0xec86505c	! t0_kref+0x470:   	lda	[%i1 + %i4]0x82, %l6
	.word	0xe830a024	! t0_kref+0x474:   	sth	%l4, [%g2 + 0x24]
	.word	0xae654008	! t0_kref+0x478:   	subc	%l5, %o0, %l7
	.word	0x93a3093a	! t0_kref+0x47c:   	fmuls	%f12, %f26, %f9
	.word	0xdd1fbf50	! t0_kref+0x480:   	ldd	[%fp - 0xb0], %f14
	.word	0xd040a020	! t0_kref+0x484:   	ldsw	[%g2 + 0x20], %o0
	.word	0x878020d0	! t0_kref+0x488:   	mov	0xd0, %asi
	.word	0xaca262c4	! t0_kref+0x48c:   	subcc	%o1, 0x2c4, %l6
	.word	0x36800007	! t0_kref+0x490:   	bge,a	_kref+0x4ac
	.word	0xea4e7fe0	! t0_kref+0x494:   	ldsb	[%i1 - 0x20], %l5
	.word	0xf520a03c	! t0_kref+0x498:   	st	%f26, [%g2 + 0x3c]
	.word	0xedbe101d	! t0_kref+0x49c:   	stda	%f22, [%i0 + %i5]0x80
	.word	0xac7de788	! t0_kref+0x4a0:   	sdiv	%l7, 0x788, %l6
	.word	0xee20a01c	! t0_kref+0x4a4:   	st	%l7, [%g2 + 0x1c]
	.word	0xaad68014	! t0_kref+0x4a8:   	umulcc	%i2, %l4, %l5
	.word	0x28480001	! t0_kref+0x4ac:   	bleu,a,pt	%icc, _kref+0x4b0
	.word	0xa835b984	! t0_kref+0x4b0:   	orn	%l6, -0x67c, %l4
	.word	0xdd3e2018	! t0_kref+0x4b4:   	std	%f14, [%i0 + 0x18]
	.word	0xada01926	! t0_kref+0x4b8:   	fstod	%f6, %f22
	.word	0xac2b400b	! t0_kref+0x4bc:   	andn	%o5, %o3, %l6
	.word	0xafa01887	! t0_kref+0x4c0:   	fitos	%f7, %f23
	.word	0x99ab4056	! t0_kref+0x4c4:   	fmovdle	%fcc0, %f22, %f12
	sethi	%hi(2f), %o7
	.word	0xe40be0dc	! t0_kref+0x4cc:   	ldub	[%o7 + 0xdc], %l2
	.word	0xa41ca00c	! t0_kref+0x4d0:   	xor	%l2, 0xc, %l2
	.word	0xe42be0dc	! t0_kref+0x4d4:   	stb	%l2, [%o7 + 0xdc]
	.word	0x81dbe0dc	! t0_kref+0x4d8:   	flush	%o7 + 0xdc
2:	.word	0xa13a400d	! t0_kref+0x4dc:   	sra	%o1, %o5, %l0
	.word	0xe840a038	! t0_kref+0x4e0:   	ldsw	[%g2 + 0x38], %l4
	.word	0xae35400c	! t0_kref+0x4e4:   	orn	%l5, %o4, %l7
	.word	0x81aa0a2f	! t0_kref+0x4e8:   	fcmps	%fcc0, %f8, %f15
	.word	0xaac5c01c	! t0_kref+0x4ec:   	addccc	%l7, %i4, %l5
	.word	0xd4be1000	! t0_kref+0x4f0:   	stda	%o2, [%i0]0x80
	.word	0xe27e7ff0	! t0_kref+0x4f4:   	swap	[%i1 - 0x10], %l1
	.word	0x906360be	! t0_kref+0x4f8:   	subc	%o5, 0xbe, %o0
	.word	0x90733916	! t0_kref+0x4fc:   	udiv	%o4, -0x6ea, %o0
	.word	0x2b104472	! t0_kref+0x500:   	sethi	%hi(0x4111c800), %l5
	.word	0xa867290f	! t0_kref+0x504:   	subc	%i4, 0x90f, %l4
	.word	0x90ddfb09	! t0_kref+0x508:   	smulcc	%l7, -0x4f7, %o0
	.word	0xada5084e	! t0_kref+0x50c:   	faddd	%f20, %f14, %f22
	.word	0xaba1c9b1	! t0_kref+0x510:   	fdivs	%f7, %f17, %f21
	.word	0xa6e2755e	! t0_kref+0x514:   	subccc	%o1, -0xaa2, %l3
	.word	0xb3a00027	! t0_kref+0x518:   	fmovs	%f7, %f25
	.word	0xaeaaa387	! t0_kref+0x51c:   	andncc	%o2, 0x387, %l7
	.word	0x8585c000	! t0_kref+0x520:   	wr	%l7, %g0, %ccr
	.word	0xe86e2000	! t0_kref+0x524:   	ldstub	[%i0], %l4
	.word	0xa69f68cb	! t0_kref+0x528:   	xorcc	%i5, 0x8cb, %l3
	.word	0xae73400b	! t0_kref+0x52c:   	udiv	%o5, %o3, %l7
	.word	0x8da00124	! t0_kref+0x530:   	fabss	%f4, %f6
	.word	0xd506600c	! t0_kref+0x534:   	ld	[%i1 + 0xc], %f10
	.word	0xea100018	! t0_kref+0x538:   	lduh	[%g0 + %i0], %l5
	.word	0xea270018	! t0_kref+0x53c:   	st	%l5, [%i4 + %i0]
	.word	0xe848a021	! t0_kref+0x540:   	ldsb	[%g2 + 0x21], %l4
	.word	0xea8e5000	! t0_kref+0x544:   	lduba	[%i1]0x80, %l5
	.word	0xea6e001a	! t0_kref+0x548:   	ldstub	[%i0 + %i2], %l5
	.word	0x90580014	! t0_kref+0x54c:   	smul	%g0, %l4, %o0
	.word	0xea48a02b	! t0_kref+0x550:   	ldsb	[%g2 + 0x2b], %l5
	.word	0x9fc10000	! t0_kref+0x554:   	call	%g4
	.word	0xec4e2010	! t0_kref+0x558:   	ldsb	[%i0 + 0x10], %l6
	.word	0x9fc10000	! t0_kref+0x55c:   	call	%g4
	.word	0xee8e9019	! t0_kref+0x560:   	lduba	[%i2 + %i1]0x80, %l7
	.word	0xaea27276	! t0_kref+0x564:   	subcc	%o1, -0xd8a, %l7
	.word	0x91a18946	! t0_kref+0x568:   	fmuld	%f6, %f6, %f8
	.word	0xf300a030	! t0_kref+0x56c:   	ld	[%g2 + 0x30], %f25
	.word	0xf900a01c	! t0_kref+0x570:   	ld	[%g2 + 0x1c], %f28
	.word	0x9de3bfa0	! t0_kref+0x574:   	save	%sp, -0x60, %sp
	.word	0xb2bee933	! t0_kref+0x578:   	xnorcc	%i3, 0x933, %i1
	.word	0x91ef2095	! t0_kref+0x57c:   	restore	%i4, 0x95, %o0
	.word	0x91a00046	! t0_kref+0x580:   	fmovd	%f6, %f8
	.word	0xd05e4000	! t0_kref+0x584:   	ldx	[%i1], %o0
	.word	0xe850a006	! t0_kref+0x588:   	ldsh	[%g2 + 6], %l4
	.word	0xdbf6501c	! t0_kref+0x58c:   	casxa	[%i1]0x80, %i4, %o5
	.word	0xaa5820ac	! t0_kref+0x590:   	smul	%g0, 0xac, %l5
	.word	0xf500a018	! t0_kref+0x594:   	ld	[%g2 + 0x18], %f26
	.word	0xb1a389c4	! t0_kref+0x598:   	fdivd	%f14, %f4, %f24
	.word	0xacb2e533	! t0_kref+0x59c:   	orncc	%o3, 0x533, %l6
	.word	0xf830a016	! t0_kref+0x5a0:   	sth	%i4, [%g2 + 0x16]
	.word	0x905a33cf	! t0_kref+0x5a4:   	smul	%o0, -0xc31, %o0
	.word	0xab26a1e3	! t0_kref+0x5a8:   	mulscc	%i2, 0x1e3, %l5
	.word	0xe6080018	! t0_kref+0x5ac:   	ldub	[%g0 + %i0], %l3
	.word	0x9fc10000	! t0_kref+0x5b0:   	call	%g4
	.word	0xeb68a087	! t0_kref+0x5b4:   	prefetch	%g2 + 0x87, 21
	.word	0xe3f6501b	! t0_kref+0x5b8:   	casxa	[%i1]0x80, %i3, %l1
	.word	0xab320015	! t0_kref+0x5bc:   	srl	%o0, %l5, %l5
	.word	0x2b357cf2	! t0_kref+0x5c0:   	sethi	%hi(0xd5f3c800), %l5
	.word	0x3a800002	! t0_kref+0x5c4:   	bcc,a	_kref+0x5cc
	.word	0xa642fcda	! t0_kref+0x5c8:   	addc	%o3, -0x326, %l3
	.word	0xd056200e	! t0_kref+0x5cc:   	ldsh	[%i0 + 0xe], %o0
	.word	0xd9be588a	! t0_kref+0x5d0:   	stda	%f12, [%i1 + %o2]0xc4
	.word	0xa895ec81	! t0_kref+0x5d4:   	orcc	%l7, 0xc81, %l4
	.word	0xdd20a008	! t0_kref+0x5d8:   	st	%f14, [%g2 + 8]
	.word	0xeb68a081	! t0_kref+0x5dc:   	prefetch	%g2 + 0x81, 21
	.word	0x9fc00004	! t0_kref+0x5e0:   	call	%g0 + %g4
	.word	0xa85dc017	! t0_kref+0x5e4:   	smul	%l7, %l7, %l4
	.word	0xdb000018	! t0_kref+0x5e8:   	ld	[%g0 + %i0], %f13
	.word	0x24480001	! t0_kref+0x5ec:   	ble,a,pt	%icc, _kref+0x5f0
	.word	0xae06c01c	! t0_kref+0x5f0:   	add	%i3, %i4, %l7
	.word	0x8d87401a	! t0_kref+0x5f4:   	wr	%i5, %i2, %fprs
	.word	0x85874009	! t0_kref+0x5f8:   	wr	%i5, %o1, %ccr
	.word	0x9de3bfa0	! t0_kref+0x5fc:   	save	%sp, -0x60, %sp
	.word	0x91ef401d	! t0_kref+0x600:   	restore	%i5, %i5, %o0
	.word	0xec16600a	! t0_kref+0x604:   	lduh	[%i1 + 0xa], %l6
	.word	0x8fa509ac	! t0_kref+0x608:   	fdivs	%f20, %f12, %f7
	.word	0x9de3bfa0	! t0_kref+0x60c:   	save	%sp, -0x60, %sp
	.word	0xabeea17a	! t0_kref+0x610:   	restore	%i2, 0x17a, %l5
	.word	0x29480003	! t0_kref+0x614:   	fbl,a,pt	%fcc0, _kref+0x620
	.word	0x11007fa9	! t0_kref+0x618:   	sethi	%hi(0x1fea400), %o0
	.word	0xb9a409a9	! t0_kref+0x61c:   	fdivs	%f16, %f9, %f28
	.word	0xed68a005	! t0_kref+0x620:   	prefetch	%g2 + 5, 22
	.word	0x86102003	! t0_kref+0x624:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x628:   	bne,a	_kref+0x628
	.word	0x86a0e001	! t0_kref+0x62c:   	subcc	%g3, 1, %g3
	.word	0xa612f611	! t0_kref+0x630:   	or	%o3, -0x9ef, %l3
	.word	0xec4e2003	! t0_kref+0x634:   	ldsb	[%i0 + 3], %l6
	.word	0xaf40c000	! t0_kref+0x638:   	mov	%asi, %l7
	.word	0xa8fd7da4	! t0_kref+0x63c:   	sdivcc	%l5, -0x25c, %l4
	call	1f
	.empty
	.word	0xac2d801d	! t0_kref+0x644:   	andn	%l6, %i5, %l6
	.word	0x93a5c82b	! t0_kref+0x648:   	fadds	%f23, %f11, %f9
	.word	0xc020a028	! t0_kref+0x64c:   	clr	[%g2 + 0x28]
	.word	0xee08a005	! t0_kref+0x650:   	ldub	[%g2 + 5], %l7
	.word	0xe80e7ff9	! t0_kref+0x654:   	ldub	[%i1 - 7], %l4
	.word	0xacdd4015	! t0_kref+0x658:   	smulcc	%l5, %l5, %l6
	.word	0xb1a6c8b3	! t0_kref+0x65c:   	fsubs	%f27, %f19, %f24
	.word	0xa9a1094e	! t0_kref+0x660:   	fmuld	%f4, %f14, %f20
1:	.word	0x8143e040	! t0_kref+0x664:   	membar	0x40
	.word	0x87a0052d	! t0_kref+0x668:   	fsqrts	%f13, %f3
	.word	0xafa00133	! t0_kref+0x66c:   	fabss	%f19, %f23
	.word	0x30800002	! t0_kref+0x670:   	ba,a	_kref+0x678
	.word	0xd0166018	! t0_kref+0x674:   	lduh	[%i1 + 0x18], %o0
	.word	0xd8f81019	! t0_kref+0x678:   	swapa	[%g0 + %i1]0x80, %o4
	.word	0xd7200018	! t0_kref+0x67c:   	st	%f11, [%g0 + %i0]
	.word	0xd2a81018	! t0_kref+0x680:   	stba	%o1, [%g0 + %i0]0x80
	.word	0x2d800001	! t0_kref+0x684:   	fbg,a	_kref+0x688
	.word	0x9096b2a8	! t0_kref+0x688:   	orcc	%i2, -0xd58, %o0
	.word	0xb1a0012c	! t0_kref+0x68c:   	fabss	%f12, %f24
	.word	0xa896800b	! t0_kref+0x690:   	orcc	%i2, %o3, %l4
	.word	0x90b5400a	! t0_kref+0x694:   	orncc	%l5, %o2, %o0
	.word	0xec4e001a	! t0_kref+0x698:   	ldsb	[%i0 + %i2], %l6
	.word	0xa730201c	! t0_kref+0x69c:   	srl	%g0, 0x1c, %l3
	.word	0x90df0008	! t0_kref+0x6a0:   	smulcc	%i4, %o0, %o0
	.word	0x90e20000	! t0_kref+0x6a4:   	subccc	%o0, %g0, %o0
	.word	0xe9be1889	! t0_kref+0x6a8:   	stda	%f20, [%i0 + %o1]0xc4
	.word	0xa6be800d	! t0_kref+0x6ac:   	xnorcc	%i2, %o5, %l3
	.word	0x3e480002	! t0_kref+0x6b0:   	bvc,a,pt	%icc, _kref+0x6b8
	.word	0x95a189c2	! t0_kref+0x6b4:   	fdivd	%f6, %f2, %f10
	.word	0xa5a01908	! t0_kref+0x6b8:   	fitod	%f8, %f18
	.word	0xf500a028	! t0_kref+0x6bc:   	ld	[%g2 + 0x28], %f26
	.word	0x900ee555	! t0_kref+0x6c0:   	and	%i3, 0x555, %o0
	.word	0x81a9ca32	! t0_kref+0x6c4:   	fcmps	%fcc0, %f7, %f18
	.word	0x83c066d0	! t0_kref+0x6c8:   	jmpl	%g1 + 0x6d0, %g1
	.word	0xa83721f4	! t0_kref+0x6cc:   	orn	%i4, 0x1f4, %l4
	.word	0xb1a48d32	! t0_kref+0x6d0:   	fsmuld	%f18, %f18, %f24
	.word	0xa8a56e33	! t0_kref+0x6d4:   	subcc	%l5, 0xe33, %l4
	.word	0xb7a01a52	! t0_kref+0x6d8:   	fdtoi	%f18, %f27
	.word	0xacaac014	! t0_kref+0x6dc:   	andncc	%o3, %l4, %l6
	.word	0xa9a018c4	! t0_kref+0x6e0:   	fdtos	%f4, %f20
	.word	0x8fa01887	! t0_kref+0x6e4:   	fitos	%f7, %f7
	.word	0x81db8008	! t0_kref+0x6e8:   	flush	%sp + %o0
	.word	0x113f1b0b	! t0_kref+0x6ec:   	sethi	%hi(0xfc6c2c00), %o0
	.word	0xaf1a800a	! t0_kref+0x6f0:   	tsubcctv	%o2, %o2, %l7
	.word	0xa65f4000	! t0_kref+0x6f4:   	smul	%i5, %g0, %l3
	.word	0x878020f0	! t0_kref+0x6f8:   	mov	0xf0, %asi
	.word	0xb5a28939	! t0_kref+0x6fc:   	fmuls	%f10, %f25, %f26
	.word	0x2728e046	! t0_kref+0x700:   	sethi	%hi(0xa3811800), %l3
	.word	0xaeae8000	! t0_kref+0x704:   	andncc	%i2, %g0, %l7
	.word	0xe8166016	! t0_kref+0x708:   	lduh	[%i1 + 0x16], %l4
	.word	0x2f165a84	! t0_kref+0x70c:   	sethi	%hi(0x596a1000), %l7
	.word	0xac32001d	! t0_kref+0x710:   	orn	%o0, %i5, %l6
	.word	0x9de3bfa0	! t0_kref+0x714:   	save	%sp, -0x60, %sp
	.word	0xb0a6001c	! t0_kref+0x718:   	subcc	%i0, %i4, %i0
	.word	0xa7eea173	! t0_kref+0x71c:   	restore	%i2, 0x173, %l3
	.word	0xe810a00a	! t0_kref+0x720:   	lduh	[%g2 + 0xa], %l4
	.word	0xac9db071	! t0_kref+0x724:   	xorcc	%l6, -0xf8f, %l6
	.word	0xa8968015	! t0_kref+0x728:   	orcc	%i2, %l5, %l4
	.word	0x9ba00537	! t0_kref+0x72c:   	fsqrts	%f23, %f13
	.word	0xe6562004	! t0_kref+0x730:   	ldsh	[%i0 + 4], %l3
	.word	0x81a88ad0	! t0_kref+0x734:   	fcmped	%fcc0, %f2, %f16
	.word	0xe64e001a	! t0_kref+0x738:   	ldsb	[%i0 + %i2], %l3
	.word	0xac0b000d	! t0_kref+0x73c:   	and	%o4, %o5, %l6
	.word	0xaa570016	! t0_kref+0x740:   	umul	%i4, %l6, %l5
	.word	0xa73f201f	! t0_kref+0x744:   	sra	%i4, 0x1f, %l3
	.word	0xf720a024	! t0_kref+0x748:   	st	%f27, [%g2 + 0x24]
	.word	0xa9a089d0	! t0_kref+0x74c:   	fdivd	%f2, %f16, %f20
	.word	0x86102004	! t0_kref+0x750:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x754:   	bne,a	_kref+0x754
	.word	0x86a0e001	! t0_kref+0x758:   	subcc	%g3, 1, %g3
!	.word	0x21a2fe27	! t0_kref+0x75c:   	fbn,a	SYM(t0_subr2)
	   	fbn,a	SYM(t0_subr2)
	.word	0x9f414000	! t0_kref+0x760:   	mov	%pc, %o7
	.word	0xa5a289d2	! t0_kref+0x764:   	fdivd	%f10, %f18, %f18
	.word	0xac454000	! t0_kref+0x768:   	addc	%l5, %g0, %l6
	.word	0x9fc10000	! t0_kref+0x76c:   	call	%g4
	.word	0x90777baf	! t0_kref+0x770:   	udiv	%i5, -0x451, %o0
	.word	0xa85a6547	! t0_kref+0x774:   	smul	%o1, 0x547, %l4
	.word	0xaa0b401a	! t0_kref+0x778:   	and	%o5, %i2, %l5
	.word	0xf820a034	! t0_kref+0x77c:   	st	%i4, [%g2 + 0x34]
	.word	0xff6e001b	! t0_kref+0x780:   	prefetch	%i0 + %i3, 31
	.word	0x2d1c46e2	! t0_kref+0x784:   	sethi	%hi(0x711b8800), %l6
	.word	0xab3de008	! t0_kref+0x788:   	sra	%l7, 0x8, %l5
	.word	0xa6bd65a6	! t0_kref+0x78c:   	xnorcc	%l5, 0x5a6, %l3
	.word	0x99a01895	! t0_kref+0x790:   	fitos	%f21, %f12
	.word	0x86102016	! t0_kref+0x794:   	mov	0x16, %g3
	.word	0x86a0e001	! t0_kref+0x798:   	subcc	%g3, 1, %g3
	.word	0x2280001d	! t0_kref+0x79c:   	be,a	_kref+0x810
	.word	0xee580018	! t0_kref+0x7a0:   	ldx	[%g0 + %i0], %l7
	.word	0xa705c015	! t0_kref+0x7a4:   	taddcc	%l7, %l5, %l3
	.word	0xd828a030	! t0_kref+0x7a8:   	stb	%o4, [%g2 + 0x30]
	.word	0xaea6fab4	! t0_kref+0x7ac:   	subcc	%i3, -0x54c, %l7
	.word	0xd9e6101d	! t0_kref+0x7b0:   	casa	[%i0]0x80, %i5, %o4
	.word	0x2727e160	! t0_kref+0x7b4:   	sethi	%hi(0x9f858000), %l3
	.word	0xe8d81019	! t0_kref+0x7b8:   	ldxa	[%g0 + %i1]0x80, %l4
	.word	0xee40a028	! t0_kref+0x7bc:   	ldsw	[%g2 + 0x28], %l7
	.word	0xf7067fe8	! t0_kref+0x7c0:   	ld	[%i1 - 0x18], %f27
	.word	0xee163fe6	! t0_kref+0x7c4:   	lduh	[%i0 - 0x1a], %l7
	.word	0xdd20a02c	! t0_kref+0x7c8:   	st	%f14, [%g2 + 0x2c]
	.word	0x9f414000	! t0_kref+0x7cc:   	mov	%pc, %o7
	.word	0x99a189ce	! t0_kref+0x7d0:   	fdivd	%f6, %f14, %f12
	.word	0xf630a030	! t0_kref+0x7d4:   	sth	%i3, [%g2 + 0x30]
	.word	0x91a00536	! t0_kref+0x7d8:   	fsqrts	%f22, %f8
	.word	0xa62ac008	! t0_kref+0x7dc:   	andn	%o3, %o0, %l3
	.word	0xa5a409cc	! t0_kref+0x7e0:   	fdivd	%f16, %f12, %f18
	.word	0x87a3c92e	! t0_kref+0x7e4:   	fmuls	%f15, %f14, %f3
	.word	0xc5bf5018	! t0_kref+0x7e8:   	stda	%f2, [%i5 + %i0]0x80
	.word	0xaa2d000a	! t0_kref+0x7ec:   	andn	%l4, %o2, %l5
	.word	0x909f7cb9	! t0_kref+0x7f0:   	xorcc	%i5, -0x347, %o0
	.word	0xeb68a00d	! t0_kref+0x7f4:   	prefetch	%g2 + 0xd, 21
	.word	0xa6a56e1a	! t0_kref+0x7f8:   	subcc	%l5, 0xe1a, %l3
	.word	0xdd3e2008	! t0_kref+0x7fc:   	std	%f14, [%i0 + 8]
	.word	0xd9871018	! t0_kref+0x800:   	lda	[%i4 + %i0]0x80, %f12
	.word	0x97a01a58	! t0_kref+0x804:   	fdtoi	%f24, %f11
	.word	0xad070017	! t0_kref+0x808:   	taddcc	%i4, %l7, %l6
	.word	0x2e800004	! t0_kref+0x80c:   	bvs,a	_kref+0x81c
	.word	0xf420a030	! t0_kref+0x810:   	st	%i2, [%g2 + 0x30]
	.word	0xfb6e2010	! t0_kref+0x814:   	prefetch	%i0 + 0x10, 29
	.word	0x81df8000	! t0_kref+0x818:   	flush	%fp
	.word	0xa1a5894c	! t0_kref+0x81c:   	fmuld	%f22, %f12, %f16
	.word	0xa1a389d8	! t0_kref+0x820:   	fdivd	%f14, %f24, %f16
	.word	0xafa000b8	! t0_kref+0x824:   	fnegs	%f24, %f23
	.word	0xa1a00144	! t0_kref+0x828:   	fabsd	%f4, %f16
	.word	0xb1a609d2	! t0_kref+0x82c:   	fdivd	%f24, %f18, %f24
	.word	0xb5a6c9b0	! t0_kref+0x830:   	fdivs	%f27, %f16, %f26
	.word	0xa1a0190b	! t0_kref+0x834:   	fitod	%f11, %f16
	.word	0x9de3bfa0	! t0_kref+0x838:   	save	%sp, -0x60, %sp
	.word	0xade821b0	! t0_kref+0x83c:   	restore	%g0, 0x1b0, %l6
	.word	0xac32e187	! t0_kref+0x840:   	orn	%o3, 0x187, %l6
	.word	0xaf3d6003	! t0_kref+0x844:   	sra	%l5, 0x3, %l7
	.word	0x9de3bfa0	! t0_kref+0x848:   	save	%sp, -0x60, %sp
	.word	0xade80019	! t0_kref+0x84c:   	restore	%g0, %i1, %l6
	.word	0xb1a309dc	! t0_kref+0x850:   	fdivd	%f12, %f28, %f24
	.word	0xf1bf1a58	! t0_kref+0x854:   	stda	%f24, [%i4 + %i0]0xd2
	.word	0x9055fae7	! t0_kref+0x858:   	umul	%l7, -0x519, %o0
	.word	0xb3a00530	! t0_kref+0x85c:   	fsqrts	%f16, %f25
	.word	0x81ac8a4c	! t0_kref+0x860:   	fcmpd	%fcc0, %f18, %f12
	.word	0xea064000	! t0_kref+0x864:   	ld	[%i1], %l5
	.word	0xe538001d	! t0_kref+0x868:   	std	%f18, [%g0 + %i5]
	.word	0x8143e040	! t0_kref+0x86c:   	membar	0x40
	.word	0x85a01904	! t0_kref+0x870:   	fitod	%f4, %f2
	.word	0xe40861e8	! t0_kref+0x874:   	ldub	[%g1 + 0x1e8], %l2
	.word	0xa41ca00c	! t0_kref+0x878:   	xor	%l2, 0xc, %l2
	.word	0xe42861e8	! t0_kref+0x87c:   	stb	%l2, [%g1 + 0x1e8]
	.word	0x81d861e8	! t0_kref+0x880:   	flush	%g1 + 0x1e8
	.word	0xa70ef11f	! t0_kref+0x884:   	tsubcc	%i3, -0xee1, %l3
	.word	0xd66e3ff2	! t0_kref+0x888:   	ldstub	[%i0 - 0xe], %o3
	.word	0xee480018	! t0_kref+0x88c:   	ldsb	[%g0 + %i0], %l7
	.word	0xec28a018	! t0_kref+0x890:   	stb	%l6, [%g2 + 0x18]
	.word	0xc7ee100b	! t0_kref+0x894:   	prefetcha	%i0 + %o3, 3
	.word	0x902a400d	! t0_kref+0x898:   	andn	%o1, %o5, %o0
	.word	0x34800002	! t0_kref+0x89c:   	bg,a	_kref+0x8a4
	.word	0x8ba01a5a	! t0_kref+0x8a0:   	fdtoi	%f26, %f5
	.word	0xff6e401d	! t0_kref+0x8a4:   	prefetch	%i1 + %i5, 31
	.word	0x81a88a4a	! t0_kref+0x8a8:   	fcmpd	%fcc0, %f2, %f10
	.word	0xee4e401a	! t0_kref+0x8ac:   	ldsb	[%i1 + %i2], %l7
2:	.word	0xd586101c	! t0_kref+0x8b0:   	lda	[%i0 + %i4]0x80, %f10
	.word	0xa8068000	! t0_kref+0x8b4:   	add	%i2, %g0, %l4
	.word	0x91a01913	! t0_kref+0x8b8:   	fitod	%f19, %f8
	.word	0x81580000	! t0_kref+0x8bc:   	flushw
	.word	0xa8376187	! t0_kref+0x8c0:   	orn	%i5, 0x187, %l4
	.word	0xa72261ac	! t0_kref+0x8c4:   	mulscc	%o1, 0x1ac, %l3
	.word	0xa87e800b	! t0_kref+0x8c8:   	sdiv	%i2, %o3, %l4
	.word	0xfa20a000	! t0_kref+0x8cc:   	st	%i5, [%g2]
	.word	0xad3ee01a	! t0_kref+0x8d0:   	sra	%i3, 0x1a, %l6
	.word	0x81850000	! t0_kref+0x8d4:   	wr	%l4, %g0, %y
	.word	0xaaada3a5	! t0_kref+0x8d8:   	andncc	%l6, 0x3a5, %l5
	.word	0x2905b178	! t0_kref+0x8dc:   	sethi	%hi(0x16c5e000), %l4
	.word	0xa8baf64c	! t0_kref+0x8e0:   	xnorcc	%o3, -0x9b4, %l4
	.word	0x86102018	! t0_kref+0x8e4:   	mov	0x18, %g3
	.word	0x86a0e001	! t0_kref+0x8e8:   	subcc	%g3, 1, %g3
	.word	0x22800019	! t0_kref+0x8ec:   	be,a	_kref+0x950
	.word	0xf1beda59	! t0_kref+0x8f0:   	stda	%f24, [%i3 + %i1]0xd2
	.word	0x85828014	! t0_kref+0x8f4:   	wr	%o2, %l4, %ccr
	.word	0xaaf82f4c	! t0_kref+0x8f8:   	sdivcc	%g0, 0xf4c, %l5
	.word	0xea00a02c	! t0_kref+0x8fc:   	ld	[%g2 + 0x2c], %l5
	.word	0xec881018	! t0_kref+0x900:   	lduba	[%g0 + %i0]0x80, %l6
	.word	0xd986501c	! t0_kref+0x904:   	lda	[%i1 + %i4]0x80, %f12
	.word	0x90468014	! t0_kref+0x908:   	addc	%i2, %l4, %o0
	.word	0x81ab0a4a	! t0_kref+0x90c:   	fcmpd	%fcc0, %f12, %f10
	.word	0xa6450016	! t0_kref+0x910:   	addc	%l4, %l6, %l3
	.word	0xf820a020	! t0_kref+0x914:   	st	%i4, [%g2 + 0x20]
	.word	0x90402706	! t0_kref+0x918:   	addc	%g0, 0x706, %o0
	.word	0x354ffff3	! t0_kref+0x91c:   	fbue,a,pt	%fcc0, _kref+0x8e8
	.word	0xac9f000b	! t0_kref+0x920:   	xorcc	%i4, %o3, %l6
	.word	0xa3a14926	! t0_kref+0x924:   	fmuls	%f5, %f6, %f17
	.word	0xb5a00532	! t0_kref+0x928:   	fsqrts	%f18, %f26
	.word	0xaa2f000b	! t0_kref+0x92c:   	andn	%i4, %o3, %l5
	.word	0xacf77bd3	! t0_kref+0x930:   	udivcc	%i5, -0x42d, %l6
	.word	0xe850a03c	! t0_kref+0x934:   	ldsh	[%g2 + 0x3c], %l4
	.word	0xea48a031	! t0_kref+0x938:   	ldsb	[%g2 + 0x31], %l5
	.word	0xd0400018	! t0_kref+0x93c:   	ldsw	[%g0 + %i0], %o0
	.word	0x8586c01c	! t0_kref+0x940:   	wr	%i3, %i4, %ccr
	.word	0xa8723aed	! t0_kref+0x944:   	udiv	%o0, -0x513, %l4
	.word	0x8da48848	! t0_kref+0x948:   	faddd	%f18, %f8, %f6
	.word	0xd01e3ff8	! t0_kref+0x94c:   	ldd	[%i0 - 8], %o0
	.word	0x9de3bfa0	! t0_kref+0x950:   	save	%sp, -0x60, %sp
	.word	0x91eebde5	! t0_kref+0x954:   	restore	%i2, -0x21b, %o0
	.word	0xab400000	! t0_kref+0x958:   	mov	%y, %l5
	.word	0xfb6e7ff0	! t0_kref+0x95c:   	prefetch	%i1 - 0x10, 29
	.word	0xa90b3054	! t0_kref+0x960:   	tsubcc	%o4, -0xfac, %l4
	.word	0xaa98000a	! t0_kref+0x964:   	xorcc	%g0, %o2, %l5
	.word	0xd0d6d019	! t0_kref+0x968:   	ldsha	[%i3 + %i1]0x80, %o0
	.word	0xb1a44d3b	! t0_kref+0x96c:   	fsmuld	%f17, %f27, %f24
	.word	0xd2a01018	! t0_kref+0x970:   	sta	%o1, [%g0 + %i0]0x80
	.word	0x20800007	! t0_kref+0x974:   	bn,a	_kref+0x990
	.word	0xae73401c	! t0_kref+0x978:   	udiv	%o5, %i4, %l7
	.word	0x90da000a	! t0_kref+0x97c:   	smulcc	%o0, %o2, %o0
	.word	0x29383cbb	! t0_kref+0x980:   	sethi	%hi(0xe0f2ec00), %l4
	.word	0xe8100018	! t0_kref+0x984:   	lduh	[%g0 + %i0], %l4
	.word	0xc9be5a1a	! t0_kref+0x988:   	stda	%f4, [%i1 + %i2]0xd0
	.word	0xa92d2005	! t0_kref+0x98c:   	sll	%l4, 0x5, %l4
	.word	0xe7ee501b	! t0_kref+0x990:   	prefetcha	%i1 + %i3, 19
	.word	0xea4e4000	! t0_kref+0x994:   	ldsb	[%i1], %l5
	.word	0x9fa00137	! t0_kref+0x998:   	fabss	%f23, %f15
	.word	0x95a4cd2f	! t0_kref+0x99c:   	fsmuld	%f19, %f15, %f10
	.word	0xaf2a600a	! t0_kref+0x9a0:   	sll	%o1, 0xa, %l7
	.word	0x87a01a27	! t0_kref+0x9a4:   	fstoi	%f7, %f3
	.word	0x9062c00d	! t0_kref+0x9a8:   	subc	%o3, %o5, %o0
	.word	0xa1a58d2d	! t0_kref+0x9ac:   	fsmuld	%f22, %f13, %f16
	.word	0xee16c019	! t0_kref+0x9b0:   	lduh	[%i3 + %i1], %l7
	.word	0xae074017	! t0_kref+0x9b4:   	add	%i5, %l7, %l7
	.word	0xe408632c	! t0_kref+0x9b8:   	ldub	[%g1 + 0x32c], %l2
	.word	0xa41ca00c	! t0_kref+0x9bc:   	xor	%l2, 0xc, %l2
	.word	0xe428632c	! t0_kref+0x9c0:   	stb	%l2, [%g1 + 0x32c]
	.word	0x81d8632c	! t0_kref+0x9c4:   	flush	%g1 + 0x32c
	.word	0xb3a01098	! t0_kref+0x9c8:   	fxtos	%f24, %f25
	.word	0xada018da	! t0_kref+0x9cc:   	fdtos	%f26, %f22
	.word	0x8da6085a	! t0_kref+0x9d0:   	faddd	%f24, %f26, %f6
	.word	0x2721c4f0	! t0_kref+0x9d4:   	sethi	%hi(0x8713c000), %l3
	.word	0xaa8f7f3e	! t0_kref+0x9d8:   	andcc	%i5, -0xc2, %l5
	.word	0xa87d66e1	! t0_kref+0x9dc:   	sdiv	%l5, 0x6e1, %l4
	.word	0xd430a00e	! t0_kref+0x9e0:   	sth	%o2, [%g2 + 0xe]
	.word	0xc9bf5018	! t0_kref+0x9e4:   	stda	%f4, [%i5 + %i0]0x80
	.word	0x8da01908	! t0_kref+0x9e8:   	fitod	%f8, %f6
	.word	0xaa980000	! t0_kref+0x9ec:   	xorcc	%g0, %g0, %l5
	.word	0xc5ee500c	! t0_kref+0x9f0:   	prefetcha	%i1 + %o4, 2
2:	.word	0xe9be5a5b	! t0_kref+0x9f4:   	stda	%f20, [%i1 + %i3]0xd2
	.word	0x89a4085c	! t0_kref+0x9f8:   	faddd	%f16, %f28, %f4
	.word	0x110acafb	! t0_kref+0x9fc:   	sethi	%hi(0x2b2bec00), %o0
	.word	0x8610201b	! t0_kref+0xa00:   	mov	0x1b, %g3
	.word	0x86a0e001	! t0_kref+0xa04:   	subcc	%g3, 1, %g3
	.word	0x22800008	! t0_kref+0xa08:   	be,a	_kref+0xa28
	.word	0xa9400000	! t0_kref+0xa0c:   	mov	%y, %l4
	.word	0xd0567fe4	! t0_kref+0xa10:   	ldsh	[%i1 - 0x1c], %o0
	.word	0xafa01894	! t0_kref+0xa14:   	fitos	%f20, %f23
	.word	0xe7ee101c	! t0_kref+0xa18:   	prefetcha	%i0 + %i4, 19
	.word	0x28480008	! t0_kref+0xa1c:   	bleu,a,pt	%icc, _kref+0xa3c
	.word	0x913d0008	! t0_kref+0xa20:   	sra	%l4, %o0, %o0
	.word	0xe16e401b	! t0_kref+0xa24:   	prefetch	%i1 + %i3, 16
	.word	0xa895e905	! t0_kref+0xa28:   	orcc	%l7, 0x905, %l4
	.word	0xef68a089	! t0_kref+0xa2c:   	prefetch	%g2 + 0x89, 23
	.word	0xa1a20844	! t0_kref+0xa30:   	faddd	%f8, %f4, %f16
	.word	0xd040a01c	! t0_kref+0xa34:   	ldsw	[%g2 + 0x1c], %o0
	.word	0xa72f001d	! t0_kref+0xa38:   	sll	%i4, %i5, %l3
	.word	0xa6768015	! t0_kref+0xa3c:   	udiv	%i2, %l5, %l3
	.word	0x87802082	! t0_kref+0xa40:   	mov	0x82, %asi
	.word	0x2d800006	! t0_kref+0xa44:   	fbg,a	_kref+0xa5c
	.word	0xd120a024	! t0_kref+0xa48:   	st	%f8, [%g2 + 0x24]
	.word	0xac65bdbb	! t0_kref+0xa4c:   	subc	%l6, -0x245, %l6
	.word	0xec881019	! t0_kref+0xa50:   	lduba	[%g0 + %i1]0x80, %l6
	.word	0x23800003	! t0_kref+0xa54:   	fbne,a	_kref+0xa60
	.word	0xee0e3ff6	! t0_kref+0xa58:   	ldub	[%i0 - 0xa], %l7
	.word	0xaf35a01d	! t0_kref+0xa5c:   	srl	%l6, 0x1d, %l7
	.word	0x90b02de5	! t0_kref+0xa60:   	orncc	%g0, 0xde5, %o0
	.word	0xa89b0015	! t0_kref+0xa64:   	xorcc	%o4, %l5, %l4
	.word	0x90f8000c	! t0_kref+0xa68:   	sdivcc	%g0, %o4, %o0
	.word	0x9fa01a56	! t0_kref+0xa6c:   	fdtoi	%f22, %f15
	.word	0x81ae8a58	! t0_kref+0xa70:   	fcmpd	%fcc0, %f26, %f24
	.word	0x99a189d4	! t0_kref+0xa74:   	fdivd	%f6, %f20, %f12
	.word	0xa6c6f6b0	! t0_kref+0xa78:   	addccc	%i3, -0x950, %l3
	.word	0x81580000	! t0_kref+0xa7c:   	flushw
	.word	0xea08a03b	! t0_kref+0xa80:   	ldub	[%g2 + 0x3b], %l5
	.word	0xec50a00e	! t0_kref+0xa84:   	ldsh	[%g2 + 0xe], %l6
	.word	0x2f1e2351	! t0_kref+0xa88:   	sethi	%hi(0x788d4400), %l7
	.word	0xae7d676b	! t0_kref+0xa8c:   	sdiv	%l5, 0x76b, %l7
	.word	0xa8c37033	! t0_kref+0xa90:   	addccc	%o5, -0xfcd, %l4
	.word	0xee460000	! t0_kref+0xa94:   	ldsw	[%i0], %l7
	.word	0xa89def11	! t0_kref+0xa98:   	xorcc	%l7, 0xf11, %l4
	.word	0xac5374d4	! t0_kref+0xa9c:   	umul	%o5, -0xb2c, %l6
	.word	0xc0780019	! t0_kref+0xaa0:   	swap	[%g0 + %i1], %g0
	.word	0x8da01903	! t0_kref+0xaa4:   	fitod	%f3, %f6
	.word	0xaba0052f	! t0_kref+0xaa8:   	fsqrts	%f15, %f21
	.word	0xee30a01c	! t0_kref+0xaac:   	sth	%l7, [%g2 + 0x1c]
	.word	0xa665000d	! t0_kref+0xab0:   	subc	%l4, %o5, %l3
	.word	0x8143c000	! t0_kref+0xab4:   	stbar
	.word	0x81868000	! t0_kref+0xab8:   	wr	%i2, %g0, %y
	.word	0xdaa6501c	! t0_kref+0xabc:   	sta	%o5, [%i1 + %i4]0x80
	.word	0xaa9f401a	! t0_kref+0xac0:   	xorcc	%i5, %i2, %l5
	.word	0x90a57ddf	! t0_kref+0xac4:   	subcc	%l5, -0x221, %o0
	.word	0xa9418000	! t0_kref+0xac8:   	mov	%fprs, %l4
	.word	0xa6da800a	! t0_kref+0xacc:   	smulcc	%o2, %o2, %l3
	.word	0xdbf65017	! t0_kref+0xad0:   	casxa	[%i1]0x80, %l7, %o5
	.word	0x81ad8a54	! t0_kref+0xad4:   	fcmpd	%fcc0, %f22, %f20
	.word	0x90ad0008	! t0_kref+0xad8:   	andncc	%l4, %o0, %o0
	.word	0xcb20a010	! t0_kref+0xadc:   	st	%f5, [%g2 + 0x10]
	.word	0xe648a037	! t0_kref+0xae0:   	ldsb	[%g2 + 0x37], %l3
	.word	0x9fa01a4a	! t0_kref+0xae4:   	fdtoi	%f10, %f15
	.word	0xa8baeb7a	! t0_kref+0xae8:   	xnorcc	%o3, 0xb7a, %l4
	.word	0x2925f601	! t0_kref+0xaec:   	sethi	%hi(0x97d80400), %l4
	.word	0xee28a028	! t0_kref+0xaf0:   	stb	%l7, [%g2 + 0x28]
	.word	0x97a00132	! t0_kref+0xaf4:   	fabss	%f18, %f11
	.word	0xe19eda59	! t0_kref+0xaf8:   	ldda	[%i3 + %i1]0xd2, %f16
	.word	0xae1b0014	! t0_kref+0xafc:   	xor	%o4, %l4, %l7
	.word	0x93a2c93c	! t0_kref+0xb00:   	fmuls	%f11, %f28, %f9
	.word	0xa1a24d36	! t0_kref+0xb04:   	fsmuld	%f9, %f22, %f16
	.word	0xaf3d8014	! t0_kref+0xb08:   	sra	%l6, %l4, %l7
	.word	0x86102002	! t0_kref+0xb0c:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0xb10:   	bne,a	_kref+0xb10
	.word	0x86a0e001	! t0_kref+0xb14:   	subcc	%g3, 1, %g3
	.word	0x81580000	! t0_kref+0xb18:   	flushw
	call	SYM(t0_subr2)
	.word	0x901f7975	! t0_kref+0xb20:   	xor	%i5, -0x68b, %o0
	.word	0xe9be5a5c	! t0_kref+0xb24:   	stda	%f20, [%i1 + %i4]0xd2
	.word	0x81ac8a42	! t0_kref+0xb28:   	fcmpd	%fcc0, %f18, %f2
	.word	0xac1f4016	! t0_kref+0xb2c:   	xor	%i5, %l6, %l6
	.word	0x8182c000	! t0_kref+0xb30:   	wr	%o3, %g0, %y
	.word	0xa60e801a	! t0_kref+0xb34:   	and	%i2, %i2, %l3
	.word	0xb1a01a48	! t0_kref+0xb38:   	fdtoi	%f8, %f24
	.word	0xa5a108ac	! t0_kref+0xb3c:   	fsubs	%f4, %f12, %f18
	.word	0xedbe101d	! t0_kref+0xb40:   	stda	%f22, [%i0 + %i5]0x80
	.word	0xae72c00a	! t0_kref+0xb44:   	udiv	%o3, %o2, %l7
	.word	0xe2680018	! t0_kref+0xb48:   	ldstub	[%g0 + %i0], %l1
	.word	0xe40864b4	! t0_kref+0xb4c:   	ldub	[%g1 + 0x4b4], %l2
	.word	0xa41ca00c	! t0_kref+0xb50:   	xor	%l2, 0xc, %l2
	.word	0xe42864b4	! t0_kref+0xb54:   	stb	%l2, [%g1 + 0x4b4]
	.word	0x81d864b4	! t0_kref+0xb58:   	flush	%g1 + 0x4b4
	.word	0xd43e7fe0	! t0_kref+0xb5c:   	std	%o2, [%i1 - 0x20]
	.word	0xa84562dd	! t0_kref+0xb60:   	addc	%l5, 0x2dd, %l4
	.word	0xe168a049	! t0_kref+0xb64:   	prefetch	%g2 + 0x49, 16
	.word	0xe9f6500c	! t0_kref+0xb68:   	casxa	[%i1]0x80, %o4, %l4
	.word	0x25480002	! t0_kref+0xb6c:   	fblg,a,pt	%fcc0, _kref+0xb74
	.word	0x2b142c25	! t0_kref+0xb70:   	sethi	%hi(0x50b09400), %l5
	.word	0xa6e70016	! t0_kref+0xb74:   	subccc	%i4, %l6, %l3
	.word	0xda6e200d	! t0_kref+0xb78:   	ldstub	[%i0 + 0xd], %o5
2:	.word	0xcd06601c	! t0_kref+0xb7c:   	ld	[%i1 + 0x1c], %f6
	.word	0xb1a00031	! t0_kref+0xb80:   	fmovs	%f17, %f24
	.word	0xa6fd800b	! t0_kref+0xb84:   	sdivcc	%l6, %o3, %l3
	.word	0x8143e040	! t0_kref+0xb88:   	membar	0x40
	.word	0x8143e040	! t0_kref+0xb8c:   	membar	0x40
	.word	0xada54d2c	! t0_kref+0xb90:   	fsmuld	%f21, %f12, %f22
	.word	0xe87e0000	! t0_kref+0xb94:   	swap	[%i0], %l4
	.word	0xe600a00c	! t0_kref+0xb98:   	ld	[%g2 + 0xc], %l3
	.word	0xea48a010	! t0_kref+0xb9c:   	ldsb	[%g2 + 0x10], %l5
	.word	0xb9a01911	! t0_kref+0xba0:   	fitod	%f17, %f28
	.word	0xa89a2fd4	! t0_kref+0xba4:   	xorcc	%o0, 0xfd4, %l4
	.word	0xb3a01a35	! t0_kref+0xba8:   	fstoi	%f21, %f25
	.word	0xec9e5000	! t0_kref+0xbac:   	ldda	[%i1]0x80, %l6
	.word	0x38480003	! t0_kref+0xbb0:   	bgu,a,pt	%icc, _kref+0xbbc
	.word	0x81dbc00b	! t0_kref+0xbb4:   	flush	%o7 + %o3
	.word	0xae95ad8c	! t0_kref+0xbb8:   	orcc	%l6, 0xd8c, %l7
	.word	0x91400000	! t0_kref+0xbbc:   	mov	%y, %o0
	.word	0xa5a01a52	! t0_kref+0xbc0:   	fdtoi	%f18, %f18
	.word	0xae2a4015	! t0_kref+0xbc4:   	andn	%o1, %l5, %l7
	.word	0xae1d801b	! t0_kref+0xbc8:   	xor	%l6, %i3, %l7
	.word	0xd500a014	! t0_kref+0xbcc:   	ld	[%g2 + 0x14], %f10
	.word	0xa740c000	! t0_kref+0xbd0:   	mov	%asi, %l3
	.word	0xc10f0000	! t0_kref+0xbd4:   	ld	[%i4], %fsr
	.word	0xe66e3fec	! t0_kref+0xbd8:   	ldstub	[%i0 - 0x14], %l3
	.word	0xa65df3e3	! t0_kref+0xbdc:   	smul	%l7, -0xc1d, %l3
	.word	0xac88000c	! t0_kref+0xbe0:   	andcc	%g0, %o4, %l6
	.word	0x90dea040	! t0_kref+0xbe4:   	smulcc	%i2, 0x40, %o0
	.word	0xa65360f7	! t0_kref+0xbe8:   	umul	%o5, 0xf7, %l3
	.word	0xac55001c	! t0_kref+0xbec:   	umul	%l4, %i4, %l6
	.word	0xa893630f	! t0_kref+0xbf0:   	orcc	%o5, 0x30f, %l4
	.word	0xee7e6008	! t0_kref+0xbf4:   	swap	[%i1 + 8], %l7
	.word	0xa82b7c90	! t0_kref+0xbf8:   	andn	%o5, -0x370, %l4
	.word	0x2f33acf2	! t0_kref+0xbfc:   	sethi	%hi(0xceb3c800), %l7
	.word	0xd628a037	! t0_kref+0xc00:   	stb	%o3, [%g2 + 0x37]
	.word	0xed3e7fe0	! t0_kref+0xc04:   	std	%f22, [%i1 - 0x20]
	.word	0xeb00a024	! t0_kref+0xc08:   	ld	[%g2 + 0x24], %f21
	.word	0x34800007	! t0_kref+0xc0c:   	bg,a	_kref+0xc28
	.word	0xab068015	! t0_kref+0xc10:   	taddcc	%i2, %l5, %l5
	.word	0x8da01a50	! t0_kref+0xc14:   	fdtoi	%f16, %f6
	.word	0xa672c017	! t0_kref+0xc18:   	udiv	%o3, %l7, %l3
	.word	0xd9be5a1d	! t0_kref+0xc1c:   	stda	%f12, [%i1 + %i5]0xd0
	.word	0xe2680019	! t0_kref+0xc20:   	ldstub	[%g0 + %i1], %l1
	.word	0x91a01910	! t0_kref+0xc24:   	fitod	%f16, %f8
	.word	0x86102013	! t0_kref+0xc28:   	mov	0x13, %g3
	.word	0x86a0e001	! t0_kref+0xc2c:   	subcc	%g3, 1, %g3
	.word	0x22800014	! t0_kref+0xc30:   	be,a	_kref+0xc80
	.word	0x9da0012d	! t0_kref+0xc34:   	fabss	%f13, %f14
	.word	0xa6debc8a	! t0_kref+0xc38:   	smulcc	%i2, -0x376, %l3
	.word	0x8d850000	! t0_kref+0xc3c:   	wr	%l4, %g0, %fprs
	.word	0xb9a0189b	! t0_kref+0xc40:   	fitos	%f27, %f28
	.word	0x29167986	! t0_kref+0xc44:   	sethi	%hi(0x59e61800), %l4
	.word	0x2c480008	! t0_kref+0xc48:   	bneg,a,pt	%icc, _kref+0xc68
	.word	0xada58937	! t0_kref+0xc4c:   	fmuls	%f22, %f23, %f22
	.word	0x001fffff	! t0_kref+0xc50:   	illtrap	0x1fffff
	.word	0xd04e601b	! t0_kref+0xc54:   	ldsb	[%i1 + 0x1b], %o0
	.word	0xac7e8008	! t0_kref+0xc58:   	sdiv	%i2, %o0, %l6
	.word	0x91254015	! t0_kref+0xc5c:   	mulscc	%l5, %l5, %o0
	.word	0xacba3edc	! t0_kref+0xc60:   	xnorcc	%o0, -0x124, %l6
	.word	0x3bbffff2	! t0_kref+0xc64:   	fble,a	_kref+0xc2c
	.word	0xa6434016	! t0_kref+0xc68:   	addc	%o5, %l6, %l3
	.word	0x91400000	! t0_kref+0xc6c:   	mov	%y, %o0
	.word	0xaa426a0b	! t0_kref+0xc70:   	addc	%o1, 0xa0b, %l5
	.word	0x11133601	! t0_kref+0xc74:   	sethi	%hi(0x4cd80400), %o0
	.word	0xcd3e3fe8	! t0_kref+0xc78:   	std	%f6, [%i0 - 0x18]
	.word	0xe26e2018	! t0_kref+0xc7c:   	ldstub	[%i0 + 0x18], %l1
	.word	0xf826001c	! t0_kref+0xc80:   	st	%i4, [%i0 + %i4]
	.word	0xe6160000	! t0_kref+0xc84:   	lduh	[%i0], %l3
	.word	0x8fa01890	! t0_kref+0xc88:   	fitos	%f16, %f7
	.word	0xddb81018	! t0_kref+0xc8c:   	stda	%f14, [%g0 + %i0]0x80
	.word	0xd0060000	! t0_kref+0xc90:   	ld	[%i0], %o0
	.word	0xda6e3ff1	! t0_kref+0xc94:   	ldstub	[%i0 - 0xf], %o5
	.word	0xaa1a0014	! t0_kref+0xc98:   	xor	%o0, %l4, %l5
	.word	0xaaaa000c	! t0_kref+0xc9c:   	andncc	%o0, %o4, %l5
	.word	0xa7a01884	! t0_kref+0xca0:   	fitos	%f4, %f19
	.word	0xc768a041	! t0_kref+0xca4:   	prefetch	%g2 + 0x41, 3
	.word	0x903f6899	! t0_kref+0xca8:   	xnor	%i5, 0x899, %o0
	.word	0x99a489d4	! t0_kref+0xcac:   	fdivd	%f18, %f20, %f12
	.word	0xae534009	! t0_kref+0xcb0:   	umul	%o5, %o1, %l7
	.word	0xd020a018	! t0_kref+0xcb4:   	st	%o0, [%g2 + 0x18]
	.word	0xb5a40939	! t0_kref+0xcb8:   	fmuls	%f16, %f25, %f26
	.word	0xa9a3cd34	! t0_kref+0xcbc:   	fsmuld	%f15, %f20, %f20
	.word	0xa7400000	! t0_kref+0xcc0:   	mov	%y, %l3
	.word	0xae5f361d	! t0_kref+0xcc4:   	smul	%i4, -0x9e3, %l7
	.word	0x81af0a56	! t0_kref+0xcc8:   	fcmpd	%fcc0, %f28, %f22
	.word	0xae37001a	! t0_kref+0xccc:   	orn	%i4, %i2, %l7
	.word	0xaa554016	! t0_kref+0xcd0:   	umul	%l5, %l6, %l5
	.word	0xc51fbe10	! t0_kref+0xcd4:   	ldd	[%fp - 0x1f0], %f2
	.word	0xe56e401d	! t0_kref+0xcd8:   	prefetch	%i1 + %i5, 18
	.word	0xe56e401d	! t0_kref+0xcdc:   	prefetch	%i1 + %i5, 18
	.word	0x878020d0	! t0_kref+0xce0:   	mov	0xd0, %asi
	.word	0xc807bfe8	! t0_kref+0xce4:   	ld	[%fp - 0x18], %g4
	.word	0x81aeca23	! t0_kref+0xce8:   	fcmps	%fcc0, %f27, %f3
	.word	0x86102009	! t0_kref+0xcec:   	mov	0x9, %g3
	.word	0x86a0e001	! t0_kref+0xcf0:   	subcc	%g3, 1, %g3
	.word	0x22800008	! t0_kref+0xcf4:   	be,a	_kref+0xd14
	.word	0xe700a004	! t0_kref+0xcf8:   	ld	[%g2 + 4], %f19
	.word	0xeb68a087	! t0_kref+0xcfc:   	prefetch	%g2 + 0x87, 21
	.word	0xaa0a8014	! t0_kref+0xd00:   	and	%o2, %l4, %l5
	.word	0xeb68a008	! t0_kref+0xd04:   	prefetch	%g2 + 8, 21
	.word	0x81ad8acc	! t0_kref+0xd08:   	fcmped	%fcc0, %f22, %f12
	.word	0xefee501b	! t0_kref+0xd0c:   	prefetcha	%i1 + %i3, 23
	.word	0xa8ba800b	! t0_kref+0xd10:   	xnorcc	%o2, %o3, %l4
	.word	0xacaafa26	! t0_kref+0xd14:   	andncc	%o3, -0x5da, %l6
	.word	0xac06a329	! t0_kref+0xd18:   	add	%i2, 0x329, %l6
	.word	0xe6463ff4	! t0_kref+0xd1c:   	ldsw	[%i0 - 0xc], %l3
	.word	0x81ae8a3c	! t0_kref+0xd20:   	fcmps	%fcc0, %f26, %f28
	.word	0xa6da4016	! t0_kref+0xd24:   	smulcc	%o1, %l6, %l3
	.word	0xaa0a0017	! t0_kref+0xd28:   	and	%o0, %l7, %l5
	.word	0xf43e0000	! t0_kref+0xd2c:   	std	%i2, [%i0]
	.word	0x9095aecc	! t0_kref+0xd30:   	orcc	%l6, 0xecc, %o0
	.word	0xaeba3987	! t0_kref+0xd34:   	xnorcc	%o0, -0x679, %l7
	.word	0xafa6c823	! t0_kref+0xd38:   	fadds	%f27, %f3, %f23
	.word	0x878020e0	! t0_kref+0xd3c:   	mov	0xe0, %asi
	.word	0xd100a030	! t0_kref+0xd40:   	ld	[%g2 + 0x30], %f8
	.word	0xa740c000	! t0_kref+0xd44:   	mov	%asi, %l3
	.word	0x93a00128	! t0_kref+0xd48:   	fabss	%f8, %f9
	.word	0xf4a65000	! t0_kref+0xd4c:   	sta	%i2, [%i1]0x80
	.word	0xd99f5a59	! t0_kref+0xd50:   	ldda	[%i5 + %i1]0xd2, %f12
	.word	0xb7a00533	! t0_kref+0xd54:   	fsqrts	%f19, %f27
	.word	0x90b2001d	! t0_kref+0xd58:   	orncc	%o0, %i5, %o0
	.word	0x9fc00004	! t0_kref+0xd5c:   	call	%g0 + %g4
	.word	0xa9400000	! t0_kref+0xd60:   	mov	%y, %l4
	.word	0xe84e200b	! t0_kref+0xd64:   	ldsb	[%i0 + 0xb], %l4
	.word	0xddbe5000	! t0_kref+0xd68:   	stda	%f14, [%i1]0x80
	.word	0xac7eb48a	! t0_kref+0xd6c:   	sdiv	%i2, -0xb76, %l6
	.word	0x81dd0016	! t0_kref+0xd70:   	flush	%l4 + %l6
	.word	0xaaddc01c	! t0_kref+0xd74:   	smulcc	%l7, %i4, %l5
	.word	0x91a68d39	! t0_kref+0xd78:   	fsmuld	%f26, %f25, %f8
	.word	0xac603779	! t0_kref+0xd7c:   	subc	%g0, -0x887, %l6
	.word	0xe648a003	! t0_kref+0xd80:   	ldsb	[%g2 + 3], %l3
	.word	0x90fec00a	! t0_kref+0xd84:   	sdivcc	%i3, %o2, %o0
	.word	0x81aa8a28	! t0_kref+0xd88:   	fcmps	%fcc0, %f10, %f8
	.word	0x9fc00004	! t0_kref+0xd8c:   	call	%g0 + %g4
	.word	0x81d80014	! t0_kref+0xd90:   	flush	%g0 + %l4
	.word	0xe1beda58	! t0_kref+0xd94:   	stda	%f16, [%i3 + %i0]0xd2
	.word	0x9de3bfa0	! t0_kref+0xd98:   	save	%sp, -0x60, %sp
	.word	0xb8c72226	! t0_kref+0xd9c:   	addccc	%i4, 0x226, %i4
	.word	0xafee4019	! t0_kref+0xda0:   	restore	%i1, %i1, %l7
	.word	0xf13e2000	! t0_kref+0xda4:   	std	%f24, [%i0]
	.word	0xaaa5b39c	! t0_kref+0xda8:   	subcc	%l6, -0xc64, %l5
	.word	0xeea81019	! t0_kref+0xdac:   	stba	%l7, [%g0 + %i1]0x80
	.word	0xcf00a024	! t0_kref+0xdb0:   	ld	[%g2 + 0x24], %f7
	.word	0xa7a01898	! t0_kref+0xdb4:   	fitos	%f24, %f19
	.word	0xa8f832af	! t0_kref+0xdb8:   	sdivcc	%g0, -0xd51, %l4
	.word	0x81a90a5a	! t0_kref+0xdbc:   	fcmpd	%fcc0, %f4, %f26
	.word	0xe616600e	! t0_kref+0xdc0:   	lduh	[%i1 + 0xe], %l3
	.word	0xa93d601c	! t0_kref+0xdc4:   	sra	%l5, 0x1c, %l4
	.word	0xf900a01c	! t0_kref+0xdc8:   	ld	[%g2 + 0x1c], %f28
	.word	0x81ac8a44	! t0_kref+0xdcc:   	fcmpd	%fcc0, %f18, %f4
	.word	0x2a480008	! t0_kref+0xdd0:   	bcs,a,pt	%icc, _kref+0xdf0
	.word	0xe9a01018	! t0_kref+0xdd4:   	sta	%f20, [%g0 + %i0]0x80
	.word	0x93a00529	! t0_kref+0xdd8:   	fsqrts	%f9, %f9
	.word	0x81580000	! t0_kref+0xddc:   	flushw
	.word	0x11007afa	! t0_kref+0xde0:   	sethi	%hi(0x1ebe800), %o0
	.word	0xada40d3c	! t0_kref+0xde4:   	fsmuld	%f16, %f28, %f22
	.word	0x9fc10000	! t0_kref+0xde8:   	call	%g4
	.word	0x8186c000	! t0_kref+0xdec:   	wr	%i3, %g0, %y
	.word	0x9de3bfa0	! t0_kref+0xdf0:   	save	%sp, -0x60, %sp
	.word	0xa7ef6757	! t0_kref+0xdf4:   	restore	%i5, 0x757, %l3
	.word	0xa7a2c930	! t0_kref+0xdf8:   	fmuls	%f11, %f16, %f19
	.word	0xd5e65009	! t0_kref+0xdfc:   	casa	[%i1]0x80, %o1, %o2
	.word	0x2d800008	! t0_kref+0xe00:   	fbg,a	_kref+0xe20
	.word	0xaf3aa01e	! t0_kref+0xe04:   	sra	%o2, 0x1e, %l7
	.word	0xf207bfe0	! t0_kref+0xe08:   	ld	[%fp - 0x20], %i1
	.word	0xaebebe26	! t0_kref+0xe0c:   	xnorcc	%i2, -0x1da, %l7
	.word	0x8da01904	! t0_kref+0xe10:   	fitod	%f4, %f6
	.word	0xa1a5cd3a	! t0_kref+0xe14:   	fsmuld	%f23, %f26, %f16
	.word	0x2c480001	! t0_kref+0xe18:   	bneg,a,pt	%icc, _kref+0xe1c
	.word	0xa872e490	! t0_kref+0xe1c:   	udiv	%o3, 0x490, %l4
	.word	0xa670001b	! t0_kref+0xe20:   	udiv	%g0, %i3, %l3
	.word	0xa737000b	! t0_kref+0xe24:   	srl	%i4, %o3, %l3
	.word	0x86102014	! t0_kref+0xe28:   	mov	0x14, %g3
	.word	0x86a0e001	! t0_kref+0xe2c:   	subcc	%g3, 1, %g3
	.word	0x2280000b	! t0_kref+0xe30:   	be,a	_kref+0xe5c
	.word	0xf36e001d	! t0_kref+0xe34:   	prefetch	%i0 + %i5, 25
	.word	0x81a9ca2c	! t0_kref+0xe38:   	fcmps	%fcc0, %f7, %f12
	.word	0x95a10854	! t0_kref+0xe3c:   	faddd	%f4, %f20, %f10
	.word	0xed68a007	! t0_kref+0xe40:   	prefetch	%g2 + 7, 22
	.word	0xa8dae17a	! t0_kref+0xe44:   	smulcc	%o3, 0x17a, %l4
	.word	0xfaa6501c	! t0_kref+0xe48:   	sta	%i5, [%i1 + %i4]0x80
	.word	0x90402caf	! t0_kref+0xe4c:   	addc	%g0, 0xcaf, %o0
	.word	0xd1f61016	! t0_kref+0xe50:   	casxa	[%i0]0x80, %l6, %o0
	.word	0xaedaf36e	! t0_kref+0xe54:   	smulcc	%o3, -0xc92, %l7
	.word	0xd010a010	! t0_kref+0xe58:   	lduh	[%g2 + 0x10], %o0
	.word	0xae9a8008	! t0_kref+0xe5c:   	xorcc	%o2, %o0, %l7
	.word	0xaee5c008	! t0_kref+0xe60:   	subccc	%l7, %o0, %l7
	.word	0xe840a000	! t0_kref+0xe64:   	ldsw	[%g2], %l4
	.word	0xd9be5a1c	! t0_kref+0xe68:   	stda	%f12, [%i1 + %i4]0xd0
	.word	0x86102003	! t0_kref+0xe6c:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0xe70:   	bne,a	_kref+0xe70
	.word	0x86a0e001	! t0_kref+0xe74:   	subcc	%g3, 1, %g3
	.word	0xee566000	! t0_kref+0xe78:   	ldsh	[%i1], %l7
	.word	0xe8564000	! t0_kref+0xe7c:   	ldsh	[%i1], %l4
	.word	0xe07e6010	! t0_kref+0xe80:   	swap	[%i1 + 0x10], %l0
	.word	0x91a01905	! t0_kref+0xe84:   	fitod	%f5, %f8
	.word	0xae174000	! t0_kref+0xe88:   	or	%i5, %g0, %l7
	.word	0x99a48942	! t0_kref+0xe8c:   	fmuld	%f18, %f2, %f12
	.word	0xeb20a030	! t0_kref+0xe90:   	st	%f21, [%g2 + 0x30]
	.word	0xe5ee501c	! t0_kref+0xe94:   	prefetcha	%i1 + %i4, 18
	.word	0xae9b7d92	! t0_kref+0xe98:   	xorcc	%o5, -0x26e, %l7
	.word	0x8da00039	! t0_kref+0xe9c:   	fmovs	%f25, %f6
	.word	0xd626200c	! t0_kref+0xea0:   	st	%o3, [%i0 + 0xc]
	.word	0x86102002	! t0_kref+0xea4:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0xea8:   	bne,a	_kref+0xea8
	.word	0x86a0e001	! t0_kref+0xeac:   	subcc	%g3, 1, %g3
	.word	0xb1a0191a	! t0_kref+0xeb0:   	fitod	%f26, %f24
	.word	0xa80b400c	! t0_kref+0xeb4:   	and	%o5, %o4, %l4
	.word	0xee162012	! t0_kref+0xeb8:   	lduh	[%i0 + 0x12], %l7
	.word	0xd04e8019	! t0_kref+0xebc:   	ldsb	[%i2 + %i1], %o0
	.word	0x91a01913	! t0_kref+0xec0:   	fitod	%f19, %f8
	.word	0xed6e7fe8	! t0_kref+0xec4:   	prefetch	%i1 - 0x18, 22
	.word	0x89a18854	! t0_kref+0xec8:   	faddd	%f6, %f20, %f4
	.word	0x2b1a7c92	! t0_kref+0xecc:   	sethi	%hi(0x69f24800), %l5
	.word	0x9045e58e	! t0_kref+0xed0:   	addc	%l7, 0x58e, %o0
	.word	0xa6982084	! t0_kref+0xed4:   	xorcc	%g0, 0x84, %l3
	.word	0x2b1fcd51	! t0_kref+0xed8:   	sethi	%hi(0x7f354400), %l5
	.word	0x89a34928	! t0_kref+0xedc:   	fmuls	%f13, %f8, %f4
	.word	0xac234017	! t0_kref+0xee0:   	sub	%o5, %l7, %l6
	.word	0xae43400a	! t0_kref+0xee4:   	addc	%o5, %o2, %l7
	.word	0xe6563fea	! t0_kref+0xee8:   	ldsh	[%i0 - 0x16], %l3
	.word	0xad38201d	! t0_kref+0xeec:   	sra	%g0, 0x1d, %l6
	.word	0xae95aba4	! t0_kref+0xef0:   	orcc	%l6, 0xba4, %l7
	.word	0x90bf4000	! t0_kref+0xef4:   	xnorcc	%i5, %g0, %o0
	.word	0xd08e9019	! t0_kref+0xef8:   	lduba	[%i2 + %i1]0x80, %o0
	.word	0x90d52ee5	! t0_kref+0xefc:   	umulcc	%l4, 0xee5, %o0
	.word	0xa9a10856	! t0_kref+0xf00:   	faddd	%f4, %f22, %f20
	.word	0xac750014	! t0_kref+0xf04:   	udiv	%l4, %l4, %l6
	.word	0xada28d2a	! t0_kref+0xf08:   	fsmuld	%f10, %f10, %f22
	.word	0xaee70016	! t0_kref+0xf0c:   	subccc	%i4, %l6, %l7
	.word	0xae77400c	! t0_kref+0xf10:   	udiv	%i5, %o4, %l7
	.word	0xaa352965	! t0_kref+0xf14:   	orn	%l4, 0x965, %l5
	sethi	%hi(2f), %o7
	.word	0xe40be340	! t0_kref+0xf1c:   	ldub	[%o7 + 0x340], %l2
	.word	0xa41ca00c	! t0_kref+0xf20:   	xor	%l2, 0xc, %l2
	.word	0xe42be340	! t0_kref+0xf24:   	stb	%l2, [%o7 + 0x340]
	.word	0x81dbe340	! t0_kref+0xf28:   	flush	%o7 + 0x340
	.word	0xd008a01b	! t0_kref+0xf2c:   	ldub	[%g2 + 0x1b], %o0
	.word	0xd66e2005	! t0_kref+0xf30:   	ldstub	[%i0 + 5], %o3
	.word	0xa855f9cd	! t0_kref+0xf34:   	umul	%l7, -0x633, %l4
	.word	0xd820a000	! t0_kref+0xf38:   	st	%o4, [%g2]
	.word	0xac96a442	! t0_kref+0xf3c:   	orcc	%i2, 0x442, %l6
2:	.word	0xa67ec014	! t0_kref+0xf40:   	sdiv	%i3, %l4, %l3
	.word	0x2b16b6ca	! t0_kref+0xf44:   	sethi	%hi(0x5adb2800), %l5
	.word	0x91a40d34	! t0_kref+0xf48:   	fsmuld	%f16, %f20, %f8
	.word	0xa875fb12	! t0_kref+0xf4c:   	udiv	%l7, -0x4ee, %l4
	.word	0xa8058000	! t0_kref+0xf50:   	add	%l6, %g0, %l4
	.word	0xd9a61000	! t0_kref+0xf54:   	sta	%f12, [%i0]0x80
	.word	0xec48a007	! t0_kref+0xf58:   	ldsb	[%g2 + 7], %l6
	.word	0xe6d65000	! t0_kref+0xf5c:   	ldsha	[%i1]0x80, %l3
	.word	0x34800003	! t0_kref+0xf60:   	bg,a	_kref+0xf6c
	.word	0xee28a011	! t0_kref+0xf64:   	stb	%l7, [%g2 + 0x11]
	.word	0xa63038d5	! t0_kref+0xf68:   	orn	%g0, -0x72b, %l3
	sethi	%hi(2f), %o7
	.word	0xe40be3b0	! t0_kref+0xf70:   	ldub	[%o7 + 0x3b0], %l2
	.word	0xa41ca00c	! t0_kref+0xf74:   	xor	%l2, 0xc, %l2
	.word	0xe42be3b0	! t0_kref+0xf78:   	stb	%l2, [%o7 + 0x3b0]
	.word	0x81dbe3b0	! t0_kref+0xf7c:   	flush	%o7 + 0x3b0
	.word	0xd300a000	! t0_kref+0xf80:   	ld	[%g2], %f9
	.word	0xe4680018	! t0_kref+0xf84:   	ldstub	[%g0 + %i0], %l2
	.word	0xe84e6013	! t0_kref+0xf88:   	ldsb	[%i1 + 0x13], %l4
	.word	0xb1a3cd29	! t0_kref+0xf8c:   	fsmuld	%f15, %f9, %f24
	.word	0x91a70d36	! t0_kref+0xf90:   	fsmuld	%f28, %f22, %f8
	.word	0xc026201c	! t0_kref+0xf94:   	clr	[%i0 + 0x1c]
	.word	0xed68a08a	! t0_kref+0xf98:   	prefetch	%g2 + 0x8a, 22
	.word	0x81dabb40	! t0_kref+0xf9c:   	flush	%o2 - 0x4c0
	.word	0xaa8dbf5c	! t0_kref+0xfa0:   	andcc	%l6, -0xa4, %l5
	.word	0x23800005	! t0_kref+0xfa4:   	fbne,a	_kref+0xfb8
	.word	0xa3a54824	! t0_kref+0xfa8:   	fadds	%f21, %f4, %f17
	.word	0xd020a004	! t0_kref+0xfac:   	st	%o0, [%g2 + 4]
2:	.word	0xa7a48826	! t0_kref+0xfb0:   	fadds	%f18, %f6, %f19
	.word	0xd09e5000	! t0_kref+0xfb4:   	ldda	[%i1]0x80, %o0
	.word	0xee16001b	! t0_kref+0xfb8:   	lduh	[%i0 + %i3], %l7
	.word	0x9da01892	! t0_kref+0xfbc:   	fitos	%f18, %f14
	.word	0x91400000	! t0_kref+0xfc0:   	mov	%y, %o0
	call	SYM(t0_subr3)
	.word	0xa5a508af	! t0_kref+0xfc8:   	fsubs	%f20, %f15, %f18
	.word	0xb7a248b3	! t0_kref+0xfcc:   	fsubs	%f9, %f19, %f27
	.word	0xac2a001a	! t0_kref+0xfd0:   	andn	%o0, %i2, %l6
	.word	0xec00a020	! t0_kref+0xfd4:   	ld	[%g2 + 0x20], %l6
	.word	0xea560000	! t0_kref+0xfd8:   	ldsh	[%i0], %l5
	.word	0xacaa8017	! t0_kref+0xfdc:   	andncc	%o2, %l7, %l6
	.word	0xaa9d77db	! t0_kref+0xfe0:   	xorcc	%l5, -0x825, %l5
	.word	0xd4380018	! t0_kref+0xfe4:   	std	%o2, [%g0 + %i0]
	.word	0xd13e6008	! t0_kref+0xfe8:   	std	%f8, [%i1 + 8]
	.word	0xaf40c000	! t0_kref+0xfec:   	mov	%asi, %l7
	.word	0x9ba609b8	! t0_kref+0xff0:   	fdivs	%f24, %f24, %f13
	.word	0xd46e401a	! t0_kref+0xff4:   	ldstub	[%i1 + %i2], %o2
	.word	0xec56001b	! t0_kref+0xff8:   	ldsh	[%i0 + %i3], %l6
	.word	0xe36e3fe0	! t0_kref+0xffc:   	prefetch	%i0 - 0x20, 17
	.word	0x9da00056	! t0_kref+0x1000:   	fmovd	%f22, %f14
	.word	0x86102004	! t0_kref+0x1004:   	mov	0x4, %g3
	.word	0x86a0e001	! t0_kref+0x1008:   	subcc	%g3, 1, %g3
	.word	0x2280000e	! t0_kref+0x100c:   	be,a	_kref+0x1044
	.word	0xac1a4014	! t0_kref+0x1010:   	xor	%o1, %l4, %l6
	call	SYM(t0_subr3)
	.word	0xe610a00c	! t0_kref+0x1018:   	lduh	[%g2 + 0xc], %l3
	.word	0xcd1fbd50	! t0_kref+0x101c:   	ldd	[%fp - 0x2b0], %f6
	.word	0x29339a77	! t0_kref+0x1020:   	sethi	%hi(0xce69dc00), %l4
	.word	0xa1a0189b	! t0_kref+0x1024:   	fitos	%f27, %f16
	.word	0x905f401d	! t0_kref+0x1028:   	smul	%i5, %i5, %o0
	.word	0xae55401c	! t0_kref+0x102c:   	umul	%l5, %i4, %l7
	.word	0xad400000	! t0_kref+0x1030:   	mov	%y, %l6
	.word	0xaf3da009	! t0_kref+0x1034:   	sra	%l6, 0x9, %l7
	.word	0x30480005	! t0_kref+0x1038:   	ba,a,pt	%icc, _kref+0x104c
	.word	0xd5f6100d	! t0_kref+0x103c:   	casxa	[%i0]0x80, %o5, %o2
	.word	0x95a58d23	! t0_kref+0x1040:   	fsmuld	%f22, %f3, %f10
	.word	0xd1be101d	! t0_kref+0x1044:   	stda	%f8, [%i0 + %i5]0x80
	.word	0x9fa6092d	! t0_kref+0x1048:   	fmuls	%f24, %f13, %f15
	.word	0x9045ff46	! t0_kref+0x104c:   	addc	%l7, -0xba, %o0
	.word	0x8143c000	! t0_kref+0x1050:   	stbar
	.word	0xe2ee101a	! t0_kref+0x1054:   	ldstuba	[%i0 + %i2]0x80, %l1
	.word	0xe11fbca8	! t0_kref+0x1058:   	ldd	[%fp - 0x358], %f16
	.word	0x9de3bfa0	! t0_kref+0x105c:   	save	%sp, -0x60, %sp
	.word	0xb2070000	! t0_kref+0x1060:   	add	%i4, %g0, %i1
	.word	0xa9ef3fbf	! t0_kref+0x1064:   	restore	%i4, -0x41, %l4
	.word	0x81a9ca2f	! t0_kref+0x1068:   	fcmps	%fcc0, %f7, %f15
	.word	0xa5a98037	! t0_kref+0x106c:   	fmovsg	%fcc0, %f23, %f18
	.word	0xaa5ac00b	! t0_kref+0x1070:   	smul	%o3, %o3, %l5
	.word	0xa9a24d24	! t0_kref+0x1074:   	fsmuld	%f9, %f4, %f20
	.word	0x81824000	! t0_kref+0x1078:   	wr	%o1, %g0, %y
	.word	0xed060000	! t0_kref+0x107c:   	ld	[%i0], %f22
	.word	0xb5a000bc	! t0_kref+0x1080:   	fnegs	%f28, %f26
	.word	0x9de3bfa0	! t0_kref+0x1084:   	save	%sp, -0x60, %sp
	.word	0x91ee001b	! t0_kref+0x1088:   	restore	%i0, %i3, %o0
	.word	0xd2fe5000	! t0_kref+0x108c:   	swapa	[%i1]0x80, %o1
	.word	0x81dc2cdb	! t0_kref+0x1090:   	flush	%l0 + 0xcdb
	.word	0xa93aa00e	! t0_kref+0x1094:   	sra	%o2, 0xe, %l4
	.word	0xe3b8a080	! t0_kref+0x1098:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xac734008	! t0_kref+0x109c:   	udiv	%o5, %o0, %l6
	.word	0x22480008	! t0_kref+0x10a0:   	be,a,pt	%icc, _kref+0x10c0
	.word	0x91700015	! t0_kref+0x10a4:   	popc	%l5, %o0
	.word	0xe686101c	! t0_kref+0x10a8:   	lda	[%i0 + %i4]0x80, %l3
	.word	0x95a00138	! t0_kref+0x10ac:   	fabss	%f24, %f10
	.word	0x81aa0a48	! t0_kref+0x10b0:   	fcmpd	%fcc0, %f8, %f8
	.word	0xda30a00e	! t0_kref+0x10b4:   	sth	%o5, [%g2 + 0xe]
	.word	0xa3a388af	! t0_kref+0x10b8:   	fsubs	%f14, %f15, %f17
	.word	0x81ac0a25	! t0_kref+0x10bc:   	fcmps	%fcc0, %f16, %f5
	.word	0xd008a03c	! t0_kref+0x10c0:   	ldub	[%g2 + 0x3c], %o0
	.word	0x8587401a	! t0_kref+0x10c4:   	wr	%i5, %i2, %ccr
	.word	0x81deab9b	! t0_kref+0x10c8:   	flush	%i2 + 0xb9b
	.word	0x81deb0ea	! t0_kref+0x10cc:   	flush	%i2 - 0xf16
	.word	0xe84e6004	! t0_kref+0x10d0:   	ldsb	[%i1 + 4], %l4
	.word	0xe7ee101c	! t0_kref+0x10d4:   	prefetcha	%i0 + %i4, 19
	.word	0xe64e401a	! t0_kref+0x10d8:   	ldsb	[%i1 + %i2], %l3
	.word	0x9fa4c8a5	! t0_kref+0x10dc:   	fsubs	%f19, %f5, %f15
	.word	0xf620a024	! t0_kref+0x10e0:   	st	%i3, [%g2 + 0x24]
	.word	0xaef5672d	! t0_kref+0x10e4:   	udivcc	%l5, 0x72d, %l7
	.word	0x99aa802e	! t0_kref+0x10e8:   	fmovsue	%fcc0, %f14, %f12
	.word	0x8da00537	! t0_kref+0x10ec:   	fsqrts	%f23, %f6
	.word	0xa7372018	! t0_kref+0x10f0:   	srl	%i4, 0x18, %l3
	.word	0xec10a01c	! t0_kref+0x10f4:   	lduh	[%g2 + 0x1c], %l6
	.word	0x2f05ff1e	! t0_kref+0x10f8:   	sethi	%hi(0x17fc7800), %l7
	.word	0x9de3bfa0	! t0_kref+0x10fc:   	save	%sp, -0x60, %sp
	.word	0xb62f2c07	! t0_kref+0x1100:   	andn	%i4, 0xc07, %i3
	.word	0x91ef382b	! t0_kref+0x1104:   	restore	%i4, -0x7d5, %o0
	.word	0xfb6e2000	! t0_kref+0x1108:   	prefetch	%i0, 29
	.word	0xec480019	! t0_kref+0x110c:   	ldsb	[%g0 + %i1], %l6
	.word	0xa8df6a2c	! t0_kref+0x1110:   	smulcc	%i5, 0xa2c, %l4
	.word	0xa85374a0	! t0_kref+0x1114:   	umul	%o5, -0xb60, %l4
	.word	0xa82d2343	! t0_kref+0x1118:   	andn	%l4, 0x343, %l4
	.word	0xb9a01a56	! t0_kref+0x111c:   	fdtoi	%f22, %f28
	.word	0x89a00524	! t0_kref+0x1120:   	fsqrts	%f4, %f4
	.word	0x86102009	! t0_kref+0x1124:   	mov	0x9, %g3
	.word	0x86a0e001	! t0_kref+0x1128:   	subcc	%g3, 1, %g3
	.word	0x2280000b	! t0_kref+0x112c:   	be,a	_kref+0x1158
	.word	0xd428a034	! t0_kref+0x1130:   	stb	%o2, [%g2 + 0x34]
	.word	0x9fc00004	! t0_kref+0x1134:   	call	%g0 + %g4
	.word	0x91a018d8	! t0_kref+0x1138:   	fdtos	%f24, %f8
	.word	0xa6953ab7	! t0_kref+0x113c:   	orcc	%l4, -0x549, %l3
	.word	0xab40c000	! t0_kref+0x1140:   	mov	%asi, %l5
	.word	0x9da38d2d	! t0_kref+0x1144:   	fsmuld	%f14, %f13, %f14
	.word	0xac52000c	! t0_kref+0x1148:   	umul	%o0, %o4, %l6
	call	SYM(t0_subr2)
	.word	0xec50a03e	! t0_kref+0x1150:   	ldsh	[%g2 + 0x3e], %l6
	.word	0x97a50833	! t0_kref+0x1154:   	fadds	%f20, %f19, %f11
	.word	0xa7000016	! t0_kref+0x1158:   	taddcc	%g0, %l6, %l3
	.word	0xa9418000	! t0_kref+0x115c:   	mov	%fprs, %l4
	.word	0x81dc4013	! t0_kref+0x1160:   	flush	%l1 + %l3
	.word	0xa6aac000	! t0_kref+0x1164:   	andncc	%o3, %g0, %l3
	.word	0x9095001d	! t0_kref+0x1168:   	orcc	%l4, %i5, %o0
	.word	0x2f315097	! t0_kref+0x116c:   	sethi	%hi(0xc5425c00), %l7
	.word	0x35800003	! t0_kref+0x1170:   	fbue,a	_kref+0x117c
	.word	0xc030a034	! t0_kref+0x1174:   	clrh	[%g2 + 0x34]
	.word	0xa3a608b7	! t0_kref+0x1178:   	fsubs	%f24, %f23, %f17
	.word	0xb7a0189a	! t0_kref+0x117c:   	fitos	%f26, %f27
	.word	0x8185c000	! t0_kref+0x1180:   	wr	%l7, %g0, %y
	.word	0xd428a018	! t0_kref+0x1184:   	stb	%o2, [%g2 + 0x18]
	.word	0xe19e1a5b	! t0_kref+0x1188:   	ldda	[%i0 + %i3]0xd2, %f16
	.word	0xad418000	! t0_kref+0x118c:   	mov	%fprs, %l6
	.word	0xb1a0190b	! t0_kref+0x1190:   	fitod	%f11, %f24
	.word	0xeb6e401b	! t0_kref+0x1194:   	prefetch	%i1 + %i3, 21
	.word	0xae0ec009	! t0_kref+0x1198:   	and	%i3, %o1, %l7
	.word	0xdd3e2010	! t0_kref+0x119c:   	std	%f14, [%i0 + 0x10]
	.word	0x81854000	! t0_kref+0x11a0:   	wr	%l5, %g0, %y
	.word	0x90af001d	! t0_kref+0x11a4:   	andncc	%i4, %i5, %o0
	.word	0x99a01917	! t0_kref+0x11a8:   	fitod	%f23, %f12
	.word	0x3e480006	! t0_kref+0x11ac:   	bvc,a,pt	%icc, _kref+0x11c4
	.word	0xa82d3eb9	! t0_kref+0x11b0:   	andn	%l4, -0x147, %l4
	.word	0xae7b400d	! t0_kref+0x11b4:   	sdiv	%o5, %o5, %l7
	.word	0x91a189d8	! t0_kref+0x11b8:   	fdivd	%f6, %f24, %f8
	.word	0xcd00a01c	! t0_kref+0x11bc:   	ld	[%g2 + 0x1c], %f6
	.word	0xad3da016	! t0_kref+0x11c0:   	sra	%l6, 0x16, %l6
	.word	0xa8dea6cc	! t0_kref+0x11c4:   	smulcc	%i2, 0x6cc, %l4
	.word	0x81accaa8	! t0_kref+0x11c8:   	fcmpes	%fcc0, %f19, %f8
	.word	0xa72f600b	! t0_kref+0x11cc:   	sll	%i5, 0xb, %l3
	.word	0xa9a609c6	! t0_kref+0x11d0:   	fdivd	%f24, %f6, %f20
	.word	0xaaad801d	! t0_kref+0x11d4:   	andncc	%l6, %i5, %l5
	.word	0xac127648	! t0_kref+0x11d8:   	or	%o1, -0x9b8, %l6
	.word	0xacc6e939	! t0_kref+0x11dc:   	addccc	%i3, 0x939, %l6
	.word	0x81850000	! t0_kref+0x11e0:   	wr	%l4, %g0, %y
	.word	0x87a01a5a	! t0_kref+0x11e4:   	fdtoi	%f26, %f3
	.word	0xd5000018	! t0_kref+0x11e8:   	ld	[%g0 + %i0], %f10
	.word	0xe1be1848	! t0_kref+0x11ec:   	stda	%f16, [%i0 + %o0]0xc2
	.word	0xe640a008	! t0_kref+0x11f0:   	ldsw	[%g2 + 8], %l3
	.word	0x9de3bfa0	! t0_kref+0x11f4:   	save	%sp, -0x60, %sp
	.word	0xabee0019	! t0_kref+0x11f8:   	restore	%i0, %i1, %l5
	.word	0xaa32400d	! t0_kref+0x11fc:   	orn	%o1, %o5, %l5
	.word	0x9046e202	! t0_kref+0x1200:   	addc	%i3, 0x202, %o0
	.word	0xf19e5a1d	! t0_kref+0x1204:   	ldda	[%i1 + %i5]0xd0, %f24
	.word	0xe3064000	! t0_kref+0x1208:   	ld	[%i1], %f17
	.word	0xd9380019	! t0_kref+0x120c:   	std	%f12, [%g0 + %i1]
	.word	0x86102001	! t0_kref+0x1210:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x1214:   	bne,a	_kref+0x1214
	.word	0x86a0e001	! t0_kref+0x1218:   	subcc	%g3, 1, %g3
	.word	0x9de3bfa0	! t0_kref+0x121c:   	save	%sp, -0x60, %sp
	.word	0xba26e7b3	! t0_kref+0x1220:   	sub	%i3, 0x7b3, %i5
	.word	0xa9eef16e	! t0_kref+0x1224:   	restore	%i3, -0xe92, %l4
	.word	0xada018cc	! t0_kref+0x1228:   	fdtos	%f12, %f22
	.word	0xa6e00000	! t0_kref+0x122c:   	subccc	%g0, %g0, %l3
	.word	0x81ae8a48	! t0_kref+0x1230:   	fcmpd	%fcc0, %f26, %f8
	.word	0xaa76a1b3	! t0_kref+0x1234:   	udiv	%i2, 0x1b3, %l5
	.word	0xa1a01894	! t0_kref+0x1238:   	fitos	%f20, %f16
	.word	0xe168a041	! t0_kref+0x123c:   	prefetch	%g2 + 0x41, 16
	.word	0xa6352c9a	! t0_kref+0x1240:   	orn	%l4, 0xc9a, %l3
	.word	0x9da01910	! t0_kref+0x1244:   	fitod	%f16, %f14
	.word	0xef68a004	! t0_kref+0x1248:   	prefetch	%g2 + 4, 23
	.word	0xa7400000	! t0_kref+0x124c:   	mov	%y, %l3
	.word	0x99a0013a	! t0_kref+0x1250:   	fabss	%f26, %f12
	.word	0xf4380018	! t0_kref+0x1254:   	std	%i2, [%g0 + %i0]
	.word	0xea6e8019	! t0_kref+0x1258:   	ldstub	[%i2 + %i1], %l5
	.word	0x33800002	! t0_kref+0x125c:   	fbe,a	_kref+0x1264
	.word	0xae2f7426	! t0_kref+0x1260:   	andn	%i5, -0xbda, %l7
	.word	0x8da54d29	! t0_kref+0x1264:   	fsmuld	%f21, %f9, %f6
	.word	0x95a01048	! t0_kref+0x1268:   	fdtox	%f8, %f10
	.word	0x81ad8a29	! t0_kref+0x126c:   	fcmps	%fcc0, %f22, %f9
	.word	0x8610201a	! t0_kref+0x1270:   	mov	0x1a, %g3
	.word	0x86a0e001	! t0_kref+0x1274:   	subcc	%g3, 1, %g3
	.word	0x22800014	! t0_kref+0x1278:   	be,a	_kref+0x12c8
	.word	0x9140c000	! t0_kref+0x127c:   	mov	%asi, %o0
	.word	0xa8fb3e7a	! t0_kref+0x1280:   	sdivcc	%o4, -0x186, %l4
	.word	0xa688001b	! t0_kref+0x1284:   	andcc	%g0, %i3, %l3
	.word	0xda30a018	! t0_kref+0x1288:   	sth	%o5, [%g2 + 0x18]
	.word	0x93a01a32	! t0_kref+0x128c:   	fstoi	%f18, %f9
	.word	0x8da01916	! t0_kref+0x1290:   	fitod	%f22, %f6
	.word	0xa6db2006	! t0_kref+0x1294:   	smulcc	%o4, 6, %l3
	.word	0xf36e001c	! t0_kref+0x1298:   	prefetch	%i0 + %i4, 25
	.word	0xc7066000	! t0_kref+0x129c:   	ld	[%i1], %f3
	.word	0xaaaaf662	! t0_kref+0x12a0:   	andncc	%o3, -0x99e, %l5
	.word	0x89a64d30	! t0_kref+0x12a4:   	fsmuld	%f25, %f16, %f4
	.word	0xb1a70848	! t0_kref+0x12a8:   	faddd	%f28, %f8, %f24
	.word	0xe8264000	! t0_kref+0x12ac:   	st	%l4, [%i1]
	.word	0xa8a70017	! t0_kref+0x12b0:   	subcc	%i4, %l7, %l4
	.word	0xa6dd32d4	! t0_kref+0x12b4:   	smulcc	%l4, -0xd2c, %l3
	.word	0x9f414000	! t0_kref+0x12b8:   	mov	%pc, %o7
	.word	0x374fffee	! t0_kref+0x12bc:   	fbge,a,pt	%fcc0, _kref+0x1274
	.word	0x91a01903	! t0_kref+0x12c0:   	fitod	%f3, %f8
	.word	0x28bfffec	! t0_kref+0x12c4:   	bleu,a	_kref+0x1274
	.word	0xf43e3fe8	! t0_kref+0x12c8:   	std	%i2, [%i0 - 0x18]
	.word	0xab400000	! t0_kref+0x12cc:   	mov	%y, %l5
	.word	0xd59e5000	! t0_kref+0x12d0:   	ldda	[%i1]0x80, %f10
	sethi	%hi(2f), %o7
	.word	0xe40be324	! t0_kref+0x12d8:   	ldub	[%o7 + 0x324], %l2
	.word	0xa41ca00c	! t0_kref+0x12dc:   	xor	%l2, 0xc, %l2
	.word	0xe42be324	! t0_kref+0x12e0:   	stb	%l2, [%o7 + 0x324]
	.word	0x81dbe324	! t0_kref+0x12e4:   	flush	%o7 + 0x324
	.word	0xa8956ebb	! t0_kref+0x12e8:   	orcc	%l5, 0xebb, %l4
	.word	0xa5a018ca	! t0_kref+0x12ec:   	fdtos	%f10, %f18
	.word	0xda28a001	! t0_kref+0x12f0:   	stb	%o5, [%g2 + 1]
	.word	0xe8580018	! t0_kref+0x12f4:   	ldx	[%g0 + %i0], %l4
	.word	0xd620a01c	! t0_kref+0x12f8:   	st	%o3, [%g2 + 0x1c]
	.word	0xfa20a018	! t0_kref+0x12fc:   	st	%i5, [%g2 + 0x18]
	.word	0xb5a1085a	! t0_kref+0x1300:   	faddd	%f4, %f26, %f26
	.word	0xacfea907	! t0_kref+0x1304:   	sdivcc	%i2, 0x907, %l6
	.word	0x8ba709b8	! t0_kref+0x1308:   	fdivs	%f28, %f24, %f5
	.word	0xc0ae5000	! t0_kref+0x130c:   	stba	%g0, [%i1]0x80
	.word	0x38480007	! t0_kref+0x1310:   	bgu,a,pt	%icc, _kref+0x132c
	.word	0xaca5c009	! t0_kref+0x1314:   	subcc	%l7, %o1, %l6
	.word	0x91400000	! t0_kref+0x1318:   	mov	%y, %o0
	.word	0xf1bf5a19	! t0_kref+0x131c:   	stda	%f24, [%i5 + %i1]0xd0
	.word	0x22800006	! t0_kref+0x1320:   	be,a	_kref+0x1338
2:	.word	0xda28a00b	! t0_kref+0x1324:   	stb	%o5, [%g2 + 0xb]
	.word	0x9fc00004	! t0_kref+0x1328:   	call	%g0 + %g4
	.word	0x9ba3c8a7	! t0_kref+0x132c:   	fsubs	%f15, %f7, %f13
	.word	0xb3a018d0	! t0_kref+0x1330:   	fdtos	%f16, %f25
	.word	0xaa52ac56	! t0_kref+0x1334:   	umul	%o2, 0xc56, %l5
	.word	0xac62e3d8	! t0_kref+0x1338:   	subc	%o3, 0x3d8, %l6
	.word	0x878020d0	! t0_kref+0x133c:   	mov	0xd0, %asi
	.word	0x87802082	! t0_kref+0x1340:   	mov	0x82, %asi
	.word	0xae73001b	! t0_kref+0x1344:   	udiv	%o4, %i3, %l7
	.word	0x91400000	! t0_kref+0x1348:   	mov	%y, %o0
	.word	0xb5a209ce	! t0_kref+0x134c:   	fdivd	%f8, %f14, %f26
	.word	0xae0d4009	! t0_kref+0x1350:   	and	%l5, %o1, %l7
	.word	0x90ad800b	! t0_kref+0x1354:   	andncc	%l6, %o3, %o0
	.word	0x81830000	! t0_kref+0x1358:   	wr	%o4, %g0, %y
	.word	0x3c480006	! t0_kref+0x135c:   	bpos,a,pt	%icc, _kref+0x1374
	.word	0xf4be5000	! t0_kref+0x1360:   	stda	%i2, [%i1]0x80
	.word	0xe26e0000	! t0_kref+0x1364:   	ldstub	[%i0], %l1
	.word	0xec68a035	! t0_kref+0x1368:   	ldstub	[%g2 + 0x35], %l6
	.word	0x81a90a52	! t0_kref+0x136c:   	fcmpd	%fcc0, %f4, %f18
	.word	0x9daa4046	! t0_kref+0x1370:   	fmovde	%fcc0, %f6, %f14
	.word	0xd91fbd58	! t0_kref+0x1374:   	ldd	[%fp - 0x2a8], %f12
	.word	0xaa8d8000	! t0_kref+0x1378:   	andcc	%l6, %g0, %l5
	.word	0x86102003	! t0_kref+0x137c:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x1380:   	bne,a	_kref+0x1380
	.word	0x86a0e001	! t0_kref+0x1384:   	subcc	%g3, 1, %g3
	.word	0x9da00124	! t0_kref+0x1388:   	fabss	%f4, %f14
	.word	0xeb68a08d	! t0_kref+0x138c:   	prefetch	%g2 + 0x8d, 21
	.word	0xea4e3ffe	! t0_kref+0x1390:   	ldsb	[%i0 - 2], %l5
	.word	0xd0500019	! t0_kref+0x1394:   	ldsh	[%g0 + %i1], %o0
	.word	0xaf70000d	! t0_kref+0x1398:   	popc	%o5, %l7
	.word	0x86102003	! t0_kref+0x139c:   	mov	0x3, %g3
	.word	0x86a0e001	! t0_kref+0x13a0:   	subcc	%g3, 1, %g3
	.word	0x22800006	! t0_kref+0x13a4:   	be,a	_kref+0x13bc
	.word	0xa893000c	! t0_kref+0x13a8:   	orcc	%o4, %o4, %l4
	.word	0xa82a66ef	! t0_kref+0x13ac:   	andn	%o1, 0x6ef, %l4
	.word	0xaa96800a	! t0_kref+0x13b0:   	orcc	%i2, %o2, %l5
	.word	0xa8e02149	! t0_kref+0x13b4:   	subccc	%g0, 0x149, %l4
	.word	0xaac6e458	! t0_kref+0x13b8:   	addccc	%i3, 0x458, %l5
	.word	0x95a689b7	! t0_kref+0x13bc:   	fdivs	%f26, %f23, %f10
	.word	0xaa65c017	! t0_kref+0x13c0:   	subc	%l7, %l7, %l5
	.word	0xa1a688ae	! t0_kref+0x13c4:   	fsubs	%f26, %f14, %f16
	.word	0xac774009	! t0_kref+0x13c8:   	udiv	%i5, %o1, %l6
	.word	0xa740c000	! t0_kref+0x13cc:   	mov	%asi, %l3
	.word	0xed1fbef0	! t0_kref+0x13d0:   	ldd	[%fp - 0x110], %f22
	.word	0xf720a028	! t0_kref+0x13d4:   	st	%f27, [%g2 + 0x28]
	.word	0xa8e5000c	! t0_kref+0x13d8:   	subccc	%l4, %o4, %l4
	.word	0xd4b81018	! t0_kref+0x13dc:   	stda	%o2, [%g0 + %i0]0x80
	.word	0xec50a02e	! t0_kref+0x13e0:   	ldsh	[%g2 + 0x2e], %l6
	.word	0x001fffff	! t0_kref+0x13e4:   	illtrap	0x1fffff
	.word	0xe606001c	! t0_kref+0x13e8:   	ld	[%i0 + %i4], %l3
	.word	0x908f4016	! t0_kref+0x13ec:   	andcc	%i5, %l6, %o0
	.word	0x8ba208af	! t0_kref+0x13f0:   	fsubs	%f8, %f15, %f5
	.word	0xaaad800b	! t0_kref+0x13f4:   	andncc	%l6, %o3, %l5
	.word	0x97a109b1	! t0_kref+0x13f8:   	fdivs	%f4, %f17, %f11
	.word	0xe96e001a	! t0_kref+0x13fc:   	prefetch	%i0 + %i2, 20
	.word	0xafa01896	! t0_kref+0x1400:   	fitos	%f22, %f23
	.word	0xeb68a008	! t0_kref+0x1404:   	prefetch	%g2 + 8, 21
	.word	0x113f1a2c	! t0_kref+0x1408:   	sethi	%hi(0xfc68b000), %o0
	.word	0x81ad0aaa	! t0_kref+0x140c:   	fcmpes	%fcc0, %f20, %f10
	.word	0xe820a004	! t0_kref+0x1410:   	st	%l4, [%g2 + 4]
	.word	0xaa5a8014	! t0_kref+0x1414:   	smul	%o2, %l4, %l5
	.word	0xaf400000	! t0_kref+0x1418:   	mov	%y, %l7
	.word	0x20800002	! t0_kref+0x141c:   	bn,a	_kref+0x1424
	.word	0xf207bfe0	! t0_kref+0x1420:   	ld	[%fp - 0x20], %i1
	.word	0xacbac00a	! t0_kref+0x1424:   	xnorcc	%o3, %o2, %l6
	.word	0xaf3aa000	! t0_kref+0x1428:   	sra	%o2, 0x0, %l7
	.word	0xab3d001b	! t0_kref+0x142c:   	sra	%l4, %i3, %l5
	.word	0x90e2c014	! t0_kref+0x1430:   	subccc	%o3, %l4, %o0
	.word	0xc9ee501c	! t0_kref+0x1434:   	prefetcha	%i1 + %i4, 4
	.word	0xe85e3ff0	! t0_kref+0x1438:   	ldx	[%i0 - 0x10], %l4
	.word	0xa6a24008	! t0_kref+0x143c:   	subcc	%o1, %o0, %l3
	.word	0xac52a4e4	! t0_kref+0x1440:   	umul	%o2, 0x4e4, %l6
	.word	0xae750009	! t0_kref+0x1444:   	udiv	%l4, %o1, %l7
	.word	0x93a00531	! t0_kref+0x1448:   	fsqrts	%f17, %f9
	.word	0x9de3bfa0	! t0_kref+0x144c:   	save	%sp, -0x60, %sp
	.word	0xabeef6d6	! t0_kref+0x1450:   	restore	%i3, -0x92a, %l5
	.word	0xaf400000	! t0_kref+0x1454:   	mov	%y, %l7
	.word	0xd0080019	! t0_kref+0x1458:   	ldub	[%g0 + %i1], %o0
	.word	0xe6060000	! t0_kref+0x145c:   	ld	[%i0], %l3
	.word	0x28480006	! t0_kref+0x1460:   	bleu,a,pt	%icc, _kref+0x1478
	.word	0xe920a028	! t0_kref+0x1464:   	st	%f20, [%g2 + 0x28]
	.word	0xe88e9018	! t0_kref+0x1468:   	lduba	[%i2 + %i0]0x80, %l4
	.word	0xa940c000	! t0_kref+0x146c:   	mov	%asi, %l4
	.word	0xec6e6013	! t0_kref+0x1470:   	ldstub	[%i1 + 0x13], %l6
	.word	0x95a0188f	! t0_kref+0x1474:   	fitos	%f15, %f10
	.word	0xa6bd7013	! t0_kref+0x1478:   	xnorcc	%l5, -0xfed, %l3
	.word	0xac1b0009	! t0_kref+0x147c:   	xor	%o4, %o1, %l6
	.word	0x2c800004	! t0_kref+0x1480:   	bneg,a	_kref+0x1490
	.word	0x2f3a2c11	! t0_kref+0x1484:   	sethi	%hi(0xe8b04400), %l7
	.word	0x35800004	! t0_kref+0x1488:   	fbue,a	_kref+0x1498
	.word	0xe19f1a58	! t0_kref+0x148c:   	ldda	[%i4 + %i0]0xd2, %f16
	.word	0x81d927f2	! t0_kref+0x1490:   	flush	%g4 + 0x7f2
	.word	0xe830a006	! t0_kref+0x1494:   	sth	%l4, [%g2 + 6]
	.word	0xee0e7fe5	! t0_kref+0x1498:   	ldub	[%i1 - 0x1b], %l7
	.word	0x90d6bfe2	! t0_kref+0x149c:   	umulcc	%i2, -0x1e, %o0
	.word	0xe846001c	! t0_kref+0x14a0:   	ldsw	[%i0 + %i4], %l4
	.word	0x33800006	! t0_kref+0x14a4:   	fbe,a	_kref+0x14bc
	.word	0x90d6be0d	! t0_kref+0x14a8:   	umulcc	%i2, -0x1f3, %o0
	.word	0xa836fac9	! t0_kref+0x14ac:   	orn	%i3, -0x537, %l4
	.word	0xea5e2008	! t0_kref+0x14b0:   	ldx	[%i0 + 8], %l5
	.word	0xee7e4000	! t0_kref+0x14b4:   	swap	[%i1], %l7
	.word	0xee10a00c	! t0_kref+0x14b8:   	lduh	[%g2 + 0xc], %l7
	.word	0xa8c2f0b2	! t0_kref+0x14bc:   	addccc	%o3, -0xf4e, %l4
	.word	0xa1a01904	! t0_kref+0x14c0:   	fitod	%f4, %f16
	.word	0xaeb2b697	! t0_kref+0x14c4:   	orncc	%o2, -0x969, %l7
	.word	0xec5e2010	! t0_kref+0x14c8:   	ldx	[%i0 + 0x10], %l6
	.word	0x90ba637a	! t0_kref+0x14cc:   	xnorcc	%o1, 0x37a, %o0
	.word	0x26800002	! t0_kref+0x14d0:   	bl,a	_kref+0x14d8
	.word	0x912a0009	! t0_kref+0x14d4:   	sll	%o0, %o1, %o0
	.word	0x81aa0ace	! t0_kref+0x14d8:   	fcmped	%fcc0, %f8, %f14
	.word	0xd47e2004	! t0_kref+0x14dc:   	swap	[%i0 + 4], %o2
	.word	0x2f2459e2	! t0_kref+0x14e0:   	sethi	%hi(0x91678800), %l7
	.word	0xaac6a889	! t0_kref+0x14e4:   	addccc	%i2, 0x889, %l5
	.word	0xea50a02c	! t0_kref+0x14e8:   	ldsh	[%g2 + 0x2c], %l5
	.word	0xae700016	! t0_kref+0x14ec:   	udiv	%g0, %l6, %l7
	.word	0xedee101d	! t0_kref+0x14f0:   	prefetcha	%i0 + %i5, 22
	.word	0xa1a548b1	! t0_kref+0x14f4:   	fsubs	%f21, %f17, %f16
	.word	0xac0dc00d	! t0_kref+0x14f8:   	and	%l7, %o5, %l6
	.word	0xf16e001d	! t0_kref+0x14fc:   	prefetch	%i0 + %i5, 24
	.word	0x81ae8a4e	! t0_kref+0x1500:   	fcmpd	%fcc0, %f26, %f14
	.word	0x90a2400a	! t0_kref+0x1504:   	subcc	%o1, %o2, %o0
	.word	0x22480007	! t0_kref+0x1508:   	be,a,pt	%icc, _kref+0x1524
	.word	0xee0e6000	! t0_kref+0x150c:   	ldub	[%i1], %l7
	.word	0xae330008	! t0_kref+0x1510:   	orn	%o4, %o0, %l7
	.word	0xaba0002b	! t0_kref+0x1514:   	fmovs	%f11, %f21
	.word	0xebee501c	! t0_kref+0x1518:   	prefetcha	%i1 + %i4, 21
	.word	0xa902401b	! t0_kref+0x151c:   	taddcc	%o1, %i3, %l4
	.word	0xda300018	! t0_kref+0x1520:   	sth	%o5, [%g0 + %i0]
	.word	0x9de3bfa0	! t0_kref+0x1524:   	save	%sp, -0x60, %sp
	.word	0xb686fcf6	! t0_kref+0x1528:   	addcc	%i3, -0x30a, %i3
	.word	0xa9eeead0	! t0_kref+0x152c:   	restore	%i3, 0xad0, %l4
	.word	0xac9d401a	! t0_kref+0x1530:   	xorcc	%l5, %i2, %l6
	.word	0xae5f63f4	! t0_kref+0x1534:   	smul	%i5, 0x3f4, %l7
	.word	0xb6103ffe	! t0_kref+0x1538:   	mov	0xfffffffe, %i3
	.word	0x89a50952	! t0_kref+0x153c:   	fmuld	%f20, %f18, %f4
	.word	0x90050017	! t0_kref+0x1540:   	add	%l4, %l7, %o0
	.word	0xea563ffc	! t0_kref+0x1544:   	ldsh	[%i0 - 4], %l5
	.word	0xb5a5882b	! t0_kref+0x1548:   	fadds	%f22, %f11, %f26
	.word	0xb9a018ca	! t0_kref+0x154c:   	fdtos	%f10, %f28
	.word	0xa68ec016	! t0_kref+0x1550:   	andcc	%i3, %l6, %l3
	.word	0xada018c6	! t0_kref+0x1554:   	fdtos	%f6, %f22
	.word	0x2c800004	! t0_kref+0x1558:   	bneg,a	_kref+0x1568
	.word	0xace2791c	! t0_kref+0x155c:   	subccc	%o1, -0x6e4, %l6
	.word	0x24800007	! t0_kref+0x1560:   	ble,a	_kref+0x157c
	.word	0xb1a34d29	! t0_kref+0x1564:   	fsmuld	%f13, %f9, %f24
	.word	0xacdf7327	! t0_kref+0x1568:   	smulcc	%i5, -0xcd9, %l6
	.word	0xad332014	! t0_kref+0x156c:   	srl	%o4, 0x14, %l6
	.word	0xd030a006	! t0_kref+0x1570:   	sth	%o0, [%g2 + 6]
	.word	0xeb6e6000	! t0_kref+0x1574:   	prefetch	%i1, 21
	.word	0x31480003	! t0_kref+0x1578:   	fba,a,pt	%fcc0, _kref+0x1584
	.word	0xaebb6f0f	! t0_kref+0x157c:   	xnorcc	%o5, 0xf0f, %l7
	.word	0x81adcab8	! t0_kref+0x1580:   	fcmpes	%fcc0, %f23, %f24
	.word	0xd030a008	! t0_kref+0x1584:   	sth	%o0, [%g2 + 8]
	.word	0xae8db62e	! t0_kref+0x1588:   	andcc	%l6, -0x9d2, %l7
	.word	0xe850a022	! t0_kref+0x158c:   	ldsh	[%g2 + 0x22], %l4
	.word	0x8143e077	! t0_kref+0x1590:   	membar	0x77
	.word	0xada388b3	! t0_kref+0x1594:   	fsubs	%f14, %f19, %f22
	.word	0x91a0053b	! t0_kref+0x1598:   	fsqrts	%f27, %f8
	.word	0xa69d0008	! t0_kref+0x159c:   	xorcc	%l4, %o0, %l3
	.word	0xea0e8018	! t0_kref+0x15a0:   	ldub	[%i2 + %i0], %l5
	.word	0xd9062018	! t0_kref+0x15a4:   	ld	[%i0 + 0x18], %f12
	.word	0xec16200e	! t0_kref+0x15a8:   	lduh	[%i0 + 0xe], %l6
	.word	0x33800005	! t0_kref+0x15ac:   	fbe,a	_kref+0x15c0
	.word	0x8da4cd3c	! t0_kref+0x15b0:   	fsmuld	%f19, %f28, %f6
	.word	0x8da00535	! t0_kref+0x15b4:   	fsqrts	%f21, %f6
	.word	0x90524017	! t0_kref+0x15b8:   	umul	%o1, %l7, %o0
	.word	0x9fc00004	! t0_kref+0x15bc:   	call	%g0 + %g4
	.word	0x95a509d2	! t0_kref+0x15c0:   	fdivd	%f20, %f18, %f10
	.word	0x2d05b77c	! t0_kref+0x15c4:   	sethi	%hi(0x16ddf000), %l6
	.word	0x36480008	! t0_kref+0x15c8:   	bge,a,pt	%icc, _kref+0x15e8
	.word	0xa3a0013c	! t0_kref+0x15cc:   	fabss	%f28, %f17
	.word	0xaee20000	! t0_kref+0x15d0:   	subccc	%o0, %g0, %l7
	.word	0xd1bf1a19	! t0_kref+0x15d4:   	stda	%f8, [%i4 + %i1]0xd0
	.word	0xd4380019	! t0_kref+0x15d8:   	std	%o2, [%g0 + %i1]
	.word	0xec4e001a	! t0_kref+0x15dc:   	ldsb	[%i0 + %i2], %l6
	.word	0x8da388a4	! t0_kref+0x15e0:   	fsubs	%f14, %f4, %f6
	.word	0x81828000	! t0_kref+0x15e4:   	wr	%o2, %g0, %y
	.word	0x9de3bfa0	! t0_kref+0x15e8:   	save	%sp, -0x60, %sp
	.word	0xb05e6af9	! t0_kref+0x15ec:   	smul	%i1, 0xaf9, %i0
	.word	0xadef0018	! t0_kref+0x15f0:   	restore	%i4, %i0, %l6
	.word	0xee40a024	! t0_kref+0x15f4:   	ldsw	[%g2 + 0x24], %l7
	.word	0xe8100018	! t0_kref+0x15f8:   	lduh	[%g0 + %i0], %l4
	.word	0x2b800008	! t0_kref+0x15fc:   	fbug,a	_kref+0x161c
	.word	0x9da68946	! t0_kref+0x1600:   	fmuld	%f26, %f6, %f14
	.word	0xa3a0188b	! t0_kref+0x1604:   	fitos	%f11, %f17
	.word	0xad2da004	! t0_kref+0x1608:   	sll	%l6, 0x4, %l6
	.word	0xa8fd2b21	! t0_kref+0x160c:   	sdivcc	%l4, 0xb21, %l4
	.word	0xf8266018	! t0_kref+0x1610:   	st	%i4, [%i1 + 0x18]
	.word	0x34480008	! t0_kref+0x1614:   	bg,a,pt	%icc, _kref+0x1634
	.word	0xa5a20844	! t0_kref+0x1618:   	faddd	%f8, %f4, %f18
	.word	0xdfa65000	! t0_kref+0x161c:   	sta	%f15, [%i1]0x80
	.word	0xc16e001d	! t0_kref+0x1620:   	prefetch	%i0 + %i5, 0
	.word	0xaa47400a	! t0_kref+0x1624:   	addc	%i5, %o2, %l5
	.word	0xcd3e001d	! t0_kref+0x1628:   	std	%f6, [%i0 + %i5]
	.word	0xa8fa250e	! t0_kref+0x162c:   	sdivcc	%o0, 0x50e, %l4
	.word	0xec28a02a	! t0_kref+0x1630:   	stb	%l6, [%g2 + 0x2a]
	.word	0xe850a038	! t0_kref+0x1634:   	ldsh	[%g2 + 0x38], %l4
	.word	0xab3d6007	! t0_kref+0x1638:   	sra	%l5, 0x7, %l5
	.word	0xaa5f4014	! t0_kref+0x163c:   	smul	%i5, %l4, %l5
	.word	0xaa077f1a	! t0_kref+0x1640:   	add	%i5, -0xe6, %l5
	.word	0x99a00130	! t0_kref+0x1644:   	fabss	%f16, %f12
	.word	0xa8c02549	! t0_kref+0x1648:   	addccc	%g0, 0x549, %l4
	.word	0xa5a01886	! t0_kref+0x164c:   	fitos	%f6, %f18
	.word	0xe8467fec	! t0_kref+0x1650:   	ldsw	[%i1 - 0x14], %l4
	.word	0xfa260000	! t0_kref+0x1654:   	st	%i5, [%i0]
	.word	0x3e800008	! t0_kref+0x1658:   	bvc,a	_kref+0x1678
	.word	0x87a708ab	! t0_kref+0x165c:   	fsubs	%f28, %f11, %f3
	.word	0xeb06401c	! t0_kref+0x1660:   	ld	[%i1 + %i4], %f21
	.word	0xa69a800a	! t0_kref+0x1664:   	xorcc	%o2, %o2, %l3
	.word	0xaba388a4	! t0_kref+0x1668:   	fsubs	%f14, %f4, %f21
	.word	0x2a800007	! t0_kref+0x166c:   	bcs,a	_kref+0x1688
	.word	0xac9db8c9	! t0_kref+0x1670:   	xorcc	%l6, -0x737, %l6
	.word	0x9072c00b	! t0_kref+0x1674:   	udiv	%o3, %o3, %o0
	.word	0xaf3f0016	! t0_kref+0x1678:   	sra	%i4, %l6, %l7
	.word	0x90900008	! t0_kref+0x167c:   	orcc	%g0, %o0, %o0
	.word	0xb7a018da	! t0_kref+0x1680:   	fdtos	%f26, %f27
	.word	0xe100a014	! t0_kref+0x1684:   	ld	[%g2 + 0x14], %f16
	.word	0x36480002	! t0_kref+0x1688:   	bge,a,pt	%icc, _kref+0x1690
	.word	0xae426911	! t0_kref+0x168c:   	addc	%o1, 0x911, %l7
	.word	0x3c480003	! t0_kref+0x1690:   	bpos,a,pt	%icc, _kref+0x169c
	.word	0x11375d8f	! t0_kref+0x1694:   	sethi	%hi(0xdd763c00), %o0
	.word	0xafa3893b	! t0_kref+0x1698:   	fmuls	%f14, %f27, %f23
	.word	0xea48a033	! t0_kref+0x169c:   	ldsb	[%g2 + 0x33], %l5
	.word	0xafa0188b	! t0_kref+0x16a0:   	fitos	%f11, %f23
	.word	0xaf1ac014	! t0_kref+0x16a4:   	tsubcctv	%o3, %l4, %l7
	.word	0xa6aa801d	! t0_kref+0x16a8:   	andncc	%o2, %i5, %l3
	.word	0x86102002	! t0_kref+0x16ac:   	mov	0x2, %g3
	.word	0x86a0e001	! t0_kref+0x16b0:   	subcc	%g3, 1, %g3
	.word	0x2280000b	! t0_kref+0x16b4:   	be,a	_kref+0x16e0
	.word	0xe96e401d	! t0_kref+0x16b8:   	prefetch	%i1 + %i5, 20
	.word	0xa826a5e2	! t0_kref+0x16bc:   	sub	%i2, 0x5e2, %l4
	.word	0x913a601e	! t0_kref+0x16c0:   	sra	%o1, 0x1e, %o0
	.word	0xe810a01a	! t0_kref+0x16c4:   	lduh	[%g2 + 0x1a], %l4
	.word	0xd8b6501b	! t0_kref+0x16c8:   	stha	%o4, [%i1 + %i3]0x80
	.word	0xae5d2776	! t0_kref+0x16cc:   	smul	%l4, 0x776, %l7
	.word	0x91a109cc	! t0_kref+0x16d0:   	fdivd	%f4, %f12, %f8
	.word	0xe600a028	! t0_kref+0x16d4:   	ld	[%g2 + 0x28], %l3
	.word	0xb3a0188b	! t0_kref+0x16d8:   	fitos	%f11, %f25
	.word	0xaa8ac00a	! t0_kref+0x16dc:   	andcc	%o3, %o2, %l5
	.word	0xe848a01d	! t0_kref+0x16e0:   	ldsb	[%g2 + 0x1d], %l4
	.word	0xaf3de002	! t0_kref+0x16e4:   	sra	%l7, 0x2, %l7
	.word	0xacdf6962	! t0_kref+0x16e8:   	smulcc	%i5, 0x962, %l6
	.word	0xb5a00539	! t0_kref+0x16ec:   	fsqrts	%f25, %f26
	.word	0x2d0ebc41	! t0_kref+0x16f0:   	sethi	%hi(0x3af10400), %l6
	.word	0xaa9efeb5	! t0_kref+0x16f4:   	xorcc	%i3, -0x14b, %l5
	.word	0xaf3f0017	! t0_kref+0x16f8:   	sra	%i4, %l7, %l7
	.word	0xb9a00146	! t0_kref+0x16fc:   	fabsd	%f6, %f28
	.word	0xe46e8018	! t0_kref+0x1700:   	ldstub	[%i2 + %i0], %l2
	.word	0xae5ec015	! t0_kref+0x1704:   	smul	%i3, %l5, %l7
	.word	0x8da48d33	! t0_kref+0x1708:   	fsmuld	%f18, %f19, %f6
	.word	0xad418000	! t0_kref+0x170c:   	mov	%fprs, %l6
	.word	0xb1a6c9b4	! t0_kref+0x1710:   	fdivs	%f27, %f20, %f24
	.word	0xd4700018	! t0_kref+0x1714:   	stx	%o2, [%g0 + %i0]
	.word	0xebee501c	! t0_kref+0x1718:   	prefetcha	%i1 + %i4, 21
	.word	0xaa2275d4	! t0_kref+0x171c:   	sub	%o1, -0xa2c, %l5
	.word	0xe53e2008	! t0_kref+0x1720:   	std	%f18, [%i0 + 8]
	.word	0xacbf2bbc	! t0_kref+0x1724:   	xnorcc	%i4, 0xbbc, %l6
	.word	0x001fffff	! t0_kref+0x1728:   	illtrap	0x1fffff
	.word	0x81aaca33	! t0_kref+0x172c:   	fcmps	%fcc0, %f11, %f19
	.word	0xa9400000	! t0_kref+0x1730:   	mov	%y, %l4
	sethi	%hi(2f), %o7
	.word	0xe40be36c	! t0_kref+0x1738:   	ldub	[%o7 + 0x36c], %l2
	.word	0xa41ca00c	! t0_kref+0x173c:   	xor	%l2, 0xc, %l2
	.word	0xe42be36c	! t0_kref+0x1740:   	stb	%l2, [%o7 + 0x36c]
	.word	0x81dbe36c	! t0_kref+0x1744:   	flush	%o7 + 0x36c
	.word	0x95a018da	! t0_kref+0x1748:   	fdtos	%f26, %f10
	.word	0x81d935cd	! t0_kref+0x174c:   	flush	%g4 - 0xa33
	.word	0xf76e401a	! t0_kref+0x1750:   	prefetch	%i1 + %i2, 27
	.word	0x81580000	! t0_kref+0x1754:   	flushw
	.word	0xae3ec014	! t0_kref+0x1758:   	xnor	%i3, %l4, %l7
	.word	0x9fc10000	! t0_kref+0x175c:   	call	%g4
	.word	0xf8360000	! t0_kref+0x1760:   	sth	%i4, [%i0]
	.word	0xacdf6b96	! t0_kref+0x1764:   	smulcc	%i5, 0xb96, %l6
	.word	0x89a64d3a	! t0_kref+0x1768:   	fsmuld	%f25, %f26, %f4
2:	.word	0xe0981018	! t0_kref+0x176c:   	ldda	[%g0 + %i0]0x80, %l0
	.word	0x8da0012e	! t0_kref+0x1770:   	fabss	%f14, %f6
	.word	0x22480008	! t0_kref+0x1774:   	be,a,pt	%icc, _kref+0x1794
	.word	0xa88b6ec9	! t0_kref+0x1778:   	andcc	%o5, 0xec9, %l4
	.word	0x9075657a	! t0_kref+0x177c:   	udiv	%l5, 0x57a, %o0
	.word	0x91a30954	! t0_kref+0x1780:   	fmuld	%f12, %f20, %f8
	.word	0x34480004	! t0_kref+0x1784:   	bg,a,pt	%icc, _kref+0x1794
	.word	0xada00129	! t0_kref+0x1788:   	fabss	%f9, %f22
	.word	0xec4e600f	! t0_kref+0x178c:   	ldsb	[%i1 + 0xf], %l6
	.word	0xa8724009	! t0_kref+0x1790:   	udiv	%o1, %o1, %l4
	.word	0xf16e7ff0	! t0_kref+0x1794:   	prefetch	%i1 - 0x10, 24
	.word	0x95a01906	! t0_kref+0x1798:   	fitod	%f6, %f10
	.word	0x913b2010	! t0_kref+0x179c:   	sra	%o4, 0x10, %o0
	.word	0xa645c00d	! t0_kref+0x17a0:   	addc	%l7, %o5, %l3
	.word	0x11328763	! t0_kref+0x17a4:   	sethi	%hi(0xca1d8c00), %o0
	.word	0x9f414000	! t0_kref+0x17a8:   	mov	%pc, %o7
	.word	0xa1a01906	! t0_kref+0x17ac:   	fitod	%f6, %f16
	.word	0xa738000a	! t0_kref+0x17b0:   	sra	%g0, %o2, %l3
	.word	0x2a800006	! t0_kref+0x17b4:   	bcs,a	_kref+0x17cc
	.word	0x99a54828	! t0_kref+0x17b8:   	fadds	%f21, %f8, %f12
	.word	0xb9a18852	! t0_kref+0x17bc:   	faddd	%f6, %f18, %f28
	.word	0xc12e401c	! t0_kref+0x17c0:   	st	%fsr, [%i1 + %i4]
	.word	0x91a84058	! t0_kref+0x17c4:   	fmovdne	%fcc0, %f24, %f8
	.word	0x2f1ba788	! t0_kref+0x17c8:   	sethi	%hi(0x6e9e2000), %l7
	.word	0xd320a034	! t0_kref+0x17cc:   	st	%f9, [%g2 + 0x34]
	.word	0xad3a4014	! t0_kref+0x17d0:   	sra	%o1, %l4, %l6
	.word	0xe6162004	! t0_kref+0x17d4:   	lduh	[%i0 + 4], %l3
	.word	0x8143e040	! t0_kref+0x17d8:   	membar	0x40
	.word	0xa83771fb	! t0_kref+0x17dc:   	orn	%i5, -0xe05, %l4
	.word	0xac5f400c	! t0_kref+0x17e0:   	smul	%i5, %o4, %l6
	.word	0xd9266018	! t0_kref+0x17e4:   	st	%f12, [%i1 + 0x18]
	.word	0xe26e4000	! t0_kref+0x17e8:   	ldstub	[%i1], %l1
	.word	0xd1380019	! t0_kref+0x17ec:   	std	%f8, [%g0 + %i1]
	.word	0xd86e8018	! t0_kref+0x17f0:   	ldstub	[%i2 + %i0], %o4
	.word	0xa92d8000	! t0_kref+0x17f4:   	sll	%l6, %g0, %l4
	.word	0x8ba208ac	! t0_kref+0x17f8:   	fsubs	%f8, %f12, %f5
	.word	0xd300a010	! t0_kref+0x17fc:   	ld	[%g2 + 0x10], %f9
	.word	0xa93b401b	! t0_kref+0x1800:   	sra	%o5, %i3, %l4
	.word	0x81ae8a27	! t0_kref+0x1804:   	fcmps	%fcc0, %f26, %f7
	.word	0xecfe501c	! t0_kref+0x1808:   	swapa	[%i1 + %i4]0x80, %l6
	.word	0xec270018	! t0_kref+0x180c:   	st	%l6, [%i4 + %i0]
	.word	0xe7ee101a	! t0_kref+0x1810:   	prefetcha	%i0 + %i2, 19
	.word	0xa833401b	! t0_kref+0x1814:   	orn	%o5, %i3, %l4
	.word	0xa6623d09	! t0_kref+0x1818:   	subc	%o0, -0x2f7, %l3
	.word	0xd04e3fe5	! t0_kref+0x181c:   	ldsb	[%i0 - 0x1b], %o0
	.word	0xa6028017	! t0_kref+0x1820:   	add	%o2, %l7, %l3
	.word	0xc36e4009	! t0_kref+0x1824:   	prefetch	%i1 + %o1, 1
	.word	0x909eb12e	! t0_kref+0x1828:   	xorcc	%i2, -0xed2, %o0
	.word	0xaa30370b	! t0_kref+0x182c:   	orn	%g0, -0x8f5, %l5
	.word	0xe26e7ffc	! t0_kref+0x1830:   	ldstub	[%i1 - 4], %l1
	.word	0x9de3bfa0	! t0_kref+0x1834:   	save	%sp, -0x60, %sp
	.word	0xbab6a7dc	! t0_kref+0x1838:   	orncc	%i2, 0x7dc, %i5
	.word	0xa9eec01c	! t0_kref+0x183c:   	restore	%i3, %i4, %l4
	.word	0xda7e601c	! t0_kref+0x1840:   	swap	[%i1 + 0x1c], %o5
	.word	0x8da58848	! t0_kref+0x1844:   	faddd	%f22, %f8, %f6
	.word	0xaa0a401b	! t0_kref+0x1848:   	and	%o1, %i3, %l5
	.word	0x8143e040	! t0_kref+0x184c:   	membar	0x40
	.word	0xad703a27	! t0_kref+0x1850:   	popc	-0x5d9, %l6
	.word	0x81a90a42	! t0_kref+0x1854:   	fcmpd	%fcc0, %f4, %f2
	sethi	%hi(2f), %o7
	.word	0xe40be074	! t0_kref+0x185c:   	ldub	[%o7 + 0x74], %l2
	.word	0xa41ca00c	! t0_kref+0x1860:   	xor	%l2, 0xc, %l2
	.word	0xe42be074	! t0_kref+0x1864:   	stb	%l2, [%o7 + 0x74]
	.word	0x81dbe074	! t0_kref+0x1868:   	flush	%o7 + 0x74
	.word	0xa8472dc1	! t0_kref+0x186c:   	addc	%i4, 0xdc1, %l4
	.word	0x2d1603ed	! t0_kref+0x1870:   	sethi	%hi(0x580fb400), %l6
2:	.word	0x9da01905	! t0_kref+0x1874:   	fitod	%f5, %f14
	.word	0x878020e0	! t0_kref+0x1878:   	mov	0xe0, %asi
	.word	0xe99e5a5d	! t0_kref+0x187c:   	ldda	[%i1 + %i5]0xd2, %f20
	.word	0x81aa0a27	! t0_kref+0x1880:   	fcmps	%fcc0, %f8, %f7
	.word	0xab400000	! t0_kref+0x1884:   	mov	%y, %l5
	.word	0xa8d76df8	! t0_kref+0x1888:   	umulcc	%i5, 0xdf8, %l4
	.word	0xae5ec009	! t0_kref+0x188c:   	smul	%i3, %o1, %l7
	.word	0x9022bc8a	! t0_kref+0x1890:   	sub	%o2, -0x376, %o0
	.word	0x3a800007	! t0_kref+0x1894:   	bcc,a	_kref+0x18b0
	.word	0xac42b580	! t0_kref+0x1898:   	addc	%o2, -0xa80, %l6
	.word	0x93a6893c	! t0_kref+0x189c:   	fmuls	%f26, %f28, %f9
	.word	0xd7063ff8	! t0_kref+0x18a0:   	ld	[%i0 - 8], %f11
	.word	0x95a00044	! t0_kref+0x18a4:   	fmovd	%f4, %f10
	.word	0xe91fbc08	! t0_kref+0x18a8:   	ldd	[%fp - 0x3f8], %f20
	.word	0xea40a034	! t0_kref+0x18ac:   	ldsw	[%g2 + 0x34], %l5
	.word	0xec961000	! t0_kref+0x18b0:   	lduha	[%i0]0x80, %l6
	.word	0xd53e401d	! t0_kref+0x18b4:   	std	%f10, [%i1 + %i5]
	.word	0xc768a08e	! t0_kref+0x18b8:   	prefetch	%g2 + 0x8e, 3
	.word	0xae6324d5	! t0_kref+0x18bc:   	subc	%o4, 0x4d5, %l7
	call	SYM(t0_subr3)
	.word	0xf5ee501d	! t0_kref+0x18c4:   	prefetcha	%i1 + %i5, 26
	.word	0x91a648b1	! t0_kref+0x18c8:   	fsubs	%f25, %f17, %f8
	.word	0xdf06001c	! t0_kref+0x18cc:   	ld	[%i0 + %i4], %f15
	.word	0xd3067ffc	! t0_kref+0x18d0:   	ld	[%i1 - 4], %f9
	.word	0xa92d2006	! t0_kref+0x18d4:   	sll	%l4, 0x6, %l4
	.word	0x81d84015	! t0_kref+0x18d8:   	flush	%g1 + %l5
	.word	0xae233d44	! t0_kref+0x18dc:   	sub	%o4, -0x2bc, %l7
	.word	0x3c480002	! t0_kref+0x18e0:   	bpos,a,pt	%icc, _kref+0x18e8
	.word	0xe64e6005	! t0_kref+0x18e4:   	ldsb	[%i1 + 5], %l3
	.word	0xd0160000	! t0_kref+0x18e8:   	lduh	[%i0], %o0
	.word	0xc76e401a	! t0_kref+0x18ec:   	prefetch	%i1 + %i2, 3
	.word	0x33800002	! t0_kref+0x18f0:   	fbe,a	_kref+0x18f8
	.word	0xa9aa0048	! t0_kref+0x18f4:   	fmovda	%fcc0, %f8, %f20
	.word	0x30800003	! t0_kref+0x18f8:   	ba,a	_kref+0x1904
	.word	0x9005000d	! t0_kref+0x18fc:   	add	%l4, %o5, %o0
	.word	0xc06e600a	! t0_kref+0x1900:   	ldstub	[%i1 + 0xa], %g0
	.word	0xe8580019	! t0_kref+0x1904:   	ldx	[%g0 + %i1], %l4
	.word	0xaafda804	! t0_kref+0x1908:   	sdivcc	%l6, 0x804, %l5
	.word	0xaafb000b	! t0_kref+0x190c:   	sdivcc	%o4, %o3, %l5
	.word	0xd628a022	! t0_kref+0x1910:   	stb	%o3, [%g2 + 0x22]
	.word	0xd81e0000	! t0_kref+0x1914:   	ldd	[%i0], %o4
	.word	0xb5a00137	! t0_kref+0x1918:   	fabss	%f23, %f26
	.word	0x9ba4c8a5	! t0_kref+0x191c:   	fsubs	%f19, %f5, %f13
	.word	0x903562b3	! t0_kref+0x1920:   	orn	%l5, 0x2b3, %o0
	.word	0x28800003	! t0_kref+0x1924:   	bleu,a	_kref+0x1930
	.word	0xac7a35e1	! t0_kref+0x1928:   	sdiv	%o0, -0xa1f, %l6
	.word	0xa1a0052d	! t0_kref+0x192c:   	fsqrts	%f13, %f16
	.word	0xaa5eba23	! t0_kref+0x1930:   	smul	%i2, -0x5dd, %l5
	.word	0x81aeca26	! t0_kref+0x1934:   	fcmps	%fcc0, %f27, %f6
	.word	0xa845e967	! t0_kref+0x1938:   	addc	%l7, 0x967, %l4
	.word	0x97a1c92f	! t0_kref+0x193c:   	fmuls	%f7, %f15, %f11
	.word	0xaad2001a	! t0_kref+0x1940:   	umulcc	%o0, %i2, %l5
	.word	0xa90372ac	! t0_kref+0x1944:   	taddcc	%o5, -0xd54, %l4
	.word	0x8da34d35	! t0_kref+0x1948:   	fsmuld	%f13, %f21, %f6
	.word	0xe600a024	! t0_kref+0x194c:   	ld	[%g2 + 0x24], %l3
	.word	0xee063fe8	! t0_kref+0x1950:   	ld	[%i0 - 0x18], %l7
	.word	0x90b58016	! t0_kref+0x1954:   	orncc	%l6, %l6, %o0
	.word	0xa9a00525	! t0_kref+0x1958:   	fsqrts	%f5, %f20
	.word	0xea801019	! t0_kref+0x195c:   	lda	[%g0 + %i1]0x80, %l5
	.word	0x87a0002b	! t0_kref+0x1960:   	fmovs	%f11, %f3
	.word	0x24480008	! t0_kref+0x1964:   	ble,a,pt	%icc, _kref+0x1984
	.word	0xa7a01884	! t0_kref+0x1968:   	fitos	%f4, %f19
	.word	0x2a800007	! t0_kref+0x196c:   	bcs,a	_kref+0x1988
	.word	0xb9a018c4	! t0_kref+0x1970:   	fdtos	%f4, %f28
	.word	0xef20a008	! t0_kref+0x1974:   	st	%f23, [%g2 + 8]
	.word	0x9ba6c92a	! t0_kref+0x1978:   	fmuls	%f27, %f10, %f13
	.word	0xaba7082a	! t0_kref+0x197c:   	fadds	%f28, %f10, %f21
	.word	0xd2a01019	! t0_kref+0x1980:   	sta	%o1, [%g0 + %i1]0x80
	.word	0xd0500018	! t0_kref+0x1984:   	ldsh	[%g0 + %i0], %o0
	.word	0x9fc10000	! t0_kref+0x1988:   	call	%g4
	.word	0xac1d324f	! t0_kref+0x198c:   	xor	%l4, -0xdb1, %l6
	.word	0xaeb6b7ec	! t0_kref+0x1990:   	orncc	%i2, -0x814, %l7
	.word	0xa6320017	! t0_kref+0x1994:   	orn	%o0, %l7, %l3
	.word	0xf900a030	! t0_kref+0x1998:   	ld	[%g2 + 0x30], %f28
	.word	0x93a20837	! t0_kref+0x199c:   	fadds	%f8, %f23, %f9
	.word	0xa7700015	! t0_kref+0x19a0:   	popc	%l5, %l3
	.word	0xa8a33400	! t0_kref+0x19a4:   	subcc	%o4, -0xc00, %l4
	.word	0x28480004	! t0_kref+0x19a8:   	bleu,a,pt	%icc, _kref+0x19b8
	.word	0xd1be501d	! t0_kref+0x19ac:   	stda	%f8, [%i1 + %i5]0x80
	.word	0xee10a032	! t0_kref+0x19b0:   	lduh	[%g2 + 0x32], %l7
	.word	0xaa3e8000	! t0_kref+0x19b4:   	not	%i2, %l5
	.word	0xa80ac008	! t0_kref+0x19b8:   	and	%o3, %o0, %l4
	.word	0x2b480001	! t0_kref+0x19bc:   	fbug,a,pt	%fcc0, _kref+0x19c0
	.word	0x8d83000c	! t0_kref+0x19c0:   	wr	%o4, %o4, %fprs
	.word	0xaafa697c	! t0_kref+0x19c4:   	sdivcc	%o1, 0x97c, %l5
	.word	0xae32f585	! t0_kref+0x19c8:   	orn	%o3, -0xa7b, %l7
	.word	0xae0569a7	! t0_kref+0x19cc:   	add	%l5, 0x9a7, %l7
	.word	0xe93f4019	! t0_kref+0x19d0:   	std	%f20, [%i5 + %i1]
	.word	0xf1be5a5d	! t0_kref+0x19d4:   	stda	%f24, [%i1 + %i5]0xd2
	.word	0xc0266014	! t0_kref+0x19d8:   	clr	[%i1 + 0x14]
	.word	0xae35c01c	! t0_kref+0x19dc:   	orn	%l7, %i4, %l7
	.word	0xe93e7fe0	! t0_kref+0x19e0:   	std	%f20, [%i1 - 0x20]
	.word	0xada3cd26	! t0_kref+0x19e4:   	fsmuld	%f15, %f6, %f22
	.word	0xe120a034	! t0_kref+0x19e8:   	st	%f16, [%g2 + 0x34]
	.word	0xac232f3c	! t0_kref+0x19ec:   	sub	%o4, 0xf3c, %l6
	.word	0x9da689da	! t0_kref+0x19f0:   	fdivd	%f26, %f26, %f14
	.word	0xa1a40d2c	! t0_kref+0x19f4:   	fsmuld	%f16, %f12, %f16
	.word	0xc1e6101b	! t0_kref+0x19f8:   	casa	[%i0]0x80, %i3, %g0
	.word	0xf100a030	! t0_kref+0x19fc:   	ld	[%g2 + 0x30], %f24
	.word	0xaf3f401d	! t0_kref+0x1a00:   	sra	%i5, %i5, %l7
	.word	0xec16c019	! t0_kref+0x1a04:   	lduh	[%i3 + %i1], %l6
	.word	0xa852000d	! t0_kref+0x1a08:   	umul	%o0, %o5, %l4
	.word	0xe168a007	! t0_kref+0x1a0c:   	prefetch	%g2 + 7, 16
	.word	0xe8500019	! t0_kref+0x1a10:   	ldsh	[%g0 + %i1], %l4
	.word	0xe9be5000	! t0_kref+0x1a14:   	stda	%f20, [%i1]0x80
	.word	0xac2dfa8b	! t0_kref+0x1a18:   	andn	%l7, -0x575, %l6
	.word	0x8143e040	! t0_kref+0x1a1c:   	membar	0x40
	.word	0xae0d4009	! t0_kref+0x1a20:   	and	%l5, %o1, %l7
	.word	0xae424000	! t0_kref+0x1a24:   	addc	%o1, %g0, %l7
	.word	0xac356461	! t0_kref+0x1a28:   	orn	%l5, 0x461, %l6
	.word	0x86102015	! t0_kref+0x1a2c:   	mov	0x15, %g3
	.word	0x86a0e001	! t0_kref+0x1a30:   	subcc	%g3, 1, %g3
	.word	0x2280000f	! t0_kref+0x1a34:   	be,a	_kref+0x1a70
	.word	0xa7082463	! t0_kref+0x1a38:   	tsubcc	%g0, 0x463, %l3
	.word	0x3c480007	! t0_kref+0x1a3c:   	bpos,a,pt	%icc, _kref+0x1a58
	.word	0xf9ee101a	! t0_kref+0x1a40:   	prefetcha	%i0 + %i2, 28
	.word	0xb1a649b5	! t0_kref+0x1a44:   	fdivs	%f25, %f21, %f24
	.word	0x2d3e31f1	! t0_kref+0x1a48:   	sethi	%hi(0xf8c7c400), %l6
	.word	0xb9a0012a	! t0_kref+0x1a4c:   	fabss	%f10, %f28
	.word	0xa3a01a2f	! t0_kref+0x1a50:   	fstoi	%f15, %f17
	.word	0x9fa0052f	! t0_kref+0x1a54:   	fsqrts	%f15, %f15
	.word	0xa80d801a	! t0_kref+0x1a58:   	and	%l6, %i2, %l4
	.word	0x2b197049	! t0_kref+0x1a5c:   	sethi	%hi(0x65c12400), %l5
	.word	0x81a94a39	! t0_kref+0x1a60:   	fcmps	%fcc0, %f5, %f25
	.word	0xe64e2005	! t0_kref+0x1a64:   	ldsb	[%i0 + 5], %l3
	.word	0xb3a00136	! t0_kref+0x1a68:   	fabss	%f22, %f25
	.word	0xac924016	! t0_kref+0x1a6c:   	orcc	%o1, %l6, %l6
	.word	0xab400000	! t0_kref+0x1a70:   	mov	%y, %l5
	.word	0xf320a014	! t0_kref+0x1a74:   	st	%f25, [%g2 + 0x14]
	.word	0x9da01905	! t0_kref+0x1a78:   	fitod	%f5, %f14
	.word	0xf500a03c	! t0_kref+0x1a7c:   	ld	[%g2 + 0x3c], %f26
	.word	0xaafd0000	! t0_kref+0x1a80:   	sdivcc	%l4, %g0, %l5
	.word	0xf53f4019	! t0_kref+0x1a84:   	std	%f26, [%i5 + %i1]
	.word	0xa832aa58	! t0_kref+0x1a88:   	orn	%o2, 0xa58, %l4
	.word	0x9fc00004	! t0_kref+0x1a8c:   	call	%g0 + %g4
	.word	0xb9a4094c	! t0_kref+0x1a90:   	fmuld	%f16, %f12, %f28
	.word	0x2f800005	! t0_kref+0x1a94:   	fbu,a	_kref+0x1aa8
	.word	0xd6202440	! t0_kref+0x1a98:   	st	%o3, [%g0 + 0x440]
	.word	0xd028a01c	! t0_kref+0x1a9c:   	stb	%o0, [%g2 + 0x1c]
	.word	0xac52a829	! t0_kref+0x1aa0:   	umul	%o2, 0x829, %l6
	.word	0xc9067fe4	! t0_kref+0x1aa4:   	ld	[%i1 - 0x1c], %f4
	.word	0xa9a0110c	! t0_kref+0x1aa8:   	fxtod	%f12, %f20
	.word	0x86102006	! t0_kref+0x1aac:   	mov	0x6, %g3
	.word	0x86a0e001	! t0_kref+0x1ab0:   	subcc	%g3, 1, %g3
	.word	0x22800006	! t0_kref+0x1ab4:   	be,a	_kref+0x1acc
	.word	0xa83dc016	! t0_kref+0x1ab8:   	xnor	%l7, %l6, %l4
	.word	0x8fa70836	! t0_kref+0x1abc:   	fadds	%f28, %f22, %f7
	.word	0xa8070000	! t0_kref+0x1ac0:   	add	%i4, %g0, %l4
	.word	0xec10a032	! t0_kref+0x1ac4:   	lduh	[%g2 + 0x32], %l6
	.word	0xa708376c	! t0_kref+0x1ac8:   	tsubcc	%g0, -0x894, %l3
	.word	0xee162008	! t0_kref+0x1acc:   	lduh	[%i0 + 8], %l7
	.word	0xac754014	! t0_kref+0x1ad0:   	udiv	%l5, %l4, %l6
	.word	0x9fa00531	! t0_kref+0x1ad4:   	fsqrts	%f17, %f15
	.word	0x9de3bfa0	! t0_kref+0x1ad8:   	save	%sp, -0x60, %sp
	.word	0x80377d9f	! t0_kref+0x1adc:   	orn	%i5, -0x261, %g0
	.word	0xa9ee801c	! t0_kref+0x1ae0:   	restore	%i2, %i4, %l4
	.word	0x2724b764	! t0_kref+0x1ae4:   	sethi	%hi(0x92dd9000), %l3
	.word	0xa60561b4	! t0_kref+0x1ae8:   	add	%l5, 0x1b4, %l3
	.word	0xa7400000	! t0_kref+0x1aec:   	mov	%y, %l3
	.word	0xae880015	! t0_kref+0x1af0:   	andcc	%g0, %l5, %l7
	.word	0xe66e6012	! t0_kref+0x1af4:   	ldstub	[%i1 + 0x12], %l3
	.word	0x001fffff	! t0_kref+0x1af8:   	illtrap	0x1fffff
	.word	0x905a001c	! t0_kref+0x1afc:   	smul	%o0, %i4, %o0
	.word	0xee8e5000	! t0_kref+0x1b00:   	lduba	[%i1]0x80, %l7
	.word	0x89a00129	! t0_kref+0x1b04:   	fabss	%f9, %f4
	.word	0xa606f5ae	! t0_kref+0x1b08:   	add	%i3, -0xa52, %l3
	.word	0xe968a085	! t0_kref+0x1b0c:   	prefetch	%g2 + 0x85, 20
	.word	0xa1a00127	! t0_kref+0x1b10:   	fabss	%f7, %f16
	.word	0x9de3bfa0	! t0_kref+0x1b14:   	save	%sp, -0x60, %sp
	.word	0xadef401b	! t0_kref+0x1b18:   	restore	%i5, %i3, %l6
	.word	0xd0070019	! t0_kref+0x1b1c:   	ld	[%i4 + %i1], %o0
	.word	0xa83a8009	! t0_kref+0x1b20:   	xnor	%o2, %o1, %l4
	.word	0xc16e4008	! t0_kref+0x1b24:   	prefetch	%i1 + %o0, 0
	.word	0xe656201e	! t0_kref+0x1b28:   	ldsh	[%i0 + 0x1e], %l3
	.word	0xaaa8314f	! t0_kref+0x1b2c:   	andncc	%g0, -0xeb1, %l5
	.word	0xb5a44d2e	! t0_kref+0x1b30:   	fsmuld	%f17, %f14, %f26
	.word	0x99a409c8	! t0_kref+0x1b34:   	fdivd	%f16, %f8, %f12
	.word	0x2f800008	! t0_kref+0x1b38:   	fbu,a	_kref+0x1b58
	.word	0xa665bb2f	! t0_kref+0x1b3c:   	subc	%l6, -0x4d1, %l3
	.word	0x81a90a28	! t0_kref+0x1b40:   	fcmps	%fcc0, %f4, %f8
	.word	0xd86e6011	! t0_kref+0x1b44:   	ldstub	[%i1 + 0x11], %o4
	.word	0xe968a04f	! t0_kref+0x1b48:   	prefetch	%g2 + 0x4f, 20
	.word	0xada01924	! t0_kref+0x1b4c:   	fstod	%f4, %f22
	.word	0xac2ec017	! t0_kref+0x1b50:   	andn	%i3, %l7, %l6
	.word	0x90334014	! t0_kref+0x1b54:   	orn	%o5, %l4, %o0
	.word	0x9de3bfa0	! t0_kref+0x1b58:   	save	%sp, -0x60, %sp
	.word	0xb4374000	! t0_kref+0x1b5c:   	orn	%i5, %g0, %i2
	.word	0xadeec01a	! t0_kref+0x1b60:   	restore	%i3, %i2, %l6
	.word	0xae9ac00c	! t0_kref+0x1b64:   	xorcc	%o3, %o4, %l7
	.word	0xada01052	! t0_kref+0x1b68:   	fdtox	%f18, %f22
	.word	0x8da0013b	! t0_kref+0x1b6c:   	fabss	%f27, %f6
	.word	0xace7401c	! t0_kref+0x1b70:   	subccc	%i5, %i4, %l6
	.word	0xed6e6000	! t0_kref+0x1b74:   	prefetch	%i1, 22
	.word	0xae8d3a63	! t0_kref+0x1b78:   	andcc	%l4, -0x59d, %l7
	.word	0xad282014	! t0_kref+0x1b7c:   	sll	%g0, 0x14, %l6
	.word	0x81df33f3	! t0_kref+0x1b80:   	flush	%i4 - 0xc0d
	.word	0x9da0053b	! t0_kref+0x1b84:   	fsqrts	%f27, %f14
	.word	0xd6680019	! t0_kref+0x1b88:   	ldstub	[%g0 + %i1], %o3
	.word	0xd2f81018	! t0_kref+0x1b8c:   	swapa	[%g0 + %i0]0x80, %o1
	.word	0x81df800b	! t0_kref+0x1b90:   	flush	%fp + %o3
	.word	0xf7070019	! t0_kref+0x1b94:   	ld	[%i4 + %i1], %f27
	.word	0xad400000	! t0_kref+0x1b98:   	mov	%y, %l6
	.word	0x2d08152a	! t0_kref+0x1b9c:   	sethi	%hi(0x2054a800), %l6
	.word	0xa6d37a25	! t0_kref+0x1ba0:   	umulcc	%o5, -0x5db, %l3
	.word	0x21800004	! t0_kref+0x1ba4:   	fbn,a	_kref+0x1bb4
	.word	0xa6e6f20d	! t0_kref+0x1ba8:   	subccc	%i3, -0xdf3, %l3
	.word	0x90556bef	! t0_kref+0x1bac:   	umul	%l5, 0xbef, %o0
	.word	0xd4fe101c	! t0_kref+0x1bb0:   	swapa	[%i0 + %i4]0x80, %o2
	call	0x00000ab0
	.word	0xa86378ed	! t0_kref+0x1bb8:   	subc	%o5, -0x713, %l4
	.word	0x9de3bfa0	! t0_kref+0x1bbc:   	save	%sp, -0x60, %sp
	.word	0xa7eea370	! t0_kref+0x1bc0:   	restore	%i2, 0x370, %l3
	.word	0x9fc10000	! t0_kref+0x1bc4:   	call	%g4
	.word	0xd0981019	! t0_kref+0x1bc8:   	ldda	[%g0 + %i1]0x80, %o0
	.word	0x9065c009	! t0_kref+0x1bcc:   	subc	%l7, %o1, %o0
	.word	0xea8e9019	! t0_kref+0x1bd0:   	lduba	[%i2 + %i1]0x80, %l5
	.word	0xa68d30e5	! t0_kref+0x1bd4:   	andcc	%l4, -0xf1b, %l3
	.word	0xa6ba301d	! t0_kref+0x1bd8:   	xnorcc	%o0, -0xfe3, %l3
	.word	0xe06e201a	! t0_kref+0x1bdc:   	ldstub	[%i0 + 0x1a], %l0
	.word	0xec50a02c	! t0_kref+0x1be0:   	ldsh	[%g2 + 0x2c], %l6
	.word	0x31480004	! t0_kref+0x1be4:   	fba,a,pt	%fcc0, _kref+0x1bf4
	.word	0x8580210e	! t0_kref+0x1be8:   	mov	0x10e, %ccr
	.word	0xfb6e001d	! t0_kref+0x1bec:   	prefetch	%i0 + %i5, 29
	.word	0xada309ce	! t0_kref+0x1bf0:   	fdivd	%f12, %f14, %f22
	.word	0xee4e600a	! t0_kref+0x1bf4:   	ldsb	[%i1 + 0xa], %l7
	.word	0xe850a014	! t0_kref+0x1bf8:   	ldsh	[%g2 + 0x14], %l4
	.word	0x81af0a2f	! t0_kref+0x1bfc:   	fcmps	%fcc0, %f28, %f15
	.word	0xaa45000b	! t0_kref+0x1c00:   	addc	%l4, %o3, %l5
	.word	0xa8da400d	! t0_kref+0x1c04:   	smulcc	%o1, %o5, %l4
	.word	0xaeab7e6e	! t0_kref+0x1c08:   	andncc	%o5, -0x192, %l7
	.word	0xab302019	! t0_kref+0x1c0c:   	srl	%g0, 0x19, %l5
	.word	0xfa30a004	! t0_kref+0x1c10:   	sth	%i5, [%g2 + 4]
	.word	0xc9380018	! t0_kref+0x1c14:   	std	%f4, [%g0 + %i0]
	.word	0xa932800a	! t0_kref+0x1c18:   	srl	%o2, %o2, %l4
	.word	0xae5b4016	! t0_kref+0x1c1c:   	smul	%o5, %l6, %l7
	.word	0xd83e401d	! t0_kref+0x1c20:   	std	%o4, [%i1 + %i5]
	.word	0xa6dd001a	! t0_kref+0x1c24:   	smulcc	%l4, %i2, %l3
	.word	0xaed50009	! t0_kref+0x1c28:   	umulcc	%l4, %o1, %l7
	.word	0xa73b2009	! t0_kref+0x1c2c:   	sra	%o4, 0x9, %l3
	.word	0xacd378cc	! t0_kref+0x1c30:   	umulcc	%o5, -0x734, %l6
	.word	0xe8ce101a	! t0_kref+0x1c34:   	ldsba	[%i0 + %i2]0x80, %l4
	.word	0xe168a085	! t0_kref+0x1c38:   	prefetch	%g2 + 0x85, 16
	.word	0xe608a008	! t0_kref+0x1c3c:   	ldub	[%g2 + 8], %l3
	.word	0xb3a0013b	! t0_kref+0x1c40:   	fabss	%f27, %f25
	.word	0x81a8ca24	! t0_kref+0x1c44:   	fcmps	%fcc0, %f3, %f4
	.word	0xa8654016	! t0_kref+0x1c48:   	subc	%l5, %l6, %l4
	.word	0xc36e7ff8	! t0_kref+0x1c4c:   	prefetch	%i1 - 8, 1
	.word	0x8143c000	! t0_kref+0x1c50:   	stbar
	.word	0xecd01019	! t0_kref+0x1c54:   	ldsha	[%g0 + %i1]0x80, %l6
	.word	0xae1ee1b1	! t0_kref+0x1c58:   	xor	%i3, 0x1b1, %l7
	.word	0x21480007	! t0_kref+0x1c5c:   	fbn,a,pt	%fcc0, _kref+0x1c78
	.word	0x9140c000	! t0_kref+0x1c60:   	mov	%asi, %o0
	.word	0xf76e401b	! t0_kref+0x1c64:   	prefetch	%i1 + %i3, 27
	.word	0xaa9f400a	! t0_kref+0x1c68:   	xorcc	%i5, %o2, %l5
	.word	0x81a90a4e	! t0_kref+0x1c6c:   	fcmpd	%fcc0, %f4, %f14
	.word	0xa6d28000	! t0_kref+0x1c70:   	umulcc	%o2, %g0, %l3
	.word	0x22800002	! t0_kref+0x1c74:   	be,a	_kref+0x1c7c
	.word	0xe6062010	! t0_kref+0x1c78:   	ld	[%i0 + 0x10], %l3
	.word	0x81800000	! t0_kref+0x1c7c:   	mov	%g0, %y
	.word	0xae9de95b	! t0_kref+0x1c80:   	xorcc	%l7, 0x95b, %l7
	.word	0xa93f0017	! t0_kref+0x1c84:   	sra	%i4, %l7, %l4
	.word	0xaab3001c	! t0_kref+0x1c88:   	orncc	%o4, %i4, %l5
	.word	0xec480019	! t0_kref+0x1c8c:   	ldsb	[%g0 + %i1], %l6
	.word	0xae2f3c1b	! t0_kref+0x1c90:   	andn	%i4, -0x3e5, %l7
	.word	0xaac2401b	! t0_kref+0x1c94:   	addccc	%o1, %i3, %l5
	.word	0xec163fe8	! t0_kref+0x1c98:   	lduh	[%i0 - 0x18], %l6
	.word	0xaafdad7a	! t0_kref+0x1c9c:   	sdivcc	%l6, 0xd7a, %l5
	.word	0x8da10944	! t0_kref+0x1ca0:   	fmuld	%f4, %f4, %f6
	.word	0xaade8000	! t0_kref+0x1ca4:   	smulcc	%i2, %g0, %l5
	.word	0x86102010	! t0_kref+0x1ca8:   	mov	0x10, %g3
	.word	0x86a0e001	! t0_kref+0x1cac:   	subcc	%g3, 1, %g3
	.word	0x22800009	! t0_kref+0x1cb0:   	be,a	_kref+0x1cd4
	.word	0xefee501b	! t0_kref+0x1cb4:   	prefetcha	%i1 + %i3, 23
	.word	0xc900a038	! t0_kref+0x1cb8:   	ld	[%g2 + 0x38], %f4
	.word	0x32bffffc	! t0_kref+0x1cbc:   	bne,a	_kref+0x1cac
	.word	0x81de0019	! t0_kref+0x1cc0:   	flush	%i0 + %i1
	.word	0x8da01104	! t0_kref+0x1cc4:   	fxtod	%f4, %f6
	.word	0x81ac0a52	! t0_kref+0x1cc8:   	fcmpd	%fcc0, %f16, %f18
	.word	0xc168a047	! t0_kref+0x1ccc:   	prefetch	%g2 + 0x47, 0
	.word	0x9fc10000	! t0_kref+0x1cd0:   	call	%g4
	.word	0x9fa6082b	! t0_kref+0x1cd4:   	fadds	%f24, %f11, %f15
	.word	0x8daa4058	! t0_kref+0x1cd8:   	fmovde	%fcc0, %f24, %f6
	.word	0x36480002	! t0_kref+0x1cdc:   	bge,a,pt	%icc, _kref+0x1ce4
	.word	0xd7064000	! t0_kref+0x1ce0:   	ld	[%i1], %f11
	.word	0xea4e001a	! t0_kref+0x1ce4:   	ldsb	[%i0 + %i2], %l5
	.word	0xa622400b	! t0_kref+0x1ce8:   	sub	%o1, %o3, %l3
	.word	0xc020a024	! t0_kref+0x1cec:   	clr	[%g2 + 0x24]
	.word	0xc168a041	! t0_kref+0x1cf0:   	prefetch	%g2 + 0x41, 0
	.word	0x86102004	! t0_kref+0x1cf4:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x1cf8:   	bne,a	_kref+0x1cf8
	.word	0x86a0e001	! t0_kref+0x1cfc:   	subcc	%g3, 1, %g3
	.word	0xa8a5782d	! t0_kref+0x1d00:   	subcc	%l5, -0x7d3, %l4
	.word	0x81dc4012	! t0_kref+0x1d04:   	flush	%l1 + %l2
	.word	0xe7ee501a	! t0_kref+0x1d08:   	prefetcha	%i1 + %i2, 19
	.word	0xac5f3602	! t0_kref+0x1d0c:   	smul	%i4, -0x9fe, %l6
	.word	0x81adca35	! t0_kref+0x1d10:   	fcmps	%fcc0, %f23, %f21
	.word	0x20480006	! t0_kref+0x1d14:   	bn,a,pt	%icc, _kref+0x1d2c
	.word	0xc0267fe4	! t0_kref+0x1d18:   	clr	[%i1 - 0x1c]
	.word	0xd230a038	! t0_kref+0x1d1c:   	sth	%o1, [%g2 + 0x38]
	.word	0xa842bb1f	! t0_kref+0x1d20:   	addc	%o2, -0x4e1, %l4
	.word	0x81db0005	! t0_kref+0x1d24:   	flush	%o4 + %g5
	.word	0xaeb6c008	! t0_kref+0x1d28:   	orncc	%i3, %o0, %l7
	.word	0xac922e53	! t0_kref+0x1d2c:   	orcc	%o0, 0xe53, %l6
	.word	0xaaf80015	! t0_kref+0x1d30:   	sdivcc	%g0, %l5, %l5
	.word	0xea0e0000	! t0_kref+0x1d34:   	ldub	[%i0], %l5
	.word	0xe84e401a	! t0_kref+0x1d38:   	ldsb	[%i1 + %i2], %l4
	.word	0xe4fe1000	! t0_kref+0x1d3c:   	swapa	[%i0]0x80, %l2
	.word	0xaae5400d	! t0_kref+0x1d40:   	subccc	%l5, %o5, %l5
	.word	0xaab00009	! t0_kref+0x1d44:   	orncc	%g0, %o1, %l5
	.word	0xa1a409c6	! t0_kref+0x1d48:   	fdivd	%f16, %f6, %f16
	.word	0x81a9ca26	! t0_kref+0x1d4c:   	fcmps	%fcc0, %f7, %f6
	.word	0xd008a023	! t0_kref+0x1d50:   	ldub	[%g2 + 0x23], %o0
	.word	0xaa47401a	! t0_kref+0x1d54:   	addc	%i5, %i2, %l5
	.word	0xb9a248b8	! t0_kref+0x1d58:   	fsubs	%f9, %f24, %f28
	.word	0xaa5261d6	! t0_kref+0x1d5c:   	umul	%o1, 0x1d6, %l5
	.word	0x90d5a2e4	! t0_kref+0x1d60:   	umulcc	%l6, 0x2e4, %o0
	.word	0xc9be5889	! t0_kref+0x1d64:   	stda	%f4, [%i1 + %o1]0xc4
	.word	0x900ded39	! t0_kref+0x1d68:   	and	%l7, 0xd39, %o0
	sethi	%hi(2f), %o7
	.word	0xe40be1b8	! t0_kref+0x1d70:   	ldub	[%o7 + 0x1b8], %l2
	.word	0xa41ca00c	! t0_kref+0x1d74:   	xor	%l2, 0xc, %l2
	.word	0xe42be1b8	! t0_kref+0x1d78:   	stb	%l2, [%o7 + 0x1b8]
	.word	0x81dbe1b8	! t0_kref+0x1d7c:   	flush	%o7 + 0x1b8
	.word	0xc9beda19	! t0_kref+0x1d80:   	stda	%f4, [%i3 + %i1]0xd0
	.word	0x2930edbe	! t0_kref+0x1d84:   	sethi	%hi(0xc3b6f800), %l4
	.word	0xd4b81018	! t0_kref+0x1d88:   	stda	%o2, [%g0 + %i0]0x80
	.word	0x26800002	! t0_kref+0x1d8c:   	bl,a	_kref+0x1d94
	.word	0xa3a01a48	! t0_kref+0x1d90:   	fdtoi	%f8, %f17
	.word	0xd8a01019	! t0_kref+0x1d94:   	sta	%o4, [%g0 + %i1]0x80
	.word	0xa9a54d30	! t0_kref+0x1d98:   	fsmuld	%f21, %f16, %f20
	.word	0xc807bff0	! t0_kref+0x1d9c:   	ld	[%fp - 0x10], %g4
	call	SYM(t0_subr1)
	.word	0x81834000	! t0_kref+0x1da4:   	wr	%o5, %g0, %y
	.word	0xb5a1c837	! t0_kref+0x1da8:   	fadds	%f7, %f23, %f26
	.word	0xf8b61000	! t0_kref+0x1dac:   	stha	%i4, [%i0]0x80
	.word	0x95a80026	! t0_kref+0x1db0:   	fmovsn	%fcc0, %f6, %f10
	.word	0x81ac0a48	! t0_kref+0x1db4:   	fcmpd	%fcc0, %f16, %f8
2:	.word	0xe0200018	! t0_kref+0x1db8:   	st	%l0, [%g0 + %i0]
	.word	0xd220a030	! t0_kref+0x1dbc:   	st	%o1, [%g2 + 0x30]
	.word	0xe16e2008	! t0_kref+0x1dc0:   	prefetch	%i0 + 8, 16
	.word	0xd820a008	! t0_kref+0x1dc4:   	st	%o4, [%g2 + 8]
	.word	0xa5a01890	! t0_kref+0x1dc8:   	fitos	%f16, %f18
	.word	0xae8a6539	! t0_kref+0x1dcc:   	andcc	%o1, 0x539, %l7
	.word	0xab2e8015	! t0_kref+0x1dd0:   	sll	%i2, %l5, %l5
	.word	0xaf418000	! t0_kref+0x1dd4:   	mov	%fprs, %l7
	.word	0xe3a71019	! t0_kref+0x1dd8:   	sta	%f17, [%i4 + %i1]0x80
	.word	0x9fa01887	! t0_kref+0x1ddc:   	fitos	%f7, %f15
	.word	0xed3e3ff8	! t0_kref+0x1de0:   	std	%f22, [%i0 - 8]
	.word	0xc768a040	! t0_kref+0x1de4:   	prefetch	%g2 + 0x40, 3
	.word	0xac45ff11	! t0_kref+0x1de8:   	addc	%l7, -0xef, %l6
	.word	0x9de3bfa0	! t0_kref+0x1dec:   	save	%sp, -0x60, %sp
	.word	0xb8be401c	! t0_kref+0x1df0:   	xnorcc	%i1, %i4, %i4
	.word	0xabe82cf5	! t0_kref+0x1df4:   	restore	%g0, 0xcf5, %l5
	.word	0x99a14d2a	! t0_kref+0x1df8:   	fsmuld	%f5, %f10, %f12
	.word	0xea4e6010	! t0_kref+0x1dfc:   	ldsb	[%i1 + 0x10], %l5
	.word	0xa6bd7442	! t0_kref+0x1e00:   	xnorcc	%l5, -0xbbe, %l3
	.word	0xaaa23442	! t0_kref+0x1e04:   	subcc	%o0, -0xbbe, %l5
	.word	0xacdd401a	! t0_kref+0x1e08:   	smulcc	%l5, %i2, %l6
	.word	0xaab739be	! t0_kref+0x1e0c:   	orncc	%i4, -0x642, %l5
	.word	0xa8aea1ee	! t0_kref+0x1e10:   	andncc	%i2, 0x1ee, %l4
	sethi	%hi(2f), %o7
	.word	0xe40be24c	! t0_kref+0x1e18:   	ldub	[%o7 + 0x24c], %l2
	.word	0xa41ca00c	! t0_kref+0x1e1c:   	xor	%l2, 0xc, %l2
	.word	0xe42be24c	! t0_kref+0x1e20:   	stb	%l2, [%o7 + 0x24c]
	.word	0x81dbe24c	! t0_kref+0x1e24:   	flush	%o7 + 0x24c
	.word	0x270d4d43	! t0_kref+0x1e28:   	sethi	%hi(0x35350c00), %l3
	.word	0xa8658014	! t0_kref+0x1e2c:   	subc	%l6, %l4, %l4
	.word	0x9055801b	! t0_kref+0x1e30:   	umul	%l6, %i3, %o0
	.word	0xa9a58d35	! t0_kref+0x1e34:   	fsmuld	%f22, %f21, %f20
	.word	0x9fc00004	! t0_kref+0x1e38:   	call	%g0 + %g4
	.word	0xe808a038	! t0_kref+0x1e3c:   	ldub	[%g2 + 0x38], %l4
	.word	0xc9ee5000	! t0_kref+0x1e40:   	prefetcha	%i1, 4
	.word	0xaa7b0009	! t0_kref+0x1e44:   	sdiv	%o4, %o1, %l5
	.word	0x81de800a	! t0_kref+0x1e48:   	flush	%i2 + %o2
2:	.word	0x89a0003a	! t0_kref+0x1e4c:   	fmovs	%f26, %f4
	.word	0xaa53400c	! t0_kref+0x1e50:   	umul	%o5, %o4, %l5
	.word	0xe840a00c	! t0_kref+0x1e54:   	ldsw	[%g2 + 0xc], %l4
	.word	0xab3ea014	! t0_kref+0x1e58:   	sra	%i2, 0x14, %l5
	.word	0xaa424017	! t0_kref+0x1e5c:   	addc	%o1, %l7, %l5
	.word	0x2e480006	! t0_kref+0x1e60:   	bvs,a,pt	%icc, _kref+0x1e78
	.word	0xa8474016	! t0_kref+0x1e64:   	addc	%i5, %l6, %l4
	.word	0xea4e001a	! t0_kref+0x1e68:   	ldsb	[%i0 + %i2], %l5
	.word	0xee0e2001	! t0_kref+0x1e6c:   	ldub	[%i0 + 1], %l7
	.word	0xe168a04f	! t0_kref+0x1e70:   	prefetch	%g2 + 0x4f, 16
	.word	0xec4e6011	! t0_kref+0x1e74:   	ldsb	[%i1 + 0x11], %l6
	.word	0x2d0a4df9	! t0_kref+0x1e78:   	sethi	%hi(0x2937e400), %l6
	.word	0x9fc10000	! t0_kref+0x1e7c:   	call	%g4
	.word	0xd820a01c	! t0_kref+0x1e80:   	st	%o4, [%g2 + 0x1c]
	.word	0x36800001	! t0_kref+0x1e84:   	bge,a	_kref+0x1e88
	.word	0xaf1ac01d	! t0_kref+0x1e88:   	tsubcctv	%o3, %i5, %l7
	.word	0x81854000	! t0_kref+0x1e8c:   	wr	%l5, %g0, %y
	.word	0xd46e2011	! t0_kref+0x1e90:   	ldstub	[%i0 + 0x11], %o2
	.word	0x81858000	! t0_kref+0x1e94:   	wr	%l6, %g0, %y
	.word	0xa7400000	! t0_kref+0x1e98:   	mov	%y, %l3
	.word	0xaba10936	! t0_kref+0x1e9c:   	fmuls	%f4, %f22, %f21
	.word	0xa8fec008	! t0_kref+0x1ea0:   	sdivcc	%i3, %o0, %l4
	.word	0xea68a00a	! t0_kref+0x1ea4:   	ldstub	[%g2 + 0xa], %l5
	.word	0xe4e81018	! t0_kref+0x1ea8:   	ldstuba	[%g0 + %i0]0x80, %l2
	.word	0x9da00158	! t0_kref+0x1eac:   	fabsd	%f24, %f14
	.word	0xe3b8a040	! t0_kref+0x1eb0:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x27156b5c	! t0_kref+0x1eb4:   	sethi	%hi(0x55ad7000), %l3
	.word	0x37800007	! t0_kref+0x1eb8:   	fbge,a	_kref+0x1ed4
	.word	0x9fa000a7	! t0_kref+0x1ebc:   	fnegs	%f7, %f15
	.word	0x3d480003	! t0_kref+0x1ec0:   	fbule,a,pt	%fcc0, _kref+0x1ecc
	.word	0xd9be181d	! t0_kref+0x1ec4:   	stda	%f12, [%i0 + %i5]0xc0
	.word	0x97a00123	! t0_kref+0x1ec8:   	fabss	%f3, %f11
	.word	0x89a01895	! t0_kref+0x1ecc:   	fitos	%f21, %f4
	.word	0xd8fe5000	! t0_kref+0x1ed0:   	swapa	[%i1]0x80, %o4
	.word	0xf96e401a	! t0_kref+0x1ed4:   	prefetch	%i1 + %i2, 28
	.word	0xaaa0264b	! t0_kref+0x1ed8:   	subcc	%g0, 0x64b, %l5
	.word	0x87a288ad	! t0_kref+0x1edc:   	fsubs	%f10, %f13, %f3
	.word	0xafa0053a	! t0_kref+0x1ee0:   	fsqrts	%f26, %f23
	.word	0x81aa8a4c	! t0_kref+0x1ee4:   	fcmpd	%fcc0, %f10, %f12
	.word	0xdd06001c	! t0_kref+0x1ee8:   	ld	[%i0 + %i4], %f14
	.word	0xc16e4000	! t0_kref+0x1eec:   	prefetch	%i1, 0
	.word	0xe3b8a040	! t0_kref+0x1ef0:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x81ae4a2d	! t0_kref+0x1ef4:   	fcmps	%fcc0, %f25, %f13
	.word	0xaba1c8b6	! t0_kref+0x1ef8:   	fsubs	%f7, %f22, %f21
	.word	0x8ba0013a	! t0_kref+0x1efc:   	fabss	%f26, %f5
	.word	0xe5063ff0	! t0_kref+0x1f00:   	ld	[%i0 - 0x10], %f18
	.word	0xda6e200b	! t0_kref+0x1f04:   	ldstub	[%i0 + 0xb], %o5
	.word	0xae7525e3	! t0_kref+0x1f08:   	udiv	%l4, 0x5e3, %l7
	.word	0x87a5c8b3	! t0_kref+0x1f0c:   	fsubs	%f23, %f19, %f3
	.word	0x90000017	! t0_kref+0x1f10:   	add	%g0, %l7, %o0
	.word	0x9140c000	! t0_kref+0x1f14:   	mov	%asi, %o0
	.word	0x81de400f	! t0_kref+0x1f18:   	flush	%i1 + %o7
	.word	0xaaa2f7bf	! t0_kref+0x1f1c:   	subcc	%o3, -0x841, %l5
	.word	0xa8368015	! t0_kref+0x1f20:   	orn	%i2, %l5, %l4
	.word	0xc9380018	! t0_kref+0x1f24:   	std	%f4, [%g0 + %i0]
	.word	0xa6957d3e	! t0_kref+0x1f28:   	orcc	%l5, -0x2c2, %l3
	.word	0xaa9a6341	! t0_kref+0x1f2c:   	xorcc	%o1, 0x341, %l5
	.word	0x8da4c8ba	! t0_kref+0x1f30:   	fsubs	%f19, %f26, %f6
	.word	0xad2b000c	! t0_kref+0x1f34:   	sll	%o4, %o4, %l6
	.word	0xd66e8018	! t0_kref+0x1f38:   	ldstub	[%i2 + %i0], %o3
	.word	0xd7a6501c	! t0_kref+0x1f3c:   	sta	%f11, [%i1 + %i4]0x80
	.word	0xe9ee501a	! t0_kref+0x1f40:   	prefetcha	%i1 + %i2, 20
	.word	0x2f098314	! t0_kref+0x1f44:   	sethi	%hi(0x260c5000), %l7
	.word	0xa6ff4009	! t0_kref+0x1f48:   	sdivcc	%i5, %o1, %l3
	.word	0xec560000	! t0_kref+0x1f4c:   	ldsh	[%i0], %l6
	.word	0xaa5e801d	! t0_kref+0x1f50:   	smul	%i2, %i5, %l5
	.word	0xaa9a2aa1	! t0_kref+0x1f54:   	xorcc	%o0, 0xaa1, %l5
	.word	0xa88d8016	! t0_kref+0x1f58:   	andcc	%l6, %l6, %l4
	.word	0x913d401c	! t0_kref+0x1f5c:   	sra	%l5, %i4, %o0
	.word	0xacada7e1	! t0_kref+0x1f60:   	andncc	%l6, 0x7e1, %l6
	.word	0xaaaf000d	! t0_kref+0x1f64:   	andncc	%i4, %o5, %l5
	.word	0x34480006	! t0_kref+0x1f68:   	bg,a,pt	%icc, _kref+0x1f80
	.word	0xb7a4c9a8	! t0_kref+0x1f6c:   	fdivs	%f19, %f8, %f27
	.word	0x81db6ba2	! t0_kref+0x1f70:   	flush	%o5 + 0xba2
	.word	0xb7a68833	! t0_kref+0x1f74:   	fadds	%f26, %f19, %f27
	.word	0xaa52fb98	! t0_kref+0x1f78:   	umul	%o3, -0x468, %l5
	.word	0x900578c9	! t0_kref+0x1f7c:   	add	%l5, -0x737, %o0
	.word	0xa3a018d8	! t0_kref+0x1f80:   	fdtos	%f24, %f17
	.word	0xea06001c	! t0_kref+0x1f84:   	ld	[%i0 + %i4], %l5
	.word	0xd27f0019	! t0_kref+0x1f88:   	swap	[%i4 + %i1], %o1
	.word	0xac927ff2	! t0_kref+0x1f8c:   	orcc	%o1, -0xe, %l6
	.word	0x9046b7dd	! t0_kref+0x1f90:   	addc	%i2, -0x823, %o0
	.word	0xe96e401b	! t0_kref+0x1f94:   	prefetch	%i1 + %i3, 20
	.word	0x22800003	! t0_kref+0x1f98:   	be,a	_kref+0x1fa4
	.word	0xac37382c	! t0_kref+0x1f9c:   	orn	%i4, -0x7d4, %l6
	.word	0xec163ffa	! t0_kref+0x1fa0:   	lduh	[%i0 - 6], %l6
	.word	0xd0200019	! t0_kref+0x1fa4:   	st	%o0, [%g0 + %i1]
	.word	0xaf3ae01b	! t0_kref+0x1fa8:   	sra	%o3, 0x1b, %l7
	.word	0x9da309c4	! t0_kref+0x1fac:   	fdivd	%f12, %f4, %f14
	.word	0xa8fb4017	! t0_kref+0x1fb0:   	sdivcc	%o5, %l7, %l4
	.word	0xea28a033	! t0_kref+0x1fb4:   	stb	%l5, [%g2 + 0x33]
	.word	0xa7a00026	! t0_kref+0x1fb8:   	fmovs	%f6, %f19
	.word	0xacdebe56	! t0_kref+0x1fbc:   	smulcc	%i2, -0x1aa, %l6
	.word	0x905a7d22	! t0_kref+0x1fc0:   	smul	%o1, -0x2de, %o0
	.word	0xb5a20d24	! t0_kref+0x1fc4:   	fsmuld	%f8, %f4, %f26
	.word	0xb1a01a37	! t0_kref+0x1fc8:   	fstoi	%f23, %f24
	.word	0x8fa388a7	! t0_kref+0x1fcc:   	fsubs	%f14, %f7, %f7
	.word	0xa663627b	! t0_kref+0x1fd0:   	subc	%o5, 0x27b, %l3
	.word	0xee100019	! t0_kref+0x1fd4:   	lduh	[%g0 + %i1], %l7
	.word	0xa5a60848	! t0_kref+0x1fd8:   	faddd	%f24, %f8, %f18
	.word	0xd096d019	! t0_kref+0x1fdc:   	lduha	[%i3 + %i1]0x80, %o0
	.word	0xd06e001a	! t0_kref+0x1fe0:   	ldstub	[%i0 + %i2], %o0
	.word	0xd43e0000	! t0_kref+0x1fe4:   	std	%o2, [%i0]
	.word	0x8da01903	! t0_kref+0x1fe8:   	fitod	%f3, %f6
	.word	0xd228a02d	! t0_kref+0x1fec:   	stb	%o1, [%g2 + 0x2d]
	.word	0xacba4015	! t0_kref+0x1ff0:   	xnorcc	%o1, %l5, %l6
	.word	0xa5a68842	! t0_kref+0x1ff4:   	faddd	%f26, %f2, %f18
	.word	0xd04e0000	! t0_kref+0x1ff8:   	ldsb	[%i0], %o0
	.word	0xb7a00027	! t0_kref+0x1ffc:   	fmovs	%f7, %f27
	.word	0xaf418000	! t0_kref+0x2000:   	mov	%fprs, %l7
	.word	0x8fa288ba	! t0_kref+0x2004:   	fsubs	%f10, %f26, %f7
	.word	0x2c480006	! t0_kref+0x2008:   	bneg,a,pt	%icc, _kref+0x2020
	.word	0xae5a7d3b	! t0_kref+0x200c:   	smul	%o1, -0x2c5, %l7
	.word	0xa8177cae	! t0_kref+0x2010:   	or	%i5, -0x352, %l4
	.word	0xaa98001a	! t0_kref+0x2014:   	xorcc	%g0, %i2, %l5
	.word	0xe9be1a1c	! t0_kref+0x2018:   	stda	%f20, [%i0 + %i4]0xd0
	.word	0xaefb76d2	! t0_kref+0x201c:   	sdivcc	%o5, -0x92e, %l7
	.word	0xa5a00537	! t0_kref+0x2020:   	fsqrts	%f23, %f18
	.word	0xf53e0000	! t0_kref+0x2024:   	std	%f26, [%i0]
	.word	0x8143e011	! t0_kref+0x2028:   	membar	0x11
	.word	0xaea72bc4	! t0_kref+0x202c:   	subcc	%i4, 0xbc4, %l7
	.word	0xaef83887	! t0_kref+0x2030:   	sdivcc	%g0, -0x779, %l7
	.word	0xaada29cb	! t0_kref+0x2034:   	smulcc	%o0, 0x9cb, %l5
	.word	0xac32800b	! t0_kref+0x2038:   	orn	%o2, %o3, %l6
	.word	0x905b7ed4	! t0_kref+0x203c:   	smul	%o5, -0x12c, %o0
	.word	0xe84e8019	! t0_kref+0x2040:   	ldsb	[%i2 + %i1], %l4
	.word	0xec0e3fed	! t0_kref+0x2044:   	ldub	[%i0 - 0x13], %l6
	.word	0xd056600a	! t0_kref+0x2048:   	ldsh	[%i1 + 0xa], %o0
	.word	0xa8fa24fd	! t0_kref+0x204c:   	sdivcc	%o0, 0x4fd, %l4
	.word	0x95a30d2e	! t0_kref+0x2050:   	fsmuld	%f12, %f14, %f10
	.word	0xb5a10856	! t0_kref+0x2054:   	faddd	%f4, %f22, %f26
	.word	0xea5e7ff0	! t0_kref+0x2058:   	ldx	[%i1 - 0x10], %l5
	.word	0xd828a023	! t0_kref+0x205c:   	stb	%o4, [%g2 + 0x23]
	.word	0x99a01913	! t0_kref+0x2060:   	fitod	%f19, %f12
	.word	0xaa327533	! t0_kref+0x2064:   	orn	%o1, -0xacd, %l5
	.word	0x81da8012	! t0_kref+0x2068:   	flush	%o2 + %l2
	.word	0xed3e6010	! t0_kref+0x206c:   	std	%f22, [%i1 + 0x10]
	.word	0xe808a035	! t0_kref+0x2070:   	ldub	[%g2 + 0x35], %l4
	.word	0xaefb0000	! t0_kref+0x2074:   	sdivcc	%o4, %g0, %l7
	.word	0x91a3cd26	! t0_kref+0x2078:   	fsmuld	%f15, %f6, %f8
	.word	0x81ab0a2d	! t0_kref+0x207c:   	fcmps	%fcc0, %f12, %f13
	.word	0xa90f4009	! t0_kref+0x2080:   	tsubcc	%i5, %o1, %l4
	.word	0xa3a0053a	! t0_kref+0x2084:   	fsqrts	%f26, %f17
	.word	0x8143c000	! t0_kref+0x2088:   	stbar
	.word	0xece81019	! t0_kref+0x208c:   	ldstuba	[%g0 + %i1]0x80, %l6
	.word	0xdbe6501a	! t0_kref+0x2090:   	casa	[%i1]0x80, %i2, %o5
	.word	0xae7ee8cb	! t0_kref+0x2094:   	sdiv	%i3, 0x8cb, %l7
	.word	0x9de3bfa0	! t0_kref+0x2098:   	save	%sp, -0x60, %sp
	.word	0xb6be8018	! t0_kref+0x209c:   	xnorcc	%i2, %i0, %i3
	.word	0xa7e839c9	! t0_kref+0x20a0:   	restore	%g0, -0x637, %l3
	.word	0xaf702cf2	! t0_kref+0x20a4:   	popc	0xcf2, %l7
	.word	0xafa0012e	! t0_kref+0x20a8:   	fabss	%f14, %f23
	.word	0x9fc00004	! t0_kref+0x20ac:   	call	%g0 + %g4
	.word	0xb9a50856	! t0_kref+0x20b0:   	faddd	%f20, %f22, %f28
	.word	0xaadb000a	! t0_kref+0x20b4:   	smulcc	%o4, %o2, %l5
	.word	0x89a80048	! t0_kref+0x20b8:   	fmovdn	%fcc0, %f8, %f4
	.word	0x32480003	! t0_kref+0x20bc:   	bne,a,pt	%icc, _kref+0x20c8
	.word	0xad0a23c0	! t0_kref+0x20c0:   	tsubcc	%o0, 0x3c0, %l6
	.word	0xa62a0000	! t0_kref+0x20c4:   	andn	%o0, %g0, %l3
	.word	0x91a20d2a	! t0_kref+0x20c8:   	fsmuld	%f8, %f10, %f8
	.word	0x2e480001	! t0_kref+0x20cc:   	bvs,a,pt	%icc, _kref+0x20d0
	.word	0xac753daa	! t0_kref+0x20d0:   	udiv	%l4, -0x256, %l6
	.word	0xae7dc01c	! t0_kref+0x20d4:   	sdiv	%l7, %i4, %l7
	.word	0x91a20948	! t0_kref+0x20d8:   	fmuld	%f8, %f8, %f8
	.word	0xad2a2008	! t0_kref+0x20dc:   	sll	%o0, 0x8, %l6
	.word	0xa1a3492a	! t0_kref+0x20e0:   	fmuls	%f13, %f10, %f16
	.word	0x87a018da	! t0_kref+0x20e4:   	fdtos	%f26, %f3
	.word	0xee56c019	! t0_kref+0x20e8:   	ldsh	[%i3 + %i1], %l7
	.word	0x91a00130	! t0_kref+0x20ec:   	fabss	%f16, %f8
	.word	0xe84e4000	! t0_kref+0x20f0:   	ldsb	[%i1], %l4
	.word	0xac7a800b	! t0_kref+0x20f4:   	sdiv	%o2, %o3, %l6
	.word	0x8fa109a6	! t0_kref+0x20f8:   	fdivs	%f4, %f6, %f7
	.word	0xe47e3fe4	! t0_kref+0x20fc:   	swap	[%i0 - 0x1c], %l2
	.word	0x91376018	! t0_kref+0x2100:   	srl	%i5, 0x18, %o0
	.word	0xa643773d	! t0_kref+0x2104:   	addc	%o5, -0x8c3, %l3
	.word	0xa940c000	! t0_kref+0x2108:   	mov	%asi, %l4
	.word	0xe36e001c	! t0_kref+0x210c:   	prefetch	%i0 + %i4, 17
	.word	0x81aa8a5c	! t0_kref+0x2110:   	fcmpd	%fcc0, %f10, %f28
	.word	0xf5a6501c	! t0_kref+0x2114:   	sta	%f26, [%i1 + %i4]0x80
	.word	0xf007bfe0	! t0_kref+0x2118:   	ld	[%fp - 0x20], %i0
	.word	0xe6e81019	! t0_kref+0x211c:   	ldstuba	[%g0 + %i1]0x80, %l3
	.word	0x81a90a3b	! t0_kref+0x2120:   	fcmps	%fcc0, %f4, %f27
	.word	0xada1c825	! t0_kref+0x2124:   	fadds	%f7, %f5, %f22
	.word	0xa89ac009	! t0_kref+0x2128:   	xorcc	%o3, %o1, %l4
	.word	0xa8f80008	! t0_kref+0x212c:   	sdivcc	%g0, %o0, %l4
	.word	0xada2c9b3	! t0_kref+0x2130:   	fdivs	%f11, %f19, %f22
	.word	0xea0e4000	! t0_kref+0x2134:   	ldub	[%i1], %l5
	.word	0xab408000	! t0_kref+0x2138:   	mov	%ccr, %l5
	.word	0xdf063ff4	! t0_kref+0x213c:   	ld	[%i0 - 0xc], %f15
	.word	0xa1a01025	! t0_kref+0x2140:   	fstox	%f5, %f16
	.word	0xe84e6012	! t0_kref+0x2144:   	ldsb	[%i1 + 0x12], %l4
	.word	0xdd3e7fe0	! t0_kref+0x2148:   	std	%f14, [%i1 - 0x20]
	.word	0x81ac0a56	! t0_kref+0x214c:   	fcmpd	%fcc0, %f16, %f22
	.word	0xb5a30842	! t0_kref+0x2150:   	faddd	%f12, %f2, %f26
	.word	0x89a01906	! t0_kref+0x2154:   	fitod	%f6, %f4
	.word	0xa5a0190e	! t0_kref+0x2158:   	fitod	%f14, %f18
	.word	0x9da64d25	! t0_kref+0x215c:   	fsmuld	%f25, %f5, %f14
	.word	0xe8070018	! t0_kref+0x2160:   	ld	[%i4 + %i0], %l4
	.word	0x81de0016	! t0_kref+0x2164:   	flush	%i0 + %l6
	.word	0x81ae8a46	! t0_kref+0x2168:   	fcmpd	%fcc0, %f26, %f6
	.word	0x81aeca27	! t0_kref+0x216c:   	fcmps	%fcc0, %f27, %f7
	.word	0x8ba00128	! t0_kref+0x2170:   	fabss	%f8, %f5
	.word	0x110c15d7	! t0_kref+0x2174:   	sethi	%hi(0x30575c00), %o0
	.word	0xaaa00014	! t0_kref+0x2178:   	subcc	%g0, %l4, %l5
	.word	0xf1be5000	! t0_kref+0x217c:   	stda	%f24, [%i1]0x80
	.word	0xd026401c	! t0_kref+0x2180:   	st	%o0, [%i1 + %i4]
	.word	0x9fc00004	! t0_kref+0x2184:   	call	%g0 + %g4
	.word	0xa5a0004c	! t0_kref+0x2188:   	fmovd	%f12, %f18
	call	SYM(t0_subr0)
	.word	0xa806aae2	! t0_kref+0x2190:   	add	%i2, 0xae2, %l4
	.word	0x905aa6c7	! t0_kref+0x2194:   	smul	%o2, 0x6c7, %o0
	.word	0xd13e6008	! t0_kref+0x2198:   	std	%f8, [%i1 + 8]
	.word	0xac60001b	! t0_kref+0x219c:   	subc	%g0, %i3, %l6
	.word	0xa662f8d8	! t0_kref+0x21a0:   	subc	%o3, -0x728, %l3
	.word	0x9de3bfa0	! t0_kref+0x21a4:   	save	%sp, -0x60, %sp
	.word	0xb1064018	! t0_kref+0x21a8:   	taddcc	%i1, %i0, %i0
	.word	0xa7ef001a	! t0_kref+0x21ac:   	restore	%i4, %i2, %l3
	.word	0xec563fea	! t0_kref+0x21b0:   	ldsh	[%i0 - 0x16], %l6
	.word	0xe76e7fe8	! t0_kref+0x21b4:   	prefetch	%i1 - 0x18, 19
	.word	0xf9264000	! t0_kref+0x21b8:   	st	%f28, [%i1]
	.word	0xb7a00527	! t0_kref+0x21bc:   	fsqrts	%f7, %f27
	.word	0xec0e4000	! t0_kref+0x21c0:   	ldub	[%i1], %l6
	.word	0xc1beda58	! t0_kref+0x21c4:   	stda	%f0, [%i3 + %i0]0xd2
	.word	0x9ba308aa	! t0_kref+0x21c8:   	fsubs	%f12, %f10, %f13
	.word	0xb9a0012e	! t0_kref+0x21cc:   	fabss	%f14, %f28
	.word	0xae073474	! t0_kref+0x21d0:   	add	%i4, -0xb8c, %l7
	call	SYM(t0_subr0)
	.word	0x99a60935	! t0_kref+0x21d8:   	fmuls	%f24, %f21, %f12
	.word	0xe656401b	! t0_kref+0x21dc:   	ldsh	[%i1 + %i3], %l3
	.word	0xac9f7c6f	! t0_kref+0x21e0:   	xorcc	%i5, -0x391, %l6
	.word	0xaafaa588	! t0_kref+0x21e4:   	sdivcc	%o2, 0x588, %l5
	.word	0xfaa65000	! t0_kref+0x21e8:   	sta	%i5, [%i1]0x80
	.word	0xeb68a047	! t0_kref+0x21ec:   	prefetch	%g2 + 0x47, 21
	.word	0x2c800001	! t0_kref+0x21f0:   	bneg,a	_kref+0x21f4
	.word	0xf53e3ff8	! t0_kref+0x21f4:   	std	%f26, [%i0 - 8]
	.word	0xae5d400d	! t0_kref+0x21f8:   	smul	%l5, %o5, %l7
	.word	0xe87e7fe0	! t0_kref+0x21fc:   	swap	[%i1 - 0x20], %l4
	.word	0xe168a08e	! t0_kref+0x2200:   	prefetch	%g2 + 0x8e, 16
	.word	0xacb6bf15	! t0_kref+0x2204:   	orncc	%i2, -0xeb, %l6
	.word	0xb5a4492b	! t0_kref+0x2208:   	fmuls	%f17, %f11, %f26
	.word	0x9fc10000	! t0_kref+0x220c:   	call	%g4
	.word	0xb1a50956	! t0_kref+0x2210:   	fmuld	%f20, %f22, %f24
	.word	0x90ade3ac	! t0_kref+0x2214:   	andncc	%l7, 0x3ac, %o0
	.word	0xa85ec01d	! t0_kref+0x2218:   	smul	%i3, %i5, %l4
	.word	0xace6e7e2	! t0_kref+0x221c:   	subccc	%i3, 0x7e2, %l6
	.word	0x2f480001	! t0_kref+0x2220:   	fbu,a,pt	%fcc0, _kref+0x2224
	.word	0xac3b765b	! t0_kref+0x2224:   	xnor	%o5, -0x9a5, %l6
	.word	0xe656c019	! t0_kref+0x2228:   	ldsh	[%i3 + %i1], %l3
	.word	0xaadb630e	! t0_kref+0x222c:   	smulcc	%o5, 0x30e, %l5
	.word	0xa878000b	! t0_kref+0x2230:   	sdiv	%g0, %o3, %l4
	.word	0xae0f000c	! t0_kref+0x2234:   	and	%i4, %o4, %l7
	.word	0xe6480018	! t0_kref+0x2238:   	ldsb	[%g0 + %i0], %l3
	.word	0xd83e4000	! t0_kref+0x223c:   	std	%o4, [%i1]
	.word	0xa8a76235	! t0_kref+0x2240:   	subcc	%i5, 0x235, %l4
	.word	0xa7400000	! t0_kref+0x2244:   	mov	%y, %l3
	.word	0x95a5c8b7	! t0_kref+0x2248:   	fsubs	%f23, %f23, %f10
	.word	0x9da01914	! t0_kref+0x224c:   	fitod	%f20, %f14
	.word	0x30480001	! t0_kref+0x2250:   	ba,a,pt	%icc, _kref+0x2254
	.word	0x272628b4	! t0_kref+0x2254:   	sethi	%hi(0x98a2d000), %l3
	.word	0xf7067ff4	! t0_kref+0x2258:   	ld	[%i1 - 0xc], %f27
	.word	0x81aa8a46	! t0_kref+0x225c:   	fcmpd	%fcc0, %f10, %f6
	.word	0xd900a03c	! t0_kref+0x2260:   	ld	[%g2 + 0x3c], %f12
	.word	0x905e801c	! t0_kref+0x2264:   	smul	%i2, %i4, %o0
	.word	0xd900a004	! t0_kref+0x2268:   	ld	[%g2 + 4], %f12
	sethi	%hi(1f), %o7
	jmpl	%o7+%lo(1f), %g1
	.empty
	.word	0x81dec015	! t0_kref+0x2274:   	flush	%i3 + %l5
	.word	0xec30a036	! t0_kref+0x2278:   	sth	%l6, [%g2 + 0x36]
	.word	0xb1a01914	! t0_kref+0x227c:   	fitod	%f20, %f24
	.word	0xd2a61000	! t0_kref+0x2280:   	sta	%o1, [%i0]0x80
1:	.word	0xee560000	! t0_kref+0x2284:   	ldsh	[%i0], %l7
	.word	0x9de3bfa0	! t0_kref+0x2288:   	save	%sp, -0x60, %sp
	.word	0xadee001d	! t0_kref+0x228c:   	restore	%i0, %i5, %l6
	.word	0x905d317e	! t0_kref+0x2290:   	smul	%l4, -0xe82, %o0
	.word	0xac90292c	! t0_kref+0x2294:   	orcc	%g0, 0x92c, %l6
	.word	0x8da00148	! t0_kref+0x2298:   	fabsd	%f8, %f6
	.word	0x90e5e405	! t0_kref+0x229c:   	subccc	%l7, 0x405, %o0
	.word	0xd04e001a	! t0_kref+0x22a0:   	ldsb	[%i0 + %i2], %o0
	.word	0x33800005	! t0_kref+0x22a4:   	fbe,a	_kref+0x22b8
	.word	0x97a00532	! t0_kref+0x22a8:   	fsqrts	%f18, %f11
	.word	0xae0a6ca3	! t0_kref+0x22ac:   	and	%o1, 0xca3, %l7
	.word	0xa9a0004c	! t0_kref+0x22b0:   	fmovd	%f12, %f20
	.word	0xe87e001c	! t0_kref+0x22b4:   	swap	[%i0 + %i4], %l4
	.word	0xe93e6008	! t0_kref+0x22b8:   	std	%f20, [%i1 + 8]
	.word	0xaa932c74	! t0_kref+0x22bc:   	orcc	%o4, 0xc74, %l5
	.word	0xaf2e8009	! t0_kref+0x22c0:   	sll	%i2, %o1, %l7
	.word	0xec0e6010	! t0_kref+0x22c4:   	ldub	[%i1 + 0x10], %l6
	call	1f
	.empty
	.word	0xa6d24009	! t0_kref+0x22cc:   	umulcc	%o1, %o1, %l3
	.word	0xae9b000a	! t0_kref+0x22d0:   	xorcc	%o4, %o2, %l7
	.word	0xac772af1	! t0_kref+0x22d4:   	udiv	%i4, 0xaf1, %l6
	.word	0x2c480008	! t0_kref+0x22d8:   	bneg,a,pt	%icc, _kref+0x22f8
	.word	0xa9a00023	! t0_kref+0x22dc:   	fmovs	%f3, %f20
1:	.word	0xfbee101b	! t0_kref+0x22e0:   	prefetcha	%i0 + %i3, 29
	.word	0xa6e36806	! t0_kref+0x22e4:   	subccc	%o5, 0x806, %l3
	.word	0x95a00035	! t0_kref+0x22e8:   	fmovs	%f21, %f10
	.word	0xf9ee501a	! t0_kref+0x22ec:   	prefetcha	%i1 + %i2, 28
	.word	0xa73d400a	! t0_kref+0x22f0:   	sra	%l5, %o2, %l3
	.word	0xa6d80014	! t0_kref+0x22f4:   	smulcc	%g0, %l4, %l3
	.word	0x2e800007	! t0_kref+0x22f8:   	bvs,a	_kref+0x2314
	.word	0xac7ac017	! t0_kref+0x22fc:   	sdiv	%o3, %l7, %l6
	.word	0x909b000b	! t0_kref+0x2300:   	xorcc	%o4, %o3, %o0
	.word	0x3a480008	! t0_kref+0x2304:   	bcc,a,pt	%icc, _kref+0x2324
	.word	0xe9064000	! t0_kref+0x2308:   	ld	[%i1], %f20
	.word	0x95a00534	! t0_kref+0x230c:   	fsqrts	%f20, %f10
	.word	0xc12e7fe8	! t0_kref+0x2310:   	st	%fsr, [%i1 - 0x18]
	.word	0x29800004	! t0_kref+0x2314:   	fbl,a	_kref+0x2324
	.word	0xe84e2005	! t0_kref+0x2318:   	ldsb	[%i0 + 5], %l4
	.word	0x81580000	! t0_kref+0x231c:   	flushw
	.word	0xb9a50d38	! t0_kref+0x2320:   	fsmuld	%f20, %f24, %f28
	.word	0x8d8569c8	! t0_kref+0x2324:   	wr	%l5, 0x9c8, %fprs
	.word	0x8143c000	! t0_kref+0x2328:   	stbar
	.word	0xd230a004	! t0_kref+0x232c:   	sth	%o1, [%g2 + 4]
	.word	0xe84e0000	! t0_kref+0x2330:   	ldsb	[%i0], %l4
	.word	0xaad3400a	! t0_kref+0x2334:   	umulcc	%o5, %o2, %l5
	.word	0xa9a50856	! t0_kref+0x2338:   	faddd	%f20, %f22, %f20
	.word	0xefee501a	! t0_kref+0x233c:   	prefetcha	%i1 + %i2, 23
	.word	0xb5a18d35	! t0_kref+0x2340:   	fsmuld	%f6, %f21, %f26
	.word	0xd3f65000	! t0_kref+0x2344:   	casxa	[%i1]0x80, %g0, %o1
	.word	0xaebd765b	! t0_kref+0x2348:   	xnorcc	%l5, -0x9a5, %l7
	.word	0x9de3bfa0	! t0_kref+0x234c:   	save	%sp, -0x60, %sp
	.word	0x91ee4019	! t0_kref+0x2350:   	restore	%i1, %i1, %o0
	.word	0x22800004	! t0_kref+0x2354:   	be,a	_kref+0x2364
	.word	0xee06600c	! t0_kref+0x2358:   	ld	[%i1 + 0xc], %l7
	.word	0x905af122	! t0_kref+0x235c:   	smul	%o3, -0xede, %o0
	.word	0xea10a012	! t0_kref+0x2360:   	lduh	[%g2 + 0x12], %l5
	.word	0xa7a40833	! t0_kref+0x2364:   	fadds	%f16, %f19, %f19
	.word	0x8143c000	! t0_kref+0x2368:   	stbar
	.word	0x91a01058	! t0_kref+0x236c:   	fdtox	%f24, %f8
	.word	0xe6500018	! t0_kref+0x2370:   	ldsh	[%g0 + %i0], %l3
	.word	0x81ab0aad	! t0_kref+0x2374:   	fcmpes	%fcc0, %f12, %f13
	.word	0xecce5000	! t0_kref+0x2378:   	ldsba	[%i1]0x80, %l6
	.word	0xab08001b	! t0_kref+0x237c:   	tsubcc	%g0, %i3, %l5
	.word	0xd00e3fe0	! t0_kref+0x2380:   	ldub	[%i0 - 0x20], %o0
	.word	0x89aa004e	! t0_kref+0x2384:   	fmovda	%fcc0, %f14, %f4
	.word	0xa89e800c	! t0_kref+0x2388:   	xorcc	%i2, %o4, %l4
	.word	0x89a01913	! t0_kref+0x238c:   	fitod	%f19, %f4
	.word	0x81580000	! t0_kref+0x2390:   	flushw
	.word	0x90420017	! t0_kref+0x2394:   	addc	%o0, %l7, %o0
	.word	0xf900a020	! t0_kref+0x2398:   	ld	[%g2 + 0x20], %f28
	.word	0x81a98aa5	! t0_kref+0x239c:   	fcmpes	%fcc0, %f6, %f5
	.word	0x1134e54b	! t0_kref+0x23a0:   	sethi	%hi(0xd3952c00), %o0
	.word	0x95a01088	! t0_kref+0x23a4:   	fxtos	%f8, %f10
	.word	0xb1a6c924	! t0_kref+0x23a8:   	fmuls	%f27, %f4, %f24
	.word	0xa70b6b8d	! t0_kref+0x23ac:   	tsubcc	%o5, 0xb8d, %l3
	.word	0xe53e6000	! t0_kref+0x23b0:   	std	%f18, [%i1]
	.word	0xf8a01018	! t0_kref+0x23b4:   	sta	%i4, [%g0 + %i0]0x80
	.word	0x901eab83	! t0_kref+0x23b8:   	xor	%i2, 0xb83, %o0
	.word	0xa875ea65	! t0_kref+0x23bc:   	udiv	%l7, 0xa65, %l4
	.word	0xadaa0050	! t0_kref+0x23c0:   	fmovda	%fcc0, %f16, %f22
	.word	0x913a600c	! t0_kref+0x23c4:   	sra	%o1, 0xc, %o0
	.word	0xd016c019	! t0_kref+0x23c8:   	lduh	[%i3 + %i1], %o0
	.word	0xaa06c008	! t0_kref+0x23cc:   	add	%i3, %o0, %l5
	.word	0xace2c008	! t0_kref+0x23d0:   	subccc	%o3, %o0, %l6
	.word	0xd8fe5000	! t0_kref+0x23d4:   	swapa	[%i1]0x80, %o4
	.word	0xe4302bfc	! t0_kref+0x23d8:   	sth	%l2, [%g0 + 0xbfc]
	.word	0xb7a5c926	! t0_kref+0x23dc:   	fmuls	%f23, %f6, %f27
	.word	0xee50a006	! t0_kref+0x23e0:   	ldsh	[%g2 + 6], %l7
	.word	0xd99e1a5d	! t0_kref+0x23e4:   	ldda	[%i0 + %i5]0xd2, %f12
	.word	0xee56401b	! t0_kref+0x23e8:   	ldsh	[%i1 + %i3], %l7
	.word	0xf6266018	! t0_kref+0x23ec:   	st	%i3, [%i1 + 0x18]
	.word	0xa60e8008	! t0_kref+0x23f0:   	and	%i2, %o0, %l3
	.word	0xc768a08f	! t0_kref+0x23f4:   	prefetch	%g2 + 0x8f, 3
	.word	0xaafd800a	! t0_kref+0x23f8:   	sdivcc	%l6, %o2, %l5
	.word	0xaed5400b	! t0_kref+0x23fc:   	umulcc	%l5, %o3, %l7
	.word	0x81ad8a54	! t0_kref+0x2400:   	fcmpd	%fcc0, %f22, %f20
	.word	0x81ae4a2b	! t0_kref+0x2404:   	fcmps	%fcc0, %f25, %f11
	.word	0xaa554009	! t0_kref+0x2408:   	umul	%l5, %o1, %l5
	.word	0xe3063fec	! t0_kref+0x240c:   	ld	[%i0 - 0x14], %f17
	.word	0xf9066014	! t0_kref+0x2410:   	ld	[%i1 + 0x14], %f28
	.word	0xda30a022	! t0_kref+0x2414:   	sth	%o5, [%g2 + 0x22]
	.word	0x9de3bfa0	! t0_kref+0x2418:   	save	%sp, -0x60, %sp
	.word	0xba370019	! t0_kref+0x241c:   	orn	%i4, %i1, %i5
	.word	0xadeec019	! t0_kref+0x2420:   	restore	%i3, %i1, %l6
	.word	0x910831c4	! t0_kref+0x2424:   	tsubcc	%g0, -0xe3c, %o0
	.word	0xc168a04d	! t0_kref+0x2428:   	prefetch	%g2 + 0x4d, 0
	.word	0xa7a01a32	! t0_kref+0x242c:   	fstoi	%f18, %f19
	.word	0xe1be5880	! t0_kref+0x2430:   	stda	%f16, [%i1]0xc4
	.word	0xee48a03a	! t0_kref+0x2434:   	ldsb	[%g2 + 0x3a], %l7
	.word	0x270fe46b	! t0_kref+0x2438:   	sethi	%hi(0x3f91ac00), %l3
	.word	0xe600a03c	! t0_kref+0x243c:   	ld	[%g2 + 0x3c], %l3
	.word	0x8ba308b2	! t0_kref+0x2440:   	fsubs	%f12, %f18, %f5
	.word	0x97a000b3	! t0_kref+0x2444:   	fnegs	%f19, %f11
	.word	0xada01915	! t0_kref+0x2448:   	fitod	%f21, %f22
	.word	0xe816c018	! t0_kref+0x244c:   	lduh	[%i3 + %i0], %l4
	.word	0xae583184	! t0_kref+0x2450:   	smul	%g0, -0xe7c, %l7
	.word	0xa896e5d3	! t0_kref+0x2454:   	orcc	%i3, 0x5d3, %l4
	.word	0xa1a5cd2b	! t0_kref+0x2458:   	fsmuld	%f23, %f11, %f16
	.word	0xe6000018	! t0_kref+0x245c:   	ld	[%g0 + %i0], %l3
	.word	0xec167fec	! t0_kref+0x2460:   	lduh	[%i1 - 0x14], %l6
	.word	0xe6562006	! t0_kref+0x2464:   	ldsh	[%i0 + 6], %l3
	.word	0xafa68823	! t0_kref+0x2468:   	fadds	%f26, %f3, %f23
	.word	0x81ad8a4e	! t0_kref+0x246c:   	fcmpd	%fcc0, %f22, %f14
	.word	0xf13e6010	! t0_kref+0x2470:   	std	%f24, [%i1 + 0x10]
	.word	0x9025801d	! t0_kref+0x2474:   	sub	%l6, %i5, %o0
	.word	0xe1981019	! t0_kref+0x2478:   	ldda	[%g0 + %i1]0x80, %f16
	.word	0xab400000	! t0_kref+0x247c:   	mov	%y, %l5
	.word	0xa6623b90	! t0_kref+0x2480:   	subc	%o0, -0x470, %l3
	.word	0xa842801b	! t0_kref+0x2484:   	addc	%o2, %i3, %l4
	.word	0x93a0c929	! t0_kref+0x2488:   	fmuls	%f3, %f9, %f9
	.word	0x81da0012	! t0_kref+0x248c:   	flush	%o0 + %l2
	.word	0x9fc00004	! t0_kref+0x2490:   	call	%g0 + %g4
	.word	0xec070018	! t0_kref+0x2494:   	ld	[%i4 + %i0], %l6
	.word	0x81dff7e1	! t0_kref+0x2498:   	flush	%i7 - 0x81f
	.word	0x001fffff	! t0_kref+0x249c:   	illtrap	0x1fffff
	.word	0xea4e001a	! t0_kref+0x24a0:   	ldsb	[%i0 + %i2], %l5
	.word	0xa5a8804c	! t0_kref+0x24a4:   	fmovdlg	%fcc0, %f12, %f18
	.word	0x2d25f500	! t0_kref+0x24a8:   	sethi	%hi(0x97d40000), %l6
	.word	0x9da7092b	! t0_kref+0x24ac:   	fmuls	%f28, %f11, %f14
	.word	0xa67a6a27	! t0_kref+0x24b0:   	sdiv	%o1, 0xa27, %l3
	.word	0x2e480004	! t0_kref+0x24b4:   	bvs,a,pt	%icc, _kref+0x24c4
	.word	0xaf408000	! t0_kref+0x24b8:   	mov	%ccr, %l7
	.word	0xada00133	! t0_kref+0x24bc:   	fabss	%f19, %f22
	.word	0x2f385e04	! t0_kref+0x24c0:   	sethi	%hi(0xe1781000), %l7
	.word	0xa9a1cd35	! t0_kref+0x24c4:   	fsmuld	%f7, %f21, %f20
	.word	0xa6533b76	! t0_kref+0x24c8:   	umul	%o4, -0x48a, %l3
	.word	0xaf2f4014	! t0_kref+0x24cc:   	sll	%i5, %l4, %l7
	.word	0xaad50015	! t0_kref+0x24d0:   	umulcc	%l4, %l5, %l5
	.word	0xad418000	! t0_kref+0x24d4:   	mov	%fprs, %l6
	.word	0xe6df5019	! t0_kref+0x24d8:   	ldxa	[%i5 + %i1]0x80, %l3
	.word	0x9fa00529	! t0_kref+0x24dc:   	fsqrts	%f9, %f15
	.word	0x3c480006	! t0_kref+0x24e0:   	bpos,a,pt	%icc, _kref+0x24f8
	.word	0x001fffff	! t0_kref+0x24e4:   	illtrap	0x1fffff
	.word	0xaed5801a	! t0_kref+0x24e8:   	umulcc	%l6, %i2, %l7
	.word	0xaa75699e	! t0_kref+0x24ec:   	udiv	%l5, 0x99e, %l5
	.word	0xc36e401d	! t0_kref+0x24f0:   	prefetch	%i1 + %i5, 1
	.word	0xa6954015	! t0_kref+0x24f4:   	orcc	%l5, %l5, %l3
	.word	0xd6b01019	! t0_kref+0x24f8:   	stha	%o3, [%g0 + %i1]0x80
	.word	0xea10a016	! t0_kref+0x24fc:   	lduh	[%g2 + 0x16], %l5
	.word	0x93a01098	! t0_kref+0x2500:   	fxtos	%f24, %f9
	.word	0xaa1d800b	! t0_kref+0x2504:   	xor	%l6, %o3, %l5
	.word	0xf1be5000	! t0_kref+0x2508:   	stda	%f24, [%i1]0x80
	.word	0xd500a008	! t0_kref+0x250c:   	ld	[%g2 + 8], %f10
	.word	0xa8da8017	! t0_kref+0x2510:   	smulcc	%o2, %l7, %l4
	.word	0xe656001b	! t0_kref+0x2514:   	ldsh	[%i0 + %i3], %l3
	.word	0xb3a01886	! t0_kref+0x2518:   	fitos	%f6, %f25
	.word	0x9de3bfa0	! t0_kref+0x251c:   	save	%sp, -0x60, %sp
	.word	0x91eec01d	! t0_kref+0x2520:   	restore	%i3, %i5, %o0
	.word	0xa5a00529	! t0_kref+0x2524:   	fsqrts	%f9, %f18
	.word	0xf19e1a5d	! t0_kref+0x2528:   	ldda	[%i0 + %i5]0xd2, %f24
	.word	0xaa4527fb	! t0_kref+0x252c:   	addc	%l4, 0x7fb, %l5
	.word	0xa68ec01a	! t0_kref+0x2530:   	andcc	%i3, %i2, %l3
	.word	0x8143e040	! t0_kref+0x2534:   	membar	0x40
	.word	0xa82dbf34	! t0_kref+0x2538:   	andn	%l6, -0xcc, %l4
	.word	0xc1ee5000	! t0_kref+0x253c:   	prefetcha	%i1, 0
	.word	0x90fae525	! t0_kref+0x2540:   	sdivcc	%o3, 0x525, %o0
	.word	0xe93e0000	! t0_kref+0x2544:   	std	%f20, [%i0]
	.word	0xea063ff8	! t0_kref+0x2548:   	ld	[%i0 - 8], %l5
	.word	0xaaa76e0c	! t0_kref+0x254c:   	subcc	%i5, 0xe0c, %l5
	.word	0xa65d400d	! t0_kref+0x2550:   	smul	%l5, %o5, %l3
	.word	0xac0b4014	! t0_kref+0x2554:   	and	%o5, %l4, %l6
	.word	0xd0460000	! t0_kref+0x2558:   	ldsw	[%i0], %o0
	.word	0xa6fa001b	! t0_kref+0x255c:   	sdivcc	%o0, %i3, %l3
	.word	0xa6ba673b	! t0_kref+0x2560:   	xnorcc	%o1, 0x73b, %l3
	.word	0x81ddf2b2	! t0_kref+0x2564:   	flush	%l7 - 0xd4e
	.word	0x85a2084a	! t0_kref+0x2568:   	faddd	%f8, %f10, %f2
	.word	0xaf3e8015	! t0_kref+0x256c:   	sra	%i2, %l5, %l7
	.word	0xaedea485	! t0_kref+0x2570:   	smulcc	%i2, 0x485, %l7
	.word	0xcf067ff4	! t0_kref+0x2574:   	ld	[%i1 - 0xc], %f7
	.word	0xac67401c	! t0_kref+0x2578:   	subc	%i5, %i4, %l6
	.word	0x2b12665e	! t0_kref+0x257c:   	sethi	%hi(0x49997800), %l5
	.word	0xa5a60952	! t0_kref+0x2580:   	fmuld	%f24, %f18, %f18
	.word	0x32480008	! t0_kref+0x2584:   	bne,a,pt	%icc, _kref+0x25a4
	.word	0xe300a010	! t0_kref+0x2588:   	ld	[%g2 + 0x10], %f17
	.word	0xae8f001a	! t0_kref+0x258c:   	andcc	%i4, %i2, %l7
	.word	0xaeda223f	! t0_kref+0x2590:   	smulcc	%o0, 0x23f, %l7
	.word	0xaa376e0c	! t0_kref+0x2594:   	orn	%i5, 0xe0c, %l5
	.word	0xaea5c000	! t0_kref+0x2598:   	subcc	%l7, %g0, %l7
	.word	0xacba8015	! t0_kref+0x259c:   	xnorcc	%o2, %l5, %l6
	.word	0xab0d0015	! t0_kref+0x25a0:   	tsubcc	%l4, %l5, %l5
	.word	0xf828a027	! t0_kref+0x25a4:   	stb	%i4, [%g2 + 0x27]
	.word	0x81dec000	! t0_kref+0x25a8:   	flush	%i3
	.word	0xe6080019	! t0_kref+0x25ac:   	ldub	[%g0 + %i1], %l3
	.word	0xa8b76e8c	! t0_kref+0x25b0:   	orncc	%i5, 0xe8c, %l4
	.word	0xec5e001d	! t0_kref+0x25b4:   	ldx	[%i0 + %i5], %l6
	.word	0xa6be8015	! t0_kref+0x25b8:   	xnorcc	%i2, %l5, %l3
	.word	0x81850000	! t0_kref+0x25bc:   	wr	%l4, %g0, %y
	.word	0xb1a38d28	! t0_kref+0x25c0:   	fsmuld	%f14, %f8, %f24
	.word	0xd236c000	! t0_kref+0x25c4:   	sth	%o1, [%i3]
	.word	0x8143c000	! t0_kref+0x25c8:   	stbar
	.word	0x2c480007	! t0_kref+0x25cc:   	bneg,a,pt	%icc, _kref+0x25e8
	.word	0xa7a0052c	! t0_kref+0x25d0:   	fsqrts	%f12, %f19
	.word	0xec56001b	! t0_kref+0x25d4:   	ldsh	[%i0 + %i3], %l6
	.word	0xec00a014	! t0_kref+0x25d8:   	ld	[%g2 + 0x14], %l6
	.word	0xa922f66e	! t0_kref+0x25dc:   	mulscc	%o3, -0x992, %l4
	.word	0xd8a61000	! t0_kref+0x25e0:   	sta	%o4, [%i0]0x80
	.word	0x90feb459	! t0_kref+0x25e4:   	sdivcc	%i2, -0xba7, %o0
	.word	0xd900a010	! t0_kref+0x25e8:   	ld	[%g2 + 0x10], %f12
	.word	0x913ee00c	! t0_kref+0x25ec:   	sra	%i3, 0xc, %o0
	.word	0x27800008	! t0_kref+0x25f0:   	fbul,a	_kref+0x2610
	.word	0x89a01a4a	! t0_kref+0x25f4:   	fdtoi	%f10, %f4
	.word	0xaab80015	! t0_kref+0x25f8:   	xnorcc	%g0, %l5, %l5
	.word	0x90d2800b	! t0_kref+0x25fc:   	umulcc	%o2, %o3, %o0
	.word	0x9056a92b	! t0_kref+0x2600:   	umul	%i2, 0x92b, %o0
	.word	0x39800005	! t0_kref+0x2604:   	fbuge,a	_kref+0x2618
	.word	0xae36c00d	! t0_kref+0x2608:   	orn	%i3, %o5, %l7
	.word	0xcd3e0000	! t0_kref+0x260c:   	std	%f6, [%i0]
	.word	0xeec01018	! t0_kref+0x2610:   	ldswa	[%g0 + %i0]0x80, %l7
	.word	0x28480004	! t0_kref+0x2614:   	bleu,a,pt	%icc, _kref+0x2624
	.word	0x81ddc005	! t0_kref+0x2618:   	flush	%l7 + %g5
	.word	0xb9a24924	! t0_kref+0x261c:   	fmuls	%f9, %f4, %f28
	.word	0x81ae0a4e	! t0_kref+0x2620:   	fcmpd	%fcc0, %f24, %f14
	.word	0xd300a01c	! t0_kref+0x2624:   	ld	[%g2 + 0x1c], %f9
	.word	0xe5a71019	! t0_kref+0x2628:   	sta	%f18, [%i4 + %i1]0x80
	.word	0xa80e8016	! t0_kref+0x262c:   	and	%i2, %l6, %l4
	.word	0xa89d2149	! t0_kref+0x2630:   	xorcc	%l4, 0x149, %l4
	.word	0xa6db6f50	! t0_kref+0x2634:   	smulcc	%o5, 0xf50, %l3
	.word	0xa84739b9	! t0_kref+0x2638:   	addc	%i4, -0x647, %l4
	.word	0xd9063ff0	! t0_kref+0x263c:   	ld	[%i0 - 0x10], %f12
	sethi	%hi(2f), %o7
	.word	0xe40be264	! t0_kref+0x2644:   	ldub	[%o7 + 0x264], %l2
	.word	0xa41ca00c	! t0_kref+0x2648:   	xor	%l2, 0xc, %l2
	.word	0xe42be264	! t0_kref+0x264c:   	stb	%l2, [%o7 + 0x264]
	.word	0x81dbe264	! t0_kref+0x2650:   	flush	%o7 + 0x264
	.word	0xc93e7fe8	! t0_kref+0x2654:   	std	%f4, [%i1 - 0x18]
	.word	0x8fa1882d	! t0_kref+0x2658:   	fadds	%f6, %f13, %f7
	.word	0xa8570014	! t0_kref+0x265c:   	umul	%i4, %l4, %l4
	.word	0x85873420	! t0_kref+0x2660:   	wr	%i4, 0xfffff420, %ccr
2:	.word	0x89a0052d	! t0_kref+0x2664:   	fsqrts	%f13, %f4
	.word	0xe856c018	! t0_kref+0x2668:   	ldsh	[%i3 + %i0], %l4
	.word	0xb5a00026	! t0_kref+0x266c:   	fmovs	%f6, %f26
	.word	0x9fc00004	! t0_kref+0x2670:   	call	%g0 + %g4
	.word	0xf11fbf20	! t0_kref+0x2674:   	ldd	[%fp - 0xe0], %f24
	.word	0xac52400c	! t0_kref+0x2678:   	umul	%o1, %o4, %l6
	.word	0x89a38852	! t0_kref+0x267c:   	faddd	%f14, %f18, %f4
	.word	0xc3ee101c	! t0_kref+0x2680:   	prefetcha	%i0 + %i4, 1
	.word	0xaaff2e12	! t0_kref+0x2684:   	sdivcc	%i4, 0xe12, %l5
	.word	0x86102001	! t0_kref+0x2688:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x268c:   	bne,a	_kref+0x268c
	.word	0x86a0e001	! t0_kref+0x2690:   	subcc	%g3, 1, %g3
	.word	0x908d2de1	! t0_kref+0x2694:   	andcc	%l4, 0xde1, %o0
	call	SYM(t0_subr1)
	.word	0x81dac005	! t0_kref+0x269c:   	flush	%o3 + %g5
	.word	0xaedf75dc	! t0_kref+0x26a0:   	smulcc	%i5, -0xa24, %l7
	.word	0x3e480006	! t0_kref+0x26a4:   	bvc,a,pt	%icc, _kref+0x26bc
	.word	0xaca5bc74	! t0_kref+0x26a8:   	subcc	%l6, -0x38c, %l6
	.word	0xae0da851	! t0_kref+0x26ac:   	and	%l6, 0x851, %l7
	.word	0xf36e401b	! t0_kref+0x26b0:   	prefetch	%i1 + %i3, 25
	.word	0xd056401b	! t0_kref+0x26b4:   	ldsh	[%i1 + %i3], %o0
	.word	0xd27e401c	! t0_kref+0x26b8:   	swap	[%i1 + %i4], %o1
	.word	0xa73ee00f	! t0_kref+0x26bc:   	sra	%i3, 0xf, %l3
	.word	0xd53e7ff8	! t0_kref+0x26c0:   	std	%f10, [%i1 - 8]
	.word	0xaba01893	! t0_kref+0x26c4:   	fitos	%f19, %f21
	.word	0xae400008	! t0_kref+0x26c8:   	addc	%g0, %o0, %l7
	.word	0xaa46c017	! t0_kref+0x26cc:   	addc	%i3, %l7, %l5
	.word	0x22800001	! t0_kref+0x26d0:   	be,a	_kref+0x26d4
	.word	0xf826001c	! t0_kref+0x26d4:   	st	%i4, [%i0 + %i4]
	.word	0xacaec00b	! t0_kref+0x26d8:   	andncc	%i3, %o3, %l6
	.word	0x9fc00004	! t0_kref+0x26dc:   	call	%g0 + %g4
	.word	0x81dfc019	! t0_kref+0x26e0:   	flush	%i7 + %i1
	.word	0xf876001d	! t0_kref+0x26e4:   	stx	%i4, [%i0 + %i5]
	.word	0xfc39401d	! t0_kref+0x26e8:   	std	%fp, [%g5 + %i5]
	.word	0xaa63401a	! t0_kref+0x26ec:   	subc	%o5, %i2, %l5
	.word	0xd1064000	! t0_kref+0x26f0:   	ld	[%i1], %f8
	.word	0xec50a030	! t0_kref+0x26f4:   	ldsh	[%g2 + 0x30], %l6
	.word	0xac582e8c	! t0_kref+0x26f8:   	smul	%g0, 0xe8c, %l6
	.word	0x86102003	! t0_kref+0x26fc:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x2700:   	bne,a	_kref+0x2700
	.word	0x86a0e001	! t0_kref+0x2704:   	subcc	%g3, 1, %g3
	.word	0xaa96c015	! t0_kref+0x2708:   	orcc	%i3, %l5, %l5
	.word	0xacff401d	! t0_kref+0x270c:   	sdivcc	%i5, %i5, %l6
	.word	0xf1ee101c	! t0_kref+0x2710:   	prefetcha	%i0 + %i4, 24
	.word	0xb9a549ae	! t0_kref+0x2714:   	fdivs	%f21, %f14, %f28
	.word	0x9ba018c8	! t0_kref+0x2718:   	fdtos	%f8, %f13
	.word	0x9067401d	! t0_kref+0x271c:   	subc	%i5, %i5, %o0
	.word	0xf11fbf38	! t0_kref+0x2720:   	ldd	[%fp - 0xc8], %f24
	.word	0xaa65c00c	! t0_kref+0x2724:   	subc	%l7, %o4, %l5
	.word	0xac7d67ec	! t0_kref+0x2728:   	sdiv	%l5, 0x7ec, %l6
	.word	0xac357bb6	! t0_kref+0x272c:   	orn	%l5, -0x44a, %l6
	.word	0xc12e401c	! t0_kref+0x2730:   	st	%fsr, [%i1 + %i4]
	.word	0xaa473ff3	! t0_kref+0x2734:   	addc	%i4, -0xd, %l5
	.word	0x2d800007	! t0_kref+0x2738:   	fbg,a	_kref+0x2754
	.word	0x90ff401c	! t0_kref+0x273c:   	sdivcc	%i5, %i4, %o0
	.word	0xa80aef04	! t0_kref+0x2740:   	and	%o3, 0xf04, %l4
	.word	0x01000000	! t0_kref+0x2744:   	nop
	.word	0x01000000	! t0_kref+0x2748:   	nop
	.word	0x01000000	! t0_kref+0x274c:   	nop
	.word	0x01000000	! t0_kref+0x2750:   	nop
	call	SYM(_kaos_done)
	.word	0x01000000	! t0_kref+0x2758:   	nop
	KGLOBAL(t0_ktbl_end)
t0_ktbl_end:
t0_ktbl_page_end:

KTEXT_MODULE(t0_module_subr0, 0x47ea0000)
.seg "text"
t0_subr0_page_begin:
	.skip 8188
.global _t0_subr0; ENTRY(t0_subr0)
	.word	0xa6844012	! t0_subr0+0x0:   	addcc	%l1, %l2, %l3
	.word	0x81c3e008	! t0_subr0+0x4:   	retl
	.word	0xaa64c014	! t0_subr0+0x8:   	subc	%l3, %l4, %l5
t0_subr0_page_end:

KTEXT_MODULE(t0_module_subr1, 0x486e6000)
.seg "text"
t0_subr1_page_begin:
	.skip 8188
.global _t0_subr1; ENTRY(t0_subr1)
	.word	0x9de3bfa0	! t0_subr1+0x0:   	save	%sp, -0x60, %sp
	.word	0xb29eaa5a	! t0_subr1+0x4:   	xorcc	%i2, 0xa5a, %i1
	.word	0x81c7e008	! t0_subr1+0x8:   	ret
	.word	0xa7ee6001	! t0_subr1+0xc:   	restore	%i1, 1, %l3
t0_subr1_page_end:

KTEXT_MODULE(t0_module_subr2, 0x47b72000)
.seg "text"
t0_subr2_page_begin:
	.skip 8184
.global _t0_subr2; ENTRY(t0_subr2)
	.word	0x9de3bfa0	! t0_subr2+0x0:   	save	%sp, -0x60, %sp
	.word	0xb2066001	! t0_subr2+0x4:   	add	%i1, 1, %i1
	.word	0x81c7e008	! t0_subr2+0x8:   	ret
	.word	0xa3ee6001	! t0_subr2+0xc:   	restore	%i1, 1, %l1
t0_subr2_page_end:

KTEXT_MODULE(t0_module_subr3, 0x6836a000)
.seg "text"
t0_subr3_page_begin:
	.skip 8156
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
!  Total operations: 2361  
!
!  Operation frequencies
!
!  name               exp    obs
!  ldsb              1.31   1.74
!  ldub              0.61   0.68
!  ldsh              1.01   1.40
!  lduh              1.19   1.14
!  ld                0.56   0.68
!  ldd               0.13   0.08
!  swap              0.63   0.59
!  ldstub            1.24   1.23
!  stb               0.03   0.00
!  sth               0.12   0.08
!  st                0.36   0.68
!  std               0.33   0.51
!  add               0.88   0.89
!  addcc             0.03   0.00
!  addx              1.51   1.69
!  addxcc            0.53   0.55
!  taddcc            0.33   0.30
!  taddcctv          0.08   0.00
!  sub               0.48   0.34
!  subcc             1.17   1.06
!  subx              1.07   1.14
!  subxcc            0.82   0.80
!  tsubcc            0.32   0.59
!  tsubcctv          0.24   0.17
!  mulscc            0.11   0.21
!  and               1.19   0.97
!  andcc             0.85   0.80
!  andn              1.28   0.76
!  andncc            1.28   1.23
!  or                0.20   0.17
!  orcc              1.26   1.14
!  orn               1.02   1.36
!  orncc             0.69   0.72
!  xor               0.41   0.55
!  xorcc             1.41   1.48
!  xnor              0.28   0.34
!  xnorcc            1.06   1.06
!  sll               0.59   0.72
!  srl               0.44   0.47
!  sra               1.43   1.61
!  unimp             0.31   0.34
!  umul              1.36   1.23
!  smul              1.46   1.61
!  udiv              1.57   1.40
!  sdiv              0.91   0.89
!  umulcc            1.17   0.89
!  smulcc            1.48   1.52
!  udivcc            0.22   0.17
!  sdivcc            1.37   1.57
!  rdy               1.30   1.19
!  wry               0.56   0.72
!  bicc              1.52   1.44
!  sethi             1.44   2.16
!  jmpl              0.94   1.14
!  call              0.51   0.42
!  ticc              0.00   0.00
!  flush             1.29   1.52
!  save              1.63   1.27
!  restore           0.35   0.00
!  stbar             0.48   0.34
!  ldf               1.13   1.27
!  lddf              0.03   0.00
!  stf               0.38   0.25
!  stdf              1.47   1.57
!  fadds             0.71   0.80
!  fsubs             1.33   1.36
!  fmuls             0.77   1.10
!  fdivs             0.56   0.59
!  faddd             1.44   1.06
!  fsubd             0.07   0.00
!  fmuld             0.58   0.51
!  fdivd             0.81   0.97
!  faddq             0.00   0.00
!  fsubq             0.00   0.00
!  fmulq             0.00   0.00
!  fdivq             0.00   0.00
!  fsmuld            1.47   1.91
!  fdmulq            0.00   0.00
!  fitos             1.02   1.19
!  fitod             1.21   1.36
!  fitoq             0.00   0.00
!  fstoi             0.32   0.30
!  fstod             0.09   0.08
!  fstoq             0.00   0.00
!  fdtoi             0.44   0.51
!  fdtos             0.60   0.64
!  fdtoq             0.00   0.00
!  fqtoi             0.00   0.00
!  fqtos             0.00   0.00
!  fqtod             0.00   0.00
!  fmovs             0.44   0.51
!  fnegs             0.24   0.17
!  fabss             1.26   1.36
!  fsqrts            1.31   1.44
!  fsqrtd            0.00   0.00
!  fsqrtq            0.00   0.00
!  fcmps             1.40   1.27
!  fcmpd             1.34   1.14
!  fcmpq             0.00   0.00
!  fcmpes            0.40   0.25
!  fcmped            0.20   0.13
!  fcmpeq            0.00   0.00
!  fbfcc             1.19   1.02
!  ldfsr             0.27   0.00
!  stfsr             0.17   0.17
!  loop              1.33   1.19
!  offset            0.28   0.04
!  area              0.13   0.17
!  target            0.08   0.08
!  goto              0.25   0.25
!  sigsegv           0.28   0.25
!  sigbus            0.29   0.13
!  imodify           0.93   0.55
!  ldfsr_offset      0.03   0.00
!  fpattern          0.69   0.42
!  lbranch           0.27   0.08
!  shmld             3.68   3.94
!  shmst             3.18   2.84
!  shmpf             1.57   1.36
!  shmswap           0.10   0.08
!  shmblkld          0.44   0.00
!  shmblkst          0.82   0.13
!  shmblkchk         0.46   0.34
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
!  casa              0.15   0.21
!  rdasi             0.29   0.47
!  wrasi             0.32   0.34
!  bpcc              2.23   1.91
!  fbpfcc            0.50   0.47
!  fmovscc           0.08   0.17
!  fmovdcc           0.14   0.42
!  fmovqcc           0.00   0.00
!  movcc             0.05   0.04
!  flushw            0.27   0.30
!  membar            0.06   0.08
!  prefetch          1.22   1.52
!  rdpc              0.15   0.13
!  ldqf              0.00   0.00
!  stqf              0.00   0.00
!  ldfa              0.18   0.13
!  lddfa             0.11   0.08
!  ldqfa             0.00   0.00
!  ldsba             0.13   0.08
!  ldsha             0.28   0.17
!  lduba             0.19   0.34
!  lduha             0.17   0.08
!  lda               0.13   0.08
!  ldda              0.07   0.17
!  ldstuba           0.22   0.17
!  prefetcha         1.12   1.14
!  stfa              0.21   0.30
!  stdfa             0.24   0.51
!  stqfa             0.00   0.00
!  stba              0.26   0.17
!  stha              0.11   0.13
!  sta               0.28   0.42
!  stda              0.14   0.17
!  swapa             0.30   0.38
!  fmovd             0.22   0.21
!  fnegd             0.00   0.00
!  fabsd             0.24   0.25
!  fstox             0.14   0.04
!  fdtox             0.08   0.13
!  fxtos             0.12   0.13
!  fxtod             0.16   0.08
!  lds               0.23   0.25
!  ldsa              0.03   0.04
!  ldx               0.24   0.42
!  ldxa              0.12   0.13
!  nofault           0.05   0.04
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
!  partial_st8       0.03   0.04
!  partial_st16      0.09   0.04
!  partial_st32      0.09   0.25
!  short_st8         0.30   0.34
!  short_st16        0.12   0.34
!  short_ld8         0.03   0.04
!  short_ld16        0.21   0.38
!  blkld             0.21   0.00
!  blkst             0.28   0.00
!  blkld_offset      0.25   0.00
!  blkst_offset      0.12   0.00
!  blk_check         0.07   0.04
!  casxa             0.20   0.34
!  rdccr             0.06   0.08
!  rdfprs            0.27   0.34
!  wrccr             0.13   0.38
!  popc              0.28   0.25
!  wrfprs            0.15   0.17
!  stx               0.04   0.08
!  stxa              0.03   0.00
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
KDATA_MODULE(t0_module_offset_table, 0x0fd12000)
.seg "data"
t0_offset_table_start:
t0_offset_table_size:	.word	0x00000008
t0_offset_table:
	.word	0xfffffff0
	.word	0x00000008
	.word	0xffffffe0
	.word	0x00000010
	.word	0xffffffe8
	.word	0xfffffff8
	.word	0x00000000
	.word	0x00000018
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

KDATA_MODULE(t0_module_data_in_regs, 0x373e0000)
.seg "data"
KGLOBAL(t0_data_in_regs)
t0_data_in_regs_start:
t0_data_in_regs:
	.word	0x72050f70          ! %f0
	.word	0xbb4dafc2          ! %f1
	.word	0xda7f6f2f          ! %f2
	.word	0x6927414c          ! %f3
	.word	0x3f57111f          ! %f4
	.word	0x99748035          ! %f5
	.word	0xfab06a80          ! %f6
	.word	0x5b3343cb          ! %f7
	.word	0xc44b832a          ! %f8
	.word	0xcf248e71          ! %f9
	.word	0x5d56e7bd          ! %f10
	.word	0xe17c75cc          ! %f11
	.word	0x1ba70f80          ! %f12
	.word	0x97a5ec73          ! %f13
	.word	0x92057933          ! %f14
	.word	0x99dd907d          ! %f15
	.word	0x0bc034ab          ! %f16
	.word	0x420dc764          ! %f17
	.word	0x6844eaf2          ! %f18
	.word	0x46593718          ! %f19
	.word	0xdbc4cd35          ! %f20
	.word	0xfface52f          ! %f21
	.word	0x35e2b2d4          ! %f22
	.word	0xf0d3409c          ! %f23
	.word	0x0bc62948          ! %f24
	.word	0xfb6fe753          ! %f25
	.word	0xba67dcbd          ! %f26
	.word	0x63a868bf          ! %f27
	.word	0xaf3a9e94          ! %f28
	.word	0xa88066f9          ! %f29
	.word	0x935bf723          ! %f30
	.word	0x4c5b9c22          ! %f31
	.word	0x3b2db274          ! %f32
	.word	0xe3d33e49          ! %f33
	.word	0xcd2bc3d0          ! %f34
	.word	0x1d4f53c6          ! %f35
	.word	0x11464253          ! %f36
	.word	0xa24192f8          ! %f37
	.word	0x9bc3b0e6          ! %f38
	.word	0x77f4b3be          ! %f39
	.word	0x715c4e4c          ! %f40
	.word	0x688f7625          ! %f41
	.word	0x986a5e24          ! %f42
	.word	0xa9416126          ! %f43
	.word	0x2ace4a10          ! %f44
	.word	0xbd9c2d65          ! %f45
	.word	0x7867b267          ! %f46
	.word	0xd9d84353          ! %f47
	.word	0xef60180c          ! %f48
	.word	0x8625791c          ! %f49
	.word	0x3dc94572          ! %f50
	.word	0xc160a44b          ! %f51
	.word	0x796c12cb          ! %f52
	.word	0xb6486c0e          ! %f53
	.word	0xa15d21f1          ! %f54
	.word	0x644a6477          ! %f55
	.word	0x60d0c898          ! %f56
	.word	0xc47fa835          ! %f57
	.word	0x5f0823ba          ! %f58
	.word	0x0bf53596          ! %f59
	.word	0xf38c4d67          ! %f60
	.word	0xa58814d4          ! %f61
	.word	0x242d7656          ! %f62
	.word	0xde1c10f5          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0x0         ! %g1 (code pointer)
	.word	t0_data_in_shm_area ! %g2 (shared area pointer)
	.word	0x975ae9ca          ! %g3 (loop index)
	.word	SYM(t0_subr1)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0x403cc8cc          ! %o0
	.word	0x9c16d80f          ! %o1
	.word	0x5adc698a          ! %o2
	.word	0xc8188be6          ! %o3
	.word	0x5cd8a248          ! %o4
	.word	0x615673a3          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0x4aa046f4          ! %l0
	.word	0xfd9261cc          ! %l1
	.word	0xe730f7c0          ! %l2
	.word	0x48c55cdc          ! %l3
	.word	0x1fe8172c          ! %l4
	.word	0x62b8ec2d          ! %l5
	.word	0x2f76836c          ! %l6
	.word	0xa70b754b          ! %l7
	.word	t0_data_in_area0    ! %i0 (area pointer)
	.word	t0_data_in_area0    ! %i1 (area pointer)
	.word	0xfffffffc          ! %i2 (byte offset)
	.word	0xffffffee          ! %i3 (halfword offset)
	.word	0x00000008          ! %i4 (word offset)
	.word	0x00000008          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0xc8cf968b          ! %y
	.word	0x0000000d          ! %icc (nzvc)
	.word	0xc0000fdc          ! %fsr
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

KDATA_MODULE(t0_module_data_in_stack, 0x4d03c000)
.seg "data"
KGLOBAL(t0_data_in_mtbl_size)
KGLOBAL(t0_data_in_mtbl)
KGLOBAL(t0_data_in_stack)
t0_data_in_stack_start:
	.word	0xa7007ede
	.word	0x8a312b5f
	.word	0xfb3781f8
	.word	0x09af5eb3
	.word	0x7a559b46
	.word	0x95157b38
	.word	0x72508d32
	.word	0x7d85aebb
	.word	0x17e32ed8
	.word	0x8705e99a
	.word	0xdfb640b2
	.word	0x90ec1d98
	.word	0x154a5b38
	.word	0xe66441b5
	.word	0x22793eae
	.word	0xe91a5713
	.word	0xcf394368
	.word	0xa5935e32
	.word	0x71257c55
	.word	0xf98a3104
	.word	0x6808d98f
	.word	0xfbb5ddac
	.word	0xec054f38
	.word	0x98bc36e4
	.word	0xb94344fc
	.word	0x7e3f2a5f
	.word	0xfebd6ce5
	.word	0x9a80daa0
	.word	0xa21c2469
	.word	0xa460c91e
	.word	0xebb6c0d5
	.word	0x28635eaf
	.word	0xddb43083
	.word	0x0f89238a
	.word	0x13b53c87
	.word	0xd510cd66
	.word	0xa19602a9
	.word	0x55c84180
	.word	0x304905ec
	.word	0xaa66918a
	.word	0xb77203f4
	.word	0x9f4225d3
	.word	0xaab9a805
	.word	0x88798427
	.word	0xe0fbc877
	.word	0x261dc23b
	.word	0x40e129ca
	.word	0xff9f839f
	.word	0xea2b5ac7
	.word	0xbbdab68c
	.word	0x30672f4d
	.word	0x9d92e805
	.word	0x71493bbd
	.word	0x7ee74f2a
	.word	0x752a891f
	.word	0x3f6868ab
	.word	0xb5541a7a
	.word	0x3af376bb
	.word	0x3ba9d5f2
	.word	0x048546f9
	.word	0x86bb88ab
	.word	0xcd148f1e
	.word	0x52221a7f
	.word	0xb34cd280
	.word	0x245b2f0d
	.word	0xcd99659c
	.word	0x1d2473aa
	.word	0xcc199a4e
	.word	0x83564633
	.word	0xa3acb65d
	.word	0xbcd246e3
	.word	0xcb87df83
	.word	0x642b5786
	.word	0xa5d7f31d
	.word	0xa90194ce
	.word	0xaf5c1d24
	.word	0x16548a8d
	.word	0x9d5f411f
	.word	0xfa815225
	.word	0x3aa9b92e
	.word	0xd649026f
	.word	0xb48ae261
	.word	0xe8cfeadd
	.word	0x938b32ee
	.word	0xfbf80fb5
	.word	0xc8817e10
	.word	0x24145387
	.word	0x17fe628f
	.word	0x721f3a53
	.word	0x3999fc3e
	.word	0xb54c4cf9
	.word	0xf58c9df4
	.word	0x256867e8
	.word	0x9042e8d1
	.word	0xe8a8be2d
	.word	0x818fd6c8
	.word	0xc54da244
	.word	0xbc0891be
	.word	0x923b4868
	.word	0x336305d2
	.word	0x9494422b
	.word	0xe5225477
	.word	0x39a6799e
	.word	0xb7dd778d
	.word	0x6c098258
	.word	0x0282cea2
	.word	0x88b44114
	.word	0xf35dcdf7
	.word	0x0446bec4
	.word	0xddede60a
	.word	0xc0cc8a47
	.word	0x16a2cba9
	.word	0x2ae3e427
	.word	0x5052dbda
	.word	0x2680220c
	.word	0xa7fd3c27
	.word	0x88e2d3bf
	.word	0x29d7df08
	.word	0xcefa49f8
	.word	0x9f478d79
	.word	0xeb86bf4f
	.word	0xfde7d20e
	.word	0x3b6d9e01
	.word	0x54c4eefa
	.word	0xb276c16a
	.word	0x736a37df
	.word	0xc8b73064
	.word	0x02d3096f
	.word	0xbe3b35f0
	.word	0x7f587c18
	.word	0x67bcffca
	.word	0x4576a45a
	.word	0x5d1996d9
	.word	0x43630a76
	.word	0xf3bb2ba6
	.word	0x3a7ccc90
	.word	0xaa4ae131
	.word	0x0e8be988
	.word	0x11058ae0
	.word	0x5e6f5009
	.word	0x48c4c663
	.word	0x09c3cca5
	.word	0xeef988b7
	.word	0xc734a2f7
	.word	0x878e2db9
	.word	0x79f1d11f
	.word	0xdd366be2
	.word	0x0a208219
	.word	0xc61bca22
	.word	0xb29d5ab8
	.word	0x0cf06bf9
	.word	0xa1bbe650
	.word	0x53b9c836
	.word	0x0bf4c354
	.word	0x65953913
	.word	0x8ce01d72
	.word	0x41d3d877
	.word	0x9362d1f0
	.word	0x3e3ed9af
	.word	0xbe2a1c5d
	.word	0x763d19da
	.word	0x1a902cd2
	.word	0x6ddc02d7
	.word	0xb5885e4f
	.word	0x3cada885
	.word	0x8ccd3b02
	.word	0x38c34e82
	.word	0xc6f6e575
t0_data_in_sp:
	.word	0x2dc3d4d8
	.word	0x91b428f8
	.word	0x8dd8f439
	.word	0x76a230c1
	.word	0x4a3346b1
	.word	0xf49a0496
	.word	0x0dc4e7fe
	.word	0x5ce33b00
	.word	t0_data_in_area0
	.word	t0_data_in_area0
	.word	0xffffffef
	.word	0xfffffff2
	.word	0xfffffff0
	.word	0x00000010
	.word	t0_data_in_fp
	.word	0x39ae4dc9
	.word	0x6fe91d12
	.word	0xba5bfdfc
	.word	0xf20677d0
	.word	0x73a54f38
	.word	0x2b2b3236
	.word	0xde8de0c4
	.word	0x80f83459
	.word	0x3c6900ab
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
	.word   	0x7ff80694	! [%fp - 0xc]
	.word   	0x122fd57b	! [%fp - 0x8]
	.word   	0xe4e801c8	! [%fp - 0x4]
.global t0_data_in_fp; t0_data_in_fp:
	.word	0xbde5e014
	.word	0x0a9bde98
	.word	0x17307018
	.word	0xb1479f77
	.word	0x042dbcc2
	.word	0x15b137bb
	.word	0x62b25d23
	.word	0x7030c217
	.word	0xfc1e261a
	.word	0xb463a328
	.word	0x2322d187
	.word	0x51db28f8
	.word	0xd2729186
	.word	0x203326a3
	.word	0xbfa6a3ac
	.word	0xe9084388
	.word	0xf1fe6bac
	.word	0x171247a6
	.word	0x661761c5
	.word	0x6f452b18
	.word	0x92da88e2
	.word	0xe7b724cc
	.word	0x468af966
	.word	0xd2abf4e6
t0_data_in_stacktop:
	.word	0
t0_data_in_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_in_area0, 0x15606000)
.seg "data"
t0_data_in_area0_start:
.skip 4480
t0_data_in_area0_begin:
	.word	0x5914a8e2	! t0_data_in_area0-0x20
	.word	0x349a4173	! t0_data_in_area0-0x1c
	.word	0x77f5c458	! t0_data_in_area0-0x18
	.word	0x51d9a057	! t0_data_in_area0-0x14
	.word	0x4f2701ba	! t0_data_in_area0-0x10
	.word	0xb0a3e79b	! t0_data_in_area0-0xc
	.word	0x0a200eb0	! t0_data_in_area0-0x8
	.word	0xaa5e2583	! t0_data_in_area0-0x4
.global t0_data_in_area0; t0_data_in_area0:
	.word	0x32690605	! t0_data_in_area0+0x0
	.word	0xcd334414	! t0_data_in_area0+0x4
	.word	0xab256a1e	! t0_data_in_area0+0x8
	.word	0x9e4067f7	! t0_data_in_area0+0xc
	.word	0x9d09da5f	! t0_data_in_area0+0x10
	.word	0x7e38a0d8	! t0_data_in_area0+0x14
	.word	0x43456282	! t0_data_in_area0+0x18
	.word	0x9e8811b5	! t0_data_in_area0+0x1c
t0_data_in_area0_end:
.skip 3648
t0_data_in_area0_stop:

KDATA_MODULE(t0_module_data_in_shm_area, 0x553fc000)
.seg "data"
t0_data_in_shm_area_start:
t0_data_in_shm_area_begin:
.global t0_data_in_shm_area; t0_data_in_shm_area:
	.word	0xdd382e15	! t0_data_in_shm_area+0x0 (t0)
	.word	0x80ce61b5	! t0_data_in_shm_area+0x4 (t0)
	.word	0x963267c4	! t0_data_in_shm_area+0x8 (t0)
	.word	0xc75b9a7f	! t0_data_in_shm_area+0xc (t0)
	.word	0xf3226b1c	! t0_data_in_shm_area+0x10 (t0)
	.word	0x7952a72f	! t0_data_in_shm_area+0x14 (t0)
	.word	0xfe8500e4	! t0_data_in_shm_area+0x18 (t0)
	.word	0x9e60ff54	! t0_data_in_shm_area+0x1c (t0)
	.word	0x2ab57144	! t0_data_in_shm_area+0x20 (t0)
	.word	0x71bdbba3	! t0_data_in_shm_area+0x24 (t0)
	.word	0xb3c69c4f	! t0_data_in_shm_area+0x28 (t0)
	.word	0x81f3ee3b	! t0_data_in_shm_area+0x2c (t0)
	.word	0x71af50ad	! t0_data_in_shm_area+0x30 (t0)
	.word	0xce0faeaf	! t0_data_in_shm_area+0x34 (t0)
	.word	0x4ee89174	! t0_data_in_shm_area+0x38 (t0)
	.word	0xc7ac6a3e	! t0_data_in_shm_area+0x3c (t0)
	.word	0xf9feb779	! t0_data_in_shm_area+0x40 (t0 bload)
	.word	0x6571c2d1	! t0_data_in_shm_area+0x44
	.word	0xd1312797	! t0_data_in_shm_area+0x48
	.word	0xc6dd2bb9	! t0_data_in_shm_area+0x4c
	.word	0xf2bf06c3	! t0_data_in_shm_area+0x50
	.word	0xa94e914e	! t0_data_in_shm_area+0x54
	.word	0xc7f1b5e5	! t0_data_in_shm_area+0x58
	.word	0x986140d4	! t0_data_in_shm_area+0x5c
	.word	0x62ac42ce	! t0_data_in_shm_area+0x60
	.word	0x5a6e0854	! t0_data_in_shm_area+0x64
	.word	0x10f630c7	! t0_data_in_shm_area+0x68
	.word	0x1484b24d	! t0_data_in_shm_area+0x6c
	.word	0x24e95281	! t0_data_in_shm_area+0x70
	.word	0x5d50a762	! t0_data_in_shm_area+0x74
	.word	0xa1cfb87a	! t0_data_in_shm_area+0x78
	.word	0x724c307a	! t0_data_in_shm_area+0x7c
	.word	0x17a64213	! t0_data_in_shm_area+0x80 (t0 bstore)
	.word	0x8cd79de7	! t0_data_in_shm_area+0x84
	.word	0xbc20fcdf	! t0_data_in_shm_area+0x88
	.word	0x0d1c0c8e	! t0_data_in_shm_area+0x8c
	.word	0x0adb7d02	! t0_data_in_shm_area+0x90
	.word	0x9afdb029	! t0_data_in_shm_area+0x94
	.word	0x742c8a8f	! t0_data_in_shm_area+0x98
	.word	0xeeff021a	! t0_data_in_shm_area+0x9c
	.word	0x772a3348	! t0_data_in_shm_area+0xa0
	.word	0xed3f0668	! t0_data_in_shm_area+0xa4
	.word	0xfa525532	! t0_data_in_shm_area+0xa8
	.word	0x42d194d7	! t0_data_in_shm_area+0xac
	.word	0x79415dd1	! t0_data_in_shm_area+0xb0
	.word	0x1b8c4a42	! t0_data_in_shm_area+0xb4
	.word	0xe52b1311	! t0_data_in_shm_area+0xb8
	.word	0x3a9f06a2	! t0_data_in_shm_area+0xbc
t0_data_in_shm_area_end:
t0_data_in_shm_area_stop:

KDATA_MODULE(t0_module_data_exp_regs, 0x19056000)
.seg "data"
KGLOBAL(t0_data_exp_regs)
t0_data_exp_regs_start:
t0_data_exp_regs:
	.word	0x72050f70          ! %f0
	.word	0xbb4dafc2          ! %f1
	.word	0xda7f6f2f          ! %f2
	.word	0x6927414c          ! %f3
	.word	0x3f57111f          ! %f4
	.word	0x99748035          ! %f5
	.word	0xfab06a80          ! %f6
	.word	0x5b3343cb          ! %f7
	.word	0xc44b832a          ! %f8
	.word	0xcf248e71          ! %f9
	.word	0x5d56e7bd          ! %f10
	.word	0xe17c75cc          ! %f11
	.word	0x1ba70f80          ! %f12
	.word	0x97a5ec73          ! %f13
	.word	0x92057933          ! %f14
	.word	0x99dd907d          ! %f15
	.word	0x0bc034ab          ! %f16
	.word	0x420dc764          ! %f17
	.word	0x6844eaf2          ! %f18
	.word	0x46593718          ! %f19
	.word	0xdbc4cd35          ! %f20
	.word	0xfface52f          ! %f21
	.word	0x35e2b2d4          ! %f22
	.word	0xf0d3409c          ! %f23
	.word	0x0bc62948          ! %f24
	.word	0xfb6fe753          ! %f25
	.word	0xba67dcbd          ! %f26
	.word	0x63a868bf          ! %f27
	.word	0xaf3a9e94          ! %f28
	.word	0xa88066f9          ! %f29
	.word	0x935bf723          ! %f30
	.word	0x4c5b9c22          ! %f31
	.word	0x3b2db274          ! %f32
	.word	0xe3d33e49          ! %f33
	.word	0xcd2bc3d0          ! %f34
	.word	0x1d4f53c6          ! %f35
	.word	0x11464253          ! %f36
	.word	0xa24192f8          ! %f37
	.word	0x9bc3b0e6          ! %f38
	.word	0x77f4b3be          ! %f39
	.word	0x715c4e4c          ! %f40
	.word	0x688f7625          ! %f41
	.word	0x986a5e24          ! %f42
	.word	0xa9416126          ! %f43
	.word	0x2ace4a10          ! %f44
	.word	0xbd9c2d65          ! %f45
	.word	0x7867b267          ! %f46
	.word	0xd9d84353          ! %f47
	.word	0xef60180c          ! %f48
	.word	0x8625791c          ! %f49
	.word	0x3dc94572          ! %f50
	.word	0xc160a44b          ! %f51
	.word	0x796c12cb          ! %f52
	.word	0xb6486c0e          ! %f53
	.word	0xa15d21f1          ! %f54
	.word	0x644a6477          ! %f55
	.word	0x60d0c898          ! %f56
	.word	0xc47fa835          ! %f57
	.word	0x5f0823ba          ! %f58
	.word	0x0bf53596          ! %f59
	.word	0xf38c4d67          ! %f60
	.word	0xa58814d4          ! %f61
	.word	0x242d7656          ! %f62
	.word	0xde1c10f5          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0x0         ! %g1 (code pointer)
	.word	t0_data_exp_shm_area! %g2 (shared area pointer)
	.word	0x975ae9ca          ! %g3 (loop index)
	.word	SYM(t0_subr1)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0x403cc8cc          ! %o0
	.word	0x9c16d80f          ! %o1
	.word	0x5adc698a          ! %o2
	.word	0xc8188be6          ! %o3
	.word	0x5cd8a248          ! %o4
	.word	0x615673a3          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0x4aa046f4          ! %l0
	.word	0xfd9261cc          ! %l1
	.word	0xe730f7c0          ! %l2
	.word	0x48c55cdc          ! %l3
	.word	0x1fe8172c          ! %l4
	.word	0x62b8ec2d          ! %l5
	.word	0x2f76836c          ! %l6
	.word	0xa70b754b          ! %l7
	.word	t0_data_exp_area0   ! %i0 (area pointer)
	.word	t0_data_exp_area0   ! %i1 (area pointer)
	.word	0xfffffffc          ! %i2 (byte offset)
	.word	0xffffffee          ! %i3 (halfword offset)
	.word	0x00000008          ! %i4 (word offset)
	.word	0x00000008          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0xc8cf968b          ! %y
	.word	0x0000000d          ! %icc (nzvc)
	.word	0xc0000fdc          ! %fsr
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

KDATA_MODULE(t0_module_data_exp_stack, 0x69904000)
.seg "data"
KGLOBAL(t0_data_exp_mtbl_size)
KGLOBAL(t0_data_exp_mtbl)
KGLOBAL(t0_data_exp_stack)
t0_data_exp_stack_start:
	.word	0xa7007ede
	.word	0x8a312b5f
	.word	0xfb3781f8
	.word	0x09af5eb3
	.word	0x7a559b46
	.word	0x95157b38
	.word	0x72508d32
	.word	0x7d85aebb
	.word	0x17e32ed8
	.word	0x8705e99a
	.word	0xdfb640b2
	.word	0x90ec1d98
	.word	0x154a5b38
	.word	0xe66441b5
	.word	0x22793eae
	.word	0xe91a5713
	.word	0xcf394368
	.word	0xa5935e32
	.word	0x71257c55
	.word	0xf98a3104
	.word	0x6808d98f
	.word	0xfbb5ddac
	.word	0xec054f38
	.word	0x98bc36e4
	.word	0xb94344fc
	.word	0x7e3f2a5f
	.word	0xfebd6ce5
	.word	0x9a80daa0
	.word	0xa21c2469
	.word	0xa460c91e
	.word	0xebb6c0d5
	.word	0x28635eaf
	.word	0xddb43083
	.word	0x0f89238a
	.word	0x13b53c87
	.word	0xd510cd66
	.word	0xa19602a9
	.word	0x55c84180
	.word	0x304905ec
	.word	0xaa66918a
	.word	0xb77203f4
	.word	0x9f4225d3
	.word	0xaab9a805
	.word	0x88798427
	.word	0xe0fbc877
	.word	0x261dc23b
	.word	0x40e129ca
	.word	0xff9f839f
	.word	0xea2b5ac7
	.word	0xbbdab68c
	.word	0x30672f4d
	.word	0x9d92e805
	.word	0x71493bbd
	.word	0x7ee74f2a
	.word	0x752a891f
	.word	0x3f6868ab
	.word	0xb5541a7a
	.word	0x3af376bb
	.word	0x3ba9d5f2
	.word	0x048546f9
	.word	0x86bb88ab
	.word	0xcd148f1e
	.word	0x52221a7f
	.word	0xb34cd280
	.word	0x245b2f0d
	.word	0xcd99659c
	.word	0x1d2473aa
	.word	0xcc199a4e
	.word	0x83564633
	.word	0xa3acb65d
	.word	0xbcd246e3
	.word	0xcb87df83
	.word	0x642b5786
	.word	0xa5d7f31d
	.word	0xa90194ce
	.word	0xaf5c1d24
	.word	0x16548a8d
	.word	0x9d5f411f
	.word	0xfa815225
	.word	0x3aa9b92e
	.word	0xd649026f
	.word	0xb48ae261
	.word	0xe8cfeadd
	.word	0x938b32ee
	.word	0xfbf80fb5
	.word	0xc8817e10
	.word	0x24145387
	.word	0x17fe628f
	.word	0x721f3a53
	.word	0x3999fc3e
	.word	0xb54c4cf9
	.word	0xf58c9df4
	.word	0x256867e8
	.word	0x9042e8d1
	.word	0xe8a8be2d
	.word	0x818fd6c8
	.word	0xc54da244
	.word	0xbc0891be
	.word	0x923b4868
	.word	0x336305d2
	.word	0x9494422b
	.word	0xe5225477
	.word	0x39a6799e
	.word	0xb7dd778d
	.word	0x6c098258
	.word	0x0282cea2
	.word	0x88b44114
	.word	0xf35dcdf7
	.word	0x0446bec4
	.word	0xddede60a
	.word	0xc0cc8a47
	.word	0x16a2cba9
	.word	0x2ae3e427
	.word	0x5052dbda
	.word	0x2680220c
	.word	0xa7fd3c27
	.word	0x88e2d3bf
	.word	0x29d7df08
	.word	0xcefa49f8
	.word	0x9f478d79
	.word	0xeb86bf4f
	.word	0xfde7d20e
	.word	0x3b6d9e01
	.word	0x54c4eefa
	.word	0xb276c16a
	.word	0x736a37df
	.word	0xc8b73064
	.word	0x02d3096f
	.word	0xbe3b35f0
	.word	0x7f587c18
	.word	0x67bcffca
	.word	0x4576a45a
	.word	0x5d1996d9
	.word	0x43630a76
	.word	0xf3bb2ba6
	.word	0x3a7ccc90
	.word	0xaa4ae131
	.word	0x0e8be988
	.word	0x11058ae0
	.word	0x5e6f5009
	.word	0x48c4c663
	.word	0x09c3cca5
	.word	0xeef988b7
	.word	0xc734a2f7
	.word	0x878e2db9
	.word	0x79f1d11f
	.word	0xdd366be2
	.word	0x0a208219
	.word	0xc61bca22
	.word	0xb29d5ab8
	.word	0x0cf06bf9
	.word	0xa1bbe650
	.word	0x53b9c836
	.word	0x0bf4c354
	.word	0x65953913
	.word	0x8ce01d72
	.word	0x41d3d877
	.word	0x9362d1f0
	.word	0x3e3ed9af
	.word	0xbe2a1c5d
	.word	0x763d19da
	.word	0x1a902cd2
	.word	0x6ddc02d7
	.word	0xb5885e4f
	.word	0x3cada885
	.word	0x8ccd3b02
	.word	0x38c34e82
	.word	0xc6f6e575
t0_data_exp_sp:
	.word	0x2dc3d4d8
	.word	0x91b428f8
	.word	0x8dd8f439
	.word	0x76a230c1
	.word	0x4a3346b1
	.word	0xf49a0496
	.word	0x0dc4e7fe
	.word	0x5ce33b00
	.word	t0_data_exp_area0
	.word	t0_data_exp_area0
	.word	0xffffffef
	.word	0xfffffff2
	.word	0xfffffff0
	.word	0x00000010
	.word	t0_data_exp_fp
	.word	0x39ae4dc9
	.word	0x6fe91d12
	.word	0xba5bfdfc
	.word	0xf20677d0
	.word	0x73a54f38
	.word	0x2b2b3236
	.word	0xde8de0c4
	.word	0x80f83459
	.word	0x3c6900ab
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
	.word   	0x7ff80694	! [%fp - 0xc]
	.word   	0x122fd57b	! [%fp - 0x8]
	.word   	0xe4e801c8	! [%fp - 0x4]
t0_data_exp_fp:
	.word	0xbde5e014
	.word	0x0a9bde98
	.word	0x17307018
	.word	0xb1479f77
	.word	0x042dbcc2
	.word	0x15b137bb
	.word	0x62b25d23
	.word	0x7030c217
	.word	0xfc1e261a
	.word	0xb463a328
	.word	0x2322d187
	.word	0x51db28f8
	.word	0xd2729186
	.word	0x203326a3
	.word	0xbfa6a3ac
	.word	0xe9084388
	.word	0xf1fe6bac
	.word	0x171247a6
	.word	0x661761c5
	.word	0x6f452b18
	.word	0x92da88e2
	.word	0xe7b724cc
	.word	0x468af966
	.word	0xd2abf4e6
t0_data_exp_stacktop:
	.word	0
t0_data_exp_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_exp_area0, 0x0d056000)
.seg "data"
t0_data_exp_area0_start:
.skip 4480
t0_data_exp_area0_begin:
	.word	0x5914a8e2	! t0_data_exp_area0-0x20
	.word	0x349a4173	! t0_data_exp_area0-0x1c
	.word	0x77f5c458	! t0_data_exp_area0-0x18
	.word	0x51d9a057	! t0_data_exp_area0-0x14
	.word	0x4f2701ba	! t0_data_exp_area0-0x10
	.word	0xb0a3e79b	! t0_data_exp_area0-0xc
	.word	0x0a200eb0	! t0_data_exp_area0-0x8
	.word	0xaa5e2583	! t0_data_exp_area0-0x4
.global t0_data_exp_area0; t0_data_exp_area0:
	.word	0x32690605	! t0_data_exp_area0+0x0
	.word	0xcd334414	! t0_data_exp_area0+0x4
	.word	0xab256a1e	! t0_data_exp_area0+0x8
	.word	0x9e4067f7	! t0_data_exp_area0+0xc
	.word	0x9d09da5f	! t0_data_exp_area0+0x10
	.word	0x7e38a0d8	! t0_data_exp_area0+0x14
	.word	0x43456282	! t0_data_exp_area0+0x18
	.word	0x9e8811b5	! t0_data_exp_area0+0x1c
t0_data_exp_area0_end:
.skip 3648
t0_data_exp_area0_stop:

KDATA_MODULE(t0_module_data_exp_shm_area, 0x0835e000)
.seg "data"
t0_data_exp_shm_area_start:
t0_data_exp_shm_area_begin:
.global t0_data_exp_shm_area; t0_data_exp_shm_area:
	.word	0xdd382e15	! t0_data_exp_shm_area+0x0 (t0)
	.word	0x80ce61b5	! t0_data_exp_shm_area+0x4 (t0)
	.word	0x963267c4	! t0_data_exp_shm_area+0x8 (t0)
	.word	0xc75b9a7f	! t0_data_exp_shm_area+0xc (t0)
	.word	0xf3226b1c	! t0_data_exp_shm_area+0x10 (t0)
	.word	0x7952a72f	! t0_data_exp_shm_area+0x14 (t0)
	.word	0xfe8500e4	! t0_data_exp_shm_area+0x18 (t0)
	.word	0x9e60ff54	! t0_data_exp_shm_area+0x1c (t0)
	.word	0x2ab57144	! t0_data_exp_shm_area+0x20 (t0)
	.word	0x71bdbba3	! t0_data_exp_shm_area+0x24 (t0)
	.word	0xb3c69c4f	! t0_data_exp_shm_area+0x28 (t0)
	.word	0x81f3ee3b	! t0_data_exp_shm_area+0x2c (t0)
	.word	0x71af50ad	! t0_data_exp_shm_area+0x30 (t0)
	.word	0xce0faeaf	! t0_data_exp_shm_area+0x34 (t0)
	.word	0x4ee89174	! t0_data_exp_shm_area+0x38 (t0)
	.word	0xc7ac6a3e	! t0_data_exp_shm_area+0x3c (t0)
	.word	0xf9feb779	! t0_data_exp_shm_area+0x40 (t0 bload)
	.word	0x6571c2d1	! t0_data_exp_shm_area+0x44
	.word	0xd1312797	! t0_data_exp_shm_area+0x48
	.word	0xc6dd2bb9	! t0_data_exp_shm_area+0x4c
	.word	0xf2bf06c3	! t0_data_exp_shm_area+0x50
	.word	0xa94e914e	! t0_data_exp_shm_area+0x54
	.word	0xc7f1b5e5	! t0_data_exp_shm_area+0x58
	.word	0x986140d4	! t0_data_exp_shm_area+0x5c
	.word	0x62ac42ce	! t0_data_exp_shm_area+0x60
	.word	0x5a6e0854	! t0_data_exp_shm_area+0x64
	.word	0x10f630c7	! t0_data_exp_shm_area+0x68
	.word	0x1484b24d	! t0_data_exp_shm_area+0x6c
	.word	0x24e95281	! t0_data_exp_shm_area+0x70
	.word	0x5d50a762	! t0_data_exp_shm_area+0x74
	.word	0xa1cfb87a	! t0_data_exp_shm_area+0x78
	.word	0x724c307a	! t0_data_exp_shm_area+0x7c
	.word	0x17a64213	! t0_data_exp_shm_area+0x80 (t0 bstore)
	.word	0x8cd79de7	! t0_data_exp_shm_area+0x84
	.word	0xbc20fcdf	! t0_data_exp_shm_area+0x88
	.word	0x0d1c0c8e	! t0_data_exp_shm_area+0x8c
	.word	0x0adb7d02	! t0_data_exp_shm_area+0x90
	.word	0x9afdb029	! t0_data_exp_shm_area+0x94
	.word	0x742c8a8f	! t0_data_exp_shm_area+0x98
	.word	0xeeff021a	! t0_data_exp_shm_area+0x9c
	.word	0x772a3348	! t0_data_exp_shm_area+0xa0
	.word	0xed3f0668	! t0_data_exp_shm_area+0xa4
	.word	0xfa525532	! t0_data_exp_shm_area+0xa8
	.word	0x42d194d7	! t0_data_exp_shm_area+0xac
	.word	0x79415dd1	! t0_data_exp_shm_area+0xb0
	.word	0x1b8c4a42	! t0_data_exp_shm_area+0xb4
	.word	0xe52b1311	! t0_data_exp_shm_area+0xb8
	.word	0x3a9f06a2	! t0_data_exp_shm_area+0xbc
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
#define T0_KAOS_SEED          d1e9d0832304
#define T0_KAOS_ICOUNT        2513
#define T0_KAOS_AREAS         1
#define T0_KAOS_AREASIZE      64
#define T0_KAOS_AREAOFFSET    4480
#define T0_KAOS_PAGESIZE      8192
#define T0_KAOS_CODECOUNT     2519

#define T0_KAOS_BOOT_VA                  0x13278000
#define T0_KAOS_BOOT_PA                  0x0000000001616000
#define T0_KAOS_BOOT_CACHEABLE           1
#define T0_KAOS_BOOT_NONCACHEABLE        0

#define T0_KAOS_STARTUP_VA               0x2f836000
#define T0_KAOS_STARTUP_PA               0x000000000357e000
#define T0_KAOS_STARTUP_CACHEABLE        1
#define T0_KAOS_STARTUP_NONCACHEABLE     0

#define T0_KAOS_OFFSET_TBL_VA            0x0fd12000
#define T0_KAOS_OFFSET_TBL_PA            0x0000000004096000
#define T0_KAOS_OFFSET_TBL_CACHEABLE     1
#define T0_KAOS_OFFSET_TBL_NONCACHEABLE  0

#define T0_KAOS_DONE_VA                  0x42a94000
#define T0_KAOS_DONE_PA                  0x0000000006fd4000
#define T0_KAOS_DONE_CACHEABLE           1
#define T0_KAOS_DONE_NONCACHEABLE        0

#define T0_KAOS_KTBL_VA                  0x482b4000
#define T0_KAOS_KTBL_PA                  0x0000000009174000
#define T0_KAOS_KTBL_CACHEABLE           1
#define T0_KAOS_KTBL_NONCACHEABLE        0

#define T0_KAOS_SUBR0_VA                 0x47ea0000
#define T0_KAOS_SUBR0_PA                 0x000000000b40a000
#define T0_KAOS_SUBR0_CACHEABLE          1
#define T0_KAOS_SUBR0_NONCACHEABLE       0
#define T0_KAOS_SUBR1_VA                 0x486e6000
#define T0_KAOS_SUBR1_PA                 0x000000000db8e000
#define T0_KAOS_SUBR1_CACHEABLE          1
#define T0_KAOS_SUBR1_NONCACHEABLE       0
#define T0_KAOS_SUBR2_VA                 0x47b72000
#define T0_KAOS_SUBR2_PA                 0x000000000e546000
#define T0_KAOS_SUBR2_CACHEABLE          1
#define T0_KAOS_SUBR2_NONCACHEABLE       0
#define T0_KAOS_SUBR3_VA                 0x6836a000
#define T0_KAOS_SUBR3_PA                 0x0000000010282000
#define T0_KAOS_SUBR3_CACHEABLE          1
#define T0_KAOS_SUBR3_NONCACHEABLE       0

#define T0_KAOS_EXP_REGS_VA              0x19056000
#define T0_KAOS_EXP_REGS_PA              0x0000000012b1c000
#define T0_KAOS_EXP_REGS_CACHEABLE       1
#define T0_KAOS_EXP_REGS_NONCACHEABLE    0
#define T0_KAOS_RUN_REGS_VA              0x373e0000
#define T0_KAOS_RUN_REGS_PA              0x0000000014284000
#define T0_KAOS_RUN_REGS_CACHEABLE       1
#define T0_KAOS_RUN_REGS_NONCACHEABLE    0

#define T0_KAOS_EXP_STACK_VA             0x69904000
#define T0_KAOS_EXP_STACK_PA             0x0000000016186000
#define T0_KAOS_EXP_STACK_CACHEABLE      1
#define T0_KAOS_EXP_STACK_NONCACHEABLE   0
#define T0_KAOS_RUN_STACK_VA             0x4d03c000
#define T0_KAOS_RUN_STACK_PA             0x0000000018b60000
#define T0_KAOS_RUN_STACK_CACHEABLE      1
#define T0_KAOS_RUN_STACK_NONCACHEABLE   0

#define T0_KAOS_AREA0
#define T0_KAOS_EXP_AREA0_VA             0x0d056000
#define T0_KAOS_EXP_AREA0_PA             0x000000001bd04000
#define T0_KAOS_EXP_AREA0_CACHEABLE      1
#define T0_KAOS_EXP_AREA0_NONCACHEABLE   0
#define T0_KAOS_RUN_AREA0_VA             0x15606000
#define T0_KAOS_RUN_AREA0_PA             0x000000001d8ee000
#define T0_KAOS_RUN_AREA0_CACHEABLE      1
#define T0_KAOS_RUN_AREA0_NONCACHEABLE   0

#define T0_KAOS_SHM_AREA
#define T0_KAOS_EXP_SHM_AREA_VA          0x0835e000
#define T0_KAOS_EXP_SHM_AREA_PA          0x0000000000dc2000
#define T0_KAOS_EXP_SHM_AREA_CACHEABLE   1
#define T0_KAOS_EXP_SHM_AREA_NONCACHEABLE 0
#define T0_KAOS_RUN_SHM_AREA_VA          0x553fc000
#define T0_KAOS_RUN_SHM_AREA_PA          0x0000000001736000
#define T0_KAOS_RUN_SHM_AREA_CACHEABLE   1
#define T0_KAOS_RUN_SHM_AREA_NONCACHEABLE 0

#define T0_KAOS_RANVAL_00     0xb02a1627
#define T0_KAOS_RANVAL_01     0x1f87b659
#define T0_KAOS_RANVAL_02     0xcdc53de8
#define T0_KAOS_RANVAL_03     0xffc929c7
#define T0_KAOS_RANVAL_04     0x13d5356e
#define T0_KAOS_RANVAL_05     0x0c90fc32
#define T0_KAOS_RANVAL_06     0x0370cd00
#define T0_KAOS_RANVAL_07     0x2c649381
#define T0_KAOS_RANVAL_08     0x806f6e97
#define T0_KAOS_RANVAL_09     0x320f2460
#define T0_KAOS_RANVAL_0a     0x5dc3fc7d
#define T0_KAOS_RANVAL_0b     0x1bc6f2c1
#define T0_KAOS_RANVAL_0c     0xd9a057d0
#define T0_KAOS_RANVAL_0d     0x0eb5cce1
#define T0_KAOS_RANVAL_0e     0x4354b5f4
#define T0_KAOS_RANVAL_0f     0x1bdd8f2e
#define T0_KAOS_RANVAL_10     0x522c173a
#define T0_KAOS_RANVAL_11     0x5f7569c7
#define T0_KAOS_RANVAL_12     0xaf476e40
#define T0_KAOS_RANVAL_13     0x7dbe346d
#define T0_KAOS_RANVAL_14     0x87b6a6de
#define T0_KAOS_RANVAL_15     0x9d9c6c1a
#define T0_KAOS_RANVAL_16     0x408d8c96
#define T0_KAOS_RANVAL_17     0x82450da1
#define T0_KAOS_RANVAL_18     0xeae2e3e0
#define T0_KAOS_RANVAL_19     0x57a972fc
#define T0_KAOS_RANVAL_1a     0x68baaed5
#define T0_KAOS_RANVAL_1b     0xbbb63535
#define T0_KAOS_RANVAL_1c     0xf8f6dcf5
#define T0_KAOS_RANVAL_1d     0x45aceb0e
#define T0_KAOS_RANVAL_1e     0x76f95f22
#define T0_KAOS_RANVAL_1f     0x4f81fcd8
#define T0_KAOS_RANVAL_20     0x70d21412
#define T0_KAOS_RANVAL_21     0xbf1ac012
#define T0_KAOS_RANVAL_22     0x231d0eb4
#define T0_KAOS_RANVAL_23     0x67b731c9
#define T0_KAOS_RANVAL_24     0x3099a765
#define T0_KAOS_RANVAL_25     0x22d304d2
#define T0_KAOS_RANVAL_26     0x1e5869eb
#define T0_KAOS_RANVAL_27     0x7a9ee154
#define T0_KAOS_RANVAL_28     0x47499588
#define T0_KAOS_RANVAL_29     0xcd32b53f
#define T0_KAOS_RANVAL_2a     0x17fc59a7
#define T0_KAOS_RANVAL_2b     0xfcb1619b
#define T0_KAOS_RANVAL_2c     0xec9990f4
#define T0_KAOS_RANVAL_2d     0xc16bf6dc
#define T0_KAOS_RANVAL_2e     0x361545d7
#define T0_KAOS_RANVAL_2f     0xbdcca299
#define T0_KAOS_RANVAL_30     0x259716b3
#define T0_KAOS_RANVAL_31     0x35777b5c
#define T0_KAOS_RANVAL_32     0xb1016d50
#define T0_KAOS_RANVAL_33     0x0a900b64
#define T0_KAOS_RANVAL_34     0x743dbc59
#define T0_KAOS_RANVAL_35     0xa0e6e98a
#define T0_KAOS_RANVAL_36     0x977466df
#define T0_KAOS_RANVAL_37     0x9e4267b1
#define T0_KAOS_RANVAL_38     0xd771e934
#define T0_KAOS_RANVAL_39     0xd0fa7068
#define T0_KAOS_RANVAL_3a     0x9b091fa1
#define T0_KAOS_RANVAL_3b     0x34eaa99d
#define T0_KAOS_RANVAL_3c     0xd6516ec2
#define T0_KAOS_RANVAL_3d     0x45d9e89b
#define T0_KAOS_RANVAL_3e     0x95c4ea91
#define T0_KAOS_RANVAL_3f     0xd88c83aa
#define T0_KAOS_RANVAL_40     0x4910b463
#define T0_KAOS_RANVAL_41     0xcff42805
#define T0_KAOS_RANVAL_42     0x84037562
#define T0_KAOS_RANVAL_43     0xd4061f07
#define T0_KAOS_RANVAL_44     0xf1d26a4f
#define T0_KAOS_RANVAL_45     0xff8d6bb3
#define T0_KAOS_RANVAL_46     0x4d6cb68e
#define T0_KAOS_RANVAL_47     0x0a1c7213
#define T0_KAOS_RANVAL_48     0xdc52f7c9
#define T0_KAOS_RANVAL_49     0x95affbfa
#define T0_KAOS_RANVAL_4a     0x981328ae
#define T0_KAOS_RANVAL_4b     0x8c17fb24
#define T0_KAOS_RANVAL_4c     0x73201894
#define T0_KAOS_RANVAL_4d     0x43406edc
#define T0_KAOS_RANVAL_4e     0x43e9e70c
#define T0_KAOS_RANVAL_4f     0xf92be383
#define T0_KAOS_RANVAL_50     0x87a85da6
#define T0_KAOS_RANVAL_51     0xc3292caf
#define T0_KAOS_RANVAL_52     0x27a77f76
#define T0_KAOS_RANVAL_53     0xfafdcebb
#define T0_KAOS_RANVAL_54     0x66f5851b
#define T0_KAOS_RANVAL_55     0xc5a71b00
#define T0_KAOS_RANVAL_56     0x64238d54
#define T0_KAOS_RANVAL_57     0x2c44da13
#define T0_KAOS_RANVAL_58     0xea9fdd6c
#define T0_KAOS_RANVAL_59     0x5efb91b4
#define T0_KAOS_RANVAL_5a     0x9d8a71fc
#define T0_KAOS_RANVAL_5b     0xb0da9058
#define T0_KAOS_RANVAL_5c     0x23b827e0
#define T0_KAOS_RANVAL_5d     0x4965fe70
#define T0_KAOS_RANVAL_5e     0xb3a3be45
#define T0_KAOS_RANVAL_5f     0x9b00d5df
#define T0_KAOS_RANVAL_60     0x5748ae41
#define T0_KAOS_RANVAL_61     0x7b89da3a
#define T0_KAOS_RANVAL_62     0x111d215a
#define T0_KAOS_RANVAL_63     0x044c10c9
#define T0_KAOS_RANVAL_64     0x10e57fd3
#define T0_KAOS_RANVAL_65     0x6f8bd560
#define T0_KAOS_RANVAL_66     0x5694f0d0
#define T0_KAOS_RANVAL_67     0x21d11188
#define T0_KAOS_RANVAL_68     0xcacf0981
#define T0_KAOS_RANVAL_69     0x367b5d98
#define T0_KAOS_RANVAL_6a     0x4e3c9df9
#define T0_KAOS_RANVAL_6b     0xf72a7fa2
#define T0_KAOS_RANVAL_6c     0x43a97d59
#define T0_KAOS_RANVAL_6d     0xb54be268
#define T0_KAOS_RANVAL_6e     0x999cac7a
#define T0_KAOS_RANVAL_6f     0x0ae1ceb4
#define T0_KAOS_RANVAL_70     0xf2febd3a
#define T0_KAOS_RANVAL_71     0x6ef37bc7
#define T0_KAOS_RANVAL_72     0x2188fe1a
#define T0_KAOS_RANVAL_73     0x4d03ffba
#define T0_KAOS_RANVAL_74     0xfee7bccc
#define T0_KAOS_RANVAL_75     0x307ad704
#define T0_KAOS_RANVAL_76     0xc1ed87dd
#define T0_KAOS_RANVAL_77     0x6e6ab28d
#define T0_KAOS_RANVAL_78     0xa9958eaf
#define T0_KAOS_RANVAL_79     0x1a248de7
#define T0_KAOS_RANVAL_7a     0x1508c451
#define T0_KAOS_RANVAL_7b     0x28c64bac
#define T0_KAOS_RANVAL_7c     0xe44190f6
#define T0_KAOS_RANVAL_7d     0x8a904c15
#define T0_KAOS_RANVAL_7e     0x552a7726
#define T0_KAOS_RANVAL_7f     0x64fe323e
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
!    icount         2513
!    targetid       NIAGARA:SIM
!    hostid         NIAGARA:5.8
!    areas          1
!    areasize       64
!    areaoffset     4480
!    ncache         0
!    emulate_ncache 1
!    pagesize       8192
!    invsize        0
!    codecount      2519
!    code           482b4000
!    entry          482b4000
!    fsr_exceptions 00000000
!    fsr_roundmode  00000004
!    fsr_mask       c0000fff
!    seed           d1e9d0832304
!    va_map         0000000000400000,000000007fffffff
!    pa_cached      0000000000400000,000000007fffffff
!    pa_noncached   000001ff00000000,000001ff7fffffff
!    weights        /import/n2-aus-localdir1/ntran/n2cdmspp/verif/diag/assembly/kaos/weights_files/allv9.w
!    begcount       0
!    endcount       2513
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

KTEXT_MODULE(t0_module_ktbl, 0x482b4000)
.seg "text"
	KGLOBAL(t0_ktbl)
t0_ktbl_page_begin:
.global t0_kref; t0_kref:
	.skip 0
t0_ktbl:
	.word	0xb1a54d24	! t0_kref+0x0:   	fsmuld	%f21, %f4, %f24
	.word	0x8fa0c924	! t0_kref+0x4:   	fmuls	%f3, %f4, %f7
	.word	0xc93e2010	! t0_kref+0x8:   	std	%f4, [%i0 + 0x10]
	.word	0x9de3bfa0	! t0_kref+0xc:   	save	%sp, -0x60, %sp
	.word	0x80a67465	! t0_kref+0x10:   	cmp	%i1, -0xb9b
	.word	0xadef61c2	! t0_kref+0x14:   	restore	%i5, 0x1c2, %l6
	.word	0xaaad0014	! t0_kref+0x18:   	andncc	%l4, %l4, %l5
	.word	0xaa32b5dd	! t0_kref+0x1c:   	orn	%o2, -0xa23, %l5
	.word	0xac728015	! t0_kref+0x20:   	udiv	%o2, %l5, %l6
	.word	0xaf22f51d	! t0_kref+0x24:   	mulscc	%o3, -0xae3, %l7
	.word	0x91a0012d	! t0_kref+0x28:   	fabss	%f13, %f8
	.word	0xaafd6c1d	! t0_kref+0x2c:   	sdivcc	%l5, 0xc1d, %l5
	.word	0xea167fee	! t0_kref+0x30:   	lduh	[%i1 - 0x12], %l5
	.word	0x8da188b5	! t0_kref+0x34:   	fsubs	%f6, %f21, %f6
	.word	0xec166016	! t0_kref+0x38:   	lduh	[%i1 + 0x16], %l6
	.word	0x001fffff	! t0_kref+0x3c:   	illtrap	0x1fffff
	.word	0x2a480005	! t0_kref+0x40:   	bcs,a,pt	%icc, _kref+0x54
	.word	0xec064000	! t0_kref+0x44:   	ld	[%i1], %l6
	.word	0xdb06401c	! t0_kref+0x48:   	ld	[%i1 + %i4], %f13
	.word	0xe968a00f	! t0_kref+0x4c:   	prefetch	%g2 + 0xf, 20
	.word	0x81dc8004	! t0_kref+0x50:   	flush	%l2 + %g4
	.word	0xa8d74015	! t0_kref+0x54:   	umulcc	%i5, %l5, %l4
	.word	0x28480005	! t0_kref+0x58:   	bleu,a,pt	%icc, _kref+0x6c
	.word	0xac768017	! t0_kref+0x5c:   	udiv	%i2, %l7, %l6
	.word	0xa85f4000	! t0_kref+0x60:   	smul	%i5, %g0, %l4
	.word	0x81dd3b6f	! t0_kref+0x64:   	flush	%l4 - 0x491
	.word	0xaeb5f2e1	! t0_kref+0x68:   	orncc	%l7, -0xd1f, %l7
	.word	0xf53f4018	! t0_kref+0x6c:   	std	%f26, [%i5 + %i0]
	.word	0xa60d8000	! t0_kref+0x70:   	and	%l6, %g0, %l3
	.word	0x8da54d3a	! t0_kref+0x74:   	fsmuld	%f21, %f26, %f6
	.word	0xe656c018	! t0_kref+0x78:   	ldsh	[%i3 + %i0], %l3
	.word	0xec562018	! t0_kref+0x7c:   	ldsh	[%i0 + 0x18], %l6
	.word	0x91a3084c	! t0_kref+0x80:   	faddd	%f12, %f12, %f8
	.word	0xac50001c	! t0_kref+0x84:   	umul	%g0, %i4, %l6
	.word	0xaf3f200c	! t0_kref+0x88:   	sra	%i4, 0xc, %l7
	.word	0x34480001	! t0_kref+0x8c:   	bg,a,pt	%icc, _kref+0x90
	.word	0xee564000	! t0_kref+0x90:   	ldsh	[%i1], %l7
	.word	0x86102021	! t0_kref+0x94:   	mov	0x21, %g3
	.word	0x86a0e001	! t0_kref+0x98:   	subcc	%g3, 1, %g3
	.word	0x22800004	! t0_kref+0x9c:   	be,a	_kref+0xac
	.word	0xea00a020	! t0_kref+0xa0:   	ld	[%g2 + 0x20], %l5
	.word	0x907321d3	! t0_kref+0xa4:   	udiv	%o4, 0x1d3, %o0
	.word	0x907f001c	! t0_kref+0xa8:   	sdiv	%i4, %i4, %o0
	.word	0xe46e4000	! t0_kref+0xac:   	ldstub	[%i1], %l2
	.word	0x8185c000	! t0_kref+0xb0:   	wr	%l7, %g0, %y
	.word	0xecd61000	! t0_kref+0xb4:   	ldsha	[%i0]0x80, %l6
	.word	0x8fa00136	! t0_kref+0xb8:   	fabss	%f22, %f7
	.word	0x912b4016	! t0_kref+0xbc:   	sll	%o5, %l6, %o0
	.word	0xe9b81018	! t0_kref+0xc0:   	stda	%f20, [%g0 + %i0]0x80
	.word	0xa9a28d3b	! t0_kref+0xc4:   	fsmuld	%f10, %f27, %f20
	.word	0xe600a02c	! t0_kref+0xc8:   	ld	[%g2 + 0x2c], %l3
	.word	0xf007bfe0	! t0_kref+0xcc:   	ld	[%fp - 0x20], %i0
	.word	0xd010a00e	! t0_kref+0xd0:   	lduh	[%g2 + 0xe], %o0
	.word	0x9072400c	! t0_kref+0xd4:   	udiv	%o1, %o4, %o0
	.word	0x89a0012c	! t0_kref+0xd8:   	fabss	%f12, %f4
	.word	0xa6c58009	! t0_kref+0xdc:   	addccc	%l6, %o1, %l3
	.word	0xd13f4018	! t0_kref+0xe0:   	std	%f8, [%i5 + %i0]
	.word	0xec28a014	! t0_kref+0xe4:   	stb	%l6, [%g2 + 0x14]
	.word	0x86102003	! t0_kref+0xe8:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0xec:   	bne,a	_kref+0xec
	.word	0x86a0e001	! t0_kref+0xf0:   	subcc	%g3, 1, %g3
	.word	0xb7a01885	! t0_kref+0xf4:   	fitos	%f5, %f27
	.word	0xa5a01897	! t0_kref+0xf8:   	fitos	%f23, %f18
	.word	0xec562016	! t0_kref+0xfc:   	ldsh	[%i0 + 0x16], %l6
	.word	0xaac5ec21	! t0_kref+0x100:   	addccc	%l7, 0xc21, %l5
	.word	0xaf418000	! t0_kref+0x104:   	mov	%fprs, %l7
	.word	0x91a00142	! t0_kref+0x108:   	fabsd	%f2, %f8
	.word	0x9fc10000	! t0_kref+0x10c:   	call	%g4
	.word	0xecd81019	! t0_kref+0x110:   	ldxa	[%g0 + %i1]0x80, %l6
	.word	0x24800008	! t0_kref+0x114:   	ble,a	_kref+0x134
	.word	0xacde800a	! t0_kref+0x118:   	smulcc	%i2, %o2, %l6
	.word	0xaf2b600d	! t0_kref+0x11c:   	sll	%o5, 0xd, %l7
	.word	0xad400000	! t0_kref+0x120:   	mov	%y, %l6
	.word	0x909f000a	! t0_kref+0x124:   	xorcc	%i4, %o2, %o0
	.word	0x89a01a35	! t0_kref+0x128:   	fstoi	%f21, %f4
	.word	0x91a00154	! t0_kref+0x12c:   	fabsd	%f20, %f8
	.word	0xa7400000	! t0_kref+0x130:   	mov	%y, %l3
	.word	0x81acca3a	! t0_kref+0x134:   	fcmps	%fcc0, %f19, %f26
	.word	0xdd3e4000	! t0_kref+0x138:   	std	%f14, [%i1]
	.word	0xd0567ff6	! t0_kref+0x13c:   	ldsh	[%i1 - 0xa], %o0
	.word	0x90b3401a	! t0_kref+0x140:   	orncc	%o5, %i2, %o0
	.word	0x26800002	! t0_kref+0x144:   	bl,a	_kref+0x14c
	.word	0xedee501a	! t0_kref+0x148:   	prefetcha	%i1 + %i2, 22
	.word	0xf3ee101d	! t0_kref+0x14c:   	prefetcha	%i0 + %i5, 25
	.word	0x24480002	! t0_kref+0x150:   	ble,a,pt	%icc, _kref+0x158
	.word	0xecf81018	! t0_kref+0x154:   	swapa	[%g0 + %i0]0x80, %l6
	.word	0xac7dc000	! t0_kref+0x158:   	sdiv	%l7, %g0, %l6
	.word	0xaaa2f596	! t0_kref+0x15c:   	subcc	%o3, -0xa6a, %l5
	.word	0xe800a024	! t0_kref+0x160:   	ld	[%g2 + 0x24], %l4
	.word	0x3b800001	! t0_kref+0x164:   	fble,a	_kref+0x168
	.word	0xe64e0000	! t0_kref+0x168:   	ldsb	[%i0], %l3
	.word	0xea16001b	! t0_kref+0x16c:   	lduh	[%i0 + %i3], %l5
	.word	0xaa768016	! t0_kref+0x170:   	udiv	%i2, %l6, %l5
	.word	0x91400000	! t0_kref+0x174:   	mov	%y, %o0
	.word	0xa70ec000	! t0_kref+0x178:   	tsubcc	%i3, %g0, %l3
	.word	0xa70b0017	! t0_kref+0x17c:   	tsubcc	%o4, %l7, %l3
	.word	0xa7400000	! t0_kref+0x180:   	mov	%y, %l3
	.word	0xa85d6234	! t0_kref+0x184:   	smul	%l5, 0x234, %l4
	.word	0xacda801d	! t0_kref+0x188:   	smulcc	%o2, %i5, %l6
	.word	0xaeb82dc7	! t0_kref+0x18c:   	xnorcc	%g0, 0xdc7, %l7
	.word	0xc9067ff8	! t0_kref+0x190:   	ld	[%i1 - 8], %f4
	.word	0x9fc00004	! t0_kref+0x194:   	call	%g0 + %g4
	.word	0xd43e001d	! t0_kref+0x198:   	std	%o2, [%i0 + %i5]
	.word	0x81d97fd9	! t0_kref+0x19c:   	flush	%g5 - 0x27
	.word	0xa81af5a8	! t0_kref+0x1a0:   	xor	%o3, -0xa58, %l4
	.word	0xa730200d	! t0_kref+0x1a4:   	srl	%g0, 0xd, %l3
	.word	0xaa9d4008	! t0_kref+0x1a8:   	xorcc	%l5, %o0, %l5
	.word	0x81820000	! t0_kref+0x1ac:   	wr	%o0, %g0, %y
	.word	0xab2f401c	! t0_kref+0x1b0:   	sll	%i5, %i4, %l5
	.word	0x91354009	! t0_kref+0x1b4:   	srl	%l5, %o1, %o0
	.word	0xa1a00133	! t0_kref+0x1b8:   	fabss	%f19, %f16
	.word	0x8daa0026	! t0_kref+0x1bc:   	fmovsa	%fcc0, %f6, %f6
	.word	0xd700a030	! t0_kref+0x1c0:   	ld	[%g2 + 0x30], %f11
	.word	0xd43e7fe8	! t0_kref+0x1c4:   	std	%o2, [%i1 - 0x18]
	.word	0xaa976cfc	! t0_kref+0x1c8:   	orcc	%i5, 0xcfc, %l5
	.word	0x81ae8a29	! t0_kref+0x1cc:   	fcmps	%fcc0, %f26, %f9
	.word	0xe4086200	! t0_kref+0x1d0:   	ldub	[%g1 + 0x200], %l2
	.word	0xa41ca00c	! t0_kref+0x1d4:   	xor	%l2, 0xc, %l2
	.word	0xe4286200	! t0_kref+0x1d8:   	stb	%l2, [%g1 + 0x200]
	.word	0x81d86200	! t0_kref+0x1dc:   	flush	%g1 + 0x200
	.word	0x9fc00004	! t0_kref+0x1e0:   	call	%g0 + %g4
	.word	0xd04e7fec	! t0_kref+0x1e4:   	ldsb	[%i1 - 0x14], %o0
	.word	0xaefb0017	! t0_kref+0x1e8:   	sdivcc	%o4, %l7, %l7
	.word	0xa68d000c	! t0_kref+0x1ec:   	andcc	%l4, %o4, %l3
	.word	0xad1ebb4d	! t0_kref+0x1f0:   	tsubcctv	%i2, -0x4b3, %l6
	.word	0xc700a030	! t0_kref+0x1f4:   	ld	[%g2 + 0x30], %f3
	.word	0xae55000d	! t0_kref+0x1f8:   	umul	%l4, %o5, %l7
	.word	0x90c5c000	! t0_kref+0x1fc:   	addccc	%l7, %g0, %o0
2:	.word	0xe60e001a	! t0_kref+0x200:   	ldub	[%i0 + %i2], %l3
	.word	0xad3da017	! t0_kref+0x204:   	sra	%l6, 0x17, %l6
	.word	0xefee101b	! t0_kref+0x208:   	prefetcha	%i0 + %i3, 23
	.word	0x2d480002	! t0_kref+0x20c:   	fbg,a,pt	%fcc0, _kref+0x214
	.word	0xc10f0005	! t0_kref+0x210:   	ld	[%i4 + %g5], %fsr
	.word	0x81ae8a48	! t0_kref+0x214:   	fcmpd	%fcc0, %f26, %f8
	.word	0xe64e4000	! t0_kref+0x218:   	ldsb	[%i1], %l3
	.word	0xb9a20838	! t0_kref+0x21c:   	fadds	%f8, %f24, %f28
	.word	0xd6263ff0	! t0_kref+0x220:   	st	%o3, [%i0 - 0x10]
	.word	0x858262bd	! t0_kref+0x224:   	wr	%o1, 0x2bd, %ccr
	.word	0xaf02ae8c	! t0_kref+0x228:   	taddcc	%o2, 0xe8c, %l7
	.word	0xc12e7fe8	! t0_kref+0x22c:   	st	%fsr, [%i1 - 0x18]
	.word	0x81ae0a2b	! t0_kref+0x230:   	fcmps	%fcc0, %f24, %f11
	.word	0xaba2092a	! t0_kref+0x234:   	fmuls	%f8, %f10, %f21
	.word	0x905b36b5	! t0_kref+0x238:   	smul	%o4, -0x94b, %o0
	.word	0xc36e0000	! t0_kref+0x23c:   	prefetch	%i0, 1
	.word	0xb5a34937	! t0_kref+0x240:   	fmuls	%f13, %f23, %f26
	.word	0xada80046	! t0_kref+0x244:   	fmovdn	%fcc0, %f6, %f22
	.word	0xe1e6500a	! t0_kref+0x248:   	casa	[%i1]0x80, %o2, %l0
	.word	0xa9400000	! t0_kref+0x24c:   	mov	%y, %l4
	.word	0xc168a000	! t0_kref+0x250:   	prefetch	%g2, 0
	.word	0xa63a801a	! t0_kref+0x254:   	xnor	%o2, %i2, %l3
	.word	0xad703305	! t0_kref+0x258:   	popc	-0xcfb, %l6
	.word	0x9ba0188d	! t0_kref+0x25c:   	fitos	%f13, %f13
	.word	0x81df7a45	! t0_kref+0x260:   	flush	%i5 - 0x5bb
	.word	0xaed24017	! t0_kref+0x264:   	umulcc	%o1, %l7, %l7
	.word	0x95a509ce	! t0_kref+0x268:   	fdivd	%f20, %f14, %f10
	.word	0xd828a03a	! t0_kref+0x26c:   	stb	%o4, [%g2 + 0x3a]
	.word	0xd13e6000	! t0_kref+0x270:   	std	%f8, [%i1]
	.word	0xa8aec00c	! t0_kref+0x274:   	andncc	%i3, %o4, %l4
	.word	0xa6da2fef	! t0_kref+0x278:   	smulcc	%o0, 0xfef, %l3
	call	1f
	.empty
	.word	0xa9a00535	! t0_kref+0x280:   	fsqrts	%f21, %f20
1:	.word	0x81acca2f	! t0_kref+0x284:   	fcmps	%fcc0, %f19, %f15
	.word	0xab3d6014	! t0_kref+0x288:   	sra	%l5, 0x14, %l5
	.word	0xe5267fe0	! t0_kref+0x28c:   	st	%f18, [%i1 - 0x20]
	.word	0xab400000	! t0_kref+0x290:   	mov	%y, %l5
	.word	0xec560000	! t0_kref+0x294:   	ldsh	[%i0], %l6
	.word	0xaaaee491	! t0_kref+0x298:   	andncc	%i3, 0x491, %l5
	.word	0xaaad401d	! t0_kref+0x29c:   	andncc	%l5, %i5, %l5
	call	1f
	.empty
	.word	0x11005fc7	! t0_kref+0x2a4:   	sethi	%hi(0x17f1c00), %o0
	.word	0xcf00a034	! t0_kref+0x2a8:   	ld	[%g2 + 0x34], %f7
	.word	0xd5f65009	! t0_kref+0x2ac:   	casxa	[%i1]0x80, %o1, %o2
	.word	0xb5a60852	! t0_kref+0x2b0:   	faddd	%f24, %f18, %f26
	.word	0x95a40852	! t0_kref+0x2b4:   	faddd	%f16, %f18, %f10
	.word	0xaeaaf96d	! t0_kref+0x2b8:   	andncc	%o3, -0x693, %l7
	.word	0xd906201c	! t0_kref+0x2bc:   	ld	[%i0 + 0x1c], %f12
1:	.word	0x8143c000	! t0_kref+0x2c0:   	stbar
	.word	0xae66b7c3	! t0_kref+0x2c4:   	subc	%i2, -0x83d, %l7
	.word	0x9fa648a7	! t0_kref+0x2c8:   	fsubs	%f25, %f7, %f15
	.word	0xb9a488aa	! t0_kref+0x2cc:   	fsubs	%f18, %f10, %f28
	.word	0xa5a0002b	! t0_kref+0x2d0:   	fmovs	%f11, %f18
	.word	0xa61ec009	! t0_kref+0x2d4:   	xor	%i3, %o1, %l3
	call	SYM(t0_subr0)
	.word	0xaeb5bc2b	! t0_kref+0x2dc:   	orncc	%l6, -0x3d5, %l7
	.word	0xdd270019	! t0_kref+0x2e0:   	st	%f14, [%i4 + %i1]
	.word	0xaee56348	! t0_kref+0x2e4:   	subccc	%l5, 0x348, %l7
	.word	0xacfa3b7d	! t0_kref+0x2e8:   	sdivcc	%o0, -0x483, %l6
	.word	0xd53e7fe8	! t0_kref+0x2ec:   	std	%f10, [%i1 - 0x18]
	.word	0x90024008	! t0_kref+0x2f0:   	add	%o1, %o0, %o0
	.word	0xd1be1a5b	! t0_kref+0x2f4:   	stda	%f8, [%i0 + %i3]0xd2
	.word	0x9fa00527	! t0_kref+0x2f8:   	fsqrts	%f7, %f15
	.word	0x86102001	! t0_kref+0x2fc:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x300:   	bne,a	_kref+0x300
	.word	0x86a0e001	! t0_kref+0x304:   	subcc	%g3, 1, %g3
	.word	0xeb68a08b	! t0_kref+0x308:   	prefetch	%g2 + 0x8b, 21
	.word	0x903ef4a4	! t0_kref+0x30c:   	xnor	%i3, -0xb5c, %o0
	.word	0xaf080008	! t0_kref+0x310:   	tsubcc	%g0, %o0, %l7
	.word	0xf99f1a58	! t0_kref+0x314:   	ldda	[%i4 + %i0]0xd2, %f28
	.word	0xa6f2fc13	! t0_kref+0x318:   	udivcc	%o3, -0x3ed, %l3
	.word	0xa6f68000	! t0_kref+0x31c:   	udivcc	%i2, %g0, %l3
	.word	0x8da14831	! t0_kref+0x320:   	fadds	%f5, %f17, %f6
	.word	0x38800008	! t0_kref+0x324:   	bgu,a	_kref+0x344
	.word	0xea5e7ff0	! t0_kref+0x328:   	ldx	[%i1 - 0x10], %l5
	.word	0xac068014	! t0_kref+0x32c:   	add	%i2, %l4, %l6
	.word	0x9063400b	! t0_kref+0x330:   	subc	%o5, %o3, %o0
	.word	0xf420a00c	! t0_kref+0x334:   	st	%i2, [%g2 + 0xc]
	.word	0xe9262018	! t0_kref+0x338:   	st	%f20, [%i0 + 0x18]
	.word	0xf320a018	! t0_kref+0x33c:   	st	%f25, [%g2 + 0x18]
	.word	0xac02a54d	! t0_kref+0x340:   	add	%o2, 0x54d, %l6
	.word	0x81ad0a52	! t0_kref+0x344:   	fcmpd	%fcc0, %f20, %f18
	.word	0x81db401d	! t0_kref+0x348:   	flush	%o5 + %i5
	.word	0xe1be1a1b	! t0_kref+0x34c:   	stda	%f16, [%i0 + %i3]0xd0
	.word	0xe9be1895	! t0_kref+0x350:   	stda	%f20, [%i0 + %l5]0xc4
	.word	0x9f414000	! t0_kref+0x354:   	mov	%pc, %o7
!	.word	0x2fa2ff28	! t0_kref+0x358:   	fbu,a	SYM(t0_subr2)
	   	fbu,a	SYM(t0_subr2)
	.word	0xea4e3fee	! t0_kref+0x35c:   	ldsb	[%i0 - 0x12], %l5
	.word	0x001fffff	! t0_kref+0x360:   	illtrap	0x1fffff
	.word	0xdd3e0000	! t0_kref+0x364:   	std	%f14, [%i0]
	.word	0xa8df7f32	! t0_kref+0x368:   	smulcc	%i5, -0xce, %l4
	.word	0xee066010	! t0_kref+0x36c:   	ld	[%i1 + 0x10], %l7
	.word	0x907e8000	! t0_kref+0x370:   	sdiv	%i2, %g0, %o0
	.word	0xb3a01899	! t0_kref+0x374:   	fitos	%f25, %f25
	.word	0xe47e6004	! t0_kref+0x378:   	swap	[%i1 + 4], %l2
	.word	0x81ab8aa3	! t0_kref+0x37c:   	fcmpes	%fcc0, %f14, %f3
	.word	0xdf00a03c	! t0_kref+0x380:   	ld	[%g2 + 0x3c], %f15
	.word	0xae434015	! t0_kref+0x384:   	addc	%o5, %l5, %l7
	.word	0xe168a08e	! t0_kref+0x388:   	prefetch	%g2 + 0x8e, 16
	.word	0xaeb24000	! t0_kref+0x38c:   	orncc	%o1, %g0, %l7
	.word	0xa645c015	! t0_kref+0x390:   	addc	%l7, %l5, %l3
	.word	0xe616401b	! t0_kref+0x394:   	lduh	[%i1 + %i3], %l3
	.word	0x93a00537	! t0_kref+0x398:   	fsqrts	%f23, %f9
	.word	0xe850a014	! t0_kref+0x39c:   	ldsh	[%g2 + 0x14], %l4
	.word	0x8da018da	! t0_kref+0x3a0:   	fdtos	%f26, %f6
	.word	0xb9a48854	! t0_kref+0x3a4:   	faddd	%f18, %f20, %f28
	.word	0x9042c01a	! t0_kref+0x3a8:   	addc	%o3, %i2, %o0
	.word	0xa1a68d32	! t0_kref+0x3ac:   	fsmuld	%f26, %f18, %f16
	.word	0xa5a409d4	! t0_kref+0x3b0:   	fdivd	%f16, %f20, %f18
	.word	0xa8456ab8	! t0_kref+0x3b4:   	addc	%l5, 0xab8, %l4
	.word	0x81ae0a25	! t0_kref+0x3b8:   	fcmps	%fcc0, %f24, %f5
	.word	0x8da20d36	! t0_kref+0x3bc:   	fsmuld	%f8, %f22, %f6
	.word	0xa6a83e90	! t0_kref+0x3c0:   	andncc	%g0, -0x170, %l3
	.word	0xa8d54016	! t0_kref+0x3c4:   	umulcc	%l5, %l6, %l4
	.word	0xac323410	! t0_kref+0x3c8:   	orn	%o0, -0xbf0, %l6
	.word	0xa847001b	! t0_kref+0x3cc:   	addc	%i4, %i3, %l4
	.word	0x81a94a2b	! t0_kref+0x3d0:   	fcmps	%fcc0, %f5, %f11
	.word	0xb5a01919	! t0_kref+0x3d4:   	fitod	%f25, %f26
	.word	0xaeaeb34f	! t0_kref+0x3d8:   	andncc	%i2, -0xcb1, %l7
	.word	0xa3a00538	! t0_kref+0x3dc:   	fsqrts	%f24, %f17
	.word	0xf19e1a5c	! t0_kref+0x3e0:   	ldda	[%i0 + %i4]0xd2, %f24
	.word	0xacfd000a	! t0_kref+0x3e4:   	sdivcc	%l4, %o2, %l6
	.word	0xe650a016	! t0_kref+0x3e8:   	ldsh	[%g2 + 0x16], %l3
	.word	0xec060000	! t0_kref+0x3ec:   	ld	[%i0], %l6
	.word	0xad6165d8	! t0_kref+0x3f0:   	movug	%fcc0, -0x228, %l6
	.word	0xaebdc00b	! t0_kref+0x3f4:   	xnorcc	%l7, %o3, %l7
	.word	0x90d6c01d	! t0_kref+0x3f8:   	umulcc	%i3, %i5, %o0
	.word	0xaa7f400b	! t0_kref+0x3fc:   	sdiv	%i5, %o3, %l5
	.word	0xa8fe801a	! t0_kref+0x400:   	sdivcc	%i2, %i2, %l4
	.word	0xa696b9d5	! t0_kref+0x404:   	orcc	%i2, -0x62b, %l3
	.word	0x8610201a	! t0_kref+0x408:   	mov	0x1a, %g3
	.word	0x86a0e001	! t0_kref+0x40c:   	subcc	%g3, 1, %g3
	.word	0x22800002	! t0_kref+0x410:   	be,a	_kref+0x418
	.word	0x95a0191c	! t0_kref+0x414:   	fitod	%f28, %f10
	.word	0xaca00015	! t0_kref+0x418:   	subcc	%g0, %l5, %l6
	.word	0xee20a000	! t0_kref+0x41c:   	st	%l7, [%g2]
	.word	0xa65f705f	! t0_kref+0x420:   	smul	%i5, -0xfa1, %l3
	.word	0xaea57438	! t0_kref+0x424:   	subcc	%l5, -0xbc8, %l7
	.word	0xee00a020	! t0_kref+0x428:   	ld	[%g2 + 0x20], %l7
	.word	0xf6ae9019	! t0_kref+0x42c:   	stba	%i3, [%i2 + %i1]0x80
	.word	0xea10a014	! t0_kref+0x430:   	lduh	[%g2 + 0x14], %l5
	.word	0x90602b99	! t0_kref+0x434:   	subc	%g0, 0xb99, %o0
	.word	0x8ba0052c	! t0_kref+0x438:   	fsqrts	%f12, %f5
	.word	0x85868000	! t0_kref+0x43c:   	wr	%i2, %g0, %ccr
	.word	0xac9f3ce6	! t0_kref+0x440:   	xorcc	%i4, -0x31a, %l6
	.word	0xaba208b3	! t0_kref+0x444:   	fsubs	%f8, %f19, %f21
	.word	0xd706001c	! t0_kref+0x448:   	ld	[%i0 + %i4], %f11
	.word	0x33800007	! t0_kref+0x44c:   	fbe,a	_kref+0x468
	.word	0x910d001b	! t0_kref+0x450:   	tsubcc	%l4, %i3, %o0
	.word	0x90528015	! t0_kref+0x454:   	umul	%o2, %l5, %o0
	.word	0xaebea7ca	! t0_kref+0x458:   	xnorcc	%i2, 0x7ca, %l7
	.word	0xd83e001d	! t0_kref+0x45c:   	std	%o4, [%i0 + %i5]
	.word	0xd9be5894	! t0_kref+0x460:   	stda	%f12, [%i1 + %l4]0xc4
	.word	0xaac5f3d8	! t0_kref+0x464:   	addccc	%l7, -0xc28, %l5
	.word	0xc91fbeb8	! t0_kref+0x468:   	ldd	[%fp - 0x148], %f4
	.word	0xc831401b	! t0_kref+0x46c:   	sth	%g4, [%g5 + %i3]
	.word	0xec86505c	! t0_kref+0x470:   	lda	[%i1 + %i4]0x82, %l6
	.word	0xe830a024	! t0_kref+0x474:   	sth	%l4, [%g2 + 0x24]
	.word	0xae654008	! t0_kref+0x478:   	subc	%l5, %o0, %l7
	.word	0x93a3093a	! t0_kref+0x47c:   	fmuls	%f12, %f26, %f9
	.word	0xdd1fbf50	! t0_kref+0x480:   	ldd	[%fp - 0xb0], %f14
	.word	0xd040a020	! t0_kref+0x484:   	ldsw	[%g2 + 0x20], %o0
	.word	0x878020d0	! t0_kref+0x488:   	mov	0xd0, %asi
	.word	0xaca262c4	! t0_kref+0x48c:   	subcc	%o1, 0x2c4, %l6
	.word	0x36800007	! t0_kref+0x490:   	bge,a	_kref+0x4ac
	.word	0xea4e7fe0	! t0_kref+0x494:   	ldsb	[%i1 - 0x20], %l5
	.word	0xf520a03c	! t0_kref+0x498:   	st	%f26, [%g2 + 0x3c]
	.word	0xedbe101d	! t0_kref+0x49c:   	stda	%f22, [%i0 + %i5]0x80
	.word	0xac7de788	! t0_kref+0x4a0:   	sdiv	%l7, 0x788, %l6
	.word	0xee20a01c	! t0_kref+0x4a4:   	st	%l7, [%g2 + 0x1c]
	.word	0xaad68014	! t0_kref+0x4a8:   	umulcc	%i2, %l4, %l5
	.word	0x28480001	! t0_kref+0x4ac:   	bleu,a,pt	%icc, _kref+0x4b0
	.word	0xa835b984	! t0_kref+0x4b0:   	orn	%l6, -0x67c, %l4
	.word	0xdd3e2018	! t0_kref+0x4b4:   	std	%f14, [%i0 + 0x18]
	.word	0xada01926	! t0_kref+0x4b8:   	fstod	%f6, %f22
	.word	0xac2b400b	! t0_kref+0x4bc:   	andn	%o5, %o3, %l6
	.word	0xafa01887	! t0_kref+0x4c0:   	fitos	%f7, %f23
	.word	0x99ab4056	! t0_kref+0x4c4:   	fmovdle	%fcc0, %f22, %f12
	sethi	%hi(2f), %o7
	.word	0xe40be0dc	! t0_kref+0x4cc:   	ldub	[%o7 + 0xdc], %l2
	.word	0xa41ca00c	! t0_kref+0x4d0:   	xor	%l2, 0xc, %l2
	.word	0xe42be0dc	! t0_kref+0x4d4:   	stb	%l2, [%o7 + 0xdc]
	.word	0x81dbe0dc	! t0_kref+0x4d8:   	flush	%o7 + 0xdc
2:	.word	0xa13a400d	! t0_kref+0x4dc:   	sra	%o1, %o5, %l0
	.word	0xe840a038	! t0_kref+0x4e0:   	ldsw	[%g2 + 0x38], %l4
	.word	0xae35400c	! t0_kref+0x4e4:   	orn	%l5, %o4, %l7
	.word	0x81aa0a2f	! t0_kref+0x4e8:   	fcmps	%fcc0, %f8, %f15
	.word	0xaac5c01c	! t0_kref+0x4ec:   	addccc	%l7, %i4, %l5
	.word	0xd4be1000	! t0_kref+0x4f0:   	stda	%o2, [%i0]0x80
	.word	0xe27e7ff0	! t0_kref+0x4f4:   	swap	[%i1 - 0x10], %l1
	.word	0x906360be	! t0_kref+0x4f8:   	subc	%o5, 0xbe, %o0
	.word	0x90733916	! t0_kref+0x4fc:   	udiv	%o4, -0x6ea, %o0
	.word	0x2b104472	! t0_kref+0x500:   	sethi	%hi(0x4111c800), %l5
	.word	0xa867290f	! t0_kref+0x504:   	subc	%i4, 0x90f, %l4
	.word	0x90ddfb09	! t0_kref+0x508:   	smulcc	%l7, -0x4f7, %o0
	.word	0xada5084e	! t0_kref+0x50c:   	faddd	%f20, %f14, %f22
	.word	0xaba1c9b1	! t0_kref+0x510:   	fdivs	%f7, %f17, %f21
	.word	0xa6e2755e	! t0_kref+0x514:   	subccc	%o1, -0xaa2, %l3
	.word	0xb3a00027	! t0_kref+0x518:   	fmovs	%f7, %f25
	.word	0xaeaaa387	! t0_kref+0x51c:   	andncc	%o2, 0x387, %l7
	.word	0x8585c000	! t0_kref+0x520:   	wr	%l7, %g0, %ccr
	.word	0xe86e2000	! t0_kref+0x524:   	ldstub	[%i0], %l4
	.word	0xa69f68cb	! t0_kref+0x528:   	xorcc	%i5, 0x8cb, %l3
	.word	0xae73400b	! t0_kref+0x52c:   	udiv	%o5, %o3, %l7
	.word	0x8da00124	! t0_kref+0x530:   	fabss	%f4, %f6
	.word	0xd506600c	! t0_kref+0x534:   	ld	[%i1 + 0xc], %f10
	.word	0xea100018	! t0_kref+0x538:   	lduh	[%g0 + %i0], %l5
	.word	0xea270018	! t0_kref+0x53c:   	st	%l5, [%i4 + %i0]
	.word	0xe848a021	! t0_kref+0x540:   	ldsb	[%g2 + 0x21], %l4
	.word	0xea8e5000	! t0_kref+0x544:   	lduba	[%i1]0x80, %l5
	.word	0xea6e001a	! t0_kref+0x548:   	ldstub	[%i0 + %i2], %l5
	.word	0x90580014	! t0_kref+0x54c:   	smul	%g0, %l4, %o0
	.word	0xea48a02b	! t0_kref+0x550:   	ldsb	[%g2 + 0x2b], %l5
	.word	0x9fc10000	! t0_kref+0x554:   	call	%g4
	.word	0xec4e2010	! t0_kref+0x558:   	ldsb	[%i0 + 0x10], %l6
	.word	0x9fc10000	! t0_kref+0x55c:   	call	%g4
	.word	0xee8e9019	! t0_kref+0x560:   	lduba	[%i2 + %i1]0x80, %l7
	.word	0xaea27276	! t0_kref+0x564:   	subcc	%o1, -0xd8a, %l7
	.word	0x91a18946	! t0_kref+0x568:   	fmuld	%f6, %f6, %f8
	.word	0xf300a030	! t0_kref+0x56c:   	ld	[%g2 + 0x30], %f25
	.word	0xf900a01c	! t0_kref+0x570:   	ld	[%g2 + 0x1c], %f28
	.word	0x9de3bfa0	! t0_kref+0x574:   	save	%sp, -0x60, %sp
	.word	0xb2bee933	! t0_kref+0x578:   	xnorcc	%i3, 0x933, %i1
	.word	0x91ef2095	! t0_kref+0x57c:   	restore	%i4, 0x95, %o0
	.word	0x91a00046	! t0_kref+0x580:   	fmovd	%f6, %f8
	.word	0xd05e4000	! t0_kref+0x584:   	ldx	[%i1], %o0
	.word	0xe850a006	! t0_kref+0x588:   	ldsh	[%g2 + 6], %l4
	.word	0xdbf6501c	! t0_kref+0x58c:   	casxa	[%i1]0x80, %i4, %o5
	.word	0xaa5820ac	! t0_kref+0x590:   	smul	%g0, 0xac, %l5
	.word	0xf500a018	! t0_kref+0x594:   	ld	[%g2 + 0x18], %f26
	.word	0xb1a389c4	! t0_kref+0x598:   	fdivd	%f14, %f4, %f24
	.word	0xacb2e533	! t0_kref+0x59c:   	orncc	%o3, 0x533, %l6
	.word	0xf830a016	! t0_kref+0x5a0:   	sth	%i4, [%g2 + 0x16]
	.word	0x905a33cf	! t0_kref+0x5a4:   	smul	%o0, -0xc31, %o0
	.word	0xab26a1e3	! t0_kref+0x5a8:   	mulscc	%i2, 0x1e3, %l5
	.word	0xe6080018	! t0_kref+0x5ac:   	ldub	[%g0 + %i0], %l3
	.word	0x9fc10000	! t0_kref+0x5b0:   	call	%g4
	.word	0xeb68a087	! t0_kref+0x5b4:   	prefetch	%g2 + 0x87, 21
	.word	0xe3f6501b	! t0_kref+0x5b8:   	casxa	[%i1]0x80, %i3, %l1
	.word	0xab320015	! t0_kref+0x5bc:   	srl	%o0, %l5, %l5
	.word	0x2b357cf2	! t0_kref+0x5c0:   	sethi	%hi(0xd5f3c800), %l5
	.word	0x3a800002	! t0_kref+0x5c4:   	bcc,a	_kref+0x5cc
	.word	0xa642fcda	! t0_kref+0x5c8:   	addc	%o3, -0x326, %l3
	.word	0xd056200e	! t0_kref+0x5cc:   	ldsh	[%i0 + 0xe], %o0
	.word	0xd9be588a	! t0_kref+0x5d0:   	stda	%f12, [%i1 + %o2]0xc4
	.word	0xa895ec81	! t0_kref+0x5d4:   	orcc	%l7, 0xc81, %l4
	.word	0xdd20a008	! t0_kref+0x5d8:   	st	%f14, [%g2 + 8]
	.word	0xeb68a081	! t0_kref+0x5dc:   	prefetch	%g2 + 0x81, 21
	.word	0x9fc00004	! t0_kref+0x5e0:   	call	%g0 + %g4
	.word	0xa85dc017	! t0_kref+0x5e4:   	smul	%l7, %l7, %l4
	.word	0xdb000018	! t0_kref+0x5e8:   	ld	[%g0 + %i0], %f13
	.word	0x24480001	! t0_kref+0x5ec:   	ble,a,pt	%icc, _kref+0x5f0
	.word	0xae06c01c	! t0_kref+0x5f0:   	add	%i3, %i4, %l7
	.word	0x8d87401a	! t0_kref+0x5f4:   	wr	%i5, %i2, %fprs
	.word	0x85874009	! t0_kref+0x5f8:   	wr	%i5, %o1, %ccr
	.word	0x9de3bfa0	! t0_kref+0x5fc:   	save	%sp, -0x60, %sp
	.word	0x91ef401d	! t0_kref+0x600:   	restore	%i5, %i5, %o0
	.word	0xec16600a	! t0_kref+0x604:   	lduh	[%i1 + 0xa], %l6
	.word	0x8fa509ac	! t0_kref+0x608:   	fdivs	%f20, %f12, %f7
	.word	0x9de3bfa0	! t0_kref+0x60c:   	save	%sp, -0x60, %sp
	.word	0xabeea17a	! t0_kref+0x610:   	restore	%i2, 0x17a, %l5
	.word	0x29480003	! t0_kref+0x614:   	fbl,a,pt	%fcc0, _kref+0x620
	.word	0x11007fa9	! t0_kref+0x618:   	sethi	%hi(0x1fea400), %o0
	.word	0xb9a409a9	! t0_kref+0x61c:   	fdivs	%f16, %f9, %f28
	.word	0xed68a005	! t0_kref+0x620:   	prefetch	%g2 + 5, 22
	.word	0x86102003	! t0_kref+0x624:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x628:   	bne,a	_kref+0x628
	.word	0x86a0e001	! t0_kref+0x62c:   	subcc	%g3, 1, %g3
	.word	0xa612f611	! t0_kref+0x630:   	or	%o3, -0x9ef, %l3
	.word	0xec4e2003	! t0_kref+0x634:   	ldsb	[%i0 + 3], %l6
	.word	0xaf40c000	! t0_kref+0x638:   	mov	%asi, %l7
	.word	0xa8fd7da4	! t0_kref+0x63c:   	sdivcc	%l5, -0x25c, %l4
	call	1f
	.empty
	.word	0xac2d801d	! t0_kref+0x644:   	andn	%l6, %i5, %l6
	.word	0x93a5c82b	! t0_kref+0x648:   	fadds	%f23, %f11, %f9
	.word	0xc020a028	! t0_kref+0x64c:   	clr	[%g2 + 0x28]
	.word	0xee08a005	! t0_kref+0x650:   	ldub	[%g2 + 5], %l7
	.word	0xe80e7ff9	! t0_kref+0x654:   	ldub	[%i1 - 7], %l4
	.word	0xacdd4015	! t0_kref+0x658:   	smulcc	%l5, %l5, %l6
	.word	0xb1a6c8b3	! t0_kref+0x65c:   	fsubs	%f27, %f19, %f24
	.word	0xa9a1094e	! t0_kref+0x660:   	fmuld	%f4, %f14, %f20
1:	.word	0x8143e040	! t0_kref+0x664:   	membar	0x40
	.word	0x87a0052d	! t0_kref+0x668:   	fsqrts	%f13, %f3
	.word	0xafa00133	! t0_kref+0x66c:   	fabss	%f19, %f23
	.word	0x30800002	! t0_kref+0x670:   	ba,a	_kref+0x678
	.word	0xd0166018	! t0_kref+0x674:   	lduh	[%i1 + 0x18], %o0
	.word	0xd8f81019	! t0_kref+0x678:   	swapa	[%g0 + %i1]0x80, %o4
	.word	0xd7200018	! t0_kref+0x67c:   	st	%f11, [%g0 + %i0]
	.word	0xd2a81018	! t0_kref+0x680:   	stba	%o1, [%g0 + %i0]0x80
	.word	0x2d800001	! t0_kref+0x684:   	fbg,a	_kref+0x688
	.word	0x9096b2a8	! t0_kref+0x688:   	orcc	%i2, -0xd58, %o0
	.word	0xb1a0012c	! t0_kref+0x68c:   	fabss	%f12, %f24
	.word	0xa896800b	! t0_kref+0x690:   	orcc	%i2, %o3, %l4
	.word	0x90b5400a	! t0_kref+0x694:   	orncc	%l5, %o2, %o0
	.word	0xec4e001a	! t0_kref+0x698:   	ldsb	[%i0 + %i2], %l6
	.word	0xa730201c	! t0_kref+0x69c:   	srl	%g0, 0x1c, %l3
	.word	0x90df0008	! t0_kref+0x6a0:   	smulcc	%i4, %o0, %o0
	.word	0x90e20000	! t0_kref+0x6a4:   	subccc	%o0, %g0, %o0
	.word	0xe9be1889	! t0_kref+0x6a8:   	stda	%f20, [%i0 + %o1]0xc4
	.word	0xa6be800d	! t0_kref+0x6ac:   	xnorcc	%i2, %o5, %l3
	.word	0x3e480002	! t0_kref+0x6b0:   	bvc,a,pt	%icc, _kref+0x6b8
	.word	0x95a189c2	! t0_kref+0x6b4:   	fdivd	%f6, %f2, %f10
	.word	0xa5a01908	! t0_kref+0x6b8:   	fitod	%f8, %f18
	.word	0xf500a028	! t0_kref+0x6bc:   	ld	[%g2 + 0x28], %f26
	.word	0x900ee555	! t0_kref+0x6c0:   	and	%i3, 0x555, %o0
	.word	0x81a9ca32	! t0_kref+0x6c4:   	fcmps	%fcc0, %f7, %f18
	.word	0x83c066d0	! t0_kref+0x6c8:   	jmpl	%g1 + 0x6d0, %g1
	.word	0xa83721f4	! t0_kref+0x6cc:   	orn	%i4, 0x1f4, %l4
	.word	0xb1a48d32	! t0_kref+0x6d0:   	fsmuld	%f18, %f18, %f24
	.word	0xa8a56e33	! t0_kref+0x6d4:   	subcc	%l5, 0xe33, %l4
	.word	0xb7a01a52	! t0_kref+0x6d8:   	fdtoi	%f18, %f27
	.word	0xacaac014	! t0_kref+0x6dc:   	andncc	%o3, %l4, %l6
	.word	0xa9a018c4	! t0_kref+0x6e0:   	fdtos	%f4, %f20
	.word	0x8fa01887	! t0_kref+0x6e4:   	fitos	%f7, %f7
	.word	0x81db8008	! t0_kref+0x6e8:   	flush	%sp + %o0
	.word	0x113f1b0b	! t0_kref+0x6ec:   	sethi	%hi(0xfc6c2c00), %o0
	.word	0xaf1a800a	! t0_kref+0x6f0:   	tsubcctv	%o2, %o2, %l7
	.word	0xa65f4000	! t0_kref+0x6f4:   	smul	%i5, %g0, %l3
	.word	0x878020f0	! t0_kref+0x6f8:   	mov	0xf0, %asi
	.word	0xb5a28939	! t0_kref+0x6fc:   	fmuls	%f10, %f25, %f26
	.word	0x2728e046	! t0_kref+0x700:   	sethi	%hi(0xa3811800), %l3
	.word	0xaeae8000	! t0_kref+0x704:   	andncc	%i2, %g0, %l7
	.word	0xe8166016	! t0_kref+0x708:   	lduh	[%i1 + 0x16], %l4
	.word	0x2f165a84	! t0_kref+0x70c:   	sethi	%hi(0x596a1000), %l7
	.word	0xac32001d	! t0_kref+0x710:   	orn	%o0, %i5, %l6
	.word	0x9de3bfa0	! t0_kref+0x714:   	save	%sp, -0x60, %sp
	.word	0xb0a6001c	! t0_kref+0x718:   	subcc	%i0, %i4, %i0
	.word	0xa7eea173	! t0_kref+0x71c:   	restore	%i2, 0x173, %l3
	.word	0xe810a00a	! t0_kref+0x720:   	lduh	[%g2 + 0xa], %l4
	.word	0xac9db071	! t0_kref+0x724:   	xorcc	%l6, -0xf8f, %l6
	.word	0xa8968015	! t0_kref+0x728:   	orcc	%i2, %l5, %l4
	.word	0x9ba00537	! t0_kref+0x72c:   	fsqrts	%f23, %f13
	.word	0xe6562004	! t0_kref+0x730:   	ldsh	[%i0 + 4], %l3
	.word	0x81a88ad0	! t0_kref+0x734:   	fcmped	%fcc0, %f2, %f16
	.word	0xe64e001a	! t0_kref+0x738:   	ldsb	[%i0 + %i2], %l3
	.word	0xac0b000d	! t0_kref+0x73c:   	and	%o4, %o5, %l6
	.word	0xaa570016	! t0_kref+0x740:   	umul	%i4, %l6, %l5
	.word	0xa73f201f	! t0_kref+0x744:   	sra	%i4, 0x1f, %l3
	.word	0xf720a024	! t0_kref+0x748:   	st	%f27, [%g2 + 0x24]
	.word	0xa9a089d0	! t0_kref+0x74c:   	fdivd	%f2, %f16, %f20
	.word	0x86102004	! t0_kref+0x750:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x754:   	bne,a	_kref+0x754
	.word	0x86a0e001	! t0_kref+0x758:   	subcc	%g3, 1, %g3
!	.word	0x21a2fe27	! t0_kref+0x75c:   	fbn,a	SYM(t0_subr2)
	   	fbn,a	SYM(t0_subr2)
	.word	0x9f414000	! t0_kref+0x760:   	mov	%pc, %o7
	.word	0xa5a289d2	! t0_kref+0x764:   	fdivd	%f10, %f18, %f18
	.word	0xac454000	! t0_kref+0x768:   	addc	%l5, %g0, %l6
	.word	0x9fc10000	! t0_kref+0x76c:   	call	%g4
	.word	0x90777baf	! t0_kref+0x770:   	udiv	%i5, -0x451, %o0
	.word	0xa85a6547	! t0_kref+0x774:   	smul	%o1, 0x547, %l4
	.word	0xaa0b401a	! t0_kref+0x778:   	and	%o5, %i2, %l5
	.word	0xf820a034	! t0_kref+0x77c:   	st	%i4, [%g2 + 0x34]
	.word	0xff6e001b	! t0_kref+0x780:   	prefetch	%i0 + %i3, 31
	.word	0x2d1c46e2	! t0_kref+0x784:   	sethi	%hi(0x711b8800), %l6
	.word	0xab3de008	! t0_kref+0x788:   	sra	%l7, 0x8, %l5
	.word	0xa6bd65a6	! t0_kref+0x78c:   	xnorcc	%l5, 0x5a6, %l3
	.word	0x99a01895	! t0_kref+0x790:   	fitos	%f21, %f12
	.word	0x86102016	! t0_kref+0x794:   	mov	0x16, %g3
	.word	0x86a0e001	! t0_kref+0x798:   	subcc	%g3, 1, %g3
	.word	0x2280001d	! t0_kref+0x79c:   	be,a	_kref+0x810
	.word	0xee580018	! t0_kref+0x7a0:   	ldx	[%g0 + %i0], %l7
	.word	0xa705c015	! t0_kref+0x7a4:   	taddcc	%l7, %l5, %l3
	.word	0xd828a030	! t0_kref+0x7a8:   	stb	%o4, [%g2 + 0x30]
	.word	0xaea6fab4	! t0_kref+0x7ac:   	subcc	%i3, -0x54c, %l7
	.word	0xd9e6101d	! t0_kref+0x7b0:   	casa	[%i0]0x80, %i5, %o4
	.word	0x2727e160	! t0_kref+0x7b4:   	sethi	%hi(0x9f858000), %l3
	.word	0xe8d81019	! t0_kref+0x7b8:   	ldxa	[%g0 + %i1]0x80, %l4
	.word	0xee40a028	! t0_kref+0x7bc:   	ldsw	[%g2 + 0x28], %l7
	.word	0xf7067fe8	! t0_kref+0x7c0:   	ld	[%i1 - 0x18], %f27
	.word	0xee163fe6	! t0_kref+0x7c4:   	lduh	[%i0 - 0x1a], %l7
	.word	0xdd20a02c	! t0_kref+0x7c8:   	st	%f14, [%g2 + 0x2c]
	.word	0x9f414000	! t0_kref+0x7cc:   	mov	%pc, %o7
	.word	0x99a189ce	! t0_kref+0x7d0:   	fdivd	%f6, %f14, %f12
	.word	0xf630a030	! t0_kref+0x7d4:   	sth	%i3, [%g2 + 0x30]
	.word	0x91a00536	! t0_kref+0x7d8:   	fsqrts	%f22, %f8
	.word	0xa62ac008	! t0_kref+0x7dc:   	andn	%o3, %o0, %l3
	.word	0xa5a409cc	! t0_kref+0x7e0:   	fdivd	%f16, %f12, %f18
	.word	0x87a3c92e	! t0_kref+0x7e4:   	fmuls	%f15, %f14, %f3
	.word	0xc5bf5018	! t0_kref+0x7e8:   	stda	%f2, [%i5 + %i0]0x80
	.word	0xaa2d000a	! t0_kref+0x7ec:   	andn	%l4, %o2, %l5
	.word	0x909f7cb9	! t0_kref+0x7f0:   	xorcc	%i5, -0x347, %o0
	.word	0xeb68a00d	! t0_kref+0x7f4:   	prefetch	%g2 + 0xd, 21
	.word	0xa6a56e1a	! t0_kref+0x7f8:   	subcc	%l5, 0xe1a, %l3
	.word	0xdd3e2008	! t0_kref+0x7fc:   	std	%f14, [%i0 + 8]
	.word	0xd9871018	! t0_kref+0x800:   	lda	[%i4 + %i0]0x80, %f12
	.word	0x97a01a58	! t0_kref+0x804:   	fdtoi	%f24, %f11
	.word	0xad070017	! t0_kref+0x808:   	taddcc	%i4, %l7, %l6
	.word	0x2e800004	! t0_kref+0x80c:   	bvs,a	_kref+0x81c
	.word	0xf420a030	! t0_kref+0x810:   	st	%i2, [%g2 + 0x30]
	.word	0xfb6e2010	! t0_kref+0x814:   	prefetch	%i0 + 0x10, 29
	.word	0x81df8000	! t0_kref+0x818:   	flush	%fp
	.word	0xa1a5894c	! t0_kref+0x81c:   	fmuld	%f22, %f12, %f16
	.word	0xa1a389d8	! t0_kref+0x820:   	fdivd	%f14, %f24, %f16
	.word	0xafa000b8	! t0_kref+0x824:   	fnegs	%f24, %f23
	.word	0xa1a00144	! t0_kref+0x828:   	fabsd	%f4, %f16
	.word	0xb1a609d2	! t0_kref+0x82c:   	fdivd	%f24, %f18, %f24
	.word	0xb5a6c9b0	! t0_kref+0x830:   	fdivs	%f27, %f16, %f26
	.word	0xa1a0190b	! t0_kref+0x834:   	fitod	%f11, %f16
	.word	0x9de3bfa0	! t0_kref+0x838:   	save	%sp, -0x60, %sp
	.word	0xade821b0	! t0_kref+0x83c:   	restore	%g0, 0x1b0, %l6
	.word	0xac32e187	! t0_kref+0x840:   	orn	%o3, 0x187, %l6
	.word	0xaf3d6003	! t0_kref+0x844:   	sra	%l5, 0x3, %l7
	.word	0x9de3bfa0	! t0_kref+0x848:   	save	%sp, -0x60, %sp
	.word	0xade80019	! t0_kref+0x84c:   	restore	%g0, %i1, %l6
	.word	0xb1a309dc	! t0_kref+0x850:   	fdivd	%f12, %f28, %f24
	.word	0xf1bf1a58	! t0_kref+0x854:   	stda	%f24, [%i4 + %i0]0xd2
	.word	0x9055fae7	! t0_kref+0x858:   	umul	%l7, -0x519, %o0
	.word	0xb3a00530	! t0_kref+0x85c:   	fsqrts	%f16, %f25
	.word	0x81ac8a4c	! t0_kref+0x860:   	fcmpd	%fcc0, %f18, %f12
	.word	0xea064000	! t0_kref+0x864:   	ld	[%i1], %l5
	.word	0xe538001d	! t0_kref+0x868:   	std	%f18, [%g0 + %i5]
	.word	0x8143e040	! t0_kref+0x86c:   	membar	0x40
	.word	0x85a01904	! t0_kref+0x870:   	fitod	%f4, %f2
	.word	0xe40861e8	! t0_kref+0x874:   	ldub	[%g1 + 0x1e8], %l2
	.word	0xa41ca00c	! t0_kref+0x878:   	xor	%l2, 0xc, %l2
	.word	0xe42861e8	! t0_kref+0x87c:   	stb	%l2, [%g1 + 0x1e8]
	.word	0x81d861e8	! t0_kref+0x880:   	flush	%g1 + 0x1e8
	.word	0xa70ef11f	! t0_kref+0x884:   	tsubcc	%i3, -0xee1, %l3
	.word	0xd66e3ff2	! t0_kref+0x888:   	ldstub	[%i0 - 0xe], %o3
	.word	0xee480018	! t0_kref+0x88c:   	ldsb	[%g0 + %i0], %l7
	.word	0xec28a018	! t0_kref+0x890:   	stb	%l6, [%g2 + 0x18]
	.word	0xc7ee100b	! t0_kref+0x894:   	prefetcha	%i0 + %o3, 3
	.word	0x902a400d	! t0_kref+0x898:   	andn	%o1, %o5, %o0
	.word	0x34800002	! t0_kref+0x89c:   	bg,a	_kref+0x8a4
	.word	0x8ba01a5a	! t0_kref+0x8a0:   	fdtoi	%f26, %f5
	.word	0xff6e401d	! t0_kref+0x8a4:   	prefetch	%i1 + %i5, 31
	.word	0x81a88a4a	! t0_kref+0x8a8:   	fcmpd	%fcc0, %f2, %f10
	.word	0xee4e401a	! t0_kref+0x8ac:   	ldsb	[%i1 + %i2], %l7
2:	.word	0xd586101c	! t0_kref+0x8b0:   	lda	[%i0 + %i4]0x80, %f10
	.word	0xa8068000	! t0_kref+0x8b4:   	add	%i2, %g0, %l4
	.word	0x91a01913	! t0_kref+0x8b8:   	fitod	%f19, %f8
	.word	0x81580000	! t0_kref+0x8bc:   	flushw
	.word	0xa8376187	! t0_kref+0x8c0:   	orn	%i5, 0x187, %l4
	.word	0xa72261ac	! t0_kref+0x8c4:   	mulscc	%o1, 0x1ac, %l3
	.word	0xa87e800b	! t0_kref+0x8c8:   	sdiv	%i2, %o3, %l4
	.word	0xfa20a000	! t0_kref+0x8cc:   	st	%i5, [%g2]
	.word	0xad3ee01a	! t0_kref+0x8d0:   	sra	%i3, 0x1a, %l6
	.word	0x81850000	! t0_kref+0x8d4:   	wr	%l4, %g0, %y
	.word	0xaaada3a5	! t0_kref+0x8d8:   	andncc	%l6, 0x3a5, %l5
	.word	0x2905b178	! t0_kref+0x8dc:   	sethi	%hi(0x16c5e000), %l4
	.word	0xa8baf64c	! t0_kref+0x8e0:   	xnorcc	%o3, -0x9b4, %l4
	.word	0x86102018	! t0_kref+0x8e4:   	mov	0x18, %g3
	.word	0x86a0e001	! t0_kref+0x8e8:   	subcc	%g3, 1, %g3
	.word	0x22800019	! t0_kref+0x8ec:   	be,a	_kref+0x950
	.word	0xf1beda59	! t0_kref+0x8f0:   	stda	%f24, [%i3 + %i1]0xd2
	.word	0x85828014	! t0_kref+0x8f4:   	wr	%o2, %l4, %ccr
	.word	0xaaf82f4c	! t0_kref+0x8f8:   	sdivcc	%g0, 0xf4c, %l5
	.word	0xea00a02c	! t0_kref+0x8fc:   	ld	[%g2 + 0x2c], %l5
	.word	0xec881018	! t0_kref+0x900:   	lduba	[%g0 + %i0]0x80, %l6
	.word	0xd986501c	! t0_kref+0x904:   	lda	[%i1 + %i4]0x80, %f12
	.word	0x90468014	! t0_kref+0x908:   	addc	%i2, %l4, %o0
	.word	0x81ab0a4a	! t0_kref+0x90c:   	fcmpd	%fcc0, %f12, %f10
	.word	0xa6450016	! t0_kref+0x910:   	addc	%l4, %l6, %l3
	.word	0xf820a020	! t0_kref+0x914:   	st	%i4, [%g2 + 0x20]
	.word	0x90402706	! t0_kref+0x918:   	addc	%g0, 0x706, %o0
	.word	0x354ffff3	! t0_kref+0x91c:   	fbue,a,pt	%fcc0, _kref+0x8e8
	.word	0xac9f000b	! t0_kref+0x920:   	xorcc	%i4, %o3, %l6
	.word	0xa3a14926	! t0_kref+0x924:   	fmuls	%f5, %f6, %f17
	.word	0xb5a00532	! t0_kref+0x928:   	fsqrts	%f18, %f26
	.word	0xaa2f000b	! t0_kref+0x92c:   	andn	%i4, %o3, %l5
	.word	0xacf77bd3	! t0_kref+0x930:   	udivcc	%i5, -0x42d, %l6
	.word	0xe850a03c	! t0_kref+0x934:   	ldsh	[%g2 + 0x3c], %l4
	.word	0xea48a031	! t0_kref+0x938:   	ldsb	[%g2 + 0x31], %l5
	.word	0xd0400018	! t0_kref+0x93c:   	ldsw	[%g0 + %i0], %o0
	.word	0x8586c01c	! t0_kref+0x940:   	wr	%i3, %i4, %ccr
	.word	0xa8723aed	! t0_kref+0x944:   	udiv	%o0, -0x513, %l4
	.word	0x8da48848	! t0_kref+0x948:   	faddd	%f18, %f8, %f6
	.word	0xd01e3ff8	! t0_kref+0x94c:   	ldd	[%i0 - 8], %o0
	.word	0x9de3bfa0	! t0_kref+0x950:   	save	%sp, -0x60, %sp
	.word	0x91eebde5	! t0_kref+0x954:   	restore	%i2, -0x21b, %o0
	.word	0xab400000	! t0_kref+0x958:   	mov	%y, %l5
	.word	0xfb6e7ff0	! t0_kref+0x95c:   	prefetch	%i1 - 0x10, 29
	.word	0xa90b3054	! t0_kref+0x960:   	tsubcc	%o4, -0xfac, %l4
	.word	0xaa98000a	! t0_kref+0x964:   	xorcc	%g0, %o2, %l5
	.word	0xd0d6d019	! t0_kref+0x968:   	ldsha	[%i3 + %i1]0x80, %o0
	.word	0xb1a44d3b	! t0_kref+0x96c:   	fsmuld	%f17, %f27, %f24
	.word	0xd2a01018	! t0_kref+0x970:   	sta	%o1, [%g0 + %i0]0x80
	.word	0x20800007	! t0_kref+0x974:   	bn,a	_kref+0x990
	.word	0xae73401c	! t0_kref+0x978:   	udiv	%o5, %i4, %l7
	.word	0x90da000a	! t0_kref+0x97c:   	smulcc	%o0, %o2, %o0
	.word	0x29383cbb	! t0_kref+0x980:   	sethi	%hi(0xe0f2ec00), %l4
	.word	0xe8100018	! t0_kref+0x984:   	lduh	[%g0 + %i0], %l4
	.word	0xc9be5a1a	! t0_kref+0x988:   	stda	%f4, [%i1 + %i2]0xd0
	.word	0xa92d2005	! t0_kref+0x98c:   	sll	%l4, 0x5, %l4
	.word	0xe7ee501b	! t0_kref+0x990:   	prefetcha	%i1 + %i3, 19
	.word	0xea4e4000	! t0_kref+0x994:   	ldsb	[%i1], %l5
	.word	0x9fa00137	! t0_kref+0x998:   	fabss	%f23, %f15
	.word	0x95a4cd2f	! t0_kref+0x99c:   	fsmuld	%f19, %f15, %f10
	.word	0xaf2a600a	! t0_kref+0x9a0:   	sll	%o1, 0xa, %l7
	.word	0x87a01a27	! t0_kref+0x9a4:   	fstoi	%f7, %f3
	.word	0x9062c00d	! t0_kref+0x9a8:   	subc	%o3, %o5, %o0
	.word	0xa1a58d2d	! t0_kref+0x9ac:   	fsmuld	%f22, %f13, %f16
	.word	0xee16c019	! t0_kref+0x9b0:   	lduh	[%i3 + %i1], %l7
	.word	0xae074017	! t0_kref+0x9b4:   	add	%i5, %l7, %l7
	.word	0xe408632c	! t0_kref+0x9b8:   	ldub	[%g1 + 0x32c], %l2
	.word	0xa41ca00c	! t0_kref+0x9bc:   	xor	%l2, 0xc, %l2
	.word	0xe428632c	! t0_kref+0x9c0:   	stb	%l2, [%g1 + 0x32c]
	.word	0x81d8632c	! t0_kref+0x9c4:   	flush	%g1 + 0x32c
	.word	0xb3a01098	! t0_kref+0x9c8:   	fxtos	%f24, %f25
	.word	0xada018da	! t0_kref+0x9cc:   	fdtos	%f26, %f22
	.word	0x8da6085a	! t0_kref+0x9d0:   	faddd	%f24, %f26, %f6
	.word	0x2721c4f0	! t0_kref+0x9d4:   	sethi	%hi(0x8713c000), %l3
	.word	0xaa8f7f3e	! t0_kref+0x9d8:   	andcc	%i5, -0xc2, %l5
	.word	0xa87d66e1	! t0_kref+0x9dc:   	sdiv	%l5, 0x6e1, %l4
	.word	0xd430a00e	! t0_kref+0x9e0:   	sth	%o2, [%g2 + 0xe]
	.word	0xc9bf5018	! t0_kref+0x9e4:   	stda	%f4, [%i5 + %i0]0x80
	.word	0x8da01908	! t0_kref+0x9e8:   	fitod	%f8, %f6
	.word	0xaa980000	! t0_kref+0x9ec:   	xorcc	%g0, %g0, %l5
	.word	0xc5ee500c	! t0_kref+0x9f0:   	prefetcha	%i1 + %o4, 2
2:	.word	0xe9be5a5b	! t0_kref+0x9f4:   	stda	%f20, [%i1 + %i3]0xd2
	.word	0x89a4085c	! t0_kref+0x9f8:   	faddd	%f16, %f28, %f4
	.word	0x110acafb	! t0_kref+0x9fc:   	sethi	%hi(0x2b2bec00), %o0
	.word	0x8610201b	! t0_kref+0xa00:   	mov	0x1b, %g3
	.word	0x86a0e001	! t0_kref+0xa04:   	subcc	%g3, 1, %g3
	.word	0x22800008	! t0_kref+0xa08:   	be,a	_kref+0xa28
	.word	0xa9400000	! t0_kref+0xa0c:   	mov	%y, %l4
	.word	0xd0567fe4	! t0_kref+0xa10:   	ldsh	[%i1 - 0x1c], %o0
	.word	0xafa01894	! t0_kref+0xa14:   	fitos	%f20, %f23
	.word	0xe7ee101c	! t0_kref+0xa18:   	prefetcha	%i0 + %i4, 19
	.word	0x28480008	! t0_kref+0xa1c:   	bleu,a,pt	%icc, _kref+0xa3c
	.word	0x913d0008	! t0_kref+0xa20:   	sra	%l4, %o0, %o0
	.word	0xe16e401b	! t0_kref+0xa24:   	prefetch	%i1 + %i3, 16
	.word	0xa895e905	! t0_kref+0xa28:   	orcc	%l7, 0x905, %l4
	.word	0xef68a089	! t0_kref+0xa2c:   	prefetch	%g2 + 0x89, 23
	.word	0xa1a20844	! t0_kref+0xa30:   	faddd	%f8, %f4, %f16
	.word	0xd040a01c	! t0_kref+0xa34:   	ldsw	[%g2 + 0x1c], %o0
	.word	0xa72f001d	! t0_kref+0xa38:   	sll	%i4, %i5, %l3
	.word	0xa6768015	! t0_kref+0xa3c:   	udiv	%i2, %l5, %l3
	.word	0x87802082	! t0_kref+0xa40:   	mov	0x82, %asi
	.word	0x2d800006	! t0_kref+0xa44:   	fbg,a	_kref+0xa5c
	.word	0xd120a024	! t0_kref+0xa48:   	st	%f8, [%g2 + 0x24]
	.word	0xac65bdbb	! t0_kref+0xa4c:   	subc	%l6, -0x245, %l6
	.word	0xec881019	! t0_kref+0xa50:   	lduba	[%g0 + %i1]0x80, %l6
	.word	0x23800003	! t0_kref+0xa54:   	fbne,a	_kref+0xa60
	.word	0xee0e3ff6	! t0_kref+0xa58:   	ldub	[%i0 - 0xa], %l7
	.word	0xaf35a01d	! t0_kref+0xa5c:   	srl	%l6, 0x1d, %l7
	.word	0x90b02de5	! t0_kref+0xa60:   	orncc	%g0, 0xde5, %o0
	.word	0xa89b0015	! t0_kref+0xa64:   	xorcc	%o4, %l5, %l4
	.word	0x90f8000c	! t0_kref+0xa68:   	sdivcc	%g0, %o4, %o0
	.word	0x9fa01a56	! t0_kref+0xa6c:   	fdtoi	%f22, %f15
	.word	0x81ae8a58	! t0_kref+0xa70:   	fcmpd	%fcc0, %f26, %f24
	.word	0x99a189d4	! t0_kref+0xa74:   	fdivd	%f6, %f20, %f12
	.word	0xa6c6f6b0	! t0_kref+0xa78:   	addccc	%i3, -0x950, %l3
	.word	0x81580000	! t0_kref+0xa7c:   	flushw
	.word	0xea08a03b	! t0_kref+0xa80:   	ldub	[%g2 + 0x3b], %l5
	.word	0xec50a00e	! t0_kref+0xa84:   	ldsh	[%g2 + 0xe], %l6
	.word	0x2f1e2351	! t0_kref+0xa88:   	sethi	%hi(0x788d4400), %l7
	.word	0xae7d676b	! t0_kref+0xa8c:   	sdiv	%l5, 0x76b, %l7
	.word	0xa8c37033	! t0_kref+0xa90:   	addccc	%o5, -0xfcd, %l4
	.word	0xee460000	! t0_kref+0xa94:   	ldsw	[%i0], %l7
	.word	0xa89def11	! t0_kref+0xa98:   	xorcc	%l7, 0xf11, %l4
	.word	0xac5374d4	! t0_kref+0xa9c:   	umul	%o5, -0xb2c, %l6
	.word	0xc0780019	! t0_kref+0xaa0:   	swap	[%g0 + %i1], %g0
	.word	0x8da01903	! t0_kref+0xaa4:   	fitod	%f3, %f6
	.word	0xaba0052f	! t0_kref+0xaa8:   	fsqrts	%f15, %f21
	.word	0xee30a01c	! t0_kref+0xaac:   	sth	%l7, [%g2 + 0x1c]
	.word	0xa665000d	! t0_kref+0xab0:   	subc	%l4, %o5, %l3
	.word	0x8143c000	! t0_kref+0xab4:   	stbar
	.word	0x81868000	! t0_kref+0xab8:   	wr	%i2, %g0, %y
	.word	0xdaa6501c	! t0_kref+0xabc:   	sta	%o5, [%i1 + %i4]0x80
	.word	0xaa9f401a	! t0_kref+0xac0:   	xorcc	%i5, %i2, %l5
	.word	0x90a57ddf	! t0_kref+0xac4:   	subcc	%l5, -0x221, %o0
	.word	0xa9418000	! t0_kref+0xac8:   	mov	%fprs, %l4
	.word	0xa6da800a	! t0_kref+0xacc:   	smulcc	%o2, %o2, %l3
	.word	0xdbf65017	! t0_kref+0xad0:   	casxa	[%i1]0x80, %l7, %o5
	.word	0x81ad8a54	! t0_kref+0xad4:   	fcmpd	%fcc0, %f22, %f20
	.word	0x90ad0008	! t0_kref+0xad8:   	andncc	%l4, %o0, %o0
	.word	0xcb20a010	! t0_kref+0xadc:   	st	%f5, [%g2 + 0x10]
	.word	0xe648a037	! t0_kref+0xae0:   	ldsb	[%g2 + 0x37], %l3
	.word	0x9fa01a4a	! t0_kref+0xae4:   	fdtoi	%f10, %f15
	.word	0xa8baeb7a	! t0_kref+0xae8:   	xnorcc	%o3, 0xb7a, %l4
	.word	0x2925f601	! t0_kref+0xaec:   	sethi	%hi(0x97d80400), %l4
	.word	0xee28a028	! t0_kref+0xaf0:   	stb	%l7, [%g2 + 0x28]
	.word	0x97a00132	! t0_kref+0xaf4:   	fabss	%f18, %f11
	.word	0xe19eda59	! t0_kref+0xaf8:   	ldda	[%i3 + %i1]0xd2, %f16
	.word	0xae1b0014	! t0_kref+0xafc:   	xor	%o4, %l4, %l7
	.word	0x93a2c93c	! t0_kref+0xb00:   	fmuls	%f11, %f28, %f9
	.word	0xa1a24d36	! t0_kref+0xb04:   	fsmuld	%f9, %f22, %f16
	.word	0xaf3d8014	! t0_kref+0xb08:   	sra	%l6, %l4, %l7
	.word	0x86102002	! t0_kref+0xb0c:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0xb10:   	bne,a	_kref+0xb10
	.word	0x86a0e001	! t0_kref+0xb14:   	subcc	%g3, 1, %g3
	.word	0x81580000	! t0_kref+0xb18:   	flushw
	call	SYM(t0_subr2)
	.word	0x901f7975	! t0_kref+0xb20:   	xor	%i5, -0x68b, %o0
	.word	0xe9be5a5c	! t0_kref+0xb24:   	stda	%f20, [%i1 + %i4]0xd2
	.word	0x81ac8a42	! t0_kref+0xb28:   	fcmpd	%fcc0, %f18, %f2
	.word	0xac1f4016	! t0_kref+0xb2c:   	xor	%i5, %l6, %l6
	.word	0x8182c000	! t0_kref+0xb30:   	wr	%o3, %g0, %y
	.word	0xa60e801a	! t0_kref+0xb34:   	and	%i2, %i2, %l3
	.word	0xb1a01a48	! t0_kref+0xb38:   	fdtoi	%f8, %f24
	.word	0xa5a108ac	! t0_kref+0xb3c:   	fsubs	%f4, %f12, %f18
	.word	0xedbe101d	! t0_kref+0xb40:   	stda	%f22, [%i0 + %i5]0x80
	.word	0xae72c00a	! t0_kref+0xb44:   	udiv	%o3, %o2, %l7
	.word	0xe2680018	! t0_kref+0xb48:   	ldstub	[%g0 + %i0], %l1
	.word	0xe40864b4	! t0_kref+0xb4c:   	ldub	[%g1 + 0x4b4], %l2
	.word	0xa41ca00c	! t0_kref+0xb50:   	xor	%l2, 0xc, %l2
	.word	0xe42864b4	! t0_kref+0xb54:   	stb	%l2, [%g1 + 0x4b4]
	.word	0x81d864b4	! t0_kref+0xb58:   	flush	%g1 + 0x4b4
	.word	0xd43e7fe0	! t0_kref+0xb5c:   	std	%o2, [%i1 - 0x20]
	.word	0xa84562dd	! t0_kref+0xb60:   	addc	%l5, 0x2dd, %l4
	.word	0xe168a049	! t0_kref+0xb64:   	prefetch	%g2 + 0x49, 16
	.word	0xe9f6500c	! t0_kref+0xb68:   	casxa	[%i1]0x80, %o4, %l4
	.word	0x25480002	! t0_kref+0xb6c:   	fblg,a,pt	%fcc0, _kref+0xb74
	.word	0x2b142c25	! t0_kref+0xb70:   	sethi	%hi(0x50b09400), %l5
	.word	0xa6e70016	! t0_kref+0xb74:   	subccc	%i4, %l6, %l3
	.word	0xda6e200d	! t0_kref+0xb78:   	ldstub	[%i0 + 0xd], %o5
2:	.word	0xcd06601c	! t0_kref+0xb7c:   	ld	[%i1 + 0x1c], %f6
	.word	0xb1a00031	! t0_kref+0xb80:   	fmovs	%f17, %f24
	.word	0xa6fd800b	! t0_kref+0xb84:   	sdivcc	%l6, %o3, %l3
	.word	0x8143e040	! t0_kref+0xb88:   	membar	0x40
	.word	0x8143e040	! t0_kref+0xb8c:   	membar	0x40
	.word	0xada54d2c	! t0_kref+0xb90:   	fsmuld	%f21, %f12, %f22
	.word	0xe87e0000	! t0_kref+0xb94:   	swap	[%i0], %l4
	.word	0xe600a00c	! t0_kref+0xb98:   	ld	[%g2 + 0xc], %l3
	.word	0xea48a010	! t0_kref+0xb9c:   	ldsb	[%g2 + 0x10], %l5
	.word	0xb9a01911	! t0_kref+0xba0:   	fitod	%f17, %f28
	.word	0xa89a2fd4	! t0_kref+0xba4:   	xorcc	%o0, 0xfd4, %l4
	.word	0xb3a01a35	! t0_kref+0xba8:   	fstoi	%f21, %f25
	.word	0xec9e5000	! t0_kref+0xbac:   	ldda	[%i1]0x80, %l6
	.word	0x38480003	! t0_kref+0xbb0:   	bgu,a,pt	%icc, _kref+0xbbc
	.word	0x81dbc00b	! t0_kref+0xbb4:   	flush	%o7 + %o3
	.word	0xae95ad8c	! t0_kref+0xbb8:   	orcc	%l6, 0xd8c, %l7
	.word	0x91400000	! t0_kref+0xbbc:   	mov	%y, %o0
	.word	0xa5a01a52	! t0_kref+0xbc0:   	fdtoi	%f18, %f18
	.word	0xae2a4015	! t0_kref+0xbc4:   	andn	%o1, %l5, %l7
	.word	0xae1d801b	! t0_kref+0xbc8:   	xor	%l6, %i3, %l7
	.word	0xd500a014	! t0_kref+0xbcc:   	ld	[%g2 + 0x14], %f10
	.word	0xa740c000	! t0_kref+0xbd0:   	mov	%asi, %l3
	.word	0xc10f0000	! t0_kref+0xbd4:   	ld	[%i4], %fsr
	.word	0xe66e3fec	! t0_kref+0xbd8:   	ldstub	[%i0 - 0x14], %l3
	.word	0xa65df3e3	! t0_kref+0xbdc:   	smul	%l7, -0xc1d, %l3
	.word	0xac88000c	! t0_kref+0xbe0:   	andcc	%g0, %o4, %l6
	.word	0x90dea040	! t0_kref+0xbe4:   	smulcc	%i2, 0x40, %o0
	.word	0xa65360f7	! t0_kref+0xbe8:   	umul	%o5, 0xf7, %l3
	.word	0xac55001c	! t0_kref+0xbec:   	umul	%l4, %i4, %l6
	.word	0xa893630f	! t0_kref+0xbf0:   	orcc	%o5, 0x30f, %l4
	.word	0xee7e6008	! t0_kref+0xbf4:   	swap	[%i1 + 8], %l7
	.word	0xa82b7c90	! t0_kref+0xbf8:   	andn	%o5, -0x370, %l4
	.word	0x2f33acf2	! t0_kref+0xbfc:   	sethi	%hi(0xceb3c800), %l7
	.word	0xd628a037	! t0_kref+0xc00:   	stb	%o3, [%g2 + 0x37]
	.word	0xed3e7fe0	! t0_kref+0xc04:   	std	%f22, [%i1 - 0x20]
	.word	0xeb00a024	! t0_kref+0xc08:   	ld	[%g2 + 0x24], %f21
	.word	0x34800007	! t0_kref+0xc0c:   	bg,a	_kref+0xc28
	.word	0xab068015	! t0_kref+0xc10:   	taddcc	%i2, %l5, %l5
	.word	0x8da01a50	! t0_kref+0xc14:   	fdtoi	%f16, %f6
	.word	0xa672c017	! t0_kref+0xc18:   	udiv	%o3, %l7, %l3
	.word	0xd9be5a1d	! t0_kref+0xc1c:   	stda	%f12, [%i1 + %i5]0xd0
	.word	0xe2680019	! t0_kref+0xc20:   	ldstub	[%g0 + %i1], %l1
	.word	0x91a01910	! t0_kref+0xc24:   	fitod	%f16, %f8
	.word	0x86102013	! t0_kref+0xc28:   	mov	0x13, %g3
	.word	0x86a0e001	! t0_kref+0xc2c:   	subcc	%g3, 1, %g3
	.word	0x22800014	! t0_kref+0xc30:   	be,a	_kref+0xc80
	.word	0x9da0012d	! t0_kref+0xc34:   	fabss	%f13, %f14
	.word	0xa6debc8a	! t0_kref+0xc38:   	smulcc	%i2, -0x376, %l3
	.word	0x8d850000	! t0_kref+0xc3c:   	wr	%l4, %g0, %fprs
	.word	0xb9a0189b	! t0_kref+0xc40:   	fitos	%f27, %f28
	.word	0x29167986	! t0_kref+0xc44:   	sethi	%hi(0x59e61800), %l4
	.word	0x2c480008	! t0_kref+0xc48:   	bneg,a,pt	%icc, _kref+0xc68
	.word	0xada58937	! t0_kref+0xc4c:   	fmuls	%f22, %f23, %f22
	.word	0x001fffff	! t0_kref+0xc50:   	illtrap	0x1fffff
	.word	0xd04e601b	! t0_kref+0xc54:   	ldsb	[%i1 + 0x1b], %o0
	.word	0xac7e8008	! t0_kref+0xc58:   	sdiv	%i2, %o0, %l6
	.word	0x91254015	! t0_kref+0xc5c:   	mulscc	%l5, %l5, %o0
	.word	0xacba3edc	! t0_kref+0xc60:   	xnorcc	%o0, -0x124, %l6
	.word	0x3bbffff2	! t0_kref+0xc64:   	fble,a	_kref+0xc2c
	.word	0xa6434016	! t0_kref+0xc68:   	addc	%o5, %l6, %l3
	.word	0x91400000	! t0_kref+0xc6c:   	mov	%y, %o0
	.word	0xaa426a0b	! t0_kref+0xc70:   	addc	%o1, 0xa0b, %l5
	.word	0x11133601	! t0_kref+0xc74:   	sethi	%hi(0x4cd80400), %o0
	.word	0xcd3e3fe8	! t0_kref+0xc78:   	std	%f6, [%i0 - 0x18]
	.word	0xe26e2018	! t0_kref+0xc7c:   	ldstub	[%i0 + 0x18], %l1
	.word	0xf826001c	! t0_kref+0xc80:   	st	%i4, [%i0 + %i4]
	.word	0xe6160000	! t0_kref+0xc84:   	lduh	[%i0], %l3
	.word	0x8fa01890	! t0_kref+0xc88:   	fitos	%f16, %f7
	.word	0xddb81018	! t0_kref+0xc8c:   	stda	%f14, [%g0 + %i0]0x80
	.word	0xd0060000	! t0_kref+0xc90:   	ld	[%i0], %o0
	.word	0xda6e3ff1	! t0_kref+0xc94:   	ldstub	[%i0 - 0xf], %o5
	.word	0xaa1a0014	! t0_kref+0xc98:   	xor	%o0, %l4, %l5
	.word	0xaaaa000c	! t0_kref+0xc9c:   	andncc	%o0, %o4, %l5
	.word	0xa7a01884	! t0_kref+0xca0:   	fitos	%f4, %f19
	.word	0xc768a041	! t0_kref+0xca4:   	prefetch	%g2 + 0x41, 3
	.word	0x903f6899	! t0_kref+0xca8:   	xnor	%i5, 0x899, %o0
	.word	0x99a489d4	! t0_kref+0xcac:   	fdivd	%f18, %f20, %f12
	.word	0xae534009	! t0_kref+0xcb0:   	umul	%o5, %o1, %l7
	.word	0xd020a018	! t0_kref+0xcb4:   	st	%o0, [%g2 + 0x18]
	.word	0xb5a40939	! t0_kref+0xcb8:   	fmuls	%f16, %f25, %f26
	.word	0xa9a3cd34	! t0_kref+0xcbc:   	fsmuld	%f15, %f20, %f20
	.word	0xa7400000	! t0_kref+0xcc0:   	mov	%y, %l3
	.word	0xae5f361d	! t0_kref+0xcc4:   	smul	%i4, -0x9e3, %l7
	.word	0x81af0a56	! t0_kref+0xcc8:   	fcmpd	%fcc0, %f28, %f22
	.word	0xae37001a	! t0_kref+0xccc:   	orn	%i4, %i2, %l7
	.word	0xaa554016	! t0_kref+0xcd0:   	umul	%l5, %l6, %l5
	.word	0xc51fbe10	! t0_kref+0xcd4:   	ldd	[%fp - 0x1f0], %f2
	.word	0xe56e401d	! t0_kref+0xcd8:   	prefetch	%i1 + %i5, 18
	.word	0xe56e401d	! t0_kref+0xcdc:   	prefetch	%i1 + %i5, 18
	.word	0x878020d0	! t0_kref+0xce0:   	mov	0xd0, %asi
	.word	0xc807bfe8	! t0_kref+0xce4:   	ld	[%fp - 0x18], %g4
	.word	0x81aeca23	! t0_kref+0xce8:   	fcmps	%fcc0, %f27, %f3
	.word	0x86102009	! t0_kref+0xcec:   	mov	0x9, %g3
	.word	0x86a0e001	! t0_kref+0xcf0:   	subcc	%g3, 1, %g3
	.word	0x22800008	! t0_kref+0xcf4:   	be,a	_kref+0xd14
	.word	0xe700a004	! t0_kref+0xcf8:   	ld	[%g2 + 4], %f19
	.word	0xeb68a087	! t0_kref+0xcfc:   	prefetch	%g2 + 0x87, 21
	.word	0xaa0a8014	! t0_kref+0xd00:   	and	%o2, %l4, %l5
	.word	0xeb68a008	! t0_kref+0xd04:   	prefetch	%g2 + 8, 21
	.word	0x81ad8acc	! t0_kref+0xd08:   	fcmped	%fcc0, %f22, %f12
	.word	0xefee501b	! t0_kref+0xd0c:   	prefetcha	%i1 + %i3, 23
	.word	0xa8ba800b	! t0_kref+0xd10:   	xnorcc	%o2, %o3, %l4
	.word	0xacaafa26	! t0_kref+0xd14:   	andncc	%o3, -0x5da, %l6
	.word	0xac06a329	! t0_kref+0xd18:   	add	%i2, 0x329, %l6
	.word	0xe6463ff4	! t0_kref+0xd1c:   	ldsw	[%i0 - 0xc], %l3
	.word	0x81ae8a3c	! t0_kref+0xd20:   	fcmps	%fcc0, %f26, %f28
	.word	0xa6da4016	! t0_kref+0xd24:   	smulcc	%o1, %l6, %l3
	.word	0xaa0a0017	! t0_kref+0xd28:   	and	%o0, %l7, %l5
	.word	0xf43e0000	! t0_kref+0xd2c:   	std	%i2, [%i0]
	.word	0x9095aecc	! t0_kref+0xd30:   	orcc	%l6, 0xecc, %o0
	.word	0xaeba3987	! t0_kref+0xd34:   	xnorcc	%o0, -0x679, %l7
	.word	0xafa6c823	! t0_kref+0xd38:   	fadds	%f27, %f3, %f23
	.word	0x878020e0	! t0_kref+0xd3c:   	mov	0xe0, %asi
	.word	0xd100a030	! t0_kref+0xd40:   	ld	[%g2 + 0x30], %f8
	.word	0xa740c000	! t0_kref+0xd44:   	mov	%asi, %l3
	.word	0x93a00128	! t0_kref+0xd48:   	fabss	%f8, %f9
	.word	0xf4a65000	! t0_kref+0xd4c:   	sta	%i2, [%i1]0x80
	.word	0xd99f5a59	! t0_kref+0xd50:   	ldda	[%i5 + %i1]0xd2, %f12
	.word	0xb7a00533	! t0_kref+0xd54:   	fsqrts	%f19, %f27
	.word	0x90b2001d	! t0_kref+0xd58:   	orncc	%o0, %i5, %o0
	.word	0x9fc00004	! t0_kref+0xd5c:   	call	%g0 + %g4
	.word	0xa9400000	! t0_kref+0xd60:   	mov	%y, %l4
	.word	0xe84e200b	! t0_kref+0xd64:   	ldsb	[%i0 + 0xb], %l4
	.word	0xddbe5000	! t0_kref+0xd68:   	stda	%f14, [%i1]0x80
	.word	0xac7eb48a	! t0_kref+0xd6c:   	sdiv	%i2, -0xb76, %l6
	.word	0x81dd0016	! t0_kref+0xd70:   	flush	%l4 + %l6
	.word	0xaaddc01c	! t0_kref+0xd74:   	smulcc	%l7, %i4, %l5
	.word	0x91a68d39	! t0_kref+0xd78:   	fsmuld	%f26, %f25, %f8
	.word	0xac603779	! t0_kref+0xd7c:   	subc	%g0, -0x887, %l6
	.word	0xe648a003	! t0_kref+0xd80:   	ldsb	[%g2 + 3], %l3
	.word	0x90fec00a	! t0_kref+0xd84:   	sdivcc	%i3, %o2, %o0
	.word	0x81aa8a28	! t0_kref+0xd88:   	fcmps	%fcc0, %f10, %f8
	.word	0x9fc00004	! t0_kref+0xd8c:   	call	%g0 + %g4
	.word	0x81d80014	! t0_kref+0xd90:   	flush	%g0 + %l4
	.word	0xe1beda58	! t0_kref+0xd94:   	stda	%f16, [%i3 + %i0]0xd2
	.word	0x9de3bfa0	! t0_kref+0xd98:   	save	%sp, -0x60, %sp
	.word	0xb8c72226	! t0_kref+0xd9c:   	addccc	%i4, 0x226, %i4
	.word	0xafee4019	! t0_kref+0xda0:   	restore	%i1, %i1, %l7
	.word	0xf13e2000	! t0_kref+0xda4:   	std	%f24, [%i0]
	.word	0xaaa5b39c	! t0_kref+0xda8:   	subcc	%l6, -0xc64, %l5
	.word	0xeea81019	! t0_kref+0xdac:   	stba	%l7, [%g0 + %i1]0x80
	.word	0xcf00a024	! t0_kref+0xdb0:   	ld	[%g2 + 0x24], %f7
	.word	0xa7a01898	! t0_kref+0xdb4:   	fitos	%f24, %f19
	.word	0xa8f832af	! t0_kref+0xdb8:   	sdivcc	%g0, -0xd51, %l4
	.word	0x81a90a5a	! t0_kref+0xdbc:   	fcmpd	%fcc0, %f4, %f26
	.word	0xe616600e	! t0_kref+0xdc0:   	lduh	[%i1 + 0xe], %l3
	.word	0xa93d601c	! t0_kref+0xdc4:   	sra	%l5, 0x1c, %l4
	.word	0xf900a01c	! t0_kref+0xdc8:   	ld	[%g2 + 0x1c], %f28
	.word	0x81ac8a44	! t0_kref+0xdcc:   	fcmpd	%fcc0, %f18, %f4
	.word	0x2a480008	! t0_kref+0xdd0:   	bcs,a,pt	%icc, _kref+0xdf0
	.word	0xe9a01018	! t0_kref+0xdd4:   	sta	%f20, [%g0 + %i0]0x80
	.word	0x93a00529	! t0_kref+0xdd8:   	fsqrts	%f9, %f9
	.word	0x81580000	! t0_kref+0xddc:   	flushw
	.word	0x11007afa	! t0_kref+0xde0:   	sethi	%hi(0x1ebe800), %o0
	.word	0xada40d3c	! t0_kref+0xde4:   	fsmuld	%f16, %f28, %f22
	.word	0x9fc10000	! t0_kref+0xde8:   	call	%g4
	.word	0x8186c000	! t0_kref+0xdec:   	wr	%i3, %g0, %y
	.word	0x9de3bfa0	! t0_kref+0xdf0:   	save	%sp, -0x60, %sp
	.word	0xa7ef6757	! t0_kref+0xdf4:   	restore	%i5, 0x757, %l3
	.word	0xa7a2c930	! t0_kref+0xdf8:   	fmuls	%f11, %f16, %f19
	.word	0xd5e65009	! t0_kref+0xdfc:   	casa	[%i1]0x80, %o1, %o2
	.word	0x2d800008	! t0_kref+0xe00:   	fbg,a	_kref+0xe20
	.word	0xaf3aa01e	! t0_kref+0xe04:   	sra	%o2, 0x1e, %l7
	.word	0xf207bfe0	! t0_kref+0xe08:   	ld	[%fp - 0x20], %i1
	.word	0xaebebe26	! t0_kref+0xe0c:   	xnorcc	%i2, -0x1da, %l7
	.word	0x8da01904	! t0_kref+0xe10:   	fitod	%f4, %f6
	.word	0xa1a5cd3a	! t0_kref+0xe14:   	fsmuld	%f23, %f26, %f16
	.word	0x2c480001	! t0_kref+0xe18:   	bneg,a,pt	%icc, _kref+0xe1c
	.word	0xa872e490	! t0_kref+0xe1c:   	udiv	%o3, 0x490, %l4
	.word	0xa670001b	! t0_kref+0xe20:   	udiv	%g0, %i3, %l3
	.word	0xa737000b	! t0_kref+0xe24:   	srl	%i4, %o3, %l3
	.word	0x86102014	! t0_kref+0xe28:   	mov	0x14, %g3
	.word	0x86a0e001	! t0_kref+0xe2c:   	subcc	%g3, 1, %g3
	.word	0x2280000b	! t0_kref+0xe30:   	be,a	_kref+0xe5c
	.word	0xf36e001d	! t0_kref+0xe34:   	prefetch	%i0 + %i5, 25
	.word	0x81a9ca2c	! t0_kref+0xe38:   	fcmps	%fcc0, %f7, %f12
	.word	0x95a10854	! t0_kref+0xe3c:   	faddd	%f4, %f20, %f10
	.word	0xed68a007	! t0_kref+0xe40:   	prefetch	%g2 + 7, 22
	.word	0xa8dae17a	! t0_kref+0xe44:   	smulcc	%o3, 0x17a, %l4
	.word	0xfaa6501c	! t0_kref+0xe48:   	sta	%i5, [%i1 + %i4]0x80
	.word	0x90402caf	! t0_kref+0xe4c:   	addc	%g0, 0xcaf, %o0
	.word	0xd1f61016	! t0_kref+0xe50:   	casxa	[%i0]0x80, %l6, %o0
	.word	0xaedaf36e	! t0_kref+0xe54:   	smulcc	%o3, -0xc92, %l7
	.word	0xd010a010	! t0_kref+0xe58:   	lduh	[%g2 + 0x10], %o0
	.word	0xae9a8008	! t0_kref+0xe5c:   	xorcc	%o2, %o0, %l7
	.word	0xaee5c008	! t0_kref+0xe60:   	subccc	%l7, %o0, %l7
	.word	0xe840a000	! t0_kref+0xe64:   	ldsw	[%g2], %l4
	.word	0xd9be5a1c	! t0_kref+0xe68:   	stda	%f12, [%i1 + %i4]0xd0
	.word	0x86102003	! t0_kref+0xe6c:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0xe70:   	bne,a	_kref+0xe70
	.word	0x86a0e001	! t0_kref+0xe74:   	subcc	%g3, 1, %g3
	.word	0xee566000	! t0_kref+0xe78:   	ldsh	[%i1], %l7
	.word	0xe8564000	! t0_kref+0xe7c:   	ldsh	[%i1], %l4
	.word	0xe07e6010	! t0_kref+0xe80:   	swap	[%i1 + 0x10], %l0
	.word	0x91a01905	! t0_kref+0xe84:   	fitod	%f5, %f8
	.word	0xae174000	! t0_kref+0xe88:   	or	%i5, %g0, %l7
	.word	0x99a48942	! t0_kref+0xe8c:   	fmuld	%f18, %f2, %f12
	.word	0xeb20a030	! t0_kref+0xe90:   	st	%f21, [%g2 + 0x30]
	.word	0xe5ee501c	! t0_kref+0xe94:   	prefetcha	%i1 + %i4, 18
	.word	0xae9b7d92	! t0_kref+0xe98:   	xorcc	%o5, -0x26e, %l7
	.word	0x8da00039	! t0_kref+0xe9c:   	fmovs	%f25, %f6
	.word	0xd626200c	! t0_kref+0xea0:   	st	%o3, [%i0 + 0xc]
	.word	0x86102002	! t0_kref+0xea4:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0xea8:   	bne,a	_kref+0xea8
	.word	0x86a0e001	! t0_kref+0xeac:   	subcc	%g3, 1, %g3
	.word	0xb1a0191a	! t0_kref+0xeb0:   	fitod	%f26, %f24
	.word	0xa80b400c	! t0_kref+0xeb4:   	and	%o5, %o4, %l4
	.word	0xee162012	! t0_kref+0xeb8:   	lduh	[%i0 + 0x12], %l7
	.word	0xd04e8019	! t0_kref+0xebc:   	ldsb	[%i2 + %i1], %o0
	.word	0x91a01913	! t0_kref+0xec0:   	fitod	%f19, %f8
	.word	0xed6e7fe8	! t0_kref+0xec4:   	prefetch	%i1 - 0x18, 22
	.word	0x89a18854	! t0_kref+0xec8:   	faddd	%f6, %f20, %f4
	.word	0x2b1a7c92	! t0_kref+0xecc:   	sethi	%hi(0x69f24800), %l5
	.word	0x9045e58e	! t0_kref+0xed0:   	addc	%l7, 0x58e, %o0
	.word	0xa6982084	! t0_kref+0xed4:   	xorcc	%g0, 0x84, %l3
	.word	0x2b1fcd51	! t0_kref+0xed8:   	sethi	%hi(0x7f354400), %l5
	.word	0x89a34928	! t0_kref+0xedc:   	fmuls	%f13, %f8, %f4
	.word	0xac234017	! t0_kref+0xee0:   	sub	%o5, %l7, %l6
	.word	0xae43400a	! t0_kref+0xee4:   	addc	%o5, %o2, %l7
	.word	0xe6563fea	! t0_kref+0xee8:   	ldsh	[%i0 - 0x16], %l3
	.word	0xad38201d	! t0_kref+0xeec:   	sra	%g0, 0x1d, %l6
	.word	0xae95aba4	! t0_kref+0xef0:   	orcc	%l6, 0xba4, %l7
	.word	0x90bf4000	! t0_kref+0xef4:   	xnorcc	%i5, %g0, %o0
	.word	0xd08e9019	! t0_kref+0xef8:   	lduba	[%i2 + %i1]0x80, %o0
	.word	0x90d52ee5	! t0_kref+0xefc:   	umulcc	%l4, 0xee5, %o0
	.word	0xa9a10856	! t0_kref+0xf00:   	faddd	%f4, %f22, %f20
	.word	0xac750014	! t0_kref+0xf04:   	udiv	%l4, %l4, %l6
	.word	0xada28d2a	! t0_kref+0xf08:   	fsmuld	%f10, %f10, %f22
	.word	0xaee70016	! t0_kref+0xf0c:   	subccc	%i4, %l6, %l7
	.word	0xae77400c	! t0_kref+0xf10:   	udiv	%i5, %o4, %l7
	.word	0xaa352965	! t0_kref+0xf14:   	orn	%l4, 0x965, %l5
	sethi	%hi(2f), %o7
	.word	0xe40be340	! t0_kref+0xf1c:   	ldub	[%o7 + 0x340], %l2
	.word	0xa41ca00c	! t0_kref+0xf20:   	xor	%l2, 0xc, %l2
	.word	0xe42be340	! t0_kref+0xf24:   	stb	%l2, [%o7 + 0x340]
	.word	0x81dbe340	! t0_kref+0xf28:   	flush	%o7 + 0x340
	.word	0xd008a01b	! t0_kref+0xf2c:   	ldub	[%g2 + 0x1b], %o0
	.word	0xd66e2005	! t0_kref+0xf30:   	ldstub	[%i0 + 5], %o3
	.word	0xa855f9cd	! t0_kref+0xf34:   	umul	%l7, -0x633, %l4
	.word	0xd820a000	! t0_kref+0xf38:   	st	%o4, [%g2]
	.word	0xac96a442	! t0_kref+0xf3c:   	orcc	%i2, 0x442, %l6
2:	.word	0xa67ec014	! t0_kref+0xf40:   	sdiv	%i3, %l4, %l3
	.word	0x2b16b6ca	! t0_kref+0xf44:   	sethi	%hi(0x5adb2800), %l5
	.word	0x91a40d34	! t0_kref+0xf48:   	fsmuld	%f16, %f20, %f8
	.word	0xa875fb12	! t0_kref+0xf4c:   	udiv	%l7, -0x4ee, %l4
	.word	0xa8058000	! t0_kref+0xf50:   	add	%l6, %g0, %l4
	.word	0xd9a61000	! t0_kref+0xf54:   	sta	%f12, [%i0]0x80
	.word	0xec48a007	! t0_kref+0xf58:   	ldsb	[%g2 + 7], %l6
	.word	0xe6d65000	! t0_kref+0xf5c:   	ldsha	[%i1]0x80, %l3
	.word	0x34800003	! t0_kref+0xf60:   	bg,a	_kref+0xf6c
	.word	0xee28a011	! t0_kref+0xf64:   	stb	%l7, [%g2 + 0x11]
	.word	0xa63038d5	! t0_kref+0xf68:   	orn	%g0, -0x72b, %l3
	sethi	%hi(2f), %o7
	.word	0xe40be3b0	! t0_kref+0xf70:   	ldub	[%o7 + 0x3b0], %l2
	.word	0xa41ca00c	! t0_kref+0xf74:   	xor	%l2, 0xc, %l2
	.word	0xe42be3b0	! t0_kref+0xf78:   	stb	%l2, [%o7 + 0x3b0]
	.word	0x81dbe3b0	! t0_kref+0xf7c:   	flush	%o7 + 0x3b0
	.word	0xd300a000	! t0_kref+0xf80:   	ld	[%g2], %f9
	.word	0xe4680018	! t0_kref+0xf84:   	ldstub	[%g0 + %i0], %l2
	.word	0xe84e6013	! t0_kref+0xf88:   	ldsb	[%i1 + 0x13], %l4
	.word	0xb1a3cd29	! t0_kref+0xf8c:   	fsmuld	%f15, %f9, %f24
	.word	0x91a70d36	! t0_kref+0xf90:   	fsmuld	%f28, %f22, %f8
	.word	0xc026201c	! t0_kref+0xf94:   	clr	[%i0 + 0x1c]
	.word	0xed68a08a	! t0_kref+0xf98:   	prefetch	%g2 + 0x8a, 22
	.word	0x81dabb40	! t0_kref+0xf9c:   	flush	%o2 - 0x4c0
	.word	0xaa8dbf5c	! t0_kref+0xfa0:   	andcc	%l6, -0xa4, %l5
	.word	0x23800005	! t0_kref+0xfa4:   	fbne,a	_kref+0xfb8
	.word	0xa3a54824	! t0_kref+0xfa8:   	fadds	%f21, %f4, %f17
	.word	0xd020a004	! t0_kref+0xfac:   	st	%o0, [%g2 + 4]
2:	.word	0xa7a48826	! t0_kref+0xfb0:   	fadds	%f18, %f6, %f19
	.word	0xd09e5000	! t0_kref+0xfb4:   	ldda	[%i1]0x80, %o0
	.word	0xee16001b	! t0_kref+0xfb8:   	lduh	[%i0 + %i3], %l7
	.word	0x9da01892	! t0_kref+0xfbc:   	fitos	%f18, %f14
	.word	0x91400000	! t0_kref+0xfc0:   	mov	%y, %o0
	call	SYM(t0_subr3)
	.word	0xa5a508af	! t0_kref+0xfc8:   	fsubs	%f20, %f15, %f18
	.word	0xb7a248b3	! t0_kref+0xfcc:   	fsubs	%f9, %f19, %f27
	.word	0xac2a001a	! t0_kref+0xfd0:   	andn	%o0, %i2, %l6
	.word	0xec00a020	! t0_kref+0xfd4:   	ld	[%g2 + 0x20], %l6
	.word	0xea560000	! t0_kref+0xfd8:   	ldsh	[%i0], %l5
	.word	0xacaa8017	! t0_kref+0xfdc:   	andncc	%o2, %l7, %l6
	.word	0xaa9d77db	! t0_kref+0xfe0:   	xorcc	%l5, -0x825, %l5
	.word	0xd4380018	! t0_kref+0xfe4:   	std	%o2, [%g0 + %i0]
	.word	0xd13e6008	! t0_kref+0xfe8:   	std	%f8, [%i1 + 8]
	.word	0xaf40c000	! t0_kref+0xfec:   	mov	%asi, %l7
	.word	0x9ba609b8	! t0_kref+0xff0:   	fdivs	%f24, %f24, %f13
	.word	0xd46e401a	! t0_kref+0xff4:   	ldstub	[%i1 + %i2], %o2
	.word	0xec56001b	! t0_kref+0xff8:   	ldsh	[%i0 + %i3], %l6
	.word	0xe36e3fe0	! t0_kref+0xffc:   	prefetch	%i0 - 0x20, 17
	.word	0x9da00056	! t0_kref+0x1000:   	fmovd	%f22, %f14
	.word	0x86102004	! t0_kref+0x1004:   	mov	0x4, %g3
	.word	0x86a0e001	! t0_kref+0x1008:   	subcc	%g3, 1, %g3
	.word	0x2280000e	! t0_kref+0x100c:   	be,a	_kref+0x1044
	.word	0xac1a4014	! t0_kref+0x1010:   	xor	%o1, %l4, %l6
	call	SYM(t0_subr3)
	.word	0xe610a00c	! t0_kref+0x1018:   	lduh	[%g2 + 0xc], %l3
	.word	0xcd1fbd50	! t0_kref+0x101c:   	ldd	[%fp - 0x2b0], %f6
	.word	0x29339a77	! t0_kref+0x1020:   	sethi	%hi(0xce69dc00), %l4
	.word	0xa1a0189b	! t0_kref+0x1024:   	fitos	%f27, %f16
	.word	0x905f401d	! t0_kref+0x1028:   	smul	%i5, %i5, %o0
	.word	0xae55401c	! t0_kref+0x102c:   	umul	%l5, %i4, %l7
	.word	0xad400000	! t0_kref+0x1030:   	mov	%y, %l6
	.word	0xaf3da009	! t0_kref+0x1034:   	sra	%l6, 0x9, %l7
	.word	0x30480005	! t0_kref+0x1038:   	ba,a,pt	%icc, _kref+0x104c
	.word	0xd5f6100d	! t0_kref+0x103c:   	casxa	[%i0]0x80, %o5, %o2
	.word	0x95a58d23	! t0_kref+0x1040:   	fsmuld	%f22, %f3, %f10
	.word	0xd1be101d	! t0_kref+0x1044:   	stda	%f8, [%i0 + %i5]0x80
	.word	0x9fa6092d	! t0_kref+0x1048:   	fmuls	%f24, %f13, %f15
	.word	0x9045ff46	! t0_kref+0x104c:   	addc	%l7, -0xba, %o0
	.word	0x8143c000	! t0_kref+0x1050:   	stbar
	.word	0xe2ee101a	! t0_kref+0x1054:   	ldstuba	[%i0 + %i2]0x80, %l1
	.word	0xe11fbca8	! t0_kref+0x1058:   	ldd	[%fp - 0x358], %f16
	.word	0x9de3bfa0	! t0_kref+0x105c:   	save	%sp, -0x60, %sp
	.word	0xb2070000	! t0_kref+0x1060:   	add	%i4, %g0, %i1
	.word	0xa9ef3fbf	! t0_kref+0x1064:   	restore	%i4, -0x41, %l4
	.word	0x81a9ca2f	! t0_kref+0x1068:   	fcmps	%fcc0, %f7, %f15
	.word	0xa5a98037	! t0_kref+0x106c:   	fmovsg	%fcc0, %f23, %f18
	.word	0xaa5ac00b	! t0_kref+0x1070:   	smul	%o3, %o3, %l5
	.word	0xa9a24d24	! t0_kref+0x1074:   	fsmuld	%f9, %f4, %f20
	.word	0x81824000	! t0_kref+0x1078:   	wr	%o1, %g0, %y
	.word	0xed060000	! t0_kref+0x107c:   	ld	[%i0], %f22
	.word	0xb5a000bc	! t0_kref+0x1080:   	fnegs	%f28, %f26
	.word	0x9de3bfa0	! t0_kref+0x1084:   	save	%sp, -0x60, %sp
	.word	0x91ee001b	! t0_kref+0x1088:   	restore	%i0, %i3, %o0
	.word	0xd2fe5000	! t0_kref+0x108c:   	swapa	[%i1]0x80, %o1
	.word	0x81dc2cdb	! t0_kref+0x1090:   	flush	%l0 + 0xcdb
	.word	0xa93aa00e	! t0_kref+0x1094:   	sra	%o2, 0xe, %l4
	.word	0xe3b8a080	! t0_kref+0x1098:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xac734008	! t0_kref+0x109c:   	udiv	%o5, %o0, %l6
	.word	0x22480008	! t0_kref+0x10a0:   	be,a,pt	%icc, _kref+0x10c0
	.word	0x91700015	! t0_kref+0x10a4:   	popc	%l5, %o0
	.word	0xe686101c	! t0_kref+0x10a8:   	lda	[%i0 + %i4]0x80, %l3
	.word	0x95a00138	! t0_kref+0x10ac:   	fabss	%f24, %f10
	.word	0x81aa0a48	! t0_kref+0x10b0:   	fcmpd	%fcc0, %f8, %f8
	.word	0xda30a00e	! t0_kref+0x10b4:   	sth	%o5, [%g2 + 0xe]
	.word	0xa3a388af	! t0_kref+0x10b8:   	fsubs	%f14, %f15, %f17
	.word	0x81ac0a25	! t0_kref+0x10bc:   	fcmps	%fcc0, %f16, %f5
	.word	0xd008a03c	! t0_kref+0x10c0:   	ldub	[%g2 + 0x3c], %o0
	.word	0x8587401a	! t0_kref+0x10c4:   	wr	%i5, %i2, %ccr
	.word	0x81deab9b	! t0_kref+0x10c8:   	flush	%i2 + 0xb9b
	.word	0x81deb0ea	! t0_kref+0x10cc:   	flush	%i2 - 0xf16
	.word	0xe84e6004	! t0_kref+0x10d0:   	ldsb	[%i1 + 4], %l4
	.word	0xe7ee101c	! t0_kref+0x10d4:   	prefetcha	%i0 + %i4, 19
	.word	0xe64e401a	! t0_kref+0x10d8:   	ldsb	[%i1 + %i2], %l3
	.word	0x9fa4c8a5	! t0_kref+0x10dc:   	fsubs	%f19, %f5, %f15
	.word	0xf620a024	! t0_kref+0x10e0:   	st	%i3, [%g2 + 0x24]
	.word	0xaef5672d	! t0_kref+0x10e4:   	udivcc	%l5, 0x72d, %l7
	.word	0x99aa802e	! t0_kref+0x10e8:   	fmovsue	%fcc0, %f14, %f12
	.word	0x8da00537	! t0_kref+0x10ec:   	fsqrts	%f23, %f6
	.word	0xa7372018	! t0_kref+0x10f0:   	srl	%i4, 0x18, %l3
	.word	0xec10a01c	! t0_kref+0x10f4:   	lduh	[%g2 + 0x1c], %l6
	.word	0x2f05ff1e	! t0_kref+0x10f8:   	sethi	%hi(0x17fc7800), %l7
	.word	0x9de3bfa0	! t0_kref+0x10fc:   	save	%sp, -0x60, %sp
	.word	0xb62f2c07	! t0_kref+0x1100:   	andn	%i4, 0xc07, %i3
	.word	0x91ef382b	! t0_kref+0x1104:   	restore	%i4, -0x7d5, %o0
	.word	0xfb6e2000	! t0_kref+0x1108:   	prefetch	%i0, 29
	.word	0xec480019	! t0_kref+0x110c:   	ldsb	[%g0 + %i1], %l6
	.word	0xa8df6a2c	! t0_kref+0x1110:   	smulcc	%i5, 0xa2c, %l4
	.word	0xa85374a0	! t0_kref+0x1114:   	umul	%o5, -0xb60, %l4
	.word	0xa82d2343	! t0_kref+0x1118:   	andn	%l4, 0x343, %l4
	.word	0xb9a01a56	! t0_kref+0x111c:   	fdtoi	%f22, %f28
	.word	0x89a00524	! t0_kref+0x1120:   	fsqrts	%f4, %f4
	.word	0x86102009	! t0_kref+0x1124:   	mov	0x9, %g3
	.word	0x86a0e001	! t0_kref+0x1128:   	subcc	%g3, 1, %g3
	.word	0x2280000b	! t0_kref+0x112c:   	be,a	_kref+0x1158
	.word	0xd428a034	! t0_kref+0x1130:   	stb	%o2, [%g2 + 0x34]
	.word	0x9fc00004	! t0_kref+0x1134:   	call	%g0 + %g4
	.word	0x91a018d8	! t0_kref+0x1138:   	fdtos	%f24, %f8
	.word	0xa6953ab7	! t0_kref+0x113c:   	orcc	%l4, -0x549, %l3
	.word	0xab40c000	! t0_kref+0x1140:   	mov	%asi, %l5
	.word	0x9da38d2d	! t0_kref+0x1144:   	fsmuld	%f14, %f13, %f14
	.word	0xac52000c	! t0_kref+0x1148:   	umul	%o0, %o4, %l6
	call	SYM(t0_subr2)
	.word	0xec50a03e	! t0_kref+0x1150:   	ldsh	[%g2 + 0x3e], %l6
	.word	0x97a50833	! t0_kref+0x1154:   	fadds	%f20, %f19, %f11
	.word	0xa7000016	! t0_kref+0x1158:   	taddcc	%g0, %l6, %l3
	.word	0xa9418000	! t0_kref+0x115c:   	mov	%fprs, %l4
	.word	0x81dc4013	! t0_kref+0x1160:   	flush	%l1 + %l3
	.word	0xa6aac000	! t0_kref+0x1164:   	andncc	%o3, %g0, %l3
	.word	0x9095001d	! t0_kref+0x1168:   	orcc	%l4, %i5, %o0
	.word	0x2f315097	! t0_kref+0x116c:   	sethi	%hi(0xc5425c00), %l7
	.word	0x35800003	! t0_kref+0x1170:   	fbue,a	_kref+0x117c
	.word	0xc030a034	! t0_kref+0x1174:   	clrh	[%g2 + 0x34]
	.word	0xa3a608b7	! t0_kref+0x1178:   	fsubs	%f24, %f23, %f17
	.word	0xb7a0189a	! t0_kref+0x117c:   	fitos	%f26, %f27
	.word	0x8185c000	! t0_kref+0x1180:   	wr	%l7, %g0, %y
	.word	0xd428a018	! t0_kref+0x1184:   	stb	%o2, [%g2 + 0x18]
	.word	0xe19e1a5b	! t0_kref+0x1188:   	ldda	[%i0 + %i3]0xd2, %f16
	.word	0xad418000	! t0_kref+0x118c:   	mov	%fprs, %l6
	.word	0xb1a0190b	! t0_kref+0x1190:   	fitod	%f11, %f24
	.word	0xeb6e401b	! t0_kref+0x1194:   	prefetch	%i1 + %i3, 21
	.word	0xae0ec009	! t0_kref+0x1198:   	and	%i3, %o1, %l7
	.word	0xdd3e2010	! t0_kref+0x119c:   	std	%f14, [%i0 + 0x10]
	.word	0x81854000	! t0_kref+0x11a0:   	wr	%l5, %g0, %y
	.word	0x90af001d	! t0_kref+0x11a4:   	andncc	%i4, %i5, %o0
	.word	0x99a01917	! t0_kref+0x11a8:   	fitod	%f23, %f12
	.word	0x3e480006	! t0_kref+0x11ac:   	bvc,a,pt	%icc, _kref+0x11c4
	.word	0xa82d3eb9	! t0_kref+0x11b0:   	andn	%l4, -0x147, %l4
	.word	0xae7b400d	! t0_kref+0x11b4:   	sdiv	%o5, %o5, %l7
	.word	0x91a189d8	! t0_kref+0x11b8:   	fdivd	%f6, %f24, %f8
	.word	0xcd00a01c	! t0_kref+0x11bc:   	ld	[%g2 + 0x1c], %f6
	.word	0xad3da016	! t0_kref+0x11c0:   	sra	%l6, 0x16, %l6
	.word	0xa8dea6cc	! t0_kref+0x11c4:   	smulcc	%i2, 0x6cc, %l4
	.word	0x81accaa8	! t0_kref+0x11c8:   	fcmpes	%fcc0, %f19, %f8
	.word	0xa72f600b	! t0_kref+0x11cc:   	sll	%i5, 0xb, %l3
	.word	0xa9a609c6	! t0_kref+0x11d0:   	fdivd	%f24, %f6, %f20
	.word	0xaaad801d	! t0_kref+0x11d4:   	andncc	%l6, %i5, %l5
	.word	0xac127648	! t0_kref+0x11d8:   	or	%o1, -0x9b8, %l6
	.word	0xacc6e939	! t0_kref+0x11dc:   	addccc	%i3, 0x939, %l6
	.word	0x81850000	! t0_kref+0x11e0:   	wr	%l4, %g0, %y
	.word	0x87a01a5a	! t0_kref+0x11e4:   	fdtoi	%f26, %f3
	.word	0xd5000018	! t0_kref+0x11e8:   	ld	[%g0 + %i0], %f10
	.word	0xe1be1848	! t0_kref+0x11ec:   	stda	%f16, [%i0 + %o0]0xc2
	.word	0xe640a008	! t0_kref+0x11f0:   	ldsw	[%g2 + 8], %l3
	.word	0x9de3bfa0	! t0_kref+0x11f4:   	save	%sp, -0x60, %sp
	.word	0xabee0019	! t0_kref+0x11f8:   	restore	%i0, %i1, %l5
	.word	0xaa32400d	! t0_kref+0x11fc:   	orn	%o1, %o5, %l5
	.word	0x9046e202	! t0_kref+0x1200:   	addc	%i3, 0x202, %o0
	.word	0xf19e5a1d	! t0_kref+0x1204:   	ldda	[%i1 + %i5]0xd0, %f24
	.word	0xe3064000	! t0_kref+0x1208:   	ld	[%i1], %f17
	.word	0xd9380019	! t0_kref+0x120c:   	std	%f12, [%g0 + %i1]
	.word	0x86102001	! t0_kref+0x1210:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x1214:   	bne,a	_kref+0x1214
	.word	0x86a0e001	! t0_kref+0x1218:   	subcc	%g3, 1, %g3
	.word	0x9de3bfa0	! t0_kref+0x121c:   	save	%sp, -0x60, %sp
	.word	0xba26e7b3	! t0_kref+0x1220:   	sub	%i3, 0x7b3, %i5
	.word	0xa9eef16e	! t0_kref+0x1224:   	restore	%i3, -0xe92, %l4
	.word	0xada018cc	! t0_kref+0x1228:   	fdtos	%f12, %f22
	.word	0xa6e00000	! t0_kref+0x122c:   	subccc	%g0, %g0, %l3
	.word	0x81ae8a48	! t0_kref+0x1230:   	fcmpd	%fcc0, %f26, %f8
	.word	0xaa76a1b3	! t0_kref+0x1234:   	udiv	%i2, 0x1b3, %l5
	.word	0xa1a01894	! t0_kref+0x1238:   	fitos	%f20, %f16
	.word	0xe168a041	! t0_kref+0x123c:   	prefetch	%g2 + 0x41, 16
	.word	0xa6352c9a	! t0_kref+0x1240:   	orn	%l4, 0xc9a, %l3
	.word	0x9da01910	! t0_kref+0x1244:   	fitod	%f16, %f14
	.word	0xef68a004	! t0_kref+0x1248:   	prefetch	%g2 + 4, 23
	.word	0xa7400000	! t0_kref+0x124c:   	mov	%y, %l3
	.word	0x99a0013a	! t0_kref+0x1250:   	fabss	%f26, %f12
	.word	0xf4380018	! t0_kref+0x1254:   	std	%i2, [%g0 + %i0]
	.word	0xea6e8019	! t0_kref+0x1258:   	ldstub	[%i2 + %i1], %l5
	.word	0x33800002	! t0_kref+0x125c:   	fbe,a	_kref+0x1264
	.word	0xae2f7426	! t0_kref+0x1260:   	andn	%i5, -0xbda, %l7
	.word	0x8da54d29	! t0_kref+0x1264:   	fsmuld	%f21, %f9, %f6
	.word	0x95a01048	! t0_kref+0x1268:   	fdtox	%f8, %f10
	.word	0x81ad8a29	! t0_kref+0x126c:   	fcmps	%fcc0, %f22, %f9
	.word	0x8610201a	! t0_kref+0x1270:   	mov	0x1a, %g3
	.word	0x86a0e001	! t0_kref+0x1274:   	subcc	%g3, 1, %g3
	.word	0x22800014	! t0_kref+0x1278:   	be,a	_kref+0x12c8
	.word	0x9140c000	! t0_kref+0x127c:   	mov	%asi, %o0
	.word	0xa8fb3e7a	! t0_kref+0x1280:   	sdivcc	%o4, -0x186, %l4
	.word	0xa688001b	! t0_kref+0x1284:   	andcc	%g0, %i3, %l3
	.word	0xda30a018	! t0_kref+0x1288:   	sth	%o5, [%g2 + 0x18]
	.word	0x93a01a32	! t0_kref+0x128c:   	fstoi	%f18, %f9
	.word	0x8da01916	! t0_kref+0x1290:   	fitod	%f22, %f6
	.word	0xa6db2006	! t0_kref+0x1294:   	smulcc	%o4, 6, %l3
	.word	0xf36e001c	! t0_kref+0x1298:   	prefetch	%i0 + %i4, 25
	.word	0xc7066000	! t0_kref+0x129c:   	ld	[%i1], %f3
	.word	0xaaaaf662	! t0_kref+0x12a0:   	andncc	%o3, -0x99e, %l5
	.word	0x89a64d30	! t0_kref+0x12a4:   	fsmuld	%f25, %f16, %f4
	.word	0xb1a70848	! t0_kref+0x12a8:   	faddd	%f28, %f8, %f24
	.word	0xe8264000	! t0_kref+0x12ac:   	st	%l4, [%i1]
	.word	0xa8a70017	! t0_kref+0x12b0:   	subcc	%i4, %l7, %l4
	.word	0xa6dd32d4	! t0_kref+0x12b4:   	smulcc	%l4, -0xd2c, %l3
	.word	0x9f414000	! t0_kref+0x12b8:   	mov	%pc, %o7
	.word	0x374fffee	! t0_kref+0x12bc:   	fbge,a,pt	%fcc0, _kref+0x1274
	.word	0x91a01903	! t0_kref+0x12c0:   	fitod	%f3, %f8
	.word	0x28bfffec	! t0_kref+0x12c4:   	bleu,a	_kref+0x1274
	.word	0xf43e3fe8	! t0_kref+0x12c8:   	std	%i2, [%i0 - 0x18]
	.word	0xab400000	! t0_kref+0x12cc:   	mov	%y, %l5
	.word	0xd59e5000	! t0_kref+0x12d0:   	ldda	[%i1]0x80, %f10
	sethi	%hi(2f), %o7
	.word	0xe40be324	! t0_kref+0x12d8:   	ldub	[%o7 + 0x324], %l2
	.word	0xa41ca00c	! t0_kref+0x12dc:   	xor	%l2, 0xc, %l2
	.word	0xe42be324	! t0_kref+0x12e0:   	stb	%l2, [%o7 + 0x324]
	.word	0x81dbe324	! t0_kref+0x12e4:   	flush	%o7 + 0x324
	.word	0xa8956ebb	! t0_kref+0x12e8:   	orcc	%l5, 0xebb, %l4
	.word	0xa5a018ca	! t0_kref+0x12ec:   	fdtos	%f10, %f18
	.word	0xda28a001	! t0_kref+0x12f0:   	stb	%o5, [%g2 + 1]
	.word	0xe8580018	! t0_kref+0x12f4:   	ldx	[%g0 + %i0], %l4
	.word	0xd620a01c	! t0_kref+0x12f8:   	st	%o3, [%g2 + 0x1c]
	.word	0xfa20a018	! t0_kref+0x12fc:   	st	%i5, [%g2 + 0x18]
	.word	0xb5a1085a	! t0_kref+0x1300:   	faddd	%f4, %f26, %f26
	.word	0xacfea907	! t0_kref+0x1304:   	sdivcc	%i2, 0x907, %l6
	.word	0x8ba709b8	! t0_kref+0x1308:   	fdivs	%f28, %f24, %f5
	.word	0xc0ae5000	! t0_kref+0x130c:   	stba	%g0, [%i1]0x80
	.word	0x38480007	! t0_kref+0x1310:   	bgu,a,pt	%icc, _kref+0x132c
	.word	0xaca5c009	! t0_kref+0x1314:   	subcc	%l7, %o1, %l6
	.word	0x91400000	! t0_kref+0x1318:   	mov	%y, %o0
	.word	0xf1bf5a19	! t0_kref+0x131c:   	stda	%f24, [%i5 + %i1]0xd0
	.word	0x22800006	! t0_kref+0x1320:   	be,a	_kref+0x1338
2:	.word	0xda28a00b	! t0_kref+0x1324:   	stb	%o5, [%g2 + 0xb]
	.word	0x9fc00004	! t0_kref+0x1328:   	call	%g0 + %g4
	.word	0x9ba3c8a7	! t0_kref+0x132c:   	fsubs	%f15, %f7, %f13
	.word	0xb3a018d0	! t0_kref+0x1330:   	fdtos	%f16, %f25
	.word	0xaa52ac56	! t0_kref+0x1334:   	umul	%o2, 0xc56, %l5
	.word	0xac62e3d8	! t0_kref+0x1338:   	subc	%o3, 0x3d8, %l6
	.word	0x878020d0	! t0_kref+0x133c:   	mov	0xd0, %asi
	.word	0x87802082	! t0_kref+0x1340:   	mov	0x82, %asi
	.word	0xae73001b	! t0_kref+0x1344:   	udiv	%o4, %i3, %l7
	.word	0x91400000	! t0_kref+0x1348:   	mov	%y, %o0
	.word	0xb5a209ce	! t0_kref+0x134c:   	fdivd	%f8, %f14, %f26
	.word	0xae0d4009	! t0_kref+0x1350:   	and	%l5, %o1, %l7
	.word	0x90ad800b	! t0_kref+0x1354:   	andncc	%l6, %o3, %o0
	.word	0x81830000	! t0_kref+0x1358:   	wr	%o4, %g0, %y
	.word	0x3c480006	! t0_kref+0x135c:   	bpos,a,pt	%icc, _kref+0x1374
	.word	0xf4be5000	! t0_kref+0x1360:   	stda	%i2, [%i1]0x80
	.word	0xe26e0000	! t0_kref+0x1364:   	ldstub	[%i0], %l1
	.word	0xec68a035	! t0_kref+0x1368:   	ldstub	[%g2 + 0x35], %l6
	.word	0x81a90a52	! t0_kref+0x136c:   	fcmpd	%fcc0, %f4, %f18
	.word	0x9daa4046	! t0_kref+0x1370:   	fmovde	%fcc0, %f6, %f14
	.word	0xd91fbd58	! t0_kref+0x1374:   	ldd	[%fp - 0x2a8], %f12
	.word	0xaa8d8000	! t0_kref+0x1378:   	andcc	%l6, %g0, %l5
	.word	0x86102003	! t0_kref+0x137c:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x1380:   	bne,a	_kref+0x1380
	.word	0x86a0e001	! t0_kref+0x1384:   	subcc	%g3, 1, %g3
	.word	0x9da00124	! t0_kref+0x1388:   	fabss	%f4, %f14
	.word	0xeb68a08d	! t0_kref+0x138c:   	prefetch	%g2 + 0x8d, 21
	.word	0xea4e3ffe	! t0_kref+0x1390:   	ldsb	[%i0 - 2], %l5
	.word	0xd0500019	! t0_kref+0x1394:   	ldsh	[%g0 + %i1], %o0
	.word	0xaf70000d	! t0_kref+0x1398:   	popc	%o5, %l7
	.word	0x86102003	! t0_kref+0x139c:   	mov	0x3, %g3
	.word	0x86a0e001	! t0_kref+0x13a0:   	subcc	%g3, 1, %g3
	.word	0x22800006	! t0_kref+0x13a4:   	be,a	_kref+0x13bc
	.word	0xa893000c	! t0_kref+0x13a8:   	orcc	%o4, %o4, %l4
	.word	0xa82a66ef	! t0_kref+0x13ac:   	andn	%o1, 0x6ef, %l4
	.word	0xaa96800a	! t0_kref+0x13b0:   	orcc	%i2, %o2, %l5
	.word	0xa8e02149	! t0_kref+0x13b4:   	subccc	%g0, 0x149, %l4
	.word	0xaac6e458	! t0_kref+0x13b8:   	addccc	%i3, 0x458, %l5
	.word	0x95a689b7	! t0_kref+0x13bc:   	fdivs	%f26, %f23, %f10
	.word	0xaa65c017	! t0_kref+0x13c0:   	subc	%l7, %l7, %l5
	.word	0xa1a688ae	! t0_kref+0x13c4:   	fsubs	%f26, %f14, %f16
	.word	0xac774009	! t0_kref+0x13c8:   	udiv	%i5, %o1, %l6
	.word	0xa740c000	! t0_kref+0x13cc:   	mov	%asi, %l3
	.word	0xed1fbef0	! t0_kref+0x13d0:   	ldd	[%fp - 0x110], %f22
	.word	0xf720a028	! t0_kref+0x13d4:   	st	%f27, [%g2 + 0x28]
	.word	0xa8e5000c	! t0_kref+0x13d8:   	subccc	%l4, %o4, %l4
	.word	0xd4b81018	! t0_kref+0x13dc:   	stda	%o2, [%g0 + %i0]0x80
	.word	0xec50a02e	! t0_kref+0x13e0:   	ldsh	[%g2 + 0x2e], %l6
	.word	0x001fffff	! t0_kref+0x13e4:   	illtrap	0x1fffff
	.word	0xe606001c	! t0_kref+0x13e8:   	ld	[%i0 + %i4], %l3
	.word	0x908f4016	! t0_kref+0x13ec:   	andcc	%i5, %l6, %o0
	.word	0x8ba208af	! t0_kref+0x13f0:   	fsubs	%f8, %f15, %f5
	.word	0xaaad800b	! t0_kref+0x13f4:   	andncc	%l6, %o3, %l5
	.word	0x97a109b1	! t0_kref+0x13f8:   	fdivs	%f4, %f17, %f11
	.word	0xe96e001a	! t0_kref+0x13fc:   	prefetch	%i0 + %i2, 20
	.word	0xafa01896	! t0_kref+0x1400:   	fitos	%f22, %f23
	.word	0xeb68a008	! t0_kref+0x1404:   	prefetch	%g2 + 8, 21
	.word	0x113f1a2c	! t0_kref+0x1408:   	sethi	%hi(0xfc68b000), %o0
	.word	0x81ad0aaa	! t0_kref+0x140c:   	fcmpes	%fcc0, %f20, %f10
	.word	0xe820a004	! t0_kref+0x1410:   	st	%l4, [%g2 + 4]
	.word	0xaa5a8014	! t0_kref+0x1414:   	smul	%o2, %l4, %l5
	.word	0xaf400000	! t0_kref+0x1418:   	mov	%y, %l7
	.word	0x20800002	! t0_kref+0x141c:   	bn,a	_kref+0x1424
	.word	0xf207bfe0	! t0_kref+0x1420:   	ld	[%fp - 0x20], %i1
	.word	0xacbac00a	! t0_kref+0x1424:   	xnorcc	%o3, %o2, %l6
	.word	0xaf3aa000	! t0_kref+0x1428:   	sra	%o2, 0x0, %l7
	.word	0xab3d001b	! t0_kref+0x142c:   	sra	%l4, %i3, %l5
	.word	0x90e2c014	! t0_kref+0x1430:   	subccc	%o3, %l4, %o0
	.word	0xc9ee501c	! t0_kref+0x1434:   	prefetcha	%i1 + %i4, 4
	.word	0xe85e3ff0	! t0_kref+0x1438:   	ldx	[%i0 - 0x10], %l4
	.word	0xa6a24008	! t0_kref+0x143c:   	subcc	%o1, %o0, %l3
	.word	0xac52a4e4	! t0_kref+0x1440:   	umul	%o2, 0x4e4, %l6
	.word	0xae750009	! t0_kref+0x1444:   	udiv	%l4, %o1, %l7
	.word	0x93a00531	! t0_kref+0x1448:   	fsqrts	%f17, %f9
	.word	0x9de3bfa0	! t0_kref+0x144c:   	save	%sp, -0x60, %sp
	.word	0xabeef6d6	! t0_kref+0x1450:   	restore	%i3, -0x92a, %l5
	.word	0xaf400000	! t0_kref+0x1454:   	mov	%y, %l7
	.word	0xd0080019	! t0_kref+0x1458:   	ldub	[%g0 + %i1], %o0
	.word	0xe6060000	! t0_kref+0x145c:   	ld	[%i0], %l3
	.word	0x28480006	! t0_kref+0x1460:   	bleu,a,pt	%icc, _kref+0x1478
	.word	0xe920a028	! t0_kref+0x1464:   	st	%f20, [%g2 + 0x28]
	.word	0xe88e9018	! t0_kref+0x1468:   	lduba	[%i2 + %i0]0x80, %l4
	.word	0xa940c000	! t0_kref+0x146c:   	mov	%asi, %l4
	.word	0xec6e6013	! t0_kref+0x1470:   	ldstub	[%i1 + 0x13], %l6
	.word	0x95a0188f	! t0_kref+0x1474:   	fitos	%f15, %f10
	.word	0xa6bd7013	! t0_kref+0x1478:   	xnorcc	%l5, -0xfed, %l3
	.word	0xac1b0009	! t0_kref+0x147c:   	xor	%o4, %o1, %l6
	.word	0x2c800004	! t0_kref+0x1480:   	bneg,a	_kref+0x1490
	.word	0x2f3a2c11	! t0_kref+0x1484:   	sethi	%hi(0xe8b04400), %l7
	.word	0x35800004	! t0_kref+0x1488:   	fbue,a	_kref+0x1498
	.word	0xe19f1a58	! t0_kref+0x148c:   	ldda	[%i4 + %i0]0xd2, %f16
	.word	0x81d927f2	! t0_kref+0x1490:   	flush	%g4 + 0x7f2
	.word	0xe830a006	! t0_kref+0x1494:   	sth	%l4, [%g2 + 6]
	.word	0xee0e7fe5	! t0_kref+0x1498:   	ldub	[%i1 - 0x1b], %l7
	.word	0x90d6bfe2	! t0_kref+0x149c:   	umulcc	%i2, -0x1e, %o0
	.word	0xe846001c	! t0_kref+0x14a0:   	ldsw	[%i0 + %i4], %l4
	.word	0x33800006	! t0_kref+0x14a4:   	fbe,a	_kref+0x14bc
	.word	0x90d6be0d	! t0_kref+0x14a8:   	umulcc	%i2, -0x1f3, %o0
	.word	0xa836fac9	! t0_kref+0x14ac:   	orn	%i3, -0x537, %l4
	.word	0xea5e2008	! t0_kref+0x14b0:   	ldx	[%i0 + 8], %l5
	.word	0xee7e4000	! t0_kref+0x14b4:   	swap	[%i1], %l7
	.word	0xee10a00c	! t0_kref+0x14b8:   	lduh	[%g2 + 0xc], %l7
	.word	0xa8c2f0b2	! t0_kref+0x14bc:   	addccc	%o3, -0xf4e, %l4
	.word	0xa1a01904	! t0_kref+0x14c0:   	fitod	%f4, %f16
	.word	0xaeb2b697	! t0_kref+0x14c4:   	orncc	%o2, -0x969, %l7
	.word	0xec5e2010	! t0_kref+0x14c8:   	ldx	[%i0 + 0x10], %l6
	.word	0x90ba637a	! t0_kref+0x14cc:   	xnorcc	%o1, 0x37a, %o0
	.word	0x26800002	! t0_kref+0x14d0:   	bl,a	_kref+0x14d8
	.word	0x912a0009	! t0_kref+0x14d4:   	sll	%o0, %o1, %o0
	.word	0x81aa0ace	! t0_kref+0x14d8:   	fcmped	%fcc0, %f8, %f14
	.word	0xd47e2004	! t0_kref+0x14dc:   	swap	[%i0 + 4], %o2
	.word	0x2f2459e2	! t0_kref+0x14e0:   	sethi	%hi(0x91678800), %l7
	.word	0xaac6a889	! t0_kref+0x14e4:   	addccc	%i2, 0x889, %l5
	.word	0xea50a02c	! t0_kref+0x14e8:   	ldsh	[%g2 + 0x2c], %l5
	.word	0xae700016	! t0_kref+0x14ec:   	udiv	%g0, %l6, %l7
	.word	0xedee101d	! t0_kref+0x14f0:   	prefetcha	%i0 + %i5, 22
	.word	0xa1a548b1	! t0_kref+0x14f4:   	fsubs	%f21, %f17, %f16
	.word	0xac0dc00d	! t0_kref+0x14f8:   	and	%l7, %o5, %l6
	.word	0xf16e001d	! t0_kref+0x14fc:   	prefetch	%i0 + %i5, 24
	.word	0x81ae8a4e	! t0_kref+0x1500:   	fcmpd	%fcc0, %f26, %f14
	.word	0x90a2400a	! t0_kref+0x1504:   	subcc	%o1, %o2, %o0
	.word	0x22480007	! t0_kref+0x1508:   	be,a,pt	%icc, _kref+0x1524
	.word	0xee0e6000	! t0_kref+0x150c:   	ldub	[%i1], %l7
	.word	0xae330008	! t0_kref+0x1510:   	orn	%o4, %o0, %l7
	.word	0xaba0002b	! t0_kref+0x1514:   	fmovs	%f11, %f21
	.word	0xebee501c	! t0_kref+0x1518:   	prefetcha	%i1 + %i4, 21
	.word	0xa902401b	! t0_kref+0x151c:   	taddcc	%o1, %i3, %l4
	.word	0xda300018	! t0_kref+0x1520:   	sth	%o5, [%g0 + %i0]
	.word	0x9de3bfa0	! t0_kref+0x1524:   	save	%sp, -0x60, %sp
	.word	0xb686fcf6	! t0_kref+0x1528:   	addcc	%i3, -0x30a, %i3
	.word	0xa9eeead0	! t0_kref+0x152c:   	restore	%i3, 0xad0, %l4
	.word	0xac9d401a	! t0_kref+0x1530:   	xorcc	%l5, %i2, %l6
	.word	0xae5f63f4	! t0_kref+0x1534:   	smul	%i5, 0x3f4, %l7
	.word	0xb6103ffe	! t0_kref+0x1538:   	mov	0xfffffffe, %i3
	.word	0x89a50952	! t0_kref+0x153c:   	fmuld	%f20, %f18, %f4
	.word	0x90050017	! t0_kref+0x1540:   	add	%l4, %l7, %o0
	.word	0xea563ffc	! t0_kref+0x1544:   	ldsh	[%i0 - 4], %l5
	.word	0xb5a5882b	! t0_kref+0x1548:   	fadds	%f22, %f11, %f26
	.word	0xb9a018ca	! t0_kref+0x154c:   	fdtos	%f10, %f28
	.word	0xa68ec016	! t0_kref+0x1550:   	andcc	%i3, %l6, %l3
	.word	0xada018c6	! t0_kref+0x1554:   	fdtos	%f6, %f22
	.word	0x2c800004	! t0_kref+0x1558:   	bneg,a	_kref+0x1568
	.word	0xace2791c	! t0_kref+0x155c:   	subccc	%o1, -0x6e4, %l6
	.word	0x24800007	! t0_kref+0x1560:   	ble,a	_kref+0x157c
	.word	0xb1a34d29	! t0_kref+0x1564:   	fsmuld	%f13, %f9, %f24
	.word	0xacdf7327	! t0_kref+0x1568:   	smulcc	%i5, -0xcd9, %l6
	.word	0xad332014	! t0_kref+0x156c:   	srl	%o4, 0x14, %l6
	.word	0xd030a006	! t0_kref+0x1570:   	sth	%o0, [%g2 + 6]
	.word	0xeb6e6000	! t0_kref+0x1574:   	prefetch	%i1, 21
	.word	0x31480003	! t0_kref+0x1578:   	fba,a,pt	%fcc0, _kref+0x1584
	.word	0xaebb6f0f	! t0_kref+0x157c:   	xnorcc	%o5, 0xf0f, %l7
	.word	0x81adcab8	! t0_kref+0x1580:   	fcmpes	%fcc0, %f23, %f24
	.word	0xd030a008	! t0_kref+0x1584:   	sth	%o0, [%g2 + 8]
	.word	0xae8db62e	! t0_kref+0x1588:   	andcc	%l6, -0x9d2, %l7
	.word	0xe850a022	! t0_kref+0x158c:   	ldsh	[%g2 + 0x22], %l4
	.word	0x8143e077	! t0_kref+0x1590:   	membar	0x77
	.word	0xada388b3	! t0_kref+0x1594:   	fsubs	%f14, %f19, %f22
	.word	0x91a0053b	! t0_kref+0x1598:   	fsqrts	%f27, %f8
	.word	0xa69d0008	! t0_kref+0x159c:   	xorcc	%l4, %o0, %l3
	.word	0xea0e8018	! t0_kref+0x15a0:   	ldub	[%i2 + %i0], %l5
	.word	0xd9062018	! t0_kref+0x15a4:   	ld	[%i0 + 0x18], %f12
	.word	0xec16200e	! t0_kref+0x15a8:   	lduh	[%i0 + 0xe], %l6
	.word	0x33800005	! t0_kref+0x15ac:   	fbe,a	_kref+0x15c0
	.word	0x8da4cd3c	! t0_kref+0x15b0:   	fsmuld	%f19, %f28, %f6
	.word	0x8da00535	! t0_kref+0x15b4:   	fsqrts	%f21, %f6
	.word	0x90524017	! t0_kref+0x15b8:   	umul	%o1, %l7, %o0
	.word	0x9fc00004	! t0_kref+0x15bc:   	call	%g0 + %g4
	.word	0x95a509d2	! t0_kref+0x15c0:   	fdivd	%f20, %f18, %f10
	.word	0x2d05b77c	! t0_kref+0x15c4:   	sethi	%hi(0x16ddf000), %l6
	.word	0x36480008	! t0_kref+0x15c8:   	bge,a,pt	%icc, _kref+0x15e8
	.word	0xa3a0013c	! t0_kref+0x15cc:   	fabss	%f28, %f17
	.word	0xaee20000	! t0_kref+0x15d0:   	subccc	%o0, %g0, %l7
	.word	0xd1bf1a19	! t0_kref+0x15d4:   	stda	%f8, [%i4 + %i1]0xd0
	.word	0xd4380019	! t0_kref+0x15d8:   	std	%o2, [%g0 + %i1]
	.word	0xec4e001a	! t0_kref+0x15dc:   	ldsb	[%i0 + %i2], %l6
	.word	0x8da388a4	! t0_kref+0x15e0:   	fsubs	%f14, %f4, %f6
	.word	0x81828000	! t0_kref+0x15e4:   	wr	%o2, %g0, %y
	.word	0x9de3bfa0	! t0_kref+0x15e8:   	save	%sp, -0x60, %sp
	.word	0xb05e6af9	! t0_kref+0x15ec:   	smul	%i1, 0xaf9, %i0
	.word	0xadef0018	! t0_kref+0x15f0:   	restore	%i4, %i0, %l6
	.word	0xee40a024	! t0_kref+0x15f4:   	ldsw	[%g2 + 0x24], %l7
	.word	0xe8100018	! t0_kref+0x15f8:   	lduh	[%g0 + %i0], %l4
	.word	0x2b800008	! t0_kref+0x15fc:   	fbug,a	_kref+0x161c
	.word	0x9da68946	! t0_kref+0x1600:   	fmuld	%f26, %f6, %f14
	.word	0xa3a0188b	! t0_kref+0x1604:   	fitos	%f11, %f17
	.word	0xad2da004	! t0_kref+0x1608:   	sll	%l6, 0x4, %l6
	.word	0xa8fd2b21	! t0_kref+0x160c:   	sdivcc	%l4, 0xb21, %l4
	.word	0xf8266018	! t0_kref+0x1610:   	st	%i4, [%i1 + 0x18]
	.word	0x34480008	! t0_kref+0x1614:   	bg,a,pt	%icc, _kref+0x1634
	.word	0xa5a20844	! t0_kref+0x1618:   	faddd	%f8, %f4, %f18
	.word	0xdfa65000	! t0_kref+0x161c:   	sta	%f15, [%i1]0x80
	.word	0xc16e001d	! t0_kref+0x1620:   	prefetch	%i0 + %i5, 0
	.word	0xaa47400a	! t0_kref+0x1624:   	addc	%i5, %o2, %l5
	.word	0xcd3e001d	! t0_kref+0x1628:   	std	%f6, [%i0 + %i5]
	.word	0xa8fa250e	! t0_kref+0x162c:   	sdivcc	%o0, 0x50e, %l4
	.word	0xec28a02a	! t0_kref+0x1630:   	stb	%l6, [%g2 + 0x2a]
	.word	0xe850a038	! t0_kref+0x1634:   	ldsh	[%g2 + 0x38], %l4
	.word	0xab3d6007	! t0_kref+0x1638:   	sra	%l5, 0x7, %l5
	.word	0xaa5f4014	! t0_kref+0x163c:   	smul	%i5, %l4, %l5
	.word	0xaa077f1a	! t0_kref+0x1640:   	add	%i5, -0xe6, %l5
	.word	0x99a00130	! t0_kref+0x1644:   	fabss	%f16, %f12
	.word	0xa8c02549	! t0_kref+0x1648:   	addccc	%g0, 0x549, %l4
	.word	0xa5a01886	! t0_kref+0x164c:   	fitos	%f6, %f18
	.word	0xe8467fec	! t0_kref+0x1650:   	ldsw	[%i1 - 0x14], %l4
	.word	0xfa260000	! t0_kref+0x1654:   	st	%i5, [%i0]
	.word	0x3e800008	! t0_kref+0x1658:   	bvc,a	_kref+0x1678
	.word	0x87a708ab	! t0_kref+0x165c:   	fsubs	%f28, %f11, %f3
	.word	0xeb06401c	! t0_kref+0x1660:   	ld	[%i1 + %i4], %f21
	.word	0xa69a800a	! t0_kref+0x1664:   	xorcc	%o2, %o2, %l3
	.word	0xaba388a4	! t0_kref+0x1668:   	fsubs	%f14, %f4, %f21
	.word	0x2a800007	! t0_kref+0x166c:   	bcs,a	_kref+0x1688
	.word	0xac9db8c9	! t0_kref+0x1670:   	xorcc	%l6, -0x737, %l6
	.word	0x9072c00b	! t0_kref+0x1674:   	udiv	%o3, %o3, %o0
	.word	0xaf3f0016	! t0_kref+0x1678:   	sra	%i4, %l6, %l7
	.word	0x90900008	! t0_kref+0x167c:   	orcc	%g0, %o0, %o0
	.word	0xb7a018da	! t0_kref+0x1680:   	fdtos	%f26, %f27
	.word	0xe100a014	! t0_kref+0x1684:   	ld	[%g2 + 0x14], %f16
	.word	0x36480002	! t0_kref+0x1688:   	bge,a,pt	%icc, _kref+0x1690
	.word	0xae426911	! t0_kref+0x168c:   	addc	%o1, 0x911, %l7
	.word	0x3c480003	! t0_kref+0x1690:   	bpos,a,pt	%icc, _kref+0x169c
	.word	0x11375d8f	! t0_kref+0x1694:   	sethi	%hi(0xdd763c00), %o0
	.word	0xafa3893b	! t0_kref+0x1698:   	fmuls	%f14, %f27, %f23
	.word	0xea48a033	! t0_kref+0x169c:   	ldsb	[%g2 + 0x33], %l5
	.word	0xafa0188b	! t0_kref+0x16a0:   	fitos	%f11, %f23
	.word	0xaf1ac014	! t0_kref+0x16a4:   	tsubcctv	%o3, %l4, %l7
	.word	0xa6aa801d	! t0_kref+0x16a8:   	andncc	%o2, %i5, %l3
	.word	0x86102002	! t0_kref+0x16ac:   	mov	0x2, %g3
	.word	0x86a0e001	! t0_kref+0x16b0:   	subcc	%g3, 1, %g3
	.word	0x2280000b	! t0_kref+0x16b4:   	be,a	_kref+0x16e0
	.word	0xe96e401d	! t0_kref+0x16b8:   	prefetch	%i1 + %i5, 20
	.word	0xa826a5e2	! t0_kref+0x16bc:   	sub	%i2, 0x5e2, %l4
	.word	0x913a601e	! t0_kref+0x16c0:   	sra	%o1, 0x1e, %o0
	.word	0xe810a01a	! t0_kref+0x16c4:   	lduh	[%g2 + 0x1a], %l4
	.word	0xd8b6501b	! t0_kref+0x16c8:   	stha	%o4, [%i1 + %i3]0x80
	.word	0xae5d2776	! t0_kref+0x16cc:   	smul	%l4, 0x776, %l7
	.word	0x91a109cc	! t0_kref+0x16d0:   	fdivd	%f4, %f12, %f8
	.word	0xe600a028	! t0_kref+0x16d4:   	ld	[%g2 + 0x28], %l3
	.word	0xb3a0188b	! t0_kref+0x16d8:   	fitos	%f11, %f25
	.word	0xaa8ac00a	! t0_kref+0x16dc:   	andcc	%o3, %o2, %l5
	.word	0xe848a01d	! t0_kref+0x16e0:   	ldsb	[%g2 + 0x1d], %l4
	.word	0xaf3de002	! t0_kref+0x16e4:   	sra	%l7, 0x2, %l7
	.word	0xacdf6962	! t0_kref+0x16e8:   	smulcc	%i5, 0x962, %l6
	.word	0xb5a00539	! t0_kref+0x16ec:   	fsqrts	%f25, %f26
	.word	0x2d0ebc41	! t0_kref+0x16f0:   	sethi	%hi(0x3af10400), %l6
	.word	0xaa9efeb5	! t0_kref+0x16f4:   	xorcc	%i3, -0x14b, %l5
	.word	0xaf3f0017	! t0_kref+0x16f8:   	sra	%i4, %l7, %l7
	.word	0xb9a00146	! t0_kref+0x16fc:   	fabsd	%f6, %f28
	.word	0xe46e8018	! t0_kref+0x1700:   	ldstub	[%i2 + %i0], %l2
	.word	0xae5ec015	! t0_kref+0x1704:   	smul	%i3, %l5, %l7
	.word	0x8da48d33	! t0_kref+0x1708:   	fsmuld	%f18, %f19, %f6
	.word	0xad418000	! t0_kref+0x170c:   	mov	%fprs, %l6
	.word	0xb1a6c9b4	! t0_kref+0x1710:   	fdivs	%f27, %f20, %f24
	.word	0xd4700018	! t0_kref+0x1714:   	stx	%o2, [%g0 + %i0]
	.word	0xebee501c	! t0_kref+0x1718:   	prefetcha	%i1 + %i4, 21
	.word	0xaa2275d4	! t0_kref+0x171c:   	sub	%o1, -0xa2c, %l5
	.word	0xe53e2008	! t0_kref+0x1720:   	std	%f18, [%i0 + 8]
	.word	0xacbf2bbc	! t0_kref+0x1724:   	xnorcc	%i4, 0xbbc, %l6
	.word	0x001fffff	! t0_kref+0x1728:   	illtrap	0x1fffff
	.word	0x81aaca33	! t0_kref+0x172c:   	fcmps	%fcc0, %f11, %f19
	.word	0xa9400000	! t0_kref+0x1730:   	mov	%y, %l4
	sethi	%hi(2f), %o7
	.word	0xe40be36c	! t0_kref+0x1738:   	ldub	[%o7 + 0x36c], %l2
	.word	0xa41ca00c	! t0_kref+0x173c:   	xor	%l2, 0xc, %l2
	.word	0xe42be36c	! t0_kref+0x1740:   	stb	%l2, [%o7 + 0x36c]
	.word	0x81dbe36c	! t0_kref+0x1744:   	flush	%o7 + 0x36c
	.word	0x95a018da	! t0_kref+0x1748:   	fdtos	%f26, %f10
	.word	0x81d935cd	! t0_kref+0x174c:   	flush	%g4 - 0xa33
	.word	0xf76e401a	! t0_kref+0x1750:   	prefetch	%i1 + %i2, 27
	.word	0x81580000	! t0_kref+0x1754:   	flushw
	.word	0xae3ec014	! t0_kref+0x1758:   	xnor	%i3, %l4, %l7
	.word	0x9fc10000	! t0_kref+0x175c:   	call	%g4
	.word	0xf8360000	! t0_kref+0x1760:   	sth	%i4, [%i0]
	.word	0xacdf6b96	! t0_kref+0x1764:   	smulcc	%i5, 0xb96, %l6
	.word	0x89a64d3a	! t0_kref+0x1768:   	fsmuld	%f25, %f26, %f4
2:	.word	0xe0981018	! t0_kref+0x176c:   	ldda	[%g0 + %i0]0x80, %l0
	.word	0x8da0012e	! t0_kref+0x1770:   	fabss	%f14, %f6
	.word	0x22480008	! t0_kref+0x1774:   	be,a,pt	%icc, _kref+0x1794
	.word	0xa88b6ec9	! t0_kref+0x1778:   	andcc	%o5, 0xec9, %l4
	.word	0x9075657a	! t0_kref+0x177c:   	udiv	%l5, 0x57a, %o0
	.word	0x91a30954	! t0_kref+0x1780:   	fmuld	%f12, %f20, %f8
	.word	0x34480004	! t0_kref+0x1784:   	bg,a,pt	%icc, _kref+0x1794
	.word	0xada00129	! t0_kref+0x1788:   	fabss	%f9, %f22
	.word	0xec4e600f	! t0_kref+0x178c:   	ldsb	[%i1 + 0xf], %l6
	.word	0xa8724009	! t0_kref+0x1790:   	udiv	%o1, %o1, %l4
	.word	0xf16e7ff0	! t0_kref+0x1794:   	prefetch	%i1 - 0x10, 24
	.word	0x95a01906	! t0_kref+0x1798:   	fitod	%f6, %f10
	.word	0x913b2010	! t0_kref+0x179c:   	sra	%o4, 0x10, %o0
	.word	0xa645c00d	! t0_kref+0x17a0:   	addc	%l7, %o5, %l3
	.word	0x11328763	! t0_kref+0x17a4:   	sethi	%hi(0xca1d8c00), %o0
	.word	0x9f414000	! t0_kref+0x17a8:   	mov	%pc, %o7
	.word	0xa1a01906	! t0_kref+0x17ac:   	fitod	%f6, %f16
	.word	0xa738000a	! t0_kref+0x17b0:   	sra	%g0, %o2, %l3
	.word	0x2a800006	! t0_kref+0x17b4:   	bcs,a	_kref+0x17cc
	.word	0x99a54828	! t0_kref+0x17b8:   	fadds	%f21, %f8, %f12
	.word	0xb9a18852	! t0_kref+0x17bc:   	faddd	%f6, %f18, %f28
	.word	0xc12e401c	! t0_kref+0x17c0:   	st	%fsr, [%i1 + %i4]
	.word	0x91a84058	! t0_kref+0x17c4:   	fmovdne	%fcc0, %f24, %f8
	.word	0x2f1ba788	! t0_kref+0x17c8:   	sethi	%hi(0x6e9e2000), %l7
	.word	0xd320a034	! t0_kref+0x17cc:   	st	%f9, [%g2 + 0x34]
	.word	0xad3a4014	! t0_kref+0x17d0:   	sra	%o1, %l4, %l6
	.word	0xe6162004	! t0_kref+0x17d4:   	lduh	[%i0 + 4], %l3
	.word	0x8143e040	! t0_kref+0x17d8:   	membar	0x40
	.word	0xa83771fb	! t0_kref+0x17dc:   	orn	%i5, -0xe05, %l4
	.word	0xac5f400c	! t0_kref+0x17e0:   	smul	%i5, %o4, %l6
	.word	0xd9266018	! t0_kref+0x17e4:   	st	%f12, [%i1 + 0x18]
	.word	0xe26e4000	! t0_kref+0x17e8:   	ldstub	[%i1], %l1
	.word	0xd1380019	! t0_kref+0x17ec:   	std	%f8, [%g0 + %i1]
	.word	0xd86e8018	! t0_kref+0x17f0:   	ldstub	[%i2 + %i0], %o4
	.word	0xa92d8000	! t0_kref+0x17f4:   	sll	%l6, %g0, %l4
	.word	0x8ba208ac	! t0_kref+0x17f8:   	fsubs	%f8, %f12, %f5
	.word	0xd300a010	! t0_kref+0x17fc:   	ld	[%g2 + 0x10], %f9
	.word	0xa93b401b	! t0_kref+0x1800:   	sra	%o5, %i3, %l4
	.word	0x81ae8a27	! t0_kref+0x1804:   	fcmps	%fcc0, %f26, %f7
	.word	0xecfe501c	! t0_kref+0x1808:   	swapa	[%i1 + %i4]0x80, %l6
	.word	0xec270018	! t0_kref+0x180c:   	st	%l6, [%i4 + %i0]
	.word	0xe7ee101a	! t0_kref+0x1810:   	prefetcha	%i0 + %i2, 19
	.word	0xa833401b	! t0_kref+0x1814:   	orn	%o5, %i3, %l4
	.word	0xa6623d09	! t0_kref+0x1818:   	subc	%o0, -0x2f7, %l3
	.word	0xd04e3fe5	! t0_kref+0x181c:   	ldsb	[%i0 - 0x1b], %o0
	.word	0xa6028017	! t0_kref+0x1820:   	add	%o2, %l7, %l3
	.word	0xc36e4009	! t0_kref+0x1824:   	prefetch	%i1 + %o1, 1
	.word	0x909eb12e	! t0_kref+0x1828:   	xorcc	%i2, -0xed2, %o0
	.word	0xaa30370b	! t0_kref+0x182c:   	orn	%g0, -0x8f5, %l5
	.word	0xe26e7ffc	! t0_kref+0x1830:   	ldstub	[%i1 - 4], %l1
	.word	0x9de3bfa0	! t0_kref+0x1834:   	save	%sp, -0x60, %sp
	.word	0xbab6a7dc	! t0_kref+0x1838:   	orncc	%i2, 0x7dc, %i5
	.word	0xa9eec01c	! t0_kref+0x183c:   	restore	%i3, %i4, %l4
	.word	0xda7e601c	! t0_kref+0x1840:   	swap	[%i1 + 0x1c], %o5
	.word	0x8da58848	! t0_kref+0x1844:   	faddd	%f22, %f8, %f6
	.word	0xaa0a401b	! t0_kref+0x1848:   	and	%o1, %i3, %l5
	.word	0x8143e040	! t0_kref+0x184c:   	membar	0x40
	.word	0xad703a27	! t0_kref+0x1850:   	popc	-0x5d9, %l6
	.word	0x81a90a42	! t0_kref+0x1854:   	fcmpd	%fcc0, %f4, %f2
	sethi	%hi(2f), %o7
	.word	0xe40be074	! t0_kref+0x185c:   	ldub	[%o7 + 0x74], %l2
	.word	0xa41ca00c	! t0_kref+0x1860:   	xor	%l2, 0xc, %l2
	.word	0xe42be074	! t0_kref+0x1864:   	stb	%l2, [%o7 + 0x74]
	.word	0x81dbe074	! t0_kref+0x1868:   	flush	%o7 + 0x74
	.word	0xa8472dc1	! t0_kref+0x186c:   	addc	%i4, 0xdc1, %l4
	.word	0x2d1603ed	! t0_kref+0x1870:   	sethi	%hi(0x580fb400), %l6
2:	.word	0x9da01905	! t0_kref+0x1874:   	fitod	%f5, %f14
	.word	0x878020e0	! t0_kref+0x1878:   	mov	0xe0, %asi
	.word	0xe99e5a5d	! t0_kref+0x187c:   	ldda	[%i1 + %i5]0xd2, %f20
	.word	0x81aa0a27	! t0_kref+0x1880:   	fcmps	%fcc0, %f8, %f7
	.word	0xab400000	! t0_kref+0x1884:   	mov	%y, %l5
	.word	0xa8d76df8	! t0_kref+0x1888:   	umulcc	%i5, 0xdf8, %l4
	.word	0xae5ec009	! t0_kref+0x188c:   	smul	%i3, %o1, %l7
	.word	0x9022bc8a	! t0_kref+0x1890:   	sub	%o2, -0x376, %o0
	.word	0x3a800007	! t0_kref+0x1894:   	bcc,a	_kref+0x18b0
	.word	0xac42b580	! t0_kref+0x1898:   	addc	%o2, -0xa80, %l6
	.word	0x93a6893c	! t0_kref+0x189c:   	fmuls	%f26, %f28, %f9
	.word	0xd7063ff8	! t0_kref+0x18a0:   	ld	[%i0 - 8], %f11
	.word	0x95a00044	! t0_kref+0x18a4:   	fmovd	%f4, %f10
	.word	0xe91fbc08	! t0_kref+0x18a8:   	ldd	[%fp - 0x3f8], %f20
	.word	0xea40a034	! t0_kref+0x18ac:   	ldsw	[%g2 + 0x34], %l5
	.word	0xec961000	! t0_kref+0x18b0:   	lduha	[%i0]0x80, %l6
	.word	0xd53e401d	! t0_kref+0x18b4:   	std	%f10, [%i1 + %i5]
	.word	0xc768a08e	! t0_kref+0x18b8:   	prefetch	%g2 + 0x8e, 3
	.word	0xae6324d5	! t0_kref+0x18bc:   	subc	%o4, 0x4d5, %l7
	call	SYM(t0_subr3)
	.word	0xf5ee501d	! t0_kref+0x18c4:   	prefetcha	%i1 + %i5, 26
	.word	0x91a648b1	! t0_kref+0x18c8:   	fsubs	%f25, %f17, %f8
	.word	0xdf06001c	! t0_kref+0x18cc:   	ld	[%i0 + %i4], %f15
	.word	0xd3067ffc	! t0_kref+0x18d0:   	ld	[%i1 - 4], %f9
	.word	0xa92d2006	! t0_kref+0x18d4:   	sll	%l4, 0x6, %l4
	.word	0x81d84015	! t0_kref+0x18d8:   	flush	%g1 + %l5
	.word	0xae233d44	! t0_kref+0x18dc:   	sub	%o4, -0x2bc, %l7
	.word	0x3c480002	! t0_kref+0x18e0:   	bpos,a,pt	%icc, _kref+0x18e8
	.word	0xe64e6005	! t0_kref+0x18e4:   	ldsb	[%i1 + 5], %l3
	.word	0xd0160000	! t0_kref+0x18e8:   	lduh	[%i0], %o0
	.word	0xc76e401a	! t0_kref+0x18ec:   	prefetch	%i1 + %i2, 3
	.word	0x33800002	! t0_kref+0x18f0:   	fbe,a	_kref+0x18f8
	.word	0xa9aa0048	! t0_kref+0x18f4:   	fmovda	%fcc0, %f8, %f20
	.word	0x30800003	! t0_kref+0x18f8:   	ba,a	_kref+0x1904
	.word	0x9005000d	! t0_kref+0x18fc:   	add	%l4, %o5, %o0
	.word	0xc06e600a	! t0_kref+0x1900:   	ldstub	[%i1 + 0xa], %g0
	.word	0xe8580019	! t0_kref+0x1904:   	ldx	[%g0 + %i1], %l4
	.word	0xaafda804	! t0_kref+0x1908:   	sdivcc	%l6, 0x804, %l5
	.word	0xaafb000b	! t0_kref+0x190c:   	sdivcc	%o4, %o3, %l5
	.word	0xd628a022	! t0_kref+0x1910:   	stb	%o3, [%g2 + 0x22]
	.word	0xd81e0000	! t0_kref+0x1914:   	ldd	[%i0], %o4
	.word	0xb5a00137	! t0_kref+0x1918:   	fabss	%f23, %f26
	.word	0x9ba4c8a5	! t0_kref+0x191c:   	fsubs	%f19, %f5, %f13
	.word	0x903562b3	! t0_kref+0x1920:   	orn	%l5, 0x2b3, %o0
	.word	0x28800003	! t0_kref+0x1924:   	bleu,a	_kref+0x1930
	.word	0xac7a35e1	! t0_kref+0x1928:   	sdiv	%o0, -0xa1f, %l6
	.word	0xa1a0052d	! t0_kref+0x192c:   	fsqrts	%f13, %f16
	.word	0xaa5eba23	! t0_kref+0x1930:   	smul	%i2, -0x5dd, %l5
	.word	0x81aeca26	! t0_kref+0x1934:   	fcmps	%fcc0, %f27, %f6
	.word	0xa845e967	! t0_kref+0x1938:   	addc	%l7, 0x967, %l4
	.word	0x97a1c92f	! t0_kref+0x193c:   	fmuls	%f7, %f15, %f11
	.word	0xaad2001a	! t0_kref+0x1940:   	umulcc	%o0, %i2, %l5
	.word	0xa90372ac	! t0_kref+0x1944:   	taddcc	%o5, -0xd54, %l4
	.word	0x8da34d35	! t0_kref+0x1948:   	fsmuld	%f13, %f21, %f6
	.word	0xe600a024	! t0_kref+0x194c:   	ld	[%g2 + 0x24], %l3
	.word	0xee063fe8	! t0_kref+0x1950:   	ld	[%i0 - 0x18], %l7
	.word	0x90b58016	! t0_kref+0x1954:   	orncc	%l6, %l6, %o0
	.word	0xa9a00525	! t0_kref+0x1958:   	fsqrts	%f5, %f20
	.word	0xea801019	! t0_kref+0x195c:   	lda	[%g0 + %i1]0x80, %l5
	.word	0x87a0002b	! t0_kref+0x1960:   	fmovs	%f11, %f3
	.word	0x24480008	! t0_kref+0x1964:   	ble,a,pt	%icc, _kref+0x1984
	.word	0xa7a01884	! t0_kref+0x1968:   	fitos	%f4, %f19
	.word	0x2a800007	! t0_kref+0x196c:   	bcs,a	_kref+0x1988
	.word	0xb9a018c4	! t0_kref+0x1970:   	fdtos	%f4, %f28
	.word	0xef20a008	! t0_kref+0x1974:   	st	%f23, [%g2 + 8]
	.word	0x9ba6c92a	! t0_kref+0x1978:   	fmuls	%f27, %f10, %f13
	.word	0xaba7082a	! t0_kref+0x197c:   	fadds	%f28, %f10, %f21
	.word	0xd2a01019	! t0_kref+0x1980:   	sta	%o1, [%g0 + %i1]0x80
	.word	0xd0500018	! t0_kref+0x1984:   	ldsh	[%g0 + %i0], %o0
	.word	0x9fc10000	! t0_kref+0x1988:   	call	%g4
	.word	0xac1d324f	! t0_kref+0x198c:   	xor	%l4, -0xdb1, %l6
	.word	0xaeb6b7ec	! t0_kref+0x1990:   	orncc	%i2, -0x814, %l7
	.word	0xa6320017	! t0_kref+0x1994:   	orn	%o0, %l7, %l3
	.word	0xf900a030	! t0_kref+0x1998:   	ld	[%g2 + 0x30], %f28
	.word	0x93a20837	! t0_kref+0x199c:   	fadds	%f8, %f23, %f9
	.word	0xa7700015	! t0_kref+0x19a0:   	popc	%l5, %l3
	.word	0xa8a33400	! t0_kref+0x19a4:   	subcc	%o4, -0xc00, %l4
	.word	0x28480004	! t0_kref+0x19a8:   	bleu,a,pt	%icc, _kref+0x19b8
	.word	0xd1be501d	! t0_kref+0x19ac:   	stda	%f8, [%i1 + %i5]0x80
	.word	0xee10a032	! t0_kref+0x19b0:   	lduh	[%g2 + 0x32], %l7
	.word	0xaa3e8000	! t0_kref+0x19b4:   	not	%i2, %l5
	.word	0xa80ac008	! t0_kref+0x19b8:   	and	%o3, %o0, %l4
	.word	0x2b480001	! t0_kref+0x19bc:   	fbug,a,pt	%fcc0, _kref+0x19c0
	.word	0x8d83000c	! t0_kref+0x19c0:   	wr	%o4, %o4, %fprs
	.word	0xaafa697c	! t0_kref+0x19c4:   	sdivcc	%o1, 0x97c, %l5
	.word	0xae32f585	! t0_kref+0x19c8:   	orn	%o3, -0xa7b, %l7
	.word	0xae0569a7	! t0_kref+0x19cc:   	add	%l5, 0x9a7, %l7
	.word	0xe93f4019	! t0_kref+0x19d0:   	std	%f20, [%i5 + %i1]
	.word	0xf1be5a5d	! t0_kref+0x19d4:   	stda	%f24, [%i1 + %i5]0xd2
	.word	0xc0266014	! t0_kref+0x19d8:   	clr	[%i1 + 0x14]
	.word	0xae35c01c	! t0_kref+0x19dc:   	orn	%l7, %i4, %l7
	.word	0xe93e7fe0	! t0_kref+0x19e0:   	std	%f20, [%i1 - 0x20]
	.word	0xada3cd26	! t0_kref+0x19e4:   	fsmuld	%f15, %f6, %f22
	.word	0xe120a034	! t0_kref+0x19e8:   	st	%f16, [%g2 + 0x34]
	.word	0xac232f3c	! t0_kref+0x19ec:   	sub	%o4, 0xf3c, %l6
	.word	0x9da689da	! t0_kref+0x19f0:   	fdivd	%f26, %f26, %f14
	.word	0xa1a40d2c	! t0_kref+0x19f4:   	fsmuld	%f16, %f12, %f16
	.word	0xc1e6101b	! t0_kref+0x19f8:   	casa	[%i0]0x80, %i3, %g0
	.word	0xf100a030	! t0_kref+0x19fc:   	ld	[%g2 + 0x30], %f24
	.word	0xaf3f401d	! t0_kref+0x1a00:   	sra	%i5, %i5, %l7
	.word	0xec16c019	! t0_kref+0x1a04:   	lduh	[%i3 + %i1], %l6
	.word	0xa852000d	! t0_kref+0x1a08:   	umul	%o0, %o5, %l4
	.word	0xe168a007	! t0_kref+0x1a0c:   	prefetch	%g2 + 7, 16
	.word	0xe8500019	! t0_kref+0x1a10:   	ldsh	[%g0 + %i1], %l4
	.word	0xe9be5000	! t0_kref+0x1a14:   	stda	%f20, [%i1]0x80
	.word	0xac2dfa8b	! t0_kref+0x1a18:   	andn	%l7, -0x575, %l6
	.word	0x8143e040	! t0_kref+0x1a1c:   	membar	0x40
	.word	0xae0d4009	! t0_kref+0x1a20:   	and	%l5, %o1, %l7
	.word	0xae424000	! t0_kref+0x1a24:   	addc	%o1, %g0, %l7
	.word	0xac356461	! t0_kref+0x1a28:   	orn	%l5, 0x461, %l6
	.word	0x86102015	! t0_kref+0x1a2c:   	mov	0x15, %g3
	.word	0x86a0e001	! t0_kref+0x1a30:   	subcc	%g3, 1, %g3
	.word	0x2280000f	! t0_kref+0x1a34:   	be,a	_kref+0x1a70
	.word	0xa7082463	! t0_kref+0x1a38:   	tsubcc	%g0, 0x463, %l3
	.word	0x3c480007	! t0_kref+0x1a3c:   	bpos,a,pt	%icc, _kref+0x1a58
	.word	0xf9ee101a	! t0_kref+0x1a40:   	prefetcha	%i0 + %i2, 28
	.word	0xb1a649b5	! t0_kref+0x1a44:   	fdivs	%f25, %f21, %f24
	.word	0x2d3e31f1	! t0_kref+0x1a48:   	sethi	%hi(0xf8c7c400), %l6
	.word	0xb9a0012a	! t0_kref+0x1a4c:   	fabss	%f10, %f28
	.word	0xa3a01a2f	! t0_kref+0x1a50:   	fstoi	%f15, %f17
	.word	0x9fa0052f	! t0_kref+0x1a54:   	fsqrts	%f15, %f15
	.word	0xa80d801a	! t0_kref+0x1a58:   	and	%l6, %i2, %l4
	.word	0x2b197049	! t0_kref+0x1a5c:   	sethi	%hi(0x65c12400), %l5
	.word	0x81a94a39	! t0_kref+0x1a60:   	fcmps	%fcc0, %f5, %f25
	.word	0xe64e2005	! t0_kref+0x1a64:   	ldsb	[%i0 + 5], %l3
	.word	0xb3a00136	! t0_kref+0x1a68:   	fabss	%f22, %f25
	.word	0xac924016	! t0_kref+0x1a6c:   	orcc	%o1, %l6, %l6
	.word	0xab400000	! t0_kref+0x1a70:   	mov	%y, %l5
	.word	0xf320a014	! t0_kref+0x1a74:   	st	%f25, [%g2 + 0x14]
	.word	0x9da01905	! t0_kref+0x1a78:   	fitod	%f5, %f14
	.word	0xf500a03c	! t0_kref+0x1a7c:   	ld	[%g2 + 0x3c], %f26
	.word	0xaafd0000	! t0_kref+0x1a80:   	sdivcc	%l4, %g0, %l5
	.word	0xf53f4019	! t0_kref+0x1a84:   	std	%f26, [%i5 + %i1]
	.word	0xa832aa58	! t0_kref+0x1a88:   	orn	%o2, 0xa58, %l4
	.word	0x9fc00004	! t0_kref+0x1a8c:   	call	%g0 + %g4
	.word	0xb9a4094c	! t0_kref+0x1a90:   	fmuld	%f16, %f12, %f28
	.word	0x2f800005	! t0_kref+0x1a94:   	fbu,a	_kref+0x1aa8
	.word	0xd6202440	! t0_kref+0x1a98:   	st	%o3, [%g0 + 0x440]
	.word	0xd028a01c	! t0_kref+0x1a9c:   	stb	%o0, [%g2 + 0x1c]
	.word	0xac52a829	! t0_kref+0x1aa0:   	umul	%o2, 0x829, %l6
	.word	0xc9067fe4	! t0_kref+0x1aa4:   	ld	[%i1 - 0x1c], %f4
	.word	0xa9a0110c	! t0_kref+0x1aa8:   	fxtod	%f12, %f20
	.word	0x86102006	! t0_kref+0x1aac:   	mov	0x6, %g3
	.word	0x86a0e001	! t0_kref+0x1ab0:   	subcc	%g3, 1, %g3
	.word	0x22800006	! t0_kref+0x1ab4:   	be,a	_kref+0x1acc
	.word	0xa83dc016	! t0_kref+0x1ab8:   	xnor	%l7, %l6, %l4
	.word	0x8fa70836	! t0_kref+0x1abc:   	fadds	%f28, %f22, %f7
	.word	0xa8070000	! t0_kref+0x1ac0:   	add	%i4, %g0, %l4
	.word	0xec10a032	! t0_kref+0x1ac4:   	lduh	[%g2 + 0x32], %l6
	.word	0xa708376c	! t0_kref+0x1ac8:   	tsubcc	%g0, -0x894, %l3
	.word	0xee162008	! t0_kref+0x1acc:   	lduh	[%i0 + 8], %l7
	.word	0xac754014	! t0_kref+0x1ad0:   	udiv	%l5, %l4, %l6
	.word	0x9fa00531	! t0_kref+0x1ad4:   	fsqrts	%f17, %f15
	.word	0x9de3bfa0	! t0_kref+0x1ad8:   	save	%sp, -0x60, %sp
	.word	0x80377d9f	! t0_kref+0x1adc:   	orn	%i5, -0x261, %g0
	.word	0xa9ee801c	! t0_kref+0x1ae0:   	restore	%i2, %i4, %l4
	.word	0x2724b764	! t0_kref+0x1ae4:   	sethi	%hi(0x92dd9000), %l3
	.word	0xa60561b4	! t0_kref+0x1ae8:   	add	%l5, 0x1b4, %l3
	.word	0xa7400000	! t0_kref+0x1aec:   	mov	%y, %l3
	.word	0xae880015	! t0_kref+0x1af0:   	andcc	%g0, %l5, %l7
	.word	0xe66e6012	! t0_kref+0x1af4:   	ldstub	[%i1 + 0x12], %l3
	.word	0x001fffff	! t0_kref+0x1af8:   	illtrap	0x1fffff
	.word	0x905a001c	! t0_kref+0x1afc:   	smul	%o0, %i4, %o0
	.word	0xee8e5000	! t0_kref+0x1b00:   	lduba	[%i1]0x80, %l7
	.word	0x89a00129	! t0_kref+0x1b04:   	fabss	%f9, %f4
	.word	0xa606f5ae	! t0_kref+0x1b08:   	add	%i3, -0xa52, %l3
	.word	0xe968a085	! t0_kref+0x1b0c:   	prefetch	%g2 + 0x85, 20
	.word	0xa1a00127	! t0_kref+0x1b10:   	fabss	%f7, %f16
	.word	0x9de3bfa0	! t0_kref+0x1b14:   	save	%sp, -0x60, %sp
	.word	0xadef401b	! t0_kref+0x1b18:   	restore	%i5, %i3, %l6
	.word	0xd0070019	! t0_kref+0x1b1c:   	ld	[%i4 + %i1], %o0
	.word	0xa83a8009	! t0_kref+0x1b20:   	xnor	%o2, %o1, %l4
	.word	0xc16e4008	! t0_kref+0x1b24:   	prefetch	%i1 + %o0, 0
	.word	0xe656201e	! t0_kref+0x1b28:   	ldsh	[%i0 + 0x1e], %l3
	.word	0xaaa8314f	! t0_kref+0x1b2c:   	andncc	%g0, -0xeb1, %l5
	.word	0xb5a44d2e	! t0_kref+0x1b30:   	fsmuld	%f17, %f14, %f26
	.word	0x99a409c8	! t0_kref+0x1b34:   	fdivd	%f16, %f8, %f12
	.word	0x2f800008	! t0_kref+0x1b38:   	fbu,a	_kref+0x1b58
	.word	0xa665bb2f	! t0_kref+0x1b3c:   	subc	%l6, -0x4d1, %l3
	.word	0x81a90a28	! t0_kref+0x1b40:   	fcmps	%fcc0, %f4, %f8
	.word	0xd86e6011	! t0_kref+0x1b44:   	ldstub	[%i1 + 0x11], %o4
	.word	0xe968a04f	! t0_kref+0x1b48:   	prefetch	%g2 + 0x4f, 20
	.word	0xada01924	! t0_kref+0x1b4c:   	fstod	%f4, %f22
	.word	0xac2ec017	! t0_kref+0x1b50:   	andn	%i3, %l7, %l6
	.word	0x90334014	! t0_kref+0x1b54:   	orn	%o5, %l4, %o0
	.word	0x9de3bfa0	! t0_kref+0x1b58:   	save	%sp, -0x60, %sp
	.word	0xb4374000	! t0_kref+0x1b5c:   	orn	%i5, %g0, %i2
	.word	0xadeec01a	! t0_kref+0x1b60:   	restore	%i3, %i2, %l6
	.word	0xae9ac00c	! t0_kref+0x1b64:   	xorcc	%o3, %o4, %l7
	.word	0xada01052	! t0_kref+0x1b68:   	fdtox	%f18, %f22
	.word	0x8da0013b	! t0_kref+0x1b6c:   	fabss	%f27, %f6
	.word	0xace7401c	! t0_kref+0x1b70:   	subccc	%i5, %i4, %l6
	.word	0xed6e6000	! t0_kref+0x1b74:   	prefetch	%i1, 22
	.word	0xae8d3a63	! t0_kref+0x1b78:   	andcc	%l4, -0x59d, %l7
	.word	0xad282014	! t0_kref+0x1b7c:   	sll	%g0, 0x14, %l6
	.word	0x81df33f3	! t0_kref+0x1b80:   	flush	%i4 - 0xc0d
	.word	0x9da0053b	! t0_kref+0x1b84:   	fsqrts	%f27, %f14
	.word	0xd6680019	! t0_kref+0x1b88:   	ldstub	[%g0 + %i1], %o3
	.word	0xd2f81018	! t0_kref+0x1b8c:   	swapa	[%g0 + %i0]0x80, %o1
	.word	0x81df800b	! t0_kref+0x1b90:   	flush	%fp + %o3
	.word	0xf7070019	! t0_kref+0x1b94:   	ld	[%i4 + %i1], %f27
	.word	0xad400000	! t0_kref+0x1b98:   	mov	%y, %l6
	.word	0x2d08152a	! t0_kref+0x1b9c:   	sethi	%hi(0x2054a800), %l6
	.word	0xa6d37a25	! t0_kref+0x1ba0:   	umulcc	%o5, -0x5db, %l3
	.word	0x21800004	! t0_kref+0x1ba4:   	fbn,a	_kref+0x1bb4
	.word	0xa6e6f20d	! t0_kref+0x1ba8:   	subccc	%i3, -0xdf3, %l3
	.word	0x90556bef	! t0_kref+0x1bac:   	umul	%l5, 0xbef, %o0
	.word	0xd4fe101c	! t0_kref+0x1bb0:   	swapa	[%i0 + %i4]0x80, %o2
	call	0x00000ab0
	.word	0xa86378ed	! t0_kref+0x1bb8:   	subc	%o5, -0x713, %l4
	.word	0x9de3bfa0	! t0_kref+0x1bbc:   	save	%sp, -0x60, %sp
	.word	0xa7eea370	! t0_kref+0x1bc0:   	restore	%i2, 0x370, %l3
	.word	0x9fc10000	! t0_kref+0x1bc4:   	call	%g4
	.word	0xd0981019	! t0_kref+0x1bc8:   	ldda	[%g0 + %i1]0x80, %o0
	.word	0x9065c009	! t0_kref+0x1bcc:   	subc	%l7, %o1, %o0
	.word	0xea8e9019	! t0_kref+0x1bd0:   	lduba	[%i2 + %i1]0x80, %l5
	.word	0xa68d30e5	! t0_kref+0x1bd4:   	andcc	%l4, -0xf1b, %l3
	.word	0xa6ba301d	! t0_kref+0x1bd8:   	xnorcc	%o0, -0xfe3, %l3
	.word	0xe06e201a	! t0_kref+0x1bdc:   	ldstub	[%i0 + 0x1a], %l0
	.word	0xec50a02c	! t0_kref+0x1be0:   	ldsh	[%g2 + 0x2c], %l6
	.word	0x31480004	! t0_kref+0x1be4:   	fba,a,pt	%fcc0, _kref+0x1bf4
	.word	0x8580210e	! t0_kref+0x1be8:   	mov	0x10e, %ccr
	.word	0xfb6e001d	! t0_kref+0x1bec:   	prefetch	%i0 + %i5, 29
	.word	0xada309ce	! t0_kref+0x1bf0:   	fdivd	%f12, %f14, %f22
	.word	0xee4e600a	! t0_kref+0x1bf4:   	ldsb	[%i1 + 0xa], %l7
	.word	0xe850a014	! t0_kref+0x1bf8:   	ldsh	[%g2 + 0x14], %l4
	.word	0x81af0a2f	! t0_kref+0x1bfc:   	fcmps	%fcc0, %f28, %f15
	.word	0xaa45000b	! t0_kref+0x1c00:   	addc	%l4, %o3, %l5
	.word	0xa8da400d	! t0_kref+0x1c04:   	smulcc	%o1, %o5, %l4
	.word	0xaeab7e6e	! t0_kref+0x1c08:   	andncc	%o5, -0x192, %l7
	.word	0xab302019	! t0_kref+0x1c0c:   	srl	%g0, 0x19, %l5
	.word	0xfa30a004	! t0_kref+0x1c10:   	sth	%i5, [%g2 + 4]
	.word	0xc9380018	! t0_kref+0x1c14:   	std	%f4, [%g0 + %i0]
	.word	0xa932800a	! t0_kref+0x1c18:   	srl	%o2, %o2, %l4
	.word	0xae5b4016	! t0_kref+0x1c1c:   	smul	%o5, %l6, %l7
	.word	0xd83e401d	! t0_kref+0x1c20:   	std	%o4, [%i1 + %i5]
	.word	0xa6dd001a	! t0_kref+0x1c24:   	smulcc	%l4, %i2, %l3
	.word	0xaed50009	! t0_kref+0x1c28:   	umulcc	%l4, %o1, %l7
	.word	0xa73b2009	! t0_kref+0x1c2c:   	sra	%o4, 0x9, %l3
	.word	0xacd378cc	! t0_kref+0x1c30:   	umulcc	%o5, -0x734, %l6
	.word	0xe8ce101a	! t0_kref+0x1c34:   	ldsba	[%i0 + %i2]0x80, %l4
	.word	0xe168a085	! t0_kref+0x1c38:   	prefetch	%g2 + 0x85, 16
	.word	0xe608a008	! t0_kref+0x1c3c:   	ldub	[%g2 + 8], %l3
	.word	0xb3a0013b	! t0_kref+0x1c40:   	fabss	%f27, %f25
	.word	0x81a8ca24	! t0_kref+0x1c44:   	fcmps	%fcc0, %f3, %f4
	.word	0xa8654016	! t0_kref+0x1c48:   	subc	%l5, %l6, %l4
	.word	0xc36e7ff8	! t0_kref+0x1c4c:   	prefetch	%i1 - 8, 1
	.word	0x8143c000	! t0_kref+0x1c50:   	stbar
	.word	0xecd01019	! t0_kref+0x1c54:   	ldsha	[%g0 + %i1]0x80, %l6
	.word	0xae1ee1b1	! t0_kref+0x1c58:   	xor	%i3, 0x1b1, %l7
	.word	0x21480007	! t0_kref+0x1c5c:   	fbn,a,pt	%fcc0, _kref+0x1c78
	.word	0x9140c000	! t0_kref+0x1c60:   	mov	%asi, %o0
	.word	0xf76e401b	! t0_kref+0x1c64:   	prefetch	%i1 + %i3, 27
	.word	0xaa9f400a	! t0_kref+0x1c68:   	xorcc	%i5, %o2, %l5
	.word	0x81a90a4e	! t0_kref+0x1c6c:   	fcmpd	%fcc0, %f4, %f14
	.word	0xa6d28000	! t0_kref+0x1c70:   	umulcc	%o2, %g0, %l3
	.word	0x22800002	! t0_kref+0x1c74:   	be,a	_kref+0x1c7c
	.word	0xe6062010	! t0_kref+0x1c78:   	ld	[%i0 + 0x10], %l3
	.word	0x81800000	! t0_kref+0x1c7c:   	mov	%g0, %y
	.word	0xae9de95b	! t0_kref+0x1c80:   	xorcc	%l7, 0x95b, %l7
	.word	0xa93f0017	! t0_kref+0x1c84:   	sra	%i4, %l7, %l4
	.word	0xaab3001c	! t0_kref+0x1c88:   	orncc	%o4, %i4, %l5
	.word	0xec480019	! t0_kref+0x1c8c:   	ldsb	[%g0 + %i1], %l6
	.word	0xae2f3c1b	! t0_kref+0x1c90:   	andn	%i4, -0x3e5, %l7
	.word	0xaac2401b	! t0_kref+0x1c94:   	addccc	%o1, %i3, %l5
	.word	0xec163fe8	! t0_kref+0x1c98:   	lduh	[%i0 - 0x18], %l6
	.word	0xaafdad7a	! t0_kref+0x1c9c:   	sdivcc	%l6, 0xd7a, %l5
	.word	0x8da10944	! t0_kref+0x1ca0:   	fmuld	%f4, %f4, %f6
	.word	0xaade8000	! t0_kref+0x1ca4:   	smulcc	%i2, %g0, %l5
	.word	0x86102010	! t0_kref+0x1ca8:   	mov	0x10, %g3
	.word	0x86a0e001	! t0_kref+0x1cac:   	subcc	%g3, 1, %g3
	.word	0x22800009	! t0_kref+0x1cb0:   	be,a	_kref+0x1cd4
	.word	0xefee501b	! t0_kref+0x1cb4:   	prefetcha	%i1 + %i3, 23
	.word	0xc900a038	! t0_kref+0x1cb8:   	ld	[%g2 + 0x38], %f4
	.word	0x32bffffc	! t0_kref+0x1cbc:   	bne,a	_kref+0x1cac
	.word	0x81de0019	! t0_kref+0x1cc0:   	flush	%i0 + %i1
	.word	0x8da01104	! t0_kref+0x1cc4:   	fxtod	%f4, %f6
	.word	0x81ac0a52	! t0_kref+0x1cc8:   	fcmpd	%fcc0, %f16, %f18
	.word	0xc168a047	! t0_kref+0x1ccc:   	prefetch	%g2 + 0x47, 0
	.word	0x9fc10000	! t0_kref+0x1cd0:   	call	%g4
	.word	0x9fa6082b	! t0_kref+0x1cd4:   	fadds	%f24, %f11, %f15
	.word	0x8daa4058	! t0_kref+0x1cd8:   	fmovde	%fcc0, %f24, %f6
	.word	0x36480002	! t0_kref+0x1cdc:   	bge,a,pt	%icc, _kref+0x1ce4
	.word	0xd7064000	! t0_kref+0x1ce0:   	ld	[%i1], %f11
	.word	0xea4e001a	! t0_kref+0x1ce4:   	ldsb	[%i0 + %i2], %l5
	.word	0xa622400b	! t0_kref+0x1ce8:   	sub	%o1, %o3, %l3
	.word	0xc020a024	! t0_kref+0x1cec:   	clr	[%g2 + 0x24]
	.word	0xc168a041	! t0_kref+0x1cf0:   	prefetch	%g2 + 0x41, 0
	.word	0x86102004	! t0_kref+0x1cf4:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x1cf8:   	bne,a	_kref+0x1cf8
	.word	0x86a0e001	! t0_kref+0x1cfc:   	subcc	%g3, 1, %g3
	.word	0xa8a5782d	! t0_kref+0x1d00:   	subcc	%l5, -0x7d3, %l4
	.word	0x81dc4012	! t0_kref+0x1d04:   	flush	%l1 + %l2
	.word	0xe7ee501a	! t0_kref+0x1d08:   	prefetcha	%i1 + %i2, 19
	.word	0xac5f3602	! t0_kref+0x1d0c:   	smul	%i4, -0x9fe, %l6
	.word	0x81adca35	! t0_kref+0x1d10:   	fcmps	%fcc0, %f23, %f21
	.word	0x20480006	! t0_kref+0x1d14:   	bn,a,pt	%icc, _kref+0x1d2c
	.word	0xc0267fe4	! t0_kref+0x1d18:   	clr	[%i1 - 0x1c]
	.word	0xd230a038	! t0_kref+0x1d1c:   	sth	%o1, [%g2 + 0x38]
	.word	0xa842bb1f	! t0_kref+0x1d20:   	addc	%o2, -0x4e1, %l4
	.word	0x81db0005	! t0_kref+0x1d24:   	flush	%o4 + %g5
	.word	0xaeb6c008	! t0_kref+0x1d28:   	orncc	%i3, %o0, %l7
	.word	0xac922e53	! t0_kref+0x1d2c:   	orcc	%o0, 0xe53, %l6
	.word	0xaaf80015	! t0_kref+0x1d30:   	sdivcc	%g0, %l5, %l5
	.word	0xea0e0000	! t0_kref+0x1d34:   	ldub	[%i0], %l5
	.word	0xe84e401a	! t0_kref+0x1d38:   	ldsb	[%i1 + %i2], %l4
	.word	0xe4fe1000	! t0_kref+0x1d3c:   	swapa	[%i0]0x80, %l2
	.word	0xaae5400d	! t0_kref+0x1d40:   	subccc	%l5, %o5, %l5
	.word	0xaab00009	! t0_kref+0x1d44:   	orncc	%g0, %o1, %l5
	.word	0xa1a409c6	! t0_kref+0x1d48:   	fdivd	%f16, %f6, %f16
	.word	0x81a9ca26	! t0_kref+0x1d4c:   	fcmps	%fcc0, %f7, %f6
	.word	0xd008a023	! t0_kref+0x1d50:   	ldub	[%g2 + 0x23], %o0
	.word	0xaa47401a	! t0_kref+0x1d54:   	addc	%i5, %i2, %l5
	.word	0xb9a248b8	! t0_kref+0x1d58:   	fsubs	%f9, %f24, %f28
	.word	0xaa5261d6	! t0_kref+0x1d5c:   	umul	%o1, 0x1d6, %l5
	.word	0x90d5a2e4	! t0_kref+0x1d60:   	umulcc	%l6, 0x2e4, %o0
	.word	0xc9be5889	! t0_kref+0x1d64:   	stda	%f4, [%i1 + %o1]0xc4
	.word	0x900ded39	! t0_kref+0x1d68:   	and	%l7, 0xd39, %o0
	sethi	%hi(2f), %o7
	.word	0xe40be1b8	! t0_kref+0x1d70:   	ldub	[%o7 + 0x1b8], %l2
	.word	0xa41ca00c	! t0_kref+0x1d74:   	xor	%l2, 0xc, %l2
	.word	0xe42be1b8	! t0_kref+0x1d78:   	stb	%l2, [%o7 + 0x1b8]
	.word	0x81dbe1b8	! t0_kref+0x1d7c:   	flush	%o7 + 0x1b8
	.word	0xc9beda19	! t0_kref+0x1d80:   	stda	%f4, [%i3 + %i1]0xd0
	.word	0x2930edbe	! t0_kref+0x1d84:   	sethi	%hi(0xc3b6f800), %l4
	.word	0xd4b81018	! t0_kref+0x1d88:   	stda	%o2, [%g0 + %i0]0x80
	.word	0x26800002	! t0_kref+0x1d8c:   	bl,a	_kref+0x1d94
	.word	0xa3a01a48	! t0_kref+0x1d90:   	fdtoi	%f8, %f17
	.word	0xd8a01019	! t0_kref+0x1d94:   	sta	%o4, [%g0 + %i1]0x80
	.word	0xa9a54d30	! t0_kref+0x1d98:   	fsmuld	%f21, %f16, %f20
	.word	0xc807bff0	! t0_kref+0x1d9c:   	ld	[%fp - 0x10], %g4
	call	SYM(t0_subr1)
	.word	0x81834000	! t0_kref+0x1da4:   	wr	%o5, %g0, %y
	.word	0xb5a1c837	! t0_kref+0x1da8:   	fadds	%f7, %f23, %f26
	.word	0xf8b61000	! t0_kref+0x1dac:   	stha	%i4, [%i0]0x80
	.word	0x95a80026	! t0_kref+0x1db0:   	fmovsn	%fcc0, %f6, %f10
	.word	0x81ac0a48	! t0_kref+0x1db4:   	fcmpd	%fcc0, %f16, %f8
2:	.word	0xe0200018	! t0_kref+0x1db8:   	st	%l0, [%g0 + %i0]
	.word	0xd220a030	! t0_kref+0x1dbc:   	st	%o1, [%g2 + 0x30]
	.word	0xe16e2008	! t0_kref+0x1dc0:   	prefetch	%i0 + 8, 16
	.word	0xd820a008	! t0_kref+0x1dc4:   	st	%o4, [%g2 + 8]
	.word	0xa5a01890	! t0_kref+0x1dc8:   	fitos	%f16, %f18
	.word	0xae8a6539	! t0_kref+0x1dcc:   	andcc	%o1, 0x539, %l7
	.word	0xab2e8015	! t0_kref+0x1dd0:   	sll	%i2, %l5, %l5
	.word	0xaf418000	! t0_kref+0x1dd4:   	mov	%fprs, %l7
	.word	0xe3a71019	! t0_kref+0x1dd8:   	sta	%f17, [%i4 + %i1]0x80
	.word	0x9fa01887	! t0_kref+0x1ddc:   	fitos	%f7, %f15
	.word	0xed3e3ff8	! t0_kref+0x1de0:   	std	%f22, [%i0 - 8]
	.word	0xc768a040	! t0_kref+0x1de4:   	prefetch	%g2 + 0x40, 3
	.word	0xac45ff11	! t0_kref+0x1de8:   	addc	%l7, -0xef, %l6
	.word	0x9de3bfa0	! t0_kref+0x1dec:   	save	%sp, -0x60, %sp
	.word	0xb8be401c	! t0_kref+0x1df0:   	xnorcc	%i1, %i4, %i4
	.word	0xabe82cf5	! t0_kref+0x1df4:   	restore	%g0, 0xcf5, %l5
	.word	0x99a14d2a	! t0_kref+0x1df8:   	fsmuld	%f5, %f10, %f12
	.word	0xea4e6010	! t0_kref+0x1dfc:   	ldsb	[%i1 + 0x10], %l5
	.word	0xa6bd7442	! t0_kref+0x1e00:   	xnorcc	%l5, -0xbbe, %l3
	.word	0xaaa23442	! t0_kref+0x1e04:   	subcc	%o0, -0xbbe, %l5
	.word	0xacdd401a	! t0_kref+0x1e08:   	smulcc	%l5, %i2, %l6
	.word	0xaab739be	! t0_kref+0x1e0c:   	orncc	%i4, -0x642, %l5
	.word	0xa8aea1ee	! t0_kref+0x1e10:   	andncc	%i2, 0x1ee, %l4
	sethi	%hi(2f), %o7
	.word	0xe40be24c	! t0_kref+0x1e18:   	ldub	[%o7 + 0x24c], %l2
	.word	0xa41ca00c	! t0_kref+0x1e1c:   	xor	%l2, 0xc, %l2
	.word	0xe42be24c	! t0_kref+0x1e20:   	stb	%l2, [%o7 + 0x24c]
	.word	0x81dbe24c	! t0_kref+0x1e24:   	flush	%o7 + 0x24c
	.word	0x270d4d43	! t0_kref+0x1e28:   	sethi	%hi(0x35350c00), %l3
	.word	0xa8658014	! t0_kref+0x1e2c:   	subc	%l6, %l4, %l4
	.word	0x9055801b	! t0_kref+0x1e30:   	umul	%l6, %i3, %o0
	.word	0xa9a58d35	! t0_kref+0x1e34:   	fsmuld	%f22, %f21, %f20
	.word	0x9fc00004	! t0_kref+0x1e38:   	call	%g0 + %g4
	.word	0xe808a038	! t0_kref+0x1e3c:   	ldub	[%g2 + 0x38], %l4
	.word	0xc9ee5000	! t0_kref+0x1e40:   	prefetcha	%i1, 4
	.word	0xaa7b0009	! t0_kref+0x1e44:   	sdiv	%o4, %o1, %l5
	.word	0x81de800a	! t0_kref+0x1e48:   	flush	%i2 + %o2
2:	.word	0x89a0003a	! t0_kref+0x1e4c:   	fmovs	%f26, %f4
	.word	0xaa53400c	! t0_kref+0x1e50:   	umul	%o5, %o4, %l5
	.word	0xe840a00c	! t0_kref+0x1e54:   	ldsw	[%g2 + 0xc], %l4
	.word	0xab3ea014	! t0_kref+0x1e58:   	sra	%i2, 0x14, %l5
	.word	0xaa424017	! t0_kref+0x1e5c:   	addc	%o1, %l7, %l5
	.word	0x2e480006	! t0_kref+0x1e60:   	bvs,a,pt	%icc, _kref+0x1e78
	.word	0xa8474016	! t0_kref+0x1e64:   	addc	%i5, %l6, %l4
	.word	0xea4e001a	! t0_kref+0x1e68:   	ldsb	[%i0 + %i2], %l5
	.word	0xee0e2001	! t0_kref+0x1e6c:   	ldub	[%i0 + 1], %l7
	.word	0xe168a04f	! t0_kref+0x1e70:   	prefetch	%g2 + 0x4f, 16
	.word	0xec4e6011	! t0_kref+0x1e74:   	ldsb	[%i1 + 0x11], %l6
	.word	0x2d0a4df9	! t0_kref+0x1e78:   	sethi	%hi(0x2937e400), %l6
	.word	0x9fc10000	! t0_kref+0x1e7c:   	call	%g4
	.word	0xd820a01c	! t0_kref+0x1e80:   	st	%o4, [%g2 + 0x1c]
	.word	0x36800001	! t0_kref+0x1e84:   	bge,a	_kref+0x1e88
	.word	0xaf1ac01d	! t0_kref+0x1e88:   	tsubcctv	%o3, %i5, %l7
	.word	0x81854000	! t0_kref+0x1e8c:   	wr	%l5, %g0, %y
	.word	0xd46e2011	! t0_kref+0x1e90:   	ldstub	[%i0 + 0x11], %o2
	.word	0x81858000	! t0_kref+0x1e94:   	wr	%l6, %g0, %y
	.word	0xa7400000	! t0_kref+0x1e98:   	mov	%y, %l3
	.word	0xaba10936	! t0_kref+0x1e9c:   	fmuls	%f4, %f22, %f21
	.word	0xa8fec008	! t0_kref+0x1ea0:   	sdivcc	%i3, %o0, %l4
	.word	0xea68a00a	! t0_kref+0x1ea4:   	ldstub	[%g2 + 0xa], %l5
	.word	0xe4e81018	! t0_kref+0x1ea8:   	ldstuba	[%g0 + %i0]0x80, %l2
	.word	0x9da00158	! t0_kref+0x1eac:   	fabsd	%f24, %f14
	.word	0xe3b8a040	! t0_kref+0x1eb0:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x27156b5c	! t0_kref+0x1eb4:   	sethi	%hi(0x55ad7000), %l3
	.word	0x37800007	! t0_kref+0x1eb8:   	fbge,a	_kref+0x1ed4
	.word	0x9fa000a7	! t0_kref+0x1ebc:   	fnegs	%f7, %f15
	.word	0x3d480003	! t0_kref+0x1ec0:   	fbule,a,pt	%fcc0, _kref+0x1ecc
	.word	0xd9be181d	! t0_kref+0x1ec4:   	stda	%f12, [%i0 + %i5]0xc0
	.word	0x97a00123	! t0_kref+0x1ec8:   	fabss	%f3, %f11
	.word	0x89a01895	! t0_kref+0x1ecc:   	fitos	%f21, %f4
	.word	0xd8fe5000	! t0_kref+0x1ed0:   	swapa	[%i1]0x80, %o4
	.word	0xf96e401a	! t0_kref+0x1ed4:   	prefetch	%i1 + %i2, 28
	.word	0xaaa0264b	! t0_kref+0x1ed8:   	subcc	%g0, 0x64b, %l5
	.word	0x87a288ad	! t0_kref+0x1edc:   	fsubs	%f10, %f13, %f3
	.word	0xafa0053a	! t0_kref+0x1ee0:   	fsqrts	%f26, %f23
	.word	0x81aa8a4c	! t0_kref+0x1ee4:   	fcmpd	%fcc0, %f10, %f12
	.word	0xdd06001c	! t0_kref+0x1ee8:   	ld	[%i0 + %i4], %f14
	.word	0xc16e4000	! t0_kref+0x1eec:   	prefetch	%i1, 0
	.word	0xe3b8a040	! t0_kref+0x1ef0:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x81ae4a2d	! t0_kref+0x1ef4:   	fcmps	%fcc0, %f25, %f13
	.word	0xaba1c8b6	! t0_kref+0x1ef8:   	fsubs	%f7, %f22, %f21
	.word	0x8ba0013a	! t0_kref+0x1efc:   	fabss	%f26, %f5
	.word	0xe5063ff0	! t0_kref+0x1f00:   	ld	[%i0 - 0x10], %f18
	.word	0xda6e200b	! t0_kref+0x1f04:   	ldstub	[%i0 + 0xb], %o5
	.word	0xae7525e3	! t0_kref+0x1f08:   	udiv	%l4, 0x5e3, %l7
	.word	0x87a5c8b3	! t0_kref+0x1f0c:   	fsubs	%f23, %f19, %f3
	.word	0x90000017	! t0_kref+0x1f10:   	add	%g0, %l7, %o0
	.word	0x9140c000	! t0_kref+0x1f14:   	mov	%asi, %o0
	.word	0x81de400f	! t0_kref+0x1f18:   	flush	%i1 + %o7
	.word	0xaaa2f7bf	! t0_kref+0x1f1c:   	subcc	%o3, -0x841, %l5
	.word	0xa8368015	! t0_kref+0x1f20:   	orn	%i2, %l5, %l4
	.word	0xc9380018	! t0_kref+0x1f24:   	std	%f4, [%g0 + %i0]
	.word	0xa6957d3e	! t0_kref+0x1f28:   	orcc	%l5, -0x2c2, %l3
	.word	0xaa9a6341	! t0_kref+0x1f2c:   	xorcc	%o1, 0x341, %l5
	.word	0x8da4c8ba	! t0_kref+0x1f30:   	fsubs	%f19, %f26, %f6
	.word	0xad2b000c	! t0_kref+0x1f34:   	sll	%o4, %o4, %l6
	.word	0xd66e8018	! t0_kref+0x1f38:   	ldstub	[%i2 + %i0], %o3
	.word	0xd7a6501c	! t0_kref+0x1f3c:   	sta	%f11, [%i1 + %i4]0x80
	.word	0xe9ee501a	! t0_kref+0x1f40:   	prefetcha	%i1 + %i2, 20
	.word	0x2f098314	! t0_kref+0x1f44:   	sethi	%hi(0x260c5000), %l7
	.word	0xa6ff4009	! t0_kref+0x1f48:   	sdivcc	%i5, %o1, %l3
	.word	0xec560000	! t0_kref+0x1f4c:   	ldsh	[%i0], %l6
	.word	0xaa5e801d	! t0_kref+0x1f50:   	smul	%i2, %i5, %l5
	.word	0xaa9a2aa1	! t0_kref+0x1f54:   	xorcc	%o0, 0xaa1, %l5
	.word	0xa88d8016	! t0_kref+0x1f58:   	andcc	%l6, %l6, %l4
	.word	0x913d401c	! t0_kref+0x1f5c:   	sra	%l5, %i4, %o0
	.word	0xacada7e1	! t0_kref+0x1f60:   	andncc	%l6, 0x7e1, %l6
	.word	0xaaaf000d	! t0_kref+0x1f64:   	andncc	%i4, %o5, %l5
	.word	0x34480006	! t0_kref+0x1f68:   	bg,a,pt	%icc, _kref+0x1f80
	.word	0xb7a4c9a8	! t0_kref+0x1f6c:   	fdivs	%f19, %f8, %f27
	.word	0x81db6ba2	! t0_kref+0x1f70:   	flush	%o5 + 0xba2
	.word	0xb7a68833	! t0_kref+0x1f74:   	fadds	%f26, %f19, %f27
	.word	0xaa52fb98	! t0_kref+0x1f78:   	umul	%o3, -0x468, %l5
	.word	0x900578c9	! t0_kref+0x1f7c:   	add	%l5, -0x737, %o0
	.word	0xa3a018d8	! t0_kref+0x1f80:   	fdtos	%f24, %f17
	.word	0xea06001c	! t0_kref+0x1f84:   	ld	[%i0 + %i4], %l5
	.word	0xd27f0019	! t0_kref+0x1f88:   	swap	[%i4 + %i1], %o1
	.word	0xac927ff2	! t0_kref+0x1f8c:   	orcc	%o1, -0xe, %l6
	.word	0x9046b7dd	! t0_kref+0x1f90:   	addc	%i2, -0x823, %o0
	.word	0xe96e401b	! t0_kref+0x1f94:   	prefetch	%i1 + %i3, 20
	.word	0x22800003	! t0_kref+0x1f98:   	be,a	_kref+0x1fa4
	.word	0xac37382c	! t0_kref+0x1f9c:   	orn	%i4, -0x7d4, %l6
	.word	0xec163ffa	! t0_kref+0x1fa0:   	lduh	[%i0 - 6], %l6
	.word	0xd0200019	! t0_kref+0x1fa4:   	st	%o0, [%g0 + %i1]
	.word	0xaf3ae01b	! t0_kref+0x1fa8:   	sra	%o3, 0x1b, %l7
	.word	0x9da309c4	! t0_kref+0x1fac:   	fdivd	%f12, %f4, %f14
	.word	0xa8fb4017	! t0_kref+0x1fb0:   	sdivcc	%o5, %l7, %l4
	.word	0xea28a033	! t0_kref+0x1fb4:   	stb	%l5, [%g2 + 0x33]
	.word	0xa7a00026	! t0_kref+0x1fb8:   	fmovs	%f6, %f19
	.word	0xacdebe56	! t0_kref+0x1fbc:   	smulcc	%i2, -0x1aa, %l6
	.word	0x905a7d22	! t0_kref+0x1fc0:   	smul	%o1, -0x2de, %o0
	.word	0xb5a20d24	! t0_kref+0x1fc4:   	fsmuld	%f8, %f4, %f26
	.word	0xb1a01a37	! t0_kref+0x1fc8:   	fstoi	%f23, %f24
	.word	0x8fa388a7	! t0_kref+0x1fcc:   	fsubs	%f14, %f7, %f7
	.word	0xa663627b	! t0_kref+0x1fd0:   	subc	%o5, 0x27b, %l3
	.word	0xee100019	! t0_kref+0x1fd4:   	lduh	[%g0 + %i1], %l7
	.word	0xa5a60848	! t0_kref+0x1fd8:   	faddd	%f24, %f8, %f18
	.word	0xd096d019	! t0_kref+0x1fdc:   	lduha	[%i3 + %i1]0x80, %o0
	.word	0xd06e001a	! t0_kref+0x1fe0:   	ldstub	[%i0 + %i2], %o0
	.word	0xd43e0000	! t0_kref+0x1fe4:   	std	%o2, [%i0]
	.word	0x8da01903	! t0_kref+0x1fe8:   	fitod	%f3, %f6
	.word	0xd228a02d	! t0_kref+0x1fec:   	stb	%o1, [%g2 + 0x2d]
	.word	0xacba4015	! t0_kref+0x1ff0:   	xnorcc	%o1, %l5, %l6
	.word	0xa5a68842	! t0_kref+0x1ff4:   	faddd	%f26, %f2, %f18
	.word	0xd04e0000	! t0_kref+0x1ff8:   	ldsb	[%i0], %o0
	.word	0xb7a00027	! t0_kref+0x1ffc:   	fmovs	%f7, %f27
	.word	0xaf418000	! t0_kref+0x2000:   	mov	%fprs, %l7
	.word	0x8fa288ba	! t0_kref+0x2004:   	fsubs	%f10, %f26, %f7
	.word	0x2c480006	! t0_kref+0x2008:   	bneg,a,pt	%icc, _kref+0x2020
	.word	0xae5a7d3b	! t0_kref+0x200c:   	smul	%o1, -0x2c5, %l7
	.word	0xa8177cae	! t0_kref+0x2010:   	or	%i5, -0x352, %l4
	.word	0xaa98001a	! t0_kref+0x2014:   	xorcc	%g0, %i2, %l5
	.word	0xe9be1a1c	! t0_kref+0x2018:   	stda	%f20, [%i0 + %i4]0xd0
	.word	0xaefb76d2	! t0_kref+0x201c:   	sdivcc	%o5, -0x92e, %l7
	.word	0xa5a00537	! t0_kref+0x2020:   	fsqrts	%f23, %f18
	.word	0xf53e0000	! t0_kref+0x2024:   	std	%f26, [%i0]
	.word	0x8143e011	! t0_kref+0x2028:   	membar	0x11
	.word	0xaea72bc4	! t0_kref+0x202c:   	subcc	%i4, 0xbc4, %l7
	.word	0xaef83887	! t0_kref+0x2030:   	sdivcc	%g0, -0x779, %l7
	.word	0xaada29cb	! t0_kref+0x2034:   	smulcc	%o0, 0x9cb, %l5
	.word	0xac32800b	! t0_kref+0x2038:   	orn	%o2, %o3, %l6
	.word	0x905b7ed4	! t0_kref+0x203c:   	smul	%o5, -0x12c, %o0
	.word	0xe84e8019	! t0_kref+0x2040:   	ldsb	[%i2 + %i1], %l4
	.word	0xec0e3fed	! t0_kref+0x2044:   	ldub	[%i0 - 0x13], %l6
	.word	0xd056600a	! t0_kref+0x2048:   	ldsh	[%i1 + 0xa], %o0
	.word	0xa8fa24fd	! t0_kref+0x204c:   	sdivcc	%o0, 0x4fd, %l4
	.word	0x95a30d2e	! t0_kref+0x2050:   	fsmuld	%f12, %f14, %f10
	.word	0xb5a10856	! t0_kref+0x2054:   	faddd	%f4, %f22, %f26
	.word	0xea5e7ff0	! t0_kref+0x2058:   	ldx	[%i1 - 0x10], %l5
	.word	0xd828a023	! t0_kref+0x205c:   	stb	%o4, [%g2 + 0x23]
	.word	0x99a01913	! t0_kref+0x2060:   	fitod	%f19, %f12
	.word	0xaa327533	! t0_kref+0x2064:   	orn	%o1, -0xacd, %l5
	.word	0x81da8012	! t0_kref+0x2068:   	flush	%o2 + %l2
	.word	0xed3e6010	! t0_kref+0x206c:   	std	%f22, [%i1 + 0x10]
	.word	0xe808a035	! t0_kref+0x2070:   	ldub	[%g2 + 0x35], %l4
	.word	0xaefb0000	! t0_kref+0x2074:   	sdivcc	%o4, %g0, %l7
	.word	0x91a3cd26	! t0_kref+0x2078:   	fsmuld	%f15, %f6, %f8
	.word	0x81ab0a2d	! t0_kref+0x207c:   	fcmps	%fcc0, %f12, %f13
	.word	0xa90f4009	! t0_kref+0x2080:   	tsubcc	%i5, %o1, %l4
	.word	0xa3a0053a	! t0_kref+0x2084:   	fsqrts	%f26, %f17
	.word	0x8143c000	! t0_kref+0x2088:   	stbar
	.word	0xece81019	! t0_kref+0x208c:   	ldstuba	[%g0 + %i1]0x80, %l6
	.word	0xdbe6501a	! t0_kref+0x2090:   	casa	[%i1]0x80, %i2, %o5
	.word	0xae7ee8cb	! t0_kref+0x2094:   	sdiv	%i3, 0x8cb, %l7
	.word	0x9de3bfa0	! t0_kref+0x2098:   	save	%sp, -0x60, %sp
	.word	0xb6be8018	! t0_kref+0x209c:   	xnorcc	%i2, %i0, %i3
	.word	0xa7e839c9	! t0_kref+0x20a0:   	restore	%g0, -0x637, %l3
	.word	0xaf702cf2	! t0_kref+0x20a4:   	popc	0xcf2, %l7
	.word	0xafa0012e	! t0_kref+0x20a8:   	fabss	%f14, %f23
	.word	0x9fc00004	! t0_kref+0x20ac:   	call	%g0 + %g4
	.word	0xb9a50856	! t0_kref+0x20b0:   	faddd	%f20, %f22, %f28
	.word	0xaadb000a	! t0_kref+0x20b4:   	smulcc	%o4, %o2, %l5
	.word	0x89a80048	! t0_kref+0x20b8:   	fmovdn	%fcc0, %f8, %f4
	.word	0x32480003	! t0_kref+0x20bc:   	bne,a,pt	%icc, _kref+0x20c8
	.word	0xad0a23c0	! t0_kref+0x20c0:   	tsubcc	%o0, 0x3c0, %l6
	.word	0xa62a0000	! t0_kref+0x20c4:   	andn	%o0, %g0, %l3
	.word	0x91a20d2a	! t0_kref+0x20c8:   	fsmuld	%f8, %f10, %f8
	.word	0x2e480001	! t0_kref+0x20cc:   	bvs,a,pt	%icc, _kref+0x20d0
	.word	0xac753daa	! t0_kref+0x20d0:   	udiv	%l4, -0x256, %l6
	.word	0xae7dc01c	! t0_kref+0x20d4:   	sdiv	%l7, %i4, %l7
	.word	0x91a20948	! t0_kref+0x20d8:   	fmuld	%f8, %f8, %f8
	.word	0xad2a2008	! t0_kref+0x20dc:   	sll	%o0, 0x8, %l6
	.word	0xa1a3492a	! t0_kref+0x20e0:   	fmuls	%f13, %f10, %f16
	.word	0x87a018da	! t0_kref+0x20e4:   	fdtos	%f26, %f3
	.word	0xee56c019	! t0_kref+0x20e8:   	ldsh	[%i3 + %i1], %l7
	.word	0x91a00130	! t0_kref+0x20ec:   	fabss	%f16, %f8
	.word	0xe84e4000	! t0_kref+0x20f0:   	ldsb	[%i1], %l4
	.word	0xac7a800b	! t0_kref+0x20f4:   	sdiv	%o2, %o3, %l6
	.word	0x8fa109a6	! t0_kref+0x20f8:   	fdivs	%f4, %f6, %f7
	.word	0xe47e3fe4	! t0_kref+0x20fc:   	swap	[%i0 - 0x1c], %l2
	.word	0x91376018	! t0_kref+0x2100:   	srl	%i5, 0x18, %o0
	.word	0xa643773d	! t0_kref+0x2104:   	addc	%o5, -0x8c3, %l3
	.word	0xa940c000	! t0_kref+0x2108:   	mov	%asi, %l4
	.word	0xe36e001c	! t0_kref+0x210c:   	prefetch	%i0 + %i4, 17
	.word	0x81aa8a5c	! t0_kref+0x2110:   	fcmpd	%fcc0, %f10, %f28
	.word	0xf5a6501c	! t0_kref+0x2114:   	sta	%f26, [%i1 + %i4]0x80
	.word	0xf007bfe0	! t0_kref+0x2118:   	ld	[%fp - 0x20], %i0
	.word	0xe6e81019	! t0_kref+0x211c:   	ldstuba	[%g0 + %i1]0x80, %l3
	.word	0x81a90a3b	! t0_kref+0x2120:   	fcmps	%fcc0, %f4, %f27
	.word	0xada1c825	! t0_kref+0x2124:   	fadds	%f7, %f5, %f22
	.word	0xa89ac009	! t0_kref+0x2128:   	xorcc	%o3, %o1, %l4
	.word	0xa8f80008	! t0_kref+0x212c:   	sdivcc	%g0, %o0, %l4
	.word	0xada2c9b3	! t0_kref+0x2130:   	fdivs	%f11, %f19, %f22
	.word	0xea0e4000	! t0_kref+0x2134:   	ldub	[%i1], %l5
	.word	0xab408000	! t0_kref+0x2138:   	mov	%ccr, %l5
	.word	0xdf063ff4	! t0_kref+0x213c:   	ld	[%i0 - 0xc], %f15
	.word	0xa1a01025	! t0_kref+0x2140:   	fstox	%f5, %f16
	.word	0xe84e6012	! t0_kref+0x2144:   	ldsb	[%i1 + 0x12], %l4
	.word	0xdd3e7fe0	! t0_kref+0x2148:   	std	%f14, [%i1 - 0x20]
	.word	0x81ac0a56	! t0_kref+0x214c:   	fcmpd	%fcc0, %f16, %f22
	.word	0xb5a30842	! t0_kref+0x2150:   	faddd	%f12, %f2, %f26
	.word	0x89a01906	! t0_kref+0x2154:   	fitod	%f6, %f4
	.word	0xa5a0190e	! t0_kref+0x2158:   	fitod	%f14, %f18
	.word	0x9da64d25	! t0_kref+0x215c:   	fsmuld	%f25, %f5, %f14
	.word	0xe8070018	! t0_kref+0x2160:   	ld	[%i4 + %i0], %l4
	.word	0x81de0016	! t0_kref+0x2164:   	flush	%i0 + %l6
	.word	0x81ae8a46	! t0_kref+0x2168:   	fcmpd	%fcc0, %f26, %f6
	.word	0x81aeca27	! t0_kref+0x216c:   	fcmps	%fcc0, %f27, %f7
	.word	0x8ba00128	! t0_kref+0x2170:   	fabss	%f8, %f5
	.word	0x110c15d7	! t0_kref+0x2174:   	sethi	%hi(0x30575c00), %o0
	.word	0xaaa00014	! t0_kref+0x2178:   	subcc	%g0, %l4, %l5
	.word	0xf1be5000	! t0_kref+0x217c:   	stda	%f24, [%i1]0x80
	.word	0xd026401c	! t0_kref+0x2180:   	st	%o0, [%i1 + %i4]
	.word	0x9fc00004	! t0_kref+0x2184:   	call	%g0 + %g4
	.word	0xa5a0004c	! t0_kref+0x2188:   	fmovd	%f12, %f18
	call	SYM(t0_subr0)
	.word	0xa806aae2	! t0_kref+0x2190:   	add	%i2, 0xae2, %l4
	.word	0x905aa6c7	! t0_kref+0x2194:   	smul	%o2, 0x6c7, %o0
	.word	0xd13e6008	! t0_kref+0x2198:   	std	%f8, [%i1 + 8]
	.word	0xac60001b	! t0_kref+0x219c:   	subc	%g0, %i3, %l6
	.word	0xa662f8d8	! t0_kref+0x21a0:   	subc	%o3, -0x728, %l3
	.word	0x9de3bfa0	! t0_kref+0x21a4:   	save	%sp, -0x60, %sp
	.word	0xb1064018	! t0_kref+0x21a8:   	taddcc	%i1, %i0, %i0
	.word	0xa7ef001a	! t0_kref+0x21ac:   	restore	%i4, %i2, %l3
	.word	0xec563fea	! t0_kref+0x21b0:   	ldsh	[%i0 - 0x16], %l6
	.word	0xe76e7fe8	! t0_kref+0x21b4:   	prefetch	%i1 - 0x18, 19
	.word	0xf9264000	! t0_kref+0x21b8:   	st	%f28, [%i1]
	.word	0xb7a00527	! t0_kref+0x21bc:   	fsqrts	%f7, %f27
	.word	0xec0e4000	! t0_kref+0x21c0:   	ldub	[%i1], %l6
	.word	0xc1beda58	! t0_kref+0x21c4:   	stda	%f0, [%i3 + %i0]0xd2
	.word	0x9ba308aa	! t0_kref+0x21c8:   	fsubs	%f12, %f10, %f13
	.word	0xb9a0012e	! t0_kref+0x21cc:   	fabss	%f14, %f28
	.word	0xae073474	! t0_kref+0x21d0:   	add	%i4, -0xb8c, %l7
	call	SYM(t0_subr0)
	.word	0x99a60935	! t0_kref+0x21d8:   	fmuls	%f24, %f21, %f12
	.word	0xe656401b	! t0_kref+0x21dc:   	ldsh	[%i1 + %i3], %l3
	.word	0xac9f7c6f	! t0_kref+0x21e0:   	xorcc	%i5, -0x391, %l6
	.word	0xaafaa588	! t0_kref+0x21e4:   	sdivcc	%o2, 0x588, %l5
	.word	0xfaa65000	! t0_kref+0x21e8:   	sta	%i5, [%i1]0x80
	.word	0xeb68a047	! t0_kref+0x21ec:   	prefetch	%g2 + 0x47, 21
	.word	0x2c800001	! t0_kref+0x21f0:   	bneg,a	_kref+0x21f4
	.word	0xf53e3ff8	! t0_kref+0x21f4:   	std	%f26, [%i0 - 8]
	.word	0xae5d400d	! t0_kref+0x21f8:   	smul	%l5, %o5, %l7
	.word	0xe87e7fe0	! t0_kref+0x21fc:   	swap	[%i1 - 0x20], %l4
	.word	0xe168a08e	! t0_kref+0x2200:   	prefetch	%g2 + 0x8e, 16
	.word	0xacb6bf15	! t0_kref+0x2204:   	orncc	%i2, -0xeb, %l6
	.word	0xb5a4492b	! t0_kref+0x2208:   	fmuls	%f17, %f11, %f26
	.word	0x9fc10000	! t0_kref+0x220c:   	call	%g4
	.word	0xb1a50956	! t0_kref+0x2210:   	fmuld	%f20, %f22, %f24
	.word	0x90ade3ac	! t0_kref+0x2214:   	andncc	%l7, 0x3ac, %o0
	.word	0xa85ec01d	! t0_kref+0x2218:   	smul	%i3, %i5, %l4
	.word	0xace6e7e2	! t0_kref+0x221c:   	subccc	%i3, 0x7e2, %l6
	.word	0x2f480001	! t0_kref+0x2220:   	fbu,a,pt	%fcc0, _kref+0x2224
	.word	0xac3b765b	! t0_kref+0x2224:   	xnor	%o5, -0x9a5, %l6
	.word	0xe656c019	! t0_kref+0x2228:   	ldsh	[%i3 + %i1], %l3
	.word	0xaadb630e	! t0_kref+0x222c:   	smulcc	%o5, 0x30e, %l5
	.word	0xa878000b	! t0_kref+0x2230:   	sdiv	%g0, %o3, %l4
	.word	0xae0f000c	! t0_kref+0x2234:   	and	%i4, %o4, %l7
	.word	0xe6480018	! t0_kref+0x2238:   	ldsb	[%g0 + %i0], %l3
	.word	0xd83e4000	! t0_kref+0x223c:   	std	%o4, [%i1]
	.word	0xa8a76235	! t0_kref+0x2240:   	subcc	%i5, 0x235, %l4
	.word	0xa7400000	! t0_kref+0x2244:   	mov	%y, %l3
	.word	0x95a5c8b7	! t0_kref+0x2248:   	fsubs	%f23, %f23, %f10
	.word	0x9da01914	! t0_kref+0x224c:   	fitod	%f20, %f14
	.word	0x30480001	! t0_kref+0x2250:   	ba,a,pt	%icc, _kref+0x2254
	.word	0x272628b4	! t0_kref+0x2254:   	sethi	%hi(0x98a2d000), %l3
	.word	0xf7067ff4	! t0_kref+0x2258:   	ld	[%i1 - 0xc], %f27
	.word	0x81aa8a46	! t0_kref+0x225c:   	fcmpd	%fcc0, %f10, %f6
	.word	0xd900a03c	! t0_kref+0x2260:   	ld	[%g2 + 0x3c], %f12
	.word	0x905e801c	! t0_kref+0x2264:   	smul	%i2, %i4, %o0
	.word	0xd900a004	! t0_kref+0x2268:   	ld	[%g2 + 4], %f12
	sethi	%hi(1f), %o7
	jmpl	%o7+%lo(1f), %g1
	.empty
	.word	0x81dec015	! t0_kref+0x2274:   	flush	%i3 + %l5
	.word	0xec30a036	! t0_kref+0x2278:   	sth	%l6, [%g2 + 0x36]
	.word	0xb1a01914	! t0_kref+0x227c:   	fitod	%f20, %f24
	.word	0xd2a61000	! t0_kref+0x2280:   	sta	%o1, [%i0]0x80
1:	.word	0xee560000	! t0_kref+0x2284:   	ldsh	[%i0], %l7
	.word	0x9de3bfa0	! t0_kref+0x2288:   	save	%sp, -0x60, %sp
	.word	0xadee001d	! t0_kref+0x228c:   	restore	%i0, %i5, %l6
	.word	0x905d317e	! t0_kref+0x2290:   	smul	%l4, -0xe82, %o0
	.word	0xac90292c	! t0_kref+0x2294:   	orcc	%g0, 0x92c, %l6
	.word	0x8da00148	! t0_kref+0x2298:   	fabsd	%f8, %f6
	.word	0x90e5e405	! t0_kref+0x229c:   	subccc	%l7, 0x405, %o0
	.word	0xd04e001a	! t0_kref+0x22a0:   	ldsb	[%i0 + %i2], %o0
	.word	0x33800005	! t0_kref+0x22a4:   	fbe,a	_kref+0x22b8
	.word	0x97a00532	! t0_kref+0x22a8:   	fsqrts	%f18, %f11
	.word	0xae0a6ca3	! t0_kref+0x22ac:   	and	%o1, 0xca3, %l7
	.word	0xa9a0004c	! t0_kref+0x22b0:   	fmovd	%f12, %f20
	.word	0xe87e001c	! t0_kref+0x22b4:   	swap	[%i0 + %i4], %l4
	.word	0xe93e6008	! t0_kref+0x22b8:   	std	%f20, [%i1 + 8]
	.word	0xaa932c74	! t0_kref+0x22bc:   	orcc	%o4, 0xc74, %l5
	.word	0xaf2e8009	! t0_kref+0x22c0:   	sll	%i2, %o1, %l7
	.word	0xec0e6010	! t0_kref+0x22c4:   	ldub	[%i1 + 0x10], %l6
	call	1f
	.empty
	.word	0xa6d24009	! t0_kref+0x22cc:   	umulcc	%o1, %o1, %l3
	.word	0xae9b000a	! t0_kref+0x22d0:   	xorcc	%o4, %o2, %l7
	.word	0xac772af1	! t0_kref+0x22d4:   	udiv	%i4, 0xaf1, %l6
	.word	0x2c480008	! t0_kref+0x22d8:   	bneg,a,pt	%icc, _kref+0x22f8
	.word	0xa9a00023	! t0_kref+0x22dc:   	fmovs	%f3, %f20
1:	.word	0xfbee101b	! t0_kref+0x22e0:   	prefetcha	%i0 + %i3, 29
	.word	0xa6e36806	! t0_kref+0x22e4:   	subccc	%o5, 0x806, %l3
	.word	0x95a00035	! t0_kref+0x22e8:   	fmovs	%f21, %f10
	.word	0xf9ee501a	! t0_kref+0x22ec:   	prefetcha	%i1 + %i2, 28
	.word	0xa73d400a	! t0_kref+0x22f0:   	sra	%l5, %o2, %l3
	.word	0xa6d80014	! t0_kref+0x22f4:   	smulcc	%g0, %l4, %l3
	.word	0x2e800007	! t0_kref+0x22f8:   	bvs,a	_kref+0x2314
	.word	0xac7ac017	! t0_kref+0x22fc:   	sdiv	%o3, %l7, %l6
	.word	0x909b000b	! t0_kref+0x2300:   	xorcc	%o4, %o3, %o0
	.word	0x3a480008	! t0_kref+0x2304:   	bcc,a,pt	%icc, _kref+0x2324
	.word	0xe9064000	! t0_kref+0x2308:   	ld	[%i1], %f20
	.word	0x95a00534	! t0_kref+0x230c:   	fsqrts	%f20, %f10
	.word	0xc12e7fe8	! t0_kref+0x2310:   	st	%fsr, [%i1 - 0x18]
	.word	0x29800004	! t0_kref+0x2314:   	fbl,a	_kref+0x2324
	.word	0xe84e2005	! t0_kref+0x2318:   	ldsb	[%i0 + 5], %l4
	.word	0x81580000	! t0_kref+0x231c:   	flushw
	.word	0xb9a50d38	! t0_kref+0x2320:   	fsmuld	%f20, %f24, %f28
	.word	0x8d8569c8	! t0_kref+0x2324:   	wr	%l5, 0x9c8, %fprs
	.word	0x8143c000	! t0_kref+0x2328:   	stbar
	.word	0xd230a004	! t0_kref+0x232c:   	sth	%o1, [%g2 + 4]
	.word	0xe84e0000	! t0_kref+0x2330:   	ldsb	[%i0], %l4
	.word	0xaad3400a	! t0_kref+0x2334:   	umulcc	%o5, %o2, %l5
	.word	0xa9a50856	! t0_kref+0x2338:   	faddd	%f20, %f22, %f20
	.word	0xefee501a	! t0_kref+0x233c:   	prefetcha	%i1 + %i2, 23
	.word	0xb5a18d35	! t0_kref+0x2340:   	fsmuld	%f6, %f21, %f26
	.word	0xd3f65000	! t0_kref+0x2344:   	casxa	[%i1]0x80, %g0, %o1
	.word	0xaebd765b	! t0_kref+0x2348:   	xnorcc	%l5, -0x9a5, %l7
	.word	0x9de3bfa0	! t0_kref+0x234c:   	save	%sp, -0x60, %sp
	.word	0x91ee4019	! t0_kref+0x2350:   	restore	%i1, %i1, %o0
	.word	0x22800004	! t0_kref+0x2354:   	be,a	_kref+0x2364
	.word	0xee06600c	! t0_kref+0x2358:   	ld	[%i1 + 0xc], %l7
	.word	0x905af122	! t0_kref+0x235c:   	smul	%o3, -0xede, %o0
	.word	0xea10a012	! t0_kref+0x2360:   	lduh	[%g2 + 0x12], %l5
	.word	0xa7a40833	! t0_kref+0x2364:   	fadds	%f16, %f19, %f19
	.word	0x8143c000	! t0_kref+0x2368:   	stbar
	.word	0x91a01058	! t0_kref+0x236c:   	fdtox	%f24, %f8
	.word	0xe6500018	! t0_kref+0x2370:   	ldsh	[%g0 + %i0], %l3
	.word	0x81ab0aad	! t0_kref+0x2374:   	fcmpes	%fcc0, %f12, %f13
	.word	0xecce5000	! t0_kref+0x2378:   	ldsba	[%i1]0x80, %l6
	.word	0xab08001b	! t0_kref+0x237c:   	tsubcc	%g0, %i3, %l5
	.word	0xd00e3fe0	! t0_kref+0x2380:   	ldub	[%i0 - 0x20], %o0
	.word	0x89aa004e	! t0_kref+0x2384:   	fmovda	%fcc0, %f14, %f4
	.word	0xa89e800c	! t0_kref+0x2388:   	xorcc	%i2, %o4, %l4
	.word	0x89a01913	! t0_kref+0x238c:   	fitod	%f19, %f4
	.word	0x81580000	! t0_kref+0x2390:   	flushw
	.word	0x90420017	! t0_kref+0x2394:   	addc	%o0, %l7, %o0
	.word	0xf900a020	! t0_kref+0x2398:   	ld	[%g2 + 0x20], %f28
	.word	0x81a98aa5	! t0_kref+0x239c:   	fcmpes	%fcc0, %f6, %f5
	.word	0x1134e54b	! t0_kref+0x23a0:   	sethi	%hi(0xd3952c00), %o0
	.word	0x95a01088	! t0_kref+0x23a4:   	fxtos	%f8, %f10
	.word	0xb1a6c924	! t0_kref+0x23a8:   	fmuls	%f27, %f4, %f24
	.word	0xa70b6b8d	! t0_kref+0x23ac:   	tsubcc	%o5, 0xb8d, %l3
	.word	0xe53e6000	! t0_kref+0x23b0:   	std	%f18, [%i1]
	.word	0xf8a01018	! t0_kref+0x23b4:   	sta	%i4, [%g0 + %i0]0x80
	.word	0x901eab83	! t0_kref+0x23b8:   	xor	%i2, 0xb83, %o0
	.word	0xa875ea65	! t0_kref+0x23bc:   	udiv	%l7, 0xa65, %l4
	.word	0xadaa0050	! t0_kref+0x23c0:   	fmovda	%fcc0, %f16, %f22
	.word	0x913a600c	! t0_kref+0x23c4:   	sra	%o1, 0xc, %o0
	.word	0xd016c019	! t0_kref+0x23c8:   	lduh	[%i3 + %i1], %o0
	.word	0xaa06c008	! t0_kref+0x23cc:   	add	%i3, %o0, %l5
	.word	0xace2c008	! t0_kref+0x23d0:   	subccc	%o3, %o0, %l6
	.word	0xd8fe5000	! t0_kref+0x23d4:   	swapa	[%i1]0x80, %o4
	.word	0xe4302bfc	! t0_kref+0x23d8:   	sth	%l2, [%g0 + 0xbfc]
	.word	0xb7a5c926	! t0_kref+0x23dc:   	fmuls	%f23, %f6, %f27
	.word	0xee50a006	! t0_kref+0x23e0:   	ldsh	[%g2 + 6], %l7
	.word	0xd99e1a5d	! t0_kref+0x23e4:   	ldda	[%i0 + %i5]0xd2, %f12
	.word	0xee56401b	! t0_kref+0x23e8:   	ldsh	[%i1 + %i3], %l7
	.word	0xf6266018	! t0_kref+0x23ec:   	st	%i3, [%i1 + 0x18]
	.word	0xa60e8008	! t0_kref+0x23f0:   	and	%i2, %o0, %l3
	.word	0xc768a08f	! t0_kref+0x23f4:   	prefetch	%g2 + 0x8f, 3
	.word	0xaafd800a	! t0_kref+0x23f8:   	sdivcc	%l6, %o2, %l5
	.word	0xaed5400b	! t0_kref+0x23fc:   	umulcc	%l5, %o3, %l7
	.word	0x81ad8a54	! t0_kref+0x2400:   	fcmpd	%fcc0, %f22, %f20
	.word	0x81ae4a2b	! t0_kref+0x2404:   	fcmps	%fcc0, %f25, %f11
	.word	0xaa554009	! t0_kref+0x2408:   	umul	%l5, %o1, %l5
	.word	0xe3063fec	! t0_kref+0x240c:   	ld	[%i0 - 0x14], %f17
	.word	0xf9066014	! t0_kref+0x2410:   	ld	[%i1 + 0x14], %f28
	.word	0xda30a022	! t0_kref+0x2414:   	sth	%o5, [%g2 + 0x22]
	.word	0x9de3bfa0	! t0_kref+0x2418:   	save	%sp, -0x60, %sp
	.word	0xba370019	! t0_kref+0x241c:   	orn	%i4, %i1, %i5
	.word	0xadeec019	! t0_kref+0x2420:   	restore	%i3, %i1, %l6
	.word	0x910831c4	! t0_kref+0x2424:   	tsubcc	%g0, -0xe3c, %o0
	.word	0xc168a04d	! t0_kref+0x2428:   	prefetch	%g2 + 0x4d, 0
	.word	0xa7a01a32	! t0_kref+0x242c:   	fstoi	%f18, %f19
	.word	0xe1be5880	! t0_kref+0x2430:   	stda	%f16, [%i1]0xc4
	.word	0xee48a03a	! t0_kref+0x2434:   	ldsb	[%g2 + 0x3a], %l7
	.word	0x270fe46b	! t0_kref+0x2438:   	sethi	%hi(0x3f91ac00), %l3
	.word	0xe600a03c	! t0_kref+0x243c:   	ld	[%g2 + 0x3c], %l3
	.word	0x8ba308b2	! t0_kref+0x2440:   	fsubs	%f12, %f18, %f5
	.word	0x97a000b3	! t0_kref+0x2444:   	fnegs	%f19, %f11
	.word	0xada01915	! t0_kref+0x2448:   	fitod	%f21, %f22
	.word	0xe816c018	! t0_kref+0x244c:   	lduh	[%i3 + %i0], %l4
	.word	0xae583184	! t0_kref+0x2450:   	smul	%g0, -0xe7c, %l7
	.word	0xa896e5d3	! t0_kref+0x2454:   	orcc	%i3, 0x5d3, %l4
	.word	0xa1a5cd2b	! t0_kref+0x2458:   	fsmuld	%f23, %f11, %f16
	.word	0xe6000018	! t0_kref+0x245c:   	ld	[%g0 + %i0], %l3
	.word	0xec167fec	! t0_kref+0x2460:   	lduh	[%i1 - 0x14], %l6
	.word	0xe6562006	! t0_kref+0x2464:   	ldsh	[%i0 + 6], %l3
	.word	0xafa68823	! t0_kref+0x2468:   	fadds	%f26, %f3, %f23
	.word	0x81ad8a4e	! t0_kref+0x246c:   	fcmpd	%fcc0, %f22, %f14
	.word	0xf13e6010	! t0_kref+0x2470:   	std	%f24, [%i1 + 0x10]
	.word	0x9025801d	! t0_kref+0x2474:   	sub	%l6, %i5, %o0
	.word	0xe1981019	! t0_kref+0x2478:   	ldda	[%g0 + %i1]0x80, %f16
	.word	0xab400000	! t0_kref+0x247c:   	mov	%y, %l5
	.word	0xa6623b90	! t0_kref+0x2480:   	subc	%o0, -0x470, %l3
	.word	0xa842801b	! t0_kref+0x2484:   	addc	%o2, %i3, %l4
	.word	0x93a0c929	! t0_kref+0x2488:   	fmuls	%f3, %f9, %f9
	.word	0x81da0012	! t0_kref+0x248c:   	flush	%o0 + %l2
	.word	0x9fc00004	! t0_kref+0x2490:   	call	%g0 + %g4
	.word	0xec070018	! t0_kref+0x2494:   	ld	[%i4 + %i0], %l6
	.word	0x81dff7e1	! t0_kref+0x2498:   	flush	%i7 - 0x81f
	.word	0x001fffff	! t0_kref+0x249c:   	illtrap	0x1fffff
	.word	0xea4e001a	! t0_kref+0x24a0:   	ldsb	[%i0 + %i2], %l5
	.word	0xa5a8804c	! t0_kref+0x24a4:   	fmovdlg	%fcc0, %f12, %f18
	.word	0x2d25f500	! t0_kref+0x24a8:   	sethi	%hi(0x97d40000), %l6
	.word	0x9da7092b	! t0_kref+0x24ac:   	fmuls	%f28, %f11, %f14
	.word	0xa67a6a27	! t0_kref+0x24b0:   	sdiv	%o1, 0xa27, %l3
	.word	0x2e480004	! t0_kref+0x24b4:   	bvs,a,pt	%icc, _kref+0x24c4
	.word	0xaf408000	! t0_kref+0x24b8:   	mov	%ccr, %l7
	.word	0xada00133	! t0_kref+0x24bc:   	fabss	%f19, %f22
	.word	0x2f385e04	! t0_kref+0x24c0:   	sethi	%hi(0xe1781000), %l7
	.word	0xa9a1cd35	! t0_kref+0x24c4:   	fsmuld	%f7, %f21, %f20
	.word	0xa6533b76	! t0_kref+0x24c8:   	umul	%o4, -0x48a, %l3
	.word	0xaf2f4014	! t0_kref+0x24cc:   	sll	%i5, %l4, %l7
	.word	0xaad50015	! t0_kref+0x24d0:   	umulcc	%l4, %l5, %l5
	.word	0xad418000	! t0_kref+0x24d4:   	mov	%fprs, %l6
	.word	0xe6df5019	! t0_kref+0x24d8:   	ldxa	[%i5 + %i1]0x80, %l3
	.word	0x9fa00529	! t0_kref+0x24dc:   	fsqrts	%f9, %f15
	.word	0x3c480006	! t0_kref+0x24e0:   	bpos,a,pt	%icc, _kref+0x24f8
	.word	0x001fffff	! t0_kref+0x24e4:   	illtrap	0x1fffff
	.word	0xaed5801a	! t0_kref+0x24e8:   	umulcc	%l6, %i2, %l7
	.word	0xaa75699e	! t0_kref+0x24ec:   	udiv	%l5, 0x99e, %l5
	.word	0xc36e401d	! t0_kref+0x24f0:   	prefetch	%i1 + %i5, 1
	.word	0xa6954015	! t0_kref+0x24f4:   	orcc	%l5, %l5, %l3
	.word	0xd6b01019	! t0_kref+0x24f8:   	stha	%o3, [%g0 + %i1]0x80
	.word	0xea10a016	! t0_kref+0x24fc:   	lduh	[%g2 + 0x16], %l5
	.word	0x93a01098	! t0_kref+0x2500:   	fxtos	%f24, %f9
	.word	0xaa1d800b	! t0_kref+0x2504:   	xor	%l6, %o3, %l5
	.word	0xf1be5000	! t0_kref+0x2508:   	stda	%f24, [%i1]0x80
	.word	0xd500a008	! t0_kref+0x250c:   	ld	[%g2 + 8], %f10
	.word	0xa8da8017	! t0_kref+0x2510:   	smulcc	%o2, %l7, %l4
	.word	0xe656001b	! t0_kref+0x2514:   	ldsh	[%i0 + %i3], %l3
	.word	0xb3a01886	! t0_kref+0x2518:   	fitos	%f6, %f25
	.word	0x9de3bfa0	! t0_kref+0x251c:   	save	%sp, -0x60, %sp
	.word	0x91eec01d	! t0_kref+0x2520:   	restore	%i3, %i5, %o0
	.word	0xa5a00529	! t0_kref+0x2524:   	fsqrts	%f9, %f18
	.word	0xf19e1a5d	! t0_kref+0x2528:   	ldda	[%i0 + %i5]0xd2, %f24
	.word	0xaa4527fb	! t0_kref+0x252c:   	addc	%l4, 0x7fb, %l5
	.word	0xa68ec01a	! t0_kref+0x2530:   	andcc	%i3, %i2, %l3
	.word	0x8143e040	! t0_kref+0x2534:   	membar	0x40
	.word	0xa82dbf34	! t0_kref+0x2538:   	andn	%l6, -0xcc, %l4
	.word	0xc1ee5000	! t0_kref+0x253c:   	prefetcha	%i1, 0
	.word	0x90fae525	! t0_kref+0x2540:   	sdivcc	%o3, 0x525, %o0
	.word	0xe93e0000	! t0_kref+0x2544:   	std	%f20, [%i0]
	.word	0xea063ff8	! t0_kref+0x2548:   	ld	[%i0 - 8], %l5
	.word	0xaaa76e0c	! t0_kref+0x254c:   	subcc	%i5, 0xe0c, %l5
	.word	0xa65d400d	! t0_kref+0x2550:   	smul	%l5, %o5, %l3
	.word	0xac0b4014	! t0_kref+0x2554:   	and	%o5, %l4, %l6
	.word	0xd0460000	! t0_kref+0x2558:   	ldsw	[%i0], %o0
	.word	0xa6fa001b	! t0_kref+0x255c:   	sdivcc	%o0, %i3, %l3
	.word	0xa6ba673b	! t0_kref+0x2560:   	xnorcc	%o1, 0x73b, %l3
	.word	0x81ddf2b2	! t0_kref+0x2564:   	flush	%l7 - 0xd4e
	.word	0x85a2084a	! t0_kref+0x2568:   	faddd	%f8, %f10, %f2
	.word	0xaf3e8015	! t0_kref+0x256c:   	sra	%i2, %l5, %l7
	.word	0xaedea485	! t0_kref+0x2570:   	smulcc	%i2, 0x485, %l7
	.word	0xcf067ff4	! t0_kref+0x2574:   	ld	[%i1 - 0xc], %f7
	.word	0xac67401c	! t0_kref+0x2578:   	subc	%i5, %i4, %l6
	.word	0x2b12665e	! t0_kref+0x257c:   	sethi	%hi(0x49997800), %l5
	.word	0xa5a60952	! t0_kref+0x2580:   	fmuld	%f24, %f18, %f18
	.word	0x32480008	! t0_kref+0x2584:   	bne,a,pt	%icc, _kref+0x25a4
	.word	0xe300a010	! t0_kref+0x2588:   	ld	[%g2 + 0x10], %f17
	.word	0xae8f001a	! t0_kref+0x258c:   	andcc	%i4, %i2, %l7
	.word	0xaeda223f	! t0_kref+0x2590:   	smulcc	%o0, 0x23f, %l7
	.word	0xaa376e0c	! t0_kref+0x2594:   	orn	%i5, 0xe0c, %l5
	.word	0xaea5c000	! t0_kref+0x2598:   	subcc	%l7, %g0, %l7
	.word	0xacba8015	! t0_kref+0x259c:   	xnorcc	%o2, %l5, %l6
	.word	0xab0d0015	! t0_kref+0x25a0:   	tsubcc	%l4, %l5, %l5
	.word	0xf828a027	! t0_kref+0x25a4:   	stb	%i4, [%g2 + 0x27]
	.word	0x81dec000	! t0_kref+0x25a8:   	flush	%i3
	.word	0xe6080019	! t0_kref+0x25ac:   	ldub	[%g0 + %i1], %l3
	.word	0xa8b76e8c	! t0_kref+0x25b0:   	orncc	%i5, 0xe8c, %l4
	.word	0xec5e001d	! t0_kref+0x25b4:   	ldx	[%i0 + %i5], %l6
	.word	0xa6be8015	! t0_kref+0x25b8:   	xnorcc	%i2, %l5, %l3
	.word	0x81850000	! t0_kref+0x25bc:   	wr	%l4, %g0, %y
	.word	0xb1a38d28	! t0_kref+0x25c0:   	fsmuld	%f14, %f8, %f24
	.word	0xd236c000	! t0_kref+0x25c4:   	sth	%o1, [%i3]
	.word	0x8143c000	! t0_kref+0x25c8:   	stbar
	.word	0x2c480007	! t0_kref+0x25cc:   	bneg,a,pt	%icc, _kref+0x25e8
	.word	0xa7a0052c	! t0_kref+0x25d0:   	fsqrts	%f12, %f19
	.word	0xec56001b	! t0_kref+0x25d4:   	ldsh	[%i0 + %i3], %l6
	.word	0xec00a014	! t0_kref+0x25d8:   	ld	[%g2 + 0x14], %l6
	.word	0xa922f66e	! t0_kref+0x25dc:   	mulscc	%o3, -0x992, %l4
	.word	0xd8a61000	! t0_kref+0x25e0:   	sta	%o4, [%i0]0x80
	.word	0x90feb459	! t0_kref+0x25e4:   	sdivcc	%i2, -0xba7, %o0
	.word	0xd900a010	! t0_kref+0x25e8:   	ld	[%g2 + 0x10], %f12
	.word	0x913ee00c	! t0_kref+0x25ec:   	sra	%i3, 0xc, %o0
	.word	0x27800008	! t0_kref+0x25f0:   	fbul,a	_kref+0x2610
	.word	0x89a01a4a	! t0_kref+0x25f4:   	fdtoi	%f10, %f4
	.word	0xaab80015	! t0_kref+0x25f8:   	xnorcc	%g0, %l5, %l5
	.word	0x90d2800b	! t0_kref+0x25fc:   	umulcc	%o2, %o3, %o0
	.word	0x9056a92b	! t0_kref+0x2600:   	umul	%i2, 0x92b, %o0
	.word	0x39800005	! t0_kref+0x2604:   	fbuge,a	_kref+0x2618
	.word	0xae36c00d	! t0_kref+0x2608:   	orn	%i3, %o5, %l7
	.word	0xcd3e0000	! t0_kref+0x260c:   	std	%f6, [%i0]
	.word	0xeec01018	! t0_kref+0x2610:   	ldswa	[%g0 + %i0]0x80, %l7
	.word	0x28480004	! t0_kref+0x2614:   	bleu,a,pt	%icc, _kref+0x2624
	.word	0x81ddc005	! t0_kref+0x2618:   	flush	%l7 + %g5
	.word	0xb9a24924	! t0_kref+0x261c:   	fmuls	%f9, %f4, %f28
	.word	0x81ae0a4e	! t0_kref+0x2620:   	fcmpd	%fcc0, %f24, %f14
	.word	0xd300a01c	! t0_kref+0x2624:   	ld	[%g2 + 0x1c], %f9
	.word	0xe5a71019	! t0_kref+0x2628:   	sta	%f18, [%i4 + %i1]0x80
	.word	0xa80e8016	! t0_kref+0x262c:   	and	%i2, %l6, %l4
	.word	0xa89d2149	! t0_kref+0x2630:   	xorcc	%l4, 0x149, %l4
	.word	0xa6db6f50	! t0_kref+0x2634:   	smulcc	%o5, 0xf50, %l3
	.word	0xa84739b9	! t0_kref+0x2638:   	addc	%i4, -0x647, %l4
	.word	0xd9063ff0	! t0_kref+0x263c:   	ld	[%i0 - 0x10], %f12
	sethi	%hi(2f), %o7
	.word	0xe40be264	! t0_kref+0x2644:   	ldub	[%o7 + 0x264], %l2
	.word	0xa41ca00c	! t0_kref+0x2648:   	xor	%l2, 0xc, %l2
	.word	0xe42be264	! t0_kref+0x264c:   	stb	%l2, [%o7 + 0x264]
	.word	0x81dbe264	! t0_kref+0x2650:   	flush	%o7 + 0x264
	.word	0xc93e7fe8	! t0_kref+0x2654:   	std	%f4, [%i1 - 0x18]
	.word	0x8fa1882d	! t0_kref+0x2658:   	fadds	%f6, %f13, %f7
	.word	0xa8570014	! t0_kref+0x265c:   	umul	%i4, %l4, %l4
	.word	0x85873420	! t0_kref+0x2660:   	wr	%i4, 0xfffff420, %ccr
2:	.word	0x89a0052d	! t0_kref+0x2664:   	fsqrts	%f13, %f4
	.word	0xe856c018	! t0_kref+0x2668:   	ldsh	[%i3 + %i0], %l4
	.word	0xb5a00026	! t0_kref+0x266c:   	fmovs	%f6, %f26
	.word	0x9fc00004	! t0_kref+0x2670:   	call	%g0 + %g4
	.word	0xf11fbf20	! t0_kref+0x2674:   	ldd	[%fp - 0xe0], %f24
	.word	0xac52400c	! t0_kref+0x2678:   	umul	%o1, %o4, %l6
	.word	0x89a38852	! t0_kref+0x267c:   	faddd	%f14, %f18, %f4
	.word	0xc3ee101c	! t0_kref+0x2680:   	prefetcha	%i0 + %i4, 1
	.word	0xaaff2e12	! t0_kref+0x2684:   	sdivcc	%i4, 0xe12, %l5
	.word	0x86102001	! t0_kref+0x2688:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x268c:   	bne,a	_kref+0x268c
	.word	0x86a0e001	! t0_kref+0x2690:   	subcc	%g3, 1, %g3
	.word	0x908d2de1	! t0_kref+0x2694:   	andcc	%l4, 0xde1, %o0
	call	SYM(t0_subr1)
	.word	0x81dac005	! t0_kref+0x269c:   	flush	%o3 + %g5
	.word	0xaedf75dc	! t0_kref+0x26a0:   	smulcc	%i5, -0xa24, %l7
	.word	0x3e480006	! t0_kref+0x26a4:   	bvc,a,pt	%icc, _kref+0x26bc
	.word	0xaca5bc74	! t0_kref+0x26a8:   	subcc	%l6, -0x38c, %l6
	.word	0xae0da851	! t0_kref+0x26ac:   	and	%l6, 0x851, %l7
	.word	0xf36e401b	! t0_kref+0x26b0:   	prefetch	%i1 + %i3, 25
	.word	0xd056401b	! t0_kref+0x26b4:   	ldsh	[%i1 + %i3], %o0
	.word	0xd27e401c	! t0_kref+0x26b8:   	swap	[%i1 + %i4], %o1
	.word	0xa73ee00f	! t0_kref+0x26bc:   	sra	%i3, 0xf, %l3
	.word	0xd53e7ff8	! t0_kref+0x26c0:   	std	%f10, [%i1 - 8]
	.word	0xaba01893	! t0_kref+0x26c4:   	fitos	%f19, %f21
	.word	0xae400008	! t0_kref+0x26c8:   	addc	%g0, %o0, %l7
	.word	0xaa46c017	! t0_kref+0x26cc:   	addc	%i3, %l7, %l5
	.word	0x22800001	! t0_kref+0x26d0:   	be,a	_kref+0x26d4
	.word	0xf826001c	! t0_kref+0x26d4:   	st	%i4, [%i0 + %i4]
	.word	0xacaec00b	! t0_kref+0x26d8:   	andncc	%i3, %o3, %l6
	.word	0x9fc00004	! t0_kref+0x26dc:   	call	%g0 + %g4
	.word	0x81dfc019	! t0_kref+0x26e0:   	flush	%i7 + %i1
	.word	0xf876001d	! t0_kref+0x26e4:   	stx	%i4, [%i0 + %i5]
	.word	0xfc39401d	! t0_kref+0x26e8:   	std	%fp, [%g5 + %i5]
	.word	0xaa63401a	! t0_kref+0x26ec:   	subc	%o5, %i2, %l5
	.word	0xd1064000	! t0_kref+0x26f0:   	ld	[%i1], %f8
	.word	0xec50a030	! t0_kref+0x26f4:   	ldsh	[%g2 + 0x30], %l6
	.word	0xac582e8c	! t0_kref+0x26f8:   	smul	%g0, 0xe8c, %l6
	.word	0x86102003	! t0_kref+0x26fc:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x2700:   	bne,a	_kref+0x2700
	.word	0x86a0e001	! t0_kref+0x2704:   	subcc	%g3, 1, %g3
	.word	0xaa96c015	! t0_kref+0x2708:   	orcc	%i3, %l5, %l5
	.word	0xacff401d	! t0_kref+0x270c:   	sdivcc	%i5, %i5, %l6
	.word	0xf1ee101c	! t0_kref+0x2710:   	prefetcha	%i0 + %i4, 24
	.word	0xb9a549ae	! t0_kref+0x2714:   	fdivs	%f21, %f14, %f28
	.word	0x9ba018c8	! t0_kref+0x2718:   	fdtos	%f8, %f13
	.word	0x9067401d	! t0_kref+0x271c:   	subc	%i5, %i5, %o0
	.word	0xf11fbf38	! t0_kref+0x2720:   	ldd	[%fp - 0xc8], %f24
	.word	0xaa65c00c	! t0_kref+0x2724:   	subc	%l7, %o4, %l5
	.word	0xac7d67ec	! t0_kref+0x2728:   	sdiv	%l5, 0x7ec, %l6
	.word	0xac357bb6	! t0_kref+0x272c:   	orn	%l5, -0x44a, %l6
	.word	0xc12e401c	! t0_kref+0x2730:   	st	%fsr, [%i1 + %i4]
	.word	0xaa473ff3	! t0_kref+0x2734:   	addc	%i4, -0xd, %l5
	.word	0x2d800007	! t0_kref+0x2738:   	fbg,a	_kref+0x2754
	.word	0x90ff401c	! t0_kref+0x273c:   	sdivcc	%i5, %i4, %o0
	.word	0xa80aef04	! t0_kref+0x2740:   	and	%o3, 0xf04, %l4
	.word	0x01000000	! t0_kref+0x2744:   	nop
	.word	0x01000000	! t0_kref+0x2748:   	nop
	.word	0x01000000	! t0_kref+0x274c:   	nop
	.word	0x01000000	! t0_kref+0x2750:   	nop
	call	SYM(_kaos_done)
	.word	0x01000000	! t0_kref+0x2758:   	nop
	KGLOBAL(t0_ktbl_end)
t0_ktbl_end:
t0_ktbl_page_end:

KTEXT_MODULE(t0_module_subr0, 0x47ea0000)
.seg "text"
t0_subr0_page_begin:
	.skip 8188
.global _t0_subr0; ENTRY(t0_subr0)
	.word	0xa6844012	! t0_subr0+0x0:   	addcc	%l1, %l2, %l3
	.word	0x81c3e008	! t0_subr0+0x4:   	retl
	.word	0xaa64c014	! t0_subr0+0x8:   	subc	%l3, %l4, %l5
t0_subr0_page_end:

KTEXT_MODULE(t0_module_subr1, 0x486e6000)
.seg "text"
t0_subr1_page_begin:
	.skip 8188
.global _t0_subr1; ENTRY(t0_subr1)
	.word	0x9de3bfa0	! t0_subr1+0x0:   	save	%sp, -0x60, %sp
	.word	0xb29eaa5a	! t0_subr1+0x4:   	xorcc	%i2, 0xa5a, %i1
	.word	0x81c7e008	! t0_subr1+0x8:   	ret
	.word	0xa7ee6001	! t0_subr1+0xc:   	restore	%i1, 1, %l3
t0_subr1_page_end:

KTEXT_MODULE(t0_module_subr2, 0x47b72000)
.seg "text"
t0_subr2_page_begin:
	.skip 8184
.global _t0_subr2; ENTRY(t0_subr2)
	.word	0x9de3bfa0	! t0_subr2+0x0:   	save	%sp, -0x60, %sp
	.word	0xb2066001	! t0_subr2+0x4:   	add	%i1, 1, %i1
	.word	0x81c7e008	! t0_subr2+0x8:   	ret
	.word	0xa3ee6001	! t0_subr2+0xc:   	restore	%i1, 1, %l1
t0_subr2_page_end:

KTEXT_MODULE(t0_module_subr3, 0x6836a000)
.seg "text"
t0_subr3_page_begin:
	.skip 8156
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
!  Total operations: 2361  
!
!  Operation frequencies
!
!  name               exp    obs
!  ldsb              1.31   1.74
!  ldub              0.61   0.68
!  ldsh              1.01   1.40
!  lduh              1.19   1.14
!  ld                0.56   0.68
!  ldd               0.13   0.08
!  swap              0.63   0.59
!  ldstub            1.24   1.23
!  stb               0.03   0.00
!  sth               0.12   0.08
!  st                0.36   0.68
!  std               0.33   0.51
!  add               0.88   0.89
!  addcc             0.03   0.00
!  addx              1.51   1.69
!  addxcc            0.53   0.55
!  taddcc            0.33   0.30
!  taddcctv          0.08   0.00
!  sub               0.48   0.34
!  subcc             1.17   1.06
!  subx              1.07   1.14
!  subxcc            0.82   0.80
!  tsubcc            0.32   0.59
!  tsubcctv          0.24   0.17
!  mulscc            0.11   0.21
!  and               1.19   0.97
!  andcc             0.85   0.80
!  andn              1.28   0.76
!  andncc            1.28   1.23
!  or                0.20   0.17
!  orcc              1.26   1.14
!  orn               1.02   1.36
!  orncc             0.69   0.72
!  xor               0.41   0.55
!  xorcc             1.41   1.48
!  xnor              0.28   0.34
!  xnorcc            1.06   1.06
!  sll               0.59   0.72
!  srl               0.44   0.47
!  sra               1.43   1.61
!  unimp             0.31   0.34
!  umul              1.36   1.23
!  smul              1.46   1.61
!  udiv              1.57   1.40
!  sdiv              0.91   0.89
!  umulcc            1.17   0.89
!  smulcc            1.48   1.52
!  udivcc            0.22   0.17
!  sdivcc            1.37   1.57
!  rdy               1.30   1.19
!  wry               0.56   0.72
!  bicc              1.52   1.44
!  sethi             1.44   2.16
!  jmpl              0.94   1.14
!  call              0.51   0.42
!  ticc              0.00   0.00
!  flush             1.29   1.52
!  save              1.63   1.27
!  restore           0.35   0.00
!  stbar             0.48   0.34
!  ldf               1.13   1.27
!  lddf              0.03   0.00
!  stf               0.38   0.25
!  stdf              1.47   1.57
!  fadds             0.71   0.80
!  fsubs             1.33   1.36
!  fmuls             0.77   1.10
!  fdivs             0.56   0.59
!  faddd             1.44   1.06
!  fsubd             0.07   0.00
!  fmuld             0.58   0.51
!  fdivd             0.81   0.97
!  faddq             0.00   0.00
!  fsubq             0.00   0.00
!  fmulq             0.00   0.00
!  fdivq             0.00   0.00
!  fsmuld            1.47   1.91
!  fdmulq            0.00   0.00
!  fitos             1.02   1.19
!  fitod             1.21   1.36
!  fitoq             0.00   0.00
!  fstoi             0.32   0.30
!  fstod             0.09   0.08
!  fstoq             0.00   0.00
!  fdtoi             0.44   0.51
!  fdtos             0.60   0.64
!  fdtoq             0.00   0.00
!  fqtoi             0.00   0.00
!  fqtos             0.00   0.00
!  fqtod             0.00   0.00
!  fmovs             0.44   0.51
!  fnegs             0.24   0.17
!  fabss             1.26   1.36
!  fsqrts            1.31   1.44
!  fsqrtd            0.00   0.00
!  fsqrtq            0.00   0.00
!  fcmps             1.40   1.27
!  fcmpd             1.34   1.14
!  fcmpq             0.00   0.00
!  fcmpes            0.40   0.25
!  fcmped            0.20   0.13
!  fcmpeq            0.00   0.00
!  fbfcc             1.19   1.02
!  ldfsr             0.27   0.00
!  stfsr             0.17   0.17
!  loop              1.33   1.19
!  offset            0.28   0.04
!  area              0.13   0.17
!  target            0.08   0.08
!  goto              0.25   0.25
!  sigsegv           0.28   0.25
!  sigbus            0.29   0.13
!  imodify           0.93   0.55
!  ldfsr_offset      0.03   0.00
!  fpattern          0.69   0.42
!  lbranch           0.27   0.08
!  shmld             3.68   3.94
!  shmst             3.18   2.84
!  shmpf             1.57   1.36
!  shmswap           0.10   0.08
!  shmblkld          0.44   0.00
!  shmblkst          0.82   0.13
!  shmblkchk         0.46   0.34
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
!  casa              0.15   0.21
!  rdasi             0.29   0.47
!  wrasi             0.32   0.34
!  bpcc              2.23   1.91
!  fbpfcc            0.50   0.47
!  fmovscc           0.08   0.17
!  fmovdcc           0.14   0.42
!  fmovqcc           0.00   0.00
!  movcc             0.05   0.04
!  flushw            0.27   0.30
!  membar            0.06   0.08
!  prefetch          1.22   1.52
!  rdpc              0.15   0.13
!  ldqf              0.00   0.00
!  stqf              0.00   0.00
!  ldfa              0.18   0.13
!  lddfa             0.11   0.08
!  ldqfa             0.00   0.00
!  ldsba             0.13   0.08
!  ldsha             0.28   0.17
!  lduba             0.19   0.34
!  lduha             0.17   0.08
!  lda               0.13   0.08
!  ldda              0.07   0.17
!  ldstuba           0.22   0.17
!  prefetcha         1.12   1.14
!  stfa              0.21   0.30
!  stdfa             0.24   0.51
!  stqfa             0.00   0.00
!  stba              0.26   0.17
!  stha              0.11   0.13
!  sta               0.28   0.42
!  stda              0.14   0.17
!  swapa             0.30   0.38
!  fmovd             0.22   0.21
!  fnegd             0.00   0.00
!  fabsd             0.24   0.25
!  fstox             0.14   0.04
!  fdtox             0.08   0.13
!  fxtos             0.12   0.13
!  fxtod             0.16   0.08
!  lds               0.23   0.25
!  ldsa              0.03   0.04
!  ldx               0.24   0.42
!  ldxa              0.12   0.13
!  nofault           0.05   0.04
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
!  partial_st8       0.03   0.04
!  partial_st16      0.09   0.04
!  partial_st32      0.09   0.25
!  short_st8         0.30   0.34
!  short_st16        0.12   0.34
!  short_ld8         0.03   0.04
!  short_ld16        0.21   0.38
!  blkld             0.21   0.00
!  blkst             0.28   0.00
!  blkld_offset      0.25   0.00
!  blkst_offset      0.12   0.00
!  blk_check         0.07   0.04
!  casxa             0.20   0.34
!  rdccr             0.06   0.08
!  rdfprs            0.27   0.34
!  wrccr             0.13   0.38
!  popc              0.28   0.25
!  wrfprs            0.15   0.17
!  stx               0.04   0.08
!  stxa              0.03   0.00
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
KDATA_MODULE(t0_module_offset_table, 0x0fd12000)
.seg "data"
t0_offset_table_start:
t0_offset_table_size:	.word	0x00000008
t0_offset_table:
	.word	0xfffffff0
	.word	0x00000008
	.word	0xffffffe0
	.word	0x00000010
	.word	0xffffffe8
	.word	0xfffffff8
	.word	0x00000000
	.word	0x00000018
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

KDATA_MODULE(t0_module_data_in_regs, 0x373e0000)
.seg "data"
KGLOBAL(t0_data_in_regs)
t0_data_in_regs_start:
t0_data_in_regs:
	.word	0x72050f70          ! %f0
	.word	0xbb4dafc2          ! %f1
	.word	0xda7f6f2f          ! %f2
	.word	0x6927414c          ! %f3
	.word	0x3f57111f          ! %f4
	.word	0x99748035          ! %f5
	.word	0xfab06a80          ! %f6
	.word	0x5b3343cb          ! %f7
	.word	0xc44b832a          ! %f8
	.word	0xcf248e71          ! %f9
	.word	0x5d56e7bd          ! %f10
	.word	0xe17c75cc          ! %f11
	.word	0x1ba70f80          ! %f12
	.word	0x97a5ec73          ! %f13
	.word	0x92057933          ! %f14
	.word	0x99dd907d          ! %f15
	.word	0x0bc034ab          ! %f16
	.word	0x420dc764          ! %f17
	.word	0x6844eaf2          ! %f18
	.word	0x46593718          ! %f19
	.word	0xdbc4cd35          ! %f20
	.word	0xfface52f          ! %f21
	.word	0x35e2b2d4          ! %f22
	.word	0xf0d3409c          ! %f23
	.word	0x0bc62948          ! %f24
	.word	0xfb6fe753          ! %f25
	.word	0xba67dcbd          ! %f26
	.word	0x63a868bf          ! %f27
	.word	0xaf3a9e94          ! %f28
	.word	0xa88066f9          ! %f29
	.word	0x935bf723          ! %f30
	.word	0x4c5b9c22          ! %f31
	.word	0x3b2db274          ! %f32
	.word	0xe3d33e49          ! %f33
	.word	0xcd2bc3d0          ! %f34
	.word	0x1d4f53c6          ! %f35
	.word	0x11464253          ! %f36
	.word	0xa24192f8          ! %f37
	.word	0x9bc3b0e6          ! %f38
	.word	0x77f4b3be          ! %f39
	.word	0x715c4e4c          ! %f40
	.word	0x688f7625          ! %f41
	.word	0x986a5e24          ! %f42
	.word	0xa9416126          ! %f43
	.word	0x2ace4a10          ! %f44
	.word	0xbd9c2d65          ! %f45
	.word	0x7867b267          ! %f46
	.word	0xd9d84353          ! %f47
	.word	0xef60180c          ! %f48
	.word	0x8625791c          ! %f49
	.word	0x3dc94572          ! %f50
	.word	0xc160a44b          ! %f51
	.word	0x796c12cb          ! %f52
	.word	0xb6486c0e          ! %f53
	.word	0xa15d21f1          ! %f54
	.word	0x644a6477          ! %f55
	.word	0x60d0c898          ! %f56
	.word	0xc47fa835          ! %f57
	.word	0x5f0823ba          ! %f58
	.word	0x0bf53596          ! %f59
	.word	0xf38c4d67          ! %f60
	.word	0xa58814d4          ! %f61
	.word	0x242d7656          ! %f62
	.word	0xde1c10f5          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0x0         ! %g1 (code pointer)
	.word	t0_data_in_shm_area ! %g2 (shared area pointer)
	.word	0x975ae9ca          ! %g3 (loop index)
	.word	SYM(t0_subr1)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0x403cc8cc          ! %o0
	.word	0x9c16d80f          ! %o1
	.word	0x5adc698a          ! %o2
	.word	0xc8188be6          ! %o3
	.word	0x5cd8a248          ! %o4
	.word	0x615673a3          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0x4aa046f4          ! %l0
	.word	0xfd9261cc          ! %l1
	.word	0xe730f7c0          ! %l2
	.word	0x48c55cdc          ! %l3
	.word	0x1fe8172c          ! %l4
	.word	0x62b8ec2d          ! %l5
	.word	0x2f76836c          ! %l6
	.word	0xa70b754b          ! %l7
	.word	t0_data_in_area0    ! %i0 (area pointer)
	.word	t0_data_in_area0    ! %i1 (area pointer)
	.word	0xfffffffc          ! %i2 (byte offset)
	.word	0xffffffee          ! %i3 (halfword offset)
	.word	0x00000008          ! %i4 (word offset)
	.word	0x00000008          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0xc8cf968b          ! %y
	.word	0x0000000d          ! %icc (nzvc)
	.word	0xc0000fdc          ! %fsr
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

KDATA_MODULE(t0_module_data_in_stack, 0x4d03c000)
.seg "data"
KGLOBAL(t0_data_in_mtbl_size)
KGLOBAL(t0_data_in_mtbl)
KGLOBAL(t0_data_in_stack)
t0_data_in_stack_start:
	.word	0xa7007ede
	.word	0x8a312b5f
	.word	0xfb3781f8
	.word	0x09af5eb3
	.word	0x7a559b46
	.word	0x95157b38
	.word	0x72508d32
	.word	0x7d85aebb
	.word	0x17e32ed8
	.word	0x8705e99a
	.word	0xdfb640b2
	.word	0x90ec1d98
	.word	0x154a5b38
	.word	0xe66441b5
	.word	0x22793eae
	.word	0xe91a5713
	.word	0xcf394368
	.word	0xa5935e32
	.word	0x71257c55
	.word	0xf98a3104
	.word	0x6808d98f
	.word	0xfbb5ddac
	.word	0xec054f38
	.word	0x98bc36e4
	.word	0xb94344fc
	.word	0x7e3f2a5f
	.word	0xfebd6ce5
	.word	0x9a80daa0
	.word	0xa21c2469
	.word	0xa460c91e
	.word	0xebb6c0d5
	.word	0x28635eaf
	.word	0xddb43083
	.word	0x0f89238a
	.word	0x13b53c87
	.word	0xd510cd66
	.word	0xa19602a9
	.word	0x55c84180
	.word	0x304905ec
	.word	0xaa66918a
	.word	0xb77203f4
	.word	0x9f4225d3
	.word	0xaab9a805
	.word	0x88798427
	.word	0xe0fbc877
	.word	0x261dc23b
	.word	0x40e129ca
	.word	0xff9f839f
	.word	0xea2b5ac7
	.word	0xbbdab68c
	.word	0x30672f4d
	.word	0x9d92e805
	.word	0x71493bbd
	.word	0x7ee74f2a
	.word	0x752a891f
	.word	0x3f6868ab
	.word	0xb5541a7a
	.word	0x3af376bb
	.word	0x3ba9d5f2
	.word	0x048546f9
	.word	0x86bb88ab
	.word	0xcd148f1e
	.word	0x52221a7f
	.word	0xb34cd280
	.word	0x245b2f0d
	.word	0xcd99659c
	.word	0x1d2473aa
	.word	0xcc199a4e
	.word	0x83564633
	.word	0xa3acb65d
	.word	0xbcd246e3
	.word	0xcb87df83
	.word	0x642b5786
	.word	0xa5d7f31d
	.word	0xa90194ce
	.word	0xaf5c1d24
	.word	0x16548a8d
	.word	0x9d5f411f
	.word	0xfa815225
	.word	0x3aa9b92e
	.word	0xd649026f
	.word	0xb48ae261
	.word	0xe8cfeadd
	.word	0x938b32ee
	.word	0xfbf80fb5
	.word	0xc8817e10
	.word	0x24145387
	.word	0x17fe628f
	.word	0x721f3a53
	.word	0x3999fc3e
	.word	0xb54c4cf9
	.word	0xf58c9df4
	.word	0x256867e8
	.word	0x9042e8d1
	.word	0xe8a8be2d
	.word	0x818fd6c8
	.word	0xc54da244
	.word	0xbc0891be
	.word	0x923b4868
	.word	0x336305d2
	.word	0x9494422b
	.word	0xe5225477
	.word	0x39a6799e
	.word	0xb7dd778d
	.word	0x6c098258
	.word	0x0282cea2
	.word	0x88b44114
	.word	0xf35dcdf7
	.word	0x0446bec4
	.word	0xddede60a
	.word	0xc0cc8a47
	.word	0x16a2cba9
	.word	0x2ae3e427
	.word	0x5052dbda
	.word	0x2680220c
	.word	0xa7fd3c27
	.word	0x88e2d3bf
	.word	0x29d7df08
	.word	0xcefa49f8
	.word	0x9f478d79
	.word	0xeb86bf4f
	.word	0xfde7d20e
	.word	0x3b6d9e01
	.word	0x54c4eefa
	.word	0xb276c16a
	.word	0x736a37df
	.word	0xc8b73064
	.word	0x02d3096f
	.word	0xbe3b35f0
	.word	0x7f587c18
	.word	0x67bcffca
	.word	0x4576a45a
	.word	0x5d1996d9
	.word	0x43630a76
	.word	0xf3bb2ba6
	.word	0x3a7ccc90
	.word	0xaa4ae131
	.word	0x0e8be988
	.word	0x11058ae0
	.word	0x5e6f5009
	.word	0x48c4c663
	.word	0x09c3cca5
	.word	0xeef988b7
	.word	0xc734a2f7
	.word	0x878e2db9
	.word	0x79f1d11f
	.word	0xdd366be2
	.word	0x0a208219
	.word	0xc61bca22
	.word	0xb29d5ab8
	.word	0x0cf06bf9
	.word	0xa1bbe650
	.word	0x53b9c836
	.word	0x0bf4c354
	.word	0x65953913
	.word	0x8ce01d72
	.word	0x41d3d877
	.word	0x9362d1f0
	.word	0x3e3ed9af
	.word	0xbe2a1c5d
	.word	0x763d19da
	.word	0x1a902cd2
	.word	0x6ddc02d7
	.word	0xb5885e4f
	.word	0x3cada885
	.word	0x8ccd3b02
	.word	0x38c34e82
	.word	0xc6f6e575
t0_data_in_sp:
	.word	0x2dc3d4d8
	.word	0x91b428f8
	.word	0x8dd8f439
	.word	0x76a230c1
	.word	0x4a3346b1
	.word	0xf49a0496
	.word	0x0dc4e7fe
	.word	0x5ce33b00
	.word	t0_data_in_area0
	.word	t0_data_in_area0
	.word	0xffffffef
	.word	0xfffffff2
	.word	0xfffffff0
	.word	0x00000010
	.word	t0_data_in_fp
	.word	0x39ae4dc9
	.word	0x6fe91d12
	.word	0xba5bfdfc
	.word	0xf20677d0
	.word	0x73a54f38
	.word	0x2b2b3236
	.word	0xde8de0c4
	.word	0x80f83459
	.word	0x3c6900ab
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
	.word   	0x7ff80694	! [%fp - 0xc]
	.word   	0x122fd57b	! [%fp - 0x8]
	.word   	0xe4e801c8	! [%fp - 0x4]
.global t0_data_in_fp; t0_data_in_fp:
	.word	0xbde5e014
	.word	0x0a9bde98
	.word	0x17307018
	.word	0xb1479f77
	.word	0x042dbcc2
	.word	0x15b137bb
	.word	0x62b25d23
	.word	0x7030c217
	.word	0xfc1e261a
	.word	0xb463a328
	.word	0x2322d187
	.word	0x51db28f8
	.word	0xd2729186
	.word	0x203326a3
	.word	0xbfa6a3ac
	.word	0xe9084388
	.word	0xf1fe6bac
	.word	0x171247a6
	.word	0x661761c5
	.word	0x6f452b18
	.word	0x92da88e2
	.word	0xe7b724cc
	.word	0x468af966
	.word	0xd2abf4e6
t0_data_in_stacktop:
	.word	0
t0_data_in_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_in_area0, 0x15606000)
.seg "data"
t0_data_in_area0_start:
.skip 4480
t0_data_in_area0_begin:
	.word	0x5914a8e2	! t0_data_in_area0-0x20
	.word	0x349a4173	! t0_data_in_area0-0x1c
	.word	0x77f5c458	! t0_data_in_area0-0x18
	.word	0x51d9a057	! t0_data_in_area0-0x14
	.word	0x4f2701ba	! t0_data_in_area0-0x10
	.word	0xb0a3e79b	! t0_data_in_area0-0xc
	.word	0x0a200eb0	! t0_data_in_area0-0x8
	.word	0xaa5e2583	! t0_data_in_area0-0x4
.global t0_data_in_area0; t0_data_in_area0:
	.word	0x32690605	! t0_data_in_area0+0x0
	.word	0xcd334414	! t0_data_in_area0+0x4
	.word	0xab256a1e	! t0_data_in_area0+0x8
	.word	0x9e4067f7	! t0_data_in_area0+0xc
	.word	0x9d09da5f	! t0_data_in_area0+0x10
	.word	0x7e38a0d8	! t0_data_in_area0+0x14
	.word	0x43456282	! t0_data_in_area0+0x18
	.word	0x9e8811b5	! t0_data_in_area0+0x1c
t0_data_in_area0_end:
.skip 3648
t0_data_in_area0_stop:

KDATA_MODULE(t0_module_data_in_shm_area, 0x553fc000)
.seg "data"
t0_data_in_shm_area_start:
t0_data_in_shm_area_begin:
.global t0_data_in_shm_area; t0_data_in_shm_area:
	.word	0xdd382e15	! t0_data_in_shm_area+0x0 (t0)
	.word	0x80ce61b5	! t0_data_in_shm_area+0x4 (t0)
	.word	0x963267c4	! t0_data_in_shm_area+0x8 (t0)
	.word	0xc75b9a7f	! t0_data_in_shm_area+0xc (t0)
	.word	0xf3226b1c	! t0_data_in_shm_area+0x10 (t0)
	.word	0x7952a72f	! t0_data_in_shm_area+0x14 (t0)
	.word	0xfe8500e4	! t0_data_in_shm_area+0x18 (t0)
	.word	0x9e60ff54	! t0_data_in_shm_area+0x1c (t0)
	.word	0x2ab57144	! t0_data_in_shm_area+0x20 (t0)
	.word	0x71bdbba3	! t0_data_in_shm_area+0x24 (t0)
	.word	0xb3c69c4f	! t0_data_in_shm_area+0x28 (t0)
	.word	0x81f3ee3b	! t0_data_in_shm_area+0x2c (t0)
	.word	0x71af50ad	! t0_data_in_shm_area+0x30 (t0)
	.word	0xce0faeaf	! t0_data_in_shm_area+0x34 (t0)
	.word	0x4ee89174	! t0_data_in_shm_area+0x38 (t0)
	.word	0xc7ac6a3e	! t0_data_in_shm_area+0x3c (t0)
	.word	0xf9feb779	! t0_data_in_shm_area+0x40 (t0 bload)
	.word	0x6571c2d1	! t0_data_in_shm_area+0x44
	.word	0xd1312797	! t0_data_in_shm_area+0x48
	.word	0xc6dd2bb9	! t0_data_in_shm_area+0x4c
	.word	0xf2bf06c3	! t0_data_in_shm_area+0x50
	.word	0xa94e914e	! t0_data_in_shm_area+0x54
	.word	0xc7f1b5e5	! t0_data_in_shm_area+0x58
	.word	0x986140d4	! t0_data_in_shm_area+0x5c
	.word	0x62ac42ce	! t0_data_in_shm_area+0x60
	.word	0x5a6e0854	! t0_data_in_shm_area+0x64
	.word	0x10f630c7	! t0_data_in_shm_area+0x68
	.word	0x1484b24d	! t0_data_in_shm_area+0x6c
	.word	0x24e95281	! t0_data_in_shm_area+0x70
	.word	0x5d50a762	! t0_data_in_shm_area+0x74
	.word	0xa1cfb87a	! t0_data_in_shm_area+0x78
	.word	0x724c307a	! t0_data_in_shm_area+0x7c
	.word	0x17a64213	! t0_data_in_shm_area+0x80 (t0 bstore)
	.word	0x8cd79de7	! t0_data_in_shm_area+0x84
	.word	0xbc20fcdf	! t0_data_in_shm_area+0x88
	.word	0x0d1c0c8e	! t0_data_in_shm_area+0x8c
	.word	0x0adb7d02	! t0_data_in_shm_area+0x90
	.word	0x9afdb029	! t0_data_in_shm_area+0x94
	.word	0x742c8a8f	! t0_data_in_shm_area+0x98
	.word	0xeeff021a	! t0_data_in_shm_area+0x9c
	.word	0x772a3348	! t0_data_in_shm_area+0xa0
	.word	0xed3f0668	! t0_data_in_shm_area+0xa4
	.word	0xfa525532	! t0_data_in_shm_area+0xa8
	.word	0x42d194d7	! t0_data_in_shm_area+0xac
	.word	0x79415dd1	! t0_data_in_shm_area+0xb0
	.word	0x1b8c4a42	! t0_data_in_shm_area+0xb4
	.word	0xe52b1311	! t0_data_in_shm_area+0xb8
	.word	0x3a9f06a2	! t0_data_in_shm_area+0xbc
t0_data_in_shm_area_end:
t0_data_in_shm_area_stop:

KDATA_MODULE(t0_module_data_exp_regs, 0x19056000)
.seg "data"
KGLOBAL(t0_data_exp_regs)
t0_data_exp_regs_start:
t0_data_exp_regs:
	.word	0x72050f70          ! %f0
	.word	0xbb4dafc2          ! %f1
	.word	0xda7f6f2f          ! %f2
	.word	0x6927414c          ! %f3
	.word	0x3f57111f          ! %f4
	.word	0x99748035          ! %f5
	.word	0xfab06a80          ! %f6
	.word	0x5b3343cb          ! %f7
	.word	0xc44b832a          ! %f8
	.word	0xcf248e71          ! %f9
	.word	0x5d56e7bd          ! %f10
	.word	0xe17c75cc          ! %f11
	.word	0x1ba70f80          ! %f12
	.word	0x97a5ec73          ! %f13
	.word	0x92057933          ! %f14
	.word	0x99dd907d          ! %f15
	.word	0x0bc034ab          ! %f16
	.word	0x420dc764          ! %f17
	.word	0x6844eaf2          ! %f18
	.word	0x46593718          ! %f19
	.word	0xdbc4cd35          ! %f20
	.word	0xfface52f          ! %f21
	.word	0x35e2b2d4          ! %f22
	.word	0xf0d3409c          ! %f23
	.word	0x0bc62948          ! %f24
	.word	0xfb6fe753          ! %f25
	.word	0xba67dcbd          ! %f26
	.word	0x63a868bf          ! %f27
	.word	0xaf3a9e94          ! %f28
	.word	0xa88066f9          ! %f29
	.word	0x935bf723          ! %f30
	.word	0x4c5b9c22          ! %f31
	.word	0x3b2db274          ! %f32
	.word	0xe3d33e49          ! %f33
	.word	0xcd2bc3d0          ! %f34
	.word	0x1d4f53c6          ! %f35
	.word	0x11464253          ! %f36
	.word	0xa24192f8          ! %f37
	.word	0x9bc3b0e6          ! %f38
	.word	0x77f4b3be          ! %f39
	.word	0x715c4e4c          ! %f40
	.word	0x688f7625          ! %f41
	.word	0x986a5e24          ! %f42
	.word	0xa9416126          ! %f43
	.word	0x2ace4a10          ! %f44
	.word	0xbd9c2d65          ! %f45
	.word	0x7867b267          ! %f46
	.word	0xd9d84353          ! %f47
	.word	0xef60180c          ! %f48
	.word	0x8625791c          ! %f49
	.word	0x3dc94572          ! %f50
	.word	0xc160a44b          ! %f51
	.word	0x796c12cb          ! %f52
	.word	0xb6486c0e          ! %f53
	.word	0xa15d21f1          ! %f54
	.word	0x644a6477          ! %f55
	.word	0x60d0c898          ! %f56
	.word	0xc47fa835          ! %f57
	.word	0x5f0823ba          ! %f58
	.word	0x0bf53596          ! %f59
	.word	0xf38c4d67          ! %f60
	.word	0xa58814d4          ! %f61
	.word	0x242d7656          ! %f62
	.word	0xde1c10f5          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0x0         ! %g1 (code pointer)
	.word	t0_data_exp_shm_area! %g2 (shared area pointer)
	.word	0x975ae9ca          ! %g3 (loop index)
	.word	SYM(t0_subr1)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0x403cc8cc          ! %o0
	.word	0x9c16d80f          ! %o1
	.word	0x5adc698a          ! %o2
	.word	0xc8188be6          ! %o3
	.word	0x5cd8a248          ! %o4
	.word	0x615673a3          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0x4aa046f4          ! %l0
	.word	0xfd9261cc          ! %l1
	.word	0xe730f7c0          ! %l2
	.word	0x48c55cdc          ! %l3
	.word	0x1fe8172c          ! %l4
	.word	0x62b8ec2d          ! %l5
	.word	0x2f76836c          ! %l6
	.word	0xa70b754b          ! %l7
	.word	t0_data_exp_area0   ! %i0 (area pointer)
	.word	t0_data_exp_area0   ! %i1 (area pointer)
	.word	0xfffffffc          ! %i2 (byte offset)
	.word	0xffffffee          ! %i3 (halfword offset)
	.word	0x00000008          ! %i4 (word offset)
	.word	0x00000008          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0xc8cf968b          ! %y
	.word	0x0000000d          ! %icc (nzvc)
	.word	0xc0000fdc          ! %fsr
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

KDATA_MODULE(t0_module_data_exp_stack, 0x69904000)
.seg "data"
KGLOBAL(t0_data_exp_mtbl_size)
KGLOBAL(t0_data_exp_mtbl)
KGLOBAL(t0_data_exp_stack)
t0_data_exp_stack_start:
	.word	0xa7007ede
	.word	0x8a312b5f
	.word	0xfb3781f8
	.word	0x09af5eb3
	.word	0x7a559b46
	.word	0x95157b38
	.word	0x72508d32
	.word	0x7d85aebb
	.word	0x17e32ed8
	.word	0x8705e99a
	.word	0xdfb640b2
	.word	0x90ec1d98
	.word	0x154a5b38
	.word	0xe66441b5
	.word	0x22793eae
	.word	0xe91a5713
	.word	0xcf394368
	.word	0xa5935e32
	.word	0x71257c55
	.word	0xf98a3104
	.word	0x6808d98f
	.word	0xfbb5ddac
	.word	0xec054f38
	.word	0x98bc36e4
	.word	0xb94344fc
	.word	0x7e3f2a5f
	.word	0xfebd6ce5
	.word	0x9a80daa0
	.word	0xa21c2469
	.word	0xa460c91e
	.word	0xebb6c0d5
	.word	0x28635eaf
	.word	0xddb43083
	.word	0x0f89238a
	.word	0x13b53c87
	.word	0xd510cd66
	.word	0xa19602a9
	.word	0x55c84180
	.word	0x304905ec
	.word	0xaa66918a
	.word	0xb77203f4
	.word	0x9f4225d3
	.word	0xaab9a805
	.word	0x88798427
	.word	0xe0fbc877
	.word	0x261dc23b
	.word	0x40e129ca
	.word	0xff9f839f
	.word	0xea2b5ac7
	.word	0xbbdab68c
	.word	0x30672f4d
	.word	0x9d92e805
	.word	0x71493bbd
	.word	0x7ee74f2a
	.word	0x752a891f
	.word	0x3f6868ab
	.word	0xb5541a7a
	.word	0x3af376bb
	.word	0x3ba9d5f2
	.word	0x048546f9
	.word	0x86bb88ab
	.word	0xcd148f1e
	.word	0x52221a7f
	.word	0xb34cd280
	.word	0x245b2f0d
	.word	0xcd99659c
	.word	0x1d2473aa
	.word	0xcc199a4e
	.word	0x83564633
	.word	0xa3acb65d
	.word	0xbcd246e3
	.word	0xcb87df83
	.word	0x642b5786
	.word	0xa5d7f31d
	.word	0xa90194ce
	.word	0xaf5c1d24
	.word	0x16548a8d
	.word	0x9d5f411f
	.word	0xfa815225
	.word	0x3aa9b92e
	.word	0xd649026f
	.word	0xb48ae261
	.word	0xe8cfeadd
	.word	0x938b32ee
	.word	0xfbf80fb5
	.word	0xc8817e10
	.word	0x24145387
	.word	0x17fe628f
	.word	0x721f3a53
	.word	0x3999fc3e
	.word	0xb54c4cf9
	.word	0xf58c9df4
	.word	0x256867e8
	.word	0x9042e8d1
	.word	0xe8a8be2d
	.word	0x818fd6c8
	.word	0xc54da244
	.word	0xbc0891be
	.word	0x923b4868
	.word	0x336305d2
	.word	0x9494422b
	.word	0xe5225477
	.word	0x39a6799e
	.word	0xb7dd778d
	.word	0x6c098258
	.word	0x0282cea2
	.word	0x88b44114
	.word	0xf35dcdf7
	.word	0x0446bec4
	.word	0xddede60a
	.word	0xc0cc8a47
	.word	0x16a2cba9
	.word	0x2ae3e427
	.word	0x5052dbda
	.word	0x2680220c
	.word	0xa7fd3c27
	.word	0x88e2d3bf
	.word	0x29d7df08
	.word	0xcefa49f8
	.word	0x9f478d79
	.word	0xeb86bf4f
	.word	0xfde7d20e
	.word	0x3b6d9e01
	.word	0x54c4eefa
	.word	0xb276c16a
	.word	0x736a37df
	.word	0xc8b73064
	.word	0x02d3096f
	.word	0xbe3b35f0
	.word	0x7f587c18
	.word	0x67bcffca
	.word	0x4576a45a
	.word	0x5d1996d9
	.word	0x43630a76
	.word	0xf3bb2ba6
	.word	0x3a7ccc90
	.word	0xaa4ae131
	.word	0x0e8be988
	.word	0x11058ae0
	.word	0x5e6f5009
	.word	0x48c4c663
	.word	0x09c3cca5
	.word	0xeef988b7
	.word	0xc734a2f7
	.word	0x878e2db9
	.word	0x79f1d11f
	.word	0xdd366be2
	.word	0x0a208219
	.word	0xc61bca22
	.word	0xb29d5ab8
	.word	0x0cf06bf9
	.word	0xa1bbe650
	.word	0x53b9c836
	.word	0x0bf4c354
	.word	0x65953913
	.word	0x8ce01d72
	.word	0x41d3d877
	.word	0x9362d1f0
	.word	0x3e3ed9af
	.word	0xbe2a1c5d
	.word	0x763d19da
	.word	0x1a902cd2
	.word	0x6ddc02d7
	.word	0xb5885e4f
	.word	0x3cada885
	.word	0x8ccd3b02
	.word	0x38c34e82
	.word	0xc6f6e575
t0_data_exp_sp:
	.word	0x2dc3d4d8
	.word	0x91b428f8
	.word	0x8dd8f439
	.word	0x76a230c1
	.word	0x4a3346b1
	.word	0xf49a0496
	.word	0x0dc4e7fe
	.word	0x5ce33b00
	.word	t0_data_exp_area0
	.word	t0_data_exp_area0
	.word	0xffffffef
	.word	0xfffffff2
	.word	0xfffffff0
	.word	0x00000010
	.word	t0_data_exp_fp
	.word	0x39ae4dc9
	.word	0x6fe91d12
	.word	0xba5bfdfc
	.word	0xf20677d0
	.word	0x73a54f38
	.word	0x2b2b3236
	.word	0xde8de0c4
	.word	0x80f83459
	.word	0x3c6900ab
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
	.word   	0x7ff80694	! [%fp - 0xc]
	.word   	0x122fd57b	! [%fp - 0x8]
	.word   	0xe4e801c8	! [%fp - 0x4]
t0_data_exp_fp:
	.word	0xbde5e014
	.word	0x0a9bde98
	.word	0x17307018
	.word	0xb1479f77
	.word	0x042dbcc2
	.word	0x15b137bb
	.word	0x62b25d23
	.word	0x7030c217
	.word	0xfc1e261a
	.word	0xb463a328
	.word	0x2322d187
	.word	0x51db28f8
	.word	0xd2729186
	.word	0x203326a3
	.word	0xbfa6a3ac
	.word	0xe9084388
	.word	0xf1fe6bac
	.word	0x171247a6
	.word	0x661761c5
	.word	0x6f452b18
	.word	0x92da88e2
	.word	0xe7b724cc
	.word	0x468af966
	.word	0xd2abf4e6
t0_data_exp_stacktop:
	.word	0
t0_data_exp_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_exp_area0, 0x0d056000)
.seg "data"
t0_data_exp_area0_start:
.skip 4480
t0_data_exp_area0_begin:
	.word	0x5914a8e2	! t0_data_exp_area0-0x20
	.word	0x349a4173	! t0_data_exp_area0-0x1c
	.word	0x77f5c458	! t0_data_exp_area0-0x18
	.word	0x51d9a057	! t0_data_exp_area0-0x14
	.word	0x4f2701ba	! t0_data_exp_area0-0x10
	.word	0xb0a3e79b	! t0_data_exp_area0-0xc
	.word	0x0a200eb0	! t0_data_exp_area0-0x8
	.word	0xaa5e2583	! t0_data_exp_area0-0x4
.global t0_data_exp_area0; t0_data_exp_area0:
	.word	0x32690605	! t0_data_exp_area0+0x0
	.word	0xcd334414	! t0_data_exp_area0+0x4
	.word	0xab256a1e	! t0_data_exp_area0+0x8
	.word	0x9e4067f7	! t0_data_exp_area0+0xc
	.word	0x9d09da5f	! t0_data_exp_area0+0x10
	.word	0x7e38a0d8	! t0_data_exp_area0+0x14
	.word	0x43456282	! t0_data_exp_area0+0x18
	.word	0x9e8811b5	! t0_data_exp_area0+0x1c
t0_data_exp_area0_end:
.skip 3648
t0_data_exp_area0_stop:

KDATA_MODULE(t0_module_data_exp_shm_area, 0x0835e000)
.seg "data"
t0_data_exp_shm_area_start:
t0_data_exp_shm_area_begin:
.global t0_data_exp_shm_area; t0_data_exp_shm_area:
	.word	0xdd382e15	! t0_data_exp_shm_area+0x0 (t0)
	.word	0x80ce61b5	! t0_data_exp_shm_area+0x4 (t0)
	.word	0x963267c4	! t0_data_exp_shm_area+0x8 (t0)
	.word	0xc75b9a7f	! t0_data_exp_shm_area+0xc (t0)
	.word	0xf3226b1c	! t0_data_exp_shm_area+0x10 (t0)
	.word	0x7952a72f	! t0_data_exp_shm_area+0x14 (t0)
	.word	0xfe8500e4	! t0_data_exp_shm_area+0x18 (t0)
	.word	0x9e60ff54	! t0_data_exp_shm_area+0x1c (t0)
	.word	0x2ab57144	! t0_data_exp_shm_area+0x20 (t0)
	.word	0x71bdbba3	! t0_data_exp_shm_area+0x24 (t0)
	.word	0xb3c69c4f	! t0_data_exp_shm_area+0x28 (t0)
	.word	0x81f3ee3b	! t0_data_exp_shm_area+0x2c (t0)
	.word	0x71af50ad	! t0_data_exp_shm_area+0x30 (t0)
	.word	0xce0faeaf	! t0_data_exp_shm_area+0x34 (t0)
	.word	0x4ee89174	! t0_data_exp_shm_area+0x38 (t0)
	.word	0xc7ac6a3e	! t0_data_exp_shm_area+0x3c (t0)
	.word	0xf9feb779	! t0_data_exp_shm_area+0x40 (t0 bload)
	.word	0x6571c2d1	! t0_data_exp_shm_area+0x44
	.word	0xd1312797	! t0_data_exp_shm_area+0x48
	.word	0xc6dd2bb9	! t0_data_exp_shm_area+0x4c
	.word	0xf2bf06c3	! t0_data_exp_shm_area+0x50
	.word	0xa94e914e	! t0_data_exp_shm_area+0x54
	.word	0xc7f1b5e5	! t0_data_exp_shm_area+0x58
	.word	0x986140d4	! t0_data_exp_shm_area+0x5c
	.word	0x62ac42ce	! t0_data_exp_shm_area+0x60
	.word	0x5a6e0854	! t0_data_exp_shm_area+0x64
	.word	0x10f630c7	! t0_data_exp_shm_area+0x68
	.word	0x1484b24d	! t0_data_exp_shm_area+0x6c
	.word	0x24e95281	! t0_data_exp_shm_area+0x70
	.word	0x5d50a762	! t0_data_exp_shm_area+0x74
	.word	0xa1cfb87a	! t0_data_exp_shm_area+0x78
	.word	0x724c307a	! t0_data_exp_shm_area+0x7c
	.word	0x17a64213	! t0_data_exp_shm_area+0x80 (t0 bstore)
	.word	0x8cd79de7	! t0_data_exp_shm_area+0x84
	.word	0xbc20fcdf	! t0_data_exp_shm_area+0x88
	.word	0x0d1c0c8e	! t0_data_exp_shm_area+0x8c
	.word	0x0adb7d02	! t0_data_exp_shm_area+0x90
	.word	0x9afdb029	! t0_data_exp_shm_area+0x94
	.word	0x742c8a8f	! t0_data_exp_shm_area+0x98
	.word	0xeeff021a	! t0_data_exp_shm_area+0x9c
	.word	0x772a3348	! t0_data_exp_shm_area+0xa0
	.word	0xed3f0668	! t0_data_exp_shm_area+0xa4
	.word	0xfa525532	! t0_data_exp_shm_area+0xa8
	.word	0x42d194d7	! t0_data_exp_shm_area+0xac
	.word	0x79415dd1	! t0_data_exp_shm_area+0xb0
	.word	0x1b8c4a42	! t0_data_exp_shm_area+0xb4
	.word	0xe52b1311	! t0_data_exp_shm_area+0xb8
	.word	0x3a9f06a2	! t0_data_exp_shm_area+0xbc
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



