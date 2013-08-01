/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: kaos_01_06_2004_1.s
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
#define T0_KAOS_SEED          000000000098
#define T0_KAOS_ICOUNT        405
#define T0_KAOS_AREAS         1
#define T0_KAOS_AREASIZE      64
#define T0_KAOS_AREAOFFSET    128
#define T0_KAOS_PAGESIZE      8192
#define T0_KAOS_CODECOUNT     410

#define T0_KAOS_BOOT_VA                  0x3b062000
#define T0_KAOS_BOOT_PA                  0x0000000013028000
#define T0_KAOS_BOOT_CACHEABLE           1
#define T0_KAOS_BOOT_NONCACHEABLE        0

#define T0_KAOS_STARTUP_VA               0x372da000
#define T0_KAOS_STARTUP_PA               0x00000000193ca000
#define T0_KAOS_STARTUP_CACHEABLE        1
#define T0_KAOS_STARTUP_NONCACHEABLE     0

#define T0_KAOS_OFFSET_TBL_VA            0x18206000
#define T0_KAOS_OFFSET_TBL_PA            0x0000000016a4e000
#define T0_KAOS_OFFSET_TBL_CACHEABLE     1
#define T0_KAOS_OFFSET_TBL_NONCACHEABLE  0

#define T0_KAOS_DONE_VA                  0x18b64000
#define T0_KAOS_DONE_PA                  0x000000000c0f4000
#define T0_KAOS_DONE_CACHEABLE           1
#define T0_KAOS_DONE_NONCACHEABLE        0

#define T0_KAOS_KTBL_VA                  0x28d8e000
#define T0_KAOS_KTBL_PA                  0x000000001b9e8000
#define T0_KAOS_KTBL_CACHEABLE           1
#define T0_KAOS_KTBL_NONCACHEABLE        0

#define T0_KAOS_SUBR0_VA                 0x28dbe000
#define T0_KAOS_SUBR0_PA                 0x0000000002b42000
#define T0_KAOS_SUBR0_CACHEABLE          1
#define T0_KAOS_SUBR0_NONCACHEABLE       0
#define T0_KAOS_SUBR1_VA                 0x28e1e000
#define T0_KAOS_SUBR1_PA                 0x000000002f276000
#define T0_KAOS_SUBR1_CACHEABLE          1
#define T0_KAOS_SUBR1_NONCACHEABLE       0
#define T0_KAOS_SUBR2_VA                 0x255c6000
#define T0_KAOS_SUBR2_PA                 0x0000000018a86000
#define T0_KAOS_SUBR2_CACHEABLE          1
#define T0_KAOS_SUBR2_NONCACHEABLE       0
#define T0_KAOS_SUBR3_VA                 0x29206000
#define T0_KAOS_SUBR3_PA                 0x0000000028530000
#define T0_KAOS_SUBR3_CACHEABLE          1
#define T0_KAOS_SUBR3_NONCACHEABLE       0

#define T0_KAOS_EXP_REGS_VA              0x18aac000
#define T0_KAOS_EXP_REGS_PA              0x0000000037ec2000
#define T0_KAOS_EXP_REGS_CACHEABLE       1
#define T0_KAOS_EXP_REGS_NONCACHEABLE    0
#define T0_KAOS_RUN_REGS_VA              0x1e306000
#define T0_KAOS_RUN_REGS_PA              0x0000000020038000
#define T0_KAOS_RUN_REGS_CACHEABLE       1
#define T0_KAOS_RUN_REGS_NONCACHEABLE    0

#define T0_KAOS_EXP_STACK_VA             0x3bc34000
#define T0_KAOS_EXP_STACK_PA             0x000000000b110000
#define T0_KAOS_EXP_STACK_CACHEABLE      1
#define T0_KAOS_EXP_STACK_NONCACHEABLE   0
#define T0_KAOS_RUN_STACK_VA             0x07e78000
#define T0_KAOS_RUN_STACK_PA             0x0000000018fac000
#define T0_KAOS_RUN_STACK_CACHEABLE      1
#define T0_KAOS_RUN_STACK_NONCACHEABLE   0

#define T0_KAOS_AREA0
#define T0_KAOS_EXP_AREA0_VA             0x24e90000
#define T0_KAOS_EXP_AREA0_PA             0x0000000008154000
#define T0_KAOS_EXP_AREA0_CACHEABLE      1
#define T0_KAOS_EXP_AREA0_NONCACHEABLE   0
#define T0_KAOS_RUN_AREA0_VA             0x0cb04000
#define T0_KAOS_RUN_AREA0_PA             0x00000000134ca000
#define T0_KAOS_RUN_AREA0_CACHEABLE      1
#define T0_KAOS_RUN_AREA0_NONCACHEABLE   0

#define T0_KAOS_SHM_AREA
#define T0_KAOS_EXP_SHM_AREA_VA          0x1ed00000
#define T0_KAOS_EXP_SHM_AREA_PA          0x000000003d322000
#define T0_KAOS_EXP_SHM_AREA_CACHEABLE   1
#define T0_KAOS_EXP_SHM_AREA_NONCACHEABLE 0
#define T0_KAOS_RUN_SHM_AREA_VA          0x07be0000
#define T0_KAOS_RUN_SHM_AREA_PA          0x000000001017a000
#define T0_KAOS_RUN_SHM_AREA_CACHEABLE   1
#define T0_KAOS_RUN_SHM_AREA_NONCACHEABLE 0

#define T0_KAOS_RANVAL_00     0xab7fa552
#define T0_KAOS_RANVAL_01     0x96693f97
#define T0_KAOS_RANVAL_02     0x5c1af790
#define T0_KAOS_RANVAL_03     0x9cad3bab
#define T0_KAOS_RANVAL_04     0x75658d1d
#define T0_KAOS_RANVAL_05     0x87d8082e
#define T0_KAOS_RANVAL_06     0x20953a90
#define T0_KAOS_RANVAL_07     0xd38846cd
#define T0_KAOS_RANVAL_08     0x3bf2ec9d
#define T0_KAOS_RANVAL_09     0x301338db
#define T0_KAOS_RANVAL_0a     0x6cbf3fad
#define T0_KAOS_RANVAL_0b     0xa4059e15
#define T0_KAOS_RANVAL_0c     0x9efc5ad4
#define T0_KAOS_RANVAL_0d     0xa59e9d13
#define T0_KAOS_RANVAL_0e     0xa8428ae2
#define T0_KAOS_RANVAL_0f     0x9619b900
#define T0_KAOS_RANVAL_10     0xafde4e60
#define T0_KAOS_RANVAL_11     0x4c499750
#define T0_KAOS_RANVAL_12     0xd1d771c0
#define T0_KAOS_RANVAL_13     0x95584984
#define T0_KAOS_RANVAL_14     0x46911300
#define T0_KAOS_RANVAL_15     0xcaf34248
#define T0_KAOS_RANVAL_16     0x0d8bf694
#define T0_KAOS_RANVAL_17     0x6b31e265
#define T0_KAOS_RANVAL_18     0x9ec81356
#define T0_KAOS_RANVAL_19     0x06d2f162
#define T0_KAOS_RANVAL_1a     0xc8fab1c8
#define T0_KAOS_RANVAL_1b     0x60352ec8
#define T0_KAOS_RANVAL_1c     0x2d157aee
#define T0_KAOS_RANVAL_1d     0xbae3c465
#define T0_KAOS_RANVAL_1e     0x1cbc6d89
#define T0_KAOS_RANVAL_1f     0x7e738f05
#define T0_KAOS_RANVAL_20     0xb417747f
#define T0_KAOS_RANVAL_21     0x80c94272
#define T0_KAOS_RANVAL_22     0x69e557aa
#define T0_KAOS_RANVAL_23     0xd0d22ec1
#define T0_KAOS_RANVAL_24     0xc644886f
#define T0_KAOS_RANVAL_25     0x4b6e3034
#define T0_KAOS_RANVAL_26     0xd408edc7
#define T0_KAOS_RANVAL_27     0xc60de83a
#define T0_KAOS_RANVAL_28     0xd640df9c
#define T0_KAOS_RANVAL_29     0x79fe1555
#define T0_KAOS_RANVAL_2a     0x224e07ad
#define T0_KAOS_RANVAL_2b     0x53c988e4
#define T0_KAOS_RANVAL_2c     0x85fe6e59
#define T0_KAOS_RANVAL_2d     0x8eed2533
#define T0_KAOS_RANVAL_2e     0x66cea3f9
#define T0_KAOS_RANVAL_2f     0x2b634b35
#define T0_KAOS_RANVAL_30     0x18864bb6
#define T0_KAOS_RANVAL_31     0xf1c97ed3
#define T0_KAOS_RANVAL_32     0x11155afe
#define T0_KAOS_RANVAL_33     0xf0c799bd
#define T0_KAOS_RANVAL_34     0x5369b904
#define T0_KAOS_RANVAL_35     0xdecbf815
#define T0_KAOS_RANVAL_36     0x71449beb
#define T0_KAOS_RANVAL_37     0xe8446f78
#define T0_KAOS_RANVAL_38     0x0fbd9d97
#define T0_KAOS_RANVAL_39     0x23cde829
#define T0_KAOS_RANVAL_3a     0x3b92182d
#define T0_KAOS_RANVAL_3b     0x8cc1e967
#define T0_KAOS_RANVAL_3c     0x8f6b7acd
#define T0_KAOS_RANVAL_3d     0x9aaca541
#define T0_KAOS_RANVAL_3e     0x01830112
#define T0_KAOS_RANVAL_3f     0x58f9dd5c
#define T0_KAOS_RANVAL_40     0xfecf1c4f
#define T0_KAOS_RANVAL_41     0x7c7aa988
#define T0_KAOS_RANVAL_42     0x6dfbfbae
#define T0_KAOS_RANVAL_43     0x3d918a16
#define T0_KAOS_RANVAL_44     0x7c488896
#define T0_KAOS_RANVAL_45     0xea699351
#define T0_KAOS_RANVAL_46     0x1501ef02
#define T0_KAOS_RANVAL_47     0x9095b48d
#define T0_KAOS_RANVAL_48     0x73ddf5b1
#define T0_KAOS_RANVAL_49     0x10577493
#define T0_KAOS_RANVAL_4a     0xf6371059
#define T0_KAOS_RANVAL_4b     0x1a0ac68d
#define T0_KAOS_RANVAL_4c     0xfc81c644
#define T0_KAOS_RANVAL_4d     0x749d2595
#define T0_KAOS_RANVAL_4e     0x2bf1d1f5
#define T0_KAOS_RANVAL_4f     0x7247c289
#define T0_KAOS_RANVAL_50     0x5b4cd2d3
#define T0_KAOS_RANVAL_51     0xb8628ee5
#define T0_KAOS_RANVAL_52     0x4e8197eb
#define T0_KAOS_RANVAL_53     0x7aec20a8
#define T0_KAOS_RANVAL_54     0x8f3d8340
#define T0_KAOS_RANVAL_55     0xc6991e8e
#define T0_KAOS_RANVAL_56     0x9e0f574b
#define T0_KAOS_RANVAL_57     0xefade924
#define T0_KAOS_RANVAL_58     0x42107c92
#define T0_KAOS_RANVAL_59     0x350bdc89
#define T0_KAOS_RANVAL_5a     0x3bc68383
#define T0_KAOS_RANVAL_5b     0x123e9fd4
#define T0_KAOS_RANVAL_5c     0x28cfe6f7
#define T0_KAOS_RANVAL_5d     0x1df7d273
#define T0_KAOS_RANVAL_5e     0x6ed4ee04
#define T0_KAOS_RANVAL_5f     0x515ad506
#define T0_KAOS_RANVAL_60     0x7d02900b
#define T0_KAOS_RANVAL_61     0xa096ba80
#define T0_KAOS_RANVAL_62     0xd9967c25
#define T0_KAOS_RANVAL_63     0x98016f92
#define T0_KAOS_RANVAL_64     0x06346d5a
#define T0_KAOS_RANVAL_65     0x5f3129af
#define T0_KAOS_RANVAL_66     0x792bd748
#define T0_KAOS_RANVAL_67     0x1c0d042b
#define T0_KAOS_RANVAL_68     0x2f264323
#define T0_KAOS_RANVAL_69     0x08eca93f
#define T0_KAOS_RANVAL_6a     0x8c097b3b
#define T0_KAOS_RANVAL_6b     0x0c3acdf8
#define T0_KAOS_RANVAL_6c     0xe28a735f
#define T0_KAOS_RANVAL_6d     0x47dd7360
#define T0_KAOS_RANVAL_6e     0xecfec6df
#define T0_KAOS_RANVAL_6f     0x3a501c62
#define T0_KAOS_RANVAL_70     0xb5113901
#define T0_KAOS_RANVAL_71     0x402ac72e
#define T0_KAOS_RANVAL_72     0xd60af30e
#define T0_KAOS_RANVAL_73     0xb7c84a2f
#define T0_KAOS_RANVAL_74     0x05e6d37e
#define T0_KAOS_RANVAL_75     0x569007da
#define T0_KAOS_RANVAL_76     0x435013ba
#define T0_KAOS_RANVAL_77     0x8f8291cf
#define T0_KAOS_RANVAL_78     0xcfea668e
#define T0_KAOS_RANVAL_79     0xd2741b2a
#define T0_KAOS_RANVAL_7a     0xa0d28751
#define T0_KAOS_RANVAL_7b     0x268852f6
#define T0_KAOS_RANVAL_7c     0x7d0c9234
#define T0_KAOS_RANVAL_7d     0x7573bb23
#define T0_KAOS_RANVAL_7e     0xffb57868
#define T0_KAOS_RANVAL_7f     0xfe799d6a
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

!    kaos version   4.2
!    thread         0
!    icount         405
!    targetid       NIAGARA:SIM
!    hostid         NIAGARA:5.8
!    areas          1
!    areasize       64
!    areaoffset     128
!    ncache         0
!    emulate_ncache 1
!    pagesize       8192
!    invsize        0
!    codecount      410
!    code           28d8e000
!    entry          28d8e000
!    fsr_exceptions 00000000
!    fsr_roundmode  00000004
!    fsr_mask       c0000fff
!    seed           000000000098
!    va_map         0000000000400000,000000003fffffff
!    pa_cached      0000000000400000,000000003fffffff
!    pa_noncached   000001ff00000000,000001ff7fffffff
!    weights        /import/n2-aus-localdir1/ntran/n2cdmspp/verif/diag/assembly/kaos/weights_files/simv9.w
!    begcount       0
!    endcount       405
!    dwords         8
!    ldblocks       0
!    stblocks       0
!    ldfsr_words    0
!    annul          2
!    predict        2
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

KTEXT_MODULE(t0_module_ktbl, 0x28d8e000)
.seg "text"
	KGLOBAL(t0_ktbl)
t0_ktbl_page_begin:
.global t0_kref; t0_kref:
	.skip 0
t0_ktbl:
	.word	0x0b800005	! t0_kref+0x0:   	fbug	_kref+0x14
	.word	0xd0167fe6	! t0_kref+0x4:   	lduh	[%i1 - 0x1a], %o0
	.word	0xd51fbf98	! t0_kref+0x8:   	ldd	[%fp - 0x68], %f10
	.word	0x95a01a42	! t0_kref+0xc:   	fdtoi	%f2, %f10
	.word	0xd04e3ffe	! t0_kref+0x10:   	ldsb	[%i0 - 2], %o0
	.word	0xed68a04f	! t0_kref+0x14:   	prefetch	%g2 + 0x4f, 22
	.word	0x8fa1c82b	! t0_kref+0x18:   	fadds	%f7, %f11, %f7
	.word	0xe868a030	! t0_kref+0x1c:   	ldstub	[%g2 + 0x30], %l4
	.word	0x908f3fcb	! t0_kref+0x20:   	andcc	%i4, -0x35, %o0
	.word	0x99a00121	! t0_kref+0x24:   	fabss	%f1, %f12
	.word	0xd83e6000	! t0_kref+0x28:   	std	%o4, [%i1]
	.word	0x93d02010	! t0_kref+0x2c:   	tne	%icc, %g0 + 0x10
	.word	0x81d9746e	! t0_kref+0x30:   	flush	%g5 - 0xb92
	.word	0x00400006	! t0_kref+0x34:   	bn,pn	%icc, _kref+0x4c
	.word	0xc398a040	! t0_kref+0x38:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0x8da01a2b	! t0_kref+0x3c:   	fstoi	%f11, %f6
	.word	0x91d02070	! t0_kref+0x40:   	ta	%icc, %g0 + 0x70
	.word	0x903b000c	! t0_kref+0x44:   	xnor	%o4, %o4, %o0
	.word	0x913b2013	! t0_kref+0x48:   	sra	%o4, 0x13, %o0
	.word	0x8da01906	! t0_kref+0x4c:   	fitod	%f6, %f6
	.word	0xd010a028	! t0_kref+0x50:   	lduh	[%g2 + 0x28], %o0
	.word	0x81a1884a	! t0_kref+0x54:   	faddd	%f6, %f10, %f0
	.word	0x99a0192c	! t0_kref+0x58:   	fstod	%f12, %f12
	.word	0x81870000	! t0_kref+0x5c:   	wr	%i4, %g0, %y
	.word	0x37400003	! t0_kref+0x60:   	fbge,a,pn	%fcc0, _kref+0x6c
	.word	0x93a01a44	! t0_kref+0x64:   	fdtoi	%f4, %f9
	.word	0xd22e4000	! t0_kref+0x68:   	stb	%o1, [%i1]
	.word	0x93a049ab	! t0_kref+0x6c:   	fdivs	%f1, %f11, %f9
	.word	0x90502b61	! t0_kref+0x70:   	umul	%g0, 0xb61, %o0
	.word	0x09400002	! t0_kref+0x74:   	fbl,pn	%fcc0, _kref+0x7c
	.word	0x912a600f	! t0_kref+0x78:   	sll	%o1, 0xf, %o0
	.word	0x85a01921	! t0_kref+0x7c:   	fstod	%f1, %f2
	.word	0x91400000	! t0_kref+0x80:   	mov	%y, %o0
	.word	0xe168a04b	! t0_kref+0x84:   	prefetch	%g2 + 0x4b, 16
	.word	0x90de800c	! t0_kref+0x88:   	smulcc	%i2, %o4, %o0
	.word	0xd048a01a	! t0_kref+0x8c:   	ldsb	[%g2 + 0x1a], %o0
	.word	0x89a0482c	! t0_kref+0x90:   	fadds	%f1, %f12, %f4
	.word	0x1f800004	! t0_kref+0x94:   	fbo	_kref+0xa4
	.word	0x85a01923	! t0_kref+0x98:   	fstod	%f3, %f2
	.word	0xd2f01018	! t0_kref+0x9c:   	stxa	%o1, [%g0 + %i0]0x80
	.word	0x81db659d	! t0_kref+0xa0:   	flush	%o5 + 0x59d
	.word	0xd4380019	! t0_kref+0xa4:   	std	%o2, [%g0 + %i1]
	.word	0x81ab0a22	! t0_kref+0xa8:   	fcmps	%fcc0, %f12, %f2
	.word	0xef68a00e	! t0_kref+0xac:   	prefetch	%g2 + 0xe, 23
	.word	0x9161e38c	! t0_kref+0xb0:   	movu	%fcc0, 0x38c, %o0
	.word	0x87802080	! t0_kref+0xb4:   	mov	0x80, %asi
	.word	0x81aacaad	! t0_kref+0xb8:   	fcmpes	%fcc0, %f11, %f13
	.word	0x902ebd57	! t0_kref+0xbc:   	andn	%i2, -0x2a9, %o0
	.word	0x20480004	! t0_kref+0xc0:   	bn,a,pt	%icc, _kref+0xd0
	.word	0xc0ff1019	! t0_kref+0xc4:   	swapa	[%i4 + %i1]0x80, %g0
	.word	0xd120a038	! t0_kref+0xc8:   	st	%f8, [%g2 + 0x38]
	.word	0x81a0192b	! t0_kref+0xcc:   	fstod	%f11, %f0
	.word	0xf82e001a	! t0_kref+0xd0:   	stb	%i4, [%i0 + %i2]
	.word	0x85a04d21	! t0_kref+0xd4:   	fsmuld	%f1, %f1, %f2
	.word	0xd04e7ff8	! t0_kref+0xd8:   	ldsb	[%i1 - 8], %o0
	.word	0xd006001c	! t0_kref+0xdc:   	ld	[%i0 + %i4], %o0
	.word	0x3f400008	! t0_kref+0xe0:   	fbo,a,pn	%fcc0, _kref+0x100
	.word	0xd6ee1000	! t0_kref+0xe4:   	ldstuba	[%i0]0x80, %o3
	.word	0x913aa008	! t0_kref+0xe8:   	sra	%o2, 0x8, %o0
	.word	0xea6e6009	! t0_kref+0xec:   	ldstub	[%i1 + 9], %l5
	.word	0xd010a03a	! t0_kref+0xf0:   	lduh	[%g2 + 0x3a], %o0
	.word	0x81834000	! t0_kref+0xf4:   	wr	%o5, %g0, %y
	.word	0x97a00028	! t0_kref+0xf8:   	fmovs	%f8, %f11
	.word	0xda360000	! t0_kref+0xfc:   	sth	%o5, [%i0]
	call	SYM(t0_subr2)
	.word	0x908ebe29	! t0_kref+0x104:   	andcc	%i2, -0x1d7, %o0
	.word	0xea6e7ffd	! t0_kref+0x108:   	ldstub	[%i1 - 3], %l5
	.word	0x35800005	! t0_kref+0x10c:   	fbue,a	_kref+0x120
	.word	0xc51e2008	! t0_kref+0x110:   	ldd	[%i0 + 8], %f2
	.word	0x37800001	! t0_kref+0x114:   	fbge,a	_kref+0x118
	.word	0xd91fbe98	! t0_kref+0x118:   	ldd	[%fp - 0x168], %f12
	.word	0x2c480005	! t0_kref+0x11c:   	bneg,a,pt	%icc, _kref+0x130
	.word	0xd048a02a	! t0_kref+0x120:   	ldsb	[%g2 + 0x2a], %o0
	.word	0xd03f4019	! t0_kref+0x124:   	std	%o0, [%i5 + %i1]
	.word	0x9003001b	! t0_kref+0x128:   	add	%o4, %i3, %o0
	.word	0xd0467ff0	! t0_kref+0x12c:   	ldsw	[%i1 - 0x10], %o0
	.word	0x111bbbd5	! t0_kref+0x130:   	sethi	%hi(0x6eef5400), %o0
	.word	0x35480002	! t0_kref+0x134:   	fbue,a,pt	%fcc0, _kref+0x13c
	.word	0x90fb000d	! t0_kref+0x138:   	sdivcc	%o4, %o5, %o0
	.word	0xf007bfe0	! t0_kref+0x13c:   	ld	[%fp - 0x20], %i0
	.word	0x89a01929	! t0_kref+0x140:   	fstod	%f9, %f4
	.word	0x81a01928	! t0_kref+0x144:   	fstod	%f8, %f0
	.word	0x13800005	! t0_kref+0x148:   	fbe	_kref+0x15c
	.word	0xc9180019	! t0_kref+0x14c:   	ldd	[%g0 + %i1], %f4
	.word	0x81a0894c	! t0_kref+0x150:   	fmuld	%f2, %f12, %f0
	.word	0x910f001a	! t0_kref+0x154:   	tsubcc	%i4, %i2, %o0
	.word	0x17480008	! t0_kref+0x158:   	fbge,pt	%fcc0, _kref+0x178
	.word	0xd0d0a022	! t0_kref+0x15c:   	ldsha	[%g2 + 0x22]%asi, %o0
	.word	0x900af0fc	! t0_kref+0x160:   	and	%o3, -0xf04, %o0
	.word	0x19480001	! t0_kref+0x164:   	fbuge,pt	%fcc0, _kref+0x168
	.word	0x90d82710	! t0_kref+0x168:   	smulcc	%g0, 0x710, %o0
	.word	0x906378d4	! t0_kref+0x16c:   	subc	%o5, -0x72c, %o0
	.word	0x9056a261	! t0_kref+0x170:   	umul	%i2, 0x261, %o0
	.word	0x3e800001	! t0_kref+0x174:   	bvc,a	_kref+0x178
	.word	0x9136800c	! t0_kref+0x178:   	srl	%i2, %o4, %o0
	.word	0xe968a08e	! t0_kref+0x17c:   	prefetch	%g2 + 0x8e, 20
	.word	0xdb80a030	! t0_kref+0x180:   	lda	[%g2 + 0x30]%asi, %f13
	.word	0x913a800b	! t0_kref+0x184:   	sra	%o2, %o3, %o0
	.word	0xc300a018	! t0_kref+0x188:   	ld	[%g2 + 0x18], %f1
	.word	0x9de3bfa0	! t0_kref+0x18c:   	save	%sp, -0x60, %sp
	.word	0x91eef20d	! t0_kref+0x190:   	restore	%i3, -0xdf3, %o0
	.word	0xc036c019	! t0_kref+0x194:   	clrh	[%i3 + %i1]
	.word	0xf8264000	! t0_kref+0x198:   	st	%i4, [%i1]
	call	SYM(t0_subr3)
	.word	0x900b000c	! t0_kref+0x1a0:   	and	%o4, %o4, %o0
	.word	0x11400001	! t0_kref+0x1a4:   	fba,pn	%fcc0, _kref+0x1a8
	.word	0x905ac00b	! t0_kref+0x1a8:   	smul	%o3, %o3, %o0
	.word	0x89a01923	! t0_kref+0x1ac:   	fstod	%f3, %f4
	.word	0x8186c000	! t0_kref+0x1b0:   	wr	%i3, %g0, %y
	.word	0x9046e6f1	! t0_kref+0x1b4:   	addc	%i3, 0x6f1, %o0
	.word	0xd010a03a	! t0_kref+0x1b8:   	lduh	[%g2 + 0x3a], %o0
	.word	0x900332f1	! t0_kref+0x1bc:   	add	%o4, -0xd0f, %o0
	.word	0x8da089cc	! t0_kref+0x1c0:   	fdivd	%f2, %f12, %f6
	.word	0x91d0202c	! t0_kref+0x1c4:   	ta	%icc, %g0 + 0x2c
	.word	0xefe8a041	! t0_kref+0x1c8:   	prefetcha	%g2 + 0x41, 23
	.word	0x8143e040	! t0_kref+0x1cc:   	membar	0x40
	.word	0x1e480008	! t0_kref+0x1d0:   	bvc,pt	%icc, _kref+0x1f0
	.word	0xe26e4000	! t0_kref+0x1d4:   	ldstub	[%i1], %l1
	.word	0x8182c000	! t0_kref+0x1d8:   	wr	%o3, %g0, %y
	.word	0x90328009	! t0_kref+0x1dc:   	orn	%o2, %o1, %o0
	.word	0x89a04d27	! t0_kref+0x1e0:   	fsmuld	%f1, %f7, %f4
	call	SYM(t0_subr1)
	.word	0xd010a00a	! t0_kref+0x1e8:   	lduh	[%g2 + 0xa], %o0
	.word	0x90fa8000	! t0_kref+0x1ec:   	sdivcc	%o2, %g0, %o0
	.word	0x9060001b	! t0_kref+0x1f0:   	subc	%g0, %i3, %o0
	.word	0x91d02034	! t0_kref+0x1f4:   	ta	%icc, %g0 + 0x34
	.word	0x91a000c4	! t0_kref+0x1f8:   	fnegd	%f4, %f8
	.word	0x0e400008	! t0_kref+0x1fc:   	bvs,pn	%icc, _kref+0x21c
	.word	0x900b2cc0	! t0_kref+0x200:   	and	%o4, 0xcc0, %o0
	.word	0x9ba00021	! t0_kref+0x204:   	fmovs	%f1, %f13
	.word	0x905b401c	! t0_kref+0x208:   	smul	%o5, %i4, %o0
	.word	0x90def72c	! t0_kref+0x20c:   	smulcc	%i3, -0x8d4, %o0
	.word	0xd03e7ff8	! t0_kref+0x210:   	std	%o0, [%i1 - 8]
	.word	0x1b400003	! t0_kref+0x214:   	fble,pn	%fcc0, _kref+0x220
	.word	0x9164c00c	! t0_kref+0x218:   	movl	%icc, %o4, %o0
	.word	0x91a10820	! t0_kref+0x21c:   	fadds	%f4, %f0, %f8
	.word	0x9032c00c	! t0_kref+0x220:   	orn	%o3, %o4, %o0
	.word	0x90282f04	! t0_kref+0x224:   	andn	%g0, 0xf04, %o0
	.word	0x8da2c927	! t0_kref+0x228:   	fmuls	%f11, %f7, %f6
	.word	0xc02e401a	! t0_kref+0x22c:   	clrb	[%i1 + %i2]
	.word	0x01800007	! t0_kref+0x230:   	fbn	_kref+0x24c
	.word	0x85a01908	! t0_kref+0x234:   	fitod	%f8, %f2
	.word	0x9036c01a	! t0_kref+0x238:   	orn	%i3, %i2, %o0
	.word	0x95a01902	! t0_kref+0x23c:   	fitod	%f2, %f10
	.word	0xcb80a010	! t0_kref+0x240:   	lda	[%g2 + 0x10]%asi, %f5
	.word	0xda360000	! t0_kref+0x244:   	sth	%o5, [%i0]
	.word	0x8fa34820	! t0_kref+0x248:   	fadds	%f13, %f0, %f7
	.word	0xf207bfe0	! t0_kref+0x24c:   	ld	[%fp - 0x20], %i1
	.word	0x0e480006	! t0_kref+0x250:   	bvs,pt	%icc, _kref+0x268
	.word	0x912b000b	! t0_kref+0x254:   	sll	%o4, %o3, %o0
	.word	0x001fffff	! t0_kref+0x258:   	illtrap	0x1fffff
	.word	0x91d02070	! t0_kref+0x25c:   	ta	%icc, %g0 + 0x70
	.word	0x99a24823	! t0_kref+0x260:   	fadds	%f9, %f3, %f12
	.word	0x9127000a	! t0_kref+0x264:   	mulscc	%i4, %o2, %o0
	.word	0xcd1e401d	! t0_kref+0x268:   	ldd	[%i1 + %i5], %f6
	.word	0xda20a008	! t0_kref+0x26c:   	st	%o5, [%g2 + 8]
	.word	0x908ea277	! t0_kref+0x270:   	andcc	%i2, 0x277, %o0
	.word	0x85a1c824	! t0_kref+0x274:   	fadds	%f7, %f4, %f2
	.word	0x8da18844	! t0_kref+0x278:   	faddd	%f6, %f4, %f6
	.word	0x912b401c	! t0_kref+0x27c:   	sll	%o5, %i4, %o0
	.word	0x3c480004	! t0_kref+0x280:   	bpos,a,pt	%icc, _kref+0x290
	.word	0x900ec00b	! t0_kref+0x284:   	and	%i3, %o3, %o0
	.word	0x2d480003	! t0_kref+0x288:   	fbg,a,pt	%fcc0, _kref+0x294
	.word	0x89a00044	! t0_kref+0x28c:   	fmovd	%f4, %f4
	.word	0x91d02070	! t0_kref+0x290:   	ta	%icc, %g0 + 0x70
	.word	0xc11fbd40	! t0_kref+0x294:   	ldd	[%fp - 0x2c0], %f0
	.word	0x8143e021	! t0_kref+0x298:   	membar	0x21
	.word	0x81a01904	! t0_kref+0x29c:   	fitod	%f4, %f0
	.word	0xd0c8a028	! t0_kref+0x2a0:   	ldsba	[%g2 + 0x28]%asi, %o0
	.word	0xec7e3ff4	! t0_kref+0x2a4:   	swap	[%i0 - 0xc], %l6
	.word	0xcd80a038	! t0_kref+0x2a8:   	lda	[%g2 + 0x38]%asi, %f6
	.word	0x902b6da2	! t0_kref+0x2ac:   	andn	%o5, 0xda2, %o0
	.word	0xf8a8a03a	! t0_kref+0x2b0:   	stba	%i4, [%g2 + 0x3a]%asi
	.word	0x33800003	! t0_kref+0x2b4:   	fbe,a	_kref+0x2c0
	.word	0xc3e8a081	! t0_kref+0x2b8:   	prefetcha	%g2 + 0x81, 1
	.word	0x90fec01a	! t0_kref+0x2bc:   	sdivcc	%i3, %i2, %o0
	.word	0x81a009c8	! t0_kref+0x2c0:   	fdivd	%f0, %f8, %f0
	.word	0x91400000	! t0_kref+0x2c4:   	mov	%y, %o0
	.word	0x1d800006	! t0_kref+0x2c8:   	fbule	_kref+0x2e0
	.word	0xd00e6012	! t0_kref+0x2cc:   	ldub	[%i1 + 0x12], %o0
	.word	0x2b480005	! t0_kref+0x2d0:   	fbug,a,pt	%fcc0, _kref+0x2e4
	.word	0x8da00121	! t0_kref+0x2d4:   	fabss	%f1, %f6
	.word	0xd0100019	! t0_kref+0x2d8:   	lduh	[%g0 + %i1], %o0
	.word	0xd620a038	! t0_kref+0x2dc:   	st	%o3, [%g2 + 0x38]
	.word	0x05400007	! t0_kref+0x2e0:   	fblg,pn	%fcc0, _kref+0x2fc
	.word	0xc180a018	! t0_kref+0x2e4:   	lda	[%g2 + 0x18]%asi, %f0
	.word	0x81a98a4a	! t0_kref+0x2e8:   	fcmpd	%fcc0, %f6, %f10
	.word	0xd13f4019	! t0_kref+0x2ec:   	std	%f8, [%i5 + %i1]
	.word	0x8143c000	! t0_kref+0x2f0:   	stbar
	.word	0x902a801c	! t0_kref+0x2f4:   	andn	%o2, %i4, %o0
	.word	0xd0d0a032	! t0_kref+0x2f8:   	ldsha	[%g2 + 0x32]%asi, %o0
	.word	0x91418000	! t0_kref+0x2fc:   	mov	%fprs, %o0
	.word	0x11400002	! t0_kref+0x300:   	fba,pn	%fcc0, _kref+0x308
	.word	0xda36c019	! t0_kref+0x304:   	sth	%o5, [%i3 + %i1]
	.word	0x03800002	! t0_kref+0x308:   	fbne	_kref+0x310
	.word	0x912ac00c	! t0_kref+0x30c:   	sll	%o3, %o4, %o0
	.word	0x9ba10929	! t0_kref+0x310:   	fmuls	%f4, %f9, %f13
	.word	0x9062401c	! t0_kref+0x314:   	subc	%o1, %i4, %o0
	.word	0xd088a020	! t0_kref+0x318:   	lduba	[%g2 + 0x20]%asi, %o0
	.word	0xc91fbf70	! t0_kref+0x31c:   	ldd	[%fp - 0x90], %f4
	.word	0x91a00148	! t0_kref+0x320:   	fabsd	%f8, %f8
	.word	0x2a800005	! t0_kref+0x324:   	bcs,a	_kref+0x338
	.word	0xd66e4000	! t0_kref+0x328:   	ldstub	[%i1], %o3
	.word	0x28480006	! t0_kref+0x32c:   	bleu,a,pt	%icc, _kref+0x344
	.word	0xd0c8a031	! t0_kref+0x330:   	ldsba	[%g2 + 0x31]%asi, %o0
	.word	0x95a00120	! t0_kref+0x334:   	fabss	%f0, %f10
	.word	0xd0d0a030	! t0_kref+0x338:   	ldsha	[%g2 + 0x30]%asi, %o0
	.word	0x8ba00129	! t0_kref+0x33c:   	fabss	%f9, %f5
	.word	0x9fc03f44	! t0_kref+0x340:   	call	%g0 - 0xbc
	.word	0x9092bc89	! t0_kref+0x344:   	orcc	%o2, -0x377, %o0
	.word	0x8da01088	! t0_kref+0x348:   	fxtos	%f8, %f6
	.word	0xd83e0000	! t0_kref+0x34c:   	std	%o4, [%i0]
	.word	0x9062699b	! t0_kref+0x350:   	subc	%o1, 0x99b, %o0
	.word	0x9016b8f2	! t0_kref+0x354:   	or	%i2, -0x70e, %o0
	.word	0xc568a0c0	! t0_kref+0x358:   	prefetch	%g2 + 0xc0, 2
	.word	0x11400005	! t0_kref+0x35c:   	fba,pn	%fcc0, _kref+0x370
	.word	0x9132401a	! t0_kref+0x360:   	srl	%o1, %i2, %o0
	.word	0x09400006	! t0_kref+0x364:   	fbl,pn	%fcc0, _kref+0x37c
	.word	0x900a4000	! t0_kref+0x368:   	and	%o1, %g0, %o0
	.word	0xc91fbd40	! t0_kref+0x36c:   	ldd	[%fp - 0x2c0], %f4
	.word	0x81a248a7	! t0_kref+0x370:   	fsubs	%f9, %f7, %f0
	.word	0x38480003	! t0_kref+0x374:   	bgu,a,pt	%icc, _kref+0x380
	.word	0xf4380019	! t0_kref+0x378:   	std	%i2, [%g0 + %i1]
	.word	0xc91e7fe8	! t0_kref+0x37c:   	ldd	[%i1 - 0x18], %f4
	.word	0x9132800a	! t0_kref+0x380:   	srl	%o2, %o2, %o0
	.word	0xd326200c	! t0_kref+0x384:   	st	%f9, [%i0 + 0xc]
	.word	0x8fd02010	! t0_kref+0x388:   	tvs	%icc, %g0 + 0x10
	.word	0x908ac000	! t0_kref+0x38c:   	andcc	%o3, %g0, %o0
	.word	0x91418000	! t0_kref+0x390:   	mov	%fprs, %o0
	.word	0xe27e3ff4	! t0_kref+0x394:   	swap	[%i0 - 0xc], %l1
	.word	0xc11fbed0	! t0_kref+0x398:   	ldd	[%fp - 0x130], %f0
	.word	0xc3e8a103	! t0_kref+0x39c:   	prefetcha	%g2 + 0x103, 1
	.word	0x9072800a	! t0_kref+0x3a0:   	udiv	%o2, %o2, %o0
	.word	0x8143e040	! t0_kref+0x3a4:   	membar	0x40
	.word	0x8143c000	! t0_kref+0x3a8:   	stbar
	.word	0x1b800008	! t0_kref+0x3ac:   	fble	_kref+0x3cc
	.word	0x8da0004a	! t0_kref+0x3b0:   	fmovd	%f10, %f6
	.word	0x9ba109a0	! t0_kref+0x3b4:   	fdivs	%f4, %f0, %f13
	.word	0xe87e600c	! t0_kref+0x3b8:   	swap	[%i1 + 0xc], %l4
	.word	0x900ebf19	! t0_kref+0x3bc:   	and	%i2, -0xe7, %o0
	.word	0x95a089a4	! t0_kref+0x3c0:   	fdivs	%f2, %f4, %f10
	.word	0x9161401c	! t0_kref+0x3c4:   	movug	%fcc0, %i4, %o0
	.word	0x90fabbb9	! t0_kref+0x3c8:   	sdivcc	%o2, -0x447, %o0
	.word	0x913a6019	! t0_kref+0x3cc:   	sra	%o1, 0x19, %o0
	.word	0x93a1c824	! t0_kref+0x3d0:   	fadds	%f7, %f4, %f9
	.word	0x9113400c	! t0_kref+0x3d4:   	taddcctv	%o5, %o4, %o0
	.word	0x0b480002	! t0_kref+0x3d8:   	fbug,pt	%fcc0, _kref+0x3e0
	.word	0x91d02040	! t0_kref+0x3dc:   	ta	%icc, %g0 + 0x40
	.word	0xe86e600a	! t0_kref+0x3e0:   	ldstub	[%i1 + 0xa], %l4
	.word	0x99a0188d	! t0_kref+0x3e4:   	fitos	%f13, %f12
	.word	0x99a00144	! t0_kref+0x3e8:   	fabsd	%f4, %f12
	.word	0x9164e4ff	! t0_kref+0x3ec:   	movl	%icc, -0x301, %o0
	.word	0x90728000	! t0_kref+0x3f0:   	udiv	%o2, %g0, %o0
	.word	0x8d8273f0	! t0_kref+0x3f4:   	wr	%o1, 0xfffff3f0, %fprs
	.word	0x02400005	! t0_kref+0x3f8:   	be,pn	%icc, _kref+0x40c
	.word	0x91302005	! t0_kref+0x3fc:   	srl	%g0, 0x5, %o0
	.word	0xd67f0018	! t0_kref+0x400:   	swap	[%i4 + %i0], %o3
	.word	0x913f201a	! t0_kref+0x404:   	sra	%i4, 0x1a, %o0
	.word	0x85a18d21	! t0_kref+0x408:   	fsmuld	%f6, %f1, %f2
	.word	0x912ac00d	! t0_kref+0x40c:   	sll	%o3, %o5, %o0
	.word	0xf426401c	! t0_kref+0x410:   	st	%i2, [%i1 + %i4]
	.word	0xebe8a106	! t0_kref+0x414:   	prefetcha	%g2 + 0x106, 21
	.word	0x90d324e4	! t0_kref+0x418:   	umulcc	%o4, 0x4e4, %o0
	.word	0xd91fbf90	! t0_kref+0x41c:   	ldd	[%fp - 0x70], %f12
	.word	0xd0de101d	! t0_kref+0x420:   	ldxa	[%i0 + %i5]0x80, %o0
	.word	0x2d480008	! t0_kref+0x424:   	fbg,a,pt	%fcc0, _kref+0x444
	.word	0xd83e2000	! t0_kref+0x428:   	std	%o4, [%i0]
	.word	0x907ab724	! t0_kref+0x42c:   	sdiv	%o2, -0x8dc, %o0
	.word	0x91d0203c	! t0_kref+0x430:   	ta	%icc, %g0 + 0x3c
	.word	0x00400002	! t0_kref+0x434:   	bn,pn	%icc, _kref+0x43c
	.word	0x90b8001c	! t0_kref+0x438:   	xnorcc	%g0, %i4, %o0
	.word	0x81a01a26	! t0_kref+0x43c:   	fstoi	%f6, %f0
	.word	0xd0166014	! t0_kref+0x440:   	lduh	[%i1 + 0x14], %o0
	call	SYM(t0_subr0)
	.word	0x81a0192a	! t0_kref+0x448:   	fstod	%f10, %f0
	.word	0x91d02064	! t0_kref+0x44c:   	ta	%icc, %g0 + 0x64
	.word	0x90aaada1	! t0_kref+0x450:   	andncc	%o2, 0xda1, %o0
	.word	0x912f001b	! t0_kref+0x454:   	sll	%i4, %i3, %o0
	.word	0x89a00827	! t0_kref+0x458:   	fadds	%f0, %f7, %f4
	.word	0xc568a0c6	! t0_kref+0x45c:   	prefetch	%g2 + 0xc6, 2
	.word	0x20800002	! t0_kref+0x460:   	bn,a	_kref+0x468
	.word	0x908f2561	! t0_kref+0x464:   	andcc	%i4, 0x561, %o0
	.word	0x81a0cd25	! t0_kref+0x468:   	fsmuld	%f3, %f5, %f0
	.word	0x900a779b	! t0_kref+0x46c:   	and	%o1, -0x865, %o0
	.word	0x39480001	! t0_kref+0x470:   	fbuge,a,pt	%fcc0, _kref+0x474
	.word	0x81a08d2c	! t0_kref+0x474:   	fsmuld	%f2, %f12, %f0
	.word	0x8fa309aa	! t0_kref+0x478:   	fdivs	%f12, %f10, %f7
	.word	0x90e3610a	! t0_kref+0x47c:   	subccc	%o5, 0x10a, %o0
	.word	0x912a401a	! t0_kref+0x480:   	sll	%o1, %i2, %o0
	.word	0x3f480007	! t0_kref+0x484:   	fbo,a,pt	%fcc0, _kref+0x4a0
	.word	0x907ac000	! t0_kref+0x488:   	sdiv	%o3, %g0, %o0
	.word	0x3e480005	! t0_kref+0x48c:   	bvc,a,pt	%icc, _kref+0x4a0
	.word	0x900af3ba	! t0_kref+0x490:   	and	%o3, -0xc46, %o0
	.word	0xe6f81019	! t0_kref+0x494:   	swapa	[%g0 + %i1]0x80, %l3
	.word	0x91d02038	! t0_kref+0x498:   	ta	%icc, %g0 + 0x38
	.word	0x81828000	! t0_kref+0x49c:   	wr	%o2, %g0, %y
	.word	0x90fef6dc	! t0_kref+0x4a0:   	sdivcc	%i3, -0x924, %o0
	.word	0x8610201e	! t0_kref+0x4a4:   	mov	0x1e, %g3
	.word	0x86a0e001	! t0_kref+0x4a8:   	subcc	%g3, 1, %g3
	.word	0x0280001a	! t0_kref+0x4ac:   	be	_kref+0x514
	.word	0x91d02068	! t0_kref+0x4b0:   	ta	%icc, %g0 + 0x68
	.word	0xdb80a010	! t0_kref+0x4b4:   	lda	[%g2 + 0x10]%asi, %f13
	.word	0xc11fbc90	! t0_kref+0x4b8:   	ldd	[%fp - 0x370], %f0
	.word	0x909337c3	! t0_kref+0x4bc:   	orcc	%o4, -0x83d, %o0
	.word	0xd980a010	! t0_kref+0x4c0:   	lda	[%g2 + 0x10]%asi, %f12
	.word	0x91026c2e	! t0_kref+0x4c4:   	taddcc	%o1, 0xc2e, %o0
	.word	0x09800005	! t0_kref+0x4c8:   	fbl	_kref+0x4dc
	.word	0xc900a020	! t0_kref+0x4cc:   	ld	[%g2 + 0x20], %f4
	.word	0xc51e001d	! t0_kref+0x4d0:   	ldd	[%i0 + %i5], %f2
	.word	0xd91fbe98	! t0_kref+0x4d4:   	ldd	[%fp - 0x168], %f12
	.word	0x81a0192c	! t0_kref+0x4d8:   	fstod	%f12, %f0
	.word	0x90bf367b	! t0_kref+0x4dc:   	xnorcc	%i4, -0x985, %o0
	.word	0x0047fff2	! t0_kref+0x4e0:   	bn,pn	%icc, _kref+0x4a8
	.word	0xd04e201e	! t0_kref+0x4e4:   	ldsb	[%i0 + 0x1e], %o0
	.word	0xd0c8a013	! t0_kref+0x4e8:   	ldsba	[%g2 + 0x13]%asi, %o0
	.word	0x1a47ffef	! t0_kref+0x4ec:   	bcc,pn	%icc, _kref+0x4a8
	.word	0x90dac01b	! t0_kref+0x4f0:   	smulcc	%o3, %i3, %o0
	.word	0x913a800d	! t0_kref+0x4f4:   	sra	%o2, %o5, %o0
	.word	0x87a24822	! t0_kref+0x4f8:   	fadds	%f9, %f2, %f3
	.word	0xd0060000	! t0_kref+0x4fc:   	ld	[%i0], %o0
	.word	0x90aa400d	! t0_kref+0x500:   	andncc	%o1, %o5, %o0
	.word	0x99a00040	! t0_kref+0x504:   	fmovd	%f0, %f12
	.word	0x81a90a4a	! t0_kref+0x508:   	fcmpd	%fcc0, %f4, %f10
	.word	0xf8700019	! t0_kref+0x50c:   	stx	%i4, [%g0 + %i1]
	.word	0x90532eb3	! t0_kref+0x510:   	umul	%o4, 0xeb3, %o0
	.word	0x0f480006	! t0_kref+0x514:   	fbu,pt	%fcc0, _kref+0x52c
	.word	0x99a01046	! t0_kref+0x518:   	fdtox	%f6, %f12
	.word	0x2f400003	! t0_kref+0x51c:   	fbu,a,pn	%fcc0, _kref+0x528
	.word	0x97a01884	! t0_kref+0x520:   	fitos	%f4, %f11
	.word	0x900b000a	! t0_kref+0x524:   	and	%o4, %o2, %o0
	.word	0x913ec000	! t0_kref+0x528:   	sra	%i3, %g0, %o0
	.word	0x9042400c	! t0_kref+0x52c:   	addc	%o1, %o4, %o0
	.word	0xc91fbe38	! t0_kref+0x530:   	ldd	[%fp - 0x1c8], %f4
	.word	0x908ab44c	! t0_kref+0x534:   	andcc	%o2, -0xbb4, %o0
	.word	0x81a1cd2d	! t0_kref+0x538:   	fsmuld	%f7, %f13, %f0
	.word	0x95a01929	! t0_kref+0x53c:   	fstod	%f9, %f10
	.word	0x9056c009	! t0_kref+0x540:   	umul	%i3, %o1, %o0
	.word	0x907f3b17	! t0_kref+0x544:   	sdiv	%i4, -0x4e9, %o0
	.word	0xd048a008	! t0_kref+0x548:   	ldsb	[%g2 + 8], %o0
	.word	0xd00e3fe8	! t0_kref+0x54c:   	ldub	[%i0 - 0x18], %o0
	.word	0xd0062000	! t0_kref+0x550:   	ld	[%i0], %o0
	call	SYM(t0_subr3)
	.word	0x902b401c	! t0_kref+0x558:   	andn	%o5, %i4, %o0
	.word	0x85a000cc	! t0_kref+0x55c:   	fnegd	%f12, %f2
	.word	0xd0d0a000	! t0_kref+0x560:   	ldsha	[%g2]%asi, %o0
	.word	0x90028000	! t0_kref+0x564:   	add	%o2, %g0, %o0
	.word	0x29400002	! t0_kref+0x568:   	fbl,a,pn	%fcc0, _kref+0x570
	.word	0xd016600e	! t0_kref+0x56c:   	lduh	[%i1 + 0xe], %o0
	.word	0x9126acd2	! t0_kref+0x570:   	mulscc	%i2, 0xcd2, %o0
	.word	0x81dd0016	! t0_kref+0x574:   	flush	%l4 + %l6
	.word	0x90fa6ac8	! t0_kref+0x578:   	sdivcc	%o1, 0xac8, %o0
	.word	0x04400007	! t0_kref+0x57c:   	ble,pn	%icc, _kref+0x598
	.word	0x9120281e	! t0_kref+0x580:   	mulscc	%g0, 0x81e, %o0
	.word	0xf207bfe0	! t0_kref+0x584:   	ld	[%fp - 0x20], %i1
	.word	0x90ab38f5	! t0_kref+0x588:   	andncc	%o4, -0x70b, %o0
	.word	0xf42e4000	! t0_kref+0x58c:   	stb	%i2, [%i1]
	.word	0x91d0202c	! t0_kref+0x590:   	ta	%icc, %g0 + 0x2c
	.word	0x25800005	! t0_kref+0x594:   	fblg,a	_kref+0x5a8
	.word	0x9066800b	! t0_kref+0x598:   	subc	%i2, %o3, %o0
	.word	0x90d8000c	! t0_kref+0x59c:   	smulcc	%g0, %o4, %o0
	.word	0xd0164000	! t0_kref+0x5a0:   	lduh	[%i1], %o0
	.word	0xd016c019	! t0_kref+0x5a4:   	lduh	[%i3 + %i1], %o0
	.word	0xd03e401d	! t0_kref+0x5a8:   	std	%o0, [%i1 + %i5]
	.word	0x37800005	! t0_kref+0x5ac:   	fbge,a	_kref+0x5c0
	.word	0x912ae01e	! t0_kref+0x5b0:   	sll	%o3, 0x1e, %o0
	.word	0xc9be6000	! t0_kref+0x5b4:   	stda	%f4, [%i1]%asi
	.word	0x907ab02d	! t0_kref+0x5b8:   	sdiv	%o2, -0xfd3, %o0
	.word	0xd088a020	! t0_kref+0x5bc:   	lduba	[%g2 + 0x20]%asi, %o0
	.word	0x9063401a	! t0_kref+0x5c0:   	subc	%o5, %i2, %o0
	.word	0x91a00128	! t0_kref+0x5c4:   	fabss	%f8, %f8
	.word	0xd300a010	! t0_kref+0x5c8:   	ld	[%g2 + 0x10], %f9
	.word	0x90200000	! t0_kref+0x5cc:   	neg	%g0, %o0
	.word	0x19800003	! t0_kref+0x5d0:   	fbuge	_kref+0x5dc
	.word	0x81a01908	! t0_kref+0x5d4:   	fitod	%f8, %f0
	.word	0x8da01921	! t0_kref+0x5d8:   	fstod	%f1, %f6
	.word	0xd6267ffc	! t0_kref+0x5dc:   	st	%o3, [%i1 - 4]
	.word	0x1e800002	! t0_kref+0x5e0:   	bvc	_kref+0x5e8
	.word	0x91a0c9a0	! t0_kref+0x5e4:   	fdivs	%f3, %f0, %f8
	.word	0x9167c009	! t0_kref+0x5e8:   	movvc	%icc, %o1, %o0
	.word	0xd00e2013	! t0_kref+0x5ec:   	ldub	[%i0 + 0x13], %o0
	.word	0x81a2c9a4	! t0_kref+0x5f0:   	fdivs	%f11, %f4, %f0
	.word	0xc0367ff0	! t0_kref+0x5f4:   	clrh	[%i1 - 0x10]
	.word	0x87a01a42	! t0_kref+0x5f8:   	fdtoi	%f2, %f3
	.word	0x8da000c0	! t0_kref+0x5fc:   	fnegd	%f0, %f6
	.word	0x90534009	! t0_kref+0x600:   	umul	%o5, %o1, %o0
	.word	0x1f400003	! t0_kref+0x604:   	fbo,pn	%fcc0, _kref+0x610
	.word	0x9076aa47	! t0_kref+0x608:   	udiv	%i2, 0xa47, %o0
	.word	0x91a0190c	! t0_kref+0x60c:   	fitod	%f12, %f8
	.word	0xd91fbe18	! t0_kref+0x610:   	ldd	[%fp - 0x1e8], %f12
	.word	0xd04e601a	! t0_kref+0x614:   	ldsb	[%i1 + 0x1a], %o0
	.word	0x91a00120	! t0_kref+0x618:   	fabss	%f0, %f8
	.word	0xd0000019	! t0_kref+0x61c:   	ld	[%g0 + %i1], %o0
	.word	0x39800008	! t0_kref+0x620:   	fbuge,a	_kref+0x640
	.word	0x89a01925	! t0_kref+0x624:   	fstod	%f5, %f4
	.word	0x90e6ebbb	! t0_kref+0x628:   	subccc	%i3, 0xbbb, %o0
	.word	0xd050a018	! t0_kref+0x62c:   	ldsh	[%g2 + 0x18], %o0
	.word	0xd05e6008	! t0_kref+0x630:   	ldx	[%i1 + 8], %o0
	.word	0xcf062004	! t0_kref+0x634:   	ld	[%i0 + 4], %f7
	.word	0x91400000	! t0_kref+0x638:   	mov	%y, %o0
	.word	0xd0167ff4	! t0_kref+0x63c:   	lduh	[%i1 - 0xc], %o0
	.word	0x89a01929	! t0_kref+0x640:   	fstod	%f9, %f4
	.word	0xd040a030	! t0_kref+0x644:   	ldsw	[%g2 + 0x30], %o0
	.word	0x90427319	! t0_kref+0x648:   	addc	%o1, -0xce7, %o0
	.word	0xd0070018	! t0_kref+0x64c:   	ld	[%i4 + %i0], %o0
	.word	0x01000000	! t0_kref+0x650:   	nop
	.word	0x01000000	! t0_kref+0x654:   	nop
	.word	0x01000000	! t0_kref+0x658:   	nop
	.word	0x01000000	! t0_kref+0x65c:   	nop
	call	SYM(_kaos_done)
	.word	0x01000000	! t0_kref+0x664:   	nop
	KGLOBAL(t0_ktbl_end)
