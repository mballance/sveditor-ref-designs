/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: kaos_02_06_2004_135.s
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
#define T0_KAOS_SEED          d2b394eb4e4b
#define T0_KAOS_ICOUNT        4000
#define T0_KAOS_AREAS         1
#define T0_KAOS_AREASIZE      64
#define T0_KAOS_AREAOFFSET    1664
#define T0_KAOS_PAGESIZE      8192
#define T0_KAOS_CODECOUNT     4004

#define T0_KAOS_BOOT_VA                  0x0c33c000
#define T0_KAOS_BOOT_PA                  0x0000000000b20000
#define T0_KAOS_BOOT_CACHEABLE           1
#define T0_KAOS_BOOT_NONCACHEABLE        0

#define T0_KAOS_STARTUP_VA               0x193c2000
#define T0_KAOS_STARTUP_PA               0x00000000029bc000
#define T0_KAOS_STARTUP_CACHEABLE        1
#define T0_KAOS_STARTUP_NONCACHEABLE     0

#define T0_KAOS_OFFSET_TBL_VA            0x4dc2c000
#define T0_KAOS_OFFSET_TBL_PA            0x000000000463a000
#define T0_KAOS_OFFSET_TBL_CACHEABLE     1
#define T0_KAOS_OFFSET_TBL_NONCACHEABLE  0

#define T0_KAOS_DONE_VA                  0x11b0c000
#define T0_KAOS_DONE_PA                  0x00000000065a4000
#define T0_KAOS_DONE_CACHEABLE           1
#define T0_KAOS_DONE_NONCACHEABLE        0

#define T0_KAOS_KTBL_VA                  0x0d912000
#define T0_KAOS_KTBL_PA                  0x0000000008312000
#define T0_KAOS_KTBL_CACHEABLE           1
#define T0_KAOS_KTBL_NONCACHEABLE        0

#define T0_KAOS_SUBR0_VA                 0x4d580000
#define T0_KAOS_SUBR0_PA                 0x000000000b24a000
#define T0_KAOS_SUBR0_CACHEABLE          1
#define T0_KAOS_SUBR0_NONCACHEABLE       0
#define T0_KAOS_SUBR1_VA                 0x0d2da000
#define T0_KAOS_SUBR1_PA                 0x000000000d0c0000
#define T0_KAOS_SUBR1_CACHEABLE          1
#define T0_KAOS_SUBR1_NONCACHEABLE       0
#define T0_KAOS_SUBR2_VA                 0x1e504000
#define T0_KAOS_SUBR2_PA                 0x000000000f49c000
#define T0_KAOS_SUBR2_CACHEABLE          1
#define T0_KAOS_SUBR2_NONCACHEABLE       0
#define T0_KAOS_SUBR3_VA                 0x0ddc0000
#define T0_KAOS_SUBR3_PA                 0x0000000011190000
#define T0_KAOS_SUBR3_CACHEABLE          1
#define T0_KAOS_SUBR3_NONCACHEABLE       0

#define T0_KAOS_EXP_REGS_VA              0x4d8aa000
#define T0_KAOS_EXP_REGS_PA              0x00000000126be000
#define T0_KAOS_EXP_REGS_CACHEABLE       1
#define T0_KAOS_EXP_REGS_NONCACHEABLE    0
#define T0_KAOS_RUN_REGS_VA              0x65b1e000
#define T0_KAOS_RUN_REGS_PA              0x000000001595c000
#define T0_KAOS_RUN_REGS_CACHEABLE       1
#define T0_KAOS_RUN_REGS_NONCACHEABLE    0

#define T0_KAOS_EXP_STACK_VA             0x3568a000
#define T0_KAOS_EXP_STACK_PA             0x0000000016660000
#define T0_KAOS_EXP_STACK_CACHEABLE      1
#define T0_KAOS_EXP_STACK_NONCACHEABLE   0
#define T0_KAOS_RUN_STACK_VA             0x2db0c000
#define T0_KAOS_RUN_STACK_PA             0x0000000019dc4000
#define T0_KAOS_RUN_STACK_CACHEABLE      1
#define T0_KAOS_RUN_STACK_NONCACHEABLE   0

#define T0_KAOS_AREA0
#define T0_KAOS_EXP_AREA0_VA             0x7a55c000
#define T0_KAOS_EXP_AREA0_PA             0x000000001a858000
#define T0_KAOS_EXP_AREA0_CACHEABLE      1
#define T0_KAOS_EXP_AREA0_NONCACHEABLE   0
#define T0_KAOS_RUN_AREA0_VA             0x7f104000
#define T0_KAOS_RUN_AREA0_PA             0x000000001c7e8000
#define T0_KAOS_RUN_AREA0_CACHEABLE      1
#define T0_KAOS_RUN_AREA0_NONCACHEABLE   0

#define T0_KAOS_SHM_AREA
#define T0_KAOS_EXP_SHM_AREA_VA          0x182d6000
#define T0_KAOS_EXP_SHM_AREA_PA          0x0000000001c74000
#define T0_KAOS_EXP_SHM_AREA_CACHEABLE   1
#define T0_KAOS_EXP_SHM_AREA_NONCACHEABLE 0
#define T0_KAOS_RUN_SHM_AREA_VA          0x39200000
#define T0_KAOS_RUN_SHM_AREA_PA          0x0000000000c78000
#define T0_KAOS_RUN_SHM_AREA_CACHEABLE   1
#define T0_KAOS_RUN_SHM_AREA_NONCACHEABLE 0

#define T0_KAOS_RANVAL_00     0x6123a565
#define T0_KAOS_RANVAL_01     0xd7b3d328
#define T0_KAOS_RANVAL_02     0x26b9c601
#define T0_KAOS_RANVAL_03     0x64301929
#define T0_KAOS_RANVAL_04     0x83eea78a
#define T0_KAOS_RANVAL_05     0xba86a2e0
#define T0_KAOS_RANVAL_06     0x4c2da38d
#define T0_KAOS_RANVAL_07     0x7dcd2d55
#define T0_KAOS_RANVAL_08     0x8d488ea5
#define T0_KAOS_RANVAL_09     0xa63d70a5
#define T0_KAOS_RANVAL_0a     0x5b1ff70d
#define T0_KAOS_RANVAL_0b     0xb1438cbc
#define T0_KAOS_RANVAL_0c     0x13a21bad
#define T0_KAOS_RANVAL_0d     0x6043b80f
#define T0_KAOS_RANVAL_0e     0xba71170a
#define T0_KAOS_RANVAL_0f     0x407e5e13
#define T0_KAOS_RANVAL_10     0xc4039e88
#define T0_KAOS_RANVAL_11     0x372cf73c
#define T0_KAOS_RANVAL_12     0x6ab83ddb
#define T0_KAOS_RANVAL_13     0x2d82face
#define T0_KAOS_RANVAL_14     0xa316ef9c
#define T0_KAOS_RANVAL_15     0x169eeacf
#define T0_KAOS_RANVAL_16     0xbe9aaf5a
#define T0_KAOS_RANVAL_17     0xdd5bb4c5
#define T0_KAOS_RANVAL_18     0xc3deeea5
#define T0_KAOS_RANVAL_19     0xf2d5063b
#define T0_KAOS_RANVAL_1a     0x168305db
#define T0_KAOS_RANVAL_1b     0x3d36d215
#define T0_KAOS_RANVAL_1c     0xda679ac8
#define T0_KAOS_RANVAL_1d     0xfdacac40
#define T0_KAOS_RANVAL_1e     0x034bda5a
#define T0_KAOS_RANVAL_1f     0x001ee344
#define T0_KAOS_RANVAL_20     0xc1d717e8
#define T0_KAOS_RANVAL_21     0xc81debb5
#define T0_KAOS_RANVAL_22     0xfcf03bf3
#define T0_KAOS_RANVAL_23     0xaa5fd7a8
#define T0_KAOS_RANVAL_24     0xaaf93539
#define T0_KAOS_RANVAL_25     0xd6fcc488
#define T0_KAOS_RANVAL_26     0x7487aa96
#define T0_KAOS_RANVAL_27     0xd2fe7408
#define T0_KAOS_RANVAL_28     0xe7e44912
#define T0_KAOS_RANVAL_29     0xf51b3903
#define T0_KAOS_RANVAL_2a     0x4afa88fa
#define T0_KAOS_RANVAL_2b     0x71de0f83
#define T0_KAOS_RANVAL_2c     0xf3ef7606
#define T0_KAOS_RANVAL_2d     0xdfa4af50
#define T0_KAOS_RANVAL_2e     0xab3739d1
#define T0_KAOS_RANVAL_2f     0x848abab0
#define T0_KAOS_RANVAL_30     0x8a1fad34
#define T0_KAOS_RANVAL_31     0xc00f673f
#define T0_KAOS_RANVAL_32     0x6e7f5c3e
#define T0_KAOS_RANVAL_33     0x7a5c3506
#define T0_KAOS_RANVAL_34     0x08b201de
#define T0_KAOS_RANVAL_35     0x39890845
#define T0_KAOS_RANVAL_36     0xbee7db83
#define T0_KAOS_RANVAL_37     0x0508547e
#define T0_KAOS_RANVAL_38     0x8bbf2238
#define T0_KAOS_RANVAL_39     0xda8f8bc7
#define T0_KAOS_RANVAL_3a     0xc69dc5ff
#define T0_KAOS_RANVAL_3b     0x5301c376
#define T0_KAOS_RANVAL_3c     0xac5d0982
#define T0_KAOS_RANVAL_3d     0x46b80798
#define T0_KAOS_RANVAL_3e     0x3d2d1f56
#define T0_KAOS_RANVAL_3f     0xb76a38d8
#define T0_KAOS_RANVAL_40     0x9a613f58
#define T0_KAOS_RANVAL_41     0xecb91cc0
#define T0_KAOS_RANVAL_42     0x5e2621f1
#define T0_KAOS_RANVAL_43     0x162d8e7b
#define T0_KAOS_RANVAL_44     0xd6373848
#define T0_KAOS_RANVAL_45     0x21e70e7f
#define T0_KAOS_RANVAL_46     0xc950a3a9
#define T0_KAOS_RANVAL_47     0x744d59c9
#define T0_KAOS_RANVAL_48     0x7b63aba5
#define T0_KAOS_RANVAL_49     0xd2abc591
#define T0_KAOS_RANVAL_4a     0x736491be
#define T0_KAOS_RANVAL_4b     0x12baeaa1
#define T0_KAOS_RANVAL_4c     0x3c86f29a
#define T0_KAOS_RANVAL_4d     0xef6543b2
#define T0_KAOS_RANVAL_4e     0xd239b80d
#define T0_KAOS_RANVAL_4f     0xe797d47d
#define T0_KAOS_RANVAL_50     0xa43dc481
#define T0_KAOS_RANVAL_51     0x6ab94b63
#define T0_KAOS_RANVAL_52     0xefd04782
#define T0_KAOS_RANVAL_53     0xec9365d7
#define T0_KAOS_RANVAL_54     0x3460e475
#define T0_KAOS_RANVAL_55     0x1a153fee
#define T0_KAOS_RANVAL_56     0xdfb6cfca
#define T0_KAOS_RANVAL_57     0x039db1c8
#define T0_KAOS_RANVAL_58     0xbc199425
#define T0_KAOS_RANVAL_59     0x6efd81a8
#define T0_KAOS_RANVAL_5a     0xf969a04d
#define T0_KAOS_RANVAL_5b     0x7b8f0ff2
#define T0_KAOS_RANVAL_5c     0xee49dfeb
#define T0_KAOS_RANVAL_5d     0xb03fca76
#define T0_KAOS_RANVAL_5e     0x3392c45b
#define T0_KAOS_RANVAL_5f     0xfeed36a0
#define T0_KAOS_RANVAL_60     0x7225181c
#define T0_KAOS_RANVAL_61     0xb9504e91
#define T0_KAOS_RANVAL_62     0x76d10ea4
#define T0_KAOS_RANVAL_63     0xcde5532b
#define T0_KAOS_RANVAL_64     0x78c60ba1
#define T0_KAOS_RANVAL_65     0xfc51a58d
#define T0_KAOS_RANVAL_66     0xde1fe7ed
#define T0_KAOS_RANVAL_67     0x1424c49f
#define T0_KAOS_RANVAL_68     0x4955d7c6
#define T0_KAOS_RANVAL_69     0x7cc3bf96
#define T0_KAOS_RANVAL_6a     0xb660d501
#define T0_KAOS_RANVAL_6b     0x59b05c9d
#define T0_KAOS_RANVAL_6c     0x3b2f6151
#define T0_KAOS_RANVAL_6d     0x25d66afd
#define T0_KAOS_RANVAL_6e     0xf122e7e5
#define T0_KAOS_RANVAL_6f     0x05744a82
#define T0_KAOS_RANVAL_70     0x9798cad6
#define T0_KAOS_RANVAL_71     0x74202df2
#define T0_KAOS_RANVAL_72     0x67d3904e
#define T0_KAOS_RANVAL_73     0x974514c8
#define T0_KAOS_RANVAL_74     0xcc6d7c49
#define T0_KAOS_RANVAL_75     0x1f427893
#define T0_KAOS_RANVAL_76     0x2f477f57
#define T0_KAOS_RANVAL_77     0x37ac44ac
#define T0_KAOS_RANVAL_78     0xfba88fd5
#define T0_KAOS_RANVAL_79     0xc1107325
#define T0_KAOS_RANVAL_7a     0xbf41926e
#define T0_KAOS_RANVAL_7b     0xf461a811
#define T0_KAOS_RANVAL_7c     0x2268b7eb
#define T0_KAOS_RANVAL_7d     0x655deca0
#define T0_KAOS_RANVAL_7e     0x7188f98f
#define T0_KAOS_RANVAL_7f     0x12fc4da4
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
!    areaoffset     1664
!    ncache         0
!    emulate_ncache 1
!    pagesize       8192
!    invsize        0
!    codecount      4004
!    code           0d912000
!    entry          0d912000
!    fsr_exceptions 00000000
!    fsr_roundmode  00000004
!    fsr_mask       c0000fff
!    seed           d2b394eb4e4b
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

KTEXT_MODULE(t0_module_ktbl, 0x0d912000)
.seg "text"
	KGLOBAL(t0_ktbl)
t0_ktbl_page_begin:
.global t0_kref; t0_kref:
	.skip 0
t0_ktbl:
	.word	0xa2637e5d	! t0_kref+0x0:   	subc	%o5, -0x1a3, %l1
	.word	0x81ab0aae	! t0_kref+0x4:   	fcmpes	%fcc0, %f12, %f14
	.word	0x99a288ca	! t0_kref+0x8:   	fsubd	%f10, %f10, %f12
	.word	0xa5a4482c	! t0_kref+0xc:   	fadds	%f17, %f12, %f18
	.word	0xf3ee501b	! t0_kref+0x10:   	prefetcha	%i1 + %i3, 25
	.word	0xd608a001	! t0_kref+0x14:   	ldub	[%g2 + 1], %o3
	.word	0x9fb4cd30	! t0_kref+0x18:   	fandnot1s	%f19, %f16, %f15
	.word	0xec070018	! t0_kref+0x1c:   	ld	[%i4 + %i0], %l6
	.word	0xdab01019	! t0_kref+0x20:   	stha	%o5, [%g0 + %i1]0x80
	.word	0x9f414000	! t0_kref+0x24:   	mov	%pc, %o7
	.word	0xd9be180d	! t0_kref+0x28:   	stda	%f12, [%i0 + %o5]0xc0
	.word	0x95a00552	! t0_kref+0x2c:   	fsqrtd	%f18, %f10
	.word	0xa1b40f4c	! t0_kref+0x30:   	fornot1	%f16, %f12, %f16
	.word	0xadb30492	! t0_kref+0x34:   	fcmple32	%f12, %f18, %l6
	.word	0xda200018	! t0_kref+0x38:   	st	%o5, [%g0 + %i0]
	.word	0x9273400c	! t0_kref+0x3c:   	udiv	%o5, %o4, %o1
	.word	0x99a4884c	! t0_kref+0x40:   	faddd	%f18, %f12, %f12
	.word	0xd44e7fe7	! t0_kref+0x44:   	ldsb	[%i1 - 0x19], %o2
	.word	0xe03e0000	! t0_kref+0x48:   	std	%l0, [%i0]
	.word	0xa5b38ecc	! t0_kref+0x4c:   	fornot2	%f14, %f12, %f18
	.word	0x81accab2	! t0_kref+0x50:   	fcmpes	%fcc0, %f19, %f18
	.word	0xe100a03c	! t0_kref+0x54:   	ld	[%g2 + 0x3c], %f16
	.word	0xa7a48932	! t0_kref+0x58:   	fmuls	%f18, %f18, %f19
	.word	0xd19e1a1d	! t0_kref+0x5c:   	ldda	[%i0 + %i5]0xd0, %f8
	.word	0xda267fe4	! t0_kref+0x60:   	st	%o5, [%i1 - 0x1c]
	.word	0x9ba01a4e	! t0_kref+0x64:   	fdtoi	%f14, %f13
	.word	0xa1a4094e	! t0_kref+0x68:   	fmuld	%f16, %f14, %f16
	.word	0xa1a000ae	! t0_kref+0x6c:   	fnegs	%f14, %f16
	.word	0xd99e5a1a	! t0_kref+0x70:   	ldda	[%i1 + %i2]0xd0, %f12
	.word	0xe11e4000	! t0_kref+0x74:   	ldd	[%i1], %f16
	.word	0xa1a01890	! t0_kref+0x78:   	fitos	%f16, %f16
	.word	0xd19e9a19	! t0_kref+0x7c:   	ldda	[%i2 + %i1]0xd0, %f8
	.word	0xe03e2000	! t0_kref+0x80:   	std	%l0, [%i0]
	.word	0xd07e600c	! t0_kref+0x84:   	swap	[%i1 + 0xc], %o0
	.word	0x99a288d0	! t0_kref+0x88:   	fsubd	%f10, %f16, %f12
	.word	0x97a00033	! t0_kref+0x8c:   	fmovs	%f19, %f11
	.word	0x86102008	! t0_kref+0x90:   	mov	0x8, %g3
	.word	0x86a0e001	! t0_kref+0x94:   	subcc	%g3, 1, %g3
	.word	0x2280000e	! t0_kref+0x98:   	be,a	_kref+0xd0
	.word	0x9db38e0a	! t0_kref+0x9c:   	fand	%f14, %f10, %f14
	.word	0xa4f333b4	! t0_kref+0xa0:   	udivcc	%o4, -0xc4c, %l2
	.word	0xa29b000d	! t0_kref+0xa4:   	xorcc	%o4, %o5, %l1
	.word	0x9fc10000	! t0_kref+0xa8:   	call	%g4
	.word	0xe80e401a	! t0_kref+0xac:   	ldub	[%i1 + %i2], %l4
	.word	0x97a4c8ac	! t0_kref+0xb0:   	fsubs	%f19, %f12, %f11
	.word	0xf56e001b	! t0_kref+0xb4:   	prefetch	%i0 + %i3, 26
	.word	0xaaa3400d	! t0_kref+0xb8:   	subcc	%o5, %o5, %l5
	.word	0xaa8b400c	! t0_kref+0xbc:   	andcc	%o5, %o4, %l5
	.word	0xa803400d	! t0_kref+0xc0:   	add	%o5, %o5, %l4
	.word	0xe6c01019	! t0_kref+0xc4:   	ldswa	[%g0 + %i1]0x80, %l3
	.word	0xda30a00e	! t0_kref+0xc8:   	sth	%o5, [%g2 + 0xe]
	.word	0x33bffff2	! t0_kref+0xcc:   	fbe,a	_kref+0x94
	.word	0x9ba00531	! t0_kref+0xd0:   	fsqrts	%f17, %f13
	.word	0x95a2c8ad	! t0_kref+0xd4:   	fsubs	%f11, %f13, %f10
	.word	0x95a0054c	! t0_kref+0xd8:   	fsqrtd	%f12, %f10
	.word	0xea16c019	! t0_kref+0xdc:   	lduh	[%i3 + %i1], %l5
	.word	0x9db38d10	! t0_kref+0xe0:   	fandnot1	%f14, %f16, %f14
	.word	0xd450a010	! t0_kref+0xe4:   	ldsh	[%g2 + 0x10], %o2
	.word	0xd9be588d	! t0_kref+0xe8:   	stda	%f12, [%i1 + %o5]0xc4
	.word	0x8143e040	! t0_kref+0xec:   	membar	0x40
	.word	0x8143c000	! t0_kref+0xf0:   	stbar
	.word	0x3b800007	! t0_kref+0xf4:   	fble,a	_kref+0x110
	.word	0xa29b400d	! t0_kref+0xf8:   	xorcc	%o5, %o5, %l1
	.word	0x81da3865	! t0_kref+0xfc:   	flush	%o0 - 0x79b
	.word	0xd4063fe0	! t0_kref+0x100:   	ld	[%i0 - 0x20], %o2
	.word	0xd210a01a	! t0_kref+0x104:   	lduh	[%g2 + 0x1a], %o1
	.word	0x95a0054a	! t0_kref+0x108:   	fsqrtd	%f10, %f10
	.word	0xd900a00c	! t0_kref+0x10c:   	ld	[%g2 + 0xc], %f12
	.word	0xe11e2018	! t0_kref+0x110:   	ldd	[%i0 + 0x18], %f16
	.word	0xd45e3ff8	! t0_kref+0x114:   	ldx	[%i0 - 8], %o2
	.word	0xa1b38d8a	! t0_kref+0x118:   	fxor	%f14, %f10, %f16
	.word	0x21800003	! t0_kref+0x11c:   	fbn,a	_kref+0x128
	.word	0xac136670	! t0_kref+0x120:   	or	%o5, 0x670, %l6
	.word	0xaf3b201e	! t0_kref+0x124:   	sra	%o4, 0x1e, %l7
	.word	0x99b44ea0	! t0_kref+0x128:   	fsrc1s	%f17, %f12
	.word	0xa1a388ca	! t0_kref+0x12c:   	fsubd	%f14, %f10, %f16
	.word	0x2d480006	! t0_kref+0x130:   	fbg,a,pt	%fcc0, _kref+0x148
	.word	0xec00a010	! t0_kref+0x134:   	ld	[%g2 + 0x10], %l6
	.word	0x95a00550	! t0_kref+0x138:   	fsqrtd	%f16, %f10
	.word	0xab2b6005	! t0_kref+0x13c:   	sll	%o5, 0x5, %l5
	.word	0xa3b28aad	! t0_kref+0x140:   	fpsub16s	%f10, %f13, %f17
	.word	0xe51fbf90	! t0_kref+0x144:   	ldd	[%fp - 0x70], %f18
	.word	0x92133e55	! t0_kref+0x148:   	or	%o4, -0x1ab, %o1
	.word	0x92733ca0	! t0_kref+0x14c:   	udiv	%o4, -0x360, %o1
	.word	0x95b40a4c	! t0_kref+0x150:   	fpadd32	%f16, %f12, %f10
	.word	0xd53f4018	! t0_kref+0x154:   	std	%f10, [%i5 + %i0]
	.word	0xa4637cf5	! t0_kref+0x158:   	subc	%o5, -0x30b, %l2
	.word	0xacfb6d33	! t0_kref+0x15c:   	sdivcc	%o5, 0xd33, %l6
	.word	0xe11fbc58	! t0_kref+0x160:   	ldd	[%fp - 0x3a8], %f16
	.word	0xa5b34280	! t0_kref+0x164:   	array32	%o5, %g0, %l2
	.word	0xa7a0052b	! t0_kref+0x168:   	fsqrts	%f11, %f19
	.word	0x973b400c	! t0_kref+0x16c:   	sra	%o5, %o4, %o3
	.word	0x34800005	! t0_kref+0x170:   	bg,a	_kref+0x184
	.word	0x99b40d40	! t0_kref+0x174:   	fnot1	%f16, %f12
	.word	0xa9b3002c	! t0_kref+0x178:   	edge8n	%o4, %o4, %l4
	.word	0x3b800007	! t0_kref+0x17c:   	fble,a	_kref+0x198
	.word	0xd27e3fec	! t0_kref+0x180:   	swap	[%i0 - 0x14], %o1
	.word	0x8143c000	! t0_kref+0x184:   	stbar
	.word	0xe76e401d	! t0_kref+0x188:   	prefetch	%i1 + %i5, 19
	.word	0xe810a014	! t0_kref+0x18c:   	lduh	[%g2 + 0x14], %l4
	.word	0xe60e3fe1	! t0_kref+0x190:   	ldub	[%i0 - 0x1f], %l3
	.word	0x9db38dca	! t0_kref+0x194:   	fnand	%f14, %f10, %f14
	.word	0xd448a000	! t0_kref+0x198:   	ldsb	[%g2], %o2
	.word	0x9473400c	! t0_kref+0x19c:   	udiv	%o5, %o4, %o2
	.word	0xa1a3082d	! t0_kref+0x1a0:   	fadds	%f12, %f13, %f16
	.word	0x99a0052d	! t0_kref+0x1a4:   	fsqrts	%f13, %f12
	.word	0x99b2c971	! t0_kref+0x1a8:   	fpmerge	%f11, %f17, %f12
	.word	0xac1377fc	! t0_kref+0x1ac:   	or	%o5, -0x804, %l6
	.word	0xa370000d	! t0_kref+0x1b0:   	popc	%o5, %l1
	.word	0xa2a3000d	! t0_kref+0x1b4:   	subcc	%o4, %o5, %l1
	.word	0xdaae9018	! t0_kref+0x1b8:   	stba	%o5, [%i2 + %i0]0x80
	.word	0xe51fbe58	! t0_kref+0x1bc:   	ldd	[%fp - 0x1a8], %f18
	.word	0x908b31a1	! t0_kref+0x1c0:   	andcc	%o4, -0xe5f, %o0
	.word	0xee162000	! t0_kref+0x1c4:   	lduh	[%i0], %l7
	.word	0xe81e2008	! t0_kref+0x1c8:   	ldd	[%i0 + 8], %l4
	.word	0xe5be501d	! t0_kref+0x1cc:   	stda	%f18, [%i1 + %i5]0x80
	.word	0xae133535	! t0_kref+0x1d0:   	or	%o4, -0xacb, %l7
	.word	0x96b3000c	! t0_kref+0x1d4:   	orncc	%o4, %o4, %o3
	.word	0xadb340cd	! t0_kref+0x1d8:   	edge16l	%o5, %o5, %l6
	.word	0xaa33400d	! t0_kref+0x1dc:   	orn	%o5, %o5, %l5
	.word	0xa1a9c04e	! t0_kref+0x1e0:   	fmovdu	%fcc0, %f14, %f16
	.word	0x9da0052d	! t0_kref+0x1e4:   	fsqrts	%f13, %f14
	.word	0x3d480001	! t0_kref+0x1e8:   	fbule,a,pt	%fcc0, _kref+0x1ec
	.word	0x99b40ad2	! t0_kref+0x1ec:   	fpsub32	%f16, %f18, %f12
	.word	0x9fa0108a	! t0_kref+0x1f0:   	fxtos	%f10, %f15
	.word	0xa1a4094a	! t0_kref+0x1f4:   	fmuld	%f16, %f10, %f16
	.word	0xd87e3fe4	! t0_kref+0x1f8:   	swap	[%i0 - 0x1c], %o4
	.word	0x97b300ad	! t0_kref+0x1fc:   	edge16n	%o4, %o5, %o3
	.word	0xaf1b000d	! t0_kref+0x200:   	tsubcctv	%o4, %o5, %l7
	.word	0x920b6c1b	! t0_kref+0x204:   	and	%o5, 0xc1b, %o1
	.word	0xa72b400d	! t0_kref+0x208:   	sll	%o5, %o5, %l3
	.word	0xe9f6500d	! t0_kref+0x20c:   	casxa	[%i1]0x80, %o5, %l4
	.word	0x37480005	! t0_kref+0x210:   	fbge,a,pt	%fcc0, _kref+0x224
	.word	0x943332ea	! t0_kref+0x214:   	orn	%o4, -0xd16, %o2
	.word	0x95b48e12	! t0_kref+0x218:   	fand	%f18, %f18, %f10
	.word	0xac632250	! t0_kref+0x21c:   	subc	%o4, 0x250, %l6
	.word	0xdd9e501d	! t0_kref+0x220:   	ldda	[%i1 + %i5]0x80, %f14
	.word	0xd4c65000	! t0_kref+0x224:   	ldswa	[%i1]0x80, %o2
	.word	0x35800005	! t0_kref+0x228:   	fbue,a	_kref+0x23c
	.word	0xe6d81019	! t0_kref+0x22c:   	ldxa	[%g0 + %i1]0x80, %l3
	.word	0xe8c6101c	! t0_kref+0x230:   	ldswa	[%i0 + %i4]0x80, %l4
	.word	0x95a0054c	! t0_kref+0x234:   	fsqrtd	%f12, %f10
	.word	0xa273000d	! t0_kref+0x238:   	udiv	%o4, %o5, %l1
	.word	0xee080019	! t0_kref+0x23c:   	ldub	[%g0 + %i1], %l7
	.word	0xe20e2008	! t0_kref+0x240:   	ldub	[%i0 + 8], %l1
	.word	0xd93e7ff8	! t0_kref+0x244:   	std	%f12, [%i1 - 8]
	.word	0xd900a018	! t0_kref+0x248:   	ld	[%g2 + 0x18], %f12
	.word	0xab232573	! t0_kref+0x24c:   	mulscc	%o4, 0x573, %l5
	.word	0xaab36e08	! t0_kref+0x250:   	orncc	%o5, 0xe08, %l5
	.word	0xa7408000	! t0_kref+0x254:   	mov	%ccr, %l3
	.word	0x972b000d	! t0_kref+0x258:   	sll	%o4, %o5, %o3
	.word	0xe878a030	! t0_kref+0x25c:   	swap	[%g2 + 0x30], %l4
	.word	0xe11fbc18	! t0_kref+0x260:   	ldd	[%fp - 0x3e8], %f16
	.word	0x95a00552	! t0_kref+0x264:   	fsqrtd	%f18, %f10
	.word	0xda26600c	! t0_kref+0x268:   	st	%o5, [%i1 + 0xc]
	.word	0x94032b12	! t0_kref+0x26c:   	add	%o4, 0xb12, %o2
	.word	0xd2067ff8	! t0_kref+0x270:   	ld	[%i1 - 8], %o1
	.word	0x37480007	! t0_kref+0x274:   	fbge,a,pt	%fcc0, _kref+0x290
	.word	0xe6467fe4	! t0_kref+0x278:   	ldsw	[%i1 - 0x1c], %l3
	.word	0xa88b6ae5	! t0_kref+0x27c:   	andcc	%o5, 0xae5, %l4
	.word	0x9da4084a	! t0_kref+0x280:   	faddd	%f16, %f10, %f14
	.word	0xa1a2884e	! t0_kref+0x284:   	faddd	%f10, %f14, %f16
	.word	0xa4637ad2	! t0_kref+0x288:   	subc	%o5, -0x52e, %l2
	.word	0x9fa0052c	! t0_kref+0x28c:   	fsqrts	%f12, %f15
	.word	0xd500a018	! t0_kref+0x290:   	ld	[%g2 + 0x18], %f10
	.word	0x9da4094c	! t0_kref+0x294:   	fmuld	%f16, %f12, %f14
	.word	0xa5a0188e	! t0_kref+0x298:   	fitos	%f14, %f18
	.word	0x99b28d0e	! t0_kref+0x29c:   	fandnot1	%f10, %f14, %f12
	.word	0xe1be188d	! t0_kref+0x2a0:   	stda	%f16, [%i0 + %o5]0xc4
	.word	0xa86326c4	! t0_kref+0x2a4:   	subc	%o4, 0x6c4, %l4
	.word	0xdd1fbef0	! t0_kref+0x2a8:   	ldd	[%fp - 0x110], %f14
	.word	0x81830000	! t0_kref+0x2ac:   	wr	%o4, %g0, %y
	.word	0xea965000	! t0_kref+0x2b0:   	lduha	[%i1]0x80, %l5
	.word	0x97b30fb2	! t0_kref+0x2b4:   	fors	%f12, %f18, %f11
	.word	0xc1ee500c	! t0_kref+0x2b8:   	prefetcha	%i1 + %o4, 0
	.word	0x37480008	! t0_kref+0x2bc:   	fbge,a,pt	%fcc0, _kref+0x2dc
	.word	0xe810a02a	! t0_kref+0x2c0:   	lduh	[%g2 + 0x2a], %l4
	.word	0xa3a4c8b2	! t0_kref+0x2c4:   	fsubs	%f19, %f18, %f17
	.word	0xea08a03d	! t0_kref+0x2c8:   	ldub	[%g2 + 0x3d], %l5
	.word	0x99a01a2d	! t0_kref+0x2cc:   	fstoi	%f13, %f12
	.word	0xd44e3ff8	! t0_kref+0x2d0:   	ldsb	[%i0 - 8], %o2
	.word	0xa32b2000	! t0_kref+0x2d4:   	sll	%o4, 0x0, %l1
	.word	0xe84e3fee	! t0_kref+0x2d8:   	ldsb	[%i0 - 0x12], %l4
	.word	0x92fb400d	! t0_kref+0x2dc:   	sdivcc	%o5, %o5, %o1
	.word	0xdb063ff8	! t0_kref+0x2e0:   	ld	[%i0 - 8], %f13
	.word	0x95a0052c	! t0_kref+0x2e4:   	fsqrts	%f12, %f10
	.word	0xa3a0002c	! t0_kref+0x2e8:   	fmovs	%f12, %f17
	.word	0xe13e0000	! t0_kref+0x2ec:   	std	%f16, [%i0]
	.word	0x38480006	! t0_kref+0x2f0:   	bgu,a,pt	%icc, _kref+0x308
	.word	0xe81e4000	! t0_kref+0x2f4:   	ldd	[%i1], %l4
	.word	0x97a00531	! t0_kref+0x2f8:   	fsqrts	%f17, %f11
	.word	0xa3a01a2a	! t0_kref+0x2fc:   	fstoi	%f10, %f17
	.word	0xe810a002	! t0_kref+0x300:   	lduh	[%g2 + 2], %l4
	.word	0xee50a014	! t0_kref+0x304:   	ldsh	[%g2 + 0x14], %l7
	.word	0x95aa802b	! t0_kref+0x308:   	fmovsue	%fcc0, %f11, %f10
	.word	0xd4801019	! t0_kref+0x30c:   	lda	[%g0 + %i1]0x80, %o2
	.word	0xe11e6000	! t0_kref+0x310:   	ldd	[%i1], %f16
	.word	0x29480008	! t0_kref+0x314:   	fbl,a,pt	%fcc0, _kref+0x334
	.word	0xa60b2c40	! t0_kref+0x318:   	and	%o4, 0xc40, %l3
	.word	0x81ac8a30	! t0_kref+0x31c:   	fcmps	%fcc0, %f18, %f16
	.word	0xd6066008	! t0_kref+0x320:   	ld	[%i1 + 8], %o3
	.word	0xa5a488d0	! t0_kref+0x324:   	fsubd	%f18, %f16, %f18
	.word	0x81834000	! t0_kref+0x328:   	wr	%o5, %g0, %y
	.word	0xee10a018	! t0_kref+0x32c:   	lduh	[%g2 + 0x18], %l7
	.word	0xe7a71019	! t0_kref+0x330:   	sta	%f19, [%i4 + %i1]0x80
	.word	0x9de3bfa0	! t0_kref+0x334:   	save	%sp, -0x60, %sp
	.word	0xb496801b	! t0_kref+0x338:   	orcc	%i2, %i3, %i2
	.word	0x95ee37c1	! t0_kref+0x33c:   	restore	%i0, -0x83f, %o2
	.word	0xa5b3414c	! t0_kref+0x340:   	edge32l	%o5, %o4, %l2
	.word	0x95b3006d	! t0_kref+0x344:   	edge8ln	%o4, %o5, %o2
	.word	0x9fa408ac	! t0_kref+0x348:   	fsubs	%f16, %f12, %f15
	.word	0x97a9402f	! t0_kref+0x34c:   	fmovsug	%fcc0, %f15, %f11
	.word	0xa5a01a52	! t0_kref+0x350:   	fdtoi	%f18, %f18
	.word	0x3d480008	! t0_kref+0x354:   	fbule,a,pt	%fcc0, _kref+0x374
	.word	0xd4166004	! t0_kref+0x358:   	lduh	[%i1 + 4], %o2
	.word	0xd616c019	! t0_kref+0x35c:   	lduh	[%i3 + %i1], %o3
	.word	0x21480001	! t0_kref+0x360:   	fbn,a,pt	%fcc0, _kref+0x364
	.word	0x95a0052d	! t0_kref+0x364:   	fsqrts	%f13, %f10
	.word	0x99a3094a	! t0_kref+0x368:   	fmuld	%f12, %f10, %f12
	.word	0xd040a03c	! t0_kref+0x36c:   	ldsw	[%g2 + 0x3c], %o0
	.word	0xa9b340cc	! t0_kref+0x370:   	edge16l	%o5, %o4, %l4
	.word	0x913b000c	! t0_kref+0x374:   	sra	%o4, %o4, %o0
	.word	0xa6c36831	! t0_kref+0x378:   	addccc	%o5, 0x831, %l3
	.word	0x9fb3ca2c	! t0_kref+0x37c:   	fpadd16s	%f15, %f12, %f15
	.word	0xa2132fe7	! t0_kref+0x380:   	or	%o4, 0xfe7, %l1
	.word	0x91400000	! t0_kref+0x384:   	mov	%y, %o0
	.word	0x86102002	! t0_kref+0x388:   	mov	0x2, %g3
	.word	0x86a0e001	! t0_kref+0x38c:   	subcc	%g3, 1, %g3
	.word	0x22800007	! t0_kref+0x390:   	be,a	_kref+0x3ac
	.word	0xa72b201e	! t0_kref+0x394:   	sll	%o4, 0x1e, %l3
	.word	0xe46e8018	! t0_kref+0x398:   	ldstub	[%i2 + %i0], %l2
	.word	0xa5a00552	! t0_kref+0x39c:   	fsqrtd	%f18, %f18
	.word	0xe0b81018	! t0_kref+0x3a0:   	stda	%l0, [%g0 + %i0]0x80
	.word	0xe84e6014	! t0_kref+0x3a4:   	ldsb	[%i1 + 0x14], %l4
	.word	0xe840a01c	! t0_kref+0x3a8:   	ldsw	[%g2 + 0x1c], %l4
	.word	0xec080019	! t0_kref+0x3ac:   	ldub	[%g0 + %i1], %l6
	.word	0x24480008	! t0_kref+0x3b0:   	ble,a,pt	%icc, _kref+0x3d0
	.word	0xe248a039	! t0_kref+0x3b4:   	ldsb	[%g2 + 0x39], %l1
	.word	0xa4f32ea0	! t0_kref+0x3b8:   	udivcc	%o4, 0xea0, %l2
	.word	0xa1a01892	! t0_kref+0x3bc:   	fitos	%f18, %f16
	.word	0x9ba0052f	! t0_kref+0x3c0:   	fsqrts	%f15, %f13
	.word	0x81da37bf	! t0_kref+0x3c4:   	flush	%o0 - 0x841
	.word	0xa8b3000c	! t0_kref+0x3c8:   	orncc	%o4, %o4, %l4
	.word	0xe200a010	! t0_kref+0x3cc:   	ld	[%g2 + 0x10], %l1
	.word	0xa5b30492	! t0_kref+0x3d0:   	fcmple32	%f12, %f18, %l2
	.word	0x94a3740f	! t0_kref+0x3d4:   	subcc	%o5, -0xbf1, %o2
	.word	0xa5b40910	! t0_kref+0x3d8:   	faligndata	%f16, %f16, %f18
	.word	0x9ba01893	! t0_kref+0x3dc:   	fitos	%f19, %f13
	.word	0xdb00a000	! t0_kref+0x3e0:   	ld	[%g2], %f13
	.word	0x95a28950	! t0_kref+0x3e4:   	fmuld	%f10, %f16, %f10
	.word	0xea167fe2	! t0_kref+0x3e8:   	lduh	[%i1 - 0x1e], %l5
	.word	0x969b3646	! t0_kref+0x3ec:   	xorcc	%o4, -0x9ba, %o3
	.word	0xd8f01018	! t0_kref+0x3f0:   	stxa	%o4, [%g0 + %i0]0x80
	.word	0x90f3400d	! t0_kref+0x3f4:   	udivcc	%o5, %o5, %o0
	.word	0x93b3048c	! t0_kref+0x3f8:   	fcmple32	%f12, %f12, %o1
	.word	0xaf3b400d	! t0_kref+0x3fc:   	sra	%o5, %o5, %l7
	.word	0xc06e201b	! t0_kref+0x400:   	ldstub	[%i0 + 0x1b], %g0
	.word	0x99b0076a	! t0_kref+0x404:   	fpack16	%f10, %f12
	.word	0xac933229	! t0_kref+0x408:   	orcc	%o4, -0xdd7, %l6
	.word	0x9da2c92b	! t0_kref+0x40c:   	fmuls	%f11, %f11, %f14
	.word	0x9da2894e	! t0_kref+0x410:   	fmuld	%f10, %f14, %f14
	.word	0x3e800001	! t0_kref+0x414:   	bvc,a	_kref+0x418
	.word	0xe01e0000	! t0_kref+0x418:   	ldd	[%i0], %l0
	.word	0xe5180018	! t0_kref+0x41c:   	ldd	[%g0 + %i0], %f18
	.word	0x21800002	! t0_kref+0x420:   	fbn,a	_kref+0x428
	.word	0x97b34ab1	! t0_kref+0x424:   	fpsub16s	%f13, %f17, %f11
	.word	0xe608a03f	! t0_kref+0x428:   	ldub	[%g2 + 0x3f], %l3
	.word	0xe40e8018	! t0_kref+0x42c:   	ldub	[%i2 + %i0], %l2
	.word	0xe86e001a	! t0_kref+0x430:   	ldstub	[%i0 + %i2], %l4
	.word	0xe51e2008	! t0_kref+0x434:   	ldd	[%i0 + 8], %f18
	.word	0x95b340ec	! t0_kref+0x438:   	edge16ln	%o5, %o4, %o2
	.word	0x21800003	! t0_kref+0x43c:   	fbn,a	_kref+0x448
	.word	0x96937ea5	! t0_kref+0x440:   	orcc	%o5, -0x15b, %o3
	.word	0x99a4084c	! t0_kref+0x444:   	faddd	%f16, %f12, %f12
	.word	0xa413400d	! t0_kref+0x448:   	or	%o5, %o5, %l2
	.word	0x9db2c72d	! t0_kref+0x44c:   	fmuld8ulx16	%f11, %f13, %f14
	.word	0x25480003	! t0_kref+0x450:   	fblg,a,pt	%fcc0, _kref+0x45c
	.word	0xea0e2003	! t0_kref+0x454:   	ldub	[%i0 + 3], %l5
	.word	0xa3b007ac	! t0_kref+0x458:   	fpackfix	%f12, %f17
	.word	0x97a01a2b	! t0_kref+0x45c:   	fstoi	%f11, %f11
	.word	0x95236aef	! t0_kref+0x460:   	mulscc	%o5, 0xaef, %o2
	.word	0xea48a02a	! t0_kref+0x464:   	ldsb	[%g2 + 0x2a], %l5
	.word	0xa3b00ceb	! t0_kref+0x468:   	fnot2s	%f11, %f17
	.word	0xa663400c	! t0_kref+0x46c:   	subc	%o5, %o4, %l3
	.word	0x9db38dd0	! t0_kref+0x470:   	fnand	%f14, %f16, %f14
	.word	0xa5a0054e	! t0_kref+0x474:   	fsqrtd	%f14, %f18
	.word	0xe03e7ff0	! t0_kref+0x478:   	std	%l0, [%i1 - 0x10]
	.word	0xd82e401a	! t0_kref+0x47c:   	stb	%o4, [%i1 + %i2]
	.word	0xee167fea	! t0_kref+0x480:   	lduh	[%i1 - 0x16], %l7
	.word	0xda20a03c	! t0_kref+0x484:   	st	%o5, [%g2 + 0x3c]
	.word	0x96a3400c	! t0_kref+0x488:   	subcc	%o5, %o4, %o3
	.word	0x9493000d	! t0_kref+0x48c:   	orcc	%o4, %o5, %o2
	.word	0x34800003	! t0_kref+0x490:   	bg,a	_kref+0x49c
	.word	0xa3a018ca	! t0_kref+0x494:   	fdtos	%f10, %f17
	.word	0xa5a40830	! t0_kref+0x498:   	fadds	%f16, %f16, %f18
	.word	0xa633000d	! t0_kref+0x49c:   	orn	%o4, %o5, %l3
	.word	0x34800007	! t0_kref+0x4a0:   	bg,a	_kref+0x4bc
	.word	0xd448a020	! t0_kref+0x4a4:   	ldsb	[%g2 + 0x20], %o2
	.word	0xacb363a2	! t0_kref+0x4a8:   	orncc	%o5, 0x3a2, %l6
	.word	0xda30a018	! t0_kref+0x4ac:   	sth	%o5, [%g2 + 0x18]
	.word	0x2b480005	! t0_kref+0x4b0:   	fbug,a,pt	%fcc0, _kref+0x4c4
	.word	0x907b70b9	! t0_kref+0x4b4:   	sdiv	%o5, -0xf47, %o0
	.word	0x9da3884e	! t0_kref+0x4b8:   	faddd	%f14, %f14, %f14
	.word	0xe200a00c	! t0_kref+0x4bc:   	ld	[%g2 + 0xc], %l1
	.word	0x95b40ab2	! t0_kref+0x4c0:   	fpsub16s	%f16, %f18, %f10
	.word	0xe0bf5019	! t0_kref+0x4c4:   	stda	%l0, [%i5 + %i1]0x80
	.word	0xac136a72	! t0_kref+0x4c8:   	or	%o5, 0xa72, %l6
	.word	0xa1a00550	! t0_kref+0x4cc:   	fsqrtd	%f16, %f16
	.word	0xa673400d	! t0_kref+0x4d0:   	udiv	%o5, %o5, %l3
	.word	0xdb00a01c	! t0_kref+0x4d4:   	ld	[%g2 + 0x1c], %f13
	.word	0xda26001c	! t0_kref+0x4d8:   	st	%o5, [%i0 + %i4]
	.word	0xa32b2008	! t0_kref+0x4dc:   	sll	%o4, 0x8, %l1
	.word	0x95a0104a	! t0_kref+0x4e0:   	fdtox	%f10, %f10
	.word	0xa463400d	! t0_kref+0x4e4:   	subc	%o5, %o5, %l2
	.word	0xe848a025	! t0_kref+0x4e8:   	ldsb	[%g2 + 0x25], %l4
	.word	0x9fc00004	! t0_kref+0x4ec:   	call	%g0 + %g4
	.word	0xa4932194	! t0_kref+0x4f0:   	orcc	%o4, 0x194, %l2
	.word	0xd500a030	! t0_kref+0x4f4:   	ld	[%g2 + 0x30], %f10
	.word	0x30800001	! t0_kref+0x4f8:   	ba,a	_kref+0x4fc
	.word	0xd19e5a1b	! t0_kref+0x4fc:   	ldda	[%i1 + %i3]0xd0, %f8
	.word	0x33480008	! t0_kref+0x500:   	fbe,a,pt	%fcc0, _kref+0x520
	.word	0xe8000019	! t0_kref+0x504:   	ld	[%g0 + %i1], %l4
	.word	0x97b2cd60	! t0_kref+0x508:   	fnot1s	%f11, %f11
	.word	0x81dc800b	! t0_kref+0x50c:   	flush	%l2 + %o3
	.word	0x3b800002	! t0_kref+0x510:   	fble,a	_kref+0x518
	.word	0xe208a03e	! t0_kref+0x514:   	ldub	[%g2 + 0x3e], %l1
	.word	0x9fc00004	! t0_kref+0x518:   	call	%g0 + %g4
	.word	0x9db28dd2	! t0_kref+0x51c:   	fnand	%f10, %f18, %f14
	.word	0x95b306ee	! t0_kref+0x520:   	fmul8ulx16	%f12, %f14, %f10
!	.word	0x36a726b7	! t0_kref+0x524:   	bge,a	SYM(t0_subr1)
	   	bge,a	SYM(t0_subr1)
	.word	0x9e006004	! t0_kref+0x528:   	add	%g1, 4, %o7
	.word	0xe650a008	! t0_kref+0x52c:   	ldsh	[%g2 + 8], %l3
	.word	0x99a2894a	! t0_kref+0x530:   	fmuld	%f10, %f10, %f12
	.word	0xa7b4848a	! t0_kref+0x534:   	fcmple32	%f18, %f10, %l3
	.word	0xe5a71019	! t0_kref+0x538:   	sta	%f18, [%i4 + %i1]0x80
	.word	0x94936fe4	! t0_kref+0x53c:   	orcc	%o5, 0xfe4, %o2
	.word	0xd820a010	! t0_kref+0x540:   	st	%o4, [%g2 + 0x10]
	.word	0xe44e8018	! t0_kref+0x544:   	ldsb	[%i2 + %i0], %l2
	.word	0x9da000ca	! t0_kref+0x548:   	fnegd	%f10, %f14
	.word	0xa7a000aa	! t0_kref+0x54c:   	fnegs	%f10, %f19
	.word	0x95b340ed	! t0_kref+0x550:   	edge16ln	%o5, %o5, %o2
	.word	0xd8263fe8	! t0_kref+0x554:   	st	%o4, [%i0 - 0x18]
	.word	0x27800008	! t0_kref+0x558:   	fbul,a	_kref+0x578
	.word	0x9da28852	! t0_kref+0x55c:   	faddd	%f10, %f18, %f14
	.word	0xa29b2a67	! t0_kref+0x560:   	xorcc	%o4, 0xa67, %l1
	.word	0xe700a018	! t0_kref+0x564:   	ld	[%g2 + 0x18], %f19
	.word	0xd44e3ff4	! t0_kref+0x568:   	ldsb	[%i0 - 0xc], %o2
	.word	0x37800006	! t0_kref+0x56c:   	fbge,a	_kref+0x584
	.word	0x9fa018cc	! t0_kref+0x570:   	fdtos	%f12, %f15
	.word	0x81ac0ab3	! t0_kref+0x574:   	fcmpes	%fcc0, %f16, %f19
	.word	0xa2b3000d	! t0_kref+0x578:   	orncc	%o4, %o5, %l1
	.word	0x97b3404d	! t0_kref+0x57c:   	edge8l	%o5, %o5, %o3
	.word	0xa7a28832	! t0_kref+0x580:   	fadds	%f10, %f18, %f19
	.word	0xa5a0014c	! t0_kref+0x584:   	fabsd	%f12, %f18
	.word	0x9323000c	! t0_kref+0x588:   	mulscc	%o4, %o4, %o1
	.word	0xee50a022	! t0_kref+0x58c:   	ldsh	[%g2 + 0x22], %l7
	.word	0x99a308d2	! t0_kref+0x590:   	fsubd	%f12, %f18, %f12
	.word	0x3e800002	! t0_kref+0x594:   	bvc,a	_kref+0x59c
	.word	0x9ba00531	! t0_kref+0x598:   	fsqrts	%f17, %f13
	.word	0x35800005	! t0_kref+0x59c:   	fbue,a	_kref+0x5b0
	.word	0xda36c018	! t0_kref+0x5a0:   	sth	%o5, [%i3 + %i0]
	.word	0xafb340ac	! t0_kref+0x5a4:   	edge16n	%o5, %o4, %l7
	.word	0xd640a01c	! t0_kref+0x5a8:   	ldsw	[%g2 + 0x1c], %o3
	.word	0x9fc00004	! t0_kref+0x5ac:   	call	%g0 + %g4
	.word	0xa9b3416d	! t0_kref+0x5b0:   	edge32ln	%o5, %o5, %l4
	.word	0x97418000	! t0_kref+0x5b4:   	mov	%fprs, %o3
	.word	0x92a3400d	! t0_kref+0x5b8:   	subcc	%o5, %o5, %o1
	.word	0x99a0110e	! t0_kref+0x5bc:   	fxtod	%f14, %f12
	.word	0xa1b38e80	! t0_kref+0x5c0:   	fsrc1	%f14, %f16
	.word	0xe80e7fe2	! t0_kref+0x5c4:   	ldub	[%i1 - 0x1e], %l4
	.word	0x9fa000b2	! t0_kref+0x5c8:   	fnegs	%f18, %f15
	.word	0xea06600c	! t0_kref+0x5cc:   	ld	[%i1 + 0xc], %l5
	.word	0xac0b6d9e	! t0_kref+0x5d0:   	and	%o5, 0xd9e, %l6
	.word	0x9fa288ae	! t0_kref+0x5d4:   	fsubs	%f10, %f14, %f15
	.word	0xdaa01018	! t0_kref+0x5d8:   	sta	%o5, [%g0 + %i0]0x80
	.word	0x90b33907	! t0_kref+0x5dc:   	orncc	%o4, -0x6f9, %o0
	.word	0xee6e200a	! t0_kref+0x5e0:   	ldstub	[%i0 + 0xa], %l7
	.word	0xa3a3092a	! t0_kref+0x5e4:   	fmuls	%f12, %f10, %f17
	.word	0xd250a02c	! t0_kref+0x5e8:   	ldsh	[%g2 + 0x2c], %o1
	.word	0xa2b333e5	! t0_kref+0x5ec:   	orncc	%o4, -0xc1b, %l1
	.word	0xa3b300ec	! t0_kref+0x5f0:   	edge16ln	%o4, %o4, %l1
	.word	0xa49b3540	! t0_kref+0x5f4:   	xorcc	%o4, -0xac0, %l2
	.word	0xda2e8019	! t0_kref+0x5f8:   	stb	%o5, [%i2 + %i1]
	.word	0x9da0052a	! t0_kref+0x5fc:   	fsqrts	%f10, %f14
	.word	0xda267fec	! t0_kref+0x600:   	st	%o5, [%i1 - 0x14]
	.word	0xa45370fd	! t0_kref+0x604:   	umul	%o5, -0xf03, %l2
	.word	0x972b000d	! t0_kref+0x608:   	sll	%o4, %o5, %o3
	.word	0xa1a288cc	! t0_kref+0x60c:   	fsubd	%f10, %f12, %f16
	.word	0x9013000d	! t0_kref+0x610:   	or	%o4, %o5, %o0
	.word	0xe680105c	! t0_kref+0x614:   	lda	[%g0 + %i4]0x82, %l3
	.word	0x99a0054e	! t0_kref+0x618:   	fsqrtd	%f14, %f12
	.word	0xee7f0019	! t0_kref+0x61c:   	swap	[%i4 + %i1], %l7
	.word	0x8610200e	! t0_kref+0x620:   	mov	0xe, %g3
	.word	0x86a0e001	! t0_kref+0x624:   	subcc	%g3, 1, %g3
	.word	0x22800014	! t0_kref+0x628:   	be,a	_kref+0x678
	.word	0x81830000	! t0_kref+0x62c:   	wr	%o4, %g0, %y
	.word	0xaf400000	! t0_kref+0x630:   	mov	%y, %l7
	.word	0x81ac0aac	! t0_kref+0x634:   	fcmpes	%fcc0, %f16, %f12
	.word	0xe8000019	! t0_kref+0x638:   	ld	[%g0 + %i1], %l4
	.word	0xd096501b	! t0_kref+0x63c:   	lduha	[%i1 + %i3]0x80, %o0
	.word	0xd8b01019	! t0_kref+0x640:   	stha	%o4, [%g0 + %i1]0x80
	.word	0xe64e001a	! t0_kref+0x644:   	ldsb	[%i0 + %i2], %l3
	.word	0xea100018	! t0_kref+0x648:   	lduh	[%g0 + %i0], %l5
	.word	0xd826201c	! t0_kref+0x64c:   	st	%o4, [%i0 + 0x1c]
	.word	0xe600a008	! t0_kref+0x650:   	ld	[%g2 + 8], %l3
	.word	0xec1e3fe8	! t0_kref+0x654:   	ldd	[%i0 - 0x18], %l6
	.word	0xe41f4018	! t0_kref+0x658:   	ldd	[%i5 + %i0], %l2
	.word	0x94132314	! t0_kref+0x65c:   	or	%o4, 0x314, %o2
	.word	0xac1b7f98	! t0_kref+0x660:   	xor	%o5, -0x68, %l6
	.word	0xa5a3092a	! t0_kref+0x664:   	fmuls	%f12, %f10, %f18
	.word	0x26800005	! t0_kref+0x668:   	bl,a	_kref+0x67c
	.word	0xa833000c	! t0_kref+0x66c:   	orn	%o4, %o4, %l4
	.word	0x3d800004	! t0_kref+0x670:   	fbule,a	_kref+0x680
	.word	0x95a2cd2f	! t0_kref+0x674:   	fsmuld	%f11, %f15, %f10
	.word	0xb6103ff4	! t0_kref+0x678:   	mov	0xfffffff4, %i3
	.word	0x95a3884c	! t0_kref+0x67c:   	faddd	%f14, %f12, %f10
	.word	0x9db009ae	! t0_kref+0x680:   	fexpand	%f14, %f14
	.word	0xe51fbcf0	! t0_kref+0x684:   	ldd	[%fp - 0x310], %f18
	.word	0x90c3400c	! t0_kref+0x688:   	addccc	%o5, %o4, %o0
	.word	0xec1e001d	! t0_kref+0x68c:   	ldd	[%i0 + %i5], %l6
	.word	0xa1a00550	! t0_kref+0x690:   	fsqrtd	%f16, %f16
	.word	0xa5a80050	! t0_kref+0x694:   	fmovdn	%fcc0, %f16, %f18
	.word	0xe6965000	! t0_kref+0x698:   	lduha	[%i1]0x80, %l3
	.word	0xe1be588d	! t0_kref+0x69c:   	stda	%f16, [%i1 + %o5]0xc4
	.word	0xd9be588c	! t0_kref+0x6a0:   	stda	%f12, [%i1 + %o4]0xc4
	.word	0xd51fbe20	! t0_kref+0x6a4:   	ldd	[%fp - 0x1e0], %f10
	.word	0x9fc10000	! t0_kref+0x6a8:   	call	%g4
	.word	0xd700a008	! t0_kref+0x6ac:   	ld	[%g2 + 8], %f11
	.word	0xa1a000ce	! t0_kref+0x6b0:   	fnegd	%f14, %f16
	.word	0xa53b200e	! t0_kref+0x6b4:   	sra	%o4, 0xe, %l2
	.word	0xe2062014	! t0_kref+0x6b8:   	ld	[%i0 + 0x14], %l1
	.word	0xd86e201d	! t0_kref+0x6bc:   	ldstub	[%i0 + 0x1d], %o4
	.word	0x95a2894c	! t0_kref+0x6c0:   	fmuld	%f10, %f12, %f10
	.word	0xee100019	! t0_kref+0x6c4:   	lduh	[%g0 + %i1], %l7
	.word	0x3f800004	! t0_kref+0x6c8:   	fbo,a	_kref+0x6d8
	.word	0x9db2890e	! t0_kref+0x6cc:   	faligndata	%f10, %f14, %f14
	.word	0xa1a4482f	! t0_kref+0x6d0:   	fadds	%f17, %f15, %f16
	.word	0x909b3b69	! t0_kref+0x6d4:   	xorcc	%o4, -0x497, %o0
	.word	0xe3e6100c	! t0_kref+0x6d8:   	casa	[%i0]0x80, %o4, %l1
	.word	0xa72b200a	! t0_kref+0x6dc:   	sll	%o4, 0xa, %l3
	.word	0xa5b48d10	! t0_kref+0x6e0:   	fandnot1	%f18, %f16, %f18
	.word	0xe76e7fe0	! t0_kref+0x6e4:   	prefetch	%i1 - 0x20, 19
	.word	0xe1be188c	! t0_kref+0x6e8:   	stda	%f16, [%i0 + %o4]0xc4
	.word	0xa7b3010d	! t0_kref+0x6ec:   	edge32	%o4, %o5, %l3
	.word	0x96fb62b8	! t0_kref+0x6f0:   	sdivcc	%o5, 0x2b8, %o3
	.word	0x35480004	! t0_kref+0x6f4:   	fbue,a,pt	%fcc0, _kref+0x704
	.word	0x99b48990	! t0_kref+0x6f8:   	bshuffle	%f18, %f16, %f12
	.word	0xe100a000	! t0_kref+0x6fc:   	ld	[%g2], %f16
	.word	0xaa9331de	! t0_kref+0x700:   	orcc	%o4, -0xe22, %l5
	.word	0x95a40952	! t0_kref+0x704:   	fmuld	%f16, %f18, %f10
	.word	0xee067ff4	! t0_kref+0x708:   	ld	[%i1 - 0xc], %l7
	.word	0xd08e501a	! t0_kref+0x70c:   	lduba	[%i1 + %i2]0x80, %o0
	.word	0xe13e2010	! t0_kref+0x710:   	std	%f16, [%i0 + 0x10]
	.word	0x9fc00004	! t0_kref+0x714:   	call	%g0 + %g4
	.word	0xda20a000	! t0_kref+0x718:   	st	%o5, [%g2]
	.word	0xab3b601f	! t0_kref+0x71c:   	sra	%o5, 0x1f, %l5
	.word	0xc078a020	! t0_kref+0x720:   	swap	[%g2 + 0x20], %g0
	.word	0xec4e8019	! t0_kref+0x724:   	ldsb	[%i2 + %i1], %l6
	.word	0xd7871019	! t0_kref+0x728:   	lda	[%i4 + %i1]0x80, %f11
	.word	0xd826201c	! t0_kref+0x72c:   	st	%o4, [%i0 + 0x1c]
	.word	0xe53e2008	! t0_kref+0x730:   	std	%f18, [%i0 + 8]
	.word	0xda28a00c	! t0_kref+0x734:   	stb	%o5, [%g2 + 0xc]
	.word	0xdd3e3ff8	! t0_kref+0x738:   	std	%f14, [%i0 - 8]
	.word	0xea08a00e	! t0_kref+0x73c:   	ldub	[%g2 + 0xe], %l5
	.word	0xee08a03c	! t0_kref+0x740:   	ldub	[%g2 + 0x3c], %l7
	.word	0x23480001	! t0_kref+0x744:   	fbne,a,pt	%fcc0, _kref+0x748
	.word	0xa8a3400c	! t0_kref+0x748:   	subcc	%o5, %o4, %l4
	.word	0x99a288b1	! t0_kref+0x74c:   	fsubs	%f10, %f17, %f12
	.word	0x9ba00531	! t0_kref+0x750:   	fsqrts	%f17, %f13
	.word	0x9db28972	! t0_kref+0x754:   	fpmerge	%f10, %f18, %f14
	.word	0x99b40d40	! t0_kref+0x758:   	fnot1	%f16, %f12
	.word	0xe01e3ff8	! t0_kref+0x75c:   	ldd	[%i0 - 8], %l0
	.word	0xe1180019	! t0_kref+0x760:   	ldd	[%g0 + %i1], %f16
	.word	0x29800002	! t0_kref+0x764:   	fbl,a	_kref+0x76c
	.word	0xa5a2c8aa	! t0_kref+0x768:   	fsubs	%f11, %f10, %f18
	.word	0x9fc10000	! t0_kref+0x76c:   	call	%g4
	.word	0xd67e601c	! t0_kref+0x770:   	swap	[%i1 + 0x1c], %o3
	.word	0xa1a0052e	! t0_kref+0x774:   	fsqrts	%f14, %f16
	.word	0xa5b4cd31	! t0_kref+0x778:   	fandnot1s	%f19, %f17, %f18
	.word	0xdab6501b	! t0_kref+0x77c:   	stha	%o5, [%i1 + %i3]0x80
	.word	0xe848a038	! t0_kref+0x780:   	ldsb	[%g2 + 0x38], %l4
	.word	0xdd06201c	! t0_kref+0x784:   	ld	[%i0 + 0x1c], %f14
	.word	0x35800007	! t0_kref+0x788:   	fbue,a	_kref+0x7a4
	.word	0xe1be580c	! t0_kref+0x78c:   	stda	%f16, [%i1 + %o4]0xc0
	.word	0xda30a006	! t0_kref+0x790:   	sth	%o5, [%g2 + 6]
	.word	0xadb3058e	! t0_kref+0x794:   	fcmpgt32	%f12, %f14, %l6
	.word	0x3e800005	! t0_kref+0x798:   	bvc,a	_kref+0x7ac
	.word	0x9da0052f	! t0_kref+0x79c:   	fsqrts	%f15, %f14
	.word	0xe03e7fe8	! t0_kref+0x7a0:   	std	%l0, [%i1 - 0x18]
	.word	0x8143c000	! t0_kref+0x7a4:   	stbar
	.word	0x97a4c9b3	! t0_kref+0x7a8:   	fdivs	%f19, %f19, %f11
	.word	0x9fa0052e	! t0_kref+0x7ac:   	fsqrts	%f14, %f15
	.word	0xe59e5000	! t0_kref+0x7b0:   	ldda	[%i1]0x80, %f18
	.word	0x2b800003	! t0_kref+0x7b4:   	fbug,a	_kref+0x7c0
	.word	0x99b386d2	! t0_kref+0x7b8:   	fmul8sux16	%f14, %f18, %f12
	.word	0xe0180018	! t0_kref+0x7bc:   	ldd	[%g0 + %i0], %l0
	.word	0xc807bfec	! t0_kref+0x7c0:   	ld	[%fp - 0x14], %g4
	.word	0xee4e8018	! t0_kref+0x7c4:   	ldsb	[%i2 + %i0], %l7
	.word	0xe3a61000	! t0_kref+0x7c8:   	sta	%f17, [%i0]0x80
	.word	0xa5a8c04e	! t0_kref+0x7cc:   	fmovdul	%fcc0, %f14, %f18
	.word	0xd4270000	! t0_kref+0x7d0:   	st	%o2, [%i4]
	.word	0x81aa8ab1	! t0_kref+0x7d4:   	fcmpes	%fcc0, %f10, %f17
	.word	0xa6c3000c	! t0_kref+0x7d8:   	addccc	%o4, %o4, %l3
	.word	0x95a00552	! t0_kref+0x7dc:   	fsqrtd	%f18, %f10
	.word	0x81df6f56	! t0_kref+0x7e0:   	flush	%i5 + 0xf56
	.word	0x29480004	! t0_kref+0x7e4:   	fbl,a,pt	%fcc0, _kref+0x7f4
	.word	0xe400a020	! t0_kref+0x7e8:   	ld	[%g2 + 0x20], %l2
	.word	0x23480002	! t0_kref+0x7ec:   	fbne,a,pt	%fcc0, _kref+0x7f4
	.word	0x9da00552	! t0_kref+0x7f0:   	fsqrtd	%f18, %f14
	.word	0xa7a00531	! t0_kref+0x7f4:   	fsqrts	%f17, %f19
	.word	0xd8270019	! t0_kref+0x7f8:   	st	%o4, [%i4 + %i1]
	.word	0xa7a0188d	! t0_kref+0x7fc:   	fitos	%f13, %f19
	.word	0x9bab4031	! t0_kref+0x800:   	fmovsle	%fcc0, %f17, %f13
	.word	0xa5a4092d	! t0_kref+0x804:   	fmuls	%f16, %f13, %f18
	.word	0xa5a2894e	! t0_kref+0x808:   	fmuld	%f10, %f14, %f18
	.word	0x3e800003	! t0_kref+0x80c:   	bvc,a	_kref+0x818
	.word	0xe100a000	! t0_kref+0x810:   	ld	[%g2], %f16
	.word	0x97a2c92f	! t0_kref+0x814:   	fmuls	%f11, %f15, %f11
	.word	0xa5b38d8c	! t0_kref+0x818:   	fxor	%f14, %f12, %f18
	.word	0xa3a0108e	! t0_kref+0x81c:   	fxtos	%f14, %f17
	.word	0x9db40af2	! t0_kref+0x820:   	fpsub32s	%f16, %f18, %f14
	.word	0xa5a40952	! t0_kref+0x824:   	fmuld	%f16, %f18, %f18
	.word	0xf7ee101d	! t0_kref+0x828:   	prefetcha	%i0 + %i5, 27
	.word	0xd920a000	! t0_kref+0x82c:   	st	%f12, [%g2]
	.word	0x81abcab0	! t0_kref+0x830:   	fcmpes	%fcc0, %f15, %f16
	.word	0x95a4092e	! t0_kref+0x834:   	fmuls	%f16, %f14, %f10
	.word	0x86102003	! t0_kref+0x838:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x83c:   	bne,a	_kref+0x83c
	.word	0x86a0e001	! t0_kref+0x840:   	subcc	%g3, 1, %g3
	.word	0xa3a4482f	! t0_kref+0x844:   	fadds	%f17, %f15, %f17
	.word	0xa7b2caf0	! t0_kref+0x848:   	fpsub32s	%f11, %f16, %f19
	.word	0xa80b3e3f	! t0_kref+0x84c:   	and	%o4, -0x1c1, %l4
	.word	0x8143c000	! t0_kref+0x850:   	stbar
	.word	0x2f800008	! t0_kref+0x854:   	fbu,a	_kref+0x874
	.word	0xe51fbda0	! t0_kref+0x858:   	ldd	[%fp - 0x260], %f18
	.word	0xdda01019	! t0_kref+0x85c:   	sta	%f14, [%g0 + %i1]0x80
	.word	0xe36e2008	! t0_kref+0x860:   	prefetch	%i0 + 8, 17
	.word	0x961b3486	! t0_kref+0x864:   	xor	%o4, -0xb7a, %o3
	.word	0x81accaab	! t0_kref+0x868:   	fcmpes	%fcc0, %f19, %f11
	.word	0xd53e001d	! t0_kref+0x86c:   	std	%f10, [%i0 + %i5]
	.word	0xda264000	! t0_kref+0x870:   	st	%o5, [%i1]
	.word	0xf16e401b	! t0_kref+0x874:   	prefetch	%i1 + %i3, 24
	.word	0xe60e7ff9	! t0_kref+0x878:   	ldub	[%i1 - 7], %l3
	.word	0x9fa01a52	! t0_kref+0x87c:   	fdtoi	%f18, %f15
	.word	0xa93b600a	! t0_kref+0x880:   	sra	%o5, 0xa, %l4
	.word	0xe1be1a1a	! t0_kref+0x884:   	stda	%f16, [%i0 + %i2]0xd0
	.word	0xed68a047	! t0_kref+0x888:   	prefetch	%g2 + 0x47, 22
	.word	0x99b286d2	! t0_kref+0x88c:   	fmul8sux16	%f10, %f18, %f12
	.word	0xea901018	! t0_kref+0x890:   	lduha	[%g0 + %i0]0x80, %l5
	.word	0xab2b2007	! t0_kref+0x894:   	sll	%o4, 0x7, %l5
	.word	0xa5b30670	! t0_kref+0x898:   	fmul8x16au	%f12, %f16, %f18
	.word	0x92e3000d	! t0_kref+0x89c:   	subccc	%o4, %o5, %o1
	.word	0xab400000	! t0_kref+0x8a0:   	mov	%y, %l5
	.word	0x9013000d	! t0_kref+0x8a4:   	or	%o4, %o5, %o0
	.word	0x91b3008d	! t0_kref+0x8a8:   	edge16	%o4, %o5, %o0
	.word	0xd210a012	! t0_kref+0x8ac:   	lduh	[%g2 + 0x12], %o1
	.word	0x8143e040	! t0_kref+0x8b0:   	membar	0x40
	.word	0xa1b38ea0	! t0_kref+0x8b4:   	fsrc1s	%f14, %f16
	.word	0x9333000d	! t0_kref+0x8b8:   	srl	%o4, %o5, %o1
	.word	0x95a00033	! t0_kref+0x8bc:   	fmovs	%f19, %f10
	.word	0xd2680018	! t0_kref+0x8c0:   	ldstub	[%g0 + %i0], %o1
	.word	0x81ac0aad	! t0_kref+0x8c4:   	fcmpes	%fcc0, %f16, %f13
	.word	0x9da44833	! t0_kref+0x8c8:   	fadds	%f17, %f19, %f14
	.word	0x2d800004	! t0_kref+0x8cc:   	fbg,a	_kref+0x8dc
	.word	0x99abc04e	! t0_kref+0x8d0:   	fmovdo	%fcc0, %f14, %f12
	.word	0xa3703d8c	! t0_kref+0x8d4:   	popc	-0x274, %l1
	.word	0x91400000	! t0_kref+0x8d8:   	mov	%y, %o0
	.word	0xa3b48aac	! t0_kref+0x8dc:   	fpsub16s	%f18, %f12, %f17
	.word	0xd51e6018	! t0_kref+0x8e0:   	ldd	[%i1 + 0x18], %f10
	.word	0x22480008	! t0_kref+0x8e4:   	be,a,pt	%icc, _kref+0x904
	.word	0xe96e001d	! t0_kref+0x8e8:   	prefetch	%i0 + %i5, 20
	.word	0xa1a408d0	! t0_kref+0x8ec:   	fsubd	%f16, %f16, %f16
	.word	0x23480001	! t0_kref+0x8f0:   	fbne,a,pt	%fcc0, _kref+0x8f4
	.word	0xa8fb7f4b	! t0_kref+0x8f4:   	sdivcc	%o5, -0xb5, %l4
	.word	0xa8933cea	! t0_kref+0x8f8:   	orcc	%o4, -0x316, %l4
	.word	0xaa932e77	! t0_kref+0x8fc:   	orcc	%o4, 0xe77, %l5
	.word	0xa1b30ecc	! t0_kref+0x900:   	fornot2	%f12, %f12, %f16
	.word	0xab3b201a	! t0_kref+0x904:   	sra	%o4, 0x1a, %l5
	.word	0x9de3bfa0	! t0_kref+0x908:   	save	%sp, -0x60, %sp
	.word	0xbadec01d	! t0_kref+0x90c:   	smulcc	%i3, %i5, %i5
	.word	0xabef2c5a	! t0_kref+0x910:   	restore	%i4, 0xc5a, %l5
	.word	0xc96e3fe8	! t0_kref+0x914:   	prefetch	%i0 - 0x18, 4
	.word	0xea06001c	! t0_kref+0x918:   	ld	[%i0 + %i4], %l5
	.word	0xa1a0110a	! t0_kref+0x91c:   	fxtod	%f10, %f16
	.word	0x2f480006	! t0_kref+0x920:   	fbu,a,pt	%fcc0, _kref+0x938
	.word	0xad400000	! t0_kref+0x924:   	mov	%y, %l6
	.word	0xc807bff0	! t0_kref+0x928:   	ld	[%fp - 0x10], %g4
	.word	0x9db40a0e	! t0_kref+0x92c:   	fpadd16	%f16, %f14, %f14
	.word	0xa1a01890	! t0_kref+0x930:   	fitos	%f16, %f16
	.word	0xe608a020	! t0_kref+0x934:   	ldub	[%g2 + 0x20], %l3
	.word	0x9da0054c	! t0_kref+0x938:   	fsqrtd	%f12, %f14
	.word	0xaa63400c	! t0_kref+0x93c:   	subc	%o5, %o4, %l5
	.word	0xe20e8019	! t0_kref+0x940:   	ldub	[%i2 + %i1], %l1
	.word	0xa7a018d2	! t0_kref+0x944:   	fdtos	%f18, %f19
	.word	0xee6e8019	! t0_kref+0x948:   	ldstub	[%i2 + %i1], %l7
	.word	0x9613400d	! t0_kref+0x94c:   	or	%o5, %o5, %o3
	.word	0x9fc10000	! t0_kref+0x950:   	call	%g4
	.word	0xa5400000	! t0_kref+0x954:   	mov	%y, %l2
	.word	0x9de3bfa0	! t0_kref+0x958:   	save	%sp, -0x60, %sp
	.word	0xa7ee22e9	! t0_kref+0x95c:   	restore	%i0, 0x2e9, %l3
	.word	0xda200018	! t0_kref+0x960:   	st	%o5, [%g0 + %i0]
	.word	0xa3418000	! t0_kref+0x964:   	mov	%fprs, %l1
	.word	0x2e480007	! t0_kref+0x968:   	bvs,a,pt	%icc, _kref+0x984
	.word	0xe03e4000	! t0_kref+0x96c:   	std	%l0, [%i1]
	.word	0xa5b2c672	! t0_kref+0x970:   	fmul8x16au	%f11, %f18, %f18
	.word	0xed20001c	! t0_kref+0x974:   	st	%f22, [%g0 + %i4]
	.word	0xa5b4066f	! t0_kref+0x978:   	fmul8x16au	%f16, %f15, %f18
	.word	0xa1b48f90	! t0_kref+0x97c:   	for	%f18, %f16, %f16
	.word	0x3c480003	! t0_kref+0x980:   	bpos,a,pt	%icc, _kref+0x98c
	.word	0xe1981018	! t0_kref+0x984:   	ldda	[%g0 + %i0]0x80, %f16
	.word	0x27480002	! t0_kref+0x988:   	fbul,a,pt	%fcc0, _kref+0x990
	.word	0x91702958	! t0_kref+0x98c:   	popc	0x958, %o0
	.word	0x81b01023	! t0_kref+0x990:   	siam	0x3
	.word	0xad2b400c	! t0_kref+0x994:   	sll	%o5, %o4, %l6
	.word	0x9fc10000	! t0_kref+0x998:   	call	%g4
	.word	0xa5a3c932	! t0_kref+0x99c:   	fmuls	%f15, %f18, %f18
	.word	0xe2080019	! t0_kref+0x9a0:   	ldub	[%g0 + %i1], %l1
	.word	0x81ab4aae	! t0_kref+0x9a4:   	fcmpes	%fcc0, %f13, %f14
	.word	0xd60e0000	! t0_kref+0x9a8:   	ldub	[%i0], %o3
	.word	0x86102001	! t0_kref+0x9ac:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x9b0:   	bne,a	_kref+0x9b0
	.word	0x86a0e001	! t0_kref+0x9b4:   	subcc	%g3, 1, %g3
	.word	0xaa236b81	! t0_kref+0x9b8:   	sub	%o5, 0xb81, %l5
	.word	0xd648a015	! t0_kref+0x9bc:   	ldsb	[%g2 + 0x15], %o3
	.word	0xed6e7ff0	! t0_kref+0x9c0:   	prefetch	%i1 - 0x10, 22
	.word	0xea40a030	! t0_kref+0x9c4:   	ldsw	[%g2 + 0x30], %l5
	.word	0xe01e401d	! t0_kref+0x9c8:   	ldd	[%i1 + %i5], %l0
	.word	0xad2b000d	! t0_kref+0x9cc:   	sll	%o4, %o5, %l6
	.word	0x97b3410c	! t0_kref+0x9d0:   	edge32	%o5, %o4, %o3
	.word	0xa9400000	! t0_kref+0x9d4:   	mov	%y, %l4
	.word	0x99a0052f	! t0_kref+0x9d8:   	fsqrts	%f15, %f12
	.word	0xaaa33b40	! t0_kref+0x9dc:   	subcc	%o4, -0x4c0, %l5
	.word	0x38480006	! t0_kref+0x9e0:   	bgu,a,pt	%icc, _kref+0x9f8
	.word	0x9db40d12	! t0_kref+0x9e4:   	fandnot1	%f16, %f18, %f14
	.word	0xd40e8019	! t0_kref+0x9e8:   	ldub	[%i2 + %i1], %o2
	.word	0x35800005	! t0_kref+0x9ec:   	fbue,a	_kref+0xa00
	.word	0x92737105	! t0_kref+0x9f0:   	udiv	%o5, -0xefb, %o1
	.word	0x81ac4aac	! t0_kref+0x9f4:   	fcmpes	%fcc0, %f17, %f12
	.word	0xa5a409d2	! t0_kref+0x9f8:   	fdivd	%f16, %f18, %f18
	.word	0x95a01893	! t0_kref+0x9fc:   	fitos	%f19, %f10
	.word	0xd4080019	! t0_kref+0xa00:   	ldub	[%g0 + %i1], %o2
	.word	0x33800004	! t0_kref+0xa04:   	fbe,a	_kref+0xa14
	.word	0x9da30850	! t0_kref+0xa08:   	faddd	%f12, %f16, %f14
	.word	0x971b000c	! t0_kref+0xa0c:   	tsubcctv	%o4, %o4, %o3
	.word	0xa5a0054c	! t0_kref+0xa10:   	fsqrtd	%f12, %f18
	.word	0xe500a014	! t0_kref+0xa14:   	ld	[%g2 + 0x14], %f18
	.word	0xa6b326c4	! t0_kref+0xa18:   	orncc	%o4, 0x6c4, %l3
	.word	0x9da0054a	! t0_kref+0xa1c:   	fsqrtd	%f10, %f14
	.word	0x99b38d60	! t0_kref+0xa20:   	fnot1s	%f14, %f12
	.word	0x99b4cd2d	! t0_kref+0xa24:   	fandnot1s	%f19, %f13, %f12
	.word	0x9da288ce	! t0_kref+0xa28:   	fsubd	%f10, %f14, %f14
	.word	0xd4580019	! t0_kref+0xa2c:   	ldx	[%g0 + %i1], %o2
	.word	0x28800006	! t0_kref+0xa30:   	bleu,a	_kref+0xa48
	.word	0xe51e3ff0	! t0_kref+0xa34:   	ldd	[%i0 - 0x10], %f18
	.word	0x97a44932	! t0_kref+0xa38:   	fmuls	%f17, %f18, %f11
	.word	0xd700a028	! t0_kref+0xa3c:   	ld	[%g2 + 0x28], %f11
	.word	0xa1a01892	! t0_kref+0xa40:   	fitos	%f18, %f16
	.word	0x2f800002	! t0_kref+0xa44:   	fbu,a	_kref+0xa4c
	.word	0xa483400d	! t0_kref+0xa48:   	addcc	%o5, %o5, %l2
	.word	0xe8ce505a	! t0_kref+0xa4c:   	ldsba	[%i1 + %i2]0x82, %l4
	.word	0xaca337c5	! t0_kref+0xa50:   	subcc	%o4, -0x83b, %l6
	.word	0xa52b2018	! t0_kref+0xa54:   	sll	%o4, 0x18, %l2
	.word	0xa5b3010d	! t0_kref+0xa58:   	edge32	%o4, %o5, %l2
	.word	0xab2b000c	! t0_kref+0xa5c:   	sll	%o4, %o4, %l5
	.word	0xa303675c	! t0_kref+0xa60:   	taddcc	%o5, 0x75c, %l1
	.word	0xae237596	! t0_kref+0xa64:   	sub	%o5, -0xa6a, %l7
	.word	0x97a2c82b	! t0_kref+0xa68:   	fadds	%f11, %f11, %f11
	.word	0x951b000c	! t0_kref+0xa6c:   	tsubcctv	%o4, %o4, %o2
	.word	0xea16201e	! t0_kref+0xa70:   	lduh	[%i0 + 0x1e], %l5
	.word	0xd9be188d	! t0_kref+0xa74:   	stda	%f12, [%i0 + %o5]0xc4
	.word	0x23480002	! t0_kref+0xa78:   	fbne,a,pt	%fcc0, _kref+0xa80
	.word	0xa9b3014d	! t0_kref+0xa7c:   	edge32l	%o4, %o5, %l4
	.word	0xedee101a	! t0_kref+0xa80:   	prefetcha	%i0 + %i2, 22
	.word	0xaa93400d	! t0_kref+0xa84:   	orcc	%o5, %o5, %l5
	.word	0xee4e3feb	! t0_kref+0xa88:   	ldsb	[%i0 - 0x15], %l7
	.word	0xe41e3fe0	! t0_kref+0xa8c:   	ldd	[%i0 - 0x20], %l2
	.word	0xa7400000	! t0_kref+0xa90:   	mov	%y, %l3
	.word	0xc3ee500d	! t0_kref+0xa94:   	prefetcha	%i1 + %o5, 1
	.word	0x95a000d0	! t0_kref+0xa98:   	fnegd	%f16, %f10
	.word	0xd050a038	! t0_kref+0xa9c:   	ldsh	[%g2 + 0x38], %o0
	.word	0xff6e2018	! t0_kref+0xaa0:   	prefetch	%i0 + 0x18, 31
	.word	0xec1e2018	! t0_kref+0xaa4:   	ldd	[%i0 + 0x18], %l6
	.word	0xe100a03c	! t0_kref+0xaa8:   	ld	[%g2 + 0x3c], %f16
	.word	0xd448a000	! t0_kref+0xaac:   	ldsb	[%g2], %o2
	.word	0xd010a02e	! t0_kref+0xab0:   	lduh	[%g2 + 0x2e], %o0
	.word	0x9da00031	! t0_kref+0xab4:   	fmovs	%f17, %f14
	.word	0xa2c3000c	! t0_kref+0xab8:   	addccc	%o4, %o4, %l1
	.word	0x3f800004	! t0_kref+0xabc:   	fbo,a	_kref+0xacc
	.word	0x929b6e3d	! t0_kref+0xac0:   	xorcc	%o5, 0xe3d, %o1
	.word	0x95a00552	! t0_kref+0xac4:   	fsqrtd	%f18, %f10
	.word	0xa7a4882f	! t0_kref+0xac8:   	fadds	%f18, %f15, %f19
	.word	0xa27b000d	! t0_kref+0xacc:   	sdiv	%o4, %o5, %l1
	.word	0xe6ff1019	! t0_kref+0xad0:   	swapa	[%i4 + %i1]0x80, %l3
	.word	0xa5b48a10	! t0_kref+0xad4:   	fpadd16	%f18, %f16, %f18
	.word	0xa7a0052f	! t0_kref+0xad8:   	fsqrts	%f15, %f19
	.word	0x95b4840c	! t0_kref+0xadc:   	fcmple16	%f18, %f12, %o2
	.word	0x99b48a0c	! t0_kref+0xae0:   	fpadd16	%f18, %f12, %f12
	.word	0xd0881019	! t0_kref+0xae4:   	lduba	[%g0 + %i1]0x80, %o0
	.word	0x91b3410c	! t0_kref+0xae8:   	edge32	%o5, %o4, %o0
	.word	0xda2e4000	! t0_kref+0xaec:   	stb	%o5, [%i1]
	.word	0x99a00552	! t0_kref+0xaf0:   	fsqrtd	%f18, %f12
	.word	0xaaa3000d	! t0_kref+0xaf4:   	subcc	%o4, %o5, %l5
	.word	0x9fc00004	! t0_kref+0xaf8:   	call	%g0 + %g4
	.word	0x97a48930	! t0_kref+0xafc:   	fmuls	%f18, %f16, %f11
	.word	0x900b400d	! t0_kref+0xb00:   	and	%o5, %o5, %o0
	.word	0x3d480004	! t0_kref+0xb04:   	fbule,a,pt	%fcc0, _kref+0xb14
	.word	0xec965000	! t0_kref+0xb08:   	lduha	[%i1]0x80, %l6
	.word	0x95a0052a	! t0_kref+0xb0c:   	fsqrts	%f10, %f10
	.word	0x9fa01890	! t0_kref+0xb10:   	fitos	%f16, %f15
	.word	0xa7a01a52	! t0_kref+0xb14:   	fdtoi	%f18, %f19
	.word	0xaf3b400c	! t0_kref+0xb18:   	sra	%o5, %o4, %l7
	.word	0xa803000c	! t0_kref+0xb1c:   	add	%o4, %o4, %l4
	.word	0xe03e3ff0	! t0_kref+0xb20:   	std	%l0, [%i0 - 0x10]
	.word	0x8143c000	! t0_kref+0xb24:   	stbar
	.word	0x2a800001	! t0_kref+0xb28:   	bcs,a	_kref+0xb2c
	.word	0xe51fbe60	! t0_kref+0xb2c:   	ldd	[%fp - 0x1a0], %f18
	.word	0xd8280018	! t0_kref+0xb30:   	stb	%o4, [%g0 + %i0]
	.word	0x9da2c82b	! t0_kref+0xb34:   	fadds	%f11, %f11, %f14
	.word	0xe200a004	! t0_kref+0xb38:   	ld	[%g2 + 4], %l1
	.word	0x8143e040	! t0_kref+0xb3c:   	membar	0x40
	.word	0x3d480004	! t0_kref+0xb40:   	fbule,a,pt	%fcc0, _kref+0xb50
	.word	0xa863400c	! t0_kref+0xb44:   	subc	%o5, %o4, %l4
	.word	0x81ab4ab2	! t0_kref+0xb48:   	fcmpes	%fcc0, %f13, %f18
	.word	0xe600a020	! t0_kref+0xb4c:   	ld	[%g2 + 0x20], %l3
	.word	0x81aa8acc	! t0_kref+0xb50:   	fcmped	%fcc0, %f10, %f12
	.word	0x973b400d	! t0_kref+0xb54:   	sra	%o5, %o5, %o3
	.word	0x81ac4aaa	! t0_kref+0xb58:   	fcmpes	%fcc0, %f17, %f10
	.word	0x99a0110a	! t0_kref+0xb5c:   	fxtod	%f10, %f12
	.word	0xa413400c	! t0_kref+0xb60:   	or	%o5, %o4, %l2
	.word	0xabb48412	! t0_kref+0xb64:   	fcmple16	%f18, %f18, %l5
	.word	0x95a0054a	! t0_kref+0xb68:   	fsqrtd	%f10, %f10
	.word	0x39800002	! t0_kref+0xb6c:   	fbuge,a	_kref+0xb74
	.word	0x952b6002	! t0_kref+0xb70:   	sll	%o5, 0x2, %o2
	.word	0x86102002	! t0_kref+0xb74:   	mov	0x2, %g3
	.word	0x86a0e001	! t0_kref+0xb78:   	subcc	%g3, 1, %g3
	.word	0x22800015	! t0_kref+0xb7c:   	be,a	_kref+0xbd0
	.word	0xec48a010	! t0_kref+0xb80:   	ldsb	[%g2 + 0x10], %l6
	.word	0x81ac0a50	! t0_kref+0xb84:   	fcmpd	%fcc0, %f16, %f16
	.word	0xa1a4094c	! t0_kref+0xb88:   	fmuld	%f16, %f12, %f16
	.word	0xa293000c	! t0_kref+0xb8c:   	orcc	%o4, %o4, %l1
	.word	0x99a0054e	! t0_kref+0xb90:   	fsqrtd	%f14, %f12
	.word	0xee000018	! t0_kref+0xb94:   	ld	[%g0 + %i0], %l7
	.word	0xa1b28ecc	! t0_kref+0xb98:   	fornot2	%f10, %f12, %f16
	.word	0xa7a44931	! t0_kref+0xb9c:   	fmuls	%f17, %f17, %f19
	.word	0xd04e600a	! t0_kref+0xba0:   	ldsb	[%i1 + 0xa], %o0
	.word	0xa5b009aa	! t0_kref+0xba4:   	fexpand	%f10, %f18
	.word	0xa1b48f92	! t0_kref+0xba8:   	for	%f18, %f18, %f16
	.word	0xdb060000	! t0_kref+0xbac:   	ld	[%i0], %f13
	.word	0x29800006	! t0_kref+0xbb0:   	fbl,a	_kref+0xbc8
	.word	0xd0480018	! t0_kref+0xbb4:   	ldsb	[%g0 + %i0], %o0
	.word	0xa2a3400d	! t0_kref+0xbb8:   	subcc	%o5, %o5, %l1
	.word	0xea06001c	! t0_kref+0xbbc:   	ld	[%i0 + %i4], %l5
	.word	0x99a00550	! t0_kref+0xbc0:   	fsqrtd	%f16, %f12
	.word	0xa3b3016d	! t0_kref+0xbc4:   	edge32ln	%o4, %o5, %l1
	.word	0xe03e401d	! t0_kref+0xbc8:   	std	%l0, [%i1 + %i5]
	.word	0x9fc10000	! t0_kref+0xbcc:   	call	%g4
	.word	0xa1a0054a	! t0_kref+0xbd0:   	fsqrtd	%f10, %f16
	.word	0x9da4cd2a	! t0_kref+0xbd4:   	fsmuld	%f19, %f10, %f14
	.word	0xc06e401a	! t0_kref+0xbd8:   	ldstub	[%i1 + %i2], %g0
	.word	0xe240a034	! t0_kref+0xbdc:   	ldsw	[%g2 + 0x34], %l1
	.word	0x8143c000	! t0_kref+0xbe0:   	stbar
	.word	0xd51fbce0	! t0_kref+0xbe4:   	ldd	[%fp - 0x320], %f10
	.word	0x29800004	! t0_kref+0xbe8:   	fbl,a	_kref+0xbf8
	.word	0xd51fbc38	! t0_kref+0xbec:   	ldd	[%fp - 0x3c8], %f10
	.word	0x95a0054e	! t0_kref+0xbf0:   	fsqrtd	%f14, %f10
	.word	0xd86e4000	! t0_kref+0xbf4:   	ldstub	[%i1], %o4
	.word	0x9de3bfa0	! t0_kref+0xbf8:   	save	%sp, -0x60, %sp
	.word	0xafef7ef2	! t0_kref+0xbfc:   	restore	%i5, -0x10e, %l7
	.word	0x2d480007	! t0_kref+0xc00:   	fbg,a,pt	%fcc0, _kref+0xc1c
	.word	0xa49b7e9f	! t0_kref+0xc04:   	xorcc	%o5, -0x161, %l2
	.word	0xaac3000c	! t0_kref+0xc08:   	addccc	%o4, %o4, %l5
	.word	0x969b67ca	! t0_kref+0xc0c:   	xorcc	%o5, 0x7ca, %o3
	.word	0xa5a4c82d	! t0_kref+0xc10:   	fadds	%f19, %f13, %f18
	.word	0x95a0054a	! t0_kref+0xc14:   	fsqrtd	%f10, %f10
	.word	0xe6680018	! t0_kref+0xc18:   	ldstub	[%g0 + %i0], %l3
	.word	0xa93b601b	! t0_kref+0xc1c:   	sra	%o5, 0x1b, %l4
	.word	0xab23000d	! t0_kref+0xc20:   	mulscc	%o4, %o5, %l5
	.word	0x99b38a10	! t0_kref+0xc24:   	fpadd16	%f14, %f16, %f12
	.word	0xea2827f2	! t0_kref+0xc28:   	stb	%l5, [%g0 + 0x7f2]
	.word	0x90fb2608	! t0_kref+0xc2c:   	sdivcc	%o4, 0x608, %o0
	.word	0x92c37827	! t0_kref+0xc30:   	addccc	%o5, -0x7d9, %o1
	.word	0xa5a408cc	! t0_kref+0xc34:   	fsubd	%f16, %f12, %f18
	.word	0xa5a4894e	! t0_kref+0xc38:   	fmuld	%f18, %f14, %f18
	.word	0xadb3004d	! t0_kref+0xc3c:   	edge8l	%o4, %o5, %l6
	.word	0x3f800005	! t0_kref+0xc40:   	fbo,a	_kref+0xc54
	.word	0x99b4cd30	! t0_kref+0xc44:   	fandnot1s	%f19, %f16, %f12
	.word	0xa4fb000c	! t0_kref+0xc48:   	sdivcc	%o4, %o4, %l2
	.word	0x912b400c	! t0_kref+0xc4c:   	sll	%o5, %o4, %o0
	.word	0xaa13400c	! t0_kref+0xc50:   	or	%o5, %o4, %l5
	.word	0xc807bfec	! t0_kref+0xc54:   	ld	[%fp - 0x14], %g4
	.word	0xe6080019	! t0_kref+0xc58:   	ldub	[%g0 + %i1], %l3
	.word	0xae2b000d	! t0_kref+0xc5c:   	andn	%o4, %o5, %l7
	.word	0xd68e9018	! t0_kref+0xc60:   	lduba	[%i2 + %i0]0x80, %o3
	.word	0xa1a0102b	! t0_kref+0xc64:   	fstox	%f11, %f16
	.word	0xe13e6000	! t0_kref+0xc68:   	std	%f16, [%i1]
	.word	0xeb68a009	! t0_kref+0xc6c:   	prefetch	%g2 + 9, 21
	.word	0xda26001c	! t0_kref+0xc70:   	st	%o5, [%i0 + %i4]
	.word	0x31800005	! t0_kref+0xc74:   	fba,a	_kref+0xc88
	.word	0xe59f5018	! t0_kref+0xc78:   	ldda	[%i5 + %i0]0x80, %f18
	.word	0x90d3000c	! t0_kref+0xc7c:   	umulcc	%o4, %o4, %o0
	.word	0x9433400c	! t0_kref+0xc80:   	orn	%o5, %o4, %o2
	.word	0xe648a02b	! t0_kref+0xc84:   	ldsb	[%g2 + 0x2b], %l3
	.word	0xa9b34200	! t0_kref+0xc88:   	array8	%o5, %g0, %l4
	.word	0xa5a01a4a	! t0_kref+0xc8c:   	fdtoi	%f10, %f18
	.word	0x9ba018ca	! t0_kref+0xc90:   	fdtos	%f10, %f13
	.word	0xe100a038	! t0_kref+0xc94:   	ld	[%g2 + 0x38], %f16
	.word	0xa1b48f8a	! t0_kref+0xc98:   	for	%f18, %f10, %f16
	.word	0xa6637ebe	! t0_kref+0xc9c:   	subc	%o5, -0x142, %l3
	.word	0xe51fbcc0	! t0_kref+0xca0:   	ldd	[%fp - 0x340], %f18
	.word	0xa82b72aa	! t0_kref+0xca4:   	andn	%o5, -0xd56, %l4
	.word	0xec180018	! t0_kref+0xca8:   	ldd	[%g0 + %i0], %l6
	call	SYM(t0_subr3)
	.word	0x81de0009	! t0_kref+0xcb0:   	flush	%i0 + %o1
	.word	0x9da0012b	! t0_kref+0xcb4:   	fabss	%f11, %f14
	.word	0x9203000c	! t0_kref+0xcb8:   	add	%o4, %o4, %o1
	.word	0x9dab0031	! t0_kref+0xcbc:   	fmovsuge	%fcc0, %f17, %f14
	.word	0xe13f4018	! t0_kref+0xcc0:   	std	%f16, [%i5 + %i0]
	.word	0xe03e401d	! t0_kref+0xcc4:   	std	%l0, [%i1 + %i5]
	.word	0xc568a04f	! t0_kref+0xcc8:   	prefetch	%g2 + 0x4f, 2
	.word	0xdb06401c	! t0_kref+0xccc:   	ld	[%i1 + %i4], %f13
	.word	0xd210a02c	! t0_kref+0xcd0:   	lduh	[%g2 + 0x2c], %o1
	.word	0xe268a01b	! t0_kref+0xcd4:   	ldstub	[%g2 + 0x1b], %l1
	.word	0x96037bdf	! t0_kref+0xcd8:   	add	%o5, -0x421, %o3
	.word	0xac636966	! t0_kref+0xcdc:   	subc	%o5, 0x966, %l6
	.word	0x99b4c971	! t0_kref+0xce0:   	fpmerge	%f19, %f17, %f12
	.word	0x81ab4aab	! t0_kref+0xce4:   	fcmpes	%fcc0, %f13, %f11
	.word	0x95a0108c	! t0_kref+0xce8:   	fxtos	%f12, %f10
	.word	0xa693400d	! t0_kref+0xcec:   	orcc	%o5, %o5, %l3
	.word	0xaa83000d	! t0_kref+0xcf0:   	addcc	%o4, %o5, %l5
	.word	0x9fc00004	! t0_kref+0xcf4:   	call	%g0 + %g4
	.word	0x95a0188b	! t0_kref+0xcf8:   	fitos	%f11, %f10
	.word	0x81aacab0	! t0_kref+0xcfc:   	fcmpes	%fcc0, %f11, %f16
	.word	0xee8e9019	! t0_kref+0xd00:   	lduba	[%i2 + %i1]0x80, %l7
	.word	0x95a0052d	! t0_kref+0xd04:   	fsqrts	%f13, %f10
	.word	0xa53b201f	! t0_kref+0xd08:   	sra	%o4, 0x1f, %l2
	.word	0xa5b28492	! t0_kref+0xd0c:   	fcmple32	%f10, %f18, %l2
	.word	0x8143e040	! t0_kref+0xd10:   	membar	0x40
	.word	0xa823400d	! t0_kref+0xd14:   	sub	%o5, %o5, %l4
	.word	0x95a01a4a	! t0_kref+0xd18:   	fdtoi	%f10, %f10
	.word	0x28800008	! t0_kref+0xd1c:   	bleu,a	_kref+0xd3c
	.word	0xa1a8c04c	! t0_kref+0xd20:   	fmovdul	%fcc0, %f12, %f16
	.word	0x37800006	! t0_kref+0xd24:   	fbge,a	_kref+0xd3c
	.word	0xea4e3ff9	! t0_kref+0xd28:   	ldsb	[%i0 - 7], %l5
	.word	0xa9400000	! t0_kref+0xd2c:   	mov	%y, %l4
	.word	0xe51e401d	! t0_kref+0xd30:   	ldd	[%i1 + %i5], %f18
	.word	0x33800004	! t0_kref+0xd34:   	fbe,a	_kref+0xd44
	.word	0x9db48d2b	! t0_kref+0xd38:   	fandnot1s	%f18, %f11, %f14
	.word	0xa2ab3cfb	! t0_kref+0xd3c:   	andncc	%o4, -0x305, %l1
	.word	0xea4e7ff1	! t0_kref+0xd40:   	ldsb	[%i1 - 0xf], %l5
	.word	0xd920a014	! t0_kref+0xd44:   	st	%f12, [%g2 + 0x14]
	.word	0x9da0054e	! t0_kref+0xd48:   	fsqrtd	%f14, %f14
	.word	0x3d800004	! t0_kref+0xd4c:   	fbule,a	_kref+0xd5c
	.word	0xe6de501d	! t0_kref+0xd50:   	ldxa	[%i1 + %i5]0x80, %l3
	.word	0xe03e6008	! t0_kref+0xd54:   	std	%l0, [%i1 + 8]
	.word	0x81dbbf3f	! t0_kref+0xd58:   	flush	%sp - 0xc1
	.word	0xd9beda58	! t0_kref+0xd5c:   	stda	%f12, [%i3 + %i0]0xd2
	.word	0x95b2cf6c	! t0_kref+0xd60:   	fornot1s	%f11, %f12, %f10
	.word	0xda2e4000	! t0_kref+0xd64:   	stb	%o5, [%i1]
	.word	0xe81e0000	! t0_kref+0xd68:   	ldd	[%i0], %l4
	.word	0xa5b40e80	! t0_kref+0xd6c:   	fsrc1	%f16, %f18
	.word	0x97b30240	! t0_kref+0xd70:   	array16	%o4, %g0, %o3
	.word	0x3f480005	! t0_kref+0xd74:   	fbo,a,pt	%fcc0, _kref+0xd88
	.word	0xa93b000d	! t0_kref+0xd78:   	sra	%o4, %o5, %l4
	.word	0x37480001	! t0_kref+0xd7c:   	fbge,a,pt	%fcc0, _kref+0xd80
	.word	0xab2b6018	! t0_kref+0xd80:   	sll	%o5, 0x18, %l5
	.word	0x81db801e	! t0_kref+0xd84:   	flush	%sp + %fp
	.word	0xd53e3fe8	! t0_kref+0xd88:   	std	%f10, [%i0 - 0x18]
	.word	0x9db28a12	! t0_kref+0xd8c:   	fpadd16	%f10, %f18, %f14
	.word	0x9bb38db3	! t0_kref+0xd90:   	fxors	%f14, %f19, %f13
	.word	0xa7400000	! t0_kref+0xd94:   	mov	%y, %l3
	.word	0x9093000d	! t0_kref+0xd98:   	orcc	%o4, %o5, %o0
	.word	0x97a30932	! t0_kref+0xd9c:   	fmuls	%f12, %f18, %f11
	.word	0x95a00030	! t0_kref+0xda0:   	fmovs	%f16, %f10
	.word	0x33480007	! t0_kref+0xda4:   	fbe,a,pt	%fcc0, _kref+0xdc0
	.word	0xa7b38d2e	! t0_kref+0xda8:   	fandnot1s	%f14, %f14, %f19
	.word	0x9fb00cec	! t0_kref+0xdac:   	fnot2s	%f12, %f15
	.word	0x37800006	! t0_kref+0xdb0:   	fbge,a	_kref+0xdc8
	.word	0xa3b340cd	! t0_kref+0xdb4:   	edge16l	%o5, %o5, %l1
	.word	0xdfa61000	! t0_kref+0xdb8:   	sta	%f15, [%i0]0x80
	.word	0x95400000	! t0_kref+0xdbc:   	mov	%y, %o2
	.word	0x2a480005	! t0_kref+0xdc0:   	bcs,a,pt	%icc, _kref+0xdd4
	.word	0xd8366004	! t0_kref+0xdc4:   	sth	%o4, [%i1 + 4]
	.word	0x97a0188b	! t0_kref+0xdc8:   	fitos	%f11, %f11
	.word	0x95b28992	! t0_kref+0xdcc:   	bshuffle	%f10, %f18, %f10
	.word	0x2d800005	! t0_kref+0xdd0:   	fbg,a	_kref+0xde4
	.word	0xaeab7185	! t0_kref+0xdd4:   	andncc	%o5, -0xe7b, %l7
	.word	0xd2ce9018	! t0_kref+0xdd8:   	ldsba	[%i2 + %i0]0x80, %o1
	.word	0xe8df5018	! t0_kref+0xddc:   	ldxa	[%i5 + %i0]0x80, %l4
	.word	0xd900a010	! t0_kref+0xde0:   	ld	[%g2 + 0x10], %f12
	.word	0x9da288b2	! t0_kref+0xde4:   	fsubs	%f10, %f18, %f14
	.word	0xeb6e001c	! t0_kref+0xde8:   	prefetch	%i0 + %i4, 21
	.word	0xa4c3400d	! t0_kref+0xdec:   	addccc	%o5, %o5, %l2
	.word	0x940b6697	! t0_kref+0xdf0:   	and	%o5, 0x697, %o2
	.word	0x81ac0a4a	! t0_kref+0xdf4:   	fcmpd	%fcc0, %f16, %f10
	.word	0x91400000	! t0_kref+0xdf8:   	mov	%y, %o0
	.word	0x81830000	! t0_kref+0xdfc:   	wr	%o4, %g0, %y
	.word	0xa3b2cd2a	! t0_kref+0xe00:   	fandnot1s	%f11, %f10, %f17
	.word	0xa2a362e5	! t0_kref+0xe04:   	subcc	%o5, 0x2e5, %l1
	.word	0xe51e6008	! t0_kref+0xe08:   	ldd	[%i1 + 8], %f18
	.word	0x8d83400c	! t0_kref+0xe0c:   	wr	%o5, %o4, %fprs
	.word	0xe51fbda0	! t0_kref+0xe10:   	ldd	[%fp - 0x260], %f18
	.word	0x927b400c	! t0_kref+0xe14:   	sdiv	%o5, %o4, %o1
	.word	0xa66321f9	! t0_kref+0xe18:   	subc	%o4, 0x1f9, %l3
	.word	0x9fc10000	! t0_kref+0xe1c:   	call	%g4
	.word	0xe250a024	! t0_kref+0xe20:   	ldsh	[%g2 + 0x24], %l1
	.word	0xe448a029	! t0_kref+0xe24:   	ldsb	[%g2 + 0x29], %l2
	.word	0xd216c018	! t0_kref+0xe28:   	lduh	[%i3 + %i0], %o1
	.word	0x3b480002	! t0_kref+0xe2c:   	fble,a,pt	%fcc0, _kref+0xe34
	.word	0x93b4044c	! t0_kref+0xe30:   	fcmpne16	%f16, %f12, %o1
	.word	0x910367df	! t0_kref+0xe34:   	taddcc	%o5, 0x7df, %o0
	.word	0xa1a94031	! t0_kref+0xe38:   	fmovsug	%fcc0, %f17, %f16
	.word	0xa3b3858a	! t0_kref+0xe3c:   	fcmpgt32	%f14, %f10, %l1
	.word	0xd000a020	! t0_kref+0xe40:   	ld	[%g2 + 0x20], %o0
	.word	0x2f800001	! t0_kref+0xe44:   	fbu,a	_kref+0xe48
	.word	0x95b40c8e	! t0_kref+0xe48:   	fandnot2	%f16, %f14, %f10
	.word	0xd500a01c	! t0_kref+0xe4c:   	ld	[%g2 + 0x1c], %f10
	.word	0xa1a00531	! t0_kref+0xe50:   	fsqrts	%f17, %f16
	.word	0xd00e8019	! t0_kref+0xe54:   	ldub	[%i2 + %i1], %o0
	.word	0x2a800003	! t0_kref+0xe58:   	bcs,a	_kref+0xe64
	.word	0x97b34aaa	! t0_kref+0xe5c:   	fpsub16s	%f13, %f10, %f11
	.word	0xa3a2c92b	! t0_kref+0xe60:   	fmuls	%f11, %f11, %f17
	.word	0xec6e4000	! t0_kref+0xe64:   	ldstub	[%i1], %l6
	.word	0x9da01931	! t0_kref+0xe68:   	fstod	%f17, %f14
	.word	0x27480003	! t0_kref+0xe6c:   	fbul,a,pt	%fcc0, _kref+0xe78
	.word	0xe4780019	! t0_kref+0xe70:   	swap	[%g0 + %i1], %l2
	.word	0xac73000d	! t0_kref+0xe74:   	udiv	%o4, %o5, %l6
	.word	0xdda65000	! t0_kref+0xe78:   	sta	%f14, [%i1]0x80
	.word	0xe81f4018	! t0_kref+0xe7c:   	ldd	[%i5 + %i0], %l4
	.word	0xa3a01891	! t0_kref+0xe80:   	fitos	%f17, %f17
	.word	0xa63321f3	! t0_kref+0xe84:   	orn	%o4, 0x1f3, %l3
	.word	0xa3a4c82a	! t0_kref+0xe88:   	fadds	%f19, %f10, %f17
	.word	0x99a0054e	! t0_kref+0xe8c:   	fsqrtd	%f14, %f12
	.word	0x28480007	! t0_kref+0xe90:   	bleu,a,pt	%icc, _kref+0xeac
	.word	0xa7b28a6f	! t0_kref+0xe94:   	fpadd32s	%f10, %f15, %f19
	.word	0x36800005	! t0_kref+0xe98:   	bge,a	_kref+0xeac
	.word	0x95b3cab1	! t0_kref+0xe9c:   	fpsub16s	%f15, %f17, %f10
	.word	0xee0e8019	! t0_kref+0xea0:   	ldub	[%i2 + %i1], %l7
	.word	0x81830000	! t0_kref+0xea4:   	wr	%o4, %g0, %y
	.word	0xa5b48d40	! t0_kref+0xea8:   	fnot1	%f18, %f18
	.word	0x9293400c	! t0_kref+0xeac:   	orcc	%o5, %o4, %o1
	.word	0xef68a00f	! t0_kref+0xeb0:   	prefetch	%g2 + 0xf, 23
	.word	0x97b3032c	! t0_kref+0xeb4:   	bmask	%o4, %o4, %o3
	.word	0xae2b400c	! t0_kref+0xeb8:   	andn	%o5, %o4, %l7
	.word	0xa73b000c	! t0_kref+0xebc:   	sra	%o4, %o4, %l3
	.word	0x81ab0ab2	! t0_kref+0xec0:   	fcmpes	%fcc0, %f12, %f18
	.word	0xd608a02d	! t0_kref+0xec4:   	ldub	[%g2 + 0x2d], %o3
	.word	0x99b44d60	! t0_kref+0xec8:   	fnot1s	%f17, %f12
	.word	0x3c800003	! t0_kref+0xecc:   	bpos,a	_kref+0xed8
	.word	0xa1a01112	! t0_kref+0xed0:   	fxtod	%f18, %f16
	.word	0x3e480002	! t0_kref+0xed4:   	bvc,a,pt	%icc, _kref+0xedc
	.word	0xe8480019	! t0_kref+0xed8:   	ldsb	[%g0 + %i1], %l4
	.word	0xdb00a00c	! t0_kref+0xedc:   	ld	[%g2 + 0xc], %f13
	.word	0xe11e2008	! t0_kref+0xee0:   	ldd	[%i0 + 8], %f16
	.word	0xabb40452	! t0_kref+0xee4:   	fcmpne16	%f16, %f18, %l5
	.word	0x9da00552	! t0_kref+0xee8:   	fsqrtd	%f18, %f14
	.word	0x9213000d	! t0_kref+0xeec:   	or	%o4, %o5, %o1
	.word	0xe46e3ff6	! t0_kref+0xef0:   	ldstub	[%i0 - 0xa], %l2
	.word	0xe20e2008	! t0_kref+0xef4:   	ldub	[%i0 + 8], %l1
	.word	0xdb00a018	! t0_kref+0xef8:   	ld	[%g2 + 0x18], %f13
	.word	0xc12e2008	! t0_kref+0xefc:   	st	%fsr, [%i0 + 8]
	.word	0x9da0108e	! t0_kref+0xf00:   	fxtos	%f14, %f14
	.word	0x92236bfe	! t0_kref+0xf04:   	sub	%o5, 0xbfe, %o1
	.word	0xe0be501d	! t0_kref+0xf08:   	stda	%l0, [%i1 + %i5]0x80
	.word	0xd47e6004	! t0_kref+0xf0c:   	swap	[%i1 + 4], %o2
	.word	0xa823000c	! t0_kref+0xf10:   	sub	%o4, %o4, %l4
	.word	0xa5a4094a	! t0_kref+0xf14:   	fmuld	%f16, %f10, %f18
	.word	0xd900a02c	! t0_kref+0xf18:   	ld	[%g2 + 0x2c], %f12
	.word	0xa493400c	! t0_kref+0xf1c:   	orcc	%o5, %o4, %l2
	.word	0xa213400d	! t0_kref+0xf20:   	or	%o5, %o5, %l1
	.word	0xe76e7fe8	! t0_kref+0xf24:   	prefetch	%i1 - 0x18, 19
	.word	0x9633000d	! t0_kref+0xf28:   	orn	%o4, %o5, %o3
	.word	0xf16e401c	! t0_kref+0xf2c:   	prefetch	%i1 + %i4, 24
	.word	0xda762008	! t0_kref+0xf30:   	stx	%o5, [%i0 + 8]
	.word	0xadb3410d	! t0_kref+0xf34:   	edge32	%o5, %o5, %l6
	.word	0x8143c000	! t0_kref+0xf38:   	stbar
	.word	0xa5b40ad2	! t0_kref+0xf3c:   	fpsub32	%f16, %f18, %f18
	.word	0xa6fb000c	! t0_kref+0xf40:   	sdivcc	%o4, %o4, %l3
	.word	0x95a00531	! t0_kref+0xf44:   	fsqrts	%f17, %f10
	.word	0xa5a3482d	! t0_kref+0xf48:   	fadds	%f13, %f13, %f18
	.word	0x99b48ad2	! t0_kref+0xf4c:   	fpsub32	%f18, %f18, %f12
	.word	0xe806200c	! t0_kref+0xf50:   	ld	[%i0 + 0xc], %l4
	.word	0x35800008	! t0_kref+0xf54:   	fbue,a	_kref+0xf74
	.word	0xe81e7fe8	! t0_kref+0xf58:   	ldd	[%i1 - 0x18], %l4
	.word	0xdd380019	! t0_kref+0xf5c:   	std	%f14, [%g0 + %i1]
	.word	0x25480004	! t0_kref+0xf60:   	fblg,a,pt	%fcc0, _kref+0xf70
	.word	0x99b38a0a	! t0_kref+0xf64:   	fpadd16	%f14, %f10, %f12
	.word	0xe64e2002	! t0_kref+0xf68:   	ldsb	[%i0 + 2], %l3
	.word	0x926364a1	! t0_kref+0xf6c:   	subc	%o5, 0x4a1, %o1
	.word	0xa4fb400d	! t0_kref+0xf70:   	sdivcc	%o5, %o5, %l2
	.word	0x99a44930	! t0_kref+0xf74:   	fmuls	%f17, %f16, %f12
	.word	0xacc3400c	! t0_kref+0xf78:   	addccc	%o5, %o4, %l6
	.word	0x8143c000	! t0_kref+0xf7c:   	stbar
	.word	0x9de3bfa0	! t0_kref+0xf80:   	save	%sp, -0x60, %sp
	.word	0xa5e8001a	! t0_kref+0xf84:   	restore	%g0, %i2, %l2
	.word	0xac733734	! t0_kref+0xf88:   	udiv	%o4, -0x8cc, %l6
	.word	0x28480001	! t0_kref+0xf8c:   	bleu,a,pt	%icc, _kref+0xf90
	.word	0xa1b30d8e	! t0_kref+0xf90:   	fxor	%f12, %f14, %f16
	.word	0x93400000	! t0_kref+0xf94:   	mov	%y, %o1
	.word	0xa6632ba0	! t0_kref+0xf98:   	subc	%o4, 0xba0, %l3
	.word	0x9263400d	! t0_kref+0xf9c:   	subc	%o5, %o5, %o1
	.word	0xaa0b725e	! t0_kref+0xfa0:   	and	%o5, -0xda2, %l5
	.word	0xda7e401c	! t0_kref+0xfa4:   	swap	[%i1 + %i4], %o5
	.word	0xa1a0054c	! t0_kref+0xfa8:   	fsqrtd	%f12, %f16
	.word	0xa32b601d	! t0_kref+0xfac:   	sll	%o5, 0x1d, %l1
	.word	0x81ddf5a2	! t0_kref+0xfb0:   	flush	%l7 - 0xa5e
	.word	0xa5400000	! t0_kref+0xfb4:   	mov	%y, %l2
	.word	0xa1a01a4c	! t0_kref+0xfb8:   	fdtoi	%f12, %f16
	.word	0xda266008	! t0_kref+0xfbc:   	st	%o5, [%i1 + 8]
	call	SYM(t0_subr3)
	.word	0xa69b400c	! t0_kref+0xfc4:   	xorcc	%o5, %o4, %l3
	.word	0xdb263fe0	! t0_kref+0xfc8:   	st	%f13, [%i0 - 0x20]
	.word	0x9db306ce	! t0_kref+0xfcc:   	fmul8sux16	%f12, %f14, %f14
	.word	0x93400000	! t0_kref+0xfd0:   	mov	%y, %o1
	.word	0xa6932947	! t0_kref+0xfd4:   	orcc	%o4, 0x947, %l3
	.word	0x9da30850	! t0_kref+0xfd8:   	faddd	%f12, %f16, %f14
	.word	0xd4163ffc	! t0_kref+0xfdc:   	lduh	[%i0 - 4], %o2
	.word	0x9db2898c	! t0_kref+0xfe0:   	bshuffle	%f10, %f12, %f14
	.word	0xc06e601c	! t0_kref+0xfe4:   	ldstub	[%i1 + 0x1c], %g0
	.word	0x9da4492b	! t0_kref+0xfe8:   	fmuls	%f17, %f11, %f14
	.word	0x32800005	! t0_kref+0xfec:   	bne,a	_kref+0x1000
	.word	0x9da0054e	! t0_kref+0xff0:   	fsqrtd	%f14, %f14
	.word	0xa9b34240	! t0_kref+0xff4:   	array16	%o5, %g0, %l4
	.word	0x81accab3	! t0_kref+0xff8:   	fcmpes	%fcc0, %f19, %f19
	.word	0xa453400c	! t0_kref+0xffc:   	umul	%o5, %o4, %l2
	.word	0x95b4472b	! t0_kref+0x1000:   	fmuld8ulx16	%f17, %f11, %f10
	.word	0xd006200c	! t0_kref+0x1004:   	ld	[%i0 + 0xc], %o0
	.word	0x99a0052c	! t0_kref+0x1008:   	fsqrts	%f12, %f12
	.word	0xe03e001d	! t0_kref+0x100c:   	std	%l0, [%i0 + %i5]
	.word	0x9da0054e	! t0_kref+0x1010:   	fsqrtd	%f14, %f14
	.word	0x81580000	! t0_kref+0x1014:   	flushw
	.word	0x27800002	! t0_kref+0x1018:   	fbul,a	_kref+0x1020
	.word	0x94b374e2	! t0_kref+0x101c:   	orncc	%o5, -0xb1e, %o2
	.word	0xda264000	! t0_kref+0x1020:   	st	%o5, [%i1]
	.word	0xa5b340ac	! t0_kref+0x1024:   	edge16n	%o5, %o4, %l2
	.word	0xed68a04f	! t0_kref+0x1028:   	prefetch	%g2 + 0x4f, 22
	.word	0x9fa3092a	! t0_kref+0x102c:   	fmuls	%f12, %f10, %f15
	.word	0xa7a018ca	! t0_kref+0x1030:   	fdtos	%f10, %f19
	.word	0x81de4010	! t0_kref+0x1034:   	flush	%i1 + %l0
	.word	0x25480004	! t0_kref+0x1038:   	fblg,a,pt	%fcc0, _kref+0x1048
	.word	0x9673400d	! t0_kref+0x103c:   	udiv	%o5, %o5, %o3
	.word	0x3b480003	! t0_kref+0x1040:   	fble,a,pt	%fcc0, _kref+0x104c
	.word	0xea4e7fe8	! t0_kref+0x1044:   	ldsb	[%i1 - 0x18], %l5
	.word	0xd6067fe8	! t0_kref+0x1048:   	ld	[%i1 - 0x18], %o3
	.word	0x99a308cc	! t0_kref+0x104c:   	fsubd	%f12, %f12, %f12
	.word	0x24800008	! t0_kref+0x1050:   	ble,a	_kref+0x1070
	.word	0xd91fbed8	! t0_kref+0x1054:   	ldd	[%fp - 0x128], %f12
	.word	0x27480001	! t0_kref+0x1058:   	fbul,a,pt	%fcc0, _kref+0x105c
	.word	0x81db000b	! t0_kref+0x105c:   	flush	%o4 + %o3
	.word	0x37480004	! t0_kref+0x1060:   	fbge,a,pt	%fcc0, _kref+0x1070
	.word	0x95a488ab	! t0_kref+0x1064:   	fsubs	%f18, %f11, %f10
	.word	0xec1e001d	! t0_kref+0x1068:   	ldd	[%i0 + %i5], %l6
	.word	0x92133867	! t0_kref+0x106c:   	or	%o4, -0x799, %o1
	.word	0xa5b28a0a	! t0_kref+0x1070:   	fpadd16	%f10, %f10, %f18
	.word	0xec6e3ff6	! t0_kref+0x1074:   	ldstub	[%i0 - 0xa], %l6
	.word	0xab3b6011	! t0_kref+0x1078:   	sra	%o5, 0x11, %l5
	.word	0x34480007	! t0_kref+0x107c:   	bg,a,pt	%icc, _kref+0x1098
	.word	0xe6163ff8	! t0_kref+0x1080:   	lduh	[%i0 - 8], %l3
	.word	0x9fb38e2d	! t0_kref+0x1084:   	fands	%f14, %f13, %f15
	.word	0x94a3000d	! t0_kref+0x1088:   	subcc	%o4, %o5, %o2
	.word	0x81accaae	! t0_kref+0x108c:   	fcmpes	%fcc0, %f19, %f14
	.word	0xe120a018	! t0_kref+0x1090:   	st	%f16, [%g2 + 0x18]
	.word	0x9ba00531	! t0_kref+0x1094:   	fsqrts	%f17, %f13
	.word	0xad2b6005	! t0_kref+0x1098:   	sll	%o5, 0x5, %l6
	.word	0x99b007aa	! t0_kref+0x109c:   	fpackfix	%f10, %f12
	.word	0xaa93400d	! t0_kref+0x10a0:   	orcc	%o5, %o5, %l5
	.word	0xe03e6010	! t0_kref+0x10a4:   	std	%l0, [%i1 + 0x10]
	.word	0xee40a024	! t0_kref+0x10a8:   	ldsw	[%g2 + 0x24], %l7
	.word	0x83414000	! t0_kref+0x10ac:   	mov	%pc, %g1
	.word	0x99b38d40	! t0_kref+0x10b0:   	fnot1	%f14, %f12
	.word	0xee06401c	! t0_kref+0x10b4:   	ld	[%i1 + %i4], %l7
	.word	0x92b3000c	! t0_kref+0x10b8:   	orncc	%o4, %o4, %o1
	.word	0xd830a03c	! t0_kref+0x10bc:   	sth	%o4, [%g2 + 0x3c]
	.word	0x21800005	! t0_kref+0x10c0:   	fbn,a	_kref+0x10d4
	.word	0xe03f4019	! t0_kref+0x10c4:   	std	%l0, [%i5 + %i1]
	.word	0xa663000c	! t0_kref+0x10c8:   	subc	%o4, %o4, %l3
	.word	0x24800002	! t0_kref+0x10cc:   	ble,a	_kref+0x10d4
	.word	0xa3b3008d	! t0_kref+0x10d0:   	edge16	%o4, %o5, %l1
	.word	0x969b7e30	! t0_kref+0x10d4:   	xorcc	%o5, -0x1d0, %o3
	.word	0xa1a00552	! t0_kref+0x10d8:   	fsqrtd	%f18, %f16
	.word	0x94033eab	! t0_kref+0x10dc:   	add	%o4, -0x155, %o2
	.word	0xac93400c	! t0_kref+0x10e0:   	orcc	%o5, %o4, %l6
	.word	0x8143c000	! t0_kref+0x10e4:   	stbar
	.word	0xdaae9019	! t0_kref+0x10e8:   	stba	%o5, [%i2 + %i1]0x80
	.word	0xc96e400d	! t0_kref+0x10ec:   	prefetch	%i1 + %o5, 4
	.word	0xe2ce9019	! t0_kref+0x10f0:   	ldsba	[%i2 + %i1]0x80, %l1
	.word	0x97a00532	! t0_kref+0x10f4:   	fsqrts	%f18, %f11
	.word	0xe24e4000	! t0_kref+0x10f8:   	ldsb	[%i1], %l1
	.word	0x9da0192f	! t0_kref+0x10fc:   	fstod	%f15, %f14
	.word	0xe53e2008	! t0_kref+0x1100:   	std	%f18, [%i0 + 8]
	.word	0x99a30d2d	! t0_kref+0x1104:   	fsmuld	%f12, %f13, %f12
	.word	0xacfb74ae	! t0_kref+0x1108:   	sdivcc	%o5, -0xb52, %l6
	.word	0x920b000d	! t0_kref+0x110c:   	and	%o4, %o5, %o1
	.word	0xa21b400c	! t0_kref+0x1110:   	xor	%o5, %o4, %l1
	.word	0x9da2c92f	! t0_kref+0x1114:   	fmuls	%f11, %f15, %f14
	.word	0xdaf75019	! t0_kref+0x1118:   	stxa	%o5, [%i5 + %i1]0x80
	.word	0x99b38dae	! t0_kref+0x111c:   	fxors	%f14, %f14, %f12
	.word	0xe410a01a	! t0_kref+0x1120:   	lduh	[%g2 + 0x1a], %l2
	.word	0xae2321cf	! t0_kref+0x1124:   	sub	%o4, 0x1cf, %l7
	.word	0xda263fe0	! t0_kref+0x1128:   	st	%o5, [%i0 - 0x20]
	.word	0x81abcab3	! t0_kref+0x112c:   	fcmpes	%fcc0, %f15, %f19
	.word	0x8143c000	! t0_kref+0x1130:   	stbar
	.word	0xa1a2c92b	! t0_kref+0x1134:   	fmuls	%f11, %f11, %f16
	.word	0x878020e0	! t0_kref+0x1138:   	mov	0xe0, %asi
	.word	0xd006401c	! t0_kref+0x113c:   	ld	[%i1 + %i4], %o0
	.word	0x30800007	! t0_kref+0x1140:   	ba,a	_kref+0x115c
	.word	0xab3b000c	! t0_kref+0x1144:   	sra	%o4, %o4, %l5
	.word	0x91b3002d	! t0_kref+0x1148:   	edge8n	%o4, %o5, %o0
	.word	0x90d3720c	! t0_kref+0x114c:   	umulcc	%o5, -0xdf4, %o0
	.word	0xd51e2000	! t0_kref+0x1150:   	ldd	[%i0], %f10
	.word	0x81580000	! t0_kref+0x1154:   	flushw
	.word	0xa703000d	! t0_kref+0x1158:   	taddcc	%o4, %o5, %l3
	.word	0x9263685e	! t0_kref+0x115c:   	subc	%o5, 0x85e, %o1
	.word	0xd53f4018	! t0_kref+0x1160:   	std	%f10, [%i5 + %i0]
	.word	0x2b800006	! t0_kref+0x1164:   	fbug,a	_kref+0x117c
	.word	0xe968a04e	! t0_kref+0x1168:   	prefetch	%g2 + 0x4e, 20
	.word	0xd048a004	! t0_kref+0x116c:   	ldsb	[%g2 + 4], %o0
	.word	0x9fa3492c	! t0_kref+0x1170:   	fmuls	%f13, %f12, %f15
	.word	0x99a00552	! t0_kref+0x1174:   	fsqrtd	%f18, %f12
	.word	0xa2632f64	! t0_kref+0x1178:   	subc	%o4, 0xf64, %l1
	.word	0x21800001	! t0_kref+0x117c:   	fbn,a	_kref+0x1180
	.word	0xa7b00fe0	! t0_kref+0x1180:   	fones	%f19
	.word	0xa6b339a6	! t0_kref+0x1184:   	orncc	%o4, -0x65a, %l3
	.word	0xd450a016	! t0_kref+0x1188:   	ldsh	[%g2 + 0x16], %o2
	.word	0x9db4090e	! t0_kref+0x118c:   	faligndata	%f16, %f14, %f14
	.word	0x9db3caf0	! t0_kref+0x1190:   	fpsub32s	%f15, %f16, %f14
	.word	0x3e800001	! t0_kref+0x1194:   	bvc,a	_kref+0x1198
	.word	0x95b3466a	! t0_kref+0x1198:   	fmul8x16au	%f13, %f10, %f10
	.word	0xd9bf1a58	! t0_kref+0x119c:   	stda	%f12, [%i4 + %i0]0xd2
	.word	0xec16001b	! t0_kref+0x11a0:   	lduh	[%i0 + %i3], %l6
	.word	0xa1b4896e	! t0_kref+0x11a4:   	fpmerge	%f18, %f14, %f16
	.word	0x9fc00004	! t0_kref+0x11a8:   	call	%g0 + %g4
	.word	0xe64e7fe8	! t0_kref+0x11ac:   	ldsb	[%i1 - 0x18], %l3
	.word	0xda26601c	! t0_kref+0x11b0:   	st	%o5, [%i1 + 0x1c]
	.word	0xa1b3c72a	! t0_kref+0x11b4:   	fmuld8ulx16	%f15, %f10, %f16
	.word	0xe3b8a080	! t0_kref+0x11b8:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x99a0192d	! t0_kref+0x11bc:   	fstod	%f13, %f12
	.word	0x95b3016d	! t0_kref+0x11c0:   	edge32ln	%o4, %o5, %o2
	.word	0xea48a00d	! t0_kref+0x11c4:   	ldsb	[%g2 + 0xd], %l5
	.word	0x31800005	! t0_kref+0x11c8:   	fba,a	_kref+0x11dc
	.word	0xe1be9a18	! t0_kref+0x11cc:   	stda	%f16, [%i2 + %i0]0xd0
	.word	0xe03e001d	! t0_kref+0x11d0:   	std	%l0, [%i0 + %i5]
	.word	0xaad3400d	! t0_kref+0x11d4:   	umulcc	%o5, %o5, %l5
	.word	0xa4b3000c	! t0_kref+0x11d8:   	orncc	%o4, %o4, %l2
	.word	0xd408a039	! t0_kref+0x11dc:   	ldub	[%g2 + 0x39], %o2
	.word	0xa1a0108e	! t0_kref+0x11e0:   	fxtos	%f14, %f16
	.word	0xa1b009af	! t0_kref+0x11e4:   	fexpand	%f15, %f16
	.word	0x86102002	! t0_kref+0x11e8:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x11ec:   	bne,a	_kref+0x11ec
	.word	0x86a0e001	! t0_kref+0x11f0:   	subcc	%g3, 1, %g3
	.word	0xe5ee101d	! t0_kref+0x11f4:   	prefetcha	%i0 + %i5, 18
	.word	0xa1a00552	! t0_kref+0x11f8:   	fsqrtd	%f18, %f16
	.word	0xb6103ffc	! t0_kref+0x11fc:   	mov	0xfffffffc, %i3
	.word	0xa1a0052b	! t0_kref+0x1200:   	fsqrts	%f11, %f16
	.word	0xec901018	! t0_kref+0x1204:   	lduha	[%g0 + %i0]0x80, %l6
	.word	0xd828a033	! t0_kref+0x1208:   	stb	%o4, [%g2 + 0x33]
	.word	0x97a000af	! t0_kref+0x120c:   	fnegs	%f15, %f11
	.word	0x9da00032	! t0_kref+0x1210:   	fmovs	%f18, %f14
	.word	0xdf20a028	! t0_kref+0x1214:   	st	%f15, [%g2 + 0x28]
	.word	0xa1a00550	! t0_kref+0x1218:   	fsqrtd	%f16, %f16
	.word	0x32800003	! t0_kref+0x121c:   	bne,a	_kref+0x1228
	.word	0x9da30952	! t0_kref+0x1220:   	fmuld	%f12, %f18, %f14
	.word	0xd5180019	! t0_kref+0x1224:   	ldd	[%g0 + %i1], %f10
	.word	0xd60e2006	! t0_kref+0x1228:   	ldub	[%i0 + 6], %o3
	.word	0x9da4084a	! t0_kref+0x122c:   	faddd	%f16, %f10, %f14
	.word	0xa81b400c	! t0_kref+0x1230:   	xor	%o5, %o4, %l4
	.word	0xa463400d	! t0_kref+0x1234:   	subc	%o5, %o5, %l2
	.word	0x95332003	! t0_kref+0x1238:   	srl	%o4, 0x3, %o2
	.word	0xe3b8a080	! t0_kref+0x123c:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xc0ff1018	! t0_kref+0x1240:   	swapa	[%i4 + %i0]0x80, %g0
	.word	0xa8732e27	! t0_kref+0x1244:   	udiv	%o4, 0xe27, %l4
	.word	0xee070018	! t0_kref+0x1248:   	ld	[%i4 + %i0], %l7
	.word	0xd400a034	! t0_kref+0x124c:   	ld	[%g2 + 0x34], %o2
	.word	0x972b000d	! t0_kref+0x1250:   	sll	%o4, %o5, %o3
	.word	0x94c3000d	! t0_kref+0x1254:   	addccc	%o4, %o5, %o2
	.word	0xaeb33aaf	! t0_kref+0x1258:   	orncc	%o4, -0x551, %l7
	.word	0xe0981019	! t0_kref+0x125c:   	ldda	[%g0 + %i1]0x80, %l0
	.word	0x95a0054c	! t0_kref+0x1260:   	fsqrtd	%f12, %f10
	.word	0x9de3bfa0	! t0_kref+0x1264:   	save	%sp, -0x60, %sp
	.word	0x97ef3a81	! t0_kref+0x1268:   	restore	%i4, -0x57f, %o3
	.word	0xe65e2018	! t0_kref+0x126c:   	ldx	[%i0 + 0x18], %l3
	.word	0xe67e0000	! t0_kref+0x1270:   	swap	[%i0], %l3
	.word	0xa3a000b1	! t0_kref+0x1274:   	fnegs	%f17, %f17
	.word	0xac737195	! t0_kref+0x1278:   	udiv	%o5, -0xe6b, %l6
	.word	0x2c800003	! t0_kref+0x127c:   	bneg,a	_kref+0x1288
	.word	0xe11fbca8	! t0_kref+0x1280:   	ldd	[%fp - 0x358], %f16
	.word	0x9744c000	! t0_kref+0x1284:   	mov	%gsr, %o3
	.word	0x8143c000	! t0_kref+0x1288:   	stbar
	.word	0x96c32ad3	! t0_kref+0x128c:   	addccc	%o4, 0xad3, %o3
	.word	0xe1be180d	! t0_kref+0x1290:   	stda	%f16, [%i0 + %o5]0xc0
	.word	0x95a00552	! t0_kref+0x1294:   	fsqrtd	%f18, %f10
	.word	0xe53e6000	! t0_kref+0x1298:   	std	%f18, [%i1]
	.word	0xa5b30d40	! t0_kref+0x129c:   	fnot1	%f12, %f18
	.word	0x34480005	! t0_kref+0x12a0:   	bg,a,pt	%icc, _kref+0x12b4
	.word	0x9da0002c	! t0_kref+0x12a4:   	fmovs	%f12, %f14
	.word	0xd828a03a	! t0_kref+0x12a8:   	stb	%o4, [%g2 + 0x3a]
	.word	0x97b30240	! t0_kref+0x12ac:   	array16	%o4, %g0, %o3
	.word	0x95b44673	! t0_kref+0x12b0:   	fmul8x16au	%f17, %f19, %f10
	.word	0x23480008	! t0_kref+0x12b4:   	fbne,a,pt	%fcc0, _kref+0x12d4
	.word	0xa1b28d92	! t0_kref+0x12b8:   	fxor	%f10, %f18, %f16
	.word	0x3c800008	! t0_kref+0x12bc:   	bpos,a	_kref+0x12dc
	.word	0xaec33ea8	! t0_kref+0x12c0:   	addccc	%o4, -0x158, %l7
	.word	0xe07e2010	! t0_kref+0x12c4:   	swap	[%i0 + 0x10], %l0
	.word	0xac13400c	! t0_kref+0x12c8:   	or	%o5, %o4, %l6
	.word	0xe51fbf60	! t0_kref+0x12cc:   	ldd	[%fp - 0xa0], %f18
	.word	0xac63000c	! t0_kref+0x12d0:   	subc	%o4, %o4, %l6
	.word	0xd9380019	! t0_kref+0x12d4:   	std	%f12, [%g0 + %i1]
	.word	0xaa0b400d	! t0_kref+0x12d8:   	and	%o5, %o5, %l5
	.word	0xda264000	! t0_kref+0x12dc:   	st	%o5, [%i1]
	.word	0xec1e7fe0	! t0_kref+0x12e0:   	ldd	[%i1 - 0x20], %l6
	.word	0x9533600f	! t0_kref+0x12e4:   	srl	%o5, 0xf, %o2
	.word	0x86102003	! t0_kref+0x12e8:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x12ec:   	bne,a	_kref+0x12ec
	.word	0x86a0e001	! t0_kref+0x12f0:   	subcc	%g3, 1, %g3
	.word	0x81830000	! t0_kref+0x12f4:   	wr	%o4, %g0, %y
	.word	0xea10a03e	! t0_kref+0x12f8:   	lduh	[%g2 + 0x3e], %l5
	.word	0x96fb2017	! t0_kref+0x12fc:   	sdivcc	%o4, 0x17, %o3
	.word	0x99b48e31	! t0_kref+0x1300:   	fands	%f18, %f17, %f12
	.word	0x95b007b0	! t0_kref+0x1304:   	fpackfix	%f16, %f10
	.word	0xa1a0054a	! t0_kref+0x1308:   	fsqrtd	%f10, %f16
	.word	0x9693400d	! t0_kref+0x130c:   	orcc	%o5, %o5, %o3
	.word	0xa5a00552	! t0_kref+0x1310:   	fsqrtd	%f18, %f18
	.word	0xd0167ff0	! t0_kref+0x1314:   	lduh	[%i1 - 0x10], %o0
	.word	0xc76e400d	! t0_kref+0x1318:   	prefetch	%i1 + %o5, 3
	.word	0xe4060000	! t0_kref+0x131c:   	ld	[%i0], %l2
	.word	0xad2b400c	! t0_kref+0x1320:   	sll	%o5, %o4, %l6
	.word	0x96fb000d	! t0_kref+0x1324:   	sdivcc	%o4, %o5, %o3
	.word	0x32800007	! t0_kref+0x1328:   	bne,a	_kref+0x1344
	.word	0xe168a083	! t0_kref+0x132c:   	prefetch	%g2 + 0x83, 16
	.word	0xf16e401b	! t0_kref+0x1330:   	prefetch	%i1 + %i3, 24
	.word	0xee8e101a	! t0_kref+0x1334:   	lduba	[%i0 + %i2]0x80, %l7
	.word	0x91332010	! t0_kref+0x1338:   	srl	%o4, 0x10, %o0
	.word	0xc807bfe8	! t0_kref+0x133c:   	ld	[%fp - 0x18], %g4
	.word	0xac63000d	! t0_kref+0x1340:   	subc	%o4, %o5, %l6
	.word	0x2e480007	! t0_kref+0x1344:   	bvs,a,pt	%icc, _kref+0x1360
	.word	0x95b2866c	! t0_kref+0x1348:   	fmul8x16au	%f10, %f12, %f10
	.word	0xe51f4019	! t0_kref+0x134c:   	ldd	[%i5 + %i1], %f18
	.word	0xa32b400c	! t0_kref+0x1350:   	sll	%o5, %o4, %l1
	.word	0xec10a038	! t0_kref+0x1354:   	lduh	[%g2 + 0x38], %l6
	.word	0x81d9401c	! t0_kref+0x1358:   	flush	%g5 + %i4
	.word	0xc76e7fe8	! t0_kref+0x135c:   	prefetch	%i1 - 0x18, 3
	.word	0xee8e101a	! t0_kref+0x1360:   	lduba	[%i0 + %i2]0x80, %l7
	.word	0xe2063ff0	! t0_kref+0x1364:   	ld	[%i0 - 0x10], %l1
	.word	0x9da3094a	! t0_kref+0x1368:   	fmuld	%f12, %f10, %f14
	.word	0x2c800004	! t0_kref+0x136c:   	bneg,a	_kref+0x137c
	.word	0xee5e6000	! t0_kref+0x1370:   	ldx	[%i1], %l7
	.word	0xa263400c	! t0_kref+0x1374:   	subc	%o5, %o4, %l1
	.word	0xa7400000	! t0_kref+0x1378:   	mov	%y, %l3
	.word	0xa7a4482e	! t0_kref+0x137c:   	fadds	%f17, %f14, %f19
	.word	0xad400000	! t0_kref+0x1380:   	mov	%y, %l6
	.word	0xd9180019	! t0_kref+0x1384:   	ldd	[%g0 + %i1], %f12
	.word	0xe2ce5000	! t0_kref+0x1388:   	ldsba	[%i1]0x80, %l1
	.word	0x95a2882e	! t0_kref+0x138c:   	fadds	%f10, %f14, %f10
	.word	0xd828a01f	! t0_kref+0x1390:   	stb	%o4, [%g2 + 0x1f]
	.word	0xa653000c	! t0_kref+0x1394:   	umul	%o4, %o4, %l3
	.word	0xda26001c	! t0_kref+0x1398:   	st	%o5, [%i0 + %i4]
	.word	0xd53e4000	! t0_kref+0x139c:   	std	%f10, [%i1]
	.word	0x86102002	! t0_kref+0x13a0:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x13a4:   	bne,a	_kref+0x13a4
	.word	0x86a0e001	! t0_kref+0x13a8:   	subcc	%g3, 1, %g3
	.word	0xc0383cf8	! t0_kref+0x13ac:   	std	%g0, [%g0 - 0x308]
	.word	0x97a3c92d	! t0_kref+0x13b0:   	fmuls	%f15, %f13, %f11
	.word	0x9db38aad	! t0_kref+0x13b4:   	fpsub16s	%f14, %f13, %f14
	.word	0xa20b000c	! t0_kref+0x13b8:   	and	%o4, %o4, %l1
	.word	0x29480006	! t0_kref+0x13bc:   	fbl,a,pt	%fcc0, _kref+0x13d4
	.word	0xaaa361e7	! t0_kref+0x13c0:   	subcc	%o5, 0x1e7, %l5
	.word	0xe3b8a080	! t0_kref+0x13c4:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x33800008	! t0_kref+0x13c8:   	fbe,a	_kref+0x13e8
	.word	0x9db40aca	! t0_kref+0x13cc:   	fpsub32	%f16, %f10, %f14
	.word	0xec1e3ff0	! t0_kref+0x13d0:   	ldd	[%i0 - 0x10], %l6
	.word	0xe250a006	! t0_kref+0x13d4:   	ldsh	[%g2 + 6], %l1
	.word	0xa833400c	! t0_kref+0x13d8:   	orn	%o5, %o4, %l4
	.word	0xa73b200d	! t0_kref+0x13dc:   	sra	%o4, 0xd, %l3
	.word	0x99b009ad	! t0_kref+0x13e0:   	fexpand	%f13, %f12
	.word	0x35800007	! t0_kref+0x13e4:   	fbue,a	_kref+0x1400
	.word	0xd278a00c	! t0_kref+0x13e8:   	swap	[%g2 + 0xc], %o1
	.word	0x81abca2a	! t0_kref+0x13ec:   	fcmps	%fcc0, %f15, %f10
	.word	0x95b00c00	! t0_kref+0x13f0:   	fzero	%f10
	.word	0xacc36b2f	! t0_kref+0x13f4:   	addccc	%o5, 0xb2f, %l6
	.word	0xee4e200f	! t0_kref+0x13f8:   	ldsb	[%i0 + 0xf], %l7
	.word	0x21480007	! t0_kref+0x13fc:   	fbn,a,pt	%fcc0, _kref+0x1418
	.word	0xa1a0002e	! t0_kref+0x1400:   	fmovs	%f14, %f16
	.word	0xd9f6100c	! t0_kref+0x1404:   	casxa	[%i0]0x80, %o4, %o4
	.word	0xa273400d	! t0_kref+0x1408:   	udiv	%o5, %o5, %l1
	.word	0x31480005	! t0_kref+0x140c:   	fba,a,pt	%fcc0, _kref+0x1420
	.word	0xd51fbd18	! t0_kref+0x1410:   	ldd	[%fp - 0x2e8], %f10
	.word	0xd24e2004	! t0_kref+0x1414:   	ldsb	[%i0 + 4], %o1
	.word	0x81accaaa	! t0_kref+0x1418:   	fcmpes	%fcc0, %f19, %f10
	.word	0x9fa01090	! t0_kref+0x141c:   	fxtos	%f16, %f15
	.word	0xadb2858c	! t0_kref+0x1420:   	fcmpgt32	%f10, %f12, %l6
	.word	0x99a0188f	! t0_kref+0x1424:   	fitos	%f15, %f12
	.word	0xd240a008	! t0_kref+0x1428:   	ldsw	[%g2 + 8], %o1
	.word	0xa3a01a4e	! t0_kref+0x142c:   	fdtoi	%f14, %f17
	.word	0x81830000	! t0_kref+0x1430:   	wr	%o4, %g0, %y
	.word	0xd406401c	! t0_kref+0x1434:   	ld	[%i1 + %i4], %o2
	.word	0x9fc10000	! t0_kref+0x1438:   	call	%g4
	.word	0xa3b4cd2a	! t0_kref+0x143c:   	fandnot1s	%f19, %f10, %f17
	.word	0x86102010	! t0_kref+0x1440:   	mov	0x10, %g3
	.word	0x86a0e001	! t0_kref+0x1444:   	subcc	%g3, 1, %g3
	.word	0x22800009	! t0_kref+0x1448:   	be,a	_kref+0x146c
	.word	0xe4d01019	! t0_kref+0x144c:   	ldsha	[%g0 + %i1]0x80, %l2
	.word	0xe06e4000	! t0_kref+0x1450:   	ldstub	[%i1], %l0
	.word	0x96b37cfe	! t0_kref+0x1454:   	orncc	%o5, -0x302, %o3
	.word	0xe20e3fee	! t0_kref+0x1458:   	ldub	[%i0 - 0x12], %l1
	.word	0x901b000d	! t0_kref+0x145c:   	xor	%o4, %o5, %o0
	.word	0xea78a014	! t0_kref+0x1460:   	swap	[%g2 + 0x14], %l5
	.word	0x9fc10000	! t0_kref+0x1464:   	call	%g4
	.word	0xa4b3400d	! t0_kref+0x1468:   	orncc	%o5, %o5, %l2
	.word	0xe3b8a080	! t0_kref+0x146c:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x81aacab3	! t0_kref+0x1470:   	fcmpes	%fcc0, %f11, %f19
	.word	0x93b300ec	! t0_kref+0x1474:   	edge16ln	%o4, %o4, %o1
	.word	0xe13e7fe8	! t0_kref+0x1478:   	std	%f16, [%i1 - 0x18]
	.word	0xe3b8a080	! t0_kref+0x147c:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x99a4094e	! t0_kref+0x1480:   	fmuld	%f16, %f14, %f12
	.word	0x99b48f92	! t0_kref+0x1484:   	for	%f18, %f18, %f12
	.word	0xee0e4000	! t0_kref+0x1488:   	ldub	[%i1], %l7
	.word	0x86102005	! t0_kref+0x148c:   	mov	0x5, %g3
	.word	0x86a0e001	! t0_kref+0x1490:   	subcc	%g3, 1, %g3
	.word	0x22800014	! t0_kref+0x1494:   	be,a	_kref+0x14e4
	.word	0x949b000c	! t0_kref+0x1498:   	xorcc	%o4, %o4, %o2
	.word	0xab23676a	! t0_kref+0x149c:   	mulscc	%o5, 0x76a, %l5
	.word	0xec1e6010	! t0_kref+0x14a0:   	ldd	[%i1 + 0x10], %l6
	.word	0xa1a0054a	! t0_kref+0x14a4:   	fsqrtd	%f10, %f16
	.word	0x95a0054e	! t0_kref+0x14a8:   	fsqrtd	%f14, %f10
	.word	0x3b800007	! t0_kref+0x14ac:   	fble,a	_kref+0x14c8
	.word	0xd53e2000	! t0_kref+0x14b0:   	std	%f10, [%i0]
	.word	0xa463400d	! t0_kref+0x14b4:   	subc	%o5, %o5, %l2
	.word	0xe81e7fe8	! t0_kref+0x14b8:   	ldd	[%i1 - 0x18], %l4
	.word	0x9ba40831	! t0_kref+0x14bc:   	fadds	%f16, %f17, %f13
	.word	0x95b34670	! t0_kref+0x14c0:   	fmul8x16au	%f13, %f16, %f10
	.word	0xdf00a024	! t0_kref+0x14c4:   	ld	[%g2 + 0x24], %f15
	.word	0xa5a4084a	! t0_kref+0x14c8:   	faddd	%f16, %f10, %f18
	.word	0x2b800006	! t0_kref+0x14cc:   	fbug,a	_kref+0x14e4
	.word	0xe11fbce8	! t0_kref+0x14d0:   	ldd	[%fp - 0x318], %f16
	.word	0x99a0054e	! t0_kref+0x14d4:   	fsqrtd	%f14, %f12
	.word	0xe03e7fe8	! t0_kref+0x14d8:   	std	%l0, [%i1 - 0x18]
	.word	0x97a00530	! t0_kref+0x14dc:   	fsqrts	%f16, %f11
	.word	0xd87f0018	! t0_kref+0x14e0:   	swap	[%i4 + %i0], %o4
	.word	0x36800006	! t0_kref+0x14e4:   	bge,a	_kref+0x14fc
	.word	0xe16e001a	! t0_kref+0x14e8:   	prefetch	%i0 + %i2, 16
	.word	0x81abca2c	! t0_kref+0x14ec:   	fcmps	%fcc0, %f15, %f12
	.word	0xa5a388b0	! t0_kref+0x14f0:   	fsubs	%f14, %f16, %f18
	.word	0xd008a02b	! t0_kref+0x14f4:   	ldub	[%g2 + 0x2b], %o0
	.word	0xe44e7fee	! t0_kref+0x14f8:   	ldsb	[%i1 - 0x12], %l2
	.word	0x8610200b	! t0_kref+0x14fc:   	mov	0xb, %g3
	.word	0x86a0e001	! t0_kref+0x1500:   	subcc	%g3, 1, %g3
	.word	0x22800010	! t0_kref+0x1504:   	be,a	_kref+0x1544
	.word	0xa5aa0050	! t0_kref+0x1508:   	fmovda	%fcc0, %f16, %f18
	.word	0xa1b4066a	! t0_kref+0x150c:   	fmul8x16au	%f16, %f10, %f16
	.word	0xe250a004	! t0_kref+0x1510:   	ldsh	[%g2 + 4], %l1
	.word	0xe168a00d	! t0_kref+0x1514:   	prefetch	%g2 + 0xd, 16
	.word	0x9ba01a4a	! t0_kref+0x1518:   	fdtoi	%f10, %f13
	.word	0x39bffff9	! t0_kref+0x151c:   	fbuge,a	_kref+0x1500
	.word	0xa883400d	! t0_kref+0x1520:   	addcc	%o5, %o5, %l4
	.word	0xea48a036	! t0_kref+0x1524:   	ldsb	[%g2 + 0x36], %l5
	.word	0xa213212d	! t0_kref+0x1528:   	or	%o4, 0x12d, %l1
	.word	0x2e480006	! t0_kref+0x152c:   	bvs,a,pt	%icc, _kref+0x1544
	.word	0xe11e001d	! t0_kref+0x1530:   	ldd	[%i0 + %i5], %f16
	.word	0xd610a00a	! t0_kref+0x1534:   	lduh	[%g2 + 0xa], %o3
	.word	0xe64e2018	! t0_kref+0x1538:   	ldsb	[%i0 + 0x18], %l3
	.word	0x95a00050	! t0_kref+0x153c:   	fmovd	%f16, %f10
	.word	0xe13e3fe0	! t0_kref+0x1540:   	std	%f16, [%i0 - 0x20]
	.word	0xc1e6500c	! t0_kref+0x1544:   	casa	[%i1]0x80, %o4, %g0
	.word	0x99a8404e	! t0_kref+0x1548:   	fmovdne	%fcc0, %f14, %f12
	.word	0xe11e401d	! t0_kref+0x154c:   	ldd	[%i1 + %i5], %f16
	.word	0x968b2ff6	! t0_kref+0x1550:   	andcc	%o4, 0xff6, %o3
	.word	0x9673400d	! t0_kref+0x1554:   	udiv	%o5, %o5, %o3
	.word	0x912b601c	! t0_kref+0x1558:   	sll	%o5, 0x1c, %o0
	.word	0x95a2c830	! t0_kref+0x155c:   	fadds	%f11, %f16, %f10
	.word	0xd51f4019	! t0_kref+0x1560:   	ldd	[%i5 + %i1], %f10
	.word	0xac93000d	! t0_kref+0x1564:   	orcc	%o4, %o5, %l6
	.word	0xab2b2004	! t0_kref+0x1568:   	sll	%o4, 0x4, %l5
	.word	0xd19f5a19	! t0_kref+0x156c:   	ldda	[%i5 + %i1]0xd0, %f8
	.word	0x9de3bfa0	! t0_kref+0x1570:   	save	%sp, -0x60, %sp
	.word	0xa7ef3632	! t0_kref+0x1574:   	restore	%i4, -0x9ce, %l3
	.word	0x878020d0	! t0_kref+0x1578:   	mov	0xd0, %asi
	.word	0x9db30f90	! t0_kref+0x157c:   	for	%f12, %f16, %f14
	.word	0x9fc10000	! t0_kref+0x1580:   	call	%g4
	.word	0xe6500019	! t0_kref+0x1584:   	ldsh	[%g0 + %i1], %l3
	.word	0xa5a0054e	! t0_kref+0x1588:   	fsqrtd	%f14, %f18
	.word	0xa1b00fe0	! t0_kref+0x158c:   	fones	%f16
	.word	0xc568a049	! t0_kref+0x1590:   	prefetch	%g2 + 0x49, 2
	.word	0xd8a81018	! t0_kref+0x1594:   	stba	%o4, [%g0 + %i0]0x80
	.word	0x9fa0052a	! t0_kref+0x1598:   	fsqrts	%f10, %f15
	.word	0xa1a01a4c	! t0_kref+0x159c:   	fdtoi	%f12, %f16
	.word	0x99a3c82d	! t0_kref+0x15a0:   	fadds	%f15, %f13, %f12
	.word	0xaa0373bc	! t0_kref+0x15a4:   	add	%o5, -0xc44, %l5
	.word	0xd248a027	! t0_kref+0x15a8:   	ldsb	[%g2 + 0x27], %o1
	.word	0xec064000	! t0_kref+0x15ac:   	ld	[%i1], %l6
	.word	0xe44e3fec	! t0_kref+0x15b0:   	ldsb	[%i0 - 0x14], %l2
	.word	0xacb3400d	! t0_kref+0x15b4:   	orncc	%o5, %o5, %l6
	.word	0xac93000d	! t0_kref+0x15b8:   	orcc	%o4, %o5, %l6
	.word	0xac737bb3	! t0_kref+0x15bc:   	udiv	%o5, -0x44d, %l6
	.word	0x3a800005	! t0_kref+0x15c0:   	bcc,a	_kref+0x15d4
	.word	0x97a3892a	! t0_kref+0x15c4:   	fmuls	%f14, %f10, %f11
	.word	0x968b000d	! t0_kref+0x15c8:   	andcc	%o4, %o5, %o3
	.word	0xd53f4018	! t0_kref+0x15cc:   	std	%f10, [%i5 + %i0]
	.word	0xed68a041	! t0_kref+0x15d0:   	prefetch	%g2 + 0x41, 22
	.word	0x33800008	! t0_kref+0x15d4:   	fbe,a	_kref+0x15f4
	.word	0xa1b40dad	! t0_kref+0x15d8:   	fxors	%f16, %f13, %f16
	.word	0x9da2892c	! t0_kref+0x15dc:   	fmuls	%f10, %f12, %f14
	.word	0x3d480003	! t0_kref+0x15e0:   	fbule,a,pt	%fcc0, _kref+0x15ec
	.word	0xac9b7ce9	! t0_kref+0x15e4:   	xorcc	%o5, -0x317, %l6
	.word	0xd93e0000	! t0_kref+0x15e8:   	std	%f12, [%i0]
	.word	0xa7a0052a	! t0_kref+0x15ec:   	fsqrts	%f10, %f19
	.word	0xa3b38ab2	! t0_kref+0x15f0:   	fpsub16s	%f14, %f18, %f17
	call	1f
	.empty
	.word	0xa5b00fc0	! t0_kref+0x15f8:   	fone	%f18
	.word	0xa5a01a52	! t0_kref+0x15fc:   	fdtoi	%f18, %f18
	.word	0xa293000d	! t0_kref+0x1600:   	orcc	%o4, %o5, %l1
	.word	0xae93400c	! t0_kref+0x1604:   	orcc	%o5, %o4, %l7
	.word	0x9da00550	! t0_kref+0x1608:   	fsqrtd	%f16, %f14
	.word	0xd700a038	! t0_kref+0x160c:   	ld	[%g2 + 0x38], %f11
1:	.word	0xa3a018cc	! t0_kref+0x1610:   	fdtos	%f12, %f17
	.word	0x9da9c04e	! t0_kref+0x1614:   	fmovdu	%fcc0, %f14, %f14
	.word	0xe13e6000	! t0_kref+0x1618:   	std	%f16, [%i1]
	.word	0xd07f0019	! t0_kref+0x161c:   	swap	[%i4 + %i1], %o0
	.word	0xe4064000	! t0_kref+0x1620:   	ld	[%i1], %l2
	.word	0xe66e7fe5	! t0_kref+0x1624:   	ldstub	[%i1 - 0x1b], %l3
	.word	0xe5e6500c	! t0_kref+0x1628:   	casa	[%i1]0x80, %o4, %l2
	.word	0xd8267fe4	! t0_kref+0x162c:   	st	%o4, [%i1 - 0x1c]
	.word	0x99a01a31	! t0_kref+0x1630:   	fstoi	%f17, %f12
	.word	0xd248a03a	! t0_kref+0x1634:   	ldsb	[%g2 + 0x3a], %o1
	.word	0xec100019	! t0_kref+0x1638:   	lduh	[%g0 + %i1], %l6
	.word	0xa7b340cd	! t0_kref+0x163c:   	edge16l	%o5, %o5, %l3
	.word	0xd836001b	! t0_kref+0x1640:   	sth	%o4, [%i0 + %i3]
	.word	0x99b48990	! t0_kref+0x1644:   	bshuffle	%f18, %f16, %f12
	.word	0x913b400c	! t0_kref+0x1648:   	sra	%o5, %o4, %o0
	.word	0x97a01a2d	! t0_kref+0x164c:   	fstoi	%f13, %f11
	.word	0x95b3caab	! t0_kref+0x1650:   	fpsub16s	%f15, %f11, %f10
	.word	0x3d800008	! t0_kref+0x1654:   	fbule,a	_kref+0x1674
	.word	0xea86501c	! t0_kref+0x1658:   	lda	[%i1 + %i4]0x80, %l5
	.word	0xa263000c	! t0_kref+0x165c:   	subc	%o4, %o4, %l1
	.word	0x9fc10000	! t0_kref+0x1660:   	call	%g4
	.word	0xd700a01c	! t0_kref+0x1664:   	ld	[%g2 + 0x1c], %f11
	.word	0xa3b340ec	! t0_kref+0x1668:   	edge16ln	%o5, %o4, %l1
	.word	0xe36e401d	! t0_kref+0x166c:   	prefetch	%i1 + %i5, 17
	.word	0x2b480003	! t0_kref+0x1670:   	fbug,a,pt	%fcc0, _kref+0x167c
	.word	0xe100a038	! t0_kref+0x1674:   	ld	[%g2 + 0x38], %f16
	.word	0xa273400c	! t0_kref+0x1678:   	udiv	%o5, %o4, %l1
	.word	0xe07f0018	! t0_kref+0x167c:   	swap	[%i4 + %i0], %l0
	.word	0xee50a02a	! t0_kref+0x1680:   	ldsh	[%g2 + 0x2a], %l7
	.word	0xe6163ff4	! t0_kref+0x1684:   	lduh	[%i0 - 0xc], %l3
	.word	0xa29362dc	! t0_kref+0x1688:   	orcc	%o5, 0x2dc, %l1
	.word	0xac9b000d	! t0_kref+0x168c:   	xorcc	%o4, %o5, %l6
	.word	0xa5b3000d	! t0_kref+0x1690:   	edge8	%o4, %o5, %l2
	.word	0xa4fb000d	! t0_kref+0x1694:   	sdivcc	%o4, %o5, %l2
	.word	0xda264000	! t0_kref+0x1698:   	st	%o5, [%i1]
	.word	0xe60e7ffd	! t0_kref+0x169c:   	ldub	[%i1 - 3], %l3
	.word	0xec0e2015	! t0_kref+0x16a0:   	ldub	[%i0 + 0x15], %l6
	.word	0xa3a0052f	! t0_kref+0x16a4:   	fsqrts	%f15, %f17
	.word	0x95b28e0c	! t0_kref+0x16a8:   	fand	%f10, %f12, %f10
	.word	0xea06200c	! t0_kref+0x16ac:   	ld	[%i0 + 0xc], %l5
	.word	0xe3066000	! t0_kref+0x16b0:   	ld	[%i1], %f17
	.word	0x94b37661	! t0_kref+0x16b4:   	orncc	%o5, -0x99f, %o2
	.word	0x81ac0a50	! t0_kref+0x16b8:   	fcmpd	%fcc0, %f16, %f16
	.word	0xa5a00552	! t0_kref+0x16bc:   	fsqrtd	%f18, %f18
	.word	0x90db000d	! t0_kref+0x16c0:   	smulcc	%o4, %o5, %o0
	.word	0x95a0052d	! t0_kref+0x16c4:   	fsqrts	%f13, %f10
	.word	0x940b2161	! t0_kref+0x16c8:   	and	%o4, 0x161, %o2
	.word	0xd93e7ff8	! t0_kref+0x16cc:   	std	%f12, [%i1 - 8]
	.word	0xe25e7fe8	! t0_kref+0x16d0:   	ldx	[%i1 - 0x18], %l1
	.word	0x37800006	! t0_kref+0x16d4:   	fbge,a	_kref+0x16ec
	.word	0xe500a03c	! t0_kref+0x16d8:   	ld	[%g2 + 0x3c], %f18
	.word	0x95b340ed	! t0_kref+0x16dc:   	edge16ln	%o5, %o5, %o2
	.word	0xac13400d	! t0_kref+0x16e0:   	or	%o5, %o5, %l6
	.word	0xa1a018d2	! t0_kref+0x16e4:   	fdtos	%f18, %f16
	.word	0xac9b000d	! t0_kref+0x16e8:   	xorcc	%o4, %o5, %l6
	.word	0xd836401b	! t0_kref+0x16ec:   	sth	%o4, [%i1 + %i3]
	.word	0xd51fbf60	! t0_kref+0x16f0:   	ldd	[%fp - 0xa0], %f10
	.word	0xd496d018	! t0_kref+0x16f4:   	lduha	[%i3 + %i0]0x80, %o2
	.word	0xd91fbc98	! t0_kref+0x16f8:   	ldd	[%fp - 0x368], %f12
	.word	0x27480003	! t0_kref+0x16fc:   	fbul,a,pt	%fcc0, _kref+0x1708
	.word	0xe01e0000	! t0_kref+0x1700:   	ldd	[%i0], %l0
	.word	0xa1b406ce	! t0_kref+0x1704:   	fmul8sux16	%f16, %f14, %f16
	.word	0xe11fbda8	! t0_kref+0x1708:   	ldd	[%fp - 0x258], %f16
	.word	0x927b7ad1	! t0_kref+0x170c:   	sdiv	%o5, -0x52f, %o1
	.word	0x99a288ca	! t0_kref+0x1710:   	fsubd	%f10, %f10, %f12
	.word	0x3c800005	! t0_kref+0x1714:   	bpos,a	_kref+0x1728
	.word	0xaea37198	! t0_kref+0x1718:   	subcc	%o5, -0xe68, %l7
	.word	0xa5a0052e	! t0_kref+0x171c:   	fsqrts	%f14, %f18
	.word	0xd9be188d	! t0_kref+0x1720:   	stda	%f12, [%i0 + %o5]0xc4
	.word	0xac1363f7	! t0_kref+0x1724:   	or	%o5, 0x3f7, %l6
	.word	0xe4062008	! t0_kref+0x1728:   	ld	[%i0 + 8], %l2
	.word	0xe700a02c	! t0_kref+0x172c:   	ld	[%g2 + 0x2c], %f19
	.word	0x81ac0aad	! t0_kref+0x1730:   	fcmpes	%fcc0, %f16, %f13
	.word	0x9463400d	! t0_kref+0x1734:   	subc	%o5, %o5, %o2
	.word	0xe1be5a1c	! t0_kref+0x1738:   	stda	%f16, [%i1 + %i4]0xd0
	.word	0x912b2015	! t0_kref+0x173c:   	sll	%o4, 0x15, %o0
	.word	0x9fc10000	! t0_kref+0x1740:   	call	%g4
	.word	0xec062014	! t0_kref+0x1744:   	ld	[%i0 + 0x14], %l6
	.word	0x86102008	! t0_kref+0x1748:   	mov	0x8, %g3
	.word	0x86a0e001	! t0_kref+0x174c:   	subcc	%g3, 1, %g3
	.word	0x22800010	! t0_kref+0x1750:   	be,a	_kref+0x1790
	.word	0xd91e7fe0	! t0_kref+0x1754:   	ldd	[%i1 - 0x20], %f12
	.word	0xa1b40a0e	! t0_kref+0x1758:   	fpadd16	%f16, %f14, %f16
	.word	0x254ffffc	! t0_kref+0x175c:   	fblg,a,pt	%fcc0, _kref+0x174c
	.word	0xe47e7fe0	! t0_kref+0x1760:   	swap	[%i1 - 0x20], %l2
	.word	0x22bffffa	! t0_kref+0x1764:   	be,a	_kref+0x174c
	.word	0xd68e9019	! t0_kref+0x1768:   	lduba	[%i2 + %i1]0x80, %o3
	.word	0xa32b000c	! t0_kref+0x176c:   	sll	%o4, %o4, %l1
	.word	0xa8a33057	! t0_kref+0x1770:   	subcc	%o4, -0xfa9, %l4
	.word	0xad70000c	! t0_kref+0x1774:   	popc	%o4, %l6
	.word	0x9033665b	! t0_kref+0x1778:   	orn	%o5, 0x65b, %o0
	.word	0xa89b2abd	! t0_kref+0x177c:   	xorcc	%o4, 0xabd, %l4
	.word	0x81aacaae	! t0_kref+0x1780:   	fcmpes	%fcc0, %f11, %f14
	.word	0xd99f1a18	! t0_kref+0x1784:   	ldda	[%i4 + %i0]0xd0, %f12
	.word	0x95b340ac	! t0_kref+0x1788:   	edge16n	%o5, %o4, %o2
	.word	0xaa9b000c	! t0_kref+0x178c:   	xorcc	%o4, %o4, %l5
	.word	0xa6fb000d	! t0_kref+0x1790:   	sdivcc	%o4, %o5, %l3
	.word	0xa273000c	! t0_kref+0x1794:   	udiv	%o4, %o4, %l1
	.word	0xe01e2010	! t0_kref+0x1798:   	ldd	[%i0 + 0x10], %l0
	.word	0xc36e7ff8	! t0_kref+0x179c:   	prefetch	%i1 - 8, 1
	.word	0xae7b400d	! t0_kref+0x17a0:   	sdiv	%o5, %o5, %l7
	.word	0x81db7dba	! t0_kref+0x17a4:   	flush	%o5 - 0x246
	.word	0xa9b285ca	! t0_kref+0x17a8:   	fcmpeq32	%f10, %f10, %l4
	.word	0xa443205f	! t0_kref+0x17ac:   	addc	%o4, 0x5f, %l2
	.word	0x37800007	! t0_kref+0x17b0:   	fbge,a	_kref+0x17cc
	.word	0x8d83400c	! t0_kref+0x17b4:   	wr	%o5, %o4, %fprs
	.word	0xe8080019	! t0_kref+0x17b8:   	ldub	[%g0 + %i1], %l4
	.word	0xa1a348ab	! t0_kref+0x17bc:   	fsubs	%f13, %f11, %f16
	.word	0x99b48d8a	! t0_kref+0x17c0:   	fxor	%f18, %f10, %f12
	call	SYM(t0_subr2)
	.word	0xaa0b65a1	! t0_kref+0x17c8:   	and	%o5, 0x5a1, %l5
	.word	0xa5400000	! t0_kref+0x17cc:   	mov	%y, %l2
	.word	0x911b400c	! t0_kref+0x17d0:   	tsubcctv	%o5, %o4, %o0
	.word	0xe808a01b	! t0_kref+0x17d4:   	ldub	[%g2 + 0x1b], %l4
	.word	0x81acca33	! t0_kref+0x17d8:   	fcmps	%fcc0, %f19, %f19
	.word	0xa1b00f0e	! t0_kref+0x17dc:   	fsrc2	%f14, %f16
	.word	0x9163e727	! t0_kref+0x17e0:   	movo	%fcc0, -0xd9, %o0
	.word	0xf76e3ff0	! t0_kref+0x17e4:   	prefetch	%i0 - 0x10, 27
	.word	0x8143c000	! t0_kref+0x17e8:   	stbar
	.word	0xd900a024	! t0_kref+0x17ec:   	ld	[%g2 + 0x24], %f12
	.word	0xa5b3000c	! t0_kref+0x17f0:   	edge8	%o4, %o4, %l2
	.word	0xe36e401b	! t0_kref+0x17f4:   	prefetch	%i1 + %i3, 17
	.word	0x33480001	! t0_kref+0x17f8:   	fbe,a,pt	%fcc0, _kref+0x17fc
	.word	0x9ba38833	! t0_kref+0x17fc:   	fadds	%f14, %f19, %f13
	.word	0xd000a028	! t0_kref+0x1800:   	ld	[%g2 + 0x28], %o0
	.word	0xa693000d	! t0_kref+0x1804:   	orcc	%o4, %o5, %l3
	.word	0x9013000d	! t0_kref+0x1808:   	or	%o4, %o5, %o0
	.word	0x92ab000c	! t0_kref+0x180c:   	andncc	%o4, %o4, %o1
	.word	0x9db48e2d	! t0_kref+0x1810:   	fands	%f18, %f13, %f14
	.word	0x9da00531	! t0_kref+0x1814:   	fsqrts	%f17, %f14
	.word	0xe48e9019	! t0_kref+0x1818:   	lduba	[%i2 + %i1]0x80, %l2
	.word	0xa5b307d2	! t0_kref+0x181c:   	pdist	%f12, %f18, %f18
	.word	0xe3264000	! t0_kref+0x1820:   	st	%f17, [%i1]
	.word	0xa1b30e10	! t0_kref+0x1824:   	fand	%f12, %f16, %f16
	.word	0x99b00fc0	! t0_kref+0x1828:   	fone	%f12
	.word	0xe800a03c	! t0_kref+0x182c:   	ld	[%g2 + 0x3c], %l4
	.word	0x967b000d	! t0_kref+0x1830:   	sdiv	%o4, %o5, %o3
	.word	0x9de3bfa0	! t0_kref+0x1834:   	save	%sp, -0x60, %sp
	.word	0xb1074018	! t0_kref+0x1838:   	taddcc	%i5, %i0, %i0
	.word	0xa3e80000	! t0_kref+0x183c:   	restore	%g0, %g0, %l1
	.word	0x9ba0012b	! t0_kref+0x1840:   	fabss	%f11, %f13
	.word	0xa483400d	! t0_kref+0x1844:   	addcc	%o5, %o5, %l2
	.word	0xe53e2000	! t0_kref+0x1848:   	std	%f18, [%i0]
	.word	0x9da3894a	! t0_kref+0x184c:   	fmuld	%f14, %f10, %f14
	.word	0x81aa8a4e	! t0_kref+0x1850:   	fcmpd	%fcc0, %f10, %f14
	.word	0xa5a00533	! t0_kref+0x1854:   	fsqrts	%f19, %f18
	.word	0x3f480004	! t0_kref+0x1858:   	fbo,a,pt	%fcc0, _kref+0x1868
	.word	0xa413000d	! t0_kref+0x185c:   	or	%o4, %o5, %l2
	.word	0x81830000	! t0_kref+0x1860:   	wr	%o4, %g0, %y
	.word	0x99b4890c	! t0_kref+0x1864:   	faligndata	%f18, %f12, %f12
	.word	0x9273000d	! t0_kref+0x1868:   	udiv	%o4, %o5, %o1
	.word	0xa6d3000c	! t0_kref+0x186c:   	umulcc	%o4, %o4, %l3
	.word	0x910b6897	! t0_kref+0x1870:   	tsubcc	%o5, 0x897, %o0
	.word	0x99a00532	! t0_kref+0x1874:   	fsqrts	%f18, %f12
	.word	0xa2d3000d	! t0_kref+0x1878:   	umulcc	%o4, %o5, %l1
	call	SYM(t0_subr3)
	.word	0xa1b2cf6a	! t0_kref+0x1880:   	fornot1s	%f11, %f10, %f16
	.word	0xae9b400d	! t0_kref+0x1884:   	xorcc	%o5, %o5, %l7
	.word	0xa92b6018	! t0_kref+0x1888:   	sll	%o5, 0x18, %l4
	.word	0x2f800006	! t0_kref+0x188c:   	fbu,a	_kref+0x18a4
	.word	0xa2136a4f	! t0_kref+0x1890:   	or	%o5, 0xa4f, %l1
	.word	0xa6132e49	! t0_kref+0x1894:   	or	%o4, 0xe49, %l3
	.word	0xe03e4000	! t0_kref+0x1898:   	std	%l0, [%i1]
	.word	0x23800007	! t0_kref+0x189c:   	fbne,a	_kref+0x18b8
	.word	0xe7063fe8	! t0_kref+0x18a0:   	ld	[%i0 - 0x18], %f19
	.word	0x95a0054a	! t0_kref+0x18a4:   	fsqrtd	%f10, %f10
	.word	0xa47b000d	! t0_kref+0x18a8:   	sdiv	%o4, %o5, %l2
	.word	0x81ac8a50	! t0_kref+0x18ac:   	fcmpd	%fcc0, %f18, %f16
	.word	0xabb3858a	! t0_kref+0x18b0:   	fcmpgt32	%f14, %f10, %l5
	.word	0xeec01019	! t0_kref+0x18b4:   	ldswa	[%g0 + %i1]0x80, %l7
	.word	0xe4981019	! t0_kref+0x18b8:   	ldda	[%g0 + %i1]0x80, %l2
	.word	0xe41e3ff8	! t0_kref+0x18bc:   	ldd	[%i0 - 8], %l2
	.word	0x95a2c831	! t0_kref+0x18c0:   	fadds	%f11, %f17, %f10
	.word	0x9fa3082a	! t0_kref+0x18c4:   	fadds	%f12, %f10, %f15
	.word	0xe03e401d	! t0_kref+0x18c8:   	std	%l0, [%i1 + %i5]
	.word	0xaafb400c	! t0_kref+0x18cc:   	sdivcc	%o5, %o4, %l5
	.word	0x9263400d	! t0_kref+0x18d0:   	subc	%o5, %o5, %o1
	.word	0xdd180018	! t0_kref+0x18d4:   	ldd	[%g0 + %i0], %f14
	.word	0x9fa018ca	! t0_kref+0x18d8:   	fdtos	%f10, %f15
	.word	0xd07e4000	! t0_kref+0x18dc:   	swap	[%i1], %o0
	.word	0xea063fe4	! t0_kref+0x18e0:   	ld	[%i0 - 0x1c], %l5
	.word	0xa5a38833	! t0_kref+0x18e4:   	fadds	%f14, %f19, %f18
	.word	0xe0be501d	! t0_kref+0x18e8:   	stda	%l0, [%i1 + %i5]0x80
	.word	0xa7a00532	! t0_kref+0x18ec:   	fsqrts	%f18, %f19
	.word	0xea4e401a	! t0_kref+0x18f0:   	ldsb	[%i1 + %i2], %l5
	.word	0xd93e4000	! t0_kref+0x18f4:   	std	%f12, [%i1]
	.word	0x95a34832	! t0_kref+0x18f8:   	fadds	%f13, %f18, %f10
	.word	0xd048a03e	! t0_kref+0x18fc:   	ldsb	[%g2 + 0x3e], %o0
	.word	0xe1063fe8	! t0_kref+0x1900:   	ld	[%i0 - 0x18], %f16
	.word	0xa9b340ed	! t0_kref+0x1904:   	edge16ln	%o5, %o5, %l4
	.word	0x81ac0a32	! t0_kref+0x1908:   	fcmps	%fcc0, %f16, %f18
	.word	0x968b249a	! t0_kref+0x190c:   	andcc	%o4, 0x49a, %o3
	.word	0xe64e3ff1	! t0_kref+0x1910:   	ldsb	[%i0 - 0xf], %l3
	.word	0xac63400c	! t0_kref+0x1914:   	subc	%o5, %o4, %l6
	.word	0xa1a00552	! t0_kref+0x1918:   	fsqrtd	%f18, %f16
	.word	0xa5a4084e	! t0_kref+0x191c:   	faddd	%f16, %f14, %f18
	.word	0x9fa0052e	! t0_kref+0x1920:   	fsqrts	%f14, %f15
	.word	0xa5a28d2d	! t0_kref+0x1924:   	fsmuld	%f10, %f13, %f18
	.word	0x9da4084c	! t0_kref+0x1928:   	faddd	%f16, %f12, %f14
	.word	0xa5a0052a	! t0_kref+0x192c:   	fsqrts	%f10, %f18
	.word	0x90136d1c	! t0_kref+0x1930:   	or	%o5, 0xd1c, %o0
	.word	0xac9365dd	! t0_kref+0x1934:   	orcc	%o5, 0x5dd, %l6
	.word	0xe0b81018	! t0_kref+0x1938:   	stda	%l0, [%g0 + %i0]0x80
	.word	0x81ac0a4a	! t0_kref+0x193c:   	fcmpd	%fcc0, %f16, %f10
	.word	0xea100018	! t0_kref+0x1940:   	lduh	[%g0 + %i0], %l5
	.word	0xea4e6006	! t0_kref+0x1944:   	ldsb	[%i1 + 6], %l5
	.word	0x99b28d10	! t0_kref+0x1948:   	fandnot1	%f10, %f16, %f12
	.word	0x90933ba0	! t0_kref+0x194c:   	orcc	%o4, -0x460, %o0
	.word	0x95a0054c	! t0_kref+0x1950:   	fsqrtd	%f12, %f10
	.word	0x22480002	! t0_kref+0x1954:   	be,a,pt	%icc, _kref+0x195c
	.word	0xe250a004	! t0_kref+0x1958:   	ldsh	[%g2 + 4], %l1
	.word	0x9db44f6f	! t0_kref+0x195c:   	fornot1s	%f17, %f15, %f14
	.word	0x95a00531	! t0_kref+0x1960:   	fsqrts	%f17, %f10
	.word	0xd40e3ff7	! t0_kref+0x1964:   	ldub	[%i0 - 9], %o2
	.word	0xa5b40d2a	! t0_kref+0x1968:   	fandnot1s	%f16, %f10, %f18
	.word	0x9db28f8c	! t0_kref+0x196c:   	for	%f10, %f12, %f14
	.word	0x86102004	! t0_kref+0x1970:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x1974:   	bne,a	_kref+0x1974
	.word	0x86a0e001	! t0_kref+0x1978:   	subcc	%g3, 1, %g3
	.word	0xd2000018	! t0_kref+0x197c:   	ld	[%g0 + %i0], %o1
	.word	0x81ac8ab0	! t0_kref+0x1980:   	fcmpes	%fcc0, %f18, %f16
	.word	0x26800003	! t0_kref+0x1984:   	bl,a	_kref+0x1990
	.word	0xd24e7ff2	! t0_kref+0x1988:   	ldsb	[%i1 - 0xe], %o1
	.word	0x9ba0188e	! t0_kref+0x198c:   	fitos	%f14, %f13
	.word	0x2f800006	! t0_kref+0x1990:   	fbu,a	_kref+0x19a8
	.word	0xa72b2013	! t0_kref+0x1994:   	sll	%o4, 0x13, %l3
	.word	0xda300019	! t0_kref+0x1998:   	sth	%o5, [%g0 + %i1]
	.word	0xd0566018	! t0_kref+0x199c:   	ldsh	[%i1 + 0x18], %o0
	.word	0xd00e2000	! t0_kref+0x19a0:   	ldub	[%i0], %o0
	.word	0xe6066010	! t0_kref+0x19a4:   	ld	[%i1 + 0x10], %l3
	.word	0xad400000	! t0_kref+0x19a8:   	mov	%y, %l6
	.word	0xa1b28f4e	! t0_kref+0x19ac:   	fornot1	%f10, %f14, %f16
	.word	0x952b2007	! t0_kref+0x19b0:   	sll	%o4, 0x7, %o2
	.word	0x9db48a4c	! t0_kref+0x19b4:   	fpadd32	%f18, %f12, %f14
	.word	0xe1be1a1b	! t0_kref+0x19b8:   	stda	%f16, [%i0 + %i3]0xd0
	.word	0xe76e401c	! t0_kref+0x19bc:   	prefetch	%i1 + %i4, 19
	.word	0x95a0054c	! t0_kref+0x19c0:   	fsqrtd	%f12, %f10
	.word	0xa3b3ca73	! t0_kref+0x19c4:   	fpadd32s	%f15, %f19, %f17
	.word	0x99b00cf0	! t0_kref+0x19c8:   	fnot2s	%f16, %f12
	.word	0x99b30d8c	! t0_kref+0x19cc:   	fxor	%f12, %f12, %f12
	.word	0xa3a0012d	! t0_kref+0x19d0:   	fabss	%f13, %f17
	.word	0x38800001	! t0_kref+0x19d4:   	bgu,a	_kref+0x19d8
	.word	0xa5a00532	! t0_kref+0x19d8:   	fsqrts	%f18, %f18
	.word	0x3b480001	! t0_kref+0x19dc:   	fble,a,pt	%fcc0, _kref+0x19e0
	.word	0x95b48aeb	! t0_kref+0x19e0:   	fpsub32s	%f18, %f11, %f10
	.word	0xa1b38d2c	! t0_kref+0x19e4:   	fandnot1s	%f14, %f12, %f16
	.word	0xa7400000	! t0_kref+0x19e8:   	mov	%y, %l3
	.word	0xaa632678	! t0_kref+0x19ec:   	subc	%o4, 0x678, %l5
	.word	0xa21b000c	! t0_kref+0x19f0:   	xor	%o4, %o4, %l1
	.word	0x81dea09e	! t0_kref+0x19f4:   	flush	%i2 + 0x9e
	.word	0x81ac8a2d	! t0_kref+0x19f8:   	fcmps	%fcc0, %f18, %f13
	.word	0xe19eda18	! t0_kref+0x19fc:   	ldda	[%i3 + %i0]0xd0, %f16
	.word	0xe51fbdc0	! t0_kref+0x1a00:   	ldd	[%fp - 0x240], %f18
	.word	0xa49b6e53	! t0_kref+0x1a04:   	xorcc	%o5, 0xe53, %l2
	.word	0xd64e4000	! t0_kref+0x1a08:   	ldsb	[%i1], %o3
	.word	0xa7a0052d	! t0_kref+0x1a0c:   	fsqrts	%f13, %f19
	.word	0xd04e0000	! t0_kref+0x1a10:   	ldsb	[%i0], %o0
	.word	0xfe16c000	! t0_kref+0x1a14:   	lduh	[%i3], %i7
	.word	0xa1a0002d	! t0_kref+0x1a18:   	fmovs	%f13, %f16
	.word	0xdd00a030	! t0_kref+0x1a1c:   	ld	[%g2 + 0x30], %f14
	.word	0xd206200c	! t0_kref+0x1a20:   	ld	[%i0 + 0xc], %o1
	.word	0x91b3004d	! t0_kref+0x1a24:   	edge8l	%o4, %o5, %o0
	.word	0xac73400c	! t0_kref+0x1a28:   	udiv	%o5, %o4, %l6
	.word	0xaa93292a	! t0_kref+0x1a2c:   	orcc	%o4, 0x92a, %l5
	.word	0x99b3866a	! t0_kref+0x1a30:   	fmul8x16au	%f14, %f10, %f12
	.word	0xa3b34ea0	! t0_kref+0x1a34:   	fsrc1s	%f13, %f17
	.word	0x95b286ca	! t0_kref+0x1a38:   	fmul8sux16	%f10, %f10, %f10
	.word	0xa8b3400c	! t0_kref+0x1a3c:   	orncc	%o5, %o4, %l4
	.word	0xed6e401d	! t0_kref+0x1a40:   	prefetch	%i1 + %i5, 22
	.word	0x96fb400c	! t0_kref+0x1a44:   	sdivcc	%o5, %o4, %o3
	.word	0xab237453	! t0_kref+0x1a48:   	mulscc	%o5, -0xbad, %l5
	.word	0x9db28d8e	! t0_kref+0x1a4c:   	fxor	%f10, %f14, %f14
	.word	0xec1f4018	! t0_kref+0x1a50:   	ldd	[%i5 + %i0], %l6
	.word	0xe248a00e	! t0_kref+0x1a54:   	ldsb	[%g2 + 0xe], %l1
	.word	0x907320c5	! t0_kref+0x1a58:   	udiv	%o4, 0xc5, %o0
	.word	0x91400000	! t0_kref+0x1a5c:   	mov	%y, %o0
	.word	0xac037c7d	! t0_kref+0x1a60:   	add	%o5, -0x383, %l6
	.word	0xee0e600d	! t0_kref+0x1a64:   	ldub	[%i1 + 0xd], %l7
	.word	0xee4e3ff4	! t0_kref+0x1a68:   	ldsb	[%i0 - 0xc], %l7
	.word	0x9bb38a2d	! t0_kref+0x1a6c:   	fpadd16s	%f14, %f13, %f13
	.word	0xa2a377e4	! t0_kref+0x1a70:   	subcc	%o5, -0x81c, %l1
	.word	0x31800005	! t0_kref+0x1a74:   	fba,a	_kref+0x1a88
	.word	0x93b3410c	! t0_kref+0x1a78:   	edge32	%o5, %o4, %o1
	.word	0x99b007b2	! t0_kref+0x1a7c:   	fpackfix	%f18, %f12
	.word	0x9fa2c8b1	! t0_kref+0x1a80:   	fsubs	%f11, %f17, %f15
	.word	0xe11fbc28	! t0_kref+0x1a84:   	ldd	[%fp - 0x3d8], %f16
	.word	0xd4080019	! t0_kref+0x1a88:   	ldub	[%g0 + %i1], %o2
	.word	0x81dc0018	! t0_kref+0x1a8c:   	flush	%l0 + %i0
	.word	0xae133559	! t0_kref+0x1a90:   	or	%o4, -0xaa7, %l7
	.word	0xdd1fbeb0	! t0_kref+0x1a94:   	ldd	[%fp - 0x150], %f14
	.word	0x9da01a32	! t0_kref+0x1a98:   	fstoi	%f18, %f14
	.word	0xea00a028	! t0_kref+0x1a9c:   	ld	[%g2 + 0x28], %l5
	.word	0x95a00550	! t0_kref+0x1aa0:   	fsqrtd	%f16, %f10
	.word	0xe2067fe0	! t0_kref+0x1aa4:   	ld	[%i1 - 0x20], %l1
	.word	0xa5b30200	! t0_kref+0x1aa8:   	array8	%o4, %g0, %l2
	.word	0xac63400c	! t0_kref+0x1aac:   	subc	%o5, %o4, %l6
	.word	0x95b38f92	! t0_kref+0x1ab0:   	for	%f14, %f18, %f10
	.word	0x95a01090	! t0_kref+0x1ab4:   	fxtos	%f16, %f10
	.word	0xae032ef6	! t0_kref+0x1ab8:   	add	%o4, 0xef6, %l7
	.word	0xec08a025	! t0_kref+0x1abc:   	ldub	[%g2 + 0x25], %l6
	.word	0xa762800c	! t0_kref+0x1ac0:   	movue	%fcc0, %o4, %l3
	.word	0x902b29b3	! t0_kref+0x1ac4:   	andn	%o4, 0x9b3, %o0
	.word	0xa3a0002e	! t0_kref+0x1ac8:   	fmovs	%f14, %f17
	.word	0x9fa388ae	! t0_kref+0x1acc:   	fsubs	%f14, %f14, %f15
	.word	0xa92b6005	! t0_kref+0x1ad0:   	sll	%o5, 0x5, %l4
	.word	0xe44e8019	! t0_kref+0x1ad4:   	ldsb	[%i2 + %i1], %l2
	.word	0xa3a01090	! t0_kref+0x1ad8:   	fxtos	%f16, %f17
	.word	0xa463400c	! t0_kref+0x1adc:   	subc	%o5, %o4, %l2
	.word	0x81834000	! t0_kref+0x1ae0:   	wr	%o5, %g0, %y
	.word	0xe81e001d	! t0_kref+0x1ae4:   	ldd	[%i0 + %i5], %l4
	.word	0x92336a8f	! t0_kref+0x1ae8:   	orn	%o5, 0xa8f, %o1
	.word	0xa8b3000d	! t0_kref+0x1aec:   	orncc	%o4, %o5, %l4
	.word	0xa3b30240	! t0_kref+0x1af0:   	array16	%o4, %g0, %l1
	.word	0x95b40d8a	! t0_kref+0x1af4:   	fxor	%f16, %f10, %f10
	.word	0x99a0054c	! t0_kref+0x1af8:   	fsqrtd	%f12, %f12
	.word	0xf7ee501d	! t0_kref+0x1afc:   	prefetcha	%i1 + %i5, 27
	.word	0xd9be188d	! t0_kref+0x1b00:   	stda	%f12, [%i0 + %o5]0xc4
	.word	0x001fffff	! t0_kref+0x1b04:   	illtrap	0x1fffff
	.word	0x95a0054a	! t0_kref+0x1b08:   	fsqrtd	%f10, %f10
	.word	0xe51e3fe8	! t0_kref+0x1b0c:   	ldd	[%i0 - 0x18], %f18
	.word	0x2530c8b0	! t0_kref+0x1b10:   	sethi	%hi(0xc322c000), %l2
	.word	0x95a0052f	! t0_kref+0x1b14:   	fsqrts	%f15, %f10
	.word	0xad408000	! t0_kref+0x1b18:   	mov	%ccr, %l6
	.word	0xa3b3030d	! t0_kref+0x1b1c:   	alignaddr	%o4, %o5, %l1
	.word	0x9213000d	! t0_kref+0x1b20:   	or	%o4, %o5, %o1
	.word	0xa7b28aac	! t0_kref+0x1b24:   	fpsub16s	%f10, %f12, %f19
	.word	0xa1b40acc	! t0_kref+0x1b28:   	fpsub32	%f16, %f12, %f16
	.word	0x81dcac51	! t0_kref+0x1b2c:   	flush	%l2 + 0xc51
	.word	0xd40e2002	! t0_kref+0x1b30:   	ldub	[%i0 + 2], %o2
	.word	0xd400a03c	! t0_kref+0x1b34:   	ld	[%g2 + 0x3c], %o2
	.word	0x26800004	! t0_kref+0x1b38:   	bl,a	_kref+0x1b48
	.word	0xec965000	! t0_kref+0x1b3c:   	lduha	[%i1]0x80, %l6
	.word	0xd500a038	! t0_kref+0x1b40:   	ld	[%g2 + 0x38], %f10
	.word	0x99b38f6b	! t0_kref+0x1b44:   	fornot1s	%f14, %f11, %f12
	.word	0x9613000c	! t0_kref+0x1b48:   	or	%o4, %o4, %o3
	.word	0xa5b30f6f	! t0_kref+0x1b4c:   	fornot1s	%f12, %f15, %f18
	.word	0xabb300ec	! t0_kref+0x1b50:   	edge16ln	%o4, %o4, %l5
	.word	0x97a388ab	! t0_kref+0x1b54:   	fsubs	%f14, %f11, %f11
	.word	0x2a480005	! t0_kref+0x1b58:   	bcs,a,pt	%icc, _kref+0x1b6c
	.word	0xd248a00f	! t0_kref+0x1b5c:   	ldsb	[%g2 + 0xf], %o1
	.word	0x9ba01a4c	! t0_kref+0x1b60:   	fdtoi	%f12, %f13
	.word	0xd6067ff8	! t0_kref+0x1b64:   	ld	[%i1 - 8], %o3
	.word	0xae03000d	! t0_kref+0x1b68:   	add	%o4, %o5, %l7
	.word	0x9063400c	! t0_kref+0x1b6c:   	subc	%o5, %o4, %o0
	.word	0xa1a00530	! t0_kref+0x1b70:   	fsqrts	%f16, %f16
	.word	0xa5a2884c	! t0_kref+0x1b74:   	faddd	%f10, %f12, %f18
	.word	0xe8c71019	! t0_kref+0x1b78:   	ldswa	[%i4 + %i1]0x80, %l4
	.word	0x99b4096e	! t0_kref+0x1b7c:   	fpmerge	%f16, %f14, %f12
	.word	0xd450a02c	! t0_kref+0x1b80:   	ldsh	[%g2 + 0x2c], %o2
	.word	0x9fb00fe0	! t0_kref+0x1b84:   	fones	%f15
	.word	0x81ab8a4a	! t0_kref+0x1b88:   	fcmpd	%fcc0, %f14, %f10
	.word	0x26800008	! t0_kref+0x1b8c:   	bl,a	_kref+0x1bac
	.word	0xd51e401d	! t0_kref+0x1b90:   	ldd	[%i1 + %i5], %f10
	.word	0xa53b400d	! t0_kref+0x1b94:   	sra	%o5, %o5, %l2
	.word	0xa5a01a4c	! t0_kref+0x1b98:   	fdtoi	%f12, %f18
	.word	0xdd3e6010	! t0_kref+0x1b9c:   	std	%f14, [%i1 + 0x10]
	.word	0xa7a0052b	! t0_kref+0x1ba0:   	fsqrts	%f11, %f19
	.word	0xa50377d1	! t0_kref+0x1ba4:   	taddcc	%o5, -0x82f, %l2
	.word	0x95b4496d	! t0_kref+0x1ba8:   	fpmerge	%f17, %f13, %f10
	.word	0xa8b3400d	! t0_kref+0x1bac:   	orncc	%o5, %o5, %l4
	.word	0x8d836d1e	! t0_kref+0x1bb0:   	wr	%o5, 0xd1e, %fprs
	.word	0x81580000	! t0_kref+0x1bb4:   	flushw
	.word	0xd20e001a	! t0_kref+0x1bb8:   	ldub	[%i0 + %i2], %o1
	.word	0x99b00fc0	! t0_kref+0x1bbc:   	fone	%f12
	.word	0xe4067fe4	! t0_kref+0x1bc0:   	ld	[%i1 - 0x1c], %l2
	.word	0xd64e7fe5	! t0_kref+0x1bc4:   	ldsb	[%i1 - 0x1b], %o3
	.word	0x21800004	! t0_kref+0x1bc8:   	fbn,a	_kref+0x1bd8
	.word	0xae7b775f	! t0_kref+0x1bcc:   	sdiv	%o5, -0x8a1, %l7
	.word	0xe816c018	! t0_kref+0x1bd0:   	lduh	[%i3 + %i0], %l4
	.word	0x9db40d0e	! t0_kref+0x1bd4:   	fandnot1	%f16, %f14, %f14
	.word	0xa6b32d59	! t0_kref+0x1bd8:   	orncc	%o4, 0xd59, %l3
	.word	0xee50a028	! t0_kref+0x1bdc:   	ldsh	[%g2 + 0x28], %l7
	.word	0xe806001c	! t0_kref+0x1be0:   	ld	[%i0 + %i4], %l4
	.word	0xe53e6000	! t0_kref+0x1be4:   	std	%f18, [%i1]
	.word	0xac13000c	! t0_kref+0x1be8:   	or	%o4, %o4, %l6
	.word	0x943332e5	! t0_kref+0x1bec:   	orn	%o4, -0xd1b, %o2
	.word	0xd4000018	! t0_kref+0x1bf0:   	ld	[%g0 + %i0], %o2
	.word	0x99a4094e	! t0_kref+0x1bf4:   	fmuld	%f16, %f14, %f12
	.word	0xd44e2002	! t0_kref+0x1bf8:   	ldsb	[%i0 + 2], %o2
	.word	0xa223400c	! t0_kref+0x1bfc:   	sub	%o5, %o4, %l1
	.word	0x8610200c	! t0_kref+0x1c00:   	mov	0xc, %g3
	.word	0x86a0e001	! t0_kref+0x1c04:   	subcc	%g3, 1, %g3
	.word	0x2280000b	! t0_kref+0x1c08:   	be,a	_kref+0x1c34
	.word	0xd9bf5a18	! t0_kref+0x1c0c:   	stda	%f12, [%i5 + %i0]0xd0
	.word	0xa7b48a71	! t0_kref+0x1c10:   	fpadd32s	%f18, %f17, %f19
	.word	0x96133544	! t0_kref+0x1c14:   	or	%o4, -0xabc, %o3
	.word	0xa7a018d2	! t0_kref+0x1c18:   	fdtos	%f18, %f19
	.word	0x97a0052b	! t0_kref+0x1c1c:   	fsqrts	%f11, %f11
	.word	0xac2b3fc6	! t0_kref+0x1c20:   	andn	%o4, -0x3a, %l6
	.word	0x9fb28cac	! t0_kref+0x1c24:   	fandnot2s	%f10, %f12, %f15
	.word	0xafb3416c	! t0_kref+0x1c28:   	edge32ln	%o5, %o4, %l7
	.word	0xe216200a	! t0_kref+0x1c2c:   	lduh	[%i0 + 0xa], %l1
	.word	0xd8b01019	! t0_kref+0x1c30:   	stha	%o4, [%g0 + %i1]0x80
	.word	0xe51e6000	! t0_kref+0x1c34:   	ldd	[%i1], %f18
	.word	0xe850a02a	! t0_kref+0x1c38:   	ldsh	[%g2 + 0x2a], %l4
	.word	0x99a308d0	! t0_kref+0x1c3c:   	fsubd	%f12, %f16, %f12
	.word	0xe03e4000	! t0_kref+0x1c40:   	std	%l0, [%i1]
	.word	0xeade1000	! t0_kref+0x1c44:   	ldxa	[%i0]0x80, %l5
	.word	0x37800001	! t0_kref+0x1c48:   	fbge,a	_kref+0x1c4c
	.word	0xe64e2000	! t0_kref+0x1c4c:   	ldsb	[%i0], %l3
	.word	0xa1a40d2c	! t0_kref+0x1c50:   	fsmuld	%f16, %f12, %f16
	.word	0x9fc00004	! t0_kref+0x1c54:   	call	%g0 + %g4
	.word	0xd91e6010	! t0_kref+0x1c58:   	ldd	[%i1 + 0x10], %f12
	.word	0xa5a018cc	! t0_kref+0x1c5c:   	fdtos	%f12, %f18
	.word	0x95a00550	! t0_kref+0x1c60:   	fsqrtd	%f16, %f10
	.word	0xe81e7fe0	! t0_kref+0x1c64:   	ldd	[%i1 - 0x20], %l4
	.word	0xd6df5018	! t0_kref+0x1c68:   	ldxa	[%i5 + %i0]0x80, %o3
	.word	0xe53e6018	! t0_kref+0x1c6c:   	std	%f18, [%i1 + 0x18]
	.word	0xa5a488ce	! t0_kref+0x1c70:   	fsubd	%f18, %f14, %f18
	.word	0x31800007	! t0_kref+0x1c74:   	fba,a	_kref+0x1c90
	.word	0x9fb38d60	! t0_kref+0x1c78:   	fnot1s	%f14, %f15
	.word	0xa1a3c82c	! t0_kref+0x1c7c:   	fadds	%f15, %f12, %f16
	.word	0xa5b48e0a	! t0_kref+0x1c80:   	fand	%f18, %f10, %f18
	.word	0x97b007b2	! t0_kref+0x1c84:   	fpackfix	%f18, %f11
	.word	0xabb340cc	! t0_kref+0x1c88:   	edge16l	%o5, %o4, %l5
	.word	0xa1a0102f	! t0_kref+0x1c8c:   	fstox	%f15, %f16
	.word	0xaa132061	! t0_kref+0x1c90:   	or	%o4, 0x61, %l5
	.word	0xa5a01a4c	! t0_kref+0x1c94:   	fdtoi	%f12, %f18
	.word	0x86102014	! t0_kref+0x1c98:   	mov	0x14, %g3
	.word	0x86a0e001	! t0_kref+0x1c9c:   	subcc	%g3, 1, %g3
	.word	0x2280000b	! t0_kref+0x1ca0:   	be,a	_kref+0x1ccc
	.word	0xa5b30a50	! t0_kref+0x1ca4:   	fpadd32	%f12, %f16, %f18
	.word	0xa1b48f6a	! t0_kref+0x1ca8:   	fornot1s	%f18, %f10, %f16
	.word	0xa7b28fae	! t0_kref+0x1cac:   	fors	%f10, %f14, %f19
	.word	0x9da01890	! t0_kref+0x1cb0:   	fitos	%f16, %f14
	.word	0x9da2c8ab	! t0_kref+0x1cb4:   	fsubs	%f11, %f11, %f14
	.word	0x909b3d99	! t0_kref+0x1cb8:   	xorcc	%o4, -0x267, %o0
	.word	0xd51e2000	! t0_kref+0x1cbc:   	ldd	[%i0], %f10
	.word	0x920b000d	! t0_kref+0x1cc0:   	and	%o4, %o5, %o1
	.word	0xaa1374d1	! t0_kref+0x1cc4:   	or	%o5, -0xb2f, %l5
	.word	0xafb3032c	! t0_kref+0x1cc8:   	bmask	%o4, %o4, %l7
	.word	0xe80e7ff1	! t0_kref+0x1ccc:   	ldub	[%i1 - 0xf], %l4
	.word	0x37800003	! t0_kref+0x1cd0:   	fbge,a	_kref+0x1cdc
	.word	0x9fb00fe0	! t0_kref+0x1cd4:   	fones	%f15
	.word	0x9db4898c	! t0_kref+0x1cd8:   	bshuffle	%f18, %f12, %f14
	.word	0xd4164000	! t0_kref+0x1cdc:   	lduh	[%i1], %o2
	.word	0xee4e7fe7	! t0_kref+0x1ce0:   	ldsb	[%i1 - 0x19], %l7
	.word	0x33800006	! t0_kref+0x1ce4:   	fbe,a	_kref+0x1cfc
	.word	0x9ba00032	! t0_kref+0x1ce8:   	fmovs	%f18, %f13
	.word	0x947367d2	! t0_kref+0x1cec:   	udiv	%o5, 0x7d2, %o2
	.word	0xa20338c8	! t0_kref+0x1cf0:   	add	%o4, -0x738, %l1
	.word	0x81dd0012	! t0_kref+0x1cf4:   	flush	%l4 + %l2
	.word	0xa32b000c	! t0_kref+0x1cf8:   	sll	%o4, %o4, %l1
	.word	0x99a0054c	! t0_kref+0x1cfc:   	fsqrtd	%f12, %f12
	.word	0xee4e0000	! t0_kref+0x1d00:   	ldsb	[%i0], %l7
	.word	0x99b00ccc	! t0_kref+0x1d04:   	fnot2	%f12, %f12
	.word	0xd608a03c	! t0_kref+0x1d08:   	ldub	[%g2 + 0x3c], %o3
	.word	0xdab01018	! t0_kref+0x1d0c:   	stha	%o5, [%g0 + %i0]0x80
	.word	0xf96e001d	! t0_kref+0x1d10:   	prefetch	%i0 + %i5, 28
	.word	0x81580000	! t0_kref+0x1d14:   	flushw
	.word	0xa69b000c	! t0_kref+0x1d18:   	xorcc	%o4, %o4, %l3
	.word	0xa93b201f	! t0_kref+0x1d1c:   	sra	%o4, 0x1f, %l4
	.word	0x2e800004	! t0_kref+0x1d20:   	bvs,a	_kref+0x1d30
	.word	0x940b400c	! t0_kref+0x1d24:   	and	%o5, %o4, %o2
	.word	0xa1b3890a	! t0_kref+0x1d28:   	faligndata	%f14, %f10, %f16
	.word	0xa1b286f0	! t0_kref+0x1d2c:   	fmul8ulx16	%f10, %f16, %f16
	.word	0xafb300cc	! t0_kref+0x1d30:   	edge16l	%o4, %o4, %l7
	.word	0x973b000d	! t0_kref+0x1d34:   	sra	%o4, %o5, %o3
	.word	0xa1b3872c	! t0_kref+0x1d38:   	fmuld8ulx16	%f14, %f12, %f16
	.word	0x9fc00004	! t0_kref+0x1d3c:   	call	%g0 + %g4
	.word	0xb8103fec	! t0_kref+0x1d40:   	mov	0xffffffec, %i4
	.word	0xe3ee501a	! t0_kref+0x1d44:   	prefetcha	%i1 + %i2, 17
	.word	0xe700a020	! t0_kref+0x1d48:   	ld	[%g2 + 0x20], %f19
	.word	0x90f3000c	! t0_kref+0x1d4c:   	udivcc	%o4, %o4, %o0
	.word	0xee50a01c	! t0_kref+0x1d50:   	ldsh	[%g2 + 0x1c], %l7
	.word	0x9de3bfa0	! t0_kref+0x1d54:   	save	%sp, -0x60, %sp
	.word	0xafee3a8f	! t0_kref+0x1d58:   	restore	%i0, -0x571, %l7
	.word	0xa60b400d	! t0_kref+0x1d5c:   	and	%o5, %o5, %l3
	.word	0xa49b63d1	! t0_kref+0x1d60:   	xorcc	%o5, 0x3d1, %l2
	.word	0xac9b32ef	! t0_kref+0x1d64:   	xorcc	%o4, -0xd11, %l6
	.word	0xd46e7ff6	! t0_kref+0x1d68:   	ldstub	[%i1 - 0xa], %o2
	.word	0xa7a348ad	! t0_kref+0x1d6c:   	fsubs	%f13, %f13, %f19
	.word	0xab400000	! t0_kref+0x1d70:   	mov	%y, %l5
	.word	0xa7a018ce	! t0_kref+0x1d74:   	fdtos	%f14, %f19
	.word	0x81dbc004	! t0_kref+0x1d78:   	flush	%o7 + %g4
	.word	0xa67335b6	! t0_kref+0x1d7c:   	udiv	%o4, -0xa4a, %l3
	.word	0x912b000d	! t0_kref+0x1d80:   	sll	%o4, %o5, %o0
	.word	0x9fc10000	! t0_kref+0x1d84:   	call	%g4
	.word	0x93332016	! t0_kref+0x1d88:   	srl	%o4, 0x16, %o1
	.word	0x973b6018	! t0_kref+0x1d8c:   	sra	%o5, 0x18, %o3
	.word	0xe87f0018	! t0_kref+0x1d90:   	swap	[%i4 + %i0], %l4
	.word	0x962b000c	! t0_kref+0x1d94:   	andn	%o4, %o4, %o3
	.word	0x81830000	! t0_kref+0x1d98:   	wr	%o4, %g0, %y
	.word	0x9fa01a4c	! t0_kref+0x1d9c:   	fdtoi	%f12, %f15
	.word	0x2d800005	! t0_kref+0x1da0:   	fbg,a	_kref+0x1db4
	.word	0x95b30dce	! t0_kref+0x1da4:   	fnand	%f12, %f14, %f10
	.word	0x9fc00004	! t0_kref+0x1da8:   	call	%g0 + %g4
	.word	0x95b48d92	! t0_kref+0x1dac:   	fxor	%f18, %f18, %f10
	.word	0xa3a0188d	! t0_kref+0x1db0:   	fitos	%f13, %f17
	.word	0xe648a021	! t0_kref+0x1db4:   	ldsb	[%g2 + 0x21], %l3
	.word	0xda6e8018	! t0_kref+0x1db8:   	ldstub	[%i2 + %i0], %o5
	.word	0x929b000d	! t0_kref+0x1dbc:   	xorcc	%o4, %o5, %o1
	.word	0x9263400d	! t0_kref+0x1dc0:   	subc	%o5, %o5, %o1
	.word	0xd048a031	! t0_kref+0x1dc4:   	ldsb	[%g2 + 0x31], %o0
	.word	0xa1a000ae	! t0_kref+0x1dc8:   	fnegs	%f14, %f16
	.word	0x81ac4aaf	! t0_kref+0x1dcc:   	fcmpes	%fcc0, %f17, %f15
	.word	0xae8b400c	! t0_kref+0x1dd0:   	andcc	%o5, %o4, %l7
	.word	0xe81e6000	! t0_kref+0x1dd4:   	ldd	[%i1], %l4
	.word	0xa5a4c92c	! t0_kref+0x1dd8:   	fmuls	%f19, %f12, %f18
	.word	0xdd1e0000	! t0_kref+0x1ddc:   	ldd	[%i0], %f14
	.word	0xe84e600d	! t0_kref+0x1de0:   	ldsb	[%i1 + 0xd], %l4
	.word	0xacb3000c	! t0_kref+0x1de4:   	orncc	%o4, %o4, %l6
	.word	0xabb3016d	! t0_kref+0x1de8:   	edge32ln	%o4, %o5, %l5
	.word	0xd40e2010	! t0_kref+0x1dec:   	ldub	[%i0 + 0x10], %o2
	.word	0x9ba01891	! t0_kref+0x1df0:   	fitos	%f17, %f13
	.word	0x3d480008	! t0_kref+0x1df4:   	fbule,a,pt	%fcc0, _kref+0x1e14
	.word	0xe500a028	! t0_kref+0x1df8:   	ld	[%g2 + 0x28], %f18
	.word	0xe41e6008	! t0_kref+0x1dfc:   	ldd	[%i1 + 8], %l2
	.word	0x24800002	! t0_kref+0x1e00:   	ble,a	_kref+0x1e08
	.word	0x9ba0052a	! t0_kref+0x1e04:   	fsqrts	%f10, %f13
	.word	0x9da40952	! t0_kref+0x1e08:   	fmuld	%f16, %f18, %f14
	.word	0xc06e0000	! t0_kref+0x1e0c:   	ldstub	[%i0], %g0
	.word	0x3d480005	! t0_kref+0x1e10:   	fbule,a,pt	%fcc0, _kref+0x1e24
	.word	0x9db4caae	! t0_kref+0x1e14:   	fpsub16s	%f19, %f14, %f14
	.word	0xae93400d	! t0_kref+0x1e18:   	orcc	%o5, %o5, %l7
	.word	0x90337cbf	! t0_kref+0x1e1c:   	orn	%o5, -0x341, %o0
	.word	0xd448a034	! t0_kref+0x1e20:   	ldsb	[%g2 + 0x34], %o2
	.word	0x2d480001	! t0_kref+0x1e24:   	fbg,a,pt	%fcc0, _kref+0x1e28
	.word	0x99b4066f	! t0_kref+0x1e28:   	fmul8x16au	%f16, %f15, %f12
	.word	0x86102002	! t0_kref+0x1e2c:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x1e30:   	bne,a	_kref+0x1e30
	.word	0x86a0e001	! t0_kref+0x1e34:   	subcc	%g3, 1, %g3
	.word	0xd2067ff8	! t0_kref+0x1e38:   	ld	[%i1 - 8], %o1
	.word	0x99b48e80	! t0_kref+0x1e3c:   	fsrc1	%f18, %f12
	.word	0x99a01090	! t0_kref+0x1e40:   	fxtos	%f16, %f12
	.word	0xa1a0002a	! t0_kref+0x1e44:   	fmovs	%f10, %f16
	.word	0x90a328e3	! t0_kref+0x1e48:   	subcc	%o4, 0x8e3, %o0
	.word	0xd9a01019	! t0_kref+0x1e4c:   	sta	%f12, [%g0 + %i1]0x80
	.word	0xd830a032	! t0_kref+0x1e50:   	sth	%o4, [%g2 + 0x32]
	.word	0xa5b30a12	! t0_kref+0x1e54:   	fpadd16	%f12, %f18, %f18
	.word	0xa5a28950	! t0_kref+0x1e58:   	fmuld	%f10, %f16, %f18
	.word	0x24800003	! t0_kref+0x1e5c:   	ble,a	_kref+0x1e68
	.word	0x8143c000	! t0_kref+0x1e60:   	stbar
	.word	0xe49f5018	! t0_kref+0x1e64:   	ldda	[%i5 + %i0]0x80, %l2
	.word	0xe6166014	! t0_kref+0x1e68:   	lduh	[%i1 + 0x14], %l3
	.word	0x81ab0a2e	! t0_kref+0x1e6c:   	fcmps	%fcc0, %f12, %f14
	.word	0xa52b400d	! t0_kref+0x1e70:   	sll	%o5, %o5, %l2
	.word	0xec7e6010	! t0_kref+0x1e74:   	swap	[%i1 + 0x10], %l6
	.word	0xe47e2010	! t0_kref+0x1e78:   	swap	[%i0 + 0x10], %l2
	.word	0x99b28ed2	! t0_kref+0x1e7c:   	fornot2	%f10, %f18, %f12
	.word	0x9de3bfa0	! t0_kref+0x1e80:   	save	%sp, -0x60, %sp
	.word	0xb70ec01c	! t0_kref+0x1e84:   	tsubcc	%i3, %i4, %i3
	.word	0xa9ee3c66	! t0_kref+0x1e88:   	restore	%i0, -0x39a, %l4
	.word	0x3f800002	! t0_kref+0x1e8c:   	fbo,a	_kref+0x1e94
	.word	0x81d93dd1	! t0_kref+0x1e90:   	flush	%g4 - 0x22f
	.word	0xa2fb000d	! t0_kref+0x1e94:   	sdivcc	%o4, %o5, %l1
	.word	0xa2136184	! t0_kref+0x1e98:   	or	%o5, 0x184, %l1
	.word	0xd690105b	! t0_kref+0x1e9c:   	lduha	[%g0 + %i3]0x82, %o3
	.word	0x9fc10000	! t0_kref+0x1ea0:   	call	%g4
	.word	0x91b3030d	! t0_kref+0x1ea4:   	alignaddr	%o4, %o5, %o0
	.word	0x81dc000e	! t0_kref+0x1ea8:   	flush	%l0 + %sp
	.word	0x932b400c	! t0_kref+0x1eac:   	sll	%o5, %o4, %o1
	.word	0x39480008	! t0_kref+0x1eb0:   	fbuge,a,pt	%fcc0, _kref+0x1ed0
	.word	0xe88e101a	! t0_kref+0x1eb4:   	lduba	[%i0 + %i2]0x80, %l4
	.word	0xa68b400d	! t0_kref+0x1eb8:   	andcc	%o5, %o5, %l3
	.word	0xe03e7ff0	! t0_kref+0x1ebc:   	std	%l0, [%i1 - 0x10]
	.word	0x95a4884c	! t0_kref+0x1ec0:   	faddd	%f18, %f12, %f10
	.word	0xd6ff1018	! t0_kref+0x1ec4:   	swapa	[%i4 + %i0]0x80, %o3
	.word	0xd448a032	! t0_kref+0x1ec8:   	ldsb	[%g2 + 0x32], %o2
	.word	0xa1a01890	! t0_kref+0x1ecc:   	fitos	%f16, %f16
	.word	0xe53e3fe0	! t0_kref+0x1ed0:   	std	%f18, [%i0 - 0x20]
	.word	0xa3b007b0	! t0_kref+0x1ed4:   	fpackfix	%f16, %f17
	.word	0x94b3400c	! t0_kref+0x1ed8:   	orncc	%o5, %o4, %o2
	.word	0x37800002	! t0_kref+0x1edc:   	fbge,a	_kref+0x1ee4
	.word	0xe56e001a	! t0_kref+0x1ee0:   	prefetch	%i0 + %i2, 18
	.word	0xa1a0188e	! t0_kref+0x1ee4:   	fitos	%f14, %f16
	.word	0xafb3032c	! t0_kref+0x1ee8:   	bmask	%o4, %o4, %l7
	.word	0x9da4c82d	! t0_kref+0x1eec:   	fadds	%f19, %f13, %f14
	.word	0xae0b400d	! t0_kref+0x1ef0:   	and	%o5, %o5, %l7
	.word	0xab2b000d	! t0_kref+0x1ef4:   	sll	%o4, %o5, %l5
	.word	0xe1be188d	! t0_kref+0x1ef8:   	stda	%f16, [%i0 + %o5]0xc4
	.word	0xa7a0188c	! t0_kref+0x1efc:   	fitos	%f12, %f19
	.word	0xc76e7ff8	! t0_kref+0x1f00:   	prefetch	%i1 - 8, 3
	.word	0xa873000c	! t0_kref+0x1f04:   	udiv	%o4, %o4, %l4
	.word	0xd4e81019	! t0_kref+0x1f08:   	ldstuba	[%g0 + %i1]0x80, %o2
	.word	0x25800004	! t0_kref+0x1f0c:   	fblg,a	_kref+0x1f1c
	.word	0xa5a0054e	! t0_kref+0x1f10:   	fsqrtd	%f14, %f18
	.word	0xa1a8c04e	! t0_kref+0x1f14:   	fmovdul	%fcc0, %f14, %f16
	.word	0x37800006	! t0_kref+0x1f18:   	fbge,a	_kref+0x1f30
	.word	0xd830a030	! t0_kref+0x1f1c:   	sth	%o4, [%g2 + 0x30]
	.word	0x94637d42	! t0_kref+0x1f20:   	subc	%o5, -0x2be, %o2
	.word	0x95a0054a	! t0_kref+0x1f24:   	fsqrtd	%f10, %f10
	.word	0xd900a03c	! t0_kref+0x1f28:   	ld	[%g2 + 0x3c], %f12
	.word	0xe1a61000	! t0_kref+0x1f2c:   	sta	%f16, [%i0]0x80
	.word	0x23480005	! t0_kref+0x1f30:   	fbne,a,pt	%fcc0, _kref+0x1f44
	.word	0xe11fbcc0	! t0_kref+0x1f34:   	ldd	[%fp - 0x340], %f16
	.word	0x90337f84	! t0_kref+0x1f38:   	orn	%o5, -0x7c, %o0
	.word	0xda7e3ff0	! t0_kref+0x1f3c:   	swap	[%i0 - 0x10], %o5
	.word	0xa1b28f6c	! t0_kref+0x1f40:   	fornot1s	%f10, %f12, %f16
	.word	0x94fb400c	! t0_kref+0x1f44:   	sdivcc	%o5, %o4, %o2
	.word	0x92736d0a	! t0_kref+0x1f48:   	udiv	%o5, 0xd0a, %o1
	.word	0xabb340ad	! t0_kref+0x1f4c:   	edge16n	%o5, %o5, %l5
	.word	0xe696d040	! t0_kref+0x1f50:   	lduha	[%i3]0x82, %l3
	.word	0xd4d6101b	! t0_kref+0x1f54:   	ldsha	[%i0 + %i3]0x80, %o2
	.word	0xa49b000c	! t0_kref+0x1f58:   	xorcc	%o4, %o4, %l2
	.word	0xc568a040	! t0_kref+0x1f5c:   	prefetch	%g2 + 0x40, 2
	.word	0x9fb44d2c	! t0_kref+0x1f60:   	fandnot1s	%f17, %f12, %f15
	.word	0xa73b201d	! t0_kref+0x1f64:   	sra	%o4, 0x1d, %l3
	.word	0x9fc10000	! t0_kref+0x1f68:   	call	%g4
	.word	0x81580000	! t0_kref+0x1f6c:   	flushw
	.word	0x90636e33	! t0_kref+0x1f70:   	subc	%o5, 0xe33, %o0
	.word	0x2d480006	! t0_kref+0x1f74:   	fbg,a,pt	%fcc0, _kref+0x1f8c
	.word	0xa69b6b73	! t0_kref+0x1f78:   	xorcc	%o5, 0xb73, %l3
	.word	0x92732453	! t0_kref+0x1f7c:   	udiv	%o4, 0x453, %o1
	.word	0x31480004	! t0_kref+0x1f80:   	fba,a,pt	%fcc0, _kref+0x1f90
	.word	0x95b0076a	! t0_kref+0x1f84:   	fpack16	%f10, %f10
	.word	0xd500a018	! t0_kref+0x1f88:   	ld	[%g2 + 0x18], %f10
	.word	0xe800a020	! t0_kref+0x1f8c:   	ld	[%g2 + 0x20], %l4
	.word	0xeb68a04f	! t0_kref+0x1f90:   	prefetch	%g2 + 0x4f, 21
	.word	0xe848a00c	! t0_kref+0x1f94:   	ldsb	[%g2 + 0xc], %l4
	.word	0xee6e8019	! t0_kref+0x1f98:   	ldstub	[%i2 + %i1], %l7
	.word	0x9fc00004	! t0_kref+0x1f9c:   	call	%g0 + %g4
	.word	0x99a00030	! t0_kref+0x1fa0:   	fmovs	%f16, %f12
	.word	0x9fc10000	! t0_kref+0x1fa4:   	call	%g4
	.word	0xe03f4019	! t0_kref+0x1fa8:   	std	%l0, [%i5 + %i1]
	.word	0x95b38d8c	! t0_kref+0x1fac:   	fxor	%f14, %f12, %f10
	.word	0xa2b3000c	! t0_kref+0x1fb0:   	orncc	%o4, %o4, %l1
	.word	0x969b000d	! t0_kref+0x1fb4:   	xorcc	%o4, %o5, %o3
	.word	0xe4480019	! t0_kref+0x1fb8:   	ldsb	[%g0 + %i1], %l2
	.word	0xd8263fe0	! t0_kref+0x1fbc:   	st	%o4, [%i0 - 0x20]
	.word	0x961332c3	! t0_kref+0x1fc0:   	or	%o4, -0xd3d, %o3
	.word	0x37480004	! t0_kref+0x1fc4:   	fbge,a,pt	%fcc0, _kref+0x1fd4
	.word	0xe400a018	! t0_kref+0x1fc8:   	ld	[%g2 + 0x18], %l2
	.word	0xe11fbcb8	! t0_kref+0x1fcc:   	ldd	[%fp - 0x348], %f16
	.word	0x29800006	! t0_kref+0x1fd0:   	fbl,a	_kref+0x1fe8
	.word	0xa3a0108e	! t0_kref+0x1fd4:   	fxtos	%f14, %f17
	.word	0xef68a047	! t0_kref+0x1fd8:   	prefetch	%g2 + 0x47, 23
	.word	0x27480008	! t0_kref+0x1fdc:   	fbul,a,pt	%fcc0, _kref+0x1ffc
	.word	0xac133e42	! t0_kref+0x1fe0:   	or	%o4, -0x1be, %l6
	.word	0x9fc10000	! t0_kref+0x1fe4:   	call	%g4
	.word	0x8143c000	! t0_kref+0x1fe8:   	stbar
	.word	0x95b3896f	! t0_kref+0x1fec:   	fpmerge	%f14, %f15, %f10
	.word	0x9ba4882d	! t0_kref+0x1ff0:   	fadds	%f18, %f13, %f13
	.word	0x8143c000	! t0_kref+0x1ff4:   	stbar
	.word	0x27800001	! t0_kref+0x1ff8:   	fbul,a	_kref+0x1ffc
	.word	0xd4881019	! t0_kref+0x1ffc:   	lduba	[%g0 + %i1]0x80, %o2
	.word	0x94fb2b4f	! t0_kref+0x2000:   	sdivcc	%o4, 0xb4f, %o2
	.word	0xe4580019	! t0_kref+0x2004:   	ldx	[%g0 + %i1], %l2
	.word	0xdd1e7fe0	! t0_kref+0x2008:   	ldd	[%i1 - 0x20], %f14
	.word	0xec100018	! t0_kref+0x200c:   	lduh	[%g0 + %i0], %l6
	.word	0xa42b400d	! t0_kref+0x2010:   	andn	%o5, %o5, %l2
	.word	0xed68a084	! t0_kref+0x2014:   	prefetch	%g2 + 0x84, 22
	.word	0xd408a00a	! t0_kref+0x2018:   	ldub	[%g2 + 0xa], %o2
	.word	0xa6637be1	! t0_kref+0x201c:   	subc	%o5, -0x41f, %l3
	.word	0x9de3bfa0	! t0_kref+0x2020:   	save	%sp, -0x60, %sp
	.word	0xba173c49	! t0_kref+0x2024:   	or	%i4, -0x3b7, %i5
	.word	0x91eebd26	! t0_kref+0x2028:   	restore	%i2, -0x2da, %o0
	.word	0x96b3000d	! t0_kref+0x202c:   	orncc	%o4, %o5, %o3
	.word	0xa1ab804a	! t0_kref+0x2030:   	fmovdule	%fcc0, %f10, %f16
	.word	0x2f018c4f	! t0_kref+0x2034:   	sethi	%hi(0x6313c00), %l7
	.word	0x9db38ed0	! t0_kref+0x2038:   	fornot2	%f14, %f16, %f14
	.word	0x99a0188b	! t0_kref+0x203c:   	fitos	%f11, %f12
	.word	0x99b486ea	! t0_kref+0x2040:   	fmul8ulx16	%f18, %f10, %f12
	.word	0xa5b3466d	! t0_kref+0x2044:   	fmul8x16au	%f13, %f13, %f18
	.word	0xa7837e40	! t0_kref+0x2048:   	wr	%o5, 0xfffffe40, %gsr
	.word	0xec4e401a	! t0_kref+0x204c:   	ldsb	[%i1 + %i2], %l6
	.word	0xd6100019	! t0_kref+0x2050:   	lduh	[%g0 + %i1], %o3
	.word	0xaefb7a0e	! t0_kref+0x2054:   	sdivcc	%o5, -0x5f2, %l7
	.word	0xec1e7ff8	! t0_kref+0x2058:   	ldd	[%i1 - 8], %l6
	.word	0x25800001	! t0_kref+0x205c:   	fblg,a	_kref+0x2060
	.word	0xa78336c9	! t0_kref+0x2060:   	wr	%o4, 0xfffff6c9, %gsr
	.word	0xda2e7fef	! t0_kref+0x2064:   	stb	%o5, [%i1 - 0x11]
	.word	0xe606001c	! t0_kref+0x2068:   	ld	[%i0 + %i4], %l3
	.word	0x31800008	! t0_kref+0x206c:   	fba,a	_kref+0x208c
	.word	0x9ba01a2f	! t0_kref+0x2070:   	fstoi	%f15, %f13
	.word	0x95a01a4e	! t0_kref+0x2074:   	fdtoi	%f14, %f10
	.word	0x953b000d	! t0_kref+0x2078:   	sra	%o4, %o5, %o2
	.word	0xe11fbca8	! t0_kref+0x207c:   	ldd	[%fp - 0x358], %f16
	.word	0xd60e3ffd	! t0_kref+0x2080:   	ldub	[%i0 - 3], %o3
	.word	0x97a0052f	! t0_kref+0x2084:   	fsqrts	%f15, %f11
	.word	0xa1b38d0e	! t0_kref+0x2088:   	fandnot1	%f14, %f14, %f16
	.word	0x31800004	! t0_kref+0x208c:   	fba,a	_kref+0x209c
	.word	0xa7a01a52	! t0_kref+0x2090:   	fdtoi	%f18, %f19
	.word	0x81acca2c	! t0_kref+0x2094:   	fcmps	%fcc0, %f19, %f12
	.word	0x97400000	! t0_kref+0x2098:   	mov	%y, %o3
	.word	0x9213000d	! t0_kref+0x209c:   	or	%o4, %o5, %o1
	.word	0xa51b400d	! t0_kref+0x20a0:   	tsubcctv	%o5, %o5, %l2
	.word	0x97a018ca	! t0_kref+0x20a4:   	fdtos	%f10, %f11
	.word	0xe11f4019	! t0_kref+0x20a8:   	ldd	[%i5 + %i1], %f16
	.word	0x9da01a52	! t0_kref+0x20ac:   	fdtoi	%f18, %f14
	.word	0xa90b000c	! t0_kref+0x20b0:   	tsubcc	%o4, %o4, %l4
	.word	0x2b800001	! t0_kref+0x20b4:   	fbug,a	_kref+0x20b8
	.word	0x9fa4092e	! t0_kref+0x20b8:   	fmuls	%f16, %f14, %f15
	.word	0xa6a32314	! t0_kref+0x20bc:   	subcc	%o4, 0x314, %l3
	.word	0xb6102018	! t0_kref+0x20c0:   	mov	0x18, %i3
	.word	0xd040a010	! t0_kref+0x20c4:   	ldsw	[%g2 + 0x10], %o0
	.word	0xab036bc0	! t0_kref+0x20c8:   	taddcc	%o5, 0xbc0, %l5
	.word	0x9673000d	! t0_kref+0x20cc:   	udiv	%o4, %o5, %o3
	.word	0x97a00532	! t0_kref+0x20d0:   	fsqrts	%f18, %f11
	.word	0xdd1fbcc8	! t0_kref+0x20d4:   	ldd	[%fp - 0x338], %f14
	.word	0xa4737333	! t0_kref+0x20d8:   	udiv	%o5, -0xccd, %l2
	.word	0xa7b2cd60	! t0_kref+0x20dc:   	fnot1s	%f11, %f19
	.word	0xdd1e401d	! t0_kref+0x20e0:   	ldd	[%i1 + %i5], %f14
	.word	0xd050a034	! t0_kref+0x20e4:   	ldsh	[%g2 + 0x34], %o0
	.word	0x26480007	! t0_kref+0x20e8:   	bl,a,pt	%icc, _kref+0x2104
	.word	0xe2480019	! t0_kref+0x20ec:   	ldsb	[%g0 + %i1], %l1
	.word	0xaca370e5	! t0_kref+0x20f0:   	subcc	%o5, -0xf1b, %l6
	.word	0x9f414000	! t0_kref+0x20f4:   	mov	%pc, %o7
	.word	0x29480008	! t0_kref+0x20f8:   	fbl,a,pt	%fcc0, _kref+0x2118
	.word	0x9db28a4c	! t0_kref+0x20fc:   	fpadd32	%f10, %f12, %f14
	.word	0x81ab0ab2	! t0_kref+0x2100:   	fcmpes	%fcc0, %f12, %f18
	.word	0xa6b32496	! t0_kref+0x2104:   	orncc	%o4, 0x496, %l3
	.word	0xa93b6010	! t0_kref+0x2108:   	sra	%o5, 0x10, %l4
	.word	0xa1b40d40	! t0_kref+0x210c:   	fnot1	%f16, %f16
	.word	0xc807bfec	! t0_kref+0x2110:   	ld	[%fp - 0x14], %g4
	.word	0x9453000c	! t0_kref+0x2114:   	umul	%o4, %o4, %o2
	.word	0xc768a040	! t0_kref+0x2118:   	prefetch	%g2 + 0x40, 3
	.word	0x3f480008	! t0_kref+0x211c:   	fbo,a,pt	%fcc0, _kref+0x213c
	.word	0x9bb2ce2b	! t0_kref+0x2120:   	fands	%f11, %f11, %f13
	.word	0xa7a0052a	! t0_kref+0x2124:   	fsqrts	%f10, %f19
	.word	0x34800005	! t0_kref+0x2128:   	bg,a	_kref+0x213c
	.word	0xd416401b	! t0_kref+0x212c:   	lduh	[%i1 + %i3], %o2
	.word	0x97a018ca	! t0_kref+0x2130:   	fdtos	%f10, %f11
	.word	0x95a0054c	! t0_kref+0x2134:   	fsqrtd	%f12, %f10
	.word	0x9fc10000	! t0_kref+0x2138:   	call	%g4
	.word	0xa1b009ab	! t0_kref+0x213c:   	fexpand	%f11, %f16
	.word	0x95a01a2a	! t0_kref+0x2140:   	fstoi	%f10, %f10
	.word	0xa5a0054a	! t0_kref+0x2144:   	fsqrtd	%f10, %f18
	.word	0x8143c000	! t0_kref+0x2148:   	stbar
	.word	0xa2fb31be	! t0_kref+0x214c:   	sdivcc	%o4, -0xe42, %l1
	.word	0xa933400d	! t0_kref+0x2150:   	srl	%o5, %o5, %l4
	.word	0xa283400d	! t0_kref+0x2154:   	addcc	%o5, %o5, %l1
	.word	0xe800a038	! t0_kref+0x2158:   	ld	[%g2 + 0x38], %l4
	.word	0x3c800002	! t0_kref+0x215c:   	bpos,a	_kref+0x2164
	.word	0x99a00552	! t0_kref+0x2160:   	fsqrtd	%f18, %f12
	.word	0x9da38d2e	! t0_kref+0x2164:   	fsmuld	%f14, %f14, %f14
	.word	0x92736c30	! t0_kref+0x2168:   	udiv	%o5, 0xc30, %o1
	.word	0x92a366b5	! t0_kref+0x216c:   	subcc	%o5, 0x6b5, %o1
	.word	0xd53e001d	! t0_kref+0x2170:   	std	%f10, [%i0 + %i5]
	.word	0x9323000c	! t0_kref+0x2174:   	mulscc	%o4, %o4, %o1
	.word	0x81ac4aab	! t0_kref+0x2178:   	fcmpes	%fcc0, %f17, %f11
	.word	0xe03f4019	! t0_kref+0x217c:   	std	%l0, [%i5 + %i1]
	.word	0x93408000	! t0_kref+0x2180:   	mov	%ccr, %o1
	.word	0x9063400d	! t0_kref+0x2184:   	subc	%o5, %o5, %o0
	.word	0xe24e4000	! t0_kref+0x2188:   	ldsb	[%i1], %l1
	.word	0xa863400c	! t0_kref+0x218c:   	subc	%o5, %o4, %l4
	.word	0x92b36217	! t0_kref+0x2190:   	orncc	%o5, 0x217, %o1
	.word	0x92b3000d	! t0_kref+0x2194:   	orncc	%o4, %o5, %o1
	.word	0xd010a00c	! t0_kref+0x2198:   	lduh	[%g2 + 0xc], %o0
	.word	0x9fa0052b	! t0_kref+0x219c:   	fsqrts	%f11, %f15
	.word	0x9ba0052f	! t0_kref+0x21a0:   	fsqrts	%f15, %f13
	.word	0x9fa00533	! t0_kref+0x21a4:   	fsqrts	%f19, %f15
	.word	0x9ba00532	! t0_kref+0x21a8:   	fsqrts	%f18, %f13
	.word	0xa7a0052e	! t0_kref+0x21ac:   	fsqrts	%f14, %f19
	.word	0x9ba01a4c	! t0_kref+0x21b0:   	fdtoi	%f12, %f13
	.word	0x95a01a50	! t0_kref+0x21b4:   	fdtoi	%f16, %f10
	.word	0x81ab4aab	! t0_kref+0x21b8:   	fcmpes	%fcc0, %f13, %f11
	.word	0x9db48d12	! t0_kref+0x21bc:   	fandnot1	%f18, %f18, %f14
	.word	0x94c3000c	! t0_kref+0x21c0:   	addccc	%o4, %o4, %o2
	.word	0x3e800001	! t0_kref+0x21c4:   	bvc,a	_kref+0x21c8
	.word	0xc3ee500d	! t0_kref+0x21c8:   	prefetcha	%i1 + %o5, 1
	.word	0x97b30200	! t0_kref+0x21cc:   	array8	%o4, %g0, %o3
	.word	0xd010a026	! t0_kref+0x21d0:   	lduh	[%g2 + 0x26], %o0
	.word	0xebe6100d	! t0_kref+0x21d4:   	casa	[%i0]0x80, %o5, %l5
	.word	0x91400000	! t0_kref+0x21d8:   	mov	%y, %o0
	.word	0x95b40a50	! t0_kref+0x21dc:   	fpadd32	%f16, %f16, %f10
	.word	0xa6732331	! t0_kref+0x21e0:   	udiv	%o4, 0x331, %l3
	.word	0x95a01a50	! t0_kref+0x21e4:   	fdtoi	%f16, %f10
	.word	0xd828a014	! t0_kref+0x21e8:   	stb	%o4, [%g2 + 0x14]
	.word	0x99ab8032	! t0_kref+0x21ec:   	fmovsule	%fcc0, %f18, %f12
	.word	0x8143c000	! t0_kref+0x21f0:   	stbar
	.word	0xe100a020	! t0_kref+0x21f4:   	ld	[%g2 + 0x20], %f16
	.word	0x23800001	! t0_kref+0x21f8:   	fbne,a	_kref+0x21fc
	.word	0xa1b009ae	! t0_kref+0x21fc:   	fexpand	%f14, %f16
	.word	0x3c800008	! t0_kref+0x2200:   	bpos,a	_kref+0x2220
	.word	0x953b6019	! t0_kref+0x2204:   	sra	%o5, 0x19, %o2
	.word	0xd400a020	! t0_kref+0x2208:   	ld	[%g2 + 0x20], %o2
	.word	0x95b4ca32	! t0_kref+0x220c:   	fpadd16s	%f19, %f18, %f10
	.word	0xe27e600c	! t0_kref+0x2210:   	swap	[%i1 + 0xc], %l1
	.word	0xa33b400c	! t0_kref+0x2214:   	sra	%o5, %o4, %l1
	.word	0xda267fe4	! t0_kref+0x2218:   	st	%o5, [%i1 - 0x1c]
	.word	0xa2632c18	! t0_kref+0x221c:   	subc	%o4, 0xc18, %l1
	.word	0x9bb38a6b	! t0_kref+0x2220:   	fpadd32s	%f14, %f11, %f13
	.word	0xa5b48d40	! t0_kref+0x2224:   	fnot1	%f18, %f18
	.word	0x9da0054e	! t0_kref+0x2228:   	fsqrtd	%f14, %f14
	.word	0xd51e6010	! t0_kref+0x222c:   	ldd	[%i1 + 0x10], %f10
	.word	0x81ac0ab1	! t0_kref+0x2230:   	fcmpes	%fcc0, %f16, %f17
	.word	0xe03e7fe8	! t0_kref+0x2234:   	std	%l0, [%i1 - 0x18]
	.word	0xa5b30280	! t0_kref+0x2238:   	array32	%o4, %g0, %l2
	.word	0x9de3bfa0	! t0_kref+0x223c:   	save	%sp, -0x60, %sp
	.word	0xb05f0019	! t0_kref+0x2240:   	smul	%i4, %i1, %i0
	.word	0xafee001c	! t0_kref+0x2244:   	restore	%i0, %i4, %l7
	.word	0xaf2b400d	! t0_kref+0x2248:   	sll	%o5, %o5, %l7
	.word	0xa5b38d40	! t0_kref+0x224c:   	fnot1	%f14, %f18
	.word	0x9da308d0	! t0_kref+0x2250:   	fsubd	%f12, %f16, %f14
	.word	0x9273400d	! t0_kref+0x2254:   	udiv	%o5, %o5, %o1
	.word	0x99b3066a	! t0_kref+0x2258:   	fmul8x16au	%f12, %f10, %f12
	.word	0xe03e3ff8	! t0_kref+0x225c:   	std	%l0, [%i0 - 8]
	.word	0xa5a01a52	! t0_kref+0x2260:   	fdtoi	%f18, %f18
	.word	0xa5a48852	! t0_kref+0x2264:   	faddd	%f18, %f18, %f18
	.word	0x2f800002	! t0_kref+0x2268:   	fbu,a	_kref+0x2270
	.word	0x9fa018ca	! t0_kref+0x226c:   	fdtos	%f10, %f15
	.word	0x81aa8ab0	! t0_kref+0x2270:   	fcmpes	%fcc0, %f10, %f16
	.word	0xa5b286d0	! t0_kref+0x2274:   	fmul8sux16	%f10, %f16, %f18
	.word	0xa5a00552	! t0_kref+0x2278:   	fsqrtd	%f18, %f18
	.word	0xd048a02e	! t0_kref+0x227c:   	ldsb	[%g2 + 0x2e], %o0
	.word	0x9073000d	! t0_kref+0x2280:   	udiv	%o4, %o5, %o0
	.word	0xa683400d	! t0_kref+0x2284:   	addcc	%o5, %o5, %l3
	.word	0x9da0052f	! t0_kref+0x2288:   	fsqrts	%f15, %f14
	.word	0x90b36e23	! t0_kref+0x228c:   	orncc	%o5, 0xe23, %o0
	.word	0x9fb30fb1	! t0_kref+0x2290:   	fors	%f12, %f17, %f15
	.word	0x94636325	! t0_kref+0x2294:   	subc	%o5, 0x325, %o2
	.word	0xc56e400c	! t0_kref+0x2298:   	prefetch	%i1 + %o4, 2
	.word	0x27480003	! t0_kref+0x229c:   	fbul,a,pt	%fcc0, _kref+0x22a8
	.word	0xe03e2000	! t0_kref+0x22a0:   	std	%l0, [%i0]
	.word	0x9db38ed2	! t0_kref+0x22a4:   	fornot2	%f14, %f18, %f14
	.word	0x95a308ca	! t0_kref+0x22a8:   	fsubd	%f12, %f10, %f10
	.word	0xa87b609f	! t0_kref+0x22ac:   	sdiv	%o5, 0x9f, %l4
	.word	0xd9066000	! t0_kref+0x22b0:   	ld	[%i1], %f12
	.word	0x81dc001e	! t0_kref+0x22b4:   	flush	%l0 + %fp
	.word	0xa7837b85	! t0_kref+0x22b8:   	wr	%o5, 0xfffffb85, %gsr
	.word	0x9da2c930	! t0_kref+0x22bc:   	fmuls	%f11, %f16, %f14
	.word	0xe07e2008	! t0_kref+0x22c0:   	swap	[%i0 + 8], %l0
	.word	0x9673400d	! t0_kref+0x22c4:   	udiv	%o5, %o5, %o3
	.word	0xaf400000	! t0_kref+0x22c8:   	mov	%y, %l7
	.word	0xa32b600a	! t0_kref+0x22cc:   	sll	%o5, 0xa, %l1
	.word	0x21480005	! t0_kref+0x22d0:   	fbn,a,pt	%fcc0, _kref+0x22e4
	.word	0x9bb30e2b	! t0_kref+0x22d4:   	fands	%f12, %f11, %f13
	.word	0xd0167fea	! t0_kref+0x22d8:   	lduh	[%i1 - 0x16], %o0
	.word	0xe01e4000	! t0_kref+0x22dc:   	ldd	[%i1], %l0
	.word	0xa1a0002e	! t0_kref+0x22e0:   	fmovs	%f14, %f16
	.word	0xae13400c	! t0_kref+0x22e4:   	or	%o5, %o4, %l7
	.word	0xaf2b2007	! t0_kref+0x22e8:   	sll	%o4, 0x7, %l7
	.word	0xd51e2010	! t0_kref+0x22ec:   	ldd	[%i0 + 0x10], %f10
	.word	0xebf6500c	! t0_kref+0x22f0:   	casxa	[%i1]0x80, %o4, %l5
	.word	0x27480008	! t0_kref+0x22f4:   	fbul,a,pt	%fcc0, _kref+0x2314
	.word	0xa1a4084e	! t0_kref+0x22f8:   	faddd	%f16, %f14, %f16
	.word	0x2c800003	! t0_kref+0x22fc:   	bneg,a	_kref+0x2308
	.word	0xae0b3554	! t0_kref+0x2300:   	and	%o4, -0xaac, %l7
	.word	0xd93e3ff8	! t0_kref+0x2304:   	std	%f12, [%i0 - 8]
	.word	0xec7e7ff4	! t0_kref+0x2308:   	swap	[%i1 - 0xc], %l6
	.word	0x9ba018ca	! t0_kref+0x230c:   	fdtos	%f10, %f13
	.word	0x81830000	! t0_kref+0x2310:   	wr	%o4, %g0, %y
	.word	0x2d480001	! t0_kref+0x2314:   	fbg,a,pt	%fcc0, _kref+0x2318
	.word	0xab3b6006	! t0_kref+0x2318:   	sra	%o5, 0x6, %l5
	.word	0x39800003	! t0_kref+0x231c:   	fbuge,a	_kref+0x2328
	.word	0xe500a02c	! t0_kref+0x2320:   	ld	[%g2 + 0x2c], %f18
	.word	0xa7400000	! t0_kref+0x2324:   	mov	%y, %l3
	.word	0xa9400000	! t0_kref+0x2328:   	mov	%y, %l4
	.word	0xa2f32d92	! t0_kref+0x232c:   	udivcc	%o4, 0xd92, %l1
	.word	0x81aa8a2f	! t0_kref+0x2330:   	fcmps	%fcc0, %f10, %f15
	.word	0x81dfc001	! t0_kref+0x2334:   	flush	%i7 + %g1
	.word	0x94db3900	! t0_kref+0x2338:   	smulcc	%o4, -0x700, %o2
	.word	0xec1e2008	! t0_kref+0x233c:   	ldd	[%i0 + 8], %l6
	.word	0x9ba01a4a	! t0_kref+0x2340:   	fdtoi	%f10, %f13
	.word	0xe11e6000	! t0_kref+0x2344:   	ldd	[%i1], %f16
	.word	0x972b200d	! t0_kref+0x2348:   	sll	%o4, 0xd, %o3
	.word	0x81ac8ad2	! t0_kref+0x234c:   	fcmped	%fcc0, %f18, %f18
	.word	0xea78a02c	! t0_kref+0x2350:   	swap	[%g2 + 0x2c], %l5
	.word	0x3a800008	! t0_kref+0x2354:   	bcc,a	_kref+0x2374
	.word	0xa9400000	! t0_kref+0x2358:   	mov	%y, %l4
	.word	0x96b3400d	! t0_kref+0x235c:   	orncc	%o5, %o5, %o3
	.word	0xd91e3fe0	! t0_kref+0x2360:   	ldd	[%i0 - 0x20], %f12
	.word	0xe4180018	! t0_kref+0x2364:   	ldd	[%g0 + %i0], %l2
	.word	0x8143c000	! t0_kref+0x2368:   	stbar
	.word	0x927b000c	! t0_kref+0x236c:   	sdiv	%o4, %o4, %o1
	.word	0x2d800008	! t0_kref+0x2370:   	fbg,a	_kref+0x2390
	.word	0x96a3607a	! t0_kref+0x2374:   	subcc	%o5, 0x7a, %o3
	.word	0xd53e7fe0	! t0_kref+0x2378:   	std	%f10, [%i1 - 0x20]
	.word	0x9da2882c	! t0_kref+0x237c:   	fadds	%f10, %f12, %f14
	.word	0x97a00530	! t0_kref+0x2380:   	fsqrts	%f16, %f11
	.word	0xe60e4000	! t0_kref+0x2384:   	ldub	[%i1], %l3
	.word	0x9fc10000	! t0_kref+0x2388:   	call	%g4
	.word	0xd8263fe0	! t0_kref+0x238c:   	st	%o4, [%i0 - 0x20]
	.word	0xe01e6018	! t0_kref+0x2390:   	ldd	[%i1 + 0x18], %l0
	.word	0x920b000c	! t0_kref+0x2394:   	and	%o4, %o4, %o1
	.word	0xaea37e97	! t0_kref+0x2398:   	subcc	%o5, -0x169, %l7
	.word	0x27800002	! t0_kref+0x239c:   	fbul,a	_kref+0x23a4
	.word	0xa6c3400c	! t0_kref+0x23a0:   	addccc	%o5, %o4, %l3
	.word	0xd19f5a18	! t0_kref+0x23a4:   	ldda	[%i5 + %i0]0xd0, %f8
	.word	0x29480006	! t0_kref+0x23a8:   	fbl,a,pt	%fcc0, _kref+0x23c0
	.word	0x97a000aa	! t0_kref+0x23ac:   	fnegs	%f10, %f11
	.word	0xda264000	! t0_kref+0x23b0:   	st	%o5, [%i1]
	.word	0xae8b400d	! t0_kref+0x23b4:   	andcc	%o5, %o5, %l7
	.word	0xe1be1a5c	! t0_kref+0x23b8:   	stda	%f16, [%i0 + %i4]0xd2
	.word	0xa4033ccb	! t0_kref+0x23bc:   	add	%o4, -0x335, %l2
	.word	0xa29368da	! t0_kref+0x23c0:   	orcc	%o5, 0x8da, %l1
	.word	0xd0fe1000	! t0_kref+0x23c4:   	swapa	[%i0]0x80, %o0
	.word	0xc028001a	! t0_kref+0x23c8:   	clrb	[%g0 + %i2]
	.word	0xc16e7ff0	! t0_kref+0x23cc:   	prefetch	%i1 - 0x10, 0
	.word	0xa27b7de7	! t0_kref+0x23d0:   	sdiv	%o5, -0x219, %l1
	.word	0x99a40d30	! t0_kref+0x23d4:   	fsmuld	%f16, %f16, %f12
	.word	0xdd00a030	! t0_kref+0x23d8:   	ld	[%g2 + 0x30], %f14
	.word	0xd8264000	! t0_kref+0x23dc:   	st	%o4, [%i1]
	.word	0xd820a00c	! t0_kref+0x23e0:   	st	%o4, [%g2 + 0xc]
	.word	0x81ac8a4c	! t0_kref+0x23e4:   	fcmpd	%fcc0, %f18, %f12
	.word	0x928b400d	! t0_kref+0x23e8:   	andcc	%o5, %o5, %o1
	.word	0xa4732300	! t0_kref+0x23ec:   	udiv	%o4, 0x300, %l2
	.word	0xd4de501d	! t0_kref+0x23f0:   	ldxa	[%i1 + %i5]0x80, %o2
	.word	0xec080019	! t0_kref+0x23f4:   	ldub	[%g0 + %i1], %l6
	.word	0x97a00031	! t0_kref+0x23f8:   	fmovs	%f17, %f11
	.word	0xd8263fe8	! t0_kref+0x23fc:   	st	%o4, [%i0 - 0x18]
	.word	0xdd1fbd28	! t0_kref+0x2400:   	ldd	[%fp - 0x2d8], %f14
	.word	0x95a3c92f	! t0_kref+0x2404:   	fmuls	%f15, %f15, %f10
	.word	0xac53400d	! t0_kref+0x2408:   	umul	%o5, %o5, %l6
	.word	0x97a00533	! t0_kref+0x240c:   	fsqrts	%f19, %f11
	.word	0xa5b00c00	! t0_kref+0x2410:   	fzero	%f18
	.word	0x952b2003	! t0_kref+0x2414:   	sll	%o4, 0x3, %o2
	.word	0xadb300ac	! t0_kref+0x2418:   	edge16n	%o4, %o4, %l6
	.word	0xd5063fec	! t0_kref+0x241c:   	ld	[%i0 - 0x14], %f10
	.word	0x878020d0	! t0_kref+0x2420:   	mov	0xd0, %asi
	.word	0x878020d2	! t0_kref+0x2424:   	mov	0xd2, %asi
	.word	0x97a018ca	! t0_kref+0x2428:   	fdtos	%f10, %f11
	.word	0xd51fbf38	! t0_kref+0x242c:   	ldd	[%fp - 0xc8], %f10
	.word	0x81aacab1	! t0_kref+0x2430:   	fcmpes	%fcc0, %f11, %f17
	.word	0xa613000c	! t0_kref+0x2434:   	or	%o4, %o4, %l3
	.word	0x81accab0	! t0_kref+0x2438:   	fcmpes	%fcc0, %f19, %f16
	.word	0xe810a024	! t0_kref+0x243c:   	lduh	[%g2 + 0x24], %l4
	.word	0xa1a4c92a	! t0_kref+0x2440:   	fmuls	%f19, %f10, %f16
	.word	0xae33699a	! t0_kref+0x2444:   	orn	%o5, 0x99a, %l7
	.word	0xa22361d3	! t0_kref+0x2448:   	sub	%o5, 0x1d3, %l1
	.word	0x9da3894c	! t0_kref+0x244c:   	fmuld	%f14, %f12, %f14
	.word	0x9da9804e	! t0_kref+0x2450:   	fmovdg	%fcc0, %f14, %f14
	.word	0xe0be1000	! t0_kref+0x2454:   	stda	%l0, [%i0]0x80
	.word	0xa1a01893	! t0_kref+0x2458:   	fitos	%f19, %f16
	.word	0xe250a004	! t0_kref+0x245c:   	ldsh	[%g2 + 4], %l1
	.word	0xd93e6000	! t0_kref+0x2460:   	std	%f12, [%i1]
	.word	0xa5a018ca	! t0_kref+0x2464:   	fdtos	%f10, %f18
	.word	0x933b200c	! t0_kref+0x2468:   	sra	%o4, 0xc, %o1
	.word	0xe44e7fe5	! t0_kref+0x246c:   	ldsb	[%i1 - 0x1b], %l2
	.word	0x9fa40931	! t0_kref+0x2470:   	fmuls	%f16, %f17, %f15
	.word	0x27800003	! t0_kref+0x2474:   	fbul,a	_kref+0x2480
	.word	0xe500a00c	! t0_kref+0x2478:   	ld	[%g2 + 0xc], %f18
	.word	0xe6de101d	! t0_kref+0x247c:   	ldxa	[%i0 + %i5]0x80, %l3
	.word	0x9703400c	! t0_kref+0x2480:   	taddcc	%o5, %o4, %o3
	.word	0x9683400c	! t0_kref+0x2484:   	addcc	%o5, %o4, %o3
	.word	0x001fffff	! t0_kref+0x2488:   	illtrap	0x1fffff
	.word	0x99b30f73	! t0_kref+0x248c:   	fornot1s	%f12, %f19, %f12
	.word	0xa3b44af2	! t0_kref+0x2490:   	fpsub32s	%f17, %f18, %f17
	.word	0xda30a02a	! t0_kref+0x2494:   	sth	%o5, [%g2 + 0x2a]
	.word	0xa1a0054e	! t0_kref+0x2498:   	fsqrtd	%f14, %f16
	.word	0xa3a01a50	! t0_kref+0x249c:   	fdtoi	%f16, %f17
	.word	0xa91b400d	! t0_kref+0x24a0:   	tsubcctv	%o5, %o5, %l4
	.word	0x92fb000c	! t0_kref+0x24a4:   	sdivcc	%o4, %o4, %o1
	.word	0x9db009b1	! t0_kref+0x24a8:   	fexpand	%f17, %f14
	.word	0x9da0192d	! t0_kref+0x24ac:   	fstod	%f13, %f14
	.word	0x92b3400d	! t0_kref+0x24b0:   	orncc	%o5, %o5, %o1
	.word	0xe720a014	! t0_kref+0x24b4:   	st	%f19, [%g2 + 0x14]
	.word	0xee0e401a	! t0_kref+0x24b8:   	ldub	[%i1 + %i2], %l7
	.word	0xa32b2019	! t0_kref+0x24bc:   	sll	%o4, 0x19, %l1
	.word	0xae13000c	! t0_kref+0x24c0:   	or	%o4, %o4, %l7
	.word	0x33800006	! t0_kref+0x24c4:   	fbe,a	_kref+0x24dc
	.word	0xd048a008	! t0_kref+0x24c8:   	ldsb	[%g2 + 8], %o0
	.word	0xe40e6012	! t0_kref+0x24cc:   	ldub	[%i1 + 0x12], %l2
	.word	0xa7b4058e	! t0_kref+0x24d0:   	fcmpgt32	%f16, %f14, %l3
	.word	0xdd1f4019	! t0_kref+0x24d4:   	ldd	[%i5 + %i1], %f14
	.word	0x2a480003	! t0_kref+0x24d8:   	bcs,a,pt	%icc, _kref+0x24e4
	.word	0x94f3000c	! t0_kref+0x24dc:   	udivcc	%o4, %o4, %o2
	.word	0xa1b00c20	! t0_kref+0x24e0:   	fzeros	%f16
	.word	0xa3a018d2	! t0_kref+0x24e4:   	fdtos	%f18, %f17
	.word	0x9233000d	! t0_kref+0x24e8:   	orn	%o4, %o5, %o1
	.word	0x96f33bfc	! t0_kref+0x24ec:   	udivcc	%o4, -0x404, %o3
	.word	0xaf3b601a	! t0_kref+0x24f0:   	sra	%o5, 0x1a, %l7
	.word	0xee5e6008	! t0_kref+0x24f4:   	ldx	[%i1 + 8], %l7
	.word	0xeec6101c	! t0_kref+0x24f8:   	ldswa	[%i0 + %i4]0x80, %l7
	.word	0xa93b2007	! t0_kref+0x24fc:   	sra	%o4, 0x7, %l4
	.word	0xee0e4000	! t0_kref+0x2500:   	ldub	[%i1], %l7
	.word	0x92a3000c	! t0_kref+0x2504:   	subcc	%o4, %o4, %o1
	.word	0x9bb44f71	! t0_kref+0x2508:   	fornot1s	%f17, %f17, %f13
	.word	0x95b406ce	! t0_kref+0x250c:   	fmul8sux16	%f16, %f14, %f10
	.word	0x9fa4092e	! t0_kref+0x2510:   	fmuls	%f16, %f14, %f15
	.word	0xa4237b3f	! t0_kref+0x2514:   	sub	%o5, -0x4c1, %l2
	.word	0xeec65000	! t0_kref+0x2518:   	ldswa	[%i1]0x80, %l7
	.word	0x9fa0188e	! t0_kref+0x251c:   	fitos	%f14, %f15
	.word	0xa1a3884a	! t0_kref+0x2520:   	faddd	%f14, %f10, %f16
	.word	0xe500a014	! t0_kref+0x2524:   	ld	[%g2 + 0x14], %f18
	.word	0xc807bfe8	! t0_kref+0x2528:   	ld	[%fp - 0x18], %g4
	.word	0xe4c81018	! t0_kref+0x252c:   	ldsba	[%g0 + %i0]0x80, %l2
	.word	0x3f480008	! t0_kref+0x2530:   	fbo,a,pt	%fcc0, _kref+0x2550
	.word	0xe968a00d	! t0_kref+0x2534:   	prefetch	%g2 + 0xd, 20
	.word	0xaa1339e8	! t0_kref+0x2538:   	or	%o4, -0x618, %l5
	.word	0xaa936b16	! t0_kref+0x253c:   	orcc	%o5, 0xb16, %l5
	.word	0xe51fbf20	! t0_kref+0x2540:   	ldd	[%fp - 0xe0], %f18
	.word	0x99a018ce	! t0_kref+0x2544:   	fdtos	%f14, %f12
	.word	0xd6466004	! t0_kref+0x2548:   	ldsw	[%i1 + 4], %o3
	.word	0xa6fb6186	! t0_kref+0x254c:   	sdivcc	%o5, 0x186, %l3
	.word	0x952b000d	! t0_kref+0x2550:   	sll	%o4, %o5, %o2
	.word	0x2c800002	! t0_kref+0x2554:   	bneg,a	_kref+0x255c
	.word	0x99b28a0a	! t0_kref+0x2558:   	fpadd16	%f10, %f10, %f12
	.word	0xac1b400c	! t0_kref+0x255c:   	xor	%o5, %o4, %l6
	.word	0x9fb4cab2	! t0_kref+0x2560:   	fpsub16s	%f19, %f18, %f15
	.word	0xa22b000d	! t0_kref+0x2564:   	andn	%o4, %o5, %l1
	.word	0x2f800004	! t0_kref+0x2568:   	fbu,a	_kref+0x2578
	.word	0xd91e2010	! t0_kref+0x256c:   	ldd	[%i0 + 0x10], %f12
	.word	0xa433000d	! t0_kref+0x2570:   	orn	%o4, %o5, %l2
	.word	0x96636fff	! t0_kref+0x2574:   	subc	%o5, 0xfff, %o3
	.word	0xd678a030	! t0_kref+0x2578:   	swap	[%g2 + 0x30], %o3
	.word	0xa5a01932	! t0_kref+0x257c:   	fstod	%f18, %f18
	.word	0x90b3400c	! t0_kref+0x2580:   	orncc	%o5, %o4, %o0
	.word	0xe200a030	! t0_kref+0x2584:   	ld	[%g2 + 0x30], %l1
	.word	0x3b800006	! t0_kref+0x2588:   	fble,a	_kref+0x25a0
	.word	0xd91f4018	! t0_kref+0x258c:   	ldd	[%i5 + %i0], %f12
	.word	0x21800003	! t0_kref+0x2590:   	fbn,a	_kref+0x259c
	.word	0xe1be5a5b	! t0_kref+0x2594:   	stda	%f16, [%i1 + %i3]0xd2
	.word	0xa703400d	! t0_kref+0x2598:   	taddcc	%o5, %o5, %l3
	.word	0x3f800004	! t0_kref+0x259c:   	fbo,a	_kref+0x25ac
	.word	0xa88360a2	! t0_kref+0x25a0:   	addcc	%o5, 0xa2, %l4
	.word	0x001fffff	! t0_kref+0x25a4:   	illtrap	0x1fffff
	.word	0x9bb00fe0	! t0_kref+0x25a8:   	fones	%f13
	.word	0x3f480004	! t0_kref+0x25ac:   	fbo,a,pt	%fcc0, _kref+0x25bc
	.word	0x93b48490	! t0_kref+0x25b0:   	fcmple32	%f18, %f16, %o1
	.word	0xeefe501c	! t0_kref+0x25b4:   	swapa	[%i1 + %i4]0x80, %l7
	.word	0xa7a01a50	! t0_kref+0x25b8:   	fdtoi	%f16, %f19
	.word	0xe6d6105b	! t0_kref+0x25bc:   	ldsha	[%i0 + %i3]0x82, %l3
	.word	0xa5a000cc	! t0_kref+0x25c0:   	fnegd	%f12, %f18
	.word	0xd51e2008	! t0_kref+0x25c4:   	ldd	[%i0 + 8], %f10
	.word	0x2d480003	! t0_kref+0x25c8:   	fbg,a,pt	%fcc0, _kref+0x25d4
	.word	0x99b28910	! t0_kref+0x25cc:   	faligndata	%f10, %f16, %f12
	.word	0xe44e0000	! t0_kref+0x25d0:   	ldsb	[%i0], %l2
	.word	0xf9ee501c	! t0_kref+0x25d4:   	prefetcha	%i1 + %i4, 28
	.word	0x9de3bfa0	! t0_kref+0x25d8:   	save	%sp, -0x60, %sp
	.word	0xb208001b	! t0_kref+0x25dc:   	and	%g0, %i3, %i1
	.word	0xa5ef3f4a	! t0_kref+0x25e0:   	restore	%i4, -0xb6, %l2
	.word	0x90a3000d	! t0_kref+0x25e4:   	subcc	%o4, %o5, %o0
	.word	0x8143e040	! t0_kref+0x25e8:   	membar	0x40
	.word	0x9fa00532	! t0_kref+0x25ec:   	fsqrts	%f18, %f15
	.word	0x9fa3c832	! t0_kref+0x25f0:   	fadds	%f15, %f18, %f15
	.word	0x9da0052e	! t0_kref+0x25f4:   	fsqrts	%f14, %f14
	.word	0xe168a08a	! t0_kref+0x25f8:   	prefetch	%g2 + 0x8a, 16
	.word	0xe700a030	! t0_kref+0x25fc:   	ld	[%g2 + 0x30], %f19
	.word	0xd45e2010	! t0_kref+0x2600:   	ldx	[%i0 + 0x10], %o2
	.word	0xa5b48a10	! t0_kref+0x2604:   	fpadd16	%f18, %f16, %f18
	.word	0xa1b40e80	! t0_kref+0x2608:   	fsrc1	%f16, %f16
	.word	0x95a0188a	! t0_kref+0x260c:   	fitos	%f10, %f10
	.word	0xd00e3ff8	! t0_kref+0x2610:   	ldub	[%i0 - 8], %o0
	.word	0xec0e3ff7	! t0_kref+0x2614:   	ldub	[%i0 - 9], %l6
	.word	0x94b328f7	! t0_kref+0x2618:   	orncc	%o4, 0x8f7, %o2
	.word	0xaea33e96	! t0_kref+0x261c:   	subcc	%o4, -0x16a, %l7
	.word	0x96b37d4d	! t0_kref+0x2620:   	orncc	%o5, -0x2b3, %o3
	.word	0xa2f3000d	! t0_kref+0x2624:   	udivcc	%o4, %o5, %l1
	.word	0x99a0188b	! t0_kref+0x2628:   	fitos	%f11, %f12
	.word	0xac53764c	! t0_kref+0x262c:   	umul	%o5, -0x9b4, %l6
	.word	0xd51fbee0	! t0_kref+0x2630:   	ldd	[%fp - 0x120], %f10
	.word	0x9fb0076c	! t0_kref+0x2634:   	fpack16	%f12, %f15
	.word	0x97b40c6d	! t0_kref+0x2638:   	fnors	%f16, %f13, %f11
	.word	0xda26001c	! t0_kref+0x263c:   	st	%o5, [%i0 + %i4]
	.word	0xa5a4c92d	! t0_kref+0x2640:   	fmuls	%f19, %f13, %f18
	.word	0x99b40e10	! t0_kref+0x2644:   	fand	%f16, %f16, %f12
	.word	0xe1be188c	! t0_kref+0x2648:   	stda	%f16, [%i0 + %o4]0xc4
	.word	0xa3b300cc	! t0_kref+0x264c:   	edge16l	%o4, %o4, %l1
	.word	0x8143c000	! t0_kref+0x2650:   	stbar
	.word	0xabb300ed	! t0_kref+0x2654:   	edge16ln	%o4, %o5, %l5
	.word	0xd828a034	! t0_kref+0x2658:   	stb	%o4, [%g2 + 0x34]
	.word	0xae13000d	! t0_kref+0x265c:   	or	%o4, %o5, %l7
	.word	0x24800004	! t0_kref+0x2660:   	ble,a	_kref+0x2670
	.word	0x96b3400c	! t0_kref+0x2664:   	orncc	%o5, %o4, %o3
	.word	0xdba01018	! t0_kref+0x2668:   	sta	%f13, [%g0 + %i0]0x80
	.word	0xa40b33d9	! t0_kref+0x266c:   	and	%o4, -0xc27, %l2
	.word	0xd20e0000	! t0_kref+0x2670:   	ldub	[%i0], %o1
	.word	0xe168a003	! t0_kref+0x2674:   	prefetch	%g2 + 3, 16
	.word	0x9ba3092c	! t0_kref+0x2678:   	fmuls	%f12, %f12, %f13
	.word	0xa7a0188e	! t0_kref+0x267c:   	fitos	%f14, %f19
	.word	0xdab6501b	! t0_kref+0x2680:   	stha	%o5, [%i1 + %i3]0x80
	.word	0x99b40e80	! t0_kref+0x2684:   	fsrc1	%f16, %f12
	.word	0xc10828d8	! t0_kref+0x2688:   	ld	[%g0 + 0x8d8], %fsr
	.word	0xd1be188c	! t0_kref+0x268c:   	stda	%f8, [%i0 + %o4]0xc4
	.word	0x95b48a0a	! t0_kref+0x2690:   	fpadd16	%f18, %f10, %f10
	.word	0xa7a40830	! t0_kref+0x2694:   	fadds	%f16, %f16, %f19
	.word	0x95b00f0a	! t0_kref+0x2698:   	fsrc2	%f10, %f10
	.word	0x36480005	! t0_kref+0x269c:   	bge,a,pt	%icc, _kref+0x26b0
	.word	0x9fa28832	! t0_kref+0x26a0:   	fadds	%f10, %f18, %f15
	.word	0xe648a017	! t0_kref+0x26a4:   	ldsb	[%g2 + 0x17], %l3
	.word	0xd610a002	! t0_kref+0x26a8:   	lduh	[%g2 + 2], %o3
	.word	0xe608a039	! t0_kref+0x26ac:   	ldub	[%g2 + 0x39], %l3
	.word	0xa5b48eca	! t0_kref+0x26b0:   	fornot2	%f18, %f10, %f18
	.word	0x99b00cce	! t0_kref+0x26b4:   	fnot2	%f14, %f12
	.word	0x38800002	! t0_kref+0x26b8:   	bgu,a	_kref+0x26c0
	.word	0x93b3002d	! t0_kref+0x26bc:   	edge8n	%o4, %o5, %o1
	.word	0xab2b201c	! t0_kref+0x26c0:   	sll	%o4, 0x1c, %l5
	.word	0x37480008	! t0_kref+0x26c4:   	fbge,a,pt	%fcc0, _kref+0x26e4
	.word	0xaa63400d	! t0_kref+0x26c8:   	subc	%o5, %o5, %l5
	.word	0xd500a030	! t0_kref+0x26cc:   	ld	[%g2 + 0x30], %f10
	.word	0x23480001	! t0_kref+0x26d0:   	fbne,a,pt	%fcc0, _kref+0x26d4
	.word	0xd000a000	! t0_kref+0x26d4:   	ld	[%g2], %o0
	.word	0xe81e7fe0	! t0_kref+0x26d8:   	ldd	[%i1 - 0x20], %l4
	.word	0xdaae1000	! t0_kref+0x26dc:   	stba	%o5, [%i0]0x80
	.word	0xd610a01e	! t0_kref+0x26e0:   	lduh	[%g2 + 0x1e], %o3
	.word	0x2a480004	! t0_kref+0x26e4:   	bcs,a,pt	%icc, _kref+0x26f4
	.word	0xe87f0018	! t0_kref+0x26e8:   	swap	[%i4 + %i0], %l4
	.word	0x2f800002	! t0_kref+0x26ec:   	fbu,a	_kref+0x26f4
	.word	0xf16e6010	! t0_kref+0x26f0:   	prefetch	%i1 + 0x10, 24
	.word	0xae9b000c	! t0_kref+0x26f4:   	xorcc	%o4, %o4, %l7
	.word	0x23800007	! t0_kref+0x26f8:   	fbne,a	_kref+0x2714
	.word	0x99a488cc	! t0_kref+0x26fc:   	fsubd	%f18, %f12, %f12
	.word	0x81834000	! t0_kref+0x2700:   	wr	%o5, %g0, %y
	.word	0xc96e6008	! t0_kref+0x2704:   	prefetch	%i1 + 8, 4
	.word	0xa213000c	! t0_kref+0x2708:   	or	%o4, %o4, %l1
	.word	0xe520a018	! t0_kref+0x270c:   	st	%f18, [%g2 + 0x18]
	.word	0xa3b3016c	! t0_kref+0x2710:   	edge32ln	%o4, %o4, %l1
	.word	0x8143c000	! t0_kref+0x2714:   	stbar
	.word	0x3e800006	! t0_kref+0x2718:   	bvc,a	_kref+0x2730
	.word	0x972b000d	! t0_kref+0x271c:   	sll	%o4, %o5, %o3
	.word	0xffee101d	! t0_kref+0x2720:   	prefetcha	%i0 + %i5, 31
	.word	0x9da8004a	! t0_kref+0x2724:   	fmovdn	%fcc0, %f10, %f14
	.word	0x9523000c	! t0_kref+0x2728:   	mulscc	%o4, %o4, %o2
	.word	0xe6480018	! t0_kref+0x272c:   	ldsb	[%g0 + %i0], %l3
	.word	0xa7b3848a	! t0_kref+0x2730:   	fcmple32	%f14, %f10, %l3
	.word	0x9da40952	! t0_kref+0x2734:   	fmuld	%f16, %f18, %f14
	.word	0x97a000ae	! t0_kref+0x2738:   	fnegs	%f14, %f11
	.word	0xe01e001d	! t0_kref+0x273c:   	ldd	[%i0 + %i5], %l0
	.word	0xec08a008	! t0_kref+0x2740:   	ldub	[%g2 + 8], %l6
	.word	0xe1be180d	! t0_kref+0x2744:   	stda	%f16, [%i0 + %o5]0xc0
	.word	0xaf3b600b	! t0_kref+0x2748:   	sra	%o5, 0xb, %l7
	.word	0xadb3404c	! t0_kref+0x274c:   	edge8l	%o5, %o4, %l6
	.word	0x99a018d0	! t0_kref+0x2750:   	fdtos	%f16, %f12
	.word	0xa2b32aea	! t0_kref+0x2754:   	orncc	%o4, 0xaea, %l1
	.word	0xa85321cc	! t0_kref+0x2758:   	umul	%o4, 0x1cc, %l4
	.word	0xa6133731	! t0_kref+0x275c:   	or	%o4, -0x8cf, %l3
	.word	0x9ba01a4c	! t0_kref+0x2760:   	fdtoi	%f12, %f13
	.word	0x97b3410d	! t0_kref+0x2764:   	edge32	%o5, %o5, %o3
	.word	0x952b400c	! t0_kref+0x2768:   	sll	%o5, %o4, %o2
	.word	0xa5a01112	! t0_kref+0x276c:   	fxtod	%f18, %f18
	.word	0xaaf3400d	! t0_kref+0x2770:   	udivcc	%o5, %o5, %l5
	.word	0x933b6010	! t0_kref+0x2774:   	sra	%o5, 0x10, %o1
	.word	0x9fc10000	! t0_kref+0x2778:   	call	%g4
	.word	0xfbee101a	! t0_kref+0x277c:   	prefetcha	%i0 + %i2, 29
	.word	0x86102004	! t0_kref+0x2780:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x2784:   	bne,a	_kref+0x2784
	.word	0x86a0e001	! t0_kref+0x2788:   	subcc	%g3, 1, %g3
	.word	0x92fb400d	! t0_kref+0x278c:   	sdivcc	%o5, %o5, %o1
	.word	0x27800008	! t0_kref+0x2790:   	fbul,a	_kref+0x27b0
	.word	0x99a408d0	! t0_kref+0x2794:   	fsubd	%f16, %f16, %f12
	.word	0x912b000c	! t0_kref+0x2798:   	sll	%o4, %o4, %o0
	.word	0x9ba00532	! t0_kref+0x279c:   	fsqrts	%f18, %f13
	.word	0x97b30200	! t0_kref+0x27a0:   	array8	%o4, %g0, %o3
	.word	0x95b34d30	! t0_kref+0x27a4:   	fandnot1s	%f13, %f16, %f10
	.word	0xa1a0054c	! t0_kref+0x27a8:   	fsqrtd	%f12, %f16
	.word	0xae33000c	! t0_kref+0x27ac:   	orn	%o4, %o4, %l7
	.word	0xa5a0054e	! t0_kref+0x27b0:   	fsqrtd	%f14, %f18
	.word	0x99b30a0c	! t0_kref+0x27b4:   	fpadd16	%f12, %f12, %f12
	.word	0xc76e000d	! t0_kref+0x27b8:   	prefetch	%i0 + %o5, 3
	.word	0x3b800007	! t0_kref+0x27bc:   	fble,a	_kref+0x27d8
	.word	0xa7a4882c	! t0_kref+0x27c0:   	fadds	%f18, %f12, %f19
	.word	0x99a0002b	! t0_kref+0x27c4:   	fmovs	%f11, %f12
	.word	0x94fb000d	! t0_kref+0x27c8:   	sdivcc	%o4, %o5, %o2
	.word	0xd86e7fe4	! t0_kref+0x27cc:   	ldstub	[%i1 - 0x1c], %o4
	.word	0xa20366f2	! t0_kref+0x27d0:   	add	%o5, 0x6f2, %l1
	.word	0xe51fbc28	! t0_kref+0x27d4:   	ldd	[%fp - 0x3d8], %f18
	.word	0xe46e3fee	! t0_kref+0x27d8:   	ldstub	[%i0 - 0x12], %l2
	.word	0xa7418000	! t0_kref+0x27dc:   	mov	%fprs, %l3
	.word	0xa9b4044e	! t0_kref+0x27e0:   	fcmpne16	%f16, %f14, %l4
	.word	0xda36401b	! t0_kref+0x27e4:   	sth	%o5, [%i1 + %i3]
	.word	0x972b000c	! t0_kref+0x27e8:   	sll	%o4, %o4, %o3
	.word	0x940b000d	! t0_kref+0x27ec:   	and	%o4, %o5, %o2
	.word	0xa5b48f8a	! t0_kref+0x27f0:   	for	%f18, %f10, %f18
	.word	0xa544c000	! t0_kref+0x27f4:   	mov	%gsr, %l2
	.word	0xa5a0054c	! t0_kref+0x27f8:   	fsqrtd	%f12, %f18
	.word	0xe03f4019	! t0_kref+0x27fc:   	std	%l0, [%i5 + %i1]
	.word	0xd826001c	! t0_kref+0x2800:   	st	%o4, [%i0 + %i4]
	.word	0xa6332995	! t0_kref+0x2804:   	orn	%o4, 0x995, %l3
	.word	0xfbee501d	! t0_kref+0x2808:   	prefetcha	%i1 + %i5, 29
	.word	0xa1a0192f	! t0_kref+0x280c:   	fstod	%f15, %f16
	.word	0xa5a408d0	! t0_kref+0x2810:   	fsubd	%f16, %f16, %f18
	.word	0x99a00150	! t0_kref+0x2814:   	fabsd	%f16, %f12
	.word	0xaf3b000c	! t0_kref+0x2818:   	sra	%o4, %o4, %l7
	.word	0x99a00552	! t0_kref+0x281c:   	fsqrtd	%f18, %f12
	.word	0xa69b7143	! t0_kref+0x2820:   	xorcc	%o5, -0xebd, %l3
	.word	0x33800005	! t0_kref+0x2824:   	fbe,a	_kref+0x2838
	.word	0xd830a03a	! t0_kref+0x2828:   	sth	%o4, [%g2 + 0x3a]
	.word	0x2d480001	! t0_kref+0x282c:   	fbg,a,pt	%fcc0, _kref+0x2830
	.word	0x9fa018d0	! t0_kref+0x2830:   	fdtos	%f16, %f15
	.word	0xe640a014	! t0_kref+0x2834:   	ldsw	[%g2 + 0x14], %l3
	.word	0x8d837361	! t0_kref+0x2838:   	wr	%o5, 0xfffff361, %fprs
	.word	0xec1e401d	! t0_kref+0x283c:   	ldd	[%i1 + %i5], %l6
	.word	0xc108001c	! t0_kref+0x2840:   	ld	[%g0 + %i4], %fsr
	.word	0xaf702215	! t0_kref+0x2844:   	popc	0x215, %l7
	.word	0xe400a02c	! t0_kref+0x2848:   	ld	[%g2 + 0x2c], %l2
	.word	0xda20a010	! t0_kref+0x284c:   	st	%o5, [%g2 + 0x10]
	.word	0xa30b400d	! t0_kref+0x2850:   	tsubcc	%o5, %o5, %l1
	.word	0xd44e7fff	! t0_kref+0x2854:   	ldsb	[%i1 - 1], %o2
	.word	0xe700a004	! t0_kref+0x2858:   	ld	[%g2 + 4], %f19
	.word	0xf3270000	! t0_kref+0x285c:   	st	%f25, [%i4]
	.word	0xa3a018d0	! t0_kref+0x2860:   	fdtos	%f16, %f17
	.word	0xd648a010	! t0_kref+0x2864:   	ldsb	[%g2 + 0x10], %o3
	.word	0x30480001	! t0_kref+0x2868:   	ba,a,pt	%icc, _kref+0x286c
	.word	0x90136b50	! t0_kref+0x286c:   	or	%o5, 0xb50, %o0
	.word	0xf207bfe0	! t0_kref+0x2870:   	ld	[%fp - 0x20], %i1
	.word	0xa5a0054a	! t0_kref+0x2874:   	fsqrtd	%f10, %f18
	.word	0xa73b6004	! t0_kref+0x2878:   	sra	%o5, 0x4, %l3
	.word	0xa5a000aa	! t0_kref+0x287c:   	fnegs	%f10, %f18
	.word	0xe11fbdb8	! t0_kref+0x2880:   	ldd	[%fp - 0x248], %f16
	.word	0x9db38ad2	! t0_kref+0x2884:   	fpsub32	%f14, %f18, %f14
	.word	0xa6132068	! t0_kref+0x2888:   	or	%o4, 0x68, %l3
	.word	0xe96e6008	! t0_kref+0x288c:   	prefetch	%i1 + 8, 20
	.word	0xe24e8018	! t0_kref+0x2890:   	ldsb	[%i2 + %i0], %l1
	.word	0xd8f6501d	! t0_kref+0x2894:   	stxa	%o4, [%i1 + %i5]0x80
	.word	0xd000a02c	! t0_kref+0x2898:   	ld	[%g2 + 0x2c], %o0
	.word	0xea50a00a	! t0_kref+0x289c:   	ldsh	[%g2 + 0xa], %l5
	.word	0xae0b000c	! t0_kref+0x28a0:   	and	%o4, %o4, %l7
	.word	0x95a0014c	! t0_kref+0x28a4:   	fabsd	%f12, %f10
	.word	0x95b48a4c	! t0_kref+0x28a8:   	fpadd32	%f18, %f12, %f10
	.word	0x9da0054e	! t0_kref+0x28ac:   	fsqrtd	%f14, %f14
	.word	0x9da0054a	! t0_kref+0x28b0:   	fsqrtd	%f10, %f14
	.word	0x95a01090	! t0_kref+0x28b4:   	fxtos	%f16, %f10
	.word	0xe01f4019	! t0_kref+0x28b8:   	ldd	[%i5 + %i1], %l0
	.word	0xa3a3082e	! t0_kref+0x28bc:   	fadds	%f12, %f14, %f17
	.word	0x878020f0	! t0_kref+0x28c0:   	mov	0xf0, %asi
	.word	0x99b009b2	! t0_kref+0x28c4:   	fexpand	%f18, %f12
	.word	0x9ba4c933	! t0_kref+0x28c8:   	fmuls	%f19, %f19, %f13
	.word	0x9db28f4e	! t0_kref+0x28cc:   	fornot1	%f10, %f14, %f14
	.word	0xdf20a00c	! t0_kref+0x28d0:   	st	%f15, [%g2 + 0xc]
	.word	0x99a0188e	! t0_kref+0x28d4:   	fitos	%f14, %f12
	.word	0xd07e7fe0	! t0_kref+0x28d8:   	swap	[%i1 - 0x20], %o0
	.word	0x99b486d2	! t0_kref+0x28dc:   	fmul8sux16	%f18, %f18, %f12
	.word	0x95400000	! t0_kref+0x28e0:   	mov	%y, %o2
	.word	0xaa633202	! t0_kref+0x28e4:   	subc	%o4, -0xdfe, %l5
	.word	0x90fb400d	! t0_kref+0x28e8:   	sdivcc	%o5, %o5, %o0
	.word	0x99b28a12	! t0_kref+0x28ec:   	fpadd16	%f10, %f18, %f12
	.word	0xee163ff6	! t0_kref+0x28f0:   	lduh	[%i0 - 0xa], %l7
	.word	0x33480001	! t0_kref+0x28f4:   	fbe,a,pt	%fcc0, _kref+0x28f8
	.word	0x9fa01a2f	! t0_kref+0x28f8:   	fstoi	%f15, %f15
	.word	0x93b340cc	! t0_kref+0x28fc:   	edge16l	%o5, %o4, %o1
	.word	0xe41e3fe8	! t0_kref+0x2900:   	ldd	[%i0 - 0x18], %l2
	.word	0xad44c000	! t0_kref+0x2904:   	mov	%gsr, %l6
	.word	0xaa9b400d	! t0_kref+0x2908:   	xorcc	%o5, %o5, %l5
	.word	0x9da0054e	! t0_kref+0x290c:   	fsqrtd	%f14, %f14
	.word	0x9fc10000	! t0_kref+0x2910:   	call	%g4
	.word	0xa7a01a4c	! t0_kref+0x2914:   	fdtoi	%f12, %f19
	.word	0xa5a018d2	! t0_kref+0x2918:   	fdtos	%f18, %f18
	.word	0xe24e600a	! t0_kref+0x291c:   	ldsb	[%i1 + 0xa], %l1
	.word	0xa8fb400d	! t0_kref+0x2920:   	sdivcc	%o5, %o5, %l4
	.word	0x3f800007	! t0_kref+0x2924:   	fbo,a	_kref+0x2940
	.word	0xa29b3fc1	! t0_kref+0x2928:   	xorcc	%o4, -0x3f, %l1
	.word	0x99a4894a	! t0_kref+0x292c:   	fmuld	%f18, %f10, %f12
	.word	0xc1ee100d	! t0_kref+0x2930:   	prefetcha	%i0 + %o5, 0
	.word	0xed68a08f	! t0_kref+0x2934:   	prefetch	%g2 + 0x8f, 22
	.word	0xe03e7fe0	! t0_kref+0x2938:   	std	%l0, [%i1 - 0x20]
	.word	0xa80b400c	! t0_kref+0x293c:   	and	%o5, %o4, %l4
	.word	0x2e800005	! t0_kref+0x2940:   	bvs,a	_kref+0x2954
	.word	0xa3a000b2	! t0_kref+0x2944:   	fnegs	%f18, %f17
	.word	0x99a308b2	! t0_kref+0x2948:   	fsubs	%f12, %f18, %f12
	.word	0xa6b32889	! t0_kref+0x294c:   	orncc	%o4, 0x889, %l3
	.word	0x27800007	! t0_kref+0x2950:   	fbul,a	_kref+0x296c
	.word	0x95b4072a	! t0_kref+0x2954:   	fmuld8ulx16	%f16, %f10, %f10
	.word	0xe47e4000	! t0_kref+0x2958:   	swap	[%i1], %l2
	.word	0xebee101d	! t0_kref+0x295c:   	prefetcha	%i0 + %i5, 21
	.word	0xe1e6500c	! t0_kref+0x2960:   	casa	[%i1]0x80, %o4, %l0
	.word	0xea50a02a	! t0_kref+0x2964:   	ldsh	[%g2 + 0x2a], %l5
	.word	0x9da4882e	! t0_kref+0x2968:   	fadds	%f18, %f14, %f14
	.word	0x95a2884a	! t0_kref+0x296c:   	faddd	%f10, %f10, %f10
	.word	0xa5b3090c	! t0_kref+0x2970:   	faligndata	%f12, %f12, %f18
	.word	0x9fc00004	! t0_kref+0x2974:   	call	%g0 + %g4
	.word	0xa33b6002	! t0_kref+0x2978:   	sra	%o5, 0x2, %l1
	.word	0xa5b0076e	! t0_kref+0x297c:   	fpack16	%f14, %f18
	.word	0xd4070018	! t0_kref+0x2980:   	ld	[%i4 + %i0], %o2
	.word	0x97400000	! t0_kref+0x2984:   	mov	%y, %o3
	.word	0xd250a006	! t0_kref+0x2988:   	ldsh	[%g2 + 6], %o1
	.word	0xa883646f	! t0_kref+0x298c:   	addcc	%o5, 0x46f, %l4
	.word	0xe41e3fe8	! t0_kref+0x2990:   	ldd	[%i0 - 0x18], %l2
	.word	0xd51e3fe8	! t0_kref+0x2994:   	ldd	[%i0 - 0x18], %f10
	.word	0x9de3bfa0	! t0_kref+0x2998:   	save	%sp, -0x60, %sp
	.word	0x97eec000	! t0_kref+0x299c:   	restore	%i3, %g0, %o3
	.word	0xa4f3400d	! t0_kref+0x29a0:   	udivcc	%o5, %o5, %l2
	.word	0xc398a080	! t0_kref+0x29a4:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0x932b400c	! t0_kref+0x29a8:   	sll	%o5, %o4, %o1
	.word	0x9013400c	! t0_kref+0x29ac:   	or	%o5, %o4, %o0
	.word	0x9de3bfa0	! t0_kref+0x29b0:   	save	%sp, -0x60, %sp
	.word	0x97ef401b	! t0_kref+0x29b4:   	restore	%i5, %i3, %o3
	.word	0xdd1fbd18	! t0_kref+0x29b8:   	ldd	[%fp - 0x2e8], %f14
	.word	0x9da00552	! t0_kref+0x29bc:   	fsqrtd	%f18, %f14
	.word	0xa4fb6012	! t0_kref+0x29c0:   	sdivcc	%o5, 0x12, %l2
	.word	0x27800003	! t0_kref+0x29c4:   	fbul,a	_kref+0x29d0
	.word	0xa5b3408c	! t0_kref+0x29c8:   	edge16	%o5, %o4, %l2
	.word	0x3f480003	! t0_kref+0x29cc:   	fbo,a,pt	%fcc0, _kref+0x29d8
	.word	0xeec01018	! t0_kref+0x29d0:   	ldswa	[%g0 + %i0]0x80, %l7
	.word	0xd91fbcc0	! t0_kref+0x29d4:   	ldd	[%fp - 0x340], %f12
	.word	0x90fb400d	! t0_kref+0x29d8:   	sdivcc	%o5, %o5, %o0
	.word	0x3b800006	! t0_kref+0x29dc:   	fble,a	_kref+0x29f4
	.word	0xd8264000	! t0_kref+0x29e0:   	st	%o4, [%i1]
	.word	0xe03e001d	! t0_kref+0x29e4:   	std	%l0, [%i0 + %i5]
	.word	0x95a01a2f	! t0_kref+0x29e8:   	fstoi	%f15, %f10
	.word	0xa1b28ea0	! t0_kref+0x29ec:   	fsrc1s	%f10, %f16
	.word	0xa4c32d50	! t0_kref+0x29f0:   	addccc	%o4, 0xd50, %l2
	.word	0xd8200018	! t0_kref+0x29f4:   	st	%o4, [%g0 + %i0]
	.word	0x9da34d2f	! t0_kref+0x29f8:   	fsmuld	%f13, %f15, %f14
	.word	0x99a00550	! t0_kref+0x29fc:   	fsqrtd	%f16, %f12
	.word	0xe3b8a040	! t0_kref+0x2a00:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xa52b000c	! t0_kref+0x2a04:   	sll	%o4, %o4, %l2
	.word	0xa3b30280	! t0_kref+0x2a08:   	array32	%o4, %g0, %l1
	.word	0xa223000c	! t0_kref+0x2a0c:   	sub	%o4, %o4, %l1
	.word	0xdd1e3ff8	! t0_kref+0x2a10:   	ldd	[%i0 - 8], %f14
	.word	0xa803000c	! t0_kref+0x2a14:   	add	%o4, %o4, %l4
	.word	0xec166012	! t0_kref+0x2a18:   	lduh	[%i1 + 0x12], %l6
	.word	0x33800001	! t0_kref+0x2a1c:   	fbe,a	_kref+0x2a20
	.word	0x97b38aea	! t0_kref+0x2a20:   	fpsub32s	%f14, %f10, %f11
	.word	0xee48a010	! t0_kref+0x2a24:   	ldsb	[%g2 + 0x10], %l7
	.word	0xda262008	! t0_kref+0x2a28:   	st	%o5, [%i0 + 8]
	.word	0x35480003	! t0_kref+0x2a2c:   	fbue,a,pt	%fcc0, _kref+0x2a38
	.word	0xdf00a038	! t0_kref+0x2a30:   	ld	[%g2 + 0x38], %f15
	.word	0x21480004	! t0_kref+0x2a34:   	fbn,a,pt	%fcc0, _kref+0x2a44
	.word	0x948b400d	! t0_kref+0x2a38:   	andcc	%o5, %o5, %o2
	.word	0xe81e7ff0	! t0_kref+0x2a3c:   	ldd	[%i1 - 0x10], %l4
	.word	0xd6067fec	! t0_kref+0x2a40:   	ld	[%i1 - 0x14], %o3
	.word	0xda2e6000	! t0_kref+0x2a44:   	stb	%o5, [%i1]
	.word	0x2b480005	! t0_kref+0x2a48:   	fbug,a,pt	%fcc0, _kref+0x2a5c
	.word	0x9da0054c	! t0_kref+0x2a4c:   	fsqrtd	%f12, %f14
	.word	0xa1a3082d	! t0_kref+0x2a50:   	fadds	%f12, %f13, %f16
	.word	0x9da48d2f	! t0_kref+0x2a54:   	fsmuld	%f18, %f15, %f14
	.word	0xa1a2894a	! t0_kref+0x2a58:   	fmuld	%f10, %f10, %f16
	.word	0x81dac014	! t0_kref+0x2a5c:   	flush	%o3 + %l4
	.word	0xdd000019	! t0_kref+0x2a60:   	ld	[%g0 + %i1], %f14
	.word	0x87802080	! t0_kref+0x2a64:   	mov	0x80, %asi
	.word	0xe03e4000	! t0_kref+0x2a68:   	std	%l0, [%i1]
	.word	0xf76e6010	! t0_kref+0x2a6c:   	prefetch	%i1 + 0x10, 27
	.word	0x99a00552	! t0_kref+0x2a70:   	fsqrtd	%f18, %f12
	.word	0xdaa0a020	! t0_kref+0x2a74:   	sta	%o5, [%g2 + 0x20]%asi
	.word	0x94c333b1	! t0_kref+0x2a78:   	addccc	%o4, -0xc4f, %o2
	.word	0x99a0054a	! t0_kref+0x2a7c:   	fsqrtd	%f10, %f12
	.word	0x9613400c	! t0_kref+0x2a80:   	or	%o5, %o4, %o3
	.word	0xa5a0054c	! t0_kref+0x2a84:   	fsqrtd	%f12, %f18
	.word	0xdd3e2010	! t0_kref+0x2a88:   	std	%f14, [%i0 + 0x10]
	.word	0xec1f4018	! t0_kref+0x2a8c:   	ldd	[%i5 + %i0], %l6
	.word	0xa5a00550	! t0_kref+0x2a90:   	fsqrtd	%f16, %f18
	.word	0xd8367ffa	! t0_kref+0x2a94:   	sth	%o4, [%i1 - 6]
	.word	0xa81362bf	! t0_kref+0x2a98:   	or	%o5, 0x2bf, %l4
	.word	0xa1a01912	! t0_kref+0x2a9c:   	fitod	%f18, %f16
	.word	0xe1be188d	! t0_kref+0x2aa0:   	stda	%f16, [%i0 + %o5]0xc4
	.word	0xd00e601a	! t0_kref+0x2aa4:   	ldub	[%i1 + 0x1a], %o0
	.word	0xe11e6000	! t0_kref+0x2aa8:   	ldd	[%i1], %f16
	.word	0xa1b00fc0	! t0_kref+0x2aac:   	fone	%f16
	.word	0x8143c000	! t0_kref+0x2ab0:   	stbar
	.word	0xe1180019	! t0_kref+0x2ab4:   	ldd	[%g0 + %i1], %f16
	.word	0x8d832857	! t0_kref+0x2ab8:   	wr	%o4, 0x857, %fprs
	.word	0x90f3400c	! t0_kref+0x2abc:   	udivcc	%o5, %o4, %o0
	.word	0xe2c8a012	! t0_kref+0x2ac0:   	ldsba	[%g2 + 0x12]%asi, %l1
	.word	0xa5b38d60	! t0_kref+0x2ac4:   	fnot1s	%f14, %f18
	.word	0x99a000ca	! t0_kref+0x2ac8:   	fnegd	%f10, %f12
	.word	0x94137695	! t0_kref+0x2acc:   	or	%o5, -0x96b, %o2
	.word	0xd91fbcb8	! t0_kref+0x2ad0:   	ldd	[%fp - 0x348], %f12
	.word	0xe84e4000	! t0_kref+0x2ad4:   	ldsb	[%i1], %l4
	.word	0xa7a88030	! t0_kref+0x2ad8:   	fmovslg	%fcc0, %f16, %f19
	.word	0x9ba01a4a	! t0_kref+0x2adc:   	fdtoi	%f10, %f13
	.word	0x8143c000	! t0_kref+0x2ae0:   	stbar
	.word	0xa6a3400c	! t0_kref+0x2ae4:   	subcc	%o5, %o4, %l3
	.word	0xa813400d	! t0_kref+0x2ae8:   	or	%o5, %o5, %l4
	.word	0x81dd3411	! t0_kref+0x2aec:   	flush	%l4 - 0xbef
	.word	0xecde3fe8	! t0_kref+0x2af0:   	ldxa	[%i0 - 0x18]%asi, %l6
	.word	0xc368a04d	! t0_kref+0x2af4:   	prefetch	%g2 + 0x4d, 1
	.word	0xa3a0052d	! t0_kref+0x2af8:   	fsqrts	%f13, %f17
	.word	0xa1b40d8e	! t0_kref+0x2afc:   	fxor	%f16, %f14, %f16
	call	1f
	.empty
	.word	0xe280a03c	! t0_kref+0x2b04:   	lda	[%g2 + 0x3c]%asi, %l1
1:	.word	0xaa13400d	! t0_kref+0x2b08:   	or	%o5, %o5, %l5
	.word	0xaab3000c	! t0_kref+0x2b0c:   	orncc	%o4, %o4, %l5
	.word	0xe250a02e	! t0_kref+0x2b10:   	ldsh	[%g2 + 0x2e], %l1
	.word	0xd64e200a	! t0_kref+0x2b14:   	ldsb	[%i0 + 0xa], %o3
	.word	0x81834000	! t0_kref+0x2b18:   	wr	%o5, %g0, %y
	.word	0x94c33b74	! t0_kref+0x2b1c:   	addccc	%o4, -0x48c, %o2
	.word	0xd008a026	! t0_kref+0x2b20:   	ldub	[%g2 + 0x26], %o0
	.word	0xa744c000	! t0_kref+0x2b24:   	mov	%gsr, %l3
	.word	0xad408000	! t0_kref+0x2b28:   	mov	%ccr, %l6
	.word	0xdd380019	! t0_kref+0x2b2c:   	std	%f14, [%g0 + %i1]
	.word	0x2e800003	! t0_kref+0x2b30:   	bvs,a	_kref+0x2b3c
	.word	0xefe8a049	! t0_kref+0x2b34:   	prefetcha	%g2 + 0x49, 23
	.word	0x9da3084c	! t0_kref+0x2b38:   	faddd	%f12, %f12, %f14
	.word	0xee4e8019	! t0_kref+0x2b3c:   	ldsb	[%i2 + %i1], %l7
	.word	0x9de3bfa0	! t0_kref+0x2b40:   	save	%sp, -0x60, %sp
	.word	0x95ef7978	! t0_kref+0x2b44:   	restore	%i5, -0x688, %o2
	.word	0x94d3000d	! t0_kref+0x2b48:   	umulcc	%o4, %o5, %o2
	.word	0x9ba0052c	! t0_kref+0x2b4c:   	fsqrts	%f12, %f13
	.word	0x9fa4c832	! t0_kref+0x2b50:   	fadds	%f19, %f18, %f15
	.word	0x95b40a12	! t0_kref+0x2b54:   	fpadd16	%f16, %f18, %f10
	.word	0xea4e4000	! t0_kref+0x2b58:   	ldsb	[%i1], %l5
	.word	0x95b40aee	! t0_kref+0x2b5c:   	fpsub32s	%f16, %f14, %f10
	.word	0xda270019	! t0_kref+0x2b60:   	st	%o5, [%i4 + %i1]
	.word	0xa3b3432d	! t0_kref+0x2b64:   	bmask	%o5, %o5, %l1
	.word	0x95b38c8e	! t0_kref+0x2b68:   	fandnot2	%f14, %f14, %f10
	.word	0xa68b000d	! t0_kref+0x2b6c:   	andcc	%o4, %o5, %l3
	.word	0xe3ee101b	! t0_kref+0x2b70:   	prefetcha	%i0 + %i3, 17
	.word	0xa4f3400c	! t0_kref+0x2b74:   	udivcc	%o5, %o4, %l2
	.word	0x9fa44833	! t0_kref+0x2b78:   	fadds	%f17, %f19, %f15
	.word	0xd8b0a004	! t0_kref+0x2b7c:   	stha	%o4, [%g2 + 4]%asi
	.word	0xd080a03c	! t0_kref+0x2b80:   	lda	[%g2 + 0x3c]%asi, %o0
	.word	0xea7e3ffc	! t0_kref+0x2b84:   	swap	[%i0 - 4], %l5
	.word	0x9dab4052	! t0_kref+0x2b88:   	fmovdle	%fcc0, %f18, %f14
	.word	0x23800005	! t0_kref+0x2b8c:   	fbne,a	_kref+0x2ba0
	.word	0xa2a3000c	! t0_kref+0x2b90:   	subcc	%o4, %o4, %l1
	.word	0xad2b000c	! t0_kref+0x2b94:   	sll	%o4, %o4, %l6
	.word	0xea0e6014	! t0_kref+0x2b98:   	ldub	[%i1 + 0x14], %l5
	.word	0x8143c000	! t0_kref+0x2b9c:   	stbar
	.word	0x99a00550	! t0_kref+0x2ba0:   	fsqrtd	%f16, %f12
	.word	0xa69b2e27	! t0_kref+0x2ba4:   	xorcc	%o4, 0xe27, %l3
	.word	0x99a0188d	! t0_kref+0x2ba8:   	fitos	%f13, %f12
	.word	0xa1a4c931	! t0_kref+0x2bac:   	fmuls	%f19, %f17, %f16
	.word	0x921b6e65	! t0_kref+0x2bb0:   	xor	%o5, 0xe65, %o1
	.word	0x9db3c973	! t0_kref+0x2bb4:   	fpmerge	%f15, %f19, %f14
	.word	0x3a800001	! t0_kref+0x2bb8:   	bcc,a	_kref+0x2bbc
	.word	0xa62b2c92	! t0_kref+0x2bbc:   	andn	%o4, 0xc92, %l3
	.word	0x26800004	! t0_kref+0x2bc0:   	bl,a	_kref+0x2bd0
	.word	0xa6032775	! t0_kref+0x2bc4:   	add	%o4, 0x775, %l3
	.word	0xac0b3c58	! t0_kref+0x2bc8:   	and	%o4, -0x3a8, %l6
	.word	0xd64e6001	! t0_kref+0x2bcc:   	ldsb	[%i1 + 1], %o3
	.word	0xa5b2c973	! t0_kref+0x2bd0:   	fpmerge	%f11, %f19, %f18
	.word	0xea0e7fe1	! t0_kref+0x2bd4:   	ldub	[%i1 - 0x1f], %l5
	.word	0xa463225e	! t0_kref+0x2bd8:   	subc	%o4, 0x25e, %l2
	.word	0xac63000d	! t0_kref+0x2bdc:   	subc	%o4, %o5, %l6
	.word	0xa5b48d0e	! t0_kref+0x2be0:   	fandnot1	%f18, %f14, %f18
	.word	0x35480007	! t0_kref+0x2be4:   	fbue,a,pt	%fcc0, _kref+0x2c00
	.word	0xd51fbc08	! t0_kref+0x2be8:   	ldd	[%fp - 0x3f8], %f10
	.word	0xd4100019	! t0_kref+0x2bec:   	lduh	[%g0 + %i1], %o2
	.word	0xaeb3000d	! t0_kref+0x2bf0:   	orncc	%o4, %o5, %l7
	.word	0xaefb400d	! t0_kref+0x2bf4:   	sdivcc	%o5, %o5, %l7
	.word	0x28800001	! t0_kref+0x2bf8:   	bleu,a	_kref+0x2bfc
	.word	0xa7b30200	! t0_kref+0x2bfc:   	array8	%o4, %g0, %l3
	.word	0xa453000c	! t0_kref+0x2c00:   	umul	%o4, %o4, %l2
	.word	0x9da0102c	! t0_kref+0x2c04:   	fstox	%f12, %f14
	.word	0xd9be188d	! t0_kref+0x2c08:   	stda	%f12, [%i0 + %o5]0xc4
	.word	0x9fc10000	! t0_kref+0x2c0c:   	call	%g4
	.word	0x9db38e0e	! t0_kref+0x2c10:   	fand	%f14, %f14, %f14
	.word	0x91b30590	! t0_kref+0x2c14:   	fcmpgt32	%f12, %f16, %o0
	.word	0x81aacaaf	! t0_kref+0x2c18:   	fcmpes	%fcc0, %f11, %f15
	.word	0xe416c018	! t0_kref+0x2c1c:   	lduh	[%i3 + %i0], %l2
	.word	0xe40e200e	! t0_kref+0x2c20:   	ldub	[%i0 + 0xe], %l2
	.word	0x9db28f8e	! t0_kref+0x2c24:   	for	%f10, %f14, %f14
	.word	0x27480007	! t0_kref+0x2c28:   	fbul,a,pt	%fcc0, _kref+0x2c44
	.word	0xac83400c	! t0_kref+0x2c2c:   	addcc	%o5, %o4, %l6
	.word	0x9bb28daa	! t0_kref+0x2c30:   	fxors	%f10, %f10, %f13
	.word	0xaee3686d	! t0_kref+0x2c34:   	subccc	%o5, 0x86d, %l7
	.word	0xd820a008	! t0_kref+0x2c38:   	st	%o4, [%g2 + 8]
	.word	0xd5f6500d	! t0_kref+0x2c3c:   	casxa	[%i1]0x80, %o5, %o2
	.word	0xd19e1a1a	! t0_kref+0x2c40:   	ldda	[%i0 + %i2]0xd0, %f8
	.word	0x94fb6c39	! t0_kref+0x2c44:   	sdivcc	%o5, 0xc39, %o2
	.word	0xda26200c	! t0_kref+0x2c48:   	st	%o5, [%i0 + 0xc]
	.word	0xe01e3fe8	! t0_kref+0x2c4c:   	ldd	[%i0 - 0x18], %l0
	.word	0x99b009ab	! t0_kref+0x2c50:   	fexpand	%f11, %f12
	.word	0xd46e7fea	! t0_kref+0x2c54:   	ldstub	[%i1 - 0x16], %o2
	.word	0xa1a00530	! t0_kref+0x2c58:   	fsqrts	%f16, %f16
	.word	0x909b3a8d	! t0_kref+0x2c5c:   	xorcc	%o4, -0x573, %o0
	.word	0xd8f66008	! t0_kref+0x2c60:   	stxa	%o4, [%i1 + 8]%asi
	.word	0xa5b00cce	! t0_kref+0x2c64:   	fnot2	%f14, %f18
	.word	0x86102003	! t0_kref+0x2c68:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x2c6c:   	bne,a	_kref+0x2c6c
	.word	0x86a0e001	! t0_kref+0x2c70:   	subcc	%g3, 1, %g3
	.word	0x23800004	! t0_kref+0x2c74:   	fbne,a	_kref+0x2c84
	.word	0xd448a018	! t0_kref+0x2c78:   	ldsb	[%g2 + 0x18], %o2
	.word	0xa5b00fe0	! t0_kref+0x2c7c:   	fones	%f18
	.word	0xa783000c	! t0_kref+0x2c80:   	wr	%o4, %o4, %gsr
	.word	0xfdee101a	! t0_kref+0x2c84:   	prefetcha	%i0 + %i2, 30
	.word	0x95a00052	! t0_kref+0x2c88:   	fmovd	%f18, %f10
	.word	0x95702816	! t0_kref+0x2c8c:   	popc	0x816, %o2
	.word	0x95a000ad	! t0_kref+0x2c90:   	fnegs	%f13, %f10
	.word	0xe300a024	! t0_kref+0x2c94:   	ld	[%g2 + 0x24], %f17
	.word	0x95a2894a	! t0_kref+0x2c98:   	fmuld	%f10, %f10, %f10
	.word	0xae63764b	! t0_kref+0x2c9c:   	subc	%o5, -0x9b5, %l7
	.word	0x9db48f72	! t0_kref+0x2ca0:   	fornot1s	%f18, %f18, %f14
	.word	0xe51fbe50	! t0_kref+0x2ca4:   	ldd	[%fp - 0x1b0], %f18
	.word	0xe968a00a	! t0_kref+0x2ca8:   	prefetch	%g2 + 0xa, 20
	.word	0x9ba4082c	! t0_kref+0x2cac:   	fadds	%f16, %f12, %f13
	.word	0xe41e6000	! t0_kref+0x2cb0:   	ldd	[%i1], %l2
	.word	0xa2533ed5	! t0_kref+0x2cb4:   	umul	%o4, -0x12b, %l1
	.word	0xea5e3fe0	! t0_kref+0x2cb8:   	ldx	[%i0 - 0x20], %l5
	.word	0xe01e4000	! t0_kref+0x2cbc:   	ldd	[%i1], %l0
	.word	0xa5b00cca	! t0_kref+0x2cc0:   	fnot2	%f10, %f18
	.word	0x99a00533	! t0_kref+0x2cc4:   	fsqrts	%f19, %f12
	.word	0x3b480001	! t0_kref+0x2cc8:   	fble,a,pt	%fcc0, _kref+0x2ccc
	.word	0xd60e200d	! t0_kref+0x2ccc:   	ldub	[%i0 + 0xd], %o3
	.word	0x9da01a4a	! t0_kref+0x2cd0:   	fdtoi	%f10, %f14
	.word	0x968b7d70	! t0_kref+0x2cd4:   	andcc	%o5, -0x290, %o3
	.word	0xacb32384	! t0_kref+0x2cd8:   	orncc	%o4, 0x384, %l6
	.word	0xd53f4018	! t0_kref+0x2cdc:   	std	%f10, [%i5 + %i0]
	.word	0xec50a022	! t0_kref+0x2ce0:   	ldsh	[%g2 + 0x22], %l6
	.word	0x9013703c	! t0_kref+0x2ce4:   	or	%o5, -0xfc4, %o0
	.word	0xa5a0054c	! t0_kref+0x2ce8:   	fsqrtd	%f12, %f18
	.word	0xe2d0a034	! t0_kref+0x2cec:   	ldsha	[%g2 + 0x34]%asi, %l1
	.word	0xda26200c	! t0_kref+0x2cf0:   	st	%o5, [%i0 + 0xc]
	.word	0x973b400d	! t0_kref+0x2cf4:   	sra	%o5, %o5, %o3
	.word	0x99a0188b	! t0_kref+0x2cf8:   	fitos	%f11, %f12
	.word	0xd4961000	! t0_kref+0x2cfc:   	lduha	[%i0]0x80, %o2
	.word	0xa2fb6c44	! t0_kref+0x2d00:   	sdivcc	%o5, 0xc44, %l1
	.word	0xc16e400c	! t0_kref+0x2d04:   	prefetch	%i1 + %o4, 0
	.word	0xa1b34fae	! t0_kref+0x2d08:   	fors	%f13, %f14, %f16
	.word	0xacc37e52	! t0_kref+0x2d0c:   	addccc	%o5, -0x1ae, %l6
	.word	0x99a0052b	! t0_kref+0x2d10:   	fsqrts	%f11, %f12
	.word	0xa69b400d	! t0_kref+0x2d14:   	xorcc	%o5, %o5, %l3
	.word	0xd82e4000	! t0_kref+0x2d18:   	stb	%o4, [%i1]
	.word	0xe86e201c	! t0_kref+0x2d1c:   	ldstub	[%i0 + 0x1c], %l4
	.word	0xe848a010	! t0_kref+0x2d20:   	ldsb	[%g2 + 0x10], %l4
	.word	0xda30a028	! t0_kref+0x2d24:   	sth	%o5, [%g2 + 0x28]
	.word	0xe03e001d	! t0_kref+0x2d28:   	std	%l0, [%i0 + %i5]
	.word	0xa6fb64d7	! t0_kref+0x2d2c:   	sdivcc	%o5, 0x4d7, %l3
	.word	0x2c480007	! t0_kref+0x2d30:   	bneg,a,pt	%icc, _kref+0x2d4c
	.word	0x95a4492a	! t0_kref+0x2d34:   	fmuls	%f17, %f10, %f10
	.word	0xa7a4092f	! t0_kref+0x2d38:   	fmuls	%f16, %f15, %f19
	.word	0x81b01023	! t0_kref+0x2d3c:   	siam	0x3
	.word	0xe19e1a1d	! t0_kref+0x2d40:   	ldda	[%i0 + %i5]0xd0, %f16
	.word	0x27480006	! t0_kref+0x2d44:   	fbul,a,pt	%fcc0, _kref+0x2d5c
	.word	0xff6e001a	! t0_kref+0x2d48:   	prefetch	%i0 + %i2, 31
	.word	0xa1a0002d	! t0_kref+0x2d4c:   	fmovs	%f13, %f16
	.word	0xe07e3fe0	! t0_kref+0x2d50:   	swap	[%i0 - 0x20], %l0
	.word	0x9fa0188d	! t0_kref+0x2d54:   	fitos	%f13, %f15
	.word	0xee40a038	! t0_kref+0x2d58:   	ldsw	[%g2 + 0x38], %l7
	.word	0xacb3400c	! t0_kref+0x2d5c:   	orncc	%o5, %o4, %l6
	.word	0xd53e3ff0	! t0_kref+0x2d60:   	std	%f10, [%i0 - 0x10]
	.word	0x99a40852	! t0_kref+0x2d64:   	faddd	%f16, %f18, %f12
	.word	0x92c3685d	! t0_kref+0x2d68:   	addccc	%o5, 0x85d, %o1
	.word	0x9da0054a	! t0_kref+0x2d6c:   	fsqrtd	%f10, %f14
	.word	0xee4e401a	! t0_kref+0x2d70:   	ldsb	[%i1 + %i2], %l7
	.word	0xacb361e7	! t0_kref+0x2d74:   	orncc	%o5, 0x1e7, %l6
	.word	0x91b3000c	! t0_kref+0x2d78:   	edge8	%o4, %o4, %o0
	.word	0x9ba4092f	! t0_kref+0x2d7c:   	fmuls	%f16, %f15, %f13
	.word	0x97a4482e	! t0_kref+0x2d80:   	fadds	%f17, %f14, %f11
	.word	0x969b3a69	! t0_kref+0x2d84:   	xorcc	%o4, -0x597, %o3
	.word	0x95400000	! t0_kref+0x2d88:   	mov	%y, %o2
	.word	0x953b6017	! t0_kref+0x2d8c:   	sra	%o5, 0x17, %o2
	.word	0xe03e7fe8	! t0_kref+0x2d90:   	std	%l0, [%i1 - 0x18]
	.word	0x95a01a50	! t0_kref+0x2d94:   	fdtoi	%f16, %f10
	.word	0xa5b38f8a	! t0_kref+0x2d98:   	for	%f14, %f10, %f18
	.word	0xee8e2008	! t0_kref+0x2d9c:   	lduba	[%i0 + 8]%asi, %l7
	.word	0x81abca30	! t0_kref+0x2da0:   	fcmps	%fcc0, %f15, %f16
	.word	0x95a0054a	! t0_kref+0x2da4:   	fsqrtd	%f10, %f10
	.word	0xaac32d9f	! t0_kref+0x2da8:   	addccc	%o4, 0xd9f, %l5
	.word	0xe60e7fe0	! t0_kref+0x2dac:   	ldub	[%i1 - 0x20], %l3
	.word	0xa49b400d	! t0_kref+0x2db0:   	xorcc	%o5, %o5, %l2
	.word	0xd8200019	! t0_kref+0x2db4:   	st	%o4, [%g0 + %i1]
	.word	0xaf2b400c	! t0_kref+0x2db8:   	sll	%o5, %o4, %l7
	.word	0x99a00550	! t0_kref+0x2dbc:   	fsqrtd	%f16, %f12
	.word	0xa5a38850	! t0_kref+0x2dc0:   	faddd	%f14, %f16, %f18
	.word	0xadb34200	! t0_kref+0x2dc4:   	array8	%o5, %g0, %l6
	.word	0x9da0052e	! t0_kref+0x2dc8:   	fsqrts	%f14, %f14
	.word	0xa69b2049	! t0_kref+0x2dcc:   	xorcc	%o4, 0x49, %l3
	.word	0x81dce683	! t0_kref+0x2dd0:   	flush	%l3 + 0x683
	.word	0xa40b000d	! t0_kref+0x2dd4:   	and	%o4, %o5, %l2
	.word	0x940b400d	! t0_kref+0x2dd8:   	and	%o5, %o5, %o2
	.word	0x34800006	! t0_kref+0x2ddc:   	bg,a	_kref+0x2df4
	.word	0xab33600a	! t0_kref+0x2de0:   	srl	%o5, 0xa, %l5
	.word	0xd088a00c	! t0_kref+0x2de4:   	lduba	[%g2 + 0xc]%asi, %o0
	.word	0x9333400d	! t0_kref+0x2de8:   	srl	%o5, %o5, %o1
	.word	0xea6e3fe6	! t0_kref+0x2dec:   	ldstub	[%i0 - 0x1a], %l5
	.word	0xd0680019	! t0_kref+0x2df0:   	ldstub	[%g0 + %i1], %o0
	.word	0xa3a00033	! t0_kref+0x2df4:   	fmovs	%f19, %f17
	.word	0xe8680019	! t0_kref+0x2df8:   	ldstub	[%g0 + %i1], %l4
	.word	0x95b3014d	! t0_kref+0x2dfc:   	edge32l	%o4, %o5, %o2
	.word	0x91b300cc	! t0_kref+0x2e00:   	edge16l	%o4, %o4, %o0
	.word	0xa5a00550	! t0_kref+0x2e04:   	fsqrtd	%f16, %f18
	.word	0xd19e9a18	! t0_kref+0x2e08:   	ldda	[%i2 + %i0]0xd0, %f8
	.word	0xe36e7ff0	! t0_kref+0x2e0c:   	prefetch	%i1 - 0x10, 17
	.word	0x9293000d	! t0_kref+0x2e10:   	orcc	%o4, %o5, %o1
	.word	0x81ac8a4e	! t0_kref+0x2e14:   	fcmpd	%fcc0, %f18, %f14
	.word	0xa3b34200	! t0_kref+0x2e18:   	array8	%o5, %g0, %l1
	.word	0x9de3bfa0	! t0_kref+0x2e1c:   	save	%sp, -0x60, %sp
	.word	0xb0d6b7b9	! t0_kref+0x2e20:   	umulcc	%i2, -0x847, %i0
	.word	0xa3ef4018	! t0_kref+0x2e24:   	restore	%i5, %i0, %l1
	.word	0x9da34d2d	! t0_kref+0x2e28:   	fsmuld	%f13, %f13, %f14
	.word	0x95b3400c	! t0_kref+0x2e2c:   	edge8	%o5, %o4, %o2
	.word	0xd4162018	! t0_kref+0x2e30:   	lduh	[%i0 + 0x18], %o2
	.word	0xe03e3fe0	! t0_kref+0x2e34:   	std	%l0, [%i0 - 0x20]
	.word	0x95a00550	! t0_kref+0x2e38:   	fsqrtd	%f16, %f10
	.word	0x37800008	! t0_kref+0x2e3c:   	fbge,a	_kref+0x2e5c
	.word	0x9da408ce	! t0_kref+0x2e40:   	fsubd	%f16, %f14, %f14
	.word	0x99a01a4a	! t0_kref+0x2e44:   	fdtoi	%f10, %f12
	.word	0x99b28712	! t0_kref+0x2e48:   	fmuld8sux16	%f10, %f18, %f12
	.word	0x37800002	! t0_kref+0x2e4c:   	fbge,a	_kref+0x2e54
	.word	0x93b3400d	! t0_kref+0x2e50:   	edge8	%o5, %o5, %o1
	.word	0xae7b400d	! t0_kref+0x2e54:   	sdiv	%o5, %o5, %l7
	.word	0xa3a00032	! t0_kref+0x2e58:   	fmovs	%f18, %f17
	.word	0x31800004	! t0_kref+0x2e5c:   	fba,a	_kref+0x2e6c
	.word	0xaa83400c	! t0_kref+0x2e60:   	addcc	%o5, %o4, %l5
	.word	0xa2633145	! t0_kref+0x2e64:   	subc	%o4, -0xebb, %l1
	.word	0xe81e401d	! t0_kref+0x2e68:   	ldd	[%i1 + %i5], %l4
	.word	0x96c3400d	! t0_kref+0x2e6c:   	addccc	%o5, %o5, %o3
	.word	0x97b28a6c	! t0_kref+0x2e70:   	fpadd32s	%f10, %f12, %f11
	.word	0xa1b38fab	! t0_kref+0x2e74:   	fors	%f14, %f11, %f16
	.word	0xe6866004	! t0_kref+0x2e78:   	lda	[%i1 + 4]%asi, %l3
	.word	0x36800004	! t0_kref+0x2e7c:   	bge,a	_kref+0x2e8c
	.word	0x81ddc00c	! t0_kref+0x2e80:   	flush	%l7 + %o4
	.word	0x81aa8ab0	! t0_kref+0x2e84:   	fcmpes	%fcc0, %f10, %f16
	.word	0x96032382	! t0_kref+0x2e88:   	add	%o4, 0x382, %o3
	.word	0x99a00552	! t0_kref+0x2e8c:   	fsqrtd	%f18, %f12
	.word	0xe696d019	! t0_kref+0x2e90:   	lduha	[%i3 + %i1]0x80, %l3
	.word	0xdf00a000	! t0_kref+0x2e94:   	ld	[%g2], %f15
	.word	0xd4c8a00f	! t0_kref+0x2e98:   	ldsba	[%g2 + 0xf]%asi, %o2
	.word	0xe11e4000	! t0_kref+0x2e9c:   	ldd	[%i1], %f16
	.word	0xd9be580c	! t0_kref+0x2ea0:   	stda	%f12, [%i1 + %o4]0xc0
	.word	0x99a389ce	! t0_kref+0x2ea4:   	fdivd	%f14, %f14, %f12
	.word	0x8143c000	! t0_kref+0x2ea8:   	stbar
	.word	0xa42330ef	! t0_kref+0x2eac:   	sub	%o4, -0xf11, %l2
	.word	0xae73400c	! t0_kref+0x2eb0:   	udiv	%o5, %o4, %l7
	.word	0x97a288b1	! t0_kref+0x2eb4:   	fsubs	%f10, %f17, %f11
	.word	0x36800007	! t0_kref+0x2eb8:   	bge,a	_kref+0x2ed4
	.word	0x81da3b7b	! t0_kref+0x2ebc:   	flush	%o0 - 0x485
	.word	0xa1a28d2b	! t0_kref+0x2ec0:   	fsmuld	%f10, %f11, %f16
	.word	0x9da4092d	! t0_kref+0x2ec4:   	fmuls	%f16, %f13, %f14
	.word	0xa3400000	! t0_kref+0x2ec8:   	mov	%y, %l1
	.word	0x95a3884c	! t0_kref+0x2ecc:   	faddd	%f14, %f12, %f10
	.word	0xa3b48a32	! t0_kref+0x2ed0:   	fpadd16s	%f18, %f18, %f17
	.word	0x8d8368dc	! t0_kref+0x2ed4:   	wr	%o5, 0x8dc, %fprs
	.word	0xd1be588d	! t0_kref+0x2ed8:   	stda	%f8, [%i1 + %o5]0xc4
	.word	0xa1a8c04c	! t0_kref+0x2edc:   	fmovdul	%fcc0, %f12, %f16
	.word	0x9663000d	! t0_kref+0x2ee0:   	subc	%o4, %o5, %o3
	.word	0xea167ff4	! t0_kref+0x2ee4:   	lduh	[%i1 - 0xc], %l5
	.word	0xdd1fbf38	! t0_kref+0x2ee8:   	ldd	[%fp - 0xc8], %f14
	.word	0x81aa8a30	! t0_kref+0x2eec:   	fcmps	%fcc0, %f10, %f16
	.word	0xdd1fbf10	! t0_kref+0x2ef0:   	ldd	[%fp - 0xf0], %f14
	.word	0xa3a018d0	! t0_kref+0x2ef4:   	fdtos	%f16, %f17
	.word	0xd4160000	! t0_kref+0x2ef8:   	lduh	[%i0], %o2
	.word	0xa5b40d0e	! t0_kref+0x2efc:   	fandnot1	%f16, %f14, %f18
	.word	0xec1e6008	! t0_kref+0x2f00:   	ldd	[%i1 + 8], %l6
	.word	0xd8b0a022	! t0_kref+0x2f04:   	stha	%o4, [%g2 + 0x22]%asi
	.word	0xe780a004	! t0_kref+0x2f08:   	lda	[%g2 + 4]%asi, %f19
	.word	0x95a0188e	! t0_kref+0x2f0c:   	fitos	%f14, %f10
	.word	0xa3a00533	! t0_kref+0x2f10:   	fsqrts	%f19, %f17
	.word	0x2e800007	! t0_kref+0x2f14:   	bvs,a	_kref+0x2f30
	.word	0xd8200019	! t0_kref+0x2f18:   	st	%o4, [%g0 + %i1]
	.word	0x92b3400c	! t0_kref+0x2f1c:   	orncc	%o5, %o4, %o1
	.word	0xa1a00530	! t0_kref+0x2f20:   	fsqrts	%f16, %f16
	.word	0x97b3414d	! t0_kref+0x2f24:   	edge32l	%o5, %o5, %o3
	.word	0xec7f0019	! t0_kref+0x2f28:   	swap	[%i4 + %i1], %l6
	.word	0xd91e001d	! t0_kref+0x2f2c:   	ldd	[%i0 + %i5], %f12
	.word	0x25480004	! t0_kref+0x2f30:   	fblg,a,pt	%fcc0, _kref+0x2f40
	.word	0x99a0054a	! t0_kref+0x2f34:   	fsqrtd	%f10, %f12
	.word	0x37800002	! t0_kref+0x2f38:   	fbge,a	_kref+0x2f40
	.word	0xdd1f4018	! t0_kref+0x2f3c:   	ldd	[%i5 + %i0], %f14
	.word	0xf9ee501b	! t0_kref+0x2f40:   	prefetcha	%i1 + %i3, 28
	.word	0xa1a40932	! t0_kref+0x2f44:   	fmuls	%f16, %f18, %f16
	.word	0xd2d0a016	! t0_kref+0x2f48:   	ldsha	[%g2 + 0x16]%asi, %o1
	.word	0xa1a01893	! t0_kref+0x2f4c:   	fitos	%f19, %f16
	.word	0xa1b2866b	! t0_kref+0x2f50:   	fmul8x16au	%f10, %f11, %f16
	.word	0xa9b3016c	! t0_kref+0x2f54:   	edge32ln	%o4, %o4, %l4
	.word	0x95a48d2f	! t0_kref+0x2f58:   	fsmuld	%f18, %f15, %f10
	.word	0xea0e7fe0	! t0_kref+0x2f5c:   	ldub	[%i1 - 0x20], %l5
	.word	0xd688a02f	! t0_kref+0x2f60:   	lduba	[%g2 + 0x2f]%asi, %o3
	.word	0xa1a0054a	! t0_kref+0x2f64:   	fsqrtd	%f10, %f16
	.word	0x95b40630	! t0_kref+0x2f68:   	fmul8x16	%f16, %f16, %f10
	.word	0xec1e4000	! t0_kref+0x2f6c:   	ldd	[%i1], %l6
	.word	0xa1a00552	! t0_kref+0x2f70:   	fsqrtd	%f18, %f16
	.word	0xe40e3ffd	! t0_kref+0x2f74:   	ldub	[%i0 - 3], %l2
	.word	0xe678001c	! t0_kref+0x2f78:   	swap	[%g0 + %i4], %l3
	.word	0xe0380019	! t0_kref+0x2f7c:   	std	%l0, [%g0 + %i1]
	.word	0xe2160000	! t0_kref+0x2f80:   	lduh	[%i0], %l1
	.word	0xaec37c5b	! t0_kref+0x2f84:   	addccc	%o5, -0x3a5, %l7
	.word	0xa4ab3ace	! t0_kref+0x2f88:   	andncc	%o4, -0x532, %l2
	.word	0x932b000c	! t0_kref+0x2f8c:   	sll	%o4, %o4, %o1
	.word	0xa5a28952	! t0_kref+0x2f90:   	fmuld	%f10, %f18, %f18
	.word	0x952b000c	! t0_kref+0x2f94:   	sll	%o4, %o4, %o2
	.word	0xe67e2008	! t0_kref+0x2f98:   	swap	[%i0 + 8], %l3
	.word	0x9fc10000	! t0_kref+0x2f9c:   	call	%g4
	.word	0xe27e3ffc	! t0_kref+0x2fa0:   	swap	[%i0 - 4], %l1
	.word	0x3b800008	! t0_kref+0x2fa4:   	fble,a	_kref+0x2fc4
	.word	0x91b300ad	! t0_kref+0x2fa8:   	edge16n	%o4, %o5, %o0
	.word	0x9673000d	! t0_kref+0x2fac:   	udiv	%o4, %o5, %o3
	.word	0xe780a020	! t0_kref+0x2fb0:   	lda	[%g2 + 0x20]%asi, %f19
	.word	0x8d8321db	! t0_kref+0x2fb4:   	wr	%o4, 0x1db, %fprs
	.word	0xa5b4098c	! t0_kref+0x2fb8:   	bshuffle	%f16, %f12, %f18
	.word	0x9ba3882b	! t0_kref+0x2fbc:   	fadds	%f14, %f11, %f13
	.word	0x9ba0002e	! t0_kref+0x2fc0:   	fmovs	%f14, %f13
	.word	0x39800002	! t0_kref+0x2fc4:   	fbuge,a	_kref+0x2fcc
	.word	0xa1a40d2d	! t0_kref+0x2fc8:   	fsmuld	%f16, %f13, %f16
	.word	0xee166016	! t0_kref+0x2fcc:   	lduh	[%i1 + 0x16], %l7
	.word	0x9da0054a	! t0_kref+0x2fd0:   	fsqrtd	%f10, %f14
	.word	0xd04e4000	! t0_kref+0x2fd4:   	ldsb	[%i1], %o0
	.word	0x9de3bfa0	! t0_kref+0x2fd8:   	save	%sp, -0x60, %sp
	.word	0xbabe3391	! t0_kref+0x2fdc:   	xnorcc	%i0, -0xc6f, %i5
	.word	0xade80019	! t0_kref+0x2fe0:   	restore	%g0, %i1, %l6
	.word	0x9db3090e	! t0_kref+0x2fe4:   	faligndata	%f12, %f14, %f14
	.word	0x95a0052d	! t0_kref+0x2fe8:   	fsqrts	%f13, %f10
	.word	0x81b01022	! t0_kref+0x2fec:   	siam	0x2
	.word	0xa1b48a0e	! t0_kref+0x2ff0:   	fpadd16	%f18, %f14, %f16
	.word	0x960b000c	! t0_kref+0x2ff4:   	and	%o4, %o4, %o3
	.word	0x9de3bfa0	! t0_kref+0x2ff8:   	save	%sp, -0x60, %sp
	.word	0xbb0f401c	! t0_kref+0x2ffc:   	tsubcc	%i5, %i4, %i5
	.word	0xa7eec018	! t0_kref+0x3000:   	restore	%i3, %i0, %l3
	.word	0xe56e001d	! t0_kref+0x3004:   	prefetch	%i0 + %i5, 18
	.word	0x95a0188c	! t0_kref+0x3008:   	fitos	%f12, %f10
	.word	0x92c3400c	! t0_kref+0x300c:   	addccc	%o5, %o4, %o1
	.word	0xadb340cd	! t0_kref+0x3010:   	edge16l	%o5, %o5, %l6
	.word	0xa1a00552	! t0_kref+0x3014:   	fsqrtd	%f18, %f16
	.word	0xd08e9040	! t0_kref+0x3018:   	lduba	[%i2]0x82, %o0
	.word	0xa533200c	! t0_kref+0x301c:   	srl	%o4, 0xc, %l2
	.word	0xe406401c	! t0_kref+0x3020:   	ld	[%i1 + %i4], %l2
	.word	0xe648a021	! t0_kref+0x3024:   	ldsb	[%g2 + 0x21], %l3
	.word	0x95b009aa	! t0_kref+0x3028:   	fexpand	%f10, %f10
	.word	0x9613400c	! t0_kref+0x302c:   	or	%o5, %o4, %o3
	.word	0xa5b3074e	! t0_kref+0x3030:   	fpack32	%f12, %f14, %f18
	.word	0xa5a4884a	! t0_kref+0x3034:   	faddd	%f18, %f10, %f18
	.word	0x3b480006	! t0_kref+0x3038:   	fble,a,pt	%fcc0, _kref+0x3050
	.word	0x91400000	! t0_kref+0x303c:   	mov	%y, %o0
	.word	0xe1be188d	! t0_kref+0x3040:   	stda	%f16, [%i0 + %o5]0xc4
	.word	0x99a00552	! t0_kref+0x3044:   	fsqrtd	%f18, %f12
	.word	0x81ac0aaa	! t0_kref+0x3048:   	fcmpes	%fcc0, %f16, %f10
	.word	0x97a30833	! t0_kref+0x304c:   	fadds	%f12, %f19, %f11
	.word	0xe2c8a03d	! t0_kref+0x3050:   	ldsba	[%g2 + 0x3d]%asi, %l1
	.word	0xaa23000c	! t0_kref+0x3054:   	sub	%o4, %o4, %l5
	.word	0xe47e001c	! t0_kref+0x3058:   	swap	[%i0 + %i4], %l2
	.word	0x3d800006	! t0_kref+0x305c:   	fbule,a	_kref+0x3074
	.word	0xa3b3cd60	! t0_kref+0x3060:   	fnot1s	%f15, %f17
	.word	0xa72b200f	! t0_kref+0x3064:   	sll	%o4, 0xf, %l3
	.word	0xdd1fbe90	! t0_kref+0x3068:   	ldd	[%fp - 0x170], %f14
	.word	0xae73000d	! t0_kref+0x306c:   	udiv	%o4, %o5, %l7
	.word	0xec180019	! t0_kref+0x3070:   	ldd	[%g0 + %i1], %l6
	.word	0xd51fbc10	! t0_kref+0x3074:   	ldd	[%fp - 0x3f0], %f10
	.word	0x9093400d	! t0_kref+0x3078:   	orcc	%o5, %o5, %o0
	.word	0x81db0017	! t0_kref+0x307c:   	flush	%o4 + %l7
	.word	0xa1b40e80	! t0_kref+0x3080:   	fsrc1	%f16, %f16
	.word	0xe5380018	! t0_kref+0x3084:   	std	%f18, [%g0 + %i0]
	.word	0xa5b3000d	! t0_kref+0x3088:   	edge8	%o4, %o5, %l2
	.word	0xaefb400c	! t0_kref+0x308c:   	sdivcc	%o5, %o4, %l7
	.word	0xd780a014	! t0_kref+0x3090:   	lda	[%g2 + 0x14]%asi, %f11
	.word	0x973b400c	! t0_kref+0x3094:   	sra	%o5, %o4, %o3
	.word	0x920375a9	! t0_kref+0x3098:   	add	%o5, -0xa57, %o1
	.word	0x81ab8aac	! t0_kref+0x309c:   	fcmpes	%fcc0, %f14, %f12
	.word	0xd00e4000	! t0_kref+0x30a0:   	ldub	[%i1], %o0
	.word	0xe248a01d	! t0_kref+0x30a4:   	ldsb	[%g2 + 0x1d], %l1
	.word	0xe0680018	! t0_kref+0x30a8:   	ldstub	[%g0 + %i0], %l0
	.word	0x95a0054c	! t0_kref+0x30ac:   	fsqrtd	%f12, %f10
	.word	0xa5a40952	! t0_kref+0x30b0:   	fmuld	%f16, %f18, %f18
	.word	0x9263400d	! t0_kref+0x30b4:   	subc	%o5, %o5, %o1
	.word	0xd0c8a015	! t0_kref+0x30b8:   	ldsba	[%g2 + 0x15]%asi, %o0
	.word	0x81834000	! t0_kref+0x30bc:   	wr	%o5, %g0, %y
	.word	0xae63255c	! t0_kref+0x30c0:   	subc	%o4, 0x55c, %l7
	.word	0x9ba01890	! t0_kref+0x30c4:   	fitos	%f16, %f13
	.word	0x95a000ad	! t0_kref+0x30c8:   	fnegs	%f13, %f10
	.word	0xd51fbf58	! t0_kref+0x30cc:   	ldd	[%fp - 0xa8], %f10
	.word	0xac73000c	! t0_kref+0x30d0:   	udiv	%o4, %o4, %l6
	.word	0xea4e8019	! t0_kref+0x30d4:   	ldsb	[%i2 + %i1], %l5
	.word	0x22800006	! t0_kref+0x30d8:   	be,a	_kref+0x30f0
	.word	0x94fb000d	! t0_kref+0x30dc:   	sdivcc	%o4, %o5, %o2
	.word	0xd9be1000	! t0_kref+0x30e0:   	stda	%f12, [%i0]0x80
	.word	0x949b000d	! t0_kref+0x30e4:   	xorcc	%o4, %o5, %o2
	.word	0x9ba2c82e	! t0_kref+0x30e8:   	fadds	%f11, %f14, %f13
	.word	0xa1b009ad	! t0_kref+0x30ec:   	fexpand	%f13, %f16
	.word	0x33800004	! t0_kref+0x30f0:   	fbe,a	_kref+0x3100
	.word	0xe0be6018	! t0_kref+0x30f4:   	stda	%l0, [%i1 + 0x18]%asi
	.word	0xfb6e6018	! t0_kref+0x30f8:   	prefetch	%i1 + 0x18, 29
	.word	0xa7b007b2	! t0_kref+0x30fc:   	fpackfix	%f18, %f19
	.word	0xea5e3fe8	! t0_kref+0x3100:   	ldx	[%i0 - 0x18], %l5
	.word	0x3b480007	! t0_kref+0x3104:   	fble,a,pt	%fcc0, _kref+0x3120
	.word	0x81dec017	! t0_kref+0x3108:   	flush	%i3 + %l7
	.word	0xf0182ff0	! t0_kref+0x310c:   	ldd	[%g0 + 0xff0], %i0
	.word	0xec46401c	! t0_kref+0x3110:   	ldsw	[%i1 + %i4], %l6
	.word	0xd2466000	! t0_kref+0x3114:   	ldsw	[%i1], %o1
	.word	0xf3ee501c	! t0_kref+0x3118:   	prefetcha	%i1 + %i4, 25
	.word	0xac33000c	! t0_kref+0x311c:   	orn	%o4, %o4, %l6
	.word	0x95a0054c	! t0_kref+0x3120:   	fsqrtd	%f12, %f10
	.word	0xa20b000d	! t0_kref+0x3124:   	and	%o4, %o5, %l1
	.word	0xdd9e7ff8	! t0_kref+0x3128:   	ldda	[%i1 - 8]%asi, %f14
	.word	0xe81e3ff8	! t0_kref+0x312c:   	ldd	[%i0 - 8], %l4
	.word	0xea88a007	! t0_kref+0x3130:   	lduba	[%g2 + 7]%asi, %l5
	.word	0x95a4884c	! t0_kref+0x3134:   	faddd	%f18, %f12, %f10
	.word	0xa6c372d1	! t0_kref+0x3138:   	addccc	%o5, -0xd2f, %l3
	.word	0x23800004	! t0_kref+0x313c:   	fbne,a	_kref+0x314c
	.word	0x97a3c92f	! t0_kref+0x3140:   	fmuls	%f15, %f15, %f11
	.word	0xe20e200f	! t0_kref+0x3144:   	ldub	[%i0 + 0xf], %l1
	.word	0xa6a3400d	! t0_kref+0x3148:   	subcc	%o5, %o5, %l3
	.word	0xa7b30200	! t0_kref+0x314c:   	array8	%o4, %g0, %l3
	.word	0x81b01025	! t0_kref+0x3150:   	siam	0x5
	.word	0x90b37025	! t0_kref+0x3154:   	orncc	%o5, -0xfdb, %o0
	.word	0xa423400c	! t0_kref+0x3158:   	sub	%o5, %o4, %l2
	.word	0x9da2c82f	! t0_kref+0x315c:   	fadds	%f11, %f15, %f14
	.word	0x9493400d	! t0_kref+0x3160:   	orcc	%o5, %o5, %o2
	.word	0xe03e4000	! t0_kref+0x3164:   	std	%l0, [%i1]
	.word	0xae232e43	! t0_kref+0x3168:   	sub	%o4, 0xe43, %l7
	.word	0x95a0054a	! t0_kref+0x316c:   	fsqrtd	%f10, %f10
	.word	0x9ba4092f	! t0_kref+0x3170:   	fmuls	%f16, %f15, %f13
	call	SYM(t0_subr0)
	.word	0x90a338f6	! t0_kref+0x3178:   	subcc	%o4, -0x70a, %o0
	.word	0x92fb000c	! t0_kref+0x317c:   	sdivcc	%o4, %o4, %o1
	.word	0xd87e7fe0	! t0_kref+0x3180:   	swap	[%i1 - 0x20], %o4
	.word	0x99a0054e	! t0_kref+0x3184:   	fsqrtd	%f14, %f12
	.word	0x9473000d	! t0_kref+0x3188:   	udiv	%o4, %o5, %o2
	.word	0xdb80a01c	! t0_kref+0x318c:   	lda	[%g2 + 0x1c]%asi, %f13
	.word	0xec6e4000	! t0_kref+0x3190:   	ldstub	[%i1], %l6
	.word	0xd5380019	! t0_kref+0x3194:   	std	%f10, [%g0 + %i1]
	.word	0x9da01932	! t0_kref+0x3198:   	fstod	%f18, %f14
	.word	0xa1a0054c	! t0_kref+0x319c:   	fsqrtd	%f12, %f16
	.word	0xe2163fe4	! t0_kref+0x31a0:   	lduh	[%i0 - 0x1c], %l1
	.word	0xa7a01a4a	! t0_kref+0x31a4:   	fdtoi	%f10, %f19
	call	SYM(t0_subr3)
	.word	0x9ba0002b	! t0_kref+0x31ac:   	fmovs	%f11, %f13
	.word	0xf76e001b	! t0_kref+0x31b0:   	prefetch	%i0 + %i3, 27
	.word	0x92b3000c	! t0_kref+0x31b4:   	orncc	%o4, %o4, %o1
	.word	0xe03e6008	! t0_kref+0x31b8:   	std	%l0, [%i1 + 8]
	.word	0x99a3c930	! t0_kref+0x31bc:   	fmuls	%f15, %f16, %f12
	.word	0x3d800006	! t0_kref+0x31c0:   	fbule,a	_kref+0x31d8
	.word	0xa213400d	! t0_kref+0x31c4:   	or	%o5, %o5, %l1
	.word	0xafb34280	! t0_kref+0x31c8:   	array32	%o5, %g0, %l7
	.word	0xec4e3fea	! t0_kref+0x31cc:   	ldsb	[%i0 - 0x16], %l6
	.word	0xa3b2ca2f	! t0_kref+0x31d0:   	fpadd16s	%f11, %f15, %f17
	.word	0xa4fb66f2	! t0_kref+0x31d4:   	sdivcc	%o5, 0x6f2, %l2
	.word	0x969b000d	! t0_kref+0x31d8:   	xorcc	%o4, %o5, %o3
	.word	0x9ba00533	! t0_kref+0x31dc:   	fsqrts	%f19, %f13
	.word	0x81ac8ab2	! t0_kref+0x31e0:   	fcmpes	%fcc0, %f18, %f18
	.word	0x95b340ec	! t0_kref+0x31e4:   	edge16ln	%o5, %o4, %o2
	.word	0x2b480003	! t0_kref+0x31e8:   	fbug,a,pt	%fcc0, _kref+0x31f4
	.word	0xc76e3fe0	! t0_kref+0x31ec:   	prefetch	%i0 - 0x20, 3
	.word	0xa1a0052e	! t0_kref+0x31f0:   	fsqrts	%f14, %f16
	.word	0x86102014	! t0_kref+0x31f4:   	mov	0x14, %g3
	.word	0x86a0e001	! t0_kref+0x31f8:   	subcc	%g3, 1, %g3
	.word	0x2280001a	! t0_kref+0x31fc:   	be,a	_kref+0x3264
	.word	0xa8537b79	! t0_kref+0x3200:   	umul	%o5, -0x487, %l4
	.word	0xe100a00c	! t0_kref+0x3204:   	ld	[%g2 + 0xc], %f16
	.word	0x30800005	! t0_kref+0x3208:   	ba,a	_kref+0x321c
	.word	0x94fb400d	! t0_kref+0x320c:   	sdivcc	%o5, %o5, %o2
	.word	0x23bffffa	! t0_kref+0x3210:   	fbne,a	_kref+0x31f8
	.word	0x95a3084a	! t0_kref+0x3214:   	faddd	%f12, %f10, %f10
	.word	0x972b000c	! t0_kref+0x3218:   	sll	%o4, %o4, %o3
	.word	0xa1a01a4e	! t0_kref+0x321c:   	fdtoi	%f14, %f16
	.word	0xa2ab221a	! t0_kref+0x3220:   	andncc	%o4, 0x21a, %l1
	.word	0xa7a0052a	! t0_kref+0x3224:   	fsqrts	%f10, %f19
	.word	0xaa1372ef	! t0_kref+0x3228:   	or	%o5, -0xd11, %l5
	.word	0xa3a0052f	! t0_kref+0x322c:   	fsqrts	%f15, %f17
	.word	0xa3a2882d	! t0_kref+0x3230:   	fadds	%f10, %f13, %f17
	.word	0xea064000	! t0_kref+0x3234:   	ld	[%i1], %l5
	.word	0xa5b009ad	! t0_kref+0x3238:   	fexpand	%f13, %f18
	.word	0xd8200019	! t0_kref+0x323c:   	st	%o4, [%g0 + %i1]
	.word	0xae0b29df	! t0_kref+0x3240:   	and	%o4, 0x9df, %l7
	.word	0xabb3000c	! t0_kref+0x3244:   	edge8	%o4, %o4, %l5
	.word	0xd830a03a	! t0_kref+0x3248:   	sth	%o4, [%g2 + 0x3a]
	.word	0xd9be180c	! t0_kref+0x324c:   	stda	%f12, [%i0 + %o4]0xc0
	.word	0xd828a023	! t0_kref+0x3250:   	stb	%o4, [%g2 + 0x23]
	.word	0x95a00550	! t0_kref+0x3254:   	fsqrtd	%f16, %f10
	.word	0xe53f4019	! t0_kref+0x3258:   	std	%f18, [%i5 + %i1]
	.word	0x95a00031	! t0_kref+0x325c:   	fmovs	%f17, %f10
	.word	0x81ac8acc	! t0_kref+0x3260:   	fcmped	%fcc0, %f18, %f12
	.word	0x83414000	! t0_kref+0x3264:   	mov	%pc, %g1
	.word	0xa33b600e	! t0_kref+0x3268:   	sra	%o5, 0xe, %l1
	.word	0xe1be188c	! t0_kref+0x326c:   	stda	%f16, [%i0 + %o4]0xc4
	.word	0xd6070019	! t0_kref+0x3270:   	ld	[%i4 + %i1], %o3
	.word	0xad400000	! t0_kref+0x3274:   	mov	%y, %l6
	.word	0xc56e400c	! t0_kref+0x3278:   	prefetch	%i1 + %o4, 2
	.word	0xe780a020	! t0_kref+0x327c:   	lda	[%g2 + 0x20]%asi, %f19
	.word	0xd46e4000	! t0_kref+0x3280:   	ldstub	[%i1], %o2
	.word	0xaf2b6002	! t0_kref+0x3284:   	sll	%o5, 0x2, %l7
	.word	0x26800007	! t0_kref+0x3288:   	bl,a	_kref+0x32a4
	.word	0xa5b2c96f	! t0_kref+0x328c:   	fpmerge	%f11, %f15, %f18
	.word	0x99a0054e	! t0_kref+0x3290:   	fsqrtd	%f14, %f12
	.word	0x81acca31	! t0_kref+0x3294:   	fcmps	%fcc0, %f19, %f17
	.word	0xa5a00552	! t0_kref+0x3298:   	fsqrtd	%f18, %f18
	.word	0xacc33aa2	! t0_kref+0x329c:   	addccc	%o4, -0x55e, %l6
	.word	0x2d800006	! t0_kref+0x32a0:   	fbg,a	_kref+0x32b8
	.word	0x9db30e80	! t0_kref+0x32a4:   	fsrc1	%f12, %f14
	.word	0x29800001	! t0_kref+0x32a8:   	fbl,a	_kref+0x32ac
	.word	0xfd6e3ff8	! t0_kref+0x32ac:   	prefetch	%i0 - 8, 30
	.word	0xa28b400d	! t0_kref+0x32b0:   	andcc	%o5, %o5, %l1
	.word	0xe03e7fe8	! t0_kref+0x32b4:   	std	%l0, [%i1 - 0x18]
	.word	0xdaf75018	! t0_kref+0x32b8:   	stxa	%o5, [%i5 + %i0]0x80
	.word	0xa3a01a4a	! t0_kref+0x32bc:   	fdtoi	%f10, %f17
	.word	0xa1a00530	! t0_kref+0x32c0:   	fsqrts	%f16, %f16
	.word	0x973b6000	! t0_kref+0x32c4:   	sra	%o5, 0x0, %o3
	.word	0xa5b3000d	! t0_kref+0x32c8:   	edge8	%o4, %o5, %l2
	.word	0x86102004	! t0_kref+0x32cc:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x32d0:   	bne,a	_kref+0x32d0
	.word	0x86a0e001	! t0_kref+0x32d4:   	subcc	%g3, 1, %g3
	.word	0x81ac4a2c	! t0_kref+0x32d8:   	fcmps	%fcc0, %f17, %f12
	.word	0x99b40d0a	! t0_kref+0x32dc:   	fandnot1	%f16, %f10, %f12
	.word	0xaf400000	! t0_kref+0x32e0:   	mov	%y, %l7
	.word	0xa8b3400d	! t0_kref+0x32e4:   	orncc	%o5, %o5, %l4
	.word	0xaa6329bc	! t0_kref+0x32e8:   	subc	%o4, 0x9bc, %l5
	.word	0xa5a3c933	! t0_kref+0x32ec:   	fmuls	%f15, %f19, %f18
	.word	0xa92b200f	! t0_kref+0x32f0:   	sll	%o4, 0xf, %l4
	.word	0xec070019	! t0_kref+0x32f4:   	ld	[%i4 + %i1], %l6
	.word	0x86102003	! t0_kref+0x32f8:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x32fc:   	bne,a	_kref+0x32fc
	.word	0x86a0e001	! t0_kref+0x3300:   	subcc	%g3, 1, %g3
	.word	0x8d83400c	! t0_kref+0x3304:   	wr	%o5, %o4, %fprs
	.word	0xa53b2006	! t0_kref+0x3308:   	sra	%o4, 0x6, %l2
	.word	0xd8a0a00c	! t0_kref+0x330c:   	sta	%o4, [%g2 + 0xc]%asi
	.word	0x9053000d	! t0_kref+0x3310:   	umul	%o4, %o5, %o0
	.word	0xae73224b	! t0_kref+0x3314:   	udiv	%o4, 0x24b, %l7
	.word	0x9673000d	! t0_kref+0x3318:   	udiv	%o4, %o5, %o3
	.word	0xda2e4000	! t0_kref+0x331c:   	stb	%o5, [%i1]
	.word	0xa7a0052a	! t0_kref+0x3320:   	fsqrts	%f10, %f19
	.word	0x972b2019	! t0_kref+0x3324:   	sll	%o4, 0x19, %o3
	.word	0x24800002	! t0_kref+0x3328:   	ble,a	_kref+0x3330
	.word	0x97a018d2	! t0_kref+0x332c:   	fdtos	%f18, %f11
	.word	0x9de3bfa0	! t0_kref+0x3330:   	save	%sp, -0x60, %sp
	.word	0xafee001b	! t0_kref+0x3334:   	restore	%i0, %i3, %l7
	.word	0x97b3016c	! t0_kref+0x3338:   	edge32ln	%o4, %o4, %o3
	.word	0xd8b63fe0	! t0_kref+0x333c:   	stha	%o4, [%i0 - 0x20]%asi
	.word	0xe16e401a	! t0_kref+0x3340:   	prefetch	%i1 + %i2, 16
	.word	0x9fc00004	! t0_kref+0x3344:   	call	%g0 + %g4
	.word	0xacfb400c	! t0_kref+0x3348:   	sdivcc	%o5, %o4, %l6
	.word	0xe1be5a5d	! t0_kref+0x334c:   	stda	%f16, [%i1 + %i5]0xd2
	.word	0xda267fe0	! t0_kref+0x3350:   	st	%o5, [%i1 - 0x20]
	.word	0xac73400c	! t0_kref+0x3354:   	udiv	%o5, %o4, %l6
	.word	0xa7b00fe0	! t0_kref+0x3358:   	fones	%f19
	.word	0x97b2cea0	! t0_kref+0x335c:   	fsrc1s	%f11, %f11
	.word	0xa5a4cd31	! t0_kref+0x3360:   	fsmuld	%f19, %f17, %f18
	.word	0x81ac4a32	! t0_kref+0x3364:   	fcmps	%fcc0, %f17, %f18
	.word	0xae5320f0	! t0_kref+0x3368:   	umul	%o4, 0xf0, %l7
	.word	0x95b30d40	! t0_kref+0x336c:   	fnot1	%f12, %f10
	.word	0xa5a00532	! t0_kref+0x3370:   	fsqrts	%f18, %f18
	.word	0xd04e7fe6	! t0_kref+0x3374:   	ldsb	[%i1 - 0x1a], %o0
	.word	0xa5a34d2f	! t0_kref+0x3378:   	fsmuld	%f13, %f15, %f18
	.word	0x95a01932	! t0_kref+0x337c:   	fstod	%f18, %f10
	.word	0x9170000c	! t0_kref+0x3380:   	popc	%o4, %o0
	.word	0x8143c000	! t0_kref+0x3384:   	stbar
	.word	0x99a00531	! t0_kref+0x3388:   	fsqrts	%f17, %f12
	.word	0x26800008	! t0_kref+0x338c:   	bl,a	_kref+0x33ac
	.word	0xda264000	! t0_kref+0x3390:   	st	%o5, [%i1]
	.word	0x95a0054a	! t0_kref+0x3394:   	fsqrtd	%f10, %f10
	.word	0x9fc10000	! t0_kref+0x3398:   	call	%g4
	.word	0xe01f4019	! t0_kref+0x339c:   	ldd	[%i5 + %i1], %l0
	.word	0xe6062014	! t0_kref+0x33a0:   	ld	[%i0 + 0x14], %l3
	.word	0xa7400000	! t0_kref+0x33a4:   	mov	%y, %l3
	.word	0xe6062008	! t0_kref+0x33a8:   	ld	[%i0 + 8], %l3
	.word	0x95a3882a	! t0_kref+0x33ac:   	fadds	%f14, %f10, %f10
	.word	0xeade101d	! t0_kref+0x33b0:   	ldxa	[%i0 + %i5]0x80, %l5
	.word	0x920b000d	! t0_kref+0x33b4:   	and	%o4, %o5, %o1
	.word	0x9de3bfa0	! t0_kref+0x33b8:   	save	%sp, -0x60, %sp
	.word	0x97ef001a	! t0_kref+0x33bc:   	restore	%i4, %i2, %o3
	.word	0xdd1fbf50	! t0_kref+0x33c0:   	ldd	[%fp - 0xb0], %f14
	.word	0x97b40d2d	! t0_kref+0x33c4:   	fandnot1s	%f16, %f13, %f11
	.word	0x9db38ed0	! t0_kref+0x33c8:   	fornot2	%f14, %f16, %f14
	.word	0x3d480003	! t0_kref+0x33cc:   	fbule,a,pt	%fcc0, _kref+0x33d8
	.word	0xe8c8a037	! t0_kref+0x33d0:   	ldsba	[%g2 + 0x37]%asi, %l4
	.word	0x2b800004	! t0_kref+0x33d4:   	fbug,a	_kref+0x33e4
	.word	0xa5b38e80	! t0_kref+0x33d8:   	fsrc1	%f14, %f18
	.word	0x26480001	! t0_kref+0x33dc:   	bl,a,pt	%icc, _kref+0x33e0
	.word	0xdd3e4000	! t0_kref+0x33e0:   	std	%f14, [%i1]
	.word	0x95a0104e	! t0_kref+0x33e4:   	fdtox	%f14, %f10
	.word	0x87802082	! t0_kref+0x33e8:   	mov	0x82, %asi
	.word	0x9733400d	! t0_kref+0x33ec:   	srl	%o5, %o5, %o3
	.word	0xa1a00550	! t0_kref+0x33f0:   	fsqrtd	%f16, %f16
	.word	0xa7400000	! t0_kref+0x33f4:   	mov	%y, %l3
	.word	0x9733600e	! t0_kref+0x33f8:   	srl	%o5, 0xe, %o3
	.word	0x95b3034d	! t0_kref+0x33fc:   	alignaddrl	%o4, %o5, %o2
	.word	0x95a3c932	! t0_kref+0x3400:   	fmuls	%f15, %f18, %f10
	.word	0xe28e9018	! t0_kref+0x3404:   	lduba	[%i2 + %i0]0x80, %l1
	.word	0xd53e7ff0	! t0_kref+0x3408:   	std	%f10, [%i1 - 0x10]
	.word	0xa2037c90	! t0_kref+0x340c:   	add	%o5, -0x370, %l1
	.word	0x26480001	! t0_kref+0x3410:   	bl,a,pt	%icc, _kref+0x3414
	.word	0xc6003bdc	! t0_kref+0x3414:   	ld	[%g0 - 0x424], %g3
	.word	0x99b3470e	! t0_kref+0x3418:   	fmuld8sux16	%f13, %f14, %f12
	.word	0x8143c000	! t0_kref+0x341c:   	stbar
	.word	0xe06e200f	! t0_kref+0x3420:   	ldstub	[%i0 + 0xf], %l0
	.word	0xd53e3ff0	! t0_kref+0x3424:   	std	%f10, [%i0 - 0x10]
	.word	0x95b00ccc	! t0_kref+0x3428:   	fnot2	%f12, %f10
	.word	0xa46379e4	! t0_kref+0x342c:   	subc	%o5, -0x61c, %l2
	.word	0x95b48e80	! t0_kref+0x3430:   	fsrc1	%f18, %f10
	.word	0x99a38950	! t0_kref+0x3434:   	fmuld	%f14, %f16, %f12
	.word	0x95b0076c	! t0_kref+0x3438:   	fpack16	%f12, %f10
	.word	0x81ab0ab0	! t0_kref+0x343c:   	fcmpes	%fcc0, %f12, %f16
	.word	0xdd3f4019	! t0_kref+0x3440:   	std	%f14, [%i5 + %i1]
	.word	0xa5a00552	! t0_kref+0x3444:   	fsqrtd	%f18, %f18
	.word	0x2f480007	! t0_kref+0x3448:   	fbu,a,pt	%fcc0, _kref+0x3464
	.word	0xe11f4019	! t0_kref+0x344c:   	ldd	[%i5 + %i1], %f16
	.word	0x9161a2c5	! t0_kref+0x3450:   	movg	%fcc0, 0x2c5, %o0
	.word	0xec0e8018	! t0_kref+0x3454:   	ldub	[%i2 + %i0], %l6
	.word	0x35800001	! t0_kref+0x3458:   	fbue,a	_kref+0x345c
	.word	0xe11e401d	! t0_kref+0x345c:   	ldd	[%i1 + %i5], %f16
	.word	0x972b400c	! t0_kref+0x3460:   	sll	%o5, %o4, %o3
	.word	0xabb3004c	! t0_kref+0x3464:   	edge8l	%o4, %o4, %l5
	.word	0xec1e6000	! t0_kref+0x3468:   	ldd	[%i1], %l6
	.word	0x907b6a47	! t0_kref+0x346c:   	sdiv	%o5, 0xa47, %o0
	.word	0xe20e3fed	! t0_kref+0x3470:   	ldub	[%i0 - 0x13], %l1
	.word	0xd820a03c	! t0_kref+0x3474:   	st	%o4, [%g2 + 0x3c]
	.word	0xd93e6000	! t0_kref+0x3478:   	std	%f12, [%i1]
	.word	0x21800007	! t0_kref+0x347c:   	fbn,a	_kref+0x3498
	.word	0x973b400d	! t0_kref+0x3480:   	sra	%o5, %o5, %o3
	.word	0xacc3400d	! t0_kref+0x3484:   	addccc	%o5, %o5, %l6
	.word	0xab400000	! t0_kref+0x3488:   	mov	%y, %l5
	.word	0xf36e001d	! t0_kref+0x348c:   	prefetch	%i0 + %i5, 25
	.word	0x92a3400c	! t0_kref+0x3490:   	subcc	%o5, %o4, %o1
	.word	0xae7b3572	! t0_kref+0x3494:   	sdiv	%o4, -0xa8e, %l7
	.word	0xe7f6500c	! t0_kref+0x3498:   	casxa	[%i1]0x80, %o4, %l3
	.word	0xabb3404c	! t0_kref+0x349c:   	edge8l	%o5, %o4, %l5
	.word	0x95400000	! t0_kref+0x34a0:   	mov	%y, %o2
	.word	0xa5b38f73	! t0_kref+0x34a4:   	fornot1s	%f14, %f19, %f18
	.word	0x973b000d	! t0_kref+0x34a8:   	sra	%o4, %o5, %o3
	.word	0x9493400d	! t0_kref+0x34ac:   	orcc	%o5, %o5, %o2
	.word	0x9361a416	! t0_kref+0x34b0:   	movg	%fcc0, -0x3ea, %o1
	.word	0xe2000018	! t0_kref+0x34b4:   	ld	[%g0 + %i0], %l1
	.word	0xd1f6100c	! t0_kref+0x34b8:   	casxa	[%i0]0x80, %o4, %o0
	.word	0x8610200d	! t0_kref+0x34bc:   	mov	0xd, %g3
	.word	0x86a0e001	! t0_kref+0x34c0:   	subcc	%g3, 1, %g3
	.word	0x22800012	! t0_kref+0x34c4:   	be,a	_kref+0x350c
	.word	0x9db40e0c	! t0_kref+0x34c8:   	fand	%f16, %f12, %f14
	.word	0xee6e6004	! t0_kref+0x34cc:   	ldstub	[%i1 + 4], %l7
	.word	0x95a0052a	! t0_kref+0x34d0:   	fsqrts	%f10, %f10
	.word	0xad2b000d	! t0_kref+0x34d4:   	sll	%o4, %o5, %l6
	.word	0x27bffffa	! t0_kref+0x34d8:   	fbul,a	_kref+0x34c0
	.word	0x99a488ce	! t0_kref+0x34dc:   	fsubd	%f18, %f14, %f12
	.word	0xd408a016	! t0_kref+0x34e0:   	ldub	[%g2 + 0x16], %o2
	.word	0xa78335ce	! t0_kref+0x34e4:   	wr	%o4, 0xfffff5ce, %gsr
	.word	0xabb3402d	! t0_kref+0x34e8:   	edge8n	%o5, %o5, %l5
	.word	0xf16e3ff0	! t0_kref+0x34ec:   	prefetch	%i0 - 0x10, 24
	.word	0x9db28a52	! t0_kref+0x34f0:   	fpadd32	%f10, %f18, %f14
	.word	0xabb340ed	! t0_kref+0x34f4:   	edge16ln	%o5, %o5, %l5
	.word	0x81dfe692	! t0_kref+0x34f8:   	flush	%i7 + 0x692
	.word	0xafb28590	! t0_kref+0x34fc:   	fcmpgt32	%f10, %f16, %l7
	.word	0xacb3000d	! t0_kref+0x3500:   	orncc	%o4, %o5, %l6
	.word	0x9da3884c	! t0_kref+0x3504:   	faddd	%f14, %f12, %f14
	.word	0x9ba408b2	! t0_kref+0x3508:   	fsubs	%f16, %f18, %f13
	.word	0xe03e3ff0	! t0_kref+0x350c:   	std	%l0, [%i0 - 0x10]
	.word	0xe700a014	! t0_kref+0x3510:   	ld	[%g2 + 0x14], %f19
	.word	0xa5a94050	! t0_kref+0x3514:   	fmovdug	%fcc0, %f16, %f18
	.word	0x9db30a6d	! t0_kref+0x3518:   	fpadd32s	%f12, %f13, %f14
	.word	0xee16001b	! t0_kref+0x351c:   	lduh	[%i0 + %i3], %l7
	.word	0xa92b400d	! t0_kref+0x3520:   	sll	%o5, %o5, %l4
	.word	0xd1be1a1a	! t0_kref+0x3524:   	stda	%f8, [%i0 + %i2]0xd0
	.word	0xa3a4492c	! t0_kref+0x3528:   	fmuls	%f17, %f12, %f17
	.word	0xacfb000c	! t0_kref+0x352c:   	sdivcc	%o4, %o4, %l6
	.word	0x2b800005	! t0_kref+0x3530:   	fbug,a	_kref+0x3544
	.word	0x9da8004e	! t0_kref+0x3534:   	fmovdn	%fcc0, %f14, %f14
	.word	0x952b2014	! t0_kref+0x3538:   	sll	%o4, 0x14, %o2
	.word	0xee50a00c	! t0_kref+0x353c:   	ldsh	[%g2 + 0xc], %l7
	.word	0xa1a2884c	! t0_kref+0x3540:   	faddd	%f10, %f12, %f16
	.word	0x9613251a	! t0_kref+0x3544:   	or	%o4, 0x51a, %o3
	.word	0x973b400c	! t0_kref+0x3548:   	sra	%o5, %o4, %o3
	.word	0xadb3004c	! t0_kref+0x354c:   	edge8l	%o4, %o4, %l6
	.word	0x9de3bfa0	! t0_kref+0x3550:   	save	%sp, -0x60, %sp
	.word	0xbab832f2	! t0_kref+0x3554:   	xnorcc	%g0, -0xd0e, %i5
	.word	0x95eebd43	! t0_kref+0x3558:   	restore	%i2, -0x2bd, %o2
	.word	0x99b00ced	! t0_kref+0x355c:   	fnot2s	%f13, %f12
	.word	0xa3a4092a	! t0_kref+0x3560:   	fmuls	%f16, %f10, %f17
	.word	0xacc32c81	! t0_kref+0x3564:   	addccc	%o4, 0xc81, %l6
	.word	0x99a9004a	! t0_kref+0x3568:   	fmovdl	%fcc0, %f10, %f12
	.word	0xc168a004	! t0_kref+0x356c:   	prefetch	%g2 + 4, 0
	.word	0xaf2b600e	! t0_kref+0x3570:   	sll	%o5, 0xe, %l7
	.word	0xaaab72fb	! t0_kref+0x3574:   	andncc	%o5, -0xd05, %l5
	.word	0x9db28f92	! t0_kref+0x3578:   	for	%f10, %f18, %f14
	.word	0x9663000d	! t0_kref+0x357c:   	subc	%o4, %o5, %o3
	.word	0x92b37d48	! t0_kref+0x3580:   	orncc	%o5, -0x2b8, %o1
	.word	0x94db000c	! t0_kref+0x3584:   	smulcc	%o4, %o4, %o2
	.word	0x9ba01892	! t0_kref+0x3588:   	fitos	%f18, %f13
	.word	0x9013000d	! t0_kref+0x358c:   	or	%o4, %o5, %o0
	.word	0x95a00550	! t0_kref+0x3590:   	fsqrtd	%f16, %f10
	.word	0x95a3894a	! t0_kref+0x3594:   	fmuld	%f14, %f10, %f10
	.word	0xa7a0188d	! t0_kref+0x3598:   	fitos	%f13, %f19
	.word	0xa7a000b2	! t0_kref+0x359c:   	fnegs	%f18, %f19
	.word	0xa3a0052c	! t0_kref+0x35a0:   	fsqrts	%f12, %f17
	.word	0xa8932e7d	! t0_kref+0x35a4:   	orcc	%o4, 0xe7d, %l4
	.word	0x97a2c830	! t0_kref+0x35a8:   	fadds	%f11, %f16, %f11
	.word	0xa7a0002d	! t0_kref+0x35ac:   	fmovs	%f13, %f19
	.word	0xd7e6500c	! t0_kref+0x35b0:   	casa	[%i1]0x80, %o4, %o3
	.word	0xe6166018	! t0_kref+0x35b4:   	lduh	[%i1 + 0x18], %l3
	.word	0x97b3016d	! t0_kref+0x35b8:   	edge32ln	%o4, %o5, %o3
	.word	0xad400000	! t0_kref+0x35bc:   	mov	%y, %l6
	.word	0xd648a02c	! t0_kref+0x35c0:   	ldsb	[%g2 + 0x2c], %o3
	.word	0xe408a01c	! t0_kref+0x35c4:   	ldub	[%g2 + 0x1c], %l2
	.word	0xaaa326c9	! t0_kref+0x35c8:   	subcc	%o4, 0x6c9, %l5
	.word	0xa5b48d40	! t0_kref+0x35cc:   	fnot1	%f18, %f18
	.word	0x23800004	! t0_kref+0x35d0:   	fbne,a	_kref+0x35e0
	.word	0xd250a01e	! t0_kref+0x35d4:   	ldsh	[%g2 + 0x1e], %o1
	.word	0x31480005	! t0_kref+0x35d8:   	fba,a,pt	%fcc0, _kref+0x35ec
	.word	0x99a00550	! t0_kref+0x35dc:   	fsqrtd	%f16, %f12
	.word	0x91b3400c	! t0_kref+0x35e0:   	edge8	%o5, %o4, %o0
	.word	0x97b3010c	! t0_kref+0x35e4:   	edge32	%o4, %o4, %o3
	.word	0xd9be188c	! t0_kref+0x35e8:   	stda	%f12, [%i0 + %o4]0xc4
	.word	0xda20a018	! t0_kref+0x35ec:   	st	%o5, [%g2 + 0x18]
	.word	0x9263400c	! t0_kref+0x35f0:   	subc	%o5, %o4, %o1
	.word	0xe9f6100d	! t0_kref+0x35f4:   	casxa	[%i0]0x80, %o5, %l4
	.word	0xabb340ad	! t0_kref+0x35f8:   	edge16n	%o5, %o5, %l5
	.word	0xa4733519	! t0_kref+0x35fc:   	udiv	%o4, -0xae7, %l2
	.word	0x8610200f	! t0_kref+0x3600:   	mov	0xf, %g3
	.word	0x86a0e001	! t0_kref+0x3604:   	subcc	%g3, 1, %g3
	.word	0x2280001b	! t0_kref+0x3608:   	be,a	_kref+0x3674
	.word	0xa9408000	! t0_kref+0x360c:   	mov	%ccr, %l4
	.word	0xa2b360dd	! t0_kref+0x3610:   	orncc	%o5, 0xdd, %l1
	.word	0x99a000d0	! t0_kref+0x3614:   	fnegd	%f16, %f12
	.word	0xe2060000	! t0_kref+0x3618:   	ld	[%i0], %l1
	.word	0xe100a010	! t0_kref+0x361c:   	ld	[%g2 + 0x10], %f16
	.word	0xe56e7fe0	! t0_kref+0x3620:   	prefetch	%i1 - 0x20, 18
	.word	0x9fa2892a	! t0_kref+0x3624:   	fmuls	%f10, %f10, %f15
	.word	0x94436e93	! t0_kref+0x3628:   	addc	%o5, 0xe93, %o2
	.word	0xd67e3fe0	! t0_kref+0x362c:   	swap	[%i0 - 0x20], %o3
	.word	0xe19e1a1c	! t0_kref+0x3630:   	ldda	[%i0 + %i4]0xd0, %f16
	.word	0x81834000	! t0_kref+0x3634:   	wr	%o5, %g0, %y
	.word	0xf028001a	! t0_kref+0x3638:   	stb	%i0, [%g0 + %i2]
	.word	0xab336002	! t0_kref+0x363c:   	srl	%o5, 0x2, %l5
	.word	0xa3a3892a	! t0_kref+0x3640:   	fmuls	%f14, %f10, %f17
	.word	0x97b30a73	! t0_kref+0x3644:   	fpadd32s	%f12, %f19, %f11
	.word	0xd2080019	! t0_kref+0x3648:   	ldub	[%g0 + %i1], %o1
	.word	0xe608a001	! t0_kref+0x364c:   	ldub	[%g2 + 1], %l3
	.word	0x97a4092b	! t0_kref+0x3650:   	fmuls	%f16, %f11, %f11
	.word	0xd8260000	! t0_kref+0x3654:   	st	%o4, [%i0]
	.word	0x9db4066e	! t0_kref+0x3658:   	fmul8x16au	%f16, %f14, %f14
	.word	0xe68e1000	! t0_kref+0x365c:   	lduba	[%i0]0x80, %l3
	.word	0xda20a000	! t0_kref+0x3660:   	st	%o5, [%g2]
	.word	0xa2c3000c	! t0_kref+0x3664:   	addccc	%o4, %o4, %l1
	.word	0x9fa00531	! t0_kref+0x3668:   	fsqrts	%f17, %f15
	.word	0x35480008	! t0_kref+0x366c:   	fbue,a,pt	%fcc0, _kref+0x368c
	.word	0xec08a02b	! t0_kref+0x3670:   	ldub	[%g2 + 0x2b], %l6
	.word	0x81aa8a52	! t0_kref+0x3674:   	fcmpd	%fcc0, %f10, %f18
	.word	0x95b286ec	! t0_kref+0x3678:   	fmul8ulx16	%f10, %f12, %f10
	.word	0x92b3000c	! t0_kref+0x367c:   	orncc	%o4, %o4, %o1
	.word	0xe03e3fe8	! t0_kref+0x3680:   	std	%l0, [%i0 - 0x18]
	.word	0x9db48aec	! t0_kref+0x3684:   	fpsub32s	%f18, %f12, %f14
	.word	0xaeb33fee	! t0_kref+0x3688:   	orncc	%o4, -0x12, %l7
	.word	0xa570000d	! t0_kref+0x368c:   	popc	%o5, %l2
	.word	0xad3b400c	! t0_kref+0x3690:   	sra	%o5, %o4, %l6
	.word	0x25800002	! t0_kref+0x3694:   	fblg,a	_kref+0x369c
	.word	0x81dc2eb8	! t0_kref+0x3698:   	flush	%l0 + 0xeb8
	.word	0xac7b400d	! t0_kref+0x369c:   	sdiv	%o5, %o5, %l6
	.word	0xee5e2018	! t0_kref+0x36a0:   	ldx	[%i0 + 0x18], %l7
	.word	0xb6103ffc	! t0_kref+0x36a4:   	mov	0xfffffffc, %i3
	.word	0xa3a01a4c	! t0_kref+0x36a8:   	fdtoi	%f12, %f17
	.word	0x35800008	! t0_kref+0x36ac:   	fbue,a	_kref+0x36cc
	.word	0x92c36cc3	! t0_kref+0x36b0:   	addccc	%o5, 0xcc3, %o1
	.word	0x8d8326c5	! t0_kref+0x36b4:   	wr	%o4, 0x6c5, %fprs
	.word	0x81ab8a31	! t0_kref+0x36b8:   	fcmps	%fcc0, %f14, %f17
	.word	0x99b28e0a	! t0_kref+0x36bc:   	fand	%f10, %f10, %f12
	.word	0xe320a020	! t0_kref+0x36c0:   	st	%f17, [%g2 + 0x20]
	.word	0xa1a4094a	! t0_kref+0x36c4:   	fmuld	%f16, %f10, %f16
	.word	0xa5a00031	! t0_kref+0x36c8:   	fmovs	%f17, %f18
	.word	0x81aacaaf	! t0_kref+0x36cc:   	fcmpes	%fcc0, %f11, %f15
	.word	0xad408000	! t0_kref+0x36d0:   	mov	%ccr, %l6
	.word	0xc768a049	! t0_kref+0x36d4:   	prefetch	%g2 + 0x49, 3
	.word	0xa8b3400d	! t0_kref+0x36d8:   	orncc	%o5, %o5, %l4
	.word	0x39480002	! t0_kref+0x36dc:   	fbuge,a,pt	%fcc0, _kref+0x36e4
	.word	0x99b009af	! t0_kref+0x36e0:   	fexpand	%f15, %f12
	.word	0xfb6e001d	! t0_kref+0x36e4:   	prefetch	%i0 + %i5, 29
	.word	0xa5a4884c	! t0_kref+0x36e8:   	faddd	%f18, %f12, %f18
	.word	0xc068a00e	! t0_kref+0x36ec:   	ldstub	[%g2 + 0xe], %g0
	.word	0xd51e6008	! t0_kref+0x36f0:   	ldd	[%i1 + 8], %f10
	.word	0xe11e4000	! t0_kref+0x36f4:   	ldd	[%i1], %f16
	.word	0xa1b48a4c	! t0_kref+0x36f8:   	fpadd32	%f18, %f12, %f16
	.word	0xdbf6100d	! t0_kref+0x36fc:   	casxa	[%i0]0x80, %o5, %o5
	.word	0x9fc10000	! t0_kref+0x3700:   	call	%g4
	.word	0xad2b400d	! t0_kref+0x3704:   	sll	%o5, %o5, %l6
	.word	0x95b4040a	! t0_kref+0x3708:   	fcmple16	%f16, %f10, %o2
	.word	0xe7f6100d	! t0_kref+0x370c:   	casxa	[%i0]0x80, %o5, %l3
	.word	0xd1beda59	! t0_kref+0x3710:   	stda	%f8, [%i3 + %i1]0xd2
	.word	0xec06001c	! t0_kref+0x3714:   	ld	[%i0 + %i4], %l6
	.word	0x2c800004	! t0_kref+0x3718:   	bneg,a	_kref+0x3728
	.word	0x9073000c	! t0_kref+0x371c:   	udiv	%o4, %o4, %o0
	.word	0xd248a011	! t0_kref+0x3720:   	ldsb	[%g2 + 0x11], %o1
	.word	0xc807bfe8	! t0_kref+0x3724:   	ld	[%fp - 0x18], %g4
	.word	0xd010a020	! t0_kref+0x3728:   	lduh	[%g2 + 0x20], %o0
	.word	0x23800008	! t0_kref+0x372c:   	fbne,a	_kref+0x374c
	.word	0xd000a008	! t0_kref+0x3730:   	ld	[%g2 + 8], %o0
	.word	0xd826600c	! t0_kref+0x3734:   	st	%o4, [%i1 + 0xc]
	.word	0xab3b400c	! t0_kref+0x3738:   	sra	%o5, %o4, %l5
	.word	0xc9ee100d	! t0_kref+0x373c:   	prefetcha	%i0 + %o5, 4
	.word	0x3d800001	! t0_kref+0x3740:   	fbule,a	_kref+0x3744
	.word	0x97a01891	! t0_kref+0x3744:   	fitos	%f17, %f11
	.word	0x23800002	! t0_kref+0x3748:   	fbne,a	_kref+0x3750
	.word	0x95b3ceed	! t0_kref+0x374c:   	fornot2s	%f15, %f13, %f10
	.word	0xc07f0019	! t0_kref+0x3750:   	swap	[%i4 + %i1], %g0
	.word	0x21480004	! t0_kref+0x3754:   	fbn,a,pt	%fcc0, _kref+0x3764
	.word	0xd448a024	! t0_kref+0x3758:   	ldsb	[%g2 + 0x24], %o2
	.word	0xa3b4cab1	! t0_kref+0x375c:   	fpsub16s	%f19, %f17, %f17
	.word	0xaa7b3565	! t0_kref+0x3760:   	sdiv	%o4, -0xa9b, %l5
	.word	0x91400000	! t0_kref+0x3764:   	mov	%y, %o0
	.word	0x9db00fc0	! t0_kref+0x3768:   	fone	%f14
	.word	0xd7a01019	! t0_kref+0x376c:   	sta	%f11, [%g0 + %i1]0x80
	.word	0x001fffff	! t0_kref+0x3770:   	illtrap	0x1fffff
	.word	0xee0e2016	! t0_kref+0x3774:   	ldub	[%i0 + 0x16], %l7
	.word	0xd51e3ff8	! t0_kref+0x3778:   	ldd	[%i0 - 8], %f10
	.word	0xa3400000	! t0_kref+0x377c:   	mov	%y, %l1
	.word	0xe88e1000	! t0_kref+0x3780:   	lduba	[%i0]0x80, %l4
	.word	0xdd3e401d	! t0_kref+0x3784:   	std	%f14, [%i1 + %i5]
	.word	0xa32b600a	! t0_kref+0x3788:   	sll	%o5, 0xa, %l1
	.word	0xdbe6100c	! t0_kref+0x378c:   	casa	[%i0]0x80, %o4, %o5
	.word	0xec50a024	! t0_kref+0x3790:   	ldsh	[%g2 + 0x24], %l6
	.word	0x86102001	! t0_kref+0x3794:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x3798:   	bne,a	_kref+0x3798
	.word	0x86a0e001	! t0_kref+0x379c:   	subcc	%g3, 1, %g3
	.word	0xa5b28dd0	! t0_kref+0x37a0:   	fnand	%f10, %f16, %f18
	.word	0x9fc10000	! t0_kref+0x37a4:   	call	%g4
	.word	0xa29b22ae	! t0_kref+0x37a8:   	xorcc	%o4, 0x2ae, %l1
	.word	0x35480003	! t0_kref+0x37ac:   	fbue,a,pt	%fcc0, _kref+0x37b8
	.word	0x900b000c	! t0_kref+0x37b0:   	and	%o4, %o4, %o0
	.word	0xee48a02f	! t0_kref+0x37b4:   	ldsb	[%g2 + 0x2f], %l7
	.word	0x21800003	! t0_kref+0x37b8:   	fbn,a	_kref+0x37c4
	.word	0x99a0052e	! t0_kref+0x37bc:   	fsqrts	%f14, %f12
	.word	0xaafb7ada	! t0_kref+0x37c0:   	sdivcc	%o5, -0x526, %l5
	.word	0x96733c48	! t0_kref+0x37c4:   	udiv	%o4, -0x3b8, %o3
	.word	0x81abcab3	! t0_kref+0x37c8:   	fcmpes	%fcc0, %f15, %f19
	.word	0xeade5000	! t0_kref+0x37cc:   	ldxa	[%i1]0x80, %l5
	.word	0xa5b28990	! t0_kref+0x37d0:   	bshuffle	%f10, %f16, %f18
	.word	0xa1a0054e	! t0_kref+0x37d4:   	fsqrtd	%f14, %f16
	.word	0xec1e2010	! t0_kref+0x37d8:   	ldd	[%i0 + 0x10], %l6
	.word	0xd408a002	! t0_kref+0x37dc:   	ldub	[%g2 + 2], %o2
	.word	0xd2000018	! t0_kref+0x37e0:   	ld	[%g0 + %i0], %o1
	.word	0xa8b32eea	! t0_kref+0x37e4:   	orncc	%o4, 0xeea, %l4
	.word	0x95a0188c	! t0_kref+0x37e8:   	fitos	%f12, %f10
	.word	0x151eb46c	! t0_kref+0x37ec:   	sethi	%hi(0x7ad1b000), %o2
	.word	0xe4100018	! t0_kref+0x37f0:   	lduh	[%g0 + %i0], %l2
	.word	0xea50a02c	! t0_kref+0x37f4:   	ldsh	[%g2 + 0x2c], %l5
	.word	0xe608a023	! t0_kref+0x37f8:   	ldub	[%g2 + 0x23], %l3
	.word	0xa7a018d0	! t0_kref+0x37fc:   	fdtos	%f16, %f19
	.word	0xea162000	! t0_kref+0x3800:   	lduh	[%i0], %l5
	.word	0xd53e2008	! t0_kref+0x3804:   	std	%f10, [%i0 + 8]
	.word	0x95a01a2a	! t0_kref+0x3808:   	fstoi	%f10, %f10
	.word	0xaa0b000d	! t0_kref+0x380c:   	and	%o4, %o5, %l5
	.word	0xa533400c	! t0_kref+0x3810:   	srl	%o5, %o4, %l2
	.word	0x93b340ac	! t0_kref+0x3814:   	edge16n	%o5, %o4, %o1
	.word	0xd2df5018	! t0_kref+0x3818:   	ldxa	[%i5 + %i0]0x80, %o1
	.word	0x9fc00004	! t0_kref+0x381c:   	call	%g0 + %g4
	.word	0xa1b28ab2	! t0_kref+0x3820:   	fpsub16s	%f10, %f18, %f16
	.word	0x8143c000	! t0_kref+0x3824:   	stbar
	.word	0xe1be1a1b	! t0_kref+0x3828:   	stda	%f16, [%i0 + %i3]0xd0
	.word	0x86102008	! t0_kref+0x382c:   	mov	0x8, %g3
	.word	0x86a0e001	! t0_kref+0x3830:   	subcc	%g3, 1, %g3
	.word	0x2280001f	! t0_kref+0x3834:   	be,a	_kref+0x38b0
	.word	0xda270019	! t0_kref+0x3838:   	st	%o5, [%i4 + %i1]
	.word	0x9da0012e	! t0_kref+0x383c:   	fabss	%f14, %f14
	.word	0xa8836e9d	! t0_kref+0x3840:   	addcc	%o5, 0xe9d, %l4
	.word	0x34800001	! t0_kref+0x3844:   	bg,a	_kref+0x3848
	.word	0x95a0002a	! t0_kref+0x3848:   	fmovs	%f10, %f10
	.word	0x9da01890	! t0_kref+0x384c:   	fitos	%f16, %f14
	.word	0xfbee501a	! t0_kref+0x3850:   	prefetcha	%i1 + %i2, 29
	.word	0xa53b000c	! t0_kref+0x3854:   	sra	%o4, %o4, %l2
	.word	0x95a0192f	! t0_kref+0x3858:   	fstod	%f15, %f10
	.word	0xaa0361dc	! t0_kref+0x385c:   	add	%o5, 0x1dc, %l5
	.word	0x2f480008	! t0_kref+0x3860:   	fbu,a,pt	%fcc0, _kref+0x3880
	.word	0xa5a00533	! t0_kref+0x3864:   	fsqrts	%f19, %f18
	.word	0x99a0054e	! t0_kref+0x3868:   	fsqrtd	%f14, %f12
	.word	0xa8fb400d	! t0_kref+0x386c:   	sdivcc	%o5, %o5, %l4
	call	SYM(t0_subr1)
	.word	0xe07f0019	! t0_kref+0x3874:   	swap	[%i4 + %i1], %l0
	.word	0xaab33902	! t0_kref+0x3878:   	orncc	%o4, -0x6fe, %l5
	.word	0x922b000c	! t0_kref+0x387c:   	andn	%o4, %o4, %o1
	.word	0x99b40d40	! t0_kref+0x3880:   	fnot1	%f16, %f12
	.word	0xee000018	! t0_kref+0x3884:   	ld	[%g0 + %i0], %l7
	.word	0xec1e2018	! t0_kref+0x3888:   	ldd	[%i0 + 0x18], %l6
	.word	0xa5a01a4c	! t0_kref+0x388c:   	fdtoi	%f12, %f18
	.word	0xdab01019	! t0_kref+0x3890:   	stha	%o5, [%g0 + %i1]0x80
	.word	0xd250a018	! t0_kref+0x3894:   	ldsh	[%g2 + 0x18], %o1
	.word	0x2f800007	! t0_kref+0x3898:   	fbu,a	_kref+0x38b4
	.word	0xd07e200c	! t0_kref+0x389c:   	swap	[%i0 + 0xc], %o0
	.word	0xd6000019	! t0_kref+0x38a0:   	ld	[%g0 + %i1], %o3
	.word	0x960b000d	! t0_kref+0x38a4:   	and	%o4, %o5, %o3
	.word	0xa3a01a52	! t0_kref+0x38a8:   	fdtoi	%f18, %f17
	.word	0xd5200019	! t0_kref+0x38ac:   	st	%f10, [%g0 + %i1]
	.word	0xa5a0054a	! t0_kref+0x38b0:   	fsqrtd	%f10, %f18
	.word	0xa6a32122	! t0_kref+0x38b4:   	subcc	%o4, 0x122, %l3
	.word	0xae8b400c	! t0_kref+0x38b8:   	andcc	%o5, %o4, %l7
	.word	0xda30a03c	! t0_kref+0x38bc:   	sth	%o5, [%g2 + 0x3c]
	call	1f
	.empty
	.word	0x9fa0188c	! t0_kref+0x38c4:   	fitos	%f12, %f15
	.word	0xe206601c	! t0_kref+0x38c8:   	ld	[%i1 + 0x1c], %l1
	.word	0x25800005	! t0_kref+0x38cc:   	fblg,a	_kref+0x38e0
	.word	0x95b00fe0	! t0_kref+0x38d0:   	fones	%f10
1:	.word	0xd900a02c	! t0_kref+0x38d4:   	ld	[%g2 + 0x2c], %f12
	.word	0xd700a030	! t0_kref+0x38d8:   	ld	[%g2 + 0x30], %f11
	.word	0x8143c000	! t0_kref+0x38dc:   	stbar
	.word	0xd8267ff4	! t0_kref+0x38e0:   	st	%o4, [%i1 - 0xc]
	.word	0xa5b28ad0	! t0_kref+0x38e4:   	fpsub32	%f10, %f16, %f18
	.word	0x95a0192f	! t0_kref+0x38e8:   	fstod	%f15, %f10
	.word	0xa263000d	! t0_kref+0x38ec:   	subc	%o4, %o5, %l1
	.word	0x27480007	! t0_kref+0x38f0:   	fbul,a,pt	%fcc0, _kref+0x390c
	.word	0x97b38ab1	! t0_kref+0x38f4:   	fpsub16s	%f14, %f17, %f11
	.word	0xcd0032a4	! t0_kref+0x38f8:   	ld	[%g0 - 0xd5c], %f6
	.word	0xa1a0052b	! t0_kref+0x38fc:   	fsqrts	%f11, %f16
	.word	0x37800004	! t0_kref+0x3900:   	fbge,a	_kref+0x3910
	.word	0x9da0188f	! t0_kref+0x3904:   	fitos	%f15, %f14
	.word	0xad70000d	! t0_kref+0x3908:   	popc	%o5, %l6
	.word	0x99a01a30	! t0_kref+0x390c:   	fstoi	%f16, %f12
	.word	0xa7b28a6b	! t0_kref+0x3910:   	fpadd32s	%f10, %f11, %f19
	.word	0xa27b000d	! t0_kref+0x3914:   	sdiv	%o4, %o5, %l1
	.word	0xef68a047	! t0_kref+0x3918:   	prefetch	%g2 + 0x47, 23
	.word	0xa2c3000d	! t0_kref+0x391c:   	addccc	%o4, %o5, %l1
	.word	0x9da48931	! t0_kref+0x3920:   	fmuls	%f18, %f17, %f14
	.word	0x37480006	! t0_kref+0x3924:   	fbge,a,pt	%fcc0, _kref+0x393c
	.word	0xe11e6008	! t0_kref+0x3928:   	ldd	[%i1 + 8], %f16
	.word	0x95a40952	! t0_kref+0x392c:   	fmuld	%f16, %f18, %f10
	.word	0x92533dd0	! t0_kref+0x3930:   	umul	%o4, -0x230, %o1
	.word	0xdab6501b	! t0_kref+0x3934:   	stha	%o5, [%i1 + %i3]0x80
	.word	0xe06e2005	! t0_kref+0x3938:   	ldstub	[%i0 + 5], %l0
	.word	0xa213400d	! t0_kref+0x393c:   	or	%o5, %o5, %l1
	.word	0xa5b4ca32	! t0_kref+0x3940:   	fpadd16s	%f19, %f18, %f18
	.word	0x908b7a38	! t0_kref+0x3944:   	andcc	%o5, -0x5c8, %o0
	.word	0x94b3400c	! t0_kref+0x3948:   	orncc	%o5, %o4, %o2
	.word	0x8143e040	! t0_kref+0x394c:   	membar	0x40
	.word	0xc368a008	! t0_kref+0x3950:   	prefetch	%g2 + 8, 1
	.word	0xe1be588c	! t0_kref+0x3954:   	stda	%f16, [%i1 + %o4]0xc4
	.word	0x99a01a4c	! t0_kref+0x3958:   	fdtoi	%f12, %f12
	.word	0xee08a036	! t0_kref+0x395c:   	ldub	[%g2 + 0x36], %l7
	.word	0xec00a018	! t0_kref+0x3960:   	ld	[%g2 + 0x18], %l6
	.word	0x2f800008	! t0_kref+0x3964:   	fbu,a	_kref+0x3984
	.word	0xe68e101a	! t0_kref+0x3968:   	lduba	[%i0 + %i2]0x80, %l3
	.word	0xe03e2000	! t0_kref+0x396c:   	std	%l0, [%i0]
	.word	0x3b480001	! t0_kref+0x3970:   	fble,a,pt	%fcc0, _kref+0x3974
	.word	0xe53e4000	! t0_kref+0x3974:   	std	%f18, [%i1]
	.word	0xdda71019	! t0_kref+0x3978:   	sta	%f14, [%i4 + %i1]0x80
	.word	0x900b2d9a	! t0_kref+0x397c:   	and	%o4, 0xd9a, %o0
	.word	0x95a0054c	! t0_kref+0x3980:   	fsqrtd	%f12, %f10
	.word	0x97b2ca2f	! t0_kref+0x3984:   	fpadd16s	%f11, %f15, %f11
	.word	0xad400000	! t0_kref+0x3988:   	mov	%y, %l6
	.word	0x8143c000	! t0_kref+0x398c:   	stbar
	.word	0x81ab8aac	! t0_kref+0x3990:   	fcmpes	%fcc0, %f14, %f12
	.word	0xa88b000d	! t0_kref+0x3994:   	andcc	%o4, %o5, %l4
	.word	0xe51e2018	! t0_kref+0x3998:   	ldd	[%i0 + 0x18], %f18
	.word	0xa5a0052b	! t0_kref+0x399c:   	fsqrts	%f11, %f18
	.word	0xa53b6012	! t0_kref+0x39a0:   	sra	%o5, 0x12, %l2
	.word	0xd1be9a18	! t0_kref+0x39a4:   	stda	%f8, [%i2 + %i0]0xd0
	.word	0xa7a0052e	! t0_kref+0x39a8:   	fsqrts	%f14, %f19
	.word	0xc9ee500d	! t0_kref+0x39ac:   	prefetcha	%i1 + %o5, 4
	.word	0xe2163ff0	! t0_kref+0x39b0:   	lduh	[%i0 - 0x10], %l1
	.word	0xa783400d	! t0_kref+0x39b4:   	wr	%o5, %o5, %gsr
	.word	0xea16c019	! t0_kref+0x39b8:   	lduh	[%i3 + %i1], %l5
	.word	0xaf400000	! t0_kref+0x39bc:   	mov	%y, %l7
	.word	0x942361a2	! t0_kref+0x39c0:   	sub	%o5, 0x1a2, %o2
	.word	0x35800004	! t0_kref+0x39c4:   	fbue,a	_kref+0x39d4
	.word	0xe13e6000	! t0_kref+0x39c8:   	std	%f16, [%i1]
	.word	0xe03e001d	! t0_kref+0x39cc:   	std	%l0, [%i0 + %i5]
	.word	0x9fa01092	! t0_kref+0x39d0:   	fxtos	%f18, %f15
	.word	0xa5a00132	! t0_kref+0x39d4:   	fabss	%f18, %f18
	.word	0x9da018ca	! t0_kref+0x39d8:   	fdtos	%f10, %f14
	.word	0xec1e3ff0	! t0_kref+0x39dc:   	ldd	[%i0 - 0x10], %l6
	.word	0xe400a008	! t0_kref+0x39e0:   	ld	[%g2 + 8], %l2
	.word	0xe51fbea0	! t0_kref+0x39e4:   	ldd	[%fp - 0x160], %f18
	.word	0xe53e401d	! t0_kref+0x39e8:   	std	%f18, [%i1 + %i5]
	.word	0xa5b30200	! t0_kref+0x39ec:   	array8	%o4, %g0, %l2
	.word	0xee0e2005	! t0_kref+0x39f0:   	ldub	[%i0 + 5], %l7
	.word	0x9273000d	! t0_kref+0x39f4:   	udiv	%o4, %o5, %o1
	.word	0xa4b37da4	! t0_kref+0x39f8:   	orncc	%o5, -0x25c, %l2
	.word	0x9ba0052e	! t0_kref+0x39fc:   	fsqrts	%f14, %f13
	.word	0x9db48d40	! t0_kref+0x3a00:   	fnot1	%f18, %f14
	.word	0xa4233beb	! t0_kref+0x3a04:   	sub	%o4, -0x415, %l2
	.word	0xdd00a020	! t0_kref+0x3a08:   	ld	[%g2 + 0x20], %f14
	.word	0xefee501d	! t0_kref+0x3a0c:   	prefetcha	%i1 + %i5, 23
	.word	0xae73000c	! t0_kref+0x3a10:   	udiv	%o4, %o4, %l7
	.word	0xee064000	! t0_kref+0x3a14:   	ld	[%i1], %l7
	.word	0xa5a00552	! t0_kref+0x3a18:   	fsqrtd	%f18, %f18
	.word	0x3b480005	! t0_kref+0x3a1c:   	fble,a,pt	%fcc0, _kref+0x3a30
	.word	0xee40a018	! t0_kref+0x3a20:   	ldsw	[%g2 + 0x18], %l7
	.word	0xffee101d	! t0_kref+0x3a24:   	prefetcha	%i0 + %i5, 31
	.word	0xa6c37e13	! t0_kref+0x3a28:   	addccc	%o5, -0x1ed, %l3
	.word	0xe6881019	! t0_kref+0x3a2c:   	lduba	[%g0 + %i1]0x80, %l3
	.word	0xd9be588d	! t0_kref+0x3a30:   	stda	%f12, [%i1 + %o5]0xc4
	.word	0xee4e401a	! t0_kref+0x3a34:   	ldsb	[%i1 + %i2], %l7
	.word	0x9473400d	! t0_kref+0x3a38:   	udiv	%o5, %o5, %o2
	.word	0x9ba308b3	! t0_kref+0x3a3c:   	fsubs	%f12, %f19, %f13
	.word	0x30480002	! t0_kref+0x3a40:   	ba,a,pt	%icc, _kref+0x3a48
	.word	0xad400000	! t0_kref+0x3a44:   	mov	%y, %l6
	.word	0x9fc10000	! t0_kref+0x3a48:   	call	%g4
	.word	0x95a00550	! t0_kref+0x3a4c:   	fsqrtd	%f16, %f10
	.word	0xd60e401a	! t0_kref+0x3a50:   	ldub	[%i1 + %i2], %o3
	.word	0xe4de1000	! t0_kref+0x3a54:   	ldxa	[%i0]0x80, %l2
	.word	0xf16e2000	! t0_kref+0x3a58:   	prefetch	%i0, 24
	.word	0x95a48852	! t0_kref+0x3a5c:   	faddd	%f18, %f18, %f10
	.word	0x39480007	! t0_kref+0x3a60:   	fbuge,a,pt	%fcc0, _kref+0x3a7c
	.word	0xa1a4c930	! t0_kref+0x3a64:   	fmuls	%f19, %f16, %f16
	.word	0xa7a3c82b	! t0_kref+0x3a68:   	fadds	%f15, %f11, %f19
	.word	0x99a00552	! t0_kref+0x3a6c:   	fsqrtd	%f18, %f12
	.word	0xe27e7ff8	! t0_kref+0x3a70:   	swap	[%i1 - 8], %l1
	.word	0xe66e7fe4	! t0_kref+0x3a74:   	ldstub	[%i1 - 0x1c], %l3
	.word	0xe51fbe28	! t0_kref+0x3a78:   	ldd	[%fp - 0x1d8], %f18
	.word	0x81aa8a30	! t0_kref+0x3a7c:   	fcmps	%fcc0, %f10, %f16
	.word	0x2a480008	! t0_kref+0x3a80:   	bcs,a,pt	%icc, _kref+0x3aa0
	.word	0x9ba0188b	! t0_kref+0x3a84:   	fitos	%f11, %f13
	.word	0x92b3000d	! t0_kref+0x3a88:   	orncc	%o4, %o5, %o1
	.word	0x909b000d	! t0_kref+0x3a8c:   	xorcc	%o4, %o5, %o0
	.word	0xa1a289d2	! t0_kref+0x3a90:   	fdivd	%f10, %f18, %f16
	.word	0xa5b00cf0	! t0_kref+0x3a94:   	fnot2s	%f16, %f18
	.word	0xc807bfe4	! t0_kref+0x3a98:   	ld	[%fp - 0x1c], %g4
	.word	0xe8400018	! t0_kref+0x3a9c:   	ldsw	[%g0 + %i0], %l4
	.word	0x96736b55	! t0_kref+0x3aa0:   	udiv	%o5, 0xb55, %o3
	.word	0x91b3010d	! t0_kref+0x3aa4:   	edge32	%o4, %o5, %o0
	.word	0x99a4894a	! t0_kref+0x3aa8:   	fmuld	%f18, %f10, %f12
	.word	0x99a00552	! t0_kref+0x3aac:   	fsqrtd	%f18, %f12
	.word	0xa5b30f8e	! t0_kref+0x3ab0:   	for	%f12, %f14, %f18
	.word	0xaf2b200b	! t0_kref+0x3ab4:   	sll	%o4, 0xb, %l7
	.word	0x81834000	! t0_kref+0x3ab8:   	wr	%o5, %g0, %y
	.word	0xd8b6d018	! t0_kref+0x3abc:   	stha	%o4, [%i3 + %i0]0x80
	.word	0x81ac0ab0	! t0_kref+0x3ac0:   	fcmpes	%fcc0, %f16, %f16
	.word	0xee6e7fff	! t0_kref+0x3ac4:   	ldstub	[%i1 - 1], %l7
	.word	0x35480004	! t0_kref+0x3ac8:   	fbue,a,pt	%fcc0, _kref+0x3ad8
	.word	0x81834000	! t0_kref+0x3acc:   	wr	%o5, %g0, %y
	.word	0xaca326a9	! t0_kref+0x3ad0:   	subcc	%o4, 0x6a9, %l6
	.word	0x99a0104c	! t0_kref+0x3ad4:   	fdtox	%f12, %f12
	.word	0x99a0002b	! t0_kref+0x3ad8:   	fmovs	%f11, %f12
	.word	0x81580000	! t0_kref+0x3adc:   	flushw
	.word	0xd26e3ffd	! t0_kref+0x3ae0:   	ldstub	[%i0 - 3], %o1
	.word	0x31480006	! t0_kref+0x3ae4:   	fba,a,pt	%fcc0, _kref+0x3afc
	.word	0xe03f4019	! t0_kref+0x3ae8:   	std	%l0, [%i5 + %i1]
	.word	0x20800004	! t0_kref+0x3aec:   	bn,a	_kref+0x3afc
	.word	0xd91e3fe0	! t0_kref+0x3af0:   	ldd	[%i0 - 0x20], %f12
	.word	0xe120a014	! t0_kref+0x3af4:   	st	%f16, [%g2 + 0x14]
	.word	0xe648a021	! t0_kref+0x3af8:   	ldsb	[%g2 + 0x21], %l3
	.word	0xa8633261	! t0_kref+0x3afc:   	subc	%o4, -0xd9f, %l4
	.word	0xd416001b	! t0_kref+0x3b00:   	lduh	[%i0 + %i3], %o2
	.word	0xa1b40ab2	! t0_kref+0x3b04:   	fpsub16s	%f16, %f18, %f16
	.word	0x83414000	! t0_kref+0x3b08:   	mov	%pc, %g1
	.word	0xaac3000d	! t0_kref+0x3b0c:   	addccc	%o4, %o5, %l5
	.word	0x8143e039	! t0_kref+0x3b10:   	membar	0x39
	.word	0x001fffff	! t0_kref+0x3b14:   	illtrap	0x1fffff
	.word	0x95a3894a	! t0_kref+0x3b18:   	fmuld	%f14, %f10, %f10
	.word	0xda28a03b	! t0_kref+0x3b1c:   	stb	%o5, [%g2 + 0x3b]
	.word	0xabb3010d	! t0_kref+0x3b20:   	edge32	%o4, %o5, %l5
	.word	0x8143c000	! t0_kref+0x3b24:   	stbar
	.word	0xc807bfe8	! t0_kref+0x3b28:   	ld	[%fp - 0x18], %g4
	.word	0xe1067ff0	! t0_kref+0x3b2c:   	ld	[%i1 - 0x10], %f16
	.word	0xa86326d5	! t0_kref+0x3b30:   	subc	%o4, 0x6d5, %l4
	.word	0x38800002	! t0_kref+0x3b34:   	bgu,a	_kref+0x3b3c
	.word	0x95400000	! t0_kref+0x3b38:   	mov	%y, %o2
	.word	0xee4e201b	! t0_kref+0x3b3c:   	ldsb	[%i0 + 0x1b], %l7
	.word	0xa1a00552	! t0_kref+0x3b40:   	fsqrtd	%f18, %f16
	.word	0xa1a01931	! t0_kref+0x3b44:   	fstod	%f17, %f16
	.word	0xabb3400d	! t0_kref+0x3b48:   	edge8	%o5, %o5, %l5
	.word	0xd5000018	! t0_kref+0x3b4c:   	ld	[%g0 + %i0], %f10
	.word	0xa3a0052f	! t0_kref+0x3b50:   	fsqrts	%f15, %f17
	.word	0xd5b81018	! t0_kref+0x3b54:   	stda	%f10, [%g0 + %i0]0x80
	.word	0x81ac4ab2	! t0_kref+0x3b58:   	fcmpes	%fcc0, %f17, %f18
	.word	0x97a34830	! t0_kref+0x3b5c:   	fadds	%f13, %f16, %f11
	.word	0xe53f4019	! t0_kref+0x3b60:   	std	%f18, [%i5 + %i1]
	.word	0xa1a0110e	! t0_kref+0x3b64:   	fxtod	%f14, %f16
	.word	0xe27e0000	! t0_kref+0x3b68:   	swap	[%i0], %l1
	.word	0x81ac8a31	! t0_kref+0x3b6c:   	fcmps	%fcc0, %f18, %f17
	.word	0xa5b28d92	! t0_kref+0x3b70:   	fxor	%f10, %f18, %f18
	.word	0xa5a28852	! t0_kref+0x3b74:   	faddd	%f10, %f18, %f18
	.word	0x35480003	! t0_kref+0x3b78:   	fbue,a,pt	%fcc0, _kref+0x3b84
	.word	0xaa9b400d	! t0_kref+0x3b7c:   	xorcc	%o5, %o5, %l5
	.word	0x81b01027	! t0_kref+0x3b80:   	siam	0x7
	.word	0xd826401c	! t0_kref+0x3b84:   	st	%o4, [%i1 + %i4]
	.word	0x99a00552	! t0_kref+0x3b88:   	fsqrtd	%f18, %f12
	.word	0x29480003	! t0_kref+0x3b8c:   	fbl,a,pt	%fcc0, _kref+0x3b98
	.word	0x903379cd	! t0_kref+0x3b90:   	orn	%o5, -0x633, %o0
	.word	0x9ba0002d	! t0_kref+0x3b94:   	fmovs	%f13, %f13
	.word	0x8143c000	! t0_kref+0x3b98:   	stbar
	.word	0xfdee101c	! t0_kref+0x3b9c:   	prefetcha	%i0 + %i4, 30
	.word	0x95a4c92e	! t0_kref+0x3ba0:   	fmuls	%f19, %f14, %f10
	.word	0xea6e8018	! t0_kref+0x3ba4:   	ldstub	[%i2 + %i0], %l5
	.word	0xe848a037	! t0_kref+0x3ba8:   	ldsb	[%g2 + 0x37], %l4
	.word	0x81daa3f7	! t0_kref+0x3bac:   	flush	%o2 + 0x3f7
	.word	0xa2b32a6a	! t0_kref+0x3bb0:   	orncc	%o4, 0xa6a, %l1
	.word	0xd47e7ff0	! t0_kref+0x3bb4:   	swap	[%i1 - 0x10], %o2
	.word	0xa7a01a52	! t0_kref+0x3bb8:   	fdtoi	%f18, %f19
	.word	0xe800a010	! t0_kref+0x3bbc:   	ld	[%g2 + 0x10], %l4
	.word	0xa3408000	! t0_kref+0x3bc0:   	mov	%ccr, %l1
	.word	0xc768a08e	! t0_kref+0x3bc4:   	prefetch	%g2 + 0x8e, 3
	.word	0xac73400d	! t0_kref+0x3bc8:   	udiv	%o5, %o5, %l6
	.word	0xe6d81019	! t0_kref+0x3bcc:   	ldxa	[%g0 + %i1]0x80, %l3
	.word	0xd830a004	! t0_kref+0x3bd0:   	sth	%o4, [%g2 + 4]
	.word	0xd0066000	! t0_kref+0x3bd4:   	ld	[%i1], %o0
	.word	0x9da0052b	! t0_kref+0x3bd8:   	fsqrts	%f11, %f14
	.word	0x95a018ca	! t0_kref+0x3bdc:   	fdtos	%f10, %f10
	.word	0xec08a035	! t0_kref+0x3be0:   	ldub	[%g2 + 0x35], %l6
	.word	0x96737371	! t0_kref+0x3be4:   	udiv	%o5, -0xc8f, %o3
	.word	0xec1e2018	! t0_kref+0x3be8:   	ldd	[%i0 + 0x18], %l6
	.word	0x21480002	! t0_kref+0x3bec:   	fbn,a,pt	%fcc0, _kref+0x3bf4
	.word	0x953b400c	! t0_kref+0x3bf0:   	sra	%o5, %o4, %o2
	.word	0x9013400c	! t0_kref+0x3bf4:   	or	%o5, %o4, %o0
	.word	0xa1a01931	! t0_kref+0x3bf8:   	fstod	%f17, %f16
	.word	0xeade101d	! t0_kref+0x3bfc:   	ldxa	[%i0 + %i5]0x80, %l5
	.word	0x9db28d8e	! t0_kref+0x3c00:   	fxor	%f10, %f14, %f14
	.word	0x9da44833	! t0_kref+0x3c04:   	fadds	%f17, %f19, %f14
	.word	0xdd1fbc38	! t0_kref+0x3c08:   	ldd	[%fp - 0x3c8], %f14
	.word	0xa263000d	! t0_kref+0x3c0c:   	subc	%o4, %o5, %l1
	.word	0xec4e0000	! t0_kref+0x3c10:   	ldsb	[%i0], %l6
	.word	0x33480005	! t0_kref+0x3c14:   	fbe,a,pt	%fcc0, _kref+0x3c28
	.word	0xec7e3fe0	! t0_kref+0x3c18:   	swap	[%i0 - 0x20], %l6
	.word	0x9fa44831	! t0_kref+0x3c1c:   	fadds	%f17, %f17, %f15
	.word	0xa3a4c932	! t0_kref+0x3c20:   	fmuls	%f19, %f18, %f17
	.word	0xe01e2018	! t0_kref+0x3c24:   	ldd	[%i0 + 0x18], %l0
	.word	0xa92b000d	! t0_kref+0x3c28:   	sll	%o4, %o5, %l4
	.word	0xe81f4019	! t0_kref+0x3c2c:   	ldd	[%i5 + %i1], %l4
	.word	0x3a800002	! t0_kref+0x3c30:   	bcc,a	_kref+0x3c38
	.word	0xa7b300ad	! t0_kref+0x3c34:   	edge16n	%o4, %o5, %l3
	.word	0x34800003	! t0_kref+0x3c38:   	bg,a	_kref+0x3c44
	.word	0xf36e401b	! t0_kref+0x3c3c:   	prefetch	%i1 + %i3, 25
	call	SYM(t0_subr1)
	.word	0xe11e0000	! t0_kref+0x3c44:   	ldd	[%i0], %f16
	.word	0xaf232839	! t0_kref+0x3c48:   	mulscc	%o4, 0x839, %l7
	.word	0xa833400c	! t0_kref+0x3c4c:   	orn	%o5, %o4, %l4
	.word	0xabb38592	! t0_kref+0x3c50:   	fcmpgt32	%f14, %f18, %l5
	.word	0xd06e3fe6	! t0_kref+0x3c54:   	ldstub	[%i0 - 0x1a], %o0
	.word	0x99a2894e	! t0_kref+0x3c58:   	fmuld	%f10, %f14, %f12
	.word	0xe650a038	! t0_kref+0x3c5c:   	ldsh	[%g2 + 0x38], %l3
	.word	0x99a0054e	! t0_kref+0x3c60:   	fsqrtd	%f14, %f12
	.word	0xa3a018ce	! t0_kref+0x3c64:   	fdtos	%f14, %f17
	.word	0xe51e3fe8	! t0_kref+0x3c68:   	ldd	[%i0 - 0x18], %f18
	.word	0x97b007ae	! t0_kref+0x3c6c:   	fpackfix	%f14, %f11
	.word	0xe500a038	! t0_kref+0x3c70:   	ld	[%g2 + 0x38], %f18
	.word	0x9413000d	! t0_kref+0x3c74:   	or	%o4, %o5, %o2
	.word	0xe878a03c	! t0_kref+0x3c78:   	swap	[%g2 + 0x3c], %l4
	.word	0xa5a488d0	! t0_kref+0x3c7c:   	fsubd	%f18, %f16, %f18
	.word	0xa813000c	! t0_kref+0x3c80:   	or	%o4, %o4, %l4
	.word	0xaafb000d	! t0_kref+0x3c84:   	sdivcc	%o4, %o5, %l5
	.word	0xd5267ffc	! t0_kref+0x3c88:   	st	%f10, [%i1 - 4]
	.word	0xae13226f	! t0_kref+0x3c8c:   	or	%o4, 0x26f, %l7
	.word	0xa413783d	! t0_kref+0x3c90:   	or	%o5, -0x7c3, %l2
	.word	0x21480007	! t0_kref+0x3c94:   	fbn,a,pt	%fcc0, _kref+0x3cb0
	.word	0xd04e6014	! t0_kref+0x3c98:   	ldsb	[%i1 + 0x14], %o0
	.word	0x97a00030	! t0_kref+0x3c9c:   	fmovs	%f16, %f11
	.word	0x9273000d	! t0_kref+0x3ca0:   	udiv	%o4, %o5, %o1
	.word	0xe120a004	! t0_kref+0x3ca4:   	st	%f16, [%g2 + 4]
	.word	0x9423000c	! t0_kref+0x3ca8:   	sub	%o4, %o4, %o2
	.word	0x81aa8a4a	! t0_kref+0x3cac:   	fcmpd	%fcc0, %f10, %f10
	.word	0x95b4896a	! t0_kref+0x3cb0:   	fpmerge	%f18, %f10, %f10
	.word	0xae1b7e89	! t0_kref+0x3cb4:   	xor	%o5, -0x177, %l7
	.word	0x95b2866c	! t0_kref+0x3cb8:   	fmul8x16au	%f10, %f12, %f10
	.word	0xa1b4c72b	! t0_kref+0x3cbc:   	fmuld8ulx16	%f19, %f11, %f16
	.word	0xaab3400d	! t0_kref+0x3cc0:   	orncc	%o5, %o5, %l5
	.word	0xd050a022	! t0_kref+0x3cc4:   	ldsh	[%g2 + 0x22], %o0
	.word	0xe1be9a18	! t0_kref+0x3cc8:   	stda	%f16, [%i2 + %i0]0xd0
	.word	0xe24e6017	! t0_kref+0x3ccc:   	ldsb	[%i1 + 0x17], %l1
	.word	0xe1be180c	! t0_kref+0x3cd0:   	stda	%f16, [%i0 + %o4]0xc0
	.word	0xe40831cf	! t0_kref+0x3cd4:   	ldub	[%g0 - 0xe31], %l2
	.word	0xd828a021	! t0_kref+0x3cd8:   	stb	%o4, [%g2 + 0x21]
	.word	0xa7b44f6d	! t0_kref+0x3cdc:   	fornot1s	%f17, %f13, %f19
	.word	0xf5ee101d	! t0_kref+0x3ce0:   	prefetcha	%i0 + %i5, 26
	.word	0xd050a016	! t0_kref+0x3ce4:   	ldsh	[%g2 + 0x16], %o0
	.word	0xa3b28a6e	! t0_kref+0x3ce8:   	fpadd32s	%f10, %f14, %f17
	.word	0xe650a036	! t0_kref+0x3cec:   	ldsh	[%g2 + 0x36], %l3
	.word	0x9693000d	! t0_kref+0x3cf0:   	orcc	%o4, %o5, %o3
	.word	0x8143c000	! t0_kref+0x3cf4:   	stbar
	.word	0xe03e6000	! t0_kref+0x3cf8:   	std	%l0, [%i1]
	.word	0xd9180018	! t0_kref+0x3cfc:   	ldd	[%g0 + %i0], %f12
	.word	0x86102003	! t0_kref+0x3d00:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x3d04:   	bne,a	_kref+0x3d04
	.word	0x86a0e001	! t0_kref+0x3d08:   	subcc	%g3, 1, %g3
	.word	0xe51e2008	! t0_kref+0x3d0c:   	ldd	[%i0 + 8], %f18
	.word	0xe51e6008	! t0_kref+0x3d10:   	ldd	[%i1 + 8], %f18
	.word	0xdb06200c	! t0_kref+0x3d14:   	ld	[%i0 + 0xc], %f13
	.word	0xd68e101a	! t0_kref+0x3d18:   	lduba	[%i0 + %i2]0x80, %o3
	.word	0xd8f01019	! t0_kref+0x3d1c:   	stxa	%o4, [%g0 + %i1]0x80
	.word	0xb610201a	! t0_kref+0x3d20:   	mov	0x1a, %i3
	.word	0xd1be180d	! t0_kref+0x3d24:   	stda	%f8, [%i0 + %o5]0xc0
	.word	0xa6d3400d	! t0_kref+0x3d28:   	umulcc	%o5, %o5, %l3
	.word	0xe03e001d	! t0_kref+0x3d2c:   	std	%l0, [%i0 + %i5]
	.word	0xa1a00033	! t0_kref+0x3d30:   	fmovs	%f19, %f16
	.word	0x9003000c	! t0_kref+0x3d34:   	add	%o4, %o4, %o0
	.word	0xec1e0000	! t0_kref+0x3d38:   	ldd	[%i0], %l6
	.word	0x9463400c	! t0_kref+0x3d3c:   	subc	%o5, %o4, %o2
	.word	0xa1a0054c	! t0_kref+0x3d40:   	fsqrtd	%f12, %f16
	.word	0xa5400000	! t0_kref+0x3d44:   	mov	%y, %l2
	.word	0xe36e3fe8	! t0_kref+0x3d48:   	prefetch	%i0 - 0x18, 17
	.word	0x87802082	! t0_kref+0x3d4c:   	mov	0x82, %asi
	.word	0xd408a000	! t0_kref+0x3d50:   	ldub	[%g2], %o2
	.word	0xe03e2008	! t0_kref+0x3d54:   	std	%l0, [%i0 + 8]
	.word	0x81834000	! t0_kref+0x3d58:   	wr	%o5, %g0, %y
	.word	0xaa836f11	! t0_kref+0x3d5c:   	addcc	%o5, 0xf11, %l5
	.word	0xae33000d	! t0_kref+0x3d60:   	orn	%o4, %o5, %l7
	.word	0xd51fbf80	! t0_kref+0x3d64:   	ldd	[%fp - 0x80], %f10
	.word	0x99b48a10	! t0_kref+0x3d68:   	fpadd16	%f18, %f16, %f12
	.word	0xa72b2004	! t0_kref+0x3d6c:   	sll	%o4, 0x4, %l3
	.word	0x2b480008	! t0_kref+0x3d70:   	fbug,a,pt	%fcc0, _kref+0x3d90
	.word	0xadb30240	! t0_kref+0x3d74:   	array16	%o4, %g0, %l6
	.word	0x9fc10000	! t0_kref+0x3d78:   	call	%g4
	.word	0xdd1e2008	! t0_kref+0x3d7c:   	ldd	[%i0 + 8], %f14
	.word	0x8d8363bb	! t0_kref+0x3d80:   	wr	%o5, 0x3bb, %fprs
	.word	0x21480004	! t0_kref+0x3d84:   	fbn,a,pt	%fcc0, _kref+0x3d94
	.word	0x932b000c	! t0_kref+0x3d88:   	sll	%o4, %o4, %o1
	.word	0x97a0052f	! t0_kref+0x3d8c:   	fsqrts	%f15, %f11
	.word	0x9da3c82a	! t0_kref+0x3d90:   	fadds	%f15, %f10, %f14
	.word	0x878020d0	! t0_kref+0x3d94:   	mov	0xd0, %asi
	.word	0x3b800007	! t0_kref+0x3d98:   	fble,a	_kref+0x3db4
	.word	0xe41e7ff8	! t0_kref+0x3d9c:   	ldd	[%i1 - 8], %l2
	.word	0x913b6016	! t0_kref+0x3da0:   	sra	%o5, 0x16, %o0
	.word	0xe408a00e	! t0_kref+0x3da4:   	ldub	[%g2 + 0xe], %l2
	.word	0xa5b48992	! t0_kref+0x3da8:   	bshuffle	%f18, %f18, %f18
	.word	0x95b340ec	! t0_kref+0x3dac:   	edge16ln	%o5, %o4, %o2
	.word	0x94137585	! t0_kref+0x3db0:   	or	%o5, -0xa7b, %o2
	.word	0xdb264000	! t0_kref+0x3db4:   	st	%f13, [%i1]
	.word	0x28800007	! t0_kref+0x3db8:   	bleu,a	_kref+0x3dd4
	.word	0xc56e6010	! t0_kref+0x3dbc:   	prefetch	%i1 + 0x10, 2
	.word	0xaf0b660b	! t0_kref+0x3dc0:   	tsubcc	%o5, 0x60b, %l7
	.word	0x8143c000	! t0_kref+0x3dc4:   	stbar
	.word	0x95b3034d	! t0_kref+0x3dc8:   	alignaddrl	%o4, %o5, %o2
	.word	0x81aa8a4e	! t0_kref+0x3dcc:   	fcmpd	%fcc0, %f10, %f14
	.word	0x9ba01a52	! t0_kref+0x3dd0:   	fdtoi	%f18, %f13
	.word	0xa1a488cc	! t0_kref+0x3dd4:   	fsubd	%f18, %f12, %f16
	.word	0x9033400d	! t0_kref+0x3dd8:   	orn	%o5, %o5, %o0
	.word	0x38800002	! t0_kref+0x3ddc:   	bgu,a	_kref+0x3de4
	.word	0xd91e001d	! t0_kref+0x3de0:   	ldd	[%i0 + %i5], %f12
	.word	0xd408a02a	! t0_kref+0x3de4:   	ldub	[%g2 + 0x2a], %o2
	.word	0xd830a028	! t0_kref+0x3de8:   	sth	%o4, [%g2 + 0x28]
	.word	0xa3a00532	! t0_kref+0x3dec:   	fsqrts	%f18, %f17
	.word	0xd248a00c	! t0_kref+0x3df0:   	ldsb	[%g2 + 0xc], %o1
	.word	0xd93e3fe8	! t0_kref+0x3df4:   	std	%f12, [%i0 - 0x18]
	.word	0xa1a00530	! t0_kref+0x3df8:   	fsqrts	%f16, %f16
	.word	0x20480003	! t0_kref+0x3dfc:   	bn,a,pt	%icc, _kref+0x3e08
	.word	0x99b48acc	! t0_kref+0x3e00:   	fpsub32	%f18, %f12, %f12
	.word	0xd51fbf38	! t0_kref+0x3e04:   	ldd	[%fp - 0xc8], %f10
	.word	0xc7ee500c	! t0_kref+0x3e08:   	prefetcha	%i1 + %o4, 3
	.word	0xe03e001d	! t0_kref+0x3e0c:   	std	%l0, [%i0 + %i5]
	.word	0xaf3b6017	! t0_kref+0x3e10:   	sra	%o5, 0x17, %l7
	.word	0xab2b6014	! t0_kref+0x3e14:   	sll	%o5, 0x14, %l5
	.word	0xe206200c	! t0_kref+0x3e18:   	ld	[%i0 + 0xc], %l1
	.word	0x93400000	! t0_kref+0x3e1c:   	mov	%y, %o1
	.word	0xdd1fbe60	! t0_kref+0x3e20:   	ldd	[%fp - 0x1a0], %f14
	.word	0xa1a4894a	! t0_kref+0x3e24:   	fmuld	%f18, %f10, %f16
	.word	0xa473000d	! t0_kref+0x3e28:   	udiv	%o4, %o5, %l2
	.word	0x81b01022	! t0_kref+0x3e2c:   	siam	0x2
	.word	0x91b3000d	! t0_kref+0x3e30:   	edge8	%o4, %o5, %o0
	.word	0xe6167fe0	! t0_kref+0x3e34:   	lduh	[%i1 - 0x20], %l3
	.word	0xa3b340ed	! t0_kref+0x3e38:   	edge16ln	%o5, %o5, %l1
	.word	0xa7a018ce	! t0_kref+0x3e3c:   	fdtos	%f14, %f19
	.word	0xa4fb2aa2	! t0_kref+0x3e40:   	sdivcc	%o4, 0xaa2, %l2
	.word	0xa2ab7835	! t0_kref+0x3e44:   	andncc	%o5, -0x7cb, %l1
	.word	0xafb3416d	! t0_kref+0x3e48:   	edge32ln	%o5, %o5, %l7
	.word	0xa7a01a4a	! t0_kref+0x3e4c:   	fdtoi	%f10, %f19
	.word	0xa1a4882f	! t0_kref+0x3e50:   	fadds	%f18, %f15, %f16
	.word	0x9bb007aa	! t0_kref+0x3e54:   	fpackfix	%f10, %f13
	.word	0xaa8b000c	! t0_kref+0x3e58:   	andcc	%o4, %o4, %l5
	.word	0xa433265f	! t0_kref+0x3e5c:   	orn	%o4, 0x65f, %l2
	.word	0x9063400d	! t0_kref+0x3e60:   	subc	%o5, %o5, %o0
	.word	0xe03e4000	! t0_kref+0x3e64:   	std	%l0, [%i1]
	.word	0x22800008	! t0_kref+0x3e68:   	be,a	_kref+0x3e88
	.word	0xd8200019	! t0_kref+0x3e6c:   	st	%o4, [%g0 + %i1]
	.word	0xd610a018	! t0_kref+0x3e70:   	lduh	[%g2 + 0x18], %o3
	.word	0xda266008	! t0_kref+0x3e74:   	st	%o5, [%i1 + 8]
	.word	0x97a01a4c	! t0_kref+0x3e78:   	fdtoi	%f12, %f11
	.word	0xea08a01e	! t0_kref+0x3e7c:   	ldub	[%g2 + 0x1e], %l5
	.word	0x01000000	! t0_kref+0x3e80:   	nop
	.word	0x01000000	! t0_kref+0x3e84:   	nop
	call	SYM(_kaos_done)
	.word	0x01000000	! t0_kref+0x3e8c:   	nop
	KGLOBAL(t0_ktbl_end)
t0_ktbl_end:
t0_ktbl_page_end:

KTEXT_MODULE(t0_module_subr0, 0x4d580000)
.seg "text"
t0_subr0_page_begin:
	.skip 8192
.global _t0_subr0; ENTRY(t0_subr0)
	.word	0xa6844012	! t0_subr0+0x0:   	addcc	%l1, %l2, %l3
	.word	0x81c3e008	! t0_subr0+0x4:   	retl
	.word	0xaa64c014	! t0_subr0+0x8:   	subc	%l3, %l4, %l5
t0_subr0_page_end:

KTEXT_MODULE(t0_module_subr1, 0x0d2da000)
.seg "text"
t0_subr1_page_begin:
	.skip 8192
.global _t0_subr1; ENTRY(t0_subr1)
	.word	0x9de3bfa0	! t0_subr1+0x0:   	save	%sp, -0x60, %sp
	.word	0xb29eaa5a	! t0_subr1+0x4:   	xorcc	%i2, 0xa5a, %i1
	.word	0x81c7e008	! t0_subr1+0x8:   	ret
	.word	0xa7ee6001	! t0_subr1+0xc:   	restore	%i1, 1, %l3
t0_subr1_page_end:

KTEXT_MODULE(t0_module_subr2, 0x1e504000)
.seg "text"
t0_subr2_page_begin:
	.skip 8192
.global _t0_subr2; ENTRY(t0_subr2)
	.word	0x9de3bfa0	! t0_subr2+0x0:   	save	%sp, -0x60, %sp
	.word	0xb2066001	! t0_subr2+0x4:   	add	%i1, 1, %i1
	.word	0x81c7e008	! t0_subr2+0x8:   	ret
	.word	0xa3ee6001	! t0_subr2+0xc:   	restore	%i1, 1, %l1
t0_subr2_page_end:

KTEXT_MODULE(t0_module_subr3, 0x0ddc0000)
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
!  Total operations: 3915  
!
!  Operation frequencies
!
!  name               exp    obs
!  ldsb              1.43   1.61
!  ldub              1.42   1.46
!  ldsh              0.06   0.05
!  lduh              0.87   1.10
!  ld                1.24   1.40
!  ldd               1.43   1.51
!  swap              1.20   1.02
!  ldstub            1.05   0.97
!  stb               0.12   0.23
!  sth               0.11   0.18
!  st                1.27   1.17
!  std               1.08   1.12
!  add               0.44   0.51
!  addcc             0.26   0.33
!  addx              0.18   0.05
!  addxcc            0.70   0.82
!  taddcc            0.17   0.18
!  taddcctv          0.02   0.00
!  sub               0.29   0.43
!  subcc             0.71   0.84
!  subx              1.22   1.51
!  subxcc            0.03   0.05
!  tsubcc            0.18   0.10
!  tsubcctv          0.25   0.15
!  mulscc            0.41   0.23
!  and               0.88   0.84
!  andcc             0.49   0.46
!  andn              0.28   0.26
!  andncc            0.16   0.18
!  or                1.20   1.63
!  orcc              0.84   0.92
!  orn               0.48   0.61
!  orncc             1.26   1.51
!  xor               0.29   0.23
!  xorcc             1.22   1.07
!  xnor              0.06   0.00
!  xnorcc            0.01   0.00
!  sll               1.45   1.76
!  srl               0.35   0.33
!  sra               1.27   1.33
!  unimp             0.09   0.13
!  umul              0.34   0.33
!  smul              0.03   0.00
!  udiv              1.17   1.30
!  sdiv              0.39   0.43
!  umulcc            0.18   0.18
!  smulcc            0.12   0.08
!  udivcc            0.27   0.31
!  sdivcc            0.87   1.10
!  rdy               1.05   1.23
!  wry               0.62   0.46
!  bicc              1.69   1.76
!  sethi             0.13   0.08
!  jmpl              1.13   1.07
!  call              0.20   0.20
!  ticc              0.00   0.00
!  flush             0.72   0.79
!  save              0.71   0.56
!  restore           1.44   0.00
!  stbar             0.55   0.84
!  ldf               0.23   0.33
!  lddf              1.39   1.51
!  stf               0.10   0.13
!  stdf              1.13   1.33
!  fadds             1.40   1.30
!  fsubs             0.55   0.51
!  fmuls             1.03   1.33
!  fdivs             0.01   0.03
!  faddd             0.85   0.79
!  fsubd             0.52   0.56
!  fmuld             0.65   0.92
!  fdivd             0.16   0.08
!  faddq             0.00   0.00
!  fsubq             0.00   0.00
!  fmulq             0.00   0.00
!  fdivq             0.00   0.00
!  fsmuld            0.25   0.38
!  fdmulq            0.00   0.00
!  fitos             0.87   1.07
!  fitod             0.05   0.03
!  fitoq             0.00   0.00
!  fstoi             0.51   0.31
!  fstod             0.43   0.31
!  fstoq             0.00   0.00
!  fdtoi             1.01   1.07
!  fdtos             0.72   0.77
!  fdtoq             0.00   0.00
!  fqtoi             0.00   0.00
!  fqtos             0.00   0.00
!  fqtod             0.00   0.00
!  fmovs             0.83   0.74
!  fnegs             0.28   0.33
!  fabss             0.18   0.13
!  fsqrts            1.98   2.32
!  fsqrtd            2.61   2.94
!  fsqrtq            0.00   0.00
!  fcmps             0.55   0.43
!  fcmpd             0.36   0.31
!  fcmpq             0.00   0.00
!  fcmpes            1.07   1.07
!  fcmped            0.04   0.08
!  fcmpeq            0.00   0.00
!  fbfcc             3.21   3.12
!  ldfsr             0.09   0.00
!  stfsr             0.05   0.03
!  loop              0.92   0.69
!  offset            0.26   0.15
!  area              0.07   0.03
!  target            0.15   0.23
!  goto              0.16   0.08
!  sigsegv           0.24   0.38
!  sigbus            0.04   0.00
!  imodify           0.00   0.00
!  ldfsr_offset      0.26   0.00
!  fpattern          1.17   1.30
!  lbranch           0.02   0.03
!  shmld             5.36   5.72
!  shmst             1.25   1.15
!  shmpf             0.81   0.69
!  shmswap           0.17   0.23
!  shmblkld          0.74   0.03
!  shmblkst          1.31   0.15
!  shmblkchk         0.25   0.15
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
!  casa              0.14   0.18
!  rdasi             0.04   0.00
!  wrasi             0.27   0.23
!  bpcc              0.80   0.69
!  fbpfcc            2.61   2.55
!  fmovscc           0.15   0.18
!  fmovdcc           0.29   0.43
!  fmovqcc           0.00   0.00
!  movcc             0.11   0.10
!  flushw            0.13   0.15
!  membar            0.14   0.03
!  prefetch          0.95   1.30
!  rdpc              0.19   0.13
!  ldqf              0.00   0.00
!  stqf              0.00   0.00
!  ldfa              0.09   0.03
!  lddfa             0.17   0.13
!  ldqfa             0.00   0.00
!  ldsba             0.09   0.10
!  ldsha             0.04   0.05
!  lduba             0.26   0.43
!  lduha             0.20   0.26
!  lda               0.11   0.08
!  ldda              0.08   0.08
!  ldstuba           0.06   0.03
!  prefetcha         0.67   0.69
!  stfa              0.27   0.28
!  stdfa             0.08   0.08
!  stqfa             0.00   0.00
!  stba              0.10   0.10
!  stha              0.25   0.26
!  sta               0.07   0.03
!  stda              0.15   0.18
!  swapa             0.18   0.13
!  fmovd             0.14   0.05
!  fnegd             0.14   0.15
!  fabsd             0.13   0.08
!  fstox             0.16   0.08
!  fdtox             0.16   0.08
!  fxtos             0.24   0.31
!  fxtod             0.22   0.15
!  lds               0.25   0.13
!  ldsa              0.21   0.20
!  ldx               0.18   0.28
!  ldxa              0.27   0.36
!  nofault           0.15   0.15
!  rdgsr             0.07   0.10
!  wrgsr             0.10   0.15
!  fpadd16           0.23   0.43
!  fpadd16s          0.13   0.18
!  fpadd32           0.26   0.20
!  fpadd32s          0.09   0.23
!  fpsub16           0.12   0.00
!  fpsub16s          0.23   0.41
!  fpsub32           0.21   0.20
!  fpsub32s          0.14   0.20
!  fpack16           0.12   0.13
!  fpack32           0.08   0.03
!  fpackfix          0.21   0.23
!  fexpand           0.28   0.33
!  fpmerge           0.27   0.28
!  fmul8x16          0.12   0.03
!  fmul8x16au        0.26   0.38
!  fmul8x16al        0.01   0.00
!  fmul8sux16        0.28   0.20
!  fmul8ulx16        0.18   0.10
!  fmuld8sux16       0.08   0.05
!  fmuld8ulx16       0.13   0.15
!  alignaddr         0.03   0.05
!  alignaddrl        0.03   0.05
!  faligndata        0.25   0.20
!  fzero             0.18   0.05
!  fzeros            0.06   0.03
!  fone              0.09   0.13
!  fones             0.25   0.20
!  fsrc1             0.17   0.23
!  fsrc1s            0.10   0.13
!  fsrc2             0.08   0.05
!  fsrc2s            0.00   0.00
!  fnot1             0.21   0.31
!  fnot1s            0.16   0.18
!  fnot2             0.21   0.13
!  fnot2s            0.24   0.13
!  for               0.26   0.31
!  fors              0.18   0.13
!  fnor              0.03   0.00
!  fnors             0.08   0.03
!  fand              0.17   0.23
!  fands             0.06   0.13
!  fnand             0.20   0.13
!  fnands            0.05   0.00
!  fxor              0.21   0.33
!  fxors             0.06   0.10
!  fxnor             0.04   0.00
!  fxnors            0.01   0.00
!  fornot1           0.10   0.08
!  fornot1s          0.25   0.31
!  fornot2           0.16   0.20
!  fornot2s          0.05   0.03
!  fandnot1          0.25   0.28
!  fandnot1s         0.22   0.33
!  fandnot2          0.05   0.05
!  fandnot2s         0.02   0.03
!  fcmpgt16          0.02   0.00
!  fcmpgt32          0.13   0.20
!  fcmple16          0.03   0.08
!  fcmple32          0.09   0.18
!  fcmpne16          0.11   0.08
!  fcmpne32          0.02   0.00
!  fcmpeq16          0.00   0.00
!  fcmpeq32          0.02   0.03
!  edge8             0.20   0.28
!  edge8l            0.13   0.18
!  edge16            0.09   0.08
!  edge16l           0.22   0.26
!  edge32            0.19   0.26
!  edge32l           0.13   0.10
!  pdist             0.07   0.03
!  partial_st8       0.18   0.20
!  partial_st16      0.01   0.00
!  partial_st32      0.26   0.49
!  short_st8         0.19   0.23
!  short_st16        0.13   0.15
!  short_ld8         0.28   0.31
!  short_ld16        0.02   0.00
!  blkld             0.20   0.00
!  blkst             0.13   0.00
!  blkld_offset      0.13   0.00
!  blkst_offset      0.21   0.00
!  blk_check         0.27   0.08
!  casxa             0.16   0.23
!  rdccr             0.16   0.18
!  rdfprs            0.14   0.08
!  wrccr             0.01   0.00
!  popc              0.23   0.23
!  wrfprs            0.19   0.26
!  stx               0.01   0.03
!  stxa              0.15   0.15
!  cflush            0.00   0.00
!  array8            0.24   0.23
!  array16           0.16   0.13
!  array32           0.09   0.10
!  edge8n            0.19   0.10
!  edge8ln           0.07   0.03
!  edge16n           0.26   0.26
!  edge16ln          0.26   0.33
!  edge32n           0.00   0.00
!  edge32ln          0.23   0.26
!  bmask             0.21   0.10
!  bshuffle          0.21   0.20
!  siam              0.15   0.15
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
KDATA_MODULE(t0_module_offset_table, 0x4dc2c000)
.seg "data"
t0_offset_table_start:
t0_offset_table_size:	.word	0x00000008
t0_offset_table:
	.word	0xfffffff0
	.word	0xffffffe0
	.word	0x00000000
	.word	0xfffffff8
	.word	0x00000018
	.word	0x00000008
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

KDATA_MODULE(t0_module_data_in_regs, 0x65b1e000)
.seg "data"
KGLOBAL(t0_data_in_regs)
t0_data_in_regs_start:
t0_data_in_regs:
	.word	0x9f27b486          ! %f0
	.word	0xd8b82682          ! %f1
	.word	0x91982066          ! %f2
	.word	0x183953b5          ! %f3
	.word	0xe76a5cba          ! %f4
	.word	0x78d41614          ! %f5
	.word	0x8eed7fce          ! %f6
	.word	0x9dc8d769          ! %f7
	.word	0x746b8f1a          ! %f8
	.word	0x7d1d12d4          ! %f9
	.word	0xa0c3e14a          ! %f10
	.word	0xf50b38a3          ! %f11
	.word	0x56adb473          ! %f12
	.word	0x91b99da3          ! %f13
	.word	0x9861c317          ! %f14
	.word	0x7667af67          ! %f15
	.word	0x07d686df          ! %f16
	.word	0x33af565b          ! %f17
	.word	0xe14ef63c          ! %f18
	.word	0x52b6cfa1          ! %f19
	.word	0x42ea7248          ! %f20
	.word	0x8c91ac02          ! %f21
	.word	0x84f45ca6          ! %f22
	.word	0x244ad67c          ! %f23
	.word	0x5bbef92b          ! %f24
	.word	0x516edc3b          ! %f25
	.word	0x19f6e594          ! %f26
	.word	0xfb9ef8f4          ! %f27
	.word	0xeea8219e          ! %f28
	.word	0x5748f5ff          ! %f29
	.word	0x4a1b6c34          ! %f30
	.word	0x929487aa          ! %f31
	.word	0x7f212e93          ! %f32
	.word	0x7a0fd38d          ! %f33
	.word	0xc6375c8e          ! %f34
	.word	0x183dfbf6          ! %f35
	.word	0x1171295e          ! %f36
	.word	0x18ec3f9f          ! %f37
	.word	0x198c42a1          ! %f38
	.word	0x9ea54242          ! %f39
	.word	0x6c4fff74          ! %f40
	.word	0xcafbb9dd          ! %f41
	.word	0x032aa7cb          ! %f42
	.word	0xccfbd595          ! %f43
	.word	0xf4993875          ! %f44
	.word	0xbd9f8e96          ! %f45
	.word	0x9edae26d          ! %f46
	.word	0x1878806e          ! %f47
	.word	0xba65886b          ! %f48
	.word	0x107935ad          ! %f49
	.word	0x6dd0bbce          ! %f50
	.word	0x860fd6d3          ! %f51
	.word	0x94b4c254          ! %f52
	.word	0x56592cd1          ! %f53
	.word	0x14591040          ! %f54
	.word	0x4471bda8          ! %f55
	.word	0x1365eedd          ! %f56
	.word	0x7504c0f0          ! %f57
	.word	0xa2fecd80          ! %f58
	.word	0x49879344          ! %f59
	.word	0xa6d38b70          ! %f60
	.word	0x730a7aed          ! %f61
	.word	0x6196f362          ! %f62
	.word	0x5e53cd41          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0x520       ! %g1 (code pointer)
	.word	t0_data_in_shm_area ! %g2 (shared area pointer)
	.word	0x6b9e89f5          ! %g3 (loop index)
	.word	SYM(t0_subr2)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0xd8492090          ! %o0
	.word	0xa93ebde8          ! %o1
	.word	0x8cfb8285          ! %o2
	.word	0x3c469ffd          ! %o3
	.word	0x3c473d49          ! %o4
	.word	0x0b86b9c7          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0xed463570          ! %l0
	.word	0x5224238f          ! %l1
	.word	0x17797aad          ! %l2
	.word	0x90cd1f93          ! %l3
	.word	0x70d045c3          ! %l4
	.word	0x092092bd          ! %l5
	.word	0xa0274643          ! %l6
	.word	0x1a5c80db          ! %l7
	.word	t0_data_in_area0    ! %i0 (area pointer)
	.word	t0_data_in_area0    ! %i1 (area pointer)
	.word	0xfffffffa          ! %i2 (byte offset)
	.word	0x00000018          ! %i3 (halfword offset)
	.word	0x0000001c          ! %i4 (word offset)
	.word	0x00000008          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0x958916f5          ! %y
	.word	0x0000000f          ! %icc (nzvc)
	.word	0x800008e9          ! %fsr
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

KDATA_MODULE(t0_module_data_in_stack, 0x2db0c000)
.seg "data"
KGLOBAL(t0_data_in_mtbl_size)
KGLOBAL(t0_data_in_mtbl)
KGLOBAL(t0_data_in_stack)
t0_data_in_stack_start:
	.word	0x312c7f45
	.word	0x87a2f386
	.word	0x4f9c4265
	.word	0xfaa06a30
	.word	0xaf5a094b
	.word	0xb9709e73
	.word	0x244677b1
	.word	0x8abcf596
	.word	0xfdb779bd
	.word	0x3f0d899d
	.word	0x84c74cb6
	.word	0xbf393f9b
	.word	0xf6d248ff
	.word	0x824a8cc2
	.word	0x6f0e79b9
	.word	0x25f2a25e
	.word	0xd72128b6
	.word	0xa34a6653
	.word	0x33c8c9a7
	.word	0x3c592cd9
	.word	0x4afa2dab
	.word	0xea24698c
	.word	0xd37a30a2
	.word	0xbd75d10e
	.word	0xe4a733f5
	.word	0xe8bb79c5
	.word	0x164446bc
	.word	0x3868c180
	.word	0x7719e157
	.word	0xbfb8e708
	.word	0xfd532b01
	.word	0xef6bb1e4
	.word	0xcdf2e9e6
	.word	0x807fffe2
	.word	0x940712ba
	.word	0x47eaef18
	.word	0xa0a67aef
	.word	0xade86c7e
	.word	0x7b9108f0
	.word	0x16038254
	.word	0x96c1f017
	.word	0xe3daa6ef
	.word	0xa21da22f
	.word	0xa7e3d39f
	.word	0x4cf536c2
	.word	0xc3cb24cc
	.word	0x4710a88b
	.word	0x3b6f7f83
	.word	0xb7c483b8
	.word	0x4ec60601
	.word	0xd48103e7
	.word	0x015e5403
	.word	0x17ed3f06
	.word	0xce865ce4
	.word	0xd3546274
	.word	0xb819a8cd
	.word	0x2fd34a22
	.word	0xa3316386
	.word	0xb74e6578
	.word	0x6d1a86ab
	.word	0x26fa0451
	.word	0x9bff324b
	.word	0xdb5f5650
	.word	0xf8be523f
	.word	0xcadeb14d
	.word	0xa39fcbbd
	.word	0x70baa7b8
	.word	0x25aeedef
	.word	0xc9c02621
	.word	0x46c4919c
	.word	0x8cfdc748
	.word	0x3556871d
	.word	0x6639e058
	.word	0x11237739
	.word	0xe1340341
	.word	0x15a6829b
	.word	0xa856eb56
	.word	0x9cca8503
	.word	0xed0c8889
	.word	0x54fc3c5e
	.word	0x8c233804
	.word	0xfdef8162
	.word	0xf363bcf4
	.word	0xd6658e70
	.word	0x55084ab3
	.word	0x8bd0d2c3
	.word	0x4f9179c4
	.word	0xd632532b
	.word	0x5aac6339
	.word	0xd2f9eef3
	.word	0x9201ea73
	.word	0xc3df56a3
	.word	0x15d98360
	.word	0x3f8eebb0
	.word	0x86b713af
	.word	0x563a6b64
	.word	0x4c63f781
	.word	0x1c68047d
	.word	0xc5ad46a5
	.word	0x8066965d
	.word	0x405e456b
	.word	0x46ff29b6
	.word	0xfbfd0481
	.word	0x3d62861a
	.word	0x2362a588
	.word	0x2dbeece3
	.word	0xd1391635
	.word	0xa322c939
	.word	0x90986a42
	.word	0xa7635e50
	.word	0x3f2fdc7a
	.word	0x29747816
	.word	0xe99df9a2
	.word	0x1412afdc
	.word	0xbf231c14
	.word	0x52f445c8
	.word	0x79e63d3a
	.word	0x3cdcb111
	.word	0xb6f9ca59
	.word	0xeab12c51
	.word	0xb3a2ac45
	.word	0x19ad7875
	.word	0xb7239df3
	.word	0x3ed12810
	.word	0x8f41540c
	.word	0x29b0ce1f
	.word	0x071e67e4
	.word	0x4b01b67a
	.word	0x9518828a
	.word	0x53e92b8c
	.word	0x9f0978ca
	.word	0xbbe50c09
	.word	0xc64ff752
	.word	0x5e9664b2
	.word	0x70b39664
	.word	0x62483573
	.word	0x00b1beb0
	.word	0x51354e56
	.word	0xfe544554
	.word	0xd0fd981f
	.word	0x870b1b0f
	.word	0x77a2f59a
	.word	0xe8e96b26
	.word	0xedfa85d4
	.word	0x9f682099
	.word	0x02833cd9
	.word	0xd83e8c90
	.word	0x9e0dd7b3
	.word	0x2ffae724
	.word	0x42b3f1b7
	.word	0xe3332bfb
	.word	0xfd70c467
	.word	0x8529764c
	.word	0x6892b073
	.word	0x342a0c42
	.word	0xddd2659a
	.word	0xf54bcfdc
	.word	0x456d287e
	.word	0xd3e35bb8
	.word	0x4791a0aa
	.word	0x8b55bc71
	.word	0x62d89651
	.word	0x58a00b6f
	.word	0x36e0669c
	.word	0xc73e3e61
	.word	0x8226867b
	.word	0x408cd6b7
	.word	0xa9c67f50
t0_data_in_sp:
	.word	0x83b0ced8
	.word	0x3afa35f9
	.word	0x5157bee5
	.word	0xb0a953f6
	.word	0x3ab2c944
	.word	0x8c6323c9
	.word	0xcbbaff55
	.word	0xa3616cc0
	.word	t0_data_in_area0
	.word	t0_data_in_area0
	.word	0x00000007
	.word	0xffffffe0
	.word	0xffffffe4
	.word	0xffffffe0
	.word	t0_data_in_fp
	.word	0xb6aba29c
	.word	0x09d2fa72
	.word	0x1bdedf95
	.word	0xaa193656
	.word	0x3a589b55
	.word	0xc36f85a6
	.word	0x8fd7ede8
	.word	0xf926b458
	.word	0xc4e5ddb7
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
	.word   	0x152ffbf4	! [%fp - 0xc]
	.word   	0x65ad4b1c	! [%fp - 0x8]
	.word   	0xb7dab33e	! [%fp - 0x4]
.global t0_data_in_fp; t0_data_in_fp:
	.word	0x088a6e35
	.word	0x625a0fdd
	.word	0x5b7bb1be
	.word	0x5f6e011e
	.word	0x1783e6f6
	.word	0xc7cca344
	.word	0x3a6481d9
	.word	0xf5df9d07
	.word	0x6ea69234
	.word	0x3072752f
	.word	0xbc2fd566
	.word	0xe547a46a
	.word	0xb52455c6
	.word	0x390b67cf
	.word	0x6096e802
	.word	0x57a132b5
	.word	0x939e43fa
	.word	0xe635a2bd
	.word	0xb2a0c5e1
	.word	0xe5601740
	.word	0xf17de5a8
	.word	0x9e701586
	.word	0xc6a67602
	.word	0xfb11856c
t0_data_in_stacktop:
	.word	0
t0_data_in_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_in_area0, 0x7f104000)
.seg "data"
t0_data_in_area0_start:
.skip 1664
t0_data_in_area0_begin:
	.word	0x31d09183	! t0_data_in_area0-0x20
	.word	0x7d641e69	! t0_data_in_area0-0x1c
	.word	0x913313a4	! t0_data_in_area0-0x18
	.word	0x3c952309	! t0_data_in_area0-0x14
	.word	0xb1b064b2	! t0_data_in_area0-0x10
	.word	0xf65c595e	! t0_data_in_area0-0xc
	.word	0x21478af8	! t0_data_in_area0-0x8
	.word	0x3d6e18f8	! t0_data_in_area0-0x4
.global t0_data_in_area0; t0_data_in_area0:
	.word	0xa6ebb09e	! t0_data_in_area0+0x0
	.word	0x25aadb5a	! t0_data_in_area0+0x4
	.word	0xbcd0ed17	! t0_data_in_area0+0x8
	.word	0xeb820a11	! t0_data_in_area0+0xc
	.word	0x7754f20d	! t0_data_in_area0+0x10
	.word	0xf4215dd1	! t0_data_in_area0+0x14
	.word	0x879b8f35	! t0_data_in_area0+0x18
	.word	0xee961446	! t0_data_in_area0+0x1c
t0_data_in_area0_end:
.skip 6464
t0_data_in_area0_stop:

KDATA_MODULE(t0_module_data_in_shm_area, 0x39200000)
.seg "data"
t0_data_in_shm_area_start:
t0_data_in_shm_area_begin:
.global t0_data_in_shm_area; t0_data_in_shm_area:
	.word	0xf532a570	! t0_data_in_shm_area+0x0 (t0)
	.word	0xe0e21e7c	! t0_data_in_shm_area+0x4 (t0)
	.word	0x5afc6917	! t0_data_in_shm_area+0x8 (t0)
	.word	0x51384008	! t0_data_in_shm_area+0xc (t0)
	.word	0x6ce78c78	! t0_data_in_shm_area+0x10 (t0)
	.word	0x7cf8775c	! t0_data_in_shm_area+0x14 (t0)
	.word	0x1a0d66c2	! t0_data_in_shm_area+0x18 (t0)
	.word	0xf9c601e9	! t0_data_in_shm_area+0x1c (t0)
	.word	0xc06138ee	! t0_data_in_shm_area+0x20 (t0)
	.word	0x3d9472fd	! t0_data_in_shm_area+0x24 (t0)
	.word	0x62f0a174	! t0_data_in_shm_area+0x28 (t0)
	.word	0xa226b282	! t0_data_in_shm_area+0x2c (t0)
	.word	0xa763f0c3	! t0_data_in_shm_area+0x30 (t0)
	.word	0xa5b4e0ff	! t0_data_in_shm_area+0x34 (t0)
	.word	0x7c59b3d7	! t0_data_in_shm_area+0x38 (t0)
	.word	0x14db2096	! t0_data_in_shm_area+0x3c (t0)
	.word	0x9da83f66	! t0_data_in_shm_area+0x40 (t0 bload)
	.word	0x0abfaed2	! t0_data_in_shm_area+0x44
	.word	0xb6db9d74	! t0_data_in_shm_area+0x48
	.word	0xdc71a177	! t0_data_in_shm_area+0x4c
	.word	0xb22fc855	! t0_data_in_shm_area+0x50
	.word	0x894088c0	! t0_data_in_shm_area+0x54
	.word	0xce6ce965	! t0_data_in_shm_area+0x58
	.word	0x498043a8	! t0_data_in_shm_area+0x5c
	.word	0xc37c2ef7	! t0_data_in_shm_area+0x60
	.word	0x8c020730	! t0_data_in_shm_area+0x64
	.word	0xc17b0c4e	! t0_data_in_shm_area+0x68
	.word	0xa13d07c3	! t0_data_in_shm_area+0x6c
	.word	0x43ac27a7	! t0_data_in_shm_area+0x70
	.word	0x8035ec28	! t0_data_in_shm_area+0x74
	.word	0xdb012d8e	! t0_data_in_shm_area+0x78
	.word	0x75e6439d	! t0_data_in_shm_area+0x7c
	.word	0x43300613	! t0_data_in_shm_area+0x80 (t0 bstore)
	.word	0xa9a53513	! t0_data_in_shm_area+0x84
	.word	0x93a5cfb0	! t0_data_in_shm_area+0x88
	.word	0x08ab93a7	! t0_data_in_shm_area+0x8c
	.word	0xaa085cc7	! t0_data_in_shm_area+0x90
	.word	0x3a2904c4	! t0_data_in_shm_area+0x94
	.word	0x66260c27	! t0_data_in_shm_area+0x98
	.word	0x34e9fe96	! t0_data_in_shm_area+0x9c
	.word	0x7b968204	! t0_data_in_shm_area+0xa0
	.word	0xd439a9ba	! t0_data_in_shm_area+0xa4
	.word	0xa48c563a	! t0_data_in_shm_area+0xa8
	.word	0xbc942f46	! t0_data_in_shm_area+0xac
	.word	0x19300dd6	! t0_data_in_shm_area+0xb0
	.word	0xf97144a5	! t0_data_in_shm_area+0xb4
	.word	0xe11bf93d	! t0_data_in_shm_area+0xb8
	.word	0xf7c9e8db	! t0_data_in_shm_area+0xbc
t0_data_in_shm_area_end:
t0_data_in_shm_area_stop:

KDATA_MODULE(t0_module_data_exp_regs, 0x4d8aa000)
.seg "data"
KGLOBAL(t0_data_exp_regs)
t0_data_exp_regs_start:
t0_data_exp_regs:
	.word	0x9f27b486          ! %f0
	.word	0xd8b82682          ! %f1
	.word	0x91982066          ! %f2
	.word	0x183953b5          ! %f3
	.word	0xe76a5cba          ! %f4
	.word	0x78d41614          ! %f5
	.word	0x8eed7fce          ! %f6
	.word	0x9dc8d769          ! %f7
	.word	0x746b8f1a          ! %f8
	.word	0x7d1d12d4          ! %f9
	.word	0xa0c3e14a          ! %f10
	.word	0xf50b38a3          ! %f11
	.word	0x56adb473          ! %f12
	.word	0x91b99da3          ! %f13
	.word	0x9861c317          ! %f14
	.word	0x7667af67          ! %f15
	.word	0x07d686df          ! %f16
	.word	0x33af565b          ! %f17
	.word	0xe14ef63c          ! %f18
	.word	0x52b6cfa1          ! %f19
	.word	0x42ea7248          ! %f20
	.word	0x8c91ac02          ! %f21
	.word	0x84f45ca6          ! %f22
	.word	0x244ad67c          ! %f23
	.word	0x5bbef92b          ! %f24
	.word	0x516edc3b          ! %f25
	.word	0x19f6e594          ! %f26
	.word	0xfb9ef8f4          ! %f27
	.word	0xeea8219e          ! %f28
	.word	0x5748f5ff          ! %f29
	.word	0x4a1b6c34          ! %f30
	.word	0x929487aa          ! %f31
	.word	0x7f212e93          ! %f32
	.word	0x7a0fd38d          ! %f33
	.word	0xc6375c8e          ! %f34
	.word	0x183dfbf6          ! %f35
	.word	0x1171295e          ! %f36
	.word	0x18ec3f9f          ! %f37
	.word	0x198c42a1          ! %f38
	.word	0x9ea54242          ! %f39
	.word	0x6c4fff74          ! %f40
	.word	0xcafbb9dd          ! %f41
	.word	0x032aa7cb          ! %f42
	.word	0xccfbd595          ! %f43
	.word	0xf4993875          ! %f44
	.word	0xbd9f8e96          ! %f45
	.word	0x9edae26d          ! %f46
	.word	0x1878806e          ! %f47
	.word	0xba65886b          ! %f48
	.word	0x107935ad          ! %f49
	.word	0x6dd0bbce          ! %f50
	.word	0x860fd6d3          ! %f51
	.word	0x94b4c254          ! %f52
	.word	0x56592cd1          ! %f53
	.word	0x14591040          ! %f54
	.word	0x4471bda8          ! %f55
	.word	0x1365eedd          ! %f56
	.word	0x7504c0f0          ! %f57
	.word	0xa2fecd80          ! %f58
	.word	0x49879344          ! %f59
	.word	0xa6d38b70          ! %f60
	.word	0x730a7aed          ! %f61
	.word	0x6196f362          ! %f62
	.word	0x5e53cd41          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0x520       ! %g1 (code pointer)
	.word	t0_data_exp_shm_area! %g2 (shared area pointer)
	.word	0x6b9e89f5          ! %g3 (loop index)
	.word	SYM(t0_subr2)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0xd8492090          ! %o0
	.word	0xa93ebde8          ! %o1
	.word	0x8cfb8285          ! %o2
	.word	0x3c469ffd          ! %o3
	.word	0x3c473d49          ! %o4
	.word	0x0b86b9c7          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0xed463570          ! %l0
	.word	0x5224238f          ! %l1
	.word	0x17797aad          ! %l2
	.word	0x90cd1f93          ! %l3
	.word	0x70d045c3          ! %l4
	.word	0x092092bd          ! %l5
	.word	0xa0274643          ! %l6
	.word	0x1a5c80db          ! %l7
	.word	t0_data_exp_area0   ! %i0 (area pointer)
	.word	t0_data_exp_area0   ! %i1 (area pointer)
	.word	0xfffffffa          ! %i2 (byte offset)
	.word	0x00000018          ! %i3 (halfword offset)
	.word	0x0000001c          ! %i4 (word offset)
	.word	0x00000008          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0x958916f5          ! %y
	.word	0x0000000f          ! %icc (nzvc)
	.word	0x800008e9          ! %fsr
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

KDATA_MODULE(t0_module_data_exp_stack, 0x3568a000)
.seg "data"
KGLOBAL(t0_data_exp_mtbl_size)
KGLOBAL(t0_data_exp_mtbl)
KGLOBAL(t0_data_exp_stack)
t0_data_exp_stack_start:
	.word	0x312c7f45
	.word	0x87a2f386
	.word	0x4f9c4265
	.word	0xfaa06a30
	.word	0xaf5a094b
	.word	0xb9709e73
	.word	0x244677b1
	.word	0x8abcf596
	.word	0xfdb779bd
	.word	0x3f0d899d
	.word	0x84c74cb6
	.word	0xbf393f9b
	.word	0xf6d248ff
	.word	0x824a8cc2
	.word	0x6f0e79b9
	.word	0x25f2a25e
	.word	0xd72128b6
	.word	0xa34a6653
	.word	0x33c8c9a7
	.word	0x3c592cd9
	.word	0x4afa2dab
	.word	0xea24698c
	.word	0xd37a30a2
	.word	0xbd75d10e
	.word	0xe4a733f5
	.word	0xe8bb79c5
	.word	0x164446bc
	.word	0x3868c180
	.word	0x7719e157
	.word	0xbfb8e708
	.word	0xfd532b01
	.word	0xef6bb1e4
	.word	0xcdf2e9e6
	.word	0x807fffe2
	.word	0x940712ba
	.word	0x47eaef18
	.word	0xa0a67aef
	.word	0xade86c7e
	.word	0x7b9108f0
	.word	0x16038254
	.word	0x96c1f017
	.word	0xe3daa6ef
	.word	0xa21da22f
	.word	0xa7e3d39f
	.word	0x4cf536c2
	.word	0xc3cb24cc
	.word	0x4710a88b
	.word	0x3b6f7f83
	.word	0xb7c483b8
	.word	0x4ec60601
	.word	0xd48103e7
	.word	0x015e5403
	.word	0x17ed3f06
	.word	0xce865ce4
	.word	0xd3546274
	.word	0xb819a8cd
	.word	0x2fd34a22
	.word	0xa3316386
	.word	0xb74e6578
	.word	0x6d1a86ab
	.word	0x26fa0451
	.word	0x9bff324b
	.word	0xdb5f5650
	.word	0xf8be523f
	.word	0xcadeb14d
	.word	0xa39fcbbd
	.word	0x70baa7b8
	.word	0x25aeedef
	.word	0xc9c02621
	.word	0x46c4919c
	.word	0x8cfdc748
	.word	0x3556871d
	.word	0x6639e058
	.word	0x11237739
	.word	0xe1340341
	.word	0x15a6829b
	.word	0xa856eb56
	.word	0x9cca8503
	.word	0xed0c8889
	.word	0x54fc3c5e
	.word	0x8c233804
	.word	0xfdef8162
	.word	0xf363bcf4
	.word	0xd6658e70
	.word	0x55084ab3
	.word	0x8bd0d2c3
	.word	0x4f9179c4
	.word	0xd632532b
	.word	0x5aac6339
	.word	0xd2f9eef3
	.word	0x9201ea73
	.word	0xc3df56a3
	.word	0x15d98360
	.word	0x3f8eebb0
	.word	0x86b713af
	.word	0x563a6b64
	.word	0x4c63f781
	.word	0x1c68047d
	.word	0xc5ad46a5
	.word	0x8066965d
	.word	0x405e456b
	.word	0x46ff29b6
	.word	0xfbfd0481
	.word	0x3d62861a
	.word	0x2362a588
	.word	0x2dbeece3
	.word	0xd1391635
	.word	0xa322c939
	.word	0x90986a42
	.word	0xa7635e50
	.word	0x3f2fdc7a
	.word	0x29747816
	.word	0xe99df9a2
	.word	0x1412afdc
	.word	0xbf231c14
	.word	0x52f445c8
	.word	0x79e63d3a
	.word	0x3cdcb111
	.word	0xb6f9ca59
	.word	0xeab12c51
	.word	0xb3a2ac45
	.word	0x19ad7875
	.word	0xb7239df3
	.word	0x3ed12810
	.word	0x8f41540c
	.word	0x29b0ce1f
	.word	0x071e67e4
	.word	0x4b01b67a
	.word	0x9518828a
	.word	0x53e92b8c
	.word	0x9f0978ca
	.word	0xbbe50c09
	.word	0xc64ff752
	.word	0x5e9664b2
	.word	0x70b39664
	.word	0x62483573
	.word	0x00b1beb0
	.word	0x51354e56
	.word	0xfe544554
	.word	0xd0fd981f
	.word	0x870b1b0f
	.word	0x77a2f59a
	.word	0xe8e96b26
	.word	0xedfa85d4
	.word	0x9f682099
	.word	0x02833cd9
	.word	0xd83e8c90
	.word	0x9e0dd7b3
	.word	0x2ffae724
	.word	0x42b3f1b7
	.word	0xe3332bfb
	.word	0xfd70c467
	.word	0x8529764c
	.word	0x6892b073
	.word	0x342a0c42
	.word	0xddd2659a
	.word	0xf54bcfdc
	.word	0x456d287e
	.word	0xd3e35bb8
	.word	0x4791a0aa
	.word	0x8b55bc71
	.word	0x62d89651
	.word	0x58a00b6f
	.word	0x36e0669c
	.word	0xc73e3e61
	.word	0x8226867b
	.word	0x408cd6b7
	.word	0xa9c67f50
t0_data_exp_sp:
	.word	0x83b0ced8
	.word	0x3afa35f9
	.word	0x5157bee5
	.word	0xb0a953f6
	.word	0x3ab2c944
	.word	0x8c6323c9
	.word	0xcbbaff55
	.word	0xa3616cc0
	.word	t0_data_exp_area0
	.word	t0_data_exp_area0
	.word	0x00000007
	.word	0xffffffe0
	.word	0xffffffe4
	.word	0xffffffe0
	.word	t0_data_exp_fp
	.word	0xb6aba29c
	.word	0x09d2fa72
	.word	0x1bdedf95
	.word	0xaa193656
	.word	0x3a589b55
	.word	0xc36f85a6
	.word	0x8fd7ede8
	.word	0xf926b458
	.word	0xc4e5ddb7
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
	.word   	0x152ffbf4	! [%fp - 0xc]
	.word   	0x65ad4b1c	! [%fp - 0x8]
	.word   	0xb7dab33e	! [%fp - 0x4]
t0_data_exp_fp:
	.word	0x088a6e35
	.word	0x625a0fdd
	.word	0x5b7bb1be
	.word	0x5f6e011e
	.word	0x1783e6f6
	.word	0xc7cca344
	.word	0x3a6481d9
	.word	0xf5df9d07
	.word	0x6ea69234
	.word	0x3072752f
	.word	0xbc2fd566
	.word	0xe547a46a
	.word	0xb52455c6
	.word	0x390b67cf
	.word	0x6096e802
	.word	0x57a132b5
	.word	0x939e43fa
	.word	0xe635a2bd
	.word	0xb2a0c5e1
	.word	0xe5601740
	.word	0xf17de5a8
	.word	0x9e701586
	.word	0xc6a67602
	.word	0xfb11856c
t0_data_exp_stacktop:
	.word	0
t0_data_exp_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_exp_area0, 0x7a55c000)
.seg "data"
t0_data_exp_area0_start:
.skip 1664
t0_data_exp_area0_begin:
	.word	0x31d09183	! t0_data_exp_area0-0x20
	.word	0x7d641e69	! t0_data_exp_area0-0x1c
	.word	0x913313a4	! t0_data_exp_area0-0x18
	.word	0x3c952309	! t0_data_exp_area0-0x14
	.word	0xb1b064b2	! t0_data_exp_area0-0x10
	.word	0xf65c595e	! t0_data_exp_area0-0xc
	.word	0x21478af8	! t0_data_exp_area0-0x8
	.word	0x3d6e18f8	! t0_data_exp_area0-0x4
.global t0_data_exp_area0; t0_data_exp_area0:
	.word	0xa6ebb09e	! t0_data_exp_area0+0x0
	.word	0x25aadb5a	! t0_data_exp_area0+0x4
	.word	0xbcd0ed17	! t0_data_exp_area0+0x8
	.word	0xeb820a11	! t0_data_exp_area0+0xc
	.word	0x7754f20d	! t0_data_exp_area0+0x10
	.word	0xf4215dd1	! t0_data_exp_area0+0x14
	.word	0x879b8f35	! t0_data_exp_area0+0x18
	.word	0xee961446	! t0_data_exp_area0+0x1c
t0_data_exp_area0_end:
.skip 6464
t0_data_exp_area0_stop:

KDATA_MODULE(t0_module_data_exp_shm_area, 0x182d6000)
.seg "data"
t0_data_exp_shm_area_start:
t0_data_exp_shm_area_begin:
.global t0_data_exp_shm_area; t0_data_exp_shm_area:
	.word	0xf532a570	! t0_data_exp_shm_area+0x0 (t0)
	.word	0xe0e21e7c	! t0_data_exp_shm_area+0x4 (t0)
	.word	0x5afc6917	! t0_data_exp_shm_area+0x8 (t0)
	.word	0x51384008	! t0_data_exp_shm_area+0xc (t0)
	.word	0x6ce78c78	! t0_data_exp_shm_area+0x10 (t0)
	.word	0x7cf8775c	! t0_data_exp_shm_area+0x14 (t0)
	.word	0x1a0d66c2	! t0_data_exp_shm_area+0x18 (t0)
	.word	0xf9c601e9	! t0_data_exp_shm_area+0x1c (t0)
	.word	0xc06138ee	! t0_data_exp_shm_area+0x20 (t0)
	.word	0x3d9472fd	! t0_data_exp_shm_area+0x24 (t0)
	.word	0x62f0a174	! t0_data_exp_shm_area+0x28 (t0)
	.word	0xa226b282	! t0_data_exp_shm_area+0x2c (t0)
	.word	0xa763f0c3	! t0_data_exp_shm_area+0x30 (t0)
	.word	0xa5b4e0ff	! t0_data_exp_shm_area+0x34 (t0)
	.word	0x7c59b3d7	! t0_data_exp_shm_area+0x38 (t0)
	.word	0x14db2096	! t0_data_exp_shm_area+0x3c (t0)
	.word	0x9da83f66	! t0_data_exp_shm_area+0x40 (t0 bload)
	.word	0x0abfaed2	! t0_data_exp_shm_area+0x44
	.word	0xb6db9d74	! t0_data_exp_shm_area+0x48
	.word	0xdc71a177	! t0_data_exp_shm_area+0x4c
	.word	0xb22fc855	! t0_data_exp_shm_area+0x50
	.word	0x894088c0	! t0_data_exp_shm_area+0x54
	.word	0xce6ce965	! t0_data_exp_shm_area+0x58
	.word	0x498043a8	! t0_data_exp_shm_area+0x5c
	.word	0xc37c2ef7	! t0_data_exp_shm_area+0x60
	.word	0x8c020730	! t0_data_exp_shm_area+0x64
	.word	0xc17b0c4e	! t0_data_exp_shm_area+0x68
	.word	0xa13d07c3	! t0_data_exp_shm_area+0x6c
	.word	0x43ac27a7	! t0_data_exp_shm_area+0x70
	.word	0x8035ec28	! t0_data_exp_shm_area+0x74
	.word	0xdb012d8e	! t0_data_exp_shm_area+0x78
	.word	0x75e6439d	! t0_data_exp_shm_area+0x7c
	.word	0x43300613	! t0_data_exp_shm_area+0x80 (t0 bstore)
	.word	0xa9a53513	! t0_data_exp_shm_area+0x84
	.word	0x93a5cfb0	! t0_data_exp_shm_area+0x88
	.word	0x08ab93a7	! t0_data_exp_shm_area+0x8c
	.word	0xaa085cc7	! t0_data_exp_shm_area+0x90
	.word	0x3a2904c4	! t0_data_exp_shm_area+0x94
	.word	0x66260c27	! t0_data_exp_shm_area+0x98
	.word	0x34e9fe96	! t0_data_exp_shm_area+0x9c
	.word	0x7b968204	! t0_data_exp_shm_area+0xa0
	.word	0xd439a9ba	! t0_data_exp_shm_area+0xa4
	.word	0xa48c563a	! t0_data_exp_shm_area+0xa8
	.word	0xbc942f46	! t0_data_exp_shm_area+0xac
	.word	0x19300dd6	! t0_data_exp_shm_area+0xb0
	.word	0xf97144a5	! t0_data_exp_shm_area+0xb4
	.word	0xe11bf93d	! t0_data_exp_shm_area+0xb8
	.word	0xf7c9e8db	! t0_data_exp_shm_area+0xbc
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
#define T0_KAOS_SEED          d2b394eb4e4b
#define T0_KAOS_ICOUNT        4000
#define T0_KAOS_AREAS         1
#define T0_KAOS_AREASIZE      64
#define T0_KAOS_AREAOFFSET    1664
#define T0_KAOS_PAGESIZE      8192
#define T0_KAOS_CODECOUNT     4004

#define T0_KAOS_BOOT_VA                  0x0c33c000
#define T0_KAOS_BOOT_PA                  0x0000000000b20000
#define T0_KAOS_BOOT_CACHEABLE           1
#define T0_KAOS_BOOT_NONCACHEABLE        0

#define T0_KAOS_STARTUP_VA               0x193c2000
#define T0_KAOS_STARTUP_PA               0x00000000029bc000
#define T0_KAOS_STARTUP_CACHEABLE        1
#define T0_KAOS_STARTUP_NONCACHEABLE     0

#define T0_KAOS_OFFSET_TBL_VA            0x4dc2c000
#define T0_KAOS_OFFSET_TBL_PA            0x000000000463a000
#define T0_KAOS_OFFSET_TBL_CACHEABLE     1
#define T0_KAOS_OFFSET_TBL_NONCACHEABLE  0

#define T0_KAOS_DONE_VA                  0x11b0c000
#define T0_KAOS_DONE_PA                  0x00000000065a4000
#define T0_KAOS_DONE_CACHEABLE           1
#define T0_KAOS_DONE_NONCACHEABLE        0

#define T0_KAOS_KTBL_VA                  0x0d912000
#define T0_KAOS_KTBL_PA                  0x0000000008312000
#define T0_KAOS_KTBL_CACHEABLE           1
#define T0_KAOS_KTBL_NONCACHEABLE        0

#define T0_KAOS_SUBR0_VA                 0x4d580000
#define T0_KAOS_SUBR0_PA                 0x000000000b24a000
#define T0_KAOS_SUBR0_CACHEABLE          1
#define T0_KAOS_SUBR0_NONCACHEABLE       0
#define T0_KAOS_SUBR1_VA                 0x0d2da000
#define T0_KAOS_SUBR1_PA                 0x000000000d0c0000
#define T0_KAOS_SUBR1_CACHEABLE          1
#define T0_KAOS_SUBR1_NONCACHEABLE       0
#define T0_KAOS_SUBR2_VA                 0x1e504000
#define T0_KAOS_SUBR2_PA                 0x000000000f49c000
#define T0_KAOS_SUBR2_CACHEABLE          1
#define T0_KAOS_SUBR2_NONCACHEABLE       0
#define T0_KAOS_SUBR3_VA                 0x0ddc0000
#define T0_KAOS_SUBR3_PA                 0x0000000011190000
#define T0_KAOS_SUBR3_CACHEABLE          1
#define T0_KAOS_SUBR3_NONCACHEABLE       0

#define T0_KAOS_EXP_REGS_VA              0x4d8aa000
#define T0_KAOS_EXP_REGS_PA              0x00000000126be000
#define T0_KAOS_EXP_REGS_CACHEABLE       1
#define T0_KAOS_EXP_REGS_NONCACHEABLE    0
#define T0_KAOS_RUN_REGS_VA              0x65b1e000
#define T0_KAOS_RUN_REGS_PA              0x000000001595c000
#define T0_KAOS_RUN_REGS_CACHEABLE       1
#define T0_KAOS_RUN_REGS_NONCACHEABLE    0

#define T0_KAOS_EXP_STACK_VA             0x3568a000
#define T0_KAOS_EXP_STACK_PA             0x0000000016660000
#define T0_KAOS_EXP_STACK_CACHEABLE      1
#define T0_KAOS_EXP_STACK_NONCACHEABLE   0
#define T0_KAOS_RUN_STACK_VA             0x2db0c000
#define T0_KAOS_RUN_STACK_PA             0x0000000019dc4000
#define T0_KAOS_RUN_STACK_CACHEABLE      1
#define T0_KAOS_RUN_STACK_NONCACHEABLE   0

#define T0_KAOS_AREA0
#define T0_KAOS_EXP_AREA0_VA             0x7a55c000
#define T0_KAOS_EXP_AREA0_PA             0x000000001a858000
#define T0_KAOS_EXP_AREA0_CACHEABLE      1
#define T0_KAOS_EXP_AREA0_NONCACHEABLE   0
#define T0_KAOS_RUN_AREA0_VA             0x7f104000
#define T0_KAOS_RUN_AREA0_PA             0x000000001c7e8000
#define T0_KAOS_RUN_AREA0_CACHEABLE      1
#define T0_KAOS_RUN_AREA0_NONCACHEABLE   0

#define T0_KAOS_SHM_AREA
#define T0_KAOS_EXP_SHM_AREA_VA          0x182d6000
#define T0_KAOS_EXP_SHM_AREA_PA          0x0000000001c74000
#define T0_KAOS_EXP_SHM_AREA_CACHEABLE   1
#define T0_KAOS_EXP_SHM_AREA_NONCACHEABLE 0
#define T0_KAOS_RUN_SHM_AREA_VA          0x39200000
#define T0_KAOS_RUN_SHM_AREA_PA          0x0000000000c78000
#define T0_KAOS_RUN_SHM_AREA_CACHEABLE   1
#define T0_KAOS_RUN_SHM_AREA_NONCACHEABLE 0

#define T0_KAOS_RANVAL_00     0x6123a565
#define T0_KAOS_RANVAL_01     0xd7b3d328
#define T0_KAOS_RANVAL_02     0x26b9c601
#define T0_KAOS_RANVAL_03     0x64301929
#define T0_KAOS_RANVAL_04     0x83eea78a
#define T0_KAOS_RANVAL_05     0xba86a2e0
#define T0_KAOS_RANVAL_06     0x4c2da38d
#define T0_KAOS_RANVAL_07     0x7dcd2d55
#define T0_KAOS_RANVAL_08     0x8d488ea5
#define T0_KAOS_RANVAL_09     0xa63d70a5
#define T0_KAOS_RANVAL_0a     0x5b1ff70d
#define T0_KAOS_RANVAL_0b     0xb1438cbc
#define T0_KAOS_RANVAL_0c     0x13a21bad
#define T0_KAOS_RANVAL_0d     0x6043b80f
#define T0_KAOS_RANVAL_0e     0xba71170a
#define T0_KAOS_RANVAL_0f     0x407e5e13
#define T0_KAOS_RANVAL_10     0xc4039e88
#define T0_KAOS_RANVAL_11     0x372cf73c
#define T0_KAOS_RANVAL_12     0x6ab83ddb
#define T0_KAOS_RANVAL_13     0x2d82face
#define T0_KAOS_RANVAL_14     0xa316ef9c
#define T0_KAOS_RANVAL_15     0x169eeacf
#define T0_KAOS_RANVAL_16     0xbe9aaf5a
#define T0_KAOS_RANVAL_17     0xdd5bb4c5
#define T0_KAOS_RANVAL_18     0xc3deeea5
#define T0_KAOS_RANVAL_19     0xf2d5063b
#define T0_KAOS_RANVAL_1a     0x168305db
#define T0_KAOS_RANVAL_1b     0x3d36d215
#define T0_KAOS_RANVAL_1c     0xda679ac8
#define T0_KAOS_RANVAL_1d     0xfdacac40
#define T0_KAOS_RANVAL_1e     0x034bda5a
#define T0_KAOS_RANVAL_1f     0x001ee344
#define T0_KAOS_RANVAL_20     0xc1d717e8
#define T0_KAOS_RANVAL_21     0xc81debb5
#define T0_KAOS_RANVAL_22     0xfcf03bf3
#define T0_KAOS_RANVAL_23     0xaa5fd7a8
#define T0_KAOS_RANVAL_24     0xaaf93539
#define T0_KAOS_RANVAL_25     0xd6fcc488
#define T0_KAOS_RANVAL_26     0x7487aa96
#define T0_KAOS_RANVAL_27     0xd2fe7408
#define T0_KAOS_RANVAL_28     0xe7e44912
#define T0_KAOS_RANVAL_29     0xf51b3903
#define T0_KAOS_RANVAL_2a     0x4afa88fa
#define T0_KAOS_RANVAL_2b     0x71de0f83
#define T0_KAOS_RANVAL_2c     0xf3ef7606
#define T0_KAOS_RANVAL_2d     0xdfa4af50
#define T0_KAOS_RANVAL_2e     0xab3739d1
#define T0_KAOS_RANVAL_2f     0x848abab0
#define T0_KAOS_RANVAL_30     0x8a1fad34
#define T0_KAOS_RANVAL_31     0xc00f673f
#define T0_KAOS_RANVAL_32     0x6e7f5c3e
#define T0_KAOS_RANVAL_33     0x7a5c3506
#define T0_KAOS_RANVAL_34     0x08b201de
#define T0_KAOS_RANVAL_35     0x39890845
#define T0_KAOS_RANVAL_36     0xbee7db83
#define T0_KAOS_RANVAL_37     0x0508547e
#define T0_KAOS_RANVAL_38     0x8bbf2238
#define T0_KAOS_RANVAL_39     0xda8f8bc7
#define T0_KAOS_RANVAL_3a     0xc69dc5ff
#define T0_KAOS_RANVAL_3b     0x5301c376
#define T0_KAOS_RANVAL_3c     0xac5d0982
#define T0_KAOS_RANVAL_3d     0x46b80798
#define T0_KAOS_RANVAL_3e     0x3d2d1f56
#define T0_KAOS_RANVAL_3f     0xb76a38d8
#define T0_KAOS_RANVAL_40     0x9a613f58
#define T0_KAOS_RANVAL_41     0xecb91cc0
#define T0_KAOS_RANVAL_42     0x5e2621f1
#define T0_KAOS_RANVAL_43     0x162d8e7b
#define T0_KAOS_RANVAL_44     0xd6373848
#define T0_KAOS_RANVAL_45     0x21e70e7f
#define T0_KAOS_RANVAL_46     0xc950a3a9
#define T0_KAOS_RANVAL_47     0x744d59c9
#define T0_KAOS_RANVAL_48     0x7b63aba5
#define T0_KAOS_RANVAL_49     0xd2abc591
#define T0_KAOS_RANVAL_4a     0x736491be
#define T0_KAOS_RANVAL_4b     0x12baeaa1
#define T0_KAOS_RANVAL_4c     0x3c86f29a
#define T0_KAOS_RANVAL_4d     0xef6543b2
#define T0_KAOS_RANVAL_4e     0xd239b80d
#define T0_KAOS_RANVAL_4f     0xe797d47d
#define T0_KAOS_RANVAL_50     0xa43dc481
#define T0_KAOS_RANVAL_51     0x6ab94b63
#define T0_KAOS_RANVAL_52     0xefd04782
#define T0_KAOS_RANVAL_53     0xec9365d7
#define T0_KAOS_RANVAL_54     0x3460e475
#define T0_KAOS_RANVAL_55     0x1a153fee
#define T0_KAOS_RANVAL_56     0xdfb6cfca
#define T0_KAOS_RANVAL_57     0x039db1c8
#define T0_KAOS_RANVAL_58     0xbc199425
#define T0_KAOS_RANVAL_59     0x6efd81a8
#define T0_KAOS_RANVAL_5a     0xf969a04d
#define T0_KAOS_RANVAL_5b     0x7b8f0ff2
#define T0_KAOS_RANVAL_5c     0xee49dfeb
#define T0_KAOS_RANVAL_5d     0xb03fca76
#define T0_KAOS_RANVAL_5e     0x3392c45b
#define T0_KAOS_RANVAL_5f     0xfeed36a0
#define T0_KAOS_RANVAL_60     0x7225181c
#define T0_KAOS_RANVAL_61     0xb9504e91
#define T0_KAOS_RANVAL_62     0x76d10ea4
#define T0_KAOS_RANVAL_63     0xcde5532b
#define T0_KAOS_RANVAL_64     0x78c60ba1
#define T0_KAOS_RANVAL_65     0xfc51a58d
#define T0_KAOS_RANVAL_66     0xde1fe7ed
#define T0_KAOS_RANVAL_67     0x1424c49f
#define T0_KAOS_RANVAL_68     0x4955d7c6
#define T0_KAOS_RANVAL_69     0x7cc3bf96
#define T0_KAOS_RANVAL_6a     0xb660d501
#define T0_KAOS_RANVAL_6b     0x59b05c9d
#define T0_KAOS_RANVAL_6c     0x3b2f6151
#define T0_KAOS_RANVAL_6d     0x25d66afd
#define T0_KAOS_RANVAL_6e     0xf122e7e5
#define T0_KAOS_RANVAL_6f     0x05744a82
#define T0_KAOS_RANVAL_70     0x9798cad6
#define T0_KAOS_RANVAL_71     0x74202df2
#define T0_KAOS_RANVAL_72     0x67d3904e
#define T0_KAOS_RANVAL_73     0x974514c8
#define T0_KAOS_RANVAL_74     0xcc6d7c49
#define T0_KAOS_RANVAL_75     0x1f427893
#define T0_KAOS_RANVAL_76     0x2f477f57
#define T0_KAOS_RANVAL_77     0x37ac44ac
#define T0_KAOS_RANVAL_78     0xfba88fd5
#define T0_KAOS_RANVAL_79     0xc1107325
#define T0_KAOS_RANVAL_7a     0xbf41926e
#define T0_KAOS_RANVAL_7b     0xf461a811
#define T0_KAOS_RANVAL_7c     0x2268b7eb
#define T0_KAOS_RANVAL_7d     0x655deca0
#define T0_KAOS_RANVAL_7e     0x7188f98f
#define T0_KAOS_RANVAL_7f     0x12fc4da4
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
!    areaoffset     1664
!    ncache         0
!    emulate_ncache 1
!    pagesize       8192
!    invsize        0
!    codecount      4004
!    code           0d912000
!    entry          0d912000
!    fsr_exceptions 00000000
!    fsr_roundmode  00000004
!    fsr_mask       c0000fff
!    seed           d2b394eb4e4b
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

KTEXT_MODULE(t0_module_ktbl, 0x0d912000)
.seg "text"
	KGLOBAL(t0_ktbl)
t0_ktbl_page_begin:
.global t0_kref; t0_kref:
	.skip 0
t0_ktbl:
	.word	0xa2637e5d	! t0_kref+0x0:   	subc	%o5, -0x1a3, %l1
	.word	0x81ab0aae	! t0_kref+0x4:   	fcmpes	%fcc0, %f12, %f14
	.word	0x99a288ca	! t0_kref+0x8:   	fsubd	%f10, %f10, %f12
	.word	0xa5a4482c	! t0_kref+0xc:   	fadds	%f17, %f12, %f18
	.word	0xf3ee501b	! t0_kref+0x10:   	prefetcha	%i1 + %i3, 25
	.word	0xd608a001	! t0_kref+0x14:   	ldub	[%g2 + 1], %o3
	.word	0x9fb4cd30	! t0_kref+0x18:   	fandnot1s	%f19, %f16, %f15
	.word	0xec070018	! t0_kref+0x1c:   	ld	[%i4 + %i0], %l6
	.word	0xdab01019	! t0_kref+0x20:   	stha	%o5, [%g0 + %i1]0x80
	.word	0x9f414000	! t0_kref+0x24:   	mov	%pc, %o7
	.word	0xd9be180d	! t0_kref+0x28:   	stda	%f12, [%i0 + %o5]0xc0
	.word	0x95a00552	! t0_kref+0x2c:   	fsqrtd	%f18, %f10
	.word	0xa1b40f4c	! t0_kref+0x30:   	fornot1	%f16, %f12, %f16
	.word	0xadb30492	! t0_kref+0x34:   	fcmple32	%f12, %f18, %l6
	.word	0xda200018	! t0_kref+0x38:   	st	%o5, [%g0 + %i0]
	.word	0x9273400c	! t0_kref+0x3c:   	udiv	%o5, %o4, %o1
	.word	0x99a4884c	! t0_kref+0x40:   	faddd	%f18, %f12, %f12
	.word	0xd44e7fe7	! t0_kref+0x44:   	ldsb	[%i1 - 0x19], %o2
	.word	0xe03e0000	! t0_kref+0x48:   	std	%l0, [%i0]
	.word	0xa5b38ecc	! t0_kref+0x4c:   	fornot2	%f14, %f12, %f18
	.word	0x81accab2	! t0_kref+0x50:   	fcmpes	%fcc0, %f19, %f18
	.word	0xe100a03c	! t0_kref+0x54:   	ld	[%g2 + 0x3c], %f16
	.word	0xa7a48932	! t0_kref+0x58:   	fmuls	%f18, %f18, %f19
	.word	0xd19e1a1d	! t0_kref+0x5c:   	ldda	[%i0 + %i5]0xd0, %f8
	.word	0xda267fe4	! t0_kref+0x60:   	st	%o5, [%i1 - 0x1c]
	.word	0x9ba01a4e	! t0_kref+0x64:   	fdtoi	%f14, %f13
	.word	0xa1a4094e	! t0_kref+0x68:   	fmuld	%f16, %f14, %f16
	.word	0xa1a000ae	! t0_kref+0x6c:   	fnegs	%f14, %f16
	.word	0xd99e5a1a	! t0_kref+0x70:   	ldda	[%i1 + %i2]0xd0, %f12
	.word	0xe11e4000	! t0_kref+0x74:   	ldd	[%i1], %f16
	.word	0xa1a01890	! t0_kref+0x78:   	fitos	%f16, %f16
	.word	0xd19e9a19	! t0_kref+0x7c:   	ldda	[%i2 + %i1]0xd0, %f8
	.word	0xe03e2000	! t0_kref+0x80:   	std	%l0, [%i0]
	.word	0xd07e600c	! t0_kref+0x84:   	swap	[%i1 + 0xc], %o0
	.word	0x99a288d0	! t0_kref+0x88:   	fsubd	%f10, %f16, %f12
	.word	0x97a00033	! t0_kref+0x8c:   	fmovs	%f19, %f11
	.word	0x86102008	! t0_kref+0x90:   	mov	0x8, %g3
	.word	0x86a0e001	! t0_kref+0x94:   	subcc	%g3, 1, %g3
	.word	0x2280000e	! t0_kref+0x98:   	be,a	_kref+0xd0
	.word	0x9db38e0a	! t0_kref+0x9c:   	fand	%f14, %f10, %f14
	.word	0xa4f333b4	! t0_kref+0xa0:   	udivcc	%o4, -0xc4c, %l2
	.word	0xa29b000d	! t0_kref+0xa4:   	xorcc	%o4, %o5, %l1
	.word	0x9fc10000	! t0_kref+0xa8:   	call	%g4
	.word	0xe80e401a	! t0_kref+0xac:   	ldub	[%i1 + %i2], %l4
	.word	0x97a4c8ac	! t0_kref+0xb0:   	fsubs	%f19, %f12, %f11
	.word	0xf56e001b	! t0_kref+0xb4:   	prefetch	%i0 + %i3, 26
	.word	0xaaa3400d	! t0_kref+0xb8:   	subcc	%o5, %o5, %l5
	.word	0xaa8b400c	! t0_kref+0xbc:   	andcc	%o5, %o4, %l5
	.word	0xa803400d	! t0_kref+0xc0:   	add	%o5, %o5, %l4
	.word	0xe6c01019	! t0_kref+0xc4:   	ldswa	[%g0 + %i1]0x80, %l3
	.word	0xda30a00e	! t0_kref+0xc8:   	sth	%o5, [%g2 + 0xe]
	.word	0x33bffff2	! t0_kref+0xcc:   	fbe,a	_kref+0x94
	.word	0x9ba00531	! t0_kref+0xd0:   	fsqrts	%f17, %f13
	.word	0x95a2c8ad	! t0_kref+0xd4:   	fsubs	%f11, %f13, %f10
	.word	0x95a0054c	! t0_kref+0xd8:   	fsqrtd	%f12, %f10
	.word	0xea16c019	! t0_kref+0xdc:   	lduh	[%i3 + %i1], %l5
	.word	0x9db38d10	! t0_kref+0xe0:   	fandnot1	%f14, %f16, %f14
	.word	0xd450a010	! t0_kref+0xe4:   	ldsh	[%g2 + 0x10], %o2
	.word	0xd9be588d	! t0_kref+0xe8:   	stda	%f12, [%i1 + %o5]0xc4
	.word	0x8143e040	! t0_kref+0xec:   	membar	0x40
	.word	0x8143c000	! t0_kref+0xf0:   	stbar
	.word	0x3b800007	! t0_kref+0xf4:   	fble,a	_kref+0x110
	.word	0xa29b400d	! t0_kref+0xf8:   	xorcc	%o5, %o5, %l1
	.word	0x81da3865	! t0_kref+0xfc:   	flush	%o0 - 0x79b
	.word	0xd4063fe0	! t0_kref+0x100:   	ld	[%i0 - 0x20], %o2
	.word	0xd210a01a	! t0_kref+0x104:   	lduh	[%g2 + 0x1a], %o1
	.word	0x95a0054a	! t0_kref+0x108:   	fsqrtd	%f10, %f10
	.word	0xd900a00c	! t0_kref+0x10c:   	ld	[%g2 + 0xc], %f12
	.word	0xe11e2018	! t0_kref+0x110:   	ldd	[%i0 + 0x18], %f16
	.word	0xd45e3ff8	! t0_kref+0x114:   	ldx	[%i0 - 8], %o2
	.word	0xa1b38d8a	! t0_kref+0x118:   	fxor	%f14, %f10, %f16
	.word	0x21800003	! t0_kref+0x11c:   	fbn,a	_kref+0x128
	.word	0xac136670	! t0_kref+0x120:   	or	%o5, 0x670, %l6
	.word	0xaf3b201e	! t0_kref+0x124:   	sra	%o4, 0x1e, %l7
	.word	0x99b44ea0	! t0_kref+0x128:   	fsrc1s	%f17, %f12
	.word	0xa1a388ca	! t0_kref+0x12c:   	fsubd	%f14, %f10, %f16
	.word	0x2d480006	! t0_kref+0x130:   	fbg,a,pt	%fcc0, _kref+0x148
	.word	0xec00a010	! t0_kref+0x134:   	ld	[%g2 + 0x10], %l6
	.word	0x95a00550	! t0_kref+0x138:   	fsqrtd	%f16, %f10
	.word	0xab2b6005	! t0_kref+0x13c:   	sll	%o5, 0x5, %l5
	.word	0xa3b28aad	! t0_kref+0x140:   	fpsub16s	%f10, %f13, %f17
	.word	0xe51fbf90	! t0_kref+0x144:   	ldd	[%fp - 0x70], %f18
	.word	0x92133e55	! t0_kref+0x148:   	or	%o4, -0x1ab, %o1
	.word	0x92733ca0	! t0_kref+0x14c:   	udiv	%o4, -0x360, %o1
	.word	0x95b40a4c	! t0_kref+0x150:   	fpadd32	%f16, %f12, %f10
	.word	0xd53f4018	! t0_kref+0x154:   	std	%f10, [%i5 + %i0]
	.word	0xa4637cf5	! t0_kref+0x158:   	subc	%o5, -0x30b, %l2
	.word	0xacfb6d33	! t0_kref+0x15c:   	sdivcc	%o5, 0xd33, %l6
	.word	0xe11fbc58	! t0_kref+0x160:   	ldd	[%fp - 0x3a8], %f16
	.word	0xa5b34280	! t0_kref+0x164:   	array32	%o5, %g0, %l2
	.word	0xa7a0052b	! t0_kref+0x168:   	fsqrts	%f11, %f19
	.word	0x973b400c	! t0_kref+0x16c:   	sra	%o5, %o4, %o3
	.word	0x34800005	! t0_kref+0x170:   	bg,a	_kref+0x184
	.word	0x99b40d40	! t0_kref+0x174:   	fnot1	%f16, %f12
	.word	0xa9b3002c	! t0_kref+0x178:   	edge8n	%o4, %o4, %l4
	.word	0x3b800007	! t0_kref+0x17c:   	fble,a	_kref+0x198
	.word	0xd27e3fec	! t0_kref+0x180:   	swap	[%i0 - 0x14], %o1
	.word	0x8143c000	! t0_kref+0x184:   	stbar
	.word	0xe76e401d	! t0_kref+0x188:   	prefetch	%i1 + %i5, 19
	.word	0xe810a014	! t0_kref+0x18c:   	lduh	[%g2 + 0x14], %l4
	.word	0xe60e3fe1	! t0_kref+0x190:   	ldub	[%i0 - 0x1f], %l3
	.word	0x9db38dca	! t0_kref+0x194:   	fnand	%f14, %f10, %f14
	.word	0xd448a000	! t0_kref+0x198:   	ldsb	[%g2], %o2
	.word	0x9473400c	! t0_kref+0x19c:   	udiv	%o5, %o4, %o2
	.word	0xa1a3082d	! t0_kref+0x1a0:   	fadds	%f12, %f13, %f16
	.word	0x99a0052d	! t0_kref+0x1a4:   	fsqrts	%f13, %f12
	.word	0x99b2c971	! t0_kref+0x1a8:   	fpmerge	%f11, %f17, %f12
	.word	0xac1377fc	! t0_kref+0x1ac:   	or	%o5, -0x804, %l6
	.word	0xa370000d	! t0_kref+0x1b0:   	popc	%o5, %l1
	.word	0xa2a3000d	! t0_kref+0x1b4:   	subcc	%o4, %o5, %l1
	.word	0xdaae9018	! t0_kref+0x1b8:   	stba	%o5, [%i2 + %i0]0x80
	.word	0xe51fbe58	! t0_kref+0x1bc:   	ldd	[%fp - 0x1a8], %f18
	.word	0x908b31a1	! t0_kref+0x1c0:   	andcc	%o4, -0xe5f, %o0
	.word	0xee162000	! t0_kref+0x1c4:   	lduh	[%i0], %l7
	.word	0xe81e2008	! t0_kref+0x1c8:   	ldd	[%i0 + 8], %l4
	.word	0xe5be501d	! t0_kref+0x1cc:   	stda	%f18, [%i1 + %i5]0x80
	.word	0xae133535	! t0_kref+0x1d0:   	or	%o4, -0xacb, %l7
	.word	0x96b3000c	! t0_kref+0x1d4:   	orncc	%o4, %o4, %o3
	.word	0xadb340cd	! t0_kref+0x1d8:   	edge16l	%o5, %o5, %l6
	.word	0xaa33400d	! t0_kref+0x1dc:   	orn	%o5, %o5, %l5
	.word	0xa1a9c04e	! t0_kref+0x1e0:   	fmovdu	%fcc0, %f14, %f16
	.word	0x9da0052d	! t0_kref+0x1e4:   	fsqrts	%f13, %f14
	.word	0x3d480001	! t0_kref+0x1e8:   	fbule,a,pt	%fcc0, _kref+0x1ec
	.word	0x99b40ad2	! t0_kref+0x1ec:   	fpsub32	%f16, %f18, %f12
	.word	0x9fa0108a	! t0_kref+0x1f0:   	fxtos	%f10, %f15
	.word	0xa1a4094a	! t0_kref+0x1f4:   	fmuld	%f16, %f10, %f16
	.word	0xd87e3fe4	! t0_kref+0x1f8:   	swap	[%i0 - 0x1c], %o4
	.word	0x97b300ad	! t0_kref+0x1fc:   	edge16n	%o4, %o5, %o3
	.word	0xaf1b000d	! t0_kref+0x200:   	tsubcctv	%o4, %o5, %l7
	.word	0x920b6c1b	! t0_kref+0x204:   	and	%o5, 0xc1b, %o1
	.word	0xa72b400d	! t0_kref+0x208:   	sll	%o5, %o5, %l3
	.word	0xe9f6500d	! t0_kref+0x20c:   	casxa	[%i1]0x80, %o5, %l4
	.word	0x37480005	! t0_kref+0x210:   	fbge,a,pt	%fcc0, _kref+0x224
	.word	0x943332ea	! t0_kref+0x214:   	orn	%o4, -0xd16, %o2
	.word	0x95b48e12	! t0_kref+0x218:   	fand	%f18, %f18, %f10
	.word	0xac632250	! t0_kref+0x21c:   	subc	%o4, 0x250, %l6
	.word	0xdd9e501d	! t0_kref+0x220:   	ldda	[%i1 + %i5]0x80, %f14
	.word	0xd4c65000	! t0_kref+0x224:   	ldswa	[%i1]0x80, %o2
	.word	0x35800005	! t0_kref+0x228:   	fbue,a	_kref+0x23c
	.word	0xe6d81019	! t0_kref+0x22c:   	ldxa	[%g0 + %i1]0x80, %l3
	.word	0xe8c6101c	! t0_kref+0x230:   	ldswa	[%i0 + %i4]0x80, %l4
	.word	0x95a0054c	! t0_kref+0x234:   	fsqrtd	%f12, %f10
	.word	0xa273000d	! t0_kref+0x238:   	udiv	%o4, %o5, %l1
	.word	0xee080019	! t0_kref+0x23c:   	ldub	[%g0 + %i1], %l7
	.word	0xe20e2008	! t0_kref+0x240:   	ldub	[%i0 + 8], %l1
	.word	0xd93e7ff8	! t0_kref+0x244:   	std	%f12, [%i1 - 8]
	.word	0xd900a018	! t0_kref+0x248:   	ld	[%g2 + 0x18], %f12
	.word	0xab232573	! t0_kref+0x24c:   	mulscc	%o4, 0x573, %l5
	.word	0xaab36e08	! t0_kref+0x250:   	orncc	%o5, 0xe08, %l5
	.word	0xa7408000	! t0_kref+0x254:   	mov	%ccr, %l3
	.word	0x972b000d	! t0_kref+0x258:   	sll	%o4, %o5, %o3
	.word	0xe878a030	! t0_kref+0x25c:   	swap	[%g2 + 0x30], %l4
	.word	0xe11fbc18	! t0_kref+0x260:   	ldd	[%fp - 0x3e8], %f16
	.word	0x95a00552	! t0_kref+0x264:   	fsqrtd	%f18, %f10
	.word	0xda26600c	! t0_kref+0x268:   	st	%o5, [%i1 + 0xc]
	.word	0x94032b12	! t0_kref+0x26c:   	add	%o4, 0xb12, %o2
	.word	0xd2067ff8	! t0_kref+0x270:   	ld	[%i1 - 8], %o1
	.word	0x37480007	! t0_kref+0x274:   	fbge,a,pt	%fcc0, _kref+0x290
	.word	0xe6467fe4	! t0_kref+0x278:   	ldsw	[%i1 - 0x1c], %l3
	.word	0xa88b6ae5	! t0_kref+0x27c:   	andcc	%o5, 0xae5, %l4
	.word	0x9da4084a	! t0_kref+0x280:   	faddd	%f16, %f10, %f14
	.word	0xa1a2884e	! t0_kref+0x284:   	faddd	%f10, %f14, %f16
	.word	0xa4637ad2	! t0_kref+0x288:   	subc	%o5, -0x52e, %l2
	.word	0x9fa0052c	! t0_kref+0x28c:   	fsqrts	%f12, %f15
	.word	0xd500a018	! t0_kref+0x290:   	ld	[%g2 + 0x18], %f10
	.word	0x9da4094c	! t0_kref+0x294:   	fmuld	%f16, %f12, %f14
	.word	0xa5a0188e	! t0_kref+0x298:   	fitos	%f14, %f18
	.word	0x99b28d0e	! t0_kref+0x29c:   	fandnot1	%f10, %f14, %f12
	.word	0xe1be188d	! t0_kref+0x2a0:   	stda	%f16, [%i0 + %o5]0xc4
	.word	0xa86326c4	! t0_kref+0x2a4:   	subc	%o4, 0x6c4, %l4
	.word	0xdd1fbef0	! t0_kref+0x2a8:   	ldd	[%fp - 0x110], %f14
	.word	0x81830000	! t0_kref+0x2ac:   	wr	%o4, %g0, %y
	.word	0xea965000	! t0_kref+0x2b0:   	lduha	[%i1]0x80, %l5
	.word	0x97b30fb2	! t0_kref+0x2b4:   	fors	%f12, %f18, %f11
	.word	0xc1ee500c	! t0_kref+0x2b8:   	prefetcha	%i1 + %o4, 0
	.word	0x37480008	! t0_kref+0x2bc:   	fbge,a,pt	%fcc0, _kref+0x2dc
	.word	0xe810a02a	! t0_kref+0x2c0:   	lduh	[%g2 + 0x2a], %l4
	.word	0xa3a4c8b2	! t0_kref+0x2c4:   	fsubs	%f19, %f18, %f17
	.word	0xea08a03d	! t0_kref+0x2c8:   	ldub	[%g2 + 0x3d], %l5
	.word	0x99a01a2d	! t0_kref+0x2cc:   	fstoi	%f13, %f12
	.word	0xd44e3ff8	! t0_kref+0x2d0:   	ldsb	[%i0 - 8], %o2
	.word	0xa32b2000	! t0_kref+0x2d4:   	sll	%o4, 0x0, %l1
	.word	0xe84e3fee	! t0_kref+0x2d8:   	ldsb	[%i0 - 0x12], %l4
	.word	0x92fb400d	! t0_kref+0x2dc:   	sdivcc	%o5, %o5, %o1
	.word	0xdb063ff8	! t0_kref+0x2e0:   	ld	[%i0 - 8], %f13
	.word	0x95a0052c	! t0_kref+0x2e4:   	fsqrts	%f12, %f10
	.word	0xa3a0002c	! t0_kref+0x2e8:   	fmovs	%f12, %f17
	.word	0xe13e0000	! t0_kref+0x2ec:   	std	%f16, [%i0]
	.word	0x38480006	! t0_kref+0x2f0:   	bgu,a,pt	%icc, _kref+0x308
	.word	0xe81e4000	! t0_kref+0x2f4:   	ldd	[%i1], %l4
	.word	0x97a00531	! t0_kref+0x2f8:   	fsqrts	%f17, %f11
	.word	0xa3a01a2a	! t0_kref+0x2fc:   	fstoi	%f10, %f17
	.word	0xe810a002	! t0_kref+0x300:   	lduh	[%g2 + 2], %l4
	.word	0xee50a014	! t0_kref+0x304:   	ldsh	[%g2 + 0x14], %l7
	.word	0x95aa802b	! t0_kref+0x308:   	fmovsue	%fcc0, %f11, %f10
	.word	0xd4801019	! t0_kref+0x30c:   	lda	[%g0 + %i1]0x80, %o2
	.word	0xe11e6000	! t0_kref+0x310:   	ldd	[%i1], %f16
	.word	0x29480008	! t0_kref+0x314:   	fbl,a,pt	%fcc0, _kref+0x334
	.word	0xa60b2c40	! t0_kref+0x318:   	and	%o4, 0xc40, %l3
	.word	0x81ac8a30	! t0_kref+0x31c:   	fcmps	%fcc0, %f18, %f16
	.word	0xd6066008	! t0_kref+0x320:   	ld	[%i1 + 8], %o3
	.word	0xa5a488d0	! t0_kref+0x324:   	fsubd	%f18, %f16, %f18
	.word	0x81834000	! t0_kref+0x328:   	wr	%o5, %g0, %y
	.word	0xee10a018	! t0_kref+0x32c:   	lduh	[%g2 + 0x18], %l7
	.word	0xe7a71019	! t0_kref+0x330:   	sta	%f19, [%i4 + %i1]0x80
	.word	0x9de3bfa0	! t0_kref+0x334:   	save	%sp, -0x60, %sp
	.word	0xb496801b	! t0_kref+0x338:   	orcc	%i2, %i3, %i2
	.word	0x95ee37c1	! t0_kref+0x33c:   	restore	%i0, -0x83f, %o2
	.word	0xa5b3414c	! t0_kref+0x340:   	edge32l	%o5, %o4, %l2
	.word	0x95b3006d	! t0_kref+0x344:   	edge8ln	%o4, %o5, %o2
	.word	0x9fa408ac	! t0_kref+0x348:   	fsubs	%f16, %f12, %f15
	.word	0x97a9402f	! t0_kref+0x34c:   	fmovsug	%fcc0, %f15, %f11
	.word	0xa5a01a52	! t0_kref+0x350:   	fdtoi	%f18, %f18
	.word	0x3d480008	! t0_kref+0x354:   	fbule,a,pt	%fcc0, _kref+0x374
	.word	0xd4166004	! t0_kref+0x358:   	lduh	[%i1 + 4], %o2
	.word	0xd616c019	! t0_kref+0x35c:   	lduh	[%i3 + %i1], %o3
	.word	0x21480001	! t0_kref+0x360:   	fbn,a,pt	%fcc0, _kref+0x364
	.word	0x95a0052d	! t0_kref+0x364:   	fsqrts	%f13, %f10
	.word	0x99a3094a	! t0_kref+0x368:   	fmuld	%f12, %f10, %f12
	.word	0xd040a03c	! t0_kref+0x36c:   	ldsw	[%g2 + 0x3c], %o0
	.word	0xa9b340cc	! t0_kref+0x370:   	edge16l	%o5, %o4, %l4
	.word	0x913b000c	! t0_kref+0x374:   	sra	%o4, %o4, %o0
	.word	0xa6c36831	! t0_kref+0x378:   	addccc	%o5, 0x831, %l3
	.word	0x9fb3ca2c	! t0_kref+0x37c:   	fpadd16s	%f15, %f12, %f15
	.word	0xa2132fe7	! t0_kref+0x380:   	or	%o4, 0xfe7, %l1
	.word	0x91400000	! t0_kref+0x384:   	mov	%y, %o0
	.word	0x86102002	! t0_kref+0x388:   	mov	0x2, %g3
	.word	0x86a0e001	! t0_kref+0x38c:   	subcc	%g3, 1, %g3
	.word	0x22800007	! t0_kref+0x390:   	be,a	_kref+0x3ac
	.word	0xa72b201e	! t0_kref+0x394:   	sll	%o4, 0x1e, %l3
	.word	0xe46e8018	! t0_kref+0x398:   	ldstub	[%i2 + %i0], %l2
	.word	0xa5a00552	! t0_kref+0x39c:   	fsqrtd	%f18, %f18
	.word	0xe0b81018	! t0_kref+0x3a0:   	stda	%l0, [%g0 + %i0]0x80
	.word	0xe84e6014	! t0_kref+0x3a4:   	ldsb	[%i1 + 0x14], %l4
	.word	0xe840a01c	! t0_kref+0x3a8:   	ldsw	[%g2 + 0x1c], %l4
	.word	0xec080019	! t0_kref+0x3ac:   	ldub	[%g0 + %i1], %l6
	.word	0x24480008	! t0_kref+0x3b0:   	ble,a,pt	%icc, _kref+0x3d0
	.word	0xe248a039	! t0_kref+0x3b4:   	ldsb	[%g2 + 0x39], %l1
	.word	0xa4f32ea0	! t0_kref+0x3b8:   	udivcc	%o4, 0xea0, %l2
	.word	0xa1a01892	! t0_kref+0x3bc:   	fitos	%f18, %f16
	.word	0x9ba0052f	! t0_kref+0x3c0:   	fsqrts	%f15, %f13
	.word	0x81da37bf	! t0_kref+0x3c4:   	flush	%o0 - 0x841
	.word	0xa8b3000c	! t0_kref+0x3c8:   	orncc	%o4, %o4, %l4
	.word	0xe200a010	! t0_kref+0x3cc:   	ld	[%g2 + 0x10], %l1
	.word	0xa5b30492	! t0_kref+0x3d0:   	fcmple32	%f12, %f18, %l2
	.word	0x94a3740f	! t0_kref+0x3d4:   	subcc	%o5, -0xbf1, %o2
	.word	0xa5b40910	! t0_kref+0x3d8:   	faligndata	%f16, %f16, %f18
	.word	0x9ba01893	! t0_kref+0x3dc:   	fitos	%f19, %f13
	.word	0xdb00a000	! t0_kref+0x3e0:   	ld	[%g2], %f13
	.word	0x95a28950	! t0_kref+0x3e4:   	fmuld	%f10, %f16, %f10
	.word	0xea167fe2	! t0_kref+0x3e8:   	lduh	[%i1 - 0x1e], %l5
	.word	0x969b3646	! t0_kref+0x3ec:   	xorcc	%o4, -0x9ba, %o3
	.word	0xd8f01018	! t0_kref+0x3f0:   	stxa	%o4, [%g0 + %i0]0x80
	.word	0x90f3400d	! t0_kref+0x3f4:   	udivcc	%o5, %o5, %o0
	.word	0x93b3048c	! t0_kref+0x3f8:   	fcmple32	%f12, %f12, %o1
	.word	0xaf3b400d	! t0_kref+0x3fc:   	sra	%o5, %o5, %l7
	.word	0xc06e201b	! t0_kref+0x400:   	ldstub	[%i0 + 0x1b], %g0
	.word	0x99b0076a	! t0_kref+0x404:   	fpack16	%f10, %f12
	.word	0xac933229	! t0_kref+0x408:   	orcc	%o4, -0xdd7, %l6
	.word	0x9da2c92b	! t0_kref+0x40c:   	fmuls	%f11, %f11, %f14
	.word	0x9da2894e	! t0_kref+0x410:   	fmuld	%f10, %f14, %f14
	.word	0x3e800001	! t0_kref+0x414:   	bvc,a	_kref+0x418
	.word	0xe01e0000	! t0_kref+0x418:   	ldd	[%i0], %l0
	.word	0xe5180018	! t0_kref+0x41c:   	ldd	[%g0 + %i0], %f18
	.word	0x21800002	! t0_kref+0x420:   	fbn,a	_kref+0x428
	.word	0x97b34ab1	! t0_kref+0x424:   	fpsub16s	%f13, %f17, %f11
	.word	0xe608a03f	! t0_kref+0x428:   	ldub	[%g2 + 0x3f], %l3
	.word	0xe40e8018	! t0_kref+0x42c:   	ldub	[%i2 + %i0], %l2
	.word	0xe86e001a	! t0_kref+0x430:   	ldstub	[%i0 + %i2], %l4
	.word	0xe51e2008	! t0_kref+0x434:   	ldd	[%i0 + 8], %f18
	.word	0x95b340ec	! t0_kref+0x438:   	edge16ln	%o5, %o4, %o2
	.word	0x21800003	! t0_kref+0x43c:   	fbn,a	_kref+0x448
	.word	0x96937ea5	! t0_kref+0x440:   	orcc	%o5, -0x15b, %o3
	.word	0x99a4084c	! t0_kref+0x444:   	faddd	%f16, %f12, %f12
	.word	0xa413400d	! t0_kref+0x448:   	or	%o5, %o5, %l2
	.word	0x9db2c72d	! t0_kref+0x44c:   	fmuld8ulx16	%f11, %f13, %f14
	.word	0x25480003	! t0_kref+0x450:   	fblg,a,pt	%fcc0, _kref+0x45c
	.word	0xea0e2003	! t0_kref+0x454:   	ldub	[%i0 + 3], %l5
	.word	0xa3b007ac	! t0_kref+0x458:   	fpackfix	%f12, %f17
	.word	0x97a01a2b	! t0_kref+0x45c:   	fstoi	%f11, %f11
	.word	0x95236aef	! t0_kref+0x460:   	mulscc	%o5, 0xaef, %o2
	.word	0xea48a02a	! t0_kref+0x464:   	ldsb	[%g2 + 0x2a], %l5
	.word	0xa3b00ceb	! t0_kref+0x468:   	fnot2s	%f11, %f17
	.word	0xa663400c	! t0_kref+0x46c:   	subc	%o5, %o4, %l3
	.word	0x9db38dd0	! t0_kref+0x470:   	fnand	%f14, %f16, %f14
	.word	0xa5a0054e	! t0_kref+0x474:   	fsqrtd	%f14, %f18
	.word	0xe03e7ff0	! t0_kref+0x478:   	std	%l0, [%i1 - 0x10]
	.word	0xd82e401a	! t0_kref+0x47c:   	stb	%o4, [%i1 + %i2]
	.word	0xee167fea	! t0_kref+0x480:   	lduh	[%i1 - 0x16], %l7
	.word	0xda20a03c	! t0_kref+0x484:   	st	%o5, [%g2 + 0x3c]
	.word	0x96a3400c	! t0_kref+0x488:   	subcc	%o5, %o4, %o3
	.word	0x9493000d	! t0_kref+0x48c:   	orcc	%o4, %o5, %o2
	.word	0x34800003	! t0_kref+0x490:   	bg,a	_kref+0x49c
	.word	0xa3a018ca	! t0_kref+0x494:   	fdtos	%f10, %f17
	.word	0xa5a40830	! t0_kref+0x498:   	fadds	%f16, %f16, %f18
	.word	0xa633000d	! t0_kref+0x49c:   	orn	%o4, %o5, %l3
	.word	0x34800007	! t0_kref+0x4a0:   	bg,a	_kref+0x4bc
	.word	0xd448a020	! t0_kref+0x4a4:   	ldsb	[%g2 + 0x20], %o2
	.word	0xacb363a2	! t0_kref+0x4a8:   	orncc	%o5, 0x3a2, %l6
	.word	0xda30a018	! t0_kref+0x4ac:   	sth	%o5, [%g2 + 0x18]
	.word	0x2b480005	! t0_kref+0x4b0:   	fbug,a,pt	%fcc0, _kref+0x4c4
	.word	0x907b70b9	! t0_kref+0x4b4:   	sdiv	%o5, -0xf47, %o0
	.word	0x9da3884e	! t0_kref+0x4b8:   	faddd	%f14, %f14, %f14
	.word	0xe200a00c	! t0_kref+0x4bc:   	ld	[%g2 + 0xc], %l1
	.word	0x95b40ab2	! t0_kref+0x4c0:   	fpsub16s	%f16, %f18, %f10
	.word	0xe0bf5019	! t0_kref+0x4c4:   	stda	%l0, [%i5 + %i1]0x80
	.word	0xac136a72	! t0_kref+0x4c8:   	or	%o5, 0xa72, %l6
	.word	0xa1a00550	! t0_kref+0x4cc:   	fsqrtd	%f16, %f16
	.word	0xa673400d	! t0_kref+0x4d0:   	udiv	%o5, %o5, %l3
	.word	0xdb00a01c	! t0_kref+0x4d4:   	ld	[%g2 + 0x1c], %f13
	.word	0xda26001c	! t0_kref+0x4d8:   	st	%o5, [%i0 + %i4]
	.word	0xa32b2008	! t0_kref+0x4dc:   	sll	%o4, 0x8, %l1
	.word	0x95a0104a	! t0_kref+0x4e0:   	fdtox	%f10, %f10
	.word	0xa463400d	! t0_kref+0x4e4:   	subc	%o5, %o5, %l2
	.word	0xe848a025	! t0_kref+0x4e8:   	ldsb	[%g2 + 0x25], %l4
	.word	0x9fc00004	! t0_kref+0x4ec:   	call	%g0 + %g4
	.word	0xa4932194	! t0_kref+0x4f0:   	orcc	%o4, 0x194, %l2
	.word	0xd500a030	! t0_kref+0x4f4:   	ld	[%g2 + 0x30], %f10
	.word	0x30800001	! t0_kref+0x4f8:   	ba,a	_kref+0x4fc
	.word	0xd19e5a1b	! t0_kref+0x4fc:   	ldda	[%i1 + %i3]0xd0, %f8
	.word	0x33480008	! t0_kref+0x500:   	fbe,a,pt	%fcc0, _kref+0x520
	.word	0xe8000019	! t0_kref+0x504:   	ld	[%g0 + %i1], %l4
	.word	0x97b2cd60	! t0_kref+0x508:   	fnot1s	%f11, %f11
	.word	0x81dc800b	! t0_kref+0x50c:   	flush	%l2 + %o3
	.word	0x3b800002	! t0_kref+0x510:   	fble,a	_kref+0x518
	.word	0xe208a03e	! t0_kref+0x514:   	ldub	[%g2 + 0x3e], %l1
	.word	0x9fc00004	! t0_kref+0x518:   	call	%g0 + %g4
	.word	0x9db28dd2	! t0_kref+0x51c:   	fnand	%f10, %f18, %f14
	.word	0x95b306ee	! t0_kref+0x520:   	fmul8ulx16	%f12, %f14, %f10
!	.word	0x36a726b7	! t0_kref+0x524:   	bge,a	SYM(t0_subr1)
	   	bge,a	SYM(t0_subr1)
	.word	0x9e006004	! t0_kref+0x528:   	add	%g1, 4, %o7
	.word	0xe650a008	! t0_kref+0x52c:   	ldsh	[%g2 + 8], %l3
	.word	0x99a2894a	! t0_kref+0x530:   	fmuld	%f10, %f10, %f12
	.word	0xa7b4848a	! t0_kref+0x534:   	fcmple32	%f18, %f10, %l3
	.word	0xe5a71019	! t0_kref+0x538:   	sta	%f18, [%i4 + %i1]0x80
	.word	0x94936fe4	! t0_kref+0x53c:   	orcc	%o5, 0xfe4, %o2
	.word	0xd820a010	! t0_kref+0x540:   	st	%o4, [%g2 + 0x10]
	.word	0xe44e8018	! t0_kref+0x544:   	ldsb	[%i2 + %i0], %l2
	.word	0x9da000ca	! t0_kref+0x548:   	fnegd	%f10, %f14
	.word	0xa7a000aa	! t0_kref+0x54c:   	fnegs	%f10, %f19
	.word	0x95b340ed	! t0_kref+0x550:   	edge16ln	%o5, %o5, %o2
	.word	0xd8263fe8	! t0_kref+0x554:   	st	%o4, [%i0 - 0x18]
	.word	0x27800008	! t0_kref+0x558:   	fbul,a	_kref+0x578
	.word	0x9da28852	! t0_kref+0x55c:   	faddd	%f10, %f18, %f14
	.word	0xa29b2a67	! t0_kref+0x560:   	xorcc	%o4, 0xa67, %l1
	.word	0xe700a018	! t0_kref+0x564:   	ld	[%g2 + 0x18], %f19
	.word	0xd44e3ff4	! t0_kref+0x568:   	ldsb	[%i0 - 0xc], %o2
	.word	0x37800006	! t0_kref+0x56c:   	fbge,a	_kref+0x584
	.word	0x9fa018cc	! t0_kref+0x570:   	fdtos	%f12, %f15
	.word	0x81ac0ab3	! t0_kref+0x574:   	fcmpes	%fcc0, %f16, %f19
	.word	0xa2b3000d	! t0_kref+0x578:   	orncc	%o4, %o5, %l1
	.word	0x97b3404d	! t0_kref+0x57c:   	edge8l	%o5, %o5, %o3
	.word	0xa7a28832	! t0_kref+0x580:   	fadds	%f10, %f18, %f19
	.word	0xa5a0014c	! t0_kref+0x584:   	fabsd	%f12, %f18
	.word	0x9323000c	! t0_kref+0x588:   	mulscc	%o4, %o4, %o1
	.word	0xee50a022	! t0_kref+0x58c:   	ldsh	[%g2 + 0x22], %l7
	.word	0x99a308d2	! t0_kref+0x590:   	fsubd	%f12, %f18, %f12
	.word	0x3e800002	! t0_kref+0x594:   	bvc,a	_kref+0x59c
	.word	0x9ba00531	! t0_kref+0x598:   	fsqrts	%f17, %f13
	.word	0x35800005	! t0_kref+0x59c:   	fbue,a	_kref+0x5b0
	.word	0xda36c018	! t0_kref+0x5a0:   	sth	%o5, [%i3 + %i0]
	.word	0xafb340ac	! t0_kref+0x5a4:   	edge16n	%o5, %o4, %l7
	.word	0xd640a01c	! t0_kref+0x5a8:   	ldsw	[%g2 + 0x1c], %o3
	.word	0x9fc00004	! t0_kref+0x5ac:   	call	%g0 + %g4
	.word	0xa9b3416d	! t0_kref+0x5b0:   	edge32ln	%o5, %o5, %l4
	.word	0x97418000	! t0_kref+0x5b4:   	mov	%fprs, %o3
	.word	0x92a3400d	! t0_kref+0x5b8:   	subcc	%o5, %o5, %o1
	.word	0x99a0110e	! t0_kref+0x5bc:   	fxtod	%f14, %f12
	.word	0xa1b38e80	! t0_kref+0x5c0:   	fsrc1	%f14, %f16
	.word	0xe80e7fe2	! t0_kref+0x5c4:   	ldub	[%i1 - 0x1e], %l4
	.word	0x9fa000b2	! t0_kref+0x5c8:   	fnegs	%f18, %f15
	.word	0xea06600c	! t0_kref+0x5cc:   	ld	[%i1 + 0xc], %l5
	.word	0xac0b6d9e	! t0_kref+0x5d0:   	and	%o5, 0xd9e, %l6
	.word	0x9fa288ae	! t0_kref+0x5d4:   	fsubs	%f10, %f14, %f15
	.word	0xdaa01018	! t0_kref+0x5d8:   	sta	%o5, [%g0 + %i0]0x80
	.word	0x90b33907	! t0_kref+0x5dc:   	orncc	%o4, -0x6f9, %o0
	.word	0xee6e200a	! t0_kref+0x5e0:   	ldstub	[%i0 + 0xa], %l7
	.word	0xa3a3092a	! t0_kref+0x5e4:   	fmuls	%f12, %f10, %f17
	.word	0xd250a02c	! t0_kref+0x5e8:   	ldsh	[%g2 + 0x2c], %o1
	.word	0xa2b333e5	! t0_kref+0x5ec:   	orncc	%o4, -0xc1b, %l1
	.word	0xa3b300ec	! t0_kref+0x5f0:   	edge16ln	%o4, %o4, %l1
	.word	0xa49b3540	! t0_kref+0x5f4:   	xorcc	%o4, -0xac0, %l2
	.word	0xda2e8019	! t0_kref+0x5f8:   	stb	%o5, [%i2 + %i1]
	.word	0x9da0052a	! t0_kref+0x5fc:   	fsqrts	%f10, %f14
	.word	0xda267fec	! t0_kref+0x600:   	st	%o5, [%i1 - 0x14]
	.word	0xa45370fd	! t0_kref+0x604:   	umul	%o5, -0xf03, %l2
	.word	0x972b000d	! t0_kref+0x608:   	sll	%o4, %o5, %o3
	.word	0xa1a288cc	! t0_kref+0x60c:   	fsubd	%f10, %f12, %f16
	.word	0x9013000d	! t0_kref+0x610:   	or	%o4, %o5, %o0
	.word	0xe680105c	! t0_kref+0x614:   	lda	[%g0 + %i4]0x82, %l3
	.word	0x99a0054e	! t0_kref+0x618:   	fsqrtd	%f14, %f12
	.word	0xee7f0019	! t0_kref+0x61c:   	swap	[%i4 + %i1], %l7
	.word	0x8610200e	! t0_kref+0x620:   	mov	0xe, %g3
	.word	0x86a0e001	! t0_kref+0x624:   	subcc	%g3, 1, %g3
	.word	0x22800014	! t0_kref+0x628:   	be,a	_kref+0x678
	.word	0x81830000	! t0_kref+0x62c:   	wr	%o4, %g0, %y
	.word	0xaf400000	! t0_kref+0x630:   	mov	%y, %l7
	.word	0x81ac0aac	! t0_kref+0x634:   	fcmpes	%fcc0, %f16, %f12
	.word	0xe8000019	! t0_kref+0x638:   	ld	[%g0 + %i1], %l4
	.word	0xd096501b	! t0_kref+0x63c:   	lduha	[%i1 + %i3]0x80, %o0
	.word	0xd8b01019	! t0_kref+0x640:   	stha	%o4, [%g0 + %i1]0x80
	.word	0xe64e001a	! t0_kref+0x644:   	ldsb	[%i0 + %i2], %l3
	.word	0xea100018	! t0_kref+0x648:   	lduh	[%g0 + %i0], %l5
	.word	0xd826201c	! t0_kref+0x64c:   	st	%o4, [%i0 + 0x1c]
	.word	0xe600a008	! t0_kref+0x650:   	ld	[%g2 + 8], %l3
	.word	0xec1e3fe8	! t0_kref+0x654:   	ldd	[%i0 - 0x18], %l6
	.word	0xe41f4018	! t0_kref+0x658:   	ldd	[%i5 + %i0], %l2
	.word	0x94132314	! t0_kref+0x65c:   	or	%o4, 0x314, %o2
	.word	0xac1b7f98	! t0_kref+0x660:   	xor	%o5, -0x68, %l6
	.word	0xa5a3092a	! t0_kref+0x664:   	fmuls	%f12, %f10, %f18
	.word	0x26800005	! t0_kref+0x668:   	bl,a	_kref+0x67c
	.word	0xa833000c	! t0_kref+0x66c:   	orn	%o4, %o4, %l4
	.word	0x3d800004	! t0_kref+0x670:   	fbule,a	_kref+0x680
	.word	0x95a2cd2f	! t0_kref+0x674:   	fsmuld	%f11, %f15, %f10
	.word	0xb6103ff4	! t0_kref+0x678:   	mov	0xfffffff4, %i3
	.word	0x95a3884c	! t0_kref+0x67c:   	faddd	%f14, %f12, %f10
	.word	0x9db009ae	! t0_kref+0x680:   	fexpand	%f14, %f14
	.word	0xe51fbcf0	! t0_kref+0x684:   	ldd	[%fp - 0x310], %f18
	.word	0x90c3400c	! t0_kref+0x688:   	addccc	%o5, %o4, %o0
	.word	0xec1e001d	! t0_kref+0x68c:   	ldd	[%i0 + %i5], %l6
	.word	0xa1a00550	! t0_kref+0x690:   	fsqrtd	%f16, %f16
	.word	0xa5a80050	! t0_kref+0x694:   	fmovdn	%fcc0, %f16, %f18
	.word	0xe6965000	! t0_kref+0x698:   	lduha	[%i1]0x80, %l3
	.word	0xe1be588d	! t0_kref+0x69c:   	stda	%f16, [%i1 + %o5]0xc4
	.word	0xd9be588c	! t0_kref+0x6a0:   	stda	%f12, [%i1 + %o4]0xc4
	.word	0xd51fbe20	! t0_kref+0x6a4:   	ldd	[%fp - 0x1e0], %f10
	.word	0x9fc10000	! t0_kref+0x6a8:   	call	%g4
	.word	0xd700a008	! t0_kref+0x6ac:   	ld	[%g2 + 8], %f11
	.word	0xa1a000ce	! t0_kref+0x6b0:   	fnegd	%f14, %f16
	.word	0xa53b200e	! t0_kref+0x6b4:   	sra	%o4, 0xe, %l2
	.word	0xe2062014	! t0_kref+0x6b8:   	ld	[%i0 + 0x14], %l1
	.word	0xd86e201d	! t0_kref+0x6bc:   	ldstub	[%i0 + 0x1d], %o4
	.word	0x95a2894c	! t0_kref+0x6c0:   	fmuld	%f10, %f12, %f10
	.word	0xee100019	! t0_kref+0x6c4:   	lduh	[%g0 + %i1], %l7
	.word	0x3f800004	! t0_kref+0x6c8:   	fbo,a	_kref+0x6d8
	.word	0x9db2890e	! t0_kref+0x6cc:   	faligndata	%f10, %f14, %f14
	.word	0xa1a4482f	! t0_kref+0x6d0:   	fadds	%f17, %f15, %f16
	.word	0x909b3b69	! t0_kref+0x6d4:   	xorcc	%o4, -0x497, %o0
	.word	0xe3e6100c	! t0_kref+0x6d8:   	casa	[%i0]0x80, %o4, %l1
	.word	0xa72b200a	! t0_kref+0x6dc:   	sll	%o4, 0xa, %l3
	.word	0xa5b48d10	! t0_kref+0x6e0:   	fandnot1	%f18, %f16, %f18
	.word	0xe76e7fe0	! t0_kref+0x6e4:   	prefetch	%i1 - 0x20, 19
	.word	0xe1be188c	! t0_kref+0x6e8:   	stda	%f16, [%i0 + %o4]0xc4
	.word	0xa7b3010d	! t0_kref+0x6ec:   	edge32	%o4, %o5, %l3
	.word	0x96fb62b8	! t0_kref+0x6f0:   	sdivcc	%o5, 0x2b8, %o3
	.word	0x35480004	! t0_kref+0x6f4:   	fbue,a,pt	%fcc0, _kref+0x704
	.word	0x99b48990	! t0_kref+0x6f8:   	bshuffle	%f18, %f16, %f12
	.word	0xe100a000	! t0_kref+0x6fc:   	ld	[%g2], %f16
	.word	0xaa9331de	! t0_kref+0x700:   	orcc	%o4, -0xe22, %l5
	.word	0x95a40952	! t0_kref+0x704:   	fmuld	%f16, %f18, %f10
	.word	0xee067ff4	! t0_kref+0x708:   	ld	[%i1 - 0xc], %l7
	.word	0xd08e501a	! t0_kref+0x70c:   	lduba	[%i1 + %i2]0x80, %o0
	.word	0xe13e2010	! t0_kref+0x710:   	std	%f16, [%i0 + 0x10]
	.word	0x9fc00004	! t0_kref+0x714:   	call	%g0 + %g4
	.word	0xda20a000	! t0_kref+0x718:   	st	%o5, [%g2]
	.word	0xab3b601f	! t0_kref+0x71c:   	sra	%o5, 0x1f, %l5
	.word	0xc078a020	! t0_kref+0x720:   	swap	[%g2 + 0x20], %g0
	.word	0xec4e8019	! t0_kref+0x724:   	ldsb	[%i2 + %i1], %l6
	.word	0xd7871019	! t0_kref+0x728:   	lda	[%i4 + %i1]0x80, %f11
	.word	0xd826201c	! t0_kref+0x72c:   	st	%o4, [%i0 + 0x1c]
	.word	0xe53e2008	! t0_kref+0x730:   	std	%f18, [%i0 + 8]
	.word	0xda28a00c	! t0_kref+0x734:   	stb	%o5, [%g2 + 0xc]
	.word	0xdd3e3ff8	! t0_kref+0x738:   	std	%f14, [%i0 - 8]
	.word	0xea08a00e	! t0_kref+0x73c:   	ldub	[%g2 + 0xe], %l5
	.word	0xee08a03c	! t0_kref+0x740:   	ldub	[%g2 + 0x3c], %l7
	.word	0x23480001	! t0_kref+0x744:   	fbne,a,pt	%fcc0, _kref+0x748
	.word	0xa8a3400c	! t0_kref+0x748:   	subcc	%o5, %o4, %l4
	.word	0x99a288b1	! t0_kref+0x74c:   	fsubs	%f10, %f17, %f12
	.word	0x9ba00531	! t0_kref+0x750:   	fsqrts	%f17, %f13
	.word	0x9db28972	! t0_kref+0x754:   	fpmerge	%f10, %f18, %f14
	.word	0x99b40d40	! t0_kref+0x758:   	fnot1	%f16, %f12
	.word	0xe01e3ff8	! t0_kref+0x75c:   	ldd	[%i0 - 8], %l0
	.word	0xe1180019	! t0_kref+0x760:   	ldd	[%g0 + %i1], %f16
	.word	0x29800002	! t0_kref+0x764:   	fbl,a	_kref+0x76c
	.word	0xa5a2c8aa	! t0_kref+0x768:   	fsubs	%f11, %f10, %f18
	.word	0x9fc10000	! t0_kref+0x76c:   	call	%g4
	.word	0xd67e601c	! t0_kref+0x770:   	swap	[%i1 + 0x1c], %o3
	.word	0xa1a0052e	! t0_kref+0x774:   	fsqrts	%f14, %f16
	.word	0xa5b4cd31	! t0_kref+0x778:   	fandnot1s	%f19, %f17, %f18
	.word	0xdab6501b	! t0_kref+0x77c:   	stha	%o5, [%i1 + %i3]0x80
	.word	0xe848a038	! t0_kref+0x780:   	ldsb	[%g2 + 0x38], %l4
	.word	0xdd06201c	! t0_kref+0x784:   	ld	[%i0 + 0x1c], %f14
	.word	0x35800007	! t0_kref+0x788:   	fbue,a	_kref+0x7a4
	.word	0xe1be580c	! t0_kref+0x78c:   	stda	%f16, [%i1 + %o4]0xc0
	.word	0xda30a006	! t0_kref+0x790:   	sth	%o5, [%g2 + 6]
	.word	0xadb3058e	! t0_kref+0x794:   	fcmpgt32	%f12, %f14, %l6
	.word	0x3e800005	! t0_kref+0x798:   	bvc,a	_kref+0x7ac
	.word	0x9da0052f	! t0_kref+0x79c:   	fsqrts	%f15, %f14
	.word	0xe03e7fe8	! t0_kref+0x7a0:   	std	%l0, [%i1 - 0x18]
	.word	0x8143c000	! t0_kref+0x7a4:   	stbar
	.word	0x97a4c9b3	! t0_kref+0x7a8:   	fdivs	%f19, %f19, %f11
	.word	0x9fa0052e	! t0_kref+0x7ac:   	fsqrts	%f14, %f15
	.word	0xe59e5000	! t0_kref+0x7b0:   	ldda	[%i1]0x80, %f18
	.word	0x2b800003	! t0_kref+0x7b4:   	fbug,a	_kref+0x7c0
	.word	0x99b386d2	! t0_kref+0x7b8:   	fmul8sux16	%f14, %f18, %f12
	.word	0xe0180018	! t0_kref+0x7bc:   	ldd	[%g0 + %i0], %l0
	.word	0xc807bfec	! t0_kref+0x7c0:   	ld	[%fp - 0x14], %g4
	.word	0xee4e8018	! t0_kref+0x7c4:   	ldsb	[%i2 + %i0], %l7
	.word	0xe3a61000	! t0_kref+0x7c8:   	sta	%f17, [%i0]0x80
	.word	0xa5a8c04e	! t0_kref+0x7cc:   	fmovdul	%fcc0, %f14, %f18
	.word	0xd4270000	! t0_kref+0x7d0:   	st	%o2, [%i4]
	.word	0x81aa8ab1	! t0_kref+0x7d4:   	fcmpes	%fcc0, %f10, %f17
	.word	0xa6c3000c	! t0_kref+0x7d8:   	addccc	%o4, %o4, %l3
	.word	0x95a00552	! t0_kref+0x7dc:   	fsqrtd	%f18, %f10
	.word	0x81df6f56	! t0_kref+0x7e0:   	flush	%i5 + 0xf56
	.word	0x29480004	! t0_kref+0x7e4:   	fbl,a,pt	%fcc0, _kref+0x7f4
	.word	0xe400a020	! t0_kref+0x7e8:   	ld	[%g2 + 0x20], %l2
	.word	0x23480002	! t0_kref+0x7ec:   	fbne,a,pt	%fcc0, _kref+0x7f4
	.word	0x9da00552	! t0_kref+0x7f0:   	fsqrtd	%f18, %f14
	.word	0xa7a00531	! t0_kref+0x7f4:   	fsqrts	%f17, %f19
	.word	0xd8270019	! t0_kref+0x7f8:   	st	%o4, [%i4 + %i1]
	.word	0xa7a0188d	! t0_kref+0x7fc:   	fitos	%f13, %f19
	.word	0x9bab4031	! t0_kref+0x800:   	fmovsle	%fcc0, %f17, %f13
	.word	0xa5a4092d	! t0_kref+0x804:   	fmuls	%f16, %f13, %f18
	.word	0xa5a2894e	! t0_kref+0x808:   	fmuld	%f10, %f14, %f18
	.word	0x3e800003	! t0_kref+0x80c:   	bvc,a	_kref+0x818
	.word	0xe100a000	! t0_kref+0x810:   	ld	[%g2], %f16
	.word	0x97a2c92f	! t0_kref+0x814:   	fmuls	%f11, %f15, %f11
	.word	0xa5b38d8c	! t0_kref+0x818:   	fxor	%f14, %f12, %f18
	.word	0xa3a0108e	! t0_kref+0x81c:   	fxtos	%f14, %f17
	.word	0x9db40af2	! t0_kref+0x820:   	fpsub32s	%f16, %f18, %f14
	.word	0xa5a40952	! t0_kref+0x824:   	fmuld	%f16, %f18, %f18
	.word	0xf7ee101d	! t0_kref+0x828:   	prefetcha	%i0 + %i5, 27
	.word	0xd920a000	! t0_kref+0x82c:   	st	%f12, [%g2]
	.word	0x81abcab0	! t0_kref+0x830:   	fcmpes	%fcc0, %f15, %f16
	.word	0x95a4092e	! t0_kref+0x834:   	fmuls	%f16, %f14, %f10
	.word	0x86102003	! t0_kref+0x838:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x83c:   	bne,a	_kref+0x83c
	.word	0x86a0e001	! t0_kref+0x840:   	subcc	%g3, 1, %g3
	.word	0xa3a4482f	! t0_kref+0x844:   	fadds	%f17, %f15, %f17
	.word	0xa7b2caf0	! t0_kref+0x848:   	fpsub32s	%f11, %f16, %f19
	.word	0xa80b3e3f	! t0_kref+0x84c:   	and	%o4, -0x1c1, %l4
	.word	0x8143c000	! t0_kref+0x850:   	stbar
	.word	0x2f800008	! t0_kref+0x854:   	fbu,a	_kref+0x874
	.word	0xe51fbda0	! t0_kref+0x858:   	ldd	[%fp - 0x260], %f18
	.word	0xdda01019	! t0_kref+0x85c:   	sta	%f14, [%g0 + %i1]0x80
	.word	0xe36e2008	! t0_kref+0x860:   	prefetch	%i0 + 8, 17
	.word	0x961b3486	! t0_kref+0x864:   	xor	%o4, -0xb7a, %o3
	.word	0x81accaab	! t0_kref+0x868:   	fcmpes	%fcc0, %f19, %f11
	.word	0xd53e001d	! t0_kref+0x86c:   	std	%f10, [%i0 + %i5]
	.word	0xda264000	! t0_kref+0x870:   	st	%o5, [%i1]
	.word	0xf16e401b	! t0_kref+0x874:   	prefetch	%i1 + %i3, 24
	.word	0xe60e7ff9	! t0_kref+0x878:   	ldub	[%i1 - 7], %l3
	.word	0x9fa01a52	! t0_kref+0x87c:   	fdtoi	%f18, %f15
	.word	0xa93b600a	! t0_kref+0x880:   	sra	%o5, 0xa, %l4
	.word	0xe1be1a1a	! t0_kref+0x884:   	stda	%f16, [%i0 + %i2]0xd0
	.word	0xed68a047	! t0_kref+0x888:   	prefetch	%g2 + 0x47, 22
	.word	0x99b286d2	! t0_kref+0x88c:   	fmul8sux16	%f10, %f18, %f12
	.word	0xea901018	! t0_kref+0x890:   	lduha	[%g0 + %i0]0x80, %l5
	.word	0xab2b2007	! t0_kref+0x894:   	sll	%o4, 0x7, %l5
	.word	0xa5b30670	! t0_kref+0x898:   	fmul8x16au	%f12, %f16, %f18
	.word	0x92e3000d	! t0_kref+0x89c:   	subccc	%o4, %o5, %o1
	.word	0xab400000	! t0_kref+0x8a0:   	mov	%y, %l5
	.word	0x9013000d	! t0_kref+0x8a4:   	or	%o4, %o5, %o0
	.word	0x91b3008d	! t0_kref+0x8a8:   	edge16	%o4, %o5, %o0
	.word	0xd210a012	! t0_kref+0x8ac:   	lduh	[%g2 + 0x12], %o1
	.word	0x8143e040	! t0_kref+0x8b0:   	membar	0x40
	.word	0xa1b38ea0	! t0_kref+0x8b4:   	fsrc1s	%f14, %f16
	.word	0x9333000d	! t0_kref+0x8b8:   	srl	%o4, %o5, %o1
	.word	0x95a00033	! t0_kref+0x8bc:   	fmovs	%f19, %f10
	.word	0xd2680018	! t0_kref+0x8c0:   	ldstub	[%g0 + %i0], %o1
	.word	0x81ac0aad	! t0_kref+0x8c4:   	fcmpes	%fcc0, %f16, %f13
	.word	0x9da44833	! t0_kref+0x8c8:   	fadds	%f17, %f19, %f14
	.word	0x2d800004	! t0_kref+0x8cc:   	fbg,a	_kref+0x8dc
	.word	0x99abc04e	! t0_kref+0x8d0:   	fmovdo	%fcc0, %f14, %f12
	.word	0xa3703d8c	! t0_kref+0x8d4:   	popc	-0x274, %l1
	.word	0x91400000	! t0_kref+0x8d8:   	mov	%y, %o0
	.word	0xa3b48aac	! t0_kref+0x8dc:   	fpsub16s	%f18, %f12, %f17
	.word	0xd51e6018	! t0_kref+0x8e0:   	ldd	[%i1 + 0x18], %f10
	.word	0x22480008	! t0_kref+0x8e4:   	be,a,pt	%icc, _kref+0x904
	.word	0xe96e001d	! t0_kref+0x8e8:   	prefetch	%i0 + %i5, 20
	.word	0xa1a408d0	! t0_kref+0x8ec:   	fsubd	%f16, %f16, %f16
	.word	0x23480001	! t0_kref+0x8f0:   	fbne,a,pt	%fcc0, _kref+0x8f4
	.word	0xa8fb7f4b	! t0_kref+0x8f4:   	sdivcc	%o5, -0xb5, %l4
	.word	0xa8933cea	! t0_kref+0x8f8:   	orcc	%o4, -0x316, %l4
	.word	0xaa932e77	! t0_kref+0x8fc:   	orcc	%o4, 0xe77, %l5
	.word	0xa1b30ecc	! t0_kref+0x900:   	fornot2	%f12, %f12, %f16
	.word	0xab3b201a	! t0_kref+0x904:   	sra	%o4, 0x1a, %l5
	.word	0x9de3bfa0	! t0_kref+0x908:   	save	%sp, -0x60, %sp
	.word	0xbadec01d	! t0_kref+0x90c:   	smulcc	%i3, %i5, %i5
	.word	0xabef2c5a	! t0_kref+0x910:   	restore	%i4, 0xc5a, %l5
	.word	0xc96e3fe8	! t0_kref+0x914:   	prefetch	%i0 - 0x18, 4
	.word	0xea06001c	! t0_kref+0x918:   	ld	[%i0 + %i4], %l5
	.word	0xa1a0110a	! t0_kref+0x91c:   	fxtod	%f10, %f16
	.word	0x2f480006	! t0_kref+0x920:   	fbu,a,pt	%fcc0, _kref+0x938
	.word	0xad400000	! t0_kref+0x924:   	mov	%y, %l6
	.word	0xc807bff0	! t0_kref+0x928:   	ld	[%fp - 0x10], %g4
	.word	0x9db40a0e	! t0_kref+0x92c:   	fpadd16	%f16, %f14, %f14
	.word	0xa1a01890	! t0_kref+0x930:   	fitos	%f16, %f16
	.word	0xe608a020	! t0_kref+0x934:   	ldub	[%g2 + 0x20], %l3
	.word	0x9da0054c	! t0_kref+0x938:   	fsqrtd	%f12, %f14
	.word	0xaa63400c	! t0_kref+0x93c:   	subc	%o5, %o4, %l5
	.word	0xe20e8019	! t0_kref+0x940:   	ldub	[%i2 + %i1], %l1
	.word	0xa7a018d2	! t0_kref+0x944:   	fdtos	%f18, %f19
	.word	0xee6e8019	! t0_kref+0x948:   	ldstub	[%i2 + %i1], %l7
	.word	0x9613400d	! t0_kref+0x94c:   	or	%o5, %o5, %o3
	.word	0x9fc10000	! t0_kref+0x950:   	call	%g4
	.word	0xa5400000	! t0_kref+0x954:   	mov	%y, %l2
	.word	0x9de3bfa0	! t0_kref+0x958:   	save	%sp, -0x60, %sp
	.word	0xa7ee22e9	! t0_kref+0x95c:   	restore	%i0, 0x2e9, %l3
	.word	0xda200018	! t0_kref+0x960:   	st	%o5, [%g0 + %i0]
	.word	0xa3418000	! t0_kref+0x964:   	mov	%fprs, %l1
	.word	0x2e480007	! t0_kref+0x968:   	bvs,a,pt	%icc, _kref+0x984
	.word	0xe03e4000	! t0_kref+0x96c:   	std	%l0, [%i1]
	.word	0xa5b2c672	! t0_kref+0x970:   	fmul8x16au	%f11, %f18, %f18
	.word	0xed20001c	! t0_kref+0x974:   	st	%f22, [%g0 + %i4]
	.word	0xa5b4066f	! t0_kref+0x978:   	fmul8x16au	%f16, %f15, %f18
	.word	0xa1b48f90	! t0_kref+0x97c:   	for	%f18, %f16, %f16
	.word	0x3c480003	! t0_kref+0x980:   	bpos,a,pt	%icc, _kref+0x98c
	.word	0xe1981018	! t0_kref+0x984:   	ldda	[%g0 + %i0]0x80, %f16
	.word	0x27480002	! t0_kref+0x988:   	fbul,a,pt	%fcc0, _kref+0x990
	.word	0x91702958	! t0_kref+0x98c:   	popc	0x958, %o0
	.word	0x81b01023	! t0_kref+0x990:   	siam	0x3
	.word	0xad2b400c	! t0_kref+0x994:   	sll	%o5, %o4, %l6
	.word	0x9fc10000	! t0_kref+0x998:   	call	%g4
	.word	0xa5a3c932	! t0_kref+0x99c:   	fmuls	%f15, %f18, %f18
	.word	0xe2080019	! t0_kref+0x9a0:   	ldub	[%g0 + %i1], %l1
	.word	0x81ab4aae	! t0_kref+0x9a4:   	fcmpes	%fcc0, %f13, %f14
	.word	0xd60e0000	! t0_kref+0x9a8:   	ldub	[%i0], %o3
	.word	0x86102001	! t0_kref+0x9ac:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x9b0:   	bne,a	_kref+0x9b0
	.word	0x86a0e001	! t0_kref+0x9b4:   	subcc	%g3, 1, %g3
	.word	0xaa236b81	! t0_kref+0x9b8:   	sub	%o5, 0xb81, %l5
	.word	0xd648a015	! t0_kref+0x9bc:   	ldsb	[%g2 + 0x15], %o3
	.word	0xed6e7ff0	! t0_kref+0x9c0:   	prefetch	%i1 - 0x10, 22
	.word	0xea40a030	! t0_kref+0x9c4:   	ldsw	[%g2 + 0x30], %l5
	.word	0xe01e401d	! t0_kref+0x9c8:   	ldd	[%i1 + %i5], %l0
	.word	0xad2b000d	! t0_kref+0x9cc:   	sll	%o4, %o5, %l6
	.word	0x97b3410c	! t0_kref+0x9d0:   	edge32	%o5, %o4, %o3
	.word	0xa9400000	! t0_kref+0x9d4:   	mov	%y, %l4
	.word	0x99a0052f	! t0_kref+0x9d8:   	fsqrts	%f15, %f12
	.word	0xaaa33b40	! t0_kref+0x9dc:   	subcc	%o4, -0x4c0, %l5
	.word	0x38480006	! t0_kref+0x9e0:   	bgu,a,pt	%icc, _kref+0x9f8
	.word	0x9db40d12	! t0_kref+0x9e4:   	fandnot1	%f16, %f18, %f14
	.word	0xd40e8019	! t0_kref+0x9e8:   	ldub	[%i2 + %i1], %o2
	.word	0x35800005	! t0_kref+0x9ec:   	fbue,a	_kref+0xa00
	.word	0x92737105	! t0_kref+0x9f0:   	udiv	%o5, -0xefb, %o1
	.word	0x81ac4aac	! t0_kref+0x9f4:   	fcmpes	%fcc0, %f17, %f12
	.word	0xa5a409d2	! t0_kref+0x9f8:   	fdivd	%f16, %f18, %f18
	.word	0x95a01893	! t0_kref+0x9fc:   	fitos	%f19, %f10
	.word	0xd4080019	! t0_kref+0xa00:   	ldub	[%g0 + %i1], %o2
	.word	0x33800004	! t0_kref+0xa04:   	fbe,a	_kref+0xa14
	.word	0x9da30850	! t0_kref+0xa08:   	faddd	%f12, %f16, %f14
	.word	0x971b000c	! t0_kref+0xa0c:   	tsubcctv	%o4, %o4, %o3
	.word	0xa5a0054c	! t0_kref+0xa10:   	fsqrtd	%f12, %f18
	.word	0xe500a014	! t0_kref+0xa14:   	ld	[%g2 + 0x14], %f18
	.word	0xa6b326c4	! t0_kref+0xa18:   	orncc	%o4, 0x6c4, %l3
	.word	0x9da0054a	! t0_kref+0xa1c:   	fsqrtd	%f10, %f14
	.word	0x99b38d60	! t0_kref+0xa20:   	fnot1s	%f14, %f12
	.word	0x99b4cd2d	! t0_kref+0xa24:   	fandnot1s	%f19, %f13, %f12
	.word	0x9da288ce	! t0_kref+0xa28:   	fsubd	%f10, %f14, %f14
	.word	0xd4580019	! t0_kref+0xa2c:   	ldx	[%g0 + %i1], %o2
	.word	0x28800006	! t0_kref+0xa30:   	bleu,a	_kref+0xa48
	.word	0xe51e3ff0	! t0_kref+0xa34:   	ldd	[%i0 - 0x10], %f18
	.word	0x97a44932	! t0_kref+0xa38:   	fmuls	%f17, %f18, %f11
	.word	0xd700a028	! t0_kref+0xa3c:   	ld	[%g2 + 0x28], %f11
	.word	0xa1a01892	! t0_kref+0xa40:   	fitos	%f18, %f16
	.word	0x2f800002	! t0_kref+0xa44:   	fbu,a	_kref+0xa4c
	.word	0xa483400d	! t0_kref+0xa48:   	addcc	%o5, %o5, %l2
	.word	0xe8ce505a	! t0_kref+0xa4c:   	ldsba	[%i1 + %i2]0x82, %l4
	.word	0xaca337c5	! t0_kref+0xa50:   	subcc	%o4, -0x83b, %l6
	.word	0xa52b2018	! t0_kref+0xa54:   	sll	%o4, 0x18, %l2
	.word	0xa5b3010d	! t0_kref+0xa58:   	edge32	%o4, %o5, %l2
	.word	0xab2b000c	! t0_kref+0xa5c:   	sll	%o4, %o4, %l5
	.word	0xa303675c	! t0_kref+0xa60:   	taddcc	%o5, 0x75c, %l1
	.word	0xae237596	! t0_kref+0xa64:   	sub	%o5, -0xa6a, %l7
	.word	0x97a2c82b	! t0_kref+0xa68:   	fadds	%f11, %f11, %f11
	.word	0x951b000c	! t0_kref+0xa6c:   	tsubcctv	%o4, %o4, %o2
	.word	0xea16201e	! t0_kref+0xa70:   	lduh	[%i0 + 0x1e], %l5
	.word	0xd9be188d	! t0_kref+0xa74:   	stda	%f12, [%i0 + %o5]0xc4
	.word	0x23480002	! t0_kref+0xa78:   	fbne,a,pt	%fcc0, _kref+0xa80
	.word	0xa9b3014d	! t0_kref+0xa7c:   	edge32l	%o4, %o5, %l4
	.word	0xedee101a	! t0_kref+0xa80:   	prefetcha	%i0 + %i2, 22
	.word	0xaa93400d	! t0_kref+0xa84:   	orcc	%o5, %o5, %l5
	.word	0xee4e3feb	! t0_kref+0xa88:   	ldsb	[%i0 - 0x15], %l7
	.word	0xe41e3fe0	! t0_kref+0xa8c:   	ldd	[%i0 - 0x20], %l2
	.word	0xa7400000	! t0_kref+0xa90:   	mov	%y, %l3
	.word	0xc3ee500d	! t0_kref+0xa94:   	prefetcha	%i1 + %o5, 1
	.word	0x95a000d0	! t0_kref+0xa98:   	fnegd	%f16, %f10
	.word	0xd050a038	! t0_kref+0xa9c:   	ldsh	[%g2 + 0x38], %o0
	.word	0xff6e2018	! t0_kref+0xaa0:   	prefetch	%i0 + 0x18, 31
	.word	0xec1e2018	! t0_kref+0xaa4:   	ldd	[%i0 + 0x18], %l6
	.word	0xe100a03c	! t0_kref+0xaa8:   	ld	[%g2 + 0x3c], %f16
	.word	0xd448a000	! t0_kref+0xaac:   	ldsb	[%g2], %o2
	.word	0xd010a02e	! t0_kref+0xab0:   	lduh	[%g2 + 0x2e], %o0
	.word	0x9da00031	! t0_kref+0xab4:   	fmovs	%f17, %f14
	.word	0xa2c3000c	! t0_kref+0xab8:   	addccc	%o4, %o4, %l1
	.word	0x3f800004	! t0_kref+0xabc:   	fbo,a	_kref+0xacc
	.word	0x929b6e3d	! t0_kref+0xac0:   	xorcc	%o5, 0xe3d, %o1
	.word	0x95a00552	! t0_kref+0xac4:   	fsqrtd	%f18, %f10
	.word	0xa7a4882f	! t0_kref+0xac8:   	fadds	%f18, %f15, %f19
	.word	0xa27b000d	! t0_kref+0xacc:   	sdiv	%o4, %o5, %l1
	.word	0xe6ff1019	! t0_kref+0xad0:   	swapa	[%i4 + %i1]0x80, %l3
	.word	0xa5b48a10	! t0_kref+0xad4:   	fpadd16	%f18, %f16, %f18
	.word	0xa7a0052f	! t0_kref+0xad8:   	fsqrts	%f15, %f19
	.word	0x95b4840c	! t0_kref+0xadc:   	fcmple16	%f18, %f12, %o2
	.word	0x99b48a0c	! t0_kref+0xae0:   	fpadd16	%f18, %f12, %f12
	.word	0xd0881019	! t0_kref+0xae4:   	lduba	[%g0 + %i1]0x80, %o0
	.word	0x91b3410c	! t0_kref+0xae8:   	edge32	%o5, %o4, %o0
	.word	0xda2e4000	! t0_kref+0xaec:   	stb	%o5, [%i1]
	.word	0x99a00552	! t0_kref+0xaf0:   	fsqrtd	%f18, %f12
	.word	0xaaa3000d	! t0_kref+0xaf4:   	subcc	%o4, %o5, %l5
	.word	0x9fc00004	! t0_kref+0xaf8:   	call	%g0 + %g4
	.word	0x97a48930	! t0_kref+0xafc:   	fmuls	%f18, %f16, %f11
	.word	0x900b400d	! t0_kref+0xb00:   	and	%o5, %o5, %o0
	.word	0x3d480004	! t0_kref+0xb04:   	fbule,a,pt	%fcc0, _kref+0xb14
	.word	0xec965000	! t0_kref+0xb08:   	lduha	[%i1]0x80, %l6
	.word	0x95a0052a	! t0_kref+0xb0c:   	fsqrts	%f10, %f10
	.word	0x9fa01890	! t0_kref+0xb10:   	fitos	%f16, %f15
	.word	0xa7a01a52	! t0_kref+0xb14:   	fdtoi	%f18, %f19
	.word	0xaf3b400c	! t0_kref+0xb18:   	sra	%o5, %o4, %l7
	.word	0xa803000c	! t0_kref+0xb1c:   	add	%o4, %o4, %l4
	.word	0xe03e3ff0	! t0_kref+0xb20:   	std	%l0, [%i0 - 0x10]
	.word	0x8143c000	! t0_kref+0xb24:   	stbar
	.word	0x2a800001	! t0_kref+0xb28:   	bcs,a	_kref+0xb2c
	.word	0xe51fbe60	! t0_kref+0xb2c:   	ldd	[%fp - 0x1a0], %f18
	.word	0xd8280018	! t0_kref+0xb30:   	stb	%o4, [%g0 + %i0]
	.word	0x9da2c82b	! t0_kref+0xb34:   	fadds	%f11, %f11, %f14
	.word	0xe200a004	! t0_kref+0xb38:   	ld	[%g2 + 4], %l1
	.word	0x8143e040	! t0_kref+0xb3c:   	membar	0x40
	.word	0x3d480004	! t0_kref+0xb40:   	fbule,a,pt	%fcc0, _kref+0xb50
	.word	0xa863400c	! t0_kref+0xb44:   	subc	%o5, %o4, %l4
	.word	0x81ab4ab2	! t0_kref+0xb48:   	fcmpes	%fcc0, %f13, %f18
	.word	0xe600a020	! t0_kref+0xb4c:   	ld	[%g2 + 0x20], %l3
	.word	0x81aa8acc	! t0_kref+0xb50:   	fcmped	%fcc0, %f10, %f12
	.word	0x973b400d	! t0_kref+0xb54:   	sra	%o5, %o5, %o3
	.word	0x81ac4aaa	! t0_kref+0xb58:   	fcmpes	%fcc0, %f17, %f10
	.word	0x99a0110a	! t0_kref+0xb5c:   	fxtod	%f10, %f12
	.word	0xa413400c	! t0_kref+0xb60:   	or	%o5, %o4, %l2
	.word	0xabb48412	! t0_kref+0xb64:   	fcmple16	%f18, %f18, %l5
	.word	0x95a0054a	! t0_kref+0xb68:   	fsqrtd	%f10, %f10
	.word	0x39800002	! t0_kref+0xb6c:   	fbuge,a	_kref+0xb74
	.word	0x952b6002	! t0_kref+0xb70:   	sll	%o5, 0x2, %o2
	.word	0x86102002	! t0_kref+0xb74:   	mov	0x2, %g3
	.word	0x86a0e001	! t0_kref+0xb78:   	subcc	%g3, 1, %g3
	.word	0x22800015	! t0_kref+0xb7c:   	be,a	_kref+0xbd0
	.word	0xec48a010	! t0_kref+0xb80:   	ldsb	[%g2 + 0x10], %l6
	.word	0x81ac0a50	! t0_kref+0xb84:   	fcmpd	%fcc0, %f16, %f16
	.word	0xa1a4094c	! t0_kref+0xb88:   	fmuld	%f16, %f12, %f16
	.word	0xa293000c	! t0_kref+0xb8c:   	orcc	%o4, %o4, %l1
	.word	0x99a0054e	! t0_kref+0xb90:   	fsqrtd	%f14, %f12
	.word	0xee000018	! t0_kref+0xb94:   	ld	[%g0 + %i0], %l7
	.word	0xa1b28ecc	! t0_kref+0xb98:   	fornot2	%f10, %f12, %f16
	.word	0xa7a44931	! t0_kref+0xb9c:   	fmuls	%f17, %f17, %f19
	.word	0xd04e600a	! t0_kref+0xba0:   	ldsb	[%i1 + 0xa], %o0
	.word	0xa5b009aa	! t0_kref+0xba4:   	fexpand	%f10, %f18
	.word	0xa1b48f92	! t0_kref+0xba8:   	for	%f18, %f18, %f16
	.word	0xdb060000	! t0_kref+0xbac:   	ld	[%i0], %f13
	.word	0x29800006	! t0_kref+0xbb0:   	fbl,a	_kref+0xbc8
	.word	0xd0480018	! t0_kref+0xbb4:   	ldsb	[%g0 + %i0], %o0
	.word	0xa2a3400d	! t0_kref+0xbb8:   	subcc	%o5, %o5, %l1
	.word	0xea06001c	! t0_kref+0xbbc:   	ld	[%i0 + %i4], %l5
	.word	0x99a00550	! t0_kref+0xbc0:   	fsqrtd	%f16, %f12
	.word	0xa3b3016d	! t0_kref+0xbc4:   	edge32ln	%o4, %o5, %l1
	.word	0xe03e401d	! t0_kref+0xbc8:   	std	%l0, [%i1 + %i5]
	.word	0x9fc10000	! t0_kref+0xbcc:   	call	%g4
	.word	0xa1a0054a	! t0_kref+0xbd0:   	fsqrtd	%f10, %f16
	.word	0x9da4cd2a	! t0_kref+0xbd4:   	fsmuld	%f19, %f10, %f14
	.word	0xc06e401a	! t0_kref+0xbd8:   	ldstub	[%i1 + %i2], %g0
	.word	0xe240a034	! t0_kref+0xbdc:   	ldsw	[%g2 + 0x34], %l1
	.word	0x8143c000	! t0_kref+0xbe0:   	stbar
	.word	0xd51fbce0	! t0_kref+0xbe4:   	ldd	[%fp - 0x320], %f10
	.word	0x29800004	! t0_kref+0xbe8:   	fbl,a	_kref+0xbf8
	.word	0xd51fbc38	! t0_kref+0xbec:   	ldd	[%fp - 0x3c8], %f10
	.word	0x95a0054e	! t0_kref+0xbf0:   	fsqrtd	%f14, %f10
	.word	0xd86e4000	! t0_kref+0xbf4:   	ldstub	[%i1], %o4
	.word	0x9de3bfa0	! t0_kref+0xbf8:   	save	%sp, -0x60, %sp
	.word	0xafef7ef2	! t0_kref+0xbfc:   	restore	%i5, -0x10e, %l7
	.word	0x2d480007	! t0_kref+0xc00:   	fbg,a,pt	%fcc0, _kref+0xc1c
	.word	0xa49b7e9f	! t0_kref+0xc04:   	xorcc	%o5, -0x161, %l2
	.word	0xaac3000c	! t0_kref+0xc08:   	addccc	%o4, %o4, %l5
	.word	0x969b67ca	! t0_kref+0xc0c:   	xorcc	%o5, 0x7ca, %o3
	.word	0xa5a4c82d	! t0_kref+0xc10:   	fadds	%f19, %f13, %f18
	.word	0x95a0054a	! t0_kref+0xc14:   	fsqrtd	%f10, %f10
	.word	0xe6680018	! t0_kref+0xc18:   	ldstub	[%g0 + %i0], %l3
	.word	0xa93b601b	! t0_kref+0xc1c:   	sra	%o5, 0x1b, %l4
	.word	0xab23000d	! t0_kref+0xc20:   	mulscc	%o4, %o5, %l5
	.word	0x99b38a10	! t0_kref+0xc24:   	fpadd16	%f14, %f16, %f12
	.word	0xea2827f2	! t0_kref+0xc28:   	stb	%l5, [%g0 + 0x7f2]
	.word	0x90fb2608	! t0_kref+0xc2c:   	sdivcc	%o4, 0x608, %o0
	.word	0x92c37827	! t0_kref+0xc30:   	addccc	%o5, -0x7d9, %o1
	.word	0xa5a408cc	! t0_kref+0xc34:   	fsubd	%f16, %f12, %f18
	.word	0xa5a4894e	! t0_kref+0xc38:   	fmuld	%f18, %f14, %f18
	.word	0xadb3004d	! t0_kref+0xc3c:   	edge8l	%o4, %o5, %l6
	.word	0x3f800005	! t0_kref+0xc40:   	fbo,a	_kref+0xc54
	.word	0x99b4cd30	! t0_kref+0xc44:   	fandnot1s	%f19, %f16, %f12
	.word	0xa4fb000c	! t0_kref+0xc48:   	sdivcc	%o4, %o4, %l2
	.word	0x912b400c	! t0_kref+0xc4c:   	sll	%o5, %o4, %o0
	.word	0xaa13400c	! t0_kref+0xc50:   	or	%o5, %o4, %l5
	.word	0xc807bfec	! t0_kref+0xc54:   	ld	[%fp - 0x14], %g4
	.word	0xe6080019	! t0_kref+0xc58:   	ldub	[%g0 + %i1], %l3
	.word	0xae2b000d	! t0_kref+0xc5c:   	andn	%o4, %o5, %l7
	.word	0xd68e9018	! t0_kref+0xc60:   	lduba	[%i2 + %i0]0x80, %o3
	.word	0xa1a0102b	! t0_kref+0xc64:   	fstox	%f11, %f16
	.word	0xe13e6000	! t0_kref+0xc68:   	std	%f16, [%i1]
	.word	0xeb68a009	! t0_kref+0xc6c:   	prefetch	%g2 + 9, 21
	.word	0xda26001c	! t0_kref+0xc70:   	st	%o5, [%i0 + %i4]
	.word	0x31800005	! t0_kref+0xc74:   	fba,a	_kref+0xc88
	.word	0xe59f5018	! t0_kref+0xc78:   	ldda	[%i5 + %i0]0x80, %f18
	.word	0x90d3000c	! t0_kref+0xc7c:   	umulcc	%o4, %o4, %o0
	.word	0x9433400c	! t0_kref+0xc80:   	orn	%o5, %o4, %o2
	.word	0xe648a02b	! t0_kref+0xc84:   	ldsb	[%g2 + 0x2b], %l3
	.word	0xa9b34200	! t0_kref+0xc88:   	array8	%o5, %g0, %l4
	.word	0xa5a01a4a	! t0_kref+0xc8c:   	fdtoi	%f10, %f18
	.word	0x9ba018ca	! t0_kref+0xc90:   	fdtos	%f10, %f13
	.word	0xe100a038	! t0_kref+0xc94:   	ld	[%g2 + 0x38], %f16
	.word	0xa1b48f8a	! t0_kref+0xc98:   	for	%f18, %f10, %f16
	.word	0xa6637ebe	! t0_kref+0xc9c:   	subc	%o5, -0x142, %l3
	.word	0xe51fbcc0	! t0_kref+0xca0:   	ldd	[%fp - 0x340], %f18
	.word	0xa82b72aa	! t0_kref+0xca4:   	andn	%o5, -0xd56, %l4
	.word	0xec180018	! t0_kref+0xca8:   	ldd	[%g0 + %i0], %l6
	call	SYM(t0_subr3)
	.word	0x81de0009	! t0_kref+0xcb0:   	flush	%i0 + %o1
	.word	0x9da0012b	! t0_kref+0xcb4:   	fabss	%f11, %f14
	.word	0x9203000c	! t0_kref+0xcb8:   	add	%o4, %o4, %o1
	.word	0x9dab0031	! t0_kref+0xcbc:   	fmovsuge	%fcc0, %f17, %f14
	.word	0xe13f4018	! t0_kref+0xcc0:   	std	%f16, [%i5 + %i0]
	.word	0xe03e401d	! t0_kref+0xcc4:   	std	%l0, [%i1 + %i5]
	.word	0xc568a04f	! t0_kref+0xcc8:   	prefetch	%g2 + 0x4f, 2
	.word	0xdb06401c	! t0_kref+0xccc:   	ld	[%i1 + %i4], %f13
	.word	0xd210a02c	! t0_kref+0xcd0:   	lduh	[%g2 + 0x2c], %o1
	.word	0xe268a01b	! t0_kref+0xcd4:   	ldstub	[%g2 + 0x1b], %l1
	.word	0x96037bdf	! t0_kref+0xcd8:   	add	%o5, -0x421, %o3
	.word	0xac636966	! t0_kref+0xcdc:   	subc	%o5, 0x966, %l6
	.word	0x99b4c971	! t0_kref+0xce0:   	fpmerge	%f19, %f17, %f12
	.word	0x81ab4aab	! t0_kref+0xce4:   	fcmpes	%fcc0, %f13, %f11
	.word	0x95a0108c	! t0_kref+0xce8:   	fxtos	%f12, %f10
	.word	0xa693400d	! t0_kref+0xcec:   	orcc	%o5, %o5, %l3
	.word	0xaa83000d	! t0_kref+0xcf0:   	addcc	%o4, %o5, %l5
	.word	0x9fc00004	! t0_kref+0xcf4:   	call	%g0 + %g4
	.word	0x95a0188b	! t0_kref+0xcf8:   	fitos	%f11, %f10
	.word	0x81aacab0	! t0_kref+0xcfc:   	fcmpes	%fcc0, %f11, %f16
	.word	0xee8e9019	! t0_kref+0xd00:   	lduba	[%i2 + %i1]0x80, %l7
	.word	0x95a0052d	! t0_kref+0xd04:   	fsqrts	%f13, %f10
	.word	0xa53b201f	! t0_kref+0xd08:   	sra	%o4, 0x1f, %l2
	.word	0xa5b28492	! t0_kref+0xd0c:   	fcmple32	%f10, %f18, %l2
	.word	0x8143e040	! t0_kref+0xd10:   	membar	0x40
	.word	0xa823400d	! t0_kref+0xd14:   	sub	%o5, %o5, %l4
	.word	0x95a01a4a	! t0_kref+0xd18:   	fdtoi	%f10, %f10
	.word	0x28800008	! t0_kref+0xd1c:   	bleu,a	_kref+0xd3c
	.word	0xa1a8c04c	! t0_kref+0xd20:   	fmovdul	%fcc0, %f12, %f16
	.word	0x37800006	! t0_kref+0xd24:   	fbge,a	_kref+0xd3c
	.word	0xea4e3ff9	! t0_kref+0xd28:   	ldsb	[%i0 - 7], %l5
	.word	0xa9400000	! t0_kref+0xd2c:   	mov	%y, %l4
	.word	0xe51e401d	! t0_kref+0xd30:   	ldd	[%i1 + %i5], %f18
	.word	0x33800004	! t0_kref+0xd34:   	fbe,a	_kref+0xd44
	.word	0x9db48d2b	! t0_kref+0xd38:   	fandnot1s	%f18, %f11, %f14
	.word	0xa2ab3cfb	! t0_kref+0xd3c:   	andncc	%o4, -0x305, %l1
	.word	0xea4e7ff1	! t0_kref+0xd40:   	ldsb	[%i1 - 0xf], %l5
	.word	0xd920a014	! t0_kref+0xd44:   	st	%f12, [%g2 + 0x14]
	.word	0x9da0054e	! t0_kref+0xd48:   	fsqrtd	%f14, %f14
	.word	0x3d800004	! t0_kref+0xd4c:   	fbule,a	_kref+0xd5c
	.word	0xe6de501d	! t0_kref+0xd50:   	ldxa	[%i1 + %i5]0x80, %l3
	.word	0xe03e6008	! t0_kref+0xd54:   	std	%l0, [%i1 + 8]
	.word	0x81dbbf3f	! t0_kref+0xd58:   	flush	%sp - 0xc1
	.word	0xd9beda58	! t0_kref+0xd5c:   	stda	%f12, [%i3 + %i0]0xd2
	.word	0x95b2cf6c	! t0_kref+0xd60:   	fornot1s	%f11, %f12, %f10
	.word	0xda2e4000	! t0_kref+0xd64:   	stb	%o5, [%i1]
	.word	0xe81e0000	! t0_kref+0xd68:   	ldd	[%i0], %l4
	.word	0xa5b40e80	! t0_kref+0xd6c:   	fsrc1	%f16, %f18
	.word	0x97b30240	! t0_kref+0xd70:   	array16	%o4, %g0, %o3
	.word	0x3f480005	! t0_kref+0xd74:   	fbo,a,pt	%fcc0, _kref+0xd88
	.word	0xa93b000d	! t0_kref+0xd78:   	sra	%o4, %o5, %l4
	.word	0x37480001	! t0_kref+0xd7c:   	fbge,a,pt	%fcc0, _kref+0xd80
	.word	0xab2b6018	! t0_kref+0xd80:   	sll	%o5, 0x18, %l5
	.word	0x81db801e	! t0_kref+0xd84:   	flush	%sp + %fp
	.word	0xd53e3fe8	! t0_kref+0xd88:   	std	%f10, [%i0 - 0x18]
	.word	0x9db28a12	! t0_kref+0xd8c:   	fpadd16	%f10, %f18, %f14
	.word	0x9bb38db3	! t0_kref+0xd90:   	fxors	%f14, %f19, %f13
	.word	0xa7400000	! t0_kref+0xd94:   	mov	%y, %l3
	.word	0x9093000d	! t0_kref+0xd98:   	orcc	%o4, %o5, %o0
	.word	0x97a30932	! t0_kref+0xd9c:   	fmuls	%f12, %f18, %f11
	.word	0x95a00030	! t0_kref+0xda0:   	fmovs	%f16, %f10
	.word	0x33480007	! t0_kref+0xda4:   	fbe,a,pt	%fcc0, _kref+0xdc0
	.word	0xa7b38d2e	! t0_kref+0xda8:   	fandnot1s	%f14, %f14, %f19
	.word	0x9fb00cec	! t0_kref+0xdac:   	fnot2s	%f12, %f15
	.word	0x37800006	! t0_kref+0xdb0:   	fbge,a	_kref+0xdc8
	.word	0xa3b340cd	! t0_kref+0xdb4:   	edge16l	%o5, %o5, %l1
	.word	0xdfa61000	! t0_kref+0xdb8:   	sta	%f15, [%i0]0x80
	.word	0x95400000	! t0_kref+0xdbc:   	mov	%y, %o2
	.word	0x2a480005	! t0_kref+0xdc0:   	bcs,a,pt	%icc, _kref+0xdd4
	.word	0xd8366004	! t0_kref+0xdc4:   	sth	%o4, [%i1 + 4]
	.word	0x97a0188b	! t0_kref+0xdc8:   	fitos	%f11, %f11
	.word	0x95b28992	! t0_kref+0xdcc:   	bshuffle	%f10, %f18, %f10
	.word	0x2d800005	! t0_kref+0xdd0:   	fbg,a	_kref+0xde4
	.word	0xaeab7185	! t0_kref+0xdd4:   	andncc	%o5, -0xe7b, %l7
	.word	0xd2ce9018	! t0_kref+0xdd8:   	ldsba	[%i2 + %i0]0x80, %o1
	.word	0xe8df5018	! t0_kref+0xddc:   	ldxa	[%i5 + %i0]0x80, %l4
	.word	0xd900a010	! t0_kref+0xde0:   	ld	[%g2 + 0x10], %f12
	.word	0x9da288b2	! t0_kref+0xde4:   	fsubs	%f10, %f18, %f14
	.word	0xeb6e001c	! t0_kref+0xde8:   	prefetch	%i0 + %i4, 21
	.word	0xa4c3400d	! t0_kref+0xdec:   	addccc	%o5, %o5, %l2
	.word	0x940b6697	! t0_kref+0xdf0:   	and	%o5, 0x697, %o2
	.word	0x81ac0a4a	! t0_kref+0xdf4:   	fcmpd	%fcc0, %f16, %f10
	.word	0x91400000	! t0_kref+0xdf8:   	mov	%y, %o0
	.word	0x81830000	! t0_kref+0xdfc:   	wr	%o4, %g0, %y
	.word	0xa3b2cd2a	! t0_kref+0xe00:   	fandnot1s	%f11, %f10, %f17
	.word	0xa2a362e5	! t0_kref+0xe04:   	subcc	%o5, 0x2e5, %l1
	.word	0xe51e6008	! t0_kref+0xe08:   	ldd	[%i1 + 8], %f18
	.word	0x8d83400c	! t0_kref+0xe0c:   	wr	%o5, %o4, %fprs
	.word	0xe51fbda0	! t0_kref+0xe10:   	ldd	[%fp - 0x260], %f18
	.word	0x927b400c	! t0_kref+0xe14:   	sdiv	%o5, %o4, %o1
	.word	0xa66321f9	! t0_kref+0xe18:   	subc	%o4, 0x1f9, %l3
	.word	0x9fc10000	! t0_kref+0xe1c:   	call	%g4
	.word	0xe250a024	! t0_kref+0xe20:   	ldsh	[%g2 + 0x24], %l1
	.word	0xe448a029	! t0_kref+0xe24:   	ldsb	[%g2 + 0x29], %l2
	.word	0xd216c018	! t0_kref+0xe28:   	lduh	[%i3 + %i0], %o1
	.word	0x3b480002	! t0_kref+0xe2c:   	fble,a,pt	%fcc0, _kref+0xe34
	.word	0x93b4044c	! t0_kref+0xe30:   	fcmpne16	%f16, %f12, %o1
	.word	0x910367df	! t0_kref+0xe34:   	taddcc	%o5, 0x7df, %o0
	.word	0xa1a94031	! t0_kref+0xe38:   	fmovsug	%fcc0, %f17, %f16
	.word	0xa3b3858a	! t0_kref+0xe3c:   	fcmpgt32	%f14, %f10, %l1
	.word	0xd000a020	! t0_kref+0xe40:   	ld	[%g2 + 0x20], %o0
	.word	0x2f800001	! t0_kref+0xe44:   	fbu,a	_kref+0xe48
	.word	0x95b40c8e	! t0_kref+0xe48:   	fandnot2	%f16, %f14, %f10
	.word	0xd500a01c	! t0_kref+0xe4c:   	ld	[%g2 + 0x1c], %f10
	.word	0xa1a00531	! t0_kref+0xe50:   	fsqrts	%f17, %f16
	.word	0xd00e8019	! t0_kref+0xe54:   	ldub	[%i2 + %i1], %o0
	.word	0x2a800003	! t0_kref+0xe58:   	bcs,a	_kref+0xe64
	.word	0x97b34aaa	! t0_kref+0xe5c:   	fpsub16s	%f13, %f10, %f11
	.word	0xa3a2c92b	! t0_kref+0xe60:   	fmuls	%f11, %f11, %f17
	.word	0xec6e4000	! t0_kref+0xe64:   	ldstub	[%i1], %l6
	.word	0x9da01931	! t0_kref+0xe68:   	fstod	%f17, %f14
	.word	0x27480003	! t0_kref+0xe6c:   	fbul,a,pt	%fcc0, _kref+0xe78
	.word	0xe4780019	! t0_kref+0xe70:   	swap	[%g0 + %i1], %l2
	.word	0xac73000d	! t0_kref+0xe74:   	udiv	%o4, %o5, %l6
	.word	0xdda65000	! t0_kref+0xe78:   	sta	%f14, [%i1]0x80
	.word	0xe81f4018	! t0_kref+0xe7c:   	ldd	[%i5 + %i0], %l4
	.word	0xa3a01891	! t0_kref+0xe80:   	fitos	%f17, %f17
	.word	0xa63321f3	! t0_kref+0xe84:   	orn	%o4, 0x1f3, %l3
	.word	0xa3a4c82a	! t0_kref+0xe88:   	fadds	%f19, %f10, %f17
	.word	0x99a0054e	! t0_kref+0xe8c:   	fsqrtd	%f14, %f12
	.word	0x28480007	! t0_kref+0xe90:   	bleu,a,pt	%icc, _kref+0xeac
	.word	0xa7b28a6f	! t0_kref+0xe94:   	fpadd32s	%f10, %f15, %f19
	.word	0x36800005	! t0_kref+0xe98:   	bge,a	_kref+0xeac
	.word	0x95b3cab1	! t0_kref+0xe9c:   	fpsub16s	%f15, %f17, %f10
	.word	0xee0e8019	! t0_kref+0xea0:   	ldub	[%i2 + %i1], %l7
	.word	0x81830000	! t0_kref+0xea4:   	wr	%o4, %g0, %y
	.word	0xa5b48d40	! t0_kref+0xea8:   	fnot1	%f18, %f18
	.word	0x9293400c	! t0_kref+0xeac:   	orcc	%o5, %o4, %o1
	.word	0xef68a00f	! t0_kref+0xeb0:   	prefetch	%g2 + 0xf, 23
	.word	0x97b3032c	! t0_kref+0xeb4:   	bmask	%o4, %o4, %o3
	.word	0xae2b400c	! t0_kref+0xeb8:   	andn	%o5, %o4, %l7
	.word	0xa73b000c	! t0_kref+0xebc:   	sra	%o4, %o4, %l3
	.word	0x81ab0ab2	! t0_kref+0xec0:   	fcmpes	%fcc0, %f12, %f18
	.word	0xd608a02d	! t0_kref+0xec4:   	ldub	[%g2 + 0x2d], %o3
	.word	0x99b44d60	! t0_kref+0xec8:   	fnot1s	%f17, %f12
	.word	0x3c800003	! t0_kref+0xecc:   	bpos,a	_kref+0xed8
	.word	0xa1a01112	! t0_kref+0xed0:   	fxtod	%f18, %f16
	.word	0x3e480002	! t0_kref+0xed4:   	bvc,a,pt	%icc, _kref+0xedc
	.word	0xe8480019	! t0_kref+0xed8:   	ldsb	[%g0 + %i1], %l4
	.word	0xdb00a00c	! t0_kref+0xedc:   	ld	[%g2 + 0xc], %f13
	.word	0xe11e2008	! t0_kref+0xee0:   	ldd	[%i0 + 8], %f16
	.word	0xabb40452	! t0_kref+0xee4:   	fcmpne16	%f16, %f18, %l5
	.word	0x9da00552	! t0_kref+0xee8:   	fsqrtd	%f18, %f14
	.word	0x9213000d	! t0_kref+0xeec:   	or	%o4, %o5, %o1
	.word	0xe46e3ff6	! t0_kref+0xef0:   	ldstub	[%i0 - 0xa], %l2
	.word	0xe20e2008	! t0_kref+0xef4:   	ldub	[%i0 + 8], %l1
	.word	0xdb00a018	! t0_kref+0xef8:   	ld	[%g2 + 0x18], %f13
	.word	0xc12e2008	! t0_kref+0xefc:   	st	%fsr, [%i0 + 8]
	.word	0x9da0108e	! t0_kref+0xf00:   	fxtos	%f14, %f14
	.word	0x92236bfe	! t0_kref+0xf04:   	sub	%o5, 0xbfe, %o1
	.word	0xe0be501d	! t0_kref+0xf08:   	stda	%l0, [%i1 + %i5]0x80
	.word	0xd47e6004	! t0_kref+0xf0c:   	swap	[%i1 + 4], %o2
	.word	0xa823000c	! t0_kref+0xf10:   	sub	%o4, %o4, %l4
	.word	0xa5a4094a	! t0_kref+0xf14:   	fmuld	%f16, %f10, %f18
	.word	0xd900a02c	! t0_kref+0xf18:   	ld	[%g2 + 0x2c], %f12
	.word	0xa493400c	! t0_kref+0xf1c:   	orcc	%o5, %o4, %l2
	.word	0xa213400d	! t0_kref+0xf20:   	or	%o5, %o5, %l1
	.word	0xe76e7fe8	! t0_kref+0xf24:   	prefetch	%i1 - 0x18, 19
	.word	0x9633000d	! t0_kref+0xf28:   	orn	%o4, %o5, %o3
	.word	0xf16e401c	! t0_kref+0xf2c:   	prefetch	%i1 + %i4, 24
	.word	0xda762008	! t0_kref+0xf30:   	stx	%o5, [%i0 + 8]
	.word	0xadb3410d	! t0_kref+0xf34:   	edge32	%o5, %o5, %l6
	.word	0x8143c000	! t0_kref+0xf38:   	stbar
	.word	0xa5b40ad2	! t0_kref+0xf3c:   	fpsub32	%f16, %f18, %f18
	.word	0xa6fb000c	! t0_kref+0xf40:   	sdivcc	%o4, %o4, %l3
	.word	0x95a00531	! t0_kref+0xf44:   	fsqrts	%f17, %f10
	.word	0xa5a3482d	! t0_kref+0xf48:   	fadds	%f13, %f13, %f18
	.word	0x99b48ad2	! t0_kref+0xf4c:   	fpsub32	%f18, %f18, %f12
	.word	0xe806200c	! t0_kref+0xf50:   	ld	[%i0 + 0xc], %l4
	.word	0x35800008	! t0_kref+0xf54:   	fbue,a	_kref+0xf74
	.word	0xe81e7fe8	! t0_kref+0xf58:   	ldd	[%i1 - 0x18], %l4
	.word	0xdd380019	! t0_kref+0xf5c:   	std	%f14, [%g0 + %i1]
	.word	0x25480004	! t0_kref+0xf60:   	fblg,a,pt	%fcc0, _kref+0xf70
	.word	0x99b38a0a	! t0_kref+0xf64:   	fpadd16	%f14, %f10, %f12
	.word	0xe64e2002	! t0_kref+0xf68:   	ldsb	[%i0 + 2], %l3
	.word	0x926364a1	! t0_kref+0xf6c:   	subc	%o5, 0x4a1, %o1
	.word	0xa4fb400d	! t0_kref+0xf70:   	sdivcc	%o5, %o5, %l2
	.word	0x99a44930	! t0_kref+0xf74:   	fmuls	%f17, %f16, %f12
	.word	0xacc3400c	! t0_kref+0xf78:   	addccc	%o5, %o4, %l6
	.word	0x8143c000	! t0_kref+0xf7c:   	stbar
	.word	0x9de3bfa0	! t0_kref+0xf80:   	save	%sp, -0x60, %sp
	.word	0xa5e8001a	! t0_kref+0xf84:   	restore	%g0, %i2, %l2
	.word	0xac733734	! t0_kref+0xf88:   	udiv	%o4, -0x8cc, %l6
	.word	0x28480001	! t0_kref+0xf8c:   	bleu,a,pt	%icc, _kref+0xf90
	.word	0xa1b30d8e	! t0_kref+0xf90:   	fxor	%f12, %f14, %f16
	.word	0x93400000	! t0_kref+0xf94:   	mov	%y, %o1
	.word	0xa6632ba0	! t0_kref+0xf98:   	subc	%o4, 0xba0, %l3
	.word	0x9263400d	! t0_kref+0xf9c:   	subc	%o5, %o5, %o1
	.word	0xaa0b725e	! t0_kref+0xfa0:   	and	%o5, -0xda2, %l5
	.word	0xda7e401c	! t0_kref+0xfa4:   	swap	[%i1 + %i4], %o5
	.word	0xa1a0054c	! t0_kref+0xfa8:   	fsqrtd	%f12, %f16
	.word	0xa32b601d	! t0_kref+0xfac:   	sll	%o5, 0x1d, %l1
	.word	0x81ddf5a2	! t0_kref+0xfb0:   	flush	%l7 - 0xa5e
	.word	0xa5400000	! t0_kref+0xfb4:   	mov	%y, %l2
	.word	0xa1a01a4c	! t0_kref+0xfb8:   	fdtoi	%f12, %f16
	.word	0xda266008	! t0_kref+0xfbc:   	st	%o5, [%i1 + 8]
	call	SYM(t0_subr3)
	.word	0xa69b400c	! t0_kref+0xfc4:   	xorcc	%o5, %o4, %l3
	.word	0xdb263fe0	! t0_kref+0xfc8:   	st	%f13, [%i0 - 0x20]
	.word	0x9db306ce	! t0_kref+0xfcc:   	fmul8sux16	%f12, %f14, %f14
	.word	0x93400000	! t0_kref+0xfd0:   	mov	%y, %o1
	.word	0xa6932947	! t0_kref+0xfd4:   	orcc	%o4, 0x947, %l3
	.word	0x9da30850	! t0_kref+0xfd8:   	faddd	%f12, %f16, %f14
	.word	0xd4163ffc	! t0_kref+0xfdc:   	lduh	[%i0 - 4], %o2
	.word	0x9db2898c	! t0_kref+0xfe0:   	bshuffle	%f10, %f12, %f14
	.word	0xc06e601c	! t0_kref+0xfe4:   	ldstub	[%i1 + 0x1c], %g0
	.word	0x9da4492b	! t0_kref+0xfe8:   	fmuls	%f17, %f11, %f14
	.word	0x32800005	! t0_kref+0xfec:   	bne,a	_kref+0x1000
	.word	0x9da0054e	! t0_kref+0xff0:   	fsqrtd	%f14, %f14
	.word	0xa9b34240	! t0_kref+0xff4:   	array16	%o5, %g0, %l4
	.word	0x81accab3	! t0_kref+0xff8:   	fcmpes	%fcc0, %f19, %f19
	.word	0xa453400c	! t0_kref+0xffc:   	umul	%o5, %o4, %l2
	.word	0x95b4472b	! t0_kref+0x1000:   	fmuld8ulx16	%f17, %f11, %f10
	.word	0xd006200c	! t0_kref+0x1004:   	ld	[%i0 + 0xc], %o0
	.word	0x99a0052c	! t0_kref+0x1008:   	fsqrts	%f12, %f12
	.word	0xe03e001d	! t0_kref+0x100c:   	std	%l0, [%i0 + %i5]
	.word	0x9da0054e	! t0_kref+0x1010:   	fsqrtd	%f14, %f14
	.word	0x81580000	! t0_kref+0x1014:   	flushw
	.word	0x27800002	! t0_kref+0x1018:   	fbul,a	_kref+0x1020
	.word	0x94b374e2	! t0_kref+0x101c:   	orncc	%o5, -0xb1e, %o2
	.word	0xda264000	! t0_kref+0x1020:   	st	%o5, [%i1]
	.word	0xa5b340ac	! t0_kref+0x1024:   	edge16n	%o5, %o4, %l2
	.word	0xed68a04f	! t0_kref+0x1028:   	prefetch	%g2 + 0x4f, 22
	.word	0x9fa3092a	! t0_kref+0x102c:   	fmuls	%f12, %f10, %f15
	.word	0xa7a018ca	! t0_kref+0x1030:   	fdtos	%f10, %f19
	.word	0x81de4010	! t0_kref+0x1034:   	flush	%i1 + %l0
	.word	0x25480004	! t0_kref+0x1038:   	fblg,a,pt	%fcc0, _kref+0x1048
	.word	0x9673400d	! t0_kref+0x103c:   	udiv	%o5, %o5, %o3
	.word	0x3b480003	! t0_kref+0x1040:   	fble,a,pt	%fcc0, _kref+0x104c
	.word	0xea4e7fe8	! t0_kref+0x1044:   	ldsb	[%i1 - 0x18], %l5
	.word	0xd6067fe8	! t0_kref+0x1048:   	ld	[%i1 - 0x18], %o3
	.word	0x99a308cc	! t0_kref+0x104c:   	fsubd	%f12, %f12, %f12
	.word	0x24800008	! t0_kref+0x1050:   	ble,a	_kref+0x1070
	.word	0xd91fbed8	! t0_kref+0x1054:   	ldd	[%fp - 0x128], %f12
	.word	0x27480001	! t0_kref+0x1058:   	fbul,a,pt	%fcc0, _kref+0x105c
	.word	0x81db000b	! t0_kref+0x105c:   	flush	%o4 + %o3
	.word	0x37480004	! t0_kref+0x1060:   	fbge,a,pt	%fcc0, _kref+0x1070
	.word	0x95a488ab	! t0_kref+0x1064:   	fsubs	%f18, %f11, %f10
	.word	0xec1e001d	! t0_kref+0x1068:   	ldd	[%i0 + %i5], %l6
	.word	0x92133867	! t0_kref+0x106c:   	or	%o4, -0x799, %o1
	.word	0xa5b28a0a	! t0_kref+0x1070:   	fpadd16	%f10, %f10, %f18
	.word	0xec6e3ff6	! t0_kref+0x1074:   	ldstub	[%i0 - 0xa], %l6
	.word	0xab3b6011	! t0_kref+0x1078:   	sra	%o5, 0x11, %l5
	.word	0x34480007	! t0_kref+0x107c:   	bg,a,pt	%icc, _kref+0x1098
	.word	0xe6163ff8	! t0_kref+0x1080:   	lduh	[%i0 - 8], %l3
	.word	0x9fb38e2d	! t0_kref+0x1084:   	fands	%f14, %f13, %f15
	.word	0x94a3000d	! t0_kref+0x1088:   	subcc	%o4, %o5, %o2
	.word	0x81accaae	! t0_kref+0x108c:   	fcmpes	%fcc0, %f19, %f14
	.word	0xe120a018	! t0_kref+0x1090:   	st	%f16, [%g2 + 0x18]
	.word	0x9ba00531	! t0_kref+0x1094:   	fsqrts	%f17, %f13
	.word	0xad2b6005	! t0_kref+0x1098:   	sll	%o5, 0x5, %l6
	.word	0x99b007aa	! t0_kref+0x109c:   	fpackfix	%f10, %f12
	.word	0xaa93400d	! t0_kref+0x10a0:   	orcc	%o5, %o5, %l5
	.word	0xe03e6010	! t0_kref+0x10a4:   	std	%l0, [%i1 + 0x10]
	.word	0xee40a024	! t0_kref+0x10a8:   	ldsw	[%g2 + 0x24], %l7
	.word	0x83414000	! t0_kref+0x10ac:   	mov	%pc, %g1
	.word	0x99b38d40	! t0_kref+0x10b0:   	fnot1	%f14, %f12
	.word	0xee06401c	! t0_kref+0x10b4:   	ld	[%i1 + %i4], %l7
	.word	0x92b3000c	! t0_kref+0x10b8:   	orncc	%o4, %o4, %o1
	.word	0xd830a03c	! t0_kref+0x10bc:   	sth	%o4, [%g2 + 0x3c]
	.word	0x21800005	! t0_kref+0x10c0:   	fbn,a	_kref+0x10d4
	.word	0xe03f4019	! t0_kref+0x10c4:   	std	%l0, [%i5 + %i1]
	.word	0xa663000c	! t0_kref+0x10c8:   	subc	%o4, %o4, %l3
	.word	0x24800002	! t0_kref+0x10cc:   	ble,a	_kref+0x10d4
	.word	0xa3b3008d	! t0_kref+0x10d0:   	edge16	%o4, %o5, %l1
	.word	0x969b7e30	! t0_kref+0x10d4:   	xorcc	%o5, -0x1d0, %o3
	.word	0xa1a00552	! t0_kref+0x10d8:   	fsqrtd	%f18, %f16
	.word	0x94033eab	! t0_kref+0x10dc:   	add	%o4, -0x155, %o2
	.word	0xac93400c	! t0_kref+0x10e0:   	orcc	%o5, %o4, %l6
	.word	0x8143c000	! t0_kref+0x10e4:   	stbar
	.word	0xdaae9019	! t0_kref+0x10e8:   	stba	%o5, [%i2 + %i1]0x80
	.word	0xc96e400d	! t0_kref+0x10ec:   	prefetch	%i1 + %o5, 4
	.word	0xe2ce9019	! t0_kref+0x10f0:   	ldsba	[%i2 + %i1]0x80, %l1
	.word	0x97a00532	! t0_kref+0x10f4:   	fsqrts	%f18, %f11
	.word	0xe24e4000	! t0_kref+0x10f8:   	ldsb	[%i1], %l1
	.word	0x9da0192f	! t0_kref+0x10fc:   	fstod	%f15, %f14
	.word	0xe53e2008	! t0_kref+0x1100:   	std	%f18, [%i0 + 8]
	.word	0x99a30d2d	! t0_kref+0x1104:   	fsmuld	%f12, %f13, %f12
	.word	0xacfb74ae	! t0_kref+0x1108:   	sdivcc	%o5, -0xb52, %l6
	.word	0x920b000d	! t0_kref+0x110c:   	and	%o4, %o5, %o1
	.word	0xa21b400c	! t0_kref+0x1110:   	xor	%o5, %o4, %l1
	.word	0x9da2c92f	! t0_kref+0x1114:   	fmuls	%f11, %f15, %f14
	.word	0xdaf75019	! t0_kref+0x1118:   	stxa	%o5, [%i5 + %i1]0x80
	.word	0x99b38dae	! t0_kref+0x111c:   	fxors	%f14, %f14, %f12
	.word	0xe410a01a	! t0_kref+0x1120:   	lduh	[%g2 + 0x1a], %l2
	.word	0xae2321cf	! t0_kref+0x1124:   	sub	%o4, 0x1cf, %l7
	.word	0xda263fe0	! t0_kref+0x1128:   	st	%o5, [%i0 - 0x20]
	.word	0x81abcab3	! t0_kref+0x112c:   	fcmpes	%fcc0, %f15, %f19
	.word	0x8143c000	! t0_kref+0x1130:   	stbar
	.word	0xa1a2c92b	! t0_kref+0x1134:   	fmuls	%f11, %f11, %f16
	.word	0x878020e0	! t0_kref+0x1138:   	mov	0xe0, %asi
	.word	0xd006401c	! t0_kref+0x113c:   	ld	[%i1 + %i4], %o0
	.word	0x30800007	! t0_kref+0x1140:   	ba,a	_kref+0x115c
	.word	0xab3b000c	! t0_kref+0x1144:   	sra	%o4, %o4, %l5
	.word	0x91b3002d	! t0_kref+0x1148:   	edge8n	%o4, %o5, %o0
	.word	0x90d3720c	! t0_kref+0x114c:   	umulcc	%o5, -0xdf4, %o0
	.word	0xd51e2000	! t0_kref+0x1150:   	ldd	[%i0], %f10
	.word	0x81580000	! t0_kref+0x1154:   	flushw
	.word	0xa703000d	! t0_kref+0x1158:   	taddcc	%o4, %o5, %l3
	.word	0x9263685e	! t0_kref+0x115c:   	subc	%o5, 0x85e, %o1
	.word	0xd53f4018	! t0_kref+0x1160:   	std	%f10, [%i5 + %i0]
	.word	0x2b800006	! t0_kref+0x1164:   	fbug,a	_kref+0x117c
	.word	0xe968a04e	! t0_kref+0x1168:   	prefetch	%g2 + 0x4e, 20
	.word	0xd048a004	! t0_kref+0x116c:   	ldsb	[%g2 + 4], %o0
	.word	0x9fa3492c	! t0_kref+0x1170:   	fmuls	%f13, %f12, %f15
	.word	0x99a00552	! t0_kref+0x1174:   	fsqrtd	%f18, %f12
	.word	0xa2632f64	! t0_kref+0x1178:   	subc	%o4, 0xf64, %l1
	.word	0x21800001	! t0_kref+0x117c:   	fbn,a	_kref+0x1180
	.word	0xa7b00fe0	! t0_kref+0x1180:   	fones	%f19
	.word	0xa6b339a6	! t0_kref+0x1184:   	orncc	%o4, -0x65a, %l3
	.word	0xd450a016	! t0_kref+0x1188:   	ldsh	[%g2 + 0x16], %o2
	.word	0x9db4090e	! t0_kref+0x118c:   	faligndata	%f16, %f14, %f14
	.word	0x9db3caf0	! t0_kref+0x1190:   	fpsub32s	%f15, %f16, %f14
	.word	0x3e800001	! t0_kref+0x1194:   	bvc,a	_kref+0x1198
	.word	0x95b3466a	! t0_kref+0x1198:   	fmul8x16au	%f13, %f10, %f10
	.word	0xd9bf1a58	! t0_kref+0x119c:   	stda	%f12, [%i4 + %i0]0xd2
	.word	0xec16001b	! t0_kref+0x11a0:   	lduh	[%i0 + %i3], %l6
	.word	0xa1b4896e	! t0_kref+0x11a4:   	fpmerge	%f18, %f14, %f16
	.word	0x9fc00004	! t0_kref+0x11a8:   	call	%g0 + %g4
	.word	0xe64e7fe8	! t0_kref+0x11ac:   	ldsb	[%i1 - 0x18], %l3
	.word	0xda26601c	! t0_kref+0x11b0:   	st	%o5, [%i1 + 0x1c]
	.word	0xa1b3c72a	! t0_kref+0x11b4:   	fmuld8ulx16	%f15, %f10, %f16
	.word	0xe3b8a080	! t0_kref+0x11b8:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x99a0192d	! t0_kref+0x11bc:   	fstod	%f13, %f12
	.word	0x95b3016d	! t0_kref+0x11c0:   	edge32ln	%o4, %o5, %o2
	.word	0xea48a00d	! t0_kref+0x11c4:   	ldsb	[%g2 + 0xd], %l5
	.word	0x31800005	! t0_kref+0x11c8:   	fba,a	_kref+0x11dc
	.word	0xe1be9a18	! t0_kref+0x11cc:   	stda	%f16, [%i2 + %i0]0xd0
	.word	0xe03e001d	! t0_kref+0x11d0:   	std	%l0, [%i0 + %i5]
	.word	0xaad3400d	! t0_kref+0x11d4:   	umulcc	%o5, %o5, %l5
	.word	0xa4b3000c	! t0_kref+0x11d8:   	orncc	%o4, %o4, %l2
	.word	0xd408a039	! t0_kref+0x11dc:   	ldub	[%g2 + 0x39], %o2
	.word	0xa1a0108e	! t0_kref+0x11e0:   	fxtos	%f14, %f16
	.word	0xa1b009af	! t0_kref+0x11e4:   	fexpand	%f15, %f16
	.word	0x86102002	! t0_kref+0x11e8:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x11ec:   	bne,a	_kref+0x11ec
	.word	0x86a0e001	! t0_kref+0x11f0:   	subcc	%g3, 1, %g3
	.word	0xe5ee101d	! t0_kref+0x11f4:   	prefetcha	%i0 + %i5, 18
	.word	0xa1a00552	! t0_kref+0x11f8:   	fsqrtd	%f18, %f16
	.word	0xb6103ffc	! t0_kref+0x11fc:   	mov	0xfffffffc, %i3
	.word	0xa1a0052b	! t0_kref+0x1200:   	fsqrts	%f11, %f16
	.word	0xec901018	! t0_kref+0x1204:   	lduha	[%g0 + %i0]0x80, %l6
	.word	0xd828a033	! t0_kref+0x1208:   	stb	%o4, [%g2 + 0x33]
	.word	0x97a000af	! t0_kref+0x120c:   	fnegs	%f15, %f11
	.word	0x9da00032	! t0_kref+0x1210:   	fmovs	%f18, %f14
	.word	0xdf20a028	! t0_kref+0x1214:   	st	%f15, [%g2 + 0x28]
	.word	0xa1a00550	! t0_kref+0x1218:   	fsqrtd	%f16, %f16
	.word	0x32800003	! t0_kref+0x121c:   	bne,a	_kref+0x1228
	.word	0x9da30952	! t0_kref+0x1220:   	fmuld	%f12, %f18, %f14
	.word	0xd5180019	! t0_kref+0x1224:   	ldd	[%g0 + %i1], %f10
	.word	0xd60e2006	! t0_kref+0x1228:   	ldub	[%i0 + 6], %o3
	.word	0x9da4084a	! t0_kref+0x122c:   	faddd	%f16, %f10, %f14
	.word	0xa81b400c	! t0_kref+0x1230:   	xor	%o5, %o4, %l4
	.word	0xa463400d	! t0_kref+0x1234:   	subc	%o5, %o5, %l2
	.word	0x95332003	! t0_kref+0x1238:   	srl	%o4, 0x3, %o2
	.word	0xe3b8a080	! t0_kref+0x123c:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xc0ff1018	! t0_kref+0x1240:   	swapa	[%i4 + %i0]0x80, %g0
	.word	0xa8732e27	! t0_kref+0x1244:   	udiv	%o4, 0xe27, %l4
	.word	0xee070018	! t0_kref+0x1248:   	ld	[%i4 + %i0], %l7
	.word	0xd400a034	! t0_kref+0x124c:   	ld	[%g2 + 0x34], %o2
	.word	0x972b000d	! t0_kref+0x1250:   	sll	%o4, %o5, %o3
	.word	0x94c3000d	! t0_kref+0x1254:   	addccc	%o4, %o5, %o2
	.word	0xaeb33aaf	! t0_kref+0x1258:   	orncc	%o4, -0x551, %l7
	.word	0xe0981019	! t0_kref+0x125c:   	ldda	[%g0 + %i1]0x80, %l0
	.word	0x95a0054c	! t0_kref+0x1260:   	fsqrtd	%f12, %f10
	.word	0x9de3bfa0	! t0_kref+0x1264:   	save	%sp, -0x60, %sp
	.word	0x97ef3a81	! t0_kref+0x1268:   	restore	%i4, -0x57f, %o3
	.word	0xe65e2018	! t0_kref+0x126c:   	ldx	[%i0 + 0x18], %l3
	.word	0xe67e0000	! t0_kref+0x1270:   	swap	[%i0], %l3
	.word	0xa3a000b1	! t0_kref+0x1274:   	fnegs	%f17, %f17
	.word	0xac737195	! t0_kref+0x1278:   	udiv	%o5, -0xe6b, %l6
	.word	0x2c800003	! t0_kref+0x127c:   	bneg,a	_kref+0x1288
	.word	0xe11fbca8	! t0_kref+0x1280:   	ldd	[%fp - 0x358], %f16
	.word	0x9744c000	! t0_kref+0x1284:   	mov	%gsr, %o3
	.word	0x8143c000	! t0_kref+0x1288:   	stbar
	.word	0x96c32ad3	! t0_kref+0x128c:   	addccc	%o4, 0xad3, %o3
	.word	0xe1be180d	! t0_kref+0x1290:   	stda	%f16, [%i0 + %o5]0xc0
	.word	0x95a00552	! t0_kref+0x1294:   	fsqrtd	%f18, %f10
	.word	0xe53e6000	! t0_kref+0x1298:   	std	%f18, [%i1]
	.word	0xa5b30d40	! t0_kref+0x129c:   	fnot1	%f12, %f18
	.word	0x34480005	! t0_kref+0x12a0:   	bg,a,pt	%icc, _kref+0x12b4
	.word	0x9da0002c	! t0_kref+0x12a4:   	fmovs	%f12, %f14
	.word	0xd828a03a	! t0_kref+0x12a8:   	stb	%o4, [%g2 + 0x3a]
	.word	0x97b30240	! t0_kref+0x12ac:   	array16	%o4, %g0, %o3
	.word	0x95b44673	! t0_kref+0x12b0:   	fmul8x16au	%f17, %f19, %f10
	.word	0x23480008	! t0_kref+0x12b4:   	fbne,a,pt	%fcc0, _kref+0x12d4
	.word	0xa1b28d92	! t0_kref+0x12b8:   	fxor	%f10, %f18, %f16
	.word	0x3c800008	! t0_kref+0x12bc:   	bpos,a	_kref+0x12dc
	.word	0xaec33ea8	! t0_kref+0x12c0:   	addccc	%o4, -0x158, %l7
	.word	0xe07e2010	! t0_kref+0x12c4:   	swap	[%i0 + 0x10], %l0
	.word	0xac13400c	! t0_kref+0x12c8:   	or	%o5, %o4, %l6
	.word	0xe51fbf60	! t0_kref+0x12cc:   	ldd	[%fp - 0xa0], %f18
	.word	0xac63000c	! t0_kref+0x12d0:   	subc	%o4, %o4, %l6
	.word	0xd9380019	! t0_kref+0x12d4:   	std	%f12, [%g0 + %i1]
	.word	0xaa0b400d	! t0_kref+0x12d8:   	and	%o5, %o5, %l5
	.word	0xda264000	! t0_kref+0x12dc:   	st	%o5, [%i1]
	.word	0xec1e7fe0	! t0_kref+0x12e0:   	ldd	[%i1 - 0x20], %l6
	.word	0x9533600f	! t0_kref+0x12e4:   	srl	%o5, 0xf, %o2
	.word	0x86102003	! t0_kref+0x12e8:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x12ec:   	bne,a	_kref+0x12ec
	.word	0x86a0e001	! t0_kref+0x12f0:   	subcc	%g3, 1, %g3
	.word	0x81830000	! t0_kref+0x12f4:   	wr	%o4, %g0, %y
	.word	0xea10a03e	! t0_kref+0x12f8:   	lduh	[%g2 + 0x3e], %l5
	.word	0x96fb2017	! t0_kref+0x12fc:   	sdivcc	%o4, 0x17, %o3
	.word	0x99b48e31	! t0_kref+0x1300:   	fands	%f18, %f17, %f12
	.word	0x95b007b0	! t0_kref+0x1304:   	fpackfix	%f16, %f10
	.word	0xa1a0054a	! t0_kref+0x1308:   	fsqrtd	%f10, %f16
	.word	0x9693400d	! t0_kref+0x130c:   	orcc	%o5, %o5, %o3
	.word	0xa5a00552	! t0_kref+0x1310:   	fsqrtd	%f18, %f18
	.word	0xd0167ff0	! t0_kref+0x1314:   	lduh	[%i1 - 0x10], %o0
	.word	0xc76e400d	! t0_kref+0x1318:   	prefetch	%i1 + %o5, 3
	.word	0xe4060000	! t0_kref+0x131c:   	ld	[%i0], %l2
	.word	0xad2b400c	! t0_kref+0x1320:   	sll	%o5, %o4, %l6
	.word	0x96fb000d	! t0_kref+0x1324:   	sdivcc	%o4, %o5, %o3
	.word	0x32800007	! t0_kref+0x1328:   	bne,a	_kref+0x1344
	.word	0xe168a083	! t0_kref+0x132c:   	prefetch	%g2 + 0x83, 16
	.word	0xf16e401b	! t0_kref+0x1330:   	prefetch	%i1 + %i3, 24
	.word	0xee8e101a	! t0_kref+0x1334:   	lduba	[%i0 + %i2]0x80, %l7
	.word	0x91332010	! t0_kref+0x1338:   	srl	%o4, 0x10, %o0
	.word	0xc807bfe8	! t0_kref+0x133c:   	ld	[%fp - 0x18], %g4
	.word	0xac63000d	! t0_kref+0x1340:   	subc	%o4, %o5, %l6
	.word	0x2e480007	! t0_kref+0x1344:   	bvs,a,pt	%icc, _kref+0x1360
	.word	0x95b2866c	! t0_kref+0x1348:   	fmul8x16au	%f10, %f12, %f10
	.word	0xe51f4019	! t0_kref+0x134c:   	ldd	[%i5 + %i1], %f18
	.word	0xa32b400c	! t0_kref+0x1350:   	sll	%o5, %o4, %l1
	.word	0xec10a038	! t0_kref+0x1354:   	lduh	[%g2 + 0x38], %l6
	.word	0x81d9401c	! t0_kref+0x1358:   	flush	%g5 + %i4
	.word	0xc76e7fe8	! t0_kref+0x135c:   	prefetch	%i1 - 0x18, 3
	.word	0xee8e101a	! t0_kref+0x1360:   	lduba	[%i0 + %i2]0x80, %l7
	.word	0xe2063ff0	! t0_kref+0x1364:   	ld	[%i0 - 0x10], %l1
	.word	0x9da3094a	! t0_kref+0x1368:   	fmuld	%f12, %f10, %f14
	.word	0x2c800004	! t0_kref+0x136c:   	bneg,a	_kref+0x137c
	.word	0xee5e6000	! t0_kref+0x1370:   	ldx	[%i1], %l7
	.word	0xa263400c	! t0_kref+0x1374:   	subc	%o5, %o4, %l1
	.word	0xa7400000	! t0_kref+0x1378:   	mov	%y, %l3
	.word	0xa7a4482e	! t0_kref+0x137c:   	fadds	%f17, %f14, %f19
	.word	0xad400000	! t0_kref+0x1380:   	mov	%y, %l6
	.word	0xd9180019	! t0_kref+0x1384:   	ldd	[%g0 + %i1], %f12
	.word	0xe2ce5000	! t0_kref+0x1388:   	ldsba	[%i1]0x80, %l1
	.word	0x95a2882e	! t0_kref+0x138c:   	fadds	%f10, %f14, %f10
	.word	0xd828a01f	! t0_kref+0x1390:   	stb	%o4, [%g2 + 0x1f]
	.word	0xa653000c	! t0_kref+0x1394:   	umul	%o4, %o4, %l3
	.word	0xda26001c	! t0_kref+0x1398:   	st	%o5, [%i0 + %i4]
	.word	0xd53e4000	! t0_kref+0x139c:   	std	%f10, [%i1]
	.word	0x86102002	! t0_kref+0x13a0:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x13a4:   	bne,a	_kref+0x13a4
	.word	0x86a0e001	! t0_kref+0x13a8:   	subcc	%g3, 1, %g3
	.word	0xc0383cf8	! t0_kref+0x13ac:   	std	%g0, [%g0 - 0x308]
	.word	0x97a3c92d	! t0_kref+0x13b0:   	fmuls	%f15, %f13, %f11
	.word	0x9db38aad	! t0_kref+0x13b4:   	fpsub16s	%f14, %f13, %f14
	.word	0xa20b000c	! t0_kref+0x13b8:   	and	%o4, %o4, %l1
	.word	0x29480006	! t0_kref+0x13bc:   	fbl,a,pt	%fcc0, _kref+0x13d4
	.word	0xaaa361e7	! t0_kref+0x13c0:   	subcc	%o5, 0x1e7, %l5
	.word	0xe3b8a080	! t0_kref+0x13c4:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x33800008	! t0_kref+0x13c8:   	fbe,a	_kref+0x13e8
	.word	0x9db40aca	! t0_kref+0x13cc:   	fpsub32	%f16, %f10, %f14
	.word	0xec1e3ff0	! t0_kref+0x13d0:   	ldd	[%i0 - 0x10], %l6
	.word	0xe250a006	! t0_kref+0x13d4:   	ldsh	[%g2 + 6], %l1
	.word	0xa833400c	! t0_kref+0x13d8:   	orn	%o5, %o4, %l4
	.word	0xa73b200d	! t0_kref+0x13dc:   	sra	%o4, 0xd, %l3
	.word	0x99b009ad	! t0_kref+0x13e0:   	fexpand	%f13, %f12
	.word	0x35800007	! t0_kref+0x13e4:   	fbue,a	_kref+0x1400
	.word	0xd278a00c	! t0_kref+0x13e8:   	swap	[%g2 + 0xc], %o1
	.word	0x81abca2a	! t0_kref+0x13ec:   	fcmps	%fcc0, %f15, %f10
	.word	0x95b00c00	! t0_kref+0x13f0:   	fzero	%f10
	.word	0xacc36b2f	! t0_kref+0x13f4:   	addccc	%o5, 0xb2f, %l6
	.word	0xee4e200f	! t0_kref+0x13f8:   	ldsb	[%i0 + 0xf], %l7
	.word	0x21480007	! t0_kref+0x13fc:   	fbn,a,pt	%fcc0, _kref+0x1418
	.word	0xa1a0002e	! t0_kref+0x1400:   	fmovs	%f14, %f16
	.word	0xd9f6100c	! t0_kref+0x1404:   	casxa	[%i0]0x80, %o4, %o4
	.word	0xa273400d	! t0_kref+0x1408:   	udiv	%o5, %o5, %l1
	.word	0x31480005	! t0_kref+0x140c:   	fba,a,pt	%fcc0, _kref+0x1420
	.word	0xd51fbd18	! t0_kref+0x1410:   	ldd	[%fp - 0x2e8], %f10
	.word	0xd24e2004	! t0_kref+0x1414:   	ldsb	[%i0 + 4], %o1
	.word	0x81accaaa	! t0_kref+0x1418:   	fcmpes	%fcc0, %f19, %f10
	.word	0x9fa01090	! t0_kref+0x141c:   	fxtos	%f16, %f15
	.word	0xadb2858c	! t0_kref+0x1420:   	fcmpgt32	%f10, %f12, %l6
	.word	0x99a0188f	! t0_kref+0x1424:   	fitos	%f15, %f12
	.word	0xd240a008	! t0_kref+0x1428:   	ldsw	[%g2 + 8], %o1
	.word	0xa3a01a4e	! t0_kref+0x142c:   	fdtoi	%f14, %f17
	.word	0x81830000	! t0_kref+0x1430:   	wr	%o4, %g0, %y
	.word	0xd406401c	! t0_kref+0x1434:   	ld	[%i1 + %i4], %o2
	.word	0x9fc10000	! t0_kref+0x1438:   	call	%g4
	.word	0xa3b4cd2a	! t0_kref+0x143c:   	fandnot1s	%f19, %f10, %f17
	.word	0x86102010	! t0_kref+0x1440:   	mov	0x10, %g3
	.word	0x86a0e001	! t0_kref+0x1444:   	subcc	%g3, 1, %g3
	.word	0x22800009	! t0_kref+0x1448:   	be,a	_kref+0x146c
	.word	0xe4d01019	! t0_kref+0x144c:   	ldsha	[%g0 + %i1]0x80, %l2
	.word	0xe06e4000	! t0_kref+0x1450:   	ldstub	[%i1], %l0
	.word	0x96b37cfe	! t0_kref+0x1454:   	orncc	%o5, -0x302, %o3
	.word	0xe20e3fee	! t0_kref+0x1458:   	ldub	[%i0 - 0x12], %l1
	.word	0x901b000d	! t0_kref+0x145c:   	xor	%o4, %o5, %o0
	.word	0xea78a014	! t0_kref+0x1460:   	swap	[%g2 + 0x14], %l5
	.word	0x9fc10000	! t0_kref+0x1464:   	call	%g4
	.word	0xa4b3400d	! t0_kref+0x1468:   	orncc	%o5, %o5, %l2
	.word	0xe3b8a080	! t0_kref+0x146c:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x81aacab3	! t0_kref+0x1470:   	fcmpes	%fcc0, %f11, %f19
	.word	0x93b300ec	! t0_kref+0x1474:   	edge16ln	%o4, %o4, %o1
	.word	0xe13e7fe8	! t0_kref+0x1478:   	std	%f16, [%i1 - 0x18]
	.word	0xe3b8a080	! t0_kref+0x147c:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x99a4094e	! t0_kref+0x1480:   	fmuld	%f16, %f14, %f12
	.word	0x99b48f92	! t0_kref+0x1484:   	for	%f18, %f18, %f12
	.word	0xee0e4000	! t0_kref+0x1488:   	ldub	[%i1], %l7
	.word	0x86102005	! t0_kref+0x148c:   	mov	0x5, %g3
	.word	0x86a0e001	! t0_kref+0x1490:   	subcc	%g3, 1, %g3
	.word	0x22800014	! t0_kref+0x1494:   	be,a	_kref+0x14e4
	.word	0x949b000c	! t0_kref+0x1498:   	xorcc	%o4, %o4, %o2
	.word	0xab23676a	! t0_kref+0x149c:   	mulscc	%o5, 0x76a, %l5
	.word	0xec1e6010	! t0_kref+0x14a0:   	ldd	[%i1 + 0x10], %l6
	.word	0xa1a0054a	! t0_kref+0x14a4:   	fsqrtd	%f10, %f16
	.word	0x95a0054e	! t0_kref+0x14a8:   	fsqrtd	%f14, %f10
	.word	0x3b800007	! t0_kref+0x14ac:   	fble,a	_kref+0x14c8
	.word	0xd53e2000	! t0_kref+0x14b0:   	std	%f10, [%i0]
	.word	0xa463400d	! t0_kref+0x14b4:   	subc	%o5, %o5, %l2
	.word	0xe81e7fe8	! t0_kref+0x14b8:   	ldd	[%i1 - 0x18], %l4
	.word	0x9ba40831	! t0_kref+0x14bc:   	fadds	%f16, %f17, %f13
	.word	0x95b34670	! t0_kref+0x14c0:   	fmul8x16au	%f13, %f16, %f10
	.word	0xdf00a024	! t0_kref+0x14c4:   	ld	[%g2 + 0x24], %f15
	.word	0xa5a4084a	! t0_kref+0x14c8:   	faddd	%f16, %f10, %f18
	.word	0x2b800006	! t0_kref+0x14cc:   	fbug,a	_kref+0x14e4
	.word	0xe11fbce8	! t0_kref+0x14d0:   	ldd	[%fp - 0x318], %f16
	.word	0x99a0054e	! t0_kref+0x14d4:   	fsqrtd	%f14, %f12
	.word	0xe03e7fe8	! t0_kref+0x14d8:   	std	%l0, [%i1 - 0x18]
	.word	0x97a00530	! t0_kref+0x14dc:   	fsqrts	%f16, %f11
	.word	0xd87f0018	! t0_kref+0x14e0:   	swap	[%i4 + %i0], %o4
	.word	0x36800006	! t0_kref+0x14e4:   	bge,a	_kref+0x14fc
	.word	0xe16e001a	! t0_kref+0x14e8:   	prefetch	%i0 + %i2, 16
	.word	0x81abca2c	! t0_kref+0x14ec:   	fcmps	%fcc0, %f15, %f12
	.word	0xa5a388b0	! t0_kref+0x14f0:   	fsubs	%f14, %f16, %f18
	.word	0xd008a02b	! t0_kref+0x14f4:   	ldub	[%g2 + 0x2b], %o0
	.word	0xe44e7fee	! t0_kref+0x14f8:   	ldsb	[%i1 - 0x12], %l2
	.word	0x8610200b	! t0_kref+0x14fc:   	mov	0xb, %g3
	.word	0x86a0e001	! t0_kref+0x1500:   	subcc	%g3, 1, %g3
	.word	0x22800010	! t0_kref+0x1504:   	be,a	_kref+0x1544
	.word	0xa5aa0050	! t0_kref+0x1508:   	fmovda	%fcc0, %f16, %f18
	.word	0xa1b4066a	! t0_kref+0x150c:   	fmul8x16au	%f16, %f10, %f16
	.word	0xe250a004	! t0_kref+0x1510:   	ldsh	[%g2 + 4], %l1
	.word	0xe168a00d	! t0_kref+0x1514:   	prefetch	%g2 + 0xd, 16
	.word	0x9ba01a4a	! t0_kref+0x1518:   	fdtoi	%f10, %f13
	.word	0x39bffff9	! t0_kref+0x151c:   	fbuge,a	_kref+0x1500
	.word	0xa883400d	! t0_kref+0x1520:   	addcc	%o5, %o5, %l4
	.word	0xea48a036	! t0_kref+0x1524:   	ldsb	[%g2 + 0x36], %l5
	.word	0xa213212d	! t0_kref+0x1528:   	or	%o4, 0x12d, %l1
	.word	0x2e480006	! t0_kref+0x152c:   	bvs,a,pt	%icc, _kref+0x1544
	.word	0xe11e001d	! t0_kref+0x1530:   	ldd	[%i0 + %i5], %f16
	.word	0xd610a00a	! t0_kref+0x1534:   	lduh	[%g2 + 0xa], %o3
	.word	0xe64e2018	! t0_kref+0x1538:   	ldsb	[%i0 + 0x18], %l3
	.word	0x95a00050	! t0_kref+0x153c:   	fmovd	%f16, %f10
	.word	0xe13e3fe0	! t0_kref+0x1540:   	std	%f16, [%i0 - 0x20]
	.word	0xc1e6500c	! t0_kref+0x1544:   	casa	[%i1]0x80, %o4, %g0
	.word	0x99a8404e	! t0_kref+0x1548:   	fmovdne	%fcc0, %f14, %f12
	.word	0xe11e401d	! t0_kref+0x154c:   	ldd	[%i1 + %i5], %f16
	.word	0x968b2ff6	! t0_kref+0x1550:   	andcc	%o4, 0xff6, %o3
	.word	0x9673400d	! t0_kref+0x1554:   	udiv	%o5, %o5, %o3
	.word	0x912b601c	! t0_kref+0x1558:   	sll	%o5, 0x1c, %o0
	.word	0x95a2c830	! t0_kref+0x155c:   	fadds	%f11, %f16, %f10
	.word	0xd51f4019	! t0_kref+0x1560:   	ldd	[%i5 + %i1], %f10
	.word	0xac93000d	! t0_kref+0x1564:   	orcc	%o4, %o5, %l6
	.word	0xab2b2004	! t0_kref+0x1568:   	sll	%o4, 0x4, %l5
	.word	0xd19f5a19	! t0_kref+0x156c:   	ldda	[%i5 + %i1]0xd0, %f8
	.word	0x9de3bfa0	! t0_kref+0x1570:   	save	%sp, -0x60, %sp
	.word	0xa7ef3632	! t0_kref+0x1574:   	restore	%i4, -0x9ce, %l3
	.word	0x878020d0	! t0_kref+0x1578:   	mov	0xd0, %asi
	.word	0x9db30f90	! t0_kref+0x157c:   	for	%f12, %f16, %f14
	.word	0x9fc10000	! t0_kref+0x1580:   	call	%g4
	.word	0xe6500019	! t0_kref+0x1584:   	ldsh	[%g0 + %i1], %l3
	.word	0xa5a0054e	! t0_kref+0x1588:   	fsqrtd	%f14, %f18
	.word	0xa1b00fe0	! t0_kref+0x158c:   	fones	%f16
	.word	0xc568a049	! t0_kref+0x1590:   	prefetch	%g2 + 0x49, 2
	.word	0xd8a81018	! t0_kref+0x1594:   	stba	%o4, [%g0 + %i0]0x80
	.word	0x9fa0052a	! t0_kref+0x1598:   	fsqrts	%f10, %f15
	.word	0xa1a01a4c	! t0_kref+0x159c:   	fdtoi	%f12, %f16
	.word	0x99a3c82d	! t0_kref+0x15a0:   	fadds	%f15, %f13, %f12
	.word	0xaa0373bc	! t0_kref+0x15a4:   	add	%o5, -0xc44, %l5
	.word	0xd248a027	! t0_kref+0x15a8:   	ldsb	[%g2 + 0x27], %o1
	.word	0xec064000	! t0_kref+0x15ac:   	ld	[%i1], %l6
	.word	0xe44e3fec	! t0_kref+0x15b0:   	ldsb	[%i0 - 0x14], %l2
	.word	0xacb3400d	! t0_kref+0x15b4:   	orncc	%o5, %o5, %l6
	.word	0xac93000d	! t0_kref+0x15b8:   	orcc	%o4, %o5, %l6
	.word	0xac737bb3	! t0_kref+0x15bc:   	udiv	%o5, -0x44d, %l6
	.word	0x3a800005	! t0_kref+0x15c0:   	bcc,a	_kref+0x15d4
	.word	0x97a3892a	! t0_kref+0x15c4:   	fmuls	%f14, %f10, %f11
	.word	0x968b000d	! t0_kref+0x15c8:   	andcc	%o4, %o5, %o3
	.word	0xd53f4018	! t0_kref+0x15cc:   	std	%f10, [%i5 + %i0]
	.word	0xed68a041	! t0_kref+0x15d0:   	prefetch	%g2 + 0x41, 22
	.word	0x33800008	! t0_kref+0x15d4:   	fbe,a	_kref+0x15f4
	.word	0xa1b40dad	! t0_kref+0x15d8:   	fxors	%f16, %f13, %f16
	.word	0x9da2892c	! t0_kref+0x15dc:   	fmuls	%f10, %f12, %f14
	.word	0x3d480003	! t0_kref+0x15e0:   	fbule,a,pt	%fcc0, _kref+0x15ec
	.word	0xac9b7ce9	! t0_kref+0x15e4:   	xorcc	%o5, -0x317, %l6
	.word	0xd93e0000	! t0_kref+0x15e8:   	std	%f12, [%i0]
	.word	0xa7a0052a	! t0_kref+0x15ec:   	fsqrts	%f10, %f19
	.word	0xa3b38ab2	! t0_kref+0x15f0:   	fpsub16s	%f14, %f18, %f17
	call	1f
	.empty
	.word	0xa5b00fc0	! t0_kref+0x15f8:   	fone	%f18
	.word	0xa5a01a52	! t0_kref+0x15fc:   	fdtoi	%f18, %f18
	.word	0xa293000d	! t0_kref+0x1600:   	orcc	%o4, %o5, %l1
	.word	0xae93400c	! t0_kref+0x1604:   	orcc	%o5, %o4, %l7
	.word	0x9da00550	! t0_kref+0x1608:   	fsqrtd	%f16, %f14
	.word	0xd700a038	! t0_kref+0x160c:   	ld	[%g2 + 0x38], %f11
1:	.word	0xa3a018cc	! t0_kref+0x1610:   	fdtos	%f12, %f17
	.word	0x9da9c04e	! t0_kref+0x1614:   	fmovdu	%fcc0, %f14, %f14
	.word	0xe13e6000	! t0_kref+0x1618:   	std	%f16, [%i1]
	.word	0xd07f0019	! t0_kref+0x161c:   	swap	[%i4 + %i1], %o0
	.word	0xe4064000	! t0_kref+0x1620:   	ld	[%i1], %l2
	.word	0xe66e7fe5	! t0_kref+0x1624:   	ldstub	[%i1 - 0x1b], %l3
	.word	0xe5e6500c	! t0_kref+0x1628:   	casa	[%i1]0x80, %o4, %l2
	.word	0xd8267fe4	! t0_kref+0x162c:   	st	%o4, [%i1 - 0x1c]
	.word	0x99a01a31	! t0_kref+0x1630:   	fstoi	%f17, %f12
	.word	0xd248a03a	! t0_kref+0x1634:   	ldsb	[%g2 + 0x3a], %o1
	.word	0xec100019	! t0_kref+0x1638:   	lduh	[%g0 + %i1], %l6
	.word	0xa7b340cd	! t0_kref+0x163c:   	edge16l	%o5, %o5, %l3
	.word	0xd836001b	! t0_kref+0x1640:   	sth	%o4, [%i0 + %i3]
	.word	0x99b48990	! t0_kref+0x1644:   	bshuffle	%f18, %f16, %f12
	.word	0x913b400c	! t0_kref+0x1648:   	sra	%o5, %o4, %o0
	.word	0x97a01a2d	! t0_kref+0x164c:   	fstoi	%f13, %f11
	.word	0x95b3caab	! t0_kref+0x1650:   	fpsub16s	%f15, %f11, %f10
	.word	0x3d800008	! t0_kref+0x1654:   	fbule,a	_kref+0x1674
	.word	0xea86501c	! t0_kref+0x1658:   	lda	[%i1 + %i4]0x80, %l5
	.word	0xa263000c	! t0_kref+0x165c:   	subc	%o4, %o4, %l1
	.word	0x9fc10000	! t0_kref+0x1660:   	call	%g4
	.word	0xd700a01c	! t0_kref+0x1664:   	ld	[%g2 + 0x1c], %f11
	.word	0xa3b340ec	! t0_kref+0x1668:   	edge16ln	%o5, %o4, %l1
	.word	0xe36e401d	! t0_kref+0x166c:   	prefetch	%i1 + %i5, 17
	.word	0x2b480003	! t0_kref+0x1670:   	fbug,a,pt	%fcc0, _kref+0x167c
	.word	0xe100a038	! t0_kref+0x1674:   	ld	[%g2 + 0x38], %f16
	.word	0xa273400c	! t0_kref+0x1678:   	udiv	%o5, %o4, %l1
	.word	0xe07f0018	! t0_kref+0x167c:   	swap	[%i4 + %i0], %l0
	.word	0xee50a02a	! t0_kref+0x1680:   	ldsh	[%g2 + 0x2a], %l7
	.word	0xe6163ff4	! t0_kref+0x1684:   	lduh	[%i0 - 0xc], %l3
	.word	0xa29362dc	! t0_kref+0x1688:   	orcc	%o5, 0x2dc, %l1
	.word	0xac9b000d	! t0_kref+0x168c:   	xorcc	%o4, %o5, %l6
	.word	0xa5b3000d	! t0_kref+0x1690:   	edge8	%o4, %o5, %l2
	.word	0xa4fb000d	! t0_kref+0x1694:   	sdivcc	%o4, %o5, %l2
	.word	0xda264000	! t0_kref+0x1698:   	st	%o5, [%i1]
	.word	0xe60e7ffd	! t0_kref+0x169c:   	ldub	[%i1 - 3], %l3
	.word	0xec0e2015	! t0_kref+0x16a0:   	ldub	[%i0 + 0x15], %l6
	.word	0xa3a0052f	! t0_kref+0x16a4:   	fsqrts	%f15, %f17
	.word	0x95b28e0c	! t0_kref+0x16a8:   	fand	%f10, %f12, %f10
	.word	0xea06200c	! t0_kref+0x16ac:   	ld	[%i0 + 0xc], %l5
	.word	0xe3066000	! t0_kref+0x16b0:   	ld	[%i1], %f17
	.word	0x94b37661	! t0_kref+0x16b4:   	orncc	%o5, -0x99f, %o2
	.word	0x81ac0a50	! t0_kref+0x16b8:   	fcmpd	%fcc0, %f16, %f16
	.word	0xa5a00552	! t0_kref+0x16bc:   	fsqrtd	%f18, %f18
	.word	0x90db000d	! t0_kref+0x16c0:   	smulcc	%o4, %o5, %o0
	.word	0x95a0052d	! t0_kref+0x16c4:   	fsqrts	%f13, %f10
	.word	0x940b2161	! t0_kref+0x16c8:   	and	%o4, 0x161, %o2
	.word	0xd93e7ff8	! t0_kref+0x16cc:   	std	%f12, [%i1 - 8]
	.word	0xe25e7fe8	! t0_kref+0x16d0:   	ldx	[%i1 - 0x18], %l1
	.word	0x37800006	! t0_kref+0x16d4:   	fbge,a	_kref+0x16ec
	.word	0xe500a03c	! t0_kref+0x16d8:   	ld	[%g2 + 0x3c], %f18
	.word	0x95b340ed	! t0_kref+0x16dc:   	edge16ln	%o5, %o5, %o2
	.word	0xac13400d	! t0_kref+0x16e0:   	or	%o5, %o5, %l6
	.word	0xa1a018d2	! t0_kref+0x16e4:   	fdtos	%f18, %f16
	.word	0xac9b000d	! t0_kref+0x16e8:   	xorcc	%o4, %o5, %l6
	.word	0xd836401b	! t0_kref+0x16ec:   	sth	%o4, [%i1 + %i3]
	.word	0xd51fbf60	! t0_kref+0x16f0:   	ldd	[%fp - 0xa0], %f10
	.word	0xd496d018	! t0_kref+0x16f4:   	lduha	[%i3 + %i0]0x80, %o2
	.word	0xd91fbc98	! t0_kref+0x16f8:   	ldd	[%fp - 0x368], %f12
	.word	0x27480003	! t0_kref+0x16fc:   	fbul,a,pt	%fcc0, _kref+0x1708
	.word	0xe01e0000	! t0_kref+0x1700:   	ldd	[%i0], %l0
	.word	0xa1b406ce	! t0_kref+0x1704:   	fmul8sux16	%f16, %f14, %f16
	.word	0xe11fbda8	! t0_kref+0x1708:   	ldd	[%fp - 0x258], %f16
	.word	0x927b7ad1	! t0_kref+0x170c:   	sdiv	%o5, -0x52f, %o1
	.word	0x99a288ca	! t0_kref+0x1710:   	fsubd	%f10, %f10, %f12
	.word	0x3c800005	! t0_kref+0x1714:   	bpos,a	_kref+0x1728
	.word	0xaea37198	! t0_kref+0x1718:   	subcc	%o5, -0xe68, %l7
	.word	0xa5a0052e	! t0_kref+0x171c:   	fsqrts	%f14, %f18
	.word	0xd9be188d	! t0_kref+0x1720:   	stda	%f12, [%i0 + %o5]0xc4
	.word	0xac1363f7	! t0_kref+0x1724:   	or	%o5, 0x3f7, %l6
	.word	0xe4062008	! t0_kref+0x1728:   	ld	[%i0 + 8], %l2
	.word	0xe700a02c	! t0_kref+0x172c:   	ld	[%g2 + 0x2c], %f19
	.word	0x81ac0aad	! t0_kref+0x1730:   	fcmpes	%fcc0, %f16, %f13
	.word	0x9463400d	! t0_kref+0x1734:   	subc	%o5, %o5, %o2
	.word	0xe1be5a1c	! t0_kref+0x1738:   	stda	%f16, [%i1 + %i4]0xd0
	.word	0x912b2015	! t0_kref+0x173c:   	sll	%o4, 0x15, %o0
	.word	0x9fc10000	! t0_kref+0x1740:   	call	%g4
	.word	0xec062014	! t0_kref+0x1744:   	ld	[%i0 + 0x14], %l6
	.word	0x86102008	! t0_kref+0x1748:   	mov	0x8, %g3
	.word	0x86a0e001	! t0_kref+0x174c:   	subcc	%g3, 1, %g3
	.word	0x22800010	! t0_kref+0x1750:   	be,a	_kref+0x1790
	.word	0xd91e7fe0	! t0_kref+0x1754:   	ldd	[%i1 - 0x20], %f12
	.word	0xa1b40a0e	! t0_kref+0x1758:   	fpadd16	%f16, %f14, %f16
	.word	0x254ffffc	! t0_kref+0x175c:   	fblg,a,pt	%fcc0, _kref+0x174c
	.word	0xe47e7fe0	! t0_kref+0x1760:   	swap	[%i1 - 0x20], %l2
	.word	0x22bffffa	! t0_kref+0x1764:   	be,a	_kref+0x174c
	.word	0xd68e9019	! t0_kref+0x1768:   	lduba	[%i2 + %i1]0x80, %o3
	.word	0xa32b000c	! t0_kref+0x176c:   	sll	%o4, %o4, %l1
	.word	0xa8a33057	! t0_kref+0x1770:   	subcc	%o4, -0xfa9, %l4
	.word	0xad70000c	! t0_kref+0x1774:   	popc	%o4, %l6
	.word	0x9033665b	! t0_kref+0x1778:   	orn	%o5, 0x65b, %o0
	.word	0xa89b2abd	! t0_kref+0x177c:   	xorcc	%o4, 0xabd, %l4
	.word	0x81aacaae	! t0_kref+0x1780:   	fcmpes	%fcc0, %f11, %f14
	.word	0xd99f1a18	! t0_kref+0x1784:   	ldda	[%i4 + %i0]0xd0, %f12
	.word	0x95b340ac	! t0_kref+0x1788:   	edge16n	%o5, %o4, %o2
	.word	0xaa9b000c	! t0_kref+0x178c:   	xorcc	%o4, %o4, %l5
	.word	0xa6fb000d	! t0_kref+0x1790:   	sdivcc	%o4, %o5, %l3
	.word	0xa273000c	! t0_kref+0x1794:   	udiv	%o4, %o4, %l1
	.word	0xe01e2010	! t0_kref+0x1798:   	ldd	[%i0 + 0x10], %l0
	.word	0xc36e7ff8	! t0_kref+0x179c:   	prefetch	%i1 - 8, 1
	.word	0xae7b400d	! t0_kref+0x17a0:   	sdiv	%o5, %o5, %l7
	.word	0x81db7dba	! t0_kref+0x17a4:   	flush	%o5 - 0x246
	.word	0xa9b285ca	! t0_kref+0x17a8:   	fcmpeq32	%f10, %f10, %l4
	.word	0xa443205f	! t0_kref+0x17ac:   	addc	%o4, 0x5f, %l2
	.word	0x37800007	! t0_kref+0x17b0:   	fbge,a	_kref+0x17cc
	.word	0x8d83400c	! t0_kref+0x17b4:   	wr	%o5, %o4, %fprs
	.word	0xe8080019	! t0_kref+0x17b8:   	ldub	[%g0 + %i1], %l4
	.word	0xa1a348ab	! t0_kref+0x17bc:   	fsubs	%f13, %f11, %f16
	.word	0x99b48d8a	! t0_kref+0x17c0:   	fxor	%f18, %f10, %f12
	call	SYM(t0_subr2)
	.word	0xaa0b65a1	! t0_kref+0x17c8:   	and	%o5, 0x5a1, %l5
	.word	0xa5400000	! t0_kref+0x17cc:   	mov	%y, %l2
	.word	0x911b400c	! t0_kref+0x17d0:   	tsubcctv	%o5, %o4, %o0
	.word	0xe808a01b	! t0_kref+0x17d4:   	ldub	[%g2 + 0x1b], %l4
	.word	0x81acca33	! t0_kref+0x17d8:   	fcmps	%fcc0, %f19, %f19
	.word	0xa1b00f0e	! t0_kref+0x17dc:   	fsrc2	%f14, %f16
	.word	0x9163e727	! t0_kref+0x17e0:   	movo	%fcc0, -0xd9, %o0
	.word	0xf76e3ff0	! t0_kref+0x17e4:   	prefetch	%i0 - 0x10, 27
	.word	0x8143c000	! t0_kref+0x17e8:   	stbar
	.word	0xd900a024	! t0_kref+0x17ec:   	ld	[%g2 + 0x24], %f12
	.word	0xa5b3000c	! t0_kref+0x17f0:   	edge8	%o4, %o4, %l2
	.word	0xe36e401b	! t0_kref+0x17f4:   	prefetch	%i1 + %i3, 17
	.word	0x33480001	! t0_kref+0x17f8:   	fbe,a,pt	%fcc0, _kref+0x17fc
	.word	0x9ba38833	! t0_kref+0x17fc:   	fadds	%f14, %f19, %f13
	.word	0xd000a028	! t0_kref+0x1800:   	ld	[%g2 + 0x28], %o0
	.word	0xa693000d	! t0_kref+0x1804:   	orcc	%o4, %o5, %l3
	.word	0x9013000d	! t0_kref+0x1808:   	or	%o4, %o5, %o0
	.word	0x92ab000c	! t0_kref+0x180c:   	andncc	%o4, %o4, %o1
	.word	0x9db48e2d	! t0_kref+0x1810:   	fands	%f18, %f13, %f14
	.word	0x9da00531	! t0_kref+0x1814:   	fsqrts	%f17, %f14
	.word	0xe48e9019	! t0_kref+0x1818:   	lduba	[%i2 + %i1]0x80, %l2
	.word	0xa5b307d2	! t0_kref+0x181c:   	pdist	%f12, %f18, %f18
	.word	0xe3264000	! t0_kref+0x1820:   	st	%f17, [%i1]
	.word	0xa1b30e10	! t0_kref+0x1824:   	fand	%f12, %f16, %f16
	.word	0x99b00fc0	! t0_kref+0x1828:   	fone	%f12
	.word	0xe800a03c	! t0_kref+0x182c:   	ld	[%g2 + 0x3c], %l4
	.word	0x967b000d	! t0_kref+0x1830:   	sdiv	%o4, %o5, %o3
	.word	0x9de3bfa0	! t0_kref+0x1834:   	save	%sp, -0x60, %sp
	.word	0xb1074018	! t0_kref+0x1838:   	taddcc	%i5, %i0, %i0
	.word	0xa3e80000	! t0_kref+0x183c:   	restore	%g0, %g0, %l1
	.word	0x9ba0012b	! t0_kref+0x1840:   	fabss	%f11, %f13
	.word	0xa483400d	! t0_kref+0x1844:   	addcc	%o5, %o5, %l2
	.word	0xe53e2000	! t0_kref+0x1848:   	std	%f18, [%i0]
	.word	0x9da3894a	! t0_kref+0x184c:   	fmuld	%f14, %f10, %f14
	.word	0x81aa8a4e	! t0_kref+0x1850:   	fcmpd	%fcc0, %f10, %f14
	.word	0xa5a00533	! t0_kref+0x1854:   	fsqrts	%f19, %f18
	.word	0x3f480004	! t0_kref+0x1858:   	fbo,a,pt	%fcc0, _kref+0x1868
	.word	0xa413000d	! t0_kref+0x185c:   	or	%o4, %o5, %l2
	.word	0x81830000	! t0_kref+0x1860:   	wr	%o4, %g0, %y
	.word	0x99b4890c	! t0_kref+0x1864:   	faligndata	%f18, %f12, %f12
	.word	0x9273000d	! t0_kref+0x1868:   	udiv	%o4, %o5, %o1
	.word	0xa6d3000c	! t0_kref+0x186c:   	umulcc	%o4, %o4, %l3
	.word	0x910b6897	! t0_kref+0x1870:   	tsubcc	%o5, 0x897, %o0
	.word	0x99a00532	! t0_kref+0x1874:   	fsqrts	%f18, %f12
	.word	0xa2d3000d	! t0_kref+0x1878:   	umulcc	%o4, %o5, %l1
	call	SYM(t0_subr3)
	.word	0xa1b2cf6a	! t0_kref+0x1880:   	fornot1s	%f11, %f10, %f16
	.word	0xae9b400d	! t0_kref+0x1884:   	xorcc	%o5, %o5, %l7
	.word	0xa92b6018	! t0_kref+0x1888:   	sll	%o5, 0x18, %l4
	.word	0x2f800006	! t0_kref+0x188c:   	fbu,a	_kref+0x18a4
	.word	0xa2136a4f	! t0_kref+0x1890:   	or	%o5, 0xa4f, %l1
	.word	0xa6132e49	! t0_kref+0x1894:   	or	%o4, 0xe49, %l3
	.word	0xe03e4000	! t0_kref+0x1898:   	std	%l0, [%i1]
	.word	0x23800007	! t0_kref+0x189c:   	fbne,a	_kref+0x18b8
	.word	0xe7063fe8	! t0_kref+0x18a0:   	ld	[%i0 - 0x18], %f19
	.word	0x95a0054a	! t0_kref+0x18a4:   	fsqrtd	%f10, %f10
	.word	0xa47b000d	! t0_kref+0x18a8:   	sdiv	%o4, %o5, %l2
	.word	0x81ac8a50	! t0_kref+0x18ac:   	fcmpd	%fcc0, %f18, %f16
	.word	0xabb3858a	! t0_kref+0x18b0:   	fcmpgt32	%f14, %f10, %l5
	.word	0xeec01019	! t0_kref+0x18b4:   	ldswa	[%g0 + %i1]0x80, %l7
	.word	0xe4981019	! t0_kref+0x18b8:   	ldda	[%g0 + %i1]0x80, %l2
	.word	0xe41e3ff8	! t0_kref+0x18bc:   	ldd	[%i0 - 8], %l2
	.word	0x95a2c831	! t0_kref+0x18c0:   	fadds	%f11, %f17, %f10
	.word	0x9fa3082a	! t0_kref+0x18c4:   	fadds	%f12, %f10, %f15
	.word	0xe03e401d	! t0_kref+0x18c8:   	std	%l0, [%i1 + %i5]
	.word	0xaafb400c	! t0_kref+0x18cc:   	sdivcc	%o5, %o4, %l5
	.word	0x9263400d	! t0_kref+0x18d0:   	subc	%o5, %o5, %o1
	.word	0xdd180018	! t0_kref+0x18d4:   	ldd	[%g0 + %i0], %f14
	.word	0x9fa018ca	! t0_kref+0x18d8:   	fdtos	%f10, %f15
	.word	0xd07e4000	! t0_kref+0x18dc:   	swap	[%i1], %o0
	.word	0xea063fe4	! t0_kref+0x18e0:   	ld	[%i0 - 0x1c], %l5
	.word	0xa5a38833	! t0_kref+0x18e4:   	fadds	%f14, %f19, %f18
	.word	0xe0be501d	! t0_kref+0x18e8:   	stda	%l0, [%i1 + %i5]0x80
	.word	0xa7a00532	! t0_kref+0x18ec:   	fsqrts	%f18, %f19
	.word	0xea4e401a	! t0_kref+0x18f0:   	ldsb	[%i1 + %i2], %l5
	.word	0xd93e4000	! t0_kref+0x18f4:   	std	%f12, [%i1]
	.word	0x95a34832	! t0_kref+0x18f8:   	fadds	%f13, %f18, %f10
	.word	0xd048a03e	! t0_kref+0x18fc:   	ldsb	[%g2 + 0x3e], %o0
	.word	0xe1063fe8	! t0_kref+0x1900:   	ld	[%i0 - 0x18], %f16
	.word	0xa9b340ed	! t0_kref+0x1904:   	edge16ln	%o5, %o5, %l4
	.word	0x81ac0a32	! t0_kref+0x1908:   	fcmps	%fcc0, %f16, %f18
	.word	0x968b249a	! t0_kref+0x190c:   	andcc	%o4, 0x49a, %o3
	.word	0xe64e3ff1	! t0_kref+0x1910:   	ldsb	[%i0 - 0xf], %l3
	.word	0xac63400c	! t0_kref+0x1914:   	subc	%o5, %o4, %l6
	.word	0xa1a00552	! t0_kref+0x1918:   	fsqrtd	%f18, %f16
	.word	0xa5a4084e	! t0_kref+0x191c:   	faddd	%f16, %f14, %f18
	.word	0x9fa0052e	! t0_kref+0x1920:   	fsqrts	%f14, %f15
	.word	0xa5a28d2d	! t0_kref+0x1924:   	fsmuld	%f10, %f13, %f18
	.word	0x9da4084c	! t0_kref+0x1928:   	faddd	%f16, %f12, %f14
	.word	0xa5a0052a	! t0_kref+0x192c:   	fsqrts	%f10, %f18
	.word	0x90136d1c	! t0_kref+0x1930:   	or	%o5, 0xd1c, %o0
	.word	0xac9365dd	! t0_kref+0x1934:   	orcc	%o5, 0x5dd, %l6
	.word	0xe0b81018	! t0_kref+0x1938:   	stda	%l0, [%g0 + %i0]0x80
	.word	0x81ac0a4a	! t0_kref+0x193c:   	fcmpd	%fcc0, %f16, %f10
	.word	0xea100018	! t0_kref+0x1940:   	lduh	[%g0 + %i0], %l5
	.word	0xea4e6006	! t0_kref+0x1944:   	ldsb	[%i1 + 6], %l5
	.word	0x99b28d10	! t0_kref+0x1948:   	fandnot1	%f10, %f16, %f12
	.word	0x90933ba0	! t0_kref+0x194c:   	orcc	%o4, -0x460, %o0
	.word	0x95a0054c	! t0_kref+0x1950:   	fsqrtd	%f12, %f10
	.word	0x22480002	! t0_kref+0x1954:   	be,a,pt	%icc, _kref+0x195c
	.word	0xe250a004	! t0_kref+0x1958:   	ldsh	[%g2 + 4], %l1
	.word	0x9db44f6f	! t0_kref+0x195c:   	fornot1s	%f17, %f15, %f14
	.word	0x95a00531	! t0_kref+0x1960:   	fsqrts	%f17, %f10
	.word	0xd40e3ff7	! t0_kref+0x1964:   	ldub	[%i0 - 9], %o2
	.word	0xa5b40d2a	! t0_kref+0x1968:   	fandnot1s	%f16, %f10, %f18
	.word	0x9db28f8c	! t0_kref+0x196c:   	for	%f10, %f12, %f14
	.word	0x86102004	! t0_kref+0x1970:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x1974:   	bne,a	_kref+0x1974
	.word	0x86a0e001	! t0_kref+0x1978:   	subcc	%g3, 1, %g3
	.word	0xd2000018	! t0_kref+0x197c:   	ld	[%g0 + %i0], %o1
	.word	0x81ac8ab0	! t0_kref+0x1980:   	fcmpes	%fcc0, %f18, %f16
	.word	0x26800003	! t0_kref+0x1984:   	bl,a	_kref+0x1990
	.word	0xd24e7ff2	! t0_kref+0x1988:   	ldsb	[%i1 - 0xe], %o1
	.word	0x9ba0188e	! t0_kref+0x198c:   	fitos	%f14, %f13
	.word	0x2f800006	! t0_kref+0x1990:   	fbu,a	_kref+0x19a8
	.word	0xa72b2013	! t0_kref+0x1994:   	sll	%o4, 0x13, %l3
	.word	0xda300019	! t0_kref+0x1998:   	sth	%o5, [%g0 + %i1]
	.word	0xd0566018	! t0_kref+0x199c:   	ldsh	[%i1 + 0x18], %o0
	.word	0xd00e2000	! t0_kref+0x19a0:   	ldub	[%i0], %o0
	.word	0xe6066010	! t0_kref+0x19a4:   	ld	[%i1 + 0x10], %l3
	.word	0xad400000	! t0_kref+0x19a8:   	mov	%y, %l6
	.word	0xa1b28f4e	! t0_kref+0x19ac:   	fornot1	%f10, %f14, %f16
	.word	0x952b2007	! t0_kref+0x19b0:   	sll	%o4, 0x7, %o2
	.word	0x9db48a4c	! t0_kref+0x19b4:   	fpadd32	%f18, %f12, %f14
	.word	0xe1be1a1b	! t0_kref+0x19b8:   	stda	%f16, [%i0 + %i3]0xd0
	.word	0xe76e401c	! t0_kref+0x19bc:   	prefetch	%i1 + %i4, 19
	.word	0x95a0054c	! t0_kref+0x19c0:   	fsqrtd	%f12, %f10
	.word	0xa3b3ca73	! t0_kref+0x19c4:   	fpadd32s	%f15, %f19, %f17
	.word	0x99b00cf0	! t0_kref+0x19c8:   	fnot2s	%f16, %f12
	.word	0x99b30d8c	! t0_kref+0x19cc:   	fxor	%f12, %f12, %f12
	.word	0xa3a0012d	! t0_kref+0x19d0:   	fabss	%f13, %f17
	.word	0x38800001	! t0_kref+0x19d4:   	bgu,a	_kref+0x19d8
	.word	0xa5a00532	! t0_kref+0x19d8:   	fsqrts	%f18, %f18
	.word	0x3b480001	! t0_kref+0x19dc:   	fble,a,pt	%fcc0, _kref+0x19e0
	.word	0x95b48aeb	! t0_kref+0x19e0:   	fpsub32s	%f18, %f11, %f10
	.word	0xa1b38d2c	! t0_kref+0x19e4:   	fandnot1s	%f14, %f12, %f16
	.word	0xa7400000	! t0_kref+0x19e8:   	mov	%y, %l3
	.word	0xaa632678	! t0_kref+0x19ec:   	subc	%o4, 0x678, %l5
	.word	0xa21b000c	! t0_kref+0x19f0:   	xor	%o4, %o4, %l1
	.word	0x81dea09e	! t0_kref+0x19f4:   	flush	%i2 + 0x9e
	.word	0x81ac8a2d	! t0_kref+0x19f8:   	fcmps	%fcc0, %f18, %f13
	.word	0xe19eda18	! t0_kref+0x19fc:   	ldda	[%i3 + %i0]0xd0, %f16
	.word	0xe51fbdc0	! t0_kref+0x1a00:   	ldd	[%fp - 0x240], %f18
	.word	0xa49b6e53	! t0_kref+0x1a04:   	xorcc	%o5, 0xe53, %l2
	.word	0xd64e4000	! t0_kref+0x1a08:   	ldsb	[%i1], %o3
	.word	0xa7a0052d	! t0_kref+0x1a0c:   	fsqrts	%f13, %f19
	.word	0xd04e0000	! t0_kref+0x1a10:   	ldsb	[%i0], %o0
	.word	0xfe16c000	! t0_kref+0x1a14:   	lduh	[%i3], %i7
	.word	0xa1a0002d	! t0_kref+0x1a18:   	fmovs	%f13, %f16
	.word	0xdd00a030	! t0_kref+0x1a1c:   	ld	[%g2 + 0x30], %f14
	.word	0xd206200c	! t0_kref+0x1a20:   	ld	[%i0 + 0xc], %o1
	.word	0x91b3004d	! t0_kref+0x1a24:   	edge8l	%o4, %o5, %o0
	.word	0xac73400c	! t0_kref+0x1a28:   	udiv	%o5, %o4, %l6
	.word	0xaa93292a	! t0_kref+0x1a2c:   	orcc	%o4, 0x92a, %l5
	.word	0x99b3866a	! t0_kref+0x1a30:   	fmul8x16au	%f14, %f10, %f12
	.word	0xa3b34ea0	! t0_kref+0x1a34:   	fsrc1s	%f13, %f17
	.word	0x95b286ca	! t0_kref+0x1a38:   	fmul8sux16	%f10, %f10, %f10
	.word	0xa8b3400c	! t0_kref+0x1a3c:   	orncc	%o5, %o4, %l4
	.word	0xed6e401d	! t0_kref+0x1a40:   	prefetch	%i1 + %i5, 22
	.word	0x96fb400c	! t0_kref+0x1a44:   	sdivcc	%o5, %o4, %o3
	.word	0xab237453	! t0_kref+0x1a48:   	mulscc	%o5, -0xbad, %l5
	.word	0x9db28d8e	! t0_kref+0x1a4c:   	fxor	%f10, %f14, %f14
	.word	0xec1f4018	! t0_kref+0x1a50:   	ldd	[%i5 + %i0], %l6
	.word	0xe248a00e	! t0_kref+0x1a54:   	ldsb	[%g2 + 0xe], %l1
	.word	0x907320c5	! t0_kref+0x1a58:   	udiv	%o4, 0xc5, %o0
	.word	0x91400000	! t0_kref+0x1a5c:   	mov	%y, %o0
	.word	0xac037c7d	! t0_kref+0x1a60:   	add	%o5, -0x383, %l6
	.word	0xee0e600d	! t0_kref+0x1a64:   	ldub	[%i1 + 0xd], %l7
	.word	0xee4e3ff4	! t0_kref+0x1a68:   	ldsb	[%i0 - 0xc], %l7
	.word	0x9bb38a2d	! t0_kref+0x1a6c:   	fpadd16s	%f14, %f13, %f13
	.word	0xa2a377e4	! t0_kref+0x1a70:   	subcc	%o5, -0x81c, %l1
	.word	0x31800005	! t0_kref+0x1a74:   	fba,a	_kref+0x1a88
	.word	0x93b3410c	! t0_kref+0x1a78:   	edge32	%o5, %o4, %o1
	.word	0x99b007b2	! t0_kref+0x1a7c:   	fpackfix	%f18, %f12
	.word	0x9fa2c8b1	! t0_kref+0x1a80:   	fsubs	%f11, %f17, %f15
	.word	0xe11fbc28	! t0_kref+0x1a84:   	ldd	[%fp - 0x3d8], %f16
	.word	0xd4080019	! t0_kref+0x1a88:   	ldub	[%g0 + %i1], %o2
	.word	0x81dc0018	! t0_kref+0x1a8c:   	flush	%l0 + %i0
	.word	0xae133559	! t0_kref+0x1a90:   	or	%o4, -0xaa7, %l7
	.word	0xdd1fbeb0	! t0_kref+0x1a94:   	ldd	[%fp - 0x150], %f14
	.word	0x9da01a32	! t0_kref+0x1a98:   	fstoi	%f18, %f14
	.word	0xea00a028	! t0_kref+0x1a9c:   	ld	[%g2 + 0x28], %l5
	.word	0x95a00550	! t0_kref+0x1aa0:   	fsqrtd	%f16, %f10
	.word	0xe2067fe0	! t0_kref+0x1aa4:   	ld	[%i1 - 0x20], %l1
	.word	0xa5b30200	! t0_kref+0x1aa8:   	array8	%o4, %g0, %l2
	.word	0xac63400c	! t0_kref+0x1aac:   	subc	%o5, %o4, %l6
	.word	0x95b38f92	! t0_kref+0x1ab0:   	for	%f14, %f18, %f10
	.word	0x95a01090	! t0_kref+0x1ab4:   	fxtos	%f16, %f10
	.word	0xae032ef6	! t0_kref+0x1ab8:   	add	%o4, 0xef6, %l7
	.word	0xec08a025	! t0_kref+0x1abc:   	ldub	[%g2 + 0x25], %l6
	.word	0xa762800c	! t0_kref+0x1ac0:   	movue	%fcc0, %o4, %l3
	.word	0x902b29b3	! t0_kref+0x1ac4:   	andn	%o4, 0x9b3, %o0
	.word	0xa3a0002e	! t0_kref+0x1ac8:   	fmovs	%f14, %f17
	.word	0x9fa388ae	! t0_kref+0x1acc:   	fsubs	%f14, %f14, %f15
	.word	0xa92b6005	! t0_kref+0x1ad0:   	sll	%o5, 0x5, %l4
	.word	0xe44e8019	! t0_kref+0x1ad4:   	ldsb	[%i2 + %i1], %l2
	.word	0xa3a01090	! t0_kref+0x1ad8:   	fxtos	%f16, %f17
	.word	0xa463400c	! t0_kref+0x1adc:   	subc	%o5, %o4, %l2
	.word	0x81834000	! t0_kref+0x1ae0:   	wr	%o5, %g0, %y
	.word	0xe81e001d	! t0_kref+0x1ae4:   	ldd	[%i0 + %i5], %l4
	.word	0x92336a8f	! t0_kref+0x1ae8:   	orn	%o5, 0xa8f, %o1
	.word	0xa8b3000d	! t0_kref+0x1aec:   	orncc	%o4, %o5, %l4
	.word	0xa3b30240	! t0_kref+0x1af0:   	array16	%o4, %g0, %l1
	.word	0x95b40d8a	! t0_kref+0x1af4:   	fxor	%f16, %f10, %f10
	.word	0x99a0054c	! t0_kref+0x1af8:   	fsqrtd	%f12, %f12
	.word	0xf7ee501d	! t0_kref+0x1afc:   	prefetcha	%i1 + %i5, 27
	.word	0xd9be188d	! t0_kref+0x1b00:   	stda	%f12, [%i0 + %o5]0xc4
	.word	0x001fffff	! t0_kref+0x1b04:   	illtrap	0x1fffff
	.word	0x95a0054a	! t0_kref+0x1b08:   	fsqrtd	%f10, %f10
	.word	0xe51e3fe8	! t0_kref+0x1b0c:   	ldd	[%i0 - 0x18], %f18
	.word	0x2530c8b0	! t0_kref+0x1b10:   	sethi	%hi(0xc322c000), %l2
	.word	0x95a0052f	! t0_kref+0x1b14:   	fsqrts	%f15, %f10
	.word	0xad408000	! t0_kref+0x1b18:   	mov	%ccr, %l6
	.word	0xa3b3030d	! t0_kref+0x1b1c:   	alignaddr	%o4, %o5, %l1
	.word	0x9213000d	! t0_kref+0x1b20:   	or	%o4, %o5, %o1
	.word	0xa7b28aac	! t0_kref+0x1b24:   	fpsub16s	%f10, %f12, %f19
	.word	0xa1b40acc	! t0_kref+0x1b28:   	fpsub32	%f16, %f12, %f16
	.word	0x81dcac51	! t0_kref+0x1b2c:   	flush	%l2 + 0xc51
	.word	0xd40e2002	! t0_kref+0x1b30:   	ldub	[%i0 + 2], %o2
	.word	0xd400a03c	! t0_kref+0x1b34:   	ld	[%g2 + 0x3c], %o2
	.word	0x26800004	! t0_kref+0x1b38:   	bl,a	_kref+0x1b48
	.word	0xec965000	! t0_kref+0x1b3c:   	lduha	[%i1]0x80, %l6
	.word	0xd500a038	! t0_kref+0x1b40:   	ld	[%g2 + 0x38], %f10
	.word	0x99b38f6b	! t0_kref+0x1b44:   	fornot1s	%f14, %f11, %f12
	.word	0x9613000c	! t0_kref+0x1b48:   	or	%o4, %o4, %o3
	.word	0xa5b30f6f	! t0_kref+0x1b4c:   	fornot1s	%f12, %f15, %f18
	.word	0xabb300ec	! t0_kref+0x1b50:   	edge16ln	%o4, %o4, %l5
	.word	0x97a388ab	! t0_kref+0x1b54:   	fsubs	%f14, %f11, %f11
	.word	0x2a480005	! t0_kref+0x1b58:   	bcs,a,pt	%icc, _kref+0x1b6c
	.word	0xd248a00f	! t0_kref+0x1b5c:   	ldsb	[%g2 + 0xf], %o1
	.word	0x9ba01a4c	! t0_kref+0x1b60:   	fdtoi	%f12, %f13
	.word	0xd6067ff8	! t0_kref+0x1b64:   	ld	[%i1 - 8], %o3
	.word	0xae03000d	! t0_kref+0x1b68:   	add	%o4, %o5, %l7
	.word	0x9063400c	! t0_kref+0x1b6c:   	subc	%o5, %o4, %o0
	.word	0xa1a00530	! t0_kref+0x1b70:   	fsqrts	%f16, %f16
	.word	0xa5a2884c	! t0_kref+0x1b74:   	faddd	%f10, %f12, %f18
	.word	0xe8c71019	! t0_kref+0x1b78:   	ldswa	[%i4 + %i1]0x80, %l4
	.word	0x99b4096e	! t0_kref+0x1b7c:   	fpmerge	%f16, %f14, %f12
	.word	0xd450a02c	! t0_kref+0x1b80:   	ldsh	[%g2 + 0x2c], %o2
	.word	0x9fb00fe0	! t0_kref+0x1b84:   	fones	%f15
	.word	0x81ab8a4a	! t0_kref+0x1b88:   	fcmpd	%fcc0, %f14, %f10
	.word	0x26800008	! t0_kref+0x1b8c:   	bl,a	_kref+0x1bac
	.word	0xd51e401d	! t0_kref+0x1b90:   	ldd	[%i1 + %i5], %f10
	.word	0xa53b400d	! t0_kref+0x1b94:   	sra	%o5, %o5, %l2
	.word	0xa5a01a4c	! t0_kref+0x1b98:   	fdtoi	%f12, %f18
	.word	0xdd3e6010	! t0_kref+0x1b9c:   	std	%f14, [%i1 + 0x10]
	.word	0xa7a0052b	! t0_kref+0x1ba0:   	fsqrts	%f11, %f19
	.word	0xa50377d1	! t0_kref+0x1ba4:   	taddcc	%o5, -0x82f, %l2
	.word	0x95b4496d	! t0_kref+0x1ba8:   	fpmerge	%f17, %f13, %f10
	.word	0xa8b3400d	! t0_kref+0x1bac:   	orncc	%o5, %o5, %l4
	.word	0x8d836d1e	! t0_kref+0x1bb0:   	wr	%o5, 0xd1e, %fprs
	.word	0x81580000	! t0_kref+0x1bb4:   	flushw
	.word	0xd20e001a	! t0_kref+0x1bb8:   	ldub	[%i0 + %i2], %o1
	.word	0x99b00fc0	! t0_kref+0x1bbc:   	fone	%f12
	.word	0xe4067fe4	! t0_kref+0x1bc0:   	ld	[%i1 - 0x1c], %l2
	.word	0xd64e7fe5	! t0_kref+0x1bc4:   	ldsb	[%i1 - 0x1b], %o3
	.word	0x21800004	! t0_kref+0x1bc8:   	fbn,a	_kref+0x1bd8
	.word	0xae7b775f	! t0_kref+0x1bcc:   	sdiv	%o5, -0x8a1, %l7
	.word	0xe816c018	! t0_kref+0x1bd0:   	lduh	[%i3 + %i0], %l4
	.word	0x9db40d0e	! t0_kref+0x1bd4:   	fandnot1	%f16, %f14, %f14
	.word	0xa6b32d59	! t0_kref+0x1bd8:   	orncc	%o4, 0xd59, %l3
	.word	0xee50a028	! t0_kref+0x1bdc:   	ldsh	[%g2 + 0x28], %l7
	.word	0xe806001c	! t0_kref+0x1be0:   	ld	[%i0 + %i4], %l4
	.word	0xe53e6000	! t0_kref+0x1be4:   	std	%f18, [%i1]
	.word	0xac13000c	! t0_kref+0x1be8:   	or	%o4, %o4, %l6
	.word	0x943332e5	! t0_kref+0x1bec:   	orn	%o4, -0xd1b, %o2
	.word	0xd4000018	! t0_kref+0x1bf0:   	ld	[%g0 + %i0], %o2
	.word	0x99a4094e	! t0_kref+0x1bf4:   	fmuld	%f16, %f14, %f12
	.word	0xd44e2002	! t0_kref+0x1bf8:   	ldsb	[%i0 + 2], %o2
	.word	0xa223400c	! t0_kref+0x1bfc:   	sub	%o5, %o4, %l1
	.word	0x8610200c	! t0_kref+0x1c00:   	mov	0xc, %g3
	.word	0x86a0e001	! t0_kref+0x1c04:   	subcc	%g3, 1, %g3
	.word	0x2280000b	! t0_kref+0x1c08:   	be,a	_kref+0x1c34
	.word	0xd9bf5a18	! t0_kref+0x1c0c:   	stda	%f12, [%i5 + %i0]0xd0
	.word	0xa7b48a71	! t0_kref+0x1c10:   	fpadd32s	%f18, %f17, %f19
	.word	0x96133544	! t0_kref+0x1c14:   	or	%o4, -0xabc, %o3
	.word	0xa7a018d2	! t0_kref+0x1c18:   	fdtos	%f18, %f19
	.word	0x97a0052b	! t0_kref+0x1c1c:   	fsqrts	%f11, %f11
	.word	0xac2b3fc6	! t0_kref+0x1c20:   	andn	%o4, -0x3a, %l6
	.word	0x9fb28cac	! t0_kref+0x1c24:   	fandnot2s	%f10, %f12, %f15
	.word	0xafb3416c	! t0_kref+0x1c28:   	edge32ln	%o5, %o4, %l7
	.word	0xe216200a	! t0_kref+0x1c2c:   	lduh	[%i0 + 0xa], %l1
	.word	0xd8b01019	! t0_kref+0x1c30:   	stha	%o4, [%g0 + %i1]0x80
	.word	0xe51e6000	! t0_kref+0x1c34:   	ldd	[%i1], %f18
	.word	0xe850a02a	! t0_kref+0x1c38:   	ldsh	[%g2 + 0x2a], %l4
	.word	0x99a308d0	! t0_kref+0x1c3c:   	fsubd	%f12, %f16, %f12
	.word	0xe03e4000	! t0_kref+0x1c40:   	std	%l0, [%i1]
	.word	0xeade1000	! t0_kref+0x1c44:   	ldxa	[%i0]0x80, %l5
	.word	0x37800001	! t0_kref+0x1c48:   	fbge,a	_kref+0x1c4c
	.word	0xe64e2000	! t0_kref+0x1c4c:   	ldsb	[%i0], %l3
	.word	0xa1a40d2c	! t0_kref+0x1c50:   	fsmuld	%f16, %f12, %f16
	.word	0x9fc00004	! t0_kref+0x1c54:   	call	%g0 + %g4
	.word	0xd91e6010	! t0_kref+0x1c58:   	ldd	[%i1 + 0x10], %f12
	.word	0xa5a018cc	! t0_kref+0x1c5c:   	fdtos	%f12, %f18
	.word	0x95a00550	! t0_kref+0x1c60:   	fsqrtd	%f16, %f10
	.word	0xe81e7fe0	! t0_kref+0x1c64:   	ldd	[%i1 - 0x20], %l4
	.word	0xd6df5018	! t0_kref+0x1c68:   	ldxa	[%i5 + %i0]0x80, %o3
	.word	0xe53e6018	! t0_kref+0x1c6c:   	std	%f18, [%i1 + 0x18]
	.word	0xa5a488ce	! t0_kref+0x1c70:   	fsubd	%f18, %f14, %f18
	.word	0x31800007	! t0_kref+0x1c74:   	fba,a	_kref+0x1c90
	.word	0x9fb38d60	! t0_kref+0x1c78:   	fnot1s	%f14, %f15
	.word	0xa1a3c82c	! t0_kref+0x1c7c:   	fadds	%f15, %f12, %f16
	.word	0xa5b48e0a	! t0_kref+0x1c80:   	fand	%f18, %f10, %f18
	.word	0x97b007b2	! t0_kref+0x1c84:   	fpackfix	%f18, %f11
	.word	0xabb340cc	! t0_kref+0x1c88:   	edge16l	%o5, %o4, %l5
	.word	0xa1a0102f	! t0_kref+0x1c8c:   	fstox	%f15, %f16
	.word	0xaa132061	! t0_kref+0x1c90:   	or	%o4, 0x61, %l5
	.word	0xa5a01a4c	! t0_kref+0x1c94:   	fdtoi	%f12, %f18
	.word	0x86102014	! t0_kref+0x1c98:   	mov	0x14, %g3
	.word	0x86a0e001	! t0_kref+0x1c9c:   	subcc	%g3, 1, %g3
	.word	0x2280000b	! t0_kref+0x1ca0:   	be,a	_kref+0x1ccc
	.word	0xa5b30a50	! t0_kref+0x1ca4:   	fpadd32	%f12, %f16, %f18
	.word	0xa1b48f6a	! t0_kref+0x1ca8:   	fornot1s	%f18, %f10, %f16
	.word	0xa7b28fae	! t0_kref+0x1cac:   	fors	%f10, %f14, %f19
	.word	0x9da01890	! t0_kref+0x1cb0:   	fitos	%f16, %f14
	.word	0x9da2c8ab	! t0_kref+0x1cb4:   	fsubs	%f11, %f11, %f14
	.word	0x909b3d99	! t0_kref+0x1cb8:   	xorcc	%o4, -0x267, %o0
	.word	0xd51e2000	! t0_kref+0x1cbc:   	ldd	[%i0], %f10
	.word	0x920b000d	! t0_kref+0x1cc0:   	and	%o4, %o5, %o1
	.word	0xaa1374d1	! t0_kref+0x1cc4:   	or	%o5, -0xb2f, %l5
	.word	0xafb3032c	! t0_kref+0x1cc8:   	bmask	%o4, %o4, %l7
	.word	0xe80e7ff1	! t0_kref+0x1ccc:   	ldub	[%i1 - 0xf], %l4
	.word	0x37800003	! t0_kref+0x1cd0:   	fbge,a	_kref+0x1cdc
	.word	0x9fb00fe0	! t0_kref+0x1cd4:   	fones	%f15
	.word	0x9db4898c	! t0_kref+0x1cd8:   	bshuffle	%f18, %f12, %f14
	.word	0xd4164000	! t0_kref+0x1cdc:   	lduh	[%i1], %o2
	.word	0xee4e7fe7	! t0_kref+0x1ce0:   	ldsb	[%i1 - 0x19], %l7
	.word	0x33800006	! t0_kref+0x1ce4:   	fbe,a	_kref+0x1cfc
	.word	0x9ba00032	! t0_kref+0x1ce8:   	fmovs	%f18, %f13
	.word	0x947367d2	! t0_kref+0x1cec:   	udiv	%o5, 0x7d2, %o2
	.word	0xa20338c8	! t0_kref+0x1cf0:   	add	%o4, -0x738, %l1
	.word	0x81dd0012	! t0_kref+0x1cf4:   	flush	%l4 + %l2
	.word	0xa32b000c	! t0_kref+0x1cf8:   	sll	%o4, %o4, %l1
	.word	0x99a0054c	! t0_kref+0x1cfc:   	fsqrtd	%f12, %f12
	.word	0xee4e0000	! t0_kref+0x1d00:   	ldsb	[%i0], %l7
	.word	0x99b00ccc	! t0_kref+0x1d04:   	fnot2	%f12, %f12
	.word	0xd608a03c	! t0_kref+0x1d08:   	ldub	[%g2 + 0x3c], %o3
	.word	0xdab01018	! t0_kref+0x1d0c:   	stha	%o5, [%g0 + %i0]0x80
	.word	0xf96e001d	! t0_kref+0x1d10:   	prefetch	%i0 + %i5, 28
	.word	0x81580000	! t0_kref+0x1d14:   	flushw
	.word	0xa69b000c	! t0_kref+0x1d18:   	xorcc	%o4, %o4, %l3
	.word	0xa93b201f	! t0_kref+0x1d1c:   	sra	%o4, 0x1f, %l4
	.word	0x2e800004	! t0_kref+0x1d20:   	bvs,a	_kref+0x1d30
	.word	0x940b400c	! t0_kref+0x1d24:   	and	%o5, %o4, %o2
	.word	0xa1b3890a	! t0_kref+0x1d28:   	faligndata	%f14, %f10, %f16
	.word	0xa1b286f0	! t0_kref+0x1d2c:   	fmul8ulx16	%f10, %f16, %f16
	.word	0xafb300cc	! t0_kref+0x1d30:   	edge16l	%o4, %o4, %l7
	.word	0x973b000d	! t0_kref+0x1d34:   	sra	%o4, %o5, %o3
	.word	0xa1b3872c	! t0_kref+0x1d38:   	fmuld8ulx16	%f14, %f12, %f16
	.word	0x9fc00004	! t0_kref+0x1d3c:   	call	%g0 + %g4
	.word	0xb8103fec	! t0_kref+0x1d40:   	mov	0xffffffec, %i4
	.word	0xe3ee501a	! t0_kref+0x1d44:   	prefetcha	%i1 + %i2, 17
	.word	0xe700a020	! t0_kref+0x1d48:   	ld	[%g2 + 0x20], %f19
	.word	0x90f3000c	! t0_kref+0x1d4c:   	udivcc	%o4, %o4, %o0
	.word	0xee50a01c	! t0_kref+0x1d50:   	ldsh	[%g2 + 0x1c], %l7
	.word	0x9de3bfa0	! t0_kref+0x1d54:   	save	%sp, -0x60, %sp
	.word	0xafee3a8f	! t0_kref+0x1d58:   	restore	%i0, -0x571, %l7
	.word	0xa60b400d	! t0_kref+0x1d5c:   	and	%o5, %o5, %l3
	.word	0xa49b63d1	! t0_kref+0x1d60:   	xorcc	%o5, 0x3d1, %l2
	.word	0xac9b32ef	! t0_kref+0x1d64:   	xorcc	%o4, -0xd11, %l6
	.word	0xd46e7ff6	! t0_kref+0x1d68:   	ldstub	[%i1 - 0xa], %o2
	.word	0xa7a348ad	! t0_kref+0x1d6c:   	fsubs	%f13, %f13, %f19
	.word	0xab400000	! t0_kref+0x1d70:   	mov	%y, %l5
	.word	0xa7a018ce	! t0_kref+0x1d74:   	fdtos	%f14, %f19
	.word	0x81dbc004	! t0_kref+0x1d78:   	flush	%o7 + %g4
	.word	0xa67335b6	! t0_kref+0x1d7c:   	udiv	%o4, -0xa4a, %l3
	.word	0x912b000d	! t0_kref+0x1d80:   	sll	%o4, %o5, %o0
	.word	0x9fc10000	! t0_kref+0x1d84:   	call	%g4
	.word	0x93332016	! t0_kref+0x1d88:   	srl	%o4, 0x16, %o1
	.word	0x973b6018	! t0_kref+0x1d8c:   	sra	%o5, 0x18, %o3
	.word	0xe87f0018	! t0_kref+0x1d90:   	swap	[%i4 + %i0], %l4
	.word	0x962b000c	! t0_kref+0x1d94:   	andn	%o4, %o4, %o3
	.word	0x81830000	! t0_kref+0x1d98:   	wr	%o4, %g0, %y
	.word	0x9fa01a4c	! t0_kref+0x1d9c:   	fdtoi	%f12, %f15
	.word	0x2d800005	! t0_kref+0x1da0:   	fbg,a	_kref+0x1db4
	.word	0x95b30dce	! t0_kref+0x1da4:   	fnand	%f12, %f14, %f10
	.word	0x9fc00004	! t0_kref+0x1da8:   	call	%g0 + %g4
	.word	0x95b48d92	! t0_kref+0x1dac:   	fxor	%f18, %f18, %f10
	.word	0xa3a0188d	! t0_kref+0x1db0:   	fitos	%f13, %f17
	.word	0xe648a021	! t0_kref+0x1db4:   	ldsb	[%g2 + 0x21], %l3
	.word	0xda6e8018	! t0_kref+0x1db8:   	ldstub	[%i2 + %i0], %o5
	.word	0x929b000d	! t0_kref+0x1dbc:   	xorcc	%o4, %o5, %o1
	.word	0x9263400d	! t0_kref+0x1dc0:   	subc	%o5, %o5, %o1
	.word	0xd048a031	! t0_kref+0x1dc4:   	ldsb	[%g2 + 0x31], %o0
	.word	0xa1a000ae	! t0_kref+0x1dc8:   	fnegs	%f14, %f16
	.word	0x81ac4aaf	! t0_kref+0x1dcc:   	fcmpes	%fcc0, %f17, %f15
	.word	0xae8b400c	! t0_kref+0x1dd0:   	andcc	%o5, %o4, %l7
	.word	0xe81e6000	! t0_kref+0x1dd4:   	ldd	[%i1], %l4
	.word	0xa5a4c92c	! t0_kref+0x1dd8:   	fmuls	%f19, %f12, %f18
	.word	0xdd1e0000	! t0_kref+0x1ddc:   	ldd	[%i0], %f14
	.word	0xe84e600d	! t0_kref+0x1de0:   	ldsb	[%i1 + 0xd], %l4
	.word	0xacb3000c	! t0_kref+0x1de4:   	orncc	%o4, %o4, %l6
	.word	0xabb3016d	! t0_kref+0x1de8:   	edge32ln	%o4, %o5, %l5
	.word	0xd40e2010	! t0_kref+0x1dec:   	ldub	[%i0 + 0x10], %o2
	.word	0x9ba01891	! t0_kref+0x1df0:   	fitos	%f17, %f13
	.word	0x3d480008	! t0_kref+0x1df4:   	fbule,a,pt	%fcc0, _kref+0x1e14
	.word	0xe500a028	! t0_kref+0x1df8:   	ld	[%g2 + 0x28], %f18
	.word	0xe41e6008	! t0_kref+0x1dfc:   	ldd	[%i1 + 8], %l2
	.word	0x24800002	! t0_kref+0x1e00:   	ble,a	_kref+0x1e08
	.word	0x9ba0052a	! t0_kref+0x1e04:   	fsqrts	%f10, %f13
	.word	0x9da40952	! t0_kref+0x1e08:   	fmuld	%f16, %f18, %f14
	.word	0xc06e0000	! t0_kref+0x1e0c:   	ldstub	[%i0], %g0
	.word	0x3d480005	! t0_kref+0x1e10:   	fbule,a,pt	%fcc0, _kref+0x1e24
	.word	0x9db4caae	! t0_kref+0x1e14:   	fpsub16s	%f19, %f14, %f14
	.word	0xae93400d	! t0_kref+0x1e18:   	orcc	%o5, %o5, %l7
	.word	0x90337cbf	! t0_kref+0x1e1c:   	orn	%o5, -0x341, %o0
	.word	0xd448a034	! t0_kref+0x1e20:   	ldsb	[%g2 + 0x34], %o2
	.word	0x2d480001	! t0_kref+0x1e24:   	fbg,a,pt	%fcc0, _kref+0x1e28
	.word	0x99b4066f	! t0_kref+0x1e28:   	fmul8x16au	%f16, %f15, %f12
	.word	0x86102002	! t0_kref+0x1e2c:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x1e30:   	bne,a	_kref+0x1e30
	.word	0x86a0e001	! t0_kref+0x1e34:   	subcc	%g3, 1, %g3
	.word	0xd2067ff8	! t0_kref+0x1e38:   	ld	[%i1 - 8], %o1
	.word	0x99b48e80	! t0_kref+0x1e3c:   	fsrc1	%f18, %f12
	.word	0x99a01090	! t0_kref+0x1e40:   	fxtos	%f16, %f12
	.word	0xa1a0002a	! t0_kref+0x1e44:   	fmovs	%f10, %f16
	.word	0x90a328e3	! t0_kref+0x1e48:   	subcc	%o4, 0x8e3, %o0
	.word	0xd9a01019	! t0_kref+0x1e4c:   	sta	%f12, [%g0 + %i1]0x80
	.word	0xd830a032	! t0_kref+0x1e50:   	sth	%o4, [%g2 + 0x32]
	.word	0xa5b30a12	! t0_kref+0x1e54:   	fpadd16	%f12, %f18, %f18
	.word	0xa5a28950	! t0_kref+0x1e58:   	fmuld	%f10, %f16, %f18
	.word	0x24800003	! t0_kref+0x1e5c:   	ble,a	_kref+0x1e68
	.word	0x8143c000	! t0_kref+0x1e60:   	stbar
	.word	0xe49f5018	! t0_kref+0x1e64:   	ldda	[%i5 + %i0]0x80, %l2
	.word	0xe6166014	! t0_kref+0x1e68:   	lduh	[%i1 + 0x14], %l3
	.word	0x81ab0a2e	! t0_kref+0x1e6c:   	fcmps	%fcc0, %f12, %f14
	.word	0xa52b400d	! t0_kref+0x1e70:   	sll	%o5, %o5, %l2
	.word	0xec7e6010	! t0_kref+0x1e74:   	swap	[%i1 + 0x10], %l6
	.word	0xe47e2010	! t0_kref+0x1e78:   	swap	[%i0 + 0x10], %l2
	.word	0x99b28ed2	! t0_kref+0x1e7c:   	fornot2	%f10, %f18, %f12
	.word	0x9de3bfa0	! t0_kref+0x1e80:   	save	%sp, -0x60, %sp
	.word	0xb70ec01c	! t0_kref+0x1e84:   	tsubcc	%i3, %i4, %i3
	.word	0xa9ee3c66	! t0_kref+0x1e88:   	restore	%i0, -0x39a, %l4
	.word	0x3f800002	! t0_kref+0x1e8c:   	fbo,a	_kref+0x1e94
	.word	0x81d93dd1	! t0_kref+0x1e90:   	flush	%g4 - 0x22f
	.word	0xa2fb000d	! t0_kref+0x1e94:   	sdivcc	%o4, %o5, %l1
	.word	0xa2136184	! t0_kref+0x1e98:   	or	%o5, 0x184, %l1
	.word	0xd690105b	! t0_kref+0x1e9c:   	lduha	[%g0 + %i3]0x82, %o3
	.word	0x9fc10000	! t0_kref+0x1ea0:   	call	%g4
	.word	0x91b3030d	! t0_kref+0x1ea4:   	alignaddr	%o4, %o5, %o0
	.word	0x81dc000e	! t0_kref+0x1ea8:   	flush	%l0 + %sp
	.word	0x932b400c	! t0_kref+0x1eac:   	sll	%o5, %o4, %o1
	.word	0x39480008	! t0_kref+0x1eb0:   	fbuge,a,pt	%fcc0, _kref+0x1ed0
	.word	0xe88e101a	! t0_kref+0x1eb4:   	lduba	[%i0 + %i2]0x80, %l4
	.word	0xa68b400d	! t0_kref+0x1eb8:   	andcc	%o5, %o5, %l3
	.word	0xe03e7ff0	! t0_kref+0x1ebc:   	std	%l0, [%i1 - 0x10]
	.word	0x95a4884c	! t0_kref+0x1ec0:   	faddd	%f18, %f12, %f10
	.word	0xd6ff1018	! t0_kref+0x1ec4:   	swapa	[%i4 + %i0]0x80, %o3
	.word	0xd448a032	! t0_kref+0x1ec8:   	ldsb	[%g2 + 0x32], %o2
	.word	0xa1a01890	! t0_kref+0x1ecc:   	fitos	%f16, %f16
	.word	0xe53e3fe0	! t0_kref+0x1ed0:   	std	%f18, [%i0 - 0x20]
	.word	0xa3b007b0	! t0_kref+0x1ed4:   	fpackfix	%f16, %f17
	.word	0x94b3400c	! t0_kref+0x1ed8:   	orncc	%o5, %o4, %o2
	.word	0x37800002	! t0_kref+0x1edc:   	fbge,a	_kref+0x1ee4
	.word	0xe56e001a	! t0_kref+0x1ee0:   	prefetch	%i0 + %i2, 18
	.word	0xa1a0188e	! t0_kref+0x1ee4:   	fitos	%f14, %f16
	.word	0xafb3032c	! t0_kref+0x1ee8:   	bmask	%o4, %o4, %l7
	.word	0x9da4c82d	! t0_kref+0x1eec:   	fadds	%f19, %f13, %f14
	.word	0xae0b400d	! t0_kref+0x1ef0:   	and	%o5, %o5, %l7
	.word	0xab2b000d	! t0_kref+0x1ef4:   	sll	%o4, %o5, %l5
	.word	0xe1be188d	! t0_kref+0x1ef8:   	stda	%f16, [%i0 + %o5]0xc4
	.word	0xa7a0188c	! t0_kref+0x1efc:   	fitos	%f12, %f19
	.word	0xc76e7ff8	! t0_kref+0x1f00:   	prefetch	%i1 - 8, 3
	.word	0xa873000c	! t0_kref+0x1f04:   	udiv	%o4, %o4, %l4
	.word	0xd4e81019	! t0_kref+0x1f08:   	ldstuba	[%g0 + %i1]0x80, %o2
	.word	0x25800004	! t0_kref+0x1f0c:   	fblg,a	_kref+0x1f1c
	.word	0xa5a0054e	! t0_kref+0x1f10:   	fsqrtd	%f14, %f18
	.word	0xa1a8c04e	! t0_kref+0x1f14:   	fmovdul	%fcc0, %f14, %f16
	.word	0x37800006	! t0_kref+0x1f18:   	fbge,a	_kref+0x1f30
	.word	0xd830a030	! t0_kref+0x1f1c:   	sth	%o4, [%g2 + 0x30]
	.word	0x94637d42	! t0_kref+0x1f20:   	subc	%o5, -0x2be, %o2
	.word	0x95a0054a	! t0_kref+0x1f24:   	fsqrtd	%f10, %f10
	.word	0xd900a03c	! t0_kref+0x1f28:   	ld	[%g2 + 0x3c], %f12
	.word	0xe1a61000	! t0_kref+0x1f2c:   	sta	%f16, [%i0]0x80
	.word	0x23480005	! t0_kref+0x1f30:   	fbne,a,pt	%fcc0, _kref+0x1f44
	.word	0xe11fbcc0	! t0_kref+0x1f34:   	ldd	[%fp - 0x340], %f16
	.word	0x90337f84	! t0_kref+0x1f38:   	orn	%o5, -0x7c, %o0
	.word	0xda7e3ff0	! t0_kref+0x1f3c:   	swap	[%i0 - 0x10], %o5
	.word	0xa1b28f6c	! t0_kref+0x1f40:   	fornot1s	%f10, %f12, %f16
	.word	0x94fb400c	! t0_kref+0x1f44:   	sdivcc	%o5, %o4, %o2
	.word	0x92736d0a	! t0_kref+0x1f48:   	udiv	%o5, 0xd0a, %o1
	.word	0xabb340ad	! t0_kref+0x1f4c:   	edge16n	%o5, %o5, %l5
	.word	0xe696d040	! t0_kref+0x1f50:   	lduha	[%i3]0x82, %l3
	.word	0xd4d6101b	! t0_kref+0x1f54:   	ldsha	[%i0 + %i3]0x80, %o2
	.word	0xa49b000c	! t0_kref+0x1f58:   	xorcc	%o4, %o4, %l2
	.word	0xc568a040	! t0_kref+0x1f5c:   	prefetch	%g2 + 0x40, 2
	.word	0x9fb44d2c	! t0_kref+0x1f60:   	fandnot1s	%f17, %f12, %f15
	.word	0xa73b201d	! t0_kref+0x1f64:   	sra	%o4, 0x1d, %l3
	.word	0x9fc10000	! t0_kref+0x1f68:   	call	%g4
	.word	0x81580000	! t0_kref+0x1f6c:   	flushw
	.word	0x90636e33	! t0_kref+0x1f70:   	subc	%o5, 0xe33, %o0
	.word	0x2d480006	! t0_kref+0x1f74:   	fbg,a,pt	%fcc0, _kref+0x1f8c
	.word	0xa69b6b73	! t0_kref+0x1f78:   	xorcc	%o5, 0xb73, %l3
	.word	0x92732453	! t0_kref+0x1f7c:   	udiv	%o4, 0x453, %o1
	.word	0x31480004	! t0_kref+0x1f80:   	fba,a,pt	%fcc0, _kref+0x1f90
	.word	0x95b0076a	! t0_kref+0x1f84:   	fpack16	%f10, %f10
	.word	0xd500a018	! t0_kref+0x1f88:   	ld	[%g2 + 0x18], %f10
	.word	0xe800a020	! t0_kref+0x1f8c:   	ld	[%g2 + 0x20], %l4
	.word	0xeb68a04f	! t0_kref+0x1f90:   	prefetch	%g2 + 0x4f, 21
	.word	0xe848a00c	! t0_kref+0x1f94:   	ldsb	[%g2 + 0xc], %l4
	.word	0xee6e8019	! t0_kref+0x1f98:   	ldstub	[%i2 + %i1], %l7
	.word	0x9fc00004	! t0_kref+0x1f9c:   	call	%g0 + %g4
	.word	0x99a00030	! t0_kref+0x1fa0:   	fmovs	%f16, %f12
	.word	0x9fc10000	! t0_kref+0x1fa4:   	call	%g4
	.word	0xe03f4019	! t0_kref+0x1fa8:   	std	%l0, [%i5 + %i1]
	.word	0x95b38d8c	! t0_kref+0x1fac:   	fxor	%f14, %f12, %f10
	.word	0xa2b3000c	! t0_kref+0x1fb0:   	orncc	%o4, %o4, %l1
	.word	0x969b000d	! t0_kref+0x1fb4:   	xorcc	%o4, %o5, %o3
	.word	0xe4480019	! t0_kref+0x1fb8:   	ldsb	[%g0 + %i1], %l2
	.word	0xd8263fe0	! t0_kref+0x1fbc:   	st	%o4, [%i0 - 0x20]
	.word	0x961332c3	! t0_kref+0x1fc0:   	or	%o4, -0xd3d, %o3
	.word	0x37480004	! t0_kref+0x1fc4:   	fbge,a,pt	%fcc0, _kref+0x1fd4
	.word	0xe400a018	! t0_kref+0x1fc8:   	ld	[%g2 + 0x18], %l2
	.word	0xe11fbcb8	! t0_kref+0x1fcc:   	ldd	[%fp - 0x348], %f16
	.word	0x29800006	! t0_kref+0x1fd0:   	fbl,a	_kref+0x1fe8
	.word	0xa3a0108e	! t0_kref+0x1fd4:   	fxtos	%f14, %f17
	.word	0xef68a047	! t0_kref+0x1fd8:   	prefetch	%g2 + 0x47, 23
	.word	0x27480008	! t0_kref+0x1fdc:   	fbul,a,pt	%fcc0, _kref+0x1ffc
	.word	0xac133e42	! t0_kref+0x1fe0:   	or	%o4, -0x1be, %l6
	.word	0x9fc10000	! t0_kref+0x1fe4:   	call	%g4
	.word	0x8143c000	! t0_kref+0x1fe8:   	stbar
	.word	0x95b3896f	! t0_kref+0x1fec:   	fpmerge	%f14, %f15, %f10
	.word	0x9ba4882d	! t0_kref+0x1ff0:   	fadds	%f18, %f13, %f13
	.word	0x8143c000	! t0_kref+0x1ff4:   	stbar
	.word	0x27800001	! t0_kref+0x1ff8:   	fbul,a	_kref+0x1ffc
	.word	0xd4881019	! t0_kref+0x1ffc:   	lduba	[%g0 + %i1]0x80, %o2
	.word	0x94fb2b4f	! t0_kref+0x2000:   	sdivcc	%o4, 0xb4f, %o2
	.word	0xe4580019	! t0_kref+0x2004:   	ldx	[%g0 + %i1], %l2
	.word	0xdd1e7fe0	! t0_kref+0x2008:   	ldd	[%i1 - 0x20], %f14
	.word	0xec100018	! t0_kref+0x200c:   	lduh	[%g0 + %i0], %l6
	.word	0xa42b400d	! t0_kref+0x2010:   	andn	%o5, %o5, %l2
	.word	0xed68a084	! t0_kref+0x2014:   	prefetch	%g2 + 0x84, 22
	.word	0xd408a00a	! t0_kref+0x2018:   	ldub	[%g2 + 0xa], %o2
	.word	0xa6637be1	! t0_kref+0x201c:   	subc	%o5, -0x41f, %l3
	.word	0x9de3bfa0	! t0_kref+0x2020:   	save	%sp, -0x60, %sp
	.word	0xba173c49	! t0_kref+0x2024:   	or	%i4, -0x3b7, %i5
	.word	0x91eebd26	! t0_kref+0x2028:   	restore	%i2, -0x2da, %o0
	.word	0x96b3000d	! t0_kref+0x202c:   	orncc	%o4, %o5, %o3
	.word	0xa1ab804a	! t0_kref+0x2030:   	fmovdule	%fcc0, %f10, %f16
	.word	0x2f018c4f	! t0_kref+0x2034:   	sethi	%hi(0x6313c00), %l7
	.word	0x9db38ed0	! t0_kref+0x2038:   	fornot2	%f14, %f16, %f14
	.word	0x99a0188b	! t0_kref+0x203c:   	fitos	%f11, %f12
	.word	0x99b486ea	! t0_kref+0x2040:   	fmul8ulx16	%f18, %f10, %f12
	.word	0xa5b3466d	! t0_kref+0x2044:   	fmul8x16au	%f13, %f13, %f18
	.word	0xa7837e40	! t0_kref+0x2048:   	wr	%o5, 0xfffffe40, %gsr
	.word	0xec4e401a	! t0_kref+0x204c:   	ldsb	[%i1 + %i2], %l6
	.word	0xd6100019	! t0_kref+0x2050:   	lduh	[%g0 + %i1], %o3
	.word	0xaefb7a0e	! t0_kref+0x2054:   	sdivcc	%o5, -0x5f2, %l7
	.word	0xec1e7ff8	! t0_kref+0x2058:   	ldd	[%i1 - 8], %l6
	.word	0x25800001	! t0_kref+0x205c:   	fblg,a	_kref+0x2060
	.word	0xa78336c9	! t0_kref+0x2060:   	wr	%o4, 0xfffff6c9, %gsr
	.word	0xda2e7fef	! t0_kref+0x2064:   	stb	%o5, [%i1 - 0x11]
	.word	0xe606001c	! t0_kref+0x2068:   	ld	[%i0 + %i4], %l3
	.word	0x31800008	! t0_kref+0x206c:   	fba,a	_kref+0x208c
	.word	0x9ba01a2f	! t0_kref+0x2070:   	fstoi	%f15, %f13
	.word	0x95a01a4e	! t0_kref+0x2074:   	fdtoi	%f14, %f10
	.word	0x953b000d	! t0_kref+0x2078:   	sra	%o4, %o5, %o2
	.word	0xe11fbca8	! t0_kref+0x207c:   	ldd	[%fp - 0x358], %f16
	.word	0xd60e3ffd	! t0_kref+0x2080:   	ldub	[%i0 - 3], %o3
	.word	0x97a0052f	! t0_kref+0x2084:   	fsqrts	%f15, %f11
	.word	0xa1b38d0e	! t0_kref+0x2088:   	fandnot1	%f14, %f14, %f16
	.word	0x31800004	! t0_kref+0x208c:   	fba,a	_kref+0x209c
	.word	0xa7a01a52	! t0_kref+0x2090:   	fdtoi	%f18, %f19
	.word	0x81acca2c	! t0_kref+0x2094:   	fcmps	%fcc0, %f19, %f12
	.word	0x97400000	! t0_kref+0x2098:   	mov	%y, %o3
	.word	0x9213000d	! t0_kref+0x209c:   	or	%o4, %o5, %o1
	.word	0xa51b400d	! t0_kref+0x20a0:   	tsubcctv	%o5, %o5, %l2
	.word	0x97a018ca	! t0_kref+0x20a4:   	fdtos	%f10, %f11
	.word	0xe11f4019	! t0_kref+0x20a8:   	ldd	[%i5 + %i1], %f16
	.word	0x9da01a52	! t0_kref+0x20ac:   	fdtoi	%f18, %f14
	.word	0xa90b000c	! t0_kref+0x20b0:   	tsubcc	%o4, %o4, %l4
	.word	0x2b800001	! t0_kref+0x20b4:   	fbug,a	_kref+0x20b8
	.word	0x9fa4092e	! t0_kref+0x20b8:   	fmuls	%f16, %f14, %f15
	.word	0xa6a32314	! t0_kref+0x20bc:   	subcc	%o4, 0x314, %l3
	.word	0xb6102018	! t0_kref+0x20c0:   	mov	0x18, %i3
	.word	0xd040a010	! t0_kref+0x20c4:   	ldsw	[%g2 + 0x10], %o0
	.word	0xab036bc0	! t0_kref+0x20c8:   	taddcc	%o5, 0xbc0, %l5
	.word	0x9673000d	! t0_kref+0x20cc:   	udiv	%o4, %o5, %o3
	.word	0x97a00532	! t0_kref+0x20d0:   	fsqrts	%f18, %f11
	.word	0xdd1fbcc8	! t0_kref+0x20d4:   	ldd	[%fp - 0x338], %f14
	.word	0xa4737333	! t0_kref+0x20d8:   	udiv	%o5, -0xccd, %l2
	.word	0xa7b2cd60	! t0_kref+0x20dc:   	fnot1s	%f11, %f19
	.word	0xdd1e401d	! t0_kref+0x20e0:   	ldd	[%i1 + %i5], %f14
	.word	0xd050a034	! t0_kref+0x20e4:   	ldsh	[%g2 + 0x34], %o0
	.word	0x26480007	! t0_kref+0x20e8:   	bl,a,pt	%icc, _kref+0x2104
	.word	0xe2480019	! t0_kref+0x20ec:   	ldsb	[%g0 + %i1], %l1
	.word	0xaca370e5	! t0_kref+0x20f0:   	subcc	%o5, -0xf1b, %l6
	.word	0x9f414000	! t0_kref+0x20f4:   	mov	%pc, %o7
	.word	0x29480008	! t0_kref+0x20f8:   	fbl,a,pt	%fcc0, _kref+0x2118
	.word	0x9db28a4c	! t0_kref+0x20fc:   	fpadd32	%f10, %f12, %f14
	.word	0x81ab0ab2	! t0_kref+0x2100:   	fcmpes	%fcc0, %f12, %f18
	.word	0xa6b32496	! t0_kref+0x2104:   	orncc	%o4, 0x496, %l3
	.word	0xa93b6010	! t0_kref+0x2108:   	sra	%o5, 0x10, %l4
	.word	0xa1b40d40	! t0_kref+0x210c:   	fnot1	%f16, %f16
	.word	0xc807bfec	! t0_kref+0x2110:   	ld	[%fp - 0x14], %g4
	.word	0x9453000c	! t0_kref+0x2114:   	umul	%o4, %o4, %o2
	.word	0xc768a040	! t0_kref+0x2118:   	prefetch	%g2 + 0x40, 3
	.word	0x3f480008	! t0_kref+0x211c:   	fbo,a,pt	%fcc0, _kref+0x213c
	.word	0x9bb2ce2b	! t0_kref+0x2120:   	fands	%f11, %f11, %f13
	.word	0xa7a0052a	! t0_kref+0x2124:   	fsqrts	%f10, %f19
	.word	0x34800005	! t0_kref+0x2128:   	bg,a	_kref+0x213c
	.word	0xd416401b	! t0_kref+0x212c:   	lduh	[%i1 + %i3], %o2
	.word	0x97a018ca	! t0_kref+0x2130:   	fdtos	%f10, %f11
	.word	0x95a0054c	! t0_kref+0x2134:   	fsqrtd	%f12, %f10
	.word	0x9fc10000	! t0_kref+0x2138:   	call	%g4
	.word	0xa1b009ab	! t0_kref+0x213c:   	fexpand	%f11, %f16
	.word	0x95a01a2a	! t0_kref+0x2140:   	fstoi	%f10, %f10
	.word	0xa5a0054a	! t0_kref+0x2144:   	fsqrtd	%f10, %f18
	.word	0x8143c000	! t0_kref+0x2148:   	stbar
	.word	0xa2fb31be	! t0_kref+0x214c:   	sdivcc	%o4, -0xe42, %l1
	.word	0xa933400d	! t0_kref+0x2150:   	srl	%o5, %o5, %l4
	.word	0xa283400d	! t0_kref+0x2154:   	addcc	%o5, %o5, %l1
	.word	0xe800a038	! t0_kref+0x2158:   	ld	[%g2 + 0x38], %l4
	.word	0x3c800002	! t0_kref+0x215c:   	bpos,a	_kref+0x2164
	.word	0x99a00552	! t0_kref+0x2160:   	fsqrtd	%f18, %f12
	.word	0x9da38d2e	! t0_kref+0x2164:   	fsmuld	%f14, %f14, %f14
	.word	0x92736c30	! t0_kref+0x2168:   	udiv	%o5, 0xc30, %o1
	.word	0x92a366b5	! t0_kref+0x216c:   	subcc	%o5, 0x6b5, %o1
	.word	0xd53e001d	! t0_kref+0x2170:   	std	%f10, [%i0 + %i5]
	.word	0x9323000c	! t0_kref+0x2174:   	mulscc	%o4, %o4, %o1
	.word	0x81ac4aab	! t0_kref+0x2178:   	fcmpes	%fcc0, %f17, %f11
	.word	0xe03f4019	! t0_kref+0x217c:   	std	%l0, [%i5 + %i1]
	.word	0x93408000	! t0_kref+0x2180:   	mov	%ccr, %o1
	.word	0x9063400d	! t0_kref+0x2184:   	subc	%o5, %o5, %o0
	.word	0xe24e4000	! t0_kref+0x2188:   	ldsb	[%i1], %l1
	.word	0xa863400c	! t0_kref+0x218c:   	subc	%o5, %o4, %l4
	.word	0x92b36217	! t0_kref+0x2190:   	orncc	%o5, 0x217, %o1
	.word	0x92b3000d	! t0_kref+0x2194:   	orncc	%o4, %o5, %o1
	.word	0xd010a00c	! t0_kref+0x2198:   	lduh	[%g2 + 0xc], %o0
	.word	0x9fa0052b	! t0_kref+0x219c:   	fsqrts	%f11, %f15
	.word	0x9ba0052f	! t0_kref+0x21a0:   	fsqrts	%f15, %f13
	.word	0x9fa00533	! t0_kref+0x21a4:   	fsqrts	%f19, %f15
	.word	0x9ba00532	! t0_kref+0x21a8:   	fsqrts	%f18, %f13
	.word	0xa7a0052e	! t0_kref+0x21ac:   	fsqrts	%f14, %f19
	.word	0x9ba01a4c	! t0_kref+0x21b0:   	fdtoi	%f12, %f13
	.word	0x95a01a50	! t0_kref+0x21b4:   	fdtoi	%f16, %f10
	.word	0x81ab4aab	! t0_kref+0x21b8:   	fcmpes	%fcc0, %f13, %f11
	.word	0x9db48d12	! t0_kref+0x21bc:   	fandnot1	%f18, %f18, %f14
	.word	0x94c3000c	! t0_kref+0x21c0:   	addccc	%o4, %o4, %o2
	.word	0x3e800001	! t0_kref+0x21c4:   	bvc,a	_kref+0x21c8
	.word	0xc3ee500d	! t0_kref+0x21c8:   	prefetcha	%i1 + %o5, 1
	.word	0x97b30200	! t0_kref+0x21cc:   	array8	%o4, %g0, %o3
	.word	0xd010a026	! t0_kref+0x21d0:   	lduh	[%g2 + 0x26], %o0
	.word	0xebe6100d	! t0_kref+0x21d4:   	casa	[%i0]0x80, %o5, %l5
	.word	0x91400000	! t0_kref+0x21d8:   	mov	%y, %o0
	.word	0x95b40a50	! t0_kref+0x21dc:   	fpadd32	%f16, %f16, %f10
	.word	0xa6732331	! t0_kref+0x21e0:   	udiv	%o4, 0x331, %l3
	.word	0x95a01a50	! t0_kref+0x21e4:   	fdtoi	%f16, %f10
	.word	0xd828a014	! t0_kref+0x21e8:   	stb	%o4, [%g2 + 0x14]
	.word	0x99ab8032	! t0_kref+0x21ec:   	fmovsule	%fcc0, %f18, %f12
	.word	0x8143c000	! t0_kref+0x21f0:   	stbar
	.word	0xe100a020	! t0_kref+0x21f4:   	ld	[%g2 + 0x20], %f16
	.word	0x23800001	! t0_kref+0x21f8:   	fbne,a	_kref+0x21fc
	.word	0xa1b009ae	! t0_kref+0x21fc:   	fexpand	%f14, %f16
	.word	0x3c800008	! t0_kref+0x2200:   	bpos,a	_kref+0x2220
	.word	0x953b6019	! t0_kref+0x2204:   	sra	%o5, 0x19, %o2
	.word	0xd400a020	! t0_kref+0x2208:   	ld	[%g2 + 0x20], %o2
	.word	0x95b4ca32	! t0_kref+0x220c:   	fpadd16s	%f19, %f18, %f10
	.word	0xe27e600c	! t0_kref+0x2210:   	swap	[%i1 + 0xc], %l1
	.word	0xa33b400c	! t0_kref+0x2214:   	sra	%o5, %o4, %l1
	.word	0xda267fe4	! t0_kref+0x2218:   	st	%o5, [%i1 - 0x1c]
	.word	0xa2632c18	! t0_kref+0x221c:   	subc	%o4, 0xc18, %l1
	.word	0x9bb38a6b	! t0_kref+0x2220:   	fpadd32s	%f14, %f11, %f13
	.word	0xa5b48d40	! t0_kref+0x2224:   	fnot1	%f18, %f18
	.word	0x9da0054e	! t0_kref+0x2228:   	fsqrtd	%f14, %f14
	.word	0xd51e6010	! t0_kref+0x222c:   	ldd	[%i1 + 0x10], %f10
	.word	0x81ac0ab1	! t0_kref+0x2230:   	fcmpes	%fcc0, %f16, %f17
	.word	0xe03e7fe8	! t0_kref+0x2234:   	std	%l0, [%i1 - 0x18]
	.word	0xa5b30280	! t0_kref+0x2238:   	array32	%o4, %g0, %l2
	.word	0x9de3bfa0	! t0_kref+0x223c:   	save	%sp, -0x60, %sp
	.word	0xb05f0019	! t0_kref+0x2240:   	smul	%i4, %i1, %i0
	.word	0xafee001c	! t0_kref+0x2244:   	restore	%i0, %i4, %l7
	.word	0xaf2b400d	! t0_kref+0x2248:   	sll	%o5, %o5, %l7
	.word	0xa5b38d40	! t0_kref+0x224c:   	fnot1	%f14, %f18
	.word	0x9da308d0	! t0_kref+0x2250:   	fsubd	%f12, %f16, %f14
	.word	0x9273400d	! t0_kref+0x2254:   	udiv	%o5, %o5, %o1
	.word	0x99b3066a	! t0_kref+0x2258:   	fmul8x16au	%f12, %f10, %f12
	.word	0xe03e3ff8	! t0_kref+0x225c:   	std	%l0, [%i0 - 8]
	.word	0xa5a01a52	! t0_kref+0x2260:   	fdtoi	%f18, %f18
	.word	0xa5a48852	! t0_kref+0x2264:   	faddd	%f18, %f18, %f18
	.word	0x2f800002	! t0_kref+0x2268:   	fbu,a	_kref+0x2270
	.word	0x9fa018ca	! t0_kref+0x226c:   	fdtos	%f10, %f15
	.word	0x81aa8ab0	! t0_kref+0x2270:   	fcmpes	%fcc0, %f10, %f16
	.word	0xa5b286d0	! t0_kref+0x2274:   	fmul8sux16	%f10, %f16, %f18
	.word	0xa5a00552	! t0_kref+0x2278:   	fsqrtd	%f18, %f18
	.word	0xd048a02e	! t0_kref+0x227c:   	ldsb	[%g2 + 0x2e], %o0
	.word	0x9073000d	! t0_kref+0x2280:   	udiv	%o4, %o5, %o0
	.word	0xa683400d	! t0_kref+0x2284:   	addcc	%o5, %o5, %l3
	.word	0x9da0052f	! t0_kref+0x2288:   	fsqrts	%f15, %f14
	.word	0x90b36e23	! t0_kref+0x228c:   	orncc	%o5, 0xe23, %o0
	.word	0x9fb30fb1	! t0_kref+0x2290:   	fors	%f12, %f17, %f15
	.word	0x94636325	! t0_kref+0x2294:   	subc	%o5, 0x325, %o2
	.word	0xc56e400c	! t0_kref+0x2298:   	prefetch	%i1 + %o4, 2
	.word	0x27480003	! t0_kref+0x229c:   	fbul,a,pt	%fcc0, _kref+0x22a8
	.word	0xe03e2000	! t0_kref+0x22a0:   	std	%l0, [%i0]
	.word	0x9db38ed2	! t0_kref+0x22a4:   	fornot2	%f14, %f18, %f14
	.word	0x95a308ca	! t0_kref+0x22a8:   	fsubd	%f12, %f10, %f10
	.word	0xa87b609f	! t0_kref+0x22ac:   	sdiv	%o5, 0x9f, %l4
	.word	0xd9066000	! t0_kref+0x22b0:   	ld	[%i1], %f12
	.word	0x81dc001e	! t0_kref+0x22b4:   	flush	%l0 + %fp
	.word	0xa7837b85	! t0_kref+0x22b8:   	wr	%o5, 0xfffffb85, %gsr
	.word	0x9da2c930	! t0_kref+0x22bc:   	fmuls	%f11, %f16, %f14
	.word	0xe07e2008	! t0_kref+0x22c0:   	swap	[%i0 + 8], %l0
	.word	0x9673400d	! t0_kref+0x22c4:   	udiv	%o5, %o5, %o3
	.word	0xaf400000	! t0_kref+0x22c8:   	mov	%y, %l7
	.word	0xa32b600a	! t0_kref+0x22cc:   	sll	%o5, 0xa, %l1
	.word	0x21480005	! t0_kref+0x22d0:   	fbn,a,pt	%fcc0, _kref+0x22e4
	.word	0x9bb30e2b	! t0_kref+0x22d4:   	fands	%f12, %f11, %f13
	.word	0xd0167fea	! t0_kref+0x22d8:   	lduh	[%i1 - 0x16], %o0
	.word	0xe01e4000	! t0_kref+0x22dc:   	ldd	[%i1], %l0
	.word	0xa1a0002e	! t0_kref+0x22e0:   	fmovs	%f14, %f16
	.word	0xae13400c	! t0_kref+0x22e4:   	or	%o5, %o4, %l7
	.word	0xaf2b2007	! t0_kref+0x22e8:   	sll	%o4, 0x7, %l7
	.word	0xd51e2010	! t0_kref+0x22ec:   	ldd	[%i0 + 0x10], %f10
	.word	0xebf6500c	! t0_kref+0x22f0:   	casxa	[%i1]0x80, %o4, %l5
	.word	0x27480008	! t0_kref+0x22f4:   	fbul,a,pt	%fcc0, _kref+0x2314
	.word	0xa1a4084e	! t0_kref+0x22f8:   	faddd	%f16, %f14, %f16
	.word	0x2c800003	! t0_kref+0x22fc:   	bneg,a	_kref+0x2308
	.word	0xae0b3554	! t0_kref+0x2300:   	and	%o4, -0xaac, %l7
	.word	0xd93e3ff8	! t0_kref+0x2304:   	std	%f12, [%i0 - 8]
	.word	0xec7e7ff4	! t0_kref+0x2308:   	swap	[%i1 - 0xc], %l6
	.word	0x9ba018ca	! t0_kref+0x230c:   	fdtos	%f10, %f13
	.word	0x81830000	! t0_kref+0x2310:   	wr	%o4, %g0, %y
	.word	0x2d480001	! t0_kref+0x2314:   	fbg,a,pt	%fcc0, _kref+0x2318
	.word	0xab3b6006	! t0_kref+0x2318:   	sra	%o5, 0x6, %l5
	.word	0x39800003	! t0_kref+0x231c:   	fbuge,a	_kref+0x2328
	.word	0xe500a02c	! t0_kref+0x2320:   	ld	[%g2 + 0x2c], %f18
	.word	0xa7400000	! t0_kref+0x2324:   	mov	%y, %l3
	.word	0xa9400000	! t0_kref+0x2328:   	mov	%y, %l4
	.word	0xa2f32d92	! t0_kref+0x232c:   	udivcc	%o4, 0xd92, %l1
	.word	0x81aa8a2f	! t0_kref+0x2330:   	fcmps	%fcc0, %f10, %f15
	.word	0x81dfc001	! t0_kref+0x2334:   	flush	%i7 + %g1
	.word	0x94db3900	! t0_kref+0x2338:   	smulcc	%o4, -0x700, %o2
	.word	0xec1e2008	! t0_kref+0x233c:   	ldd	[%i0 + 8], %l6
	.word	0x9ba01a4a	! t0_kref+0x2340:   	fdtoi	%f10, %f13
	.word	0xe11e6000	! t0_kref+0x2344:   	ldd	[%i1], %f16
	.word	0x972b200d	! t0_kref+0x2348:   	sll	%o4, 0xd, %o3
	.word	0x81ac8ad2	! t0_kref+0x234c:   	fcmped	%fcc0, %f18, %f18
	.word	0xea78a02c	! t0_kref+0x2350:   	swap	[%g2 + 0x2c], %l5
	.word	0x3a800008	! t0_kref+0x2354:   	bcc,a	_kref+0x2374
	.word	0xa9400000	! t0_kref+0x2358:   	mov	%y, %l4
	.word	0x96b3400d	! t0_kref+0x235c:   	orncc	%o5, %o5, %o3
	.word	0xd91e3fe0	! t0_kref+0x2360:   	ldd	[%i0 - 0x20], %f12
	.word	0xe4180018	! t0_kref+0x2364:   	ldd	[%g0 + %i0], %l2
	.word	0x8143c000	! t0_kref+0x2368:   	stbar
	.word	0x927b000c	! t0_kref+0x236c:   	sdiv	%o4, %o4, %o1
	.word	0x2d800008	! t0_kref+0x2370:   	fbg,a	_kref+0x2390
	.word	0x96a3607a	! t0_kref+0x2374:   	subcc	%o5, 0x7a, %o3
	.word	0xd53e7fe0	! t0_kref+0x2378:   	std	%f10, [%i1 - 0x20]
	.word	0x9da2882c	! t0_kref+0x237c:   	fadds	%f10, %f12, %f14
	.word	0x97a00530	! t0_kref+0x2380:   	fsqrts	%f16, %f11
	.word	0xe60e4000	! t0_kref+0x2384:   	ldub	[%i1], %l3
	.word	0x9fc10000	! t0_kref+0x2388:   	call	%g4
	.word	0xd8263fe0	! t0_kref+0x238c:   	st	%o4, [%i0 - 0x20]
	.word	0xe01e6018	! t0_kref+0x2390:   	ldd	[%i1 + 0x18], %l0
	.word	0x920b000c	! t0_kref+0x2394:   	and	%o4, %o4, %o1
	.word	0xaea37e97	! t0_kref+0x2398:   	subcc	%o5, -0x169, %l7
	.word	0x27800002	! t0_kref+0x239c:   	fbul,a	_kref+0x23a4
	.word	0xa6c3400c	! t0_kref+0x23a0:   	addccc	%o5, %o4, %l3
	.word	0xd19f5a18	! t0_kref+0x23a4:   	ldda	[%i5 + %i0]0xd0, %f8
	.word	0x29480006	! t0_kref+0x23a8:   	fbl,a,pt	%fcc0, _kref+0x23c0
	.word	0x97a000aa	! t0_kref+0x23ac:   	fnegs	%f10, %f11
	.word	0xda264000	! t0_kref+0x23b0:   	st	%o5, [%i1]
	.word	0xae8b400d	! t0_kref+0x23b4:   	andcc	%o5, %o5, %l7
	.word	0xe1be1a5c	! t0_kref+0x23b8:   	stda	%f16, [%i0 + %i4]0xd2
	.word	0xa4033ccb	! t0_kref+0x23bc:   	add	%o4, -0x335, %l2
	.word	0xa29368da	! t0_kref+0x23c0:   	orcc	%o5, 0x8da, %l1
	.word	0xd0fe1000	! t0_kref+0x23c4:   	swapa	[%i0]0x80, %o0
	.word	0xc028001a	! t0_kref+0x23c8:   	clrb	[%g0 + %i2]
	.word	0xc16e7ff0	! t0_kref+0x23cc:   	prefetch	%i1 - 0x10, 0
	.word	0xa27b7de7	! t0_kref+0x23d0:   	sdiv	%o5, -0x219, %l1
	.word	0x99a40d30	! t0_kref+0x23d4:   	fsmuld	%f16, %f16, %f12
	.word	0xdd00a030	! t0_kref+0x23d8:   	ld	[%g2 + 0x30], %f14
	.word	0xd8264000	! t0_kref+0x23dc:   	st	%o4, [%i1]
	.word	0xd820a00c	! t0_kref+0x23e0:   	st	%o4, [%g2 + 0xc]
	.word	0x81ac8a4c	! t0_kref+0x23e4:   	fcmpd	%fcc0, %f18, %f12
	.word	0x928b400d	! t0_kref+0x23e8:   	andcc	%o5, %o5, %o1
	.word	0xa4732300	! t0_kref+0x23ec:   	udiv	%o4, 0x300, %l2
	.word	0xd4de501d	! t0_kref+0x23f0:   	ldxa	[%i1 + %i5]0x80, %o2
	.word	0xec080019	! t0_kref+0x23f4:   	ldub	[%g0 + %i1], %l6
	.word	0x97a00031	! t0_kref+0x23f8:   	fmovs	%f17, %f11
	.word	0xd8263fe8	! t0_kref+0x23fc:   	st	%o4, [%i0 - 0x18]
	.word	0xdd1fbd28	! t0_kref+0x2400:   	ldd	[%fp - 0x2d8], %f14
	.word	0x95a3c92f	! t0_kref+0x2404:   	fmuls	%f15, %f15, %f10
	.word	0xac53400d	! t0_kref+0x2408:   	umul	%o5, %o5, %l6
	.word	0x97a00533	! t0_kref+0x240c:   	fsqrts	%f19, %f11
	.word	0xa5b00c00	! t0_kref+0x2410:   	fzero	%f18
	.word	0x952b2003	! t0_kref+0x2414:   	sll	%o4, 0x3, %o2
	.word	0xadb300ac	! t0_kref+0x2418:   	edge16n	%o4, %o4, %l6
	.word	0xd5063fec	! t0_kref+0x241c:   	ld	[%i0 - 0x14], %f10
	.word	0x878020d0	! t0_kref+0x2420:   	mov	0xd0, %asi
	.word	0x878020d2	! t0_kref+0x2424:   	mov	0xd2, %asi
	.word	0x97a018ca	! t0_kref+0x2428:   	fdtos	%f10, %f11
	.word	0xd51fbf38	! t0_kref+0x242c:   	ldd	[%fp - 0xc8], %f10
	.word	0x81aacab1	! t0_kref+0x2430:   	fcmpes	%fcc0, %f11, %f17
	.word	0xa613000c	! t0_kref+0x2434:   	or	%o4, %o4, %l3
	.word	0x81accab0	! t0_kref+0x2438:   	fcmpes	%fcc0, %f19, %f16
	.word	0xe810a024	! t0_kref+0x243c:   	lduh	[%g2 + 0x24], %l4
	.word	0xa1a4c92a	! t0_kref+0x2440:   	fmuls	%f19, %f10, %f16
	.word	0xae33699a	! t0_kref+0x2444:   	orn	%o5, 0x99a, %l7
	.word	0xa22361d3	! t0_kref+0x2448:   	sub	%o5, 0x1d3, %l1
	.word	0x9da3894c	! t0_kref+0x244c:   	fmuld	%f14, %f12, %f14
	.word	0x9da9804e	! t0_kref+0x2450:   	fmovdg	%fcc0, %f14, %f14
	.word	0xe0be1000	! t0_kref+0x2454:   	stda	%l0, [%i0]0x80
	.word	0xa1a01893	! t0_kref+0x2458:   	fitos	%f19, %f16
	.word	0xe250a004	! t0_kref+0x245c:   	ldsh	[%g2 + 4], %l1
	.word	0xd93e6000	! t0_kref+0x2460:   	std	%f12, [%i1]
	.word	0xa5a018ca	! t0_kref+0x2464:   	fdtos	%f10, %f18
	.word	0x933b200c	! t0_kref+0x2468:   	sra	%o4, 0xc, %o1
	.word	0xe44e7fe5	! t0_kref+0x246c:   	ldsb	[%i1 - 0x1b], %l2
	.word	0x9fa40931	! t0_kref+0x2470:   	fmuls	%f16, %f17, %f15
	.word	0x27800003	! t0_kref+0x2474:   	fbul,a	_kref+0x2480
	.word	0xe500a00c	! t0_kref+0x2478:   	ld	[%g2 + 0xc], %f18
	.word	0xe6de101d	! t0_kref+0x247c:   	ldxa	[%i0 + %i5]0x80, %l3
	.word	0x9703400c	! t0_kref+0x2480:   	taddcc	%o5, %o4, %o3
	.word	0x9683400c	! t0_kref+0x2484:   	addcc	%o5, %o4, %o3
	.word	0x001fffff	! t0_kref+0x2488:   	illtrap	0x1fffff
	.word	0x99b30f73	! t0_kref+0x248c:   	fornot1s	%f12, %f19, %f12
	.word	0xa3b44af2	! t0_kref+0x2490:   	fpsub32s	%f17, %f18, %f17
	.word	0xda30a02a	! t0_kref+0x2494:   	sth	%o5, [%g2 + 0x2a]
	.word	0xa1a0054e	! t0_kref+0x2498:   	fsqrtd	%f14, %f16
	.word	0xa3a01a50	! t0_kref+0x249c:   	fdtoi	%f16, %f17
	.word	0xa91b400d	! t0_kref+0x24a0:   	tsubcctv	%o5, %o5, %l4
	.word	0x92fb000c	! t0_kref+0x24a4:   	sdivcc	%o4, %o4, %o1
	.word	0x9db009b1	! t0_kref+0x24a8:   	fexpand	%f17, %f14
	.word	0x9da0192d	! t0_kref+0x24ac:   	fstod	%f13, %f14
	.word	0x92b3400d	! t0_kref+0x24b0:   	orncc	%o5, %o5, %o1
	.word	0xe720a014	! t0_kref+0x24b4:   	st	%f19, [%g2 + 0x14]
	.word	0xee0e401a	! t0_kref+0x24b8:   	ldub	[%i1 + %i2], %l7
	.word	0xa32b2019	! t0_kref+0x24bc:   	sll	%o4, 0x19, %l1
	.word	0xae13000c	! t0_kref+0x24c0:   	or	%o4, %o4, %l7
	.word	0x33800006	! t0_kref+0x24c4:   	fbe,a	_kref+0x24dc
	.word	0xd048a008	! t0_kref+0x24c8:   	ldsb	[%g2 + 8], %o0
	.word	0xe40e6012	! t0_kref+0x24cc:   	ldub	[%i1 + 0x12], %l2
	.word	0xa7b4058e	! t0_kref+0x24d0:   	fcmpgt32	%f16, %f14, %l3
	.word	0xdd1f4019	! t0_kref+0x24d4:   	ldd	[%i5 + %i1], %f14
	.word	0x2a480003	! t0_kref+0x24d8:   	bcs,a,pt	%icc, _kref+0x24e4
	.word	0x94f3000c	! t0_kref+0x24dc:   	udivcc	%o4, %o4, %o2
	.word	0xa1b00c20	! t0_kref+0x24e0:   	fzeros	%f16
	.word	0xa3a018d2	! t0_kref+0x24e4:   	fdtos	%f18, %f17
	.word	0x9233000d	! t0_kref+0x24e8:   	orn	%o4, %o5, %o1
	.word	0x96f33bfc	! t0_kref+0x24ec:   	udivcc	%o4, -0x404, %o3
	.word	0xaf3b601a	! t0_kref+0x24f0:   	sra	%o5, 0x1a, %l7
	.word	0xee5e6008	! t0_kref+0x24f4:   	ldx	[%i1 + 8], %l7
	.word	0xeec6101c	! t0_kref+0x24f8:   	ldswa	[%i0 + %i4]0x80, %l7
	.word	0xa93b2007	! t0_kref+0x24fc:   	sra	%o4, 0x7, %l4
	.word	0xee0e4000	! t0_kref+0x2500:   	ldub	[%i1], %l7
	.word	0x92a3000c	! t0_kref+0x2504:   	subcc	%o4, %o4, %o1
	.word	0x9bb44f71	! t0_kref+0x2508:   	fornot1s	%f17, %f17, %f13
	.word	0x95b406ce	! t0_kref+0x250c:   	fmul8sux16	%f16, %f14, %f10
	.word	0x9fa4092e	! t0_kref+0x2510:   	fmuls	%f16, %f14, %f15
	.word	0xa4237b3f	! t0_kref+0x2514:   	sub	%o5, -0x4c1, %l2
	.word	0xeec65000	! t0_kref+0x2518:   	ldswa	[%i1]0x80, %l7
	.word	0x9fa0188e	! t0_kref+0x251c:   	fitos	%f14, %f15
	.word	0xa1a3884a	! t0_kref+0x2520:   	faddd	%f14, %f10, %f16
	.word	0xe500a014	! t0_kref+0x2524:   	ld	[%g2 + 0x14], %f18
	.word	0xc807bfe8	! t0_kref+0x2528:   	ld	[%fp - 0x18], %g4
	.word	0xe4c81018	! t0_kref+0x252c:   	ldsba	[%g0 + %i0]0x80, %l2
	.word	0x3f480008	! t0_kref+0x2530:   	fbo,a,pt	%fcc0, _kref+0x2550
	.word	0xe968a00d	! t0_kref+0x2534:   	prefetch	%g2 + 0xd, 20
	.word	0xaa1339e8	! t0_kref+0x2538:   	or	%o4, -0x618, %l5
	.word	0xaa936b16	! t0_kref+0x253c:   	orcc	%o5, 0xb16, %l5
	.word	0xe51fbf20	! t0_kref+0x2540:   	ldd	[%fp - 0xe0], %f18
	.word	0x99a018ce	! t0_kref+0x2544:   	fdtos	%f14, %f12
	.word	0xd6466004	! t0_kref+0x2548:   	ldsw	[%i1 + 4], %o3
	.word	0xa6fb6186	! t0_kref+0x254c:   	sdivcc	%o5, 0x186, %l3
	.word	0x952b000d	! t0_kref+0x2550:   	sll	%o4, %o5, %o2
	.word	0x2c800002	! t0_kref+0x2554:   	bneg,a	_kref+0x255c
	.word	0x99b28a0a	! t0_kref+0x2558:   	fpadd16	%f10, %f10, %f12
	.word	0xac1b400c	! t0_kref+0x255c:   	xor	%o5, %o4, %l6
	.word	0x9fb4cab2	! t0_kref+0x2560:   	fpsub16s	%f19, %f18, %f15
	.word	0xa22b000d	! t0_kref+0x2564:   	andn	%o4, %o5, %l1
	.word	0x2f800004	! t0_kref+0x2568:   	fbu,a	_kref+0x2578
	.word	0xd91e2010	! t0_kref+0x256c:   	ldd	[%i0 + 0x10], %f12
	.word	0xa433000d	! t0_kref+0x2570:   	orn	%o4, %o5, %l2
	.word	0x96636fff	! t0_kref+0x2574:   	subc	%o5, 0xfff, %o3
	.word	0xd678a030	! t0_kref+0x2578:   	swap	[%g2 + 0x30], %o3
	.word	0xa5a01932	! t0_kref+0x257c:   	fstod	%f18, %f18
	.word	0x90b3400c	! t0_kref+0x2580:   	orncc	%o5, %o4, %o0
	.word	0xe200a030	! t0_kref+0x2584:   	ld	[%g2 + 0x30], %l1
	.word	0x3b800006	! t0_kref+0x2588:   	fble,a	_kref+0x25a0
	.word	0xd91f4018	! t0_kref+0x258c:   	ldd	[%i5 + %i0], %f12
	.word	0x21800003	! t0_kref+0x2590:   	fbn,a	_kref+0x259c
	.word	0xe1be5a5b	! t0_kref+0x2594:   	stda	%f16, [%i1 + %i3]0xd2
	.word	0xa703400d	! t0_kref+0x2598:   	taddcc	%o5, %o5, %l3
	.word	0x3f800004	! t0_kref+0x259c:   	fbo,a	_kref+0x25ac
	.word	0xa88360a2	! t0_kref+0x25a0:   	addcc	%o5, 0xa2, %l4
	.word	0x001fffff	! t0_kref+0x25a4:   	illtrap	0x1fffff
	.word	0x9bb00fe0	! t0_kref+0x25a8:   	fones	%f13
	.word	0x3f480004	! t0_kref+0x25ac:   	fbo,a,pt	%fcc0, _kref+0x25bc
	.word	0x93b48490	! t0_kref+0x25b0:   	fcmple32	%f18, %f16, %o1
	.word	0xeefe501c	! t0_kref+0x25b4:   	swapa	[%i1 + %i4]0x80, %l7
	.word	0xa7a01a50	! t0_kref+0x25b8:   	fdtoi	%f16, %f19
	.word	0xe6d6105b	! t0_kref+0x25bc:   	ldsha	[%i0 + %i3]0x82, %l3
	.word	0xa5a000cc	! t0_kref+0x25c0:   	fnegd	%f12, %f18
	.word	0xd51e2008	! t0_kref+0x25c4:   	ldd	[%i0 + 8], %f10
	.word	0x2d480003	! t0_kref+0x25c8:   	fbg,a,pt	%fcc0, _kref+0x25d4
	.word	0x99b28910	! t0_kref+0x25cc:   	faligndata	%f10, %f16, %f12
	.word	0xe44e0000	! t0_kref+0x25d0:   	ldsb	[%i0], %l2
	.word	0xf9ee501c	! t0_kref+0x25d4:   	prefetcha	%i1 + %i4, 28
	.word	0x9de3bfa0	! t0_kref+0x25d8:   	save	%sp, -0x60, %sp
	.word	0xb208001b	! t0_kref+0x25dc:   	and	%g0, %i3, %i1
	.word	0xa5ef3f4a	! t0_kref+0x25e0:   	restore	%i4, -0xb6, %l2
	.word	0x90a3000d	! t0_kref+0x25e4:   	subcc	%o4, %o5, %o0
	.word	0x8143e040	! t0_kref+0x25e8:   	membar	0x40
	.word	0x9fa00532	! t0_kref+0x25ec:   	fsqrts	%f18, %f15
	.word	0x9fa3c832	! t0_kref+0x25f0:   	fadds	%f15, %f18, %f15
	.word	0x9da0052e	! t0_kref+0x25f4:   	fsqrts	%f14, %f14
	.word	0xe168a08a	! t0_kref+0x25f8:   	prefetch	%g2 + 0x8a, 16
	.word	0xe700a030	! t0_kref+0x25fc:   	ld	[%g2 + 0x30], %f19
	.word	0xd45e2010	! t0_kref+0x2600:   	ldx	[%i0 + 0x10], %o2
	.word	0xa5b48a10	! t0_kref+0x2604:   	fpadd16	%f18, %f16, %f18
	.word	0xa1b40e80	! t0_kref+0x2608:   	fsrc1	%f16, %f16
	.word	0x95a0188a	! t0_kref+0x260c:   	fitos	%f10, %f10
	.word	0xd00e3ff8	! t0_kref+0x2610:   	ldub	[%i0 - 8], %o0
	.word	0xec0e3ff7	! t0_kref+0x2614:   	ldub	[%i0 - 9], %l6
	.word	0x94b328f7	! t0_kref+0x2618:   	orncc	%o4, 0x8f7, %o2
	.word	0xaea33e96	! t0_kref+0x261c:   	subcc	%o4, -0x16a, %l7
	.word	0x96b37d4d	! t0_kref+0x2620:   	orncc	%o5, -0x2b3, %o3
	.word	0xa2f3000d	! t0_kref+0x2624:   	udivcc	%o4, %o5, %l1
	.word	0x99a0188b	! t0_kref+0x2628:   	fitos	%f11, %f12
	.word	0xac53764c	! t0_kref+0x262c:   	umul	%o5, -0x9b4, %l6
	.word	0xd51fbee0	! t0_kref+0x2630:   	ldd	[%fp - 0x120], %f10
	.word	0x9fb0076c	! t0_kref+0x2634:   	fpack16	%f12, %f15
	.word	0x97b40c6d	! t0_kref+0x2638:   	fnors	%f16, %f13, %f11
	.word	0xda26001c	! t0_kref+0x263c:   	st	%o5, [%i0 + %i4]
	.word	0xa5a4c92d	! t0_kref+0x2640:   	fmuls	%f19, %f13, %f18
	.word	0x99b40e10	! t0_kref+0x2644:   	fand	%f16, %f16, %f12
	.word	0xe1be188c	! t0_kref+0x2648:   	stda	%f16, [%i0 + %o4]0xc4
	.word	0xa3b300cc	! t0_kref+0x264c:   	edge16l	%o4, %o4, %l1
	.word	0x8143c000	! t0_kref+0x2650:   	stbar
	.word	0xabb300ed	! t0_kref+0x2654:   	edge16ln	%o4, %o5, %l5
	.word	0xd828a034	! t0_kref+0x2658:   	stb	%o4, [%g2 + 0x34]
	.word	0xae13000d	! t0_kref+0x265c:   	or	%o4, %o5, %l7
	.word	0x24800004	! t0_kref+0x2660:   	ble,a	_kref+0x2670
	.word	0x96b3400c	! t0_kref+0x2664:   	orncc	%o5, %o4, %o3
	.word	0xdba01018	! t0_kref+0x2668:   	sta	%f13, [%g0 + %i0]0x80
	.word	0xa40b33d9	! t0_kref+0x266c:   	and	%o4, -0xc27, %l2
	.word	0xd20e0000	! t0_kref+0x2670:   	ldub	[%i0], %o1
	.word	0xe168a003	! t0_kref+0x2674:   	prefetch	%g2 + 3, 16
	.word	0x9ba3092c	! t0_kref+0x2678:   	fmuls	%f12, %f12, %f13
	.word	0xa7a0188e	! t0_kref+0x267c:   	fitos	%f14, %f19
	.word	0xdab6501b	! t0_kref+0x2680:   	stha	%o5, [%i1 + %i3]0x80
	.word	0x99b40e80	! t0_kref+0x2684:   	fsrc1	%f16, %f12
	.word	0xc10828d8	! t0_kref+0x2688:   	ld	[%g0 + 0x8d8], %fsr
	.word	0xd1be188c	! t0_kref+0x268c:   	stda	%f8, [%i0 + %o4]0xc4
	.word	0x95b48a0a	! t0_kref+0x2690:   	fpadd16	%f18, %f10, %f10
	.word	0xa7a40830	! t0_kref+0x2694:   	fadds	%f16, %f16, %f19
	.word	0x95b00f0a	! t0_kref+0x2698:   	fsrc2	%f10, %f10
	.word	0x36480005	! t0_kref+0x269c:   	bge,a,pt	%icc, _kref+0x26b0
	.word	0x9fa28832	! t0_kref+0x26a0:   	fadds	%f10, %f18, %f15
	.word	0xe648a017	! t0_kref+0x26a4:   	ldsb	[%g2 + 0x17], %l3
	.word	0xd610a002	! t0_kref+0x26a8:   	lduh	[%g2 + 2], %o3
	.word	0xe608a039	! t0_kref+0x26ac:   	ldub	[%g2 + 0x39], %l3
	.word	0xa5b48eca	! t0_kref+0x26b0:   	fornot2	%f18, %f10, %f18
	.word	0x99b00cce	! t0_kref+0x26b4:   	fnot2	%f14, %f12
	.word	0x38800002	! t0_kref+0x26b8:   	bgu,a	_kref+0x26c0
	.word	0x93b3002d	! t0_kref+0x26bc:   	edge8n	%o4, %o5, %o1
	.word	0xab2b201c	! t0_kref+0x26c0:   	sll	%o4, 0x1c, %l5
	.word	0x37480008	! t0_kref+0x26c4:   	fbge,a,pt	%fcc0, _kref+0x26e4
	.word	0xaa63400d	! t0_kref+0x26c8:   	subc	%o5, %o5, %l5
	.word	0xd500a030	! t0_kref+0x26cc:   	ld	[%g2 + 0x30], %f10
	.word	0x23480001	! t0_kref+0x26d0:   	fbne,a,pt	%fcc0, _kref+0x26d4
	.word	0xd000a000	! t0_kref+0x26d4:   	ld	[%g2], %o0
	.word	0xe81e7fe0	! t0_kref+0x26d8:   	ldd	[%i1 - 0x20], %l4
	.word	0xdaae1000	! t0_kref+0x26dc:   	stba	%o5, [%i0]0x80
	.word	0xd610a01e	! t0_kref+0x26e0:   	lduh	[%g2 + 0x1e], %o3
	.word	0x2a480004	! t0_kref+0x26e4:   	bcs,a,pt	%icc, _kref+0x26f4
	.word	0xe87f0018	! t0_kref+0x26e8:   	swap	[%i4 + %i0], %l4
	.word	0x2f800002	! t0_kref+0x26ec:   	fbu,a	_kref+0x26f4
	.word	0xf16e6010	! t0_kref+0x26f0:   	prefetch	%i1 + 0x10, 24
	.word	0xae9b000c	! t0_kref+0x26f4:   	xorcc	%o4, %o4, %l7
	.word	0x23800007	! t0_kref+0x26f8:   	fbne,a	_kref+0x2714
	.word	0x99a488cc	! t0_kref+0x26fc:   	fsubd	%f18, %f12, %f12
	.word	0x81834000	! t0_kref+0x2700:   	wr	%o5, %g0, %y
	.word	0xc96e6008	! t0_kref+0x2704:   	prefetch	%i1 + 8, 4
	.word	0xa213000c	! t0_kref+0x2708:   	or	%o4, %o4, %l1
	.word	0xe520a018	! t0_kref+0x270c:   	st	%f18, [%g2 + 0x18]
	.word	0xa3b3016c	! t0_kref+0x2710:   	edge32ln	%o4, %o4, %l1
	.word	0x8143c000	! t0_kref+0x2714:   	stbar
	.word	0x3e800006	! t0_kref+0x2718:   	bvc,a	_kref+0x2730
	.word	0x972b000d	! t0_kref+0x271c:   	sll	%o4, %o5, %o3
	.word	0xffee101d	! t0_kref+0x2720:   	prefetcha	%i0 + %i5, 31
	.word	0x9da8004a	! t0_kref+0x2724:   	fmovdn	%fcc0, %f10, %f14
	.word	0x9523000c	! t0_kref+0x2728:   	mulscc	%o4, %o4, %o2
	.word	0xe6480018	! t0_kref+0x272c:   	ldsb	[%g0 + %i0], %l3
	.word	0xa7b3848a	! t0_kref+0x2730:   	fcmple32	%f14, %f10, %l3
	.word	0x9da40952	! t0_kref+0x2734:   	fmuld	%f16, %f18, %f14
	.word	0x97a000ae	! t0_kref+0x2738:   	fnegs	%f14, %f11
	.word	0xe01e001d	! t0_kref+0x273c:   	ldd	[%i0 + %i5], %l0
	.word	0xec08a008	! t0_kref+0x2740:   	ldub	[%g2 + 8], %l6
	.word	0xe1be180d	! t0_kref+0x2744:   	stda	%f16, [%i0 + %o5]0xc0
	.word	0xaf3b600b	! t0_kref+0x2748:   	sra	%o5, 0xb, %l7
	.word	0xadb3404c	! t0_kref+0x274c:   	edge8l	%o5, %o4, %l6
	.word	0x99a018d0	! t0_kref+0x2750:   	fdtos	%f16, %f12
	.word	0xa2b32aea	! t0_kref+0x2754:   	orncc	%o4, 0xaea, %l1
	.word	0xa85321cc	! t0_kref+0x2758:   	umul	%o4, 0x1cc, %l4
	.word	0xa6133731	! t0_kref+0x275c:   	or	%o4, -0x8cf, %l3
	.word	0x9ba01a4c	! t0_kref+0x2760:   	fdtoi	%f12, %f13
	.word	0x97b3410d	! t0_kref+0x2764:   	edge32	%o5, %o5, %o3
	.word	0x952b400c	! t0_kref+0x2768:   	sll	%o5, %o4, %o2
	.word	0xa5a01112	! t0_kref+0x276c:   	fxtod	%f18, %f18
	.word	0xaaf3400d	! t0_kref+0x2770:   	udivcc	%o5, %o5, %l5
	.word	0x933b6010	! t0_kref+0x2774:   	sra	%o5, 0x10, %o1
	.word	0x9fc10000	! t0_kref+0x2778:   	call	%g4
	.word	0xfbee101a	! t0_kref+0x277c:   	prefetcha	%i0 + %i2, 29
	.word	0x86102004	! t0_kref+0x2780:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x2784:   	bne,a	_kref+0x2784
	.word	0x86a0e001	! t0_kref+0x2788:   	subcc	%g3, 1, %g3
	.word	0x92fb400d	! t0_kref+0x278c:   	sdivcc	%o5, %o5, %o1
	.word	0x27800008	! t0_kref+0x2790:   	fbul,a	_kref+0x27b0
	.word	0x99a408d0	! t0_kref+0x2794:   	fsubd	%f16, %f16, %f12
	.word	0x912b000c	! t0_kref+0x2798:   	sll	%o4, %o4, %o0
	.word	0x9ba00532	! t0_kref+0x279c:   	fsqrts	%f18, %f13
	.word	0x97b30200	! t0_kref+0x27a0:   	array8	%o4, %g0, %o3
	.word	0x95b34d30	! t0_kref+0x27a4:   	fandnot1s	%f13, %f16, %f10
	.word	0xa1a0054c	! t0_kref+0x27a8:   	fsqrtd	%f12, %f16
	.word	0xae33000c	! t0_kref+0x27ac:   	orn	%o4, %o4, %l7
	.word	0xa5a0054e	! t0_kref+0x27b0:   	fsqrtd	%f14, %f18
	.word	0x99b30a0c	! t0_kref+0x27b4:   	fpadd16	%f12, %f12, %f12
	.word	0xc76e000d	! t0_kref+0x27b8:   	prefetch	%i0 + %o5, 3
	.word	0x3b800007	! t0_kref+0x27bc:   	fble,a	_kref+0x27d8
	.word	0xa7a4882c	! t0_kref+0x27c0:   	fadds	%f18, %f12, %f19
	.word	0x99a0002b	! t0_kref+0x27c4:   	fmovs	%f11, %f12
	.word	0x94fb000d	! t0_kref+0x27c8:   	sdivcc	%o4, %o5, %o2
	.word	0xd86e7fe4	! t0_kref+0x27cc:   	ldstub	[%i1 - 0x1c], %o4
	.word	0xa20366f2	! t0_kref+0x27d0:   	add	%o5, 0x6f2, %l1
	.word	0xe51fbc28	! t0_kref+0x27d4:   	ldd	[%fp - 0x3d8], %f18
	.word	0xe46e3fee	! t0_kref+0x27d8:   	ldstub	[%i0 - 0x12], %l2
	.word	0xa7418000	! t0_kref+0x27dc:   	mov	%fprs, %l3
	.word	0xa9b4044e	! t0_kref+0x27e0:   	fcmpne16	%f16, %f14, %l4
	.word	0xda36401b	! t0_kref+0x27e4:   	sth	%o5, [%i1 + %i3]
	.word	0x972b000c	! t0_kref+0x27e8:   	sll	%o4, %o4, %o3
	.word	0x940b000d	! t0_kref+0x27ec:   	and	%o4, %o5, %o2
	.word	0xa5b48f8a	! t0_kref+0x27f0:   	for	%f18, %f10, %f18
	.word	0xa544c000	! t0_kref+0x27f4:   	mov	%gsr, %l2
	.word	0xa5a0054c	! t0_kref+0x27f8:   	fsqrtd	%f12, %f18
	.word	0xe03f4019	! t0_kref+0x27fc:   	std	%l0, [%i5 + %i1]
	.word	0xd826001c	! t0_kref+0x2800:   	st	%o4, [%i0 + %i4]
	.word	0xa6332995	! t0_kref+0x2804:   	orn	%o4, 0x995, %l3
	.word	0xfbee501d	! t0_kref+0x2808:   	prefetcha	%i1 + %i5, 29
	.word	0xa1a0192f	! t0_kref+0x280c:   	fstod	%f15, %f16
	.word	0xa5a408d0	! t0_kref+0x2810:   	fsubd	%f16, %f16, %f18
	.word	0x99a00150	! t0_kref+0x2814:   	fabsd	%f16, %f12
	.word	0xaf3b000c	! t0_kref+0x2818:   	sra	%o4, %o4, %l7
	.word	0x99a00552	! t0_kref+0x281c:   	fsqrtd	%f18, %f12
	.word	0xa69b7143	! t0_kref+0x2820:   	xorcc	%o5, -0xebd, %l3
	.word	0x33800005	! t0_kref+0x2824:   	fbe,a	_kref+0x2838
	.word	0xd830a03a	! t0_kref+0x2828:   	sth	%o4, [%g2 + 0x3a]
	.word	0x2d480001	! t0_kref+0x282c:   	fbg,a,pt	%fcc0, _kref+0x2830
	.word	0x9fa018d0	! t0_kref+0x2830:   	fdtos	%f16, %f15
	.word	0xe640a014	! t0_kref+0x2834:   	ldsw	[%g2 + 0x14], %l3
	.word	0x8d837361	! t0_kref+0x2838:   	wr	%o5, 0xfffff361, %fprs
	.word	0xec1e401d	! t0_kref+0x283c:   	ldd	[%i1 + %i5], %l6
	.word	0xc108001c	! t0_kref+0x2840:   	ld	[%g0 + %i4], %fsr
	.word	0xaf702215	! t0_kref+0x2844:   	popc	0x215, %l7
	.word	0xe400a02c	! t0_kref+0x2848:   	ld	[%g2 + 0x2c], %l2
	.word	0xda20a010	! t0_kref+0x284c:   	st	%o5, [%g2 + 0x10]
	.word	0xa30b400d	! t0_kref+0x2850:   	tsubcc	%o5, %o5, %l1
	.word	0xd44e7fff	! t0_kref+0x2854:   	ldsb	[%i1 - 1], %o2
	.word	0xe700a004	! t0_kref+0x2858:   	ld	[%g2 + 4], %f19
	.word	0xf3270000	! t0_kref+0x285c:   	st	%f25, [%i4]
	.word	0xa3a018d0	! t0_kref+0x2860:   	fdtos	%f16, %f17
	.word	0xd648a010	! t0_kref+0x2864:   	ldsb	[%g2 + 0x10], %o3
	.word	0x30480001	! t0_kref+0x2868:   	ba,a,pt	%icc, _kref+0x286c
	.word	0x90136b50	! t0_kref+0x286c:   	or	%o5, 0xb50, %o0
	.word	0xf207bfe0	! t0_kref+0x2870:   	ld	[%fp - 0x20], %i1
	.word	0xa5a0054a	! t0_kref+0x2874:   	fsqrtd	%f10, %f18
	.word	0xa73b6004	! t0_kref+0x2878:   	sra	%o5, 0x4, %l3
	.word	0xa5a000aa	! t0_kref+0x287c:   	fnegs	%f10, %f18
	.word	0xe11fbdb8	! t0_kref+0x2880:   	ldd	[%fp - 0x248], %f16
	.word	0x9db38ad2	! t0_kref+0x2884:   	fpsub32	%f14, %f18, %f14
	.word	0xa6132068	! t0_kref+0x2888:   	or	%o4, 0x68, %l3
	.word	0xe96e6008	! t0_kref+0x288c:   	prefetch	%i1 + 8, 20
	.word	0xe24e8018	! t0_kref+0x2890:   	ldsb	[%i2 + %i0], %l1
	.word	0xd8f6501d	! t0_kref+0x2894:   	stxa	%o4, [%i1 + %i5]0x80
	.word	0xd000a02c	! t0_kref+0x2898:   	ld	[%g2 + 0x2c], %o0
	.word	0xea50a00a	! t0_kref+0x289c:   	ldsh	[%g2 + 0xa], %l5
	.word	0xae0b000c	! t0_kref+0x28a0:   	and	%o4, %o4, %l7
	.word	0x95a0014c	! t0_kref+0x28a4:   	fabsd	%f12, %f10
	.word	0x95b48a4c	! t0_kref+0x28a8:   	fpadd32	%f18, %f12, %f10
	.word	0x9da0054e	! t0_kref+0x28ac:   	fsqrtd	%f14, %f14
	.word	0x9da0054a	! t0_kref+0x28b0:   	fsqrtd	%f10, %f14
	.word	0x95a01090	! t0_kref+0x28b4:   	fxtos	%f16, %f10
	.word	0xe01f4019	! t0_kref+0x28b8:   	ldd	[%i5 + %i1], %l0
	.word	0xa3a3082e	! t0_kref+0x28bc:   	fadds	%f12, %f14, %f17
	.word	0x878020f0	! t0_kref+0x28c0:   	mov	0xf0, %asi
	.word	0x99b009b2	! t0_kref+0x28c4:   	fexpand	%f18, %f12
	.word	0x9ba4c933	! t0_kref+0x28c8:   	fmuls	%f19, %f19, %f13
	.word	0x9db28f4e	! t0_kref+0x28cc:   	fornot1	%f10, %f14, %f14
	.word	0xdf20a00c	! t0_kref+0x28d0:   	st	%f15, [%g2 + 0xc]
	.word	0x99a0188e	! t0_kref+0x28d4:   	fitos	%f14, %f12
	.word	0xd07e7fe0	! t0_kref+0x28d8:   	swap	[%i1 - 0x20], %o0
	.word	0x99b486d2	! t0_kref+0x28dc:   	fmul8sux16	%f18, %f18, %f12
	.word	0x95400000	! t0_kref+0x28e0:   	mov	%y, %o2
	.word	0xaa633202	! t0_kref+0x28e4:   	subc	%o4, -0xdfe, %l5
	.word	0x90fb400d	! t0_kref+0x28e8:   	sdivcc	%o5, %o5, %o0
	.word	0x99b28a12	! t0_kref+0x28ec:   	fpadd16	%f10, %f18, %f12
	.word	0xee163ff6	! t0_kref+0x28f0:   	lduh	[%i0 - 0xa], %l7
	.word	0x33480001	! t0_kref+0x28f4:   	fbe,a,pt	%fcc0, _kref+0x28f8
	.word	0x9fa01a2f	! t0_kref+0x28f8:   	fstoi	%f15, %f15
	.word	0x93b340cc	! t0_kref+0x28fc:   	edge16l	%o5, %o4, %o1
	.word	0xe41e3fe8	! t0_kref+0x2900:   	ldd	[%i0 - 0x18], %l2
	.word	0xad44c000	! t0_kref+0x2904:   	mov	%gsr, %l6
	.word	0xaa9b400d	! t0_kref+0x2908:   	xorcc	%o5, %o5, %l5
	.word	0x9da0054e	! t0_kref+0x290c:   	fsqrtd	%f14, %f14
	.word	0x9fc10000	! t0_kref+0x2910:   	call	%g4
	.word	0xa7a01a4c	! t0_kref+0x2914:   	fdtoi	%f12, %f19
	.word	0xa5a018d2	! t0_kref+0x2918:   	fdtos	%f18, %f18
	.word	0xe24e600a	! t0_kref+0x291c:   	ldsb	[%i1 + 0xa], %l1
	.word	0xa8fb400d	! t0_kref+0x2920:   	sdivcc	%o5, %o5, %l4
	.word	0x3f800007	! t0_kref+0x2924:   	fbo,a	_kref+0x2940
	.word	0xa29b3fc1	! t0_kref+0x2928:   	xorcc	%o4, -0x3f, %l1
	.word	0x99a4894a	! t0_kref+0x292c:   	fmuld	%f18, %f10, %f12
	.word	0xc1ee100d	! t0_kref+0x2930:   	prefetcha	%i0 + %o5, 0
	.word	0xed68a08f	! t0_kref+0x2934:   	prefetch	%g2 + 0x8f, 22
	.word	0xe03e7fe0	! t0_kref+0x2938:   	std	%l0, [%i1 - 0x20]
	.word	0xa80b400c	! t0_kref+0x293c:   	and	%o5, %o4, %l4
	.word	0x2e800005	! t0_kref+0x2940:   	bvs,a	_kref+0x2954
	.word	0xa3a000b2	! t0_kref+0x2944:   	fnegs	%f18, %f17
	.word	0x99a308b2	! t0_kref+0x2948:   	fsubs	%f12, %f18, %f12
	.word	0xa6b32889	! t0_kref+0x294c:   	orncc	%o4, 0x889, %l3
	.word	0x27800007	! t0_kref+0x2950:   	fbul,a	_kref+0x296c
	.word	0x95b4072a	! t0_kref+0x2954:   	fmuld8ulx16	%f16, %f10, %f10
	.word	0xe47e4000	! t0_kref+0x2958:   	swap	[%i1], %l2
	.word	0xebee101d	! t0_kref+0x295c:   	prefetcha	%i0 + %i5, 21
	.word	0xe1e6500c	! t0_kref+0x2960:   	casa	[%i1]0x80, %o4, %l0
	.word	0xea50a02a	! t0_kref+0x2964:   	ldsh	[%g2 + 0x2a], %l5
	.word	0x9da4882e	! t0_kref+0x2968:   	fadds	%f18, %f14, %f14
	.word	0x95a2884a	! t0_kref+0x296c:   	faddd	%f10, %f10, %f10
	.word	0xa5b3090c	! t0_kref+0x2970:   	faligndata	%f12, %f12, %f18
	.word	0x9fc00004	! t0_kref+0x2974:   	call	%g0 + %g4
	.word	0xa33b6002	! t0_kref+0x2978:   	sra	%o5, 0x2, %l1
	.word	0xa5b0076e	! t0_kref+0x297c:   	fpack16	%f14, %f18
	.word	0xd4070018	! t0_kref+0x2980:   	ld	[%i4 + %i0], %o2
	.word	0x97400000	! t0_kref+0x2984:   	mov	%y, %o3
	.word	0xd250a006	! t0_kref+0x2988:   	ldsh	[%g2 + 6], %o1
	.word	0xa883646f	! t0_kref+0x298c:   	addcc	%o5, 0x46f, %l4
	.word	0xe41e3fe8	! t0_kref+0x2990:   	ldd	[%i0 - 0x18], %l2
	.word	0xd51e3fe8	! t0_kref+0x2994:   	ldd	[%i0 - 0x18], %f10
	.word	0x9de3bfa0	! t0_kref+0x2998:   	save	%sp, -0x60, %sp
	.word	0x97eec000	! t0_kref+0x299c:   	restore	%i3, %g0, %o3
	.word	0xa4f3400d	! t0_kref+0x29a0:   	udivcc	%o5, %o5, %l2
	.word	0xc398a080	! t0_kref+0x29a4:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0x932b400c	! t0_kref+0x29a8:   	sll	%o5, %o4, %o1
	.word	0x9013400c	! t0_kref+0x29ac:   	or	%o5, %o4, %o0
	.word	0x9de3bfa0	! t0_kref+0x29b0:   	save	%sp, -0x60, %sp
	.word	0x97ef401b	! t0_kref+0x29b4:   	restore	%i5, %i3, %o3
	.word	0xdd1fbd18	! t0_kref+0x29b8:   	ldd	[%fp - 0x2e8], %f14
	.word	0x9da00552	! t0_kref+0x29bc:   	fsqrtd	%f18, %f14
	.word	0xa4fb6012	! t0_kref+0x29c0:   	sdivcc	%o5, 0x12, %l2
	.word	0x27800003	! t0_kref+0x29c4:   	fbul,a	_kref+0x29d0
	.word	0xa5b3408c	! t0_kref+0x29c8:   	edge16	%o5, %o4, %l2
	.word	0x3f480003	! t0_kref+0x29cc:   	fbo,a,pt	%fcc0, _kref+0x29d8
	.word	0xeec01018	! t0_kref+0x29d0:   	ldswa	[%g0 + %i0]0x80, %l7
	.word	0xd91fbcc0	! t0_kref+0x29d4:   	ldd	[%fp - 0x340], %f12
	.word	0x90fb400d	! t0_kref+0x29d8:   	sdivcc	%o5, %o5, %o0
	.word	0x3b800006	! t0_kref+0x29dc:   	fble,a	_kref+0x29f4
	.word	0xd8264000	! t0_kref+0x29e0:   	st	%o4, [%i1]
	.word	0xe03e001d	! t0_kref+0x29e4:   	std	%l0, [%i0 + %i5]
	.word	0x95a01a2f	! t0_kref+0x29e8:   	fstoi	%f15, %f10
	.word	0xa1b28ea0	! t0_kref+0x29ec:   	fsrc1s	%f10, %f16
	.word	0xa4c32d50	! t0_kref+0x29f0:   	addccc	%o4, 0xd50, %l2
	.word	0xd8200018	! t0_kref+0x29f4:   	st	%o4, [%g0 + %i0]
	.word	0x9da34d2f	! t0_kref+0x29f8:   	fsmuld	%f13, %f15, %f14
	.word	0x99a00550	! t0_kref+0x29fc:   	fsqrtd	%f16, %f12
	.word	0xe3b8a040	! t0_kref+0x2a00:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xa52b000c	! t0_kref+0x2a04:   	sll	%o4, %o4, %l2
	.word	0xa3b30280	! t0_kref+0x2a08:   	array32	%o4, %g0, %l1
	.word	0xa223000c	! t0_kref+0x2a0c:   	sub	%o4, %o4, %l1
	.word	0xdd1e3ff8	! t0_kref+0x2a10:   	ldd	[%i0 - 8], %f14
	.word	0xa803000c	! t0_kref+0x2a14:   	add	%o4, %o4, %l4
	.word	0xec166012	! t0_kref+0x2a18:   	lduh	[%i1 + 0x12], %l6
	.word	0x33800001	! t0_kref+0x2a1c:   	fbe,a	_kref+0x2a20
	.word	0x97b38aea	! t0_kref+0x2a20:   	fpsub32s	%f14, %f10, %f11
	.word	0xee48a010	! t0_kref+0x2a24:   	ldsb	[%g2 + 0x10], %l7
	.word	0xda262008	! t0_kref+0x2a28:   	st	%o5, [%i0 + 8]
	.word	0x35480003	! t0_kref+0x2a2c:   	fbue,a,pt	%fcc0, _kref+0x2a38
	.word	0xdf00a038	! t0_kref+0x2a30:   	ld	[%g2 + 0x38], %f15
	.word	0x21480004	! t0_kref+0x2a34:   	fbn,a,pt	%fcc0, _kref+0x2a44
	.word	0x948b400d	! t0_kref+0x2a38:   	andcc	%o5, %o5, %o2
	.word	0xe81e7ff0	! t0_kref+0x2a3c:   	ldd	[%i1 - 0x10], %l4
	.word	0xd6067fec	! t0_kref+0x2a40:   	ld	[%i1 - 0x14], %o3
	.word	0xda2e6000	! t0_kref+0x2a44:   	stb	%o5, [%i1]
	.word	0x2b480005	! t0_kref+0x2a48:   	fbug,a,pt	%fcc0, _kref+0x2a5c
	.word	0x9da0054c	! t0_kref+0x2a4c:   	fsqrtd	%f12, %f14
	.word	0xa1a3082d	! t0_kref+0x2a50:   	fadds	%f12, %f13, %f16
	.word	0x9da48d2f	! t0_kref+0x2a54:   	fsmuld	%f18, %f15, %f14
	.word	0xa1a2894a	! t0_kref+0x2a58:   	fmuld	%f10, %f10, %f16
	.word	0x81dac014	! t0_kref+0x2a5c:   	flush	%o3 + %l4
	.word	0xdd000019	! t0_kref+0x2a60:   	ld	[%g0 + %i1], %f14
	.word	0x87802080	! t0_kref+0x2a64:   	mov	0x80, %asi
	.word	0xe03e4000	! t0_kref+0x2a68:   	std	%l0, [%i1]
	.word	0xf76e6010	! t0_kref+0x2a6c:   	prefetch	%i1 + 0x10, 27
	.word	0x99a00552	! t0_kref+0x2a70:   	fsqrtd	%f18, %f12
	.word	0xdaa0a020	! t0_kref+0x2a74:   	sta	%o5, [%g2 + 0x20]%asi
	.word	0x94c333b1	! t0_kref+0x2a78:   	addccc	%o4, -0xc4f, %o2
	.word	0x99a0054a	! t0_kref+0x2a7c:   	fsqrtd	%f10, %f12
	.word	0x9613400c	! t0_kref+0x2a80:   	or	%o5, %o4, %o3
	.word	0xa5a0054c	! t0_kref+0x2a84:   	fsqrtd	%f12, %f18
	.word	0xdd3e2010	! t0_kref+0x2a88:   	std	%f14, [%i0 + 0x10]
	.word	0xec1f4018	! t0_kref+0x2a8c:   	ldd	[%i5 + %i0], %l6
	.word	0xa5a00550	! t0_kref+0x2a90:   	fsqrtd	%f16, %f18
	.word	0xd8367ffa	! t0_kref+0x2a94:   	sth	%o4, [%i1 - 6]
	.word	0xa81362bf	! t0_kref+0x2a98:   	or	%o5, 0x2bf, %l4
	.word	0xa1a01912	! t0_kref+0x2a9c:   	fitod	%f18, %f16
	.word	0xe1be188d	! t0_kref+0x2aa0:   	stda	%f16, [%i0 + %o5]0xc4
	.word	0xd00e601a	! t0_kref+0x2aa4:   	ldub	[%i1 + 0x1a], %o0
	.word	0xe11e6000	! t0_kref+0x2aa8:   	ldd	[%i1], %f16
	.word	0xa1b00fc0	! t0_kref+0x2aac:   	fone	%f16
	.word	0x8143c000	! t0_kref+0x2ab0:   	stbar
	.word	0xe1180019	! t0_kref+0x2ab4:   	ldd	[%g0 + %i1], %f16
	.word	0x8d832857	! t0_kref+0x2ab8:   	wr	%o4, 0x857, %fprs
	.word	0x90f3400c	! t0_kref+0x2abc:   	udivcc	%o5, %o4, %o0
	.word	0xe2c8a012	! t0_kref+0x2ac0:   	ldsba	[%g2 + 0x12]%asi, %l1
	.word	0xa5b38d60	! t0_kref+0x2ac4:   	fnot1s	%f14, %f18
	.word	0x99a000ca	! t0_kref+0x2ac8:   	fnegd	%f10, %f12
	.word	0x94137695	! t0_kref+0x2acc:   	or	%o5, -0x96b, %o2
	.word	0xd91fbcb8	! t0_kref+0x2ad0:   	ldd	[%fp - 0x348], %f12
	.word	0xe84e4000	! t0_kref+0x2ad4:   	ldsb	[%i1], %l4
	.word	0xa7a88030	! t0_kref+0x2ad8:   	fmovslg	%fcc0, %f16, %f19
	.word	0x9ba01a4a	! t0_kref+0x2adc:   	fdtoi	%f10, %f13
	.word	0x8143c000	! t0_kref+0x2ae0:   	stbar
	.word	0xa6a3400c	! t0_kref+0x2ae4:   	subcc	%o5, %o4, %l3
	.word	0xa813400d	! t0_kref+0x2ae8:   	or	%o5, %o5, %l4
	.word	0x81dd3411	! t0_kref+0x2aec:   	flush	%l4 - 0xbef
	.word	0xecde3fe8	! t0_kref+0x2af0:   	ldxa	[%i0 - 0x18]%asi, %l6
	.word	0xc368a04d	! t0_kref+0x2af4:   	prefetch	%g2 + 0x4d, 1
	.word	0xa3a0052d	! t0_kref+0x2af8:   	fsqrts	%f13, %f17
	.word	0xa1b40d8e	! t0_kref+0x2afc:   	fxor	%f16, %f14, %f16
	call	1f
	.empty
	.word	0xe280a03c	! t0_kref+0x2b04:   	lda	[%g2 + 0x3c]%asi, %l1
1:	.word	0xaa13400d	! t0_kref+0x2b08:   	or	%o5, %o5, %l5
	.word	0xaab3000c	! t0_kref+0x2b0c:   	orncc	%o4, %o4, %l5
	.word	0xe250a02e	! t0_kref+0x2b10:   	ldsh	[%g2 + 0x2e], %l1
	.word	0xd64e200a	! t0_kref+0x2b14:   	ldsb	[%i0 + 0xa], %o3
	.word	0x81834000	! t0_kref+0x2b18:   	wr	%o5, %g0, %y
	.word	0x94c33b74	! t0_kref+0x2b1c:   	addccc	%o4, -0x48c, %o2
	.word	0xd008a026	! t0_kref+0x2b20:   	ldub	[%g2 + 0x26], %o0
	.word	0xa744c000	! t0_kref+0x2b24:   	mov	%gsr, %l3
	.word	0xad408000	! t0_kref+0x2b28:   	mov	%ccr, %l6
	.word	0xdd380019	! t0_kref+0x2b2c:   	std	%f14, [%g0 + %i1]
	.word	0x2e800003	! t0_kref+0x2b30:   	bvs,a	_kref+0x2b3c
	.word	0xefe8a049	! t0_kref+0x2b34:   	prefetcha	%g2 + 0x49, 23
	.word	0x9da3084c	! t0_kref+0x2b38:   	faddd	%f12, %f12, %f14
	.word	0xee4e8019	! t0_kref+0x2b3c:   	ldsb	[%i2 + %i1], %l7
	.word	0x9de3bfa0	! t0_kref+0x2b40:   	save	%sp, -0x60, %sp
	.word	0x95ef7978	! t0_kref+0x2b44:   	restore	%i5, -0x688, %o2
	.word	0x94d3000d	! t0_kref+0x2b48:   	umulcc	%o4, %o5, %o2
	.word	0x9ba0052c	! t0_kref+0x2b4c:   	fsqrts	%f12, %f13
	.word	0x9fa4c832	! t0_kref+0x2b50:   	fadds	%f19, %f18, %f15
	.word	0x95b40a12	! t0_kref+0x2b54:   	fpadd16	%f16, %f18, %f10
	.word	0xea4e4000	! t0_kref+0x2b58:   	ldsb	[%i1], %l5
	.word	0x95b40aee	! t0_kref+0x2b5c:   	fpsub32s	%f16, %f14, %f10
	.word	0xda270019	! t0_kref+0x2b60:   	st	%o5, [%i4 + %i1]
	.word	0xa3b3432d	! t0_kref+0x2b64:   	bmask	%o5, %o5, %l1
	.word	0x95b38c8e	! t0_kref+0x2b68:   	fandnot2	%f14, %f14, %f10
	.word	0xa68b000d	! t0_kref+0x2b6c:   	andcc	%o4, %o5, %l3
	.word	0xe3ee101b	! t0_kref+0x2b70:   	prefetcha	%i0 + %i3, 17
	.word	0xa4f3400c	! t0_kref+0x2b74:   	udivcc	%o5, %o4, %l2
	.word	0x9fa44833	! t0_kref+0x2b78:   	fadds	%f17, %f19, %f15
	.word	0xd8b0a004	! t0_kref+0x2b7c:   	stha	%o4, [%g2 + 4]%asi
	.word	0xd080a03c	! t0_kref+0x2b80:   	lda	[%g2 + 0x3c]%asi, %o0
	.word	0xea7e3ffc	! t0_kref+0x2b84:   	swap	[%i0 - 4], %l5
	.word	0x9dab4052	! t0_kref+0x2b88:   	fmovdle	%fcc0, %f18, %f14
	.word	0x23800005	! t0_kref+0x2b8c:   	fbne,a	_kref+0x2ba0
	.word	0xa2a3000c	! t0_kref+0x2b90:   	subcc	%o4, %o4, %l1
	.word	0xad2b000c	! t0_kref+0x2b94:   	sll	%o4, %o4, %l6
	.word	0xea0e6014	! t0_kref+0x2b98:   	ldub	[%i1 + 0x14], %l5
	.word	0x8143c000	! t0_kref+0x2b9c:   	stbar
	.word	0x99a00550	! t0_kref+0x2ba0:   	fsqrtd	%f16, %f12
	.word	0xa69b2e27	! t0_kref+0x2ba4:   	xorcc	%o4, 0xe27, %l3
	.word	0x99a0188d	! t0_kref+0x2ba8:   	fitos	%f13, %f12
	.word	0xa1a4c931	! t0_kref+0x2bac:   	fmuls	%f19, %f17, %f16
	.word	0x921b6e65	! t0_kref+0x2bb0:   	xor	%o5, 0xe65, %o1
	.word	0x9db3c973	! t0_kref+0x2bb4:   	fpmerge	%f15, %f19, %f14
	.word	0x3a800001	! t0_kref+0x2bb8:   	bcc,a	_kref+0x2bbc
	.word	0xa62b2c92	! t0_kref+0x2bbc:   	andn	%o4, 0xc92, %l3
	.word	0x26800004	! t0_kref+0x2bc0:   	bl,a	_kref+0x2bd0
	.word	0xa6032775	! t0_kref+0x2bc4:   	add	%o4, 0x775, %l3
	.word	0xac0b3c58	! t0_kref+0x2bc8:   	and	%o4, -0x3a8, %l6
	.word	0xd64e6001	! t0_kref+0x2bcc:   	ldsb	[%i1 + 1], %o3
	.word	0xa5b2c973	! t0_kref+0x2bd0:   	fpmerge	%f11, %f19, %f18
	.word	0xea0e7fe1	! t0_kref+0x2bd4:   	ldub	[%i1 - 0x1f], %l5
	.word	0xa463225e	! t0_kref+0x2bd8:   	subc	%o4, 0x25e, %l2
	.word	0xac63000d	! t0_kref+0x2bdc:   	subc	%o4, %o5, %l6
	.word	0xa5b48d0e	! t0_kref+0x2be0:   	fandnot1	%f18, %f14, %f18
	.word	0x35480007	! t0_kref+0x2be4:   	fbue,a,pt	%fcc0, _kref+0x2c00
	.word	0xd51fbc08	! t0_kref+0x2be8:   	ldd	[%fp - 0x3f8], %f10
	.word	0xd4100019	! t0_kref+0x2bec:   	lduh	[%g0 + %i1], %o2
	.word	0xaeb3000d	! t0_kref+0x2bf0:   	orncc	%o4, %o5, %l7
	.word	0xaefb400d	! t0_kref+0x2bf4:   	sdivcc	%o5, %o5, %l7
	.word	0x28800001	! t0_kref+0x2bf8:   	bleu,a	_kref+0x2bfc
	.word	0xa7b30200	! t0_kref+0x2bfc:   	array8	%o4, %g0, %l3
	.word	0xa453000c	! t0_kref+0x2c00:   	umul	%o4, %o4, %l2
	.word	0x9da0102c	! t0_kref+0x2c04:   	fstox	%f12, %f14
	.word	0xd9be188d	! t0_kref+0x2c08:   	stda	%f12, [%i0 + %o5]0xc4
	.word	0x9fc10000	! t0_kref+0x2c0c:   	call	%g4
	.word	0x9db38e0e	! t0_kref+0x2c10:   	fand	%f14, %f14, %f14
	.word	0x91b30590	! t0_kref+0x2c14:   	fcmpgt32	%f12, %f16, %o0
	.word	0x81aacaaf	! t0_kref+0x2c18:   	fcmpes	%fcc0, %f11, %f15
	.word	0xe416c018	! t0_kref+0x2c1c:   	lduh	[%i3 + %i0], %l2
	.word	0xe40e200e	! t0_kref+0x2c20:   	ldub	[%i0 + 0xe], %l2
	.word	0x9db28f8e	! t0_kref+0x2c24:   	for	%f10, %f14, %f14
	.word	0x27480007	! t0_kref+0x2c28:   	fbul,a,pt	%fcc0, _kref+0x2c44
	.word	0xac83400c	! t0_kref+0x2c2c:   	addcc	%o5, %o4, %l6
	.word	0x9bb28daa	! t0_kref+0x2c30:   	fxors	%f10, %f10, %f13
	.word	0xaee3686d	! t0_kref+0x2c34:   	subccc	%o5, 0x86d, %l7
	.word	0xd820a008	! t0_kref+0x2c38:   	st	%o4, [%g2 + 8]
	.word	0xd5f6500d	! t0_kref+0x2c3c:   	casxa	[%i1]0x80, %o5, %o2
	.word	0xd19e1a1a	! t0_kref+0x2c40:   	ldda	[%i0 + %i2]0xd0, %f8
	.word	0x94fb6c39	! t0_kref+0x2c44:   	sdivcc	%o5, 0xc39, %o2
	.word	0xda26200c	! t0_kref+0x2c48:   	st	%o5, [%i0 + 0xc]
	.word	0xe01e3fe8	! t0_kref+0x2c4c:   	ldd	[%i0 - 0x18], %l0
	.word	0x99b009ab	! t0_kref+0x2c50:   	fexpand	%f11, %f12
	.word	0xd46e7fea	! t0_kref+0x2c54:   	ldstub	[%i1 - 0x16], %o2
	.word	0xa1a00530	! t0_kref+0x2c58:   	fsqrts	%f16, %f16
	.word	0x909b3a8d	! t0_kref+0x2c5c:   	xorcc	%o4, -0x573, %o0
	.word	0xd8f66008	! t0_kref+0x2c60:   	stxa	%o4, [%i1 + 8]%asi
	.word	0xa5b00cce	! t0_kref+0x2c64:   	fnot2	%f14, %f18
	.word	0x86102003	! t0_kref+0x2c68:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x2c6c:   	bne,a	_kref+0x2c6c
	.word	0x86a0e001	! t0_kref+0x2c70:   	subcc	%g3, 1, %g3
	.word	0x23800004	! t0_kref+0x2c74:   	fbne,a	_kref+0x2c84
	.word	0xd448a018	! t0_kref+0x2c78:   	ldsb	[%g2 + 0x18], %o2
	.word	0xa5b00fe0	! t0_kref+0x2c7c:   	fones	%f18
	.word	0xa783000c	! t0_kref+0x2c80:   	wr	%o4, %o4, %gsr
	.word	0xfdee101a	! t0_kref+0x2c84:   	prefetcha	%i0 + %i2, 30
	.word	0x95a00052	! t0_kref+0x2c88:   	fmovd	%f18, %f10
	.word	0x95702816	! t0_kref+0x2c8c:   	popc	0x816, %o2
	.word	0x95a000ad	! t0_kref+0x2c90:   	fnegs	%f13, %f10
	.word	0xe300a024	! t0_kref+0x2c94:   	ld	[%g2 + 0x24], %f17
	.word	0x95a2894a	! t0_kref+0x2c98:   	fmuld	%f10, %f10, %f10
	.word	0xae63764b	! t0_kref+0x2c9c:   	subc	%o5, -0x9b5, %l7
	.word	0x9db48f72	! t0_kref+0x2ca0:   	fornot1s	%f18, %f18, %f14
	.word	0xe51fbe50	! t0_kref+0x2ca4:   	ldd	[%fp - 0x1b0], %f18
	.word	0xe968a00a	! t0_kref+0x2ca8:   	prefetch	%g2 + 0xa, 20
	.word	0x9ba4082c	! t0_kref+0x2cac:   	fadds	%f16, %f12, %f13
	.word	0xe41e6000	! t0_kref+0x2cb0:   	ldd	[%i1], %l2
	.word	0xa2533ed5	! t0_kref+0x2cb4:   	umul	%o4, -0x12b, %l1
	.word	0xea5e3fe0	! t0_kref+0x2cb8:   	ldx	[%i0 - 0x20], %l5
	.word	0xe01e4000	! t0_kref+0x2cbc:   	ldd	[%i1], %l0
	.word	0xa5b00cca	! t0_kref+0x2cc0:   	fnot2	%f10, %f18
	.word	0x99a00533	! t0_kref+0x2cc4:   	fsqrts	%f19, %f12
	.word	0x3b480001	! t0_kref+0x2cc8:   	fble,a,pt	%fcc0, _kref+0x2ccc
	.word	0xd60e200d	! t0_kref+0x2ccc:   	ldub	[%i0 + 0xd], %o3
	.word	0x9da01a4a	! t0_kref+0x2cd0:   	fdtoi	%f10, %f14
	.word	0x968b7d70	! t0_kref+0x2cd4:   	andcc	%o5, -0x290, %o3
	.word	0xacb32384	! t0_kref+0x2cd8:   	orncc	%o4, 0x384, %l6
	.word	0xd53f4018	! t0_kref+0x2cdc:   	std	%f10, [%i5 + %i0]
	.word	0xec50a022	! t0_kref+0x2ce0:   	ldsh	[%g2 + 0x22], %l6
	.word	0x9013703c	! t0_kref+0x2ce4:   	or	%o5, -0xfc4, %o0
	.word	0xa5a0054c	! t0_kref+0x2ce8:   	fsqrtd	%f12, %f18
	.word	0xe2d0a034	! t0_kref+0x2cec:   	ldsha	[%g2 + 0x34]%asi, %l1
	.word	0xda26200c	! t0_kref+0x2cf0:   	st	%o5, [%i0 + 0xc]
	.word	0x973b400d	! t0_kref+0x2cf4:   	sra	%o5, %o5, %o3
	.word	0x99a0188b	! t0_kref+0x2cf8:   	fitos	%f11, %f12
	.word	0xd4961000	! t0_kref+0x2cfc:   	lduha	[%i0]0x80, %o2
	.word	0xa2fb6c44	! t0_kref+0x2d00:   	sdivcc	%o5, 0xc44, %l1
	.word	0xc16e400c	! t0_kref+0x2d04:   	prefetch	%i1 + %o4, 0
	.word	0xa1b34fae	! t0_kref+0x2d08:   	fors	%f13, %f14, %f16
	.word	0xacc37e52	! t0_kref+0x2d0c:   	addccc	%o5, -0x1ae, %l6
	.word	0x99a0052b	! t0_kref+0x2d10:   	fsqrts	%f11, %f12
	.word	0xa69b400d	! t0_kref+0x2d14:   	xorcc	%o5, %o5, %l3
	.word	0xd82e4000	! t0_kref+0x2d18:   	stb	%o4, [%i1]
	.word	0xe86e201c	! t0_kref+0x2d1c:   	ldstub	[%i0 + 0x1c], %l4
	.word	0xe848a010	! t0_kref+0x2d20:   	ldsb	[%g2 + 0x10], %l4
	.word	0xda30a028	! t0_kref+0x2d24:   	sth	%o5, [%g2 + 0x28]
	.word	0xe03e001d	! t0_kref+0x2d28:   	std	%l0, [%i0 + %i5]
	.word	0xa6fb64d7	! t0_kref+0x2d2c:   	sdivcc	%o5, 0x4d7, %l3
	.word	0x2c480007	! t0_kref+0x2d30:   	bneg,a,pt	%icc, _kref+0x2d4c
	.word	0x95a4492a	! t0_kref+0x2d34:   	fmuls	%f17, %f10, %f10
	.word	0xa7a4092f	! t0_kref+0x2d38:   	fmuls	%f16, %f15, %f19
	.word	0x81b01023	! t0_kref+0x2d3c:   	siam	0x3
	.word	0xe19e1a1d	! t0_kref+0x2d40:   	ldda	[%i0 + %i5]0xd0, %f16
	.word	0x27480006	! t0_kref+0x2d44:   	fbul,a,pt	%fcc0, _kref+0x2d5c
	.word	0xff6e001a	! t0_kref+0x2d48:   	prefetch	%i0 + %i2, 31
	.word	0xa1a0002d	! t0_kref+0x2d4c:   	fmovs	%f13, %f16
	.word	0xe07e3fe0	! t0_kref+0x2d50:   	swap	[%i0 - 0x20], %l0
	.word	0x9fa0188d	! t0_kref+0x2d54:   	fitos	%f13, %f15
	.word	0xee40a038	! t0_kref+0x2d58:   	ldsw	[%g2 + 0x38], %l7
	.word	0xacb3400c	! t0_kref+0x2d5c:   	orncc	%o5, %o4, %l6
	.word	0xd53e3ff0	! t0_kref+0x2d60:   	std	%f10, [%i0 - 0x10]
	.word	0x99a40852	! t0_kref+0x2d64:   	faddd	%f16, %f18, %f12
	.word	0x92c3685d	! t0_kref+0x2d68:   	addccc	%o5, 0x85d, %o1
	.word	0x9da0054a	! t0_kref+0x2d6c:   	fsqrtd	%f10, %f14
	.word	0xee4e401a	! t0_kref+0x2d70:   	ldsb	[%i1 + %i2], %l7
	.word	0xacb361e7	! t0_kref+0x2d74:   	orncc	%o5, 0x1e7, %l6
	.word	0x91b3000c	! t0_kref+0x2d78:   	edge8	%o4, %o4, %o0
	.word	0x9ba4092f	! t0_kref+0x2d7c:   	fmuls	%f16, %f15, %f13
	.word	0x97a4482e	! t0_kref+0x2d80:   	fadds	%f17, %f14, %f11
	.word	0x969b3a69	! t0_kref+0x2d84:   	xorcc	%o4, -0x597, %o3
	.word	0x95400000	! t0_kref+0x2d88:   	mov	%y, %o2
	.word	0x953b6017	! t0_kref+0x2d8c:   	sra	%o5, 0x17, %o2
	.word	0xe03e7fe8	! t0_kref+0x2d90:   	std	%l0, [%i1 - 0x18]
	.word	0x95a01a50	! t0_kref+0x2d94:   	fdtoi	%f16, %f10
	.word	0xa5b38f8a	! t0_kref+0x2d98:   	for	%f14, %f10, %f18
	.word	0xee8e2008	! t0_kref+0x2d9c:   	lduba	[%i0 + 8]%asi, %l7
	.word	0x81abca30	! t0_kref+0x2da0:   	fcmps	%fcc0, %f15, %f16
	.word	0x95a0054a	! t0_kref+0x2da4:   	fsqrtd	%f10, %f10
	.word	0xaac32d9f	! t0_kref+0x2da8:   	addccc	%o4, 0xd9f, %l5
	.word	0xe60e7fe0	! t0_kref+0x2dac:   	ldub	[%i1 - 0x20], %l3
	.word	0xa49b400d	! t0_kref+0x2db0:   	xorcc	%o5, %o5, %l2
	.word	0xd8200019	! t0_kref+0x2db4:   	st	%o4, [%g0 + %i1]
	.word	0xaf2b400c	! t0_kref+0x2db8:   	sll	%o5, %o4, %l7
	.word	0x99a00550	! t0_kref+0x2dbc:   	fsqrtd	%f16, %f12
	.word	0xa5a38850	! t0_kref+0x2dc0:   	faddd	%f14, %f16, %f18
	.word	0xadb34200	! t0_kref+0x2dc4:   	array8	%o5, %g0, %l6
	.word	0x9da0052e	! t0_kref+0x2dc8:   	fsqrts	%f14, %f14
	.word	0xa69b2049	! t0_kref+0x2dcc:   	xorcc	%o4, 0x49, %l3
	.word	0x81dce683	! t0_kref+0x2dd0:   	flush	%l3 + 0x683
	.word	0xa40b000d	! t0_kref+0x2dd4:   	and	%o4, %o5, %l2
	.word	0x940b400d	! t0_kref+0x2dd8:   	and	%o5, %o5, %o2
	.word	0x34800006	! t0_kref+0x2ddc:   	bg,a	_kref+0x2df4
	.word	0xab33600a	! t0_kref+0x2de0:   	srl	%o5, 0xa, %l5
	.word	0xd088a00c	! t0_kref+0x2de4:   	lduba	[%g2 + 0xc]%asi, %o0
	.word	0x9333400d	! t0_kref+0x2de8:   	srl	%o5, %o5, %o1
	.word	0xea6e3fe6	! t0_kref+0x2dec:   	ldstub	[%i0 - 0x1a], %l5
	.word	0xd0680019	! t0_kref+0x2df0:   	ldstub	[%g0 + %i1], %o0
	.word	0xa3a00033	! t0_kref+0x2df4:   	fmovs	%f19, %f17
	.word	0xe8680019	! t0_kref+0x2df8:   	ldstub	[%g0 + %i1], %l4
	.word	0x95b3014d	! t0_kref+0x2dfc:   	edge32l	%o4, %o5, %o2
	.word	0x91b300cc	! t0_kref+0x2e00:   	edge16l	%o4, %o4, %o0
	.word	0xa5a00550	! t0_kref+0x2e04:   	fsqrtd	%f16, %f18
	.word	0xd19e9a18	! t0_kref+0x2e08:   	ldda	[%i2 + %i0]0xd0, %f8
	.word	0xe36e7ff0	! t0_kref+0x2e0c:   	prefetch	%i1 - 0x10, 17
	.word	0x9293000d	! t0_kref+0x2e10:   	orcc	%o4, %o5, %o1
	.word	0x81ac8a4e	! t0_kref+0x2e14:   	fcmpd	%fcc0, %f18, %f14
	.word	0xa3b34200	! t0_kref+0x2e18:   	array8	%o5, %g0, %l1
	.word	0x9de3bfa0	! t0_kref+0x2e1c:   	save	%sp, -0x60, %sp
	.word	0xb0d6b7b9	! t0_kref+0x2e20:   	umulcc	%i2, -0x847, %i0
	.word	0xa3ef4018	! t0_kref+0x2e24:   	restore	%i5, %i0, %l1
	.word	0x9da34d2d	! t0_kref+0x2e28:   	fsmuld	%f13, %f13, %f14
	.word	0x95b3400c	! t0_kref+0x2e2c:   	edge8	%o5, %o4, %o2
	.word	0xd4162018	! t0_kref+0x2e30:   	lduh	[%i0 + 0x18], %o2
	.word	0xe03e3fe0	! t0_kref+0x2e34:   	std	%l0, [%i0 - 0x20]
	.word	0x95a00550	! t0_kref+0x2e38:   	fsqrtd	%f16, %f10
	.word	0x37800008	! t0_kref+0x2e3c:   	fbge,a	_kref+0x2e5c
	.word	0x9da408ce	! t0_kref+0x2e40:   	fsubd	%f16, %f14, %f14
	.word	0x99a01a4a	! t0_kref+0x2e44:   	fdtoi	%f10, %f12
	.word	0x99b28712	! t0_kref+0x2e48:   	fmuld8sux16	%f10, %f18, %f12
	.word	0x37800002	! t0_kref+0x2e4c:   	fbge,a	_kref+0x2e54
	.word	0x93b3400d	! t0_kref+0x2e50:   	edge8	%o5, %o5, %o1
	.word	0xae7b400d	! t0_kref+0x2e54:   	sdiv	%o5, %o5, %l7
	.word	0xa3a00032	! t0_kref+0x2e58:   	fmovs	%f18, %f17
	.word	0x31800004	! t0_kref+0x2e5c:   	fba,a	_kref+0x2e6c
	.word	0xaa83400c	! t0_kref+0x2e60:   	addcc	%o5, %o4, %l5
	.word	0xa2633145	! t0_kref+0x2e64:   	subc	%o4, -0xebb, %l1
	.word	0xe81e401d	! t0_kref+0x2e68:   	ldd	[%i1 + %i5], %l4
	.word	0x96c3400d	! t0_kref+0x2e6c:   	addccc	%o5, %o5, %o3
	.word	0x97b28a6c	! t0_kref+0x2e70:   	fpadd32s	%f10, %f12, %f11
	.word	0xa1b38fab	! t0_kref+0x2e74:   	fors	%f14, %f11, %f16
	.word	0xe6866004	! t0_kref+0x2e78:   	lda	[%i1 + 4]%asi, %l3
	.word	0x36800004	! t0_kref+0x2e7c:   	bge,a	_kref+0x2e8c
	.word	0x81ddc00c	! t0_kref+0x2e80:   	flush	%l7 + %o4
	.word	0x81aa8ab0	! t0_kref+0x2e84:   	fcmpes	%fcc0, %f10, %f16
	.word	0x96032382	! t0_kref+0x2e88:   	add	%o4, 0x382, %o3
	.word	0x99a00552	! t0_kref+0x2e8c:   	fsqrtd	%f18, %f12
	.word	0xe696d019	! t0_kref+0x2e90:   	lduha	[%i3 + %i1]0x80, %l3
	.word	0xdf00a000	! t0_kref+0x2e94:   	ld	[%g2], %f15
	.word	0xd4c8a00f	! t0_kref+0x2e98:   	ldsba	[%g2 + 0xf]%asi, %o2
	.word	0xe11e4000	! t0_kref+0x2e9c:   	ldd	[%i1], %f16
	.word	0xd9be580c	! t0_kref+0x2ea0:   	stda	%f12, [%i1 + %o4]0xc0
	.word	0x99a389ce	! t0_kref+0x2ea4:   	fdivd	%f14, %f14, %f12
	.word	0x8143c000	! t0_kref+0x2ea8:   	stbar
	.word	0xa42330ef	! t0_kref+0x2eac:   	sub	%o4, -0xf11, %l2
	.word	0xae73400c	! t0_kref+0x2eb0:   	udiv	%o5, %o4, %l7
	.word	0x97a288b1	! t0_kref+0x2eb4:   	fsubs	%f10, %f17, %f11
	.word	0x36800007	! t0_kref+0x2eb8:   	bge,a	_kref+0x2ed4
	.word	0x81da3b7b	! t0_kref+0x2ebc:   	flush	%o0 - 0x485
	.word	0xa1a28d2b	! t0_kref+0x2ec0:   	fsmuld	%f10, %f11, %f16
	.word	0x9da4092d	! t0_kref+0x2ec4:   	fmuls	%f16, %f13, %f14
	.word	0xa3400000	! t0_kref+0x2ec8:   	mov	%y, %l1
	.word	0x95a3884c	! t0_kref+0x2ecc:   	faddd	%f14, %f12, %f10
	.word	0xa3b48a32	! t0_kref+0x2ed0:   	fpadd16s	%f18, %f18, %f17
	.word	0x8d8368dc	! t0_kref+0x2ed4:   	wr	%o5, 0x8dc, %fprs
	.word	0xd1be588d	! t0_kref+0x2ed8:   	stda	%f8, [%i1 + %o5]0xc4
	.word	0xa1a8c04c	! t0_kref+0x2edc:   	fmovdul	%fcc0, %f12, %f16
	.word	0x9663000d	! t0_kref+0x2ee0:   	subc	%o4, %o5, %o3
	.word	0xea167ff4	! t0_kref+0x2ee4:   	lduh	[%i1 - 0xc], %l5
	.word	0xdd1fbf38	! t0_kref+0x2ee8:   	ldd	[%fp - 0xc8], %f14
	.word	0x81aa8a30	! t0_kref+0x2eec:   	fcmps	%fcc0, %f10, %f16
	.word	0xdd1fbf10	! t0_kref+0x2ef0:   	ldd	[%fp - 0xf0], %f14
	.word	0xa3a018d0	! t0_kref+0x2ef4:   	fdtos	%f16, %f17
	.word	0xd4160000	! t0_kref+0x2ef8:   	lduh	[%i0], %o2
	.word	0xa5b40d0e	! t0_kref+0x2efc:   	fandnot1	%f16, %f14, %f18
	.word	0xec1e6008	! t0_kref+0x2f00:   	ldd	[%i1 + 8], %l6
	.word	0xd8b0a022	! t0_kref+0x2f04:   	stha	%o4, [%g2 + 0x22]%asi
	.word	0xe780a004	! t0_kref+0x2f08:   	lda	[%g2 + 4]%asi, %f19
	.word	0x95a0188e	! t0_kref+0x2f0c:   	fitos	%f14, %f10
	.word	0xa3a00533	! t0_kref+0x2f10:   	fsqrts	%f19, %f17
	.word	0x2e800007	! t0_kref+0x2f14:   	bvs,a	_kref+0x2f30
	.word	0xd8200019	! t0_kref+0x2f18:   	st	%o4, [%g0 + %i1]
	.word	0x92b3400c	! t0_kref+0x2f1c:   	orncc	%o5, %o4, %o1
	.word	0xa1a00530	! t0_kref+0x2f20:   	fsqrts	%f16, %f16
	.word	0x97b3414d	! t0_kref+0x2f24:   	edge32l	%o5, %o5, %o3
	.word	0xec7f0019	! t0_kref+0x2f28:   	swap	[%i4 + %i1], %l6
	.word	0xd91e001d	! t0_kref+0x2f2c:   	ldd	[%i0 + %i5], %f12
	.word	0x25480004	! t0_kref+0x2f30:   	fblg,a,pt	%fcc0, _kref+0x2f40
	.word	0x99a0054a	! t0_kref+0x2f34:   	fsqrtd	%f10, %f12
	.word	0x37800002	! t0_kref+0x2f38:   	fbge,a	_kref+0x2f40
	.word	0xdd1f4018	! t0_kref+0x2f3c:   	ldd	[%i5 + %i0], %f14
	.word	0xf9ee501b	! t0_kref+0x2f40:   	prefetcha	%i1 + %i3, 28
	.word	0xa1a40932	! t0_kref+0x2f44:   	fmuls	%f16, %f18, %f16
	.word	0xd2d0a016	! t0_kref+0x2f48:   	ldsha	[%g2 + 0x16]%asi, %o1
	.word	0xa1a01893	! t0_kref+0x2f4c:   	fitos	%f19, %f16
	.word	0xa1b2866b	! t0_kref+0x2f50:   	fmul8x16au	%f10, %f11, %f16
	.word	0xa9b3016c	! t0_kref+0x2f54:   	edge32ln	%o4, %o4, %l4
	.word	0x95a48d2f	! t0_kref+0x2f58:   	fsmuld	%f18, %f15, %f10
	.word	0xea0e7fe0	! t0_kref+0x2f5c:   	ldub	[%i1 - 0x20], %l5
	.word	0xd688a02f	! t0_kref+0x2f60:   	lduba	[%g2 + 0x2f]%asi, %o3
	.word	0xa1a0054a	! t0_kref+0x2f64:   	fsqrtd	%f10, %f16
	.word	0x95b40630	! t0_kref+0x2f68:   	fmul8x16	%f16, %f16, %f10
	.word	0xec1e4000	! t0_kref+0x2f6c:   	ldd	[%i1], %l6
	.word	0xa1a00552	! t0_kref+0x2f70:   	fsqrtd	%f18, %f16
	.word	0xe40e3ffd	! t0_kref+0x2f74:   	ldub	[%i0 - 3], %l2
	.word	0xe678001c	! t0_kref+0x2f78:   	swap	[%g0 + %i4], %l3
	.word	0xe0380019	! t0_kref+0x2f7c:   	std	%l0, [%g0 + %i1]
	.word	0xe2160000	! t0_kref+0x2f80:   	lduh	[%i0], %l1
	.word	0xaec37c5b	! t0_kref+0x2f84:   	addccc	%o5, -0x3a5, %l7
	.word	0xa4ab3ace	! t0_kref+0x2f88:   	andncc	%o4, -0x532, %l2
	.word	0x932b000c	! t0_kref+0x2f8c:   	sll	%o4, %o4, %o1
	.word	0xa5a28952	! t0_kref+0x2f90:   	fmuld	%f10, %f18, %f18
	.word	0x952b000c	! t0_kref+0x2f94:   	sll	%o4, %o4, %o2
	.word	0xe67e2008	! t0_kref+0x2f98:   	swap	[%i0 + 8], %l3
	.word	0x9fc10000	! t0_kref+0x2f9c:   	call	%g4
	.word	0xe27e3ffc	! t0_kref+0x2fa0:   	swap	[%i0 - 4], %l1
	.word	0x3b800008	! t0_kref+0x2fa4:   	fble,a	_kref+0x2fc4
	.word	0x91b300ad	! t0_kref+0x2fa8:   	edge16n	%o4, %o5, %o0
	.word	0x9673000d	! t0_kref+0x2fac:   	udiv	%o4, %o5, %o3
	.word	0xe780a020	! t0_kref+0x2fb0:   	lda	[%g2 + 0x20]%asi, %f19
	.word	0x8d8321db	! t0_kref+0x2fb4:   	wr	%o4, 0x1db, %fprs
	.word	0xa5b4098c	! t0_kref+0x2fb8:   	bshuffle	%f16, %f12, %f18
	.word	0x9ba3882b	! t0_kref+0x2fbc:   	fadds	%f14, %f11, %f13
	.word	0x9ba0002e	! t0_kref+0x2fc0:   	fmovs	%f14, %f13
	.word	0x39800002	! t0_kref+0x2fc4:   	fbuge,a	_kref+0x2fcc
	.word	0xa1a40d2d	! t0_kref+0x2fc8:   	fsmuld	%f16, %f13, %f16
	.word	0xee166016	! t0_kref+0x2fcc:   	lduh	[%i1 + 0x16], %l7
	.word	0x9da0054a	! t0_kref+0x2fd0:   	fsqrtd	%f10, %f14
	.word	0xd04e4000	! t0_kref+0x2fd4:   	ldsb	[%i1], %o0
	.word	0x9de3bfa0	! t0_kref+0x2fd8:   	save	%sp, -0x60, %sp
	.word	0xbabe3391	! t0_kref+0x2fdc:   	xnorcc	%i0, -0xc6f, %i5
	.word	0xade80019	! t0_kref+0x2fe0:   	restore	%g0, %i1, %l6
	.word	0x9db3090e	! t0_kref+0x2fe4:   	faligndata	%f12, %f14, %f14
	.word	0x95a0052d	! t0_kref+0x2fe8:   	fsqrts	%f13, %f10
	.word	0x81b01022	! t0_kref+0x2fec:   	siam	0x2
	.word	0xa1b48a0e	! t0_kref+0x2ff0:   	fpadd16	%f18, %f14, %f16
	.word	0x960b000c	! t0_kref+0x2ff4:   	and	%o4, %o4, %o3
	.word	0x9de3bfa0	! t0_kref+0x2ff8:   	save	%sp, -0x60, %sp
	.word	0xbb0f401c	! t0_kref+0x2ffc:   	tsubcc	%i5, %i4, %i5
	.word	0xa7eec018	! t0_kref+0x3000:   	restore	%i3, %i0, %l3
	.word	0xe56e001d	! t0_kref+0x3004:   	prefetch	%i0 + %i5, 18
	.word	0x95a0188c	! t0_kref+0x3008:   	fitos	%f12, %f10
	.word	0x92c3400c	! t0_kref+0x300c:   	addccc	%o5, %o4, %o1
	.word	0xadb340cd	! t0_kref+0x3010:   	edge16l	%o5, %o5, %l6
	.word	0xa1a00552	! t0_kref+0x3014:   	fsqrtd	%f18, %f16
	.word	0xd08e9040	! t0_kref+0x3018:   	lduba	[%i2]0x82, %o0
	.word	0xa533200c	! t0_kref+0x301c:   	srl	%o4, 0xc, %l2
	.word	0xe406401c	! t0_kref+0x3020:   	ld	[%i1 + %i4], %l2
	.word	0xe648a021	! t0_kref+0x3024:   	ldsb	[%g2 + 0x21], %l3
	.word	0x95b009aa	! t0_kref+0x3028:   	fexpand	%f10, %f10
	.word	0x9613400c	! t0_kref+0x302c:   	or	%o5, %o4, %o3
	.word	0xa5b3074e	! t0_kref+0x3030:   	fpack32	%f12, %f14, %f18
	.word	0xa5a4884a	! t0_kref+0x3034:   	faddd	%f18, %f10, %f18
	.word	0x3b480006	! t0_kref+0x3038:   	fble,a,pt	%fcc0, _kref+0x3050
	.word	0x91400000	! t0_kref+0x303c:   	mov	%y, %o0
	.word	0xe1be188d	! t0_kref+0x3040:   	stda	%f16, [%i0 + %o5]0xc4
	.word	0x99a00552	! t0_kref+0x3044:   	fsqrtd	%f18, %f12
	.word	0x81ac0aaa	! t0_kref+0x3048:   	fcmpes	%fcc0, %f16, %f10
	.word	0x97a30833	! t0_kref+0x304c:   	fadds	%f12, %f19, %f11
	.word	0xe2c8a03d	! t0_kref+0x3050:   	ldsba	[%g2 + 0x3d]%asi, %l1
	.word	0xaa23000c	! t0_kref+0x3054:   	sub	%o4, %o4, %l5
	.word	0xe47e001c	! t0_kref+0x3058:   	swap	[%i0 + %i4], %l2
	.word	0x3d800006	! t0_kref+0x305c:   	fbule,a	_kref+0x3074
	.word	0xa3b3cd60	! t0_kref+0x3060:   	fnot1s	%f15, %f17
	.word	0xa72b200f	! t0_kref+0x3064:   	sll	%o4, 0xf, %l3
	.word	0xdd1fbe90	! t0_kref+0x3068:   	ldd	[%fp - 0x170], %f14
	.word	0xae73000d	! t0_kref+0x306c:   	udiv	%o4, %o5, %l7
	.word	0xec180019	! t0_kref+0x3070:   	ldd	[%g0 + %i1], %l6
	.word	0xd51fbc10	! t0_kref+0x3074:   	ldd	[%fp - 0x3f0], %f10
	.word	0x9093400d	! t0_kref+0x3078:   	orcc	%o5, %o5, %o0
	.word	0x81db0017	! t0_kref+0x307c:   	flush	%o4 + %l7
	.word	0xa1b40e80	! t0_kref+0x3080:   	fsrc1	%f16, %f16
	.word	0xe5380018	! t0_kref+0x3084:   	std	%f18, [%g0 + %i0]
	.word	0xa5b3000d	! t0_kref+0x3088:   	edge8	%o4, %o5, %l2
	.word	0xaefb400c	! t0_kref+0x308c:   	sdivcc	%o5, %o4, %l7
	.word	0xd780a014	! t0_kref+0x3090:   	lda	[%g2 + 0x14]%asi, %f11
	.word	0x973b400c	! t0_kref+0x3094:   	sra	%o5, %o4, %o3
	.word	0x920375a9	! t0_kref+0x3098:   	add	%o5, -0xa57, %o1
	.word	0x81ab8aac	! t0_kref+0x309c:   	fcmpes	%fcc0, %f14, %f12
	.word	0xd00e4000	! t0_kref+0x30a0:   	ldub	[%i1], %o0
	.word	0xe248a01d	! t0_kref+0x30a4:   	ldsb	[%g2 + 0x1d], %l1
	.word	0xe0680018	! t0_kref+0x30a8:   	ldstub	[%g0 + %i0], %l0
	.word	0x95a0054c	! t0_kref+0x30ac:   	fsqrtd	%f12, %f10
	.word	0xa5a40952	! t0_kref+0x30b0:   	fmuld	%f16, %f18, %f18
	.word	0x9263400d	! t0_kref+0x30b4:   	subc	%o5, %o5, %o1
	.word	0xd0c8a015	! t0_kref+0x30b8:   	ldsba	[%g2 + 0x15]%asi, %o0
	.word	0x81834000	! t0_kref+0x30bc:   	wr	%o5, %g0, %y
	.word	0xae63255c	! t0_kref+0x30c0:   	subc	%o4, 0x55c, %l7
	.word	0x9ba01890	! t0_kref+0x30c4:   	fitos	%f16, %f13
	.word	0x95a000ad	! t0_kref+0x30c8:   	fnegs	%f13, %f10
	.word	0xd51fbf58	! t0_kref+0x30cc:   	ldd	[%fp - 0xa8], %f10
	.word	0xac73000c	! t0_kref+0x30d0:   	udiv	%o4, %o4, %l6
	.word	0xea4e8019	! t0_kref+0x30d4:   	ldsb	[%i2 + %i1], %l5
	.word	0x22800006	! t0_kref+0x30d8:   	be,a	_kref+0x30f0
	.word	0x94fb000d	! t0_kref+0x30dc:   	sdivcc	%o4, %o5, %o2
	.word	0xd9be1000	! t0_kref+0x30e0:   	stda	%f12, [%i0]0x80
	.word	0x949b000d	! t0_kref+0x30e4:   	xorcc	%o4, %o5, %o2
	.word	0x9ba2c82e	! t0_kref+0x30e8:   	fadds	%f11, %f14, %f13
	.word	0xa1b009ad	! t0_kref+0x30ec:   	fexpand	%f13, %f16
	.word	0x33800004	! t0_kref+0x30f0:   	fbe,a	_kref+0x3100
	.word	0xe0be6018	! t0_kref+0x30f4:   	stda	%l0, [%i1 + 0x18]%asi
	.word	0xfb6e6018	! t0_kref+0x30f8:   	prefetch	%i1 + 0x18, 29
	.word	0xa7b007b2	! t0_kref+0x30fc:   	fpackfix	%f18, %f19
	.word	0xea5e3fe8	! t0_kref+0x3100:   	ldx	[%i0 - 0x18], %l5
	.word	0x3b480007	! t0_kref+0x3104:   	fble,a,pt	%fcc0, _kref+0x3120
	.word	0x81dec017	! t0_kref+0x3108:   	flush	%i3 + %l7
	.word	0xf0182ff0	! t0_kref+0x310c:   	ldd	[%g0 + 0xff0], %i0
	.word	0xec46401c	! t0_kref+0x3110:   	ldsw	[%i1 + %i4], %l6
	.word	0xd2466000	! t0_kref+0x3114:   	ldsw	[%i1], %o1
	.word	0xf3ee501c	! t0_kref+0x3118:   	prefetcha	%i1 + %i4, 25
	.word	0xac33000c	! t0_kref+0x311c:   	orn	%o4, %o4, %l6
	.word	0x95a0054c	! t0_kref+0x3120:   	fsqrtd	%f12, %f10
	.word	0xa20b000d	! t0_kref+0x3124:   	and	%o4, %o5, %l1
	.word	0xdd9e7ff8	! t0_kref+0x3128:   	ldda	[%i1 - 8]%asi, %f14
	.word	0xe81e3ff8	! t0_kref+0x312c:   	ldd	[%i0 - 8], %l4
	.word	0xea88a007	! t0_kref+0x3130:   	lduba	[%g2 + 7]%asi, %l5
	.word	0x95a4884c	! t0_kref+0x3134:   	faddd	%f18, %f12, %f10
	.word	0xa6c372d1	! t0_kref+0x3138:   	addccc	%o5, -0xd2f, %l3
	.word	0x23800004	! t0_kref+0x313c:   	fbne,a	_kref+0x314c
	.word	0x97a3c92f	! t0_kref+0x3140:   	fmuls	%f15, %f15, %f11
	.word	0xe20e200f	! t0_kref+0x3144:   	ldub	[%i0 + 0xf], %l1
	.word	0xa6a3400d	! t0_kref+0x3148:   	subcc	%o5, %o5, %l3
	.word	0xa7b30200	! t0_kref+0x314c:   	array8	%o4, %g0, %l3
	.word	0x81b01025	! t0_kref+0x3150:   	siam	0x5
	.word	0x90b37025	! t0_kref+0x3154:   	orncc	%o5, -0xfdb, %o0
	.word	0xa423400c	! t0_kref+0x3158:   	sub	%o5, %o4, %l2
	.word	0x9da2c82f	! t0_kref+0x315c:   	fadds	%f11, %f15, %f14
	.word	0x9493400d	! t0_kref+0x3160:   	orcc	%o5, %o5, %o2
	.word	0xe03e4000	! t0_kref+0x3164:   	std	%l0, [%i1]
	.word	0xae232e43	! t0_kref+0x3168:   	sub	%o4, 0xe43, %l7
	.word	0x95a0054a	! t0_kref+0x316c:   	fsqrtd	%f10, %f10
	.word	0x9ba4092f	! t0_kref+0x3170:   	fmuls	%f16, %f15, %f13
	call	SYM(t0_subr0)
	.word	0x90a338f6	! t0_kref+0x3178:   	subcc	%o4, -0x70a, %o0
	.word	0x92fb000c	! t0_kref+0x317c:   	sdivcc	%o4, %o4, %o1
	.word	0xd87e7fe0	! t0_kref+0x3180:   	swap	[%i1 - 0x20], %o4
	.word	0x99a0054e	! t0_kref+0x3184:   	fsqrtd	%f14, %f12
	.word	0x9473000d	! t0_kref+0x3188:   	udiv	%o4, %o5, %o2
	.word	0xdb80a01c	! t0_kref+0x318c:   	lda	[%g2 + 0x1c]%asi, %f13
	.word	0xec6e4000	! t0_kref+0x3190:   	ldstub	[%i1], %l6
	.word	0xd5380019	! t0_kref+0x3194:   	std	%f10, [%g0 + %i1]
	.word	0x9da01932	! t0_kref+0x3198:   	fstod	%f18, %f14
	.word	0xa1a0054c	! t0_kref+0x319c:   	fsqrtd	%f12, %f16
	.word	0xe2163fe4	! t0_kref+0x31a0:   	lduh	[%i0 - 0x1c], %l1
	.word	0xa7a01a4a	! t0_kref+0x31a4:   	fdtoi	%f10, %f19
	call	SYM(t0_subr3)
	.word	0x9ba0002b	! t0_kref+0x31ac:   	fmovs	%f11, %f13
	.word	0xf76e001b	! t0_kref+0x31b0:   	prefetch	%i0 + %i3, 27
	.word	0x92b3000c	! t0_kref+0x31b4:   	orncc	%o4, %o4, %o1
	.word	0xe03e6008	! t0_kref+0x31b8:   	std	%l0, [%i1 + 8]
	.word	0x99a3c930	! t0_kref+0x31bc:   	fmuls	%f15, %f16, %f12
	.word	0x3d800006	! t0_kref+0x31c0:   	fbule,a	_kref+0x31d8
	.word	0xa213400d	! t0_kref+0x31c4:   	or	%o5, %o5, %l1
	.word	0xafb34280	! t0_kref+0x31c8:   	array32	%o5, %g0, %l7
	.word	0xec4e3fea	! t0_kref+0x31cc:   	ldsb	[%i0 - 0x16], %l6
	.word	0xa3b2ca2f	! t0_kref+0x31d0:   	fpadd16s	%f11, %f15, %f17
	.word	0xa4fb66f2	! t0_kref+0x31d4:   	sdivcc	%o5, 0x6f2, %l2
	.word	0x969b000d	! t0_kref+0x31d8:   	xorcc	%o4, %o5, %o3
	.word	0x9ba00533	! t0_kref+0x31dc:   	fsqrts	%f19, %f13
	.word	0x81ac8ab2	! t0_kref+0x31e0:   	fcmpes	%fcc0, %f18, %f18
	.word	0x95b340ec	! t0_kref+0x31e4:   	edge16ln	%o5, %o4, %o2
	.word	0x2b480003	! t0_kref+0x31e8:   	fbug,a,pt	%fcc0, _kref+0x31f4
	.word	0xc76e3fe0	! t0_kref+0x31ec:   	prefetch	%i0 - 0x20, 3
	.word	0xa1a0052e	! t0_kref+0x31f0:   	fsqrts	%f14, %f16
	.word	0x86102014	! t0_kref+0x31f4:   	mov	0x14, %g3
	.word	0x86a0e001	! t0_kref+0x31f8:   	subcc	%g3, 1, %g3
	.word	0x2280001a	! t0_kref+0x31fc:   	be,a	_kref+0x3264
	.word	0xa8537b79	! t0_kref+0x3200:   	umul	%o5, -0x487, %l4
	.word	0xe100a00c	! t0_kref+0x3204:   	ld	[%g2 + 0xc], %f16
	.word	0x30800005	! t0_kref+0x3208:   	ba,a	_kref+0x321c
	.word	0x94fb400d	! t0_kref+0x320c:   	sdivcc	%o5, %o5, %o2
	.word	0x23bffffa	! t0_kref+0x3210:   	fbne,a	_kref+0x31f8
	.word	0x95a3084a	! t0_kref+0x3214:   	faddd	%f12, %f10, %f10
	.word	0x972b000c	! t0_kref+0x3218:   	sll	%o4, %o4, %o3
	.word	0xa1a01a4e	! t0_kref+0x321c:   	fdtoi	%f14, %f16
	.word	0xa2ab221a	! t0_kref+0x3220:   	andncc	%o4, 0x21a, %l1
	.word	0xa7a0052a	! t0_kref+0x3224:   	fsqrts	%f10, %f19
	.word	0xaa1372ef	! t0_kref+0x3228:   	or	%o5, -0xd11, %l5
	.word	0xa3a0052f	! t0_kref+0x322c:   	fsqrts	%f15, %f17
	.word	0xa3a2882d	! t0_kref+0x3230:   	fadds	%f10, %f13, %f17
	.word	0xea064000	! t0_kref+0x3234:   	ld	[%i1], %l5
	.word	0xa5b009ad	! t0_kref+0x3238:   	fexpand	%f13, %f18
	.word	0xd8200019	! t0_kref+0x323c:   	st	%o4, [%g0 + %i1]
	.word	0xae0b29df	! t0_kref+0x3240:   	and	%o4, 0x9df, %l7
	.word	0xabb3000c	! t0_kref+0x3244:   	edge8	%o4, %o4, %l5
	.word	0xd830a03a	! t0_kref+0x3248:   	sth	%o4, [%g2 + 0x3a]
	.word	0xd9be180c	! t0_kref+0x324c:   	stda	%f12, [%i0 + %o4]0xc0
	.word	0xd828a023	! t0_kref+0x3250:   	stb	%o4, [%g2 + 0x23]
	.word	0x95a00550	! t0_kref+0x3254:   	fsqrtd	%f16, %f10
	.word	0xe53f4019	! t0_kref+0x3258:   	std	%f18, [%i5 + %i1]
	.word	0x95a00031	! t0_kref+0x325c:   	fmovs	%f17, %f10
	.word	0x81ac8acc	! t0_kref+0x3260:   	fcmped	%fcc0, %f18, %f12
	.word	0x83414000	! t0_kref+0x3264:   	mov	%pc, %g1
	.word	0xa33b600e	! t0_kref+0x3268:   	sra	%o5, 0xe, %l1
	.word	0xe1be188c	! t0_kref+0x326c:   	stda	%f16, [%i0 + %o4]0xc4
	.word	0xd6070019	! t0_kref+0x3270:   	ld	[%i4 + %i1], %o3
	.word	0xad400000	! t0_kref+0x3274:   	mov	%y, %l6
	.word	0xc56e400c	! t0_kref+0x3278:   	prefetch	%i1 + %o4, 2
	.word	0xe780a020	! t0_kref+0x327c:   	lda	[%g2 + 0x20]%asi, %f19
	.word	0xd46e4000	! t0_kref+0x3280:   	ldstub	[%i1], %o2
	.word	0xaf2b6002	! t0_kref+0x3284:   	sll	%o5, 0x2, %l7
	.word	0x26800007	! t0_kref+0x3288:   	bl,a	_kref+0x32a4
	.word	0xa5b2c96f	! t0_kref+0x328c:   	fpmerge	%f11, %f15, %f18
	.word	0x99a0054e	! t0_kref+0x3290:   	fsqrtd	%f14, %f12
	.word	0x81acca31	! t0_kref+0x3294:   	fcmps	%fcc0, %f19, %f17
	.word	0xa5a00552	! t0_kref+0x3298:   	fsqrtd	%f18, %f18
	.word	0xacc33aa2	! t0_kref+0x329c:   	addccc	%o4, -0x55e, %l6
	.word	0x2d800006	! t0_kref+0x32a0:   	fbg,a	_kref+0x32b8
	.word	0x9db30e80	! t0_kref+0x32a4:   	fsrc1	%f12, %f14
	.word	0x29800001	! t0_kref+0x32a8:   	fbl,a	_kref+0x32ac
	.word	0xfd6e3ff8	! t0_kref+0x32ac:   	prefetch	%i0 - 8, 30
	.word	0xa28b400d	! t0_kref+0x32b0:   	andcc	%o5, %o5, %l1
	.word	0xe03e7fe8	! t0_kref+0x32b4:   	std	%l0, [%i1 - 0x18]
	.word	0xdaf75018	! t0_kref+0x32b8:   	stxa	%o5, [%i5 + %i0]0x80
	.word	0xa3a01a4a	! t0_kref+0x32bc:   	fdtoi	%f10, %f17
	.word	0xa1a00530	! t0_kref+0x32c0:   	fsqrts	%f16, %f16
	.word	0x973b6000	! t0_kref+0x32c4:   	sra	%o5, 0x0, %o3
	.word	0xa5b3000d	! t0_kref+0x32c8:   	edge8	%o4, %o5, %l2
	.word	0x86102004	! t0_kref+0x32cc:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x32d0:   	bne,a	_kref+0x32d0
	.word	0x86a0e001	! t0_kref+0x32d4:   	subcc	%g3, 1, %g3
	.word	0x81ac4a2c	! t0_kref+0x32d8:   	fcmps	%fcc0, %f17, %f12
	.word	0x99b40d0a	! t0_kref+0x32dc:   	fandnot1	%f16, %f10, %f12
	.word	0xaf400000	! t0_kref+0x32e0:   	mov	%y, %l7
	.word	0xa8b3400d	! t0_kref+0x32e4:   	orncc	%o5, %o5, %l4
	.word	0xaa6329bc	! t0_kref+0x32e8:   	subc	%o4, 0x9bc, %l5
	.word	0xa5a3c933	! t0_kref+0x32ec:   	fmuls	%f15, %f19, %f18
	.word	0xa92b200f	! t0_kref+0x32f0:   	sll	%o4, 0xf, %l4
	.word	0xec070019	! t0_kref+0x32f4:   	ld	[%i4 + %i1], %l6
	.word	0x86102003	! t0_kref+0x32f8:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x32fc:   	bne,a	_kref+0x32fc
	.word	0x86a0e001	! t0_kref+0x3300:   	subcc	%g3, 1, %g3
	.word	0x8d83400c	! t0_kref+0x3304:   	wr	%o5, %o4, %fprs
	.word	0xa53b2006	! t0_kref+0x3308:   	sra	%o4, 0x6, %l2
	.word	0xd8a0a00c	! t0_kref+0x330c:   	sta	%o4, [%g2 + 0xc]%asi
	.word	0x9053000d	! t0_kref+0x3310:   	umul	%o4, %o5, %o0
	.word	0xae73224b	! t0_kref+0x3314:   	udiv	%o4, 0x24b, %l7
	.word	0x9673000d	! t0_kref+0x3318:   	udiv	%o4, %o5, %o3
	.word	0xda2e4000	! t0_kref+0x331c:   	stb	%o5, [%i1]
	.word	0xa7a0052a	! t0_kref+0x3320:   	fsqrts	%f10, %f19
	.word	0x972b2019	! t0_kref+0x3324:   	sll	%o4, 0x19, %o3
	.word	0x24800002	! t0_kref+0x3328:   	ble,a	_kref+0x3330
	.word	0x97a018d2	! t0_kref+0x332c:   	fdtos	%f18, %f11
	.word	0x9de3bfa0	! t0_kref+0x3330:   	save	%sp, -0x60, %sp
	.word	0xafee001b	! t0_kref+0x3334:   	restore	%i0, %i3, %l7
	.word	0x97b3016c	! t0_kref+0x3338:   	edge32ln	%o4, %o4, %o3
	.word	0xd8b63fe0	! t0_kref+0x333c:   	stha	%o4, [%i0 - 0x20]%asi
	.word	0xe16e401a	! t0_kref+0x3340:   	prefetch	%i1 + %i2, 16
	.word	0x9fc00004	! t0_kref+0x3344:   	call	%g0 + %g4
	.word	0xacfb400c	! t0_kref+0x3348:   	sdivcc	%o5, %o4, %l6
	.word	0xe1be5a5d	! t0_kref+0x334c:   	stda	%f16, [%i1 + %i5]0xd2
	.word	0xda267fe0	! t0_kref+0x3350:   	st	%o5, [%i1 - 0x20]
	.word	0xac73400c	! t0_kref+0x3354:   	udiv	%o5, %o4, %l6
	.word	0xa7b00fe0	! t0_kref+0x3358:   	fones	%f19
	.word	0x97b2cea0	! t0_kref+0x335c:   	fsrc1s	%f11, %f11
	.word	0xa5a4cd31	! t0_kref+0x3360:   	fsmuld	%f19, %f17, %f18
	.word	0x81ac4a32	! t0_kref+0x3364:   	fcmps	%fcc0, %f17, %f18
	.word	0xae5320f0	! t0_kref+0x3368:   	umul	%o4, 0xf0, %l7
	.word	0x95b30d40	! t0_kref+0x336c:   	fnot1	%f12, %f10
	.word	0xa5a00532	! t0_kref+0x3370:   	fsqrts	%f18, %f18
	.word	0xd04e7fe6	! t0_kref+0x3374:   	ldsb	[%i1 - 0x1a], %o0
	.word	0xa5a34d2f	! t0_kref+0x3378:   	fsmuld	%f13, %f15, %f18
	.word	0x95a01932	! t0_kref+0x337c:   	fstod	%f18, %f10
	.word	0x9170000c	! t0_kref+0x3380:   	popc	%o4, %o0
	.word	0x8143c000	! t0_kref+0x3384:   	stbar
	.word	0x99a00531	! t0_kref+0x3388:   	fsqrts	%f17, %f12
	.word	0x26800008	! t0_kref+0x338c:   	bl,a	_kref+0x33ac
	.word	0xda264000	! t0_kref+0x3390:   	st	%o5, [%i1]
	.word	0x95a0054a	! t0_kref+0x3394:   	fsqrtd	%f10, %f10
	.word	0x9fc10000	! t0_kref+0x3398:   	call	%g4
	.word	0xe01f4019	! t0_kref+0x339c:   	ldd	[%i5 + %i1], %l0
	.word	0xe6062014	! t0_kref+0x33a0:   	ld	[%i0 + 0x14], %l3
	.word	0xa7400000	! t0_kref+0x33a4:   	mov	%y, %l3
	.word	0xe6062008	! t0_kref+0x33a8:   	ld	[%i0 + 8], %l3
	.word	0x95a3882a	! t0_kref+0x33ac:   	fadds	%f14, %f10, %f10
	.word	0xeade101d	! t0_kref+0x33b0:   	ldxa	[%i0 + %i5]0x80, %l5
	.word	0x920b000d	! t0_kref+0x33b4:   	and	%o4, %o5, %o1
	.word	0x9de3bfa0	! t0_kref+0x33b8:   	save	%sp, -0x60, %sp
	.word	0x97ef001a	! t0_kref+0x33bc:   	restore	%i4, %i2, %o3
	.word	0xdd1fbf50	! t0_kref+0x33c0:   	ldd	[%fp - 0xb0], %f14
	.word	0x97b40d2d	! t0_kref+0x33c4:   	fandnot1s	%f16, %f13, %f11
	.word	0x9db38ed0	! t0_kref+0x33c8:   	fornot2	%f14, %f16, %f14
	.word	0x3d480003	! t0_kref+0x33cc:   	fbule,a,pt	%fcc0, _kref+0x33d8
	.word	0xe8c8a037	! t0_kref+0x33d0:   	ldsba	[%g2 + 0x37]%asi, %l4
	.word	0x2b800004	! t0_kref+0x33d4:   	fbug,a	_kref+0x33e4
	.word	0xa5b38e80	! t0_kref+0x33d8:   	fsrc1	%f14, %f18
	.word	0x26480001	! t0_kref+0x33dc:   	bl,a,pt	%icc, _kref+0x33e0
	.word	0xdd3e4000	! t0_kref+0x33e0:   	std	%f14, [%i1]
	.word	0x95a0104e	! t0_kref+0x33e4:   	fdtox	%f14, %f10
	.word	0x87802082	! t0_kref+0x33e8:   	mov	0x82, %asi
	.word	0x9733400d	! t0_kref+0x33ec:   	srl	%o5, %o5, %o3
	.word	0xa1a00550	! t0_kref+0x33f0:   	fsqrtd	%f16, %f16
	.word	0xa7400000	! t0_kref+0x33f4:   	mov	%y, %l3
	.word	0x9733600e	! t0_kref+0x33f8:   	srl	%o5, 0xe, %o3
	.word	0x95b3034d	! t0_kref+0x33fc:   	alignaddrl	%o4, %o5, %o2
	.word	0x95a3c932	! t0_kref+0x3400:   	fmuls	%f15, %f18, %f10
	.word	0xe28e9018	! t0_kref+0x3404:   	lduba	[%i2 + %i0]0x80, %l1
	.word	0xd53e7ff0	! t0_kref+0x3408:   	std	%f10, [%i1 - 0x10]
	.word	0xa2037c90	! t0_kref+0x340c:   	add	%o5, -0x370, %l1
	.word	0x26480001	! t0_kref+0x3410:   	bl,a,pt	%icc, _kref+0x3414
	.word	0xc6003bdc	! t0_kref+0x3414:   	ld	[%g0 - 0x424], %g3
	.word	0x99b3470e	! t0_kref+0x3418:   	fmuld8sux16	%f13, %f14, %f12
	.word	0x8143c000	! t0_kref+0x341c:   	stbar
	.word	0xe06e200f	! t0_kref+0x3420:   	ldstub	[%i0 + 0xf], %l0
	.word	0xd53e3ff0	! t0_kref+0x3424:   	std	%f10, [%i0 - 0x10]
	.word	0x95b00ccc	! t0_kref+0x3428:   	fnot2	%f12, %f10
	.word	0xa46379e4	! t0_kref+0x342c:   	subc	%o5, -0x61c, %l2
	.word	0x95b48e80	! t0_kref+0x3430:   	fsrc1	%f18, %f10
	.word	0x99a38950	! t0_kref+0x3434:   	fmuld	%f14, %f16, %f12
	.word	0x95b0076c	! t0_kref+0x3438:   	fpack16	%f12, %f10
	.word	0x81ab0ab0	! t0_kref+0x343c:   	fcmpes	%fcc0, %f12, %f16
	.word	0xdd3f4019	! t0_kref+0x3440:   	std	%f14, [%i5 + %i1]
	.word	0xa5a00552	! t0_kref+0x3444:   	fsqrtd	%f18, %f18
	.word	0x2f480007	! t0_kref+0x3448:   	fbu,a,pt	%fcc0, _kref+0x3464
	.word	0xe11f4019	! t0_kref+0x344c:   	ldd	[%i5 + %i1], %f16
	.word	0x9161a2c5	! t0_kref+0x3450:   	movg	%fcc0, 0x2c5, %o0
	.word	0xec0e8018	! t0_kref+0x3454:   	ldub	[%i2 + %i0], %l6
	.word	0x35800001	! t0_kref+0x3458:   	fbue,a	_kref+0x345c
	.word	0xe11e401d	! t0_kref+0x345c:   	ldd	[%i1 + %i5], %f16
	.word	0x972b400c	! t0_kref+0x3460:   	sll	%o5, %o4, %o3
	.word	0xabb3004c	! t0_kref+0x3464:   	edge8l	%o4, %o4, %l5
	.word	0xec1e6000	! t0_kref+0x3468:   	ldd	[%i1], %l6
	.word	0x907b6a47	! t0_kref+0x346c:   	sdiv	%o5, 0xa47, %o0
	.word	0xe20e3fed	! t0_kref+0x3470:   	ldub	[%i0 - 0x13], %l1
	.word	0xd820a03c	! t0_kref+0x3474:   	st	%o4, [%g2 + 0x3c]
	.word	0xd93e6000	! t0_kref+0x3478:   	std	%f12, [%i1]
	.word	0x21800007	! t0_kref+0x347c:   	fbn,a	_kref+0x3498
	.word	0x973b400d	! t0_kref+0x3480:   	sra	%o5, %o5, %o3
	.word	0xacc3400d	! t0_kref+0x3484:   	addccc	%o5, %o5, %l6
	.word	0xab400000	! t0_kref+0x3488:   	mov	%y, %l5
	.word	0xf36e001d	! t0_kref+0x348c:   	prefetch	%i0 + %i5, 25
	.word	0x92a3400c	! t0_kref+0x3490:   	subcc	%o5, %o4, %o1
	.word	0xae7b3572	! t0_kref+0x3494:   	sdiv	%o4, -0xa8e, %l7
	.word	0xe7f6500c	! t0_kref+0x3498:   	casxa	[%i1]0x80, %o4, %l3
	.word	0xabb3404c	! t0_kref+0x349c:   	edge8l	%o5, %o4, %l5
	.word	0x95400000	! t0_kref+0x34a0:   	mov	%y, %o2
	.word	0xa5b38f73	! t0_kref+0x34a4:   	fornot1s	%f14, %f19, %f18
	.word	0x973b000d	! t0_kref+0x34a8:   	sra	%o4, %o5, %o3
	.word	0x9493400d	! t0_kref+0x34ac:   	orcc	%o5, %o5, %o2
	.word	0x9361a416	! t0_kref+0x34b0:   	movg	%fcc0, -0x3ea, %o1
	.word	0xe2000018	! t0_kref+0x34b4:   	ld	[%g0 + %i0], %l1
	.word	0xd1f6100c	! t0_kref+0x34b8:   	casxa	[%i0]0x80, %o4, %o0
	.word	0x8610200d	! t0_kref+0x34bc:   	mov	0xd, %g3
	.word	0x86a0e001	! t0_kref+0x34c0:   	subcc	%g3, 1, %g3
	.word	0x22800012	! t0_kref+0x34c4:   	be,a	_kref+0x350c
	.word	0x9db40e0c	! t0_kref+0x34c8:   	fand	%f16, %f12, %f14
	.word	0xee6e6004	! t0_kref+0x34cc:   	ldstub	[%i1 + 4], %l7
	.word	0x95a0052a	! t0_kref+0x34d0:   	fsqrts	%f10, %f10
	.word	0xad2b000d	! t0_kref+0x34d4:   	sll	%o4, %o5, %l6
	.word	0x27bffffa	! t0_kref+0x34d8:   	fbul,a	_kref+0x34c0
	.word	0x99a488ce	! t0_kref+0x34dc:   	fsubd	%f18, %f14, %f12
	.word	0xd408a016	! t0_kref+0x34e0:   	ldub	[%g2 + 0x16], %o2
	.word	0xa78335ce	! t0_kref+0x34e4:   	wr	%o4, 0xfffff5ce, %gsr
	.word	0xabb3402d	! t0_kref+0x34e8:   	edge8n	%o5, %o5, %l5
	.word	0xf16e3ff0	! t0_kref+0x34ec:   	prefetch	%i0 - 0x10, 24
	.word	0x9db28a52	! t0_kref+0x34f0:   	fpadd32	%f10, %f18, %f14
	.word	0xabb340ed	! t0_kref+0x34f4:   	edge16ln	%o5, %o5, %l5
	.word	0x81dfe692	! t0_kref+0x34f8:   	flush	%i7 + 0x692
	.word	0xafb28590	! t0_kref+0x34fc:   	fcmpgt32	%f10, %f16, %l7
	.word	0xacb3000d	! t0_kref+0x3500:   	orncc	%o4, %o5, %l6
	.word	0x9da3884c	! t0_kref+0x3504:   	faddd	%f14, %f12, %f14
	.word	0x9ba408b2	! t0_kref+0x3508:   	fsubs	%f16, %f18, %f13
	.word	0xe03e3ff0	! t0_kref+0x350c:   	std	%l0, [%i0 - 0x10]
	.word	0xe700a014	! t0_kref+0x3510:   	ld	[%g2 + 0x14], %f19
	.word	0xa5a94050	! t0_kref+0x3514:   	fmovdug	%fcc0, %f16, %f18
	.word	0x9db30a6d	! t0_kref+0x3518:   	fpadd32s	%f12, %f13, %f14
	.word	0xee16001b	! t0_kref+0x351c:   	lduh	[%i0 + %i3], %l7
	.word	0xa92b400d	! t0_kref+0x3520:   	sll	%o5, %o5, %l4
	.word	0xd1be1a1a	! t0_kref+0x3524:   	stda	%f8, [%i0 + %i2]0xd0
	.word	0xa3a4492c	! t0_kref+0x3528:   	fmuls	%f17, %f12, %f17
	.word	0xacfb000c	! t0_kref+0x352c:   	sdivcc	%o4, %o4, %l6
	.word	0x2b800005	! t0_kref+0x3530:   	fbug,a	_kref+0x3544
	.word	0x9da8004e	! t0_kref+0x3534:   	fmovdn	%fcc0, %f14, %f14
	.word	0x952b2014	! t0_kref+0x3538:   	sll	%o4, 0x14, %o2
	.word	0xee50a00c	! t0_kref+0x353c:   	ldsh	[%g2 + 0xc], %l7
	.word	0xa1a2884c	! t0_kref+0x3540:   	faddd	%f10, %f12, %f16
	.word	0x9613251a	! t0_kref+0x3544:   	or	%o4, 0x51a, %o3
	.word	0x973b400c	! t0_kref+0x3548:   	sra	%o5, %o4, %o3
	.word	0xadb3004c	! t0_kref+0x354c:   	edge8l	%o4, %o4, %l6
	.word	0x9de3bfa0	! t0_kref+0x3550:   	save	%sp, -0x60, %sp
	.word	0xbab832f2	! t0_kref+0x3554:   	xnorcc	%g0, -0xd0e, %i5
	.word	0x95eebd43	! t0_kref+0x3558:   	restore	%i2, -0x2bd, %o2
	.word	0x99b00ced	! t0_kref+0x355c:   	fnot2s	%f13, %f12
	.word	0xa3a4092a	! t0_kref+0x3560:   	fmuls	%f16, %f10, %f17
	.word	0xacc32c81	! t0_kref+0x3564:   	addccc	%o4, 0xc81, %l6
	.word	0x99a9004a	! t0_kref+0x3568:   	fmovdl	%fcc0, %f10, %f12
	.word	0xc168a004	! t0_kref+0x356c:   	prefetch	%g2 + 4, 0
	.word	0xaf2b600e	! t0_kref+0x3570:   	sll	%o5, 0xe, %l7
	.word	0xaaab72fb	! t0_kref+0x3574:   	andncc	%o5, -0xd05, %l5
	.word	0x9db28f92	! t0_kref+0x3578:   	for	%f10, %f18, %f14
	.word	0x9663000d	! t0_kref+0x357c:   	subc	%o4, %o5, %o3
	.word	0x92b37d48	! t0_kref+0x3580:   	orncc	%o5, -0x2b8, %o1
	.word	0x94db000c	! t0_kref+0x3584:   	smulcc	%o4, %o4, %o2
	.word	0x9ba01892	! t0_kref+0x3588:   	fitos	%f18, %f13
	.word	0x9013000d	! t0_kref+0x358c:   	or	%o4, %o5, %o0
	.word	0x95a00550	! t0_kref+0x3590:   	fsqrtd	%f16, %f10
	.word	0x95a3894a	! t0_kref+0x3594:   	fmuld	%f14, %f10, %f10
	.word	0xa7a0188d	! t0_kref+0x3598:   	fitos	%f13, %f19
	.word	0xa7a000b2	! t0_kref+0x359c:   	fnegs	%f18, %f19
	.word	0xa3a0052c	! t0_kref+0x35a0:   	fsqrts	%f12, %f17
	.word	0xa8932e7d	! t0_kref+0x35a4:   	orcc	%o4, 0xe7d, %l4
	.word	0x97a2c830	! t0_kref+0x35a8:   	fadds	%f11, %f16, %f11
	.word	0xa7a0002d	! t0_kref+0x35ac:   	fmovs	%f13, %f19
	.word	0xd7e6500c	! t0_kref+0x35b0:   	casa	[%i1]0x80, %o4, %o3
	.word	0xe6166018	! t0_kref+0x35b4:   	lduh	[%i1 + 0x18], %l3
	.word	0x97b3016d	! t0_kref+0x35b8:   	edge32ln	%o4, %o5, %o3
	.word	0xad400000	! t0_kref+0x35bc:   	mov	%y, %l6
	.word	0xd648a02c	! t0_kref+0x35c0:   	ldsb	[%g2 + 0x2c], %o3
	.word	0xe408a01c	! t0_kref+0x35c4:   	ldub	[%g2 + 0x1c], %l2
	.word	0xaaa326c9	! t0_kref+0x35c8:   	subcc	%o4, 0x6c9, %l5
	.word	0xa5b48d40	! t0_kref+0x35cc:   	fnot1	%f18, %f18
	.word	0x23800004	! t0_kref+0x35d0:   	fbne,a	_kref+0x35e0
	.word	0xd250a01e	! t0_kref+0x35d4:   	ldsh	[%g2 + 0x1e], %o1
	.word	0x31480005	! t0_kref+0x35d8:   	fba,a,pt	%fcc0, _kref+0x35ec
	.word	0x99a00550	! t0_kref+0x35dc:   	fsqrtd	%f16, %f12
	.word	0x91b3400c	! t0_kref+0x35e0:   	edge8	%o5, %o4, %o0
	.word	0x97b3010c	! t0_kref+0x35e4:   	edge32	%o4, %o4, %o3
	.word	0xd9be188c	! t0_kref+0x35e8:   	stda	%f12, [%i0 + %o4]0xc4
	.word	0xda20a018	! t0_kref+0x35ec:   	st	%o5, [%g2 + 0x18]
	.word	0x9263400c	! t0_kref+0x35f0:   	subc	%o5, %o4, %o1
	.word	0xe9f6100d	! t0_kref+0x35f4:   	casxa	[%i0]0x80, %o5, %l4
	.word	0xabb340ad	! t0_kref+0x35f8:   	edge16n	%o5, %o5, %l5
	.word	0xa4733519	! t0_kref+0x35fc:   	udiv	%o4, -0xae7, %l2
	.word	0x8610200f	! t0_kref+0x3600:   	mov	0xf, %g3
	.word	0x86a0e001	! t0_kref+0x3604:   	subcc	%g3, 1, %g3
	.word	0x2280001b	! t0_kref+0x3608:   	be,a	_kref+0x3674
	.word	0xa9408000	! t0_kref+0x360c:   	mov	%ccr, %l4
	.word	0xa2b360dd	! t0_kref+0x3610:   	orncc	%o5, 0xdd, %l1
	.word	0x99a000d0	! t0_kref+0x3614:   	fnegd	%f16, %f12
	.word	0xe2060000	! t0_kref+0x3618:   	ld	[%i0], %l1
	.word	0xe100a010	! t0_kref+0x361c:   	ld	[%g2 + 0x10], %f16
	.word	0xe56e7fe0	! t0_kref+0x3620:   	prefetch	%i1 - 0x20, 18
	.word	0x9fa2892a	! t0_kref+0x3624:   	fmuls	%f10, %f10, %f15
	.word	0x94436e93	! t0_kref+0x3628:   	addc	%o5, 0xe93, %o2
	.word	0xd67e3fe0	! t0_kref+0x362c:   	swap	[%i0 - 0x20], %o3
	.word	0xe19e1a1c	! t0_kref+0x3630:   	ldda	[%i0 + %i4]0xd0, %f16
	.word	0x81834000	! t0_kref+0x3634:   	wr	%o5, %g0, %y
	.word	0xf028001a	! t0_kref+0x3638:   	stb	%i0, [%g0 + %i2]
	.word	0xab336002	! t0_kref+0x363c:   	srl	%o5, 0x2, %l5
	.word	0xa3a3892a	! t0_kref+0x3640:   	fmuls	%f14, %f10, %f17
	.word	0x97b30a73	! t0_kref+0x3644:   	fpadd32s	%f12, %f19, %f11
	.word	0xd2080019	! t0_kref+0x3648:   	ldub	[%g0 + %i1], %o1
	.word	0xe608a001	! t0_kref+0x364c:   	ldub	[%g2 + 1], %l3
	.word	0x97a4092b	! t0_kref+0x3650:   	fmuls	%f16, %f11, %f11
	.word	0xd8260000	! t0_kref+0x3654:   	st	%o4, [%i0]
	.word	0x9db4066e	! t0_kref+0x3658:   	fmul8x16au	%f16, %f14, %f14
	.word	0xe68e1000	! t0_kref+0x365c:   	lduba	[%i0]0x80, %l3
	.word	0xda20a000	! t0_kref+0x3660:   	st	%o5, [%g2]
	.word	0xa2c3000c	! t0_kref+0x3664:   	addccc	%o4, %o4, %l1
	.word	0x9fa00531	! t0_kref+0x3668:   	fsqrts	%f17, %f15
	.word	0x35480008	! t0_kref+0x366c:   	fbue,a,pt	%fcc0, _kref+0x368c
	.word	0xec08a02b	! t0_kref+0x3670:   	ldub	[%g2 + 0x2b], %l6
	.word	0x81aa8a52	! t0_kref+0x3674:   	fcmpd	%fcc0, %f10, %f18
	.word	0x95b286ec	! t0_kref+0x3678:   	fmul8ulx16	%f10, %f12, %f10
	.word	0x92b3000c	! t0_kref+0x367c:   	orncc	%o4, %o4, %o1
	.word	0xe03e3fe8	! t0_kref+0x3680:   	std	%l0, [%i0 - 0x18]
	.word	0x9db48aec	! t0_kref+0x3684:   	fpsub32s	%f18, %f12, %f14
	.word	0xaeb33fee	! t0_kref+0x3688:   	orncc	%o4, -0x12, %l7
	.word	0xa570000d	! t0_kref+0x368c:   	popc	%o5, %l2
	.word	0xad3b400c	! t0_kref+0x3690:   	sra	%o5, %o4, %l6
	.word	0x25800002	! t0_kref+0x3694:   	fblg,a	_kref+0x369c
	.word	0x81dc2eb8	! t0_kref+0x3698:   	flush	%l0 + 0xeb8
	.word	0xac7b400d	! t0_kref+0x369c:   	sdiv	%o5, %o5, %l6
	.word	0xee5e2018	! t0_kref+0x36a0:   	ldx	[%i0 + 0x18], %l7
	.word	0xb6103ffc	! t0_kref+0x36a4:   	mov	0xfffffffc, %i3
	.word	0xa3a01a4c	! t0_kref+0x36a8:   	fdtoi	%f12, %f17
	.word	0x35800008	! t0_kref+0x36ac:   	fbue,a	_kref+0x36cc
	.word	0x92c36cc3	! t0_kref+0x36b0:   	addccc	%o5, 0xcc3, %o1
	.word	0x8d8326c5	! t0_kref+0x36b4:   	wr	%o4, 0x6c5, %fprs
	.word	0x81ab8a31	! t0_kref+0x36b8:   	fcmps	%fcc0, %f14, %f17
	.word	0x99b28e0a	! t0_kref+0x36bc:   	fand	%f10, %f10, %f12
	.word	0xe320a020	! t0_kref+0x36c0:   	st	%f17, [%g2 + 0x20]
	.word	0xa1a4094a	! t0_kref+0x36c4:   	fmuld	%f16, %f10, %f16
	.word	0xa5a00031	! t0_kref+0x36c8:   	fmovs	%f17, %f18
	.word	0x81aacaaf	! t0_kref+0x36cc:   	fcmpes	%fcc0, %f11, %f15
	.word	0xad408000	! t0_kref+0x36d0:   	mov	%ccr, %l6
	.word	0xc768a049	! t0_kref+0x36d4:   	prefetch	%g2 + 0x49, 3
	.word	0xa8b3400d	! t0_kref+0x36d8:   	orncc	%o5, %o5, %l4
	.word	0x39480002	! t0_kref+0x36dc:   	fbuge,a,pt	%fcc0, _kref+0x36e4
	.word	0x99b009af	! t0_kref+0x36e0:   	fexpand	%f15, %f12
	.word	0xfb6e001d	! t0_kref+0x36e4:   	prefetch	%i0 + %i5, 29
	.word	0xa5a4884c	! t0_kref+0x36e8:   	faddd	%f18, %f12, %f18
	.word	0xc068a00e	! t0_kref+0x36ec:   	ldstub	[%g2 + 0xe], %g0
	.word	0xd51e6008	! t0_kref+0x36f0:   	ldd	[%i1 + 8], %f10
	.word	0xe11e4000	! t0_kref+0x36f4:   	ldd	[%i1], %f16
	.word	0xa1b48a4c	! t0_kref+0x36f8:   	fpadd32	%f18, %f12, %f16
	.word	0xdbf6100d	! t0_kref+0x36fc:   	casxa	[%i0]0x80, %o5, %o5
	.word	0x9fc10000	! t0_kref+0x3700:   	call	%g4
	.word	0xad2b400d	! t0_kref+0x3704:   	sll	%o5, %o5, %l6
	.word	0x95b4040a	! t0_kref+0x3708:   	fcmple16	%f16, %f10, %o2
	.word	0xe7f6100d	! t0_kref+0x370c:   	casxa	[%i0]0x80, %o5, %l3
	.word	0xd1beda59	! t0_kref+0x3710:   	stda	%f8, [%i3 + %i1]0xd2
	.word	0xec06001c	! t0_kref+0x3714:   	ld	[%i0 + %i4], %l6
	.word	0x2c800004	! t0_kref+0x3718:   	bneg,a	_kref+0x3728
	.word	0x9073000c	! t0_kref+0x371c:   	udiv	%o4, %o4, %o0
	.word	0xd248a011	! t0_kref+0x3720:   	ldsb	[%g2 + 0x11], %o1
	.word	0xc807bfe8	! t0_kref+0x3724:   	ld	[%fp - 0x18], %g4
	.word	0xd010a020	! t0_kref+0x3728:   	lduh	[%g2 + 0x20], %o0
	.word	0x23800008	! t0_kref+0x372c:   	fbne,a	_kref+0x374c
	.word	0xd000a008	! t0_kref+0x3730:   	ld	[%g2 + 8], %o0
	.word	0xd826600c	! t0_kref+0x3734:   	st	%o4, [%i1 + 0xc]
	.word	0xab3b400c	! t0_kref+0x3738:   	sra	%o5, %o4, %l5
	.word	0xc9ee100d	! t0_kref+0x373c:   	prefetcha	%i0 + %o5, 4
	.word	0x3d800001	! t0_kref+0x3740:   	fbule,a	_kref+0x3744
	.word	0x97a01891	! t0_kref+0x3744:   	fitos	%f17, %f11
	.word	0x23800002	! t0_kref+0x3748:   	fbne,a	_kref+0x3750
	.word	0x95b3ceed	! t0_kref+0x374c:   	fornot2s	%f15, %f13, %f10
	.word	0xc07f0019	! t0_kref+0x3750:   	swap	[%i4 + %i1], %g0
	.word	0x21480004	! t0_kref+0x3754:   	fbn,a,pt	%fcc0, _kref+0x3764
	.word	0xd448a024	! t0_kref+0x3758:   	ldsb	[%g2 + 0x24], %o2
	.word	0xa3b4cab1	! t0_kref+0x375c:   	fpsub16s	%f19, %f17, %f17
	.word	0xaa7b3565	! t0_kref+0x3760:   	sdiv	%o4, -0xa9b, %l5
	.word	0x91400000	! t0_kref+0x3764:   	mov	%y, %o0
	.word	0x9db00fc0	! t0_kref+0x3768:   	fone	%f14
	.word	0xd7a01019	! t0_kref+0x376c:   	sta	%f11, [%g0 + %i1]0x80
	.word	0x001fffff	! t0_kref+0x3770:   	illtrap	0x1fffff
	.word	0xee0e2016	! t0_kref+0x3774:   	ldub	[%i0 + 0x16], %l7
	.word	0xd51e3ff8	! t0_kref+0x3778:   	ldd	[%i0 - 8], %f10
	.word	0xa3400000	! t0_kref+0x377c:   	mov	%y, %l1
	.word	0xe88e1000	! t0_kref+0x3780:   	lduba	[%i0]0x80, %l4
	.word	0xdd3e401d	! t0_kref+0x3784:   	std	%f14, [%i1 + %i5]
	.word	0xa32b600a	! t0_kref+0x3788:   	sll	%o5, 0xa, %l1
	.word	0xdbe6100c	! t0_kref+0x378c:   	casa	[%i0]0x80, %o4, %o5
	.word	0xec50a024	! t0_kref+0x3790:   	ldsh	[%g2 + 0x24], %l6
	.word	0x86102001	! t0_kref+0x3794:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x3798:   	bne,a	_kref+0x3798
	.word	0x86a0e001	! t0_kref+0x379c:   	subcc	%g3, 1, %g3
	.word	0xa5b28dd0	! t0_kref+0x37a0:   	fnand	%f10, %f16, %f18
	.word	0x9fc10000	! t0_kref+0x37a4:   	call	%g4
	.word	0xa29b22ae	! t0_kref+0x37a8:   	xorcc	%o4, 0x2ae, %l1
	.word	0x35480003	! t0_kref+0x37ac:   	fbue,a,pt	%fcc0, _kref+0x37b8
	.word	0x900b000c	! t0_kref+0x37b0:   	and	%o4, %o4, %o0
	.word	0xee48a02f	! t0_kref+0x37b4:   	ldsb	[%g2 + 0x2f], %l7
	.word	0x21800003	! t0_kref+0x37b8:   	fbn,a	_kref+0x37c4
	.word	0x99a0052e	! t0_kref+0x37bc:   	fsqrts	%f14, %f12
	.word	0xaafb7ada	! t0_kref+0x37c0:   	sdivcc	%o5, -0x526, %l5
	.word	0x96733c48	! t0_kref+0x37c4:   	udiv	%o4, -0x3b8, %o3
	.word	0x81abcab3	! t0_kref+0x37c8:   	fcmpes	%fcc0, %f15, %f19
	.word	0xeade5000	! t0_kref+0x37cc:   	ldxa	[%i1]0x80, %l5
	.word	0xa5b28990	! t0_kref+0x37d0:   	bshuffle	%f10, %f16, %f18
	.word	0xa1a0054e	! t0_kref+0x37d4:   	fsqrtd	%f14, %f16
	.word	0xec1e2010	! t0_kref+0x37d8:   	ldd	[%i0 + 0x10], %l6
	.word	0xd408a002	! t0_kref+0x37dc:   	ldub	[%g2 + 2], %o2
	.word	0xd2000018	! t0_kref+0x37e0:   	ld	[%g0 + %i0], %o1
	.word	0xa8b32eea	! t0_kref+0x37e4:   	orncc	%o4, 0xeea, %l4
	.word	0x95a0188c	! t0_kref+0x37e8:   	fitos	%f12, %f10
	.word	0x151eb46c	! t0_kref+0x37ec:   	sethi	%hi(0x7ad1b000), %o2
	.word	0xe4100018	! t0_kref+0x37f0:   	lduh	[%g0 + %i0], %l2
	.word	0xea50a02c	! t0_kref+0x37f4:   	ldsh	[%g2 + 0x2c], %l5
	.word	0xe608a023	! t0_kref+0x37f8:   	ldub	[%g2 + 0x23], %l3
	.word	0xa7a018d0	! t0_kref+0x37fc:   	fdtos	%f16, %f19
	.word	0xea162000	! t0_kref+0x3800:   	lduh	[%i0], %l5
	.word	0xd53e2008	! t0_kref+0x3804:   	std	%f10, [%i0 + 8]
	.word	0x95a01a2a	! t0_kref+0x3808:   	fstoi	%f10, %f10
	.word	0xaa0b000d	! t0_kref+0x380c:   	and	%o4, %o5, %l5
	.word	0xa533400c	! t0_kref+0x3810:   	srl	%o5, %o4, %l2
	.word	0x93b340ac	! t0_kref+0x3814:   	edge16n	%o5, %o4, %o1
	.word	0xd2df5018	! t0_kref+0x3818:   	ldxa	[%i5 + %i0]0x80, %o1
	.word	0x9fc00004	! t0_kref+0x381c:   	call	%g0 + %g4
	.word	0xa1b28ab2	! t0_kref+0x3820:   	fpsub16s	%f10, %f18, %f16
	.word	0x8143c000	! t0_kref+0x3824:   	stbar
	.word	0xe1be1a1b	! t0_kref+0x3828:   	stda	%f16, [%i0 + %i3]0xd0
	.word	0x86102008	! t0_kref+0x382c:   	mov	0x8, %g3
	.word	0x86a0e001	! t0_kref+0x3830:   	subcc	%g3, 1, %g3
	.word	0x2280001f	! t0_kref+0x3834:   	be,a	_kref+0x38b0
	.word	0xda270019	! t0_kref+0x3838:   	st	%o5, [%i4 + %i1]
	.word	0x9da0012e	! t0_kref+0x383c:   	fabss	%f14, %f14
	.word	0xa8836e9d	! t0_kref+0x3840:   	addcc	%o5, 0xe9d, %l4
	.word	0x34800001	! t0_kref+0x3844:   	bg,a	_kref+0x3848
	.word	0x95a0002a	! t0_kref+0x3848:   	fmovs	%f10, %f10
	.word	0x9da01890	! t0_kref+0x384c:   	fitos	%f16, %f14
	.word	0xfbee501a	! t0_kref+0x3850:   	prefetcha	%i1 + %i2, 29
	.word	0xa53b000c	! t0_kref+0x3854:   	sra	%o4, %o4, %l2
	.word	0x95a0192f	! t0_kref+0x3858:   	fstod	%f15, %f10
	.word	0xaa0361dc	! t0_kref+0x385c:   	add	%o5, 0x1dc, %l5
	.word	0x2f480008	! t0_kref+0x3860:   	fbu,a,pt	%fcc0, _kref+0x3880
	.word	0xa5a00533	! t0_kref+0x3864:   	fsqrts	%f19, %f18
	.word	0x99a0054e	! t0_kref+0x3868:   	fsqrtd	%f14, %f12
	.word	0xa8fb400d	! t0_kref+0x386c:   	sdivcc	%o5, %o5, %l4
	call	SYM(t0_subr1)
	.word	0xe07f0019	! t0_kref+0x3874:   	swap	[%i4 + %i1], %l0
	.word	0xaab33902	! t0_kref+0x3878:   	orncc	%o4, -0x6fe, %l5
	.word	0x922b000c	! t0_kref+0x387c:   	andn	%o4, %o4, %o1
	.word	0x99b40d40	! t0_kref+0x3880:   	fnot1	%f16, %f12
	.word	0xee000018	! t0_kref+0x3884:   	ld	[%g0 + %i0], %l7
	.word	0xec1e2018	! t0_kref+0x3888:   	ldd	[%i0 + 0x18], %l6
	.word	0xa5a01a4c	! t0_kref+0x388c:   	fdtoi	%f12, %f18
	.word	0xdab01019	! t0_kref+0x3890:   	stha	%o5, [%g0 + %i1]0x80
	.word	0xd250a018	! t0_kref+0x3894:   	ldsh	[%g2 + 0x18], %o1
	.word	0x2f800007	! t0_kref+0x3898:   	fbu,a	_kref+0x38b4
	.word	0xd07e200c	! t0_kref+0x389c:   	swap	[%i0 + 0xc], %o0
	.word	0xd6000019	! t0_kref+0x38a0:   	ld	[%g0 + %i1], %o3
	.word	0x960b000d	! t0_kref+0x38a4:   	and	%o4, %o5, %o3
	.word	0xa3a01a52	! t0_kref+0x38a8:   	fdtoi	%f18, %f17
	.word	0xd5200019	! t0_kref+0x38ac:   	st	%f10, [%g0 + %i1]
	.word	0xa5a0054a	! t0_kref+0x38b0:   	fsqrtd	%f10, %f18
	.word	0xa6a32122	! t0_kref+0x38b4:   	subcc	%o4, 0x122, %l3
	.word	0xae8b400c	! t0_kref+0x38b8:   	andcc	%o5, %o4, %l7
	.word	0xda30a03c	! t0_kref+0x38bc:   	sth	%o5, [%g2 + 0x3c]
	call	1f
	.empty
	.word	0x9fa0188c	! t0_kref+0x38c4:   	fitos	%f12, %f15
	.word	0xe206601c	! t0_kref+0x38c8:   	ld	[%i1 + 0x1c], %l1
	.word	0x25800005	! t0_kref+0x38cc:   	fblg,a	_kref+0x38e0
	.word	0x95b00fe0	! t0_kref+0x38d0:   	fones	%f10
1:	.word	0xd900a02c	! t0_kref+0x38d4:   	ld	[%g2 + 0x2c], %f12
	.word	0xd700a030	! t0_kref+0x38d8:   	ld	[%g2 + 0x30], %f11
	.word	0x8143c000	! t0_kref+0x38dc:   	stbar
	.word	0xd8267ff4	! t0_kref+0x38e0:   	st	%o4, [%i1 - 0xc]
	.word	0xa5b28ad0	! t0_kref+0x38e4:   	fpsub32	%f10, %f16, %f18
	.word	0x95a0192f	! t0_kref+0x38e8:   	fstod	%f15, %f10
	.word	0xa263000d	! t0_kref+0x38ec:   	subc	%o4, %o5, %l1
	.word	0x27480007	! t0_kref+0x38f0:   	fbul,a,pt	%fcc0, _kref+0x390c
	.word	0x97b38ab1	! t0_kref+0x38f4:   	fpsub16s	%f14, %f17, %f11
	.word	0xcd0032a4	! t0_kref+0x38f8:   	ld	[%g0 - 0xd5c], %f6
	.word	0xa1a0052b	! t0_kref+0x38fc:   	fsqrts	%f11, %f16
	.word	0x37800004	! t0_kref+0x3900:   	fbge,a	_kref+0x3910
	.word	0x9da0188f	! t0_kref+0x3904:   	fitos	%f15, %f14
	.word	0xad70000d	! t0_kref+0x3908:   	popc	%o5, %l6
	.word	0x99a01a30	! t0_kref+0x390c:   	fstoi	%f16, %f12
	.word	0xa7b28a6b	! t0_kref+0x3910:   	fpadd32s	%f10, %f11, %f19
	.word	0xa27b000d	! t0_kref+0x3914:   	sdiv	%o4, %o5, %l1
	.word	0xef68a047	! t0_kref+0x3918:   	prefetch	%g2 + 0x47, 23
	.word	0xa2c3000d	! t0_kref+0x391c:   	addccc	%o4, %o5, %l1
	.word	0x9da48931	! t0_kref+0x3920:   	fmuls	%f18, %f17, %f14
	.word	0x37480006	! t0_kref+0x3924:   	fbge,a,pt	%fcc0, _kref+0x393c
	.word	0xe11e6008	! t0_kref+0x3928:   	ldd	[%i1 + 8], %f16
	.word	0x95a40952	! t0_kref+0x392c:   	fmuld	%f16, %f18, %f10
	.word	0x92533dd0	! t0_kref+0x3930:   	umul	%o4, -0x230, %o1
	.word	0xdab6501b	! t0_kref+0x3934:   	stha	%o5, [%i1 + %i3]0x80
	.word	0xe06e2005	! t0_kref+0x3938:   	ldstub	[%i0 + 5], %l0
	.word	0xa213400d	! t0_kref+0x393c:   	or	%o5, %o5, %l1
	.word	0xa5b4ca32	! t0_kref+0x3940:   	fpadd16s	%f19, %f18, %f18
	.word	0x908b7a38	! t0_kref+0x3944:   	andcc	%o5, -0x5c8, %o0
	.word	0x94b3400c	! t0_kref+0x3948:   	orncc	%o5, %o4, %o2
	.word	0x8143e040	! t0_kref+0x394c:   	membar	0x40
	.word	0xc368a008	! t0_kref+0x3950:   	prefetch	%g2 + 8, 1
	.word	0xe1be588c	! t0_kref+0x3954:   	stda	%f16, [%i1 + %o4]0xc4
	.word	0x99a01a4c	! t0_kref+0x3958:   	fdtoi	%f12, %f12
	.word	0xee08a036	! t0_kref+0x395c:   	ldub	[%g2 + 0x36], %l7
	.word	0xec00a018	! t0_kref+0x3960:   	ld	[%g2 + 0x18], %l6
	.word	0x2f800008	! t0_kref+0x3964:   	fbu,a	_kref+0x3984
	.word	0xe68e101a	! t0_kref+0x3968:   	lduba	[%i0 + %i2]0x80, %l3
	.word	0xe03e2000	! t0_kref+0x396c:   	std	%l0, [%i0]
	.word	0x3b480001	! t0_kref+0x3970:   	fble,a,pt	%fcc0, _kref+0x3974
	.word	0xe53e4000	! t0_kref+0x3974:   	std	%f18, [%i1]
	.word	0xdda71019	! t0_kref+0x3978:   	sta	%f14, [%i4 + %i1]0x80
	.word	0x900b2d9a	! t0_kref+0x397c:   	and	%o4, 0xd9a, %o0
	.word	0x95a0054c	! t0_kref+0x3980:   	fsqrtd	%f12, %f10
	.word	0x97b2ca2f	! t0_kref+0x3984:   	fpadd16s	%f11, %f15, %f11
	.word	0xad400000	! t0_kref+0x3988:   	mov	%y, %l6
	.word	0x8143c000	! t0_kref+0x398c:   	stbar
	.word	0x81ab8aac	! t0_kref+0x3990:   	fcmpes	%fcc0, %f14, %f12
	.word	0xa88b000d	! t0_kref+0x3994:   	andcc	%o4, %o5, %l4
	.word	0xe51e2018	! t0_kref+0x3998:   	ldd	[%i0 + 0x18], %f18
	.word	0xa5a0052b	! t0_kref+0x399c:   	fsqrts	%f11, %f18
	.word	0xa53b6012	! t0_kref+0x39a0:   	sra	%o5, 0x12, %l2
	.word	0xd1be9a18	! t0_kref+0x39a4:   	stda	%f8, [%i2 + %i0]0xd0
	.word	0xa7a0052e	! t0_kref+0x39a8:   	fsqrts	%f14, %f19
	.word	0xc9ee500d	! t0_kref+0x39ac:   	prefetcha	%i1 + %o5, 4
	.word	0xe2163ff0	! t0_kref+0x39b0:   	lduh	[%i0 - 0x10], %l1
	.word	0xa783400d	! t0_kref+0x39b4:   	wr	%o5, %o5, %gsr
	.word	0xea16c019	! t0_kref+0x39b8:   	lduh	[%i3 + %i1], %l5
	.word	0xaf400000	! t0_kref+0x39bc:   	mov	%y, %l7
	.word	0x942361a2	! t0_kref+0x39c0:   	sub	%o5, 0x1a2, %o2
	.word	0x35800004	! t0_kref+0x39c4:   	fbue,a	_kref+0x39d4
	.word	0xe13e6000	! t0_kref+0x39c8:   	std	%f16, [%i1]
	.word	0xe03e001d	! t0_kref+0x39cc:   	std	%l0, [%i0 + %i5]
	.word	0x9fa01092	! t0_kref+0x39d0:   	fxtos	%f18, %f15
	.word	0xa5a00132	! t0_kref+0x39d4:   	fabss	%f18, %f18
	.word	0x9da018ca	! t0_kref+0x39d8:   	fdtos	%f10, %f14
	.word	0xec1e3ff0	! t0_kref+0x39dc:   	ldd	[%i0 - 0x10], %l6
	.word	0xe400a008	! t0_kref+0x39e0:   	ld	[%g2 + 8], %l2
	.word	0xe51fbea0	! t0_kref+0x39e4:   	ldd	[%fp - 0x160], %f18
	.word	0xe53e401d	! t0_kref+0x39e8:   	std	%f18, [%i1 + %i5]
	.word	0xa5b30200	! t0_kref+0x39ec:   	array8	%o4, %g0, %l2
	.word	0xee0e2005	! t0_kref+0x39f0:   	ldub	[%i0 + 5], %l7
	.word	0x9273000d	! t0_kref+0x39f4:   	udiv	%o4, %o5, %o1
	.word	0xa4b37da4	! t0_kref+0x39f8:   	orncc	%o5, -0x25c, %l2
	.word	0x9ba0052e	! t0_kref+0x39fc:   	fsqrts	%f14, %f13
	.word	0x9db48d40	! t0_kref+0x3a00:   	fnot1	%f18, %f14
	.word	0xa4233beb	! t0_kref+0x3a04:   	sub	%o4, -0x415, %l2
	.word	0xdd00a020	! t0_kref+0x3a08:   	ld	[%g2 + 0x20], %f14
	.word	0xefee501d	! t0_kref+0x3a0c:   	prefetcha	%i1 + %i5, 23
	.word	0xae73000c	! t0_kref+0x3a10:   	udiv	%o4, %o4, %l7
	.word	0xee064000	! t0_kref+0x3a14:   	ld	[%i1], %l7
	.word	0xa5a00552	! t0_kref+0x3a18:   	fsqrtd	%f18, %f18
	.word	0x3b480005	! t0_kref+0x3a1c:   	fble,a,pt	%fcc0, _kref+0x3a30
	.word	0xee40a018	! t0_kref+0x3a20:   	ldsw	[%g2 + 0x18], %l7
	.word	0xffee101d	! t0_kref+0x3a24:   	prefetcha	%i0 + %i5, 31
	.word	0xa6c37e13	! t0_kref+0x3a28:   	addccc	%o5, -0x1ed, %l3
	.word	0xe6881019	! t0_kref+0x3a2c:   	lduba	[%g0 + %i1]0x80, %l3
	.word	0xd9be588d	! t0_kref+0x3a30:   	stda	%f12, [%i1 + %o5]0xc4
	.word	0xee4e401a	! t0_kref+0x3a34:   	ldsb	[%i1 + %i2], %l7
	.word	0x9473400d	! t0_kref+0x3a38:   	udiv	%o5, %o5, %o2
	.word	0x9ba308b3	! t0_kref+0x3a3c:   	fsubs	%f12, %f19, %f13
	.word	0x30480002	! t0_kref+0x3a40:   	ba,a,pt	%icc, _kref+0x3a48
	.word	0xad400000	! t0_kref+0x3a44:   	mov	%y, %l6
	.word	0x9fc10000	! t0_kref+0x3a48:   	call	%g4
	.word	0x95a00550	! t0_kref+0x3a4c:   	fsqrtd	%f16, %f10
	.word	0xd60e401a	! t0_kref+0x3a50:   	ldub	[%i1 + %i2], %o3
	.word	0xe4de1000	! t0_kref+0x3a54:   	ldxa	[%i0]0x80, %l2
	.word	0xf16e2000	! t0_kref+0x3a58:   	prefetch	%i0, 24
	.word	0x95a48852	! t0_kref+0x3a5c:   	faddd	%f18, %f18, %f10
	.word	0x39480007	! t0_kref+0x3a60:   	fbuge,a,pt	%fcc0, _kref+0x3a7c
	.word	0xa1a4c930	! t0_kref+0x3a64:   	fmuls	%f19, %f16, %f16
	.word	0xa7a3c82b	! t0_kref+0x3a68:   	fadds	%f15, %f11, %f19
	.word	0x99a00552	! t0_kref+0x3a6c:   	fsqrtd	%f18, %f12
	.word	0xe27e7ff8	! t0_kref+0x3a70:   	swap	[%i1 - 8], %l1
	.word	0xe66e7fe4	! t0_kref+0x3a74:   	ldstub	[%i1 - 0x1c], %l3
	.word	0xe51fbe28	! t0_kref+0x3a78:   	ldd	[%fp - 0x1d8], %f18
	.word	0x81aa8a30	! t0_kref+0x3a7c:   	fcmps	%fcc0, %f10, %f16
	.word	0x2a480008	! t0_kref+0x3a80:   	bcs,a,pt	%icc, _kref+0x3aa0
	.word	0x9ba0188b	! t0_kref+0x3a84:   	fitos	%f11, %f13
	.word	0x92b3000d	! t0_kref+0x3a88:   	orncc	%o4, %o5, %o1
	.word	0x909b000d	! t0_kref+0x3a8c:   	xorcc	%o4, %o5, %o0
	.word	0xa1a289d2	! t0_kref+0x3a90:   	fdivd	%f10, %f18, %f16
	.word	0xa5b00cf0	! t0_kref+0x3a94:   	fnot2s	%f16, %f18
	.word	0xc807bfe4	! t0_kref+0x3a98:   	ld	[%fp - 0x1c], %g4
	.word	0xe8400018	! t0_kref+0x3a9c:   	ldsw	[%g0 + %i0], %l4
	.word	0x96736b55	! t0_kref+0x3aa0:   	udiv	%o5, 0xb55, %o3
	.word	0x91b3010d	! t0_kref+0x3aa4:   	edge32	%o4, %o5, %o0
	.word	0x99a4894a	! t0_kref+0x3aa8:   	fmuld	%f18, %f10, %f12
	.word	0x99a00552	! t0_kref+0x3aac:   	fsqrtd	%f18, %f12
	.word	0xa5b30f8e	! t0_kref+0x3ab0:   	for	%f12, %f14, %f18
	.word	0xaf2b200b	! t0_kref+0x3ab4:   	sll	%o4, 0xb, %l7
	.word	0x81834000	! t0_kref+0x3ab8:   	wr	%o5, %g0, %y
	.word	0xd8b6d018	! t0_kref+0x3abc:   	stha	%o4, [%i3 + %i0]0x80
	.word	0x81ac0ab0	! t0_kref+0x3ac0:   	fcmpes	%fcc0, %f16, %f16
	.word	0xee6e7fff	! t0_kref+0x3ac4:   	ldstub	[%i1 - 1], %l7
	.word	0x35480004	! t0_kref+0x3ac8:   	fbue,a,pt	%fcc0, _kref+0x3ad8
	.word	0x81834000	! t0_kref+0x3acc:   	wr	%o5, %g0, %y
	.word	0xaca326a9	! t0_kref+0x3ad0:   	subcc	%o4, 0x6a9, %l6
	.word	0x99a0104c	! t0_kref+0x3ad4:   	fdtox	%f12, %f12
	.word	0x99a0002b	! t0_kref+0x3ad8:   	fmovs	%f11, %f12
	.word	0x81580000	! t0_kref+0x3adc:   	flushw
	.word	0xd26e3ffd	! t0_kref+0x3ae0:   	ldstub	[%i0 - 3], %o1
	.word	0x31480006	! t0_kref+0x3ae4:   	fba,a,pt	%fcc0, _kref+0x3afc
	.word	0xe03f4019	! t0_kref+0x3ae8:   	std	%l0, [%i5 + %i1]
	.word	0x20800004	! t0_kref+0x3aec:   	bn,a	_kref+0x3afc
	.word	0xd91e3fe0	! t0_kref+0x3af0:   	ldd	[%i0 - 0x20], %f12
	.word	0xe120a014	! t0_kref+0x3af4:   	st	%f16, [%g2 + 0x14]
	.word	0xe648a021	! t0_kref+0x3af8:   	ldsb	[%g2 + 0x21], %l3
	.word	0xa8633261	! t0_kref+0x3afc:   	subc	%o4, -0xd9f, %l4
	.word	0xd416001b	! t0_kref+0x3b00:   	lduh	[%i0 + %i3], %o2
	.word	0xa1b40ab2	! t0_kref+0x3b04:   	fpsub16s	%f16, %f18, %f16
	.word	0x83414000	! t0_kref+0x3b08:   	mov	%pc, %g1
	.word	0xaac3000d	! t0_kref+0x3b0c:   	addccc	%o4, %o5, %l5
	.word	0x8143e039	! t0_kref+0x3b10:   	membar	0x39
	.word	0x001fffff	! t0_kref+0x3b14:   	illtrap	0x1fffff
	.word	0x95a3894a	! t0_kref+0x3b18:   	fmuld	%f14, %f10, %f10
	.word	0xda28a03b	! t0_kref+0x3b1c:   	stb	%o5, [%g2 + 0x3b]
	.word	0xabb3010d	! t0_kref+0x3b20:   	edge32	%o4, %o5, %l5
	.word	0x8143c000	! t0_kref+0x3b24:   	stbar
	.word	0xc807bfe8	! t0_kref+0x3b28:   	ld	[%fp - 0x18], %g4
	.word	0xe1067ff0	! t0_kref+0x3b2c:   	ld	[%i1 - 0x10], %f16
	.word	0xa86326d5	! t0_kref+0x3b30:   	subc	%o4, 0x6d5, %l4
	.word	0x38800002	! t0_kref+0x3b34:   	bgu,a	_kref+0x3b3c
	.word	0x95400000	! t0_kref+0x3b38:   	mov	%y, %o2
	.word	0xee4e201b	! t0_kref+0x3b3c:   	ldsb	[%i0 + 0x1b], %l7
	.word	0xa1a00552	! t0_kref+0x3b40:   	fsqrtd	%f18, %f16
	.word	0xa1a01931	! t0_kref+0x3b44:   	fstod	%f17, %f16
	.word	0xabb3400d	! t0_kref+0x3b48:   	edge8	%o5, %o5, %l5
	.word	0xd5000018	! t0_kref+0x3b4c:   	ld	[%g0 + %i0], %f10
	.word	0xa3a0052f	! t0_kref+0x3b50:   	fsqrts	%f15, %f17
	.word	0xd5b81018	! t0_kref+0x3b54:   	stda	%f10, [%g0 + %i0]0x80
	.word	0x81ac4ab2	! t0_kref+0x3b58:   	fcmpes	%fcc0, %f17, %f18
	.word	0x97a34830	! t0_kref+0x3b5c:   	fadds	%f13, %f16, %f11
	.word	0xe53f4019	! t0_kref+0x3b60:   	std	%f18, [%i5 + %i1]
	.word	0xa1a0110e	! t0_kref+0x3b64:   	fxtod	%f14, %f16
	.word	0xe27e0000	! t0_kref+0x3b68:   	swap	[%i0], %l1
	.word	0x81ac8a31	! t0_kref+0x3b6c:   	fcmps	%fcc0, %f18, %f17
	.word	0xa5b28d92	! t0_kref+0x3b70:   	fxor	%f10, %f18, %f18
	.word	0xa5a28852	! t0_kref+0x3b74:   	faddd	%f10, %f18, %f18
	.word	0x35480003	! t0_kref+0x3b78:   	fbue,a,pt	%fcc0, _kref+0x3b84
	.word	0xaa9b400d	! t0_kref+0x3b7c:   	xorcc	%o5, %o5, %l5
	.word	0x81b01027	! t0_kref+0x3b80:   	siam	0x7
	.word	0xd826401c	! t0_kref+0x3b84:   	st	%o4, [%i1 + %i4]
	.word	0x99a00552	! t0_kref+0x3b88:   	fsqrtd	%f18, %f12
	.word	0x29480003	! t0_kref+0x3b8c:   	fbl,a,pt	%fcc0, _kref+0x3b98
	.word	0x903379cd	! t0_kref+0x3b90:   	orn	%o5, -0x633, %o0
	.word	0x9ba0002d	! t0_kref+0x3b94:   	fmovs	%f13, %f13
	.word	0x8143c000	! t0_kref+0x3b98:   	stbar
	.word	0xfdee101c	! t0_kref+0x3b9c:   	prefetcha	%i0 + %i4, 30
	.word	0x95a4c92e	! t0_kref+0x3ba0:   	fmuls	%f19, %f14, %f10
	.word	0xea6e8018	! t0_kref+0x3ba4:   	ldstub	[%i2 + %i0], %l5
	.word	0xe848a037	! t0_kref+0x3ba8:   	ldsb	[%g2 + 0x37], %l4
	.word	0x81daa3f7	! t0_kref+0x3bac:   	flush	%o2 + 0x3f7
	.word	0xa2b32a6a	! t0_kref+0x3bb0:   	orncc	%o4, 0xa6a, %l1
	.word	0xd47e7ff0	! t0_kref+0x3bb4:   	swap	[%i1 - 0x10], %o2
	.word	0xa7a01a52	! t0_kref+0x3bb8:   	fdtoi	%f18, %f19
	.word	0xe800a010	! t0_kref+0x3bbc:   	ld	[%g2 + 0x10], %l4
	.word	0xa3408000	! t0_kref+0x3bc0:   	mov	%ccr, %l1
	.word	0xc768a08e	! t0_kref+0x3bc4:   	prefetch	%g2 + 0x8e, 3
	.word	0xac73400d	! t0_kref+0x3bc8:   	udiv	%o5, %o5, %l6
	.word	0xe6d81019	! t0_kref+0x3bcc:   	ldxa	[%g0 + %i1]0x80, %l3
	.word	0xd830a004	! t0_kref+0x3bd0:   	sth	%o4, [%g2 + 4]
	.word	0xd0066000	! t0_kref+0x3bd4:   	ld	[%i1], %o0
	.word	0x9da0052b	! t0_kref+0x3bd8:   	fsqrts	%f11, %f14
	.word	0x95a018ca	! t0_kref+0x3bdc:   	fdtos	%f10, %f10
	.word	0xec08a035	! t0_kref+0x3be0:   	ldub	[%g2 + 0x35], %l6
	.word	0x96737371	! t0_kref+0x3be4:   	udiv	%o5, -0xc8f, %o3
	.word	0xec1e2018	! t0_kref+0x3be8:   	ldd	[%i0 + 0x18], %l6
	.word	0x21480002	! t0_kref+0x3bec:   	fbn,a,pt	%fcc0, _kref+0x3bf4
	.word	0x953b400c	! t0_kref+0x3bf0:   	sra	%o5, %o4, %o2
	.word	0x9013400c	! t0_kref+0x3bf4:   	or	%o5, %o4, %o0
	.word	0xa1a01931	! t0_kref+0x3bf8:   	fstod	%f17, %f16
	.word	0xeade101d	! t0_kref+0x3bfc:   	ldxa	[%i0 + %i5]0x80, %l5
	.word	0x9db28d8e	! t0_kref+0x3c00:   	fxor	%f10, %f14, %f14
	.word	0x9da44833	! t0_kref+0x3c04:   	fadds	%f17, %f19, %f14
	.word	0xdd1fbc38	! t0_kref+0x3c08:   	ldd	[%fp - 0x3c8], %f14
	.word	0xa263000d	! t0_kref+0x3c0c:   	subc	%o4, %o5, %l1
	.word	0xec4e0000	! t0_kref+0x3c10:   	ldsb	[%i0], %l6
	.word	0x33480005	! t0_kref+0x3c14:   	fbe,a,pt	%fcc0, _kref+0x3c28
	.word	0xec7e3fe0	! t0_kref+0x3c18:   	swap	[%i0 - 0x20], %l6
	.word	0x9fa44831	! t0_kref+0x3c1c:   	fadds	%f17, %f17, %f15
	.word	0xa3a4c932	! t0_kref+0x3c20:   	fmuls	%f19, %f18, %f17
	.word	0xe01e2018	! t0_kref+0x3c24:   	ldd	[%i0 + 0x18], %l0
	.word	0xa92b000d	! t0_kref+0x3c28:   	sll	%o4, %o5, %l4
	.word	0xe81f4019	! t0_kref+0x3c2c:   	ldd	[%i5 + %i1], %l4
	.word	0x3a800002	! t0_kref+0x3c30:   	bcc,a	_kref+0x3c38
	.word	0xa7b300ad	! t0_kref+0x3c34:   	edge16n	%o4, %o5, %l3
	.word	0x34800003	! t0_kref+0x3c38:   	bg,a	_kref+0x3c44
	.word	0xf36e401b	! t0_kref+0x3c3c:   	prefetch	%i1 + %i3, 25
	call	SYM(t0_subr1)
	.word	0xe11e0000	! t0_kref+0x3c44:   	ldd	[%i0], %f16
	.word	0xaf232839	! t0_kref+0x3c48:   	mulscc	%o4, 0x839, %l7
	.word	0xa833400c	! t0_kref+0x3c4c:   	orn	%o5, %o4, %l4
	.word	0xabb38592	! t0_kref+0x3c50:   	fcmpgt32	%f14, %f18, %l5
	.word	0xd06e3fe6	! t0_kref+0x3c54:   	ldstub	[%i0 - 0x1a], %o0
	.word	0x99a2894e	! t0_kref+0x3c58:   	fmuld	%f10, %f14, %f12
	.word	0xe650a038	! t0_kref+0x3c5c:   	ldsh	[%g2 + 0x38], %l3
	.word	0x99a0054e	! t0_kref+0x3c60:   	fsqrtd	%f14, %f12
	.word	0xa3a018ce	! t0_kref+0x3c64:   	fdtos	%f14, %f17
	.word	0xe51e3fe8	! t0_kref+0x3c68:   	ldd	[%i0 - 0x18], %f18
	.word	0x97b007ae	! t0_kref+0x3c6c:   	fpackfix	%f14, %f11
	.word	0xe500a038	! t0_kref+0x3c70:   	ld	[%g2 + 0x38], %f18
	.word	0x9413000d	! t0_kref+0x3c74:   	or	%o4, %o5, %o2
	.word	0xe878a03c	! t0_kref+0x3c78:   	swap	[%g2 + 0x3c], %l4
	.word	0xa5a488d0	! t0_kref+0x3c7c:   	fsubd	%f18, %f16, %f18
	.word	0xa813000c	! t0_kref+0x3c80:   	or	%o4, %o4, %l4
	.word	0xaafb000d	! t0_kref+0x3c84:   	sdivcc	%o4, %o5, %l5
	.word	0xd5267ffc	! t0_kref+0x3c88:   	st	%f10, [%i1 - 4]
	.word	0xae13226f	! t0_kref+0x3c8c:   	or	%o4, 0x26f, %l7
	.word	0xa413783d	! t0_kref+0x3c90:   	or	%o5, -0x7c3, %l2
	.word	0x21480007	! t0_kref+0x3c94:   	fbn,a,pt	%fcc0, _kref+0x3cb0
	.word	0xd04e6014	! t0_kref+0x3c98:   	ldsb	[%i1 + 0x14], %o0
	.word	0x97a00030	! t0_kref+0x3c9c:   	fmovs	%f16, %f11
	.word	0x9273000d	! t0_kref+0x3ca0:   	udiv	%o4, %o5, %o1
	.word	0xe120a004	! t0_kref+0x3ca4:   	st	%f16, [%g2 + 4]
	.word	0x9423000c	! t0_kref+0x3ca8:   	sub	%o4, %o4, %o2
	.word	0x81aa8a4a	! t0_kref+0x3cac:   	fcmpd	%fcc0, %f10, %f10
	.word	0x95b4896a	! t0_kref+0x3cb0:   	fpmerge	%f18, %f10, %f10
	.word	0xae1b7e89	! t0_kref+0x3cb4:   	xor	%o5, -0x177, %l7
	.word	0x95b2866c	! t0_kref+0x3cb8:   	fmul8x16au	%f10, %f12, %f10
	.word	0xa1b4c72b	! t0_kref+0x3cbc:   	fmuld8ulx16	%f19, %f11, %f16
	.word	0xaab3400d	! t0_kref+0x3cc0:   	orncc	%o5, %o5, %l5
	.word	0xd050a022	! t0_kref+0x3cc4:   	ldsh	[%g2 + 0x22], %o0
	.word	0xe1be9a18	! t0_kref+0x3cc8:   	stda	%f16, [%i2 + %i0]0xd0
	.word	0xe24e6017	! t0_kref+0x3ccc:   	ldsb	[%i1 + 0x17], %l1
	.word	0xe1be180c	! t0_kref+0x3cd0:   	stda	%f16, [%i0 + %o4]0xc0
	.word	0xe40831cf	! t0_kref+0x3cd4:   	ldub	[%g0 - 0xe31], %l2
	.word	0xd828a021	! t0_kref+0x3cd8:   	stb	%o4, [%g2 + 0x21]
	.word	0xa7b44f6d	! t0_kref+0x3cdc:   	fornot1s	%f17, %f13, %f19
	.word	0xf5ee101d	! t0_kref+0x3ce0:   	prefetcha	%i0 + %i5, 26
	.word	0xd050a016	! t0_kref+0x3ce4:   	ldsh	[%g2 + 0x16], %o0
	.word	0xa3b28a6e	! t0_kref+0x3ce8:   	fpadd32s	%f10, %f14, %f17
	.word	0xe650a036	! t0_kref+0x3cec:   	ldsh	[%g2 + 0x36], %l3
	.word	0x9693000d	! t0_kref+0x3cf0:   	orcc	%o4, %o5, %o3
	.word	0x8143c000	! t0_kref+0x3cf4:   	stbar
	.word	0xe03e6000	! t0_kref+0x3cf8:   	std	%l0, [%i1]
	.word	0xd9180018	! t0_kref+0x3cfc:   	ldd	[%g0 + %i0], %f12
	.word	0x86102003	! t0_kref+0x3d00:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x3d04:   	bne,a	_kref+0x3d04
	.word	0x86a0e001	! t0_kref+0x3d08:   	subcc	%g3, 1, %g3
	.word	0xe51e2008	! t0_kref+0x3d0c:   	ldd	[%i0 + 8], %f18
	.word	0xe51e6008	! t0_kref+0x3d10:   	ldd	[%i1 + 8], %f18
	.word	0xdb06200c	! t0_kref+0x3d14:   	ld	[%i0 + 0xc], %f13
	.word	0xd68e101a	! t0_kref+0x3d18:   	lduba	[%i0 + %i2]0x80, %o3
	.word	0xd8f01019	! t0_kref+0x3d1c:   	stxa	%o4, [%g0 + %i1]0x80
	.word	0xb610201a	! t0_kref+0x3d20:   	mov	0x1a, %i3
	.word	0xd1be180d	! t0_kref+0x3d24:   	stda	%f8, [%i0 + %o5]0xc0
	.word	0xa6d3400d	! t0_kref+0x3d28:   	umulcc	%o5, %o5, %l3
	.word	0xe03e001d	! t0_kref+0x3d2c:   	std	%l0, [%i0 + %i5]
	.word	0xa1a00033	! t0_kref+0x3d30:   	fmovs	%f19, %f16
	.word	0x9003000c	! t0_kref+0x3d34:   	add	%o4, %o4, %o0
	.word	0xec1e0000	! t0_kref+0x3d38:   	ldd	[%i0], %l6
	.word	0x9463400c	! t0_kref+0x3d3c:   	subc	%o5, %o4, %o2
	.word	0xa1a0054c	! t0_kref+0x3d40:   	fsqrtd	%f12, %f16
	.word	0xa5400000	! t0_kref+0x3d44:   	mov	%y, %l2
	.word	0xe36e3fe8	! t0_kref+0x3d48:   	prefetch	%i0 - 0x18, 17
	.word	0x87802082	! t0_kref+0x3d4c:   	mov	0x82, %asi
	.word	0xd408a000	! t0_kref+0x3d50:   	ldub	[%g2], %o2
	.word	0xe03e2008	! t0_kref+0x3d54:   	std	%l0, [%i0 + 8]
	.word	0x81834000	! t0_kref+0x3d58:   	wr	%o5, %g0, %y
	.word	0xaa836f11	! t0_kref+0x3d5c:   	addcc	%o5, 0xf11, %l5
	.word	0xae33000d	! t0_kref+0x3d60:   	orn	%o4, %o5, %l7
	.word	0xd51fbf80	! t0_kref+0x3d64:   	ldd	[%fp - 0x80], %f10
	.word	0x99b48a10	! t0_kref+0x3d68:   	fpadd16	%f18, %f16, %f12
	.word	0xa72b2004	! t0_kref+0x3d6c:   	sll	%o4, 0x4, %l3
	.word	0x2b480008	! t0_kref+0x3d70:   	fbug,a,pt	%fcc0, _kref+0x3d90
	.word	0xadb30240	! t0_kref+0x3d74:   	array16	%o4, %g0, %l6
	.word	0x9fc10000	! t0_kref+0x3d78:   	call	%g4
	.word	0xdd1e2008	! t0_kref+0x3d7c:   	ldd	[%i0 + 8], %f14
	.word	0x8d8363bb	! t0_kref+0x3d80:   	wr	%o5, 0x3bb, %fprs
	.word	0x21480004	! t0_kref+0x3d84:   	fbn,a,pt	%fcc0, _kref+0x3d94
	.word	0x932b000c	! t0_kref+0x3d88:   	sll	%o4, %o4, %o1
	.word	0x97a0052f	! t0_kref+0x3d8c:   	fsqrts	%f15, %f11
	.word	0x9da3c82a	! t0_kref+0x3d90:   	fadds	%f15, %f10, %f14
	.word	0x878020d0	! t0_kref+0x3d94:   	mov	0xd0, %asi
	.word	0x3b800007	! t0_kref+0x3d98:   	fble,a	_kref+0x3db4
	.word	0xe41e7ff8	! t0_kref+0x3d9c:   	ldd	[%i1 - 8], %l2
	.word	0x913b6016	! t0_kref+0x3da0:   	sra	%o5, 0x16, %o0
	.word	0xe408a00e	! t0_kref+0x3da4:   	ldub	[%g2 + 0xe], %l2
	.word	0xa5b48992	! t0_kref+0x3da8:   	bshuffle	%f18, %f18, %f18
	.word	0x95b340ec	! t0_kref+0x3dac:   	edge16ln	%o5, %o4, %o2
	.word	0x94137585	! t0_kref+0x3db0:   	or	%o5, -0xa7b, %o2
	.word	0xdb264000	! t0_kref+0x3db4:   	st	%f13, [%i1]
	.word	0x28800007	! t0_kref+0x3db8:   	bleu,a	_kref+0x3dd4
	.word	0xc56e6010	! t0_kref+0x3dbc:   	prefetch	%i1 + 0x10, 2
	.word	0xaf0b660b	! t0_kref+0x3dc0:   	tsubcc	%o5, 0x60b, %l7
	.word	0x8143c000	! t0_kref+0x3dc4:   	stbar
	.word	0x95b3034d	! t0_kref+0x3dc8:   	alignaddrl	%o4, %o5, %o2
	.word	0x81aa8a4e	! t0_kref+0x3dcc:   	fcmpd	%fcc0, %f10, %f14
	.word	0x9ba01a52	! t0_kref+0x3dd0:   	fdtoi	%f18, %f13
	.word	0xa1a488cc	! t0_kref+0x3dd4:   	fsubd	%f18, %f12, %f16
	.word	0x9033400d	! t0_kref+0x3dd8:   	orn	%o5, %o5, %o0
	.word	0x38800002	! t0_kref+0x3ddc:   	bgu,a	_kref+0x3de4
	.word	0xd91e001d	! t0_kref+0x3de0:   	ldd	[%i0 + %i5], %f12
	.word	0xd408a02a	! t0_kref+0x3de4:   	ldub	[%g2 + 0x2a], %o2
	.word	0xd830a028	! t0_kref+0x3de8:   	sth	%o4, [%g2 + 0x28]
	.word	0xa3a00532	! t0_kref+0x3dec:   	fsqrts	%f18, %f17
	.word	0xd248a00c	! t0_kref+0x3df0:   	ldsb	[%g2 + 0xc], %o1
	.word	0xd93e3fe8	! t0_kref+0x3df4:   	std	%f12, [%i0 - 0x18]
	.word	0xa1a00530	! t0_kref+0x3df8:   	fsqrts	%f16, %f16
	.word	0x20480003	! t0_kref+0x3dfc:   	bn,a,pt	%icc, _kref+0x3e08
	.word	0x99b48acc	! t0_kref+0x3e00:   	fpsub32	%f18, %f12, %f12
	.word	0xd51fbf38	! t0_kref+0x3e04:   	ldd	[%fp - 0xc8], %f10
	.word	0xc7ee500c	! t0_kref+0x3e08:   	prefetcha	%i1 + %o4, 3
	.word	0xe03e001d	! t0_kref+0x3e0c:   	std	%l0, [%i0 + %i5]
	.word	0xaf3b6017	! t0_kref+0x3e10:   	sra	%o5, 0x17, %l7
	.word	0xab2b6014	! t0_kref+0x3e14:   	sll	%o5, 0x14, %l5
	.word	0xe206200c	! t0_kref+0x3e18:   	ld	[%i0 + 0xc], %l1
	.word	0x93400000	! t0_kref+0x3e1c:   	mov	%y, %o1
	.word	0xdd1fbe60	! t0_kref+0x3e20:   	ldd	[%fp - 0x1a0], %f14
	.word	0xa1a4894a	! t0_kref+0x3e24:   	fmuld	%f18, %f10, %f16
	.word	0xa473000d	! t0_kref+0x3e28:   	udiv	%o4, %o5, %l2
	.word	0x81b01022	! t0_kref+0x3e2c:   	siam	0x2
	.word	0x91b3000d	! t0_kref+0x3e30:   	edge8	%o4, %o5, %o0
	.word	0xe6167fe0	! t0_kref+0x3e34:   	lduh	[%i1 - 0x20], %l3
	.word	0xa3b340ed	! t0_kref+0x3e38:   	edge16ln	%o5, %o5, %l1
	.word	0xa7a018ce	! t0_kref+0x3e3c:   	fdtos	%f14, %f19
	.word	0xa4fb2aa2	! t0_kref+0x3e40:   	sdivcc	%o4, 0xaa2, %l2
	.word	0xa2ab7835	! t0_kref+0x3e44:   	andncc	%o5, -0x7cb, %l1
	.word	0xafb3416d	! t0_kref+0x3e48:   	edge32ln	%o5, %o5, %l7
	.word	0xa7a01a4a	! t0_kref+0x3e4c:   	fdtoi	%f10, %f19
	.word	0xa1a4882f	! t0_kref+0x3e50:   	fadds	%f18, %f15, %f16
	.word	0x9bb007aa	! t0_kref+0x3e54:   	fpackfix	%f10, %f13
	.word	0xaa8b000c	! t0_kref+0x3e58:   	andcc	%o4, %o4, %l5
	.word	0xa433265f	! t0_kref+0x3e5c:   	orn	%o4, 0x65f, %l2
	.word	0x9063400d	! t0_kref+0x3e60:   	subc	%o5, %o5, %o0
	.word	0xe03e4000	! t0_kref+0x3e64:   	std	%l0, [%i1]
	.word	0x22800008	! t0_kref+0x3e68:   	be,a	_kref+0x3e88
	.word	0xd8200019	! t0_kref+0x3e6c:   	st	%o4, [%g0 + %i1]
	.word	0xd610a018	! t0_kref+0x3e70:   	lduh	[%g2 + 0x18], %o3
	.word	0xda266008	! t0_kref+0x3e74:   	st	%o5, [%i1 + 8]
	.word	0x97a01a4c	! t0_kref+0x3e78:   	fdtoi	%f12, %f11
	.word	0xea08a01e	! t0_kref+0x3e7c:   	ldub	[%g2 + 0x1e], %l5
	.word	0x01000000	! t0_kref+0x3e80:   	nop
	.word	0x01000000	! t0_kref+0x3e84:   	nop
	call	SYM(_kaos_done)
	.word	0x01000000	! t0_kref+0x3e8c:   	nop
	KGLOBAL(t0_ktbl_end)
t0_ktbl_end:
t0_ktbl_page_end:

KTEXT_MODULE(t0_module_subr0, 0x4d580000)
.seg "text"
t0_subr0_page_begin:
	.skip 8192
.global _t0_subr0; ENTRY(t0_subr0)
	.word	0xa6844012	! t0_subr0+0x0:   	addcc	%l1, %l2, %l3
	.word	0x81c3e008	! t0_subr0+0x4:   	retl
	.word	0xaa64c014	! t0_subr0+0x8:   	subc	%l3, %l4, %l5
t0_subr0_page_end:

KTEXT_MODULE(t0_module_subr1, 0x0d2da000)
.seg "text"
t0_subr1_page_begin:
	.skip 8192
.global _t0_subr1; ENTRY(t0_subr1)
	.word	0x9de3bfa0	! t0_subr1+0x0:   	save	%sp, -0x60, %sp
	.word	0xb29eaa5a	! t0_subr1+0x4:   	xorcc	%i2, 0xa5a, %i1
	.word	0x81c7e008	! t0_subr1+0x8:   	ret
	.word	0xa7ee6001	! t0_subr1+0xc:   	restore	%i1, 1, %l3
t0_subr1_page_end:

KTEXT_MODULE(t0_module_subr2, 0x1e504000)
.seg "text"
t0_subr2_page_begin:
	.skip 8192
.global _t0_subr2; ENTRY(t0_subr2)
	.word	0x9de3bfa0	! t0_subr2+0x0:   	save	%sp, -0x60, %sp
	.word	0xb2066001	! t0_subr2+0x4:   	add	%i1, 1, %i1
	.word	0x81c7e008	! t0_subr2+0x8:   	ret
	.word	0xa3ee6001	! t0_subr2+0xc:   	restore	%i1, 1, %l1
t0_subr2_page_end:

KTEXT_MODULE(t0_module_subr3, 0x0ddc0000)
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
!  Total operations: 3915  
!
!  Operation frequencies
!
!  name               exp    obs
!  ldsb              1.43   1.61
!  ldub              1.42   1.46
!  ldsh              0.06   0.05
!  lduh              0.87   1.10
!  ld                1.24   1.40
!  ldd               1.43   1.51
!  swap              1.20   1.02
!  ldstub            1.05   0.97
!  stb               0.12   0.23
!  sth               0.11   0.18
!  st                1.27   1.17
!  std               1.08   1.12
!  add               0.44   0.51
!  addcc             0.26   0.33
!  addx              0.18   0.05
!  addxcc            0.70   0.82
!  taddcc            0.17   0.18
!  taddcctv          0.02   0.00
!  sub               0.29   0.43
!  subcc             0.71   0.84
!  subx              1.22   1.51
!  subxcc            0.03   0.05
!  tsubcc            0.18   0.10
!  tsubcctv          0.25   0.15
!  mulscc            0.41   0.23
!  and               0.88   0.84
!  andcc             0.49   0.46
!  andn              0.28   0.26
!  andncc            0.16   0.18
!  or                1.20   1.63
!  orcc              0.84   0.92
!  orn               0.48   0.61
!  orncc             1.26   1.51
!  xor               0.29   0.23
!  xorcc             1.22   1.07
!  xnor              0.06   0.00
!  xnorcc            0.01   0.00
!  sll               1.45   1.76
!  srl               0.35   0.33
!  sra               1.27   1.33
!  unimp             0.09   0.13
!  umul              0.34   0.33
!  smul              0.03   0.00
!  udiv              1.17   1.30
!  sdiv              0.39   0.43
!  umulcc            0.18   0.18
!  smulcc            0.12   0.08
!  udivcc            0.27   0.31
!  sdivcc            0.87   1.10
!  rdy               1.05   1.23
!  wry               0.62   0.46
!  bicc              1.69   1.76
!  sethi             0.13   0.08
!  jmpl              1.13   1.07
!  call              0.20   0.20
!  ticc              0.00   0.00
!  flush             0.72   0.79
!  save              0.71   0.56
!  restore           1.44   0.00
!  stbar             0.55   0.84
!  ldf               0.23   0.33
!  lddf              1.39   1.51
!  stf               0.10   0.13
!  stdf              1.13   1.33
!  fadds             1.40   1.30
!  fsubs             0.55   0.51
!  fmuls             1.03   1.33
!  fdivs             0.01   0.03
!  faddd             0.85   0.79
!  fsubd             0.52   0.56
!  fmuld             0.65   0.92
!  fdivd             0.16   0.08
!  faddq             0.00   0.00
!  fsubq             0.00   0.00
!  fmulq             0.00   0.00
!  fdivq             0.00   0.00
!  fsmuld            0.25   0.38
!  fdmulq            0.00   0.00
!  fitos             0.87   1.07
!  fitod             0.05   0.03
!  fitoq             0.00   0.00
!  fstoi             0.51   0.31
!  fstod             0.43   0.31
!  fstoq             0.00   0.00
!  fdtoi             1.01   1.07
!  fdtos             0.72   0.77
!  fdtoq             0.00   0.00
!  fqtoi             0.00   0.00
!  fqtos             0.00   0.00
!  fqtod             0.00   0.00
!  fmovs             0.83   0.74
!  fnegs             0.28   0.33
!  fabss             0.18   0.13
!  fsqrts            1.98   2.32
!  fsqrtd            2.61   2.94
!  fsqrtq            0.00   0.00
!  fcmps             0.55   0.43
!  fcmpd             0.36   0.31
!  fcmpq             0.00   0.00
!  fcmpes            1.07   1.07
!  fcmped            0.04   0.08
!  fcmpeq            0.00   0.00
!  fbfcc             3.21   3.12
!  ldfsr             0.09   0.00
!  stfsr             0.05   0.03
!  loop              0.92   0.69
!  offset            0.26   0.15
!  area              0.07   0.03
!  target            0.15   0.23
!  goto              0.16   0.08
!  sigsegv           0.24   0.38
!  sigbus            0.04   0.00
!  imodify           0.00   0.00
!  ldfsr_offset      0.26   0.00
!  fpattern          1.17   1.30
!  lbranch           0.02   0.03
!  shmld             5.36   5.72
!  shmst             1.25   1.15
!  shmpf             0.81   0.69
!  shmswap           0.17   0.23
!  shmblkld          0.74   0.03
!  shmblkst          1.31   0.15
!  shmblkchk         0.25   0.15
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
!  casa              0.14   0.18
!  rdasi             0.04   0.00
!  wrasi             0.27   0.23
!  bpcc              0.80   0.69
!  fbpfcc            2.61   2.55
!  fmovscc           0.15   0.18
!  fmovdcc           0.29   0.43
!  fmovqcc           0.00   0.00
!  movcc             0.11   0.10
!  flushw            0.13   0.15
!  membar            0.14   0.03
!  prefetch          0.95   1.30
!  rdpc              0.19   0.13
!  ldqf              0.00   0.00
!  stqf              0.00   0.00
!  ldfa              0.09   0.03
!  lddfa             0.17   0.13
!  ldqfa             0.00   0.00
!  ldsba             0.09   0.10
!  ldsha             0.04   0.05
!  lduba             0.26   0.43
!  lduha             0.20   0.26
!  lda               0.11   0.08
!  ldda              0.08   0.08
!  ldstuba           0.06   0.03
!  prefetcha         0.67   0.69
!  stfa              0.27   0.28
!  stdfa             0.08   0.08
!  stqfa             0.00   0.00
!  stba              0.10   0.10
!  stha              0.25   0.26
!  sta               0.07   0.03
!  stda              0.15   0.18
!  swapa             0.18   0.13
!  fmovd             0.14   0.05
!  fnegd             0.14   0.15
!  fabsd             0.13   0.08
!  fstox             0.16   0.08
!  fdtox             0.16   0.08
!  fxtos             0.24   0.31
!  fxtod             0.22   0.15
!  lds               0.25   0.13
!  ldsa              0.21   0.20
!  ldx               0.18   0.28
!  ldxa              0.27   0.36
!  nofault           0.15   0.15
!  rdgsr             0.07   0.10
!  wrgsr             0.10   0.15
!  fpadd16           0.23   0.43
!  fpadd16s          0.13   0.18
!  fpadd32           0.26   0.20
!  fpadd32s          0.09   0.23
!  fpsub16           0.12   0.00
!  fpsub16s          0.23   0.41
!  fpsub32           0.21   0.20
!  fpsub32s          0.14   0.20
!  fpack16           0.12   0.13
!  fpack32           0.08   0.03
!  fpackfix          0.21   0.23
!  fexpand           0.28   0.33
!  fpmerge           0.27   0.28
!  fmul8x16          0.12   0.03
!  fmul8x16au        0.26   0.38
!  fmul8x16al        0.01   0.00
!  fmul8sux16        0.28   0.20
!  fmul8ulx16        0.18   0.10
!  fmuld8sux16       0.08   0.05
!  fmuld8ulx16       0.13   0.15
!  alignaddr         0.03   0.05
!  alignaddrl        0.03   0.05
!  faligndata        0.25   0.20
!  fzero             0.18   0.05
!  fzeros            0.06   0.03
!  fone              0.09   0.13
!  fones             0.25   0.20
!  fsrc1             0.17   0.23
!  fsrc1s            0.10   0.13
!  fsrc2             0.08   0.05
!  fsrc2s            0.00   0.00
!  fnot1             0.21   0.31
!  fnot1s            0.16   0.18
!  fnot2             0.21   0.13
!  fnot2s            0.24   0.13
!  for               0.26   0.31
!  fors              0.18   0.13
!  fnor              0.03   0.00
!  fnors             0.08   0.03
!  fand              0.17   0.23
!  fands             0.06   0.13
!  fnand             0.20   0.13
!  fnands            0.05   0.00
!  fxor              0.21   0.33
!  fxors             0.06   0.10
!  fxnor             0.04   0.00
!  fxnors            0.01   0.00
!  fornot1           0.10   0.08
!  fornot1s          0.25   0.31
!  fornot2           0.16   0.20
!  fornot2s          0.05   0.03
!  fandnot1          0.25   0.28
!  fandnot1s         0.22   0.33
!  fandnot2          0.05   0.05
!  fandnot2s         0.02   0.03
!  fcmpgt16          0.02   0.00
!  fcmpgt32          0.13   0.20
!  fcmple16          0.03   0.08
!  fcmple32          0.09   0.18
!  fcmpne16          0.11   0.08
!  fcmpne32          0.02   0.00
!  fcmpeq16          0.00   0.00
!  fcmpeq32          0.02   0.03
!  edge8             0.20   0.28
!  edge8l            0.13   0.18
!  edge16            0.09   0.08
!  edge16l           0.22   0.26
!  edge32            0.19   0.26
!  edge32l           0.13   0.10
!  pdist             0.07   0.03
!  partial_st8       0.18   0.20
!  partial_st16      0.01   0.00
!  partial_st32      0.26   0.49
!  short_st8         0.19   0.23
!  short_st16        0.13   0.15
!  short_ld8         0.28   0.31
!  short_ld16        0.02   0.00
!  blkld             0.20   0.00
!  blkst             0.13   0.00
!  blkld_offset      0.13   0.00
!  blkst_offset      0.21   0.00
!  blk_check         0.27   0.08
!  casxa             0.16   0.23
!  rdccr             0.16   0.18
!  rdfprs            0.14   0.08
!  wrccr             0.01   0.00
!  popc              0.23   0.23
!  wrfprs            0.19   0.26
!  stx               0.01   0.03
!  stxa              0.15   0.15
!  cflush            0.00   0.00
!  array8            0.24   0.23
!  array16           0.16   0.13
!  array32           0.09   0.10
!  edge8n            0.19   0.10
!  edge8ln           0.07   0.03
!  edge16n           0.26   0.26
!  edge16ln          0.26   0.33
!  edge32n           0.00   0.00
!  edge32ln          0.23   0.26
!  bmask             0.21   0.10
!  bshuffle          0.21   0.20
!  siam              0.15   0.15
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
KDATA_MODULE(t0_module_offset_table, 0x4dc2c000)
.seg "data"
t0_offset_table_start:
t0_offset_table_size:	.word	0x00000008
t0_offset_table:
	.word	0xfffffff0
	.word	0xffffffe0
	.word	0x00000000
	.word	0xfffffff8
	.word	0x00000018
	.word	0x00000008
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

KDATA_MODULE(t0_module_data_in_regs, 0x65b1e000)
.seg "data"
KGLOBAL(t0_data_in_regs)
t0_data_in_regs_start:
t0_data_in_regs:
	.word	0x9f27b486          ! %f0
	.word	0xd8b82682          ! %f1
	.word	0x91982066          ! %f2
	.word	0x183953b5          ! %f3
	.word	0xe76a5cba          ! %f4
	.word	0x78d41614          ! %f5
	.word	0x8eed7fce          ! %f6
	.word	0x9dc8d769          ! %f7
	.word	0x746b8f1a          ! %f8
	.word	0x7d1d12d4          ! %f9
	.word	0xa0c3e14a          ! %f10
	.word	0xf50b38a3          ! %f11
	.word	0x56adb473          ! %f12
	.word	0x91b99da3          ! %f13
	.word	0x9861c317          ! %f14
	.word	0x7667af67          ! %f15
	.word	0x07d686df          ! %f16
	.word	0x33af565b          ! %f17
	.word	0xe14ef63c          ! %f18
	.word	0x52b6cfa1          ! %f19
	.word	0x42ea7248          ! %f20
	.word	0x8c91ac02          ! %f21
	.word	0x84f45ca6          ! %f22
	.word	0x244ad67c          ! %f23
	.word	0x5bbef92b          ! %f24
	.word	0x516edc3b          ! %f25
	.word	0x19f6e594          ! %f26
	.word	0xfb9ef8f4          ! %f27
	.word	0xeea8219e          ! %f28
	.word	0x5748f5ff          ! %f29
	.word	0x4a1b6c34          ! %f30
	.word	0x929487aa          ! %f31
	.word	0x7f212e93          ! %f32
	.word	0x7a0fd38d          ! %f33
	.word	0xc6375c8e          ! %f34
	.word	0x183dfbf6          ! %f35
	.word	0x1171295e          ! %f36
	.word	0x18ec3f9f          ! %f37
	.word	0x198c42a1          ! %f38
	.word	0x9ea54242          ! %f39
	.word	0x6c4fff74          ! %f40
	.word	0xcafbb9dd          ! %f41
	.word	0x032aa7cb          ! %f42
	.word	0xccfbd595          ! %f43
	.word	0xf4993875          ! %f44
	.word	0xbd9f8e96          ! %f45
	.word	0x9edae26d          ! %f46
	.word	0x1878806e          ! %f47
	.word	0xba65886b          ! %f48
	.word	0x107935ad          ! %f49
	.word	0x6dd0bbce          ! %f50
	.word	0x860fd6d3          ! %f51
	.word	0x94b4c254          ! %f52
	.word	0x56592cd1          ! %f53
	.word	0x14591040          ! %f54
	.word	0x4471bda8          ! %f55
	.word	0x1365eedd          ! %f56
	.word	0x7504c0f0          ! %f57
	.word	0xa2fecd80          ! %f58
	.word	0x49879344          ! %f59
	.word	0xa6d38b70          ! %f60
	.word	0x730a7aed          ! %f61
	.word	0x6196f362          ! %f62
	.word	0x5e53cd41          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0x520       ! %g1 (code pointer)
	.word	t0_data_in_shm_area ! %g2 (shared area pointer)
	.word	0x6b9e89f5          ! %g3 (loop index)
	.word	SYM(t0_subr2)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0xd8492090          ! %o0
	.word	0xa93ebde8          ! %o1
	.word	0x8cfb8285          ! %o2
	.word	0x3c469ffd          ! %o3
	.word	0x3c473d49          ! %o4
	.word	0x0b86b9c7          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0xed463570          ! %l0
	.word	0x5224238f          ! %l1
	.word	0x17797aad          ! %l2
	.word	0x90cd1f93          ! %l3
	.word	0x70d045c3          ! %l4
	.word	0x092092bd          ! %l5
	.word	0xa0274643          ! %l6
	.word	0x1a5c80db          ! %l7
	.word	t0_data_in_area0    ! %i0 (area pointer)
	.word	t0_data_in_area0    ! %i1 (area pointer)
	.word	0xfffffffa          ! %i2 (byte offset)
	.word	0x00000018          ! %i3 (halfword offset)
	.word	0x0000001c          ! %i4 (word offset)
	.word	0x00000008          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0x958916f5          ! %y
	.word	0x0000000f          ! %icc (nzvc)
	.word	0x800008e9          ! %fsr
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

KDATA_MODULE(t0_module_data_in_stack, 0x2db0c000)
.seg "data"
KGLOBAL(t0_data_in_mtbl_size)
KGLOBAL(t0_data_in_mtbl)
KGLOBAL(t0_data_in_stack)
t0_data_in_stack_start:
	.word	0x312c7f45
	.word	0x87a2f386
	.word	0x4f9c4265
	.word	0xfaa06a30
	.word	0xaf5a094b
	.word	0xb9709e73
	.word	0x244677b1
	.word	0x8abcf596
	.word	0xfdb779bd
	.word	0x3f0d899d
	.word	0x84c74cb6
	.word	0xbf393f9b
	.word	0xf6d248ff
	.word	0x824a8cc2
	.word	0x6f0e79b9
	.word	0x25f2a25e
	.word	0xd72128b6
	.word	0xa34a6653
	.word	0x33c8c9a7
	.word	0x3c592cd9
	.word	0x4afa2dab
	.word	0xea24698c
	.word	0xd37a30a2
	.word	0xbd75d10e
	.word	0xe4a733f5
	.word	0xe8bb79c5
	.word	0x164446bc
	.word	0x3868c180
	.word	0x7719e157
	.word	0xbfb8e708
	.word	0xfd532b01
	.word	0xef6bb1e4
	.word	0xcdf2e9e6
	.word	0x807fffe2
	.word	0x940712ba
	.word	0x47eaef18
	.word	0xa0a67aef
	.word	0xade86c7e
	.word	0x7b9108f0
	.word	0x16038254
	.word	0x96c1f017
	.word	0xe3daa6ef
	.word	0xa21da22f
	.word	0xa7e3d39f
	.word	0x4cf536c2
	.word	0xc3cb24cc
	.word	0x4710a88b
	.word	0x3b6f7f83
	.word	0xb7c483b8
	.word	0x4ec60601
	.word	0xd48103e7
	.word	0x015e5403
	.word	0x17ed3f06
	.word	0xce865ce4
	.word	0xd3546274
	.word	0xb819a8cd
	.word	0x2fd34a22
	.word	0xa3316386
	.word	0xb74e6578
	.word	0x6d1a86ab
	.word	0x26fa0451
	.word	0x9bff324b
	.word	0xdb5f5650
	.word	0xf8be523f
	.word	0xcadeb14d
	.word	0xa39fcbbd
	.word	0x70baa7b8
	.word	0x25aeedef
	.word	0xc9c02621
	.word	0x46c4919c
	.word	0x8cfdc748
	.word	0x3556871d
	.word	0x6639e058
	.word	0x11237739
	.word	0xe1340341
	.word	0x15a6829b
	.word	0xa856eb56
	.word	0x9cca8503
	.word	0xed0c8889
	.word	0x54fc3c5e
	.word	0x8c233804
	.word	0xfdef8162
	.word	0xf363bcf4
	.word	0xd6658e70
	.word	0x55084ab3
	.word	0x8bd0d2c3
	.word	0x4f9179c4
	.word	0xd632532b
	.word	0x5aac6339
	.word	0xd2f9eef3
	.word	0x9201ea73
	.word	0xc3df56a3
	.word	0x15d98360
	.word	0x3f8eebb0
	.word	0x86b713af
	.word	0x563a6b64
	.word	0x4c63f781
	.word	0x1c68047d
	.word	0xc5ad46a5
	.word	0x8066965d
	.word	0x405e456b
	.word	0x46ff29b6
	.word	0xfbfd0481
	.word	0x3d62861a
	.word	0x2362a588
	.word	0x2dbeece3
	.word	0xd1391635
	.word	0xa322c939
	.word	0x90986a42
	.word	0xa7635e50
	.word	0x3f2fdc7a
	.word	0x29747816
	.word	0xe99df9a2
	.word	0x1412afdc
	.word	0xbf231c14
	.word	0x52f445c8
	.word	0x79e63d3a
	.word	0x3cdcb111
	.word	0xb6f9ca59
	.word	0xeab12c51
	.word	0xb3a2ac45
	.word	0x19ad7875
	.word	0xb7239df3
	.word	0x3ed12810
	.word	0x8f41540c
	.word	0x29b0ce1f
	.word	0x071e67e4
	.word	0x4b01b67a
	.word	0x9518828a
	.word	0x53e92b8c
	.word	0x9f0978ca
	.word	0xbbe50c09
	.word	0xc64ff752
	.word	0x5e9664b2
	.word	0x70b39664
	.word	0x62483573
	.word	0x00b1beb0
	.word	0x51354e56
	.word	0xfe544554
	.word	0xd0fd981f
	.word	0x870b1b0f
	.word	0x77a2f59a
	.word	0xe8e96b26
	.word	0xedfa85d4
	.word	0x9f682099
	.word	0x02833cd9
	.word	0xd83e8c90
	.word	0x9e0dd7b3
	.word	0x2ffae724
	.word	0x42b3f1b7
	.word	0xe3332bfb
	.word	0xfd70c467
	.word	0x8529764c
	.word	0x6892b073
	.word	0x342a0c42
	.word	0xddd2659a
	.word	0xf54bcfdc
	.word	0x456d287e
	.word	0xd3e35bb8
	.word	0x4791a0aa
	.word	0x8b55bc71
	.word	0x62d89651
	.word	0x58a00b6f
	.word	0x36e0669c
	.word	0xc73e3e61
	.word	0x8226867b
	.word	0x408cd6b7
	.word	0xa9c67f50
t0_data_in_sp:
	.word	0x83b0ced8
	.word	0x3afa35f9
	.word	0x5157bee5
	.word	0xb0a953f6
	.word	0x3ab2c944
	.word	0x8c6323c9
	.word	0xcbbaff55
	.word	0xa3616cc0
	.word	t0_data_in_area0
	.word	t0_data_in_area0
	.word	0x00000007
	.word	0xffffffe0
	.word	0xffffffe4
	.word	0xffffffe0
	.word	t0_data_in_fp
	.word	0xb6aba29c
	.word	0x09d2fa72
	.word	0x1bdedf95
	.word	0xaa193656
	.word	0x3a589b55
	.word	0xc36f85a6
	.word	0x8fd7ede8
	.word	0xf926b458
	.word	0xc4e5ddb7
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
	.word   	0x152ffbf4	! [%fp - 0xc]
	.word   	0x65ad4b1c	! [%fp - 0x8]
	.word   	0xb7dab33e	! [%fp - 0x4]
.global t0_data_in_fp; t0_data_in_fp:
	.word	0x088a6e35
	.word	0x625a0fdd
	.word	0x5b7bb1be
	.word	0x5f6e011e
	.word	0x1783e6f6
	.word	0xc7cca344
	.word	0x3a6481d9
	.word	0xf5df9d07
	.word	0x6ea69234
	.word	0x3072752f
	.word	0xbc2fd566
	.word	0xe547a46a
	.word	0xb52455c6
	.word	0x390b67cf
	.word	0x6096e802
	.word	0x57a132b5
	.word	0x939e43fa
	.word	0xe635a2bd
	.word	0xb2a0c5e1
	.word	0xe5601740
	.word	0xf17de5a8
	.word	0x9e701586
	.word	0xc6a67602
	.word	0xfb11856c
t0_data_in_stacktop:
	.word	0
t0_data_in_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_in_area0, 0x7f104000)
.seg "data"
t0_data_in_area0_start:
.skip 1664
t0_data_in_area0_begin:
	.word	0x31d09183	! t0_data_in_area0-0x20
	.word	0x7d641e69	! t0_data_in_area0-0x1c
	.word	0x913313a4	! t0_data_in_area0-0x18
	.word	0x3c952309	! t0_data_in_area0-0x14
	.word	0xb1b064b2	! t0_data_in_area0-0x10
	.word	0xf65c595e	! t0_data_in_area0-0xc
	.word	0x21478af8	! t0_data_in_area0-0x8
	.word	0x3d6e18f8	! t0_data_in_area0-0x4
.global t0_data_in_area0; t0_data_in_area0:
	.word	0xa6ebb09e	! t0_data_in_area0+0x0
	.word	0x25aadb5a	! t0_data_in_area0+0x4
	.word	0xbcd0ed17	! t0_data_in_area0+0x8
	.word	0xeb820a11	! t0_data_in_area0+0xc
	.word	0x7754f20d	! t0_data_in_area0+0x10
	.word	0xf4215dd1	! t0_data_in_area0+0x14
	.word	0x879b8f35	! t0_data_in_area0+0x18
	.word	0xee961446	! t0_data_in_area0+0x1c
t0_data_in_area0_end:
.skip 6464
t0_data_in_area0_stop:

KDATA_MODULE(t0_module_data_in_shm_area, 0x39200000)
.seg "data"
t0_data_in_shm_area_start:
t0_data_in_shm_area_begin:
.global t0_data_in_shm_area; t0_data_in_shm_area:
	.word	0xf532a570	! t0_data_in_shm_area+0x0 (t0)
	.word	0xe0e21e7c	! t0_data_in_shm_area+0x4 (t0)
	.word	0x5afc6917	! t0_data_in_shm_area+0x8 (t0)
	.word	0x51384008	! t0_data_in_shm_area+0xc (t0)
	.word	0x6ce78c78	! t0_data_in_shm_area+0x10 (t0)
	.word	0x7cf8775c	! t0_data_in_shm_area+0x14 (t0)
	.word	0x1a0d66c2	! t0_data_in_shm_area+0x18 (t0)
	.word	0xf9c601e9	! t0_data_in_shm_area+0x1c (t0)
	.word	0xc06138ee	! t0_data_in_shm_area+0x20 (t0)
	.word	0x3d9472fd	! t0_data_in_shm_area+0x24 (t0)
	.word	0x62f0a174	! t0_data_in_shm_area+0x28 (t0)
	.word	0xa226b282	! t0_data_in_shm_area+0x2c (t0)
	.word	0xa763f0c3	! t0_data_in_shm_area+0x30 (t0)
	.word	0xa5b4e0ff	! t0_data_in_shm_area+0x34 (t0)
	.word	0x7c59b3d7	! t0_data_in_shm_area+0x38 (t0)
	.word	0x14db2096	! t0_data_in_shm_area+0x3c (t0)
	.word	0x9da83f66	! t0_data_in_shm_area+0x40 (t0 bload)
	.word	0x0abfaed2	! t0_data_in_shm_area+0x44
	.word	0xb6db9d74	! t0_data_in_shm_area+0x48
	.word	0xdc71a177	! t0_data_in_shm_area+0x4c
	.word	0xb22fc855	! t0_data_in_shm_area+0x50
	.word	0x894088c0	! t0_data_in_shm_area+0x54
	.word	0xce6ce965	! t0_data_in_shm_area+0x58
	.word	0x498043a8	! t0_data_in_shm_area+0x5c
	.word	0xc37c2ef7	! t0_data_in_shm_area+0x60
	.word	0x8c020730	! t0_data_in_shm_area+0x64
	.word	0xc17b0c4e	! t0_data_in_shm_area+0x68
	.word	0xa13d07c3	! t0_data_in_shm_area+0x6c
	.word	0x43ac27a7	! t0_data_in_shm_area+0x70
	.word	0x8035ec28	! t0_data_in_shm_area+0x74
	.word	0xdb012d8e	! t0_data_in_shm_area+0x78
	.word	0x75e6439d	! t0_data_in_shm_area+0x7c
	.word	0x43300613	! t0_data_in_shm_area+0x80 (t0 bstore)
	.word	0xa9a53513	! t0_data_in_shm_area+0x84
	.word	0x93a5cfb0	! t0_data_in_shm_area+0x88
	.word	0x08ab93a7	! t0_data_in_shm_area+0x8c
	.word	0xaa085cc7	! t0_data_in_shm_area+0x90
	.word	0x3a2904c4	! t0_data_in_shm_area+0x94
	.word	0x66260c27	! t0_data_in_shm_area+0x98
	.word	0x34e9fe96	! t0_data_in_shm_area+0x9c
	.word	0x7b968204	! t0_data_in_shm_area+0xa0
	.word	0xd439a9ba	! t0_data_in_shm_area+0xa4
	.word	0xa48c563a	! t0_data_in_shm_area+0xa8
	.word	0xbc942f46	! t0_data_in_shm_area+0xac
	.word	0x19300dd6	! t0_data_in_shm_area+0xb0
	.word	0xf97144a5	! t0_data_in_shm_area+0xb4
	.word	0xe11bf93d	! t0_data_in_shm_area+0xb8
	.word	0xf7c9e8db	! t0_data_in_shm_area+0xbc
t0_data_in_shm_area_end:
t0_data_in_shm_area_stop:

KDATA_MODULE(t0_module_data_exp_regs, 0x4d8aa000)
.seg "data"
KGLOBAL(t0_data_exp_regs)
t0_data_exp_regs_start:
t0_data_exp_regs:
	.word	0x9f27b486          ! %f0
	.word	0xd8b82682          ! %f1
	.word	0x91982066          ! %f2
	.word	0x183953b5          ! %f3
	.word	0xe76a5cba          ! %f4
	.word	0x78d41614          ! %f5
	.word	0x8eed7fce          ! %f6
	.word	0x9dc8d769          ! %f7
	.word	0x746b8f1a          ! %f8
	.word	0x7d1d12d4          ! %f9
	.word	0xa0c3e14a          ! %f10
	.word	0xf50b38a3          ! %f11
	.word	0x56adb473          ! %f12
	.word	0x91b99da3          ! %f13
	.word	0x9861c317          ! %f14
	.word	0x7667af67          ! %f15
	.word	0x07d686df          ! %f16
	.word	0x33af565b          ! %f17
	.word	0xe14ef63c          ! %f18
	.word	0x52b6cfa1          ! %f19
	.word	0x42ea7248          ! %f20
	.word	0x8c91ac02          ! %f21
	.word	0x84f45ca6          ! %f22
	.word	0x244ad67c          ! %f23
	.word	0x5bbef92b          ! %f24
	.word	0x516edc3b          ! %f25
	.word	0x19f6e594          ! %f26
	.word	0xfb9ef8f4          ! %f27
	.word	0xeea8219e          ! %f28
	.word	0x5748f5ff          ! %f29
	.word	0x4a1b6c34          ! %f30
	.word	0x929487aa          ! %f31
	.word	0x7f212e93          ! %f32
	.word	0x7a0fd38d          ! %f33
	.word	0xc6375c8e          ! %f34
	.word	0x183dfbf6          ! %f35
	.word	0x1171295e          ! %f36
	.word	0x18ec3f9f          ! %f37
	.word	0x198c42a1          ! %f38
	.word	0x9ea54242          ! %f39
	.word	0x6c4fff74          ! %f40
	.word	0xcafbb9dd          ! %f41
	.word	0x032aa7cb          ! %f42
	.word	0xccfbd595          ! %f43
	.word	0xf4993875          ! %f44
	.word	0xbd9f8e96          ! %f45
	.word	0x9edae26d          ! %f46
	.word	0x1878806e          ! %f47
	.word	0xba65886b          ! %f48
	.word	0x107935ad          ! %f49
	.word	0x6dd0bbce          ! %f50
	.word	0x860fd6d3          ! %f51
	.word	0x94b4c254          ! %f52
	.word	0x56592cd1          ! %f53
	.word	0x14591040          ! %f54
	.word	0x4471bda8          ! %f55
	.word	0x1365eedd          ! %f56
	.word	0x7504c0f0          ! %f57
	.word	0xa2fecd80          ! %f58
	.word	0x49879344          ! %f59
	.word	0xa6d38b70          ! %f60
	.word	0x730a7aed          ! %f61
	.word	0x6196f362          ! %f62
	.word	0x5e53cd41          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0x520       ! %g1 (code pointer)
	.word	t0_data_exp_shm_area! %g2 (shared area pointer)
	.word	0x6b9e89f5          ! %g3 (loop index)
	.word	SYM(t0_subr2)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0xd8492090          ! %o0
	.word	0xa93ebde8          ! %o1
	.word	0x8cfb8285          ! %o2
	.word	0x3c469ffd          ! %o3
	.word	0x3c473d49          ! %o4
	.word	0x0b86b9c7          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0xed463570          ! %l0
	.word	0x5224238f          ! %l1
	.word	0x17797aad          ! %l2
	.word	0x90cd1f93          ! %l3
	.word	0x70d045c3          ! %l4
	.word	0x092092bd          ! %l5
	.word	0xa0274643          ! %l6
	.word	0x1a5c80db          ! %l7
	.word	t0_data_exp_area0   ! %i0 (area pointer)
	.word	t0_data_exp_area0   ! %i1 (area pointer)
	.word	0xfffffffa          ! %i2 (byte offset)
	.word	0x00000018          ! %i3 (halfword offset)
	.word	0x0000001c          ! %i4 (word offset)
	.word	0x00000008          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0x958916f5          ! %y
	.word	0x0000000f          ! %icc (nzvc)
	.word	0x800008e9          ! %fsr
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

KDATA_MODULE(t0_module_data_exp_stack, 0x3568a000)
.seg "data"
KGLOBAL(t0_data_exp_mtbl_size)
KGLOBAL(t0_data_exp_mtbl)
KGLOBAL(t0_data_exp_stack)
t0_data_exp_stack_start:
	.word	0x312c7f45
	.word	0x87a2f386
	.word	0x4f9c4265
	.word	0xfaa06a30
	.word	0xaf5a094b
	.word	0xb9709e73
	.word	0x244677b1
	.word	0x8abcf596
	.word	0xfdb779bd
	.word	0x3f0d899d
	.word	0x84c74cb6
	.word	0xbf393f9b
	.word	0xf6d248ff
	.word	0x824a8cc2
	.word	0x6f0e79b9
	.word	0x25f2a25e
	.word	0xd72128b6
	.word	0xa34a6653
	.word	0x33c8c9a7
	.word	0x3c592cd9
	.word	0x4afa2dab
	.word	0xea24698c
	.word	0xd37a30a2
	.word	0xbd75d10e
	.word	0xe4a733f5
	.word	0xe8bb79c5
	.word	0x164446bc
	.word	0x3868c180
	.word	0x7719e157
	.word	0xbfb8e708
	.word	0xfd532b01
	.word	0xef6bb1e4
	.word	0xcdf2e9e6
	.word	0x807fffe2
	.word	0x940712ba
	.word	0x47eaef18
	.word	0xa0a67aef
	.word	0xade86c7e
	.word	0x7b9108f0
	.word	0x16038254
	.word	0x96c1f017
	.word	0xe3daa6ef
	.word	0xa21da22f
	.word	0xa7e3d39f
	.word	0x4cf536c2
	.word	0xc3cb24cc
	.word	0x4710a88b
	.word	0x3b6f7f83
	.word	0xb7c483b8
	.word	0x4ec60601
	.word	0xd48103e7
	.word	0x015e5403
	.word	0x17ed3f06
	.word	0xce865ce4
	.word	0xd3546274
	.word	0xb819a8cd
	.word	0x2fd34a22
	.word	0xa3316386
	.word	0xb74e6578
	.word	0x6d1a86ab
	.word	0x26fa0451
	.word	0x9bff324b
	.word	0xdb5f5650
	.word	0xf8be523f
	.word	0xcadeb14d
	.word	0xa39fcbbd
	.word	0x70baa7b8
	.word	0x25aeedef
	.word	0xc9c02621
	.word	0x46c4919c
	.word	0x8cfdc748
	.word	0x3556871d
	.word	0x6639e058
	.word	0x11237739
	.word	0xe1340341
	.word	0x15a6829b
	.word	0xa856eb56
	.word	0x9cca8503
	.word	0xed0c8889
	.word	0x54fc3c5e
	.word	0x8c233804
	.word	0xfdef8162
	.word	0xf363bcf4
	.word	0xd6658e70
	.word	0x55084ab3
	.word	0x8bd0d2c3
	.word	0x4f9179c4
	.word	0xd632532b
	.word	0x5aac6339
	.word	0xd2f9eef3
	.word	0x9201ea73
	.word	0xc3df56a3
	.word	0x15d98360
	.word	0x3f8eebb0
	.word	0x86b713af
	.word	0x563a6b64
	.word	0x4c63f781
	.word	0x1c68047d
	.word	0xc5ad46a5
	.word	0x8066965d
	.word	0x405e456b
	.word	0x46ff29b6
	.word	0xfbfd0481
	.word	0x3d62861a
	.word	0x2362a588
	.word	0x2dbeece3
	.word	0xd1391635
	.word	0xa322c939
	.word	0x90986a42
	.word	0xa7635e50
	.word	0x3f2fdc7a
	.word	0x29747816
	.word	0xe99df9a2
	.word	0x1412afdc
	.word	0xbf231c14
	.word	0x52f445c8
	.word	0x79e63d3a
	.word	0x3cdcb111
	.word	0xb6f9ca59
	.word	0xeab12c51
	.word	0xb3a2ac45
	.word	0x19ad7875
	.word	0xb7239df3
	.word	0x3ed12810
	.word	0x8f41540c
	.word	0x29b0ce1f
	.word	0x071e67e4
	.word	0x4b01b67a
	.word	0x9518828a
	.word	0x53e92b8c
	.word	0x9f0978ca
	.word	0xbbe50c09
	.word	0xc64ff752
	.word	0x5e9664b2
	.word	0x70b39664
	.word	0x62483573
	.word	0x00b1beb0
	.word	0x51354e56
	.word	0xfe544554
	.word	0xd0fd981f
	.word	0x870b1b0f
	.word	0x77a2f59a
	.word	0xe8e96b26
	.word	0xedfa85d4
	.word	0x9f682099
	.word	0x02833cd9
	.word	0xd83e8c90
	.word	0x9e0dd7b3
	.word	0x2ffae724
	.word	0x42b3f1b7
	.word	0xe3332bfb
	.word	0xfd70c467
	.word	0x8529764c
	.word	0x6892b073
	.word	0x342a0c42
	.word	0xddd2659a
	.word	0xf54bcfdc
	.word	0x456d287e
	.word	0xd3e35bb8
	.word	0x4791a0aa
	.word	0x8b55bc71
	.word	0x62d89651
	.word	0x58a00b6f
	.word	0x36e0669c
	.word	0xc73e3e61
	.word	0x8226867b
	.word	0x408cd6b7
	.word	0xa9c67f50
t0_data_exp_sp:
	.word	0x83b0ced8
	.word	0x3afa35f9
	.word	0x5157bee5
	.word	0xb0a953f6
	.word	0x3ab2c944
	.word	0x8c6323c9
	.word	0xcbbaff55
	.word	0xa3616cc0
	.word	t0_data_exp_area0
	.word	t0_data_exp_area0
	.word	0x00000007
	.word	0xffffffe0
	.word	0xffffffe4
	.word	0xffffffe0
	.word	t0_data_exp_fp
	.word	0xb6aba29c
	.word	0x09d2fa72
	.word	0x1bdedf95
	.word	0xaa193656
	.word	0x3a589b55
	.word	0xc36f85a6
	.word	0x8fd7ede8
	.word	0xf926b458
	.word	0xc4e5ddb7
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
	.word   	0x152ffbf4	! [%fp - 0xc]
	.word   	0x65ad4b1c	! [%fp - 0x8]
	.word   	0xb7dab33e	! [%fp - 0x4]
t0_data_exp_fp:
	.word	0x088a6e35
	.word	0x625a0fdd
	.word	0x5b7bb1be
	.word	0x5f6e011e
	.word	0x1783e6f6
	.word	0xc7cca344
	.word	0x3a6481d9
	.word	0xf5df9d07
	.word	0x6ea69234
	.word	0x3072752f
	.word	0xbc2fd566
	.word	0xe547a46a
	.word	0xb52455c6
	.word	0x390b67cf
	.word	0x6096e802
	.word	0x57a132b5
	.word	0x939e43fa
	.word	0xe635a2bd
	.word	0xb2a0c5e1
	.word	0xe5601740
	.word	0xf17de5a8
	.word	0x9e701586
	.word	0xc6a67602
	.word	0xfb11856c
t0_data_exp_stacktop:
	.word	0
t0_data_exp_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_exp_area0, 0x7a55c000)
.seg "data"
t0_data_exp_area0_start:
.skip 1664
t0_data_exp_area0_begin:
	.word	0x31d09183	! t0_data_exp_area0-0x20
	.word	0x7d641e69	! t0_data_exp_area0-0x1c
	.word	0x913313a4	! t0_data_exp_area0-0x18
	.word	0x3c952309	! t0_data_exp_area0-0x14
	.word	0xb1b064b2	! t0_data_exp_area0-0x10
	.word	0xf65c595e	! t0_data_exp_area0-0xc
	.word	0x21478af8	! t0_data_exp_area0-0x8
	.word	0x3d6e18f8	! t0_data_exp_area0-0x4
.global t0_data_exp_area0; t0_data_exp_area0:
	.word	0xa6ebb09e	! t0_data_exp_area0+0x0
	.word	0x25aadb5a	! t0_data_exp_area0+0x4
	.word	0xbcd0ed17	! t0_data_exp_area0+0x8
	.word	0xeb820a11	! t0_data_exp_area0+0xc
	.word	0x7754f20d	! t0_data_exp_area0+0x10
	.word	0xf4215dd1	! t0_data_exp_area0+0x14
	.word	0x879b8f35	! t0_data_exp_area0+0x18
	.word	0xee961446	! t0_data_exp_area0+0x1c
t0_data_exp_area0_end:
.skip 6464
t0_data_exp_area0_stop:

KDATA_MODULE(t0_module_data_exp_shm_area, 0x182d6000)
.seg "data"
t0_data_exp_shm_area_start:
t0_data_exp_shm_area_begin:
.global t0_data_exp_shm_area; t0_data_exp_shm_area:
	.word	0xf532a570	! t0_data_exp_shm_area+0x0 (t0)
	.word	0xe0e21e7c	! t0_data_exp_shm_area+0x4 (t0)
	.word	0x5afc6917	! t0_data_exp_shm_area+0x8 (t0)
	.word	0x51384008	! t0_data_exp_shm_area+0xc (t0)
	.word	0x6ce78c78	! t0_data_exp_shm_area+0x10 (t0)
	.word	0x7cf8775c	! t0_data_exp_shm_area+0x14 (t0)
	.word	0x1a0d66c2	! t0_data_exp_shm_area+0x18 (t0)
	.word	0xf9c601e9	! t0_data_exp_shm_area+0x1c (t0)
	.word	0xc06138ee	! t0_data_exp_shm_area+0x20 (t0)
	.word	0x3d9472fd	! t0_data_exp_shm_area+0x24 (t0)
	.word	0x62f0a174	! t0_data_exp_shm_area+0x28 (t0)
	.word	0xa226b282	! t0_data_exp_shm_area+0x2c (t0)
	.word	0xa763f0c3	! t0_data_exp_shm_area+0x30 (t0)
	.word	0xa5b4e0ff	! t0_data_exp_shm_area+0x34 (t0)
	.word	0x7c59b3d7	! t0_data_exp_shm_area+0x38 (t0)
	.word	0x14db2096	! t0_data_exp_shm_area+0x3c (t0)
	.word	0x9da83f66	! t0_data_exp_shm_area+0x40 (t0 bload)
	.word	0x0abfaed2	! t0_data_exp_shm_area+0x44
	.word	0xb6db9d74	! t0_data_exp_shm_area+0x48
	.word	0xdc71a177	! t0_data_exp_shm_area+0x4c
	.word	0xb22fc855	! t0_data_exp_shm_area+0x50
	.word	0x894088c0	! t0_data_exp_shm_area+0x54
	.word	0xce6ce965	! t0_data_exp_shm_area+0x58
	.word	0x498043a8	! t0_data_exp_shm_area+0x5c
	.word	0xc37c2ef7	! t0_data_exp_shm_area+0x60
	.word	0x8c020730	! t0_data_exp_shm_area+0x64
	.word	0xc17b0c4e	! t0_data_exp_shm_area+0x68
	.word	0xa13d07c3	! t0_data_exp_shm_area+0x6c
	.word	0x43ac27a7	! t0_data_exp_shm_area+0x70
	.word	0x8035ec28	! t0_data_exp_shm_area+0x74
	.word	0xdb012d8e	! t0_data_exp_shm_area+0x78
	.word	0x75e6439d	! t0_data_exp_shm_area+0x7c
	.word	0x43300613	! t0_data_exp_shm_area+0x80 (t0 bstore)
	.word	0xa9a53513	! t0_data_exp_shm_area+0x84
	.word	0x93a5cfb0	! t0_data_exp_shm_area+0x88
	.word	0x08ab93a7	! t0_data_exp_shm_area+0x8c
	.word	0xaa085cc7	! t0_data_exp_shm_area+0x90
	.word	0x3a2904c4	! t0_data_exp_shm_area+0x94
	.word	0x66260c27	! t0_data_exp_shm_area+0x98
	.word	0x34e9fe96	! t0_data_exp_shm_area+0x9c
	.word	0x7b968204	! t0_data_exp_shm_area+0xa0
	.word	0xd439a9ba	! t0_data_exp_shm_area+0xa4
	.word	0xa48c563a	! t0_data_exp_shm_area+0xa8
	.word	0xbc942f46	! t0_data_exp_shm_area+0xac
	.word	0x19300dd6	! t0_data_exp_shm_area+0xb0
	.word	0xf97144a5	! t0_data_exp_shm_area+0xb4
	.word	0xe11bf93d	! t0_data_exp_shm_area+0xb8
	.word	0xf7c9e8db	! t0_data_exp_shm_area+0xbc
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
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, TTE_X=1,
        TTE_L=0, TTE_CP=T0_KAOS_BOOT_CACHEABLE, TTE_CV=T0_KAOS_BOOT_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=0
        }

attr_text {
        Name = kaos_startup,
        VA=T0_KAOS_STARTUP_VA, 
	PA=ra2pa(T0_KAOS_STARTUP_PA,0),
	RA=T0_KAOS_STARTUP_PA,
        part_0_ctx_nonzero_tsb_config_1,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, TTE_X=1,
        TTE_L=0, TTE_CP=T0_KAOS_STARTUP_CACHEABLE, TTE_CV=T0_KAOS_STARTUP_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=0
        }


attr_text {
        Name = kaos_done,
        VA=T0_KAOS_DONE_VA, 
	PA=ra2pa(T0_KAOS_DONE_PA,0),
	RA=T0_KAOS_DONE_PA,
        part_0_ctx_nonzero_tsb_config_2,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, TTE_X=1,
        TTE_L=0, TTE_CP=T0_KAOS_DONE_CACHEABLE, TTE_CV=T0_KAOS_DONE_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=0
        }


attr_text {
        Name = t0_module_ktbl, 
        VA=T0_KAOS_KTBL_VA, 
	PA=ra2pa(T0_KAOS_KTBL_PA,0),
	RA=T0_KAOS_KTBL_PA,
        part_0_ctx_nonzero_tsb_config_3,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, TTE_X=1,
        TTE_L=0, TTE_CP=T0_KAOS_KTBL_CACHEABLE, TTE_CV=T0_KAOS_KTBL_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=0
        }


attr_text {
        Name = t0_module_ktbl,
        VA=T0_KAOS_KTBL_VA,
	PA=ra2pa(T0_KAOS_KTBL_PA,0),
	RA=T0_KAOS_KTBL_PA,
        part_0_ctx_nonzero_tsb_config_0,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, TTE_X=1,
        TTE_L=0, TTE_CP=T0_KAOS_KTBL_CACHEABLE, TTE_CV=T0_KAOS_KTBL_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1, tsbonly
        }


attr_text {
        Name = t0_module_subr0, 
        VA=T0_KAOS_SUBR0_VA, 
	PA=ra2pa(T0_KAOS_SUBR0_PA,0),
	RA=T0_KAOS_SUBR0_PA,
        part_0_ctx_nonzero_tsb_config_1,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, TTE_X=1,
        TTE_L=0, TTE_CP=T0_KAOS_SUBR0_CACHEABLE, TTE_CV=T0_KAOS_SUBR0_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=0
        }

attr_text {
        Name = t0_module_subr1, 
        VA=T0_KAOS_SUBR1_VA, 
	PA=ra2pa(T0_KAOS_SUBR1_PA,0),
	RA=T0_KAOS_SUBR1_PA,
        part_0_ctx_nonzero_tsb_config_2,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, TTE_X=1,
        TTE_L=0, TTE_CP=T0_KAOS_SUBR1_CACHEABLE, TTE_CV=T0_KAOS_SUBR1_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=0
        }


attr_text {
        Name = t0_module_subr2, 
        VA=T0_KAOS_SUBR2_VA, 
	PA=ra2pa(T0_KAOS_SUBR2_PA,0),
	RA=T0_KAOS_SUBR2_PA,
        part_0_ctx_nonzero_tsb_config_3,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, TTE_X=1,
        TTE_L=0, TTE_CP=T0_KAOS_SUBR2_CACHEABLE, TTE_CV=T0_KAOS_SUBR2_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=0
        }


attr_text {
        Name = t0_module_subr3, 
        VA=T0_KAOS_SUBR3_VA, 
	PA=ra2pa(T0_KAOS_SUBR3_PA,0),
	RA=T0_KAOS_SUBR3_PA,
        part_0_ctx_nonzero_tsb_config_0,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, TTE_X=1,
        TTE_L=0, TTE_CP=T0_KAOS_SUBR3_CACHEABLE, TTE_CV=T0_KAOS_SUBR3_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=0
        }


attr_data {
        Name = t0_module_offset_table,
        VA=T0_KAOS_OFFSET_TBL_VA, 
	PA=ra2pa(T0_KAOS_OFFSET_TBL_PA,0),
	RA=T0_KAOS_OFFSET_TBL_PA,
        part_0_ctx_nonzero_tsb_config_1,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, TTE_X=1,
        TTE_L=1, TTE_CP=T0_KAOS_OFFSET_TBL_CACHEABLE, TTE_CV=T0_KAOS_OFFSET_TBL_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }





attr_data {
        Name = t0_module_data_in_regs,
        VA=T0_KAOS_RUN_REGS_VA, 
	PA=ra2pa(T0_KAOS_RUN_REGS_PA,0),
	RA=T0_KAOS_RUN_REGS_PA,
        part_0_ctx_nonzero_tsb_config_2,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, TTE_X=1,
        TTE_L=1, TTE_CP=T0_KAOS_RUN_REGS_CACHEABLE, TTE_CV=T0_KAOS_RUN_REGS_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }



attr_data {
        Name = t0_module_data_in_stack,
        VA=T0_KAOS_RUN_STACK_VA, 
	PA=ra2pa(T0_KAOS_RUN_STACK_PA,0),
	RA=T0_KAOS_RUN_STACK_PA,
        part_0_ctx_nonzero_tsb_config_3,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, TTE_X=1,
        TTE_L=1, TTE_CP=T0_KAOS_RUN_STACK_CACHEABLE, TTE_CV=T0_KAOS_RUN_STACK_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }



attr_data {
        Name = t0_module_data_in_area0,
        VA=T0_KAOS_RUN_AREA0_VA, 
	PA=ra2pa(T0_KAOS_RUN_AREA0_PA,0),
	RA=T0_KAOS_RUN_AREA0_PA,
        part_0_ctx_nonzero_tsb_config_0,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, TTE_X=1,
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
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, TTE_X=1,
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
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, TTE_X=1,
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
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, TTE_X=1,
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
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, TTE_X=1,
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
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, TTE_X=1,
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
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, TTE_X=1,
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
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, TTE_X=1,
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
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, TTE_X=1,
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
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, TTE_X=1,
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
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, TTE_X=1,
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
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, TTE_X=1,
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
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, TTE_X=1,
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
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, TTE_X=1,
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
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, TTE_X=1,
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
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, TTE_X=1,
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
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, TTE_X=1,
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
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, TTE_X=1,
        TTE_L=1, TTE_CP=T0_KAOS_EXP_REGS_CACHEABLE, TTE_CV=T0_KAOS_EXP_REGS_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }


attr_data {
        Name = t0_module_data_exp_stack,
        VA=T0_KAOS_EXP_STACK_VA, 
	PA=ra2pa(T0_KAOS_EXP_STACK_PA,0),
	RA=T0_KAOS_EXP_STACK_PA,
        part_0_ctx_nonzero_tsb_config_2,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, TTE_X=1,
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
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, TTE_X=1,
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
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, TTE_X=1,
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
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, TTE_X=1,
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
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, TTE_X=1,
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
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, TTE_X=1,
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
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, TTE_X=1,
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
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, TTE_X=1,
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
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, TTE_X=1,
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
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, TTE_X=1,
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
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, TTE_X=1,
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
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, TTE_X=1,
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
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, TTE_X=1,
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
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, TTE_X=1,
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
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, TTE_X=1,
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
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, TTE_X=1,
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
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, TTE_X=1,
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
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, TTE_X=1,
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
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, TTE_X=1,
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
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, TTE_X=1,
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



