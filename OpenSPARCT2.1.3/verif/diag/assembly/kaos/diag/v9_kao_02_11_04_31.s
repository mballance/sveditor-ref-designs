/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: v9_kao_02_11_04_31.s
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
/* @(#)kaos_boot1.s	1.5 10/30/02 12:40:28 */
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
#define T0_KAOS_SEED          d31a6aac0cf1
#define T0_KAOS_ICOUNT        4000
#define T0_KAOS_AREAS         1
#define T0_KAOS_AREASIZE      64
#define T0_KAOS_AREAOFFSET    7872
#define T0_KAOS_PAGESIZE      8192
#define T0_KAOS_CODECOUNT     4002

#define T0_KAOS_BOOT_VA                  0x0f250000
#define T0_KAOS_BOOT_PA                  0x0000000000022000
#define T0_KAOS_BOOT_CACHEABLE           1
#define T0_KAOS_BOOT_NONCACHEABLE        0

#define T0_KAOS_STARTUP_VA               0x21fee000
#define T0_KAOS_STARTUP_PA               0x0000000002ecc000
#define T0_KAOS_STARTUP_CACHEABLE        1
#define T0_KAOS_STARTUP_NONCACHEABLE     0

#define T0_KAOS_OFFSET_TBL_VA            0x4f628000
#define T0_KAOS_OFFSET_TBL_PA            0x00000000045d2000
#define T0_KAOS_OFFSET_TBL_CACHEABLE     1
#define T0_KAOS_OFFSET_TBL_NONCACHEABLE  0

#define T0_KAOS_DONE_VA                  0x6ba0c000
#define T0_KAOS_DONE_PA                  0x0000000007382000
#define T0_KAOS_DONE_CACHEABLE           1
#define T0_KAOS_DONE_NONCACHEABLE        0

#define T0_KAOS_KTBL_VA                  0x2deba000
#define T0_KAOS_KTBL_PA                  0x000000000989a000
#define T0_KAOS_KTBL_CACHEABLE           1
#define T0_KAOS_KTBL_NONCACHEABLE        0

#define T0_KAOS_SUBR0_VA                 0x4c2c8000
#define T0_KAOS_SUBR0_PA                 0x000000000bfa6000
#define T0_KAOS_SUBR0_CACHEABLE          1
#define T0_KAOS_SUBR0_NONCACHEABLE       0
#define T0_KAOS_SUBR1_VA                 0x2de0a000
#define T0_KAOS_SUBR1_PA                 0x000000000c754000
#define T0_KAOS_SUBR1_CACHEABLE          1
#define T0_KAOS_SUBR1_NONCACHEABLE       0
#define T0_KAOS_SUBR2_VA                 0x2d89c000
#define T0_KAOS_SUBR2_PA                 0x000000000ecf0000
#define T0_KAOS_SUBR2_CACHEABLE          1
#define T0_KAOS_SUBR2_NONCACHEABLE       0
#define T0_KAOS_SUBR3_VA                 0x5977a000
#define T0_KAOS_SUBR3_PA                 0x0000000011c88000
#define T0_KAOS_SUBR3_CACHEABLE          1
#define T0_KAOS_SUBR3_NONCACHEABLE       0

#define T0_KAOS_EXP_REGS_VA              0x1a36e000
#define T0_KAOS_EXP_REGS_PA              0x00000000133c2000
#define T0_KAOS_EXP_REGS_CACHEABLE       1
#define T0_KAOS_EXP_REGS_NONCACHEABLE    0
#define T0_KAOS_RUN_REGS_VA              0x41a8a000
#define T0_KAOS_RUN_REGS_PA              0x0000000014490000
#define T0_KAOS_RUN_REGS_CACHEABLE       1
#define T0_KAOS_RUN_REGS_NONCACHEABLE    0

#define T0_KAOS_EXP_STACK_VA             0x55b00000
#define T0_KAOS_EXP_STACK_PA             0x0000000017f2c000
#define T0_KAOS_EXP_STACK_CACHEABLE      1
#define T0_KAOS_EXP_STACK_NONCACHEABLE   0
#define T0_KAOS_RUN_STACK_VA             0x165be000
#define T0_KAOS_RUN_STACK_PA             0x0000000018156000
#define T0_KAOS_RUN_STACK_CACHEABLE      1
#define T0_KAOS_RUN_STACK_NONCACHEABLE   0

#define T0_KAOS_AREA0
#define T0_KAOS_EXP_AREA0_VA             0x2b24e000
#define T0_KAOS_EXP_AREA0_PA             0x000000001baf6000
#define T0_KAOS_EXP_AREA0_CACHEABLE      1
#define T0_KAOS_EXP_AREA0_NONCACHEABLE   0
#define T0_KAOS_RUN_AREA0_VA             0x2b114000
#define T0_KAOS_RUN_AREA0_PA             0x000000001c532000
#define T0_KAOS_RUN_AREA0_CACHEABLE      1
#define T0_KAOS_RUN_AREA0_NONCACHEABLE   0

#define T0_KAOS_SHM_AREA
#define T0_KAOS_EXP_SHM_AREA_VA          0x5ae86000
#define T0_KAOS_EXP_SHM_AREA_PA          0x000000000101c000
#define T0_KAOS_EXP_SHM_AREA_CACHEABLE   1
#define T0_KAOS_EXP_SHM_AREA_NONCACHEABLE 0
#define T0_KAOS_RUN_SHM_AREA_VA          0x09006000
#define T0_KAOS_RUN_SHM_AREA_PA          0x0000000000032000
#define T0_KAOS_RUN_SHM_AREA_CACHEABLE   1
#define T0_KAOS_RUN_SHM_AREA_NONCACHEABLE 0

#define T0_KAOS_RANVAL_00     0x7bdaedfc
#define T0_KAOS_RANVAL_01     0x16355919
#define T0_KAOS_RANVAL_02     0xdf6409d7
#define T0_KAOS_RANVAL_03     0xaa20e010
#define T0_KAOS_RANVAL_04     0x1f485162
#define T0_KAOS_RANVAL_05     0xbcb97fc0
#define T0_KAOS_RANVAL_06     0x48578483
#define T0_KAOS_RANVAL_07     0xc852d2de
#define T0_KAOS_RANVAL_08     0x6b1329fb
#define T0_KAOS_RANVAL_09     0x5124a1e6
#define T0_KAOS_RANVAL_0a     0x4a4d9562
#define T0_KAOS_RANVAL_0b     0xbd8a9a68
#define T0_KAOS_RANVAL_0c     0x213af124
#define T0_KAOS_RANVAL_0d     0x1fbbd43b
#define T0_KAOS_RANVAL_0e     0x52ce4a32
#define T0_KAOS_RANVAL_0f     0xab9014fc
#define T0_KAOS_RANVAL_10     0xd7b43745
#define T0_KAOS_RANVAL_11     0x0e37c9bf
#define T0_KAOS_RANVAL_12     0xf0664bef
#define T0_KAOS_RANVAL_13     0x3f7e27e7
#define T0_KAOS_RANVAL_14     0xd9bfa7c9
#define T0_KAOS_RANVAL_15     0xe71d2173
#define T0_KAOS_RANVAL_16     0xf6ffac78
#define T0_KAOS_RANVAL_17     0xbf83a64d
#define T0_KAOS_RANVAL_18     0xf5dec96a
#define T0_KAOS_RANVAL_19     0x265f5b54
#define T0_KAOS_RANVAL_1a     0x72476a72
#define T0_KAOS_RANVAL_1b     0xc2cb513d
#define T0_KAOS_RANVAL_1c     0xa61dfeb1
#define T0_KAOS_RANVAL_1d     0x8f09a884
#define T0_KAOS_RANVAL_1e     0x118ccf6c
#define T0_KAOS_RANVAL_1f     0xcf5b44ff
#define T0_KAOS_RANVAL_20     0xa5df8abd
#define T0_KAOS_RANVAL_21     0xb5a80aca
#define T0_KAOS_RANVAL_22     0x1fb60c44
#define T0_KAOS_RANVAL_23     0x95ed67b0
#define T0_KAOS_RANVAL_24     0x28cb9e42
#define T0_KAOS_RANVAL_25     0x87de773c
#define T0_KAOS_RANVAL_26     0x1db7b7c8
#define T0_KAOS_RANVAL_27     0x09c7ad10
#define T0_KAOS_RANVAL_28     0xae45b0d4
#define T0_KAOS_RANVAL_29     0x0642f03a
#define T0_KAOS_RANVAL_2a     0x5cb3139f
#define T0_KAOS_RANVAL_2b     0x6bb4439a
#define T0_KAOS_RANVAL_2c     0x8c07aa65
#define T0_KAOS_RANVAL_2d     0x6d6aca9e
#define T0_KAOS_RANVAL_2e     0x48b93b6a
#define T0_KAOS_RANVAL_2f     0x28a6fed5
#define T0_KAOS_RANVAL_30     0x3587a10c
#define T0_KAOS_RANVAL_31     0xed6a9231
#define T0_KAOS_RANVAL_32     0xa46fa225
#define T0_KAOS_RANVAL_33     0x579e92ea
#define T0_KAOS_RANVAL_34     0x74d52f07
#define T0_KAOS_RANVAL_35     0x7f0b4160
#define T0_KAOS_RANVAL_36     0x92b481d3
#define T0_KAOS_RANVAL_37     0xb4257575
#define T0_KAOS_RANVAL_38     0xf8e7a503
#define T0_KAOS_RANVAL_39     0x0aeec02f
#define T0_KAOS_RANVAL_3a     0xac28215a
#define T0_KAOS_RANVAL_3b     0x44bf779f
#define T0_KAOS_RANVAL_3c     0x0d269c9a
#define T0_KAOS_RANVAL_3d     0xcc08de6c
#define T0_KAOS_RANVAL_3e     0x5d6a14ab
#define T0_KAOS_RANVAL_3f     0xdbce6d6c
#define T0_KAOS_RANVAL_40     0x028aaf1c
#define T0_KAOS_RANVAL_41     0xeb713d28
#define T0_KAOS_RANVAL_42     0xa627db25
#define T0_KAOS_RANVAL_43     0x4f497651
#define T0_KAOS_RANVAL_44     0xd44c5491
#define T0_KAOS_RANVAL_45     0xcae5db63
#define T0_KAOS_RANVAL_46     0xeb0c803b
#define T0_KAOS_RANVAL_47     0x7547bb09
#define T0_KAOS_RANVAL_48     0x2cf32efe
#define T0_KAOS_RANVAL_49     0x449d3a06
#define T0_KAOS_RANVAL_4a     0xab772253
#define T0_KAOS_RANVAL_4b     0x9218b4a8
#define T0_KAOS_RANVAL_4c     0xf4f845e7
#define T0_KAOS_RANVAL_4d     0x7d824b15
#define T0_KAOS_RANVAL_4e     0x79d883f1
#define T0_KAOS_RANVAL_4f     0x2db150f0
#define T0_KAOS_RANVAL_50     0x9651f615
#define T0_KAOS_RANVAL_51     0x61e3a024
#define T0_KAOS_RANVAL_52     0xe0f60b14
#define T0_KAOS_RANVAL_53     0x0ad687e2
#define T0_KAOS_RANVAL_54     0xb8689999
#define T0_KAOS_RANVAL_55     0xd7428c0a
#define T0_KAOS_RANVAL_56     0xdb52d2e0
#define T0_KAOS_RANVAL_57     0xdfe33698
#define T0_KAOS_RANVAL_58     0x425f2c10
#define T0_KAOS_RANVAL_59     0x5f862bd4
#define T0_KAOS_RANVAL_5a     0x02e5b37c
#define T0_KAOS_RANVAL_5b     0x30905351
#define T0_KAOS_RANVAL_5c     0x4e8b6f27
#define T0_KAOS_RANVAL_5d     0xd5a18afc
#define T0_KAOS_RANVAL_5e     0xa04d643d
#define T0_KAOS_RANVAL_5f     0x4f03cecd
#define T0_KAOS_RANVAL_60     0x8dad5361
#define T0_KAOS_RANVAL_61     0x00fb56db
#define T0_KAOS_RANVAL_62     0xa0221c03
#define T0_KAOS_RANVAL_63     0xb9dbb6db
#define T0_KAOS_RANVAL_64     0x8b2da917
#define T0_KAOS_RANVAL_65     0x9ed8d55b
#define T0_KAOS_RANVAL_66     0x351653e3
#define T0_KAOS_RANVAL_67     0x3a306e2f
#define T0_KAOS_RANVAL_68     0xc1a85dc0
#define T0_KAOS_RANVAL_69     0xc6f512f0
#define T0_KAOS_RANVAL_6a     0x748e9006
#define T0_KAOS_RANVAL_6b     0xd8e20d79
#define T0_KAOS_RANVAL_6c     0x6886c972
#define T0_KAOS_RANVAL_6d     0x05887bc8
#define T0_KAOS_RANVAL_6e     0x937252d0
#define T0_KAOS_RANVAL_6f     0xdb3241b2
#define T0_KAOS_RANVAL_70     0x0cb2d0a9
#define T0_KAOS_RANVAL_71     0x68945440
#define T0_KAOS_RANVAL_72     0x00769e44
#define T0_KAOS_RANVAL_73     0xe4ed3bb8
#define T0_KAOS_RANVAL_74     0x17b3de46
#define T0_KAOS_RANVAL_75     0x0388c49a
#define T0_KAOS_RANVAL_76     0x8244a7a6
#define T0_KAOS_RANVAL_77     0x6779851d
#define T0_KAOS_RANVAL_78     0x5e12f9d9
#define T0_KAOS_RANVAL_79     0xfa936bed
#define T0_KAOS_RANVAL_7a     0xb0e5a161
#define T0_KAOS_RANVAL_7b     0x024fce3b
#define T0_KAOS_RANVAL_7c     0x27f37e22
#define T0_KAOS_RANVAL_7d     0x194fae5c
#define T0_KAOS_RANVAL_7e     0xb506bf2b
#define T0_KAOS_RANVAL_7f     0x17d9098b
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
/* @(#)kaos.h	1.34 03/15/02 17:10:21
 * kaos data area and stack frame
 */
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
/* @(#)kaos_startup.s	1.64 02/04/97 08:57:11
 * Assembly linkage to code generated by ktbgen
 *
 * If you add a simulation vs. silicon #if in here, be sure to
 * have a #else clause with nop's to make the addresses come out
 * the same in both simulation and silicon.
 */

/* @(#)kaos.h	1.34 03/15/02 17:10:21
 * kaos data area and stack frame
 */
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
!    areaoffset     7872
!    ncache         0
!    emulate_ncache 1
!    pagesize       8192
!    invsize        0
!    codecount      4002
!    code           2deba000
!    entry          2deba000
!    fsr_exceptions 00000000
!    fsr_roundmode  00000004
!    fsr_mask       c0000fff
!    seed           d31a6aac0cf1
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

KTEXT_MODULE(t0_module_ktbl, 0x2deba000)
.seg "text"
	KGLOBAL(t0_ktbl)
t0_ktbl_page_begin:
.global t0_kref; t0_kref:
	.skip 0
t0_ktbl:
	.word	0x96c6b3bd	! t0_kref+0x0:   	addccc	%i2, -0xc43, %o3
	.word	0x95a0192a	! t0_kref+0x4:   	fstod	%f10, %f10
	.word	0x95b2872a	! t0_kref+0x8:   	fmuld8ulx16	%f10, %f10, %f10
	.word	0x95a000ca	! t0_kref+0xc:   	fnegd	%f10, %f10
	.word	0xe43e0000	! t0_kref+0x10:   	std	%l2, [%i0]
	.word	0x9744c000	! t0_kref+0x14:   	mov	%gsr, %o3
	.word	0x9f414000	! t0_kref+0x18:   	mov	%pc, %o7
	.word	0x96b6a8b4	! t0_kref+0x1c:   	orncc	%i2, 0x8b4, %o3
	.word	0xd51f4019	! t0_kref+0x20:   	ldd	[%i5 + %i1], %f10
	.word	0x97b00120	! t0_kref+0x24:   	edge32n	%g0, %g0, %o3
	.word	0x95a289ab	! t0_kref+0x28:   	fdivs	%f10, %f11, %f10
	.word	0x965e801a	! t0_kref+0x2c:   	smul	%i2, %i2, %o3
	.word	0x95b2cea0	! t0_kref+0x30:   	fsrc1s	%f11, %f10
	.word	0x972ea017	! t0_kref+0x34:   	sll	%i2, 0x17, %o3
	.word	0x95b28aca	! t0_kref+0x38:   	fpsub32	%f10, %f10, %f10
	.word	0x9656801a	! t0_kref+0x3c:   	umul	%i2, %i2, %o3
	.word	0x9728200d	! t0_kref+0x40:   	sll	%g0, 0xd, %o3
	.word	0x96a82a41	! t0_kref+0x44:   	andncc	%g0, 0xa41, %o3
	.word	0xf4366006	! t0_kref+0x48:   	sth	%i2, [%i1 + 6]
	.word	0x9fc00004	! t0_kref+0x4c:   	call	%g0 + %g4
	.word	0x1704fc50	! t0_kref+0x50:   	sethi	%hi(0x13f14000), %o3
	.word	0x9f414000	! t0_kref+0x54:   	mov	%pc, %o7
	.word	0xd51fbe60	! t0_kref+0x58:   	ldd	[%fp - 0x1a0], %f10
	.word	0x9618001a	! t0_kref+0x5c:   	xor	%g0, %i2, %o3
	.word	0x963ea3f7	! t0_kref+0x60:   	xnor	%i2, 0x3f7, %o3
	.word	0x81580000	! t0_kref+0x64:   	flushw
	.word	0xd51fbd48	! t0_kref+0x68:   	ldd	[%fp - 0x2b8], %f10
	.word	0x95a0192a	! t0_kref+0x6c:   	fstod	%f10, %f10
	.word	0x95a2894a	! t0_kref+0x70:   	fmuld	%f10, %f10, %f10
	.word	0x97368000	! t0_kref+0x74:   	srl	%i2, %g0, %o3
	.word	0x8143c000	! t0_kref+0x78:   	stbar
	.word	0x95a000ab	! t0_kref+0x7c:   	fnegs	%f11, %f10
	.word	0xd6100019	! t0_kref+0x80:   	lduh	[%g0 + %i1], %o3
	.word	0x97a0052b	! t0_kref+0x84:   	fsqrts	%f11, %f11
	.word	0x95a2894a	! t0_kref+0x88:   	fmuld	%f10, %f10, %f10
	.word	0x960e8000	! t0_kref+0x8c:   	and	%i2, %g0, %o3
	.word	0x96b68000	! t0_kref+0x90:   	orncc	%i2, %g0, %o3
	.word	0x97a01a2a	! t0_kref+0x94:   	fstoi	%f10, %f11
	.word	0x95a9804a	! t0_kref+0x98:   	fmovdg	%fcc0, %f10, %f10
	.word	0xd6564000	! t0_kref+0x9c:   	ldsh	[%i1], %o3
	.word	0x96b82607	! t0_kref+0xa0:   	xnorcc	%g0, 0x607, %o3
	.word	0x9700001a	! t0_kref+0xa4:   	taddcc	%g0, %i2, %o3
	.word	0x95a0054a	! t0_kref+0xa8:   	fsqrtd	%f10, %f10
	.word	0x81dec00c	! t0_kref+0xac:   	flush	%i3 + %o4
	.word	0x97b68020	! t0_kref+0xb0:   	edge8n	%i2, %g0, %o3
	.word	0x95b00ceb	! t0_kref+0xb4:   	fnot2s	%f11, %f10
	.word	0x96303269	! t0_kref+0xb8:   	orn	%g0, -0xd97, %o3
	.word	0x97618000	! t0_kref+0xbc:   	movg	%fcc0, %g0, %o3
	.word	0x9fc00004	! t0_kref+0xc0:   	call	%g0 + %g4
	.word	0xc768a042	! t0_kref+0xc4:   	prefetch	%g2 + 0x42, 3
	.word	0x967eb645	! t0_kref+0xc8:   	sdiv	%i2, -0x9bb, %o3
	.word	0xc807bfe8	! t0_kref+0xcc:   	ld	[%fp - 0x18], %g4
	.word	0xd6801018	! t0_kref+0xd0:   	lda	[%g0 + %i0]0x80, %o3
	.word	0x86102002	! t0_kref+0xd4:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0xd8:   	bne,a	_kref+0xd8
	.word	0x86a0e001	! t0_kref+0xdc:   	subcc	%g3, 1, %g3
	.word	0x95a2cd2b	! t0_kref+0xe0:   	fsmuld	%f11, %f11, %f10
	.word	0xc568a088	! t0_kref+0xe4:   	prefetch	%g2 + 0x88, 2
	.word	0xa7800000	! t0_kref+0xe8:   	mov	%g0, %gsr
	.word	0x83414000	! t0_kref+0xec:   	mov	%pc, %g1
	.word	0xc807bfec	! t0_kref+0xf0:   	ld	[%fp - 0x14], %g4
	.word	0xd6163ffc	! t0_kref+0xf4:   	lduh	[%i0 - 4], %o3
	.word	0x95b2cd60	! t0_kref+0xf8:   	fnot1s	%f11, %f10
	.word	0x96568000	! t0_kref+0xfc:   	umul	%i2, %g0, %o3
	.word	0x95a0192a	! t0_kref+0x100:   	fstod	%f10, %f10
	.word	0x81800000	! t0_kref+0x104:   	mov	%g0, %y
	.word	0x95a2894a	! t0_kref+0x108:   	fmuld	%f10, %f10, %f10
	.word	0xf207bfe0	! t0_kref+0x10c:   	ld	[%fp - 0x20], %i1
	.word	0x95b00c00	! t0_kref+0x110:   	fzero	%f10
	.word	0x97003fcb	! t0_kref+0x114:   	taddcc	%g0, -0x35, %o3
	.word	0x97a0012b	! t0_kref+0x118:   	fabss	%f11, %f11
	.word	0x97a2892a	! t0_kref+0x11c:   	fmuls	%f10, %f10, %f11
	.word	0x95a288ca	! t0_kref+0x120:   	fsubd	%f10, %f10, %f10
	.word	0x95b2870b	! t0_kref+0x124:   	fmuld8sux16	%f10, %f11, %f10
	.word	0x95b28e0a	! t0_kref+0x128:   	fand	%f10, %f10, %f10
	.word	0x972ea007	! t0_kref+0x12c:   	sll	%i2, 0x7, %o3
	.word	0x96e6bd4d	! t0_kref+0x130:   	subccc	%i2, -0x2b3, %o3
	.word	0x95a0192a	! t0_kref+0x134:   	fstod	%f10, %f10
	.word	0x97b284ca	! t0_kref+0x138:   	fcmpne32	%f10, %f10, %o3
	.word	0x96e00000	! t0_kref+0x13c:   	subccc	%g0, %g0, %o3
	.word	0x9766801a	! t0_kref+0x140:   	movg	%icc, %i2, %o3
	.word	0x97b28e2a	! t0_kref+0x144:   	fands	%f10, %f10, %f11
	.word	0x97b284ca	! t0_kref+0x148:   	fcmpne32	%f10, %f10, %o3
	.word	0x96300000	! t0_kref+0x14c:   	orn	%g0, %g0, %o3
	.word	0x95a289ab	! t0_kref+0x150:   	fdivs	%f10, %f11, %f10
	.word	0x97a000ab	! t0_kref+0x154:   	fnegs	%f11, %f11
	.word	0x961ebb41	! t0_kref+0x158:   	xor	%i2, -0x4bf, %o3
	.word	0x97a9002b	! t0_kref+0x15c:   	fmovsl	%fcc0, %f11, %f11
	.word	0x96d0001a	! t0_kref+0x160:   	umulcc	%g0, %i2, %o3
	.word	0x95a000aa	! t0_kref+0x164:   	fnegs	%f10, %f10
	.word	0x96e00000	! t0_kref+0x168:   	subccc	%g0, %g0, %o3
	.word	0xe56e3fe8	! t0_kref+0x16c:   	prefetch	%i0 - 0x18, 18
	.word	0xf4b61000	! t0_kref+0x170:   	stha	%i2, [%i0]0x80
	.word	0x96568000	! t0_kref+0x174:   	umul	%i2, %g0, %o3
	.word	0x96f03e3d	! t0_kref+0x178:   	udivcc	%g0, -0x1c3, %o3
	.word	0x97400000	! t0_kref+0x17c:   	mov	%y, %o3
	.word	0x97a0052b	! t0_kref+0x180:   	fsqrts	%f11, %f11
	.word	0xd19e9a18	! t0_kref+0x184:   	ldda	[%i2 + %i0]0xd0, %f8
	.word	0x95b28a4a	! t0_kref+0x188:   	fpadd32	%f10, %f10, %f10
	.word	0x9740c000	! t0_kref+0x18c:   	mov	%asi, %o3
	.word	0x97b2cf6a	! t0_kref+0x190:   	fornot1s	%f11, %f10, %f11
	.word	0x95b2cc6a	! t0_kref+0x194:   	fnors	%f11, %f10, %f10
	.word	0xd600a02c	! t0_kref+0x198:   	ld	[%g2 + 0x2c], %o3
	.word	0xe41e6010	! t0_kref+0x19c:   	ldd	[%i1 + 0x10], %l2
	.word	0x95b28d40	! t0_kref+0x1a0:   	fnot1	%f10, %f10
	.word	0x97b284ca	! t0_kref+0x1a4:   	fcmpne32	%f10, %f10, %o3
	.word	0x95a0192b	! t0_kref+0x1a8:   	fstod	%f11, %f10
	.word	0x95b28d0a	! t0_kref+0x1ac:   	fandnot1	%f10, %f10, %f10
	.word	0x95a0192b	! t0_kref+0x1b0:   	fstod	%f11, %f10
	.word	0xc0360000	! t0_kref+0x1b4:   	clrh	[%i0]
	.word	0xd700a004	! t0_kref+0x1b8:   	ld	[%g2 + 4], %f11
	.word	0xc0f6501d	! t0_kref+0x1bc:   	stxa	%g0, [%i1 + %i5]0x80
	.word	0x96be801a	! t0_kref+0x1c0:   	xnorcc	%i2, %i2, %o3
	.word	0x86102003	! t0_kref+0x1c4:   	mov	0x3, %g3
	.word	0x86a0e001	! t0_kref+0x1c8:   	subcc	%g3, 1, %g3
	.word	0x2280000b	! t0_kref+0x1cc:   	be,a	_kref+0x1f8
	.word	0xe3e65000	! t0_kref+0x1d0:   	casa	[%i1]0x80, %g0, %l1
	.word	0x9740c000	! t0_kref+0x1d4:   	mov	%asi, %o3
	.word	0x97b68200	! t0_kref+0x1d8:   	array8	%i2, %g0, %o3
	.word	0x95a0054a	! t0_kref+0x1dc:   	fsqrtd	%f10, %f10
	.word	0x95b2872b	! t0_kref+0x1e0:   	fmuld8ulx16	%f10, %f11, %f10
	.word	0x95b28ea0	! t0_kref+0x1e4:   	fsrc1s	%f10, %f10
	.word	0x97b2cdab	! t0_kref+0x1e8:   	fxors	%f11, %f11, %f11
	.word	0x96d6801a	! t0_kref+0x1ec:   	umulcc	%i2, %i2, %o3
	.word	0x97a0188a	! t0_kref+0x1f0:   	fitos	%f10, %f11
	.word	0x85868000	! t0_kref+0x1f4:   	wr	%i2, %g0, %ccr
	.word	0x9736a016	! t0_kref+0x1f8:   	srl	%i2, 0x16, %o3
	.word	0xd6d81019	! t0_kref+0x1fc:   	ldxa	[%g0 + %i1]0x80, %o3
	.word	0xd5267ff0	! t0_kref+0x200:   	st	%f10, [%i1 - 0x10]
	.word	0x97a01a4a	! t0_kref+0x204:   	fdtoi	%f10, %f11
	.word	0x9646801a	! t0_kref+0x208:   	addc	%i2, %i2, %o3
	.word	0xe01e4000	! t0_kref+0x20c:   	ldd	[%i1], %l0
	.word	0x96f0001a	! t0_kref+0x210:   	udivcc	%g0, %i2, %o3
	.word	0x97400000	! t0_kref+0x214:   	mov	%y, %o3
	.word	0x97a01a4a	! t0_kref+0x218:   	fdtoi	%f10, %f11
	.word	0x9fc10000	! t0_kref+0x21c:   	call	%g4
	.word	0x96703e98	! t0_kref+0x220:   	udiv	%g0, -0x168, %o3
	.word	0x972e801a	! t0_kref+0x224:   	sll	%i2, %i2, %o3
	.word	0x9646801a	! t0_kref+0x228:   	addc	%i2, %i2, %o3
	.word	0x97200000	! t0_kref+0x22c:   	mulscc	%g0, %g0, %o3
	.word	0xe03e001d	! t0_kref+0x230:   	std	%l0, [%i0 + %i5]
	.word	0x97400000	! t0_kref+0x234:   	mov	%y, %o3
	.word	0x95a28d2a	! t0_kref+0x238:   	fsmuld	%f10, %f10, %f10
	.word	0x95a2cd2b	! t0_kref+0x23c:   	fsmuld	%f11, %f11, %f10
	.word	0xd53f4019	! t0_kref+0x240:   	std	%f10, [%i5 + %i1]
	.word	0x97a0002a	! t0_kref+0x244:   	fmovs	%f10, %f11
	.word	0x86102001	! t0_kref+0x248:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x24c:   	bne,a	_kref+0x24c
	.word	0x86a0e001	! t0_kref+0x250:   	subcc	%g3, 1, %g3
	.word	0x961833ae	! t0_kref+0x254:   	xor	%g0, -0xc52, %o3
	.word	0x9640001a	! t0_kref+0x258:   	addc	%g0, %i2, %o3
	.word	0x8143c000	! t0_kref+0x25c:   	stbar
	.word	0x97400000	! t0_kref+0x260:   	mov	%y, %o3
	.word	0x96182f49	! t0_kref+0x264:   	xor	%g0, 0xf49, %o3
	.word	0xd656001b	! t0_kref+0x268:   	ldsh	[%i0 + %i3], %o3
	.word	0x97200000	! t0_kref+0x26c:   	mulscc	%g0, %g0, %o3
	.word	0x97b2850a	! t0_kref+0x270:   	fcmpgt16	%f10, %f10, %o3
	.word	0xd51e6010	! t0_kref+0x274:   	ldd	[%i1 + 0x10], %f10
	.word	0x97b6803a	! t0_kref+0x278:   	edge8n	%i2, %i2, %o3
	.word	0x97400000	! t0_kref+0x27c:   	mov	%y, %o3
	.word	0x97b00ceb	! t0_kref+0x280:   	fnot2s	%f11, %f11
	.word	0x95b00f0a	! t0_kref+0x284:   	fsrc2	%f10, %f10
	.word	0x95b2866a	! t0_kref+0x288:   	fmul8x16au	%f10, %f10, %f10
	.word	0x97b00fe0	! t0_kref+0x28c:   	fones	%f11
	.word	0xd60e4000	! t0_kref+0x290:   	ldub	[%i1], %o3
	.word	0x9656b483	! t0_kref+0x294:   	umul	%i2, -0xb7d, %o3
	.word	0xd5260000	! t0_kref+0x298:   	st	%f10, [%i0]
	.word	0x81580000	! t0_kref+0x29c:   	flushw
	.word	0x9740c000	! t0_kref+0x2a0:   	mov	%asi, %o3
	.word	0xe0180018	! t0_kref+0x2a4:   	ldd	[%g0 + %i0], %l0
	.word	0xd656401b	! t0_kref+0x2a8:   	ldsh	[%i1 + %i3], %o3
	.word	0xe43e3ff8	! t0_kref+0x2ac:   	std	%l2, [%i0 - 8]
	.word	0x95a2884a	! t0_kref+0x2b0:   	faddd	%f10, %f10, %f10
	.word	0x961e8000	! t0_kref+0x2b4:   	xor	%i2, %g0, %o3
	.word	0x960ead0e	! t0_kref+0x2b8:   	and	%i2, 0xd0e, %o3
	.word	0x8143c000	! t0_kref+0x2bc:   	stbar
	.word	0xd6160000	! t0_kref+0x2c0:   	lduh	[%i0], %o3
	.word	0x9744c000	! t0_kref+0x2c4:   	mov	%gsr, %o3
	.word	0xd51f4019	! t0_kref+0x2c8:   	ldd	[%i5 + %i1], %f10
	.word	0x95a0188b	! t0_kref+0x2cc:   	fitos	%f11, %f10
	.word	0x9636801a	! t0_kref+0x2d0:   	orn	%i2, %i2, %o3
	.word	0x96500000	! t0_kref+0x2d4:   	umul	%g0, %g0, %o3
	.word	0x95a000ab	! t0_kref+0x2d8:   	fnegs	%f11, %f10
	.word	0x95a0054a	! t0_kref+0x2dc:   	fsqrtd	%f10, %f10
	.word	0xd6de501d	! t0_kref+0x2e0:   	ldxa	[%i1 + %i5]0x80, %o3
	.word	0x3b480006	! t0_kref+0x2e4:   	fble,a,pt	%fcc0, _kref+0x2fc
	.word	0x9610334c	! t0_kref+0x2e8:   	mov	0xfffff34c, %o3
	.word	0x95a2884a	! t0_kref+0x2ec:   	faddd	%f10, %f10, %f10
	.word	0xd6064000	! t0_kref+0x2f0:   	ld	[%i1], %o3
	.word	0x97a2882b	! t0_kref+0x2f4:   	fadds	%f10, %f11, %f11
	.word	0xed68a08a	! t0_kref+0x2f8:   	prefetch	%g2 + 0x8a, 22
	.word	0x86102002	! t0_kref+0x2fc:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x300:   	bne,a	_kref+0x300
	.word	0x86a0e001	! t0_kref+0x304:   	subcc	%g3, 1, %g3
	.word	0xe43e401d	! t0_kref+0x308:   	std	%l2, [%i1 + %i5]
	.word	0xd6d81018	! t0_kref+0x30c:   	ldxa	[%g0 + %i0]0x80, %o3
	.word	0x9636801a	! t0_kref+0x310:   	orn	%i2, %i2, %o3
	.word	0x81aacaab	! t0_kref+0x314:   	fcmpes	%fcc0, %f11, %f11
	.word	0x96f0001a	! t0_kref+0x318:   	udivcc	%g0, %i2, %o3
	.word	0x97b68100	! t0_kref+0x31c:   	edge32	%i2, %g0, %o3
	.word	0x97b2cea0	! t0_kref+0x320:   	fsrc1s	%f11, %f11
	.word	0x96a6ab5c	! t0_kref+0x324:   	subcc	%i2, 0xb5c, %o3
	.word	0x96900000	! t0_kref+0x328:   	orcc	%g0, %g0, %o3
	.word	0x97408000	! t0_kref+0x32c:   	mov	%ccr, %o3
	.word	0xd51fbc50	! t0_kref+0x330:   	ldd	[%fp - 0x3b0], %f10
	.word	0x9658001a	! t0_kref+0x334:   	smul	%g0, %i2, %o3
	.word	0x97280000	! t0_kref+0x338:   	sll	%g0, %g0, %o3
	.word	0x9736a01d	! t0_kref+0x33c:   	srl	%i2, 0x1d, %o3
	.word	0x81aa8aca	! t0_kref+0x340:   	fcmped	%fcc0, %f10, %f10
	.word	0x95b28d0a	! t0_kref+0x344:   	fandnot1	%f10, %f10, %f10
	.word	0x972ea01a	! t0_kref+0x348:   	sll	%i2, 0x1a, %o3
	.word	0x95a0192b	! t0_kref+0x34c:   	fstod	%f11, %f10
	.word	0xd1be1800	! t0_kref+0x350:   	stda	%f8, [%i0]0xc0
	.word	0xe41e401d	! t0_kref+0x354:   	ldd	[%i1 + %i5], %l2
	.word	0x97400000	! t0_kref+0x358:   	mov	%y, %o3
	.word	0x97b68340	! t0_kref+0x35c:   	alignaddrl	%i2, %g0, %o3
	.word	0xd656c018	! t0_kref+0x360:   	ldsh	[%i3 + %i0], %o3
	.word	0xd51fbfa0	! t0_kref+0x364:   	ldd	[%fp - 0x60], %f10
	.word	0x95a2894a	! t0_kref+0x368:   	fmuld	%f10, %f10, %f10
	.word	0x95a0014a	! t0_kref+0x36c:   	fabsd	%f10, %f10
	.word	0x95b28d40	! t0_kref+0x370:   	fnot1	%f10, %f10
	.word	0x97a01a4a	! t0_kref+0x374:   	fdtoi	%f10, %f11
	.word	0x96e6801a	! t0_kref+0x378:   	subccc	%i2, %i2, %o3
	.word	0x96f031d8	! t0_kref+0x37c:   	udivcc	%g0, -0xe28, %o3
	.word	0x9726aa0e	! t0_kref+0x380:   	mulscc	%i2, 0xa0e, %o3
	.word	0x95a0002b	! t0_kref+0x384:   	fmovs	%f11, %f10
	.word	0xd60e0000	! t0_kref+0x388:   	ldub	[%i0], %o3
	.word	0x97a0012b	! t0_kref+0x38c:   	fabss	%f11, %f11
	.word	0xc5386498	! t0_kref+0x390:   	std	%f2, [%g1 + 0x498]
	.word	0x968027be	! t0_kref+0x394:   	addcc	%g0, 0x7be, %o3
	.word	0xfb6e6008	! t0_kref+0x398:   	prefetch	%i1 + 8, 29
	.word	0xd51e6010	! t0_kref+0x39c:   	ldd	[%i1 + 0x10], %f10
	.word	0xd59f5018	! t0_kref+0x3a0:   	ldda	[%i5 + %i0]0x80, %f10
	.word	0x9700001a	! t0_kref+0x3a4:   	taddcc	%g0, %i2, %o3
	.word	0x97a01a4a	! t0_kref+0x3a8:   	fdtoi	%f10, %f11
	.word	0x9696801a	! t0_kref+0x3ac:   	orcc	%i2, %i2, %o3
	.word	0x95b2ceea	! t0_kref+0x3b0:   	fornot2s	%f11, %f10, %f10
	.word	0xe43e6000	! t0_kref+0x3b4:   	std	%l2, [%i1]
	.word	0x97b68340	! t0_kref+0x3b8:   	alignaddrl	%i2, %g0, %o3
	.word	0x967ea11f	! t0_kref+0x3bc:   	sdiv	%i2, 0x11f, %o3
	.word	0x95b009ab	! t0_kref+0x3c0:   	fexpand	%f11, %f10
	.word	0x95b2870b	! t0_kref+0x3c4:   	fmuld8sux16	%f10, %f11, %f10
	.word	0x95b2c72a	! t0_kref+0x3c8:   	fmuld8ulx16	%f11, %f10, %f10
	.word	0x96668000	! t0_kref+0x3cc:   	subc	%i2, %g0, %o3
	.word	0x960823e7	! t0_kref+0x3d0:   	and	%g0, 0x3e7, %o3
	.word	0x9686801a	! t0_kref+0x3d4:   	addcc	%i2, %i2, %o3
	.word	0x95b2862a	! t0_kref+0x3d8:   	fmul8x16	%f10, %f10, %f10
	.word	0x95b2866b	! t0_kref+0x3dc:   	fmul8x16au	%f10, %f11, %f10
	.word	0x96dea964	! t0_kref+0x3e0:   	smulcc	%i2, 0x964, %o3
	.word	0x96183456	! t0_kref+0x3e4:   	xor	%g0, -0xbaa, %o3
	.word	0x97a2c92a	! t0_kref+0x3e8:   	fmuls	%f11, %f10, %f11
	.word	0x96180000	! t0_kref+0x3ec:   	xor	%g0, %g0, %o3
	.word	0x96182557	! t0_kref+0x3f0:   	xor	%g0, 0x557, %o3
	.word	0xd650a00a	! t0_kref+0x3f4:   	ldsh	[%g2 + 0xa], %o3
	.word	0x81868000	! t0_kref+0x3f8:   	wr	%i2, %g0, %y
	.word	0xede6501a	! t0_kref+0x3fc:   	casa	[%i1]0x80, %i2, %l6
	.word	0x95b2898a	! t0_kref+0x400:   	bshuffle	%f10, %f10, %f10
	.word	0x97b68160	! t0_kref+0x404:   	edge32ln	%i2, %g0, %o3
	.word	0x97202c24	! t0_kref+0x408:   	mulscc	%g0, 0xc24, %o3
	.word	0x95a0004a	! t0_kref+0x40c:   	fmovd	%f10, %f10
	.word	0x95a2884a	! t0_kref+0x410:   	faddd	%f10, %f10, %f10
	.word	0x95b28d40	! t0_kref+0x414:   	fnot1	%f10, %f10
	.word	0x97a0012b	! t0_kref+0x418:   	fabss	%f11, %f11
	.word	0x81b01021	! t0_kref+0x41c:   	siam	0x1
	.word	0xe49f5018	! t0_kref+0x420:   	ldda	[%i5 + %i0]0x80, %l2
	.word	0xe41e3fe0	! t0_kref+0x424:   	ldd	[%i0 - 0x20], %l2
	.word	0x22800001	! t0_kref+0x428:   	be,a	_kref+0x42c
	.word	0xe46e401a	! t0_kref+0x42c:   	ldstub	[%i1 + %i2], %l2
	.word	0x97a288aa	! t0_kref+0x430:   	fsubs	%f10, %f10, %f11
	.word	0xd6de1000	! t0_kref+0x434:   	ldxa	[%i0]0x80, %o3
	.word	0x81aacaab	! t0_kref+0x438:   	fcmpes	%fcc0, %f11, %f11
	.word	0xd51e7fe8	! t0_kref+0x43c:   	ldd	[%i1 - 0x18], %f10
	.word	0x96beb6f5	! t0_kref+0x440:   	xnorcc	%i2, -0x90b, %o3
	.word	0x96e0239f	! t0_kref+0x444:   	subccc	%g0, 0x39f, %o3
	.word	0xc568a083	! t0_kref+0x448:   	prefetch	%g2 + 0x83, 2
	.word	0x95a2cd2a	! t0_kref+0x44c:   	fsmuld	%f11, %f10, %f10
	.word	0x96e68000	! t0_kref+0x450:   	subccc	%i2, %g0, %o3
	.word	0xd650a010	! t0_kref+0x454:   	ldsh	[%g2 + 0x10], %o3
	.word	0x95b2874a	! t0_kref+0x458:   	fpack32	%f10, %f10, %f10
	.word	0x878020e0	! t0_kref+0x45c:   	mov	0xe0, %asi
	.word	0x97b68240	! t0_kref+0x460:   	array16	%i2, %g0, %o3
	.word	0x23800002	! t0_kref+0x464:   	fbne,a	_kref+0x46c
	.word	0xd6464000	! t0_kref+0x468:   	ldsw	[%i1], %o3
	.word	0x81868000	! t0_kref+0x46c:   	wr	%i2, %g0, %y
	.word	0x961eaab3	! t0_kref+0x470:   	xor	%i2, 0xab3, %o3
	.word	0x9696aad6	! t0_kref+0x474:   	orcc	%i2, 0xad6, %o3
	.word	0x96be8000	! t0_kref+0x478:   	xnorcc	%i2, %g0, %o3
	.word	0x97a0052a	! t0_kref+0x47c:   	fsqrts	%f10, %f11
	.word	0x95a0192b	! t0_kref+0x480:   	fstod	%f11, %f10
	.word	0x9626801a	! t0_kref+0x484:   	sub	%i2, %i2, %o3
	.word	0x9e0063a0	! t0_kref+0x488:   	add	%g1, 0x3a0, %o7
!	.word	0x3ca78eda	! t0_kref+0x48c:   	bpos,a	SYM(t0_subr2)
	   	bpos,a	SYM(t0_subr2)
	.word	0x96a80000	! t0_kref+0x490:   	andncc	%g0, %g0, %o3
	.word	0xd606401c	! t0_kref+0x494:   	ld	[%i1 + %i4], %o3
	.word	0xd720a004	! t0_kref+0x498:   	st	%f11, [%g2 + 4]
	.word	0x961e8000	! t0_kref+0x49c:   	xor	%i2, %g0, %o3
	.word	0x9656bec0	! t0_kref+0x4a0:   	umul	%i2, -0x140, %o3
	.word	0x960e801a	! t0_kref+0x4a4:   	and	%i2, %i2, %o3
	.word	0x95b2872b	! t0_kref+0x4a8:   	fmuld8ulx16	%f10, %f11, %f10
	.word	0x95a288ca	! t0_kref+0x4ac:   	fsubd	%f10, %f10, %f10
	.word	0x95a28d2a	! t0_kref+0x4b0:   	fsmuld	%f10, %f10, %f10
	.word	0x81aa8aab	! t0_kref+0x4b4:   	fcmpes	%fcc0, %f10, %f11
	.word	0x9f414000	! t0_kref+0x4b8:   	mov	%pc, %o7
	.word	0x95a0052b	! t0_kref+0x4bc:   	fsqrts	%f11, %f10
	.word	0x973e8000	! t0_kref+0x4c0:   	sra	%i2, %g0, %o3
	.word	0xd6881018	! t0_kref+0x4c4:   	lduba	[%g0 + %i0]0x80, %o3
	.word	0x96e02247	! t0_kref+0x4c8:   	subccc	%g0, 0x247, %o3
	.word	0x95b28eca	! t0_kref+0x4cc:   	fornot2	%f10, %f10, %f10
	.word	0x86102003	! t0_kref+0x4d0:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x4d4:   	bne,a	_kref+0x4d4
	.word	0x86a0e001	! t0_kref+0x4d8:   	subcc	%g3, 1, %g3
	.word	0x973ea01d	! t0_kref+0x4dc:   	sra	%i2, 0x1d, %o3
	.word	0x96082da4	! t0_kref+0x4e0:   	and	%g0, 0xda4, %o3
	.word	0x96600000	! t0_kref+0x4e4:   	subc	%g0, %g0, %o3
	.word	0x96d8001a	! t0_kref+0x4e8:   	smulcc	%g0, %i2, %o3
	.word	0x95a0188a	! t0_kref+0x4ec:   	fitos	%f10, %f10
	.word	0xc807bfec	! t0_kref+0x4f0:   	ld	[%fp - 0x14], %g4
	.word	0x9676b26e	! t0_kref+0x4f4:   	udiv	%i2, -0xd92, %o3
	.word	0x96403c81	! t0_kref+0x4f8:   	addc	%g0, -0x37f, %o3
	.word	0x95a2884a	! t0_kref+0x4fc:   	faddd	%f10, %f10, %f10
	.word	0x95b2c62a	! t0_kref+0x500:   	fmul8x16	%f11, %f10, %f10
	.word	0x95a2894a	! t0_kref+0x504:   	fmuld	%f10, %f10, %f10
	.word	0x95a0054a	! t0_kref+0x508:   	fsqrtd	%f10, %f10
	.word	0xd51fbd58	! t0_kref+0x50c:   	ldd	[%fp - 0x2a8], %f10
	.word	0x96e68000	! t0_kref+0x510:   	subccc	%i2, %g0, %o3
	.word	0x96a8241c	! t0_kref+0x514:   	andncc	%g0, 0x41c, %o3
	.word	0xc0a81019	! t0_kref+0x518:   	stba	%g0, [%g0 + %i1]0x80
	.word	0xd650a01e	! t0_kref+0x51c:   	ldsh	[%g2 + 0x1e], %o3
	.word	0xf4f6501d	! t0_kref+0x520:   	stxa	%i2, [%i1 + %i5]0x80
	.word	0x81dfeabe	! t0_kref+0x524:   	flush	%i7 + 0xabe
	.word	0x97a2c9aa	! t0_kref+0x528:   	fdivs	%f11, %f10, %f11
	.word	0x20800001	! t0_kref+0x52c:   	bn,a	_kref+0x530
	.word	0x96ae8000	! t0_kref+0x530:   	andncc	%i2, %g0, %o3
	.word	0x95a2cd2b	! t0_kref+0x534:   	fsmuld	%f11, %f11, %f10
	.word	0x9696a4ec	! t0_kref+0x538:   	orcc	%i2, 0x4ec, %o3
	.word	0x96e68000	! t0_kref+0x53c:   	subccc	%i2, %g0, %o3
	.word	0x37800007	! t0_kref+0x540:   	fbge,a	_kref+0x55c
	.word	0x96783851	! t0_kref+0x544:   	sdiv	%g0, -0x7af, %o3
	.word	0xc368a089	! t0_kref+0x548:   	prefetch	%g2 + 0x89, 1
	.word	0x97a0002b	! t0_kref+0x54c:   	fmovs	%f11, %f11
	.word	0xe03e6018	! t0_kref+0x550:   	std	%l0, [%i1 + 0x18]
	.word	0x95a0054a	! t0_kref+0x554:   	fsqrtd	%f10, %f10
	.word	0x97a2c9aa	! t0_kref+0x558:   	fdivs	%f11, %f10, %f11
	.word	0xa780001a	! t0_kref+0x55c:   	mov	%i2, %gsr
	.word	0x96ae8000	! t0_kref+0x560:   	andncc	%i2, %g0, %o3
	.word	0xd610a00c	! t0_kref+0x564:   	lduh	[%g2 + 0xc], %o3
	.word	0x81aa8aaa	! t0_kref+0x568:   	fcmpes	%fcc0, %f10, %f10
	.word	0x81dd000a	! t0_kref+0x56c:   	flush	%l4 + %o2
	.word	0x969e8000	! t0_kref+0x570:   	xorcc	%i2, %g0, %o3
	.word	0x96a8001a	! t0_kref+0x574:   	andncc	%g0, %i2, %o3
	.word	0x95a2884a	! t0_kref+0x578:   	faddd	%f10, %f10, %f10
	.word	0x969e801a	! t0_kref+0x57c:   	xorcc	%i2, %i2, %o3
	.word	0x960e8000	! t0_kref+0x580:   	and	%i2, %g0, %o3
	.word	0x1720655c	! t0_kref+0x584:   	sethi	%hi(0x81957000), %o3
	.word	0x96303d0c	! t0_kref+0x588:   	orn	%g0, -0x2f4, %o3
	.word	0x97b0005a	! t0_kref+0x58c:   	edge8l	%g0, %i2, %o3
	.word	0x95a0012b	! t0_kref+0x590:   	fabss	%f11, %f10
	.word	0xd6500018	! t0_kref+0x594:   	ldsh	[%g0 + %i0], %o3
	.word	0x878020d0	! t0_kref+0x598:   	mov	0xd0, %asi
	.word	0xd60e0000	! t0_kref+0x59c:   	ldub	[%i0], %o3
	.word	0x96beacb4	! t0_kref+0x5a0:   	xnorcc	%i2, 0xcb4, %o3
	.word	0x97b0001a	! t0_kref+0x5a4:   	edge8	%g0, %i2, %o3
	.word	0x95a288ca	! t0_kref+0x5a8:   	fsubd	%f10, %f10, %f10
	.word	0x95a0110a	! t0_kref+0x5ac:   	fxtod	%f10, %f10
	.word	0xd86e3fe0	! t0_kref+0x5b0:   	ldstub	[%i0 - 0x20], %o4
	.word	0x95b28d0a	! t0_kref+0x5b4:   	fandnot1	%f10, %f10, %f10
	.word	0x95a0054a	! t0_kref+0x5b8:   	fsqrtd	%f10, %f10
	.word	0x3f800003	! t0_kref+0x5bc:   	fbo,a	_kref+0x5c8
	.word	0x95b28d60	! t0_kref+0x5c0:   	fnot1s	%f10, %f10
	.word	0x95a01a4a	! t0_kref+0x5c4:   	fdtoi	%f10, %f10
	.word	0x38480007	! t0_kref+0x5c8:   	bgu,a,pt	%icc, _kref+0x5e4
	.word	0x95a2c9aa	! t0_kref+0x5cc:   	fdivs	%f11, %f10, %f10
	.word	0x97b6831a	! t0_kref+0x5d0:   	alignaddr	%i2, %i2, %o3
	.word	0x95a0054a	! t0_kref+0x5d4:   	fsqrtd	%f10, %f10
	.word	0x9660001a	! t0_kref+0x5d8:   	subc	%g0, %i2, %o3
	.word	0xc768a08e	! t0_kref+0x5dc:   	prefetch	%g2 + 0x8e, 3
	.word	0x81b01022	! t0_kref+0x5e0:   	siam	0x2
	.word	0x9760c000	! t0_kref+0x5e4:   	movul	%fcc0, %g0, %o3
	.word	0x9696ba4d	! t0_kref+0x5e8:   	orcc	%i2, -0x5b3, %o3
	.word	0x97b2cf6b	! t0_kref+0x5ec:   	fornot1s	%f11, %f11, %f11
	.word	0x96c68000	! t0_kref+0x5f0:   	addccc	%i2, %g0, %o3
	.word	0xd68e101a	! t0_kref+0x5f4:   	lduba	[%i0 + %i2]0x80, %o3
	.word	0x96d6a801	! t0_kref+0x5f8:   	umulcc	%i2, 0x801, %o3
	.word	0xd19eda59	! t0_kref+0x5fc:   	ldda	[%i3 + %i1]0xd2, %f8
	.word	0x9678001a	! t0_kref+0x600:   	sdiv	%g0, %i2, %o3
	.word	0x96bebd5a	! t0_kref+0x604:   	xnorcc	%i2, -0x2a6, %o3
	.word	0x95a2884a	! t0_kref+0x608:   	faddd	%f10, %f10, %f10
	.word	0xc768a088	! t0_kref+0x60c:   	prefetch	%g2 + 0x88, 3
	.word	0x97400000	! t0_kref+0x610:   	mov	%y, %o3
	.word	0x9698001a	! t0_kref+0x614:   	xorcc	%g0, %i2, %o3
	.word	0x96f0001a	! t0_kref+0x618:   	udivcc	%g0, %i2, %o3
	.word	0xd51fbe78	! t0_kref+0x61c:   	ldd	[%fp - 0x188], %f10
	.word	0x96968000	! t0_kref+0x620:   	orcc	%i2, %g0, %o3
	.word	0x95b28dca	! t0_kref+0x624:   	fnand	%f10, %f10, %f10
	.word	0xd6062014	! t0_kref+0x628:   	ld	[%i0 + 0x14], %o3
	.word	0x97302016	! t0_kref+0x62c:   	srl	%g0, 0x16, %o3
	.word	0xc036c019	! t0_kref+0x630:   	clrh	[%i3 + %i1]
	.word	0x95a01a4a	! t0_kref+0x634:   	fdtoi	%f10, %f10
	.word	0x97b28caa	! t0_kref+0x638:   	fandnot2s	%f10, %f10, %f11
	.word	0x97a2c82b	! t0_kref+0x63c:   	fadds	%f11, %f11, %f11
	.word	0xe49e1000	! t0_kref+0x640:   	ldda	[%i0]0x80, %l2
	.word	0xd5180018	! t0_kref+0x644:   	ldd	[%g0 + %i0], %f10
	.word	0x95a0188b	! t0_kref+0x648:   	fitos	%f11, %f10
	.word	0x95a2884a	! t0_kref+0x64c:   	faddd	%f10, %f10, %f10
	.word	0x97a0052b	! t0_kref+0x650:   	fsqrts	%f11, %f11
	.word	0x95a2cd2b	! t0_kref+0x654:   	fsmuld	%f11, %f11, %f10
	.word	0xd700a024	! t0_kref+0x658:   	ld	[%g2 + 0x24], %f11
	.word	0x95a28d2b	! t0_kref+0x65c:   	fsmuld	%f10, %f11, %f10
	.word	0x9680001a	! t0_kref+0x660:   	addcc	%g0, %i2, %o3
	.word	0xed68a04e	! t0_kref+0x664:   	prefetch	%g2 + 0x4e, 22
	.word	0xc568a008	! t0_kref+0x668:   	prefetch	%g2 + 8, 2
	.word	0x96d02856	! t0_kref+0x66c:   	umulcc	%g0, 0x856, %o3
	.word	0xd696501b	! t0_kref+0x670:   	lduha	[%i1 + %i3]0x80, %o3
	.word	0xe43e3ff8	! t0_kref+0x674:   	std	%l2, [%i0 - 8]
	.word	0xd19e1a1b	! t0_kref+0x678:   	ldda	[%i0 + %i3]0xd0, %f8
	.word	0x29800008	! t0_kref+0x67c:   	fbl,a	_kref+0x69c
	.word	0x95a0188b	! t0_kref+0x680:   	fitos	%f11, %f10
	.word	0x95a0004a	! t0_kref+0x684:   	fmovd	%f10, %f10
	.word	0x3d800007	! t0_kref+0x688:   	fbule,a	_kref+0x6a4
	.word	0x95a0192b	! t0_kref+0x68c:   	fstod	%f11, %f10
	.word	0x95a0110a	! t0_kref+0x690:   	fxtod	%f10, %f10
	.word	0x97400000	! t0_kref+0x694:   	mov	%y, %o3
	.word	0x97a01a2b	! t0_kref+0x698:   	fstoi	%f11, %f11
	.word	0x97b68200	! t0_kref+0x69c:   	array8	%i2, %g0, %o3
	.word	0x95a000aa	! t0_kref+0x6a0:   	fnegs	%f10, %f10
	.word	0x9660244c	! t0_kref+0x6a4:   	subc	%g0, 0x44c, %o3
	.word	0x97b00340	! t0_kref+0x6a8:   	alignaddrl	%g0, %g0, %o3
	.word	0x95a288ca	! t0_kref+0x6ac:   	fsubd	%f10, %f10, %f10
	.word	0x960e801a	! t0_kref+0x6b0:   	and	%i2, %i2, %o3
	.word	0x96beb676	! t0_kref+0x6b4:   	xnorcc	%i2, -0x98a, %o3
	.word	0xd51fbc58	! t0_kref+0x6b8:   	ldd	[%fp - 0x3a8], %f10
	.word	0x95b009aa	! t0_kref+0x6bc:   	fexpand	%f10, %f10
	.word	0x9fc10000	! t0_kref+0x6c0:   	call	%g4
	.word	0xd64e0000	! t0_kref+0x6c4:   	ldsb	[%i0], %o3
	.word	0xd51e7fe0	! t0_kref+0x6c8:   	ldd	[%i1 - 0x20], %f10
	.word	0xd60e3fff	! t0_kref+0x6cc:   	ldub	[%i0 - 1], %o3
	.word	0x97b2854a	! t0_kref+0x6d0:   	fcmpeq16	%f10, %f10, %o3
	.word	0x96368000	! t0_kref+0x6d4:   	orn	%i2, %g0, %o3
	.word	0x96d80000	! t0_kref+0x6d8:   	smulcc	%g0, %g0, %o3
	.word	0xed68a08f	! t0_kref+0x6dc:   	prefetch	%g2 + 0x8f, 22
	.word	0x97b6831a	! t0_kref+0x6e0:   	alignaddr	%i2, %i2, %o3
	.word	0xd1be1880	! t0_kref+0x6e4:   	stda	%f8, [%i0]0xc4
	.word	0xd7263ff0	! t0_kref+0x6e8:   	st	%f11, [%i0 - 0x10]
	.word	0x96700000	! t0_kref+0x6ec:   	udiv	%g0, %g0, %o3
	.word	0x9660001a	! t0_kref+0x6f0:   	subc	%g0, %i2, %o3
	.word	0x97b00240	! t0_kref+0x6f4:   	array16	%g0, %g0, %o3
	.word	0x97a0002a	! t0_kref+0x6f8:   	fmovs	%f10, %f11
	.word	0xd51e6008	! t0_kref+0x6fc:   	ldd	[%i1 + 8], %f10
	.word	0x97a0188b	! t0_kref+0x700:   	fitos	%f11, %f11
	.word	0x81dc0008	! t0_kref+0x704:   	flush	%l0 + %o0
	.word	0x97102964	! t0_kref+0x708:   	taddcctv	%g0, 0x964, %o3
	.word	0x97b2cd60	! t0_kref+0x70c:   	fnot1s	%f11, %f11
	.word	0x8610200b	! t0_kref+0x710:   	mov	0xb, %g3
	.word	0x86a0e001	! t0_kref+0x714:   	subcc	%g3, 1, %g3
	.word	0x22800020	! t0_kref+0x718:   	be,a	_kref+0x798
	.word	0xc06e7fe8	! t0_kref+0x71c:   	ldstub	[%i1 - 0x18], %g0
	.word	0x96a6bd17	! t0_kref+0x720:   	subcc	%i2, -0x2e9, %o3
	.word	0x967ea4f3	! t0_kref+0x724:   	sdiv	%i2, 0x4f3, %o3
	.word	0x95a28d2a	! t0_kref+0x728:   	fsmuld	%f10, %f10, %f10
	.word	0x9640001a	! t0_kref+0x72c:   	addc	%g0, %i2, %o3
	.word	0xd6881019	! t0_kref+0x730:   	lduba	[%g0 + %i1]0x80, %o3
	.word	0x96a6af70	! t0_kref+0x734:   	subcc	%i2, 0xf70, %o3
	.word	0x97b2850a	! t0_kref+0x738:   	fcmpgt16	%f10, %f10, %o3
	.word	0x96bea056	! t0_kref+0x73c:   	xnorcc	%i2, 0x56, %o3
	.word	0xd60e7fe7	! t0_kref+0x740:   	ldub	[%i1 - 0x19], %o3
	.word	0x2dbffff4	! t0_kref+0x744:   	fbg,a	_kref+0x714
	.word	0xe41e7ff8	! t0_kref+0x748:   	ldd	[%i1 - 8], %l2
	.word	0x95a2cd2a	! t0_kref+0x74c:   	fsmuld	%f11, %f10, %f10
	.word	0x9763401a	! t0_kref+0x750:   	movle	%fcc0, %i2, %o3
	.word	0xd6d0105b	! t0_kref+0x754:   	ldsha	[%g0 + %i3]0x82, %o3
	.word	0x8143c000	! t0_kref+0x758:   	stbar
	.word	0x96b03be9	! t0_kref+0x75c:   	orncc	%g0, -0x417, %o3
	.word	0x9f414000	! t0_kref+0x760:   	mov	%pc, %o7
	.word	0x95b2cea0	! t0_kref+0x764:   	fsrc1s	%f11, %f10
	.word	0x95a2884a	! t0_kref+0x768:   	faddd	%f10, %f10, %f10
	.word	0x96b80000	! t0_kref+0x76c:   	xnorcc	%g0, %g0, %o3
	.word	0x8143c000	! t0_kref+0x770:   	stbar
	.word	0x95b28faa	! t0_kref+0x774:   	fors	%f10, %f10, %f10
	.word	0x8143c000	! t0_kref+0x778:   	stbar
	.word	0x35800005	! t0_kref+0x77c:   	fbue,a	_kref+0x790
	.word	0x961e8000	! t0_kref+0x780:   	xor	%i2, %g0, %o3
	.word	0x95b00ceb	! t0_kref+0x784:   	fnot2s	%f11, %f10
	.word	0x97b680a0	! t0_kref+0x788:   	edge16n	%i2, %g0, %o3
	.word	0xd19e5a1a	! t0_kref+0x78c:   	ldda	[%i1 + %i2]0xd0, %f8
	.word	0x95a0012b	! t0_kref+0x790:   	fabss	%f11, %f10
	.word	0x97a018ca	! t0_kref+0x794:   	fdtos	%f10, %f11
	.word	0xf4a81019	! t0_kref+0x798:   	stba	%i2, [%g0 + %i1]0x80
	.word	0xf007bfe0	! t0_kref+0x79c:   	ld	[%fp - 0x20], %i0
	.word	0x95b00f2b	! t0_kref+0x7a0:   	fsrc2s	%f11, %f10
	.word	0x97b0031a	! t0_kref+0x7a4:   	alignaddr	%g0, %i2, %o3
	.word	0x8610201f	! t0_kref+0x7a8:   	mov	0x1f, %g3
	.word	0x86a0e001	! t0_kref+0x7ac:   	subcc	%g3, 1, %g3
	.word	0x22800010	! t0_kref+0x7b0:   	be,a	_kref+0x7f0
	.word	0xe43e3ff8	! t0_kref+0x7b4:   	std	%l2, [%i0 - 8]
	.word	0x96800000	! t0_kref+0x7b8:   	addcc	%g0, %g0, %o3
	.word	0x95b28e0a	! t0_kref+0x7bc:   	fand	%f10, %f10, %f10
	.word	0x96f00000	! t0_kref+0x7c0:   	udivcc	%g0, %g0, %o3
	.word	0x95a0192a	! t0_kref+0x7c4:   	fstod	%f10, %f10
	.word	0x97300000	! t0_kref+0x7c8:   	srl	%g0, %g0, %o3
	.word	0x97b2cdaa	! t0_kref+0x7cc:   	fxors	%f11, %f10, %f11
	.word	0x9618001a	! t0_kref+0x7d0:   	xor	%g0, %i2, %o3
	.word	0xc0b6d018	! t0_kref+0x7d4:   	stha	%g0, [%i3 + %i0]0x80
	.word	0x97b2858a	! t0_kref+0x7d8:   	fcmpgt32	%f10, %f10, %o3
	.word	0x3d480001	! t0_kref+0x7dc:   	fbule,a,pt	%fcc0, _kref+0x7e0
	.word	0x9610001a	! t0_kref+0x7e0:   	mov	%i2, %o3
	.word	0x95b2866a	! t0_kref+0x7e4:   	fmul8x16au	%f10, %f10, %f10
	.word	0x97b2854a	! t0_kref+0x7e8:   	fcmpeq16	%f10, %f10, %o3
	.word	0x96c0001a	! t0_kref+0x7ec:   	addccc	%g0, %i2, %o3
	.word	0xa780001a	! t0_kref+0x7f0:   	mov	%i2, %gsr
	.word	0xf426600c	! t0_kref+0x7f4:   	st	%i2, [%i1 + 0xc]
	.word	0x96aea60d	! t0_kref+0x7f8:   	andncc	%i2, 0x60d, %o3
	.word	0x34480005	! t0_kref+0x7fc:   	bg,a,pt	%icc, _kref+0x810
	.word	0x962ea874	! t0_kref+0x800:   	andn	%i2, 0x874, %o3
	.word	0x96582128	! t0_kref+0x804:   	smul	%g0, 0x128, %o3
	.word	0xf436401b	! t0_kref+0x808:   	sth	%i2, [%i1 + %i3]
	.word	0xc030a030	! t0_kref+0x80c:   	clrh	[%g2 + 0x30]
	.word	0x171462c2	! t0_kref+0x810:   	sethi	%hi(0x518b0800), %o3
	.word	0x95a2884a	! t0_kref+0x814:   	faddd	%f10, %f10, %f10
	.word	0xd51e7fe0	! t0_kref+0x818:   	ldd	[%i1 - 0x20], %f10
	.word	0x97b68320	! t0_kref+0x81c:   	bmask	%i2, %g0, %o3
	.word	0x9658001a	! t0_kref+0x820:   	smul	%g0, %i2, %o3
	.word	0x96b6b1e7	! t0_kref+0x824:   	orncc	%i2, -0xe19, %o3
	.word	0x965837ce	! t0_kref+0x828:   	smul	%g0, -0x832, %o3
	.word	0xd656001b	! t0_kref+0x82c:   	ldsh	[%i0 + %i3], %o3
	.word	0x95a2c82a	! t0_kref+0x830:   	fadds	%f11, %f10, %f10
	.word	0xd6de501d	! t0_kref+0x834:   	ldxa	[%i1 + %i5]0x80, %o3
	.word	0xe26e3ff4	! t0_kref+0x838:   	ldstub	[%i0 - 0xc], %l1
	.word	0x97280000	! t0_kref+0x83c:   	sll	%g0, %g0, %o3
	.word	0xe01f4018	! t0_kref+0x840:   	ldd	[%i5 + %i0], %l0
	.word	0x95a289ab	! t0_kref+0x844:   	fdivs	%f10, %f11, %f10
	.word	0x95a0004a	! t0_kref+0x848:   	fmovd	%f10, %f10
	.word	0x96d828fc	! t0_kref+0x84c:   	smulcc	%g0, 0x8fc, %o3
	.word	0x97626631	! t0_kref+0x850:   	move	%fcc0, -0x1cf, %o3
	.word	0x8143c000	! t0_kref+0x854:   	stbar
	.word	0x96be801a	! t0_kref+0x858:   	xnorcc	%i2, %i2, %o3
	.word	0x81dfbfb4	! t0_kref+0x85c:   	flush	%fp - 0x4c
	.word	0x8143c000	! t0_kref+0x860:   	stbar
	.word	0xf4367fe4	! t0_kref+0x864:   	sth	%i2, [%i1 - 0x1c]
	.word	0x95b2872a	! t0_kref+0x868:   	fmuld8ulx16	%f10, %f10, %f10
	.word	0x95a0192a	! t0_kref+0x86c:   	fstod	%f10, %f10
	call	1f
	.empty
	.word	0x95a2cd2b	! t0_kref+0x874:   	fsmuld	%f11, %f11, %f10
	.word	0xd51fbca0	! t0_kref+0x878:   	ldd	[%fp - 0x360], %f10
	.word	0x9736a01b	! t0_kref+0x87c:   	srl	%i2, 0x1b, %o3
1:	.word	0x9608001a	! t0_kref+0x880:   	and	%g0, %i2, %o3
	.word	0xd64e7fe3	! t0_kref+0x884:   	ldsb	[%i1 - 0x1d], %o3
	.word	0x97b0011a	! t0_kref+0x888:   	edge32	%g0, %i2, %o3
	.word	0x96600000	! t0_kref+0x88c:   	subc	%g0, %g0, %o3
	.word	0x95a01a2b	! t0_kref+0x890:   	fstoi	%f11, %f10
	.word	0x96180000	! t0_kref+0x894:   	xor	%g0, %g0, %o3
	.word	0x96f6bf82	! t0_kref+0x898:   	udivcc	%i2, -0x7e, %o3
	.word	0xd6d61000	! t0_kref+0x89c:   	ldsha	[%i0]0x80, %o3
	.word	0x97a2c9ab	! t0_kref+0x8a0:   	fdivs	%f11, %f11, %f11
	.word	0x97b68300	! t0_kref+0x8a4:   	alignaddr	%i2, %g0, %o3
	.word	0x81868000	! t0_kref+0x8a8:   	wr	%i2, %g0, %y
	.word	0xc0300019	! t0_kref+0x8ac:   	clrh	[%g0 + %i1]
	.word	0xc0b01019	! t0_kref+0x8b0:   	stha	%g0, [%g0 + %i1]0x80
	.word	0x971eb811	! t0_kref+0x8b4:   	tsubcctv	%i2, -0x7ef, %o3
	.word	0xd6d65000	! t0_kref+0x8b8:   	ldsha	[%i1]0x80, %o3
	.word	0x9650001a	! t0_kref+0x8bc:   	umul	%g0, %i2, %o3
	.word	0x96582a7c	! t0_kref+0x8c0:   	smul	%g0, 0xa7c, %o3
	.word	0x971e801a	! t0_kref+0x8c4:   	tsubcctv	%i2, %i2, %o3
	.word	0xf4300019	! t0_kref+0x8c8:   	sth	%i2, [%g0 + %i1]
	.word	0x97b28a6a	! t0_kref+0x8cc:   	fpadd32s	%f10, %f10, %f11
	.word	0x97b68240	! t0_kref+0x8d0:   	array16	%i2, %g0, %o3
	.word	0x95a289aa	! t0_kref+0x8d4:   	fdivs	%f10, %f10, %f10
	.word	0xe26e7fef	! t0_kref+0x8d8:   	ldstub	[%i1 - 0x11], %l1
	.word	0x97b00140	! t0_kref+0x8dc:   	edge32l	%g0, %g0, %o3
	.word	0x95a0012a	! t0_kref+0x8e0:   	fabss	%f10, %f10
	.word	0xc028a034	! t0_kref+0x8e4:   	clrb	[%g2 + 0x34]
	.word	0x96e00000	! t0_kref+0x8e8:   	subccc	%g0, %g0, %o3
	.word	0x97282006	! t0_kref+0x8ec:   	sll	%g0, 0x6, %o3
	.word	0x96180000	! t0_kref+0x8f0:   	xor	%g0, %g0, %o3
	.word	0x25800004	! t0_kref+0x8f4:   	fblg,a	_kref+0x904
	.word	0x97408000	! t0_kref+0x8f8:   	mov	%ccr, %o3
	.word	0x95a0052a	! t0_kref+0x8fc:   	fsqrts	%f10, %f10
	.word	0xd6563ff4	! t0_kref+0x900:   	ldsh	[%i0 - 0xc], %o3
	.word	0xd5865000	! t0_kref+0x904:   	lda	[%i1]0x80, %f10
	.word	0x97a000aa	! t0_kref+0x908:   	fnegs	%f10, %f11
	.word	0x35800003	! t0_kref+0x90c:   	fbue,a	_kref+0x918
	.word	0xd6801018	! t0_kref+0x910:   	lda	[%g0 + %i0]0x80, %o3
	.word	0x95b28f8a	! t0_kref+0x914:   	for	%f10, %f10, %f10
	.word	0xd6500019	! t0_kref+0x918:   	ldsh	[%g0 + %i1], %o3
	.word	0x95a2cd2b	! t0_kref+0x91c:   	fsmuld	%f11, %f11, %f10
	.word	0xf4367ffa	! t0_kref+0x920:   	sth	%i2, [%i1 - 6]
	.word	0x960e8000	! t0_kref+0x924:   	and	%i2, %g0, %o3
	.word	0x96ae8000	! t0_kref+0x928:   	andncc	%i2, %g0, %o3
	.word	0x95b00c00	! t0_kref+0x92c:   	fzero	%f10
	.word	0x83c06854	! t0_kref+0x930:   	jmpl	%g1 + 0x854, %g1
	.word	0x967ebd6f	! t0_kref+0x934:   	sdiv	%i2, -0x291, %o3
	.word	0x95a2894a	! t0_kref+0x938:   	fmuld	%f10, %f10, %f10
	.word	0x97a0002a	! t0_kref+0x93c:   	fmovs	%f10, %f11
	.word	0x96beaedb	! t0_kref+0x940:   	xnorcc	%i2, 0xedb, %o3
	.word	0x96100000	! t0_kref+0x944:   	clr	%o3
	.word	0x9680001a	! t0_kref+0x948:   	addcc	%g0, %i2, %o3
	.word	0xf4f75018	! t0_kref+0x94c:   	stxa	%i2, [%i5 + %i0]0x80
	.word	0x9680001a	! t0_kref+0x950:   	addcc	%g0, %i2, %o3
	.word	0x96068000	! t0_kref+0x954:   	add	%i2, %g0, %o3
	.word	0x9fc10000	! t0_kref+0x958:   	call	%g4
	.word	0x972ea01f	! t0_kref+0x95c:   	sll	%i2, 0x1f, %o3
	.word	0x95b2c6ab	! t0_kref+0x960:   	fmul8x16al	%f11, %f11, %f10
	.word	0x97b000a0	! t0_kref+0x964:   	edge16n	%g0, %g0, %o3
	.word	0x95b28d40	! t0_kref+0x968:   	fnot1	%f10, %f10
	.word	0x97b28e6a	! t0_kref+0x96c:   	fxnors	%f10, %f10, %f11
	.word	0x9626b1ee	! t0_kref+0x970:   	sub	%i2, -0xe12, %o3
	.word	0x968828fb	! t0_kref+0x974:   	andcc	%g0, 0x8fb, %o3
	.word	0xd6064000	! t0_kref+0x978:   	ld	[%i1], %o3
	.word	0x97b00100	! t0_kref+0x97c:   	edge32	%g0, %g0, %o3
	.word	0x96968000	! t0_kref+0x980:   	orcc	%i2, %g0, %o3
	.word	0x95b00c00	! t0_kref+0x984:   	fzero	%f10
	.word	0xf007bfe0	! t0_kref+0x988:   	ld	[%fp - 0x20], %i0
	.word	0x95a2884a	! t0_kref+0x98c:   	faddd	%f10, %f10, %f10
	.word	0x97a01a4a	! t0_kref+0x990:   	fdtoi	%f10, %f11
	.word	0x97a000ab	! t0_kref+0x994:   	fnegs	%f11, %f11
!	.word	0x204d459a	! t0_kref+0x998:   	bn,a,pt	%icc, SYM(t0_subr1)
	   	bn,a,pt	%icc, SYM(t0_subr1)
	.word	0x9e006068	! t0_kref+0x99c:   	add	%g1, 0x68, %o7
	.word	0x96203ad9	! t0_kref+0x9a0:   	sub	%g0, -0x527, %o3
	.word	0x97630000	! t0_kref+0x9a4:   	movuge	%fcc0, %g0, %o3
	.word	0x97b284ca	! t0_kref+0x9a8:   	fcmpne32	%f10, %f10, %o3
	.word	0xb610201c	! t0_kref+0x9ac:   	mov	0x1c, %i3
	.word	0xf4366002	! t0_kref+0x9b0:   	sth	%i2, [%i1 + 2]
	.word	0x95a2cd2b	! t0_kref+0x9b4:   	fsmuld	%f11, %f11, %f10
	.word	0x9650001a	! t0_kref+0x9b8:   	umul	%g0, %i2, %o3
	.word	0x95a2894a	! t0_kref+0x9bc:   	fmuld	%f10, %f10, %f10
	.word	0x9726a245	! t0_kref+0x9c0:   	mulscc	%i2, 0x245, %o3
	.word	0x95a0012b	! t0_kref+0x9c4:   	fabss	%f11, %f10
	.word	0x9fc10000	! t0_kref+0x9c8:   	call	%g4
	.word	0x96aea0dd	! t0_kref+0x9cc:   	andncc	%i2, 0xdd, %o3
	.word	0x97b2858a	! t0_kref+0x9d0:   	fcmpgt32	%f10, %f10, %o3
	.word	0x960e8000	! t0_kref+0x9d4:   	and	%i2, %g0, %o3
	.word	0x25800004	! t0_kref+0x9d8:   	fblg,a	_kref+0x9e8
	.word	0x97a0052b	! t0_kref+0x9dc:   	fsqrts	%f11, %f11
	.word	0x8143c000	! t0_kref+0x9e0:   	stbar
	.word	0x9fc00004	! t0_kref+0x9e4:   	call	%g0 + %g4
	.word	0x95b28e80	! t0_kref+0x9e8:   	fsrc1	%f10, %f10
	.word	0xd1be5880	! t0_kref+0x9ec:   	stda	%f8, [%i1]0xc4
	.word	0x96f030e5	! t0_kref+0x9f0:   	udivcc	%g0, -0xf1b, %o3
	.word	0x97a01a4a	! t0_kref+0x9f4:   	fdtoi	%f10, %f11
	.word	0x97b00f2b	! t0_kref+0x9f8:   	fsrc2s	%f11, %f11
	.word	0x97282003	! t0_kref+0x9fc:   	sll	%g0, 0x3, %o3
	.word	0xd51fbc88	! t0_kref+0xa00:   	ldd	[%fp - 0x378], %f10
	.word	0x2f480001	! t0_kref+0xa04:   	fbu,a,pt	%fcc0, _kref+0xa08
	.word	0xd1be589a	! t0_kref+0xa08:   	stda	%f8, [%i1 + %i2]0xc4
	.word	0xe968a00d	! t0_kref+0xa0c:   	prefetch	%g2 + 0xd, 20
	.word	0xd6400018	! t0_kref+0xa10:   	ldsw	[%g0 + %i0], %o3
	.word	0x9686801a	! t0_kref+0xa14:   	addcc	%i2, %i2, %o3
	.word	0x95a2894a	! t0_kref+0xa18:   	fmuld	%f10, %f10, %f10
	.word	0x34480003	! t0_kref+0xa1c:   	bg,a,pt	%icc, _kref+0xa28
	.word	0x97b00280	! t0_kref+0xa20:   	array32	%g0, %g0, %o3
	.word	0x95a289ab	! t0_kref+0xa24:   	fdivs	%f10, %f11, %f10
	.word	0x81aa8aab	! t0_kref+0xa28:   	fcmpes	%fcc0, %f10, %f11
	.word	0xf4a81018	! t0_kref+0xa2c:   	stba	%i2, [%g0 + %i0]0x80
	.word	0x39800005	! t0_kref+0xa30:   	fbuge,a	_kref+0xa44
	.word	0x97a01a4a	! t0_kref+0xa34:   	fdtoi	%f10, %f11
	.word	0x96f6801a	! t0_kref+0xa38:   	udivcc	%i2, %i2, %o3
	.word	0xc0270019	! t0_kref+0xa3c:   	clr	[%i4 + %i1]
	.word	0x96c6801a	! t0_kref+0xa40:   	addccc	%i2, %i2, %o3
	.word	0x96f6a948	! t0_kref+0xa44:   	udivcc	%i2, 0x948, %o3
	.word	0x967ebc46	! t0_kref+0xa48:   	sdiv	%i2, -0x3ba, %o3
	.word	0x95a0192a	! t0_kref+0xa4c:   	fstod	%f10, %f10
	.word	0x95a01a4a	! t0_kref+0xa50:   	fdtoi	%f10, %f10
	.word	0x8143c000	! t0_kref+0xa54:   	stbar
	.word	0x960e8000	! t0_kref+0xa58:   	and	%i2, %g0, %o3
	.word	0xd6566006	! t0_kref+0xa5c:   	ldsh	[%i1 + 6], %o3
	.word	0xc0a81018	! t0_kref+0xa60:   	stba	%g0, [%g0 + %i0]0x80
	.word	0xe01e3ff0	! t0_kref+0xa64:   	ldd	[%i0 - 0x10], %l0
	.word	0xe41e401d	! t0_kref+0xa68:   	ldd	[%i1 + %i5], %l2
	.word	0x95b28aca	! t0_kref+0xa6c:   	fpsub32	%f10, %f10, %f10
	.word	0x96b83d8f	! t0_kref+0xa70:   	xnorcc	%g0, -0x271, %o3
	.word	0x96fea8cf	! t0_kref+0xa74:   	sdivcc	%i2, 0x8cf, %o3
	.word	0x95b007aa	! t0_kref+0xa78:   	fpackfix	%f10, %f10
	.word	0x97a0002a	! t0_kref+0xa7c:   	fmovs	%f10, %f11
	.word	0x95a2884a	! t0_kref+0xa80:   	faddd	%f10, %f10, %f10
	.word	0x97a000ab	! t0_kref+0xa84:   	fnegs	%f11, %f11
	.word	0x96e6801a	! t0_kref+0xa88:   	subccc	%i2, %i2, %o3
	.word	0xc568a08f	! t0_kref+0xa8c:   	prefetch	%g2 + 0x8f, 2
	.word	0x1712d58e	! t0_kref+0xa90:   	sethi	%hi(0x4b563800), %o3
	.word	0x97b6835a	! t0_kref+0xa94:   	alignaddrl	%i2, %i2, %o3
	.word	0x97200000	! t0_kref+0xa98:   	mulscc	%g0, %g0, %o3
	.word	0x96583297	! t0_kref+0xa9c:   	smul	%g0, -0xd69, %o3
	.word	0x95b28a0a	! t0_kref+0xaa0:   	fpadd16	%f10, %f10, %f10
	.word	0x96e6801a	! t0_kref+0xaa4:   	subccc	%i2, %i2, %o3
	.word	0x96b80000	! t0_kref+0xaa8:   	xnorcc	%g0, %g0, %o3
	.word	0x8143e040	! t0_kref+0xaac:   	membar	0x40
	.word	0x96b8001a	! t0_kref+0xab0:   	xnorcc	%g0, %i2, %o3
	.word	0x35800004	! t0_kref+0xab4:   	fbue,a	_kref+0xac4
	.word	0xa786a8cc	! t0_kref+0xab8:   	wr	%i2, 0x8cc, %gsr
	.word	0xf4366002	! t0_kref+0xabc:   	sth	%i2, [%i1 + 2]
	.word	0x95a2884a	! t0_kref+0xac0:   	faddd	%f10, %f10, %f10
	.word	0x95b28e4a	! t0_kref+0xac4:   	fxnor	%f10, %f10, %f10
	.word	0x96fe8000	! t0_kref+0xac8:   	sdivcc	%i2, %g0, %o3
	.word	0xd6070018	! t0_kref+0xacc:   	ld	[%i4 + %i0], %o3
	.word	0x97000000	! t0_kref+0xad0:   	taddcc	%g0, %g0, %o3
	.word	0x95a2894a	! t0_kref+0xad4:   	fmuld	%f10, %f10, %f10
	.word	0x97b6835a	! t0_kref+0xad8:   	alignaddrl	%i2, %i2, %o3
	.word	0x97b28fab	! t0_kref+0xadc:   	fors	%f10, %f11, %f11
	.word	0x96a6801a	! t0_kref+0xae0:   	subcc	%i2, %i2, %o3
	.word	0x81d83669	! t0_kref+0xae4:   	flush	%g0 - 0x997
	.word	0x96180000	! t0_kref+0xae8:   	xor	%g0, %g0, %o3
	.word	0x95b28aea	! t0_kref+0xaec:   	fpsub32s	%f10, %f10, %f10
	.word	0x97268000	! t0_kref+0xaf0:   	mulscc	%i2, %g0, %o3
	.word	0x95a2c9aa	! t0_kref+0xaf4:   	fdivs	%f11, %f10, %f10
	.word	0xd6167ff6	! t0_kref+0xaf8:   	lduh	[%i1 - 0xa], %o3
	.word	0x95a0192b	! t0_kref+0xafc:   	fstod	%f11, %f10
	.word	0xd6861000	! t0_kref+0xb00:   	lda	[%i0]0x80, %o3
	.word	0x95b28e4a	! t0_kref+0xb04:   	fxnor	%f10, %f10, %f10
	.word	0x20800004	! t0_kref+0xb08:   	bn,a	_kref+0xb18
	.word	0x97a000ab	! t0_kref+0xb0c:   	fnegs	%f11, %f11
	.word	0x95a0054a	! t0_kref+0xb10:   	fsqrtd	%f10, %f10
	.word	0x96a6b37a	! t0_kref+0xb14:   	subcc	%i2, -0xc86, %o3
	.word	0x97a0002b	! t0_kref+0xb18:   	fmovs	%f11, %f11
	.word	0x9726801a	! t0_kref+0xb1c:   	mulscc	%i2, %i2, %o3
	.word	0x962829f7	! t0_kref+0xb20:   	andn	%g0, 0x9f7, %o3
	.word	0x95b2c72b	! t0_kref+0xb24:   	fmuld8ulx16	%f11, %f11, %f10
	.word	0x26480001	! t0_kref+0xb28:   	bl,a,pt	%icc, _kref+0xb2c
	.word	0x8143c000	! t0_kref+0xb2c:   	stbar
	.word	0xf428a037	! t0_kref+0xb30:   	stb	%i2, [%g2 + 0x37]
	.word	0x96b80000	! t0_kref+0xb34:   	xnorcc	%g0, %g0, %o3
	.word	0x97400000	! t0_kref+0xb38:   	mov	%y, %o3
	.word	0x9626a8ef	! t0_kref+0xb3c:   	sub	%i2, 0x8ef, %o3
	.word	0x97a2892a	! t0_kref+0xb40:   	fmuls	%f10, %f10, %f11
	.word	0x95a288ca	! t0_kref+0xb44:   	fsubd	%f10, %f10, %f10
	.word	0x95a0110a	! t0_kref+0xb48:   	fxtod	%f10, %f10
	.word	0x95b00f2a	! t0_kref+0xb4c:   	fsrc2s	%f10, %f10
	.word	0xd616401b	! t0_kref+0xb50:   	lduh	[%i1 + %i3], %o3
	.word	0x95a0054a	! t0_kref+0xb54:   	fsqrtd	%f10, %f10
	.word	0x97b284ca	! t0_kref+0xb58:   	fcmpne32	%f10, %f10, %o3
	.word	0x95a000aa	! t0_kref+0xb5c:   	fnegs	%f10, %f10
	.word	0x95b2ccaa	! t0_kref+0xb60:   	fandnot2s	%f11, %f10, %f10
	.word	0x96aea04a	! t0_kref+0xb64:   	andncc	%i2, 0x4a, %o3
	.word	0x96900000	! t0_kref+0xb68:   	orcc	%g0, %g0, %o3
	.word	0x97a2c82a	! t0_kref+0xb6c:   	fadds	%f11, %f10, %f11
	.word	0x97a01a4a	! t0_kref+0xb70:   	fdtoi	%f10, %f11
	.word	0x35800008	! t0_kref+0xb74:   	fbue,a	_kref+0xb94
	.word	0x96600000	! t0_kref+0xb78:   	subc	%g0, %g0, %o3
	.word	0x968ea71d	! t0_kref+0xb7c:   	andcc	%i2, 0x71d, %o3
	.word	0xd51e401d	! t0_kref+0xb80:   	ldd	[%i1 + %i5], %f10
	.word	0xc0f61000	! t0_kref+0xb84:   	stxa	%g0, [%i0]0x80
	.word	0x95a000aa	! t0_kref+0xb88:   	fnegs	%f10, %f10
	.word	0x97a018ca	! t0_kref+0xb8c:   	fdtos	%f10, %f11
	.word	0xd6564000	! t0_kref+0xb90:   	ldsh	[%i1], %o3
	.word	0x96a023f0	! t0_kref+0xb94:   	subcc	%g0, 0x3f0, %o3
	.word	0x95a2c9ab	! t0_kref+0xb98:   	fdivs	%f11, %f11, %f10
	.word	0x96783404	! t0_kref+0xb9c:   	sdiv	%g0, -0xbfc, %o3
	.word	0x9686bb31	! t0_kref+0xba0:   	addcc	%i2, -0x4cf, %o3
	.word	0x97b00c20	! t0_kref+0xba4:   	fzeros	%f11
	.word	0x95a0192b	! t0_kref+0xba8:   	fstod	%f11, %f10
	.word	0x96e03f9c	! t0_kref+0xbac:   	subccc	%g0, -0x64, %o3
	.word	0xd1be1840	! t0_kref+0xbb0:   	stda	%f8, [%i0]0xc2
	.word	0x97b680c0	! t0_kref+0xbb4:   	edge16l	%i2, %g0, %o3
	.word	0xe86e3fe8	! t0_kref+0xbb8:   	ldstub	[%i0 - 0x18], %l4
	.word	0xeb68a00e	! t0_kref+0xbbc:   	prefetch	%g2 + 0xe, 21
	.word	0xf4ae1000	! t0_kref+0xbc0:   	stba	%i2, [%i0]0x80
	.word	0xd6163fe2	! t0_kref+0xbc4:   	lduh	[%i0 - 0x1e], %o3
	.word	0xd7865000	! t0_kref+0xbc8:   	lda	[%i1]0x80, %f11
	.word	0x95a289aa	! t0_kref+0xbcc:   	fdivs	%f10, %f10, %f10
	.word	0xc0362016	! t0_kref+0xbd0:   	clrh	[%i0 + 0x16]
	.word	0x9690001a	! t0_kref+0xbd4:   	orcc	%g0, %i2, %o3
	.word	0x97a0012b	! t0_kref+0xbd8:   	fabss	%f11, %f11
	.word	0x95b2872a	! t0_kref+0xbdc:   	fmuld8ulx16	%f10, %f10, %f10
	.word	0x97a289aa	! t0_kref+0xbe0:   	fdivs	%f10, %f10, %f11
	.word	0x95a2cd2a	! t0_kref+0xbe4:   	fsmuld	%f11, %f10, %f10
	.word	0x95b28e80	! t0_kref+0xbe8:   	fsrc1	%f10, %f10
	.word	0x97b00280	! t0_kref+0xbec:   	array32	%g0, %g0, %o3
	.word	0x9600001a	! t0_kref+0xbf0:   	add	%g0, %i2, %o3
	.word	0x9690001a	! t0_kref+0xbf4:   	orcc	%g0, %i2, %o3
	.word	0x9730001a	! t0_kref+0xbf8:   	srl	%g0, %i2, %o3
	.word	0x96a00000	! t0_kref+0xbfc:   	subcc	%g0, %g0, %o3
	.word	0x96e00000	! t0_kref+0xc00:   	subccc	%g0, %g0, %o3
	.word	0x97302002	! t0_kref+0xc04:   	srl	%g0, 0x2, %o3
	.word	0x9606801a	! t0_kref+0xc08:   	add	%i2, %i2, %o3
	.word	0x9608001a	! t0_kref+0xc0c:   	and	%g0, %i2, %o3
	.word	0xd64e001a	! t0_kref+0xc10:   	ldsb	[%i0 + %i2], %o3
	.word	0x9726801a	! t0_kref+0xc14:   	mulscc	%i2, %i2, %o3
	.word	0x97400000	! t0_kref+0xc18:   	mov	%y, %o3
	.word	0x97a2c9ab	! t0_kref+0xc1c:   	fdivs	%f11, %f11, %f11
	.word	0x96368000	! t0_kref+0xc20:   	orn	%i2, %g0, %o3
	.word	0xd7270019	! t0_kref+0xc24:   	st	%f11, [%i4 + %i1]
	.word	0x973e801a	! t0_kref+0xc28:   	sra	%i2, %i2, %o3
	.word	0x95a0012b	! t0_kref+0xc2c:   	fabss	%f11, %f10
	.word	0x81800000	! t0_kref+0xc30:   	mov	%g0, %y
	.word	0x81580000	! t0_kref+0xc34:   	flushw
	.word	0x95a0054a	! t0_kref+0xc38:   	fsqrtd	%f10, %f10
	.word	0xd64e2003	! t0_kref+0xc3c:   	ldsb	[%i0 + 3], %o3
	.word	0x95a2c9ab	! t0_kref+0xc40:   	fdivs	%f11, %f11, %f10
	.word	0xd6500019	! t0_kref+0xc44:   	ldsh	[%g0 + %i1], %o3
	.word	0xd6d6d018	! t0_kref+0xc48:   	ldsha	[%i3 + %i0]0x80, %o3
	.word	0x97a2892b	! t0_kref+0xc4c:   	fmuls	%f10, %f11, %f11
	.word	0x97a0188a	! t0_kref+0xc50:   	fitos	%f10, %f11
	.word	0x9720265a	! t0_kref+0xc54:   	mulscc	%g0, 0x65a, %o3
	.word	0x95a2884a	! t0_kref+0xc58:   	faddd	%f10, %f10, %f10
	.word	0x97b6805a	! t0_kref+0xc5c:   	edge8l	%i2, %i2, %o3
	.word	0x95a01a2a	! t0_kref+0xc60:   	fstoi	%f10, %f10
	.word	0x96b831e3	! t0_kref+0xc64:   	xnorcc	%g0, -0xe1d, %o3
	.word	0x9606801a	! t0_kref+0xc68:   	add	%i2, %i2, %o3
	.word	0x96182f9a	! t0_kref+0xc6c:   	xor	%g0, 0xf9a, %o3
	.word	0x97268000	! t0_kref+0xc70:   	mulscc	%i2, %g0, %o3
	.word	0x97b6805a	! t0_kref+0xc74:   	edge8l	%i2, %i2, %o3
	.word	0x9676801a	! t0_kref+0xc78:   	udiv	%i2, %i2, %o3
	.word	0x97a2c9aa	! t0_kref+0xc7c:   	fdivs	%f11, %f10, %f11
	.word	0xe01f4018	! t0_kref+0xc80:   	ldd	[%i5 + %i0], %l0
	.word	0x27800003	! t0_kref+0xc84:   	fbul,a	_kref+0xc90
	.word	0x97a0012b	! t0_kref+0xc88:   	fabss	%f11, %f11
	.word	0x95aa804a	! t0_kref+0xc8c:   	fmovdue	%fcc0, %f10, %f10
	.word	0x97b00340	! t0_kref+0xc90:   	alignaddrl	%g0, %g0, %o3
	.word	0xe01e001d	! t0_kref+0xc94:   	ldd	[%i0 + %i5], %l0
	.word	0xba102008	! t0_kref+0xc98:   	mov	0x8, %i5
	.word	0x9600001a	! t0_kref+0xc9c:   	add	%g0, %i2, %o3
	.word	0x25480007	! t0_kref+0xca0:   	fblg,a,pt	%fcc0, _kref+0xcbc
	.word	0x95a000aa	! t0_kref+0xca4:   	fnegs	%f10, %f10
	.word	0x961037b9	! t0_kref+0xca8:   	mov	0xfffff7b9, %o3
	.word	0x81aa8aaa	! t0_kref+0xcac:   	fcmpes	%fcc0, %f10, %f10
	.word	0x96e0001a	! t0_kref+0xcb0:   	subccc	%g0, %i2, %o3
	.word	0x96902fa2	! t0_kref+0xcb4:   	orcc	%g0, 0xfa2, %o3
	.word	0x1718cf86	! t0_kref+0xcb8:   	sethi	%hi(0x633e1800), %o3
	.word	0x95b28a8a	! t0_kref+0xcbc:   	fpsub16	%f10, %f10, %f10
	.word	0x95a0012a	! t0_kref+0xcc0:   	fabss	%f10, %f10
	.word	0x95b009ab	! t0_kref+0xcc4:   	fexpand	%f11, %f10
	.word	0x96a6b949	! t0_kref+0xcc8:   	subcc	%i2, -0x6b7, %o3
	.word	0x9640397c	! t0_kref+0xccc:   	addc	%g0, -0x684, %o3
	.word	0x95a01a4a	! t0_kref+0xcd0:   	fdtoi	%f10, %f10
	.word	0xe01e3ff0	! t0_kref+0xcd4:   	ldd	[%i0 - 0x10], %l0
	.word	0x8143c000	! t0_kref+0xcd8:   	stbar
	.word	0x95a2894a	! t0_kref+0xcdc:   	fmuld	%f10, %f10, %f10
	.word	0x95a28d2b	! t0_kref+0xce0:   	fsmuld	%f10, %f11, %f10
	.word	0xd5a6501c	! t0_kref+0xce4:   	sta	%f10, [%i1 + %i4]0x80
	.word	0x961824e7	! t0_kref+0xce8:   	xor	%g0, 0x4e7, %o3
	.word	0xd656601e	! t0_kref+0xcec:   	ldsh	[%i1 + 0x1e], %o3
	.word	0xdc216b00	! t0_kref+0xcf0:   	st	%sp, [%g5 + 0xb00]
	.word	0x95b00cca	! t0_kref+0xcf4:   	fnot2	%f10, %f10
	.word	0x96882b6a	! t0_kref+0xcf8:   	andcc	%g0, 0xb6a, %o3
	.word	0x25800002	! t0_kref+0xcfc:   	fblg,a	_kref+0xd04
	.word	0x97a01a4a	! t0_kref+0xd00:   	fdtoi	%f10, %f11
	.word	0x9764401a	! t0_kref+0xd04:   	move	%icc, %i2, %o3
	.word	0xf4362010	! t0_kref+0xd08:   	sth	%i2, [%i0 + 0x10]
	.word	0x95b28d0a	! t0_kref+0xd0c:   	fandnot1	%f10, %f10, %f10
	call	SYM(t0_subr3)
	.word	0x97b68100	! t0_kref+0xd14:   	edge32	%i2, %g0, %o3
	.word	0xfb070005	! t0_kref+0xd18:   	ld	[%i4 + %g5], %f29
	.word	0x96068000	! t0_kref+0xd1c:   	add	%i2, %g0, %o3
	.word	0xeb68a00b	! t0_kref+0xd20:   	prefetch	%g2 + 0xb, 21
	.word	0x97a2882a	! t0_kref+0xd24:   	fadds	%f10, %f10, %f11
	.word	0x95a2c9ab	! t0_kref+0xd28:   	fdivs	%f11, %f11, %f10
	.word	0x86102002	! t0_kref+0xd2c:   	mov	0x2, %g3
	.word	0x86a0e001	! t0_kref+0xd30:   	subcc	%g3, 1, %g3
	.word	0x2280000c	! t0_kref+0xd34:   	be,a	_kref+0xd64
	.word	0x963eb300	! t0_kref+0xd38:   	xnor	%i2, -0xd00, %o3
	.word	0xd19f5a59	! t0_kref+0xd3c:   	ldda	[%i5 + %i1]0xd2, %f8
	.word	0x95b2c62a	! t0_kref+0xd40:   	fmul8x16	%f11, %f10, %f10
	.word	0x96d80000	! t0_kref+0xd44:   	smulcc	%g0, %g0, %o3
	.word	0x96168000	! t0_kref+0xd48:   	or	%i2, %g0, %o3
	.word	0x31800001	! t0_kref+0xd4c:   	fba,a	_kref+0xd50
	.word	0xf4200019	! t0_kref+0xd50:   	st	%i2, [%g0 + %i1]
	.word	0x96a821cb	! t0_kref+0xd54:   	andncc	%g0, 0x1cb, %o3
	.word	0x9610001a	! t0_kref+0xd58:   	mov	%i2, %o3
	.word	0xd51e3ff8	! t0_kref+0xd5c:   	ldd	[%i0 - 8], %f10
	.word	0x96a6801a	! t0_kref+0xd60:   	subcc	%i2, %i2, %o3
	.word	0x95b286ea	! t0_kref+0xd64:   	fmul8ulx16	%f10, %f10, %f10
	.word	0x95a0054a	! t0_kref+0xd68:   	fsqrtd	%f10, %f10
	.word	0x8143c000	! t0_kref+0xd6c:   	stbar
	.word	0x960e801a	! t0_kref+0xd70:   	and	%i2, %i2, %o3
	.word	0x97a01a4a	! t0_kref+0xd74:   	fdtoi	%f10, %f11
	.word	0x96183951	! t0_kref+0xd78:   	xor	%g0, -0x6af, %o3
	.word	0x96100000	! t0_kref+0xd7c:   	clr	%o3
	.word	0xed68a008	! t0_kref+0xd80:   	prefetch	%g2 + 8, 22
	.word	0xe49f5019	! t0_kref+0xd84:   	ldda	[%i5 + %i1]0x80, %l2
	.word	0x97400000	! t0_kref+0xd88:   	mov	%y, %o3
	.word	0xd1be581a	! t0_kref+0xd8c:   	stda	%f8, [%i1 + %i2]0xc0
	.word	0x172a2983	! t0_kref+0xd90:   	sethi	%hi(0xa8a60c00), %o3
	.word	0x967eb7eb	! t0_kref+0xd94:   	sdiv	%i2, -0x815, %o3
	.word	0x97a0188a	! t0_kref+0xd98:   	fitos	%f10, %f11
	.word	0x95b28d2b	! t0_kref+0xd9c:   	fandnot1s	%f10, %f11, %f10
	.word	0xd1be585a	! t0_kref+0xda0:   	stda	%f8, [%i1 + %i2]0xc2
	.word	0x17069c4e	! t0_kref+0xda4:   	sethi	%hi(0x1a713800), %o3
	.word	0x95a0054a	! t0_kref+0xda8:   	fsqrtd	%f10, %f10
	.word	0xd5981019	! t0_kref+0xdac:   	ldda	[%g0 + %i1]0x80, %f10
	.word	0xc0a81018	! t0_kref+0xdb0:   	stba	%g0, [%g0 + %i0]0x80
	.word	0x3b800005	! t0_kref+0xdb4:   	fble,a	_kref+0xdc8
	.word	0x9696bbdd	! t0_kref+0xdb8:   	orcc	%i2, -0x423, %o3
	.word	0x95a0192a	! t0_kref+0xdbc:   	fstod	%f10, %f10
	.word	0x97b28d2a	! t0_kref+0xdc0:   	fandnot1s	%f10, %f10, %f11
	.word	0xd616401b	! t0_kref+0xdc4:   	lduh	[%i1 + %i3], %o3
	.word	0x95a288ca	! t0_kref+0xdc8:   	fsubd	%f10, %f10, %f10
	.word	0x33800007	! t0_kref+0xdcc:   	fbe,a	_kref+0xde8
	.word	0x95a289aa	! t0_kref+0xdd0:   	fdivs	%f10, %f10, %f10
	.word	0x96883e16	! t0_kref+0xdd4:   	andcc	%g0, -0x1ea, %o3
	.word	0x97b680c0	! t0_kref+0xdd8:   	edge16l	%i2, %g0, %o3
	.word	0x95a0192a	! t0_kref+0xddc:   	fstod	%f10, %f10
	.word	0x97102b2d	! t0_kref+0xde0:   	taddcctv	%g0, 0xb2d, %o3
	.word	0x9618338e	! t0_kref+0xde4:   	xor	%g0, -0xc72, %o3
	.word	0x81aa8aca	! t0_kref+0xde8:   	fcmped	%fcc0, %f10, %f10
	.word	0x9690001a	! t0_kref+0xdec:   	orcc	%g0, %i2, %o3
	.word	0x97400000	! t0_kref+0xdf0:   	mov	%y, %o3
	.word	0x95b28caa	! t0_kref+0xdf4:   	fandnot2s	%f10, %f10, %f10
	.word	0x97a0188a	! t0_kref+0xdf8:   	fitos	%f10, %f11
	.word	0x97a01a4a	! t0_kref+0xdfc:   	fdtoi	%f10, %f11
	.word	0x97202077	! t0_kref+0xe00:   	mulscc	%g0, 0x77, %o3
	.word	0xe41e3ff8	! t0_kref+0xe04:   	ldd	[%i0 - 8], %l2
	.word	0x2c800002	! t0_kref+0xe08:   	bneg,a	_kref+0xe10
	.word	0x96202d74	! t0_kref+0xe0c:   	sub	%g0, 0xd74, %o3
	.word	0x97408000	! t0_kref+0xe10:   	mov	%ccr, %o3
	.word	0x97b00c20	! t0_kref+0xe14:   	fzeros	%f11
	.word	0xe41e0000	! t0_kref+0xe18:   	ldd	[%i0], %l2
	.word	0x9656a36e	! t0_kref+0xe1c:   	umul	%i2, 0x36e, %o3
	.word	0x95a01a4a	! t0_kref+0xe20:   	fdtoi	%f10, %f10
	.word	0x81aa8aca	! t0_kref+0xe24:   	fcmped	%fcc0, %f10, %f10
	.word	0x95a2884a	! t0_kref+0xe28:   	faddd	%f10, %f10, %f10
	.word	0xd656c018	! t0_kref+0xe2c:   	ldsh	[%i3 + %i0], %o3
	.word	0x97400000	! t0_kref+0xe30:   	mov	%y, %o3
	.word	0x97a2c9ab	! t0_kref+0xe34:   	fdivs	%f11, %f11, %f11
	.word	0x95b28d8a	! t0_kref+0xe38:   	fxor	%f10, %f10, %f10
	.word	0x97380000	! t0_kref+0xe3c:   	sra	%g0, %g0, %o3
	.word	0x95a2cd2a	! t0_kref+0xe40:   	fsmuld	%f11, %f10, %f10
	.word	0x97a0012b	! t0_kref+0xe44:   	fabss	%f11, %f11
	.word	0x95a0002a	! t0_kref+0xe48:   	fmovs	%f10, %f10
	.word	0xc0f6501d	! t0_kref+0xe4c:   	stxa	%g0, [%i1 + %i5]0x80
	.word	0x97b2854a	! t0_kref+0xe50:   	fcmpeq16	%f10, %f10, %o3
	.word	0x25800007	! t0_kref+0xe54:   	fblg,a	_kref+0xe70
	.word	0xd6d01019	! t0_kref+0xe58:   	ldsha	[%g0 + %i1]0x80, %o3
	.word	0x95a0192a	! t0_kref+0xe5c:   	fstod	%f10, %f10
	.word	0xe66e2008	! t0_kref+0xe60:   	ldstub	[%i0 + 8], %l3
	.word	0xe03e3fe0	! t0_kref+0xe64:   	std	%l0, [%i0 - 0x20]
	.word	0xd51fbd18	! t0_kref+0xe68:   	ldd	[%fp - 0x2e8], %f10
	.word	0x97a000aa	! t0_kref+0xe6c:   	fnegs	%f10, %f11
	.word	0xc0263fec	! t0_kref+0xe70:   	clr	[%i0 - 0x14]
	.word	0x969039c2	! t0_kref+0xe74:   	orcc	%g0, -0x63e, %o3
	.word	0x96180000	! t0_kref+0xe78:   	xor	%g0, %g0, %o3
	.word	0x95a2cd2a	! t0_kref+0xe7c:   	fsmuld	%f11, %f10, %f10
	.word	0xf426200c	! t0_kref+0xe80:   	st	%i2, [%i0 + 0xc]
	.word	0x96e0001a	! t0_kref+0xe84:   	subccc	%g0, %i2, %o3
	.word	0x97b2840a	! t0_kref+0xe88:   	fcmple16	%f10, %f10, %o3
	.word	0xd6080018	! t0_kref+0xe8c:   	ldub	[%g0 + %i0], %o3
	.word	0x95a289ab	! t0_kref+0xe90:   	fdivs	%f10, %f11, %f10
	.word	0xd6564000	! t0_kref+0xe94:   	ldsh	[%i1], %o3
	.word	0xe01e0000	! t0_kref+0xe98:   	ldd	[%i0], %l0
	.word	0x95a0192a	! t0_kref+0xe9c:   	fstod	%f10, %f10
	.word	0xba103ff0	! t0_kref+0xea0:   	mov	0xfffffff0, %i5
	.word	0x96f02dc5	! t0_kref+0xea4:   	udivcc	%g0, 0xdc5, %o3
	.word	0x81dd8016	! t0_kref+0xea8:   	flush	%l6 + %l6
	.word	0xd51fbde0	! t0_kref+0xeac:   	ldd	[%fp - 0x220], %f10
	.word	0xd616601e	! t0_kref+0xeb0:   	lduh	[%i1 + 0x1e], %o3
	.word	0x95a0192b	! t0_kref+0xeb4:   	fstod	%f11, %f10
	.word	0x96b00000	! t0_kref+0xeb8:   	orncc	%g0, %g0, %o3
	.word	0x96e0001a	! t0_kref+0xebc:   	subccc	%g0, %i2, %o3
	.word	0x3a800003	! t0_kref+0xec0:   	bcc,a	_kref+0xecc
	.word	0x96880000	! t0_kref+0xec4:   	andcc	%g0, %g0, %o3
	.word	0x95b28e4a	! t0_kref+0xec8:   	fxnor	%f10, %f10, %f10
	.word	0x95b00cca	! t0_kref+0xecc:   	fnot2	%f10, %f10
	.word	0x960e8000	! t0_kref+0xed0:   	and	%i2, %g0, %o3
	.word	0x95a000ab	! t0_kref+0xed4:   	fnegs	%f11, %f10
	.word	0x96b00000	! t0_kref+0xed8:   	orncc	%g0, %g0, %o3
	.word	0x95b007aa	! t0_kref+0xedc:   	fpackfix	%f10, %f10
	.word	0x97b68280	! t0_kref+0xee0:   	array32	%i2, %g0, %o3
	.word	0x97b6811a	! t0_kref+0xee4:   	edge32	%i2, %i2, %o3
	.word	0x95a0054a	! t0_kref+0xee8:   	fsqrtd	%f10, %f10
	.word	0xc768a04a	! t0_kref+0xeec:   	prefetch	%g2 + 0x4a, 3
	.word	0xd6064000	! t0_kref+0xef0:   	ld	[%i1], %o3
	.word	0x97b28dea	! t0_kref+0xef4:   	fnands	%f10, %f10, %f11
	.word	0x97b28cab	! t0_kref+0xef8:   	fandnot2s	%f10, %f11, %f11
	.word	0xfb6e001d	! t0_kref+0xefc:   	prefetch	%i0 + %i5, 29
	.word	0x95a2cd2a	! t0_kref+0xf00:   	fsmuld	%f11, %f10, %f10
	.word	0xc807bff0	! t0_kref+0xf04:   	ld	[%fp - 0x10], %g4
	.word	0x97a01a2a	! t0_kref+0xf08:   	fstoi	%f10, %f11
	.word	0x81dce55e	! t0_kref+0xf0c:   	flush	%l3 + 0x55e
	.word	0x8143c000	! t0_kref+0xf10:   	stbar
	.word	0x9666b7c2	! t0_kref+0xf14:   	subc	%i2, -0x83e, %o3
	.word	0x97b00140	! t0_kref+0xf18:   	edge32l	%g0, %g0, %o3
	.word	0x96be8000	! t0_kref+0xf1c:   	xnorcc	%i2, %g0, %o3
	.word	0x9680380d	! t0_kref+0xf20:   	addcc	%g0, -0x7f3, %o3
	.word	0xf4a61000	! t0_kref+0xf24:   	sta	%i2, [%i0]0x80
	.word	0x95a288ca	! t0_kref+0xf28:   	fsubd	%f10, %f10, %f10
	.word	0x95b28a8a	! t0_kref+0xf2c:   	fpsub16	%f10, %f10, %f10
	.word	0x9736801a	! t0_kref+0xf30:   	srl	%i2, %i2, %o3
	.word	0x97b00040	! t0_kref+0xf34:   	edge8l	%g0, %g0, %o3
	.word	0xeb68a089	! t0_kref+0xf38:   	prefetch	%g2 + 0x89, 21
	.word	0x96f02a3d	! t0_kref+0xf3c:   	udivcc	%g0, 0xa3d, %o3
	.word	0x96668000	! t0_kref+0xf40:   	subc	%i2, %g0, %o3
	.word	0xe43e7fe0	! t0_kref+0xf44:   	std	%l2, [%i1 - 0x20]
	.word	0x97a01a4a	! t0_kref+0xf48:   	fdtoi	%f10, %f11
	.word	0x173bc1fd	! t0_kref+0xf4c:   	sethi	%hi(0xef07f400), %o3
	.word	0x8143c000	! t0_kref+0xf50:   	stbar
	.word	0xd6063ff4	! t0_kref+0xf54:   	ld	[%i0 - 0xc], %o3
	.word	0xd526401c	! t0_kref+0xf58:   	st	%f10, [%i1 + %i4]
	.word	0x973ea014	! t0_kref+0xf5c:   	sra	%i2, 0x14, %o3
	.word	0x23800007	! t0_kref+0xf60:   	fbne,a	_kref+0xf7c
	.word	0xd686101c	! t0_kref+0xf64:   	lda	[%i0 + %i4]0x80, %o3
	.word	0x81868000	! t0_kref+0xf68:   	wr	%i2, %g0, %y
	.word	0x95a0190b	! t0_kref+0xf6c:   	fitod	%f11, %f10
	.word	0xf4b01019	! t0_kref+0xf70:   	stha	%i2, [%g0 + %i1]0x80
	.word	0xf4363fee	! t0_kref+0xf74:   	sth	%i2, [%i0 - 0x12]
	.word	0x96b83e04	! t0_kref+0xf78:   	xnorcc	%g0, -0x1fc, %o3
	.word	0x96380000	! t0_kref+0xf7c:   	not	%g0, %o3
	.word	0x81aa8aca	! t0_kref+0xf80:   	fcmped	%fcc0, %f10, %f10
	.word	0x9fc00004	! t0_kref+0xf84:   	call	%g0 + %g4
	.word	0xd6067fec	! t0_kref+0xf88:   	ld	[%i1 - 0x14], %o3
	.word	0xc0360000	! t0_kref+0xf8c:   	clrh	[%i0]
	.word	0x95a2884a	! t0_kref+0xf90:   	faddd	%f10, %f10, %f10
	.word	0x95a28d2b	! t0_kref+0xf94:   	fsmuld	%f10, %f11, %f10
	.word	0xd6563fe2	! t0_kref+0xf98:   	ldsh	[%i0 - 0x1e], %o3
	.word	0xe9e6101a	! t0_kref+0xf9c:   	casa	[%i0]0x80, %i2, %l4
	.word	0x35800007	! t0_kref+0xfa0:   	fbue,a	_kref+0xfbc
	.word	0x96902aec	! t0_kref+0xfa4:   	orcc	%g0, 0xaec, %o3
	.word	0x96903230	! t0_kref+0xfa8:   	orcc	%g0, -0xdd0, %o3
	.word	0x972e8000	! t0_kref+0xfac:   	sll	%i2, %g0, %o3
	.word	0xd6160000	! t0_kref+0xfb0:   	lduh	[%i0], %o3
	.word	0x9fc10000	! t0_kref+0xfb4:   	call	%g4
	.word	0x9646a071	! t0_kref+0xfb8:   	addc	%i2, 0x71, %o3
	.word	0xf4f75019	! t0_kref+0xfbc:   	stxa	%i2, [%i5 + %i1]0x80
	.word	0x95b2cd2a	! t0_kref+0xfc0:   	fandnot1s	%f11, %f10, %f10
	.word	0x9700341d	! t0_kref+0xfc4:   	taddcc	%g0, -0xbe3, %o3
	.word	0x35800005	! t0_kref+0xfc8:   	fbue,a	_kref+0xfdc
	.word	0x97b6811a	! t0_kref+0xfcc:   	edge32	%i2, %i2, %o3
	.word	0x961e801a	! t0_kref+0xfd0:   	xor	%i2, %i2, %o3
	.word	0xf4a61000	! t0_kref+0xfd4:   	sta	%i2, [%i0]0x80
	.word	0x30800004	! t0_kref+0xfd8:   	ba,a	_kref+0xfe8
	.word	0xe01e6018	! t0_kref+0xfdc:   	ldd	[%i1 + 0x18], %l0
	.word	0x95a0002a	! t0_kref+0xfe0:   	fmovs	%f10, %f10
	.word	0x95a2cd2b	! t0_kref+0xfe4:   	fsmuld	%f11, %f11, %f10
	.word	0x81aa8aab	! t0_kref+0xfe8:   	fcmpes	%fcc0, %f10, %f11
	.word	0x95b2cd2a	! t0_kref+0xfec:   	fandnot1s	%f11, %f10, %f10
	.word	0xe1e61000	! t0_kref+0xff0:   	casa	[%i0]0x80, %g0, %l0
	.word	0x95a000ab	! t0_kref+0xff4:   	fnegs	%f11, %f10
	.word	0x97400000	! t0_kref+0xff8:   	mov	%y, %o3
	.word	0x32480008	! t0_kref+0xffc:   	bne,a,pt	%icc, _kref+0x101c
	.word	0xd67e6000	! t0_kref+0x1000:   	swap	[%i1], %o3
	.word	0xc0362000	! t0_kref+0x1004:   	clrh	[%i0]
	.word	0x961e8000	! t0_kref+0x1008:   	xor	%i2, %g0, %o3
	.word	0x95a0192a	! t0_kref+0x100c:   	fstod	%f10, %f10
	.word	0x8143c000	! t0_kref+0x1010:   	stbar
	.word	0x9636bec9	! t0_kref+0x1014:   	orn	%i2, -0x137, %o3
	.word	0x35800008	! t0_kref+0x1018:   	fbue,a	_kref+0x1038
	.word	0x96083e5c	! t0_kref+0x101c:   	and	%g0, -0x1a4, %o3
	.word	0x9676b885	! t0_kref+0x1020:   	udiv	%i2, -0x77b, %o3
	.word	0x81dbf964	! t0_kref+0x1024:   	flush	%o7 - 0x69c
	.word	0x97400000	! t0_kref+0x1028:   	mov	%y, %o3
	.word	0x95a2894a	! t0_kref+0x102c:   	fmuld	%f10, %f10, %f10
	.word	0x96e6801a	! t0_kref+0x1030:   	subccc	%i2, %i2, %o3
	.word	0x96e6a4e5	! t0_kref+0x1034:   	subccc	%i2, 0x4e5, %o3
	.word	0x95a0052a	! t0_kref+0x1038:   	fsqrts	%f10, %f10
	.word	0x96368000	! t0_kref+0x103c:   	orn	%i2, %g0, %o3
	.word	0x95a2c9aa	! t0_kref+0x1040:   	fdivs	%f11, %f10, %f10
	call	SYM(t0_subr1)
	.word	0x95b2c62a	! t0_kref+0x1048:   	fmul8x16	%f11, %f10, %f10
	.word	0x95b28f8a	! t0_kref+0x104c:   	for	%f10, %f10, %f10
	.word	0xc0270018	! t0_kref+0x1050:   	clr	[%i4 + %i0]
	.word	0x9736a016	! t0_kref+0x1054:   	srl	%i2, 0x16, %o3
	.word	0x9726ba70	! t0_kref+0x1058:   	mulscc	%i2, -0x590, %o3
	.word	0x97b00040	! t0_kref+0x105c:   	edge8l	%g0, %g0, %o3
	.word	0xfb6e401d	! t0_kref+0x1060:   	prefetch	%i1 + %i5, 29
	.word	0x97a0012a	! t0_kref+0x1064:   	fabss	%f10, %f11
	.word	0x965ebab8	! t0_kref+0x1068:   	smul	%i2, -0x548, %o3
	.word	0x21800006	! t0_kref+0x106c:   	fbn,a	_kref+0x1084
	.word	0xd5180019	! t0_kref+0x1070:   	ldd	[%g0 + %i1], %f10
	.word	0x96d022ef	! t0_kref+0x1074:   	umulcc	%g0, 0x2ef, %o3
	.word	0x95a0012a	! t0_kref+0x1078:   	fabss	%f10, %f10
	.word	0x97b28aeb	! t0_kref+0x107c:   	fpsub32s	%f10, %f11, %f11
	.word	0xd656001b	! t0_kref+0x1080:   	ldsh	[%i0 + %i3], %o3
	.word	0x95a2894a	! t0_kref+0x1084:   	fmuld	%f10, %f10, %f10
	.word	0x9676801a	! t0_kref+0x1088:   	udiv	%i2, %i2, %o3
	.word	0xf4280019	! t0_kref+0x108c:   	stb	%i2, [%g0 + %i1]
	.word	0xd65e001d	! t0_kref+0x1090:   	ldx	[%i0 + %i5], %o3
	.word	0xc0b01018	! t0_kref+0x1094:   	stha	%g0, [%g0 + %i0]0x80
	.word	0x81de2f7f	! t0_kref+0x1098:   	flush	%i0 + 0xf7f
	.word	0x95a2c82b	! t0_kref+0x109c:   	fadds	%f11, %f11, %f10
	.word	0x95a0054a	! t0_kref+0x10a0:   	fsqrtd	%f10, %f10
	.word	0xff6e401b	! t0_kref+0x10a4:   	prefetch	%i1 + %i3, 31
	.word	0x96a68000	! t0_kref+0x10a8:   	subcc	%i2, %g0, %o3
	.word	0x81580000	! t0_kref+0x10ac:   	flushw
	.word	0x31800007	! t0_kref+0x10b0:   	fba,a	_kref+0x10cc
	.word	0x9766001a	! t0_kref+0x10b4:   	mova	%icc, %i2, %o3
	.word	0x1727e3b1	! t0_kref+0x10b8:   	sethi	%hi(0x9f8ec400), %o3
	.word	0x97b007aa	! t0_kref+0x10bc:   	fpackfix	%f10, %f11
	.word	0x96580000	! t0_kref+0x10c0:   	smul	%g0, %g0, %o3
	.word	0x23480005	! t0_kref+0x10c4:   	fbne,a,pt	%fcc0, _kref+0x10d8
	.word	0x95a289ab	! t0_kref+0x10c8:   	fdivs	%f10, %f11, %f10
	.word	0x95a0002a	! t0_kref+0x10cc:   	fmovs	%f10, %f10
	.word	0xd6d6101b	! t0_kref+0x10d0:   	ldsha	[%i0 + %i3]0x80, %o3
	.word	0xd6d81019	! t0_kref+0x10d4:   	ldxa	[%g0 + %i1]0x80, %o3
	.word	0xd6562012	! t0_kref+0x10d8:   	ldsh	[%i0 + 0x12], %o3
	.word	0x96d6801a	! t0_kref+0x10dc:   	umulcc	%i2, %i2, %o3
	.word	0x97a0002b	! t0_kref+0x10e0:   	fmovs	%f11, %f11
	.word	0x97a0052a	! t0_kref+0x10e4:   	fsqrts	%f10, %f11
	.word	0x95a2894a	! t0_kref+0x10e8:   	fmuld	%f10, %f10, %f10
	.word	0x96d0388c	! t0_kref+0x10ec:   	umulcc	%g0, -0x774, %o3
	.word	0xd6563fee	! t0_kref+0x10f0:   	ldsh	[%i0 - 0x12], %o3
	.word	0x95a28d2b	! t0_kref+0x10f4:   	fsmuld	%f10, %f11, %f10
	.word	0x96702d65	! t0_kref+0x10f8:   	udiv	%g0, 0xd65, %o3
	.word	0xc0f6101d	! t0_kref+0x10fc:   	stxa	%g0, [%i0 + %i5]0x80
	.word	0xd51fbe70	! t0_kref+0x1100:   	ldd	[%fp - 0x190], %f10
	.word	0x81aacaaa	! t0_kref+0x1104:   	fcmpes	%fcc0, %f11, %f10
	.word	0x96780000	! t0_kref+0x1108:   	sdiv	%g0, %g0, %o3
	.word	0x96f68000	! t0_kref+0x110c:   	udivcc	%i2, %g0, %o3
	.word	0xe01e2008	! t0_kref+0x1110:   	ldd	[%i0 + 8], %l0
	.word	0x97a0002b	! t0_kref+0x1114:   	fmovs	%f11, %f11
	.word	0xd6871058	! t0_kref+0x1118:   	lda	[%i4 + %i0]0x82, %o3
	.word	0x9650001a	! t0_kref+0x111c:   	umul	%g0, %i2, %o3
	.word	0x95a0192a	! t0_kref+0x1120:   	fstod	%f10, %f10
	.word	0x96f6bec7	! t0_kref+0x1124:   	udivcc	%i2, -0x139, %o3
	.word	0x95a2894a	! t0_kref+0x1128:   	fmuld	%f10, %f10, %f10
	.word	0x95b2cd60	! t0_kref+0x112c:   	fnot1s	%f11, %f10
	.word	0x9696801a	! t0_kref+0x1130:   	orcc	%i2, %i2, %o3
	.word	0xc0366006	! t0_kref+0x1134:   	clrh	[%i1 + 6]
	.word	0x95a2884a	! t0_kref+0x1138:   	faddd	%f10, %f10, %f10
	.word	0x972e8000	! t0_kref+0x113c:   	sll	%i2, %g0, %o3
	.word	0x964037e6	! t0_kref+0x1140:   	addc	%g0, -0x81a, %o3
	.word	0x97a01a4a	! t0_kref+0x1144:   	fdtoi	%f10, %f11
	.word	0x95a000ca	! t0_kref+0x1148:   	fnegd	%f10, %f10
	.word	0x95b2caea	! t0_kref+0x114c:   	fpsub32s	%f11, %f10, %f10
	.word	0xe66e3fe1	! t0_kref+0x1150:   	ldstub	[%i0 - 0x1f], %l3
	.word	0xc0764000	! t0_kref+0x1154:   	stx	%g0, [%i1]
	.word	0xd5a6501c	! t0_kref+0x1158:   	sta	%f10, [%i1 + %i4]0x80
	.word	0x96beb15f	! t0_kref+0x115c:   	xnorcc	%i2, -0xea1, %o3
	.word	0x97a01a4a	! t0_kref+0x1160:   	fdtoi	%f10, %f11
	.word	0x9fc00004	! t0_kref+0x1164:   	call	%g0 + %g4
	.word	0x97a2892b	! t0_kref+0x1168:   	fmuls	%f10, %f11, %f11
	.word	0x95b2caeb	! t0_kref+0x116c:   	fpsub32s	%f11, %f11, %f10
	.word	0x95a2884a	! t0_kref+0x1170:   	faddd	%f10, %f10, %f10
	.word	0xd606401c	! t0_kref+0x1174:   	ld	[%i1 + %i4], %o3
	.word	0xd64e7fea	! t0_kref+0x1178:   	ldsb	[%i1 - 0x16], %o3
	.word	0xe4380019	! t0_kref+0x117c:   	std	%l2, [%g0 + %i1]
	.word	0xe0380018	! t0_kref+0x1180:   	std	%l0, [%g0 + %i0]
	.word	0xd19e7fed	! t0_kref+0x1184:   	ldda	[%i1 - 0x13]%asi, %f8
	.word	0x9fc00004	! t0_kref+0x1188:   	call	%g0 + %g4
	.word	0xd6163ffa	! t0_kref+0x118c:   	lduh	[%i0 - 6], %o3
	.word	0x95a0192b	! t0_kref+0x1190:   	fstod	%f11, %f10
	.word	0xd6de5000	! t0_kref+0x1194:   	ldxa	[%i1]0x80, %o3
	.word	0x95b28f4a	! t0_kref+0x1198:   	fornot1	%f10, %f10, %f10
	.word	0xd6100018	! t0_kref+0x119c:   	lduh	[%g0 + %i0], %o3
	.word	0xe01e3ff8	! t0_kref+0x11a0:   	ldd	[%i0 - 8], %l0
	.word	0xe43e7fe0	! t0_kref+0x11a4:   	std	%l2, [%i1 - 0x20]
	.word	0xc56e401a	! t0_kref+0x11a8:   	prefetch	%i1 + %i2, 2
	.word	0x9740c000	! t0_kref+0x11ac:   	mov	%asi, %o3
	.word	0x96d68000	! t0_kref+0x11b0:   	umulcc	%i2, %g0, %o3
	.word	0x97a289ab	! t0_kref+0x11b4:   	fdivs	%f10, %f11, %f11
	.word	0x962021a3	! t0_kref+0x11b8:   	sub	%g0, 0x1a3, %o3
	.word	0x170a895e	! t0_kref+0x11bc:   	sethi	%hi(0x2a257800), %o3
	.word	0x97b28e6b	! t0_kref+0x11c0:   	fxnors	%f10, %f11, %f11
	.word	0x95a2894a	! t0_kref+0x11c4:   	fmuld	%f10, %f10, %f10
	.word	0x81580000	! t0_kref+0x11c8:   	flushw
	.word	0x81aa8aaa	! t0_kref+0x11cc:   	fcmpes	%fcc0, %f10, %f10
	.word	0x95b2cd2a	! t0_kref+0x11d0:   	fandnot1s	%f11, %f10, %f10
	.word	0x96182ba5	! t0_kref+0x11d4:   	xor	%g0, 0xba5, %o3
	.word	0x95b286ea	! t0_kref+0x11d8:   	fmul8ulx16	%f10, %f10, %f10
	.word	0x97b000a0	! t0_kref+0x11dc:   	edge16n	%g0, %g0, %o3
	.word	0x96a80000	! t0_kref+0x11e0:   	andncc	%g0, %g0, %o3
	.word	0x95a2c82a	! t0_kref+0x11e4:   	fadds	%f11, %f10, %f10
	.word	0xd51e6010	! t0_kref+0x11e8:   	ldd	[%i1 + 0x10], %f10
	.word	0x95a2894a	! t0_kref+0x11ec:   	fmuld	%f10, %f10, %f10
	.word	0xd6ce9019	! t0_kref+0x11f0:   	ldsba	[%i2 + %i1]0x80, %o3
	.word	0x964025df	! t0_kref+0x11f4:   	addc	%g0, 0x5df, %o3
	.word	0x95a8c04a	! t0_kref+0x11f8:   	fmovdul	%fcc0, %f10, %f10
	.word	0xd65e3fe8	! t0_kref+0x11fc:   	ldx	[%i0 - 0x18], %o3
	.word	0xd5180018	! t0_kref+0x1200:   	ldd	[%g0 + %i0], %f10
	.word	0x97a01a2b	! t0_kref+0x1204:   	fstoi	%f11, %f11
	.word	0x97a2c9ab	! t0_kref+0x1208:   	fdivs	%f11, %f11, %f11
	.word	0xb8103ffc	! t0_kref+0x120c:   	mov	0xfffffffc, %i4
	.word	0x95a2894a	! t0_kref+0x1210:   	fmuld	%f10, %f10, %f10
	.word	0x96f6babf	! t0_kref+0x1214:   	udivcc	%i2, -0x541, %o3
	.word	0xd1be185a	! t0_kref+0x1218:   	stda	%f8, [%i0 + %i2]0xc2
	.word	0xd700a030	! t0_kref+0x121c:   	ld	[%g2 + 0x30], %f11
	.word	0x96a68000	! t0_kref+0x1220:   	subcc	%i2, %g0, %o3
	.word	0xd5180019	! t0_kref+0x1224:   	ldd	[%g0 + %i1], %f10
	.word	0xd6064000	! t0_kref+0x1228:   	ld	[%i1], %o3
	.word	0x81aa8aca	! t0_kref+0x122c:   	fcmped	%fcc0, %f10, %f10
	.word	0x95a0192b	! t0_kref+0x1230:   	fstod	%f11, %f10
	.word	0x97b6805a	! t0_kref+0x1234:   	edge8l	%i2, %i2, %o3
	.word	0xd600a028	! t0_kref+0x1238:   	ld	[%g2 + 0x28], %o3
	.word	0x97408000	! t0_kref+0x123c:   	mov	%ccr, %o3
	.word	0x9fc00004	! t0_kref+0x1240:   	call	%g0 + %g4
	.word	0x97a0052b	! t0_kref+0x1244:   	fsqrts	%f11, %f11
	.word	0xd6080018	! t0_kref+0x1248:   	ldub	[%g0 + %i0], %o3
	.word	0xd6de501d	! t0_kref+0x124c:   	ldxa	[%i1 + %i5]0x80, %o3
	.word	0x97b28e2b	! t0_kref+0x1250:   	fands	%f10, %f11, %f11
	.word	0x26800007	! t0_kref+0x1254:   	bl,a	_kref+0x1270
	.word	0x965035f7	! t0_kref+0x1258:   	umul	%g0, -0xa09, %o3
	.word	0x97b28a6b	! t0_kref+0x125c:   	fpadd32s	%f10, %f11, %f11
	.word	0xe0180018	! t0_kref+0x1260:   	ldd	[%g0 + %i0], %l0
	.word	0x95a289aa	! t0_kref+0x1264:   	fdivs	%f10, %f10, %f10
	.word	0x97183fe9	! t0_kref+0x1268:   	tsubcctv	%g0, -0x17, %o3
	.word	0xe0380019	! t0_kref+0x126c:   	std	%l0, [%g0 + %i1]
	.word	0xe46e8019	! t0_kref+0x1270:   	ldstub	[%i2 + %i1], %l2
	.word	0x960ea251	! t0_kref+0x1274:   	and	%i2, 0x251, %o3
	.word	0x3f800005	! t0_kref+0x1278:   	fbo,a	_kref+0x128c
	.word	0x97b68240	! t0_kref+0x127c:   	array16	%i2, %g0, %o3
	.word	0xc07e6000	! t0_kref+0x1280:   	swap	[%i1], %g0
	.word	0x2e800004	! t0_kref+0x1284:   	bvs,a	_kref+0x1294
	.word	0x95a2c92b	! t0_kref+0x1288:   	fmuls	%f11, %f11, %f10
	.word	0x8143c000	! t0_kref+0x128c:   	stbar
	.word	0x26800002	! t0_kref+0x1290:   	bl,a	_kref+0x1298
	.word	0x95a2882a	! t0_kref+0x1294:   	fadds	%f10, %f10, %f10
	.word	0x95b28fab	! t0_kref+0x1298:   	fors	%f10, %f11, %f10
	.word	0x97b68240	! t0_kref+0x129c:   	array16	%i2, %g0, %o3
	.word	0x9fc00004	! t0_kref+0x12a0:   	call	%g0 + %g4
	.word	0xd53e7ff8	! t0_kref+0x12a4:   	std	%f10, [%i1 - 8]
	.word	0x2b800002	! t0_kref+0x12a8:   	fbug,a	_kref+0x12b0
	.word	0xd51e3ff0	! t0_kref+0x12ac:   	ldd	[%i0 - 0x10], %f10
	.word	0x35800001	! t0_kref+0x12b0:   	fbue,a	_kref+0x12b4
	.word	0x95a288ca	! t0_kref+0x12b4:   	fsubd	%f10, %f10, %f10
	.word	0x27480008	! t0_kref+0x12b8:   	fbul,a,pt	%fcc0, _kref+0x12d8
	.word	0xd5be501d	! t0_kref+0x12bc:   	stda	%f10, [%i1 + %i5]0x80
	.word	0x95b28e0a	! t0_kref+0x12c0:   	fand	%f10, %f10, %f10
	.word	0x97200000	! t0_kref+0x12c4:   	mulscc	%g0, %g0, %o3
	.word	0x9616b927	! t0_kref+0x12c8:   	or	%i2, -0x6d9, %o3
	.word	0xd6566018	! t0_kref+0x12cc:   	ldsh	[%i1 + 0x18], %o3
	.word	0xd6070018	! t0_kref+0x12d0:   	ld	[%i4 + %i0], %o3
	.word	0x95a0012b	! t0_kref+0x12d4:   	fabss	%f11, %f10
	.word	0x961eb7de	! t0_kref+0x12d8:   	xor	%i2, -0x822, %o3
	.word	0xd606401c	! t0_kref+0x12dc:   	ld	[%i1 + %i4], %o3
	.word	0x96180000	! t0_kref+0x12e0:   	xor	%g0, %g0, %o3
	.word	0xe43e4000	! t0_kref+0x12e4:   	std	%l2, [%i1]
	.word	0xf428a039	! t0_kref+0x12e8:   	stb	%i2, [%g2 + 0x39]
	.word	0x95a2884a	! t0_kref+0x12ec:   	faddd	%f10, %f10, %f10
	.word	0x95a2894a	! t0_kref+0x12f0:   	fmuld	%f10, %f10, %f10
	.word	0x95a0002b	! t0_kref+0x12f4:   	fmovs	%f11, %f10
	.word	0x95a0190a	! t0_kref+0x12f8:   	fitod	%f10, %f10
	.word	0x81aa8aab	! t0_kref+0x12fc:   	fcmpes	%fcc0, %f10, %f11
	.word	0x81de3bc2	! t0_kref+0x1300:   	flush	%i0 - 0x43e
	.word	0x97a000ab	! t0_kref+0x1304:   	fnegs	%f11, %f11
	.word	0x96280000	! t0_kref+0x1308:   	andn	%g0, %g0, %o3
	.word	0x38800002	! t0_kref+0x130c:   	bgu,a	_kref+0x1314
	.word	0x95a018ca	! t0_kref+0x1310:   	fdtos	%f10, %f10
	.word	0x9736a01e	! t0_kref+0x1314:   	srl	%i2, 0x1e, %o3
	.word	0x95b28e4a	! t0_kref+0x1318:   	fxnor	%f10, %f10, %f10
	.word	0x95a0002b	! t0_kref+0x131c:   	fmovs	%f11, %f10
	.word	0x9736a00b	! t0_kref+0x1320:   	srl	%i2, 0xb, %o3
	.word	0xd51f4019	! t0_kref+0x1324:   	ldd	[%i5 + %i1], %f10
	.word	0x9646ab18	! t0_kref+0x1328:   	addc	%i2, 0xb18, %o3
	.word	0x9690339c	! t0_kref+0x132c:   	orcc	%g0, -0xc64, %o3
	.word	0x95b28f8a	! t0_kref+0x1330:   	for	%f10, %f10, %f10
	.word	0x97a2892a	! t0_kref+0x1334:   	fmuls	%f10, %f10, %f11
	.word	0x95a8804a	! t0_kref+0x1338:   	fmovdlg	%fcc0, %f10, %f10
	.word	0x34800004	! t0_kref+0x133c:   	bg,a	_kref+0x134c
	.word	0xc568a040	! t0_kref+0x1340:   	prefetch	%g2 + 0x40, 2
	.word	0x97a2882a	! t0_kref+0x1344:   	fadds	%f10, %f10, %f11
	.word	0x96f68000	! t0_kref+0x1348:   	udivcc	%i2, %g0, %o3
	.word	0x25800008	! t0_kref+0x134c:   	fblg,a	_kref+0x136c
	.word	0x97300000	! t0_kref+0x1350:   	srl	%g0, %g0, %o3
	.word	0x96d68000	! t0_kref+0x1354:   	umulcc	%i2, %g0, %o3
	.word	0xc168a00f	! t0_kref+0x1358:   	prefetch	%g2 + 0xf, 0
	.word	0x95b28a4a	! t0_kref+0x135c:   	fpadd32	%f10, %f10, %f10
	.word	0x95a0052a	! t0_kref+0x1360:   	fsqrts	%f10, %f10
	.word	0x97b2854a	! t0_kref+0x1364:   	fcmpeq16	%f10, %f10, %o3
	.word	0x96900000	! t0_kref+0x1368:   	orcc	%g0, %g0, %o3
	.word	0xea6e8018	! t0_kref+0x136c:   	ldstub	[%i2 + %i0], %l5
	.word	0x95a0054a	! t0_kref+0x1370:   	fsqrtd	%f10, %f10
	.word	0x97b68320	! t0_kref+0x1374:   	bmask	%i2, %g0, %o3
	.word	0x96f0001a	! t0_kref+0x1378:   	udivcc	%g0, %i2, %o3
	.word	0xe49e505d	! t0_kref+0x137c:   	ldda	[%i1 + %i5]0x82, %l2
	.word	0x97a01a4a	! t0_kref+0x1380:   	fdtoi	%f10, %f11
	.word	0x97203168	! t0_kref+0x1384:   	mulscc	%g0, -0xe98, %o3
	.word	0x97b00280	! t0_kref+0x1388:   	array32	%g0, %g0, %o3
	.word	0x96f00000	! t0_kref+0x138c:   	udivcc	%g0, %g0, %o3
	.word	0x95a0192b	! t0_kref+0x1390:   	fstod	%f11, %f10
	.word	0xe01e001d	! t0_kref+0x1394:   	ldd	[%i0 + %i5], %l0
	.word	0x9720001a	! t0_kref+0x1398:   	mulscc	%g0, %i2, %o3
	.word	0x95a0054a	! t0_kref+0x139c:   	fsqrtd	%f10, %f10
	.word	0xc568a005	! t0_kref+0x13a0:   	prefetch	%g2 + 5, 2
	.word	0x97a2c9ab	! t0_kref+0x13a4:   	fdivs	%f11, %f11, %f11
	.word	0x81df8000	! t0_kref+0x13a8:   	flush	%fp
	.word	0x95b00c20	! t0_kref+0x13ac:   	fzeros	%f10
	.word	0x96f0309f	! t0_kref+0x13b0:   	udivcc	%g0, -0xf61, %o3
	.word	0xd6066010	! t0_kref+0x13b4:   	ld	[%i1 + 0x10], %o3
	.word	0x9fc10000	! t0_kref+0x13b8:   	call	%g4
	.word	0x95a2894a	! t0_kref+0x13bc:   	fmuld	%f10, %f10, %f10
	.word	0xc768a081	! t0_kref+0x13c0:   	prefetch	%g2 + 0x81, 3
	.word	0xd6000019	! t0_kref+0x13c4:   	ld	[%g0 + %i1], %o3
	.word	0x23800006	! t0_kref+0x13c8:   	fbne,a	_kref+0x13e0
	.word	0xd59e5000	! t0_kref+0x13cc:   	ldda	[%i1]0x80, %f10
	.word	0x81aaca2b	! t0_kref+0x13d0:   	fcmps	%fcc0, %f11, %f11
	.word	0x001fffff	! t0_kref+0x13d4:   	illtrap	0x1fffff
	.word	0x96a0001a	! t0_kref+0x13d8:   	subcc	%g0, %i2, %o3
	.word	0x97a0188b	! t0_kref+0x13dc:   	fitos	%f11, %f11
	.word	0x9696ba05	! t0_kref+0x13e0:   	orcc	%i2, -0x5fb, %o3
	.word	0xd616001b	! t0_kref+0x13e4:   	lduh	[%i0 + %i3], %o3
	.word	0x878020f0	! t0_kref+0x13e8:   	mov	0xf0, %asi
	.word	0x86102003	! t0_kref+0x13ec:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x13f0:   	bne,a	_kref+0x13f0
	.word	0x86a0e001	! t0_kref+0x13f4:   	subcc	%g3, 1, %g3
	.word	0xd51fbda0	! t0_kref+0x13f8:   	ldd	[%fp - 0x260], %f10
	.word	0x9726b477	! t0_kref+0x13fc:   	mulscc	%i2, -0xb89, %o3
	.word	0xc168a04f	! t0_kref+0x1400:   	prefetch	%g2 + 0x4f, 0
	.word	0xd696101b	! t0_kref+0x1404:   	lduha	[%i0 + %i3]0x80, %o3
	.word	0x97a01a4a	! t0_kref+0x1408:   	fdtoi	%f10, %f11
	.word	0xd6066000	! t0_kref+0x140c:   	ld	[%i1], %o3
	.word	0x9696b637	! t0_kref+0x1410:   	orcc	%i2, -0x9c9, %o3
	.word	0x96e6a3c9	! t0_kref+0x1414:   	subccc	%i2, 0x3c9, %o3
	.word	0x97a0188a	! t0_kref+0x1418:   	fitos	%f10, %f11
	.word	0xd6000018	! t0_kref+0x141c:   	ld	[%g0 + %i0], %o3
	.word	0x37800001	! t0_kref+0x1420:   	fbge,a	_kref+0x1424
	.word	0x9738001a	! t0_kref+0x1424:   	sra	%g0, %i2, %o3
	.word	0x9726801a	! t0_kref+0x1428:   	mulscc	%i2, %i2, %o3
	.word	0x95b00cca	! t0_kref+0x142c:   	fnot2	%f10, %f10
	.word	0xd60e6006	! t0_kref+0x1430:   	ldub	[%i1 + 6], %o3
	.word	0x87802080	! t0_kref+0x1434:   	mov	0x80, %asi
	.word	0xd616601a	! t0_kref+0x1438:   	lduh	[%i1 + 0x1a], %o3
	.word	0x95a2884a	! t0_kref+0x143c:   	faddd	%f10, %f10, %f10
	.word	0x97a289ab	! t0_kref+0x1440:   	fdivs	%f10, %f11, %f11
	.word	0x97382001	! t0_kref+0x1444:   	sra	%g0, 0x1, %o3
	.word	0x96800000	! t0_kref+0x1448:   	addcc	%g0, %g0, %o3
	.word	0x96aeb44c	! t0_kref+0x144c:   	andncc	%i2, -0xbb4, %o3
	.word	0x96aeb29f	! t0_kref+0x1450:   	andncc	%i2, -0xd61, %o3
	.word	0x97a0002b	! t0_kref+0x1454:   	fmovs	%f11, %f11
	.word	0x9600001a	! t0_kref+0x1458:   	add	%g0, %i2, %o3
	.word	0x95a000ab	! t0_kref+0x145c:   	fnegs	%f11, %f10
	.word	0x81aa8aaa	! t0_kref+0x1460:   	fcmpes	%fcc0, %f10, %f10
	.word	0x97b0005a	! t0_kref+0x1464:   	edge8l	%g0, %i2, %o3
	.word	0x9658001a	! t0_kref+0x1468:   	smul	%g0, %i2, %o3
	.word	0x96f6801a	! t0_kref+0x146c:   	udivcc	%i2, %i2, %o3
	.word	0xd68e7fe8	! t0_kref+0x1470:   	lduba	[%i1 - 0x18]%asi, %o3
	.word	0x97a0188a	! t0_kref+0x1474:   	fitos	%f10, %f11
	.word	0x95a0002b	! t0_kref+0x1478:   	fmovs	%f11, %f10
	.word	0x960e801a	! t0_kref+0x147c:   	and	%i2, %i2, %o3
	.word	0x97b2ccab	! t0_kref+0x1480:   	fandnot2s	%f11, %f11, %f11
	.word	0x97b0033a	! t0_kref+0x1484:   	bmask	%g0, %i2, %o3
	.word	0xede8a042	! t0_kref+0x1488:   	prefetcha	%g2 + 0x42, 22
	.word	0x95a28d2a	! t0_kref+0x148c:   	fsmuld	%f10, %f10, %f10
	.word	0x97400000	! t0_kref+0x1490:   	mov	%y, %o3
	.word	0x95a000aa	! t0_kref+0x1494:   	fnegs	%f10, %f10
	.word	0x81deb195	! t0_kref+0x1498:   	flush	%i2 - 0xe6b
	.word	0x961825f9	! t0_kref+0x149c:   	xor	%g0, 0x5f9, %o3
	.word	0x97a01a4a	! t0_kref+0x14a0:   	fdtoi	%f10, %f11
	.word	0x9696801a	! t0_kref+0x14a4:   	orcc	%i2, %i2, %o3
	.word	0xd6064000	! t0_kref+0x14a8:   	ld	[%i1], %o3
	.word	0x97a0012a	! t0_kref+0x14ac:   	fabss	%f10, %f11
	.word	0x97a01a4a	! t0_kref+0x14b0:   	fdtoi	%f10, %f11
	.word	0x81aacaab	! t0_kref+0x14b4:   	fcmpes	%fcc0, %f11, %f11
	.word	0xe09e5000	! t0_kref+0x14b8:   	ldda	[%i1]0x80, %l0
	.word	0x96f00000	! t0_kref+0x14bc:   	udivcc	%g0, %g0, %o3
	.word	0x9fc00004	! t0_kref+0x14c0:   	call	%g0 + %g4
	.word	0xe43f4018	! t0_kref+0x14c4:   	std	%l2, [%i5 + %i0]
	.word	0x9610368a	! t0_kref+0x14c8:   	mov	0xfffff68a, %o3
	.word	0x95b28a0a	! t0_kref+0x14cc:   	fpadd16	%f10, %f10, %f10
	.word	0x96be8000	! t0_kref+0x14d0:   	xnorcc	%i2, %g0, %o3
	.word	0xd6166002	! t0_kref+0x14d4:   	lduh	[%i1 + 2], %o3
	.word	0x95b28d40	! t0_kref+0x14d8:   	fnot1	%f10, %f10
	.word	0xd51e2008	! t0_kref+0x14dc:   	ldd	[%i0 + 8], %f10
	.word	0xd6167ff0	! t0_kref+0x14e0:   	lduh	[%i1 - 0x10], %o3
	.word	0x96b80000	! t0_kref+0x14e4:   	xnorcc	%g0, %g0, %o3
	.word	0x96f00000	! t0_kref+0x14e8:   	udivcc	%g0, %g0, %o3
	.word	0xd720a004	! t0_kref+0x14ec:   	st	%f11, [%g2 + 4]
	.word	0xd608a02d	! t0_kref+0x14f0:   	ldub	[%g2 + 0x2d], %o3
	.word	0x97b28d60	! t0_kref+0x14f4:   	fnot1s	%f10, %f11
	.word	0x95a289aa	! t0_kref+0x14f8:   	fdivs	%f10, %f10, %f10
	.word	0xd6562014	! t0_kref+0x14fc:   	ldsh	[%i0 + 0x14], %o3
	.word	0x968eb1d0	! t0_kref+0x1500:   	andcc	%i2, -0xe30, %o3
	.word	0x95a01a4a	! t0_kref+0x1504:   	fdtoi	%f10, %f10
	.word	0x95a2c82a	! t0_kref+0x1508:   	fadds	%f11, %f10, %f10
	.word	0x81dab854	! t0_kref+0x150c:   	flush	%o2 - 0x7ac
	.word	0xd6164000	! t0_kref+0x1510:   	lduh	[%i1], %o3
	.word	0x81dfa3f7	! t0_kref+0x1514:   	flush	%fp + 0x3f7
	.word	0x95a0192b	! t0_kref+0x1518:   	fstod	%f11, %f10
	.word	0xd51e2018	! t0_kref+0x151c:   	ldd	[%i0 + 0x18], %f10
	.word	0xd6060000	! t0_kref+0x1520:   	ld	[%i0], %o3
	.word	0x95a0054a	! t0_kref+0x1524:   	fsqrtd	%f10, %f10
	.word	0xd51e3ff0	! t0_kref+0x1528:   	ldd	[%i0 - 0x10], %f10
	.word	0x86102004	! t0_kref+0x152c:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x1530:   	bne,a	_kref+0x1530
	.word	0x86a0e001	! t0_kref+0x1534:   	subcc	%g3, 1, %g3
	.word	0xd67e7fe0	! t0_kref+0x1538:   	swap	[%i1 - 0x20], %o3
	.word	0xe0380019	! t0_kref+0x153c:   	std	%l0, [%g0 + %i1]
	.word	0x33800008	! t0_kref+0x1540:   	fbe,a	_kref+0x1560
	.word	0x97b0001a	! t0_kref+0x1544:   	edge8	%g0, %i2, %o3
	.word	0x97382016	! t0_kref+0x1548:   	sra	%g0, 0x16, %o3
	.word	0x9690001a	! t0_kref+0x154c:   	orcc	%g0, %i2, %o3
	.word	0x8580353a	! t0_kref+0x1550:   	mov	0xfffff53a, %ccr
	.word	0x95b28eca	! t0_kref+0x1554:   	fornot2	%f10, %f10, %f10
	.word	0x9608001a	! t0_kref+0x1558:   	and	%g0, %i2, %o3
	.word	0x9608246b	! t0_kref+0x155c:   	and	%g0, 0x46b, %o3
	.word	0x97b000c0	! t0_kref+0x1560:   	edge16l	%g0, %g0, %o3
	.word	0x96be801a	! t0_kref+0x1564:   	xnorcc	%i2, %i2, %o3
	.word	0x25800006	! t0_kref+0x1568:   	fblg,a	_kref+0x1580
	.word	0x95a0002a	! t0_kref+0x156c:   	fmovs	%f10, %f10
	.word	0xd51fbca8	! t0_kref+0x1570:   	ldd	[%fp - 0x358], %f10
	.word	0x95b2862a	! t0_kref+0x1574:   	fmul8x16	%f10, %f10, %f10
	.word	0x96e00000	! t0_kref+0x1578:   	subccc	%g0, %g0, %o3
	.word	0xd60e3fe5	! t0_kref+0x157c:   	ldub	[%i0 - 0x1b], %o3
	.word	0x96b8001a	! t0_kref+0x1580:   	xnorcc	%g0, %i2, %o3
	.word	0x9686801a	! t0_kref+0x1584:   	addcc	%i2, %i2, %o3
	.word	0xd6ce3fff	! t0_kref+0x1588:   	ldsba	[%i0 - 1]%asi, %o3
	.word	0x81aa8aab	! t0_kref+0x158c:   	fcmpes	%fcc0, %f10, %f11
	.word	0x97a0012a	! t0_kref+0x1590:   	fabss	%f10, %f11
	.word	0xd51e3fe8	! t0_kref+0x1594:   	ldd	[%i0 - 0x18], %f10
	.word	0xe43e2018	! t0_kref+0x1598:   	std	%l2, [%i0 + 0x18]
	.word	0xd51e3fe0	! t0_kref+0x159c:   	ldd	[%i0 - 0x20], %f10
	.word	0x95b28d40	! t0_kref+0x15a0:   	fnot1	%f10, %f10
	.word	0x95a2894a	! t0_kref+0x15a4:   	fmuld	%f10, %f10, %f10
	.word	0x95a2884a	! t0_kref+0x15a8:   	faddd	%f10, %f10, %f10
	.word	0xd60e3fe7	! t0_kref+0x15ac:   	ldub	[%i0 - 0x19], %o3
	.word	0x86102004	! t0_kref+0x15b0:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x15b4:   	bne,a	_kref+0x15b4
	.word	0x86a0e001	! t0_kref+0x15b8:   	subcc	%g3, 1, %g3
	.word	0x81aa8aab	! t0_kref+0x15bc:   	fcmpes	%fcc0, %f10, %f11
	.word	0xd6100019	! t0_kref+0x15c0:   	lduh	[%g0 + %i1], %o3
	.word	0x97a0002a	! t0_kref+0x15c4:   	fmovs	%f10, %f11
	.word	0x95b28e4a	! t0_kref+0x15c8:   	fxnor	%f10, %f10, %f10
	.word	0x95b2862a	! t0_kref+0x15cc:   	fmul8x16	%f10, %f10, %f10
	.word	0x95b28d2a	! t0_kref+0x15d0:   	fandnot1s	%f10, %f10, %f10
	.word	0x8143c000	! t0_kref+0x15d4:   	stbar
	.word	0x81db000a	! t0_kref+0x15d8:   	flush	%o4 + %o2
	.word	0xd6067fe0	! t0_kref+0x15dc:   	ld	[%i1 - 0x20], %o3
	.word	0xd6070018	! t0_kref+0x15e0:   	ld	[%i4 + %i0], %o3
	.word	0x95b28e2a	! t0_kref+0x15e4:   	fands	%f10, %f10, %f10
	.word	0x9690001a	! t0_kref+0x15e8:   	orcc	%g0, %i2, %o3
	.word	0xe43e0000	! t0_kref+0x15ec:   	std	%l2, [%i0]
	.word	0x97a000ab	! t0_kref+0x15f0:   	fnegs	%f11, %f11
	.word	0x97b2840a	! t0_kref+0x15f4:   	fcmple16	%f10, %f10, %o3
	.word	0x23800002	! t0_kref+0x15f8:   	fbne,a	_kref+0x1600
	.word	0x95b00fe0	! t0_kref+0x15fc:   	fones	%f10
	.word	0x97b007aa	! t0_kref+0x1600:   	fpackfix	%f10, %f11
	.word	0x37480006	! t0_kref+0x1604:   	fbge,a,pt	%fcc0, _kref+0x161c
	.word	0x9686b8a8	! t0_kref+0x1608:   	addcc	%i2, -0x758, %o3
	.word	0x37800002	! t0_kref+0x160c:   	fbge,a	_kref+0x1614
	.word	0x96402653	! t0_kref+0x1610:   	addc	%g0, 0x653, %o3
	.word	0xff6e001c	! t0_kref+0x1614:   	prefetch	%i0 + %i4, 31
	.word	0x2c800006	! t0_kref+0x1618:   	bneg,a	_kref+0x1630
	.word	0x97282015	! t0_kref+0x161c:   	sll	%g0, 0x15, %o3
	.word	0x95b2898a	! t0_kref+0x1620:   	bshuffle	%f10, %f10, %f10
	.word	0x96f68000	! t0_kref+0x1624:   	udivcc	%i2, %g0, %o3
	.word	0xd47e2004	! t0_kref+0x1628:   	swap	[%i0 + 4], %o2
	.word	0x9728001a	! t0_kref+0x162c:   	sll	%g0, %i2, %o3
	.word	0x95a0002b	! t0_kref+0x1630:   	fmovs	%f11, %f10
	.word	0xd6c67ff0	! t0_kref+0x1634:   	ldswa	[%i1 - 0x10]%asi, %o3
	.word	0x967e8000	! t0_kref+0x1638:   	sdiv	%i2, %g0, %o3
	.word	0x97a000aa	! t0_kref+0x163c:   	fnegs	%f10, %f11
	.word	0x96aea6a1	! t0_kref+0x1640:   	andncc	%i2, 0x6a1, %o3
	.word	0x95a2cd2b	! t0_kref+0x1644:   	fsmuld	%f11, %f11, %f10
	.word	0xd656001b	! t0_kref+0x1648:   	ldsh	[%i0 + %i3], %o3
	.word	0x973ea00a	! t0_kref+0x164c:   	sra	%i2, 0xa, %o3
	.word	0x3b800008	! t0_kref+0x1650:   	fble,a	_kref+0x1670
	.word	0x97a0052b	! t0_kref+0x1654:   	fsqrts	%f11, %f11
	.word	0xdaf8a010	! t0_kref+0x1658:   	swapa	[%g2 + 0x10]%asi, %o5
	.word	0x2e800005	! t0_kref+0x165c:   	bvs,a	_kref+0x1670
	.word	0x96900000	! t0_kref+0x1660:   	orcc	%g0, %g0, %o3
	.word	0x97b284ca	! t0_kref+0x1664:   	fcmpne32	%f10, %f10, %o3
	.word	0x97b6831a	! t0_kref+0x1668:   	alignaddr	%i2, %i2, %o3
	.word	0x95a2894a	! t0_kref+0x166c:   	fmuld	%f10, %f10, %f10
	.word	0xd59f5040	! t0_kref+0x1670:   	ldda	[%i5]0x82, %f10
	.word	0xf4263fec	! t0_kref+0x1674:   	st	%i2, [%i0 - 0x14]
	.word	0x965ea377	! t0_kref+0x1678:   	smul	%i2, 0x377, %o3
	.word	0x95a2c9ab	! t0_kref+0x167c:   	fdivs	%f11, %f11, %f10
	.word	0x95a0054a	! t0_kref+0x1680:   	fsqrtd	%f10, %f10
	.word	0x965ea238	! t0_kref+0x1684:   	smul	%i2, 0x238, %o3
	.word	0x95b28d40	! t0_kref+0x1688:   	fnot1	%f10, %f10
	.word	0x25480006	! t0_kref+0x168c:   	fblg,a,pt	%fcc0, _kref+0x16a4
	.word	0xc168a040	! t0_kref+0x1690:   	prefetch	%g2 + 0x40, 0
	.word	0x95b2c66b	! t0_kref+0x1694:   	fmul8x16au	%f11, %f11, %f10
	.word	0xd6560000	! t0_kref+0x1698:   	ldsh	[%i0], %o3
	.word	0x29480005	! t0_kref+0x169c:   	fbl,a,pt	%fcc0, _kref+0x16b0
	.word	0x97400000	! t0_kref+0x16a0:   	mov	%y, %o3
	.word	0x17305ed7	! t0_kref+0x16a4:   	sethi	%hi(0xc17b5c00), %o3
	.word	0x96de801a	! t0_kref+0x16a8:   	smulcc	%i2, %i2, %o3
	.word	0xe01e0000	! t0_kref+0x16ac:   	ldd	[%i0], %l0
	.word	0xd6460000	! t0_kref+0x16b0:   	ldsw	[%i0], %o3
	.word	0xd7263fe8	! t0_kref+0x16b4:   	st	%f11, [%i0 - 0x18]
	.word	0x9610001a	! t0_kref+0x16b8:   	mov	%i2, %o3
	.word	0x97b68240	! t0_kref+0x16bc:   	array16	%i2, %g0, %o3
	.word	0x96402089	! t0_kref+0x16c0:   	addc	%g0, 0x89, %o3
	.word	0x97b00200	! t0_kref+0x16c4:   	array8	%g0, %g0, %o3
	.word	0xe1e8a001	! t0_kref+0x16c8:   	prefetcha	%g2 + 1, 16
	.word	0xc0363fe6	! t0_kref+0x16cc:   	clrh	[%i0 - 0x1a]
	.word	0xe41e6008	! t0_kref+0x16d0:   	ldd	[%i1 + 8], %l2
	.word	0xc1286bce	! t0_kref+0x16d4:   	st	%fsr, [%g1 + 0xbce]
	.word	0xf428a02b	! t0_kref+0x16d8:   	stb	%i2, [%g2 + 0x2b]
	.word	0x97b2854a	! t0_kref+0x16dc:   	fcmpeq16	%f10, %f10, %o3
	.word	0x95a2894a	! t0_kref+0x16e0:   	fmuld	%f10, %f10, %f10
	.word	0xf4b0a01e	! t0_kref+0x16e4:   	stha	%i2, [%g2 + 0x1e]%asi
	.word	0x95b28e0a	! t0_kref+0x16e8:   	fand	%f10, %f10, %f10
	.word	0xd656c019	! t0_kref+0x16ec:   	ldsh	[%i3 + %i1], %o3
	.word	0x96080000	! t0_kref+0x16f0:   	and	%g0, %g0, %o3
	.word	0x97a2892b	! t0_kref+0x16f4:   	fmuls	%f10, %f11, %f11
	.word	0xd6564000	! t0_kref+0x16f8:   	ldsh	[%i1], %o3
	.word	0x95b28e0a	! t0_kref+0x16fc:   	fand	%f10, %f10, %f10
	.word	0x95a2894a	! t0_kref+0x1700:   	fmuld	%f10, %f10, %f10
	.word	0x97408000	! t0_kref+0x1704:   	mov	%ccr, %o3
	.word	0x97a0188a	! t0_kref+0x1708:   	fitos	%f10, %f11
	.word	0x9738001a	! t0_kref+0x170c:   	sra	%g0, %i2, %o3
	.word	0x81aa8aab	! t0_kref+0x1710:   	fcmpes	%fcc0, %f10, %f11
	.word	0x81b01021	! t0_kref+0x1714:   	siam	0x1
	.word	0x9720001a	! t0_kref+0x1718:   	mulscc	%g0, %i2, %o3
	.word	0x95b28a4a	! t0_kref+0x171c:   	fpadd32	%f10, %f10, %f10
	.word	0xd6163ffe	! t0_kref+0x1720:   	lduh	[%i0 - 2], %o3
	.word	0x96600000	! t0_kref+0x1724:   	subc	%g0, %g0, %o3
	.word	0x97b00280	! t0_kref+0x1728:   	array32	%g0, %g0, %o3
	.word	0x97b6817a	! t0_kref+0x172c:   	edge32ln	%i2, %i2, %o3
	.word	0xf4366002	! t0_kref+0x1730:   	sth	%i2, [%i1 + 2]
	.word	0x96a6801a	! t0_kref+0x1734:   	subcc	%i2, %i2, %o3
	.word	0x97a2c92b	! t0_kref+0x1738:   	fmuls	%f11, %f11, %f11
	.word	0x95a2894a	! t0_kref+0x173c:   	fmuld	%f10, %f10, %f10
	.word	0x97a0002a	! t0_kref+0x1740:   	fmovs	%f10, %f11
	.word	0x2e800005	! t0_kref+0x1744:   	bvs,a	_kref+0x1758
	.word	0x96be801a	! t0_kref+0x1748:   	xnorcc	%i2, %i2, %o3
	.word	0xebee501a	! t0_kref+0x174c:   	prefetcha	%i1 + %i2, 21
	.word	0xc5e8a00c	! t0_kref+0x1750:   	prefetcha	%g2 + 0xc, 2
	.word	0x95b00c20	! t0_kref+0x1754:   	fzeros	%f10
	.word	0xe43e6000	! t0_kref+0x1758:   	std	%l2, [%i1]
	.word	0xd64e8019	! t0_kref+0x175c:   	ldsb	[%i2 + %i1], %o3
	.word	0x96e6801a	! t0_kref+0x1760:   	subccc	%i2, %i2, %o3
	.word	0x97b00fe0	! t0_kref+0x1764:   	fones	%f11
	.word	0x95a0012b	! t0_kref+0x1768:   	fabss	%f11, %f10
	.word	0x97b2ce6a	! t0_kref+0x176c:   	fxnors	%f11, %f10, %f11
	.word	0x95a0054a	! t0_kref+0x1770:   	fsqrtd	%f10, %f10
	.word	0x96f02c6e	! t0_kref+0x1774:   	udivcc	%g0, 0xc6e, %o3
	.word	0x97b00100	! t0_kref+0x1778:   	edge32	%g0, %g0, %o3
	.word	0x9608001a	! t0_kref+0x177c:   	and	%g0, %i2, %o3
	.word	0xd6df5019	! t0_kref+0x1780:   	ldxa	[%i5 + %i1]0x80, %o3
	.word	0x3f800001	! t0_kref+0x1784:   	fbo,a	_kref+0x1788
	.word	0xe0180019	! t0_kref+0x1788:   	ldd	[%g0 + %i1], %l0
	.word	0x9606bffc	! t0_kref+0x178c:   	add	%i2, -0x4, %o3
	.word	0xd6163fee	! t0_kref+0x1790:   	lduh	[%i0 - 0x12], %o3
	.word	0xd51fbd58	! t0_kref+0x1794:   	ldd	[%fp - 0x2a8], %f10
	.word	0x96102277	! t0_kref+0x1798:   	mov	0x277, %o3
	.word	0x9686801a	! t0_kref+0x179c:   	addcc	%i2, %i2, %o3
	.word	0x971ea3f0	! t0_kref+0x17a0:   	tsubcctv	%i2, 0x3f0, %o3
	.word	0x967e801a	! t0_kref+0x17a4:   	sdiv	%i2, %i2, %o3
	.word	0xe03e6010	! t0_kref+0x17a8:   	std	%l0, [%i1 + 0x10]
	.word	0x9650001a	! t0_kref+0x17ac:   	umul	%g0, %i2, %o3
	.word	0xd656401b	! t0_kref+0x17b0:   	ldsh	[%i1 + %i3], %o3
	.word	0x9620311d	! t0_kref+0x17b4:   	sub	%g0, -0xee3, %o3
	.word	0x32800002	! t0_kref+0x17b8:   	bne,a	_kref+0x17c0
	.word	0x97b000c0	! t0_kref+0x17bc:   	edge16l	%g0, %g0, %o3
	.word	0xe41e4000	! t0_kref+0x17c0:   	ldd	[%i1], %l2
	.word	0x96402aca	! t0_kref+0x17c4:   	addc	%g0, 0xaca, %o3
	.word	0xc0b0a028	! t0_kref+0x17c8:   	stha	%g0, [%g2 + 0x28]%asi
	.word	0xc0f66010	! t0_kref+0x17cc:   	stxa	%g0, [%i1 + 0x10]%asi
	.word	0x95b28a6a	! t0_kref+0x17d0:   	fpadd32s	%f10, %f10, %f10
	.word	0x96e03e9a	! t0_kref+0x17d4:   	subccc	%g0, -0x166, %o3
	.word	0x35800008	! t0_kref+0x17d8:   	fbue,a	_kref+0x17f8
	.word	0x96d6801a	! t0_kref+0x17dc:   	umulcc	%i2, %i2, %o3
	.word	0xd64e0000	! t0_kref+0x17e0:   	ldsb	[%i0], %o3
	.word	0x97b00f2a	! t0_kref+0x17e4:   	fsrc2s	%f10, %f11
	.word	0x95b007aa	! t0_kref+0x17e8:   	fpackfix	%f10, %f10
	.word	0xd656601c	! t0_kref+0x17ec:   	ldsh	[%i1 + 0x1c], %o3
	.word	0x97a01a2b	! t0_kref+0x17f0:   	fstoi	%f11, %f11
	.word	0x9744c000	! t0_kref+0x17f4:   	mov	%gsr, %o3
	.word	0x95a000ab	! t0_kref+0x17f8:   	fnegs	%f11, %f10
	.word	0x9fc00004	! t0_kref+0x17fc:   	call	%g0 + %g4
	.word	0xd60e2006	! t0_kref+0x1800:   	ldub	[%i0 + 6], %o3
	.word	0x81de400f	! t0_kref+0x1804:   	flush	%i1 + %o7
	.word	0xd6100018	! t0_kref+0x1808:   	lduh	[%g0 + %i0], %o3
	.word	0x95a0188b	! t0_kref+0x180c:   	fitos	%f11, %f10
	.word	0x95a0102a	! t0_kref+0x1810:   	fstox	%f10, %f10
	.word	0x95a0188a	! t0_kref+0x1814:   	fitos	%f10, %f10
	.word	0xe43e3ff0	! t0_kref+0x1818:   	std	%l2, [%i0 - 0x10]
	.word	0x37480002	! t0_kref+0x181c:   	fbge,a,pt	%fcc0, _kref+0x1824
	.word	0x95a000ab	! t0_kref+0x1820:   	fnegs	%f11, %f10
	.word	0x96a82681	! t0_kref+0x1824:   	andncc	%g0, 0x681, %o3
	.word	0x95b00fc0	! t0_kref+0x1828:   	fone	%f10
	.word	0x97b2cf6b	! t0_kref+0x182c:   	fornot1s	%f11, %f11, %f11
	.word	0x9736a01d	! t0_kref+0x1830:   	srl	%i2, 0x1d, %o3
	.word	0xd6de3fe8	! t0_kref+0x1834:   	ldxa	[%i0 - 0x18]%asi, %o3
	.word	0x95b00c20	! t0_kref+0x1838:   	fzeros	%f10
	.word	0x97b0015a	! t0_kref+0x183c:   	edge32l	%g0, %i2, %o3
	.word	0x9726a13a	! t0_kref+0x1840:   	mulscc	%i2, 0x13a, %o3
	.word	0x97a01a4a	! t0_kref+0x1844:   	fdtoi	%f10, %f11
	.word	0x97400000	! t0_kref+0x1848:   	mov	%y, %o3
	.word	0xe41e2010	! t0_kref+0x184c:   	ldd	[%i0 + 0x10], %l2
	.word	0x83414000	! t0_kref+0x1850:   	mov	%pc, %g1
	.word	0x96180000	! t0_kref+0x1854:   	xor	%g0, %g0, %o3
	.word	0x95a0054a	! t0_kref+0x1858:   	fsqrtd	%f10, %f10
	.word	0x961e8000	! t0_kref+0x185c:   	xor	%i2, %g0, %o3
	.word	0x95a000aa	! t0_kref+0x1860:   	fnegs	%f10, %f10
	.word	0x96800000	! t0_kref+0x1864:   	addcc	%g0, %g0, %o3
	.word	0x81868000	! t0_kref+0x1868:   	wr	%i2, %g0, %y
	.word	0x968035ab	! t0_kref+0x186c:   	addcc	%g0, -0xa55, %o3
	.word	0x97b0035a	! t0_kref+0x1870:   	alignaddrl	%g0, %i2, %o3
	.word	0x9726801a	! t0_kref+0x1874:   	mulscc	%i2, %i2, %o3
	.word	0x97400000	! t0_kref+0x1878:   	mov	%y, %o3
	.word	0x96300000	! t0_kref+0x187c:   	orn	%g0, %g0, %o3
	.word	0x95a0192b	! t0_kref+0x1880:   	fstod	%f11, %f10
	.word	0x97a01a2a	! t0_kref+0x1884:   	fstoi	%f10, %f11
	.word	0x97a0012a	! t0_kref+0x1888:   	fabss	%f10, %f11
	.word	0x95a0192b	! t0_kref+0x188c:   	fstod	%f11, %f10
	.word	0xf4f65000	! t0_kref+0x1890:   	stxa	%i2, [%i1]0x80
	.word	0x96d6aac8	! t0_kref+0x1894:   	umulcc	%i2, 0xac8, %o3
	.word	0x9720001a	! t0_kref+0x1898:   	mulscc	%g0, %i2, %o3
	.word	0x95b2c62a	! t0_kref+0x189c:   	fmul8x16	%f11, %f10, %f10
	.word	0x27800001	! t0_kref+0x18a0:   	fbul,a	_kref+0x18a4
	.word	0x9686b25a	! t0_kref+0x18a4:   	addcc	%i2, -0xda6, %o3
	.word	0x97183c77	! t0_kref+0x18a8:   	tsubcctv	%g0, -0x389, %o3
	.word	0x9608001a	! t0_kref+0x18ac:   	and	%g0, %i2, %o3
	.word	0x9fc10000	! t0_kref+0x18b0:   	call	%g4
	.word	0x97a0012a	! t0_kref+0x18b4:   	fabss	%f10, %f11
	.word	0x31480006	! t0_kref+0x18b8:   	fba,a,pt	%fcc0, _kref+0x18d0
	.word	0xd690a006	! t0_kref+0x18bc:   	lduha	[%g2 + 6]%asi, %o3
	.word	0xe03e0000	! t0_kref+0x18c0:   	std	%l0, [%i0]
	.word	0xf4f67ff8	! t0_kref+0x18c4:   	stxa	%i2, [%i1 - 8]%asi
	.word	0x97a0002b	! t0_kref+0x18c8:   	fmovs	%f11, %f11
	.word	0x96b8336b	! t0_kref+0x18cc:   	xnorcc	%g0, -0xc95, %o3
	.word	0x97b6817a	! t0_kref+0x18d0:   	edge32ln	%i2, %i2, %o3
	.word	0xd51e2010	! t0_kref+0x18d4:   	ldd	[%i0 + 0x10], %f10
	.word	0xe43e0000	! t0_kref+0x18d8:   	std	%l2, [%i0]
	.word	0x95b2c62a	! t0_kref+0x18dc:   	fmul8x16	%f11, %f10, %f10
	.word	0x97a2c9ab	! t0_kref+0x18e0:   	fdivs	%f11, %f11, %f11
	.word	0xec7e3ffc	! t0_kref+0x18e4:   	swap	[%i0 - 4], %l6
	.word	0x8143c000	! t0_kref+0x18e8:   	stbar
	.word	0x96603501	! t0_kref+0x18ec:   	subc	%g0, -0xaff, %o3
	.word	0x95b28dca	! t0_kref+0x18f0:   	fnand	%f10, %f10, %f10
	.word	0x97b28caa	! t0_kref+0x18f4:   	fandnot2s	%f10, %f10, %f11
	.word	0xd6062000	! t0_kref+0x18f8:   	ld	[%i0], %o3
	.word	0x96503761	! t0_kref+0x18fc:   	umul	%g0, -0x89f, %o3
	.word	0xfb6e7fe0	! t0_kref+0x1900:   	prefetch	%i1 - 0x20, 29
	.word	0x95a0102a	! t0_kref+0x1904:   	fstox	%f10, %f10
	.word	0x97400000	! t0_kref+0x1908:   	mov	%y, %o3
	.word	0x81aaca2b	! t0_kref+0x190c:   	fcmps	%fcc0, %f11, %f11
	.word	0xd65e6000	! t0_kref+0x1910:   	ldx	[%i1], %o3
	.word	0x2d800004	! t0_kref+0x1914:   	fbg,a	_kref+0x1924
	.word	0xb4103ffd	! t0_kref+0x1918:   	mov	0xfffffffd, %i2
	.word	0x9678001a	! t0_kref+0x191c:   	sdiv	%g0, %i2, %o3
	.word	0x962e801a	! t0_kref+0x1920:   	andn	%i2, %i2, %o3
	.word	0x95a2894a	! t0_kref+0x1924:   	fmuld	%f10, %f10, %f10
	.word	0xd7270019	! t0_kref+0x1928:   	st	%f11, [%i4 + %i1]
	.word	0x96c0001a	! t0_kref+0x192c:   	addccc	%g0, %i2, %o3
	.word	0xf436c018	! t0_kref+0x1930:   	sth	%i2, [%i3 + %i0]
	.word	0x97a0012a	! t0_kref+0x1934:   	fabss	%f10, %f11
	.word	0x17010ecd	! t0_kref+0x1938:   	sethi	%hi(0x43b3400), %o3
	.word	0x95a0104a	! t0_kref+0x193c:   	fdtox	%f10, %f10
	.word	0x172474c3	! t0_kref+0x1940:   	sethi	%hi(0x91d30c00), %o3
	.word	0xd646401c	! t0_kref+0x1944:   	ldsw	[%i1 + %i4], %o3
	.word	0x97b284ca	! t0_kref+0x1948:   	fcmpne32	%f10, %f10, %o3
	.word	0x9616a646	! t0_kref+0x194c:   	or	%i2, 0x646, %o3
	.word	0x95a01a2b	! t0_kref+0x1950:   	fstoi	%f11, %f10
	.word	0x963eb41a	! t0_kref+0x1954:   	xnor	%i2, -0xbe6, %o3
	.word	0x97a0188b	! t0_kref+0x1958:   	fitos	%f11, %f11
	.word	0x95a0012b	! t0_kref+0x195c:   	fabss	%f11, %f10
	.word	0x961835ea	! t0_kref+0x1960:   	xor	%g0, -0xa16, %o3
	.word	0x97b284ca	! t0_kref+0x1964:   	fcmpne32	%f10, %f10, %o3
	.word	0x97400000	! t0_kref+0x1968:   	mov	%y, %o3
	.word	0x9740c000	! t0_kref+0x196c:   	mov	%asi, %o3
	.word	0x96a6a832	! t0_kref+0x1970:   	subcc	%i2, 0x832, %o3
	.word	0x97b2850a	! t0_kref+0x1974:   	fcmpgt16	%f10, %f10, %o3
	.word	0x8143c000	! t0_kref+0x1978:   	stbar
	.word	0xd6563ff8	! t0_kref+0x197c:   	ldsh	[%i0 - 8], %o3
	.word	0x96e6801a	! t0_kref+0x1980:   	subccc	%i2, %i2, %o3
	.word	0x96bea6ec	! t0_kref+0x1984:   	xnorcc	%i2, 0x6ec, %o3
	.word	0xd5262000	! t0_kref+0x1988:   	st	%f10, [%i0]
	.word	0x97a0002a	! t0_kref+0x198c:   	fmovs	%f10, %f11
	.word	0xd640a030	! t0_kref+0x1990:   	ldsw	[%g2 + 0x30], %o3
	.word	0xd51fbe40	! t0_kref+0x1994:   	ldd	[%fp - 0x1c0], %f10
	.word	0x97a0012b	! t0_kref+0x1998:   	fabss	%f11, %f11
	.word	0xd64e4000	! t0_kref+0x199c:   	ldsb	[%i1], %o3
	.word	0x95b2cea0	! t0_kref+0x19a0:   	fsrc1s	%f11, %f10
	.word	0x97382011	! t0_kref+0x19a4:   	sra	%g0, 0x11, %o3
	.word	0x9676801a	! t0_kref+0x19a8:   	udiv	%i2, %i2, %o3
	.word	0x33480003	! t0_kref+0x19ac:   	fbe,a,pt	%fcc0, _kref+0x19b8
	.word	0x97b00160	! t0_kref+0x19b0:   	edge32ln	%g0, %g0, %o3
	.word	0x95b28f8a	! t0_kref+0x19b4:   	for	%f10, %f10, %f10
	.word	0x95b00cca	! t0_kref+0x19b8:   	fnot2	%f10, %f10
	.word	0x95a0110a	! t0_kref+0x19bc:   	fxtod	%f10, %f10
	.word	0x96900000	! t0_kref+0x19c0:   	orcc	%g0, %g0, %o3
	.word	0xea6e7fe4	! t0_kref+0x19c4:   	ldstub	[%i1 - 0x1c], %l5
	.word	0x95b28e80	! t0_kref+0x19c8:   	fsrc1	%f10, %f10
	.word	0x97b2cd2a	! t0_kref+0x19cc:   	fandnot1s	%f11, %f10, %f11
	.word	0xec7e7ff4	! t0_kref+0x19d0:   	swap	[%i1 - 0xc], %l6
	.word	0xf436201c	! t0_kref+0x19d4:   	sth	%i2, [%i0 + 0x1c]
	.word	0xd648a035	! t0_kref+0x19d8:   	ldsb	[%g2 + 0x35], %o3
	.word	0x95b00ceb	! t0_kref+0x19dc:   	fnot2s	%f11, %f10
	.word	0x97a000aa	! t0_kref+0x19e0:   	fnegs	%f10, %f11
	.word	0x972e801a	! t0_kref+0x19e4:   	sll	%i2, %i2, %o3
	.word	0xd656201a	! t0_kref+0x19e8:   	ldsh	[%i0 + 0x1a], %o3
	.word	0xe4180019	! t0_kref+0x19ec:   	ldd	[%g0 + %i1], %l2
	call	SYM(t0_subr3)
	.word	0xc768a083	! t0_kref+0x19f4:   	prefetch	%g2 + 0x83, 3
	.word	0xd60e2013	! t0_kref+0x19f8:   	ldub	[%i0 + 0x13], %o3
	.word	0x95b28d0a	! t0_kref+0x19fc:   	fandnot1	%f10, %f10, %f10
	.word	0xef68a080	! t0_kref+0x1a00:   	prefetch	%g2 + 0x80, 23
	.word	0x95a0014a	! t0_kref+0x1a04:   	fabsd	%f10, %f10
	.word	0xd59f5059	! t0_kref+0x1a08:   	ldda	[%i5 + %i1]0x82, %f10
	.word	0x39800008	! t0_kref+0x1a0c:   	fbuge,a	_kref+0x1a2c
	.word	0x95a2c9ab	! t0_kref+0x1a10:   	fdivs	%f11, %f11, %f10
	.word	0xd616c018	! t0_kref+0x1a14:   	lduh	[%i3 + %i0], %o3
	.word	0xd6567ff8	! t0_kref+0x1a18:   	ldsh	[%i1 - 8], %o3
	.word	0x96900000	! t0_kref+0x1a1c:   	orcc	%g0, %g0, %o3
	.word	0x97a0012b	! t0_kref+0x1a20:   	fabss	%f11, %f11
	.word	0x961ead7d	! t0_kref+0x1a24:   	xor	%i2, 0xd7d, %o3
	.word	0x97a018ca	! t0_kref+0x1a28:   	fdtos	%f10, %f11
	.word	0x95a0012b	! t0_kref+0x1a2c:   	fabss	%f11, %f10
	.word	0x95ab804a	! t0_kref+0x1a30:   	fmovdule	%fcc0, %f10, %f10
	.word	0x95a0012a	! t0_kref+0x1a34:   	fabss	%f10, %f10
	.word	0x95a0192a	! t0_kref+0x1a38:   	fstod	%f10, %f10
	.word	0x97a2882b	! t0_kref+0x1a3c:   	fadds	%f10, %f11, %f11
	.word	0xd19e1a5b	! t0_kref+0x1a40:   	ldda	[%i0 + %i3]0xd2, %f8
	.word	0x97200000	! t0_kref+0x1a44:   	mulscc	%g0, %g0, %o3
	.word	0x97b2cf6b	! t0_kref+0x1a48:   	fornot1s	%f11, %f11, %f11
	.word	0x97b00c20	! t0_kref+0x1a4c:   	fzeros	%f11
	.word	0x9fc10000	! t0_kref+0x1a50:   	call	%g4
	.word	0xe968a04b	! t0_kref+0x1a54:   	prefetch	%g2 + 0x4b, 20
	.word	0x95a0012a	! t0_kref+0x1a58:   	fabss	%f10, %f10
	.word	0x95a2894a	! t0_kref+0x1a5c:   	fmuld	%f10, %f10, %f10
	.word	0xd51e2018	! t0_kref+0x1a60:   	ldd	[%i0 + 0x18], %f10
	.word	0x95a0192a	! t0_kref+0x1a64:   	fstod	%f10, %f10
	.word	0xc06e2014	! t0_kref+0x1a68:   	ldstub	[%i0 + 0x14], %g0
	.word	0x97302017	! t0_kref+0x1a6c:   	srl	%g0, 0x17, %o3
	.word	0xd6801018	! t0_kref+0x1a70:   	lda	[%g0 + %i0]0x80, %o3
	.word	0x95b2cd2b	! t0_kref+0x1a74:   	fandnot1s	%f11, %f11, %f10
	.word	0xd64e3fec	! t0_kref+0x1a78:   	ldsb	[%i0 - 0x14], %o3
	.word	0xd6881019	! t0_kref+0x1a7c:   	lduba	[%g0 + %i1]0x80, %o3
	.word	0x97b0035a	! t0_kref+0x1a80:   	alignaddrl	%g0, %i2, %o3
	.word	0x9676a51b	! t0_kref+0x1a84:   	udiv	%i2, 0x51b, %o3
	.word	0x96500000	! t0_kref+0x1a88:   	umul	%g0, %g0, %o3
	.word	0xea7e7fe4	! t0_kref+0x1a8c:   	swap	[%i1 - 0x1c], %l5
	.word	0xd6866014	! t0_kref+0x1a90:   	lda	[%i1 + 0x14]%asi, %o3
	.word	0x2b800004	! t0_kref+0x1a94:   	fbug,a	_kref+0x1aa4
	.word	0x96503d71	! t0_kref+0x1a98:   	umul	%g0, -0x28f, %o3
	.word	0x97a2c92b	! t0_kref+0x1a9c:   	fmuls	%f11, %f11, %f11
	.word	0x9610001a	! t0_kref+0x1aa0:   	mov	%i2, %o3
	.word	0x95a2c9aa	! t0_kref+0x1aa4:   	fdivs	%f11, %f10, %f10
	.word	0x95a2894a	! t0_kref+0x1aa8:   	fmuld	%f10, %f10, %f10
	.word	0x95a2cd2b	! t0_kref+0x1aac:   	fsmuld	%f11, %f11, %f10
	.word	0x8143c000	! t0_kref+0x1ab0:   	stbar
	.word	0x97a000aa	! t0_kref+0x1ab4:   	fnegs	%f10, %f11
	.word	0x9640001a	! t0_kref+0x1ab8:   	addc	%g0, %i2, %o3
	.word	0x83414000	! t0_kref+0x1abc:   	mov	%pc, %g1
	.word	0x95a2894a	! t0_kref+0x1ac0:   	fmuld	%f10, %f10, %f10
	.word	0x81aa8aca	! t0_kref+0x1ac4:   	fcmped	%fcc0, %f10, %f10
	.word	0xf4b65000	! t0_kref+0x1ac8:   	stha	%i2, [%i1]0x80
	.word	0xf436001b	! t0_kref+0x1acc:   	sth	%i2, [%i0 + %i3]
	.word	0xd616c018	! t0_kref+0x1ad0:   	lduh	[%i3 + %i0], %o3
	.word	0xd6967fe8	! t0_kref+0x1ad4:   	lduha	[%i1 - 0x18]%asi, %o3
	.word	0xc036401b	! t0_kref+0x1ad8:   	clrh	[%i1 + %i3]
	.word	0x29800006	! t0_kref+0x1adc:   	fbl,a	_kref+0x1af4
	.word	0x95b28e4a	! t0_kref+0x1ae0:   	fxnor	%f10, %f10, %f10
	.word	0x96700000	! t0_kref+0x1ae4:   	udiv	%g0, %g0, %o3
	.word	0xd53e3fe8	! t0_kref+0x1ae8:   	std	%f10, [%i0 - 0x18]
	.word	0x81aacaab	! t0_kref+0x1aec:   	fcmpes	%fcc0, %f11, %f11
	.word	0x95b00fc0	! t0_kref+0x1af0:   	fone	%f10
	.word	0x96f68000	! t0_kref+0x1af4:   	udivcc	%i2, %g0, %o3
	.word	0x97400000	! t0_kref+0x1af8:   	mov	%y, %o3
	.word	0xe41e7ff0	! t0_kref+0x1afc:   	ldd	[%i1 - 0x10], %l2
	.word	0x83c06058	! t0_kref+0x1b00:   	jmpl	%g1 + 0x58, %g1
	.word	0xd6ce1000	! t0_kref+0x1b04:   	ldsba	[%i0]0x80, %o3
	.word	0xd1be5a1c	! t0_kref+0x1b08:   	stda	%f8, [%i1 + %i4]0xd0
	.word	0x95b28d40	! t0_kref+0x1b0c:   	fnot1	%f10, %f10
	.word	0x97a01a4a	! t0_kref+0x1b10:   	fdtoi	%f10, %f11
	.word	0xd6c8105a	! t0_kref+0x1b14:   	ldsba	[%g0 + %i2]0x82, %o3
	.word	0x95a2884a	! t0_kref+0x1b18:   	faddd	%f10, %f10, %f10
	.word	0xd5bf5019	! t0_kref+0x1b1c:   	stda	%f10, [%i5 + %i1]0x80
	.word	0x9730001a	! t0_kref+0x1b20:   	srl	%g0, %i2, %o3
	.word	0x9726801a	! t0_kref+0x1b24:   	mulscc	%i2, %i2, %o3
	.word	0x81aacaab	! t0_kref+0x1b28:   	fcmpes	%fcc0, %f11, %f11
	.word	0x83414000	! t0_kref+0x1b2c:   	mov	%pc, %g1
	.word	0x23800001	! t0_kref+0x1b30:   	fbne,a	_kref+0x1b34
	.word	0x97400000	! t0_kref+0x1b34:   	mov	%y, %o3
	.word	0x95a2cd2b	! t0_kref+0x1b38:   	fsmuld	%f11, %f11, %f10
	.word	0x97b00240	! t0_kref+0x1b3c:   	array16	%g0, %g0, %o3
	.word	0x9630001a	! t0_kref+0x1b40:   	orn	%g0, %i2, %o3
	.word	0x965831e8	! t0_kref+0x1b44:   	smul	%g0, -0xe18, %o3
	.word	0x95a2884a	! t0_kref+0x1b48:   	faddd	%f10, %f10, %f10
	.word	0x96f03611	! t0_kref+0x1b4c:   	udivcc	%g0, -0x9ef, %o3
	.word	0x95a2884a	! t0_kref+0x1b50:   	faddd	%f10, %f10, %f10
	.word	0x97b0013a	! t0_kref+0x1b54:   	edge32n	%g0, %i2, %o3
	.word	0x97400000	! t0_kref+0x1b58:   	mov	%y, %o3
	.word	0x95a2cd2a	! t0_kref+0x1b5c:   	fsmuld	%f11, %f10, %f10
	.word	0x95b28a4a	! t0_kref+0x1b60:   	fpadd32	%f10, %f10, %f10
	.word	0x972e8000	! t0_kref+0x1b64:   	sll	%i2, %g0, %o3
	.word	0x97a2c9aa	! t0_kref+0x1b68:   	fdivs	%f11, %f10, %f11
	.word	0x2b480004	! t0_kref+0x1b6c:   	fbug,a,pt	%fcc0, _kref+0x1b7c
	.word	0x96e02f9d	! t0_kref+0x1b70:   	subccc	%g0, 0xf9d, %o3
	.word	0x95a0014a	! t0_kref+0x1b74:   	fabsd	%f10, %f10
	.word	0x972ea01a	! t0_kref+0x1b78:   	sll	%i2, 0x1a, %o3
	.word	0x95a2894a	! t0_kref+0x1b7c:   	fmuld	%f10, %f10, %f10
	.word	0x95a0192a	! t0_kref+0x1b80:   	fstod	%f10, %f10
	.word	0x97a0052b	! t0_kref+0x1b84:   	fsqrts	%f11, %f11
	.word	0x96be8000	! t0_kref+0x1b88:   	xnorcc	%i2, %g0, %o3
	.word	0xd64e8019	! t0_kref+0x1b8c:   	ldsb	[%i2 + %i1], %o3
	.word	0x9656801a	! t0_kref+0x1b90:   	umul	%i2, %i2, %o3
	.word	0x96b8001a	! t0_kref+0x1b94:   	xnorcc	%g0, %i2, %o3
	.word	0xe01e2008	! t0_kref+0x1b98:   	ldd	[%i0 + 8], %l0
	.word	0x95a0054a	! t0_kref+0x1b9c:   	fsqrtd	%f10, %f10
	.word	0x26480008	! t0_kref+0x1ba0:   	bl,a,pt	%icc, _kref+0x1bc0
	.word	0x97b0035a	! t0_kref+0x1ba4:   	alignaddrl	%g0, %i2, %o3
	.word	0x9686bf46	! t0_kref+0x1ba8:   	addcc	%i2, -0xba, %o3
	.word	0xd6066004	! t0_kref+0x1bac:   	ld	[%i1 + 4], %o3
	.word	0xd6063ffc	! t0_kref+0x1bb0:   	ld	[%i0 - 4], %o3
	.word	0x9696bf01	! t0_kref+0x1bb4:   	orcc	%i2, -0xff, %o3
	.word	0x97b6831a	! t0_kref+0x1bb8:   	alignaddr	%i2, %i2, %o3
	.word	0xc0b0a034	! t0_kref+0x1bbc:   	stha	%g0, [%g2 + 0x34]%asi
	.word	0x95a2cd2b	! t0_kref+0x1bc0:   	fsmuld	%f11, %f11, %f10
	.word	0x95a2884a	! t0_kref+0x1bc4:   	faddd	%f10, %f10, %f10
	.word	0x96083d9c	! t0_kref+0x1bc8:   	and	%g0, -0x264, %o3
	.word	0x95b28d0a	! t0_kref+0x1bcc:   	fandnot1	%f10, %f10, %f10
	.word	0x97b680ba	! t0_kref+0x1bd0:   	edge16n	%i2, %i2, %o3
	.word	0x96168000	! t0_kref+0x1bd4:   	or	%i2, %g0, %o3
	.word	0x95b00f0a	! t0_kref+0x1bd8:   	fsrc2	%f10, %f10
	.word	0x81580000	! t0_kref+0x1bdc:   	flushw
	.word	0xd51fbf30	! t0_kref+0x1be0:   	ldd	[%fp - 0xd0], %f10
	.word	0xd1be1800	! t0_kref+0x1be4:   	stda	%f8, [%i0]0xc0
	.word	0x96900000	! t0_kref+0x1be8:   	orcc	%g0, %g0, %o3
	.word	0x95b286ea	! t0_kref+0x1bec:   	fmul8ulx16	%f10, %f10, %f10
	.word	0x9658001a	! t0_kref+0x1bf0:   	smul	%g0, %i2, %o3
	.word	0xd60e2007	! t0_kref+0x1bf4:   	ldub	[%i0 + 7], %o3
	.word	0x97b2854a	! t0_kref+0x1bf8:   	fcmpeq16	%f10, %f10, %o3
	.word	0x86102001	! t0_kref+0x1bfc:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x1c00:   	bne,a	_kref+0x1c00
	.word	0x86a0e001	! t0_kref+0x1c04:   	subcc	%g3, 1, %g3
	.word	0x96aeb647	! t0_kref+0x1c08:   	andncc	%i2, -0x9b9, %o3
	.word	0xd656c019	! t0_kref+0x1c0c:   	ldsh	[%i3 + %i1], %o3
	.word	0x95a01a4a	! t0_kref+0x1c10:   	fdtoi	%f10, %f10
	.word	0x95a289ab	! t0_kref+0x1c14:   	fdivs	%f10, %f11, %f10
	.word	0xd51fbf40	! t0_kref+0x1c18:   	ldd	[%fp - 0xc0], %f10
	.word	0x97400000	! t0_kref+0x1c1c:   	mov	%y, %o3
	.word	0x9762401a	! t0_kref+0x1c20:   	move	%fcc0, %i2, %o3
	.word	0x95a2cd2b	! t0_kref+0x1c24:   	fsmuld	%f11, %f11, %f10
	.word	0xd2fe3fe8	! t0_kref+0x1c28:   	swapa	[%i0 - 0x18]%asi, %o1
	.word	0x95b28e4a	! t0_kref+0x1c2c:   	fxnor	%f10, %f10, %f10
	.word	0x95a0188b	! t0_kref+0x1c30:   	fitos	%f11, %f10
	.word	0x9696801a	! t0_kref+0x1c34:   	orcc	%i2, %i2, %o3
	.word	0xd6871018	! t0_kref+0x1c38:   	lda	[%i4 + %i0]0x80, %o3
	.word	0xd5a67ff0	! t0_kref+0x1c3c:   	sta	%f10, [%i1 - 0x10]%asi
	.word	0x97b00c20	! t0_kref+0x1c40:   	fzeros	%f11
	.word	0xe0180019	! t0_kref+0x1c44:   	ldd	[%g0 + %i1], %l0
	.word	0x8610201a	! t0_kref+0x1c48:   	mov	0x1a, %g3
	.word	0x86a0e001	! t0_kref+0x1c4c:   	subcc	%g3, 1, %g3
	.word	0x22800019	! t0_kref+0x1c50:   	be,a	_kref+0x1cb4
	.word	0x95a01a2b	! t0_kref+0x1c54:   	fstoi	%f11, %f10
	.word	0x95a0014a	! t0_kref+0x1c58:   	fabsd	%f10, %f10
	.word	0x96768000	! t0_kref+0x1c5c:   	udiv	%i2, %g0, %o3
	.word	0x95a289aa	! t0_kref+0x1c60:   	fdivs	%f10, %f10, %f10
	.word	0x2ebffffa	! t0_kref+0x1c64:   	bvs,a	_kref+0x1c4c
	.word	0xd60e600e	! t0_kref+0x1c68:   	ldub	[%i1 + 0xe], %o3
	.word	0xe09e7ff0	! t0_kref+0x1c6c:   	ldda	[%i1 - 0x10]%asi, %l0
	.word	0x81dcc00c	! t0_kref+0x1c70:   	flush	%l3 + %o4
	.word	0xd1be589a	! t0_kref+0x1c74:   	stda	%f8, [%i1 + %i2]0xc4
	.word	0x9616801a	! t0_kref+0x1c78:   	or	%i2, %i2, %o3
	.word	0x95a0188a	! t0_kref+0x1c7c:   	fitos	%f10, %f10
	.word	0x95a288ca	! t0_kref+0x1c80:   	fsubd	%f10, %f10, %f10
	.word	0xc807bfe8	! t0_kref+0x1c84:   	ld	[%fp - 0x18], %g4
	.word	0x97a2c82a	! t0_kref+0x1c88:   	fadds	%f11, %f10, %f11
	.word	0xd51e7fe0	! t0_kref+0x1c8c:   	ldd	[%i1 - 0x20], %f10
	.word	0x97a000ab	! t0_kref+0x1c90:   	fnegs	%f11, %f11
	.word	0x96300000	! t0_kref+0x1c94:   	orn	%g0, %g0, %o3
	.word	0xe41e2010	! t0_kref+0x1c98:   	ldd	[%i0 + 0x10], %l2
	.word	0x2fbfffec	! t0_kref+0x1c9c:   	fbu,a	_kref+0x1c4c
	.word	0x95b2890a	! t0_kref+0x1ca0:   	faligndata	%f10, %f10, %f10
	.word	0x81aa8a2b	! t0_kref+0x1ca4:   	fcmps	%fcc0, %f10, %f11
	.word	0x97b0031a	! t0_kref+0x1ca8:   	alignaddr	%g0, %i2, %o3
	.word	0x95a2884a	! t0_kref+0x1cac:   	faddd	%f10, %f10, %f10
	.word	0x95b28d2b	! t0_kref+0x1cb0:   	fandnot1s	%f10, %f11, %f10
	.word	0x96f020b3	! t0_kref+0x1cb4:   	udivcc	%g0, 0xb3, %o3
	.word	0xd51e001d	! t0_kref+0x1cb8:   	ldd	[%i0 + %i5], %f10
	.word	0x962eaa48	! t0_kref+0x1cbc:   	andn	%i2, 0xa48, %o3
	.word	0x96fe8000	! t0_kref+0x1cc0:   	sdivcc	%i2, %g0, %o3
	.word	0x97a0052a	! t0_kref+0x1cc4:   	fsqrts	%f10, %f11
	.word	0x95b28a4a	! t0_kref+0x1cc8:   	fpadd32	%f10, %f10, %f10
	.word	0x97400000	! t0_kref+0x1ccc:   	mov	%y, %o3
	.word	0x95a288ca	! t0_kref+0x1cd0:   	fsubd	%f10, %f10, %f10
	.word	0xd6467fe4	! t0_kref+0x1cd4:   	ldsw	[%i1 - 0x1c], %o3
	.word	0xd66e8019	! t0_kref+0x1cd8:   	ldstub	[%i2 + %i1], %o3
	.word	0xd656200c	! t0_kref+0x1cdc:   	ldsh	[%i0 + 0xc], %o3
	.word	0x95a0192b	! t0_kref+0x1ce0:   	fstod	%f11, %f10
	.word	0x960ea9c3	! t0_kref+0x1ce4:   	and	%i2, 0x9c3, %o3
	.word	0x21800005	! t0_kref+0x1ce8:   	fbn,a	_kref+0x1cfc
	.word	0x97a0188a	! t0_kref+0x1cec:   	fitos	%f10, %f11
	.word	0x97a2c9aa	! t0_kref+0x1cf0:   	fdivs	%f11, %f10, %f11
	.word	0x95b00cca	! t0_kref+0x1cf4:   	fnot2	%f10, %f10
	.word	0xd656001b	! t0_kref+0x1cf8:   	ldsh	[%i0 + %i3], %o3
	.word	0x3e480008	! t0_kref+0x1cfc:   	bvc,a,pt	%icc, _kref+0x1d1c
	.word	0x8143c000	! t0_kref+0x1d00:   	stbar
	.word	0x97a000aa	! t0_kref+0x1d04:   	fnegs	%f10, %f11
	.word	0xd6070019	! t0_kref+0x1d08:   	ld	[%i4 + %i1], %o3
	.word	0x9656801a	! t0_kref+0x1d0c:   	umul	%i2, %i2, %o3
	.word	0xd6067ff8	! t0_kref+0x1d10:   	ld	[%i1 - 8], %o3
	.word	0x97a018ca	! t0_kref+0x1d14:   	fdtos	%f10, %f11
	.word	0x96568000	! t0_kref+0x1d18:   	umul	%i2, %g0, %o3
	.word	0xc0ae5000	! t0_kref+0x1d1c:   	stba	%g0, [%i1]0x80
	.word	0xd5a62010	! t0_kref+0x1d20:   	sta	%f10, [%i0 + 0x10]%asi
	.word	0xd65f4018	! t0_kref+0x1d24:   	ldx	[%i5 + %i0], %o3
	.word	0x81aa8aaa	! t0_kref+0x1d28:   	fcmpes	%fcc0, %f10, %f10
	.word	0x8143c000	! t0_kref+0x1d2c:   	stbar
	.word	0x95a2894a	! t0_kref+0x1d30:   	fmuld	%f10, %f10, %f10
	.word	0x95b00f0a	! t0_kref+0x1d34:   	fsrc2	%f10, %f10
	.word	0xd51e401d	! t0_kref+0x1d38:   	ldd	[%i1 + %i5], %f10
	.word	0x27480005	! t0_kref+0x1d3c:   	fbul,a,pt	%fcc0, _kref+0x1d50
	.word	0x95a28d2b	! t0_kref+0x1d40:   	fsmuld	%f10, %f11, %f10
	.word	0x95b28e0a	! t0_kref+0x1d44:   	fand	%f10, %f10, %f10
	.word	0x96503eb3	! t0_kref+0x1d48:   	umul	%g0, -0x14d, %o3
	.word	0xd46e8018	! t0_kref+0x1d4c:   	ldstub	[%i2 + %i0], %o2
	.word	0x95a0192b	! t0_kref+0x1d50:   	fstod	%f11, %f10
	.word	0x95b2898a	! t0_kref+0x1d54:   	bshuffle	%f10, %f10, %f10
	.word	0x95b2cdab	! t0_kref+0x1d58:   	fxors	%f11, %f11, %f10
	.word	0x9fc10000	! t0_kref+0x1d5c:   	call	%g4
	.word	0x96f6801a	! t0_kref+0x1d60:   	udivcc	%i2, %i2, %o3
	.word	0x96e6b082	! t0_kref+0x1d64:   	subccc	%i2, -0xf7e, %o3
	.word	0x96180000	! t0_kref+0x1d68:   	xor	%g0, %g0, %o3
	.word	0x95a0192a	! t0_kref+0x1d6c:   	fstod	%f10, %f10
	.word	0x96d6a1d1	! t0_kref+0x1d70:   	umulcc	%i2, 0x1d1, %o3
	.word	0x81aacaab	! t0_kref+0x1d74:   	fcmpes	%fcc0, %f11, %f11
	.word	0x96f80000	! t0_kref+0x1d78:   	sdivcc	%g0, %g0, %o3
	.word	0xc807bff0	! t0_kref+0x1d7c:   	ld	[%fp - 0x10], %g4
	.word	0x96a03501	! t0_kref+0x1d80:   	subcc	%g0, -0xaff, %o3
	.word	0xe0981018	! t0_kref+0x1d84:   	ldda	[%g0 + %i0]0x80, %l0
	.word	0x96de8000	! t0_kref+0x1d88:   	smulcc	%i2, %g0, %o3
	.word	0x965833e2	! t0_kref+0x1d8c:   	smul	%g0, -0xc1e, %o3
	.word	0x97a000aa	! t0_kref+0x1d90:   	fnegs	%f10, %f11
	.word	0x97a0052a	! t0_kref+0x1d94:   	fsqrts	%f10, %f11
	.word	0x95b28a8a	! t0_kref+0x1d98:   	fpsub16	%f10, %f10, %f10
	.word	0xd65e6008	! t0_kref+0x1d9c:   	ldx	[%i1 + 8], %o3
	.word	0x963e801a	! t0_kref+0x1da0:   	xnor	%i2, %i2, %o3
	.word	0x96b8001a	! t0_kref+0x1da4:   	xnorcc	%g0, %i2, %o3
	.word	0x95b28d40	! t0_kref+0x1da8:   	fnot1	%f10, %f10
	.word	0x962e8000	! t0_kref+0x1dac:   	andn	%i2, %g0, %o3
	.word	0x9728001a	! t0_kref+0x1db0:   	sll	%g0, %i2, %o3
	.word	0x9696801a	! t0_kref+0x1db4:   	orcc	%i2, %i2, %o3
	.word	0x81d8401d	! t0_kref+0x1db8:   	flush	%g1 + %i5
	.word	0x97b2848a	! t0_kref+0x1dbc:   	fcmple32	%f10, %f10, %o3
	.word	0x17022ad8	! t0_kref+0x1dc0:   	sethi	%hi(0x8ab6000), %o3
	.word	0x95b28d40	! t0_kref+0x1dc4:   	fnot1	%f10, %f10
	.word	0x9608394f	! t0_kref+0x1dc8:   	and	%g0, -0x6b1, %o3
	.word	0x81580000	! t0_kref+0x1dcc:   	flushw
	.word	0x95a0054a	! t0_kref+0x1dd0:   	fsqrtd	%f10, %f10
	.word	0x95b2866b	! t0_kref+0x1dd4:   	fmul8x16au	%f10, %f11, %f10
	.word	0x95b28e80	! t0_kref+0x1dd8:   	fsrc1	%f10, %f10
	.word	0xd59e3fe0	! t0_kref+0x1ddc:   	ldda	[%i0 - 0x20]%asi, %f10
	.word	0x81580000	! t0_kref+0x1de0:   	flushw
	.word	0x95a2894a	! t0_kref+0x1de4:   	fmuld	%f10, %f10, %f10
	.word	0x8d868000	! t0_kref+0x1de8:   	wr	%i2, %g0, %fprs
	.word	0x9740c000	! t0_kref+0x1dec:   	mov	%asi, %o3
	.word	0xd616c019	! t0_kref+0x1df0:   	lduh	[%i3 + %i1], %o3
	.word	0xc0762018	! t0_kref+0x1df4:   	stx	%g0, [%i0 + 0x18]
	.word	0x31800003	! t0_kref+0x1df8:   	fba,a	_kref+0x1e04
	.word	0x97a0012a	! t0_kref+0x1dfc:   	fabss	%f10, %f11
	.word	0x97b2ccab	! t0_kref+0x1e00:   	fandnot2s	%f11, %f11, %f11
	.word	0x961820ba	! t0_kref+0x1e04:   	xor	%g0, 0xba, %o3
	.word	0x9fc10000	! t0_kref+0x1e08:   	call	%g4
	.word	0x81dcb179	! t0_kref+0x1e0c:   	flush	%l2 - 0xe87
	.word	0x95a2cd2b	! t0_kref+0x1e10:   	fsmuld	%f11, %f11, %f10
	.word	0xe4981018	! t0_kref+0x1e14:   	ldda	[%g0 + %i0]0x80, %l2
	.word	0x95a2894a	! t0_kref+0x1e18:   	fmuld	%f10, %f10, %f10
	.word	0x97b2ce2b	! t0_kref+0x1e1c:   	fands	%f11, %f11, %f11
	.word	0x97b2854a	! t0_kref+0x1e20:   	fcmpeq16	%f10, %f10, %o3
	.word	0xb610201e	! t0_kref+0x1e24:   	mov	0x1e, %i3
	.word	0x95b28caa	! t0_kref+0x1e28:   	fandnot2s	%f10, %f10, %f10
	.word	0x97a2c9ab	! t0_kref+0x1e2c:   	fdivs	%f11, %f11, %f11
	.word	0x81aaca2a	! t0_kref+0x1e30:   	fcmps	%fcc0, %f11, %f10
	.word	0xd60e7ff4	! t0_kref+0x1e34:   	ldub	[%i1 - 0xc], %o3
	.word	0x97b2840a	! t0_kref+0x1e38:   	fcmple16	%f10, %f10, %o3
	.word	0xd7863fe8	! t0_kref+0x1e3c:   	lda	[%i0 - 0x18]%asi, %f11
	.word	0x95a28d2a	! t0_kref+0x1e40:   	fsmuld	%f10, %f10, %f10
	.word	0x81800000	! t0_kref+0x1e44:   	mov	%g0, %y
	.word	0x9656bc4b	! t0_kref+0x1e48:   	umul	%i2, -0x3b5, %o3
	.word	0x96d6bfde	! t0_kref+0x1e4c:   	umulcc	%i2, -0x22, %o3
	.word	0xd6563fec	! t0_kref+0x1e50:   	ldsh	[%i0 - 0x14], %o3
	.word	0x9730201e	! t0_kref+0x1e54:   	srl	%g0, 0x1e, %o3
	.word	0x95b28d0a	! t0_kref+0x1e58:   	fandnot1	%f10, %f10, %f10
	.word	0x95a01a2b	! t0_kref+0x1e5c:   	fstoi	%f11, %f10
	.word	0x95a01a4a	! t0_kref+0x1e60:   	fdtoi	%f10, %f10
	.word	0x95b28d2b	! t0_kref+0x1e64:   	fandnot1s	%f10, %f11, %f10
	.word	0x21480007	! t0_kref+0x1e68:   	fbn,a,pt	%fcc0, _kref+0x1e84
	.word	0x97300000	! t0_kref+0x1e6c:   	srl	%g0, %g0, %o3
	.word	0xa786ad90	! t0_kref+0x1e70:   	wr	%i2, 0xd90, %gsr
	.word	0x9600001a	! t0_kref+0x1e74:   	add	%g0, %i2, %o3
	.word	0x95a28d2b	! t0_kref+0x1e78:   	fsmuld	%f10, %f11, %f10
	.word	0x95a2c9ab	! t0_kref+0x1e7c:   	fdivs	%f11, %f11, %f10
	.word	0x9676b21f	! t0_kref+0x1e80:   	udiv	%i2, -0xde1, %o3
	.word	0x95a0012a	! t0_kref+0x1e84:   	fabss	%f10, %f10
	.word	0x97380000	! t0_kref+0x1e88:   	sra	%g0, %g0, %o3
	.word	0x972e801a	! t0_kref+0x1e8c:   	sll	%i2, %i2, %o3
	.word	0xebe6501a	! t0_kref+0x1e90:   	casa	[%i1]0x80, %i2, %l5
	.word	0x97a000aa	! t0_kref+0x1e94:   	fnegs	%f10, %f11
	.word	0x96182cf3	! t0_kref+0x1e98:   	xor	%g0, 0xcf3, %o3
	.word	0x8143c000	! t0_kref+0x1e9c:   	stbar
	.word	0x95b00cca	! t0_kref+0x1ea0:   	fnot2	%f10, %f10
	.word	0x97b00f2a	! t0_kref+0x1ea4:   	fsrc2s	%f10, %f11
	.word	0x97400000	! t0_kref+0x1ea8:   	mov	%y, %o3
	.word	0x9fc00004	! t0_kref+0x1eac:   	call	%g0 + %g4
	.word	0x96083ebb	! t0_kref+0x1eb0:   	and	%g0, -0x145, %o3
	.word	0x81aa8aab	! t0_kref+0x1eb4:   	fcmpes	%fcc0, %f10, %f11
	.word	0x95a2894a	! t0_kref+0x1eb8:   	fmuld	%f10, %f10, %f10
	.word	0x96b82263	! t0_kref+0x1ebc:   	xnorcc	%g0, 0x263, %o3
	.word	0x9fc00004	! t0_kref+0x1ec0:   	call	%g0 + %g4
	.word	0x97b2840a	! t0_kref+0x1ec4:   	fcmple16	%f10, %f10, %o3
	.word	0x96882ebc	! t0_kref+0x1ec8:   	andcc	%g0, 0xebc, %o3
	.word	0xe41e0000	! t0_kref+0x1ecc:   	ldd	[%i0], %l2
	.word	0x961833c8	! t0_kref+0x1ed0:   	xor	%g0, -0xc38, %o3
	.word	0x81aacaaa	! t0_kref+0x1ed4:   	fcmpes	%fcc0, %f11, %f10
	.word	0xd51fbec0	! t0_kref+0x1ed8:   	ldd	[%fp - 0x140], %f10
	.word	0xe01e3fe0	! t0_kref+0x1edc:   	ldd	[%i0 - 0x20], %l0
	.word	0x960e801a	! t0_kref+0x1ee0:   	and	%i2, %i2, %o3
	.word	0xe43e2018	! t0_kref+0x1ee4:   	std	%l2, [%i0 + 0x18]
	.word	0xdbe61000	! t0_kref+0x1ee8:   	casa	[%i0]0x80, %g0, %o5
	.word	0x973ea019	! t0_kref+0x1eec:   	sra	%i2, 0x19, %o3
	.word	0xe43e3ff0	! t0_kref+0x1ef0:   	std	%l2, [%i0 - 0x10]
	.word	0xd656001b	! t0_kref+0x1ef4:   	ldsh	[%i0 + %i3], %o3
	.word	0x81da76a6	! t0_kref+0x1ef8:   	flush	%o1 - 0x95a
	.word	0x965eac38	! t0_kref+0x1efc:   	smul	%i2, 0xc38, %o3
	.word	0x9616a305	! t0_kref+0x1f00:   	or	%i2, 0x305, %o3
	.word	0x95a2894a	! t0_kref+0x1f04:   	fmuld	%f10, %f10, %f10
	.word	0x95a000ca	! t0_kref+0x1f08:   	fnegd	%f10, %f10
	.word	0xc0367ffc	! t0_kref+0x1f0c:   	clrh	[%i1 - 4]
	.word	0x968e8000	! t0_kref+0x1f10:   	andcc	%i2, %g0, %o3
	.word	0x95b28caa	! t0_kref+0x1f14:   	fandnot2s	%f10, %f10, %f10
	.word	0x96182bb9	! t0_kref+0x1f18:   	xor	%g0, 0xbb9, %o3
	.word	0x97a289ab	! t0_kref+0x1f1c:   	fdivs	%f10, %f11, %f11
	.word	0x95a2c9aa	! t0_kref+0x1f20:   	fdivs	%f11, %f10, %f10
	.word	0x97182d47	! t0_kref+0x1f24:   	tsubcctv	%g0, 0xd47, %o3
	.word	0xd616c019	! t0_kref+0x1f28:   	lduh	[%i3 + %i1], %o3
	.word	0x97168000	! t0_kref+0x1f2c:   	taddcctv	%i2, %g0, %o3
	.word	0x95a0192a	! t0_kref+0x1f30:   	fstod	%f10, %f10
	.word	0x960e801a	! t0_kref+0x1f34:   	and	%i2, %i2, %o3
	.word	0x96f6b5d0	! t0_kref+0x1f38:   	udivcc	%i2, -0xa30, %o3
	.word	0x95a01a4a	! t0_kref+0x1f3c:   	fdtoi	%f10, %f10
	.word	0x97a0188b	! t0_kref+0x1f40:   	fitos	%f11, %f11
	.word	0x96580000	! t0_kref+0x1f44:   	smul	%g0, %g0, %o3
	.word	0x96968000	! t0_kref+0x1f48:   	orcc	%i2, %g0, %o3
	.word	0xd64e8018	! t0_kref+0x1f4c:   	ldsb	[%i2 + %i0], %o3
	.word	0x95a2c9ab	! t0_kref+0x1f50:   	fdivs	%f11, %f11, %f10
	.word	0xd51e4000	! t0_kref+0x1f54:   	ldd	[%i1], %f10
	.word	0x9736a00c	! t0_kref+0x1f58:   	srl	%i2, 0xc, %o3
	.word	0x95a0054a	! t0_kref+0x1f5c:   	fsqrtd	%f10, %f10
	.word	0x95b28f4a	! t0_kref+0x1f60:   	fornot1	%f10, %f10, %f10
	.word	0x97a0012a	! t0_kref+0x1f64:   	fabss	%f10, %f11
	.word	0x2b800004	! t0_kref+0x1f68:   	fbug,a	_kref+0x1f78
	.word	0xeb270005	! t0_kref+0x1f6c:   	st	%f21, [%i4 + %g5]
	.word	0x972e8000	! t0_kref+0x1f70:   	sll	%i2, %g0, %o3
	.word	0x96580000	! t0_kref+0x1f74:   	smul	%g0, %g0, %o3
	.word	0x960e801a	! t0_kref+0x1f78:   	and	%i2, %i2, %o3
	.word	0xe41e001d	! t0_kref+0x1f7c:   	ldd	[%i0 + %i5], %l2
	.word	0x95a0054a	! t0_kref+0x1f80:   	fsqrtd	%f10, %f10
	.word	0x9618001a	! t0_kref+0x1f84:   	xor	%g0, %i2, %o3
	.word	0xd6100019	! t0_kref+0x1f88:   	lduh	[%g0 + %i1], %o3
	.word	0x95a8004a	! t0_kref+0x1f8c:   	fmovdn	%fcc0, %f10, %f10
	.word	0x34800004	! t0_kref+0x1f90:   	bg,a	_kref+0x1fa0
	.word	0x96f0001a	! t0_kref+0x1f94:   	udivcc	%g0, %i2, %o3
	.word	0x95a0192a	! t0_kref+0x1f98:   	fstod	%f10, %f10
	.word	0x97a0012a	! t0_kref+0x1f9c:   	fabss	%f10, %f11
	.word	0x95a0002a	! t0_kref+0x1fa0:   	fmovs	%f10, %f10
	.word	0xd6160000	! t0_kref+0x1fa4:   	lduh	[%i0], %o3
	.word	0x967eb086	! t0_kref+0x1fa8:   	sdiv	%i2, -0xf7a, %o3
	.word	0xe06e001a	! t0_kref+0x1fac:   	ldstub	[%i0 + %i2], %l0
	.word	0x9744c000	! t0_kref+0x1fb0:   	mov	%gsr, %o3
	.word	0x97b0005a	! t0_kref+0x1fb4:   	edge8l	%g0, %i2, %o3
	.word	0x95a288ca	! t0_kref+0x1fb8:   	fsubd	%f10, %f10, %f10
	.word	0x95a0192a	! t0_kref+0x1fbc:   	fstod	%f10, %f10
	.word	0x96f035d2	! t0_kref+0x1fc0:   	udivcc	%g0, -0xa2e, %o3
	.word	0x95a289ab	! t0_kref+0x1fc4:   	fdivs	%f10, %f11, %f10
	.word	0x96f6b2eb	! t0_kref+0x1fc8:   	udivcc	%i2, -0xd15, %o3
	.word	0xd5180019	! t0_kref+0x1fcc:   	ldd	[%g0 + %i1], %f10
	.word	0x972ea00a	! t0_kref+0x1fd0:   	sll	%i2, 0xa, %o3
	.word	0x95a2884a	! t0_kref+0x1fd4:   	faddd	%f10, %f10, %f10
	.word	0x81dbc009	! t0_kref+0x1fd8:   	flush	%o7 + %o1
	.word	0x95a2894a	! t0_kref+0x1fdc:   	fmuld	%f10, %f10, %f10
	.word	0xd6863ffc	! t0_kref+0x1fe0:   	lda	[%i0 - 4]%asi, %o3
	.word	0xd6063ffc	! t0_kref+0x1fe4:   	ld	[%i0 - 4], %o3
	.word	0x960eb9b9	! t0_kref+0x1fe8:   	and	%i2, -0x647, %o3
	.word	0x97b2848a	! t0_kref+0x1fec:   	fcmple32	%f10, %f10, %o3
	.word	0x97a2c9aa	! t0_kref+0x1ff0:   	fdivs	%f11, %f10, %f11
	.word	0x96203764	! t0_kref+0x1ff4:   	sub	%g0, -0x89c, %o3
	.word	0x95aac04a	! t0_kref+0x1ff8:   	fmovdge	%fcc0, %f10, %f10
	.word	0x965e801a	! t0_kref+0x1ffc:   	smul	%i2, %i2, %o3
	.word	0x97400000	! t0_kref+0x2000:   	mov	%y, %o3
	.word	0xd59e7ff0	! t0_kref+0x2004:   	ldda	[%i1 - 0x10]%asi, %f10
	.word	0x95b28cab	! t0_kref+0x2008:   	fandnot2s	%f10, %f11, %f10
	.word	0x96180000	! t0_kref+0x200c:   	xor	%g0, %g0, %o3
	.word	0xd6d6501b	! t0_kref+0x2010:   	ldsha	[%i1 + %i3]0x80, %o3
	.word	0xd07e3ffc	! t0_kref+0x2014:   	swap	[%i0 - 4], %o0
	.word	0x96580000	! t0_kref+0x2018:   	smul	%g0, %g0, %o3
	.word	0x96b839dc	! t0_kref+0x201c:   	xnorcc	%g0, -0x624, %o3
	.word	0x96f6801a	! t0_kref+0x2020:   	udivcc	%i2, %i2, %o3
	.word	0x96f80000	! t0_kref+0x2024:   	sdivcc	%g0, %g0, %o3
	.word	0xc0a8a030	! t0_kref+0x2028:   	stba	%g0, [%g2 + 0x30]%asi
	.word	0x9646b617	! t0_kref+0x202c:   	addc	%i2, -0x9e9, %o3
	.word	0xf430a03a	! t0_kref+0x2030:   	sth	%i2, [%g2 + 0x3a]
	.word	0xe43e6010	! t0_kref+0x2034:   	std	%l2, [%i1 + 0x10]
	.word	0x95b2874a	! t0_kref+0x2038:   	fpack32	%f10, %f10, %f10
	.word	0x81580000	! t0_kref+0x203c:   	flushw
	.word	0x81b01024	! t0_kref+0x2040:   	siam	0x4
	.word	0xe36e3fe8	! t0_kref+0x2044:   	prefetch	%i0 - 0x18, 17
	.word	0xc030a016	! t0_kref+0x2048:   	clrh	[%g2 + 0x16]
	.word	0x81aa8aab	! t0_kref+0x204c:   	fcmpes	%fcc0, %f10, %f11
	.word	0xc1e61000	! t0_kref+0x2050:   	casa	[%i0]0x80, %g0, %g0
	.word	0x969030ab	! t0_kref+0x2054:   	orcc	%g0, -0xf55, %o3
	.word	0x97408000	! t0_kref+0x2058:   	mov	%ccr, %o3
	.word	0x96900000	! t0_kref+0x205c:   	orcc	%g0, %g0, %o3
	.word	0xc0ae501a	! t0_kref+0x2060:   	stba	%g0, [%i1 + %i2]0x80
	.word	0x9726801a	! t0_kref+0x2064:   	mulscc	%i2, %i2, %o3
	.word	0xe01e7ff0	! t0_kref+0x2068:   	ldd	[%i1 - 0x10], %l0
	.word	0xf4a0a038	! t0_kref+0x206c:   	sta	%i2, [%g2 + 0x38]%asi
	.word	0xd19f1a58	! t0_kref+0x2070:   	ldda	[%i4 + %i0]0xd2, %f8
	.word	0x95a0104a	! t0_kref+0x2074:   	fdtox	%f10, %f10
	.word	0xd46e2019	! t0_kref+0x2078:   	ldstub	[%i0 + 0x19], %o2
	.word	0x96f03990	! t0_kref+0x207c:   	udivcc	%g0, -0x670, %o3
	.word	0x9700001a	! t0_kref+0x2080:   	taddcc	%g0, %i2, %o3
	.word	0x3b480007	! t0_kref+0x2084:   	fble,a,pt	%fcc0, _kref+0x20a0
	.word	0x95a2894a	! t0_kref+0x2088:   	fmuld	%f10, %f10, %f10
	.word	0x960e801a	! t0_kref+0x208c:   	and	%i2, %i2, %o3
	.word	0xc020a038	! t0_kref+0x2090:   	clr	[%g2 + 0x38]
	.word	0xd5180019	! t0_kref+0x2094:   	ldd	[%g0 + %i1], %f10
	.word	0x9626a365	! t0_kref+0x2098:   	sub	%i2, 0x365, %o3
	.word	0xd1be1800	! t0_kref+0x209c:   	stda	%f8, [%i0]0xc0
	.word	0x95a0012b	! t0_kref+0x20a0:   	fabss	%f11, %f10
	.word	0x35800001	! t0_kref+0x20a4:   	fbue,a	_kref+0x20a8
	.word	0xd690a00c	! t0_kref+0x20a8:   	lduha	[%g2 + 0xc]%asi, %o3
	.word	0xd6462010	! t0_kref+0x20ac:   	ldsw	[%i0 + 0x10], %o3
	.word	0x97202945	! t0_kref+0x20b0:   	mulscc	%g0, 0x945, %o3
	.word	0x9720399d	! t0_kref+0x20b4:   	mulscc	%g0, -0x663, %o3
	.word	0xd7070018	! t0_kref+0x20b8:   	ld	[%i4 + %i0], %f11
	.word	0x95ab004a	! t0_kref+0x20bc:   	fmovduge	%fcc0, %f10, %f10
	.word	0x97a0052b	! t0_kref+0x20c0:   	fsqrts	%f11, %f11
	.word	0x95b28e80	! t0_kref+0x20c4:   	fsrc1	%f10, %f10
	.word	0xe0380018	! t0_kref+0x20c8:   	std	%l0, [%g0 + %i0]
	.word	0x95b2898a	! t0_kref+0x20cc:   	bshuffle	%f10, %f10, %f10
	.word	0x971ea2d5	! t0_kref+0x20d0:   	tsubcctv	%i2, 0x2d5, %o3
	.word	0x96180000	! t0_kref+0x20d4:   	xor	%g0, %g0, %o3
	.word	0x97408000	! t0_kref+0x20d8:   	mov	%ccr, %o3
	.word	0x97a0052b	! t0_kref+0x20dc:   	fsqrts	%f11, %f11
	.word	0x95b28e80	! t0_kref+0x20e0:   	fsrc1	%f10, %f10
	.word	0x95b2c6ab	! t0_kref+0x20e4:   	fmul8x16al	%f11, %f11, %f10
	.word	0x97400000	! t0_kref+0x20e8:   	mov	%y, %o3
	.word	0xd6167fe2	! t0_kref+0x20ec:   	lduh	[%i1 - 0x1e], %o3
	.word	0x95a2884a	! t0_kref+0x20f0:   	faddd	%f10, %f10, %f10
	.word	0x95a2884a	! t0_kref+0x20f4:   	faddd	%f10, %f10, %f10
	.word	0x965835a8	! t0_kref+0x20f8:   	smul	%g0, -0xa58, %o3
	.word	0x95a0054a	! t0_kref+0x20fc:   	fsqrtd	%f10, %f10
	.word	0xa7800000	! t0_kref+0x2100:   	mov	%g0, %gsr
	.word	0x95a2894a	! t0_kref+0x2104:   	fmuld	%f10, %f10, %f10
	.word	0x97a0052a	! t0_kref+0x2108:   	fsqrts	%f10, %f11
	.word	0x97202eba	! t0_kref+0x210c:   	mulscc	%g0, 0xeba, %o3
	.word	0xf4366018	! t0_kref+0x2110:   	sth	%i2, [%i1 + 0x18]
	.word	0xe678a010	! t0_kref+0x2114:   	swap	[%g2 + 0x10], %l3
	.word	0x9738200b	! t0_kref+0x2118:   	sra	%g0, 0xb, %o3
	.word	0x96100000	! t0_kref+0x211c:   	clr	%o3
	.word	0x973ea007	! t0_kref+0x2120:   	sra	%i2, 0x7, %o3
	.word	0x96e6b530	! t0_kref+0x2124:   	subccc	%i2, -0xad0, %o3
	.word	0x95a000ca	! t0_kref+0x2128:   	fnegd	%f10, %f10
	.word	0x9730001a	! t0_kref+0x212c:   	srl	%g0, %i2, %o3
	.word	0xd6de7ff0	! t0_kref+0x2130:   	ldxa	[%i1 - 0x10]%asi, %o3
	.word	0xebe65000	! t0_kref+0x2134:   	casa	[%i1]0x80, %g0, %l5
	.word	0x86102003	! t0_kref+0x2138:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x213c:   	bne,a	_kref+0x213c
	.word	0x86a0e001	! t0_kref+0x2140:   	subcc	%g3, 1, %g3
	.word	0xd6462000	! t0_kref+0x2144:   	ldsw	[%i0], %o3
	.word	0x97a000ab	! t0_kref+0x2148:   	fnegs	%f11, %f11
	.word	0xd6563ff8	! t0_kref+0x214c:   	ldsh	[%i0 - 8], %o3
	.word	0x95a000aa	! t0_kref+0x2150:   	fnegs	%f10, %f10
	.word	0x95b009ab	! t0_kref+0x2154:   	fexpand	%f11, %f10
	.word	0x97b28d2b	! t0_kref+0x2158:   	fandnot1s	%f10, %f11, %f11
	.word	0x97382012	! t0_kref+0x215c:   	sra	%g0, 0x12, %o3
	.word	0xd51e001d	! t0_kref+0x2160:   	ldd	[%i0 + %i5], %f10
	.word	0xd726401c	! t0_kref+0x2164:   	st	%f11, [%i1 + %i4]
	.word	0x9666b09f	! t0_kref+0x2168:   	subc	%i2, -0xf61, %o3
	.word	0x9666a831	! t0_kref+0x216c:   	subc	%i2, 0x831, %o3
	.word	0x95a2894a	! t0_kref+0x2170:   	fmuld	%f10, %f10, %f10
	.word	0xe56e7fe8	! t0_kref+0x2174:   	prefetch	%i1 - 0x18, 18
	.word	0xe49f5059	! t0_kref+0x2178:   	ldda	[%i5 + %i1]0x82, %l2
	.word	0xb810200c	! t0_kref+0x217c:   	mov	0xc, %i4
	.word	0x95b2c62a	! t0_kref+0x2180:   	fmul8x16	%f11, %f10, %f10
	.word	0x95a288ca	! t0_kref+0x2184:   	fsubd	%f10, %f10, %f10
	.word	0x9608001a	! t0_kref+0x2188:   	and	%g0, %i2, %o3
	.word	0x95a2cd2a	! t0_kref+0x218c:   	fsmuld	%f11, %f10, %f10
	.word	0x97408000	! t0_kref+0x2190:   	mov	%ccr, %o3
	.word	0x170a106d	! t0_kref+0x2194:   	sethi	%hi(0x2841b400), %o3
	.word	0x95a2882a	! t0_kref+0x2198:   	fadds	%f10, %f10, %f10
	.word	0x95a0192a	! t0_kref+0x219c:   	fstod	%f10, %f10
	.word	0x96468000	! t0_kref+0x21a0:   	addc	%i2, %g0, %o3
	.word	0xd51e401d	! t0_kref+0x21a4:   	ldd	[%i1 + %i5], %f10
	.word	0x95a8404a	! t0_kref+0x21a8:   	fmovdne	%fcc0, %f10, %f10
	.word	0x81aacaab	! t0_kref+0x21ac:   	fcmpes	%fcc0, %f11, %f11
	.word	0x95a0192b	! t0_kref+0x21b0:   	fstod	%f11, %f10
	.word	0x97a000aa	! t0_kref+0x21b4:   	fnegs	%f10, %f11
	.word	0x81aa8aab	! t0_kref+0x21b8:   	fcmpes	%fcc0, %f10, %f11
	.word	0x96a6bb1b	! t0_kref+0x21bc:   	subcc	%i2, -0x4e5, %o3
	.word	0xd6564000	! t0_kref+0x21c0:   	ldsh	[%i1], %o3
	.word	0xd86e001a	! t0_kref+0x21c4:   	ldstub	[%i0 + %i2], %o4
	.word	0xf3ee101d	! t0_kref+0x21c8:   	prefetcha	%i0 + %i5, 25
	.word	0x96402f58	! t0_kref+0x21cc:   	addc	%g0, 0xf58, %o3
	.word	0x97a01a4a	! t0_kref+0x21d0:   	fdtoi	%f10, %f11
	.word	0x95a0002a	! t0_kref+0x21d4:   	fmovs	%f10, %f10
	.word	0x97b68240	! t0_kref+0x21d8:   	array16	%i2, %g0, %o3
	.word	0x97b2caea	! t0_kref+0x21dc:   	fpsub32s	%f11, %f10, %f11
	.word	0x96d6801a	! t0_kref+0x21e0:   	umulcc	%i2, %i2, %o3
	.word	0x9730001a	! t0_kref+0x21e4:   	srl	%g0, %i2, %o3
	.word	0xd60e201e	! t0_kref+0x21e8:   	ldub	[%i0 + 0x1e], %o3
	.word	0xe03e2018	! t0_kref+0x21ec:   	std	%l0, [%i0 + 0x18]
	.word	0x96a82258	! t0_kref+0x21f0:   	andncc	%g0, 0x258, %o3
	.word	0x81580000	! t0_kref+0x21f4:   	flushw
	.word	0x965ea00c	! t0_kref+0x21f8:   	smul	%i2, 0xc, %o3
	.word	0xd6d81018	! t0_kref+0x21fc:   	ldxa	[%g0 + %i0]0x80, %o3
	.word	0x95a01a2a	! t0_kref+0x2200:   	fstoi	%f10, %f10
	.word	0x170eaced	! t0_kref+0x2204:   	sethi	%hi(0x3ab3b400), %o3
	.word	0x39480004	! t0_kref+0x2208:   	fbuge,a,pt	%fcc0, _kref+0x2218
	.word	0x97b28ea0	! t0_kref+0x220c:   	fsrc1s	%f10, %f11
	.word	0xd5be6000	! t0_kref+0x2210:   	stda	%f10, [%i1]%asi
	.word	0xd6066010	! t0_kref+0x2214:   	ld	[%i1 + 0x10], %o3
	.word	0xd656c019	! t0_kref+0x2218:   	ldsh	[%i3 + %i1], %o3
	.word	0xc0a8a03f	! t0_kref+0x221c:   	stba	%g0, [%g2 + 0x3f]%asi
	.word	0x3b800002	! t0_kref+0x2220:   	fble,a	_kref+0x2228
	.word	0x95a0002a	! t0_kref+0x2224:   	fmovs	%f10, %f10
	.word	0x9fc10000	! t0_kref+0x2228:   	call	%g4
	.word	0x96900000	! t0_kref+0x222c:   	orcc	%g0, %g0, %o3
	.word	0x95b00c20	! t0_kref+0x2230:   	fzeros	%f10
	.word	0x973ea005	! t0_kref+0x2234:   	sra	%i2, 0x5, %o3
	.word	0x95b286ea	! t0_kref+0x2238:   	fmul8ulx16	%f10, %f10, %f10
	.word	0xd6060000	! t0_kref+0x223c:   	ld	[%i0], %o3
	.word	0x95a2894a	! t0_kref+0x2240:   	fmuld	%f10, %f10, %f10
	.word	0x95a0052b	! t0_kref+0x2244:   	fsqrts	%f11, %f10
	.word	0x29800008	! t0_kref+0x2248:   	fbl,a	_kref+0x2268
	.word	0x973ea019	! t0_kref+0x224c:   	sra	%i2, 0x19, %o3
	.word	0xd7867ff4	! t0_kref+0x2250:   	lda	[%i1 - 0xc]%asi, %f11
	.word	0x962ea9b9	! t0_kref+0x2254:   	andn	%i2, 0x9b9, %o3
	.word	0x9696a531	! t0_kref+0x2258:   	orcc	%i2, 0x531, %o3
	.word	0x97b00200	! t0_kref+0x225c:   	array8	%g0, %g0, %o3
	.word	0x2d800008	! t0_kref+0x2260:   	fbg,a	_kref+0x2280
	.word	0x960eaecd	! t0_kref+0x2264:   	and	%i2, 0xecd, %o3
	.word	0x97b2854a	! t0_kref+0x2268:   	fcmpeq16	%f10, %f10, %o3
	.word	0x9680001a	! t0_kref+0x226c:   	addcc	%g0, %i2, %o3
	.word	0xd6563fe6	! t0_kref+0x2270:   	ldsh	[%i0 - 0x1a], %o3
	.word	0x95a0054a	! t0_kref+0x2274:   	fsqrtd	%f10, %f10
	.word	0xd6164000	! t0_kref+0x2278:   	lduh	[%i1], %o3
	.word	0x97b00f2a	! t0_kref+0x227c:   	fsrc2s	%f10, %f11
	.word	0x96868000	! t0_kref+0x2280:   	addcc	%i2, %g0, %o3
	.word	0xd6871019	! t0_kref+0x2284:   	lda	[%i4 + %i1]0x80, %o3
	.word	0xe36e6010	! t0_kref+0x2288:   	prefetch	%i1 + 0x10, 17
	.word	0x95a000ab	! t0_kref+0x228c:   	fnegs	%f11, %f10
	.word	0x23800004	! t0_kref+0x2290:   	fbne,a	_kref+0x22a0
	.word	0x95b2874a	! t0_kref+0x2294:   	fpack32	%f10, %f10, %f10
	.word	0x97b00340	! t0_kref+0x2298:   	alignaddrl	%g0, %g0, %o3
	.word	0xf4363fe2	! t0_kref+0x229c:   	sth	%i2, [%i0 - 0x1e]
	.word	0x97400000	! t0_kref+0x22a0:   	mov	%y, %o3
	.word	0x96d6b202	! t0_kref+0x22a4:   	umulcc	%i2, -0xdfe, %o3
	.word	0x95b28aca	! t0_kref+0x22a8:   	fpsub32	%f10, %f10, %f10
	.word	0x96903aba	! t0_kref+0x22ac:   	orcc	%g0, -0x546, %o3
	.word	0xd5a71018	! t0_kref+0x22b0:   	sta	%f10, [%i4 + %i0]0x80
	.word	0x96583b6b	! t0_kref+0x22b4:   	smul	%g0, -0x495, %o3
	.word	0x3f480004	! t0_kref+0x22b8:   	fbo,a,pt	%fcc0, _kref+0x22c8
	.word	0x97b000a0	! t0_kref+0x22bc:   	edge16n	%g0, %g0, %o3
	.word	0x97400000	! t0_kref+0x22c0:   	mov	%y, %o3
	.word	0x95a8c04a	! t0_kref+0x22c4:   	fmovdul	%fcc0, %f10, %f10
	.word	0xd500a010	! t0_kref+0x22c8:   	ld	[%g2 + 0x10], %f10
	.word	0x95a2c9ab	! t0_kref+0x22cc:   	fdivs	%f11, %f11, %f10
	.word	0xd5bf5018	! t0_kref+0x22d0:   	stda	%f10, [%i5 + %i0]0x80
	.word	0xd6163ff2	! t0_kref+0x22d4:   	lduh	[%i0 - 0xe], %o3
	.word	0x97a2c9ab	! t0_kref+0x22d8:   	fdivs	%f11, %f11, %f11
	.word	0x97400000	! t0_kref+0x22dc:   	mov	%y, %o3
	.word	0xd6167ffc	! t0_kref+0x22e0:   	lduh	[%i1 - 4], %o3
	.word	0xd53e2000	! t0_kref+0x22e4:   	std	%f10, [%i0]
	.word	0x96f8001a	! t0_kref+0x22e8:   	sdivcc	%g0, %i2, %o3
	.word	0xb8103fe8	! t0_kref+0x22ec:   	mov	0xffffffe8, %i4
	.word	0xd59e3fe0	! t0_kref+0x22f0:   	ldda	[%i0 - 0x20]%asi, %f10
	.word	0x95a0110a	! t0_kref+0x22f4:   	fxtod	%f10, %f10
	.word	0x95b2caeb	! t0_kref+0x22f8:   	fpsub32s	%f11, %f11, %f10
	.word	0x9726b690	! t0_kref+0x22fc:   	mulscc	%i2, -0x970, %o3
	.word	0xd51e7ff0	! t0_kref+0x2300:   	ldd	[%i1 - 0x10], %f10
	.word	0xc07e2010	! t0_kref+0x2304:   	swap	[%i0 + 0x10], %g0
	.word	0x95a0054a	! t0_kref+0x2308:   	fsqrtd	%f10, %f10
	.word	0x969ebd6f	! t0_kref+0x230c:   	xorcc	%i2, -0x291, %o3
	.word	0xe03e7ff0	! t0_kref+0x2310:   	std	%l0, [%i1 - 0x10]
	.word	0xd6de2008	! t0_kref+0x2314:   	ldxa	[%i0 + 8]%asi, %o3
	.word	0xd65e401d	! t0_kref+0x2318:   	ldx	[%i1 + %i5], %o3
	.word	0x9736a019	! t0_kref+0x231c:   	srl	%i2, 0x19, %o3
	.word	0x95a0104a	! t0_kref+0x2320:   	fdtox	%f10, %f10
	.word	0x97b00280	! t0_kref+0x2324:   	array32	%g0, %g0, %o3
	.word	0x95a0054a	! t0_kref+0x2328:   	fsqrtd	%f10, %f10
	.word	0x960e801a	! t0_kref+0x232c:   	and	%i2, %i2, %o3
	.word	0x95a0188a	! t0_kref+0x2330:   	fitos	%f10, %f10
	.word	0x97b2854a	! t0_kref+0x2334:   	fcmpeq16	%f10, %f10, %o3
	.word	0x81b01027	! t0_kref+0x2338:   	siam	0x7
	.word	0x8143e040	! t0_kref+0x233c:   	membar	0x40
	.word	0x95a000ca	! t0_kref+0x2340:   	fnegd	%f10, %f10
	.word	0xd1be1880	! t0_kref+0x2344:   	stda	%f8, [%i0]0xc4
	.word	0x97408000	! t0_kref+0x2348:   	mov	%ccr, %o3
	.word	0x97a01a4a	! t0_kref+0x234c:   	fdtoi	%f10, %f11
	.word	0x97b00140	! t0_kref+0x2350:   	edge32l	%g0, %g0, %o3
	.word	0xd6566016	! t0_kref+0x2354:   	ldsh	[%i1 + 0x16], %o3
	.word	0x960e801a	! t0_kref+0x2358:   	and	%i2, %i2, %o3
	.word	0x96902df3	! t0_kref+0x235c:   	orcc	%g0, 0xdf3, %o3
	.word	0x962e8000	! t0_kref+0x2360:   	andn	%i2, %g0, %o3
	.word	0x26480005	! t0_kref+0x2364:   	bl,a,pt	%icc, _kref+0x2378
	.word	0x95a018ca	! t0_kref+0x2368:   	fdtos	%f10, %f10
	.word	0x97400000	! t0_kref+0x236c:   	mov	%y, %o3
	.word	0x965ea0a5	! t0_kref+0x2370:   	smul	%i2, 0xa5, %o3
	.word	0x966030a0	! t0_kref+0x2374:   	subc	%g0, -0xf60, %o3
	.word	0x95a0192b	! t0_kref+0x2378:   	fstod	%f11, %f10
	.word	0x96668000	! t0_kref+0x237c:   	subc	%i2, %g0, %o3
	.word	0x96f6ac56	! t0_kref+0x2380:   	udivcc	%i2, 0xc56, %o3
	.word	0x96d6801a	! t0_kref+0x2384:   	umulcc	%i2, %i2, %o3
	.word	0xc0f75019	! t0_kref+0x2388:   	stxa	%g0, [%i5 + %i1]0x80
	.word	0x97b0035a	! t0_kref+0x238c:   	alignaddrl	%g0, %i2, %o3
	.word	0x97400000	! t0_kref+0x2390:   	mov	%y, %o3
	.word	0xe03e401d	! t0_kref+0x2394:   	std	%l0, [%i1 + %i5]
	.word	0x95b2890a	! t0_kref+0x2398:   	faligndata	%f10, %f10, %f10
	.word	0x97b00300	! t0_kref+0x239c:   	alignaddr	%g0, %g0, %o3
	.word	0x95a0002b	! t0_kref+0x23a0:   	fmovs	%f11, %f10
	.word	0xe4180018	! t0_kref+0x23a4:   	ldd	[%g0 + %i0], %l2
	.word	0x81aaca2a	! t0_kref+0x23a8:   	fcmps	%fcc0, %f11, %f10
	.word	0x9608001a	! t0_kref+0x23ac:   	and	%g0, %i2, %o3
	.word	0x81dc000c	! t0_kref+0x23b0:   	flush	%l0 + %o4
	.word	0x95a0014a	! t0_kref+0x23b4:   	fabsd	%f10, %f10
	.word	0xe41e2000	! t0_kref+0x23b8:   	ldd	[%i0], %l2
	.word	0x81dcb096	! t0_kref+0x23bc:   	flush	%l2 - 0xf6a
	.word	0x95a2894a	! t0_kref+0x23c0:   	fmuld	%f10, %f10, %f10
	.word	0xd68e3fe1	! t0_kref+0x23c4:   	lduba	[%i0 - 0x1f]%asi, %o3
	.word	0x95a0054a	! t0_kref+0x23c8:   	fsqrtd	%f10, %f10
	.word	0x960e801a	! t0_kref+0x23cc:   	and	%i2, %i2, %o3
	.word	0x9e0068a8	! t0_kref+0x23d0:   	add	%g1, 0x8a8, %o7
!	.word	0x244d3f0b	! t0_kref+0x23d4:   	ble,a,pt	%icc, SYM(t0_subr1)
	   	ble,a,pt	%icc, SYM(t0_subr1)
	.word	0x8143c000	! t0_kref+0x23d8:   	stbar
	.word	0x97b28fab	! t0_kref+0x23dc:   	fors	%f10, %f11, %f11
	.word	0xd1be5a1a	! t0_kref+0x23e0:   	stda	%f8, [%i1 + %i2]0xd0
	.word	0x96183d03	! t0_kref+0x23e4:   	xor	%g0, -0x2fd, %o3
	.word	0x81aacaab	! t0_kref+0x23e8:   	fcmpes	%fcc0, %f11, %f11
	.word	0x95a0192a	! t0_kref+0x23ec:   	fstod	%f10, %f10
	.word	0x9696bfd0	! t0_kref+0x23f0:   	orcc	%i2, -0x30, %o3
	.word	0x81dc0014	! t0_kref+0x23f4:   	flush	%l0 + %l4
	.word	0x95a0188a	! t0_kref+0x23f8:   	fitos	%f10, %f10
	.word	0x96080000	! t0_kref+0x23fc:   	and	%g0, %g0, %o3
	.word	0x97a0012b	! t0_kref+0x2400:   	fabss	%f11, %f11
	.word	0x97203853	! t0_kref+0x2404:   	mulscc	%g0, -0x7ad, %o3
	.word	0x96de8000	! t0_kref+0x2408:   	smulcc	%i2, %g0, %o3
	.word	0x95a000ca	! t0_kref+0x240c:   	fnegd	%f10, %f10
	.word	0x22800003	! t0_kref+0x2410:   	be,a	_kref+0x241c
	.word	0x95ab004a	! t0_kref+0x2414:   	fmovduge	%fcc0, %f10, %f10
	.word	0x95a288ca	! t0_kref+0x2418:   	fsubd	%f10, %f10, %f10
	.word	0x96102ce7	! t0_kref+0x241c:   	mov	0xce7, %o3
	.word	0x97a018ca	! t0_kref+0x2420:   	fdtos	%f10, %f11
	.word	0x95a2894a	! t0_kref+0x2424:   	fmuld	%f10, %f10, %f10
	.word	0x965027da	! t0_kref+0x2428:   	umul	%g0, 0x7da, %o3
	.word	0x95b2872b	! t0_kref+0x242c:   	fmuld8ulx16	%f10, %f11, %f10
	.word	0x97a2882a	! t0_kref+0x2430:   	fadds	%f10, %f10, %f11
	.word	0xd656001b	! t0_kref+0x2434:   	ldsh	[%i0 + %i3], %o3
	.word	0x95a2894a	! t0_kref+0x2438:   	fmuld	%f10, %f10, %f10
	.word	0x9716bb21	! t0_kref+0x243c:   	taddcctv	%i2, -0x4df, %o3
	.word	0xc807bfe8	! t0_kref+0x2440:   	ld	[%fp - 0x18], %g4
	.word	0x95a0192a	! t0_kref+0x2444:   	fstod	%f10, %f10
	.word	0x97a0012b	! t0_kref+0x2448:   	fabss	%f11, %f11
	.word	0x96f00000	! t0_kref+0x244c:   	udivcc	%g0, %g0, %o3
	.word	0x95a0104a	! t0_kref+0x2450:   	fdtox	%f10, %f10
	.word	0xca016fa0	! t0_kref+0x2454:   	ld	[%g5 + 0xfa0], %g5
	.word	0x9696801a	! t0_kref+0x2458:   	orcc	%i2, %i2, %o3
	.word	0xc168a00b	! t0_kref+0x245c:   	prefetch	%g2 + 0xb, 0
	.word	0xd1be585a	! t0_kref+0x2460:   	stda	%f8, [%i1 + %i2]0xc2
	.word	0xd51f4019	! t0_kref+0x2464:   	ldd	[%i5 + %i1], %f10
	.word	0x97a289ab	! t0_kref+0x2468:   	fdivs	%f10, %f11, %f11
	.word	0x96468000	! t0_kref+0x246c:   	addc	%i2, %g0, %o3
	.word	0x97408000	! t0_kref+0x2470:   	mov	%ccr, %o3
	.word	0xd696101b	! t0_kref+0x2474:   	lduha	[%i0 + %i3]0x80, %o3
	.word	0x95b00fc0	! t0_kref+0x2478:   	fone	%f10
	.word	0x95a2894a	! t0_kref+0x247c:   	fmuld	%f10, %f10, %f10
	.word	0x81de3d49	! t0_kref+0x2480:   	flush	%i0 - 0x2b7
	.word	0x9736a00d	! t0_kref+0x2484:   	srl	%i2, 0xd, %o3
	.word	0xd6564000	! t0_kref+0x2488:   	ldsh	[%i1], %o3
	.word	0x39800006	! t0_kref+0x248c:   	fbuge,a	_kref+0x24a4
	.word	0xd5380018	! t0_kref+0x2490:   	std	%f10, [%g0 + %i0]
	.word	0x97b28d60	! t0_kref+0x2494:   	fnot1s	%f10, %f11
	.word	0x96868000	! t0_kref+0x2498:   	addcc	%i2, %g0, %o3
	.word	0x95a0052b	! t0_kref+0x249c:   	fsqrts	%f11, %f10
	.word	0x961034c2	! t0_kref+0x24a0:   	mov	0xfffff4c2, %o3
	.word	0x97382013	! t0_kref+0x24a4:   	sra	%g0, 0x13, %o3
	.word	0xe968a00d	! t0_kref+0x24a8:   	prefetch	%g2 + 0xd, 20
	.word	0x96182ae4	! t0_kref+0x24ac:   	xor	%g0, 0xae4, %o3
	.word	0x17217f73	! t0_kref+0x24b0:   	sethi	%hi(0x85fdcc00), %o3
	.word	0xd5a71018	! t0_kref+0x24b4:   	sta	%f10, [%i4 + %i0]0x80
	.word	0xe16e001c	! t0_kref+0x24b8:   	prefetch	%i0 + %i4, 16
	.word	0x95a01a2b	! t0_kref+0x24bc:   	fstoi	%f11, %f10
	.word	0xd6d63ffa	! t0_kref+0x24c0:   	ldsha	[%i0 - 6]%asi, %o3
	.word	0x95a0188a	! t0_kref+0x24c4:   	fitos	%f10, %f10
	.word	0x9640337d	! t0_kref+0x24c8:   	addc	%g0, -0xc83, %o3
	.word	0xd5862000	! t0_kref+0x24cc:   	lda	[%i0]%asi, %f10
	.word	0xe01e4000	! t0_kref+0x24d0:   	ldd	[%i1], %l0
	.word	0x86102006	! t0_kref+0x24d4:   	mov	0x6, %g3
	.word	0x86a0e001	! t0_kref+0x24d8:   	subcc	%g3, 1, %g3
	.word	0x22800011	! t0_kref+0x24dc:   	be,a	_kref+0x2520
	.word	0x96f68000	! t0_kref+0x24e0:   	udivcc	%i2, %g0, %o3
	.word	0xd51fbc58	! t0_kref+0x24e4:   	ldd	[%fp - 0x3a8], %f10
	.word	0x9626a7fe	! t0_kref+0x24e8:   	sub	%i2, 0x7fe, %o3
	.word	0x969e8000	! t0_kref+0x24ec:   	xorcc	%i2, %g0, %o3
	.word	0x20bffffa	! t0_kref+0x24f0:   	bn,a	_kref+0x24d8
	.word	0x97282006	! t0_kref+0x24f4:   	sll	%g0, 0x6, %o3
	.word	0x97400000	! t0_kref+0x24f8:   	mov	%y, %o3
	.word	0x97b2854a	! t0_kref+0x24fc:   	fcmpeq16	%f10, %f10, %o3
	.word	0x97b00fe0	! t0_kref+0x2500:   	fones	%f11
	.word	0x961eb314	! t0_kref+0x2504:   	xor	%i2, -0xcec, %o3
	.word	0x9730200a	! t0_kref+0x2508:   	srl	%g0, 0xa, %o3
	.word	0x96583dbe	! t0_kref+0x250c:   	smul	%g0, -0x242, %o3
	.word	0x95a0110a	! t0_kref+0x2510:   	fxtod	%f10, %f10
	.word	0xf420001c	! t0_kref+0x2514:   	st	%i2, [%g0 + %i4]
	.word	0x9680001a	! t0_kref+0x2518:   	addcc	%g0, %i2, %o3
	.word	0xc0ee5000	! t0_kref+0x251c:   	ldstuba	[%i1]0x80, %g0
	.word	0x97b007aa	! t0_kref+0x2520:   	fpackfix	%f10, %f11
	.word	0x95a0054a	! t0_kref+0x2524:   	fsqrtd	%f10, %f10
	.word	0x96880000	! t0_kref+0x2528:   	andcc	%g0, %g0, %o3
	.word	0x95a0052a	! t0_kref+0x252c:   	fsqrts	%f10, %f10
	.word	0x973ea00d	! t0_kref+0x2530:   	sra	%i2, 0xd, %o3
	.word	0x95b28d40	! t0_kref+0x2534:   	fnot1	%f10, %f10
	.word	0x9626801a	! t0_kref+0x2538:   	sub	%i2, %i2, %o3
	.word	0x81aa8aca	! t0_kref+0x253c:   	fcmped	%fcc0, %f10, %f10
	.word	0xd6562008	! t0_kref+0x2540:   	ldsh	[%i0 + 8], %o3
	.word	0xd7263fe0	! t0_kref+0x2544:   	st	%f11, [%i0 - 0x20]
	.word	0x9726801a	! t0_kref+0x2548:   	mulscc	%i2, %i2, %o3
	.word	0x96100000	! t0_kref+0x254c:   	clr	%o3
	.word	0x97a289ab	! t0_kref+0x2550:   	fdivs	%f10, %f11, %f11
	.word	0x96902a91	! t0_kref+0x2554:   	orcc	%g0, 0xa91, %o3
	.word	0xd64e8018	! t0_kref+0x2558:   	ldsb	[%i2 + %i0], %o3
	.word	0x965e801a	! t0_kref+0x255c:   	smul	%i2, %i2, %o3
	.word	0x97b2caeb	! t0_kref+0x2560:   	fpsub32s	%f11, %f11, %f11
	.word	0xd60e401a	! t0_kref+0x2564:   	ldub	[%i1 + %i2], %o3
	.word	0x97b00200	! t0_kref+0x2568:   	array8	%g0, %g0, %o3
	.word	0x95b2c62a	! t0_kref+0x256c:   	fmul8x16	%f11, %f10, %f10
	.word	0x95b28d0a	! t0_kref+0x2570:   	fandnot1	%f10, %f10, %f10
	.word	0x95a01a4a	! t0_kref+0x2574:   	fdtoi	%f10, %f10
	.word	0x97a0052a	! t0_kref+0x2578:   	fsqrts	%f10, %f11
	.word	0x97a01a4a	! t0_kref+0x257c:   	fdtoi	%f10, %f11
	.word	0x95b28c6a	! t0_kref+0x2580:   	fnors	%f10, %f10, %f10
	.word	0x95b286ea	! t0_kref+0x2584:   	fmul8ulx16	%f10, %f10, %f10
	.word	0x95a0012a	! t0_kref+0x2588:   	fabss	%f10, %f10
	.word	0x95b28eca	! t0_kref+0x258c:   	fornot2	%f10, %f10, %f10
	.word	0x9666a3e9	! t0_kref+0x2590:   	subc	%i2, 0x3e9, %o3
	.word	0x97a01a4a	! t0_kref+0x2594:   	fdtoi	%f10, %f11
	.word	0x95a0190a	! t0_kref+0x2598:   	fitod	%f10, %f10
	.word	0xa9c70005	! t0_kref+0x259c:   	jmpl	%i4 + %g5, %l4
	.word	0x81580000	! t0_kref+0x25a0:   	flushw
	.word	0x96e0001a	! t0_kref+0x25a4:   	subccc	%g0, %i2, %o3
	.word	0x95a2cd2a	! t0_kref+0x25a8:   	fsmuld	%f11, %f10, %f10
	.word	0x8143e040	! t0_kref+0x25ac:   	membar	0x40
	.word	0xd6d66018	! t0_kref+0x25b0:   	ldsha	[%i1 + 0x18]%asi, %o3
	.word	0x95a000ca	! t0_kref+0x25b4:   	fnegd	%f10, %f10
	.word	0x86102002	! t0_kref+0x25b8:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x25bc:   	bne,a	_kref+0x25bc
	.word	0x86a0e001	! t0_kref+0x25c0:   	subcc	%g3, 1, %g3
	.word	0x172bccee	! t0_kref+0x25c4:   	sethi	%hi(0xaf33b800), %o3
	.word	0x96e6b2b3	! t0_kref+0x25c8:   	subccc	%i2, -0xd4d, %o3
	.word	0x97a000aa	! t0_kref+0x25cc:   	fnegs	%f10, %f11
	.word	0xe656c005	! t0_kref+0x25d0:   	ldsh	[%i3 + %g5], %l3
	.word	0x95a288ca	! t0_kref+0x25d4:   	fsubd	%f10, %f10, %f10
	.word	0x96f6b4b2	! t0_kref+0x25d8:   	udivcc	%i2, -0xb4e, %o3
	.word	0x2d800008	! t0_kref+0x25dc:   	fbg,a	_kref+0x25fc
	.word	0xf4ae3ff0	! t0_kref+0x25e0:   	stba	%i2, [%i0 - 0x10]%asi
	.word	0x95a288ca	! t0_kref+0x25e4:   	fsubd	%f10, %f10, %f10
	.word	0x95b28aca	! t0_kref+0x25e8:   	fpsub32	%f10, %f10, %f10
	.word	0x96de801a	! t0_kref+0x25ec:   	smulcc	%i2, %i2, %o3
	.word	0x9666b485	! t0_kref+0x25f0:   	subc	%i2, -0xb7b, %o3
	.word	0x97b00020	! t0_kref+0x25f4:   	edge8n	%g0, %g0, %o3
	.word	0x9fc10000	! t0_kref+0x25f8:   	call	%g4
	.word	0xd6de501d	! t0_kref+0x25fc:   	ldxa	[%i1 + %i5]0x80, %o3
	.word	0xe43e2008	! t0_kref+0x2600:   	std	%l2, [%i0 + 8]
	.word	0x31480008	! t0_kref+0x2604:   	fba,a,pt	%fcc0, _kref+0x2624
	.word	0x95a0104a	! t0_kref+0x2608:   	fdtox	%f10, %f10
	.word	0x95b2874a	! t0_kref+0x260c:   	fpack32	%f10, %f10, %f10
	.word	0x96968000	! t0_kref+0x2610:   	orcc	%i2, %g0, %o3
	.word	0xd5be101d	! t0_kref+0x2614:   	stda	%f10, [%i0 + %i5]0x80
	.word	0xc0366000	! t0_kref+0x2618:   	clrh	[%i1]
	.word	0xe43e7ff8	! t0_kref+0x261c:   	std	%l2, [%i1 - 8]
	.word	0x96182abe	! t0_kref+0x2620:   	xor	%g0, 0xabe, %o3
	.word	0x9656801a	! t0_kref+0x2624:   	umul	%i2, %i2, %o3
	.word	0x97a2c8ab	! t0_kref+0x2628:   	fsubs	%f11, %f11, %f11
	.word	0x95b00cea	! t0_kref+0x262c:   	fnot2s	%f10, %f10
	.word	0x97b00200	! t0_kref+0x2630:   	array8	%g0, %g0, %o3
	.word	0x9658001a	! t0_kref+0x2634:   	smul	%g0, %i2, %o3
	.word	0x97b2850a	! t0_kref+0x2638:   	fcmpgt16	%f10, %f10, %o3
	.word	0x967e8000	! t0_kref+0x263c:   	sdiv	%i2, %g0, %o3
	.word	0x9736a00e	! t0_kref+0x2640:   	srl	%i2, 0xe, %o3
	.word	0x9726a798	! t0_kref+0x2644:   	mulscc	%i2, 0x798, %o3
	.word	0x83414000	! t0_kref+0x2648:   	mov	%pc, %g1
	.word	0x9676b0c0	! t0_kref+0x264c:   	udiv	%i2, -0xf40, %o3
	.word	0xd51fbe28	! t0_kref+0x2650:   	ldd	[%fp - 0x1d8], %f10
	.word	0x97a0002a	! t0_kref+0x2654:   	fmovs	%f10, %f11
	.word	0x97b0033a	! t0_kref+0x2658:   	bmask	%g0, %i2, %o3
	.word	0x97a01a4a	! t0_kref+0x265c:   	fdtoi	%f10, %f11
	.word	0x95b28a0a	! t0_kref+0x2660:   	fpadd16	%f10, %f10, %f10
	.word	0xe41e3fe0	! t0_kref+0x2664:   	ldd	[%i0 - 0x20], %l2
	.word	0x8143e02d	! t0_kref+0x2668:   	membar	0x2d
	.word	0x97b284ca	! t0_kref+0x266c:   	fcmpne32	%f10, %f10, %o3
	.word	0x8143e040	! t0_kref+0x2670:   	membar	0x40
	.word	0x97b2840a	! t0_kref+0x2674:   	fcmple16	%f10, %f10, %o3
	.word	0x962039bd	! t0_kref+0x2678:   	sub	%g0, -0x643, %o3
	.word	0x8143c000	! t0_kref+0x267c:   	stbar
	.word	0x95a28d2a	! t0_kref+0x2680:   	fsmuld	%f10, %f10, %f10
	.word	0xd6166016	! t0_kref+0x2684:   	lduh	[%i1 + 0x16], %o3
	.word	0x96f031c5	! t0_kref+0x2688:   	udivcc	%g0, -0xe3b, %o3
	.word	0x97b000da	! t0_kref+0x268c:   	edge16l	%g0, %i2, %o3
	.word	0x97b00c20	! t0_kref+0x2690:   	fzeros	%f11
	.word	0x96700000	! t0_kref+0x2694:   	udiv	%g0, %g0, %o3
	.word	0x95b2874a	! t0_kref+0x2698:   	fpack32	%f10, %f10, %f10
	.word	0x9666801a	! t0_kref+0x269c:   	subc	%i2, %i2, %o3
	.word	0x95b00fe0	! t0_kref+0x26a0:   	fones	%f10
	.word	0xe41f4019	! t0_kref+0x26a4:   	ldd	[%i5 + %i1], %l2
	.word	0xe01f4019	! t0_kref+0x26a8:   	ldd	[%i5 + %i1], %l0
	.word	0x965ea593	! t0_kref+0x26ac:   	smul	%i2, 0x593, %o3
	.word	0x97b2854a	! t0_kref+0x26b0:   	fcmpeq16	%f10, %f10, %o3
	.word	0xd6067ff8	! t0_kref+0x26b4:   	ld	[%i1 - 8], %o3
	.word	0x97b68000	! t0_kref+0x26b8:   	edge8	%i2, %g0, %o3
	.word	0x95b28daa	! t0_kref+0x26bc:   	fxors	%f10, %f10, %f10
	.word	0x34800004	! t0_kref+0x26c0:   	bg,a	_kref+0x26d0
	.word	0x9626b4b0	! t0_kref+0x26c4:   	sub	%i2, -0xb50, %o3
	.word	0x96be801a	! t0_kref+0x26c8:   	xnorcc	%i2, %i2, %o3
	.word	0x95a289aa	! t0_kref+0x26cc:   	fdivs	%f10, %f10, %f10
	.word	0x95a0190a	! t0_kref+0x26d0:   	fitod	%f10, %f10
	.word	0x95a0192b	! t0_kref+0x26d4:   	fstod	%f11, %f10
	.word	0x95a01a2a	! t0_kref+0x26d8:   	fstoi	%f10, %f10
	.word	0x95b2890a	! t0_kref+0x26dc:   	faligndata	%f10, %f10, %f10
	.word	0x97b284ca	! t0_kref+0x26e0:   	fcmpne32	%f10, %f10, %o3
	.word	0xd580a024	! t0_kref+0x26e4:   	lda	[%g2 + 0x24]%asi, %f10
	.word	0x961eb245	! t0_kref+0x26e8:   	xor	%i2, -0xdbb, %o3
	.word	0x973e8000	! t0_kref+0x26ec:   	sra	%i2, %g0, %o3
	.word	0xd6c71019	! t0_kref+0x26f0:   	ldswa	[%i4 + %i1]0x80, %o3
	.word	0x95a9004a	! t0_kref+0x26f4:   	fmovdl	%fcc0, %f10, %f10
	.word	0x87802082	! t0_kref+0x26f8:   	mov	0x82, %asi
	.word	0x86102019	! t0_kref+0x26fc:   	mov	0x19, %g3
	.word	0x86a0e001	! t0_kref+0x2700:   	subcc	%g3, 1, %g3
	.word	0x22800002	! t0_kref+0x2704:   	be,a	_kref+0x270c
	.word	0x973e801a	! t0_kref+0x2708:   	sra	%i2, %i2, %o3
	call	1f
	.empty
	.word	0x96f6a6ad	! t0_kref+0x2710:   	udivcc	%i2, 0x6ad, %o3
	.word	0xe4380018	! t0_kref+0x2714:   	std	%l2, [%g0 + %i0]
	.word	0xe09e101d	! t0_kref+0x2718:   	ldda	[%i0 + %i5]0x80, %l0
	.word	0x95b2862a	! t0_kref+0x271c:   	fmul8x16	%f10, %f10, %f10
	.word	0x95a289aa	! t0_kref+0x2720:   	fdivs	%f10, %f10, %f10
1:	.word	0xd6067ff4	! t0_kref+0x2724:   	ld	[%i1 - 0xc], %o3
	.word	0xd6d01018	! t0_kref+0x2728:   	ldsha	[%g0 + %i0]0x80, %o3
	.word	0x97a0188b	! t0_kref+0x272c:   	fitos	%f11, %f11
	.word	0x95b28a4a	! t0_kref+0x2730:   	fpadd32	%f10, %f10, %f10
	.word	0xd51e4000	! t0_kref+0x2734:   	ldd	[%i1], %f10
	.word	0x97b2858a	! t0_kref+0x2738:   	fcmpgt32	%f10, %f10, %o3
	.word	0x95b007aa	! t0_kref+0x273c:   	fpackfix	%f10, %f10
	.word	0x95a2884a	! t0_kref+0x2740:   	faddd	%f10, %f10, %f10
	.word	0x9666a470	! t0_kref+0x2744:   	subc	%i2, 0x470, %o3
	.word	0x97a0012a	! t0_kref+0x2748:   	fabss	%f10, %f11
	.word	0x97b2ce2a	! t0_kref+0x274c:   	fands	%f11, %f10, %f11
	.word	0x960eb90c	! t0_kref+0x2750:   	and	%i2, -0x6f4, %o3
	.word	0x8143c000	! t0_kref+0x2754:   	stbar
	.word	0xc0264000	! t0_kref+0x2758:   	clr	[%i1]
	.word	0x96de801a	! t0_kref+0x275c:   	smulcc	%i2, %i2, %o3
	.word	0x9676a86c	! t0_kref+0x2760:   	udiv	%i2, 0x86c, %o3
	.word	0x97418000	! t0_kref+0x2764:   	mov	%fprs, %o3
	.word	0x96b836a6	! t0_kref+0x2768:   	xnorcc	%g0, -0x95a, %o3
	.word	0x81dabe3d	! t0_kref+0x276c:   	flush	%o2 - 0x1c3
	.word	0x97a0012b	! t0_kref+0x2770:   	fabss	%f11, %f11
	.word	0x965ea85c	! t0_kref+0x2774:   	smul	%i2, 0x85c, %o3
	call	SYM(t0_subr3)
	.word	0x95a2cd2a	! t0_kref+0x277c:   	fsmuld	%f11, %f10, %f10
	.word	0x97b00fe0	! t0_kref+0x2780:   	fones	%f11
	.word	0x97400000	! t0_kref+0x2784:   	mov	%y, %o3
	.word	0x97368000	! t0_kref+0x2788:   	srl	%i2, %g0, %o3
	.word	0xba103ff8	! t0_kref+0x278c:   	mov	0xfffffff8, %i5
	.word	0x97408000	! t0_kref+0x2790:   	mov	%ccr, %o3
	.word	0x95b28e80	! t0_kref+0x2794:   	fsrc1	%f10, %f10
	.word	0xd6164000	! t0_kref+0x2798:   	lduh	[%i1], %o3
	.word	0xc368a008	! t0_kref+0x279c:   	prefetch	%g2 + 8, 1
	.word	0xd6567ffc	! t0_kref+0x27a0:   	ldsh	[%i1 - 4], %o3
	.word	0x95a288ca	! t0_kref+0x27a4:   	fsubd	%f10, %f10, %f10
	.word	0x967e8000	! t0_kref+0x27a8:   	sdiv	%i2, %g0, %o3
	.word	0x96e68000	! t0_kref+0x27ac:   	subccc	%i2, %g0, %o3
	.word	0x2f480008	! t0_kref+0x27b0:   	fbu,a,pt	%fcc0, _kref+0x27d0
	.word	0x95a2c9aa	! t0_kref+0x27b4:   	fdivs	%f11, %f10, %f10
	.word	0x9f414000	! t0_kref+0x27b8:   	mov	%pc, %o7
	.word	0x95a000ca	! t0_kref+0x27bc:   	fnegd	%f10, %f10
	.word	0xf007bfe0	! t0_kref+0x27c0:   	ld	[%fp - 0x20], %i0
	.word	0x97b00300	! t0_kref+0x27c4:   	alignaddr	%g0, %g0, %o3
	.word	0x96d0001a	! t0_kref+0x27c8:   	umulcc	%g0, %i2, %o3
	.word	0x20800003	! t0_kref+0x27cc:   	bn,a	_kref+0x27d8
	.word	0x95b2c72b	! t0_kref+0x27d0:   	fmuld8ulx16	%f11, %f11, %f10
	.word	0xd5a6101c	! t0_kref+0x27d4:   	sta	%f10, [%i0 + %i4]0x80
	.word	0x96e03c9a	! t0_kref+0x27d8:   	subccc	%g0, -0x366, %o3
	.word	0x97b2848a	! t0_kref+0x27dc:   	fcmple32	%f10, %f10, %o3
	.word	0x95a28d2b	! t0_kref+0x27e0:   	fsmuld	%f10, %f11, %f10
	.word	0xe41e0000	! t0_kref+0x27e4:   	ldd	[%i0], %l2
	.word	0xf4ae5000	! t0_kref+0x27e8:   	stba	%i2, [%i1]0x80
	.word	0x97b2850a	! t0_kref+0x27ec:   	fcmpgt16	%f10, %f10, %o3
	.word	0x96b83400	! t0_kref+0x27f0:   	xnorcc	%g0, -0xc00, %o3
	.word	0x971eb65f	! t0_kref+0x27f4:   	tsubcctv	%i2, -0x9a1, %o3
	.word	0x97b00020	! t0_kref+0x27f8:   	edge8n	%g0, %g0, %o3
	.word	0x96968000	! t0_kref+0x27fc:   	orcc	%i2, %g0, %o3
	.word	0xb6103ff2	! t0_kref+0x2800:   	mov	0xfffffff2, %i3
	.word	0x95a2884a	! t0_kref+0x2804:   	faddd	%f10, %f10, %f10
	.word	0x97a289aa	! t0_kref+0x2808:   	fdivs	%f10, %f10, %f11
	.word	0x97b2850a	! t0_kref+0x280c:   	fcmpgt16	%f10, %f10, %o3
	.word	0x965837d9	! t0_kref+0x2810:   	smul	%g0, -0x827, %o3
	.word	0xe01e401d	! t0_kref+0x2814:   	ldd	[%i1 + %i5], %l0
	.word	0x95a2884a	! t0_kref+0x2818:   	faddd	%f10, %f10, %f10
	.word	0x96502022	! t0_kref+0x281c:   	umul	%g0, 0x22, %o3
	.word	0xc1e6501a	! t0_kref+0x2820:   	casa	[%i1]0x80, %i2, %g0
	.word	0xd696d018	! t0_kref+0x2824:   	lduha	[%i3 + %i0]0x80, %o3
	.word	0x95a0188b	! t0_kref+0x2828:   	fitos	%f11, %f10
	.word	0x9738001a	! t0_kref+0x282c:   	sra	%g0, %i2, %o3
	.word	0xd6167fea	! t0_kref+0x2830:   	lduh	[%i1 - 0x16], %o3
	.word	0x97b0013a	! t0_kref+0x2834:   	edge32n	%g0, %i2, %o3
	.word	0x95a2cd2a	! t0_kref+0x2838:   	fsmuld	%f11, %f10, %f10
	.word	0x95a0012b	! t0_kref+0x283c:   	fabss	%f11, %f10
	.word	0x96a82f6e	! t0_kref+0x2840:   	andncc	%g0, 0xf6e, %o3
	.word	0x86102001	! t0_kref+0x2844:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x2848:   	bne,a	_kref+0x2848
	.word	0x86a0e001	! t0_kref+0x284c:   	subcc	%g3, 1, %g3
	.word	0x95a0012a	! t0_kref+0x2850:   	fabss	%f10, %f10
	.word	0xd51f4019	! t0_kref+0x2854:   	ldd	[%i5 + %i1], %f10
	.word	0x97a0012b	! t0_kref+0x2858:   	fabss	%f11, %f11
	.word	0x96580000	! t0_kref+0x285c:   	smul	%g0, %g0, %o3
	.word	0x97b0003a	! t0_kref+0x2860:   	edge8n	%g0, %i2, %o3
	.word	0xd51fbc28	! t0_kref+0x2864:   	ldd	[%fp - 0x3d8], %f10
	.word	0x95a2c82b	! t0_kref+0x2868:   	fadds	%f11, %f11, %f10
	.word	0xd6567fe4	! t0_kref+0x286c:   	ldsh	[%i1 - 0x1c], %o3
	.word	0x31800004	! t0_kref+0x2870:   	fba,a	_kref+0x2880
	.word	0x96d02b83	! t0_kref+0x2874:   	umulcc	%g0, 0xb83, %o3
	.word	0x97b68240	! t0_kref+0x2878:   	array16	%i2, %g0, %o3
	.word	0x9f414000	! t0_kref+0x287c:   	mov	%pc, %o7
	.word	0x96e68000	! t0_kref+0x2880:   	subccc	%i2, %g0, %o3
	.word	0x95a2894a	! t0_kref+0x2884:   	fmuld	%f10, %f10, %f10
	.word	0x95a2894a	! t0_kref+0x2888:   	fmuld	%f10, %f10, %f10
	.word	0xd6063fec	! t0_kref+0x288c:   	ld	[%i0 - 0x14], %o3
	.word	0x96a68000	! t0_kref+0x2890:   	subcc	%i2, %g0, %o3
	.word	0x9608001a	! t0_kref+0x2894:   	and	%g0, %i2, %o3
	.word	0x9616ad88	! t0_kref+0x2898:   	or	%i2, 0xd88, %o3
	.word	0x9666801a	! t0_kref+0x289c:   	subc	%i2, %i2, %o3
	.word	0xd6063ffc	! t0_kref+0x28a0:   	ld	[%i0 - 4], %o3
	.word	0x96e6a9e2	! t0_kref+0x28a4:   	subccc	%i2, 0x9e2, %o3
	.word	0x95b28e80	! t0_kref+0x28a8:   	fsrc1	%f10, %f10
	.word	0x9638315a	! t0_kref+0x28ac:   	xnor	%g0, -0xea6, %o3
	.word	0x95a2894a	! t0_kref+0x28b0:   	fmuld	%f10, %f10, %f10
	.word	0xd650a036	! t0_kref+0x28b4:   	ldsh	[%g2 + 0x36], %o3
	.word	0xd51f4019	! t0_kref+0x28b8:   	ldd	[%i5 + %i1], %f10
	.word	0x81800000	! t0_kref+0x28bc:   	mov	%g0, %y
	.word	0x97a289ab	! t0_kref+0x28c0:   	fdivs	%f10, %f11, %f11
	.word	0x95b28eeb	! t0_kref+0x28c4:   	fornot2s	%f10, %f11, %f10
	.word	0xe03e001d	! t0_kref+0x28c8:   	std	%l0, [%i0 + %i5]
	.word	0x81aa8a2a	! t0_kref+0x28cc:   	fcmps	%fcc0, %f10, %f10
	.word	0x96beb307	! t0_kref+0x28d0:   	xnorcc	%i2, -0xcf9, %o3
	.word	0x9680001a	! t0_kref+0x28d4:   	addcc	%g0, %i2, %o3
	.word	0x9620001a	! t0_kref+0x28d8:   	neg	%i2, %o3
	.word	0xe66e401a	! t0_kref+0x28dc:   	ldstub	[%i1 + %i2], %l3
	.word	0x97a0012b	! t0_kref+0x28e0:   	fabss	%f11, %f11
	.word	0x9676b89b	! t0_kref+0x28e4:   	udiv	%i2, -0x765, %o3
	.word	0x9730001a	! t0_kref+0x28e8:   	srl	%g0, %i2, %o3
	.word	0x172dd265	! t0_kref+0x28ec:   	sethi	%hi(0xb7499400), %o3
	.word	0xe09e7fe8	! t0_kref+0x28f0:   	ldda	[%i1 - 0x18]%asi, %l0
	.word	0x9650287a	! t0_kref+0x28f4:   	umul	%g0, 0x87a, %o3
	.word	0x96402bcd	! t0_kref+0x28f8:   	addc	%g0, 0xbcd, %o3
	.word	0xd51e2000	! t0_kref+0x28fc:   	ldd	[%i0], %f10
	.word	0x97b68000	! t0_kref+0x2900:   	edge8	%i2, %g0, %o3
	.word	0x96f8357d	! t0_kref+0x2904:   	sdivcc	%g0, -0xa83, %o3
	.word	0x965e8000	! t0_kref+0x2908:   	smul	%i2, %g0, %o3
	.word	0x96503874	! t0_kref+0x290c:   	umul	%g0, -0x78c, %o3
	.word	0x97000000	! t0_kref+0x2910:   	taddcc	%g0, %g0, %o3
	.word	0x96200000	! t0_kref+0x2914:   	neg	%g0, %o3
	.word	0x9666801a	! t0_kref+0x2918:   	subc	%i2, %i2, %o3
	.word	0x8610200b	! t0_kref+0x291c:   	mov	0xb, %g3
	.word	0x86a0e001	! t0_kref+0x2920:   	subcc	%g3, 1, %g3
	.word	0x2280000a	! t0_kref+0x2924:   	be,a	_kref+0x294c
	.word	0x97b00c20	! t0_kref+0x2928:   	fzeros	%f11
	.word	0x97a01a4a	! t0_kref+0x292c:   	fdtoi	%f10, %f11
	.word	0x95a2894a	! t0_kref+0x2930:   	fmuld	%f10, %f10, %f10
	.word	0x96902e65	! t0_kref+0x2934:   	orcc	%g0, 0xe65, %o3
	.word	0x97400000	! t0_kref+0x2938:   	mov	%y, %o3
	.word	0xd53e401d	! t0_kref+0x293c:   	std	%f10, [%i1 + %i5]
	.word	0xef68a045	! t0_kref+0x2940:   	prefetch	%g2 + 0x45, 23
	.word	0x234ffff7	! t0_kref+0x2944:   	fbne,a,pt	%fcc0, _kref+0x2920
	.word	0xc368a006	! t0_kref+0x2948:   	prefetch	%g2 + 6, 1
	.word	0x97a0052a	! t0_kref+0x294c:   	fsqrts	%f10, %f11
	.word	0x965e801a	! t0_kref+0x2950:   	smul	%i2, %i2, %o3
	.word	0x96f0001a	! t0_kref+0x2954:   	udivcc	%g0, %i2, %o3
	.word	0x961ebe5f	! t0_kref+0x2958:   	xor	%i2, -0x1a1, %o3
	.word	0x96a0001a	! t0_kref+0x295c:   	subcc	%g0, %i2, %o3
	.word	0xd60e4000	! t0_kref+0x2960:   	ldub	[%i1], %o3
	.word	0xd60e3fec	! t0_kref+0x2964:   	ldub	[%i0 - 0x14], %o3
	.word	0x9646ab23	! t0_kref+0x2968:   	addc	%i2, 0xb23, %o3
	.word	0xd6480019	! t0_kref+0x296c:   	ldsb	[%g0 + %i1], %o3
	.word	0x9716ad8f	! t0_kref+0x2970:   	taddcctv	%i2, 0xd8f, %o3
	.word	0x960833d7	! t0_kref+0x2974:   	and	%g0, -0xc29, %o3
	.word	0x96368000	! t0_kref+0x2978:   	orn	%i2, %g0, %o3
	.word	0xd51fbc98	! t0_kref+0x297c:   	ldd	[%fp - 0x368], %f10
	.word	0x97b00300	! t0_kref+0x2980:   	alignaddr	%g0, %g0, %o3
	.word	0x9608277b	! t0_kref+0x2984:   	and	%g0, 0x77b, %o3
	.word	0x95a289ca	! t0_kref+0x2988:   	fdivd	%f10, %f10, %f10
	.word	0x9646a12a	! t0_kref+0x298c:   	addc	%i2, 0x12a, %o3
	.word	0x97b00ceb	! t0_kref+0x2990:   	fnot2s	%f11, %f11
	.word	0xd6066010	! t0_kref+0x2994:   	ld	[%i1 + 0x10], %o3
	.word	0x3f800005	! t0_kref+0x2998:   	fbo,a	_kref+0x29ac
	.word	0xd1be5880	! t0_kref+0x299c:   	stda	%f8, [%i1]0xc4
	.word	0x97a2c82a	! t0_kref+0x29a0:   	fadds	%f11, %f10, %f11
	.word	0x961034fa	! t0_kref+0x29a4:   	mov	0xfffff4fa, %o3
	.word	0x95b2ccab	! t0_kref+0x29a8:   	fandnot2s	%f11, %f11, %f10
	.word	0x001fffff	! t0_kref+0x29ac:   	illtrap	0x1fffff
	.word	0x9658001a	! t0_kref+0x29b0:   	smul	%g0, %i2, %o3
	.word	0x961eacc8	! t0_kref+0x29b4:   	xor	%i2, 0xcc8, %o3
	.word	0x81868000	! t0_kref+0x29b8:   	wr	%i2, %g0, %y
	.word	0xd51e2010	! t0_kref+0x29bc:   	ldd	[%i0 + 0x10], %f10
	.word	0x81aa8aab	! t0_kref+0x29c0:   	fcmpes	%fcc0, %f10, %f11
	.word	0x81aacaaa	! t0_kref+0x29c4:   	fcmpes	%fcc0, %f11, %f10
	.word	0x38480001	! t0_kref+0x29c8:   	bgu,a,pt	%icc, _kref+0x29cc
	.word	0x965eaee2	! t0_kref+0x29cc:   	smul	%i2, 0xee2, %o3
	.word	0x97b68200	! t0_kref+0x29d0:   	array8	%i2, %g0, %o3
	.word	0x96180000	! t0_kref+0x29d4:   	xor	%g0, %g0, %o3
	.word	0xd1bf1a59	! t0_kref+0x29d8:   	stda	%f8, [%i4 + %i1]0xd2
	.word	0x39800005	! t0_kref+0x29dc:   	fbuge,a	_kref+0x29f0
	.word	0xe41e401d	! t0_kref+0x29e0:   	ldd	[%i1 + %i5], %l2
	.word	0x961eae54	! t0_kref+0x29e4:   	xor	%i2, 0xe54, %o3
	.word	0x95a01a4a	! t0_kref+0x29e8:   	fdtoi	%f10, %f10
	.word	0x97b00c20	! t0_kref+0x29ec:   	fzeros	%f11
	.word	0x97002688	! t0_kref+0x29f0:   	taddcc	%g0, 0x688, %o3
	.word	0x9618001a	! t0_kref+0x29f4:   	xor	%g0, %i2, %o3
	.word	0x878020d0	! t0_kref+0x29f8:   	mov	0xd0, %asi
	.word	0x95a0192b	! t0_kref+0x29fc:   	fstod	%f11, %f10
	.word	0x95a2894a	! t0_kref+0x2a00:   	fmuld	%f10, %f10, %f10
	.word	0x86102003	! t0_kref+0x2a04:   	mov	0x3, %g3
	.word	0x86a0e001	! t0_kref+0x2a08:   	subcc	%g3, 1, %g3
	.word	0x2280001f	! t0_kref+0x2a0c:   	be,a	_kref+0x2a88
	.word	0xd616601e	! t0_kref+0x2a10:   	lduh	[%i1 + 0x1e], %o3
	.word	0x95a0012a	! t0_kref+0x2a14:   	fabss	%f10, %f10
	.word	0x96a0327b	! t0_kref+0x2a18:   	subcc	%g0, -0xd85, %o3
	.word	0x3a800005	! t0_kref+0x2a1c:   	bcc,a	_kref+0x2a30
	.word	0x96b00000	! t0_kref+0x2a20:   	orncc	%g0, %g0, %o3
	.word	0x9696b04c	! t0_kref+0x2a24:   	orcc	%i2, -0xfb4, %o3
	.word	0x3b800005	! t0_kref+0x2a28:   	fble,a	_kref+0x2a3c
	.word	0x96800000	! t0_kref+0x2a2c:   	addcc	%g0, %g0, %o3
	.word	0x95b28d40	! t0_kref+0x2a30:   	fnot1	%f10, %f10
	.word	0x97a0012b	! t0_kref+0x2a34:   	fabss	%f11, %f11
	.word	0x95b2874a	! t0_kref+0x2a38:   	fpack32	%f10, %f10, %f10
	.word	0x2a800007	! t0_kref+0x2a3c:   	bcs,a	_kref+0x2a58
	.word	0xe96e6000	! t0_kref+0x2a40:   	prefetch	%i1, 20
	.word	0xd6c01018	! t0_kref+0x2a44:   	ldswa	[%g0 + %i0]0x80, %o3
	.word	0xc0f65000	! t0_kref+0x2a48:   	stxa	%g0, [%i1]0x80
	.word	0x95b00fc0	! t0_kref+0x2a4c:   	fone	%f10
	.word	0x961eb492	! t0_kref+0x2a50:   	xor	%i2, -0xb6e, %o3
	.word	0x961e8000	! t0_kref+0x2a54:   	xor	%i2, %g0, %o3
	.word	0x97400000	! t0_kref+0x2a58:   	mov	%y, %o3
	.word	0x9618001a	! t0_kref+0x2a5c:   	xor	%g0, %i2, %o3
	.word	0xd6063fe4	! t0_kref+0x2a60:   	ld	[%i0 - 0x1c], %o3
	.word	0x95a0054a	! t0_kref+0x2a64:   	fsqrtd	%f10, %f10
	.word	0x95a2882a	! t0_kref+0x2a68:   	fadds	%f10, %f10, %f10
	.word	0x95a2894a	! t0_kref+0x2a6c:   	fmuld	%f10, %f10, %f10
	.word	0xd1be1880	! t0_kref+0x2a70:   	stda	%f8, [%i0]0xc4
	.word	0x17218046	! t0_kref+0x2a74:   	sethi	%hi(0x86011800), %o3
	.word	0x95b2870a	! t0_kref+0x2a78:   	fmuld8sux16	%f10, %f10, %f10
	.word	0xd51e6000	! t0_kref+0x2a7c:   	ldd	[%i1], %f10
	.word	0xe01f4019	! t0_kref+0x2a80:   	ldd	[%i5 + %i1], %l0
	.word	0x97a2c9ab	! t0_kref+0x2a84:   	fdivs	%f11, %f11, %f11
	.word	0x95a0192a	! t0_kref+0x2a88:   	fstod	%f10, %f10
	.word	0xd51e7ff8	! t0_kref+0x2a8c:   	ldd	[%i1 - 8], %f10
	.word	0x81580000	! t0_kref+0x2a90:   	flushw
	.word	0x96982cd8	! t0_kref+0x2a94:   	xorcc	%g0, 0xcd8, %o3
	.word	0x9686801a	! t0_kref+0x2a98:   	addcc	%i2, %i2, %o3
	.word	0x9620001a	! t0_kref+0x2a9c:   	neg	%i2, %o3
	.word	0x95b00c20	! t0_kref+0x2aa0:   	fzeros	%f10
	.word	0x97a0188b	! t0_kref+0x2aa4:   	fitos	%f11, %f11
	.word	0x95b2c72b	! t0_kref+0x2aa8:   	fmuld8ulx16	%f11, %f11, %f10
	.word	0x95a0054a	! t0_kref+0x2aac:   	fsqrtd	%f10, %f10
	.word	0x97302009	! t0_kref+0x2ab0:   	srl	%g0, 0x9, %o3
	.word	0x3c480006	! t0_kref+0x2ab4:   	bpos,a,pt	%icc, _kref+0x2acc
	.word	0x9676801a	! t0_kref+0x2ab8:   	udiv	%i2, %i2, %o3
	.word	0x97b00100	! t0_kref+0x2abc:   	edge32	%g0, %g0, %o3
	.word	0x97b00000	! t0_kref+0x2ac0:   	edge8	%g0, %g0, %o3
	.word	0x97a2c9aa	! t0_kref+0x2ac4:   	fdivs	%f11, %f10, %f11
	.word	0x96582b28	! t0_kref+0x2ac8:   	smul	%g0, 0xb28, %o3
	.word	0x971e801a	! t0_kref+0x2acc:   	tsubcctv	%i2, %i2, %o3
	.word	0x95a2894a	! t0_kref+0x2ad0:   	fmuld	%f10, %f10, %f10
	.word	0x95a0192a	! t0_kref+0x2ad4:   	fstod	%f10, %f10
	.word	0x96502c7e	! t0_kref+0x2ad8:   	umul	%g0, 0xc7e, %o3
	.word	0xd656401b	! t0_kref+0x2adc:   	ldsh	[%i1 + %i3], %o3
	.word	0x95a018ca	! t0_kref+0x2ae0:   	fdtos	%f10, %f10
	.word	0x95b2874a	! t0_kref+0x2ae4:   	fpack32	%f10, %f10, %f10
	.word	0x96c68000	! t0_kref+0x2ae8:   	addccc	%i2, %g0, %o3
	.word	0x95a0054a	! t0_kref+0x2aec:   	fsqrtd	%f10, %f10
	.word	0xc56e001a	! t0_kref+0x2af0:   	prefetch	%i0 + %i2, 2
	.word	0x97b2858a	! t0_kref+0x2af4:   	fcmpgt32	%f10, %f10, %o3
	.word	0x9726801a	! t0_kref+0x2af8:   	mulscc	%i2, %i2, %o3
	.word	0x97a000ab	! t0_kref+0x2afc:   	fnegs	%f11, %f11
	.word	0x96aeb872	! t0_kref+0x2b00:   	andncc	%i2, -0x78e, %o3
	.word	0xd6164000	! t0_kref+0x2b04:   	lduh	[%i1], %o3
	.word	0x97a0052a	! t0_kref+0x2b08:   	fsqrts	%f10, %f11
	.word	0xf4262018	! t0_kref+0x2b0c:   	st	%i2, [%i0 + 0x18]
	.word	0x96282d13	! t0_kref+0x2b10:   	andn	%g0, 0xd13, %o3
	.word	0x97a01a4a	! t0_kref+0x2b14:   	fdtoi	%f10, %f11
	.word	0x37800008	! t0_kref+0x2b18:   	fbge,a	_kref+0x2b38
	.word	0x95a0054a	! t0_kref+0x2b1c:   	fsqrtd	%f10, %f10
	.word	0xe03e3fe0	! t0_kref+0x2b20:   	std	%l0, [%i0 - 0x20]
	.word	0x96203991	! t0_kref+0x2b24:   	sub	%g0, -0x66f, %o3
	.word	0x96868000	! t0_kref+0x2b28:   	addcc	%i2, %g0, %o3
	.word	0xd6560000	! t0_kref+0x2b2c:   	ldsh	[%i0], %o3
	.word	0xe03f4018	! t0_kref+0x2b30:   	std	%l0, [%i5 + %i0]
	.word	0xd6901018	! t0_kref+0x2b34:   	lduha	[%g0 + %i0]0x80, %o3
	.word	0x96600000	! t0_kref+0x2b38:   	subc	%g0, %g0, %o3
	.word	0x95a28d2b	! t0_kref+0x2b3c:   	fsmuld	%f10, %f11, %f10
	.word	0x85800000	! t0_kref+0x2b40:   	mov	%g0, %ccr
	.word	0x9736a012	! t0_kref+0x2b44:   	srl	%i2, 0x12, %o3
	.word	0x97280000	! t0_kref+0x2b48:   	sll	%g0, %g0, %o3
	.word	0x9666b2da	! t0_kref+0x2b4c:   	subc	%i2, -0xd26, %o3
	.word	0x96f6bf6f	! t0_kref+0x2b50:   	udivcc	%i2, -0x91, %o3
	call	SYM(t0_subr0)
	.word	0x95a0192b	! t0_kref+0x2b58:   	fstod	%f11, %f10
	.word	0x96f02680	! t0_kref+0x2b5c:   	udivcc	%g0, 0x680, %o3
	.word	0x95a0192b	! t0_kref+0x2b60:   	fstod	%f11, %f10
	.word	0x97b00fe0	! t0_kref+0x2b64:   	fones	%f11
	.word	0x97400000	! t0_kref+0x2b68:   	mov	%y, %o3
	.word	0x96668000	! t0_kref+0x2b6c:   	subc	%i2, %g0, %o3
	.word	0x97b000a0	! t0_kref+0x2b70:   	edge16n	%g0, %g0, %o3
	.word	0x97b68280	! t0_kref+0x2b74:   	array32	%i2, %g0, %o3
	.word	0x96a03e6a	! t0_kref+0x2b78:   	subcc	%g0, -0x196, %o3
	.word	0x97418000	! t0_kref+0x2b7c:   	mov	%fprs, %o3
	.word	0x97b28ea0	! t0_kref+0x2b80:   	fsrc1s	%f10, %f11
	.word	0xf436001b	! t0_kref+0x2b84:   	sth	%i2, [%i0 + %i3]
	.word	0x96800000	! t0_kref+0x2b88:   	addcc	%g0, %g0, %o3
	.word	0x965e8000	! t0_kref+0x2b8c:   	smul	%i2, %g0, %o3
	.word	0x96f0001a	! t0_kref+0x2b90:   	udivcc	%g0, %i2, %o3
	.word	0x96f6801a	! t0_kref+0x2b94:   	udivcc	%i2, %i2, %o3
	.word	0x25800004	! t0_kref+0x2b98:   	fblg,a	_kref+0x2ba8
	.word	0x95a01a4a	! t0_kref+0x2b9c:   	fdtoi	%f10, %f10
	.word	0x81aa8a4a	! t0_kref+0x2ba0:   	fcmpd	%fcc0, %f10, %f10
	.word	0x96be801a	! t0_kref+0x2ba4:   	xnorcc	%i2, %i2, %o3
	.word	0x95a2894a	! t0_kref+0x2ba8:   	fmuld	%f10, %f10, %f10
	.word	0xc0270019	! t0_kref+0x2bac:   	clr	[%i4 + %i1]
	.word	0x97408000	! t0_kref+0x2bb0:   	mov	%ccr, %o3
	.word	0x95a0052a	! t0_kref+0x2bb4:   	fsqrts	%f10, %f10
	.word	0x95b00cca	! t0_kref+0x2bb8:   	fnot2	%f10, %f10
	.word	0xd5e6101a	! t0_kref+0x2bbc:   	casa	[%i0]0x80, %i2, %o2
	.word	0x96a02ca8	! t0_kref+0x2bc0:   	subcc	%g0, 0xca8, %o3
	.word	0x9696a4c6	! t0_kref+0x2bc4:   	orcc	%i2, 0x4c6, %o3
	.word	0x96e02515	! t0_kref+0x2bc8:   	subccc	%g0, 0x515, %o3
	.word	0x95a0192a	! t0_kref+0x2bcc:   	fstod	%f10, %f10
	.word	0x97a0188b	! t0_kref+0x2bd0:   	fitos	%f11, %f11
	.word	0x81dd001d	! t0_kref+0x2bd4:   	flush	%l4 + %i5
	.word	0x8143c000	! t0_kref+0x2bd8:   	stbar
	.word	0x81dc4008	! t0_kref+0x2bdc:   	flush	%l1 + %o0
	.word	0x95b28d0a	! t0_kref+0x2be0:   	fandnot1	%f10, %f10, %f10
	.word	0x81aa8aaa	! t0_kref+0x2be4:   	fcmpes	%fcc0, %f10, %f10
	.word	0x95a0012b	! t0_kref+0x2be8:   	fabss	%f11, %f10
	.word	0xd6df5019	! t0_kref+0x2bec:   	ldxa	[%i5 + %i1]0x80, %o3
	.word	0x95b00fe0	! t0_kref+0x2bf0:   	fones	%f10
	.word	0x81b01020	! t0_kref+0x2bf4:   	siam	0x0
	.word	0x97b00fe0	! t0_kref+0x2bf8:   	fones	%f11
	.word	0x8143c000	! t0_kref+0x2bfc:   	stbar
	.word	0x8143c000	! t0_kref+0x2c00:   	stbar
	.word	0x8143c000	! t0_kref+0x2c04:   	stbar
	.word	0xe56e2010	! t0_kref+0x2c08:   	prefetch	%i0 + 0x10, 18
	.word	0x2c800004	! t0_kref+0x2c0c:   	bneg,a	_kref+0x2c1c
	.word	0x97202a5c	! t0_kref+0x2c10:   	mulscc	%g0, 0xa5c, %o3
	.word	0xd5a71019	! t0_kref+0x2c14:   	sta	%f10, [%i4 + %i1]0x80
	.word	0x95a0192b	! t0_kref+0x2c18:   	fstod	%f11, %f10
	.word	0xd64e200e	! t0_kref+0x2c1c:   	ldsb	[%i0 + 0xe], %o3
	.word	0x97a0188a	! t0_kref+0x2c20:   	fitos	%f10, %f11
	.word	0x96f00000	! t0_kref+0x2c24:   	udivcc	%g0, %g0, %o3
	.word	0x9fc10000	! t0_kref+0x2c28:   	call	%g4
	.word	0xd5180018	! t0_kref+0x2c2c:   	ldd	[%g0 + %i0], %f10
	.word	0x95a2cd2b	! t0_kref+0x2c30:   	fsmuld	%f11, %f11, %f10
	.word	0xd6901018	! t0_kref+0x2c34:   	lduha	[%g0 + %i0]0x80, %o3
	.word	0xe43e2008	! t0_kref+0x2c38:   	std	%l2, [%i0 + 8]
	.word	0x97b68200	! t0_kref+0x2c3c:   	array8	%i2, %g0, %o3
	.word	0xef68a00b	! t0_kref+0x2c40:   	prefetch	%g2 + 0xb, 23
	.word	0xd726001c	! t0_kref+0x2c44:   	st	%f11, [%i0 + %i4]
	.word	0x81aacaaa	! t0_kref+0x2c48:   	fcmpes	%fcc0, %f11, %f10
	.word	0x83414000	! t0_kref+0x2c4c:   	mov	%pc, %g1
	.word	0x95a0004a	! t0_kref+0x2c50:   	fmovd	%f10, %f10
	.word	0x96f80000	! t0_kref+0x2c54:   	sdivcc	%g0, %g0, %o3
	.word	0x95a2884a	! t0_kref+0x2c58:   	faddd	%f10, %f10, %f10
	.word	0xd616001b	! t0_kref+0x2c5c:   	lduh	[%i0 + %i3], %o3
	.word	0x97382000	! t0_kref+0x2c60:   	sra	%g0, 0x0, %o3
	.word	0xd6de1000	! t0_kref+0x2c64:   	ldxa	[%i0]0x80, %o3
	.word	0x9736a016	! t0_kref+0x2c68:   	srl	%i2, 0x16, %o3
	.word	0x95b00f0a	! t0_kref+0x2c6c:   	fsrc2	%f10, %f10
	.word	0x95b28f8a	! t0_kref+0x2c70:   	for	%f10, %f10, %f10
	.word	0xd068a017	! t0_kref+0x2c74:   	ldstub	[%g2 + 0x17], %o0
	.word	0x9696b8c3	! t0_kref+0x2c78:   	orcc	%i2, -0x73d, %o3
	.word	0xd51e7ff0	! t0_kref+0x2c7c:   	ldd	[%i1 - 0x10], %f10
	.word	0x95a0054a	! t0_kref+0x2c80:   	fsqrtd	%f10, %f10
	.word	0x17368936	! t0_kref+0x2c84:   	sethi	%hi(0xda24d800), %o3
	.word	0xd64e2003	! t0_kref+0x2c88:   	ldsb	[%i0 + 3], %o3
	.word	0x961ea1ab	! t0_kref+0x2c8c:   	xor	%i2, 0x1ab, %o3
	.word	0x9736801a	! t0_kref+0x2c90:   	srl	%i2, %i2, %o3
	.word	0x9658289b	! t0_kref+0x2c94:   	smul	%g0, 0x89b, %o3
	.word	0x9726ab29	! t0_kref+0x2c98:   	mulscc	%i2, 0xb29, %o3
	.word	0x97b0031a	! t0_kref+0x2c9c:   	alignaddr	%g0, %i2, %o3
	.word	0x960eb317	! t0_kref+0x2ca0:   	and	%i2, -0xce9, %o3
	.word	0xb4102016	! t0_kref+0x2ca4:   	mov	0x16, %i2
	.word	0x17344bdc	! t0_kref+0x2ca8:   	sethi	%hi(0xd12f7000), %o3
	.word	0xd606401c	! t0_kref+0x2cac:   	ld	[%i1 + %i4], %o3
	.word	0x95b28a4a	! t0_kref+0x2cb0:   	fpadd32	%f10, %f10, %f10
	.word	0x96f6801a	! t0_kref+0x2cb4:   	udivcc	%i2, %i2, %o3
	.word	0xe01e401d	! t0_kref+0x2cb8:   	ldd	[%i1 + %i5], %l0
	.word	0xe01e7fe0	! t0_kref+0x2cbc:   	ldd	[%i1 - 0x20], %l0
	.word	0x21480005	! t0_kref+0x2cc0:   	fbn,a,pt	%fcc0, _kref+0x2cd4
	.word	0x97b2848a	! t0_kref+0x2cc4:   	fcmple32	%f10, %f10, %o3
	.word	0x96be8000	! t0_kref+0x2cc8:   	xnorcc	%i2, %g0, %o3
	.word	0x97b2848a	! t0_kref+0x2ccc:   	fcmple32	%f10, %f10, %o3
	.word	0xe01e4000	! t0_kref+0x2cd0:   	ldd	[%i1], %l0
	.word	0xe41e401d	! t0_kref+0x2cd4:   	ldd	[%i1 + %i5], %l2
	.word	0x9fc00004	! t0_kref+0x2cd8:   	call	%g0 + %g4
	.word	0x95b28f8a	! t0_kref+0x2cdc:   	for	%f10, %f10, %f10
	.word	0x95a2cd2b	! t0_kref+0x2ce0:   	fsmuld	%f11, %f11, %f10
	.word	0x95a0002a	! t0_kref+0x2ce4:   	fmovs	%f10, %f10
	.word	0x96e0001a	! t0_kref+0x2ce8:   	subccc	%g0, %i2, %o3
	.word	0xe03f4019	! t0_kref+0x2cec:   	std	%l0, [%i5 + %i1]
	.word	0x95b2862a	! t0_kref+0x2cf0:   	fmul8x16	%f10, %f10, %f10
	.word	0xd7263ffc	! t0_kref+0x2cf4:   	st	%f11, [%i0 - 4]
	.word	0x9736a008	! t0_kref+0x2cf8:   	srl	%i2, 0x8, %o3
	.word	0x97a289aa	! t0_kref+0x2cfc:   	fdivs	%f10, %f10, %f11
	.word	0x96e68000	! t0_kref+0x2d00:   	subccc	%i2, %g0, %o3
	.word	0xd51e0000	! t0_kref+0x2d04:   	ldd	[%i0], %f10
	.word	0x961eaaf2	! t0_kref+0x2d08:   	xor	%i2, 0xaf2, %o3
	.word	0x9638206d	! t0_kref+0x2d0c:   	xnor	%g0, 0x6d, %o3
	.word	0x9660001a	! t0_kref+0x2d10:   	subc	%g0, %i2, %o3
	.word	0x96580000	! t0_kref+0x2d14:   	smul	%g0, %g0, %o3
	.word	0x95a0012b	! t0_kref+0x2d18:   	fabss	%f11, %f10
	.word	0x81580000	! t0_kref+0x2d1c:   	flushw
	.word	0x97b68280	! t0_kref+0x2d20:   	array32	%i2, %g0, %o3
	.word	0x97b28f6b	! t0_kref+0x2d24:   	fornot1s	%f10, %f11, %f11
	call	1f
	.empty
	.word	0x97b6831a	! t0_kref+0x2d2c:   	alignaddr	%i2, %i2, %o3
1:	.word	0x97b6805a	! t0_kref+0x2d30:   	edge8l	%i2, %i2, %o3
	.word	0xd51fbeb0	! t0_kref+0x2d34:   	ldd	[%fp - 0x150], %f10
	.word	0x3b480008	! t0_kref+0x2d38:   	fble,a,pt	%fcc0, _kref+0x2d58
	.word	0x95b2c66a	! t0_kref+0x2d3c:   	fmul8x16au	%f11, %f10, %f10
	.word	0x960e8000	! t0_kref+0x2d40:   	and	%i2, %g0, %o3
	.word	0xf4a6101c	! t0_kref+0x2d44:   	sta	%i2, [%i0 + %i4]0x80
	.word	0x95b28a4a	! t0_kref+0x2d48:   	fpadd32	%f10, %f10, %f10
	.word	0x27800008	! t0_kref+0x2d4c:   	fbul,a	_kref+0x2d6c
	.word	0x8143c000	! t0_kref+0x2d50:   	stbar
	.word	0xd60e2001	! t0_kref+0x2d54:   	ldub	[%i0 + 1], %o3
	.word	0x96568000	! t0_kref+0x2d58:   	umul	%i2, %g0, %o3
	.word	0x97408000	! t0_kref+0x2d5c:   	mov	%ccr, %o3
	.word	0x969e801a	! t0_kref+0x2d60:   	xorcc	%i2, %i2, %o3
	.word	0xd51e7fe0	! t0_kref+0x2d64:   	ldd	[%i1 - 0x20], %f10
	.word	0xec6e3fec	! t0_kref+0x2d68:   	ldstub	[%i0 - 0x14], %l6
	.word	0x97a2882a	! t0_kref+0x2d6c:   	fadds	%f10, %f10, %f11
	.word	0x96868000	! t0_kref+0x2d70:   	addcc	%i2, %g0, %o3
	.word	0x81aacaab	! t0_kref+0x2d74:   	fcmpes	%fcc0, %f11, %f11
	.word	0x97b2850a	! t0_kref+0x2d78:   	fcmpgt16	%f10, %f10, %o3
	.word	0x9fc10000	! t0_kref+0x2d7c:   	call	%g4
	.word	0x9690001a	! t0_kref+0x2d80:   	orcc	%g0, %i2, %o3
	.word	0x97a2882a	! t0_kref+0x2d84:   	fadds	%f10, %f10, %f11
	.word	0x96a6aa40	! t0_kref+0x2d88:   	subcc	%i2, 0xa40, %o3
	.word	0xe09e101d	! t0_kref+0x2d8c:   	ldda	[%i0 + %i5]0x80, %l0
	.word	0x86102001	! t0_kref+0x2d90:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x2d94:   	bne,a	_kref+0x2d94
	.word	0x86a0e001	! t0_kref+0x2d98:   	subcc	%g3, 1, %g3
	.word	0x9610001a	! t0_kref+0x2d9c:   	mov	%i2, %o3
	.word	0x95a0054a	! t0_kref+0x2da0:   	fsqrtd	%f10, %f10
	.word	0x95a0192a	! t0_kref+0x2da4:   	fstod	%f10, %f10
	.word	0x9fc10000	! t0_kref+0x2da8:   	call	%g4
	.word	0x960ea466	! t0_kref+0x2dac:   	and	%i2, 0x466, %o3
	.word	0xb8102014	! t0_kref+0x2db0:   	mov	0x14, %i4
	.word	0x3b800004	! t0_kref+0x2db4:   	fble,a	_kref+0x2dc4
	.word	0x97b2ce6b	! t0_kref+0x2db8:   	fxnors	%f11, %f11, %f11
	.word	0xd51e401d	! t0_kref+0x2dbc:   	ldd	[%i1 + %i5], %f10
	.word	0x9736801a	! t0_kref+0x2dc0:   	srl	%i2, %i2, %o3
	.word	0x95a0188a	! t0_kref+0x2dc4:   	fitos	%f10, %f10
	.word	0x95b00f2a	! t0_kref+0x2dc8:   	fsrc2s	%f10, %f10
	.word	0x95a2894a	! t0_kref+0x2dcc:   	fmuld	%f10, %f10, %f10
	.word	0x170d7787	! t0_kref+0x2dd0:   	sethi	%hi(0x35de1c00), %o3
	.word	0x96400000	! t0_kref+0x2dd4:   	addc	%g0, %g0, %o3
	.word	0x960830af	! t0_kref+0x2dd8:   	and	%g0, -0xf51, %o3
	.word	0x95a000aa	! t0_kref+0x2ddc:   	fnegs	%f10, %f10
	.word	0x95b28e80	! t0_kref+0x2de0:   	fsrc1	%f10, %f10
	.word	0x97a0012b	! t0_kref+0x2de4:   	fabss	%f11, %f11
	.word	0x95a288ca	! t0_kref+0x2de8:   	fsubd	%f10, %f10, %f10
	.word	0x95b2870a	! t0_kref+0x2dec:   	fmuld8sux16	%f10, %f10, %f10
	.word	0x96180000	! t0_kref+0x2df0:   	xor	%g0, %g0, %o3
	.word	0x81aacaab	! t0_kref+0x2df4:   	fcmpes	%fcc0, %f11, %f11
	.word	0x97a01a4a	! t0_kref+0x2df8:   	fdtoi	%f10, %f11
	.word	0xd5180019	! t0_kref+0x2dfc:   	ldd	[%g0 + %i1], %f10
	.word	0x968e801a	! t0_kref+0x2e00:   	andcc	%i2, %i2, %o3
	.word	0xd1be1800	! t0_kref+0x2e04:   	stda	%f8, [%i0]0xc0
	.word	0x960eb69e	! t0_kref+0x2e08:   	and	%i2, -0x962, %o3
	.word	0x9636801a	! t0_kref+0x2e0c:   	orn	%i2, %i2, %o3
	.word	0xd64e3ff4	! t0_kref+0x2e10:   	ldsb	[%i0 - 0xc], %o3
	.word	0x86102004	! t0_kref+0x2e14:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x2e18:   	bne,a	_kref+0x2e18
	.word	0x86a0e001	! t0_kref+0x2e1c:   	subcc	%g3, 1, %g3
	.word	0x95b28e2b	! t0_kref+0x2e20:   	fands	%f10, %f11, %f10
	.word	0x96b828cc	! t0_kref+0x2e24:   	xnorcc	%g0, 0x8cc, %o3
	.word	0x961e801a	! t0_kref+0x2e28:   	xor	%i2, %i2, %o3
	.word	0x81aa8aab	! t0_kref+0x2e2c:   	fcmpes	%fcc0, %f10, %f11
	.word	0x9764e692	! t0_kref+0x2e30:   	movl	%icc, -0x16e, %o3
	.word	0xe41e7ff8	! t0_kref+0x2e34:   	ldd	[%i1 - 8], %l2
	.word	0x8143c000	! t0_kref+0x2e38:   	stbar
	.word	0x95a0002a	! t0_kref+0x2e3c:   	fmovs	%f10, %f10
	.word	0x96d6b90a	! t0_kref+0x2e40:   	umulcc	%i2, -0x6f6, %o3
	.word	0xd5380019	! t0_kref+0x2e44:   	std	%f10, [%g0 + %i1]
	.word	0x95a0192b	! t0_kref+0x2e48:   	fstod	%f11, %f10
	.word	0x95b2872a	! t0_kref+0x2e4c:   	fmuld8ulx16	%f10, %f10, %f10
	.word	0xc12e6018	! t0_kref+0x2e50:   	st	%fsr, [%i1 + 0x18]
	.word	0x95b2898a	! t0_kref+0x2e54:   	bshuffle	%f10, %f10, %f10
	.word	0x96f6b038	! t0_kref+0x2e58:   	udivcc	%i2, -0xfc8, %o3
	.word	0x964023ac	! t0_kref+0x2e5c:   	addc	%g0, 0x3ac, %o3
	.word	0x96fe801a	! t0_kref+0x2e60:   	sdivcc	%i2, %i2, %o3
	.word	0xe43e6010	! t0_kref+0x2e64:   	std	%l2, [%i1 + 0x10]
	.word	0xf4300019	! t0_kref+0x2e68:   	sth	%i2, [%g0 + %i1]
	.word	0xf436401b	! t0_kref+0x2e6c:   	sth	%i2, [%i1 + %i3]
	.word	0x95b28e4a	! t0_kref+0x2e70:   	fxnor	%f10, %f10, %f10
	.word	0xd51e3ff0	! t0_kref+0x2e74:   	ldd	[%i0 - 0x10], %f10
	.word	0x95b28e0a	! t0_kref+0x2e78:   	fand	%f10, %f10, %f10
	.word	0xd51fbc50	! t0_kref+0x2e7c:   	ldd	[%fp - 0x3b0], %f10
	.word	0xc16e0000	! t0_kref+0x2e80:   	prefetch	%i0, 0
	.word	0x97b00140	! t0_kref+0x2e84:   	edge32l	%g0, %g0, %o3
	.word	0xc168a00f	! t0_kref+0x2e88:   	prefetch	%g2 + 0xf, 0
	.word	0x1733f1bf	! t0_kref+0x2e8c:   	sethi	%hi(0xcfc6fc00), %o3
	.word	0xe49e1000	! t0_kref+0x2e90:   	ldda	[%i0]0x80, %l2
	.word	0x95a2884a	! t0_kref+0x2e94:   	faddd	%f10, %f10, %f10
	.word	0x97408000	! t0_kref+0x2e98:   	mov	%ccr, %o3
	.word	0xd51fbf88	! t0_kref+0x2e9c:   	ldd	[%fp - 0x78], %f10
	.word	0xd6de1000	! t0_kref+0x2ea0:   	ldxa	[%i0]0x80, %o3
	.word	0x9726a176	! t0_kref+0x2ea4:   	mulscc	%i2, 0x176, %o3
	.word	0x9728201c	! t0_kref+0x2ea8:   	sll	%g0, 0x1c, %o3
	.word	0x96b00000	! t0_kref+0x2eac:   	orncc	%g0, %g0, %o3
	.word	0x97400000	! t0_kref+0x2eb0:   	mov	%y, %o3
	.word	0xd616600c	! t0_kref+0x2eb4:   	lduh	[%i1 + 0xc], %o3
	.word	0x967eb0a8	! t0_kref+0x2eb8:   	sdiv	%i2, -0xf58, %o3
	.word	0xd598105d	! t0_kref+0x2ebc:   	ldda	[%g0 + %i5]0x82, %f10
	.word	0x96f0326a	! t0_kref+0x2ec0:   	udivcc	%g0, -0xd96, %o3
	.word	0x3d800004	! t0_kref+0x2ec4:   	fbule,a	_kref+0x2ed4
	.word	0x97b00300	! t0_kref+0x2ec8:   	alignaddr	%g0, %g0, %o3
	.word	0x97382000	! t0_kref+0x2ecc:   	sra	%g0, 0x0, %o3
	.word	0x96a80000	! t0_kref+0x2ed0:   	andncc	%g0, %g0, %o3
	.word	0x96f0001a	! t0_kref+0x2ed4:   	udivcc	%g0, %i2, %o3
	.word	0x81aa8aab	! t0_kref+0x2ed8:   	fcmpes	%fcc0, %f10, %f11
	.word	0xd5981019	! t0_kref+0x2edc:   	ldda	[%g0 + %i1]0x80, %f10
	.word	0x21800008	! t0_kref+0x2ee0:   	fbn,a	_kref+0x2f00
	.word	0xd616c019	! t0_kref+0x2ee4:   	lduh	[%i3 + %i1], %o3
	.word	0xc028a01f	! t0_kref+0x2ee8:   	clrb	[%g2 + 0x1f]
	.word	0x9738001a	! t0_kref+0x2eec:   	sra	%g0, %i2, %o3
	.word	0x97400000	! t0_kref+0x2ef0:   	mov	%y, %o3
	.word	0xd3e6101a	! t0_kref+0x2ef4:   	casa	[%i0]0x80, %i2, %o1
	.word	0x96f03ddc	! t0_kref+0x2ef8:   	udivcc	%g0, -0x224, %o3
	.word	0x96582822	! t0_kref+0x2efc:   	smul	%g0, 0x822, %o3
	.word	0x96f034f3	! t0_kref+0x2f00:   	udivcc	%g0, -0xb0d, %o3
	.word	0xd6563ff6	! t0_kref+0x2f04:   	ldsh	[%i0 - 0xa], %o3
	.word	0x96e03616	! t0_kref+0x2f08:   	subccc	%g0, -0x9ea, %o3
	.word	0x3e800004	! t0_kref+0x2f0c:   	bvc,a	_kref+0x2f1c
	.word	0x95b28e4a	! t0_kref+0x2f10:   	fxnor	%f10, %f10, %f10
	.word	0x31480006	! t0_kref+0x2f14:   	fba,a,pt	%fcc0, _kref+0x2f2c
	.word	0xd656600e	! t0_kref+0x2f18:   	ldsh	[%i1 + 0xe], %o3
	.word	0x95a2884a	! t0_kref+0x2f1c:   	faddd	%f10, %f10, %f10
	.word	0x95a0192a	! t0_kref+0x2f20:   	fstod	%f10, %f10
	.word	0xd656601c	! t0_kref+0x2f24:   	ldsh	[%i1 + 0x1c], %o3
	.word	0x97b2858a	! t0_kref+0x2f28:   	fcmpgt32	%f10, %f10, %o3
	.word	0x8610200a	! t0_kref+0x2f2c:   	mov	0xa, %g3
	.word	0x86a0e001	! t0_kref+0x2f30:   	subcc	%g3, 1, %g3
	.word	0x22800001	! t0_kref+0x2f34:   	be,a	_kref+0x2f38
	.word	0x968eb2b8	! t0_kref+0x2f38:   	andcc	%i2, -0xd48, %o3
	.word	0xd6562004	! t0_kref+0x2f3c:   	ldsh	[%i0 + 4], %o3
	.word	0xd1be1800	! t0_kref+0x2f40:   	stda	%f8, [%i0]0xc0
	.word	0x97b6809a	! t0_kref+0x2f44:   	edge16	%i2, %i2, %o3
	.word	0xe09e101d	! t0_kref+0x2f48:   	ldda	[%i0 + %i5]0x80, %l0
	.word	0x97b000c0	! t0_kref+0x2f4c:   	edge16l	%g0, %g0, %o3
	.word	0x81aacaab	! t0_kref+0x2f50:   	fcmpes	%fcc0, %f11, %f11
	.word	0x9640001a	! t0_kref+0x2f54:   	addc	%g0, %i2, %o3
	.word	0x9610001a	! t0_kref+0x2f58:   	mov	%i2, %o3
	.word	0x878020d0	! t0_kref+0x2f5c:   	mov	0xd0, %asi
	.word	0x95a2894a	! t0_kref+0x2f60:   	fmuld	%f10, %f10, %f10
	.word	0xd60e2009	! t0_kref+0x2f64:   	ldub	[%i0 + 9], %o3
	.word	0x96083342	! t0_kref+0x2f68:   	and	%g0, -0xcbe, %o3
	.word	0x97400000	! t0_kref+0x2f6c:   	mov	%y, %o3
	.word	0xd51e001d	! t0_kref+0x2f70:   	ldd	[%i0 + %i5], %f10
	.word	0x95a01a2b	! t0_kref+0x2f74:   	fstoi	%f11, %f10
	.word	0x95a018ca	! t0_kref+0x2f78:   	fdtos	%f10, %f10
	.word	0x9fc10000	! t0_kref+0x2f7c:   	call	%g4
	.word	0x97b2cdaa	! t0_kref+0x2f80:   	fxors	%f11, %f10, %f11
	.word	0x96f02057	! t0_kref+0x2f84:   	udivcc	%g0, 0x57, %o3
	.word	0xe43e4000	! t0_kref+0x2f88:   	std	%l2, [%i1]
	.word	0xd6d6501b	! t0_kref+0x2f8c:   	ldsha	[%i1 + %i3]0x80, %o3
	.word	0x81aa8aca	! t0_kref+0x2f90:   	fcmped	%fcc0, %f10, %f10
	.word	0x95b28d0a	! t0_kref+0x2f94:   	fandnot1	%f10, %f10, %f10
	.word	0x95b286ea	! t0_kref+0x2f98:   	fmul8ulx16	%f10, %f10, %f10
	.word	0xf207bfe0	! t0_kref+0x2f9c:   	ld	[%fp - 0x20], %i1
	.word	0x9618001a	! t0_kref+0x2fa0:   	xor	%g0, %i2, %o3
	.word	0x95a2894a	! t0_kref+0x2fa4:   	fmuld	%f10, %f10, %f10
	.word	0xc0ae101a	! t0_kref+0x2fa8:   	stba	%g0, [%i0 + %i2]0x80
	.word	0xd6500019	! t0_kref+0x2fac:   	ldsh	[%g0 + %i1], %o3
	.word	0xe4981019	! t0_kref+0x2fb0:   	ldda	[%g0 + %i1]0x80, %l2
	.word	0xd5a71018	! t0_kref+0x2fb4:   	sta	%f10, [%i4 + %i0]0x80
	.word	0x96d03d1f	! t0_kref+0x2fb8:   	umulcc	%g0, -0x2e1, %o3
	.word	0x95a0190a	! t0_kref+0x2fbc:   	fitod	%f10, %f10
	.word	0x95a0188b	! t0_kref+0x2fc0:   	fitos	%f11, %f10
	.word	0x972ea008	! t0_kref+0x2fc4:   	sll	%i2, 0x8, %o3
	.word	0xd19f5a18	! t0_kref+0x2fc8:   	ldda	[%i5 + %i0]0xd0, %f8
	.word	0x96e0001a	! t0_kref+0x2fcc:   	subccc	%g0, %i2, %o3
	.word	0x2f800007	! t0_kref+0x2fd0:   	fbu,a	_kref+0x2fec
	.word	0x96f6a264	! t0_kref+0x2fd4:   	udivcc	%i2, 0x264, %o3
	.word	0x95b28d40	! t0_kref+0x2fd8:   	fnot1	%f10, %f10
	.word	0x95a01a2a	! t0_kref+0x2fdc:   	fstoi	%f10, %f10
	.word	0x97a0188b	! t0_kref+0x2fe0:   	fitos	%f11, %f11
	.word	0x96b8001a	! t0_kref+0x2fe4:   	xnorcc	%g0, %i2, %o3
	.word	0xc368a009	! t0_kref+0x2fe8:   	prefetch	%g2 + 9, 1
	.word	0x9738001a	! t0_kref+0x2fec:   	sra	%g0, %i2, %o3
	.word	0x97a2c82b	! t0_kref+0x2ff0:   	fadds	%f11, %f11, %f11
	.word	0x9610226d	! t0_kref+0x2ff4:   	mov	0x26d, %o3
	.word	0x2d800004	! t0_kref+0x2ff8:   	fbg,a	_kref+0x3008
	.word	0xe01e2008	! t0_kref+0x2ffc:   	ldd	[%i0 + 8], %l0
	.word	0xd51e0000	! t0_kref+0x3000:   	ldd	[%i0], %f10
	.word	0x96f0001a	! t0_kref+0x3004:   	udivcc	%g0, %i2, %o3
	.word	0x961eb77c	! t0_kref+0x3008:   	xor	%i2, -0x884, %o3
	.word	0x9728200f	! t0_kref+0x300c:   	sll	%g0, 0xf, %o3
	.word	0x97a01a2a	! t0_kref+0x3010:   	fstoi	%f10, %f11
	.word	0x96703099	! t0_kref+0x3014:   	udiv	%g0, -0xf67, %o3
	.word	0x9660001a	! t0_kref+0x3018:   	subc	%g0, %i2, %o3
	.word	0xd5871018	! t0_kref+0x301c:   	lda	[%i4 + %i0]0x80, %f10
	.word	0x96f00000	! t0_kref+0x3020:   	udivcc	%g0, %g0, %o3
	.word	0x97180000	! t0_kref+0x3024:   	tsubcctv	%g0, %g0, %o3
	.word	0x96e6a86f	! t0_kref+0x3028:   	subccc	%i2, 0x86f, %o3
	.word	0x81580000	! t0_kref+0x302c:   	flushw
	.word	0xd686101c	! t0_kref+0x3030:   	lda	[%i0 + %i4]0x80, %o3
	.word	0x95b2866b	! t0_kref+0x3034:   	fmul8x16au	%f10, %f11, %f10
	.word	0xe09f5040	! t0_kref+0x3038:   	ldda	[%i5]0x82, %l0
	.word	0xc036c019	! t0_kref+0x303c:   	clrh	[%i3 + %i1]
	.word	0x97b00cea	! t0_kref+0x3040:   	fnot2s	%f10, %f11
	.word	0x973ea01b	! t0_kref+0x3044:   	sra	%i2, 0x1b, %o3
	.word	0x97a0002b	! t0_kref+0x3048:   	fmovs	%f11, %f11
	.word	0x8143c000	! t0_kref+0x304c:   	stbar
	.word	0x95a0192b	! t0_kref+0x3050:   	fstod	%f11, %f10
	.word	0xb6103ffa	! t0_kref+0x3054:   	mov	0xfffffffa, %i3
	.word	0x9608373b	! t0_kref+0x3058:   	and	%g0, -0x8c5, %o3
	.word	0x97b000da	! t0_kref+0x305c:   	edge16l	%g0, %i2, %o3
	.word	0x96803028	! t0_kref+0x3060:   	addcc	%g0, -0xfd8, %o3
	.word	0x973ea007	! t0_kref+0x3064:   	sra	%i2, 0x7, %o3
	.word	0x96983855	! t0_kref+0x3068:   	xorcc	%g0, -0x7ab, %o3
	.word	0x969ea061	! t0_kref+0x306c:   	xorcc	%i2, 0x61, %o3
	.word	0x9616b889	! t0_kref+0x3070:   	or	%i2, -0x777, %o3
	.word	0x96568000	! t0_kref+0x3074:   	umul	%i2, %g0, %o3
	.word	0x81aa8aaa	! t0_kref+0x3078:   	fcmpes	%fcc0, %f10, %f10
	.word	0x95a0192a	! t0_kref+0x307c:   	fstod	%f10, %f10
	.word	0x95a2892a	! t0_kref+0x3080:   	fmuls	%f10, %f10, %f10
	.word	0x8143c000	! t0_kref+0x3084:   	stbar
	.word	0x95b2862a	! t0_kref+0x3088:   	fmul8x16	%f10, %f10, %f10
	.word	0x961836b7	! t0_kref+0x308c:   	xor	%g0, -0x949, %o3
	.word	0x95a0188a	! t0_kref+0x3090:   	fitos	%f10, %f10
	.word	0x95a0014a	! t0_kref+0x3094:   	fabsd	%f10, %f10
	.word	0x95a2884a	! t0_kref+0x3098:   	faddd	%f10, %f10, %f10
	.word	0x96be801a	! t0_kref+0x309c:   	xnorcc	%i2, %i2, %o3
	.word	0x97a0188a	! t0_kref+0x30a0:   	fitos	%f10, %f11
	.word	0x95a0054a	! t0_kref+0x30a4:   	fsqrtd	%f10, %f10
	.word	0xd656401b	! t0_kref+0x30a8:   	ldsh	[%i1 + %i3], %o3
	.word	0xa7802e3d	! t0_kref+0x30ac:   	mov	0xe3d, %gsr
	.word	0x95b2898a	! t0_kref+0x30b0:   	bshuffle	%f10, %f10, %f10
	.word	0x95b2c62a	! t0_kref+0x30b4:   	fmul8x16	%f11, %f10, %f10
	.word	0x9656801a	! t0_kref+0x30b8:   	umul	%i2, %i2, %o3
	.word	0x86102001	! t0_kref+0x30bc:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x30c0:   	bne,a	_kref+0x30c0
	.word	0x86a0e001	! t0_kref+0x30c4:   	subcc	%g3, 1, %g3
	.word	0x9610001a	! t0_kref+0x30c8:   	mov	%i2, %o3
	.word	0x97382007	! t0_kref+0x30cc:   	sra	%g0, 0x7, %o3
	.word	0x97408000	! t0_kref+0x30d0:   	mov	%ccr, %o3
	.word	0xe43e3ff0	! t0_kref+0x30d4:   	std	%l2, [%i0 - 0x10]
	.word	0x973ea014	! t0_kref+0x30d8:   	sra	%i2, 0x14, %o3
	.word	0x961ebd65	! t0_kref+0x30dc:   	xor	%i2, -0x29b, %o3
	.word	0x96280000	! t0_kref+0x30e0:   	andn	%g0, %g0, %o3
	.word	0x2b480004	! t0_kref+0x30e4:   	fbug,a,pt	%fcc0, _kref+0x30f4
	.word	0xd526200c	! t0_kref+0x30e8:   	st	%f10, [%i0 + 0xc]
	.word	0x95b28f8a	! t0_kref+0x30ec:   	for	%f10, %f10, %f10
	.word	0x9608351b	! t0_kref+0x30f0:   	and	%g0, -0xae5, %o3
	.word	0x95a288ca	! t0_kref+0x30f4:   	fsubd	%f10, %f10, %f10
	.word	0x97b68140	! t0_kref+0x30f8:   	edge32l	%i2, %g0, %o3
	.word	0x95a01a4a	! t0_kref+0x30fc:   	fdtoi	%f10, %f10
	.word	0x96868000	! t0_kref+0x3100:   	addcc	%i2, %g0, %o3
	.word	0x95a28d2a	! t0_kref+0x3104:   	fsmuld	%f10, %f10, %f10
	.word	0x97400000	! t0_kref+0x3108:   	mov	%y, %o3
	.word	0x963036ca	! t0_kref+0x310c:   	orn	%g0, -0x936, %o3
	.word	0x95a0192a	! t0_kref+0x3110:   	fstod	%f10, %f10
	.word	0x97400000	! t0_kref+0x3114:   	mov	%y, %o3
	.word	0x9666b2ab	! t0_kref+0x3118:   	subc	%i2, -0xd55, %o3
	.word	0xc168a041	! t0_kref+0x311c:   	prefetch	%g2 + 0x41, 0
	.word	0xd7871019	! t0_kref+0x3120:   	lda	[%i4 + %i1]0x80, %f11
	.word	0x97b6815a	! t0_kref+0x3124:   	edge32l	%i2, %i2, %o3
	.word	0x95a2cd2b	! t0_kref+0x3128:   	fsmuld	%f11, %f11, %f10
	.word	0x97b00040	! t0_kref+0x312c:   	edge8l	%g0, %g0, %o3
	.word	0x9676801a	! t0_kref+0x3130:   	udiv	%i2, %i2, %o3
	.word	0x81db801e	! t0_kref+0x3134:   	flush	%sp + %fp
	.word	0x9fc00004	! t0_kref+0x3138:   	call	%g0 + %g4
	.word	0x95b00cca	! t0_kref+0x313c:   	fnot2	%f10, %f10
	.word	0x35800008	! t0_kref+0x3140:   	fbue,a	_kref+0x3160
	.word	0x972032d3	! t0_kref+0x3144:   	mulscc	%g0, -0xd2d, %o3
	.word	0x81aa8aca	! t0_kref+0x3148:   	fcmped	%fcc0, %f10, %f10
	.word	0x95a288ca	! t0_kref+0x314c:   	fsubd	%f10, %f10, %f10
	.word	0x95a0192a	! t0_kref+0x3150:   	fstod	%f10, %f10
	.word	0xe43f4018	! t0_kref+0x3154:   	std	%l2, [%i5 + %i0]
	.word	0x81aacaab	! t0_kref+0x3158:   	fcmpes	%fcc0, %f11, %f11
	.word	0x97b00fe0	! t0_kref+0x315c:   	fones	%f11
	.word	0x81580000	! t0_kref+0x3160:   	flushw
	.word	0x95a0110a	! t0_kref+0x3164:   	fxtod	%f10, %f10
	.word	0x95a2c9aa	! t0_kref+0x3168:   	fdivs	%f11, %f10, %f10
	.word	0x8143c000	! t0_kref+0x316c:   	stbar
	.word	0x97202314	! t0_kref+0x3170:   	mulscc	%g0, 0x314, %o3
	.word	0x95a01a4a	! t0_kref+0x3174:   	fdtoi	%f10, %f10
	.word	0x96b83d58	! t0_kref+0x3178:   	xnorcc	%g0, -0x2a8, %o3
	.word	0x95a2894a	! t0_kref+0x317c:   	fmuld	%f10, %f10, %f10
	.word	0x83414000	! t0_kref+0x3180:   	mov	%pc, %g1
	.word	0xf4ae9019	! t0_kref+0x3184:   	stba	%i2, [%i2 + %i1]0x80
	.word	0x97b28aeb	! t0_kref+0x3188:   	fpsub32s	%f10, %f11, %f11
	.word	0xf4b6501b	! t0_kref+0x318c:   	stha	%i2, [%i1 + %i3]0x80
	.word	0xd19e7fe7	! t0_kref+0x3190:   	ldda	[%i1 - 0x19]%asi, %f8
	.word	0x170dd948	! t0_kref+0x3194:   	sethi	%hi(0x37652000), %o3
	.word	0x97a0188b	! t0_kref+0x3198:   	fitos	%f11, %f11
	.word	0x96f6b2cf	! t0_kref+0x319c:   	udivcc	%i2, -0xd31, %o3
	.word	0xc020a030	! t0_kref+0x31a0:   	clr	[%g2 + 0x30]
	.word	0x95b28a4a	! t0_kref+0x31a4:   	fpadd32	%f10, %f10, %f10
	.word	0x81580000	! t0_kref+0x31a8:   	flushw
	.word	0x8143c000	! t0_kref+0x31ac:   	stbar
	.word	0xc0ae101a	! t0_kref+0x31b0:   	stba	%g0, [%i0 + %i2]0x80
	.word	0xe01e001d	! t0_kref+0x31b4:   	ldd	[%i0 + %i5], %l0
	.word	0x963e801a	! t0_kref+0x31b8:   	xnor	%i2, %i2, %o3
	.word	0x2d800001	! t0_kref+0x31bc:   	fbg,a	_kref+0x31c0
	.word	0xd65e6008	! t0_kref+0x31c0:   	ldx	[%i1 + 8], %o3
	.word	0x9728201b	! t0_kref+0x31c4:   	sll	%g0, 0x1b, %o3
	.word	0xd1be5a5b	! t0_kref+0x31c8:   	stda	%f8, [%i1 + %i3]0xd2
	.word	0x31800002	! t0_kref+0x31cc:   	fba,a	_kref+0x31d4
	.word	0x970eae49	! t0_kref+0x31d0:   	tsubcc	%i2, 0xe49, %o3
	.word	0xc0f75019	! t0_kref+0x31d4:   	stxa	%g0, [%i5 + %i1]0x80
	.word	0x81800000	! t0_kref+0x31d8:   	mov	%g0, %y
	.word	0x97b00280	! t0_kref+0x31dc:   	array32	%g0, %g0, %o3
	.word	0x95b2898a	! t0_kref+0x31e0:   	bshuffle	%f10, %f10, %f10
	.word	0x966024c8	! t0_kref+0x31e4:   	subc	%g0, 0x4c8, %o3
	.word	0x29800008	! t0_kref+0x31e8:   	fbl,a	_kref+0x3208
	.word	0x95b2890a	! t0_kref+0x31ec:   	faligndata	%f10, %f10, %f10
	.word	0x9610001a	! t0_kref+0x31f0:   	mov	%i2, %o3
	.word	0xd616600e	! t0_kref+0x31f4:   	lduh	[%i1 + 0xe], %o3
	.word	0x81aacaaa	! t0_kref+0x31f8:   	fcmpes	%fcc0, %f11, %f10
	.word	0x97b6809a	! t0_kref+0x31fc:   	edge16	%i2, %i2, %o3
	.word	0x96600000	! t0_kref+0x3200:   	subc	%g0, %g0, %o3
	.word	0x96a8380a	! t0_kref+0x3204:   	andncc	%g0, -0x7f6, %o3
	.word	0x95a01a4a	! t0_kref+0x3208:   	fdtoi	%f10, %f10
	.word	0x97a2892a	! t0_kref+0x320c:   	fmuls	%f10, %f10, %f11
	.word	0x95b28c4a	! t0_kref+0x3210:   	fnor	%f10, %f10, %f10
	.word	0x9660001a	! t0_kref+0x3214:   	subc	%g0, %i2, %o3
	.word	0x95b28eca	! t0_kref+0x3218:   	fornot2	%f10, %f10, %f10
	.word	0xd1be581a	! t0_kref+0x321c:   	stda	%f8, [%i1 + %i2]0xc0
	.word	0x97b68320	! t0_kref+0x3220:   	bmask	%i2, %g0, %o3
	.word	0x97b28e2a	! t0_kref+0x3224:   	fands	%f10, %f10, %f11
	.word	0x86102001	! t0_kref+0x3228:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x322c:   	bne,a	_kref+0x322c
	.word	0x86a0e001	! t0_kref+0x3230:   	subcc	%g3, 1, %g3
	.word	0x97a01a4a	! t0_kref+0x3234:   	fdtoi	%f10, %f11
	.word	0x95a01a4a	! t0_kref+0x3238:   	fdtoi	%f10, %f10
	.word	0xd6500018	! t0_kref+0x323c:   	ldsh	[%g0 + %i0], %o3
	.word	0x95a9404a	! t0_kref+0x3240:   	fmovdug	%fcc0, %f10, %f10
	.word	0xc0f01018	! t0_kref+0x3244:   	stxa	%g0, [%g0 + %i0]0x80
	.word	0x95b007aa	! t0_kref+0x3248:   	fpackfix	%f10, %f10
	.word	0xd720a03c	! t0_kref+0x324c:   	st	%f11, [%g2 + 0x3c]
	.word	0xdbe6501a	! t0_kref+0x3250:   	casa	[%i1]0x80, %i2, %o5
	.word	0xe43e7fe0	! t0_kref+0x3254:   	std	%l2, [%i1 - 0x20]
	.word	0x95b2c62a	! t0_kref+0x3258:   	fmul8x16	%f11, %f10, %f10
	.word	0x96e03fd9	! t0_kref+0x325c:   	subccc	%g0, -0x27, %o3
	.word	0x95a2894a	! t0_kref+0x3260:   	fmuld	%f10, %f10, %f10
	.word	0x95b28d8a	! t0_kref+0x3264:   	fxor	%f10, %f10, %f10
	.word	0x9fc10000	! t0_kref+0x3268:   	call	%g4
	.word	0xe46e2015	! t0_kref+0x326c:   	ldstub	[%i0 + 0x15], %l2
	.word	0xf007bfe0	! t0_kref+0x3270:   	ld	[%fp - 0x20], %i0
	.word	0xa780209a	! t0_kref+0x3274:   	mov	0x9a, %gsr
	.word	0xd6064000	! t0_kref+0x3278:   	ld	[%i1], %o3
	.word	0x96fea2e4	! t0_kref+0x327c:   	sdivcc	%i2, 0x2e4, %o3
	.word	0x95a018ca	! t0_kref+0x3280:   	fdtos	%f10, %f10
	.word	0x95b2890a	! t0_kref+0x3284:   	faligndata	%f10, %f10, %f10
	.word	0x97b6813a	! t0_kref+0x3288:   	edge32n	%i2, %i2, %o3
	.word	0x81dbc014	! t0_kref+0x328c:   	flush	%o7 + %l4
	.word	0x95b28a4a	! t0_kref+0x3290:   	fpadd32	%f10, %f10, %f10
	.word	0x81868000	! t0_kref+0x3294:   	wr	%i2, %g0, %y
	.word	0x97282011	! t0_kref+0x3298:   	sll	%g0, 0x11, %o3
	.word	0xd6163ff6	! t0_kref+0x329c:   	lduh	[%i0 - 0xa], %o3
	.word	0xc368a005	! t0_kref+0x32a0:   	prefetch	%g2 + 5, 1
	.word	0x95b28a0a	! t0_kref+0x32a4:   	fpadd16	%f10, %f10, %f10
	.word	0x95a0054a	! t0_kref+0x32a8:   	fsqrtd	%f10, %f10
	.word	0x95a0192b	! t0_kref+0x32ac:   	fstod	%f11, %f10
	.word	0xd6566014	! t0_kref+0x32b0:   	ldsh	[%i1 + 0x14], %o3
	.word	0x97a2c9ab	! t0_kref+0x32b4:   	fdivs	%f11, %f11, %f11
	.word	0x96d6bc7e	! t0_kref+0x32b8:   	umulcc	%i2, -0x382, %o3
	.word	0x95a0054a	! t0_kref+0x32bc:   	fsqrtd	%f10, %f10
	.word	0x97b0033a	! t0_kref+0x32c0:   	bmask	%g0, %i2, %o3
	.word	0x95a2894a	! t0_kref+0x32c4:   	fmuld	%f10, %f10, %f10
	.word	0x96983053	! t0_kref+0x32c8:   	xorcc	%g0, -0xfad, %o3
	.word	0x95a01a4a	! t0_kref+0x32cc:   	fdtoi	%f10, %f10
	.word	0x96180000	! t0_kref+0x32d0:   	xor	%g0, %g0, %o3
	.word	0x95b28a8a	! t0_kref+0x32d4:   	fpsub16	%f10, %f10, %f10
	.word	0x96902e5e	! t0_kref+0x32d8:   	orcc	%g0, 0xe5e, %o3
	.word	0x969032a5	! t0_kref+0x32dc:   	orcc	%g0, -0xd5b, %o3
	.word	0x969ebb67	! t0_kref+0x32e0:   	xorcc	%i2, -0x499, %o3
	.word	0x96be8000	! t0_kref+0x32e4:   	xnorcc	%i2, %g0, %o3
	.word	0x9658001a	! t0_kref+0x32e8:   	smul	%g0, %i2, %o3
	.word	0x96880000	! t0_kref+0x32ec:   	andcc	%g0, %g0, %o3
	.word	0x97400000	! t0_kref+0x32f0:   	mov	%y, %o3
	.word	0x9736801a	! t0_kref+0x32f4:   	srl	%i2, %i2, %o3
	.word	0xe49f5019	! t0_kref+0x32f8:   	ldda	[%i5 + %i1]0x80, %l2
	.word	0xd6480018	! t0_kref+0x32fc:   	ldsb	[%g0 + %i0], %o3
	.word	0x81aaca2a	! t0_kref+0x3300:   	fcmps	%fcc0, %f11, %f10
	.word	0xd5a65000	! t0_kref+0x3304:   	sta	%f10, [%i1]0x80
	.word	0xfe483567	! t0_kref+0x3308:   	ldsb	[%g0 - 0xa99], %i7
	.word	0x961ebfbb	! t0_kref+0x330c:   	xor	%i2, -0x45, %o3
	.word	0xf007bfe0	! t0_kref+0x3310:   	ld	[%fp - 0x20], %i0
	.word	0x95b28e0a	! t0_kref+0x3314:   	fand	%f10, %f10, %f10
	.word	0x95a0192b	! t0_kref+0x3318:   	fstod	%f11, %f10
	.word	0x97b0035a	! t0_kref+0x331c:   	alignaddrl	%g0, %i2, %o3
	.word	0x96080000	! t0_kref+0x3320:   	and	%g0, %g0, %o3
	.word	0x95b28a8a	! t0_kref+0x3324:   	fpsub16	%f10, %f10, %f10
	.word	0x173f3245	! t0_kref+0x3328:   	sethi	%hi(0xfcc91400), %o3
	.word	0x96100000	! t0_kref+0x332c:   	clr	%o3
	.word	0xd608a00b	! t0_kref+0x3330:   	ldub	[%g2 + 0xb], %o3
	.word	0x969024a9	! t0_kref+0x3334:   	orcc	%g0, 0x4a9, %o3
	.word	0x9fc10000	! t0_kref+0x3338:   	call	%g4
	.word	0x97400000	! t0_kref+0x333c:   	mov	%y, %o3
	.word	0x9636b3a1	! t0_kref+0x3340:   	orn	%i2, -0xc5f, %o3
	.word	0x97a0012b	! t0_kref+0x3344:   	fabss	%f11, %f11
	.word	0x95b00f2a	! t0_kref+0x3348:   	fsrc2s	%f10, %f10
	.word	0x3d800006	! t0_kref+0x334c:   	fbule,a	_kref+0x3364
	.word	0x96582d46	! t0_kref+0x3350:   	smul	%g0, 0xd46, %o3
	.word	0x9fc00004	! t0_kref+0x3354:   	call	%g0 + %g4
	.word	0x97b68020	! t0_kref+0x3358:   	edge8n	%i2, %g0, %o3
	.word	0x965831bb	! t0_kref+0x335c:   	smul	%g0, -0xe45, %o3
	.word	0x97b28d2b	! t0_kref+0x3360:   	fandnot1s	%f10, %f11, %f11
	.word	0x960eae7b	! t0_kref+0x3364:   	and	%i2, 0xe7b, %o3
	.word	0x97b0035a	! t0_kref+0x3368:   	alignaddrl	%g0, %i2, %o3
	.word	0x961e8000	! t0_kref+0x336c:   	xor	%i2, %g0, %o3
	.word	0x8143c000	! t0_kref+0x3370:   	stbar
	.word	0x8143c000	! t0_kref+0x3374:   	stbar
	.word	0x97a0012b	! t0_kref+0x3378:   	fabss	%f11, %f11
	.word	0x9658001a	! t0_kref+0x337c:   	smul	%g0, %i2, %o3
	.word	0x96602a44	! t0_kref+0x3380:   	subc	%g0, 0xa44, %o3
	.word	0x97400000	! t0_kref+0x3384:   	mov	%y, %o3
	.word	0x97b284ca	! t0_kref+0x3388:   	fcmpne32	%f10, %f10, %o3
	.word	0x97a01a4a	! t0_kref+0x338c:   	fdtoi	%f10, %f11
	.word	0x97000000	! t0_kref+0x3390:   	taddcc	%g0, %g0, %o3
	.word	0xd586501c	! t0_kref+0x3394:   	lda	[%i1 + %i4]0x80, %f10
	.word	0xc020a020	! t0_kref+0x3398:   	clr	[%g2 + 0x20]
	.word	0x969eb3e3	! t0_kref+0x339c:   	xorcc	%i2, -0xc1d, %o3
	.word	0x95a0054a	! t0_kref+0x33a0:   	fsqrtd	%f10, %f10
	.word	0xe49f5018	! t0_kref+0x33a4:   	ldda	[%i5 + %i0]0x80, %l2
	.word	0x95a288ca	! t0_kref+0x33a8:   	fsubd	%f10, %f10, %f10
	.word	0x97b0017a	! t0_kref+0x33ac:   	edge32ln	%g0, %i2, %o3
	.word	0x95b28e4a	! t0_kref+0x33b0:   	fxnor	%f10, %f10, %f10
	.word	0x95b28f8a	! t0_kref+0x33b4:   	for	%f10, %f10, %f10
	.word	0x97a01a4a	! t0_kref+0x33b8:   	fdtoi	%f10, %f11
	.word	0xe43e2000	! t0_kref+0x33bc:   	std	%l2, [%i0]
	.word	0xf428a017	! t0_kref+0x33c0:   	stb	%i2, [%g2 + 0x17]
	.word	0xd51fbd20	! t0_kref+0x33c4:   	ldd	[%fp - 0x2e0], %f10
	.word	0x95a288ca	! t0_kref+0x33c8:   	fsubd	%f10, %f10, %f10
	.word	0xd51fbf30	! t0_kref+0x33cc:   	ldd	[%fp - 0xd0], %f10
	.word	0x95a0104a	! t0_kref+0x33d0:   	fdtox	%f10, %f10
	.word	0x96880000	! t0_kref+0x33d4:   	andcc	%g0, %g0, %o3
	.word	0xd6560000	! t0_kref+0x33d8:   	ldsh	[%i0], %o3
	.word	0xe43f4018	! t0_kref+0x33dc:   	std	%l2, [%i5 + %i0]
	.word	0xe67e401c	! t0_kref+0x33e0:   	swap	[%i1 + %i4], %l3
	.word	0x95a2894a	! t0_kref+0x33e4:   	fmuld	%f10, %f10, %f10
	.word	0x97180000	! t0_kref+0x33e8:   	tsubcctv	%g0, %g0, %o3
	.word	0x22800003	! t0_kref+0x33ec:   	be,a	_kref+0x33f8
	.word	0x96b025cb	! t0_kref+0x33f0:   	orncc	%g0, 0x5cb, %o3
	.word	0x97400000	! t0_kref+0x33f4:   	mov	%y, %o3
	.word	0x97380000	! t0_kref+0x33f8:   	sra	%g0, %g0, %o3
	.word	0x97a01a4a	! t0_kref+0x33fc:   	fdtoi	%f10, %f11
	.word	0x95a2cd2b	! t0_kref+0x3400:   	fsmuld	%f11, %f11, %f10
	.word	0x95b007aa	! t0_kref+0x3404:   	fpackfix	%f10, %f10
	.word	0x9690294d	! t0_kref+0x3408:   	orcc	%g0, 0x94d, %o3
	.word	0x97b00160	! t0_kref+0x340c:   	edge32ln	%g0, %g0, %o3
	.word	0x97a2882a	! t0_kref+0x3410:   	fadds	%f10, %f10, %f11
	.word	0x971e8000	! t0_kref+0x3414:   	tsubcctv	%i2, %g0, %o3
	.word	0xe4981018	! t0_kref+0x3418:   	ldda	[%g0 + %i0]0x80, %l2
	.word	0x96f03fb5	! t0_kref+0x341c:   	udivcc	%g0, -0x4b, %o3
	.word	0x95a2894a	! t0_kref+0x3420:   	fmuld	%f10, %f10, %f10
	.word	0x97b68100	! t0_kref+0x3424:   	edge32	%i2, %g0, %o3
	.word	0x965026f3	! t0_kref+0x3428:   	umul	%g0, 0x6f3, %o3
	.word	0x95ab804a	! t0_kref+0x342c:   	fmovdule	%fcc0, %f10, %f10
	.word	0x95a288ca	! t0_kref+0x3430:   	fsubd	%f10, %f10, %f10
	.word	0xc0367fee	! t0_kref+0x3434:   	clrh	[%i1 - 0x12]
	.word	0x97a01a2a	! t0_kref+0x3438:   	fstoi	%f10, %f11
	.word	0xd68e9019	! t0_kref+0x343c:   	lduba	[%i2 + %i1]0x80, %o3
	.word	0x960ea058	! t0_kref+0x3440:   	and	%i2, 0x58, %o3
	.word	0x95b28d40	! t0_kref+0x3444:   	fnot1	%f10, %f10
	.word	0x97b0031a	! t0_kref+0x3448:   	alignaddr	%g0, %i2, %o3
	.word	0xd51fbd90	! t0_kref+0x344c:   	ldd	[%fp - 0x270], %f10
	.word	0x96468000	! t0_kref+0x3450:   	addc	%i2, %g0, %o3
	.word	0x95b28f8a	! t0_kref+0x3454:   	for	%f10, %f10, %f10
	.word	0xd6ce9018	! t0_kref+0x3458:   	ldsba	[%i2 + %i0]0x80, %o3
	.word	0xc168a00c	! t0_kref+0x345c:   	prefetch	%g2 + 0xc, 0
	.word	0xd7801019	! t0_kref+0x3460:   	lda	[%g0 + %i1]0x80, %f11
	.word	0x968026ff	! t0_kref+0x3464:   	addcc	%g0, 0x6ff, %o3
	.word	0x95a2894a	! t0_kref+0x3468:   	fmuld	%f10, %f10, %f10
	.word	0x96668000	! t0_kref+0x346c:   	subc	%i2, %g0, %o3
	.word	0x96580000	! t0_kref+0x3470:   	smul	%g0, %g0, %o3
	.word	0xc3ee5000	! t0_kref+0x3474:   	prefetcha	%i1, 1
	.word	0x97300000	! t0_kref+0x3478:   	srl	%g0, %g0, %o3
	.word	0xe168a082	! t0_kref+0x347c:   	prefetch	%g2 + 0x82, 16
	.word	0x81aaca2b	! t0_kref+0x3480:   	fcmps	%fcc0, %f11, %f11
	.word	0x96180000	! t0_kref+0x3484:   	xor	%g0, %g0, %o3
	.word	0x95a0052b	! t0_kref+0x3488:   	fsqrts	%f11, %f10
	.word	0xe0180018	! t0_kref+0x348c:   	ldd	[%g0 + %i0], %l0
	.word	0x96568000	! t0_kref+0x3490:   	umul	%i2, %g0, %o3
	.word	0x9680001a	! t0_kref+0x3494:   	addcc	%g0, %i2, %o3
	.word	0x95a2cd2b	! t0_kref+0x3498:   	fsmuld	%f11, %f11, %f10
	.word	0xd1be585a	! t0_kref+0x349c:   	stda	%f8, [%i1 + %i2]0xc2
	.word	0xd65e2010	! t0_kref+0x34a0:   	ldx	[%i0 + 0x10], %o3
	.word	0x96568000	! t0_kref+0x34a4:   	umul	%i2, %g0, %o3
	.word	0x97a01a4a	! t0_kref+0x34a8:   	fdtoi	%f10, %f11
	.word	0x8143c000	! t0_kref+0x34ac:   	stbar
	.word	0x878020e0	! t0_kref+0x34b0:   	mov	0xe0, %asi
	.word	0x9676801a	! t0_kref+0x34b4:   	udiv	%i2, %i2, %o3
	.word	0xd51fbe00	! t0_kref+0x34b8:   	ldd	[%fp - 0x200], %f10
	.word	0xd600a024	! t0_kref+0x34bc:   	ld	[%g2 + 0x24], %o3
	.word	0xd19f5a59	! t0_kref+0x34c0:   	ldda	[%i5 + %i1]0xd2, %f8
	.word	0x96903011	! t0_kref+0x34c4:   	orcc	%g0, -0xfef, %o3
	.word	0xd5380018	! t0_kref+0x34c8:   	std	%f10, [%g0 + %i0]
	.word	0x2c800008	! t0_kref+0x34cc:   	bneg,a	_kref+0x34ec
	.word	0x97a0188a	! t0_kref+0x34d0:   	fitos	%f10, %f11
	.word	0x97b68240	! t0_kref+0x34d4:   	array16	%i2, %g0, %o3
	.word	0x96f6801a	! t0_kref+0x34d8:   	udivcc	%i2, %i2, %o3
	.word	0x95a0192a	! t0_kref+0x34dc:   	fstod	%f10, %f10
	.word	0x96468000	! t0_kref+0x34e0:   	addc	%i2, %g0, %o3
	.word	0xe03e6010	! t0_kref+0x34e4:   	std	%l0, [%i1 + 0x10]
	.word	0x95a0002a	! t0_kref+0x34e8:   	fmovs	%f10, %f10
	.word	0x96c6a7d5	! t0_kref+0x34ec:   	addccc	%i2, 0x7d5, %o3
	.word	0xd6965000	! t0_kref+0x34f0:   	lduha	[%i1]0x80, %o3
	.word	0x9726a9a4	! t0_kref+0x34f4:   	mulscc	%i2, 0x9a4, %o3
	.word	0x96502737	! t0_kref+0x34f8:   	umul	%g0, 0x737, %o3
	.word	0x95aa404a	! t0_kref+0x34fc:   	fmovde	%fcc0, %f10, %f10
	.word	0x95b00fe0	! t0_kref+0x3500:   	fones	%f10
	.word	0x95a0002b	! t0_kref+0x3504:   	fmovs	%f11, %f10
	.word	0x96f6b989	! t0_kref+0x3508:   	udivcc	%i2, -0x677, %o3
	.word	0x878020f0	! t0_kref+0x350c:   	mov	0xf0, %asi
	.word	0x95b28eca	! t0_kref+0x3510:   	fornot2	%f10, %f10, %f10
	.word	0x97a01a4a	! t0_kref+0x3514:   	fdtoi	%f10, %f11
	.word	0xc020a000	! t0_kref+0x3518:   	clr	[%g2]
	.word	0x97a2882a	! t0_kref+0x351c:   	fadds	%f10, %f10, %f11
	.word	0x96500000	! t0_kref+0x3520:   	umul	%g0, %g0, %o3
	.word	0x96be801a	! t0_kref+0x3524:   	xnorcc	%i2, %i2, %o3
	.word	0x95a0192b	! t0_kref+0x3528:   	fstod	%f11, %f10
	.word	0x96500000	! t0_kref+0x352c:   	umul	%g0, %g0, %o3
	.word	0xd586501c	! t0_kref+0x3530:   	lda	[%i1 + %i4]0x80, %f10
	.word	0x9660001a	! t0_kref+0x3534:   	subc	%g0, %i2, %o3
	.word	0xd600a024	! t0_kref+0x3538:   	ld	[%g2 + 0x24], %o3
	.word	0xd600a020	! t0_kref+0x353c:   	ld	[%g2 + 0x20], %o3
	.word	0x2a800005	! t0_kref+0x3540:   	bcs,a	_kref+0x3554
	.word	0xe43e401d	! t0_kref+0x3544:   	std	%l2, [%i1 + %i5]
	.word	0xee6e7ffc	! t0_kref+0x3548:   	ldstub	[%i1 - 4], %l7
	.word	0x95b00c20	! t0_kref+0x354c:   	fzeros	%f10
	.word	0x95a2cd2a	! t0_kref+0x3550:   	fsmuld	%f11, %f10, %f10
	.word	0x9666b068	! t0_kref+0x3554:   	subc	%i2, -0xf98, %o3
	.word	0xc398a040	! t0_kref+0x3558:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0x95a000ca	! t0_kref+0x355c:   	fnegd	%f10, %f10
	.word	0x95a2894a	! t0_kref+0x3560:   	fmuld	%f10, %f10, %f10
	.word	0x95a0002b	! t0_kref+0x3564:   	fmovs	%f11, %f10
	.word	0x961e801a	! t0_kref+0x3568:   	xor	%i2, %i2, %o3
	.word	0x95a000ca	! t0_kref+0x356c:   	fnegd	%f10, %f10
	.word	0x9696801a	! t0_kref+0x3570:   	orcc	%i2, %i2, %o3
	.word	0x95b28d0a	! t0_kref+0x3574:   	fandnot1	%f10, %f10, %f10
	.word	0x97400000	! t0_kref+0x3578:   	mov	%y, %o3
	.word	0x96580000	! t0_kref+0x357c:   	smul	%g0, %g0, %o3
	.word	0x97b2858a	! t0_kref+0x3580:   	fcmpgt32	%f10, %f10, %o3
	.word	0xc398a040	! t0_kref+0x3584:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0x35480008	! t0_kref+0x3588:   	fbue,a,pt	%fcc0, _kref+0x35a8
	.word	0x97a01a2b	! t0_kref+0x358c:   	fstoi	%f11, %f11
	.word	0x965eb986	! t0_kref+0x3590:   	smul	%i2, -0x67a, %o3
	.word	0x81aa8a2a	! t0_kref+0x3594:   	fcmps	%fcc0, %f10, %f10
	.word	0xe01e3fe0	! t0_kref+0x3598:   	ldd	[%i0 - 0x20], %l0
	.word	0x97a0188a	! t0_kref+0x359c:   	fitos	%f10, %f11
	.word	0x9736a018	! t0_kref+0x35a0:   	srl	%i2, 0x18, %o3
	.word	0xd1be5880	! t0_kref+0x35a4:   	stda	%f8, [%i1]0xc4
	.word	0x9658266e	! t0_kref+0x35a8:   	smul	%g0, 0x66e, %o3
	.word	0xe4981019	! t0_kref+0x35ac:   	ldda	[%g0 + %i1]0x80, %l2
	.word	0x95b28a0a	! t0_kref+0x35b0:   	fpadd16	%f10, %f10, %f10
	.word	0x2a800008	! t0_kref+0x35b4:   	bcs,a	_kref+0x35d4
	.word	0xd51e6018	! t0_kref+0x35b8:   	ldd	[%i1 + 0x18], %f10
	.word	0xef68a04b	! t0_kref+0x35bc:   	prefetch	%g2 + 0x4b, 23
	.word	0x81dc7ed2	! t0_kref+0x35c0:   	flush	%l1 - 0x12e
	.word	0x9726801a	! t0_kref+0x35c4:   	mulscc	%i2, %i2, %o3
	.word	0x969030a0	! t0_kref+0x35c8:   	orcc	%g0, -0xf60, %o3
	.word	0x96968000	! t0_kref+0x35cc:   	orcc	%i2, %g0, %o3
	.word	0xd598105d	! t0_kref+0x35d0:   	ldda	[%g0 + %i5]0x82, %f10
	.word	0x95a2884a	! t0_kref+0x35d4:   	faddd	%f10, %f10, %f10
	.word	0xd6d81018	! t0_kref+0x35d8:   	ldxa	[%g0 + %i0]0x80, %o3
	.word	0x9726ba70	! t0_kref+0x35dc:   	mulscc	%i2, -0x590, %o3
	.word	0x96100000	! t0_kref+0x35e0:   	clr	%o3
	.word	0x95a2cd2b	! t0_kref+0x35e4:   	fsmuld	%f11, %f11, %f10
	.word	0x9666801a	! t0_kref+0x35e8:   	subc	%i2, %i2, %o3
	.word	0x81b01022	! t0_kref+0x35ec:   	siam	0x2
	.word	0xe3b8a080	! t0_kref+0x35f0:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x95b28c8a	! t0_kref+0x35f4:   	fandnot2	%f10, %f10, %f10
	.word	0x96183ea0	! t0_kref+0x35f8:   	xor	%g0, -0x160, %o3
	.word	0xc398a040	! t0_kref+0x35fc:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0x97b2ce2b	! t0_kref+0x3600:   	fands	%f11, %f11, %f11
	.word	0x95b009aa	! t0_kref+0x3604:   	fexpand	%f10, %f10
	.word	0xe09f5018	! t0_kref+0x3608:   	ldda	[%i5 + %i0]0x80, %l0
	.word	0x95a2884a	! t0_kref+0x360c:   	faddd	%f10, %f10, %f10
	.word	0x9770001a	! t0_kref+0x3610:   	popc	%i2, %o3
	.word	0x97b284ca	! t0_kref+0x3614:   	fcmpne32	%f10, %f10, %o3
	.word	0xd5260000	! t0_kref+0x3618:   	st	%f10, [%i0]
	.word	0xd60e7fff	! t0_kref+0x361c:   	ldub	[%i1 - 1], %o3
	.word	0x95b28eca	! t0_kref+0x3620:   	fornot2	%f10, %f10, %f10
	.word	0x9616a163	! t0_kref+0x3624:   	or	%i2, 0x163, %o3
	.word	0x95b28e80	! t0_kref+0x3628:   	fsrc1	%f10, %f10
	.word	0x95a2882b	! t0_kref+0x362c:   	fadds	%f10, %f11, %f10
	.word	0xd6066000	! t0_kref+0x3630:   	ld	[%i1], %o3
	.word	0x96d8250e	! t0_kref+0x3634:   	smulcc	%g0, 0x50e, %o3
	.word	0x960eb9f0	! t0_kref+0x3638:   	and	%i2, -0x610, %o3
	.word	0x97a0052b	! t0_kref+0x363c:   	fsqrts	%f11, %f11
	.word	0x972ea00c	! t0_kref+0x3640:   	sll	%i2, 0xc, %o3
	.word	0x95a2894a	! t0_kref+0x3644:   	fmuld	%f10, %f10, %f10
	.word	0x81aaca2a	! t0_kref+0x3648:   	fcmps	%fcc0, %f11, %f10
	.word	0x97a2c92b	! t0_kref+0x364c:   	fmuls	%f11, %f11, %f11
	.word	0x8143c000	! t0_kref+0x3650:   	stbar
	.word	0xd6163ff8	! t0_kref+0x3654:   	lduh	[%i0 - 8], %o3
	.word	0x81aacaaa	! t0_kref+0x3658:   	fcmpes	%fcc0, %f11, %f10
	.word	0x95a0110a	! t0_kref+0x365c:   	fxtod	%f10, %f10
	.word	0x97a2c8aa	! t0_kref+0x3660:   	fsubs	%f11, %f10, %f11
	.word	0x1726f0f7	! t0_kref+0x3664:   	sethi	%hi(0x9bc3dc00), %o3
	.word	0x969eb432	! t0_kref+0x3668:   	xorcc	%i2, -0xbce, %o3
	.word	0xedf61000	! t0_kref+0x366c:   	casxa	[%i0]0x80, %g0, %l6
	.word	0x81d92bd5	! t0_kref+0x3670:   	flush	%g4 + 0xbd5
	.word	0x960eb9e9	! t0_kref+0x3674:   	and	%i2, -0x617, %o3
	.word	0x95a01a4a	! t0_kref+0x3678:   	fdtoi	%f10, %f10
	.word	0xe41e6018	! t0_kref+0x367c:   	ldd	[%i1 + 0x18], %l2
	.word	0x9716801a	! t0_kref+0x3680:   	taddcctv	%i2, %i2, %o3
	.word	0x97b6811a	! t0_kref+0x3684:   	edge32	%i2, %i2, %o3
	.word	0x95a2884a	! t0_kref+0x3688:   	faddd	%f10, %f10, %f10
	.word	0x96a00000	! t0_kref+0x368c:   	subcc	%g0, %g0, %o3
	.word	0x97b28fab	! t0_kref+0x3690:   	fors	%f10, %f11, %f11
	.word	0xd51fbe58	! t0_kref+0x3694:   	ldd	[%fp - 0x1a8], %f10
	.word	0xd656c018	! t0_kref+0x3698:   	ldsh	[%i3 + %i0], %o3
	.word	0x97408000	! t0_kref+0x369c:   	mov	%ccr, %o3
	.word	0x96e68000	! t0_kref+0x36a0:   	subccc	%i2, %g0, %o3
	.word	0x96080000	! t0_kref+0x36a4:   	and	%g0, %g0, %o3
	.word	0x95b007aa	! t0_kref+0x36a8:   	fpackfix	%f10, %f10
	.word	0xe03e4000	! t0_kref+0x36ac:   	std	%l0, [%i1]
	.word	0x96b02d58	! t0_kref+0x36b0:   	orncc	%g0, 0xd58, %o3
	.word	0xd59f5018	! t0_kref+0x36b4:   	ldda	[%i5 + %i0]0x80, %f10
	.word	0x968eb419	! t0_kref+0x36b8:   	andcc	%i2, -0xbe7, %o3
	.word	0x96902974	! t0_kref+0x36bc:   	orcc	%g0, 0x974, %o3
	.word	0x2f480002	! t0_kref+0x36c0:   	fbu,a,pt	%fcc0, _kref+0x36c8
	.word	0x9608223b	! t0_kref+0x36c4:   	and	%g0, 0x23b, %o3
	.word	0x9656be5e	! t0_kref+0x36c8:   	umul	%i2, -0x1a2, %o3
	.word	0x969e801a	! t0_kref+0x36cc:   	xorcc	%i2, %i2, %o3
	.word	0x96be801a	! t0_kref+0x36d0:   	xnorcc	%i2, %i2, %o3
	.word	0x3c800008	! t0_kref+0x36d4:   	bpos,a	_kref+0x36f4
	.word	0x95a2894a	! t0_kref+0x36d8:   	fmuld	%f10, %f10, %f10
	.word	0x95a0192b	! t0_kref+0x36dc:   	fstod	%f11, %f10
	.word	0x95a0012a	! t0_kref+0x36e0:   	fabss	%f10, %f10
	.word	0x9680001a	! t0_kref+0x36e4:   	addcc	%g0, %i2, %o3
	.word	0x96f00000	! t0_kref+0x36e8:   	udivcc	%g0, %g0, %o3
	.word	0x97b2850a	! t0_kref+0x36ec:   	fcmpgt16	%f10, %f10, %o3
	.word	0x9656be21	! t0_kref+0x36f0:   	umul	%i2, -0x1df, %o3
	.word	0xd6563fee	! t0_kref+0x36f4:   	ldsh	[%i0 - 0x12], %o3
	.word	0xd46e001a	! t0_kref+0x36f8:   	ldstub	[%i0 + %i2], %o2
	.word	0x31480001	! t0_kref+0x36fc:   	fba,a,pt	%fcc0, _kref+0x3700
	.word	0x96200000	! t0_kref+0x3700:   	neg	%g0, %o3
	.word	0xd506401c	! t0_kref+0x3704:   	ld	[%i1 + %i4], %f10
	.word	0x95a0002b	! t0_kref+0x3708:   	fmovs	%f11, %f10
	.word	0x95b28f6b	! t0_kref+0x370c:   	fornot1s	%f10, %f11, %f10
	.word	0x95a288ca	! t0_kref+0x3710:   	fsubd	%f10, %f10, %f10
	.word	0x97a0002b	! t0_kref+0x3714:   	fmovs	%f11, %f11
	.word	0x96500000	! t0_kref+0x3718:   	umul	%g0, %g0, %o3
	.word	0xf207bfe0	! t0_kref+0x371c:   	ld	[%fp - 0x20], %i1
	.word	0x96f80000	! t0_kref+0x3720:   	sdivcc	%g0, %g0, %o3
	.word	0x95a0192a	! t0_kref+0x3724:   	fstod	%f10, %f10
	.word	0x96a03ce1	! t0_kref+0x3728:   	subcc	%g0, -0x31f, %o3
	.word	0x95a0052a	! t0_kref+0x372c:   	fsqrts	%f10, %f10
	.word	0x001fffff	! t0_kref+0x3730:   	illtrap	0x1fffff
	.word	0x95b28e6a	! t0_kref+0x3734:   	fxnors	%f10, %f10, %f10
	.word	0x95ab004a	! t0_kref+0x3738:   	fmovduge	%fcc0, %f10, %f10
	.word	0x965e801a	! t0_kref+0x373c:   	smul	%i2, %i2, %o3
	.word	0x95a000ca	! t0_kref+0x3740:   	fnegd	%f10, %f10
	.word	0x81800000	! t0_kref+0x3744:   	mov	%g0, %y
	.word	0xd7e61000	! t0_kref+0x3748:   	casa	[%i0]0x80, %g0, %o3
	.word	0x95b2870b	! t0_kref+0x374c:   	fmuld8sux16	%f10, %f11, %f10
	.word	0xe43e7fe8	! t0_kref+0x3750:   	std	%l2, [%i1 - 0x18]
	.word	0x97380000	! t0_kref+0x3754:   	sra	%g0, %g0, %o3
	.word	0x9fc10000	! t0_kref+0x3758:   	call	%g4
	.word	0x97a2c92b	! t0_kref+0x375c:   	fmuls	%f11, %f11, %f11
	.word	0x95a0014a	! t0_kref+0x3760:   	fabsd	%f10, %f10
	.word	0x97604000	! t0_kref+0x3764:   	movne	%fcc0, %g0, %o3
	.word	0x95a2884a	! t0_kref+0x3768:   	faddd	%f10, %f10, %f10
	.word	0x9658001a	! t0_kref+0x376c:   	smul	%g0, %i2, %o3
	.word	0x96283715	! t0_kref+0x3770:   	andn	%g0, -0x8eb, %o3
	.word	0x97400000	! t0_kref+0x3774:   	mov	%y, %o3
	.word	0x95b2866b	! t0_kref+0x3778:   	fmul8x16au	%f10, %f11, %f10
	.word	0x97a01a4a	! t0_kref+0x377c:   	fdtoi	%f10, %f11
	.word	0x96bea25c	! t0_kref+0x3780:   	xnorcc	%i2, 0x25c, %o3
	.word	0x96e00000	! t0_kref+0x3784:   	subccc	%g0, %g0, %o3
	.word	0xd6464000	! t0_kref+0x3788:   	ldsw	[%i1], %o3
	.word	0x97b28e6b	! t0_kref+0x378c:   	fxnors	%f10, %f11, %f11
	.word	0x97408000	! t0_kref+0x3790:   	mov	%ccr, %o3
	.word	0x95a2894a	! t0_kref+0x3794:   	fmuld	%f10, %f10, %f10
	.word	0xe0380019	! t0_kref+0x3798:   	std	%l0, [%g0 + %i1]
	.word	0xd5b81018	! t0_kref+0x379c:   	stda	%f10, [%g0 + %i0]0x80
	.word	0x8143c000	! t0_kref+0x37a0:   	stbar
	.word	0x95b28eea	! t0_kref+0x37a4:   	fornot2s	%f10, %f10, %f10
	.word	0xd8ee9019	! t0_kref+0x37a8:   	ldstuba	[%i2 + %i1]0x80, %o4
	.word	0x95b28a8a	! t0_kref+0x37ac:   	fpsub16	%f10, %f10, %f10
	.word	0x8143c000	! t0_kref+0x37b0:   	stbar
	.word	0x96a8001a	! t0_kref+0x37b4:   	andncc	%g0, %i2, %o3
	.word	0x96302274	! t0_kref+0x37b8:   	orn	%g0, 0x274, %o3
	.word	0xd19e9a18	! t0_kref+0x37bc:   	ldda	[%i2 + %i0]0xd0, %f8
	.word	0x96403f34	! t0_kref+0x37c0:   	addc	%g0, -0xcc, %o3
	.word	0x9618248b	! t0_kref+0x37c4:   	xor	%g0, 0x48b, %o3
	.word	0x97a0188a	! t0_kref+0x37c8:   	fitos	%f10, %f11
	.word	0x96b6a445	! t0_kref+0x37cc:   	orncc	%i2, 0x445, %o3
	.word	0x96268000	! t0_kref+0x37d0:   	sub	%i2, %g0, %o3
	.word	0x81d97a27	! t0_kref+0x37d4:   	flush	%g5 - 0x5d9
	.word	0xd66e401a	! t0_kref+0x37d8:   	ldstub	[%i1 + %i2], %o3
	.word	0x9736a004	! t0_kref+0x37dc:   	srl	%i2, 0x4, %o3
	.word	0xd6567fe0	! t0_kref+0x37e0:   	ldsh	[%i1 - 0x20], %o3
	.word	0x33480005	! t0_kref+0x37e4:   	fbe,a,pt	%fcc0, _kref+0x37f8
	.word	0xd6566002	! t0_kref+0x37e8:   	ldsh	[%i1 + 2], %o3
	.word	0x97b00320	! t0_kref+0x37ec:   	bmask	%g0, %g0, %o3
	.word	0x9646801a	! t0_kref+0x37f0:   	addc	%i2, %i2, %o3
	.word	0xe4380018	! t0_kref+0x37f4:   	std	%l2, [%g0 + %i0]
	.word	0x9730001a	! t0_kref+0x37f8:   	srl	%g0, %i2, %o3
	.word	0xe03e7ff0	! t0_kref+0x37fc:   	std	%l0, [%i1 - 0x10]
	.word	0x9616af7a	! t0_kref+0x3800:   	or	%i2, 0xf7a, %o3
	.word	0x97b00c20	! t0_kref+0x3804:   	fzeros	%f11
	.word	0xd7a71019	! t0_kref+0x3808:   	sta	%f11, [%i4 + %i1]0x80
	.word	0x97a01a4a	! t0_kref+0x380c:   	fdtoi	%f10, %f11
	.word	0x97b68320	! t0_kref+0x3810:   	bmask	%i2, %g0, %o3
	.word	0x9fc10000	! t0_kref+0x3814:   	call	%g4
	.word	0x95a2c82b	! t0_kref+0x3818:   	fadds	%f11, %f11, %f10
	.word	0x86102015	! t0_kref+0x381c:   	mov	0x15, %g3
	.word	0x86a0e001	! t0_kref+0x3820:   	subcc	%g3, 1, %g3
	.word	0x22800002	! t0_kref+0x3824:   	be,a	_kref+0x382c
	.word	0x95a2892a	! t0_kref+0x3828:   	fmuls	%f10, %f10, %f10
	.word	0xd6164000	! t0_kref+0x382c:   	lduh	[%i1], %o3
	.word	0x3d800005	! t0_kref+0x3830:   	fbule,a	_kref+0x3844
	.word	0x96f0001a	! t0_kref+0x3834:   	udivcc	%g0, %i2, %o3
	.word	0x97a0052b	! t0_kref+0x3838:   	fsqrts	%f11, %f11
	.word	0x9686a1f2	! t0_kref+0x383c:   	addcc	%i2, 0x1f2, %o3
	.word	0x96802671	! t0_kref+0x3840:   	addcc	%g0, 0x671, %o3
	.word	0xd68e9018	! t0_kref+0x3844:   	lduba	[%i2 + %i0]0x80, %o3
	.word	0xd6062010	! t0_kref+0x3848:   	ld	[%i0 + 0x10], %o3
	.word	0x97a0188b	! t0_kref+0x384c:   	fitos	%f11, %f11
	.word	0x81aacaab	! t0_kref+0x3850:   	fcmpes	%fcc0, %f11, %f11
	.word	0x97b284ca	! t0_kref+0x3854:   	fcmpne32	%f10, %f10, %o3
	.word	0x95a000ab	! t0_kref+0x3858:   	fnegs	%f11, %f10
	.word	0x96568000	! t0_kref+0x385c:   	umul	%i2, %g0, %o3
	.word	0x8d8025aa	! t0_kref+0x3860:   	mov	0x5aa, %fprs
	.word	0xe43e001d	! t0_kref+0x3864:   	std	%l2, [%i0 + %i5]
	.word	0x96902656	! t0_kref+0x3868:   	orcc	%g0, 0x656, %o3
	.word	0x97b284ca	! t0_kref+0x386c:   	fcmpne32	%f10, %f10, %o3
	.word	0x961ea3c3	! t0_kref+0x3870:   	xor	%i2, 0x3c3, %o3
	.word	0x81aa8aca	! t0_kref+0x3874:   	fcmped	%fcc0, %f10, %f10
	.word	0x29480006	! t0_kref+0x3878:   	fbl,a,pt	%fcc0, _kref+0x3890
	.word	0x95a0192b	! t0_kref+0x387c:   	fstod	%f11, %f10
	.word	0x95a288ca	! t0_kref+0x3880:   	fsubd	%f10, %f10, %f10
	.word	0xd5180018	! t0_kref+0x3884:   	ldd	[%g0 + %i0], %f10
	.word	0xd656c019	! t0_kref+0x3888:   	ldsh	[%i3 + %i1], %o3
	.word	0x9730201b	! t0_kref+0x388c:   	srl	%g0, 0x1b, %o3
	.word	0x96868000	! t0_kref+0x3890:   	addcc	%i2, %g0, %o3
	.word	0x95b28a8a	! t0_kref+0x3894:   	fpsub16	%f10, %f10, %f10
	.word	0xe01e2018	! t0_kref+0x3898:   	ldd	[%i0 + 0x18], %l0
	.word	0xb6103ff4	! t0_kref+0x389c:   	mov	0xfffffff4, %i3
	.word	0x97a2c9ab	! t0_kref+0x38a0:   	fdivs	%f11, %f11, %f11
	.word	0x95a2884a	! t0_kref+0x38a4:   	faddd	%f10, %f10, %f10
	.word	0x96883581	! t0_kref+0x38a8:   	andcc	%g0, -0xa7f, %o3
	.word	0x95a000aa	! t0_kref+0x38ac:   	fnegs	%f10, %f10
	.word	0x97a0052b	! t0_kref+0x38b0:   	fsqrts	%f11, %f11
	.word	0xd7270018	! t0_kref+0x38b4:   	st	%f11, [%i4 + %i0]
	.word	0x37800004	! t0_kref+0x38b8:   	fbge,a	_kref+0x38c8
	.word	0x96a80000	! t0_kref+0x38bc:   	andncc	%g0, %g0, %o3
	.word	0x95a0002a	! t0_kref+0x38c0:   	fmovs	%f10, %f10
	.word	0x95a000aa	! t0_kref+0x38c4:   	fnegs	%f10, %f10
	.word	0xd5e6101a	! t0_kref+0x38c8:   	casa	[%i0]0x80, %i2, %o2
	.word	0xd6881018	! t0_kref+0x38cc:   	lduba	[%g0 + %i0]0x80, %o3
	.word	0x97a0002b	! t0_kref+0x38d0:   	fmovs	%f11, %f11
	.word	0xd66e6000	! t0_kref+0x38d4:   	ldstub	[%i1], %o3
	.word	0xd51fbc90	! t0_kref+0x38d8:   	ldd	[%fp - 0x370], %f10
	.word	0x9728001a	! t0_kref+0x38dc:   	sll	%g0, %i2, %o3
	.word	0x973ea010	! t0_kref+0x38e0:   	sra	%i2, 0x10, %o3
	.word	0x96880000	! t0_kref+0x38e4:   	andcc	%g0, %g0, %o3
	.word	0x9666801a	! t0_kref+0x38e8:   	subc	%i2, %i2, %o3
	.word	0x21800004	! t0_kref+0x38ec:   	fbn,a	_kref+0x38fc
	.word	0x96b80000	! t0_kref+0x38f0:   	xnorcc	%g0, %g0, %o3
	.word	0x97a0012b	! t0_kref+0x38f4:   	fabss	%f11, %f11
	.word	0x96b831ea	! t0_kref+0x38f8:   	xnorcc	%g0, -0xe16, %o3
	.word	0x97b2848a	! t0_kref+0x38fc:   	fcmple32	%f10, %f10, %o3
	.word	0x97b00c20	! t0_kref+0x3900:   	fzeros	%f11
	.word	0x95a2884a	! t0_kref+0x3904:   	faddd	%f10, %f10, %f10
	.word	0x96880000	! t0_kref+0x3908:   	andcc	%g0, %g0, %o3
	.word	0x8143e040	! t0_kref+0x390c:   	membar	0x40
	.word	0x81b01022	! t0_kref+0x3910:   	siam	0x2
	.word	0x95a2882b	! t0_kref+0x3914:   	fadds	%f10, %f11, %f10
	.word	0x95a01a2a	! t0_kref+0x3918:   	fstoi	%f10, %f10
	.word	0x97b0011a	! t0_kref+0x391c:   	edge32	%g0, %i2, %o3
	.word	0x965e8000	! t0_kref+0x3920:   	smul	%i2, %g0, %o3
	.word	0x97400000	! t0_kref+0x3924:   	mov	%y, %o3
	.word	0x95a000ca	! t0_kref+0x3928:   	fnegd	%f10, %f10
	.word	0x83414000	! t0_kref+0x392c:   	mov	%pc, %g1
	.word	0xd6164000	! t0_kref+0x3930:   	lduh	[%i1], %o3
	.word	0x95a2884a	! t0_kref+0x3934:   	faddd	%f10, %f10, %f10
	.word	0x9738200a	! t0_kref+0x3938:   	sra	%g0, 0xa, %o3
	.word	0x96f6801a	! t0_kref+0x393c:   	udivcc	%i2, %i2, %o3
	.word	0xd53e2018	! t0_kref+0x3940:   	std	%f10, [%i0 + 0x18]
	.word	0x96200000	! t0_kref+0x3944:   	neg	%g0, %o3
	.word	0x97b2cdab	! t0_kref+0x3948:   	fxors	%f11, %f11, %f11
	.word	0x95a288ca	! t0_kref+0x394c:   	fsubd	%f10, %f10, %f10
	.word	0xf420a034	! t0_kref+0x3950:   	st	%i2, [%g2 + 0x34]
	.word	0x95a000aa	! t0_kref+0x3954:   	fnegs	%f10, %f10
	.word	0x962e8000	! t0_kref+0x3958:   	andn	%i2, %g0, %o3
	.word	0xd59f5059	! t0_kref+0x395c:   	ldda	[%i5 + %i1]0x82, %f10
	.word	0xd51fbd18	! t0_kref+0x3960:   	ldd	[%fp - 0x2e8], %f10
	.word	0xebe6501a	! t0_kref+0x3964:   	casa	[%i1]0x80, %i2, %l5
	.word	0x9762801a	! t0_kref+0x3968:   	movue	%fcc0, %i2, %o3
	.word	0x96d6801a	! t0_kref+0x396c:   	umulcc	%i2, %i2, %o3
	.word	0x37800004	! t0_kref+0x3970:   	fbge,a	_kref+0x3980
	.word	0xc398a080	! t0_kref+0x3974:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0x95b2cfaa	! t0_kref+0x3978:   	fors	%f11, %f10, %f10
	.word	0x96180000	! t0_kref+0x397c:   	xor	%g0, %g0, %o3
	.word	0x9728201e	! t0_kref+0x3980:   	sll	%g0, 0x1e, %o3
	.word	0xf4200018	! t0_kref+0x3984:   	st	%i2, [%g0 + %i0]
	.word	0xc02e3ff7	! t0_kref+0x3988:   	clrb	[%i0 - 9]
	.word	0x95a0188a	! t0_kref+0x398c:   	fitos	%f10, %f10
	.word	0x86102004	! t0_kref+0x3990:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x3994:   	bne,a	_kref+0x3994
	.word	0x86a0e001	! t0_kref+0x3998:   	subcc	%g3, 1, %g3
	.word	0x172ee778	! t0_kref+0x399c:   	sethi	%hi(0xbb9de000), %o3
	.word	0x8610201f	! t0_kref+0x39a0:   	mov	0x1f, %g3
	.word	0x86a0e001	! t0_kref+0x39a4:   	subcc	%g3, 1, %g3
	.word	0x2280001f	! t0_kref+0x39a8:   	be,a	_kref+0x3a24
	.word	0x95a28d2b	! t0_kref+0x39ac:   	fsmuld	%f10, %f11, %f10
	.word	0x973e8000	! t0_kref+0x39b0:   	sra	%i2, %g0, %o3
	.word	0x96be8000	! t0_kref+0x39b4:   	xnorcc	%i2, %g0, %o3
	.word	0x9696a25b	! t0_kref+0x39b8:   	orcc	%i2, 0x25b, %o3
	.word	0x97b2858a	! t0_kref+0x39bc:   	fcmpgt32	%f10, %f10, %o3
	.word	0x97a0012b	! t0_kref+0x39c0:   	fabss	%f11, %f11
	.word	0xe43e6018	! t0_kref+0x39c4:   	std	%l2, [%i1 + 0x18]
	.word	0xb8102018	! t0_kref+0x39c8:   	mov	0x18, %i4
	.word	0xe03e6008	! t0_kref+0x39cc:   	std	%l0, [%i1 + 8]
	.word	0xe4380019	! t0_kref+0x39d0:   	std	%l2, [%g0 + %i1]
	.word	0x96d00000	! t0_kref+0x39d4:   	umulcc	%g0, %g0, %o3
	.word	0xec6e7fe8	! t0_kref+0x39d8:   	ldstub	[%i1 - 0x18], %l6
	.word	0x95a288ca	! t0_kref+0x39dc:   	fsubd	%f10, %f10, %f10
	.word	0x97b00020	! t0_kref+0x39e0:   	edge8n	%g0, %g0, %o3
	.word	0x95b00cca	! t0_kref+0x39e4:   	fnot2	%f10, %f10
	.word	0x95a0002b	! t0_kref+0x39e8:   	fmovs	%f11, %f10
	.word	0x97a289aa	! t0_kref+0x39ec:   	fdivs	%f10, %f10, %f11
	.word	0x971eb802	! t0_kref+0x39f0:   	tsubcctv	%i2, -0x7fe, %o3
	.word	0x95a2894a	! t0_kref+0x39f4:   	fmuld	%f10, %f10, %f10
	.word	0xd616201e	! t0_kref+0x39f8:   	lduh	[%i0 + 0x1e], %o3
	.word	0x2d800004	! t0_kref+0x39fc:   	fbg,a	_kref+0x3a0c
	.word	0x9726aa32	! t0_kref+0x3a00:   	mulscc	%i2, 0xa32, %o3
	.word	0x96c0001a	! t0_kref+0x3a04:   	addccc	%g0, %i2, %o3
	.word	0xe4180019	! t0_kref+0x3a08:   	ldd	[%g0 + %i1], %l2
	.word	0x971eb8e1	! t0_kref+0x3a0c:   	tsubcctv	%i2, -0x71f, %o3
	.word	0x96180000	! t0_kref+0x3a10:   	xor	%g0, %g0, %o3
	.word	0x95a0190a	! t0_kref+0x3a14:   	fitod	%f10, %f10
	.word	0x96a80000	! t0_kref+0x3a18:   	andncc	%g0, %g0, %o3
	.word	0x95a0102a	! t0_kref+0x3a1c:   	fstox	%f10, %f10
	.word	0x95a0052b	! t0_kref+0x3a20:   	fsqrts	%f11, %f10
	.word	0x95b2c62a	! t0_kref+0x3a24:   	fmul8x16	%f11, %f10, %f10
	.word	0x97b28faa	! t0_kref+0x3a28:   	fors	%f10, %f10, %f11
	.word	0x97a000ab	! t0_kref+0x3a2c:   	fnegs	%f11, %f11
	.word	0xc020a00c	! t0_kref+0x3a30:   	clr	[%g2 + 0xc]
	.word	0x9770001a	! t0_kref+0x3a34:   	popc	%i2, %o3
	.word	0x97a0188b	! t0_kref+0x3a38:   	fitos	%f11, %f11
	.word	0xe03e7ff0	! t0_kref+0x3a3c:   	std	%l0, [%i1 - 0x10]
	.word	0x97a2892b	! t0_kref+0x3a40:   	fmuls	%f10, %f11, %f11
	.word	0x95b28f8a	! t0_kref+0x3a44:   	for	%f10, %f10, %f10
	.word	0x96080000	! t0_kref+0x3a48:   	and	%g0, %g0, %o3
	.word	0x9656801a	! t0_kref+0x3a4c:   	umul	%i2, %i2, %o3
	.word	0x81df6654	! t0_kref+0x3a50:   	flush	%i5 + 0x654
	.word	0x95b2c6ab	! t0_kref+0x3a54:   	fmul8x16al	%f11, %f11, %f10
	.word	0x9766a669	! t0_kref+0x3a58:   	movg	%icc, -0x197, %o3
	.word	0xc036001b	! t0_kref+0x3a5c:   	clrh	[%i0 + %i3]
	.word	0xe41e7fe0	! t0_kref+0x3a60:   	ldd	[%i1 - 0x20], %l2
	.word	0x96183b2c	! t0_kref+0x3a64:   	xor	%g0, -0x4d4, %o3
	.word	0x97a000ab	! t0_kref+0x3a68:   	fnegs	%f11, %f11
	.word	0x9660001a	! t0_kref+0x3a6c:   	subc	%g0, %i2, %o3
	.word	0x97b28f6a	! t0_kref+0x3a70:   	fornot1s	%f10, %f10, %f11
	.word	0x95a0192b	! t0_kref+0x3a74:   	fstod	%f11, %f10
	.word	0xd51fbf68	! t0_kref+0x3a78:   	ldd	[%fp - 0x98], %f10
	.word	0xd51e3ff8	! t0_kref+0x3a7c:   	ldd	[%i0 - 8], %f10
	.word	0xc398a080	! t0_kref+0x3a80:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0xd6c71018	! t0_kref+0x3a84:   	ldswa	[%i4 + %i0]0x80, %o3
	.word	0x96082b02	! t0_kref+0x3a88:   	and	%g0, 0xb02, %o3
	.word	0x95b28e4a	! t0_kref+0x3a8c:   	fxnor	%f10, %f10, %f10
	.word	0x97b00ceb	! t0_kref+0x3a90:   	fnot2s	%f11, %f11
	.word	0x95b28eca	! t0_kref+0x3a94:   	fornot2	%f10, %f10, %f10
	.word	0x97168000	! t0_kref+0x3a98:   	taddcctv	%i2, %g0, %o3
	.word	0xd5e6501a	! t0_kref+0x3a9c:   	casa	[%i1]0x80, %i2, %o2
	.word	0xf428a017	! t0_kref+0x3aa0:   	stb	%i2, [%g2 + 0x17]
	.word	0x81580000	! t0_kref+0x3aa4:   	flushw
	.word	0x96e00000	! t0_kref+0x3aa8:   	subccc	%g0, %g0, %o3
	.word	0x25480002	! t0_kref+0x3aac:   	fblg,a,pt	%fcc0, _kref+0x3ab4
	.word	0x967ea888	! t0_kref+0x3ab0:   	sdiv	%i2, 0x888, %o3
	.word	0xc768a086	! t0_kref+0x3ab4:   	prefetch	%g2 + 0x86, 3
	.word	0x95a2884a	! t0_kref+0x3ab8:   	faddd	%f10, %f10, %f10
	.word	0x9656b2b7	! t0_kref+0x3abc:   	umul	%i2, -0xd49, %o3
	.word	0x96b82c7e	! t0_kref+0x3ac0:   	xnorcc	%g0, 0xc7e, %o3
	.word	0xd51fbee0	! t0_kref+0x3ac4:   	ldd	[%fp - 0x120], %f10
	.word	0x37480008	! t0_kref+0x3ac8:   	fbge,a,pt	%fcc0, _kref+0x3ae8
	.word	0x97a0188b	! t0_kref+0x3acc:   	fitos	%f11, %f11
	.word	0xe4380018	! t0_kref+0x3ad0:   	std	%l2, [%g0 + %i0]
	call	SYM(t0_subr0)
	.word	0x969031f8	! t0_kref+0x3ad8:   	orcc	%g0, -0xe08, %o3
	.word	0xf5ee501b	! t0_kref+0x3adc:   	prefetcha	%i1 + %i3, 26
	.word	0x9646b652	! t0_kref+0x3ae0:   	addc	%i2, -0x9ae, %o3
	.word	0xe43e3ff0	! t0_kref+0x3ae4:   	std	%l2, [%i0 - 0x10]
	.word	0x97a0012a	! t0_kref+0x3ae8:   	fabss	%f10, %f11
	.word	0xf4300018	! t0_kref+0x3aec:   	sth	%i2, [%g0 + %i0]
	.word	0x96e6a3a7	! t0_kref+0x3af0:   	subccc	%i2, 0x3a7, %o3
	.word	0xc398a080	! t0_kref+0x3af4:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0xe01e7ff8	! t0_kref+0x3af8:   	ldd	[%i1 - 8], %l0
	.word	0x96a83ec9	! t0_kref+0x3afc:   	andncc	%g0, -0x137, %o3
	.word	0xd51e001d	! t0_kref+0x3b00:   	ldd	[%i0 + %i5], %f10
	.word	0x95a2894a	! t0_kref+0x3b04:   	fmuld	%f10, %f10, %f10
	.word	0x95a0052b	! t0_kref+0x3b08:   	fsqrts	%f11, %f10
	.word	0xc398a080	! t0_kref+0x3b0c:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0x95a2894a	! t0_kref+0x3b10:   	fmuld	%f10, %f10, %f10
	.word	0x95a28d2a	! t0_kref+0x3b14:   	fsmuld	%f10, %f10, %f10
	.word	0xd63166ea	! t0_kref+0x3b18:   	sth	%o3, [%g5 + 0x6ea]
	.word	0x95b00fe0	! t0_kref+0x3b1c:   	fones	%f10
	.word	0x96c6a219	! t0_kref+0x3b20:   	addccc	%i2, 0x219, %o3
	.word	0x95a0054a	! t0_kref+0x3b24:   	fsqrtd	%f10, %f10
	.word	0xe01e001d	! t0_kref+0x3b28:   	ldd	[%i0 + %i5], %l0
	.word	0x972ea003	! t0_kref+0x3b2c:   	sll	%i2, 0x3, %o3
	.word	0x95a2cd2b	! t0_kref+0x3b30:   	fsmuld	%f11, %f11, %f10
	.word	0xd6567ffe	! t0_kref+0x3b34:   	ldsh	[%i1 - 2], %o3
	.word	0x97a2c9aa	! t0_kref+0x3b38:   	fdivs	%f11, %f10, %f11
	.word	0x95a2894a	! t0_kref+0x3b3c:   	fmuld	%f10, %f10, %f10
	.word	0x35800003	! t0_kref+0x3b40:   	fbue,a	_kref+0x3b4c
	.word	0x95b00c20	! t0_kref+0x3b44:   	fzeros	%f10
	.word	0xd696101b	! t0_kref+0x3b48:   	lduha	[%i0 + %i3]0x80, %o3
	.word	0x95a0054a	! t0_kref+0x3b4c:   	fsqrtd	%f10, %f10
	.word	0x95a0188a	! t0_kref+0x3b50:   	fitos	%f10, %f10
	.word	0x96be8000	! t0_kref+0x3b54:   	xnorcc	%i2, %g0, %o3
	.word	0x96a8001a	! t0_kref+0x3b58:   	andncc	%g0, %i2, %o3
	.word	0x81d9401a	! t0_kref+0x3b5c:   	flush	%g5 + %i2
	.word	0x95b00ceb	! t0_kref+0x3b60:   	fnot2s	%f11, %f10
	.word	0x972ea00b	! t0_kref+0x3b64:   	sll	%i2, 0xb, %o3
	.word	0x95a28d2b	! t0_kref+0x3b68:   	fsmuld	%f10, %f11, %f10
	.word	0x95aa804a	! t0_kref+0x3b6c:   	fmovdue	%fcc0, %f10, %f10
	.word	0x96e03b65	! t0_kref+0x3b70:   	subccc	%g0, -0x49b, %o3
	.word	0x95b2898a	! t0_kref+0x3b74:   	bshuffle	%f10, %f10, %f10
	.word	0xc0263ffc	! t0_kref+0x3b78:   	clr	[%i0 - 4]
	.word	0xd64e3fe7	! t0_kref+0x3b7c:   	ldsb	[%i0 - 0x19], %o3
	.word	0x81dc8019	! t0_kref+0x3b80:   	flush	%l2 + %i1
	.word	0x95b28d40	! t0_kref+0x3b84:   	fnot1	%f10, %f10
	.word	0x9646b9ee	! t0_kref+0x3b88:   	addc	%i2, -0x612, %o3
	.word	0xe03e4000	! t0_kref+0x3b8c:   	std	%l0, [%i1]
	.word	0x81dbbb93	! t0_kref+0x3b90:   	flush	%sp - 0x46d
	.word	0x96e68000	! t0_kref+0x3b94:   	subccc	%i2, %g0, %o3
	.word	0x965ea13a	! t0_kref+0x3b98:   	smul	%i2, 0x13a, %o3
	.word	0x96102346	! t0_kref+0x3b9c:   	mov	0x346, %o3
	.word	0x969e8000	! t0_kref+0x3ba0:   	xorcc	%i2, %g0, %o3
	.word	0xe03e3ff8	! t0_kref+0x3ba4:   	std	%l0, [%i0 - 8]
	.word	0x97b6835a	! t0_kref+0x3ba8:   	alignaddrl	%i2, %i2, %o3
	.word	0x95b2c62a	! t0_kref+0x3bac:   	fmul8x16	%f11, %f10, %f10
	.word	0x8143c000	! t0_kref+0x3bb0:   	stbar
	.word	0x96be801a	! t0_kref+0x3bb4:   	xnorcc	%i2, %i2, %o3
	.word	0x96aebf76	! t0_kref+0x3bb8:   	andncc	%i2, -0x8a, %o3
	.word	0x962eaece	! t0_kref+0x3bbc:   	andn	%i2, 0xece, %o3
	.word	0x95a2884a	! t0_kref+0x3bc0:   	faddd	%f10, %f10, %f10
	.word	0xc12e001c	! t0_kref+0x3bc4:   	st	%fsr, [%i0 + %i4]
	.word	0xd7a71018	! t0_kref+0x3bc8:   	sta	%f11, [%i4 + %i0]0x80
	.word	0xd5be501d	! t0_kref+0x3bcc:   	stda	%f10, [%i1 + %i5]0x80
	.word	0xf4267fe8	! t0_kref+0x3bd0:   	st	%i2, [%i1 - 0x18]
	.word	0x973ea00b	! t0_kref+0x3bd4:   	sra	%i2, 0xb, %o3
	.word	0x962eaf08	! t0_kref+0x3bd8:   	andn	%i2, 0xf08, %o3
	.word	0x96a82947	! t0_kref+0x3bdc:   	andncc	%g0, 0x947, %o3
	.word	0x9636a496	! t0_kref+0x3be0:   	orn	%i2, 0x496, %o3
	.word	0x28800004	! t0_kref+0x3be4:   	bleu,a	_kref+0x3bf4
	.word	0x9700291e	! t0_kref+0x3be8:   	taddcc	%g0, 0x91e, %o3
	.word	0x96368000	! t0_kref+0x3bec:   	orn	%i2, %g0, %o3
	.word	0x31800003	! t0_kref+0x3bf0:   	fba,a	_kref+0x3bfc
	.word	0xd7270019	! t0_kref+0x3bf4:   	st	%f11, [%i4 + %i1]
	.word	0x97b6831a	! t0_kref+0x3bf8:   	alignaddr	%i2, %i2, %o3
	.word	0x8143e051	! t0_kref+0x3bfc:   	membar	0x51
	.word	0x3b480003	! t0_kref+0x3c00:   	fble,a,pt	%fcc0, _kref+0x3c0c
	.word	0x95a0188b	! t0_kref+0x3c04:   	fitos	%f11, %f10
	.word	0xd6064000	! t0_kref+0x3c08:   	ld	[%i1], %o3
	.word	0xe4180018	! t0_kref+0x3c0c:   	ldd	[%g0 + %i0], %l2
	.word	0x97a018ca	! t0_kref+0x3c10:   	fdtos	%f10, %f11
	.word	0xf4a6101c	! t0_kref+0x3c14:   	sta	%i2, [%i0 + %i4]0x80
	.word	0x967e801a	! t0_kref+0x3c18:   	sdiv	%i2, %i2, %o3
	.word	0x95a2892b	! t0_kref+0x3c1c:   	fmuls	%f10, %f11, %f10
	.word	0x95a2884a	! t0_kref+0x3c20:   	faddd	%f10, %f10, %f10
	.word	0x81aa8aaa	! t0_kref+0x3c24:   	fcmpes	%fcc0, %f10, %f10
	.word	0x95a2894a	! t0_kref+0x3c28:   	fmuld	%f10, %f10, %f10
	.word	0x95b00fe0	! t0_kref+0x3c2c:   	fones	%f10
	.word	0x8143c000	! t0_kref+0x3c30:   	stbar
	.word	0x8143e040	! t0_kref+0x3c34:   	membar	0x40
	.word	0x9730201e	! t0_kref+0x3c38:   	srl	%g0, 0x1e, %o3
	.word	0x95b28a0a	! t0_kref+0x3c3c:   	fpadd16	%f10, %f10, %f10
	.word	0x9fc10000	! t0_kref+0x3c40:   	call	%g4
	.word	0xd51fbf10	! t0_kref+0x3c44:   	ldd	[%fp - 0xf0], %f10
	.word	0x95a2884a	! t0_kref+0x3c48:   	faddd	%f10, %f10, %f10
	.word	0x95b2c72a	! t0_kref+0x3c4c:   	fmuld8ulx16	%f11, %f10, %f10
	.word	0x96f0001a	! t0_kref+0x3c50:   	udivcc	%g0, %i2, %o3
	.word	0x9730200e	! t0_kref+0x3c54:   	srl	%g0, 0xe, %o3
	.word	0x81800000	! t0_kref+0x3c58:   	mov	%g0, %y
	.word	0x95a2884a	! t0_kref+0x3c5c:   	faddd	%f10, %f10, %f10
	.word	0x965e8000	! t0_kref+0x3c60:   	smul	%i2, %g0, %o3
	.word	0xd51e4000	! t0_kref+0x3c64:   	ldd	[%i1], %f10
	.word	0xf420a020	! t0_kref+0x3c68:   	st	%i2, [%g2 + 0x20]
	.word	0x95a0054a	! t0_kref+0x3c6c:   	fsqrtd	%f10, %f10
	.word	0x8143c000	! t0_kref+0x3c70:   	stbar
	.word	0xd5801018	! t0_kref+0x3c74:   	lda	[%g0 + %i0]0x80, %f10
	.word	0xef68a08f	! t0_kref+0x3c78:   	prefetch	%g2 + 0x8f, 23
	.word	0xd686101c	! t0_kref+0x3c7c:   	lda	[%i0 + %i4]0x80, %o3
	.word	0x97b2854a	! t0_kref+0x3c80:   	fcmpeq16	%f10, %f10, %o3
	.word	0x96968000	! t0_kref+0x3c84:   	orcc	%i2, %g0, %o3
	.word	0x81aa8aab	! t0_kref+0x3c88:   	fcmpes	%fcc0, %f10, %f11
	.word	0x95b2862a	! t0_kref+0x3c8c:   	fmul8x16	%f10, %f10, %f10
	.word	0xd6160000	! t0_kref+0x3c90:   	lduh	[%i0], %o3
	.word	0xf4766018	! t0_kref+0x3c94:   	stx	%i2, [%i1 + 0x18]
	.word	0x97b2ceea	! t0_kref+0x3c98:   	fornot2s	%f11, %f10, %f11
	.word	0x971e801a	! t0_kref+0x3c9c:   	tsubcctv	%i2, %i2, %o3
	.word	0x96be8000	! t0_kref+0x3ca0:   	xnorcc	%i2, %g0, %o3
	.word	0xd64e600f	! t0_kref+0x3ca4:   	ldsb	[%i1 + 0xf], %o3
	.word	0x973ea014	! t0_kref+0x3ca8:   	sra	%i2, 0x14, %o3
	.word	0x95a2884a	! t0_kref+0x3cac:   	faddd	%f10, %f10, %f10
	.word	0xc807bff0	! t0_kref+0x3cb0:   	ld	[%fp - 0x10], %g4
	.word	0x9616801a	! t0_kref+0x3cb4:   	or	%i2, %i2, %o3
	.word	0x960eb693	! t0_kref+0x3cb8:   	and	%i2, -0x96d, %o3
	.word	0xe3b8a080	! t0_kref+0x3cbc:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x96868000	! t0_kref+0x3cc0:   	addcc	%i2, %g0, %o3
	.word	0xc030a038	! t0_kref+0x3cc4:   	clrh	[%g2 + 0x38]
	.word	0x33800002	! t0_kref+0x3cc8:   	fbe,a	_kref+0x3cd0
	.word	0x95b28d2b	! t0_kref+0x3ccc:   	fandnot1s	%f10, %f11, %f10
	.word	0x95a0014a	! t0_kref+0x3cd0:   	fabsd	%f10, %f10
	.word	0x95a2884a	! t0_kref+0x3cd4:   	faddd	%f10, %f10, %f10
	.word	0xd616c018	! t0_kref+0x3cd8:   	lduh	[%i3 + %i0], %o3
	.word	0xd51e0000	! t0_kref+0x3cdc:   	ldd	[%i0], %f10
	.word	0xd6163fe8	! t0_kref+0x3ce0:   	lduh	[%i0 - 0x18], %o3
	.word	0x95a0012a	! t0_kref+0x3ce4:   	fabss	%f10, %f10
	.word	0x95b2898a	! t0_kref+0x3ce8:   	bshuffle	%f10, %f10, %f10
	.word	0x96d68000	! t0_kref+0x3cec:   	umulcc	%i2, %g0, %o3
	.word	0x95a0110a	! t0_kref+0x3cf0:   	fxtod	%f10, %f10
	.word	0xc398a040	! t0_kref+0x3cf4:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0x96500000	! t0_kref+0x3cf8:   	umul	%g0, %g0, %o3
	.word	0x95a0192b	! t0_kref+0x3cfc:   	fstod	%f11, %f10
	.word	0xe43e2000	! t0_kref+0x3d00:   	std	%l2, [%i0]
	.word	0x96168000	! t0_kref+0x3d04:   	or	%i2, %g0, %o3
	.word	0x96be801a	! t0_kref+0x3d08:   	xnorcc	%i2, %i2, %o3
	.word	0x96c02b08	! t0_kref+0x3d0c:   	addccc	%g0, 0xb08, %o3
	.word	0x96f0001a	! t0_kref+0x3d10:   	udivcc	%g0, %i2, %o3
	.word	0x97b284ca	! t0_kref+0x3d14:   	fcmpne32	%f10, %f10, %o3
	.word	0xd1be1800	! t0_kref+0x3d18:   	stda	%f8, [%i0]0xc0
	.word	0x9696b390	! t0_kref+0x3d1c:   	orcc	%i2, -0xc70, %o3
	.word	0x95a289ab	! t0_kref+0x3d20:   	fdivs	%f10, %f11, %f10
	.word	0x9636bb64	! t0_kref+0x3d24:   	orn	%i2, -0x49c, %o3
	.word	0x96c0309a	! t0_kref+0x3d28:   	addccc	%g0, -0xf66, %o3
	.word	0xc398a040	! t0_kref+0x3d2c:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0x96f6aba3	! t0_kref+0x3d30:   	udivcc	%i2, 0xba3, %o3
	.word	0x97a01a2b	! t0_kref+0x3d34:   	fstoi	%f11, %f11
	.word	0x95b28c4a	! t0_kref+0x3d38:   	fnor	%f10, %f10, %f10
	.word	0xd51e7fe8	! t0_kref+0x3d3c:   	ldd	[%i1 - 0x18], %f10
	.word	0x878020e0	! t0_kref+0x3d40:   	mov	0xe0, %asi
	.word	0x96f6801a	! t0_kref+0x3d44:   	udivcc	%i2, %i2, %o3
	.word	0x95a0192a	! t0_kref+0x3d48:   	fstod	%f10, %f10
	.word	0x97a01a2b	! t0_kref+0x3d4c:   	fstoi	%f11, %f11
	.word	0xd51e2000	! t0_kref+0x3d50:   	ldd	[%i0], %f10
	.word	0x97400000	! t0_kref+0x3d54:   	mov	%y, %o3
	.word	0xd5267ff8	! t0_kref+0x3d58:   	st	%f10, [%i1 - 8]
	.word	0x96400000	! t0_kref+0x3d5c:   	addc	%g0, %g0, %o3
	.word	0x95b28e80	! t0_kref+0x3d60:   	fsrc1	%f10, %f10
	.word	0x95a0188a	! t0_kref+0x3d64:   	fitos	%f10, %f10
	.word	0x96f6801a	! t0_kref+0x3d68:   	udivcc	%i2, %i2, %o3
	.word	0x95a000ca	! t0_kref+0x3d6c:   	fnegd	%f10, %f10
	.word	0x9690001a	! t0_kref+0x3d70:   	orcc	%g0, %i2, %o3
	.word	0x8d803718	! t0_kref+0x3d74:   	mov	0xfffff718, %fprs
	.word	0xd780105c	! t0_kref+0x3d78:   	lda	[%g0 + %i4]0x82, %f11
	.word	0xd696101b	! t0_kref+0x3d7c:   	lduha	[%i0 + %i3]0x80, %o3
	.word	0x9660001a	! t0_kref+0x3d80:   	subc	%g0, %i2, %o3
	.word	0x96b80000	! t0_kref+0x3d84:   	xnorcc	%g0, %g0, %o3
	.word	0x96f00000	! t0_kref+0x3d88:   	udivcc	%g0, %g0, %o3
	.word	0x97a289ab	! t0_kref+0x3d8c:   	fdivs	%f10, %f11, %f11
	.word	0x97b680ba	! t0_kref+0x3d90:   	edge16n	%i2, %i2, %o3
	.word	0x969039f5	! t0_kref+0x3d94:   	orcc	%g0, -0x60b, %o3
	.word	0x97b68280	! t0_kref+0x3d98:   	array32	%i2, %g0, %o3
	.word	0x95a2894a	! t0_kref+0x3d9c:   	fmuld	%f10, %f10, %f10
	.word	0x95a0110a	! t0_kref+0x3da0:   	fxtod	%f10, %f10
	.word	0x96f03f45	! t0_kref+0x3da4:   	udivcc	%g0, -0xbb, %o3
	.word	0x97b00160	! t0_kref+0x3da8:   	edge32ln	%g0, %g0, %o3
	.word	0x96b80000	! t0_kref+0x3dac:   	xnorcc	%g0, %g0, %o3
	.word	0xf4a71018	! t0_kref+0x3db0:   	sta	%i2, [%i4 + %i0]0x80
	.word	0x95a0012a	! t0_kref+0x3db4:   	fabss	%f10, %f10
	.word	0x9690001a	! t0_kref+0x3db8:   	orcc	%g0, %i2, %o3
	.word	0x97b0005a	! t0_kref+0x3dbc:   	edge8l	%g0, %i2, %o3
	.word	0x96d038a4	! t0_kref+0x3dc0:   	umulcc	%g0, -0x75c, %o3
	.word	0x97b680da	! t0_kref+0x3dc4:   	edge16l	%i2, %i2, %o3
	.word	0x9740c000	! t0_kref+0x3dc8:   	mov	%asi, %o3
	.word	0xd6560000	! t0_kref+0x3dcc:   	ldsh	[%i0], %o3
	.word	0x95a2894a	! t0_kref+0x3dd0:   	fmuld	%f10, %f10, %f10
	.word	0xd6d6501b	! t0_kref+0x3dd4:   	ldsha	[%i1 + %i3]0x80, %o3
	.word	0xd616001b	! t0_kref+0x3dd8:   	lduh	[%i0 + %i3], %o3
	.word	0xd19eda59	! t0_kref+0x3ddc:   	ldda	[%i3 + %i1]0xd2, %f8
	.word	0x9626be0a	! t0_kref+0x3de0:   	sub	%i2, -0x1f6, %o3
	.word	0xd6c65000	! t0_kref+0x3de4:   	ldswa	[%i1]0x80, %o3
	.word	0x95b28aca	! t0_kref+0x3de8:   	fpsub32	%f10, %f10, %f10
	.word	0x96f82d16	! t0_kref+0x3dec:   	sdivcc	%g0, 0xd16, %o3
	.word	0x9656bc41	! t0_kref+0x3df0:   	umul	%i2, -0x3bf, %o3
	.word	0x96168000	! t0_kref+0x3df4:   	or	%i2, %g0, %o3
	.word	0x95a000ca	! t0_kref+0x3df8:   	fnegd	%f10, %f10
	.word	0xd60e3fee	! t0_kref+0x3dfc:   	ldub	[%i0 - 0x12], %o3
	.word	0x95b2caeb	! t0_kref+0x3e00:   	fpsub32s	%f11, %f11, %f10
	.word	0x95a01a4a	! t0_kref+0x3e04:   	fdtoi	%f10, %f10
	.word	0x96b03903	! t0_kref+0x3e08:   	orncc	%g0, -0x6fd, %o3
	.word	0x9630310e	! t0_kref+0x3e0c:   	orn	%g0, -0xef2, %o3
	.word	0x35480007	! t0_kref+0x3e10:   	fbue,a,pt	%fcc0, _kref+0x3e2c
	.word	0xc028a034	! t0_kref+0x3e14:   	clrb	[%g2 + 0x34]
	.word	0x96802204	! t0_kref+0x3e18:   	addcc	%g0, 0x204, %o3
	.word	0x8143c000	! t0_kref+0x3e1c:   	stbar
	.word	0x81aacaab	! t0_kref+0x3e20:   	fcmpes	%fcc0, %f11, %f11
	.word	0x96100000	! t0_kref+0x3e24:   	clr	%o3
	.word	0x9fc00004	! t0_kref+0x3e28:   	call	%g0 + %g4
	.word	0x95b28a0a	! t0_kref+0x3e2c:   	fpadd16	%f10, %f10, %f10
	.word	0xd6063ff8	! t0_kref+0x3e30:   	ld	[%i0 - 8], %o3
	.word	0xef6e001a	! t0_kref+0x3e34:   	prefetch	%i0 + %i2, 23
	.word	0x97282017	! t0_kref+0x3e38:   	sll	%g0, 0x17, %o3
	.word	0x96600000	! t0_kref+0x3e3c:   	subc	%g0, %g0, %o3
	.word	0x97a0052a	! t0_kref+0x3e40:   	fsqrts	%f10, %f11
	.word	0x95b2c66b	! t0_kref+0x3e44:   	fmul8x16au	%f11, %f11, %f10
	.word	0x86102001	! t0_kref+0x3e48:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x3e4c:   	bne,a	_kref+0x3e4c
	.word	0x86a0e001	! t0_kref+0x3e50:   	subcc	%g3, 1, %g3
	.word	0x95a0190b	! t0_kref+0x3e54:   	fitod	%f11, %f10
	.word	0x2d800003	! t0_kref+0x3e58:   	fbg,a	_kref+0x3e64
	.word	0x95a8802a	! t0_kref+0x3e5c:   	fmovslg	%fcc0, %f10, %f10
	.word	0x965e801a	! t0_kref+0x3e60:   	smul	%i2, %i2, %o3
	.word	0xd640a02c	! t0_kref+0x3e64:   	ldsw	[%g2 + 0x2c], %o3
	.word	0xd64e601e	! t0_kref+0x3e68:   	ldsb	[%i1 + 0x1e], %o3
	.word	0x95a288ca	! t0_kref+0x3e6c:   	fsubd	%f10, %f10, %f10
	.word	0x96e68000	! t0_kref+0x3e70:   	subccc	%i2, %g0, %o3
	.word	0x97b28eea	! t0_kref+0x3e74:   	fornot2s	%f10, %f10, %f11
	.word	0x81aacaab	! t0_kref+0x3e78:   	fcmpes	%fcc0, %f11, %f11
	.word	0xe43f4019	! t0_kref+0x3e7c:   	std	%l2, [%i5 + %i1]
	call	SYM(_kaos_done)
	.word	0x01000000	! t0_kref+0x3e84:   	nop
	KGLOBAL(t0_ktbl_end)
t0_ktbl_end:
t0_ktbl_page_end:

KTEXT_MODULE(t0_module_subr0, 0x4c2c8000)
.seg "text"
t0_subr0_page_begin:
	.skip 8192
.global _t0_subr0; ENTRY(t0_subr0)
	.word	0xa6844012	! t0_subr0+0x0:   	addcc	%l1, %l2, %l3
	.word	0x81c3e008	! t0_subr0+0x4:   	retl
	.word	0xaa64c014	! t0_subr0+0x8:   	subc	%l3, %l4, %l5
t0_subr0_page_end:

KTEXT_MODULE(t0_module_subr1, 0x2de0a000)
.seg "text"
t0_subr1_page_begin:
	.skip 8192
.global _t0_subr1; ENTRY(t0_subr1)
	.word	0x9de3bfa0	! t0_subr1+0x0:   	save	%sp, -0x60, %sp
	.word	0xb29eaa5a	! t0_subr1+0x4:   	xorcc	%i2, 0xa5a, %i1
	.word	0x81c7e008	! t0_subr1+0x8:   	ret
	.word	0xa7ee6001	! t0_subr1+0xc:   	restore	%i1, 1, %l3
t0_subr1_page_end:

KTEXT_MODULE(t0_module_subr2, 0x2d89c000)
.seg "text"
t0_subr2_page_begin:
	.skip 8180
.global _t0_subr2; ENTRY(t0_subr2)
	.word	0x9de3bfa0	! t0_subr2+0x0:   	save	%sp, -0x60, %sp
	.word	0xb2066001	! t0_subr2+0x4:   	add	%i1, 1, %i1
	.word	0x81c7e008	! t0_subr2+0x8:   	ret
	.word	0xa3ee6001	! t0_subr2+0xc:   	restore	%i1, 1, %l1
t0_subr2_page_end:

KTEXT_MODULE(t0_module_subr3, 0x5977a000)
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
!  Total operations: 3949  
!
!  Operation frequencies
!
!  name               exp    obs
!  ldsb              0.43   0.51
!  ldub              0.68   0.58
!  ldsh              1.58   1.57
!  lduh              1.09   1.22
!  ld                0.97   1.01
!  ldd               1.28   1.52
!  swap              0.36   0.25
!  ldstub            0.59   0.63
!  stb               0.07   0.05
!  sth               0.84   0.84
!  st                0.19   0.33
!  std               1.25   1.62
!  add               0.26   0.23
!  addcc             0.87   0.94
!  addx              0.69   0.81
!  addxcc            0.24   0.28
!  taddcc            0.30   0.25
!  taddcctv          0.26   0.18
!  sub               0.39   0.53
!  subcc             0.51   0.61
!  subx              0.97   0.99
!  subxcc            1.36   1.19
!  tsubcc            0.07   0.03
!  tsubcctv          0.29   0.38
!  mulscc            1.25   1.06
!  and               1.55   1.52
!  andcc             0.37   0.43
!  andn              0.25   0.35
!  andncc            0.83   0.73
!  or                0.94   0.94
!  orcc              1.27   1.65
!  orn               0.41   0.53
!  orncc             0.40   0.30
!  xor               1.63   1.77
!  xorcc             0.53   0.38
!  xnor              0.13   0.20
!  xnorcc            1.65   1.39
!  sll               0.86   0.86
!  srl               1.16   1.04
!  sra               1.09   0.96
!  unimp             0.08   0.08
!  umul              1.24   1.09
!  smul              1.19   1.37
!  udiv              0.47   0.51
!  sdiv              0.61   0.48
!  umulcc            0.46   0.63
!  smulcc            0.40   0.28
!  udivcc            1.51   1.77
!  sdivcc            0.34   0.30
!  rdy               1.41   1.32
!  wry               0.32   0.35
!  bicc              0.94   0.79
!  sethi             0.55   0.71
!  jmpl              1.02   0.94
!  call              0.16   0.15
!  ticc              0.00   0.00
!  flush             0.86   0.96
!  save              0.04   0.00
!  restore           1.52   0.00
!  stbar             1.14   1.19
!  ldf               0.09   0.05
!  lddf              1.25   1.47
!  stf               0.25   0.43
!  stdf              0.25   0.23
!  fadds             0.54   0.63
!  fsubs             0.12   0.08
!  fmuls             0.46   0.43
!  fdivs             1.52   1.57
!  faddd             1.25   1.24
!  fsubd             0.57   0.68
!  fmuld             1.48   1.80
!  fdivd             0.04   0.03
!  faddq             0.00   0.00
!  fsubq             0.00   0.00
!  fmulq             0.00   0.00
!  fdivq             0.00   0.00
!  fsmuld            1.19   1.29
!  fdmulq            0.00   0.00
!  fitos             1.21   1.11
!  fitod             0.06   0.18
!  fitoq             0.00   0.00
!  fstoi             0.62   0.56
!  fstod             1.20   1.67
!  fstoq             0.00   0.00
!  fdtoi             1.52   1.39
!  fdtos             0.27   0.28
!  fdtoq             0.00   0.00
!  fqtoi             0.00   0.00
!  fqtos             0.00   0.00
!  fqtod             0.00   0.00
!  fmovs             0.74   0.96
!  fnegs             1.06   1.06
!  fabss             1.18   1.37
!  fsqrts            0.78   0.84
!  fsqrtd            1.43   1.09
!  fsqrtq            0.00   0.00
!  fcmps             0.41   0.25
!  fcmpd             0.02   0.03
!  fcmpq             0.00   0.00
!  fcmpes            1.16   1.09
!  fcmped            0.42   0.25
!  fcmpeq            0.00   0.00
!  fbfcc             1.75   2.05
!  ldfsr             0.11   0.00
!  stfsr             0.10   0.05
!  loop              0.91   0.73
!  offset            0.28   0.38
!  area              0.12   0.20
!  target            0.22   0.20
!  goto              0.18   0.13
!  sigsegv           0.07   0.05
!  sigbus            0.20   0.23
!  imodify           0.00   0.00
!  ldfsr_offset      0.28   0.00
!  fpattern          1.08   0.91
!  lbranch           0.06   0.08
!  shmld             0.46   0.56
!  shmst             0.72   0.71
!  shmpf             0.94   1.11
!  shmswap           0.10   0.08
!  shmblkld          1.49   0.23
!  shmblkst          0.57   0.05
!  shmblkchk         0.31   0.15
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
!  casa              0.26   0.41
!  rdasi             0.23   0.18
!  wrasi             0.29   0.25
!  bpcc              0.34   0.25
!  fbpfcc            0.68   0.86
!  fmovscc           0.23   0.05
!  fmovdcc           0.30   0.43
!  fmovqcc           0.00   0.00
!  movcc             0.30   0.33
!  flushw            0.29   0.43
!  membar            0.19   0.05
!  prefetch          0.36   0.43
!  rdpc              0.33   0.35
!  ldqf              0.00   0.00
!  stqf              0.00   0.00
!  ldfa              0.22   0.28
!  lddfa             0.10   0.20
!  ldqfa             0.00   0.00
!  ldsba             0.15   0.10
!  ldsha             0.30   0.28
!  lduba             0.25   0.23
!  lduha             0.28   0.25
!  lda               0.20   0.28
!  ldda              0.28   0.43
!  ldstuba           0.03   0.05
!  prefetcha         0.31   0.10
!  stfa              0.33   0.30
!  stdfa             0.28   0.18
!  stqfa             0.00   0.00
!  stba              0.22   0.33
!  stha              0.22   0.18
!  sta               0.11   0.13
!  stda              0.00   0.00
!  swapa             0.01   0.03
!  fmovd             0.06   0.10
!  fnegd             0.29   0.35
!  fabsd             0.15   0.20
!  fstox             0.11   0.08
!  fdtox             0.16   0.15
!  fxtos             0.05   0.00
!  fxtod             0.18   0.25
!  lds               0.18   0.20
!  ldsa              0.09   0.13
!  ldx               0.08   0.20
!  ldxa              0.31   0.46
!  nofault           0.30   0.33
!  rdgsr             0.07   0.10
!  wrgsr             0.15   0.20
!  fpadd16           0.10   0.18
!  fpadd16s          0.04   0.00
!  fpadd32           0.22   0.25
!  fpadd32s          0.06   0.08
!  fpsub16           0.22   0.18
!  fpsub16s          0.00   0.00
!  fpsub32           0.15   0.13
!  fpsub32s          0.17   0.23
!  fpack16           0.02   0.00
!  fpack32           0.13   0.18
!  fpackfix          0.14   0.25
!  fexpand           0.06   0.13
!  fpmerge           0.00   0.00
!  fmul8x16          0.25   0.46
!  fmul8x16au        0.22   0.23
!  fmul8x16al        0.10   0.08
!  fmul8sux16        0.03   0.00
!  fmul8ulx16        0.20   0.15
!  fmuld8sux16       0.15   0.13
!  fmuld8ulx16       0.30   0.30
!  alignaddr         0.27   0.38
!  alignaddrl        0.28   0.35
!  faligndata        0.12   0.13
!  fzero             0.19   0.08
!  fzeros            0.24   0.41
!  fone              0.06   0.10
!  fones             0.32   0.33
!  fsrc1             0.27   0.28
!  fsrc1s            0.09   0.18
!  fsrc2             0.05   0.10
!  fsrc2s            0.12   0.20
!  fnot1             0.29   0.38
!  fnot1s            0.19   0.15
!  fnot2             0.25   0.23
!  fnot2s            0.24   0.23
!  for               0.16   0.25
!  fors              0.20   0.18
!  fnor              0.03   0.05
!  fnors             0.02   0.05
!  fand              0.21   0.20
!  fands             0.09   0.20
!  fnand             0.07   0.05
!  fnands            0.05   0.03
!  fxor              0.02   0.05
!  fxors             0.19   0.15
!  fxnor             0.20   0.28
!  fxnors            0.25   0.15
!  fornot1           0.08   0.05
!  fornot1s          0.15   0.18
!  fornot2           0.14   0.18
!  fornot2s          0.17   0.13
!  fandnot1          0.23   0.28
!  fandnot1s         0.17   0.33
!  fandnot2          0.07   0.03
!  fandnot2s         0.21   0.28
!  fcmpgt16          0.15   0.20
!  fcmpgt32          0.24   0.18
!  fcmple16          0.10   0.13
!  fcmple32          0.26   0.15
!  fcmpne16          0.02   0.00
!  fcmpne32          0.28   0.38
!  fcmpeq16          0.28   0.30
!  fcmpeq32          0.00   0.00
!  edge8             0.04   0.13
!  edge8l            0.25   0.28
!  edge16            0.08   0.05
!  edge16l           0.21   0.20
!  edge32            0.15   0.28
!  edge32l           0.28   0.18
!  pdist             0.06   0.00
!  partial_st8       0.23   0.20
!  partial_st16      0.15   0.13
!  partial_st32      0.15   0.20
!  short_st8         0.08   0.05
!  short_st16        0.06   0.05
!  short_ld8         0.27   0.18
!  short_ld16        0.08   0.15
!  blkld             0.06   0.00
!  blkst             0.30   0.00
!  blkld_offset      0.04   0.00
!  blkst_offset      0.07   0.00
!  blk_check         0.25   0.25
!  casxa             0.06   0.03
!  rdccr             0.31   0.43
!  rdfprs            0.08   0.05
!  wrccr             0.12   0.08
!  popc              0.13   0.05
!  wrfprs            0.05   0.08
!  stx               0.06   0.08
!  stxa              0.26   0.35
!  cflush            0.00   0.00
!  array8            0.26   0.20
!  array16           0.27   0.25
!  array32           0.27   0.25
!  edge8n            0.20   0.18
!  edge8ln           0.03   0.00
!  edge16n           0.15   0.18
!  edge16ln          0.03   0.00
!  edge32n           0.18   0.10
!  edge32ln          0.16   0.18
!  bmask             0.17   0.20
!  bshuffle          0.29   0.23
!  siam              0.10   0.20
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
KDATA_MODULE(t0_module_offset_table, 0x4f628000)
.seg "data"
t0_offset_table_start:
t0_offset_table_size:	.word	0x00000008
t0_offset_table:
	.word	0x00000000
	.word	0xffffffe0
	.word	0x00000010
	.word	0x00000018
	.word	0xfffffff0
	.word	0xfffffff8
	.word	0x00000008
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

KDATA_MODULE(t0_module_data_in_regs, 0x41a8a000)
.seg "data"
KGLOBAL(t0_data_in_regs)
t0_data_in_regs_start:
t0_data_in_regs:
	.word	0x9798a544          ! %f0
	.word	0x996ab941          ! %f1
	.word	0x05f2d702          ! %f2
	.word	0x4626cd8c          ! %f3
	.word	0x83675cbf          ! %f4
	.word	0xd62eaa72          ! %f5
	.word	0xc6d46a7e          ! %f6
	.word	0x2e36a5b0          ! %f7
	.word	0xe53da6c1          ! %f8
	.word	0xffbbb43f          ! %f9
	.word	0xd92f169f          ! %f10
	.word	0x5f2a03ca          ! %f11
	.word	0x1b74ef55          ! %f12
	.word	0xff2c64ef          ! %f13
	.word	0xf87c16d0          ! %f14
	.word	0x0441853c          ! %f15
	.word	0x60984bfd          ! %f16
	.word	0x0070960e          ! %f17
	.word	0x86e9d0e6          ! %f18
	.word	0xa68265b6          ! %f19
	.word	0x4ba153e6          ! %f20
	.word	0x1e643293          ! %f21
	.word	0x2a428a74          ! %f22
	.word	0x434b2bff          ! %f23
	.word	0x3d2dc75c          ! %f24
	.word	0x0e09bb44          ! %f25
	.word	0x0af89f5d          ! %f26
	.word	0xc5ffdef5          ! %f27
	.word	0x3d23ba7f          ! %f28
	.word	0x71be2d59          ! %f29
	.word	0xb9a70da9          ! %f30
	.word	0xfcd606d2          ! %f31
	.word	0xa1613736          ! %f32
	.word	0x82722f5f          ! %f33
	.word	0xb4ee6a9c          ! %f34
	.word	0x6288feb0          ! %f35
	.word	0x8e6f8a64          ! %f36
	.word	0x374ea85f          ! %f37
	.word	0xb7839504          ! %f38
	.word	0xcc435a4e          ! %f39
	.word	0x7e01b05a          ! %f40
	.word	0xb1e9253f          ! %f41
	.word	0x0dc6b8d2          ! %f42
	.word	0x2c926414          ! %f43
	.word	0xa788948c          ! %f44
	.word	0xc88eb067          ! %f45
	.word	0xb88e77ec          ! %f46
	.word	0x6604f754          ! %f47
	.word	0x949f1886          ! %f48
	.word	0x4771ffa7          ! %f49
	.word	0xb13c4c41          ! %f50
	.word	0x5a673ad2          ! %f51
	.word	0xb0bb1620          ! %f52
	.word	0x46f41c57          ! %f53
	.word	0x26ec771d          ! %f54
	.word	0x82a0ff86          ! %f55
	.word	0x10afd0f0          ! %f56
	.word	0x7f0ce9bf          ! %f57
	.word	0x86e511be          ! %f58
	.word	0xef54c79f          ! %f59
	.word	0x86618b00          ! %f60
	.word	0x304b2db9          ! %f61
	.word	0xe88d1326          ! %f62
	.word	0x67b9b9cb          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0xe48       ! %g1 (code pointer)
	.word	t0_data_in_shm_area ! %g2 (shared area pointer)
	.word	0x9ce7d9f9          ! %g3 (loop index)
	.word	SYM(t0_subr3)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0xccaccf93          ! %o0
	.word	0xe9890697          ! %o1
	.word	0x138c821b          ! %o2
	.word	0x94c44e51          ! %o3
	.word	0x714f16a0          ! %o4
	.word	0x90640f31          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0xced130c0          ! %l0
	.word	0x5839ff95          ! %l1
	.word	0x706d5f32          ! %l2
	.word	0xc30b04b5          ! %l3
	.word	0xefa2503d          ! %l4
	.word	0xdb73c13c          ! %l5
	.word	0x2b4b32eb          ! %l6
	.word	0xa58b76cf          ! %l7
	.word	t0_data_in_area0    ! %i0 (area pointer)
	.word	t0_data_in_area0    ! %i1 (area pointer)
	.word	0x00000012          ! %i2 (byte offset)
	.word	0x0000001e          ! %i3 (halfword offset)
	.word	0x00000010          ! %i4 (word offset)
	.word	0x00000010          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0x8d0c1a23          ! %y
	.word	0x00000000          ! %icc (nzvc)
	.word	0xc0000b28          ! %fsr
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

KDATA_MODULE(t0_module_data_in_stack, 0x165be000)
.seg "data"
KGLOBAL(t0_data_in_mtbl_size)
KGLOBAL(t0_data_in_mtbl)
KGLOBAL(t0_data_in_stack)
t0_data_in_stack_start:
	.word	0x1b1d14f1
	.word	0x2c3df5fc
	.word	0xce72b588
	.word	0x167c4868
	.word	0xb37ce4ab
	.word	0xff34b564
	.word	0xba476472
	.word	0x02ae7410
	.word	0x46b28a99
	.word	0xe8c96579
	.word	0x9c7af515
	.word	0x9437bfd0
	.word	0xfc7cb761
	.word	0x9bf18949
	.word	0xaaf1c8ba
	.word	0x2bdad954
	.word	0xf527a8dc
	.word	0x675c9b09
	.word	0xfa1b4001
	.word	0x1ae089f0
	.word	0x1fb3c02d
	.word	0xc127eaa1
	.word	0x2c221114
	.word	0x380f22c1
	.word	0xdb86e514
	.word	0xe813606d
	.word	0x000f4d1e
	.word	0xe76a0713
	.word	0xa7804a84
	.word	0xc1f92841
	.word	0xae13c8fe
	.word	0xf774f902
	.word	0xadab6872
	.word	0x4ae688ae
	.word	0xf132dd37
	.word	0xb44d0c63
	.word	0xf1483eef
	.word	0xc9546a83
	.word	0x72c4b12b
	.word	0x29a363e4
	.word	0x41ac3678
	.word	0xe6e25496
	.word	0x60f58589
	.word	0xcec41c71
	.word	0x68e0318d
	.word	0x19dedfc3
	.word	0x61cab202
	.word	0x75960ad9
	.word	0xbe15a37f
	.word	0x1714e735
	.word	0xd78d4a42
	.word	0xe5262fb1
	.word	0xcb55c08e
	.word	0x6d04f8e4
	.word	0xc5059e1e
	.word	0xc41c0578
	.word	0xe06b1b32
	.word	0xd626ca5e
	.word	0x3ef20909
	.word	0x7da20cfb
	.word	0x9c3742b9
	.word	0x2746b5c9
	.word	0x9fd6c4cc
	.word	0x5e203bfa
	.word	0xdeab3711
	.word	0x2dcf8327
	.word	0xfaebb375
	.word	0xeadc320c
	.word	0x81b2c5e7
	.word	0x081101db
	.word	0x1dc85490
	.word	0x3a6d57bf
	.word	0x43d024f0
	.word	0xf398366d
	.word	0xcdbd5994
	.word	0x02314c03
	.word	0xad265d85
	.word	0xb3b62089
	.word	0x88ce8da0
	.word	0xf8cf43c7
	.word	0x6c865d75
	.word	0x489e5d4d
	.word	0x92370466
	.word	0xcd9f3fe4
	.word	0xcefbc116
	.word	0xf65729c4
	.word	0x528cc467
	.word	0x22b43d3a
	.word	0xf693aa9d
	.word	0x964889ac
	.word	0x63386060
	.word	0xf196c318
	.word	0x55e93aaf
	.word	0xe6d0967f
	.word	0xff483404
	.word	0x6baf73e1
	.word	0x8aa87e37
	.word	0x4e1f3ab1
	.word	0xffee37ea
	.word	0x853783eb
	.word	0xe2f1e579
	.word	0x20fbdd35
	.word	0x2c72a0c8
	.word	0xd67f3aaa
	.word	0xe5959867
	.word	0x873bc145
	.word	0x1b54bde1
	.word	0xa9b8e20d
	.word	0xecbf3c33
	.word	0x26d81e62
	.word	0x7ff6cabc
	.word	0xd578c827
	.word	0xeb1ffe25
	.word	0xafff349a
	.word	0xccc8a816
	.word	0x44013712
	.word	0x862df7ae
	.word	0x986be109
	.word	0x08b0b018
	.word	0xb77b8710
	.word	0xd9ed3fbc
	.word	0xef0376a1
	.word	0x86b119cc
	.word	0xd9adaef2
	.word	0x1d283d4f
	.word	0x5a71df2d
	.word	0x7bbb9fcd
	.word	0xf4cdf6bc
	.word	0x6d420f4b
	.word	0x7a784892
	.word	0xcf8c5e3e
	.word	0xb90cb089
	.word	0xd0271d90
	.word	0xf422e258
	.word	0xc5801bfc
	.word	0x39861bac
	.word	0xd68d2747
	.word	0x215e6f68
	.word	0x78e97317
	.word	0x41ccd618
	.word	0xa9f5627e
	.word	0x64aeb017
	.word	0x98ab8c7d
	.word	0x5d5f8001
	.word	0xfdf880f7
	.word	0x7e52e862
	.word	0x371862f8
	.word	0x5a6275c2
	.word	0xac8dae3d
	.word	0x7136067b
	.word	0x007bc15a
	.word	0xd320c401
	.word	0x667adaf7
	.word	0xcfdc2d84
	.word	0x4b9b6ff5
	.word	0xdc65ba10
	.word	0x152de980
	.word	0xf457a899
	.word	0x7f084550
	.word	0x7bf2be96
	.word	0x67238fb6
	.word	0x3e6b8a14
	.word	0x6ba30e18
	.word	0x086b4a6e
	.word	0xacfa0211
	.word	0x08a27b0b
	.word	0xeb738055
	.word	0x354b2dce
t0_data_in_sp:
	.word	0x289abbf7
	.word	0x6c847f1d
	.word	0x2b1eaddd
	.word	0xe01983ab
	.word	0x4ac7f94f
	.word	0xff7eb06e
	.word	0x172daa0c
	.word	0xea4cf75c
	.word	t0_data_in_area0
	.word	t0_data_in_area0
	.word	0xfffffff1
	.word	0xffffffe8
	.word	0xfffffff4
	.word	0xfffffff8
	.word	t0_data_in_fp
	.word	0xf66005e2
	.word	0x3cb38c52
	.word	0x6bbff916
	.word	0x260fd0b6
	.word	0xc5830e9d
	.word	0x41f11183
	.word	0x4cd931fb
	.word	0xab35722a
	.word	0x84530f8d
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
	.word   	0x5d7315b6	! [%fp - 0xc]
	.word   	0xd4026975	! [%fp - 0x8]
	.word   	0x48ff78de	! [%fp - 0x4]
.global t0_data_in_fp; t0_data_in_fp:
	.word	0xeaea207d
	.word	0x0d242321
	.word	0x2c86c821
	.word	0xc6323ae6
	.word	0x6a379518
	.word	0xffbfbbf8
	.word	0xc695c818
	.word	0xc02f94e0
	.word	0x22d6f2ac
	.word	0xd7d716dc
	.word	0xf487aa4f
	.word	0x12c4bd8d
	.word	0x6839fe30
	.word	0x3100ae91
	.word	0x6d295e41
	.word	0x47c93ea3
	.word	0x56572688
	.word	0xfd4498f4
	.word	0x29ecbfca
	.word	0x4f7426e0
	.word	0x5b5dcf06
	.word	0x4b82d92b
	.word	0xae444f56
	.word	0x4309c962
t0_data_in_stacktop:
	.word	0
t0_data_in_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_in_area0, 0x2b114000)
.seg "data"
t0_data_in_area0_start:
.skip 7872
t0_data_in_area0_begin:
	.word	0x6f063e34	! t0_data_in_area0-0x20
	.word	0xb9b0211e	! t0_data_in_area0-0x1c
	.word	0x303fc83a	! t0_data_in_area0-0x18
	.word	0xbad59e35	! t0_data_in_area0-0x14
	.word	0x8e2b34d0	! t0_data_in_area0-0x10
	.word	0xc298b625	! t0_data_in_area0-0xc
	.word	0xbbf13961	! t0_data_in_area0-0x8
	.word	0xa389182d	! t0_data_in_area0-0x4
.global t0_data_in_area0; t0_data_in_area0:
	.word	0xbfb77117	! t0_data_in_area0+0x0
	.word	0x35a06d01	! t0_data_in_area0+0x4
	.word	0x8978842b	! t0_data_in_area0+0x8
	.word	0xe75183f6	! t0_data_in_area0+0xc
	.word	0xb7d1a246	! t0_data_in_area0+0x10
	.word	0x22f1f110	! t0_data_in_area0+0x14
	.word	0xc30d6591	! t0_data_in_area0+0x18
	.word	0x69844469	! t0_data_in_area0+0x1c
t0_data_in_area0_end:
.skip 256
t0_data_in_area0_stop:

KDATA_MODULE(t0_module_data_in_shm_area, 0x09006000)
.seg "data"
t0_data_in_shm_area_start:
t0_data_in_shm_area_begin:
.global t0_data_in_shm_area; t0_data_in_shm_area:
	.word	0x33d5905d	! t0_data_in_shm_area+0x0 (t0)
	.word	0x7efecabc	! t0_data_in_shm_area+0x4 (t0)
	.word	0xb33e6d8c	! t0_data_in_shm_area+0x8 (t0)
	.word	0x11e20020	! t0_data_in_shm_area+0xc (t0)
	.word	0x7d517c25	! t0_data_in_shm_area+0x10 (t0)
	.word	0x8854d934	! t0_data_in_shm_area+0x14 (t0)
	.word	0x361d88b7	! t0_data_in_shm_area+0x18 (t0)
	.word	0x1b66944c	! t0_data_in_shm_area+0x1c (t0)
	.word	0x802afb74	! t0_data_in_shm_area+0x20 (t0)
	.word	0x59e5335e	! t0_data_in_shm_area+0x24 (t0)
	.word	0xa8790032	! t0_data_in_shm_area+0x28 (t0)
	.word	0xc3a4e0c5	! t0_data_in_shm_area+0x2c (t0)
	.word	0x687ed5af	! t0_data_in_shm_area+0x30 (t0)
	.word	0x0523a40c	! t0_data_in_shm_area+0x34 (t0)
	.word	0xe8ca13ca	! t0_data_in_shm_area+0x38 (t0)
	.word	0x600ac162	! t0_data_in_shm_area+0x3c (t0)
	.word	0x7403a491	! t0_data_in_shm_area+0x40 (t0 bload)
	.word	0x8225356d	! t0_data_in_shm_area+0x44
	.word	0x2c709256	! t0_data_in_shm_area+0x48
	.word	0xe75ac88a	! t0_data_in_shm_area+0x4c
	.word	0x30ef3d2a	! t0_data_in_shm_area+0x50
	.word	0xdb577fc5	! t0_data_in_shm_area+0x54
	.word	0xf3651463	! t0_data_in_shm_area+0x58
	.word	0x1c6e8f0b	! t0_data_in_shm_area+0x5c
	.word	0xb5db2529	! t0_data_in_shm_area+0x60
	.word	0x4dd1af60	! t0_data_in_shm_area+0x64
	.word	0xab01bd13	! t0_data_in_shm_area+0x68
	.word	0xc52dad2a	! t0_data_in_shm_area+0x6c
	.word	0xe324985d	! t0_data_in_shm_area+0x70
	.word	0xf1db75c4	! t0_data_in_shm_area+0x74
	.word	0x201ba541	! t0_data_in_shm_area+0x78
	.word	0x12d2b0fa	! t0_data_in_shm_area+0x7c
	.word	0xab08e278	! t0_data_in_shm_area+0x80 (t0 bstore)
	.word	0xa0555a25	! t0_data_in_shm_area+0x84
	.word	0xa7a554e9	! t0_data_in_shm_area+0x88
	.word	0x8858a5f1	! t0_data_in_shm_area+0x8c
	.word	0xea871116	! t0_data_in_shm_area+0x90
	.word	0xa4711d1d	! t0_data_in_shm_area+0x94
	.word	0x75b4eec7	! t0_data_in_shm_area+0x98
	.word	0x068101b7	! t0_data_in_shm_area+0x9c
	.word	0x061c41fd	! t0_data_in_shm_area+0xa0
	.word	0xc4e0239c	! t0_data_in_shm_area+0xa4
	.word	0x6b4ef23d	! t0_data_in_shm_area+0xa8
	.word	0x0b8b0a41	! t0_data_in_shm_area+0xac
	.word	0x430011a6	! t0_data_in_shm_area+0xb0
	.word	0xe7891d1c	! t0_data_in_shm_area+0xb4
	.word	0x4e00b779	! t0_data_in_shm_area+0xb8
	.word	0xd4b3091e	! t0_data_in_shm_area+0xbc
t0_data_in_shm_area_end:
t0_data_in_shm_area_stop:

KDATA_MODULE(t0_module_data_exp_regs, 0x1a36e000)
.seg "data"
KGLOBAL(t0_data_exp_regs)
t0_data_exp_regs_start:
t0_data_exp_regs:
	.word	0x9798a544          ! %f0
	.word	0x996ab941          ! %f1
	.word	0x05f2d702          ! %f2
	.word	0x4626cd8c          ! %f3
	.word	0x83675cbf          ! %f4
	.word	0xd62eaa72          ! %f5
	.word	0xc6d46a7e          ! %f6
	.word	0x2e36a5b0          ! %f7
	.word	0xe53da6c1          ! %f8
	.word	0xffbbb43f          ! %f9
	.word	0xd92f169f          ! %f10
	.word	0x5f2a03ca          ! %f11
	.word	0x1b74ef55          ! %f12
	.word	0xff2c64ef          ! %f13
	.word	0xf87c16d0          ! %f14
	.word	0x0441853c          ! %f15
	.word	0x60984bfd          ! %f16
	.word	0x0070960e          ! %f17
	.word	0x86e9d0e6          ! %f18
	.word	0xa68265b6          ! %f19
	.word	0x4ba153e6          ! %f20
	.word	0x1e643293          ! %f21
	.word	0x2a428a74          ! %f22
	.word	0x434b2bff          ! %f23
	.word	0x3d2dc75c          ! %f24
	.word	0x0e09bb44          ! %f25
	.word	0x0af89f5d          ! %f26
	.word	0xc5ffdef5          ! %f27
	.word	0x3d23ba7f          ! %f28
	.word	0x71be2d59          ! %f29
	.word	0xb9a70da9          ! %f30
	.word	0xfcd606d2          ! %f31
	.word	0xa1613736          ! %f32
	.word	0x82722f5f          ! %f33
	.word	0xb4ee6a9c          ! %f34
	.word	0x6288feb0          ! %f35
	.word	0x8e6f8a64          ! %f36
	.word	0x374ea85f          ! %f37
	.word	0xb7839504          ! %f38
	.word	0xcc435a4e          ! %f39
	.word	0x7e01b05a          ! %f40
	.word	0xb1e9253f          ! %f41
	.word	0x0dc6b8d2          ! %f42
	.word	0x2c926414          ! %f43
	.word	0xa788948c          ! %f44
	.word	0xc88eb067          ! %f45
	.word	0xb88e77ec          ! %f46
	.word	0x6604f754          ! %f47
	.word	0x949f1886          ! %f48
	.word	0x4771ffa7          ! %f49
	.word	0xb13c4c41          ! %f50
	.word	0x5a673ad2          ! %f51
	.word	0xb0bb1620          ! %f52
	.word	0x46f41c57          ! %f53
	.word	0x26ec771d          ! %f54
	.word	0x82a0ff86          ! %f55
	.word	0x10afd0f0          ! %f56
	.word	0x7f0ce9bf          ! %f57
	.word	0x86e511be          ! %f58
	.word	0xef54c79f          ! %f59
	.word	0x86618b00          ! %f60
	.word	0x304b2db9          ! %f61
	.word	0xe88d1326          ! %f62
	.word	0x67b9b9cb          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0xe48       ! %g1 (code pointer)
	.word	t0_data_exp_shm_area! %g2 (shared area pointer)
	.word	0x9ce7d9f9          ! %g3 (loop index)
	.word	SYM(t0_subr3)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0xccaccf93          ! %o0
	.word	0xe9890697          ! %o1
	.word	0x138c821b          ! %o2
	.word	0x94c44e51          ! %o3
	.word	0x714f16a0          ! %o4
	.word	0x90640f31          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0xced130c0          ! %l0
	.word	0x5839ff95          ! %l1
	.word	0x706d5f32          ! %l2
	.word	0xc30b04b5          ! %l3
	.word	0xefa2503d          ! %l4
	.word	0xdb73c13c          ! %l5
	.word	0x2b4b32eb          ! %l6
	.word	0xa58b76cf          ! %l7
	.word	t0_data_exp_area0   ! %i0 (area pointer)
	.word	t0_data_exp_area0   ! %i1 (area pointer)
	.word	0x00000012          ! %i2 (byte offset)
	.word	0x0000001e          ! %i3 (halfword offset)
	.word	0x00000010          ! %i4 (word offset)
	.word	0x00000010          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0x8d0c1a23          ! %y
	.word	0x00000000          ! %icc (nzvc)
	.word	0xc0000b28          ! %fsr
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

KDATA_MODULE(t0_module_data_exp_stack, 0x55b00000)
.seg "data"
KGLOBAL(t0_data_exp_mtbl_size)
KGLOBAL(t0_data_exp_mtbl)
KGLOBAL(t0_data_exp_stack)
t0_data_exp_stack_start:
	.word	0x1b1d14f1
	.word	0x2c3df5fc
	.word	0xce72b588
	.word	0x167c4868
	.word	0xb37ce4ab
	.word	0xff34b564
	.word	0xba476472
	.word	0x02ae7410
	.word	0x46b28a99
	.word	0xe8c96579
	.word	0x9c7af515
	.word	0x9437bfd0
	.word	0xfc7cb761
	.word	0x9bf18949
	.word	0xaaf1c8ba
	.word	0x2bdad954
	.word	0xf527a8dc
	.word	0x675c9b09
	.word	0xfa1b4001
	.word	0x1ae089f0
	.word	0x1fb3c02d
	.word	0xc127eaa1
	.word	0x2c221114
	.word	0x380f22c1
	.word	0xdb86e514
	.word	0xe813606d
	.word	0x000f4d1e
	.word	0xe76a0713
	.word	0xa7804a84
	.word	0xc1f92841
	.word	0xae13c8fe
	.word	0xf774f902
	.word	0xadab6872
	.word	0x4ae688ae
	.word	0xf132dd37
	.word	0xb44d0c63
	.word	0xf1483eef
	.word	0xc9546a83
	.word	0x72c4b12b
	.word	0x29a363e4
	.word	0x41ac3678
	.word	0xe6e25496
	.word	0x60f58589
	.word	0xcec41c71
	.word	0x68e0318d
	.word	0x19dedfc3
	.word	0x61cab202
	.word	0x75960ad9
	.word	0xbe15a37f
	.word	0x1714e735
	.word	0xd78d4a42
	.word	0xe5262fb1
	.word	0xcb55c08e
	.word	0x6d04f8e4
	.word	0xc5059e1e
	.word	0xc41c0578
	.word	0xe06b1b32
	.word	0xd626ca5e
	.word	0x3ef20909
	.word	0x7da20cfb
	.word	0x9c3742b9
	.word	0x2746b5c9
	.word	0x9fd6c4cc
	.word	0x5e203bfa
	.word	0xdeab3711
	.word	0x2dcf8327
	.word	0xfaebb375
	.word	0xeadc320c
	.word	0x81b2c5e7
	.word	0x081101db
	.word	0x1dc85490
	.word	0x3a6d57bf
	.word	0x43d024f0
	.word	0xf398366d
	.word	0xcdbd5994
	.word	0x02314c03
	.word	0xad265d85
	.word	0xb3b62089
	.word	0x88ce8da0
	.word	0xf8cf43c7
	.word	0x6c865d75
	.word	0x489e5d4d
	.word	0x92370466
	.word	0xcd9f3fe4
	.word	0xcefbc116
	.word	0xf65729c4
	.word	0x528cc467
	.word	0x22b43d3a
	.word	0xf693aa9d
	.word	0x964889ac
	.word	0x63386060
	.word	0xf196c318
	.word	0x55e93aaf
	.word	0xe6d0967f
	.word	0xff483404
	.word	0x6baf73e1
	.word	0x8aa87e37
	.word	0x4e1f3ab1
	.word	0xffee37ea
	.word	0x853783eb
	.word	0xe2f1e579
	.word	0x20fbdd35
	.word	0x2c72a0c8
	.word	0xd67f3aaa
	.word	0xe5959867
	.word	0x873bc145
	.word	0x1b54bde1
	.word	0xa9b8e20d
	.word	0xecbf3c33
	.word	0x26d81e62
	.word	0x7ff6cabc
	.word	0xd578c827
	.word	0xeb1ffe25
	.word	0xafff349a
	.word	0xccc8a816
	.word	0x44013712
	.word	0x862df7ae
	.word	0x986be109
	.word	0x08b0b018
	.word	0xb77b8710
	.word	0xd9ed3fbc
	.word	0xef0376a1
	.word	0x86b119cc
	.word	0xd9adaef2
	.word	0x1d283d4f
	.word	0x5a71df2d
	.word	0x7bbb9fcd
	.word	0xf4cdf6bc
	.word	0x6d420f4b
	.word	0x7a784892
	.word	0xcf8c5e3e
	.word	0xb90cb089
	.word	0xd0271d90
	.word	0xf422e258
	.word	0xc5801bfc
	.word	0x39861bac
	.word	0xd68d2747
	.word	0x215e6f68
	.word	0x78e97317
	.word	0x41ccd618
	.word	0xa9f5627e
	.word	0x64aeb017
	.word	0x98ab8c7d
	.word	0x5d5f8001
	.word	0xfdf880f7
	.word	0x7e52e862
	.word	0x371862f8
	.word	0x5a6275c2
	.word	0xac8dae3d
	.word	0x7136067b
	.word	0x007bc15a
	.word	0xd320c401
	.word	0x667adaf7
	.word	0xcfdc2d84
	.word	0x4b9b6ff5
	.word	0xdc65ba10
	.word	0x152de980
	.word	0xf457a899
	.word	0x7f084550
	.word	0x7bf2be96
	.word	0x67238fb6
	.word	0x3e6b8a14
	.word	0x6ba30e18
	.word	0x086b4a6e
	.word	0xacfa0211
	.word	0x08a27b0b
	.word	0xeb738055
	.word	0x354b2dce
t0_data_exp_sp:
	.word	0x289abbf7
	.word	0x6c847f1d
	.word	0x2b1eaddd
	.word	0xe01983ab
	.word	0x4ac7f94f
	.word	0xff7eb06e
	.word	0x172daa0c
	.word	0xea4cf75c
	.word	t0_data_exp_area0
	.word	t0_data_exp_area0
	.word	0xfffffff1
	.word	0xffffffe8
	.word	0xfffffff4
	.word	0xfffffff8
	.word	t0_data_exp_fp
	.word	0xf66005e2
	.word	0x3cb38c52
	.word	0x6bbff916
	.word	0x260fd0b6
	.word	0xc5830e9d
	.word	0x41f11183
	.word	0x4cd931fb
	.word	0xab35722a
	.word	0x84530f8d
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
	.word   	0x5d7315b6	! [%fp - 0xc]
	.word   	0xd4026975	! [%fp - 0x8]
	.word   	0x48ff78de	! [%fp - 0x4]
t0_data_exp_fp:
	.word	0xeaea207d
	.word	0x0d242321
	.word	0x2c86c821
	.word	0xc6323ae6
	.word	0x6a379518
	.word	0xffbfbbf8
	.word	0xc695c818
	.word	0xc02f94e0
	.word	0x22d6f2ac
	.word	0xd7d716dc
	.word	0xf487aa4f
	.word	0x12c4bd8d
	.word	0x6839fe30
	.word	0x3100ae91
	.word	0x6d295e41
	.word	0x47c93ea3
	.word	0x56572688
	.word	0xfd4498f4
	.word	0x29ecbfca
	.word	0x4f7426e0
	.word	0x5b5dcf06
	.word	0x4b82d92b
	.word	0xae444f56
	.word	0x4309c962
t0_data_exp_stacktop:
	.word	0
t0_data_exp_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_exp_area0, 0x2b24e000)
.seg "data"
t0_data_exp_area0_start:
.skip 7872
t0_data_exp_area0_begin:
	.word	0x6f063e34	! t0_data_exp_area0-0x20
	.word	0xb9b0211e	! t0_data_exp_area0-0x1c
	.word	0x303fc83a	! t0_data_exp_area0-0x18
	.word	0xbad59e35	! t0_data_exp_area0-0x14
	.word	0x8e2b34d0	! t0_data_exp_area0-0x10
	.word	0xc298b625	! t0_data_exp_area0-0xc
	.word	0xbbf13961	! t0_data_exp_area0-0x8
	.word	0xa389182d	! t0_data_exp_area0-0x4
.global t0_data_exp_area0; t0_data_exp_area0:
	.word	0xbfb77117	! t0_data_exp_area0+0x0
	.word	0x35a06d01	! t0_data_exp_area0+0x4
	.word	0x8978842b	! t0_data_exp_area0+0x8
	.word	0xe75183f6	! t0_data_exp_area0+0xc
	.word	0xb7d1a246	! t0_data_exp_area0+0x10
	.word	0x22f1f110	! t0_data_exp_area0+0x14
	.word	0xc30d6591	! t0_data_exp_area0+0x18
	.word	0x69844469	! t0_data_exp_area0+0x1c
t0_data_exp_area0_end:
.skip 256
t0_data_exp_area0_stop:

KDATA_MODULE(t0_module_data_exp_shm_area, 0x5ae86000)
.seg "data"
t0_data_exp_shm_area_start:
t0_data_exp_shm_area_begin:
.global t0_data_exp_shm_area; t0_data_exp_shm_area:
	.word	0x33d5905d	! t0_data_exp_shm_area+0x0 (t0)
	.word	0x7efecabc	! t0_data_exp_shm_area+0x4 (t0)
	.word	0xb33e6d8c	! t0_data_exp_shm_area+0x8 (t0)
	.word	0x11e20020	! t0_data_exp_shm_area+0xc (t0)
	.word	0x7d517c25	! t0_data_exp_shm_area+0x10 (t0)
	.word	0x8854d934	! t0_data_exp_shm_area+0x14 (t0)
	.word	0x361d88b7	! t0_data_exp_shm_area+0x18 (t0)
	.word	0x1b66944c	! t0_data_exp_shm_area+0x1c (t0)
	.word	0x802afb74	! t0_data_exp_shm_area+0x20 (t0)
	.word	0x59e5335e	! t0_data_exp_shm_area+0x24 (t0)
	.word	0xa8790032	! t0_data_exp_shm_area+0x28 (t0)
	.word	0xc3a4e0c5	! t0_data_exp_shm_area+0x2c (t0)
	.word	0x687ed5af	! t0_data_exp_shm_area+0x30 (t0)
	.word	0x0523a40c	! t0_data_exp_shm_area+0x34 (t0)
	.word	0xe8ca13ca	! t0_data_exp_shm_area+0x38 (t0)
	.word	0x600ac162	! t0_data_exp_shm_area+0x3c (t0)
	.word	0x7403a491	! t0_data_exp_shm_area+0x40 (t0 bload)
	.word	0x8225356d	! t0_data_exp_shm_area+0x44
	.word	0x2c709256	! t0_data_exp_shm_area+0x48
	.word	0xe75ac88a	! t0_data_exp_shm_area+0x4c
	.word	0x30ef3d2a	! t0_data_exp_shm_area+0x50
	.word	0xdb577fc5	! t0_data_exp_shm_area+0x54
	.word	0xf3651463	! t0_data_exp_shm_area+0x58
	.word	0x1c6e8f0b	! t0_data_exp_shm_area+0x5c
	.word	0xb5db2529	! t0_data_exp_shm_area+0x60
	.word	0x4dd1af60	! t0_data_exp_shm_area+0x64
	.word	0xab01bd13	! t0_data_exp_shm_area+0x68
	.word	0xc52dad2a	! t0_data_exp_shm_area+0x6c
	.word	0xe324985d	! t0_data_exp_shm_area+0x70
	.word	0xf1db75c4	! t0_data_exp_shm_area+0x74
	.word	0x201ba541	! t0_data_exp_shm_area+0x78
	.word	0x12d2b0fa	! t0_data_exp_shm_area+0x7c
	.word	0xab08e278	! t0_data_exp_shm_area+0x80 (t0 bstore)
	.word	0xa0555a25	! t0_data_exp_shm_area+0x84
	.word	0xa7a554e9	! t0_data_exp_shm_area+0x88
	.word	0x8858a5f1	! t0_data_exp_shm_area+0x8c
	.word	0xea871116	! t0_data_exp_shm_area+0x90
	.word	0xa4711d1d	! t0_data_exp_shm_area+0x94
	.word	0x75b4eec7	! t0_data_exp_shm_area+0x98
	.word	0x068101b7	! t0_data_exp_shm_area+0x9c
	.word	0x061c41fd	! t0_data_exp_shm_area+0xa0
	.word	0xc4e0239c	! t0_data_exp_shm_area+0xa4
	.word	0x6b4ef23d	! t0_data_exp_shm_area+0xa8
	.word	0x0b8b0a41	! t0_data_exp_shm_area+0xac
	.word	0x430011a6	! t0_data_exp_shm_area+0xb0
	.word	0xe7891d1c	! t0_data_exp_shm_area+0xb4
	.word	0x4e00b779	! t0_data_exp_shm_area+0xb8
	.word	0xd4b3091e	! t0_data_exp_shm_area+0xbc
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
#define T0_KAOS_SEED          d31a6aac0cf1
#define T0_KAOS_ICOUNT        4000
#define T0_KAOS_AREAS         1
#define T0_KAOS_AREASIZE      64
#define T0_KAOS_AREAOFFSET    7872
#define T0_KAOS_PAGESIZE      8192
#define T0_KAOS_CODECOUNT     4002

#define T0_KAOS_BOOT_VA                  0x0f250000
#define T0_KAOS_BOOT_PA                  0x0000000000022000
#define T0_KAOS_BOOT_CACHEABLE           1
#define T0_KAOS_BOOT_NONCACHEABLE        0

#define T0_KAOS_STARTUP_VA               0x21fee000
#define T0_KAOS_STARTUP_PA               0x0000000002ecc000
#define T0_KAOS_STARTUP_CACHEABLE        1
#define T0_KAOS_STARTUP_NONCACHEABLE     0

#define T0_KAOS_OFFSET_TBL_VA            0x4f628000
#define T0_KAOS_OFFSET_TBL_PA            0x00000000045d2000
#define T0_KAOS_OFFSET_TBL_CACHEABLE     1
#define T0_KAOS_OFFSET_TBL_NONCACHEABLE  0

#define T0_KAOS_DONE_VA                  0x6ba0c000
#define T0_KAOS_DONE_PA                  0x0000000007382000
#define T0_KAOS_DONE_CACHEABLE           1
#define T0_KAOS_DONE_NONCACHEABLE        0

#define T0_KAOS_KTBL_VA                  0x2deba000
#define T0_KAOS_KTBL_PA                  0x000000000989a000
#define T0_KAOS_KTBL_CACHEABLE           1
#define T0_KAOS_KTBL_NONCACHEABLE        0

#define T0_KAOS_SUBR0_VA                 0x4c2c8000
#define T0_KAOS_SUBR0_PA                 0x000000000bfa6000
#define T0_KAOS_SUBR0_CACHEABLE          1
#define T0_KAOS_SUBR0_NONCACHEABLE       0
#define T0_KAOS_SUBR1_VA                 0x2de0a000
#define T0_KAOS_SUBR1_PA                 0x000000000c754000
#define T0_KAOS_SUBR1_CACHEABLE          1
#define T0_KAOS_SUBR1_NONCACHEABLE       0
#define T0_KAOS_SUBR2_VA                 0x2d89c000
#define T0_KAOS_SUBR2_PA                 0x000000000ecf0000
#define T0_KAOS_SUBR2_CACHEABLE          1
#define T0_KAOS_SUBR2_NONCACHEABLE       0
#define T0_KAOS_SUBR3_VA                 0x5977a000
#define T0_KAOS_SUBR3_PA                 0x0000000011c88000
#define T0_KAOS_SUBR3_CACHEABLE          1
#define T0_KAOS_SUBR3_NONCACHEABLE       0

#define T0_KAOS_EXP_REGS_VA              0x1a36e000
#define T0_KAOS_EXP_REGS_PA              0x00000000133c2000
#define T0_KAOS_EXP_REGS_CACHEABLE       1
#define T0_KAOS_EXP_REGS_NONCACHEABLE    0
#define T0_KAOS_RUN_REGS_VA              0x41a8a000
#define T0_KAOS_RUN_REGS_PA              0x0000000014490000
#define T0_KAOS_RUN_REGS_CACHEABLE       1
#define T0_KAOS_RUN_REGS_NONCACHEABLE    0

#define T0_KAOS_EXP_STACK_VA             0x55b00000
#define T0_KAOS_EXP_STACK_PA             0x0000000017f2c000
#define T0_KAOS_EXP_STACK_CACHEABLE      1
#define T0_KAOS_EXP_STACK_NONCACHEABLE   0
#define T0_KAOS_RUN_STACK_VA             0x165be000
#define T0_KAOS_RUN_STACK_PA             0x0000000018156000
#define T0_KAOS_RUN_STACK_CACHEABLE      1
#define T0_KAOS_RUN_STACK_NONCACHEABLE   0

#define T0_KAOS_AREA0
#define T0_KAOS_EXP_AREA0_VA             0x2b24e000
#define T0_KAOS_EXP_AREA0_PA             0x000000001baf6000
#define T0_KAOS_EXP_AREA0_CACHEABLE      1
#define T0_KAOS_EXP_AREA0_NONCACHEABLE   0
#define T0_KAOS_RUN_AREA0_VA             0x2b114000
#define T0_KAOS_RUN_AREA0_PA             0x000000001c532000
#define T0_KAOS_RUN_AREA0_CACHEABLE      1
#define T0_KAOS_RUN_AREA0_NONCACHEABLE   0

#define T0_KAOS_SHM_AREA
#define T0_KAOS_EXP_SHM_AREA_VA          0x5ae86000
#define T0_KAOS_EXP_SHM_AREA_PA          0x000000000101c000
#define T0_KAOS_EXP_SHM_AREA_CACHEABLE   1
#define T0_KAOS_EXP_SHM_AREA_NONCACHEABLE 0
#define T0_KAOS_RUN_SHM_AREA_VA          0x09006000
#define T0_KAOS_RUN_SHM_AREA_PA          0x0000000000032000
#define T0_KAOS_RUN_SHM_AREA_CACHEABLE   1
#define T0_KAOS_RUN_SHM_AREA_NONCACHEABLE 0

#define T0_KAOS_RANVAL_00     0x7bdaedfc
#define T0_KAOS_RANVAL_01     0x16355919
#define T0_KAOS_RANVAL_02     0xdf6409d7
#define T0_KAOS_RANVAL_03     0xaa20e010
#define T0_KAOS_RANVAL_04     0x1f485162
#define T0_KAOS_RANVAL_05     0xbcb97fc0
#define T0_KAOS_RANVAL_06     0x48578483
#define T0_KAOS_RANVAL_07     0xc852d2de
#define T0_KAOS_RANVAL_08     0x6b1329fb
#define T0_KAOS_RANVAL_09     0x5124a1e6
#define T0_KAOS_RANVAL_0a     0x4a4d9562
#define T0_KAOS_RANVAL_0b     0xbd8a9a68
#define T0_KAOS_RANVAL_0c     0x213af124
#define T0_KAOS_RANVAL_0d     0x1fbbd43b
#define T0_KAOS_RANVAL_0e     0x52ce4a32
#define T0_KAOS_RANVAL_0f     0xab9014fc
#define T0_KAOS_RANVAL_10     0xd7b43745
#define T0_KAOS_RANVAL_11     0x0e37c9bf
#define T0_KAOS_RANVAL_12     0xf0664bef
#define T0_KAOS_RANVAL_13     0x3f7e27e7
#define T0_KAOS_RANVAL_14     0xd9bfa7c9
#define T0_KAOS_RANVAL_15     0xe71d2173
#define T0_KAOS_RANVAL_16     0xf6ffac78
#define T0_KAOS_RANVAL_17     0xbf83a64d
#define T0_KAOS_RANVAL_18     0xf5dec96a
#define T0_KAOS_RANVAL_19     0x265f5b54
#define T0_KAOS_RANVAL_1a     0x72476a72
#define T0_KAOS_RANVAL_1b     0xc2cb513d
#define T0_KAOS_RANVAL_1c     0xa61dfeb1
#define T0_KAOS_RANVAL_1d     0x8f09a884
#define T0_KAOS_RANVAL_1e     0x118ccf6c
#define T0_KAOS_RANVAL_1f     0xcf5b44ff
#define T0_KAOS_RANVAL_20     0xa5df8abd
#define T0_KAOS_RANVAL_21     0xb5a80aca
#define T0_KAOS_RANVAL_22     0x1fb60c44
#define T0_KAOS_RANVAL_23     0x95ed67b0
#define T0_KAOS_RANVAL_24     0x28cb9e42
#define T0_KAOS_RANVAL_25     0x87de773c
#define T0_KAOS_RANVAL_26     0x1db7b7c8
#define T0_KAOS_RANVAL_27     0x09c7ad10
#define T0_KAOS_RANVAL_28     0xae45b0d4
#define T0_KAOS_RANVAL_29     0x0642f03a
#define T0_KAOS_RANVAL_2a     0x5cb3139f
#define T0_KAOS_RANVAL_2b     0x6bb4439a
#define T0_KAOS_RANVAL_2c     0x8c07aa65
#define T0_KAOS_RANVAL_2d     0x6d6aca9e
#define T0_KAOS_RANVAL_2e     0x48b93b6a
#define T0_KAOS_RANVAL_2f     0x28a6fed5
#define T0_KAOS_RANVAL_30     0x3587a10c
#define T0_KAOS_RANVAL_31     0xed6a9231
#define T0_KAOS_RANVAL_32     0xa46fa225
#define T0_KAOS_RANVAL_33     0x579e92ea
#define T0_KAOS_RANVAL_34     0x74d52f07
#define T0_KAOS_RANVAL_35     0x7f0b4160
#define T0_KAOS_RANVAL_36     0x92b481d3
#define T0_KAOS_RANVAL_37     0xb4257575
#define T0_KAOS_RANVAL_38     0xf8e7a503
#define T0_KAOS_RANVAL_39     0x0aeec02f
#define T0_KAOS_RANVAL_3a     0xac28215a
#define T0_KAOS_RANVAL_3b     0x44bf779f
#define T0_KAOS_RANVAL_3c     0x0d269c9a
#define T0_KAOS_RANVAL_3d     0xcc08de6c
#define T0_KAOS_RANVAL_3e     0x5d6a14ab
#define T0_KAOS_RANVAL_3f     0xdbce6d6c
#define T0_KAOS_RANVAL_40     0x028aaf1c
#define T0_KAOS_RANVAL_41     0xeb713d28
#define T0_KAOS_RANVAL_42     0xa627db25
#define T0_KAOS_RANVAL_43     0x4f497651
#define T0_KAOS_RANVAL_44     0xd44c5491
#define T0_KAOS_RANVAL_45     0xcae5db63
#define T0_KAOS_RANVAL_46     0xeb0c803b
#define T0_KAOS_RANVAL_47     0x7547bb09
#define T0_KAOS_RANVAL_48     0x2cf32efe
#define T0_KAOS_RANVAL_49     0x449d3a06
#define T0_KAOS_RANVAL_4a     0xab772253
#define T0_KAOS_RANVAL_4b     0x9218b4a8
#define T0_KAOS_RANVAL_4c     0xf4f845e7
#define T0_KAOS_RANVAL_4d     0x7d824b15
#define T0_KAOS_RANVAL_4e     0x79d883f1
#define T0_KAOS_RANVAL_4f     0x2db150f0
#define T0_KAOS_RANVAL_50     0x9651f615
#define T0_KAOS_RANVAL_51     0x61e3a024
#define T0_KAOS_RANVAL_52     0xe0f60b14
#define T0_KAOS_RANVAL_53     0x0ad687e2
#define T0_KAOS_RANVAL_54     0xb8689999
#define T0_KAOS_RANVAL_55     0xd7428c0a
#define T0_KAOS_RANVAL_56     0xdb52d2e0
#define T0_KAOS_RANVAL_57     0xdfe33698
#define T0_KAOS_RANVAL_58     0x425f2c10
#define T0_KAOS_RANVAL_59     0x5f862bd4
#define T0_KAOS_RANVAL_5a     0x02e5b37c
#define T0_KAOS_RANVAL_5b     0x30905351
#define T0_KAOS_RANVAL_5c     0x4e8b6f27
#define T0_KAOS_RANVAL_5d     0xd5a18afc
#define T0_KAOS_RANVAL_5e     0xa04d643d
#define T0_KAOS_RANVAL_5f     0x4f03cecd
#define T0_KAOS_RANVAL_60     0x8dad5361
#define T0_KAOS_RANVAL_61     0x00fb56db
#define T0_KAOS_RANVAL_62     0xa0221c03
#define T0_KAOS_RANVAL_63     0xb9dbb6db
#define T0_KAOS_RANVAL_64     0x8b2da917
#define T0_KAOS_RANVAL_65     0x9ed8d55b
#define T0_KAOS_RANVAL_66     0x351653e3
#define T0_KAOS_RANVAL_67     0x3a306e2f
#define T0_KAOS_RANVAL_68     0xc1a85dc0
#define T0_KAOS_RANVAL_69     0xc6f512f0
#define T0_KAOS_RANVAL_6a     0x748e9006
#define T0_KAOS_RANVAL_6b     0xd8e20d79
#define T0_KAOS_RANVAL_6c     0x6886c972
#define T0_KAOS_RANVAL_6d     0x05887bc8
#define T0_KAOS_RANVAL_6e     0x937252d0
#define T0_KAOS_RANVAL_6f     0xdb3241b2
#define T0_KAOS_RANVAL_70     0x0cb2d0a9
#define T0_KAOS_RANVAL_71     0x68945440
#define T0_KAOS_RANVAL_72     0x00769e44
#define T0_KAOS_RANVAL_73     0xe4ed3bb8
#define T0_KAOS_RANVAL_74     0x17b3de46
#define T0_KAOS_RANVAL_75     0x0388c49a
#define T0_KAOS_RANVAL_76     0x8244a7a6
#define T0_KAOS_RANVAL_77     0x6779851d
#define T0_KAOS_RANVAL_78     0x5e12f9d9
#define T0_KAOS_RANVAL_79     0xfa936bed
#define T0_KAOS_RANVAL_7a     0xb0e5a161
#define T0_KAOS_RANVAL_7b     0x024fce3b
#define T0_KAOS_RANVAL_7c     0x27f37e22
#define T0_KAOS_RANVAL_7d     0x194fae5c
#define T0_KAOS_RANVAL_7e     0xb506bf2b
#define T0_KAOS_RANVAL_7f     0x17d9098b
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
/* @(#)kaos.h	1.34 03/15/02 17:10:21
 * kaos data area and stack frame
 */
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
/* @(#)kaos_startup.s	1.64 02/04/97 08:57:11
 * Assembly linkage to code generated by ktbgen
 *
 * If you add a simulation vs. silicon #if in here, be sure to
 * have a #else clause with nop's to make the addresses come out
 * the same in both simulation and silicon.
 */

/* @(#)kaos.h	1.34 03/15/02 17:10:21
 * kaos data area and stack frame
 */
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
!    areaoffset     7872
!    ncache         0
!    emulate_ncache 1
!    pagesize       8192
!    invsize        0
!    codecount      4002
!    code           2deba000
!    entry          2deba000
!    fsr_exceptions 00000000
!    fsr_roundmode  00000004
!    fsr_mask       c0000fff
!    seed           d31a6aac0cf1
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

KTEXT_MODULE(t0_module_ktbl, 0x2deba000)
.seg "text"
	KGLOBAL(t0_ktbl)
t0_ktbl_page_begin:
.global t0_kref; t0_kref:
	.skip 0
t0_ktbl:
	.word	0x96c6b3bd	! t0_kref+0x0:   	addccc	%i2, -0xc43, %o3
	.word	0x95a0192a	! t0_kref+0x4:   	fstod	%f10, %f10
	.word	0x95b2872a	! t0_kref+0x8:   	fmuld8ulx16	%f10, %f10, %f10
	.word	0x95a000ca	! t0_kref+0xc:   	fnegd	%f10, %f10
	.word	0xe43e0000	! t0_kref+0x10:   	std	%l2, [%i0]
	.word	0x9744c000	! t0_kref+0x14:   	mov	%gsr, %o3
	.word	0x9f414000	! t0_kref+0x18:   	mov	%pc, %o7
	.word	0x96b6a8b4	! t0_kref+0x1c:   	orncc	%i2, 0x8b4, %o3
	.word	0xd51f4019	! t0_kref+0x20:   	ldd	[%i5 + %i1], %f10
	.word	0x97b00120	! t0_kref+0x24:   	edge32n	%g0, %g0, %o3
	.word	0x95a289ab	! t0_kref+0x28:   	fdivs	%f10, %f11, %f10
	.word	0x965e801a	! t0_kref+0x2c:   	smul	%i2, %i2, %o3
	.word	0x95b2cea0	! t0_kref+0x30:   	fsrc1s	%f11, %f10
	.word	0x972ea017	! t0_kref+0x34:   	sll	%i2, 0x17, %o3
	.word	0x95b28aca	! t0_kref+0x38:   	fpsub32	%f10, %f10, %f10
	.word	0x9656801a	! t0_kref+0x3c:   	umul	%i2, %i2, %o3
	.word	0x9728200d	! t0_kref+0x40:   	sll	%g0, 0xd, %o3
	.word	0x96a82a41	! t0_kref+0x44:   	andncc	%g0, 0xa41, %o3
	.word	0xf4366006	! t0_kref+0x48:   	sth	%i2, [%i1 + 6]
	.word	0x9fc00004	! t0_kref+0x4c:   	call	%g0 + %g4
	.word	0x1704fc50	! t0_kref+0x50:   	sethi	%hi(0x13f14000), %o3
	.word	0x9f414000	! t0_kref+0x54:   	mov	%pc, %o7
	.word	0xd51fbe60	! t0_kref+0x58:   	ldd	[%fp - 0x1a0], %f10
	.word	0x9618001a	! t0_kref+0x5c:   	xor	%g0, %i2, %o3
	.word	0x963ea3f7	! t0_kref+0x60:   	xnor	%i2, 0x3f7, %o3
	.word	0x81580000	! t0_kref+0x64:   	flushw
	.word	0xd51fbd48	! t0_kref+0x68:   	ldd	[%fp - 0x2b8], %f10
	.word	0x95a0192a	! t0_kref+0x6c:   	fstod	%f10, %f10
	.word	0x95a2894a	! t0_kref+0x70:   	fmuld	%f10, %f10, %f10
	.word	0x97368000	! t0_kref+0x74:   	srl	%i2, %g0, %o3
	.word	0x8143c000	! t0_kref+0x78:   	stbar
	.word	0x95a000ab	! t0_kref+0x7c:   	fnegs	%f11, %f10
	.word	0xd6100019	! t0_kref+0x80:   	lduh	[%g0 + %i1], %o3
	.word	0x97a0052b	! t0_kref+0x84:   	fsqrts	%f11, %f11
	.word	0x95a2894a	! t0_kref+0x88:   	fmuld	%f10, %f10, %f10
	.word	0x960e8000	! t0_kref+0x8c:   	and	%i2, %g0, %o3
	.word	0x96b68000	! t0_kref+0x90:   	orncc	%i2, %g0, %o3
	.word	0x97a01a2a	! t0_kref+0x94:   	fstoi	%f10, %f11
	.word	0x95a9804a	! t0_kref+0x98:   	fmovdg	%fcc0, %f10, %f10
	.word	0xd6564000	! t0_kref+0x9c:   	ldsh	[%i1], %o3
	.word	0x96b82607	! t0_kref+0xa0:   	xnorcc	%g0, 0x607, %o3
	.word	0x9700001a	! t0_kref+0xa4:   	taddcc	%g0, %i2, %o3
	.word	0x95a0054a	! t0_kref+0xa8:   	fsqrtd	%f10, %f10
	.word	0x81dec00c	! t0_kref+0xac:   	flush	%i3 + %o4
	.word	0x97b68020	! t0_kref+0xb0:   	edge8n	%i2, %g0, %o3
	.word	0x95b00ceb	! t0_kref+0xb4:   	fnot2s	%f11, %f10
	.word	0x96303269	! t0_kref+0xb8:   	orn	%g0, -0xd97, %o3
	.word	0x97618000	! t0_kref+0xbc:   	movg	%fcc0, %g0, %o3
	.word	0x9fc00004	! t0_kref+0xc0:   	call	%g0 + %g4
	.word	0xc768a042	! t0_kref+0xc4:   	prefetch	%g2 + 0x42, 3
	.word	0x967eb645	! t0_kref+0xc8:   	sdiv	%i2, -0x9bb, %o3
	.word	0xc807bfe8	! t0_kref+0xcc:   	ld	[%fp - 0x18], %g4
	.word	0xd6801018	! t0_kref+0xd0:   	lda	[%g0 + %i0]0x80, %o3
	.word	0x86102002	! t0_kref+0xd4:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0xd8:   	bne,a	_kref+0xd8
	.word	0x86a0e001	! t0_kref+0xdc:   	subcc	%g3, 1, %g3
	.word	0x95a2cd2b	! t0_kref+0xe0:   	fsmuld	%f11, %f11, %f10
	.word	0xc568a088	! t0_kref+0xe4:   	prefetch	%g2 + 0x88, 2
	.word	0xa7800000	! t0_kref+0xe8:   	mov	%g0, %gsr
	.word	0x83414000	! t0_kref+0xec:   	mov	%pc, %g1
	.word	0xc807bfec	! t0_kref+0xf0:   	ld	[%fp - 0x14], %g4
	.word	0xd6163ffc	! t0_kref+0xf4:   	lduh	[%i0 - 4], %o3
	.word	0x95b2cd60	! t0_kref+0xf8:   	fnot1s	%f11, %f10
	.word	0x96568000	! t0_kref+0xfc:   	umul	%i2, %g0, %o3
	.word	0x95a0192a	! t0_kref+0x100:   	fstod	%f10, %f10
	.word	0x81800000	! t0_kref+0x104:   	mov	%g0, %y
	.word	0x95a2894a	! t0_kref+0x108:   	fmuld	%f10, %f10, %f10
	.word	0xf207bfe0	! t0_kref+0x10c:   	ld	[%fp - 0x20], %i1
	.word	0x95b00c00	! t0_kref+0x110:   	fzero	%f10
	.word	0x97003fcb	! t0_kref+0x114:   	taddcc	%g0, -0x35, %o3
	.word	0x97a0012b	! t0_kref+0x118:   	fabss	%f11, %f11
	.word	0x97a2892a	! t0_kref+0x11c:   	fmuls	%f10, %f10, %f11
	.word	0x95a288ca	! t0_kref+0x120:   	fsubd	%f10, %f10, %f10
	.word	0x95b2870b	! t0_kref+0x124:   	fmuld8sux16	%f10, %f11, %f10
	.word	0x95b28e0a	! t0_kref+0x128:   	fand	%f10, %f10, %f10
	.word	0x972ea007	! t0_kref+0x12c:   	sll	%i2, 0x7, %o3
	.word	0x96e6bd4d	! t0_kref+0x130:   	subccc	%i2, -0x2b3, %o3
	.word	0x95a0192a	! t0_kref+0x134:   	fstod	%f10, %f10
	.word	0x97b284ca	! t0_kref+0x138:   	fcmpne32	%f10, %f10, %o3
	.word	0x96e00000	! t0_kref+0x13c:   	subccc	%g0, %g0, %o3
	.word	0x9766801a	! t0_kref+0x140:   	movg	%icc, %i2, %o3
	.word	0x97b28e2a	! t0_kref+0x144:   	fands	%f10, %f10, %f11
	.word	0x97b284ca	! t0_kref+0x148:   	fcmpne32	%f10, %f10, %o3
	.word	0x96300000	! t0_kref+0x14c:   	orn	%g0, %g0, %o3
	.word	0x95a289ab	! t0_kref+0x150:   	fdivs	%f10, %f11, %f10
	.word	0x97a000ab	! t0_kref+0x154:   	fnegs	%f11, %f11
	.word	0x961ebb41	! t0_kref+0x158:   	xor	%i2, -0x4bf, %o3
	.word	0x97a9002b	! t0_kref+0x15c:   	fmovsl	%fcc0, %f11, %f11
	.word	0x96d0001a	! t0_kref+0x160:   	umulcc	%g0, %i2, %o3
	.word	0x95a000aa	! t0_kref+0x164:   	fnegs	%f10, %f10
	.word	0x96e00000	! t0_kref+0x168:   	subccc	%g0, %g0, %o3
	.word	0xe56e3fe8	! t0_kref+0x16c:   	prefetch	%i0 - 0x18, 18
	.word	0xf4b61000	! t0_kref+0x170:   	stha	%i2, [%i0]0x80
	.word	0x96568000	! t0_kref+0x174:   	umul	%i2, %g0, %o3
	.word	0x96f03e3d	! t0_kref+0x178:   	udivcc	%g0, -0x1c3, %o3
	.word	0x97400000	! t0_kref+0x17c:   	mov	%y, %o3
	.word	0x97a0052b	! t0_kref+0x180:   	fsqrts	%f11, %f11
	.word	0xd19e9a18	! t0_kref+0x184:   	ldda	[%i2 + %i0]0xd0, %f8
	.word	0x95b28a4a	! t0_kref+0x188:   	fpadd32	%f10, %f10, %f10
	.word	0x9740c000	! t0_kref+0x18c:   	mov	%asi, %o3
	.word	0x97b2cf6a	! t0_kref+0x190:   	fornot1s	%f11, %f10, %f11
	.word	0x95b2cc6a	! t0_kref+0x194:   	fnors	%f11, %f10, %f10
	.word	0xd600a02c	! t0_kref+0x198:   	ld	[%g2 + 0x2c], %o3
	.word	0xe41e6010	! t0_kref+0x19c:   	ldd	[%i1 + 0x10], %l2
	.word	0x95b28d40	! t0_kref+0x1a0:   	fnot1	%f10, %f10
	.word	0x97b284ca	! t0_kref+0x1a4:   	fcmpne32	%f10, %f10, %o3
	.word	0x95a0192b	! t0_kref+0x1a8:   	fstod	%f11, %f10
	.word	0x95b28d0a	! t0_kref+0x1ac:   	fandnot1	%f10, %f10, %f10
	.word	0x95a0192b	! t0_kref+0x1b0:   	fstod	%f11, %f10
	.word	0xc0360000	! t0_kref+0x1b4:   	clrh	[%i0]
	.word	0xd700a004	! t0_kref+0x1b8:   	ld	[%g2 + 4], %f11
	.word	0xc0f6501d	! t0_kref+0x1bc:   	stxa	%g0, [%i1 + %i5]0x80
	.word	0x96be801a	! t0_kref+0x1c0:   	xnorcc	%i2, %i2, %o3
	.word	0x86102003	! t0_kref+0x1c4:   	mov	0x3, %g3
	.word	0x86a0e001	! t0_kref+0x1c8:   	subcc	%g3, 1, %g3
	.word	0x2280000b	! t0_kref+0x1cc:   	be,a	_kref+0x1f8
	.word	0xe3e65000	! t0_kref+0x1d0:   	casa	[%i1]0x80, %g0, %l1
	.word	0x9740c000	! t0_kref+0x1d4:   	mov	%asi, %o3
	.word	0x97b68200	! t0_kref+0x1d8:   	array8	%i2, %g0, %o3
	.word	0x95a0054a	! t0_kref+0x1dc:   	fsqrtd	%f10, %f10
	.word	0x95b2872b	! t0_kref+0x1e0:   	fmuld8ulx16	%f10, %f11, %f10
	.word	0x95b28ea0	! t0_kref+0x1e4:   	fsrc1s	%f10, %f10
	.word	0x97b2cdab	! t0_kref+0x1e8:   	fxors	%f11, %f11, %f11
	.word	0x96d6801a	! t0_kref+0x1ec:   	umulcc	%i2, %i2, %o3
	.word	0x97a0188a	! t0_kref+0x1f0:   	fitos	%f10, %f11
	.word	0x85868000	! t0_kref+0x1f4:   	wr	%i2, %g0, %ccr
	.word	0x9736a016	! t0_kref+0x1f8:   	srl	%i2, 0x16, %o3
	.word	0xd6d81019	! t0_kref+0x1fc:   	ldxa	[%g0 + %i1]0x80, %o3
	.word	0xd5267ff0	! t0_kref+0x200:   	st	%f10, [%i1 - 0x10]
	.word	0x97a01a4a	! t0_kref+0x204:   	fdtoi	%f10, %f11
	.word	0x9646801a	! t0_kref+0x208:   	addc	%i2, %i2, %o3
	.word	0xe01e4000	! t0_kref+0x20c:   	ldd	[%i1], %l0
	.word	0x96f0001a	! t0_kref+0x210:   	udivcc	%g0, %i2, %o3
	.word	0x97400000	! t0_kref+0x214:   	mov	%y, %o3
	.word	0x97a01a4a	! t0_kref+0x218:   	fdtoi	%f10, %f11
	.word	0x9fc10000	! t0_kref+0x21c:   	call	%g4
	.word	0x96703e98	! t0_kref+0x220:   	udiv	%g0, -0x168, %o3
	.word	0x972e801a	! t0_kref+0x224:   	sll	%i2, %i2, %o3
	.word	0x9646801a	! t0_kref+0x228:   	addc	%i2, %i2, %o3
	.word	0x97200000	! t0_kref+0x22c:   	mulscc	%g0, %g0, %o3
	.word	0xe03e001d	! t0_kref+0x230:   	std	%l0, [%i0 + %i5]
	.word	0x97400000	! t0_kref+0x234:   	mov	%y, %o3
	.word	0x95a28d2a	! t0_kref+0x238:   	fsmuld	%f10, %f10, %f10
	.word	0x95a2cd2b	! t0_kref+0x23c:   	fsmuld	%f11, %f11, %f10
	.word	0xd53f4019	! t0_kref+0x240:   	std	%f10, [%i5 + %i1]
	.word	0x97a0002a	! t0_kref+0x244:   	fmovs	%f10, %f11
	.word	0x86102001	! t0_kref+0x248:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x24c:   	bne,a	_kref+0x24c
	.word	0x86a0e001	! t0_kref+0x250:   	subcc	%g3, 1, %g3
	.word	0x961833ae	! t0_kref+0x254:   	xor	%g0, -0xc52, %o3
	.word	0x9640001a	! t0_kref+0x258:   	addc	%g0, %i2, %o3
	.word	0x8143c000	! t0_kref+0x25c:   	stbar
	.word	0x97400000	! t0_kref+0x260:   	mov	%y, %o3
	.word	0x96182f49	! t0_kref+0x264:   	xor	%g0, 0xf49, %o3
	.word	0xd656001b	! t0_kref+0x268:   	ldsh	[%i0 + %i3], %o3
	.word	0x97200000	! t0_kref+0x26c:   	mulscc	%g0, %g0, %o3
	.word	0x97b2850a	! t0_kref+0x270:   	fcmpgt16	%f10, %f10, %o3
	.word	0xd51e6010	! t0_kref+0x274:   	ldd	[%i1 + 0x10], %f10
	.word	0x97b6803a	! t0_kref+0x278:   	edge8n	%i2, %i2, %o3
	.word	0x97400000	! t0_kref+0x27c:   	mov	%y, %o3
	.word	0x97b00ceb	! t0_kref+0x280:   	fnot2s	%f11, %f11
	.word	0x95b00f0a	! t0_kref+0x284:   	fsrc2	%f10, %f10
	.word	0x95b2866a	! t0_kref+0x288:   	fmul8x16au	%f10, %f10, %f10
	.word	0x97b00fe0	! t0_kref+0x28c:   	fones	%f11
	.word	0xd60e4000	! t0_kref+0x290:   	ldub	[%i1], %o3
	.word	0x9656b483	! t0_kref+0x294:   	umul	%i2, -0xb7d, %o3
	.word	0xd5260000	! t0_kref+0x298:   	st	%f10, [%i0]
	.word	0x81580000	! t0_kref+0x29c:   	flushw
	.word	0x9740c000	! t0_kref+0x2a0:   	mov	%asi, %o3
	.word	0xe0180018	! t0_kref+0x2a4:   	ldd	[%g0 + %i0], %l0
	.word	0xd656401b	! t0_kref+0x2a8:   	ldsh	[%i1 + %i3], %o3
	.word	0xe43e3ff8	! t0_kref+0x2ac:   	std	%l2, [%i0 - 8]
	.word	0x95a2884a	! t0_kref+0x2b0:   	faddd	%f10, %f10, %f10
	.word	0x961e8000	! t0_kref+0x2b4:   	xor	%i2, %g0, %o3
	.word	0x960ead0e	! t0_kref+0x2b8:   	and	%i2, 0xd0e, %o3
	.word	0x8143c000	! t0_kref+0x2bc:   	stbar
	.word	0xd6160000	! t0_kref+0x2c0:   	lduh	[%i0], %o3
	.word	0x9744c000	! t0_kref+0x2c4:   	mov	%gsr, %o3
	.word	0xd51f4019	! t0_kref+0x2c8:   	ldd	[%i5 + %i1], %f10
	.word	0x95a0188b	! t0_kref+0x2cc:   	fitos	%f11, %f10
	.word	0x9636801a	! t0_kref+0x2d0:   	orn	%i2, %i2, %o3
	.word	0x96500000	! t0_kref+0x2d4:   	umul	%g0, %g0, %o3
	.word	0x95a000ab	! t0_kref+0x2d8:   	fnegs	%f11, %f10
	.word	0x95a0054a	! t0_kref+0x2dc:   	fsqrtd	%f10, %f10
	.word	0xd6de501d	! t0_kref+0x2e0:   	ldxa	[%i1 + %i5]0x80, %o3
	.word	0x3b480006	! t0_kref+0x2e4:   	fble,a,pt	%fcc0, _kref+0x2fc
	.word	0x9610334c	! t0_kref+0x2e8:   	mov	0xfffff34c, %o3
	.word	0x95a2884a	! t0_kref+0x2ec:   	faddd	%f10, %f10, %f10
	.word	0xd6064000	! t0_kref+0x2f0:   	ld	[%i1], %o3
	.word	0x97a2882b	! t0_kref+0x2f4:   	fadds	%f10, %f11, %f11
	.word	0xed68a08a	! t0_kref+0x2f8:   	prefetch	%g2 + 0x8a, 22
	.word	0x86102002	! t0_kref+0x2fc:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x300:   	bne,a	_kref+0x300
	.word	0x86a0e001	! t0_kref+0x304:   	subcc	%g3, 1, %g3
	.word	0xe43e401d	! t0_kref+0x308:   	std	%l2, [%i1 + %i5]
	.word	0xd6d81018	! t0_kref+0x30c:   	ldxa	[%g0 + %i0]0x80, %o3
	.word	0x9636801a	! t0_kref+0x310:   	orn	%i2, %i2, %o3
	.word	0x81aacaab	! t0_kref+0x314:   	fcmpes	%fcc0, %f11, %f11
	.word	0x96f0001a	! t0_kref+0x318:   	udivcc	%g0, %i2, %o3
	.word	0x97b68100	! t0_kref+0x31c:   	edge32	%i2, %g0, %o3
	.word	0x97b2cea0	! t0_kref+0x320:   	fsrc1s	%f11, %f11
	.word	0x96a6ab5c	! t0_kref+0x324:   	subcc	%i2, 0xb5c, %o3
	.word	0x96900000	! t0_kref+0x328:   	orcc	%g0, %g0, %o3
	.word	0x97408000	! t0_kref+0x32c:   	mov	%ccr, %o3
	.word	0xd51fbc50	! t0_kref+0x330:   	ldd	[%fp - 0x3b0], %f10
	.word	0x9658001a	! t0_kref+0x334:   	smul	%g0, %i2, %o3
	.word	0x97280000	! t0_kref+0x338:   	sll	%g0, %g0, %o3
	.word	0x9736a01d	! t0_kref+0x33c:   	srl	%i2, 0x1d, %o3
	.word	0x81aa8aca	! t0_kref+0x340:   	fcmped	%fcc0, %f10, %f10
	.word	0x95b28d0a	! t0_kref+0x344:   	fandnot1	%f10, %f10, %f10
	.word	0x972ea01a	! t0_kref+0x348:   	sll	%i2, 0x1a, %o3
	.word	0x95a0192b	! t0_kref+0x34c:   	fstod	%f11, %f10
	.word	0xd1be1800	! t0_kref+0x350:   	stda	%f8, [%i0]0xc0
	.word	0xe41e401d	! t0_kref+0x354:   	ldd	[%i1 + %i5], %l2
	.word	0x97400000	! t0_kref+0x358:   	mov	%y, %o3
	.word	0x97b68340	! t0_kref+0x35c:   	alignaddrl	%i2, %g0, %o3
	.word	0xd656c018	! t0_kref+0x360:   	ldsh	[%i3 + %i0], %o3
	.word	0xd51fbfa0	! t0_kref+0x364:   	ldd	[%fp - 0x60], %f10
	.word	0x95a2894a	! t0_kref+0x368:   	fmuld	%f10, %f10, %f10
	.word	0x95a0014a	! t0_kref+0x36c:   	fabsd	%f10, %f10
	.word	0x95b28d40	! t0_kref+0x370:   	fnot1	%f10, %f10
	.word	0x97a01a4a	! t0_kref+0x374:   	fdtoi	%f10, %f11
	.word	0x96e6801a	! t0_kref+0x378:   	subccc	%i2, %i2, %o3
	.word	0x96f031d8	! t0_kref+0x37c:   	udivcc	%g0, -0xe28, %o3
	.word	0x9726aa0e	! t0_kref+0x380:   	mulscc	%i2, 0xa0e, %o3
	.word	0x95a0002b	! t0_kref+0x384:   	fmovs	%f11, %f10
	.word	0xd60e0000	! t0_kref+0x388:   	ldub	[%i0], %o3
	.word	0x97a0012b	! t0_kref+0x38c:   	fabss	%f11, %f11
	.word	0xc5386498	! t0_kref+0x390:   	std	%f2, [%g1 + 0x498]
	.word	0x968027be	! t0_kref+0x394:   	addcc	%g0, 0x7be, %o3
	.word	0xfb6e6008	! t0_kref+0x398:   	prefetch	%i1 + 8, 29
	.word	0xd51e6010	! t0_kref+0x39c:   	ldd	[%i1 + 0x10], %f10
	.word	0xd59f5018	! t0_kref+0x3a0:   	ldda	[%i5 + %i0]0x80, %f10
	.word	0x9700001a	! t0_kref+0x3a4:   	taddcc	%g0, %i2, %o3
	.word	0x97a01a4a	! t0_kref+0x3a8:   	fdtoi	%f10, %f11
	.word	0x9696801a	! t0_kref+0x3ac:   	orcc	%i2, %i2, %o3
	.word	0x95b2ceea	! t0_kref+0x3b0:   	fornot2s	%f11, %f10, %f10
	.word	0xe43e6000	! t0_kref+0x3b4:   	std	%l2, [%i1]
	.word	0x97b68340	! t0_kref+0x3b8:   	alignaddrl	%i2, %g0, %o3
	.word	0x967ea11f	! t0_kref+0x3bc:   	sdiv	%i2, 0x11f, %o3
	.word	0x95b009ab	! t0_kref+0x3c0:   	fexpand	%f11, %f10
	.word	0x95b2870b	! t0_kref+0x3c4:   	fmuld8sux16	%f10, %f11, %f10
	.word	0x95b2c72a	! t0_kref+0x3c8:   	fmuld8ulx16	%f11, %f10, %f10
	.word	0x96668000	! t0_kref+0x3cc:   	subc	%i2, %g0, %o3
	.word	0x960823e7	! t0_kref+0x3d0:   	and	%g0, 0x3e7, %o3
	.word	0x9686801a	! t0_kref+0x3d4:   	addcc	%i2, %i2, %o3
	.word	0x95b2862a	! t0_kref+0x3d8:   	fmul8x16	%f10, %f10, %f10
	.word	0x95b2866b	! t0_kref+0x3dc:   	fmul8x16au	%f10, %f11, %f10
	.word	0x96dea964	! t0_kref+0x3e0:   	smulcc	%i2, 0x964, %o3
	.word	0x96183456	! t0_kref+0x3e4:   	xor	%g0, -0xbaa, %o3
	.word	0x97a2c92a	! t0_kref+0x3e8:   	fmuls	%f11, %f10, %f11
	.word	0x96180000	! t0_kref+0x3ec:   	xor	%g0, %g0, %o3
	.word	0x96182557	! t0_kref+0x3f0:   	xor	%g0, 0x557, %o3
	.word	0xd650a00a	! t0_kref+0x3f4:   	ldsh	[%g2 + 0xa], %o3
	.word	0x81868000	! t0_kref+0x3f8:   	wr	%i2, %g0, %y
	.word	0xede6501a	! t0_kref+0x3fc:   	casa	[%i1]0x80, %i2, %l6
	.word	0x95b2898a	! t0_kref+0x400:   	bshuffle	%f10, %f10, %f10
	.word	0x97b68160	! t0_kref+0x404:   	edge32ln	%i2, %g0, %o3
	.word	0x97202c24	! t0_kref+0x408:   	mulscc	%g0, 0xc24, %o3
	.word	0x95a0004a	! t0_kref+0x40c:   	fmovd	%f10, %f10
	.word	0x95a2884a	! t0_kref+0x410:   	faddd	%f10, %f10, %f10
	.word	0x95b28d40	! t0_kref+0x414:   	fnot1	%f10, %f10
	.word	0x97a0012b	! t0_kref+0x418:   	fabss	%f11, %f11
	.word	0x81b01021	! t0_kref+0x41c:   	siam	0x1
	.word	0xe49f5018	! t0_kref+0x420:   	ldda	[%i5 + %i0]0x80, %l2
	.word	0xe41e3fe0	! t0_kref+0x424:   	ldd	[%i0 - 0x20], %l2
	.word	0x22800001	! t0_kref+0x428:   	be,a	_kref+0x42c
	.word	0xe46e401a	! t0_kref+0x42c:   	ldstub	[%i1 + %i2], %l2
	.word	0x97a288aa	! t0_kref+0x430:   	fsubs	%f10, %f10, %f11
	.word	0xd6de1000	! t0_kref+0x434:   	ldxa	[%i0]0x80, %o3
	.word	0x81aacaab	! t0_kref+0x438:   	fcmpes	%fcc0, %f11, %f11
	.word	0xd51e7fe8	! t0_kref+0x43c:   	ldd	[%i1 - 0x18], %f10
	.word	0x96beb6f5	! t0_kref+0x440:   	xnorcc	%i2, -0x90b, %o3
	.word	0x96e0239f	! t0_kref+0x444:   	subccc	%g0, 0x39f, %o3
	.word	0xc568a083	! t0_kref+0x448:   	prefetch	%g2 + 0x83, 2
	.word	0x95a2cd2a	! t0_kref+0x44c:   	fsmuld	%f11, %f10, %f10
	.word	0x96e68000	! t0_kref+0x450:   	subccc	%i2, %g0, %o3
	.word	0xd650a010	! t0_kref+0x454:   	ldsh	[%g2 + 0x10], %o3
	.word	0x95b2874a	! t0_kref+0x458:   	fpack32	%f10, %f10, %f10
	.word	0x878020e0	! t0_kref+0x45c:   	mov	0xe0, %asi
	.word	0x97b68240	! t0_kref+0x460:   	array16	%i2, %g0, %o3
	.word	0x23800002	! t0_kref+0x464:   	fbne,a	_kref+0x46c
	.word	0xd6464000	! t0_kref+0x468:   	ldsw	[%i1], %o3
	.word	0x81868000	! t0_kref+0x46c:   	wr	%i2, %g0, %y
	.word	0x961eaab3	! t0_kref+0x470:   	xor	%i2, 0xab3, %o3
	.word	0x9696aad6	! t0_kref+0x474:   	orcc	%i2, 0xad6, %o3
	.word	0x96be8000	! t0_kref+0x478:   	xnorcc	%i2, %g0, %o3
	.word	0x97a0052a	! t0_kref+0x47c:   	fsqrts	%f10, %f11
	.word	0x95a0192b	! t0_kref+0x480:   	fstod	%f11, %f10
	.word	0x9626801a	! t0_kref+0x484:   	sub	%i2, %i2, %o3
	.word	0x9e0063a0	! t0_kref+0x488:   	add	%g1, 0x3a0, %o7
!	.word	0x3ca78eda	! t0_kref+0x48c:   	bpos,a	SYM(t0_subr2)
	   	bpos,a	SYM(t0_subr2)
	.word	0x96a80000	! t0_kref+0x490:   	andncc	%g0, %g0, %o3
	.word	0xd606401c	! t0_kref+0x494:   	ld	[%i1 + %i4], %o3
	.word	0xd720a004	! t0_kref+0x498:   	st	%f11, [%g2 + 4]
	.word	0x961e8000	! t0_kref+0x49c:   	xor	%i2, %g0, %o3
	.word	0x9656bec0	! t0_kref+0x4a0:   	umul	%i2, -0x140, %o3
	.word	0x960e801a	! t0_kref+0x4a4:   	and	%i2, %i2, %o3
	.word	0x95b2872b	! t0_kref+0x4a8:   	fmuld8ulx16	%f10, %f11, %f10
	.word	0x95a288ca	! t0_kref+0x4ac:   	fsubd	%f10, %f10, %f10
	.word	0x95a28d2a	! t0_kref+0x4b0:   	fsmuld	%f10, %f10, %f10
	.word	0x81aa8aab	! t0_kref+0x4b4:   	fcmpes	%fcc0, %f10, %f11
	.word	0x9f414000	! t0_kref+0x4b8:   	mov	%pc, %o7
	.word	0x95a0052b	! t0_kref+0x4bc:   	fsqrts	%f11, %f10
	.word	0x973e8000	! t0_kref+0x4c0:   	sra	%i2, %g0, %o3
	.word	0xd6881018	! t0_kref+0x4c4:   	lduba	[%g0 + %i0]0x80, %o3
	.word	0x96e02247	! t0_kref+0x4c8:   	subccc	%g0, 0x247, %o3
	.word	0x95b28eca	! t0_kref+0x4cc:   	fornot2	%f10, %f10, %f10
	.word	0x86102003	! t0_kref+0x4d0:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x4d4:   	bne,a	_kref+0x4d4
	.word	0x86a0e001	! t0_kref+0x4d8:   	subcc	%g3, 1, %g3
	.word	0x973ea01d	! t0_kref+0x4dc:   	sra	%i2, 0x1d, %o3
	.word	0x96082da4	! t0_kref+0x4e0:   	and	%g0, 0xda4, %o3
	.word	0x96600000	! t0_kref+0x4e4:   	subc	%g0, %g0, %o3
	.word	0x96d8001a	! t0_kref+0x4e8:   	smulcc	%g0, %i2, %o3
	.word	0x95a0188a	! t0_kref+0x4ec:   	fitos	%f10, %f10
	.word	0xc807bfec	! t0_kref+0x4f0:   	ld	[%fp - 0x14], %g4
	.word	0x9676b26e	! t0_kref+0x4f4:   	udiv	%i2, -0xd92, %o3
	.word	0x96403c81	! t0_kref+0x4f8:   	addc	%g0, -0x37f, %o3
	.word	0x95a2884a	! t0_kref+0x4fc:   	faddd	%f10, %f10, %f10
	.word	0x95b2c62a	! t0_kref+0x500:   	fmul8x16	%f11, %f10, %f10
	.word	0x95a2894a	! t0_kref+0x504:   	fmuld	%f10, %f10, %f10
	.word	0x95a0054a	! t0_kref+0x508:   	fsqrtd	%f10, %f10
	.word	0xd51fbd58	! t0_kref+0x50c:   	ldd	[%fp - 0x2a8], %f10
	.word	0x96e68000	! t0_kref+0x510:   	subccc	%i2, %g0, %o3
	.word	0x96a8241c	! t0_kref+0x514:   	andncc	%g0, 0x41c, %o3
	.word	0xc0a81019	! t0_kref+0x518:   	stba	%g0, [%g0 + %i1]0x80
	.word	0xd650a01e	! t0_kref+0x51c:   	ldsh	[%g2 + 0x1e], %o3
	.word	0xf4f6501d	! t0_kref+0x520:   	stxa	%i2, [%i1 + %i5]0x80
	.word	0x81dfeabe	! t0_kref+0x524:   	flush	%i7 + 0xabe
	.word	0x97a2c9aa	! t0_kref+0x528:   	fdivs	%f11, %f10, %f11
	.word	0x20800001	! t0_kref+0x52c:   	bn,a	_kref+0x530
	.word	0x96ae8000	! t0_kref+0x530:   	andncc	%i2, %g0, %o3
	.word	0x95a2cd2b	! t0_kref+0x534:   	fsmuld	%f11, %f11, %f10
	.word	0x9696a4ec	! t0_kref+0x538:   	orcc	%i2, 0x4ec, %o3
	.word	0x96e68000	! t0_kref+0x53c:   	subccc	%i2, %g0, %o3
	.word	0x37800007	! t0_kref+0x540:   	fbge,a	_kref+0x55c
	.word	0x96783851	! t0_kref+0x544:   	sdiv	%g0, -0x7af, %o3
	.word	0xc368a089	! t0_kref+0x548:   	prefetch	%g2 + 0x89, 1
	.word	0x97a0002b	! t0_kref+0x54c:   	fmovs	%f11, %f11
	.word	0xe03e6018	! t0_kref+0x550:   	std	%l0, [%i1 + 0x18]
	.word	0x95a0054a	! t0_kref+0x554:   	fsqrtd	%f10, %f10
	.word	0x97a2c9aa	! t0_kref+0x558:   	fdivs	%f11, %f10, %f11
	.word	0xa780001a	! t0_kref+0x55c:   	mov	%i2, %gsr
	.word	0x96ae8000	! t0_kref+0x560:   	andncc	%i2, %g0, %o3
	.word	0xd610a00c	! t0_kref+0x564:   	lduh	[%g2 + 0xc], %o3
	.word	0x81aa8aaa	! t0_kref+0x568:   	fcmpes	%fcc0, %f10, %f10
	.word	0x81dd000a	! t0_kref+0x56c:   	flush	%l4 + %o2
	.word	0x969e8000	! t0_kref+0x570:   	xorcc	%i2, %g0, %o3
	.word	0x96a8001a	! t0_kref+0x574:   	andncc	%g0, %i2, %o3
	.word	0x95a2884a	! t0_kref+0x578:   	faddd	%f10, %f10, %f10
	.word	0x969e801a	! t0_kref+0x57c:   	xorcc	%i2, %i2, %o3
	.word	0x960e8000	! t0_kref+0x580:   	and	%i2, %g0, %o3
	.word	0x1720655c	! t0_kref+0x584:   	sethi	%hi(0x81957000), %o3
	.word	0x96303d0c	! t0_kref+0x588:   	orn	%g0, -0x2f4, %o3
	.word	0x97b0005a	! t0_kref+0x58c:   	edge8l	%g0, %i2, %o3
	.word	0x95a0012b	! t0_kref+0x590:   	fabss	%f11, %f10
	.word	0xd6500018	! t0_kref+0x594:   	ldsh	[%g0 + %i0], %o3
	.word	0x878020d0	! t0_kref+0x598:   	mov	0xd0, %asi
	.word	0xd60e0000	! t0_kref+0x59c:   	ldub	[%i0], %o3
	.word	0x96beacb4	! t0_kref+0x5a0:   	xnorcc	%i2, 0xcb4, %o3
	.word	0x97b0001a	! t0_kref+0x5a4:   	edge8	%g0, %i2, %o3
	.word	0x95a288ca	! t0_kref+0x5a8:   	fsubd	%f10, %f10, %f10
	.word	0x95a0110a	! t0_kref+0x5ac:   	fxtod	%f10, %f10
	.word	0xd86e3fe0	! t0_kref+0x5b0:   	ldstub	[%i0 - 0x20], %o4
	.word	0x95b28d0a	! t0_kref+0x5b4:   	fandnot1	%f10, %f10, %f10
	.word	0x95a0054a	! t0_kref+0x5b8:   	fsqrtd	%f10, %f10
	.word	0x3f800003	! t0_kref+0x5bc:   	fbo,a	_kref+0x5c8
	.word	0x95b28d60	! t0_kref+0x5c0:   	fnot1s	%f10, %f10
	.word	0x95a01a4a	! t0_kref+0x5c4:   	fdtoi	%f10, %f10
	.word	0x38480007	! t0_kref+0x5c8:   	bgu,a,pt	%icc, _kref+0x5e4
	.word	0x95a2c9aa	! t0_kref+0x5cc:   	fdivs	%f11, %f10, %f10
	.word	0x97b6831a	! t0_kref+0x5d0:   	alignaddr	%i2, %i2, %o3
	.word	0x95a0054a	! t0_kref+0x5d4:   	fsqrtd	%f10, %f10
	.word	0x9660001a	! t0_kref+0x5d8:   	subc	%g0, %i2, %o3
	.word	0xc768a08e	! t0_kref+0x5dc:   	prefetch	%g2 + 0x8e, 3
	.word	0x81b01022	! t0_kref+0x5e0:   	siam	0x2
	.word	0x9760c000	! t0_kref+0x5e4:   	movul	%fcc0, %g0, %o3
	.word	0x9696ba4d	! t0_kref+0x5e8:   	orcc	%i2, -0x5b3, %o3
	.word	0x97b2cf6b	! t0_kref+0x5ec:   	fornot1s	%f11, %f11, %f11
	.word	0x96c68000	! t0_kref+0x5f0:   	addccc	%i2, %g0, %o3
	.word	0xd68e101a	! t0_kref+0x5f4:   	lduba	[%i0 + %i2]0x80, %o3
	.word	0x96d6a801	! t0_kref+0x5f8:   	umulcc	%i2, 0x801, %o3
	.word	0xd19eda59	! t0_kref+0x5fc:   	ldda	[%i3 + %i1]0xd2, %f8
	.word	0x9678001a	! t0_kref+0x600:   	sdiv	%g0, %i2, %o3
	.word	0x96bebd5a	! t0_kref+0x604:   	xnorcc	%i2, -0x2a6, %o3
	.word	0x95a2884a	! t0_kref+0x608:   	faddd	%f10, %f10, %f10
	.word	0xc768a088	! t0_kref+0x60c:   	prefetch	%g2 + 0x88, 3
	.word	0x97400000	! t0_kref+0x610:   	mov	%y, %o3
	.word	0x9698001a	! t0_kref+0x614:   	xorcc	%g0, %i2, %o3
	.word	0x96f0001a	! t0_kref+0x618:   	udivcc	%g0, %i2, %o3
	.word	0xd51fbe78	! t0_kref+0x61c:   	ldd	[%fp - 0x188], %f10
	.word	0x96968000	! t0_kref+0x620:   	orcc	%i2, %g0, %o3
	.word	0x95b28dca	! t0_kref+0x624:   	fnand	%f10, %f10, %f10
	.word	0xd6062014	! t0_kref+0x628:   	ld	[%i0 + 0x14], %o3
	.word	0x97302016	! t0_kref+0x62c:   	srl	%g0, 0x16, %o3
	.word	0xc036c019	! t0_kref+0x630:   	clrh	[%i3 + %i1]
	.word	0x95a01a4a	! t0_kref+0x634:   	fdtoi	%f10, %f10
	.word	0x97b28caa	! t0_kref+0x638:   	fandnot2s	%f10, %f10, %f11
	.word	0x97a2c82b	! t0_kref+0x63c:   	fadds	%f11, %f11, %f11
	.word	0xe49e1000	! t0_kref+0x640:   	ldda	[%i0]0x80, %l2
	.word	0xd5180018	! t0_kref+0x644:   	ldd	[%g0 + %i0], %f10
	.word	0x95a0188b	! t0_kref+0x648:   	fitos	%f11, %f10
	.word	0x95a2884a	! t0_kref+0x64c:   	faddd	%f10, %f10, %f10
	.word	0x97a0052b	! t0_kref+0x650:   	fsqrts	%f11, %f11
	.word	0x95a2cd2b	! t0_kref+0x654:   	fsmuld	%f11, %f11, %f10
	.word	0xd700a024	! t0_kref+0x658:   	ld	[%g2 + 0x24], %f11
	.word	0x95a28d2b	! t0_kref+0x65c:   	fsmuld	%f10, %f11, %f10
	.word	0x9680001a	! t0_kref+0x660:   	addcc	%g0, %i2, %o3
	.word	0xed68a04e	! t0_kref+0x664:   	prefetch	%g2 + 0x4e, 22
	.word	0xc568a008	! t0_kref+0x668:   	prefetch	%g2 + 8, 2
	.word	0x96d02856	! t0_kref+0x66c:   	umulcc	%g0, 0x856, %o3
	.word	0xd696501b	! t0_kref+0x670:   	lduha	[%i1 + %i3]0x80, %o3
	.word	0xe43e3ff8	! t0_kref+0x674:   	std	%l2, [%i0 - 8]
	.word	0xd19e1a1b	! t0_kref+0x678:   	ldda	[%i0 + %i3]0xd0, %f8
	.word	0x29800008	! t0_kref+0x67c:   	fbl,a	_kref+0x69c
	.word	0x95a0188b	! t0_kref+0x680:   	fitos	%f11, %f10
	.word	0x95a0004a	! t0_kref+0x684:   	fmovd	%f10, %f10
	.word	0x3d800007	! t0_kref+0x688:   	fbule,a	_kref+0x6a4
	.word	0x95a0192b	! t0_kref+0x68c:   	fstod	%f11, %f10
	.word	0x95a0110a	! t0_kref+0x690:   	fxtod	%f10, %f10
	.word	0x97400000	! t0_kref+0x694:   	mov	%y, %o3
	.word	0x97a01a2b	! t0_kref+0x698:   	fstoi	%f11, %f11
	.word	0x97b68200	! t0_kref+0x69c:   	array8	%i2, %g0, %o3
	.word	0x95a000aa	! t0_kref+0x6a0:   	fnegs	%f10, %f10
	.word	0x9660244c	! t0_kref+0x6a4:   	subc	%g0, 0x44c, %o3
	.word	0x97b00340	! t0_kref+0x6a8:   	alignaddrl	%g0, %g0, %o3
	.word	0x95a288ca	! t0_kref+0x6ac:   	fsubd	%f10, %f10, %f10
	.word	0x960e801a	! t0_kref+0x6b0:   	and	%i2, %i2, %o3
	.word	0x96beb676	! t0_kref+0x6b4:   	xnorcc	%i2, -0x98a, %o3
	.word	0xd51fbc58	! t0_kref+0x6b8:   	ldd	[%fp - 0x3a8], %f10
	.word	0x95b009aa	! t0_kref+0x6bc:   	fexpand	%f10, %f10
	.word	0x9fc10000	! t0_kref+0x6c0:   	call	%g4
	.word	0xd64e0000	! t0_kref+0x6c4:   	ldsb	[%i0], %o3
	.word	0xd51e7fe0	! t0_kref+0x6c8:   	ldd	[%i1 - 0x20], %f10
	.word	0xd60e3fff	! t0_kref+0x6cc:   	ldub	[%i0 - 1], %o3
	.word	0x97b2854a	! t0_kref+0x6d0:   	fcmpeq16	%f10, %f10, %o3
	.word	0x96368000	! t0_kref+0x6d4:   	orn	%i2, %g0, %o3
	.word	0x96d80000	! t0_kref+0x6d8:   	smulcc	%g0, %g0, %o3
	.word	0xed68a08f	! t0_kref+0x6dc:   	prefetch	%g2 + 0x8f, 22
	.word	0x97b6831a	! t0_kref+0x6e0:   	alignaddr	%i2, %i2, %o3
	.word	0xd1be1880	! t0_kref+0x6e4:   	stda	%f8, [%i0]0xc4
	.word	0xd7263ff0	! t0_kref+0x6e8:   	st	%f11, [%i0 - 0x10]
	.word	0x96700000	! t0_kref+0x6ec:   	udiv	%g0, %g0, %o3
	.word	0x9660001a	! t0_kref+0x6f0:   	subc	%g0, %i2, %o3
	.word	0x97b00240	! t0_kref+0x6f4:   	array16	%g0, %g0, %o3
	.word	0x97a0002a	! t0_kref+0x6f8:   	fmovs	%f10, %f11
	.word	0xd51e6008	! t0_kref+0x6fc:   	ldd	[%i1 + 8], %f10
	.word	0x97a0188b	! t0_kref+0x700:   	fitos	%f11, %f11
	.word	0x81dc0008	! t0_kref+0x704:   	flush	%l0 + %o0
	.word	0x97102964	! t0_kref+0x708:   	taddcctv	%g0, 0x964, %o3
	.word	0x97b2cd60	! t0_kref+0x70c:   	fnot1s	%f11, %f11
	.word	0x8610200b	! t0_kref+0x710:   	mov	0xb, %g3
	.word	0x86a0e001	! t0_kref+0x714:   	subcc	%g3, 1, %g3
	.word	0x22800020	! t0_kref+0x718:   	be,a	_kref+0x798
	.word	0xc06e7fe8	! t0_kref+0x71c:   	ldstub	[%i1 - 0x18], %g0
	.word	0x96a6bd17	! t0_kref+0x720:   	subcc	%i2, -0x2e9, %o3
	.word	0x967ea4f3	! t0_kref+0x724:   	sdiv	%i2, 0x4f3, %o3
	.word	0x95a28d2a	! t0_kref+0x728:   	fsmuld	%f10, %f10, %f10
	.word	0x9640001a	! t0_kref+0x72c:   	addc	%g0, %i2, %o3
	.word	0xd6881019	! t0_kref+0x730:   	lduba	[%g0 + %i1]0x80, %o3
	.word	0x96a6af70	! t0_kref+0x734:   	subcc	%i2, 0xf70, %o3
	.word	0x97b2850a	! t0_kref+0x738:   	fcmpgt16	%f10, %f10, %o3
	.word	0x96bea056	! t0_kref+0x73c:   	xnorcc	%i2, 0x56, %o3
	.word	0xd60e7fe7	! t0_kref+0x740:   	ldub	[%i1 - 0x19], %o3
	.word	0x2dbffff4	! t0_kref+0x744:   	fbg,a	_kref+0x714
	.word	0xe41e7ff8	! t0_kref+0x748:   	ldd	[%i1 - 8], %l2
	.word	0x95a2cd2a	! t0_kref+0x74c:   	fsmuld	%f11, %f10, %f10
	.word	0x9763401a	! t0_kref+0x750:   	movle	%fcc0, %i2, %o3
	.word	0xd6d0105b	! t0_kref+0x754:   	ldsha	[%g0 + %i3]0x82, %o3
	.word	0x8143c000	! t0_kref+0x758:   	stbar
	.word	0x96b03be9	! t0_kref+0x75c:   	orncc	%g0, -0x417, %o3
	.word	0x9f414000	! t0_kref+0x760:   	mov	%pc, %o7
	.word	0x95b2cea0	! t0_kref+0x764:   	fsrc1s	%f11, %f10
	.word	0x95a2884a	! t0_kref+0x768:   	faddd	%f10, %f10, %f10
	.word	0x96b80000	! t0_kref+0x76c:   	xnorcc	%g0, %g0, %o3
	.word	0x8143c000	! t0_kref+0x770:   	stbar
	.word	0x95b28faa	! t0_kref+0x774:   	fors	%f10, %f10, %f10
	.word	0x8143c000	! t0_kref+0x778:   	stbar
	.word	0x35800005	! t0_kref+0x77c:   	fbue,a	_kref+0x790
	.word	0x961e8000	! t0_kref+0x780:   	xor	%i2, %g0, %o3
	.word	0x95b00ceb	! t0_kref+0x784:   	fnot2s	%f11, %f10
	.word	0x97b680a0	! t0_kref+0x788:   	edge16n	%i2, %g0, %o3
	.word	0xd19e5a1a	! t0_kref+0x78c:   	ldda	[%i1 + %i2]0xd0, %f8
	.word	0x95a0012b	! t0_kref+0x790:   	fabss	%f11, %f10
	.word	0x97a018ca	! t0_kref+0x794:   	fdtos	%f10, %f11
	.word	0xf4a81019	! t0_kref+0x798:   	stba	%i2, [%g0 + %i1]0x80
	.word	0xf007bfe0	! t0_kref+0x79c:   	ld	[%fp - 0x20], %i0
	.word	0x95b00f2b	! t0_kref+0x7a0:   	fsrc2s	%f11, %f10
	.word	0x97b0031a	! t0_kref+0x7a4:   	alignaddr	%g0, %i2, %o3
	.word	0x8610201f	! t0_kref+0x7a8:   	mov	0x1f, %g3
	.word	0x86a0e001	! t0_kref+0x7ac:   	subcc	%g3, 1, %g3
	.word	0x22800010	! t0_kref+0x7b0:   	be,a	_kref+0x7f0
	.word	0xe43e3ff8	! t0_kref+0x7b4:   	std	%l2, [%i0 - 8]
	.word	0x96800000	! t0_kref+0x7b8:   	addcc	%g0, %g0, %o3
	.word	0x95b28e0a	! t0_kref+0x7bc:   	fand	%f10, %f10, %f10
	.word	0x96f00000	! t0_kref+0x7c0:   	udivcc	%g0, %g0, %o3
	.word	0x95a0192a	! t0_kref+0x7c4:   	fstod	%f10, %f10
	.word	0x97300000	! t0_kref+0x7c8:   	srl	%g0, %g0, %o3
	.word	0x97b2cdaa	! t0_kref+0x7cc:   	fxors	%f11, %f10, %f11
	.word	0x9618001a	! t0_kref+0x7d0:   	xor	%g0, %i2, %o3
	.word	0xc0b6d018	! t0_kref+0x7d4:   	stha	%g0, [%i3 + %i0]0x80
	.word	0x97b2858a	! t0_kref+0x7d8:   	fcmpgt32	%f10, %f10, %o3
	.word	0x3d480001	! t0_kref+0x7dc:   	fbule,a,pt	%fcc0, _kref+0x7e0
	.word	0x9610001a	! t0_kref+0x7e0:   	mov	%i2, %o3
	.word	0x95b2866a	! t0_kref+0x7e4:   	fmul8x16au	%f10, %f10, %f10
	.word	0x97b2854a	! t0_kref+0x7e8:   	fcmpeq16	%f10, %f10, %o3
	.word	0x96c0001a	! t0_kref+0x7ec:   	addccc	%g0, %i2, %o3
	.word	0xa780001a	! t0_kref+0x7f0:   	mov	%i2, %gsr
	.word	0xf426600c	! t0_kref+0x7f4:   	st	%i2, [%i1 + 0xc]
	.word	0x96aea60d	! t0_kref+0x7f8:   	andncc	%i2, 0x60d, %o3
	.word	0x34480005	! t0_kref+0x7fc:   	bg,a,pt	%icc, _kref+0x810
	.word	0x962ea874	! t0_kref+0x800:   	andn	%i2, 0x874, %o3
	.word	0x96582128	! t0_kref+0x804:   	smul	%g0, 0x128, %o3
	.word	0xf436401b	! t0_kref+0x808:   	sth	%i2, [%i1 + %i3]
	.word	0xc030a030	! t0_kref+0x80c:   	clrh	[%g2 + 0x30]
	.word	0x171462c2	! t0_kref+0x810:   	sethi	%hi(0x518b0800), %o3
	.word	0x95a2884a	! t0_kref+0x814:   	faddd	%f10, %f10, %f10
	.word	0xd51e7fe0	! t0_kref+0x818:   	ldd	[%i1 - 0x20], %f10
	.word	0x97b68320	! t0_kref+0x81c:   	bmask	%i2, %g0, %o3
	.word	0x9658001a	! t0_kref+0x820:   	smul	%g0, %i2, %o3
	.word	0x96b6b1e7	! t0_kref+0x824:   	orncc	%i2, -0xe19, %o3
	.word	0x965837ce	! t0_kref+0x828:   	smul	%g0, -0x832, %o3
	.word	0xd656001b	! t0_kref+0x82c:   	ldsh	[%i0 + %i3], %o3
	.word	0x95a2c82a	! t0_kref+0x830:   	fadds	%f11, %f10, %f10
	.word	0xd6de501d	! t0_kref+0x834:   	ldxa	[%i1 + %i5]0x80, %o3
	.word	0xe26e3ff4	! t0_kref+0x838:   	ldstub	[%i0 - 0xc], %l1
	.word	0x97280000	! t0_kref+0x83c:   	sll	%g0, %g0, %o3
	.word	0xe01f4018	! t0_kref+0x840:   	ldd	[%i5 + %i0], %l0
	.word	0x95a289ab	! t0_kref+0x844:   	fdivs	%f10, %f11, %f10
	.word	0x95a0004a	! t0_kref+0x848:   	fmovd	%f10, %f10
	.word	0x96d828fc	! t0_kref+0x84c:   	smulcc	%g0, 0x8fc, %o3
	.word	0x97626631	! t0_kref+0x850:   	move	%fcc0, -0x1cf, %o3
	.word	0x8143c000	! t0_kref+0x854:   	stbar
	.word	0x96be801a	! t0_kref+0x858:   	xnorcc	%i2, %i2, %o3
	.word	0x81dfbfb4	! t0_kref+0x85c:   	flush	%fp - 0x4c
	.word	0x8143c000	! t0_kref+0x860:   	stbar
	.word	0xf4367fe4	! t0_kref+0x864:   	sth	%i2, [%i1 - 0x1c]
	.word	0x95b2872a	! t0_kref+0x868:   	fmuld8ulx16	%f10, %f10, %f10
	.word	0x95a0192a	! t0_kref+0x86c:   	fstod	%f10, %f10
	call	1f
	.empty
	.word	0x95a2cd2b	! t0_kref+0x874:   	fsmuld	%f11, %f11, %f10
	.word	0xd51fbca0	! t0_kref+0x878:   	ldd	[%fp - 0x360], %f10
	.word	0x9736a01b	! t0_kref+0x87c:   	srl	%i2, 0x1b, %o3
1:	.word	0x9608001a	! t0_kref+0x880:   	and	%g0, %i2, %o3
	.word	0xd64e7fe3	! t0_kref+0x884:   	ldsb	[%i1 - 0x1d], %o3
	.word	0x97b0011a	! t0_kref+0x888:   	edge32	%g0, %i2, %o3
	.word	0x96600000	! t0_kref+0x88c:   	subc	%g0, %g0, %o3
	.word	0x95a01a2b	! t0_kref+0x890:   	fstoi	%f11, %f10
	.word	0x96180000	! t0_kref+0x894:   	xor	%g0, %g0, %o3
	.word	0x96f6bf82	! t0_kref+0x898:   	udivcc	%i2, -0x7e, %o3
	.word	0xd6d61000	! t0_kref+0x89c:   	ldsha	[%i0]0x80, %o3
	.word	0x97a2c9ab	! t0_kref+0x8a0:   	fdivs	%f11, %f11, %f11
	.word	0x97b68300	! t0_kref+0x8a4:   	alignaddr	%i2, %g0, %o3
	.word	0x81868000	! t0_kref+0x8a8:   	wr	%i2, %g0, %y
	.word	0xc0300019	! t0_kref+0x8ac:   	clrh	[%g0 + %i1]
	.word	0xc0b01019	! t0_kref+0x8b0:   	stha	%g0, [%g0 + %i1]0x80
	.word	0x971eb811	! t0_kref+0x8b4:   	tsubcctv	%i2, -0x7ef, %o3
	.word	0xd6d65000	! t0_kref+0x8b8:   	ldsha	[%i1]0x80, %o3
	.word	0x9650001a	! t0_kref+0x8bc:   	umul	%g0, %i2, %o3
	.word	0x96582a7c	! t0_kref+0x8c0:   	smul	%g0, 0xa7c, %o3
	.word	0x971e801a	! t0_kref+0x8c4:   	tsubcctv	%i2, %i2, %o3
	.word	0xf4300019	! t0_kref+0x8c8:   	sth	%i2, [%g0 + %i1]
	.word	0x97b28a6a	! t0_kref+0x8cc:   	fpadd32s	%f10, %f10, %f11
	.word	0x97b68240	! t0_kref+0x8d0:   	array16	%i2, %g0, %o3
	.word	0x95a289aa	! t0_kref+0x8d4:   	fdivs	%f10, %f10, %f10
	.word	0xe26e7fef	! t0_kref+0x8d8:   	ldstub	[%i1 - 0x11], %l1
	.word	0x97b00140	! t0_kref+0x8dc:   	edge32l	%g0, %g0, %o3
	.word	0x95a0012a	! t0_kref+0x8e0:   	fabss	%f10, %f10
	.word	0xc028a034	! t0_kref+0x8e4:   	clrb	[%g2 + 0x34]
	.word	0x96e00000	! t0_kref+0x8e8:   	subccc	%g0, %g0, %o3
	.word	0x97282006	! t0_kref+0x8ec:   	sll	%g0, 0x6, %o3
	.word	0x96180000	! t0_kref+0x8f0:   	xor	%g0, %g0, %o3
	.word	0x25800004	! t0_kref+0x8f4:   	fblg,a	_kref+0x904
	.word	0x97408000	! t0_kref+0x8f8:   	mov	%ccr, %o3
	.word	0x95a0052a	! t0_kref+0x8fc:   	fsqrts	%f10, %f10
	.word	0xd6563ff4	! t0_kref+0x900:   	ldsh	[%i0 - 0xc], %o3
	.word	0xd5865000	! t0_kref+0x904:   	lda	[%i1]0x80, %f10
	.word	0x97a000aa	! t0_kref+0x908:   	fnegs	%f10, %f11
	.word	0x35800003	! t0_kref+0x90c:   	fbue,a	_kref+0x918
	.word	0xd6801018	! t0_kref+0x910:   	lda	[%g0 + %i0]0x80, %o3
	.word	0x95b28f8a	! t0_kref+0x914:   	for	%f10, %f10, %f10
	.word	0xd6500019	! t0_kref+0x918:   	ldsh	[%g0 + %i1], %o3
	.word	0x95a2cd2b	! t0_kref+0x91c:   	fsmuld	%f11, %f11, %f10
	.word	0xf4367ffa	! t0_kref+0x920:   	sth	%i2, [%i1 - 6]
	.word	0x960e8000	! t0_kref+0x924:   	and	%i2, %g0, %o3
	.word	0x96ae8000	! t0_kref+0x928:   	andncc	%i2, %g0, %o3
	.word	0x95b00c00	! t0_kref+0x92c:   	fzero	%f10
	.word	0x83c06854	! t0_kref+0x930:   	jmpl	%g1 + 0x854, %g1
	.word	0x967ebd6f	! t0_kref+0x934:   	sdiv	%i2, -0x291, %o3
	.word	0x95a2894a	! t0_kref+0x938:   	fmuld	%f10, %f10, %f10
	.word	0x97a0002a	! t0_kref+0x93c:   	fmovs	%f10, %f11
	.word	0x96beaedb	! t0_kref+0x940:   	xnorcc	%i2, 0xedb, %o3
	.word	0x96100000	! t0_kref+0x944:   	clr	%o3
	.word	0x9680001a	! t0_kref+0x948:   	addcc	%g0, %i2, %o3
	.word	0xf4f75018	! t0_kref+0x94c:   	stxa	%i2, [%i5 + %i0]0x80
	.word	0x9680001a	! t0_kref+0x950:   	addcc	%g0, %i2, %o3
	.word	0x96068000	! t0_kref+0x954:   	add	%i2, %g0, %o3
	.word	0x9fc10000	! t0_kref+0x958:   	call	%g4
	.word	0x972ea01f	! t0_kref+0x95c:   	sll	%i2, 0x1f, %o3
	.word	0x95b2c6ab	! t0_kref+0x960:   	fmul8x16al	%f11, %f11, %f10
	.word	0x97b000a0	! t0_kref+0x964:   	edge16n	%g0, %g0, %o3
	.word	0x95b28d40	! t0_kref+0x968:   	fnot1	%f10, %f10
	.word	0x97b28e6a	! t0_kref+0x96c:   	fxnors	%f10, %f10, %f11
	.word	0x9626b1ee	! t0_kref+0x970:   	sub	%i2, -0xe12, %o3
	.word	0x968828fb	! t0_kref+0x974:   	andcc	%g0, 0x8fb, %o3
	.word	0xd6064000	! t0_kref+0x978:   	ld	[%i1], %o3
	.word	0x97b00100	! t0_kref+0x97c:   	edge32	%g0, %g0, %o3
	.word	0x96968000	! t0_kref+0x980:   	orcc	%i2, %g0, %o3
	.word	0x95b00c00	! t0_kref+0x984:   	fzero	%f10
	.word	0xf007bfe0	! t0_kref+0x988:   	ld	[%fp - 0x20], %i0
	.word	0x95a2884a	! t0_kref+0x98c:   	faddd	%f10, %f10, %f10
	.word	0x97a01a4a	! t0_kref+0x990:   	fdtoi	%f10, %f11
	.word	0x97a000ab	! t0_kref+0x994:   	fnegs	%f11, %f11
!	.word	0x204d459a	! t0_kref+0x998:   	bn,a,pt	%icc, SYM(t0_subr1)
	   	bn,a,pt	%icc, SYM(t0_subr1)
	.word	0x9e006068	! t0_kref+0x99c:   	add	%g1, 0x68, %o7
	.word	0x96203ad9	! t0_kref+0x9a0:   	sub	%g0, -0x527, %o3
	.word	0x97630000	! t0_kref+0x9a4:   	movuge	%fcc0, %g0, %o3
	.word	0x97b284ca	! t0_kref+0x9a8:   	fcmpne32	%f10, %f10, %o3
	.word	0xb610201c	! t0_kref+0x9ac:   	mov	0x1c, %i3
	.word	0xf4366002	! t0_kref+0x9b0:   	sth	%i2, [%i1 + 2]
	.word	0x95a2cd2b	! t0_kref+0x9b4:   	fsmuld	%f11, %f11, %f10
	.word	0x9650001a	! t0_kref+0x9b8:   	umul	%g0, %i2, %o3
	.word	0x95a2894a	! t0_kref+0x9bc:   	fmuld	%f10, %f10, %f10
	.word	0x9726a245	! t0_kref+0x9c0:   	mulscc	%i2, 0x245, %o3
	.word	0x95a0012b	! t0_kref+0x9c4:   	fabss	%f11, %f10
	.word	0x9fc10000	! t0_kref+0x9c8:   	call	%g4
	.word	0x96aea0dd	! t0_kref+0x9cc:   	andncc	%i2, 0xdd, %o3
	.word	0x97b2858a	! t0_kref+0x9d0:   	fcmpgt32	%f10, %f10, %o3
	.word	0x960e8000	! t0_kref+0x9d4:   	and	%i2, %g0, %o3
	.word	0x25800004	! t0_kref+0x9d8:   	fblg,a	_kref+0x9e8
	.word	0x97a0052b	! t0_kref+0x9dc:   	fsqrts	%f11, %f11
	.word	0x8143c000	! t0_kref+0x9e0:   	stbar
	.word	0x9fc00004	! t0_kref+0x9e4:   	call	%g0 + %g4
	.word	0x95b28e80	! t0_kref+0x9e8:   	fsrc1	%f10, %f10
	.word	0xd1be5880	! t0_kref+0x9ec:   	stda	%f8, [%i1]0xc4
	.word	0x96f030e5	! t0_kref+0x9f0:   	udivcc	%g0, -0xf1b, %o3
	.word	0x97a01a4a	! t0_kref+0x9f4:   	fdtoi	%f10, %f11
	.word	0x97b00f2b	! t0_kref+0x9f8:   	fsrc2s	%f11, %f11
	.word	0x97282003	! t0_kref+0x9fc:   	sll	%g0, 0x3, %o3
	.word	0xd51fbc88	! t0_kref+0xa00:   	ldd	[%fp - 0x378], %f10
	.word	0x2f480001	! t0_kref+0xa04:   	fbu,a,pt	%fcc0, _kref+0xa08
	.word	0xd1be589a	! t0_kref+0xa08:   	stda	%f8, [%i1 + %i2]0xc4
	.word	0xe968a00d	! t0_kref+0xa0c:   	prefetch	%g2 + 0xd, 20
	.word	0xd6400018	! t0_kref+0xa10:   	ldsw	[%g0 + %i0], %o3
	.word	0x9686801a	! t0_kref+0xa14:   	addcc	%i2, %i2, %o3
	.word	0x95a2894a	! t0_kref+0xa18:   	fmuld	%f10, %f10, %f10
	.word	0x34480003	! t0_kref+0xa1c:   	bg,a,pt	%icc, _kref+0xa28
	.word	0x97b00280	! t0_kref+0xa20:   	array32	%g0, %g0, %o3
	.word	0x95a289ab	! t0_kref+0xa24:   	fdivs	%f10, %f11, %f10
	.word	0x81aa8aab	! t0_kref+0xa28:   	fcmpes	%fcc0, %f10, %f11
	.word	0xf4a81018	! t0_kref+0xa2c:   	stba	%i2, [%g0 + %i0]0x80
	.word	0x39800005	! t0_kref+0xa30:   	fbuge,a	_kref+0xa44
	.word	0x97a01a4a	! t0_kref+0xa34:   	fdtoi	%f10, %f11
	.word	0x96f6801a	! t0_kref+0xa38:   	udivcc	%i2, %i2, %o3
	.word	0xc0270019	! t0_kref+0xa3c:   	clr	[%i4 + %i1]
	.word	0x96c6801a	! t0_kref+0xa40:   	addccc	%i2, %i2, %o3
	.word	0x96f6a948	! t0_kref+0xa44:   	udivcc	%i2, 0x948, %o3
	.word	0x967ebc46	! t0_kref+0xa48:   	sdiv	%i2, -0x3ba, %o3
	.word	0x95a0192a	! t0_kref+0xa4c:   	fstod	%f10, %f10
	.word	0x95a01a4a	! t0_kref+0xa50:   	fdtoi	%f10, %f10
	.word	0x8143c000	! t0_kref+0xa54:   	stbar
	.word	0x960e8000	! t0_kref+0xa58:   	and	%i2, %g0, %o3
	.word	0xd6566006	! t0_kref+0xa5c:   	ldsh	[%i1 + 6], %o3
	.word	0xc0a81018	! t0_kref+0xa60:   	stba	%g0, [%g0 + %i0]0x80
	.word	0xe01e3ff0	! t0_kref+0xa64:   	ldd	[%i0 - 0x10], %l0
	.word	0xe41e401d	! t0_kref+0xa68:   	ldd	[%i1 + %i5], %l2
	.word	0x95b28aca	! t0_kref+0xa6c:   	fpsub32	%f10, %f10, %f10
	.word	0x96b83d8f	! t0_kref+0xa70:   	xnorcc	%g0, -0x271, %o3
	.word	0x96fea8cf	! t0_kref+0xa74:   	sdivcc	%i2, 0x8cf, %o3
	.word	0x95b007aa	! t0_kref+0xa78:   	fpackfix	%f10, %f10
	.word	0x97a0002a	! t0_kref+0xa7c:   	fmovs	%f10, %f11
	.word	0x95a2884a	! t0_kref+0xa80:   	faddd	%f10, %f10, %f10
	.word	0x97a000ab	! t0_kref+0xa84:   	fnegs	%f11, %f11
	.word	0x96e6801a	! t0_kref+0xa88:   	subccc	%i2, %i2, %o3
	.word	0xc568a08f	! t0_kref+0xa8c:   	prefetch	%g2 + 0x8f, 2
	.word	0x1712d58e	! t0_kref+0xa90:   	sethi	%hi(0x4b563800), %o3
	.word	0x97b6835a	! t0_kref+0xa94:   	alignaddrl	%i2, %i2, %o3
	.word	0x97200000	! t0_kref+0xa98:   	mulscc	%g0, %g0, %o3
	.word	0x96583297	! t0_kref+0xa9c:   	smul	%g0, -0xd69, %o3
	.word	0x95b28a0a	! t0_kref+0xaa0:   	fpadd16	%f10, %f10, %f10
	.word	0x96e6801a	! t0_kref+0xaa4:   	subccc	%i2, %i2, %o3
	.word	0x96b80000	! t0_kref+0xaa8:   	xnorcc	%g0, %g0, %o3
	.word	0x8143e040	! t0_kref+0xaac:   	membar	0x40
	.word	0x96b8001a	! t0_kref+0xab0:   	xnorcc	%g0, %i2, %o3
	.word	0x35800004	! t0_kref+0xab4:   	fbue,a	_kref+0xac4
	.word	0xa786a8cc	! t0_kref+0xab8:   	wr	%i2, 0x8cc, %gsr
	.word	0xf4366002	! t0_kref+0xabc:   	sth	%i2, [%i1 + 2]
	.word	0x95a2884a	! t0_kref+0xac0:   	faddd	%f10, %f10, %f10
	.word	0x95b28e4a	! t0_kref+0xac4:   	fxnor	%f10, %f10, %f10
	.word	0x96fe8000	! t0_kref+0xac8:   	sdivcc	%i2, %g0, %o3
	.word	0xd6070018	! t0_kref+0xacc:   	ld	[%i4 + %i0], %o3
	.word	0x97000000	! t0_kref+0xad0:   	taddcc	%g0, %g0, %o3
	.word	0x95a2894a	! t0_kref+0xad4:   	fmuld	%f10, %f10, %f10
	.word	0x97b6835a	! t0_kref+0xad8:   	alignaddrl	%i2, %i2, %o3
	.word	0x97b28fab	! t0_kref+0xadc:   	fors	%f10, %f11, %f11
	.word	0x96a6801a	! t0_kref+0xae0:   	subcc	%i2, %i2, %o3
	.word	0x81d83669	! t0_kref+0xae4:   	flush	%g0 - 0x997
	.word	0x96180000	! t0_kref+0xae8:   	xor	%g0, %g0, %o3
	.word	0x95b28aea	! t0_kref+0xaec:   	fpsub32s	%f10, %f10, %f10
	.word	0x97268000	! t0_kref+0xaf0:   	mulscc	%i2, %g0, %o3
	.word	0x95a2c9aa	! t0_kref+0xaf4:   	fdivs	%f11, %f10, %f10
	.word	0xd6167ff6	! t0_kref+0xaf8:   	lduh	[%i1 - 0xa], %o3
	.word	0x95a0192b	! t0_kref+0xafc:   	fstod	%f11, %f10
	.word	0xd6861000	! t0_kref+0xb00:   	lda	[%i0]0x80, %o3
	.word	0x95b28e4a	! t0_kref+0xb04:   	fxnor	%f10, %f10, %f10
	.word	0x20800004	! t0_kref+0xb08:   	bn,a	_kref+0xb18
	.word	0x97a000ab	! t0_kref+0xb0c:   	fnegs	%f11, %f11
	.word	0x95a0054a	! t0_kref+0xb10:   	fsqrtd	%f10, %f10
	.word	0x96a6b37a	! t0_kref+0xb14:   	subcc	%i2, -0xc86, %o3
	.word	0x97a0002b	! t0_kref+0xb18:   	fmovs	%f11, %f11
	.word	0x9726801a	! t0_kref+0xb1c:   	mulscc	%i2, %i2, %o3
	.word	0x962829f7	! t0_kref+0xb20:   	andn	%g0, 0x9f7, %o3
	.word	0x95b2c72b	! t0_kref+0xb24:   	fmuld8ulx16	%f11, %f11, %f10
	.word	0x26480001	! t0_kref+0xb28:   	bl,a,pt	%icc, _kref+0xb2c
	.word	0x8143c000	! t0_kref+0xb2c:   	stbar
	.word	0xf428a037	! t0_kref+0xb30:   	stb	%i2, [%g2 + 0x37]
	.word	0x96b80000	! t0_kref+0xb34:   	xnorcc	%g0, %g0, %o3
	.word	0x97400000	! t0_kref+0xb38:   	mov	%y, %o3
	.word	0x9626a8ef	! t0_kref+0xb3c:   	sub	%i2, 0x8ef, %o3
	.word	0x97a2892a	! t0_kref+0xb40:   	fmuls	%f10, %f10, %f11
	.word	0x95a288ca	! t0_kref+0xb44:   	fsubd	%f10, %f10, %f10
	.word	0x95a0110a	! t0_kref+0xb48:   	fxtod	%f10, %f10
	.word	0x95b00f2a	! t0_kref+0xb4c:   	fsrc2s	%f10, %f10
	.word	0xd616401b	! t0_kref+0xb50:   	lduh	[%i1 + %i3], %o3
	.word	0x95a0054a	! t0_kref+0xb54:   	fsqrtd	%f10, %f10
	.word	0x97b284ca	! t0_kref+0xb58:   	fcmpne32	%f10, %f10, %o3
	.word	0x95a000aa	! t0_kref+0xb5c:   	fnegs	%f10, %f10
	.word	0x95b2ccaa	! t0_kref+0xb60:   	fandnot2s	%f11, %f10, %f10
	.word	0x96aea04a	! t0_kref+0xb64:   	andncc	%i2, 0x4a, %o3
	.word	0x96900000	! t0_kref+0xb68:   	orcc	%g0, %g0, %o3
	.word	0x97a2c82a	! t0_kref+0xb6c:   	fadds	%f11, %f10, %f11
	.word	0x97a01a4a	! t0_kref+0xb70:   	fdtoi	%f10, %f11
	.word	0x35800008	! t0_kref+0xb74:   	fbue,a	_kref+0xb94
	.word	0x96600000	! t0_kref+0xb78:   	subc	%g0, %g0, %o3
	.word	0x968ea71d	! t0_kref+0xb7c:   	andcc	%i2, 0x71d, %o3
	.word	0xd51e401d	! t0_kref+0xb80:   	ldd	[%i1 + %i5], %f10
	.word	0xc0f61000	! t0_kref+0xb84:   	stxa	%g0, [%i0]0x80
	.word	0x95a000aa	! t0_kref+0xb88:   	fnegs	%f10, %f10
	.word	0x97a018ca	! t0_kref+0xb8c:   	fdtos	%f10, %f11
	.word	0xd6564000	! t0_kref+0xb90:   	ldsh	[%i1], %o3
	.word	0x96a023f0	! t0_kref+0xb94:   	subcc	%g0, 0x3f0, %o3
	.word	0x95a2c9ab	! t0_kref+0xb98:   	fdivs	%f11, %f11, %f10
	.word	0x96783404	! t0_kref+0xb9c:   	sdiv	%g0, -0xbfc, %o3
	.word	0x9686bb31	! t0_kref+0xba0:   	addcc	%i2, -0x4cf, %o3
	.word	0x97b00c20	! t0_kref+0xba4:   	fzeros	%f11
	.word	0x95a0192b	! t0_kref+0xba8:   	fstod	%f11, %f10
	.word	0x96e03f9c	! t0_kref+0xbac:   	subccc	%g0, -0x64, %o3
	.word	0xd1be1840	! t0_kref+0xbb0:   	stda	%f8, [%i0]0xc2
	.word	0x97b680c0	! t0_kref+0xbb4:   	edge16l	%i2, %g0, %o3
	.word	0xe86e3fe8	! t0_kref+0xbb8:   	ldstub	[%i0 - 0x18], %l4
	.word	0xeb68a00e	! t0_kref+0xbbc:   	prefetch	%g2 + 0xe, 21
	.word	0xf4ae1000	! t0_kref+0xbc0:   	stba	%i2, [%i0]0x80
	.word	0xd6163fe2	! t0_kref+0xbc4:   	lduh	[%i0 - 0x1e], %o3
	.word	0xd7865000	! t0_kref+0xbc8:   	lda	[%i1]0x80, %f11
	.word	0x95a289aa	! t0_kref+0xbcc:   	fdivs	%f10, %f10, %f10
	.word	0xc0362016	! t0_kref+0xbd0:   	clrh	[%i0 + 0x16]
	.word	0x9690001a	! t0_kref+0xbd4:   	orcc	%g0, %i2, %o3
	.word	0x97a0012b	! t0_kref+0xbd8:   	fabss	%f11, %f11
	.word	0x95b2872a	! t0_kref+0xbdc:   	fmuld8ulx16	%f10, %f10, %f10
	.word	0x97a289aa	! t0_kref+0xbe0:   	fdivs	%f10, %f10, %f11
	.word	0x95a2cd2a	! t0_kref+0xbe4:   	fsmuld	%f11, %f10, %f10
	.word	0x95b28e80	! t0_kref+0xbe8:   	fsrc1	%f10, %f10
	.word	0x97b00280	! t0_kref+0xbec:   	array32	%g0, %g0, %o3
	.word	0x9600001a	! t0_kref+0xbf0:   	add	%g0, %i2, %o3
	.word	0x9690001a	! t0_kref+0xbf4:   	orcc	%g0, %i2, %o3
	.word	0x9730001a	! t0_kref+0xbf8:   	srl	%g0, %i2, %o3
	.word	0x96a00000	! t0_kref+0xbfc:   	subcc	%g0, %g0, %o3
	.word	0x96e00000	! t0_kref+0xc00:   	subccc	%g0, %g0, %o3
	.word	0x97302002	! t0_kref+0xc04:   	srl	%g0, 0x2, %o3
	.word	0x9606801a	! t0_kref+0xc08:   	add	%i2, %i2, %o3
	.word	0x9608001a	! t0_kref+0xc0c:   	and	%g0, %i2, %o3
	.word	0xd64e001a	! t0_kref+0xc10:   	ldsb	[%i0 + %i2], %o3
	.word	0x9726801a	! t0_kref+0xc14:   	mulscc	%i2, %i2, %o3
	.word	0x97400000	! t0_kref+0xc18:   	mov	%y, %o3
	.word	0x97a2c9ab	! t0_kref+0xc1c:   	fdivs	%f11, %f11, %f11
	.word	0x96368000	! t0_kref+0xc20:   	orn	%i2, %g0, %o3
	.word	0xd7270019	! t0_kref+0xc24:   	st	%f11, [%i4 + %i1]
	.word	0x973e801a	! t0_kref+0xc28:   	sra	%i2, %i2, %o3
	.word	0x95a0012b	! t0_kref+0xc2c:   	fabss	%f11, %f10
	.word	0x81800000	! t0_kref+0xc30:   	mov	%g0, %y
	.word	0x81580000	! t0_kref+0xc34:   	flushw
	.word	0x95a0054a	! t0_kref+0xc38:   	fsqrtd	%f10, %f10
	.word	0xd64e2003	! t0_kref+0xc3c:   	ldsb	[%i0 + 3], %o3
	.word	0x95a2c9ab	! t0_kref+0xc40:   	fdivs	%f11, %f11, %f10
	.word	0xd6500019	! t0_kref+0xc44:   	ldsh	[%g0 + %i1], %o3
	.word	0xd6d6d018	! t0_kref+0xc48:   	ldsha	[%i3 + %i0]0x80, %o3
	.word	0x97a2892b	! t0_kref+0xc4c:   	fmuls	%f10, %f11, %f11
	.word	0x97a0188a	! t0_kref+0xc50:   	fitos	%f10, %f11
	.word	0x9720265a	! t0_kref+0xc54:   	mulscc	%g0, 0x65a, %o3
	.word	0x95a2884a	! t0_kref+0xc58:   	faddd	%f10, %f10, %f10
	.word	0x97b6805a	! t0_kref+0xc5c:   	edge8l	%i2, %i2, %o3
	.word	0x95a01a2a	! t0_kref+0xc60:   	fstoi	%f10, %f10
	.word	0x96b831e3	! t0_kref+0xc64:   	xnorcc	%g0, -0xe1d, %o3
	.word	0x9606801a	! t0_kref+0xc68:   	add	%i2, %i2, %o3
	.word	0x96182f9a	! t0_kref+0xc6c:   	xor	%g0, 0xf9a, %o3
	.word	0x97268000	! t0_kref+0xc70:   	mulscc	%i2, %g0, %o3
	.word	0x97b6805a	! t0_kref+0xc74:   	edge8l	%i2, %i2, %o3
	.word	0x9676801a	! t0_kref+0xc78:   	udiv	%i2, %i2, %o3
	.word	0x97a2c9aa	! t0_kref+0xc7c:   	fdivs	%f11, %f10, %f11
	.word	0xe01f4018	! t0_kref+0xc80:   	ldd	[%i5 + %i0], %l0
	.word	0x27800003	! t0_kref+0xc84:   	fbul,a	_kref+0xc90
	.word	0x97a0012b	! t0_kref+0xc88:   	fabss	%f11, %f11
	.word	0x95aa804a	! t0_kref+0xc8c:   	fmovdue	%fcc0, %f10, %f10
	.word	0x97b00340	! t0_kref+0xc90:   	alignaddrl	%g0, %g0, %o3
	.word	0xe01e001d	! t0_kref+0xc94:   	ldd	[%i0 + %i5], %l0
	.word	0xba102008	! t0_kref+0xc98:   	mov	0x8, %i5
	.word	0x9600001a	! t0_kref+0xc9c:   	add	%g0, %i2, %o3
	.word	0x25480007	! t0_kref+0xca0:   	fblg,a,pt	%fcc0, _kref+0xcbc
	.word	0x95a000aa	! t0_kref+0xca4:   	fnegs	%f10, %f10
	.word	0x961037b9	! t0_kref+0xca8:   	mov	0xfffff7b9, %o3
	.word	0x81aa8aaa	! t0_kref+0xcac:   	fcmpes	%fcc0, %f10, %f10
	.word	0x96e0001a	! t0_kref+0xcb0:   	subccc	%g0, %i2, %o3
	.word	0x96902fa2	! t0_kref+0xcb4:   	orcc	%g0, 0xfa2, %o3
	.word	0x1718cf86	! t0_kref+0xcb8:   	sethi	%hi(0x633e1800), %o3
	.word	0x95b28a8a	! t0_kref+0xcbc:   	fpsub16	%f10, %f10, %f10
	.word	0x95a0012a	! t0_kref+0xcc0:   	fabss	%f10, %f10
	.word	0x95b009ab	! t0_kref+0xcc4:   	fexpand	%f11, %f10
	.word	0x96a6b949	! t0_kref+0xcc8:   	subcc	%i2, -0x6b7, %o3
	.word	0x9640397c	! t0_kref+0xccc:   	addc	%g0, -0x684, %o3
	.word	0x95a01a4a	! t0_kref+0xcd0:   	fdtoi	%f10, %f10
	.word	0xe01e3ff0	! t0_kref+0xcd4:   	ldd	[%i0 - 0x10], %l0
	.word	0x8143c000	! t0_kref+0xcd8:   	stbar
	.word	0x95a2894a	! t0_kref+0xcdc:   	fmuld	%f10, %f10, %f10
	.word	0x95a28d2b	! t0_kref+0xce0:   	fsmuld	%f10, %f11, %f10
	.word	0xd5a6501c	! t0_kref+0xce4:   	sta	%f10, [%i1 + %i4]0x80
	.word	0x961824e7	! t0_kref+0xce8:   	xor	%g0, 0x4e7, %o3
	.word	0xd656601e	! t0_kref+0xcec:   	ldsh	[%i1 + 0x1e], %o3
	.word	0xdc216b00	! t0_kref+0xcf0:   	st	%sp, [%g5 + 0xb00]
	.word	0x95b00cca	! t0_kref+0xcf4:   	fnot2	%f10, %f10
	.word	0x96882b6a	! t0_kref+0xcf8:   	andcc	%g0, 0xb6a, %o3
	.word	0x25800002	! t0_kref+0xcfc:   	fblg,a	_kref+0xd04
	.word	0x97a01a4a	! t0_kref+0xd00:   	fdtoi	%f10, %f11
	.word	0x9764401a	! t0_kref+0xd04:   	move	%icc, %i2, %o3
	.word	0xf4362010	! t0_kref+0xd08:   	sth	%i2, [%i0 + 0x10]
	.word	0x95b28d0a	! t0_kref+0xd0c:   	fandnot1	%f10, %f10, %f10
	call	SYM(t0_subr3)
	.word	0x97b68100	! t0_kref+0xd14:   	edge32	%i2, %g0, %o3
	.word	0xfb070005	! t0_kref+0xd18:   	ld	[%i4 + %g5], %f29
	.word	0x96068000	! t0_kref+0xd1c:   	add	%i2, %g0, %o3
	.word	0xeb68a00b	! t0_kref+0xd20:   	prefetch	%g2 + 0xb, 21
	.word	0x97a2882a	! t0_kref+0xd24:   	fadds	%f10, %f10, %f11
	.word	0x95a2c9ab	! t0_kref+0xd28:   	fdivs	%f11, %f11, %f10
	.word	0x86102002	! t0_kref+0xd2c:   	mov	0x2, %g3
	.word	0x86a0e001	! t0_kref+0xd30:   	subcc	%g3, 1, %g3
	.word	0x2280000c	! t0_kref+0xd34:   	be,a	_kref+0xd64
	.word	0x963eb300	! t0_kref+0xd38:   	xnor	%i2, -0xd00, %o3
	.word	0xd19f5a59	! t0_kref+0xd3c:   	ldda	[%i5 + %i1]0xd2, %f8
	.word	0x95b2c62a	! t0_kref+0xd40:   	fmul8x16	%f11, %f10, %f10
	.word	0x96d80000	! t0_kref+0xd44:   	smulcc	%g0, %g0, %o3
	.word	0x96168000	! t0_kref+0xd48:   	or	%i2, %g0, %o3
	.word	0x31800001	! t0_kref+0xd4c:   	fba,a	_kref+0xd50
	.word	0xf4200019	! t0_kref+0xd50:   	st	%i2, [%g0 + %i1]
	.word	0x96a821cb	! t0_kref+0xd54:   	andncc	%g0, 0x1cb, %o3
	.word	0x9610001a	! t0_kref+0xd58:   	mov	%i2, %o3
	.word	0xd51e3ff8	! t0_kref+0xd5c:   	ldd	[%i0 - 8], %f10
	.word	0x96a6801a	! t0_kref+0xd60:   	subcc	%i2, %i2, %o3
	.word	0x95b286ea	! t0_kref+0xd64:   	fmul8ulx16	%f10, %f10, %f10
	.word	0x95a0054a	! t0_kref+0xd68:   	fsqrtd	%f10, %f10
	.word	0x8143c000	! t0_kref+0xd6c:   	stbar
	.word	0x960e801a	! t0_kref+0xd70:   	and	%i2, %i2, %o3
	.word	0x97a01a4a	! t0_kref+0xd74:   	fdtoi	%f10, %f11
	.word	0x96183951	! t0_kref+0xd78:   	xor	%g0, -0x6af, %o3
	.word	0x96100000	! t0_kref+0xd7c:   	clr	%o3
	.word	0xed68a008	! t0_kref+0xd80:   	prefetch	%g2 + 8, 22
	.word	0xe49f5019	! t0_kref+0xd84:   	ldda	[%i5 + %i1]0x80, %l2
	.word	0x97400000	! t0_kref+0xd88:   	mov	%y, %o3
	.word	0xd1be581a	! t0_kref+0xd8c:   	stda	%f8, [%i1 + %i2]0xc0
	.word	0x172a2983	! t0_kref+0xd90:   	sethi	%hi(0xa8a60c00), %o3
	.word	0x967eb7eb	! t0_kref+0xd94:   	sdiv	%i2, -0x815, %o3
	.word	0x97a0188a	! t0_kref+0xd98:   	fitos	%f10, %f11
	.word	0x95b28d2b	! t0_kref+0xd9c:   	fandnot1s	%f10, %f11, %f10
	.word	0xd1be585a	! t0_kref+0xda0:   	stda	%f8, [%i1 + %i2]0xc2
	.word	0x17069c4e	! t0_kref+0xda4:   	sethi	%hi(0x1a713800), %o3
	.word	0x95a0054a	! t0_kref+0xda8:   	fsqrtd	%f10, %f10
	.word	0xd5981019	! t0_kref+0xdac:   	ldda	[%g0 + %i1]0x80, %f10
	.word	0xc0a81018	! t0_kref+0xdb0:   	stba	%g0, [%g0 + %i0]0x80
	.word	0x3b800005	! t0_kref+0xdb4:   	fble,a	_kref+0xdc8
	.word	0x9696bbdd	! t0_kref+0xdb8:   	orcc	%i2, -0x423, %o3
	.word	0x95a0192a	! t0_kref+0xdbc:   	fstod	%f10, %f10
	.word	0x97b28d2a	! t0_kref+0xdc0:   	fandnot1s	%f10, %f10, %f11
	.word	0xd616401b	! t0_kref+0xdc4:   	lduh	[%i1 + %i3], %o3
	.word	0x95a288ca	! t0_kref+0xdc8:   	fsubd	%f10, %f10, %f10
	.word	0x33800007	! t0_kref+0xdcc:   	fbe,a	_kref+0xde8
	.word	0x95a289aa	! t0_kref+0xdd0:   	fdivs	%f10, %f10, %f10
	.word	0x96883e16	! t0_kref+0xdd4:   	andcc	%g0, -0x1ea, %o3
	.word	0x97b680c0	! t0_kref+0xdd8:   	edge16l	%i2, %g0, %o3
	.word	0x95a0192a	! t0_kref+0xddc:   	fstod	%f10, %f10
	.word	0x97102b2d	! t0_kref+0xde0:   	taddcctv	%g0, 0xb2d, %o3
	.word	0x9618338e	! t0_kref+0xde4:   	xor	%g0, -0xc72, %o3
	.word	0x81aa8aca	! t0_kref+0xde8:   	fcmped	%fcc0, %f10, %f10
	.word	0x9690001a	! t0_kref+0xdec:   	orcc	%g0, %i2, %o3
	.word	0x97400000	! t0_kref+0xdf0:   	mov	%y, %o3
	.word	0x95b28caa	! t0_kref+0xdf4:   	fandnot2s	%f10, %f10, %f10
	.word	0x97a0188a	! t0_kref+0xdf8:   	fitos	%f10, %f11
	.word	0x97a01a4a	! t0_kref+0xdfc:   	fdtoi	%f10, %f11
	.word	0x97202077	! t0_kref+0xe00:   	mulscc	%g0, 0x77, %o3
	.word	0xe41e3ff8	! t0_kref+0xe04:   	ldd	[%i0 - 8], %l2
	.word	0x2c800002	! t0_kref+0xe08:   	bneg,a	_kref+0xe10
	.word	0x96202d74	! t0_kref+0xe0c:   	sub	%g0, 0xd74, %o3
	.word	0x97408000	! t0_kref+0xe10:   	mov	%ccr, %o3
	.word	0x97b00c20	! t0_kref+0xe14:   	fzeros	%f11
	.word	0xe41e0000	! t0_kref+0xe18:   	ldd	[%i0], %l2
	.word	0x9656a36e	! t0_kref+0xe1c:   	umul	%i2, 0x36e, %o3
	.word	0x95a01a4a	! t0_kref+0xe20:   	fdtoi	%f10, %f10
	.word	0x81aa8aca	! t0_kref+0xe24:   	fcmped	%fcc0, %f10, %f10
	.word	0x95a2884a	! t0_kref+0xe28:   	faddd	%f10, %f10, %f10
	.word	0xd656c018	! t0_kref+0xe2c:   	ldsh	[%i3 + %i0], %o3
	.word	0x97400000	! t0_kref+0xe30:   	mov	%y, %o3
	.word	0x97a2c9ab	! t0_kref+0xe34:   	fdivs	%f11, %f11, %f11
	.word	0x95b28d8a	! t0_kref+0xe38:   	fxor	%f10, %f10, %f10
	.word	0x97380000	! t0_kref+0xe3c:   	sra	%g0, %g0, %o3
	.word	0x95a2cd2a	! t0_kref+0xe40:   	fsmuld	%f11, %f10, %f10
	.word	0x97a0012b	! t0_kref+0xe44:   	fabss	%f11, %f11
	.word	0x95a0002a	! t0_kref+0xe48:   	fmovs	%f10, %f10
	.word	0xc0f6501d	! t0_kref+0xe4c:   	stxa	%g0, [%i1 + %i5]0x80
	.word	0x97b2854a	! t0_kref+0xe50:   	fcmpeq16	%f10, %f10, %o3
	.word	0x25800007	! t0_kref+0xe54:   	fblg,a	_kref+0xe70
	.word	0xd6d01019	! t0_kref+0xe58:   	ldsha	[%g0 + %i1]0x80, %o3
	.word	0x95a0192a	! t0_kref+0xe5c:   	fstod	%f10, %f10
	.word	0xe66e2008	! t0_kref+0xe60:   	ldstub	[%i0 + 8], %l3
	.word	0xe03e3fe0	! t0_kref+0xe64:   	std	%l0, [%i0 - 0x20]
	.word	0xd51fbd18	! t0_kref+0xe68:   	ldd	[%fp - 0x2e8], %f10
	.word	0x97a000aa	! t0_kref+0xe6c:   	fnegs	%f10, %f11
	.word	0xc0263fec	! t0_kref+0xe70:   	clr	[%i0 - 0x14]
	.word	0x969039c2	! t0_kref+0xe74:   	orcc	%g0, -0x63e, %o3
	.word	0x96180000	! t0_kref+0xe78:   	xor	%g0, %g0, %o3
	.word	0x95a2cd2a	! t0_kref+0xe7c:   	fsmuld	%f11, %f10, %f10
	.word	0xf426200c	! t0_kref+0xe80:   	st	%i2, [%i0 + 0xc]
	.word	0x96e0001a	! t0_kref+0xe84:   	subccc	%g0, %i2, %o3
	.word	0x97b2840a	! t0_kref+0xe88:   	fcmple16	%f10, %f10, %o3
	.word	0xd6080018	! t0_kref+0xe8c:   	ldub	[%g0 + %i0], %o3
	.word	0x95a289ab	! t0_kref+0xe90:   	fdivs	%f10, %f11, %f10
	.word	0xd6564000	! t0_kref+0xe94:   	ldsh	[%i1], %o3
	.word	0xe01e0000	! t0_kref+0xe98:   	ldd	[%i0], %l0
	.word	0x95a0192a	! t0_kref+0xe9c:   	fstod	%f10, %f10
	.word	0xba103ff0	! t0_kref+0xea0:   	mov	0xfffffff0, %i5
	.word	0x96f02dc5	! t0_kref+0xea4:   	udivcc	%g0, 0xdc5, %o3
	.word	0x81dd8016	! t0_kref+0xea8:   	flush	%l6 + %l6
	.word	0xd51fbde0	! t0_kref+0xeac:   	ldd	[%fp - 0x220], %f10
	.word	0xd616601e	! t0_kref+0xeb0:   	lduh	[%i1 + 0x1e], %o3
	.word	0x95a0192b	! t0_kref+0xeb4:   	fstod	%f11, %f10
	.word	0x96b00000	! t0_kref+0xeb8:   	orncc	%g0, %g0, %o3
	.word	0x96e0001a	! t0_kref+0xebc:   	subccc	%g0, %i2, %o3
	.word	0x3a800003	! t0_kref+0xec0:   	bcc,a	_kref+0xecc
	.word	0x96880000	! t0_kref+0xec4:   	andcc	%g0, %g0, %o3
	.word	0x95b28e4a	! t0_kref+0xec8:   	fxnor	%f10, %f10, %f10
	.word	0x95b00cca	! t0_kref+0xecc:   	fnot2	%f10, %f10
	.word	0x960e8000	! t0_kref+0xed0:   	and	%i2, %g0, %o3
	.word	0x95a000ab	! t0_kref+0xed4:   	fnegs	%f11, %f10
	.word	0x96b00000	! t0_kref+0xed8:   	orncc	%g0, %g0, %o3
	.word	0x95b007aa	! t0_kref+0xedc:   	fpackfix	%f10, %f10
	.word	0x97b68280	! t0_kref+0xee0:   	array32	%i2, %g0, %o3
	.word	0x97b6811a	! t0_kref+0xee4:   	edge32	%i2, %i2, %o3
	.word	0x95a0054a	! t0_kref+0xee8:   	fsqrtd	%f10, %f10
	.word	0xc768a04a	! t0_kref+0xeec:   	prefetch	%g2 + 0x4a, 3
	.word	0xd6064000	! t0_kref+0xef0:   	ld	[%i1], %o3
	.word	0x97b28dea	! t0_kref+0xef4:   	fnands	%f10, %f10, %f11
	.word	0x97b28cab	! t0_kref+0xef8:   	fandnot2s	%f10, %f11, %f11
	.word	0xfb6e001d	! t0_kref+0xefc:   	prefetch	%i0 + %i5, 29
	.word	0x95a2cd2a	! t0_kref+0xf00:   	fsmuld	%f11, %f10, %f10
	.word	0xc807bff0	! t0_kref+0xf04:   	ld	[%fp - 0x10], %g4
	.word	0x97a01a2a	! t0_kref+0xf08:   	fstoi	%f10, %f11
	.word	0x81dce55e	! t0_kref+0xf0c:   	flush	%l3 + 0x55e
	.word	0x8143c000	! t0_kref+0xf10:   	stbar
	.word	0x9666b7c2	! t0_kref+0xf14:   	subc	%i2, -0x83e, %o3
	.word	0x97b00140	! t0_kref+0xf18:   	edge32l	%g0, %g0, %o3
	.word	0x96be8000	! t0_kref+0xf1c:   	xnorcc	%i2, %g0, %o3
	.word	0x9680380d	! t0_kref+0xf20:   	addcc	%g0, -0x7f3, %o3
	.word	0xf4a61000	! t0_kref+0xf24:   	sta	%i2, [%i0]0x80
	.word	0x95a288ca	! t0_kref+0xf28:   	fsubd	%f10, %f10, %f10
	.word	0x95b28a8a	! t0_kref+0xf2c:   	fpsub16	%f10, %f10, %f10
	.word	0x9736801a	! t0_kref+0xf30:   	srl	%i2, %i2, %o3
	.word	0x97b00040	! t0_kref+0xf34:   	edge8l	%g0, %g0, %o3
	.word	0xeb68a089	! t0_kref+0xf38:   	prefetch	%g2 + 0x89, 21
	.word	0x96f02a3d	! t0_kref+0xf3c:   	udivcc	%g0, 0xa3d, %o3
	.word	0x96668000	! t0_kref+0xf40:   	subc	%i2, %g0, %o3
	.word	0xe43e7fe0	! t0_kref+0xf44:   	std	%l2, [%i1 - 0x20]
	.word	0x97a01a4a	! t0_kref+0xf48:   	fdtoi	%f10, %f11
	.word	0x173bc1fd	! t0_kref+0xf4c:   	sethi	%hi(0xef07f400), %o3
	.word	0x8143c000	! t0_kref+0xf50:   	stbar
	.word	0xd6063ff4	! t0_kref+0xf54:   	ld	[%i0 - 0xc], %o3
	.word	0xd526401c	! t0_kref+0xf58:   	st	%f10, [%i1 + %i4]
	.word	0x973ea014	! t0_kref+0xf5c:   	sra	%i2, 0x14, %o3
	.word	0x23800007	! t0_kref+0xf60:   	fbne,a	_kref+0xf7c
	.word	0xd686101c	! t0_kref+0xf64:   	lda	[%i0 + %i4]0x80, %o3
	.word	0x81868000	! t0_kref+0xf68:   	wr	%i2, %g0, %y
	.word	0x95a0190b	! t0_kref+0xf6c:   	fitod	%f11, %f10
	.word	0xf4b01019	! t0_kref+0xf70:   	stha	%i2, [%g0 + %i1]0x80
	.word	0xf4363fee	! t0_kref+0xf74:   	sth	%i2, [%i0 - 0x12]
	.word	0x96b83e04	! t0_kref+0xf78:   	xnorcc	%g0, -0x1fc, %o3
	.word	0x96380000	! t0_kref+0xf7c:   	not	%g0, %o3
	.word	0x81aa8aca	! t0_kref+0xf80:   	fcmped	%fcc0, %f10, %f10
	.word	0x9fc00004	! t0_kref+0xf84:   	call	%g0 + %g4
	.word	0xd6067fec	! t0_kref+0xf88:   	ld	[%i1 - 0x14], %o3
	.word	0xc0360000	! t0_kref+0xf8c:   	clrh	[%i0]
	.word	0x95a2884a	! t0_kref+0xf90:   	faddd	%f10, %f10, %f10
	.word	0x95a28d2b	! t0_kref+0xf94:   	fsmuld	%f10, %f11, %f10
	.word	0xd6563fe2	! t0_kref+0xf98:   	ldsh	[%i0 - 0x1e], %o3
	.word	0xe9e6101a	! t0_kref+0xf9c:   	casa	[%i0]0x80, %i2, %l4
	.word	0x35800007	! t0_kref+0xfa0:   	fbue,a	_kref+0xfbc
	.word	0x96902aec	! t0_kref+0xfa4:   	orcc	%g0, 0xaec, %o3
	.word	0x96903230	! t0_kref+0xfa8:   	orcc	%g0, -0xdd0, %o3
	.word	0x972e8000	! t0_kref+0xfac:   	sll	%i2, %g0, %o3
	.word	0xd6160000	! t0_kref+0xfb0:   	lduh	[%i0], %o3
	.word	0x9fc10000	! t0_kref+0xfb4:   	call	%g4
	.word	0x9646a071	! t0_kref+0xfb8:   	addc	%i2, 0x71, %o3
	.word	0xf4f75019	! t0_kref+0xfbc:   	stxa	%i2, [%i5 + %i1]0x80
	.word	0x95b2cd2a	! t0_kref+0xfc0:   	fandnot1s	%f11, %f10, %f10
	.word	0x9700341d	! t0_kref+0xfc4:   	taddcc	%g0, -0xbe3, %o3
	.word	0x35800005	! t0_kref+0xfc8:   	fbue,a	_kref+0xfdc
	.word	0x97b6811a	! t0_kref+0xfcc:   	edge32	%i2, %i2, %o3
	.word	0x961e801a	! t0_kref+0xfd0:   	xor	%i2, %i2, %o3
	.word	0xf4a61000	! t0_kref+0xfd4:   	sta	%i2, [%i0]0x80
	.word	0x30800004	! t0_kref+0xfd8:   	ba,a	_kref+0xfe8
	.word	0xe01e6018	! t0_kref+0xfdc:   	ldd	[%i1 + 0x18], %l0
	.word	0x95a0002a	! t0_kref+0xfe0:   	fmovs	%f10, %f10
	.word	0x95a2cd2b	! t0_kref+0xfe4:   	fsmuld	%f11, %f11, %f10
	.word	0x81aa8aab	! t0_kref+0xfe8:   	fcmpes	%fcc0, %f10, %f11
	.word	0x95b2cd2a	! t0_kref+0xfec:   	fandnot1s	%f11, %f10, %f10
	.word	0xe1e61000	! t0_kref+0xff0:   	casa	[%i0]0x80, %g0, %l0
	.word	0x95a000ab	! t0_kref+0xff4:   	fnegs	%f11, %f10
	.word	0x97400000	! t0_kref+0xff8:   	mov	%y, %o3
	.word	0x32480008	! t0_kref+0xffc:   	bne,a,pt	%icc, _kref+0x101c
	.word	0xd67e6000	! t0_kref+0x1000:   	swap	[%i1], %o3
	.word	0xc0362000	! t0_kref+0x1004:   	clrh	[%i0]
	.word	0x961e8000	! t0_kref+0x1008:   	xor	%i2, %g0, %o3
	.word	0x95a0192a	! t0_kref+0x100c:   	fstod	%f10, %f10
	.word	0x8143c000	! t0_kref+0x1010:   	stbar
	.word	0x9636bec9	! t0_kref+0x1014:   	orn	%i2, -0x137, %o3
	.word	0x35800008	! t0_kref+0x1018:   	fbue,a	_kref+0x1038
	.word	0x96083e5c	! t0_kref+0x101c:   	and	%g0, -0x1a4, %o3
	.word	0x9676b885	! t0_kref+0x1020:   	udiv	%i2, -0x77b, %o3
	.word	0x81dbf964	! t0_kref+0x1024:   	flush	%o7 - 0x69c
	.word	0x97400000	! t0_kref+0x1028:   	mov	%y, %o3
	.word	0x95a2894a	! t0_kref+0x102c:   	fmuld	%f10, %f10, %f10
	.word	0x96e6801a	! t0_kref+0x1030:   	subccc	%i2, %i2, %o3
	.word	0x96e6a4e5	! t0_kref+0x1034:   	subccc	%i2, 0x4e5, %o3
	.word	0x95a0052a	! t0_kref+0x1038:   	fsqrts	%f10, %f10
	.word	0x96368000	! t0_kref+0x103c:   	orn	%i2, %g0, %o3
	.word	0x95a2c9aa	! t0_kref+0x1040:   	fdivs	%f11, %f10, %f10
	call	SYM(t0_subr1)
	.word	0x95b2c62a	! t0_kref+0x1048:   	fmul8x16	%f11, %f10, %f10
	.word	0x95b28f8a	! t0_kref+0x104c:   	for	%f10, %f10, %f10
	.word	0xc0270018	! t0_kref+0x1050:   	clr	[%i4 + %i0]
	.word	0x9736a016	! t0_kref+0x1054:   	srl	%i2, 0x16, %o3
	.word	0x9726ba70	! t0_kref+0x1058:   	mulscc	%i2, -0x590, %o3
	.word	0x97b00040	! t0_kref+0x105c:   	edge8l	%g0, %g0, %o3
	.word	0xfb6e401d	! t0_kref+0x1060:   	prefetch	%i1 + %i5, 29
	.word	0x97a0012a	! t0_kref+0x1064:   	fabss	%f10, %f11
	.word	0x965ebab8	! t0_kref+0x1068:   	smul	%i2, -0x548, %o3
	.word	0x21800006	! t0_kref+0x106c:   	fbn,a	_kref+0x1084
	.word	0xd5180019	! t0_kref+0x1070:   	ldd	[%g0 + %i1], %f10
	.word	0x96d022ef	! t0_kref+0x1074:   	umulcc	%g0, 0x2ef, %o3
	.word	0x95a0012a	! t0_kref+0x1078:   	fabss	%f10, %f10
	.word	0x97b28aeb	! t0_kref+0x107c:   	fpsub32s	%f10, %f11, %f11
	.word	0xd656001b	! t0_kref+0x1080:   	ldsh	[%i0 + %i3], %o3
	.word	0x95a2894a	! t0_kref+0x1084:   	fmuld	%f10, %f10, %f10
	.word	0x9676801a	! t0_kref+0x1088:   	udiv	%i2, %i2, %o3
	.word	0xf4280019	! t0_kref+0x108c:   	stb	%i2, [%g0 + %i1]
	.word	0xd65e001d	! t0_kref+0x1090:   	ldx	[%i0 + %i5], %o3
	.word	0xc0b01018	! t0_kref+0x1094:   	stha	%g0, [%g0 + %i0]0x80
	.word	0x81de2f7f	! t0_kref+0x1098:   	flush	%i0 + 0xf7f
	.word	0x95a2c82b	! t0_kref+0x109c:   	fadds	%f11, %f11, %f10
	.word	0x95a0054a	! t0_kref+0x10a0:   	fsqrtd	%f10, %f10
	.word	0xff6e401b	! t0_kref+0x10a4:   	prefetch	%i1 + %i3, 31
	.word	0x96a68000	! t0_kref+0x10a8:   	subcc	%i2, %g0, %o3
	.word	0x81580000	! t0_kref+0x10ac:   	flushw
	.word	0x31800007	! t0_kref+0x10b0:   	fba,a	_kref+0x10cc
	.word	0x9766001a	! t0_kref+0x10b4:   	mova	%icc, %i2, %o3
	.word	0x1727e3b1	! t0_kref+0x10b8:   	sethi	%hi(0x9f8ec400), %o3
	.word	0x97b007aa	! t0_kref+0x10bc:   	fpackfix	%f10, %f11
	.word	0x96580000	! t0_kref+0x10c0:   	smul	%g0, %g0, %o3
	.word	0x23480005	! t0_kref+0x10c4:   	fbne,a,pt	%fcc0, _kref+0x10d8
	.word	0x95a289ab	! t0_kref+0x10c8:   	fdivs	%f10, %f11, %f10
	.word	0x95a0002a	! t0_kref+0x10cc:   	fmovs	%f10, %f10
	.word	0xd6d6101b	! t0_kref+0x10d0:   	ldsha	[%i0 + %i3]0x80, %o3
	.word	0xd6d81019	! t0_kref+0x10d4:   	ldxa	[%g0 + %i1]0x80, %o3
	.word	0xd6562012	! t0_kref+0x10d8:   	ldsh	[%i0 + 0x12], %o3
	.word	0x96d6801a	! t0_kref+0x10dc:   	umulcc	%i2, %i2, %o3
	.word	0x97a0002b	! t0_kref+0x10e0:   	fmovs	%f11, %f11
	.word	0x97a0052a	! t0_kref+0x10e4:   	fsqrts	%f10, %f11
	.word	0x95a2894a	! t0_kref+0x10e8:   	fmuld	%f10, %f10, %f10
	.word	0x96d0388c	! t0_kref+0x10ec:   	umulcc	%g0, -0x774, %o3
	.word	0xd6563fee	! t0_kref+0x10f0:   	ldsh	[%i0 - 0x12], %o3
	.word	0x95a28d2b	! t0_kref+0x10f4:   	fsmuld	%f10, %f11, %f10
	.word	0x96702d65	! t0_kref+0x10f8:   	udiv	%g0, 0xd65, %o3
	.word	0xc0f6101d	! t0_kref+0x10fc:   	stxa	%g0, [%i0 + %i5]0x80
	.word	0xd51fbe70	! t0_kref+0x1100:   	ldd	[%fp - 0x190], %f10
	.word	0x81aacaaa	! t0_kref+0x1104:   	fcmpes	%fcc0, %f11, %f10
	.word	0x96780000	! t0_kref+0x1108:   	sdiv	%g0, %g0, %o3
	.word	0x96f68000	! t0_kref+0x110c:   	udivcc	%i2, %g0, %o3
	.word	0xe01e2008	! t0_kref+0x1110:   	ldd	[%i0 + 8], %l0
	.word	0x97a0002b	! t0_kref+0x1114:   	fmovs	%f11, %f11
	.word	0xd6871058	! t0_kref+0x1118:   	lda	[%i4 + %i0]0x82, %o3
	.word	0x9650001a	! t0_kref+0x111c:   	umul	%g0, %i2, %o3
	.word	0x95a0192a	! t0_kref+0x1120:   	fstod	%f10, %f10
	.word	0x96f6bec7	! t0_kref+0x1124:   	udivcc	%i2, -0x139, %o3
	.word	0x95a2894a	! t0_kref+0x1128:   	fmuld	%f10, %f10, %f10
	.word	0x95b2cd60	! t0_kref+0x112c:   	fnot1s	%f11, %f10
	.word	0x9696801a	! t0_kref+0x1130:   	orcc	%i2, %i2, %o3
	.word	0xc0366006	! t0_kref+0x1134:   	clrh	[%i1 + 6]
	.word	0x95a2884a	! t0_kref+0x1138:   	faddd	%f10, %f10, %f10
	.word	0x972e8000	! t0_kref+0x113c:   	sll	%i2, %g0, %o3
	.word	0x964037e6	! t0_kref+0x1140:   	addc	%g0, -0x81a, %o3
	.word	0x97a01a4a	! t0_kref+0x1144:   	fdtoi	%f10, %f11
	.word	0x95a000ca	! t0_kref+0x1148:   	fnegd	%f10, %f10
	.word	0x95b2caea	! t0_kref+0x114c:   	fpsub32s	%f11, %f10, %f10
	.word	0xe66e3fe1	! t0_kref+0x1150:   	ldstub	[%i0 - 0x1f], %l3
	.word	0xc0764000	! t0_kref+0x1154:   	stx	%g0, [%i1]
	.word	0xd5a6501c	! t0_kref+0x1158:   	sta	%f10, [%i1 + %i4]0x80
	.word	0x96beb15f	! t0_kref+0x115c:   	xnorcc	%i2, -0xea1, %o3
	.word	0x97a01a4a	! t0_kref+0x1160:   	fdtoi	%f10, %f11
	.word	0x9fc00004	! t0_kref+0x1164:   	call	%g0 + %g4
	.word	0x97a2892b	! t0_kref+0x1168:   	fmuls	%f10, %f11, %f11
	.word	0x95b2caeb	! t0_kref+0x116c:   	fpsub32s	%f11, %f11, %f10
	.word	0x95a2884a	! t0_kref+0x1170:   	faddd	%f10, %f10, %f10
	.word	0xd606401c	! t0_kref+0x1174:   	ld	[%i1 + %i4], %o3
	.word	0xd64e7fea	! t0_kref+0x1178:   	ldsb	[%i1 - 0x16], %o3
	.word	0xe4380019	! t0_kref+0x117c:   	std	%l2, [%g0 + %i1]
	.word	0xe0380018	! t0_kref+0x1180:   	std	%l0, [%g0 + %i0]
	.word	0xd19e7fed	! t0_kref+0x1184:   	ldda	[%i1 - 0x13]%asi, %f8
	.word	0x9fc00004	! t0_kref+0x1188:   	call	%g0 + %g4
	.word	0xd6163ffa	! t0_kref+0x118c:   	lduh	[%i0 - 6], %o3
	.word	0x95a0192b	! t0_kref+0x1190:   	fstod	%f11, %f10
	.word	0xd6de5000	! t0_kref+0x1194:   	ldxa	[%i1]0x80, %o3
	.word	0x95b28f4a	! t0_kref+0x1198:   	fornot1	%f10, %f10, %f10
	.word	0xd6100018	! t0_kref+0x119c:   	lduh	[%g0 + %i0], %o3
	.word	0xe01e3ff8	! t0_kref+0x11a0:   	ldd	[%i0 - 8], %l0
	.word	0xe43e7fe0	! t0_kref+0x11a4:   	std	%l2, [%i1 - 0x20]
	.word	0xc56e401a	! t0_kref+0x11a8:   	prefetch	%i1 + %i2, 2
	.word	0x9740c000	! t0_kref+0x11ac:   	mov	%asi, %o3
	.word	0x96d68000	! t0_kref+0x11b0:   	umulcc	%i2, %g0, %o3
	.word	0x97a289ab	! t0_kref+0x11b4:   	fdivs	%f10, %f11, %f11
	.word	0x962021a3	! t0_kref+0x11b8:   	sub	%g0, 0x1a3, %o3
	.word	0x170a895e	! t0_kref+0x11bc:   	sethi	%hi(0x2a257800), %o3
	.word	0x97b28e6b	! t0_kref+0x11c0:   	fxnors	%f10, %f11, %f11
	.word	0x95a2894a	! t0_kref+0x11c4:   	fmuld	%f10, %f10, %f10
	.word	0x81580000	! t0_kref+0x11c8:   	flushw
	.word	0x81aa8aaa	! t0_kref+0x11cc:   	fcmpes	%fcc0, %f10, %f10
	.word	0x95b2cd2a	! t0_kref+0x11d0:   	fandnot1s	%f11, %f10, %f10
	.word	0x96182ba5	! t0_kref+0x11d4:   	xor	%g0, 0xba5, %o3
	.word	0x95b286ea	! t0_kref+0x11d8:   	fmul8ulx16	%f10, %f10, %f10
	.word	0x97b000a0	! t0_kref+0x11dc:   	edge16n	%g0, %g0, %o3
	.word	0x96a80000	! t0_kref+0x11e0:   	andncc	%g0, %g0, %o3
	.word	0x95a2c82a	! t0_kref+0x11e4:   	fadds	%f11, %f10, %f10
	.word	0xd51e6010	! t0_kref+0x11e8:   	ldd	[%i1 + 0x10], %f10
	.word	0x95a2894a	! t0_kref+0x11ec:   	fmuld	%f10, %f10, %f10
	.word	0xd6ce9019	! t0_kref+0x11f0:   	ldsba	[%i2 + %i1]0x80, %o3
	.word	0x964025df	! t0_kref+0x11f4:   	addc	%g0, 0x5df, %o3
	.word	0x95a8c04a	! t0_kref+0x11f8:   	fmovdul	%fcc0, %f10, %f10
	.word	0xd65e3fe8	! t0_kref+0x11fc:   	ldx	[%i0 - 0x18], %o3
	.word	0xd5180018	! t0_kref+0x1200:   	ldd	[%g0 + %i0], %f10
	.word	0x97a01a2b	! t0_kref+0x1204:   	fstoi	%f11, %f11
	.word	0x97a2c9ab	! t0_kref+0x1208:   	fdivs	%f11, %f11, %f11
	.word	0xb8103ffc	! t0_kref+0x120c:   	mov	0xfffffffc, %i4
	.word	0x95a2894a	! t0_kref+0x1210:   	fmuld	%f10, %f10, %f10
	.word	0x96f6babf	! t0_kref+0x1214:   	udivcc	%i2, -0x541, %o3
	.word	0xd1be185a	! t0_kref+0x1218:   	stda	%f8, [%i0 + %i2]0xc2
	.word	0xd700a030	! t0_kref+0x121c:   	ld	[%g2 + 0x30], %f11
	.word	0x96a68000	! t0_kref+0x1220:   	subcc	%i2, %g0, %o3
	.word	0xd5180019	! t0_kref+0x1224:   	ldd	[%g0 + %i1], %f10
	.word	0xd6064000	! t0_kref+0x1228:   	ld	[%i1], %o3
	.word	0x81aa8aca	! t0_kref+0x122c:   	fcmped	%fcc0, %f10, %f10
	.word	0x95a0192b	! t0_kref+0x1230:   	fstod	%f11, %f10
	.word	0x97b6805a	! t0_kref+0x1234:   	edge8l	%i2, %i2, %o3
	.word	0xd600a028	! t0_kref+0x1238:   	ld	[%g2 + 0x28], %o3
	.word	0x97408000	! t0_kref+0x123c:   	mov	%ccr, %o3
	.word	0x9fc00004	! t0_kref+0x1240:   	call	%g0 + %g4
	.word	0x97a0052b	! t0_kref+0x1244:   	fsqrts	%f11, %f11
	.word	0xd6080018	! t0_kref+0x1248:   	ldub	[%g0 + %i0], %o3
	.word	0xd6de501d	! t0_kref+0x124c:   	ldxa	[%i1 + %i5]0x80, %o3
	.word	0x97b28e2b	! t0_kref+0x1250:   	fands	%f10, %f11, %f11
	.word	0x26800007	! t0_kref+0x1254:   	bl,a	_kref+0x1270
	.word	0x965035f7	! t0_kref+0x1258:   	umul	%g0, -0xa09, %o3
	.word	0x97b28a6b	! t0_kref+0x125c:   	fpadd32s	%f10, %f11, %f11
	.word	0xe0180018	! t0_kref+0x1260:   	ldd	[%g0 + %i0], %l0
	.word	0x95a289aa	! t0_kref+0x1264:   	fdivs	%f10, %f10, %f10
	.word	0x97183fe9	! t0_kref+0x1268:   	tsubcctv	%g0, -0x17, %o3
	.word	0xe0380019	! t0_kref+0x126c:   	std	%l0, [%g0 + %i1]
	.word	0xe46e8019	! t0_kref+0x1270:   	ldstub	[%i2 + %i1], %l2
	.word	0x960ea251	! t0_kref+0x1274:   	and	%i2, 0x251, %o3
	.word	0x3f800005	! t0_kref+0x1278:   	fbo,a	_kref+0x128c
	.word	0x97b68240	! t0_kref+0x127c:   	array16	%i2, %g0, %o3
	.word	0xc07e6000	! t0_kref+0x1280:   	swap	[%i1], %g0
	.word	0x2e800004	! t0_kref+0x1284:   	bvs,a	_kref+0x1294
	.word	0x95a2c92b	! t0_kref+0x1288:   	fmuls	%f11, %f11, %f10
	.word	0x8143c000	! t0_kref+0x128c:   	stbar
	.word	0x26800002	! t0_kref+0x1290:   	bl,a	_kref+0x1298
	.word	0x95a2882a	! t0_kref+0x1294:   	fadds	%f10, %f10, %f10
	.word	0x95b28fab	! t0_kref+0x1298:   	fors	%f10, %f11, %f10
	.word	0x97b68240	! t0_kref+0x129c:   	array16	%i2, %g0, %o3
	.word	0x9fc00004	! t0_kref+0x12a0:   	call	%g0 + %g4
	.word	0xd53e7ff8	! t0_kref+0x12a4:   	std	%f10, [%i1 - 8]
	.word	0x2b800002	! t0_kref+0x12a8:   	fbug,a	_kref+0x12b0
	.word	0xd51e3ff0	! t0_kref+0x12ac:   	ldd	[%i0 - 0x10], %f10
	.word	0x35800001	! t0_kref+0x12b0:   	fbue,a	_kref+0x12b4
	.word	0x95a288ca	! t0_kref+0x12b4:   	fsubd	%f10, %f10, %f10
	.word	0x27480008	! t0_kref+0x12b8:   	fbul,a,pt	%fcc0, _kref+0x12d8
	.word	0xd5be501d	! t0_kref+0x12bc:   	stda	%f10, [%i1 + %i5]0x80
	.word	0x95b28e0a	! t0_kref+0x12c0:   	fand	%f10, %f10, %f10
	.word	0x97200000	! t0_kref+0x12c4:   	mulscc	%g0, %g0, %o3
	.word	0x9616b927	! t0_kref+0x12c8:   	or	%i2, -0x6d9, %o3
	.word	0xd6566018	! t0_kref+0x12cc:   	ldsh	[%i1 + 0x18], %o3
	.word	0xd6070018	! t0_kref+0x12d0:   	ld	[%i4 + %i0], %o3
	.word	0x95a0012b	! t0_kref+0x12d4:   	fabss	%f11, %f10
	.word	0x961eb7de	! t0_kref+0x12d8:   	xor	%i2, -0x822, %o3
	.word	0xd606401c	! t0_kref+0x12dc:   	ld	[%i1 + %i4], %o3
	.word	0x96180000	! t0_kref+0x12e0:   	xor	%g0, %g0, %o3
	.word	0xe43e4000	! t0_kref+0x12e4:   	std	%l2, [%i1]
	.word	0xf428a039	! t0_kref+0x12e8:   	stb	%i2, [%g2 + 0x39]
	.word	0x95a2884a	! t0_kref+0x12ec:   	faddd	%f10, %f10, %f10
	.word	0x95a2894a	! t0_kref+0x12f0:   	fmuld	%f10, %f10, %f10
	.word	0x95a0002b	! t0_kref+0x12f4:   	fmovs	%f11, %f10
	.word	0x95a0190a	! t0_kref+0x12f8:   	fitod	%f10, %f10
	.word	0x81aa8aab	! t0_kref+0x12fc:   	fcmpes	%fcc0, %f10, %f11
	.word	0x81de3bc2	! t0_kref+0x1300:   	flush	%i0 - 0x43e
	.word	0x97a000ab	! t0_kref+0x1304:   	fnegs	%f11, %f11
	.word	0x96280000	! t0_kref+0x1308:   	andn	%g0, %g0, %o3
	.word	0x38800002	! t0_kref+0x130c:   	bgu,a	_kref+0x1314
	.word	0x95a018ca	! t0_kref+0x1310:   	fdtos	%f10, %f10
	.word	0x9736a01e	! t0_kref+0x1314:   	srl	%i2, 0x1e, %o3
	.word	0x95b28e4a	! t0_kref+0x1318:   	fxnor	%f10, %f10, %f10
	.word	0x95a0002b	! t0_kref+0x131c:   	fmovs	%f11, %f10
	.word	0x9736a00b	! t0_kref+0x1320:   	srl	%i2, 0xb, %o3
	.word	0xd51f4019	! t0_kref+0x1324:   	ldd	[%i5 + %i1], %f10
	.word	0x9646ab18	! t0_kref+0x1328:   	addc	%i2, 0xb18, %o3
	.word	0x9690339c	! t0_kref+0x132c:   	orcc	%g0, -0xc64, %o3
	.word	0x95b28f8a	! t0_kref+0x1330:   	for	%f10, %f10, %f10
	.word	0x97a2892a	! t0_kref+0x1334:   	fmuls	%f10, %f10, %f11
	.word	0x95a8804a	! t0_kref+0x1338:   	fmovdlg	%fcc0, %f10, %f10
	.word	0x34800004	! t0_kref+0x133c:   	bg,a	_kref+0x134c
	.word	0xc568a040	! t0_kref+0x1340:   	prefetch	%g2 + 0x40, 2
	.word	0x97a2882a	! t0_kref+0x1344:   	fadds	%f10, %f10, %f11
	.word	0x96f68000	! t0_kref+0x1348:   	udivcc	%i2, %g0, %o3
	.word	0x25800008	! t0_kref+0x134c:   	fblg,a	_kref+0x136c
	.word	0x97300000	! t0_kref+0x1350:   	srl	%g0, %g0, %o3
	.word	0x96d68000	! t0_kref+0x1354:   	umulcc	%i2, %g0, %o3
	.word	0xc168a00f	! t0_kref+0x1358:   	prefetch	%g2 + 0xf, 0
	.word	0x95b28a4a	! t0_kref+0x135c:   	fpadd32	%f10, %f10, %f10
	.word	0x95a0052a	! t0_kref+0x1360:   	fsqrts	%f10, %f10
	.word	0x97b2854a	! t0_kref+0x1364:   	fcmpeq16	%f10, %f10, %o3
	.word	0x96900000	! t0_kref+0x1368:   	orcc	%g0, %g0, %o3
	.word	0xea6e8018	! t0_kref+0x136c:   	ldstub	[%i2 + %i0], %l5
	.word	0x95a0054a	! t0_kref+0x1370:   	fsqrtd	%f10, %f10
	.word	0x97b68320	! t0_kref+0x1374:   	bmask	%i2, %g0, %o3
	.word	0x96f0001a	! t0_kref+0x1378:   	udivcc	%g0, %i2, %o3
	.word	0xe49e505d	! t0_kref+0x137c:   	ldda	[%i1 + %i5]0x82, %l2
	.word	0x97a01a4a	! t0_kref+0x1380:   	fdtoi	%f10, %f11
	.word	0x97203168	! t0_kref+0x1384:   	mulscc	%g0, -0xe98, %o3
	.word	0x97b00280	! t0_kref+0x1388:   	array32	%g0, %g0, %o3
	.word	0x96f00000	! t0_kref+0x138c:   	udivcc	%g0, %g0, %o3
	.word	0x95a0192b	! t0_kref+0x1390:   	fstod	%f11, %f10
	.word	0xe01e001d	! t0_kref+0x1394:   	ldd	[%i0 + %i5], %l0
	.word	0x9720001a	! t0_kref+0x1398:   	mulscc	%g0, %i2, %o3
	.word	0x95a0054a	! t0_kref+0x139c:   	fsqrtd	%f10, %f10
	.word	0xc568a005	! t0_kref+0x13a0:   	prefetch	%g2 + 5, 2
	.word	0x97a2c9ab	! t0_kref+0x13a4:   	fdivs	%f11, %f11, %f11
	.word	0x81df8000	! t0_kref+0x13a8:   	flush	%fp
	.word	0x95b00c20	! t0_kref+0x13ac:   	fzeros	%f10
	.word	0x96f0309f	! t0_kref+0x13b0:   	udivcc	%g0, -0xf61, %o3
	.word	0xd6066010	! t0_kref+0x13b4:   	ld	[%i1 + 0x10], %o3
	.word	0x9fc10000	! t0_kref+0x13b8:   	call	%g4
	.word	0x95a2894a	! t0_kref+0x13bc:   	fmuld	%f10, %f10, %f10
	.word	0xc768a081	! t0_kref+0x13c0:   	prefetch	%g2 + 0x81, 3
	.word	0xd6000019	! t0_kref+0x13c4:   	ld	[%g0 + %i1], %o3
	.word	0x23800006	! t0_kref+0x13c8:   	fbne,a	_kref+0x13e0
	.word	0xd59e5000	! t0_kref+0x13cc:   	ldda	[%i1]0x80, %f10
	.word	0x81aaca2b	! t0_kref+0x13d0:   	fcmps	%fcc0, %f11, %f11
	.word	0x001fffff	! t0_kref+0x13d4:   	illtrap	0x1fffff
	.word	0x96a0001a	! t0_kref+0x13d8:   	subcc	%g0, %i2, %o3
	.word	0x97a0188b	! t0_kref+0x13dc:   	fitos	%f11, %f11
	.word	0x9696ba05	! t0_kref+0x13e0:   	orcc	%i2, -0x5fb, %o3
	.word	0xd616001b	! t0_kref+0x13e4:   	lduh	[%i0 + %i3], %o3
	.word	0x878020f0	! t0_kref+0x13e8:   	mov	0xf0, %asi
	.word	0x86102003	! t0_kref+0x13ec:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x13f0:   	bne,a	_kref+0x13f0
	.word	0x86a0e001	! t0_kref+0x13f4:   	subcc	%g3, 1, %g3
	.word	0xd51fbda0	! t0_kref+0x13f8:   	ldd	[%fp - 0x260], %f10
	.word	0x9726b477	! t0_kref+0x13fc:   	mulscc	%i2, -0xb89, %o3
	.word	0xc168a04f	! t0_kref+0x1400:   	prefetch	%g2 + 0x4f, 0
	.word	0xd696101b	! t0_kref+0x1404:   	lduha	[%i0 + %i3]0x80, %o3
	.word	0x97a01a4a	! t0_kref+0x1408:   	fdtoi	%f10, %f11
	.word	0xd6066000	! t0_kref+0x140c:   	ld	[%i1], %o3
	.word	0x9696b637	! t0_kref+0x1410:   	orcc	%i2, -0x9c9, %o3
	.word	0x96e6a3c9	! t0_kref+0x1414:   	subccc	%i2, 0x3c9, %o3
	.word	0x97a0188a	! t0_kref+0x1418:   	fitos	%f10, %f11
	.word	0xd6000018	! t0_kref+0x141c:   	ld	[%g0 + %i0], %o3
	.word	0x37800001	! t0_kref+0x1420:   	fbge,a	_kref+0x1424
	.word	0x9738001a	! t0_kref+0x1424:   	sra	%g0, %i2, %o3
	.word	0x9726801a	! t0_kref+0x1428:   	mulscc	%i2, %i2, %o3
	.word	0x95b00cca	! t0_kref+0x142c:   	fnot2	%f10, %f10
	.word	0xd60e6006	! t0_kref+0x1430:   	ldub	[%i1 + 6], %o3
	.word	0x87802080	! t0_kref+0x1434:   	mov	0x80, %asi
	.word	0xd616601a	! t0_kref+0x1438:   	lduh	[%i1 + 0x1a], %o3
	.word	0x95a2884a	! t0_kref+0x143c:   	faddd	%f10, %f10, %f10
	.word	0x97a289ab	! t0_kref+0x1440:   	fdivs	%f10, %f11, %f11
	.word	0x97382001	! t0_kref+0x1444:   	sra	%g0, 0x1, %o3
	.word	0x96800000	! t0_kref+0x1448:   	addcc	%g0, %g0, %o3
	.word	0x96aeb44c	! t0_kref+0x144c:   	andncc	%i2, -0xbb4, %o3
	.word	0x96aeb29f	! t0_kref+0x1450:   	andncc	%i2, -0xd61, %o3
	.word	0x97a0002b	! t0_kref+0x1454:   	fmovs	%f11, %f11
	.word	0x9600001a	! t0_kref+0x1458:   	add	%g0, %i2, %o3
	.word	0x95a000ab	! t0_kref+0x145c:   	fnegs	%f11, %f10
	.word	0x81aa8aaa	! t0_kref+0x1460:   	fcmpes	%fcc0, %f10, %f10
	.word	0x97b0005a	! t0_kref+0x1464:   	edge8l	%g0, %i2, %o3
	.word	0x9658001a	! t0_kref+0x1468:   	smul	%g0, %i2, %o3
	.word	0x96f6801a	! t0_kref+0x146c:   	udivcc	%i2, %i2, %o3
	.word	0xd68e7fe8	! t0_kref+0x1470:   	lduba	[%i1 - 0x18]%asi, %o3
	.word	0x97a0188a	! t0_kref+0x1474:   	fitos	%f10, %f11
	.word	0x95a0002b	! t0_kref+0x1478:   	fmovs	%f11, %f10
	.word	0x960e801a	! t0_kref+0x147c:   	and	%i2, %i2, %o3
	.word	0x97b2ccab	! t0_kref+0x1480:   	fandnot2s	%f11, %f11, %f11
	.word	0x97b0033a	! t0_kref+0x1484:   	bmask	%g0, %i2, %o3
	.word	0xede8a042	! t0_kref+0x1488:   	prefetcha	%g2 + 0x42, 22
	.word	0x95a28d2a	! t0_kref+0x148c:   	fsmuld	%f10, %f10, %f10
	.word	0x97400000	! t0_kref+0x1490:   	mov	%y, %o3
	.word	0x95a000aa	! t0_kref+0x1494:   	fnegs	%f10, %f10
	.word	0x81deb195	! t0_kref+0x1498:   	flush	%i2 - 0xe6b
	.word	0x961825f9	! t0_kref+0x149c:   	xor	%g0, 0x5f9, %o3
	.word	0x97a01a4a	! t0_kref+0x14a0:   	fdtoi	%f10, %f11
	.word	0x9696801a	! t0_kref+0x14a4:   	orcc	%i2, %i2, %o3
	.word	0xd6064000	! t0_kref+0x14a8:   	ld	[%i1], %o3
	.word	0x97a0012a	! t0_kref+0x14ac:   	fabss	%f10, %f11
	.word	0x97a01a4a	! t0_kref+0x14b0:   	fdtoi	%f10, %f11
	.word	0x81aacaab	! t0_kref+0x14b4:   	fcmpes	%fcc0, %f11, %f11
	.word	0xe09e5000	! t0_kref+0x14b8:   	ldda	[%i1]0x80, %l0
	.word	0x96f00000	! t0_kref+0x14bc:   	udivcc	%g0, %g0, %o3
	.word	0x9fc00004	! t0_kref+0x14c0:   	call	%g0 + %g4
	.word	0xe43f4018	! t0_kref+0x14c4:   	std	%l2, [%i5 + %i0]
	.word	0x9610368a	! t0_kref+0x14c8:   	mov	0xfffff68a, %o3
	.word	0x95b28a0a	! t0_kref+0x14cc:   	fpadd16	%f10, %f10, %f10
	.word	0x96be8000	! t0_kref+0x14d0:   	xnorcc	%i2, %g0, %o3
	.word	0xd6166002	! t0_kref+0x14d4:   	lduh	[%i1 + 2], %o3
	.word	0x95b28d40	! t0_kref+0x14d8:   	fnot1	%f10, %f10
	.word	0xd51e2008	! t0_kref+0x14dc:   	ldd	[%i0 + 8], %f10
	.word	0xd6167ff0	! t0_kref+0x14e0:   	lduh	[%i1 - 0x10], %o3
	.word	0x96b80000	! t0_kref+0x14e4:   	xnorcc	%g0, %g0, %o3
	.word	0x96f00000	! t0_kref+0x14e8:   	udivcc	%g0, %g0, %o3
	.word	0xd720a004	! t0_kref+0x14ec:   	st	%f11, [%g2 + 4]
	.word	0xd608a02d	! t0_kref+0x14f0:   	ldub	[%g2 + 0x2d], %o3
	.word	0x97b28d60	! t0_kref+0x14f4:   	fnot1s	%f10, %f11
	.word	0x95a289aa	! t0_kref+0x14f8:   	fdivs	%f10, %f10, %f10
	.word	0xd6562014	! t0_kref+0x14fc:   	ldsh	[%i0 + 0x14], %o3
	.word	0x968eb1d0	! t0_kref+0x1500:   	andcc	%i2, -0xe30, %o3
	.word	0x95a01a4a	! t0_kref+0x1504:   	fdtoi	%f10, %f10
	.word	0x95a2c82a	! t0_kref+0x1508:   	fadds	%f11, %f10, %f10
	.word	0x81dab854	! t0_kref+0x150c:   	flush	%o2 - 0x7ac
	.word	0xd6164000	! t0_kref+0x1510:   	lduh	[%i1], %o3
	.word	0x81dfa3f7	! t0_kref+0x1514:   	flush	%fp + 0x3f7
	.word	0x95a0192b	! t0_kref+0x1518:   	fstod	%f11, %f10
	.word	0xd51e2018	! t0_kref+0x151c:   	ldd	[%i0 + 0x18], %f10
	.word	0xd6060000	! t0_kref+0x1520:   	ld	[%i0], %o3
	.word	0x95a0054a	! t0_kref+0x1524:   	fsqrtd	%f10, %f10
	.word	0xd51e3ff0	! t0_kref+0x1528:   	ldd	[%i0 - 0x10], %f10
	.word	0x86102004	! t0_kref+0x152c:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x1530:   	bne,a	_kref+0x1530
	.word	0x86a0e001	! t0_kref+0x1534:   	subcc	%g3, 1, %g3
	.word	0xd67e7fe0	! t0_kref+0x1538:   	swap	[%i1 - 0x20], %o3
	.word	0xe0380019	! t0_kref+0x153c:   	std	%l0, [%g0 + %i1]
	.word	0x33800008	! t0_kref+0x1540:   	fbe,a	_kref+0x1560
	.word	0x97b0001a	! t0_kref+0x1544:   	edge8	%g0, %i2, %o3
	.word	0x97382016	! t0_kref+0x1548:   	sra	%g0, 0x16, %o3
	.word	0x9690001a	! t0_kref+0x154c:   	orcc	%g0, %i2, %o3
	.word	0x8580353a	! t0_kref+0x1550:   	mov	0xfffff53a, %ccr
	.word	0x95b28eca	! t0_kref+0x1554:   	fornot2	%f10, %f10, %f10
	.word	0x9608001a	! t0_kref+0x1558:   	and	%g0, %i2, %o3
	.word	0x9608246b	! t0_kref+0x155c:   	and	%g0, 0x46b, %o3
	.word	0x97b000c0	! t0_kref+0x1560:   	edge16l	%g0, %g0, %o3
	.word	0x96be801a	! t0_kref+0x1564:   	xnorcc	%i2, %i2, %o3
	.word	0x25800006	! t0_kref+0x1568:   	fblg,a	_kref+0x1580
	.word	0x95a0002a	! t0_kref+0x156c:   	fmovs	%f10, %f10
	.word	0xd51fbca8	! t0_kref+0x1570:   	ldd	[%fp - 0x358], %f10
	.word	0x95b2862a	! t0_kref+0x1574:   	fmul8x16	%f10, %f10, %f10
	.word	0x96e00000	! t0_kref+0x1578:   	subccc	%g0, %g0, %o3
	.word	0xd60e3fe5	! t0_kref+0x157c:   	ldub	[%i0 - 0x1b], %o3
	.word	0x96b8001a	! t0_kref+0x1580:   	xnorcc	%g0, %i2, %o3
	.word	0x9686801a	! t0_kref+0x1584:   	addcc	%i2, %i2, %o3
	.word	0xd6ce3fff	! t0_kref+0x1588:   	ldsba	[%i0 - 1]%asi, %o3
	.word	0x81aa8aab	! t0_kref+0x158c:   	fcmpes	%fcc0, %f10, %f11
	.word	0x97a0012a	! t0_kref+0x1590:   	fabss	%f10, %f11
	.word	0xd51e3fe8	! t0_kref+0x1594:   	ldd	[%i0 - 0x18], %f10
	.word	0xe43e2018	! t0_kref+0x1598:   	std	%l2, [%i0 + 0x18]
	.word	0xd51e3fe0	! t0_kref+0x159c:   	ldd	[%i0 - 0x20], %f10
	.word	0x95b28d40	! t0_kref+0x15a0:   	fnot1	%f10, %f10
	.word	0x95a2894a	! t0_kref+0x15a4:   	fmuld	%f10, %f10, %f10
	.word	0x95a2884a	! t0_kref+0x15a8:   	faddd	%f10, %f10, %f10
	.word	0xd60e3fe7	! t0_kref+0x15ac:   	ldub	[%i0 - 0x19], %o3
	.word	0x86102004	! t0_kref+0x15b0:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x15b4:   	bne,a	_kref+0x15b4
	.word	0x86a0e001	! t0_kref+0x15b8:   	subcc	%g3, 1, %g3
	.word	0x81aa8aab	! t0_kref+0x15bc:   	fcmpes	%fcc0, %f10, %f11
	.word	0xd6100019	! t0_kref+0x15c0:   	lduh	[%g0 + %i1], %o3
	.word	0x97a0002a	! t0_kref+0x15c4:   	fmovs	%f10, %f11
	.word	0x95b28e4a	! t0_kref+0x15c8:   	fxnor	%f10, %f10, %f10
	.word	0x95b2862a	! t0_kref+0x15cc:   	fmul8x16	%f10, %f10, %f10
	.word	0x95b28d2a	! t0_kref+0x15d0:   	fandnot1s	%f10, %f10, %f10
	.word	0x8143c000	! t0_kref+0x15d4:   	stbar
	.word	0x81db000a	! t0_kref+0x15d8:   	flush	%o4 + %o2
	.word	0xd6067fe0	! t0_kref+0x15dc:   	ld	[%i1 - 0x20], %o3
	.word	0xd6070018	! t0_kref+0x15e0:   	ld	[%i4 + %i0], %o3
	.word	0x95b28e2a	! t0_kref+0x15e4:   	fands	%f10, %f10, %f10
	.word	0x9690001a	! t0_kref+0x15e8:   	orcc	%g0, %i2, %o3
	.word	0xe43e0000	! t0_kref+0x15ec:   	std	%l2, [%i0]
	.word	0x97a000ab	! t0_kref+0x15f0:   	fnegs	%f11, %f11
	.word	0x97b2840a	! t0_kref+0x15f4:   	fcmple16	%f10, %f10, %o3
	.word	0x23800002	! t0_kref+0x15f8:   	fbne,a	_kref+0x1600
	.word	0x95b00fe0	! t0_kref+0x15fc:   	fones	%f10
	.word	0x97b007aa	! t0_kref+0x1600:   	fpackfix	%f10, %f11
	.word	0x37480006	! t0_kref+0x1604:   	fbge,a,pt	%fcc0, _kref+0x161c
	.word	0x9686b8a8	! t0_kref+0x1608:   	addcc	%i2, -0x758, %o3
	.word	0x37800002	! t0_kref+0x160c:   	fbge,a	_kref+0x1614
	.word	0x96402653	! t0_kref+0x1610:   	addc	%g0, 0x653, %o3
	.word	0xff6e001c	! t0_kref+0x1614:   	prefetch	%i0 + %i4, 31
	.word	0x2c800006	! t0_kref+0x1618:   	bneg,a	_kref+0x1630
	.word	0x97282015	! t0_kref+0x161c:   	sll	%g0, 0x15, %o3
	.word	0x95b2898a	! t0_kref+0x1620:   	bshuffle	%f10, %f10, %f10
	.word	0x96f68000	! t0_kref+0x1624:   	udivcc	%i2, %g0, %o3
	.word	0xd47e2004	! t0_kref+0x1628:   	swap	[%i0 + 4], %o2
	.word	0x9728001a	! t0_kref+0x162c:   	sll	%g0, %i2, %o3
	.word	0x95a0002b	! t0_kref+0x1630:   	fmovs	%f11, %f10
	.word	0xd6c67ff0	! t0_kref+0x1634:   	ldswa	[%i1 - 0x10]%asi, %o3
	.word	0x967e8000	! t0_kref+0x1638:   	sdiv	%i2, %g0, %o3
	.word	0x97a000aa	! t0_kref+0x163c:   	fnegs	%f10, %f11
	.word	0x96aea6a1	! t0_kref+0x1640:   	andncc	%i2, 0x6a1, %o3
	.word	0x95a2cd2b	! t0_kref+0x1644:   	fsmuld	%f11, %f11, %f10
	.word	0xd656001b	! t0_kref+0x1648:   	ldsh	[%i0 + %i3], %o3
	.word	0x973ea00a	! t0_kref+0x164c:   	sra	%i2, 0xa, %o3
	.word	0x3b800008	! t0_kref+0x1650:   	fble,a	_kref+0x1670
	.word	0x97a0052b	! t0_kref+0x1654:   	fsqrts	%f11, %f11
	.word	0xdaf8a010	! t0_kref+0x1658:   	swapa	[%g2 + 0x10]%asi, %o5
	.word	0x2e800005	! t0_kref+0x165c:   	bvs,a	_kref+0x1670
	.word	0x96900000	! t0_kref+0x1660:   	orcc	%g0, %g0, %o3
	.word	0x97b284ca	! t0_kref+0x1664:   	fcmpne32	%f10, %f10, %o3
	.word	0x97b6831a	! t0_kref+0x1668:   	alignaddr	%i2, %i2, %o3
	.word	0x95a2894a	! t0_kref+0x166c:   	fmuld	%f10, %f10, %f10
	.word	0xd59f5040	! t0_kref+0x1670:   	ldda	[%i5]0x82, %f10
	.word	0xf4263fec	! t0_kref+0x1674:   	st	%i2, [%i0 - 0x14]
	.word	0x965ea377	! t0_kref+0x1678:   	smul	%i2, 0x377, %o3
	.word	0x95a2c9ab	! t0_kref+0x167c:   	fdivs	%f11, %f11, %f10
	.word	0x95a0054a	! t0_kref+0x1680:   	fsqrtd	%f10, %f10
	.word	0x965ea238	! t0_kref+0x1684:   	smul	%i2, 0x238, %o3
	.word	0x95b28d40	! t0_kref+0x1688:   	fnot1	%f10, %f10
	.word	0x25480006	! t0_kref+0x168c:   	fblg,a,pt	%fcc0, _kref+0x16a4
	.word	0xc168a040	! t0_kref+0x1690:   	prefetch	%g2 + 0x40, 0
	.word	0x95b2c66b	! t0_kref+0x1694:   	fmul8x16au	%f11, %f11, %f10
	.word	0xd6560000	! t0_kref+0x1698:   	ldsh	[%i0], %o3
	.word	0x29480005	! t0_kref+0x169c:   	fbl,a,pt	%fcc0, _kref+0x16b0
	.word	0x97400000	! t0_kref+0x16a0:   	mov	%y, %o3
	.word	0x17305ed7	! t0_kref+0x16a4:   	sethi	%hi(0xc17b5c00), %o3
	.word	0x96de801a	! t0_kref+0x16a8:   	smulcc	%i2, %i2, %o3
	.word	0xe01e0000	! t0_kref+0x16ac:   	ldd	[%i0], %l0
	.word	0xd6460000	! t0_kref+0x16b0:   	ldsw	[%i0], %o3
	.word	0xd7263fe8	! t0_kref+0x16b4:   	st	%f11, [%i0 - 0x18]
	.word	0x9610001a	! t0_kref+0x16b8:   	mov	%i2, %o3
	.word	0x97b68240	! t0_kref+0x16bc:   	array16	%i2, %g0, %o3
	.word	0x96402089	! t0_kref+0x16c0:   	addc	%g0, 0x89, %o3
	.word	0x97b00200	! t0_kref+0x16c4:   	array8	%g0, %g0, %o3
	.word	0xe1e8a001	! t0_kref+0x16c8:   	prefetcha	%g2 + 1, 16
	.word	0xc0363fe6	! t0_kref+0x16cc:   	clrh	[%i0 - 0x1a]
	.word	0xe41e6008	! t0_kref+0x16d0:   	ldd	[%i1 + 8], %l2
	.word	0xc1286bce	! t0_kref+0x16d4:   	st	%fsr, [%g1 + 0xbce]
	.word	0xf428a02b	! t0_kref+0x16d8:   	stb	%i2, [%g2 + 0x2b]
	.word	0x97b2854a	! t0_kref+0x16dc:   	fcmpeq16	%f10, %f10, %o3
	.word	0x95a2894a	! t0_kref+0x16e0:   	fmuld	%f10, %f10, %f10
	.word	0xf4b0a01e	! t0_kref+0x16e4:   	stha	%i2, [%g2 + 0x1e]%asi
	.word	0x95b28e0a	! t0_kref+0x16e8:   	fand	%f10, %f10, %f10
	.word	0xd656c019	! t0_kref+0x16ec:   	ldsh	[%i3 + %i1], %o3
	.word	0x96080000	! t0_kref+0x16f0:   	and	%g0, %g0, %o3
	.word	0x97a2892b	! t0_kref+0x16f4:   	fmuls	%f10, %f11, %f11
	.word	0xd6564000	! t0_kref+0x16f8:   	ldsh	[%i1], %o3
	.word	0x95b28e0a	! t0_kref+0x16fc:   	fand	%f10, %f10, %f10
	.word	0x95a2894a	! t0_kref+0x1700:   	fmuld	%f10, %f10, %f10
	.word	0x97408000	! t0_kref+0x1704:   	mov	%ccr, %o3
	.word	0x97a0188a	! t0_kref+0x1708:   	fitos	%f10, %f11
	.word	0x9738001a	! t0_kref+0x170c:   	sra	%g0, %i2, %o3
	.word	0x81aa8aab	! t0_kref+0x1710:   	fcmpes	%fcc0, %f10, %f11
	.word	0x81b01021	! t0_kref+0x1714:   	siam	0x1
	.word	0x9720001a	! t0_kref+0x1718:   	mulscc	%g0, %i2, %o3
	.word	0x95b28a4a	! t0_kref+0x171c:   	fpadd32	%f10, %f10, %f10
	.word	0xd6163ffe	! t0_kref+0x1720:   	lduh	[%i0 - 2], %o3
	.word	0x96600000	! t0_kref+0x1724:   	subc	%g0, %g0, %o3
	.word	0x97b00280	! t0_kref+0x1728:   	array32	%g0, %g0, %o3
	.word	0x97b6817a	! t0_kref+0x172c:   	edge32ln	%i2, %i2, %o3
	.word	0xf4366002	! t0_kref+0x1730:   	sth	%i2, [%i1 + 2]
	.word	0x96a6801a	! t0_kref+0x1734:   	subcc	%i2, %i2, %o3
	.word	0x97a2c92b	! t0_kref+0x1738:   	fmuls	%f11, %f11, %f11
	.word	0x95a2894a	! t0_kref+0x173c:   	fmuld	%f10, %f10, %f10
	.word	0x97a0002a	! t0_kref+0x1740:   	fmovs	%f10, %f11
	.word	0x2e800005	! t0_kref+0x1744:   	bvs,a	_kref+0x1758
	.word	0x96be801a	! t0_kref+0x1748:   	xnorcc	%i2, %i2, %o3
	.word	0xebee501a	! t0_kref+0x174c:   	prefetcha	%i1 + %i2, 21
	.word	0xc5e8a00c	! t0_kref+0x1750:   	prefetcha	%g2 + 0xc, 2
	.word	0x95b00c20	! t0_kref+0x1754:   	fzeros	%f10
	.word	0xe43e6000	! t0_kref+0x1758:   	std	%l2, [%i1]
	.word	0xd64e8019	! t0_kref+0x175c:   	ldsb	[%i2 + %i1], %o3
	.word	0x96e6801a	! t0_kref+0x1760:   	subccc	%i2, %i2, %o3
	.word	0x97b00fe0	! t0_kref+0x1764:   	fones	%f11
	.word	0x95a0012b	! t0_kref+0x1768:   	fabss	%f11, %f10
	.word	0x97b2ce6a	! t0_kref+0x176c:   	fxnors	%f11, %f10, %f11
	.word	0x95a0054a	! t0_kref+0x1770:   	fsqrtd	%f10, %f10
	.word	0x96f02c6e	! t0_kref+0x1774:   	udivcc	%g0, 0xc6e, %o3
	.word	0x97b00100	! t0_kref+0x1778:   	edge32	%g0, %g0, %o3
	.word	0x9608001a	! t0_kref+0x177c:   	and	%g0, %i2, %o3
	.word	0xd6df5019	! t0_kref+0x1780:   	ldxa	[%i5 + %i1]0x80, %o3
	.word	0x3f800001	! t0_kref+0x1784:   	fbo,a	_kref+0x1788
	.word	0xe0180019	! t0_kref+0x1788:   	ldd	[%g0 + %i1], %l0
	.word	0x9606bffc	! t0_kref+0x178c:   	add	%i2, -0x4, %o3
	.word	0xd6163fee	! t0_kref+0x1790:   	lduh	[%i0 - 0x12], %o3
	.word	0xd51fbd58	! t0_kref+0x1794:   	ldd	[%fp - 0x2a8], %f10
	.word	0x96102277	! t0_kref+0x1798:   	mov	0x277, %o3
	.word	0x9686801a	! t0_kref+0x179c:   	addcc	%i2, %i2, %o3
	.word	0x971ea3f0	! t0_kref+0x17a0:   	tsubcctv	%i2, 0x3f0, %o3
	.word	0x967e801a	! t0_kref+0x17a4:   	sdiv	%i2, %i2, %o3
	.word	0xe03e6010	! t0_kref+0x17a8:   	std	%l0, [%i1 + 0x10]
	.word	0x9650001a	! t0_kref+0x17ac:   	umul	%g0, %i2, %o3
	.word	0xd656401b	! t0_kref+0x17b0:   	ldsh	[%i1 + %i3], %o3
	.word	0x9620311d	! t0_kref+0x17b4:   	sub	%g0, -0xee3, %o3
	.word	0x32800002	! t0_kref+0x17b8:   	bne,a	_kref+0x17c0
	.word	0x97b000c0	! t0_kref+0x17bc:   	edge16l	%g0, %g0, %o3
	.word	0xe41e4000	! t0_kref+0x17c0:   	ldd	[%i1], %l2
	.word	0x96402aca	! t0_kref+0x17c4:   	addc	%g0, 0xaca, %o3
	.word	0xc0b0a028	! t0_kref+0x17c8:   	stha	%g0, [%g2 + 0x28]%asi
	.word	0xc0f66010	! t0_kref+0x17cc:   	stxa	%g0, [%i1 + 0x10]%asi
	.word	0x95b28a6a	! t0_kref+0x17d0:   	fpadd32s	%f10, %f10, %f10
	.word	0x96e03e9a	! t0_kref+0x17d4:   	subccc	%g0, -0x166, %o3
	.word	0x35800008	! t0_kref+0x17d8:   	fbue,a	_kref+0x17f8
	.word	0x96d6801a	! t0_kref+0x17dc:   	umulcc	%i2, %i2, %o3
	.word	0xd64e0000	! t0_kref+0x17e0:   	ldsb	[%i0], %o3
	.word	0x97b00f2a	! t0_kref+0x17e4:   	fsrc2s	%f10, %f11
	.word	0x95b007aa	! t0_kref+0x17e8:   	fpackfix	%f10, %f10
	.word	0xd656601c	! t0_kref+0x17ec:   	ldsh	[%i1 + 0x1c], %o3
	.word	0x97a01a2b	! t0_kref+0x17f0:   	fstoi	%f11, %f11
	.word	0x9744c000	! t0_kref+0x17f4:   	mov	%gsr, %o3
	.word	0x95a000ab	! t0_kref+0x17f8:   	fnegs	%f11, %f10
	.word	0x9fc00004	! t0_kref+0x17fc:   	call	%g0 + %g4
	.word	0xd60e2006	! t0_kref+0x1800:   	ldub	[%i0 + 6], %o3
	.word	0x81de400f	! t0_kref+0x1804:   	flush	%i1 + %o7
	.word	0xd6100018	! t0_kref+0x1808:   	lduh	[%g0 + %i0], %o3
	.word	0x95a0188b	! t0_kref+0x180c:   	fitos	%f11, %f10
	.word	0x95a0102a	! t0_kref+0x1810:   	fstox	%f10, %f10
	.word	0x95a0188a	! t0_kref+0x1814:   	fitos	%f10, %f10
	.word	0xe43e3ff0	! t0_kref+0x1818:   	std	%l2, [%i0 - 0x10]
	.word	0x37480002	! t0_kref+0x181c:   	fbge,a,pt	%fcc0, _kref+0x1824
	.word	0x95a000ab	! t0_kref+0x1820:   	fnegs	%f11, %f10
	.word	0x96a82681	! t0_kref+0x1824:   	andncc	%g0, 0x681, %o3
	.word	0x95b00fc0	! t0_kref+0x1828:   	fone	%f10
	.word	0x97b2cf6b	! t0_kref+0x182c:   	fornot1s	%f11, %f11, %f11
	.word	0x9736a01d	! t0_kref+0x1830:   	srl	%i2, 0x1d, %o3
	.word	0xd6de3fe8	! t0_kref+0x1834:   	ldxa	[%i0 - 0x18]%asi, %o3
	.word	0x95b00c20	! t0_kref+0x1838:   	fzeros	%f10
	.word	0x97b0015a	! t0_kref+0x183c:   	edge32l	%g0, %i2, %o3
	.word	0x9726a13a	! t0_kref+0x1840:   	mulscc	%i2, 0x13a, %o3
	.word	0x97a01a4a	! t0_kref+0x1844:   	fdtoi	%f10, %f11
	.word	0x97400000	! t0_kref+0x1848:   	mov	%y, %o3
	.word	0xe41e2010	! t0_kref+0x184c:   	ldd	[%i0 + 0x10], %l2
	.word	0x83414000	! t0_kref+0x1850:   	mov	%pc, %g1
	.word	0x96180000	! t0_kref+0x1854:   	xor	%g0, %g0, %o3
	.word	0x95a0054a	! t0_kref+0x1858:   	fsqrtd	%f10, %f10
	.word	0x961e8000	! t0_kref+0x185c:   	xor	%i2, %g0, %o3
	.word	0x95a000aa	! t0_kref+0x1860:   	fnegs	%f10, %f10
	.word	0x96800000	! t0_kref+0x1864:   	addcc	%g0, %g0, %o3
	.word	0x81868000	! t0_kref+0x1868:   	wr	%i2, %g0, %y
	.word	0x968035ab	! t0_kref+0x186c:   	addcc	%g0, -0xa55, %o3
	.word	0x97b0035a	! t0_kref+0x1870:   	alignaddrl	%g0, %i2, %o3
	.word	0x9726801a	! t0_kref+0x1874:   	mulscc	%i2, %i2, %o3
	.word	0x97400000	! t0_kref+0x1878:   	mov	%y, %o3
	.word	0x96300000	! t0_kref+0x187c:   	orn	%g0, %g0, %o3
	.word	0x95a0192b	! t0_kref+0x1880:   	fstod	%f11, %f10
	.word	0x97a01a2a	! t0_kref+0x1884:   	fstoi	%f10, %f11
	.word	0x97a0012a	! t0_kref+0x1888:   	fabss	%f10, %f11
	.word	0x95a0192b	! t0_kref+0x188c:   	fstod	%f11, %f10
	.word	0xf4f65000	! t0_kref+0x1890:   	stxa	%i2, [%i1]0x80
	.word	0x96d6aac8	! t0_kref+0x1894:   	umulcc	%i2, 0xac8, %o3
	.word	0x9720001a	! t0_kref+0x1898:   	mulscc	%g0, %i2, %o3
	.word	0x95b2c62a	! t0_kref+0x189c:   	fmul8x16	%f11, %f10, %f10
	.word	0x27800001	! t0_kref+0x18a0:   	fbul,a	_kref+0x18a4
	.word	0x9686b25a	! t0_kref+0x18a4:   	addcc	%i2, -0xda6, %o3
	.word	0x97183c77	! t0_kref+0x18a8:   	tsubcctv	%g0, -0x389, %o3
	.word	0x9608001a	! t0_kref+0x18ac:   	and	%g0, %i2, %o3
	.word	0x9fc10000	! t0_kref+0x18b0:   	call	%g4
	.word	0x97a0012a	! t0_kref+0x18b4:   	fabss	%f10, %f11
	.word	0x31480006	! t0_kref+0x18b8:   	fba,a,pt	%fcc0, _kref+0x18d0
	.word	0xd690a006	! t0_kref+0x18bc:   	lduha	[%g2 + 6]%asi, %o3
	.word	0xe03e0000	! t0_kref+0x18c0:   	std	%l0, [%i0]
	.word	0xf4f67ff8	! t0_kref+0x18c4:   	stxa	%i2, [%i1 - 8]%asi
	.word	0x97a0002b	! t0_kref+0x18c8:   	fmovs	%f11, %f11
	.word	0x96b8336b	! t0_kref+0x18cc:   	xnorcc	%g0, -0xc95, %o3
	.word	0x97b6817a	! t0_kref+0x18d0:   	edge32ln	%i2, %i2, %o3
	.word	0xd51e2010	! t0_kref+0x18d4:   	ldd	[%i0 + 0x10], %f10
	.word	0xe43e0000	! t0_kref+0x18d8:   	std	%l2, [%i0]
	.word	0x95b2c62a	! t0_kref+0x18dc:   	fmul8x16	%f11, %f10, %f10
	.word	0x97a2c9ab	! t0_kref+0x18e0:   	fdivs	%f11, %f11, %f11
	.word	0xec7e3ffc	! t0_kref+0x18e4:   	swap	[%i0 - 4], %l6
	.word	0x8143c000	! t0_kref+0x18e8:   	stbar
	.word	0x96603501	! t0_kref+0x18ec:   	subc	%g0, -0xaff, %o3
	.word	0x95b28dca	! t0_kref+0x18f0:   	fnand	%f10, %f10, %f10
	.word	0x97b28caa	! t0_kref+0x18f4:   	fandnot2s	%f10, %f10, %f11
	.word	0xd6062000	! t0_kref+0x18f8:   	ld	[%i0], %o3
	.word	0x96503761	! t0_kref+0x18fc:   	umul	%g0, -0x89f, %o3
	.word	0xfb6e7fe0	! t0_kref+0x1900:   	prefetch	%i1 - 0x20, 29
	.word	0x95a0102a	! t0_kref+0x1904:   	fstox	%f10, %f10
	.word	0x97400000	! t0_kref+0x1908:   	mov	%y, %o3
	.word	0x81aaca2b	! t0_kref+0x190c:   	fcmps	%fcc0, %f11, %f11
	.word	0xd65e6000	! t0_kref+0x1910:   	ldx	[%i1], %o3
	.word	0x2d800004	! t0_kref+0x1914:   	fbg,a	_kref+0x1924
	.word	0xb4103ffd	! t0_kref+0x1918:   	mov	0xfffffffd, %i2
	.word	0x9678001a	! t0_kref+0x191c:   	sdiv	%g0, %i2, %o3
	.word	0x962e801a	! t0_kref+0x1920:   	andn	%i2, %i2, %o3
	.word	0x95a2894a	! t0_kref+0x1924:   	fmuld	%f10, %f10, %f10
	.word	0xd7270019	! t0_kref+0x1928:   	st	%f11, [%i4 + %i1]
	.word	0x96c0001a	! t0_kref+0x192c:   	addccc	%g0, %i2, %o3
	.word	0xf436c018	! t0_kref+0x1930:   	sth	%i2, [%i3 + %i0]
	.word	0x97a0012a	! t0_kref+0x1934:   	fabss	%f10, %f11
	.word	0x17010ecd	! t0_kref+0x1938:   	sethi	%hi(0x43b3400), %o3
	.word	0x95a0104a	! t0_kref+0x193c:   	fdtox	%f10, %f10
	.word	0x172474c3	! t0_kref+0x1940:   	sethi	%hi(0x91d30c00), %o3
	.word	0xd646401c	! t0_kref+0x1944:   	ldsw	[%i1 + %i4], %o3
	.word	0x97b284ca	! t0_kref+0x1948:   	fcmpne32	%f10, %f10, %o3
	.word	0x9616a646	! t0_kref+0x194c:   	or	%i2, 0x646, %o3
	.word	0x95a01a2b	! t0_kref+0x1950:   	fstoi	%f11, %f10
	.word	0x963eb41a	! t0_kref+0x1954:   	xnor	%i2, -0xbe6, %o3
	.word	0x97a0188b	! t0_kref+0x1958:   	fitos	%f11, %f11
	.word	0x95a0012b	! t0_kref+0x195c:   	fabss	%f11, %f10
	.word	0x961835ea	! t0_kref+0x1960:   	xor	%g0, -0xa16, %o3
	.word	0x97b284ca	! t0_kref+0x1964:   	fcmpne32	%f10, %f10, %o3
	.word	0x97400000	! t0_kref+0x1968:   	mov	%y, %o3
	.word	0x9740c000	! t0_kref+0x196c:   	mov	%asi, %o3
	.word	0x96a6a832	! t0_kref+0x1970:   	subcc	%i2, 0x832, %o3
	.word	0x97b2850a	! t0_kref+0x1974:   	fcmpgt16	%f10, %f10, %o3
	.word	0x8143c000	! t0_kref+0x1978:   	stbar
	.word	0xd6563ff8	! t0_kref+0x197c:   	ldsh	[%i0 - 8], %o3
	.word	0x96e6801a	! t0_kref+0x1980:   	subccc	%i2, %i2, %o3
	.word	0x96bea6ec	! t0_kref+0x1984:   	xnorcc	%i2, 0x6ec, %o3
	.word	0xd5262000	! t0_kref+0x1988:   	st	%f10, [%i0]
	.word	0x97a0002a	! t0_kref+0x198c:   	fmovs	%f10, %f11
	.word	0xd640a030	! t0_kref+0x1990:   	ldsw	[%g2 + 0x30], %o3
	.word	0xd51fbe40	! t0_kref+0x1994:   	ldd	[%fp - 0x1c0], %f10
	.word	0x97a0012b	! t0_kref+0x1998:   	fabss	%f11, %f11
	.word	0xd64e4000	! t0_kref+0x199c:   	ldsb	[%i1], %o3
	.word	0x95b2cea0	! t0_kref+0x19a0:   	fsrc1s	%f11, %f10
	.word	0x97382011	! t0_kref+0x19a4:   	sra	%g0, 0x11, %o3
	.word	0x9676801a	! t0_kref+0x19a8:   	udiv	%i2, %i2, %o3
	.word	0x33480003	! t0_kref+0x19ac:   	fbe,a,pt	%fcc0, _kref+0x19b8
	.word	0x97b00160	! t0_kref+0x19b0:   	edge32ln	%g0, %g0, %o3
	.word	0x95b28f8a	! t0_kref+0x19b4:   	for	%f10, %f10, %f10
	.word	0x95b00cca	! t0_kref+0x19b8:   	fnot2	%f10, %f10
	.word	0x95a0110a	! t0_kref+0x19bc:   	fxtod	%f10, %f10
	.word	0x96900000	! t0_kref+0x19c0:   	orcc	%g0, %g0, %o3
	.word	0xea6e7fe4	! t0_kref+0x19c4:   	ldstub	[%i1 - 0x1c], %l5
	.word	0x95b28e80	! t0_kref+0x19c8:   	fsrc1	%f10, %f10
	.word	0x97b2cd2a	! t0_kref+0x19cc:   	fandnot1s	%f11, %f10, %f11
	.word	0xec7e7ff4	! t0_kref+0x19d0:   	swap	[%i1 - 0xc], %l6
	.word	0xf436201c	! t0_kref+0x19d4:   	sth	%i2, [%i0 + 0x1c]
	.word	0xd648a035	! t0_kref+0x19d8:   	ldsb	[%g2 + 0x35], %o3
	.word	0x95b00ceb	! t0_kref+0x19dc:   	fnot2s	%f11, %f10
	.word	0x97a000aa	! t0_kref+0x19e0:   	fnegs	%f10, %f11
	.word	0x972e801a	! t0_kref+0x19e4:   	sll	%i2, %i2, %o3
	.word	0xd656201a	! t0_kref+0x19e8:   	ldsh	[%i0 + 0x1a], %o3
	.word	0xe4180019	! t0_kref+0x19ec:   	ldd	[%g0 + %i1], %l2
	call	SYM(t0_subr3)
	.word	0xc768a083	! t0_kref+0x19f4:   	prefetch	%g2 + 0x83, 3
	.word	0xd60e2013	! t0_kref+0x19f8:   	ldub	[%i0 + 0x13], %o3
	.word	0x95b28d0a	! t0_kref+0x19fc:   	fandnot1	%f10, %f10, %f10
	.word	0xef68a080	! t0_kref+0x1a00:   	prefetch	%g2 + 0x80, 23
	.word	0x95a0014a	! t0_kref+0x1a04:   	fabsd	%f10, %f10
	.word	0xd59f5059	! t0_kref+0x1a08:   	ldda	[%i5 + %i1]0x82, %f10
	.word	0x39800008	! t0_kref+0x1a0c:   	fbuge,a	_kref+0x1a2c
	.word	0x95a2c9ab	! t0_kref+0x1a10:   	fdivs	%f11, %f11, %f10
	.word	0xd616c018	! t0_kref+0x1a14:   	lduh	[%i3 + %i0], %o3
	.word	0xd6567ff8	! t0_kref+0x1a18:   	ldsh	[%i1 - 8], %o3
	.word	0x96900000	! t0_kref+0x1a1c:   	orcc	%g0, %g0, %o3
	.word	0x97a0012b	! t0_kref+0x1a20:   	fabss	%f11, %f11
	.word	0x961ead7d	! t0_kref+0x1a24:   	xor	%i2, 0xd7d, %o3
	.word	0x97a018ca	! t0_kref+0x1a28:   	fdtos	%f10, %f11
	.word	0x95a0012b	! t0_kref+0x1a2c:   	fabss	%f11, %f10
	.word	0x95ab804a	! t0_kref+0x1a30:   	fmovdule	%fcc0, %f10, %f10
	.word	0x95a0012a	! t0_kref+0x1a34:   	fabss	%f10, %f10
	.word	0x95a0192a	! t0_kref+0x1a38:   	fstod	%f10, %f10
	.word	0x97a2882b	! t0_kref+0x1a3c:   	fadds	%f10, %f11, %f11
	.word	0xd19e1a5b	! t0_kref+0x1a40:   	ldda	[%i0 + %i3]0xd2, %f8
	.word	0x97200000	! t0_kref+0x1a44:   	mulscc	%g0, %g0, %o3
	.word	0x97b2cf6b	! t0_kref+0x1a48:   	fornot1s	%f11, %f11, %f11
	.word	0x97b00c20	! t0_kref+0x1a4c:   	fzeros	%f11
	.word	0x9fc10000	! t0_kref+0x1a50:   	call	%g4
	.word	0xe968a04b	! t0_kref+0x1a54:   	prefetch	%g2 + 0x4b, 20
	.word	0x95a0012a	! t0_kref+0x1a58:   	fabss	%f10, %f10
	.word	0x95a2894a	! t0_kref+0x1a5c:   	fmuld	%f10, %f10, %f10
	.word	0xd51e2018	! t0_kref+0x1a60:   	ldd	[%i0 + 0x18], %f10
	.word	0x95a0192a	! t0_kref+0x1a64:   	fstod	%f10, %f10
	.word	0xc06e2014	! t0_kref+0x1a68:   	ldstub	[%i0 + 0x14], %g0
	.word	0x97302017	! t0_kref+0x1a6c:   	srl	%g0, 0x17, %o3
	.word	0xd6801018	! t0_kref+0x1a70:   	lda	[%g0 + %i0]0x80, %o3
	.word	0x95b2cd2b	! t0_kref+0x1a74:   	fandnot1s	%f11, %f11, %f10
	.word	0xd64e3fec	! t0_kref+0x1a78:   	ldsb	[%i0 - 0x14], %o3
	.word	0xd6881019	! t0_kref+0x1a7c:   	lduba	[%g0 + %i1]0x80, %o3
	.word	0x97b0035a	! t0_kref+0x1a80:   	alignaddrl	%g0, %i2, %o3
	.word	0x9676a51b	! t0_kref+0x1a84:   	udiv	%i2, 0x51b, %o3
	.word	0x96500000	! t0_kref+0x1a88:   	umul	%g0, %g0, %o3
	.word	0xea7e7fe4	! t0_kref+0x1a8c:   	swap	[%i1 - 0x1c], %l5
	.word	0xd6866014	! t0_kref+0x1a90:   	lda	[%i1 + 0x14]%asi, %o3
	.word	0x2b800004	! t0_kref+0x1a94:   	fbug,a	_kref+0x1aa4
	.word	0x96503d71	! t0_kref+0x1a98:   	umul	%g0, -0x28f, %o3
	.word	0x97a2c92b	! t0_kref+0x1a9c:   	fmuls	%f11, %f11, %f11
	.word	0x9610001a	! t0_kref+0x1aa0:   	mov	%i2, %o3
	.word	0x95a2c9aa	! t0_kref+0x1aa4:   	fdivs	%f11, %f10, %f10
	.word	0x95a2894a	! t0_kref+0x1aa8:   	fmuld	%f10, %f10, %f10
	.word	0x95a2cd2b	! t0_kref+0x1aac:   	fsmuld	%f11, %f11, %f10
	.word	0x8143c000	! t0_kref+0x1ab0:   	stbar
	.word	0x97a000aa	! t0_kref+0x1ab4:   	fnegs	%f10, %f11
	.word	0x9640001a	! t0_kref+0x1ab8:   	addc	%g0, %i2, %o3
	.word	0x83414000	! t0_kref+0x1abc:   	mov	%pc, %g1
	.word	0x95a2894a	! t0_kref+0x1ac0:   	fmuld	%f10, %f10, %f10
	.word	0x81aa8aca	! t0_kref+0x1ac4:   	fcmped	%fcc0, %f10, %f10
	.word	0xf4b65000	! t0_kref+0x1ac8:   	stha	%i2, [%i1]0x80
	.word	0xf436001b	! t0_kref+0x1acc:   	sth	%i2, [%i0 + %i3]
	.word	0xd616c018	! t0_kref+0x1ad0:   	lduh	[%i3 + %i0], %o3
	.word	0xd6967fe8	! t0_kref+0x1ad4:   	lduha	[%i1 - 0x18]%asi, %o3
	.word	0xc036401b	! t0_kref+0x1ad8:   	clrh	[%i1 + %i3]
	.word	0x29800006	! t0_kref+0x1adc:   	fbl,a	_kref+0x1af4
	.word	0x95b28e4a	! t0_kref+0x1ae0:   	fxnor	%f10, %f10, %f10
	.word	0x96700000	! t0_kref+0x1ae4:   	udiv	%g0, %g0, %o3
	.word	0xd53e3fe8	! t0_kref+0x1ae8:   	std	%f10, [%i0 - 0x18]
	.word	0x81aacaab	! t0_kref+0x1aec:   	fcmpes	%fcc0, %f11, %f11
	.word	0x95b00fc0	! t0_kref+0x1af0:   	fone	%f10
	.word	0x96f68000	! t0_kref+0x1af4:   	udivcc	%i2, %g0, %o3
	.word	0x97400000	! t0_kref+0x1af8:   	mov	%y, %o3
	.word	0xe41e7ff0	! t0_kref+0x1afc:   	ldd	[%i1 - 0x10], %l2
	.word	0x83c06058	! t0_kref+0x1b00:   	jmpl	%g1 + 0x58, %g1
	.word	0xd6ce1000	! t0_kref+0x1b04:   	ldsba	[%i0]0x80, %o3
	.word	0xd1be5a1c	! t0_kref+0x1b08:   	stda	%f8, [%i1 + %i4]0xd0
	.word	0x95b28d40	! t0_kref+0x1b0c:   	fnot1	%f10, %f10
	.word	0x97a01a4a	! t0_kref+0x1b10:   	fdtoi	%f10, %f11
	.word	0xd6c8105a	! t0_kref+0x1b14:   	ldsba	[%g0 + %i2]0x82, %o3
	.word	0x95a2884a	! t0_kref+0x1b18:   	faddd	%f10, %f10, %f10
	.word	0xd5bf5019	! t0_kref+0x1b1c:   	stda	%f10, [%i5 + %i1]0x80
	.word	0x9730001a	! t0_kref+0x1b20:   	srl	%g0, %i2, %o3
	.word	0x9726801a	! t0_kref+0x1b24:   	mulscc	%i2, %i2, %o3
	.word	0x81aacaab	! t0_kref+0x1b28:   	fcmpes	%fcc0, %f11, %f11
	.word	0x83414000	! t0_kref+0x1b2c:   	mov	%pc, %g1
	.word	0x23800001	! t0_kref+0x1b30:   	fbne,a	_kref+0x1b34
	.word	0x97400000	! t0_kref+0x1b34:   	mov	%y, %o3
	.word	0x95a2cd2b	! t0_kref+0x1b38:   	fsmuld	%f11, %f11, %f10
	.word	0x97b00240	! t0_kref+0x1b3c:   	array16	%g0, %g0, %o3
	.word	0x9630001a	! t0_kref+0x1b40:   	orn	%g0, %i2, %o3
	.word	0x965831e8	! t0_kref+0x1b44:   	smul	%g0, -0xe18, %o3
	.word	0x95a2884a	! t0_kref+0x1b48:   	faddd	%f10, %f10, %f10
	.word	0x96f03611	! t0_kref+0x1b4c:   	udivcc	%g0, -0x9ef, %o3
	.word	0x95a2884a	! t0_kref+0x1b50:   	faddd	%f10, %f10, %f10
	.word	0x97b0013a	! t0_kref+0x1b54:   	edge32n	%g0, %i2, %o3
	.word	0x97400000	! t0_kref+0x1b58:   	mov	%y, %o3
	.word	0x95a2cd2a	! t0_kref+0x1b5c:   	fsmuld	%f11, %f10, %f10
	.word	0x95b28a4a	! t0_kref+0x1b60:   	fpadd32	%f10, %f10, %f10
	.word	0x972e8000	! t0_kref+0x1b64:   	sll	%i2, %g0, %o3
	.word	0x97a2c9aa	! t0_kref+0x1b68:   	fdivs	%f11, %f10, %f11
	.word	0x2b480004	! t0_kref+0x1b6c:   	fbug,a,pt	%fcc0, _kref+0x1b7c
	.word	0x96e02f9d	! t0_kref+0x1b70:   	subccc	%g0, 0xf9d, %o3
	.word	0x95a0014a	! t0_kref+0x1b74:   	fabsd	%f10, %f10
	.word	0x972ea01a	! t0_kref+0x1b78:   	sll	%i2, 0x1a, %o3
	.word	0x95a2894a	! t0_kref+0x1b7c:   	fmuld	%f10, %f10, %f10
	.word	0x95a0192a	! t0_kref+0x1b80:   	fstod	%f10, %f10
	.word	0x97a0052b	! t0_kref+0x1b84:   	fsqrts	%f11, %f11
	.word	0x96be8000	! t0_kref+0x1b88:   	xnorcc	%i2, %g0, %o3
	.word	0xd64e8019	! t0_kref+0x1b8c:   	ldsb	[%i2 + %i1], %o3
	.word	0x9656801a	! t0_kref+0x1b90:   	umul	%i2, %i2, %o3
	.word	0x96b8001a	! t0_kref+0x1b94:   	xnorcc	%g0, %i2, %o3
	.word	0xe01e2008	! t0_kref+0x1b98:   	ldd	[%i0 + 8], %l0
	.word	0x95a0054a	! t0_kref+0x1b9c:   	fsqrtd	%f10, %f10
	.word	0x26480008	! t0_kref+0x1ba0:   	bl,a,pt	%icc, _kref+0x1bc0
	.word	0x97b0035a	! t0_kref+0x1ba4:   	alignaddrl	%g0, %i2, %o3
	.word	0x9686bf46	! t0_kref+0x1ba8:   	addcc	%i2, -0xba, %o3
	.word	0xd6066004	! t0_kref+0x1bac:   	ld	[%i1 + 4], %o3
	.word	0xd6063ffc	! t0_kref+0x1bb0:   	ld	[%i0 - 4], %o3
	.word	0x9696bf01	! t0_kref+0x1bb4:   	orcc	%i2, -0xff, %o3
	.word	0x97b6831a	! t0_kref+0x1bb8:   	alignaddr	%i2, %i2, %o3
	.word	0xc0b0a034	! t0_kref+0x1bbc:   	stha	%g0, [%g2 + 0x34]%asi
	.word	0x95a2cd2b	! t0_kref+0x1bc0:   	fsmuld	%f11, %f11, %f10
	.word	0x95a2884a	! t0_kref+0x1bc4:   	faddd	%f10, %f10, %f10
	.word	0x96083d9c	! t0_kref+0x1bc8:   	and	%g0, -0x264, %o3
	.word	0x95b28d0a	! t0_kref+0x1bcc:   	fandnot1	%f10, %f10, %f10
	.word	0x97b680ba	! t0_kref+0x1bd0:   	edge16n	%i2, %i2, %o3
	.word	0x96168000	! t0_kref+0x1bd4:   	or	%i2, %g0, %o3
	.word	0x95b00f0a	! t0_kref+0x1bd8:   	fsrc2	%f10, %f10
	.word	0x81580000	! t0_kref+0x1bdc:   	flushw
	.word	0xd51fbf30	! t0_kref+0x1be0:   	ldd	[%fp - 0xd0], %f10
	.word	0xd1be1800	! t0_kref+0x1be4:   	stda	%f8, [%i0]0xc0
	.word	0x96900000	! t0_kref+0x1be8:   	orcc	%g0, %g0, %o3
	.word	0x95b286ea	! t0_kref+0x1bec:   	fmul8ulx16	%f10, %f10, %f10
	.word	0x9658001a	! t0_kref+0x1bf0:   	smul	%g0, %i2, %o3
	.word	0xd60e2007	! t0_kref+0x1bf4:   	ldub	[%i0 + 7], %o3
	.word	0x97b2854a	! t0_kref+0x1bf8:   	fcmpeq16	%f10, %f10, %o3
	.word	0x86102001	! t0_kref+0x1bfc:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x1c00:   	bne,a	_kref+0x1c00
	.word	0x86a0e001	! t0_kref+0x1c04:   	subcc	%g3, 1, %g3
	.word	0x96aeb647	! t0_kref+0x1c08:   	andncc	%i2, -0x9b9, %o3
	.word	0xd656c019	! t0_kref+0x1c0c:   	ldsh	[%i3 + %i1], %o3
	.word	0x95a01a4a	! t0_kref+0x1c10:   	fdtoi	%f10, %f10
	.word	0x95a289ab	! t0_kref+0x1c14:   	fdivs	%f10, %f11, %f10
	.word	0xd51fbf40	! t0_kref+0x1c18:   	ldd	[%fp - 0xc0], %f10
	.word	0x97400000	! t0_kref+0x1c1c:   	mov	%y, %o3
	.word	0x9762401a	! t0_kref+0x1c20:   	move	%fcc0, %i2, %o3
	.word	0x95a2cd2b	! t0_kref+0x1c24:   	fsmuld	%f11, %f11, %f10
	.word	0xd2fe3fe8	! t0_kref+0x1c28:   	swapa	[%i0 - 0x18]%asi, %o1
	.word	0x95b28e4a	! t0_kref+0x1c2c:   	fxnor	%f10, %f10, %f10
	.word	0x95a0188b	! t0_kref+0x1c30:   	fitos	%f11, %f10
	.word	0x9696801a	! t0_kref+0x1c34:   	orcc	%i2, %i2, %o3
	.word	0xd6871018	! t0_kref+0x1c38:   	lda	[%i4 + %i0]0x80, %o3
	.word	0xd5a67ff0	! t0_kref+0x1c3c:   	sta	%f10, [%i1 - 0x10]%asi
	.word	0x97b00c20	! t0_kref+0x1c40:   	fzeros	%f11
	.word	0xe0180019	! t0_kref+0x1c44:   	ldd	[%g0 + %i1], %l0
	.word	0x8610201a	! t0_kref+0x1c48:   	mov	0x1a, %g3
	.word	0x86a0e001	! t0_kref+0x1c4c:   	subcc	%g3, 1, %g3
	.word	0x22800019	! t0_kref+0x1c50:   	be,a	_kref+0x1cb4
	.word	0x95a01a2b	! t0_kref+0x1c54:   	fstoi	%f11, %f10
	.word	0x95a0014a	! t0_kref+0x1c58:   	fabsd	%f10, %f10
	.word	0x96768000	! t0_kref+0x1c5c:   	udiv	%i2, %g0, %o3
	.word	0x95a289aa	! t0_kref+0x1c60:   	fdivs	%f10, %f10, %f10
	.word	0x2ebffffa	! t0_kref+0x1c64:   	bvs,a	_kref+0x1c4c
	.word	0xd60e600e	! t0_kref+0x1c68:   	ldub	[%i1 + 0xe], %o3
	.word	0xe09e7ff0	! t0_kref+0x1c6c:   	ldda	[%i1 - 0x10]%asi, %l0
	.word	0x81dcc00c	! t0_kref+0x1c70:   	flush	%l3 + %o4
	.word	0xd1be589a	! t0_kref+0x1c74:   	stda	%f8, [%i1 + %i2]0xc4
	.word	0x9616801a	! t0_kref+0x1c78:   	or	%i2, %i2, %o3
	.word	0x95a0188a	! t0_kref+0x1c7c:   	fitos	%f10, %f10
	.word	0x95a288ca	! t0_kref+0x1c80:   	fsubd	%f10, %f10, %f10
	.word	0xc807bfe8	! t0_kref+0x1c84:   	ld	[%fp - 0x18], %g4
	.word	0x97a2c82a	! t0_kref+0x1c88:   	fadds	%f11, %f10, %f11
	.word	0xd51e7fe0	! t0_kref+0x1c8c:   	ldd	[%i1 - 0x20], %f10
	.word	0x97a000ab	! t0_kref+0x1c90:   	fnegs	%f11, %f11
	.word	0x96300000	! t0_kref+0x1c94:   	orn	%g0, %g0, %o3
	.word	0xe41e2010	! t0_kref+0x1c98:   	ldd	[%i0 + 0x10], %l2
	.word	0x2fbfffec	! t0_kref+0x1c9c:   	fbu,a	_kref+0x1c4c
	.word	0x95b2890a	! t0_kref+0x1ca0:   	faligndata	%f10, %f10, %f10
	.word	0x81aa8a2b	! t0_kref+0x1ca4:   	fcmps	%fcc0, %f10, %f11
	.word	0x97b0031a	! t0_kref+0x1ca8:   	alignaddr	%g0, %i2, %o3
	.word	0x95a2884a	! t0_kref+0x1cac:   	faddd	%f10, %f10, %f10
	.word	0x95b28d2b	! t0_kref+0x1cb0:   	fandnot1s	%f10, %f11, %f10
	.word	0x96f020b3	! t0_kref+0x1cb4:   	udivcc	%g0, 0xb3, %o3
	.word	0xd51e001d	! t0_kref+0x1cb8:   	ldd	[%i0 + %i5], %f10
	.word	0x962eaa48	! t0_kref+0x1cbc:   	andn	%i2, 0xa48, %o3
	.word	0x96fe8000	! t0_kref+0x1cc0:   	sdivcc	%i2, %g0, %o3
	.word	0x97a0052a	! t0_kref+0x1cc4:   	fsqrts	%f10, %f11
	.word	0x95b28a4a	! t0_kref+0x1cc8:   	fpadd32	%f10, %f10, %f10
	.word	0x97400000	! t0_kref+0x1ccc:   	mov	%y, %o3
	.word	0x95a288ca	! t0_kref+0x1cd0:   	fsubd	%f10, %f10, %f10
	.word	0xd6467fe4	! t0_kref+0x1cd4:   	ldsw	[%i1 - 0x1c], %o3
	.word	0xd66e8019	! t0_kref+0x1cd8:   	ldstub	[%i2 + %i1], %o3
	.word	0xd656200c	! t0_kref+0x1cdc:   	ldsh	[%i0 + 0xc], %o3
	.word	0x95a0192b	! t0_kref+0x1ce0:   	fstod	%f11, %f10
	.word	0x960ea9c3	! t0_kref+0x1ce4:   	and	%i2, 0x9c3, %o3
	.word	0x21800005	! t0_kref+0x1ce8:   	fbn,a	_kref+0x1cfc
	.word	0x97a0188a	! t0_kref+0x1cec:   	fitos	%f10, %f11
	.word	0x97a2c9aa	! t0_kref+0x1cf0:   	fdivs	%f11, %f10, %f11
	.word	0x95b00cca	! t0_kref+0x1cf4:   	fnot2	%f10, %f10
	.word	0xd656001b	! t0_kref+0x1cf8:   	ldsh	[%i0 + %i3], %o3
	.word	0x3e480008	! t0_kref+0x1cfc:   	bvc,a,pt	%icc, _kref+0x1d1c
	.word	0x8143c000	! t0_kref+0x1d00:   	stbar
	.word	0x97a000aa	! t0_kref+0x1d04:   	fnegs	%f10, %f11
	.word	0xd6070019	! t0_kref+0x1d08:   	ld	[%i4 + %i1], %o3
	.word	0x9656801a	! t0_kref+0x1d0c:   	umul	%i2, %i2, %o3
	.word	0xd6067ff8	! t0_kref+0x1d10:   	ld	[%i1 - 8], %o3
	.word	0x97a018ca	! t0_kref+0x1d14:   	fdtos	%f10, %f11
	.word	0x96568000	! t0_kref+0x1d18:   	umul	%i2, %g0, %o3
	.word	0xc0ae5000	! t0_kref+0x1d1c:   	stba	%g0, [%i1]0x80
	.word	0xd5a62010	! t0_kref+0x1d20:   	sta	%f10, [%i0 + 0x10]%asi
	.word	0xd65f4018	! t0_kref+0x1d24:   	ldx	[%i5 + %i0], %o3
	.word	0x81aa8aaa	! t0_kref+0x1d28:   	fcmpes	%fcc0, %f10, %f10
	.word	0x8143c000	! t0_kref+0x1d2c:   	stbar
	.word	0x95a2894a	! t0_kref+0x1d30:   	fmuld	%f10, %f10, %f10
	.word	0x95b00f0a	! t0_kref+0x1d34:   	fsrc2	%f10, %f10
	.word	0xd51e401d	! t0_kref+0x1d38:   	ldd	[%i1 + %i5], %f10
	.word	0x27480005	! t0_kref+0x1d3c:   	fbul,a,pt	%fcc0, _kref+0x1d50
	.word	0x95a28d2b	! t0_kref+0x1d40:   	fsmuld	%f10, %f11, %f10
	.word	0x95b28e0a	! t0_kref+0x1d44:   	fand	%f10, %f10, %f10
	.word	0x96503eb3	! t0_kref+0x1d48:   	umul	%g0, -0x14d, %o3
	.word	0xd46e8018	! t0_kref+0x1d4c:   	ldstub	[%i2 + %i0], %o2
	.word	0x95a0192b	! t0_kref+0x1d50:   	fstod	%f11, %f10
	.word	0x95b2898a	! t0_kref+0x1d54:   	bshuffle	%f10, %f10, %f10
	.word	0x95b2cdab	! t0_kref+0x1d58:   	fxors	%f11, %f11, %f10
	.word	0x9fc10000	! t0_kref+0x1d5c:   	call	%g4
	.word	0x96f6801a	! t0_kref+0x1d60:   	udivcc	%i2, %i2, %o3
	.word	0x96e6b082	! t0_kref+0x1d64:   	subccc	%i2, -0xf7e, %o3
	.word	0x96180000	! t0_kref+0x1d68:   	xor	%g0, %g0, %o3
	.word	0x95a0192a	! t0_kref+0x1d6c:   	fstod	%f10, %f10
	.word	0x96d6a1d1	! t0_kref+0x1d70:   	umulcc	%i2, 0x1d1, %o3
	.word	0x81aacaab	! t0_kref+0x1d74:   	fcmpes	%fcc0, %f11, %f11
	.word	0x96f80000	! t0_kref+0x1d78:   	sdivcc	%g0, %g0, %o3
	.word	0xc807bff0	! t0_kref+0x1d7c:   	ld	[%fp - 0x10], %g4
	.word	0x96a03501	! t0_kref+0x1d80:   	subcc	%g0, -0xaff, %o3
	.word	0xe0981018	! t0_kref+0x1d84:   	ldda	[%g0 + %i0]0x80, %l0
	.word	0x96de8000	! t0_kref+0x1d88:   	smulcc	%i2, %g0, %o3
	.word	0x965833e2	! t0_kref+0x1d8c:   	smul	%g0, -0xc1e, %o3
	.word	0x97a000aa	! t0_kref+0x1d90:   	fnegs	%f10, %f11
	.word	0x97a0052a	! t0_kref+0x1d94:   	fsqrts	%f10, %f11
	.word	0x95b28a8a	! t0_kref+0x1d98:   	fpsub16	%f10, %f10, %f10
	.word	0xd65e6008	! t0_kref+0x1d9c:   	ldx	[%i1 + 8], %o3
	.word	0x963e801a	! t0_kref+0x1da0:   	xnor	%i2, %i2, %o3
	.word	0x96b8001a	! t0_kref+0x1da4:   	xnorcc	%g0, %i2, %o3
	.word	0x95b28d40	! t0_kref+0x1da8:   	fnot1	%f10, %f10
	.word	0x962e8000	! t0_kref+0x1dac:   	andn	%i2, %g0, %o3
	.word	0x9728001a	! t0_kref+0x1db0:   	sll	%g0, %i2, %o3
	.word	0x9696801a	! t0_kref+0x1db4:   	orcc	%i2, %i2, %o3
	.word	0x81d8401d	! t0_kref+0x1db8:   	flush	%g1 + %i5
	.word	0x97b2848a	! t0_kref+0x1dbc:   	fcmple32	%f10, %f10, %o3
	.word	0x17022ad8	! t0_kref+0x1dc0:   	sethi	%hi(0x8ab6000), %o3
	.word	0x95b28d40	! t0_kref+0x1dc4:   	fnot1	%f10, %f10
	.word	0x9608394f	! t0_kref+0x1dc8:   	and	%g0, -0x6b1, %o3
	.word	0x81580000	! t0_kref+0x1dcc:   	flushw
	.word	0x95a0054a	! t0_kref+0x1dd0:   	fsqrtd	%f10, %f10
	.word	0x95b2866b	! t0_kref+0x1dd4:   	fmul8x16au	%f10, %f11, %f10
	.word	0x95b28e80	! t0_kref+0x1dd8:   	fsrc1	%f10, %f10
	.word	0xd59e3fe0	! t0_kref+0x1ddc:   	ldda	[%i0 - 0x20]%asi, %f10
	.word	0x81580000	! t0_kref+0x1de0:   	flushw
	.word	0x95a2894a	! t0_kref+0x1de4:   	fmuld	%f10, %f10, %f10
	.word	0x8d868000	! t0_kref+0x1de8:   	wr	%i2, %g0, %fprs
	.word	0x9740c000	! t0_kref+0x1dec:   	mov	%asi, %o3
	.word	0xd616c019	! t0_kref+0x1df0:   	lduh	[%i3 + %i1], %o3
	.word	0xc0762018	! t0_kref+0x1df4:   	stx	%g0, [%i0 + 0x18]
	.word	0x31800003	! t0_kref+0x1df8:   	fba,a	_kref+0x1e04
	.word	0x97a0012a	! t0_kref+0x1dfc:   	fabss	%f10, %f11
	.word	0x97b2ccab	! t0_kref+0x1e00:   	fandnot2s	%f11, %f11, %f11
	.word	0x961820ba	! t0_kref+0x1e04:   	xor	%g0, 0xba, %o3
	.word	0x9fc10000	! t0_kref+0x1e08:   	call	%g4
	.word	0x81dcb179	! t0_kref+0x1e0c:   	flush	%l2 - 0xe87
	.word	0x95a2cd2b	! t0_kref+0x1e10:   	fsmuld	%f11, %f11, %f10
	.word	0xe4981018	! t0_kref+0x1e14:   	ldda	[%g0 + %i0]0x80, %l2
	.word	0x95a2894a	! t0_kref+0x1e18:   	fmuld	%f10, %f10, %f10
	.word	0x97b2ce2b	! t0_kref+0x1e1c:   	fands	%f11, %f11, %f11
	.word	0x97b2854a	! t0_kref+0x1e20:   	fcmpeq16	%f10, %f10, %o3
	.word	0xb610201e	! t0_kref+0x1e24:   	mov	0x1e, %i3
	.word	0x95b28caa	! t0_kref+0x1e28:   	fandnot2s	%f10, %f10, %f10
	.word	0x97a2c9ab	! t0_kref+0x1e2c:   	fdivs	%f11, %f11, %f11
	.word	0x81aaca2a	! t0_kref+0x1e30:   	fcmps	%fcc0, %f11, %f10
	.word	0xd60e7ff4	! t0_kref+0x1e34:   	ldub	[%i1 - 0xc], %o3
	.word	0x97b2840a	! t0_kref+0x1e38:   	fcmple16	%f10, %f10, %o3
	.word	0xd7863fe8	! t0_kref+0x1e3c:   	lda	[%i0 - 0x18]%asi, %f11
	.word	0x95a28d2a	! t0_kref+0x1e40:   	fsmuld	%f10, %f10, %f10
	.word	0x81800000	! t0_kref+0x1e44:   	mov	%g0, %y
	.word	0x9656bc4b	! t0_kref+0x1e48:   	umul	%i2, -0x3b5, %o3
	.word	0x96d6bfde	! t0_kref+0x1e4c:   	umulcc	%i2, -0x22, %o3
	.word	0xd6563fec	! t0_kref+0x1e50:   	ldsh	[%i0 - 0x14], %o3
	.word	0x9730201e	! t0_kref+0x1e54:   	srl	%g0, 0x1e, %o3
	.word	0x95b28d0a	! t0_kref+0x1e58:   	fandnot1	%f10, %f10, %f10
	.word	0x95a01a2b	! t0_kref+0x1e5c:   	fstoi	%f11, %f10
	.word	0x95a01a4a	! t0_kref+0x1e60:   	fdtoi	%f10, %f10
	.word	0x95b28d2b	! t0_kref+0x1e64:   	fandnot1s	%f10, %f11, %f10
	.word	0x21480007	! t0_kref+0x1e68:   	fbn,a,pt	%fcc0, _kref+0x1e84
	.word	0x97300000	! t0_kref+0x1e6c:   	srl	%g0, %g0, %o3
	.word	0xa786ad90	! t0_kref+0x1e70:   	wr	%i2, 0xd90, %gsr
	.word	0x9600001a	! t0_kref+0x1e74:   	add	%g0, %i2, %o3
	.word	0x95a28d2b	! t0_kref+0x1e78:   	fsmuld	%f10, %f11, %f10
	.word	0x95a2c9ab	! t0_kref+0x1e7c:   	fdivs	%f11, %f11, %f10
	.word	0x9676b21f	! t0_kref+0x1e80:   	udiv	%i2, -0xde1, %o3
	.word	0x95a0012a	! t0_kref+0x1e84:   	fabss	%f10, %f10
	.word	0x97380000	! t0_kref+0x1e88:   	sra	%g0, %g0, %o3
	.word	0x972e801a	! t0_kref+0x1e8c:   	sll	%i2, %i2, %o3
	.word	0xebe6501a	! t0_kref+0x1e90:   	casa	[%i1]0x80, %i2, %l5
	.word	0x97a000aa	! t0_kref+0x1e94:   	fnegs	%f10, %f11
	.word	0x96182cf3	! t0_kref+0x1e98:   	xor	%g0, 0xcf3, %o3
	.word	0x8143c000	! t0_kref+0x1e9c:   	stbar
	.word	0x95b00cca	! t0_kref+0x1ea0:   	fnot2	%f10, %f10
	.word	0x97b00f2a	! t0_kref+0x1ea4:   	fsrc2s	%f10, %f11
	.word	0x97400000	! t0_kref+0x1ea8:   	mov	%y, %o3
	.word	0x9fc00004	! t0_kref+0x1eac:   	call	%g0 + %g4
	.word	0x96083ebb	! t0_kref+0x1eb0:   	and	%g0, -0x145, %o3
	.word	0x81aa8aab	! t0_kref+0x1eb4:   	fcmpes	%fcc0, %f10, %f11
	.word	0x95a2894a	! t0_kref+0x1eb8:   	fmuld	%f10, %f10, %f10
	.word	0x96b82263	! t0_kref+0x1ebc:   	xnorcc	%g0, 0x263, %o3
	.word	0x9fc00004	! t0_kref+0x1ec0:   	call	%g0 + %g4
	.word	0x97b2840a	! t0_kref+0x1ec4:   	fcmple16	%f10, %f10, %o3
	.word	0x96882ebc	! t0_kref+0x1ec8:   	andcc	%g0, 0xebc, %o3
	.word	0xe41e0000	! t0_kref+0x1ecc:   	ldd	[%i0], %l2
	.word	0x961833c8	! t0_kref+0x1ed0:   	xor	%g0, -0xc38, %o3
	.word	0x81aacaaa	! t0_kref+0x1ed4:   	fcmpes	%fcc0, %f11, %f10
	.word	0xd51fbec0	! t0_kref+0x1ed8:   	ldd	[%fp - 0x140], %f10
	.word	0xe01e3fe0	! t0_kref+0x1edc:   	ldd	[%i0 - 0x20], %l0
	.word	0x960e801a	! t0_kref+0x1ee0:   	and	%i2, %i2, %o3
	.word	0xe43e2018	! t0_kref+0x1ee4:   	std	%l2, [%i0 + 0x18]
	.word	0xdbe61000	! t0_kref+0x1ee8:   	casa	[%i0]0x80, %g0, %o5
	.word	0x973ea019	! t0_kref+0x1eec:   	sra	%i2, 0x19, %o3
	.word	0xe43e3ff0	! t0_kref+0x1ef0:   	std	%l2, [%i0 - 0x10]
	.word	0xd656001b	! t0_kref+0x1ef4:   	ldsh	[%i0 + %i3], %o3
	.word	0x81da76a6	! t0_kref+0x1ef8:   	flush	%o1 - 0x95a
	.word	0x965eac38	! t0_kref+0x1efc:   	smul	%i2, 0xc38, %o3
	.word	0x9616a305	! t0_kref+0x1f00:   	or	%i2, 0x305, %o3
	.word	0x95a2894a	! t0_kref+0x1f04:   	fmuld	%f10, %f10, %f10
	.word	0x95a000ca	! t0_kref+0x1f08:   	fnegd	%f10, %f10
	.word	0xc0367ffc	! t0_kref+0x1f0c:   	clrh	[%i1 - 4]
	.word	0x968e8000	! t0_kref+0x1f10:   	andcc	%i2, %g0, %o3
	.word	0x95b28caa	! t0_kref+0x1f14:   	fandnot2s	%f10, %f10, %f10
	.word	0x96182bb9	! t0_kref+0x1f18:   	xor	%g0, 0xbb9, %o3
	.word	0x97a289ab	! t0_kref+0x1f1c:   	fdivs	%f10, %f11, %f11
	.word	0x95a2c9aa	! t0_kref+0x1f20:   	fdivs	%f11, %f10, %f10
	.word	0x97182d47	! t0_kref+0x1f24:   	tsubcctv	%g0, 0xd47, %o3
	.word	0xd616c019	! t0_kref+0x1f28:   	lduh	[%i3 + %i1], %o3
	.word	0x97168000	! t0_kref+0x1f2c:   	taddcctv	%i2, %g0, %o3
	.word	0x95a0192a	! t0_kref+0x1f30:   	fstod	%f10, %f10
	.word	0x960e801a	! t0_kref+0x1f34:   	and	%i2, %i2, %o3
	.word	0x96f6b5d0	! t0_kref+0x1f38:   	udivcc	%i2, -0xa30, %o3
	.word	0x95a01a4a	! t0_kref+0x1f3c:   	fdtoi	%f10, %f10
	.word	0x97a0188b	! t0_kref+0x1f40:   	fitos	%f11, %f11
	.word	0x96580000	! t0_kref+0x1f44:   	smul	%g0, %g0, %o3
	.word	0x96968000	! t0_kref+0x1f48:   	orcc	%i2, %g0, %o3
	.word	0xd64e8018	! t0_kref+0x1f4c:   	ldsb	[%i2 + %i0], %o3
	.word	0x95a2c9ab	! t0_kref+0x1f50:   	fdivs	%f11, %f11, %f10
	.word	0xd51e4000	! t0_kref+0x1f54:   	ldd	[%i1], %f10
	.word	0x9736a00c	! t0_kref+0x1f58:   	srl	%i2, 0xc, %o3
	.word	0x95a0054a	! t0_kref+0x1f5c:   	fsqrtd	%f10, %f10
	.word	0x95b28f4a	! t0_kref+0x1f60:   	fornot1	%f10, %f10, %f10
	.word	0x97a0012a	! t0_kref+0x1f64:   	fabss	%f10, %f11
	.word	0x2b800004	! t0_kref+0x1f68:   	fbug,a	_kref+0x1f78
	.word	0xeb270005	! t0_kref+0x1f6c:   	st	%f21, [%i4 + %g5]
	.word	0x972e8000	! t0_kref+0x1f70:   	sll	%i2, %g0, %o3
	.word	0x96580000	! t0_kref+0x1f74:   	smul	%g0, %g0, %o3
	.word	0x960e801a	! t0_kref+0x1f78:   	and	%i2, %i2, %o3
	.word	0xe41e001d	! t0_kref+0x1f7c:   	ldd	[%i0 + %i5], %l2
	.word	0x95a0054a	! t0_kref+0x1f80:   	fsqrtd	%f10, %f10
	.word	0x9618001a	! t0_kref+0x1f84:   	xor	%g0, %i2, %o3
	.word	0xd6100019	! t0_kref+0x1f88:   	lduh	[%g0 + %i1], %o3
	.word	0x95a8004a	! t0_kref+0x1f8c:   	fmovdn	%fcc0, %f10, %f10
	.word	0x34800004	! t0_kref+0x1f90:   	bg,a	_kref+0x1fa0
	.word	0x96f0001a	! t0_kref+0x1f94:   	udivcc	%g0, %i2, %o3
	.word	0x95a0192a	! t0_kref+0x1f98:   	fstod	%f10, %f10
	.word	0x97a0012a	! t0_kref+0x1f9c:   	fabss	%f10, %f11
	.word	0x95a0002a	! t0_kref+0x1fa0:   	fmovs	%f10, %f10
	.word	0xd6160000	! t0_kref+0x1fa4:   	lduh	[%i0], %o3
	.word	0x967eb086	! t0_kref+0x1fa8:   	sdiv	%i2, -0xf7a, %o3
	.word	0xe06e001a	! t0_kref+0x1fac:   	ldstub	[%i0 + %i2], %l0
	.word	0x9744c000	! t0_kref+0x1fb0:   	mov	%gsr, %o3
	.word	0x97b0005a	! t0_kref+0x1fb4:   	edge8l	%g0, %i2, %o3
	.word	0x95a288ca	! t0_kref+0x1fb8:   	fsubd	%f10, %f10, %f10
	.word	0x95a0192a	! t0_kref+0x1fbc:   	fstod	%f10, %f10
	.word	0x96f035d2	! t0_kref+0x1fc0:   	udivcc	%g0, -0xa2e, %o3
	.word	0x95a289ab	! t0_kref+0x1fc4:   	fdivs	%f10, %f11, %f10
	.word	0x96f6b2eb	! t0_kref+0x1fc8:   	udivcc	%i2, -0xd15, %o3
	.word	0xd5180019	! t0_kref+0x1fcc:   	ldd	[%g0 + %i1], %f10
	.word	0x972ea00a	! t0_kref+0x1fd0:   	sll	%i2, 0xa, %o3
	.word	0x95a2884a	! t0_kref+0x1fd4:   	faddd	%f10, %f10, %f10
	.word	0x81dbc009	! t0_kref+0x1fd8:   	flush	%o7 + %o1
	.word	0x95a2894a	! t0_kref+0x1fdc:   	fmuld	%f10, %f10, %f10
	.word	0xd6863ffc	! t0_kref+0x1fe0:   	lda	[%i0 - 4]%asi, %o3
	.word	0xd6063ffc	! t0_kref+0x1fe4:   	ld	[%i0 - 4], %o3
	.word	0x960eb9b9	! t0_kref+0x1fe8:   	and	%i2, -0x647, %o3
	.word	0x97b2848a	! t0_kref+0x1fec:   	fcmple32	%f10, %f10, %o3
	.word	0x97a2c9aa	! t0_kref+0x1ff0:   	fdivs	%f11, %f10, %f11
	.word	0x96203764	! t0_kref+0x1ff4:   	sub	%g0, -0x89c, %o3
	.word	0x95aac04a	! t0_kref+0x1ff8:   	fmovdge	%fcc0, %f10, %f10
	.word	0x965e801a	! t0_kref+0x1ffc:   	smul	%i2, %i2, %o3
	.word	0x97400000	! t0_kref+0x2000:   	mov	%y, %o3
	.word	0xd59e7ff0	! t0_kref+0x2004:   	ldda	[%i1 - 0x10]%asi, %f10
	.word	0x95b28cab	! t0_kref+0x2008:   	fandnot2s	%f10, %f11, %f10
	.word	0x96180000	! t0_kref+0x200c:   	xor	%g0, %g0, %o3
	.word	0xd6d6501b	! t0_kref+0x2010:   	ldsha	[%i1 + %i3]0x80, %o3
	.word	0xd07e3ffc	! t0_kref+0x2014:   	swap	[%i0 - 4], %o0
	.word	0x96580000	! t0_kref+0x2018:   	smul	%g0, %g0, %o3
	.word	0x96b839dc	! t0_kref+0x201c:   	xnorcc	%g0, -0x624, %o3
	.word	0x96f6801a	! t0_kref+0x2020:   	udivcc	%i2, %i2, %o3
	.word	0x96f80000	! t0_kref+0x2024:   	sdivcc	%g0, %g0, %o3
	.word	0xc0a8a030	! t0_kref+0x2028:   	stba	%g0, [%g2 + 0x30]%asi
	.word	0x9646b617	! t0_kref+0x202c:   	addc	%i2, -0x9e9, %o3
	.word	0xf430a03a	! t0_kref+0x2030:   	sth	%i2, [%g2 + 0x3a]
	.word	0xe43e6010	! t0_kref+0x2034:   	std	%l2, [%i1 + 0x10]
	.word	0x95b2874a	! t0_kref+0x2038:   	fpack32	%f10, %f10, %f10
	.word	0x81580000	! t0_kref+0x203c:   	flushw
	.word	0x81b01024	! t0_kref+0x2040:   	siam	0x4
	.word	0xe36e3fe8	! t0_kref+0x2044:   	prefetch	%i0 - 0x18, 17
	.word	0xc030a016	! t0_kref+0x2048:   	clrh	[%g2 + 0x16]
	.word	0x81aa8aab	! t0_kref+0x204c:   	fcmpes	%fcc0, %f10, %f11
	.word	0xc1e61000	! t0_kref+0x2050:   	casa	[%i0]0x80, %g0, %g0
	.word	0x969030ab	! t0_kref+0x2054:   	orcc	%g0, -0xf55, %o3
	.word	0x97408000	! t0_kref+0x2058:   	mov	%ccr, %o3
	.word	0x96900000	! t0_kref+0x205c:   	orcc	%g0, %g0, %o3
	.word	0xc0ae501a	! t0_kref+0x2060:   	stba	%g0, [%i1 + %i2]0x80
	.word	0x9726801a	! t0_kref+0x2064:   	mulscc	%i2, %i2, %o3
	.word	0xe01e7ff0	! t0_kref+0x2068:   	ldd	[%i1 - 0x10], %l0
	.word	0xf4a0a038	! t0_kref+0x206c:   	sta	%i2, [%g2 + 0x38]%asi
	.word	0xd19f1a58	! t0_kref+0x2070:   	ldda	[%i4 + %i0]0xd2, %f8
	.word	0x95a0104a	! t0_kref+0x2074:   	fdtox	%f10, %f10
	.word	0xd46e2019	! t0_kref+0x2078:   	ldstub	[%i0 + 0x19], %o2
	.word	0x96f03990	! t0_kref+0x207c:   	udivcc	%g0, -0x670, %o3
	.word	0x9700001a	! t0_kref+0x2080:   	taddcc	%g0, %i2, %o3
	.word	0x3b480007	! t0_kref+0x2084:   	fble,a,pt	%fcc0, _kref+0x20a0
	.word	0x95a2894a	! t0_kref+0x2088:   	fmuld	%f10, %f10, %f10
	.word	0x960e801a	! t0_kref+0x208c:   	and	%i2, %i2, %o3
	.word	0xc020a038	! t0_kref+0x2090:   	clr	[%g2 + 0x38]
	.word	0xd5180019	! t0_kref+0x2094:   	ldd	[%g0 + %i1], %f10
	.word	0x9626a365	! t0_kref+0x2098:   	sub	%i2, 0x365, %o3
	.word	0xd1be1800	! t0_kref+0x209c:   	stda	%f8, [%i0]0xc0
	.word	0x95a0012b	! t0_kref+0x20a0:   	fabss	%f11, %f10
	.word	0x35800001	! t0_kref+0x20a4:   	fbue,a	_kref+0x20a8
	.word	0xd690a00c	! t0_kref+0x20a8:   	lduha	[%g2 + 0xc]%asi, %o3
	.word	0xd6462010	! t0_kref+0x20ac:   	ldsw	[%i0 + 0x10], %o3
	.word	0x97202945	! t0_kref+0x20b0:   	mulscc	%g0, 0x945, %o3
	.word	0x9720399d	! t0_kref+0x20b4:   	mulscc	%g0, -0x663, %o3
	.word	0xd7070018	! t0_kref+0x20b8:   	ld	[%i4 + %i0], %f11
	.word	0x95ab004a	! t0_kref+0x20bc:   	fmovduge	%fcc0, %f10, %f10
	.word	0x97a0052b	! t0_kref+0x20c0:   	fsqrts	%f11, %f11
	.word	0x95b28e80	! t0_kref+0x20c4:   	fsrc1	%f10, %f10
	.word	0xe0380018	! t0_kref+0x20c8:   	std	%l0, [%g0 + %i0]
	.word	0x95b2898a	! t0_kref+0x20cc:   	bshuffle	%f10, %f10, %f10
	.word	0x971ea2d5	! t0_kref+0x20d0:   	tsubcctv	%i2, 0x2d5, %o3
	.word	0x96180000	! t0_kref+0x20d4:   	xor	%g0, %g0, %o3
	.word	0x97408000	! t0_kref+0x20d8:   	mov	%ccr, %o3
	.word	0x97a0052b	! t0_kref+0x20dc:   	fsqrts	%f11, %f11
	.word	0x95b28e80	! t0_kref+0x20e0:   	fsrc1	%f10, %f10
	.word	0x95b2c6ab	! t0_kref+0x20e4:   	fmul8x16al	%f11, %f11, %f10
	.word	0x97400000	! t0_kref+0x20e8:   	mov	%y, %o3
	.word	0xd6167fe2	! t0_kref+0x20ec:   	lduh	[%i1 - 0x1e], %o3
	.word	0x95a2884a	! t0_kref+0x20f0:   	faddd	%f10, %f10, %f10
	.word	0x95a2884a	! t0_kref+0x20f4:   	faddd	%f10, %f10, %f10
	.word	0x965835a8	! t0_kref+0x20f8:   	smul	%g0, -0xa58, %o3
	.word	0x95a0054a	! t0_kref+0x20fc:   	fsqrtd	%f10, %f10
	.word	0xa7800000	! t0_kref+0x2100:   	mov	%g0, %gsr
	.word	0x95a2894a	! t0_kref+0x2104:   	fmuld	%f10, %f10, %f10
	.word	0x97a0052a	! t0_kref+0x2108:   	fsqrts	%f10, %f11
	.word	0x97202eba	! t0_kref+0x210c:   	mulscc	%g0, 0xeba, %o3
	.word	0xf4366018	! t0_kref+0x2110:   	sth	%i2, [%i1 + 0x18]
	.word	0xe678a010	! t0_kref+0x2114:   	swap	[%g2 + 0x10], %l3
	.word	0x9738200b	! t0_kref+0x2118:   	sra	%g0, 0xb, %o3
	.word	0x96100000	! t0_kref+0x211c:   	clr	%o3
	.word	0x973ea007	! t0_kref+0x2120:   	sra	%i2, 0x7, %o3
	.word	0x96e6b530	! t0_kref+0x2124:   	subccc	%i2, -0xad0, %o3
	.word	0x95a000ca	! t0_kref+0x2128:   	fnegd	%f10, %f10
	.word	0x9730001a	! t0_kref+0x212c:   	srl	%g0, %i2, %o3
	.word	0xd6de7ff0	! t0_kref+0x2130:   	ldxa	[%i1 - 0x10]%asi, %o3
	.word	0xebe65000	! t0_kref+0x2134:   	casa	[%i1]0x80, %g0, %l5
	.word	0x86102003	! t0_kref+0x2138:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x213c:   	bne,a	_kref+0x213c
	.word	0x86a0e001	! t0_kref+0x2140:   	subcc	%g3, 1, %g3
	.word	0xd6462000	! t0_kref+0x2144:   	ldsw	[%i0], %o3
	.word	0x97a000ab	! t0_kref+0x2148:   	fnegs	%f11, %f11
	.word	0xd6563ff8	! t0_kref+0x214c:   	ldsh	[%i0 - 8], %o3
	.word	0x95a000aa	! t0_kref+0x2150:   	fnegs	%f10, %f10
	.word	0x95b009ab	! t0_kref+0x2154:   	fexpand	%f11, %f10
	.word	0x97b28d2b	! t0_kref+0x2158:   	fandnot1s	%f10, %f11, %f11
	.word	0x97382012	! t0_kref+0x215c:   	sra	%g0, 0x12, %o3
	.word	0xd51e001d	! t0_kref+0x2160:   	ldd	[%i0 + %i5], %f10
	.word	0xd726401c	! t0_kref+0x2164:   	st	%f11, [%i1 + %i4]
	.word	0x9666b09f	! t0_kref+0x2168:   	subc	%i2, -0xf61, %o3
	.word	0x9666a831	! t0_kref+0x216c:   	subc	%i2, 0x831, %o3
	.word	0x95a2894a	! t0_kref+0x2170:   	fmuld	%f10, %f10, %f10
	.word	0xe56e7fe8	! t0_kref+0x2174:   	prefetch	%i1 - 0x18, 18
	.word	0xe49f5059	! t0_kref+0x2178:   	ldda	[%i5 + %i1]0x82, %l2
	.word	0xb810200c	! t0_kref+0x217c:   	mov	0xc, %i4
	.word	0x95b2c62a	! t0_kref+0x2180:   	fmul8x16	%f11, %f10, %f10
	.word	0x95a288ca	! t0_kref+0x2184:   	fsubd	%f10, %f10, %f10
	.word	0x9608001a	! t0_kref+0x2188:   	and	%g0, %i2, %o3
	.word	0x95a2cd2a	! t0_kref+0x218c:   	fsmuld	%f11, %f10, %f10
	.word	0x97408000	! t0_kref+0x2190:   	mov	%ccr, %o3
	.word	0x170a106d	! t0_kref+0x2194:   	sethi	%hi(0x2841b400), %o3
	.word	0x95a2882a	! t0_kref+0x2198:   	fadds	%f10, %f10, %f10
	.word	0x95a0192a	! t0_kref+0x219c:   	fstod	%f10, %f10
	.word	0x96468000	! t0_kref+0x21a0:   	addc	%i2, %g0, %o3
	.word	0xd51e401d	! t0_kref+0x21a4:   	ldd	[%i1 + %i5], %f10
	.word	0x95a8404a	! t0_kref+0x21a8:   	fmovdne	%fcc0, %f10, %f10
	.word	0x81aacaab	! t0_kref+0x21ac:   	fcmpes	%fcc0, %f11, %f11
	.word	0x95a0192b	! t0_kref+0x21b0:   	fstod	%f11, %f10
	.word	0x97a000aa	! t0_kref+0x21b4:   	fnegs	%f10, %f11
	.word	0x81aa8aab	! t0_kref+0x21b8:   	fcmpes	%fcc0, %f10, %f11
	.word	0x96a6bb1b	! t0_kref+0x21bc:   	subcc	%i2, -0x4e5, %o3
	.word	0xd6564000	! t0_kref+0x21c0:   	ldsh	[%i1], %o3
	.word	0xd86e001a	! t0_kref+0x21c4:   	ldstub	[%i0 + %i2], %o4
	.word	0xf3ee101d	! t0_kref+0x21c8:   	prefetcha	%i0 + %i5, 25
	.word	0x96402f58	! t0_kref+0x21cc:   	addc	%g0, 0xf58, %o3
	.word	0x97a01a4a	! t0_kref+0x21d0:   	fdtoi	%f10, %f11
	.word	0x95a0002a	! t0_kref+0x21d4:   	fmovs	%f10, %f10
	.word	0x97b68240	! t0_kref+0x21d8:   	array16	%i2, %g0, %o3
	.word	0x97b2caea	! t0_kref+0x21dc:   	fpsub32s	%f11, %f10, %f11
	.word	0x96d6801a	! t0_kref+0x21e0:   	umulcc	%i2, %i2, %o3
	.word	0x9730001a	! t0_kref+0x21e4:   	srl	%g0, %i2, %o3
	.word	0xd60e201e	! t0_kref+0x21e8:   	ldub	[%i0 + 0x1e], %o3
	.word	0xe03e2018	! t0_kref+0x21ec:   	std	%l0, [%i0 + 0x18]
	.word	0x96a82258	! t0_kref+0x21f0:   	andncc	%g0, 0x258, %o3
	.word	0x81580000	! t0_kref+0x21f4:   	flushw
	.word	0x965ea00c	! t0_kref+0x21f8:   	smul	%i2, 0xc, %o3
	.word	0xd6d81018	! t0_kref+0x21fc:   	ldxa	[%g0 + %i0]0x80, %o3
	.word	0x95a01a2a	! t0_kref+0x2200:   	fstoi	%f10, %f10
	.word	0x170eaced	! t0_kref+0x2204:   	sethi	%hi(0x3ab3b400), %o3
	.word	0x39480004	! t0_kref+0x2208:   	fbuge,a,pt	%fcc0, _kref+0x2218
	.word	0x97b28ea0	! t0_kref+0x220c:   	fsrc1s	%f10, %f11
	.word	0xd5be6000	! t0_kref+0x2210:   	stda	%f10, [%i1]%asi
	.word	0xd6066010	! t0_kref+0x2214:   	ld	[%i1 + 0x10], %o3
	.word	0xd656c019	! t0_kref+0x2218:   	ldsh	[%i3 + %i1], %o3
	.word	0xc0a8a03f	! t0_kref+0x221c:   	stba	%g0, [%g2 + 0x3f]%asi
	.word	0x3b800002	! t0_kref+0x2220:   	fble,a	_kref+0x2228
	.word	0x95a0002a	! t0_kref+0x2224:   	fmovs	%f10, %f10
	.word	0x9fc10000	! t0_kref+0x2228:   	call	%g4
	.word	0x96900000	! t0_kref+0x222c:   	orcc	%g0, %g0, %o3
	.word	0x95b00c20	! t0_kref+0x2230:   	fzeros	%f10
	.word	0x973ea005	! t0_kref+0x2234:   	sra	%i2, 0x5, %o3
	.word	0x95b286ea	! t0_kref+0x2238:   	fmul8ulx16	%f10, %f10, %f10
	.word	0xd6060000	! t0_kref+0x223c:   	ld	[%i0], %o3
	.word	0x95a2894a	! t0_kref+0x2240:   	fmuld	%f10, %f10, %f10
	.word	0x95a0052b	! t0_kref+0x2244:   	fsqrts	%f11, %f10
	.word	0x29800008	! t0_kref+0x2248:   	fbl,a	_kref+0x2268
	.word	0x973ea019	! t0_kref+0x224c:   	sra	%i2, 0x19, %o3
	.word	0xd7867ff4	! t0_kref+0x2250:   	lda	[%i1 - 0xc]%asi, %f11
	.word	0x962ea9b9	! t0_kref+0x2254:   	andn	%i2, 0x9b9, %o3
	.word	0x9696a531	! t0_kref+0x2258:   	orcc	%i2, 0x531, %o3
	.word	0x97b00200	! t0_kref+0x225c:   	array8	%g0, %g0, %o3
	.word	0x2d800008	! t0_kref+0x2260:   	fbg,a	_kref+0x2280
	.word	0x960eaecd	! t0_kref+0x2264:   	and	%i2, 0xecd, %o3
	.word	0x97b2854a	! t0_kref+0x2268:   	fcmpeq16	%f10, %f10, %o3
	.word	0x9680001a	! t0_kref+0x226c:   	addcc	%g0, %i2, %o3
	.word	0xd6563fe6	! t0_kref+0x2270:   	ldsh	[%i0 - 0x1a], %o3
	.word	0x95a0054a	! t0_kref+0x2274:   	fsqrtd	%f10, %f10
	.word	0xd6164000	! t0_kref+0x2278:   	lduh	[%i1], %o3
	.word	0x97b00f2a	! t0_kref+0x227c:   	fsrc2s	%f10, %f11
	.word	0x96868000	! t0_kref+0x2280:   	addcc	%i2, %g0, %o3
	.word	0xd6871019	! t0_kref+0x2284:   	lda	[%i4 + %i1]0x80, %o3
	.word	0xe36e6010	! t0_kref+0x2288:   	prefetch	%i1 + 0x10, 17
	.word	0x95a000ab	! t0_kref+0x228c:   	fnegs	%f11, %f10
	.word	0x23800004	! t0_kref+0x2290:   	fbne,a	_kref+0x22a0
	.word	0x95b2874a	! t0_kref+0x2294:   	fpack32	%f10, %f10, %f10
	.word	0x97b00340	! t0_kref+0x2298:   	alignaddrl	%g0, %g0, %o3
	.word	0xf4363fe2	! t0_kref+0x229c:   	sth	%i2, [%i0 - 0x1e]
	.word	0x97400000	! t0_kref+0x22a0:   	mov	%y, %o3
	.word	0x96d6b202	! t0_kref+0x22a4:   	umulcc	%i2, -0xdfe, %o3
	.word	0x95b28aca	! t0_kref+0x22a8:   	fpsub32	%f10, %f10, %f10
	.word	0x96903aba	! t0_kref+0x22ac:   	orcc	%g0, -0x546, %o3
	.word	0xd5a71018	! t0_kref+0x22b0:   	sta	%f10, [%i4 + %i0]0x80
	.word	0x96583b6b	! t0_kref+0x22b4:   	smul	%g0, -0x495, %o3
	.word	0x3f480004	! t0_kref+0x22b8:   	fbo,a,pt	%fcc0, _kref+0x22c8
	.word	0x97b000a0	! t0_kref+0x22bc:   	edge16n	%g0, %g0, %o3
	.word	0x97400000	! t0_kref+0x22c0:   	mov	%y, %o3
	.word	0x95a8c04a	! t0_kref+0x22c4:   	fmovdul	%fcc0, %f10, %f10
	.word	0xd500a010	! t0_kref+0x22c8:   	ld	[%g2 + 0x10], %f10
	.word	0x95a2c9ab	! t0_kref+0x22cc:   	fdivs	%f11, %f11, %f10
	.word	0xd5bf5018	! t0_kref+0x22d0:   	stda	%f10, [%i5 + %i0]0x80
	.word	0xd6163ff2	! t0_kref+0x22d4:   	lduh	[%i0 - 0xe], %o3
	.word	0x97a2c9ab	! t0_kref+0x22d8:   	fdivs	%f11, %f11, %f11
	.word	0x97400000	! t0_kref+0x22dc:   	mov	%y, %o3
	.word	0xd6167ffc	! t0_kref+0x22e0:   	lduh	[%i1 - 4], %o3
	.word	0xd53e2000	! t0_kref+0x22e4:   	std	%f10, [%i0]
	.word	0x96f8001a	! t0_kref+0x22e8:   	sdivcc	%g0, %i2, %o3
	.word	0xb8103fe8	! t0_kref+0x22ec:   	mov	0xffffffe8, %i4
	.word	0xd59e3fe0	! t0_kref+0x22f0:   	ldda	[%i0 - 0x20]%asi, %f10
	.word	0x95a0110a	! t0_kref+0x22f4:   	fxtod	%f10, %f10
	.word	0x95b2caeb	! t0_kref+0x22f8:   	fpsub32s	%f11, %f11, %f10
	.word	0x9726b690	! t0_kref+0x22fc:   	mulscc	%i2, -0x970, %o3
	.word	0xd51e7ff0	! t0_kref+0x2300:   	ldd	[%i1 - 0x10], %f10
	.word	0xc07e2010	! t0_kref+0x2304:   	swap	[%i0 + 0x10], %g0
	.word	0x95a0054a	! t0_kref+0x2308:   	fsqrtd	%f10, %f10
	.word	0x969ebd6f	! t0_kref+0x230c:   	xorcc	%i2, -0x291, %o3
	.word	0xe03e7ff0	! t0_kref+0x2310:   	std	%l0, [%i1 - 0x10]
	.word	0xd6de2008	! t0_kref+0x2314:   	ldxa	[%i0 + 8]%asi, %o3
	.word	0xd65e401d	! t0_kref+0x2318:   	ldx	[%i1 + %i5], %o3
	.word	0x9736a019	! t0_kref+0x231c:   	srl	%i2, 0x19, %o3
	.word	0x95a0104a	! t0_kref+0x2320:   	fdtox	%f10, %f10
	.word	0x97b00280	! t0_kref+0x2324:   	array32	%g0, %g0, %o3
	.word	0x95a0054a	! t0_kref+0x2328:   	fsqrtd	%f10, %f10
	.word	0x960e801a	! t0_kref+0x232c:   	and	%i2, %i2, %o3
	.word	0x95a0188a	! t0_kref+0x2330:   	fitos	%f10, %f10
	.word	0x97b2854a	! t0_kref+0x2334:   	fcmpeq16	%f10, %f10, %o3
	.word	0x81b01027	! t0_kref+0x2338:   	siam	0x7
	.word	0x8143e040	! t0_kref+0x233c:   	membar	0x40
	.word	0x95a000ca	! t0_kref+0x2340:   	fnegd	%f10, %f10
	.word	0xd1be1880	! t0_kref+0x2344:   	stda	%f8, [%i0]0xc4
	.word	0x97408000	! t0_kref+0x2348:   	mov	%ccr, %o3
	.word	0x97a01a4a	! t0_kref+0x234c:   	fdtoi	%f10, %f11
	.word	0x97b00140	! t0_kref+0x2350:   	edge32l	%g0, %g0, %o3
	.word	0xd6566016	! t0_kref+0x2354:   	ldsh	[%i1 + 0x16], %o3
	.word	0x960e801a	! t0_kref+0x2358:   	and	%i2, %i2, %o3
	.word	0x96902df3	! t0_kref+0x235c:   	orcc	%g0, 0xdf3, %o3
	.word	0x962e8000	! t0_kref+0x2360:   	andn	%i2, %g0, %o3
	.word	0x26480005	! t0_kref+0x2364:   	bl,a,pt	%icc, _kref+0x2378
	.word	0x95a018ca	! t0_kref+0x2368:   	fdtos	%f10, %f10
	.word	0x97400000	! t0_kref+0x236c:   	mov	%y, %o3
	.word	0x965ea0a5	! t0_kref+0x2370:   	smul	%i2, 0xa5, %o3
	.word	0x966030a0	! t0_kref+0x2374:   	subc	%g0, -0xf60, %o3
	.word	0x95a0192b	! t0_kref+0x2378:   	fstod	%f11, %f10
	.word	0x96668000	! t0_kref+0x237c:   	subc	%i2, %g0, %o3
	.word	0x96f6ac56	! t0_kref+0x2380:   	udivcc	%i2, 0xc56, %o3
	.word	0x96d6801a	! t0_kref+0x2384:   	umulcc	%i2, %i2, %o3
	.word	0xc0f75019	! t0_kref+0x2388:   	stxa	%g0, [%i5 + %i1]0x80
	.word	0x97b0035a	! t0_kref+0x238c:   	alignaddrl	%g0, %i2, %o3
	.word	0x97400000	! t0_kref+0x2390:   	mov	%y, %o3
	.word	0xe03e401d	! t0_kref+0x2394:   	std	%l0, [%i1 + %i5]
	.word	0x95b2890a	! t0_kref+0x2398:   	faligndata	%f10, %f10, %f10
	.word	0x97b00300	! t0_kref+0x239c:   	alignaddr	%g0, %g0, %o3
	.word	0x95a0002b	! t0_kref+0x23a0:   	fmovs	%f11, %f10
	.word	0xe4180018	! t0_kref+0x23a4:   	ldd	[%g0 + %i0], %l2
	.word	0x81aaca2a	! t0_kref+0x23a8:   	fcmps	%fcc0, %f11, %f10
	.word	0x9608001a	! t0_kref+0x23ac:   	and	%g0, %i2, %o3
	.word	0x81dc000c	! t0_kref+0x23b0:   	flush	%l0 + %o4
	.word	0x95a0014a	! t0_kref+0x23b4:   	fabsd	%f10, %f10
	.word	0xe41e2000	! t0_kref+0x23b8:   	ldd	[%i0], %l2
	.word	0x81dcb096	! t0_kref+0x23bc:   	flush	%l2 - 0xf6a
	.word	0x95a2894a	! t0_kref+0x23c0:   	fmuld	%f10, %f10, %f10
	.word	0xd68e3fe1	! t0_kref+0x23c4:   	lduba	[%i0 - 0x1f]%asi, %o3
	.word	0x95a0054a	! t0_kref+0x23c8:   	fsqrtd	%f10, %f10
	.word	0x960e801a	! t0_kref+0x23cc:   	and	%i2, %i2, %o3
	.word	0x9e0068a8	! t0_kref+0x23d0:   	add	%g1, 0x8a8, %o7
!	.word	0x244d3f0b	! t0_kref+0x23d4:   	ble,a,pt	%icc, SYM(t0_subr1)
	   	ble,a,pt	%icc, SYM(t0_subr1)
	.word	0x8143c000	! t0_kref+0x23d8:   	stbar
	.word	0x97b28fab	! t0_kref+0x23dc:   	fors	%f10, %f11, %f11
	.word	0xd1be5a1a	! t0_kref+0x23e0:   	stda	%f8, [%i1 + %i2]0xd0
	.word	0x96183d03	! t0_kref+0x23e4:   	xor	%g0, -0x2fd, %o3
	.word	0x81aacaab	! t0_kref+0x23e8:   	fcmpes	%fcc0, %f11, %f11
	.word	0x95a0192a	! t0_kref+0x23ec:   	fstod	%f10, %f10
	.word	0x9696bfd0	! t0_kref+0x23f0:   	orcc	%i2, -0x30, %o3
	.word	0x81dc0014	! t0_kref+0x23f4:   	flush	%l0 + %l4
	.word	0x95a0188a	! t0_kref+0x23f8:   	fitos	%f10, %f10
	.word	0x96080000	! t0_kref+0x23fc:   	and	%g0, %g0, %o3
	.word	0x97a0012b	! t0_kref+0x2400:   	fabss	%f11, %f11
	.word	0x97203853	! t0_kref+0x2404:   	mulscc	%g0, -0x7ad, %o3
	.word	0x96de8000	! t0_kref+0x2408:   	smulcc	%i2, %g0, %o3
	.word	0x95a000ca	! t0_kref+0x240c:   	fnegd	%f10, %f10
	.word	0x22800003	! t0_kref+0x2410:   	be,a	_kref+0x241c
	.word	0x95ab004a	! t0_kref+0x2414:   	fmovduge	%fcc0, %f10, %f10
	.word	0x95a288ca	! t0_kref+0x2418:   	fsubd	%f10, %f10, %f10
	.word	0x96102ce7	! t0_kref+0x241c:   	mov	0xce7, %o3
	.word	0x97a018ca	! t0_kref+0x2420:   	fdtos	%f10, %f11
	.word	0x95a2894a	! t0_kref+0x2424:   	fmuld	%f10, %f10, %f10
	.word	0x965027da	! t0_kref+0x2428:   	umul	%g0, 0x7da, %o3
	.word	0x95b2872b	! t0_kref+0x242c:   	fmuld8ulx16	%f10, %f11, %f10
	.word	0x97a2882a	! t0_kref+0x2430:   	fadds	%f10, %f10, %f11
	.word	0xd656001b	! t0_kref+0x2434:   	ldsh	[%i0 + %i3], %o3
	.word	0x95a2894a	! t0_kref+0x2438:   	fmuld	%f10, %f10, %f10
	.word	0x9716bb21	! t0_kref+0x243c:   	taddcctv	%i2, -0x4df, %o3
	.word	0xc807bfe8	! t0_kref+0x2440:   	ld	[%fp - 0x18], %g4
	.word	0x95a0192a	! t0_kref+0x2444:   	fstod	%f10, %f10
	.word	0x97a0012b	! t0_kref+0x2448:   	fabss	%f11, %f11
	.word	0x96f00000	! t0_kref+0x244c:   	udivcc	%g0, %g0, %o3
	.word	0x95a0104a	! t0_kref+0x2450:   	fdtox	%f10, %f10
	.word	0xca016fa0	! t0_kref+0x2454:   	ld	[%g5 + 0xfa0], %g5
	.word	0x9696801a	! t0_kref+0x2458:   	orcc	%i2, %i2, %o3
	.word	0xc168a00b	! t0_kref+0x245c:   	prefetch	%g2 + 0xb, 0
	.word	0xd1be585a	! t0_kref+0x2460:   	stda	%f8, [%i1 + %i2]0xc2
	.word	0xd51f4019	! t0_kref+0x2464:   	ldd	[%i5 + %i1], %f10
	.word	0x97a289ab	! t0_kref+0x2468:   	fdivs	%f10, %f11, %f11
	.word	0x96468000	! t0_kref+0x246c:   	addc	%i2, %g0, %o3
	.word	0x97408000	! t0_kref+0x2470:   	mov	%ccr, %o3
	.word	0xd696101b	! t0_kref+0x2474:   	lduha	[%i0 + %i3]0x80, %o3
	.word	0x95b00fc0	! t0_kref+0x2478:   	fone	%f10
	.word	0x95a2894a	! t0_kref+0x247c:   	fmuld	%f10, %f10, %f10
	.word	0x81de3d49	! t0_kref+0x2480:   	flush	%i0 - 0x2b7
	.word	0x9736a00d	! t0_kref+0x2484:   	srl	%i2, 0xd, %o3
	.word	0xd6564000	! t0_kref+0x2488:   	ldsh	[%i1], %o3
	.word	0x39800006	! t0_kref+0x248c:   	fbuge,a	_kref+0x24a4
	.word	0xd5380018	! t0_kref+0x2490:   	std	%f10, [%g0 + %i0]
	.word	0x97b28d60	! t0_kref+0x2494:   	fnot1s	%f10, %f11
	.word	0x96868000	! t0_kref+0x2498:   	addcc	%i2, %g0, %o3
	.word	0x95a0052b	! t0_kref+0x249c:   	fsqrts	%f11, %f10
	.word	0x961034c2	! t0_kref+0x24a0:   	mov	0xfffff4c2, %o3
	.word	0x97382013	! t0_kref+0x24a4:   	sra	%g0, 0x13, %o3
	.word	0xe968a00d	! t0_kref+0x24a8:   	prefetch	%g2 + 0xd, 20
	.word	0x96182ae4	! t0_kref+0x24ac:   	xor	%g0, 0xae4, %o3
	.word	0x17217f73	! t0_kref+0x24b0:   	sethi	%hi(0x85fdcc00), %o3
	.word	0xd5a71018	! t0_kref+0x24b4:   	sta	%f10, [%i4 + %i0]0x80
	.word	0xe16e001c	! t0_kref+0x24b8:   	prefetch	%i0 + %i4, 16
	.word	0x95a01a2b	! t0_kref+0x24bc:   	fstoi	%f11, %f10
	.word	0xd6d63ffa	! t0_kref+0x24c0:   	ldsha	[%i0 - 6]%asi, %o3
	.word	0x95a0188a	! t0_kref+0x24c4:   	fitos	%f10, %f10
	.word	0x9640337d	! t0_kref+0x24c8:   	addc	%g0, -0xc83, %o3
	.word	0xd5862000	! t0_kref+0x24cc:   	lda	[%i0]%asi, %f10
	.word	0xe01e4000	! t0_kref+0x24d0:   	ldd	[%i1], %l0
	.word	0x86102006	! t0_kref+0x24d4:   	mov	0x6, %g3
	.word	0x86a0e001	! t0_kref+0x24d8:   	subcc	%g3, 1, %g3
	.word	0x22800011	! t0_kref+0x24dc:   	be,a	_kref+0x2520
	.word	0x96f68000	! t0_kref+0x24e0:   	udivcc	%i2, %g0, %o3
	.word	0xd51fbc58	! t0_kref+0x24e4:   	ldd	[%fp - 0x3a8], %f10
	.word	0x9626a7fe	! t0_kref+0x24e8:   	sub	%i2, 0x7fe, %o3
	.word	0x969e8000	! t0_kref+0x24ec:   	xorcc	%i2, %g0, %o3
	.word	0x20bffffa	! t0_kref+0x24f0:   	bn,a	_kref+0x24d8
	.word	0x97282006	! t0_kref+0x24f4:   	sll	%g0, 0x6, %o3
	.word	0x97400000	! t0_kref+0x24f8:   	mov	%y, %o3
	.word	0x97b2854a	! t0_kref+0x24fc:   	fcmpeq16	%f10, %f10, %o3
	.word	0x97b00fe0	! t0_kref+0x2500:   	fones	%f11
	.word	0x961eb314	! t0_kref+0x2504:   	xor	%i2, -0xcec, %o3
	.word	0x9730200a	! t0_kref+0x2508:   	srl	%g0, 0xa, %o3
	.word	0x96583dbe	! t0_kref+0x250c:   	smul	%g0, -0x242, %o3
	.word	0x95a0110a	! t0_kref+0x2510:   	fxtod	%f10, %f10
	.word	0xf420001c	! t0_kref+0x2514:   	st	%i2, [%g0 + %i4]
	.word	0x9680001a	! t0_kref+0x2518:   	addcc	%g0, %i2, %o3
	.word	0xc0ee5000	! t0_kref+0x251c:   	ldstuba	[%i1]0x80, %g0
	.word	0x97b007aa	! t0_kref+0x2520:   	fpackfix	%f10, %f11
	.word	0x95a0054a	! t0_kref+0x2524:   	fsqrtd	%f10, %f10
	.word	0x96880000	! t0_kref+0x2528:   	andcc	%g0, %g0, %o3
	.word	0x95a0052a	! t0_kref+0x252c:   	fsqrts	%f10, %f10
	.word	0x973ea00d	! t0_kref+0x2530:   	sra	%i2, 0xd, %o3
	.word	0x95b28d40	! t0_kref+0x2534:   	fnot1	%f10, %f10
	.word	0x9626801a	! t0_kref+0x2538:   	sub	%i2, %i2, %o3
	.word	0x81aa8aca	! t0_kref+0x253c:   	fcmped	%fcc0, %f10, %f10
	.word	0xd6562008	! t0_kref+0x2540:   	ldsh	[%i0 + 8], %o3
	.word	0xd7263fe0	! t0_kref+0x2544:   	st	%f11, [%i0 - 0x20]
	.word	0x9726801a	! t0_kref+0x2548:   	mulscc	%i2, %i2, %o3
	.word	0x96100000	! t0_kref+0x254c:   	clr	%o3
	.word	0x97a289ab	! t0_kref+0x2550:   	fdivs	%f10, %f11, %f11
	.word	0x96902a91	! t0_kref+0x2554:   	orcc	%g0, 0xa91, %o3
	.word	0xd64e8018	! t0_kref+0x2558:   	ldsb	[%i2 + %i0], %o3
	.word	0x965e801a	! t0_kref+0x255c:   	smul	%i2, %i2, %o3
	.word	0x97b2caeb	! t0_kref+0x2560:   	fpsub32s	%f11, %f11, %f11
	.word	0xd60e401a	! t0_kref+0x2564:   	ldub	[%i1 + %i2], %o3
	.word	0x97b00200	! t0_kref+0x2568:   	array8	%g0, %g0, %o3
	.word	0x95b2c62a	! t0_kref+0x256c:   	fmul8x16	%f11, %f10, %f10
	.word	0x95b28d0a	! t0_kref+0x2570:   	fandnot1	%f10, %f10, %f10
	.word	0x95a01a4a	! t0_kref+0x2574:   	fdtoi	%f10, %f10
	.word	0x97a0052a	! t0_kref+0x2578:   	fsqrts	%f10, %f11
	.word	0x97a01a4a	! t0_kref+0x257c:   	fdtoi	%f10, %f11
	.word	0x95b28c6a	! t0_kref+0x2580:   	fnors	%f10, %f10, %f10
	.word	0x95b286ea	! t0_kref+0x2584:   	fmul8ulx16	%f10, %f10, %f10
	.word	0x95a0012a	! t0_kref+0x2588:   	fabss	%f10, %f10
	.word	0x95b28eca	! t0_kref+0x258c:   	fornot2	%f10, %f10, %f10
	.word	0x9666a3e9	! t0_kref+0x2590:   	subc	%i2, 0x3e9, %o3
	.word	0x97a01a4a	! t0_kref+0x2594:   	fdtoi	%f10, %f11
	.word	0x95a0190a	! t0_kref+0x2598:   	fitod	%f10, %f10
	.word	0xa9c70005	! t0_kref+0x259c:   	jmpl	%i4 + %g5, %l4
	.word	0x81580000	! t0_kref+0x25a0:   	flushw
	.word	0x96e0001a	! t0_kref+0x25a4:   	subccc	%g0, %i2, %o3
	.word	0x95a2cd2a	! t0_kref+0x25a8:   	fsmuld	%f11, %f10, %f10
	.word	0x8143e040	! t0_kref+0x25ac:   	membar	0x40
	.word	0xd6d66018	! t0_kref+0x25b0:   	ldsha	[%i1 + 0x18]%asi, %o3
	.word	0x95a000ca	! t0_kref+0x25b4:   	fnegd	%f10, %f10
	.word	0x86102002	! t0_kref+0x25b8:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x25bc:   	bne,a	_kref+0x25bc
	.word	0x86a0e001	! t0_kref+0x25c0:   	subcc	%g3, 1, %g3
	.word	0x172bccee	! t0_kref+0x25c4:   	sethi	%hi(0xaf33b800), %o3
	.word	0x96e6b2b3	! t0_kref+0x25c8:   	subccc	%i2, -0xd4d, %o3
	.word	0x97a000aa	! t0_kref+0x25cc:   	fnegs	%f10, %f11
	.word	0xe656c005	! t0_kref+0x25d0:   	ldsh	[%i3 + %g5], %l3
	.word	0x95a288ca	! t0_kref+0x25d4:   	fsubd	%f10, %f10, %f10
	.word	0x96f6b4b2	! t0_kref+0x25d8:   	udivcc	%i2, -0xb4e, %o3
	.word	0x2d800008	! t0_kref+0x25dc:   	fbg,a	_kref+0x25fc
	.word	0xf4ae3ff0	! t0_kref+0x25e0:   	stba	%i2, [%i0 - 0x10]%asi
	.word	0x95a288ca	! t0_kref+0x25e4:   	fsubd	%f10, %f10, %f10
	.word	0x95b28aca	! t0_kref+0x25e8:   	fpsub32	%f10, %f10, %f10
	.word	0x96de801a	! t0_kref+0x25ec:   	smulcc	%i2, %i2, %o3
	.word	0x9666b485	! t0_kref+0x25f0:   	subc	%i2, -0xb7b, %o3
	.word	0x97b00020	! t0_kref+0x25f4:   	edge8n	%g0, %g0, %o3
	.word	0x9fc10000	! t0_kref+0x25f8:   	call	%g4
	.word	0xd6de501d	! t0_kref+0x25fc:   	ldxa	[%i1 + %i5]0x80, %o3
	.word	0xe43e2008	! t0_kref+0x2600:   	std	%l2, [%i0 + 8]
	.word	0x31480008	! t0_kref+0x2604:   	fba,a,pt	%fcc0, _kref+0x2624
	.word	0x95a0104a	! t0_kref+0x2608:   	fdtox	%f10, %f10
	.word	0x95b2874a	! t0_kref+0x260c:   	fpack32	%f10, %f10, %f10
	.word	0x96968000	! t0_kref+0x2610:   	orcc	%i2, %g0, %o3
	.word	0xd5be101d	! t0_kref+0x2614:   	stda	%f10, [%i0 + %i5]0x80
	.word	0xc0366000	! t0_kref+0x2618:   	clrh	[%i1]
	.word	0xe43e7ff8	! t0_kref+0x261c:   	std	%l2, [%i1 - 8]
	.word	0x96182abe	! t0_kref+0x2620:   	xor	%g0, 0xabe, %o3
	.word	0x9656801a	! t0_kref+0x2624:   	umul	%i2, %i2, %o3
	.word	0x97a2c8ab	! t0_kref+0x2628:   	fsubs	%f11, %f11, %f11
	.word	0x95b00cea	! t0_kref+0x262c:   	fnot2s	%f10, %f10
	.word	0x97b00200	! t0_kref+0x2630:   	array8	%g0, %g0, %o3
	.word	0x9658001a	! t0_kref+0x2634:   	smul	%g0, %i2, %o3
	.word	0x97b2850a	! t0_kref+0x2638:   	fcmpgt16	%f10, %f10, %o3
	.word	0x967e8000	! t0_kref+0x263c:   	sdiv	%i2, %g0, %o3
	.word	0x9736a00e	! t0_kref+0x2640:   	srl	%i2, 0xe, %o3
	.word	0x9726a798	! t0_kref+0x2644:   	mulscc	%i2, 0x798, %o3
	.word	0x83414000	! t0_kref+0x2648:   	mov	%pc, %g1
	.word	0x9676b0c0	! t0_kref+0x264c:   	udiv	%i2, -0xf40, %o3
	.word	0xd51fbe28	! t0_kref+0x2650:   	ldd	[%fp - 0x1d8], %f10
	.word	0x97a0002a	! t0_kref+0x2654:   	fmovs	%f10, %f11
	.word	0x97b0033a	! t0_kref+0x2658:   	bmask	%g0, %i2, %o3
	.word	0x97a01a4a	! t0_kref+0x265c:   	fdtoi	%f10, %f11
	.word	0x95b28a0a	! t0_kref+0x2660:   	fpadd16	%f10, %f10, %f10
	.word	0xe41e3fe0	! t0_kref+0x2664:   	ldd	[%i0 - 0x20], %l2
	.word	0x8143e02d	! t0_kref+0x2668:   	membar	0x2d
	.word	0x97b284ca	! t0_kref+0x266c:   	fcmpne32	%f10, %f10, %o3
	.word	0x8143e040	! t0_kref+0x2670:   	membar	0x40
	.word	0x97b2840a	! t0_kref+0x2674:   	fcmple16	%f10, %f10, %o3
	.word	0x962039bd	! t0_kref+0x2678:   	sub	%g0, -0x643, %o3
	.word	0x8143c000	! t0_kref+0x267c:   	stbar
	.word	0x95a28d2a	! t0_kref+0x2680:   	fsmuld	%f10, %f10, %f10
	.word	0xd6166016	! t0_kref+0x2684:   	lduh	[%i1 + 0x16], %o3
	.word	0x96f031c5	! t0_kref+0x2688:   	udivcc	%g0, -0xe3b, %o3
	.word	0x97b000da	! t0_kref+0x268c:   	edge16l	%g0, %i2, %o3
	.word	0x97b00c20	! t0_kref+0x2690:   	fzeros	%f11
	.word	0x96700000	! t0_kref+0x2694:   	udiv	%g0, %g0, %o3
	.word	0x95b2874a	! t0_kref+0x2698:   	fpack32	%f10, %f10, %f10
	.word	0x9666801a	! t0_kref+0x269c:   	subc	%i2, %i2, %o3
	.word	0x95b00fe0	! t0_kref+0x26a0:   	fones	%f10
	.word	0xe41f4019	! t0_kref+0x26a4:   	ldd	[%i5 + %i1], %l2
	.word	0xe01f4019	! t0_kref+0x26a8:   	ldd	[%i5 + %i1], %l0
	.word	0x965ea593	! t0_kref+0x26ac:   	smul	%i2, 0x593, %o3
	.word	0x97b2854a	! t0_kref+0x26b0:   	fcmpeq16	%f10, %f10, %o3
	.word	0xd6067ff8	! t0_kref+0x26b4:   	ld	[%i1 - 8], %o3
	.word	0x97b68000	! t0_kref+0x26b8:   	edge8	%i2, %g0, %o3
	.word	0x95b28daa	! t0_kref+0x26bc:   	fxors	%f10, %f10, %f10
	.word	0x34800004	! t0_kref+0x26c0:   	bg,a	_kref+0x26d0
	.word	0x9626b4b0	! t0_kref+0x26c4:   	sub	%i2, -0xb50, %o3
	.word	0x96be801a	! t0_kref+0x26c8:   	xnorcc	%i2, %i2, %o3
	.word	0x95a289aa	! t0_kref+0x26cc:   	fdivs	%f10, %f10, %f10
	.word	0x95a0190a	! t0_kref+0x26d0:   	fitod	%f10, %f10
	.word	0x95a0192b	! t0_kref+0x26d4:   	fstod	%f11, %f10
	.word	0x95a01a2a	! t0_kref+0x26d8:   	fstoi	%f10, %f10
	.word	0x95b2890a	! t0_kref+0x26dc:   	faligndata	%f10, %f10, %f10
	.word	0x97b284ca	! t0_kref+0x26e0:   	fcmpne32	%f10, %f10, %o3
	.word	0xd580a024	! t0_kref+0x26e4:   	lda	[%g2 + 0x24]%asi, %f10
	.word	0x961eb245	! t0_kref+0x26e8:   	xor	%i2, -0xdbb, %o3
	.word	0x973e8000	! t0_kref+0x26ec:   	sra	%i2, %g0, %o3
	.word	0xd6c71019	! t0_kref+0x26f0:   	ldswa	[%i4 + %i1]0x80, %o3
	.word	0x95a9004a	! t0_kref+0x26f4:   	fmovdl	%fcc0, %f10, %f10
	.word	0x87802082	! t0_kref+0x26f8:   	mov	0x82, %asi
	.word	0x86102019	! t0_kref+0x26fc:   	mov	0x19, %g3
	.word	0x86a0e001	! t0_kref+0x2700:   	subcc	%g3, 1, %g3
	.word	0x22800002	! t0_kref+0x2704:   	be,a	_kref+0x270c
	.word	0x973e801a	! t0_kref+0x2708:   	sra	%i2, %i2, %o3
	call	1f
	.empty
	.word	0x96f6a6ad	! t0_kref+0x2710:   	udivcc	%i2, 0x6ad, %o3
	.word	0xe4380018	! t0_kref+0x2714:   	std	%l2, [%g0 + %i0]
	.word	0xe09e101d	! t0_kref+0x2718:   	ldda	[%i0 + %i5]0x80, %l0
	.word	0x95b2862a	! t0_kref+0x271c:   	fmul8x16	%f10, %f10, %f10
	.word	0x95a289aa	! t0_kref+0x2720:   	fdivs	%f10, %f10, %f10
1:	.word	0xd6067ff4	! t0_kref+0x2724:   	ld	[%i1 - 0xc], %o3
	.word	0xd6d01018	! t0_kref+0x2728:   	ldsha	[%g0 + %i0]0x80, %o3
	.word	0x97a0188b	! t0_kref+0x272c:   	fitos	%f11, %f11
	.word	0x95b28a4a	! t0_kref+0x2730:   	fpadd32	%f10, %f10, %f10
	.word	0xd51e4000	! t0_kref+0x2734:   	ldd	[%i1], %f10
	.word	0x97b2858a	! t0_kref+0x2738:   	fcmpgt32	%f10, %f10, %o3
	.word	0x95b007aa	! t0_kref+0x273c:   	fpackfix	%f10, %f10
	.word	0x95a2884a	! t0_kref+0x2740:   	faddd	%f10, %f10, %f10
	.word	0x9666a470	! t0_kref+0x2744:   	subc	%i2, 0x470, %o3
	.word	0x97a0012a	! t0_kref+0x2748:   	fabss	%f10, %f11
	.word	0x97b2ce2a	! t0_kref+0x274c:   	fands	%f11, %f10, %f11
	.word	0x960eb90c	! t0_kref+0x2750:   	and	%i2, -0x6f4, %o3
	.word	0x8143c000	! t0_kref+0x2754:   	stbar
	.word	0xc0264000	! t0_kref+0x2758:   	clr	[%i1]
	.word	0x96de801a	! t0_kref+0x275c:   	smulcc	%i2, %i2, %o3
	.word	0x9676a86c	! t0_kref+0x2760:   	udiv	%i2, 0x86c, %o3
	.word	0x97418000	! t0_kref+0x2764:   	mov	%fprs, %o3
	.word	0x96b836a6	! t0_kref+0x2768:   	xnorcc	%g0, -0x95a, %o3
	.word	0x81dabe3d	! t0_kref+0x276c:   	flush	%o2 - 0x1c3
	.word	0x97a0012b	! t0_kref+0x2770:   	fabss	%f11, %f11
	.word	0x965ea85c	! t0_kref+0x2774:   	smul	%i2, 0x85c, %o3
	call	SYM(t0_subr3)
	.word	0x95a2cd2a	! t0_kref+0x277c:   	fsmuld	%f11, %f10, %f10
	.word	0x97b00fe0	! t0_kref+0x2780:   	fones	%f11
	.word	0x97400000	! t0_kref+0x2784:   	mov	%y, %o3
	.word	0x97368000	! t0_kref+0x2788:   	srl	%i2, %g0, %o3
	.word	0xba103ff8	! t0_kref+0x278c:   	mov	0xfffffff8, %i5
	.word	0x97408000	! t0_kref+0x2790:   	mov	%ccr, %o3
	.word	0x95b28e80	! t0_kref+0x2794:   	fsrc1	%f10, %f10
	.word	0xd6164000	! t0_kref+0x2798:   	lduh	[%i1], %o3
	.word	0xc368a008	! t0_kref+0x279c:   	prefetch	%g2 + 8, 1
	.word	0xd6567ffc	! t0_kref+0x27a0:   	ldsh	[%i1 - 4], %o3
	.word	0x95a288ca	! t0_kref+0x27a4:   	fsubd	%f10, %f10, %f10
	.word	0x967e8000	! t0_kref+0x27a8:   	sdiv	%i2, %g0, %o3
	.word	0x96e68000	! t0_kref+0x27ac:   	subccc	%i2, %g0, %o3
	.word	0x2f480008	! t0_kref+0x27b0:   	fbu,a,pt	%fcc0, _kref+0x27d0
	.word	0x95a2c9aa	! t0_kref+0x27b4:   	fdivs	%f11, %f10, %f10
	.word	0x9f414000	! t0_kref+0x27b8:   	mov	%pc, %o7
	.word	0x95a000ca	! t0_kref+0x27bc:   	fnegd	%f10, %f10
	.word	0xf007bfe0	! t0_kref+0x27c0:   	ld	[%fp - 0x20], %i0
	.word	0x97b00300	! t0_kref+0x27c4:   	alignaddr	%g0, %g0, %o3
	.word	0x96d0001a	! t0_kref+0x27c8:   	umulcc	%g0, %i2, %o3
	.word	0x20800003	! t0_kref+0x27cc:   	bn,a	_kref+0x27d8
	.word	0x95b2c72b	! t0_kref+0x27d0:   	fmuld8ulx16	%f11, %f11, %f10
	.word	0xd5a6101c	! t0_kref+0x27d4:   	sta	%f10, [%i0 + %i4]0x80
	.word	0x96e03c9a	! t0_kref+0x27d8:   	subccc	%g0, -0x366, %o3
	.word	0x97b2848a	! t0_kref+0x27dc:   	fcmple32	%f10, %f10, %o3
	.word	0x95a28d2b	! t0_kref+0x27e0:   	fsmuld	%f10, %f11, %f10
	.word	0xe41e0000	! t0_kref+0x27e4:   	ldd	[%i0], %l2
	.word	0xf4ae5000	! t0_kref+0x27e8:   	stba	%i2, [%i1]0x80
	.word	0x97b2850a	! t0_kref+0x27ec:   	fcmpgt16	%f10, %f10, %o3
	.word	0x96b83400	! t0_kref+0x27f0:   	xnorcc	%g0, -0xc00, %o3
	.word	0x971eb65f	! t0_kref+0x27f4:   	tsubcctv	%i2, -0x9a1, %o3
	.word	0x97b00020	! t0_kref+0x27f8:   	edge8n	%g0, %g0, %o3
	.word	0x96968000	! t0_kref+0x27fc:   	orcc	%i2, %g0, %o3
	.word	0xb6103ff2	! t0_kref+0x2800:   	mov	0xfffffff2, %i3
	.word	0x95a2884a	! t0_kref+0x2804:   	faddd	%f10, %f10, %f10
	.word	0x97a289aa	! t0_kref+0x2808:   	fdivs	%f10, %f10, %f11
	.word	0x97b2850a	! t0_kref+0x280c:   	fcmpgt16	%f10, %f10, %o3
	.word	0x965837d9	! t0_kref+0x2810:   	smul	%g0, -0x827, %o3
	.word	0xe01e401d	! t0_kref+0x2814:   	ldd	[%i1 + %i5], %l0
	.word	0x95a2884a	! t0_kref+0x2818:   	faddd	%f10, %f10, %f10
	.word	0x96502022	! t0_kref+0x281c:   	umul	%g0, 0x22, %o3
	.word	0xc1e6501a	! t0_kref+0x2820:   	casa	[%i1]0x80, %i2, %g0
	.word	0xd696d018	! t0_kref+0x2824:   	lduha	[%i3 + %i0]0x80, %o3
	.word	0x95a0188b	! t0_kref+0x2828:   	fitos	%f11, %f10
	.word	0x9738001a	! t0_kref+0x282c:   	sra	%g0, %i2, %o3
	.word	0xd6167fea	! t0_kref+0x2830:   	lduh	[%i1 - 0x16], %o3
	.word	0x97b0013a	! t0_kref+0x2834:   	edge32n	%g0, %i2, %o3
	.word	0x95a2cd2a	! t0_kref+0x2838:   	fsmuld	%f11, %f10, %f10
	.word	0x95a0012b	! t0_kref+0x283c:   	fabss	%f11, %f10
	.word	0x96a82f6e	! t0_kref+0x2840:   	andncc	%g0, 0xf6e, %o3
	.word	0x86102001	! t0_kref+0x2844:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x2848:   	bne,a	_kref+0x2848
	.word	0x86a0e001	! t0_kref+0x284c:   	subcc	%g3, 1, %g3
	.word	0x95a0012a	! t0_kref+0x2850:   	fabss	%f10, %f10
	.word	0xd51f4019	! t0_kref+0x2854:   	ldd	[%i5 + %i1], %f10
	.word	0x97a0012b	! t0_kref+0x2858:   	fabss	%f11, %f11
	.word	0x96580000	! t0_kref+0x285c:   	smul	%g0, %g0, %o3
	.word	0x97b0003a	! t0_kref+0x2860:   	edge8n	%g0, %i2, %o3
	.word	0xd51fbc28	! t0_kref+0x2864:   	ldd	[%fp - 0x3d8], %f10
	.word	0x95a2c82b	! t0_kref+0x2868:   	fadds	%f11, %f11, %f10
	.word	0xd6567fe4	! t0_kref+0x286c:   	ldsh	[%i1 - 0x1c], %o3
	.word	0x31800004	! t0_kref+0x2870:   	fba,a	_kref+0x2880
	.word	0x96d02b83	! t0_kref+0x2874:   	umulcc	%g0, 0xb83, %o3
	.word	0x97b68240	! t0_kref+0x2878:   	array16	%i2, %g0, %o3
	.word	0x9f414000	! t0_kref+0x287c:   	mov	%pc, %o7
	.word	0x96e68000	! t0_kref+0x2880:   	subccc	%i2, %g0, %o3
	.word	0x95a2894a	! t0_kref+0x2884:   	fmuld	%f10, %f10, %f10
	.word	0x95a2894a	! t0_kref+0x2888:   	fmuld	%f10, %f10, %f10
	.word	0xd6063fec	! t0_kref+0x288c:   	ld	[%i0 - 0x14], %o3
	.word	0x96a68000	! t0_kref+0x2890:   	subcc	%i2, %g0, %o3
	.word	0x9608001a	! t0_kref+0x2894:   	and	%g0, %i2, %o3
	.word	0x9616ad88	! t0_kref+0x2898:   	or	%i2, 0xd88, %o3
	.word	0x9666801a	! t0_kref+0x289c:   	subc	%i2, %i2, %o3
	.word	0xd6063ffc	! t0_kref+0x28a0:   	ld	[%i0 - 4], %o3
	.word	0x96e6a9e2	! t0_kref+0x28a4:   	subccc	%i2, 0x9e2, %o3
	.word	0x95b28e80	! t0_kref+0x28a8:   	fsrc1	%f10, %f10
	.word	0x9638315a	! t0_kref+0x28ac:   	xnor	%g0, -0xea6, %o3
	.word	0x95a2894a	! t0_kref+0x28b0:   	fmuld	%f10, %f10, %f10
	.word	0xd650a036	! t0_kref+0x28b4:   	ldsh	[%g2 + 0x36], %o3
	.word	0xd51f4019	! t0_kref+0x28b8:   	ldd	[%i5 + %i1], %f10
	.word	0x81800000	! t0_kref+0x28bc:   	mov	%g0, %y
	.word	0x97a289ab	! t0_kref+0x28c0:   	fdivs	%f10, %f11, %f11
	.word	0x95b28eeb	! t0_kref+0x28c4:   	fornot2s	%f10, %f11, %f10
	.word	0xe03e001d	! t0_kref+0x28c8:   	std	%l0, [%i0 + %i5]
	.word	0x81aa8a2a	! t0_kref+0x28cc:   	fcmps	%fcc0, %f10, %f10
	.word	0x96beb307	! t0_kref+0x28d0:   	xnorcc	%i2, -0xcf9, %o3
	.word	0x9680001a	! t0_kref+0x28d4:   	addcc	%g0, %i2, %o3
	.word	0x9620001a	! t0_kref+0x28d8:   	neg	%i2, %o3
	.word	0xe66e401a	! t0_kref+0x28dc:   	ldstub	[%i1 + %i2], %l3
	.word	0x97a0012b	! t0_kref+0x28e0:   	fabss	%f11, %f11
	.word	0x9676b89b	! t0_kref+0x28e4:   	udiv	%i2, -0x765, %o3
	.word	0x9730001a	! t0_kref+0x28e8:   	srl	%g0, %i2, %o3
	.word	0x172dd265	! t0_kref+0x28ec:   	sethi	%hi(0xb7499400), %o3
	.word	0xe09e7fe8	! t0_kref+0x28f0:   	ldda	[%i1 - 0x18]%asi, %l0
	.word	0x9650287a	! t0_kref+0x28f4:   	umul	%g0, 0x87a, %o3
	.word	0x96402bcd	! t0_kref+0x28f8:   	addc	%g0, 0xbcd, %o3
	.word	0xd51e2000	! t0_kref+0x28fc:   	ldd	[%i0], %f10
	.word	0x97b68000	! t0_kref+0x2900:   	edge8	%i2, %g0, %o3
	.word	0x96f8357d	! t0_kref+0x2904:   	sdivcc	%g0, -0xa83, %o3
	.word	0x965e8000	! t0_kref+0x2908:   	smul	%i2, %g0, %o3
	.word	0x96503874	! t0_kref+0x290c:   	umul	%g0, -0x78c, %o3
	.word	0x97000000	! t0_kref+0x2910:   	taddcc	%g0, %g0, %o3
	.word	0x96200000	! t0_kref+0x2914:   	neg	%g0, %o3
	.word	0x9666801a	! t0_kref+0x2918:   	subc	%i2, %i2, %o3
	.word	0x8610200b	! t0_kref+0x291c:   	mov	0xb, %g3
	.word	0x86a0e001	! t0_kref+0x2920:   	subcc	%g3, 1, %g3
	.word	0x2280000a	! t0_kref+0x2924:   	be,a	_kref+0x294c
	.word	0x97b00c20	! t0_kref+0x2928:   	fzeros	%f11
	.word	0x97a01a4a	! t0_kref+0x292c:   	fdtoi	%f10, %f11
	.word	0x95a2894a	! t0_kref+0x2930:   	fmuld	%f10, %f10, %f10
	.word	0x96902e65	! t0_kref+0x2934:   	orcc	%g0, 0xe65, %o3
	.word	0x97400000	! t0_kref+0x2938:   	mov	%y, %o3
	.word	0xd53e401d	! t0_kref+0x293c:   	std	%f10, [%i1 + %i5]
	.word	0xef68a045	! t0_kref+0x2940:   	prefetch	%g2 + 0x45, 23
	.word	0x234ffff7	! t0_kref+0x2944:   	fbne,a,pt	%fcc0, _kref+0x2920
	.word	0xc368a006	! t0_kref+0x2948:   	prefetch	%g2 + 6, 1
	.word	0x97a0052a	! t0_kref+0x294c:   	fsqrts	%f10, %f11
	.word	0x965e801a	! t0_kref+0x2950:   	smul	%i2, %i2, %o3
	.word	0x96f0001a	! t0_kref+0x2954:   	udivcc	%g0, %i2, %o3
	.word	0x961ebe5f	! t0_kref+0x2958:   	xor	%i2, -0x1a1, %o3
	.word	0x96a0001a	! t0_kref+0x295c:   	subcc	%g0, %i2, %o3
	.word	0xd60e4000	! t0_kref+0x2960:   	ldub	[%i1], %o3
	.word	0xd60e3fec	! t0_kref+0x2964:   	ldub	[%i0 - 0x14], %o3
	.word	0x9646ab23	! t0_kref+0x2968:   	addc	%i2, 0xb23, %o3
	.word	0xd6480019	! t0_kref+0x296c:   	ldsb	[%g0 + %i1], %o3
	.word	0x9716ad8f	! t0_kref+0x2970:   	taddcctv	%i2, 0xd8f, %o3
	.word	0x960833d7	! t0_kref+0x2974:   	and	%g0, -0xc29, %o3
	.word	0x96368000	! t0_kref+0x2978:   	orn	%i2, %g0, %o3
	.word	0xd51fbc98	! t0_kref+0x297c:   	ldd	[%fp - 0x368], %f10
	.word	0x97b00300	! t0_kref+0x2980:   	alignaddr	%g0, %g0, %o3
	.word	0x9608277b	! t0_kref+0x2984:   	and	%g0, 0x77b, %o3
	.word	0x95a289ca	! t0_kref+0x2988:   	fdivd	%f10, %f10, %f10
	.word	0x9646a12a	! t0_kref+0x298c:   	addc	%i2, 0x12a, %o3
	.word	0x97b00ceb	! t0_kref+0x2990:   	fnot2s	%f11, %f11
	.word	0xd6066010	! t0_kref+0x2994:   	ld	[%i1 + 0x10], %o3
	.word	0x3f800005	! t0_kref+0x2998:   	fbo,a	_kref+0x29ac
	.word	0xd1be5880	! t0_kref+0x299c:   	stda	%f8, [%i1]0xc4
	.word	0x97a2c82a	! t0_kref+0x29a0:   	fadds	%f11, %f10, %f11
	.word	0x961034fa	! t0_kref+0x29a4:   	mov	0xfffff4fa, %o3
	.word	0x95b2ccab	! t0_kref+0x29a8:   	fandnot2s	%f11, %f11, %f10
	.word	0x001fffff	! t0_kref+0x29ac:   	illtrap	0x1fffff
	.word	0x9658001a	! t0_kref+0x29b0:   	smul	%g0, %i2, %o3
	.word	0x961eacc8	! t0_kref+0x29b4:   	xor	%i2, 0xcc8, %o3
	.word	0x81868000	! t0_kref+0x29b8:   	wr	%i2, %g0, %y
	.word	0xd51e2010	! t0_kref+0x29bc:   	ldd	[%i0 + 0x10], %f10
	.word	0x81aa8aab	! t0_kref+0x29c0:   	fcmpes	%fcc0, %f10, %f11
	.word	0x81aacaaa	! t0_kref+0x29c4:   	fcmpes	%fcc0, %f11, %f10
	.word	0x38480001	! t0_kref+0x29c8:   	bgu,a,pt	%icc, _kref+0x29cc
	.word	0x965eaee2	! t0_kref+0x29cc:   	smul	%i2, 0xee2, %o3
	.word	0x97b68200	! t0_kref+0x29d0:   	array8	%i2, %g0, %o3
	.word	0x96180000	! t0_kref+0x29d4:   	xor	%g0, %g0, %o3
	.word	0xd1bf1a59	! t0_kref+0x29d8:   	stda	%f8, [%i4 + %i1]0xd2
	.word	0x39800005	! t0_kref+0x29dc:   	fbuge,a	_kref+0x29f0
	.word	0xe41e401d	! t0_kref+0x29e0:   	ldd	[%i1 + %i5], %l2
	.word	0x961eae54	! t0_kref+0x29e4:   	xor	%i2, 0xe54, %o3
	.word	0x95a01a4a	! t0_kref+0x29e8:   	fdtoi	%f10, %f10
	.word	0x97b00c20	! t0_kref+0x29ec:   	fzeros	%f11
	.word	0x97002688	! t0_kref+0x29f0:   	taddcc	%g0, 0x688, %o3
	.word	0x9618001a	! t0_kref+0x29f4:   	xor	%g0, %i2, %o3
	.word	0x878020d0	! t0_kref+0x29f8:   	mov	0xd0, %asi
	.word	0x95a0192b	! t0_kref+0x29fc:   	fstod	%f11, %f10
	.word	0x95a2894a	! t0_kref+0x2a00:   	fmuld	%f10, %f10, %f10
	.word	0x86102003	! t0_kref+0x2a04:   	mov	0x3, %g3
	.word	0x86a0e001	! t0_kref+0x2a08:   	subcc	%g3, 1, %g3
	.word	0x2280001f	! t0_kref+0x2a0c:   	be,a	_kref+0x2a88
	.word	0xd616601e	! t0_kref+0x2a10:   	lduh	[%i1 + 0x1e], %o3
	.word	0x95a0012a	! t0_kref+0x2a14:   	fabss	%f10, %f10
	.word	0x96a0327b	! t0_kref+0x2a18:   	subcc	%g0, -0xd85, %o3
	.word	0x3a800005	! t0_kref+0x2a1c:   	bcc,a	_kref+0x2a30
	.word	0x96b00000	! t0_kref+0x2a20:   	orncc	%g0, %g0, %o3
	.word	0x9696b04c	! t0_kref+0x2a24:   	orcc	%i2, -0xfb4, %o3
	.word	0x3b800005	! t0_kref+0x2a28:   	fble,a	_kref+0x2a3c
	.word	0x96800000	! t0_kref+0x2a2c:   	addcc	%g0, %g0, %o3
	.word	0x95b28d40	! t0_kref+0x2a30:   	fnot1	%f10, %f10
	.word	0x97a0012b	! t0_kref+0x2a34:   	fabss	%f11, %f11
	.word	0x95b2874a	! t0_kref+0x2a38:   	fpack32	%f10, %f10, %f10
	.word	0x2a800007	! t0_kref+0x2a3c:   	bcs,a	_kref+0x2a58
	.word	0xe96e6000	! t0_kref+0x2a40:   	prefetch	%i1, 20
	.word	0xd6c01018	! t0_kref+0x2a44:   	ldswa	[%g0 + %i0]0x80, %o3
	.word	0xc0f65000	! t0_kref+0x2a48:   	stxa	%g0, [%i1]0x80
	.word	0x95b00fc0	! t0_kref+0x2a4c:   	fone	%f10
	.word	0x961eb492	! t0_kref+0x2a50:   	xor	%i2, -0xb6e, %o3
	.word	0x961e8000	! t0_kref+0x2a54:   	xor	%i2, %g0, %o3
	.word	0x97400000	! t0_kref+0x2a58:   	mov	%y, %o3
	.word	0x9618001a	! t0_kref+0x2a5c:   	xor	%g0, %i2, %o3
	.word	0xd6063fe4	! t0_kref+0x2a60:   	ld	[%i0 - 0x1c], %o3
	.word	0x95a0054a	! t0_kref+0x2a64:   	fsqrtd	%f10, %f10
	.word	0x95a2882a	! t0_kref+0x2a68:   	fadds	%f10, %f10, %f10
	.word	0x95a2894a	! t0_kref+0x2a6c:   	fmuld	%f10, %f10, %f10
	.word	0xd1be1880	! t0_kref+0x2a70:   	stda	%f8, [%i0]0xc4
	.word	0x17218046	! t0_kref+0x2a74:   	sethi	%hi(0x86011800), %o3
	.word	0x95b2870a	! t0_kref+0x2a78:   	fmuld8sux16	%f10, %f10, %f10
	.word	0xd51e6000	! t0_kref+0x2a7c:   	ldd	[%i1], %f10
	.word	0xe01f4019	! t0_kref+0x2a80:   	ldd	[%i5 + %i1], %l0
	.word	0x97a2c9ab	! t0_kref+0x2a84:   	fdivs	%f11, %f11, %f11
	.word	0x95a0192a	! t0_kref+0x2a88:   	fstod	%f10, %f10
	.word	0xd51e7ff8	! t0_kref+0x2a8c:   	ldd	[%i1 - 8], %f10
	.word	0x81580000	! t0_kref+0x2a90:   	flushw
	.word	0x96982cd8	! t0_kref+0x2a94:   	xorcc	%g0, 0xcd8, %o3
	.word	0x9686801a	! t0_kref+0x2a98:   	addcc	%i2, %i2, %o3
	.word	0x9620001a	! t0_kref+0x2a9c:   	neg	%i2, %o3
	.word	0x95b00c20	! t0_kref+0x2aa0:   	fzeros	%f10
	.word	0x97a0188b	! t0_kref+0x2aa4:   	fitos	%f11, %f11
	.word	0x95b2c72b	! t0_kref+0x2aa8:   	fmuld8ulx16	%f11, %f11, %f10
	.word	0x95a0054a	! t0_kref+0x2aac:   	fsqrtd	%f10, %f10
	.word	0x97302009	! t0_kref+0x2ab0:   	srl	%g0, 0x9, %o3
	.word	0x3c480006	! t0_kref+0x2ab4:   	bpos,a,pt	%icc, _kref+0x2acc
	.word	0x9676801a	! t0_kref+0x2ab8:   	udiv	%i2, %i2, %o3
	.word	0x97b00100	! t0_kref+0x2abc:   	edge32	%g0, %g0, %o3
	.word	0x97b00000	! t0_kref+0x2ac0:   	edge8	%g0, %g0, %o3
	.word	0x97a2c9aa	! t0_kref+0x2ac4:   	fdivs	%f11, %f10, %f11
	.word	0x96582b28	! t0_kref+0x2ac8:   	smul	%g0, 0xb28, %o3
	.word	0x971e801a	! t0_kref+0x2acc:   	tsubcctv	%i2, %i2, %o3
	.word	0x95a2894a	! t0_kref+0x2ad0:   	fmuld	%f10, %f10, %f10
	.word	0x95a0192a	! t0_kref+0x2ad4:   	fstod	%f10, %f10
	.word	0x96502c7e	! t0_kref+0x2ad8:   	umul	%g0, 0xc7e, %o3
	.word	0xd656401b	! t0_kref+0x2adc:   	ldsh	[%i1 + %i3], %o3
	.word	0x95a018ca	! t0_kref+0x2ae0:   	fdtos	%f10, %f10
	.word	0x95b2874a	! t0_kref+0x2ae4:   	fpack32	%f10, %f10, %f10
	.word	0x96c68000	! t0_kref+0x2ae8:   	addccc	%i2, %g0, %o3
	.word	0x95a0054a	! t0_kref+0x2aec:   	fsqrtd	%f10, %f10
	.word	0xc56e001a	! t0_kref+0x2af0:   	prefetch	%i0 + %i2, 2
	.word	0x97b2858a	! t0_kref+0x2af4:   	fcmpgt32	%f10, %f10, %o3
	.word	0x9726801a	! t0_kref+0x2af8:   	mulscc	%i2, %i2, %o3
	.word	0x97a000ab	! t0_kref+0x2afc:   	fnegs	%f11, %f11
	.word	0x96aeb872	! t0_kref+0x2b00:   	andncc	%i2, -0x78e, %o3
	.word	0xd6164000	! t0_kref+0x2b04:   	lduh	[%i1], %o3
	.word	0x97a0052a	! t0_kref+0x2b08:   	fsqrts	%f10, %f11
	.word	0xf4262018	! t0_kref+0x2b0c:   	st	%i2, [%i0 + 0x18]
	.word	0x96282d13	! t0_kref+0x2b10:   	andn	%g0, 0xd13, %o3
	.word	0x97a01a4a	! t0_kref+0x2b14:   	fdtoi	%f10, %f11
	.word	0x37800008	! t0_kref+0x2b18:   	fbge,a	_kref+0x2b38
	.word	0x95a0054a	! t0_kref+0x2b1c:   	fsqrtd	%f10, %f10
	.word	0xe03e3fe0	! t0_kref+0x2b20:   	std	%l0, [%i0 - 0x20]
	.word	0x96203991	! t0_kref+0x2b24:   	sub	%g0, -0x66f, %o3
	.word	0x96868000	! t0_kref+0x2b28:   	addcc	%i2, %g0, %o3
	.word	0xd6560000	! t0_kref+0x2b2c:   	ldsh	[%i0], %o3
	.word	0xe03f4018	! t0_kref+0x2b30:   	std	%l0, [%i5 + %i0]
	.word	0xd6901018	! t0_kref+0x2b34:   	lduha	[%g0 + %i0]0x80, %o3
	.word	0x96600000	! t0_kref+0x2b38:   	subc	%g0, %g0, %o3
	.word	0x95a28d2b	! t0_kref+0x2b3c:   	fsmuld	%f10, %f11, %f10
	.word	0x85800000	! t0_kref+0x2b40:   	mov	%g0, %ccr
	.word	0x9736a012	! t0_kref+0x2b44:   	srl	%i2, 0x12, %o3
	.word	0x97280000	! t0_kref+0x2b48:   	sll	%g0, %g0, %o3
	.word	0x9666b2da	! t0_kref+0x2b4c:   	subc	%i2, -0xd26, %o3
	.word	0x96f6bf6f	! t0_kref+0x2b50:   	udivcc	%i2, -0x91, %o3
	call	SYM(t0_subr0)
	.word	0x95a0192b	! t0_kref+0x2b58:   	fstod	%f11, %f10
	.word	0x96f02680	! t0_kref+0x2b5c:   	udivcc	%g0, 0x680, %o3
	.word	0x95a0192b	! t0_kref+0x2b60:   	fstod	%f11, %f10
	.word	0x97b00fe0	! t0_kref+0x2b64:   	fones	%f11
	.word	0x97400000	! t0_kref+0x2b68:   	mov	%y, %o3
	.word	0x96668000	! t0_kref+0x2b6c:   	subc	%i2, %g0, %o3
	.word	0x97b000a0	! t0_kref+0x2b70:   	edge16n	%g0, %g0, %o3
	.word	0x97b68280	! t0_kref+0x2b74:   	array32	%i2, %g0, %o3
	.word	0x96a03e6a	! t0_kref+0x2b78:   	subcc	%g0, -0x196, %o3
	.word	0x97418000	! t0_kref+0x2b7c:   	mov	%fprs, %o3
	.word	0x97b28ea0	! t0_kref+0x2b80:   	fsrc1s	%f10, %f11
	.word	0xf436001b	! t0_kref+0x2b84:   	sth	%i2, [%i0 + %i3]
	.word	0x96800000	! t0_kref+0x2b88:   	addcc	%g0, %g0, %o3
	.word	0x965e8000	! t0_kref+0x2b8c:   	smul	%i2, %g0, %o3
	.word	0x96f0001a	! t0_kref+0x2b90:   	udivcc	%g0, %i2, %o3
	.word	0x96f6801a	! t0_kref+0x2b94:   	udivcc	%i2, %i2, %o3
	.word	0x25800004	! t0_kref+0x2b98:   	fblg,a	_kref+0x2ba8
	.word	0x95a01a4a	! t0_kref+0x2b9c:   	fdtoi	%f10, %f10
	.word	0x81aa8a4a	! t0_kref+0x2ba0:   	fcmpd	%fcc0, %f10, %f10
	.word	0x96be801a	! t0_kref+0x2ba4:   	xnorcc	%i2, %i2, %o3
	.word	0x95a2894a	! t0_kref+0x2ba8:   	fmuld	%f10, %f10, %f10
	.word	0xc0270019	! t0_kref+0x2bac:   	clr	[%i4 + %i1]
	.word	0x97408000	! t0_kref+0x2bb0:   	mov	%ccr, %o3
	.word	0x95a0052a	! t0_kref+0x2bb4:   	fsqrts	%f10, %f10
	.word	0x95b00cca	! t0_kref+0x2bb8:   	fnot2	%f10, %f10
	.word	0xd5e6101a	! t0_kref+0x2bbc:   	casa	[%i0]0x80, %i2, %o2
	.word	0x96a02ca8	! t0_kref+0x2bc0:   	subcc	%g0, 0xca8, %o3
	.word	0x9696a4c6	! t0_kref+0x2bc4:   	orcc	%i2, 0x4c6, %o3
	.word	0x96e02515	! t0_kref+0x2bc8:   	subccc	%g0, 0x515, %o3
	.word	0x95a0192a	! t0_kref+0x2bcc:   	fstod	%f10, %f10
	.word	0x97a0188b	! t0_kref+0x2bd0:   	fitos	%f11, %f11
	.word	0x81dd001d	! t0_kref+0x2bd4:   	flush	%l4 + %i5
	.word	0x8143c000	! t0_kref+0x2bd8:   	stbar
	.word	0x81dc4008	! t0_kref+0x2bdc:   	flush	%l1 + %o0
	.word	0x95b28d0a	! t0_kref+0x2be0:   	fandnot1	%f10, %f10, %f10
	.word	0x81aa8aaa	! t0_kref+0x2be4:   	fcmpes	%fcc0, %f10, %f10
	.word	0x95a0012b	! t0_kref+0x2be8:   	fabss	%f11, %f10
	.word	0xd6df5019	! t0_kref+0x2bec:   	ldxa	[%i5 + %i1]0x80, %o3
	.word	0x95b00fe0	! t0_kref+0x2bf0:   	fones	%f10
	.word	0x81b01020	! t0_kref+0x2bf4:   	siam	0x0
	.word	0x97b00fe0	! t0_kref+0x2bf8:   	fones	%f11
	.word	0x8143c000	! t0_kref+0x2bfc:   	stbar
	.word	0x8143c000	! t0_kref+0x2c00:   	stbar
	.word	0x8143c000	! t0_kref+0x2c04:   	stbar
	.word	0xe56e2010	! t0_kref+0x2c08:   	prefetch	%i0 + 0x10, 18
	.word	0x2c800004	! t0_kref+0x2c0c:   	bneg,a	_kref+0x2c1c
	.word	0x97202a5c	! t0_kref+0x2c10:   	mulscc	%g0, 0xa5c, %o3
	.word	0xd5a71019	! t0_kref+0x2c14:   	sta	%f10, [%i4 + %i1]0x80
	.word	0x95a0192b	! t0_kref+0x2c18:   	fstod	%f11, %f10
	.word	0xd64e200e	! t0_kref+0x2c1c:   	ldsb	[%i0 + 0xe], %o3
	.word	0x97a0188a	! t0_kref+0x2c20:   	fitos	%f10, %f11
	.word	0x96f00000	! t0_kref+0x2c24:   	udivcc	%g0, %g0, %o3
	.word	0x9fc10000	! t0_kref+0x2c28:   	call	%g4
	.word	0xd5180018	! t0_kref+0x2c2c:   	ldd	[%g0 + %i0], %f10
	.word	0x95a2cd2b	! t0_kref+0x2c30:   	fsmuld	%f11, %f11, %f10
	.word	0xd6901018	! t0_kref+0x2c34:   	lduha	[%g0 + %i0]0x80, %o3
	.word	0xe43e2008	! t0_kref+0x2c38:   	std	%l2, [%i0 + 8]
	.word	0x97b68200	! t0_kref+0x2c3c:   	array8	%i2, %g0, %o3
	.word	0xef68a00b	! t0_kref+0x2c40:   	prefetch	%g2 + 0xb, 23
	.word	0xd726001c	! t0_kref+0x2c44:   	st	%f11, [%i0 + %i4]
	.word	0x81aacaaa	! t0_kref+0x2c48:   	fcmpes	%fcc0, %f11, %f10
	.word	0x83414000	! t0_kref+0x2c4c:   	mov	%pc, %g1
	.word	0x95a0004a	! t0_kref+0x2c50:   	fmovd	%f10, %f10
	.word	0x96f80000	! t0_kref+0x2c54:   	sdivcc	%g0, %g0, %o3
	.word	0x95a2884a	! t0_kref+0x2c58:   	faddd	%f10, %f10, %f10
	.word	0xd616001b	! t0_kref+0x2c5c:   	lduh	[%i0 + %i3], %o3
	.word	0x97382000	! t0_kref+0x2c60:   	sra	%g0, 0x0, %o3
	.word	0xd6de1000	! t0_kref+0x2c64:   	ldxa	[%i0]0x80, %o3
	.word	0x9736a016	! t0_kref+0x2c68:   	srl	%i2, 0x16, %o3
	.word	0x95b00f0a	! t0_kref+0x2c6c:   	fsrc2	%f10, %f10
	.word	0x95b28f8a	! t0_kref+0x2c70:   	for	%f10, %f10, %f10
	.word	0xd068a017	! t0_kref+0x2c74:   	ldstub	[%g2 + 0x17], %o0
	.word	0x9696b8c3	! t0_kref+0x2c78:   	orcc	%i2, -0x73d, %o3
	.word	0xd51e7ff0	! t0_kref+0x2c7c:   	ldd	[%i1 - 0x10], %f10
	.word	0x95a0054a	! t0_kref+0x2c80:   	fsqrtd	%f10, %f10
	.word	0x17368936	! t0_kref+0x2c84:   	sethi	%hi(0xda24d800), %o3
	.word	0xd64e2003	! t0_kref+0x2c88:   	ldsb	[%i0 + 3], %o3
	.word	0x961ea1ab	! t0_kref+0x2c8c:   	xor	%i2, 0x1ab, %o3
	.word	0x9736801a	! t0_kref+0x2c90:   	srl	%i2, %i2, %o3
	.word	0x9658289b	! t0_kref+0x2c94:   	smul	%g0, 0x89b, %o3
	.word	0x9726ab29	! t0_kref+0x2c98:   	mulscc	%i2, 0xb29, %o3
	.word	0x97b0031a	! t0_kref+0x2c9c:   	alignaddr	%g0, %i2, %o3
	.word	0x960eb317	! t0_kref+0x2ca0:   	and	%i2, -0xce9, %o3
	.word	0xb4102016	! t0_kref+0x2ca4:   	mov	0x16, %i2
	.word	0x17344bdc	! t0_kref+0x2ca8:   	sethi	%hi(0xd12f7000), %o3
	.word	0xd606401c	! t0_kref+0x2cac:   	ld	[%i1 + %i4], %o3
	.word	0x95b28a4a	! t0_kref+0x2cb0:   	fpadd32	%f10, %f10, %f10
	.word	0x96f6801a	! t0_kref+0x2cb4:   	udivcc	%i2, %i2, %o3
	.word	0xe01e401d	! t0_kref+0x2cb8:   	ldd	[%i1 + %i5], %l0
	.word	0xe01e7fe0	! t0_kref+0x2cbc:   	ldd	[%i1 - 0x20], %l0
	.word	0x21480005	! t0_kref+0x2cc0:   	fbn,a,pt	%fcc0, _kref+0x2cd4
	.word	0x97b2848a	! t0_kref+0x2cc4:   	fcmple32	%f10, %f10, %o3
	.word	0x96be8000	! t0_kref+0x2cc8:   	xnorcc	%i2, %g0, %o3
	.word	0x97b2848a	! t0_kref+0x2ccc:   	fcmple32	%f10, %f10, %o3
	.word	0xe01e4000	! t0_kref+0x2cd0:   	ldd	[%i1], %l0
	.word	0xe41e401d	! t0_kref+0x2cd4:   	ldd	[%i1 + %i5], %l2
	.word	0x9fc00004	! t0_kref+0x2cd8:   	call	%g0 + %g4
	.word	0x95b28f8a	! t0_kref+0x2cdc:   	for	%f10, %f10, %f10
	.word	0x95a2cd2b	! t0_kref+0x2ce0:   	fsmuld	%f11, %f11, %f10
	.word	0x95a0002a	! t0_kref+0x2ce4:   	fmovs	%f10, %f10
	.word	0x96e0001a	! t0_kref+0x2ce8:   	subccc	%g0, %i2, %o3
	.word	0xe03f4019	! t0_kref+0x2cec:   	std	%l0, [%i5 + %i1]
	.word	0x95b2862a	! t0_kref+0x2cf0:   	fmul8x16	%f10, %f10, %f10
	.word	0xd7263ffc	! t0_kref+0x2cf4:   	st	%f11, [%i0 - 4]
	.word	0x9736a008	! t0_kref+0x2cf8:   	srl	%i2, 0x8, %o3
	.word	0x97a289aa	! t0_kref+0x2cfc:   	fdivs	%f10, %f10, %f11
	.word	0x96e68000	! t0_kref+0x2d00:   	subccc	%i2, %g0, %o3
	.word	0xd51e0000	! t0_kref+0x2d04:   	ldd	[%i0], %f10
	.word	0x961eaaf2	! t0_kref+0x2d08:   	xor	%i2, 0xaf2, %o3
	.word	0x9638206d	! t0_kref+0x2d0c:   	xnor	%g0, 0x6d, %o3
	.word	0x9660001a	! t0_kref+0x2d10:   	subc	%g0, %i2, %o3
	.word	0x96580000	! t0_kref+0x2d14:   	smul	%g0, %g0, %o3
	.word	0x95a0012b	! t0_kref+0x2d18:   	fabss	%f11, %f10
	.word	0x81580000	! t0_kref+0x2d1c:   	flushw
	.word	0x97b68280	! t0_kref+0x2d20:   	array32	%i2, %g0, %o3
	.word	0x97b28f6b	! t0_kref+0x2d24:   	fornot1s	%f10, %f11, %f11
	call	1f
	.empty
	.word	0x97b6831a	! t0_kref+0x2d2c:   	alignaddr	%i2, %i2, %o3
1:	.word	0x97b6805a	! t0_kref+0x2d30:   	edge8l	%i2, %i2, %o3
	.word	0xd51fbeb0	! t0_kref+0x2d34:   	ldd	[%fp - 0x150], %f10
	.word	0x3b480008	! t0_kref+0x2d38:   	fble,a,pt	%fcc0, _kref+0x2d58
	.word	0x95b2c66a	! t0_kref+0x2d3c:   	fmul8x16au	%f11, %f10, %f10
	.word	0x960e8000	! t0_kref+0x2d40:   	and	%i2, %g0, %o3
	.word	0xf4a6101c	! t0_kref+0x2d44:   	sta	%i2, [%i0 + %i4]0x80
	.word	0x95b28a4a	! t0_kref+0x2d48:   	fpadd32	%f10, %f10, %f10
	.word	0x27800008	! t0_kref+0x2d4c:   	fbul,a	_kref+0x2d6c
	.word	0x8143c000	! t0_kref+0x2d50:   	stbar
	.word	0xd60e2001	! t0_kref+0x2d54:   	ldub	[%i0 + 1], %o3
	.word	0x96568000	! t0_kref+0x2d58:   	umul	%i2, %g0, %o3
	.word	0x97408000	! t0_kref+0x2d5c:   	mov	%ccr, %o3
	.word	0x969e801a	! t0_kref+0x2d60:   	xorcc	%i2, %i2, %o3
	.word	0xd51e7fe0	! t0_kref+0x2d64:   	ldd	[%i1 - 0x20], %f10
	.word	0xec6e3fec	! t0_kref+0x2d68:   	ldstub	[%i0 - 0x14], %l6
	.word	0x97a2882a	! t0_kref+0x2d6c:   	fadds	%f10, %f10, %f11
	.word	0x96868000	! t0_kref+0x2d70:   	addcc	%i2, %g0, %o3
	.word	0x81aacaab	! t0_kref+0x2d74:   	fcmpes	%fcc0, %f11, %f11
	.word	0x97b2850a	! t0_kref+0x2d78:   	fcmpgt16	%f10, %f10, %o3
	.word	0x9fc10000	! t0_kref+0x2d7c:   	call	%g4
	.word	0x9690001a	! t0_kref+0x2d80:   	orcc	%g0, %i2, %o3
	.word	0x97a2882a	! t0_kref+0x2d84:   	fadds	%f10, %f10, %f11
	.word	0x96a6aa40	! t0_kref+0x2d88:   	subcc	%i2, 0xa40, %o3
	.word	0xe09e101d	! t0_kref+0x2d8c:   	ldda	[%i0 + %i5]0x80, %l0
	.word	0x86102001	! t0_kref+0x2d90:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x2d94:   	bne,a	_kref+0x2d94
	.word	0x86a0e001	! t0_kref+0x2d98:   	subcc	%g3, 1, %g3
	.word	0x9610001a	! t0_kref+0x2d9c:   	mov	%i2, %o3
	.word	0x95a0054a	! t0_kref+0x2da0:   	fsqrtd	%f10, %f10
	.word	0x95a0192a	! t0_kref+0x2da4:   	fstod	%f10, %f10
	.word	0x9fc10000	! t0_kref+0x2da8:   	call	%g4
	.word	0x960ea466	! t0_kref+0x2dac:   	and	%i2, 0x466, %o3
	.word	0xb8102014	! t0_kref+0x2db0:   	mov	0x14, %i4
	.word	0x3b800004	! t0_kref+0x2db4:   	fble,a	_kref+0x2dc4
	.word	0x97b2ce6b	! t0_kref+0x2db8:   	fxnors	%f11, %f11, %f11
	.word	0xd51e401d	! t0_kref+0x2dbc:   	ldd	[%i1 + %i5], %f10
	.word	0x9736801a	! t0_kref+0x2dc0:   	srl	%i2, %i2, %o3
	.word	0x95a0188a	! t0_kref+0x2dc4:   	fitos	%f10, %f10
	.word	0x95b00f2a	! t0_kref+0x2dc8:   	fsrc2s	%f10, %f10
	.word	0x95a2894a	! t0_kref+0x2dcc:   	fmuld	%f10, %f10, %f10
	.word	0x170d7787	! t0_kref+0x2dd0:   	sethi	%hi(0x35de1c00), %o3
	.word	0x96400000	! t0_kref+0x2dd4:   	addc	%g0, %g0, %o3
	.word	0x960830af	! t0_kref+0x2dd8:   	and	%g0, -0xf51, %o3
	.word	0x95a000aa	! t0_kref+0x2ddc:   	fnegs	%f10, %f10
	.word	0x95b28e80	! t0_kref+0x2de0:   	fsrc1	%f10, %f10
	.word	0x97a0012b	! t0_kref+0x2de4:   	fabss	%f11, %f11
	.word	0x95a288ca	! t0_kref+0x2de8:   	fsubd	%f10, %f10, %f10
	.word	0x95b2870a	! t0_kref+0x2dec:   	fmuld8sux16	%f10, %f10, %f10
	.word	0x96180000	! t0_kref+0x2df0:   	xor	%g0, %g0, %o3
	.word	0x81aacaab	! t0_kref+0x2df4:   	fcmpes	%fcc0, %f11, %f11
	.word	0x97a01a4a	! t0_kref+0x2df8:   	fdtoi	%f10, %f11
	.word	0xd5180019	! t0_kref+0x2dfc:   	ldd	[%g0 + %i1], %f10
	.word	0x968e801a	! t0_kref+0x2e00:   	andcc	%i2, %i2, %o3
	.word	0xd1be1800	! t0_kref+0x2e04:   	stda	%f8, [%i0]0xc0
	.word	0x960eb69e	! t0_kref+0x2e08:   	and	%i2, -0x962, %o3
	.word	0x9636801a	! t0_kref+0x2e0c:   	orn	%i2, %i2, %o3
	.word	0xd64e3ff4	! t0_kref+0x2e10:   	ldsb	[%i0 - 0xc], %o3
	.word	0x86102004	! t0_kref+0x2e14:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x2e18:   	bne,a	_kref+0x2e18
	.word	0x86a0e001	! t0_kref+0x2e1c:   	subcc	%g3, 1, %g3
	.word	0x95b28e2b	! t0_kref+0x2e20:   	fands	%f10, %f11, %f10
	.word	0x96b828cc	! t0_kref+0x2e24:   	xnorcc	%g0, 0x8cc, %o3
	.word	0x961e801a	! t0_kref+0x2e28:   	xor	%i2, %i2, %o3
	.word	0x81aa8aab	! t0_kref+0x2e2c:   	fcmpes	%fcc0, %f10, %f11
	.word	0x9764e692	! t0_kref+0x2e30:   	movl	%icc, -0x16e, %o3
	.word	0xe41e7ff8	! t0_kref+0x2e34:   	ldd	[%i1 - 8], %l2
	.word	0x8143c000	! t0_kref+0x2e38:   	stbar
	.word	0x95a0002a	! t0_kref+0x2e3c:   	fmovs	%f10, %f10
	.word	0x96d6b90a	! t0_kref+0x2e40:   	umulcc	%i2, -0x6f6, %o3
	.word	0xd5380019	! t0_kref+0x2e44:   	std	%f10, [%g0 + %i1]
	.word	0x95a0192b	! t0_kref+0x2e48:   	fstod	%f11, %f10
	.word	0x95b2872a	! t0_kref+0x2e4c:   	fmuld8ulx16	%f10, %f10, %f10
	.word	0xc12e6018	! t0_kref+0x2e50:   	st	%fsr, [%i1 + 0x18]
	.word	0x95b2898a	! t0_kref+0x2e54:   	bshuffle	%f10, %f10, %f10
	.word	0x96f6b038	! t0_kref+0x2e58:   	udivcc	%i2, -0xfc8, %o3
	.word	0x964023ac	! t0_kref+0x2e5c:   	addc	%g0, 0x3ac, %o3
	.word	0x96fe801a	! t0_kref+0x2e60:   	sdivcc	%i2, %i2, %o3
	.word	0xe43e6010	! t0_kref+0x2e64:   	std	%l2, [%i1 + 0x10]
	.word	0xf4300019	! t0_kref+0x2e68:   	sth	%i2, [%g0 + %i1]
	.word	0xf436401b	! t0_kref+0x2e6c:   	sth	%i2, [%i1 + %i3]
	.word	0x95b28e4a	! t0_kref+0x2e70:   	fxnor	%f10, %f10, %f10
	.word	0xd51e3ff0	! t0_kref+0x2e74:   	ldd	[%i0 - 0x10], %f10
	.word	0x95b28e0a	! t0_kref+0x2e78:   	fand	%f10, %f10, %f10
	.word	0xd51fbc50	! t0_kref+0x2e7c:   	ldd	[%fp - 0x3b0], %f10
	.word	0xc16e0000	! t0_kref+0x2e80:   	prefetch	%i0, 0
	.word	0x97b00140	! t0_kref+0x2e84:   	edge32l	%g0, %g0, %o3
	.word	0xc168a00f	! t0_kref+0x2e88:   	prefetch	%g2 + 0xf, 0
	.word	0x1733f1bf	! t0_kref+0x2e8c:   	sethi	%hi(0xcfc6fc00), %o3
	.word	0xe49e1000	! t0_kref+0x2e90:   	ldda	[%i0]0x80, %l2
	.word	0x95a2884a	! t0_kref+0x2e94:   	faddd	%f10, %f10, %f10
	.word	0x97408000	! t0_kref+0x2e98:   	mov	%ccr, %o3
	.word	0xd51fbf88	! t0_kref+0x2e9c:   	ldd	[%fp - 0x78], %f10
	.word	0xd6de1000	! t0_kref+0x2ea0:   	ldxa	[%i0]0x80, %o3
	.word	0x9726a176	! t0_kref+0x2ea4:   	mulscc	%i2, 0x176, %o3
	.word	0x9728201c	! t0_kref+0x2ea8:   	sll	%g0, 0x1c, %o3
	.word	0x96b00000	! t0_kref+0x2eac:   	orncc	%g0, %g0, %o3
	.word	0x97400000	! t0_kref+0x2eb0:   	mov	%y, %o3
	.word	0xd616600c	! t0_kref+0x2eb4:   	lduh	[%i1 + 0xc], %o3
	.word	0x967eb0a8	! t0_kref+0x2eb8:   	sdiv	%i2, -0xf58, %o3
	.word	0xd598105d	! t0_kref+0x2ebc:   	ldda	[%g0 + %i5]0x82, %f10
	.word	0x96f0326a	! t0_kref+0x2ec0:   	udivcc	%g0, -0xd96, %o3
	.word	0x3d800004	! t0_kref+0x2ec4:   	fbule,a	_kref+0x2ed4
	.word	0x97b00300	! t0_kref+0x2ec8:   	alignaddr	%g0, %g0, %o3
	.word	0x97382000	! t0_kref+0x2ecc:   	sra	%g0, 0x0, %o3
	.word	0x96a80000	! t0_kref+0x2ed0:   	andncc	%g0, %g0, %o3
	.word	0x96f0001a	! t0_kref+0x2ed4:   	udivcc	%g0, %i2, %o3
	.word	0x81aa8aab	! t0_kref+0x2ed8:   	fcmpes	%fcc0, %f10, %f11
	.word	0xd5981019	! t0_kref+0x2edc:   	ldda	[%g0 + %i1]0x80, %f10
	.word	0x21800008	! t0_kref+0x2ee0:   	fbn,a	_kref+0x2f00
	.word	0xd616c019	! t0_kref+0x2ee4:   	lduh	[%i3 + %i1], %o3
	.word	0xc028a01f	! t0_kref+0x2ee8:   	clrb	[%g2 + 0x1f]
	.word	0x9738001a	! t0_kref+0x2eec:   	sra	%g0, %i2, %o3
	.word	0x97400000	! t0_kref+0x2ef0:   	mov	%y, %o3
	.word	0xd3e6101a	! t0_kref+0x2ef4:   	casa	[%i0]0x80, %i2, %o1
	.word	0x96f03ddc	! t0_kref+0x2ef8:   	udivcc	%g0, -0x224, %o3
	.word	0x96582822	! t0_kref+0x2efc:   	smul	%g0, 0x822, %o3
	.word	0x96f034f3	! t0_kref+0x2f00:   	udivcc	%g0, -0xb0d, %o3
	.word	0xd6563ff6	! t0_kref+0x2f04:   	ldsh	[%i0 - 0xa], %o3
	.word	0x96e03616	! t0_kref+0x2f08:   	subccc	%g0, -0x9ea, %o3
	.word	0x3e800004	! t0_kref+0x2f0c:   	bvc,a	_kref+0x2f1c
	.word	0x95b28e4a	! t0_kref+0x2f10:   	fxnor	%f10, %f10, %f10
	.word	0x31480006	! t0_kref+0x2f14:   	fba,a,pt	%fcc0, _kref+0x2f2c
	.word	0xd656600e	! t0_kref+0x2f18:   	ldsh	[%i1 + 0xe], %o3
	.word	0x95a2884a	! t0_kref+0x2f1c:   	faddd	%f10, %f10, %f10
	.word	0x95a0192a	! t0_kref+0x2f20:   	fstod	%f10, %f10
	.word	0xd656601c	! t0_kref+0x2f24:   	ldsh	[%i1 + 0x1c], %o3
	.word	0x97b2858a	! t0_kref+0x2f28:   	fcmpgt32	%f10, %f10, %o3
	.word	0x8610200a	! t0_kref+0x2f2c:   	mov	0xa, %g3
	.word	0x86a0e001	! t0_kref+0x2f30:   	subcc	%g3, 1, %g3
	.word	0x22800001	! t0_kref+0x2f34:   	be,a	_kref+0x2f38
	.word	0x968eb2b8	! t0_kref+0x2f38:   	andcc	%i2, -0xd48, %o3
	.word	0xd6562004	! t0_kref+0x2f3c:   	ldsh	[%i0 + 4], %o3
	.word	0xd1be1800	! t0_kref+0x2f40:   	stda	%f8, [%i0]0xc0
	.word	0x97b6809a	! t0_kref+0x2f44:   	edge16	%i2, %i2, %o3
	.word	0xe09e101d	! t0_kref+0x2f48:   	ldda	[%i0 + %i5]0x80, %l0
	.word	0x97b000c0	! t0_kref+0x2f4c:   	edge16l	%g0, %g0, %o3
	.word	0x81aacaab	! t0_kref+0x2f50:   	fcmpes	%fcc0, %f11, %f11
	.word	0x9640001a	! t0_kref+0x2f54:   	addc	%g0, %i2, %o3
	.word	0x9610001a	! t0_kref+0x2f58:   	mov	%i2, %o3
	.word	0x878020d0	! t0_kref+0x2f5c:   	mov	0xd0, %asi
	.word	0x95a2894a	! t0_kref+0x2f60:   	fmuld	%f10, %f10, %f10
	.word	0xd60e2009	! t0_kref+0x2f64:   	ldub	[%i0 + 9], %o3
	.word	0x96083342	! t0_kref+0x2f68:   	and	%g0, -0xcbe, %o3
	.word	0x97400000	! t0_kref+0x2f6c:   	mov	%y, %o3
	.word	0xd51e001d	! t0_kref+0x2f70:   	ldd	[%i0 + %i5], %f10
	.word	0x95a01a2b	! t0_kref+0x2f74:   	fstoi	%f11, %f10
	.word	0x95a018ca	! t0_kref+0x2f78:   	fdtos	%f10, %f10
	.word	0x9fc10000	! t0_kref+0x2f7c:   	call	%g4
	.word	0x97b2cdaa	! t0_kref+0x2f80:   	fxors	%f11, %f10, %f11
	.word	0x96f02057	! t0_kref+0x2f84:   	udivcc	%g0, 0x57, %o3
	.word	0xe43e4000	! t0_kref+0x2f88:   	std	%l2, [%i1]
	.word	0xd6d6501b	! t0_kref+0x2f8c:   	ldsha	[%i1 + %i3]0x80, %o3
	.word	0x81aa8aca	! t0_kref+0x2f90:   	fcmped	%fcc0, %f10, %f10
	.word	0x95b28d0a	! t0_kref+0x2f94:   	fandnot1	%f10, %f10, %f10
	.word	0x95b286ea	! t0_kref+0x2f98:   	fmul8ulx16	%f10, %f10, %f10
	.word	0xf207bfe0	! t0_kref+0x2f9c:   	ld	[%fp - 0x20], %i1
	.word	0x9618001a	! t0_kref+0x2fa0:   	xor	%g0, %i2, %o3
	.word	0x95a2894a	! t0_kref+0x2fa4:   	fmuld	%f10, %f10, %f10
	.word	0xc0ae101a	! t0_kref+0x2fa8:   	stba	%g0, [%i0 + %i2]0x80
	.word	0xd6500019	! t0_kref+0x2fac:   	ldsh	[%g0 + %i1], %o3
	.word	0xe4981019	! t0_kref+0x2fb0:   	ldda	[%g0 + %i1]0x80, %l2
	.word	0xd5a71018	! t0_kref+0x2fb4:   	sta	%f10, [%i4 + %i0]0x80
	.word	0x96d03d1f	! t0_kref+0x2fb8:   	umulcc	%g0, -0x2e1, %o3
	.word	0x95a0190a	! t0_kref+0x2fbc:   	fitod	%f10, %f10
	.word	0x95a0188b	! t0_kref+0x2fc0:   	fitos	%f11, %f10
	.word	0x972ea008	! t0_kref+0x2fc4:   	sll	%i2, 0x8, %o3
	.word	0xd19f5a18	! t0_kref+0x2fc8:   	ldda	[%i5 + %i0]0xd0, %f8
	.word	0x96e0001a	! t0_kref+0x2fcc:   	subccc	%g0, %i2, %o3
	.word	0x2f800007	! t0_kref+0x2fd0:   	fbu,a	_kref+0x2fec
	.word	0x96f6a264	! t0_kref+0x2fd4:   	udivcc	%i2, 0x264, %o3
	.word	0x95b28d40	! t0_kref+0x2fd8:   	fnot1	%f10, %f10
	.word	0x95a01a2a	! t0_kref+0x2fdc:   	fstoi	%f10, %f10
	.word	0x97a0188b	! t0_kref+0x2fe0:   	fitos	%f11, %f11
	.word	0x96b8001a	! t0_kref+0x2fe4:   	xnorcc	%g0, %i2, %o3
	.word	0xc368a009	! t0_kref+0x2fe8:   	prefetch	%g2 + 9, 1
	.word	0x9738001a	! t0_kref+0x2fec:   	sra	%g0, %i2, %o3
	.word	0x97a2c82b	! t0_kref+0x2ff0:   	fadds	%f11, %f11, %f11
	.word	0x9610226d	! t0_kref+0x2ff4:   	mov	0x26d, %o3
	.word	0x2d800004	! t0_kref+0x2ff8:   	fbg,a	_kref+0x3008
	.word	0xe01e2008	! t0_kref+0x2ffc:   	ldd	[%i0 + 8], %l0
	.word	0xd51e0000	! t0_kref+0x3000:   	ldd	[%i0], %f10
	.word	0x96f0001a	! t0_kref+0x3004:   	udivcc	%g0, %i2, %o3
	.word	0x961eb77c	! t0_kref+0x3008:   	xor	%i2, -0x884, %o3
	.word	0x9728200f	! t0_kref+0x300c:   	sll	%g0, 0xf, %o3
	.word	0x97a01a2a	! t0_kref+0x3010:   	fstoi	%f10, %f11
	.word	0x96703099	! t0_kref+0x3014:   	udiv	%g0, -0xf67, %o3
	.word	0x9660001a	! t0_kref+0x3018:   	subc	%g0, %i2, %o3
	.word	0xd5871018	! t0_kref+0x301c:   	lda	[%i4 + %i0]0x80, %f10
	.word	0x96f00000	! t0_kref+0x3020:   	udivcc	%g0, %g0, %o3
	.word	0x97180000	! t0_kref+0x3024:   	tsubcctv	%g0, %g0, %o3
	.word	0x96e6a86f	! t0_kref+0x3028:   	subccc	%i2, 0x86f, %o3
	.word	0x81580000	! t0_kref+0x302c:   	flushw
	.word	0xd686101c	! t0_kref+0x3030:   	lda	[%i0 + %i4]0x80, %o3
	.word	0x95b2866b	! t0_kref+0x3034:   	fmul8x16au	%f10, %f11, %f10
	.word	0xe09f5040	! t0_kref+0x3038:   	ldda	[%i5]0x82, %l0
	.word	0xc036c019	! t0_kref+0x303c:   	clrh	[%i3 + %i1]
	.word	0x97b00cea	! t0_kref+0x3040:   	fnot2s	%f10, %f11
	.word	0x973ea01b	! t0_kref+0x3044:   	sra	%i2, 0x1b, %o3
	.word	0x97a0002b	! t0_kref+0x3048:   	fmovs	%f11, %f11
	.word	0x8143c000	! t0_kref+0x304c:   	stbar
	.word	0x95a0192b	! t0_kref+0x3050:   	fstod	%f11, %f10
	.word	0xb6103ffa	! t0_kref+0x3054:   	mov	0xfffffffa, %i3
	.word	0x9608373b	! t0_kref+0x3058:   	and	%g0, -0x8c5, %o3
	.word	0x97b000da	! t0_kref+0x305c:   	edge16l	%g0, %i2, %o3
	.word	0x96803028	! t0_kref+0x3060:   	addcc	%g0, -0xfd8, %o3
	.word	0x973ea007	! t0_kref+0x3064:   	sra	%i2, 0x7, %o3
	.word	0x96983855	! t0_kref+0x3068:   	xorcc	%g0, -0x7ab, %o3
	.word	0x969ea061	! t0_kref+0x306c:   	xorcc	%i2, 0x61, %o3
	.word	0x9616b889	! t0_kref+0x3070:   	or	%i2, -0x777, %o3
	.word	0x96568000	! t0_kref+0x3074:   	umul	%i2, %g0, %o3
	.word	0x81aa8aaa	! t0_kref+0x3078:   	fcmpes	%fcc0, %f10, %f10
	.word	0x95a0192a	! t0_kref+0x307c:   	fstod	%f10, %f10
	.word	0x95a2892a	! t0_kref+0x3080:   	fmuls	%f10, %f10, %f10
	.word	0x8143c000	! t0_kref+0x3084:   	stbar
	.word	0x95b2862a	! t0_kref+0x3088:   	fmul8x16	%f10, %f10, %f10
	.word	0x961836b7	! t0_kref+0x308c:   	xor	%g0, -0x949, %o3
	.word	0x95a0188a	! t0_kref+0x3090:   	fitos	%f10, %f10
	.word	0x95a0014a	! t0_kref+0x3094:   	fabsd	%f10, %f10
	.word	0x95a2884a	! t0_kref+0x3098:   	faddd	%f10, %f10, %f10
	.word	0x96be801a	! t0_kref+0x309c:   	xnorcc	%i2, %i2, %o3
	.word	0x97a0188a	! t0_kref+0x30a0:   	fitos	%f10, %f11
	.word	0x95a0054a	! t0_kref+0x30a4:   	fsqrtd	%f10, %f10
	.word	0xd656401b	! t0_kref+0x30a8:   	ldsh	[%i1 + %i3], %o3
	.word	0xa7802e3d	! t0_kref+0x30ac:   	mov	0xe3d, %gsr
	.word	0x95b2898a	! t0_kref+0x30b0:   	bshuffle	%f10, %f10, %f10
	.word	0x95b2c62a	! t0_kref+0x30b4:   	fmul8x16	%f11, %f10, %f10
	.word	0x9656801a	! t0_kref+0x30b8:   	umul	%i2, %i2, %o3
	.word	0x86102001	! t0_kref+0x30bc:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x30c0:   	bne,a	_kref+0x30c0
	.word	0x86a0e001	! t0_kref+0x30c4:   	subcc	%g3, 1, %g3
	.word	0x9610001a	! t0_kref+0x30c8:   	mov	%i2, %o3
	.word	0x97382007	! t0_kref+0x30cc:   	sra	%g0, 0x7, %o3
	.word	0x97408000	! t0_kref+0x30d0:   	mov	%ccr, %o3
	.word	0xe43e3ff0	! t0_kref+0x30d4:   	std	%l2, [%i0 - 0x10]
	.word	0x973ea014	! t0_kref+0x30d8:   	sra	%i2, 0x14, %o3
	.word	0x961ebd65	! t0_kref+0x30dc:   	xor	%i2, -0x29b, %o3
	.word	0x96280000	! t0_kref+0x30e0:   	andn	%g0, %g0, %o3
	.word	0x2b480004	! t0_kref+0x30e4:   	fbug,a,pt	%fcc0, _kref+0x30f4
	.word	0xd526200c	! t0_kref+0x30e8:   	st	%f10, [%i0 + 0xc]
	.word	0x95b28f8a	! t0_kref+0x30ec:   	for	%f10, %f10, %f10
	.word	0x9608351b	! t0_kref+0x30f0:   	and	%g0, -0xae5, %o3
	.word	0x95a288ca	! t0_kref+0x30f4:   	fsubd	%f10, %f10, %f10
	.word	0x97b68140	! t0_kref+0x30f8:   	edge32l	%i2, %g0, %o3
	.word	0x95a01a4a	! t0_kref+0x30fc:   	fdtoi	%f10, %f10
	.word	0x96868000	! t0_kref+0x3100:   	addcc	%i2, %g0, %o3
	.word	0x95a28d2a	! t0_kref+0x3104:   	fsmuld	%f10, %f10, %f10
	.word	0x97400000	! t0_kref+0x3108:   	mov	%y, %o3
	.word	0x963036ca	! t0_kref+0x310c:   	orn	%g0, -0x936, %o3
	.word	0x95a0192a	! t0_kref+0x3110:   	fstod	%f10, %f10
	.word	0x97400000	! t0_kref+0x3114:   	mov	%y, %o3
	.word	0x9666b2ab	! t0_kref+0x3118:   	subc	%i2, -0xd55, %o3
	.word	0xc168a041	! t0_kref+0x311c:   	prefetch	%g2 + 0x41, 0
	.word	0xd7871019	! t0_kref+0x3120:   	lda	[%i4 + %i1]0x80, %f11
	.word	0x97b6815a	! t0_kref+0x3124:   	edge32l	%i2, %i2, %o3
	.word	0x95a2cd2b	! t0_kref+0x3128:   	fsmuld	%f11, %f11, %f10
	.word	0x97b00040	! t0_kref+0x312c:   	edge8l	%g0, %g0, %o3
	.word	0x9676801a	! t0_kref+0x3130:   	udiv	%i2, %i2, %o3
	.word	0x81db801e	! t0_kref+0x3134:   	flush	%sp + %fp
	.word	0x9fc00004	! t0_kref+0x3138:   	call	%g0 + %g4
	.word	0x95b00cca	! t0_kref+0x313c:   	fnot2	%f10, %f10
	.word	0x35800008	! t0_kref+0x3140:   	fbue,a	_kref+0x3160
	.word	0x972032d3	! t0_kref+0x3144:   	mulscc	%g0, -0xd2d, %o3
	.word	0x81aa8aca	! t0_kref+0x3148:   	fcmped	%fcc0, %f10, %f10
	.word	0x95a288ca	! t0_kref+0x314c:   	fsubd	%f10, %f10, %f10
	.word	0x95a0192a	! t0_kref+0x3150:   	fstod	%f10, %f10
	.word	0xe43f4018	! t0_kref+0x3154:   	std	%l2, [%i5 + %i0]
	.word	0x81aacaab	! t0_kref+0x3158:   	fcmpes	%fcc0, %f11, %f11
	.word	0x97b00fe0	! t0_kref+0x315c:   	fones	%f11
	.word	0x81580000	! t0_kref+0x3160:   	flushw
	.word	0x95a0110a	! t0_kref+0x3164:   	fxtod	%f10, %f10
	.word	0x95a2c9aa	! t0_kref+0x3168:   	fdivs	%f11, %f10, %f10
	.word	0x8143c000	! t0_kref+0x316c:   	stbar
	.word	0x97202314	! t0_kref+0x3170:   	mulscc	%g0, 0x314, %o3
	.word	0x95a01a4a	! t0_kref+0x3174:   	fdtoi	%f10, %f10
	.word	0x96b83d58	! t0_kref+0x3178:   	xnorcc	%g0, -0x2a8, %o3
	.word	0x95a2894a	! t0_kref+0x317c:   	fmuld	%f10, %f10, %f10
	.word	0x83414000	! t0_kref+0x3180:   	mov	%pc, %g1
	.word	0xf4ae9019	! t0_kref+0x3184:   	stba	%i2, [%i2 + %i1]0x80
	.word	0x97b28aeb	! t0_kref+0x3188:   	fpsub32s	%f10, %f11, %f11
	.word	0xf4b6501b	! t0_kref+0x318c:   	stha	%i2, [%i1 + %i3]0x80
	.word	0xd19e7fe7	! t0_kref+0x3190:   	ldda	[%i1 - 0x19]%asi, %f8
	.word	0x170dd948	! t0_kref+0x3194:   	sethi	%hi(0x37652000), %o3
	.word	0x97a0188b	! t0_kref+0x3198:   	fitos	%f11, %f11
	.word	0x96f6b2cf	! t0_kref+0x319c:   	udivcc	%i2, -0xd31, %o3
	.word	0xc020a030	! t0_kref+0x31a0:   	clr	[%g2 + 0x30]
	.word	0x95b28a4a	! t0_kref+0x31a4:   	fpadd32	%f10, %f10, %f10
	.word	0x81580000	! t0_kref+0x31a8:   	flushw
	.word	0x8143c000	! t0_kref+0x31ac:   	stbar
	.word	0xc0ae101a	! t0_kref+0x31b0:   	stba	%g0, [%i0 + %i2]0x80
	.word	0xe01e001d	! t0_kref+0x31b4:   	ldd	[%i0 + %i5], %l0
	.word	0x963e801a	! t0_kref+0x31b8:   	xnor	%i2, %i2, %o3
	.word	0x2d800001	! t0_kref+0x31bc:   	fbg,a	_kref+0x31c0
	.word	0xd65e6008	! t0_kref+0x31c0:   	ldx	[%i1 + 8], %o3
	.word	0x9728201b	! t0_kref+0x31c4:   	sll	%g0, 0x1b, %o3
	.word	0xd1be5a5b	! t0_kref+0x31c8:   	stda	%f8, [%i1 + %i3]0xd2
	.word	0x31800002	! t0_kref+0x31cc:   	fba,a	_kref+0x31d4
	.word	0x970eae49	! t0_kref+0x31d0:   	tsubcc	%i2, 0xe49, %o3
	.word	0xc0f75019	! t0_kref+0x31d4:   	stxa	%g0, [%i5 + %i1]0x80
	.word	0x81800000	! t0_kref+0x31d8:   	mov	%g0, %y
	.word	0x97b00280	! t0_kref+0x31dc:   	array32	%g0, %g0, %o3
	.word	0x95b2898a	! t0_kref+0x31e0:   	bshuffle	%f10, %f10, %f10
	.word	0x966024c8	! t0_kref+0x31e4:   	subc	%g0, 0x4c8, %o3
	.word	0x29800008	! t0_kref+0x31e8:   	fbl,a	_kref+0x3208
	.word	0x95b2890a	! t0_kref+0x31ec:   	faligndata	%f10, %f10, %f10
	.word	0x9610001a	! t0_kref+0x31f0:   	mov	%i2, %o3
	.word	0xd616600e	! t0_kref+0x31f4:   	lduh	[%i1 + 0xe], %o3
	.word	0x81aacaaa	! t0_kref+0x31f8:   	fcmpes	%fcc0, %f11, %f10
	.word	0x97b6809a	! t0_kref+0x31fc:   	edge16	%i2, %i2, %o3
	.word	0x96600000	! t0_kref+0x3200:   	subc	%g0, %g0, %o3
	.word	0x96a8380a	! t0_kref+0x3204:   	andncc	%g0, -0x7f6, %o3
	.word	0x95a01a4a	! t0_kref+0x3208:   	fdtoi	%f10, %f10
	.word	0x97a2892a	! t0_kref+0x320c:   	fmuls	%f10, %f10, %f11
	.word	0x95b28c4a	! t0_kref+0x3210:   	fnor	%f10, %f10, %f10
	.word	0x9660001a	! t0_kref+0x3214:   	subc	%g0, %i2, %o3
	.word	0x95b28eca	! t0_kref+0x3218:   	fornot2	%f10, %f10, %f10
	.word	0xd1be581a	! t0_kref+0x321c:   	stda	%f8, [%i1 + %i2]0xc0
	.word	0x97b68320	! t0_kref+0x3220:   	bmask	%i2, %g0, %o3
	.word	0x97b28e2a	! t0_kref+0x3224:   	fands	%f10, %f10, %f11
	.word	0x86102001	! t0_kref+0x3228:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x322c:   	bne,a	_kref+0x322c
	.word	0x86a0e001	! t0_kref+0x3230:   	subcc	%g3, 1, %g3
	.word	0x97a01a4a	! t0_kref+0x3234:   	fdtoi	%f10, %f11
	.word	0x95a01a4a	! t0_kref+0x3238:   	fdtoi	%f10, %f10
	.word	0xd6500018	! t0_kref+0x323c:   	ldsh	[%g0 + %i0], %o3
	.word	0x95a9404a	! t0_kref+0x3240:   	fmovdug	%fcc0, %f10, %f10
	.word	0xc0f01018	! t0_kref+0x3244:   	stxa	%g0, [%g0 + %i0]0x80
	.word	0x95b007aa	! t0_kref+0x3248:   	fpackfix	%f10, %f10
	.word	0xd720a03c	! t0_kref+0x324c:   	st	%f11, [%g2 + 0x3c]
	.word	0xdbe6501a	! t0_kref+0x3250:   	casa	[%i1]0x80, %i2, %o5
	.word	0xe43e7fe0	! t0_kref+0x3254:   	std	%l2, [%i1 - 0x20]
	.word	0x95b2c62a	! t0_kref+0x3258:   	fmul8x16	%f11, %f10, %f10
	.word	0x96e03fd9	! t0_kref+0x325c:   	subccc	%g0, -0x27, %o3
	.word	0x95a2894a	! t0_kref+0x3260:   	fmuld	%f10, %f10, %f10
	.word	0x95b28d8a	! t0_kref+0x3264:   	fxor	%f10, %f10, %f10
	.word	0x9fc10000	! t0_kref+0x3268:   	call	%g4
	.word	0xe46e2015	! t0_kref+0x326c:   	ldstub	[%i0 + 0x15], %l2
	.word	0xf007bfe0	! t0_kref+0x3270:   	ld	[%fp - 0x20], %i0
	.word	0xa780209a	! t0_kref+0x3274:   	mov	0x9a, %gsr
	.word	0xd6064000	! t0_kref+0x3278:   	ld	[%i1], %o3
	.word	0x96fea2e4	! t0_kref+0x327c:   	sdivcc	%i2, 0x2e4, %o3
	.word	0x95a018ca	! t0_kref+0x3280:   	fdtos	%f10, %f10
	.word	0x95b2890a	! t0_kref+0x3284:   	faligndata	%f10, %f10, %f10
	.word	0x97b6813a	! t0_kref+0x3288:   	edge32n	%i2, %i2, %o3
	.word	0x81dbc014	! t0_kref+0x328c:   	flush	%o7 + %l4
	.word	0x95b28a4a	! t0_kref+0x3290:   	fpadd32	%f10, %f10, %f10
	.word	0x81868000	! t0_kref+0x3294:   	wr	%i2, %g0, %y
	.word	0x97282011	! t0_kref+0x3298:   	sll	%g0, 0x11, %o3
	.word	0xd6163ff6	! t0_kref+0x329c:   	lduh	[%i0 - 0xa], %o3
	.word	0xc368a005	! t0_kref+0x32a0:   	prefetch	%g2 + 5, 1
	.word	0x95b28a0a	! t0_kref+0x32a4:   	fpadd16	%f10, %f10, %f10
	.word	0x95a0054a	! t0_kref+0x32a8:   	fsqrtd	%f10, %f10
	.word	0x95a0192b	! t0_kref+0x32ac:   	fstod	%f11, %f10
	.word	0xd6566014	! t0_kref+0x32b0:   	ldsh	[%i1 + 0x14], %o3
	.word	0x97a2c9ab	! t0_kref+0x32b4:   	fdivs	%f11, %f11, %f11
	.word	0x96d6bc7e	! t0_kref+0x32b8:   	umulcc	%i2, -0x382, %o3
	.word	0x95a0054a	! t0_kref+0x32bc:   	fsqrtd	%f10, %f10
	.word	0x97b0033a	! t0_kref+0x32c0:   	bmask	%g0, %i2, %o3
	.word	0x95a2894a	! t0_kref+0x32c4:   	fmuld	%f10, %f10, %f10
	.word	0x96983053	! t0_kref+0x32c8:   	xorcc	%g0, -0xfad, %o3
	.word	0x95a01a4a	! t0_kref+0x32cc:   	fdtoi	%f10, %f10
	.word	0x96180000	! t0_kref+0x32d0:   	xor	%g0, %g0, %o3
	.word	0x95b28a8a	! t0_kref+0x32d4:   	fpsub16	%f10, %f10, %f10
	.word	0x96902e5e	! t0_kref+0x32d8:   	orcc	%g0, 0xe5e, %o3
	.word	0x969032a5	! t0_kref+0x32dc:   	orcc	%g0, -0xd5b, %o3
	.word	0x969ebb67	! t0_kref+0x32e0:   	xorcc	%i2, -0x499, %o3
	.word	0x96be8000	! t0_kref+0x32e4:   	xnorcc	%i2, %g0, %o3
	.word	0x9658001a	! t0_kref+0x32e8:   	smul	%g0, %i2, %o3
	.word	0x96880000	! t0_kref+0x32ec:   	andcc	%g0, %g0, %o3
	.word	0x97400000	! t0_kref+0x32f0:   	mov	%y, %o3
	.word	0x9736801a	! t0_kref+0x32f4:   	srl	%i2, %i2, %o3
	.word	0xe49f5019	! t0_kref+0x32f8:   	ldda	[%i5 + %i1]0x80, %l2
	.word	0xd6480018	! t0_kref+0x32fc:   	ldsb	[%g0 + %i0], %o3
	.word	0x81aaca2a	! t0_kref+0x3300:   	fcmps	%fcc0, %f11, %f10
	.word	0xd5a65000	! t0_kref+0x3304:   	sta	%f10, [%i1]0x80
	.word	0xfe483567	! t0_kref+0x3308:   	ldsb	[%g0 - 0xa99], %i7
	.word	0x961ebfbb	! t0_kref+0x330c:   	xor	%i2, -0x45, %o3
	.word	0xf007bfe0	! t0_kref+0x3310:   	ld	[%fp - 0x20], %i0
	.word	0x95b28e0a	! t0_kref+0x3314:   	fand	%f10, %f10, %f10
	.word	0x95a0192b	! t0_kref+0x3318:   	fstod	%f11, %f10
	.word	0x97b0035a	! t0_kref+0x331c:   	alignaddrl	%g0, %i2, %o3
	.word	0x96080000	! t0_kref+0x3320:   	and	%g0, %g0, %o3
	.word	0x95b28a8a	! t0_kref+0x3324:   	fpsub16	%f10, %f10, %f10
	.word	0x173f3245	! t0_kref+0x3328:   	sethi	%hi(0xfcc91400), %o3
	.word	0x96100000	! t0_kref+0x332c:   	clr	%o3
	.word	0xd608a00b	! t0_kref+0x3330:   	ldub	[%g2 + 0xb], %o3
	.word	0x969024a9	! t0_kref+0x3334:   	orcc	%g0, 0x4a9, %o3
	.word	0x9fc10000	! t0_kref+0x3338:   	call	%g4
	.word	0x97400000	! t0_kref+0x333c:   	mov	%y, %o3
	.word	0x9636b3a1	! t0_kref+0x3340:   	orn	%i2, -0xc5f, %o3
	.word	0x97a0012b	! t0_kref+0x3344:   	fabss	%f11, %f11
	.word	0x95b00f2a	! t0_kref+0x3348:   	fsrc2s	%f10, %f10
	.word	0x3d800006	! t0_kref+0x334c:   	fbule,a	_kref+0x3364
	.word	0x96582d46	! t0_kref+0x3350:   	smul	%g0, 0xd46, %o3
	.word	0x9fc00004	! t0_kref+0x3354:   	call	%g0 + %g4
	.word	0x97b68020	! t0_kref+0x3358:   	edge8n	%i2, %g0, %o3
	.word	0x965831bb	! t0_kref+0x335c:   	smul	%g0, -0xe45, %o3
	.word	0x97b28d2b	! t0_kref+0x3360:   	fandnot1s	%f10, %f11, %f11
	.word	0x960eae7b	! t0_kref+0x3364:   	and	%i2, 0xe7b, %o3
	.word	0x97b0035a	! t0_kref+0x3368:   	alignaddrl	%g0, %i2, %o3
	.word	0x961e8000	! t0_kref+0x336c:   	xor	%i2, %g0, %o3
	.word	0x8143c000	! t0_kref+0x3370:   	stbar
	.word	0x8143c000	! t0_kref+0x3374:   	stbar
	.word	0x97a0012b	! t0_kref+0x3378:   	fabss	%f11, %f11
	.word	0x9658001a	! t0_kref+0x337c:   	smul	%g0, %i2, %o3
	.word	0x96602a44	! t0_kref+0x3380:   	subc	%g0, 0xa44, %o3
	.word	0x97400000	! t0_kref+0x3384:   	mov	%y, %o3
	.word	0x97b284ca	! t0_kref+0x3388:   	fcmpne32	%f10, %f10, %o3
	.word	0x97a01a4a	! t0_kref+0x338c:   	fdtoi	%f10, %f11
	.word	0x97000000	! t0_kref+0x3390:   	taddcc	%g0, %g0, %o3
	.word	0xd586501c	! t0_kref+0x3394:   	lda	[%i1 + %i4]0x80, %f10
	.word	0xc020a020	! t0_kref+0x3398:   	clr	[%g2 + 0x20]
	.word	0x969eb3e3	! t0_kref+0x339c:   	xorcc	%i2, -0xc1d, %o3
	.word	0x95a0054a	! t0_kref+0x33a0:   	fsqrtd	%f10, %f10
	.word	0xe49f5018	! t0_kref+0x33a4:   	ldda	[%i5 + %i0]0x80, %l2
	.word	0x95a288ca	! t0_kref+0x33a8:   	fsubd	%f10, %f10, %f10
	.word	0x97b0017a	! t0_kref+0x33ac:   	edge32ln	%g0, %i2, %o3
	.word	0x95b28e4a	! t0_kref+0x33b0:   	fxnor	%f10, %f10, %f10
	.word	0x95b28f8a	! t0_kref+0x33b4:   	for	%f10, %f10, %f10
	.word	0x97a01a4a	! t0_kref+0x33b8:   	fdtoi	%f10, %f11
	.word	0xe43e2000	! t0_kref+0x33bc:   	std	%l2, [%i0]
	.word	0xf428a017	! t0_kref+0x33c0:   	stb	%i2, [%g2 + 0x17]
	.word	0xd51fbd20	! t0_kref+0x33c4:   	ldd	[%fp - 0x2e0], %f10
	.word	0x95a288ca	! t0_kref+0x33c8:   	fsubd	%f10, %f10, %f10
	.word	0xd51fbf30	! t0_kref+0x33cc:   	ldd	[%fp - 0xd0], %f10
	.word	0x95a0104a	! t0_kref+0x33d0:   	fdtox	%f10, %f10
	.word	0x96880000	! t0_kref+0x33d4:   	andcc	%g0, %g0, %o3
	.word	0xd6560000	! t0_kref+0x33d8:   	ldsh	[%i0], %o3
	.word	0xe43f4018	! t0_kref+0x33dc:   	std	%l2, [%i5 + %i0]
	.word	0xe67e401c	! t0_kref+0x33e0:   	swap	[%i1 + %i4], %l3
	.word	0x95a2894a	! t0_kref+0x33e4:   	fmuld	%f10, %f10, %f10
	.word	0x97180000	! t0_kref+0x33e8:   	tsubcctv	%g0, %g0, %o3
	.word	0x22800003	! t0_kref+0x33ec:   	be,a	_kref+0x33f8
	.word	0x96b025cb	! t0_kref+0x33f0:   	orncc	%g0, 0x5cb, %o3
	.word	0x97400000	! t0_kref+0x33f4:   	mov	%y, %o3
	.word	0x97380000	! t0_kref+0x33f8:   	sra	%g0, %g0, %o3
	.word	0x97a01a4a	! t0_kref+0x33fc:   	fdtoi	%f10, %f11
	.word	0x95a2cd2b	! t0_kref+0x3400:   	fsmuld	%f11, %f11, %f10
	.word	0x95b007aa	! t0_kref+0x3404:   	fpackfix	%f10, %f10
	.word	0x9690294d	! t0_kref+0x3408:   	orcc	%g0, 0x94d, %o3
	.word	0x97b00160	! t0_kref+0x340c:   	edge32ln	%g0, %g0, %o3
	.word	0x97a2882a	! t0_kref+0x3410:   	fadds	%f10, %f10, %f11
	.word	0x971e8000	! t0_kref+0x3414:   	tsubcctv	%i2, %g0, %o3
	.word	0xe4981018	! t0_kref+0x3418:   	ldda	[%g0 + %i0]0x80, %l2
	.word	0x96f03fb5	! t0_kref+0x341c:   	udivcc	%g0, -0x4b, %o3
	.word	0x95a2894a	! t0_kref+0x3420:   	fmuld	%f10, %f10, %f10
	.word	0x97b68100	! t0_kref+0x3424:   	edge32	%i2, %g0, %o3
	.word	0x965026f3	! t0_kref+0x3428:   	umul	%g0, 0x6f3, %o3
	.word	0x95ab804a	! t0_kref+0x342c:   	fmovdule	%fcc0, %f10, %f10
	.word	0x95a288ca	! t0_kref+0x3430:   	fsubd	%f10, %f10, %f10
	.word	0xc0367fee	! t0_kref+0x3434:   	clrh	[%i1 - 0x12]
	.word	0x97a01a2a	! t0_kref+0x3438:   	fstoi	%f10, %f11
	.word	0xd68e9019	! t0_kref+0x343c:   	lduba	[%i2 + %i1]0x80, %o3
	.word	0x960ea058	! t0_kref+0x3440:   	and	%i2, 0x58, %o3
	.word	0x95b28d40	! t0_kref+0x3444:   	fnot1	%f10, %f10
	.word	0x97b0031a	! t0_kref+0x3448:   	alignaddr	%g0, %i2, %o3
	.word	0xd51fbd90	! t0_kref+0x344c:   	ldd	[%fp - 0x270], %f10
	.word	0x96468000	! t0_kref+0x3450:   	addc	%i2, %g0, %o3
	.word	0x95b28f8a	! t0_kref+0x3454:   	for	%f10, %f10, %f10
	.word	0xd6ce9018	! t0_kref+0x3458:   	ldsba	[%i2 + %i0]0x80, %o3
	.word	0xc168a00c	! t0_kref+0x345c:   	prefetch	%g2 + 0xc, 0
	.word	0xd7801019	! t0_kref+0x3460:   	lda	[%g0 + %i1]0x80, %f11
	.word	0x968026ff	! t0_kref+0x3464:   	addcc	%g0, 0x6ff, %o3
	.word	0x95a2894a	! t0_kref+0x3468:   	fmuld	%f10, %f10, %f10
	.word	0x96668000	! t0_kref+0x346c:   	subc	%i2, %g0, %o3
	.word	0x96580000	! t0_kref+0x3470:   	smul	%g0, %g0, %o3
	.word	0xc3ee5000	! t0_kref+0x3474:   	prefetcha	%i1, 1
	.word	0x97300000	! t0_kref+0x3478:   	srl	%g0, %g0, %o3
	.word	0xe168a082	! t0_kref+0x347c:   	prefetch	%g2 + 0x82, 16
	.word	0x81aaca2b	! t0_kref+0x3480:   	fcmps	%fcc0, %f11, %f11
	.word	0x96180000	! t0_kref+0x3484:   	xor	%g0, %g0, %o3
	.word	0x95a0052b	! t0_kref+0x3488:   	fsqrts	%f11, %f10
	.word	0xe0180018	! t0_kref+0x348c:   	ldd	[%g0 + %i0], %l0
	.word	0x96568000	! t0_kref+0x3490:   	umul	%i2, %g0, %o3
	.word	0x9680001a	! t0_kref+0x3494:   	addcc	%g0, %i2, %o3
	.word	0x95a2cd2b	! t0_kref+0x3498:   	fsmuld	%f11, %f11, %f10
	.word	0xd1be585a	! t0_kref+0x349c:   	stda	%f8, [%i1 + %i2]0xc2
	.word	0xd65e2010	! t0_kref+0x34a0:   	ldx	[%i0 + 0x10], %o3
	.word	0x96568000	! t0_kref+0x34a4:   	umul	%i2, %g0, %o3
	.word	0x97a01a4a	! t0_kref+0x34a8:   	fdtoi	%f10, %f11
	.word	0x8143c000	! t0_kref+0x34ac:   	stbar
	.word	0x878020e0	! t0_kref+0x34b0:   	mov	0xe0, %asi
	.word	0x9676801a	! t0_kref+0x34b4:   	udiv	%i2, %i2, %o3
	.word	0xd51fbe00	! t0_kref+0x34b8:   	ldd	[%fp - 0x200], %f10
	.word	0xd600a024	! t0_kref+0x34bc:   	ld	[%g2 + 0x24], %o3
	.word	0xd19f5a59	! t0_kref+0x34c0:   	ldda	[%i5 + %i1]0xd2, %f8
	.word	0x96903011	! t0_kref+0x34c4:   	orcc	%g0, -0xfef, %o3
	.word	0xd5380018	! t0_kref+0x34c8:   	std	%f10, [%g0 + %i0]
	.word	0x2c800008	! t0_kref+0x34cc:   	bneg,a	_kref+0x34ec
	.word	0x97a0188a	! t0_kref+0x34d0:   	fitos	%f10, %f11
	.word	0x97b68240	! t0_kref+0x34d4:   	array16	%i2, %g0, %o3
	.word	0x96f6801a	! t0_kref+0x34d8:   	udivcc	%i2, %i2, %o3
	.word	0x95a0192a	! t0_kref+0x34dc:   	fstod	%f10, %f10
	.word	0x96468000	! t0_kref+0x34e0:   	addc	%i2, %g0, %o3
	.word	0xe03e6010	! t0_kref+0x34e4:   	std	%l0, [%i1 + 0x10]
	.word	0x95a0002a	! t0_kref+0x34e8:   	fmovs	%f10, %f10
	.word	0x96c6a7d5	! t0_kref+0x34ec:   	addccc	%i2, 0x7d5, %o3
	.word	0xd6965000	! t0_kref+0x34f0:   	lduha	[%i1]0x80, %o3
	.word	0x9726a9a4	! t0_kref+0x34f4:   	mulscc	%i2, 0x9a4, %o3
	.word	0x96502737	! t0_kref+0x34f8:   	umul	%g0, 0x737, %o3
	.word	0x95aa404a	! t0_kref+0x34fc:   	fmovde	%fcc0, %f10, %f10
	.word	0x95b00fe0	! t0_kref+0x3500:   	fones	%f10
	.word	0x95a0002b	! t0_kref+0x3504:   	fmovs	%f11, %f10
	.word	0x96f6b989	! t0_kref+0x3508:   	udivcc	%i2, -0x677, %o3
	.word	0x878020f0	! t0_kref+0x350c:   	mov	0xf0, %asi
	.word	0x95b28eca	! t0_kref+0x3510:   	fornot2	%f10, %f10, %f10
	.word	0x97a01a4a	! t0_kref+0x3514:   	fdtoi	%f10, %f11
	.word	0xc020a000	! t0_kref+0x3518:   	clr	[%g2]
	.word	0x97a2882a	! t0_kref+0x351c:   	fadds	%f10, %f10, %f11
	.word	0x96500000	! t0_kref+0x3520:   	umul	%g0, %g0, %o3
	.word	0x96be801a	! t0_kref+0x3524:   	xnorcc	%i2, %i2, %o3
	.word	0x95a0192b	! t0_kref+0x3528:   	fstod	%f11, %f10
	.word	0x96500000	! t0_kref+0x352c:   	umul	%g0, %g0, %o3
	.word	0xd586501c	! t0_kref+0x3530:   	lda	[%i1 + %i4]0x80, %f10
	.word	0x9660001a	! t0_kref+0x3534:   	subc	%g0, %i2, %o3
	.word	0xd600a024	! t0_kref+0x3538:   	ld	[%g2 + 0x24], %o3
	.word	0xd600a020	! t0_kref+0x353c:   	ld	[%g2 + 0x20], %o3
	.word	0x2a800005	! t0_kref+0x3540:   	bcs,a	_kref+0x3554
	.word	0xe43e401d	! t0_kref+0x3544:   	std	%l2, [%i1 + %i5]
	.word	0xee6e7ffc	! t0_kref+0x3548:   	ldstub	[%i1 - 4], %l7
	.word	0x95b00c20	! t0_kref+0x354c:   	fzeros	%f10
	.word	0x95a2cd2a	! t0_kref+0x3550:   	fsmuld	%f11, %f10, %f10
	.word	0x9666b068	! t0_kref+0x3554:   	subc	%i2, -0xf98, %o3
	.word	0xc398a040	! t0_kref+0x3558:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0x95a000ca	! t0_kref+0x355c:   	fnegd	%f10, %f10
	.word	0x95a2894a	! t0_kref+0x3560:   	fmuld	%f10, %f10, %f10
	.word	0x95a0002b	! t0_kref+0x3564:   	fmovs	%f11, %f10
	.word	0x961e801a	! t0_kref+0x3568:   	xor	%i2, %i2, %o3
	.word	0x95a000ca	! t0_kref+0x356c:   	fnegd	%f10, %f10
	.word	0x9696801a	! t0_kref+0x3570:   	orcc	%i2, %i2, %o3
	.word	0x95b28d0a	! t0_kref+0x3574:   	fandnot1	%f10, %f10, %f10
	.word	0x97400000	! t0_kref+0x3578:   	mov	%y, %o3
	.word	0x96580000	! t0_kref+0x357c:   	smul	%g0, %g0, %o3
	.word	0x97b2858a	! t0_kref+0x3580:   	fcmpgt32	%f10, %f10, %o3
	.word	0xc398a040	! t0_kref+0x3584:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0x35480008	! t0_kref+0x3588:   	fbue,a,pt	%fcc0, _kref+0x35a8
	.word	0x97a01a2b	! t0_kref+0x358c:   	fstoi	%f11, %f11
	.word	0x965eb986	! t0_kref+0x3590:   	smul	%i2, -0x67a, %o3
	.word	0x81aa8a2a	! t0_kref+0x3594:   	fcmps	%fcc0, %f10, %f10
	.word	0xe01e3fe0	! t0_kref+0x3598:   	ldd	[%i0 - 0x20], %l0
	.word	0x97a0188a	! t0_kref+0x359c:   	fitos	%f10, %f11
	.word	0x9736a018	! t0_kref+0x35a0:   	srl	%i2, 0x18, %o3
	.word	0xd1be5880	! t0_kref+0x35a4:   	stda	%f8, [%i1]0xc4
	.word	0x9658266e	! t0_kref+0x35a8:   	smul	%g0, 0x66e, %o3
	.word	0xe4981019	! t0_kref+0x35ac:   	ldda	[%g0 + %i1]0x80, %l2
	.word	0x95b28a0a	! t0_kref+0x35b0:   	fpadd16	%f10, %f10, %f10
	.word	0x2a800008	! t0_kref+0x35b4:   	bcs,a	_kref+0x35d4
	.word	0xd51e6018	! t0_kref+0x35b8:   	ldd	[%i1 + 0x18], %f10
	.word	0xef68a04b	! t0_kref+0x35bc:   	prefetch	%g2 + 0x4b, 23
	.word	0x81dc7ed2	! t0_kref+0x35c0:   	flush	%l1 - 0x12e
	.word	0x9726801a	! t0_kref+0x35c4:   	mulscc	%i2, %i2, %o3
	.word	0x969030a0	! t0_kref+0x35c8:   	orcc	%g0, -0xf60, %o3
	.word	0x96968000	! t0_kref+0x35cc:   	orcc	%i2, %g0, %o3
	.word	0xd598105d	! t0_kref+0x35d0:   	ldda	[%g0 + %i5]0x82, %f10
	.word	0x95a2884a	! t0_kref+0x35d4:   	faddd	%f10, %f10, %f10
	.word	0xd6d81018	! t0_kref+0x35d8:   	ldxa	[%g0 + %i0]0x80, %o3
	.word	0x9726ba70	! t0_kref+0x35dc:   	mulscc	%i2, -0x590, %o3
	.word	0x96100000	! t0_kref+0x35e0:   	clr	%o3
	.word	0x95a2cd2b	! t0_kref+0x35e4:   	fsmuld	%f11, %f11, %f10
	.word	0x9666801a	! t0_kref+0x35e8:   	subc	%i2, %i2, %o3
	.word	0x81b01022	! t0_kref+0x35ec:   	siam	0x2
	.word	0xe3b8a080	! t0_kref+0x35f0:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x95b28c8a	! t0_kref+0x35f4:   	fandnot2	%f10, %f10, %f10
	.word	0x96183ea0	! t0_kref+0x35f8:   	xor	%g0, -0x160, %o3
	.word	0xc398a040	! t0_kref+0x35fc:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0x97b2ce2b	! t0_kref+0x3600:   	fands	%f11, %f11, %f11
	.word	0x95b009aa	! t0_kref+0x3604:   	fexpand	%f10, %f10
	.word	0xe09f5018	! t0_kref+0x3608:   	ldda	[%i5 + %i0]0x80, %l0
	.word	0x95a2884a	! t0_kref+0x360c:   	faddd	%f10, %f10, %f10
	.word	0x9770001a	! t0_kref+0x3610:   	popc	%i2, %o3
	.word	0x97b284ca	! t0_kref+0x3614:   	fcmpne32	%f10, %f10, %o3
	.word	0xd5260000	! t0_kref+0x3618:   	st	%f10, [%i0]
	.word	0xd60e7fff	! t0_kref+0x361c:   	ldub	[%i1 - 1], %o3
	.word	0x95b28eca	! t0_kref+0x3620:   	fornot2	%f10, %f10, %f10
	.word	0x9616a163	! t0_kref+0x3624:   	or	%i2, 0x163, %o3
	.word	0x95b28e80	! t0_kref+0x3628:   	fsrc1	%f10, %f10
	.word	0x95a2882b	! t0_kref+0x362c:   	fadds	%f10, %f11, %f10
	.word	0xd6066000	! t0_kref+0x3630:   	ld	[%i1], %o3
	.word	0x96d8250e	! t0_kref+0x3634:   	smulcc	%g0, 0x50e, %o3
	.word	0x960eb9f0	! t0_kref+0x3638:   	and	%i2, -0x610, %o3
	.word	0x97a0052b	! t0_kref+0x363c:   	fsqrts	%f11, %f11
	.word	0x972ea00c	! t0_kref+0x3640:   	sll	%i2, 0xc, %o3
	.word	0x95a2894a	! t0_kref+0x3644:   	fmuld	%f10, %f10, %f10
	.word	0x81aaca2a	! t0_kref+0x3648:   	fcmps	%fcc0, %f11, %f10
	.word	0x97a2c92b	! t0_kref+0x364c:   	fmuls	%f11, %f11, %f11
	.word	0x8143c000	! t0_kref+0x3650:   	stbar
	.word	0xd6163ff8	! t0_kref+0x3654:   	lduh	[%i0 - 8], %o3
	.word	0x81aacaaa	! t0_kref+0x3658:   	fcmpes	%fcc0, %f11, %f10
	.word	0x95a0110a	! t0_kref+0x365c:   	fxtod	%f10, %f10
	.word	0x97a2c8aa	! t0_kref+0x3660:   	fsubs	%f11, %f10, %f11
	.word	0x1726f0f7	! t0_kref+0x3664:   	sethi	%hi(0x9bc3dc00), %o3
	.word	0x969eb432	! t0_kref+0x3668:   	xorcc	%i2, -0xbce, %o3
	.word	0xedf61000	! t0_kref+0x366c:   	casxa	[%i0]0x80, %g0, %l6
	.word	0x81d92bd5	! t0_kref+0x3670:   	flush	%g4 + 0xbd5
	.word	0x960eb9e9	! t0_kref+0x3674:   	and	%i2, -0x617, %o3
	.word	0x95a01a4a	! t0_kref+0x3678:   	fdtoi	%f10, %f10
	.word	0xe41e6018	! t0_kref+0x367c:   	ldd	[%i1 + 0x18], %l2
	.word	0x9716801a	! t0_kref+0x3680:   	taddcctv	%i2, %i2, %o3
	.word	0x97b6811a	! t0_kref+0x3684:   	edge32	%i2, %i2, %o3
	.word	0x95a2884a	! t0_kref+0x3688:   	faddd	%f10, %f10, %f10
	.word	0x96a00000	! t0_kref+0x368c:   	subcc	%g0, %g0, %o3
	.word	0x97b28fab	! t0_kref+0x3690:   	fors	%f10, %f11, %f11
	.word	0xd51fbe58	! t0_kref+0x3694:   	ldd	[%fp - 0x1a8], %f10
	.word	0xd656c018	! t0_kref+0x3698:   	ldsh	[%i3 + %i0], %o3
	.word	0x97408000	! t0_kref+0x369c:   	mov	%ccr, %o3
	.word	0x96e68000	! t0_kref+0x36a0:   	subccc	%i2, %g0, %o3
	.word	0x96080000	! t0_kref+0x36a4:   	and	%g0, %g0, %o3
	.word	0x95b007aa	! t0_kref+0x36a8:   	fpackfix	%f10, %f10
	.word	0xe03e4000	! t0_kref+0x36ac:   	std	%l0, [%i1]
	.word	0x96b02d58	! t0_kref+0x36b0:   	orncc	%g0, 0xd58, %o3
	.word	0xd59f5018	! t0_kref+0x36b4:   	ldda	[%i5 + %i0]0x80, %f10
	.word	0x968eb419	! t0_kref+0x36b8:   	andcc	%i2, -0xbe7, %o3
	.word	0x96902974	! t0_kref+0x36bc:   	orcc	%g0, 0x974, %o3
	.word	0x2f480002	! t0_kref+0x36c0:   	fbu,a,pt	%fcc0, _kref+0x36c8
	.word	0x9608223b	! t0_kref+0x36c4:   	and	%g0, 0x23b, %o3
	.word	0x9656be5e	! t0_kref+0x36c8:   	umul	%i2, -0x1a2, %o3
	.word	0x969e801a	! t0_kref+0x36cc:   	xorcc	%i2, %i2, %o3
	.word	0x96be801a	! t0_kref+0x36d0:   	xnorcc	%i2, %i2, %o3
	.word	0x3c800008	! t0_kref+0x36d4:   	bpos,a	_kref+0x36f4
	.word	0x95a2894a	! t0_kref+0x36d8:   	fmuld	%f10, %f10, %f10
	.word	0x95a0192b	! t0_kref+0x36dc:   	fstod	%f11, %f10
	.word	0x95a0012a	! t0_kref+0x36e0:   	fabss	%f10, %f10
	.word	0x9680001a	! t0_kref+0x36e4:   	addcc	%g0, %i2, %o3
	.word	0x96f00000	! t0_kref+0x36e8:   	udivcc	%g0, %g0, %o3
	.word	0x97b2850a	! t0_kref+0x36ec:   	fcmpgt16	%f10, %f10, %o3
	.word	0x9656be21	! t0_kref+0x36f0:   	umul	%i2, -0x1df, %o3
	.word	0xd6563fee	! t0_kref+0x36f4:   	ldsh	[%i0 - 0x12], %o3
	.word	0xd46e001a	! t0_kref+0x36f8:   	ldstub	[%i0 + %i2], %o2
	.word	0x31480001	! t0_kref+0x36fc:   	fba,a,pt	%fcc0, _kref+0x3700
	.word	0x96200000	! t0_kref+0x3700:   	neg	%g0, %o3
	.word	0xd506401c	! t0_kref+0x3704:   	ld	[%i1 + %i4], %f10
	.word	0x95a0002b	! t0_kref+0x3708:   	fmovs	%f11, %f10
	.word	0x95b28f6b	! t0_kref+0x370c:   	fornot1s	%f10, %f11, %f10
	.word	0x95a288ca	! t0_kref+0x3710:   	fsubd	%f10, %f10, %f10
	.word	0x97a0002b	! t0_kref+0x3714:   	fmovs	%f11, %f11
	.word	0x96500000	! t0_kref+0x3718:   	umul	%g0, %g0, %o3
	.word	0xf207bfe0	! t0_kref+0x371c:   	ld	[%fp - 0x20], %i1
	.word	0x96f80000	! t0_kref+0x3720:   	sdivcc	%g0, %g0, %o3
	.word	0x95a0192a	! t0_kref+0x3724:   	fstod	%f10, %f10
	.word	0x96a03ce1	! t0_kref+0x3728:   	subcc	%g0, -0x31f, %o3
	.word	0x95a0052a	! t0_kref+0x372c:   	fsqrts	%f10, %f10
	.word	0x001fffff	! t0_kref+0x3730:   	illtrap	0x1fffff
	.word	0x95b28e6a	! t0_kref+0x3734:   	fxnors	%f10, %f10, %f10
	.word	0x95ab004a	! t0_kref+0x3738:   	fmovduge	%fcc0, %f10, %f10
	.word	0x965e801a	! t0_kref+0x373c:   	smul	%i2, %i2, %o3
	.word	0x95a000ca	! t0_kref+0x3740:   	fnegd	%f10, %f10
	.word	0x81800000	! t0_kref+0x3744:   	mov	%g0, %y
	.word	0xd7e61000	! t0_kref+0x3748:   	casa	[%i0]0x80, %g0, %o3
	.word	0x95b2870b	! t0_kref+0x374c:   	fmuld8sux16	%f10, %f11, %f10
	.word	0xe43e7fe8	! t0_kref+0x3750:   	std	%l2, [%i1 - 0x18]
	.word	0x97380000	! t0_kref+0x3754:   	sra	%g0, %g0, %o3
	.word	0x9fc10000	! t0_kref+0x3758:   	call	%g4
	.word	0x97a2c92b	! t0_kref+0x375c:   	fmuls	%f11, %f11, %f11
	.word	0x95a0014a	! t0_kref+0x3760:   	fabsd	%f10, %f10
	.word	0x97604000	! t0_kref+0x3764:   	movne	%fcc0, %g0, %o3
	.word	0x95a2884a	! t0_kref+0x3768:   	faddd	%f10, %f10, %f10
	.word	0x9658001a	! t0_kref+0x376c:   	smul	%g0, %i2, %o3
	.word	0x96283715	! t0_kref+0x3770:   	andn	%g0, -0x8eb, %o3
	.word	0x97400000	! t0_kref+0x3774:   	mov	%y, %o3
	.word	0x95b2866b	! t0_kref+0x3778:   	fmul8x16au	%f10, %f11, %f10
	.word	0x97a01a4a	! t0_kref+0x377c:   	fdtoi	%f10, %f11
	.word	0x96bea25c	! t0_kref+0x3780:   	xnorcc	%i2, 0x25c, %o3
	.word	0x96e00000	! t0_kref+0x3784:   	subccc	%g0, %g0, %o3
	.word	0xd6464000	! t0_kref+0x3788:   	ldsw	[%i1], %o3
	.word	0x97b28e6b	! t0_kref+0x378c:   	fxnors	%f10, %f11, %f11
	.word	0x97408000	! t0_kref+0x3790:   	mov	%ccr, %o3
	.word	0x95a2894a	! t0_kref+0x3794:   	fmuld	%f10, %f10, %f10
	.word	0xe0380019	! t0_kref+0x3798:   	std	%l0, [%g0 + %i1]
	.word	0xd5b81018	! t0_kref+0x379c:   	stda	%f10, [%g0 + %i0]0x80
	.word	0x8143c000	! t0_kref+0x37a0:   	stbar
	.word	0x95b28eea	! t0_kref+0x37a4:   	fornot2s	%f10, %f10, %f10
	.word	0xd8ee9019	! t0_kref+0x37a8:   	ldstuba	[%i2 + %i1]0x80, %o4
	.word	0x95b28a8a	! t0_kref+0x37ac:   	fpsub16	%f10, %f10, %f10
	.word	0x8143c000	! t0_kref+0x37b0:   	stbar
	.word	0x96a8001a	! t0_kref+0x37b4:   	andncc	%g0, %i2, %o3
	.word	0x96302274	! t0_kref+0x37b8:   	orn	%g0, 0x274, %o3
	.word	0xd19e9a18	! t0_kref+0x37bc:   	ldda	[%i2 + %i0]0xd0, %f8
	.word	0x96403f34	! t0_kref+0x37c0:   	addc	%g0, -0xcc, %o3
	.word	0x9618248b	! t0_kref+0x37c4:   	xor	%g0, 0x48b, %o3
	.word	0x97a0188a	! t0_kref+0x37c8:   	fitos	%f10, %f11
	.word	0x96b6a445	! t0_kref+0x37cc:   	orncc	%i2, 0x445, %o3
	.word	0x96268000	! t0_kref+0x37d0:   	sub	%i2, %g0, %o3
	.word	0x81d97a27	! t0_kref+0x37d4:   	flush	%g5 - 0x5d9
	.word	0xd66e401a	! t0_kref+0x37d8:   	ldstub	[%i1 + %i2], %o3
	.word	0x9736a004	! t0_kref+0x37dc:   	srl	%i2, 0x4, %o3
	.word	0xd6567fe0	! t0_kref+0x37e0:   	ldsh	[%i1 - 0x20], %o3
	.word	0x33480005	! t0_kref+0x37e4:   	fbe,a,pt	%fcc0, _kref+0x37f8
	.word	0xd6566002	! t0_kref+0x37e8:   	ldsh	[%i1 + 2], %o3
	.word	0x97b00320	! t0_kref+0x37ec:   	bmask	%g0, %g0, %o3
	.word	0x9646801a	! t0_kref+0x37f0:   	addc	%i2, %i2, %o3
	.word	0xe4380018	! t0_kref+0x37f4:   	std	%l2, [%g0 + %i0]
	.word	0x9730001a	! t0_kref+0x37f8:   	srl	%g0, %i2, %o3
	.word	0xe03e7ff0	! t0_kref+0x37fc:   	std	%l0, [%i1 - 0x10]
	.word	0x9616af7a	! t0_kref+0x3800:   	or	%i2, 0xf7a, %o3
	.word	0x97b00c20	! t0_kref+0x3804:   	fzeros	%f11
	.word	0xd7a71019	! t0_kref+0x3808:   	sta	%f11, [%i4 + %i1]0x80
	.word	0x97a01a4a	! t0_kref+0x380c:   	fdtoi	%f10, %f11
	.word	0x97b68320	! t0_kref+0x3810:   	bmask	%i2, %g0, %o3
	.word	0x9fc10000	! t0_kref+0x3814:   	call	%g4
	.word	0x95a2c82b	! t0_kref+0x3818:   	fadds	%f11, %f11, %f10
	.word	0x86102015	! t0_kref+0x381c:   	mov	0x15, %g3
	.word	0x86a0e001	! t0_kref+0x3820:   	subcc	%g3, 1, %g3
	.word	0x22800002	! t0_kref+0x3824:   	be,a	_kref+0x382c
	.word	0x95a2892a	! t0_kref+0x3828:   	fmuls	%f10, %f10, %f10
	.word	0xd6164000	! t0_kref+0x382c:   	lduh	[%i1], %o3
	.word	0x3d800005	! t0_kref+0x3830:   	fbule,a	_kref+0x3844
	.word	0x96f0001a	! t0_kref+0x3834:   	udivcc	%g0, %i2, %o3
	.word	0x97a0052b	! t0_kref+0x3838:   	fsqrts	%f11, %f11
	.word	0x9686a1f2	! t0_kref+0x383c:   	addcc	%i2, 0x1f2, %o3
	.word	0x96802671	! t0_kref+0x3840:   	addcc	%g0, 0x671, %o3
	.word	0xd68e9018	! t0_kref+0x3844:   	lduba	[%i2 + %i0]0x80, %o3
	.word	0xd6062010	! t0_kref+0x3848:   	ld	[%i0 + 0x10], %o3
	.word	0x97a0188b	! t0_kref+0x384c:   	fitos	%f11, %f11
	.word	0x81aacaab	! t0_kref+0x3850:   	fcmpes	%fcc0, %f11, %f11
	.word	0x97b284ca	! t0_kref+0x3854:   	fcmpne32	%f10, %f10, %o3
	.word	0x95a000ab	! t0_kref+0x3858:   	fnegs	%f11, %f10
	.word	0x96568000	! t0_kref+0x385c:   	umul	%i2, %g0, %o3
	.word	0x8d8025aa	! t0_kref+0x3860:   	mov	0x5aa, %fprs
	.word	0xe43e001d	! t0_kref+0x3864:   	std	%l2, [%i0 + %i5]
	.word	0x96902656	! t0_kref+0x3868:   	orcc	%g0, 0x656, %o3
	.word	0x97b284ca	! t0_kref+0x386c:   	fcmpne32	%f10, %f10, %o3
	.word	0x961ea3c3	! t0_kref+0x3870:   	xor	%i2, 0x3c3, %o3
	.word	0x81aa8aca	! t0_kref+0x3874:   	fcmped	%fcc0, %f10, %f10
	.word	0x29480006	! t0_kref+0x3878:   	fbl,a,pt	%fcc0, _kref+0x3890
	.word	0x95a0192b	! t0_kref+0x387c:   	fstod	%f11, %f10
	.word	0x95a288ca	! t0_kref+0x3880:   	fsubd	%f10, %f10, %f10
	.word	0xd5180018	! t0_kref+0x3884:   	ldd	[%g0 + %i0], %f10
	.word	0xd656c019	! t0_kref+0x3888:   	ldsh	[%i3 + %i1], %o3
	.word	0x9730201b	! t0_kref+0x388c:   	srl	%g0, 0x1b, %o3
	.word	0x96868000	! t0_kref+0x3890:   	addcc	%i2, %g0, %o3
	.word	0x95b28a8a	! t0_kref+0x3894:   	fpsub16	%f10, %f10, %f10
	.word	0xe01e2018	! t0_kref+0x3898:   	ldd	[%i0 + 0x18], %l0
	.word	0xb6103ff4	! t0_kref+0x389c:   	mov	0xfffffff4, %i3
	.word	0x97a2c9ab	! t0_kref+0x38a0:   	fdivs	%f11, %f11, %f11
	.word	0x95a2884a	! t0_kref+0x38a4:   	faddd	%f10, %f10, %f10
	.word	0x96883581	! t0_kref+0x38a8:   	andcc	%g0, -0xa7f, %o3
	.word	0x95a000aa	! t0_kref+0x38ac:   	fnegs	%f10, %f10
	.word	0x97a0052b	! t0_kref+0x38b0:   	fsqrts	%f11, %f11
	.word	0xd7270018	! t0_kref+0x38b4:   	st	%f11, [%i4 + %i0]
	.word	0x37800004	! t0_kref+0x38b8:   	fbge,a	_kref+0x38c8
	.word	0x96a80000	! t0_kref+0x38bc:   	andncc	%g0, %g0, %o3
	.word	0x95a0002a	! t0_kref+0x38c0:   	fmovs	%f10, %f10
	.word	0x95a000aa	! t0_kref+0x38c4:   	fnegs	%f10, %f10
	.word	0xd5e6101a	! t0_kref+0x38c8:   	casa	[%i0]0x80, %i2, %o2
	.word	0xd6881018	! t0_kref+0x38cc:   	lduba	[%g0 + %i0]0x80, %o3
	.word	0x97a0002b	! t0_kref+0x38d0:   	fmovs	%f11, %f11
	.word	0xd66e6000	! t0_kref+0x38d4:   	ldstub	[%i1], %o3
	.word	0xd51fbc90	! t0_kref+0x38d8:   	ldd	[%fp - 0x370], %f10
	.word	0x9728001a	! t0_kref+0x38dc:   	sll	%g0, %i2, %o3
	.word	0x973ea010	! t0_kref+0x38e0:   	sra	%i2, 0x10, %o3
	.word	0x96880000	! t0_kref+0x38e4:   	andcc	%g0, %g0, %o3
	.word	0x9666801a	! t0_kref+0x38e8:   	subc	%i2, %i2, %o3
	.word	0x21800004	! t0_kref+0x38ec:   	fbn,a	_kref+0x38fc
	.word	0x96b80000	! t0_kref+0x38f0:   	xnorcc	%g0, %g0, %o3
	.word	0x97a0012b	! t0_kref+0x38f4:   	fabss	%f11, %f11
	.word	0x96b831ea	! t0_kref+0x38f8:   	xnorcc	%g0, -0xe16, %o3
	.word	0x97b2848a	! t0_kref+0x38fc:   	fcmple32	%f10, %f10, %o3
	.word	0x97b00c20	! t0_kref+0x3900:   	fzeros	%f11
	.word	0x95a2884a	! t0_kref+0x3904:   	faddd	%f10, %f10, %f10
	.word	0x96880000	! t0_kref+0x3908:   	andcc	%g0, %g0, %o3
	.word	0x8143e040	! t0_kref+0x390c:   	membar	0x40
	.word	0x81b01022	! t0_kref+0x3910:   	siam	0x2
	.word	0x95a2882b	! t0_kref+0x3914:   	fadds	%f10, %f11, %f10
	.word	0x95a01a2a	! t0_kref+0x3918:   	fstoi	%f10, %f10
	.word	0x97b0011a	! t0_kref+0x391c:   	edge32	%g0, %i2, %o3
	.word	0x965e8000	! t0_kref+0x3920:   	smul	%i2, %g0, %o3
	.word	0x97400000	! t0_kref+0x3924:   	mov	%y, %o3
	.word	0x95a000ca	! t0_kref+0x3928:   	fnegd	%f10, %f10
	.word	0x83414000	! t0_kref+0x392c:   	mov	%pc, %g1
	.word	0xd6164000	! t0_kref+0x3930:   	lduh	[%i1], %o3
	.word	0x95a2884a	! t0_kref+0x3934:   	faddd	%f10, %f10, %f10
	.word	0x9738200a	! t0_kref+0x3938:   	sra	%g0, 0xa, %o3
	.word	0x96f6801a	! t0_kref+0x393c:   	udivcc	%i2, %i2, %o3
	.word	0xd53e2018	! t0_kref+0x3940:   	std	%f10, [%i0 + 0x18]
	.word	0x96200000	! t0_kref+0x3944:   	neg	%g0, %o3
	.word	0x97b2cdab	! t0_kref+0x3948:   	fxors	%f11, %f11, %f11
	.word	0x95a288ca	! t0_kref+0x394c:   	fsubd	%f10, %f10, %f10
	.word	0xf420a034	! t0_kref+0x3950:   	st	%i2, [%g2 + 0x34]
	.word	0x95a000aa	! t0_kref+0x3954:   	fnegs	%f10, %f10
	.word	0x962e8000	! t0_kref+0x3958:   	andn	%i2, %g0, %o3
	.word	0xd59f5059	! t0_kref+0x395c:   	ldda	[%i5 + %i1]0x82, %f10
	.word	0xd51fbd18	! t0_kref+0x3960:   	ldd	[%fp - 0x2e8], %f10
	.word	0xebe6501a	! t0_kref+0x3964:   	casa	[%i1]0x80, %i2, %l5
	.word	0x9762801a	! t0_kref+0x3968:   	movue	%fcc0, %i2, %o3
	.word	0x96d6801a	! t0_kref+0x396c:   	umulcc	%i2, %i2, %o3
	.word	0x37800004	! t0_kref+0x3970:   	fbge,a	_kref+0x3980
	.word	0xc398a080	! t0_kref+0x3974:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0x95b2cfaa	! t0_kref+0x3978:   	fors	%f11, %f10, %f10
	.word	0x96180000	! t0_kref+0x397c:   	xor	%g0, %g0, %o3
	.word	0x9728201e	! t0_kref+0x3980:   	sll	%g0, 0x1e, %o3
	.word	0xf4200018	! t0_kref+0x3984:   	st	%i2, [%g0 + %i0]
	.word	0xc02e3ff7	! t0_kref+0x3988:   	clrb	[%i0 - 9]
	.word	0x95a0188a	! t0_kref+0x398c:   	fitos	%f10, %f10
	.word	0x86102004	! t0_kref+0x3990:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x3994:   	bne,a	_kref+0x3994
	.word	0x86a0e001	! t0_kref+0x3998:   	subcc	%g3, 1, %g3
	.word	0x172ee778	! t0_kref+0x399c:   	sethi	%hi(0xbb9de000), %o3
	.word	0x8610201f	! t0_kref+0x39a0:   	mov	0x1f, %g3
	.word	0x86a0e001	! t0_kref+0x39a4:   	subcc	%g3, 1, %g3
	.word	0x2280001f	! t0_kref+0x39a8:   	be,a	_kref+0x3a24
	.word	0x95a28d2b	! t0_kref+0x39ac:   	fsmuld	%f10, %f11, %f10
	.word	0x973e8000	! t0_kref+0x39b0:   	sra	%i2, %g0, %o3
	.word	0x96be8000	! t0_kref+0x39b4:   	xnorcc	%i2, %g0, %o3
	.word	0x9696a25b	! t0_kref+0x39b8:   	orcc	%i2, 0x25b, %o3
	.word	0x97b2858a	! t0_kref+0x39bc:   	fcmpgt32	%f10, %f10, %o3
	.word	0x97a0012b	! t0_kref+0x39c0:   	fabss	%f11, %f11
	.word	0xe43e6018	! t0_kref+0x39c4:   	std	%l2, [%i1 + 0x18]
	.word	0xb8102018	! t0_kref+0x39c8:   	mov	0x18, %i4
	.word	0xe03e6008	! t0_kref+0x39cc:   	std	%l0, [%i1 + 8]
	.word	0xe4380019	! t0_kref+0x39d0:   	std	%l2, [%g0 + %i1]
	.word	0x96d00000	! t0_kref+0x39d4:   	umulcc	%g0, %g0, %o3
	.word	0xec6e7fe8	! t0_kref+0x39d8:   	ldstub	[%i1 - 0x18], %l6
	.word	0x95a288ca	! t0_kref+0x39dc:   	fsubd	%f10, %f10, %f10
	.word	0x97b00020	! t0_kref+0x39e0:   	edge8n	%g0, %g0, %o3
	.word	0x95b00cca	! t0_kref+0x39e4:   	fnot2	%f10, %f10
	.word	0x95a0002b	! t0_kref+0x39e8:   	fmovs	%f11, %f10
	.word	0x97a289aa	! t0_kref+0x39ec:   	fdivs	%f10, %f10, %f11
	.word	0x971eb802	! t0_kref+0x39f0:   	tsubcctv	%i2, -0x7fe, %o3
	.word	0x95a2894a	! t0_kref+0x39f4:   	fmuld	%f10, %f10, %f10
	.word	0xd616201e	! t0_kref+0x39f8:   	lduh	[%i0 + 0x1e], %o3
	.word	0x2d800004	! t0_kref+0x39fc:   	fbg,a	_kref+0x3a0c
	.word	0x9726aa32	! t0_kref+0x3a00:   	mulscc	%i2, 0xa32, %o3
	.word	0x96c0001a	! t0_kref+0x3a04:   	addccc	%g0, %i2, %o3
	.word	0xe4180019	! t0_kref+0x3a08:   	ldd	[%g0 + %i1], %l2
	.word	0x971eb8e1	! t0_kref+0x3a0c:   	tsubcctv	%i2, -0x71f, %o3
	.word	0x96180000	! t0_kref+0x3a10:   	xor	%g0, %g0, %o3
	.word	0x95a0190a	! t0_kref+0x3a14:   	fitod	%f10, %f10
	.word	0x96a80000	! t0_kref+0x3a18:   	andncc	%g0, %g0, %o3
	.word	0x95a0102a	! t0_kref+0x3a1c:   	fstox	%f10, %f10
	.word	0x95a0052b	! t0_kref+0x3a20:   	fsqrts	%f11, %f10
	.word	0x95b2c62a	! t0_kref+0x3a24:   	fmul8x16	%f11, %f10, %f10
	.word	0x97b28faa	! t0_kref+0x3a28:   	fors	%f10, %f10, %f11
	.word	0x97a000ab	! t0_kref+0x3a2c:   	fnegs	%f11, %f11
	.word	0xc020a00c	! t0_kref+0x3a30:   	clr	[%g2 + 0xc]
	.word	0x9770001a	! t0_kref+0x3a34:   	popc	%i2, %o3
	.word	0x97a0188b	! t0_kref+0x3a38:   	fitos	%f11, %f11
	.word	0xe03e7ff0	! t0_kref+0x3a3c:   	std	%l0, [%i1 - 0x10]
	.word	0x97a2892b	! t0_kref+0x3a40:   	fmuls	%f10, %f11, %f11
	.word	0x95b28f8a	! t0_kref+0x3a44:   	for	%f10, %f10, %f10
	.word	0x96080000	! t0_kref+0x3a48:   	and	%g0, %g0, %o3
	.word	0x9656801a	! t0_kref+0x3a4c:   	umul	%i2, %i2, %o3
	.word	0x81df6654	! t0_kref+0x3a50:   	flush	%i5 + 0x654
	.word	0x95b2c6ab	! t0_kref+0x3a54:   	fmul8x16al	%f11, %f11, %f10
	.word	0x9766a669	! t0_kref+0x3a58:   	movg	%icc, -0x197, %o3
	.word	0xc036001b	! t0_kref+0x3a5c:   	clrh	[%i0 + %i3]
	.word	0xe41e7fe0	! t0_kref+0x3a60:   	ldd	[%i1 - 0x20], %l2
	.word	0x96183b2c	! t0_kref+0x3a64:   	xor	%g0, -0x4d4, %o3
	.word	0x97a000ab	! t0_kref+0x3a68:   	fnegs	%f11, %f11
	.word	0x9660001a	! t0_kref+0x3a6c:   	subc	%g0, %i2, %o3
	.word	0x97b28f6a	! t0_kref+0x3a70:   	fornot1s	%f10, %f10, %f11
	.word	0x95a0192b	! t0_kref+0x3a74:   	fstod	%f11, %f10
	.word	0xd51fbf68	! t0_kref+0x3a78:   	ldd	[%fp - 0x98], %f10
	.word	0xd51e3ff8	! t0_kref+0x3a7c:   	ldd	[%i0 - 8], %f10
	.word	0xc398a080	! t0_kref+0x3a80:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0xd6c71018	! t0_kref+0x3a84:   	ldswa	[%i4 + %i0]0x80, %o3
	.word	0x96082b02	! t0_kref+0x3a88:   	and	%g0, 0xb02, %o3
	.word	0x95b28e4a	! t0_kref+0x3a8c:   	fxnor	%f10, %f10, %f10
	.word	0x97b00ceb	! t0_kref+0x3a90:   	fnot2s	%f11, %f11
	.word	0x95b28eca	! t0_kref+0x3a94:   	fornot2	%f10, %f10, %f10
	.word	0x97168000	! t0_kref+0x3a98:   	taddcctv	%i2, %g0, %o3
	.word	0xd5e6501a	! t0_kref+0x3a9c:   	casa	[%i1]0x80, %i2, %o2
	.word	0xf428a017	! t0_kref+0x3aa0:   	stb	%i2, [%g2 + 0x17]
	.word	0x81580000	! t0_kref+0x3aa4:   	flushw
	.word	0x96e00000	! t0_kref+0x3aa8:   	subccc	%g0, %g0, %o3
	.word	0x25480002	! t0_kref+0x3aac:   	fblg,a,pt	%fcc0, _kref+0x3ab4
	.word	0x967ea888	! t0_kref+0x3ab0:   	sdiv	%i2, 0x888, %o3
	.word	0xc768a086	! t0_kref+0x3ab4:   	prefetch	%g2 + 0x86, 3
	.word	0x95a2884a	! t0_kref+0x3ab8:   	faddd	%f10, %f10, %f10
	.word	0x9656b2b7	! t0_kref+0x3abc:   	umul	%i2, -0xd49, %o3
	.word	0x96b82c7e	! t0_kref+0x3ac0:   	xnorcc	%g0, 0xc7e, %o3
	.word	0xd51fbee0	! t0_kref+0x3ac4:   	ldd	[%fp - 0x120], %f10
	.word	0x37480008	! t0_kref+0x3ac8:   	fbge,a,pt	%fcc0, _kref+0x3ae8
	.word	0x97a0188b	! t0_kref+0x3acc:   	fitos	%f11, %f11
	.word	0xe4380018	! t0_kref+0x3ad0:   	std	%l2, [%g0 + %i0]
	call	SYM(t0_subr0)
	.word	0x969031f8	! t0_kref+0x3ad8:   	orcc	%g0, -0xe08, %o3
	.word	0xf5ee501b	! t0_kref+0x3adc:   	prefetcha	%i1 + %i3, 26
	.word	0x9646b652	! t0_kref+0x3ae0:   	addc	%i2, -0x9ae, %o3
	.word	0xe43e3ff0	! t0_kref+0x3ae4:   	std	%l2, [%i0 - 0x10]
	.word	0x97a0012a	! t0_kref+0x3ae8:   	fabss	%f10, %f11
	.word	0xf4300018	! t0_kref+0x3aec:   	sth	%i2, [%g0 + %i0]
	.word	0x96e6a3a7	! t0_kref+0x3af0:   	subccc	%i2, 0x3a7, %o3
	.word	0xc398a080	! t0_kref+0x3af4:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0xe01e7ff8	! t0_kref+0x3af8:   	ldd	[%i1 - 8], %l0
	.word	0x96a83ec9	! t0_kref+0x3afc:   	andncc	%g0, -0x137, %o3
	.word	0xd51e001d	! t0_kref+0x3b00:   	ldd	[%i0 + %i5], %f10
	.word	0x95a2894a	! t0_kref+0x3b04:   	fmuld	%f10, %f10, %f10
	.word	0x95a0052b	! t0_kref+0x3b08:   	fsqrts	%f11, %f10
	.word	0xc398a080	! t0_kref+0x3b0c:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0x95a2894a	! t0_kref+0x3b10:   	fmuld	%f10, %f10, %f10
	.word	0x95a28d2a	! t0_kref+0x3b14:   	fsmuld	%f10, %f10, %f10
	.word	0xd63166ea	! t0_kref+0x3b18:   	sth	%o3, [%g5 + 0x6ea]
	.word	0x95b00fe0	! t0_kref+0x3b1c:   	fones	%f10
	.word	0x96c6a219	! t0_kref+0x3b20:   	addccc	%i2, 0x219, %o3
	.word	0x95a0054a	! t0_kref+0x3b24:   	fsqrtd	%f10, %f10
	.word	0xe01e001d	! t0_kref+0x3b28:   	ldd	[%i0 + %i5], %l0
	.word	0x972ea003	! t0_kref+0x3b2c:   	sll	%i2, 0x3, %o3
	.word	0x95a2cd2b	! t0_kref+0x3b30:   	fsmuld	%f11, %f11, %f10
	.word	0xd6567ffe	! t0_kref+0x3b34:   	ldsh	[%i1 - 2], %o3
	.word	0x97a2c9aa	! t0_kref+0x3b38:   	fdivs	%f11, %f10, %f11
	.word	0x95a2894a	! t0_kref+0x3b3c:   	fmuld	%f10, %f10, %f10
	.word	0x35800003	! t0_kref+0x3b40:   	fbue,a	_kref+0x3b4c
	.word	0x95b00c20	! t0_kref+0x3b44:   	fzeros	%f10
	.word	0xd696101b	! t0_kref+0x3b48:   	lduha	[%i0 + %i3]0x80, %o3
	.word	0x95a0054a	! t0_kref+0x3b4c:   	fsqrtd	%f10, %f10
	.word	0x95a0188a	! t0_kref+0x3b50:   	fitos	%f10, %f10
	.word	0x96be8000	! t0_kref+0x3b54:   	xnorcc	%i2, %g0, %o3
	.word	0x96a8001a	! t0_kref+0x3b58:   	andncc	%g0, %i2, %o3
	.word	0x81d9401a	! t0_kref+0x3b5c:   	flush	%g5 + %i2
	.word	0x95b00ceb	! t0_kref+0x3b60:   	fnot2s	%f11, %f10
	.word	0x972ea00b	! t0_kref+0x3b64:   	sll	%i2, 0xb, %o3
	.word	0x95a28d2b	! t0_kref+0x3b68:   	fsmuld	%f10, %f11, %f10
	.word	0x95aa804a	! t0_kref+0x3b6c:   	fmovdue	%fcc0, %f10, %f10
	.word	0x96e03b65	! t0_kref+0x3b70:   	subccc	%g0, -0x49b, %o3
	.word	0x95b2898a	! t0_kref+0x3b74:   	bshuffle	%f10, %f10, %f10
	.word	0xc0263ffc	! t0_kref+0x3b78:   	clr	[%i0 - 4]
	.word	0xd64e3fe7	! t0_kref+0x3b7c:   	ldsb	[%i0 - 0x19], %o3
	.word	0x81dc8019	! t0_kref+0x3b80:   	flush	%l2 + %i1
	.word	0x95b28d40	! t0_kref+0x3b84:   	fnot1	%f10, %f10
	.word	0x9646b9ee	! t0_kref+0x3b88:   	addc	%i2, -0x612, %o3
	.word	0xe03e4000	! t0_kref+0x3b8c:   	std	%l0, [%i1]
	.word	0x81dbbb93	! t0_kref+0x3b90:   	flush	%sp - 0x46d
	.word	0x96e68000	! t0_kref+0x3b94:   	subccc	%i2, %g0, %o3
	.word	0x965ea13a	! t0_kref+0x3b98:   	smul	%i2, 0x13a, %o3
	.word	0x96102346	! t0_kref+0x3b9c:   	mov	0x346, %o3
	.word	0x969e8000	! t0_kref+0x3ba0:   	xorcc	%i2, %g0, %o3
	.word	0xe03e3ff8	! t0_kref+0x3ba4:   	std	%l0, [%i0 - 8]
	.word	0x97b6835a	! t0_kref+0x3ba8:   	alignaddrl	%i2, %i2, %o3
	.word	0x95b2c62a	! t0_kref+0x3bac:   	fmul8x16	%f11, %f10, %f10
	.word	0x8143c000	! t0_kref+0x3bb0:   	stbar
	.word	0x96be801a	! t0_kref+0x3bb4:   	xnorcc	%i2, %i2, %o3
	.word	0x96aebf76	! t0_kref+0x3bb8:   	andncc	%i2, -0x8a, %o3
	.word	0x962eaece	! t0_kref+0x3bbc:   	andn	%i2, 0xece, %o3
	.word	0x95a2884a	! t0_kref+0x3bc0:   	faddd	%f10, %f10, %f10
	.word	0xc12e001c	! t0_kref+0x3bc4:   	st	%fsr, [%i0 + %i4]
	.word	0xd7a71018	! t0_kref+0x3bc8:   	sta	%f11, [%i4 + %i0]0x80
	.word	0xd5be501d	! t0_kref+0x3bcc:   	stda	%f10, [%i1 + %i5]0x80
	.word	0xf4267fe8	! t0_kref+0x3bd0:   	st	%i2, [%i1 - 0x18]
	.word	0x973ea00b	! t0_kref+0x3bd4:   	sra	%i2, 0xb, %o3
	.word	0x962eaf08	! t0_kref+0x3bd8:   	andn	%i2, 0xf08, %o3
	.word	0x96a82947	! t0_kref+0x3bdc:   	andncc	%g0, 0x947, %o3
	.word	0x9636a496	! t0_kref+0x3be0:   	orn	%i2, 0x496, %o3
	.word	0x28800004	! t0_kref+0x3be4:   	bleu,a	_kref+0x3bf4
	.word	0x9700291e	! t0_kref+0x3be8:   	taddcc	%g0, 0x91e, %o3
	.word	0x96368000	! t0_kref+0x3bec:   	orn	%i2, %g0, %o3
	.word	0x31800003	! t0_kref+0x3bf0:   	fba,a	_kref+0x3bfc
	.word	0xd7270019	! t0_kref+0x3bf4:   	st	%f11, [%i4 + %i1]
	.word	0x97b6831a	! t0_kref+0x3bf8:   	alignaddr	%i2, %i2, %o3
	.word	0x8143e051	! t0_kref+0x3bfc:   	membar	0x51
	.word	0x3b480003	! t0_kref+0x3c00:   	fble,a,pt	%fcc0, _kref+0x3c0c
	.word	0x95a0188b	! t0_kref+0x3c04:   	fitos	%f11, %f10
	.word	0xd6064000	! t0_kref+0x3c08:   	ld	[%i1], %o3
	.word	0xe4180018	! t0_kref+0x3c0c:   	ldd	[%g0 + %i0], %l2
	.word	0x97a018ca	! t0_kref+0x3c10:   	fdtos	%f10, %f11
	.word	0xf4a6101c	! t0_kref+0x3c14:   	sta	%i2, [%i0 + %i4]0x80
	.word	0x967e801a	! t0_kref+0x3c18:   	sdiv	%i2, %i2, %o3
	.word	0x95a2892b	! t0_kref+0x3c1c:   	fmuls	%f10, %f11, %f10
	.word	0x95a2884a	! t0_kref+0x3c20:   	faddd	%f10, %f10, %f10
	.word	0x81aa8aaa	! t0_kref+0x3c24:   	fcmpes	%fcc0, %f10, %f10
	.word	0x95a2894a	! t0_kref+0x3c28:   	fmuld	%f10, %f10, %f10
	.word	0x95b00fe0	! t0_kref+0x3c2c:   	fones	%f10
	.word	0x8143c000	! t0_kref+0x3c30:   	stbar
	.word	0x8143e040	! t0_kref+0x3c34:   	membar	0x40
	.word	0x9730201e	! t0_kref+0x3c38:   	srl	%g0, 0x1e, %o3
	.word	0x95b28a0a	! t0_kref+0x3c3c:   	fpadd16	%f10, %f10, %f10
	.word	0x9fc10000	! t0_kref+0x3c40:   	call	%g4
	.word	0xd51fbf10	! t0_kref+0x3c44:   	ldd	[%fp - 0xf0], %f10
	.word	0x95a2884a	! t0_kref+0x3c48:   	faddd	%f10, %f10, %f10
	.word	0x95b2c72a	! t0_kref+0x3c4c:   	fmuld8ulx16	%f11, %f10, %f10
	.word	0x96f0001a	! t0_kref+0x3c50:   	udivcc	%g0, %i2, %o3
	.word	0x9730200e	! t0_kref+0x3c54:   	srl	%g0, 0xe, %o3
	.word	0x81800000	! t0_kref+0x3c58:   	mov	%g0, %y
	.word	0x95a2884a	! t0_kref+0x3c5c:   	faddd	%f10, %f10, %f10
	.word	0x965e8000	! t0_kref+0x3c60:   	smul	%i2, %g0, %o3
	.word	0xd51e4000	! t0_kref+0x3c64:   	ldd	[%i1], %f10
	.word	0xf420a020	! t0_kref+0x3c68:   	st	%i2, [%g2 + 0x20]
	.word	0x95a0054a	! t0_kref+0x3c6c:   	fsqrtd	%f10, %f10
	.word	0x8143c000	! t0_kref+0x3c70:   	stbar
	.word	0xd5801018	! t0_kref+0x3c74:   	lda	[%g0 + %i0]0x80, %f10
	.word	0xef68a08f	! t0_kref+0x3c78:   	prefetch	%g2 + 0x8f, 23
	.word	0xd686101c	! t0_kref+0x3c7c:   	lda	[%i0 + %i4]0x80, %o3
	.word	0x97b2854a	! t0_kref+0x3c80:   	fcmpeq16	%f10, %f10, %o3
	.word	0x96968000	! t0_kref+0x3c84:   	orcc	%i2, %g0, %o3
	.word	0x81aa8aab	! t0_kref+0x3c88:   	fcmpes	%fcc0, %f10, %f11
	.word	0x95b2862a	! t0_kref+0x3c8c:   	fmul8x16	%f10, %f10, %f10
	.word	0xd6160000	! t0_kref+0x3c90:   	lduh	[%i0], %o3
	.word	0xf4766018	! t0_kref+0x3c94:   	stx	%i2, [%i1 + 0x18]
	.word	0x97b2ceea	! t0_kref+0x3c98:   	fornot2s	%f11, %f10, %f11
	.word	0x971e801a	! t0_kref+0x3c9c:   	tsubcctv	%i2, %i2, %o3
	.word	0x96be8000	! t0_kref+0x3ca0:   	xnorcc	%i2, %g0, %o3
	.word	0xd64e600f	! t0_kref+0x3ca4:   	ldsb	[%i1 + 0xf], %o3
	.word	0x973ea014	! t0_kref+0x3ca8:   	sra	%i2, 0x14, %o3
	.word	0x95a2884a	! t0_kref+0x3cac:   	faddd	%f10, %f10, %f10
	.word	0xc807bff0	! t0_kref+0x3cb0:   	ld	[%fp - 0x10], %g4
	.word	0x9616801a	! t0_kref+0x3cb4:   	or	%i2, %i2, %o3
	.word	0x960eb693	! t0_kref+0x3cb8:   	and	%i2, -0x96d, %o3
	.word	0xe3b8a080	! t0_kref+0x3cbc:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x96868000	! t0_kref+0x3cc0:   	addcc	%i2, %g0, %o3
	.word	0xc030a038	! t0_kref+0x3cc4:   	clrh	[%g2 + 0x38]
	.word	0x33800002	! t0_kref+0x3cc8:   	fbe,a	_kref+0x3cd0
	.word	0x95b28d2b	! t0_kref+0x3ccc:   	fandnot1s	%f10, %f11, %f10
	.word	0x95a0014a	! t0_kref+0x3cd0:   	fabsd	%f10, %f10
	.word	0x95a2884a	! t0_kref+0x3cd4:   	faddd	%f10, %f10, %f10
	.word	0xd616c018	! t0_kref+0x3cd8:   	lduh	[%i3 + %i0], %o3
	.word	0xd51e0000	! t0_kref+0x3cdc:   	ldd	[%i0], %f10
	.word	0xd6163fe8	! t0_kref+0x3ce0:   	lduh	[%i0 - 0x18], %o3
	.word	0x95a0012a	! t0_kref+0x3ce4:   	fabss	%f10, %f10
	.word	0x95b2898a	! t0_kref+0x3ce8:   	bshuffle	%f10, %f10, %f10
	.word	0x96d68000	! t0_kref+0x3cec:   	umulcc	%i2, %g0, %o3
	.word	0x95a0110a	! t0_kref+0x3cf0:   	fxtod	%f10, %f10
	.word	0xc398a040	! t0_kref+0x3cf4:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0x96500000	! t0_kref+0x3cf8:   	umul	%g0, %g0, %o3
	.word	0x95a0192b	! t0_kref+0x3cfc:   	fstod	%f11, %f10
	.word	0xe43e2000	! t0_kref+0x3d00:   	std	%l2, [%i0]
	.word	0x96168000	! t0_kref+0x3d04:   	or	%i2, %g0, %o3
	.word	0x96be801a	! t0_kref+0x3d08:   	xnorcc	%i2, %i2, %o3
	.word	0x96c02b08	! t0_kref+0x3d0c:   	addccc	%g0, 0xb08, %o3
	.word	0x96f0001a	! t0_kref+0x3d10:   	udivcc	%g0, %i2, %o3
	.word	0x97b284ca	! t0_kref+0x3d14:   	fcmpne32	%f10, %f10, %o3
	.word	0xd1be1800	! t0_kref+0x3d18:   	stda	%f8, [%i0]0xc0
	.word	0x9696b390	! t0_kref+0x3d1c:   	orcc	%i2, -0xc70, %o3
	.word	0x95a289ab	! t0_kref+0x3d20:   	fdivs	%f10, %f11, %f10
	.word	0x9636bb64	! t0_kref+0x3d24:   	orn	%i2, -0x49c, %o3
	.word	0x96c0309a	! t0_kref+0x3d28:   	addccc	%g0, -0xf66, %o3
	.word	0xc398a040	! t0_kref+0x3d2c:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0x96f6aba3	! t0_kref+0x3d30:   	udivcc	%i2, 0xba3, %o3
	.word	0x97a01a2b	! t0_kref+0x3d34:   	fstoi	%f11, %f11
	.word	0x95b28c4a	! t0_kref+0x3d38:   	fnor	%f10, %f10, %f10
	.word	0xd51e7fe8	! t0_kref+0x3d3c:   	ldd	[%i1 - 0x18], %f10
	.word	0x878020e0	! t0_kref+0x3d40:   	mov	0xe0, %asi
	.word	0x96f6801a	! t0_kref+0x3d44:   	udivcc	%i2, %i2, %o3
	.word	0x95a0192a	! t0_kref+0x3d48:   	fstod	%f10, %f10
	.word	0x97a01a2b	! t0_kref+0x3d4c:   	fstoi	%f11, %f11
	.word	0xd51e2000	! t0_kref+0x3d50:   	ldd	[%i0], %f10
	.word	0x97400000	! t0_kref+0x3d54:   	mov	%y, %o3
	.word	0xd5267ff8	! t0_kref+0x3d58:   	st	%f10, [%i1 - 8]
	.word	0x96400000	! t0_kref+0x3d5c:   	addc	%g0, %g0, %o3
	.word	0x95b28e80	! t0_kref+0x3d60:   	fsrc1	%f10, %f10
	.word	0x95a0188a	! t0_kref+0x3d64:   	fitos	%f10, %f10
	.word	0x96f6801a	! t0_kref+0x3d68:   	udivcc	%i2, %i2, %o3
	.word	0x95a000ca	! t0_kref+0x3d6c:   	fnegd	%f10, %f10
	.word	0x9690001a	! t0_kref+0x3d70:   	orcc	%g0, %i2, %o3
	.word	0x8d803718	! t0_kref+0x3d74:   	mov	0xfffff718, %fprs
	.word	0xd780105c	! t0_kref+0x3d78:   	lda	[%g0 + %i4]0x82, %f11
	.word	0xd696101b	! t0_kref+0x3d7c:   	lduha	[%i0 + %i3]0x80, %o3
	.word	0x9660001a	! t0_kref+0x3d80:   	subc	%g0, %i2, %o3
	.word	0x96b80000	! t0_kref+0x3d84:   	xnorcc	%g0, %g0, %o3
	.word	0x96f00000	! t0_kref+0x3d88:   	udivcc	%g0, %g0, %o3
	.word	0x97a289ab	! t0_kref+0x3d8c:   	fdivs	%f10, %f11, %f11
	.word	0x97b680ba	! t0_kref+0x3d90:   	edge16n	%i2, %i2, %o3
	.word	0x969039f5	! t0_kref+0x3d94:   	orcc	%g0, -0x60b, %o3
	.word	0x97b68280	! t0_kref+0x3d98:   	array32	%i2, %g0, %o3
	.word	0x95a2894a	! t0_kref+0x3d9c:   	fmuld	%f10, %f10, %f10
	.word	0x95a0110a	! t0_kref+0x3da0:   	fxtod	%f10, %f10
	.word	0x96f03f45	! t0_kref+0x3da4:   	udivcc	%g0, -0xbb, %o3
	.word	0x97b00160	! t0_kref+0x3da8:   	edge32ln	%g0, %g0, %o3
	.word	0x96b80000	! t0_kref+0x3dac:   	xnorcc	%g0, %g0, %o3
	.word	0xf4a71018	! t0_kref+0x3db0:   	sta	%i2, [%i4 + %i0]0x80
	.word	0x95a0012a	! t0_kref+0x3db4:   	fabss	%f10, %f10
	.word	0x9690001a	! t0_kref+0x3db8:   	orcc	%g0, %i2, %o3
	.word	0x97b0005a	! t0_kref+0x3dbc:   	edge8l	%g0, %i2, %o3
	.word	0x96d038a4	! t0_kref+0x3dc0:   	umulcc	%g0, -0x75c, %o3
	.word	0x97b680da	! t0_kref+0x3dc4:   	edge16l	%i2, %i2, %o3
	.word	0x9740c000	! t0_kref+0x3dc8:   	mov	%asi, %o3
	.word	0xd6560000	! t0_kref+0x3dcc:   	ldsh	[%i0], %o3
	.word	0x95a2894a	! t0_kref+0x3dd0:   	fmuld	%f10, %f10, %f10
	.word	0xd6d6501b	! t0_kref+0x3dd4:   	ldsha	[%i1 + %i3]0x80, %o3
	.word	0xd616001b	! t0_kref+0x3dd8:   	lduh	[%i0 + %i3], %o3
	.word	0xd19eda59	! t0_kref+0x3ddc:   	ldda	[%i3 + %i1]0xd2, %f8
	.word	0x9626be0a	! t0_kref+0x3de0:   	sub	%i2, -0x1f6, %o3
	.word	0xd6c65000	! t0_kref+0x3de4:   	ldswa	[%i1]0x80, %o3
	.word	0x95b28aca	! t0_kref+0x3de8:   	fpsub32	%f10, %f10, %f10
	.word	0x96f82d16	! t0_kref+0x3dec:   	sdivcc	%g0, 0xd16, %o3
	.word	0x9656bc41	! t0_kref+0x3df0:   	umul	%i2, -0x3bf, %o3
	.word	0x96168000	! t0_kref+0x3df4:   	or	%i2, %g0, %o3
	.word	0x95a000ca	! t0_kref+0x3df8:   	fnegd	%f10, %f10
	.word	0xd60e3fee	! t0_kref+0x3dfc:   	ldub	[%i0 - 0x12], %o3
	.word	0x95b2caeb	! t0_kref+0x3e00:   	fpsub32s	%f11, %f11, %f10
	.word	0x95a01a4a	! t0_kref+0x3e04:   	fdtoi	%f10, %f10
	.word	0x96b03903	! t0_kref+0x3e08:   	orncc	%g0, -0x6fd, %o3
	.word	0x9630310e	! t0_kref+0x3e0c:   	orn	%g0, -0xef2, %o3
	.word	0x35480007	! t0_kref+0x3e10:   	fbue,a,pt	%fcc0, _kref+0x3e2c
	.word	0xc028a034	! t0_kref+0x3e14:   	clrb	[%g2 + 0x34]
	.word	0x96802204	! t0_kref+0x3e18:   	addcc	%g0, 0x204, %o3
	.word	0x8143c000	! t0_kref+0x3e1c:   	stbar
	.word	0x81aacaab	! t0_kref+0x3e20:   	fcmpes	%fcc0, %f11, %f11
	.word	0x96100000	! t0_kref+0x3e24:   	clr	%o3
	.word	0x9fc00004	! t0_kref+0x3e28:   	call	%g0 + %g4
	.word	0x95b28a0a	! t0_kref+0x3e2c:   	fpadd16	%f10, %f10, %f10
	.word	0xd6063ff8	! t0_kref+0x3e30:   	ld	[%i0 - 8], %o3
	.word	0xef6e001a	! t0_kref+0x3e34:   	prefetch	%i0 + %i2, 23
	.word	0x97282017	! t0_kref+0x3e38:   	sll	%g0, 0x17, %o3
	.word	0x96600000	! t0_kref+0x3e3c:   	subc	%g0, %g0, %o3
	.word	0x97a0052a	! t0_kref+0x3e40:   	fsqrts	%f10, %f11
	.word	0x95b2c66b	! t0_kref+0x3e44:   	fmul8x16au	%f11, %f11, %f10
	.word	0x86102001	! t0_kref+0x3e48:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x3e4c:   	bne,a	_kref+0x3e4c
	.word	0x86a0e001	! t0_kref+0x3e50:   	subcc	%g3, 1, %g3
	.word	0x95a0190b	! t0_kref+0x3e54:   	fitod	%f11, %f10
	.word	0x2d800003	! t0_kref+0x3e58:   	fbg,a	_kref+0x3e64
	.word	0x95a8802a	! t0_kref+0x3e5c:   	fmovslg	%fcc0, %f10, %f10
	.word	0x965e801a	! t0_kref+0x3e60:   	smul	%i2, %i2, %o3
	.word	0xd640a02c	! t0_kref+0x3e64:   	ldsw	[%g2 + 0x2c], %o3
	.word	0xd64e601e	! t0_kref+0x3e68:   	ldsb	[%i1 + 0x1e], %o3
	.word	0x95a288ca	! t0_kref+0x3e6c:   	fsubd	%f10, %f10, %f10
	.word	0x96e68000	! t0_kref+0x3e70:   	subccc	%i2, %g0, %o3
	.word	0x97b28eea	! t0_kref+0x3e74:   	fornot2s	%f10, %f10, %f11
	.word	0x81aacaab	! t0_kref+0x3e78:   	fcmpes	%fcc0, %f11, %f11
	.word	0xe43f4019	! t0_kref+0x3e7c:   	std	%l2, [%i5 + %i1]
	call	SYM(_kaos_done)
	.word	0x01000000	! t0_kref+0x3e84:   	nop
	KGLOBAL(t0_ktbl_end)
t0_ktbl_end:
t0_ktbl_page_end:

KTEXT_MODULE(t0_module_subr0, 0x4c2c8000)
.seg "text"
t0_subr0_page_begin:
	.skip 8192
.global _t0_subr0; ENTRY(t0_subr0)
	.word	0xa6844012	! t0_subr0+0x0:   	addcc	%l1, %l2, %l3
	.word	0x81c3e008	! t0_subr0+0x4:   	retl
	.word	0xaa64c014	! t0_subr0+0x8:   	subc	%l3, %l4, %l5
t0_subr0_page_end:

KTEXT_MODULE(t0_module_subr1, 0x2de0a000)
.seg "text"
t0_subr1_page_begin:
	.skip 8192
.global _t0_subr1; ENTRY(t0_subr1)
	.word	0x9de3bfa0	! t0_subr1+0x0:   	save	%sp, -0x60, %sp
	.word	0xb29eaa5a	! t0_subr1+0x4:   	xorcc	%i2, 0xa5a, %i1
	.word	0x81c7e008	! t0_subr1+0x8:   	ret
	.word	0xa7ee6001	! t0_subr1+0xc:   	restore	%i1, 1, %l3
t0_subr1_page_end:

KTEXT_MODULE(t0_module_subr2, 0x2d89c000)
.seg "text"
t0_subr2_page_begin:
	.skip 8180
.global _t0_subr2; ENTRY(t0_subr2)
	.word	0x9de3bfa0	! t0_subr2+0x0:   	save	%sp, -0x60, %sp
	.word	0xb2066001	! t0_subr2+0x4:   	add	%i1, 1, %i1
	.word	0x81c7e008	! t0_subr2+0x8:   	ret
	.word	0xa3ee6001	! t0_subr2+0xc:   	restore	%i1, 1, %l1
t0_subr2_page_end:

KTEXT_MODULE(t0_module_subr3, 0x5977a000)
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
!  Total operations: 3949  
!
!  Operation frequencies
!
!  name               exp    obs
!  ldsb              0.43   0.51
!  ldub              0.68   0.58
!  ldsh              1.58   1.57
!  lduh              1.09   1.22
!  ld                0.97   1.01
!  ldd               1.28   1.52
!  swap              0.36   0.25
!  ldstub            0.59   0.63
!  stb               0.07   0.05
!  sth               0.84   0.84
!  st                0.19   0.33
!  std               1.25   1.62
!  add               0.26   0.23
!  addcc             0.87   0.94
!  addx              0.69   0.81
!  addxcc            0.24   0.28
!  taddcc            0.30   0.25
!  taddcctv          0.26   0.18
!  sub               0.39   0.53
!  subcc             0.51   0.61
!  subx              0.97   0.99
!  subxcc            1.36   1.19
!  tsubcc            0.07   0.03
!  tsubcctv          0.29   0.38
!  mulscc            1.25   1.06
!  and               1.55   1.52
!  andcc             0.37   0.43
!  andn              0.25   0.35
!  andncc            0.83   0.73
!  or                0.94   0.94
!  orcc              1.27   1.65
!  orn               0.41   0.53
!  orncc             0.40   0.30
!  xor               1.63   1.77
!  xorcc             0.53   0.38
!  xnor              0.13   0.20
!  xnorcc            1.65   1.39
!  sll               0.86   0.86
!  srl               1.16   1.04
!  sra               1.09   0.96
!  unimp             0.08   0.08
!  umul              1.24   1.09
!  smul              1.19   1.37
!  udiv              0.47   0.51
!  sdiv              0.61   0.48
!  umulcc            0.46   0.63
!  smulcc            0.40   0.28
!  udivcc            1.51   1.77
!  sdivcc            0.34   0.30
!  rdy               1.41   1.32
!  wry               0.32   0.35
!  bicc              0.94   0.79
!  sethi             0.55   0.71
!  jmpl              1.02   0.94
!  call              0.16   0.15
!  ticc              0.00   0.00
!  flush             0.86   0.96
!  save              0.04   0.00
!  restore           1.52   0.00
!  stbar             1.14   1.19
!  ldf               0.09   0.05
!  lddf              1.25   1.47
!  stf               0.25   0.43
!  stdf              0.25   0.23
!  fadds             0.54   0.63
!  fsubs             0.12   0.08
!  fmuls             0.46   0.43
!  fdivs             1.52   1.57
!  faddd             1.25   1.24
!  fsubd             0.57   0.68
!  fmuld             1.48   1.80
!  fdivd             0.04   0.03
!  faddq             0.00   0.00
!  fsubq             0.00   0.00
!  fmulq             0.00   0.00
!  fdivq             0.00   0.00
!  fsmuld            1.19   1.29
!  fdmulq            0.00   0.00
!  fitos             1.21   1.11
!  fitod             0.06   0.18
!  fitoq             0.00   0.00
!  fstoi             0.62   0.56
!  fstod             1.20   1.67
!  fstoq             0.00   0.00
!  fdtoi             1.52   1.39
!  fdtos             0.27   0.28
!  fdtoq             0.00   0.00
!  fqtoi             0.00   0.00
!  fqtos             0.00   0.00
!  fqtod             0.00   0.00
!  fmovs             0.74   0.96
!  fnegs             1.06   1.06
!  fabss             1.18   1.37
!  fsqrts            0.78   0.84
!  fsqrtd            1.43   1.09
!  fsqrtq            0.00   0.00
!  fcmps             0.41   0.25
!  fcmpd             0.02   0.03
!  fcmpq             0.00   0.00
!  fcmpes            1.16   1.09
!  fcmped            0.42   0.25
!  fcmpeq            0.00   0.00
!  fbfcc             1.75   2.05
!  ldfsr             0.11   0.00
!  stfsr             0.10   0.05
!  loop              0.91   0.73
!  offset            0.28   0.38
!  area              0.12   0.20
!  target            0.22   0.20
!  goto              0.18   0.13
!  sigsegv           0.07   0.05
!  sigbus            0.20   0.23
!  imodify           0.00   0.00
!  ldfsr_offset      0.28   0.00
!  fpattern          1.08   0.91
!  lbranch           0.06   0.08
!  shmld             0.46   0.56
!  shmst             0.72   0.71
!  shmpf             0.94   1.11
!  shmswap           0.10   0.08
!  shmblkld          1.49   0.23
!  shmblkst          0.57   0.05
!  shmblkchk         0.31   0.15
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
!  casa              0.26   0.41
!  rdasi             0.23   0.18
!  wrasi             0.29   0.25
!  bpcc              0.34   0.25
!  fbpfcc            0.68   0.86
!  fmovscc           0.23   0.05
!  fmovdcc           0.30   0.43
!  fmovqcc           0.00   0.00
!  movcc             0.30   0.33
!  flushw            0.29   0.43
!  membar            0.19   0.05
!  prefetch          0.36   0.43
!  rdpc              0.33   0.35
!  ldqf              0.00   0.00
!  stqf              0.00   0.00
!  ldfa              0.22   0.28
!  lddfa             0.10   0.20
!  ldqfa             0.00   0.00
!  ldsba             0.15   0.10
!  ldsha             0.30   0.28
!  lduba             0.25   0.23
!  lduha             0.28   0.25
!  lda               0.20   0.28
!  ldda              0.28   0.43
!  ldstuba           0.03   0.05
!  prefetcha         0.31   0.10
!  stfa              0.33   0.30
!  stdfa             0.28   0.18
!  stqfa             0.00   0.00
!  stba              0.22   0.33
!  stha              0.22   0.18
!  sta               0.11   0.13
!  stda              0.00   0.00
!  swapa             0.01   0.03
!  fmovd             0.06   0.10
!  fnegd             0.29   0.35
!  fabsd             0.15   0.20
!  fstox             0.11   0.08
!  fdtox             0.16   0.15
!  fxtos             0.05   0.00
!  fxtod             0.18   0.25
!  lds               0.18   0.20
!  ldsa              0.09   0.13
!  ldx               0.08   0.20
!  ldxa              0.31   0.46
!  nofault           0.30   0.33
!  rdgsr             0.07   0.10
!  wrgsr             0.15   0.20
!  fpadd16           0.10   0.18
!  fpadd16s          0.04   0.00
!  fpadd32           0.22   0.25
!  fpadd32s          0.06   0.08
!  fpsub16           0.22   0.18
!  fpsub16s          0.00   0.00
!  fpsub32           0.15   0.13
!  fpsub32s          0.17   0.23
!  fpack16           0.02   0.00
!  fpack32           0.13   0.18
!  fpackfix          0.14   0.25
!  fexpand           0.06   0.13
!  fpmerge           0.00   0.00
!  fmul8x16          0.25   0.46
!  fmul8x16au        0.22   0.23
!  fmul8x16al        0.10   0.08
!  fmul8sux16        0.03   0.00
!  fmul8ulx16        0.20   0.15
!  fmuld8sux16       0.15   0.13
!  fmuld8ulx16       0.30   0.30
!  alignaddr         0.27   0.38
!  alignaddrl        0.28   0.35
!  faligndata        0.12   0.13
!  fzero             0.19   0.08
!  fzeros            0.24   0.41
!  fone              0.06   0.10
!  fones             0.32   0.33
!  fsrc1             0.27   0.28
!  fsrc1s            0.09   0.18
!  fsrc2             0.05   0.10
!  fsrc2s            0.12   0.20
!  fnot1             0.29   0.38
!  fnot1s            0.19   0.15
!  fnot2             0.25   0.23
!  fnot2s            0.24   0.23
!  for               0.16   0.25
!  fors              0.20   0.18
!  fnor              0.03   0.05
!  fnors             0.02   0.05
!  fand              0.21   0.20
!  fands             0.09   0.20
!  fnand             0.07   0.05
!  fnands            0.05   0.03
!  fxor              0.02   0.05
!  fxors             0.19   0.15
!  fxnor             0.20   0.28
!  fxnors            0.25   0.15
!  fornot1           0.08   0.05
!  fornot1s          0.15   0.18
!  fornot2           0.14   0.18
!  fornot2s          0.17   0.13
!  fandnot1          0.23   0.28
!  fandnot1s         0.17   0.33
!  fandnot2          0.07   0.03
!  fandnot2s         0.21   0.28
!  fcmpgt16          0.15   0.20
!  fcmpgt32          0.24   0.18
!  fcmple16          0.10   0.13
!  fcmple32          0.26   0.15
!  fcmpne16          0.02   0.00
!  fcmpne32          0.28   0.38
!  fcmpeq16          0.28   0.30
!  fcmpeq32          0.00   0.00
!  edge8             0.04   0.13
!  edge8l            0.25   0.28
!  edge16            0.08   0.05
!  edge16l           0.21   0.20
!  edge32            0.15   0.28
!  edge32l           0.28   0.18
!  pdist             0.06   0.00
!  partial_st8       0.23   0.20
!  partial_st16      0.15   0.13
!  partial_st32      0.15   0.20
!  short_st8         0.08   0.05
!  short_st16        0.06   0.05
!  short_ld8         0.27   0.18
!  short_ld16        0.08   0.15
!  blkld             0.06   0.00
!  blkst             0.30   0.00
!  blkld_offset      0.04   0.00
!  blkst_offset      0.07   0.00
!  blk_check         0.25   0.25
!  casxa             0.06   0.03
!  rdccr             0.31   0.43
!  rdfprs            0.08   0.05
!  wrccr             0.12   0.08
!  popc              0.13   0.05
!  wrfprs            0.05   0.08
!  stx               0.06   0.08
!  stxa              0.26   0.35
!  cflush            0.00   0.00
!  array8            0.26   0.20
!  array16           0.27   0.25
!  array32           0.27   0.25
!  edge8n            0.20   0.18
!  edge8ln           0.03   0.00
!  edge16n           0.15   0.18
!  edge16ln          0.03   0.00
!  edge32n           0.18   0.10
!  edge32ln          0.16   0.18
!  bmask             0.17   0.20
!  bshuffle          0.29   0.23
!  siam              0.10   0.20
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
KDATA_MODULE(t0_module_offset_table, 0x4f628000)
.seg "data"
t0_offset_table_start:
t0_offset_table_size:	.word	0x00000008
t0_offset_table:
	.word	0x00000000
	.word	0xffffffe0
	.word	0x00000010
	.word	0x00000018
	.word	0xfffffff0
	.word	0xfffffff8
	.word	0x00000008
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

KDATA_MODULE(t0_module_data_in_regs, 0x41a8a000)
.seg "data"
KGLOBAL(t0_data_in_regs)
t0_data_in_regs_start:
t0_data_in_regs:
	.word	0x9798a544          ! %f0
	.word	0x996ab941          ! %f1
	.word	0x05f2d702          ! %f2
	.word	0x4626cd8c          ! %f3
	.word	0x83675cbf          ! %f4
	.word	0xd62eaa72          ! %f5
	.word	0xc6d46a7e          ! %f6
	.word	0x2e36a5b0          ! %f7
	.word	0xe53da6c1          ! %f8
	.word	0xffbbb43f          ! %f9
	.word	0xd92f169f          ! %f10
	.word	0x5f2a03ca          ! %f11
	.word	0x1b74ef55          ! %f12
	.word	0xff2c64ef          ! %f13
	.word	0xf87c16d0          ! %f14
	.word	0x0441853c          ! %f15
	.word	0x60984bfd          ! %f16
	.word	0x0070960e          ! %f17
	.word	0x86e9d0e6          ! %f18
	.word	0xa68265b6          ! %f19
	.word	0x4ba153e6          ! %f20
	.word	0x1e643293          ! %f21
	.word	0x2a428a74          ! %f22
	.word	0x434b2bff          ! %f23
	.word	0x3d2dc75c          ! %f24
	.word	0x0e09bb44          ! %f25
	.word	0x0af89f5d          ! %f26
	.word	0xc5ffdef5          ! %f27
	.word	0x3d23ba7f          ! %f28
	.word	0x71be2d59          ! %f29
	.word	0xb9a70da9          ! %f30
	.word	0xfcd606d2          ! %f31
	.word	0xa1613736          ! %f32
	.word	0x82722f5f          ! %f33
	.word	0xb4ee6a9c          ! %f34
	.word	0x6288feb0          ! %f35
	.word	0x8e6f8a64          ! %f36
	.word	0x374ea85f          ! %f37
	.word	0xb7839504          ! %f38
	.word	0xcc435a4e          ! %f39
	.word	0x7e01b05a          ! %f40
	.word	0xb1e9253f          ! %f41
	.word	0x0dc6b8d2          ! %f42
	.word	0x2c926414          ! %f43
	.word	0xa788948c          ! %f44
	.word	0xc88eb067          ! %f45
	.word	0xb88e77ec          ! %f46
	.word	0x6604f754          ! %f47
	.word	0x949f1886          ! %f48
	.word	0x4771ffa7          ! %f49
	.word	0xb13c4c41          ! %f50
	.word	0x5a673ad2          ! %f51
	.word	0xb0bb1620          ! %f52
	.word	0x46f41c57          ! %f53
	.word	0x26ec771d          ! %f54
	.word	0x82a0ff86          ! %f55
	.word	0x10afd0f0          ! %f56
	.word	0x7f0ce9bf          ! %f57
	.word	0x86e511be          ! %f58
	.word	0xef54c79f          ! %f59
	.word	0x86618b00          ! %f60
	.word	0x304b2db9          ! %f61
	.word	0xe88d1326          ! %f62
	.word	0x67b9b9cb          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0xe48       ! %g1 (code pointer)
	.word	t0_data_in_shm_area ! %g2 (shared area pointer)
	.word	0x9ce7d9f9          ! %g3 (loop index)
	.word	SYM(t0_subr3)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0xccaccf93          ! %o0
	.word	0xe9890697          ! %o1
	.word	0x138c821b          ! %o2
	.word	0x94c44e51          ! %o3
	.word	0x714f16a0          ! %o4
	.word	0x90640f31          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0xced130c0          ! %l0
	.word	0x5839ff95          ! %l1
	.word	0x706d5f32          ! %l2
	.word	0xc30b04b5          ! %l3
	.word	0xefa2503d          ! %l4
	.word	0xdb73c13c          ! %l5
	.word	0x2b4b32eb          ! %l6
	.word	0xa58b76cf          ! %l7
	.word	t0_data_in_area0    ! %i0 (area pointer)
	.word	t0_data_in_area0    ! %i1 (area pointer)
	.word	0x00000012          ! %i2 (byte offset)
	.word	0x0000001e          ! %i3 (halfword offset)
	.word	0x00000010          ! %i4 (word offset)
	.word	0x00000010          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0x8d0c1a23          ! %y
	.word	0x00000000          ! %icc (nzvc)
	.word	0xc0000b28          ! %fsr
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

KDATA_MODULE(t0_module_data_in_stack, 0x165be000)
.seg "data"
KGLOBAL(t0_data_in_mtbl_size)
KGLOBAL(t0_data_in_mtbl)
KGLOBAL(t0_data_in_stack)
t0_data_in_stack_start:
	.word	0x1b1d14f1
	.word	0x2c3df5fc
	.word	0xce72b588
	.word	0x167c4868
	.word	0xb37ce4ab
	.word	0xff34b564
	.word	0xba476472
	.word	0x02ae7410
	.word	0x46b28a99
	.word	0xe8c96579
	.word	0x9c7af515
	.word	0x9437bfd0
	.word	0xfc7cb761
	.word	0x9bf18949
	.word	0xaaf1c8ba
	.word	0x2bdad954
	.word	0xf527a8dc
	.word	0x675c9b09
	.word	0xfa1b4001
	.word	0x1ae089f0
	.word	0x1fb3c02d
	.word	0xc127eaa1
	.word	0x2c221114
	.word	0x380f22c1
	.word	0xdb86e514
	.word	0xe813606d
	.word	0x000f4d1e
	.word	0xe76a0713
	.word	0xa7804a84
	.word	0xc1f92841
	.word	0xae13c8fe
	.word	0xf774f902
	.word	0xadab6872
	.word	0x4ae688ae
	.word	0xf132dd37
	.word	0xb44d0c63
	.word	0xf1483eef
	.word	0xc9546a83
	.word	0x72c4b12b
	.word	0x29a363e4
	.word	0x41ac3678
	.word	0xe6e25496
	.word	0x60f58589
	.word	0xcec41c71
	.word	0x68e0318d
	.word	0x19dedfc3
	.word	0x61cab202
	.word	0x75960ad9
	.word	0xbe15a37f
	.word	0x1714e735
	.word	0xd78d4a42
	.word	0xe5262fb1
	.word	0xcb55c08e
	.word	0x6d04f8e4
	.word	0xc5059e1e
	.word	0xc41c0578
	.word	0xe06b1b32
	.word	0xd626ca5e
	.word	0x3ef20909
	.word	0x7da20cfb
	.word	0x9c3742b9
	.word	0x2746b5c9
	.word	0x9fd6c4cc
	.word	0x5e203bfa
	.word	0xdeab3711
	.word	0x2dcf8327
	.word	0xfaebb375
	.word	0xeadc320c
	.word	0x81b2c5e7
	.word	0x081101db
	.word	0x1dc85490
	.word	0x3a6d57bf
	.word	0x43d024f0
	.word	0xf398366d
	.word	0xcdbd5994
	.word	0x02314c03
	.word	0xad265d85
	.word	0xb3b62089
	.word	0x88ce8da0
	.word	0xf8cf43c7
	.word	0x6c865d75
	.word	0x489e5d4d
	.word	0x92370466
	.word	0xcd9f3fe4
	.word	0xcefbc116
	.word	0xf65729c4
	.word	0x528cc467
	.word	0x22b43d3a
	.word	0xf693aa9d
	.word	0x964889ac
	.word	0x63386060
	.word	0xf196c318
	.word	0x55e93aaf
	.word	0xe6d0967f
	.word	0xff483404
	.word	0x6baf73e1
	.word	0x8aa87e37
	.word	0x4e1f3ab1
	.word	0xffee37ea
	.word	0x853783eb
	.word	0xe2f1e579
	.word	0x20fbdd35
	.word	0x2c72a0c8
	.word	0xd67f3aaa
	.word	0xe5959867
	.word	0x873bc145
	.word	0x1b54bde1
	.word	0xa9b8e20d
	.word	0xecbf3c33
	.word	0x26d81e62
	.word	0x7ff6cabc
	.word	0xd578c827
	.word	0xeb1ffe25
	.word	0xafff349a
	.word	0xccc8a816
	.word	0x44013712
	.word	0x862df7ae
	.word	0x986be109
	.word	0x08b0b018
	.word	0xb77b8710
	.word	0xd9ed3fbc
	.word	0xef0376a1
	.word	0x86b119cc
	.word	0xd9adaef2
	.word	0x1d283d4f
	.word	0x5a71df2d
	.word	0x7bbb9fcd
	.word	0xf4cdf6bc
	.word	0x6d420f4b
	.word	0x7a784892
	.word	0xcf8c5e3e
	.word	0xb90cb089
	.word	0xd0271d90
	.word	0xf422e258
	.word	0xc5801bfc
	.word	0x39861bac
	.word	0xd68d2747
	.word	0x215e6f68
	.word	0x78e97317
	.word	0x41ccd618
	.word	0xa9f5627e
	.word	0x64aeb017
	.word	0x98ab8c7d
	.word	0x5d5f8001
	.word	0xfdf880f7
	.word	0x7e52e862
	.word	0x371862f8
	.word	0x5a6275c2
	.word	0xac8dae3d
	.word	0x7136067b
	.word	0x007bc15a
	.word	0xd320c401
	.word	0x667adaf7
	.word	0xcfdc2d84
	.word	0x4b9b6ff5
	.word	0xdc65ba10
	.word	0x152de980
	.word	0xf457a899
	.word	0x7f084550
	.word	0x7bf2be96
	.word	0x67238fb6
	.word	0x3e6b8a14
	.word	0x6ba30e18
	.word	0x086b4a6e
	.word	0xacfa0211
	.word	0x08a27b0b
	.word	0xeb738055
	.word	0x354b2dce
t0_data_in_sp:
	.word	0x289abbf7
	.word	0x6c847f1d
	.word	0x2b1eaddd
	.word	0xe01983ab
	.word	0x4ac7f94f
	.word	0xff7eb06e
	.word	0x172daa0c
	.word	0xea4cf75c
	.word	t0_data_in_area0
	.word	t0_data_in_area0
	.word	0xfffffff1
	.word	0xffffffe8
	.word	0xfffffff4
	.word	0xfffffff8
	.word	t0_data_in_fp
	.word	0xf66005e2
	.word	0x3cb38c52
	.word	0x6bbff916
	.word	0x260fd0b6
	.word	0xc5830e9d
	.word	0x41f11183
	.word	0x4cd931fb
	.word	0xab35722a
	.word	0x84530f8d
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
	.word   	0x5d7315b6	! [%fp - 0xc]
	.word   	0xd4026975	! [%fp - 0x8]
	.word   	0x48ff78de	! [%fp - 0x4]
.global t0_data_in_fp; t0_data_in_fp:
	.word	0xeaea207d
	.word	0x0d242321
	.word	0x2c86c821
	.word	0xc6323ae6
	.word	0x6a379518
	.word	0xffbfbbf8
	.word	0xc695c818
	.word	0xc02f94e0
	.word	0x22d6f2ac
	.word	0xd7d716dc
	.word	0xf487aa4f
	.word	0x12c4bd8d
	.word	0x6839fe30
	.word	0x3100ae91
	.word	0x6d295e41
	.word	0x47c93ea3
	.word	0x56572688
	.word	0xfd4498f4
	.word	0x29ecbfca
	.word	0x4f7426e0
	.word	0x5b5dcf06
	.word	0x4b82d92b
	.word	0xae444f56
	.word	0x4309c962
t0_data_in_stacktop:
	.word	0
t0_data_in_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_in_area0, 0x2b114000)
.seg "data"
t0_data_in_area0_start:
.skip 7872
t0_data_in_area0_begin:
	.word	0x6f063e34	! t0_data_in_area0-0x20
	.word	0xb9b0211e	! t0_data_in_area0-0x1c
	.word	0x303fc83a	! t0_data_in_area0-0x18
	.word	0xbad59e35	! t0_data_in_area0-0x14
	.word	0x8e2b34d0	! t0_data_in_area0-0x10
	.word	0xc298b625	! t0_data_in_area0-0xc
	.word	0xbbf13961	! t0_data_in_area0-0x8
	.word	0xa389182d	! t0_data_in_area0-0x4
.global t0_data_in_area0; t0_data_in_area0:
	.word	0xbfb77117	! t0_data_in_area0+0x0
	.word	0x35a06d01	! t0_data_in_area0+0x4
	.word	0x8978842b	! t0_data_in_area0+0x8
	.word	0xe75183f6	! t0_data_in_area0+0xc
	.word	0xb7d1a246	! t0_data_in_area0+0x10
	.word	0x22f1f110	! t0_data_in_area0+0x14
	.word	0xc30d6591	! t0_data_in_area0+0x18
	.word	0x69844469	! t0_data_in_area0+0x1c
t0_data_in_area0_end:
.skip 256
t0_data_in_area0_stop:

KDATA_MODULE(t0_module_data_in_shm_area, 0x09006000)
.seg "data"
t0_data_in_shm_area_start:
t0_data_in_shm_area_begin:
.global t0_data_in_shm_area; t0_data_in_shm_area:
	.word	0x33d5905d	! t0_data_in_shm_area+0x0 (t0)
	.word	0x7efecabc	! t0_data_in_shm_area+0x4 (t0)
	.word	0xb33e6d8c	! t0_data_in_shm_area+0x8 (t0)
	.word	0x11e20020	! t0_data_in_shm_area+0xc (t0)
	.word	0x7d517c25	! t0_data_in_shm_area+0x10 (t0)
	.word	0x8854d934	! t0_data_in_shm_area+0x14 (t0)
	.word	0x361d88b7	! t0_data_in_shm_area+0x18 (t0)
	.word	0x1b66944c	! t0_data_in_shm_area+0x1c (t0)
	.word	0x802afb74	! t0_data_in_shm_area+0x20 (t0)
	.word	0x59e5335e	! t0_data_in_shm_area+0x24 (t0)
	.word	0xa8790032	! t0_data_in_shm_area+0x28 (t0)
	.word	0xc3a4e0c5	! t0_data_in_shm_area+0x2c (t0)
	.word	0x687ed5af	! t0_data_in_shm_area+0x30 (t0)
	.word	0x0523a40c	! t0_data_in_shm_area+0x34 (t0)
	.word	0xe8ca13ca	! t0_data_in_shm_area+0x38 (t0)
	.word	0x600ac162	! t0_data_in_shm_area+0x3c (t0)
	.word	0x7403a491	! t0_data_in_shm_area+0x40 (t0 bload)
	.word	0x8225356d	! t0_data_in_shm_area+0x44
	.word	0x2c709256	! t0_data_in_shm_area+0x48
	.word	0xe75ac88a	! t0_data_in_shm_area+0x4c
	.word	0x30ef3d2a	! t0_data_in_shm_area+0x50
	.word	0xdb577fc5	! t0_data_in_shm_area+0x54
	.word	0xf3651463	! t0_data_in_shm_area+0x58
	.word	0x1c6e8f0b	! t0_data_in_shm_area+0x5c
	.word	0xb5db2529	! t0_data_in_shm_area+0x60
	.word	0x4dd1af60	! t0_data_in_shm_area+0x64
	.word	0xab01bd13	! t0_data_in_shm_area+0x68
	.word	0xc52dad2a	! t0_data_in_shm_area+0x6c
	.word	0xe324985d	! t0_data_in_shm_area+0x70
	.word	0xf1db75c4	! t0_data_in_shm_area+0x74
	.word	0x201ba541	! t0_data_in_shm_area+0x78
	.word	0x12d2b0fa	! t0_data_in_shm_area+0x7c
	.word	0xab08e278	! t0_data_in_shm_area+0x80 (t0 bstore)
	.word	0xa0555a25	! t0_data_in_shm_area+0x84
	.word	0xa7a554e9	! t0_data_in_shm_area+0x88
	.word	0x8858a5f1	! t0_data_in_shm_area+0x8c
	.word	0xea871116	! t0_data_in_shm_area+0x90
	.word	0xa4711d1d	! t0_data_in_shm_area+0x94
	.word	0x75b4eec7	! t0_data_in_shm_area+0x98
	.word	0x068101b7	! t0_data_in_shm_area+0x9c
	.word	0x061c41fd	! t0_data_in_shm_area+0xa0
	.word	0xc4e0239c	! t0_data_in_shm_area+0xa4
	.word	0x6b4ef23d	! t0_data_in_shm_area+0xa8
	.word	0x0b8b0a41	! t0_data_in_shm_area+0xac
	.word	0x430011a6	! t0_data_in_shm_area+0xb0
	.word	0xe7891d1c	! t0_data_in_shm_area+0xb4
	.word	0x4e00b779	! t0_data_in_shm_area+0xb8
	.word	0xd4b3091e	! t0_data_in_shm_area+0xbc
t0_data_in_shm_area_end:
t0_data_in_shm_area_stop:

KDATA_MODULE(t0_module_data_exp_regs, 0x1a36e000)
.seg "data"
KGLOBAL(t0_data_exp_regs)
t0_data_exp_regs_start:
t0_data_exp_regs:
	.word	0x9798a544          ! %f0
	.word	0x996ab941          ! %f1
	.word	0x05f2d702          ! %f2
	.word	0x4626cd8c          ! %f3
	.word	0x83675cbf          ! %f4
	.word	0xd62eaa72          ! %f5
	.word	0xc6d46a7e          ! %f6
	.word	0x2e36a5b0          ! %f7
	.word	0xe53da6c1          ! %f8
	.word	0xffbbb43f          ! %f9
	.word	0xd92f169f          ! %f10
	.word	0x5f2a03ca          ! %f11
	.word	0x1b74ef55          ! %f12
	.word	0xff2c64ef          ! %f13
	.word	0xf87c16d0          ! %f14
	.word	0x0441853c          ! %f15
	.word	0x60984bfd          ! %f16
	.word	0x0070960e          ! %f17
	.word	0x86e9d0e6          ! %f18
	.word	0xa68265b6          ! %f19
	.word	0x4ba153e6          ! %f20
	.word	0x1e643293          ! %f21
	.word	0x2a428a74          ! %f22
	.word	0x434b2bff          ! %f23
	.word	0x3d2dc75c          ! %f24
	.word	0x0e09bb44          ! %f25
	.word	0x0af89f5d          ! %f26
	.word	0xc5ffdef5          ! %f27
	.word	0x3d23ba7f          ! %f28
	.word	0x71be2d59          ! %f29
	.word	0xb9a70da9          ! %f30
	.word	0xfcd606d2          ! %f31
	.word	0xa1613736          ! %f32
	.word	0x82722f5f          ! %f33
	.word	0xb4ee6a9c          ! %f34
	.word	0x6288feb0          ! %f35
	.word	0x8e6f8a64          ! %f36
	.word	0x374ea85f          ! %f37
	.word	0xb7839504          ! %f38
	.word	0xcc435a4e          ! %f39
	.word	0x7e01b05a          ! %f40
	.word	0xb1e9253f          ! %f41
	.word	0x0dc6b8d2          ! %f42
	.word	0x2c926414          ! %f43
	.word	0xa788948c          ! %f44
	.word	0xc88eb067          ! %f45
	.word	0xb88e77ec          ! %f46
	.word	0x6604f754          ! %f47
	.word	0x949f1886          ! %f48
	.word	0x4771ffa7          ! %f49
	.word	0xb13c4c41          ! %f50
	.word	0x5a673ad2          ! %f51
	.word	0xb0bb1620          ! %f52
	.word	0x46f41c57          ! %f53
	.word	0x26ec771d          ! %f54
	.word	0x82a0ff86          ! %f55
	.word	0x10afd0f0          ! %f56
	.word	0x7f0ce9bf          ! %f57
	.word	0x86e511be          ! %f58
	.word	0xef54c79f          ! %f59
	.word	0x86618b00          ! %f60
	.word	0x304b2db9          ! %f61
	.word	0xe88d1326          ! %f62
	.word	0x67b9b9cb          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0xe48       ! %g1 (code pointer)
	.word	t0_data_exp_shm_area! %g2 (shared area pointer)
	.word	0x9ce7d9f9          ! %g3 (loop index)
	.word	SYM(t0_subr3)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0xccaccf93          ! %o0
	.word	0xe9890697          ! %o1
	.word	0x138c821b          ! %o2
	.word	0x94c44e51          ! %o3
	.word	0x714f16a0          ! %o4
	.word	0x90640f31          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0xced130c0          ! %l0
	.word	0x5839ff95          ! %l1
	.word	0x706d5f32          ! %l2
	.word	0xc30b04b5          ! %l3
	.word	0xefa2503d          ! %l4
	.word	0xdb73c13c          ! %l5
	.word	0x2b4b32eb          ! %l6
	.word	0xa58b76cf          ! %l7
	.word	t0_data_exp_area0   ! %i0 (area pointer)
	.word	t0_data_exp_area0   ! %i1 (area pointer)
	.word	0x00000012          ! %i2 (byte offset)
	.word	0x0000001e          ! %i3 (halfword offset)
	.word	0x00000010          ! %i4 (word offset)
	.word	0x00000010          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0x8d0c1a23          ! %y
	.word	0x00000000          ! %icc (nzvc)
	.word	0xc0000b28          ! %fsr
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

KDATA_MODULE(t0_module_data_exp_stack, 0x55b00000)
.seg "data"
KGLOBAL(t0_data_exp_mtbl_size)
KGLOBAL(t0_data_exp_mtbl)
KGLOBAL(t0_data_exp_stack)
t0_data_exp_stack_start:
	.word	0x1b1d14f1
	.word	0x2c3df5fc
	.word	0xce72b588
	.word	0x167c4868
	.word	0xb37ce4ab
	.word	0xff34b564
	.word	0xba476472
	.word	0x02ae7410
	.word	0x46b28a99
	.word	0xe8c96579
	.word	0x9c7af515
	.word	0x9437bfd0
	.word	0xfc7cb761
	.word	0x9bf18949
	.word	0xaaf1c8ba
	.word	0x2bdad954
	.word	0xf527a8dc
	.word	0x675c9b09
	.word	0xfa1b4001
	.word	0x1ae089f0
	.word	0x1fb3c02d
	.word	0xc127eaa1
	.word	0x2c221114
	.word	0x380f22c1
	.word	0xdb86e514
	.word	0xe813606d
	.word	0x000f4d1e
	.word	0xe76a0713
	.word	0xa7804a84
	.word	0xc1f92841
	.word	0xae13c8fe
	.word	0xf774f902
	.word	0xadab6872
	.word	0x4ae688ae
	.word	0xf132dd37
	.word	0xb44d0c63
	.word	0xf1483eef
	.word	0xc9546a83
	.word	0x72c4b12b
	.word	0x29a363e4
	.word	0x41ac3678
	.word	0xe6e25496
	.word	0x60f58589
	.word	0xcec41c71
	.word	0x68e0318d
	.word	0x19dedfc3
	.word	0x61cab202
	.word	0x75960ad9
	.word	0xbe15a37f
	.word	0x1714e735
	.word	0xd78d4a42
	.word	0xe5262fb1
	.word	0xcb55c08e
	.word	0x6d04f8e4
	.word	0xc5059e1e
	.word	0xc41c0578
	.word	0xe06b1b32
	.word	0xd626ca5e
	.word	0x3ef20909
	.word	0x7da20cfb
	.word	0x9c3742b9
	.word	0x2746b5c9
	.word	0x9fd6c4cc
	.word	0x5e203bfa
	.word	0xdeab3711
	.word	0x2dcf8327
	.word	0xfaebb375
	.word	0xeadc320c
	.word	0x81b2c5e7
	.word	0x081101db
	.word	0x1dc85490
	.word	0x3a6d57bf
	.word	0x43d024f0
	.word	0xf398366d
	.word	0xcdbd5994
	.word	0x02314c03
	.word	0xad265d85
	.word	0xb3b62089
	.word	0x88ce8da0
	.word	0xf8cf43c7
	.word	0x6c865d75
	.word	0x489e5d4d
	.word	0x92370466
	.word	0xcd9f3fe4
	.word	0xcefbc116
	.word	0xf65729c4
	.word	0x528cc467
	.word	0x22b43d3a
	.word	0xf693aa9d
	.word	0x964889ac
	.word	0x63386060
	.word	0xf196c318
	.word	0x55e93aaf
	.word	0xe6d0967f
	.word	0xff483404
	.word	0x6baf73e1
	.word	0x8aa87e37
	.word	0x4e1f3ab1
	.word	0xffee37ea
	.word	0x853783eb
	.word	0xe2f1e579
	.word	0x20fbdd35
	.word	0x2c72a0c8
	.word	0xd67f3aaa
	.word	0xe5959867
	.word	0x873bc145
	.word	0x1b54bde1
	.word	0xa9b8e20d
	.word	0xecbf3c33
	.word	0x26d81e62
	.word	0x7ff6cabc
	.word	0xd578c827
	.word	0xeb1ffe25
	.word	0xafff349a
	.word	0xccc8a816
	.word	0x44013712
	.word	0x862df7ae
	.word	0x986be109
	.word	0x08b0b018
	.word	0xb77b8710
	.word	0xd9ed3fbc
	.word	0xef0376a1
	.word	0x86b119cc
	.word	0xd9adaef2
	.word	0x1d283d4f
	.word	0x5a71df2d
	.word	0x7bbb9fcd
	.word	0xf4cdf6bc
	.word	0x6d420f4b
	.word	0x7a784892
	.word	0xcf8c5e3e
	.word	0xb90cb089
	.word	0xd0271d90
	.word	0xf422e258
	.word	0xc5801bfc
	.word	0x39861bac
	.word	0xd68d2747
	.word	0x215e6f68
	.word	0x78e97317
	.word	0x41ccd618
	.word	0xa9f5627e
	.word	0x64aeb017
	.word	0x98ab8c7d
	.word	0x5d5f8001
	.word	0xfdf880f7
	.word	0x7e52e862
	.word	0x371862f8
	.word	0x5a6275c2
	.word	0xac8dae3d
	.word	0x7136067b
	.word	0x007bc15a
	.word	0xd320c401
	.word	0x667adaf7
	.word	0xcfdc2d84
	.word	0x4b9b6ff5
	.word	0xdc65ba10
	.word	0x152de980
	.word	0xf457a899
	.word	0x7f084550
	.word	0x7bf2be96
	.word	0x67238fb6
	.word	0x3e6b8a14
	.word	0x6ba30e18
	.word	0x086b4a6e
	.word	0xacfa0211
	.word	0x08a27b0b
	.word	0xeb738055
	.word	0x354b2dce
t0_data_exp_sp:
	.word	0x289abbf7
	.word	0x6c847f1d
	.word	0x2b1eaddd
	.word	0xe01983ab
	.word	0x4ac7f94f
	.word	0xff7eb06e
	.word	0x172daa0c
	.word	0xea4cf75c
	.word	t0_data_exp_area0
	.word	t0_data_exp_area0
	.word	0xfffffff1
	.word	0xffffffe8
	.word	0xfffffff4
	.word	0xfffffff8
	.word	t0_data_exp_fp
	.word	0xf66005e2
	.word	0x3cb38c52
	.word	0x6bbff916
	.word	0x260fd0b6
	.word	0xc5830e9d
	.word	0x41f11183
	.word	0x4cd931fb
	.word	0xab35722a
	.word	0x84530f8d
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
	.word   	0x5d7315b6	! [%fp - 0xc]
	.word   	0xd4026975	! [%fp - 0x8]
	.word   	0x48ff78de	! [%fp - 0x4]
t0_data_exp_fp:
	.word	0xeaea207d
	.word	0x0d242321
	.word	0x2c86c821
	.word	0xc6323ae6
	.word	0x6a379518
	.word	0xffbfbbf8
	.word	0xc695c818
	.word	0xc02f94e0
	.word	0x22d6f2ac
	.word	0xd7d716dc
	.word	0xf487aa4f
	.word	0x12c4bd8d
	.word	0x6839fe30
	.word	0x3100ae91
	.word	0x6d295e41
	.word	0x47c93ea3
	.word	0x56572688
	.word	0xfd4498f4
	.word	0x29ecbfca
	.word	0x4f7426e0
	.word	0x5b5dcf06
	.word	0x4b82d92b
	.word	0xae444f56
	.word	0x4309c962
t0_data_exp_stacktop:
	.word	0
t0_data_exp_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_exp_area0, 0x2b24e000)
.seg "data"
t0_data_exp_area0_start:
.skip 7872
t0_data_exp_area0_begin:
	.word	0x6f063e34	! t0_data_exp_area0-0x20
	.word	0xb9b0211e	! t0_data_exp_area0-0x1c
	.word	0x303fc83a	! t0_data_exp_area0-0x18
	.word	0xbad59e35	! t0_data_exp_area0-0x14
	.word	0x8e2b34d0	! t0_data_exp_area0-0x10
	.word	0xc298b625	! t0_data_exp_area0-0xc
	.word	0xbbf13961	! t0_data_exp_area0-0x8
	.word	0xa389182d	! t0_data_exp_area0-0x4
.global t0_data_exp_area0; t0_data_exp_area0:
	.word	0xbfb77117	! t0_data_exp_area0+0x0
	.word	0x35a06d01	! t0_data_exp_area0+0x4
	.word	0x8978842b	! t0_data_exp_area0+0x8
	.word	0xe75183f6	! t0_data_exp_area0+0xc
	.word	0xb7d1a246	! t0_data_exp_area0+0x10
	.word	0x22f1f110	! t0_data_exp_area0+0x14
	.word	0xc30d6591	! t0_data_exp_area0+0x18
	.word	0x69844469	! t0_data_exp_area0+0x1c
t0_data_exp_area0_end:
.skip 256
t0_data_exp_area0_stop:

KDATA_MODULE(t0_module_data_exp_shm_area, 0x5ae86000)
.seg "data"
t0_data_exp_shm_area_start:
t0_data_exp_shm_area_begin:
.global t0_data_exp_shm_area; t0_data_exp_shm_area:
	.word	0x33d5905d	! t0_data_exp_shm_area+0x0 (t0)
	.word	0x7efecabc	! t0_data_exp_shm_area+0x4 (t0)
	.word	0xb33e6d8c	! t0_data_exp_shm_area+0x8 (t0)
	.word	0x11e20020	! t0_data_exp_shm_area+0xc (t0)
	.word	0x7d517c25	! t0_data_exp_shm_area+0x10 (t0)
	.word	0x8854d934	! t0_data_exp_shm_area+0x14 (t0)
	.word	0x361d88b7	! t0_data_exp_shm_area+0x18 (t0)
	.word	0x1b66944c	! t0_data_exp_shm_area+0x1c (t0)
	.word	0x802afb74	! t0_data_exp_shm_area+0x20 (t0)
	.word	0x59e5335e	! t0_data_exp_shm_area+0x24 (t0)
	.word	0xa8790032	! t0_data_exp_shm_area+0x28 (t0)
	.word	0xc3a4e0c5	! t0_data_exp_shm_area+0x2c (t0)
	.word	0x687ed5af	! t0_data_exp_shm_area+0x30 (t0)
	.word	0x0523a40c	! t0_data_exp_shm_area+0x34 (t0)
	.word	0xe8ca13ca	! t0_data_exp_shm_area+0x38 (t0)
	.word	0x600ac162	! t0_data_exp_shm_area+0x3c (t0)
	.word	0x7403a491	! t0_data_exp_shm_area+0x40 (t0 bload)
	.word	0x8225356d	! t0_data_exp_shm_area+0x44
	.word	0x2c709256	! t0_data_exp_shm_area+0x48
	.word	0xe75ac88a	! t0_data_exp_shm_area+0x4c
	.word	0x30ef3d2a	! t0_data_exp_shm_area+0x50
	.word	0xdb577fc5	! t0_data_exp_shm_area+0x54
	.word	0xf3651463	! t0_data_exp_shm_area+0x58
	.word	0x1c6e8f0b	! t0_data_exp_shm_area+0x5c
	.word	0xb5db2529	! t0_data_exp_shm_area+0x60
	.word	0x4dd1af60	! t0_data_exp_shm_area+0x64
	.word	0xab01bd13	! t0_data_exp_shm_area+0x68
	.word	0xc52dad2a	! t0_data_exp_shm_area+0x6c
	.word	0xe324985d	! t0_data_exp_shm_area+0x70
	.word	0xf1db75c4	! t0_data_exp_shm_area+0x74
	.word	0x201ba541	! t0_data_exp_shm_area+0x78
	.word	0x12d2b0fa	! t0_data_exp_shm_area+0x7c
	.word	0xab08e278	! t0_data_exp_shm_area+0x80 (t0 bstore)
	.word	0xa0555a25	! t0_data_exp_shm_area+0x84
	.word	0xa7a554e9	! t0_data_exp_shm_area+0x88
	.word	0x8858a5f1	! t0_data_exp_shm_area+0x8c
	.word	0xea871116	! t0_data_exp_shm_area+0x90
	.word	0xa4711d1d	! t0_data_exp_shm_area+0x94
	.word	0x75b4eec7	! t0_data_exp_shm_area+0x98
	.word	0x068101b7	! t0_data_exp_shm_area+0x9c
	.word	0x061c41fd	! t0_data_exp_shm_area+0xa0
	.word	0xc4e0239c	! t0_data_exp_shm_area+0xa4
	.word	0x6b4ef23d	! t0_data_exp_shm_area+0xa8
	.word	0x0b8b0a41	! t0_data_exp_shm_area+0xac
	.word	0x430011a6	! t0_data_exp_shm_area+0xb0
	.word	0xe7891d1c	! t0_data_exp_shm_area+0xb4
	.word	0x4e00b779	! t0_data_exp_shm_area+0xb8
	.word	0xd4b3091e	! t0_data_exp_shm_area+0xbc
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