t0_ktbl_end:
t0_ktbl_page_end:

KTEXT_MODULE(t0_module_subr0, 0x28dbe000)
.seg "text"
t0_subr0_page_begin:
	.skip 8192
.global _t0_subr0; ENTRY(t0_subr0)
	.word	0xa6844012	! t0_subr0+0x0:   	addcc	%l1, %l2, %l3
	.word	0x81c3e008	! t0_subr0+0x4:   	retl
	.word	0xaa64c014	! t0_subr0+0x8:   	subc	%l3, %l4, %l5
t0_subr0_page_end:

KTEXT_MODULE(t0_module_subr1, 0x28e1e000)
.seg "text"
t0_subr1_page_begin:
	.skip 8192
.global _t0_subr1; ENTRY(t0_subr1)
	.word	0x9de3bfa0	! t0_subr1+0x0:   	save	%sp, -0x60, %sp
	.word	0xb29eaa5a	! t0_subr1+0x4:   	xorcc	%i2, 0xa5a, %i1
	.word	0x81c7e008	! t0_subr1+0x8:   	ret
	.word	0xa7ee6001	! t0_subr1+0xc:   	restore	%i1, 1, %l3
t0_subr1_page_end:

KTEXT_MODULE(t0_module_subr2, 0x255c6000)
.seg "text"
t0_subr2_page_begin:
	.skip 8188
.global _t0_subr2; ENTRY(t0_subr2)
	.word	0x9de3bfa0	! t0_subr2+0x0:   	save	%sp, -0x60, %sp
	.word	0xb2066001	! t0_subr2+0x4:   	add	%i1, 1, %i1
	.word	0x81c7e008	! t0_subr2+0x8:   	ret
	.word	0xa3ee6001	! t0_subr2+0xc:   	restore	%i1, 1, %l1
t0_subr2_page_end:

KTEXT_MODULE(t0_module_subr3, 0x29206000)
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
!  Total operations: 402   
!
!  Operation frequencies
!
!  name               exp    obs
!  ldsb              1.43   1.00
!  ldub              0.67   0.75
!  ldsh              0.17   0.00
!  lduh              1.25   1.74
!  ld                1.45   1.24
!  ldd               0.43   0.00
!  swap              0.78   1.00
!  ldstub            1.53   1.24
!  stb               1.18   1.00
!  sth               1.11   1.24
!  st                1.37   0.75
!  std               1.56   1.99
!  add               0.73   0.75
!  addcc             0.61   0.00
!  addx              0.63   0.75
!  addxcc            0.10   0.00
!  taddcc            0.31   0.25
!  taddcctv          0.17   0.25
!  sub               0.55   0.25
!  subcc             0.17   0.00
!  subx              0.85   1.49
!  subxcc            0.53   0.50
!  tsubcc            0.14   0.25
!  tsubcctv          0.10   0.00
!  mulscc            1.56   0.75
!  and               1.28   2.24
!  andcc             1.26   1.49
!  andn              0.47   1.24
!  andncc            1.24   0.75
!  or                0.21   0.25
!  orcc              0.84   0.50
!  orn               0.64   0.75
!  orncc             0.62   0.00
!  xor               0.18   0.00
!  xorcc             0.40   0.00
!  xnor              0.83   0.25
!  xnorcc            0.59   0.50
!  sll               1.24   1.99
!  srl               0.67   1.00
!  sra               1.59   1.74
!  unimp             0.33   0.25
!  umul              1.08   1.24
!  smul              0.51   0.50
!  udiv              0.69   0.75
!  sdiv              0.92   1.00
!  umulcc            0.87   0.25
!  smulcc            1.39   1.24
!  udivcc            0.04   0.00
!  sdivcc            1.56   1.49
!  rdy               0.94   0.75
!  wry               0.59   1.24
!  bicc              0.56   1.00
!  sethi             1.08   0.25
!  jmpl              0.57   0.00
!  call              1.57   1.24
!  ticc              0.05   0.50
!  flush             1.25   0.75
!  save              0.27   0.25
!  restore           0.66   0.00
!  stbar             0.18   0.50
!  ldf               0.72   0.25
!  lddf              1.08   1.24
!  stf               0.79   0.25
!  stdf              0.08   0.25
!  fadds             1.39   2.24
!  fsubs             0.28   0.25
!  fmuls             0.66   0.50
!  fdivs             1.15   1.49
!  faddd             1.06   0.50
!  fsubd             0.04   0.00
!  fmuld             0.62   0.25
!  fdivd             1.18   0.50
!  faddq             0.00   0.00
!  fsubq             0.00   0.00
!  fmulq             0.00   0.00
!  fdivq             0.00   0.00
!  fsmuld            0.85   1.49
!  fdmulq            0.00   0.00
!  fitos             0.76   0.50
!  fitod             1.34   1.49
!  fitoq             0.00   0.00
!  fstoi             0.56   0.50
!  fstod             1.24   3.23
!  fstoq             0.00   0.00
!  fdtoi             0.73   0.75
!  fdtos             0.31   0.00
!  fdtoq             0.00   0.00
!  fqtoi             0.00   0.00
!  fqtos             0.00   0.00
!  fqtod             0.00   0.00
!  fmovs             0.55   0.50
!  fnegs             0.09   0.00
!  fabss             1.21   1.49
!  fsqrts            0.00   0.00
!  fsqrtd            0.00   0.00
!  fsqrtq            0.00   0.00
!  fcmps             0.07   0.25
!  fcmpd             1.08   0.50
!  fcmpq             0.00   0.00
!  fcmpes            0.40   0.25
!  fcmped            0.07   0.00
!  fcmpeq            0.00   0.00
!  fbfcc             4.19   3.98
!  ldfsr             0.18   0.00
!  stfsr             0.06   0.00
!  loop              0.53   0.25
!  offset            0.09   0.00
!  area              0.22   0.75
!  target            0.06   0.00
!  goto              0.03   0.00
!  sigsegv           0.24   0.25
!  sigbus            0.07   0.00
!  imodify           0.69   0.00
!  ldfsr_offset      0.24   0.00
!  fpattern          1.12   2.74
!  lbranch           0.16   0.00
!  shmld             5.58   6.72
!  shmst             0.92   1.00
!  shmpf             1.60   2.49
!  shmswap           0.01   0.25
!  shmblkld          0.77   0.25
!  shmblkst          0.38   0.00
!  shmblkchk         0.05   0.50
!  hack_restore      0.07   0.00
!  demap_random_va   0.24   0.00
!  demap_area        0.19   0.50
!  demap_ktbl_text   0.11   0.00
!  demap_ktbl_data   0.03   0.25
!  demap_subr        0.15   0.25
!  demap_reg         0.30   0.25
!  demap_stack       0.22   0.25
!  ro_area           0.00   0.00
!  ro_ktbl_data      0.00   0.00
!  ro_reg            0.00   0.00
!  ro_stack          0.00   0.00
!  set_window        0.06   0.00
!  set_va_wp         0.13   0.00
!  set_pa_wp         0.02   0.00
!  set_softint       0.25   0.00
!  ie_toggle         0.25   0.25
!  set_pil           0.19   0.25
!  set_tso           0.11   0.00
!  set_pso           0.23   0.75
!  set_rmo           0.08   0.00
!  cflush            0.00   0.00
!  return            0.26   0.00
!  casa              0.15   0.00
!  rdasi             0.07   0.00
!  wrasi             0.19   0.25
!  bpcc              2.33   3.73
!  fbpfcc            6.27   5.47
!  fmovscc           0.05   0.00
!  fmovdcc           0.05   0.00
!  fmovqcc           0.00   0.00
!  movcc             0.33   1.24
!  flushw            0.14   0.00
!  membar            0.32   0.25
!  prefetch          0.33   0.00
!  rdpc              0.08   0.00
!  ldqf              0.00   0.00
!  stqf              0.00   0.00
!  ldfa              0.28   0.00
!  lddfa             0.17   0.00
!  ldqfa             0.00   0.00
!  ldsba             0.03   0.00
!  ldsha             0.06   0.00
!  lduba             0.15   0.00
!  lduha             0.08   0.00
!  lda               0.22   0.00
!  ldda              0.23   0.00
!  ldstuba           0.07   0.25
!  prefetcha         0.00   0.00
!  stfa              0.05   0.00
!  stdfa             0.25   0.25
!  stqfa             0.00   0.00
!  stba              0.18   0.00
!  stha              0.06   0.00
!  sta               0.13   0.00
!  stda              0.02   0.00
!  swapa             0.26   0.50
!  fmovd             0.27   0.75
!  fnegd             0.16   0.75
!  fabsd             0.13   0.50
!  fstox             0.01   0.00
!  fdtox             0.20   0.25
!  fxtos             0.07   0.25
!  fxtod             0.09   0.00
!  lds               0.10   0.25
!  ldsa              0.11   0.00
!  ldx               0.06   0.25
!  ldxa              0.22   0.25
!  nofault           0.03   0.00
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
!  partial_st8       0.00   0.00
!  partial_st16      0.00   0.00
!  partial_st32      0.00   0.00
!  short_st8         0.00   0.00
!  short_st16        0.00   0.00
!  short_ld8         0.00   0.00
!  short_ld16        0.00   0.00
!  blkld             0.00   0.00
!  blkst             0.00   0.00
!  blkld_offset      0.00   0.00
!  blkst_offset      0.00   0.00
!  blk_check         0.00   0.00
!  casxa             0.11   0.00
!  rdccr             0.13   0.00
!  rdfprs            0.16   0.50
!  wrccr             0.31   0.00
!  popc              0.00   0.00
!  wrfprs            0.17   0.25
!  stx               0.13   0.25
!  stxa              0.05   0.25
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
KDATA_MODULE(t0_module_offset_table, 0x18206000)
.seg "data"
t0_offset_table_start:
t0_offset_table_size:	.word	0x00000008
t0_offset_table:
	.word	0x00000018
	.word	0x00000000
	.word	0xfffffff8
	.word	0xfffffff0
	.word	0xffffffe0
	.word	0x00000010
	.word	0xffffffe8
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

KDATA_MODULE(t0_module_data_in_regs, 0x1e306000)
.seg "data"
KGLOBAL(t0_data_in_regs)
t0_data_in_regs_start:
t0_data_in_regs:
	.word	0xdaa299cd          ! %f0
	.word	0xf470bca3          ! %f1
	.word	0x4b8c67a3          ! %f2
	.word	0xfbb71fda          ! %f3
	.word	0xcb358428          ! %f4
	.word	0xd8b6b165          ! %f5
	.word	0xa8edd40a          ! %f6
	.word	0x0c1b4ea0          ! %f7
	.word	0xf4a929bc          ! %f8
	.word	0xce7cd4f5          ! %f9
	.word	0x6cd501fe          ! %f10
	.word	0xb3ed1afa          ! %f11
	.word	0x824c335a          ! %f12
	.word	0x126a79e8          ! %f13
	.word	0xf9f0d622          ! %f14
	.word	0x5814b247          ! %f15
	.word	0xc88839ab          ! %f16
	.word	0x990974fa          ! %f17
	.word	0xe612fce0          ! %f18
	.word	0x55cf2217          ! %f19
	.word	0xdd50a361          ! %f20
	.word	0x818d712f          ! %f21
	.word	0xb7d715c1          ! %f22
	.word	0xbd3942ed          ! %f23
	.word	0x38e4b2ae          ! %f24
	.word	0xdf79e23b          ! %f25
	.word	0x0640bfff          ! %f26
	.word	0xb7580b46          ! %f27
	.word	0xa1a075f9          ! %f28
	.word	0xd8ca3923          ! %f29
	.word	0x2e555c58          ! %f30
	.word	0x84248eda          ! %f31
	.word	0x691f8fcf          ! %f32
	.word	0xda563f23          ! %f33
	.word	0x4daf9824          ! %f34
	.word	0x48c22e21          ! %f35
	.word	0x2db00a17          ! %f36
	.word	0xeb66bad2          ! %f37
	.word	0xda5815a9          ! %f38
	.word	0x6369ba18          ! %f39
	.word	0xc842a889          ! %f40
	.word	0x820cc383          ! %f41
	.word	0x190fc5ae          ! %f42
	.word	0x81fc9044          ! %f43
	.word	0x5fe96e61          ! %f44
	.word	0xd61066ee          ! %f45
	.word	0xc0edc64d          ! %f46
	.word	0x65def2f7          ! %f47
	.word	0x4fcc4b4f          ! %f48
	.word	0xa6718510          ! %f49
	.word	0x46fbdb0d          ! %f50
	.word	0xb3e921d1          ! %f51
	.word	0x5e8723b0          ! %f52
	.word	0xefc0064f          ! %f53
	.word	0xe399d22f          ! %f54
	.word	0xce32f689          ! %f55
	.word	0xe563a803          ! %f56
	.word	0xce3ecfe0          ! %f57
	.word	0x47216b48          ! %f58
	.word	0xe77609ed          ! %f59
	.word	0xd614af95          ! %f60
	.word	0xf8171a6d          ! %f61
	.word	0xd8c9930f          ! %f62
	.word	0xf0fea527          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0x88c       ! %g1 (code pointer)
	.word	t0_data_in_shm_area ! %g2 (shared area pointer)
	.word	0xf7bc7ae4          ! %g3 (loop index)
	.word	SYM(t0_subr3)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0x9e4ce510          ! %o0
	.word	0xc4d144a2          ! %o1
	.word	0x447f924b          ! %o2
	.word	0xb5cbc879          ! %o3
	.word	0xb1de97dd          ! %o4
	.word	0x326074fe          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0xe5c00a7f          ! %l0
	.word	0x08180ef1          ! %l1
	.word	0x0b610878          ! %l2
	.word	0xe4e40341          ! %l3
	.word	0x8f7efed2          ! %l4
	.word	0x82d8cde6          ! %l5
	.word	0xec65bf01          ! %l6
	.word	0x32c4a6ea          ! %l7
	.word	t0_data_in_area0    ! %i0 (area pointer)
	.word	t0_data_in_area0    ! %i1 (area pointer)
	.word	0x00000010          ! %i2 (byte offset)
	.word	0xfffffff8          ! %i3 (halfword offset)
	.word	0x00000018          ! %i4 (word offset)
	.word	0xfffffff8          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0xf1ba1eeb          ! %y
	.word	0x00000002          ! %icc (nzvc)
	.word	0xc0000572          ! %fsr
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

KDATA_MODULE(t0_module_data_in_stack, 0x07e78000)
.seg "data"
KGLOBAL(t0_data_in_mtbl_size)
KGLOBAL(t0_data_in_mtbl)
KGLOBAL(t0_data_in_stack)
t0_data_in_stack_start:
	.word	0xd184736d
	.word	0x5d0c2323
	.word	0xce9a9986
	.word	0x91424696
	.word	0x1c7e3487
	.word	0xe09cd101
	.word	0x78514481
	.word	0xb09325aa
	.word	0x49a72279
	.word	0xab889b5e
	.word	0xd631bbf7
	.word	0x6dfc3bda
	.word	0x132e78bd
	.word	0x78b46662
	.word	0x1bf5aef7
	.word	0x487a381f
	.word	0x6d271763
	.word	0x95e74142
	.word	0xc91b2247
	.word	0x9513ebfb
	.word	0x083c2f25
	.word	0xd7c1a2c5
	.word	0xeb37cc98
	.word	0xb91f4599
	.word	0xeafc1ab9
	.word	0x4f4d6a03
	.word	0x79a981fb
	.word	0x5bd94832
	.word	0xcce6f966
	.word	0x0686a770
	.word	0x481d6293
	.word	0x43daa6b1
	.word	0xeb33deda
	.word	0xb0b97218
	.word	0xfecec08c
	.word	0x2168e499
	.word	0x1b18ac39
	.word	0x76914d2b
	.word	0xdff9f14b
	.word	0xbc3e2126
	.word	0x458de679
	.word	0x087ae1bc
	.word	0xa10e7de6
	.word	0xc85ff0b2
	.word	0x2e491dec
	.word	0x24c110c5
	.word	0xb6ef66d6
	.word	0x9c3fe85a
	.word	0x303dbb1e
	.word	0x3ddaa16e
	.word	0x8e476eeb
	.word	0x98e6bfe1
	.word	0x4e9d44e0
	.word	0xe8ee0f8e
	.word	0xdee2a17f
	.word	0xe5952dd3
	.word	0xc74d73a4
	.word	0xf8e53e71
	.word	0xaa5d87ee
	.word	0x2953e1ed
	.word	0xfc5ba60c
	.word	0x6fc313db
	.word	0x468dc245
	.word	0xd09e41bc
	.word	0xa25a8abc
	.word	0xca893f4d
	.word	0xca0ef738
	.word	0xb1e9cb83
	.word	0x53101377
	.word	0x2c1cb186
	.word	0x389a4f59
	.word	0x33864361
	.word	0xeba70569
	.word	0xe57b884c
	.word	0x447def87
	.word	0x7e710eb3
	.word	0x0cf8bac1
	.word	0x257f726b
	.word	0x75ed26a4
	.word	0x7e7861b7
	.word	0x10b8e983
	.word	0xd493cffe
	.word	0x0f39428a
	.word	0x06b12371
	.word	0x4896839b
	.word	0xe97712ec
	.word	0x518e403e
	.word	0x240cabd1
	.word	0x32020434
	.word	0xbf9323b5
	.word	0x87cdcb66
	.word	0x9509c015
	.word	0xd37abe4a
	.word	0x0df0ce6e
	.word	0xd7d640f8
	.word	0x474e716c
	.word	0xec4a007d
	.word	0x3b867c0a
	.word	0xa52aa934
	.word	0x48aec1db
	.word	0x46ac2228
	.word	0xa2e2bbda
	.word	0xd5cbdcd3
	.word	0x92fe3364
	.word	0xf3d4cdb2
	.word	0x58376156
	.word	0x8a624980
	.word	0xaf48a564
	.word	0xb23d1c23
	.word	0xa9d23a1d
	.word	0x88db0987
	.word	0x2ff1243c
	.word	0x3e7f55fa
	.word	0x985ca03a
	.word	0x5b9242cc
	.word	0x27fb8f34
	.word	0xeeed6d3d
	.word	0x2a0b6ca8
	.word	0xda5000fd
	.word	0xeab0389b
	.word	0x274c84d0
	.word	0xc67d0e18
	.word	0xc4fbff0b
	.word	0xc016e432
	.word	0xedf1190a
	.word	0xc09bc7f0
	.word	0x4d4013d5
	.word	0xbab8c7ca
	.word	0x0b1c9d85
	.word	0x24b65d97
	.word	0xdb983626
	.word	0x3fef722a
	.word	0x8836a435
	.word	0x9b61adef
	.word	0x30ca4be1
	.word	0x0800bc37
	.word	0x5b88e1bb
	.word	0x49da0322
	.word	0xddaf387b
	.word	0xaca6284e
	.word	0x5fc6a2fb
	.word	0xa6c31aa1
	.word	0x3bd9dea8
	.word	0x3da053f4
	.word	0x0a1d87eb
	.word	0x1a92296a
	.word	0xe1400958
	.word	0x99dd5fb1
	.word	0x5f1697ae
	.word	0x55dd6089
	.word	0x72d46fe4
	.word	0x72c37138
	.word	0x7b6c01e0
	.word	0xb180b5e0
	.word	0xad404984
	.word	0x449eb3cb
	.word	0x43692133
	.word	0xd53ff529
	.word	0x1ade2404
	.word	0x35447add
	.word	0xe6af933a
	.word	0xb58a5d3c
	.word	0xd1fef1b7
	.word	0x96f36af8
	.word	0x68957984
	.word	0xa8844d8d
	.word	0x899d82ab
	.word	0xcb92cce0
t0_data_in_sp:
	.word	0x23fe37ed
	.word	0x91bfc7f9
	.word	0x9433dd1e
	.word	0xe1f16ef9
	.word	0xbdd04430
	.word	0xab54cac1
	.word	0xd3a9292f
	.word	0x95c6b8e5
	.word	t0_data_in_area0
	.word	t0_data_in_area0
	.word	0x0000000c
	.word	0xffffffe8
	.word	0x00000018
	.word	0x00000000
	.word	t0_data_in_fp
	.word	0x2eb4b656
	.word	0xb7094d1b
	.word	0x900516b1
	.word	0x9b65dbcd
	.word	0xd0659756
	.word	0x7493457b
	.word	0xe14df868
	.word	0xf9e4d5ad
	.word	0x739b4ee2
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
	.word   	0xa2770ead	! [%fp - 0xc]
	.word   	0x5a9464ae	! [%fp - 0x8]
	.word   	0x6a9ce706	! [%fp - 0x4]
.global t0_data_in_fp; t0_data_in_fp:
	.word	0xcb523841
	.word	0x55c1238f
	.word	0xcbd41ecc
	.word	0xfae495ff
	.word	0x1433e47c
	.word	0x65439b59
	.word	0x9645786a
	.word	0xb5731aae
	.word	0x5127ce21
	.word	0xe564cc11
	.word	0x643cb4ec
	.word	0xf7f988aa
	.word	0x05550544
	.word	0xe7112044
	.word	0xd611bf18
	.word	0xea2c7ddd
	.word	0x99c417c6
	.word	0x4b0813f2
	.word	0x6e1b14fb
	.word	0x95b96a9e
	.word	0xba00b9d9
	.word	0x41c78cc9
	.word	0xe1110e0d
	.word	0x32bfc6fe
t0_data_in_stacktop:
	.word	0
t0_data_in_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_in_area0, 0x0cb04000)
.seg "data"
t0_data_in_area0_start:
.skip 128
t0_data_in_area0_begin:
	.word	0xcb0ef2c2	! t0_data_in_area0-0x20
	.word	0x74d80196	! t0_data_in_area0-0x1c
	.word	0x0ddcdf93	! t0_data_in_area0-0x18
	.word	0x6d17c961	! t0_data_in_area0-0x14
	.word	0x9affd1e1	! t0_data_in_area0-0x10
	.word	0xbb6f24f8	! t0_data_in_area0-0xc
	.word	0x82290344	! t0_data_in_area0-0x8
	.word	0x69357250	! t0_data_in_area0-0x4
.global t0_data_in_area0; t0_data_in_area0:
	.word	0x31adefee	! t0_data_in_area0+0x0
	.word	0x79860756	! t0_data_in_area0+0x4
	.word	0xbe3ee42f	! t0_data_in_area0+0x8
	.word	0xed10018e	! t0_data_in_area0+0xc
	.word	0x74ea4085	! t0_data_in_area0+0x10
	.word	0x68dae412	! t0_data_in_area0+0x14
	.word	0xad17f5db	! t0_data_in_area0+0x18
	.word	0x67632868	! t0_data_in_area0+0x1c
t0_data_in_area0_end:
.skip 8000
t0_data_in_area0_stop:

