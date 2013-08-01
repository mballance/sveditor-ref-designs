/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: kaos_27_1_2004_0_49.s
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
#define T0_KAOS_SEED          d1e9dd9f5cd3
#define T0_KAOS_ICOUNT        2513
#define T0_KAOS_AREAS         1
#define T0_KAOS_AREASIZE      64
#define T0_KAOS_AREAOFFSET    3264
#define T0_KAOS_PAGESIZE      8192
#define T0_KAOS_CODECOUNT     2515

#define T0_KAOS_BOOT_VA                  0x480a4000
#define T0_KAOS_BOOT_PA                  0x0000000000a86000
#define T0_KAOS_BOOT_CACHEABLE           1
#define T0_KAOS_BOOT_NONCACHEABLE        0

#define T0_KAOS_STARTUP_VA               0x61a68000
#define T0_KAOS_STARTUP_PA               0x00000000027d6000
#define T0_KAOS_STARTUP_CACHEABLE        1
#define T0_KAOS_STARTUP_NONCACHEABLE     0

#define T0_KAOS_OFFSET_TBL_VA            0x4f32c000
#define T0_KAOS_OFFSET_TBL_PA            0x00000000042c4000
#define T0_KAOS_OFFSET_TBL_CACHEABLE     1
#define T0_KAOS_OFFSET_TBL_NONCACHEABLE  0

#define T0_KAOS_DONE_VA                  0x0a55c000
#define T0_KAOS_DONE_PA                  0x0000000006006000
#define T0_KAOS_DONE_CACHEABLE           1
#define T0_KAOS_DONE_NONCACHEABLE        0

#define T0_KAOS_KTBL_VA                  0x57e46000
#define T0_KAOS_KTBL_PA                  0x00000000091bc000
#define T0_KAOS_KTBL_CACHEABLE           1
#define T0_KAOS_KTBL_NONCACHEABLE        0

#define T0_KAOS_SUBR0_VA                 0x57dc0000
#define T0_KAOS_SUBR0_PA                 0x000000000b6e6000
#define T0_KAOS_SUBR0_CACHEABLE          1
#define T0_KAOS_SUBR0_NONCACHEABLE       0
#define T0_KAOS_SUBR1_VA                 0x57dc6000
#define T0_KAOS_SUBR1_PA                 0x000000000d3ec000
#define T0_KAOS_SUBR1_CACHEABLE          1
#define T0_KAOS_SUBR1_NONCACHEABLE       0
#define T0_KAOS_SUBR2_VA                 0x580a2000
#define T0_KAOS_SUBR2_PA                 0x000000000fd18000
#define T0_KAOS_SUBR2_CACHEABLE          1
#define T0_KAOS_SUBR2_NONCACHEABLE       0
#define T0_KAOS_SUBR3_VA                 0x73170000
#define T0_KAOS_SUBR3_PA                 0x0000000010916000
#define T0_KAOS_SUBR3_CACHEABLE          1
#define T0_KAOS_SUBR3_NONCACHEABLE       0

#define T0_KAOS_EXP_REGS_VA              0x155ca000
#define T0_KAOS_EXP_REGS_PA              0x0000000013d4e000
#define T0_KAOS_EXP_REGS_CACHEABLE       1
#define T0_KAOS_EXP_REGS_NONCACHEABLE    0
#define T0_KAOS_RUN_REGS_VA              0x1f7e2000
#define T0_KAOS_RUN_REGS_PA              0x00000000148b2000
#define T0_KAOS_RUN_REGS_CACHEABLE       1
#define T0_KAOS_RUN_REGS_NONCACHEABLE    0

#define T0_KAOS_EXP_STACK_VA             0x0c7f8000
#define T0_KAOS_EXP_STACK_PA             0x0000000017900000
#define T0_KAOS_EXP_STACK_CACHEABLE      1
#define T0_KAOS_EXP_STACK_NONCACHEABLE   0
#define T0_KAOS_RUN_STACK_VA             0x0c408000
#define T0_KAOS_RUN_STACK_PA             0x0000000018c02000
#define T0_KAOS_RUN_STACK_CACHEABLE      1
#define T0_KAOS_RUN_STACK_NONCACHEABLE   0

#define T0_KAOS_AREA0
#define T0_KAOS_EXP_AREA0_VA             0x2c76e000
#define T0_KAOS_EXP_AREA0_PA             0x000000001aaba000
#define T0_KAOS_EXP_AREA0_CACHEABLE      1
#define T0_KAOS_EXP_AREA0_NONCACHEABLE   0
#define T0_KAOS_RUN_AREA0_VA             0x316d6000
#define T0_KAOS_RUN_AREA0_PA             0x000000001deac000
#define T0_KAOS_RUN_AREA0_CACHEABLE      1
#define T0_KAOS_RUN_AREA0_NONCACHEABLE   0

#define T0_KAOS_SHM_AREA
#define T0_KAOS_EXP_SHM_AREA_VA          0x1a5aa000
#define T0_KAOS_EXP_SHM_AREA_PA          0x0000000000306000
#define T0_KAOS_EXP_SHM_AREA_CACHEABLE   1
#define T0_KAOS_EXP_SHM_AREA_NONCACHEABLE 0
#define T0_KAOS_RUN_SHM_AREA_VA          0x19446000
#define T0_KAOS_RUN_SHM_AREA_PA          0x0000000000e60000
#define T0_KAOS_RUN_SHM_AREA_CACHEABLE   1
#define T0_KAOS_RUN_SHM_AREA_NONCACHEABLE 0

#define T0_KAOS_RANVAL_00     0xb9c3718f
#define T0_KAOS_RANVAL_01     0x28874880
#define T0_KAOS_RANVAL_02     0x573df440
#define T0_KAOS_RANVAL_03     0x8b1c258d
#define T0_KAOS_RANVAL_04     0x1eece4e4
#define T0_KAOS_RANVAL_05     0x9dc0e183
#define T0_KAOS_RANVAL_06     0x30d4dc0a
#define T0_KAOS_RANVAL_07     0x43cf578b
#define T0_KAOS_RANVAL_08     0x3579fdd6
#define T0_KAOS_RANVAL_09     0xba8742d2
#define T0_KAOS_RANVAL_0a     0x8a5df3b1
#define T0_KAOS_RANVAL_0b     0x53acd80e
#define T0_KAOS_RANVAL_0c     0x8bc8318c
#define T0_KAOS_RANVAL_0d     0xc7c1052b
#define T0_KAOS_RANVAL_0e     0xb65b36f1
#define T0_KAOS_RANVAL_0f     0x089c4825
#define T0_KAOS_RANVAL_10     0x69f29c31
#define T0_KAOS_RANVAL_11     0xeb414952
#define T0_KAOS_RANVAL_12     0x0eb67669
#define T0_KAOS_RANVAL_13     0xd51132b3
#define T0_KAOS_RANVAL_14     0x19d3813e
#define T0_KAOS_RANVAL_15     0x60586d00
#define T0_KAOS_RANVAL_16     0x75e19b7d
#define T0_KAOS_RANVAL_17     0x95f6cc86
#define T0_KAOS_RANVAL_18     0xe5670bfe
#define T0_KAOS_RANVAL_19     0x72869b1b
#define T0_KAOS_RANVAL_1a     0x8a5cc67e
#define T0_KAOS_RANVAL_1b     0x030f21a8
#define T0_KAOS_RANVAL_1c     0x137b144f
#define T0_KAOS_RANVAL_1d     0x5bcaab26
#define T0_KAOS_RANVAL_1e     0xc1fdab08
#define T0_KAOS_RANVAL_1f     0x4d8743f5
#define T0_KAOS_RANVAL_20     0xd70feba5
#define T0_KAOS_RANVAL_21     0xa0bb03fa
#define T0_KAOS_RANVAL_22     0x1225ceab
#define T0_KAOS_RANVAL_23     0x72874eed
#define T0_KAOS_RANVAL_24     0x398a7654
#define T0_KAOS_RANVAL_25     0x0d3d75b6
#define T0_KAOS_RANVAL_26     0x3ccb8dcd
#define T0_KAOS_RANVAL_27     0x5c9e54cb
#define T0_KAOS_RANVAL_28     0x3318150d
#define T0_KAOS_RANVAL_29     0x988e3ef3
#define T0_KAOS_RANVAL_2a     0x1a140ace
#define T0_KAOS_RANVAL_2b     0x345788d6
#define T0_KAOS_RANVAL_2c     0xdba922a9
#define T0_KAOS_RANVAL_2d     0x3595b13c
#define T0_KAOS_RANVAL_2e     0x717a6b6d
#define T0_KAOS_RANVAL_2f     0x67473af6
#define T0_KAOS_RANVAL_30     0x59ef0a25
#define T0_KAOS_RANVAL_31     0xa08f28bc
#define T0_KAOS_RANVAL_32     0xfe63086a
#define T0_KAOS_RANVAL_33     0xfab37889
#define T0_KAOS_RANVAL_34     0xb11738ed
#define T0_KAOS_RANVAL_35     0x3bfb4b39
#define T0_KAOS_RANVAL_36     0xc8bf736b
#define T0_KAOS_RANVAL_37     0xcce56677
#define T0_KAOS_RANVAL_38     0x09cc715d
#define T0_KAOS_RANVAL_39     0xe002c241
#define T0_KAOS_RANVAL_3a     0xe5527723
#define T0_KAOS_RANVAL_3b     0xe36da883
#define T0_KAOS_RANVAL_3c     0x939c4184
#define T0_KAOS_RANVAL_3d     0x700de4a2
#define T0_KAOS_RANVAL_3e     0x387175b0
#define T0_KAOS_RANVAL_3f     0xce7769e4
#define T0_KAOS_RANVAL_40     0xa976a22a
#define T0_KAOS_RANVAL_41     0x1da9031e
#define T0_KAOS_RANVAL_42     0xdc12c944
#define T0_KAOS_RANVAL_43     0x56eadb14
#define T0_KAOS_RANVAL_44     0xcada0214
#define T0_KAOS_RANVAL_45     0x6d144c5f
#define T0_KAOS_RANVAL_46     0x14cf0b07
#define T0_KAOS_RANVAL_47     0x07d938e7
#define T0_KAOS_RANVAL_48     0x0b9e4185
#define T0_KAOS_RANVAL_49     0x82597c28
#define T0_KAOS_RANVAL_4a     0x3b75643c
#define T0_KAOS_RANVAL_4b     0xe8b9b0de
#define T0_KAOS_RANVAL_4c     0x6a756208
#define T0_KAOS_RANVAL_4d     0x94b0c9cd
#define T0_KAOS_RANVAL_4e     0xf8314da2
#define T0_KAOS_RANVAL_4f     0xbe9fb6bc
#define T0_KAOS_RANVAL_50     0xa260ee6d
#define T0_KAOS_RANVAL_51     0xf4a1c9e5
#define T0_KAOS_RANVAL_52     0x9342611c
#define T0_KAOS_RANVAL_53     0x0c089f5a
#define T0_KAOS_RANVAL_54     0x61c75f10
#define T0_KAOS_RANVAL_55     0x1ee4373d
#define T0_KAOS_RANVAL_56     0xcc2d2193
#define T0_KAOS_RANVAL_57     0x826794b7
#define T0_KAOS_RANVAL_58     0xbac4fe60
#define T0_KAOS_RANVAL_59     0x5dcfd70e
#define T0_KAOS_RANVAL_5a     0x9555dd1b
#define T0_KAOS_RANVAL_5b     0xbb743753
#define T0_KAOS_RANVAL_5c     0x4008119f
#define T0_KAOS_RANVAL_5d     0x6c69ec72
#define T0_KAOS_RANVAL_5e     0x9d650d54
#define T0_KAOS_RANVAL_5f     0x7bb180bc
#define T0_KAOS_RANVAL_60     0xc04049e6
#define T0_KAOS_RANVAL_61     0x0c11ef14
#define T0_KAOS_RANVAL_62     0xbbe6da12
#define T0_KAOS_RANVAL_63     0xe8e7bb68
#define T0_KAOS_RANVAL_64     0x5c25c16c
#define T0_KAOS_RANVAL_65     0x1fb67927
#define T0_KAOS_RANVAL_66     0x098da240
#define T0_KAOS_RANVAL_67     0x8fa5a3c5
#define T0_KAOS_RANVAL_68     0xb89c0907
#define T0_KAOS_RANVAL_69     0x7096a099
#define T0_KAOS_RANVAL_6a     0xb099af01
#define T0_KAOS_RANVAL_6b     0xa78a068e
#define T0_KAOS_RANVAL_6c     0x03ba09f1
#define T0_KAOS_RANVAL_6d     0x00232f87
#define T0_KAOS_RANVAL_6e     0xc5667517
#define T0_KAOS_RANVAL_6f     0x30587060
#define T0_KAOS_RANVAL_70     0x20c7bfcf
#define T0_KAOS_RANVAL_71     0xabd66ff3
#define T0_KAOS_RANVAL_72     0xcc400888
#define T0_KAOS_RANVAL_73     0x86f0c28d
#define T0_KAOS_RANVAL_74     0x90cf0eef
#define T0_KAOS_RANVAL_75     0xd2107eb3
#define T0_KAOS_RANVAL_76     0xeea9a67e
#define T0_KAOS_RANVAL_77     0x4a6ac12e
#define T0_KAOS_RANVAL_78     0x136d3ad1
#define T0_KAOS_RANVAL_79     0xb57159ac
#define T0_KAOS_RANVAL_7a     0x6168796e
#define T0_KAOS_RANVAL_7b     0x8413ee7e
#define T0_KAOS_RANVAL_7c     0xca66c0e8
#define T0_KAOS_RANVAL_7d     0x1e091d40
#define T0_KAOS_RANVAL_7e     0x9c33fb7d
#define T0_KAOS_RANVAL_7f     0x421f4766
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
!    icount         2513
!    targetid       NIAGARA:SIM
!    hostid         NIAGARA:5.8
!    areas          1
!    areasize       64
!    areaoffset     3264
!    ncache         0
!    emulate_ncache 1
!    pagesize       8192
!    invsize        0
!    codecount      2515
!    code           57e46000
!    entry          57e46000
!    fsr_exceptions 00000000
!    fsr_roundmode  00000004
!    fsr_mask       c0000fff
!    seed           d1e9dd9f5cd3
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

KTEXT_MODULE(t0_module_ktbl, 0x57e46000)
.seg "text"
	KGLOBAL(t0_ktbl)
t0_ktbl_page_begin:
.global t0_kref; t0_kref:
	.skip 0
t0_ktbl:
	.word	0xa3a188af	! t0_kref+0x0:   	fsubs	%f6, %f15, %f17
	.word	0xfb80a014	! t0_kref+0x4:   	lda	[%g2 + 0x14]%asi, %f29
	.word	0x81de001c	! t0_kref+0x8:   	flush	%i0 + %i4
	.word	0xa31dc017	! t0_kref+0xc:   	tsubcctv	%l7, %l7, %l1
	.word	0xafa01a3e	! t0_kref+0x10:   	fstoi	%f30, %f23
	.word	0x9eaa801a	! t0_kref+0x14:   	andncc	%o2, %i2, %o7
	.word	0xd120a03c	! t0_kref+0x18:   	st	%f8, [%g2 + 0x3c]
	.word	0x39800001	! t0_kref+0x1c:   	fbuge,a	_kref+0x20
	.word	0xa81ebc2d	! t0_kref+0x20:   	xor	%i2, -0x3d3, %l4
	.word	0xa47a4008	! t0_kref+0x24:   	sdiv	%o1, %o0, %l2
	.word	0x93a508b0	! t0_kref+0x28:   	fsubs	%f20, %f16, %f9
	.word	0x2d800003	! t0_kref+0x2c:   	fbg,a	_kref+0x38
	.word	0xb3a64836	! t0_kref+0x30:   	fadds	%f25, %f22, %f25
	.word	0x3f800003	! t0_kref+0x34:   	fbo,a	_kref+0x40
	.word	0x151341d5	! t0_kref+0x38:   	sethi	%hi(0x4d075400), %o2
	.word	0x2f800003	! t0_kref+0x3c:   	fbu,a	_kref+0x48
	.word	0xaba01892	! t0_kref+0x40:   	fitos	%f18, %f21
	.word	0x81830000	! t0_kref+0x44:   	wr	%o4, %g0, %y
	.word	0xada308d4	! t0_kref+0x48:   	fsubd	%f12, %f20, %f22
	.word	0xa5a0102a	! t0_kref+0x4c:   	fstox	%f10, %f18
	.word	0x81d8400b	! t0_kref+0x50:   	flush	%g1 + %o3
	.word	0xf007bfe0	! t0_kref+0x54:   	ld	[%fp - 0x20], %i0
	.word	0x30480001	! t0_kref+0x58:   	ba,a,pt	%icc, _kref+0x5c
	.word	0xa5a34d28	! t0_kref+0x5c:   	fsmuld	%f13, %f8, %f18
	.word	0x19383a2e	! t0_kref+0x60:   	sethi	%hi(0xe0e8b800), %o4
	.word	0xee6e8019	! t0_kref+0x64:   	ldstub	[%i2 + %i1], %l7
	.word	0xe04e3ff1	! t0_kref+0x68:   	ldsb	[%i0 - 0xf], %l0
	.word	0xe60e3fec	! t0_kref+0x6c:   	ldub	[%i0 - 0x14], %l3
	.word	0x960d73de	! t0_kref+0x70:   	and	%l5, -0xc22, %o3
	.word	0xb1a0111a	! t0_kref+0x74:   	fxtod	%f26, %f24
	.word	0xda7e001c	! t0_kref+0x78:   	swap	[%i0 + %i4], %o5
	.word	0xde4e6008	! t0_kref+0x7c:   	ldsb	[%i1 + 8], %o7
	.word	0xa0ba2c40	! t0_kref+0x80:   	xnorcc	%o0, 0xc40, %l0
	.word	0xb7a00027	! t0_kref+0x84:   	fmovs	%f7, %f27
	.word	0xfd1fbe58	! t0_kref+0x88:   	ldd	[%fp - 0x1a8], %f30
	.word	0xe850a024	! t0_kref+0x8c:   	ldsh	[%g2 + 0x24], %l4
	.word	0x95a588ba	! t0_kref+0x90:   	fsubs	%f22, %f26, %f10
	.word	0xb5a00533	! t0_kref+0x94:   	fsqrts	%f19, %f26
	.word	0xac65c00c	! t0_kref+0x98:   	subc	%l7, %o4, %l6
	.word	0xa7a3c8b9	! t0_kref+0x9c:   	fsubs	%f15, %f25, %f19
	.word	0xc9ee1000	! t0_kref+0xa0:   	prefetcha	%i0, 4
	.word	0xedee501b	! t0_kref+0xa4:   	prefetcha	%i1 + %i3, 22
	.word	0x99a18852	! t0_kref+0xa8:   	faddd	%f6, %f18, %f12
	.word	0xae05be34	! t0_kref+0xac:   	add	%l6, -0x1cc, %l7
	.word	0xa1a609dc	! t0_kref+0xb0:   	fdivd	%f24, %f28, %f16
	.word	0xf53f4018	! t0_kref+0xb4:   	std	%f26, [%i5 + %i0]
	.word	0xdd1e001d	! t0_kref+0xb8:   	ldd	[%i0 + %i5], %f14
	.word	0x85827794	! t0_kref+0xbc:   	wr	%o1, 0xfffff794, %ccr
	.word	0x95a48950	! t0_kref+0xc0:   	fmuld	%f18, %f16, %f10
	.word	0xae9d3545	! t0_kref+0xc4:   	xorcc	%l4, -0xabb, %l7
	.word	0xb5a00537	! t0_kref+0xc8:   	fsqrts	%f23, %f26
	.word	0xa1a4884a	! t0_kref+0xcc:   	faddd	%f18, %f10, %f16
	.word	0x81ae0a4e	! t0_kref+0xd0:   	fcmpd	%fcc0, %f24, %f14
	.word	0xa2283040	! t0_kref+0xd4:   	andn	%g0, -0xfc0, %l1
	.word	0x982da663	! t0_kref+0xd8:   	andn	%l6, 0x663, %o4
	.word	0x9de3bfa0	! t0_kref+0xdc:   	save	%sp, -0x60, %sp
	.word	0xade83ab0	! t0_kref+0xe0:   	restore	%g0, -0x550, %l6
	.word	0x968537f4	! t0_kref+0xe4:   	addcc	%l4, -0x80c, %o3
	.word	0xda680018	! t0_kref+0xe8:   	ldstub	[%g0 + %i0], %o5
	.word	0x3a480004	! t0_kref+0xec:   	bcc,a,pt	%icc, _kref+0xfc
	.word	0xa09830f3	! t0_kref+0xf0:   	xorcc	%g0, -0xf0d, %l0
	.word	0xed070018	! t0_kref+0xf4:   	ld	[%i4 + %i0], %f22
	.word	0xd8ce9018	! t0_kref+0xf8:   	ldsba	[%i2 + %i0]0x80, %o4
	.word	0x9eab400a	! t0_kref+0xfc:   	andncc	%o5, %o2, %o7
	.word	0xa1400000	! t0_kref+0x100:   	mov	%y, %l0
	.word	0x9eb34000	! t0_kref+0x104:   	orncc	%o5, %g0, %o7
	.word	0x98128015	! t0_kref+0x108:   	or	%o2, %l5, %o4
	.word	0xe25e3ff8	! t0_kref+0x10c:   	ldx	[%i0 - 8], %l1
	.word	0x86102020	! t0_kref+0x110:   	mov	0x20, %g3
	.word	0x86a0e001	! t0_kref+0x114:   	subcc	%g3, 1, %g3
	.word	0x22800015	! t0_kref+0x118:   	be,a	_kref+0x16c
	.word	0xe06e8018	! t0_kref+0x11c:   	ldstub	[%i2 + %i0], %l0
	.word	0x98a50008	! t0_kref+0x120:   	subcc	%l4, %o0, %o4
	.word	0x99a000dc	! t0_kref+0x124:   	fnegd	%f28, %f12
	.word	0xd6fe101c	! t0_kref+0x128:   	swapa	[%i0 + %i4]0x80, %o3
	.word	0x91a70828	! t0_kref+0x12c:   	fadds	%f28, %f8, %f8
	.word	0x8da609d4	! t0_kref+0x130:   	fdivd	%f24, %f20, %f6
	.word	0xd06e4000	! t0_kref+0x134:   	ldstub	[%i1], %o0
	.word	0x9a45785f	! t0_kref+0x138:   	addc	%l5, -0x7a1, %o5
	.word	0xcb002b44	! t0_kref+0x13c:   	ld	[%g0 + 0xb44], %f5
	.word	0xb5a60836	! t0_kref+0x140:   	fadds	%f24, %f22, %f26
	.word	0x9a85c008	! t0_kref+0x144:   	addcc	%l7, %o0, %o5
	.word	0xd2480019	! t0_kref+0x148:   	ldsb	[%g0 + %i1], %o1
	.word	0x99a0052e	! t0_kref+0x14c:   	fsqrts	%f14, %f12
	.word	0xb7a44838	! t0_kref+0x150:   	fadds	%f17, %f24, %f27
	.word	0xeec71018	! t0_kref+0x154:   	ldswa	[%i4 + %i0]0x80, %l7
	.word	0x9da0191e	! t0_kref+0x158:   	fitod	%f30, %f14
	.word	0x81af8a3b	! t0_kref+0x15c:   	fcmps	%fcc0, %f30, %f27
	.word	0xd0de3fe8	! t0_kref+0x160:   	ldxa	[%i0 - 0x18]%asi, %o0
	.word	0xe27e7ff4	! t0_kref+0x164:   	swap	[%i1 - 0xc], %l1
	.word	0x9a42b86b	! t0_kref+0x168:   	addc	%o2, -0x795, %o5
	.word	0xd2c8a003	! t0_kref+0x16c:   	ldsba	[%g2 + 3]%asi, %o1
	.word	0xea2e7ff7	! t0_kref+0x170:   	stb	%l5, [%i1 - 9]
	.word	0x8da01a3a	! t0_kref+0x174:   	fstoi	%f26, %f6
	.word	0xde000018	! t0_kref+0x178:   	ld	[%g0 + %i0], %o7
	.word	0x96f3401a	! t0_kref+0x17c:   	udivcc	%o5, %i2, %o3
	.word	0xa3400000	! t0_kref+0x180:   	mov	%y, %l1
	.word	0xaafa39e9	! t0_kref+0x184:   	sdivcc	%o0, -0x617, %l5
	.word	0xa73a0009	! t0_kref+0x188:   	sra	%o0, %o1, %l3
	.word	0xa83b4014	! t0_kref+0x18c:   	xnor	%o5, %l4, %l4
	.word	0xbda01096	! t0_kref+0x190:   	fxtos	%f22, %f30
	.word	0xd02e6012	! t0_kref+0x194:   	stb	%o0, [%i1 + 0x12]
	.word	0x9b35400b	! t0_kref+0x198:   	srl	%l5, %o3, %o5
	.word	0x9fc10000	! t0_kref+0x19c:   	call	%g4
	.word	0x1723dbba	! t0_kref+0x1a0:   	sethi	%hi(0x8f6ee800), %o3
	.word	0xe0c0a014	! t0_kref+0x1a4:   	ldswa	[%g2 + 0x14]%asi, %l0
	.word	0x96730017	! t0_kref+0x1a8:   	udiv	%o4, %l7, %o3
	.word	0xea88a006	! t0_kref+0x1ac:   	lduba	[%g2 + 6]%asi, %l5
	.word	0x9de3bfa0	! t0_kref+0x1b0:   	save	%sp, -0x60, %sp
	.word	0xb6a6fee5	! t0_kref+0x1b4:   	subcc	%i3, -0x11b, %i3
	.word	0xabef4018	! t0_kref+0x1b8:   	restore	%i5, %i0, %l5
	.word	0x99358000	! t0_kref+0x1bc:   	srl	%l6, %g0, %o4
	.word	0xe9380018	! t0_kref+0x1c0:   	std	%f20, [%g0 + %i0]
	.word	0x96620014	! t0_kref+0x1c4:   	subc	%o0, %l4, %o3
	.word	0xe400a000	! t0_kref+0x1c8:   	ld	[%g2], %l2
	.word	0x81a98a4c	! t0_kref+0x1cc:   	fcmpd	%fcc0, %f6, %f12
	.word	0x9af565af	! t0_kref+0x1d0:   	udivcc	%l5, 0x5af, %o5
	.word	0x81ae0a4a	! t0_kref+0x1d4:   	fcmpd	%fcc0, %f24, %f10
	.word	0xb9a01a26	! t0_kref+0x1d8:   	fstoi	%f6, %f28
	.word	0x92fa400b	! t0_kref+0x1dc:   	sdivcc	%o1, %o3, %o1
	.word	0xd8ee6015	! t0_kref+0x1e0:   	ldstuba	[%i1 + 0x15]%asi, %o4
	.word	0x81aaca2b	! t0_kref+0x1e4:   	fcmps	%fcc0, %f11, %f11
	.word	0xd06e401a	! t0_kref+0x1e8:   	ldstub	[%i1 + %i2], %o0
	.word	0x9fc00004	! t0_kref+0x1ec:   	call	%g0 + %g4
	.word	0x9402c00b	! t0_kref+0x1f0:   	add	%o3, %o3, %o2
	.word	0x32800002	! t0_kref+0x1f4:   	bne,a	_kref+0x1fc
	.word	0xdec0a010	! t0_kref+0x1f8:   	ldswa	[%g2 + 0x10]%asi, %o7
	.word	0xd580a004	! t0_kref+0x1fc:   	lda	[%g2 + 4]%asi, %f10
	.word	0xa472c008	! t0_kref+0x200:   	udiv	%o3, %o0, %l2
	call	SYM(t0_subr1)
	.word	0xb1a01915	! t0_kref+0x208:   	fitod	%f21, %f24
	.word	0x86102001	! t0_kref+0x20c:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x210:   	bne,a	_kref+0x210
	.word	0x86a0e001	! t0_kref+0x214:   	subcc	%g3, 1, %g3
	.word	0x9de3bfa0	! t0_kref+0x218:   	save	%sp, -0x60, %sp
	.word	0xb63f0019	! t0_kref+0x21c:   	xnor	%i4, %i1, %i3
	.word	0x81ee33c3	! t0_kref+0x220:   	restore	%i0, -0xc3d, %g0
	.word	0xde80a014	! t0_kref+0x224:   	lda	[%g2 + 0x14]%asi, %o7
	.word	0x81db0014	! t0_kref+0x228:   	flush	%o4 + %l4
	.word	0xa7400000	! t0_kref+0x22c:   	mov	%y, %l3
	.word	0xa6fd328c	! t0_kref+0x230:   	sdivcc	%l4, -0xd74, %l3
	.word	0xaba01a2f	! t0_kref+0x234:   	fstoi	%f15, %f21
	.word	0x967a8008	! t0_kref+0x238:   	sdiv	%o2, %o0, %o3
	.word	0xa2f2733d	! t0_kref+0x23c:   	udivcc	%o1, -0xcc3, %l1
	.word	0x9efa2ec4	! t0_kref+0x240:   	sdivcc	%o0, 0xec4, %o7
	.word	0x9a72c015	! t0_kref+0x244:   	udiv	%o3, %l5, %o5
	.word	0x81af4a29	! t0_kref+0x248:   	fcmps	%fcc0, %f29, %f9
	.word	0xada00533	! t0_kref+0x24c:   	fsqrts	%f19, %f22
	.word	0xf5380018	! t0_kref+0x250:   	std	%f26, [%g0 + %i0]
	.word	0xed1fbc68	! t0_kref+0x254:   	ldd	[%fp - 0x398], %f22
	.word	0x81828000	! t0_kref+0x258:   	wr	%o2, %g0, %y
	.word	0xe86e201f	! t0_kref+0x25c:   	ldstub	[%i0 + 0x1f], %l4
	.word	0x0135f0a6	! t0_kref+0x260:   	sethi	%hi(0xd7c29800), %g0
	.word	0x91a409d2	! t0_kref+0x264:   	fdivd	%f16, %f18, %f8
	.word	0x901d76b7	! t0_kref+0x268:   	xor	%l5, -0x949, %o0
	.word	0x3f480004	! t0_kref+0x26c:   	fbo,a,pt	%fcc0, _kref+0x27c
	.word	0xac73307f	! t0_kref+0x270:   	udiv	%o4, -0xf81, %l6
	.word	0xb5a0014a	! t0_kref+0x274:   	fabsd	%f10, %f26
	.word	0x99a609da	! t0_kref+0x278:   	fdivd	%f24, %f26, %f12
	.word	0x8143c000	! t0_kref+0x27c:   	stbar
	.word	0x94bac016	! t0_kref+0x280:   	xnorcc	%o3, %l6, %o2
	.word	0x9250001a	! t0_kref+0x284:   	umul	%g0, %i2, %o1
	.word	0x981a6f02	! t0_kref+0x288:   	xor	%o1, 0xf02, %o4
	.word	0xe488a034	! t0_kref+0x28c:   	lduba	[%g2 + 0x34]%asi, %l2
	.word	0xac02f17f	! t0_kref+0x290:   	add	%o3, -0xe81, %l6
	.word	0x86102007	! t0_kref+0x294:   	mov	0x7, %g3
	.word	0x86a0e001	! t0_kref+0x298:   	subcc	%g3, 1, %g3
	.word	0x22800012	! t0_kref+0x29c:   	be,a	_kref+0x2e4
	.word	0x95a6095c	! t0_kref+0x2a0:   	fmuld	%f24, %f28, %f10
	.word	0xec200019	! t0_kref+0x2a4:   	st	%l6, [%g0 + %i1]
	.word	0x30800002	! t0_kref+0x2a8:   	ba,a	_kref+0x2b0
	.word	0x9e0daaac	! t0_kref+0x2ac:   	and	%l6, 0xaac, %o7
	.word	0xb1a688cc	! t0_kref+0x2b0:   	fsubd	%f26, %f12, %f24
	.word	0x8d85eeab	! t0_kref+0x2b4:   	wr	%l7, 0xeab, %fprs
	.word	0x95a01110	! t0_kref+0x2b8:   	fxtod	%f16, %f10
	.word	0x23480003	! t0_kref+0x2bc:   	fbne,a,pt	%fcc0, _kref+0x2c8
	.word	0xafa3c835	! t0_kref+0x2c0:   	fadds	%f15, %f21, %f23
	.word	0x2b4ffff5	! t0_kref+0x2c4:   	fbug,a,pt	%fcc0, _kref+0x298
	.word	0xd6100019	! t0_kref+0x2c8:   	lduh	[%g0 + %i1], %o3
	.word	0xd40e401a	! t0_kref+0x2cc:   	ldub	[%i1 + %i2], %o2
	.word	0x9b3d001a	! t0_kref+0x2d0:   	sra	%l4, %i2, %o5
	.word	0xe4ce2011	! t0_kref+0x2d4:   	ldsba	[%i0 + 0x11]%asi, %l2
	.word	0x95a018c6	! t0_kref+0x2d8:   	fdtos	%f6, %f10
	.word	0xa3a708b3	! t0_kref+0x2dc:   	fsubs	%f28, %f19, %f17
	.word	0xecb63ffe	! t0_kref+0x2e0:   	stha	%l6, [%i0 - 2]%asi
	.word	0xd7000019	! t0_kref+0x2e4:   	ld	[%g0 + %i1], %f11
	.word	0xbda01a52	! t0_kref+0x2e8:   	fdtoi	%f18, %f30
	.word	0xdd1fbfa8	! t0_kref+0x2ec:   	ldd	[%fp - 0x58], %f14
	.word	0xae7ab8b8	! t0_kref+0x2f0:   	sdiv	%o2, -0x748, %l7
	.word	0xa5a01a46	! t0_kref+0x2f4:   	fdtoi	%f6, %f18
	.word	0x81ae0a52	! t0_kref+0x2f8:   	fcmpd	%fcc0, %f24, %f18
	.word	0xa1a4895a	! t0_kref+0x2fc:   	fmuld	%f18, %f26, %f16
	.word	0x801a4014	! t0_kref+0x300:   	xor	%o1, %l4, %g0
	.word	0xaeab7e23	! t0_kref+0x304:   	andncc	%o5, -0x1dd, %l7
	.word	0x3b800008	! t0_kref+0x308:   	fble,a	_kref+0x328
	.word	0xd0a67ff4	! t0_kref+0x30c:   	sta	%o0, [%i1 - 0xc]%asi
	.word	0xd220a01c	! t0_kref+0x310:   	st	%o1, [%g2 + 0x1c]
	.word	0xa17036c3	! t0_kref+0x314:   	popc	-0x93d, %l0
	.word	0x80de801a	! t0_kref+0x318:   	smulcc	%i2, %i2, %g0
	.word	0xb3a01a2f	! t0_kref+0x31c:   	fstoi	%f15, %f25
	.word	0xb1a0110c	! t0_kref+0x320:   	fxtod	%f12, %f24
	.word	0x8da018d0	! t0_kref+0x324:   	fdtos	%f16, %f6
	.word	0xda80a00c	! t0_kref+0x328:   	lda	[%g2 + 0xc]%asi, %o5
	.word	0xc0067fec	! t0_kref+0x32c:   	ld	[%i1 - 0x14], %g0
	.word	0xa760400c	! t0_kref+0x330:   	movne	%fcc0, %o4, %l3
	.word	0xec500019	! t0_kref+0x334:   	ldsh	[%g0 + %i1], %l6
	.word	0x962d4017	! t0_kref+0x338:   	andn	%l5, %l7, %o3
	.word	0xd47e4000	! t0_kref+0x33c:   	swap	[%i1], %o2
	.word	0x8143e040	! t0_kref+0x340:   	membar	0x40
	.word	0x9de3bfa0	! t0_kref+0x344:   	save	%sp, -0x60, %sp
	.word	0x97ee7040	! t0_kref+0x348:   	restore	%i1, -0xfc0, %o3
	.word	0xa732a002	! t0_kref+0x34c:   	srl	%o2, 0x2, %l3
	.word	0xe6567fec	! t0_kref+0x350:   	ldsh	[%i1 - 0x14], %l3
	.word	0x8fa01a2b	! t0_kref+0x354:   	fstoi	%f11, %f7
	.word	0xae0afada	! t0_kref+0x358:   	and	%o3, -0x526, %l7
	.word	0xe00e7ff9	! t0_kref+0x35c:   	ldub	[%i1 - 7], %l0
	.word	0xe6166008	! t0_kref+0x360:   	lduh	[%i1 + 8], %l3
	.word	0x91a0052e	! t0_kref+0x364:   	fsqrts	%f14, %f8
	.word	0x30800002	! t0_kref+0x368:   	ba,a	_kref+0x370
	.word	0x81de0009	! t0_kref+0x36c:   	flush	%i0 + %o1
	.word	0xa492c008	! t0_kref+0x370:   	orcc	%o3, %o0, %l2
	.word	0x001fffff	! t0_kref+0x374:   	illtrap	0x1fffff
	.word	0xc0062004	! t0_kref+0x378:   	ld	[%i0 + 4], %g0
	.word	0xde00a00c	! t0_kref+0x37c:   	ld	[%g2 + 0xc], %o7
	.word	0xf9be584a	! t0_kref+0x380:   	stda	%f28, [%i1 + %o2]0xc2
	.word	0xa1a00029	! t0_kref+0x384:   	fmovs	%f9, %f16
	.word	0xac0eafa2	! t0_kref+0x388:   	and	%i2, 0xfa2, %l6
	.word	0xec067fec	! t0_kref+0x38c:   	ld	[%i1 - 0x14], %l6
	.word	0xaa82c00a	! t0_kref+0x390:   	addcc	%o3, %o2, %l5
	.word	0xe9be1814	! t0_kref+0x394:   	stda	%f20, [%i0 + %l4]0xc0
	.word	0xe2c63fec	! t0_kref+0x398:   	ldswa	[%i0 - 0x14]%asi, %l1
	.word	0x90ab637d	! t0_kref+0x39c:   	andncc	%o5, 0x37d, %o0
	.word	0x23480004	! t0_kref+0x3a0:   	fbne,a,pt	%fcc0, _kref+0x3b0
	.word	0xea764000	! t0_kref+0x3a4:   	stx	%l5, [%i1]
	.word	0xa5a28848	! t0_kref+0x3a8:   	faddd	%f10, %f8, %f18
	.word	0xae650000	! t0_kref+0x3ac:   	subc	%l4, %g0, %l7
	.word	0x91a50d2e	! t0_kref+0x3b0:   	fsmuld	%f20, %f14, %f8
	.word	0xa01b000b	! t0_kref+0x3b4:   	xor	%o4, %o3, %l0
	.word	0x91a388d0	! t0_kref+0x3b8:   	fsubd	%f14, %f16, %f8
	.word	0xf91e7ff8	! t0_kref+0x3bc:   	ldd	[%i1 - 8], %f28
	.word	0xe488a02d	! t0_kref+0x3c0:   	lduba	[%g2 + 0x2d]%asi, %l2
	.word	0x913a8008	! t0_kref+0x3c4:   	sra	%o2, %o0, %o0
	.word	0xecbe2018	! t0_kref+0x3c8:   	stda	%l6, [%i0 + 0x18]%asi
	.word	0x9ba01a54	! t0_kref+0x3cc:   	fdtoi	%f20, %f13
	.word	0xd490a028	! t0_kref+0x3d0:   	lduha	[%g2 + 0x28]%asi, %o2
	.word	0x37480004	! t0_kref+0x3d4:   	fbge,a,pt	%fcc0, _kref+0x3e4
	.word	0xada189da	! t0_kref+0x3d8:   	fdivd	%f6, %f26, %f22
	.word	0xa6ad6fd4	! t0_kref+0x3dc:   	andncc	%l5, 0xfd4, %l3
	.word	0xa856ba03	! t0_kref+0x3e0:   	umul	%i2, -0x5fd, %l4
	.word	0x9e2a400c	! t0_kref+0x3e4:   	andn	%o1, %o4, %o7
	.word	0x9fc00004	! t0_kref+0x3e8:   	call	%g0 + %g4
	.word	0xe836401b	! t0_kref+0x3ec:   	sth	%l4, [%i1 + %i3]
	.word	0xa138000a	! t0_kref+0x3f0:   	sra	%g0, %o2, %l0
	.word	0xaa43292c	! t0_kref+0x3f4:   	addc	%o4, 0x92c, %l5
	.word	0xe4462018	! t0_kref+0x3f8:   	ldsw	[%i0 + 0x18], %l2
	.word	0xa970000a	! t0_kref+0x3fc:   	popc	%o2, %l4
	.word	0xa4702ab0	! t0_kref+0x400:   	udiv	%g0, 0xab0, %l2
	.word	0xda163fec	! t0_kref+0x404:   	lduh	[%i0 - 0x14], %o5
	.word	0x26480006	! t0_kref+0x408:   	bl,a,pt	%icc, _kref+0x420
	.word	0xdab01019	! t0_kref+0x40c:   	stha	%o5, [%g0 + %i1]0x80
	.word	0x9da00538	! t0_kref+0x410:   	fsqrts	%f24, %f14
	.word	0xaba788be	! t0_kref+0x414:   	fsubs	%f30, %f30, %f21
	.word	0xf3ee101d	! t0_kref+0x418:   	prefetcha	%i0 + %i5, 25
	.word	0xa4ab000b	! t0_kref+0x41c:   	andncc	%o4, %o3, %l2
	.word	0xec267ffc	! t0_kref+0x420:   	st	%l6, [%i1 - 4]
	.word	0x80bd2d5b	! t0_kref+0x424:   	xnorcc	%l4, 0xd5b, %g0
	.word	0xa805001a	! t0_kref+0x428:   	add	%l4, %i2, %l4
	.word	0x813dc009	! t0_kref+0x42c:   	sra	%l7, %o1, %g0
	.word	0x9e5a6734	! t0_kref+0x430:   	smul	%o1, 0x734, %o7
	.word	0xc168a000	! t0_kref+0x434:   	prefetch	%g2, 0
	.word	0xa32ea016	! t0_kref+0x438:   	sll	%i2, 0x16, %l1
	.word	0x93a2c8af	! t0_kref+0x43c:   	fsubs	%f11, %f15, %f9
	.word	0xf5066000	! t0_kref+0x440:   	ld	[%i1], %f26
	.word	0x9285af2f	! t0_kref+0x444:   	addcc	%l6, 0xf2f, %o1
	.word	0xf9ee101c	! t0_kref+0x448:   	prefetcha	%i0 + %i4, 28
	.word	0xd240a030	! t0_kref+0x44c:   	ldsw	[%g2 + 0x30], %o1
	.word	0xd0780019	! t0_kref+0x450:   	swap	[%g0 + %i1], %o0
	.word	0xe1be584a	! t0_kref+0x454:   	stda	%f16, [%i1 + %o2]0xc2
	.word	0xf53e6018	! t0_kref+0x458:   	std	%f26, [%i1 + 0x18]
	.word	0xda26401c	! t0_kref+0x45c:   	st	%o5, [%i1 + %i4]
	.word	0xd248a01a	! t0_kref+0x460:   	ldsb	[%g2 + 0x1a], %o1
	.word	0xa90eba15	! t0_kref+0x464:   	tsubcc	%i2, -0x5eb, %l4
	.word	0xecf81018	! t0_kref+0x468:   	swapa	[%g0 + %i0]0x80, %l6
	.word	0x3d480004	! t0_kref+0x46c:   	fbule,a,pt	%fcc0, _kref+0x47c
	.word	0x92726906	! t0_kref+0x470:   	udiv	%o1, 0x906, %o1
	.word	0xde88a039	! t0_kref+0x474:   	lduba	[%g2 + 0x39]%asi, %o7
	.word	0xf11fbd68	! t0_kref+0x478:   	ldd	[%fp - 0x298], %f24
	.word	0x2d480003	! t0_kref+0x47c:   	fbg,a,pt	%fcc0, _kref+0x488
	.word	0x95a68952	! t0_kref+0x480:   	fmuld	%f26, %f18, %f10
	.word	0x9da018c6	! t0_kref+0x484:   	fdtos	%f6, %f14
	.word	0xae2d000d	! t0_kref+0x488:   	andn	%l4, %o5, %l7
	.word	0x98db401a	! t0_kref+0x48c:   	smulcc	%o5, %i2, %o4
	.word	0x80c24008	! t0_kref+0x490:   	addccc	%o1, %o0, %g0
	.word	0x90fa30b0	! t0_kref+0x494:   	sdivcc	%o0, -0xf50, %o0
	.word	0xac002b95	! t0_kref+0x498:   	add	%g0, 0xb95, %l6
	.word	0xd056001b	! t0_kref+0x49c:   	ldsh	[%i0 + %i3], %o0
	.word	0x92450015	! t0_kref+0x4a0:   	addc	%l4, %l5, %o1
	.word	0xef68a04e	! t0_kref+0x4a4:   	prefetch	%g2 + 0x4e, 23
	.word	0xfd380019	! t0_kref+0x4a8:   	std	%f30, [%g0 + %i1]
	.word	0x9e96b7ac	! t0_kref+0x4ac:   	orcc	%i2, -0x854, %o7
	.word	0x9de3bfa0	! t0_kref+0x4b0:   	save	%sp, -0x60, %sp
	.word	0x93ef2048	! t0_kref+0x4b4:   	restore	%i4, 0x48, %o1
	.word	0xd620a03c	! t0_kref+0x4b8:   	st	%o3, [%g2 + 0x3c]
	.word	0xa5a6882f	! t0_kref+0x4bc:   	fadds	%f26, %f15, %f18
	.word	0xa4c27d87	! t0_kref+0x4c0:   	addccc	%o1, -0x279, %l2
	.word	0xcd00a034	! t0_kref+0x4c4:   	ld	[%g2 + 0x34], %f6
	.word	0x9fc00004	! t0_kref+0x4c8:   	call	%g0 + %g4
	.word	0xe13e3ff8	! t0_kref+0x4cc:   	std	%f16, [%i0 - 8]
	.word	0x90deaf65	! t0_kref+0x4d0:   	smulcc	%i2, 0xf65, %o0
	.word	0xdd000018	! t0_kref+0x4d4:   	ld	[%g0 + %i0], %f14
	.word	0xf906601c	! t0_kref+0x4d8:   	ld	[%i1 + 0x1c], %f28
	.word	0x94300016	! t0_kref+0x4dc:   	orn	%g0, %l6, %o2
	.word	0xa9a20856	! t0_kref+0x4e0:   	faddd	%f8, %f22, %f20
	.word	0xe20e7fed	! t0_kref+0x4e4:   	ldub	[%i1 - 0x13], %l1
	.word	0xd4fe3ffc	! t0_kref+0x4e8:   	swapa	[%i0 - 4]%asi, %o2
	.word	0xec763fe8	! t0_kref+0x4ec:   	stx	%l6, [%i0 - 0x18]
	.word	0x3d480008	! t0_kref+0x4f0:   	fbule,a,pt	%fcc0, _kref+0x510
	.word	0xa5a5082b	! t0_kref+0x4f4:   	fadds	%f20, %f11, %f18
	.word	0x3c800004	! t0_kref+0x4f8:   	bpos,a	_kref+0x508
	.word	0x950a8016	! t0_kref+0x4fc:   	tsubcc	%o2, %l6, %o2
	.word	0x36800002	! t0_kref+0x500:   	bge,a	_kref+0x508
	.word	0xae5b78ce	! t0_kref+0x504:   	smul	%o5, -0x732, %l7
	.word	0xa262a476	! t0_kref+0x508:   	subc	%o2, 0x476, %l1
	.word	0xd4f66018	! t0_kref+0x50c:   	stxa	%o2, [%i1 + 0x18]%asi
	.word	0xee366000	! t0_kref+0x510:   	sth	%l7, [%i1]
	.word	0x27480003	! t0_kref+0x514:   	fbul,a,pt	%fcc0, _kref+0x520
	.word	0x93334015	! t0_kref+0x518:   	srl	%o5, %l5, %o1
	.word	0xe656c018	! t0_kref+0x51c:   	ldsh	[%i3 + %i0], %l3
	.word	0x91a60848	! t0_kref+0x520:   	faddd	%f24, %f8, %f8
	.word	0xaa0a7332	! t0_kref+0x524:   	and	%o1, -0xcce, %l5
	.word	0x9a2ab985	! t0_kref+0x528:   	andn	%o2, -0x67b, %o5
	.word	0x13380feb	! t0_kref+0x52c:   	sethi	%hi(0xe03fac00), %o1
	.word	0x9ea5000d	! t0_kref+0x530:   	subcc	%l4, %o5, %o7
	.word	0x3a480004	! t0_kref+0x534:   	bcc,a,pt	%icc, _kref+0x544
	.word	0x8143c000	! t0_kref+0x538:   	stbar
	.word	0xedee501a	! t0_kref+0x53c:   	prefetcha	%i1 + %i2, 22
	.word	0x9028000c	! t0_kref+0x540:   	andn	%g0, %o4, %o0
	.word	0xbda00539	! t0_kref+0x544:   	fsqrts	%f25, %f30
	.word	0xec3e2010	! t0_kref+0x548:   	std	%l6, [%i0 + 0x10]
	.word	0x9e5b775c	! t0_kref+0x54c:   	smul	%o5, -0x8a4, %o7
	.word	0xa5a00130	! t0_kref+0x550:   	fabss	%f16, %f18
	.word	0x8da408b9	! t0_kref+0x554:   	fsubs	%f16, %f25, %f6
	.word	0x913d2005	! t0_kref+0x558:   	sra	%l4, 0x5, %o0
	.word	0x9232a57e	! t0_kref+0x55c:   	orn	%o2, 0x57e, %o1
	.word	0xe4160000	! t0_kref+0x560:   	lduh	[%i0], %l2
	.word	0xe7ee101b	! t0_kref+0x564:   	prefetcha	%i0 + %i3, 19
	.word	0xa6fa0016	! t0_kref+0x568:   	sdivcc	%o0, %l6, %l3
	.word	0xf207bfe0	! t0_kref+0x56c:   	ld	[%fp - 0x20], %i1
	.word	0xa8bd3574	! t0_kref+0x570:   	xnorcc	%l4, -0xa8c, %l4
	.word	0x9ba0002d	! t0_kref+0x574:   	fmovs	%f13, %f13
	.word	0xe4180018	! t0_kref+0x578:   	ldd	[%g0 + %i0], %l2
	.word	0xcd3e6008	! t0_kref+0x57c:   	std	%f6, [%i1 + 8]
	.word	0xa612400b	! t0_kref+0x580:   	or	%o1, %o3, %l3
	.word	0xe440a034	! t0_kref+0x584:   	ldsw	[%g2 + 0x34], %l2
	.word	0xa285aa4a	! t0_kref+0x588:   	addcc	%l6, 0xa4a, %l1
	.word	0xc1082938	! t0_kref+0x58c:   	ld	[%g0 + 0x938], %fsr
	.word	0x9ba00032	! t0_kref+0x590:   	fmovs	%f18, %f13
	.word	0x801a4015	! t0_kref+0x594:   	xor	%o1, %l5, %g0
	.word	0xe4086034	! t0_kref+0x598:   	ldub	[%g1 + 0x34], %l2
	.word	0xa41ca00c	! t0_kref+0x59c:   	xor	%l2, 0xc, %l2
	.word	0xe4286034	! t0_kref+0x5a0:   	stb	%l2, [%g1 + 0x34]
	.word	0x81d86034	! t0_kref+0x5a4:   	flush	%g1 + 0x34
	.word	0xa8400015	! t0_kref+0x5a8:   	addc	%g0, %l5, %l4
	.word	0xaae53b3d	! t0_kref+0x5ac:   	subccc	%l4, -0x4c3, %l5
	.word	0x91a448b7	! t0_kref+0x5b0:   	fsubs	%f17, %f23, %f8
	.word	0xd4463ff8	! t0_kref+0x5b4:   	ldsw	[%i0 - 8], %o2
	.word	0xaba48930	! t0_kref+0x5b8:   	fmuls	%f18, %f16, %f21
	.word	0x8fa01088	! t0_kref+0x5bc:   	fxtos	%f8, %f7
	.word	0xa666800b	! t0_kref+0x5c0:   	subc	%i2, %o3, %l3
	.word	0xa2ab3d1e	! t0_kref+0x5c4:   	andncc	%o4, -0x2e2, %l1
	.word	0xd4be2000	! t0_kref+0x5c8:   	stda	%o2, [%i0]%asi
	.word	0x9e980000	! t0_kref+0x5cc:   	xorcc	%g0, %g0, %o7
2:	.word	0x98724017	! t0_kref+0x5d0:   	udiv	%o1, %l7, %o4
	.word	0xe09f5018	! t0_kref+0x5d4:   	ldda	[%i5 + %i0]0x80, %l0
	.word	0x95a01114	! t0_kref+0x5d8:   	fxtod	%f20, %f10
	.word	0xd656c018	! t0_kref+0x5dc:   	ldsh	[%i3 + %i0], %o3
	.word	0xd86e001a	! t0_kref+0x5e0:   	ldstub	[%i0 + %i2], %o4
	.word	0x9efb001a	! t0_kref+0x5e4:   	sdivcc	%o4, %i2, %o7
	.word	0xf7262000	! t0_kref+0x5e8:   	st	%f27, [%i0]
	.word	0x9b056a9d	! t0_kref+0x5ec:   	taddcc	%l5, 0xa9d, %o5
	call	1f
	.empty
	.word	0xec0e4000	! t0_kref+0x5f4:   	ldub	[%i1], %l6
	.word	0xea7e401c	! t0_kref+0x5f8:   	swap	[%i1 + %i4], %l5
	.word	0xd67e3ff8	! t0_kref+0x5fc:   	swap	[%i0 - 8], %o3
1:	.word	0x8035ad0c	! t0_kref+0x600:   	orn	%l6, 0xd0c, %g0
	.word	0x9473400d	! t0_kref+0x604:   	udiv	%o5, %o5, %o2
	.word	0xe51fbca0	! t0_kref+0x608:   	ldd	[%fp - 0x360], %f18
	.word	0xa91a000c	! t0_kref+0x60c:   	tsubcctv	%o0, %o4, %l4
	.word	0xb1a50837	! t0_kref+0x610:   	fadds	%f20, %f23, %f24
	.word	0xf3a0a020	! t0_kref+0x614:   	sta	%f25, [%g2 + 0x20]%asi
	.word	0x8610201d	! t0_kref+0x618:   	mov	0x1d, %g3
	.word	0x86a0e001	! t0_kref+0x61c:   	subcc	%g3, 1, %g3
	.word	0x2280000e	! t0_kref+0x620:   	be,a	_kref+0x658
	.word	0x2f147993	! t0_kref+0x624:   	sethi	%hi(0x51e64c00), %l7
	.word	0xaa353586	! t0_kref+0x628:   	orn	%l4, -0xa7a, %l5
	.word	0xe51e6010	! t0_kref+0x62c:   	ldd	[%i1 + 0x10], %f18
	.word	0x8fa0188f	! t0_kref+0x630:   	fitos	%f15, %f7
	.word	0xe91e6018	! t0_kref+0x634:   	ldd	[%i1 + 0x18], %f20
	.word	0x90bab577	! t0_kref+0x638:   	xnorcc	%o2, -0xa89, %o0
	.word	0x8fa4c829	! t0_kref+0x63c:   	fadds	%f19, %f9, %f7
	.word	0x81800000	! t0_kref+0x640:   	mov	%g0, %y
	.word	0x8fa01a27	! t0_kref+0x644:   	fstoi	%f7, %f7
	.word	0x28800004	! t0_kref+0x648:   	bleu,a	_kref+0x658
	.word	0xf1bf1a58	! t0_kref+0x64c:   	stda	%f24, [%i4 + %i0]0xd2
	.word	0x99230000	! t0_kref+0x650:   	mulscc	%o4, %g0, %o4
	.word	0xe1e8a004	! t0_kref+0x654:   	prefetcha	%g2 + 4, 16
	.word	0xe06e0000	! t0_kref+0x658:   	ldstub	[%i0], %l0
	.word	0xb9a94054	! t0_kref+0x65c:   	fmovdug	%fcc0, %f20, %f28
	.word	0x2d480006	! t0_kref+0x660:   	fbg,a,pt	%fcc0, _kref+0x678
	.word	0x81dac005	! t0_kref+0x664:   	flush	%o3 + %g5
	.word	0x3a800004	! t0_kref+0x668:   	bcc,a	_kref+0x678
	.word	0xec270018	! t0_kref+0x66c:   	st	%l6, [%i4 + %i0]
	.word	0xa1a0052d	! t0_kref+0x670:   	fsqrts	%f13, %f16
	.word	0xe6166002	! t0_kref+0x674:   	lduh	[%i1 + 2], %l3
	.word	0x9fc10000	! t0_kref+0x678:   	call	%g4
	.word	0xd4b0a002	! t0_kref+0x67c:   	stha	%o2, [%g2 + 2]%asi
	.word	0xac050014	! t0_kref+0x680:   	add	%l4, %l4, %l6
	.word	0xea96d040	! t0_kref+0x684:   	lduha	[%i3]0x82, %l5
	.word	0xd440a020	! t0_kref+0x688:   	ldsw	[%g2 + 0x20], %o2
	.word	0xd0763fe8	! t0_kref+0x68c:   	stx	%o0, [%i0 - 0x18]
	sethi	%hi(2f), %o7
	.word	0xe40be2d0	! t0_kref+0x694:   	ldub	[%o7 + 0x2d0], %l2
	.word	0xa41ca00c	! t0_kref+0x698:   	xor	%l2, 0xc, %l2
	.word	0xe42be2d0	! t0_kref+0x69c:   	stb	%l2, [%o7 + 0x2d0]
	.word	0x81dbe2d0	! t0_kref+0x6a0:   	flush	%o7 + 0x2d0
	.word	0x9138200d	! t0_kref+0x6a4:   	sra	%g0, 0xd, %o0
	.word	0xac3b4008	! t0_kref+0x6a8:   	xnor	%o5, %o0, %l6
	.word	0xd890a022	! t0_kref+0x6ac:   	lduha	[%g2 + 0x22]%asi, %o4
	.word	0xd406001c	! t0_kref+0x6b0:   	ld	[%i0 + %i4], %o2
	.word	0x91a0002e	! t0_kref+0x6b4:   	fmovs	%f14, %f8
	.word	0xea6e3feb	! t0_kref+0x6b8:   	ldstub	[%i0 - 0x15], %l5
	.word	0x8002b26f	! t0_kref+0x6bc:   	add	%o2, -0xd91, %g0
	.word	0xbda50952	! t0_kref+0x6c0:   	fmuld	%f20, %f18, %f30
	.word	0xd93e6008	! t0_kref+0x6c4:   	std	%f12, [%i1 + 8]
	.word	0x2537912f	! t0_kref+0x6c8:   	sethi	%hi(0xde44bc00), %l2
	.word	0x9702edae	! t0_kref+0x6cc:   	taddcc	%o3, 0xdae, %o3
2:	.word	0xda56001b	! t0_kref+0x6d0:   	ldsh	[%i0 + %i3], %o5
	.word	0x96c22215	! t0_kref+0x6d4:   	addccc	%o0, 0x215, %o3
	.word	0x86102003	! t0_kref+0x6d8:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x6dc:   	bne,a	_kref+0x6dc
	.word	0x86a0e001	! t0_kref+0x6e0:   	subcc	%g3, 1, %g3
	.word	0x99a0190c	! t0_kref+0x6e4:   	fitod	%f12, %f12
	.word	0xa8834008	! t0_kref+0x6e8:   	addcc	%o5, %o0, %l4
	.word	0x28800008	! t0_kref+0x6ec:   	bleu,a	_kref+0x70c
	.word	0xd2762018	! t0_kref+0x6f0:   	stx	%o1, [%i0 + 0x18]
	.word	0xd62e4000	! t0_kref+0x6f4:   	stb	%o3, [%i1]
	.word	0xdd1fbfc0	! t0_kref+0x6f8:   	ldd	[%fp - 0x40], %f14
	.word	0x95a01a3d	! t0_kref+0x6fc:   	fstoi	%f29, %f10
	.word	0xc0762008	! t0_kref+0x700:   	stx	%g0, [%i0 + 8]
	.word	0x81deb07f	! t0_kref+0x704:   	flush	%i2 - 0xf81
	.word	0xb1a0013d	! t0_kref+0x708:   	fabss	%f29, %f24
	.word	0xa730000a	! t0_kref+0x70c:   	srl	%g0, %o2, %l3
	.word	0xd91e001d	! t0_kref+0x710:   	ldd	[%i0 + %i5], %f12
	.word	0xda270019	! t0_kref+0x714:   	st	%o5, [%i4 + %i1]
	.word	0x9f3ae01c	! t0_kref+0x718:   	sra	%o3, 0x1c, %o7
	.word	0x90020016	! t0_kref+0x71c:   	add	%o0, %l6, %o0
	.word	0xa53a800c	! t0_kref+0x720:   	sra	%o2, %o4, %l2
	.word	0xde0e401a	! t0_kref+0x724:   	ldub	[%i1 + %i2], %o7
	.word	0xe66e401a	! t0_kref+0x728:   	ldstub	[%i1 + %i2], %l3
	.word	0xa4c03d47	! t0_kref+0x72c:   	addccc	%g0, -0x2b9, %l2
	.word	0xa9a01892	! t0_kref+0x730:   	fitos	%f18, %f20
	.word	0x99a28832	! t0_kref+0x734:   	fadds	%f10, %f18, %f12
	.word	0xafa0188f	! t0_kref+0x738:   	fitos	%f15, %f23
	.word	0xb3a01a2b	! t0_kref+0x73c:   	fstoi	%f11, %f25
	.word	0x8da30850	! t0_kref+0x740:   	faddd	%f12, %f16, %f6
	.word	0x9843001a	! t0_kref+0x744:   	addc	%o4, %i2, %o4
	call	1f
	.empty
	.word	0x9a1a0016	! t0_kref+0x74c:   	xor	%o0, %l6, %o5
	.word	0x99332008	! t0_kref+0x750:   	srl	%o4, 0x8, %o4
	.word	0x9da01a3a	! t0_kref+0x754:   	fstoi	%f26, %f14
	.word	0x80ba000a	! t0_kref+0x758:   	xnorcc	%o0, %o2, %g0
1:	.word	0x9fc00004	! t0_kref+0x75c:   	call	%g0 + %g4
	.word	0x94f30015	! t0_kref+0x760:   	udivcc	%o4, %l5, %o2
	.word	0x28800008	! t0_kref+0x764:   	bleu,a	_kref+0x784
	.word	0xa7a000b5	! t0_kref+0x768:   	fnegs	%f21, %f19
	.word	0xafa01888	! t0_kref+0x76c:   	fitos	%f8, %f23
	.word	0xa9a189d0	! t0_kref+0x770:   	fdivd	%f6, %f16, %f20
	.word	0x9732400a	! t0_kref+0x774:   	srl	%o1, %o2, %o3
	.word	0x81df72b6	! t0_kref+0x778:   	flush	%i5 - 0xd4a
	.word	0xed3e6018	! t0_kref+0x77c:   	std	%f22, [%i1 + 0x18]
	.word	0xada00038	! t0_kref+0x780:   	fmovs	%f24, %f22
	.word	0xf207bfe0	! t0_kref+0x784:   	ld	[%fp - 0x20], %i1
	.word	0xa4ddc008	! t0_kref+0x788:   	smulcc	%l7, %o0, %l2
	.word	0xd828a033	! t0_kref+0x78c:   	stb	%o4, [%g2 + 0x33]
	.word	0xac72c00b	! t0_kref+0x790:   	udiv	%o3, %o3, %l6
	.word	0xd4ce9018	! t0_kref+0x794:   	ldsba	[%i2 + %i0]0x80, %o2
	.word	0xd228a00d	! t0_kref+0x798:   	stb	%o1, [%g2 + 0xd]
	.word	0xc12e3fe4	! t0_kref+0x79c:   	st	%fsr, [%i0 - 0x1c]
	.word	0x90c5000c	! t0_kref+0x7a0:   	addccc	%l4, %o4, %o0
	.word	0x9a733ac9	! t0_kref+0x7a4:   	udiv	%o4, -0x537, %o5
	.word	0x98758017	! t0_kref+0x7a8:   	udiv	%l6, %l7, %o4
	.word	0x9e0a30bd	! t0_kref+0x7ac:   	and	%o0, -0xf43, %o7
	.word	0x2b480003	! t0_kref+0x7b0:   	fbug,a,pt	%fcc0, _kref+0x7bc
	.word	0x1b0f486b	! t0_kref+0x7b4:   	sethi	%hi(0x3d21ac00), %o5
	.word	0xe46e8018	! t0_kref+0x7b8:   	ldstub	[%i2 + %i0], %l2
	.word	0x90f2400c	! t0_kref+0x7bc:   	udivcc	%o1, %o4, %o0
	.word	0xb1a6884a	! t0_kref+0x7c0:   	faddd	%f26, %f10, %f24
	.word	0x9e3a4017	! t0_kref+0x7c4:   	xnor	%o1, %l7, %o7
	.word	0xada01a37	! t0_kref+0x7c8:   	fstoi	%f23, %f22
	.word	0xb9a24d32	! t0_kref+0x7cc:   	fsmuld	%f9, %f18, %f28
	.word	0xa6a56e95	! t0_kref+0x7d0:   	subcc	%l5, 0xe95, %l3
	.word	0x28480001	! t0_kref+0x7d4:   	bleu,a,pt	%icc, _kref+0x7d8
	.word	0x98fd4008	! t0_kref+0x7d8:   	sdivcc	%l5, %o0, %o4
	.word	0xe53e3ff8	! t0_kref+0x7dc:   	std	%f18, [%i0 - 8]
	.word	0x83414000	! t0_kref+0x7e0:   	mov	%pc, %g1
	.word	0xa5a1893b	! t0_kref+0x7e4:   	fmuls	%f6, %f27, %f18
	.word	0xa5a5cd2e	! t0_kref+0x7e8:   	fsmuld	%f23, %f14, %f18
	.word	0xa140c000	! t0_kref+0x7ec:   	mov	%asi, %l0
	.word	0xd8066000	! t0_kref+0x7f0:   	ld	[%i1], %o4
	.word	0xd4366000	! t0_kref+0x7f4:   	sth	%o2, [%i1]
	.word	0x90358017	! t0_kref+0x7f8:   	orn	%l6, %l7, %o0
	.word	0x81df3b2b	! t0_kref+0x7fc:   	flush	%i4 - 0x4d5
	.word	0x81aa8ad4	! t0_kref+0x800:   	fcmped	%fcc0, %f10, %f20
	.word	0xd6c0a004	! t0_kref+0x804:   	ldswa	[%g2 + 4]%asi, %o3
	.word	0x81ae8acc	! t0_kref+0x808:   	fcmped	%fcc0, %f26, %f12
	.word	0x132d1a62	! t0_kref+0x80c:   	sethi	%hi(0xb4698800), %o1
	.word	0x81400000	! t0_kref+0x810:   	mov	%y, %g0
	.word	0x81834000	! t0_kref+0x814:   	wr	%o5, %g0, %y
	.word	0x99a548b8	! t0_kref+0x818:   	fsubs	%f21, %f24, %f12
	.word	0xada01118	! t0_kref+0x81c:   	fxtod	%f24, %f22
	.word	0x27480003	! t0_kref+0x820:   	fbul,a,pt	%fcc0, _kref+0x82c
	.word	0xeca67fe4	! t0_kref+0x824:   	sta	%l6, [%i1 - 0x1c]%asi
	.word	0xe8a0a034	! t0_kref+0x828:   	sta	%l4, [%g2 + 0x34]%asi
	.word	0xa7a0053b	! t0_kref+0x82c:   	fsqrts	%f27, %f19
	.word	0x9672c01a	! t0_kref+0x830:   	udiv	%o3, %i2, %o3
	.word	0x9122800a	! t0_kref+0x834:   	mulscc	%o2, %o2, %o0
	.word	0x9fc10000	! t0_kref+0x838:   	call	%g4
	.word	0xe106401c	! t0_kref+0x83c:   	ld	[%i1 + %i4], %f16
	.word	0x9a7a800a	! t0_kref+0x840:   	sdiv	%o2, %o2, %o5
	.word	0xda160000	! t0_kref+0x844:   	lduh	[%i0], %o5
	.word	0x86102004	! t0_kref+0x848:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x84c:   	bne,a	_kref+0x84c
	.word	0x86a0e001	! t0_kref+0x850:   	subcc	%g3, 1, %g3
	.word	0xe27e3fe4	! t0_kref+0x854:   	swap	[%i0 - 0x1c], %l1
	.word	0xfd1e3ff0	! t0_kref+0x858:   	ldd	[%i0 - 0x10], %f30
	.word	0xad3d601b	! t0_kref+0x85c:   	sra	%l5, 0x1b, %l6
	.word	0x9da709d6	! t0_kref+0x860:   	fdivd	%f28, %f22, %f14
	.word	0xd7863fe8	! t0_kref+0x864:   	lda	[%i0 - 0x18]%asi, %f11
	.word	0x96a30015	! t0_kref+0x868:   	subcc	%o4, %l5, %o3
	.word	0xb1a409ce	! t0_kref+0x86c:   	fdivd	%f16, %f14, %f24
	.word	0xe4560000	! t0_kref+0x870:   	ldsh	[%i0], %l2
	.word	0x952a0016	! t0_kref+0x874:   	sll	%o0, %l6, %o2
	.word	0xec162002	! t0_kref+0x878:   	lduh	[%i0 + 2], %l6
	.word	0xec6e0000	! t0_kref+0x87c:   	ldstub	[%i0], %l6
	.word	0x80feaaa0	! t0_kref+0x880:   	sdivcc	%i2, 0xaa0, %g0
	.word	0xa7a0052d	! t0_kref+0x884:   	fsqrts	%f13, %f19
	.word	0xd4162000	! t0_kref+0x888:   	lduh	[%i0], %o2
	.word	0x29480008	! t0_kref+0x88c:   	fbl,a,pt	%fcc0, _kref+0x8ac
	.word	0x90f50016	! t0_kref+0x890:   	udivcc	%l4, %l6, %o0
	.word	0xa0158000	! t0_kref+0x894:   	or	%l6, %g0, %l0
	.word	0xada2cd30	! t0_kref+0x898:   	fsmuld	%f11, %f16, %f22
	.word	0x92636c49	! t0_kref+0x89c:   	subc	%o5, 0xc49, %o1
	.word	0x9fc10000	! t0_kref+0x8a0:   	call	%g4
	.word	0xafa01a2e	! t0_kref+0x8a4:   	fstoi	%f14, %f23
	.word	0xd9beda18	! t0_kref+0x8a8:   	stda	%f12, [%i3 + %i0]0xd0
	.word	0x26800008	! t0_kref+0x8ac:   	bl,a	_kref+0x8cc
	.word	0xa20aab64	! t0_kref+0x8b0:   	and	%o2, 0xb64, %l1
	.word	0xa6157b4a	! t0_kref+0x8b4:   	or	%l5, -0x4b6, %l3
	.word	0x3e800005	! t0_kref+0x8b8:   	bvc,a	_kref+0x8cc
	.word	0x9ef56e1b	! t0_kref+0x8bc:   	udivcc	%l5, 0xe1b, %o7
	.word	0xa2c2ec09	! t0_kref+0x8c0:   	addccc	%o3, 0xc09, %l1
	.word	0xb1a6095c	! t0_kref+0x8c4:   	fmuld	%f24, %f28, %f24
	.word	0xd688a014	! t0_kref+0x8c8:   	lduba	[%g2 + 0x14]%asi, %o3
	.word	0x9fc00004	! t0_kref+0x8cc:   	call	%g0 + %g4
	.word	0xe8064000	! t0_kref+0x8d0:   	ld	[%i1], %l4
	.word	0x20800005	! t0_kref+0x8d4:   	bn,a	_kref+0x8e8
	.word	0x95a00528	! t0_kref+0x8d8:   	fsqrts	%f8, %f10
	.word	0x90fb67e2	! t0_kref+0x8dc:   	sdivcc	%o5, 0x7e2, %o0
	.word	0xd91fbc78	! t0_kref+0x8e0:   	ldd	[%fp - 0x388], %f12
	.word	0x99a0192f	! t0_kref+0x8e4:   	fstod	%f15, %f12
	.word	0x3a800004	! t0_kref+0x8e8:   	bcc,a	_kref+0x8f8
	.word	0xad252a7d	! t0_kref+0x8ec:   	mulscc	%l4, 0xa7d, %l6
	.word	0x8da018ca	! t0_kref+0x8f0:   	fdtos	%f10, %f6
	.word	0xd67f0018	! t0_kref+0x8f4:   	swap	[%i4 + %i0], %o3
	.word	0xf9b81018	! t0_kref+0x8f8:   	stda	%f28, [%g0 + %i0]0x80
	.word	0xe2ee601c	! t0_kref+0x8fc:   	ldstuba	[%i1 + 0x1c]%asi, %l1
	.word	0xa5a00126	! t0_kref+0x900:   	fabss	%f6, %f18
	.word	0xab400000	! t0_kref+0x904:   	mov	%y, %l5
	.word	0xd0366002	! t0_kref+0x908:   	sth	%o0, [%i1 + 2]
	.word	0xf900a030	! t0_kref+0x90c:   	ld	[%g2 + 0x30], %f28
	.word	0xb5a000dc	! t0_kref+0x910:   	fnegd	%f28, %f26
	.word	0xe8a8a010	! t0_kref+0x914:   	stba	%l4, [%g2 + 0x10]%asi
	.word	0x83414000	! t0_kref+0x918:   	mov	%pc, %g1
	.word	0xa3a01a35	! t0_kref+0x91c:   	fstoi	%f21, %f17
	.word	0xe706600c	! t0_kref+0x920:   	ld	[%i1 + 0xc], %f19
	.word	0x30800004	! t0_kref+0x924:   	ba,a	_kref+0x934
	.word	0xa11ac00c	! t0_kref+0x928:   	tsubcctv	%o3, %o4, %l0
	.word	0x97a018cc	! t0_kref+0x92c:   	fdtos	%f12, %f11
	.word	0xe2080018	! t0_kref+0x930:   	ldub	[%g0 + %i0], %l1
	.word	0xd44e200b	! t0_kref+0x934:   	ldsb	[%i0 + 0xb], %o2
	.word	0x2f480008	! t0_kref+0x938:   	fbu,a,pt	%fcc0, _kref+0x958
	.word	0xe51f4019	! t0_kref+0x93c:   	ldd	[%i5 + %i1], %f18
	.word	0x81dac010	! t0_kref+0x940:   	flush	%o3 + %l0
	.word	0x3b480006	! t0_kref+0x944:   	fble,a,pt	%fcc0, _kref+0x95c
	.word	0xc006600c	! t0_kref+0x948:   	ld	[%i1 + 0xc], %g0
	.word	0xb9a01926	! t0_kref+0x94c:   	fstod	%f6, %f28
	.word	0xd66e601f	! t0_kref+0x950:   	ldstub	[%i1 + 0x1f], %o3
	.word	0xa41aba08	! t0_kref+0x954:   	xor	%o2, -0x5f8, %l2
	.word	0xa7a0052e	! t0_kref+0x958:   	fsqrts	%f14, %f19
	.word	0x9ba00035	! t0_kref+0x95c:   	fmovs	%f21, %f13
	.word	0xb1a00538	! t0_kref+0x960:   	fsqrts	%f24, %f24
	.word	0xb9a408b1	! t0_kref+0x964:   	fsubs	%f16, %f17, %f28
	.word	0xe700a000	! t0_kref+0x968:   	ld	[%g2], %f19
	.word	0xdda0a00c	! t0_kref+0x96c:   	sta	%f14, [%g2 + 0xc]%asi
	.word	0x97a0188f	! t0_kref+0x970:   	fitos	%f15, %f11
	.word	0xeb067fec	! t0_kref+0x974:   	ld	[%i1 - 0x14], %f21
	.word	0x86102005	! t0_kref+0x978:   	mov	0x5, %g3
	.word	0x86a0e001	! t0_kref+0x97c:   	subcc	%g3, 1, %g3
	.word	0x2280000c	! t0_kref+0x980:   	be,a	_kref+0x9b0
	.word	0xe2c8a005	! t0_kref+0x984:   	ldsba	[%g2 + 5]%asi, %l1
	.word	0x81adca26	! t0_kref+0x988:   	fcmps	%fcc0, %f23, %f6
	.word	0xa45aa323	! t0_kref+0x98c:   	smul	%o2, 0x323, %l2
	.word	0x25480007	! t0_kref+0x990:   	fblg,a,pt	%fcc0, _kref+0x9ac
	.word	0xae3d0000	! t0_kref+0x994:   	not	%l4, %l7
	.word	0xe400a014	! t0_kref+0x998:   	ld	[%g2 + 0x14], %l2
	.word	0xf4367fe0	! t0_kref+0x99c:   	sth	%i2, [%i1 - 0x20]
	.word	0xa1a70933	! t0_kref+0x9a0:   	fmuls	%f28, %f19, %f16
	.word	0xada748b0	! t0_kref+0x9a4:   	fsubs	%f29, %f16, %f22
	.word	0xd8c0a03c	! t0_kref+0x9a8:   	ldswa	[%g2 + 0x3c]%asi, %o4
	.word	0xd5f65016	! t0_kref+0x9ac:   	casxa	[%i1]0x80, %l6, %o2
	.word	0xd1be9a18	! t0_kref+0x9b0:   	stda	%f8, [%i2 + %i0]0xd0
	.word	0xafa4c8ba	! t0_kref+0x9b4:   	fsubs	%f19, %f26, %f23
	.word	0xd430a030	! t0_kref+0x9b8:   	sth	%o2, [%g2 + 0x30]
	.word	0x3d480008	! t0_kref+0x9bc:   	fbule,a,pt	%fcc0, _kref+0x9dc
	.word	0xe8180018	! t0_kref+0x9c0:   	ldd	[%g0 + %i0], %l4
	.word	0x9da01a36	! t0_kref+0x9c4:   	fstoi	%f22, %f14
	.word	0x81850000	! t0_kref+0x9c8:   	wr	%l4, %g0, %y
	.word	0xa663311f	! t0_kref+0x9cc:   	subc	%o4, -0xee1, %l3
	.word	0xa4dd75c7	! t0_kref+0x9d0:   	smulcc	%l5, -0xa39, %l2
	.word	0x9f32601d	! t0_kref+0x9d4:   	srl	%o1, 0x1d, %o7
	.word	0xd8e81018	! t0_kref+0x9d8:   	ldstuba	[%g0 + %i0]0x80, %o4
	.word	0x9ef54008	! t0_kref+0x9dc:   	udivcc	%l5, %o0, %o7
	.word	0xd2a8a023	! t0_kref+0x9e0:   	stba	%o1, [%g2 + 0x23]%asi
	.word	0xe53e001d	! t0_kref+0x9e4:   	std	%f18, [%i0 + %i5]
	.word	0xda88a004	! t0_kref+0x9e8:   	lduba	[%g2 + 4]%asi, %o5
	.word	0xda56c018	! t0_kref+0x9ec:   	ldsh	[%i3 + %i0], %o5
	.word	0x8032f1fc	! t0_kref+0x9f0:   	orn	%o3, -0xe04, %g0
	.word	0xd2ee9019	! t0_kref+0x9f4:   	ldstuba	[%i2 + %i1]0x80, %o1
	.word	0xa87a7bca	! t0_kref+0x9f8:   	sdiv	%o1, -0x436, %l4
	.word	0x86102003	! t0_kref+0x9fc:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0xa00:   	bne,a	_kref+0xa00
	.word	0x86a0e001	! t0_kref+0xa04:   	subcc	%g3, 1, %g3
	.word	0xe580a01c	! t0_kref+0xa08:   	lda	[%g2 + 0x1c]%asi, %f18
	.word	0x94424000	! t0_kref+0xa0c:   	addc	%o1, %g0, %o2
	.word	0xec866008	! t0_kref+0xa10:   	lda	[%i1 + 8]%asi, %l6
	.word	0xfd00a034	! t0_kref+0xa14:   	ld	[%g2 + 0x34], %f30
	.word	0x9da00133	! t0_kref+0xa18:   	fabss	%f19, %f14
	.word	0x9de3bfa0	! t0_kref+0xa1c:   	save	%sp, -0x60, %sp
	.word	0xb62e8018	! t0_kref+0xa20:   	andn	%i2, %i0, %i3
	.word	0xabef7331	! t0_kref+0xa24:   	restore	%i5, -0xccf, %l5
	.word	0xcd1fbd88	! t0_kref+0xa28:   	ldd	[%fp - 0x278], %f6
	.word	0xe6100019	! t0_kref+0xa2c:   	lduh	[%g0 + %i1], %l3
	.word	0xd436001b	! t0_kref+0xa30:   	sth	%o2, [%i0 + %i3]
	.word	0xa8bb400b	! t0_kref+0xa34:   	xnorcc	%o5, %o3, %l4
	.word	0x811833e2	! t0_kref+0xa38:   	tsubcctv	%g0, -0xc1e, %g0
	.word	0xaa65c009	! t0_kref+0xa3c:   	subc	%l7, %o1, %l5
	.word	0x3d480005	! t0_kref+0xa40:   	fbule,a,pt	%fcc0, _kref+0xa54
	.word	0x967b400b	! t0_kref+0xa44:   	sdiv	%o5, %o3, %o3
	.word	0xa8fb0016	! t0_kref+0xa48:   	sdivcc	%o4, %l6, %l4
	.word	0x8d85801a	! t0_kref+0xa4c:   	wr	%l6, %i2, %fprs
	.word	0xb7a018d6	! t0_kref+0xa50:   	fdtos	%f22, %f27
	.word	0x9de3bfa0	! t0_kref+0xa54:   	save	%sp, -0x60, %sp
	.word	0x80360018	! t0_kref+0xa58:   	orn	%i0, %i0, %g0
	.word	0x97ee75d9	! t0_kref+0xa5c:   	restore	%i1, -0xa27, %o3
	.word	0x2c480007	! t0_kref+0xa60:   	bneg,a,pt	%icc, _kref+0xa7c
	.word	0x91a000d0	! t0_kref+0xa64:   	fnegd	%f16, %f8
	.word	0xaa5eabfe	! t0_kref+0xa68:   	smul	%i2, 0xbfe, %l5
	.word	0x39480005	! t0_kref+0xa6c:   	fbuge,a,pt	%fcc0, _kref+0xa80
	.word	0xd4ce9040	! t0_kref+0xa70:   	ldsba	[%i2]0x82, %o2
	.word	0xada709ce	! t0_kref+0xa74:   	fdivd	%f28, %f14, %f22
	.word	0x34800001	! t0_kref+0xa78:   	bg,a	_kref+0xa7c
	.word	0x8002f982	! t0_kref+0xa7c:   	add	%o3, -0x67e, %g0
	.word	0x80f2fe5e	! t0_kref+0xa80:   	udivcc	%o3, -0x1a2, %g0
	.word	0xc368a001	! t0_kref+0xa84:   	prefetch	%g2 + 1, 1
	.word	0xa03d3ee4	! t0_kref+0xa88:   	xnor	%l4, -0x11c, %l0
	.word	0xaba5c927	! t0_kref+0xa8c:   	fmuls	%f23, %f7, %f21
	.word	0xae1ab784	! t0_kref+0xa90:   	xor	%o2, -0x87c, %l7
	.word	0xa4820000	! t0_kref+0xa94:   	addcc	%o0, %g0, %l2
	.word	0xab328008	! t0_kref+0xa98:   	srl	%o2, %o0, %l5
	.word	0xfd3e401d	! t0_kref+0xa9c:   	std	%f30, [%i1 + %i5]
	.word	0xd8560000	! t0_kref+0xaa0:   	ldsh	[%i0], %o4
	.word	0xd8267fe4	! t0_kref+0xaa4:   	st	%o4, [%i1 - 0x1c]
	.word	0x3a800007	! t0_kref+0xaa8:   	bcc,a	_kref+0xac4
	.word	0xe9be1a1a	! t0_kref+0xaac:   	stda	%f20, [%i0 + %i2]0xd0
	.word	0x902afd25	! t0_kref+0xab0:   	andn	%o3, -0x2db, %o0
	.word	0xec4e2000	! t0_kref+0xab4:   	ldsb	[%i0], %l6
	.word	0xe81e401d	! t0_kref+0xab8:   	ldd	[%i1 + %i5], %l4
	.word	0x30800006	! t0_kref+0xabc:   	ba,a	_kref+0xad4
	.word	0xc568a041	! t0_kref+0xac0:   	prefetch	%g2 + 0x41, 2
	.word	0x2a480001	! t0_kref+0xac4:   	bcs,a,pt	%icc, _kref+0xac8
	.word	0xa32b0016	! t0_kref+0xac8:   	sll	%o4, %l6, %l1
	.word	0x960d6b4a	! t0_kref+0xacc:   	and	%l5, 0xb4a, %o3
	.word	0xaefac014	! t0_kref+0xad0:   	sdivcc	%o3, %l4, %l7
	.word	0x9452c009	! t0_kref+0xad4:   	umul	%o3, %o1, %o2
	.word	0xdbf6501a	! t0_kref+0xad8:   	casxa	[%i1]0x80, %i2, %o5
	.word	0xd228a01b	! t0_kref+0xadc:   	stb	%o1, [%g2 + 0x1b]
	.word	0xada28956	! t0_kref+0xae0:   	fmuld	%f10, %f22, %f22
	.word	0x2a480002	! t0_kref+0xae4:   	bcs,a,pt	%icc, _kref+0xaec
	.word	0xaa3ac014	! t0_kref+0xae8:   	xnor	%o3, %l4, %l5
	.word	0x9e383e6c	! t0_kref+0xaec:   	xnor	%g0, -0x194, %o7
	.word	0xa85021d3	! t0_kref+0xaf0:   	umul	%g0, 0x1d3, %l4
	.word	0xe11fbd48	! t0_kref+0xaf4:   	ldd	[%fp - 0x2b8], %f16
	.word	0x98c2b3bd	! t0_kref+0xaf8:   	addccc	%o2, -0xc43, %o4
	.word	0xb1a5885c	! t0_kref+0xafc:   	faddd	%f22, %f28, %f24
	.word	0x9f3a4000	! t0_kref+0xb00:   	sra	%o1, %g0, %o7
	.word	0xdab0a012	! t0_kref+0xb04:   	stha	%o5, [%g2 + 0x12]%asi
	.word	0xe780a000	! t0_kref+0xb08:   	lda	[%g2]%asi, %f19
	.word	0xd9bf1a59	! t0_kref+0xb0c:   	stda	%f12, [%i4 + %i1]0xd2
	.word	0xada0002e	! t0_kref+0xb10:   	fmovs	%f14, %f22
	.word	0x81dcc01c	! t0_kref+0xb14:   	flush	%l3 + %i4
	.word	0xa8557a49	! t0_kref+0xb18:   	umul	%l5, -0x5b7, %l4
	.word	0x80bd3d34	! t0_kref+0xb1c:   	xnorcc	%l4, -0x2cc, %g0
	.word	0xc12e6014	! t0_kref+0xb20:   	st	%fsr, [%i1 + 0x14]
	.word	0xdd062010	! t0_kref+0xb24:   	ld	[%i0 + 0x10], %f14
	.word	0x91a01a2f	! t0_kref+0xb28:   	fstoi	%f15, %f8
	.word	0xa1a288ac	! t0_kref+0xb2c:   	fsubs	%f10, %f12, %f16
	.word	0xaba549b3	! t0_kref+0xb30:   	fdivs	%f21, %f19, %f21
	.word	0x2e800001	! t0_kref+0xb34:   	bvs,a	_kref+0xb38
	.word	0x9b32a00c	! t0_kref+0xb38:   	srl	%o2, 0xc, %o5
	.word	0xea2e4000	! t0_kref+0xb3c:   	stb	%l5, [%i1]
	.word	0x35480008	! t0_kref+0xb40:   	fbue,a,pt	%fcc0, _kref+0xb60
	.word	0xb5a189ce	! t0_kref+0xb44:   	fdivd	%f6, %f14, %f26
	.word	0xae0a203b	! t0_kref+0xb48:   	and	%o0, 0x3b, %l7
	call	SYM(t0_subr3)
	.word	0xf91fbcd0	! t0_kref+0xb50:   	ldd	[%fp - 0x330], %f28
	.word	0x9fc10000	! t0_kref+0xb54:   	call	%g4
	.word	0xea263fe0	! t0_kref+0xb58:   	st	%l5, [%i0 - 0x20]
	.word	0x99a50850	! t0_kref+0xb5c:   	faddd	%f20, %f16, %f12
	.word	0x9de3bfa0	! t0_kref+0xb60:   	save	%sp, -0x60, %sp
	.word	0xb8ae401c	! t0_kref+0xb64:   	andncc	%i1, %i4, %i4
	.word	0xa9ef001a	! t0_kref+0xb68:   	restore	%i4, %i2, %l4
	.word	0xaba00031	! t0_kref+0xb6c:   	fmovs	%f17, %f21
	.word	0x99a01a46	! t0_kref+0xb70:   	fdtoi	%f6, %f12
	.word	0x86102014	! t0_kref+0xb74:   	mov	0x14, %g3
	.word	0x86a0e001	! t0_kref+0xb78:   	subcc	%g3, 1, %g3
	.word	0x2280001f	! t0_kref+0xb7c:   	be,a	_kref+0xbf8
	.word	0xec2e600f	! t0_kref+0xb80:   	stb	%l6, [%i1 + 0xf]
	.word	0x95a3885c	! t0_kref+0xb84:   	faddd	%f14, %f28, %f10
	.word	0xa87d8000	! t0_kref+0xb88:   	sdiv	%l6, %g0, %l4
	.word	0x943a800a	! t0_kref+0xb8c:   	xnor	%o2, %o2, %o2
	.word	0xa7a00539	! t0_kref+0xb90:   	fsqrts	%f25, %f19
	.word	0xd8780018	! t0_kref+0xb94:   	swap	[%g0 + %i0], %o4
	.word	0xd82e401a	! t0_kref+0xb98:   	stb	%o4, [%i1 + %i2]
	.word	0x9da01116	! t0_kref+0xb9c:   	fxtod	%f22, %f14
	.word	0xde0e8019	! t0_kref+0xba0:   	ldub	[%i2 + %i1], %o7
	.word	0xada2c8ae	! t0_kref+0xba4:   	fsubs	%f11, %f14, %f22
	.word	0xe6782c38	! t0_kref+0xba8:   	swap	[%g0 + 0xc38], %l3
	.word	0xf306001c	! t0_kref+0xbac:   	ld	[%i0 + %i4], %f25
	.word	0xa5a708af	! t0_kref+0xbb0:   	fsubs	%f28, %f15, %f18
	.word	0xd028a016	! t0_kref+0xbb4:   	stb	%o0, [%g2 + 0x16]
	.word	0xdd00a014	! t0_kref+0xbb8:   	ld	[%g2 + 0x14], %f14
	.word	0xea264000	! t0_kref+0xbbc:   	st	%l5, [%i1]
	.word	0xa7034015	! t0_kref+0xbc0:   	taddcc	%o5, %l5, %l3
	.word	0xa2fdc016	! t0_kref+0xbc4:   	sdivcc	%l7, %l6, %l1
	.word	0x9fc10000	! t0_kref+0xbc8:   	call	%g4
	.word	0xa245c00a	! t0_kref+0xbcc:   	addc	%l7, %o2, %l1
	.word	0xe2066018	! t0_kref+0xbd0:   	ld	[%i1 + 0x18], %l1
	.word	0x9135a019	! t0_kref+0xbd4:   	srl	%l6, 0x19, %o0
	.word	0xa5a01889	! t0_kref+0xbd8:   	fitos	%f9, %f18
	.word	0x99a50d3e	! t0_kref+0xbdc:   	fsmuld	%f20, %f30, %f12
	.word	0xacc5800d	! t0_kref+0xbe0:   	addccc	%l6, %o5, %l6
	.word	0xec00a038	! t0_kref+0xbe4:   	ld	[%g2 + 0x38], %l6
	.word	0x921a332e	! t0_kref+0xbe8:   	xor	%o0, -0xcd2, %o1
	.word	0x81820000	! t0_kref+0xbec:   	wr	%o0, %g0, %y
	.word	0x91a44d2b	! t0_kref+0xbf0:   	fsmuld	%f17, %f11, %f8
	.word	0xf53e3ff8	! t0_kref+0xbf4:   	std	%f26, [%i0 - 8]
	.word	0xd0be101d	! t0_kref+0xbf8:   	stda	%o0, [%i0 + %i5]0x80
	.word	0xa1418000	! t0_kref+0xbfc:   	mov	%fprs, %l0
	.word	0xcd1e401d	! t0_kref+0xc00:   	ldd	[%i1 + %i5], %f6
	.word	0x81820000	! t0_kref+0xc04:   	wr	%o0, %g0, %y
	.word	0x81d80015	! t0_kref+0xc08:   	flush	%g0 + %l5
	.word	0x25480004	! t0_kref+0xc0c:   	fblg,a,pt	%fcc0, _kref+0xc1c
	.word	0xd040a02c	! t0_kref+0xc10:   	ldsw	[%g2 + 0x2c], %o0
	.word	0xaf40c000	! t0_kref+0xc14:   	mov	%asi, %l7
	.word	0xa632000c	! t0_kref+0xc18:   	orn	%o0, %o4, %l3
	.word	0xad2ac000	! t0_kref+0xc1c:   	sll	%o3, %g0, %l6
	.word	0xa6827b47	! t0_kref+0xc20:   	addcc	%o1, -0x4b9, %l3
	.word	0x9245a1e3	! t0_kref+0xc24:   	addc	%l6, 0x1e3, %o1
	.word	0xe208a01c	! t0_kref+0xc28:   	ldub	[%g2 + 0x1c], %l1
	.word	0x81ad8ad4	! t0_kref+0xc2c:   	fcmped	%fcc0, %f22, %f20
	.word	0xd6780019	! t0_kref+0xc30:   	swap	[%g0 + %i1], %o3
	.word	0xa9a5894c	! t0_kref+0xc34:   	fmuld	%f22, %f12, %f20
	.word	0xd850a002	! t0_kref+0xc38:   	ldsh	[%g2 + 2], %o4
	.word	0xafa64829	! t0_kref+0xc3c:   	fadds	%f25, %f9, %f23
	.word	0x80537c4c	! t0_kref+0xc40:   	umul	%o5, -0x3b4, %g0
	.word	0xa4fa401a	! t0_kref+0xc44:   	sdivcc	%o1, %i2, %l2
	.word	0xaa92334e	! t0_kref+0xc48:   	orcc	%o0, -0xcb2, %l5
	.word	0xd856601a	! t0_kref+0xc4c:   	ldsh	[%i1 + 0x1a], %o4
	.word	0xcd863fe8	! t0_kref+0xc50:   	lda	[%i0 - 0x18]%asi, %f6
	.word	0x97400000	! t0_kref+0xc54:   	mov	%y, %o3
	.word	0x9e2aabb7	! t0_kref+0xc58:   	andn	%o2, 0xbb7, %o7
	.word	0x8035001a	! t0_kref+0xc5c:   	orn	%l4, %i2, %g0
	.word	0x9de3bfa0	! t0_kref+0xc60:   	save	%sp, -0x60, %sp
	.word	0x95e838c6	! t0_kref+0xc64:   	restore	%g0, -0x73a, %o2
	.word	0xd53e2008	! t0_kref+0xc68:   	std	%f10, [%i0 + 8]
	.word	0xd7262004	! t0_kref+0xc6c:   	st	%f11, [%i0 + 4]
	.word	0xd91fbf38	! t0_kref+0xc70:   	ldd	[%fp - 0xc8], %f12
	.word	0x99a40830	! t0_kref+0xc74:   	fadds	%f16, %f16, %f12
	.word	0xd8160000	! t0_kref+0xc78:   	lduh	[%i0], %o4
	.word	0xdf266018	! t0_kref+0xc7c:   	st	%f15, [%i1 + 0x18]
	.word	0x9ba58834	! t0_kref+0xc80:   	fadds	%f22, %f20, %f13
	.word	0xf380a030	! t0_kref+0xc84:   	lda	[%g2 + 0x30]%asi, %f25
	.word	0xa7703280	! t0_kref+0xc88:   	popc	-0xd80, %l3
	.word	0xbda00035	! t0_kref+0xc8c:   	fmovs	%f21, %f30
	.word	0xe900a010	! t0_kref+0xc90:   	ld	[%g2 + 0x10], %f20
	.word	0xe2680018	! t0_kref+0xc94:   	ldstub	[%g0 + %i0], %l1
	.word	0x20800008	! t0_kref+0xc98:   	bn,a	_kref+0xcb8
	.word	0xb5a00538	! t0_kref+0xc9c:   	fsqrts	%f24, %f26
	.word	0xa466800d	! t0_kref+0xca0:   	subc	%i2, %o5, %l2
	.word	0xee566014	! t0_kref+0xca4:   	ldsh	[%i1 + 0x14], %l7
	.word	0xafa00533	! t0_kref+0xca8:   	fsqrts	%f19, %f23
	.word	0xa2052a62	! t0_kref+0xcac:   	add	%l4, 0xa62, %l1
	.word	0x99a01889	! t0_kref+0xcb0:   	fitos	%f9, %f12
	.word	0x81800000	! t0_kref+0xcb4:   	mov	%g0, %y
	.word	0x8610201c	! t0_kref+0xcb8:   	mov	0x1c, %g3
	.word	0x86a0e001	! t0_kref+0xcbc:   	subcc	%g3, 1, %g3
	.word	0x2280001c	! t0_kref+0xcc0:   	be,a	_kref+0xd30
	.word	0xee6e2002	! t0_kref+0xcc4:   	ldstub	[%i0 + 2], %l7
	.word	0x9615e811	! t0_kref+0xcc8:   	or	%l7, 0x811, %o3
	.word	0x20bffffc	! t0_kref+0xccc:   	bn,a	_kref+0xcbc
	.word	0x81830000	! t0_kref+0xcd0:   	wr	%o4, %g0, %y
	.word	0x9b0dbb98	! t0_kref+0xcd4:   	tsubcc	%l6, -0x468, %o5
	.word	0xa07d2526	! t0_kref+0xcd8:   	sdiv	%l4, 0x526, %l0
	.word	0x81ac0ac8	! t0_kref+0xcdc:   	fcmped	%fcc0, %f16, %f8
	.word	0xd00e001a	! t0_kref+0xce0:   	ldub	[%i0 + %i2], %o0
	.word	0xa73d8016	! t0_kref+0xce4:   	sra	%l6, %l6, %l3
	.word	0xf1be588b	! t0_kref+0xce8:   	stda	%f24, [%i1 + %o3]0xc4
	.word	0xe91e7ff0	! t0_kref+0xcec:   	ldd	[%i1 - 0x10], %f20
	.word	0x94e30016	! t0_kref+0xcf0:   	subccc	%o4, %l6, %o2
	.word	0x3c800005	! t0_kref+0xcf4:   	bpos,a	_kref+0xd08
	.word	0xc04e7fe1	! t0_kref+0xcf8:   	ldsb	[%i1 - 0x1f], %g0
	.word	0x81da2c6d	! t0_kref+0xcfc:   	flush	%o0 + 0xc6d
	.word	0xb9a01a2b	! t0_kref+0xd00:   	fstoi	%f11, %f28
	.word	0xa5aac048	! t0_kref+0xd04:   	fmovdge	%fcc0, %f8, %f18
	.word	0x9aaa0017	! t0_kref+0xd08:   	andncc	%o0, %l7, %o5
	.word	0x21bfffec	! t0_kref+0xd0c:   	fbn,a	_kref+0xcbc
	.word	0x9e3d34ae	! t0_kref+0xd10:   	xnor	%l4, -0xb52, %o7
	.word	0xee0e601b	! t0_kref+0xd14:   	ldub	[%i1 + 0x1b], %l7
	.word	0xf42e6002	! t0_kref+0xd18:   	stb	%i2, [%i1 + 2]
	.word	0xd64e600c	! t0_kref+0xd1c:   	ldsb	[%i1 + 0xc], %o3
	.word	0xe87e3fe4	! t0_kref+0xd20:   	swap	[%i0 - 0x1c], %l4
	.word	0xa07a38ff	! t0_kref+0xd24:   	sdiv	%o0, -0x701, %l0
	.word	0xea80a028	! t0_kref+0xd28:   	lda	[%g2 + 0x28]%asi, %l5
	.word	0x969332aa	! t0_kref+0xd2c:   	orcc	%o4, -0xd56, %o3
	.word	0x972da01f	! t0_kref+0xd30:   	sll	%l6, 0x1f, %o3
	.word	0x951df050	! t0_kref+0xd34:   	tsubcctv	%l7, -0xfb0, %o2
	.word	0xd51e3ff0	! t0_kref+0xd38:   	ldd	[%i0 - 0x10], %f10
	.word	0x9ba0003b	! t0_kref+0xd3c:   	fmovs	%f27, %f13
	.word	0x2a480008	! t0_kref+0xd40:   	bcs,a,pt	%icc, _kref+0xd60
	.word	0xada6483a	! t0_kref+0xd44:   	fadds	%f25, %f26, %f22
	.word	0xea40a03c	! t0_kref+0xd48:   	ldsw	[%g2 + 0x3c], %l5
	.word	0xf420a008	! t0_kref+0xd4c:   	st	%i2, [%g2 + 8]
	.word	0x3e800005	! t0_kref+0xd50:   	bvc,a	_kref+0xd64
	.word	0xea064000	! t0_kref+0xd54:   	ld	[%i1], %l5
	.word	0xd630a00a	! t0_kref+0xd58:   	sth	%o3, [%g2 + 0xa]
	.word	0xb1a6cd32	! t0_kref+0xd5c:   	fsmuld	%f27, %f18, %f24
	.word	0xb7a00536	! t0_kref+0xd60:   	fsqrts	%f22, %f27
	.word	0x9e83400d	! t0_kref+0xd64:   	addcc	%o5, %o5, %o7
	.word	0xa85ab834	! t0_kref+0xd68:   	smul	%o2, -0x7cc, %l4
	.word	0xe01e2000	! t0_kref+0xd6c:   	ldd	[%i0], %l0
	.word	0xc0563fea	! t0_kref+0xd70:   	ldsh	[%i0 - 0x16], %g0
	.word	0x972da003	! t0_kref+0xd74:   	sll	%l6, 0x3, %o3
	.word	0xa0bac00a	! t0_kref+0xd78:   	xnorcc	%o3, %o2, %l0
	.word	0x80bdf776	! t0_kref+0xd7c:   	xnorcc	%l7, -0x88a, %g0
	.word	0x2d1d9a7c	! t0_kref+0xd80:   	sethi	%hi(0x7669f000), %l6
	.word	0xe8ff1018	! t0_kref+0xd84:   	swapa	[%i4 + %i0]0x80, %l4
	.word	0x99a01a30	! t0_kref+0xd88:   	fstoi	%f16, %f12
	.word	0x86102003	! t0_kref+0xd8c:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0xd90:   	bne,a	_kref+0xd90
	.word	0x86a0e001	! t0_kref+0xd94:   	subcc	%g3, 1, %g3
	.word	0x9f414000	! t0_kref+0xd98:   	mov	%pc, %o7
	.word	0x9b3d0016	! t0_kref+0xd9c:   	sra	%l4, %l6, %o5
	.word	0xbba0053e	! t0_kref+0xda0:   	fsqrts	%f30, %f29
	.word	0x947a3f65	! t0_kref+0xda4:   	sdiv	%o0, -0x9b, %o2
	.word	0xd22e3fea	! t0_kref+0xda8:   	stb	%o1, [%i0 - 0x16]
	.word	0xd200a034	! t0_kref+0xdac:   	ld	[%g2 + 0x34], %o1
	.word	0x878020e0	! t0_kref+0xdb0:   	mov	0xe0, %asi
	.word	0xa67d8000	! t0_kref+0xdb4:   	sdiv	%l6, %g0, %l3
	.word	0xe968a08c	! t0_kref+0xdb8:   	prefetch	%g2 + 0x8c, 20
	call	SYM(t0_subr0)
	.word	0x981d674c	! t0_kref+0xdc0:   	xor	%l5, 0x74c, %o4
	.word	0x2c800003	! t0_kref+0xdc4:   	bneg,a	_kref+0xdd0
	.word	0xd8160000	! t0_kref+0xdc8:   	lduh	[%i0], %o4
	.word	0x81868000	! t0_kref+0xdcc:   	wr	%i2, %g0, %y
	.word	0xe40864d8	! t0_kref+0xdd0:   	ldub	[%g1 + 0x4d8], %l2
	.word	0xa41ca00c	! t0_kref+0xdd4:   	xor	%l2, 0xc, %l2
	.word	0xe42864d8	! t0_kref+0xdd8:   	stb	%l2, [%g1 + 0x4d8]
	.word	0x81d864d8	! t0_kref+0xddc:   	flush	%g1 + 0x4d8
	.word	0x9a7d3e73	! t0_kref+0xde0:   	sdiv	%l4, -0x18d, %o5
	.word	0xa1a01a46	! t0_kref+0xde4:   	fdtoi	%f6, %f16
	.word	0xee08a03f	! t0_kref+0xde8:   	ldub	[%g2 + 0x3f], %l7
	.word	0xea00a020	! t0_kref+0xdec:   	ld	[%g2 + 0x20], %l5
2:	.word	0xa21d400d	! t0_kref+0xdf0:   	xor	%l5, %o5, %l1
	.word	0x802a8009	! t0_kref+0xdf4:   	andn	%o2, %o1, %g0
	.word	0xa03b217b	! t0_kref+0xdf8:   	xnor	%o4, 0x17b, %l0
	.word	0xaafb22df	! t0_kref+0xdfc:   	sdivcc	%o4, 0x2df, %l5
	.word	0x96c54014	! t0_kref+0xe00:   	addccc	%l5, %l4, %o3
	.word	0x987abbe0	! t0_kref+0xe04:   	sdiv	%o2, -0x420, %o4
	.word	0xed3e0000	! t0_kref+0xe08:   	std	%f22, [%i0]
	.word	0x3b480003	! t0_kref+0xe0c:   	fble,a,pt	%fcc0, _kref+0xe18
	.word	0xa5a00526	! t0_kref+0xe10:   	fsqrts	%f6, %f18
	.word	0xf36e001b	! t0_kref+0xe14:   	prefetch	%i0 + %i3, 25
	.word	0x24480007	! t0_kref+0xe18:   	ble,a,pt	%icc, _kref+0xe34
	.word	0xe3b8a040	! t0_kref+0xe1c:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xd91fbed8	! t0_kref+0xe20:   	ldd	[%fp - 0x128], %f12
	.word	0xa472fd89	! t0_kref+0xe24:   	udiv	%o3, -0x277, %l2
	.word	0x92fd6866	! t0_kref+0xe28:   	sdivcc	%l5, 0x866, %o1
	.word	0xdf066010	! t0_kref+0xe2c:   	ld	[%i1 + 0x10], %f15
	.word	0xbda5c827	! t0_kref+0xe30:   	fadds	%f23, %f7, %f30
	.word	0x9da68952	! t0_kref+0xe34:   	fmuld	%f26, %f18, %f14
	.word	0xa5336002	! t0_kref+0xe38:   	srl	%o5, 0x2, %l2
	.word	0x1b137f2c	! t0_kref+0xe3c:   	sethi	%hi(0x4dfcb000), %o5
	.word	0xafa789b8	! t0_kref+0xe40:   	fdivs	%f30, %f24, %f23
	.word	0x8da70932	! t0_kref+0xe44:   	fmuls	%f28, %f18, %f6
	.word	0x90aa6b15	! t0_kref+0xe48:   	andncc	%o1, 0xb15, %o0
	.word	0xa5a548a7	! t0_kref+0xe4c:   	fsubs	%f21, %f7, %f18
	.word	0xac150008	! t0_kref+0xe50:   	or	%l4, %o0, %l6
	.word	0x9fc00004	! t0_kref+0xe54:   	call	%g0 + %g4
	.word	0xa02de52f	! t0_kref+0xe58:   	andn	%l7, 0x52f, %l0
	.word	0x8143c000	! t0_kref+0xe5c:   	stbar
	.word	0x34480007	! t0_kref+0xe60:   	bg,a,pt	%icc, _kref+0xe7c
	.word	0x8143c000	! t0_kref+0xe64:   	stbar
	.word	0x81ac4a33	! t0_kref+0xe68:   	fcmps	%fcc0, %f17, %f19
	.word	0xec267fec	! t0_kref+0xe6c:   	st	%l6, [%i1 - 0x14]
	.word	0xb9a00533	! t0_kref+0xe70:   	fsqrts	%f19, %f28
	.word	0xa3003f8c	! t0_kref+0xe74:   	taddcc	%g0, -0x74, %l1
	.word	0x91a208d0	! t0_kref+0xe78:   	fsubd	%f8, %f16, %f8
	.word	0xb5a6895a	! t0_kref+0xe7c:   	fmuld	%f26, %f26, %f26
	.word	0x8610201a	! t0_kref+0xe80:   	mov	0x1a, %g3
	.word	0x86a0e001	! t0_kref+0xe84:   	subcc	%g3, 1, %g3
	.word	0x2280001b	! t0_kref+0xe88:   	be,a	_kref+0xef4
	.word	0xeaa61000	! t0_kref+0xe8c:   	sta	%l5, [%i0]0x80
	.word	0x96c5801a	! t0_kref+0xe90:   	addccc	%l6, %i2, %o3
	.word	0x2132b247	! t0_kref+0xe94:   	sethi	%hi(0xcac91c00), %l0
	.word	0xc030a008	! t0_kref+0xe98:   	clrh	[%g2 + 8]
	.word	0xaba248a9	! t0_kref+0xe9c:   	fsubs	%f9, %f9, %f21
	.word	0x97a1c8ae	! t0_kref+0xea0:   	fsubs	%f7, %f14, %f11
	.word	0x80f36e91	! t0_kref+0xea4:   	udivcc	%o5, 0xe91, %g0
	.word	0xea30a00e	! t0_kref+0xea8:   	sth	%l5, [%g2 + 0xe]
	.word	0x38800004	! t0_kref+0xeac:   	bgu,a	_kref+0xebc
	.word	0xd6164000	! t0_kref+0xeb0:   	lduh	[%i1], %o3
	.word	0xbba689a8	! t0_kref+0xeb4:   	fdivs	%f26, %f8, %f29
	.word	0xa5a018d6	! t0_kref+0xeb8:   	fdtos	%f22, %f18
	.word	0x81418000	! t0_kref+0xebc:   	mov	%fprs, %g0
	.word	0x36800001	! t0_kref+0xec0:   	bge,a	_kref+0xec4
	.word	0xb7a748af	! t0_kref+0xec4:   	fsubs	%f29, %f15, %f27
	.word	0x9676b23e	! t0_kref+0xec8:   	udiv	%i2, -0xdc2, %o3
	.word	0x9803400a	! t0_kref+0xecc:   	add	%o5, %o2, %o4
	.word	0xa21a8014	! t0_kref+0xed0:   	xor	%o2, %l4, %l1
	.word	0xa32d6012	! t0_kref+0xed4:   	sll	%l5, 0x12, %l1
	.word	0x250cf87b	! t0_kref+0xed8:   	sethi	%hi(0x33e1ec00), %l2
	.word	0xd8364000	! t0_kref+0xedc:   	sth	%o4, [%i1]
	.word	0xa0bdbf53	! t0_kref+0xee0:   	xnorcc	%l6, -0xad, %l0
	.word	0xa4c24014	! t0_kref+0xee4:   	addccc	%o1, %l4, %l2
	.word	0x37800004	! t0_kref+0xee8:   	fbge,a	_kref+0xef8
	.word	0xe8080019	! t0_kref+0xeec:   	ldub	[%g0 + %i1], %l4
	.word	0xf9064000	! t0_kref+0xef0:   	ld	[%i1], %f28
	.word	0x90db0009	! t0_kref+0xef4:   	smulcc	%o4, %o1, %o0
	.word	0xec10a026	! t0_kref+0xef8:   	lduh	[%g2 + 0x26], %l6
	.word	0x95326007	! t0_kref+0xefc:   	srl	%o1, 0x7, %o2
	.word	0xada58850	! t0_kref+0xf00:   	faddd	%f22, %f16, %f22
	.word	0xe1be101d	! t0_kref+0xf04:   	stda	%f16, [%i0 + %i5]0x80
	.word	0xb5a448ba	! t0_kref+0xf08:   	fsubs	%f17, %f26, %f26
	.word	0xf9070019	! t0_kref+0xf0c:   	ld	[%i4 + %i1], %f28
	.word	0x2f480006	! t0_kref+0xf10:   	fbu,a,pt	%fcc0, _kref+0xf28
	.word	0xe3ee101c	! t0_kref+0xf14:   	prefetcha	%i0 + %i4, 17
	.word	0x81ac0a58	! t0_kref+0xf18:   	fcmpd	%fcc0, %f16, %f24
	.word	0x80620016	! t0_kref+0xf1c:   	subc	%o0, %l6, %g0
	.word	0xa5a588b0	! t0_kref+0xf20:   	fsubs	%f22, %f16, %f18
	.word	0x9705219a	! t0_kref+0xf24:   	taddcc	%l4, 0x19a, %o3
	.word	0xdab6501b	! t0_kref+0xf28:   	stha	%o5, [%i1 + %i3]0x80
	.word	0x93a0003a	! t0_kref+0xf2c:   	fmovs	%f26, %f9
	.word	0x91a588d2	! t0_kref+0xf30:   	fsubd	%f22, %f18, %f8
	.word	0xa452c01a	! t0_kref+0xf34:   	umul	%o3, %i2, %l2
	.word	0x901a400a	! t0_kref+0xf38:   	xor	%o1, %o2, %o0
	.word	0xfd1fbe48	! t0_kref+0xf3c:   	ldd	[%fp - 0x1b8], %f30
	.word	0x81a98ac6	! t0_kref+0xf40:   	fcmped	%fcc0, %f6, %f6
	.word	0x9a1e8014	! t0_kref+0xf44:   	xor	%i2, %l4, %o5
	.word	0xa5a0192e	! t0_kref+0xf48:   	fstod	%f14, %f18
	.word	0xb9a608a6	! t0_kref+0xf4c:   	fsubs	%f24, %f6, %f28
	.word	0xa5a00136	! t0_kref+0xf50:   	fabss	%f22, %f18
	.word	0xafa0053d	! t0_kref+0xf54:   	fsqrts	%f29, %f23
	.word	0xa01b7442	! t0_kref+0xf58:   	xor	%o5, -0xbbe, %l0
	.word	0x95223198	! t0_kref+0xf5c:   	mulscc	%o0, -0xe68, %o2
	.word	0xf100a01c	! t0_kref+0xf60:   	ld	[%g2 + 0x1c], %f24
	.word	0xd400a01c	! t0_kref+0xf64:   	ld	[%g2 + 0x1c], %o2
	.word	0x27480003	! t0_kref+0xf68:   	fbul,a,pt	%fcc0, _kref+0xf74
	.word	0xaa75ea4d	! t0_kref+0xf6c:   	udiv	%l7, 0xa4d, %l5
	.word	0xd91e401d	! t0_kref+0xf70:   	ldd	[%i1 + %i5], %f12
	.word	0x81858000	! t0_kref+0xf74:   	wr	%l6, %g0, %y
	.word	0xe3ee101c	! t0_kref+0xf78:   	prefetcha	%i0 + %i4, 17
	.word	0xafa00026	! t0_kref+0xf7c:   	fmovs	%f6, %f23
	.word	0xe850a00a	! t0_kref+0xf80:   	ldsh	[%g2 + 0xa], %l4
	.word	0xd62e8018	! t0_kref+0xf84:   	stb	%o3, [%i2 + %i0]
	call	SYM(t0_subr2)
	.word	0x001fffff	! t0_kref+0xf8c:   	illtrap	0x1fffff
	.word	0x9de3bfa0	! t0_kref+0xf90:   	save	%sp, -0x60, %sp
	.word	0x80d7001c	! t0_kref+0xf94:   	umulcc	%i4, %i4, %g0
	.word	0xadee6349	! t0_kref+0xf98:   	restore	%i1, 0x349, %l6
	.word	0x9a1afe2f	! t0_kref+0xf9c:   	xor	%o3, -0x1d1, %o5
	call	SYM(t0_subr1)
	.word	0x92020015	! t0_kref+0xfa4:   	add	%o0, %l5, %o1
	.word	0x9fc10000	! t0_kref+0xfa8:   	call	%g4
	.word	0xa0fdc00b	! t0_kref+0xfac:   	sdivcc	%l7, %o3, %l0
	.word	0xda167fe8	! t0_kref+0xfb0:   	lduh	[%i1 - 0x18], %o5
	.word	0x39480004	! t0_kref+0xfb4:   	fbuge,a,pt	%fcc0, _kref+0xfc4
	.word	0xb1a78858	! t0_kref+0xfb8:   	faddd	%f30, %f24, %f24
	.word	0xe11e6018	! t0_kref+0xfbc:   	ldd	[%i1 + 0x18], %f16
	.word	0xee264000	! t0_kref+0xfc0:   	st	%l7, [%i1]
	.word	0xaba0052f	! t0_kref+0xfc4:   	fsqrts	%f15, %f21
	.word	0x81da4018	! t0_kref+0xfc8:   	flush	%o1 + %i0
	.word	0xd248a02b	! t0_kref+0xfcc:   	ldsb	[%g2 + 0x2b], %o1
	.word	0x9ba018d4	! t0_kref+0xfd0:   	fdtos	%f20, %f13
	.word	0x9fc00004	! t0_kref+0xfd4:   	call	%g0 + %g4
	.word	0x8da289b0	! t0_kref+0xfd8:   	fdivs	%f10, %f16, %f6
	.word	0x99a58d27	! t0_kref+0xfdc:   	fsmuld	%f22, %f7, %f12
	.word	0xa52b400d	! t0_kref+0xfe0:   	sll	%o5, %o5, %l2
	.word	0x2b480006	! t0_kref+0xfe4:   	fbug,a,pt	%fcc0, _kref+0xffc
	.word	0xe820a020	! t0_kref+0xfe8:   	st	%l4, [%g2 + 0x20]
	.word	0xee364000	! t0_kref+0xfec:   	sth	%l7, [%i1]
	.word	0x93a01890	! t0_kref+0xff0:   	fitos	%f16, %f9
	.word	0x800275d6	! t0_kref+0xff4:   	add	%o1, -0xa2a, %g0
	.word	0xe4ce1000	! t0_kref+0xff8:   	ldsba	[%i0]0x80, %l2
	.word	0xa7a54830	! t0_kref+0xffc:   	fadds	%f21, %f16, %f19
	.word	0x81ae0a35	! t0_kref+0x1000:   	fcmps	%fcc0, %f24, %f21
	.word	0xc000a02c	! t0_kref+0x1004:   	ld	[%g2 + 0x2c], %g0
	.word	0xe99f1a19	! t0_kref+0x1008:   	ldda	[%i4 + %i1]0xd0, %f20
	.word	0xada01917	! t0_kref+0x100c:   	fitod	%f23, %f22
	.word	0x83c06704	! t0_kref+0x1010:   	jmpl	%g1 + 0x704, %g1
	.word	0xd8262000	! t0_kref+0x1014:   	st	%o4, [%i0]
	.word	0x81a98a46	! t0_kref+0x1018:   	fcmpd	%fcc0, %f6, %f6
	.word	0x932a8017	! t0_kref+0x101c:   	sll	%o2, %l7, %o1
	.word	0x952da010	! t0_kref+0x1020:   	sll	%l6, 0x10, %o2
	.word	0xe99e1a1a	! t0_kref+0x1024:   	ldda	[%i0 + %i2]0xd0, %f20
	.word	0x28800004	! t0_kref+0x1028:   	bleu,a	_kref+0x1038
	.word	0xd8160000	! t0_kref+0x102c:   	lduh	[%i0], %o4
	.word	0x81aa0a2f	! t0_kref+0x1030:   	fcmps	%fcc0, %f8, %f15
	.word	0x9012b84e	! t0_kref+0x1034:   	or	%o2, -0x7b2, %o0
!	call	0xfffff97c
	.word	0x90fb4017	! t0_kref+0x103c:   	sdivcc	%o5, %l7, %o0
	.word	0xeb000019	! t0_kref+0x1040:   	ld	[%g0 + %i1], %f21
	.word	0xa5a0111a	! t0_kref+0x1044:   	fxtod	%f26, %f18
	.word	0xf386105c	! t0_kref+0x1048:   	lda	[%i0 + %i4]0x82, %f25
	.word	0xee0e6015	! t0_kref+0x104c:   	ldub	[%i1 + 0x15], %l7
	.word	0xe608a03f	! t0_kref+0x1050:   	ldub	[%g2 + 0x3f], %l3
	.word	0xafa508b8	! t0_kref+0x1054:   	fsubs	%f20, %f24, %f23
	.word	0xb1ab805a	! t0_kref+0x1058:   	fmovdule	%fcc0, %f26, %f24
	.word	0x99a28954	! t0_kref+0x105c:   	fmuld	%f10, %f20, %f12
	.word	0xd656001b	! t0_kref+0x1060:   	ldsh	[%i0 + %i3], %o3
	.word	0xacfeab9c	! t0_kref+0x1064:   	sdivcc	%i2, 0xb9c, %l6
	.word	0xaa70000c	! t0_kref+0x1068:   	udiv	%g0, %o4, %l5
	.word	0xa7a00131	! t0_kref+0x106c:   	fabss	%f17, %f19
	.word	0xd80e601e	! t0_kref+0x1070:   	ldub	[%i1 + 0x1e], %o4
	.word	0xada58850	! t0_kref+0x1074:   	faddd	%f22, %f16, %f22
	.word	0xdd180018	! t0_kref+0x1078:   	ldd	[%g0 + %i0], %f14
	.word	0xb1a0053d	! t0_kref+0x107c:   	fsqrts	%f29, %f24
	.word	0xef68a009	! t0_kref+0x1080:   	prefetch	%g2 + 9, 23
	.word	0xa11da612	! t0_kref+0x1084:   	tsubcctv	%l6, 0x612, %l0
	.word	0xec066000	! t0_kref+0x1088:   	ld	[%i1], %l6
	call	SYM(t0_subr0)
	.word	0x992d400c	! t0_kref+0x1090:   	sll	%l5, %o4, %o4
	.word	0xf1be5a5b	! t0_kref+0x1094:   	stda	%f24, [%i1 + %i3]0xd2
	.word	0xe478a030	! t0_kref+0x1098:   	swap	[%g2 + 0x30], %l2
	.word	0x37800008	! t0_kref+0x109c:   	fbge,a	_kref+0x10bc
	.word	0xa6baf502	! t0_kref+0x10a0:   	xnorcc	%o3, -0xafe, %l3
	.word	0x2e480006	! t0_kref+0x10a4:   	bvs,a,pt	%icc, _kref+0x10bc
	.word	0xe8300019	! t0_kref+0x10a8:   	sth	%l4, [%g0 + %i1]
	.word	0xe40e7ffd	! t0_kref+0x10ac:   	ldub	[%i1 - 3], %l2
	.word	0x193484f9	! t0_kref+0x10b0:   	sethi	%hi(0xd213e400), %o4
	.word	0xc12e200c	! t0_kref+0x10b4:   	st	%fsr, [%i0 + 0xc]
	.word	0x947b000a	! t0_kref+0x10b8:   	sdiv	%o4, %o2, %o2
	.word	0xcd1f4019	! t0_kref+0x10bc:   	ldd	[%i5 + %i1], %f6
	.word	0xa2354000	! t0_kref+0x10c0:   	orn	%l5, %g0, %l1
	.word	0xd828a03b	! t0_kref+0x10c4:   	stb	%o4, [%g2 + 0x3b]
	.word	0xe050a03c	! t0_kref+0x10c8:   	ldsh	[%g2 + 0x3c], %l0
	call	SYM(t0_subr1)
	.word	0x95234015	! t0_kref+0x10d0:   	mulscc	%o5, %l5, %o2
	.word	0x9da01911	! t0_kref+0x10d4:   	fitod	%f17, %f14
	.word	0xe408a021	! t0_kref+0x10d8:   	ldub	[%g2 + 0x21], %l2
	.word	0xec28a035	! t0_kref+0x10dc:   	stb	%l6, [%g2 + 0x35]
	.word	0xa6fb6199	! t0_kref+0x10e0:   	sdivcc	%o5, 0x199, %l3
	.word	0x8da000c6	! t0_kref+0x10e4:   	fnegd	%f6, %f6
	.word	0x34480002	! t0_kref+0x10e8:   	bg,a,pt	%icc, _kref+0x10f0
	.word	0xb1a3885c	! t0_kref+0x10ec:   	faddd	%f14, %f28, %f24
	.word	0x90127525	! t0_kref+0x10f0:   	or	%o1, -0xadb, %o0
	.word	0xe99e5a1c	! t0_kref+0x10f4:   	ldda	[%i1 + %i4]0xd0, %f20
	.word	0xa6db4014	! t0_kref+0x10f8:   	smulcc	%o5, %l4, %l3
	.word	0xa32a800d	! t0_kref+0x10fc:   	sll	%o2, %o5, %l1
	.word	0xb7a00132	! t0_kref+0x1100:   	fabss	%f18, %f27
	.word	0x963b38c1	! t0_kref+0x1104:   	xnor	%o4, -0x73f, %o3
	.word	0x3c800004	! t0_kref+0x1108:   	bpos,a	_kref+0x1118
	.word	0xa1a00528	! t0_kref+0x110c:   	fsqrts	%f8, %f16
	.word	0x90fa8015	! t0_kref+0x1110:   	sdivcc	%o2, %l5, %o0
	.word	0xa85af893	! t0_kref+0x1114:   	smul	%o3, -0x76d, %l4
	.word	0xe000a03c	! t0_kref+0x1118:   	ld	[%g2 + 0x3c], %l0
	.word	0x32480008	! t0_kref+0x111c:   	bne,a,pt	%icc, _kref+0x113c
	.word	0x9940c000	! t0_kref+0x1120:   	mov	%asi, %o4
	.word	0xb9a58854	! t0_kref+0x1124:   	faddd	%f22, %f20, %f28
	.word	0x9fa548a6	! t0_kref+0x1128:   	fsubs	%f21, %f6, %f15
	.word	0x9e054014	! t0_kref+0x112c:   	add	%l5, %l4, %o7
	.word	0xa90525c1	! t0_kref+0x1130:   	taddcc	%l4, 0x5c1, %l4
	.word	0x94e5800b	! t0_kref+0x1134:   	subccc	%l6, %o3, %o2
	.word	0x8da5cd33	! t0_kref+0x1138:   	fsmuld	%f23, %f19, %f6
	.word	0x81834000	! t0_kref+0x113c:   	wr	%o5, %g0, %y
	.word	0xa49a240e	! t0_kref+0x1140:   	xorcc	%o0, 0x40e, %l2
	.word	0x86102002	! t0_kref+0x1144:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x1148:   	bne,a	_kref+0x1148
	.word	0x86a0e001	! t0_kref+0x114c:   	subcc	%g3, 1, %g3
	.word	0xd2363fee	! t0_kref+0x1150:   	sth	%o1, [%i0 - 0x12]
	.word	0xe84e8018	! t0_kref+0x1154:   	ldsb	[%i2 + %i0], %l4
	.word	0xd8d81018	! t0_kref+0x1158:   	ldxa	[%g0 + %i0]0x80, %o4
	.word	0xa0e6a3fa	! t0_kref+0x115c:   	subccc	%i2, 0x3fa, %l0
	.word	0xc07e6004	! t0_kref+0x1160:   	swap	[%i1 + 4], %g0
	.word	0x97a608ba	! t0_kref+0x1164:   	fsubs	%f24, %f26, %f11
	.word	0xb9a01918	! t0_kref+0x1168:   	fitod	%f24, %f28
	.word	0xa40d7078	! t0_kref+0x116c:   	and	%l5, -0xf88, %l2
	.word	0xe3b8a040	! t0_kref+0x1170:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xea901019	! t0_kref+0x1174:   	lduha	[%g0 + %i1]0x80, %l5
	.word	0x80c2ab27	! t0_kref+0x1178:   	addccc	%o2, 0xb27, %g0
	.word	0x9ba0053e	! t0_kref+0x117c:   	fsqrts	%f30, %f13
	.word	0xdd1e001d	! t0_kref+0x1180:   	ldd	[%i0 + %i5], %f14
	.word	0xaf2dc014	! t0_kref+0x1184:   	sll	%l7, %l4, %l7
	.word	0xa2722b92	! t0_kref+0x1188:   	udiv	%o0, 0xb92, %l1
	.word	0x8d82e196	! t0_kref+0x118c:   	wr	%o3, 0x196, %fprs
	.word	0x95a0189d	! t0_kref+0x1190:   	fitos	%f29, %f10
	.word	0xa5400000	! t0_kref+0x1194:   	mov	%y, %l2
	.word	0xd47f0018	! t0_kref+0x1198:   	swap	[%i4 + %i0], %o2
	.word	0x8da9c046	! t0_kref+0x119c:   	fmovdu	%fcc0, %f6, %f6
	.word	0xae020009	! t0_kref+0x11a0:   	add	%o0, %o1, %l7
	.word	0x96c2a688	! t0_kref+0x11a4:   	addccc	%o2, 0x688, %o3
	.word	0xa1a6085a	! t0_kref+0x11a8:   	faddd	%f24, %f26, %f16
	.word	0xe11fbdc8	! t0_kref+0x11ac:   	ldd	[%fp - 0x238], %f16
	.word	0xe200a030	! t0_kref+0x11b0:   	ld	[%g2 + 0x30], %l1
	.word	0xf700a034	! t0_kref+0x11b4:   	ld	[%g2 + 0x34], %f27
	.word	0xcd1e0000	! t0_kref+0x11b8:   	ldd	[%i0], %f6
	.word	0x3e800005	! t0_kref+0x11bc:   	bvc,a	_kref+0x11d0
	.word	0x93a2083d	! t0_kref+0x11c0:   	fadds	%f8, %f29, %f9
	.word	0xed1fbd10	! t0_kref+0x11c4:   	ldd	[%fp - 0x2f0], %f22
	.word	0xeba01019	! t0_kref+0x11c8:   	sta	%f21, [%g0 + %i1]0x80
	.word	0x81aa4a3d	! t0_kref+0x11cc:   	fcmps	%fcc0, %f9, %f29
	call	SYM(t0_subr0)
	.word	0x80dac000	! t0_kref+0x11d4:   	smulcc	%o3, %g0, %g0
	.word	0xd80e601f	! t0_kref+0x11d8:   	ldub	[%i1 + 0x1f], %o4
	.word	0xa27d4009	! t0_kref+0x11dc:   	sdiv	%l5, %o1, %l1
	.word	0x92420015	! t0_kref+0x11e0:   	addc	%o0, %l5, %o1
	.word	0x001fffff	! t0_kref+0x11e4:   	illtrap	0x1fffff
	.word	0x91a00129	! t0_kref+0x11e8:   	fabss	%f9, %f8
	.word	0xad268008	! t0_kref+0x11ec:   	mulscc	%i2, %o0, %l6
	.word	0xa1a00050	! t0_kref+0x11f0:   	fmovd	%f16, %f16
	.word	0xd6ae101a	! t0_kref+0x11f4:   	stba	%o3, [%i0 + %i2]0x80
	.word	0x21480004	! t0_kref+0x11f8:   	fbn,a,pt	%fcc0, _kref+0x1208
	.word	0x921dc009	! t0_kref+0x11fc:   	xor	%l7, %o1, %o1
	.word	0x81ad8a39	! t0_kref+0x1200:   	fcmps	%fcc0, %f22, %f25
	.word	0xd93e4000	! t0_kref+0x1204:   	std	%f12, [%i1]
	.word	0xc008a00d	! t0_kref+0x1208:   	ldub	[%g2 + 0xd], %g0
	.word	0x20800004	! t0_kref+0x120c:   	bn,a	_kref+0x121c
	.word	0xe6070018	! t0_kref+0x1210:   	ld	[%i4 + %i0], %l3
	.word	0x36480007	! t0_kref+0x1214:   	bge,a,pt	%icc, _kref+0x1230
	.word	0x9fa508b1	! t0_kref+0x1218:   	fsubs	%f20, %f17, %f15
	.word	0x30800006	! t0_kref+0x121c:   	ba,a	_kref+0x1234
	.word	0xb1a0189d	! t0_kref+0x1220:   	fitos	%f29, %f24
	.word	0xd428a02b	! t0_kref+0x1224:   	stb	%o2, [%g2 + 0x2b]
	.word	0xada018de	! t0_kref+0x1228:   	fdtos	%f30, %f22
	.word	0x95a288b9	! t0_kref+0x122c:   	fsubs	%f10, %f25, %f10
	.word	0x32800001	! t0_kref+0x1230:   	bne,a	_kref+0x1234
	.word	0xe016c019	! t0_kref+0x1234:   	lduh	[%i3 + %i1], %l0
	call	SYM(t0_subr0)
	.word	0xd91e7fe0	! t0_kref+0x123c:   	ldd	[%i1 - 0x20], %f12
	.word	0xa4350014	! t0_kref+0x1240:   	orn	%l4, %l4, %l2
	.word	0x9da20852	! t0_kref+0x1244:   	faddd	%f8, %f18, %f14
	.word	0x993b4014	! t0_kref+0x1248:   	sra	%o5, %l4, %o4
	.word	0xf9be5000	! t0_kref+0x124c:   	stda	%f28, [%i1]0x80
	.word	0xd848a00b	! t0_kref+0x1250:   	ldsb	[%g2 + 0xb], %o4
	.word	0xa1a01a3e	! t0_kref+0x1254:   	fstoi	%f30, %f16
	.word	0xde06401c	! t0_kref+0x1258:   	ld	[%i1 + %i4], %o7
	.word	0xad3d6012	! t0_kref+0x125c:   	sra	%l5, 0x12, %l6
	.word	0xd09f5059	! t0_kref+0x1260:   	ldda	[%i5 + %i1]0x82, %o0
	.word	0x8610201f	! t0_kref+0x1264:   	mov	0x1f, %g3
	.word	0x86a0e001	! t0_kref+0x1268:   	subcc	%g3, 1, %g3
	.word	0x22800001	! t0_kref+0x126c:   	be,a	_kref+0x1270
	.word	0x81834000	! t0_kref+0x1270:   	wr	%o5, %g0, %y
	.word	0xd2560000	! t0_kref+0x1274:   	ldsh	[%i0], %o1
	.word	0xe9f6500d	! t0_kref+0x1278:   	casxa	[%i1]0x80, %o5, %l4
	.word	0x98750017	! t0_kref+0x127c:   	udiv	%l4, %l7, %o4
	.word	0x99a688c8	! t0_kref+0x1280:   	fsubd	%f26, %f8, %f12
	.word	0xa62a2a17	! t0_kref+0x1284:   	andn	%o0, 0xa17, %l3
	.word	0xe6d81018	! t0_kref+0x1288:   	ldxa	[%g0 + %i0]0x80, %l3
	.word	0x81da400e	! t0_kref+0x128c:   	flush	%o1 + %sp
	.word	0x942b782b	! t0_kref+0x1290:   	andn	%o5, -0x7d5, %o2
	.word	0xa8c3001a	! t0_kref+0x1294:   	addccc	%o4, %i2, %l4
	.word	0xa5254000	! t0_kref+0x1298:   	mulscc	%l5, %g0, %l2
	.word	0xada0191e	! t0_kref+0x129c:   	fitod	%f30, %f22
	.word	0xed064000	! t0_kref+0x12a0:   	ld	[%i1], %f22
	.word	0x9696800d	! t0_kref+0x12a4:   	orcc	%i2, %o5, %o3
	.word	0xa82b6d39	! t0_kref+0x12a8:   	andn	%o5, 0xd39, %l4
	.word	0xa0720008	! t0_kref+0x12ac:   	udiv	%o0, %o0, %l0
	.word	0x81ac8a31	! t0_kref+0x12b0:   	fcmps	%fcc0, %f18, %f17
	.word	0xaa9d0017	! t0_kref+0x12b4:   	xorcc	%l4, %l7, %l5
	call	1f
	.empty
	.word	0x965a4015	! t0_kref+0x12bc:   	smul	%o1, %l5, %o3
	.word	0xa6bd799f	! t0_kref+0x12c0:   	xnorcc	%l5, -0x661, %l3
	.word	0xd300a024	! t0_kref+0x12c4:   	ld	[%g2 + 0x24], %f9
	.word	0x20480004	! t0_kref+0x12c8:   	bn,a,pt	%icc, _kref+0x12d8
	.word	0xee4e6017	! t0_kref+0x12cc:   	ldsb	[%i1 + 0x17], %l7
	.word	0xaf400000	! t0_kref+0x12d0:   	mov	%y, %l7
	.word	0x992321e0	! t0_kref+0x12d4:   	mulscc	%o4, 0x1e0, %o4
1:	.word	0xd648a001	! t0_kref+0x12d8:   	ldsb	[%g2 + 1], %o3
	.word	0xa4bde6c2	! t0_kref+0x12dc:   	xnorcc	%l7, 0x6c2, %l2
	.word	0xc0760000	! t0_kref+0x12e0:   	stx	%g0, [%i0]
	.word	0xa1a01906	! t0_kref+0x12e4:   	fitod	%f6, %f16
	.word	0x90280009	! t0_kref+0x12e8:   	andn	%g0, %o1, %o0
	.word	0x2d800006	! t0_kref+0x12ec:   	fbg,a	_kref+0x1304
	.word	0xa0f30014	! t0_kref+0x12f0:   	udivcc	%o4, %l4, %l0
	.word	0x987a0008	! t0_kref+0x12f4:   	sdiv	%o0, %o0, %o4
	.word	0xada70854	! t0_kref+0x12f8:   	faddd	%f28, %f20, %f22
	.word	0xbda8805e	! t0_kref+0x12fc:   	fmovdlg	%fcc0, %f30, %f30
	.word	0x9b0e8017	! t0_kref+0x1300:   	tsubcc	%i2, %l7, %o5
	.word	0xb1a4c8ba	! t0_kref+0x1304:   	fsubs	%f19, %f26, %f24
	.word	0xe3b8a040	! t0_kref+0x1308:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xafa0052f	! t0_kref+0x130c:   	fsqrts	%f15, %f23
	.word	0x91a589c8	! t0_kref+0x1310:   	fdivd	%f22, %f8, %f8
	.word	0xb5a0004a	! t0_kref+0x1314:   	fmovd	%f10, %f26
	.word	0x34800001	! t0_kref+0x1318:   	bg,a	_kref+0x131c
	.word	0xda06200c	! t0_kref+0x131c:   	ld	[%i0 + 0xc], %o5
	.word	0xa5a3885c	! t0_kref+0x1320:   	faddd	%f14, %f28, %f18
	.word	0xae4227fd	! t0_kref+0x1324:   	addc	%o0, 0x7fd, %l7
	.word	0x9f414000	! t0_kref+0x1328:   	mov	%pc, %o7
	.word	0xb1a408ae	! t0_kref+0x132c:   	fsubs	%f16, %f14, %f24
	.word	0xe4c65000	! t0_kref+0x1330:   	ldswa	[%i1]0x80, %l2
	.word	0xd11e7ff8	! t0_kref+0x1334:   	ldd	[%i1 - 8], %f8
	.word	0xd4400019	! t0_kref+0x1338:   	ldsw	[%g0 + %i1], %o2
	.word	0xa4fb401a	! t0_kref+0x133c:   	sdivcc	%o5, %i2, %l2
	.word	0x9da0191a	! t0_kref+0x1340:   	fitod	%f26, %f14
	.word	0xd120a03c	! t0_kref+0x1344:   	st	%f8, [%g2 + 0x3c]
	.word	0xf91e6000	! t0_kref+0x1348:   	ldd	[%i1], %f28
	.word	0x9ec5000d	! t0_kref+0x134c:   	addccc	%l4, %o5, %o7
	.word	0xa825720a	! t0_kref+0x1350:   	sub	%l5, -0xdf6, %l4
	.word	0xaa85800c	! t0_kref+0x1354:   	addcc	%l6, %o4, %l5
	.word	0x271a458a	! t0_kref+0x1358:   	sethi	%hi(0x69162800), %l3
	.word	0xd9067fe8	! t0_kref+0x135c:   	ld	[%i1 - 0x18], %f12
	.word	0xe11fbc80	! t0_kref+0x1360:   	ldd	[%fp - 0x380], %f16
	.word	0xd428a001	! t0_kref+0x1364:   	stb	%o2, [%g2 + 1]
	.word	0xe0ee9019	! t0_kref+0x1368:   	ldstuba	[%i2 + %i1]0x80, %l0
	.word	0x81aa4a2a	! t0_kref+0x136c:   	fcmps	%fcc0, %f9, %f10
	.word	0xe968a048	! t0_kref+0x1370:   	prefetch	%g2 + 0x48, 20
	.word	0x9efa0008	! t0_kref+0x1374:   	sdivcc	%o0, %o0, %o7
	.word	0xe400a020	! t0_kref+0x1378:   	ld	[%g2 + 0x20], %l2
	.word	0xe3b8a040	! t0_kref+0x137c:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xa0dae093	! t0_kref+0x1380:   	smulcc	%o3, 0x93, %l0
	.word	0xee871018	! t0_kref+0x1384:   	lda	[%i4 + %i0]0x80, %l7
	.word	0x99a01909	! t0_kref+0x1388:   	fitod	%f9, %f12
	.word	0xe8871019	! t0_kref+0x138c:   	lda	[%i4 + %i1]0x80, %l4
	.word	0x801d3837	! t0_kref+0x1390:   	xor	%l4, -0x7c9, %g0
	.word	0x8da3094e	! t0_kref+0x1394:   	fmuld	%f12, %f14, %f6
	.word	0xe810a00a	! t0_kref+0x1398:   	lduh	[%g2 + 0xa], %l4
	.word	0xc016401b	! t0_kref+0x139c:   	lduh	[%i1 + %i3], %g0
	call	1f
	.empty
	.word	0xd04e401a	! t0_kref+0x13a4:   	ldsb	[%i1 + %i2], %o0
	.word	0xa5a38952	! t0_kref+0x13a8:   	fmuld	%f14, %f18, %f18
1:	.word	0x30480002	! t0_kref+0x13ac:   	ba,a,pt	%icc, _kref+0x13b4
	.word	0xa013000c	! t0_kref+0x13b0:   	or	%o4, %o4, %l0
	.word	0x925db484	! t0_kref+0x13b4:   	smul	%l6, -0xb7c, %o1
	.word	0x8143e040	! t0_kref+0x13b8:   	membar	0x40
	.word	0xe4566012	! t0_kref+0x13bc:   	ldsh	[%i1 + 0x12], %l2
	.word	0x96de8017	! t0_kref+0x13c0:   	smulcc	%i2, %l7, %o3
	.word	0x81580000	! t0_kref+0x13c4:   	flushw
	.word	0x9de3bfa0	! t0_kref+0x13c8:   	save	%sp, -0x60, %sp
	.word	0xb01668bc	! t0_kref+0x13cc:   	or	%i1, 0x8bc, %i0
	.word	0xa3ee631c	! t0_kref+0x13d0:   	restore	%i1, 0x31c, %l1
	.word	0x9fc00004	! t0_kref+0x13d4:   	call	%g0 + %g4
	.word	0xb3a0053b	! t0_kref+0x13d8:   	fsqrts	%f27, %f25
	.word	0xae700017	! t0_kref+0x13dc:   	udiv	%g0, %l7, %l7
	.word	0x9ac5229a	! t0_kref+0x13e0:   	addccc	%l4, 0x29a, %o5
	.word	0xfd1f4019	! t0_kref+0x13e4:   	ldd	[%i5 + %i1], %f30
	.word	0xac2d800c	! t0_kref+0x13e8:   	andn	%l6, %o4, %l6
	.word	0xaba00527	! t0_kref+0x13ec:   	fsqrts	%f7, %f21
	.word	0xc168a084	! t0_kref+0x13f0:   	prefetch	%g2 + 0x84, 0
	.word	0xad33601e	! t0_kref+0x13f4:   	srl	%o5, 0x1e, %l6
	.word	0xe11e7ff8	! t0_kref+0x13f8:   	ldd	[%i1 - 8], %f16
	.word	0xdbf61015	! t0_kref+0x13fc:   	casxa	[%i0]0x80, %l5, %o5
	.word	0x86102017	! t0_kref+0x1400:   	mov	0x17, %g3
	.word	0x86a0e001	! t0_kref+0x1404:   	subcc	%g3, 1, %g3
	.word	0x22800020	! t0_kref+0x1408:   	be,a	_kref+0x1488
	.word	0xa07a4009	! t0_kref+0x140c:   	sdiv	%o1, %o1, %l0
	.word	0x8143e023	! t0_kref+0x1410:   	membar	0x23
	.word	0x95a018d2	! t0_kref+0x1414:   	fdtos	%f18, %f10
	.word	0x9ba01888	! t0_kref+0x1418:   	fitos	%f8, %f13
	.word	0x94c5eee9	! t0_kref+0x141c:   	addccc	%l7, 0xee9, %o2
	.word	0x9efdc009	! t0_kref+0x1420:   	sdivcc	%l7, %o1, %o7
	.word	0xa2ddc009	! t0_kref+0x1424:   	smulcc	%l7, %o1, %l1
	.word	0xa1a6c8a8	! t0_kref+0x1428:   	fsubs	%f27, %f8, %f16
	.word	0xaadd8017	! t0_kref+0x142c:   	smulcc	%l6, %l7, %l5
	.word	0x9afb0000	! t0_kref+0x1430:   	sdivcc	%o4, %g0, %o5
	.word	0xa9a01a35	! t0_kref+0x1434:   	fstoi	%f21, %f20
	.word	0x91a0052c	! t0_kref+0x1438:   	fsqrts	%f12, %f8
	.word	0x98ba6468	! t0_kref+0x143c:   	xnorcc	%o1, 0x468, %o4
	.word	0x9da688ce	! t0_kref+0x1440:   	fsubd	%f26, %f14, %f14
	.word	0xc807bfe8	! t0_kref+0x1444:   	ld	[%fp - 0x18], %g4
	.word	0xd100a038	! t0_kref+0x1448:   	ld	[%g2 + 0x38], %f8
	.word	0xac45c00b	! t0_kref+0x144c:   	addc	%l7, %o3, %l6
	.word	0xa9a38850	! t0_kref+0x1450:   	faddd	%f14, %f16, %f20
	.word	0x9876ac30	! t0_kref+0x1454:   	udiv	%i2, 0xc30, %o4
	.word	0x9126bbdd	! t0_kref+0x1458:   	mulscc	%i2, -0x423, %o0
	.word	0xe2000018	! t0_kref+0x145c:   	ld	[%g0 + %i0], %l1
	.word	0xa125e91c	! t0_kref+0x1460:   	mulscc	%l7, 0x91c, %l0
	.word	0x26800001	! t0_kref+0x1464:   	bl,a	_kref+0x1468
	.word	0x961d0009	! t0_kref+0x1468:   	xor	%l4, %o1, %o3
	.word	0xad3e801a	! t0_kref+0x146c:   	sra	%i2, %i2, %l6
	.word	0xec7e7fec	! t0_kref+0x1470:   	swap	[%i1 - 0x14], %l6
	.word	0xa3a018dc	! t0_kref+0x1474:   	fdtos	%f28, %f17
	.word	0x95a01907	! t0_kref+0x1478:   	fitod	%f7, %f10
	.word	0xbda68850	! t0_kref+0x147c:   	faddd	%f26, %f16, %f30
	.word	0x961a7629	! t0_kref+0x1480:   	xor	%o1, -0x9d7, %o3
	.word	0x3d480008	! t0_kref+0x1484:   	fbule,a,pt	%fcc0, _kref+0x14a4
	.word	0x8da01894	! t0_kref+0x1488:   	fitos	%f20, %f6
	.word	0xe81e0000	! t0_kref+0x148c:   	ldd	[%i0], %l4
	.word	0x91a01a28	! t0_kref+0x1490:   	fstoi	%f8, %f8
	call	SYM(t0_subr0)
	.word	0x81dc800e	! t0_kref+0x1498:   	flush	%l2 + %sp
	.word	0xe4c81018	! t0_kref+0x149c:   	ldsba	[%g0 + %i0]0x80, %l2
	.word	0x8da408be	! t0_kref+0x14a0:   	fsubs	%f16, %f30, %f6
	.word	0x81ad8ad8	! t0_kref+0x14a4:   	fcmped	%fcc0, %f22, %f24
	.word	0x96fab748	! t0_kref+0x14a8:   	sdivcc	%o2, -0x8b8, %o3
	.word	0x21174cb4	! t0_kref+0x14ac:   	sethi	%hi(0x5d32d000), %l0
	.word	0xee801018	! t0_kref+0x14b0:   	lda	[%g0 + %i0]0x80, %l7
	.word	0xe91fbf78	! t0_kref+0x14b4:   	ldd	[%fp - 0x88], %f20
	.word	0x32800005	! t0_kref+0x14b8:   	bne,a	_kref+0x14cc
	.word	0x8143c000	! t0_kref+0x14bc:   	stbar
	.word	0xa7a00529	! t0_kref+0x14c0:   	fsqrts	%f9, %f19
	.word	0x37800005	! t0_kref+0x14c4:   	fbge,a	_kref+0x14d8
	.word	0xafa00136	! t0_kref+0x14c8:   	fabss	%f22, %f23
	.word	0x33800004	! t0_kref+0x14cc:   	fbe,a	_kref+0x14dc
	.word	0xd030a02e	! t0_kref+0x14d0:   	sth	%o0, [%g2 + 0x2e]
	.word	0xee30a000	! t0_kref+0x14d4:   	sth	%l7, [%g2]
	.word	0x912ae00c	! t0_kref+0x14d8:   	sll	%o3, 0xc, %o0
	.word	0xaebb32a3	! t0_kref+0x14dc:   	xnorcc	%o4, -0xd5d, %l7
	.word	0xa1a000aa	! t0_kref+0x14e0:   	fnegs	%f10, %f16
	.word	0x81824000	! t0_kref+0x14e4:   	wr	%o1, %g0, %y
	.word	0xb1a00136	! t0_kref+0x14e8:   	fabss	%f22, %f24
	.word	0x9fc10000	! t0_kref+0x14ec:   	call	%g4
	.word	0x9912c017	! t0_kref+0x14f0:   	taddcctv	%o3, %l7, %o4
	.word	0xf9bf1a59	! t0_kref+0x14f4:   	stda	%f28, [%i4 + %i1]0xd2
	.word	0xde48a02a	! t0_kref+0x14f8:   	ldsb	[%g2 + 0x2a], %o7
	.word	0x96434000	! t0_kref+0x14fc:   	addc	%o5, %g0, %o3
	.word	0x933e8000	! t0_kref+0x1500:   	sra	%i2, %g0, %o1
	.word	0xeb20a014	! t0_kref+0x1504:   	st	%f21, [%g2 + 0x14]
	.word	0xec066008	! t0_kref+0x1508:   	ld	[%i1 + 8], %l6
	.word	0xea28a026	! t0_kref+0x150c:   	stb	%l5, [%g2 + 0x26]
	.word	0x9eda602b	! t0_kref+0x1510:   	smulcc	%o1, 0x2b, %o7
	.word	0xa8fafddb	! t0_kref+0x1514:   	sdivcc	%o3, -0x225, %l4
	.word	0xa5a01052	! t0_kref+0x1518:   	fdtox	%f18, %f18
	.word	0xd808a027	! t0_kref+0x151c:   	ldub	[%g2 + 0x27], %o4
	.word	0xfd3e6000	! t0_kref+0x1520:   	std	%f30, [%i1]
	.word	0x2b480001	! t0_kref+0x1524:   	fbug,a,pt	%fcc0, _kref+0x1528
	.word	0xaa052a49	! t0_kref+0x1528:   	add	%l4, 0xa49, %l5
	.word	0xe9be184d	! t0_kref+0x152c:   	stda	%f20, [%i0 + %o5]0xc2
	.word	0x86102018	! t0_kref+0x1530:   	mov	0x18, %g3
	.word	0x86a0e001	! t0_kref+0x1534:   	subcc	%g3, 1, %g3
	.word	0x22800015	! t0_kref+0x1538:   	be,a	_kref+0x158c
	.word	0xda50a026	! t0_kref+0x153c:   	ldsh	[%g2 + 0x26], %o5
	.word	0x354ffffd	! t0_kref+0x1540:   	fbue,a,pt	%fcc0, _kref+0x1534
	.word	0xe6566010	! t0_kref+0x1544:   	ldsh	[%i1 + 0x10], %l3
	.word	0x81de70f0	! t0_kref+0x1548:   	flush	%i1 - 0xf10
	.word	0xd608a034	! t0_kref+0x154c:   	ldub	[%g2 + 0x34], %o3
	.word	0xe2562010	! t0_kref+0x1550:   	ldsh	[%i0 + 0x10], %l1
	.word	0x39480006	! t0_kref+0x1554:   	fbuge,a,pt	%fcc0, _kref+0x156c
	.word	0x1534ecf5	! t0_kref+0x1558:   	sethi	%hi(0xd3b3d400), %o2
	.word	0xe67e001c	! t0_kref+0x155c:   	swap	[%i0 + %i4], %l3
	.word	0xc0500018	! t0_kref+0x1560:   	ldsh	[%g0 + %i0], %g0
	.word	0xd9380018	! t0_kref+0x1564:   	std	%f12, [%g0 + %i0]
	.word	0x34bffff3	! t0_kref+0x1568:   	bg,a	_kref+0x1534
	.word	0xd8a81019	! t0_kref+0x156c:   	stba	%o4, [%g0 + %i1]0x80
	.word	0xe048a02a	! t0_kref+0x1570:   	ldsb	[%g2 + 0x2a], %l0
	.word	0xa1a018d8	! t0_kref+0x1574:   	fdtos	%f24, %f16
	.word	0x942dc016	! t0_kref+0x1578:   	andn	%l7, %l6, %o2
	.word	0xb9a708d8	! t0_kref+0x157c:   	fsubd	%f28, %f24, %f28
	.word	0xd4366000	! t0_kref+0x1580:   	sth	%o2, [%i1]
	.word	0x38bfffec	! t0_kref+0x1584:   	bgu,a	_kref+0x1534
	.word	0xe89e1000	! t0_kref+0x1588:   	ldda	[%i0]0x80, %l4
	.word	0xa402e161	! t0_kref+0x158c:   	add	%o3, 0x161, %l2
	.word	0xfb00a028	! t0_kref+0x1590:   	ld	[%g2 + 0x28], %f29
	.word	0x9da00530	! t0_kref+0x1594:   	fsqrts	%f16, %f14
	.word	0x2519f586	! t0_kref+0x1598:   	sethi	%hi(0x67d61800), %l2
	.word	0x9fc10000	! t0_kref+0x159c:   	call	%g4
	.word	0xaefd3ad2	! t0_kref+0x15a0:   	sdivcc	%l4, -0x52e, %l7
	.word	0xbda408a9	! t0_kref+0x15a4:   	fsubs	%f16, %f9, %f30
	.word	0x9de3bfa0	! t0_kref+0x15a8:   	save	%sp, -0x60, %sp
	.word	0xbad66bd8	! t0_kref+0x15ac:   	umulcc	%i1, 0xbd8, %i5
	.word	0xa9ef0000	! t0_kref+0x15b0:   	restore	%i4, %g0, %l4
	.word	0x81aa0ab2	! t0_kref+0x15b4:   	fcmpes	%fcc0, %f8, %f18
	.word	0xea28a023	! t0_kref+0x15b8:   	stb	%l5, [%g2 + 0x23]
	.word	0xd4ee9018	! t0_kref+0x15bc:   	ldstuba	[%i2 + %i0]0x80, %o2
	.word	0xe91e6000	! t0_kref+0x15c0:   	ldd	[%i1], %f20
	.word	0xd0a01018	! t0_kref+0x15c4:   	sta	%o0, [%g0 + %i0]0x80
	.word	0x9845ac3a	! t0_kref+0x15c8:   	addc	%l6, 0xc3a, %o4
	.word	0xb9a6885a	! t0_kref+0x15cc:   	faddd	%f26, %f26, %f28
	.word	0xe3b8a080	! t0_kref+0x15d0:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xe3b8a080	! t0_kref+0x15d4:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x8143e040	! t0_kref+0x15d8:   	membar	0x40
	.word	0xf420a030	! t0_kref+0x15dc:   	st	%i2, [%g2 + 0x30]
	.word	0xc99e1a1a	! t0_kref+0x15e0:   	ldda	[%i0 + %i2]0xd0, %f4
	.word	0x9540c000	! t0_kref+0x15e4:   	mov	%asi, %o2
	.word	0xf007bfe0	! t0_kref+0x15e8:   	ld	[%fp - 0x20], %i0
	.word	0x8182c000	! t0_kref+0x15ec:   	wr	%o3, %g0, %y
	.word	0x2f309c85	! t0_kref+0x15f0:   	sethi	%hi(0xc2721400), %l7
	.word	0xf1be1896	! t0_kref+0x15f4:   	stda	%f24, [%i0 + %l6]0xc4
	.word	0x92158008	! t0_kref+0x15f8:   	or	%l6, %o0, %o1
	.word	0xa4bd0000	! t0_kref+0x15fc:   	xnorcc	%l4, %g0, %l2
	.word	0xa9a1cd3e	! t0_kref+0x1600:   	fsmuld	%f7, %f30, %f20
	.word	0xa7a01a5c	! t0_kref+0x1604:   	fdtoi	%f28, %f19
	.word	0xda267fe0	! t0_kref+0x1608:   	st	%o5, [%i1 - 0x20]
	.word	0xd19e1a1b	! t0_kref+0x160c:   	ldda	[%i0 + %i3]0xd0, %f8
	.word	0xc9bf5a58	! t0_kref+0x1610:   	stda	%f4, [%i5 + %i0]0xd2
	.word	0xbda409d4	! t0_kref+0x1614:   	fdivd	%f16, %f20, %f30
	.word	0xa9a01a2e	! t0_kref+0x1618:   	fstoi	%f14, %f20
	.word	0x81dd6a39	! t0_kref+0x161c:   	flush	%l5 + 0xa39
	.word	0xada348be	! t0_kref+0x1620:   	fsubs	%f13, %f30, %f22
	.word	0x26800006	! t0_kref+0x1624:   	bl,a	_kref+0x163c
	.word	0xa52a6005	! t0_kref+0x1628:   	sll	%o1, 0x5, %l2
	.word	0xcd3e2010	! t0_kref+0x162c:   	std	%f6, [%i0 + 0x10]
	.word	0xc0263ff8	! t0_kref+0x1630:   	clr	[%i0 - 8]
	.word	0x81a98ad8	! t0_kref+0x1634:   	fcmped	%fcc0, %f6, %f24
	.word	0xd640a014	! t0_kref+0x1638:   	ldsw	[%g2 + 0x14], %o3
	.word	0xa6f6ae7a	! t0_kref+0x163c:   	udivcc	%i2, 0xe7a, %l3
	.word	0xe5263fec	! t0_kref+0x1640:   	st	%f18, [%i0 - 0x14]
	.word	0xaba00028	! t0_kref+0x1644:   	fmovs	%f8, %f21
	.word	0x9de3bfa0	! t0_kref+0x1648:   	save	%sp, -0x60, %sp
	.word	0xb81e4000	! t0_kref+0x164c:   	xor	%i1, %g0, %i4
	.word	0x99e82b81	! t0_kref+0x1650:   	restore	%g0, 0xb81, %o4
	.word	0x808b0016	! t0_kref+0x1654:   	btst	%l6, %o4
	.word	0x35800007	! t0_kref+0x1658:   	fbue,a	_kref+0x1674
	.word	0xa9400000	! t0_kref+0x165c:   	mov	%y, %l4
	.word	0xd408a012	! t0_kref+0x1660:   	ldub	[%g2 + 0x12], %o2
	.word	0x9fc10000	! t0_kref+0x1664:   	call	%g4
	.word	0xab0522e5	! t0_kref+0x1668:   	taddcc	%l4, 0x2e5, %l5
	.word	0xb9a18d2d	! t0_kref+0x166c:   	fsmuld	%f6, %f13, %f28
	.word	0xf320a004	! t0_kref+0x1670:   	st	%f25, [%g2 + 4]
	.word	0x923a8000	! t0_kref+0x1674:   	not	%o2, %o1
	.word	0xb3a0052e	! t0_kref+0x1678:   	fsqrts	%f14, %f25
	.word	0x86102007	! t0_kref+0x167c:   	mov	0x7, %g3
	.word	0x86a0e001	! t0_kref+0x1680:   	subcc	%g3, 1, %g3
	.word	0x2280000f	! t0_kref+0x1684:   	be,a	_kref+0x16c0
	.word	0x96356e2d	! t0_kref+0x1688:   	orn	%l5, 0xe2d, %o3
	.word	0xa2fd8008	! t0_kref+0x168c:   	sdivcc	%l6, %o0, %l1
	.word	0xa9a01036	! t0_kref+0x1690:   	fstox	%f22, %f20
	.word	0xf4a6501c	! t0_kref+0x1694:   	sta	%i2, [%i1 + %i4]0x80
	.word	0xc128001c	! t0_kref+0x1698:   	st	%fsr, [%g0 + %i4]
	.word	0xa013000a	! t0_kref+0x169c:   	or	%o4, %o2, %l0
	.word	0xb1a018de	! t0_kref+0x16a0:   	fdtos	%f30, %f24
	.word	0x9fc10000	! t0_kref+0x16a4:   	call	%g4
	.word	0x1b24a62a	! t0_kref+0x16a8:   	sethi	%hi(0x9298a800), %o5
	.word	0xa5a0111c	! t0_kref+0x16ac:   	fxtod	%f28, %f18
	.word	0x2d4ffff4	! t0_kref+0x16b0:   	fbg,a,pt	%fcc0, _kref+0x1680
	.word	0x95a2093b	! t0_kref+0x16b4:   	fmuls	%f8, %f27, %f10
	.word	0xc168a089	! t0_kref+0x16b8:   	prefetch	%g2 + 0x89, 0
	.word	0x3ebffff1	! t0_kref+0x16bc:   	bvc,a	_kref+0x1680
	.word	0x9e0def80	! t0_kref+0x16c0:   	and	%l7, 0xf80, %o7
	.word	0xe608a003	! t0_kref+0x16c4:   	ldub	[%g2 + 3], %l3
	.word	0xd27e0000	! t0_kref+0x16c8:   	swap	[%i0], %o1
	.word	0xe11fbf00	! t0_kref+0x16cc:   	ldd	[%fp - 0x100], %f16
	.word	0x9a7332f7	! t0_kref+0x16d0:   	udiv	%o4, -0xd09, %o5
	.word	0x9b356012	! t0_kref+0x16d4:   	srl	%l5, 0x12, %o5
	.word	0xb3a608aa	! t0_kref+0x16d8:   	fsubs	%f24, %f10, %f25
	.word	0xbba48836	! t0_kref+0x16dc:   	fadds	%f18, %f22, %f29
	.word	0xec30a000	! t0_kref+0x16e0:   	sth	%l6, [%g2]
	.word	0xe616c019	! t0_kref+0x16e4:   	lduh	[%i3 + %i1], %l3
	.word	0x81db4015	! t0_kref+0x16e8:   	flush	%o5 + %l5
	.word	0x96ba2cb7	! t0_kref+0x16ec:   	xnorcc	%o0, 0xcb7, %o3
	.word	0xd82e001a	! t0_kref+0x16f0:   	stb	%o4, [%i0 + %i2]
	.word	0xa5a3cd2b	! t0_kref+0x16f4:   	fsmuld	%f15, %f11, %f18
	.word	0xaa8567ea	! t0_kref+0x16f8:   	addcc	%l5, 0x7ea, %l5
	.word	0x2e800005	! t0_kref+0x16fc:   	bvs,a	_kref+0x1710
	.word	0xae1ac016	! t0_kref+0x1700:   	xor	%o3, %l6, %l7
	.word	0x3d480006	! t0_kref+0x1704:   	fbule,a,pt	%fcc0, _kref+0x171c
	.word	0xe3b8a040	! t0_kref+0x1708:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x972d801a	! t0_kref+0x170c:   	sll	%l6, %i2, %o3
	.word	0x81ad8a5a	! t0_kref+0x1710:   	fcmpd	%fcc0, %f22, %f26
	.word	0xbba018d8	! t0_kref+0x1714:   	fdtos	%f24, %f29
	.word	0xe5981019	! t0_kref+0x1718:   	ldda	[%g0 + %i1]0x80, %f18
	.word	0xada018dc	! t0_kref+0x171c:   	fdtos	%f28, %f22
	.word	0xa8f2edc8	! t0_kref+0x1720:   	udivcc	%o3, 0xdc8, %l4
	.word	0xae7d2aa6	! t0_kref+0x1724:   	sdiv	%l4, 0xaa6, %l7
	.word	0xd6364000	! t0_kref+0x1728:   	sth	%o3, [%i1]
	.word	0x9fc10000	! t0_kref+0x172c:   	call	%g4
	.word	0xef68a084	! t0_kref+0x1730:   	prefetch	%g2 + 0x84, 23
	.word	0xa2aa400a	! t0_kref+0x1734:   	andncc	%o1, %o2, %l1
	.word	0xe640a018	! t0_kref+0x1738:   	ldsw	[%g2 + 0x18], %l3
	.word	0x9fa01a28	! t0_kref+0x173c:   	fstoi	%f8, %f15
	.word	0x8143c000	! t0_kref+0x1740:   	stbar
	.word	0x83414000	! t0_kref+0x1744:   	mov	%pc, %g1
	.word	0x9fc10000	! t0_kref+0x1748:   	call	%g4
	.word	0x8da6c9a9	! t0_kref+0x174c:   	fdivs	%f27, %f9, %f6
	.word	0xbda18852	! t0_kref+0x1750:   	faddd	%f6, %f18, %f30
	.word	0x9e46bfec	! t0_kref+0x1754:   	addc	%i2, -0x14, %o7
	.word	0x8da5cd37	! t0_kref+0x1758:   	fsmuld	%f23, %f23, %f6
	.word	0xae1de9fb	! t0_kref+0x175c:   	xor	%l7, 0x9fb, %l7
	.word	0xbda248b6	! t0_kref+0x1760:   	fsubs	%f9, %f22, %f30
	.word	0xaa3b000d	! t0_kref+0x1764:   	xnor	%o4, %o5, %l5
	.word	0xe4086064	! t0_kref+0x1768:   	ldub	[%g1 + 0x64], %l2
	.word	0xa41ca00c	! t0_kref+0x176c:   	xor	%l2, 0xc, %l2
	.word	0xe4286064	! t0_kref+0x1770:   	stb	%l2, [%g1 + 0x64]
	.word	0x81d86064	! t0_kref+0x1774:   	flush	%g1 + 0x64
	.word	0x9a82c00a	! t0_kref+0x1778:   	addcc	%o3, %o2, %o5
	.word	0xaba01a3e	! t0_kref+0x177c:   	fstoi	%f30, %f21
	.word	0xe11e2008	! t0_kref+0x1780:   	ldd	[%i0 + 8], %f16
	.word	0xaec5000a	! t0_kref+0x1784:   	addccc	%l4, %o2, %l7
	.word	0x81580000	! t0_kref+0x1788:   	flushw
	.word	0xaf65000d	! t0_kref+0x178c:   	movleu	%icc, %o5, %l7
	.word	0xafa018c6	! t0_kref+0x1790:   	fdtos	%f6, %f23
	.word	0xf300a01c	! t0_kref+0x1794:   	ld	[%g2 + 0x1c], %f25
	.word	0xae2b6980	! t0_kref+0x1798:   	andn	%o5, 0x980, %l7
	.word	0x902e8009	! t0_kref+0x179c:   	andn	%i2, %o1, %o0
	.word	0xc12e3ffc	! t0_kref+0x17a0:   	st	%fsr, [%i0 - 4]
	.word	0xb7a00539	! t0_kref+0x17a4:   	fsqrts	%f25, %f27
2:	.word	0x9b3a0017	! t0_kref+0x17a8:   	sra	%o0, %l7, %o5
	.word	0x97a01a3a	! t0_kref+0x17ac:   	fstoi	%f26, %f11
	.word	0xd808a028	! t0_kref+0x17b0:   	ldub	[%g2 + 0x28], %o4
	.word	0xb9a40956	! t0_kref+0x17b4:   	fmuld	%f16, %f22, %f28
	sethi	%hi(2f), %o7
	.word	0xe40be3f0	! t0_kref+0x17bc:   	ldub	[%o7 + 0x3f0], %l2
	.word	0xa41ca00c	! t0_kref+0x17c0:   	xor	%l2, 0xc, %l2
	.word	0xe42be3f0	! t0_kref+0x17c4:   	stb	%l2, [%o7 + 0x3f0]
	.word	0x81dbe3f0	! t0_kref+0x17c8:   	flush	%o7 + 0x3f0
	.word	0xa7a308b2	! t0_kref+0x17cc:   	fsubs	%f12, %f18, %f19
	.word	0x94424017	! t0_kref+0x17d0:   	addc	%o1, %l7, %o2
	.word	0xa3a0188a	! t0_kref+0x17d4:   	fitos	%f10, %f17
	.word	0xda080019	! t0_kref+0x17d8:   	ldub	[%g0 + %i1], %o5
	.word	0xad3a200e	! t0_kref+0x17dc:   	sra	%o0, 0xe, %l6
	.word	0x81580000	! t0_kref+0x17e0:   	flushw
	.word	0x9f2a200a	! t0_kref+0x17e4:   	sll	%o0, 0xa, %o7
	.word	0x81aa0a27	! t0_kref+0x17e8:   	fcmps	%fcc0, %f8, %f7
	.word	0xe3b8a040	! t0_kref+0x17ec:   	stda	%f48, [%g2 + 0x40]%asi
2:	.word	0xd608a01b	! t0_kref+0x17f0:   	ldub	[%g2 + 0x1b], %o3
	.word	0xe200a020	! t0_kref+0x17f4:   	ld	[%g2 + 0x20], %l1
	.word	0xf51e2018	! t0_kref+0x17f8:   	ldd	[%i0 + 0x18], %f26
	.word	0x9de3bfa0	! t0_kref+0x17fc:   	save	%sp, -0x60, %sp
	.word	0x81eee9fa	! t0_kref+0x1800:   	restore	%i3, 0x9fa, %g0
	.word	0x30800001	! t0_kref+0x1804:   	ba,a	_kref+0x1808
	.word	0xa2fd800b	! t0_kref+0x1808:   	sdivcc	%l6, %o3, %l1
	.word	0x93a00533	! t0_kref+0x180c:   	fsqrts	%f19, %f9
	.word	0x94bd000b	! t0_kref+0x1810:   	xnorcc	%l4, %o3, %o2
	.word	0x8143e04e	! t0_kref+0x1814:   	membar	0x4e
	.word	0xa03a3cce	! t0_kref+0x1818:   	xnor	%o0, -0x332, %l0
	.word	0xafa208bc	! t0_kref+0x181c:   	fsubs	%f8, %f28, %f23
	.word	0x91a48d30	! t0_kref+0x1820:   	fsmuld	%f18, %f16, %f8
	.word	0x81830000	! t0_kref+0x1824:   	wr	%o4, %g0, %y
	.word	0xe7ee501c	! t0_kref+0x1828:   	prefetcha	%i1 + %i4, 19
	.word	0x39480004	! t0_kref+0x182c:   	fbuge,a,pt	%fcc0, _kref+0x183c
	.word	0xb3a01a39	! t0_kref+0x1830:   	fstoi	%f25, %f25
	.word	0xde56200e	! t0_kref+0x1834:   	ldsh	[%i0 + 0xe], %o7
	.word	0x9fc10000	! t0_kref+0x1838:   	call	%g4
	.word	0xbda01a32	! t0_kref+0x183c:   	fstoi	%f18, %f30
	.word	0x99ab4046	! t0_kref+0x1840:   	fmovdle	%fcc0, %f6, %f12
	.word	0x92ba8009	! t0_kref+0x1844:   	xnorcc	%o2, %o1, %o1
	.word	0xd8ae1000	! t0_kref+0x1848:   	stba	%o4, [%i0]0x80
	.word	0x92dac00c	! t0_kref+0x184c:   	smulcc	%o3, %o4, %o1
	.word	0xda48a025	! t0_kref+0x1850:   	ldsb	[%g2 + 0x25], %o5
	.word	0xd09e5000	! t0_kref+0x1854:   	ldda	[%i1]0x80, %o0
	.word	0x9de3bfa0	! t0_kref+0x1858:   	save	%sp, -0x60, %sp
	.word	0xa5ef24d1	! t0_kref+0x185c:   	restore	%i4, 0x4d1, %l2
	.word	0xe448a02a	! t0_kref+0x1860:   	ldsb	[%g2 + 0x2a], %l2
	.word	0xee4e600c	! t0_kref+0x1864:   	ldsb	[%i1 + 0xc], %l7
	.word	0xe8363ff8	! t0_kref+0x1868:   	sth	%l4, [%i0 - 8]
	.word	0xd4a6101c	! t0_kref+0x186c:   	sta	%o2, [%i0 + %i4]0x80
	.word	0x9de3bfa0	! t0_kref+0x1870:   	save	%sp, -0x60, %sp
	.word	0x97e82074	! t0_kref+0x1874:   	restore	%g0, 0x74, %o3
	.word	0x9afb400d	! t0_kref+0x1878:   	sdivcc	%o5, %o5, %o5
	.word	0xb7a018d0	! t0_kref+0x187c:   	fdtos	%f16, %f27
	.word	0xac1a8014	! t0_kref+0x1880:   	xor	%o2, %l4, %l6
	.word	0x83414000	! t0_kref+0x1884:   	mov	%pc, %g1
	.word	0xd5063fe4	! t0_kref+0x1888:   	ld	[%i0 - 0x1c], %f10
	.word	0x94f30014	! t0_kref+0x188c:   	udivcc	%o4, %l4, %o2
	.word	0xdb064000	! t0_kref+0x1890:   	ld	[%i1], %f13
	.word	0xa5a01910	! t0_kref+0x1894:   	fitod	%f16, %f18
	.word	0xb5a01a28	! t0_kref+0x1898:   	fstoi	%f8, %f26
	.word	0x31480005	! t0_kref+0x189c:   	fba,a,pt	%fcc0, _kref+0x18b0
	.word	0xc048a02d	! t0_kref+0x18a0:   	ldsb	[%g2 + 0x2d], %g0
	.word	0xfd1fbdd8	! t0_kref+0x18a4:   	ldd	[%fp - 0x228], %f30
	.word	0x26800005	! t0_kref+0x18a8:   	bl,a	_kref+0x18bc
	.word	0x96002537	! t0_kref+0x18ac:   	add	%g0, 0x537, %o3
	.word	0xc0766000	! t0_kref+0x18b0:   	stx	%g0, [%i1]
	.word	0xb7a00532	! t0_kref+0x18b4:   	fsqrts	%f18, %f27
	.word	0xe168a089	! t0_kref+0x18b8:   	prefetch	%g2 + 0x89, 16
	.word	0xa8e5edab	! t0_kref+0x18bc:   	subccc	%l7, 0xdab, %l4
	.word	0x9fc10000	! t0_kref+0x18c0:   	call	%g4
	.word	0xe00e001a	! t0_kref+0x18c4:   	ldub	[%i0 + %i2], %l0
	.word	0xe168a080	! t0_kref+0x18c8:   	prefetch	%g2 + 0x80, 16
	.word	0x81ad8adc	! t0_kref+0x18cc:   	fcmped	%fcc0, %f22, %f28
	.word	0xd4801018	! t0_kref+0x18d0:   	lda	[%g0 + %i0]0x80, %o2
	.word	0xdf00a03c	! t0_kref+0x18d4:   	ld	[%g2 + 0x3c], %f15
	.word	0xd11fbc40	! t0_kref+0x18d8:   	ldd	[%fp - 0x3c0], %f8
	.word	0x95a00539	! t0_kref+0x18dc:   	fsqrts	%f25, %f10
	.word	0x96458008	! t0_kref+0x18e0:   	addc	%l6, %o0, %o3
	.word	0x8082bf89	! t0_kref+0x18e4:   	addcc	%o2, -0x77, %g0
	.word	0xac7a0000	! t0_kref+0x18e8:   	sdiv	%o0, %g0, %l6
	.word	0x80c6ab35	! t0_kref+0x18ec:   	addccc	%i2, 0xb35, %g0
	.word	0xe720a014	! t0_kref+0x18f0:   	st	%f19, [%g2 + 0x14]
	call	SYM(t0_subr1)
	.word	0xd8200018	! t0_kref+0x18f8:   	st	%o4, [%g0 + %i0]
	.word	0xd91fbc10	! t0_kref+0x18fc:   	ldd	[%fp - 0x3f0], %f12
	.word	0x9ba50929	! t0_kref+0x1900:   	fmuls	%f20, %f9, %f13
	.word	0xec7e401c	! t0_kref+0x1904:   	swap	[%i1 + %i4], %l6
	.word	0x99200014	! t0_kref+0x1908:   	mulscc	%g0, %l4, %o4
	.word	0xb1a00034	! t0_kref+0x190c:   	fmovs	%f20, %f24
	.word	0xd008a032	! t0_kref+0x1910:   	ldub	[%g2 + 0x32], %o0
	.word	0x39800002	! t0_kref+0x1914:   	fbuge,a	_kref+0x191c
	.word	0x9a1b0014	! t0_kref+0x1918:   	xor	%o4, %l4, %o5
	.word	0x942d0008	! t0_kref+0x191c:   	andn	%l4, %o0, %o2
	.word	0xae82c015	! t0_kref+0x1920:   	addcc	%o3, %l5, %l7
	.word	0xe53e6010	! t0_kref+0x1924:   	std	%f18, [%i1 + 0x10]
	.word	0xd82e3fe1	! t0_kref+0x1928:   	stb	%o4, [%i0 - 0x1f]
	.word	0x8fa58830	! t0_kref+0x192c:   	fadds	%f22, %f16, %f7
	.word	0x9835c00b	! t0_kref+0x1930:   	orn	%l7, %o3, %o4
	.word	0x921de432	! t0_kref+0x1934:   	xor	%l7, 0x432, %o1
	.word	0x913a601d	! t0_kref+0x1938:   	sra	%o1, 0x1d, %o0
	.word	0xb1a0102e	! t0_kref+0x193c:   	fstox	%f14, %f24
	.word	0x983ab611	! t0_kref+0x1940:   	xnor	%o2, -0x9ef, %o4
	.word	0x81df76a7	! t0_kref+0x1944:   	flush	%i5 - 0x959
	.word	0xd0000018	! t0_kref+0x1948:   	ld	[%g0 + %i0], %o0
	.word	0xee263ff0	! t0_kref+0x194c:   	st	%l7, [%i0 - 0x10]
	.word	0xad2d000a	! t0_kref+0x1950:   	sll	%l4, %o2, %l6
	.word	0xa0fb2cb7	! t0_kref+0x1954:   	sdivcc	%o4, 0xcb7, %l0
	.word	0xa722fdd1	! t0_kref+0x1958:   	mulscc	%o3, -0x22f, %l3
	.word	0x9a868009	! t0_kref+0x195c:   	addcc	%i2, %o1, %o5
	.word	0xac2b3ed2	! t0_kref+0x1960:   	andn	%o4, -0x12e, %l6
	.word	0xd9070018	! t0_kref+0x1964:   	ld	[%i4 + %i0], %f12
	.word	0x94783f36	! t0_kref+0x1968:   	sdiv	%g0, -0xca, %o2
	.word	0xcd1fbc80	! t0_kref+0x196c:   	ldd	[%fp - 0x380], %f6
	.word	0xa9a00030	! t0_kref+0x1970:   	fmovs	%f16, %f20
	.word	0xb7a0012f	! t0_kref+0x1974:   	fabss	%f15, %f27
	.word	0x27480004	! t0_kref+0x1978:   	fbul,a,pt	%fcc0, _kref+0x1988
	.word	0xea30a02c	! t0_kref+0x197c:   	sth	%l5, [%g2 + 0x2c]
	call	SYM(t0_subr1)
	.word	0xafa01a5a	! t0_kref+0x1984:   	fdtoi	%f26, %f23
	.word	0xa6ab7dd8	! t0_kref+0x1988:   	andncc	%o5, -0x228, %l3
	.word	0xbba018cc	! t0_kref+0x198c:   	fdtos	%f12, %f29
	.word	0x95a01037	! t0_kref+0x1990:   	fstox	%f23, %f10
	.word	0x8610200f	! t0_kref+0x1994:   	mov	0xf, %g3
	.word	0x86a0e001	! t0_kref+0x1998:   	subcc	%g3, 1, %g3
	.word	0x22800009	! t0_kref+0x199c:   	be,a	_kref+0x19c0
	.word	0x8fa0189a	! t0_kref+0x19a0:   	fitos	%f26, %f7
	.word	0xd4162000	! t0_kref+0x19a4:   	lduh	[%i0], %o2
	.word	0x9fc10000	! t0_kref+0x19a8:   	call	%g4
	.word	0xe6064000	! t0_kref+0x19ac:   	ld	[%i1], %l3
	.word	0x81ae0a48	! t0_kref+0x19b0:   	fcmpd	%fcc0, %f24, %f8
	.word	0xb5a000a9	! t0_kref+0x19b4:   	fnegs	%f9, %f26
	.word	0xcd1fbd50	! t0_kref+0x19b8:   	ldd	[%fp - 0x2b0], %f6
	.word	0xd0200019	! t0_kref+0x19bc:   	st	%o0, [%g0 + %i1]
	.word	0x29480003	! t0_kref+0x19c0:   	fbl,a,pt	%fcc0, _kref+0x19cc
	.word	0xd600a038	! t0_kref+0x19c4:   	ld	[%g2 + 0x38], %o3
	.word	0xa03aacc0	! t0_kref+0x19c8:   	xnor	%o2, 0xcc0, %l0
	.word	0x932d000a	! t0_kref+0x19cc:   	sll	%l4, %o2, %o1
	.word	0x28800008	! t0_kref+0x19d0:   	bleu,a	_kref+0x19f0
	.word	0xd93e2018	! t0_kref+0x19d4:   	std	%f12, [%i0 + 0x18]
	.word	0xa4aa2e65	! t0_kref+0x19d8:   	andncc	%o0, 0xe65, %l2
	.word	0xeb68a006	! t0_kref+0x19dc:   	prefetch	%g2 + 6, 21
	.word	0xc07e6008	! t0_kref+0x19e0:   	swap	[%i1 + 8], %g0
	.word	0xa415a344	! t0_kref+0x19e4:   	or	%l6, 0x344, %l2
	.word	0x9fc00004	! t0_kref+0x19e8:   	call	%g0 + %g4
	.word	0xe3b8a040	! t0_kref+0x19ec:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xaebdc017	! t0_kref+0x19f0:   	xnorcc	%l7, %l7, %l7
	.word	0xbba5082b	! t0_kref+0x19f4:   	fadds	%f20, %f11, %f29
	.word	0x903a6c90	! t0_kref+0x19f8:   	xnor	%o1, 0xc90, %o0
	.word	0x98a2f7f0	! t0_kref+0x19fc:   	subcc	%o3, -0x810, %o4
	.word	0xb3a018ca	! t0_kref+0x1a00:   	fdtos	%f10, %f25
	.word	0xea00a018	! t0_kref+0x1a04:   	ld	[%g2 + 0x18], %l5
	.word	0xac92000d	! t0_kref+0x1a08:   	orcc	%o0, %o5, %l6
	.word	0x80a37198	! t0_kref+0x1a0c:   	cmp	%o5, -0xe68
	.word	0x8143c000	! t0_kref+0x1a10:   	stbar
	.word	0x93a0013b	! t0_kref+0x1a14:   	fabss	%f27, %f9
	.word	0xa83d0009	! t0_kref+0x1a18:   	xnor	%l4, %o1, %l4
	.word	0xf13e2008	! t0_kref+0x1a1c:   	std	%f24, [%i0 + 8]
	.word	0xc7ee1017	! t0_kref+0x1a20:   	prefetcha	%i0 + %l7, 3
	.word	0x9da01a36	! t0_kref+0x1a24:   	fstoi	%f22, %f14
	.word	0x9de3bfa0	! t0_kref+0x1a28:   	save	%sp, -0x60, %sp
	.word	0x93ef0019	! t0_kref+0x1a2c:   	restore	%i4, %i1, %o1
	.word	0x81820000	! t0_kref+0x1a30:   	wr	%o0, %g0, %y
	.word	0xeb00a024	! t0_kref+0x1a34:   	ld	[%g2 + 0x24], %f21
	.word	0xda167ff2	! t0_kref+0x1a38:   	lduh	[%i1 - 0xe], %o5
	.word	0xc056200c	! t0_kref+0x1a3c:   	ldsh	[%i0 + 0xc], %g0
	call	SYM(t0_subr0)
	.word	0xdd1e7fe8	! t0_kref+0x1a44:   	ldd	[%i1 - 0x18], %f14
	.word	0xa4fb6175	! t0_kref+0x1a48:   	sdivcc	%o5, 0x175, %l2
	.word	0xbda0109a	! t0_kref+0x1a4c:   	fxtos	%f26, %f30
	.word	0x983aabff	! t0_kref+0x1a50:   	xnor	%o2, 0xbff, %o4
	.word	0x81daf6ed	! t0_kref+0x1a54:   	flush	%o3 - 0x913
	.word	0x982e8016	! t0_kref+0x1a58:   	andn	%i2, %l6, %o4
	.word	0x86102002	! t0_kref+0x1a5c:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x1a60:   	bne,a	_kref+0x1a60
	.word	0x86a0e001	! t0_kref+0x1a64:   	subcc	%g3, 1, %g3
	.word	0xe3b8a040	! t0_kref+0x1a68:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xd20e201d	! t0_kref+0x1a6c:   	ldub	[%i0 + 0x1d], %o1
	.word	0x9da58836	! t0_kref+0x1a70:   	fadds	%f22, %f22, %f14
	.word	0xa1a289d6	! t0_kref+0x1a74:   	fdivd	%f10, %f22, %f16
	.word	0xada6095c	! t0_kref+0x1a78:   	fmuld	%f24, %f28, %f22
	.word	0x3d480002	! t0_kref+0x1a7c:   	fbule,a,pt	%fcc0, _kref+0x1a84
	.word	0xbba018dc	! t0_kref+0x1a80:   	fdtos	%f28, %f29
	.word	0xa01a0008	! t0_kref+0x1a84:   	xor	%o0, %o0, %l0
	.word	0x81ae0ac6	! t0_kref+0x1a88:   	fcmped	%fcc0, %f24, %f6
	call	SYM(t0_subr3)
	.word	0xd100a03c	! t0_kref+0x1a90:   	ld	[%g2 + 0x3c], %f8
	.word	0x947b0009	! t0_kref+0x1a94:   	sdiv	%o4, %o1, %o2
	.word	0xe19e9a18	! t0_kref+0x1a98:   	ldda	[%i2 + %i0]0xd0, %f16
	.word	0x9015800c	! t0_kref+0x1a9c:   	or	%l6, %o4, %o0
	.word	0xd99e1a1a	! t0_kref+0x1aa0:   	ldda	[%i0 + %i2]0xd0, %f12
	.word	0xe008a000	! t0_kref+0x1aa4:   	ldub	[%g2], %l0
	.word	0xf91fbd58	! t0_kref+0x1aa8:   	ldd	[%fp - 0x2a8], %f28
	.word	0x8143e040	! t0_kref+0x1aac:   	membar	0x40
	.word	0xd11fbc40	! t0_kref+0x1ab0:   	ldd	[%fp - 0x3c0], %f8
	.word	0xf13e0000	! t0_kref+0x1ab4:   	std	%f24, [%i0]
	.word	0xf1380019	! t0_kref+0x1ab8:   	std	%f24, [%g0 + %i1]
	.word	0xd6ce9019	! t0_kref+0x1abc:   	ldsba	[%i2 + %i1]0x80, %o3
	.word	0x9e023b91	! t0_kref+0x1ac0:   	add	%o0, -0x46f, %o7
	.word	0xb5a0191e	! t0_kref+0x1ac4:   	fitod	%f30, %f26
	.word	0x8143c000	! t0_kref+0x1ac8:   	stbar
	.word	0x81ddc01e	! t0_kref+0x1acc:   	flush	%l7 + %fp
	.word	0x8143c000	! t0_kref+0x1ad0:   	stbar
	.word	0x92458000	! t0_kref+0x1ad4:   	addc	%l6, %g0, %o1
	.word	0xf1bf1a58	! t0_kref+0x1ad8:   	stda	%f24, [%i4 + %i0]0xd2
	.word	0x907b0016	! t0_kref+0x1adc:   	sdiv	%o4, %l6, %o0
	.word	0x001fffff	! t0_kref+0x1ae0:   	illtrap	0x1fffff
	.word	0x95a74d28	! t0_kref+0x1ae4:   	fsmuld	%f29, %f8, %f10
	.word	0x8da2083a	! t0_kref+0x1ae8:   	fadds	%f8, %f26, %f6
	.word	0x3a480001	! t0_kref+0x1aec:   	bcc,a,pt	%icc, _kref+0x1af0
	.word	0xe200a00c	! t0_kref+0x1af0:   	ld	[%g2 + 0xc], %l1
	.word	0x9802305b	! t0_kref+0x1af4:   	add	%o0, -0xfa5, %o4
	.word	0x2a480008	! t0_kref+0x1af8:   	bcs,a,pt	%icc, _kref+0x1b18
	.word	0x93a00537	! t0_kref+0x1afc:   	fsqrts	%f23, %f9
	.word	0x91a000d6	! t0_kref+0x1b00:   	fnegd	%f22, %f8
	.word	0xf720a018	! t0_kref+0x1b04:   	st	%f27, [%g2 + 0x18]
	.word	0xada1885a	! t0_kref+0x1b08:   	faddd	%f6, %f26, %f22
	.word	0xaa0eb13c	! t0_kref+0x1b0c:   	and	%i2, -0xec4, %l5
	.word	0x30800001	! t0_kref+0x1b10:   	ba,a	_kref+0x1b14
	.word	0xe840a034	! t0_kref+0x1b14:   	ldsw	[%g2 + 0x34], %l4
	.word	0xd43e2000	! t0_kref+0x1b18:   	std	%o2, [%i0]
	.word	0xa5a0003b	! t0_kref+0x1b1c:   	fmovs	%f27, %f18
	.word	0xd006200c	! t0_kref+0x1b20:   	ld	[%i0 + 0xc], %o0
	.word	0xd0000019	! t0_kref+0x1b24:   	ld	[%g0 + %i1], %o0
	.word	0xae420008	! t0_kref+0x1b28:   	addc	%o0, %o0, %l7
	.word	0x92c2310a	! t0_kref+0x1b2c:   	addccc	%o0, -0xef6, %o1
	.word	0x81dda875	! t0_kref+0x1b30:   	flush	%l6 + 0x875
	.word	0xada0012a	! t0_kref+0x1b34:   	fabss	%f10, %f22
	.word	0xe4180019	! t0_kref+0x1b38:   	ldd	[%g0 + %i1], %l2
	.word	0xd240a020	! t0_kref+0x1b3c:   	ldsw	[%g2 + 0x20], %o1
	.word	0xae85b6ed	! t0_kref+0x1b40:   	addcc	%l6, -0x913, %l7
	.word	0xa20b64f2	! t0_kref+0x1b44:   	and	%o5, 0x4f2, %l1
	.word	0xaee52999	! t0_kref+0x1b48:   	subccc	%l4, 0x999, %l7
	.word	0x99a689d0	! t0_kref+0x1b4c:   	fdivd	%f26, %f16, %f12
	.word	0xd46e0000	! t0_kref+0x1b50:   	ldstub	[%i0], %o2
	.word	0xa1a20946	! t0_kref+0x1b54:   	fmuld	%f8, %f6, %f16
	.word	0xd40e8019	! t0_kref+0x1b58:   	ldub	[%i2 + %i1], %o2
	.word	0x2d800005	! t0_kref+0x1b5c:   	fbg,a	_kref+0x1b70
	.word	0xab32c009	! t0_kref+0x1b60:   	srl	%o3, %o1, %l5
	.word	0xd010a018	! t0_kref+0x1b64:   	lduh	[%g2 + 0x18], %o0
	.word	0xa033000b	! t0_kref+0x1b68:   	orn	%o4, %o3, %l0
	.word	0x93a688ba	! t0_kref+0x1b6c:   	fsubs	%f26, %f26, %f9
	.word	0xa03aba8a	! t0_kref+0x1b70:   	xnor	%o2, -0x576, %l0
	.word	0xc0567fe4	! t0_kref+0x1b74:   	ldsh	[%i1 - 0x1c], %g0
	.word	0x980da5db	! t0_kref+0x1b78:   	and	%l6, 0x5db, %o4
	.word	0x29480004	! t0_kref+0x1b7c:   	fbl,a,pt	%fcc0, _kref+0x1b8c
	.word	0x90853e2d	! t0_kref+0x1b80:   	addcc	%l4, -0x1d3, %o0
	.word	0x9fc00004	! t0_kref+0x1b84:   	call	%g0 + %g4
	.word	0x945222b7	! t0_kref+0x1b88:   	umul	%o0, 0x2b7, %o2
	.word	0x3c800003	! t0_kref+0x1b8c:   	bpos,a	_kref+0x1b98
	.word	0x99350008	! t0_kref+0x1b90:   	srl	%l4, %o0, %o4
	.word	0xa6fdf2ed	! t0_kref+0x1b94:   	sdivcc	%l7, -0xd13, %l3
	.word	0xd6362006	! t0_kref+0x1b98:   	sth	%o3, [%i0 + 6]
	.word	0x3a800001	! t0_kref+0x1b9c:   	bcc,a	_kref+0x1ba0
	.word	0xe0167ff6	! t0_kref+0x1ba0:   	lduh	[%i1 - 0xa], %l0
	.word	0x81400000	! t0_kref+0x1ba4:   	mov	%y, %g0
	.word	0x2a800007	! t0_kref+0x1ba8:   	bcs,a	_kref+0x1bc4
	.word	0xe41f4018	! t0_kref+0x1bac:   	ldd	[%i5 + %i0], %l2
	.word	0x81af4abc	! t0_kref+0x1bb0:   	fcmpes	%fcc0, %f29, %f28
	.word	0x99330009	! t0_kref+0x1bb4:   	srl	%o4, %o1, %o4
	.word	0xb3a3482c	! t0_kref+0x1bb8:   	fadds	%f13, %f12, %f25
	.word	0x3c480002	! t0_kref+0x1bbc:   	bpos,a,pt	%icc, _kref+0x1bc4
	.word	0xe53e7ff0	! t0_kref+0x1bc0:   	std	%f18, [%i1 - 0x10]
	.word	0xee563ff0	! t0_kref+0x1bc4:   	ldsh	[%i0 - 0x10], %l7
	.word	0xf198105d	! t0_kref+0x1bc8:   	ldda	[%g0 + %i5]0x82, %f24
	.word	0x23480005	! t0_kref+0x1bcc:   	fbne,a,pt	%fcc0, _kref+0x1be0
	.word	0xa21d7844	! t0_kref+0x1bd0:   	xor	%l5, -0x7bc, %l1
	.word	0x3d480006	! t0_kref+0x1bd4:   	fbule,a,pt	%fcc0, _kref+0x1bec
	.word	0xa9a01913	! t0_kref+0x1bd8:   	fitod	%f19, %f20
	.word	0x8fa0053b	! t0_kref+0x1bdc:   	fsqrts	%f27, %f7
	call	SYM(t0_subr2)
	.word	0xf4200019	! t0_kref+0x1be4:   	st	%i2, [%g0 + %i1]
	.word	0x9fc10000	! t0_kref+0x1be8:   	call	%g4
	.word	0x91a01090	! t0_kref+0x1bec:   	fxtos	%f16, %f8
	.word	0x9a1b7228	! t0_kref+0x1bf0:   	xor	%o5, -0xdd8, %o5
	.word	0x9fc00004	! t0_kref+0x1bf4:   	call	%g0 + %g4
	.word	0xd1bf5019	! t0_kref+0x1bf8:   	stda	%f8, [%i5 + %i1]0x80
	.word	0xa4856f22	! t0_kref+0x1bfc:   	addcc	%l5, 0xf22, %l2
	.word	0xaba7893a	! t0_kref+0x1c00:   	fmuls	%f30, %f26, %f21
	.word	0x39800003	! t0_kref+0x1c04:   	fbuge,a	_kref+0x1c10
	.word	0xcd1f4018	! t0_kref+0x1c08:   	ldd	[%i5 + %i0], %f6
	.word	0x27253ebe	! t0_kref+0x1c0c:   	sethi	%hi(0x94faf800), %l3
	.word	0xa9180015	! t0_kref+0x1c10:   	tsubcctv	%g0, %l5, %l4
	.word	0xa4da4009	! t0_kref+0x1c14:   	smulcc	%o1, %o1, %l2
	.word	0xe968a080	! t0_kref+0x1c18:   	prefetch	%g2 + 0x80, 20
	.word	0x8143e040	! t0_kref+0x1c1c:   	membar	0x40
	.word	0xe93e001d	! t0_kref+0x1c20:   	std	%f20, [%i0 + %i5]
	.word	0xa7a4c8b4	! t0_kref+0x1c24:   	fsubs	%f19, %f20, %f19
	.word	0x9e56800c	! t0_kref+0x1c28:   	umul	%i2, %o4, %o7
	.word	0x94db3cca	! t0_kref+0x1c2c:   	smulcc	%o4, -0x336, %o2
	.word	0xec9f5018	! t0_kref+0x1c30:   	ldda	[%i5 + %i0]0x80, %l6
	.word	0xc1e65014	! t0_kref+0x1c34:   	casa	[%i1]0x80, %l4, %g0
	.word	0xa6152568	! t0_kref+0x1c38:   	or	%l4, 0x568, %l3
	.word	0xe3b8a040	! t0_kref+0x1c3c:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xde10a010	! t0_kref+0x1c40:   	lduh	[%g2 + 0x10], %o7
	.word	0x2d38f5cd	! t0_kref+0x1c44:   	sethi	%hi(0xe3d73400), %l6
	.word	0xaac57ebe	! t0_kref+0x1c48:   	addccc	%l5, -0x142, %l5
	.word	0xac13401a	! t0_kref+0x1c4c:   	or	%o5, %i2, %l6
	.word	0xe2ce9040	! t0_kref+0x1c50:   	ldsba	[%i2]0x82, %l1
	.word	0x99a608ce	! t0_kref+0x1c54:   	fsubd	%f24, %f14, %f12
	.word	0x81af8ad4	! t0_kref+0x1c58:   	fcmped	%fcc0, %f30, %f20
	.word	0xa65d8008	! t0_kref+0x1c5c:   	smul	%l6, %o0, %l3
	.word	0xf1be1000	! t0_kref+0x1c60:   	stda	%f24, [%i0]0x80
	.word	0x9475bbf4	! t0_kref+0x1c64:   	udiv	%l6, -0x40c, %o2
	.word	0xe6564000	! t0_kref+0x1c68:   	ldsh	[%i1], %l3
	.word	0xa202400c	! t0_kref+0x1c6c:   	add	%o1, %o4, %l1
	.word	0xa45aa722	! t0_kref+0x1c70:   	smul	%o2, 0x722, %l2
	.word	0xd6d01019	! t0_kref+0x1c74:   	ldsha	[%g0 + %i1]0x80, %o3
	.word	0xacc5401a	! t0_kref+0x1c78:   	addccc	%l5, %i2, %l6
	.word	0xe408643c	! t0_kref+0x1c7c:   	ldub	[%g1 + 0x43c], %l2
	.word	0xa41ca00c	! t0_kref+0x1c80:   	xor	%l2, 0xc, %l2
	.word	0xe428643c	! t0_kref+0x1c84:   	stb	%l2, [%g1 + 0x43c]
	.word	0x81d8643c	! t0_kref+0x1c88:   	flush	%g1 + 0x43c
	.word	0xbba6c826	! t0_kref+0x1c8c:   	fadds	%f27, %f6, %f29
	.word	0x3e800003	! t0_kref+0x1c90:   	bvc,a	_kref+0x1c9c
	.word	0x1f075065	! t0_kref+0x1c94:   	sethi	%hi(0x1d419400), %o7
	.word	0xee0e201a	! t0_kref+0x1c98:   	ldub	[%i0 + 0x1a], %l7
	.word	0x800eb1b2	! t0_kref+0x1c9c:   	and	%i2, -0xe4e, %g0
	.word	0xd99f5a19	! t0_kref+0x1ca0:   	ldda	[%i5 + %i1]0xd0, %f12
	.word	0xee7e3fec	! t0_kref+0x1ca4:   	swap	[%i0 - 0x14], %l7
	.word	0x923ac01a	! t0_kref+0x1ca8:   	xnor	%o3, %i2, %o1
	.word	0x94f30014	! t0_kref+0x1cac:   	udivcc	%o4, %l4, %o2
	.word	0x95a189cc	! t0_kref+0x1cb0:   	fdivd	%f6, %f12, %f10
	.word	0xaaf80008	! t0_kref+0x1cb4:   	sdivcc	%g0, %o0, %l5
	.word	0xaafde270	! t0_kref+0x1cb8:   	sdivcc	%l7, 0x270, %l5
	.word	0xb9a0003e	! t0_kref+0x1cbc:   	fmovs	%f30, %f28
2:	.word	0xea36001b	! t0_kref+0x1cc0:   	sth	%l5, [%i0 + %i3]
	.word	0xd100a010	! t0_kref+0x1cc4:   	ld	[%g2 + 0x10], %f8
	sethi	%hi(2f), %o7
	.word	0xe40be118	! t0_kref+0x1ccc:   	ldub	[%o7 + 0x118], %l2
	.word	0xa41ca00c	! t0_kref+0x1cd0:   	xor	%l2, 0xc, %l2
	.word	0xe42be118	! t0_kref+0x1cd4:   	stb	%l2, [%o7 + 0x118]
	.word	0x81dbe118	! t0_kref+0x1cd8:   	flush	%o7 + 0x118
	.word	0x9e2d4017	! t0_kref+0x1cdc:   	andn	%l5, %l7, %o7
	.word	0xeef75018	! t0_kref+0x1ce0:   	stxa	%l7, [%i5 + %i0]0x80
	.word	0xa0654014	! t0_kref+0x1ce4:   	subc	%l5, %l4, %l0
	.word	0x9fc00004	! t0_kref+0x1ce8:   	call	%g0 + %g4
	.word	0x9238001a	! t0_kref+0x1cec:   	xnor	%g0, %i2, %o1
	.word	0xf11fbf20	! t0_kref+0x1cf0:   	ldd	[%fp - 0xe0], %f24
	.word	0xaaba255b	! t0_kref+0x1cf4:   	xnorcc	%o0, 0x55b, %l5
	.word	0xda40a018	! t0_kref+0x1cf8:   	ldsw	[%g2 + 0x18], %o5
	.word	0xe416c019	! t0_kref+0x1cfc:   	lduh	[%i3 + %i1], %l2
	.word	0xa9a28854	! t0_kref+0x1d00:   	faddd	%f10, %f20, %f20
	.word	0xa9a018d2	! t0_kref+0x1d04:   	fdtos	%f18, %f20
	.word	0xa8c33365	! t0_kref+0x1d08:   	addccc	%o4, -0xc9b, %l4
	.word	0xda6e2010	! t0_kref+0x1d0c:   	ldstub	[%i0 + 0x10], %o5
	.word	0xada01888	! t0_kref+0x1d10:   	fitos	%f8, %f22
	.word	0x95a01052	! t0_kref+0x1d14:   	fdtox	%f18, %f10
2:	.word	0xada01913	! t0_kref+0x1d18:   	fitod	%f19, %f22
	.word	0x21480003	! t0_kref+0x1d1c:   	fbn,a,pt	%fcc0, _kref+0x1d28
	.word	0xada209d2	! t0_kref+0x1d20:   	fdivd	%f8, %f18, %f22
	.word	0xe51f4018	! t0_kref+0x1d24:   	ldd	[%i5 + %i0], %f18
	.word	0xe648a007	! t0_kref+0x1d28:   	ldsb	[%g2 + 7], %l3
	call	SYM(t0_subr2)
	.word	0xbba01888	! t0_kref+0x1d30:   	fitos	%f8, %f29
	.word	0x90e2c017	! t0_kref+0x1d34:   	subccc	%o3, %l7, %o0
	.word	0xae1aab30	! t0_kref+0x1d38:   	xor	%o2, 0xb30, %l7
	.word	0xea567fea	! t0_kref+0x1d3c:   	ldsh	[%i1 - 0x16], %l5
	.word	0xa932c00d	! t0_kref+0x1d40:   	srl	%o3, %o5, %l4
	.word	0x8143c000	! t0_kref+0x1d44:   	stbar
	.word	0xe820a034	! t0_kref+0x1d48:   	st	%l4, [%g2 + 0x34]
	.word	0x9fc00004	! t0_kref+0x1d4c:   	call	%g0 + %g4
	.word	0xcd86101c	! t0_kref+0x1d50:   	lda	[%i0 + %i4]0x80, %f6
	.word	0xd700a034	! t0_kref+0x1d54:   	ld	[%g2 + 0x34], %f11
	.word	0x800026ff	! t0_kref+0x1d58:   	add	%g0, 0x6ff, %g0
	.word	0x9682c00b	! t0_kref+0x1d5c:   	addcc	%o3, %o3, %o3
	.word	0xd4871018	! t0_kref+0x1d60:   	lda	[%i4 + %i0]0x80, %o2
	.word	0xe3b8a040	! t0_kref+0x1d64:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xe4567ffa	! t0_kref+0x1d68:   	ldsh	[%i1 - 6], %l2
	.word	0xf51e4000	! t0_kref+0x1d6c:   	ldd	[%i1], %f26
	.word	0x9f3a2017	! t0_kref+0x1d70:   	sra	%o0, 0x17, %o7
	.word	0x38800004	! t0_kref+0x1d74:   	bgu,a	_kref+0x1d84
	.word	0xa01d3ec2	! t0_kref+0x1d78:   	xor	%l4, -0x13e, %l0
	.word	0xd030a03e	! t0_kref+0x1d7c:   	sth	%o0, [%g2 + 0x3e]
	.word	0x95a5c83d	! t0_kref+0x1d80:   	fadds	%f23, %f29, %f10
	.word	0xa130201f	! t0_kref+0x1d84:   	srl	%g0, 0x1f, %l0
	sethi	%hi(2f), %o7
	.word	0xe40be1bc	! t0_kref+0x1d8c:   	ldub	[%o7 + 0x1bc], %l2
	.word	0xa41ca00c	! t0_kref+0x1d90:   	xor	%l2, 0xc, %l2
	.word	0xe42be1bc	! t0_kref+0x1d94:   	stb	%l2, [%o7 + 0x1bc]
	.word	0x81dbe1bc	! t0_kref+0x1d98:   	flush	%o7 + 0x1bc
	.word	0xec50a00e	! t0_kref+0x1d9c:   	ldsh	[%g2 + 0xe], %l6
	.word	0xa1a018d8	! t0_kref+0x1da0:   	fdtos	%f24, %f16
	.word	0xb5a00027	! t0_kref+0x1da4:   	fmovs	%f7, %f26
	.word	0xea6e8018	! t0_kref+0x1da8:   	ldstub	[%i2 + %i0], %l5
	.word	0xa9aa0046	! t0_kref+0x1dac:   	fmovda	%fcc0, %f6, %f20
	call	SYM(t0_subr1)
	.word	0xb3a348ae	! t0_kref+0x1db4:   	fsubs	%f13, %f14, %f25
	.word	0xa4e2c014	! t0_kref+0x1db8:   	subccc	%o3, %l4, %l2
2:	.word	0xe6fe501c	! t0_kref+0x1dbc:   	swapa	[%i1 + %i4]0x80, %l3
	.word	0x29480005	! t0_kref+0x1dc0:   	fbl,a,pt	%fcc0, _kref+0x1dd4
	.word	0xe300a01c	! t0_kref+0x1dc4:   	ld	[%g2 + 0x1c], %f17
	.word	0x81aa8ad8	! t0_kref+0x1dc8:   	fcmped	%fcc0, %f10, %f24
	.word	0x3e480006	! t0_kref+0x1dcc:   	bvc,a,pt	%icc, _kref+0x1de4
	.word	0x9da01a3c	! t0_kref+0x1dd0:   	fstoi	%f28, %f14
	.word	0xae0dab8a	! t0_kref+0x1dd4:   	and	%l6, 0xb8a, %l7
	.word	0x81834000	! t0_kref+0x1dd8:   	wr	%o5, %g0, %y
	.word	0x8fa018cc	! t0_kref+0x1ddc:   	fdtos	%f12, %f7
	.word	0x92fb000b	! t0_kref+0x1de0:   	sdivcc	%o4, %o3, %o1
	.word	0xb1a01a39	! t0_kref+0x1de4:   	fstoi	%f25, %f24
	.word	0xd608a02e	! t0_kref+0x1de8:   	ldub	[%g2 + 0x2e], %o3
	.word	0xe9b81019	! t0_kref+0x1dec:   	stda	%f20, [%g0 + %i1]0x80
	.word	0x96b80015	! t0_kref+0x1df0:   	xnorcc	%g0, %l5, %o3
	.word	0x99a1c9aa	! t0_kref+0x1df4:   	fdivs	%f7, %f10, %f12
	.word	0x24480005	! t0_kref+0x1df8:   	ble,a,pt	%icc, _kref+0x1e0c
	.word	0xb1a01a50	! t0_kref+0x1dfc:   	fdtoi	%f16, %f24
	.word	0xd626201c	! t0_kref+0x1e00:   	st	%o3, [%i0 + 0x1c]
	.word	0xeb68a004	! t0_kref+0x1e04:   	prefetch	%g2 + 4, 21
	.word	0x90f0355b	! t0_kref+0x1e08:   	udivcc	%g0, -0xaa5, %o0
	.word	0xb9a6083d	! t0_kref+0x1e0c:   	fadds	%f24, %f29, %f28
	.word	0xbba018c6	! t0_kref+0x1e10:   	fdtos	%f6, %f29
	.word	0xdd3e2010	! t0_kref+0x1e14:   	std	%f14, [%i0 + 0x10]
	.word	0x91a789bc	! t0_kref+0x1e18:   	fdivs	%f30, %f28, %f8
	sethi	%hi(1f), %o7
	jmpl	%o7+%lo(1f), %g1
	.empty
	.word	0xa12da00b	! t0_kref+0x1e24:   	sll	%l6, 0xb, %l0
1:	.word	0xa5a01911	! t0_kref+0x1e28:   	fitod	%f17, %f18
	.word	0x91a0110e	! t0_kref+0x1e2c:   	fxtod	%f14, %f8
	.word	0xed00a014	! t0_kref+0x1e30:   	ld	[%g2 + 0x14], %f22
	.word	0x86102003	! t0_kref+0x1e34:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x1e38:   	bne,a	_kref+0x1e38
	.word	0x86a0e001	! t0_kref+0x1e3c:   	subcc	%g3, 1, %g3
	.word	0x3b480004	! t0_kref+0x1e40:   	fble,a,pt	%fcc0, _kref+0x1e50
	.word	0xf500a000	! t0_kref+0x1e44:   	ld	[%g2], %f26
	.word	0xa33b201d	! t0_kref+0x1e48:   	sra	%o4, 0x1d, %l1
	.word	0x9da28d2c	! t0_kref+0x1e4c:   	fsmuld	%f10, %f12, %f14
	.word	0xda50a004	! t0_kref+0x1e50:   	ldsh	[%g2 + 4], %o5
	.word	0x80bdb6d5	! t0_kref+0x1e54:   	xnorcc	%l6, -0x92b, %g0
	.word	0xdb070019	! t0_kref+0x1e58:   	ld	[%i4 + %i1], %f13
	.word	0xfd062018	! t0_kref+0x1e5c:   	ld	[%i0 + 0x18], %f30
	.word	0xec48a015	! t0_kref+0x1e60:   	ldsb	[%g2 + 0x15], %l6
	.word	0xac068000	! t0_kref+0x1e64:   	add	%i2, %g0, %l6
	.word	0x95a2084c	! t0_kref+0x1e68:   	faddd	%f8, %f12, %f10
	.word	0xaf35c000	! t0_kref+0x1e6c:   	srl	%l7, %g0, %l7
	.word	0x2b480005	! t0_kref+0x1e70:   	fbug,a,pt	%fcc0, _kref+0x1e84
	.word	0xd13e3ff0	! t0_kref+0x1e74:   	std	%f8, [%i0 - 0x10]
	.word	0xbda00526	! t0_kref+0x1e78:   	fsqrts	%f6, %f30
	.word	0x91a40937	! t0_kref+0x1e7c:   	fmuls	%f16, %f23, %f8
	.word	0x98420015	! t0_kref+0x1e80:   	addc	%o0, %l5, %o4
	.word	0xb5a34d26	! t0_kref+0x1e84:   	fsmuld	%f13, %f6, %f26
	.word	0xd20e4000	! t0_kref+0x1e88:   	ldub	[%i1], %o1
	.word	0xa1a01a38	! t0_kref+0x1e8c:   	fstoi	%f24, %f16
	.word	0xee163fee	! t0_kref+0x1e90:   	lduh	[%i0 - 0x12], %l7
	.word	0x912a0014	! t0_kref+0x1e94:   	sll	%o0, %l4, %o0
	.word	0x933a6007	! t0_kref+0x1e98:   	sra	%o1, 0x7, %o1
	.word	0x9de3bfa0	! t0_kref+0x1e9c:   	save	%sp, -0x60, %sp
	.word	0xa5ee3f52	! t0_kref+0x1ea0:   	restore	%i0, -0xae, %l2
	.word	0x9da01a33	! t0_kref+0x1ea4:   	fstoi	%f19, %f14
	.word	0xc12e001c	! t0_kref+0x1ea8:   	st	%fsr, [%i0 + %i4]
	.word	0xd810a032	! t0_kref+0x1eac:   	lduh	[%g2 + 0x32], %o4
	.word	0xd8ce9040	! t0_kref+0x1eb0:   	ldsba	[%i2]0x82, %o4
	.word	0xe000a020	! t0_kref+0x1eb4:   	ld	[%g2 + 0x20], %l0
	.word	0x9285c009	! t0_kref+0x1eb8:   	addcc	%l7, %o1, %o1
	.word	0x27480005	! t0_kref+0x1ebc:   	fbul,a,pt	%fcc0, _kref+0x1ed0
	.word	0x962a0017	! t0_kref+0x1ec0:   	andn	%o0, %l7, %o3
	.word	0xd7a6501c	! t0_kref+0x1ec4:   	sta	%f11, [%i1 + %i4]0x80
	.word	0xe168a08f	! t0_kref+0x1ec8:   	prefetch	%g2 + 0x8f, 16
	.word	0xe3b8a040	! t0_kref+0x1ecc:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x99a509b6	! t0_kref+0x1ed0:   	fdivs	%f20, %f22, %f12
	.word	0xd2b65000	! t0_kref+0x1ed4:   	stha	%o1, [%i1]0x80
	.word	0x81aa4a39	! t0_kref+0x1ed8:   	fcmps	%fcc0, %f9, %f25
	call	SYM(t0_subr0)
	.word	0xb7a01a3d	! t0_kref+0x1ee0:   	fstoi	%f29, %f27
	call	1f
	.empty
	.word	0x99336004	! t0_kref+0x1ee8:   	srl	%o5, 0x4, %o4
	.word	0x99a0191e	! t0_kref+0x1eec:   	fitod	%f30, %f12
	.word	0xf5ee101a	! t0_kref+0x1ef0:   	prefetcha	%i0 + %i2, 26
	.word	0x949a3c19	! t0_kref+0x1ef4:   	xorcc	%o0, -0x3e7, %o2
1:	.word	0xb1a28848	! t0_kref+0x1ef8:   	faddd	%f10, %f8, %f24
	.word	0xa60b0008	! t0_kref+0x1efc:   	and	%o4, %o0, %l3
	.word	0xe8b6501b	! t0_kref+0x1f00:   	stha	%l4, [%i1 + %i3]0x80
	.word	0x9da4094a	! t0_kref+0x1f04:   	fmuld	%f16, %f10, %f14
	.word	0xa5a0189b	! t0_kref+0x1f08:   	fitos	%f27, %f18
	.word	0xb1a00137	! t0_kref+0x1f0c:   	fabss	%f23, %f24
	.word	0xe3b8a040	! t0_kref+0x1f10:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x36800004	! t0_kref+0x1f14:   	bge,a	_kref+0x1f24
	.word	0x90fa8008	! t0_kref+0x1f18:   	sdivcc	%o2, %o0, %o0
	.word	0x803dc000	! t0_kref+0x1f1c:   	not	%l7, %g0
	call	SYM(t0_subr0)
	.word	0xd686501c	! t0_kref+0x1f24:   	lda	[%i1 + %i4]0x80, %o3
	.word	0x83414000	! t0_kref+0x1f28:   	mov	%pc, %g1
	.word	0x22800001	! t0_kref+0x1f2c:   	be,a	_kref+0x1f30
	.word	0xf520a034	! t0_kref+0x1f30:   	st	%f26, [%g2 + 0x34]
	.word	0x8143c000	! t0_kref+0x1f34:   	stbar
	.word	0x92bafcce	! t0_kref+0x1f38:   	xnorcc	%o3, -0x332, %o1
	.word	0x99a018d4	! t0_kref+0x1f3c:   	fdtos	%f20, %f12
	.word	0xd6270018	! t0_kref+0x1f40:   	st	%o3, [%i4 + %i0]
	.word	0xd240a030	! t0_kref+0x1f44:   	ldsw	[%g2 + 0x30], %o1
	.word	0x800d8009	! t0_kref+0x1f48:   	and	%l6, %o1, %g0
	.word	0x8da48d37	! t0_kref+0x1f4c:   	fsmuld	%f18, %f23, %f6
	.word	0xf7062000	! t0_kref+0x1f50:   	ld	[%i0], %f27
	.word	0x81ddc005	! t0_kref+0x1f54:   	flush	%l7 + %g5
	.word	0x95a00534	! t0_kref+0x1f58:   	fsqrts	%f20, %f10
	.word	0xe828a03e	! t0_kref+0x1f5c:   	stb	%l4, [%g2 + 0x3e]
	call	SYM(t0_subr3)
	.word	0xada0110e	! t0_kref+0x1f64:   	fxtod	%f14, %f22
	.word	0x9eaa4000	! t0_kref+0x1f68:   	andncc	%o1, %g0, %o7
	.word	0x25480002	! t0_kref+0x1f6c:   	fblg,a,pt	%fcc0, _kref+0x1f74
	.word	0xd408a032	! t0_kref+0x1f70:   	ldub	[%g2 + 0x32], %o2
	.word	0x9ba01a2f	! t0_kref+0x1f74:   	fstoi	%f15, %f13
	.word	0xaa56acdd	! t0_kref+0x1f78:   	umul	%i2, 0xcdd, %l5
	.word	0x81ae8ac6	! t0_kref+0x1f7c:   	fcmped	%fcc0, %f26, %f6
	.word	0x32800002	! t0_kref+0x1f80:   	bne,a	_kref+0x1f88
	.word	0xb5a00539	! t0_kref+0x1f84:   	fsqrts	%f25, %f26
	.word	0xda270018	! t0_kref+0x1f88:   	st	%o5, [%i4 + %i0]
	.word	0x9efac014	! t0_kref+0x1f8c:   	sdivcc	%o3, %l4, %o7
	.word	0xa5002f1c	! t0_kref+0x1f90:   	taddcc	%g0, 0xf1c, %l2
	.word	0x35480005	! t0_kref+0x1f94:   	fbue,a,pt	%fcc0, _kref+0x1fa8
	.word	0xaf02ad34	! t0_kref+0x1f98:   	taddcc	%o2, 0xd34, %l7
	.word	0x80b5c008	! t0_kref+0x1f9c:   	orncc	%l7, %o0, %g0
	.word	0xe6780019	! t0_kref+0x1fa0:   	swap	[%g0 + %i1], %l3
	.word	0xa5a40956	! t0_kref+0x1fa4:   	fmuld	%f16, %f22, %f18
	.word	0x81ac4a27	! t0_kref+0x1fa8:   	fcmps	%fcc0, %f17, %f7
	.word	0xbba28837	! t0_kref+0x1fac:   	fadds	%f10, %f23, %f29
	.word	0xe8766008	! t0_kref+0x1fb0:   	stx	%l4, [%i1 + 8]
	.word	0xf13e6000	! t0_kref+0x1fb4:   	std	%f24, [%i1]
	.word	0x94533d5c	! t0_kref+0x1fb8:   	umul	%o4, -0x2a4, %o2
	.word	0xe3b8a040	! t0_kref+0x1fbc:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xa92b4017	! t0_kref+0x1fc0:   	sll	%o5, %l7, %l4
	.word	0x985279e9	! t0_kref+0x1fc4:   	umul	%o1, -0x617, %o4
	.word	0x94e237a4	! t0_kref+0x1fc8:   	subccc	%o0, -0x85c, %o2
	.word	0x9ba00535	! t0_kref+0x1fcc:   	fsqrts	%f21, %f13
	.word	0xda28a02f	! t0_kref+0x1fd0:   	stb	%o5, [%g2 + 0x2f]
	.word	0xd4360000	! t0_kref+0x1fd4:   	sth	%o2, [%i0]
	.word	0x961e8009	! t0_kref+0x1fd8:   	xor	%i2, %o1, %o3
	.word	0x81dbe59b	! t0_kref+0x1fdc:   	flush	%o7 + 0x59b
	.word	0xb9a6482b	! t0_kref+0x1fe0:   	fadds	%f25, %f11, %f28
	.word	0xdd1e7fe0	! t0_kref+0x1fe4:   	ldd	[%i1 - 0x20], %f14
	.word	0x9b35000a	! t0_kref+0x1fe8:   	srl	%l4, %o2, %o5
	.word	0xe8567ff8	! t0_kref+0x1fec:   	ldsh	[%i1 - 8], %l4
	.word	0xae96b8f9	! t0_kref+0x1ff0:   	orcc	%i2, -0x707, %l7
	.word	0x813de014	! t0_kref+0x1ff4:   	sra	%l7, 0x14, %g0
	.word	0xb9a509ce	! t0_kref+0x1ff8:   	fdivd	%f20, %f14, %f28
	.word	0xe26e6011	! t0_kref+0x1ffc:   	ldstub	[%i1 + 0x11], %l1
	.word	0x80326bb7	! t0_kref+0x2000:   	orn	%o1, 0xbb7, %g0
	.word	0xaba348b5	! t0_kref+0x2004:   	fsubs	%f13, %f21, %f21
	.word	0xe13e0000	! t0_kref+0x2008:   	std	%f16, [%i0]
	.word	0xe3f61016	! t0_kref+0x200c:   	casxa	[%i0]0x80, %l6, %l1
	.word	0x81ad8a52	! t0_kref+0x2010:   	fcmpd	%fcc0, %f22, %f18
	.word	0xf1070019	! t0_kref+0x2014:   	ld	[%i4 + %i1], %f24
	.word	0xf900a030	! t0_kref+0x2018:   	ld	[%g2 + 0x30], %f28
	.word	0xa62de10a	! t0_kref+0x201c:   	andn	%l7, 0x10a, %l3
	.word	0xacf2c017	! t0_kref+0x2020:   	udivcc	%o3, %l7, %l6
	.word	0xd8067fe4	! t0_kref+0x2024:   	ld	[%i1 - 0x1c], %o4
	.word	0xae2a37b1	! t0_kref+0x2028:   	andn	%o0, -0x84f, %l7
	.word	0xe2567fe2	! t0_kref+0x202c:   	ldsh	[%i1 - 0x1e], %l1
	.word	0x933de01c	! t0_kref+0x2030:   	sra	%l7, 0x1c, %o1
	call	1f
	.empty
	.word	0xec066000	! t0_kref+0x2038:   	ld	[%i1], %l6
	.word	0x9da2c8af	! t0_kref+0x203c:   	fsubs	%f11, %f15, %f14
	.word	0xb3a4482b	! t0_kref+0x2040:   	fadds	%f17, %f11, %f25
	.word	0xee00a038	! t0_kref+0x2044:   	ld	[%g2 + 0x38], %l7
	.word	0xd8363fe4	! t0_kref+0x2048:   	sth	%o4, [%i0 - 0x1c]
	.word	0x001fffff	! t0_kref+0x204c:   	illtrap	0x1fffff
	.word	0x81ae8ad2	! t0_kref+0x2050:   	fcmped	%fcc0, %f26, %f18
1:	.word	0x81a98a4c	! t0_kref+0x2054:   	fcmpd	%fcc0, %f6, %f12
	.word	0xd06e601e	! t0_kref+0x2058:   	ldstub	[%i1 + 0x1e], %o0
	.word	0x95a38954	! t0_kref+0x205c:   	fmuld	%f14, %f20, %f10
	.word	0xd6de1000	! t0_kref+0x2060:   	ldxa	[%i0]0x80, %o3
	.word	0xee06001c	! t0_kref+0x2064:   	ld	[%i0 + %i4], %l7
	.word	0xe5067fe0	! t0_kref+0x2068:   	ld	[%i1 - 0x20], %f18
	.word	0xb5a489cc	! t0_kref+0x206c:   	fdivd	%f18, %f12, %f26
	.word	0x23480006	! t0_kref+0x2070:   	fbne,a,pt	%fcc0, _kref+0x2088
	.word	0xd2680019	! t0_kref+0x2074:   	ldstub	[%g0 + %i1], %o1
	.word	0x968564c3	! t0_kref+0x2078:   	addcc	%l5, 0x4c3, %o3
	.word	0x9f414000	! t0_kref+0x207c:   	mov	%pc, %o7
	.word	0x80bd000a	! t0_kref+0x2080:   	xnorcc	%l4, %o2, %g0
	.word	0xed9f5018	! t0_kref+0x2084:   	ldda	[%i5 + %i0]0x80, %f22
	.word	0xee48a001	! t0_kref+0x2088:   	ldsb	[%g2 + 1], %l7
	.word	0x8da309c6	! t0_kref+0x208c:   	fdivd	%f12, %f6, %f6
	.word	0x86102004	! t0_kref+0x2090:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x2094:   	bne,a	_kref+0x2094
	.word	0x86a0e001	! t0_kref+0x2098:   	subcc	%g3, 1, %g3
	.word	0x800022a7	! t0_kref+0x209c:   	add	%g0, 0x2a7, %g0
	.word	0x86102002	! t0_kref+0x20a0:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x20a4:   	bne,a	_kref+0x20a4
	.word	0x86a0e001	! t0_kref+0x20a8:   	subcc	%g3, 1, %g3
	.word	0xd5e61009	! t0_kref+0x20ac:   	casa	[%i0]0x80, %o1, %o2
	.word	0x93a01896	! t0_kref+0x20b0:   	fitos	%f22, %f9
	.word	0xec28a018	! t0_kref+0x20b4:   	stb	%l6, [%g2 + 0x18]
	.word	0xd1be1a1b	! t0_kref+0x20b8:   	stda	%f8, [%i0 + %i3]0xd0
	.word	0x3b480003	! t0_kref+0x20bc:   	fble,a,pt	%fcc0, _kref+0x20c8
	.word	0xa075400d	! t0_kref+0x20c0:   	udiv	%l5, %o5, %l0
	.word	0xae2ab896	! t0_kref+0x20c4:   	andn	%o2, -0x76a, %l7
	.word	0xada00526	! t0_kref+0x20c8:   	fsqrts	%f6, %f22
	.word	0xd91fbf98	! t0_kref+0x20cc:   	ldd	[%fp - 0x68], %f12
	.word	0xae2a6170	! t0_kref+0x20d0:   	andn	%o1, 0x170, %l7
	.word	0x80fb250b	! t0_kref+0x20d4:   	sdivcc	%o4, 0x50b, %g0
	.word	0x97a00129	! t0_kref+0x20d8:   	fabss	%f9, %f11
	.word	0xea563ff0	! t0_kref+0x20dc:   	ldsh	[%i0 - 0x10], %l5
	.word	0x81ae0ad0	! t0_kref+0x20e0:   	fcmped	%fcc0, %f24, %f16
	.word	0xe4067fe0	! t0_kref+0x20e4:   	ld	[%i1 - 0x20], %l2
	.word	0xada01a34	! t0_kref+0x20e8:   	fstoi	%f20, %f22
	.word	0x81580000	! t0_kref+0x20ec:   	flushw
	.word	0xfb200018	! t0_kref+0x20f0:   	st	%f29, [%g0 + %i0]
	.word	0xd608a01a	! t0_kref+0x20f4:   	ldub	[%g2 + 0x1a], %o3
	.word	0xa11d22ca	! t0_kref+0x20f8:   	tsubcctv	%l4, 0x2ca, %l0
	.word	0x91400000	! t0_kref+0x20fc:   	mov	%y, %o0
	.word	0xace54000	! t0_kref+0x2100:   	subccc	%l5, %g0, %l6
	.word	0xefa01019	! t0_kref+0x2104:   	sta	%f23, [%g0 + %i1]0x80
	.word	0xe408620c	! t0_kref+0x2108:   	ldub	[%g1 + 0x20c], %l2
	.word	0xa41ca00c	! t0_kref+0x210c:   	xor	%l2, 0xc, %l2
	.word	0xe428620c	! t0_kref+0x2110:   	stb	%l2, [%g1 + 0x20c]
	.word	0x81d8620c	! t0_kref+0x2114:   	flush	%g1 + 0x20c
	.word	0x9302e702	! t0_kref+0x2118:   	taddcc	%o3, 0x702, %o1
	.word	0xe610a000	! t0_kref+0x211c:   	lduh	[%g2], %l3
	.word	0xa8837414	! t0_kref+0x2120:   	addcc	%o5, -0xbec, %l4
	.word	0xf420a028	! t0_kref+0x2124:   	st	%i2, [%g2 + 0x28]
	.word	0xdda61000	! t0_kref+0x2128:   	sta	%f14, [%i0]0x80
	.word	0x9fc10000	! t0_kref+0x212c:   	call	%g4
	.word	0xed1fbf80	! t0_kref+0x2130:   	ldd	[%fp - 0x80], %f22
2:	.word	0xe720a028	! t0_kref+0x2134:   	st	%f19, [%g2 + 0x28]
	.word	0xf1beda58	! t0_kref+0x2138:   	stda	%f24, [%i3 + %i0]0xd2
	.word	0xae1a4016	! t0_kref+0x213c:   	xor	%o1, %l6, %l7
	.word	0xa5a0189c	! t0_kref+0x2140:   	fitos	%f28, %f18
	.word	0xac1b6f29	! t0_kref+0x2144:   	xor	%o5, 0xf29, %l6
	.word	0xa4c2c009	! t0_kref+0x2148:   	addccc	%o3, %o1, %l2
	.word	0x8143c000	! t0_kref+0x214c:   	stbar
	.word	0xedbe101d	! t0_kref+0x2150:   	stda	%f22, [%i0 + %i5]0x80
	.word	0xeb062018	! t0_kref+0x2154:   	ld	[%i0 + 0x18], %f21
	.word	0xb9a7095c	! t0_kref+0x2158:   	fmuld	%f28, %f28, %f28
	.word	0xd810a02c	! t0_kref+0x215c:   	lduh	[%g2 + 0x2c], %o4
	.word	0x81800000	! t0_kref+0x2160:   	mov	%g0, %y
	.word	0x907b62c8	! t0_kref+0x2164:   	sdiv	%o5, 0x2c8, %o0
	.word	0x99a0012a	! t0_kref+0x2168:   	fabss	%f10, %f12
	.word	0x993ae005	! t0_kref+0x216c:   	sra	%o3, 0x5, %o4
	.word	0xa1a0002b	! t0_kref+0x2170:   	fmovs	%f11, %f16
	.word	0x95a409ce	! t0_kref+0x2174:   	fdivd	%f16, %f14, %f10
	.word	0x9ab577e5	! t0_kref+0x2178:   	orncc	%l5, -0x81b, %o5
	.word	0x81d80010	! t0_kref+0x217c:   	flush	%g0 + %l0
	.word	0xd246001c	! t0_kref+0x2180:   	ldsw	[%i0 + %i4], %o1
	.word	0x3f480002	! t0_kref+0x2184:   	fbo,a,pt	%fcc0, _kref+0x218c
	.word	0xa9a78950	! t0_kref+0x2188:   	fmuld	%f30, %f16, %f20
	.word	0xe9f6500a	! t0_kref+0x218c:   	casxa	[%i1]0x80, %o2, %l4
	.word	0xea363fea	! t0_kref+0x2190:   	sth	%l5, [%i0 - 0x16]
	.word	0xb1a58856	! t0_kref+0x2194:   	faddd	%f22, %f22, %f24
	.word	0xe07e0000	! t0_kref+0x2198:   	swap	[%i0], %l0
	.word	0xe448a034	! t0_kref+0x219c:   	ldsb	[%g2 + 0x34], %l2
	.word	0xf11e3fe8	! t0_kref+0x21a0:   	ldd	[%i0 - 0x18], %f24
	.word	0x985ac016	! t0_kref+0x21a4:   	smul	%o3, %l6, %o4
	.word	0x81ae8a4c	! t0_kref+0x21a8:   	fcmpd	%fcc0, %f26, %f12
	.word	0xda0e3fe2	! t0_kref+0x21ac:   	ldub	[%i0 - 0x1e], %o5
	.word	0x2c480007	! t0_kref+0x21b0:   	bneg,a,pt	%icc, _kref+0x21cc
	.word	0xd51fbdb8	! t0_kref+0x21b4:   	ldd	[%fp - 0x248], %f10
	.word	0xda28a015	! t0_kref+0x21b8:   	stb	%o5, [%g2 + 0x15]
	.word	0xa4bac000	! t0_kref+0x21bc:   	xnorcc	%o3, %g0, %l2
	.word	0x81ad8a58	! t0_kref+0x21c0:   	fcmpd	%fcc0, %f22, %f24
	.word	0xe900a03c	! t0_kref+0x21c4:   	ld	[%g2 + 0x3c], %f20
	.word	0x21480006	! t0_kref+0x21c8:   	fbn,a,pt	%fcc0, _kref+0x21e0
	.word	0xe13e6018	! t0_kref+0x21cc:   	std	%f16, [%i1 + 0x18]
	.word	0x9fc70000	! t0_kref+0x21d0:   	call	%i4
	.word	0x81868000	! t0_kref+0x21d4:   	wr	%i2, %g0, %y
	.word	0xa8bb0017	! t0_kref+0x21d8:   	xnorcc	%o4, %l7, %l4
	.word	0x8da3094a	! t0_kref+0x21dc:   	fmuld	%f12, %f10, %f6
	.word	0x99a0013d	! t0_kref+0x21e0:   	fabss	%f29, %f12
	.word	0x81ab0ada	! t0_kref+0x21e4:   	fcmped	%fcc0, %f12, %f26
	.word	0xe06e0000	! t0_kref+0x21e8:   	ldstub	[%i0], %l0
	.word	0xa2034015	! t0_kref+0x21ec:   	add	%o5, %l5, %l1
	.word	0xe408630c	! t0_kref+0x21f0:   	ldub	[%g1 + 0x30c], %l2
	.word	0xa41ca00c	! t0_kref+0x21f4:   	xor	%l2, 0xc, %l2
	.word	0xe428630c	! t0_kref+0x21f8:   	stb	%l2, [%g1 + 0x30c]
	.word	0x81d8630c	! t0_kref+0x21fc:   	flush	%g1 + 0x30c
	.word	0xe656c019	! t0_kref+0x2200:   	ldsh	[%i3 + %i1], %l3
	.word	0xae122475	! t0_kref+0x2204:   	or	%o0, 0x475, %l7
	.word	0xd0366002	! t0_kref+0x2208:   	sth	%o0, [%i1 + 2]
	.word	0xd11fbd48	! t0_kref+0x220c:   	ldd	[%fp - 0x2b8], %f8
	.word	0xf1be1a1a	! t0_kref+0x2210:   	stda	%f24, [%i0 + %i2]0xd0
	.word	0x90fb6438	! t0_kref+0x2214:   	sdivcc	%o5, 0x438, %o0
	.word	0x80e322db	! t0_kref+0x2218:   	subccc	%o4, 0x2db, %g0
	.word	0xda48a000	! t0_kref+0x221c:   	ldsb	[%g2], %o5
	.word	0x81dd0011	! t0_kref+0x2220:   	flush	%l4 + %l1
	.word	0xa9a189de	! t0_kref+0x2224:   	fdivd	%f6, %f30, %f20
	.word	0x34480005	! t0_kref+0x2228:   	bg,a,pt	%icc, _kref+0x223c
	.word	0xd050a03a	! t0_kref+0x222c:   	ldsh	[%g2 + 0x3a], %o0
	.word	0xa67df61a	! t0_kref+0x2230:   	sdiv	%l7, -0x9e6, %l3
2:	.word	0xac758016	! t0_kref+0x2234:   	udiv	%l6, %l6, %l6
	.word	0xee2e3ffa	! t0_kref+0x2238:   	stb	%l7, [%i0 - 6]
	.word	0x86102002	! t0_kref+0x223c:   	mov	0x2, %g3
	.word	0x86a0e001	! t0_kref+0x2240:   	subcc	%g3, 1, %g3
	.word	0x22800002	! t0_kref+0x2244:   	be,a	_kref+0x224c
	.word	0xda7e3ffc	! t0_kref+0x2248:   	swap	[%i0 - 4], %o5
	.word	0x9940c000	! t0_kref+0x224c:   	mov	%asi, %o4
	.word	0x9de3bfa0	! t0_kref+0x2250:   	save	%sp, -0x60, %sp
	.word	0xabee8018	! t0_kref+0x2254:   	restore	%i2, %i0, %l5
	.word	0x96832f26	! t0_kref+0x2258:   	addcc	%o4, 0xf26, %o3
	.word	0xec16201c	! t0_kref+0x225c:   	lduh	[%i0 + 0x1c], %l6
	.word	0xd428a028	! t0_kref+0x2260:   	stb	%o2, [%g2 + 0x28]
	.word	0x81ab8a4e	! t0_kref+0x2264:   	fcmpd	%fcc0, %f14, %f14
	.word	0xe99e5000	! t0_kref+0x2268:   	ldda	[%i1]0x80, %f20
	.word	0xaf2b6000	! t0_kref+0x226c:   	sll	%o5, 0x0, %l7
	.word	0xa6e68016	! t0_kref+0x2270:   	subccc	%i2, %l6, %l3
	.word	0x2f2a9414	! t0_kref+0x2274:   	sethi	%hi(0xaa505000), %l7
	.word	0xa4020017	! t0_kref+0x2278:   	add	%o0, %l7, %l2
	.word	0xf91fbca8	! t0_kref+0x227c:   	ldd	[%fp - 0x358], %f28
	.word	0x8fa01a54	! t0_kref+0x2280:   	fdtoi	%f20, %f7
	.word	0xd4366000	! t0_kref+0x2284:   	sth	%o2, [%i1]
	.word	0xa07e8017	! t0_kref+0x2288:   	sdiv	%i2, %l7, %l0
	.word	0xe2160000	! t0_kref+0x228c:   	lduh	[%i0], %l1
	.word	0x3a800002	! t0_kref+0x2290:   	bcc,a	_kref+0x2298
	.word	0xae658016	! t0_kref+0x2294:   	subc	%l6, %l6, %l7
	.word	0x8143c000	! t0_kref+0x2298:   	stbar
	.word	0x9ba01a27	! t0_kref+0x229c:   	fstoi	%f7, %f13
	.word	0xaf15800b	! t0_kref+0x22a0:   	taddcctv	%l6, %o3, %l7
	.word	0xd2064000	! t0_kref+0x22a4:   	ld	[%i1], %o1
	.word	0xa135400d	! t0_kref+0x22a8:   	srl	%l5, %o5, %l0
	.word	0xd050a006	! t0_kref+0x22ac:   	ldsh	[%g2 + 6], %o0
	.word	0xa7a00529	! t0_kref+0x22b0:   	fsqrts	%f9, %f19
	.word	0xea6e0000	! t0_kref+0x22b4:   	ldstub	[%i0], %l5
	.word	0x95a01030	! t0_kref+0x22b8:   	fstox	%f16, %f10
	.word	0xada64d26	! t0_kref+0x22bc:   	fsmuld	%f25, %f6, %f22
	.word	0x9e3b7982	! t0_kref+0x22c0:   	xnor	%o5, -0x67e, %o7
	.word	0xb9a208d0	! t0_kref+0x22c4:   	fsubd	%f8, %f16, %f28
	.word	0x9fc10000	! t0_kref+0x22c8:   	call	%g4
	.word	0xa6800008	! t0_kref+0x22cc:   	addcc	%g0, %o0, %l3
	.word	0xe2000018	! t0_kref+0x22d0:   	ld	[%g0 + %i0], %l1
	.word	0xb7a0013a	! t0_kref+0x22d4:   	fabss	%f26, %f27
	.word	0xea7e200c	! t0_kref+0x22d8:   	swap	[%i0 + 0xc], %l5
	.word	0xea16201e	! t0_kref+0x22dc:   	lduh	[%i0 + 0x1e], %l5
	.word	0xd66e2013	! t0_kref+0x22e0:   	ldstub	[%i0 + 0x13], %o3
	.word	0xbda70839	! t0_kref+0x22e4:   	fadds	%f28, %f25, %f30
	.word	0xaf400000	! t0_kref+0x22e8:   	mov	%y, %l7
	.word	0x30480007	! t0_kref+0x22ec:   	ba,a,pt	%icc, _kref+0x2308
	.word	0x80ba4017	! t0_kref+0x22f0:   	xnorcc	%o1, %l7, %g0
	.word	0x96aa2457	! t0_kref+0x22f4:   	andncc	%o0, 0x457, %o3
	.word	0xc768a00c	! t0_kref+0x22f8:   	prefetch	%g2 + 0xc, 3
	.word	0xd9be5854	! t0_kref+0x22fc:   	stda	%f12, [%i1 + %l4]0xc2
	.word	0x93a649bd	! t0_kref+0x2300:   	fdivs	%f25, %f29, %f9
	.word	0xdd000019	! t0_kref+0x2304:   	ld	[%g0 + %i1], %f14
	.word	0x95a2884a	! t0_kref+0x2308:   	faddd	%f10, %f10, %f10
	.word	0xe11fbc68	! t0_kref+0x230c:   	ldd	[%fp - 0x398], %f16
	.word	0x810dc014	! t0_kref+0x2310:   	tsubcc	%l7, %l4, %g0
	.word	0xe3b8a040	! t0_kref+0x2314:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xe5b81018	! t0_kref+0x2318:   	stda	%f18, [%g0 + %i0]0x80
	.word	0xa5703056	! t0_kref+0x231c:   	popc	-0xfaa, %l2
	.word	0xa4aa34f9	! t0_kref+0x2320:   	andncc	%o0, -0xb07, %l2
	.word	0x28800007	! t0_kref+0x2324:   	bleu,a	_kref+0x2340
	.word	0xa0600016	! t0_kref+0x2328:   	subc	%g0, %l6, %l0
	.word	0x99a4084c	! t0_kref+0x232c:   	faddd	%f16, %f12, %f12
	.word	0x96fd400b	! t0_kref+0x2330:   	sdivcc	%l5, %o3, %o3
	.word	0xd4160000	! t0_kref+0x2334:   	lduh	[%i0], %o2
	.word	0x9938201b	! t0_kref+0x2338:   	sra	%g0, 0x1b, %o4
	.word	0xaefd0016	! t0_kref+0x233c:   	sdivcc	%l4, %l6, %l7
	.word	0xe2871019	! t0_kref+0x2340:   	lda	[%i4 + %i1]0x80, %l1
	.word	0xc128222c	! t0_kref+0x2344:   	st	%fsr, [%g0 + 0x22c]
	.word	0xda363ffc	! t0_kref+0x2348:   	sth	%o5, [%i0 - 4]
	.word	0xa4bd801a	! t0_kref+0x234c:   	xnorcc	%l6, %i2, %l2
	.word	0xaa0a800a	! t0_kref+0x2350:   	and	%o2, %o2, %l5
	.word	0xed1fbc80	! t0_kref+0x2354:   	ldd	[%fp - 0x380], %f22
	.word	0x1130a117	! t0_kref+0x2358:   	sethi	%hi(0xc2845c00), %o0
	.word	0x8610201c	! t0_kref+0x235c:   	mov	0x1c, %g3
	.word	0x86a0e001	! t0_kref+0x2360:   	subcc	%g3, 1, %g3
	.word	0x22800006	! t0_kref+0x2364:   	be,a	_kref+0x237c
	.word	0x9fa508b2	! t0_kref+0x2368:   	fsubs	%f20, %f18, %f15
	.word	0xada00534	! t0_kref+0x236c:   	fsqrts	%f20, %f22
	.word	0xe81e7ff0	! t0_kref+0x2370:   	ldd	[%i1 - 0x10], %l4
	.word	0x800d7652	! t0_kref+0x2374:   	and	%l5, -0x9ae, %g0
	.word	0xe4df5018	! t0_kref+0x2378:   	ldxa	[%i5 + %i0]0x80, %l2
	.word	0x9de3bfa0	! t0_kref+0x237c:   	save	%sp, -0x60, %sp
	.word	0xba47401a	! t0_kref+0x2380:   	addc	%i5, %i2, %i5
	.word	0xabef401d	! t0_kref+0x2384:   	restore	%i5, %i5, %l5
	.word	0xf93e3fe8	! t0_kref+0x2388:   	std	%f28, [%i0 - 0x18]
	.word	0x2d480005	! t0_kref+0x238c:   	fbg,a,pt	%fcc0, _kref+0x23a0
	.word	0xaa95f991	! t0_kref+0x2390:   	orcc	%l7, -0x66f, %l5
	.word	0x24480008	! t0_kref+0x2394:   	ble,a,pt	%icc, _kref+0x23b4
	.word	0xa1a01895	! t0_kref+0x2398:   	fitos	%f21, %f16
	.word	0xa13a4016	! t0_kref+0x239c:   	sra	%o1, %l6, %l0
	.word	0x80faab05	! t0_kref+0x23a0:   	sdivcc	%o2, 0xb05, %g0
	.word	0xa9a01046	! t0_kref+0x23a4:   	fdtox	%f6, %f20
	.word	0x9138000b	! t0_kref+0x23a8:   	sra	%g0, %o3, %o0
	.word	0xa63ebe34	! t0_kref+0x23ac:   	xnor	%i2, -0x1cc, %l3
	.word	0x35800006	! t0_kref+0x23b0:   	fbue,a	_kref+0x23c8
	.word	0xab418000	! t0_kref+0x23b4:   	mov	%fprs, %l5
	.word	0x3d480001	! t0_kref+0x23b8:   	fbule,a,pt	%fcc0, _kref+0x23bc
	.word	0x913b200b	! t0_kref+0x23bc:   	sra	%o4, 0xb, %o0
	.word	0x81dc4016	! t0_kref+0x23c0:   	flush	%l1 + %l6
	.word	0x25800008	! t0_kref+0x23c4:   	fblg,a	_kref+0x23e4
	.word	0xa7a01a2a	! t0_kref+0x23c8:   	fstoi	%f10, %f19
	.word	0xaba01a3a	! t0_kref+0x23cc:   	fstoi	%f26, %f21
	.word	0x9073001a	! t0_kref+0x23d0:   	udiv	%o4, %i2, %o0
	.word	0xda7f0018	! t0_kref+0x23d4:   	swap	[%i4 + %i0], %o5
	.word	0x91a0110a	! t0_kref+0x23d8:   	fxtod	%f10, %f8
	.word	0xe1f6101a	! t0_kref+0x23dc:   	casxa	[%i0]0x80, %i2, %l0
	.word	0x8da5882e	! t0_kref+0x23e0:   	fadds	%f22, %f14, %f6
	.word	0xb5a01911	! t0_kref+0x23e4:   	fitod	%f17, %f26
	call	SYM(t0_subr3)
	.word	0xb1a6c8a9	! t0_kref+0x23ec:   	fsubs	%f27, %f9, %f24
	.word	0x9a9dabd9	! t0_kref+0x23f0:   	xorcc	%l6, 0xbd9, %o5
	.word	0xd9380018	! t0_kref+0x23f4:   	std	%f12, [%g0 + %i0]
	.word	0x81ac8ac8	! t0_kref+0x23f8:   	fcmped	%fcc0, %f18, %f8
	.word	0xfd00a038	! t0_kref+0x23fc:   	ld	[%g2 + 0x38], %f30
	.word	0x8143c000	! t0_kref+0x2400:   	stbar
	.word	0x80c0000b	! t0_kref+0x2404:   	addccc	%g0, %o3, %g0
	.word	0x9de3bfa0	! t0_kref+0x2408:   	save	%sp, -0x60, %sp
	.word	0xb496a675	! t0_kref+0x240c:   	orcc	%i2, 0x675, %i2
	.word	0x93e8001c	! t0_kref+0x2410:   	restore	%g0, %i4, %o1
	.word	0x81ac8a58	! t0_kref+0x2414:   	fcmpd	%fcc0, %f18, %f24
	.word	0x9fa018cc	! t0_kref+0x2418:   	fdtos	%f12, %f15
	.word	0x29480006	! t0_kref+0x241c:   	fbl,a,pt	%fcc0, _kref+0x2434
	.word	0xa5a54d28	! t0_kref+0x2420:   	fsmuld	%f21, %f8, %f18
	.word	0xeb68a04b	! t0_kref+0x2424:   	prefetch	%g2 + 0x4b, 21
	.word	0xafa00526	! t0_kref+0x2428:   	fsqrts	%f6, %f23
	.word	0xe010a00c	! t0_kref+0x242c:   	lduh	[%g2 + 0xc], %l0
	.word	0x9203778e	! t0_kref+0x2430:   	add	%o5, -0x872, %o1
	.word	0xa5a38948	! t0_kref+0x2434:   	fmuld	%f14, %f8, %f18
	.word	0xc07e4000	! t0_kref+0x2438:   	swap	[%i1], %g0
	.word	0xa723001a	! t0_kref+0x243c:   	mulscc	%o4, %i2, %l3
	.word	0x81db7ae2	! t0_kref+0x2440:   	flush	%o5 - 0x51e
	.word	0xd91fbd90	! t0_kref+0x2444:   	ldd	[%fp - 0x270], %f12
	.word	0xe0063ff0	! t0_kref+0x2448:   	ld	[%i0 - 0x10], %l0
	.word	0x3f800001	! t0_kref+0x244c:   	fbo,a	_kref+0x2450
	.word	0xee6e401a	! t0_kref+0x2450:   	ldstub	[%i1 + %i2], %l7
	.word	0xec6e4000	! t0_kref+0x2454:   	ldstub	[%i1], %l6
	.word	0x9135200a	! t0_kref+0x2458:   	srl	%l4, 0xa, %o0
	.word	0xd416601c	! t0_kref+0x245c:   	lduh	[%i1 + 0x1c], %o2
	.word	0x9a2a3f0f	! t0_kref+0x2460:   	andn	%o0, -0xf1, %o5
	.word	0x93a01a34	! t0_kref+0x2464:   	fstoi	%f20, %f9
	.word	0x20480005	! t0_kref+0x2468:   	bn,a,pt	%icc, _kref+0x247c
	.word	0x8d832da2	! t0_kref+0x246c:   	wr	%o4, 0xda2, %fprs
	.word	0xae15c000	! t0_kref+0x2470:   	or	%l7, %g0, %l7
	.word	0xf007bfe0	! t0_kref+0x2474:   	ld	[%fp - 0x20], %i0
	.word	0x2e800003	! t0_kref+0x2478:   	bvs,a	_kref+0x2484
	.word	0x8143c000	! t0_kref+0x247c:   	stbar
	.word	0x90fa400c	! t0_kref+0x2480:   	sdivcc	%o1, %o4, %o0
	.word	0xd8200018	! t0_kref+0x2484:   	st	%o4, [%g0 + %i0]
	.word	0xd27e7ff4	! t0_kref+0x2488:   	swap	[%i1 - 0xc], %o1
	.word	0xd256c000	! t0_kref+0x248c:   	ldsh	[%i3], %o1
	.word	0xd6260000	! t0_kref+0x2490:   	st	%o3, [%i0]
	.word	0xa53e8016	! t0_kref+0x2494:   	sra	%i2, %l6, %l2
	.word	0xa245e575	! t0_kref+0x2498:   	addc	%l7, 0x575, %l1
	.word	0x9eb37b8c	! t0_kref+0x249c:   	orncc	%o5, -0x474, %o7
	.word	0xb1a01a3a	! t0_kref+0x24a0:   	fstoi	%f26, %f24
	.word	0xec00a00c	! t0_kref+0x24a4:   	ld	[%g2 + 0xc], %l6
	.word	0xee063ffc	! t0_kref+0x24a8:   	ld	[%i0 - 4], %l7
	.word	0xdd1fbdc0	! t0_kref+0x24ac:   	ldd	[%fp - 0x240], %f14
	.word	0x95a248ad	! t0_kref+0x24b0:   	fsubs	%f9, %f13, %f10
	.word	0x9fa5083a	! t0_kref+0x24b4:   	fadds	%f20, %f26, %f15
	.word	0xaf350017	! t0_kref+0x24b8:   	srl	%l4, %l7, %l7
	sethi	%hi(1f), %o7
	jmpl	%o7+%lo(1f), %g1
	.empty
	.word	0xa6fac015	! t0_kref+0x24c4:   	sdivcc	%o3, %l5, %l3
	.word	0xd0be1000	! t0_kref+0x24c8:   	stda	%o0, [%i0]0x80
	.word	0x9ada801a	! t0_kref+0x24cc:   	smulcc	%o2, %i2, %o5
	.word	0xde50a020	! t0_kref+0x24d0:   	ldsh	[%g2 + 0x20], %o7
	.word	0x9132e00e	! t0_kref+0x24d4:   	srl	%o3, 0xe, %o0
1:	.word	0x9da00050	! t0_kref+0x24d8:   	fmovd	%f16, %f14
	.word	0x9fc00004	! t0_kref+0x24dc:   	call	%g0 + %g4
	.word	0xd64e600a	! t0_kref+0x24e0:   	ldsb	[%i1 + 0xa], %o3
	.word	0xee062000	! t0_kref+0x24e4:   	ld	[%i0], %l7
	.word	0x945b298e	! t0_kref+0x24e8:   	smul	%o4, 0x98e, %o2
	.word	0xe26e0000	! t0_kref+0x24ec:   	ldstub	[%i0], %l1
	.word	0x8052bb87	! t0_kref+0x24f0:   	umul	%o2, -0x479, %g0
	.word	0xe13e7ff8	! t0_kref+0x24f4:   	std	%f16, [%i1 - 8]
	.word	0x2e800004	! t0_kref+0x24f8:   	bvs,a	_kref+0x2508
	.word	0x96f30000	! t0_kref+0x24fc:   	udivcc	%o4, %g0, %o3
	.word	0xb5a788c6	! t0_kref+0x2500:   	fsubd	%f30, %f6, %f26
	.word	0xa42d000a	! t0_kref+0x2504:   	andn	%l4, %o2, %l2
	.word	0xd93e7ff0	! t0_kref+0x2508:   	std	%f12, [%i1 - 0x10]
	.word	0x9de3bfa0	! t0_kref+0x250c:   	save	%sp, -0x60, %sp
	.word	0x97ee7993	! t0_kref+0x2510:   	restore	%i1, -0x66d, %o3
	.word	0x913b000d	! t0_kref+0x2514:   	sra	%o4, %o5, %o0
	.word	0x9a3031df	! t0_kref+0x2518:   	orn	%g0, -0xe21, %o5
	.word	0x9fa018da	! t0_kref+0x251c:   	fdtos	%f26, %f15
	.word	0xd86e8019	! t0_kref+0x2520:   	ldstub	[%i2 + %i1], %o4
	.word	0xa45a8009	! t0_kref+0x2524:   	smul	%o2, %o1, %l2
	.word	0x37800007	! t0_kref+0x2528:   	fbge,a	_kref+0x2544
	.word	0xcd06001c	! t0_kref+0x252c:   	ld	[%i0 + %i4], %f6
	.word	0xa1a0191a	! t0_kref+0x2530:   	fitod	%f26, %f16
	.word	0xe3b8a040	! t0_kref+0x2534:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xd6260000	! t0_kref+0x2538:   	st	%o3, [%i0]
	.word	0xb5a01909	! t0_kref+0x253c:   	fitod	%f9, %f26
	.word	0xea7e3ff0	! t0_kref+0x2540:   	swap	[%i0 - 0x10], %l5
	.word	0xc0063ff8	! t0_kref+0x2544:   	ld	[%i0 - 8], %g0
	.word	0xe210a03a	! t0_kref+0x2548:   	lduh	[%g2 + 0x3a], %l1
	.word	0x81ab0a27	! t0_kref+0x254c:   	fcmps	%fcc0, %f12, %f7
	.word	0xad02bc3b	! t0_kref+0x2550:   	taddcc	%o2, -0x3c5, %l6
	.word	0x9de3bfa0	! t0_kref+0x2554:   	save	%sp, -0x60, %sp
	.word	0xb82777cd	! t0_kref+0x2558:   	sub	%i5, -0x833, %i4
	.word	0xa9e8001d	! t0_kref+0x255c:   	restore	%g0, %i5, %l4
	.word	0x81aa8acc	! t0_kref+0x2560:   	fcmped	%fcc0, %f10, %f12
	.word	0x952d201a	! t0_kref+0x2564:   	sll	%l4, 0x1a, %o2
	.word	0x29480008	! t0_kref+0x2568:   	fbl,a,pt	%fcc0, _kref+0x2588
	.word	0x8182c000	! t0_kref+0x256c:   	wr	%o3, %g0, %y
	.word	0xea48a01a	! t0_kref+0x2570:   	ldsb	[%g2 + 0x1a], %l5
	.word	0xe3b8a040	! t0_kref+0x2574:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x81ad8a33	! t0_kref+0x2578:   	fcmps	%fcc0, %f22, %f19
	.word	0xe47f0019	! t0_kref+0x257c:   	swap	[%i4 + %i1], %l2
	.word	0x90a2bc42	! t0_kref+0x2580:   	subcc	%o2, -0x3be, %o0
	.word	0x92fe800b	! t0_kref+0x2584:   	sdivcc	%i2, %o3, %o1
	.word	0xb9a018d6	! t0_kref+0x2588:   	fdtos	%f22, %f28
	.word	0xaf22000c	! t0_kref+0x258c:   	mulscc	%o0, %o4, %l7
	.word	0xd99f5018	! t0_kref+0x2590:   	ldda	[%i5 + %i0]0x80, %f12
	.word	0xdd3e401d	! t0_kref+0x2594:   	std	%f14, [%i1 + %i5]
	.word	0x9b3a2011	! t0_kref+0x2598:   	sra	%o0, 0x11, %o5
	.word	0x86102004	! t0_kref+0x259c:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x25a0:   	bne,a	_kref+0x25a0
	.word	0x86a0e001	! t0_kref+0x25a4:   	subcc	%g3, 1, %g3
	.word	0x903d8017	! t0_kref+0x25a8:   	xnor	%l6, %l7, %o0
	.word	0x9b3a6010	! t0_kref+0x25ac:   	sra	%o1, 0x10, %o5
	.word	0xf11fbf98	! t0_kref+0x25b0:   	ldd	[%fp - 0x68], %f24
	.word	0x92750009	! t0_kref+0x25b4:   	udiv	%l4, %o1, %o1
	.word	0x9605c00d	! t0_kref+0x25b8:   	add	%l7, %o5, %o3
	.word	0x91a00058	! t0_kref+0x25bc:   	fmovd	%f24, %f8
	.word	0xe1060000	! t0_kref+0x25c0:   	ld	[%i0], %f16
	.word	0xf126001c	! t0_kref+0x25c4:   	st	%f24, [%i0 + %i4]
	.word	0x86102003	! t0_kref+0x25c8:   	mov	0x3, %g3
	.word	0x86a0e001	! t0_kref+0x25cc:   	subcc	%g3, 1, %g3
	.word	0x22800009	! t0_kref+0x25d0:   	be,a	_kref+0x25f4
	.word	0xae7b0017	! t0_kref+0x25d4:   	sdiv	%o4, %l7, %l7
	.word	0xec28a000	! t0_kref+0x25d8:   	stb	%l6, [%g2]
	.word	0x8da74d33	! t0_kref+0x25dc:   	fsmuld	%f29, %f19, %f6
	.word	0x8da01a54	! t0_kref+0x25e0:   	fdtoi	%f20, %f6
	.word	0xa8e6b38a	! t0_kref+0x25e4:   	subccc	%i2, -0xc76, %l4
	.word	0xbda18854	! t0_kref+0x25e8:   	faddd	%f6, %f20, %f30
	.word	0xd24e4000	! t0_kref+0x25ec:   	ldsb	[%i1], %o1
	.word	0x94f54008	! t0_kref+0x25f0:   	udivcc	%l5, %o0, %o2
	.word	0xd59e105d	! t0_kref+0x25f4:   	ldda	[%i0 + %i5]0x82, %f10
	.word	0x33800007	! t0_kref+0x25f8:   	fbe,a	_kref+0x2614
	.word	0xaafa800c	! t0_kref+0x25fc:   	sdivcc	%o2, %o4, %l5
	.word	0x94e2000b	! t0_kref+0x2600:   	subccc	%o0, %o3, %o2
	.word	0x2f480008	! t0_kref+0x2604:   	fbu,a,pt	%fcc0, _kref+0x2624
	.word	0xd1beda18	! t0_kref+0x2608:   	stda	%f8, [%i3 + %i0]0xd0
	.word	0xefee501c	! t0_kref+0x260c:   	prefetcha	%i1 + %i4, 23
	.word	0xd056200a	! t0_kref+0x2610:   	ldsh	[%i0 + 0xa], %o0
	.word	0x99a509d8	! t0_kref+0x2614:   	fdivd	%f20, %f24, %f12
	.word	0xd3066008	! t0_kref+0x2618:   	ld	[%i1 + 8], %f9
	.word	0xe06e3fe1	! t0_kref+0x261c:   	ldstub	[%i0 - 0x1f], %l0
	.word	0x8fa4c8bb	! t0_kref+0x2620:   	fsubs	%f19, %f27, %f7
	.word	0x28800007	! t0_kref+0x2624:   	bleu,a	_kref+0x2640
	.word	0xa1a01a28	! t0_kref+0x2628:   	fstoi	%f8, %f16
	.word	0xa3a01a29	! t0_kref+0x262c:   	fstoi	%f9, %f17
	.word	0x81ae0a56	! t0_kref+0x2630:   	fcmpd	%fcc0, %f24, %f22
	.word	0xea162006	! t0_kref+0x2634:   	lduh	[%i0 + 6], %l5
	.word	0x9002a86a	! t0_kref+0x2638:   	add	%o2, 0x86a, %o0
	.word	0xb9a50d31	! t0_kref+0x263c:   	fsmuld	%f20, %f17, %f28
	.word	0xae553235	! t0_kref+0x2640:   	umul	%l4, -0xdcb, %l7
	.word	0x9b32800b	! t0_kref+0x2644:   	srl	%o2, %o3, %o5
	.word	0xa9a38850	! t0_kref+0x2648:   	faddd	%f14, %f16, %f20
	.word	0xb3a0052c	! t0_kref+0x264c:   	fsqrts	%f12, %f25
	.word	0xafa00532	! t0_kref+0x2650:   	fsqrts	%f18, %f23
	call	SYM(t0_subr1)
	.word	0x212b39e9	! t0_kref+0x2658:   	sethi	%hi(0xace7a400), %l0
	.word	0xada58d30	! t0_kref+0x265c:   	fsmuld	%f22, %f16, %f22
	.word	0x9925800b	! t0_kref+0x2660:   	mulscc	%l6, %o3, %o4
	.word	0xa4768014	! t0_kref+0x2664:   	udiv	%i2, %l4, %l2
	.word	0xaa7b6c17	! t0_kref+0x2668:   	sdiv	%o5, 0xc17, %l5
	.word	0x9de3bfa0	! t0_kref+0x266c:   	save	%sp, -0x60, %sp
	.word	0x93e80018	! t0_kref+0x2670:   	restore	%g0, %i0, %o1
	.word	0xac3d800c	! t0_kref+0x2674:   	xnor	%l6, %o4, %l6
	.word	0xeafe101c	! t0_kref+0x2678:   	swapa	[%i0 + %i4]0x80, %l5
	.word	0xe3e61016	! t0_kref+0x267c:   	casa	[%i0]0x80, %l6, %l1
	.word	0xe016c019	! t0_kref+0x2680:   	lduh	[%i3 + %i1], %l0
	.word	0x9686a8b1	! t0_kref+0x2684:   	addcc	%i2, 0x8b1, %o3
	.word	0xa9a0191c	! t0_kref+0x2688:   	fitod	%f28, %f20
	.word	0xa1a7092e	! t0_kref+0x268c:   	fmuls	%f28, %f14, %f16
	.word	0xe67e3ff0	! t0_kref+0x2690:   	swap	[%i0 - 0x10], %l3
	.word	0x98802e5c	! t0_kref+0x2694:   	addcc	%g0, 0xe5c, %o4
	.word	0xa5a0191c	! t0_kref+0x2698:   	fitod	%f28, %f18
	.word	0xf51fbe10	! t0_kref+0x269c:   	ldd	[%fp - 0x1f0], %f26
	.word	0xcf070018	! t0_kref+0x26a0:   	ld	[%i4 + %i0], %f7
	.word	0x31480005	! t0_kref+0x26a4:   	fba,a,pt	%fcc0, _kref+0x26b8
	.word	0x97080009	! t0_kref+0x26a8:   	tsubcc	%g0, %o1, %o3
	.word	0xd6f81018	! t0_kref+0x26ac:   	swapa	[%g0 + %i0]0x80, %o3
	.word	0xa03a7b87	! t0_kref+0x26b0:   	xnor	%o1, -0x479, %l0
	.word	0x8102aa56	! t0_kref+0x26b4:   	taddcc	%o2, 0xa56, %g0
	.word	0x9712400c	! t0_kref+0x26b8:   	taddcctv	%o1, %o4, %o3
	call	SYM(t0_subr3)
	.word	0x81824000	! t0_kref+0x26c0:   	wr	%o1, %g0, %y
	.word	0xa260305d	! t0_kref+0x26c4:   	subc	%g0, -0xfa3, %l1
	.word	0x28800004	! t0_kref+0x26c8:   	bleu,a	_kref+0x26d8
	.word	0xaf400000	! t0_kref+0x26cc:   	mov	%y, %l7
	.word	0xf500a028	! t0_kref+0x26d0:   	ld	[%g2 + 0x28], %f26
	.word	0x921a36be	! t0_kref+0x26d4:   	xor	%o0, -0x942, %o1
	.word	0x13349e5a	! t0_kref+0x26d8:   	sethi	%hi(0xd2796800), %o1
	.word	0x8da018d0	! t0_kref+0x26dc:   	fdtos	%f16, %f6
	.word	0x81af0a5c	! t0_kref+0x26e0:   	fcmpd	%fcc0, %f28, %f28
	.word	0xe4000019	! t0_kref+0x26e4:   	ld	[%g0 + %i1], %l2
	.word	0xe8166010	! t0_kref+0x26e8:   	lduh	[%i1 + 0x10], %l4
	.word	0x2c800003	! t0_kref+0x26ec:   	bneg,a	_kref+0x26f8
	.word	0xb9a78832	! t0_kref+0x26f0:   	fadds	%f30, %f18, %f28
	.word	0xada0013b	! t0_kref+0x26f4:   	fabss	%f27, %f22
	.word	0x9a150014	! t0_kref+0x26f8:   	or	%l4, %l4, %o5
	.word	0xda6e7ff6	! t0_kref+0x26fc:   	ldstub	[%i1 - 0xa], %o5
	.word	0xa4fa4000	! t0_kref+0x2700:   	sdivcc	%o1, %g0, %l2
	.word	0x96436da1	! t0_kref+0x2704:   	addc	%o5, 0xda1, %o3
	.word	0xb9a5cd30	! t0_kref+0x2708:   	fsmuld	%f23, %f16, %f28
	.word	0xa4ad0015	! t0_kref+0x270c:   	andncc	%l4, %l5, %l2
	.word	0xb1a0191c	! t0_kref+0x2710:   	fitod	%f28, %f24
	.word	0xcd1e401d	! t0_kref+0x2714:   	ldd	[%i1 + %i5], %f6
	.word	0xd84e7ffd	! t0_kref+0x2718:   	ldsb	[%i1 - 3], %o4
	.word	0xa1a00126	! t0_kref+0x271c:   	fabss	%f6, %f16
	.word	0xa013400b	! t0_kref+0x2720:   	or	%o5, %o3, %l0
	.word	0xd300a020	! t0_kref+0x2724:   	ld	[%g2 + 0x20], %f9
	.word	0xd820a020	! t0_kref+0x2728:   	st	%o4, [%g2 + 0x20]
	.word	0xed3e0000	! t0_kref+0x272c:   	std	%f22, [%i0]
	.word	0xbda00046	! t0_kref+0x2730:   	fmovd	%f6, %f30
	.word	0xe408a002	! t0_kref+0x2734:   	ldub	[%g2 + 2], %l2
	.word	0x9002000d	! t0_kref+0x2738:   	add	%o0, %o5, %o0
	.word	0xa0c5efb9	! t0_kref+0x273c:   	addccc	%l7, 0xfb9, %l0
	.word	0xac32800a	! t0_kref+0x2740:   	orn	%o2, %o2, %l6
	call	SYM(_kaos_done)
	.word	0x01000000	! t0_kref+0x2748:   	nop
	KGLOBAL(t0_ktbl_end)
t0_ktbl_end:
t0_ktbl_page_end:

KTEXT_MODULE(t0_module_subr0, 0x57dc0000)
.seg "text"
t0_subr0_page_begin:
	.skip 8184
.global _t0_subr0; ENTRY(t0_subr0)
	.word	0xa6844012	! t0_subr0+0x0:   	addcc	%l1, %l2, %l3
	.word	0x81c3e008	! t0_subr0+0x4:   	retl
	.word	0xaa64c014	! t0_subr0+0x8:   	subc	%l3, %l4, %l5
t0_subr0_page_end:

KTEXT_MODULE(t0_module_subr1, 0x57dc6000)
.seg "text"
t0_subr1_page_begin:
	.skip 8188
.global _t0_subr1; ENTRY(t0_subr1)
	.word	0x9de3bfa0	! t0_subr1+0x0:   	save	%sp, -0x60, %sp
	.word	0xb29eaa5a	! t0_subr1+0x4:   	xorcc	%i2, 0xa5a, %i1
	.word	0x81c7e008	! t0_subr1+0x8:   	ret
	.word	0xa7ee6001	! t0_subr1+0xc:   	restore	%i1, 1, %l3
t0_subr1_page_end:

KTEXT_MODULE(t0_module_subr2, 0x580a2000)
.seg "text"
t0_subr2_page_begin:
	.skip 8192
.global _t0_subr2; ENTRY(t0_subr2)
	.word	0x9de3bfa0	! t0_subr2+0x0:   	save	%sp, -0x60, %sp
	.word	0xb2066001	! t0_subr2+0x4:   	add	%i1, 1, %i1
	.word	0x81c7e008	! t0_subr2+0x8:   	ret
	.word	0xa3ee6001	! t0_subr2+0xc:   	restore	%i1, 1, %l1
t0_subr2_page_end:

KTEXT_MODULE(t0_module_subr3, 0x73170000)
.seg "text"
t0_subr3_page_begin:
	.skip 8140
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
!  Total operations: 2389  
!
!  Operation frequencies
!
!  name               exp    obs
!  ldsb              0.76   0.59
!  ldub              0.59   0.92
!  ldsh              1.29   1.26
!  lduh              1.16   1.26
!  ld                1.20   1.30
!  ldd               0.34   0.33
!  swap              1.27   1.21
!  ldstub            1.47   1.26
!  stb               0.64   0.50
!  sth               0.76   0.88
!  st                0.73   0.96
!  std               0.13   0.08
!  add               0.94   1.26
!  addcc             0.90   1.09
!  addx              1.09   0.92
!  addxcc            1.42   1.09
!  taddcc            0.29   0.50
!  taddcctv          0.28   0.13
!  sub               0.09   0.04
!  subcc             0.33   0.29
!  subx              0.46   0.59
!  subxcc            0.76   0.59
!  tsubcc            0.23   0.25
!  tsubcctv          0.19   0.33
!  mulscc            0.40   0.63
!  and               0.70   0.84
!  andcc             0.12   0.04
!  andn              1.08   1.26
!  andncc            0.50   0.67
!  or                0.47   0.80
!  orcc              0.29   0.33
!  orn               0.78   0.67
!  orncc             0.19   0.17
!  xor               1.43   1.47
!  xorcc             0.29   0.29
!  xnor              1.15   1.17
!  xnorcc            1.00   1.26
!  sll               1.07   1.00
!  srl               0.96   1.17
!  sra               1.27   1.42
!  unimp             0.22   0.21
!  umul              0.51   0.59
!  smul              0.60   0.59
!  udiv              0.88   1.17
!  sdiv              1.00   1.13
!  umulcc            0.04   0.00
!  smulcc            0.85   0.71
!  udivcc            0.56   0.80
!  sdivcc            1.45   2.05
!  rdy               0.30   0.54
!  wry               0.96   0.92
!  bicc              2.90   2.43
!  sethi             1.11   1.13
!  jmpl              1.48   1.38
!  call              1.28   0.96
!  ticc              0.00   0.00
!  flush             1.05   1.17
!  save              1.41   1.00
!  restore           0.41   0.00
!  stbar             0.64   0.63
!  ldf               1.22   1.26
!  lddf              1.13   1.30
!  stf               0.11   0.25
!  stdf              1.34   1.55
!  fadds             1.11   1.38
!  fsubs             1.37   1.97
!  fmuls             0.35   0.42
!  fdivs             0.28   0.38
!  faddd             1.30   1.34
!  fsubd             0.42   0.46
!  fmuld             0.98   0.96
!  fdivd             0.88   0.92
!  faddq             0.00   0.00
!  fsubq             0.00   0.00
!  fmulq             0.00   0.00
!  fdivq             0.00   0.00
!  fsmuld            0.84   1.05
!  fdmulq            0.00   0.00
!  fitos             1.02   0.88
!  fitod             0.92   0.96
!  fitoq             0.00   0.00
!  fstoi             1.31   1.76
!  fstod             0.15   0.13
!  fstoq             0.00   0.00
!  fdtoi             0.34   0.42
!  fdtos             1.03   1.21
!  fdtoq             0.00   0.00
!  fqtoi             0.00   0.00
!  fqtos             0.00   0.00
!  fqtod             0.00   0.00
!  fmovs             1.10   0.84
!  fnegs             0.20   0.13
!  fabss             0.64   0.84
!  fsqrts            1.85   2.01
!  fsqrtd            0.00   0.00
!  fsqrtq            0.00   0.00
!  fcmps             0.50   0.67
!  fcmpd             1.03   0.67
!  fcmpq             0.00   0.00
!  fcmpes            0.05   0.08
!  fcmped            1.08   0.71
!  fcmpeq            0.00   0.00
!  fbfcc             0.91   0.84
!  ldfsr             0.20   0.00
!  stfsr             0.29   0.21
!  loop              1.31   1.09
!  offset            0.15   0.00
!  area              0.21   0.21
!  target            0.09   0.04
!  goto              0.27   0.38
!  sigsegv           0.27   0.33
!  sigbus            0.02   0.00
!  imodify           0.59   0.42
!  ldfsr_offset      0.27   0.00
!  fpattern          0.79   1.55
!  lbranch           0.02   0.00
!  shmld             5.27   5.32
!  shmst             2.59   2.01
!  shmpf             0.80   0.80
!  shmswap           0.01   0.04
!  shmblkld          0.91   0.00
!  shmblkst          1.00   0.75
!  shmblkchk         0.25   0.21
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
!  casa              0.16   0.13
!  rdasi             0.10   0.21
!  wrasi             0.05   0.04
!  bpcc              1.70   1.13
!  fbpfcc            3.00   2.43
!  fmovscc           0.12   0.00
!  fmovdcc           0.23   0.29
!  fmovqcc           0.00   0.00
!  movcc             0.06   0.08
!  flushw            0.14   0.17
!  membar            0.11   0.08
!  prefetch          0.13   0.04
!  rdpc              0.17   0.33
!  ldqf              0.00   0.00
!  stqf              0.00   0.00
!  ldfa              0.21   0.13
!  lddfa             0.18   0.17
!  ldqfa             0.00   0.00
!  ldsba             0.25   0.25
!  ldsha             0.01   0.04
!  lduba             0.03   0.00
!  lduha             0.04   0.04
!  lda               0.26   0.33
!  ldda              0.10   0.17
!  ldstuba           0.23   0.25
!  prefetcha         0.37   0.50
!  stfa              0.21   0.17
!  stdfa             0.23   0.33
!  stqfa             0.00   0.00
!  stba              0.17   0.13
!  stha              0.23   0.21
!  sta               0.14   0.25
!  stda              0.18   0.17
!  swapa             0.16   0.29
!  fmovd             0.24   0.21
!  fnegd             0.27   0.21
!  fabsd             0.06   0.04
!  fstox             0.16   0.21
!  fdtox             0.10   0.13
!  fxtos             0.28   0.17
!  fxtod             0.28   0.46
!  lds               0.13   0.17
!  ldsa              0.19   0.13
!  ldx               0.12   0.04
!  ldxa              0.29   0.21
!  nofault           0.22   0.33
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
!  partial_st8       0.19   0.04
!  partial_st16      0.14   0.17
!  partial_st32      0.13   0.08
!  short_st8         0.24   0.25
!  short_st16        0.18   0.29
!  short_ld8         0.22   0.33
!  short_ld16        0.05   0.00
!  blkld             0.01   0.00
!  blkst             0.23   0.00
!  blkld_offset      0.04   0.00
!  blkst_offset      0.18   0.00
!  blk_check         0.19   0.00
!  casxa             0.27   0.29
!  rdccr             0.00   0.00
!  rdfprs            0.16   0.13
!  wrccr             0.21   0.04
!  popc              0.25   0.17
!  wrfprs            0.25   0.17
!  stx               0.20   0.33
!  stxa              0.11   0.08
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
KDATA_MODULE(t0_module_offset_table, 0x4f32c000)
.seg "data"
t0_offset_table_start:
t0_offset_table_size:	.word	0x00000008
t0_offset_table:
	.word	0xfffffff0
	.word	0xfffffff8
	.word	0x00000008
	.word	0x00000000
	.word	0x00000018
	.word	0xffffffe0
	.word	0xffffffe8
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

KDATA_MODULE(t0_module_data_in_regs, 0x1f7e2000)
.seg "data"
KGLOBAL(t0_data_in_regs)
t0_data_in_regs_start:
t0_data_in_regs:
	.word	0xd49a486e          ! %f0
	.word	0xd4522729          ! %f1
	.word	0x13466c69          ! %f2
	.word	0xb02c71ef          ! %f3
	.word	0xcb3218c6          ! %f4
	.word	0x26836df9          ! %f5
	.word	0x63688b35          ! %f6
	.word	0xc6e6f1aa          ! %f7
	.word	0xe61a1f4c          ! %f8
	.word	0xcf393117          ! %f9
	.word	0x6c46e50e          ! %f10
	.word	0x54935608          ! %f11
	.word	0x3743cf41          ! %f12
	.word	0x9633b4d1          ! %f13
	.word	0x10b5d388          ! %f14
	.word	0xf6de237b          ! %f15
	.word	0xfd3f3994          ! %f16
	.word	0xdfc33add          ! %f17
	.word	0x3bf90bf5          ! %f18
	.word	0xdf40f589          ! %f19
	.word	0xbdd67450          ! %f20
	.word	0x96d546c1          ! %f21
	.word	0x390b95fa          ! %f22
	.word	0x4c9f73d0          ! %f23
	.word	0x69b38555          ! %f24
	.word	0xe1674475          ! %f25
	.word	0x6058175e          ! %f26
	.word	0xd6501349          ! %f27
	.word	0x4f6dc44a          ! %f28
	.word	0x882a7546          ! %f29
	.word	0x99898925          ! %f30
	.word	0x7b1927d0          ! %f31
	.word	0x78b6e7d1          ! %f32
	.word	0x607f46fc          ! %f33
	.word	0xd909a9dd          ! %f34
	.word	0xe82f09e3          ! %f35
	.word	0x032f31fd          ! %f36
	.word	0x51ac793e          ! %f37
	.word	0x1443c137          ! %f38
	.word	0x19c854a9          ! %f39
	.word	0x52eb7000          ! %f40
	.word	0x0d98b535          ! %f41
	.word	0xaa1788d8          ! %f42
	.word	0x8ca98036          ! %f43
	.word	0xc62ec128          ! %f44
	.word	0x80937b70          ! %f45
	.word	0x87514e71          ! %f46
	.word	0x76595c0d          ! %f47
	.word	0x3385590c          ! %f48
	.word	0xad248c07          ! %f49
	.word	0x4eb9a30c          ! %f50
	.word	0x64c42de6          ! %f51
	.word	0xc48cb102          ! %f52
	.word	0xdea72d02          ! %f53
	.word	0x02a02ba9          ! %f54
	.word	0xc62b78b0          ! %f55
	.word	0x3388dcd3          ! %f56
	.word	0x39e8f2fb          ! %f57
	.word	0x6fea6709          ! %f58
	.word	0xfb9cafd8          ! %f59
	.word	0x87adf6b1          ! %f60
	.word	0xfc59f001          ! %f61
	.word	0x51e87cc8          ! %f62
	.word	0x0b095acb          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0x59c       ! %g1 (code pointer)
	.word	t0_data_in_shm_area ! %g2 (shared area pointer)
	.word	0x77799b43          ! %g3 (loop index)
	.word	SYM(t0_subr2)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0x5d513493          ! %o0
	.word	0xff2297a5          ! %o1
	.word	0xbfc05cbd          ! %o2
	.word	0xa0a58979          ! %o3
	.word	0xd8c474fa          ! %o4
	.word	0x59b889e9          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0xceffd668          ! %l0
	.word	0x9ad66cbf          ! %l1
	.word	0x8fbf69b1          ! %l2
	.word	0xdebf6cba          ! %l3
	.word	0x241987d4          ! %l4
	.word	0x36f08fdd          ! %l5
	.word	0x61591d4d          ! %l6
	.word	0x56a8d49c          ! %l7
	.word	t0_data_in_area0    ! %i0 (area pointer)
	.word	t0_data_in_area0    ! %i1 (area pointer)
	.word	0x0000001c          ! %i2 (byte offset)
	.word	0xfffffff0          ! %i3 (halfword offset)
	.word	0xfffffffc          ! %i4 (word offset)
	.word	0xfffffff8          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0x7cd77ec9          ! %y
	.word	0x00000004          ! %icc (nzvc)
	.word	0x40000202          ! %fsr
	.word	0x00000000          ! %gsr.mask
	.word	0x00000000          ! %gsr
	.word	0x00000080          ! %asi
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

KDATA_MODULE(t0_module_data_in_stack, 0x0c408000)
.seg "data"
KGLOBAL(t0_data_in_mtbl_size)
KGLOBAL(t0_data_in_mtbl)
KGLOBAL(t0_data_in_stack)
t0_data_in_stack_start:
	.word	0xadbaa04f
	.word	0x84f8eb70
	.word	0x78e44a5b
	.word	0xc7399779
	.word	0x3522724e
	.word	0x828584ba
	.word	0x124c8af4
	.word	0xc355995b
	.word	0xe5906461
	.word	0x62ffb84a
	.word	0x930c402b
	.word	0x9586b06f
	.word	0xa8978c24
	.word	0x33175d17
	.word	0x4a0ec85f
	.word	0x48db30c5
	.word	0x69fcde79
	.word	0x5a5b2bc8
	.word	0x9be4f37c
	.word	0x71b4e23d
	.word	0xea0852e0
	.word	0x76f24179
	.word	0xc0edc86c
	.word	0x657b4ae1
	.word	0xef74680b
	.word	0x62248abe
	.word	0x6341adce
	.word	0x5c3dbb8f
	.word	0x0ff8ddb1
	.word	0x5dd05ae7
	.word	0x0a5ae9e5
	.word	0x375702db
	.word	0xf8e6b7a2
	.word	0x580bb385
	.word	0x32b1add2
	.word	0x2cdeea33
	.word	0xfa18de1b
	.word	0xe914002d
	.word	0xe0312005
	.word	0x85d3e143
	.word	0x25ddef5b
	.word	0x88974a7b
	.word	0x7ece19f1
	.word	0xa6a97b99
	.word	0x05b51675
	.word	0x0e8e2a59
	.word	0x03df8cfe
	.word	0x558ea48c
	.word	0x2700fb68
	.word	0x098df681
	.word	0xb863c2c4
	.word	0x5988ad5a
	.word	0x6971206c
	.word	0xaceef93f
	.word	0x8f5cec75
	.word	0x3fae9990
	.word	0x6413408e
	.word	0xfc9aad7b
	.word	0xcf22b599
	.word	0x12a24dae
	.word	0x9b03837e
	.word	0x971247f6
	.word	0x782dce01
	.word	0xc21b840a
	.word	0xe7cb9aa7
	.word	0xc07e10d4
	.word	0xc2bd9ef5
	.word	0xa732abf4
	.word	0xfeee1b80
	.word	0x8f9a5159
	.word	0x46079faf
	.word	0x2c58171a
	.word	0x971cab21
	.word	0xcf5ed9f7
	.word	0x92a2fd0d
	.word	0xf7c6192e
	.word	0x676ccf19
	.word	0x0a8a6488
	.word	0xe5da8881
	.word	0xc302fdc5
	.word	0x12c8777e
	.word	0x890b56d7
	.word	0xf7ba224b
	.word	0x23f1f882
	.word	0x95149644
	.word	0xced3a964
	.word	0x114c12ea
	.word	0x32407373
	.word	0xe35957d2
	.word	0x703df668
	.word	0x96ce07cf
	.word	0x08ef5fba
	.word	0x00dcd0d2
	.word	0x1e05f516
	.word	0xf9eca754
	.word	0x6d8e6c6f
	.word	0xb8da3548
	.word	0x7236e523
	.word	0xc58fefeb
	.word	0x4fb947c5
	.word	0xb48cece6
	.word	0xdc96ae88
	.word	0xc6b1d69a
	.word	0xa9c54e6b
	.word	0x98e8189d
	.word	0xa83cb986
	.word	0x8f5bd8a6
	.word	0x81904d34
	.word	0xdbc85d77
	.word	0x516fc2ea
	.word	0xf97f748e
	.word	0x344738f9
	.word	0xcef708a3
	.word	0xa2d63092
	.word	0x6228be3a
	.word	0xd40600bd
	.word	0x0532e0d1
	.word	0x77b8aa2f
	.word	0x01c98274
	.word	0x889fde13
	.word	0x53e438c0
	.word	0xb6cefa4b
	.word	0xaf4ead97
	.word	0x9ff1c7bc
	.word	0xc0671714
	.word	0x8a0b7b8d
	.word	0x1898e985
	.word	0x2c16ea93
	.word	0x2b2f876c
	.word	0xf459963c
	.word	0xd70ca6de
	.word	0xc0f14cad
	.word	0x62b968b4
	.word	0x62881201
	.word	0x017d056e
	.word	0x84f6febc
	.word	0xe5764cb7
	.word	0x68e03ff0
	.word	0xe8f84fe6
	.word	0x6d567fb3
	.word	0x42013cf7
	.word	0x877740c9
	.word	0x7333fece
	.word	0x198b36af
	.word	0x110978c0
	.word	0x0c56eb7a
	.word	0x1ec176ba
	.word	0x70a52715
	.word	0xa1e2807a
	.word	0x407017e8
	.word	0xba13f5bb
	.word	0x611542f7
	.word	0xe2b9023f
	.word	0x432051ee
	.word	0x79f36418
	.word	0x1501ffbb
	.word	0xe5517bad
	.word	0xdc3138a5
	.word	0x9d7efc3e
	.word	0x973e10fe
	.word	0xca2ea4fc
	.word	0x2dd80de5
	.word	0x989dfdf4
	.word	0x72356db5
	.word	0x534af952
	.word	0x63a03a0c
	.word	0xb0ebe0d2
	.word	0xd0c30395
t0_data_in_sp:
	.word	0xf671f055
	.word	0x1893c7fd
	.word	0xa810b9f3
	.word	0x4b23bcb4
	.word	0xe2fabd02
	.word	0x52a11d6b
	.word	0x004dc8e9
	.word	0xe661bb70
	.word	t0_data_in_area0
	.word	t0_data_in_area0
	.word	0x0000001f
	.word	0x00000016
	.word	0xfffffffc
	.word	0x00000010
	.word	t0_data_in_fp
	.word	0x93b7d2d6
	.word	0x76e49b67
	.word	0xa9446fa8
	.word	0x529e6737
	.word	0xa6689a18
	.word	0xd4389c7b
	.word	0x84a625c0
	.word	0xb311f803
	.word	0xe7a5cda5
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
	.word   	0x76c03b25	! [%fp - 0xc]
	.word   	0x3a70d637	! [%fp - 0x8]
	.word   	0x0e1ab5df	! [%fp - 0x4]
.global t0_data_in_fp; t0_data_in_fp:
	.word	0xa304b9e8
	.word	0x145e6356
	.word	0xac9e81e5
	.word	0x22665d29
	.word	0x1675a8f1
	.word	0xd680916f
	.word	0x4cfb9c7f
	.word	0xded44061
	.word	0x0e0eb076
	.word	0x484021f6
	.word	0x00e1b43f
	.word	0xcebc00ff
	.word	0xc3a6dc1a
	.word	0xe21c6886
	.word	0x91026fc4
	.word	0xd9a68180
	.word	0x2c8337f1
	.word	0xbdcac207
	.word	0x094a0636
	.word	0x87db64c1
	.word	0x836b7f43
	.word	0x0ab9161f
	.word	0x83ae95ad
	.word	0x0076ae91
t0_data_in_stacktop:
	.word	0
t0_data_in_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_in_area0, 0x316d6000)
.seg "data"
t0_data_in_area0_start:
.skip 3264
t0_data_in_area0_begin:
	.word	0x46947390	! t0_data_in_area0-0x20
	.word	0x64b27be8	! t0_data_in_area0-0x1c
	.word	0xe633fbd3	! t0_data_in_area0-0x18
	.word	0x54df5980	! t0_data_in_area0-0x14
	.word	0xdb2a1fd4	! t0_data_in_area0-0x10
	.word	0xa8dcf5e3	! t0_data_in_area0-0xc
	.word	0x66c214c7	! t0_data_in_area0-0x8
	.word	0xd1b0f5fd	! t0_data_in_area0-0x4
.global t0_data_in_area0; t0_data_in_area0:
	.word	0xe4248c0c	! t0_data_in_area0+0x0
	.word	0xfd42792b	! t0_data_in_area0+0x4
	.word	0x98e58444	! t0_data_in_area0+0x8
	.word	0xb3b7a69f	! t0_data_in_area0+0xc
	.word	0x2bb5a4f8	! t0_data_in_area0+0x10
	.word	0x9386b3ed	! t0_data_in_area0+0x14
	.word	0x30716d02	! t0_data_in_area0+0x18
	.word	0x19bf0dc2	! t0_data_in_area0+0x1c
t0_data_in_area0_end:
.skip 4864
t0_data_in_area0_stop:

KDATA_MODULE(t0_module_data_in_shm_area, 0x19446000)
.seg "data"
t0_data_in_shm_area_start:
t0_data_in_shm_area_begin:
.global t0_data_in_shm_area; t0_data_in_shm_area:
	.word	0xde475c21	! t0_data_in_shm_area+0x0 (t0)
	.word	0x138e4717	! t0_data_in_shm_area+0x4 (t0)
	.word	0xf27aba5b	! t0_data_in_shm_area+0x8 (t0)
	.word	0x7eea0056	! t0_data_in_shm_area+0xc (t0)
	.word	0x1fed441d	! t0_data_in_shm_area+0x10 (t0)
	.word	0x55f3674f	! t0_data_in_shm_area+0x14 (t0)
	.word	0xda8be032	! t0_data_in_shm_area+0x18 (t0)
	.word	0xae5211f3	! t0_data_in_shm_area+0x1c (t0)
	.word	0x999d2d11	! t0_data_in_shm_area+0x20 (t0)
	.word	0x236f1926	! t0_data_in_shm_area+0x24 (t0)
	.word	0xbe7a3510	! t0_data_in_shm_area+0x28 (t0)
	.word	0x850b4e2f	! t0_data_in_shm_area+0x2c (t0)
	.word	0x1eb68576	! t0_data_in_shm_area+0x30 (t0)
	.word	0x7d1d7c8d	! t0_data_in_shm_area+0x34 (t0)
	.word	0x96344a8f	! t0_data_in_shm_area+0x38 (t0)
	.word	0x1c99b334	! t0_data_in_shm_area+0x3c (t0)
	.word	0xa5988320	! t0_data_in_shm_area+0x40 (t0 bload)
	.word	0xa4f6db87	! t0_data_in_shm_area+0x44
	.word	0x8072e7fb	! t0_data_in_shm_area+0x48
	.word	0x12ab418c	! t0_data_in_shm_area+0x4c
	.word	0x6b83587c	! t0_data_in_shm_area+0x50
	.word	0xcd3e7020	! t0_data_in_shm_area+0x54
	.word	0x0fac8b35	! t0_data_in_shm_area+0x58
	.word	0x9cc2b53e	! t0_data_in_shm_area+0x5c
	.word	0xad00fa19	! t0_data_in_shm_area+0x60
	.word	0x4c43159d	! t0_data_in_shm_area+0x64
	.word	0xe64593da	! t0_data_in_shm_area+0x68
	.word	0x4cac3c1f	! t0_data_in_shm_area+0x6c
	.word	0x14d63869	! t0_data_in_shm_area+0x70
	.word	0x2edd58f4	! t0_data_in_shm_area+0x74
	.word	0x1bf57ca5	! t0_data_in_shm_area+0x78
	.word	0xce56bd61	! t0_data_in_shm_area+0x7c
	.word	0x1c4531c7	! t0_data_in_shm_area+0x80 (t0 bstore)
	.word	0x7ad99c7e	! t0_data_in_shm_area+0x84
	.word	0xe2fbc711	! t0_data_in_shm_area+0x88
	.word	0x3e41866f	! t0_data_in_shm_area+0x8c
	.word	0x8c7660bb	! t0_data_in_shm_area+0x90
	.word	0xca3442ea	! t0_data_in_shm_area+0x94
	.word	0xe0457d42	! t0_data_in_shm_area+0x98
	.word	0xda5770fd	! t0_data_in_shm_area+0x9c
	.word	0x226dca7d	! t0_data_in_shm_area+0xa0
	.word	0xbbf91574	! t0_data_in_shm_area+0xa4
	.word	0x404e6e25	! t0_data_in_shm_area+0xa8
	.word	0xeb0dd65a	! t0_data_in_shm_area+0xac
	.word	0xc94611b7	! t0_data_in_shm_area+0xb0
	.word	0x16f65957	! t0_data_in_shm_area+0xb4
	.word	0xc19787d5	! t0_data_in_shm_area+0xb8
	.word	0x992ee408	! t0_data_in_shm_area+0xbc
t0_data_in_shm_area_end:
t0_data_in_shm_area_stop:

KDATA_MODULE(t0_module_data_exp_regs, 0x155ca000)
.seg "data"
KGLOBAL(t0_data_exp_regs)
t0_data_exp_regs_start:
t0_data_exp_regs:
	.word	0xd49a486e          ! %f0
	.word	0xd4522729          ! %f1
	.word	0x13466c69          ! %f2
	.word	0xb02c71ef          ! %f3
	.word	0xcb3218c6          ! %f4
	.word	0x26836df9          ! %f5
	.word	0x63688b35          ! %f6
	.word	0xc6e6f1aa          ! %f7
	.word	0xe61a1f4c          ! %f8
	.word	0xcf393117          ! %f9
	.word	0x6c46e50e          ! %f10
	.word	0x54935608          ! %f11
	.word	0x3743cf41          ! %f12
	.word	0x9633b4d1          ! %f13
	.word	0x10b5d388          ! %f14
	.word	0xf6de237b          ! %f15
	.word	0xfd3f3994          ! %f16
	.word	0xdfc33add          ! %f17
	.word	0x3bf90bf5          ! %f18
	.word	0xdf40f589          ! %f19
	.word	0xbdd67450          ! %f20
	.word	0x96d546c1          ! %f21
	.word	0x390b95fa          ! %f22
	.word	0x4c9f73d0          ! %f23
	.word	0x69b38555          ! %f24
	.word	0xe1674475          ! %f25
	.word	0x6058175e          ! %f26
	.word	0xd6501349          ! %f27
	.word	0x4f6dc44a          ! %f28
	.word	0x882a7546          ! %f29
	.word	0x99898925          ! %f30
	.word	0x7b1927d0          ! %f31
	.word	0x78b6e7d1          ! %f32
	.word	0x607f46fc          ! %f33
	.word	0xd909a9dd          ! %f34
	.word	0xe82f09e3          ! %f35
	.word	0x032f31fd          ! %f36
	.word	0x51ac793e          ! %f37
	.word	0x1443c137          ! %f38
	.word	0x19c854a9          ! %f39
	.word	0x52eb7000          ! %f40
	.word	0x0d98b535          ! %f41
	.word	0xaa1788d8          ! %f42
	.word	0x8ca98036          ! %f43
	.word	0xc62ec128          ! %f44
	.word	0x80937b70          ! %f45
	.word	0x87514e71          ! %f46
	.word	0x76595c0d          ! %f47
	.word	0x3385590c          ! %f48
	.word	0xad248c07          ! %f49
	.word	0x4eb9a30c          ! %f50
	.word	0x64c42de6          ! %f51
	.word	0xc48cb102          ! %f52
	.word	0xdea72d02          ! %f53
	.word	0x02a02ba9          ! %f54
	.word	0xc62b78b0          ! %f55
	.word	0x3388dcd3          ! %f56
	.word	0x39e8f2fb          ! %f57
	.word	0x6fea6709          ! %f58
	.word	0xfb9cafd8          ! %f59
	.word	0x87adf6b1          ! %f60
	.word	0xfc59f001          ! %f61
	.word	0x51e87cc8          ! %f62
	.word	0x0b095acb          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0x59c       ! %g1 (code pointer)
	.word	t0_data_exp_shm_area! %g2 (shared area pointer)
	.word	0x77799b43          ! %g3 (loop index)
	.word	SYM(t0_subr2)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0x5d513493          ! %o0
	.word	0xff2297a5          ! %o1
	.word	0xbfc05cbd          ! %o2
	.word	0xa0a58979          ! %o3
	.word	0xd8c474fa          ! %o4
	.word	0x59b889e9          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0xceffd668          ! %l0
	.word	0x9ad66cbf          ! %l1
	.word	0x8fbf69b1          ! %l2
	.word	0xdebf6cba          ! %l3
	.word	0x241987d4          ! %l4
	.word	0x36f08fdd          ! %l5
	.word	0x61591d4d          ! %l6
	.word	0x56a8d49c          ! %l7
	.word	t0_data_exp_area0   ! %i0 (area pointer)
	.word	t0_data_exp_area0   ! %i1 (area pointer)
	.word	0x0000001c          ! %i2 (byte offset)
	.word	0xfffffff0          ! %i3 (halfword offset)
	.word	0xfffffffc          ! %i4 (word offset)
	.word	0xfffffff8          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0x7cd77ec9          ! %y
	.word	0x00000004          ! %icc (nzvc)
	.word	0x40000202          ! %fsr
	.word	0x00000000          ! %gsr.mask
	.word	0x00000000          ! %gsr
	.word	0x00000080          ! %asi
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

KDATA_MODULE(t0_module_data_exp_stack, 0x0c7f8000)
.seg "data"
KGLOBAL(t0_data_exp_mtbl_size)
KGLOBAL(t0_data_exp_mtbl)
KGLOBAL(t0_data_exp_stack)
t0_data_exp_stack_start:
	.word	0xadbaa04f
	.word	0x84f8eb70
	.word	0x78e44a5b
	.word	0xc7399779
	.word	0x3522724e
	.word	0x828584ba
	.word	0x124c8af4
	.word	0xc355995b
	.word	0xe5906461
	.word	0x62ffb84a
	.word	0x930c402b
	.word	0x9586b06f
	.word	0xa8978c24
	.word	0x33175d17
	.word	0x4a0ec85f
	.word	0x48db30c5
	.word	0x69fcde79
	.word	0x5a5b2bc8
	.word	0x9be4f37c
	.word	0x71b4e23d
	.word	0xea0852e0
	.word	0x76f24179
	.word	0xc0edc86c
	.word	0x657b4ae1
	.word	0xef74680b
	.word	0x62248abe
	.word	0x6341adce
	.word	0x5c3dbb8f
	.word	0x0ff8ddb1
	.word	0x5dd05ae7
	.word	0x0a5ae9e5
	.word	0x375702db
	.word	0xf8e6b7a2
	.word	0x580bb385
	.word	0x32b1add2
	.word	0x2cdeea33
	.word	0xfa18de1b
	.word	0xe914002d
	.word	0xe0312005
	.word	0x85d3e143
	.word	0x25ddef5b
	.word	0x88974a7b
	.word	0x7ece19f1
	.word	0xa6a97b99
	.word	0x05b51675
	.word	0x0e8e2a59
	.word	0x03df8cfe
	.word	0x558ea48c
	.word	0x2700fb68
	.word	0x098df681
	.word	0xb863c2c4
	.word	0x5988ad5a
	.word	0x6971206c
	.word	0xaceef93f
	.word	0x8f5cec75
	.word	0x3fae9990
	.word	0x6413408e
	.word	0xfc9aad7b
	.word	0xcf22b599
	.word	0x12a24dae
	.word	0x9b03837e
	.word	0x971247f6
	.word	0x782dce01
	.word	0xc21b840a
	.word	0xe7cb9aa7
	.word	0xc07e10d4
	.word	0xc2bd9ef5
	.word	0xa732abf4
	.word	0xfeee1b80
	.word	0x8f9a5159
	.word	0x46079faf
	.word	0x2c58171a
	.word	0x971cab21
	.word	0xcf5ed9f7
	.word	0x92a2fd0d
	.word	0xf7c6192e
	.word	0x676ccf19
	.word	0x0a8a6488
	.word	0xe5da8881
	.word	0xc302fdc5
	.word	0x12c8777e
	.word	0x890b56d7
	.word	0xf7ba224b
	.word	0x23f1f882
	.word	0x95149644
	.word	0xced3a964
	.word	0x114c12ea
	.word	0x32407373
	.word	0xe35957d2
	.word	0x703df668
	.word	0x96ce07cf
	.word	0x08ef5fba
	.word	0x00dcd0d2
	.word	0x1e05f516
	.word	0xf9eca754
	.word	0x6d8e6c6f
	.word	0xb8da3548
	.word	0x7236e523
	.word	0xc58fefeb
	.word	0x4fb947c5
	.word	0xb48cece6
	.word	0xdc96ae88
	.word	0xc6b1d69a
	.word	0xa9c54e6b
	.word	0x98e8189d
	.word	0xa83cb986
	.word	0x8f5bd8a6
	.word	0x81904d34
	.word	0xdbc85d77
	.word	0x516fc2ea
	.word	0xf97f748e
	.word	0x344738f9
	.word	0xcef708a3
	.word	0xa2d63092
	.word	0x6228be3a
	.word	0xd40600bd
	.word	0x0532e0d1
	.word	0x77b8aa2f
	.word	0x01c98274
	.word	0x889fde13
	.word	0x53e438c0
	.word	0xb6cefa4b
	.word	0xaf4ead97
	.word	0x9ff1c7bc
	.word	0xc0671714
	.word	0x8a0b7b8d
	.word	0x1898e985
	.word	0x2c16ea93
	.word	0x2b2f876c
	.word	0xf459963c
	.word	0xd70ca6de
	.word	0xc0f14cad
	.word	0x62b968b4
	.word	0x62881201
	.word	0x017d056e
	.word	0x84f6febc
	.word	0xe5764cb7
	.word	0x68e03ff0
	.word	0xe8f84fe6
	.word	0x6d567fb3
	.word	0x42013cf7
	.word	0x877740c9
	.word	0x7333fece
	.word	0x198b36af
	.word	0x110978c0
	.word	0x0c56eb7a
	.word	0x1ec176ba
	.word	0x70a52715
	.word	0xa1e2807a
	.word	0x407017e8
	.word	0xba13f5bb
	.word	0x611542f7
	.word	0xe2b9023f
	.word	0x432051ee
	.word	0x79f36418
	.word	0x1501ffbb
	.word	0xe5517bad
	.word	0xdc3138a5
	.word	0x9d7efc3e
	.word	0x973e10fe
	.word	0xca2ea4fc
	.word	0x2dd80de5
	.word	0x989dfdf4
	.word	0x72356db5
	.word	0x534af952
	.word	0x63a03a0c
	.word	0xb0ebe0d2
	.word	0xd0c30395
t0_data_exp_sp:
	.word	0xf671f055
	.word	0x1893c7fd
	.word	0xa810b9f3
	.word	0x4b23bcb4
	.word	0xe2fabd02
	.word	0x52a11d6b
	.word	0x004dc8e9
	.word	0xe661bb70
	.word	t0_data_exp_area0
	.word	t0_data_exp_area0
	.word	0x0000001f
	.word	0x00000016
	.word	0xfffffffc
	.word	0x00000010
	.word	t0_data_exp_fp
	.word	0x93b7d2d6
	.word	0x76e49b67
	.word	0xa9446fa8
	.word	0x529e6737
	.word	0xa6689a18
	.word	0xd4389c7b
	.word	0x84a625c0
	.word	0xb311f803
	.word	0xe7a5cda5
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
	.word   	0x76c03b25	! [%fp - 0xc]
	.word   	0x3a70d637	! [%fp - 0x8]
	.word   	0x0e1ab5df	! [%fp - 0x4]
t0_data_exp_fp:
	.word	0xa304b9e8
	.word	0x145e6356
	.word	0xac9e81e5
	.word	0x22665d29
	.word	0x1675a8f1
	.word	0xd680916f
	.word	0x4cfb9c7f
	.word	0xded44061
	.word	0x0e0eb076
	.word	0x484021f6
	.word	0x00e1b43f
	.word	0xcebc00ff
	.word	0xc3a6dc1a
	.word	0xe21c6886
	.word	0x91026fc4
	.word	0xd9a68180
	.word	0x2c8337f1
	.word	0xbdcac207
	.word	0x094a0636
	.word	0x87db64c1
	.word	0x836b7f43
	.word	0x0ab9161f
	.word	0x83ae95ad
	.word	0x0076ae91
t0_data_exp_stacktop:
	.word	0
t0_data_exp_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_exp_area0, 0x2c76e000)
.seg "data"
t0_data_exp_area0_start:
.skip 3264
t0_data_exp_area0_begin:
	.word	0x46947390	! t0_data_exp_area0-0x20
	.word	0x64b27be8	! t0_data_exp_area0-0x1c
	.word	0xe633fbd3	! t0_data_exp_area0-0x18
	.word	0x54df5980	! t0_data_exp_area0-0x14
	.word	0xdb2a1fd4	! t0_data_exp_area0-0x10
	.word	0xa8dcf5e3	! t0_data_exp_area0-0xc
	.word	0x66c214c7	! t0_data_exp_area0-0x8
	.word	0xd1b0f5fd	! t0_data_exp_area0-0x4
.global t0_data_exp_area0; t0_data_exp_area0:
	.word	0xe4248c0c	! t0_data_exp_area0+0x0
	.word	0xfd42792b	! t0_data_exp_area0+0x4
	.word	0x98e58444	! t0_data_exp_area0+0x8
	.word	0xb3b7a69f	! t0_data_exp_area0+0xc
	.word	0x2bb5a4f8	! t0_data_exp_area0+0x10
	.word	0x9386b3ed	! t0_data_exp_area0+0x14
	.word	0x30716d02	! t0_data_exp_area0+0x18
	.word	0x19bf0dc2	! t0_data_exp_area0+0x1c
t0_data_exp_area0_end:
.skip 4864
t0_data_exp_area0_stop:

KDATA_MODULE(t0_module_data_exp_shm_area, 0x1a5aa000)
.seg "data"
t0_data_exp_shm_area_start:
t0_data_exp_shm_area_begin:
.global t0_data_exp_shm_area; t0_data_exp_shm_area:
	.word	0xde475c21	! t0_data_exp_shm_area+0x0 (t0)
	.word	0x138e4717	! t0_data_exp_shm_area+0x4 (t0)
	.word	0xf27aba5b	! t0_data_exp_shm_area+0x8 (t0)
	.word	0x7eea0056	! t0_data_exp_shm_area+0xc (t0)
	.word	0x1fed441d	! t0_data_exp_shm_area+0x10 (t0)
	.word	0x55f3674f	! t0_data_exp_shm_area+0x14 (t0)
	.word	0xda8be032	! t0_data_exp_shm_area+0x18 (t0)
	.word	0xae5211f3	! t0_data_exp_shm_area+0x1c (t0)
	.word	0x999d2d11	! t0_data_exp_shm_area+0x20 (t0)
	.word	0x236f1926	! t0_data_exp_shm_area+0x24 (t0)
	.word	0xbe7a3510	! t0_data_exp_shm_area+0x28 (t0)
	.word	0x850b4e2f	! t0_data_exp_shm_area+0x2c (t0)
	.word	0x1eb68576	! t0_data_exp_shm_area+0x30 (t0)
	.word	0x7d1d7c8d	! t0_data_exp_shm_area+0x34 (t0)
	.word	0x96344a8f	! t0_data_exp_shm_area+0x38 (t0)
	.word	0x1c99b334	! t0_data_exp_shm_area+0x3c (t0)
	.word	0xa5988320	! t0_data_exp_shm_area+0x40 (t0 bload)
	.word	0xa4f6db87	! t0_data_exp_shm_area+0x44
	.word	0x8072e7fb	! t0_data_exp_shm_area+0x48
	.word	0x12ab418c	! t0_data_exp_shm_area+0x4c
	.word	0x6b83587c	! t0_data_exp_shm_area+0x50
	.word	0xcd3e7020	! t0_data_exp_shm_area+0x54
	.word	0x0fac8b35	! t0_data_exp_shm_area+0x58
	.word	0x9cc2b53e	! t0_data_exp_shm_area+0x5c
	.word	0xad00fa19	! t0_data_exp_shm_area+0x60
	.word	0x4c43159d	! t0_data_exp_shm_area+0x64
	.word	0xe64593da	! t0_data_exp_shm_area+0x68
	.word	0x4cac3c1f	! t0_data_exp_shm_area+0x6c
	.word	0x14d63869	! t0_data_exp_shm_area+0x70
	.word	0x2edd58f4	! t0_data_exp_shm_area+0x74
	.word	0x1bf57ca5	! t0_data_exp_shm_area+0x78
	.word	0xce56bd61	! t0_data_exp_shm_area+0x7c
	.word	0x1c4531c7	! t0_data_exp_shm_area+0x80 (t0 bstore)
	.word	0x7ad99c7e	! t0_data_exp_shm_area+0x84
	.word	0xe2fbc711	! t0_data_exp_shm_area+0x88
	.word	0x3e41866f	! t0_data_exp_shm_area+0x8c
	.word	0x8c7660bb	! t0_data_exp_shm_area+0x90
	.word	0xca3442ea	! t0_data_exp_shm_area+0x94
	.word	0xe0457d42	! t0_data_exp_shm_area+0x98
	.word	0xda5770fd	! t0_data_exp_shm_area+0x9c
	.word	0x226dca7d	! t0_data_exp_shm_area+0xa0
	.word	0xbbf91574	! t0_data_exp_shm_area+0xa4
	.word	0x404e6e25	! t0_data_exp_shm_area+0xa8
	.word	0xeb0dd65a	! t0_data_exp_shm_area+0xac
	.word	0xc94611b7	! t0_data_exp_shm_area+0xb0
	.word	0x16f65957	! t0_data_exp_shm_area+0xb4
	.word	0xc19787d5	! t0_data_exp_shm_area+0xb8
	.word	0x992ee408	! t0_data_exp_shm_area+0xbc
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
#define T0_KAOS_SEED          d1e9dd9f5cd3
#define T0_KAOS_ICOUNT        2513
#define T0_KAOS_AREAS         1
#define T0_KAOS_AREASIZE      64
#define T0_KAOS_AREAOFFSET    3264
#define T0_KAOS_PAGESIZE      8192
#define T0_KAOS_CODECOUNT     2515

#define T0_KAOS_BOOT_VA                  0x480a4000
#define T0_KAOS_BOOT_PA                  0x0000000000a86000
#define T0_KAOS_BOOT_CACHEABLE           1
#define T0_KAOS_BOOT_NONCACHEABLE        0

#define T0_KAOS_STARTUP_VA               0x61a68000
#define T0_KAOS_STARTUP_PA               0x00000000027d6000
#define T0_KAOS_STARTUP_CACHEABLE        1
#define T0_KAOS_STARTUP_NONCACHEABLE     0

#define T0_KAOS_OFFSET_TBL_VA            0x4f32c000
#define T0_KAOS_OFFSET_TBL_PA            0x00000000042c4000
#define T0_KAOS_OFFSET_TBL_CACHEABLE     1
#define T0_KAOS_OFFSET_TBL_NONCACHEABLE  0

#define T0_KAOS_DONE_VA                  0x0a55c000
#define T0_KAOS_DONE_PA                  0x0000000006006000
#define T0_KAOS_DONE_CACHEABLE           1
#define T0_KAOS_DONE_NONCACHEABLE        0

#define T0_KAOS_KTBL_VA                  0x57e46000
#define T0_KAOS_KTBL_PA                  0x00000000091bc000
#define T0_KAOS_KTBL_CACHEABLE           1
#define T0_KAOS_KTBL_NONCACHEABLE        0

#define T0_KAOS_SUBR0_VA                 0x57dc0000
#define T0_KAOS_SUBR0_PA                 0x000000000b6e6000
#define T0_KAOS_SUBR0_CACHEABLE          1
#define T0_KAOS_SUBR0_NONCACHEABLE       0
#define T0_KAOS_SUBR1_VA                 0x57dc6000
#define T0_KAOS_SUBR1_PA                 0x000000000d3ec000
#define T0_KAOS_SUBR1_CACHEABLE          1
#define T0_KAOS_SUBR1_NONCACHEABLE       0
#define T0_KAOS_SUBR2_VA                 0x580a2000
#define T0_KAOS_SUBR2_PA                 0x000000000fd18000
#define T0_KAOS_SUBR2_CACHEABLE          1
#define T0_KAOS_SUBR2_NONCACHEABLE       0
#define T0_KAOS_SUBR3_VA                 0x73170000
#define T0_KAOS_SUBR3_PA                 0x0000000010916000
#define T0_KAOS_SUBR3_CACHEABLE          1
#define T0_KAOS_SUBR3_NONCACHEABLE       0

#define T0_KAOS_EXP_REGS_VA              0x155ca000
#define T0_KAOS_EXP_REGS_PA              0x0000000013d4e000
#define T0_KAOS_EXP_REGS_CACHEABLE       1
#define T0_KAOS_EXP_REGS_NONCACHEABLE    0
#define T0_KAOS_RUN_REGS_VA              0x1f7e2000
#define T0_KAOS_RUN_REGS_PA              0x00000000148b2000
#define T0_KAOS_RUN_REGS_CACHEABLE       1
#define T0_KAOS_RUN_REGS_NONCACHEABLE    0

#define T0_KAOS_EXP_STACK_VA             0x0c7f8000
#define T0_KAOS_EXP_STACK_PA             0x0000000017900000
#define T0_KAOS_EXP_STACK_CACHEABLE      1
#define T0_KAOS_EXP_STACK_NONCACHEABLE   0
#define T0_KAOS_RUN_STACK_VA             0x0c408000
#define T0_KAOS_RUN_STACK_PA             0x0000000018c02000
#define T0_KAOS_RUN_STACK_CACHEABLE      1
#define T0_KAOS_RUN_STACK_NONCACHEABLE   0

#define T0_KAOS_AREA0
#define T0_KAOS_EXP_AREA0_VA             0x2c76e000
#define T0_KAOS_EXP_AREA0_PA             0x000000001aaba000
#define T0_KAOS_EXP_AREA0_CACHEABLE      1
#define T0_KAOS_EXP_AREA0_NONCACHEABLE   0
#define T0_KAOS_RUN_AREA0_VA             0x316d6000
#define T0_KAOS_RUN_AREA0_PA             0x000000001deac000
#define T0_KAOS_RUN_AREA0_CACHEABLE      1
#define T0_KAOS_RUN_AREA0_NONCACHEABLE   0

#define T0_KAOS_SHM_AREA
#define T0_KAOS_EXP_SHM_AREA_VA          0x1a5aa000
#define T0_KAOS_EXP_SHM_AREA_PA          0x0000000000306000
#define T0_KAOS_EXP_SHM_AREA_CACHEABLE   1
#define T0_KAOS_EXP_SHM_AREA_NONCACHEABLE 0
#define T0_KAOS_RUN_SHM_AREA_VA          0x19446000
#define T0_KAOS_RUN_SHM_AREA_PA          0x0000000000e60000
#define T0_KAOS_RUN_SHM_AREA_CACHEABLE   1
#define T0_KAOS_RUN_SHM_AREA_NONCACHEABLE 0

#define T0_KAOS_RANVAL_00     0xb9c3718f
#define T0_KAOS_RANVAL_01     0x28874880
#define T0_KAOS_RANVAL_02     0x573df440
#define T0_KAOS_RANVAL_03     0x8b1c258d
#define T0_KAOS_RANVAL_04     0x1eece4e4
#define T0_KAOS_RANVAL_05     0x9dc0e183
#define T0_KAOS_RANVAL_06     0x30d4dc0a
#define T0_KAOS_RANVAL_07     0x43cf578b
#define T0_KAOS_RANVAL_08     0x3579fdd6
#define T0_KAOS_RANVAL_09     0xba8742d2
#define T0_KAOS_RANVAL_0a     0x8a5df3b1
#define T0_KAOS_RANVAL_0b     0x53acd80e
#define T0_KAOS_RANVAL_0c     0x8bc8318c
#define T0_KAOS_RANVAL_0d     0xc7c1052b
#define T0_KAOS_RANVAL_0e     0xb65b36f1
#define T0_KAOS_RANVAL_0f     0x089c4825
#define T0_KAOS_RANVAL_10     0x69f29c31
#define T0_KAOS_RANVAL_11     0xeb414952
#define T0_KAOS_RANVAL_12     0x0eb67669
#define T0_KAOS_RANVAL_13     0xd51132b3
#define T0_KAOS_RANVAL_14     0x19d3813e
#define T0_KAOS_RANVAL_15     0x60586d00
#define T0_KAOS_RANVAL_16     0x75e19b7d
#define T0_KAOS_RANVAL_17     0x95f6cc86
#define T0_KAOS_RANVAL_18     0xe5670bfe
#define T0_KAOS_RANVAL_19     0x72869b1b
#define T0_KAOS_RANVAL_1a     0x8a5cc67e
#define T0_KAOS_RANVAL_1b     0x030f21a8
#define T0_KAOS_RANVAL_1c     0x137b144f
#define T0_KAOS_RANVAL_1d     0x5bcaab26
#define T0_KAOS_RANVAL_1e     0xc1fdab08
#define T0_KAOS_RANVAL_1f     0x4d8743f5
#define T0_KAOS_RANVAL_20     0xd70feba5
#define T0_KAOS_RANVAL_21     0xa0bb03fa
#define T0_KAOS_RANVAL_22     0x1225ceab
#define T0_KAOS_RANVAL_23     0x72874eed
#define T0_KAOS_RANVAL_24     0x398a7654
#define T0_KAOS_RANVAL_25     0x0d3d75b6
#define T0_KAOS_RANVAL_26     0x3ccb8dcd
#define T0_KAOS_RANVAL_27     0x5c9e54cb
#define T0_KAOS_RANVAL_28     0x3318150d
#define T0_KAOS_RANVAL_29     0x988e3ef3
#define T0_KAOS_RANVAL_2a     0x1a140ace
#define T0_KAOS_RANVAL_2b     0x345788d6
#define T0_KAOS_RANVAL_2c     0xdba922a9
#define T0_KAOS_RANVAL_2d     0x3595b13c
#define T0_KAOS_RANVAL_2e     0x717a6b6d
#define T0_KAOS_RANVAL_2f     0x67473af6
#define T0_KAOS_RANVAL_30     0x59ef0a25
#define T0_KAOS_RANVAL_31     0xa08f28bc
#define T0_KAOS_RANVAL_32     0xfe63086a
#define T0_KAOS_RANVAL_33     0xfab37889
#define T0_KAOS_RANVAL_34     0xb11738ed
#define T0_KAOS_RANVAL_35     0x3bfb4b39
#define T0_KAOS_RANVAL_36     0xc8bf736b
#define T0_KAOS_RANVAL_37     0xcce56677
#define T0_KAOS_RANVAL_38     0x09cc715d
#define T0_KAOS_RANVAL_39     0xe002c241
#define T0_KAOS_RANVAL_3a     0xe5527723
#define T0_KAOS_RANVAL_3b     0xe36da883
#define T0_KAOS_RANVAL_3c     0x939c4184
#define T0_KAOS_RANVAL_3d     0x700de4a2
#define T0_KAOS_RANVAL_3e     0x387175b0
#define T0_KAOS_RANVAL_3f     0xce7769e4
#define T0_KAOS_RANVAL_40     0xa976a22a
#define T0_KAOS_RANVAL_41     0x1da9031e
#define T0_KAOS_RANVAL_42     0xdc12c944
#define T0_KAOS_RANVAL_43     0x56eadb14
#define T0_KAOS_RANVAL_44     0xcada0214
#define T0_KAOS_RANVAL_45     0x6d144c5f
#define T0_KAOS_RANVAL_46     0x14cf0b07
#define T0_KAOS_RANVAL_47     0x07d938e7
#define T0_KAOS_RANVAL_48     0x0b9e4185
#define T0_KAOS_RANVAL_49     0x82597c28
#define T0_KAOS_RANVAL_4a     0x3b75643c
#define T0_KAOS_RANVAL_4b     0xe8b9b0de
#define T0_KAOS_RANVAL_4c     0x6a756208
#define T0_KAOS_RANVAL_4d     0x94b0c9cd
#define T0_KAOS_RANVAL_4e     0xf8314da2
#define T0_KAOS_RANVAL_4f     0xbe9fb6bc
#define T0_KAOS_RANVAL_50     0xa260ee6d
#define T0_KAOS_RANVAL_51     0xf4a1c9e5
#define T0_KAOS_RANVAL_52     0x9342611c
#define T0_KAOS_RANVAL_53     0x0c089f5a
#define T0_KAOS_RANVAL_54     0x61c75f10
#define T0_KAOS_RANVAL_55     0x1ee4373d
#define T0_KAOS_RANVAL_56     0xcc2d2193
#define T0_KAOS_RANVAL_57     0x826794b7
#define T0_KAOS_RANVAL_58     0xbac4fe60
#define T0_KAOS_RANVAL_59     0x5dcfd70e
#define T0_KAOS_RANVAL_5a     0x9555dd1b
#define T0_KAOS_RANVAL_5b     0xbb743753
#define T0_KAOS_RANVAL_5c     0x4008119f
#define T0_KAOS_RANVAL_5d     0x6c69ec72
#define T0_KAOS_RANVAL_5e     0x9d650d54
#define T0_KAOS_RANVAL_5f     0x7bb180bc
#define T0_KAOS_RANVAL_60     0xc04049e6
#define T0_KAOS_RANVAL_61     0x0c11ef14
#define T0_KAOS_RANVAL_62     0xbbe6da12
#define T0_KAOS_RANVAL_63     0xe8e7bb68
#define T0_KAOS_RANVAL_64     0x5c25c16c
#define T0_KAOS_RANVAL_65     0x1fb67927
#define T0_KAOS_RANVAL_66     0x098da240
#define T0_KAOS_RANVAL_67     0x8fa5a3c5
#define T0_KAOS_RANVAL_68     0xb89c0907
#define T0_KAOS_RANVAL_69     0x7096a099
#define T0_KAOS_RANVAL_6a     0xb099af01
#define T0_KAOS_RANVAL_6b     0xa78a068e
#define T0_KAOS_RANVAL_6c     0x03ba09f1
#define T0_KAOS_RANVAL_6d     0x00232f87
#define T0_KAOS_RANVAL_6e     0xc5667517
#define T0_KAOS_RANVAL_6f     0x30587060
#define T0_KAOS_RANVAL_70     0x20c7bfcf
#define T0_KAOS_RANVAL_71     0xabd66ff3
#define T0_KAOS_RANVAL_72     0xcc400888
#define T0_KAOS_RANVAL_73     0x86f0c28d
#define T0_KAOS_RANVAL_74     0x90cf0eef
#define T0_KAOS_RANVAL_75     0xd2107eb3
#define T0_KAOS_RANVAL_76     0xeea9a67e
#define T0_KAOS_RANVAL_77     0x4a6ac12e
#define T0_KAOS_RANVAL_78     0x136d3ad1
#define T0_KAOS_RANVAL_79     0xb57159ac
#define T0_KAOS_RANVAL_7a     0x6168796e
#define T0_KAOS_RANVAL_7b     0x8413ee7e
#define T0_KAOS_RANVAL_7c     0xca66c0e8
#define T0_KAOS_RANVAL_7d     0x1e091d40
#define T0_KAOS_RANVAL_7e     0x9c33fb7d
#define T0_KAOS_RANVAL_7f     0x421f4766
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
!    areaoffset     3264
!    ncache         0
!    emulate_ncache 1
!    pagesize       8192
!    invsize        0
!    codecount      2515
!    code           57e46000
!    entry          57e46000
!    fsr_exceptions 00000000
!    fsr_roundmode  00000004
!    fsr_mask       c0000fff
!    seed           d1e9dd9f5cd3
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

KTEXT_MODULE(t0_module_ktbl, 0x57e46000)
.seg "text"
	KGLOBAL(t0_ktbl)
t0_ktbl_page_begin:
.global t0_kref; t0_kref:
	.skip 0
t0_ktbl:
	.word	0xa3a188af	! t0_kref+0x0:   	fsubs	%f6, %f15, %f17
	.word	0xfb80a014	! t0_kref+0x4:   	lda	[%g2 + 0x14]%asi, %f29
	.word	0x81de001c	! t0_kref+0x8:   	flush	%i0 + %i4
	.word	0xa31dc017	! t0_kref+0xc:   	tsubcctv	%l7, %l7, %l1
	.word	0xafa01a3e	! t0_kref+0x10:   	fstoi	%f30, %f23
	.word	0x9eaa801a	! t0_kref+0x14:   	andncc	%o2, %i2, %o7
	.word	0xd120a03c	! t0_kref+0x18:   	st	%f8, [%g2 + 0x3c]
	.word	0x39800001	! t0_kref+0x1c:   	fbuge,a	_kref+0x20
	.word	0xa81ebc2d	! t0_kref+0x20:   	xor	%i2, -0x3d3, %l4
	.word	0xa47a4008	! t0_kref+0x24:   	sdiv	%o1, %o0, %l2
	.word	0x93a508b0	! t0_kref+0x28:   	fsubs	%f20, %f16, %f9
	.word	0x2d800003	! t0_kref+0x2c:   	fbg,a	_kref+0x38
	.word	0xb3a64836	! t0_kref+0x30:   	fadds	%f25, %f22, %f25
	.word	0x3f800003	! t0_kref+0x34:   	fbo,a	_kref+0x40
	.word	0x151341d5	! t0_kref+0x38:   	sethi	%hi(0x4d075400), %o2
	.word	0x2f800003	! t0_kref+0x3c:   	fbu,a	_kref+0x48
	.word	0xaba01892	! t0_kref+0x40:   	fitos	%f18, %f21
	.word	0x81830000	! t0_kref+0x44:   	wr	%o4, %g0, %y
	.word	0xada308d4	! t0_kref+0x48:   	fsubd	%f12, %f20, %f22
	.word	0xa5a0102a	! t0_kref+0x4c:   	fstox	%f10, %f18
	.word	0x81d8400b	! t0_kref+0x50:   	flush	%g1 + %o3
	.word	0xf007bfe0	! t0_kref+0x54:   	ld	[%fp - 0x20], %i0
	.word	0x30480001	! t0_kref+0x58:   	ba,a,pt	%icc, _kref+0x5c
	.word	0xa5a34d28	! t0_kref+0x5c:   	fsmuld	%f13, %f8, %f18
	.word	0x19383a2e	! t0_kref+0x60:   	sethi	%hi(0xe0e8b800), %o4
	.word	0xee6e8019	! t0_kref+0x64:   	ldstub	[%i2 + %i1], %l7
	.word	0xe04e3ff1	! t0_kref+0x68:   	ldsb	[%i0 - 0xf], %l0
	.word	0xe60e3fec	! t0_kref+0x6c:   	ldub	[%i0 - 0x14], %l3
	.word	0x960d73de	! t0_kref+0x70:   	and	%l5, -0xc22, %o3
	.word	0xb1a0111a	! t0_kref+0x74:   	fxtod	%f26, %f24
	.word	0xda7e001c	! t0_kref+0x78:   	swap	[%i0 + %i4], %o5
	.word	0xde4e6008	! t0_kref+0x7c:   	ldsb	[%i1 + 8], %o7
	.word	0xa0ba2c40	! t0_kref+0x80:   	xnorcc	%o0, 0xc40, %l0
	.word	0xb7a00027	! t0_kref+0x84:   	fmovs	%f7, %f27
	.word	0xfd1fbe58	! t0_kref+0x88:   	ldd	[%fp - 0x1a8], %f30
	.word	0xe850a024	! t0_kref+0x8c:   	ldsh	[%g2 + 0x24], %l4
	.word	0x95a588ba	! t0_kref+0x90:   	fsubs	%f22, %f26, %f10
	.word	0xb5a00533	! t0_kref+0x94:   	fsqrts	%f19, %f26
	.word	0xac65c00c	! t0_kref+0x98:   	subc	%l7, %o4, %l6
	.word	0xa7a3c8b9	! t0_kref+0x9c:   	fsubs	%f15, %f25, %f19
	.word	0xc9ee1000	! t0_kref+0xa0:   	prefetcha	%i0, 4
	.word	0xedee501b	! t0_kref+0xa4:   	prefetcha	%i1 + %i3, 22
	.word	0x99a18852	! t0_kref+0xa8:   	faddd	%f6, %f18, %f12
	.word	0xae05be34	! t0_kref+0xac:   	add	%l6, -0x1cc, %l7
	.word	0xa1a609dc	! t0_kref+0xb0:   	fdivd	%f24, %f28, %f16
	.word	0xf53f4018	! t0_kref+0xb4:   	std	%f26, [%i5 + %i0]
	.word	0xdd1e001d	! t0_kref+0xb8:   	ldd	[%i0 + %i5], %f14
	.word	0x85827794	! t0_kref+0xbc:   	wr	%o1, 0xfffff794, %ccr
	.word	0x95a48950	! t0_kref+0xc0:   	fmuld	%f18, %f16, %f10
	.word	0xae9d3545	! t0_kref+0xc4:   	xorcc	%l4, -0xabb, %l7
	.word	0xb5a00537	! t0_kref+0xc8:   	fsqrts	%f23, %f26
	.word	0xa1a4884a	! t0_kref+0xcc:   	faddd	%f18, %f10, %f16
	.word	0x81ae0a4e	! t0_kref+0xd0:   	fcmpd	%fcc0, %f24, %f14
	.word	0xa2283040	! t0_kref+0xd4:   	andn	%g0, -0xfc0, %l1
	.word	0x982da663	! t0_kref+0xd8:   	andn	%l6, 0x663, %o4
	.word	0x9de3bfa0	! t0_kref+0xdc:   	save	%sp, -0x60, %sp
	.word	0xade83ab0	! t0_kref+0xe0:   	restore	%g0, -0x550, %l6
	.word	0x968537f4	! t0_kref+0xe4:   	addcc	%l4, -0x80c, %o3
	.word	0xda680018	! t0_kref+0xe8:   	ldstub	[%g0 + %i0], %o5
	.word	0x3a480004	! t0_kref+0xec:   	bcc,a,pt	%icc, _kref+0xfc
	.word	0xa09830f3	! t0_kref+0xf0:   	xorcc	%g0, -0xf0d, %l0
	.word	0xed070018	! t0_kref+0xf4:   	ld	[%i4 + %i0], %f22
	.word	0xd8ce9018	! t0_kref+0xf8:   	ldsba	[%i2 + %i0]0x80, %o4
	.word	0x9eab400a	! t0_kref+0xfc:   	andncc	%o5, %o2, %o7
	.word	0xa1400000	! t0_kref+0x100:   	mov	%y, %l0
	.word	0x9eb34000	! t0_kref+0x104:   	orncc	%o5, %g0, %o7
	.word	0x98128015	! t0_kref+0x108:   	or	%o2, %l5, %o4
	.word	0xe25e3ff8	! t0_kref+0x10c:   	ldx	[%i0 - 8], %l1
	.word	0x86102020	! t0_kref+0x110:   	mov	0x20, %g3
	.word	0x86a0e001	! t0_kref+0x114:   	subcc	%g3, 1, %g3
	.word	0x22800015	! t0_kref+0x118:   	be,a	_kref+0x16c
	.word	0xe06e8018	! t0_kref+0x11c:   	ldstub	[%i2 + %i0], %l0
	.word	0x98a50008	! t0_kref+0x120:   	subcc	%l4, %o0, %o4
	.word	0x99a000dc	! t0_kref+0x124:   	fnegd	%f28, %f12
	.word	0xd6fe101c	! t0_kref+0x128:   	swapa	[%i0 + %i4]0x80, %o3
	.word	0x91a70828	! t0_kref+0x12c:   	fadds	%f28, %f8, %f8
	.word	0x8da609d4	! t0_kref+0x130:   	fdivd	%f24, %f20, %f6
	.word	0xd06e4000	! t0_kref+0x134:   	ldstub	[%i1], %o0
	.word	0x9a45785f	! t0_kref+0x138:   	addc	%l5, -0x7a1, %o5
	.word	0xcb002b44	! t0_kref+0x13c:   	ld	[%g0 + 0xb44], %f5
	.word	0xb5a60836	! t0_kref+0x140:   	fadds	%f24, %f22, %f26
	.word	0x9a85c008	! t0_kref+0x144:   	addcc	%l7, %o0, %o5
	.word	0xd2480019	! t0_kref+0x148:   	ldsb	[%g0 + %i1], %o1
	.word	0x99a0052e	! t0_kref+0x14c:   	fsqrts	%f14, %f12
	.word	0xb7a44838	! t0_kref+0x150:   	fadds	%f17, %f24, %f27
	.word	0xeec71018	! t0_kref+0x154:   	ldswa	[%i4 + %i0]0x80, %l7
	.word	0x9da0191e	! t0_kref+0x158:   	fitod	%f30, %f14
	.word	0x81af8a3b	! t0_kref+0x15c:   	fcmps	%fcc0, %f30, %f27
	.word	0xd0de3fe8	! t0_kref+0x160:   	ldxa	[%i0 - 0x18]%asi, %o0
	.word	0xe27e7ff4	! t0_kref+0x164:   	swap	[%i1 - 0xc], %l1
	.word	0x9a42b86b	! t0_kref+0x168:   	addc	%o2, -0x795, %o5
	.word	0xd2c8a003	! t0_kref+0x16c:   	ldsba	[%g2 + 3]%asi, %o1
	.word	0xea2e7ff7	! t0_kref+0x170:   	stb	%l5, [%i1 - 9]
	.word	0x8da01a3a	! t0_kref+0x174:   	fstoi	%f26, %f6
	.word	0xde000018	! t0_kref+0x178:   	ld	[%g0 + %i0], %o7
	.word	0x96f3401a	! t0_kref+0x17c:   	udivcc	%o5, %i2, %o3
	.word	0xa3400000	! t0_kref+0x180:   	mov	%y, %l1
	.word	0xaafa39e9	! t0_kref+0x184:   	sdivcc	%o0, -0x617, %l5
	.word	0xa73a0009	! t0_kref+0x188:   	sra	%o0, %o1, %l3
	.word	0xa83b4014	! t0_kref+0x18c:   	xnor	%o5, %l4, %l4
	.word	0xbda01096	! t0_kref+0x190:   	fxtos	%f22, %f30
	.word	0xd02e6012	! t0_kref+0x194:   	stb	%o0, [%i1 + 0x12]
	.word	0x9b35400b	! t0_kref+0x198:   	srl	%l5, %o3, %o5
	.word	0x9fc10000	! t0_kref+0x19c:   	call	%g4
	.word	0x1723dbba	! t0_kref+0x1a0:   	sethi	%hi(0x8f6ee800), %o3
	.word	0xe0c0a014	! t0_kref+0x1a4:   	ldswa	[%g2 + 0x14]%asi, %l0
	.word	0x96730017	! t0_kref+0x1a8:   	udiv	%o4, %l7, %o3
	.word	0xea88a006	! t0_kref+0x1ac:   	lduba	[%g2 + 6]%asi, %l5
	.word	0x9de3bfa0	! t0_kref+0x1b0:   	save	%sp, -0x60, %sp
	.word	0xb6a6fee5	! t0_kref+0x1b4:   	subcc	%i3, -0x11b, %i3
	.word	0xabef4018	! t0_kref+0x1b8:   	restore	%i5, %i0, %l5
	.word	0x99358000	! t0_kref+0x1bc:   	srl	%l6, %g0, %o4
	.word	0xe9380018	! t0_kref+0x1c0:   	std	%f20, [%g0 + %i0]
	.word	0x96620014	! t0_kref+0x1c4:   	subc	%o0, %l4, %o3
	.word	0xe400a000	! t0_kref+0x1c8:   	ld	[%g2], %l2
	.word	0x81a98a4c	! t0_kref+0x1cc:   	fcmpd	%fcc0, %f6, %f12
	.word	0x9af565af	! t0_kref+0x1d0:   	udivcc	%l5, 0x5af, %o5
	.word	0x81ae0a4a	! t0_kref+0x1d4:   	fcmpd	%fcc0, %f24, %f10
	.word	0xb9a01a26	! t0_kref+0x1d8:   	fstoi	%f6, %f28
	.word	0x92fa400b	! t0_kref+0x1dc:   	sdivcc	%o1, %o3, %o1
	.word	0xd8ee6015	! t0_kref+0x1e0:   	ldstuba	[%i1 + 0x15]%asi, %o4
	.word	0x81aaca2b	! t0_kref+0x1e4:   	fcmps	%fcc0, %f11, %f11
	.word	0xd06e401a	! t0_kref+0x1e8:   	ldstub	[%i1 + %i2], %o0
	.word	0x9fc00004	! t0_kref+0x1ec:   	call	%g0 + %g4
	.word	0x9402c00b	! t0_kref+0x1f0:   	add	%o3, %o3, %o2
	.word	0x32800002	! t0_kref+0x1f4:   	bne,a	_kref+0x1fc
	.word	0xdec0a010	! t0_kref+0x1f8:   	ldswa	[%g2 + 0x10]%asi, %o7
	.word	0xd580a004	! t0_kref+0x1fc:   	lda	[%g2 + 4]%asi, %f10
	.word	0xa472c008	! t0_kref+0x200:   	udiv	%o3, %o0, %l2
	call	SYM(t0_subr1)
	.word	0xb1a01915	! t0_kref+0x208:   	fitod	%f21, %f24
	.word	0x86102001	! t0_kref+0x20c:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x210:   	bne,a	_kref+0x210
	.word	0x86a0e001	! t0_kref+0x214:   	subcc	%g3, 1, %g3
	.word	0x9de3bfa0	! t0_kref+0x218:   	save	%sp, -0x60, %sp
	.word	0xb63f0019	! t0_kref+0x21c:   	xnor	%i4, %i1, %i3
	.word	0x81ee33c3	! t0_kref+0x220:   	restore	%i0, -0xc3d, %g0
	.word	0xde80a014	! t0_kref+0x224:   	lda	[%g2 + 0x14]%asi, %o7
	.word	0x81db0014	! t0_kref+0x228:   	flush	%o4 + %l4
	.word	0xa7400000	! t0_kref+0x22c:   	mov	%y, %l3
	.word	0xa6fd328c	! t0_kref+0x230:   	sdivcc	%l4, -0xd74, %l3
	.word	0xaba01a2f	! t0_kref+0x234:   	fstoi	%f15, %f21
	.word	0x967a8008	! t0_kref+0x238:   	sdiv	%o2, %o0, %o3
	.word	0xa2f2733d	! t0_kref+0x23c:   	udivcc	%o1, -0xcc3, %l1
	.word	0x9efa2ec4	! t0_kref+0x240:   	sdivcc	%o0, 0xec4, %o7
	.word	0x9a72c015	! t0_kref+0x244:   	udiv	%o3, %l5, %o5
	.word	0x81af4a29	! t0_kref+0x248:   	fcmps	%fcc0, %f29, %f9
	.word	0xada00533	! t0_kref+0x24c:   	fsqrts	%f19, %f22
	.word	0xf5380018	! t0_kref+0x250:   	std	%f26, [%g0 + %i0]
	.word	0xed1fbc68	! t0_kref+0x254:   	ldd	[%fp - 0x398], %f22
	.word	0x81828000	! t0_kref+0x258:   	wr	%o2, %g0, %y
	.word	0xe86e201f	! t0_kref+0x25c:   	ldstub	[%i0 + 0x1f], %l4
	.word	0x0135f0a6	! t0_kref+0x260:   	sethi	%hi(0xd7c29800), %g0
	.word	0x91a409d2	! t0_kref+0x264:   	fdivd	%f16, %f18, %f8
	.word	0x901d76b7	! t0_kref+0x268:   	xor	%l5, -0x949, %o0
	.word	0x3f480004	! t0_kref+0x26c:   	fbo,a,pt	%fcc0, _kref+0x27c
	.word	0xac73307f	! t0_kref+0x270:   	udiv	%o4, -0xf81, %l6
	.word	0xb5a0014a	! t0_kref+0x274:   	fabsd	%f10, %f26
	.word	0x99a609da	! t0_kref+0x278:   	fdivd	%f24, %f26, %f12
	.word	0x8143c000	! t0_kref+0x27c:   	stbar
	.word	0x94bac016	! t0_kref+0x280:   	xnorcc	%o3, %l6, %o2
	.word	0x9250001a	! t0_kref+0x284:   	umul	%g0, %i2, %o1
	.word	0x981a6f02	! t0_kref+0x288:   	xor	%o1, 0xf02, %o4
	.word	0xe488a034	! t0_kref+0x28c:   	lduba	[%g2 + 0x34]%asi, %l2
	.word	0xac02f17f	! t0_kref+0x290:   	add	%o3, -0xe81, %l6
	.word	0x86102007	! t0_kref+0x294:   	mov	0x7, %g3
	.word	0x86a0e001	! t0_kref+0x298:   	subcc	%g3, 1, %g3
	.word	0x22800012	! t0_kref+0x29c:   	be,a	_kref+0x2e4
	.word	0x95a6095c	! t0_kref+0x2a0:   	fmuld	%f24, %f28, %f10
	.word	0xec200019	! t0_kref+0x2a4:   	st	%l6, [%g0 + %i1]
	.word	0x30800002	! t0_kref+0x2a8:   	ba,a	_kref+0x2b0
	.word	0x9e0daaac	! t0_kref+0x2ac:   	and	%l6, 0xaac, %o7
	.word	0xb1a688cc	! t0_kref+0x2b0:   	fsubd	%f26, %f12, %f24
	.word	0x8d85eeab	! t0_kref+0x2b4:   	wr	%l7, 0xeab, %fprs
	.word	0x95a01110	! t0_kref+0x2b8:   	fxtod	%f16, %f10
	.word	0x23480003	! t0_kref+0x2bc:   	fbne,a,pt	%fcc0, _kref+0x2c8
	.word	0xafa3c835	! t0_kref+0x2c0:   	fadds	%f15, %f21, %f23
	.word	0x2b4ffff5	! t0_kref+0x2c4:   	fbug,a,pt	%fcc0, _kref+0x298
	.word	0xd6100019	! t0_kref+0x2c8:   	lduh	[%g0 + %i1], %o3
	.word	0xd40e401a	! t0_kref+0x2cc:   	ldub	[%i1 + %i2], %o2
	.word	0x9b3d001a	! t0_kref+0x2d0:   	sra	%l4, %i2, %o5
	.word	0xe4ce2011	! t0_kref+0x2d4:   	ldsba	[%i0 + 0x11]%asi, %l2
	.word	0x95a018c6	! t0_kref+0x2d8:   	fdtos	%f6, %f10
	.word	0xa3a708b3	! t0_kref+0x2dc:   	fsubs	%f28, %f19, %f17
	.word	0xecb63ffe	! t0_kref+0x2e0:   	stha	%l6, [%i0 - 2]%asi
	.word	0xd7000019	! t0_kref+0x2e4:   	ld	[%g0 + %i1], %f11
	.word	0xbda01a52	! t0_kref+0x2e8:   	fdtoi	%f18, %f30
	.word	0xdd1fbfa8	! t0_kref+0x2ec:   	ldd	[%fp - 0x58], %f14
	.word	0xae7ab8b8	! t0_kref+0x2f0:   	sdiv	%o2, -0x748, %l7
	.word	0xa5a01a46	! t0_kref+0x2f4:   	fdtoi	%f6, %f18
	.word	0x81ae0a52	! t0_kref+0x2f8:   	fcmpd	%fcc0, %f24, %f18
	.word	0xa1a4895a	! t0_kref+0x2fc:   	fmuld	%f18, %f26, %f16
	.word	0x801a4014	! t0_kref+0x300:   	xor	%o1, %l4, %g0
	.word	0xaeab7e23	! t0_kref+0x304:   	andncc	%o5, -0x1dd, %l7
	.word	0x3b800008	! t0_kref+0x308:   	fble,a	_kref+0x328
	.word	0xd0a67ff4	! t0_kref+0x30c:   	sta	%o0, [%i1 - 0xc]%asi
	.word	0xd220a01c	! t0_kref+0x310:   	st	%o1, [%g2 + 0x1c]
	.word	0xa17036c3	! t0_kref+0x314:   	popc	-0x93d, %l0
	.word	0x80de801a	! t0_kref+0x318:   	smulcc	%i2, %i2, %g0
	.word	0xb3a01a2f	! t0_kref+0x31c:   	fstoi	%f15, %f25
	.word	0xb1a0110c	! t0_kref+0x320:   	fxtod	%f12, %f24
	.word	0x8da018d0	! t0_kref+0x324:   	fdtos	%f16, %f6
	.word	0xda80a00c	! t0_kref+0x328:   	lda	[%g2 + 0xc]%asi, %o5
	.word	0xc0067fec	! t0_kref+0x32c:   	ld	[%i1 - 0x14], %g0
	.word	0xa760400c	! t0_kref+0x330:   	movne	%fcc0, %o4, %l3
	.word	0xec500019	! t0_kref+0x334:   	ldsh	[%g0 + %i1], %l6
	.word	0x962d4017	! t0_kref+0x338:   	andn	%l5, %l7, %o3
	.word	0xd47e4000	! t0_kref+0x33c:   	swap	[%i1], %o2
	.word	0x8143e040	! t0_kref+0x340:   	membar	0x40
	.word	0x9de3bfa0	! t0_kref+0x344:   	save	%sp, -0x60, %sp
	.word	0x97ee7040	! t0_kref+0x348:   	restore	%i1, -0xfc0, %o3
	.word	0xa732a002	! t0_kref+0x34c:   	srl	%o2, 0x2, %l3
	.word	0xe6567fec	! t0_kref+0x350:   	ldsh	[%i1 - 0x14], %l3
	.word	0x8fa01a2b	! t0_kref+0x354:   	fstoi	%f11, %f7
	.word	0xae0afada	! t0_kref+0x358:   	and	%o3, -0x526, %l7
	.word	0xe00e7ff9	! t0_kref+0x35c:   	ldub	[%i1 - 7], %l0
	.word	0xe6166008	! t0_kref+0x360:   	lduh	[%i1 + 8], %l3
	.word	0x91a0052e	! t0_kref+0x364:   	fsqrts	%f14, %f8
	.word	0x30800002	! t0_kref+0x368:   	ba,a	_kref+0x370
	.word	0x81de0009	! t0_kref+0x36c:   	flush	%i0 + %o1
	.word	0xa492c008	! t0_kref+0x370:   	orcc	%o3, %o0, %l2
	.word	0x001fffff	! t0_kref+0x374:   	illtrap	0x1fffff
	.word	0xc0062004	! t0_kref+0x378:   	ld	[%i0 + 4], %g0
	.word	0xde00a00c	! t0_kref+0x37c:   	ld	[%g2 + 0xc], %o7
	.word	0xf9be584a	! t0_kref+0x380:   	stda	%f28, [%i1 + %o2]0xc2
	.word	0xa1a00029	! t0_kref+0x384:   	fmovs	%f9, %f16
	.word	0xac0eafa2	! t0_kref+0x388:   	and	%i2, 0xfa2, %l6
	.word	0xec067fec	! t0_kref+0x38c:   	ld	[%i1 - 0x14], %l6
	.word	0xaa82c00a	! t0_kref+0x390:   	addcc	%o3, %o2, %l5
	.word	0xe9be1814	! t0_kref+0x394:   	stda	%f20, [%i0 + %l4]0xc0
	.word	0xe2c63fec	! t0_kref+0x398:   	ldswa	[%i0 - 0x14]%asi, %l1
	.word	0x90ab637d	! t0_kref+0x39c:   	andncc	%o5, 0x37d, %o0
	.word	0x23480004	! t0_kref+0x3a0:   	fbne,a,pt	%fcc0, _kref+0x3b0
	.word	0xea764000	! t0_kref+0x3a4:   	stx	%l5, [%i1]
	.word	0xa5a28848	! t0_kref+0x3a8:   	faddd	%f10, %f8, %f18
	.word	0xae650000	! t0_kref+0x3ac:   	subc	%l4, %g0, %l7
	.word	0x91a50d2e	! t0_kref+0x3b0:   	fsmuld	%f20, %f14, %f8
	.word	0xa01b000b	! t0_kref+0x3b4:   	xor	%o4, %o3, %l0
	.word	0x91a388d0	! t0_kref+0x3b8:   	fsubd	%f14, %f16, %f8
	.word	0xf91e7ff8	! t0_kref+0x3bc:   	ldd	[%i1 - 8], %f28
	.word	0xe488a02d	! t0_kref+0x3c0:   	lduba	[%g2 + 0x2d]%asi, %l2
	.word	0x913a8008	! t0_kref+0x3c4:   	sra	%o2, %o0, %o0
	.word	0xecbe2018	! t0_kref+0x3c8:   	stda	%l6, [%i0 + 0x18]%asi
	.word	0x9ba01a54	! t0_kref+0x3cc:   	fdtoi	%f20, %f13
	.word	0xd490a028	! t0_kref+0x3d0:   	lduha	[%g2 + 0x28]%asi, %o2
	.word	0x37480004	! t0_kref+0x3d4:   	fbge,a,pt	%fcc0, _kref+0x3e4
	.word	0xada189da	! t0_kref+0x3d8:   	fdivd	%f6, %f26, %f22
	.word	0xa6ad6fd4	! t0_kref+0x3dc:   	andncc	%l5, 0xfd4, %l3
	.word	0xa856ba03	! t0_kref+0x3e0:   	umul	%i2, -0x5fd, %l4
	.word	0x9e2a400c	! t0_kref+0x3e4:   	andn	%o1, %o4, %o7
	.word	0x9fc00004	! t0_kref+0x3e8:   	call	%g0 + %g4
	.word	0xe836401b	! t0_kref+0x3ec:   	sth	%l4, [%i1 + %i3]
	.word	0xa138000a	! t0_kref+0x3f0:   	sra	%g0, %o2, %l0
	.word	0xaa43292c	! t0_kref+0x3f4:   	addc	%o4, 0x92c, %l5
	.word	0xe4462018	! t0_kref+0x3f8:   	ldsw	[%i0 + 0x18], %l2
	.word	0xa970000a	! t0_kref+0x3fc:   	popc	%o2, %l4
	.word	0xa4702ab0	! t0_kref+0x400:   	udiv	%g0, 0xab0, %l2
	.word	0xda163fec	! t0_kref+0x404:   	lduh	[%i0 - 0x14], %o5
	.word	0x26480006	! t0_kref+0x408:   	bl,a,pt	%icc, _kref+0x420
	.word	0xdab01019	! t0_kref+0x40c:   	stha	%o5, [%g0 + %i1]0x80
	.word	0x9da00538	! t0_kref+0x410:   	fsqrts	%f24, %f14
	.word	0xaba788be	! t0_kref+0x414:   	fsubs	%f30, %f30, %f21
	.word	0xf3ee101d	! t0_kref+0x418:   	prefetcha	%i0 + %i5, 25
	.word	0xa4ab000b	! t0_kref+0x41c:   	andncc	%o4, %o3, %l2
	.word	0xec267ffc	! t0_kref+0x420:   	st	%l6, [%i1 - 4]
	.word	0x80bd2d5b	! t0_kref+0x424:   	xnorcc	%l4, 0xd5b, %g0
	.word	0xa805001a	! t0_kref+0x428:   	add	%l4, %i2, %l4
	.word	0x813dc009	! t0_kref+0x42c:   	sra	%l7, %o1, %g0
	.word	0x9e5a6734	! t0_kref+0x430:   	smul	%o1, 0x734, %o7
	.word	0xc168a000	! t0_kref+0x434:   	prefetch	%g2, 0
	.word	0xa32ea016	! t0_kref+0x438:   	sll	%i2, 0x16, %l1
	.word	0x93a2c8af	! t0_kref+0x43c:   	fsubs	%f11, %f15, %f9
	.word	0xf5066000	! t0_kref+0x440:   	ld	[%i1], %f26
	.word	0x9285af2f	! t0_kref+0x444:   	addcc	%l6, 0xf2f, %o1
	.word	0xf9ee101c	! t0_kref+0x448:   	prefetcha	%i0 + %i4, 28
	.word	0xd240a030	! t0_kref+0x44c:   	ldsw	[%g2 + 0x30], %o1
	.word	0xd0780019	! t0_kref+0x450:   	swap	[%g0 + %i1], %o0
	.word	0xe1be584a	! t0_kref+0x454:   	stda	%f16, [%i1 + %o2]0xc2
	.word	0xf53e6018	! t0_kref+0x458:   	std	%f26, [%i1 + 0x18]
	.word	0xda26401c	! t0_kref+0x45c:   	st	%o5, [%i1 + %i4]
	.word	0xd248a01a	! t0_kref+0x460:   	ldsb	[%g2 + 0x1a], %o1
	.word	0xa90eba15	! t0_kref+0x464:   	tsubcc	%i2, -0x5eb, %l4
	.word	0xecf81018	! t0_kref+0x468:   	swapa	[%g0 + %i0]0x80, %l6
	.word	0x3d480004	! t0_kref+0x46c:   	fbule,a,pt	%fcc0, _kref+0x47c
	.word	0x92726906	! t0_kref+0x470:   	udiv	%o1, 0x906, %o1
	.word	0xde88a039	! t0_kref+0x474:   	lduba	[%g2 + 0x39]%asi, %o7
	.word	0xf11fbd68	! t0_kref+0x478:   	ldd	[%fp - 0x298], %f24
	.word	0x2d480003	! t0_kref+0x47c:   	fbg,a,pt	%fcc0, _kref+0x488
	.word	0x95a68952	! t0_kref+0x480:   	fmuld	%f26, %f18, %f10
	.word	0x9da018c6	! t0_kref+0x484:   	fdtos	%f6, %f14
	.word	0xae2d000d	! t0_kref+0x488:   	andn	%l4, %o5, %l7
	.word	0x98db401a	! t0_kref+0x48c:   	smulcc	%o5, %i2, %o4
	.word	0x80c24008	! t0_kref+0x490:   	addccc	%o1, %o0, %g0
	.word	0x90fa30b0	! t0_kref+0x494:   	sdivcc	%o0, -0xf50, %o0
	.word	0xac002b95	! t0_kref+0x498:   	add	%g0, 0xb95, %l6
	.word	0xd056001b	! t0_kref+0x49c:   	ldsh	[%i0 + %i3], %o0
	.word	0x92450015	! t0_kref+0x4a0:   	addc	%l4, %l5, %o1
	.word	0xef68a04e	! t0_kref+0x4a4:   	prefetch	%g2 + 0x4e, 23
	.word	0xfd380019	! t0_kref+0x4a8:   	std	%f30, [%g0 + %i1]
	.word	0x9e96b7ac	! t0_kref+0x4ac:   	orcc	%i2, -0x854, %o7
	.word	0x9de3bfa0	! t0_kref+0x4b0:   	save	%sp, -0x60, %sp
	.word	0x93ef2048	! t0_kref+0x4b4:   	restore	%i4, 0x48, %o1
	.word	0xd620a03c	! t0_kref+0x4b8:   	st	%o3, [%g2 + 0x3c]
	.word	0xa5a6882f	! t0_kref+0x4bc:   	fadds	%f26, %f15, %f18
	.word	0xa4c27d87	! t0_kref+0x4c0:   	addccc	%o1, -0x279, %l2
	.word	0xcd00a034	! t0_kref+0x4c4:   	ld	[%g2 + 0x34], %f6
	.word	0x9fc00004	! t0_kref+0x4c8:   	call	%g0 + %g4
	.word	0xe13e3ff8	! t0_kref+0x4cc:   	std	%f16, [%i0 - 8]
	.word	0x90deaf65	! t0_kref+0x4d0:   	smulcc	%i2, 0xf65, %o0
	.word	0xdd000018	! t0_kref+0x4d4:   	ld	[%g0 + %i0], %f14
	.word	0xf906601c	! t0_kref+0x4d8:   	ld	[%i1 + 0x1c], %f28
	.word	0x94300016	! t0_kref+0x4dc:   	orn	%g0, %l6, %o2
	.word	0xa9a20856	! t0_kref+0x4e0:   	faddd	%f8, %f22, %f20
	.word	0xe20e7fed	! t0_kref+0x4e4:   	ldub	[%i1 - 0x13], %l1
	.word	0xd4fe3ffc	! t0_kref+0x4e8:   	swapa	[%i0 - 4]%asi, %o2
	.word	0xec763fe8	! t0_kref+0x4ec:   	stx	%l6, [%i0 - 0x18]
	.word	0x3d480008	! t0_kref+0x4f0:   	fbule,a,pt	%fcc0, _kref+0x510
	.word	0xa5a5082b	! t0_kref+0x4f4:   	fadds	%f20, %f11, %f18
	.word	0x3c800004	! t0_kref+0x4f8:   	bpos,a	_kref+0x508
	.word	0x950a8016	! t0_kref+0x4fc:   	tsubcc	%o2, %l6, %o2
	.word	0x36800002	! t0_kref+0x500:   	bge,a	_kref+0x508
	.word	0xae5b78ce	! t0_kref+0x504:   	smul	%o5, -0x732, %l7
	.word	0xa262a476	! t0_kref+0x508:   	subc	%o2, 0x476, %l1
	.word	0xd4f66018	! t0_kref+0x50c:   	stxa	%o2, [%i1 + 0x18]%asi
	.word	0xee366000	! t0_kref+0x510:   	sth	%l7, [%i1]
	.word	0x27480003	! t0_kref+0x514:   	fbul,a,pt	%fcc0, _kref+0x520
	.word	0x93334015	! t0_kref+0x518:   	srl	%o5, %l5, %o1
	.word	0xe656c018	! t0_kref+0x51c:   	ldsh	[%i3 + %i0], %l3
	.word	0x91a60848	! t0_kref+0x520:   	faddd	%f24, %f8, %f8
	.word	0xaa0a7332	! t0_kref+0x524:   	and	%o1, -0xcce, %l5
	.word	0x9a2ab985	! t0_kref+0x528:   	andn	%o2, -0x67b, %o5
	.word	0x13380feb	! t0_kref+0x52c:   	sethi	%hi(0xe03fac00), %o1
	.word	0x9ea5000d	! t0_kref+0x530:   	subcc	%l4, %o5, %o7
	.word	0x3a480004	! t0_kref+0x534:   	bcc,a,pt	%icc, _kref+0x544
	.word	0x8143c000	! t0_kref+0x538:   	stbar
	.word	0xedee501a	! t0_kref+0x53c:   	prefetcha	%i1 + %i2, 22
	.word	0x9028000c	! t0_kref+0x540:   	andn	%g0, %o4, %o0
	.word	0xbda00539	! t0_kref+0x544:   	fsqrts	%f25, %f30
	.word	0xec3e2010	! t0_kref+0x548:   	std	%l6, [%i0 + 0x10]
	.word	0x9e5b775c	! t0_kref+0x54c:   	smul	%o5, -0x8a4, %o7
	.word	0xa5a00130	! t0_kref+0x550:   	fabss	%f16, %f18
	.word	0x8da408b9	! t0_kref+0x554:   	fsubs	%f16, %f25, %f6
	.word	0x913d2005	! t0_kref+0x558:   	sra	%l4, 0x5, %o0
	.word	0x9232a57e	! t0_kref+0x55c:   	orn	%o2, 0x57e, %o1
	.word	0xe4160000	! t0_kref+0x560:   	lduh	[%i0], %l2
	.word	0xe7ee101b	! t0_kref+0x564:   	prefetcha	%i0 + %i3, 19
	.word	0xa6fa0016	! t0_kref+0x568:   	sdivcc	%o0, %l6, %l3
	.word	0xf207bfe0	! t0_kref+0x56c:   	ld	[%fp - 0x20], %i1
	.word	0xa8bd3574	! t0_kref+0x570:   	xnorcc	%l4, -0xa8c, %l4
	.word	0x9ba0002d	! t0_kref+0x574:   	fmovs	%f13, %f13
	.word	0xe4180018	! t0_kref+0x578:   	ldd	[%g0 + %i0], %l2
	.word	0xcd3e6008	! t0_kref+0x57c:   	std	%f6, [%i1 + 8]
	.word	0xa612400b	! t0_kref+0x580:   	or	%o1, %o3, %l3
	.word	0xe440a034	! t0_kref+0x584:   	ldsw	[%g2 + 0x34], %l2
	.word	0xa285aa4a	! t0_kref+0x588:   	addcc	%l6, 0xa4a, %l1
	.word	0xc1082938	! t0_kref+0x58c:   	ld	[%g0 + 0x938], %fsr
	.word	0x9ba00032	! t0_kref+0x590:   	fmovs	%f18, %f13
	.word	0x801a4015	! t0_kref+0x594:   	xor	%o1, %l5, %g0
	.word	0xe4086034	! t0_kref+0x598:   	ldub	[%g1 + 0x34], %l2
	.word	0xa41ca00c	! t0_kref+0x59c:   	xor	%l2, 0xc, %l2
	.word	0xe4286034	! t0_kref+0x5a0:   	stb	%l2, [%g1 + 0x34]
	.word	0x81d86034	! t0_kref+0x5a4:   	flush	%g1 + 0x34
	.word	0xa8400015	! t0_kref+0x5a8:   	addc	%g0, %l5, %l4
	.word	0xaae53b3d	! t0_kref+0x5ac:   	subccc	%l4, -0x4c3, %l5
	.word	0x91a448b7	! t0_kref+0x5b0:   	fsubs	%f17, %f23, %f8
	.word	0xd4463ff8	! t0_kref+0x5b4:   	ldsw	[%i0 - 8], %o2
	.word	0xaba48930	! t0_kref+0x5b8:   	fmuls	%f18, %f16, %f21
	.word	0x8fa01088	! t0_kref+0x5bc:   	fxtos	%f8, %f7
	.word	0xa666800b	! t0_kref+0x5c0:   	subc	%i2, %o3, %l3
	.word	0xa2ab3d1e	! t0_kref+0x5c4:   	andncc	%o4, -0x2e2, %l1
	.word	0xd4be2000	! t0_kref+0x5c8:   	stda	%o2, [%i0]%asi
	.word	0x9e980000	! t0_kref+0x5cc:   	xorcc	%g0, %g0, %o7
2:	.word	0x98724017	! t0_kref+0x5d0:   	udiv	%o1, %l7, %o4
	.word	0xe09f5018	! t0_kref+0x5d4:   	ldda	[%i5 + %i0]0x80, %l0
	.word	0x95a01114	! t0_kref+0x5d8:   	fxtod	%f20, %f10
	.word	0xd656c018	! t0_kref+0x5dc:   	ldsh	[%i3 + %i0], %o3
	.word	0xd86e001a	! t0_kref+0x5e0:   	ldstub	[%i0 + %i2], %o4
	.word	0x9efb001a	! t0_kref+0x5e4:   	sdivcc	%o4, %i2, %o7
	.word	0xf7262000	! t0_kref+0x5e8:   	st	%f27, [%i0]
	.word	0x9b056a9d	! t0_kref+0x5ec:   	taddcc	%l5, 0xa9d, %o5
	call	1f
	.empty
	.word	0xec0e4000	! t0_kref+0x5f4:   	ldub	[%i1], %l6
	.word	0xea7e401c	! t0_kref+0x5f8:   	swap	[%i1 + %i4], %l5
	.word	0xd67e3ff8	! t0_kref+0x5fc:   	swap	[%i0 - 8], %o3
1:	.word	0x8035ad0c	! t0_kref+0x600:   	orn	%l6, 0xd0c, %g0
	.word	0x9473400d	! t0_kref+0x604:   	udiv	%o5, %o5, %o2
	.word	0xe51fbca0	! t0_kref+0x608:   	ldd	[%fp - 0x360], %f18
	.word	0xa91a000c	! t0_kref+0x60c:   	tsubcctv	%o0, %o4, %l4
	.word	0xb1a50837	! t0_kref+0x610:   	fadds	%f20, %f23, %f24
	.word	0xf3a0a020	! t0_kref+0x614:   	sta	%f25, [%g2 + 0x20]%asi
	.word	0x8610201d	! t0_kref+0x618:   	mov	0x1d, %g3
	.word	0x86a0e001	! t0_kref+0x61c:   	subcc	%g3, 1, %g3
	.word	0x2280000e	! t0_kref+0x620:   	be,a	_kref+0x658
	.word	0x2f147993	! t0_kref+0x624:   	sethi	%hi(0x51e64c00), %l7
	.word	0xaa353586	! t0_kref+0x628:   	orn	%l4, -0xa7a, %l5
	.word	0xe51e6010	! t0_kref+0x62c:   	ldd	[%i1 + 0x10], %f18
	.word	0x8fa0188f	! t0_kref+0x630:   	fitos	%f15, %f7
	.word	0xe91e6018	! t0_kref+0x634:   	ldd	[%i1 + 0x18], %f20
	.word	0x90bab577	! t0_kref+0x638:   	xnorcc	%o2, -0xa89, %o0
	.word	0x8fa4c829	! t0_kref+0x63c:   	fadds	%f19, %f9, %f7
	.word	0x81800000	! t0_kref+0x640:   	mov	%g0, %y
	.word	0x8fa01a27	! t0_kref+0x644:   	fstoi	%f7, %f7
	.word	0x28800004	! t0_kref+0x648:   	bleu,a	_kref+0x658
	.word	0xf1bf1a58	! t0_kref+0x64c:   	stda	%f24, [%i4 + %i0]0xd2
	.word	0x99230000	! t0_kref+0x650:   	mulscc	%o4, %g0, %o4
	.word	0xe1e8a004	! t0_kref+0x654:   	prefetcha	%g2 + 4, 16
	.word	0xe06e0000	! t0_kref+0x658:   	ldstub	[%i0], %l0
	.word	0xb9a94054	! t0_kref+0x65c:   	fmovdug	%fcc0, %f20, %f28
	.word	0x2d480006	! t0_kref+0x660:   	fbg,a,pt	%fcc0, _kref+0x678
	.word	0x81dac005	! t0_kref+0x664:   	flush	%o3 + %g5
	.word	0x3a800004	! t0_kref+0x668:   	bcc,a	_kref+0x678
	.word	0xec270018	! t0_kref+0x66c:   	st	%l6, [%i4 + %i0]
	.word	0xa1a0052d	! t0_kref+0x670:   	fsqrts	%f13, %f16
	.word	0xe6166002	! t0_kref+0x674:   	lduh	[%i1 + 2], %l3
	.word	0x9fc10000	! t0_kref+0x678:   	call	%g4
	.word	0xd4b0a002	! t0_kref+0x67c:   	stha	%o2, [%g2 + 2]%asi
	.word	0xac050014	! t0_kref+0x680:   	add	%l4, %l4, %l6
	.word	0xea96d040	! t0_kref+0x684:   	lduha	[%i3]0x82, %l5
	.word	0xd440a020	! t0_kref+0x688:   	ldsw	[%g2 + 0x20], %o2
	.word	0xd0763fe8	! t0_kref+0x68c:   	stx	%o0, [%i0 - 0x18]
	sethi	%hi(2f), %o7
	.word	0xe40be2d0	! t0_kref+0x694:   	ldub	[%o7 + 0x2d0], %l2
	.word	0xa41ca00c	! t0_kref+0x698:   	xor	%l2, 0xc, %l2
	.word	0xe42be2d0	! t0_kref+0x69c:   	stb	%l2, [%o7 + 0x2d0]
	.word	0x81dbe2d0	! t0_kref+0x6a0:   	flush	%o7 + 0x2d0
	.word	0x9138200d	! t0_kref+0x6a4:   	sra	%g0, 0xd, %o0
	.word	0xac3b4008	! t0_kref+0x6a8:   	xnor	%o5, %o0, %l6
	.word	0xd890a022	! t0_kref+0x6ac:   	lduha	[%g2 + 0x22]%asi, %o4
	.word	0xd406001c	! t0_kref+0x6b0:   	ld	[%i0 + %i4], %o2
	.word	0x91a0002e	! t0_kref+0x6b4:   	fmovs	%f14, %f8
	.word	0xea6e3feb	! t0_kref+0x6b8:   	ldstub	[%i0 - 0x15], %l5
	.word	0x8002b26f	! t0_kref+0x6bc:   	add	%o2, -0xd91, %g0
	.word	0xbda50952	! t0_kref+0x6c0:   	fmuld	%f20, %f18, %f30
	.word	0xd93e6008	! t0_kref+0x6c4:   	std	%f12, [%i1 + 8]
	.word	0x2537912f	! t0_kref+0x6c8:   	sethi	%hi(0xde44bc00), %l2
	.word	0x9702edae	! t0_kref+0x6cc:   	taddcc	%o3, 0xdae, %o3
2:	.word	0xda56001b	! t0_kref+0x6d0:   	ldsh	[%i0 + %i3], %o5
	.word	0x96c22215	! t0_kref+0x6d4:   	addccc	%o0, 0x215, %o3
	.word	0x86102003	! t0_kref+0x6d8:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x6dc:   	bne,a	_kref+0x6dc
	.word	0x86a0e001	! t0_kref+0x6e0:   	subcc	%g3, 1, %g3
	.word	0x99a0190c	! t0_kref+0x6e4:   	fitod	%f12, %f12
	.word	0xa8834008	! t0_kref+0x6e8:   	addcc	%o5, %o0, %l4
	.word	0x28800008	! t0_kref+0x6ec:   	bleu,a	_kref+0x70c
	.word	0xd2762018	! t0_kref+0x6f0:   	stx	%o1, [%i0 + 0x18]
	.word	0xd62e4000	! t0_kref+0x6f4:   	stb	%o3, [%i1]
	.word	0xdd1fbfc0	! t0_kref+0x6f8:   	ldd	[%fp - 0x40], %f14
	.word	0x95a01a3d	! t0_kref+0x6fc:   	fstoi	%f29, %f10
	.word	0xc0762008	! t0_kref+0x700:   	stx	%g0, [%i0 + 8]
	.word	0x81deb07f	! t0_kref+0x704:   	flush	%i2 - 0xf81
	.word	0xb1a0013d	! t0_kref+0x708:   	fabss	%f29, %f24
	.word	0xa730000a	! t0_kref+0x70c:   	srl	%g0, %o2, %l3
	.word	0xd91e001d	! t0_kref+0x710:   	ldd	[%i0 + %i5], %f12
	.word	0xda270019	! t0_kref+0x714:   	st	%o5, [%i4 + %i1]
	.word	0x9f3ae01c	! t0_kref+0x718:   	sra	%o3, 0x1c, %o7
	.word	0x90020016	! t0_kref+0x71c:   	add	%o0, %l6, %o0
	.word	0xa53a800c	! t0_kref+0x720:   	sra	%o2, %o4, %l2
	.word	0xde0e401a	! t0_kref+0x724:   	ldub	[%i1 + %i2], %o7
	.word	0xe66e401a	! t0_kref+0x728:   	ldstub	[%i1 + %i2], %l3
	.word	0xa4c03d47	! t0_kref+0x72c:   	addccc	%g0, -0x2b9, %l2
	.word	0xa9a01892	! t0_kref+0x730:   	fitos	%f18, %f20
	.word	0x99a28832	! t0_kref+0x734:   	fadds	%f10, %f18, %f12
	.word	0xafa0188f	! t0_kref+0x738:   	fitos	%f15, %f23
	.word	0xb3a01a2b	! t0_kref+0x73c:   	fstoi	%f11, %f25
	.word	0x8da30850	! t0_kref+0x740:   	faddd	%f12, %f16, %f6
	.word	0x9843001a	! t0_kref+0x744:   	addc	%o4, %i2, %o4
	call	1f
	.empty
	.word	0x9a1a0016	! t0_kref+0x74c:   	xor	%o0, %l6, %o5
	.word	0x99332008	! t0_kref+0x750:   	srl	%o4, 0x8, %o4
	.word	0x9da01a3a	! t0_kref+0x754:   	fstoi	%f26, %f14
	.word	0x80ba000a	! t0_kref+0x758:   	xnorcc	%o0, %o2, %g0
1:	.word	0x9fc00004	! t0_kref+0x75c:   	call	%g0 + %g4
	.word	0x94f30015	! t0_kref+0x760:   	udivcc	%o4, %l5, %o2
	.word	0x28800008	! t0_kref+0x764:   	bleu,a	_kref+0x784
	.word	0xa7a000b5	! t0_kref+0x768:   	fnegs	%f21, %f19
	.word	0xafa01888	! t0_kref+0x76c:   	fitos	%f8, %f23
	.word	0xa9a189d0	! t0_kref+0x770:   	fdivd	%f6, %f16, %f20
	.word	0x9732400a	! t0_kref+0x774:   	srl	%o1, %o2, %o3
	.word	0x81df72b6	! t0_kref+0x778:   	flush	%i5 - 0xd4a
	.word	0xed3e6018	! t0_kref+0x77c:   	std	%f22, [%i1 + 0x18]
	.word	0xada00038	! t0_kref+0x780:   	fmovs	%f24, %f22
	.word	0xf207bfe0	! t0_kref+0x784:   	ld	[%fp - 0x20], %i1
	.word	0xa4ddc008	! t0_kref+0x788:   	smulcc	%l7, %o0, %l2
	.word	0xd828a033	! t0_kref+0x78c:   	stb	%o4, [%g2 + 0x33]
	.word	0xac72c00b	! t0_kref+0x790:   	udiv	%o3, %o3, %l6
	.word	0xd4ce9018	! t0_kref+0x794:   	ldsba	[%i2 + %i0]0x80, %o2
	.word	0xd228a00d	! t0_kref+0x798:   	stb	%o1, [%g2 + 0xd]
	.word	0xc12e3fe4	! t0_kref+0x79c:   	st	%fsr, [%i0 - 0x1c]
	.word	0x90c5000c	! t0_kref+0x7a0:   	addccc	%l4, %o4, %o0
	.word	0x9a733ac9	! t0_kref+0x7a4:   	udiv	%o4, -0x537, %o5
	.word	0x98758017	! t0_kref+0x7a8:   	udiv	%l6, %l7, %o4
	.word	0x9e0a30bd	! t0_kref+0x7ac:   	and	%o0, -0xf43, %o7
	.word	0x2b480003	! t0_kref+0x7b0:   	fbug,a,pt	%fcc0, _kref+0x7bc
	.word	0x1b0f486b	! t0_kref+0x7b4:   	sethi	%hi(0x3d21ac00), %o5
	.word	0xe46e8018	! t0_kref+0x7b8:   	ldstub	[%i2 + %i0], %l2
	.word	0x90f2400c	! t0_kref+0x7bc:   	udivcc	%o1, %o4, %o0
	.word	0xb1a6884a	! t0_kref+0x7c0:   	faddd	%f26, %f10, %f24
	.word	0x9e3a4017	! t0_kref+0x7c4:   	xnor	%o1, %l7, %o7
	.word	0xada01a37	! t0_kref+0x7c8:   	fstoi	%f23, %f22
	.word	0xb9a24d32	! t0_kref+0x7cc:   	fsmuld	%f9, %f18, %f28
	.word	0xa6a56e95	! t0_kref+0x7d0:   	subcc	%l5, 0xe95, %l3
	.word	0x28480001	! t0_kref+0x7d4:   	bleu,a,pt	%icc, _kref+0x7d8
	.word	0x98fd4008	! t0_kref+0x7d8:   	sdivcc	%l5, %o0, %o4
	.word	0xe53e3ff8	! t0_kref+0x7dc:   	std	%f18, [%i0 - 8]
	.word	0x83414000	! t0_kref+0x7e0:   	mov	%pc, %g1
	.word	0xa5a1893b	! t0_kref+0x7e4:   	fmuls	%f6, %f27, %f18
	.word	0xa5a5cd2e	! t0_kref+0x7e8:   	fsmuld	%f23, %f14, %f18
	.word	0xa140c000	! t0_kref+0x7ec:   	mov	%asi, %l0
	.word	0xd8066000	! t0_kref+0x7f0:   	ld	[%i1], %o4
	.word	0xd4366000	! t0_kref+0x7f4:   	sth	%o2, [%i1]
	.word	0x90358017	! t0_kref+0x7f8:   	orn	%l6, %l7, %o0
	.word	0x81df3b2b	! t0_kref+0x7fc:   	flush	%i4 - 0x4d5
	.word	0x81aa8ad4	! t0_kref+0x800:   	fcmped	%fcc0, %f10, %f20
	.word	0xd6c0a004	! t0_kref+0x804:   	ldswa	[%g2 + 4]%asi, %o3
	.word	0x81ae8acc	! t0_kref+0x808:   	fcmped	%fcc0, %f26, %f12
	.word	0x132d1a62	! t0_kref+0x80c:   	sethi	%hi(0xb4698800), %o1
	.word	0x81400000	! t0_kref+0x810:   	mov	%y, %g0
	.word	0x81834000	! t0_kref+0x814:   	wr	%o5, %g0, %y
	.word	0x99a548b8	! t0_kref+0x818:   	fsubs	%f21, %f24, %f12
	.word	0xada01118	! t0_kref+0x81c:   	fxtod	%f24, %f22
	.word	0x27480003	! t0_kref+0x820:   	fbul,a,pt	%fcc0, _kref+0x82c
	.word	0xeca67fe4	! t0_kref+0x824:   	sta	%l6, [%i1 - 0x1c]%asi
	.word	0xe8a0a034	! t0_kref+0x828:   	sta	%l4, [%g2 + 0x34]%asi
	.word	0xa7a0053b	! t0_kref+0x82c:   	fsqrts	%f27, %f19
	.word	0x9672c01a	! t0_kref+0x830:   	udiv	%o3, %i2, %o3
	.word	0x9122800a	! t0_kref+0x834:   	mulscc	%o2, %o2, %o0
	.word	0x9fc10000	! t0_kref+0x838:   	call	%g4
	.word	0xe106401c	! t0_kref+0x83c:   	ld	[%i1 + %i4], %f16
	.word	0x9a7a800a	! t0_kref+0x840:   	sdiv	%o2, %o2, %o5
	.word	0xda160000	! t0_kref+0x844:   	lduh	[%i0], %o5
	.word	0x86102004	! t0_kref+0x848:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x84c:   	bne,a	_kref+0x84c
	.word	0x86a0e001	! t0_kref+0x850:   	subcc	%g3, 1, %g3
	.word	0xe27e3fe4	! t0_kref+0x854:   	swap	[%i0 - 0x1c], %l1
	.word	0xfd1e3ff0	! t0_kref+0x858:   	ldd	[%i0 - 0x10], %f30
	.word	0xad3d601b	! t0_kref+0x85c:   	sra	%l5, 0x1b, %l6
	.word	0x9da709d6	! t0_kref+0x860:   	fdivd	%f28, %f22, %f14
	.word	0xd7863fe8	! t0_kref+0x864:   	lda	[%i0 - 0x18]%asi, %f11
	.word	0x96a30015	! t0_kref+0x868:   	subcc	%o4, %l5, %o3
	.word	0xb1a409ce	! t0_kref+0x86c:   	fdivd	%f16, %f14, %f24
	.word	0xe4560000	! t0_kref+0x870:   	ldsh	[%i0], %l2
	.word	0x952a0016	! t0_kref+0x874:   	sll	%o0, %l6, %o2
	.word	0xec162002	! t0_kref+0x878:   	lduh	[%i0 + 2], %l6
	.word	0xec6e0000	! t0_kref+0x87c:   	ldstub	[%i0], %l6
	.word	0x80feaaa0	! t0_kref+0x880:   	sdivcc	%i2, 0xaa0, %g0
	.word	0xa7a0052d	! t0_kref+0x884:   	fsqrts	%f13, %f19
	.word	0xd4162000	! t0_kref+0x888:   	lduh	[%i0], %o2
	.word	0x29480008	! t0_kref+0x88c:   	fbl,a,pt	%fcc0, _kref+0x8ac
	.word	0x90f50016	! t0_kref+0x890:   	udivcc	%l4, %l6, %o0
	.word	0xa0158000	! t0_kref+0x894:   	or	%l6, %g0, %l0
	.word	0xada2cd30	! t0_kref+0x898:   	fsmuld	%f11, %f16, %f22
	.word	0x92636c49	! t0_kref+0x89c:   	subc	%o5, 0xc49, %o1
	.word	0x9fc10000	! t0_kref+0x8a0:   	call	%g4
	.word	0xafa01a2e	! t0_kref+0x8a4:   	fstoi	%f14, %f23
	.word	0xd9beda18	! t0_kref+0x8a8:   	stda	%f12, [%i3 + %i0]0xd0
	.word	0x26800008	! t0_kref+0x8ac:   	bl,a	_kref+0x8cc
	.word	0xa20aab64	! t0_kref+0x8b0:   	and	%o2, 0xb64, %l1
	.word	0xa6157b4a	! t0_kref+0x8b4:   	or	%l5, -0x4b6, %l3
	.word	0x3e800005	! t0_kref+0x8b8:   	bvc,a	_kref+0x8cc
	.word	0x9ef56e1b	! t0_kref+0x8bc:   	udivcc	%l5, 0xe1b, %o7
	.word	0xa2c2ec09	! t0_kref+0x8c0:   	addccc	%o3, 0xc09, %l1
	.word	0xb1a6095c	! t0_kref+0x8c4:   	fmuld	%f24, %f28, %f24
	.word	0xd688a014	! t0_kref+0x8c8:   	lduba	[%g2 + 0x14]%asi, %o3
	.word	0x9fc00004	! t0_kref+0x8cc:   	call	%g0 + %g4
	.word	0xe8064000	! t0_kref+0x8d0:   	ld	[%i1], %l4
	.word	0x20800005	! t0_kref+0x8d4:   	bn,a	_kref+0x8e8
	.word	0x95a00528	! t0_kref+0x8d8:   	fsqrts	%f8, %f10
	.word	0x90fb67e2	! t0_kref+0x8dc:   	sdivcc	%o5, 0x7e2, %o0
	.word	0xd91fbc78	! t0_kref+0x8e0:   	ldd	[%fp - 0x388], %f12
	.word	0x99a0192f	! t0_kref+0x8e4:   	fstod	%f15, %f12
	.word	0x3a800004	! t0_kref+0x8e8:   	bcc,a	_kref+0x8f8
	.word	0xad252a7d	! t0_kref+0x8ec:   	mulscc	%l4, 0xa7d, %l6
	.word	0x8da018ca	! t0_kref+0x8f0:   	fdtos	%f10, %f6
	.word	0xd67f0018	! t0_kref+0x8f4:   	swap	[%i4 + %i0], %o3
	.word	0xf9b81018	! t0_kref+0x8f8:   	stda	%f28, [%g0 + %i0]0x80
	.word	0xe2ee601c	! t0_kref+0x8fc:   	ldstuba	[%i1 + 0x1c]%asi, %l1
	.word	0xa5a00126	! t0_kref+0x900:   	fabss	%f6, %f18
	.word	0xab400000	! t0_kref+0x904:   	mov	%y, %l5
	.word	0xd0366002	! t0_kref+0x908:   	sth	%o0, [%i1 + 2]
	.word	0xf900a030	! t0_kref+0x90c:   	ld	[%g2 + 0x30], %f28
	.word	0xb5a000dc	! t0_kref+0x910:   	fnegd	%f28, %f26
	.word	0xe8a8a010	! t0_kref+0x914:   	stba	%l4, [%g2 + 0x10]%asi
	.word	0x83414000	! t0_kref+0x918:   	mov	%pc, %g1
	.word	0xa3a01a35	! t0_kref+0x91c:   	fstoi	%f21, %f17
	.word	0xe706600c	! t0_kref+0x920:   	ld	[%i1 + 0xc], %f19
	.word	0x30800004	! t0_kref+0x924:   	ba,a	_kref+0x934
	.word	0xa11ac00c	! t0_kref+0x928:   	tsubcctv	%o3, %o4, %l0
	.word	0x97a018cc	! t0_kref+0x92c:   	fdtos	%f12, %f11
	.word	0xe2080018	! t0_kref+0x930:   	ldub	[%g0 + %i0], %l1
	.word	0xd44e200b	! t0_kref+0x934:   	ldsb	[%i0 + 0xb], %o2
	.word	0x2f480008	! t0_kref+0x938:   	fbu,a,pt	%fcc0, _kref+0x958
	.word	0xe51f4019	! t0_kref+0x93c:   	ldd	[%i5 + %i1], %f18
	.word	0x81dac010	! t0_kref+0x940:   	flush	%o3 + %l0
	.word	0x3b480006	! t0_kref+0x944:   	fble,a,pt	%fcc0, _kref+0x95c
	.word	0xc006600c	! t0_kref+0x948:   	ld	[%i1 + 0xc], %g0
	.word	0xb9a01926	! t0_kref+0x94c:   	fstod	%f6, %f28
	.word	0xd66e601f	! t0_kref+0x950:   	ldstub	[%i1 + 0x1f], %o3
	.word	0xa41aba08	! t0_kref+0x954:   	xor	%o2, -0x5f8, %l2
	.word	0xa7a0052e	! t0_kref+0x958:   	fsqrts	%f14, %f19
	.word	0x9ba00035	! t0_kref+0x95c:   	fmovs	%f21, %f13
	.word	0xb1a00538	! t0_kref+0x960:   	fsqrts	%f24, %f24
	.word	0xb9a408b1	! t0_kref+0x964:   	fsubs	%f16, %f17, %f28
	.word	0xe700a000	! t0_kref+0x968:   	ld	[%g2], %f19
	.word	0xdda0a00c	! t0_kref+0x96c:   	sta	%f14, [%g2 + 0xc]%asi
	.word	0x97a0188f	! t0_kref+0x970:   	fitos	%f15, %f11
	.word	0xeb067fec	! t0_kref+0x974:   	ld	[%i1 - 0x14], %f21
	.word	0x86102005	! t0_kref+0x978:   	mov	0x5, %g3
	.word	0x86a0e001	! t0_kref+0x97c:   	subcc	%g3, 1, %g3
	.word	0x2280000c	! t0_kref+0x980:   	be,a	_kref+0x9b0
	.word	0xe2c8a005	! t0_kref+0x984:   	ldsba	[%g2 + 5]%asi, %l1
	.word	0x81adca26	! t0_kref+0x988:   	fcmps	%fcc0, %f23, %f6
	.word	0xa45aa323	! t0_kref+0x98c:   	smul	%o2, 0x323, %l2
	.word	0x25480007	! t0_kref+0x990:   	fblg,a,pt	%fcc0, _kref+0x9ac
	.word	0xae3d0000	! t0_kref+0x994:   	not	%l4, %l7
	.word	0xe400a014	! t0_kref+0x998:   	ld	[%g2 + 0x14], %l2
	.word	0xf4367fe0	! t0_kref+0x99c:   	sth	%i2, [%i1 - 0x20]
	.word	0xa1a70933	! t0_kref+0x9a0:   	fmuls	%f28, %f19, %f16
	.word	0xada748b0	! t0_kref+0x9a4:   	fsubs	%f29, %f16, %f22
	.word	0xd8c0a03c	! t0_kref+0x9a8:   	ldswa	[%g2 + 0x3c]%asi, %o4
	.word	0xd5f65016	! t0_kref+0x9ac:   	casxa	[%i1]0x80, %l6, %o2
	.word	0xd1be9a18	! t0_kref+0x9b0:   	stda	%f8, [%i2 + %i0]0xd0
	.word	0xafa4c8ba	! t0_kref+0x9b4:   	fsubs	%f19, %f26, %f23
	.word	0xd430a030	! t0_kref+0x9b8:   	sth	%o2, [%g2 + 0x30]
	.word	0x3d480008	! t0_kref+0x9bc:   	fbule,a,pt	%fcc0, _kref+0x9dc
	.word	0xe8180018	! t0_kref+0x9c0:   	ldd	[%g0 + %i0], %l4
	.word	0x9da01a36	! t0_kref+0x9c4:   	fstoi	%f22, %f14
	.word	0x81850000	! t0_kref+0x9c8:   	wr	%l4, %g0, %y
	.word	0xa663311f	! t0_kref+0x9cc:   	subc	%o4, -0xee1, %l3
	.word	0xa4dd75c7	! t0_kref+0x9d0:   	smulcc	%l5, -0xa39, %l2
	.word	0x9f32601d	! t0_kref+0x9d4:   	srl	%o1, 0x1d, %o7
	.word	0xd8e81018	! t0_kref+0x9d8:   	ldstuba	[%g0 + %i0]0x80, %o4
	.word	0x9ef54008	! t0_kref+0x9dc:   	udivcc	%l5, %o0, %o7
	.word	0xd2a8a023	! t0_kref+0x9e0:   	stba	%o1, [%g2 + 0x23]%asi
	.word	0xe53e001d	! t0_kref+0x9e4:   	std	%f18, [%i0 + %i5]
	.word	0xda88a004	! t0_kref+0x9e8:   	lduba	[%g2 + 4]%asi, %o5
	.word	0xda56c018	! t0_kref+0x9ec:   	ldsh	[%i3 + %i0], %o5
	.word	0x8032f1fc	! t0_kref+0x9f0:   	orn	%o3, -0xe04, %g0
	.word	0xd2ee9019	! t0_kref+0x9f4:   	ldstuba	[%i2 + %i1]0x80, %o1
	.word	0xa87a7bca	! t0_kref+0x9f8:   	sdiv	%o1, -0x436, %l4
	.word	0x86102003	! t0_kref+0x9fc:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0xa00:   	bne,a	_kref+0xa00
	.word	0x86a0e001	! t0_kref+0xa04:   	subcc	%g3, 1, %g3
	.word	0xe580a01c	! t0_kref+0xa08:   	lda	[%g2 + 0x1c]%asi, %f18
	.word	0x94424000	! t0_kref+0xa0c:   	addc	%o1, %g0, %o2
	.word	0xec866008	! t0_kref+0xa10:   	lda	[%i1 + 8]%asi, %l6
	.word	0xfd00a034	! t0_kref+0xa14:   	ld	[%g2 + 0x34], %f30
	.word	0x9da00133	! t0_kref+0xa18:   	fabss	%f19, %f14
	.word	0x9de3bfa0	! t0_kref+0xa1c:   	save	%sp, -0x60, %sp
	.word	0xb62e8018	! t0_kref+0xa20:   	andn	%i2, %i0, %i3
	.word	0xabef7331	! t0_kref+0xa24:   	restore	%i5, -0xccf, %l5
	.word	0xcd1fbd88	! t0_kref+0xa28:   	ldd	[%fp - 0x278], %f6
	.word	0xe6100019	! t0_kref+0xa2c:   	lduh	[%g0 + %i1], %l3
	.word	0xd436001b	! t0_kref+0xa30:   	sth	%o2, [%i0 + %i3]
	.word	0xa8bb400b	! t0_kref+0xa34:   	xnorcc	%o5, %o3, %l4
	.word	0x811833e2	! t0_kref+0xa38:   	tsubcctv	%g0, -0xc1e, %g0
	.word	0xaa65c009	! t0_kref+0xa3c:   	subc	%l7, %o1, %l5
	.word	0x3d480005	! t0_kref+0xa40:   	fbule,a,pt	%fcc0, _kref+0xa54
	.word	0x967b400b	! t0_kref+0xa44:   	sdiv	%o5, %o3, %o3
	.word	0xa8fb0016	! t0_kref+0xa48:   	sdivcc	%o4, %l6, %l4
	.word	0x8d85801a	! t0_kref+0xa4c:   	wr	%l6, %i2, %fprs
	.word	0xb7a018d6	! t0_kref+0xa50:   	fdtos	%f22, %f27
	.word	0x9de3bfa0	! t0_kref+0xa54:   	save	%sp, -0x60, %sp
	.word	0x80360018	! t0_kref+0xa58:   	orn	%i0, %i0, %g0
	.word	0x97ee75d9	! t0_kref+0xa5c:   	restore	%i1, -0xa27, %o3
	.word	0x2c480007	! t0_kref+0xa60:   	bneg,a,pt	%icc, _kref+0xa7c
	.word	0x91a000d0	! t0_kref+0xa64:   	fnegd	%f16, %f8
	.word	0xaa5eabfe	! t0_kref+0xa68:   	smul	%i2, 0xbfe, %l5
	.word	0x39480005	! t0_kref+0xa6c:   	fbuge,a,pt	%fcc0, _kref+0xa80
	.word	0xd4ce9040	! t0_kref+0xa70:   	ldsba	[%i2]0x82, %o2
	.word	0xada709ce	! t0_kref+0xa74:   	fdivd	%f28, %f14, %f22
	.word	0x34800001	! t0_kref+0xa78:   	bg,a	_kref+0xa7c
	.word	0x8002f982	! t0_kref+0xa7c:   	add	%o3, -0x67e, %g0
	.word	0x80f2fe5e	! t0_kref+0xa80:   	udivcc	%o3, -0x1a2, %g0
	.word	0xc368a001	! t0_kref+0xa84:   	prefetch	%g2 + 1, 1
	.word	0xa03d3ee4	! t0_kref+0xa88:   	xnor	%l4, -0x11c, %l0
	.word	0xaba5c927	! t0_kref+0xa8c:   	fmuls	%f23, %f7, %f21
	.word	0xae1ab784	! t0_kref+0xa90:   	xor	%o2, -0x87c, %l7
	.word	0xa4820000	! t0_kref+0xa94:   	addcc	%o0, %g0, %l2
	.word	0xab328008	! t0_kref+0xa98:   	srl	%o2, %o0, %l5
	.word	0xfd3e401d	! t0_kref+0xa9c:   	std	%f30, [%i1 + %i5]
	.word	0xd8560000	! t0_kref+0xaa0:   	ldsh	[%i0], %o4
	.word	0xd8267fe4	! t0_kref+0xaa4:   	st	%o4, [%i1 - 0x1c]
	.word	0x3a800007	! t0_kref+0xaa8:   	bcc,a	_kref+0xac4
	.word	0xe9be1a1a	! t0_kref+0xaac:   	stda	%f20, [%i0 + %i2]0xd0
	.word	0x902afd25	! t0_kref+0xab0:   	andn	%o3, -0x2db, %o0
	.word	0xec4e2000	! t0_kref+0xab4:   	ldsb	[%i0], %l6
	.word	0xe81e401d	! t0_kref+0xab8:   	ldd	[%i1 + %i5], %l4
	.word	0x30800006	! t0_kref+0xabc:   	ba,a	_kref+0xad4
	.word	0xc568a041	! t0_kref+0xac0:   	prefetch	%g2 + 0x41, 2
	.word	0x2a480001	! t0_kref+0xac4:   	bcs,a,pt	%icc, _kref+0xac8
	.word	0xa32b0016	! t0_kref+0xac8:   	sll	%o4, %l6, %l1
	.word	0x960d6b4a	! t0_kref+0xacc:   	and	%l5, 0xb4a, %o3
	.word	0xaefac014	! t0_kref+0xad0:   	sdivcc	%o3, %l4, %l7
	.word	0x9452c009	! t0_kref+0xad4:   	umul	%o3, %o1, %o2
	.word	0xdbf6501a	! t0_kref+0xad8:   	casxa	[%i1]0x80, %i2, %o5
	.word	0xd228a01b	! t0_kref+0xadc:   	stb	%o1, [%g2 + 0x1b]
	.word	0xada28956	! t0_kref+0xae0:   	fmuld	%f10, %f22, %f22
	.word	0x2a480002	! t0_kref+0xae4:   	bcs,a,pt	%icc, _kref+0xaec
	.word	0xaa3ac014	! t0_kref+0xae8:   	xnor	%o3, %l4, %l5
	.word	0x9e383e6c	! t0_kref+0xaec:   	xnor	%g0, -0x194, %o7
	.word	0xa85021d3	! t0_kref+0xaf0:   	umul	%g0, 0x1d3, %l4
	.word	0xe11fbd48	! t0_kref+0xaf4:   	ldd	[%fp - 0x2b8], %f16
	.word	0x98c2b3bd	! t0_kref+0xaf8:   	addccc	%o2, -0xc43, %o4
	.word	0xb1a5885c	! t0_kref+0xafc:   	faddd	%f22, %f28, %f24
	.word	0x9f3a4000	! t0_kref+0xb00:   	sra	%o1, %g0, %o7
	.word	0xdab0a012	! t0_kref+0xb04:   	stha	%o5, [%g2 + 0x12]%asi
	.word	0xe780a000	! t0_kref+0xb08:   	lda	[%g2]%asi, %f19
	.word	0xd9bf1a59	! t0_kref+0xb0c:   	stda	%f12, [%i4 + %i1]0xd2
	.word	0xada0002e	! t0_kref+0xb10:   	fmovs	%f14, %f22
	.word	0x81dcc01c	! t0_kref+0xb14:   	flush	%l3 + %i4
	.word	0xa8557a49	! t0_kref+0xb18:   	umul	%l5, -0x5b7, %l4
	.word	0x80bd3d34	! t0_kref+0xb1c:   	xnorcc	%l4, -0x2cc, %g0
	.word	0xc12e6014	! t0_kref+0xb20:   	st	%fsr, [%i1 + 0x14]
	.word	0xdd062010	! t0_kref+0xb24:   	ld	[%i0 + 0x10], %f14
	.word	0x91a01a2f	! t0_kref+0xb28:   	fstoi	%f15, %f8
	.word	0xa1a288ac	! t0_kref+0xb2c:   	fsubs	%f10, %f12, %f16
	.word	0xaba549b3	! t0_kref+0xb30:   	fdivs	%f21, %f19, %f21
	.word	0x2e800001	! t0_kref+0xb34:   	bvs,a	_kref+0xb38
	.word	0x9b32a00c	! t0_kref+0xb38:   	srl	%o2, 0xc, %o5
	.word	0xea2e4000	! t0_kref+0xb3c:   	stb	%l5, [%i1]
	.word	0x35480008	! t0_kref+0xb40:   	fbue,a,pt	%fcc0, _kref+0xb60
	.word	0xb5a189ce	! t0_kref+0xb44:   	fdivd	%f6, %f14, %f26
	.word	0xae0a203b	! t0_kref+0xb48:   	and	%o0, 0x3b, %l7
	call	SYM(t0_subr3)
	.word	0xf91fbcd0	! t0_kref+0xb50:   	ldd	[%fp - 0x330], %f28
	.word	0x9fc10000	! t0_kref+0xb54:   	call	%g4
	.word	0xea263fe0	! t0_kref+0xb58:   	st	%l5, [%i0 - 0x20]
	.word	0x99a50850	! t0_kref+0xb5c:   	faddd	%f20, %f16, %f12
	.word	0x9de3bfa0	! t0_kref+0xb60:   	save	%sp, -0x60, %sp
	.word	0xb8ae401c	! t0_kref+0xb64:   	andncc	%i1, %i4, %i4
	.word	0xa9ef001a	! t0_kref+0xb68:   	restore	%i4, %i2, %l4
	.word	0xaba00031	! t0_kref+0xb6c:   	fmovs	%f17, %f21
	.word	0x99a01a46	! t0_kref+0xb70:   	fdtoi	%f6, %f12
	.word	0x86102014	! t0_kref+0xb74:   	mov	0x14, %g3
	.word	0x86a0e001	! t0_kref+0xb78:   	subcc	%g3, 1, %g3
	.word	0x2280001f	! t0_kref+0xb7c:   	be,a	_kref+0xbf8
	.word	0xec2e600f	! t0_kref+0xb80:   	stb	%l6, [%i1 + 0xf]
	.word	0x95a3885c	! t0_kref+0xb84:   	faddd	%f14, %f28, %f10
	.word	0xa87d8000	! t0_kref+0xb88:   	sdiv	%l6, %g0, %l4
	.word	0x943a800a	! t0_kref+0xb8c:   	xnor	%o2, %o2, %o2
	.word	0xa7a00539	! t0_kref+0xb90:   	fsqrts	%f25, %f19
	.word	0xd8780018	! t0_kref+0xb94:   	swap	[%g0 + %i0], %o4
	.word	0xd82e401a	! t0_kref+0xb98:   	stb	%o4, [%i1 + %i2]
	.word	0x9da01116	! t0_kref+0xb9c:   	fxtod	%f22, %f14
	.word	0xde0e8019	! t0_kref+0xba0:   	ldub	[%i2 + %i1], %o7
	.word	0xada2c8ae	! t0_kref+0xba4:   	fsubs	%f11, %f14, %f22
	.word	0xe6782c38	! t0_kref+0xba8:   	swap	[%g0 + 0xc38], %l3
	.word	0xf306001c	! t0_kref+0xbac:   	ld	[%i0 + %i4], %f25
	.word	0xa5a708af	! t0_kref+0xbb0:   	fsubs	%f28, %f15, %f18
	.word	0xd028a016	! t0_kref+0xbb4:   	stb	%o0, [%g2 + 0x16]
	.word	0xdd00a014	! t0_kref+0xbb8:   	ld	[%g2 + 0x14], %f14
	.word	0xea264000	! t0_kref+0xbbc:   	st	%l5, [%i1]
	.word	0xa7034015	! t0_kref+0xbc0:   	taddcc	%o5, %l5, %l3
	.word	0xa2fdc016	! t0_kref+0xbc4:   	sdivcc	%l7, %l6, %l1
	.word	0x9fc10000	! t0_kref+0xbc8:   	call	%g4
	.word	0xa245c00a	! t0_kref+0xbcc:   	addc	%l7, %o2, %l1
	.word	0xe2066018	! t0_kref+0xbd0:   	ld	[%i1 + 0x18], %l1
	.word	0x9135a019	! t0_kref+0xbd4:   	srl	%l6, 0x19, %o0
	.word	0xa5a01889	! t0_kref+0xbd8:   	fitos	%f9, %f18
	.word	0x99a50d3e	! t0_kref+0xbdc:   	fsmuld	%f20, %f30, %f12
	.word	0xacc5800d	! t0_kref+0xbe0:   	addccc	%l6, %o5, %l6
	.word	0xec00a038	! t0_kref+0xbe4:   	ld	[%g2 + 0x38], %l6
	.word	0x921a332e	! t0_kref+0xbe8:   	xor	%o0, -0xcd2, %o1
	.word	0x81820000	! t0_kref+0xbec:   	wr	%o0, %g0, %y
	.word	0x91a44d2b	! t0_kref+0xbf0:   	fsmuld	%f17, %f11, %f8
	.word	0xf53e3ff8	! t0_kref+0xbf4:   	std	%f26, [%i0 - 8]
	.word	0xd0be101d	! t0_kref+0xbf8:   	stda	%o0, [%i0 + %i5]0x80
	.word	0xa1418000	! t0_kref+0xbfc:   	mov	%fprs, %l0
	.word	0xcd1e401d	! t0_kref+0xc00:   	ldd	[%i1 + %i5], %f6
	.word	0x81820000	! t0_kref+0xc04:   	wr	%o0, %g0, %y
	.word	0x81d80015	! t0_kref+0xc08:   	flush	%g0 + %l5
	.word	0x25480004	! t0_kref+0xc0c:   	fblg,a,pt	%fcc0, _kref+0xc1c
	.word	0xd040a02c	! t0_kref+0xc10:   	ldsw	[%g2 + 0x2c], %o0
	.word	0xaf40c000	! t0_kref+0xc14:   	mov	%asi, %l7
	.word	0xa632000c	! t0_kref+0xc18:   	orn	%o0, %o4, %l3
	.word	0xad2ac000	! t0_kref+0xc1c:   	sll	%o3, %g0, %l6
	.word	0xa6827b47	! t0_kref+0xc20:   	addcc	%o1, -0x4b9, %l3
	.word	0x9245a1e3	! t0_kref+0xc24:   	addc	%l6, 0x1e3, %o1
	.word	0xe208a01c	! t0_kref+0xc28:   	ldub	[%g2 + 0x1c], %l1
	.word	0x81ad8ad4	! t0_kref+0xc2c:   	fcmped	%fcc0, %f22, %f20
	.word	0xd6780019	! t0_kref+0xc30:   	swap	[%g0 + %i1], %o3
	.word	0xa9a5894c	! t0_kref+0xc34:   	fmuld	%f22, %f12, %f20
	.word	0xd850a002	! t0_kref+0xc38:   	ldsh	[%g2 + 2], %o4
	.word	0xafa64829	! t0_kref+0xc3c:   	fadds	%f25, %f9, %f23
	.word	0x80537c4c	! t0_kref+0xc40:   	umul	%o5, -0x3b4, %g0
	.word	0xa4fa401a	! t0_kref+0xc44:   	sdivcc	%o1, %i2, %l2
	.word	0xaa92334e	! t0_kref+0xc48:   	orcc	%o0, -0xcb2, %l5
	.word	0xd856601a	! t0_kref+0xc4c:   	ldsh	[%i1 + 0x1a], %o4
	.word	0xcd863fe8	! t0_kref+0xc50:   	lda	[%i0 - 0x18]%asi, %f6
	.word	0x97400000	! t0_kref+0xc54:   	mov	%y, %o3
	.word	0x9e2aabb7	! t0_kref+0xc58:   	andn	%o2, 0xbb7, %o7
	.word	0x8035001a	! t0_kref+0xc5c:   	orn	%l4, %i2, %g0
	.word	0x9de3bfa0	! t0_kref+0xc60:   	save	%sp, -0x60, %sp
	.word	0x95e838c6	! t0_kref+0xc64:   	restore	%g0, -0x73a, %o2
	.word	0xd53e2008	! t0_kref+0xc68:   	std	%f10, [%i0 + 8]
	.word	0xd7262004	! t0_kref+0xc6c:   	st	%f11, [%i0 + 4]
	.word	0xd91fbf38	! t0_kref+0xc70:   	ldd	[%fp - 0xc8], %f12
	.word	0x99a40830	! t0_kref+0xc74:   	fadds	%f16, %f16, %f12
	.word	0xd8160000	! t0_kref+0xc78:   	lduh	[%i0], %o4
	.word	0xdf266018	! t0_kref+0xc7c:   	st	%f15, [%i1 + 0x18]
	.word	0x9ba58834	! t0_kref+0xc80:   	fadds	%f22, %f20, %f13
	.word	0xf380a030	! t0_kref+0xc84:   	lda	[%g2 + 0x30]%asi, %f25
	.word	0xa7703280	! t0_kref+0xc88:   	popc	-0xd80, %l3
	.word	0xbda00035	! t0_kref+0xc8c:   	fmovs	%f21, %f30
	.word	0xe900a010	! t0_kref+0xc90:   	ld	[%g2 + 0x10], %f20
	.word	0xe2680018	! t0_kref+0xc94:   	ldstub	[%g0 + %i0], %l1
	.word	0x20800008	! t0_kref+0xc98:   	bn,a	_kref+0xcb8
	.word	0xb5a00538	! t0_kref+0xc9c:   	fsqrts	%f24, %f26
	.word	0xa466800d	! t0_kref+0xca0:   	subc	%i2, %o5, %l2
	.word	0xee566014	! t0_kref+0xca4:   	ldsh	[%i1 + 0x14], %l7
	.word	0xafa00533	! t0_kref+0xca8:   	fsqrts	%f19, %f23
	.word	0xa2052a62	! t0_kref+0xcac:   	add	%l4, 0xa62, %l1
	.word	0x99a01889	! t0_kref+0xcb0:   	fitos	%f9, %f12
	.word	0x81800000	! t0_kref+0xcb4:   	mov	%g0, %y
	.word	0x8610201c	! t0_kref+0xcb8:   	mov	0x1c, %g3
	.word	0x86a0e001	! t0_kref+0xcbc:   	subcc	%g3, 1, %g3
	.word	0x2280001c	! t0_kref+0xcc0:   	be,a	_kref+0xd30
	.word	0xee6e2002	! t0_kref+0xcc4:   	ldstub	[%i0 + 2], %l7
	.word	0x9615e811	! t0_kref+0xcc8:   	or	%l7, 0x811, %o3
	.word	0x20bffffc	! t0_kref+0xccc:   	bn,a	_kref+0xcbc
	.word	0x81830000	! t0_kref+0xcd0:   	wr	%o4, %g0, %y
	.word	0x9b0dbb98	! t0_kref+0xcd4:   	tsubcc	%l6, -0x468, %o5
	.word	0xa07d2526	! t0_kref+0xcd8:   	sdiv	%l4, 0x526, %l0
	.word	0x81ac0ac8	! t0_kref+0xcdc:   	fcmped	%fcc0, %f16, %f8
	.word	0xd00e001a	! t0_kref+0xce0:   	ldub	[%i0 + %i2], %o0
	.word	0xa73d8016	! t0_kref+0xce4:   	sra	%l6, %l6, %l3
	.word	0xf1be588b	! t0_kref+0xce8:   	stda	%f24, [%i1 + %o3]0xc4
	.word	0xe91e7ff0	! t0_kref+0xcec:   	ldd	[%i1 - 0x10], %f20
	.word	0x94e30016	! t0_kref+0xcf0:   	subccc	%o4, %l6, %o2
	.word	0x3c800005	! t0_kref+0xcf4:   	bpos,a	_kref+0xd08
	.word	0xc04e7fe1	! t0_kref+0xcf8:   	ldsb	[%i1 - 0x1f], %g0
	.word	0x81da2c6d	! t0_kref+0xcfc:   	flush	%o0 + 0xc6d
	.word	0xb9a01a2b	! t0_kref+0xd00:   	fstoi	%f11, %f28
	.word	0xa5aac048	! t0_kref+0xd04:   	fmovdge	%fcc0, %f8, %f18
	.word	0x9aaa0017	! t0_kref+0xd08:   	andncc	%o0, %l7, %o5
	.word	0x21bfffec	! t0_kref+0xd0c:   	fbn,a	_kref+0xcbc
	.word	0x9e3d34ae	! t0_kref+0xd10:   	xnor	%l4, -0xb52, %o7
	.word	0xee0e601b	! t0_kref+0xd14:   	ldub	[%i1 + 0x1b], %l7
	.word	0xf42e6002	! t0_kref+0xd18:   	stb	%i2, [%i1 + 2]
	.word	0xd64e600c	! t0_kref+0xd1c:   	ldsb	[%i1 + 0xc], %o3
	.word	0xe87e3fe4	! t0_kref+0xd20:   	swap	[%i0 - 0x1c], %l4
	.word	0xa07a38ff	! t0_kref+0xd24:   	sdiv	%o0, -0x701, %l0
	.word	0xea80a028	! t0_kref+0xd28:   	lda	[%g2 + 0x28]%asi, %l5
	.word	0x969332aa	! t0_kref+0xd2c:   	orcc	%o4, -0xd56, %o3
	.word	0x972da01f	! t0_kref+0xd30:   	sll	%l6, 0x1f, %o3
	.word	0x951df050	! t0_kref+0xd34:   	tsubcctv	%l7, -0xfb0, %o2
	.word	0xd51e3ff0	! t0_kref+0xd38:   	ldd	[%i0 - 0x10], %f10
	.word	0x9ba0003b	! t0_kref+0xd3c:   	fmovs	%f27, %f13
	.word	0x2a480008	! t0_kref+0xd40:   	bcs,a,pt	%icc, _kref+0xd60
	.word	0xada6483a	! t0_kref+0xd44:   	fadds	%f25, %f26, %f22
	.word	0xea40a03c	! t0_kref+0xd48:   	ldsw	[%g2 + 0x3c], %l5
	.word	0xf420a008	! t0_kref+0xd4c:   	st	%i2, [%g2 + 8]
	.word	0x3e800005	! t0_kref+0xd50:   	bvc,a	_kref+0xd64
	.word	0xea064000	! t0_kref+0xd54:   	ld	[%i1], %l5
	.word	0xd630a00a	! t0_kref+0xd58:   	sth	%o3, [%g2 + 0xa]
	.word	0xb1a6cd32	! t0_kref+0xd5c:   	fsmuld	%f27, %f18, %f24
	.word	0xb7a00536	! t0_kref+0xd60:   	fsqrts	%f22, %f27
	.word	0x9e83400d	! t0_kref+0xd64:   	addcc	%o5, %o5, %o7
	.word	0xa85ab834	! t0_kref+0xd68:   	smul	%o2, -0x7cc, %l4
	.word	0xe01e2000	! t0_kref+0xd6c:   	ldd	[%i0], %l0
	.word	0xc0563fea	! t0_kref+0xd70:   	ldsh	[%i0 - 0x16], %g0
	.word	0x972da003	! t0_kref+0xd74:   	sll	%l6, 0x3, %o3
	.word	0xa0bac00a	! t0_kref+0xd78:   	xnorcc	%o3, %o2, %l0
	.word	0x80bdf776	! t0_kref+0xd7c:   	xnorcc	%l7, -0x88a, %g0
	.word	0x2d1d9a7c	! t0_kref+0xd80:   	sethi	%hi(0x7669f000), %l6
	.word	0xe8ff1018	! t0_kref+0xd84:   	swapa	[%i4 + %i0]0x80, %l4
	.word	0x99a01a30	! t0_kref+0xd88:   	fstoi	%f16, %f12
	.word	0x86102003	! t0_kref+0xd8c:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0xd90:   	bne,a	_kref+0xd90
	.word	0x86a0e001	! t0_kref+0xd94:   	subcc	%g3, 1, %g3
	.word	0x9f414000	! t0_kref+0xd98:   	mov	%pc, %o7
	.word	0x9b3d0016	! t0_kref+0xd9c:   	sra	%l4, %l6, %o5
	.word	0xbba0053e	! t0_kref+0xda0:   	fsqrts	%f30, %f29
	.word	0x947a3f65	! t0_kref+0xda4:   	sdiv	%o0, -0x9b, %o2
	.word	0xd22e3fea	! t0_kref+0xda8:   	stb	%o1, [%i0 - 0x16]
	.word	0xd200a034	! t0_kref+0xdac:   	ld	[%g2 + 0x34], %o1
	.word	0x878020e0	! t0_kref+0xdb0:   	mov	0xe0, %asi
	.word	0xa67d8000	! t0_kref+0xdb4:   	sdiv	%l6, %g0, %l3
	.word	0xe968a08c	! t0_kref+0xdb8:   	prefetch	%g2 + 0x8c, 20
	call	SYM(t0_subr0)
	.word	0x981d674c	! t0_kref+0xdc0:   	xor	%l5, 0x74c, %o4
	.word	0x2c800003	! t0_kref+0xdc4:   	bneg,a	_kref+0xdd0
	.word	0xd8160000	! t0_kref+0xdc8:   	lduh	[%i0], %o4
	.word	0x81868000	! t0_kref+0xdcc:   	wr	%i2, %g0, %y
	.word	0xe40864d8	! t0_kref+0xdd0:   	ldub	[%g1 + 0x4d8], %l2
	.word	0xa41ca00c	! t0_kref+0xdd4:   	xor	%l2, 0xc, %l2
	.word	0xe42864d8	! t0_kref+0xdd8:   	stb	%l2, [%g1 + 0x4d8]
	.word	0x81d864d8	! t0_kref+0xddc:   	flush	%g1 + 0x4d8
	.word	0x9a7d3e73	! t0_kref+0xde0:   	sdiv	%l4, -0x18d, %o5
	.word	0xa1a01a46	! t0_kref+0xde4:   	fdtoi	%f6, %f16
	.word	0xee08a03f	! t0_kref+0xde8:   	ldub	[%g2 + 0x3f], %l7
	.word	0xea00a020	! t0_kref+0xdec:   	ld	[%g2 + 0x20], %l5
2:	.word	0xa21d400d	! t0_kref+0xdf0:   	xor	%l5, %o5, %l1
	.word	0x802a8009	! t0_kref+0xdf4:   	andn	%o2, %o1, %g0
	.word	0xa03b217b	! t0_kref+0xdf8:   	xnor	%o4, 0x17b, %l0
	.word	0xaafb22df	! t0_kref+0xdfc:   	sdivcc	%o4, 0x2df, %l5
	.word	0x96c54014	! t0_kref+0xe00:   	addccc	%l5, %l4, %o3
	.word	0x987abbe0	! t0_kref+0xe04:   	sdiv	%o2, -0x420, %o4
	.word	0xed3e0000	! t0_kref+0xe08:   	std	%f22, [%i0]
	.word	0x3b480003	! t0_kref+0xe0c:   	fble,a,pt	%fcc0, _kref+0xe18
	.word	0xa5a00526	! t0_kref+0xe10:   	fsqrts	%f6, %f18
	.word	0xf36e001b	! t0_kref+0xe14:   	prefetch	%i0 + %i3, 25
	.word	0x24480007	! t0_kref+0xe18:   	ble,a,pt	%icc, _kref+0xe34
	.word	0xe3b8a040	! t0_kref+0xe1c:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xd91fbed8	! t0_kref+0xe20:   	ldd	[%fp - 0x128], %f12
	.word	0xa472fd89	! t0_kref+0xe24:   	udiv	%o3, -0x277, %l2
	.word	0x92fd6866	! t0_kref+0xe28:   	sdivcc	%l5, 0x866, %o1
	.word	0xdf066010	! t0_kref+0xe2c:   	ld	[%i1 + 0x10], %f15
	.word	0xbda5c827	! t0_kref+0xe30:   	fadds	%f23, %f7, %f30
	.word	0x9da68952	! t0_kref+0xe34:   	fmuld	%f26, %f18, %f14
	.word	0xa5336002	! t0_kref+0xe38:   	srl	%o5, 0x2, %l2
	.word	0x1b137f2c	! t0_kref+0xe3c:   	sethi	%hi(0x4dfcb000), %o5
	.word	0xafa789b8	! t0_kref+0xe40:   	fdivs	%f30, %f24, %f23
	.word	0x8da70932	! t0_kref+0xe44:   	fmuls	%f28, %f18, %f6
	.word	0x90aa6b15	! t0_kref+0xe48:   	andncc	%o1, 0xb15, %o0
	.word	0xa5a548a7	! t0_kref+0xe4c:   	fsubs	%f21, %f7, %f18
	.word	0xac150008	! t0_kref+0xe50:   	or	%l4, %o0, %l6
	.word	0x9fc00004	! t0_kref+0xe54:   	call	%g0 + %g4
	.word	0xa02de52f	! t0_kref+0xe58:   	andn	%l7, 0x52f, %l0
	.word	0x8143c000	! t0_kref+0xe5c:   	stbar
	.word	0x34480007	! t0_kref+0xe60:   	bg,a,pt	%icc, _kref+0xe7c
	.word	0x8143c000	! t0_kref+0xe64:   	stbar
	.word	0x81ac4a33	! t0_kref+0xe68:   	fcmps	%fcc0, %f17, %f19
	.word	0xec267fec	! t0_kref+0xe6c:   	st	%l6, [%i1 - 0x14]
	.word	0xb9a00533	! t0_kref+0xe70:   	fsqrts	%f19, %f28
	.word	0xa3003f8c	! t0_kref+0xe74:   	taddcc	%g0, -0x74, %l1
	.word	0x91a208d0	! t0_kref+0xe78:   	fsubd	%f8, %f16, %f8
	.word	0xb5a6895a	! t0_kref+0xe7c:   	fmuld	%f26, %f26, %f26
	.word	0x8610201a	! t0_kref+0xe80:   	mov	0x1a, %g3
	.word	0x86a0e001	! t0_kref+0xe84:   	subcc	%g3, 1, %g3
	.word	0x2280001b	! t0_kref+0xe88:   	be,a	_kref+0xef4
	.word	0xeaa61000	! t0_kref+0xe8c:   	sta	%l5, [%i0]0x80
	.word	0x96c5801a	! t0_kref+0xe90:   	addccc	%l6, %i2, %o3
	.word	0x2132b247	! t0_kref+0xe94:   	sethi	%hi(0xcac91c00), %l0
	.word	0xc030a008	! t0_kref+0xe98:   	clrh	[%g2 + 8]
	.word	0xaba248a9	! t0_kref+0xe9c:   	fsubs	%f9, %f9, %f21
	.word	0x97a1c8ae	! t0_kref+0xea0:   	fsubs	%f7, %f14, %f11
	.word	0x80f36e91	! t0_kref+0xea4:   	udivcc	%o5, 0xe91, %g0
	.word	0xea30a00e	! t0_kref+0xea8:   	sth	%l5, [%g2 + 0xe]
	.word	0x38800004	! t0_kref+0xeac:   	bgu,a	_kref+0xebc
	.word	0xd6164000	! t0_kref+0xeb0:   	lduh	[%i1], %o3
	.word	0xbba689a8	! t0_kref+0xeb4:   	fdivs	%f26, %f8, %f29
	.word	0xa5a018d6	! t0_kref+0xeb8:   	fdtos	%f22, %f18
	.word	0x81418000	! t0_kref+0xebc:   	mov	%fprs, %g0
	.word	0x36800001	! t0_kref+0xec0:   	bge,a	_kref+0xec4
	.word	0xb7a748af	! t0_kref+0xec4:   	fsubs	%f29, %f15, %f27
	.word	0x9676b23e	! t0_kref+0xec8:   	udiv	%i2, -0xdc2, %o3
	.word	0x9803400a	! t0_kref+0xecc:   	add	%o5, %o2, %o4
	.word	0xa21a8014	! t0_kref+0xed0:   	xor	%o2, %l4, %l1
	.word	0xa32d6012	! t0_kref+0xed4:   	sll	%l5, 0x12, %l1
	.word	0x250cf87b	! t0_kref+0xed8:   	sethi	%hi(0x33e1ec00), %l2
	.word	0xd8364000	! t0_kref+0xedc:   	sth	%o4, [%i1]
	.word	0xa0bdbf53	! t0_kref+0xee0:   	xnorcc	%l6, -0xad, %l0
	.word	0xa4c24014	! t0_kref+0xee4:   	addccc	%o1, %l4, %l2
	.word	0x37800004	! t0_kref+0xee8:   	fbge,a	_kref+0xef8
	.word	0xe8080019	! t0_kref+0xeec:   	ldub	[%g0 + %i1], %l4
	.word	0xf9064000	! t0_kref+0xef0:   	ld	[%i1], %f28
	.word	0x90db0009	! t0_kref+0xef4:   	smulcc	%o4, %o1, %o0
	.word	0xec10a026	! t0_kref+0xef8:   	lduh	[%g2 + 0x26], %l6
	.word	0x95326007	! t0_kref+0xefc:   	srl	%o1, 0x7, %o2
	.word	0xada58850	! t0_kref+0xf00:   	faddd	%f22, %f16, %f22
	.word	0xe1be101d	! t0_kref+0xf04:   	stda	%f16, [%i0 + %i5]0x80
	.word	0xb5a448ba	! t0_kref+0xf08:   	fsubs	%f17, %f26, %f26
	.word	0xf9070019	! t0_kref+0xf0c:   	ld	[%i4 + %i1], %f28
	.word	0x2f480006	! t0_kref+0xf10:   	fbu,a,pt	%fcc0, _kref+0xf28
	.word	0xe3ee101c	! t0_kref+0xf14:   	prefetcha	%i0 + %i4, 17
	.word	0x81ac0a58	! t0_kref+0xf18:   	fcmpd	%fcc0, %f16, %f24
	.word	0x80620016	! t0_kref+0xf1c:   	subc	%o0, %l6, %g0
	.word	0xa5a588b0	! t0_kref+0xf20:   	fsubs	%f22, %f16, %f18
	.word	0x9705219a	! t0_kref+0xf24:   	taddcc	%l4, 0x19a, %o3
	.word	0xdab6501b	! t0_kref+0xf28:   	stha	%o5, [%i1 + %i3]0x80
	.word	0x93a0003a	! t0_kref+0xf2c:   	fmovs	%f26, %f9
	.word	0x91a588d2	! t0_kref+0xf30:   	fsubd	%f22, %f18, %f8
	.word	0xa452c01a	! t0_kref+0xf34:   	umul	%o3, %i2, %l2
	.word	0x901a400a	! t0_kref+0xf38:   	xor	%o1, %o2, %o0
	.word	0xfd1fbe48	! t0_kref+0xf3c:   	ldd	[%fp - 0x1b8], %f30
	.word	0x81a98ac6	! t0_kref+0xf40:   	fcmped	%fcc0, %f6, %f6
	.word	0x9a1e8014	! t0_kref+0xf44:   	xor	%i2, %l4, %o5
	.word	0xa5a0192e	! t0_kref+0xf48:   	fstod	%f14, %f18
	.word	0xb9a608a6	! t0_kref+0xf4c:   	fsubs	%f24, %f6, %f28
	.word	0xa5a00136	! t0_kref+0xf50:   	fabss	%f22, %f18
	.word	0xafa0053d	! t0_kref+0xf54:   	fsqrts	%f29, %f23
	.word	0xa01b7442	! t0_kref+0xf58:   	xor	%o5, -0xbbe, %l0
	.word	0x95223198	! t0_kref+0xf5c:   	mulscc	%o0, -0xe68, %o2
	.word	0xf100a01c	! t0_kref+0xf60:   	ld	[%g2 + 0x1c], %f24
	.word	0xd400a01c	! t0_kref+0xf64:   	ld	[%g2 + 0x1c], %o2
	.word	0x27480003	! t0_kref+0xf68:   	fbul,a,pt	%fcc0, _kref+0xf74
	.word	0xaa75ea4d	! t0_kref+0xf6c:   	udiv	%l7, 0xa4d, %l5
	.word	0xd91e401d	! t0_kref+0xf70:   	ldd	[%i1 + %i5], %f12
	.word	0x81858000	! t0_kref+0xf74:   	wr	%l6, %g0, %y
	.word	0xe3ee101c	! t0_kref+0xf78:   	prefetcha	%i0 + %i4, 17
	.word	0xafa00026	! t0_kref+0xf7c:   	fmovs	%f6, %f23
	.word	0xe850a00a	! t0_kref+0xf80:   	ldsh	[%g2 + 0xa], %l4
	.word	0xd62e8018	! t0_kref+0xf84:   	stb	%o3, [%i2 + %i0]
	call	SYM(t0_subr2)
	.word	0x001fffff	! t0_kref+0xf8c:   	illtrap	0x1fffff
	.word	0x9de3bfa0	! t0_kref+0xf90:   	save	%sp, -0x60, %sp
	.word	0x80d7001c	! t0_kref+0xf94:   	umulcc	%i4, %i4, %g0
	.word	0xadee6349	! t0_kref+0xf98:   	restore	%i1, 0x349, %l6
	.word	0x9a1afe2f	! t0_kref+0xf9c:   	xor	%o3, -0x1d1, %o5
	call	SYM(t0_subr1)
	.word	0x92020015	! t0_kref+0xfa4:   	add	%o0, %l5, %o1
	.word	0x9fc10000	! t0_kref+0xfa8:   	call	%g4
	.word	0xa0fdc00b	! t0_kref+0xfac:   	sdivcc	%l7, %o3, %l0
	.word	0xda167fe8	! t0_kref+0xfb0:   	lduh	[%i1 - 0x18], %o5
	.word	0x39480004	! t0_kref+0xfb4:   	fbuge,a,pt	%fcc0, _kref+0xfc4
	.word	0xb1a78858	! t0_kref+0xfb8:   	faddd	%f30, %f24, %f24
	.word	0xe11e6018	! t0_kref+0xfbc:   	ldd	[%i1 + 0x18], %f16
	.word	0xee264000	! t0_kref+0xfc0:   	st	%l7, [%i1]
	.word	0xaba0052f	! t0_kref+0xfc4:   	fsqrts	%f15, %f21
	.word	0x81da4018	! t0_kref+0xfc8:   	flush	%o1 + %i0
	.word	0xd248a02b	! t0_kref+0xfcc:   	ldsb	[%g2 + 0x2b], %o1
	.word	0x9ba018d4	! t0_kref+0xfd0:   	fdtos	%f20, %f13
	.word	0x9fc00004	! t0_kref+0xfd4:   	call	%g0 + %g4
	.word	0x8da289b0	! t0_kref+0xfd8:   	fdivs	%f10, %f16, %f6
	.word	0x99a58d27	! t0_kref+0xfdc:   	fsmuld	%f22, %f7, %f12
	.word	0xa52b400d	! t0_kref+0xfe0:   	sll	%o5, %o5, %l2
	.word	0x2b480006	! t0_kref+0xfe4:   	fbug,a,pt	%fcc0, _kref+0xffc
	.word	0xe820a020	! t0_kref+0xfe8:   	st	%l4, [%g2 + 0x20]
	.word	0xee364000	! t0_kref+0xfec:   	sth	%l7, [%i1]
	.word	0x93a01890	! t0_kref+0xff0:   	fitos	%f16, %f9
	.word	0x800275d6	! t0_kref+0xff4:   	add	%o1, -0xa2a, %g0
	.word	0xe4ce1000	! t0_kref+0xff8:   	ldsba	[%i0]0x80, %l2
	.word	0xa7a54830	! t0_kref+0xffc:   	fadds	%f21, %f16, %f19
	.word	0x81ae0a35	! t0_kref+0x1000:   	fcmps	%fcc0, %f24, %f21
	.word	0xc000a02c	! t0_kref+0x1004:   	ld	[%g2 + 0x2c], %g0
	.word	0xe99f1a19	! t0_kref+0x1008:   	ldda	[%i4 + %i1]0xd0, %f20
	.word	0xada01917	! t0_kref+0x100c:   	fitod	%f23, %f22
	.word	0x83c06704	! t0_kref+0x1010:   	jmpl	%g1 + 0x704, %g1
	.word	0xd8262000	! t0_kref+0x1014:   	st	%o4, [%i0]
	.word	0x81a98a46	! t0_kref+0x1018:   	fcmpd	%fcc0, %f6, %f6
	.word	0x932a8017	! t0_kref+0x101c:   	sll	%o2, %l7, %o1
	.word	0x952da010	! t0_kref+0x1020:   	sll	%l6, 0x10, %o2
	.word	0xe99e1a1a	! t0_kref+0x1024:   	ldda	[%i0 + %i2]0xd0, %f20
	.word	0x28800004	! t0_kref+0x1028:   	bleu,a	_kref+0x1038
	.word	0xd8160000	! t0_kref+0x102c:   	lduh	[%i0], %o4
	.word	0x81aa0a2f	! t0_kref+0x1030:   	fcmps	%fcc0, %f8, %f15
	.word	0x9012b84e	! t0_kref+0x1034:   	or	%o2, -0x7b2, %o0
!	call	0xfffff97c
	.word	0x90fb4017	! t0_kref+0x103c:   	sdivcc	%o5, %l7, %o0
	.word	0xeb000019	! t0_kref+0x1040:   	ld	[%g0 + %i1], %f21
	.word	0xa5a0111a	! t0_kref+0x1044:   	fxtod	%f26, %f18
	.word	0xf386105c	! t0_kref+0x1048:   	lda	[%i0 + %i4]0x82, %f25
	.word	0xee0e6015	! t0_kref+0x104c:   	ldub	[%i1 + 0x15], %l7
	.word	0xe608a03f	! t0_kref+0x1050:   	ldub	[%g2 + 0x3f], %l3
	.word	0xafa508b8	! t0_kref+0x1054:   	fsubs	%f20, %f24, %f23
	.word	0xb1ab805a	! t0_kref+0x1058:   	fmovdule	%fcc0, %f26, %f24
	.word	0x99a28954	! t0_kref+0x105c:   	fmuld	%f10, %f20, %f12
	.word	0xd656001b	! t0_kref+0x1060:   	ldsh	[%i0 + %i3], %o3
	.word	0xacfeab9c	! t0_kref+0x1064:   	sdivcc	%i2, 0xb9c, %l6
	.word	0xaa70000c	! t0_kref+0x1068:   	udiv	%g0, %o4, %l5
	.word	0xa7a00131	! t0_kref+0x106c:   	fabss	%f17, %f19
	.word	0xd80e601e	! t0_kref+0x1070:   	ldub	[%i1 + 0x1e], %o4
	.word	0xada58850	! t0_kref+0x1074:   	faddd	%f22, %f16, %f22
	.word	0xdd180018	! t0_kref+0x1078:   	ldd	[%g0 + %i0], %f14
	.word	0xb1a0053d	! t0_kref+0x107c:   	fsqrts	%f29, %f24
	.word	0xef68a009	! t0_kref+0x1080:   	prefetch	%g2 + 9, 23
	.word	0xa11da612	! t0_kref+0x1084:   	tsubcctv	%l6, 0x612, %l0
	.word	0xec066000	! t0_kref+0x1088:   	ld	[%i1], %l6
	call	SYM(t0_subr0)
	.word	0x992d400c	! t0_kref+0x1090:   	sll	%l5, %o4, %o4
	.word	0xf1be5a5b	! t0_kref+0x1094:   	stda	%f24, [%i1 + %i3]0xd2
	.word	0xe478a030	! t0_kref+0x1098:   	swap	[%g2 + 0x30], %l2
	.word	0x37800008	! t0_kref+0x109c:   	fbge,a	_kref+0x10bc
	.word	0xa6baf502	! t0_kref+0x10a0:   	xnorcc	%o3, -0xafe, %l3
	.word	0x2e480006	! t0_kref+0x10a4:   	bvs,a,pt	%icc, _kref+0x10bc
	.word	0xe8300019	! t0_kref+0x10a8:   	sth	%l4, [%g0 + %i1]
	.word	0xe40e7ffd	! t0_kref+0x10ac:   	ldub	[%i1 - 3], %l2
	.word	0x193484f9	! t0_kref+0x10b0:   	sethi	%hi(0xd213e400), %o4
	.word	0xc12e200c	! t0_kref+0x10b4:   	st	%fsr, [%i0 + 0xc]
	.word	0x947b000a	! t0_kref+0x10b8:   	sdiv	%o4, %o2, %o2
	.word	0xcd1f4019	! t0_kref+0x10bc:   	ldd	[%i5 + %i1], %f6
	.word	0xa2354000	! t0_kref+0x10c0:   	orn	%l5, %g0, %l1
	.word	0xd828a03b	! t0_kref+0x10c4:   	stb	%o4, [%g2 + 0x3b]
	.word	0xe050a03c	! t0_kref+0x10c8:   	ldsh	[%g2 + 0x3c], %l0
	call	SYM(t0_subr1)
	.word	0x95234015	! t0_kref+0x10d0:   	mulscc	%o5, %l5, %o2
	.word	0x9da01911	! t0_kref+0x10d4:   	fitod	%f17, %f14
	.word	0xe408a021	! t0_kref+0x10d8:   	ldub	[%g2 + 0x21], %l2
	.word	0xec28a035	! t0_kref+0x10dc:   	stb	%l6, [%g2 + 0x35]
	.word	0xa6fb6199	! t0_kref+0x10e0:   	sdivcc	%o5, 0x199, %l3
	.word	0x8da000c6	! t0_kref+0x10e4:   	fnegd	%f6, %f6
	.word	0x34480002	! t0_kref+0x10e8:   	bg,a,pt	%icc, _kref+0x10f0
	.word	0xb1a3885c	! t0_kref+0x10ec:   	faddd	%f14, %f28, %f24
	.word	0x90127525	! t0_kref+0x10f0:   	or	%o1, -0xadb, %o0
	.word	0xe99e5a1c	! t0_kref+0x10f4:   	ldda	[%i1 + %i4]0xd0, %f20
	.word	0xa6db4014	! t0_kref+0x10f8:   	smulcc	%o5, %l4, %l3
	.word	0xa32a800d	! t0_kref+0x10fc:   	sll	%o2, %o5, %l1
	.word	0xb7a00132	! t0_kref+0x1100:   	fabss	%f18, %f27
	.word	0x963b38c1	! t0_kref+0x1104:   	xnor	%o4, -0x73f, %o3
	.word	0x3c800004	! t0_kref+0x1108:   	bpos,a	_kref+0x1118
	.word	0xa1a00528	! t0_kref+0x110c:   	fsqrts	%f8, %f16
	.word	0x90fa8015	! t0_kref+0x1110:   	sdivcc	%o2, %l5, %o0
	.word	0xa85af893	! t0_kref+0x1114:   	smul	%o3, -0x76d, %l4
	.word	0xe000a03c	! t0_kref+0x1118:   	ld	[%g2 + 0x3c], %l0
	.word	0x32480008	! t0_kref+0x111c:   	bne,a,pt	%icc, _kref+0x113c
	.word	0x9940c000	! t0_kref+0x1120:   	mov	%asi, %o4
	.word	0xb9a58854	! t0_kref+0x1124:   	faddd	%f22, %f20, %f28
	.word	0x9fa548a6	! t0_kref+0x1128:   	fsubs	%f21, %f6, %f15
	.word	0x9e054014	! t0_kref+0x112c:   	add	%l5, %l4, %o7
	.word	0xa90525c1	! t0_kref+0x1130:   	taddcc	%l4, 0x5c1, %l4
	.word	0x94e5800b	! t0_kref+0x1134:   	subccc	%l6, %o3, %o2
	.word	0x8da5cd33	! t0_kref+0x1138:   	fsmuld	%f23, %f19, %f6
	.word	0x81834000	! t0_kref+0x113c:   	wr	%o5, %g0, %y
	.word	0xa49a240e	! t0_kref+0x1140:   	xorcc	%o0, 0x40e, %l2
	.word	0x86102002	! t0_kref+0x1144:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x1148:   	bne,a	_kref+0x1148
	.word	0x86a0e001	! t0_kref+0x114c:   	subcc	%g3, 1, %g3
	.word	0xd2363fee	! t0_kref+0x1150:   	sth	%o1, [%i0 - 0x12]
	.word	0xe84e8018	! t0_kref+0x1154:   	ldsb	[%i2 + %i0], %l4
	.word	0xd8d81018	! t0_kref+0x1158:   	ldxa	[%g0 + %i0]0x80, %o4
	.word	0xa0e6a3fa	! t0_kref+0x115c:   	subccc	%i2, 0x3fa, %l0
	.word	0xc07e6004	! t0_kref+0x1160:   	swap	[%i1 + 4], %g0
	.word	0x97a608ba	! t0_kref+0x1164:   	fsubs	%f24, %f26, %f11
	.word	0xb9a01918	! t0_kref+0x1168:   	fitod	%f24, %f28
	.word	0xa40d7078	! t0_kref+0x116c:   	and	%l5, -0xf88, %l2
	.word	0xe3b8a040	! t0_kref+0x1170:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xea901019	! t0_kref+0x1174:   	lduha	[%g0 + %i1]0x80, %l5
	.word	0x80c2ab27	! t0_kref+0x1178:   	addccc	%o2, 0xb27, %g0
	.word	0x9ba0053e	! t0_kref+0x117c:   	fsqrts	%f30, %f13
	.word	0xdd1e001d	! t0_kref+0x1180:   	ldd	[%i0 + %i5], %f14
	.word	0xaf2dc014	! t0_kref+0x1184:   	sll	%l7, %l4, %l7
	.word	0xa2722b92	! t0_kref+0x1188:   	udiv	%o0, 0xb92, %l1
	.word	0x8d82e196	! t0_kref+0x118c:   	wr	%o3, 0x196, %fprs
	.word	0x95a0189d	! t0_kref+0x1190:   	fitos	%f29, %f10
	.word	0xa5400000	! t0_kref+0x1194:   	mov	%y, %l2
	.word	0xd47f0018	! t0_kref+0x1198:   	swap	[%i4 + %i0], %o2
	.word	0x8da9c046	! t0_kref+0x119c:   	fmovdu	%fcc0, %f6, %f6
	.word	0xae020009	! t0_kref+0x11a0:   	add	%o0, %o1, %l7
	.word	0x96c2a688	! t0_kref+0x11a4:   	addccc	%o2, 0x688, %o3
	.word	0xa1a6085a	! t0_kref+0x11a8:   	faddd	%f24, %f26, %f16
	.word	0xe11fbdc8	! t0_kref+0x11ac:   	ldd	[%fp - 0x238], %f16
	.word	0xe200a030	! t0_kref+0x11b0:   	ld	[%g2 + 0x30], %l1
	.word	0xf700a034	! t0_kref+0x11b4:   	ld	[%g2 + 0x34], %f27
	.word	0xcd1e0000	! t0_kref+0x11b8:   	ldd	[%i0], %f6
	.word	0x3e800005	! t0_kref+0x11bc:   	bvc,a	_kref+0x11d0
	.word	0x93a2083d	! t0_kref+0x11c0:   	fadds	%f8, %f29, %f9
	.word	0xed1fbd10	! t0_kref+0x11c4:   	ldd	[%fp - 0x2f0], %f22
	.word	0xeba01019	! t0_kref+0x11c8:   	sta	%f21, [%g0 + %i1]0x80
	.word	0x81aa4a3d	! t0_kref+0x11cc:   	fcmps	%fcc0, %f9, %f29
	call	SYM(t0_subr0)
	.word	0x80dac000	! t0_kref+0x11d4:   	smulcc	%o3, %g0, %g0
	.word	0xd80e601f	! t0_kref+0x11d8:   	ldub	[%i1 + 0x1f], %o4
	.word	0xa27d4009	! t0_kref+0x11dc:   	sdiv	%l5, %o1, %l1
	.word	0x92420015	! t0_kref+0x11e0:   	addc	%o0, %l5, %o1
	.word	0x001fffff	! t0_kref+0x11e4:   	illtrap	0x1fffff
	.word	0x91a00129	! t0_kref+0x11e8:   	fabss	%f9, %f8
	.word	0xad268008	! t0_kref+0x11ec:   	mulscc	%i2, %o0, %l6
	.word	0xa1a00050	! t0_kref+0x11f0:   	fmovd	%f16, %f16
	.word	0xd6ae101a	! t0_kref+0x11f4:   	stba	%o3, [%i0 + %i2]0x80
	.word	0x21480004	! t0_kref+0x11f8:   	fbn,a,pt	%fcc0, _kref+0x1208
	.word	0x921dc009	! t0_kref+0x11fc:   	xor	%l7, %o1, %o1
	.word	0x81ad8a39	! t0_kref+0x1200:   	fcmps	%fcc0, %f22, %f25
	.word	0xd93e4000	! t0_kref+0x1204:   	std	%f12, [%i1]
	.word	0xc008a00d	! t0_kref+0x1208:   	ldub	[%g2 + 0xd], %g0
	.word	0x20800004	! t0_kref+0x120c:   	bn,a	_kref+0x121c
	.word	0xe6070018	! t0_kref+0x1210:   	ld	[%i4 + %i0], %l3
	.word	0x36480007	! t0_kref+0x1214:   	bge,a,pt	%icc, _kref+0x1230
	.word	0x9fa508b1	! t0_kref+0x1218:   	fsubs	%f20, %f17, %f15
	.word	0x30800006	! t0_kref+0x121c:   	ba,a	_kref+0x1234
	.word	0xb1a0189d	! t0_kref+0x1220:   	fitos	%f29, %f24
	.word	0xd428a02b	! t0_kref+0x1224:   	stb	%o2, [%g2 + 0x2b]
	.word	0xada018de	! t0_kref+0x1228:   	fdtos	%f30, %f22
	.word	0x95a288b9	! t0_kref+0x122c:   	fsubs	%f10, %f25, %f10
	.word	0x32800001	! t0_kref+0x1230:   	bne,a	_kref+0x1234
	.word	0xe016c019	! t0_kref+0x1234:   	lduh	[%i3 + %i1], %l0
	call	SYM(t0_subr0)
	.word	0xd91e7fe0	! t0_kref+0x123c:   	ldd	[%i1 - 0x20], %f12
	.word	0xa4350014	! t0_kref+0x1240:   	orn	%l4, %l4, %l2
	.word	0x9da20852	! t0_kref+0x1244:   	faddd	%f8, %f18, %f14
	.word	0x993b4014	! t0_kref+0x1248:   	sra	%o5, %l4, %o4
	.word	0xf9be5000	! t0_kref+0x124c:   	stda	%f28, [%i1]0x80
	.word	0xd848a00b	! t0_kref+0x1250:   	ldsb	[%g2 + 0xb], %o4
	.word	0xa1a01a3e	! t0_kref+0x1254:   	fstoi	%f30, %f16
	.word	0xde06401c	! t0_kref+0x1258:   	ld	[%i1 + %i4], %o7
	.word	0xad3d6012	! t0_kref+0x125c:   	sra	%l5, 0x12, %l6
	.word	0xd09f5059	! t0_kref+0x1260:   	ldda	[%i5 + %i1]0x82, %o0
	.word	0x8610201f	! t0_kref+0x1264:   	mov	0x1f, %g3
	.word	0x86a0e001	! t0_kref+0x1268:   	subcc	%g3, 1, %g3
	.word	0x22800001	! t0_kref+0x126c:   	be,a	_kref+0x1270
	.word	0x81834000	! t0_kref+0x1270:   	wr	%o5, %g0, %y
	.word	0xd2560000	! t0_kref+0x1274:   	ldsh	[%i0], %o1
	.word	0xe9f6500d	! t0_kref+0x1278:   	casxa	[%i1]0x80, %o5, %l4
	.word	0x98750017	! t0_kref+0x127c:   	udiv	%l4, %l7, %o4
	.word	0x99a688c8	! t0_kref+0x1280:   	fsubd	%f26, %f8, %f12
	.word	0xa62a2a17	! t0_kref+0x1284:   	andn	%o0, 0xa17, %l3
	.word	0xe6d81018	! t0_kref+0x1288:   	ldxa	[%g0 + %i0]0x80, %l3
	.word	0x81da400e	! t0_kref+0x128c:   	flush	%o1 + %sp
	.word	0x942b782b	! t0_kref+0x1290:   	andn	%o5, -0x7d5, %o2
	.word	0xa8c3001a	! t0_kref+0x1294:   	addccc	%o4, %i2, %l4
	.word	0xa5254000	! t0_kref+0x1298:   	mulscc	%l5, %g0, %l2
	.word	0xada0191e	! t0_kref+0x129c:   	fitod	%f30, %f22
	.word	0xed064000	! t0_kref+0x12a0:   	ld	[%i1], %f22
	.word	0x9696800d	! t0_kref+0x12a4:   	orcc	%i2, %o5, %o3
	.word	0xa82b6d39	! t0_kref+0x12a8:   	andn	%o5, 0xd39, %l4
	.word	0xa0720008	! t0_kref+0x12ac:   	udiv	%o0, %o0, %l0
	.word	0x81ac8a31	! t0_kref+0x12b0:   	fcmps	%fcc0, %f18, %f17
	.word	0xaa9d0017	! t0_kref+0x12b4:   	xorcc	%l4, %l7, %l5
	call	1f
	.empty
	.word	0x965a4015	! t0_kref+0x12bc:   	smul	%o1, %l5, %o3
	.word	0xa6bd799f	! t0_kref+0x12c0:   	xnorcc	%l5, -0x661, %l3
	.word	0xd300a024	! t0_kref+0x12c4:   	ld	[%g2 + 0x24], %f9
	.word	0x20480004	! t0_kref+0x12c8:   	bn,a,pt	%icc, _kref+0x12d8
	.word	0xee4e6017	! t0_kref+0x12cc:   	ldsb	[%i1 + 0x17], %l7
	.word	0xaf400000	! t0_kref+0x12d0:   	mov	%y, %l7
	.word	0x992321e0	! t0_kref+0x12d4:   	mulscc	%o4, 0x1e0, %o4
1:	.word	0xd648a001	! t0_kref+0x12d8:   	ldsb	[%g2 + 1], %o3
	.word	0xa4bde6c2	! t0_kref+0x12dc:   	xnorcc	%l7, 0x6c2, %l2
	.word	0xc0760000	! t0_kref+0x12e0:   	stx	%g0, [%i0]
	.word	0xa1a01906	! t0_kref+0x12e4:   	fitod	%f6, %f16
	.word	0x90280009	! t0_kref+0x12e8:   	andn	%g0, %o1, %o0
	.word	0x2d800006	! t0_kref+0x12ec:   	fbg,a	_kref+0x1304
	.word	0xa0f30014	! t0_kref+0x12f0:   	udivcc	%o4, %l4, %l0
	.word	0x987a0008	! t0_kref+0x12f4:   	sdiv	%o0, %o0, %o4
	.word	0xada70854	! t0_kref+0x12f8:   	faddd	%f28, %f20, %f22
	.word	0xbda8805e	! t0_kref+0x12fc:   	fmovdlg	%fcc0, %f30, %f30
	.word	0x9b0e8017	! t0_kref+0x1300:   	tsubcc	%i2, %l7, %o5
	.word	0xb1a4c8ba	! t0_kref+0x1304:   	fsubs	%f19, %f26, %f24
	.word	0xe3b8a040	! t0_kref+0x1308:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xafa0052f	! t0_kref+0x130c:   	fsqrts	%f15, %f23
	.word	0x91a589c8	! t0_kref+0x1310:   	fdivd	%f22, %f8, %f8
	.word	0xb5a0004a	! t0_kref+0x1314:   	fmovd	%f10, %f26
	.word	0x34800001	! t0_kref+0x1318:   	bg,a	_kref+0x131c
	.word	0xda06200c	! t0_kref+0x131c:   	ld	[%i0 + 0xc], %o5
	.word	0xa5a3885c	! t0_kref+0x1320:   	faddd	%f14, %f28, %f18
	.word	0xae4227fd	! t0_kref+0x1324:   	addc	%o0, 0x7fd, %l7
	.word	0x9f414000	! t0_kref+0x1328:   	mov	%pc, %o7
	.word	0xb1a408ae	! t0_kref+0x132c:   	fsubs	%f16, %f14, %f24
	.word	0xe4c65000	! t0_kref+0x1330:   	ldswa	[%i1]0x80, %l2
	.word	0xd11e7ff8	! t0_kref+0x1334:   	ldd	[%i1 - 8], %f8
	.word	0xd4400019	! t0_kref+0x1338:   	ldsw	[%g0 + %i1], %o2
	.word	0xa4fb401a	! t0_kref+0x133c:   	sdivcc	%o5, %i2, %l2
	.word	0x9da0191a	! t0_kref+0x1340:   	fitod	%f26, %f14
	.word	0xd120a03c	! t0_kref+0x1344:   	st	%f8, [%g2 + 0x3c]
	.word	0xf91e6000	! t0_kref+0x1348:   	ldd	[%i1], %f28
	.word	0x9ec5000d	! t0_kref+0x134c:   	addccc	%l4, %o5, %o7
	.word	0xa825720a	! t0_kref+0x1350:   	sub	%l5, -0xdf6, %l4
	.word	0xaa85800c	! t0_kref+0x1354:   	addcc	%l6, %o4, %l5
	.word	0x271a458a	! t0_kref+0x1358:   	sethi	%hi(0x69162800), %l3
	.word	0xd9067fe8	! t0_kref+0x135c:   	ld	[%i1 - 0x18], %f12
	.word	0xe11fbc80	! t0_kref+0x1360:   	ldd	[%fp - 0x380], %f16
	.word	0xd428a001	! t0_kref+0x1364:   	stb	%o2, [%g2 + 1]
	.word	0xe0ee9019	! t0_kref+0x1368:   	ldstuba	[%i2 + %i1]0x80, %l0
	.word	0x81aa4a2a	! t0_kref+0x136c:   	fcmps	%fcc0, %f9, %f10
	.word	0xe968a048	! t0_kref+0x1370:   	prefetch	%g2 + 0x48, 20
	.word	0x9efa0008	! t0_kref+0x1374:   	sdivcc	%o0, %o0, %o7
	.word	0xe400a020	! t0_kref+0x1378:   	ld	[%g2 + 0x20], %l2
	.word	0xe3b8a040	! t0_kref+0x137c:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xa0dae093	! t0_kref+0x1380:   	smulcc	%o3, 0x93, %l0
	.word	0xee871018	! t0_kref+0x1384:   	lda	[%i4 + %i0]0x80, %l7
	.word	0x99a01909	! t0_kref+0x1388:   	fitod	%f9, %f12
	.word	0xe8871019	! t0_kref+0x138c:   	lda	[%i4 + %i1]0x80, %l4
	.word	0x801d3837	! t0_kref+0x1390:   	xor	%l4, -0x7c9, %g0
	.word	0x8da3094e	! t0_kref+0x1394:   	fmuld	%f12, %f14, %f6
	.word	0xe810a00a	! t0_kref+0x1398:   	lduh	[%g2 + 0xa], %l4
	.word	0xc016401b	! t0_kref+0x139c:   	lduh	[%i1 + %i3], %g0
	call	1f
	.empty
	.word	0xd04e401a	! t0_kref+0x13a4:   	ldsb	[%i1 + %i2], %o0
	.word	0xa5a38952	! t0_kref+0x13a8:   	fmuld	%f14, %f18, %f18
1:	.word	0x30480002	! t0_kref+0x13ac:   	ba,a,pt	%icc, _kref+0x13b4
	.word	0xa013000c	! t0_kref+0x13b0:   	or	%o4, %o4, %l0
	.word	0x925db484	! t0_kref+0x13b4:   	smul	%l6, -0xb7c, %o1
	.word	0x8143e040	! t0_kref+0x13b8:   	membar	0x40
	.word	0xe4566012	! t0_kref+0x13bc:   	ldsh	[%i1 + 0x12], %l2
	.word	0x96de8017	! t0_kref+0x13c0:   	smulcc	%i2, %l7, %o3
	.word	0x81580000	! t0_kref+0x13c4:   	flushw
	.word	0x9de3bfa0	! t0_kref+0x13c8:   	save	%sp, -0x60, %sp
	.word	0xb01668bc	! t0_kref+0x13cc:   	or	%i1, 0x8bc, %i0
	.word	0xa3ee631c	! t0_kref+0x13d0:   	restore	%i1, 0x31c, %l1
	.word	0x9fc00004	! t0_kref+0x13d4:   	call	%g0 + %g4
	.word	0xb3a0053b	! t0_kref+0x13d8:   	fsqrts	%f27, %f25
	.word	0xae700017	! t0_kref+0x13dc:   	udiv	%g0, %l7, %l7
	.word	0x9ac5229a	! t0_kref+0x13e0:   	addccc	%l4, 0x29a, %o5
	.word	0xfd1f4019	! t0_kref+0x13e4:   	ldd	[%i5 + %i1], %f30
	.word	0xac2d800c	! t0_kref+0x13e8:   	andn	%l6, %o4, %l6
	.word	0xaba00527	! t0_kref+0x13ec:   	fsqrts	%f7, %f21
	.word	0xc168a084	! t0_kref+0x13f0:   	prefetch	%g2 + 0x84, 0
	.word	0xad33601e	! t0_kref+0x13f4:   	srl	%o5, 0x1e, %l6
	.word	0xe11e7ff8	! t0_kref+0x13f8:   	ldd	[%i1 - 8], %f16
	.word	0xdbf61015	! t0_kref+0x13fc:   	casxa	[%i0]0x80, %l5, %o5
	.word	0x86102017	! t0_kref+0x1400:   	mov	0x17, %g3
	.word	0x86a0e001	! t0_kref+0x1404:   	subcc	%g3, 1, %g3
	.word	0x22800020	! t0_kref+0x1408:   	be,a	_kref+0x1488
	.word	0xa07a4009	! t0_kref+0x140c:   	sdiv	%o1, %o1, %l0
	.word	0x8143e023	! t0_kref+0x1410:   	membar	0x23
	.word	0x95a018d2	! t0_kref+0x1414:   	fdtos	%f18, %f10
	.word	0x9ba01888	! t0_kref+0x1418:   	fitos	%f8, %f13
	.word	0x94c5eee9	! t0_kref+0x141c:   	addccc	%l7, 0xee9, %o2
	.word	0x9efdc009	! t0_kref+0x1420:   	sdivcc	%l7, %o1, %o7
	.word	0xa2ddc009	! t0_kref+0x1424:   	smulcc	%l7, %o1, %l1
	.word	0xa1a6c8a8	! t0_kref+0x1428:   	fsubs	%f27, %f8, %f16
	.word	0xaadd8017	! t0_kref+0x142c:   	smulcc	%l6, %l7, %l5
	.word	0x9afb0000	! t0_kref+0x1430:   	sdivcc	%o4, %g0, %o5
	.word	0xa9a01a35	! t0_kref+0x1434:   	fstoi	%f21, %f20
	.word	0x91a0052c	! t0_kref+0x1438:   	fsqrts	%f12, %f8
	.word	0x98ba6468	! t0_kref+0x143c:   	xnorcc	%o1, 0x468, %o4
	.word	0x9da688ce	! t0_kref+0x1440:   	fsubd	%f26, %f14, %f14
	.word	0xc807bfe8	! t0_kref+0x1444:   	ld	[%fp - 0x18], %g4
	.word	0xd100a038	! t0_kref+0x1448:   	ld	[%g2 + 0x38], %f8
	.word	0xac45c00b	! t0_kref+0x144c:   	addc	%l7, %o3, %l6
	.word	0xa9a38850	! t0_kref+0x1450:   	faddd	%f14, %f16, %f20
	.word	0x9876ac30	! t0_kref+0x1454:   	udiv	%i2, 0xc30, %o4
	.word	0x9126bbdd	! t0_kref+0x1458:   	mulscc	%i2, -0x423, %o0
	.word	0xe2000018	! t0_kref+0x145c:   	ld	[%g0 + %i0], %l1
	.word	0xa125e91c	! t0_kref+0x1460:   	mulscc	%l7, 0x91c, %l0
	.word	0x26800001	! t0_kref+0x1464:   	bl,a	_kref+0x1468
	.word	0x961d0009	! t0_kref+0x1468:   	xor	%l4, %o1, %o3
	.word	0xad3e801a	! t0_kref+0x146c:   	sra	%i2, %i2, %l6
	.word	0xec7e7fec	! t0_kref+0x1470:   	swap	[%i1 - 0x14], %l6
	.word	0xa3a018dc	! t0_kref+0x1474:   	fdtos	%f28, %f17
	.word	0x95a01907	! t0_kref+0x1478:   	fitod	%f7, %f10
	.word	0xbda68850	! t0_kref+0x147c:   	faddd	%f26, %f16, %f30
	.word	0x961a7629	! t0_kref+0x1480:   	xor	%o1, -0x9d7, %o3
	.word	0x3d480008	! t0_kref+0x1484:   	fbule,a,pt	%fcc0, _kref+0x14a4
	.word	0x8da01894	! t0_kref+0x1488:   	fitos	%f20, %f6
	.word	0xe81e0000	! t0_kref+0x148c:   	ldd	[%i0], %l4
	.word	0x91a01a28	! t0_kref+0x1490:   	fstoi	%f8, %f8
	call	SYM(t0_subr0)
	.word	0x81dc800e	! t0_kref+0x1498:   	flush	%l2 + %sp
	.word	0xe4c81018	! t0_kref+0x149c:   	ldsba	[%g0 + %i0]0x80, %l2
	.word	0x8da408be	! t0_kref+0x14a0:   	fsubs	%f16, %f30, %f6
	.word	0x81ad8ad8	! t0_kref+0x14a4:   	fcmped	%fcc0, %f22, %f24
	.word	0x96fab748	! t0_kref+0x14a8:   	sdivcc	%o2, -0x8b8, %o3
	.word	0x21174cb4	! t0_kref+0x14ac:   	sethi	%hi(0x5d32d000), %l0
	.word	0xee801018	! t0_kref+0x14b0:   	lda	[%g0 + %i0]0x80, %l7
	.word	0xe91fbf78	! t0_kref+0x14b4:   	ldd	[%fp - 0x88], %f20
	.word	0x32800005	! t0_kref+0x14b8:   	bne,a	_kref+0x14cc
	.word	0x8143c000	! t0_kref+0x14bc:   	stbar
	.word	0xa7a00529	! t0_kref+0x14c0:   	fsqrts	%f9, %f19
	.word	0x37800005	! t0_kref+0x14c4:   	fbge,a	_kref+0x14d8
	.word	0xafa00136	! t0_kref+0x14c8:   	fabss	%f22, %f23
	.word	0x33800004	! t0_kref+0x14cc:   	fbe,a	_kref+0x14dc
	.word	0xd030a02e	! t0_kref+0x14d0:   	sth	%o0, [%g2 + 0x2e]
	.word	0xee30a000	! t0_kref+0x14d4:   	sth	%l7, [%g2]
	.word	0x912ae00c	! t0_kref+0x14d8:   	sll	%o3, 0xc, %o0
	.word	0xaebb32a3	! t0_kref+0x14dc:   	xnorcc	%o4, -0xd5d, %l7
	.word	0xa1a000aa	! t0_kref+0x14e0:   	fnegs	%f10, %f16
	.word	0x81824000	! t0_kref+0x14e4:   	wr	%o1, %g0, %y
	.word	0xb1a00136	! t0_kref+0x14e8:   	fabss	%f22, %f24
	.word	0x9fc10000	! t0_kref+0x14ec:   	call	%g4
	.word	0x9912c017	! t0_kref+0x14f0:   	taddcctv	%o3, %l7, %o4
	.word	0xf9bf1a59	! t0_kref+0x14f4:   	stda	%f28, [%i4 + %i1]0xd2
	.word	0xde48a02a	! t0_kref+0x14f8:   	ldsb	[%g2 + 0x2a], %o7
	.word	0x96434000	! t0_kref+0x14fc:   	addc	%o5, %g0, %o3
	.word	0x933e8000	! t0_kref+0x1500:   	sra	%i2, %g0, %o1
	.word	0xeb20a014	! t0_kref+0x1504:   	st	%f21, [%g2 + 0x14]
	.word	0xec066008	! t0_kref+0x1508:   	ld	[%i1 + 8], %l6
	.word	0xea28a026	! t0_kref+0x150c:   	stb	%l5, [%g2 + 0x26]
	.word	0x9eda602b	! t0_kref+0x1510:   	smulcc	%o1, 0x2b, %o7
	.word	0xa8fafddb	! t0_kref+0x1514:   	sdivcc	%o3, -0x225, %l4
	.word	0xa5a01052	! t0_kref+0x1518:   	fdtox	%f18, %f18
	.word	0xd808a027	! t0_kref+0x151c:   	ldub	[%g2 + 0x27], %o4
	.word	0xfd3e6000	! t0_kref+0x1520:   	std	%f30, [%i1]
	.word	0x2b480001	! t0_kref+0x1524:   	fbug,a,pt	%fcc0, _kref+0x1528
	.word	0xaa052a49	! t0_kref+0x1528:   	add	%l4, 0xa49, %l5
	.word	0xe9be184d	! t0_kref+0x152c:   	stda	%f20, [%i0 + %o5]0xc2
	.word	0x86102018	! t0_kref+0x1530:   	mov	0x18, %g3
	.word	0x86a0e001	! t0_kref+0x1534:   	subcc	%g3, 1, %g3
	.word	0x22800015	! t0_kref+0x1538:   	be,a	_kref+0x158c
	.word	0xda50a026	! t0_kref+0x153c:   	ldsh	[%g2 + 0x26], %o5
	.word	0x354ffffd	! t0_kref+0x1540:   	fbue,a,pt	%fcc0, _kref+0x1534
	.word	0xe6566010	! t0_kref+0x1544:   	ldsh	[%i1 + 0x10], %l3
	.word	0x81de70f0	! t0_kref+0x1548:   	flush	%i1 - 0xf10
	.word	0xd608a034	! t0_kref+0x154c:   	ldub	[%g2 + 0x34], %o3
	.word	0xe2562010	! t0_kref+0x1550:   	ldsh	[%i0 + 0x10], %l1
	.word	0x39480006	! t0_kref+0x1554:   	fbuge,a,pt	%fcc0, _kref+0x156c
	.word	0x1534ecf5	! t0_kref+0x1558:   	sethi	%hi(0xd3b3d400), %o2
	.word	0xe67e001c	! t0_kref+0x155c:   	swap	[%i0 + %i4], %l3
	.word	0xc0500018	! t0_kref+0x1560:   	ldsh	[%g0 + %i0], %g0
	.word	0xd9380018	! t0_kref+0x1564:   	std	%f12, [%g0 + %i0]
	.word	0x34bffff3	! t0_kref+0x1568:   	bg,a	_kref+0x1534
	.word	0xd8a81019	! t0_kref+0x156c:   	stba	%o4, [%g0 + %i1]0x80
	.word	0xe048a02a	! t0_kref+0x1570:   	ldsb	[%g2 + 0x2a], %l0
	.word	0xa1a018d8	! t0_kref+0x1574:   	fdtos	%f24, %f16
	.word	0x942dc016	! t0_kref+0x1578:   	andn	%l7, %l6, %o2
	.word	0xb9a708d8	! t0_kref+0x157c:   	fsubd	%f28, %f24, %f28
	.word	0xd4366000	! t0_kref+0x1580:   	sth	%o2, [%i1]
	.word	0x38bfffec	! t0_kref+0x1584:   	bgu,a	_kref+0x1534
	.word	0xe89e1000	! t0_kref+0x1588:   	ldda	[%i0]0x80, %l4
	.word	0xa402e161	! t0_kref+0x158c:   	add	%o3, 0x161, %l2
	.word	0xfb00a028	! t0_kref+0x1590:   	ld	[%g2 + 0x28], %f29
	.word	0x9da00530	! t0_kref+0x1594:   	fsqrts	%f16, %f14
	.word	0x2519f586	! t0_kref+0x1598:   	sethi	%hi(0x67d61800), %l2
	.word	0x9fc10000	! t0_kref+0x159c:   	call	%g4
	.word	0xaefd3ad2	! t0_kref+0x15a0:   	sdivcc	%l4, -0x52e, %l7
	.word	0xbda408a9	! t0_kref+0x15a4:   	fsubs	%f16, %f9, %f30
	.word	0x9de3bfa0	! t0_kref+0x15a8:   	save	%sp, -0x60, %sp
	.word	0xbad66bd8	! t0_kref+0x15ac:   	umulcc	%i1, 0xbd8, %i5
	.word	0xa9ef0000	! t0_kref+0x15b0:   	restore	%i4, %g0, %l4
	.word	0x81aa0ab2	! t0_kref+0x15b4:   	fcmpes	%fcc0, %f8, %f18
	.word	0xea28a023	! t0_kref+0x15b8:   	stb	%l5, [%g2 + 0x23]
	.word	0xd4ee9018	! t0_kref+0x15bc:   	ldstuba	[%i2 + %i0]0x80, %o2
	.word	0xe91e6000	! t0_kref+0x15c0:   	ldd	[%i1], %f20
	.word	0xd0a01018	! t0_kref+0x15c4:   	sta	%o0, [%g0 + %i0]0x80
	.word	0x9845ac3a	! t0_kref+0x15c8:   	addc	%l6, 0xc3a, %o4
	.word	0xb9a6885a	! t0_kref+0x15cc:   	faddd	%f26, %f26, %f28
	.word	0xe3b8a080	! t0_kref+0x15d0:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xe3b8a080	! t0_kref+0x15d4:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x8143e040	! t0_kref+0x15d8:   	membar	0x40
	.word	0xf420a030	! t0_kref+0x15dc:   	st	%i2, [%g2 + 0x30]
	.word	0xc99e1a1a	! t0_kref+0x15e0:   	ldda	[%i0 + %i2]0xd0, %f4
	.word	0x9540c000	! t0_kref+0x15e4:   	mov	%asi, %o2
	.word	0xf007bfe0	! t0_kref+0x15e8:   	ld	[%fp - 0x20], %i0
	.word	0x8182c000	! t0_kref+0x15ec:   	wr	%o3, %g0, %y
	.word	0x2f309c85	! t0_kref+0x15f0:   	sethi	%hi(0xc2721400), %l7
	.word	0xf1be1896	! t0_kref+0x15f4:   	stda	%f24, [%i0 + %l6]0xc4
	.word	0x92158008	! t0_kref+0x15f8:   	or	%l6, %o0, %o1
	.word	0xa4bd0000	! t0_kref+0x15fc:   	xnorcc	%l4, %g0, %l2
	.word	0xa9a1cd3e	! t0_kref+0x1600:   	fsmuld	%f7, %f30, %f20
	.word	0xa7a01a5c	! t0_kref+0x1604:   	fdtoi	%f28, %f19
	.word	0xda267fe0	! t0_kref+0x1608:   	st	%o5, [%i1 - 0x20]
	.word	0xd19e1a1b	! t0_kref+0x160c:   	ldda	[%i0 + %i3]0xd0, %f8
	.word	0xc9bf5a58	! t0_kref+0x1610:   	stda	%f4, [%i5 + %i0]0xd2
	.word	0xbda409d4	! t0_kref+0x1614:   	fdivd	%f16, %f20, %f30
	.word	0xa9a01a2e	! t0_kref+0x1618:   	fstoi	%f14, %f20
	.word	0x81dd6a39	! t0_kref+0x161c:   	flush	%l5 + 0xa39
	.word	0xada348be	! t0_kref+0x1620:   	fsubs	%f13, %f30, %f22
	.word	0x26800006	! t0_kref+0x1624:   	bl,a	_kref+0x163c
	.word	0xa52a6005	! t0_kref+0x1628:   	sll	%o1, 0x5, %l2
	.word	0xcd3e2010	! t0_kref+0x162c:   	std	%f6, [%i0 + 0x10]
	.word	0xc0263ff8	! t0_kref+0x1630:   	clr	[%i0 - 8]
	.word	0x81a98ad8	! t0_kref+0x1634:   	fcmped	%fcc0, %f6, %f24
	.word	0xd640a014	! t0_kref+0x1638:   	ldsw	[%g2 + 0x14], %o3
	.word	0xa6f6ae7a	! t0_kref+0x163c:   	udivcc	%i2, 0xe7a, %l3
	.word	0xe5263fec	! t0_kref+0x1640:   	st	%f18, [%i0 - 0x14]
	.word	0xaba00028	! t0_kref+0x1644:   	fmovs	%f8, %f21
	.word	0x9de3bfa0	! t0_kref+0x1648:   	save	%sp, -0x60, %sp
	.word	0xb81e4000	! t0_kref+0x164c:   	xor	%i1, %g0, %i4
	.word	0x99e82b81	! t0_kref+0x1650:   	restore	%g0, 0xb81, %o4
	.word	0x808b0016	! t0_kref+0x1654:   	btst	%l6, %o4
	.word	0x35800007	! t0_kref+0x1658:   	fbue,a	_kref+0x1674
	.word	0xa9400000	! t0_kref+0x165c:   	mov	%y, %l4
	.word	0xd408a012	! t0_kref+0x1660:   	ldub	[%g2 + 0x12], %o2
	.word	0x9fc10000	! t0_kref+0x1664:   	call	%g4
	.word	0xab0522e5	! t0_kref+0x1668:   	taddcc	%l4, 0x2e5, %l5
	.word	0xb9a18d2d	! t0_kref+0x166c:   	fsmuld	%f6, %f13, %f28
	.word	0xf320a004	! t0_kref+0x1670:   	st	%f25, [%g2 + 4]
	.word	0x923a8000	! t0_kref+0x1674:   	not	%o2, %o1
	.word	0xb3a0052e	! t0_kref+0x1678:   	fsqrts	%f14, %f25
	.word	0x86102007	! t0_kref+0x167c:   	mov	0x7, %g3
	.word	0x86a0e001	! t0_kref+0x1680:   	subcc	%g3, 1, %g3
	.word	0x2280000f	! t0_kref+0x1684:   	be,a	_kref+0x16c0
	.word	0x96356e2d	! t0_kref+0x1688:   	orn	%l5, 0xe2d, %o3
	.word	0xa2fd8008	! t0_kref+0x168c:   	sdivcc	%l6, %o0, %l1
	.word	0xa9a01036	! t0_kref+0x1690:   	fstox	%f22, %f20
	.word	0xf4a6501c	! t0_kref+0x1694:   	sta	%i2, [%i1 + %i4]0x80
	.word	0xc128001c	! t0_kref+0x1698:   	st	%fsr, [%g0 + %i4]
	.word	0xa013000a	! t0_kref+0x169c:   	or	%o4, %o2, %l0
	.word	0xb1a018de	! t0_kref+0x16a0:   	fdtos	%f30, %f24
	.word	0x9fc10000	! t0_kref+0x16a4:   	call	%g4
	.word	0x1b24a62a	! t0_kref+0x16a8:   	sethi	%hi(0x9298a800), %o5
	.word	0xa5a0111c	! t0_kref+0x16ac:   	fxtod	%f28, %f18
	.word	0x2d4ffff4	! t0_kref+0x16b0:   	fbg,a,pt	%fcc0, _kref+0x1680
	.word	0x95a2093b	! t0_kref+0x16b4:   	fmuls	%f8, %f27, %f10
	.word	0xc168a089	! t0_kref+0x16b8:   	prefetch	%g2 + 0x89, 0
	.word	0x3ebffff1	! t0_kref+0x16bc:   	bvc,a	_kref+0x1680
	.word	0x9e0def80	! t0_kref+0x16c0:   	and	%l7, 0xf80, %o7
	.word	0xe608a003	! t0_kref+0x16c4:   	ldub	[%g2 + 3], %l3
	.word	0xd27e0000	! t0_kref+0x16c8:   	swap	[%i0], %o1
	.word	0xe11fbf00	! t0_kref+0x16cc:   	ldd	[%fp - 0x100], %f16
	.word	0x9a7332f7	! t0_kref+0x16d0:   	udiv	%o4, -0xd09, %o5
	.word	0x9b356012	! t0_kref+0x16d4:   	srl	%l5, 0x12, %o5
	.word	0xb3a608aa	! t0_kref+0x16d8:   	fsubs	%f24, %f10, %f25
	.word	0xbba48836	! t0_kref+0x16dc:   	fadds	%f18, %f22, %f29
	.word	0xec30a000	! t0_kref+0x16e0:   	sth	%l6, [%g2]
	.word	0xe616c019	! t0_kref+0x16e4:   	lduh	[%i3 + %i1], %l3
	.word	0x81db4015	! t0_kref+0x16e8:   	flush	%o5 + %l5
	.word	0x96ba2cb7	! t0_kref+0x16ec:   	xnorcc	%o0, 0xcb7, %o3
	.word	0xd82e001a	! t0_kref+0x16f0:   	stb	%o4, [%i0 + %i2]
	.word	0xa5a3cd2b	! t0_kref+0x16f4:   	fsmuld	%f15, %f11, %f18
	.word	0xaa8567ea	! t0_kref+0x16f8:   	addcc	%l5, 0x7ea, %l5
	.word	0x2e800005	! t0_kref+0x16fc:   	bvs,a	_kref+0x1710
	.word	0xae1ac016	! t0_kref+0x1700:   	xor	%o3, %l6, %l7
	.word	0x3d480006	! t0_kref+0x1704:   	fbule,a,pt	%fcc0, _kref+0x171c
	.word	0xe3b8a040	! t0_kref+0x1708:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x972d801a	! t0_kref+0x170c:   	sll	%l6, %i2, %o3
	.word	0x81ad8a5a	! t0_kref+0x1710:   	fcmpd	%fcc0, %f22, %f26
	.word	0xbba018d8	! t0_kref+0x1714:   	fdtos	%f24, %f29
	.word	0xe5981019	! t0_kref+0x1718:   	ldda	[%g0 + %i1]0x80, %f18
	.word	0xada018dc	! t0_kref+0x171c:   	fdtos	%f28, %f22
	.word	0xa8f2edc8	! t0_kref+0x1720:   	udivcc	%o3, 0xdc8, %l4
	.word	0xae7d2aa6	! t0_kref+0x1724:   	sdiv	%l4, 0xaa6, %l7
	.word	0xd6364000	! t0_kref+0x1728:   	sth	%o3, [%i1]
	.word	0x9fc10000	! t0_kref+0x172c:   	call	%g4
	.word	0xef68a084	! t0_kref+0x1730:   	prefetch	%g2 + 0x84, 23
	.word	0xa2aa400a	! t0_kref+0x1734:   	andncc	%o1, %o2, %l1
	.word	0xe640a018	! t0_kref+0x1738:   	ldsw	[%g2 + 0x18], %l3
	.word	0x9fa01a28	! t0_kref+0x173c:   	fstoi	%f8, %f15
	.word	0x8143c000	! t0_kref+0x1740:   	stbar
	.word	0x83414000	! t0_kref+0x1744:   	mov	%pc, %g1
	.word	0x9fc10000	! t0_kref+0x1748:   	call	%g4
	.word	0x8da6c9a9	! t0_kref+0x174c:   	fdivs	%f27, %f9, %f6
	.word	0xbda18852	! t0_kref+0x1750:   	faddd	%f6, %f18, %f30
	.word	0x9e46bfec	! t0_kref+0x1754:   	addc	%i2, -0x14, %o7
	.word	0x8da5cd37	! t0_kref+0x1758:   	fsmuld	%f23, %f23, %f6
	.word	0xae1de9fb	! t0_kref+0x175c:   	xor	%l7, 0x9fb, %l7
	.word	0xbda248b6	! t0_kref+0x1760:   	fsubs	%f9, %f22, %f30
	.word	0xaa3b000d	! t0_kref+0x1764:   	xnor	%o4, %o5, %l5
	.word	0xe4086064	! t0_kref+0x1768:   	ldub	[%g1 + 0x64], %l2
	.word	0xa41ca00c	! t0_kref+0x176c:   	xor	%l2, 0xc, %l2
	.word	0xe4286064	! t0_kref+0x1770:   	stb	%l2, [%g1 + 0x64]
	.word	0x81d86064	! t0_kref+0x1774:   	flush	%g1 + 0x64
	.word	0x9a82c00a	! t0_kref+0x1778:   	addcc	%o3, %o2, %o5
	.word	0xaba01a3e	! t0_kref+0x177c:   	fstoi	%f30, %f21
	.word	0xe11e2008	! t0_kref+0x1780:   	ldd	[%i0 + 8], %f16
	.word	0xaec5000a	! t0_kref+0x1784:   	addccc	%l4, %o2, %l7
	.word	0x81580000	! t0_kref+0x1788:   	flushw
	.word	0xaf65000d	! t0_kref+0x178c:   	movleu	%icc, %o5, %l7
	.word	0xafa018c6	! t0_kref+0x1790:   	fdtos	%f6, %f23
	.word	0xf300a01c	! t0_kref+0x1794:   	ld	[%g2 + 0x1c], %f25
	.word	0xae2b6980	! t0_kref+0x1798:   	andn	%o5, 0x980, %l7
	.word	0x902e8009	! t0_kref+0x179c:   	andn	%i2, %o1, %o0
	.word	0xc12e3ffc	! t0_kref+0x17a0:   	st	%fsr, [%i0 - 4]
	.word	0xb7a00539	! t0_kref+0x17a4:   	fsqrts	%f25, %f27
2:	.word	0x9b3a0017	! t0_kref+0x17a8:   	sra	%o0, %l7, %o5
	.word	0x97a01a3a	! t0_kref+0x17ac:   	fstoi	%f26, %f11
	.word	0xd808a028	! t0_kref+0x17b0:   	ldub	[%g2 + 0x28], %o4
	.word	0xb9a40956	! t0_kref+0x17b4:   	fmuld	%f16, %f22, %f28
	sethi	%hi(2f), %o7
	.word	0xe40be3f0	! t0_kref+0x17bc:   	ldub	[%o7 + 0x3f0], %l2
	.word	0xa41ca00c	! t0_kref+0x17c0:   	xor	%l2, 0xc, %l2
	.word	0xe42be3f0	! t0_kref+0x17c4:   	stb	%l2, [%o7 + 0x3f0]
	.word	0x81dbe3f0	! t0_kref+0x17c8:   	flush	%o7 + 0x3f0
	.word	0xa7a308b2	! t0_kref+0x17cc:   	fsubs	%f12, %f18, %f19
	.word	0x94424017	! t0_kref+0x17d0:   	addc	%o1, %l7, %o2
	.word	0xa3a0188a	! t0_kref+0x17d4:   	fitos	%f10, %f17
	.word	0xda080019	! t0_kref+0x17d8:   	ldub	[%g0 + %i1], %o5
	.word	0xad3a200e	! t0_kref+0x17dc:   	sra	%o0, 0xe, %l6
	.word	0x81580000	! t0_kref+0x17e0:   	flushw
	.word	0x9f2a200a	! t0_kref+0x17e4:   	sll	%o0, 0xa, %o7
	.word	0x81aa0a27	! t0_kref+0x17e8:   	fcmps	%fcc0, %f8, %f7
	.word	0xe3b8a040	! t0_kref+0x17ec:   	stda	%f48, [%g2 + 0x40]%asi
2:	.word	0xd608a01b	! t0_kref+0x17f0:   	ldub	[%g2 + 0x1b], %o3
	.word	0xe200a020	! t0_kref+0x17f4:   	ld	[%g2 + 0x20], %l1
	.word	0xf51e2018	! t0_kref+0x17f8:   	ldd	[%i0 + 0x18], %f26
	.word	0x9de3bfa0	! t0_kref+0x17fc:   	save	%sp, -0x60, %sp
	.word	0x81eee9fa	! t0_kref+0x1800:   	restore	%i3, 0x9fa, %g0
	.word	0x30800001	! t0_kref+0x1804:   	ba,a	_kref+0x1808
	.word	0xa2fd800b	! t0_kref+0x1808:   	sdivcc	%l6, %o3, %l1
	.word	0x93a00533	! t0_kref+0x180c:   	fsqrts	%f19, %f9
	.word	0x94bd000b	! t0_kref+0x1810:   	xnorcc	%l4, %o3, %o2
	.word	0x8143e04e	! t0_kref+0x1814:   	membar	0x4e
	.word	0xa03a3cce	! t0_kref+0x1818:   	xnor	%o0, -0x332, %l0
	.word	0xafa208bc	! t0_kref+0x181c:   	fsubs	%f8, %f28, %f23
	.word	0x91a48d30	! t0_kref+0x1820:   	fsmuld	%f18, %f16, %f8
	.word	0x81830000	! t0_kref+0x1824:   	wr	%o4, %g0, %y
	.word	0xe7ee501c	! t0_kref+0x1828:   	prefetcha	%i1 + %i4, 19
	.word	0x39480004	! t0_kref+0x182c:   	fbuge,a,pt	%fcc0, _kref+0x183c
	.word	0xb3a01a39	! t0_kref+0x1830:   	fstoi	%f25, %f25
	.word	0xde56200e	! t0_kref+0x1834:   	ldsh	[%i0 + 0xe], %o7
	.word	0x9fc10000	! t0_kref+0x1838:   	call	%g4
	.word	0xbda01a32	! t0_kref+0x183c:   	fstoi	%f18, %f30
	.word	0x99ab4046	! t0_kref+0x1840:   	fmovdle	%fcc0, %f6, %f12
	.word	0x92ba8009	! t0_kref+0x1844:   	xnorcc	%o2, %o1, %o1
	.word	0xd8ae1000	! t0_kref+0x1848:   	stba	%o4, [%i0]0x80
	.word	0x92dac00c	! t0_kref+0x184c:   	smulcc	%o3, %o4, %o1
	.word	0xda48a025	! t0_kref+0x1850:   	ldsb	[%g2 + 0x25], %o5
	.word	0xd09e5000	! t0_kref+0x1854:   	ldda	[%i1]0x80, %o0
	.word	0x9de3bfa0	! t0_kref+0x1858:   	save	%sp, -0x60, %sp
	.word	0xa5ef24d1	! t0_kref+0x185c:   	restore	%i4, 0x4d1, %l2
	.word	0xe448a02a	! t0_kref+0x1860:   	ldsb	[%g2 + 0x2a], %l2
	.word	0xee4e600c	! t0_kref+0x1864:   	ldsb	[%i1 + 0xc], %l7
	.word	0xe8363ff8	! t0_kref+0x1868:   	sth	%l4, [%i0 - 8]
	.word	0xd4a6101c	! t0_kref+0x186c:   	sta	%o2, [%i0 + %i4]0x80
	.word	0x9de3bfa0	! t0_kref+0x1870:   	save	%sp, -0x60, %sp
	.word	0x97e82074	! t0_kref+0x1874:   	restore	%g0, 0x74, %o3
	.word	0x9afb400d	! t0_kref+0x1878:   	sdivcc	%o5, %o5, %o5
	.word	0xb7a018d0	! t0_kref+0x187c:   	fdtos	%f16, %f27
	.word	0xac1a8014	! t0_kref+0x1880:   	xor	%o2, %l4, %l6
	.word	0x83414000	! t0_kref+0x1884:   	mov	%pc, %g1
	.word	0xd5063fe4	! t0_kref+0x1888:   	ld	[%i0 - 0x1c], %f10
	.word	0x94f30014	! t0_kref+0x188c:   	udivcc	%o4, %l4, %o2
	.word	0xdb064000	! t0_kref+0x1890:   	ld	[%i1], %f13
	.word	0xa5a01910	! t0_kref+0x1894:   	fitod	%f16, %f18
	.word	0xb5a01a28	! t0_kref+0x1898:   	fstoi	%f8, %f26
	.word	0x31480005	! t0_kref+0x189c:   	fba,a,pt	%fcc0, _kref+0x18b0
	.word	0xc048a02d	! t0_kref+0x18a0:   	ldsb	[%g2 + 0x2d], %g0
	.word	0xfd1fbdd8	! t0_kref+0x18a4:   	ldd	[%fp - 0x228], %f30
	.word	0x26800005	! t0_kref+0x18a8:   	bl,a	_kref+0x18bc
	.word	0x96002537	! t0_kref+0x18ac:   	add	%g0, 0x537, %o3
	.word	0xc0766000	! t0_kref+0x18b0:   	stx	%g0, [%i1]
	.word	0xb7a00532	! t0_kref+0x18b4:   	fsqrts	%f18, %f27
	.word	0xe168a089	! t0_kref+0x18b8:   	prefetch	%g2 + 0x89, 16
	.word	0xa8e5edab	! t0_kref+0x18bc:   	subccc	%l7, 0xdab, %l4
	.word	0x9fc10000	! t0_kref+0x18c0:   	call	%g4
	.word	0xe00e001a	! t0_kref+0x18c4:   	ldub	[%i0 + %i2], %l0
	.word	0xe168a080	! t0_kref+0x18c8:   	prefetch	%g2 + 0x80, 16
	.word	0x81ad8adc	! t0_kref+0x18cc:   	fcmped	%fcc0, %f22, %f28
	.word	0xd4801018	! t0_kref+0x18d0:   	lda	[%g0 + %i0]0x80, %o2
	.word	0xdf00a03c	! t0_kref+0x18d4:   	ld	[%g2 + 0x3c], %f15
	.word	0xd11fbc40	! t0_kref+0x18d8:   	ldd	[%fp - 0x3c0], %f8
	.word	0x95a00539	! t0_kref+0x18dc:   	fsqrts	%f25, %f10
	.word	0x96458008	! t0_kref+0x18e0:   	addc	%l6, %o0, %o3
	.word	0x8082bf89	! t0_kref+0x18e4:   	addcc	%o2, -0x77, %g0
	.word	0xac7a0000	! t0_kref+0x18e8:   	sdiv	%o0, %g0, %l6
	.word	0x80c6ab35	! t0_kref+0x18ec:   	addccc	%i2, 0xb35, %g0
	.word	0xe720a014	! t0_kref+0x18f0:   	st	%f19, [%g2 + 0x14]
	call	SYM(t0_subr1)
	.word	0xd8200018	! t0_kref+0x18f8:   	st	%o4, [%g0 + %i0]
	.word	0xd91fbc10	! t0_kref+0x18fc:   	ldd	[%fp - 0x3f0], %f12
	.word	0x9ba50929	! t0_kref+0x1900:   	fmuls	%f20, %f9, %f13
	.word	0xec7e401c	! t0_kref+0x1904:   	swap	[%i1 + %i4], %l6
	.word	0x99200014	! t0_kref+0x1908:   	mulscc	%g0, %l4, %o4
	.word	0xb1a00034	! t0_kref+0x190c:   	fmovs	%f20, %f24
	.word	0xd008a032	! t0_kref+0x1910:   	ldub	[%g2 + 0x32], %o0
	.word	0x39800002	! t0_kref+0x1914:   	fbuge,a	_kref+0x191c
	.word	0x9a1b0014	! t0_kref+0x1918:   	xor	%o4, %l4, %o5
	.word	0x942d0008	! t0_kref+0x191c:   	andn	%l4, %o0, %o2
	.word	0xae82c015	! t0_kref+0x1920:   	addcc	%o3, %l5, %l7
	.word	0xe53e6010	! t0_kref+0x1924:   	std	%f18, [%i1 + 0x10]
	.word	0xd82e3fe1	! t0_kref+0x1928:   	stb	%o4, [%i0 - 0x1f]
	.word	0x8fa58830	! t0_kref+0x192c:   	fadds	%f22, %f16, %f7
	.word	0x9835c00b	! t0_kref+0x1930:   	orn	%l7, %o3, %o4
	.word	0x921de432	! t0_kref+0x1934:   	xor	%l7, 0x432, %o1
	.word	0x913a601d	! t0_kref+0x1938:   	sra	%o1, 0x1d, %o0
	.word	0xb1a0102e	! t0_kref+0x193c:   	fstox	%f14, %f24
	.word	0x983ab611	! t0_kref+0x1940:   	xnor	%o2, -0x9ef, %o4
	.word	0x81df76a7	! t0_kref+0x1944:   	flush	%i5 - 0x959
	.word	0xd0000018	! t0_kref+0x1948:   	ld	[%g0 + %i0], %o0
	.word	0xee263ff0	! t0_kref+0x194c:   	st	%l7, [%i0 - 0x10]
	.word	0xad2d000a	! t0_kref+0x1950:   	sll	%l4, %o2, %l6
	.word	0xa0fb2cb7	! t0_kref+0x1954:   	sdivcc	%o4, 0xcb7, %l0
	.word	0xa722fdd1	! t0_kref+0x1958:   	mulscc	%o3, -0x22f, %l3
	.word	0x9a868009	! t0_kref+0x195c:   	addcc	%i2, %o1, %o5
	.word	0xac2b3ed2	! t0_kref+0x1960:   	andn	%o4, -0x12e, %l6
	.word	0xd9070018	! t0_kref+0x1964:   	ld	[%i4 + %i0], %f12
	.word	0x94783f36	! t0_kref+0x1968:   	sdiv	%g0, -0xca, %o2
	.word	0xcd1fbc80	! t0_kref+0x196c:   	ldd	[%fp - 0x380], %f6
	.word	0xa9a00030	! t0_kref+0x1970:   	fmovs	%f16, %f20
	.word	0xb7a0012f	! t0_kref+0x1974:   	fabss	%f15, %f27
	.word	0x27480004	! t0_kref+0x1978:   	fbul,a,pt	%fcc0, _kref+0x1988
	.word	0xea30a02c	! t0_kref+0x197c:   	sth	%l5, [%g2 + 0x2c]
	call	SYM(t0_subr1)
	.word	0xafa01a5a	! t0_kref+0x1984:   	fdtoi	%f26, %f23
	.word	0xa6ab7dd8	! t0_kref+0x1988:   	andncc	%o5, -0x228, %l3
	.word	0xbba018cc	! t0_kref+0x198c:   	fdtos	%f12, %f29
	.word	0x95a01037	! t0_kref+0x1990:   	fstox	%f23, %f10
	.word	0x8610200f	! t0_kref+0x1994:   	mov	0xf, %g3
	.word	0x86a0e001	! t0_kref+0x1998:   	subcc	%g3, 1, %g3
	.word	0x22800009	! t0_kref+0x199c:   	be,a	_kref+0x19c0
	.word	0x8fa0189a	! t0_kref+0x19a0:   	fitos	%f26, %f7
	.word	0xd4162000	! t0_kref+0x19a4:   	lduh	[%i0], %o2
	.word	0x9fc10000	! t0_kref+0x19a8:   	call	%g4
	.word	0xe6064000	! t0_kref+0x19ac:   	ld	[%i1], %l3
	.word	0x81ae0a48	! t0_kref+0x19b0:   	fcmpd	%fcc0, %f24, %f8
	.word	0xb5a000a9	! t0_kref+0x19b4:   	fnegs	%f9, %f26
	.word	0xcd1fbd50	! t0_kref+0x19b8:   	ldd	[%fp - 0x2b0], %f6
	.word	0xd0200019	! t0_kref+0x19bc:   	st	%o0, [%g0 + %i1]
	.word	0x29480003	! t0_kref+0x19c0:   	fbl,a,pt	%fcc0, _kref+0x19cc
	.word	0xd600a038	! t0_kref+0x19c4:   	ld	[%g2 + 0x38], %o3
	.word	0xa03aacc0	! t0_kref+0x19c8:   	xnor	%o2, 0xcc0, %l0
	.word	0x932d000a	! t0_kref+0x19cc:   	sll	%l4, %o2, %o1
	.word	0x28800008	! t0_kref+0x19d0:   	bleu,a	_kref+0x19f0
	.word	0xd93e2018	! t0_kref+0x19d4:   	std	%f12, [%i0 + 0x18]
	.word	0xa4aa2e65	! t0_kref+0x19d8:   	andncc	%o0, 0xe65, %l2
	.word	0xeb68a006	! t0_kref+0x19dc:   	prefetch	%g2 + 6, 21
	.word	0xc07e6008	! t0_kref+0x19e0:   	swap	[%i1 + 8], %g0
	.word	0xa415a344	! t0_kref+0x19e4:   	or	%l6, 0x344, %l2
	.word	0x9fc00004	! t0_kref+0x19e8:   	call	%g0 + %g4
	.word	0xe3b8a040	! t0_kref+0x19ec:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xaebdc017	! t0_kref+0x19f0:   	xnorcc	%l7, %l7, %l7
	.word	0xbba5082b	! t0_kref+0x19f4:   	fadds	%f20, %f11, %f29
	.word	0x903a6c90	! t0_kref+0x19f8:   	xnor	%o1, 0xc90, %o0
	.word	0x98a2f7f0	! t0_kref+0x19fc:   	subcc	%o3, -0x810, %o4
	.word	0xb3a018ca	! t0_kref+0x1a00:   	fdtos	%f10, %f25
	.word	0xea00a018	! t0_kref+0x1a04:   	ld	[%g2 + 0x18], %l5
	.word	0xac92000d	! t0_kref+0x1a08:   	orcc	%o0, %o5, %l6
	.word	0x80a37198	! t0_kref+0x1a0c:   	cmp	%o5, -0xe68
	.word	0x8143c000	! t0_kref+0x1a10:   	stbar
	.word	0x93a0013b	! t0_kref+0x1a14:   	fabss	%f27, %f9
	.word	0xa83d0009	! t0_kref+0x1a18:   	xnor	%l4, %o1, %l4
	.word	0xf13e2008	! t0_kref+0x1a1c:   	std	%f24, [%i0 + 8]
	.word	0xc7ee1017	! t0_kref+0x1a20:   	prefetcha	%i0 + %l7, 3
	.word	0x9da01a36	! t0_kref+0x1a24:   	fstoi	%f22, %f14
	.word	0x9de3bfa0	! t0_kref+0x1a28:   	save	%sp, -0x60, %sp
	.word	0x93ef0019	! t0_kref+0x1a2c:   	restore	%i4, %i1, %o1
	.word	0x81820000	! t0_kref+0x1a30:   	wr	%o0, %g0, %y
	.word	0xeb00a024	! t0_kref+0x1a34:   	ld	[%g2 + 0x24], %f21
	.word	0xda167ff2	! t0_kref+0x1a38:   	lduh	[%i1 - 0xe], %o5
	.word	0xc056200c	! t0_kref+0x1a3c:   	ldsh	[%i0 + 0xc], %g0
	call	SYM(t0_subr0)
	.word	0xdd1e7fe8	! t0_kref+0x1a44:   	ldd	[%i1 - 0x18], %f14
	.word	0xa4fb6175	! t0_kref+0x1a48:   	sdivcc	%o5, 0x175, %l2
	.word	0xbda0109a	! t0_kref+0x1a4c:   	fxtos	%f26, %f30
	.word	0x983aabff	! t0_kref+0x1a50:   	xnor	%o2, 0xbff, %o4
	.word	0x81daf6ed	! t0_kref+0x1a54:   	flush	%o3 - 0x913
	.word	0x982e8016	! t0_kref+0x1a58:   	andn	%i2, %l6, %o4
	.word	0x86102002	! t0_kref+0x1a5c:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x1a60:   	bne,a	_kref+0x1a60
	.word	0x86a0e001	! t0_kref+0x1a64:   	subcc	%g3, 1, %g3
	.word	0xe3b8a040	! t0_kref+0x1a68:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xd20e201d	! t0_kref+0x1a6c:   	ldub	[%i0 + 0x1d], %o1
	.word	0x9da58836	! t0_kref+0x1a70:   	fadds	%f22, %f22, %f14
	.word	0xa1a289d6	! t0_kref+0x1a74:   	fdivd	%f10, %f22, %f16
	.word	0xada6095c	! t0_kref+0x1a78:   	fmuld	%f24, %f28, %f22
	.word	0x3d480002	! t0_kref+0x1a7c:   	fbule,a,pt	%fcc0, _kref+0x1a84
	.word	0xbba018dc	! t0_kref+0x1a80:   	fdtos	%f28, %f29
	.word	0xa01a0008	! t0_kref+0x1a84:   	xor	%o0, %o0, %l0
	.word	0x81ae0ac6	! t0_kref+0x1a88:   	fcmped	%fcc0, %f24, %f6
	call	SYM(t0_subr3)
	.word	0xd100a03c	! t0_kref+0x1a90:   	ld	[%g2 + 0x3c], %f8
	.word	0x947b0009	! t0_kref+0x1a94:   	sdiv	%o4, %o1, %o2
	.word	0xe19e9a18	! t0_kref+0x1a98:   	ldda	[%i2 + %i0]0xd0, %f16
	.word	0x9015800c	! t0_kref+0x1a9c:   	or	%l6, %o4, %o0
	.word	0xd99e1a1a	! t0_kref+0x1aa0:   	ldda	[%i0 + %i2]0xd0, %f12
	.word	0xe008a000	! t0_kref+0x1aa4:   	ldub	[%g2], %l0
	.word	0xf91fbd58	! t0_kref+0x1aa8:   	ldd	[%fp - 0x2a8], %f28
	.word	0x8143e040	! t0_kref+0x1aac:   	membar	0x40
	.word	0xd11fbc40	! t0_kref+0x1ab0:   	ldd	[%fp - 0x3c0], %f8
	.word	0xf13e0000	! t0_kref+0x1ab4:   	std	%f24, [%i0]
	.word	0xf1380019	! t0_kref+0x1ab8:   	std	%f24, [%g0 + %i1]
	.word	0xd6ce9019	! t0_kref+0x1abc:   	ldsba	[%i2 + %i1]0x80, %o3
	.word	0x9e023b91	! t0_kref+0x1ac0:   	add	%o0, -0x46f, %o7
	.word	0xb5a0191e	! t0_kref+0x1ac4:   	fitod	%f30, %f26
	.word	0x8143c000	! t0_kref+0x1ac8:   	stbar
	.word	0x81ddc01e	! t0_kref+0x1acc:   	flush	%l7 + %fp
	.word	0x8143c000	! t0_kref+0x1ad0:   	stbar
	.word	0x92458000	! t0_kref+0x1ad4:   	addc	%l6, %g0, %o1
	.word	0xf1bf1a58	! t0_kref+0x1ad8:   	stda	%f24, [%i4 + %i0]0xd2
	.word	0x907b0016	! t0_kref+0x1adc:   	sdiv	%o4, %l6, %o0
	.word	0x001fffff	! t0_kref+0x1ae0:   	illtrap	0x1fffff
	.word	0x95a74d28	! t0_kref+0x1ae4:   	fsmuld	%f29, %f8, %f10
	.word	0x8da2083a	! t0_kref+0x1ae8:   	fadds	%f8, %f26, %f6
	.word	0x3a480001	! t0_kref+0x1aec:   	bcc,a,pt	%icc, _kref+0x1af0
	.word	0xe200a00c	! t0_kref+0x1af0:   	ld	[%g2 + 0xc], %l1
	.word	0x9802305b	! t0_kref+0x1af4:   	add	%o0, -0xfa5, %o4
	.word	0x2a480008	! t0_kref+0x1af8:   	bcs,a,pt	%icc, _kref+0x1b18
	.word	0x93a00537	! t0_kref+0x1afc:   	fsqrts	%f23, %f9
	.word	0x91a000d6	! t0_kref+0x1b00:   	fnegd	%f22, %f8
	.word	0xf720a018	! t0_kref+0x1b04:   	st	%f27, [%g2 + 0x18]
	.word	0xada1885a	! t0_kref+0x1b08:   	faddd	%f6, %f26, %f22
	.word	0xaa0eb13c	! t0_kref+0x1b0c:   	and	%i2, -0xec4, %l5
	.word	0x30800001	! t0_kref+0x1b10:   	ba,a	_kref+0x1b14
	.word	0xe840a034	! t0_kref+0x1b14:   	ldsw	[%g2 + 0x34], %l4
	.word	0xd43e2000	! t0_kref+0x1b18:   	std	%o2, [%i0]
	.word	0xa5a0003b	! t0_kref+0x1b1c:   	fmovs	%f27, %f18
	.word	0xd006200c	! t0_kref+0x1b20:   	ld	[%i0 + 0xc], %o0
	.word	0xd0000019	! t0_kref+0x1b24:   	ld	[%g0 + %i1], %o0
	.word	0xae420008	! t0_kref+0x1b28:   	addc	%o0, %o0, %l7
	.word	0x92c2310a	! t0_kref+0x1b2c:   	addccc	%o0, -0xef6, %o1
	.word	0x81dda875	! t0_kref+0x1b30:   	flush	%l6 + 0x875
	.word	0xada0012a	! t0_kref+0x1b34:   	fabss	%f10, %f22
	.word	0xe4180019	! t0_kref+0x1b38:   	ldd	[%g0 + %i1], %l2
	.word	0xd240a020	! t0_kref+0x1b3c:   	ldsw	[%g2 + 0x20], %o1
	.word	0xae85b6ed	! t0_kref+0x1b40:   	addcc	%l6, -0x913, %l7
	.word	0xa20b64f2	! t0_kref+0x1b44:   	and	%o5, 0x4f2, %l1
	.word	0xaee52999	! t0_kref+0x1b48:   	subccc	%l4, 0x999, %l7
	.word	0x99a689d0	! t0_kref+0x1b4c:   	fdivd	%f26, %f16, %f12
	.word	0xd46e0000	! t0_kref+0x1b50:   	ldstub	[%i0], %o2
	.word	0xa1a20946	! t0_kref+0x1b54:   	fmuld	%f8, %f6, %f16
	.word	0xd40e8019	! t0_kref+0x1b58:   	ldub	[%i2 + %i1], %o2
	.word	0x2d800005	! t0_kref+0x1b5c:   	fbg,a	_kref+0x1b70
	.word	0xab32c009	! t0_kref+0x1b60:   	srl	%o3, %o1, %l5
	.word	0xd010a018	! t0_kref+0x1b64:   	lduh	[%g2 + 0x18], %o0
	.word	0xa033000b	! t0_kref+0x1b68:   	orn	%o4, %o3, %l0
	.word	0x93a688ba	! t0_kref+0x1b6c:   	fsubs	%f26, %f26, %f9
	.word	0xa03aba8a	! t0_kref+0x1b70:   	xnor	%o2, -0x576, %l0
	.word	0xc0567fe4	! t0_kref+0x1b74:   	ldsh	[%i1 - 0x1c], %g0
	.word	0x980da5db	! t0_kref+0x1b78:   	and	%l6, 0x5db, %o4
	.word	0x29480004	! t0_kref+0x1b7c:   	fbl,a,pt	%fcc0, _kref+0x1b8c
	.word	0x90853e2d	! t0_kref+0x1b80:   	addcc	%l4, -0x1d3, %o0
	.word	0x9fc00004	! t0_kref+0x1b84:   	call	%g0 + %g4
	.word	0x945222b7	! t0_kref+0x1b88:   	umul	%o0, 0x2b7, %o2
	.word	0x3c800003	! t0_kref+0x1b8c:   	bpos,a	_kref+0x1b98
	.word	0x99350008	! t0_kref+0x1b90:   	srl	%l4, %o0, %o4
	.word	0xa6fdf2ed	! t0_kref+0x1b94:   	sdivcc	%l7, -0xd13, %l3
	.word	0xd6362006	! t0_kref+0x1b98:   	sth	%o3, [%i0 + 6]
	.word	0x3a800001	! t0_kref+0x1b9c:   	bcc,a	_kref+0x1ba0
	.word	0xe0167ff6	! t0_kref+0x1ba0:   	lduh	[%i1 - 0xa], %l0
	.word	0x81400000	! t0_kref+0x1ba4:   	mov	%y, %g0
	.word	0x2a800007	! t0_kref+0x1ba8:   	bcs,a	_kref+0x1bc4
	.word	0xe41f4018	! t0_kref+0x1bac:   	ldd	[%i5 + %i0], %l2
	.word	0x81af4abc	! t0_kref+0x1bb0:   	fcmpes	%fcc0, %f29, %f28
	.word	0x99330009	! t0_kref+0x1bb4:   	srl	%o4, %o1, %o4
	.word	0xb3a3482c	! t0_kref+0x1bb8:   	fadds	%f13, %f12, %f25
	.word	0x3c480002	! t0_kref+0x1bbc:   	bpos,a,pt	%icc, _kref+0x1bc4
	.word	0xe53e7ff0	! t0_kref+0x1bc0:   	std	%f18, [%i1 - 0x10]
	.word	0xee563ff0	! t0_kref+0x1bc4:   	ldsh	[%i0 - 0x10], %l7
	.word	0xf198105d	! t0_kref+0x1bc8:   	ldda	[%g0 + %i5]0x82, %f24
	.word	0x23480005	! t0_kref+0x1bcc:   	fbne,a,pt	%fcc0, _kref+0x1be0
	.word	0xa21d7844	! t0_kref+0x1bd0:   	xor	%l5, -0x7bc, %l1
	.word	0x3d480006	! t0_kref+0x1bd4:   	fbule,a,pt	%fcc0, _kref+0x1bec
	.word	0xa9a01913	! t0_kref+0x1bd8:   	fitod	%f19, %f20
	.word	0x8fa0053b	! t0_kref+0x1bdc:   	fsqrts	%f27, %f7
	call	SYM(t0_subr2)
	.word	0xf4200019	! t0_kref+0x1be4:   	st	%i2, [%g0 + %i1]
	.word	0x9fc10000	! t0_kref+0x1be8:   	call	%g4
	.word	0x91a01090	! t0_kref+0x1bec:   	fxtos	%f16, %f8
	.word	0x9a1b7228	! t0_kref+0x1bf0:   	xor	%o5, -0xdd8, %o5
	.word	0x9fc00004	! t0_kref+0x1bf4:   	call	%g0 + %g4
	.word	0xd1bf5019	! t0_kref+0x1bf8:   	stda	%f8, [%i5 + %i1]0x80
	.word	0xa4856f22	! t0_kref+0x1bfc:   	addcc	%l5, 0xf22, %l2
	.word	0xaba7893a	! t0_kref+0x1c00:   	fmuls	%f30, %f26, %f21
	.word	0x39800003	! t0_kref+0x1c04:   	fbuge,a	_kref+0x1c10
	.word	0xcd1f4018	! t0_kref+0x1c08:   	ldd	[%i5 + %i0], %f6
	.word	0x27253ebe	! t0_kref+0x1c0c:   	sethi	%hi(0x94faf800), %l3
	.word	0xa9180015	! t0_kref+0x1c10:   	tsubcctv	%g0, %l5, %l4
	.word	0xa4da4009	! t0_kref+0x1c14:   	smulcc	%o1, %o1, %l2
	.word	0xe968a080	! t0_kref+0x1c18:   	prefetch	%g2 + 0x80, 20
	.word	0x8143e040	! t0_kref+0x1c1c:   	membar	0x40
	.word	0xe93e001d	! t0_kref+0x1c20:   	std	%f20, [%i0 + %i5]
	.word	0xa7a4c8b4	! t0_kref+0x1c24:   	fsubs	%f19, %f20, %f19
	.word	0x9e56800c	! t0_kref+0x1c28:   	umul	%i2, %o4, %o7
	.word	0x94db3cca	! t0_kref+0x1c2c:   	smulcc	%o4, -0x336, %o2
	.word	0xec9f5018	! t0_kref+0x1c30:   	ldda	[%i5 + %i0]0x80, %l6
	.word	0xc1e65014	! t0_kref+0x1c34:   	casa	[%i1]0x80, %l4, %g0
	.word	0xa6152568	! t0_kref+0x1c38:   	or	%l4, 0x568, %l3
	.word	0xe3b8a040	! t0_kref+0x1c3c:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xde10a010	! t0_kref+0x1c40:   	lduh	[%g2 + 0x10], %o7
	.word	0x2d38f5cd	! t0_kref+0x1c44:   	sethi	%hi(0xe3d73400), %l6
	.word	0xaac57ebe	! t0_kref+0x1c48:   	addccc	%l5, -0x142, %l5
	.word	0xac13401a	! t0_kref+0x1c4c:   	or	%o5, %i2, %l6
	.word	0xe2ce9040	! t0_kref+0x1c50:   	ldsba	[%i2]0x82, %l1
	.word	0x99a608ce	! t0_kref+0x1c54:   	fsubd	%f24, %f14, %f12
	.word	0x81af8ad4	! t0_kref+0x1c58:   	fcmped	%fcc0, %f30, %f20
	.word	0xa65d8008	! t0_kref+0x1c5c:   	smul	%l6, %o0, %l3
	.word	0xf1be1000	! t0_kref+0x1c60:   	stda	%f24, [%i0]0x80
	.word	0x9475bbf4	! t0_kref+0x1c64:   	udiv	%l6, -0x40c, %o2
	.word	0xe6564000	! t0_kref+0x1c68:   	ldsh	[%i1], %l3
	.word	0xa202400c	! t0_kref+0x1c6c:   	add	%o1, %o4, %l1
	.word	0xa45aa722	! t0_kref+0x1c70:   	smul	%o2, 0x722, %l2
	.word	0xd6d01019	! t0_kref+0x1c74:   	ldsha	[%g0 + %i1]0x80, %o3
	.word	0xacc5401a	! t0_kref+0x1c78:   	addccc	%l5, %i2, %l6
	.word	0xe408643c	! t0_kref+0x1c7c:   	ldub	[%g1 + 0x43c], %l2
	.word	0xa41ca00c	! t0_kref+0x1c80:   	xor	%l2, 0xc, %l2
	.word	0xe428643c	! t0_kref+0x1c84:   	stb	%l2, [%g1 + 0x43c]
	.word	0x81d8643c	! t0_kref+0x1c88:   	flush	%g1 + 0x43c
	.word	0xbba6c826	! t0_kref+0x1c8c:   	fadds	%f27, %f6, %f29
	.word	0x3e800003	! t0_kref+0x1c90:   	bvc,a	_kref+0x1c9c
	.word	0x1f075065	! t0_kref+0x1c94:   	sethi	%hi(0x1d419400), %o7
	.word	0xee0e201a	! t0_kref+0x1c98:   	ldub	[%i0 + 0x1a], %l7
	.word	0x800eb1b2	! t0_kref+0x1c9c:   	and	%i2, -0xe4e, %g0
	.word	0xd99f5a19	! t0_kref+0x1ca0:   	ldda	[%i5 + %i1]0xd0, %f12
	.word	0xee7e3fec	! t0_kref+0x1ca4:   	swap	[%i0 - 0x14], %l7
	.word	0x923ac01a	! t0_kref+0x1ca8:   	xnor	%o3, %i2, %o1
	.word	0x94f30014	! t0_kref+0x1cac:   	udivcc	%o4, %l4, %o2
	.word	0x95a189cc	! t0_kref+0x1cb0:   	fdivd	%f6, %f12, %f10
	.word	0xaaf80008	! t0_kref+0x1cb4:   	sdivcc	%g0, %o0, %l5
	.word	0xaafde270	! t0_kref+0x1cb8:   	sdivcc	%l7, 0x270, %l5
	.word	0xb9a0003e	! t0_kref+0x1cbc:   	fmovs	%f30, %f28
2:	.word	0xea36001b	! t0_kref+0x1cc0:   	sth	%l5, [%i0 + %i3]
	.word	0xd100a010	! t0_kref+0x1cc4:   	ld	[%g2 + 0x10], %f8
	sethi	%hi(2f), %o7
	.word	0xe40be118	! t0_kref+0x1ccc:   	ldub	[%o7 + 0x118], %l2
	.word	0xa41ca00c	! t0_kref+0x1cd0:   	xor	%l2, 0xc, %l2
	.word	0xe42be118	! t0_kref+0x1cd4:   	stb	%l2, [%o7 + 0x118]
	.word	0x81dbe118	! t0_kref+0x1cd8:   	flush	%o7 + 0x118
	.word	0x9e2d4017	! t0_kref+0x1cdc:   	andn	%l5, %l7, %o7
	.word	0xeef75018	! t0_kref+0x1ce0:   	stxa	%l7, [%i5 + %i0]0x80
	.word	0xa0654014	! t0_kref+0x1ce4:   	subc	%l5, %l4, %l0
	.word	0x9fc00004	! t0_kref+0x1ce8:   	call	%g0 + %g4
	.word	0x9238001a	! t0_kref+0x1cec:   	xnor	%g0, %i2, %o1
	.word	0xf11fbf20	! t0_kref+0x1cf0:   	ldd	[%fp - 0xe0], %f24
	.word	0xaaba255b	! t0_kref+0x1cf4:   	xnorcc	%o0, 0x55b, %l5
	.word	0xda40a018	! t0_kref+0x1cf8:   	ldsw	[%g2 + 0x18], %o5
	.word	0xe416c019	! t0_kref+0x1cfc:   	lduh	[%i3 + %i1], %l2
	.word	0xa9a28854	! t0_kref+0x1d00:   	faddd	%f10, %f20, %f20
	.word	0xa9a018d2	! t0_kref+0x1d04:   	fdtos	%f18, %f20
	.word	0xa8c33365	! t0_kref+0x1d08:   	addccc	%o4, -0xc9b, %l4
	.word	0xda6e2010	! t0_kref+0x1d0c:   	ldstub	[%i0 + 0x10], %o5
	.word	0xada01888	! t0_kref+0x1d10:   	fitos	%f8, %f22
	.word	0x95a01052	! t0_kref+0x1d14:   	fdtox	%f18, %f10
2:	.word	0xada01913	! t0_kref+0x1d18:   	fitod	%f19, %f22
	.word	0x21480003	! t0_kref+0x1d1c:   	fbn,a,pt	%fcc0, _kref+0x1d28
	.word	0xada209d2	! t0_kref+0x1d20:   	fdivd	%f8, %f18, %f22
	.word	0xe51f4018	! t0_kref+0x1d24:   	ldd	[%i5 + %i0], %f18
	.word	0xe648a007	! t0_kref+0x1d28:   	ldsb	[%g2 + 7], %l3
	call	SYM(t0_subr2)
	.word	0xbba01888	! t0_kref+0x1d30:   	fitos	%f8, %f29
	.word	0x90e2c017	! t0_kref+0x1d34:   	subccc	%o3, %l7, %o0
	.word	0xae1aab30	! t0_kref+0x1d38:   	xor	%o2, 0xb30, %l7
	.word	0xea567fea	! t0_kref+0x1d3c:   	ldsh	[%i1 - 0x16], %l5
	.word	0xa932c00d	! t0_kref+0x1d40:   	srl	%o3, %o5, %l4
	.word	0x8143c000	! t0_kref+0x1d44:   	stbar
	.word	0xe820a034	! t0_kref+0x1d48:   	st	%l4, [%g2 + 0x34]
	.word	0x9fc00004	! t0_kref+0x1d4c:   	call	%g0 + %g4
	.word	0xcd86101c	! t0_kref+0x1d50:   	lda	[%i0 + %i4]0x80, %f6
	.word	0xd700a034	! t0_kref+0x1d54:   	ld	[%g2 + 0x34], %f11
	.word	0x800026ff	! t0_kref+0x1d58:   	add	%g0, 0x6ff, %g0
	.word	0x9682c00b	! t0_kref+0x1d5c:   	addcc	%o3, %o3, %o3
	.word	0xd4871018	! t0_kref+0x1d60:   	lda	[%i4 + %i0]0x80, %o2
	.word	0xe3b8a040	! t0_kref+0x1d64:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xe4567ffa	! t0_kref+0x1d68:   	ldsh	[%i1 - 6], %l2
	.word	0xf51e4000	! t0_kref+0x1d6c:   	ldd	[%i1], %f26
	.word	0x9f3a2017	! t0_kref+0x1d70:   	sra	%o0, 0x17, %o7
	.word	0x38800004	! t0_kref+0x1d74:   	bgu,a	_kref+0x1d84
	.word	0xa01d3ec2	! t0_kref+0x1d78:   	xor	%l4, -0x13e, %l0
	.word	0xd030a03e	! t0_kref+0x1d7c:   	sth	%o0, [%g2 + 0x3e]
	.word	0x95a5c83d	! t0_kref+0x1d80:   	fadds	%f23, %f29, %f10
	.word	0xa130201f	! t0_kref+0x1d84:   	srl	%g0, 0x1f, %l0
	sethi	%hi(2f), %o7
	.word	0xe40be1bc	! t0_kref+0x1d8c:   	ldub	[%o7 + 0x1bc], %l2
	.word	0xa41ca00c	! t0_kref+0x1d90:   	xor	%l2, 0xc, %l2
	.word	0xe42be1bc	! t0_kref+0x1d94:   	stb	%l2, [%o7 + 0x1bc]
	.word	0x81dbe1bc	! t0_kref+0x1d98:   	flush	%o7 + 0x1bc
	.word	0xec50a00e	! t0_kref+0x1d9c:   	ldsh	[%g2 + 0xe], %l6
	.word	0xa1a018d8	! t0_kref+0x1da0:   	fdtos	%f24, %f16
	.word	0xb5a00027	! t0_kref+0x1da4:   	fmovs	%f7, %f26
	.word	0xea6e8018	! t0_kref+0x1da8:   	ldstub	[%i2 + %i0], %l5
	.word	0xa9aa0046	! t0_kref+0x1dac:   	fmovda	%fcc0, %f6, %f20
	call	SYM(t0_subr1)
	.word	0xb3a348ae	! t0_kref+0x1db4:   	fsubs	%f13, %f14, %f25
	.word	0xa4e2c014	! t0_kref+0x1db8:   	subccc	%o3, %l4, %l2
2:	.word	0xe6fe501c	! t0_kref+0x1dbc:   	swapa	[%i1 + %i4]0x80, %l3
	.word	0x29480005	! t0_kref+0x1dc0:   	fbl,a,pt	%fcc0, _kref+0x1dd4
	.word	0xe300a01c	! t0_kref+0x1dc4:   	ld	[%g2 + 0x1c], %f17
	.word	0x81aa8ad8	! t0_kref+0x1dc8:   	fcmped	%fcc0, %f10, %f24
	.word	0x3e480006	! t0_kref+0x1dcc:   	bvc,a,pt	%icc, _kref+0x1de4
	.word	0x9da01a3c	! t0_kref+0x1dd0:   	fstoi	%f28, %f14
	.word	0xae0dab8a	! t0_kref+0x1dd4:   	and	%l6, 0xb8a, %l7
	.word	0x81834000	! t0_kref+0x1dd8:   	wr	%o5, %g0, %y
	.word	0x8fa018cc	! t0_kref+0x1ddc:   	fdtos	%f12, %f7
	.word	0x92fb000b	! t0_kref+0x1de0:   	sdivcc	%o4, %o3, %o1
	.word	0xb1a01a39	! t0_kref+0x1de4:   	fstoi	%f25, %f24
	.word	0xd608a02e	! t0_kref+0x1de8:   	ldub	[%g2 + 0x2e], %o3
	.word	0xe9b81019	! t0_kref+0x1dec:   	stda	%f20, [%g0 + %i1]0x80
	.word	0x96b80015	! t0_kref+0x1df0:   	xnorcc	%g0, %l5, %o3
	.word	0x99a1c9aa	! t0_kref+0x1df4:   	fdivs	%f7, %f10, %f12
	.word	0x24480005	! t0_kref+0x1df8:   	ble,a,pt	%icc, _kref+0x1e0c
	.word	0xb1a01a50	! t0_kref+0x1dfc:   	fdtoi	%f16, %f24
	.word	0xd626201c	! t0_kref+0x1e00:   	st	%o3, [%i0 + 0x1c]
	.word	0xeb68a004	! t0_kref+0x1e04:   	prefetch	%g2 + 4, 21
	.word	0x90f0355b	! t0_kref+0x1e08:   	udivcc	%g0, -0xaa5, %o0
	.word	0xb9a6083d	! t0_kref+0x1e0c:   	fadds	%f24, %f29, %f28
	.word	0xbba018c6	! t0_kref+0x1e10:   	fdtos	%f6, %f29
	.word	0xdd3e2010	! t0_kref+0x1e14:   	std	%f14, [%i0 + 0x10]
	.word	0x91a789bc	! t0_kref+0x1e18:   	fdivs	%f30, %f28, %f8
	sethi	%hi(1f), %o7
	jmpl	%o7+%lo(1f), %g1
	.empty
	.word	0xa12da00b	! t0_kref+0x1e24:   	sll	%l6, 0xb, %l0
1:	.word	0xa5a01911	! t0_kref+0x1e28:   	fitod	%f17, %f18
	.word	0x91a0110e	! t0_kref+0x1e2c:   	fxtod	%f14, %f8
	.word	0xed00a014	! t0_kref+0x1e30:   	ld	[%g2 + 0x14], %f22
	.word	0x86102003	! t0_kref+0x1e34:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x1e38:   	bne,a	_kref+0x1e38
	.word	0x86a0e001	! t0_kref+0x1e3c:   	subcc	%g3, 1, %g3
	.word	0x3b480004	! t0_kref+0x1e40:   	fble,a,pt	%fcc0, _kref+0x1e50
	.word	0xf500a000	! t0_kref+0x1e44:   	ld	[%g2], %f26
	.word	0xa33b201d	! t0_kref+0x1e48:   	sra	%o4, 0x1d, %l1
	.word	0x9da28d2c	! t0_kref+0x1e4c:   	fsmuld	%f10, %f12, %f14
	.word	0xda50a004	! t0_kref+0x1e50:   	ldsh	[%g2 + 4], %o5
	.word	0x80bdb6d5	! t0_kref+0x1e54:   	xnorcc	%l6, -0x92b, %g0
	.word	0xdb070019	! t0_kref+0x1e58:   	ld	[%i4 + %i1], %f13
	.word	0xfd062018	! t0_kref+0x1e5c:   	ld	[%i0 + 0x18], %f30
	.word	0xec48a015	! t0_kref+0x1e60:   	ldsb	[%g2 + 0x15], %l6
	.word	0xac068000	! t0_kref+0x1e64:   	add	%i2, %g0, %l6
	.word	0x95a2084c	! t0_kref+0x1e68:   	faddd	%f8, %f12, %f10
	.word	0xaf35c000	! t0_kref+0x1e6c:   	srl	%l7, %g0, %l7
	.word	0x2b480005	! t0_kref+0x1e70:   	fbug,a,pt	%fcc0, _kref+0x1e84
	.word	0xd13e3ff0	! t0_kref+0x1e74:   	std	%f8, [%i0 - 0x10]
	.word	0xbda00526	! t0_kref+0x1e78:   	fsqrts	%f6, %f30
	.word	0x91a40937	! t0_kref+0x1e7c:   	fmuls	%f16, %f23, %f8
	.word	0x98420015	! t0_kref+0x1e80:   	addc	%o0, %l5, %o4
	.word	0xb5a34d26	! t0_kref+0x1e84:   	fsmuld	%f13, %f6, %f26
	.word	0xd20e4000	! t0_kref+0x1e88:   	ldub	[%i1], %o1
	.word	0xa1a01a38	! t0_kref+0x1e8c:   	fstoi	%f24, %f16
	.word	0xee163fee	! t0_kref+0x1e90:   	lduh	[%i0 - 0x12], %l7
	.word	0x912a0014	! t0_kref+0x1e94:   	sll	%o0, %l4, %o0
	.word	0x933a6007	! t0_kref+0x1e98:   	sra	%o1, 0x7, %o1
	.word	0x9de3bfa0	! t0_kref+0x1e9c:   	save	%sp, -0x60, %sp
	.word	0xa5ee3f52	! t0_kref+0x1ea0:   	restore	%i0, -0xae, %l2
	.word	0x9da01a33	! t0_kref+0x1ea4:   	fstoi	%f19, %f14
	.word	0xc12e001c	! t0_kref+0x1ea8:   	st	%fsr, [%i0 + %i4]
	.word	0xd810a032	! t0_kref+0x1eac:   	lduh	[%g2 + 0x32], %o4
	.word	0xd8ce9040	! t0_kref+0x1eb0:   	ldsba	[%i2]0x82, %o4
	.word	0xe000a020	! t0_kref+0x1eb4:   	ld	[%g2 + 0x20], %l0
	.word	0x9285c009	! t0_kref+0x1eb8:   	addcc	%l7, %o1, %o1
	.word	0x27480005	! t0_kref+0x1ebc:   	fbul,a,pt	%fcc0, _kref+0x1ed0
	.word	0x962a0017	! t0_kref+0x1ec0:   	andn	%o0, %l7, %o3
	.word	0xd7a6501c	! t0_kref+0x1ec4:   	sta	%f11, [%i1 + %i4]0x80
	.word	0xe168a08f	! t0_kref+0x1ec8:   	prefetch	%g2 + 0x8f, 16
	.word	0xe3b8a040	! t0_kref+0x1ecc:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x99a509b6	! t0_kref+0x1ed0:   	fdivs	%f20, %f22, %f12
	.word	0xd2b65000	! t0_kref+0x1ed4:   	stha	%o1, [%i1]0x80
	.word	0x81aa4a39	! t0_kref+0x1ed8:   	fcmps	%fcc0, %f9, %f25
	call	SYM(t0_subr0)
	.word	0xb7a01a3d	! t0_kref+0x1ee0:   	fstoi	%f29, %f27
	call	1f
	.empty
	.word	0x99336004	! t0_kref+0x1ee8:   	srl	%o5, 0x4, %o4
	.word	0x99a0191e	! t0_kref+0x1eec:   	fitod	%f30, %f12
	.word	0xf5ee101a	! t0_kref+0x1ef0:   	prefetcha	%i0 + %i2, 26
	.word	0x949a3c19	! t0_kref+0x1ef4:   	xorcc	%o0, -0x3e7, %o2
1:	.word	0xb1a28848	! t0_kref+0x1ef8:   	faddd	%f10, %f8, %f24
	.word	0xa60b0008	! t0_kref+0x1efc:   	and	%o4, %o0, %l3
	.word	0xe8b6501b	! t0_kref+0x1f00:   	stha	%l4, [%i1 + %i3]0x80
	.word	0x9da4094a	! t0_kref+0x1f04:   	fmuld	%f16, %f10, %f14
	.word	0xa5a0189b	! t0_kref+0x1f08:   	fitos	%f27, %f18
	.word	0xb1a00137	! t0_kref+0x1f0c:   	fabss	%f23, %f24
	.word	0xe3b8a040	! t0_kref+0x1f10:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x36800004	! t0_kref+0x1f14:   	bge,a	_kref+0x1f24
	.word	0x90fa8008	! t0_kref+0x1f18:   	sdivcc	%o2, %o0, %o0
	.word	0x803dc000	! t0_kref+0x1f1c:   	not	%l7, %g0
	call	SYM(t0_subr0)
	.word	0xd686501c	! t0_kref+0x1f24:   	lda	[%i1 + %i4]0x80, %o3
	.word	0x83414000	! t0_kref+0x1f28:   	mov	%pc, %g1
	.word	0x22800001	! t0_kref+0x1f2c:   	be,a	_kref+0x1f30
	.word	0xf520a034	! t0_kref+0x1f30:   	st	%f26, [%g2 + 0x34]
	.word	0x8143c000	! t0_kref+0x1f34:   	stbar
	.word	0x92bafcce	! t0_kref+0x1f38:   	xnorcc	%o3, -0x332, %o1
	.word	0x99a018d4	! t0_kref+0x1f3c:   	fdtos	%f20, %f12
	.word	0xd6270018	! t0_kref+0x1f40:   	st	%o3, [%i4 + %i0]
	.word	0xd240a030	! t0_kref+0x1f44:   	ldsw	[%g2 + 0x30], %o1
	.word	0x800d8009	! t0_kref+0x1f48:   	and	%l6, %o1, %g0
	.word	0x8da48d37	! t0_kref+0x1f4c:   	fsmuld	%f18, %f23, %f6
	.word	0xf7062000	! t0_kref+0x1f50:   	ld	[%i0], %f27
	.word	0x81ddc005	! t0_kref+0x1f54:   	flush	%l7 + %g5
	.word	0x95a00534	! t0_kref+0x1f58:   	fsqrts	%f20, %f10
	.word	0xe828a03e	! t0_kref+0x1f5c:   	stb	%l4, [%g2 + 0x3e]
	call	SYM(t0_subr3)
	.word	0xada0110e	! t0_kref+0x1f64:   	fxtod	%f14, %f22
	.word	0x9eaa4000	! t0_kref+0x1f68:   	andncc	%o1, %g0, %o7
	.word	0x25480002	! t0_kref+0x1f6c:   	fblg,a,pt	%fcc0, _kref+0x1f74
	.word	0xd408a032	! t0_kref+0x1f70:   	ldub	[%g2 + 0x32], %o2
	.word	0x9ba01a2f	! t0_kref+0x1f74:   	fstoi	%f15, %f13
	.word	0xaa56acdd	! t0_kref+0x1f78:   	umul	%i2, 0xcdd, %l5
	.word	0x81ae8ac6	! t0_kref+0x1f7c:   	fcmped	%fcc0, %f26, %f6
	.word	0x32800002	! t0_kref+0x1f80:   	bne,a	_kref+0x1f88
	.word	0xb5a00539	! t0_kref+0x1f84:   	fsqrts	%f25, %f26
	.word	0xda270018	! t0_kref+0x1f88:   	st	%o5, [%i4 + %i0]
	.word	0x9efac014	! t0_kref+0x1f8c:   	sdivcc	%o3, %l4, %o7
	.word	0xa5002f1c	! t0_kref+0x1f90:   	taddcc	%g0, 0xf1c, %l2
	.word	0x35480005	! t0_kref+0x1f94:   	fbue,a,pt	%fcc0, _kref+0x1fa8
	.word	0xaf02ad34	! t0_kref+0x1f98:   	taddcc	%o2, 0xd34, %l7
	.word	0x80b5c008	! t0_kref+0x1f9c:   	orncc	%l7, %o0, %g0
	.word	0xe6780019	! t0_kref+0x1fa0:   	swap	[%g0 + %i1], %l3
	.word	0xa5a40956	! t0_kref+0x1fa4:   	fmuld	%f16, %f22, %f18
	.word	0x81ac4a27	! t0_kref+0x1fa8:   	fcmps	%fcc0, %f17, %f7
	.word	0xbba28837	! t0_kref+0x1fac:   	fadds	%f10, %f23, %f29
	.word	0xe8766008	! t0_kref+0x1fb0:   	stx	%l4, [%i1 + 8]
	.word	0xf13e6000	! t0_kref+0x1fb4:   	std	%f24, [%i1]
	.word	0x94533d5c	! t0_kref+0x1fb8:   	umul	%o4, -0x2a4, %o2
	.word	0xe3b8a040	! t0_kref+0x1fbc:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xa92b4017	! t0_kref+0x1fc0:   	sll	%o5, %l7, %l4
	.word	0x985279e9	! t0_kref+0x1fc4:   	umul	%o1, -0x617, %o4
	.word	0x94e237a4	! t0_kref+0x1fc8:   	subccc	%o0, -0x85c, %o2
	.word	0x9ba00535	! t0_kref+0x1fcc:   	fsqrts	%f21, %f13
	.word	0xda28a02f	! t0_kref+0x1fd0:   	stb	%o5, [%g2 + 0x2f]
	.word	0xd4360000	! t0_kref+0x1fd4:   	sth	%o2, [%i0]
	.word	0x961e8009	! t0_kref+0x1fd8:   	xor	%i2, %o1, %o3
	.word	0x81dbe59b	! t0_kref+0x1fdc:   	flush	%o7 + 0x59b
	.word	0xb9a6482b	! t0_kref+0x1fe0:   	fadds	%f25, %f11, %f28
	.word	0xdd1e7fe0	! t0_kref+0x1fe4:   	ldd	[%i1 - 0x20], %f14
	.word	0x9b35000a	! t0_kref+0x1fe8:   	srl	%l4, %o2, %o5
	.word	0xe8567ff8	! t0_kref+0x1fec:   	ldsh	[%i1 - 8], %l4
	.word	0xae96b8f9	! t0_kref+0x1ff0:   	orcc	%i2, -0x707, %l7
	.word	0x813de014	! t0_kref+0x1ff4:   	sra	%l7, 0x14, %g0
	.word	0xb9a509ce	! t0_kref+0x1ff8:   	fdivd	%f20, %f14, %f28
	.word	0xe26e6011	! t0_kref+0x1ffc:   	ldstub	[%i1 + 0x11], %l1
	.word	0x80326bb7	! t0_kref+0x2000:   	orn	%o1, 0xbb7, %g0
	.word	0xaba348b5	! t0_kref+0x2004:   	fsubs	%f13, %f21, %f21
	.word	0xe13e0000	! t0_kref+0x2008:   	std	%f16, [%i0]
	.word	0xe3f61016	! t0_kref+0x200c:   	casxa	[%i0]0x80, %l6, %l1
	.word	0x81ad8a52	! t0_kref+0x2010:   	fcmpd	%fcc0, %f22, %f18
	.word	0xf1070019	! t0_kref+0x2014:   	ld	[%i4 + %i1], %f24
	.word	0xf900a030	! t0_kref+0x2018:   	ld	[%g2 + 0x30], %f28
	.word	0xa62de10a	! t0_kref+0x201c:   	andn	%l7, 0x10a, %l3
	.word	0xacf2c017	! t0_kref+0x2020:   	udivcc	%o3, %l7, %l6
	.word	0xd8067fe4	! t0_kref+0x2024:   	ld	[%i1 - 0x1c], %o4
	.word	0xae2a37b1	! t0_kref+0x2028:   	andn	%o0, -0x84f, %l7
	.word	0xe2567fe2	! t0_kref+0x202c:   	ldsh	[%i1 - 0x1e], %l1
	.word	0x933de01c	! t0_kref+0x2030:   	sra	%l7, 0x1c, %o1
	call	1f
	.empty
	.word	0xec066000	! t0_kref+0x2038:   	ld	[%i1], %l6
	.word	0x9da2c8af	! t0_kref+0x203c:   	fsubs	%f11, %f15, %f14
	.word	0xb3a4482b	! t0_kref+0x2040:   	fadds	%f17, %f11, %f25
	.word	0xee00a038	! t0_kref+0x2044:   	ld	[%g2 + 0x38], %l7
	.word	0xd8363fe4	! t0_kref+0x2048:   	sth	%o4, [%i0 - 0x1c]
	.word	0x001fffff	! t0_kref+0x204c:   	illtrap	0x1fffff
	.word	0x81ae8ad2	! t0_kref+0x2050:   	fcmped	%fcc0, %f26, %f18
1:	.word	0x81a98a4c	! t0_kref+0x2054:   	fcmpd	%fcc0, %f6, %f12
	.word	0xd06e601e	! t0_kref+0x2058:   	ldstub	[%i1 + 0x1e], %o0
	.word	0x95a38954	! t0_kref+0x205c:   	fmuld	%f14, %f20, %f10
	.word	0xd6de1000	! t0_kref+0x2060:   	ldxa	[%i0]0x80, %o3
	.word	0xee06001c	! t0_kref+0x2064:   	ld	[%i0 + %i4], %l7
	.word	0xe5067fe0	! t0_kref+0x2068:   	ld	[%i1 - 0x20], %f18
	.word	0xb5a489cc	! t0_kref+0x206c:   	fdivd	%f18, %f12, %f26
	.word	0x23480006	! t0_kref+0x2070:   	fbne,a,pt	%fcc0, _kref+0x2088
	.word	0xd2680019	! t0_kref+0x2074:   	ldstub	[%g0 + %i1], %o1
	.word	0x968564c3	! t0_kref+0x2078:   	addcc	%l5, 0x4c3, %o3
	.word	0x9f414000	! t0_kref+0x207c:   	mov	%pc, %o7
	.word	0x80bd000a	! t0_kref+0x2080:   	xnorcc	%l4, %o2, %g0
	.word	0xed9f5018	! t0_kref+0x2084:   	ldda	[%i5 + %i0]0x80, %f22
	.word	0xee48a001	! t0_kref+0x2088:   	ldsb	[%g2 + 1], %l7
	.word	0x8da309c6	! t0_kref+0x208c:   	fdivd	%f12, %f6, %f6
	.word	0x86102004	! t0_kref+0x2090:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x2094:   	bne,a	_kref+0x2094
	.word	0x86a0e001	! t0_kref+0x2098:   	subcc	%g3, 1, %g3
	.word	0x800022a7	! t0_kref+0x209c:   	add	%g0, 0x2a7, %g0
	.word	0x86102002	! t0_kref+0x20a0:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x20a4:   	bne,a	_kref+0x20a4
	.word	0x86a0e001	! t0_kref+0x20a8:   	subcc	%g3, 1, %g3
	.word	0xd5e61009	! t0_kref+0x20ac:   	casa	[%i0]0x80, %o1, %o2
	.word	0x93a01896	! t0_kref+0x20b0:   	fitos	%f22, %f9
	.word	0xec28a018	! t0_kref+0x20b4:   	stb	%l6, [%g2 + 0x18]
	.word	0xd1be1a1b	! t0_kref+0x20b8:   	stda	%f8, [%i0 + %i3]0xd0
	.word	0x3b480003	! t0_kref+0x20bc:   	fble,a,pt	%fcc0, _kref+0x20c8
	.word	0xa075400d	! t0_kref+0x20c0:   	udiv	%l5, %o5, %l0
	.word	0xae2ab896	! t0_kref+0x20c4:   	andn	%o2, -0x76a, %l7
	.word	0xada00526	! t0_kref+0x20c8:   	fsqrts	%f6, %f22
	.word	0xd91fbf98	! t0_kref+0x20cc:   	ldd	[%fp - 0x68], %f12
	.word	0xae2a6170	! t0_kref+0x20d0:   	andn	%o1, 0x170, %l7
	.word	0x80fb250b	! t0_kref+0x20d4:   	sdivcc	%o4, 0x50b, %g0
	.word	0x97a00129	! t0_kref+0x20d8:   	fabss	%f9, %f11
	.word	0xea563ff0	! t0_kref+0x20dc:   	ldsh	[%i0 - 0x10], %l5
	.word	0x81ae0ad0	! t0_kref+0x20e0:   	fcmped	%fcc0, %f24, %f16
	.word	0xe4067fe0	! t0_kref+0x20e4:   	ld	[%i1 - 0x20], %l2
	.word	0xada01a34	! t0_kref+0x20e8:   	fstoi	%f20, %f22
	.word	0x81580000	! t0_kref+0x20ec:   	flushw
	.word	0xfb200018	! t0_kref+0x20f0:   	st	%f29, [%g0 + %i0]
	.word	0xd608a01a	! t0_kref+0x20f4:   	ldub	[%g2 + 0x1a], %o3
	.word	0xa11d22ca	! t0_kref+0x20f8:   	tsubcctv	%l4, 0x2ca, %l0
	.word	0x91400000	! t0_kref+0x20fc:   	mov	%y, %o0
	.word	0xace54000	! t0_kref+0x2100:   	subccc	%l5, %g0, %l6
	.word	0xefa01019	! t0_kref+0x2104:   	sta	%f23, [%g0 + %i1]0x80
	.word	0xe408620c	! t0_kref+0x2108:   	ldub	[%g1 + 0x20c], %l2
	.word	0xa41ca00c	! t0_kref+0x210c:   	xor	%l2, 0xc, %l2
	.word	0xe428620c	! t0_kref+0x2110:   	stb	%l2, [%g1 + 0x20c]
	.word	0x81d8620c	! t0_kref+0x2114:   	flush	%g1 + 0x20c
	.word	0x9302e702	! t0_kref+0x2118:   	taddcc	%o3, 0x702, %o1
	.word	0xe610a000	! t0_kref+0x211c:   	lduh	[%g2], %l3
	.word	0xa8837414	! t0_kref+0x2120:   	addcc	%o5, -0xbec, %l4
	.word	0xf420a028	! t0_kref+0x2124:   	st	%i2, [%g2 + 0x28]
	.word	0xdda61000	! t0_kref+0x2128:   	sta	%f14, [%i0]0x80
	.word	0x9fc10000	! t0_kref+0x212c:   	call	%g4
	.word	0xed1fbf80	! t0_kref+0x2130:   	ldd	[%fp - 0x80], %f22
2:	.word	0xe720a028	! t0_kref+0x2134:   	st	%f19, [%g2 + 0x28]
	.word	0xf1beda58	! t0_kref+0x2138:   	stda	%f24, [%i3 + %i0]0xd2
	.word	0xae1a4016	! t0_kref+0x213c:   	xor	%o1, %l6, %l7
	.word	0xa5a0189c	! t0_kref+0x2140:   	fitos	%f28, %f18
	.word	0xac1b6f29	! t0_kref+0x2144:   	xor	%o5, 0xf29, %l6
	.word	0xa4c2c009	! t0_kref+0x2148:   	addccc	%o3, %o1, %l2
	.word	0x8143c000	! t0_kref+0x214c:   	stbar
	.word	0xedbe101d	! t0_kref+0x2150:   	stda	%f22, [%i0 + %i5]0x80
	.word	0xeb062018	! t0_kref+0x2154:   	ld	[%i0 + 0x18], %f21
	.word	0xb9a7095c	! t0_kref+0x2158:   	fmuld	%f28, %f28, %f28
	.word	0xd810a02c	! t0_kref+0x215c:   	lduh	[%g2 + 0x2c], %o4
	.word	0x81800000	! t0_kref+0x2160:   	mov	%g0, %y
	.word	0x907b62c8	! t0_kref+0x2164:   	sdiv	%o5, 0x2c8, %o0
	.word	0x99a0012a	! t0_kref+0x2168:   	fabss	%f10, %f12
	.word	0x993ae005	! t0_kref+0x216c:   	sra	%o3, 0x5, %o4
	.word	0xa1a0002b	! t0_kref+0x2170:   	fmovs	%f11, %f16
	.word	0x95a409ce	! t0_kref+0x2174:   	fdivd	%f16, %f14, %f10
	.word	0x9ab577e5	! t0_kref+0x2178:   	orncc	%l5, -0x81b, %o5
	.word	0x81d80010	! t0_kref+0x217c:   	flush	%g0 + %l0
	.word	0xd246001c	! t0_kref+0x2180:   	ldsw	[%i0 + %i4], %o1
	.word	0x3f480002	! t0_kref+0x2184:   	fbo,a,pt	%fcc0, _kref+0x218c
	.word	0xa9a78950	! t0_kref+0x2188:   	fmuld	%f30, %f16, %f20
	.word	0xe9f6500a	! t0_kref+0x218c:   	casxa	[%i1]0x80, %o2, %l4
	.word	0xea363fea	! t0_kref+0x2190:   	sth	%l5, [%i0 - 0x16]
	.word	0xb1a58856	! t0_kref+0x2194:   	faddd	%f22, %f22, %f24
	.word	0xe07e0000	! t0_kref+0x2198:   	swap	[%i0], %l0
	.word	0xe448a034	! t0_kref+0x219c:   	ldsb	[%g2 + 0x34], %l2
	.word	0xf11e3fe8	! t0_kref+0x21a0:   	ldd	[%i0 - 0x18], %f24
	.word	0x985ac016	! t0_kref+0x21a4:   	smul	%o3, %l6, %o4
	.word	0x81ae8a4c	! t0_kref+0x21a8:   	fcmpd	%fcc0, %f26, %f12
	.word	0xda0e3fe2	! t0_kref+0x21ac:   	ldub	[%i0 - 0x1e], %o5
	.word	0x2c480007	! t0_kref+0x21b0:   	bneg,a,pt	%icc, _kref+0x21cc
	.word	0xd51fbdb8	! t0_kref+0x21b4:   	ldd	[%fp - 0x248], %f10
	.word	0xda28a015	! t0_kref+0x21b8:   	stb	%o5, [%g2 + 0x15]
	.word	0xa4bac000	! t0_kref+0x21bc:   	xnorcc	%o3, %g0, %l2
	.word	0x81ad8a58	! t0_kref+0x21c0:   	fcmpd	%fcc0, %f22, %f24
	.word	0xe900a03c	! t0_kref+0x21c4:   	ld	[%g2 + 0x3c], %f20
	.word	0x21480006	! t0_kref+0x21c8:   	fbn,a,pt	%fcc0, _kref+0x21e0
	.word	0xe13e6018	! t0_kref+0x21cc:   	std	%f16, [%i1 + 0x18]
	.word	0x9fc70000	! t0_kref+0x21d0:   	call	%i4
	.word	0x81868000	! t0_kref+0x21d4:   	wr	%i2, %g0, %y
	.word	0xa8bb0017	! t0_kref+0x21d8:   	xnorcc	%o4, %l7, %l4
	.word	0x8da3094a	! t0_kref+0x21dc:   	fmuld	%f12, %f10, %f6
	.word	0x99a0013d	! t0_kref+0x21e0:   	fabss	%f29, %f12
	.word	0x81ab0ada	! t0_kref+0x21e4:   	fcmped	%fcc0, %f12, %f26
	.word	0xe06e0000	! t0_kref+0x21e8:   	ldstub	[%i0], %l0
	.word	0xa2034015	! t0_kref+0x21ec:   	add	%o5, %l5, %l1
	.word	0xe408630c	! t0_kref+0x21f0:   	ldub	[%g1 + 0x30c], %l2
	.word	0xa41ca00c	! t0_kref+0x21f4:   	xor	%l2, 0xc, %l2
	.word	0xe428630c	! t0_kref+0x21f8:   	stb	%l2, [%g1 + 0x30c]
	.word	0x81d8630c	! t0_kref+0x21fc:   	flush	%g1 + 0x30c
	.word	0xe656c019	! t0_kref+0x2200:   	ldsh	[%i3 + %i1], %l3
	.word	0xae122475	! t0_kref+0x2204:   	or	%o0, 0x475, %l7
	.word	0xd0366002	! t0_kref+0x2208:   	sth	%o0, [%i1 + 2]
	.word	0xd11fbd48	! t0_kref+0x220c:   	ldd	[%fp - 0x2b8], %f8
	.word	0xf1be1a1a	! t0_kref+0x2210:   	stda	%f24, [%i0 + %i2]0xd0
	.word	0x90fb6438	! t0_kref+0x2214:   	sdivcc	%o5, 0x438, %o0
	.word	0x80e322db	! t0_kref+0x2218:   	subccc	%o4, 0x2db, %g0
	.word	0xda48a000	! t0_kref+0x221c:   	ldsb	[%g2], %o5
	.word	0x81dd0011	! t0_kref+0x2220:   	flush	%l4 + %l1
	.word	0xa9a189de	! t0_kref+0x2224:   	fdivd	%f6, %f30, %f20
	.word	0x34480005	! t0_kref+0x2228:   	bg,a,pt	%icc, _kref+0x223c
	.word	0xd050a03a	! t0_kref+0x222c:   	ldsh	[%g2 + 0x3a], %o0
	.word	0xa67df61a	! t0_kref+0x2230:   	sdiv	%l7, -0x9e6, %l3
2:	.word	0xac758016	! t0_kref+0x2234:   	udiv	%l6, %l6, %l6
	.word	0xee2e3ffa	! t0_kref+0x2238:   	stb	%l7, [%i0 - 6]
	.word	0x86102002	! t0_kref+0x223c:   	mov	0x2, %g3
	.word	0x86a0e001	! t0_kref+0x2240:   	subcc	%g3, 1, %g3
	.word	0x22800002	! t0_kref+0x2244:   	be,a	_kref+0x224c
	.word	0xda7e3ffc	! t0_kref+0x2248:   	swap	[%i0 - 4], %o5
	.word	0x9940c000	! t0_kref+0x224c:   	mov	%asi, %o4
	.word	0x9de3bfa0	! t0_kref+0x2250:   	save	%sp, -0x60, %sp
	.word	0xabee8018	! t0_kref+0x2254:   	restore	%i2, %i0, %l5
	.word	0x96832f26	! t0_kref+0x2258:   	addcc	%o4, 0xf26, %o3
	.word	0xec16201c	! t0_kref+0x225c:   	lduh	[%i0 + 0x1c], %l6
	.word	0xd428a028	! t0_kref+0x2260:   	stb	%o2, [%g2 + 0x28]
	.word	0x81ab8a4e	! t0_kref+0x2264:   	fcmpd	%fcc0, %f14, %f14
	.word	0xe99e5000	! t0_kref+0x2268:   	ldda	[%i1]0x80, %f20
	.word	0xaf2b6000	! t0_kref+0x226c:   	sll	%o5, 0x0, %l7
	.word	0xa6e68016	! t0_kref+0x2270:   	subccc	%i2, %l6, %l3
	.word	0x2f2a9414	! t0_kref+0x2274:   	sethi	%hi(0xaa505000), %l7
	.word	0xa4020017	! t0_kref+0x2278:   	add	%o0, %l7, %l2
	.word	0xf91fbca8	! t0_kref+0x227c:   	ldd	[%fp - 0x358], %f28
	.word	0x8fa01a54	! t0_kref+0x2280:   	fdtoi	%f20, %f7
	.word	0xd4366000	! t0_kref+0x2284:   	sth	%o2, [%i1]
	.word	0xa07e8017	! t0_kref+0x2288:   	sdiv	%i2, %l7, %l0
	.word	0xe2160000	! t0_kref+0x228c:   	lduh	[%i0], %l1
	.word	0x3a800002	! t0_kref+0x2290:   	bcc,a	_kref+0x2298
	.word	0xae658016	! t0_kref+0x2294:   	subc	%l6, %l6, %l7
	.word	0x8143c000	! t0_kref+0x2298:   	stbar
	.word	0x9ba01a27	! t0_kref+0x229c:   	fstoi	%f7, %f13
	.word	0xaf15800b	! t0_kref+0x22a0:   	taddcctv	%l6, %o3, %l7
	.word	0xd2064000	! t0_kref+0x22a4:   	ld	[%i1], %o1
	.word	0xa135400d	! t0_kref+0x22a8:   	srl	%l5, %o5, %l0
	.word	0xd050a006	! t0_kref+0x22ac:   	ldsh	[%g2 + 6], %o0
	.word	0xa7a00529	! t0_kref+0x22b0:   	fsqrts	%f9, %f19
	.word	0xea6e0000	! t0_kref+0x22b4:   	ldstub	[%i0], %l5
	.word	0x95a01030	! t0_kref+0x22b8:   	fstox	%f16, %f10
	.word	0xada64d26	! t0_kref+0x22bc:   	fsmuld	%f25, %f6, %f22
	.word	0x9e3b7982	! t0_kref+0x22c0:   	xnor	%o5, -0x67e, %o7
	.word	0xb9a208d0	! t0_kref+0x22c4:   	fsubd	%f8, %f16, %f28
	.word	0x9fc10000	! t0_kref+0x22c8:   	call	%g4
	.word	0xa6800008	! t0_kref+0x22cc:   	addcc	%g0, %o0, %l3
	.word	0xe2000018	! t0_kref+0x22d0:   	ld	[%g0 + %i0], %l1
	.word	0xb7a0013a	! t0_kref+0x22d4:   	fabss	%f26, %f27
	.word	0xea7e200c	! t0_kref+0x22d8:   	swap	[%i0 + 0xc], %l5
	.word	0xea16201e	! t0_kref+0x22dc:   	lduh	[%i0 + 0x1e], %l5
	.word	0xd66e2013	! t0_kref+0x22e0:   	ldstub	[%i0 + 0x13], %o3
	.word	0xbda70839	! t0_kref+0x22e4:   	fadds	%f28, %f25, %f30
	.word	0xaf400000	! t0_kref+0x22e8:   	mov	%y, %l7
	.word	0x30480007	! t0_kref+0x22ec:   	ba,a,pt	%icc, _kref+0x2308
	.word	0x80ba4017	! t0_kref+0x22f0:   	xnorcc	%o1, %l7, %g0
	.word	0x96aa2457	! t0_kref+0x22f4:   	andncc	%o0, 0x457, %o3
	.word	0xc768a00c	! t0_kref+0x22f8:   	prefetch	%g2 + 0xc, 3
	.word	0xd9be5854	! t0_kref+0x22fc:   	stda	%f12, [%i1 + %l4]0xc2
	.word	0x93a649bd	! t0_kref+0x2300:   	fdivs	%f25, %f29, %f9
	.word	0xdd000019	! t0_kref+0x2304:   	ld	[%g0 + %i1], %f14
	.word	0x95a2884a	! t0_kref+0x2308:   	faddd	%f10, %f10, %f10
	.word	0xe11fbc68	! t0_kref+0x230c:   	ldd	[%fp - 0x398], %f16
	.word	0x810dc014	! t0_kref+0x2310:   	tsubcc	%l7, %l4, %g0
	.word	0xe3b8a040	! t0_kref+0x2314:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xe5b81018	! t0_kref+0x2318:   	stda	%f18, [%g0 + %i0]0x80
	.word	0xa5703056	! t0_kref+0x231c:   	popc	-0xfaa, %l2
	.word	0xa4aa34f9	! t0_kref+0x2320:   	andncc	%o0, -0xb07, %l2
	.word	0x28800007	! t0_kref+0x2324:   	bleu,a	_kref+0x2340
	.word	0xa0600016	! t0_kref+0x2328:   	subc	%g0, %l6, %l0
	.word	0x99a4084c	! t0_kref+0x232c:   	faddd	%f16, %f12, %f12
	.word	0x96fd400b	! t0_kref+0x2330:   	sdivcc	%l5, %o3, %o3
	.word	0xd4160000	! t0_kref+0x2334:   	lduh	[%i0], %o2
	.word	0x9938201b	! t0_kref+0x2338:   	sra	%g0, 0x1b, %o4
	.word	0xaefd0016	! t0_kref+0x233c:   	sdivcc	%l4, %l6, %l7
	.word	0xe2871019	! t0_kref+0x2340:   	lda	[%i4 + %i1]0x80, %l1
	.word	0xc128222c	! t0_kref+0x2344:   	st	%fsr, [%g0 + 0x22c]
	.word	0xda363ffc	! t0_kref+0x2348:   	sth	%o5, [%i0 - 4]
	.word	0xa4bd801a	! t0_kref+0x234c:   	xnorcc	%l6, %i2, %l2
	.word	0xaa0a800a	! t0_kref+0x2350:   	and	%o2, %o2, %l5
	.word	0xed1fbc80	! t0_kref+0x2354:   	ldd	[%fp - 0x380], %f22
	.word	0x1130a117	! t0_kref+0x2358:   	sethi	%hi(0xc2845c00), %o0
	.word	0x8610201c	! t0_kref+0x235c:   	mov	0x1c, %g3
	.word	0x86a0e001	! t0_kref+0x2360:   	subcc	%g3, 1, %g3
	.word	0x22800006	! t0_kref+0x2364:   	be,a	_kref+0x237c
	.word	0x9fa508b2	! t0_kref+0x2368:   	fsubs	%f20, %f18, %f15
	.word	0xada00534	! t0_kref+0x236c:   	fsqrts	%f20, %f22
	.word	0xe81e7ff0	! t0_kref+0x2370:   	ldd	[%i1 - 0x10], %l4
	.word	0x800d7652	! t0_kref+0x2374:   	and	%l5, -0x9ae, %g0
	.word	0xe4df5018	! t0_kref+0x2378:   	ldxa	[%i5 + %i0]0x80, %l2
	.word	0x9de3bfa0	! t0_kref+0x237c:   	save	%sp, -0x60, %sp
	.word	0xba47401a	! t0_kref+0x2380:   	addc	%i5, %i2, %i5
	.word	0xabef401d	! t0_kref+0x2384:   	restore	%i5, %i5, %l5
	.word	0xf93e3fe8	! t0_kref+0x2388:   	std	%f28, [%i0 - 0x18]
	.word	0x2d480005	! t0_kref+0x238c:   	fbg,a,pt	%fcc0, _kref+0x23a0
	.word	0xaa95f991	! t0_kref+0x2390:   	orcc	%l7, -0x66f, %l5
	.word	0x24480008	! t0_kref+0x2394:   	ble,a,pt	%icc, _kref+0x23b4
	.word	0xa1a01895	! t0_kref+0x2398:   	fitos	%f21, %f16
	.word	0xa13a4016	! t0_kref+0x239c:   	sra	%o1, %l6, %l0
	.word	0x80faab05	! t0_kref+0x23a0:   	sdivcc	%o2, 0xb05, %g0
	.word	0xa9a01046	! t0_kref+0x23a4:   	fdtox	%f6, %f20
	.word	0x9138000b	! t0_kref+0x23a8:   	sra	%g0, %o3, %o0
	.word	0xa63ebe34	! t0_kref+0x23ac:   	xnor	%i2, -0x1cc, %l3
	.word	0x35800006	! t0_kref+0x23b0:   	fbue,a	_kref+0x23c8
	.word	0xab418000	! t0_kref+0x23b4:   	mov	%fprs, %l5
	.word	0x3d480001	! t0_kref+0x23b8:   	fbule,a,pt	%fcc0, _kref+0x23bc
	.word	0x913b200b	! t0_kref+0x23bc:   	sra	%o4, 0xb, %o0
	.word	0x81dc4016	! t0_kref+0x23c0:   	flush	%l1 + %l6
	.word	0x25800008	! t0_kref+0x23c4:   	fblg,a	_kref+0x23e4
	.word	0xa7a01a2a	! t0_kref+0x23c8:   	fstoi	%f10, %f19
	.word	0xaba01a3a	! t0_kref+0x23cc:   	fstoi	%f26, %f21
	.word	0x9073001a	! t0_kref+0x23d0:   	udiv	%o4, %i2, %o0
	.word	0xda7f0018	! t0_kref+0x23d4:   	swap	[%i4 + %i0], %o5
	.word	0x91a0110a	! t0_kref+0x23d8:   	fxtod	%f10, %f8
	.word	0xe1f6101a	! t0_kref+0x23dc:   	casxa	[%i0]0x80, %i2, %l0
	.word	0x8da5882e	! t0_kref+0x23e0:   	fadds	%f22, %f14, %f6
	.word	0xb5a01911	! t0_kref+0x23e4:   	fitod	%f17, %f26
	call	SYM(t0_subr3)
	.word	0xb1a6c8a9	! t0_kref+0x23ec:   	fsubs	%f27, %f9, %f24
	.word	0x9a9dabd9	! t0_kref+0x23f0:   	xorcc	%l6, 0xbd9, %o5
	.word	0xd9380018	! t0_kref+0x23f4:   	std	%f12, [%g0 + %i0]
	.word	0x81ac8ac8	! t0_kref+0x23f8:   	fcmped	%fcc0, %f18, %f8
	.word	0xfd00a038	! t0_kref+0x23fc:   	ld	[%g2 + 0x38], %f30
	.word	0x8143c000	! t0_kref+0x2400:   	stbar
	.word	0x80c0000b	! t0_kref+0x2404:   	addccc	%g0, %o3, %g0
	.word	0x9de3bfa0	! t0_kref+0x2408:   	save	%sp, -0x60, %sp
	.word	0xb496a675	! t0_kref+0x240c:   	orcc	%i2, 0x675, %i2
	.word	0x93e8001c	! t0_kref+0x2410:   	restore	%g0, %i4, %o1
	.word	0x81ac8a58	! t0_kref+0x2414:   	fcmpd	%fcc0, %f18, %f24
	.word	0x9fa018cc	! t0_kref+0x2418:   	fdtos	%f12, %f15
	.word	0x29480006	! t0_kref+0x241c:   	fbl,a,pt	%fcc0, _kref+0x2434
	.word	0xa5a54d28	! t0_kref+0x2420:   	fsmuld	%f21, %f8, %f18
	.word	0xeb68a04b	! t0_kref+0x2424:   	prefetch	%g2 + 0x4b, 21
	.word	0xafa00526	! t0_kref+0x2428:   	fsqrts	%f6, %f23
	.word	0xe010a00c	! t0_kref+0x242c:   	lduh	[%g2 + 0xc], %l0
	.word	0x9203778e	! t0_kref+0x2430:   	add	%o5, -0x872, %o1
	.word	0xa5a38948	! t0_kref+0x2434:   	fmuld	%f14, %f8, %f18
	.word	0xc07e4000	! t0_kref+0x2438:   	swap	[%i1], %g0
	.word	0xa723001a	! t0_kref+0x243c:   	mulscc	%o4, %i2, %l3
	.word	0x81db7ae2	! t0_kref+0x2440:   	flush	%o5 - 0x51e
	.word	0xd91fbd90	! t0_kref+0x2444:   	ldd	[%fp - 0x270], %f12
	.word	0xe0063ff0	! t0_kref+0x2448:   	ld	[%i0 - 0x10], %l0
	.word	0x3f800001	! t0_kref+0x244c:   	fbo,a	_kref+0x2450
	.word	0xee6e401a	! t0_kref+0x2450:   	ldstub	[%i1 + %i2], %l7
	.word	0xec6e4000	! t0_kref+0x2454:   	ldstub	[%i1], %l6
	.word	0x9135200a	! t0_kref+0x2458:   	srl	%l4, 0xa, %o0
	.word	0xd416601c	! t0_kref+0x245c:   	lduh	[%i1 + 0x1c], %o2
	.word	0x9a2a3f0f	! t0_kref+0x2460:   	andn	%o0, -0xf1, %o5
	.word	0x93a01a34	! t0_kref+0x2464:   	fstoi	%f20, %f9
	.word	0x20480005	! t0_kref+0x2468:   	bn,a,pt	%icc, _kref+0x247c
	.word	0x8d832da2	! t0_kref+0x246c:   	wr	%o4, 0xda2, %fprs
	.word	0xae15c000	! t0_kref+0x2470:   	or	%l7, %g0, %l7
	.word	0xf007bfe0	! t0_kref+0x2474:   	ld	[%fp - 0x20], %i0
	.word	0x2e800003	! t0_kref+0x2478:   	bvs,a	_kref+0x2484
	.word	0x8143c000	! t0_kref+0x247c:   	stbar
	.word	0x90fa400c	! t0_kref+0x2480:   	sdivcc	%o1, %o4, %o0
	.word	0xd8200018	! t0_kref+0x2484:   	st	%o4, [%g0 + %i0]
	.word	0xd27e7ff4	! t0_kref+0x2488:   	swap	[%i1 - 0xc], %o1
	.word	0xd256c000	! t0_kref+0x248c:   	ldsh	[%i3], %o1
	.word	0xd6260000	! t0_kref+0x2490:   	st	%o3, [%i0]
	.word	0xa53e8016	! t0_kref+0x2494:   	sra	%i2, %l6, %l2
	.word	0xa245e575	! t0_kref+0x2498:   	addc	%l7, 0x575, %l1
	.word	0x9eb37b8c	! t0_kref+0x249c:   	orncc	%o5, -0x474, %o7
	.word	0xb1a01a3a	! t0_kref+0x24a0:   	fstoi	%f26, %f24
	.word	0xec00a00c	! t0_kref+0x24a4:   	ld	[%g2 + 0xc], %l6
	.word	0xee063ffc	! t0_kref+0x24a8:   	ld	[%i0 - 4], %l7
	.word	0xdd1fbdc0	! t0_kref+0x24ac:   	ldd	[%fp - 0x240], %f14
	.word	0x95a248ad	! t0_kref+0x24b0:   	fsubs	%f9, %f13, %f10
	.word	0x9fa5083a	! t0_kref+0x24b4:   	fadds	%f20, %f26, %f15
	.word	0xaf350017	! t0_kref+0x24b8:   	srl	%l4, %l7, %l7
	sethi	%hi(1f), %o7
	jmpl	%o7+%lo(1f), %g1
	.empty
	.word	0xa6fac015	! t0_kref+0x24c4:   	sdivcc	%o3, %l5, %l3
	.word	0xd0be1000	! t0_kref+0x24c8:   	stda	%o0, [%i0]0x80
	.word	0x9ada801a	! t0_kref+0x24cc:   	smulcc	%o2, %i2, %o5
	.word	0xde50a020	! t0_kref+0x24d0:   	ldsh	[%g2 + 0x20], %o7
	.word	0x9132e00e	! t0_kref+0x24d4:   	srl	%o3, 0xe, %o0
1:	.word	0x9da00050	! t0_kref+0x24d8:   	fmovd	%f16, %f14
	.word	0x9fc00004	! t0_kref+0x24dc:   	call	%g0 + %g4
	.word	0xd64e600a	! t0_kref+0x24e0:   	ldsb	[%i1 + 0xa], %o3
	.word	0xee062000	! t0_kref+0x24e4:   	ld	[%i0], %l7
	.word	0x945b298e	! t0_kref+0x24e8:   	smul	%o4, 0x98e, %o2
	.word	0xe26e0000	! t0_kref+0x24ec:   	ldstub	[%i0], %l1
	.word	0x8052bb87	! t0_kref+0x24f0:   	umul	%o2, -0x479, %g0
	.word	0xe13e7ff8	! t0_kref+0x24f4:   	std	%f16, [%i1 - 8]
	.word	0x2e800004	! t0_kref+0x24f8:   	bvs,a	_kref+0x2508
	.word	0x96f30000	! t0_kref+0x24fc:   	udivcc	%o4, %g0, %o3
	.word	0xb5a788c6	! t0_kref+0x2500:   	fsubd	%f30, %f6, %f26
	.word	0xa42d000a	! t0_kref+0x2504:   	andn	%l4, %o2, %l2
	.word	0xd93e7ff0	! t0_kref+0x2508:   	std	%f12, [%i1 - 0x10]
	.word	0x9de3bfa0	! t0_kref+0x250c:   	save	%sp, -0x60, %sp
	.word	0x97ee7993	! t0_kref+0x2510:   	restore	%i1, -0x66d, %o3
	.word	0x913b000d	! t0_kref+0x2514:   	sra	%o4, %o5, %o0
	.word	0x9a3031df	! t0_kref+0x2518:   	orn	%g0, -0xe21, %o5
	.word	0x9fa018da	! t0_kref+0x251c:   	fdtos	%f26, %f15
	.word	0xd86e8019	! t0_kref+0x2520:   	ldstub	[%i2 + %i1], %o4
	.word	0xa45a8009	! t0_kref+0x2524:   	smul	%o2, %o1, %l2
	.word	0x37800007	! t0_kref+0x2528:   	fbge,a	_kref+0x2544
	.word	0xcd06001c	! t0_kref+0x252c:   	ld	[%i0 + %i4], %f6
	.word	0xa1a0191a	! t0_kref+0x2530:   	fitod	%f26, %f16
	.word	0xe3b8a040	! t0_kref+0x2534:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xd6260000	! t0_kref+0x2538:   	st	%o3, [%i0]
	.word	0xb5a01909	! t0_kref+0x253c:   	fitod	%f9, %f26
	.word	0xea7e3ff0	! t0_kref+0x2540:   	swap	[%i0 - 0x10], %l5
	.word	0xc0063ff8	! t0_kref+0x2544:   	ld	[%i0 - 8], %g0
	.word	0xe210a03a	! t0_kref+0x2548:   	lduh	[%g2 + 0x3a], %l1
	.word	0x81ab0a27	! t0_kref+0x254c:   	fcmps	%fcc0, %f12, %f7
	.word	0xad02bc3b	! t0_kref+0x2550:   	taddcc	%o2, -0x3c5, %l6
	.word	0x9de3bfa0	! t0_kref+0x2554:   	save	%sp, -0x60, %sp
	.word	0xb82777cd	! t0_kref+0x2558:   	sub	%i5, -0x833, %i4
	.word	0xa9e8001d	! t0_kref+0x255c:   	restore	%g0, %i5, %l4
	.word	0x81aa8acc	! t0_kref+0x2560:   	fcmped	%fcc0, %f10, %f12
	.word	0x952d201a	! t0_kref+0x2564:   	sll	%l4, 0x1a, %o2
	.word	0x29480008	! t0_kref+0x2568:   	fbl,a,pt	%fcc0, _kref+0x2588
	.word	0x8182c000	! t0_kref+0x256c:   	wr	%o3, %g0, %y
	.word	0xea48a01a	! t0_kref+0x2570:   	ldsb	[%g2 + 0x1a], %l5
	.word	0xe3b8a040	! t0_kref+0x2574:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x81ad8a33	! t0_kref+0x2578:   	fcmps	%fcc0, %f22, %f19
	.word	0xe47f0019	! t0_kref+0x257c:   	swap	[%i4 + %i1], %l2
	.word	0x90a2bc42	! t0_kref+0x2580:   	subcc	%o2, -0x3be, %o0
	.word	0x92fe800b	! t0_kref+0x2584:   	sdivcc	%i2, %o3, %o1
	.word	0xb9a018d6	! t0_kref+0x2588:   	fdtos	%f22, %f28
	.word	0xaf22000c	! t0_kref+0x258c:   	mulscc	%o0, %o4, %l7
	.word	0xd99f5018	! t0_kref+0x2590:   	ldda	[%i5 + %i0]0x80, %f12
	.word	0xdd3e401d	! t0_kref+0x2594:   	std	%f14, [%i1 + %i5]
	.word	0x9b3a2011	! t0_kref+0x2598:   	sra	%o0, 0x11, %o5
	.word	0x86102004	! t0_kref+0x259c:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x25a0:   	bne,a	_kref+0x25a0
	.word	0x86a0e001	! t0_kref+0x25a4:   	subcc	%g3, 1, %g3
	.word	0x903d8017	! t0_kref+0x25a8:   	xnor	%l6, %l7, %o0
	.word	0x9b3a6010	! t0_kref+0x25ac:   	sra	%o1, 0x10, %o5
	.word	0xf11fbf98	! t0_kref+0x25b0:   	ldd	[%fp - 0x68], %f24
	.word	0x92750009	! t0_kref+0x25b4:   	udiv	%l4, %o1, %o1
	.word	0x9605c00d	! t0_kref+0x25b8:   	add	%l7, %o5, %o3
	.word	0x91a00058	! t0_kref+0x25bc:   	fmovd	%f24, %f8
	.word	0xe1060000	! t0_kref+0x25c0:   	ld	[%i0], %f16
	.word	0xf126001c	! t0_kref+0x25c4:   	st	%f24, [%i0 + %i4]
	.word	0x86102003	! t0_kref+0x25c8:   	mov	0x3, %g3
	.word	0x86a0e001	! t0_kref+0x25cc:   	subcc	%g3, 1, %g3
	.word	0x22800009	! t0_kref+0x25d0:   	be,a	_kref+0x25f4
	.word	0xae7b0017	! t0_kref+0x25d4:   	sdiv	%o4, %l7, %l7
	.word	0xec28a000	! t0_kref+0x25d8:   	stb	%l6, [%g2]
	.word	0x8da74d33	! t0_kref+0x25dc:   	fsmuld	%f29, %f19, %f6
	.word	0x8da01a54	! t0_kref+0x25e0:   	fdtoi	%f20, %f6
	.word	0xa8e6b38a	! t0_kref+0x25e4:   	subccc	%i2, -0xc76, %l4
	.word	0xbda18854	! t0_kref+0x25e8:   	faddd	%f6, %f20, %f30
	.word	0xd24e4000	! t0_kref+0x25ec:   	ldsb	[%i1], %o1
	.word	0x94f54008	! t0_kref+0x25f0:   	udivcc	%l5, %o0, %o2
	.word	0xd59e105d	! t0_kref+0x25f4:   	ldda	[%i0 + %i5]0x82, %f10
	.word	0x33800007	! t0_kref+0x25f8:   	fbe,a	_kref+0x2614
	.word	0xaafa800c	! t0_kref+0x25fc:   	sdivcc	%o2, %o4, %l5
	.word	0x94e2000b	! t0_kref+0x2600:   	subccc	%o0, %o3, %o2
	.word	0x2f480008	! t0_kref+0x2604:   	fbu,a,pt	%fcc0, _kref+0x2624
	.word	0xd1beda18	! t0_kref+0x2608:   	stda	%f8, [%i3 + %i0]0xd0
	.word	0xefee501c	! t0_kref+0x260c:   	prefetcha	%i1 + %i4, 23
	.word	0xd056200a	! t0_kref+0x2610:   	ldsh	[%i0 + 0xa], %o0
	.word	0x99a509d8	! t0_kref+0x2614:   	fdivd	%f20, %f24, %f12
	.word	0xd3066008	! t0_kref+0x2618:   	ld	[%i1 + 8], %f9
	.word	0xe06e3fe1	! t0_kref+0x261c:   	ldstub	[%i0 - 0x1f], %l0
	.word	0x8fa4c8bb	! t0_kref+0x2620:   	fsubs	%f19, %f27, %f7
	.word	0x28800007	! t0_kref+0x2624:   	bleu,a	_kref+0x2640
	.word	0xa1a01a28	! t0_kref+0x2628:   	fstoi	%f8, %f16
	.word	0xa3a01a29	! t0_kref+0x262c:   	fstoi	%f9, %f17
	.word	0x81ae0a56	! t0_kref+0x2630:   	fcmpd	%fcc0, %f24, %f22
	.word	0xea162006	! t0_kref+0x2634:   	lduh	[%i0 + 6], %l5
	.word	0x9002a86a	! t0_kref+0x2638:   	add	%o2, 0x86a, %o0
	.word	0xb9a50d31	! t0_kref+0x263c:   	fsmuld	%f20, %f17, %f28
	.word	0xae553235	! t0_kref+0x2640:   	umul	%l4, -0xdcb, %l7
	.word	0x9b32800b	! t0_kref+0x2644:   	srl	%o2, %o3, %o5
	.word	0xa9a38850	! t0_kref+0x2648:   	faddd	%f14, %f16, %f20
	.word	0xb3a0052c	! t0_kref+0x264c:   	fsqrts	%f12, %f25
	.word	0xafa00532	! t0_kref+0x2650:   	fsqrts	%f18, %f23
	call	SYM(t0_subr1)
	.word	0x212b39e9	! t0_kref+0x2658:   	sethi	%hi(0xace7a400), %l0
	.word	0xada58d30	! t0_kref+0x265c:   	fsmuld	%f22, %f16, %f22
	.word	0x9925800b	! t0_kref+0x2660:   	mulscc	%l6, %o3, %o4
	.word	0xa4768014	! t0_kref+0x2664:   	udiv	%i2, %l4, %l2
	.word	0xaa7b6c17	! t0_kref+0x2668:   	sdiv	%o5, 0xc17, %l5
	.word	0x9de3bfa0	! t0_kref+0x266c:   	save	%sp, -0x60, %sp
	.word	0x93e80018	! t0_kref+0x2670:   	restore	%g0, %i0, %o1
	.word	0xac3d800c	! t0_kref+0x2674:   	xnor	%l6, %o4, %l6
	.word	0xeafe101c	! t0_kref+0x2678:   	swapa	[%i0 + %i4]0x80, %l5
	.word	0xe3e61016	! t0_kref+0x267c:   	casa	[%i0]0x80, %l6, %l1
	.word	0xe016c019	! t0_kref+0x2680:   	lduh	[%i3 + %i1], %l0
	.word	0x9686a8b1	! t0_kref+0x2684:   	addcc	%i2, 0x8b1, %o3
	.word	0xa9a0191c	! t0_kref+0x2688:   	fitod	%f28, %f20
	.word	0xa1a7092e	! t0_kref+0x268c:   	fmuls	%f28, %f14, %f16
	.word	0xe67e3ff0	! t0_kref+0x2690:   	swap	[%i0 - 0x10], %l3
	.word	0x98802e5c	! t0_kref+0x2694:   	addcc	%g0, 0xe5c, %o4
	.word	0xa5a0191c	! t0_kref+0x2698:   	fitod	%f28, %f18
	.word	0xf51fbe10	! t0_kref+0x269c:   	ldd	[%fp - 0x1f0], %f26
	.word	0xcf070018	! t0_kref+0x26a0:   	ld	[%i4 + %i0], %f7
	.word	0x31480005	! t0_kref+0x26a4:   	fba,a,pt	%fcc0, _kref+0x26b8
	.word	0x97080009	! t0_kref+0x26a8:   	tsubcc	%g0, %o1, %o3
	.word	0xd6f81018	! t0_kref+0x26ac:   	swapa	[%g0 + %i0]0x80, %o3
	.word	0xa03a7b87	! t0_kref+0x26b0:   	xnor	%o1, -0x479, %l0
	.word	0x8102aa56	! t0_kref+0x26b4:   	taddcc	%o2, 0xa56, %g0
	.word	0x9712400c	! t0_kref+0x26b8:   	taddcctv	%o1, %o4, %o3
	call	SYM(t0_subr3)
	.word	0x81824000	! t0_kref+0x26c0:   	wr	%o1, %g0, %y
	.word	0xa260305d	! t0_kref+0x26c4:   	subc	%g0, -0xfa3, %l1
	.word	0x28800004	! t0_kref+0x26c8:   	bleu,a	_kref+0x26d8
	.word	0xaf400000	! t0_kref+0x26cc:   	mov	%y, %l7
	.word	0xf500a028	! t0_kref+0x26d0:   	ld	[%g2 + 0x28], %f26
	.word	0x921a36be	! t0_kref+0x26d4:   	xor	%o0, -0x942, %o1
	.word	0x13349e5a	! t0_kref+0x26d8:   	sethi	%hi(0xd2796800), %o1
	.word	0x8da018d0	! t0_kref+0x26dc:   	fdtos	%f16, %f6
	.word	0x81af0a5c	! t0_kref+0x26e0:   	fcmpd	%fcc0, %f28, %f28
	.word	0xe4000019	! t0_kref+0x26e4:   	ld	[%g0 + %i1], %l2
	.word	0xe8166010	! t0_kref+0x26e8:   	lduh	[%i1 + 0x10], %l4
	.word	0x2c800003	! t0_kref+0x26ec:   	bneg,a	_kref+0x26f8
	.word	0xb9a78832	! t0_kref+0x26f0:   	fadds	%f30, %f18, %f28
	.word	0xada0013b	! t0_kref+0x26f4:   	fabss	%f27, %f22
	.word	0x9a150014	! t0_kref+0x26f8:   	or	%l4, %l4, %o5
	.word	0xda6e7ff6	! t0_kref+0x26fc:   	ldstub	[%i1 - 0xa], %o5
	.word	0xa4fa4000	! t0_kref+0x2700:   	sdivcc	%o1, %g0, %l2
	.word	0x96436da1	! t0_kref+0x2704:   	addc	%o5, 0xda1, %o3
	.word	0xb9a5cd30	! t0_kref+0x2708:   	fsmuld	%f23, %f16, %f28
	.word	0xa4ad0015	! t0_kref+0x270c:   	andncc	%l4, %l5, %l2
	.word	0xb1a0191c	! t0_kref+0x2710:   	fitod	%f28, %f24
	.word	0xcd1e401d	! t0_kref+0x2714:   	ldd	[%i1 + %i5], %f6
	.word	0xd84e7ffd	! t0_kref+0x2718:   	ldsb	[%i1 - 3], %o4
	.word	0xa1a00126	! t0_kref+0x271c:   	fabss	%f6, %f16
	.word	0xa013400b	! t0_kref+0x2720:   	or	%o5, %o3, %l0
	.word	0xd300a020	! t0_kref+0x2724:   	ld	[%g2 + 0x20], %f9
	.word	0xd820a020	! t0_kref+0x2728:   	st	%o4, [%g2 + 0x20]
	.word	0xed3e0000	! t0_kref+0x272c:   	std	%f22, [%i0]
	.word	0xbda00046	! t0_kref+0x2730:   	fmovd	%f6, %f30
	.word	0xe408a002	! t0_kref+0x2734:   	ldub	[%g2 + 2], %l2
	.word	0x9002000d	! t0_kref+0x2738:   	add	%o0, %o5, %o0
	.word	0xa0c5efb9	! t0_kref+0x273c:   	addccc	%l7, 0xfb9, %l0
	.word	0xac32800a	! t0_kref+0x2740:   	orn	%o2, %o2, %l6
	call	SYM(_kaos_done)
	.word	0x01000000	! t0_kref+0x2748:   	nop
	KGLOBAL(t0_ktbl_end)
t0_ktbl_end:
t0_ktbl_page_end:

KTEXT_MODULE(t0_module_subr0, 0x57dc0000)
.seg "text"
t0_subr0_page_begin:
	.skip 8184
.global _t0_subr0; ENTRY(t0_subr0)
	.word	0xa6844012	! t0_subr0+0x0:   	addcc	%l1, %l2, %l3
	.word	0x81c3e008	! t0_subr0+0x4:   	retl
	.word	0xaa64c014	! t0_subr0+0x8:   	subc	%l3, %l4, %l5
t0_subr0_page_end:

KTEXT_MODULE(t0_module_subr1, 0x57dc6000)
.seg "text"
t0_subr1_page_begin:
	.skip 8188
.global _t0_subr1; ENTRY(t0_subr1)
	.word	0x9de3bfa0	! t0_subr1+0x0:   	save	%sp, -0x60, %sp
	.word	0xb29eaa5a	! t0_subr1+0x4:   	xorcc	%i2, 0xa5a, %i1
	.word	0x81c7e008	! t0_subr1+0x8:   	ret
	.word	0xa7ee6001	! t0_subr1+0xc:   	restore	%i1, 1, %l3
t0_subr1_page_end:

KTEXT_MODULE(t0_module_subr2, 0x580a2000)
.seg "text"
t0_subr2_page_begin:
	.skip 8192
.global _t0_subr2; ENTRY(t0_subr2)
	.word	0x9de3bfa0	! t0_subr2+0x0:   	save	%sp, -0x60, %sp
	.word	0xb2066001	! t0_subr2+0x4:   	add	%i1, 1, %i1
	.word	0x81c7e008	! t0_subr2+0x8:   	ret
	.word	0xa3ee6001	! t0_subr2+0xc:   	restore	%i1, 1, %l1
t0_subr2_page_end:

KTEXT_MODULE(t0_module_subr3, 0x73170000)
.seg "text"
t0_subr3_page_begin:
	.skip 8140
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
!  Total operations: 2389  
!
!  Operation frequencies
!
!  name               exp    obs
!  ldsb              0.76   0.59
!  ldub              0.59   0.92
!  ldsh              1.29   1.26
!  lduh              1.16   1.26
!  ld                1.20   1.30
!  ldd               0.34   0.33
!  swap              1.27   1.21
!  ldstub            1.47   1.26
!  stb               0.64   0.50
!  sth               0.76   0.88
!  st                0.73   0.96
!  std               0.13   0.08
!  add               0.94   1.26
!  addcc             0.90   1.09
!  addx              1.09   0.92
!  addxcc            1.42   1.09
!  taddcc            0.29   0.50
!  taddcctv          0.28   0.13
!  sub               0.09   0.04
!  subcc             0.33   0.29
!  subx              0.46   0.59
!  subxcc            0.76   0.59
!  tsubcc            0.23   0.25
!  tsubcctv          0.19   0.33
!  mulscc            0.40   0.63
!  and               0.70   0.84
!  andcc             0.12   0.04
!  andn              1.08   1.26
!  andncc            0.50   0.67
!  or                0.47   0.80
!  orcc              0.29   0.33
!  orn               0.78   0.67
!  orncc             0.19   0.17
!  xor               1.43   1.47
!  xorcc             0.29   0.29
!  xnor              1.15   1.17
!  xnorcc            1.00   1.26
!  sll               1.07   1.00
!  srl               0.96   1.17
!  sra               1.27   1.42
!  unimp             0.22   0.21
!  umul              0.51   0.59
!  smul              0.60   0.59
!  udiv              0.88   1.17
!  sdiv              1.00   1.13
!  umulcc            0.04   0.00
!  smulcc            0.85   0.71
!  udivcc            0.56   0.80
!  sdivcc            1.45   2.05
!  rdy               0.30   0.54
!  wry               0.96   0.92
!  bicc              2.90   2.43
!  sethi             1.11   1.13
!  jmpl              1.48   1.38
!  call              1.28   0.96
!  ticc              0.00   0.00
!  flush             1.05   1.17
!  save              1.41   1.00
!  restore           0.41   0.00
!  stbar             0.64   0.63
!  ldf               1.22   1.26
!  lddf              1.13   1.30
!  stf               0.11   0.25
!  stdf              1.34   1.55
!  fadds             1.11   1.38
!  fsubs             1.37   1.97
!  fmuls             0.35   0.42
!  fdivs             0.28   0.38
!  faddd             1.30   1.34
!  fsubd             0.42   0.46
!  fmuld             0.98   0.96
!  fdivd             0.88   0.92
!  faddq             0.00   0.00
!  fsubq             0.00   0.00
!  fmulq             0.00   0.00
!  fdivq             0.00   0.00
!  fsmuld            0.84   1.05
!  fdmulq            0.00   0.00
!  fitos             1.02   0.88
!  fitod             0.92   0.96
!  fitoq             0.00   0.00
!  fstoi             1.31   1.76
!  fstod             0.15   0.13
!  fstoq             0.00   0.00
!  fdtoi             0.34   0.42
!  fdtos             1.03   1.21
!  fdtoq             0.00   0.00
!  fqtoi             0.00   0.00
!  fqtos             0.00   0.00
!  fqtod             0.00   0.00
!  fmovs             1.10   0.84
!  fnegs             0.20   0.13
!  fabss             0.64   0.84
!  fsqrts            1.85   2.01
!  fsqrtd            0.00   0.00
!  fsqrtq            0.00   0.00
!  fcmps             0.50   0.67
!  fcmpd             1.03   0.67
!  fcmpq             0.00   0.00
!  fcmpes            0.05   0.08
!  fcmped            1.08   0.71
!  fcmpeq            0.00   0.00
!  fbfcc             0.91   0.84
!  ldfsr             0.20   0.00
!  stfsr             0.29   0.21
!  loop              1.31   1.09
!  offset            0.15   0.00
!  area              0.21   0.21
!  target            0.09   0.04
!  goto              0.27   0.38
!  sigsegv           0.27   0.33
!  sigbus            0.02   0.00
!  imodify           0.59   0.42
!  ldfsr_offset      0.27   0.00
!  fpattern          0.79   1.55
!  lbranch           0.02   0.00
!  shmld             5.27   5.32
!  shmst             2.59   2.01
!  shmpf             0.80   0.80
!  shmswap           0.01   0.04
!  shmblkld          0.91   0.00
!  shmblkst          1.00   0.75
!  shmblkchk         0.25   0.21
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
!  casa              0.16   0.13
!  rdasi             0.10   0.21
!  wrasi             0.05   0.04
!  bpcc              1.70   1.13
!  fbpfcc            3.00   2.43
!  fmovscc           0.12   0.00
!  fmovdcc           0.23   0.29
!  fmovqcc           0.00   0.00
!  movcc             0.06   0.08
!  flushw            0.14   0.17
!  membar            0.11   0.08
!  prefetch          0.13   0.04
!  rdpc              0.17   0.33
!  ldqf              0.00   0.00
!  stqf              0.00   0.00
!  ldfa              0.21   0.13
!  lddfa             0.18   0.17
!  ldqfa             0.00   0.00
!  ldsba             0.25   0.25
!  ldsha             0.01   0.04
!  lduba             0.03   0.00
!  lduha             0.04   0.04
!  lda               0.26   0.33
!  ldda              0.10   0.17
!  ldstuba           0.23   0.25
!  prefetcha         0.37   0.50
!  stfa              0.21   0.17
!  stdfa             0.23   0.33
!  stqfa             0.00   0.00
!  stba              0.17   0.13
!  stha              0.23   0.21
!  sta               0.14   0.25
!  stda              0.18   0.17
!  swapa             0.16   0.29
!  fmovd             0.24   0.21
!  fnegd             0.27   0.21
!  fabsd             0.06   0.04
!  fstox             0.16   0.21
!  fdtox             0.10   0.13
!  fxtos             0.28   0.17
!  fxtod             0.28   0.46
!  lds               0.13   0.17
!  ldsa              0.19   0.13
!  ldx               0.12   0.04
!  ldxa              0.29   0.21
!  nofault           0.22   0.33
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
!  partial_st8       0.19   0.04
!  partial_st16      0.14   0.17
!  partial_st32      0.13   0.08
!  short_st8         0.24   0.25
!  short_st16        0.18   0.29
!  short_ld8         0.22   0.33
!  short_ld16        0.05   0.00
!  blkld             0.01   0.00
!  blkst             0.23   0.00
!  blkld_offset      0.04   0.00
!  blkst_offset      0.18   0.00
!  blk_check         0.19   0.00
!  casxa             0.27   0.29
!  rdccr             0.00   0.00
!  rdfprs            0.16   0.13
!  wrccr             0.21   0.04
!  popc              0.25   0.17
!  wrfprs            0.25   0.17
!  stx               0.20   0.33
!  stxa              0.11   0.08
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
KDATA_MODULE(t0_module_offset_table, 0x4f32c000)
.seg "data"
t0_offset_table_start:
t0_offset_table_size:	.word	0x00000008
t0_offset_table:
	.word	0xfffffff0
	.word	0xfffffff8
	.word	0x00000008
	.word	0x00000000
	.word	0x00000018
	.word	0xffffffe0
	.word	0xffffffe8
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

KDATA_MODULE(t0_module_data_in_regs, 0x1f7e2000)
.seg "data"
KGLOBAL(t0_data_in_regs)
t0_data_in_regs_start:
t0_data_in_regs:
	.word	0xd49a486e          ! %f0
	.word	0xd4522729          ! %f1
	.word	0x13466c69          ! %f2
	.word	0xb02c71ef          ! %f3
	.word	0xcb3218c6          ! %f4
	.word	0x26836df9          ! %f5
	.word	0x63688b35          ! %f6
	.word	0xc6e6f1aa          ! %f7
	.word	0xe61a1f4c          ! %f8
	.word	0xcf393117          ! %f9
	.word	0x6c46e50e          ! %f10
	.word	0x54935608          ! %f11
	.word	0x3743cf41          ! %f12
	.word	0x9633b4d1          ! %f13
	.word	0x10b5d388          ! %f14
	.word	0xf6de237b          ! %f15
	.word	0xfd3f3994          ! %f16
	.word	0xdfc33add          ! %f17
	.word	0x3bf90bf5          ! %f18
	.word	0xdf40f589          ! %f19
	.word	0xbdd67450          ! %f20
	.word	0x96d546c1          ! %f21
	.word	0x390b95fa          ! %f22
	.word	0x4c9f73d0          ! %f23
	.word	0x69b38555          ! %f24
	.word	0xe1674475          ! %f25
	.word	0x6058175e          ! %f26
	.word	0xd6501349          ! %f27
	.word	0x4f6dc44a          ! %f28
	.word	0x882a7546          ! %f29
	.word	0x99898925          ! %f30
	.word	0x7b1927d0          ! %f31
	.word	0x78b6e7d1          ! %f32
	.word	0x607f46fc          ! %f33
	.word	0xd909a9dd          ! %f34
	.word	0xe82f09e3          ! %f35
	.word	0x032f31fd          ! %f36
	.word	0x51ac793e          ! %f37
	.word	0x1443c137          ! %f38
	.word	0x19c854a9          ! %f39
	.word	0x52eb7000          ! %f40
	.word	0x0d98b535          ! %f41
	.word	0xaa1788d8          ! %f42
	.word	0x8ca98036          ! %f43
	.word	0xc62ec128          ! %f44
	.word	0x80937b70          ! %f45
	.word	0x87514e71          ! %f46
	.word	0x76595c0d          ! %f47
	.word	0x3385590c          ! %f48
	.word	0xad248c07          ! %f49
	.word	0x4eb9a30c          ! %f50
	.word	0x64c42de6          ! %f51
	.word	0xc48cb102          ! %f52
	.word	0xdea72d02          ! %f53
	.word	0x02a02ba9          ! %f54
	.word	0xc62b78b0          ! %f55
	.word	0x3388dcd3          ! %f56
	.word	0x39e8f2fb          ! %f57
	.word	0x6fea6709          ! %f58
	.word	0xfb9cafd8          ! %f59
	.word	0x87adf6b1          ! %f60
	.word	0xfc59f001          ! %f61
	.word	0x51e87cc8          ! %f62
	.word	0x0b095acb          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0x59c       ! %g1 (code pointer)
	.word	t0_data_in_shm_area ! %g2 (shared area pointer)
	.word	0x77799b43          ! %g3 (loop index)
	.word	SYM(t0_subr2)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0x5d513493          ! %o0
	.word	0xff2297a5          ! %o1
	.word	0xbfc05cbd          ! %o2
	.word	0xa0a58979          ! %o3
	.word	0xd8c474fa          ! %o4
	.word	0x59b889e9          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0xceffd668          ! %l0
	.word	0x9ad66cbf          ! %l1
	.word	0x8fbf69b1          ! %l2
	.word	0xdebf6cba          ! %l3
	.word	0x241987d4          ! %l4
	.word	0x36f08fdd          ! %l5
	.word	0x61591d4d          ! %l6
	.word	0x56a8d49c          ! %l7
	.word	t0_data_in_area0    ! %i0 (area pointer)
	.word	t0_data_in_area0    ! %i1 (area pointer)
	.word	0x0000001c          ! %i2 (byte offset)
	.word	0xfffffff0          ! %i3 (halfword offset)
	.word	0xfffffffc          ! %i4 (word offset)
	.word	0xfffffff8          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0x7cd77ec9          ! %y
	.word	0x00000004          ! %icc (nzvc)
	.word	0x40000202          ! %fsr
	.word	0x00000000          ! %gsr.mask
	.word	0x00000000          ! %gsr
	.word	0x00000080          ! %asi
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

KDATA_MODULE(t0_module_data_in_stack, 0x0c408000)
.seg "data"
KGLOBAL(t0_data_in_mtbl_size)
KGLOBAL(t0_data_in_mtbl)
KGLOBAL(t0_data_in_stack)
t0_data_in_stack_start:
	.word	0xadbaa04f
	.word	0x84f8eb70
	.word	0x78e44a5b
	.word	0xc7399779
	.word	0x3522724e
	.word	0x828584ba
	.word	0x124c8af4
	.word	0xc355995b
	.word	0xe5906461
	.word	0x62ffb84a
	.word	0x930c402b
	.word	0x9586b06f
	.word	0xa8978c24
	.word	0x33175d17
	.word	0x4a0ec85f
	.word	0x48db30c5
	.word	0x69fcde79
	.word	0x5a5b2bc8
	.word	0x9be4f37c
	.word	0x71b4e23d
	.word	0xea0852e0
	.word	0x76f24179
	.word	0xc0edc86c
	.word	0x657b4ae1
	.word	0xef74680b
	.word	0x62248abe
	.word	0x6341adce
	.word	0x5c3dbb8f
	.word	0x0ff8ddb1
	.word	0x5dd05ae7
	.word	0x0a5ae9e5
	.word	0x375702db
	.word	0xf8e6b7a2
	.word	0x580bb385
	.word	0x32b1add2
	.word	0x2cdeea33
	.word	0xfa18de1b
	.word	0xe914002d
	.word	0xe0312005
	.word	0x85d3e143
	.word	0x25ddef5b
	.word	0x88974a7b
	.word	0x7ece19f1
	.word	0xa6a97b99
	.word	0x05b51675
	.word	0x0e8e2a59
	.word	0x03df8cfe
	.word	0x558ea48c
	.word	0x2700fb68
	.word	0x098df681
	.word	0xb863c2c4
	.word	0x5988ad5a
	.word	0x6971206c
	.word	0xaceef93f
	.word	0x8f5cec75
	.word	0x3fae9990
	.word	0x6413408e
	.word	0xfc9aad7b
	.word	0xcf22b599
	.word	0x12a24dae
	.word	0x9b03837e
	.word	0x971247f6
	.word	0x782dce01
	.word	0xc21b840a
	.word	0xe7cb9aa7
	.word	0xc07e10d4
	.word	0xc2bd9ef5
	.word	0xa732abf4
	.word	0xfeee1b80
	.word	0x8f9a5159
	.word	0x46079faf
	.word	0x2c58171a
	.word	0x971cab21
	.word	0xcf5ed9f7
	.word	0x92a2fd0d
	.word	0xf7c6192e
	.word	0x676ccf19
	.word	0x0a8a6488
	.word	0xe5da8881
	.word	0xc302fdc5
	.word	0x12c8777e
	.word	0x890b56d7
	.word	0xf7ba224b
	.word	0x23f1f882
	.word	0x95149644
	.word	0xced3a964
	.word	0x114c12ea
	.word	0x32407373
	.word	0xe35957d2
	.word	0x703df668
	.word	0x96ce07cf
	.word	0x08ef5fba
	.word	0x00dcd0d2
	.word	0x1e05f516
	.word	0xf9eca754
	.word	0x6d8e6c6f
	.word	0xb8da3548
	.word	0x7236e523
	.word	0xc58fefeb
	.word	0x4fb947c5
	.word	0xb48cece6
	.word	0xdc96ae88
	.word	0xc6b1d69a
	.word	0xa9c54e6b
	.word	0x98e8189d
	.word	0xa83cb986
	.word	0x8f5bd8a6
	.word	0x81904d34
	.word	0xdbc85d77
	.word	0x516fc2ea
	.word	0xf97f748e
	.word	0x344738f9
	.word	0xcef708a3
	.word	0xa2d63092
	.word	0x6228be3a
	.word	0xd40600bd
	.word	0x0532e0d1
	.word	0x77b8aa2f
	.word	0x01c98274
	.word	0x889fde13
	.word	0x53e438c0
	.word	0xb6cefa4b
	.word	0xaf4ead97
	.word	0x9ff1c7bc
	.word	0xc0671714
	.word	0x8a0b7b8d
	.word	0x1898e985
	.word	0x2c16ea93
	.word	0x2b2f876c
	.word	0xf459963c
	.word	0xd70ca6de
	.word	0xc0f14cad
	.word	0x62b968b4
	.word	0x62881201
	.word	0x017d056e
	.word	0x84f6febc
	.word	0xe5764cb7
	.word	0x68e03ff0
	.word	0xe8f84fe6
	.word	0x6d567fb3
	.word	0x42013cf7
	.word	0x877740c9
	.word	0x7333fece
	.word	0x198b36af
	.word	0x110978c0
	.word	0x0c56eb7a
	.word	0x1ec176ba
	.word	0x70a52715
	.word	0xa1e2807a
	.word	0x407017e8
	.word	0xba13f5bb
	.word	0x611542f7
	.word	0xe2b9023f
	.word	0x432051ee
	.word	0x79f36418
	.word	0x1501ffbb
	.word	0xe5517bad
	.word	0xdc3138a5
	.word	0x9d7efc3e
	.word	0x973e10fe
	.word	0xca2ea4fc
	.word	0x2dd80de5
	.word	0x989dfdf4
	.word	0x72356db5
	.word	0x534af952
	.word	0x63a03a0c
	.word	0xb0ebe0d2
	.word	0xd0c30395
t0_data_in_sp:
	.word	0xf671f055
	.word	0x1893c7fd
	.word	0xa810b9f3
	.word	0x4b23bcb4
	.word	0xe2fabd02
	.word	0x52a11d6b
	.word	0x004dc8e9
	.word	0xe661bb70
	.word	t0_data_in_area0
	.word	t0_data_in_area0
	.word	0x0000001f
	.word	0x00000016
	.word	0xfffffffc
	.word	0x00000010
	.word	t0_data_in_fp
	.word	0x93b7d2d6
	.word	0x76e49b67
	.word	0xa9446fa8
	.word	0x529e6737
	.word	0xa6689a18
	.word	0xd4389c7b
	.word	0x84a625c0
	.word	0xb311f803
	.word	0xe7a5cda5
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
	.word   	0x76c03b25	! [%fp - 0xc]
	.word   	0x3a70d637	! [%fp - 0x8]
	.word   	0x0e1ab5df	! [%fp - 0x4]
.global t0_data_in_fp; t0_data_in_fp:
	.word	0xa304b9e8
	.word	0x145e6356
	.word	0xac9e81e5
	.word	0x22665d29
	.word	0x1675a8f1
	.word	0xd680916f
	.word	0x4cfb9c7f
	.word	0xded44061
	.word	0x0e0eb076
	.word	0x484021f6
	.word	0x00e1b43f
	.word	0xcebc00ff
	.word	0xc3a6dc1a
	.word	0xe21c6886
	.word	0x91026fc4
	.word	0xd9a68180
	.word	0x2c8337f1
	.word	0xbdcac207
	.word	0x094a0636
	.word	0x87db64c1
	.word	0x836b7f43
	.word	0x0ab9161f
	.word	0x83ae95ad
	.word	0x0076ae91
t0_data_in_stacktop:
	.word	0
t0_data_in_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_in_area0, 0x316d6000)
.seg "data"
t0_data_in_area0_start:
.skip 3264
t0_data_in_area0_begin:
	.word	0x46947390	! t0_data_in_area0-0x20
	.word	0x64b27be8	! t0_data_in_area0-0x1c
	.word	0xe633fbd3	! t0_data_in_area0-0x18
	.word	0x54df5980	! t0_data_in_area0-0x14
	.word	0xdb2a1fd4	! t0_data_in_area0-0x10
	.word	0xa8dcf5e3	! t0_data_in_area0-0xc
	.word	0x66c214c7	! t0_data_in_area0-0x8
	.word	0xd1b0f5fd	! t0_data_in_area0-0x4
.global t0_data_in_area0; t0_data_in_area0:
	.word	0xe4248c0c	! t0_data_in_area0+0x0
	.word	0xfd42792b	! t0_data_in_area0+0x4
	.word	0x98e58444	! t0_data_in_area0+0x8
	.word	0xb3b7a69f	! t0_data_in_area0+0xc
	.word	0x2bb5a4f8	! t0_data_in_area0+0x10
	.word	0x9386b3ed	! t0_data_in_area0+0x14
	.word	0x30716d02	! t0_data_in_area0+0x18
	.word	0x19bf0dc2	! t0_data_in_area0+0x1c
t0_data_in_area0_end:
.skip 4864
t0_data_in_area0_stop:

KDATA_MODULE(t0_module_data_in_shm_area, 0x19446000)
.seg "data"
t0_data_in_shm_area_start:
t0_data_in_shm_area_begin:
.global t0_data_in_shm_area; t0_data_in_shm_area:
	.word	0xde475c21	! t0_data_in_shm_area+0x0 (t0)
	.word	0x138e4717	! t0_data_in_shm_area+0x4 (t0)
	.word	0xf27aba5b	! t0_data_in_shm_area+0x8 (t0)
	.word	0x7eea0056	! t0_data_in_shm_area+0xc (t0)
	.word	0x1fed441d	! t0_data_in_shm_area+0x10 (t0)
	.word	0x55f3674f	! t0_data_in_shm_area+0x14 (t0)
	.word	0xda8be032	! t0_data_in_shm_area+0x18 (t0)
	.word	0xae5211f3	! t0_data_in_shm_area+0x1c (t0)
	.word	0x999d2d11	! t0_data_in_shm_area+0x20 (t0)
	.word	0x236f1926	! t0_data_in_shm_area+0x24 (t0)
	.word	0xbe7a3510	! t0_data_in_shm_area+0x28 (t0)
	.word	0x850b4e2f	! t0_data_in_shm_area+0x2c (t0)
	.word	0x1eb68576	! t0_data_in_shm_area+0x30 (t0)
	.word	0x7d1d7c8d	! t0_data_in_shm_area+0x34 (t0)
	.word	0x96344a8f	! t0_data_in_shm_area+0x38 (t0)
	.word	0x1c99b334	! t0_data_in_shm_area+0x3c (t0)
	.word	0xa5988320	! t0_data_in_shm_area+0x40 (t0 bload)
	.word	0xa4f6db87	! t0_data_in_shm_area+0x44
	.word	0x8072e7fb	! t0_data_in_shm_area+0x48
	.word	0x12ab418c	! t0_data_in_shm_area+0x4c
	.word	0x6b83587c	! t0_data_in_shm_area+0x50
	.word	0xcd3e7020	! t0_data_in_shm_area+0x54
	.word	0x0fac8b35	! t0_data_in_shm_area+0x58
	.word	0x9cc2b53e	! t0_data_in_shm_area+0x5c
	.word	0xad00fa19	! t0_data_in_shm_area+0x60
	.word	0x4c43159d	! t0_data_in_shm_area+0x64
	.word	0xe64593da	! t0_data_in_shm_area+0x68
	.word	0x4cac3c1f	! t0_data_in_shm_area+0x6c
	.word	0x14d63869	! t0_data_in_shm_area+0x70
	.word	0x2edd58f4	! t0_data_in_shm_area+0x74
	.word	0x1bf57ca5	! t0_data_in_shm_area+0x78
	.word	0xce56bd61	! t0_data_in_shm_area+0x7c
	.word	0x1c4531c7	! t0_data_in_shm_area+0x80 (t0 bstore)
	.word	0x7ad99c7e	! t0_data_in_shm_area+0x84
	.word	0xe2fbc711	! t0_data_in_shm_area+0x88
	.word	0x3e41866f	! t0_data_in_shm_area+0x8c
	.word	0x8c7660bb	! t0_data_in_shm_area+0x90
	.word	0xca3442ea	! t0_data_in_shm_area+0x94
	.word	0xe0457d42	! t0_data_in_shm_area+0x98
	.word	0xda5770fd	! t0_data_in_shm_area+0x9c
	.word	0x226dca7d	! t0_data_in_shm_area+0xa0
	.word	0xbbf91574	! t0_data_in_shm_area+0xa4
	.word	0x404e6e25	! t0_data_in_shm_area+0xa8
	.word	0xeb0dd65a	! t0_data_in_shm_area+0xac
	.word	0xc94611b7	! t0_data_in_shm_area+0xb0
	.word	0x16f65957	! t0_data_in_shm_area+0xb4
	.word	0xc19787d5	! t0_data_in_shm_area+0xb8
	.word	0x992ee408	! t0_data_in_shm_area+0xbc
t0_data_in_shm_area_end:
t0_data_in_shm_area_stop:

KDATA_MODULE(t0_module_data_exp_regs, 0x155ca000)
.seg "data"
KGLOBAL(t0_data_exp_regs)
t0_data_exp_regs_start:
t0_data_exp_regs:
	.word	0xd49a486e          ! %f0
	.word	0xd4522729          ! %f1
	.word	0x13466c69          ! %f2
	.word	0xb02c71ef          ! %f3
	.word	0xcb3218c6          ! %f4
	.word	0x26836df9          ! %f5
	.word	0x63688b35          ! %f6
	.word	0xc6e6f1aa          ! %f7
	.word	0xe61a1f4c          ! %f8
	.word	0xcf393117          ! %f9
	.word	0x6c46e50e          ! %f10
	.word	0x54935608          ! %f11
	.word	0x3743cf41          ! %f12
	.word	0x9633b4d1          ! %f13
	.word	0x10b5d388          ! %f14
	.word	0xf6de237b          ! %f15
	.word	0xfd3f3994          ! %f16
	.word	0xdfc33add          ! %f17
	.word	0x3bf90bf5          ! %f18
	.word	0xdf40f589          ! %f19
	.word	0xbdd67450          ! %f20
	.word	0x96d546c1          ! %f21
	.word	0x390b95fa          ! %f22
	.word	0x4c9f73d0          ! %f23
	.word	0x69b38555          ! %f24
	.word	0xe1674475          ! %f25
	.word	0x6058175e          ! %f26
	.word	0xd6501349          ! %f27
	.word	0x4f6dc44a          ! %f28
	.word	0x882a7546          ! %f29
	.word	0x99898925          ! %f30
	.word	0x7b1927d0          ! %f31
	.word	0x78b6e7d1          ! %f32
	.word	0x607f46fc          ! %f33
	.word	0xd909a9dd          ! %f34
	.word	0xe82f09e3          ! %f35
	.word	0x032f31fd          ! %f36
	.word	0x51ac793e          ! %f37
	.word	0x1443c137          ! %f38
	.word	0x19c854a9          ! %f39
	.word	0x52eb7000          ! %f40
	.word	0x0d98b535          ! %f41
	.word	0xaa1788d8          ! %f42
	.word	0x8ca98036          ! %f43
	.word	0xc62ec128          ! %f44
	.word	0x80937b70          ! %f45
	.word	0x87514e71          ! %f46
	.word	0x76595c0d          ! %f47
	.word	0x3385590c          ! %f48
	.word	0xad248c07          ! %f49
	.word	0x4eb9a30c          ! %f50
	.word	0x64c42de6          ! %f51
	.word	0xc48cb102          ! %f52
	.word	0xdea72d02          ! %f53
	.word	0x02a02ba9          ! %f54
	.word	0xc62b78b0          ! %f55
	.word	0x3388dcd3          ! %f56
	.word	0x39e8f2fb          ! %f57
	.word	0x6fea6709          ! %f58
	.word	0xfb9cafd8          ! %f59
	.word	0x87adf6b1          ! %f60
	.word	0xfc59f001          ! %f61
	.word	0x51e87cc8          ! %f62
	.word	0x0b095acb          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0x59c       ! %g1 (code pointer)
	.word	t0_data_exp_shm_area! %g2 (shared area pointer)
	.word	0x77799b43          ! %g3 (loop index)
	.word	SYM(t0_subr2)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0x5d513493          ! %o0
	.word	0xff2297a5          ! %o1
	.word	0xbfc05cbd          ! %o2
	.word	0xa0a58979          ! %o3
	.word	0xd8c474fa          ! %o4
	.word	0x59b889e9          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0xceffd668          ! %l0
	.word	0x9ad66cbf          ! %l1
	.word	0x8fbf69b1          ! %l2
	.word	0xdebf6cba          ! %l3
	.word	0x241987d4          ! %l4
	.word	0x36f08fdd          ! %l5
	.word	0x61591d4d          ! %l6
	.word	0x56a8d49c          ! %l7
	.word	t0_data_exp_area0   ! %i0 (area pointer)
	.word	t0_data_exp_area0   ! %i1 (area pointer)
	.word	0x0000001c          ! %i2 (byte offset)
	.word	0xfffffff0          ! %i3 (halfword offset)
	.word	0xfffffffc          ! %i4 (word offset)
	.word	0xfffffff8          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0x7cd77ec9          ! %y
	.word	0x00000004          ! %icc (nzvc)
	.word	0x40000202          ! %fsr
	.word	0x00000000          ! %gsr.mask
	.word	0x00000000          ! %gsr
	.word	0x00000080          ! %asi
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

KDATA_MODULE(t0_module_data_exp_stack, 0x0c7f8000)
.seg "data"
KGLOBAL(t0_data_exp_mtbl_size)
KGLOBAL(t0_data_exp_mtbl)
KGLOBAL(t0_data_exp_stack)
t0_data_exp_stack_start:
	.word	0xadbaa04f
	.word	0x84f8eb70
	.word	0x78e44a5b
	.word	0xc7399779
	.word	0x3522724e
	.word	0x828584ba
	.word	0x124c8af4
	.word	0xc355995b
	.word	0xe5906461
	.word	0x62ffb84a
	.word	0x930c402b
	.word	0x9586b06f
	.word	0xa8978c24
	.word	0x33175d17
	.word	0x4a0ec85f
	.word	0x48db30c5
	.word	0x69fcde79
	.word	0x5a5b2bc8
	.word	0x9be4f37c
	.word	0x71b4e23d
	.word	0xea0852e0
	.word	0x76f24179
	.word	0xc0edc86c
	.word	0x657b4ae1
	.word	0xef74680b
	.word	0x62248abe
	.word	0x6341adce
	.word	0x5c3dbb8f
	.word	0x0ff8ddb1
	.word	0x5dd05ae7
	.word	0x0a5ae9e5
	.word	0x375702db
	.word	0xf8e6b7a2
	.word	0x580bb385
	.word	0x32b1add2
	.word	0x2cdeea33
	.word	0xfa18de1b
	.word	0xe914002d
	.word	0xe0312005
	.word	0x85d3e143
	.word	0x25ddef5b
	.word	0x88974a7b
	.word	0x7ece19f1
	.word	0xa6a97b99
	.word	0x05b51675
	.word	0x0e8e2a59
	.word	0x03df8cfe
	.word	0x558ea48c
	.word	0x2700fb68
	.word	0x098df681
	.word	0xb863c2c4
	.word	0x5988ad5a
	.word	0x6971206c
	.word	0xaceef93f
	.word	0x8f5cec75
	.word	0x3fae9990
	.word	0x6413408e
	.word	0xfc9aad7b
	.word	0xcf22b599
	.word	0x12a24dae
	.word	0x9b03837e
	.word	0x971247f6
	.word	0x782dce01
	.word	0xc21b840a
	.word	0xe7cb9aa7
	.word	0xc07e10d4
	.word	0xc2bd9ef5
	.word	0xa732abf4
	.word	0xfeee1b80
	.word	0x8f9a5159
	.word	0x46079faf
	.word	0x2c58171a
	.word	0x971cab21
	.word	0xcf5ed9f7
	.word	0x92a2fd0d
	.word	0xf7c6192e
	.word	0x676ccf19
	.word	0x0a8a6488
	.word	0xe5da8881
	.word	0xc302fdc5
	.word	0x12c8777e
	.word	0x890b56d7
	.word	0xf7ba224b
	.word	0x23f1f882
	.word	0x95149644
	.word	0xced3a964
	.word	0x114c12ea
	.word	0x32407373
	.word	0xe35957d2
	.word	0x703df668
	.word	0x96ce07cf
	.word	0x08ef5fba
	.word	0x00dcd0d2
	.word	0x1e05f516
	.word	0xf9eca754
	.word	0x6d8e6c6f
	.word	0xb8da3548
	.word	0x7236e523
	.word	0xc58fefeb
	.word	0x4fb947c5
	.word	0xb48cece6
	.word	0xdc96ae88
	.word	0xc6b1d69a
	.word	0xa9c54e6b
	.word	0x98e8189d
	.word	0xa83cb986
	.word	0x8f5bd8a6
	.word	0x81904d34
	.word	0xdbc85d77
	.word	0x516fc2ea
	.word	0xf97f748e
	.word	0x344738f9
	.word	0xcef708a3
	.word	0xa2d63092
	.word	0x6228be3a
	.word	0xd40600bd
	.word	0x0532e0d1
	.word	0x77b8aa2f
	.word	0x01c98274
	.word	0x889fde13
	.word	0x53e438c0
	.word	0xb6cefa4b
	.word	0xaf4ead97
	.word	0x9ff1c7bc
	.word	0xc0671714
	.word	0x8a0b7b8d
	.word	0x1898e985
	.word	0x2c16ea93
	.word	0x2b2f876c
	.word	0xf459963c
	.word	0xd70ca6de
	.word	0xc0f14cad
	.word	0x62b968b4
	.word	0x62881201
	.word	0x017d056e
	.word	0x84f6febc
	.word	0xe5764cb7
	.word	0x68e03ff0
	.word	0xe8f84fe6
	.word	0x6d567fb3
	.word	0x42013cf7
	.word	0x877740c9
	.word	0x7333fece
	.word	0x198b36af
	.word	0x110978c0
	.word	0x0c56eb7a
	.word	0x1ec176ba
	.word	0x70a52715
	.word	0xa1e2807a
	.word	0x407017e8
	.word	0xba13f5bb
	.word	0x611542f7
	.word	0xe2b9023f
	.word	0x432051ee
	.word	0x79f36418
	.word	0x1501ffbb
	.word	0xe5517bad
	.word	0xdc3138a5
	.word	0x9d7efc3e
	.word	0x973e10fe
	.word	0xca2ea4fc
	.word	0x2dd80de5
	.word	0x989dfdf4
	.word	0x72356db5
	.word	0x534af952
	.word	0x63a03a0c
	.word	0xb0ebe0d2
	.word	0xd0c30395
t0_data_exp_sp:
	.word	0xf671f055
	.word	0x1893c7fd
	.word	0xa810b9f3
	.word	0x4b23bcb4
	.word	0xe2fabd02
	.word	0x52a11d6b
	.word	0x004dc8e9
	.word	0xe661bb70
	.word	t0_data_exp_area0
	.word	t0_data_exp_area0
	.word	0x0000001f
	.word	0x00000016
	.word	0xfffffffc
	.word	0x00000010
	.word	t0_data_exp_fp
	.word	0x93b7d2d6
	.word	0x76e49b67
	.word	0xa9446fa8
	.word	0x529e6737
	.word	0xa6689a18
	.word	0xd4389c7b
	.word	0x84a625c0
	.word	0xb311f803
	.word	0xe7a5cda5
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
	.word   	0x76c03b25	! [%fp - 0xc]
	.word   	0x3a70d637	! [%fp - 0x8]
	.word   	0x0e1ab5df	! [%fp - 0x4]
t0_data_exp_fp:
	.word	0xa304b9e8
	.word	0x145e6356
	.word	0xac9e81e5
	.word	0x22665d29
	.word	0x1675a8f1
	.word	0xd680916f
	.word	0x4cfb9c7f
	.word	0xded44061
	.word	0x0e0eb076
	.word	0x484021f6
	.word	0x00e1b43f
	.word	0xcebc00ff
	.word	0xc3a6dc1a
	.word	0xe21c6886
	.word	0x91026fc4
	.word	0xd9a68180
	.word	0x2c8337f1
	.word	0xbdcac207
	.word	0x094a0636
	.word	0x87db64c1
	.word	0x836b7f43
	.word	0x0ab9161f
	.word	0x83ae95ad
	.word	0x0076ae91
t0_data_exp_stacktop:
	.word	0
t0_data_exp_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_exp_area0, 0x2c76e000)
.seg "data"
t0_data_exp_area0_start:
.skip 3264
t0_data_exp_area0_begin:
	.word	0x46947390	! t0_data_exp_area0-0x20
	.word	0x64b27be8	! t0_data_exp_area0-0x1c
	.word	0xe633fbd3	! t0_data_exp_area0-0x18
	.word	0x54df5980	! t0_data_exp_area0-0x14
	.word	0xdb2a1fd4	! t0_data_exp_area0-0x10
	.word	0xa8dcf5e3	! t0_data_exp_area0-0xc
	.word	0x66c214c7	! t0_data_exp_area0-0x8
	.word	0xd1b0f5fd	! t0_data_exp_area0-0x4
.global t0_data_exp_area0; t0_data_exp_area0:
	.word	0xe4248c0c	! t0_data_exp_area0+0x0
	.word	0xfd42792b	! t0_data_exp_area0+0x4
	.word	0x98e58444	! t0_data_exp_area0+0x8
	.word	0xb3b7a69f	! t0_data_exp_area0+0xc
	.word	0x2bb5a4f8	! t0_data_exp_area0+0x10
	.word	0x9386b3ed	! t0_data_exp_area0+0x14
	.word	0x30716d02	! t0_data_exp_area0+0x18
	.word	0x19bf0dc2	! t0_data_exp_area0+0x1c
t0_data_exp_area0_end:
.skip 4864
t0_data_exp_area0_stop:

KDATA_MODULE(t0_module_data_exp_shm_area, 0x1a5aa000)
.seg "data"
t0_data_exp_shm_area_start:
t0_data_exp_shm_area_begin:
.global t0_data_exp_shm_area; t0_data_exp_shm_area:
	.word	0xde475c21	! t0_data_exp_shm_area+0x0 (t0)
	.word	0x138e4717	! t0_data_exp_shm_area+0x4 (t0)
	.word	0xf27aba5b	! t0_data_exp_shm_area+0x8 (t0)
	.word	0x7eea0056	! t0_data_exp_shm_area+0xc (t0)
	.word	0x1fed441d	! t0_data_exp_shm_area+0x10 (t0)
	.word	0x55f3674f	! t0_data_exp_shm_area+0x14 (t0)
	.word	0xda8be032	! t0_data_exp_shm_area+0x18 (t0)
	.word	0xae5211f3	! t0_data_exp_shm_area+0x1c (t0)
	.word	0x999d2d11	! t0_data_exp_shm_area+0x20 (t0)
	.word	0x236f1926	! t0_data_exp_shm_area+0x24 (t0)
	.word	0xbe7a3510	! t0_data_exp_shm_area+0x28 (t0)
	.word	0x850b4e2f	! t0_data_exp_shm_area+0x2c (t0)
	.word	0x1eb68576	! t0_data_exp_shm_area+0x30 (t0)
	.word	0x7d1d7c8d	! t0_data_exp_shm_area+0x34 (t0)
	.word	0x96344a8f	! t0_data_exp_shm_area+0x38 (t0)
	.word	0x1c99b334	! t0_data_exp_shm_area+0x3c (t0)
	.word	0xa5988320	! t0_data_exp_shm_area+0x40 (t0 bload)
	.word	0xa4f6db87	! t0_data_exp_shm_area+0x44
	.word	0x8072e7fb	! t0_data_exp_shm_area+0x48
	.word	0x12ab418c	! t0_data_exp_shm_area+0x4c
	.word	0x6b83587c	! t0_data_exp_shm_area+0x50
	.word	0xcd3e7020	! t0_data_exp_shm_area+0x54
	.word	0x0fac8b35	! t0_data_exp_shm_area+0x58
	.word	0x9cc2b53e	! t0_data_exp_shm_area+0x5c
	.word	0xad00fa19	! t0_data_exp_shm_area+0x60
	.word	0x4c43159d	! t0_data_exp_shm_area+0x64
	.word	0xe64593da	! t0_data_exp_shm_area+0x68
	.word	0x4cac3c1f	! t0_data_exp_shm_area+0x6c
	.word	0x14d63869	! t0_data_exp_shm_area+0x70
	.word	0x2edd58f4	! t0_data_exp_shm_area+0x74
	.word	0x1bf57ca5	! t0_data_exp_shm_area+0x78
	.word	0xce56bd61	! t0_data_exp_shm_area+0x7c
	.word	0x1c4531c7	! t0_data_exp_shm_area+0x80 (t0 bstore)
	.word	0x7ad99c7e	! t0_data_exp_shm_area+0x84
	.word	0xe2fbc711	! t0_data_exp_shm_area+0x88
	.word	0x3e41866f	! t0_data_exp_shm_area+0x8c
	.word	0x8c7660bb	! t0_data_exp_shm_area+0x90
	.word	0xca3442ea	! t0_data_exp_shm_area+0x94
	.word	0xe0457d42	! t0_data_exp_shm_area+0x98
	.word	0xda5770fd	! t0_data_exp_shm_area+0x9c
	.word	0x226dca7d	! t0_data_exp_shm_area+0xa0
	.word	0xbbf91574	! t0_data_exp_shm_area+0xa4
	.word	0x404e6e25	! t0_data_exp_shm_area+0xa8
	.word	0xeb0dd65a	! t0_data_exp_shm_area+0xac
	.word	0xc94611b7	! t0_data_exp_shm_area+0xb0
	.word	0x16f65957	! t0_data_exp_shm_area+0xb4
	.word	0xc19787d5	! t0_data_exp_shm_area+0xb8
	.word	0x992ee408	! t0_data_exp_shm_area+0xbc
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