KDATA_MODULE(t0_module_data_in_shm_area, 0x07be0000)
.seg "data"
t0_data_in_shm_area_start:
t0_data_in_shm_area_begin:
.global t0_data_in_shm_area; t0_data_in_shm_area:
	.word	0x0fe5f7e3	! t0_data_in_shm_area+0x0 (t0)
	.word	0xe6dd1d30	! t0_data_in_shm_area+0x4 (t1)
	.word	0x0e260dfe	! t0_data_in_shm_area+0x8 (t0)
	.word	0xa6848220	! t0_data_in_shm_area+0xc (t1)
	.word	0xab4699af	! t0_data_in_shm_area+0x10 (t0)
	.word	0x807cb648	! t0_data_in_shm_area+0x14 (t1)
	.word	0x4f208d51	! t0_data_in_shm_area+0x18 (t0)
	.word	0x6143db18	! t0_data_in_shm_area+0x1c (t1)
	.word	0xb72e88f1	! t0_data_in_shm_area+0x20 (t0)
	.word	0x4a6fb59f	! t0_data_in_shm_area+0x24 (t1)
	.word	0xb54caf0e	! t0_data_in_shm_area+0x28 (t0)
	.word	0xeaa7f183	! t0_data_in_shm_area+0x2c (t1)
	.word	0x52bd7694	! t0_data_in_shm_area+0x30 (t0)
	.word	0xf41cb7c1	! t0_data_in_shm_area+0x34 (t1)
	.word	0x033d74ad	! t0_data_in_shm_area+0x38 (t0)
	.word	0xe74989dd	! t0_data_in_shm_area+0x3c (t1)
	.word	0xb45cff82	! t0_data_in_shm_area+0x40 (t0 bload)
	.word	0xa4d34f4f	! t0_data_in_shm_area+0x44
	.word	0x48c226d8	! t0_data_in_shm_area+0x48
	.word	0x8971a2ed	! t0_data_in_shm_area+0x4c
	.word	0x5eea3ad9	! t0_data_in_shm_area+0x50
	.word	0xa67d5718	! t0_data_in_shm_area+0x54
	.word	0xd8c26055	! t0_data_in_shm_area+0x58
	.word	0x3639cbdb	! t0_data_in_shm_area+0x5c
	.word	0x4eadcc6d	! t0_data_in_shm_area+0x60
	.word	0xd826007e	! t0_data_in_shm_area+0x64
	.word	0xf890fad2	! t0_data_in_shm_area+0x68
	.word	0xeac12336	! t0_data_in_shm_area+0x6c
	.word	0x30a57eef	! t0_data_in_shm_area+0x70
	.word	0x77b26c0c	! t0_data_in_shm_area+0x74
	.word	0xcb0278a8	! t0_data_in_shm_area+0x78
	.word	0x837ae281	! t0_data_in_shm_area+0x7c
	.word	0x03ffc98b	! t0_data_in_shm_area+0x80 (t0 bstore)
	.word	0x7ec3ccb3	! t0_data_in_shm_area+0x84
	.word	0x1b36f5a8	! t0_data_in_shm_area+0x88
	.word	0xb56dd817	! t0_data_in_shm_area+0x8c
	.word	0x7443b36e	! t0_data_in_shm_area+0x90
	.word	0x11cbdeff	! t0_data_in_shm_area+0x94
	.word	0x0759a03c	! t0_data_in_shm_area+0x98
	.word	0xadc15383	! t0_data_in_shm_area+0x9c
	.word	0x1a14eb88	! t0_data_in_shm_area+0xa0
	.word	0x21951f8c	! t0_data_in_shm_area+0xa4
	.word	0xf37c20cb	! t0_data_in_shm_area+0xa8
	.word	0xa03c030e	! t0_data_in_shm_area+0xac
	.word	0xbebb1892	! t0_data_in_shm_area+0xb0
	.word	0xf97374b7	! t0_data_in_shm_area+0xb4
	.word	0x56b69362	! t0_data_in_shm_area+0xb8
	.word	0x335a9698	! t0_data_in_shm_area+0xbc
	.word	0xa193a149	! t0_data_in_shm_area+0xc0 (t1 bload)
	.word	0xb25e6fc0	! t0_data_in_shm_area+0xc4
	.word	0x6076e30d	! t0_data_in_shm_area+0xc8
	.word	0xcf592191	! t0_data_in_shm_area+0xcc
	.word	0x553e5d88	! t0_data_in_shm_area+0xd0
	.word	0x1996e3bf	! t0_data_in_shm_area+0xd4
	.word	0xfd54a2fd	! t0_data_in_shm_area+0xd8
	.word	0x4261f870	! t0_data_in_shm_area+0xdc
	.word	0xf158771d	! t0_data_in_shm_area+0xe0
	.word	0x7a4386e0	! t0_data_in_shm_area+0xe4
	.word	0x3682bc3e	! t0_data_in_shm_area+0xe8
	.word	0x0b40d5b7	! t0_data_in_shm_area+0xec
	.word	0xeb24d164	! t0_data_in_shm_area+0xf0
	.word	0x6c3bee1e	! t0_data_in_shm_area+0xf4
	.word	0x587589a8	! t0_data_in_shm_area+0xf8
	.word	0x1c511966	! t0_data_in_shm_area+0xfc
	.word	0x8a78acc8	! t0_data_in_shm_area+0x100 (t1 bstore)
	.word	0xf2d40172	! t0_data_in_shm_area+0x104
	.word	0x640429d8	! t0_data_in_shm_area+0x108
	.word	0x3d821c47	! t0_data_in_shm_area+0x10c
	.word	0x38c92078	! t0_data_in_shm_area+0x110
	.word	0x8ae08574	! t0_data_in_shm_area+0x114
	.word	0x353071fb	! t0_data_in_shm_area+0x118
	.word	0xe7140c2e	! t0_data_in_shm_area+0x11c
	.word	0x5829fb5a	! t0_data_in_shm_area+0x120
	.word	0xac481b48	! t0_data_in_shm_area+0x124
	.word	0x91fab9ec	! t0_data_in_shm_area+0x128
	.word	0x558fc881	! t0_data_in_shm_area+0x12c
	.word	0x35a5403f	! t0_data_in_shm_area+0x130
	.word	0x2ac9dab7	! t0_data_in_shm_area+0x134
	.word	0x1e9dd581	! t0_data_in_shm_area+0x138
	.word	0x1ac182fa	! t0_data_in_shm_area+0x13c
t0_data_in_shm_area_end:
t0_data_in_shm_area_stop:

KDATA_MODULE(t0_module_data_exp_regs, 0x18aac000)
.seg "data"
KGLOBAL(t0_data_exp_regs)
t0_data_exp_regs_start:
t0_data_exp_regs:
	.word	0xdaa299cd          ! %f0
	.word	0xf470bca3          ! %f1
	.word	0x4b8c67a3          ! %f2
	.word	0xfbb71fda          ! %f3
	.word	0xcb358428          ! %f4
	.word	0xd8b6b165          ! %f5
	.word	0xa8edd40a          ! %f6
	.word	0x0c1b4ea0          ! %f7
	.word	0xf4a929bc          ! %f8
	.word	0xce7cd4f5          ! %f9
	.word	0x6cd501fe          ! %f10
	.word	0xb3ed1afa          ! %f11
	.word	0x824c335a          ! %f12
	.word	0x126a79e8          ! %f13
	.word	0xf9f0d622          ! %f14
	.word	0x5814b247          ! %f15
	.word	0xc88839ab          ! %f16
	.word	0x990974fa          ! %f17
	.word	0xe612fce0          ! %f18
	.word	0x55cf2217          ! %f19
	.word	0xdd50a361          ! %f20
	.word	0x818d712f          ! %f21
	.word	0xb7d715c1          ! %f22
	.word	0xbd3942ed          ! %f23
	.word	0x38e4b2ae          ! %f24
	.word	0xdf79e23b          ! %f25
	.word	0x0640bfff          ! %f26
	.word	0xb7580b46          ! %f27
	.word	0xa1a075f9          ! %f28
	.word	0xd8ca3923          ! %f29
	.word	0x2e555c58          ! %f30
	.word	0x84248eda          ! %f31
	.word	0x691f8fcf          ! %f32
	.word	0xda563f23          ! %f33
	.word	0x4daf9824          ! %f34
	.word	0x48c22e21          ! %f35
	.word	0x2db00a17          ! %f36
	.word	0xeb66bad2          ! %f37
	.word	0xda5815a9          ! %f38
	.word	0x6369ba18          ! %f39
	.word	0xc842a889          ! %f40
	.word	0x820cc383          ! %f41
	.word	0x190fc5ae          ! %f42
	.word	0x81fc9044          ! %f43
	.word	0x5fe96e61          ! %f44
	.word	0xd61066ee          ! %f45
	.word	0xc0edc64d          ! %f46
	.word	0x65def2f7          ! %f47
	.word	0x4fcc4b4f          ! %f48
	.word	0xa6718510          ! %f49
	.word	0x46fbdb0d          ! %f50
	.word	0xb3e921d1          ! %f51
	.word	0x5e8723b0          ! %f52
	.word	0xefc0064f          ! %f53
	.word	0xe399d22f          ! %f54
	.word	0xce32f689          ! %f55
	.word	0xe563a803          ! %f56
	.word	0xce3ecfe0          ! %f57
	.word	0x47216b48          ! %f58
	.word	0xe77609ed          ! %f59
	.word	0xd614af95          ! %f60
	.word	0xf8171a6d          ! %f61
	.word	0xd8c9930f          ! %f62
	.word	0xf0fea527          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0x88c       ! %g1 (code pointer)
	.word	t0_data_exp_shm_area! %g2 (shared area pointer)
	.word	0xf7bc7ae4          ! %g3 (loop index)
	.word	SYM(t0_subr3)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0x9e4ce510          ! %o0
	.word	0xc4d144a2          ! %o1
	.word	0x447f924b          ! %o2
	.word	0xb5cbc879          ! %o3
	.word	0xb1de97dd          ! %o4
	.word	0x326074fe          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0xe5c00a7f          ! %l0
	.word	0x08180ef1          ! %l1
	.word	0x0b610878          ! %l2
	.word	0xe4e40341          ! %l3
	.word	0x8f7efed2          ! %l4
	.word	0x82d8cde6          ! %l5
	.word	0xec65bf01          ! %l6
	.word	0x32c4a6ea          ! %l7
	.word	t0_data_exp_area0   ! %i0 (area pointer)
	.word	t0_data_exp_area0   ! %i1 (area pointer)
	.word	0x00000010          ! %i2 (byte offset)
	.word	0xfffffff8          ! %i3 (halfword offset)
	.word	0x00000018          ! %i4 (word offset)
	.word	0xfffffff8          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0xf1ba1eeb          ! %y
	.word	0x00000002          ! %icc (nzvc)
	.word	0xc0000572          ! %fsr
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

KDATA_MODULE(t0_module_data_exp_stack, 0x3bc34000)
.seg "data"
KGLOBAL(t0_data_exp_mtbl_size)
KGLOBAL(t0_data_exp_mtbl)
KGLOBAL(t0_data_exp_stack)
t0_data_exp_stack_start:
	.word	0xd184736d
	.word	0x5d0c2323
	.word	0xce9a9986
	.word	0x91424696
	.word	0x1c7e3487
	.word	0xe09cd101
	.word	0x78514481
	.word	0xb09325aa
	.word	0x49a72279
	.word	0xab889b5e
	.word	0xd631bbf7
	.word	0x6dfc3bda
	.word	0x132e78bd
	.word	0x78b46662
	.word	0x1bf5aef7
	.word	0x487a381f
	.word	0x6d271763
	.word	0x95e74142
	.word	0xc91b2247
	.word	0x9513ebfb
	.word	0x083c2f25
	.word	0xd7c1a2c5
	.word	0xeb37cc98
	.word	0xb91f4599
	.word	0xeafc1ab9
	.word	0x4f4d6a03
	.word	0x79a981fb
	.word	0x5bd94832
	.word	0xcce6f966
	.word	0x0686a770
	.word	0x481d6293
	.word	0x43daa6b1
	.word	0xeb33deda
	.word	0xb0b97218
	.word	0xfecec08c
	.word	0x2168e499
	.word	0x1b18ac39
	.word	0x76914d2b
	.word	0xdff9f14b
	.word	0xbc3e2126
	.word	0x458de679
	.word	0x087ae1bc
	.word	0xa10e7de6
	.word	0xc85ff0b2
	.word	0x2e491dec
	.word	0x24c110c5
	.word	0xb6ef66d6
	.word	0x9c3fe85a
	.word	0x303dbb1e
	.word	0x3ddaa16e
	.word	0x8e476eeb
	.word	0x98e6bfe1
	.word	0x4e9d44e0
	.word	0xe8ee0f8e
	.word	0xdee2a17f
	.word	0xe5952dd3
	.word	0xc74d73a4
	.word	0xf8e53e71
	.word	0xaa5d87ee
	.word	0x2953e1ed
	.word	0xfc5ba60c
	.word	0x6fc313db
	.word	0x468dc245
	.word	0xd09e41bc
	.word	0xa25a8abc
	.word	0xca893f4d
	.word	0xca0ef738
	.word	0xb1e9cb83
	.word	0x53101377
	.word	0x2c1cb186
	.word	0x389a4f59
	.word	0x33864361
	.word	0xeba70569
	.word	0xe57b884c
	.word	0x447def87
	.word	0x7e710eb3
	.word	0x0cf8bac1
	.word	0x257f726b
	.word	0x75ed26a4
	.word	0x7e7861b7
	.word	0x10b8e983
	.word	0xd493cffe
	.word	0x0f39428a
	.word	0x06b12371
	.word	0x4896839b
	.word	0xe97712ec
	.word	0x518e403e
	.word	0x240cabd1
	.word	0x32020434
	.word	0xbf9323b5
	.word	0x87cdcb66
	.word	0x9509c015
	.word	0xd37abe4a
	.word	0x0df0ce6e
	.word	0xd7d640f8
	.word	0x474e716c
	.word	0xec4a007d
	.word	0x3b867c0a
	.word	0xa52aa934
	.word	0x48aec1db
	.word	0x46ac2228
	.word	0xa2e2bbda
	.word	0xd5cbdcd3
	.word	0x92fe3364
	.word	0xf3d4cdb2
	.word	0x58376156
	.word	0x8a624980
	.word	0xaf48a564
	.word	0xb23d1c23
	.word	0xa9d23a1d
	.word	0x88db0987
	.word	0x2ff1243c
	.word	0x3e7f55fa
	.word	0x985ca03a
	.word	0x5b9242cc
	.word	0x27fb8f34
	.word	0xeeed6d3d
	.word	0x2a0b6ca8
	.word	0xda5000fd
	.word	0xeab0389b
	.word	0x274c84d0
	.word	0xc67d0e18
	.word	0xc4fbff0b
	.word	0xc016e432
	.word	0xedf1190a
	.word	0xc09bc7f0
	.word	0x4d4013d5
	.word	0xbab8c7ca
	.word	0x0b1c9d85
	.word	0x24b65d97
	.word	0xdb983626
	.word	0x3fef722a
	.word	0x8836a435
	.word	0x9b61adef
	.word	0x30ca4be1
	.word	0x0800bc37
	.word	0x5b88e1bb
	.word	0x49da0322
	.word	0xddaf387b
	.word	0xaca6284e
	.word	0x5fc6a2fb
	.word	0xa6c31aa1
	.word	0x3bd9dea8
	.word	0x3da053f4
	.word	0x0a1d87eb
	.word	0x1a92296a
	.word	0xe1400958
	.word	0x99dd5fb1
	.word	0x5f1697ae
	.word	0x55dd6089
	.word	0x72d46fe4
	.word	0x72c37138
	.word	0x7b6c01e0
	.word	0xb180b5e0
	.word	0xad404984
	.word	0x449eb3cb
	.word	0x43692133
	.word	0xd53ff529
	.word	0x1ade2404
	.word	0x35447add
	.word	0xe6af933a
	.word	0xb58a5d3c
	.word	0xd1fef1b7
	.word	0x96f36af8
	.word	0x68957984
	.word	0xa8844d8d
	.word	0x899d82ab
	.word	0xcb92cce0
t0_data_exp_sp:
	.word	0x23fe37ed
	.word	0x91bfc7f9
	.word	0x9433dd1e
	.word	0xe1f16ef9
	.word	0xbdd04430
	.word	0xab54cac1
	.word	0xd3a9292f
	.word	0x95c6b8e5
	.word	t0_data_exp_area0
	.word	t0_data_exp_area0
	.word	0x0000000c
	.word	0xffffffe8
	.word	0x00000018
	.word	0x00000000
	.word	t0_data_exp_fp
	.word	0x2eb4b656
	.word	0xb7094d1b
	.word	0x900516b1
	.word	0x9b65dbcd
	.word	0xd0659756
	.word	0x7493457b
	.word	0xe14df868
	.word	0xf9e4d5ad
	.word	0x739b4ee2
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
	.word   	0xa2770ead	! [%fp - 0xc]
	.word   	0x5a9464ae	! [%fp - 0x8]
	.word   	0x6a9ce706	! [%fp - 0x4]
t0_data_exp_fp:
	.word	0xcb523841
	.word	0x55c1238f
	.word	0xcbd41ecc
	.word	0xfae495ff
	.word	0x1433e47c
	.word	0x65439b59
	.word	0x9645786a
	.word	0xb5731aae
	.word	0x5127ce21
	.word	0xe564cc11
	.word	0x643cb4ec
	.word	0xf7f988aa
	.word	0x05550544
	.word	0xe7112044
	.word	0xd611bf18
	.word	0xea2c7ddd
	.word	0x99c417c6
	.word	0x4b0813f2
	.word	0x6e1b14fb
	.word	0x95b96a9e
	.word	0xba00b9d9
	.word	0x41c78cc9
	.word	0xe1110e0d
	.word	0x32bfc6fe
t0_data_exp_stacktop:
	.word	0
t0_data_exp_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_exp_area0, 0x24e90000)
.seg "data"
t0_data_exp_area0_start:
.skip 128
t0_data_exp_area0_begin:
	.word	0xcb0ef2c2	! t0_data_exp_area0-0x20
	.word	0x74d80196	! t0_data_exp_area0-0x1c
	.word	0x0ddcdf93	! t0_data_exp_area0-0x18
	.word	0x6d17c961	! t0_data_exp_area0-0x14
	.word	0x9affd1e1	! t0_data_exp_area0-0x10
	.word	0xbb6f24f8	! t0_data_exp_area0-0xc
	.word	0x82290344	! t0_data_exp_area0-0x8
	.word	0x69357250	! t0_data_exp_area0-0x4
.global t0_data_exp_area0; t0_data_exp_area0:
	.word	0x31adefee	! t0_data_exp_area0+0x0
	.word	0x79860756	! t0_data_exp_area0+0x4
	.word	0xbe3ee42f	! t0_data_exp_area0+0x8
	.word	0xed10018e	! t0_data_exp_area0+0xc
	.word	0x74ea4085	! t0_data_exp_area0+0x10
	.word	0x68dae412	! t0_data_exp_area0+0x14
	.word	0xad17f5db	! t0_data_exp_area0+0x18
	.word	0x67632868	! t0_data_exp_area0+0x1c
t0_data_exp_area0_end:
.skip 8000
t0_data_exp_area0_stop:

KDATA_MODULE(t0_module_data_exp_shm_area, 0x1ed00000)
.seg "data"
t0_data_exp_shm_area_start:
t0_data_exp_shm_area_begin:
.global t0_data_exp_shm_area; t0_data_exp_shm_area:
	.word	0x0fe5f7e3	! t0_data_exp_shm_area+0x0 (t0)
	.word	0xe6dd1d30	! t0_data_exp_shm_area+0x4 (t1)
	.word	0x0e260dfe	! t0_data_exp_shm_area+0x8 (t0)
	.word	0xa6848220	! t0_data_exp_shm_area+0xc (t1)
	.word	0xab4699af	! t0_data_exp_shm_area+0x10 (t0)
	.word	0x807cb648	! t0_data_exp_shm_area+0x14 (t1)
	.word	0x4f208d51	! t0_data_exp_shm_area+0x18 (t0)
	.word	0x6143db18	! t0_data_exp_shm_area+0x1c (t1)
	.word	0xb72e88f1	! t0_data_exp_shm_area+0x20 (t0)
	.word	0x4a6fb59f	! t0_data_exp_shm_area+0x24 (t1)
	.word	0xb54caf0e	! t0_data_exp_shm_area+0x28 (t0)
	.word	0xeaa7f183	! t0_data_exp_shm_area+0x2c (t1)
	.word	0x52bd7694	! t0_data_exp_shm_area+0x30 (t0)
	.word	0xf41cb7c1	! t0_data_exp_shm_area+0x34 (t1)
	.word	0x033d74ad	! t0_data_exp_shm_area+0x38 (t0)
	.word	0xe74989dd	! t0_data_exp_shm_area+0x3c (t1)
	.word	0xb45cff82	! t0_data_exp_shm_area+0x40 (t0 bload)
	.word	0xa4d34f4f	! t0_data_exp_shm_area+0x44
	.word	0x48c226d8	! t0_data_exp_shm_area+0x48
	.word	0x8971a2ed	! t0_data_exp_shm_area+0x4c
	.word	0x5eea3ad9	! t0_data_exp_shm_area+0x50
	.word	0xa67d5718	! t0_data_exp_shm_area+0x54
	.word	0xd8c26055	! t0_data_exp_shm_area+0x58
	.word	0x3639cbdb	! t0_data_exp_shm_area+0x5c
	.word	0x4eadcc6d	! t0_data_exp_shm_area+0x60
	.word	0xd826007e	! t0_data_exp_shm_area+0x64
	.word	0xf890fad2	! t0_data_exp_shm_area+0x68
	.word	0xeac12336	! t0_data_exp_shm_area+0x6c
	.word	0x30a57eef	! t0_data_exp_shm_area+0x70
	.word	0x77b26c0c	! t0_data_exp_shm_area+0x74
	.word	0xcb0278a8	! t0_data_exp_shm_area+0x78
	.word	0x837ae281	! t0_data_exp_shm_area+0x7c
	.word	0x03ffc98b	! t0_data_exp_shm_area+0x80 (t0 bstore)
	.word	0x7ec3ccb3	! t0_data_exp_shm_area+0x84
	.word	0x1b36f5a8	! t0_data_exp_shm_area+0x88
	.word	0xb56dd817	! t0_data_exp_shm_area+0x8c
	.word	0x7443b36e	! t0_data_exp_shm_area+0x90
	.word	0x11cbdeff	! t0_data_exp_shm_area+0x94
	.word	0x0759a03c	! t0_data_exp_shm_area+0x98
	.word	0xadc15383	! t0_data_exp_shm_area+0x9c
	.word	0x1a14eb88	! t0_data_exp_shm_area+0xa0
	.word	0x21951f8c	! t0_data_exp_shm_area+0xa4
	.word	0xf37c20cb	! t0_data_exp_shm_area+0xa8
	.word	0xa03c030e	! t0_data_exp_shm_area+0xac
	.word	0xbebb1892	! t0_data_exp_shm_area+0xb0
	.word	0xf97374b7	! t0_data_exp_shm_area+0xb4
	.word	0x56b69362	! t0_data_exp_shm_area+0xb8
	.word	0x335a9698	! t0_data_exp_shm_area+0xbc
	.word	0xa193a149	! t0_data_exp_shm_area+0xc0 (t1 bload)
	.word	0xb25e6fc0	! t0_data_exp_shm_area+0xc4
	.word	0x6076e30d	! t0_data_exp_shm_area+0xc8
	.word	0xcf592191	! t0_data_exp_shm_area+0xcc
	.word	0x553e5d88	! t0_data_exp_shm_area+0xd0
	.word	0x1996e3bf	! t0_data_exp_shm_area+0xd4
	.word	0xfd54a2fd	! t0_data_exp_shm_area+0xd8
	.word	0x4261f870	! t0_data_exp_shm_area+0xdc
	.word	0xf158771d	! t0_data_exp_shm_area+0xe0
	.word	0x7a4386e0	! t0_data_exp_shm_area+0xe4
	.word	0x3682bc3e	! t0_data_exp_shm_area+0xe8
	.word	0x0b40d5b7	! t0_data_exp_shm_area+0xec
	.word	0xeb24d164	! t0_data_exp_shm_area+0xf0
	.word	0x6c3bee1e	! t0_data_exp_shm_area+0xf4
	.word	0x587589a8	! t0_data_exp_shm_area+0xf8
	.word	0x1c511966	! t0_data_exp_shm_area+0xfc
	.word	0x8a78acc8	! t0_data_exp_shm_area+0x100 (t1 bstore)
	.word	0xf2d40172	! t0_data_exp_shm_area+0x104
	.word	0x640429d8	! t0_data_exp_shm_area+0x108
	.word	0x3d821c47	! t0_data_exp_shm_area+0x10c
	.word	0x38c92078	! t0_data_exp_shm_area+0x110
	.word	0x8ae08574	! t0_data_exp_shm_area+0x114
	.word	0x353071fb	! t0_data_exp_shm_area+0x118
	.word	0xe7140c2e	! t0_data_exp_shm_area+0x11c
	.word	0x5829fb5a	! t0_data_exp_shm_area+0x120
	.word	0xac481b48	! t0_data_exp_shm_area+0x124
	.word	0x91fab9ec	! t0_data_exp_shm_area+0x128
	.word	0x558fc881	! t0_data_exp_shm_area+0x12c
	.word	0x35a5403f	! t0_data_exp_shm_area+0x130
	.word	0x2ac9dab7	! t0_data_exp_shm_area+0x134
	.word	0x1e9dd581	! t0_data_exp_shm_area+0x138
	.word	0x1ac182fa	! t0_data_exp_shm_area+0x13c
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
#define T0_KAOS_SEED          000000000098
#define T0_KAOS_ICOUNT        405
#define T0_KAOS_AREAS         1
#define T0_KAOS_AREASIZE      64
#define T0_KAOS_AREAOFFSET    128
#define T0_KAOS_PAGESIZE      8192
#define T0_KAOS_CODECOUNT     410

#define T0_KAOS_BOOT_VA                  0x3b062000
#define T0_KAOS_BOOT_PA                  0x0000000013028000
#define T0_KAOS_BOOT_CACHEABLE           1
#define T0_KAOS_BOOT_NONCACHEABLE        0

#define T0_KAOS_STARTUP_VA               0x372da000
#define T0_KAOS_STARTUP_PA               0x00000000193ca000
#define T0_KAOS_STARTUP_CACHEABLE        1
#define T0_KAOS_STARTUP_NONCACHEABLE     0

#define T0_KAOS_OFFSET_TBL_VA            0x18206000
#define T0_KAOS_OFFSET_TBL_PA            0x0000000016a4e000
#define T0_KAOS_OFFSET_TBL_CACHEABLE     1
#define T0_KAOS_OFFSET_TBL_NONCACHEABLE  0

#define T0_KAOS_DONE_VA                  0x18b64000
#define T0_KAOS_DONE_PA                  0x000000000c0f4000
#define T0_KAOS_DONE_CACHEABLE           1
#define T0_KAOS_DONE_NONCACHEABLE        0

#define T0_KAOS_KTBL_VA                  0x28d8e000
#define T0_KAOS_KTBL_PA                  0x000000001b9e8000
#define T0_KAOS_KTBL_CACHEABLE           1
#define T0_KAOS_KTBL_NONCACHEABLE        0

#define T0_KAOS_SUBR0_VA                 0x28dbe000
#define T0_KAOS_SUBR0_PA                 0x0000000002b42000
#define T0_KAOS_SUBR0_CACHEABLE          1
#define T0_KAOS_SUBR0_NONCACHEABLE       0
#define T0_KAOS_SUBR1_VA                 0x28e1e000
#define T0_KAOS_SUBR1_PA                 0x000000002f276000
#define T0_KAOS_SUBR1_CACHEABLE          1
#define T0_KAOS_SUBR1_NONCACHEABLE       0
#define T0_KAOS_SUBR2_VA                 0x255c6000
#define T0_KAOS_SUBR2_PA                 0x0000000018a86000
#define T0_KAOS_SUBR2_CACHEABLE          1
#define T0_KAOS_SUBR2_NONCACHEABLE       0
#define T0_KAOS_SUBR3_VA                 0x29206000
#define T0_KAOS_SUBR3_PA                 0x0000000028530000
#define T0_KAOS_SUBR3_CACHEABLE          1
#define T0_KAOS_SUBR3_NONCACHEABLE       0

#define T0_KAOS_EXP_REGS_VA              0x18aac000
#define T0_KAOS_EXP_REGS_PA              0x0000000037ec2000
#define T0_KAOS_EXP_REGS_CACHEABLE       1
#define T0_KAOS_EXP_REGS_NONCACHEABLE    0
#define T0_KAOS_RUN_REGS_VA              0x1e306000
#define T0_KAOS_RUN_REGS_PA              0x0000000020038000
#define T0_KAOS_RUN_REGS_CACHEABLE       1
#define T0_KAOS_RUN_REGS_NONCACHEABLE    0

#define T0_KAOS_EXP_STACK_VA             0x3bc34000
#define T0_KAOS_EXP_STACK_PA             0x000000000b110000
#define T0_KAOS_EXP_STACK_CACHEABLE      1
#define T0_KAOS_EXP_STACK_NONCACHEABLE   0
#define T0_KAOS_RUN_STACK_VA             0x07e78000
#define T0_KAOS_RUN_STACK_PA             0x0000000018fac000
#define T0_KAOS_RUN_STACK_CACHEABLE      1
#define T0_KAOS_RUN_STACK_NONCACHEABLE   0

#define T0_KAOS_AREA0
#define T0_KAOS_EXP_AREA0_VA             0x24e90000
#define T0_KAOS_EXP_AREA0_PA             0x0000000008154000
#define T0_KAOS_EXP_AREA0_CACHEABLE      1
#define T0_KAOS_EXP_AREA0_NONCACHEABLE   0
#define T0_KAOS_RUN_AREA0_VA             0x0cb04000
#define T0_KAOS_RUN_AREA0_PA             0x00000000134ca000
#define T0_KAOS_RUN_AREA0_CACHEABLE      1
#define T0_KAOS_RUN_AREA0_NONCACHEABLE   0

#define T0_KAOS_SHM_AREA
#define T0_KAOS_EXP_SHM_AREA_VA          0x1ed00000
#define T0_KAOS_EXP_SHM_AREA_PA          0x000000003d322000
#define T0_KAOS_EXP_SHM_AREA_CACHEABLE   1
#define T0_KAOS_EXP_SHM_AREA_NONCACHEABLE 0
#define T0_KAOS_RUN_SHM_AREA_VA          0x07be0000
#define T0_KAOS_RUN_SHM_AREA_PA          0x000000001017a000
#define T0_KAOS_RUN_SHM_AREA_CACHEABLE   1
#define T0_KAOS_RUN_SHM_AREA_NONCACHEABLE 0

#define T0_KAOS_RANVAL_00     0xab7fa552
#define T0_KAOS_RANVAL_01     0x96693f97
#define T0_KAOS_RANVAL_02     0x5c1af790
#define T0_KAOS_RANVAL_03     0x9cad3bab
#define T0_KAOS_RANVAL_04     0x75658d1d
#define T0_KAOS_RANVAL_05     0x87d8082e
#define T0_KAOS_RANVAL_06     0x20953a90
#define T0_KAOS_RANVAL_07     0xd38846cd
#define T0_KAOS_RANVAL_08     0x3bf2ec9d
#define T0_KAOS_RANVAL_09     0x301338db
#define T0_KAOS_RANVAL_0a     0x6cbf3fad
#define T0_KAOS_RANVAL_0b     0xa4059e15
#define T0_KAOS_RANVAL_0c     0x9efc5ad4
#define T0_KAOS_RANVAL_0d     0xa59e9d13
#define T0_KAOS_RANVAL_0e     0xa8428ae2
#define T0_KAOS_RANVAL_0f     0x9619b900
#define T0_KAOS_RANVAL_10     0xafde4e60
#define T0_KAOS_RANVAL_11     0x4c499750
#define T0_KAOS_RANVAL_12     0xd1d771c0
#define T0_KAOS_RANVAL_13     0x95584984
#define T0_KAOS_RANVAL_14     0x46911300
#define T0_KAOS_RANVAL_15     0xcaf34248
#define T0_KAOS_RANVAL_16     0x0d8bf694
#define T0_KAOS_RANVAL_17     0x6b31e265
#define T0_KAOS_RANVAL_18     0x9ec81356
#define T0_KAOS_RANVAL_19     0x06d2f162
#define T0_KAOS_RANVAL_1a     0xc8fab1c8
#define T0_KAOS_RANVAL_1b     0x60352ec8
#define T0_KAOS_RANVAL_1c     0x2d157aee
#define T0_KAOS_RANVAL_1d     0xbae3c465
#define T0_KAOS_RANVAL_1e     0x1cbc6d89
#define T0_KAOS_RANVAL_1f     0x7e738f05
#define T0_KAOS_RANVAL_20     0xb417747f
#define T0_KAOS_RANVAL_21     0x80c94272
#define T0_KAOS_RANVAL_22     0x69e557aa
#define T0_KAOS_RANVAL_23     0xd0d22ec1
#define T0_KAOS_RANVAL_24     0xc644886f
#define T0_KAOS_RANVAL_25     0x4b6e3034
#define T0_KAOS_RANVAL_26     0xd408edc7
#define T0_KAOS_RANVAL_27     0xc60de83a
#define T0_KAOS_RANVAL_28     0xd640df9c
#define T0_KAOS_RANVAL_29     0x79fe1555
#define T0_KAOS_RANVAL_2a     0x224e07ad
#define T0_KAOS_RANVAL_2b     0x53c988e4
#define T0_KAOS_RANVAL_2c     0x85fe6e59
#define T0_KAOS_RANVAL_2d     0x8eed2533
#define T0_KAOS_RANVAL_2e     0x66cea3f9
#define T0_KAOS_RANVAL_2f     0x2b634b35
#define T0_KAOS_RANVAL_30     0x18864bb6
#define T0_KAOS_RANVAL_31     0xf1c97ed3
#define T0_KAOS_RANVAL_32     0x11155afe
#define T0_KAOS_RANVAL_33     0xf0c799bd
#define T0_KAOS_RANVAL_34     0x5369b904
#define T0_KAOS_RANVAL_35     0xdecbf815
#define T0_KAOS_RANVAL_36     0x71449beb
#define T0_KAOS_RANVAL_37     0xe8446f78
#define T0_KAOS_RANVAL_38     0x0fbd9d97
#define T0_KAOS_RANVAL_39     0x23cde829
#define T0_KAOS_RANVAL_3a     0x3b92182d
#define T0_KAOS_RANVAL_3b     0x8cc1e967
#define T0_KAOS_RANVAL_3c     0x8f6b7acd
#define T0_KAOS_RANVAL_3d     0x9aaca541
#define T0_KAOS_RANVAL_3e     0x01830112
#define T0_KAOS_RANVAL_3f     0x58f9dd5c
#define T0_KAOS_RANVAL_40     0xfecf1c4f
#define T0_KAOS_RANVAL_41     0x7c7aa988
#define T0_KAOS_RANVAL_42     0x6dfbfbae
#define T0_KAOS_RANVAL_43     0x3d918a16
#define T0_KAOS_RANVAL_44     0x7c488896
#define T0_KAOS_RANVAL_45     0xea699351
#define T0_KAOS_RANVAL_46     0x1501ef02
#define T0_KAOS_RANVAL_47     0x9095b48d
#define T0_KAOS_RANVAL_48     0x73ddf5b1
#define T0_KAOS_RANVAL_49     0x10577493
#define T0_KAOS_RANVAL_4a     0xf6371059
#define T0_KAOS_RANVAL_4b     0x1a0ac68d
#define T0_KAOS_RANVAL_4c     0xfc81c644
#define T0_KAOS_RANVAL_4d     0x749d2595
#define T0_KAOS_RANVAL_4e     0x2bf1d1f5
#define T0_KAOS_RANVAL_4f     0x7247c289
#define T0_KAOS_RANVAL_50     0x5b4cd2d3
#define T0_KAOS_RANVAL_51     0xb8628ee5
#define T0_KAOS_RANVAL_52     0x4e8197eb
#define T0_KAOS_RANVAL_53     0x7aec20a8
#define T0_KAOS_RANVAL_54     0x8f3d8340
#define T0_KAOS_RANVAL_55     0xc6991e8e
#define T0_KAOS_RANVAL_56     0x9e0f574b
#define T0_KAOS_RANVAL_57     0xefade924
#define T0_KAOS_RANVAL_58     0x42107c92
#define T0_KAOS_RANVAL_59     0x350bdc89
#define T0_KAOS_RANVAL_5a     0x3bc68383
#define T0_KAOS_RANVAL_5b     0x123e9fd4
#define T0_KAOS_RANVAL_5c     0x28cfe6f7
#define T0_KAOS_RANVAL_5d     0x1df7d273
#define T0_KAOS_RANVAL_5e     0x6ed4ee04
#define T0_KAOS_RANVAL_5f     0x515ad506
#define T0_KAOS_RANVAL_60     0x7d02900b
#define T0_KAOS_RANVAL_61     0xa096ba80
#define T0_KAOS_RANVAL_62     0xd9967c25
#define T0_KAOS_RANVAL_63     0x98016f92
#define T0_KAOS_RANVAL_64     0x06346d5a
#define T0_KAOS_RANVAL_65     0x5f3129af
#define T0_KAOS_RANVAL_66     0x792bd748
#define T0_KAOS_RANVAL_67     0x1c0d042b
#define T0_KAOS_RANVAL_68     0x2f264323
#define T0_KAOS_RANVAL_69     0x08eca93f
#define T0_KAOS_RANVAL_6a     0x8c097b3b
#define T0_KAOS_RANVAL_6b     0x0c3acdf8
#define T0_KAOS_RANVAL_6c     0xe28a735f
#define T0_KAOS_RANVAL_6d     0x47dd7360
#define T0_KAOS_RANVAL_6e     0xecfec6df
#define T0_KAOS_RANVAL_6f     0x3a501c62
#define T0_KAOS_RANVAL_70     0xb5113901
#define T0_KAOS_RANVAL_71     0x402ac72e
#define T0_KAOS_RANVAL_72     0xd60af30e
#define T0_KAOS_RANVAL_73     0xb7c84a2f
#define T0_KAOS_RANVAL_74     0x05e6d37e
#define T0_KAOS_RANVAL_75     0x569007da
#define T0_KAOS_RANVAL_76     0x435013ba
#define T0_KAOS_RANVAL_77     0x8f8291cf
#define T0_KAOS_RANVAL_78     0xcfea668e
#define T0_KAOS_RANVAL_79     0xd2741b2a
#define T0_KAOS_RANVAL_7a     0xa0d28751
#define T0_KAOS_RANVAL_7b     0x268852f6
#define T0_KAOS_RANVAL_7c     0x7d0c9234
#define T0_KAOS_RANVAL_7d     0x7573bb23
#define T0_KAOS_RANVAL_7e     0xffb57868
#define T0_KAOS_RANVAL_7f     0xfe799d6a
/* end ktbl.0.h */
/* start ktbl.1.h */
#define T1_KAOS_NIAGARA
#define T1_KAOS_VERSION       4.2
#define T1_KAOS_SEED          000000000099
#define T1_KAOS_ICOUNT        405
#define T1_KAOS_AREAS         1
#define T1_KAOS_AREASIZE      64
#define T1_KAOS_AREAOFFSET    128
#define T1_KAOS_PAGESIZE      8192
#define T1_KAOS_CODECOUNT     414

#define T1_KAOS_BOOT_VA                  0x516c8000
#define T1_KAOS_BOOT_PA                  0x00000000782ac000
#define T1_KAOS_BOOT_CACHEABLE           1
#define T1_KAOS_BOOT_NONCACHEABLE        0

#define T1_KAOS_STARTUP_VA               0x65116000
#define T1_KAOS_STARTUP_PA               0x000000004b936000
#define T1_KAOS_STARTUP_CACHEABLE        1
#define T1_KAOS_STARTUP_NONCACHEABLE     0

#define T1_KAOS_OFFSET_TBL_VA            0x64cca000
#define T1_KAOS_OFFSET_TBL_PA            0x0000000052baa000
#define T1_KAOS_OFFSET_TBL_CACHEABLE     1
#define T1_KAOS_OFFSET_TBL_NONCACHEABLE  0

#define T1_KAOS_DONE_VA                  0x72496000
#define T1_KAOS_DONE_PA                  0x0000000051cda000
#define T1_KAOS_DONE_CACHEABLE           1
#define T1_KAOS_DONE_NONCACHEABLE        0

#define T1_KAOS_KTBL_VA                  0x6bfbe000
#define T1_KAOS_KTBL_PA                  0x000000007ea86000
#define T1_KAOS_KTBL_CACHEABLE           1
#define T1_KAOS_KTBL_NONCACHEABLE        0

#define T1_KAOS_SUBR0_VA                 0x6bf98000
#define T1_KAOS_SUBR0_PA                 0x000000007aa5e000
#define T1_KAOS_SUBR0_CACHEABLE          1
#define T1_KAOS_SUBR0_NONCACHEABLE       0
#define T1_KAOS_SUBR1_VA                 0x6b8d4000
#define T1_KAOS_SUBR1_PA                 0x0000000041ad8000
#define T1_KAOS_SUBR1_CACHEABLE          1
#define T1_KAOS_SUBR1_NONCACHEABLE       0
#define T1_KAOS_SUBR2_VA                 0x4770a000
#define T1_KAOS_SUBR2_PA                 0x000000004727e000
#define T1_KAOS_SUBR2_CACHEABLE          1
#define T1_KAOS_SUBR2_NONCACHEABLE       0
#define T1_KAOS_SUBR3_VA                 0x6c09e000
#define T1_KAOS_SUBR3_PA                 0x000000005b162000
#define T1_KAOS_SUBR3_CACHEABLE          1
#define T1_KAOS_SUBR3_NONCACHEABLE       0

#define T1_KAOS_EXP_REGS_VA              0x6f78c000
#define T1_KAOS_EXP_REGS_PA              0x000000006f14a000
#define T1_KAOS_EXP_REGS_CACHEABLE       1
#define T1_KAOS_EXP_REGS_NONCACHEABLE    0
#define T1_KAOS_RUN_REGS_VA              0x7eb12000
#define T1_KAOS_RUN_REGS_PA              0x000000005a482000
#define T1_KAOS_RUN_REGS_CACHEABLE       1
#define T1_KAOS_RUN_REGS_NONCACHEABLE    0

#define T1_KAOS_EXP_STACK_VA             0x44cb2000
#define T1_KAOS_EXP_STACK_PA             0x0000000070de0000
#define T1_KAOS_EXP_STACK_CACHEABLE      1
#define T1_KAOS_EXP_STACK_NONCACHEABLE   0
#define T1_KAOS_RUN_STACK_VA             0x7ff7c000
#define T1_KAOS_RUN_STACK_PA             0x00000000476cc000
#define T1_KAOS_RUN_STACK_CACHEABLE      1
#define T1_KAOS_RUN_STACK_NONCACHEABLE   0

#define T1_KAOS_AREA0
#define T1_KAOS_EXP_AREA0_VA             0x710e2000
#define T1_KAOS_EXP_AREA0_PA             0x0000000067eaa000
#define T1_KAOS_EXP_AREA0_CACHEABLE      1
#define T1_KAOS_EXP_AREA0_NONCACHEABLE   0
#define T1_KAOS_RUN_AREA0_VA             0x687a6000
#define T1_KAOS_RUN_AREA0_PA             0x000000005a202000
#define T1_KAOS_RUN_AREA0_CACHEABLE      1
#define T1_KAOS_RUN_AREA0_NONCACHEABLE   0

#define T1_KAOS_SHM_AREA
#define T1_KAOS_EXP_SHM_AREA_VA          0x4a876000
#define T1_KAOS_EXP_SHM_AREA_PA          0x000000007270a000
#define T1_KAOS_EXP_SHM_AREA_CACHEABLE   1
#define T1_KAOS_EXP_SHM_AREA_NONCACHEABLE 0
#define T1_KAOS_RUN_SHM_AREA_VA          0x54da4000
#define T1_KAOS_RUN_SHM_AREA_PA          0x0000000051132000
#define T1_KAOS_RUN_SHM_AREA_CACHEABLE   1
#define T1_KAOS_RUN_SHM_AREA_NONCACHEABLE 0

#define T1_KAOS_RANVAL_00     0x1d11b158
#define T1_KAOS_RANVAL_01     0x9090ea9c
#define T1_KAOS_RANVAL_02     0xbd80cf22
#define T1_KAOS_RANVAL_03     0x7db628ab
#define T1_KAOS_RANVAL_04     0x2c021ee9
#define T1_KAOS_RANVAL_05     0x94bebb81
#define T1_KAOS_RANVAL_06     0x7ff1379a
#define T1_KAOS_RANVAL_07     0xcd37d742
#define T1_KAOS_RANVAL_08     0x54ce6d3c
#define T1_KAOS_RANVAL_09     0x968bc888
#define T1_KAOS_RANVAL_0a     0x0a921f31
#define T1_KAOS_RANVAL_0b     0xcd45e28e
#define T1_KAOS_RANVAL_0c     0x5d5285d7
#define T1_KAOS_RANVAL_0d     0x1539028f
#define T1_KAOS_RANVAL_0e     0x8a990bfa
#define T1_KAOS_RANVAL_0f     0xd4c92e41
#define T1_KAOS_RANVAL_10     0x460ea7f0
#define T1_KAOS_RANVAL_11     0x640a498f
#define T1_KAOS_RANVAL_12     0x00b38168
#define T1_KAOS_RANVAL_13     0x3d8ddff7
#define T1_KAOS_RANVAL_14     0xe117cc20
#define T1_KAOS_RANVAL_15     0xea249844
#define T1_KAOS_RANVAL_16     0x8104ed27
#define T1_KAOS_RANVAL_17     0xf197ad77
#define T1_KAOS_RANVAL_18     0xdbfe0f57
#define T1_KAOS_RANVAL_19     0x8eb0c613
#define T1_KAOS_RANVAL_1a     0xee560d29
#define T1_KAOS_RANVAL_1b     0x26764b37
#define T1_KAOS_RANVAL_1c     0xb7ba5910
#define T1_KAOS_RANVAL_1d     0x1c4e0327
#define T1_KAOS_RANVAL_1e     0xd68c22fe
#define T1_KAOS_RANVAL_1f     0x7d93bf25
#define T1_KAOS_RANVAL_20     0x2d13b0c5
#define T1_KAOS_RANVAL_21     0x69ed72dc
#define T1_KAOS_RANVAL_22     0x310f8868
#define T1_KAOS_RANVAL_23     0x8fce9ba4
#define T1_KAOS_RANVAL_24     0x0dfff6a4
#define T1_KAOS_RANVAL_25     0x94e28860
#define T1_KAOS_RANVAL_26     0x6a2e792e
#define T1_KAOS_RANVAL_27     0x6f4e66d4
#define T1_KAOS_RANVAL_28     0x8c8af381
#define T1_KAOS_RANVAL_29     0x168a0997
#define T1_KAOS_RANVAL_2a     0x0a022630
#define T1_KAOS_RANVAL_2b     0x74a0b216
#define T1_KAOS_RANVAL_2c     0xd909f40e
#define T1_KAOS_RANVAL_2d     0xa9a3dc3f
#define T1_KAOS_RANVAL_2e     0x5f2965bb
#define T1_KAOS_RANVAL_2f     0x1011a5ce
#define T1_KAOS_RANVAL_30     0xa311634a
#define T1_KAOS_RANVAL_31     0xd69a0154
#define T1_KAOS_RANVAL_32     0x770d951e
#define T1_KAOS_RANVAL_33     0xae1b056b
#define T1_KAOS_RANVAL_34     0x46051837
#define T1_KAOS_RANVAL_35     0x4cb162b6
#define T1_KAOS_RANVAL_36     0xbb9b7f7d
#define T1_KAOS_RANVAL_37     0xa1f0efa3
#define T1_KAOS_RANVAL_38     0x52734acf
#define T1_KAOS_RANVAL_39     0x7ec75708
#define T1_KAOS_RANVAL_3a     0x42a35de4
#define T1_KAOS_RANVAL_3b     0x9be3df03
#define T1_KAOS_RANVAL_3c     0xf3f56438
#define T1_KAOS_RANVAL_3d     0x0708ffda
#define T1_KAOS_RANVAL_3e     0x02b0449e
#define T1_KAOS_RANVAL_3f     0x56c3aea6
#define T1_KAOS_RANVAL_40     0x17511e36
#define T1_KAOS_RANVAL_41     0x3c3fe609
#define T1_KAOS_RANVAL_42     0x1d5891c7
#define T1_KAOS_RANVAL_43     0xc7e7a744
#define T1_KAOS_RANVAL_44     0x9147a5e0
#define T1_KAOS_RANVAL_45     0xe7217865
#define T1_KAOS_RANVAL_46     0x750e3120
#define T1_KAOS_RANVAL_47     0x653bd86e
#define T1_KAOS_RANVAL_48     0x3327b596
#define T1_KAOS_RANVAL_49     0xccc55095
#define T1_KAOS_RANVAL_4a     0x1d8ec922
#define T1_KAOS_RANVAL_4b     0xb3f44217
#define T1_KAOS_RANVAL_4c     0x4212da32
#define T1_KAOS_RANVAL_4d     0x97406237
#define T1_KAOS_RANVAL_4e     0x7f812555
#define T1_KAOS_RANVAL_4f     0xbd8a9256
#define T1_KAOS_RANVAL_50     0x2835577c
#define T1_KAOS_RANVAL_51     0xb4a1784b
#define T1_KAOS_RANVAL_52     0x72ce71e1
#define T1_KAOS_RANVAL_53     0xb7b37b69
#define T1_KAOS_RANVAL_54     0x27335fe3
#define T1_KAOS_RANVAL_55     0xe16da4d1
#define T1_KAOS_RANVAL_56     0x251b1c65
#define T1_KAOS_RANVAL_57     0xdb44e5fc
#define T1_KAOS_RANVAL_58     0xf805936a
#define T1_KAOS_RANVAL_59     0xf48186af
#define T1_KAOS_RANVAL_5a     0x73ac6e07
#define T1_KAOS_RANVAL_5b     0x55d683ab
#define T1_KAOS_RANVAL_5c     0x79a9f9e0
#define T1_KAOS_RANVAL_5d     0x012689d8
#define T1_KAOS_RANVAL_5e     0xdf4532cb
#define T1_KAOS_RANVAL_5f     0x767a85c5
#define T1_KAOS_RANVAL_60     0x24adec53
#define T1_KAOS_RANVAL_61     0x3f7985ab
#define T1_KAOS_RANVAL_62     0x6e550228
#define T1_KAOS_RANVAL_63     0xb7847c53
#define T1_KAOS_RANVAL_64     0xf0e8a1c6
#define T1_KAOS_RANVAL_65     0x45325d98
#define T1_KAOS_RANVAL_66     0x837afcd8
#define T1_KAOS_RANVAL_67     0x6230a158
#define T1_KAOS_RANVAL_68     0xac055321
#define T1_KAOS_RANVAL_69     0xb7b28809
#define T1_KAOS_RANVAL_6a     0xcd1613ef
#define T1_KAOS_RANVAL_6b     0x0d5e1459
#define T1_KAOS_RANVAL_6c     0x95f72a68
#define T1_KAOS_RANVAL_6d     0xae3a9f7e
#define T1_KAOS_RANVAL_6e     0x3baa2d2f
#define T1_KAOS_RANVAL_6f     0xbab2ca1f
#define T1_KAOS_RANVAL_70     0x13607130
#define T1_KAOS_RANVAL_71     0xc68561fa
#define T1_KAOS_RANVAL_72     0x3182b89a
#define T1_KAOS_RANVAL_73     0x6da834bb
#define T1_KAOS_RANVAL_74     0xb899b24d
#define T1_KAOS_RANVAL_75     0x6908c29d
#define T1_KAOS_RANVAL_76     0x83708b47
#define T1_KAOS_RANVAL_77     0xa26be7c9
#define T1_KAOS_RANVAL_78     0x219cc2d0
#define T1_KAOS_RANVAL_79     0xbb03f192
#define T1_KAOS_RANVAL_7a     0x220a1379
#define T1_KAOS_RANVAL_7b     0x676fbcf9
#define T1_KAOS_RANVAL_7c     0x76e2e630
#define T1_KAOS_RANVAL_7d     0x3d8b7e2a
#define T1_KAOS_RANVAL_7e     0x69b239ed
#define T1_KAOS_RANVAL_7f     0x30393ccb
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
#define NOHWTW
#include "enable_file.h"
#define SKIP_TRAPCHECK	
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
!    icount         405
!    targetid       NIAGARA:SIM
!    hostid         NIAGARA:5.8
!    areas          1
!    areasize       64
!    areaoffset     128
!    ncache         0
!    emulate_ncache 1
!    pagesize       8192
!    invsize        0
!    codecount      410
!    code           28d8e000
!    entry          28d8e000
!    fsr_exceptions 00000000
!    fsr_roundmode  00000004
!    fsr_mask       c0000fff
!    seed           000000000098
!    va_map         0000000000400000,000000003fffffff
!    pa_cached      0000000000400000,000000003fffffff
!    pa_noncached   000001ff00000000,000001ff7fffffff
!    weights        /import/n2-aus-localdir1/ntran/n2cdmspp/verif/diag/assembly/kaos/weights_files/simv9.w
!    begcount       0
!    endcount       405
!    dwords         8
!    ldblocks       0
!    stblocks       0
!    ldfsr_words    0
!    annul          2
!    predict        2
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

KTEXT_MODULE(t0_module_ktbl, 0x28d8e000)
.seg "text"
	KGLOBAL(t0_ktbl)
t0_ktbl_page_begin:
.global t0_kref; t0_kref:
	.skip 0
t0_ktbl:
	.word	0x0b800005	! t0_kref+0x0:   	fbug	_kref+0x14
	.word	0xd0167fe6	! t0_kref+0x4:   	lduh	[%i1 - 0x1a], %o0
	.word	0xd51fbf98	! t0_kref+0x8:   	ldd	[%fp - 0x68], %f10
	.word	0x95a01a42	! t0_kref+0xc:   	fdtoi	%f2, %f10
	.word	0xd04e3ffe	! t0_kref+0x10:   	ldsb	[%i0 - 2], %o0
	.word	0xed68a04f	! t0_kref+0x14:   	prefetch	%g2 + 0x4f, 22
	.word	0x8fa1c82b	! t0_kref+0x18:   	fadds	%f7, %f11, %f7
	.word	0xe868a030	! t0_kref+0x1c:   	ldstub	[%g2 + 0x30], %l4
	.word	0x908f3fcb	! t0_kref+0x20:   	andcc	%i4, -0x35, %o0
	.word	0x99a00121	! t0_kref+0x24:   	fabss	%f1, %f12
	.word	0xd83e6000	! t0_kref+0x28:   	std	%o4, [%i1]
	.word	0x93d02010	! t0_kref+0x2c:   	tne	%icc, %g0 + 0x10
	.word	0x81d9746e	! t0_kref+0x30:   	flush	%g5 - 0xb92
	.word	0x00400006	! t0_kref+0x34:   	bn,pn	%icc, _kref+0x4c
	.word	0xc398a040	! t0_kref+0x38:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0x8da01a2b	! t0_kref+0x3c:   	fstoi	%f11, %f6
	.word	0x91d02070	! t0_kref+0x40:   	ta	%icc, %g0 + 0x70
	.word	0x903b000c	! t0_kref+0x44:   	xnor	%o4, %o4, %o0
	.word	0x913b2013	! t0_kref+0x48:   	sra	%o4, 0x13, %o0
	.word	0x8da01906	! t0_kref+0x4c:   	fitod	%f6, %f6
	.word	0xd010a028	! t0_kref+0x50:   	lduh	[%g2 + 0x28], %o0
	.word	0x81a1884a	! t0_kref+0x54:   	faddd	%f6, %f10, %f0
	.word	0x99a0192c	! t0_kref+0x58:   	fstod	%f12, %f12
	.word	0x81870000	! t0_kref+0x5c:   	wr	%i4, %g0, %y
	.word	0x37400003	! t0_kref+0x60:   	fbge,a,pn	%fcc0, _kref+0x6c
	.word	0x93a01a44	! t0_kref+0x64:   	fdtoi	%f4, %f9
	.word	0xd22e4000	! t0_kref+0x68:   	stb	%o1, [%i1]
	.word	0x93a049ab	! t0_kref+0x6c:   	fdivs	%f1, %f11, %f9
	.word	0x90502b61	! t0_kref+0x70:   	umul	%g0, 0xb61, %o0
	.word	0x09400002	! t0_kref+0x74:   	fbl,pn	%fcc0, _kref+0x7c
	.word	0x912a600f	! t0_kref+0x78:   	sll	%o1, 0xf, %o0
	.word	0x85a01921	! t0_kref+0x7c:   	fstod	%f1, %f2
	.word	0x91400000	! t0_kref+0x80:   	mov	%y, %o0
	.word	0xe168a04b	! t0_kref+0x84:   	prefetch	%g2 + 0x4b, 16
	.word	0x90de800c	! t0_kref+0x88:   	smulcc	%i2, %o4, %o0
	.word	0xd048a01a	! t0_kref+0x8c:   	ldsb	[%g2 + 0x1a], %o0
	.word	0x89a0482c	! t0_kref+0x90:   	fadds	%f1, %f12, %f4
	.word	0x1f800004	! t0_kref+0x94:   	fbo	_kref+0xa4
	.word	0x85a01923	! t0_kref+0x98:   	fstod	%f3, %f2
	.word	0xd2f01018	! t0_kref+0x9c:   	stxa	%o1, [%g0 + %i0]0x80
	.word	0x81db659d	! t0_kref+0xa0:   	flush	%o5 + 0x59d
	.word	0xd4380019	! t0_kref+0xa4:   	std	%o2, [%g0 + %i1]
	.word	0x81ab0a22	! t0_kref+0xa8:   	fcmps	%fcc0, %f12, %f2
	.word	0xef68a00e	! t0_kref+0xac:   	prefetch	%g2 + 0xe, 23
	.word	0x9161e38c	! t0_kref+0xb0:   	movu	%fcc0, 0x38c, %o0
	.word	0x87802080	! t0_kref+0xb4:   	mov	0x80, %asi
	.word	0x81aacaad	! t0_kref+0xb8:   	fcmpes	%fcc0, %f11, %f13
	.word	0x902ebd57	! t0_kref+0xbc:   	andn	%i2, -0x2a9, %o0
	.word	0x20480004	! t0_kref+0xc0:   	bn,a,pt	%icc, _kref+0xd0
	.word	0xc0ff1019	! t0_kref+0xc4:   	swapa	[%i4 + %i1]0x80, %g0
	.word	0xd120a038	! t0_kref+0xc8:   	st	%f8, [%g2 + 0x38]
	.word	0x81a0192b	! t0_kref+0xcc:   	fstod	%f11, %f0
	.word	0xf82e001a	! t0_kref+0xd0:   	stb	%i4, [%i0 + %i2]
	.word	0x85a04d21	! t0_kref+0xd4:   	fsmuld	%f1, %f1, %f2
	.word	0xd04e7ff8	! t0_kref+0xd8:   	ldsb	[%i1 - 8], %o0
	.word	0xd006001c	! t0_kref+0xdc:   	ld	[%i0 + %i4], %o0
	.word	0x3f400008	! t0_kref+0xe0:   	fbo,a,pn	%fcc0, _kref+0x100
	.word	0xd6ee1000	! t0_kref+0xe4:   	ldstuba	[%i0]0x80, %o3
	.word	0x913aa008	! t0_kref+0xe8:   	sra	%o2, 0x8, %o0
	.word	0xea6e6009	! t0_kref+0xec:   	ldstub	[%i1 + 9], %l5
	.word	0xd010a03a	! t0_kref+0xf0:   	lduh	[%g2 + 0x3a], %o0
	.word	0x81834000	! t0_kref+0xf4:   	wr	%o5, %g0, %y
	.word	0x97a00028	! t0_kref+0xf8:   	fmovs	%f8, %f11
	.word	0xda360000	! t0_kref+0xfc:   	sth	%o5, [%i0]
	call	SYM(t0_subr2)
	.word	0x908ebe29	! t0_kref+0x104:   	andcc	%i2, -0x1d7, %o0
	.word	0xea6e7ffd	! t0_kref+0x108:   	ldstub	[%i1 - 3], %l5
	.word	0x35800005	! t0_kref+0x10c:   	fbue,a	_kref+0x120
	.word	0xc51e2008	! t0_kref+0x110:   	ldd	[%i0 + 8], %f2
	.word	0x37800001	! t0_kref+0x114:   	fbge,a	_kref+0x118
	.word	0xd91fbe98	! t0_kref+0x118:   	ldd	[%fp - 0x168], %f12
	.word	0x2c480005	! t0_kref+0x11c:   	bneg,a,pt	%icc, _kref+0x130
	.word	0xd048a02a	! t0_kref+0x120:   	ldsb	[%g2 + 0x2a], %o0
	.word	0xd03f4019	! t0_kref+0x124:   	std	%o0, [%i5 + %i1]
	.word	0x9003001b	! t0_kref+0x128:   	add	%o4, %i3, %o0
	.word	0xd0467ff0	! t0_kref+0x12c:   	ldsw	[%i1 - 0x10], %o0
	.word	0x111bbbd5	! t0_kref+0x130:   	sethi	%hi(0x6eef5400), %o0
	.word	0x35480002	! t0_kref+0x134:   	fbue,a,pt	%fcc0, _kref+0x13c
	.word	0x90fb000d	! t0_kref+0x138:   	sdivcc	%o4, %o5, %o0
	.word	0xf007bfe0	! t0_kref+0x13c:   	ld	[%fp - 0x20], %i0
	.word	0x89a01929	! t0_kref+0x140:   	fstod	%f9, %f4
	.word	0x81a01928	! t0_kref+0x144:   	fstod	%f8, %f0
	.word	0x13800005	! t0_kref+0x148:   	fbe	_kref+0x15c
	.word	0xc9180019	! t0_kref+0x14c:   	ldd	[%g0 + %i1], %f4
	.word	0x81a0894c	! t0_kref+0x150:   	fmuld	%f2, %f12, %f0
	.word	0x910f001a	! t0_kref+0x154:   	tsubcc	%i4, %i2, %o0
	.word	0x17480008	! t0_kref+0x158:   	fbge,pt	%fcc0, _kref+0x178
	.word	0xd0d0a022	! t0_kref+0x15c:   	ldsha	[%g2 + 0x22]%asi, %o0
	.word	0x900af0fc	! t0_kref+0x160:   	and	%o3, -0xf04, %o0
	.word	0x19480001	! t0_kref+0x164:   	fbuge,pt	%fcc0, _kref+0x168
	.word	0x90d82710	! t0_kref+0x168:   	smulcc	%g0, 0x710, %o0
	.word	0x906378d4	! t0_kref+0x16c:   	subc	%o5, -0x72c, %o0
	.word	0x9056a261	! t0_kref+0x170:   	umul	%i2, 0x261, %o0
	.word	0x3e800001	! t0_kref+0x174:   	bvc,a	_kref+0x178
	.word	0x9136800c	! t0_kref+0x178:   	srl	%i2, %o4, %o0
	.word	0xe968a08e	! t0_kref+0x17c:   	prefetch	%g2 + 0x8e, 20
	.word	0xdb80a030	! t0_kref+0x180:   	lda	[%g2 + 0x30]%asi, %f13
	.word	0x913a800b	! t0_kref+0x184:   	sra	%o2, %o3, %o0
	.word	0xc300a018	! t0_kref+0x188:   	ld	[%g2 + 0x18], %f1
	.word	0x9de3bfa0	! t0_kref+0x18c:   	save	%sp, -0x60, %sp
	.word	0x91eef20d	! t0_kref+0x190:   	restore	%i3, -0xdf3, %o0
	.word	0xc036c019	! t0_kref+0x194:   	clrh	[%i3 + %i1]
	.word	0xf8264000	! t0_kref+0x198:   	st	%i4, [%i1]
	call	SYM(t0_subr3)
	.word	0x900b000c	! t0_kref+0x1a0:   	and	%o4, %o4, %o0
	.word	0x11400001	! t0_kref+0x1a4:   	fba,pn	%fcc0, _kref+0x1a8
	.word	0x905ac00b	! t0_kref+0x1a8:   	smul	%o3, %o3, %o0
	.word	0x89a01923	! t0_kref+0x1ac:   	fstod	%f3, %f4
	.word	0x8186c000	! t0_kref+0x1b0:   	wr	%i3, %g0, %y
	.word	0x9046e6f1	! t0_kref+0x1b4:   	addc	%i3, 0x6f1, %o0
	.word	0xd010a03a	! t0_kref+0x1b8:   	lduh	[%g2 + 0x3a], %o0
	.word	0x900332f1	! t0_kref+0x1bc:   	add	%o4, -0xd0f, %o0
	.word	0x8da089cc	! t0_kref+0x1c0:   	fdivd	%f2, %f12, %f6
	.word	0x91d0202c	! t0_kref+0x1c4:   	ta	%icc, %g0 + 0x2c
	.word	0xefe8a041	! t0_kref+0x1c8:   	prefetcha	%g2 + 0x41, 23
	.word	0x8143e040	! t0_kref+0x1cc:   	membar	0x40
	.word	0x1e480008	! t0_kref+0x1d0:   	bvc,pt	%icc, _kref+0x1f0
	.word	0xe26e4000	! t0_kref+0x1d4:   	ldstub	[%i1], %l1
	.word	0x8182c000	! t0_kref+0x1d8:   	wr	%o3, %g0, %y
	.word	0x90328009	! t0_kref+0x1dc:   	orn	%o2, %o1, %o0
	.word	0x89a04d27	! t0_kref+0x1e0:   	fsmuld	%f1, %f7, %f4
	call	SYM(t0_subr1)
	.word	0xd010a00a	! t0_kref+0x1e8:   	lduh	[%g2 + 0xa], %o0
	.word	0x90fa8000	! t0_kref+0x1ec:   	sdivcc	%o2, %g0, %o0
	.word	0x9060001b	! t0_kref+0x1f0:   	subc	%g0, %i3, %o0
	.word	0x91d02034	! t0_kref+0x1f4:   	ta	%icc, %g0 + 0x34
	.word	0x91a000c4	! t0_kref+0x1f8:   	fnegd	%f4, %f8
	.word	0x0e400008	! t0_kref+0x1fc:   	bvs,pn	%icc, _kref+0x21c
	.word	0x900b2cc0	! t0_kref+0x200:   	and	%o4, 0xcc0, %o0
	.word	0x9ba00021	! t0_kref+0x204:   	fmovs	%f1, %f13
	.word	0x905b401c	! t0_kref+0x208:   	smul	%o5, %i4, %o0
	.word	0x90def72c	! t0_kref+0x20c:   	smulcc	%i3, -0x8d4, %o0
	.word	0xd03e7ff8	! t0_kref+0x210:   	std	%o0, [%i1 - 8]
	.word	0x1b400003	! t0_kref+0x214:   	fble,pn	%fcc0, _kref+0x220
	.word	0x9164c00c	! t0_kref+0x218:   	movl	%icc, %o4, %o0
	.word	0x91a10820	! t0_kref+0x21c:   	fadds	%f4, %f0, %f8
	.word	0x9032c00c	! t0_kref+0x220:   	orn	%o3, %o4, %o0
	.word	0x90282f04	! t0_kref+0x224:   	andn	%g0, 0xf04, %o0
	.word	0x8da2c927	! t0_kref+0x228:   	fmuls	%f11, %f7, %f6
	.word	0xc02e401a	! t0_kref+0x22c:   	clrb	[%i1 + %i2]
	.word	0x01800007	! t0_kref+0x230:   	fbn	_kref+0x24c
	.word	0x85a01908	! t0_kref+0x234:   	fitod	%f8, %f2
	.word	0x9036c01a	! t0_kref+0x238:   	orn	%i3, %i2, %o0
	.word	0x95a01902	! t0_kref+0x23c:   	fitod	%f2, %f10
	.word	0xcb80a010	! t0_kref+0x240:   	lda	[%g2 + 0x10]%asi, %f5
	.word	0xda360000	! t0_kref+0x244:   	sth	%o5, [%i0]
	.word	0x8fa34820	! t0_kref+0x248:   	fadds	%f13, %f0, %f7
	.word	0xf207bfe0	! t0_kref+0x24c:   	ld	[%fp - 0x20], %i1
	.word	0x0e480006	! t0_kref+0x250:   	bvs,pt	%icc, _kref+0x268
	.word	0x912b000b	! t0_kref+0x254:   	sll	%o4, %o3, %o0
	.word	0x001fffff	! t0_kref+0x258:   	illtrap	0x1fffff
	.word	0x91d02070	! t0_kref+0x25c:   	ta	%icc, %g0 + 0x70
	.word	0x99a24823	! t0_kref+0x260:   	fadds	%f9, %f3, %f12
	.word	0x9127000a	! t0_kref+0x264:   	mulscc	%i4, %o2, %o0
	.word	0xcd1e401d	! t0_kref+0x268:   	ldd	[%i1 + %i5], %f6
	.word	0xda20a008	! t0_kref+0x26c:   	st	%o5, [%g2 + 8]
	.word	0x908ea277	! t0_kref+0x270:   	andcc	%i2, 0x277, %o0
	.word	0x85a1c824	! t0_kref+0x274:   	fadds	%f7, %f4, %f2
	.word	0x8da18844	! t0_kref+0x278:   	faddd	%f6, %f4, %f6
	.word	0x912b401c	! t0_kref+0x27c:   	sll	%o5, %i4, %o0
	.word	0x3c480004	! t0_kref+0x280:   	bpos,a,pt	%icc, _kref+0x290
	.word	0x900ec00b	! t0_kref+0x284:   	and	%i3, %o3, %o0
	.word	0x2d480003	! t0_kref+0x288:   	fbg,a,pt	%fcc0, _kref+0x294
	.word	0x89a00044	! t0_kref+0x28c:   	fmovd	%f4, %f4
	.word	0x91d02070	! t0_kref+0x290:   	ta	%icc, %g0 + 0x70
	.word	0xc11fbd40	! t0_kref+0x294:   	ldd	[%fp - 0x2c0], %f0
	.word	0x8143e021	! t0_kref+0x298:   	membar	0x21
	.word	0x81a01904	! t0_kref+0x29c:   	fitod	%f4, %f0
	.word	0xd0c8a028	! t0_kref+0x2a0:   	ldsba	[%g2 + 0x28]%asi, %o0
	.word	0xec7e3ff4	! t0_kref+0x2a4:   	swap	[%i0 - 0xc], %l6
	.word	0xcd80a038	! t0_kref+0x2a8:   	lda	[%g2 + 0x38]%asi, %f6
	.word	0x902b6da2	! t0_kref+0x2ac:   	andn	%o5, 0xda2, %o0
	.word	0xf8a8a03a	! t0_kref+0x2b0:   	stba	%i4, [%g2 + 0x3a]%asi
	.word	0x33800003	! t0_kref+0x2b4:   	fbe,a	_kref+0x2c0
	.word	0xc3e8a081	! t0_kref+0x2b8:   	prefetcha	%g2 + 0x81, 1
	.word	0x90fec01a	! t0_kref+0x2bc:   	sdivcc	%i3, %i2, %o0
	.word	0x81a009c8	! t0_kref+0x2c0:   	fdivd	%f0, %f8, %f0
	.word	0x91400000	! t0_kref+0x2c4:   	mov	%y, %o0
	.word	0x1d800006	! t0_kref+0x2c8:   	fbule	_kref+0x2e0
	.word	0xd00e6012	! t0_kref+0x2cc:   	ldub	[%i1 + 0x12], %o0
	.word	0x2b480005	! t0_kref+0x2d0:   	fbug,a,pt	%fcc0, _kref+0x2e4
	.word	0x8da00121	! t0_kref+0x2d4:   	fabss	%f1, %f6
	.word	0xd0100019	! t0_kref+0x2d8:   	lduh	[%g0 + %i1], %o0
	.word	0xd620a038	! t0_kref+0x2dc:   	st	%o3, [%g2 + 0x38]
	.word	0x05400007	! t0_kref+0x2e0:   	fblg,pn	%fcc0, _kref+0x2fc
	.word	0xc180a018	! t0_kref+0x2e4:   	lda	[%g2 + 0x18]%asi, %f0
	.word	0x81a98a4a	! t0_kref+0x2e8:   	fcmpd	%fcc0, %f6, %f10
	.word	0xd13f4019	! t0_kref+0x2ec:   	std	%f8, [%i5 + %i1]
	.word	0x8143c000	! t0_kref+0x2f0:   	stbar
	.word	0x902a801c	! t0_kref+0x2f4:   	andn	%o2, %i4, %o0
	.word	0xd0d0a032	! t0_kref+0x2f8:   	ldsha	[%g2 + 0x32]%asi, %o0
	.word	0x91418000	! t0_kref+0x2fc:   	mov	%fprs, %o0
	.word	0x11400002	! t0_kref+0x300:   	fba,pn	%fcc0, _kref+0x308
	.word	0xda36c019	! t0_kref+0x304:   	sth	%o5, [%i3 + %i1]
	.word	0x03800002	! t0_kref+0x308:   	fbne	_kref+0x310
	.word	0x912ac00c	! t0_kref+0x30c:   	sll	%o3, %o4, %o0
	.word	0x9ba10929	! t0_kref+0x310:   	fmuls	%f4, %f9, %f13
	.word	0x9062401c	! t0_kref+0x314:   	subc	%o1, %i4, %o0
	.word	0xd088a020	! t0_kref+0x318:   	lduba	[%g2 + 0x20]%asi, %o0
	.word	0xc91fbf70	! t0_kref+0x31c:   	ldd	[%fp - 0x90], %f4
	.word	0x91a00148	! t0_kref+0x320:   	fabsd	%f8, %f8
	.word	0x2a800005	! t0_kref+0x324:   	bcs,a	_kref+0x338
	.word	0xd66e4000	! t0_kref+0x328:   	ldstub	[%i1], %o3
	.word	0x28480006	! t0_kref+0x32c:   	bleu,a,pt	%icc, _kref+0x344
	.word	0xd0c8a031	! t0_kref+0x330:   	ldsba	[%g2 + 0x31]%asi, %o0
	.word	0x95a00120	! t0_kref+0x334:   	fabss	%f0, %f10
	.word	0xd0d0a030	! t0_kref+0x338:   	ldsha	[%g2 + 0x30]%asi, %o0
	.word	0x8ba00129	! t0_kref+0x33c:   	fabss	%f9, %f5
	.word	0x9fc03f44	! t0_kref+0x340:   	call	%g0 - 0xbc
	.word	0x9092bc89	! t0_kref+0x344:   	orcc	%o2, -0x377, %o0
	.word	0x8da01088	! t0_kref+0x348:   	fxtos	%f8, %f6
	.word	0xd83e0000	! t0_kref+0x34c:   	std	%o4, [%i0]
	.word	0x9062699b	! t0_kref+0x350:   	subc	%o1, 0x99b, %o0
	.word	0x9016b8f2	! t0_kref+0x354:   	or	%i2, -0x70e, %o0
	.word	0xc568a0c0	! t0_kref+0x358:   	prefetch	%g2 + 0xc0, 2
	.word	0x11400005	! t0_kref+0x35c:   	fba,pn	%fcc0, _kref+0x370
	.word	0x9132401a	! t0_kref+0x360:   	srl	%o1, %i2, %o0
	.word	0x09400006	! t0_kref+0x364:   	fbl,pn	%fcc0, _kref+0x37c
	.word	0x900a4000	! t0_kref+0x368:   	and	%o1, %g0, %o0
	.word	0xc91fbd40	! t0_kref+0x36c:   	ldd	[%fp - 0x2c0], %f4
	.word	0x81a248a7	! t0_kref+0x370:   	fsubs	%f9, %f7, %f0
	.word	0x38480003	! t0_kref+0x374:   	bgu,a,pt	%icc, _kref+0x380
	.word	0xf4380019	! t0_kref+0x378:   	std	%i2, [%g0 + %i1]
	.word	0xc91e7fe8	! t0_kref+0x37c:   	ldd	[%i1 - 0x18], %f4
	.word	0x9132800a	! t0_kref+0x380:   	srl	%o2, %o2, %o0
	.word	0xd326200c	! t0_kref+0x384:   	st	%f9, [%i0 + 0xc]
	.word	0x8fd02010	! t0_kref+0x388:   	tvs	%icc, %g0 + 0x10
	.word	0x908ac000	! t0_kref+0x38c:   	andcc	%o3, %g0, %o0
	.word	0x91418000	! t0_kref+0x390:   	mov	%fprs, %o0
	.word	0xe27e3ff4	! t0_kref+0x394:   	swap	[%i0 - 0xc], %l1
	.word	0xc11fbed0	! t0_kref+0x398:   	ldd	[%fp - 0x130], %f0
	.word	0xc3e8a103	! t0_kref+0x39c:   	prefetcha	%g2 + 0x103, 1
	.word	0x9072800a	! t0_kref+0x3a0:   	udiv	%o2, %o2, %o0
	.word	0x8143e040	! t0_kref+0x3a4:   	membar	0x40
	.word	0x8143c000	! t0_kref+0x3a8:   	stbar
	.word	0x1b800008	! t0_kref+0x3ac:   	fble	_kref+0x3cc
	.word	0x8da0004a	! t0_kref+0x3b0:   	fmovd	%f10, %f6
	.word	0x9ba109a0	! t0_kref+0x3b4:   	fdivs	%f4, %f0, %f13
	.word	0xe87e600c	! t0_kref+0x3b8:   	swap	[%i1 + 0xc], %l4
	.word	0x900ebf19	! t0_kref+0x3bc:   	and	%i2, -0xe7, %o0
	.word	0x95a089a4	! t0_kref+0x3c0:   	fdivs	%f2, %f4, %f10
	.word	0x9161401c	! t0_kref+0x3c4:   	movug	%fcc0, %i4, %o0
	.word	0x90fabbb9	! t0_kref+0x3c8:   	sdivcc	%o2, -0x447, %o0
	.word	0x913a6019	! t0_kref+0x3cc:   	sra	%o1, 0x19, %o0
	.word	0x93a1c824	! t0_kref+0x3d0:   	fadds	%f7, %f4, %f9
	.word	0x9113400c	! t0_kref+0x3d4:   	taddcctv	%o5, %o4, %o0
	.word	0x0b480002	! t0_kref+0x3d8:   	fbug,pt	%fcc0, _kref+0x3e0
	.word	0x91d02040	! t0_kref+0x3dc:   	ta	%icc, %g0 + 0x40
	.word	0xe86e600a	! t0_kref+0x3e0:   	ldstub	[%i1 + 0xa], %l4
	.word	0x99a0188d	! t0_kref+0x3e4:   	fitos	%f13, %f12
	.word	0x99a00144	! t0_kref+0x3e8:   	fabsd	%f4, %f12
	.word	0x9164e4ff	! t0_kref+0x3ec:   	movl	%icc, -0x301, %o0
	.word	0x90728000	! t0_kref+0x3f0:   	udiv	%o2, %g0, %o0
	.word	0x8d8273f0	! t0_kref+0x3f4:   	wr	%o1, 0xfffff3f0, %fprs
	.word	0x02400005	! t0_kref+0x3f8:   	be,pn	%icc, _kref+0x40c
	.word	0x91302005	! t0_kref+0x3fc:   	srl	%g0, 0x5, %o0
	.word	0xd67f0018	! t0_kref+0x400:   	swap	[%i4 + %i0], %o3
	.word	0x913f201a	! t0_kref+0x404:   	sra	%i4, 0x1a, %o0
	.word	0x85a18d21	! t0_kref+0x408:   	fsmuld	%f6, %f1, %f2
	.word	0x912ac00d	! t0_kref+0x40c:   	sll	%o3, %o5, %o0
	.word	0xf426401c	! t0_kref+0x410:   	st	%i2, [%i1 + %i4]
	.word	0xebe8a106	! t0_kref+0x414:   	prefetcha	%g2 + 0x106, 21
	.word	0x90d324e4	! t0_kref+0x418:   	umulcc	%o4, 0x4e4, %o0
	.word	0xd91fbf90	! t0_kref+0x41c:   	ldd	[%fp - 0x70], %f12
	.word	0xd0de101d	! t0_kref+0x420:   	ldxa	[%i0 + %i5]0x80, %o0
	.word	0x2d480008	! t0_kref+0x424:   	fbg,a,pt	%fcc0, _kref+0x444
	.word	0xd83e2000	! t0_kref+0x428:   	std	%o4, [%i0]
	.word	0x907ab724	! t0_kref+0x42c:   	sdiv	%o2, -0x8dc, %o0
	.word	0x91d0203c	! t0_kref+0x430:   	ta	%icc, %g0 + 0x3c
	.word	0x00400002	! t0_kref+0x434:   	bn,pn	%icc, _kref+0x43c
	.word	0x90b8001c	! t0_kref+0x438:   	xnorcc	%g0, %i4, %o0
	.word	0x81a01a26	! t0_kref+0x43c:   	fstoi	%f6, %f0
	.word	0xd0166014	! t0_kref+0x440:   	lduh	[%i1 + 0x14], %o0
	call	SYM(t0_subr0)
	.word	0x81a0192a	! t0_kref+0x448:   	fstod	%f10, %f0
	.word	0x91d02064	! t0_kref+0x44c:   	ta	%icc, %g0 + 0x64
	.word	0x90aaada1	! t0_kref+0x450:   	andncc	%o2, 0xda1, %o0
	.word	0x912f001b	! t0_kref+0x454:   	sll	%i4, %i3, %o0
	.word	0x89a00827	! t0_kref+0x458:   	fadds	%f0, %f7, %f4
	.word	0xc568a0c6	! t0_kref+0x45c:   	prefetch	%g2 + 0xc6, 2
	.word	0x20800002	! t0_kref+0x460:   	bn,a	_kref+0x468
	.word	0x908f2561	! t0_kref+0x464:   	andcc	%i4, 0x561, %o0
	.word	0x81a0cd25	! t0_kref+0x468:   	fsmuld	%f3, %f5, %f0
	.word	0x900a779b	! t0_kref+0x46c:   	and	%o1, -0x865, %o0
	.word	0x39480001	! t0_kref+0x470:   	fbuge,a,pt	%fcc0, _kref+0x474
	.word	0x81a08d2c	! t0_kref+0x474:   	fsmuld	%f2, %f12, %f0
	.word	0x8fa309aa	! t0_kref+0x478:   	fdivs	%f12, %f10, %f7
	.word	0x90e3610a	! t0_kref+0x47c:   	subccc	%o5, 0x10a, %o0
	.word	0x912a401a	! t0_kref+0x480:   	sll	%o1, %i2, %o0
	.word	0x3f480007	! t0_kref+0x484:   	fbo,a,pt	%fcc0, _kref+0x4a0
	.word	0x907ac000	! t0_kref+0x488:   	sdiv	%o3, %g0, %o0
	.word	0x3e480005	! t0_kref+0x48c:   	bvc,a,pt	%icc, _kref+0x4a0
	.word	0x900af3ba	! t0_kref+0x490:   	and	%o3, -0xc46, %o0
	.word	0xe6f81019	! t0_kref+0x494:   	swapa	[%g0 + %i1]0x80, %l3
	.word	0x91d02038	! t0_kref+0x498:   	ta	%icc, %g0 + 0x38
	.word	0x81828000	! t0_kref+0x49c:   	wr	%o2, %g0, %y
	.word	0x90fef6dc	! t0_kref+0x4a0:   	sdivcc	%i3, -0x924, %o0
	.word	0x8610201e	! t0_kref+0x4a4:   	mov	0x1e, %g3
	.word	0x86a0e001	! t0_kref+0x4a8:   	subcc	%g3, 1, %g3
	.word	0x0280001a	! t0_kref+0x4ac:   	be	_kref+0x514
	.word	0x91d02068	! t0_kref+0x4b0:   	ta	%icc, %g0 + 0x68
	.word	0xdb80a010	! t0_kref+0x4b4:   	lda	[%g2 + 0x10]%asi, %f13
	.word	0xc11fbc90	! t0_kref+0x4b8:   	ldd	[%fp - 0x370], %f0
	.word	0x909337c3	! t0_kref+0x4bc:   	orcc	%o4, -0x83d, %o0
	.word	0xd980a010	! t0_kref+0x4c0:   	lda	[%g2 + 0x10]%asi, %f12
	.word	0x91026c2e	! t0_kref+0x4c4:   	taddcc	%o1, 0xc2e, %o0
	.word	0x09800005	! t0_kref+0x4c8:   	fbl	_kref+0x4dc
	.word	0xc900a020	! t0_kref+0x4cc:   	ld	[%g2 + 0x20], %f4
	.word	0xc51e001d	! t0_kref+0x4d0:   	ldd	[%i0 + %i5], %f2
	.word	0xd91fbe98	! t0_kref+0x4d4:   	ldd	[%fp - 0x168], %f12
	.word	0x81a0192c	! t0_kref+0x4d8:   	fstod	%f12, %f0
	.word	0x90bf367b	! t0_kref+0x4dc:   	xnorcc	%i4, -0x985, %o0
	.word	0x0047fff2	! t0_kref+0x4e0:   	bn,pn	%icc, _kref+0x4a8
	.word	0xd04e201e	! t0_kref+0x4e4:   	ldsb	[%i0 + 0x1e], %o0
	.word	0xd0c8a013	! t0_kref+0x4e8:   	ldsba	[%g2 + 0x13]%asi, %o0
	.word	0x1a47ffef	! t0_kref+0x4ec:   	bcc,pn	%icc, _kref+0x4a8
	.word	0x90dac01b	! t0_kref+0x4f0:   	smulcc	%o3, %i3, %o0
	.word	0x913a800d	! t0_kref+0x4f4:   	sra	%o2, %o5, %o0
	.word	0x87a24822	! t0_kref+0x4f8:   	fadds	%f9, %f2, %f3
	.word	0xd0060000	! t0_kref+0x4fc:   	ld	[%i0], %o0
	.word	0x90aa400d	! t0_kref+0x500:   	andncc	%o1, %o5, %o0
	.word	0x99a00040	! t0_kref+0x504:   	fmovd	%f0, %f12
	.word	0x81a90a4a	! t0_kref+0x508:   	fcmpd	%fcc0, %f4, %f10
	.word	0xf8700019	! t0_kref+0x50c:   	stx	%i4, [%g0 + %i1]
	.word	0x90532eb3	! t0_kref+0x510:   	umul	%o4, 0xeb3, %o0
	.word	0x0f480006	! t0_kref+0x514:   	fbu,pt	%fcc0, _kref+0x52c
	.word	0x99a01046	! t0_kref+0x518:   	fdtox	%f6, %f12
	.word	0x2f400003	! t0_kref+0x51c:   	fbu,a,pn	%fcc0, _kref+0x528
	.word	0x97a01884	! t0_kref+0x520:   	fitos	%f4, %f11
	.word	0x900b000a	! t0_kref+0x524:   	and	%o4, %o2, %o0
	.word	0x913ec000	! t0_kref+0x528:   	sra	%i3, %g0, %o0
	.word	0x9042400c	! t0_kref+0x52c:   	addc	%o1, %o4, %o0
	.word	0xc91fbe38	! t0_kref+0x530:   	ldd	[%fp - 0x1c8], %f4
	.word	0x908ab44c	! t0_kref+0x534:   	andcc	%o2, -0xbb4, %o0
	.word	0x81a1cd2d	! t0_kref+0x538:   	fsmuld	%f7, %f13, %f0
	.word	0x95a01929	! t0_kref+0x53c:   	fstod	%f9, %f10
	.word	0x9056c009	! t0_kref+0x540:   	umul	%i3, %o1, %o0
	.word	0x907f3b17	! t0_kref+0x544:   	sdiv	%i4, -0x4e9, %o0
	.word	0xd048a008	! t0_kref+0x548:   	ldsb	[%g2 + 8], %o0
	.word	0xd00e3fe8	! t0_kref+0x54c:   	ldub	[%i0 - 0x18], %o0
	.word	0xd0062000	! t0_kref+0x550:   	ld	[%i0], %o0
	call	SYM(t0_subr3)
	.word	0x902b401c	! t0_kref+0x558:   	andn	%o5, %i4, %o0
	.word	0x85a000cc	! t0_kref+0x55c:   	fnegd	%f12, %f2
	.word	0xd0d0a000	! t0_kref+0x560:   	ldsha	[%g2]%asi, %o0
	.word	0x90028000	! t0_kref+0x564:   	add	%o2, %g0, %o0
	.word	0x29400002	! t0_kref+0x568:   	fbl,a,pn	%fcc0, _kref+0x570
	.word	0xd016600e	! t0_kref+0x56c:   	lduh	[%i1 + 0xe], %o0
	.word	0x9126acd2	! t0_kref+0x570:   	mulscc	%i2, 0xcd2, %o0
	.word	0x81dd0016	! t0_kref+0x574:   	flush	%l4 + %l6
	.word	0x90fa6ac8	! t0_kref+0x578:   	sdivcc	%o1, 0xac8, %o0
	.word	0x04400007	! t0_kref+0x57c:   	ble,pn	%icc, _kref+0x598
	.word	0x9120281e	! t0_kref+0x580:   	mulscc	%g0, 0x81e, %o0
	.word	0xf207bfe0	! t0_kref+0x584:   	ld	[%fp - 0x20], %i1
	.word	0x90ab38f5	! t0_kref+0x588:   	andncc	%o4, -0x70b, %o0
	.word	0xf42e4000	! t0_kref+0x58c:   	stb	%i2, [%i1]
	.word	0x91d0202c	! t0_kref+0x590:   	ta	%icc, %g0 + 0x2c
	.word	0x25800005	! t0_kref+0x594:   	fblg,a	_kref+0x5a8
	.word	0x9066800b	! t0_kref+0x598:   	subc	%i2, %o3, %o0
	.word	0x90d8000c	! t0_kref+0x59c:   	smulcc	%g0, %o4, %o0
	.word	0xd0164000	! t0_kref+0x5a0:   	lduh	[%i1], %o0
	.word	0xd016c019	! t0_kref+0x5a4:   	lduh	[%i3 + %i1], %o0
	.word	0xd03e401d	! t0_kref+0x5a8:   	std	%o0, [%i1 + %i5]
	.word	0x37800005	! t0_kref+0x5ac:   	fbge,a	_kref+0x5c0
	.word	0x912ae01e	! t0_kref+0x5b0:   	sll	%o3, 0x1e, %o0
	.word	0xc9be6000	! t0_kref+0x5b4:   	stda	%f4, [%i1]%asi
	.word	0x907ab02d	! t0_kref+0x5b8:   	sdiv	%o2, -0xfd3, %o0
	.word	0xd088a020	! t0_kref+0x5bc:   	lduba	[%g2 + 0x20]%asi, %o0
	.word	0x9063401a	! t0_kref+0x5c0:   	subc	%o5, %i2, %o0
	.word	0x91a00128	! t0_kref+0x5c4:   	fabss	%f8, %f8
	.word	0xd300a010	! t0_kref+0x5c8:   	ld	[%g2 + 0x10], %f9
	.word	0x90200000	! t0_kref+0x5cc:   	neg	%g0, %o0
	.word	0x19800003	! t0_kref+0x5d0:   	fbuge	_kref+0x5dc
	.word	0x81a01908	! t0_kref+0x5d4:   	fitod	%f8, %f0
	.word	0x8da01921	! t0_kref+0x5d8:   	fstod	%f1, %f6
	.word	0xd6267ffc	! t0_kref+0x5dc:   	st	%o3, [%i1 - 4]
	.word	0x1e800002	! t0_kref+0x5e0:   	bvc	_kref+0x5e8
	.word	0x91a0c9a0	! t0_kref+0x5e4:   	fdivs	%f3, %f0, %f8
	.word	0x9167c009	! t0_kref+0x5e8:   	movvc	%icc, %o1, %o0
	.word	0xd00e2013	! t0_kref+0x5ec:   	ldub	[%i0 + 0x13], %o0
	.word	0x81a2c9a4	! t0_kref+0x5f0:   	fdivs	%f11, %f4, %f0
	.word	0xc0367ff0	! t0_kref+0x5f4:   	clrh	[%i1 - 0x10]
	.word	0x87a01a42	! t0_kref+0x5f8:   	fdtoi	%f2, %f3
	.word	0x8da000c0	! t0_kref+0x5fc:   	fnegd	%f0, %f6
	.word	0x90534009	! t0_kref+0x600:   	umul	%o5, %o1, %o0
	.word	0x1f400003	! t0_kref+0x604:   	fbo,pn	%fcc0, _kref+0x610
	.word	0x9076aa47	! t0_kref+0x608:   	udiv	%i2, 0xa47, %o0
	.word	0x91a0190c	! t0_kref+0x60c:   	fitod	%f12, %f8
	.word	0xd91fbe18	! t0_kref+0x610:   	ldd	[%fp - 0x1e8], %f12
	.word	0xd04e601a	! t0_kref+0x614:   	ldsb	[%i1 + 0x1a], %o0
	.word	0x91a00120	! t0_kref+0x618:   	fabss	%f0, %f8
	.word	0xd0000019	! t0_kref+0x61c:   	ld	[%g0 + %i1], %o0
	.word	0x39800008	! t0_kref+0x620:   	fbuge,a	_kref+0x640
	.word	0x89a01925	! t0_kref+0x624:   	fstod	%f5, %f4
	.word	0x90e6ebbb	! t0_kref+0x628:   	subccc	%i3, 0xbbb, %o0
	.word	0xd050a018	! t0_kref+0x62c:   	ldsh	[%g2 + 0x18], %o0
	.word	0xd05e6008	! t0_kref+0x630:   	ldx	[%i1 + 8], %o0
	.word	0xcf062004	! t0_kref+0x634:   	ld	[%i0 + 4], %f7
	.word	0x91400000	! t0_kref+0x638:   	mov	%y, %o0
	.word	0xd0167ff4	! t0_kref+0x63c:   	lduh	[%i1 - 0xc], %o0
	.word	0x89a01929	! t0_kref+0x640:   	fstod	%f9, %f4
	.word	0xd040a030	! t0_kref+0x644:   	ldsw	[%g2 + 0x30], %o0
	.word	0x90427319	! t0_kref+0x648:   	addc	%o1, -0xce7, %o0
	.word	0xd0070018	! t0_kref+0x64c:   	ld	[%i4 + %i0], %o0
	.word	0x01000000	! t0_kref+0x650:   	nop
	.word	0x01000000	! t0_kref+0x654:   	nop
	.word	0x01000000	! t0_kref+0x658:   	nop
	.word	0x01000000	! t0_kref+0x65c:   	nop
	call	SYM(_kaos_done)
	.word	0x01000000	! t0_kref+0x664:   	nop
	KGLOBAL(t0_ktbl_end)
t0_ktbl_end:
t0_ktbl_page_end:

KTEXT_MODULE(t0_module_subr0, 0x28dbe000)
.seg "text"
t0_subr0_page_begin:
	.skip 8192
.global _t0_subr0; ENTRY(t0_subr0)
	.word	0xa6844012	! t0_subr0+0x0:   	addcc	%l1, %l2, %l3
	.word	0x81c3e008	! t0_subr0+0x4:   	retl
	.word	0xaa64c014	! t0_subr0+0x8:   	subc	%l3, %l4, %l5
t0_subr0_page_end:

KTEXT_MODULE(t0_module_subr1, 0x28e1e000)
.seg "text"
t0_subr1_page_begin:
	.skip 8192
.global _t0_subr1; ENTRY(t0_subr1)
	.word	0x9de3bfa0	! t0_subr1+0x0:   	save	%sp, -0x60, %sp
	.word	0xb29eaa5a	! t0_subr1+0x4:   	xorcc	%i2, 0xa5a, %i1
	.word	0x81c7e008	! t0_subr1+0x8:   	ret
	.word	0xa7ee6001	! t0_subr1+0xc:   	restore	%i1, 1, %l3
t0_subr1_page_end:

KTEXT_MODULE(t0_module_subr2, 0x255c6000)
.seg "text"
t0_subr2_page_begin:
	.skip 8188
.global _t0_subr2; ENTRY(t0_subr2)
	.word	0x9de3bfa0	! t0_subr2+0x0:   	save	%sp, -0x60, %sp
	.word	0xb2066001	! t0_subr2+0x4:   	add	%i1, 1, %i1
	.word	0x81c7e008	! t0_subr2+0x8:   	ret
	.word	0xa3ee6001	! t0_subr2+0xc:   	restore	%i1, 1, %l1
t0_subr2_page_end:

KTEXT_MODULE(t0_module_subr3, 0x29206000)
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
!  Total operations: 402   
!
!  Operation frequencies
!
!  name               exp    obs
!  ldsb              1.43   1.00
!  ldub              0.67   0.75
!  ldsh              0.17   0.00
!  lduh              1.25   1.74
!  ld                1.45   1.24
!  ldd               0.43   0.00
!  swap              0.78   1.00
!  ldstub            1.53   1.24
!  stb               1.18   1.00
!  sth               1.11   1.24
!  st                1.37   0.75
!  std               1.56   1.99
!  add               0.73   0.75
!  addcc             0.61   0.00
!  addx              0.63   0.75
!  addxcc            0.10   0.00
!  taddcc            0.31   0.25
!  taddcctv          0.17   0.25
!  sub               0.55   0.25
!  subcc             0.17   0.00
!  subx              0.85   1.49
!  subxcc            0.53   0.50
!  tsubcc            0.14   0.25
!  tsubcctv          0.10   0.00
!  mulscc            1.56   0.75
!  and               1.28   2.24
!  andcc             1.26   1.49
!  andn              0.47   1.24
!  andncc            1.24   0.75
!  or                0.21   0.25
!  orcc              0.84   0.50
!  orn               0.64   0.75
!  orncc             0.62   0.00
!  xor               0.18   0.00
!  xorcc             0.40   0.00
!  xnor              0.83   0.25
!  xnorcc            0.59   0.50
!  sll               1.24   1.99
!  srl               0.67   1.00
!  sra               1.59   1.74
!  unimp             0.33   0.25
!  umul              1.08   1.24
!  smul              0.51   0.50
!  udiv              0.69   0.75
!  sdiv              0.92   1.00
!  umulcc            0.87   0.25
!  smulcc            1.39   1.24
!  udivcc            0.04   0.00
!  sdivcc            1.56   1.49
!  rdy               0.94   0.75
!  wry               0.59   1.24
!  bicc              0.56   1.00
!  sethi             1.08   0.25
!  jmpl              0.57   0.00
!  call              1.57   1.24
!  ticc              0.05   0.50
!  flush             1.25   0.75
!  save              0.27   0.25
!  restore           0.66   0.00
!  stbar             0.18   0.50
!  ldf               0.72   0.25
!  lddf              1.08   1.24
!  stf               0.79   0.25
!  stdf              0.08   0.25
!  fadds             1.39   2.24
!  fsubs             0.28   0.25
!  fmuls             0.66   0.50
!  fdivs             1.15   1.49
!  faddd             1.06   0.50
!  fsubd             0.04   0.00
!  fmuld             0.62   0.25
!  fdivd             1.18   0.50
!  faddq             0.00   0.00
!  fsubq             0.00   0.00
!  fmulq             0.00   0.00
!  fdivq             0.00   0.00
!  fsmuld            0.85   1.49
!  fdmulq            0.00   0.00
!  fitos             0.76   0.50
!  fitod             1.34   1.49
!  fitoq             0.00   0.00
!  fstoi             0.56   0.50
!  fstod             1.24   3.23
!  fstoq             0.00   0.00
!  fdtoi             0.73   0.75
!  fdtos             0.31   0.00
!  fdtoq             0.00   0.00
!  fqtoi             0.00   0.00
!  fqtos             0.00   0.00
!  fqtod             0.00   0.00
!  fmovs             0.55   0.50
!  fnegs             0.09   0.00
!  fabss             1.21   1.49
!  fsqrts            0.00   0.00
!  fsqrtd            0.00   0.00
!  fsqrtq            0.00   0.00
!  fcmps             0.07   0.25
!  fcmpd             1.08   0.50
!  fcmpq             0.00   0.00
!  fcmpes            0.40   0.25
!  fcmped            0.07   0.00
!  fcmpeq            0.00   0.00
!  fbfcc             4.19   3.98
!  ldfsr             0.18   0.00
!  stfsr             0.06   0.00
!  loop              0.53   0.25
!  offset            0.09   0.00
!  area              0.22   0.75
!  target            0.06   0.00
!  goto              0.03   0.00
!  sigsegv           0.24   0.25
!  sigbus            0.07   0.00
!  imodify           0.69   0.00
!  ldfsr_offset      0.24   0.00
!  fpattern          1.12   2.74
!  lbranch           0.16   0.00
!  shmld             5.58   6.72
!  shmst             0.92   1.00
!  shmpf             1.60   2.49
!  shmswap           0.01   0.25
!  shmblkld          0.77   0.25
!  shmblkst          0.38   0.00
!  shmblkchk         0.05   0.50
!  hack_restore      0.07   0.00
!  demap_random_va   0.24   0.00
!  demap_area        0.19   0.50
!  demap_ktbl_text   0.11   0.00
!  demap_ktbl_data   0.03   0.25
!  demap_subr        0.15   0.25
!  demap_reg         0.30   0.25
!  demap_stack       0.22   0.25
!  ro_area           0.00   0.00
!  ro_ktbl_data      0.00   0.00
!  ro_reg            0.00   0.00
!  ro_stack          0.00   0.00
!  set_window        0.06   0.00
!  set_va_wp         0.13   0.00
!  set_pa_wp         0.02   0.00
!  set_softint       0.25   0.00
!  ie_toggle         0.25   0.25
!  set_pil           0.19   0.25
!  set_tso           0.11   0.00
!  set_pso           0.23   0.75
!  set_rmo           0.08   0.00
!  cflush            0.00   0.00
!  return            0.26   0.00
!  casa              0.15   0.00
!  rdasi             0.07   0.00
!  wrasi             0.19   0.25
!  bpcc              2.33   3.73
!  fbpfcc            6.27   5.47
!  fmovscc           0.05   0.00
!  fmovdcc           0.05   0.00
!  fmovqcc           0.00   0.00
!  movcc             0.33   1.24
!  flushw            0.14   0.00
!  membar            0.32   0.25
!  prefetch          0.33   0.00
!  rdpc              0.08   0.00
!  ldqf              0.00   0.00
!  stqf              0.00   0.00
!  ldfa              0.28   0.00
!  lddfa             0.17   0.00
!  ldqfa             0.00   0.00
!  ldsba             0.03   0.00
!  ldsha             0.06   0.00
!  lduba             0.15   0.00
!  lduha             0.08   0.00
!  lda               0.22   0.00
!  ldda              0.23   0.00
!  ldstuba           0.07   0.25
!  prefetcha         0.00   0.00
!  stfa              0.05   0.00
!  stdfa             0.25   0.25
!  stqfa             0.00   0.00
!  stba              0.18   0.00
!  stha              0.06   0.00
!  sta               0.13   0.00
!  stda              0.02   0.00
!  swapa             0.26   0.50
!  fmovd             0.27   0.75
!  fnegd             0.16   0.75
!  fabsd             0.13   0.50
!  fstox             0.01   0.00
!  fdtox             0.20   0.25
!  fxtos             0.07   0.25
!  fxtod             0.09   0.00
!  lds               0.10   0.25
!  ldsa              0.11   0.00
!  ldx               0.06   0.25
!  ldxa              0.22   0.25
!  nofault           0.03   0.00
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
!  partial_st8       0.00   0.00
!  partial_st16      0.00   0.00
!  partial_st32      0.00   0.00
!  short_st8         0.00   0.00
!  short_st16        0.00   0.00
!  short_ld8         0.00   0.00
!  short_ld16        0.00   0.00
!  blkld             0.00   0.00
!  blkst             0.00   0.00
!  blkld_offset      0.00   0.00
!  blkst_offset      0.00   0.00
!  blk_check         0.00   0.00
!  casxa             0.11   0.00
!  rdccr             0.13   0.00
!  rdfprs            0.16   0.50
!  wrccr             0.31   0.00
!  popc              0.00   0.00
!  wrfprs            0.17   0.25
!  stx               0.13   0.25
!  stxa              0.05   0.25
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
KDATA_MODULE(t0_module_offset_table, 0x18206000)
.seg "data"
t0_offset_table_start:
t0_offset_table_size:	.word	0x00000008
t0_offset_table:
	.word	0x00000018
	.word	0x00000000
	.word	0xfffffff8
	.word	0xfffffff0
	.word	0xffffffe0
	.word	0x00000010
	.word	0xffffffe8
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

KDATA_MODULE(t0_module_data_in_regs, 0x1e306000)
.seg "data"
KGLOBAL(t0_data_in_regs)
t0_data_in_regs_start:
t0_data_in_regs:
	.word	0xdaa299cd          ! %f0
	.word	0xf470bca3          ! %f1
	.word	0x4b8c67a3          ! %f2
	.word	0xfbb71fda          ! %f3
	.word	0xcb358428          ! %f4
	.word	0xd8b6b165          ! %f5
	.word	0xa8edd40a          ! %f6
	.word	0x0c1b4ea0          ! %f7
	.word	0xf4a929bc          ! %f8
	.word	0xce7cd4f5          ! %f9
	.word	0x6cd501fe          ! %f10
	.word	0xb3ed1afa          ! %f11
	.word	0x824c335a          ! %f12
	.word	0x126a79e8          ! %f13
	.word	0xf9f0d622          ! %f14
	.word	0x5814b247          ! %f15
	.word	0xc88839ab          ! %f16
	.word	0x990974fa          ! %f17
	.word	0xe612fce0          ! %f18
	.word	0x55cf2217          ! %f19
	.word	0xdd50a361          ! %f20
	.word	0x818d712f          ! %f21
	.word	0xb7d715c1          ! %f22
	.word	0xbd3942ed          ! %f23
	.word	0x38e4b2ae          ! %f24
	.word	0xdf79e23b          ! %f25
	.word	0x0640bfff          ! %f26
	.word	0xb7580b46          ! %f27
	.word	0xa1a075f9          ! %f28
	.word	0xd8ca3923          ! %f29
	.word	0x2e555c58          ! %f30
	.word	0x84248eda          ! %f31
	.word	0x691f8fcf          ! %f32
	.word	0xda563f23          ! %f33
	.word	0x4daf9824          ! %f34
	.word	0x48c22e21          ! %f35
	.word	0x2db00a17          ! %f36
	.word	0xeb66bad2          ! %f37
	.word	0xda5815a9          ! %f38
	.word	0x6369ba18          ! %f39
	.word	0xc842a889          ! %f40
	.word	0x820cc383          ! %f41
	.word	0x190fc5ae          ! %f42
	.word	0x81fc9044          ! %f43
	.word	0x5fe96e61          ! %f44
	.word	0xd61066ee          ! %f45
	.word	0xc0edc64d          ! %f46
	.word	0x65def2f7          ! %f47
	.word	0x4fcc4b4f          ! %f48
	.word	0xa6718510          ! %f49
	.word	0x46fbdb0d          ! %f50
	.word	0xb3e921d1          ! %f51
	.word	0x5e8723b0          ! %f52
	.word	0xefc0064f          ! %f53
	.word	0xe399d22f          ! %f54
	.word	0xce32f689          ! %f55
	.word	0xe563a803          ! %f56
	.word	0xce3ecfe0          ! %f57
	.word	0x47216b48          ! %f58
	.word	0xe77609ed          ! %f59
	.word	0xd614af95          ! %f60
	.word	0xf8171a6d          ! %f61
	.word	0xd8c9930f          ! %f62
	.word	0xf0fea527          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0x88c       ! %g1 (code pointer)
	.word	t0_data_in_shm_area ! %g2 (shared area pointer)
	.word	0xf7bc7ae4          ! %g3 (loop index)
	.word	SYM(t0_subr3)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0x9e4ce510          ! %o0
	.word	0xc4d144a2          ! %o1
	.word	0x447f924b          ! %o2
	.word	0xb5cbc879          ! %o3
	.word	0xb1de97dd          ! %o4
	.word	0x326074fe          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0xe5c00a7f          ! %l0
	.word	0x08180ef1          ! %l1
	.word	0x0b610878          ! %l2
	.word	0xe4e40341          ! %l3
	.word	0x8f7efed2          ! %l4
	.word	0x82d8cde6          ! %l5
	.word	0xec65bf01          ! %l6
	.word	0x32c4a6ea          ! %l7
	.word	t0_data_in_area0    ! %i0 (area pointer)
	.word	t0_data_in_area0    ! %i1 (area pointer)
	.word	0x00000010          ! %i2 (byte offset)
	.word	0xfffffff8          ! %i3 (halfword offset)
	.word	0x00000018          ! %i4 (word offset)
	.word	0xfffffff8          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0xf1ba1eeb          ! %y
	.word	0x00000002          ! %icc (nzvc)
	.word	0xc0000572          ! %fsr
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

KDATA_MODULE(t0_module_data_in_stack, 0x07e78000)
.seg "data"
KGLOBAL(t0_data_in_mtbl_size)
KGLOBAL(t0_data_in_mtbl)
KGLOBAL(t0_data_in_stack)
t0_data_in_stack_start:
	.word	0xd184736d
	.word	0x5d0c2323
	.word	0xce9a9986
	.word	0x91424696
	.word	0x1c7e3487
	.word	0xe09cd101
	.word	0x78514481
	.word	0xb09325aa
	.word	0x49a72279
	.word	0xab889b5e
	.word	0xd631bbf7
	.word	0x6dfc3bda
	.word	0x132e78bd
	.word	0x78b46662
	.word	0x1bf5aef7
	.word	0x487a381f
	.word	0x6d271763
	.word	0x95e74142
	.word	0xc91b2247
	.word	0x9513ebfb
	.word	0x083c2f25
	.word	0xd7c1a2c5
	.word	0xeb37cc98
	.word	0xb91f4599
	.word	0xeafc1ab9
	.word	0x4f4d6a03
	.word	0x79a981fb
	.word	0x5bd94832
	.word	0xcce6f966
	.word	0x0686a770
	.word	0x481d6293
	.word	0x43daa6b1
	.word	0xeb33deda
	.word	0xb0b97218
	.word	0xfecec08c
	.word	0x2168e499
	.word	0x1b18ac39
	.word	0x76914d2b
	.word	0xdff9f14b
	.word	0xbc3e2126
	.word	0x458de679
	.word	0x087ae1bc
	.word	0xa10e7de6
	.word	0xc85ff0b2
	.word	0x2e491dec
	.word	0x24c110c5
	.word	0xb6ef66d6
	.word	0x9c3fe85a
	.word	0x303dbb1e
	.word	0x3ddaa16e
	.word	0x8e476eeb
	.word	0x98e6bfe1
	.word	0x4e9d44e0
	.word	0xe8ee0f8e
	.word	0xdee2a17f
	.word	0xe5952dd3
	.word	0xc74d73a4
	.word	0xf8e53e71
	.word	0xaa5d87ee
	.word	0x2953e1ed
	.word	0xfc5ba60c
	.word	0x6fc313db
	.word	0x468dc245
	.word	0xd09e41bc
	.word	0xa25a8abc
	.word	0xca893f4d
	.word	0xca0ef738
	.word	0xb1e9cb83
	.word	0x53101377
	.word	0x2c1cb186
	.word	0x389a4f59
	.word	0x33864361
	.word	0xeba70569
	.word	0xe57b884c
	.word	0x447def87
	.word	0x7e710eb3
	.word	0x0cf8bac1
	.word	0x257f726b
	.word	0x75ed26a4
	.word	0x7e7861b7
	.word	0x10b8e983
	.word	0xd493cffe
	.word	0x0f39428a
	.word	0x06b12371
	.word	0x4896839b
	.word	0xe97712ec
	.word	0x518e403e
	.word	0x240cabd1
	.word	0x32020434
	.word	0xbf9323b5
	.word	0x87cdcb66
	.word	0x9509c015
	.word	0xd37abe4a
	.word	0x0df0ce6e
	.word	0xd7d640f8
	.word	0x474e716c
	.word	0xec4a007d
	.word	0x3b867c0a
	.word	0xa52aa934
	.word	0x48aec1db
	.word	0x46ac2228
	.word	0xa2e2bbda
	.word	0xd5cbdcd3
	.word	0x92fe3364
	.word	0xf3d4cdb2
	.word	0x58376156
	.word	0x8a624980
	.word	0xaf48a564
	.word	0xb23d1c23
	.word	0xa9d23a1d
	.word	0x88db0987
	.word	0x2ff1243c
	.word	0x3e7f55fa
	.word	0x985ca03a
	.word	0x5b9242cc
	.word	0x27fb8f34
	.word	0xeeed6d3d
	.word	0x2a0b6ca8
	.word	0xda5000fd
	.word	0xeab0389b
	.word	0x274c84d0
	.word	0xc67d0e18
	.word	0xc4fbff0b
	.word	0xc016e432
	.word	0xedf1190a
	.word	0xc09bc7f0
	.word	0x4d4013d5
	.word	0xbab8c7ca
	.word	0x0b1c9d85
	.word	0x24b65d97
	.word	0xdb983626
	.word	0x3fef722a
	.word	0x8836a435
	.word	0x9b61adef
	.word	0x30ca4be1
	.word	0x0800bc37
	.word	0x5b88e1bb
	.word	0x49da0322
	.word	0xddaf387b
	.word	0xaca6284e
	.word	0x5fc6a2fb
	.word	0xa6c31aa1
	.word	0x3bd9dea8
	.word	0x3da053f4
	.word	0x0a1d87eb
	.word	0x1a92296a
	.word	0xe1400958
	.word	0x99dd5fb1
	.word	0x5f1697ae
	.word	0x55dd6089
	.word	0x72d46fe4
	.word	0x72c37138
	.word	0x7b6c01e0
	.word	0xb180b5e0
	.word	0xad404984
	.word	0x449eb3cb
	.word	0x43692133
	.word	0xd53ff529
	.word	0x1ade2404
	.word	0x35447add
	.word	0xe6af933a
	.word	0xb58a5d3c
	.word	0xd1fef1b7
	.word	0x96f36af8
	.word	0x68957984
	.word	0xa8844d8d
	.word	0x899d82ab
	.word	0xcb92cce0
t0_data_in_sp:
	.word	0x23fe37ed
	.word	0x91bfc7f9
	.word	0x9433dd1e
	.word	0xe1f16ef9
	.word	0xbdd04430
	.word	0xab54cac1
	.word	0xd3a9292f
	.word	0x95c6b8e5
	.word	t0_data_in_area0
	.word	t0_data_in_area0
	.word	0x0000000c
	.word	0xffffffe8
	.word	0x00000018
	.word	0x00000000
	.word	t0_data_in_fp
	.word	0x2eb4b656
	.word	0xb7094d1b
	.word	0x900516b1
	.word	0x9b65dbcd
	.word	0xd0659756
	.word	0x7493457b
	.word	0xe14df868
	.word	0xf9e4d5ad
	.word	0x739b4ee2
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
	.word   	0xa2770ead	! [%fp - 0xc]
	.word   	0x5a9464ae	! [%fp - 0x8]
	.word   	0x6a9ce706	! [%fp - 0x4]
.global t0_data_in_fp; t0_data_in_fp:
	.word	0xcb523841
	.word	0x55c1238f
	.word	0xcbd41ecc
	.word	0xfae495ff
	.word	0x1433e47c
	.word	0x65439b59
	.word	0x9645786a
	.word	0xb5731aae
	.word	0x5127ce21
	.word	0xe564cc11
	.word	0x643cb4ec
	.word	0xf7f988aa
	.word	0x05550544
	.word	0xe7112044
	.word	0xd611bf18
	.word	0xea2c7ddd
	.word	0x99c417c6
	.word	0x4b0813f2
	.word	0x6e1b14fb
	.word	0x95b96a9e
	.word	0xba00b9d9
	.word	0x41c78cc9
	.word	0xe1110e0d
	.word	0x32bfc6fe
t0_data_in_stacktop:
	.word	0
t0_data_in_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_in_area0, 0x0cb04000)
.seg "data"
t0_data_in_area0_start:
.skip 128
t0_data_in_area0_begin:
	.word	0xcb0ef2c2	! t0_data_in_area0-0x20
	.word	0x74d80196	! t0_data_in_area0-0x1c
	.word	0x0ddcdf93	! t0_data_in_area0-0x18
	.word	0x6d17c961	! t0_data_in_area0-0x14
	.word	0x9affd1e1	! t0_data_in_area0-0x10
	.word	0xbb6f24f8	! t0_data_in_area0-0xc
	.word	0x82290344	! t0_data_in_area0-0x8
	.word	0x69357250	! t0_data_in_area0-0x4
.global t0_data_in_area0; t0_data_in_area0:
	.word	0x31adefee	! t0_data_in_area0+0x0
	.word	0x79860756	! t0_data_in_area0+0x4
	.word	0xbe3ee42f	! t0_data_in_area0+0x8
	.word	0xed10018e	! t0_data_in_area0+0xc
	.word	0x74ea4085	! t0_data_in_area0+0x10
	.word	0x68dae412	! t0_data_in_area0+0x14
	.word	0xad17f5db	! t0_data_in_area0+0x18
	.word	0x67632868	! t0_data_in_area0+0x1c
t0_data_in_area0_end:
.skip 8000
t0_data_in_area0_stop:

KDATA_MODULE(t0_module_data_in_shm_area, 0x07be0000)
.seg "data"
t0_data_in_shm_area_start:
t0_data_in_shm_area_begin:
.global t0_data_in_shm_area; t0_data_in_shm_area:
	.word	0x0fe5f7e3	! t0_data_in_shm_area+0x0 (t0)
	.word	0xe6dd1d30	! t0_data_in_shm_area+0x4 (t1)
	.word	0x0e260dfe	! t0_data_in_shm_area+0x8 (t0)
	.word	0xa6848220	! t0_data_in_shm_area+0xc (t1)
	.word	0xab4699af	! t0_data_in_shm_area+0x10 (t0)
	.word	0x807cb648	! t0_data_in_shm_area+0x14 (t1)
	.word	0x4f208d51	! t0_data_in_shm_area+0x18 (t0)
	.word	0x6143db18	! t0_data_in_shm_area+0x1c (t1)
	.word	0xb72e88f1	! t0_data_in_shm_area+0x20 (t0)
	.word	0x4a6fb59f	! t0_data_in_shm_area+0x24 (t1)
	.word	0xb54caf0e	! t0_data_in_shm_area+0x28 (t0)
	.word	0xeaa7f183	! t0_data_in_shm_area+0x2c (t1)
	.word	0x52bd7694	! t0_data_in_shm_area+0x30 (t0)
	.word	0xf41cb7c1	! t0_data_in_shm_area+0x34 (t1)
	.word	0x033d74ad	! t0_data_in_shm_area+0x38 (t0)
	.word	0xe74989dd	! t0_data_in_shm_area+0x3c (t1)
	.word	0xb45cff82	! t0_data_in_shm_area+0x40 (t0 bload)
	.word	0xa4d34f4f	! t0_data_in_shm_area+0x44
	.word	0x48c226d8	! t0_data_in_shm_area+0x48
	.word	0x8971a2ed	! t0_data_in_shm_area+0x4c
	.word	0x5eea3ad9	! t0_data_in_shm_area+0x50
	.word	0xa67d5718	! t0_data_in_shm_area+0x54
	.word	0xd8c26055	! t0_data_in_shm_area+0x58
	.word	0x3639cbdb	! t0_data_in_shm_area+0x5c
	.word	0x4eadcc6d	! t0_data_in_shm_area+0x60
	.word	0xd826007e	! t0_data_in_shm_area+0x64
	.word	0xf890fad2	! t0_data_in_shm_area+0x68
	.word	0xeac12336	! t0_data_in_shm_area+0x6c
	.word	0x30a57eef	! t0_data_in_shm_area+0x70
	.word	0x77b26c0c	! t0_data_in_shm_area+0x74
	.word	0xcb0278a8	! t0_data_in_shm_area+0x78
	.word	0x837ae281	! t0_data_in_shm_area+0x7c
	.word	0x03ffc98b	! t0_data_in_shm_area+0x80 (t0 bstore)
	.word	0x7ec3ccb3	! t0_data_in_shm_area+0x84
	.word	0x1b36f5a8	! t0_data_in_shm_area+0x88
	.word	0xb56dd817	! t0_data_in_shm_area+0x8c
	.word	0x7443b36e	! t0_data_in_shm_area+0x90
	.word	0x11cbdeff	! t0_data_in_shm_area+0x94
	.word	0x0759a03c	! t0_data_in_shm_area+0x98
	.word	0xadc15383	! t0_data_in_shm_area+0x9c
	.word	0x1a14eb88	! t0_data_in_shm_area+0xa0
	.word	0x21951f8c	! t0_data_in_shm_area+0xa4
	.word	0xf37c20cb	! t0_data_in_shm_area+0xa8
	.word	0xa03c030e	! t0_data_in_shm_area+0xac
	.word	0xbebb1892	! t0_data_in_shm_area+0xb0
	.word	0xf97374b7	! t0_data_in_shm_area+0xb4
	.word	0x56b69362	! t0_data_in_shm_area+0xb8
	.word	0x335a9698	! t0_data_in_shm_area+0xbc
	.word	0xa193a149	! t0_data_in_shm_area+0xc0 (t1 bload)
	.word	0xb25e6fc0	! t0_data_in_shm_area+0xc4
	.word	0x6076e30d	! t0_data_in_shm_area+0xc8
	.word	0xcf592191	! t0_data_in_shm_area+0xcc
	.word	0x553e5d88	! t0_data_in_shm_area+0xd0
	.word	0x1996e3bf	! t0_data_in_shm_area+0xd4
	.word	0xfd54a2fd	! t0_data_in_shm_area+0xd8
	.word	0x4261f870	! t0_data_in_shm_area+0xdc
	.word	0xf158771d	! t0_data_in_shm_area+0xe0
	.word	0x7a4386e0	! t0_data_in_shm_area+0xe4
	.word	0x3682bc3e	! t0_data_in_shm_area+0xe8
	.word	0x0b40d5b7	! t0_data_in_shm_area+0xec
	.word	0xeb24d164	! t0_data_in_shm_area+0xf0
	.word	0x6c3bee1e	! t0_data_in_shm_area+0xf4
	.word	0x587589a8	! t0_data_in_shm_area+0xf8
	.word	0x1c511966	! t0_data_in_shm_area+0xfc
	.word	0x8a78acc8	! t0_data_in_shm_area+0x100 (t1 bstore)
	.word	0xf2d40172	! t0_data_in_shm_area+0x104
	.word	0x640429d8	! t0_data_in_shm_area+0x108
	.word	0x3d821c47	! t0_data_in_shm_area+0x10c
	.word	0x38c92078	! t0_data_in_shm_area+0x110
	.word	0x8ae08574	! t0_data_in_shm_area+0x114
	.word	0x353071fb	! t0_data_in_shm_area+0x118
	.word	0xe7140c2e	! t0_data_in_shm_area+0x11c
	.word	0x5829fb5a	! t0_data_in_shm_area+0x120
	.word	0xac481b48	! t0_data_in_shm_area+0x124
	.word	0x91fab9ec	! t0_data_in_shm_area+0x128
	.word	0x558fc881	! t0_data_in_shm_area+0x12c
	.word	0x35a5403f	! t0_data_in_shm_area+0x130
	.word	0x2ac9dab7	! t0_data_in_shm_area+0x134
	.word	0x1e9dd581	! t0_data_in_shm_area+0x138
	.word	0x1ac182fa	! t0_data_in_shm_area+0x13c
t0_data_in_shm_area_end:
t0_data_in_shm_area_stop:

KDATA_MODULE(t0_module_data_exp_regs, 0x18aac000)
.seg "data"
KGLOBAL(t0_data_exp_regs)
t0_data_exp_regs_start:
t0_data_exp_regs:
	.word	0xdaa299cd          ! %f0
	.word	0xf470bca3          ! %f1
	.word	0x4b8c67a3          ! %f2
	.word	0xfbb71fda          ! %f3
	.word	0xcb358428          ! %f4
	.word	0xd8b6b165          ! %f5
	.word	0xa8edd40a          ! %f6
	.word	0x0c1b4ea0          ! %f7
	.word	0xf4a929bc          ! %f8
	.word	0xce7cd4f5          ! %f9
	.word	0x6cd501fe          ! %f10
	.word	0xb3ed1afa          ! %f11
	.word	0x824c335a          ! %f12
	.word	0x126a79e8          ! %f13
	.word	0xf9f0d622          ! %f14
	.word	0x5814b247          ! %f15
	.word	0xc88839ab          ! %f16
	.word	0x990974fa          ! %f17
	.word	0xe612fce0          ! %f18
	.word	0x55cf2217          ! %f19
	.word	0xdd50a361          ! %f20
	.word	0x818d712f          ! %f21
	.word	0xb7d715c1          ! %f22
	.word	0xbd3942ed          ! %f23
	.word	0x38e4b2ae          ! %f24
	.word	0xdf79e23b          ! %f25
	.word	0x0640bfff          ! %f26
	.word	0xb7580b46          ! %f27
	.word	0xa1a075f9          ! %f28
	.word	0xd8ca3923          ! %f29
	.word	0x2e555c58          ! %f30
	.word	0x84248eda          ! %f31
	.word	0x691f8fcf          ! %f32
	.word	0xda563f23          ! %f33
	.word	0x4daf9824          ! %f34
	.word	0x48c22e21          ! %f35
	.word	0x2db00a17          ! %f36
	.word	0xeb66bad2          ! %f37
	.word	0xda5815a9          ! %f38
	.word	0x6369ba18          ! %f39
	.word	0xc842a889          ! %f40
	.word	0x820cc383          ! %f41
	.word	0x190fc5ae          ! %f42
	.word	0x81fc9044          ! %f43
	.word	0x5fe96e61          ! %f44
	.word	0xd61066ee          ! %f45
	.word	0xc0edc64d          ! %f46
	.word	0x65def2f7          ! %f47
	.word	0x4fcc4b4f          ! %f48
	.word	0xa6718510          ! %f49
	.word	0x46fbdb0d          ! %f50
	.word	0xb3e921d1          ! %f51
	.word	0x5e8723b0          ! %f52
	.word	0xefc0064f          ! %f53
	.word	0xe399d22f          ! %f54
	.word	0xce32f689          ! %f55
	.word	0xe563a803          ! %f56
	.word	0xce3ecfe0          ! %f57
	.word	0x47216b48          ! %f58
	.word	0xe77609ed          ! %f59
	.word	0xd614af95          ! %f60
	.word	0xf8171a6d          ! %f61
	.word	0xd8c9930f          ! %f62
	.word	0xf0fea527          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0x88c       ! %g1 (code pointer)
	.word	t0_data_exp_shm_area! %g2 (shared area pointer)
	.word	0xf7bc7ae4          ! %g3 (loop index)
	.word	SYM(t0_subr3)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0x9e4ce510          ! %o0
	.word	0xc4d144a2          ! %o1
	.word	0x447f924b          ! %o2
	.word	0xb5cbc879          ! %o3
	.word	0xb1de97dd          ! %o4
	.word	0x326074fe          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0xe5c00a7f          ! %l0
	.word	0x08180ef1          ! %l1
	.word	0x0b610878          ! %l2
	.word	0xe4e40341          ! %l3
	.word	0x8f7efed2          ! %l4
	.word	0x82d8cde6          ! %l5
	.word	0xec65bf01          ! %l6
	.word	0x32c4a6ea          ! %l7
	.word	t0_data_exp_area0   ! %i0 (area pointer)
	.word	t0_data_exp_area0   ! %i1 (area pointer)
	.word	0x00000010          ! %i2 (byte offset)
	.word	0xfffffff8          ! %i3 (halfword offset)
	.word	0x00000018          ! %i4 (word offset)
	.word	0xfffffff8          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0xf1ba1eeb          ! %y
	.word	0x00000002          ! %icc (nzvc)
	.word	0xc0000572          ! %fsr
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

KDATA_MODULE(t0_module_data_exp_stack, 0x3bc34000)
.seg "data"
KGLOBAL(t0_data_exp_mtbl_size)
KGLOBAL(t0_data_exp_mtbl)
KGLOBAL(t0_data_exp_stack)
t0_data_exp_stack_start:
	.word	0xd184736d
	.word	0x5d0c2323
	.word	0xce9a9986
	.word	0x91424696
	.word	0x1c7e3487
	.word	0xe09cd101
	.word	0x78514481
	.word	0xb09325aa
	.word	0x49a72279
	.word	0xab889b5e
	.word	0xd631bbf7
	.word	0x6dfc3bda
	.word	0x132e78bd
	.word	0x78b46662
	.word	0x1bf5aef7
	.word	0x487a381f
	.word	0x6d271763
	.word	0x95e74142
	.word	0xc91b2247
	.word	0x9513ebfb
	.word	0x083c2f25
	.word	0xd7c1a2c5
	.word	0xeb37cc98
	.word	0xb91f4599
	.word	0xeafc1ab9
	.word	0x4f4d6a03
	.word	0x79a981fb
	.word	0x5bd94832
	.word	0xcce6f966
	.word	0x0686a770
	.word	0x481d6293
	.word	0x43daa6b1
	.word	0xeb33deda
	.word	0xb0b97218
	.word	0xfecec08c
	.word	0x2168e499
	.word	0x1b18ac39
	.word	0x76914d2b
	.word	0xdff9f14b
	.word	0xbc3e2126
	.word	0x458de679
	.word	0x087ae1bc
	.word	0xa10e7de6
	.word	0xc85ff0b2
	.word	0x2e491dec
	.word	0x24c110c5
	.word	0xb6ef66d6
	.word	0x9c3fe85a
	.word	0x303dbb1e
	.word	0x3ddaa16e
	.word	0x8e476eeb
	.word	0x98e6bfe1
	.word	0x4e9d44e0
	.word	0xe8ee0f8e
	.word	0xdee2a17f
	.word	0xe5952dd3
	.word	0xc74d73a4
	.word	0xf8e53e71
	.word	0xaa5d87ee
	.word	0x2953e1ed
	.word	0xfc5ba60c
	.word	0x6fc313db
	.word	0x468dc245
	.word	0xd09e41bc
	.word	0xa25a8abc
	.word	0xca893f4d
	.word	0xca0ef738
	.word	0xb1e9cb83
	.word	0x53101377
	.word	0x2c1cb186
	.word	0x389a4f59
	.word	0x33864361
	.word	0xeba70569
	.word	0xe57b884c
	.word	0x447def87
	.word	0x7e710eb3
	.word	0x0cf8bac1
	.word	0x257f726b
	.word	0x75ed26a4
	.word	0x7e7861b7
	.word	0x10b8e983
	.word	0xd493cffe
	.word	0x0f39428a
	.word	0x06b12371
	.word	0x4896839b
	.word	0xe97712ec
	.word	0x518e403e
	.word	0x240cabd1
	.word	0x32020434
	.word	0xbf9323b5
	.word	0x87cdcb66
	.word	0x9509c015
	.word	0xd37abe4a
	.word	0x0df0ce6e
	.word	0xd7d640f8
	.word	0x474e716c
	.word	0xec4a007d
	.word	0x3b867c0a
	.word	0xa52aa934
	.word	0x48aec1db
	.word	0x46ac2228
	.word	0xa2e2bbda
	.word	0xd5cbdcd3
	.word	0x92fe3364
	.word	0xf3d4cdb2
	.word	0x58376156
	.word	0x8a624980
	.word	0xaf48a564
	.word	0xb23d1c23
	.word	0xa9d23a1d
	.word	0x88db0987
	.word	0x2ff1243c
	.word	0x3e7f55fa
	.word	0x985ca03a
	.word	0x5b9242cc
	.word	0x27fb8f34
	.word	0xeeed6d3d
	.word	0x2a0b6ca8
	.word	0xda5000fd
	.word	0xeab0389b
	.word	0x274c84d0
	.word	0xc67d0e18
	.word	0xc4fbff0b
	.word	0xc016e432
	.word	0xedf1190a
	.word	0xc09bc7f0
	.word	0x4d4013d5
	.word	0xbab8c7ca
	.word	0x0b1c9d85
	.word	0x24b65d97
	.word	0xdb983626
	.word	0x3fef722a
	.word	0x8836a435
	.word	0x9b61adef
	.word	0x30ca4be1
	.word	0x0800bc37
	.word	0x5b88e1bb
	.word	0x49da0322
	.word	0xddaf387b
	.word	0xaca6284e
	.word	0x5fc6a2fb
	.word	0xa6c31aa1
	.word	0x3bd9dea8
	.word	0x3da053f4
	.word	0x0a1d87eb
	.word	0x1a92296a
	.word	0xe1400958
	.word	0x99dd5fb1
	.word	0x5f1697ae
	.word	0x55dd6089
	.word	0x72d46fe4
	.word	0x72c37138
	.word	0x7b6c01e0
	.word	0xb180b5e0
	.word	0xad404984
	.word	0x449eb3cb
	.word	0x43692133
	.word	0xd53ff529
	.word	0x1ade2404
	.word	0x35447add
	.word	0xe6af933a
	.word	0xb58a5d3c
	.word	0xd1fef1b7
	.word	0x96f36af8
	.word	0x68957984
	.word	0xa8844d8d
	.word	0x899d82ab
	.word	0xcb92cce0
t0_data_exp_sp:
	.word	0x23fe37ed
	.word	0x91bfc7f9
	.word	0x9433dd1e
	.word	0xe1f16ef9
	.word	0xbdd04430
	.word	0xab54cac1
	.word	0xd3a9292f
	.word	0x95c6b8e5
	.word	t0_data_exp_area0
	.word	t0_data_exp_area0
	.word	0x0000000c
	.word	0xffffffe8
	.word	0x00000018
	.word	0x00000000
	.word	t0_data_exp_fp
	.word	0x2eb4b656
	.word	0xb7094d1b
	.word	0x900516b1
	.word	0x9b65dbcd
	.word	0xd0659756
	.word	0x7493457b
	.word	0xe14df868
	.word	0xf9e4d5ad
	.word	0x739b4ee2
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
	.word   	0xa2770ead	! [%fp - 0xc]
	.word   	0x5a9464ae	! [%fp - 0x8]
	.word   	0x6a9ce706	! [%fp - 0x4]
t0_data_exp_fp:
	.word	0xcb523841
	.word	0x55c1238f
	.word	0xcbd41ecc
	.word	0xfae495ff
	.word	0x1433e47c
	.word	0x65439b59
	.word	0x9645786a
	.word	0xb5731aae
	.word	0x5127ce21
	.word	0xe564cc11
	.word	0x643cb4ec
	.word	0xf7f988aa
	.word	0x05550544
	.word	0xe7112044
	.word	0xd611bf18
	.word	0xea2c7ddd
	.word	0x99c417c6
	.word	0x4b0813f2
	.word	0x6e1b14fb
	.word	0x95b96a9e
	.word	0xba00b9d9
	.word	0x41c78cc9
	.word	0xe1110e0d
	.word	0x32bfc6fe
t0_data_exp_stacktop:
	.word	0
t0_data_exp_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_exp_area0, 0x24e90000)
.seg "data"
t0_data_exp_area0_start:
.skip 128
t0_data_exp_area0_begin:
	.word	0xcb0ef2c2	! t0_data_exp_area0-0x20
	.word	0x74d80196	! t0_data_exp_area0-0x1c
	.word	0x0ddcdf93	! t0_data_exp_area0-0x18
	.word	0x6d17c961	! t0_data_exp_area0-0x14
	.word	0x9affd1e1	! t0_data_exp_area0-0x10
	.word	0xbb6f24f8	! t0_data_exp_area0-0xc
	.word	0x82290344	! t0_data_exp_area0-0x8
	.word	0x69357250	! t0_data_exp_area0-0x4
.global t0_data_exp_area0; t0_data_exp_area0:
	.word	0x31adefee	! t0_data_exp_area0+0x0
	.word	0x79860756	! t0_data_exp_area0+0x4
	.word	0xbe3ee42f	! t0_data_exp_area0+0x8
	.word	0xed10018e	! t0_data_exp_area0+0xc
	.word	0x74ea4085	! t0_data_exp_area0+0x10
	.word	0x68dae412	! t0_data_exp_area0+0x14
	.word	0xad17f5db	! t0_data_exp_area0+0x18
	.word	0x67632868	! t0_data_exp_area0+0x1c
t0_data_exp_area0_end:
.skip 8000
t0_data_exp_area0_stop:

KDATA_MODULE(t0_module_data_exp_shm_area, 0x1ed00000)
.seg "data"
t0_data_exp_shm_area_start:
t0_data_exp_shm_area_begin:
.global t0_data_exp_shm_area; t0_data_exp_shm_area:
	.word	0x0fe5f7e3	! t0_data_exp_shm_area+0x0 (t0)
	.word	0xe6dd1d30	! t0_data_exp_shm_area+0x4 (t1)
	.word	0x0e260dfe	! t0_data_exp_shm_area+0x8 (t0)
	.word	0xa6848220	! t0_data_exp_shm_area+0xc (t1)
	.word	0xab4699af	! t0_data_exp_shm_area+0x10 (t0)
	.word	0x807cb648	! t0_data_exp_shm_area+0x14 (t1)
	.word	0x4f208d51	! t0_data_exp_shm_area+0x18 (t0)
	.word	0x6143db18	! t0_data_exp_shm_area+0x1c (t1)
	.word	0xb72e88f1	! t0_data_exp_shm_area+0x20 (t0)
	.word	0x4a6fb59f	! t0_data_exp_shm_area+0x24 (t1)
	.word	0xb54caf0e	! t0_data_exp_shm_area+0x28 (t0)
	.word	0xeaa7f183	! t0_data_exp_shm_area+0x2c (t1)
	.word	0x52bd7694	! t0_data_exp_shm_area+0x30 (t0)
	.word	0xf41cb7c1	! t0_data_exp_shm_area+0x34 (t1)
	.word	0x033d74ad	! t0_data_exp_shm_area+0x38 (t0)
	.word	0xe74989dd	! t0_data_exp_shm_area+0x3c (t1)
	.word	0xb45cff82	! t0_data_exp_shm_area+0x40 (t0 bload)
	.word	0xa4d34f4f	! t0_data_exp_shm_area+0x44
	.word	0x48c226d8	! t0_data_exp_shm_area+0x48
	.word	0x8971a2ed	! t0_data_exp_shm_area+0x4c
	.word	0x5eea3ad9	! t0_data_exp_shm_area+0x50
	.word	0xa67d5718	! t0_data_exp_shm_area+0x54
	.word	0xd8c26055	! t0_data_exp_shm_area+0x58
	.word	0x3639cbdb	! t0_data_exp_shm_area+0x5c
	.word	0x4eadcc6d	! t0_data_exp_shm_area+0x60
	.word	0xd826007e	! t0_data_exp_shm_area+0x64
	.word	0xf890fad2	! t0_data_exp_shm_area+0x68
	.word	0xeac12336	! t0_data_exp_shm_area+0x6c
	.word	0x30a57eef	! t0_data_exp_shm_area+0x70
	.word	0x77b26c0c	! t0_data_exp_shm_area+0x74
	.word	0xcb0278a8	! t0_data_exp_shm_area+0x78
	.word	0x837ae281	! t0_data_exp_shm_area+0x7c
	.word	0x03ffc98b	! t0_data_exp_shm_area+0x80 (t0 bstore)
	.word	0x7ec3ccb3	! t0_data_exp_shm_area+0x84
	.word	0x1b36f5a8	! t0_data_exp_shm_area+0x88
	.word	0xb56dd817	! t0_data_exp_shm_area+0x8c
	.word	0x7443b36e	! t0_data_exp_shm_area+0x90
	.word	0x11cbdeff	! t0_data_exp_shm_area+0x94
	.word	0x0759a03c	! t0_data_exp_shm_area+0x98
	.word	0xadc15383	! t0_data_exp_shm_area+0x9c
	.word	0x1a14eb88	! t0_data_exp_shm_area+0xa0
	.word	0x21951f8c	! t0_data_exp_shm_area+0xa4
	.word	0xf37c20cb	! t0_data_exp_shm_area+0xa8
	.word	0xa03c030e	! t0_data_exp_shm_area+0xac
	.word	0xbebb1892	! t0_data_exp_shm_area+0xb0
	.word	0xf97374b7	! t0_data_exp_shm_area+0xb4
	.word	0x56b69362	! t0_data_exp_shm_area+0xb8
	.word	0x335a9698	! t0_data_exp_shm_area+0xbc
	.word	0xa193a149	! t0_data_exp_shm_area+0xc0 (t1 bload)
	.word	0xb25e6fc0	! t0_data_exp_shm_area+0xc4
	.word	0x6076e30d	! t0_data_exp_shm_area+0xc8
	.word	0xcf592191	! t0_data_exp_shm_area+0xcc
	.word	0x553e5d88	! t0_data_exp_shm_area+0xd0
	.word	0x1996e3bf	! t0_data_exp_shm_area+0xd4
	.word	0xfd54a2fd	! t0_data_exp_shm_area+0xd8
	.word	0x4261f870	! t0_data_exp_shm_area+0xdc
	.word	0xf158771d	! t0_data_exp_shm_area+0xe0
	.word	0x7a4386e0	! t0_data_exp_shm_area+0xe4
	.word	0x3682bc3e	! t0_data_exp_shm_area+0xe8
	.word	0x0b40d5b7	! t0_data_exp_shm_area+0xec
	.word	0xeb24d164	! t0_data_exp_shm_area+0xf0
	.word	0x6c3bee1e	! t0_data_exp_shm_area+0xf4
	.word	0x587589a8	! t0_data_exp_shm_area+0xf8
	.word	0x1c511966	! t0_data_exp_shm_area+0xfc
	.word	0x8a78acc8	! t0_data_exp_shm_area+0x100 (t1 bstore)
	.word	0xf2d40172	! t0_data_exp_shm_area+0x104
	.word	0x640429d8	! t0_data_exp_shm_area+0x108
	.word	0x3d821c47	! t0_data_exp_shm_area+0x10c
	.word	0x38c92078	! t0_data_exp_shm_area+0x110
	.word	0x8ae08574	! t0_data_exp_shm_area+0x114
	.word	0x353071fb	! t0_data_exp_shm_area+0x118
	.word	0xe7140c2e	! t0_data_exp_shm_area+0x11c
	.word	0x5829fb5a	! t0_data_exp_shm_area+0x120
	.word	0xac481b48	! t0_data_exp_shm_area+0x124
	.word	0x91fab9ec	! t0_data_exp_shm_area+0x128
	.word	0x558fc881	! t0_data_exp_shm_area+0x12c
	.word	0x35a5403f	! t0_data_exp_shm_area+0x130
	.word	0x2ac9dab7	! t0_data_exp_shm_area+0x134
	.word	0x1e9dd581	! t0_data_exp_shm_area+0x138
	.word	0x1ac182fa	! t0_data_exp_shm_area+0x13c
t0_data_exp_shm_area_end:
t0_data_exp_shm_area_stop:

!    kaos version   4.2
!    thread         1
!    icount         405
!    targetid       NIAGARA:SIM
!    hostid         NIAGARA:5.8
!    areas          1
!    areasize       64
!    areaoffset     128
!    ncache         0
!    emulate_ncache 1
!    pagesize       8192
!    invsize        0
!    codecount      414
!    code           2bfbe000
!    entry          2bfbe000
!    fsr_exceptions 00000000
!    fsr_roundmode  00000004
!    fsr_mask       c0000fff
!    seed           000000000099
!    va_map         0000000040400000,000000007fffffff
!    pa_cached      0000000040400000,000000007fffffff
!    pa_noncached   000001ff40000000,000001ff7fffffff
!    weights        /import/n2-aus-localdir1/ntran/n2cdmspp/verif/diag/assembly/kaos/weights_files/simv9.w
!    begcount       0
!    endcount       405
!    dwords         8
!    ldblocks       0
!    stblocks       0
!    ldfsr_words    0
!    annul          2
!    predict        2
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

KTEXT_MODULE(t1_module_ktbl, 0x6bfbe000)
.seg "text"
	KGLOBAL(t1_ktbl)
t1_ktbl_page_begin:
.global t1_kref; t1_kref:
	.skip 0
t1_ktbl:
	.word	0xa69a400a	! t1_kref+0x0:   	xorcc	%o1, %o2, %l3
	.word	0xc807bfe8	! t1_kref+0x4:   	ld	[%fp - 0x18], %g4
	.word	0xa6aa0009	! t1_kref+0x8:   	andncc	%o0, %o1, %l3
	.word	0xc807bfe4	! t1_kref+0xc:   	ld	[%fp - 0x1c], %g4
	.word	0xa6f2fca3	! t1_kref+0x10:   	udivcc	%o3, -0x35d, %l3
	.word	0xec30a004	! t1_kref+0x14:   	sth	%l6, [%g2 + 4]
	.word	0xb5a688d8	! t1_kref+0x18:   	fsubd	%f26, %f24, %f26
	.word	0xb1a0189c	! t1_kref+0x1c:   	fitos	%f28, %f24
	.word	0xe3e65017	! t1_kref+0x20:   	casa	[%i1]0x80, %l7, %l1
	.word	0xd82e6002	! t1_kref+0x24:   	stb	%o4, [%i1 + 2]
	.word	0xa7400000	! t1_kref+0x28:   	mov	%y, %l3
	.word	0xa5a00138	! t1_kref+0x2c:   	fabss	%f24, %f18
	.word	0xb1a68d34	! t1_kref+0x30:   	fsmuld	%f26, %f20, %f24
	.word	0xa622a6ee	! t1_kref+0x34:   	sub	%o2, 0x6ee, %l3
	.word	0xa6636510	! t1_kref+0x38:   	subc	%o5, 0x510, %l3
	.word	0xe40873bc	! t1_kref+0x3c:   	ldub	[%g1 - 0xc44], %l2
	.word	0xa41ca00c	! t1_kref+0x40:   	xor	%l2, 0xc, %l2
	.word	0xe42873bc	! t1_kref+0x44:   	stb	%l2, [%g1 - 0xc44]
	.word	0x81d873bc	! t1_kref+0x48:   	flush	%g1 - 0xc44
	.word	0xa6624000	! t1_kref+0x4c:   	subc	%o1, %g0, %l3
2:	.word	0xa6b2f30f	! t1_kref+0x50:   	orncc	%o3, -0xcf1, %l3
	.word	0xf9ee101c	! t1_kref+0x54:   	prefetcha	%i0 + %i4, 28
	.word	0xa6d5c016	! t1_kref+0x58:   	umulcc	%l7, %l6, %l3
	.word	0xa6423338	! t1_kref+0x5c:   	addc	%o0, -0xcc8, %l3
	.word	0xb1a408da	! t1_kref+0x60:   	fsubd	%f16, %f26, %f24
	.word	0xa9a508dc	! t1_kref+0x64:   	fsubd	%f20, %f28, %f20
	.word	0xe640a01c	! t1_kref+0x68:   	ldsw	[%g2 + 0x1c], %l3
	.word	0x02480007	! t1_kref+0x6c:   	be,pt	%icc, _kref+0x88
	.word	0xa6434008	! t1_kref+0x70:   	addc	%o5, %o0, %l3
	.word	0xa7a00038	! t1_kref+0x74:   	fmovs	%f24, %f19
	.word	0x26480001	! t1_kref+0x78:   	bl,a,pt	%icc, _kref+0x7c
	.word	0xd41e0000	! t1_kref+0x7c:   	ldd	[%i0], %o2
	.word	0xd828a005	! t1_kref+0x80:   	stb	%o4, [%g2 + 5]
	.word	0x91d02070	! t1_kref+0x84:   	ta	%icc, %g0 + 0x70
	.word	0xee20a02c	! t1_kref+0x88:   	st	%l7, [%g2 + 0x2c]
	.word	0xa6424017	! t1_kref+0x8c:   	addc	%o1, %l7, %l3
	.word	0xa62ac000	! t1_kref+0x90:   	andn	%o3, %g0, %l3
	.word	0xa6bb4017	! t1_kref+0x94:   	xnorcc	%o5, %l7, %l3
	.word	0xa6237ac1	! t1_kref+0x98:   	sub	%o5, -0x53f, %l3
	.word	0xa7418000	! t1_kref+0x9c:   	mov	%fprs, %l3
	.word	0x91d0206c	! t1_kref+0xa0:   	ta	%icc, %g0 + 0x6c
	.word	0x2739428a	! t1_kref+0xa4:   	sethi	%hi(0xe50a2800), %l3
	.word	0x02400004	! t1_kref+0xa8:   	be,pn	%icc, _kref+0xb8
	.word	0xd43e3ff0	! t1_kref+0xac:   	std	%o2, [%i0 - 0x10]
	.word	0xe6563ff4	! t1_kref+0xb0:   	ldsh	[%i0 - 0xc], %l3
	.word	0xec1e3fe0	! t1_kref+0xb4:   	ldd	[%i0 - 0x20], %l6
	.word	0x91d02054	! t1_kref+0xb8:   	ta	%icc, %g0 + 0x54
	.word	0xa632ba1d	! t1_kref+0xbc:   	orn	%o2, -0x5e3, %l3
	.word	0xa632aca8	! t1_kref+0xc0:   	orn	%o2, 0xca8, %l3
	.word	0xe656401b	! t1_kref+0xc4:   	ldsh	[%i1 + %i3], %l3
	.word	0xb5a94050	! t1_kref+0xc8:   	fmovdug	%fcc0, %f16, %f26
	.word	0xf700a03c	! t1_kref+0xcc:   	ld	[%g2 + 0x3c], %f27
	.word	0xa5aac058	! t1_kref+0xd0:   	fmovdge	%fcc0, %f24, %f18
	.word	0x16400002	! t1_kref+0xd4:   	bge,pn	%icc, _kref+0xdc
	.word	0xa635c00a	! t1_kref+0xd8:   	orn	%l7, %o2, %l3
	.word	0xec1e2018	! t1_kref+0xdc:   	ldd	[%i0 + 0x18], %l6
	.word	0xbdab003b	! t1_kref+0xe0:   	fmovsuge	%fcc0, %f27, %f30
	.word	0xa67da7f9	! t1_kref+0xe4:   	sdiv	%l6, 0x7f9, %l3
	.word	0xe648a00d	! t1_kref+0xe8:   	ldsb	[%g2 + 0xd], %l3
	.word	0xf007bfe0	! t1_kref+0xec:   	ld	[%fp - 0x20], %i0
	.word	0x17400002	! t1_kref+0xf0:   	fbge,pn	%fcc0, _kref+0xf8
	.word	0xbda01937	! t1_kref+0xf4:   	fstod	%f23, %f30
	.word	0xa6202ee2	! t1_kref+0xf8:   	sub	%g0, 0xee2, %l3
	.word	0xa6f3238f	! t1_kref+0xfc:   	udivcc	%o4, 0x38f, %l3
	.word	0xee28a03d	! t1_kref+0x100:   	stb	%l7, [%g2 + 0x3d]
	.word	0xa6128000	! t1_kref+0x104:   	or	%o2, %g0, %l3
	.word	0xa7a000bc	! t1_kref+0x108:   	fnegs	%f28, %f19
	.word	0xa6520009	! t1_kref+0x10c:   	umul	%o0, %o1, %l3
	.word	0xa635c00a	! t1_kref+0x110:   	orn	%l7, %o2, %l3
	.word	0xa68ac000	! t1_kref+0x114:   	andcc	%o3, %g0, %l3
	.word	0xa6d5ef0e	! t1_kref+0x118:   	umulcc	%l7, 0xf0e, %l3
	.word	0xa6f83ad9	! t1_kref+0x11c:   	sdivcc	%g0, -0x527, %l3
	.word	0xada018dc	! t1_kref+0x120:   	fdtos	%f28, %f22
	.word	0xa73a0000	! t1_kref+0x124:   	sra	%o0, %g0, %l3
	.word	0x2e400004	! t1_kref+0x128:   	bvs,a,pn	%icc, _kref+0x138
	.word	0xf320a024	! t1_kref+0x12c:   	st	%f25, [%g2 + 0x24]
	.word	0xd020a01c	! t1_kref+0x130:   	st	%o0, [%g2 + 0x1c]
	.word	0xb3a4c938	! t1_kref+0x134:   	fmuls	%f19, %f24, %f25
	.word	0xa655ac9d	! t1_kref+0x138:   	umul	%l6, 0xc9d, %l3
	.word	0xe720a024	! t1_kref+0x13c:   	st	%f19, [%g2 + 0x24]
	.word	0xa6dd800a	! t1_kref+0x140:   	smulcc	%l6, %o2, %l3
	.word	0xb3a548b6	! t1_kref+0x144:   	fsubs	%f21, %f22, %f25
	.word	0xa7a64939	! t1_kref+0x148:   	fmuls	%f25, %f25, %f19
	.word	0xa602e272	! t1_kref+0x14c:   	add	%o3, 0x272, %l3
	.word	0xa5a000b5	! t1_kref+0x150:   	fnegs	%f21, %f18
	.word	0xd430a02e	! t1_kref+0x154:   	sth	%o2, [%g2 + 0x2e]
	.word	0xfdee101a	! t1_kref+0x158:   	prefetcha	%i0 + %i2, 30
	.word	0xf500a004	! t1_kref+0x15c:   	ld	[%g2 + 4], %f26
	.word	0xb1a0013e	! t1_kref+0x160:   	fabss	%f30, %f24
	.word	0xfbee101a	! t1_kref+0x164:   	prefetcha	%i0 + %i2, 29
	.word	0xa6b32f02	! t1_kref+0x168:   	orncc	%o4, 0xf02, %l3
	.word	0x270ac68d	! t1_kref+0x16c:   	sethi	%hi(0x2b1a3400), %l3
	.word	0xa662e289	! t1_kref+0x170:   	subc	%o3, 0x289, %l3
	.word	0xada70839	! t1_kref+0x174:   	fadds	%f28, %f25, %f22
	.word	0xd436201c	! t1_kref+0x178:   	sth	%o2, [%i0 + 0x1c]
	.word	0xd2700018	! t1_kref+0x17c:   	stx	%o1, [%g0 + %i0]
	.word	0xb9a00034	! t1_kref+0x180:   	fmovs	%f20, %f28
	.word	0xa6d5bc62	! t1_kref+0x184:   	umulcc	%l6, -0x39e, %l3
	.word	0xa60dc00a	! t1_kref+0x188:   	and	%l7, %o2, %l3
	.word	0xe610a026	! t1_kref+0x18c:   	lduh	[%g2 + 0x26], %l3
	.word	0xa9a50952	! t1_kref+0x190:   	fmuld	%f20, %f18, %f20
	.word	0xc026401c	! t1_kref+0x194:   	clr	[%i1 + %i4]
	.word	0xada00031	! t1_kref+0x198:   	fmovs	%f17, %f22
	.word	0xa9a01913	! t1_kref+0x19c:   	fitod	%f19, %f20
	.word	0xc768a0c5	! t1_kref+0x1a0:   	prefetch	%g2 + 0xc5, 3
	.word	0xe4087534	! t1_kref+0x1a4:   	ldub	[%g1 - 0xacc], %l2
	.word	0xa41ca00c	! t1_kref+0x1a8:   	xor	%l2, 0xc, %l2
	.word	0xe4287534	! t1_kref+0x1ac:   	stb	%l2, [%g1 - 0xacc]
	.word	0x81d87534	! t1_kref+0x1b0:   	flush	%g1 - 0xacc
	.word	0xec6e0000	! t1_kref+0x1b4:   	ldstub	[%i0], %l6
	.word	0xa6436943	! t1_kref+0x1b8:   	addc	%o5, 0x943, %l3
	.word	0x91d02060	! t1_kref+0x1bc:   	ta	%icc, %g0 + 0x60
	.word	0x81580000	! t1_kref+0x1c0:   	flushw
	.word	0xa7400000	! t1_kref+0x1c4:   	mov	%y, %l3
2:	.word	0xe616401b	! t1_kref+0x1c8:   	lduh	[%i1 + %i3], %l3
	.word	0x81af0a56	! t1_kref+0x1cc:   	fcmpd	%fcc0, %f28, %f22
	.word	0xc030a034	! t1_kref+0x1d0:   	clrh	[%g2 + 0x34]
	.word	0xa642ef99	! t1_kref+0x1d4:   	addc	%o3, 0xf99, %l3
	.word	0xe300a024	! t1_kref+0x1d8:   	ld	[%g2 + 0x24], %f17
	.word	0xa6db29e1	! t1_kref+0x1dc:   	smulcc	%o4, 0x9e1, %l3
	.word	0xaba01a35	! t1_kref+0x1e0:   	fstoi	%f21, %f21
	.word	0xe616c019	! t1_kref+0x1e4:   	lduh	[%i3 + %i1], %l3
	.word	0x001fffff	! t1_kref+0x1e8:   	illtrap	0x1fffff
	.word	0x9de3bfa0	! t1_kref+0x1ec:   	save	%sp, -0x60, %sp
	.word	0xa7ef401c	! t1_kref+0x1f0:   	restore	%i5, %i4, %l3
	.word	0xd42e3fe4	! t1_kref+0x1f4:   	stb	%o2, [%i0 - 0x1c]
	.word	0xa7a4493a	! t1_kref+0x1f8:   	fmuls	%f17, %f26, %f19
	.word	0xa6fa36a1	! t1_kref+0x1fc:   	sdivcc	%o0, -0x95f, %l3
	.word	0xa662c009	! t1_kref+0x200:   	subc	%o3, %o1, %l3
	.word	0xa645c000	! t1_kref+0x204:   	addc	%l7, %g0, %l3
	.word	0xd428a014	! t1_kref+0x208:   	stb	%o2, [%g2 + 0x14]
	.word	0xe64e7fee	! t1_kref+0x20c:   	ldsb	[%i1 - 0x12], %l3
	.word	0xe60e401a	! t1_kref+0x210:   	ldub	[%i1 + %i2], %l3
	.word	0xa7332011	! t1_kref+0x214:   	srl	%o4, 0x11, %l3
	.word	0xa6536d68	! t1_kref+0x218:   	umul	%o5, 0xd68, %l3
	.word	0xa63de4ad	! t1_kref+0x21c:   	xnor	%l7, 0x4ad, %l3
	.word	0xa642b3f0	! t1_kref+0x220:   	addc	%o2, -0xc10, %l3
	.word	0x81ac8a3b	! t1_kref+0x224:   	fcmps	%fcc0, %f18, %f27
	.word	0x81aeca33	! t1_kref+0x228:   	fcmps	%fcc0, %f27, %f19
	.word	0xa6b5ecd6	! t1_kref+0x22c:   	orncc	%l7, 0xcd6, %l3
	.word	0xa6f2c00c	! t1_kref+0x230:   	udivcc	%o3, %o4, %l3
	.word	0xa725f952	! t1_kref+0x234:   	mulscc	%l7, -0x6ae, %l3
	.word	0xd4b01019	! t1_kref+0x238:   	stha	%o2, [%g0 + %i1]0x80
	.word	0xf7ee501b	! t1_kref+0x23c:   	prefetcha	%i1 + %i3, 27
	.word	0xa6b2e628	! t1_kref+0x240:   	orncc	%o3, 0x628, %l3
	.word	0xc06e001a	! t1_kref+0x244:   	ldstub	[%i0 + %i2], %g0
	.word	0xa645ffc6	! t1_kref+0x248:   	addc	%l7, -0x3a, %l3
	.word	0x8bd02010	! t1_kref+0x24c:   	tcs	%icc, %g0 + 0x10
	.word	0xada48858	! t1_kref+0x250:   	faddd	%f18, %f24, %f22
	.word	0xa68ab09a	! t1_kref+0x254:   	andcc	%o2, -0xf66, %l3
	.word	0x91d0206c	! t1_kref+0x258:   	ta	%icc, %g0 + 0x6c
	.word	0x81ae0a3a	! t1_kref+0x25c:   	fcmps	%fcc0, %f24, %f26
	.word	0xe608a004	! t1_kref+0x260:   	ldub	[%g2 + 4], %l3
	.word	0x81830000	! t1_kref+0x264:   	wr	%o4, %g0, %y
	.word	0x81dd3121	! t1_kref+0x268:   	flush	%l4 - 0xedf
	.word	0xe600a034	! t1_kref+0x26c:   	ld	[%g2 + 0x34], %l3
	.word	0xe696d040	! t1_kref+0x270:   	lduha	[%i3]0x82, %l3
	.word	0xd0267ff0	! t1_kref+0x274:   	st	%o0, [%i1 - 0x10]
	.word	0xe640a03c	! t1_kref+0x278:   	ldsw	[%g2 + 0x3c], %l3
	.word	0x17800003	! t1_kref+0x27c:   	fbge	_kref+0x288
	.word	0xaba01a38	! t1_kref+0x280:   	fstoi	%f24, %f21
	.word	0xeb00a014	! t1_kref+0x284:   	ld	[%g2 + 0x14], %f21
	.word	0xa612c00c	! t1_kref+0x288:   	or	%o3, %o4, %l3
	.word	0x00400007	! t1_kref+0x28c:   	bn,pn	%icc, _kref+0x2a8
	.word	0xa69da8b4	! t1_kref+0x290:   	xorcc	%l6, 0x8b4, %l3
	.word	0xa3a01a38	! t1_kref+0x294:   	fstoi	%f24, %f17
	.word	0xa635b91a	! t1_kref+0x298:   	orn	%l6, -0x6e6, %l3
	.word	0xa6d236b8	! t1_kref+0x29c:   	umulcc	%o0, -0x948, %l3
	.word	0xda20a004	! t1_kref+0x2a0:   	st	%o5, [%g2 + 4]
	.word	0xec280019	! t1_kref+0x2a4:   	stb	%l6, [%g0 + %i1]
	.word	0x858329c1	! t1_kref+0x2a8:   	wr	%o4, 0x9c1, %ccr
	.word	0xd428a025	! t1_kref+0x2ac:   	stb	%o2, [%g2 + 0x25]
	.word	0xa635800c	! t1_kref+0x2b0:   	orn	%l6, %o4, %l3
	.word	0xf7ee101d	! t1_kref+0x2b4:   	prefetcha	%i0 + %i5, 27
	.word	0xb7a0189c	! t1_kref+0x2b8:   	fitos	%f28, %f27
	.word	0xd43e0000	! t1_kref+0x2bc:   	std	%o2, [%i0]
	.word	0x81af0a5c	! t1_kref+0x2c0:   	fcmpd	%fcc0, %f28, %f28
	.word	0xa9a70d3d	! t1_kref+0x2c4:   	fsmuld	%f28, %f29, %f20
	.word	0xa6bb4000	! t1_kref+0x2c8:   	xnorcc	%o5, %g0, %l3
	.word	0x35800004	! t1_kref+0x2cc:   	fbue,a	_kref+0x2dc
	.word	0xe650a006	! t1_kref+0x2d0:   	ldsh	[%g2 + 6], %l3
	.word	0xe9bf5018	! t1_kref+0x2d4:   	stda	%f20, [%i5 + %i0]0x80
	.word	0xe6400019	! t1_kref+0x2d8:   	ldsw	[%g0 + %i1], %l3
	.word	0xe648a005	! t1_kref+0x2dc:   	ldsb	[%g2 + 5], %l3
	.word	0xa69021f4	! t1_kref+0x2e0:   	orcc	%g0, 0x1f4, %l3
	.word	0xda26601c	! t1_kref+0x2e4:   	st	%o5, [%i1 + 0x1c]
	.word	0x9de3bfa0	! t1_kref+0x2e8:   	save	%sp, -0x60, %sp
	.word	0xa7ef001d	! t1_kref+0x2ec:   	restore	%i4, %i5, %l3
	.word	0xe64e3fe9	! t1_kref+0x2f0:   	ldsb	[%i0 - 0x17], %l3
	.word	0xe6167fea	! t1_kref+0x2f4:   	lduh	[%i1 - 0x16], %l3
	.word	0xa69a8009	! t1_kref+0x2f8:   	xorcc	%o2, %o1, %l3
	.word	0xc02e2011	! t1_kref+0x2fc:   	clrb	[%i0 + 0x11]
	.word	0xb3a549bd	! t1_kref+0x300:   	fdivs	%f21, %f29, %f25
	.word	0xf1067fe8	! t1_kref+0x304:   	ld	[%i1 - 0x18], %f24
	.word	0xa6d2bc72	! t1_kref+0x308:   	umulcc	%o2, -0x38e, %l3
	.word	0xafa54939	! t1_kref+0x30c:   	fmuls	%f21, %f25, %f23
	.word	0x81de2495	! t1_kref+0x310:   	flush	%i0 + 0x495
	.word	0xee366002	! t1_kref+0x314:   	sth	%l7, [%i1 + 2]
	.word	0x8582afb8	! t1_kref+0x318:   	wr	%o2, 0xfb8, %ccr
	.word	0xa69b4000	! t1_kref+0x31c:   	xorcc	%o5, %g0, %l3
	.word	0xa71b6d37	! t1_kref+0x320:   	tsubcctv	%o5, 0xd37, %l3
	.word	0xe648a006	! t1_kref+0x324:   	ldsb	[%g2 + 6], %l3
	.word	0xa613000a	! t1_kref+0x328:   	or	%o4, %o2, %l3
	.word	0xd628a027	! t1_kref+0x32c:   	stb	%o3, [%g2 + 0x27]
	.word	0x81ad8ab1	! t1_kref+0x330:   	fcmpes	%fcc0, %f22, %f17
	.word	0xa6200016	! t1_kref+0x334:   	neg	%l6, %l3
	.word	0xbda7885e	! t1_kref+0x338:   	faddd	%f30, %f30, %f30
	.word	0xf720a01c	! t1_kref+0x33c:   	st	%f27, [%g2 + 0x1c]
	.word	0xa69dc008	! t1_kref+0x340:   	xorcc	%l7, %o0, %l3
	.word	0xe648a00d	! t1_kref+0x344:   	ldsb	[%g2 + 0xd], %l3
	.word	0xa6d22b82	! t1_kref+0x348:   	umulcc	%o0, 0xb82, %l3
	.word	0xa6f82c8a	! t1_kref+0x34c:   	sdivcc	%g0, 0xc8a, %l3
	.word	0x8143e040	! t1_kref+0x350:   	membar	0x40
	.word	0xa73b0017	! t1_kref+0x354:   	sra	%o4, %l7, %l3
	.word	0xd41e0000	! t1_kref+0x358:   	ldd	[%i0], %o2
	.word	0xed070018	! t1_kref+0x35c:   	ld	[%i4 + %i0], %f22
	.word	0xa640000b	! t1_kref+0x360:   	addc	%g0, %o3, %l3
	.word	0xe64e8018	! t1_kref+0x364:   	ldsb	[%i2 + %i0], %l3
	.word	0xc368a008	! t1_kref+0x368:   	prefetch	%g2 + 8, 1
	.word	0xd820a02c	! t1_kref+0x36c:   	st	%o4, [%g2 + 0x2c]
	.word	0xada48854	! t1_kref+0x370:   	faddd	%f18, %f20, %f22
	.word	0xb7a0189d	! t1_kref+0x374:   	fitos	%f29, %f27
	.word	0xa73aa014	! t1_kref+0x378:   	sra	%o2, 0x14, %l3
	.word	0xb9a000b4	! t1_kref+0x37c:   	fnegs	%f20, %f28
	.word	0xd2367fe0	! t1_kref+0x380:   	sth	%o1, [%i1 - 0x20]
	.word	0xb9a000b2	! t1_kref+0x384:   	fnegs	%f18, %f28
	.word	0xb1a90054	! t1_kref+0x388:   	fmovdl	%fcc0, %f20, %f24
	.word	0x22400002	! t1_kref+0x38c:   	be,a,pn	%icc, _kref+0x394
	.word	0xbda608b9	! t1_kref+0x390:   	fsubs	%f24, %f25, %f30
	.word	0xee28a036	! t1_kref+0x394:   	stb	%l7, [%g2 + 0x36]
	.word	0x91d02070	! t1_kref+0x398:   	ta	%icc, %g0 + 0x70
	.word	0xa6fa400a	! t1_kref+0x39c:   	sdivcc	%o1, %o2, %l3
	.word	0xa5a9c056	! t1_kref+0x3a0:   	fmovdu	%fcc0, %f22, %f18
	.word	0x0e400008	! t1_kref+0x3a4:   	bvs,pn	%icc, _kref+0x3c4
	.word	0xc1ee1016	! t1_kref+0x3a8:   	prefetcha	%i0 + %l6, 0
	.word	0xe650a00e	! t1_kref+0x3ac:   	ldsh	[%g2 + 0xe], %l3
	.word	0x16400001	! t1_kref+0x3b0:   	bge,pn	%icc, _kref+0x3b4
	.word	0xa6b2614f	! t1_kref+0x3b4:   	orncc	%o1, 0x14f, %l3
	.word	0xa7a000b8	! t1_kref+0x3b8:   	fnegs	%f24, %f19
	.word	0xe5070018	! t1_kref+0x3bc:   	ld	[%i4 + %i0], %f18
	.word	0xbda78834	! t1_kref+0x3c0:   	fadds	%f30, %f20, %f30
	.word	0xa67b0008	! t1_kref+0x3c4:   	sdiv	%o4, %o0, %l3
	sethi	%hi(2f), %o7
	.word	0xe40be000	! t1_kref+0x3cc:   	ldub	[%o7], %l2
	.word	0xa41ca00c	! t1_kref+0x3d0:   	xor	%l2, 0xc, %l2
	.word	0xe42be000	! t1_kref+0x3d4:   	stb	%l2, [%o7]
	.word	0x81dbe000	! t1_kref+0x3d8:   	flush	%o7
	.word	0xa6fa0017	! t1_kref+0x3dc:   	sdivcc	%o0, %l7, %l3
	.word	0xc9ee1008	! t1_kref+0x3e0:   	prefetcha	%i0 + %o0, 4
	.word	0xe6480019	! t1_kref+0x3e4:   	ldsb	[%g0 + %i1], %l3
	.word	0xa6030009	! t1_kref+0x3e8:   	add	%o4, %o1, %l3
	.word	0x00480003	! t1_kref+0x3ec:   	bn,pt	%icc, _kref+0x3f8
	.word	0xa635b4ac	! t1_kref+0x3f0:   	orn	%l6, -0xb54, %l3
	.word	0x91d02064	! t1_kref+0x3f4:   	ta	%icc, %g0 + 0x64
	.word	0xec2e8018	! t1_kref+0x3f8:   	stb	%l6, [%i2 + %i0]
	.word	0xc53f4000	! t1_kref+0x3fc:   	std	%f2, [%i5]
2:	.word	0xa6502ef7	! t1_kref+0x400:   	umul	%g0, 0xef7, %l3
	.word	0xa5a0015a	! t1_kref+0x404:   	fabsd	%f26, %f18
	.word	0x9de3bfa0	! t1_kref+0x408:   	save	%sp, -0x60, %sp
	.word	0x81c87784	! t1_kref+0x40c:   	return	%g1 - 0x87c
	.word	0xd028a017	! t1_kref+0x410:   	stb	%o0, [%g2 + 0x17]
	.word	0x09480003	! t1_kref+0x414:   	fbl,pt	%fcc0, _kref+0x420
	.word	0xa635800b	! t1_kref+0x418:   	orn	%l6, %o3, %l3
	.word	0x37800001	! t1_kref+0x41c:   	fbge,a	_kref+0x420
	.word	0xb7a788b4	! t1_kref+0x420:   	fsubs	%f30, %f20, %f27
	.word	0xbda789bd	! t1_kref+0x424:   	fdivs	%f30, %f29, %f30
	.word	0x86102002	! t1_kref+0x428:   	mov	0x2, %g3
	.word	0x86a0e001	! t1_kref+0x42c:   	subcc	%g3, 1, %g3
	.word	0x22800012	! t1_kref+0x430:   	be,a	_kref+0x478
	.word	0xa6f26ee8	! t1_kref+0x434:   	udivcc	%o1, 0xee8, %l3
	.word	0xa72de01e	! t1_kref+0x438:   	sll	%l7, 0x1e, %l3
	.word	0xbda588de	! t1_kref+0x43c:   	fsubd	%f22, %f30, %f30
	.word	0xec2e6010	! t1_kref+0x440:   	stb	%l6, [%i1 + 0x10]
	.word	0xd0270018	! t1_kref+0x444:   	st	%o0, [%i4 + %i0]
	.word	0xa6a5800a	! t1_kref+0x448:   	subcc	%l6, %o2, %l3
	.word	0xd43e001d	! t1_kref+0x44c:   	std	%o2, [%i0 + %i5]
	.word	0xa6d2800c	! t1_kref+0x450:   	umulcc	%o2, %o4, %l3
	.word	0xb5a0189c	! t1_kref+0x454:   	fitos	%f28, %f26
	.word	0xa6334000	! t1_kref+0x458:   	orn	%o5, %g0, %l3
	.word	0xd09f5018	! t1_kref+0x45c:   	ldda	[%i5 + %i0]0x80, %o0
	.word	0xf51fbe98	! t1_kref+0x460:   	ldd	[%fp - 0x168], %f26
	.word	0xb9a0189a	! t1_kref+0x464:   	fitos	%f26, %f28
	.word	0xd6270019	! t1_kref+0x468:   	st	%o3, [%i4 + %i1]
	.word	0xb1a509d0	! t1_kref+0x46c:   	fdivd	%f20, %f16, %f24
	.word	0xa69dc008	! t1_kref+0x470:   	xorcc	%l7, %o0, %l3
	.word	0xa5a748bd	! t1_kref+0x474:   	fsubs	%f29, %f29, %f18
	.word	0x17480002	! t1_kref+0x478:   	fbge,pt	%fcc0, _kref+0x480
	.word	0xb1a0191d	! t1_kref+0x47c:   	fitod	%f29, %f24
	.word	0xe648a01d	! t1_kref+0x480:   	ldsb	[%g2 + 0x1d], %l3
	.word	0xed20a01c	! t1_kref+0x484:   	st	%f22, [%g2 + 0x1c]
	.word	0xa6327b43	! t1_kref+0x488:   	orn	%o1, -0x4bd, %l3
	.word	0xa6a58017	! t1_kref+0x48c:   	subcc	%l6, %l7, %l3
	.word	0xd2263ffc	! t1_kref+0x490:   	st	%o1, [%i0 - 4]
	call	SYM(t1_subr3)
	.word	0xc02e0000	! t1_kref+0x498:   	clrb	[%i0]
	.word	0x0c400008	! t1_kref+0x49c:   	bneg,pn	%icc, _kref+0x4bc
	.word	0xa635c009	! t1_kref+0x4a0:   	orn	%l7, %o1, %l3
	.word	0xa69ac000	! t1_kref+0x4a4:   	xorcc	%o3, %g0, %l3
	.word	0xa67b000c	! t1_kref+0x4a8:   	sdiv	%o4, %o4, %l3
	.word	0xafa64935	! t1_kref+0x4ac:   	fmuls	%f25, %f21, %f23
	.word	0xbba748b6	! t1_kref+0x4b0:   	fsubs	%f29, %f22, %f29
	.word	0xe6163fe0	! t1_kref+0x4b4:   	lduh	[%i0 - 0x20], %l3
	.word	0xe500a034	! t1_kref+0x4b8:   	ld	[%g2 + 0x34], %f18
	.word	0xe6100019	! t1_kref+0x4bc:   	lduh	[%g0 + %i1], %l3
	.word	0xa6130017	! t1_kref+0x4c0:   	or	%o4, %l7, %l3
	.word	0xd66e3fef	! t1_kref+0x4c4:   	ldstub	[%i0 - 0x11], %o3
	.word	0x81adcab1	! t1_kref+0x4c8:   	fcmpes	%fcc0, %f23, %f17
	.word	0xa6a2f241	! t1_kref+0x4cc:   	subcc	%o3, -0xdbf, %l3
	.word	0xd630a034	! t1_kref+0x4d0:   	sth	%o3, [%g2 + 0x34]
	.word	0xe6167ff0	! t1_kref+0x4d4:   	lduh	[%i1 - 0x10], %l3
	.word	0xa655b3dd	! t1_kref+0x4d8:   	umul	%l6, -0xc23, %l3
	.word	0xa7223532	! t1_kref+0x4dc:   	mulscc	%o0, -0xace, %l3
	.word	0xa6123ccc	! t1_kref+0x4e0:   	or	%o0, -0x334, %l3
	.word	0xed981018	! t1_kref+0x4e4:   	ldda	[%g0 + %i0]0x80, %f22
	.word	0x1c480008	! t1_kref+0x4e8:   	bpos,pt	%icc, _kref+0x508
	.word	0xe650a01c	! t1_kref+0x4ec:   	ldsh	[%g2 + 0x1c], %l3
	.word	0xf007bfe0	! t1_kref+0x4f0:   	ld	[%fp - 0x20], %i0
	.word	0xd03e2010	! t1_kref+0x4f4:   	std	%o0, [%i0 + 0x10]
	.word	0xd89e1000	! t1_kref+0x4f8:   	ldda	[%i0]0x80, %o4
	.word	0xe616c019	! t1_kref+0x4fc:   	lduh	[%i3 + %i1], %l3
	.word	0xef00a014	! t1_kref+0x500:   	ld	[%g2 + 0x14], %f23
	.word	0x81ad8ade	! t1_kref+0x504:   	fcmped	%fcc0, %f22, %f30
	.word	0x2a480006	! t1_kref+0x508:   	bcs,a,pt	%icc, _kref+0x520
	.word	0xe6000019	! t1_kref+0x50c:   	ld	[%g0 + %i1], %l3
	.word	0xec28a006	! t1_kref+0x510:   	stb	%l6, [%g2 + 6]
	.word	0xf43e401d	! t1_kref+0x514:   	std	%i2, [%i1 + %i5]
	.word	0xef20a03c	! t1_kref+0x518:   	st	%f23, [%g2 + 0x3c]
	.word	0xe60e6016	! t1_kref+0x51c:   	ldub	[%i1 + 0x16], %l3
	.word	0xa68a400d	! t1_kref+0x520:   	andcc	%o1, %o5, %l3
	.word	0xa69ac009	! t1_kref+0x524:   	xorcc	%o3, %o1, %l3
	.word	0x81ad0adc	! t1_kref+0x528:   	fcmped	%fcc0, %f20, %f28
	.word	0xd81e2010	! t1_kref+0x52c:   	ldd	[%i0 + 0x10], %o4
	.word	0xa1a609dc	! t1_kref+0x530:   	fdivd	%f24, %f28, %f16
	.word	0x91d02074	! t1_kref+0x534:   	ta	%icc, %g0 + 0x74
	sethi	%hi(1f), %o7
	save	%sp,-0x60,%sp
	return	%i7+%lo(1f)
	.empty
	.word	0x8585800b	! t1_kref+0x544:   	wr	%l6, %o3, %ccr
	.word	0xaba6c8be	! t1_kref+0x548:   	fsubs	%f27, %f30, %f21
	.word	0xa7037e38	! t1_kref+0x54c:   	taddcc	%o5, -0x1c8, %l3
	.word	0xa6f34017	! t1_kref+0x550:   	udivcc	%o5, %l7, %l3
	.word	0xa6103a72	! t1_kref+0x554:   	mov	0xfffffa72, %l3
	.word	0xf1ee501c	! t1_kref+0x558:   	prefetcha	%i1 + %i4, 24
	.word	0xa5a48856	! t1_kref+0x55c:   	faddd	%f18, %f22, %f18
1:	.word	0xa633247d	! t1_kref+0x560:   	orn	%o4, 0x47d, %l3
	call	SYM(t1_subr1)
	.word	0xa6320008	! t1_kref+0x568:   	orn	%o0, %o0, %l3
	.word	0xf7ee101b	! t1_kref+0x56c:   	prefetcha	%i0 + %i3, 27
	.word	0x9de3bfa0	! t1_kref+0x570:   	save	%sp, -0x60, %sp
	.word	0xb4103367	! t1_kref+0x574:   	mov	0xfffff367, %i2
	.word	0xa7e835c2	! t1_kref+0x578:   	restore	%g0, -0xa3e, %l3
	.word	0x91d02060	! t1_kref+0x57c:   	ta	%icc, %g0 + 0x60
	.word	0xa642e781	! t1_kref+0x580:   	addc	%o3, 0x781, %l3
	.word	0xe656401b	! t1_kref+0x584:   	ldsh	[%i1 + %i3], %l3
	.word	0xa67d8009	! t1_kref+0x588:   	sdiv	%l6, %o1, %l3
	.word	0xafa5c8b9	! t1_kref+0x58c:   	fsubs	%f23, %f25, %f23
	.word	0xd020a03c	! t1_kref+0x590:   	st	%o0, [%g2 + 0x3c]
	.word	0xd828a035	! t1_kref+0x594:   	stb	%o4, [%g2 + 0x35]
	.word	0xe0680018	! t1_kref+0x598:   	ldstub	[%g0 + %i0], %l0
	.word	0xa69a7c79	! t1_kref+0x59c:   	xorcc	%o1, -0x387, %l3
	.word	0xed06601c	! t1_kref+0x5a0:   	ld	[%i1 + 0x1c], %f22
	.word	0xa9a018d4	! t1_kref+0x5a4:   	fdtos	%f20, %f20
	.word	0xec267fe4	! t1_kref+0x5a8:   	st	%l6, [%i1 - 0x1c]
	.word	0xe640a004	! t1_kref+0x5ac:   	ldsw	[%g2 + 4], %l3
	.word	0xa6aa8000	! t1_kref+0x5b0:   	andncc	%o2, %g0, %l3
	.word	0xe610a02e	! t1_kref+0x5b4:   	lduh	[%g2 + 0x2e], %l3
	.word	0xe616600c	! t1_kref+0x5b8:   	lduh	[%i1 + 0xc], %l3
	.word	0xa6a8000c	! t1_kref+0x5bc:   	andncc	%g0, %o4, %l3
	.word	0xa620000c	! t1_kref+0x5c0:   	neg	%o4, %l3
	.word	0x32480002	! t1_kref+0x5c4:   	bne,a,pt	%icc, _kref+0x5cc
	.word	0xe616c019	! t1_kref+0x5c8:   	lduh	[%i3 + %i1], %l3
	.word	0xa5a01036	! t1_kref+0x5cc:   	fstox	%f22, %f18
	.word	0xe640a02c	! t1_kref+0x5d0:   	ldsw	[%g2 + 0x2c], %l3
	.word	0xd020a00c	! t1_kref+0x5d4:   	st	%o0, [%g2 + 0xc]
	.word	0xa73b200b	! t1_kref+0x5d8:   	sra	%o4, 0xb, %l3
	.word	0xa67dc008	! t1_kref+0x5dc:   	sdiv	%l7, %o0, %l3
	.word	0xa64325d2	! t1_kref+0x5e0:   	addc	%o4, 0x5d2, %l3
	.word	0xe786105c	! t1_kref+0x5e4:   	lda	[%i0 + %i4]0x82, %f19
	.word	0xbdaac05c	! t1_kref+0x5e8:   	fmovdge	%fcc0, %f28, %f30
	.word	0xe600a03c	! t1_kref+0x5ec:   	ld	[%g2 + 0x3c], %l3
	.word	0xfb00a004	! t1_kref+0x5f0:   	ld	[%g2 + 4], %f29
	.word	0xd620a00c	! t1_kref+0x5f4:   	st	%o3, [%g2 + 0xc]
	.word	0xbba0003a	! t1_kref+0x5f8:   	fmovs	%f26, %f29
	.word	0xb7a01a35	! t1_kref+0x5fc:   	fstoi	%f21, %f27
	.word	0xa6400000	! t1_kref+0x600:   	addc	%g0, %g0, %l3
	.word	0xb3a018d6	! t1_kref+0x604:   	fdtos	%f22, %f25
	.word	0xfb00a014	! t1_kref+0x608:   	ld	[%g2 + 0x14], %f29
	.word	0xf5ee101c	! t1_kref+0x60c:   	prefetcha	%i0 + %i4, 26
	.word	0xb9a608b7	! t1_kref+0x610:   	fsubs	%f24, %f23, %f28
	.word	0xe610a02c	! t1_kref+0x614:   	lduh	[%g2 + 0x2c], %l3
	.word	0xa5a0015a	! t1_kref+0x618:   	fabsd	%f26, %f18
	.word	0xb3a60938	! t1_kref+0x61c:   	fmuls	%f24, %f24, %f25
	.word	0xe650a034	! t1_kref+0x620:   	ldsh	[%g2 + 0x34], %l3
	.word	0xa6020000	! t1_kref+0x624:   	add	%o0, %g0, %l3
	.word	0xe600a03c	! t1_kref+0x628:   	ld	[%g2 + 0x3c], %l3
	.word	0xe6164000	! t1_kref+0x62c:   	lduh	[%i1], %l3
	.word	0xa6ab4009	! t1_kref+0x630:   	andncc	%o5, %o1, %l3
	.word	0xd01e401d	! t1_kref+0x634:   	ldd	[%i1 + %i5], %o0
	.word	0xa69364e2	! t1_kref+0x638:   	orcc	%o5, 0x4e2, %l3
	.word	0xffee101c	! t1_kref+0x63c:   	prefetcha	%i0 + %i4, 31
	.word	0xa6ddc00a	! t1_kref+0x640:   	smulcc	%l7, %o2, %l3
	.word	0xe26e0000	! t1_kref+0x644:   	ldstub	[%i0], %l1
	.word	0xa69ae84a	! t1_kref+0x648:   	xorcc	%o3, 0x84a, %l3
	.word	0xa5a00152	! t1_kref+0x64c:   	fabsd	%f18, %f18
	.word	0x01000000	! t1_kref+0x650:   	nop
	.word	0x01000000	! t1_kref+0x654:   	nop
	.word	0x01000000	! t1_kref+0x658:   	nop
	.word	0x01000000	! t1_kref+0x65c:   	nop
	.word	0x01000000	! t1_kref+0x660:   	nop
	.word	0x01000000	! t1_kref+0x664:   	nop
	.word	0x01000000	! t1_kref+0x668:   	nop
	.word	0x01000000	! t1_kref+0x66c:   	nop
	call	SYM(_kaos_done)
	.word	0x01000000	! t1_kref+0x674:   	nop
	KGLOBAL(t1_ktbl_end)
t1_ktbl_end:
t1_ktbl_page_end:

KTEXT_MODULE(t1_module_subr0, 0x6bf98000)
.seg "text"
t1_subr0_page_begin:
	.skip 8188
.global _t1_subr0; ENTRY(t1_subr0)
	.word	0xa6844012	! t1_subr0+0x0:   	addcc	%l1, %l2, %l3
	.word	0x81c3e008	! t1_subr0+0x4:   	retl
	.word	0xaa64c014	! t1_subr0+0x8:   	subc	%l3, %l4, %l5
t1_subr0_page_end:

KTEXT_MODULE(t1_module_subr1, 0x6b8d4000)
.seg "text"
t1_subr1_page_begin:
	.skip 8188
.global _t1_subr1; ENTRY(t1_subr1)
	.word	0x9de3bfa0	! t1_subr1+0x0:   	save	%sp, -0x60, %sp
	.word	0xb29eaa5a	! t1_subr1+0x4:   	xorcc	%i2, 0xa5a, %i1
	.word	0x81c7e008	! t1_subr1+0x8:   	ret
	.word	0xa7ee6001	! t1_subr1+0xc:   	restore	%i1, 1, %l3
t1_subr1_page_end:

KTEXT_MODULE(t1_module_subr2, 0x4770a000)
.seg "text"
t1_subr2_page_begin:
	.skip 8180
.global _t1_subr2; ENTRY(t1_subr2)
	.word	0x9de3bfa0	! t1_subr2+0x0:   	save	%sp, -0x60, %sp
	.word	0xb2066001	! t1_subr2+0x4:   	add	%i1, 1, %i1
	.word	0x81c7e008	! t1_subr2+0x8:   	ret
	.word	0xa3ee6001	! t1_subr2+0xc:   	restore	%i1, 1, %l1
t1_subr2_page_end:

KTEXT_MODULE(t1_module_subr3, 0x6c09e000)
.seg "text"
t1_subr3_page_begin:
	.skip 8140
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
!  Total operations: 386   
!
!  Operation frequencies
!
!  name               exp    obs
!  ldsb              1.17   1.04
!  ldub              0.97   0.52
!  ldsh              0.57   0.78
!  lduh              1.61   2.59
!  ld                0.05   0.26
!  ldd               1.24   1.55
!  swap              0.06   0.00
!  ldstub            1.15   1.30
!  stb               1.24   1.81
!  sth               0.68   0.78
!  st                1.05   1.81
!  std               1.30   1.30
!  add               0.38   0.78
!  addcc             0.01   0.00
!  addx              1.49   3.11
!  addxcc            0.22   0.00
!  taddcc            0.28   0.26
!  taddcctv          0.06   0.00
!  sub               1.14   1.30
!  subcc             0.97   0.78
!  subx              0.86   1.04
!  subxcc            0.41   0.00
!  tsubcc            0.28   0.00
!  tsubcctv          0.28   0.26
!  mulscc            0.87   0.52
!  and               0.09   0.26
!  andcc             1.52   0.78
!  andn              0.36   0.26
!  andncc            0.68   1.04
!  or                1.28   1.55
!  orcc              1.08   0.52
!  orn               1.72   3.37
!  orncc             1.06   1.30
!  xor               0.22   0.00
!  xorcc             1.43   2.59
!  xnor              1.06   0.26
!  xnorcc            0.76   0.52
!  sll               0.78   0.26
!  srl               0.52   0.26
!  sra               1.24   1.04
!  unimp             0.30   0.26
!  umul              1.21   1.30
!  smul              0.01   0.00
!  udiv              0.03   0.00
!  sdiv              1.40   1.30
!  umulcc            1.46   1.81
!  smulcc            1.01   0.78
!  udivcc            1.15   1.30
!  sdivcc            1.46   1.30
!  rdy               0.47   0.52
!  wry               0.13   0.26
!  bicc              0.05   0.00
!  sethi             1.29   0.52
!  jmpl              0.54   0.00
!  call              0.34   0.52
!  ticc              0.19   0.26
!  flush             0.35   0.52
!  save              1.00   0.78
!  restore           0.56   0.00
!  stbar             0.28   0.00
!  ldf               1.28   1.04
!  lddf              0.09   0.00
!  stf               0.01   0.00
!  stdf              0.91   0.00
!  fadds             0.54   0.52
!  fsubs             1.12   2.07
!  fmuls             1.04   1.55
!  fdivs             0.69   0.52
!  faddd             1.38   1.04
!  fsubd             1.53   1.04
!  fmuld             0.32   0.26
!  fdivd             1.04   0.52
!  faddq             0.00   0.00
!  fsubq             0.00   0.00
!  fmulq             0.00   0.00
!  fdivq             0.00   0.00
!  fsmuld            0.75   0.52
!  fdmulq            0.00   0.00
!  fitos             0.81   1.30
!  fitod             0.14   0.52
!  fitoq             0.00   0.00
!  fstoi             1.07   1.04
!  fstod             0.39   0.26
!  fstoq             0.00   0.00
!  fdtoi             0.07   0.00
!  fdtos             0.60   0.78
!  fdtoq             0.00   0.00
!  fqtoi             0.00   0.00
!  fqtos             0.00   0.00
!  fqtod             0.00   0.00
!  fmovs             1.23   1.04
!  fnegs             0.91   1.30
!  fabss             1.32   0.52
!  fsqrts            0.00   0.00
!  fsqrtd            0.00   0.00
!  fsqrtq            0.00   0.00
!  fcmps             0.56   0.78
!  fcmpd             0.51   0.52
!  fcmpq             0.00   0.00
!  fcmpes            1.60   0.52
!  fcmped            0.32   0.52
!  fcmpeq            0.00   0.00
!  fbfcc             1.29   0.78
!  ldfsr             0.22   0.00
!  stfsr             0.06   0.00
!  loop              1.02   0.26
!  offset            0.13   0.00
!  area              0.27   0.52
!  target            0.27   0.52
!  goto              0.13   0.00
!  sigsegv           0.12   0.26
!  sigbus            0.11   0.00
!  imodify           0.80   0.78
!  ldfsr_offset      0.14   0.00
!  fpattern          0.43   0.26
!  lbranch           0.10   0.00
!  shmld             5.27   7.25
!  shmst             5.85   6.48
!  shmpf             0.85   0.52
!  shmswap           0.09   0.00
!  shmblkld          0.00   0.00
!  shmblkst          1.16   0.00
!  shmblkchk         0.25   0.26
!  hack_restore      0.20   0.00
!  demap_random_va   0.02   0.00
!  demap_area        0.08   0.00
!  demap_ktbl_text   0.34   0.00
!  demap_ktbl_data   0.10   0.00
!  demap_subr        0.17   0.00
!  demap_reg         0.15   0.00
!  demap_stack       0.01   0.00
!  ro_area           0.00   0.00
!  ro_ktbl_data      0.00   0.00
!  ro_reg            0.00   0.00
!  ro_stack          0.00   0.00
!  set_window        0.33   0.26
!  set_va_wp         0.04   0.00
!  set_pa_wp         0.01   0.00
!  set_softint       0.15   0.52
!  ie_toggle         0.21   0.26
!  set_pil           0.27   0.00
!  set_tso           0.08   0.52
!  set_pso           0.22   0.52
!  set_rmo           0.31   0.26
!  cflush            0.00   0.00
!  return            0.29   0.52
!  casa              0.32   0.26
!  rdasi             0.08   0.00
!  wrasi             0.24   0.00
!  bpcc              3.79   3.89
!  fbpfcc            0.62   0.78
!  fmovscc           0.29   0.26
!  fmovdcc           0.22   1.30
!  fmovqcc           0.00   0.00
!  movcc             0.07   0.00
!  flushw            0.20   0.26
!  membar            0.03   0.00
!  prefetch          0.34   0.00
!  rdpc              0.29   0.00
!  ldqf              0.00   0.00
!  stqf              0.00   0.00
!  ldfa              0.06   0.00
!  lddfa             0.33   0.26
!  ldqfa             0.00   0.00
!  ldsba             0.32   0.00
!  ldsha             0.07   0.00
!  lduba             0.05   0.00
!  lduha             0.01   0.00
!  lda               0.08   0.00
!  ldda              0.26   0.52
!  ldstuba           0.07   0.00
!  prefetcha         1.24   2.85
!  stfa              0.20   0.00
!  stdfa             0.17   0.26
!  stqfa             0.00   0.00
!  stba              0.24   0.00
!  stha              0.02   0.26
!  sta               0.09   0.00
!  stda              0.01   0.00
!  swapa             0.10   0.00
!  fmovd             0.19   0.00
!  fnegd             0.02   0.00
!  fabsd             0.27   0.78
!  fstox             0.03   0.26
!  fdtox             0.00   0.00
!  fxtos             0.14   0.00
!  fxtod             0.18   0.00
!  lds               0.02   0.26
!  ldsa              0.01   0.00
!  ldx               0.24   0.00
!  ldxa              0.20   0.00
!  nofault           0.31   0.52
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
!  partial_st8       0.00   0.00
!  partial_st16      0.00   0.00
!  partial_st32      0.00   0.00
!  short_st8         0.00   0.00
!  short_st16        0.00   0.00
!  short_ld8         0.00   0.00
!  short_ld16        0.00   0.00
!  blkld             0.00   0.00
!  blkst             0.00   0.00
!  blkld_offset      0.00   0.00
!  blkst_offset      0.00   0.00
!  blk_check         0.00   0.00
!  casxa             0.26   0.00
!  rdccr             0.03   0.00
!  rdfprs            0.27   0.26
!  wrccr             0.33   0.78
!  popc              0.00   0.00
!  wrfprs            0.25   0.00
!  stx               0.22   0.26
!  stxa              0.08   0.00
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
KDATA_MODULE(t1_module_offset_table, 0x64cca000)
.seg "data"
t1_offset_table_start:
t1_offset_table_size:	.word	0x00000008
t1_offset_table:
	.word	0x00000000
	.word	0x00000010
	.word	0xfffffff0
	.word	0x00000018
	.word	0xffffffe0
	.word	0xfffffff8
	.word	0xffffffe8
	.word	0x00000008
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

KDATA_MODULE(t1_module_data_in_regs, 0x7eb12000)
.seg "data"
KGLOBAL(t1_data_in_regs)
t1_data_in_regs_start:
t1_data_in_regs:
	.word	0xcf4236ed          ! %f0
	.word	0xc577dbb6          ! %f1
	.word	0xd0be3110          ! %f2
	.word	0x100bc88d          ! %f3
	.word	0xceb119d8          ! %f4
	.word	0xa19bc93e          ! %f5
	.word	0x800125d5          ! %f6
	.word	0xee42f269          ! %f7
	.word	0x46fdcf72          ! %f8
	.word	0x213d779d          ! %f9
	.word	0x3dc213fa          ! %f10
	.word	0xef6ff4a9          ! %f11
	.word	0x404e013f          ! %f12
	.word	0xa2bde468          ! %f13
	.word	0x2bd62256          ! %f14
	.word	0x088024e1          ! %f15
	.word	0x1ac29140          ! %f16
	.word	0x5e066ee4          ! %f17
	.word	0xfb099c74          ! %f18
	.word	0xe179b79b          ! %f19
	.word	0xe4c15aac          ! %f20
	.word	0x23019ca4          ! %f21
	.word	0x04670463          ! %f22
	.word	0xba32cfa2          ! %f23
	.word	0x3f4dc9df          ! %f24
	.word	0xd8c90476          ! %f25
	.word	0xf2fcedc9          ! %f26
	.word	0xc4d3bd7d          ! %f27
	.word	0xf23e7f92          ! %f28
	.word	0x550c8380          ! %f29
	.word	0x69bdf63e          ! %f30
	.word	0xc4bf3339          ! %f31
	.word	0xe44d734c          ! %f32
	.word	0xd4d520a5          ! %f33
	.word	0xdef76ed6          ! %f34
	.word	0xc8e3706c          ! %f35
	.word	0x68e34918          ! %f36
	.word	0xe508422c          ! %f37
	.word	0x29908aff          ! %f38
	.word	0x1723aa75          ! %f39
	.word	0x4655ce78          ! %f40
	.word	0xf83619a3          ! %f41
	.word	0xed0d288e          ! %f42
	.word	0x73b93508          ! %f43
	.word	0x365cd299          ! %f44
	.word	0x7a886a01          ! %f45
	.word	0x7d6c8513          ! %f46
	.word	0x3f602ee9          ! %f47
	.word	0x1effcdc7          ! %f48
	.word	0x8a550c0a          ! %f49
	.word	0xdcad7474          ! %f50
	.word	0xda1bb6f7          ! %f51
	.word	0xbf720c23          ! %f52
	.word	0xd629d4f7          ! %f53
	.word	0xce46ecb9          ! %f54
	.word	0xfa99ed6b          ! %f55
	.word	0xe17a4f92          ! %f56
	.word	0xa65dc355          ! %f57
	.word	0x727cfb24          ! %f58
	.word	0x6c004562          ! %f59
	.word	0x585e1cf8          ! %f60
	.word	0x128d962d          ! %f61
	.word	0x89677684          ! %f62
	.word	0xd96cea98          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t1_kref+0xc94       ! %g1 (code pointer)
	.word	t1_data_in_shm_area ! %g2 (shared area pointer)
	.word	0xd1131cdb          ! %g3 (loop index)
	.word	SYM(t1_subr2)       ! %g4 (jmpl target)
	.word	t1_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0x66a4fec1          ! %o0
	.word	0x58a87bfc          ! %o1
	.word	0x3cf60da9          ! %o2
	.word	0x48ab90e4          ! %o3
	.word	0x8e497493          ! %o4
	.word	0x40e81885          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0xb11828a5          ! %l0
	.word	0x81283264          ! %l1
	.word	0x150102ca          ! %l2
	.word	0xf0023f75          ! %l3
	.word	0xa824960f          ! %l4
	.word	0x22917a65          ! %l5
	.word	0x17ea39dc          ! %l6
	.word	0x6a1db74d          ! %l7
	.word	t1_data_in_area0    ! %i0 (area pointer)
	.word	t1_data_in_area0    ! %i1 (area pointer)
	.word	0x0000001d          ! %i2 (byte offset)
	.word	0xfffffffa          ! %i3 (halfword offset)
	.word	0x0000001c          ! %i4 (word offset)
	.word	0xfffffff8          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0x3751b77c          ! %y
	.word	0x0000000f          ! %icc (nzvc)
	.word	0xc0000979          ! %fsr
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
.global t1_data_in_mtbl_size; t1_data_in_mtbl_size:	.word	253
t1_data_in_regs_end:

.skip 7708	! page align

KDATA_MODULE(t1_module_data_in_stack, 0x7ff7c000)
.seg "data"
KGLOBAL(t1_data_in_mtbl_size)
KGLOBAL(t1_data_in_mtbl)
KGLOBAL(t1_data_in_stack)
t1_data_in_stack_start:
	.word	0x19ce69d8
	.word	0x3d4ad39f
	.word	0x080d147c
	.word	0x0ad49dd3
	.word	0xd588f872
	.word	0x19c79fe3
	.word	0x2a4325ee
	.word	0x4b2909d2
	.word	0xd406403a
	.word	0xa657c9f5
	.word	0x148a8b30
	.word	0x8314a933
	.word	0x7a625c04
	.word	0xa95c4355
	.word	0x09581cfc
	.word	0xc2cd15fa
	.word	0xf67efffc
	.word	0x9644f7e4
	.word	0x18c1e21c
	.word	0x882c53bf
	.word	0x637e52a2
	.word	0xfc88cc95
	.word	0x14dc3a0c
	.word	0x05db4f80
	.word	0xf523d216
	.word	0x60925564
	.word	0xeeec8dde
	.word	0x270408b2
	.word	0xd207c995
	.word	0x2ced7686
	.word	0x1a9bab5d
	.word	0x46d4b799
	.word	0x384e1b43
	.word	0x861164e1
	.word	0x3a502e75
	.word	0xadde84d9
	.word	0x8c59622a
	.word	0x50e5b9be
	.word	0xb77b9cd2
	.word	0x64efa64c
	.word	0x80ffb082
	.word	0x12d88dbc
	.word	0x792b17c6
	.word	0xa6b1f514
	.word	0xa5566e32
	.word	0x1546cf07
	.word	0x44d6c86f
	.word	0x5c5450f4
	.word	0x117f1b96
	.word	0x745746ca
	.word	0x77796a18
	.word	0x5f1664db
	.word	0x7236fc83
	.word	0x3e7c01e1
	.word	0x51ab96df
	.word	0x45f3a0c1
	.word	0x5e87ef87
	.word	0x3cd510d3
	.word	0x8f14ba98
	.word	0xfd237cb6
	.word	0x4418f575
	.word	0x50ead2ff
	.word	0x1a3dcff1
	.word	0x41f25938
	.word	0xa1812d1f
	.word	0xe8e54114
	.word	0x6ff04bd6
	.word	0xf1d790c4
	.word	0x12e84765
	.word	0xf3c8eac6
	.word	0x630ddb16
	.word	0x4ce28eaf
	.word	0x806bb76e
	.word	0x02999bbe
	.word	0x0173d646
	.word	0x52e1ff35
	.word	0xa7702335
	.word	0x1ccddbd1
	.word	0x16478fe5
	.word	0x0d456cd2
	.word	0x247ad847
	.word	0xed7dbe74
	.word	0x4c36e0c1
	.word	0x46eaded0
	.word	0xfaa748ca
	.word	0xb66ab56f
	.word	0x050a9698
	.word	0x1c0f4d21
	.word	0x8488d4c1
	.word	0x3da55ad1
	.word	0x419ea901
	.word	0x38b1fd6e
	.word	0x7089638d
	.word	0x3d716623
	.word	0x382e588c
	.word	0x28281d6f
	.word	0x5cd991b6
	.word	0xbb5740e0
	.word	0xa5209c28
	.word	0xf69f2e7d
	.word	0x4d0f76eb
	.word	0xc655ee23
	.word	0x4e6380c5
	.word	0x9a221664
	.word	0x49dd4847
	.word	0x1c1f39a2
	.word	0x512b5f3a
	.word	0x3d9de97e
	.word	0x42195ad5
	.word	0xf57361db
	.word	0x7fd50c67
	.word	0x0aa0c1fc
	.word	0xbfe54a56
	.word	0x0950b18c
	.word	0x8ff8679e
	.word	0x6f5e3886
	.word	0x3d5a4841
	.word	0xb8febc67
	.word	0x01aaeb3e
	.word	0xf32a5207
	.word	0x25fcd70a
	.word	0x43443306
	.word	0x46c823a1
	.word	0x5d54f6c1
	.word	0xad9a75a7
	.word	0xfe91821c
	.word	0xae103037
	.word	0x7e5d46a7
	.word	0x2e57ff4f
	.word	0x8fd9b0ed
	.word	0x404ab2f2
	.word	0x23155eeb
	.word	0x4edfc384
	.word	0x317632ff
	.word	0x079ed1e5
	.word	0x41c464d4
	.word	0xa30a9a53
	.word	0xaa09a111
	.word	0xf9372f27
	.word	0x03dde9d5
	.word	0x2d4f78da
	.word	0x0a208d4c
	.word	0xe952fafd
	.word	0xf8c2fcdb
	.word	0x41f94a0a
	.word	0x978ee6b8
	.word	0xf0538437
	.word	0x20727ce6
	.word	0xf6db0fae
	.word	0x1a7b9ff1
	.word	0x7667eada
	.word	0x0d5380db
	.word	0xef368fac
	.word	0xa0f38d19
	.word	0xa16ed8ff
	.word	0xa39de897
	.word	0xe40a1189
	.word	0x8df7ad10
	.word	0x27c065fa
	.word	0xd8926b47
	.word	0x793df032
	.word	0xa78a51e2
	.word	0x011087bd
	.word	0xb4f4b6f6
	.word	0x787303f8
	.word	0xc781dc81
	.word	0x26bcb67e
	.word	0x0a4f7567
t1_data_in_sp:
	.word	0x66bf28dc
	.word	0xbc1effb3
	.word	0x84dda698
	.word	0x1ab34a24
	.word	0x1bb5650c
	.word	0xe2cfbe4d
	.word	0x7fa03cae
	.word	0x941f1dd6
	.word	t1_data_in_area0
	.word	t1_data_in_area0
	.word	0xfffffff9
	.word	0x00000010
	.word	0xffffffe8
	.word	0x00000008
	.word	t1_data_in_fp
	.word	0xa1a89d34
	.word	0x17e88f73
	.word	0xc9a67f05
	.word	0xe176dbed
	.word	0x948050b4
	.word	0xf8d25ba3
	.word	0x64a466d9
	.word	0xbba4a0fd
	.word	0xf916a128
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
	.word   	0xbf382cdc	! [%fp - 0xc]
	.word   	0x251b75b7	! [%fp - 0x8]
	.word   	0x63bfa2a6	! [%fp - 0x4]
.global t1_data_in_fp; t1_data_in_fp:
	.word	0x10fc5869
	.word	0x984e7611
	.word	0x45ac5f87
	.word	0xe2be130f
	.word	0x45a9c1d0
	.word	0x23b6ba9a
	.word	0x44331783
	.word	0xaccdb328
	.word	0x95557730
	.word	0x50080a13
	.word	0x55626852
	.word	0x2fa58b33
	.word	0x29368906
	.word	0xed08d683
	.word	0x3ef87956
	.word	0xac1c2786
	.word	0xf1c475ee
	.word	0x622d88c0
	.word	0x4925d541
	.word	0xf75e5d8e
	.word	0x37baa559
	.word	0xc3417712
	.word	0x6f45c5ee
	.word	0x5b5edd17
t1_data_in_stacktop:
	.word	0
t1_data_in_stack_end:
.skip 6300	! page align

KDATA_MODULE(t1_module_data_in_area0, 0x687a6000)
.seg "data"
t1_data_in_area0_start:
.skip 128
t1_data_in_area0_begin:
	.word	0x4acc597d	! t1_data_in_area0-0x20
	.word	0x83562216	! t1_data_in_area0-0x1c
	.word	0x5aa0196e	! t1_data_in_area0-0x18
	.word	0x78d711c9	! t1_data_in_area0-0x14
	.word	0xe4514c8c	! t1_data_in_area0-0x10
	.word	0x916edbe5	! t1_data_in_area0-0xc
	.word	0x1cd9a460	! t1_data_in_area0-0x8
	.word	0xbbb618f5	! t1_data_in_area0-0x4
.global t1_data_in_area0; t1_data_in_area0:
	.word	0xf4026d28	! t1_data_in_area0+0x0
	.word	0x691d3d75	! t1_data_in_area0+0x4
	.word	0xc43a1584	! t1_data_in_area0+0x8
	.word	0x9d62cf91	! t1_data_in_area0+0xc
	.word	0x92616e15	! t1_data_in_area0+0x10
	.word	0xe5a50e3e	! t1_data_in_area0+0x14
	.word	0x4742ee92	! t1_data_in_area0+0x18
	.word	0xd3023c81	! t1_data_in_area0+0x1c
t1_data_in_area0_end:
.skip 8000
t1_data_in_area0_stop:

KDATA_MODULE(t1_module_data_in_shm_area, 0x54da4000)
.seg "data"
t1_data_in_shm_area_start:
t1_data_in_shm_area_begin:
.global t1_data_in_shm_area; t1_data_in_shm_area:
	.word	0x0fe5f7e3	! t1_data_in_shm_area+0x0 (t0)
	.word	0xe6dd1d30	! t1_data_in_shm_area+0x4 (t1)
	.word	0x0e260dfe	! t1_data_in_shm_area+0x8 (t0)
	.word	0xa6848220	! t1_data_in_shm_area+0xc (t1)
	.word	0xab4699af	! t1_data_in_shm_area+0x10 (t0)
	.word	0x807cb648	! t1_data_in_shm_area+0x14 (t1)
	.word	0x4f208d51	! t1_data_in_shm_area+0x18 (t0)
	.word	0x6143db18	! t1_data_in_shm_area+0x1c (t1)
	.word	0xb72e88f1	! t1_data_in_shm_area+0x20 (t0)
	.word	0x4a6fb59f	! t1_data_in_shm_area+0x24 (t1)
	.word	0xb54caf0e	! t1_data_in_shm_area+0x28 (t0)
	.word	0xeaa7f183	! t1_data_in_shm_area+0x2c (t1)
	.word	0x52bd7694	! t1_data_in_shm_area+0x30 (t0)
	.word	0xf41cb7c1	! t1_data_in_shm_area+0x34 (t1)
	.word	0x033d74ad	! t1_data_in_shm_area+0x38 (t0)
	.word	0xe74989dd	! t1_data_in_shm_area+0x3c (t1)
	.word	0xb45cff82	! t1_data_in_shm_area+0x40 (t0 bload)
	.word	0xa4d34f4f	! t1_data_in_shm_area+0x44
	.word	0x48c226d8	! t1_data_in_shm_area+0x48
	.word	0x8971a2ed	! t1_data_in_shm_area+0x4c
	.word	0x5eea3ad9	! t1_data_in_shm_area+0x50
	.word	0xa67d5718	! t1_data_in_shm_area+0x54
	.word	0xd8c26055	! t1_data_in_shm_area+0x58
	.word	0x3639cbdb	! t1_data_in_shm_area+0x5c
	.word	0x4eadcc6d	! t1_data_in_shm_area+0x60
	.word	0xd826007e	! t1_data_in_shm_area+0x64
	.word	0xf890fad2	! t1_data_in_shm_area+0x68
	.word	0xeac12336	! t1_data_in_shm_area+0x6c
	.word	0x30a57eef	! t1_data_in_shm_area+0x70
	.word	0x77b26c0c	! t1_data_in_shm_area+0x74
	.word	0xcb0278a8	! t1_data_in_shm_area+0x78
	.word	0x837ae281	! t1_data_in_shm_area+0x7c
	.word	0x03ffc98b	! t1_data_in_shm_area+0x80 (t0 bstore)
	.word	0x7ec3ccb3	! t1_data_in_shm_area+0x84
	.word	0x1b36f5a8	! t1_data_in_shm_area+0x88
	.word	0xb56dd817	! t1_data_in_shm_area+0x8c
	.word	0x7443b36e	! t1_data_in_shm_area+0x90
	.word	0x11cbdeff	! t1_data_in_shm_area+0x94
	.word	0x0759a03c	! t1_data_in_shm_area+0x98
	.word	0xadc15383	! t1_data_in_shm_area+0x9c
	.word	0x1a14eb88	! t1_data_in_shm_area+0xa0
	.word	0x21951f8c	! t1_data_in_shm_area+0xa4
	.word	0xf37c20cb	! t1_data_in_shm_area+0xa8
	.word	0xa03c030e	! t1_data_in_shm_area+0xac
	.word	0xbebb1892	! t1_data_in_shm_area+0xb0
	.word	0xf97374b7	! t1_data_in_shm_area+0xb4
	.word	0x56b69362	! t1_data_in_shm_area+0xb8
	.word	0x335a9698	! t1_data_in_shm_area+0xbc
	.word	0xa193a149	! t1_data_in_shm_area+0xc0 (t1 bload)
	.word	0xb25e6fc0	! t1_data_in_shm_area+0xc4
	.word	0x6076e30d	! t1_data_in_shm_area+0xc8
	.word	0xcf592191	! t1_data_in_shm_area+0xcc
	.word	0x553e5d88	! t1_data_in_shm_area+0xd0
	.word	0x1996e3bf	! t1_data_in_shm_area+0xd4
	.word	0xfd54a2fd	! t1_data_in_shm_area+0xd8
	.word	0x4261f870	! t1_data_in_shm_area+0xdc
	.word	0xf158771d	! t1_data_in_shm_area+0xe0
	.word	0x7a4386e0	! t1_data_in_shm_area+0xe4
	.word	0x3682bc3e	! t1_data_in_shm_area+0xe8
	.word	0x0b40d5b7	! t1_data_in_shm_area+0xec
	.word	0xeb24d164	! t1_data_in_shm_area+0xf0
	.word	0x6c3bee1e	! t1_data_in_shm_area+0xf4
	.word	0x587589a8	! t1_data_in_shm_area+0xf8
	.word	0x1c511966	! t1_data_in_shm_area+0xfc
	.word	0x8a78acc8	! t1_data_in_shm_area+0x100 (t1 bstore)
	.word	0xf2d40172	! t1_data_in_shm_area+0x104
	.word	0x640429d8	! t1_data_in_shm_area+0x108
	.word	0x3d821c47	! t1_data_in_shm_area+0x10c
	.word	0x38c92078	! t1_data_in_shm_area+0x110
	.word	0x8ae08574	! t1_data_in_shm_area+0x114
	.word	0x353071fb	! t1_data_in_shm_area+0x118
	.word	0xe7140c2e	! t1_data_in_shm_area+0x11c
	.word	0x5829fb5a	! t1_data_in_shm_area+0x120
	.word	0xac481b48	! t1_data_in_shm_area+0x124
	.word	0x91fab9ec	! t1_data_in_shm_area+0x128
	.word	0x558fc881	! t1_data_in_shm_area+0x12c
	.word	0x35a5403f	! t1_data_in_shm_area+0x130
	.word	0x2ac9dab7	! t1_data_in_shm_area+0x134
	.word	0x1e9dd581	! t1_data_in_shm_area+0x138
	.word	0x1ac182fa	! t1_data_in_shm_area+0x13c
t1_data_in_shm_area_end:
t1_data_in_shm_area_stop:

KDATA_MODULE(t1_module_data_exp_regs, 0x6f78c000)
.seg "data"
KGLOBAL(t1_data_exp_regs)
t1_data_exp_regs_start:
t1_data_exp_regs:
	.word	0xcf4236ed          ! %f0
	.word	0xc577dbb6          ! %f1
	.word	0xd0be3110          ! %f2
	.word	0x100bc88d          ! %f3
	.word	0xceb119d8          ! %f4
	.word	0xa19bc93e          ! %f5
	.word	0x800125d5          ! %f6
	.word	0xee42f269          ! %f7
	.word	0x46fdcf72          ! %f8
	.word	0x213d779d          ! %f9
	.word	0x3dc213fa          ! %f10
	.word	0xef6ff4a9          ! %f11
	.word	0x404e013f          ! %f12
	.word	0xa2bde468          ! %f13
	.word	0x2bd62256          ! %f14
	.word	0x088024e1          ! %f15
	.word	0x1ac29140          ! %f16
	.word	0x5e066ee4          ! %f17
	.word	0xfb099c74          ! %f18
	.word	0xe179b79b          ! %f19
	.word	0xe4c15aac          ! %f20
	.word	0x23019ca4          ! %f21
	.word	0x04670463          ! %f22
	.word	0xba32cfa2          ! %f23
	.word	0x3f4dc9df          ! %f24
	.word	0xd8c90476          ! %f25
	.word	0xf2fcedc9          ! %f26
	.word	0xc4d3bd7d          ! %f27
	.word	0xf23e7f92          ! %f28
	.word	0x550c8380          ! %f29
	.word	0x69bdf63e          ! %f30
	.word	0xc4bf3339          ! %f31
	.word	0xe44d734c          ! %f32
	.word	0xd4d520a5          ! %f33
	.word	0xdef76ed6          ! %f34
	.word	0xc8e3706c          ! %f35
	.word	0x68e34918          ! %f36
	.word	0xe508422c          ! %f37
	.word	0x29908aff          ! %f38
	.word	0x1723aa75          ! %f39
	.word	0x4655ce78          ! %f40
	.word	0xf83619a3          ! %f41
	.word	0xed0d288e          ! %f42
	.word	0x73b93508          ! %f43
	.word	0x365cd299          ! %f44
	.word	0x7a886a01          ! %f45
	.word	0x7d6c8513          ! %f46
	.word	0x3f602ee9          ! %f47
	.word	0x1effcdc7          ! %f48
	.word	0x8a550c0a          ! %f49
	.word	0xdcad7474          ! %f50
	.word	0xda1bb6f7          ! %f51
	.word	0xbf720c23          ! %f52
	.word	0xd629d4f7          ! %f53
	.word	0xce46ecb9          ! %f54
	.word	0xfa99ed6b          ! %f55
	.word	0xe17a4f92          ! %f56
	.word	0xa65dc355          ! %f57
	.word	0x727cfb24          ! %f58
	.word	0x6c004562          ! %f59
	.word	0x585e1cf8          ! %f60
	.word	0x128d962d          ! %f61
	.word	0x89677684          ! %f62
	.word	0xd96cea98          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t1_kref+0xc94       ! %g1 (code pointer)
	.word	t1_data_exp_shm_area! %g2 (shared area pointer)
	.word	0xd1131cdb          ! %g3 (loop index)
	.word	SYM(t1_subr2)       ! %g4 (jmpl target)
	.word	t1_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0x66a4fec1          ! %o0
	.word	0x58a87bfc          ! %o1
	.word	0x3cf60da9          ! %o2
	.word	0x48ab90e4          ! %o3
	.word	0x8e497493          ! %o4
	.word	0x40e81885          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0xb11828a5          ! %l0
	.word	0x81283264          ! %l1
	.word	0x150102ca          ! %l2
	.word	0xf0023f75          ! %l3
	.word	0xa824960f          ! %l4
	.word	0x22917a65          ! %l5
	.word	0x17ea39dc          ! %l6
	.word	0x6a1db74d          ! %l7
	.word	t1_data_exp_area0   ! %i0 (area pointer)
	.word	t1_data_exp_area0   ! %i1 (area pointer)
	.word	0x0000001d          ! %i2 (byte offset)
	.word	0xfffffffa          ! %i3 (halfword offset)
	.word	0x0000001c          ! %i4 (word offset)
	.word	0xfffffff8          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0x3751b77c          ! %y
	.word	0x0000000f          ! %icc (nzvc)
	.word	0xc0000979          ! %fsr
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
t1_data_exp_mtbl_size:	.word	253
t1_data_exp_regs_end:

.skip 7708	! page align

KDATA_MODULE(t1_module_data_exp_stack, 0x44cb2000)
.seg "data"
KGLOBAL(t1_data_exp_mtbl_size)
KGLOBAL(t1_data_exp_mtbl)
KGLOBAL(t1_data_exp_stack)
t1_data_exp_stack_start:
	.word	0x19ce69d8
	.word	0x3d4ad39f
	.word	0x080d147c
	.word	0x0ad49dd3
	.word	0xd588f872
	.word	0x19c79fe3
	.word	0x2a4325ee
	.word	0x4b2909d2
	.word	0xd406403a
	.word	0xa657c9f5
	.word	0x148a8b30
	.word	0x8314a933
	.word	0x7a625c04
	.word	0xa95c4355
	.word	0x09581cfc
	.word	0xc2cd15fa
	.word	0xf67efffc
	.word	0x9644f7e4
	.word	0x18c1e21c
	.word	0x882c53bf
	.word	0x637e52a2
	.word	0xfc88cc95
	.word	0x14dc3a0c
	.word	0x05db4f80
	.word	0xf523d216
	.word	0x60925564
	.word	0xeeec8dde
	.word	0x270408b2
	.word	0xd207c995
	.word	0x2ced7686
	.word	0x1a9bab5d
	.word	0x46d4b799
	.word	0x384e1b43
	.word	0x861164e1
	.word	0x3a502e75
	.word	0xadde84d9
	.word	0x8c59622a
	.word	0x50e5b9be
	.word	0xb77b9cd2
	.word	0x64efa64c
	.word	0x80ffb082
	.word	0x12d88dbc
	.word	0x792b17c6
	.word	0xa6b1f514
	.word	0xa5566e32
	.word	0x1546cf07
	.word	0x44d6c86f
	.word	0x5c5450f4
	.word	0x117f1b96
	.word	0x745746ca
	.word	0x77796a18
	.word	0x5f1664db
	.word	0x7236fc83
	.word	0x3e7c01e1
	.word	0x51ab96df
	.word	0x45f3a0c1
	.word	0x5e87ef87
	.word	0x3cd510d3
	.word	0x8f14ba98
	.word	0xfd237cb6
	.word	0x4418f575
	.word	0x50ead2ff
	.word	0x1a3dcff1
	.word	0x41f25938
	.word	0xa1812d1f
	.word	0xe8e54114
	.word	0x6ff04bd6
	.word	0xf1d790c4
	.word	0x12e84765
	.word	0xf3c8eac6
	.word	0x630ddb16
	.word	0x4ce28eaf
	.word	0x806bb76e
	.word	0x02999bbe
	.word	0x0173d646
	.word	0x52e1ff35
	.word	0xa7702335
	.word	0x1ccddbd1
	.word	0x16478fe5
	.word	0x0d456cd2
	.word	0x247ad847
	.word	0xed7dbe74
	.word	0x4c36e0c1
	.word	0x46eaded0
	.word	0xfaa748ca
	.word	0xb66ab56f
	.word	0x050a9698
	.word	0x1c0f4d21
	.word	0x8488d4c1
	.word	0x3da55ad1
	.word	0x419ea901
	.word	0x38b1fd6e
	.word	0x7089638d
	.word	0x3d716623
	.word	0x382e588c
	.word	0x28281d6f
	.word	0x5cd991b6
	.word	0xbb5740e0
	.word	0xa5209c28
	.word	0xf69f2e7d
	.word	0x4d0f76eb
	.word	0xc655ee23
	.word	0x4e6380c5
	.word	0x9a221664
	.word	0x49dd4847
	.word	0x1c1f39a2
	.word	0x512b5f3a
	.word	0x3d9de97e
	.word	0x42195ad5
	.word	0xf57361db
	.word	0x7fd50c67
	.word	0x0aa0c1fc
	.word	0xbfe54a56
	.word	0x0950b18c
	.word	0x8ff8679e
	.word	0x6f5e3886
	.word	0x3d5a4841
	.word	0xb8febc67
	.word	0x01aaeb3e
	.word	0xf32a5207
	.word	0x25fcd70a
	.word	0x43443306
	.word	0x46c823a1
	.word	0x5d54f6c1
	.word	0xad9a75a7
	.word	0xfe91821c
	.word	0xae103037
	.word	0x7e5d46a7
	.word	0x2e57ff4f
	.word	0x8fd9b0ed
	.word	0x404ab2f2
	.word	0x23155eeb
	.word	0x4edfc384
	.word	0x317632ff
	.word	0x079ed1e5
	.word	0x41c464d4
	.word	0xa30a9a53
	.word	0xaa09a111
	.word	0xf9372f27
	.word	0x03dde9d5
	.word	0x2d4f78da
	.word	0x0a208d4c
	.word	0xe952fafd
	.word	0xf8c2fcdb
	.word	0x41f94a0a
	.word	0x978ee6b8
	.word	0xf0538437
	.word	0x20727ce6
	.word	0xf6db0fae
	.word	0x1a7b9ff1
	.word	0x7667eada
	.word	0x0d5380db
	.word	0xef368fac
	.word	0xa0f38d19
	.word	0xa16ed8ff
	.word	0xa39de897
	.word	0xe40a1189
	.word	0x8df7ad10
	.word	0x27c065fa
	.word	0xd8926b47
	.word	0x793df032
	.word	0xa78a51e2
	.word	0x011087bd
	.word	0xb4f4b6f6
	.word	0x787303f8
	.word	0xc781dc81
	.word	0x26bcb67e
	.word	0x0a4f7567
t1_data_exp_sp:
	.word	0x66bf28dc
	.word	0xbc1effb3
	.word	0x84dda698
	.word	0x1ab34a24
	.word	0x1bb5650c
	.word	0xe2cfbe4d
	.word	0x7fa03cae
	.word	0x941f1dd6
	.word	t1_data_exp_area0
	.word	t1_data_exp_area0
	.word	0xfffffff9
	.word	0x00000010
	.word	0xffffffe8
	.word	0x00000008
	.word	t1_data_exp_fp
	.word	0xa1a89d34
	.word	0x17e88f73
	.word	0xc9a67f05
	.word	0xe176dbed
	.word	0x948050b4
	.word	0xf8d25ba3
	.word	0x64a466d9
	.word	0xbba4a0fd
	.word	0xf916a128
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
	.word   	0xbf382cdc	! [%fp - 0xc]
	.word   	0x251b75b7	! [%fp - 0x8]
	.word   	0x63bfa2a6	! [%fp - 0x4]
t1_data_exp_fp:
	.word	0x10fc5869
	.word	0x984e7611
	.word	0x45ac5f87
	.word	0xe2be130f
	.word	0x45a9c1d0
	.word	0x23b6ba9a
	.word	0x44331783
	.word	0xaccdb328
	.word	0x95557730
	.word	0x50080a13
	.word	0x55626852
	.word	0x2fa58b33
	.word	0x29368906
	.word	0xed08d683
	.word	0x3ef87956
	.word	0xac1c2786
	.word	0xf1c475ee
	.word	0x622d88c0
	.word	0x4925d541
	.word	0xf75e5d8e
	.word	0x37baa559
	.word	0xc3417712
	.word	0x6f45c5ee
	.word	0x5b5edd17
t1_data_exp_stacktop:
	.word	0
t1_data_exp_stack_end:
.skip 6300	! page align

KDATA_MODULE(t1_module_data_exp_area0, 0x710e2000)
.seg "data"
t1_data_exp_area0_start:
.skip 128
t1_data_exp_area0_begin:
	.word	0x4acc597d	! t1_data_exp_area0-0x20
	.word	0x83562216	! t1_data_exp_area0-0x1c
	.word	0x5aa0196e	! t1_data_exp_area0-0x18
	.word	0x78d711c9	! t1_data_exp_area0-0x14
	.word	0xe4514c8c	! t1_data_exp_area0-0x10
	.word	0x916edbe5	! t1_data_exp_area0-0xc
	.word	0x1cd9a460	! t1_data_exp_area0-0x8
	.word	0xbbb618f5	! t1_data_exp_area0-0x4
.global t1_data_exp_area0; t1_data_exp_area0:
	.word	0xf4026d28	! t1_data_exp_area0+0x0
	.word	0x691d3d75	! t1_data_exp_area0+0x4
	.word	0xc43a1584	! t1_data_exp_area0+0x8
	.word	0x9d62cf91	! t1_data_exp_area0+0xc
	.word	0x92616e15	! t1_data_exp_area0+0x10
	.word	0xe5a50e3e	! t1_data_exp_area0+0x14
	.word	0x4742ee92	! t1_data_exp_area0+0x18
	.word	0xd3023c81	! t1_data_exp_area0+0x1c
t1_data_exp_area0_end:
.skip 8000
t1_data_exp_area0_stop:

KDATA_MODULE(t1_module_data_exp_shm_area, 0x4a876000)
.seg "data"
t1_data_exp_shm_area_start:
t1_data_exp_shm_area_begin:
.global t1_data_exp_shm_area; t1_data_exp_shm_area:
	.word	0x0fe5f7e3	! t1_data_exp_shm_area+0x0 (t0)
	.word	0xe6dd1d30	! t1_data_exp_shm_area+0x4 (t1)
	.word	0x0e260dfe	! t1_data_exp_shm_area+0x8 (t0)
	.word	0xa6848220	! t1_data_exp_shm_area+0xc (t1)
	.word	0xab4699af	! t1_data_exp_shm_area+0x10 (t0)
	.word	0x807cb648	! t1_data_exp_shm_area+0x14 (t1)
	.word	0x4f208d51	! t1_data_exp_shm_area+0x18 (t0)
	.word	0x6143db18	! t1_data_exp_shm_area+0x1c (t1)
	.word	0xb72e88f1	! t1_data_exp_shm_area+0x20 (t0)
	.word	0x4a6fb59f	! t1_data_exp_shm_area+0x24 (t1)
	.word	0xb54caf0e	! t1_data_exp_shm_area+0x28 (t0)
	.word	0xeaa7f183	! t1_data_exp_shm_area+0x2c (t1)
	.word	0x52bd7694	! t1_data_exp_shm_area+0x30 (t0)
	.word	0xf41cb7c1	! t1_data_exp_shm_area+0x34 (t1)
	.word	0x033d74ad	! t1_data_exp_shm_area+0x38 (t0)
	.word	0xe74989dd	! t1_data_exp_shm_area+0x3c (t1)
	.word	0xb45cff82	! t1_data_exp_shm_area+0x40 (t0 bload)
	.word	0xa4d34f4f	! t1_data_exp_shm_area+0x44
	.word	0x48c226d8	! t1_data_exp_shm_area+0x48
	.word	0x8971a2ed	! t1_data_exp_shm_area+0x4c
	.word	0x5eea3ad9	! t1_data_exp_shm_area+0x50
	.word	0xa67d5718	! t1_data_exp_shm_area+0x54
	.word	0xd8c26055	! t1_data_exp_shm_area+0x58
	.word	0x3639cbdb	! t1_data_exp_shm_area+0x5c
	.word	0x4eadcc6d	! t1_data_exp_shm_area+0x60
	.word	0xd826007e	! t1_data_exp_shm_area+0x64
	.word	0xf890fad2	! t1_data_exp_shm_area+0x68
	.word	0xeac12336	! t1_data_exp_shm_area+0x6c
	.word	0x30a57eef	! t1_data_exp_shm_area+0x70
	.word	0x77b26c0c	! t1_data_exp_shm_area+0x74
	.word	0xcb0278a8	! t1_data_exp_shm_area+0x78
	.word	0x837ae281	! t1_data_exp_shm_area+0x7c
	.word	0x03ffc98b	! t1_data_exp_shm_area+0x80 (t0 bstore)
	.word	0x7ec3ccb3	! t1_data_exp_shm_area+0x84
	.word	0x1b36f5a8	! t1_data_exp_shm_area+0x88
	.word	0xb56dd817	! t1_data_exp_shm_area+0x8c
	.word	0x7443b36e	! t1_data_exp_shm_area+0x90
	.word	0x11cbdeff	! t1_data_exp_shm_area+0x94
	.word	0x0759a03c	! t1_data_exp_shm_area+0x98
	.word	0xadc15383	! t1_data_exp_shm_area+0x9c
	.word	0x1a14eb88	! t1_data_exp_shm_area+0xa0
	.word	0x21951f8c	! t1_data_exp_shm_area+0xa4
	.word	0xf37c20cb	! t1_data_exp_shm_area+0xa8
	.word	0xa03c030e	! t1_data_exp_shm_area+0xac
	.word	0xbebb1892	! t1_data_exp_shm_area+0xb0
	.word	0xf97374b7	! t1_data_exp_shm_area+0xb4
	.word	0x56b69362	! t1_data_exp_shm_area+0xb8
	.word	0x335a9698	! t1_data_exp_shm_area+0xbc
	.word	0xa193a149	! t1_data_exp_shm_area+0xc0 (t1 bload)
	.word	0xb25e6fc0	! t1_data_exp_shm_area+0xc4
	.word	0x6076e30d	! t1_data_exp_shm_area+0xc8
	.word	0xcf592191	! t1_data_exp_shm_area+0xcc
	.word	0x553e5d88	! t1_data_exp_shm_area+0xd0
	.word	0x1996e3bf	! t1_data_exp_shm_area+0xd4
	.word	0xfd54a2fd	! t1_data_exp_shm_area+0xd8
	.word	0x4261f870	! t1_data_exp_shm_area+0xdc
	.word	0xf158771d	! t1_data_exp_shm_area+0xe0
	.word	0x7a4386e0	! t1_data_exp_shm_area+0xe4
	.word	0x3682bc3e	! t1_data_exp_shm_area+0xe8
	.word	0x0b40d5b7	! t1_data_exp_shm_area+0xec
	.word	0xeb24d164	! t1_data_exp_shm_area+0xf0
	.word	0x6c3bee1e	! t1_data_exp_shm_area+0xf4
	.word	0x587589a8	! t1_data_exp_shm_area+0xf8
	.word	0x1c511966	! t1_data_exp_shm_area+0xfc
	.word	0x8a78acc8	! t1_data_exp_shm_area+0x100 (t1 bstore)
	.word	0xf2d40172	! t1_data_exp_shm_area+0x104
	.word	0x640429d8	! t1_data_exp_shm_area+0x108
	.word	0x3d821c47	! t1_data_exp_shm_area+0x10c
	.word	0x38c92078	! t1_data_exp_shm_area+0x110
	.word	0x8ae08574	! t1_data_exp_shm_area+0x114
	.word	0x353071fb	! t1_data_exp_shm_area+0x118
	.word	0xe7140c2e	! t1_data_exp_shm_area+0x11c
	.word	0x5829fb5a	! t1_data_exp_shm_area+0x120
	.word	0xac481b48	! t1_data_exp_shm_area+0x124
	.word	0x91fab9ec	! t1_data_exp_shm_area+0x128
	.word	0x558fc881	! t1_data_exp_shm_area+0x12c
	.word	0x35a5403f	! t1_data_exp_shm_area+0x130
	.word	0x2ac9dab7	! t1_data_exp_shm_area+0x134
	.word	0x1e9dd581	! t1_data_exp_shm_area+0x138
	.word	0x1ac182fa	! t1_data_exp_shm_area+0x13c
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



#endif ! if NIAGARA2




