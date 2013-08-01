/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: v9_kao_02_14_04_112.s
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
#define T0_KAOS_SEED          d33f85a5494e
#define T0_KAOS_ICOUNT        5000
#define T0_KAOS_AREAS         1
#define T0_KAOS_AREASIZE      64
#define T0_KAOS_AREAOFFSET    6016
#define T0_KAOS_PAGESIZE      8192
#define T0_KAOS_CODECOUNT     5002

#define T0_KAOS_BOOT_VA                  0x6183c000
#define T0_KAOS_BOOT_PA                  0x0000000001ccc000
#define T0_KAOS_BOOT_CACHEABLE           1
#define T0_KAOS_BOOT_NONCACHEABLE        0

#define T0_KAOS_STARTUP_VA               0x5e7ee000
#define T0_KAOS_STARTUP_PA               0x00000000020cc000
#define T0_KAOS_STARTUP_CACHEABLE        1
#define T0_KAOS_STARTUP_NONCACHEABLE     0

#define T0_KAOS_OFFSET_TBL_VA            0x4245e000
#define T0_KAOS_OFFSET_TBL_PA            0x0000000005a80000
#define T0_KAOS_OFFSET_TBL_CACHEABLE     1
#define T0_KAOS_OFFSET_TBL_NONCACHEABLE  0

#define T0_KAOS_DONE_VA                  0x3268e000
#define T0_KAOS_DONE_PA                  0x00000000070f2000
#define T0_KAOS_DONE_CACHEABLE           1
#define T0_KAOS_DONE_NONCACHEABLE        0

#define T0_KAOS_KTBL_VA                  0x0e646000
#define T0_KAOS_KTBL_PA                  0x00000000096d6000
#define T0_KAOS_KTBL_CACHEABLE           1
#define T0_KAOS_KTBL_NONCACHEABLE        0

#define T0_KAOS_SUBR0_VA                 0x20d30000
#define T0_KAOS_SUBR0_PA                 0x000000000b79a000
#define T0_KAOS_SUBR0_CACHEABLE          1
#define T0_KAOS_SUBR0_NONCACHEABLE       0
#define T0_KAOS_SUBR1_VA                 0x52260000
#define T0_KAOS_SUBR1_PA                 0x000000000ce00000
#define T0_KAOS_SUBR1_CACHEABLE          1
#define T0_KAOS_SUBR1_NONCACHEABLE       0
#define T0_KAOS_SUBR2_VA                 0x0e65e000
#define T0_KAOS_SUBR2_PA                 0x000000000e842000
#define T0_KAOS_SUBR2_CACHEABLE          1
#define T0_KAOS_SUBR2_NONCACHEABLE       0
#define T0_KAOS_SUBR3_VA                 0x6ff00000
#define T0_KAOS_SUBR3_PA                 0x000000001184a000
#define T0_KAOS_SUBR3_CACHEABLE          1
#define T0_KAOS_SUBR3_NONCACHEABLE       0

#define T0_KAOS_EXP_REGS_VA              0x3dacc000
#define T0_KAOS_EXP_REGS_PA              0x00000000135d6000
#define T0_KAOS_EXP_REGS_CACHEABLE       1
#define T0_KAOS_EXP_REGS_NONCACHEABLE    0
#define T0_KAOS_RUN_REGS_VA              0x60e82000
#define T0_KAOS_RUN_REGS_PA              0x0000000014abc000
#define T0_KAOS_RUN_REGS_CACHEABLE       1
#define T0_KAOS_RUN_REGS_NONCACHEABLE    0

#define T0_KAOS_EXP_STACK_VA             0x1b94e000
#define T0_KAOS_EXP_STACK_PA             0x00000000162f4000
#define T0_KAOS_EXP_STACK_CACHEABLE      1
#define T0_KAOS_EXP_STACK_NONCACHEABLE   0
#define T0_KAOS_RUN_STACK_VA             0x73a1e000
#define T0_KAOS_RUN_STACK_PA             0x0000000019bb6000
#define T0_KAOS_RUN_STACK_CACHEABLE      1
#define T0_KAOS_RUN_STACK_NONCACHEABLE   0

#define T0_KAOS_AREA0
#define T0_KAOS_EXP_AREA0_VA             0x39f5e000
#define T0_KAOS_EXP_AREA0_PA             0x000000001afc0000
#define T0_KAOS_EXP_AREA0_CACHEABLE      1
#define T0_KAOS_EXP_AREA0_NONCACHEABLE   0
#define T0_KAOS_RUN_AREA0_VA             0x0f4a6000
#define T0_KAOS_RUN_AREA0_PA             0x000000001d084000
#define T0_KAOS_RUN_AREA0_CACHEABLE      1
#define T0_KAOS_RUN_AREA0_NONCACHEABLE   0

#define T0_KAOS_SHM_AREA
#define T0_KAOS_EXP_SHM_AREA_VA          0x2b03c000
#define T0_KAOS_EXP_SHM_AREA_PA          0x0000000001a5c000
#define T0_KAOS_EXP_SHM_AREA_CACHEABLE   1
#define T0_KAOS_EXP_SHM_AREA_NONCACHEABLE 0
#define T0_KAOS_RUN_SHM_AREA_VA          0x36ed2000
#define T0_KAOS_RUN_SHM_AREA_PA          0x00000000018da000
#define T0_KAOS_RUN_SHM_AREA_CACHEABLE   1
#define T0_KAOS_RUN_SHM_AREA_NONCACHEABLE 0

#define T0_KAOS_RANVAL_00     0x85813db6
#define T0_KAOS_RANVAL_01     0xf93a8673
#define T0_KAOS_RANVAL_02     0x6843a6a0
#define T0_KAOS_RANVAL_03     0xd6460ae7
#define T0_KAOS_RANVAL_04     0x90d2f7ea
#define T0_KAOS_RANVAL_05     0xa951c1ad
#define T0_KAOS_RANVAL_06     0x3a088a74
#define T0_KAOS_RANVAL_07     0x667f5001
#define T0_KAOS_RANVAL_08     0xf38c8673
#define T0_KAOS_RANVAL_09     0x74eb0719
#define T0_KAOS_RANVAL_0a     0xa95ce853
#define T0_KAOS_RANVAL_0b     0x3824facf
#define T0_KAOS_RANVAL_0c     0xe23b6655
#define T0_KAOS_RANVAL_0d     0x0069fd0f
#define T0_KAOS_RANVAL_0e     0xe0f4bc0d
#define T0_KAOS_RANVAL_0f     0xec612019
#define T0_KAOS_RANVAL_10     0xb72d8926
#define T0_KAOS_RANVAL_11     0xb85884cf
#define T0_KAOS_RANVAL_12     0x2f19731e
#define T0_KAOS_RANVAL_13     0x3b912fa6
#define T0_KAOS_RANVAL_14     0x904525d1
#define T0_KAOS_RANVAL_15     0xbed6b5f9
#define T0_KAOS_RANVAL_16     0x2132350f
#define T0_KAOS_RANVAL_17     0x93869ecd
#define T0_KAOS_RANVAL_18     0x62325196
#define T0_KAOS_RANVAL_19     0x624a9d42
#define T0_KAOS_RANVAL_1a     0xd7ddce1c
#define T0_KAOS_RANVAL_1b     0xb68f284c
#define T0_KAOS_RANVAL_1c     0xc7bea554
#define T0_KAOS_RANVAL_1d     0xa9c0b265
#define T0_KAOS_RANVAL_1e     0xcaee2016
#define T0_KAOS_RANVAL_1f     0xdf20b557
#define T0_KAOS_RANVAL_20     0xdbd7730a
#define T0_KAOS_RANVAL_21     0x25093956
#define T0_KAOS_RANVAL_22     0x7f2f3d8a
#define T0_KAOS_RANVAL_23     0x453243f4
#define T0_KAOS_RANVAL_24     0x0cc74f9b
#define T0_KAOS_RANVAL_25     0x86ae02bd
#define T0_KAOS_RANVAL_26     0xe1e29323
#define T0_KAOS_RANVAL_27     0x990c5e85
#define T0_KAOS_RANVAL_28     0x46d7f4d0
#define T0_KAOS_RANVAL_29     0x0f9f3fa2
#define T0_KAOS_RANVAL_2a     0xa978c34c
#define T0_KAOS_RANVAL_2b     0xe0f0f8a6
#define T0_KAOS_RANVAL_2c     0x90a1bfa3
#define T0_KAOS_RANVAL_2d     0xe72d5c64
#define T0_KAOS_RANVAL_2e     0xb69b1819
#define T0_KAOS_RANVAL_2f     0xfca3c539
#define T0_KAOS_RANVAL_30     0x3bde4eba
#define T0_KAOS_RANVAL_31     0xb8d116ef
#define T0_KAOS_RANVAL_32     0x963faf67
#define T0_KAOS_RANVAL_33     0x10d959be
#define T0_KAOS_RANVAL_34     0xe6e80531
#define T0_KAOS_RANVAL_35     0x6ba2442d
#define T0_KAOS_RANVAL_36     0xf391c541
#define T0_KAOS_RANVAL_37     0x0624b2e7
#define T0_KAOS_RANVAL_38     0x7d68759c
#define T0_KAOS_RANVAL_39     0x4070f8bc
#define T0_KAOS_RANVAL_3a     0xa129c085
#define T0_KAOS_RANVAL_3b     0xb05fee6b
#define T0_KAOS_RANVAL_3c     0x3e53f94b
#define T0_KAOS_RANVAL_3d     0xd27c08e2
#define T0_KAOS_RANVAL_3e     0x6aa6e5c6
#define T0_KAOS_RANVAL_3f     0xc6064e1a
#define T0_KAOS_RANVAL_40     0x1a70f7cf
#define T0_KAOS_RANVAL_41     0x46fb13bd
#define T0_KAOS_RANVAL_42     0xc476d474
#define T0_KAOS_RANVAL_43     0x87c2d831
#define T0_KAOS_RANVAL_44     0xd58da2bd
#define T0_KAOS_RANVAL_45     0xc8618dbe
#define T0_KAOS_RANVAL_46     0xbdb5323a
#define T0_KAOS_RANVAL_47     0x68d828ef
#define T0_KAOS_RANVAL_48     0x8d6f29b1
#define T0_KAOS_RANVAL_49     0x4ea37e58
#define T0_KAOS_RANVAL_4a     0x01d028a7
#define T0_KAOS_RANVAL_4b     0x963b4967
#define T0_KAOS_RANVAL_4c     0x40b1aa96
#define T0_KAOS_RANVAL_4d     0xb51be4f3
#define T0_KAOS_RANVAL_4e     0xd344990f
#define T0_KAOS_RANVAL_4f     0x5d849f97
#define T0_KAOS_RANVAL_50     0xc5806223
#define T0_KAOS_RANVAL_51     0x743ff926
#define T0_KAOS_RANVAL_52     0x708f2ab3
#define T0_KAOS_RANVAL_53     0xfb774bba
#define T0_KAOS_RANVAL_54     0x3881e0a8
#define T0_KAOS_RANVAL_55     0xb049ba26
#define T0_KAOS_RANVAL_56     0x669d971f
#define T0_KAOS_RANVAL_57     0xa51086da
#define T0_KAOS_RANVAL_58     0x2fcc470a
#define T0_KAOS_RANVAL_59     0x11b78178
#define T0_KAOS_RANVAL_5a     0xb2ddd8d3
#define T0_KAOS_RANVAL_5b     0xe315d6a8
#define T0_KAOS_RANVAL_5c     0x1871d00b
#define T0_KAOS_RANVAL_5d     0x60258cee
#define T0_KAOS_RANVAL_5e     0xe8bf2025
#define T0_KAOS_RANVAL_5f     0xe0322a8f
#define T0_KAOS_RANVAL_60     0xc77629ce
#define T0_KAOS_RANVAL_61     0xa6e1b3d0
#define T0_KAOS_RANVAL_62     0x9d52b265
#define T0_KAOS_RANVAL_63     0xb21f3606
#define T0_KAOS_RANVAL_64     0xe501639a
#define T0_KAOS_RANVAL_65     0xc3e8bb58
#define T0_KAOS_RANVAL_66     0x55f91742
#define T0_KAOS_RANVAL_67     0x20599c25
#define T0_KAOS_RANVAL_68     0xeaad73dd
#define T0_KAOS_RANVAL_69     0x58fffe63
#define T0_KAOS_RANVAL_6a     0xeeea386b
#define T0_KAOS_RANVAL_6b     0xfbb3c07b
#define T0_KAOS_RANVAL_6c     0xb0179a74
#define T0_KAOS_RANVAL_6d     0xd2955c66
#define T0_KAOS_RANVAL_6e     0x9a2d5779
#define T0_KAOS_RANVAL_6f     0xdb04511e
#define T0_KAOS_RANVAL_70     0x33af2329
#define T0_KAOS_RANVAL_71     0x743aa39e
#define T0_KAOS_RANVAL_72     0x117ffe0b
#define T0_KAOS_RANVAL_73     0x6f6ade02
#define T0_KAOS_RANVAL_74     0x754f4c7c
#define T0_KAOS_RANVAL_75     0x6630ea8b
#define T0_KAOS_RANVAL_76     0x9bf94c32
#define T0_KAOS_RANVAL_77     0x9f76118e
#define T0_KAOS_RANVAL_78     0xdcca56a6
#define T0_KAOS_RANVAL_79     0x9dcb8c9e
#define T0_KAOS_RANVAL_7a     0xfd29490f
#define T0_KAOS_RANVAL_7b     0x091c5e6c
#define T0_KAOS_RANVAL_7c     0x1467feda
#define T0_KAOS_RANVAL_7d     0x22b9be30
#define T0_KAOS_RANVAL_7e     0x0d4a19bb
#define T0_KAOS_RANVAL_7f     0x583136a0
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
!    areaoffset     6016
!    ncache         0
!    emulate_ncache 1
!    pagesize       8192
!    invsize        0
!    codecount      5002
!    code           0e646000
!    entry          0e646000
!    fsr_exceptions 00000000
!    fsr_roundmode  00000004
!    fsr_mask       c0000fff
!    seed           d33f85a5494e
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

KTEXT_MODULE(t0_module_ktbl, 0x0e646000)
.seg "text"
	KGLOBAL(t0_ktbl)
t0_ktbl_page_begin:
.global t0_kref; t0_kref:
	.skip 0
t0_ktbl:
	.word	0x36480007	! t0_kref+0x0:   	bge,a,pt	%icc, _kref+0x1c
	.word	0xd850a00a	! t0_kref+0x4:   	ldsh	[%g2 + 0xa], %o4
	.word	0xac868008	! t0_kref+0x8:   	addcc	%i2, %o0, %l6
	.word	0xabb58db2	! t0_kref+0xc:   	fxors	%f22, %f18, %f21
	.word	0xa60ded45	! t0_kref+0x10:   	and	%l7, 0xd45, %l3
	.word	0xabb58494	! t0_kref+0x14:   	fcmple32	%f22, %f20, %l5
	.word	0xc12e001c	! t0_kref+0x18:   	st	%fsr, [%i0 + %i4]
	.word	0x35800001	! t0_kref+0x1c:   	fbue,a	_kref+0x20
	.word	0xa5b48918	! t0_kref+0x20:   	faligndata	%f18, %f24, %f18
	.word	0x9f414000	! t0_kref+0x24:   	mov	%pc, %o7
!	.word	0x248067f5	! t0_kref+0x28:   	ble,a	SYM(t0_subr2)
	   	ble,a	SYM(t0_subr2)
	.word	0xa5b30988	! t0_kref+0x2c:   	bshuffle	%f12, %f8, %f18
	.word	0x23800006	! t0_kref+0x30:   	fbne,a	_kref+0x48
	.word	0xde0e0000	! t0_kref+0x34:   	ldub	[%i0], %o7
	.word	0x8143c000	! t0_kref+0x38:   	stbar
	.word	0x22800001	! t0_kref+0x3c:   	be,a	_kref+0x40
	.word	0x97a00038	! t0_kref+0x40:   	fmovs	%f24, %f11
	.word	0x13085e82	! t0_kref+0x44:   	sethi	%hi(0x217a0800), %o1
	.word	0xa486c00a	! t0_kref+0x48:   	addcc	%i3, %o2, %l2
	.word	0x9bb54d34	! t0_kref+0x4c:   	fandnot1s	%f21, %f20, %f13
	.word	0xd830a020	! t0_kref+0x50:   	sth	%o4, [%g2 + 0x20]
	.word	0x92b33b0a	! t0_kref+0x54:   	orncc	%o4, -0x4f6, %o1
	.word	0xe256001b	! t0_kref+0x58:   	ldsh	[%i0 + %i3], %l1
	.word	0x24800002	! t0_kref+0x5c:   	ble,a	_kref+0x64
	.word	0xa340c000	! t0_kref+0x60:   	mov	%asi, %l1
	.word	0xa9b58496	! t0_kref+0x64:   	fcmple32	%f22, %f22, %l4
	.word	0xa815a6e3	! t0_kref+0x68:   	or	%l6, 0x6e3, %l4
	.word	0x9622b28a	! t0_kref+0x6c:   	sub	%o2, -0xd76, %o3
	.word	0xada01937	! t0_kref+0x70:   	fstod	%f23, %f22
	.word	0xa5a5c830	! t0_kref+0x74:   	fadds	%f23, %f16, %f18
	.word	0xd6f6101d	! t0_kref+0x78:   	stxa	%o3, [%i0 + %i5]0x80
	.word	0xd8680019	! t0_kref+0x7c:   	ldstub	[%g0 + %i1], %o4
	.word	0x001fffff	! t0_kref+0x80:   	illtrap	0x1fffff
	.word	0xa815fde1	! t0_kref+0x84:   	or	%l7, -0x21f, %l4
	.word	0xe248a00c	! t0_kref+0x88:   	ldsb	[%g2 + 0xc], %l1
	.word	0xad1d3d03	! t0_kref+0x8c:   	tsubcctv	%l4, -0x2fd, %l6
	.word	0x9da0054a	! t0_kref+0x90:   	fsqrtd	%f10, %f14
	.word	0x85826080	! t0_kref+0x94:   	wr	%o1, 0x80, %ccr
	.word	0x2923088c	! t0_kref+0x98:   	sethi	%hi(0x8c223000), %l4
	.word	0x9fc00004	! t0_kref+0x9c:   	call	%g0 + %g4
	.word	0xa3a0002e	! t0_kref+0xa0:   	fmovs	%f14, %f17
	.word	0x95a0192a	! t0_kref+0xa4:   	fstod	%f10, %f10
	.word	0xd6ee9018	! t0_kref+0xa8:   	ldstuba	[%i2 + %i0]0x80, %o3
	.word	0x86102004	! t0_kref+0xac:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0xb0:   	bne,a	_kref+0xb0
	.word	0x86a0e001	! t0_kref+0xb4:   	subcc	%g3, 1, %g3
	.word	0xd1bf5a59	! t0_kref+0xb8:   	stda	%f8, [%i5 + %i1]0xd2
	.word	0xee8e101a	! t0_kref+0xbc:   	lduba	[%i0 + %i2]0x80, %l7
	.word	0xee567ffc	! t0_kref+0xc0:   	ldsh	[%i1 - 4], %l7
	.word	0xaef5bc88	! t0_kref+0xc4:   	udivcc	%l6, -0x378, %l7
	.word	0x2c480008	! t0_kref+0xc8:   	bneg,a,pt	%icc, _kref+0xe8
	.word	0xea36c019	! t0_kref+0xcc:   	sth	%l5, [%i3 + %i1]
	.word	0xb1a0054a	! t0_kref+0xd0:   	fsqrtd	%f10, %f24
	.word	0x91a28856	! t0_kref+0xd4:   	faddd	%f10, %f22, %f8
	.word	0xab156cd3	! t0_kref+0xd8:   	taddcctv	%l5, 0xcd3, %l5
	.word	0xa4f20017	! t0_kref+0xdc:   	udivcc	%o0, %l7, %l2
	.word	0xaba2c9b5	! t0_kref+0xe0:   	fdivs	%f11, %f21, %f21
	.word	0x95a0054a	! t0_kref+0xe4:   	fsqrtd	%f10, %f10
	.word	0x9bb3016b	! t0_kref+0xe8:   	edge32ln	%o4, %o3, %o5
	.word	0x91b44c77	! t0_kref+0xec:   	fnors	%f17, %f23, %f8
	.word	0x81854000	! t0_kref+0xf0:   	wr	%l5, %g0, %y
	.word	0xd9f61000	! t0_kref+0xf4:   	casxa	[%i0]0x80, %g0, %o4
	.word	0xef6e401c	! t0_kref+0xf8:   	prefetch	%i1 + %i4, 23
	.word	0x91a01a2f	! t0_kref+0xfc:   	fstoi	%f15, %f8
	.word	0xb1a0002b	! t0_kref+0x100:   	fmovs	%f11, %f24
	.word	0xd5f6100a	! t0_kref+0x104:   	casxa	[%i0]0x80, %o2, %o2
	.word	0xadb30e39	! t0_kref+0x108:   	fands	%f12, %f25, %f22
	.word	0x95a01929	! t0_kref+0x10c:   	fstod	%f9, %f10
	.word	0xa3b580cc	! t0_kref+0x110:   	edge16l	%l6, %o4, %l1
	.word	0x95a01a29	! t0_kref+0x114:   	fstoi	%f9, %f10
	.word	0x86102004	! t0_kref+0x118:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x11c:   	bne,a	_kref+0x11c
	.word	0x86a0e001	! t0_kref+0x120:   	subcc	%g3, 1, %g3
	.word	0xde063fe4	! t0_kref+0x124:   	ld	[%i0 - 0x1c], %o7
	.word	0x962b6b9d	! t0_kref+0x128:   	andn	%o5, 0xb9d, %o3
	.word	0xe09e5000	! t0_kref+0x12c:   	ldda	[%i1]0x80, %l0
	.word	0xec1e7fe0	! t0_kref+0x130:   	ldd	[%i1 - 0x20], %l6
	.word	0xa5a38852	! t0_kref+0x134:   	faddd	%f14, %f18, %f18
	.word	0xde4e3ff7	! t0_kref+0x138:   	ldsb	[%i0 - 9], %o7
	.word	0xa9a0002e	! t0_kref+0x13c:   	fmovs	%f14, %f20
	.word	0x91a0054a	! t0_kref+0x140:   	fsqrtd	%f10, %f8
	.word	0x99b3472d	! t0_kref+0x144:   	fmuld8ulx16	%f13, %f13, %f12
	.word	0xa1a01931	! t0_kref+0x148:   	fstod	%f17, %f16
	.word	0x9da01030	! t0_kref+0x14c:   	fstox	%f16, %f14
	.word	0x9a132d40	! t0_kref+0x150:   	or	%o4, 0xd40, %o5
	.word	0x98257a74	! t0_kref+0x154:   	sub	%l5, -0x58c, %o4
	.word	0xe0d01018	! t0_kref+0x158:   	ldsha	[%g0 + %i0]0x80, %l0
	.word	0x99a00132	! t0_kref+0x15c:   	fabss	%f18, %f12
	.word	0xe9e6500a	! t0_kref+0x160:   	casa	[%i1]0x80, %o2, %l4
	.word	0x86102004	! t0_kref+0x164:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x168:   	bne,a	_kref+0x168
	.word	0x86a0e001	! t0_kref+0x16c:   	subcc	%g3, 1, %g3
	.word	0x9afa800d	! t0_kref+0x170:   	sdivcc	%o2, %o5, %o5
	.word	0xa7a00030	! t0_kref+0x174:   	fmovs	%f16, %f19
	.word	0x8143c000	! t0_kref+0x178:   	stbar
	.word	0x98b20014	! t0_kref+0x17c:   	orncc	%o0, %l4, %o4
	.word	0x90f37e72	! t0_kref+0x180:   	udivcc	%o5, -0x18e, %o0
	.word	0xb1a0002d	! t0_kref+0x184:   	fmovs	%f13, %f24
	.word	0xc5ee100c	! t0_kref+0x188:   	prefetcha	%i0 + %o4, 2
	.word	0xace5400a	! t0_kref+0x18c:   	subccc	%l5, %o2, %l6
	.word	0x26480004	! t0_kref+0x190:   	bl,a,pt	%icc, _kref+0x1a0
	.word	0xa32ea008	! t0_kref+0x194:   	sll	%i2, 0x8, %l1
	.word	0x81ad4ab5	! t0_kref+0x198:   	fcmpes	%fcc0, %f21, %f21
	.word	0xb3a0188b	! t0_kref+0x19c:   	fitos	%f11, %f25
	.word	0x9f0db9f1	! t0_kref+0x1a0:   	tsubcc	%l6, -0x60f, %o7
	.word	0xadb60488	! t0_kref+0x1a4:   	fcmple32	%f24, %f8, %l6
	.word	0xa21279f5	! t0_kref+0x1a8:   	or	%o1, -0x60b, %l1
	.word	0xae2d0009	! t0_kref+0x1ac:   	andn	%l4, %o1, %l7
	.word	0xa1b48590	! t0_kref+0x1b0:   	fcmpgt32	%f18, %f16, %l0
	.word	0xc026401c	! t0_kref+0x1b4:   	clr	[%i1 + %i4]
	.word	0xd410a00e	! t0_kref+0x1b8:   	lduh	[%g2 + 0xe], %o2
	.word	0xe500a038	! t0_kref+0x1bc:   	ld	[%g2 + 0x38], %f18
	.word	0x27800006	! t0_kref+0x1c0:   	fbul,a	_kref+0x1d8
	.word	0xa3408000	! t0_kref+0x1c4:   	mov	%ccr, %l1
	.word	0x38480003	! t0_kref+0x1c8:   	bgu,a,pt	%icc, _kref+0x1d4
	.word	0xd9be188d	! t0_kref+0x1cc:   	stda	%f12, [%i0 + %o5]0xc4
	.word	0x908dfbe1	! t0_kref+0x1d0:   	andcc	%l7, -0x41f, %o0
	.word	0xa4bee34f	! t0_kref+0x1d4:   	xnorcc	%i3, 0x34f, %l2
	.word	0xdb000019	! t0_kref+0x1d8:   	ld	[%g0 + %i1], %f13
	.word	0x99a00554	! t0_kref+0x1dc:   	fsqrtd	%f20, %f12
	.word	0x99a00139	! t0_kref+0x1e0:   	fabss	%f25, %f12
	.word	0x8143e03b	! t0_kref+0x1e4:   	membar	0x3b
	.word	0x91b00cf4	! t0_kref+0x1e8:   	fnot2s	%f20, %f8
	.word	0xa9126b16	! t0_kref+0x1ec:   	taddcctv	%o1, 0xb16, %l4
	.word	0xdd3e4000	! t0_kref+0x1f0:   	std	%f14, [%i1]
	.word	0xa3b5006a	! t0_kref+0x1f4:   	edge8ln	%l4, %o2, %l1
	.word	0xd436c018	! t0_kref+0x1f8:   	sth	%o2, [%i3 + %i0]
	.word	0x989a4014	! t0_kref+0x1fc:   	xorcc	%o1, %l4, %o4
	.word	0x81ab4aad	! t0_kref+0x200:   	fcmpes	%fcc0, %f13, %f13
	.word	0xec266018	! t0_kref+0x204:   	st	%l6, [%i1 + 0x18]
	.word	0x8582c017	! t0_kref+0x208:   	wr	%o3, %l7, %ccr
	.word	0x24480008	! t0_kref+0x20c:   	ble,a,pt	%icc, _kref+0x22c
	.word	0xd256c018	! t0_kref+0x210:   	ldsh	[%i3 + %i0], %o1
	.word	0xd2a81018	! t0_kref+0x214:   	stba	%o1, [%g0 + %i0]0x80
	.word	0x9a3b3983	! t0_kref+0x218:   	xnor	%o4, -0x67d, %o5
	.word	0x2a480004	! t0_kref+0x21c:   	bcs,a,pt	%icc, _kref+0x22c
	.word	0xe448a024	! t0_kref+0x220:   	ldsb	[%g2 + 0x24], %l2
	.word	0x3c800003	! t0_kref+0x224:   	bpos,a	_kref+0x230
	.word	0xe608a01f	! t0_kref+0x228:   	ldub	[%g2 + 0x1f], %l3
	.word	0xafb34129	! t0_kref+0x22c:   	edge32n	%o5, %o1, %l7
	.word	0x91a00030	! t0_kref+0x230:   	fmovs	%f16, %f8
	.word	0xadb30e29	! t0_kref+0x234:   	fands	%f12, %f9, %f22
	.word	0x2e480002	! t0_kref+0x238:   	bvs,a,pt	%icc, _kref+0x240
	.word	0xda567ff0	! t0_kref+0x23c:   	ldsh	[%i1 - 0x10], %o5
	.word	0xf56e401b	! t0_kref+0x240:   	prefetch	%i1 + %i3, 26
	.word	0xa283777d	! t0_kref+0x244:   	addcc	%o5, -0x883, %l1
	.word	0x9ba609b1	! t0_kref+0x248:   	fdivs	%f24, %f17, %f13
	.word	0x9476bbb4	! t0_kref+0x24c:   	udiv	%i2, -0x44c, %o2
	.word	0x9af5b8a0	! t0_kref+0x250:   	udivcc	%l6, -0x760, %o5
	.word	0xe00e2003	! t0_kref+0x254:   	ldub	[%i0 + 3], %l0
	.word	0xae9ae822	! t0_kref+0x258:   	xorcc	%o3, 0x822, %l7
	.word	0xed1e401d	! t0_kref+0x25c:   	ldd	[%i1 + %i5], %f22
	.word	0x9e302835	! t0_kref+0x260:   	orn	%g0, 0x835, %o7
	.word	0x24800004	! t0_kref+0x264:   	ble,a	_kref+0x274
	.word	0x9ba01a4a	! t0_kref+0x268:   	fdtoi	%f10, %f13
	.word	0x96baf959	! t0_kref+0x26c:   	xnorcc	%o3, -0x6a7, %o3
	.word	0x9a353103	! t0_kref+0x270:   	orn	%l4, -0xefd, %o5
	.word	0xadb60d0c	! t0_kref+0x274:   	fandnot1	%f24, %f12, %f22
	.word	0xb1a5882b	! t0_kref+0x278:   	fadds	%f22, %f11, %f24
	.word	0x99a38958	! t0_kref+0x27c:   	fmuld	%f14, %f24, %f12
	.word	0xd8260000	! t0_kref+0x280:   	st	%o4, [%i0]
	.word	0x96bdf5ad	! t0_kref+0x284:   	xnorcc	%l7, -0xa53, %o3
	.word	0xaba018c8	! t0_kref+0x288:   	fdtos	%f8, %f21
	.word	0xafa018d2	! t0_kref+0x28c:   	fdtos	%f18, %f23
	.word	0x929b0009	! t0_kref+0x290:   	xorcc	%o4, %o1, %o1
	.word	0xda480018	! t0_kref+0x294:   	ldsb	[%g0 + %i0], %o5
	.word	0xaf2a6011	! t0_kref+0x298:   	sll	%o1, 0x11, %l7
	.word	0x9db207d2	! t0_kref+0x29c:   	pdist	%f8, %f18, %f14
	.word	0xa40a4009	! t0_kref+0x2a0:   	and	%o1, %o1, %l2
	.word	0xd3260000	! t0_kref+0x2a4:   	st	%f9, [%i0]
	.word	0x8182c000	! t0_kref+0x2a8:   	wr	%o3, %g0, %y
	.word	0xac2eac06	! t0_kref+0x2ac:   	andn	%i2, 0xc06, %l6
	.word	0xf300a014	! t0_kref+0x2b0:   	ld	[%g2 + 0x14], %f25
	.word	0x9fc00004	! t0_kref+0x2b4:   	call	%g0 + %g4
	.word	0xa2d20017	! t0_kref+0x2b8:   	umulcc	%o0, %l7, %l1
	.word	0x39800006	! t0_kref+0x2bc:   	fbuge,a	_kref+0x2d4
	.word	0xfb6e6018	! t0_kref+0x2c0:   	prefetch	%i1 + 0x18, 29
	.word	0xa9a00558	! t0_kref+0x2c4:   	fsqrtd	%f24, %f20
	.word	0xc036401b	! t0_kref+0x2c8:   	clrh	[%i1 + %i3]
	.word	0xa423000c	! t0_kref+0x2cc:   	sub	%o4, %o4, %l2
	.word	0xd8567fee	! t0_kref+0x2d0:   	ldsh	[%i1 - 0x12], %o4
	.word	0xec56c018	! t0_kref+0x2d4:   	ldsh	[%i3 + %i0], %l6
	.word	0x81580000	! t0_kref+0x2d8:   	flushw
	.word	0x31800005	! t0_kref+0x2dc:   	fba,a	_kref+0x2f0
	.word	0xde00a018	! t0_kref+0x2e0:   	ld	[%g2 + 0x18], %o7
	.word	0xd626200c	! t0_kref+0x2e4:   	st	%o3, [%i0 + 0xc]
	.word	0x35480005	! t0_kref+0x2e8:   	fbue,a,pt	%fcc0, _kref+0x2fc
	.word	0x908db756	! t0_kref+0x2ec:   	andcc	%l6, -0x8aa, %o0
	.word	0xec2e7ff9	! t0_kref+0x2f0:   	stb	%l6, [%i1 - 7]
	.word	0xaaa58017	! t0_kref+0x2f4:   	subcc	%l6, %l7, %l5
	.word	0x81acca2e	! t0_kref+0x2f8:   	fcmps	%fcc0, %f19, %f14
	.word	0x8582c00c	! t0_kref+0x2fc:   	wr	%o3, %o4, %ccr
	.word	0xdd067ff0	! t0_kref+0x300:   	ld	[%i1 - 0x10], %f14
	.word	0xd2480019	! t0_kref+0x304:   	ldsb	[%g0 + %i1], %o1
	.word	0xa1418000	! t0_kref+0x308:   	mov	%fprs, %l0
	.word	0xf11f4019	! t0_kref+0x30c:   	ldd	[%i5 + %i1], %f24
	.word	0xd648a012	! t0_kref+0x310:   	ldsb	[%g2 + 0x12], %o3
	.word	0x9bb00774	! t0_kref+0x314:   	fpack16	%f20, %f13
	.word	0xa7a01a50	! t0_kref+0x318:   	fdtoi	%f16, %f19
	.word	0x33800007	! t0_kref+0x31c:   	fbe,a	_kref+0x338
	.word	0xb3b58c6d	! t0_kref+0x320:   	fnors	%f22, %f13, %f25
	.word	0x13234742	! t0_kref+0x324:   	sethi	%hi(0x8d1d0800), %o1
	.word	0xdd3e3fe0	! t0_kref+0x328:   	std	%f14, [%i0 - 0x20]
	.word	0xec40a000	! t0_kref+0x32c:   	ldsw	[%g2], %l6
	.word	0x20480006	! t0_kref+0x330:   	bn,a,pt	%icc, _kref+0x348
	.word	0xe4070018	! t0_kref+0x334:   	ld	[%i4 + %i0], %l2
	.word	0x9f2530ec	! t0_kref+0x338:   	mulscc	%l4, -0xf14, %o7
	.word	0xee067fec	! t0_kref+0x33c:   	ld	[%i1 - 0x14], %l7
	.word	0x81d94001	! t0_kref+0x340:   	flush	%g5 + %g1
	.word	0x38480004	! t0_kref+0x344:   	bgu,a,pt	%icc, _kref+0x354
	.word	0xd1270019	! t0_kref+0x348:   	st	%f8, [%i4 + %i1]
	.word	0xf636600a	! t0_kref+0x34c:   	sth	%i3, [%i1 + 0xa]
	.word	0xac13268c	! t0_kref+0x350:   	or	%o4, 0x68c, %l6
	.word	0xebee101d	! t0_kref+0x354:   	prefetcha	%i0 + %i5, 21
	.word	0xd700a024	! t0_kref+0x358:   	ld	[%g2 + 0x24], %f11
	.word	0x91b48a4c	! t0_kref+0x35c:   	fpadd32	%f18, %f12, %f8
	.word	0xde56001b	! t0_kref+0x360:   	ldsh	[%i0 + %i3], %o7
	.word	0x9123000b	! t0_kref+0x364:   	mulscc	%o4, %o3, %o0
	.word	0x9fa00038	! t0_kref+0x368:   	fmovs	%f24, %f15
	.word	0x90c5f59e	! t0_kref+0x36c:   	addccc	%l7, -0xa62, %o0
	.word	0xe5066008	! t0_kref+0x370:   	ld	[%i1 + 8], %f18
	.word	0x9da40832	! t0_kref+0x374:   	fadds	%f16, %f18, %f14
	.word	0xa5a3094c	! t0_kref+0x378:   	fmuld	%f12, %f12, %f18
	.word	0x9f414000	! t0_kref+0x37c:   	mov	%pc, %o7
!	.word	0x2648671f	! t0_kref+0x380:   	bl,a,pt	%icc, SYM(t0_subr2)
	   	bl,a,pt	%icc, SYM(t0_subr2)
	.word	0x923a273d	! t0_kref+0x384:   	xnor	%o0, 0x73d, %o1
	.word	0x2c480006	! t0_kref+0x388:   	bneg,a,pt	%icc, _kref+0x3a0
	.word	0x9ba209ad	! t0_kref+0x38c:   	fdivs	%f8, %f13, %f13
	.word	0xa3a588b2	! t0_kref+0x390:   	fsubs	%f22, %f18, %f17
	.word	0x22480008	! t0_kref+0x394:   	be,a,pt	%icc, _kref+0x3b4
	.word	0xa5b58c4c	! t0_kref+0x398:   	fnor	%f22, %f12, %f18
	.word	0xa8b6800b	! t0_kref+0x39c:   	orncc	%i2, %o3, %l4
	.word	0xada01928	! t0_kref+0x3a0:   	fstod	%f8, %f22
	.word	0x28800007	! t0_kref+0x3a4:   	bleu,a	_kref+0x3c0
	.word	0xc3ee101a	! t0_kref+0x3a8:   	prefetcha	%i0 + %i2, 1
	.word	0xa1b4848c	! t0_kref+0x3ac:   	fcmple32	%f18, %f12, %l0
	.word	0x9695401b	! t0_kref+0x3b0:   	orcc	%l5, %i3, %o3
	.word	0x9e0d800a	! t0_kref+0x3b4:   	and	%l6, %o2, %o7
	.word	0x81ac0ab9	! t0_kref+0x3b8:   	fcmpes	%fcc0, %f16, %f25
	.word	0xec200018	! t0_kref+0x3bc:   	st	%l6, [%g0 + %i0]
	.word	0x2b800002	! t0_kref+0x3c0:   	fbug,a	_kref+0x3c8
	.word	0xe01e401d	! t0_kref+0x3c4:   	ldd	[%i1 + %i5], %l0
	.word	0x963a4016	! t0_kref+0x3c8:   	xnor	%o1, %l6, %o3
	.word	0xdd06001c	! t0_kref+0x3cc:   	ld	[%i0 + %i4], %f14
	.word	0xe01e3fe8	! t0_kref+0x3d0:   	ldd	[%i0 - 0x18], %l0
	.word	0x81800000	! t0_kref+0x3d4:   	mov	%g0, %y
	.word	0x81ab0a33	! t0_kref+0x3d8:   	fcmps	%fcc0, %f12, %f19
	.word	0xeb6e001a	! t0_kref+0x3dc:   	prefetch	%i0 + %i2, 21
	.word	0xa83d000c	! t0_kref+0x3e0:   	xnor	%l4, %o4, %l4
	.word	0x95a00539	! t0_kref+0x3e4:   	fsqrts	%f25, %f10
	.word	0xa23b4014	! t0_kref+0x3e8:   	xnor	%o5, %l4, %l1
	.word	0xee0e2001	! t0_kref+0x3ec:   	ldub	[%i0 + 1], %l7
	.word	0x9ac6a36d	! t0_kref+0x3f0:   	addccc	%i2, 0x36d, %o5
	.word	0x93b58280	! t0_kref+0x3f4:   	array32	%l6, %g0, %o1
	.word	0x20480002	! t0_kref+0x3f8:   	bn,a,pt	%icc, _kref+0x400
	.word	0x91a01913	! t0_kref+0x3fc:   	fitod	%f19, %f8
	.word	0xa5b2ceec	! t0_kref+0x400:   	fornot2s	%f11, %f12, %f18
	.word	0x95b48e10	! t0_kref+0x404:   	fand	%f18, %f16, %f10
	.word	0xdaa01018	! t0_kref+0x408:   	sta	%o5, [%g0 + %i0]0x80
	.word	0x81ab4a37	! t0_kref+0x40c:   	fcmps	%fcc0, %f13, %f23
	.word	0xea062000	! t0_kref+0x410:   	ld	[%i0], %l5
	.word	0xf83e7ff0	! t0_kref+0x414:   	std	%i4, [%i1 - 0x10]
	.word	0xd0480018	! t0_kref+0x418:   	ldsb	[%g0 + %i0], %o0
	.word	0xf6267fe0	! t0_kref+0x41c:   	st	%i3, [%i1 - 0x20]
	.word	0x81aa8a4c	! t0_kref+0x420:   	fcmpd	%fcc0, %f10, %f12
	.word	0xf6270018	! t0_kref+0x424:   	st	%i3, [%i4 + %i0]
	.word	0xa9a3cd39	! t0_kref+0x428:   	fsmuld	%f15, %f25, %f20
	.word	0xd1380018	! t0_kref+0x42c:   	std	%f8, [%g0 + %i0]
	.word	0xada5c839	! t0_kref+0x430:   	fadds	%f23, %f25, %f22
	.word	0x9ba0002f	! t0_kref+0x434:   	fmovs	%f15, %f13
	.word	0x9744c000	! t0_kref+0x438:   	mov	%gsr, %o3
	.word	0x34800002	! t0_kref+0x43c:   	bg,a	_kref+0x444
	.word	0xa852325d	! t0_kref+0x440:   	umul	%o0, -0xda3, %l4
	.word	0x131b3bf5	! t0_kref+0x444:   	sethi	%hi(0x6cefd400), %o1
	.word	0x81ab8a31	! t0_kref+0x448:   	fcmps	%fcc0, %f14, %f17
	.word	0x99b00fc0	! t0_kref+0x44c:   	fone	%f12
	.word	0xa1a00133	! t0_kref+0x450:   	fabss	%f19, %f16
	.word	0xa08d4008	! t0_kref+0x454:   	andcc	%l5, %o0, %l0
	.word	0x24480006	! t0_kref+0x458:   	ble,a,pt	%icc, _kref+0x470
	.word	0x15325cff	! t0_kref+0x45c:   	sethi	%hi(0xc973fc00), %o2
	.word	0xdaae9019	! t0_kref+0x460:   	stba	%o5, [%i2 + %i1]0x80
	.word	0xd848a028	! t0_kref+0x464:   	ldsb	[%g2 + 0x28], %o4
	.word	0x9ba0002f	! t0_kref+0x468:   	fmovs	%f15, %f13
	.word	0x96124014	! t0_kref+0x46c:   	or	%o1, %l4, %o3
	.word	0xa5a01a50	! t0_kref+0x470:   	fdtoi	%f16, %f18
	.word	0xada30852	! t0_kref+0x474:   	faddd	%f12, %f18, %f22
	.word	0x81ad4a38	! t0_kref+0x478:   	fcmps	%fcc0, %f21, %f24
	.word	0x8610201c	! t0_kref+0x47c:   	mov	0x1c, %g3
	.word	0x86a0e001	! t0_kref+0x480:   	subcc	%g3, 1, %g3
	.word	0x22800008	! t0_kref+0x484:   	be,a	_kref+0x4a4
	.word	0xd1be5897	! t0_kref+0x488:   	stda	%f8, [%i1 + %l7]0xc4
	.word	0xa5a01a4c	! t0_kref+0x48c:   	fdtoi	%f12, %f18
	.word	0x91b28408	! t0_kref+0x490:   	fcmple16	%f10, %f8, %o0
	.word	0x95a609d6	! t0_kref+0x494:   	fdivd	%f24, %f22, %f10
	.word	0xa7a01a4a	! t0_kref+0x498:   	fdtoi	%f10, %f19
	.word	0x91a58858	! t0_kref+0x49c:   	faddd	%f22, %f24, %f8
	.word	0x91a309d4	! t0_kref+0x4a0:   	fdivd	%f12, %f20, %f8
	.word	0xdd1e0000	! t0_kref+0x4a4:   	ldd	[%i0], %f14
	.word	0xe41e001d	! t0_kref+0x4a8:   	ldd	[%i0 + %i5], %l2
	.word	0x2f800001	! t0_kref+0x4ac:   	fbu,a	_kref+0x4b0
	.word	0x112b3aba	! t0_kref+0x4b0:   	sethi	%hi(0xaceae800), %o0
	.word	0x86102003	! t0_kref+0x4b4:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x4b8:   	bne,a	_kref+0x4b8
	.word	0x86a0e001	! t0_kref+0x4bc:   	subcc	%g3, 1, %g3
	.word	0xda162012	! t0_kref+0x4c0:   	lduh	[%i0 + 0x12], %o5
	.word	0x28480001	! t0_kref+0x4c4:   	bleu,a,pt	%icc, _kref+0x4c8
	.word	0xd9be188c	! t0_kref+0x4c8:   	stda	%f12, [%i0 + %o4]0xc4
	.word	0x91a00558	! t0_kref+0x4cc:   	fsqrtd	%f24, %f8
	.word	0xaba00134	! t0_kref+0x4d0:   	fabss	%f20, %f21
	.word	0xb1b58c48	! t0_kref+0x4d4:   	fnor	%f22, %f8, %f24
	.word	0xa1a01939	! t0_kref+0x4d8:   	fstod	%f25, %f16
	.word	0xafa348b9	! t0_kref+0x4dc:   	fsubs	%f13, %f25, %f23
	.word	0xa5130009	! t0_kref+0x4e0:   	taddcctv	%o4, %o1, %l2
	.word	0x9fa01a4c	! t0_kref+0x4e4:   	fdtoi	%f12, %f15
	.word	0xe6680019	! t0_kref+0x4e8:   	ldstub	[%g0 + %i1], %l3
	.word	0x8143c000	! t0_kref+0x4ec:   	stbar
	.word	0xe8070019	! t0_kref+0x4f0:   	ld	[%i4 + %i1], %l4
	.word	0x96a83990	! t0_kref+0x4f4:   	andncc	%g0, -0x670, %o3
	.word	0xa0fef22e	! t0_kref+0x4f8:   	sdivcc	%i3, -0xdd2, %l0
	.word	0x36480003	! t0_kref+0x4fc:   	bge,a,pt	%icc, _kref+0x508
	.word	0xaa802aa2	! t0_kref+0x500:   	addcc	%g0, 0xaa2, %l5
	.word	0xa4356da0	! t0_kref+0x504:   	orn	%l5, 0xda0, %l2
	.word	0xaba2c8b7	! t0_kref+0x508:   	fsubs	%f11, %f23, %f21
	.word	0x8143e040	! t0_kref+0x50c:   	membar	0x40
	.word	0xada58832	! t0_kref+0x510:   	fadds	%f22, %f18, %f22
	.word	0xe8200018	! t0_kref+0x514:   	st	%l4, [%g0 + %i0]
	.word	0xee50a004	! t0_kref+0x518:   	ldsh	[%g2 + 4], %l7
	.word	0x81aa0ace	! t0_kref+0x51c:   	fcmped	%fcc0, %f8, %f14
	.word	0x2f1928a4	! t0_kref+0x520:   	sethi	%hi(0x64a29000), %l7
	.word	0x909d0015	! t0_kref+0x524:   	xorcc	%l4, %l5, %o0
	.word	0xe056200c	! t0_kref+0x528:   	ldsh	[%i0 + 0xc], %l0
	.word	0x170af82b	! t0_kref+0x52c:   	sethi	%hi(0x2be0ac00), %o3
	.word	0x91a00548	! t0_kref+0x530:   	fsqrtd	%f8, %f8
	.word	0xe36e401b	! t0_kref+0x534:   	prefetch	%i1 + %i3, 17
	.word	0x26800002	! t0_kref+0x538:   	bl,a	_kref+0x540
	.word	0xa1a0192f	! t0_kref+0x53c:   	fstod	%f15, %f16
	.word	0xe24e8019	! t0_kref+0x540:   	ldsb	[%i2 + %i1], %l1
	.word	0xd608a026	! t0_kref+0x544:   	ldub	[%g2 + 0x26], %o3
	.word	0x2e480005	! t0_kref+0x548:   	bvs,a,pt	%icc, _kref+0x55c
	.word	0xa6a6a9c7	! t0_kref+0x54c:   	subcc	%i2, 0x9c7, %l3
	.word	0x9fa649af	! t0_kref+0x550:   	fdivs	%f25, %f15, %f15
	.word	0xda564000	! t0_kref+0x554:   	ldsh	[%i1], %o5
	.word	0xf3000018	! t0_kref+0x558:   	ld	[%g0 + %i0], %f25
	.word	0x9a0dab57	! t0_kref+0x55c:   	and	%l6, 0xb57, %o5
	call	SYM(t0_subr2)
	.word	0xa716efbe	! t0_kref+0x564:   	taddcctv	%i3, 0xfbe, %l3
	.word	0xb1a00554	! t0_kref+0x568:   	fsqrtd	%f20, %f24
	.word	0x81ae0ad0	! t0_kref+0x56c:   	fcmped	%fcc0, %f24, %f16
	.word	0x9bb3058e	! t0_kref+0x570:   	fcmpgt32	%f12, %f14, %o5
	.word	0x34480001	! t0_kref+0x574:   	bg,a,pt	%icc, _kref+0x578
	.word	0xada000ce	! t0_kref+0x578:   	fnegd	%f14, %f22
	.word	0xd240a004	! t0_kref+0x57c:   	ldsw	[%g2 + 4], %o1
	.word	0x92f5b1f2	! t0_kref+0x580:   	udivcc	%l6, -0xe0e, %o1
	.word	0xd7066008	! t0_kref+0x584:   	ld	[%i1 + 8], %f11
	.word	0x858227b5	! t0_kref+0x588:   	wr	%o0, 0x7b5, %ccr
	.word	0xa5a30838	! t0_kref+0x58c:   	fadds	%f12, %f24, %f18
	.word	0xe800a01c	! t0_kref+0x590:   	ld	[%g2 + 0x1c], %l4
	.word	0x9e3a4008	! t0_kref+0x594:   	xnor	%o1, %o0, %o7
	.word	0xda30a038	! t0_kref+0x598:   	sth	%o5, [%g2 + 0x38]
	.word	0x99a01914	! t0_kref+0x59c:   	fitod	%f20, %f12
	.word	0x90bd6f6d	! t0_kref+0x5a0:   	xnorcc	%l5, 0xf6d, %o0
	.word	0xa29e800c	! t0_kref+0x5a4:   	xorcc	%i2, %o4, %l1
	.word	0x8143e040	! t0_kref+0x5a8:   	membar	0x40
	.word	0x20800006	! t0_kref+0x5ac:   	bn,a	_kref+0x5c4
	.word	0x93a0188c	! t0_kref+0x5b0:   	fitos	%f12, %f9
	.word	0xa216800c	! t0_kref+0x5b4:   	or	%i2, %o4, %l1
	.word	0x91b28718	! t0_kref+0x5b8:   	fmuld8sux16	%f10, %f24, %f8
	.word	0x93a00536	! t0_kref+0x5bc:   	fsqrts	%f22, %f9
	.word	0xee262010	! t0_kref+0x5c0:   	st	%l7, [%i0 + 0x10]
	.word	0x9ba308b9	! t0_kref+0x5c4:   	fsubs	%f12, %f25, %f13
	.word	0xac824009	! t0_kref+0x5c8:   	addcc	%o1, %o1, %l6
	.word	0x91b60454	! t0_kref+0x5cc:   	fcmpne16	%f24, %f20, %o0
	.word	0xada448aa	! t0_kref+0x5d0:   	fsubs	%f17, %f10, %f22
	.word	0xa144c000	! t0_kref+0x5d4:   	mov	%gsr, %l0
	.word	0xa5a5c9b2	! t0_kref+0x5d8:   	fdivs	%f23, %f18, %f18
	.word	0x9815000a	! t0_kref+0x5dc:   	or	%l4, %o2, %o4
	.word	0x95a01a34	! t0_kref+0x5e0:   	fstoi	%f20, %f10
	.word	0x27800004	! t0_kref+0x5e4:   	fbul,a	_kref+0x5f4
	.word	0xeb263fe8	! t0_kref+0x5e8:   	st	%f21, [%i0 - 0x18]
	.word	0xda10a034	! t0_kref+0x5ec:   	lduh	[%g2 + 0x34], %o5
	.word	0x96082c77	! t0_kref+0x5f0:   	and	%g0, 0xc77, %o3
	.word	0xa436a865	! t0_kref+0x5f4:   	orn	%i2, 0x865, %l2
	.word	0xa9a24d2b	! t0_kref+0x5f8:   	fsmuld	%f9, %f11, %f20
	.word	0xe53e7ff8	! t0_kref+0x5fc:   	std	%f18, [%i1 - 8]
	.word	0x81ac0a2b	! t0_kref+0x600:   	fcmps	%fcc0, %f16, %f11
	.word	0xe16e001a	! t0_kref+0x604:   	prefetch	%i0 + %i2, 16
	.word	0xa7a01896	! t0_kref+0x608:   	fitos	%f22, %f19
	.word	0x9da0190e	! t0_kref+0x60c:   	fitod	%f14, %f14
	.word	0x91a01939	! t0_kref+0x610:   	fstod	%f25, %f8
	.word	0x9fa5c8b8	! t0_kref+0x614:   	fsubs	%f23, %f24, %f15
	.word	0xa1b50c6d	! t0_kref+0x618:   	fnors	%f20, %f13, %f16
	.word	0xab228015	! t0_kref+0x61c:   	mulscc	%o2, %l5, %l5
	.word	0xa2920014	! t0_kref+0x620:   	orcc	%o0, %l4, %l1
	.word	0x9db30a4c	! t0_kref+0x624:   	fpadd32	%f12, %f12, %f14
	.word	0x91a0188a	! t0_kref+0x628:   	fitos	%f10, %f8
	.word	0x87802080	! t0_kref+0x62c:   	mov	0x80, %asi
	.word	0xa7a01a29	! t0_kref+0x630:   	fstoi	%f9, %f19
	.word	0x98fec00d	! t0_kref+0x634:   	sdivcc	%i3, %o5, %o4
	.word	0x9efdb646	! t0_kref+0x638:   	sdivcc	%l6, -0x9ba, %o7
	.word	0x81adcab9	! t0_kref+0x63c:   	fcmpes	%fcc0, %f23, %f25
	.word	0xc1e6500c	! t0_kref+0x640:   	casa	[%i1]0x80, %o4, %g0
	.word	0xaea30017	! t0_kref+0x644:   	subcc	%o4, %l7, %l7
	.word	0x96b53a88	! t0_kref+0x648:   	orncc	%l4, -0x578, %o3
	.word	0x35800003	! t0_kref+0x64c:   	fbue,a	_kref+0x658
	.word	0xe24e6003	! t0_kref+0x650:   	ldsb	[%i1 + 3], %l1
	.word	0xdede1000	! t0_kref+0x654:   	ldxa	[%i0]0x80, %o7
	.word	0x9fc10000	! t0_kref+0x658:   	call	%g4
	.word	0x9bb48408	! t0_kref+0x65c:   	fcmple16	%f18, %f8, %o5
	.word	0xea6e8019	! t0_kref+0x660:   	ldstub	[%i2 + %i1], %l5
	.word	0xdaa8a036	! t0_kref+0x664:   	stba	%o5, [%g2 + 0x36]%asi
	.word	0xd6566008	! t0_kref+0x668:   	ldsh	[%i1 + 8], %o3
	.word	0x9bb00c20	! t0_kref+0x66c:   	fzeros	%f13
	.word	0x9418001a	! t0_kref+0x670:   	xor	%g0, %i2, %o2
	.word	0xd9180019	! t0_kref+0x674:   	ldd	[%g0 + %i1], %f12
	.word	0x81ad0a35	! t0_kref+0x678:   	fcmps	%fcc0, %f20, %f21
	.word	0xd9be1a5c	! t0_kref+0x67c:   	stda	%f12, [%i0 + %i4]0xd2
	.word	0xa3a01a4a	! t0_kref+0x680:   	fdtoi	%f10, %f17
	.word	0x980d801a	! t0_kref+0x684:   	and	%l6, %i2, %o4
	.word	0x24800005	! t0_kref+0x688:   	ble,a	_kref+0x69c
	.word	0xe41e0000	! t0_kref+0x68c:   	ldd	[%i0], %l2
	.word	0x9ba01a58	! t0_kref+0x690:   	fdtoi	%f24, %f13
	.word	0xef68a04a	! t0_kref+0x694:   	prefetch	%g2 + 0x4a, 23
	.word	0x1f2a8ac1	! t0_kref+0x698:   	sethi	%hi(0xaa2b0400), %o7
	.word	0xdd066000	! t0_kref+0x69c:   	ld	[%i1], %f14
	.word	0xaab54015	! t0_kref+0x6a0:   	orncc	%l5, %l5, %l5
	.word	0x99a588b5	! t0_kref+0x6a4:   	fsubs	%f22, %f21, %f12
	.word	0x81ae0a4c	! t0_kref+0x6a8:   	fcmpd	%fcc0, %f24, %f12
	.word	0x91a01937	! t0_kref+0x6ac:   	fstod	%f23, %f8
	.word	0xec500018	! t0_kref+0x6b0:   	ldsh	[%g0 + %i0], %l6
	.word	0xd1267fec	! t0_kref+0x6b4:   	st	%f8, [%i1 - 0x14]
	.word	0xe68e501a	! t0_kref+0x6b8:   	lduba	[%i1 + %i2]0x80, %l3
	.word	0xe76e7ff8	! t0_kref+0x6bc:   	prefetch	%i1 - 8, 19
	.word	0xb1a40958	! t0_kref+0x6c0:   	fmuld	%f16, %f24, %f24
	.word	0x2d800006	! t0_kref+0x6c4:   	fbg,a	_kref+0x6dc
	.word	0xa5b30750	! t0_kref+0x6c8:   	fpack32	%f12, %f16, %f18
	.word	0xaa054014	! t0_kref+0x6cc:   	add	%l5, %l4, %l5
	.word	0x93a509aa	! t0_kref+0x6d0:   	fdivs	%f20, %f10, %f9
	.word	0xa9b40a12	! t0_kref+0x6d4:   	fpadd16	%f16, %f18, %f20
	.word	0x3a800003	! t0_kref+0x6d8:   	bcc,a	_kref+0x6e4
	.word	0xee4e001a	! t0_kref+0x6dc:   	ldsb	[%i0 + %i2], %l7
	.word	0xa5b28008	! t0_kref+0x6e0:   	edge8	%o2, %o0, %l2
	.word	0x9fa5082a	! t0_kref+0x6e4:   	fadds	%f20, %f10, %f15
	.word	0xaef2c008	! t0_kref+0x6e8:   	udivcc	%o3, %o0, %l7
	.word	0xa43830a5	! t0_kref+0x6ec:   	xnor	%g0, -0xf5b, %l2
	.word	0x98424016	! t0_kref+0x6f0:   	addc	%o1, %l6, %o4
	.word	0xc807bff0	! t0_kref+0x6f4:   	ld	[%fp - 0x10], %g4
	.word	0x93a01092	! t0_kref+0x6f8:   	fxtos	%f18, %f9
	.word	0xe51e3fe8	! t0_kref+0x6fc:   	ldd	[%i0 - 0x18], %f18
	.word	0xaba2c8ac	! t0_kref+0x700:   	fsubs	%f11, %f12, %f21
	.word	0x91a0054c	! t0_kref+0x704:   	fsqrtd	%f12, %f8
	.word	0x99b00f39	! t0_kref+0x708:   	fsrc2s	%f25, %f12
	.word	0x983d4016	! t0_kref+0x70c:   	xnor	%l5, %l6, %o4
	.word	0x99a01a50	! t0_kref+0x710:   	fdtoi	%f16, %f12
	.word	0xd8d0a026	! t0_kref+0x714:   	ldsha	[%g2 + 0x26]%asi, %o4
	.word	0x8d82401b	! t0_kref+0x718:   	wr	%o1, %i3, %fprs
	.word	0x91b5c679	! t0_kref+0x71c:   	fmul8x16au	%f23, %f25, %f8
	.word	0xaa12f307	! t0_kref+0x720:   	or	%o3, -0xcf9, %l5
	.word	0x972b000b	! t0_kref+0x724:   	sll	%o4, %o3, %o3
	.word	0xe0566012	! t0_kref+0x728:   	ldsh	[%i1 + 0x12], %l0
	.word	0xd84e001a	! t0_kref+0x72c:   	ldsb	[%i0 + %i2], %o4
	.word	0x9abac00d	! t0_kref+0x730:   	xnorcc	%o3, %o5, %o5
	.word	0xe3266010	! t0_kref+0x734:   	st	%f17, [%i1 + 0x10]
	.word	0xd836001b	! t0_kref+0x738:   	sth	%o4, [%i0 + %i3]
	.word	0x95a3082d	! t0_kref+0x73c:   	fadds	%f12, %f13, %f10
	.word	0x94500008	! t0_kref+0x740:   	umul	%g0, %o0, %o2
	.word	0x81aa4ab3	! t0_kref+0x744:   	fcmpes	%fcc0, %f9, %f19
	.word	0xa7a00139	! t0_kref+0x748:   	fabss	%f25, %f19
	.word	0x9725801a	! t0_kref+0x74c:   	mulscc	%l6, %i2, %o3
	.word	0x86102001	! t0_kref+0x750:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x754:   	bne,a	_kref+0x754
	.word	0x86a0e001	! t0_kref+0x758:   	subcc	%g3, 1, %g3
	.word	0xc0270018	! t0_kref+0x75c:   	clr	[%i4 + %i0]
	.word	0x81ad0acc	! t0_kref+0x760:   	fcmped	%fcc0, %f20, %f12
	.word	0x9af6f4bd	! t0_kref+0x764:   	udivcc	%i3, -0xb43, %o5
	.word	0x81ab0acc	! t0_kref+0x768:   	fcmped	%fcc0, %f12, %f12
	.word	0xe07961dc	! t0_kref+0x76c:   	swap	[%g5 + 0x1dc], %l0
	.word	0xd4000019	! t0_kref+0x770:   	ld	[%g0 + %i1], %o2
	.word	0xa432001b	! t0_kref+0x774:   	orn	%o0, %i3, %l2
	.word	0xac2b0017	! t0_kref+0x778:   	andn	%o4, %l7, %l6
	.word	0xa5a60948	! t0_kref+0x77c:   	fmuld	%f24, %f8, %f18
	.word	0xecc8a03c	! t0_kref+0x780:   	ldsba	[%g2 + 0x3c]%asi, %l6
	.word	0x980dc017	! t0_kref+0x784:   	and	%l7, %l7, %o4
	.word	0xd6200019	! t0_kref+0x788:   	st	%o3, [%g0 + %i1]
	.word	0xe0963ff8	! t0_kref+0x78c:   	lduha	[%i0 - 8]%asi, %l0
	.word	0xa4f2a8b2	! t0_kref+0x790:   	udivcc	%o2, 0x8b2, %l2
	.word	0xa8c2c00b	! t0_kref+0x794:   	addccc	%o3, %o3, %l4
	.word	0x9a834015	! t0_kref+0x798:   	addcc	%o5, %l5, %o5
	.word	0xa6b27253	! t0_kref+0x79c:   	orncc	%o1, -0xdad, %l3
	.word	0xada00548	! t0_kref+0x7a0:   	fsqrtd	%f8, %f22
	.word	0x213618ca	! t0_kref+0x7a4:   	sethi	%hi(0xd8632800), %l0
	.word	0xeff61008	! t0_kref+0x7a8:   	casxa	[%i0]0x80, %o0, %l7
	.word	0xa9a00534	! t0_kref+0x7ac:   	fsqrts	%f20, %f20
	.word	0xc1e8a084	! t0_kref+0x7b0:   	prefetcha	%g2 + 0x84, 0
	.word	0xc020a010	! t0_kref+0x7b4:   	clr	[%g2 + 0x10]
	.word	0xa1a00132	! t0_kref+0x7b8:   	fabss	%f18, %f16
	.word	0x9da01932	! t0_kref+0x7bc:   	fstod	%f18, %f14
	.word	0x81dd4019	! t0_kref+0x7c0:   	flush	%l5 + %i1
	.word	0xe6563fe6	! t0_kref+0x7c4:   	ldsh	[%i0 - 0x1a], %l3
	.word	0xaa65f190	! t0_kref+0x7c8:   	subc	%l7, -0xe70, %l5
	.word	0xe7270019	! t0_kref+0x7cc:   	st	%f19, [%i4 + %i1]
	.word	0x91b40a12	! t0_kref+0x7d0:   	fpadd16	%f16, %f18, %f8
	.word	0x97a00038	! t0_kref+0x7d4:   	fmovs	%f24, %f11
	.word	0xe290a030	! t0_kref+0x7d8:   	lduha	[%g2 + 0x30]%asi, %l1
	.word	0xada01896	! t0_kref+0x7dc:   	fitos	%f22, %f22
	.word	0xa715f5be	! t0_kref+0x7e0:   	taddcctv	%l7, -0xa42, %l3
	.word	0x95a00052	! t0_kref+0x7e4:   	fmovd	%f18, %f10
	.word	0xea30a026	! t0_kref+0x7e8:   	sth	%l5, [%g2 + 0x26]
	.word	0x24480003	! t0_kref+0x7ec:   	ble,a,pt	%icc, _kref+0x7f8
	.word	0x9012400d	! t0_kref+0x7f0:   	or	%o1, %o5, %o0
	.word	0x24480003	! t0_kref+0x7f4:   	ble,a,pt	%icc, _kref+0x800
	.word	0xd828a02f	! t0_kref+0x7f8:   	stb	%o4, [%g2 + 0x2f]
	.word	0xadb54280	! t0_kref+0x7fc:   	array32	%l5, %g0, %l6
	.word	0xa4b52ef3	! t0_kref+0x800:   	orncc	%l4, 0xef3, %l2
	.word	0x9da4894a	! t0_kref+0x804:   	fmuld	%f18, %f10, %f14
	.word	0xadb50596	! t0_kref+0x808:   	fcmpgt32	%f20, %f22, %l6
	.word	0xde500018	! t0_kref+0x80c:   	ldsh	[%g0 + %i0], %o7
	.word	0xec00a020	! t0_kref+0x810:   	ld	[%g2 + 0x20], %l6
	.word	0xd920a00c	! t0_kref+0x814:   	st	%f12, [%g2 + 0xc]
	.word	0x8143c000	! t0_kref+0x818:   	stbar
	.word	0x9da01889	! t0_kref+0x81c:   	fitos	%f9, %f14
	.word	0xa0a58016	! t0_kref+0x820:   	subcc	%l6, %l6, %l0
	.word	0xada0004c	! t0_kref+0x824:   	fmovd	%f12, %f22
	.word	0xeaa8a005	! t0_kref+0x828:   	stba	%l5, [%g2 + 5]%asi
	.word	0x81820000	! t0_kref+0x82c:   	wr	%o0, %g0, %y
	.word	0xe7066008	! t0_kref+0x830:   	ld	[%i1 + 8], %f19
	.word	0x81858000	! t0_kref+0x834:   	wr	%l6, %g0, %y
	.word	0xd448a003	! t0_kref+0x838:   	ldsb	[%g2 + 3], %o2
	.word	0xd0c8a00e	! t0_kref+0x83c:   	ldsba	[%g2 + 0xe]%asi, %o0
	.word	0x91a208b0	! t0_kref+0x840:   	fsubs	%f8, %f16, %f8
	.word	0x9db6462c	! t0_kref+0x844:   	fmul8x16	%f25, %f12, %f14
	.word	0xa8b5c017	! t0_kref+0x848:   	orncc	%l7, %l7, %l4
	.word	0x9db4070a	! t0_kref+0x84c:   	fmuld8sux16	%f16, %f10, %f14
	.word	0xa1a00129	! t0_kref+0x850:   	fabss	%f9, %f16
	.word	0xa7a01a2c	! t0_kref+0x854:   	fstoi	%f12, %f19
	.word	0x93b00ce9	! t0_kref+0x858:   	fnot2s	%f9, %f9
	.word	0xa5a50d2e	! t0_kref+0x85c:   	fsmuld	%f20, %f14, %f18
	call	SYM(t0_subr1)
	.word	0xedbe3fe0	! t0_kref+0x864:   	stda	%f22, [%i0 - 0x20]%asi
	.word	0x9fb34dad	! t0_kref+0x868:   	fxors	%f13, %f13, %f15
	.word	0xa2b3400c	! t0_kref+0x86c:   	orncc	%o5, %o4, %l1
	.word	0xa7b54fb7	! t0_kref+0x870:   	fors	%f21, %f23, %f19
	.word	0xef6e001d	! t0_kref+0x874:   	prefetch	%i0 + %i5, 23
	.word	0xea563ff8	! t0_kref+0x878:   	ldsh	[%i0 - 8], %l5
	.word	0x91b20c58	! t0_kref+0x87c:   	fnor	%f8, %f24, %f8
	.word	0x81aacaaa	! t0_kref+0x880:   	fcmpes	%fcc0, %f11, %f10
	.word	0x99a0054a	! t0_kref+0x884:   	fsqrtd	%f10, %f12
	.word	0x99b34718	! t0_kref+0x888:   	fmuld8sux16	%f13, %f24, %f12
	.word	0xe416c018	! t0_kref+0x88c:   	lduh	[%i3 + %i0], %l2
	.word	0xb1a0054a	! t0_kref+0x890:   	fsqrtd	%f10, %f24
	.word	0xf3264000	! t0_kref+0x894:   	st	%f25, [%i1]
	.word	0xada0054e	! t0_kref+0x898:   	fsqrtd	%f14, %f22
	.word	0x942b6742	! t0_kref+0x89c:   	andn	%o5, 0x742, %o2
	.word	0xd700a000	! t0_kref+0x8a0:   	ld	[%g2], %f11
	.word	0x8143c000	! t0_kref+0x8a4:   	stbar
	.word	0x952ec00c	! t0_kref+0x8a8:   	sll	%i3, %o4, %o2
	.word	0xa5a5c9b5	! t0_kref+0x8ac:   	fdivs	%f23, %f21, %f18
	.word	0xa5b4048e	! t0_kref+0x8b0:   	fcmple32	%f16, %f14, %l2
	.word	0xc36e4016	! t0_kref+0x8b4:   	prefetch	%i1 + %l6, 1
	.word	0xa8b6801b	! t0_kref+0x8b8:   	orncc	%i2, %i3, %l4
	.word	0xa5a0054c	! t0_kref+0x8bc:   	fsqrtd	%f12, %f18
	.word	0x1b2f3ee9	! t0_kref+0x8c0:   	sethi	%hi(0xbcfba400), %o5
	.word	0xe1067fe0	! t0_kref+0x8c4:   	ld	[%i1 - 0x20], %f16
	.word	0x2f800001	! t0_kref+0x8c8:   	fbu,a	_kref+0x8cc
	.word	0xa486a5c7	! t0_kref+0x8cc:   	addcc	%i2, 0x5c7, %l2
	.word	0xac9a401b	! t0_kref+0x8d0:   	xorcc	%o1, %i3, %l6
	.word	0xe8f6501d	! t0_kref+0x8d4:   	stxa	%l4, [%i1 + %i5]0x80
	.word	0x20800004	! t0_kref+0x8d8:   	bn,a	_kref+0x8e8
	.word	0xa1b48f4c	! t0_kref+0x8dc:   	fornot1	%f18, %f12, %f16
	.word	0xf16e6018	! t0_kref+0x8e0:   	prefetch	%i1 + 0x18, 24
	.word	0xdfa6201c	! t0_kref+0x8e4:   	sta	%f15, [%i0 + 0x1c]%asi
	.word	0xd2567ff0	! t0_kref+0x8e8:   	ldsh	[%i1 - 0x10], %o1
	.word	0xd2363fe0	! t0_kref+0x8ec:   	sth	%o1, [%i0 - 0x20]
	.word	0x8143c000	! t0_kref+0x8f0:   	stbar
	.word	0xa6b2c015	! t0_kref+0x8f4:   	orncc	%o3, %l5, %l3
	.word	0x922ac00a	! t0_kref+0x8f8:   	andn	%o3, %o2, %o1
	.word	0xb1a58856	! t0_kref+0x8fc:   	faddd	%f22, %f22, %f24
	.word	0xe320a018	! t0_kref+0x900:   	st	%f17, [%g2 + 0x18]
	.word	0xb1a0002d	! t0_kref+0x904:   	fmovs	%f13, %f24
	.word	0xec78a02c	! t0_kref+0x908:   	swap	[%g2 + 0x2c], %l6
	.word	0x9e12c016	! t0_kref+0x90c:   	or	%o3, %l6, %o7
	.word	0x32800008	! t0_kref+0x910:   	bne,a	_kref+0x930
	.word	0xda567ff8	! t0_kref+0x914:   	ldsh	[%i1 - 8], %o5
	.word	0xd850a028	! t0_kref+0x918:   	ldsh	[%g2 + 0x28], %o4
	.word	0x99a54d31	! t0_kref+0x91c:   	fsmuld	%f21, %f17, %f12
	.word	0xec563fec	! t0_kref+0x920:   	ldsh	[%i0 - 0x14], %l6
	.word	0xfa316a2c	! t0_kref+0x924:   	sth	%i5, [%g5 + 0xa2c]
	.word	0xadb38c56	! t0_kref+0x928:   	fnor	%f14, %f22, %f22
	.word	0xeb6e001d	! t0_kref+0x92c:   	prefetch	%i0 + %i5, 21
	.word	0xa5b54fae	! t0_kref+0x930:   	fors	%f21, %f14, %f18
	.word	0xf5ee101c	! t0_kref+0x934:   	prefetcha	%i0 + %i4, 26
	.word	0x9da00548	! t0_kref+0x938:   	fsqrtd	%f8, %f14
	.word	0xe91e2008	! t0_kref+0x93c:   	ldd	[%i0 + 8], %f20
	.word	0xe3267ff4	! t0_kref+0x940:   	st	%f17, [%i1 - 0xc]
	.word	0x97a01a4a	! t0_kref+0x944:   	fdtoi	%f10, %f11
	.word	0xc168a00c	! t0_kref+0x948:   	prefetch	%g2 + 0xc, 0
	.word	0xe080a030	! t0_kref+0x94c:   	lda	[%g2 + 0x30]%asi, %l0
	.word	0xb3a01a2c	! t0_kref+0x950:   	fstoi	%f12, %f25
	.word	0xac42800b	! t0_kref+0x954:   	addc	%o2, %o3, %l6
	.word	0xada0002d	! t0_kref+0x958:   	fmovs	%f13, %f22
	.word	0x96f5000a	! t0_kref+0x95c:   	udivcc	%l4, %o2, %o3
	.word	0xe611401b	! t0_kref+0x960:   	lduh	[%g5 + %i3], %l3
	.word	0x9de3bfa0	! t0_kref+0x964:   	save	%sp, -0x60, %sp
	.word	0xb106b425	! t0_kref+0x968:   	taddcc	%i2, -0xbdb, %i0
	.word	0xabee717e	! t0_kref+0x96c:   	restore	%i1, -0xe82, %l5
	.word	0xa8ada22f	! t0_kref+0x970:   	andncc	%l6, 0x22f, %l4
	.word	0x9e2334aa	! t0_kref+0x974:   	sub	%o4, -0xb56, %o7
	.word	0xa80ab9a1	! t0_kref+0x978:   	and	%o2, -0x65f, %l4
	.word	0xb1b20a50	! t0_kref+0x97c:   	fpadd32	%f8, %f16, %f24
	.word	0x27800008	! t0_kref+0x980:   	fbul,a	_kref+0x9a0
	.word	0xeeb0a002	! t0_kref+0x984:   	stha	%l7, [%g2 + 2]%asi
	.word	0x95a01a48	! t0_kref+0x988:   	fdtoi	%f8, %f10
	.word	0xa3a34831	! t0_kref+0x98c:   	fadds	%f13, %f17, %f17
	.word	0x9965c014	! t0_kref+0x990:   	movvs	%icc, %l4, %o4
	.word	0xe51e3fe0	! t0_kref+0x994:   	ldd	[%i0 - 0x20], %f18
	.word	0xe89e101d	! t0_kref+0x998:   	ldda	[%i0 + %i5]0x80, %l4
	.word	0xd2263ffc	! t0_kref+0x99c:   	st	%o1, [%i0 - 4]
	.word	0xe56e6000	! t0_kref+0x9a0:   	prefetch	%i1, 18
	.word	0xad224017	! t0_kref+0x9a4:   	mulscc	%o1, %l7, %l6
	.word	0xe6780018	! t0_kref+0x9a8:   	swap	[%g0 + %i0], %l3
	.word	0xd2300018	! t0_kref+0x9ac:   	sth	%o1, [%g0 + %i0]
	.word	0xb3a00130	! t0_kref+0x9b0:   	fabss	%f16, %f25
	.word	0x9db5ca69	! t0_kref+0x9b4:   	fpadd32s	%f23, %f9, %f14
	.word	0x95b00fc0	! t0_kref+0x9b8:   	fone	%f10
	.word	0xd4f67ff8	! t0_kref+0x9bc:   	stxa	%o2, [%i1 - 8]%asi
	.word	0x988b6e51	! t0_kref+0x9c0:   	andcc	%o5, 0xe51, %o4
	.word	0xea80a020	! t0_kref+0x9c4:   	lda	[%g2 + 0x20]%asi, %l5
	.word	0xe1e8a006	! t0_kref+0x9c8:   	prefetcha	%g2 + 6, 16
	.word	0xf4367ffe	! t0_kref+0x9cc:   	sth	%i2, [%i1 - 2]
	.word	0x2e480002	! t0_kref+0x9d0:   	bvs,a,pt	%icc, _kref+0x9d8
	.word	0xe9262008	! t0_kref+0x9d4:   	st	%f20, [%i0 + 8]
	.word	0xd84e4000	! t0_kref+0x9d8:   	ldsb	[%i1], %o4
	.word	0xada2c82a	! t0_kref+0x9dc:   	fadds	%f11, %f10, %f22
	.word	0xd020a00c	! t0_kref+0x9e0:   	st	%o0, [%g2 + 0xc]
	.word	0xaeb6f13a	! t0_kref+0x9e4:   	orncc	%i3, -0xec6, %l7
	.word	0x983dc000	! t0_kref+0x9e8:   	not	%l7, %o4
	.word	0xe1263ffc	! t0_kref+0x9ec:   	st	%f16, [%i0 - 4]
	.word	0x97203f41	! t0_kref+0x9f0:   	mulscc	%g0, -0xbf, %o3
	.word	0xd46e6006	! t0_kref+0x9f4:   	ldstub	[%i1 + 6], %o2
	.word	0xa1b50a0e	! t0_kref+0x9f8:   	fpadd16	%f20, %f14, %f16
	.word	0xada00548	! t0_kref+0x9fc:   	fsqrtd	%f8, %f22
	.word	0xd2262010	! t0_kref+0xa00:   	st	%o1, [%i0 + 0x10]
	.word	0xada0190f	! t0_kref+0xa04:   	fitod	%f15, %f22
	.word	0xa62dfaea	! t0_kref+0xa08:   	andn	%l7, -0x516, %l3
	.word	0x99b5035b	! t0_kref+0xa0c:   	alignaddrl	%l4, %i3, %o4
	.word	0x93a01a48	! t0_kref+0xa10:   	fdtoi	%f8, %f9
	.word	0x982a0009	! t0_kref+0xa14:   	andn	%o0, %o1, %o4
	.word	0xf4a8a035	! t0_kref+0xa18:   	stba	%i2, [%g2 + 0x35]%asi
	.word	0xa5b00cd4	! t0_kref+0xa1c:   	fnot2	%f20, %f18
	.word	0xaba3c838	! t0_kref+0xa20:   	fadds	%f15, %f24, %f21
	.word	0xadb50fb7	! t0_kref+0xa24:   	fors	%f20, %f23, %f22
	.word	0x81ad4a34	! t0_kref+0xa28:   	fcmps	%fcc0, %f21, %f20
	.word	0xa3a3c8b1	! t0_kref+0xa2c:   	fsubs	%f15, %f17, %f17
	.word	0xea2e8019	! t0_kref+0xa30:   	stb	%l5, [%i2 + %i1]
	.word	0xa1a44830	! t0_kref+0xa34:   	fadds	%f17, %f16, %f16
	.word	0x97b34fb1	! t0_kref+0xa38:   	fors	%f13, %f17, %f11
	.word	0xda162012	! t0_kref+0xa3c:   	lduh	[%i0 + 0x12], %o5
	.word	0xe16e3fe0	! t0_kref+0xa40:   	prefetch	%i0 - 0x20, 16
	.word	0xaab2401b	! t0_kref+0xa44:   	orncc	%o1, %i3, %l5
	.word	0x94b2c015	! t0_kref+0xa48:   	orncc	%o3, %l5, %o2
	.word	0x98d2c014	! t0_kref+0xa4c:   	umulcc	%o3, %l4, %o4
	.word	0xd7070005	! t0_kref+0xa50:   	ld	[%i4 + %g5], %f11
	.word	0xd0a8a03f	! t0_kref+0xa54:   	stba	%o0, [%g2 + 0x3f]%asi
	.word	0x9da20948	! t0_kref+0xa58:   	fmuld	%f8, %f8, %f14
	.word	0x99b30914	! t0_kref+0xa5c:   	faligndata	%f12, %f20, %f12
	.word	0x99a548b2	! t0_kref+0xa60:   	fsubs	%f21, %f18, %f12
	.word	0x91b28992	! t0_kref+0xa64:   	bshuffle	%f10, %f18, %f8
	.word	0x905ac00b	! t0_kref+0xa68:   	smul	%o3, %o3, %o0
	.word	0x34800002	! t0_kref+0xa6c:   	bg,a	_kref+0xa74
	.word	0x9da01933	! t0_kref+0xa70:   	fstod	%f19, %f14
	.word	0xaa8d000a	! t0_kref+0xa74:   	andcc	%l4, %o2, %l5
	.word	0xafa00030	! t0_kref+0xa78:   	fmovs	%f16, %f23
	.word	0x912ec008	! t0_kref+0xa7c:   	sll	%i3, %o0, %o0
	.word	0x95a50954	! t0_kref+0xa80:   	fmuld	%f20, %f20, %f10
	.word	0x9de3bfa0	! t0_kref+0xa84:   	save	%sp, -0x60, %sp
	.word	0x91ef762e	! t0_kref+0xa88:   	restore	%i5, -0x9d2, %o0
	.word	0xef80a010	! t0_kref+0xa8c:   	lda	[%g2 + 0x10]%asi, %f23
	.word	0xf1180018	! t0_kref+0xa90:   	ldd	[%g0 + %i0], %f24
	.word	0xa5b50496	! t0_kref+0xa94:   	fcmple32	%f20, %f22, %l2
	.word	0xc36e0014	! t0_kref+0xa98:   	prefetch	%i0 + %l4, 1
	.word	0x32800001	! t0_kref+0xa9c:   	bne,a	_kref+0xaa0
	.word	0xa6f24009	! t0_kref+0xaa0:   	udivcc	%o1, %o1, %l3
	.word	0x95a0054c	! t0_kref+0xaa4:   	fsqrtd	%f12, %f10
	.word	0x92a24009	! t0_kref+0xaa8:   	subcc	%o1, %o1, %o1
	.word	0x2b800008	! t0_kref+0xaac:   	fbug,a	_kref+0xacc
	.word	0x99b009b8	! t0_kref+0xab0:   	fexpand	%f24, %f12
	.word	0xa8b52f31	! t0_kref+0xab4:   	orncc	%l4, 0xf31, %l4
	.word	0x81aa4aac	! t0_kref+0xab8:   	fcmpes	%fcc0, %f9, %f12
	.word	0xaae3000c	! t0_kref+0xabc:   	subccc	%o4, %o4, %l5
	.word	0x99b38d14	! t0_kref+0xac0:   	fandnot1	%f14, %f20, %f12
	.word	0xd1200019	! t0_kref+0xac4:   	st	%f8, [%g0 + %i1]
	.word	0xd5070018	! t0_kref+0xac8:   	ld	[%i4 + %i0], %f10
	.word	0x95b000c0	! t0_kref+0xacc:   	edge16l	%g0, %g0, %o2
	.word	0xdd267fe8	! t0_kref+0xad0:   	st	%f14, [%i1 - 0x18]
	.word	0xadb3430b	! t0_kref+0xad4:   	alignaddr	%o5, %o3, %l6
	.word	0x86102009	! t0_kref+0xad8:   	mov	0x9, %g3
	.word	0x86a0e001	! t0_kref+0xadc:   	subcc	%g3, 1, %g3
	.word	0x22800018	! t0_kref+0xae0:   	be,a	_kref+0xb40
	.word	0x920ec00d	! t0_kref+0xae4:   	and	%i3, %o5, %o1
	.word	0x2dbffffd	! t0_kref+0xae8:   	fbg,a	_kref+0xadc
	.word	0xaa92afc9	! t0_kref+0xaec:   	orcc	%o2, 0xfc9, %l5
	.word	0xee4e600a	! t0_kref+0xaf0:   	ldsb	[%i1 + 0xa], %l7
	.word	0x90137ea5	! t0_kref+0xaf4:   	or	%o5, -0x15b, %o0
	.word	0x2fbffff9	! t0_kref+0xaf8:   	fbu,a	_kref+0xadc
	.word	0xb3a01a2d	! t0_kref+0xafc:   	fstoi	%f13, %f25
	.word	0x97418000	! t0_kref+0xb00:   	mov	%fprs, %o3
	.word	0xd44e8019	! t0_kref+0xb04:   	ldsb	[%i2 + %i1], %o2
	.word	0xda56c019	! t0_kref+0xb08:   	ldsh	[%i3 + %i1], %o5
	.word	0x9fb28f69	! t0_kref+0xb0c:   	fornot1s	%f10, %f9, %f15
	.word	0xafa508b7	! t0_kref+0xb10:   	fsubs	%f20, %f23, %f23
	.word	0x9ead66de	! t0_kref+0xb14:   	andncc	%l5, 0x6de, %o7
	.word	0xe46e8019	! t0_kref+0xb18:   	ldstub	[%i2 + %i1], %l2
	.word	0xd19e1a1c	! t0_kref+0xb1c:   	ldda	[%i0 + %i4]0xd0, %f8
	.word	0xae56e26d	! t0_kref+0xb20:   	umul	%i3, 0x26d, %l7
	.word	0xada3884e	! t0_kref+0xb24:   	faddd	%f14, %f14, %f22
	.word	0x250d7707	! t0_kref+0xb28:   	sethi	%hi(0x35dc1c00), %l2
	.word	0xa312401a	! t0_kref+0xb2c:   	taddcctv	%o1, %i2, %l1
	.word	0xe2680019	! t0_kref+0xb30:   	ldstub	[%g0 + %i1], %l1
	.word	0xd93e6000	! t0_kref+0xb34:   	std	%f12, [%i1]
	.word	0x9fb5407a	! t0_kref+0xb38:   	edge8ln	%l5, %i2, %o7
	.word	0xd246401c	! t0_kref+0xb3c:   	ldsw	[%i1 + %i4], %o1
	.word	0x8143c000	! t0_kref+0xb40:   	stbar
	.word	0xa1b2c148	! t0_kref+0xb44:   	edge32l	%o3, %o0, %l0
	.word	0xd24e200e	! t0_kref+0xb48:   	ldsb	[%i0 + 0xe], %o1
	.word	0x97408000	! t0_kref+0xb4c:   	mov	%ccr, %o3
	.word	0x3b800006	! t0_kref+0xb50:   	fble,a	_kref+0xb68
	.word	0xc12e001c	! t0_kref+0xb54:   	st	%fsr, [%i0 + %i4]
	.word	0x9da01929	! t0_kref+0xb58:   	fstod	%f9, %f14
	.word	0xe3200019	! t0_kref+0xb5c:   	st	%f17, [%g0 + %i1]
	.word	0xa40d0017	! t0_kref+0xb60:   	and	%l4, %l7, %l2
	.word	0xe53e401d	! t0_kref+0xb64:   	std	%f18, [%i1 + %i5]
	.word	0xafb5ca28	! t0_kref+0xb68:   	fpadd16s	%f23, %f8, %f23
	.word	0xabb38a71	! t0_kref+0xb6c:   	fpadd32s	%f14, %f17, %f21
	.word	0xab2a000b	! t0_kref+0xb70:   	sll	%o0, %o3, %l5
	.word	0x90f0000d	! t0_kref+0xb74:   	udivcc	%g0, %o5, %o0
	.word	0xed80a018	! t0_kref+0xb78:   	lda	[%g2 + 0x18]%asi, %f22
	.word	0xa6982929	! t0_kref+0xb7c:   	xorcc	%g0, 0x929, %l3
	.word	0xa9b30994	! t0_kref+0xb80:   	bshuffle	%f12, %f20, %f20
	.word	0xdb06001c	! t0_kref+0xb84:   	ld	[%i0 + %i4], %f13
	.word	0x92b0201f	! t0_kref+0xb88:   	orncc	%g0, 0x1f, %o1
	.word	0xada0002a	! t0_kref+0xb8c:   	fmovs	%f10, %f22
	.word	0xa63a7db6	! t0_kref+0xb90:   	xnor	%o1, -0x24a, %l3
	.word	0xa6bdc015	! t0_kref+0xb94:   	xnorcc	%l7, %l5, %l3
	.word	0xd5264000	! t0_kref+0xb98:   	st	%f10, [%i1]
	.word	0x972d0014	! t0_kref+0xb9c:   	sll	%l4, %l4, %o3
	.word	0xa4237fae	! t0_kref+0xba0:   	sub	%o5, -0x52, %l2
	.word	0xc76e7fe0	! t0_kref+0xba4:   	prefetch	%i1 - 0x20, 3
	.word	0x81ab8a48	! t0_kref+0xba8:   	fcmpd	%fcc0, %f14, %f8
	.word	0xd406201c	! t0_kref+0xbac:   	ld	[%i0 + 0x1c], %o2
	.word	0x86102001	! t0_kref+0xbb0:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0xbb4:   	bne,a	_kref+0xbb4
	.word	0x86a0e001	! t0_kref+0xbb8:   	subcc	%g3, 1, %g3
	.word	0xe4066000	! t0_kref+0xbbc:   	ld	[%i1], %l2
	.word	0x9645fdbe	! t0_kref+0xbc0:   	addc	%l7, -0x242, %o3
	.word	0xaeb6f9aa	! t0_kref+0xbc4:   	orncc	%i3, -0x656, %l7
	.word	0x95b34280	! t0_kref+0xbc8:   	array32	%o5, %g0, %o2
	.word	0xada2094c	! t0_kref+0xbcc:   	fmuld	%f8, %f12, %f22
	.word	0xe28e5000	! t0_kref+0xbd0:   	lduba	[%i1]0x80, %l1
	.word	0x9425b506	! t0_kref+0xbd4:   	sub	%l6, -0xafa, %o2
	.word	0xa8153325	! t0_kref+0xbd8:   	or	%l4, -0xcdb, %l4
	.word	0x95b54356	! t0_kref+0xbdc:   	alignaddrl	%l5, %l6, %o2
	.word	0x93b50cae	! t0_kref+0xbe0:   	fandnot2s	%f20, %f14, %f9
	.word	0xafa01894	! t0_kref+0xbe4:   	fitos	%f20, %f23
	.word	0xa29a2dbb	! t0_kref+0xbe8:   	xorcc	%o0, 0xdbb, %l1
	.word	0x29480008	! t0_kref+0xbec:   	fbl,a,pt	%fcc0, _kref+0xc0c
	.word	0xd1267ff0	! t0_kref+0xbf0:   	st	%f8, [%i1 - 0x10]
	.word	0x32480003	! t0_kref+0xbf4:   	bne,a,pt	%icc, _kref+0xc00
	.word	0xa1b28f54	! t0_kref+0xbf8:   	fornot1	%f10, %f20, %f16
	.word	0x2503be86	! t0_kref+0xbfc:   	sethi	%hi(0xefa1800), %l2
	.word	0xe81e2008	! t0_kref+0xc00:   	ldd	[%i0 + 8], %l4
	.word	0x28480003	! t0_kref+0xc04:   	bleu,a,pt	%icc, _kref+0xc10
	.word	0x81858000	! t0_kref+0xc08:   	wr	%l6, %g0, %y
	.word	0x271be627	! t0_kref+0xc0c:   	sethi	%hi(0x6f989c00), %l3
	.word	0x9e12000a	! t0_kref+0xc10:   	or	%o0, %o2, %o7
	.word	0xc12e401c	! t0_kref+0xc14:   	st	%fsr, [%i1 + %i4]
	.word	0x9a2b64ee	! t0_kref+0xc18:   	andn	%o5, 0x4ee, %o5
	.word	0xa6d2605b	! t0_kref+0xc1c:   	umulcc	%o1, 0x5b, %l3
	.word	0xae22b737	! t0_kref+0xc20:   	sub	%o2, -0x8c9, %l7
	.word	0x969ef251	! t0_kref+0xc24:   	xorcc	%i3, -0xdaf, %o3
	.word	0x86102003	! t0_kref+0xc28:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0xc2c:   	bne,a	_kref+0xc2c
	.word	0x86a0e001	! t0_kref+0xc30:   	subcc	%g3, 1, %g3
	.word	0xd980a014	! t0_kref+0xc34:   	lda	[%g2 + 0x14]%asi, %f12
	.word	0x112f36fc	! t0_kref+0xc38:   	sethi	%hi(0xbcdbf000), %o0
	.word	0xe690a01c	! t0_kref+0xc3c:   	lduha	[%g2 + 0x1c]%asi, %l3
	.word	0x20480007	! t0_kref+0xc40:   	bn,a,pt	%icc, _kref+0xc5c
	.word	0xae85c000	! t0_kref+0xc44:   	addcc	%l7, %g0, %l7
	.word	0x908a0008	! t0_kref+0xc48:   	andcc	%o0, %o0, %o0
	.word	0xf4262014	! t0_kref+0xc4c:   	st	%i2, [%i0 + 0x14]
	.word	0x99a01a2e	! t0_kref+0xc50:   	fstoi	%f14, %f12
	.word	0xda90a00a	! t0_kref+0xc54:   	lduha	[%g2 + 0xa]%asi, %o5
	.word	0xf1262000	! t0_kref+0xc58:   	st	%f24, [%i0]
	.word	0xa7a00032	! t0_kref+0xc5c:   	fmovs	%f18, %f19
	.word	0x9fc00004	! t0_kref+0xc60:   	call	%g0 + %g4
	.word	0xdd26200c	! t0_kref+0xc64:   	st	%f14, [%i0 + 0xc]
	.word	0x81adcaaa	! t0_kref+0xc68:   	fcmpes	%fcc0, %f23, %f10
	.word	0xd4480018	! t0_kref+0xc6c:   	ldsb	[%g0 + %i0], %o2
	.word	0xada0054c	! t0_kref+0xc70:   	fsqrtd	%f12, %f22
	.word	0xe11e001d	! t0_kref+0xc74:   	ldd	[%i0 + %i5], %f16
	.word	0x8143c000	! t0_kref+0xc78:   	stbar
	.word	0x81aa0acc	! t0_kref+0xc7c:   	fcmped	%fcc0, %f8, %f12
	.word	0x38800008	! t0_kref+0xc80:   	bgu,a	_kref+0xca0
	.word	0xa60b4009	! t0_kref+0xc84:   	and	%o5, %o1, %l3
	.word	0xa0da69e9	! t0_kref+0xc88:   	smulcc	%o1, 0x9e9, %l0
	.word	0xa8ab335e	! t0_kref+0xc8c:   	andncc	%o4, -0xca2, %l4
	.word	0x24480004	! t0_kref+0xc90:   	ble,a,pt	%icc, _kref+0xca0
	.word	0xa5a01a4c	! t0_kref+0xc94:   	fdtoi	%f12, %f18
	.word	0xa6b5b189	! t0_kref+0xc98:   	orncc	%l6, -0xe77, %l3
	.word	0xa80d0014	! t0_kref+0xc9c:   	and	%l4, %l4, %l4
	.word	0xd44e001a	! t0_kref+0xca0:   	ldsb	[%i0 + %i2], %o2
	.word	0x2139f118	! t0_kref+0xca4:   	sethi	%hi(0xe7c46000), %l0
	.word	0xb1a0002d	! t0_kref+0xca8:   	fmovs	%f13, %f24
	.word	0x86102011	! t0_kref+0xcac:   	mov	0x11, %g3
	.word	0x86a0e001	! t0_kref+0xcb0:   	subcc	%g3, 1, %g3
	.word	0x2280001f	! t0_kref+0xcb4:   	be,a	_kref+0xd30
	.word	0xe8f63fe8	! t0_kref+0xcb8:   	stxa	%l4, [%i0 - 0x18]%asi
	.word	0x8143c000	! t0_kref+0xcbc:   	stbar
	.word	0x9842bb4b	! t0_kref+0xcc0:   	addc	%o2, -0x4b5, %o4
	.word	0xe6080019	! t0_kref+0xcc4:   	ldub	[%g0 + %i1], %l3
	.word	0x9e0a7aab	! t0_kref+0xcc8:   	and	%o1, -0x555, %o7
	.word	0xa0254009	! t0_kref+0xccc:   	sub	%l5, %o1, %l0
	.word	0xc1ee5016	! t0_kref+0xcd0:   	prefetcha	%i1 + %l6, 0
	.word	0x99a0192f	! t0_kref+0xcd4:   	fstod	%f15, %f12
	.word	0xa9b58f75	! t0_kref+0xcd8:   	fornot1s	%f22, %f21, %f20
	.word	0xd51e6008	! t0_kref+0xcdc:   	ldd	[%i1 + 8], %f10
	.word	0xd4b6d018	! t0_kref+0xce0:   	stha	%o2, [%i3 + %i0]0x80
	.word	0x98c3401b	! t0_kref+0xce4:   	addccc	%o5, %i3, %o4
	.word	0xada01938	! t0_kref+0xce8:   	fstod	%f24, %f22
	.word	0xd526001c	! t0_kref+0xcec:   	st	%f10, [%i0 + %i4]
	.word	0x9fa00530	! t0_kref+0xcf0:   	fsqrts	%f16, %f15
	.word	0xd0c8a009	! t0_kref+0xcf4:   	ldsba	[%g2 + 9]%asi, %o0
	.word	0xe0160000	! t0_kref+0xcf8:   	lduh	[%i0], %l0
	.word	0x81854000	! t0_kref+0xcfc:   	wr	%l5, %g0, %y
	.word	0x99a0192a	! t0_kref+0xd00:   	fstod	%f10, %f12
	.word	0xa1b20988	! t0_kref+0xd04:   	bshuffle	%f8, %f8, %f16
	.word	0xa2f54008	! t0_kref+0xd08:   	udivcc	%l5, %o0, %l1
	.word	0x9ba00028	! t0_kref+0xd0c:   	fmovs	%f8, %f13
	.word	0x2107ce2b	! t0_kref+0xd10:   	sethi	%hi(0x1f38ac00), %l0
	.word	0x8143c000	! t0_kref+0xd14:   	stbar
	.word	0x3e800003	! t0_kref+0xd18:   	bvc,a	_kref+0xd24
	.word	0xaba38830	! t0_kref+0xd1c:   	fadds	%f14, %f16, %f21
	.word	0xa9aa804e	! t0_kref+0xd20:   	fmovdue	%fcc0, %f14, %f20
	.word	0x909a0015	! t0_kref+0xd24:   	xorcc	%o0, %l5, %o0
	.word	0xae3b0016	! t0_kref+0xd28:   	xnor	%o4, %l6, %l7
	.word	0x97b34240	! t0_kref+0xd2c:   	array16	%o5, %g0, %o3
	.word	0x98237e35	! t0_kref+0xd30:   	sub	%o5, -0x1cb, %o4
	.word	0x3e480008	! t0_kref+0xd34:   	bvc,a,pt	%icc, _kref+0xd54
	.word	0x91b00fe0	! t0_kref+0xd38:   	fones	%f8
	.word	0x91aa404e	! t0_kref+0xd3c:   	fmovde	%fcc0, %f14, %f8
	.word	0x9a3dc016	! t0_kref+0xd40:   	xnor	%l7, %l6, %o5
	.word	0xee462000	! t0_kref+0xd44:   	ldsw	[%i0], %l7
	.word	0x91a00056	! t0_kref+0xd48:   	fmovd	%f22, %f8
	.word	0xd93e2008	! t0_kref+0xd4c:   	std	%f12, [%i0 + 8]
	.word	0xd53f4019	! t0_kref+0xd50:   	std	%f10, [%i5 + %i1]
	.word	0x27800005	! t0_kref+0xd54:   	fbul,a	_kref+0xd68
	.word	0xa7a01a4a	! t0_kref+0xd58:   	fdtoi	%f10, %f19
	.word	0x91ab8054	! t0_kref+0xd5c:   	fmovdule	%fcc0, %f20, %f8
	.word	0xabb007b4	! t0_kref+0xd60:   	fpackfix	%f20, %f21
	.word	0xd0c0a010	! t0_kref+0xd64:   	ldswa	[%g2 + 0x10]%asi, %o0
	.word	0x9e0d68a3	! t0_kref+0xd68:   	and	%l5, 0x8a3, %o7
	.word	0x32480007	! t0_kref+0xd6c:   	bne,a,pt	%icc, _kref+0xd88
	.word	0x99a0192c	! t0_kref+0xd70:   	fstod	%f12, %f12
	.word	0x8d85741e	! t0_kref+0xd74:   	wr	%l5, 0xfffff41e, %fprs
	.word	0x34480006	! t0_kref+0xd78:   	bg,a,pt	%icc, _kref+0xd90
	.word	0x91a018d8	! t0_kref+0xd7c:   	fdtos	%f24, %f8
	.word	0xaeb26c38	! t0_kref+0xd80:   	orncc	%o1, 0xc38, %l7
	.word	0xaba28839	! t0_kref+0xd84:   	fadds	%f10, %f25, %f21
	.word	0x91a01898	! t0_kref+0xd88:   	fitos	%f24, %f8
	.word	0xd93e2000	! t0_kref+0xd8c:   	std	%f12, [%i0]
	.word	0x9215c01a	! t0_kref+0xd90:   	or	%l7, %i2, %o1
	.word	0xa5b44979	! t0_kref+0xd94:   	fpmerge	%f17, %f25, %f18
	.word	0xaef0000d	! t0_kref+0xd98:   	udivcc	%g0, %o5, %l7
	.word	0xee871019	! t0_kref+0xd9c:   	lda	[%i4 + %i1]0x80, %l7
	.word	0xa6f0291a	! t0_kref+0xda0:   	udivcc	%g0, 0x91a, %l3
	.word	0x2d800003	! t0_kref+0xda4:   	fbg,a	_kref+0xdb0
	.word	0x25257080	! t0_kref+0xda8:   	sethi	%hi(0x95c20000), %l2
	.word	0x30800003	! t0_kref+0xdac:   	ba,a	_kref+0xdb8
	.word	0xe0500018	! t0_kref+0xdb0:   	ldsh	[%g0 + %i0], %l0
	.word	0xd8000018	! t0_kref+0xdb4:   	ld	[%g0 + %i0], %o4
	.word	0x9ed22385	! t0_kref+0xdb8:   	umulcc	%o0, 0x385, %o7
	.word	0x93a4c829	! t0_kref+0xdbc:   	fadds	%f19, %f9, %f9
	.word	0x91b24a79	! t0_kref+0xdc0:   	fpadd32s	%f9, %f25, %f8
	.word	0x1b0b07b5	! t0_kref+0xdc4:   	sethi	%hi(0x2c1ed400), %o5
	.word	0x94d57ed0	! t0_kref+0xdc8:   	umulcc	%l5, -0x130, %o2
	.word	0xe1e8a085	! t0_kref+0xdcc:   	prefetcha	%g2 + 0x85, 16
	.word	0xee270019	! t0_kref+0xdd0:   	st	%l7, [%i4 + %i1]
	.word	0xa7a00029	! t0_kref+0xdd4:   	fmovs	%f9, %f19
	.word	0xb1b2898e	! t0_kref+0xdd8:   	bshuffle	%f10, %f14, %f24
	.word	0xada50848	! t0_kref+0xddc:   	faddd	%f20, %f8, %f22
	.word	0xc9ee500b	! t0_kref+0xde0:   	prefetcha	%i1 + %o3, 4
	.word	0x95b4098a	! t0_kref+0xde4:   	bshuffle	%f16, %f10, %f10
	.word	0xadb38f50	! t0_kref+0xde8:   	fornot1	%f14, %f16, %f22
	.word	0x9ba018ca	! t0_kref+0xdec:   	fdtos	%f10, %f13
	.word	0x95a40858	! t0_kref+0xdf0:   	faddd	%f16, %f24, %f10
	.word	0xc568a087	! t0_kref+0xdf4:   	prefetch	%g2 + 0x87, 2
	.word	0xa2d3395a	! t0_kref+0xdf8:   	umulcc	%o4, -0x6a6, %l1
	.word	0x25800008	! t0_kref+0xdfc:   	fblg,a	_kref+0xe1c
	.word	0x95b28ab7	! t0_kref+0xe00:   	fpsub16s	%f10, %f23, %f10
	.word	0x9f2e800c	! t0_kref+0xe04:   	sll	%i2, %o4, %o7
	.word	0x81adcab5	! t0_kref+0xe08:   	fcmpes	%fcc0, %f23, %f21
	.word	0x93a549a9	! t0_kref+0xe0c:   	fdivs	%f21, %f9, %f9
	.word	0xa5b58a0a	! t0_kref+0xe10:   	fpadd16	%f22, %f10, %f18
	.word	0xa2f30017	! t0_kref+0xe14:   	udivcc	%o4, %l7, %l1
	.word	0x9f122717	! t0_kref+0xe18:   	taddcctv	%o0, 0x717, %o7
	.word	0x980de24d	! t0_kref+0xe1c:   	and	%l7, 0x24d, %o4
	.word	0xec48a020	! t0_kref+0xe20:   	ldsb	[%g2 + 0x20], %l6
	.word	0x26800007	! t0_kref+0xe24:   	bl,a	_kref+0xe40
	.word	0xa43d37bf	! t0_kref+0xe28:   	xnor	%l4, -0x841, %l2
	.word	0xadb40eef	! t0_kref+0xe2c:   	fornot2s	%f16, %f15, %f22
	.word	0x95a0054a	! t0_kref+0xe30:   	fsqrtd	%f10, %f10
	.word	0xe1be5000	! t0_kref+0xe34:   	stda	%f16, [%i1]0x80
	.word	0xecc6600c	! t0_kref+0xe38:   	ldswa	[%i1 + 0xc]%asi, %l6
	.word	0x9605209e	! t0_kref+0xe3c:   	add	%l4, 0x9e, %o3
	.word	0xef68a041	! t0_kref+0xe40:   	prefetch	%g2 + 0x41, 23
	.word	0xaaf5ec5e	! t0_kref+0xe44:   	udivcc	%l7, 0xc5e, %l5
	.word	0x9aab70bb	! t0_kref+0xe48:   	andncc	%o5, -0xf45, %o5
	.word	0x9ba4882c	! t0_kref+0xe4c:   	fadds	%f18, %f12, %f13
	.word	0x81ac8a37	! t0_kref+0xe50:   	fcmps	%fcc0, %f18, %f23
	.word	0xadb50e4e	! t0_kref+0xe54:   	fxnor	%f20, %f14, %f22
!	call	0xfffffc60
	.word	0xd9267ff0	! t0_kref+0xe5c:   	st	%f12, [%i1 - 0x10]
	.word	0x9db007aa	! t0_kref+0xe60:   	fpackfix	%f10, %f14
	.word	0xa1b00cee	! t0_kref+0xe64:   	fnot2s	%f14, %f16
	.word	0xd290a016	! t0_kref+0xe68:   	lduha	[%g2 + 0x16]%asi, %o1
	.word	0x86102004	! t0_kref+0xe6c:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0xe70:   	bne,a	_kref+0xe70
	.word	0x86a0e001	! t0_kref+0xe74:   	subcc	%g3, 1, %g3
	.word	0xa9b38c88	! t0_kref+0xe78:   	fandnot2	%f14, %f8, %f20
	.word	0xed68a080	! t0_kref+0xe7c:   	prefetch	%g2 + 0x80, 22
	.word	0xd616001b	! t0_kref+0xe80:   	lduh	[%i0 + %i3], %o3
	.word	0x95b28000	! t0_kref+0xe84:   	edge8	%o2, %g0, %o2
	.word	0xca00001c	! t0_kref+0xe88:   	ld	[%g0 + %i4], %g5
	.word	0xa5b50a14	! t0_kref+0xe8c:   	fpadd16	%f20, %f20, %f18
	.word	0x9de3bfa0	! t0_kref+0xe90:   	save	%sp, -0x60, %sp
	.word	0xa9eec018	! t0_kref+0xe94:   	restore	%i3, %i0, %l4
	.word	0x86102001	! t0_kref+0xe98:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0xe9c:   	bne,a	_kref+0xe9c
	.word	0x86a0e001	! t0_kref+0xea0:   	subcc	%g3, 1, %g3
	.word	0xa2f50008	! t0_kref+0xea4:   	udivcc	%l4, %o0, %l1
	call	SYM(t0_subr1)
	.word	0xe1270019	! t0_kref+0xeac:   	st	%f16, [%i4 + %i1]
	.word	0x95a209b6	! t0_kref+0xeb0:   	fdivs	%f8, %f22, %f10
	.word	0x93b28ab4	! t0_kref+0xeb4:   	fpsub16s	%f10, %f20, %f9
	.word	0xda2e4000	! t0_kref+0xeb8:   	stb	%o5, [%i1]
	.word	0xd84e0000	! t0_kref+0xebc:   	ldsb	[%i0], %o4
	.word	0xee262004	! t0_kref+0xec0:   	st	%l7, [%i0 + 4]
	.word	0x9de3bfa0	! t0_kref+0xec4:   	save	%sp, -0x60, %sp
	.word	0xade82466	! t0_kref+0xec8:   	restore	%g0, 0x466, %l6
	.word	0x99a589d0	! t0_kref+0xecc:   	fdivd	%f22, %f16, %f12
	.word	0x81ab8ac8	! t0_kref+0xed0:   	fcmped	%fcc0, %f14, %f8
	.word	0xb3a308b7	! t0_kref+0xed4:   	fsubs	%f12, %f23, %f25
	.word	0x95a01a31	! t0_kref+0xed8:   	fstoi	%f17, %f10
	.word	0xda4e8018	! t0_kref+0xedc:   	ldsb	[%i2 + %i0], %o5
	.word	0x99b50a4c	! t0_kref+0xee0:   	fpadd32	%f20, %f12, %f12
	.word	0x9e8ec00a	! t0_kref+0xee4:   	andcc	%i3, %o2, %o7
	.word	0x8610200d	! t0_kref+0xee8:   	mov	0xd, %g3
	.word	0x86a0e001	! t0_kref+0xeec:   	subcc	%g3, 1, %g3
	.word	0x2280001e	! t0_kref+0xef0:   	be,a	_kref+0xf68
	.word	0x909a4016	! t0_kref+0xef4:   	xorcc	%o1, %l6, %o0
	.word	0xadb48df6	! t0_kref+0xef8:   	fnands	%f18, %f22, %f22
	.word	0x91a01a50	! t0_kref+0xefc:   	fdtoi	%f16, %f8
	.word	0x93b20596	! t0_kref+0xf00:   	fcmpgt32	%f8, %f22, %o1
	.word	0xd22e200e	! t0_kref+0xf04:   	stb	%o1, [%i0 + 0xe]
	.word	0x9fa30834	! t0_kref+0xf08:   	fadds	%f12, %f20, %f15
	.word	0xd8be7fe0	! t0_kref+0xf0c:   	stda	%o4, [%i1 - 0x20]%asi
	.word	0xe44e3ff8	! t0_kref+0xf10:   	ldsb	[%i0 - 8], %l2
	.word	0xebe6100b	! t0_kref+0xf14:   	casa	[%i0]0x80, %o3, %l5
	.word	0xd856401b	! t0_kref+0xf18:   	ldsh	[%i1 + %i3], %o4
	.word	0xb1b50c4e	! t0_kref+0xf1c:   	fnor	%f20, %f14, %f24
	.word	0xa1a389b7	! t0_kref+0xf20:   	fdivs	%f14, %f23, %f16
	.word	0xb1a60950	! t0_kref+0xf24:   	fmuld	%f24, %f16, %f24
	.word	0xd19e6010	! t0_kref+0xf28:   	ldda	[%i1 + 0x10]%asi, %f8
	.word	0x91a01939	! t0_kref+0xf2c:   	fstod	%f25, %f8
	.word	0xa1b00f14	! t0_kref+0xf30:   	fsrc2	%f20, %f16
	.word	0x968a4017	! t0_kref+0xf34:   	andcc	%o1, %l7, %o3
	.word	0xf320a014	! t0_kref+0xf38:   	st	%f25, [%g2 + 0x14]
	.word	0xa5a01929	! t0_kref+0xf3c:   	fstod	%f9, %f18
	.word	0xe9070019	! t0_kref+0xf40:   	ld	[%i4 + %i1], %f20
	.word	0xd280a004	! t0_kref+0xf44:   	lda	[%g2 + 4]%asi, %o1
	.word	0xde4e8019	! t0_kref+0xf48:   	ldsb	[%i2 + %i1], %o7
	.word	0xa786801a	! t0_kref+0xf4c:   	wr	%i2, %i2, %gsr
	.word	0x21800007	! t0_kref+0xf50:   	fbn,a	_kref+0xf6c
	.word	0x95a40848	! t0_kref+0xf54:   	faddd	%f16, %f8, %f10
	.word	0xee7f0019	! t0_kref+0xf58:   	swap	[%i4 + %i1], %l7
	.word	0xea080019	! t0_kref+0xf5c:   	ldub	[%g0 + %i1], %l5
	.word	0xae054014	! t0_kref+0xf60:   	add	%l5, %l4, %l7
	.word	0x8143c000	! t0_kref+0xf64:   	stbar
	.word	0x99a3082a	! t0_kref+0xf68:   	fadds	%f12, %f10, %f12
	.word	0xd6366006	! t0_kref+0xf6c:   	sth	%o3, [%i1 + 6]
	.word	0x95b5ca6b	! t0_kref+0xf70:   	fpadd32s	%f23, %f11, %f10
	.word	0xac2227ae	! t0_kref+0xf74:   	sub	%o0, 0x7ae, %l6
	call	1f
	.empty
	.word	0xaba54932	! t0_kref+0xf7c:   	fmuls	%f21, %f18, %f21
	.word	0x001fffff	! t0_kref+0xf80:   	illtrap	0x1fffff
	.word	0xe03962e8	! t0_kref+0xf84:   	std	%l0, [%g5 + 0x2e8]
1:	.word	0xec1e001d	! t0_kref+0xf88:   	ldd	[%i0 + %i5], %l6
	.word	0x943da11f	! t0_kref+0xf8c:   	xnor	%l6, 0x11f, %o2
	.word	0x9db44df5	! t0_kref+0xf90:   	fnands	%f17, %f21, %f14
	.word	0x81580000	! t0_kref+0xf94:   	flushw
	.word	0xde56001b	! t0_kref+0xf98:   	ldsh	[%i0 + %i3], %o7
	.word	0xed6e6008	! t0_kref+0xf9c:   	prefetch	%i1 + 8, 22
	.word	0x99a38956	! t0_kref+0xfa0:   	fmuld	%f14, %f22, %f12
	.word	0x9da01a58	! t0_kref+0xfa4:   	fdtoi	%f24, %f14
	.word	0xe0ce501a	! t0_kref+0xfa8:   	ldsba	[%i1 + %i2]0x80, %l0
	.word	0x99a01a54	! t0_kref+0xfac:   	fdtoi	%f20, %f12
	.word	0xf6200019	! t0_kref+0xfb0:   	st	%i3, [%g0 + %i1]
	.word	0xada0188a	! t0_kref+0xfb4:   	fitos	%f10, %f22
	.word	0xf1ee501a	! t0_kref+0xfb8:   	prefetcha	%i1 + %i2, 24
	.word	0x9076800a	! t0_kref+0xfbc:   	udiv	%i2, %o2, %o0
	.word	0x24800001	! t0_kref+0xfc0:   	ble,a	_kref+0xfc4
	.word	0xa7a308b1	! t0_kref+0xfc4:   	fsubs	%f12, %f17, %f19
	.word	0xedf65016	! t0_kref+0xfc8:   	casxa	[%i1]0x80, %l6, %l6
	.word	0xada01894	! t0_kref+0xfcc:   	fitos	%f20, %f22
	.word	0xadb606e8	! t0_kref+0xfd0:   	fmul8ulx16	%f24, %f8, %f22
	.word	0x9fa018ce	! t0_kref+0xfd4:   	fdtos	%f14, %f15
	.word	0xe1be1896	! t0_kref+0xfd8:   	stda	%f16, [%i0 + %l6]0xc4
	.word	0xa5b30280	! t0_kref+0xfdc:   	array32	%o4, %g0, %l2
	.word	0xada449b4	! t0_kref+0xfe0:   	fdivs	%f17, %f20, %f22
	.word	0xd2b6d018	! t0_kref+0xfe4:   	stha	%o1, [%i3 + %i0]0x80
	.word	0xe27e001c	! t0_kref+0xfe8:   	swap	[%i0 + %i4], %l1
	.word	0xed3e6000	! t0_kref+0xfec:   	std	%f22, [%i1]
	.word	0x94b263b3	! t0_kref+0xff0:   	orncc	%o1, 0x3b3, %o2
	.word	0x81ad0ad6	! t0_kref+0xff4:   	fcmped	%fcc0, %f20, %f22
	.word	0x99a548ab	! t0_kref+0xff8:   	fsubs	%f21, %f11, %f12
	.word	0x8610201b	! t0_kref+0xffc:   	mov	0x1b, %g3
	.word	0x86a0e001	! t0_kref+0x1000:   	subcc	%g3, 1, %g3
	.word	0x22800001	! t0_kref+0x1004:   	be,a	_kref+0x1008
	.word	0xe6070019	! t0_kref+0x1008:   	ld	[%i4 + %i1], %l3
	.word	0x9da0012e	! t0_kref+0x100c:   	fabss	%f14, %f14
	.word	0xe99f1a19	! t0_kref+0x1010:   	ldda	[%i4 + %i1]0xd0, %f20
	.word	0x932a800d	! t0_kref+0x1014:   	sll	%o2, %o5, %o1
	.word	0x3e800008	! t0_kref+0x1018:   	bvc,a	_kref+0x1038
	.word	0xf6260000	! t0_kref+0x101c:   	st	%i3, [%i0]
	.word	0x91b48db4	! t0_kref+0x1020:   	fxors	%f18, %f20, %f8
	.word	0xe11e0000	! t0_kref+0x1024:   	ldd	[%i0], %f16
	.word	0x8d828009	! t0_kref+0x1028:   	wr	%o2, %o1, %fprs
	.word	0xe8c8a014	! t0_kref+0x102c:   	ldsba	[%g2 + 0x14]%asi, %l4
	.word	0xe6fe101c	! t0_kref+0x1030:   	swapa	[%i0 + %i4]0x80, %l3
	.word	0xa6ab28c0	! t0_kref+0x1034:   	andncc	%o4, 0x8c0, %l3
	.word	0xf326001c	! t0_kref+0x1038:   	st	%f25, [%i0 + %i4]
	.word	0x9140c000	! t0_kref+0x103c:   	mov	%asi, %o0
	.word	0xec080018	! t0_kref+0x1040:   	ldub	[%g0 + %i0], %l6
	.word	0xd2566004	! t0_kref+0x1044:   	ldsh	[%i1 + 4], %o1
	.word	0x91b206f4	! t0_kref+0x1048:   	fmul8ulx16	%f8, %f20, %f8
	.word	0xa282eab8	! t0_kref+0x104c:   	addcc	%o3, 0xab8, %l1
	.word	0xaeda4014	! t0_kref+0x1050:   	smulcc	%o1, %l4, %l7
	.word	0xeede1000	! t0_kref+0x1054:   	ldxa	[%i0]0x80, %l7
	.word	0xc568a005	! t0_kref+0x1058:   	prefetch	%g2 + 5, 2
	.word	0xe8562016	! t0_kref+0x105c:   	ldsh	[%i0 + 0x16], %l4
	.word	0x2d800005	! t0_kref+0x1060:   	fbg,a	_kref+0x1074
	.word	0xa7a00032	! t0_kref+0x1064:   	fmovs	%f18, %f19
	.word	0xefee501d	! t0_kref+0x1068:   	prefetcha	%i1 + %i5, 23
	.word	0xf620a038	! t0_kref+0x106c:   	st	%i3, [%g2 + 0x38]
	.word	0xdb264000	! t0_kref+0x1070:   	st	%f13, [%i1]
	.word	0xe4d0a030	! t0_kref+0x1074:   	ldsha	[%g2 + 0x30]%asi, %l2
	.word	0xc768a043	! t0_kref+0x1078:   	prefetch	%g2 + 0x43, 3
	.word	0xd8264000	! t0_kref+0x107c:   	st	%o4, [%i1]
	.word	0x81aa4ab4	! t0_kref+0x1080:   	fcmpes	%fcc0, %f9, %f20
	.word	0xe9ee501d	! t0_kref+0x1084:   	prefetcha	%i1 + %i5, 20
	.word	0xda50a01c	! t0_kref+0x1088:   	ldsh	[%g2 + 0x1c], %o5
	.word	0xee871018	! t0_kref+0x108c:   	lda	[%i4 + %i0]0x80, %l7
	.word	0xec9e3ff0	! t0_kref+0x1090:   	ldda	[%i0 - 0x10]%asi, %l6
	.word	0x9fa00039	! t0_kref+0x1094:   	fmovs	%f25, %f15
	.word	0x15178e03	! t0_kref+0x1098:   	sethi	%hi(0x5e380c00), %o2
	.word	0xa9a4894c	! t0_kref+0x109c:   	fmuld	%f18, %f12, %f20
	.word	0x97a01a54	! t0_kref+0x10a0:   	fdtoi	%f20, %f11
	.word	0xa0f5400d	! t0_kref+0x10a4:   	udivcc	%l5, %o5, %l0
	.word	0xa9b40a56	! t0_kref+0x10a8:   	fpadd32	%f16, %f22, %f20
	.word	0xeca8a038	! t0_kref+0x10ac:   	stba	%l6, [%g2 + 0x38]%asi
	.word	0xa2aa4017	! t0_kref+0x10b0:   	andncc	%o1, %l7, %l1
	.word	0x9da6094c	! t0_kref+0x10b4:   	fmuld	%f24, %f12, %f14
	.word	0xa48a0008	! t0_kref+0x10b8:   	andcc	%o0, %o0, %l2
	.word	0xa2b6c00a	! t0_kref+0x10bc:   	orncc	%i3, %o2, %l1
	.word	0xa0234014	! t0_kref+0x10c0:   	sub	%o5, %l4, %l0
	.word	0xa7b00ce9	! t0_kref+0x10c4:   	fnot2s	%f9, %f19
	.word	0xf36e3fe0	! t0_kref+0x10c8:   	prefetch	%i0 - 0x20, 25
	.word	0xe9be5895	! t0_kref+0x10cc:   	stda	%f20, [%i1 + %l5]0xc4
	.word	0xada01a4a	! t0_kref+0x10d0:   	fdtoi	%f10, %f22
	.word	0xd0363fe2	! t0_kref+0x10d4:   	sth	%o0, [%i0 - 0x1e]
	.word	0x81ad0ace	! t0_kref+0x10d8:   	fcmped	%fcc0, %f20, %f14
	.word	0x99b48592	! t0_kref+0x10dc:   	fcmpgt32	%f18, %f18, %o4
	.word	0xd9267ffc	! t0_kref+0x10e0:   	st	%f12, [%i1 - 4]
	.word	0x93a01a37	! t0_kref+0x10e4:   	fstoi	%f23, %f9
	.word	0x81ac8ac8	! t0_kref+0x10e8:   	fcmped	%fcc0, %f18, %f8
	.word	0xe8267ffc	! t0_kref+0x10ec:   	st	%l4, [%i1 - 4]
	.word	0x3d800003	! t0_kref+0x10f0:   	fbule,a	_kref+0x10fc
	.word	0xdb066000	! t0_kref+0x10f4:   	ld	[%i1], %f13
	.word	0xb1a0190f	! t0_kref+0x10f8:   	fitod	%f15, %f24
	.word	0xe850a020	! t0_kref+0x10fc:   	ldsh	[%g2 + 0x20], %l4
	.word	0xa72d401a	! t0_kref+0x1100:   	sll	%l5, %i2, %l3
	.word	0x2d2563b3	! t0_kref+0x1104:   	sethi	%hi(0x958ecc00), %l6
	.word	0xdb00a008	! t0_kref+0x1108:   	ld	[%g2 + 8], %f13
	.word	0x90728008	! t0_kref+0x110c:   	udiv	%o2, %o0, %o0
	.word	0xada01a50	! t0_kref+0x1110:   	fdtoi	%f16, %f22
	.word	0xdd3e7ff8	! t0_kref+0x1114:   	std	%f14, [%i1 - 8]
	.word	0x3c800006	! t0_kref+0x1118:   	bpos,a	_kref+0x1130
	.word	0x97b3034d	! t0_kref+0x111c:   	alignaddrl	%o4, %o5, %o3
	.word	0xa82ae4c3	! t0_kref+0x1120:   	andn	%o3, 0x4c3, %l4
	.word	0x3e480003	! t0_kref+0x1124:   	bvc,a,pt	%icc, _kref+0x1130
	.word	0xd6563fea	! t0_kref+0x1128:   	ldsh	[%i0 - 0x16], %o3
	.word	0x9da01a4e	! t0_kref+0x112c:   	fdtoi	%f14, %f14
	.word	0x9816ae7c	! t0_kref+0x1130:   	or	%i2, 0xe7c, %o4
	.word	0x9da30956	! t0_kref+0x1134:   	fmuld	%f12, %f22, %f14
	.word	0xc3e8a04c	! t0_kref+0x1138:   	prefetcha	%g2 + 0x4c, 1
	.word	0xa7a48928	! t0_kref+0x113c:   	fmuls	%f18, %f8, %f19
	.word	0xd5bf5018	! t0_kref+0x1140:   	stda	%f10, [%i5 + %i0]0x80
	.word	0xec516996	! t0_kref+0x1144:   	ldsh	[%g5 + 0x996], %l6
	.word	0xe76e401d	! t0_kref+0x1148:   	prefetch	%i1 + %i5, 19
	.word	0xa6f3400a	! t0_kref+0x114c:   	udivcc	%o5, %o2, %l3
	.word	0x9a2d400b	! t0_kref+0x1150:   	andn	%l5, %o3, %o5
	.word	0x91408000	! t0_kref+0x1154:   	mov	%ccr, %o0
	.word	0x3c800001	! t0_kref+0x1158:   	bpos,a	_kref+0x115c
	.word	0x95a01a58	! t0_kref+0x115c:   	fdtoi	%f24, %f10
	.word	0x9da0188c	! t0_kref+0x1160:   	fitos	%f12, %f14
	.word	0x81580000	! t0_kref+0x1164:   	flushw
	.word	0xdd064000	! t0_kref+0x1168:   	ld	[%i1], %f14
	.word	0xee6e7ffc	! t0_kref+0x116c:   	ldstub	[%i1 - 4], %l7
	.word	0xd4567fe6	! t0_kref+0x1170:   	ldsh	[%i1 - 0x1a], %o2
	.word	0xac2d66f3	! t0_kref+0x1174:   	andn	%l5, 0x6f3, %l6
	.word	0xaa0d401b	! t0_kref+0x1178:   	and	%l5, %i3, %l5
	.word	0x81aa4ab4	! t0_kref+0x117c:   	fcmpes	%fcc0, %f9, %f20
	.word	0xe13f4018	! t0_kref+0x1180:   	std	%f16, [%i5 + %i0]
	.word	0xe9ee101a	! t0_kref+0x1184:   	prefetcha	%i0 + %i2, 20
	.word	0xe99e7ff0	! t0_kref+0x1188:   	ldda	[%i1 - 0x10]%asi, %f20
	.word	0xb3b48af3	! t0_kref+0x118c:   	fpsub32s	%f18, %f19, %f25
	.word	0xeac8a017	! t0_kref+0x1190:   	ldsba	[%g2 + 0x17]%asi, %l5
	.word	0xa3700015	! t0_kref+0x1194:   	popc	%l5, %l1
	.word	0xada01052	! t0_kref+0x1198:   	fdtox	%f18, %f22
	.word	0xe8d0a008	! t0_kref+0x119c:   	ldsha	[%g2 + 8]%asi, %l4
	.word	0x81868000	! t0_kref+0x11a0:   	wr	%i2, %g0, %y
	.word	0xa782a376	! t0_kref+0x11a4:   	wr	%o2, 0x376, %gsr
	.word	0x17189eea	! t0_kref+0x11a8:   	sethi	%hi(0x627ba800), %o3
	.word	0xa9a00558	! t0_kref+0x11ac:   	fsqrtd	%f24, %f20
	.word	0x91b60ac8	! t0_kref+0x11b0:   	fpsub32	%f24, %f8, %f8
	.word	0xa2b50000	! t0_kref+0x11b4:   	orncc	%l4, %g0, %l1
	.word	0xaaf24014	! t0_kref+0x11b8:   	udivcc	%o1, %l4, %l5
	.word	0x8d82af73	! t0_kref+0x11bc:   	wr	%o2, 0xf73, %fprs
	.word	0x9da548b3	! t0_kref+0x11c0:   	fsubs	%f21, %f19, %f14
	.word	0xabb58ef7	! t0_kref+0x11c4:   	fornot2s	%f22, %f23, %f21
	.word	0xf3867fe8	! t0_kref+0x11c8:   	lda	[%i1 - 0x18]%asi, %f25
	.word	0xa02d801b	! t0_kref+0x11cc:   	andn	%l6, %i3, %l0
	.word	0x28480001	! t0_kref+0x11d0:   	bleu,a,pt	%icc, _kref+0x11d4
	.word	0xa5b38c94	! t0_kref+0x11d4:   	fandnot2	%f14, %f20, %f18
	.word	0xec26001c	! t0_kref+0x11d8:   	st	%l6, [%i0 + %i4]
	.word	0x9f414000	! t0_kref+0x11dc:   	mov	%pc, %o7
!	.word	0x38806387	! t0_kref+0x11e0:   	bgu,a	SYM(t0_subr2)
	   	bgu,a	SYM(t0_subr2)
	.word	0xe93e001d	! t0_kref+0x11e4:   	std	%f20, [%i0 + %i5]
	.word	0xb3a00536	! t0_kref+0x11e8:   	fsqrts	%f22, %f25
	.word	0xaec50009	! t0_kref+0x11ec:   	addccc	%l4, %o1, %l7
	.word	0xa5a000b0	! t0_kref+0x11f0:   	fnegs	%f16, %f18
	.word	0xd48e1000	! t0_kref+0x11f4:   	lduba	[%i0]0x80, %o2
	.word	0x91a00558	! t0_kref+0x11f8:   	fsqrtd	%f24, %f8
	.word	0xd4480019	! t0_kref+0x11fc:   	ldsb	[%g0 + %i1], %o2
	.word	0x81aa8ab7	! t0_kref+0x1200:   	fcmpes	%fcc0, %f10, %f23
	.word	0xa6637485	! t0_kref+0x1204:   	subc	%o5, -0xb7b, %l3
	.word	0xe8c66004	! t0_kref+0x1208:   	ldswa	[%i1 + 4]%asi, %l4
	.word	0x9025401b	! t0_kref+0x120c:   	sub	%l5, %i3, %o0
	.word	0xfbee101c	! t0_kref+0x1210:   	prefetcha	%i0 + %i4, 29
	.word	0x81abcab8	! t0_kref+0x1214:   	fcmpes	%fcc0, %f15, %f24
	.word	0xa1a0192e	! t0_kref+0x1218:   	fstod	%f14, %f16
	.word	0xdece3ff2	! t0_kref+0x121c:   	ldsba	[%i0 - 0xe]%asi, %o7
	.word	0xd8ee7fe0	! t0_kref+0x1220:   	ldstuba	[%i1 - 0x20]%asi, %o4
	.word	0x9a75bf3e	! t0_kref+0x1224:   	udiv	%l6, -0xc2, %o5
	.word	0x9fb44f68	! t0_kref+0x1228:   	fornot1s	%f17, %f8, %f15
	.word	0xa29b000a	! t0_kref+0x122c:   	xorcc	%o4, %o2, %l1
	.word	0x91b48e52	! t0_kref+0x1230:   	fxnor	%f18, %f18, %f8
	.word	0xa322800d	! t0_kref+0x1234:   	mulscc	%o2, %o5, %l1
	.word	0x33800005	! t0_kref+0x1238:   	fbe,a	_kref+0x124c
	.word	0x8143c000	! t0_kref+0x123c:   	stbar
	.word	0xed264000	! t0_kref+0x1240:   	st	%f22, [%i1]
	.word	0xa62d401b	! t0_kref+0x1244:   	andn	%l5, %i3, %l3
	.word	0xee270019	! t0_kref+0x1248:   	st	%l7, [%i4 + %i1]
	.word	0x2e480003	! t0_kref+0x124c:   	bvs,a,pt	%icc, _kref+0x1258
	.word	0xafb6c075	! t0_kref+0x1250:   	edge8ln	%i3, %l5, %l7
	.word	0x3c800003	! t0_kref+0x1254:   	bpos,a	_kref+0x1260
	.word	0xf11e7ff0	! t0_kref+0x1258:   	ldd	[%i1 - 0x10], %f24
	.word	0xd0466018	! t0_kref+0x125c:   	ldsw	[%i1 + 0x18], %o0
	.word	0xa2dd237b	! t0_kref+0x1260:   	smulcc	%l4, 0x37b, %l1
	.word	0x93b34df7	! t0_kref+0x1264:   	fnands	%f13, %f23, %f9
	.word	0x8143e020	! t0_kref+0x1268:   	membar	0x20
	.word	0x1f1b7c96	! t0_kref+0x126c:   	sethi	%hi(0x6df25800), %o7
	.word	0x9443398f	! t0_kref+0x1270:   	addc	%o4, -0x671, %o2
	.word	0xea8e6016	! t0_kref+0x1274:   	lduba	[%i1 + 0x16]%asi, %l5
	.word	0xa9a3c8b1	! t0_kref+0x1278:   	fsubs	%f15, %f17, %f20
	.word	0xa1b584ce	! t0_kref+0x127c:   	fcmpne32	%f22, %f14, %l0
	.word	0xff6e401b	! t0_kref+0x1280:   	prefetch	%i1 + %i3, 31
	.word	0xd780a02c	! t0_kref+0x1284:   	lda	[%g2 + 0x2c]%asi, %f11
	.word	0xc807bfe8	! t0_kref+0x1288:   	ld	[%fp - 0x18], %g4
	.word	0x23153bc7	! t0_kref+0x128c:   	sethi	%hi(0x54ef1c00), %l1
	.word	0xa1b28174	! t0_kref+0x1290:   	edge32ln	%o2, %l4, %l0
	.word	0xd4067ff0	! t0_kref+0x1294:   	ld	[%i1 - 0x10], %o2
	.word	0x9a12000d	! t0_kref+0x1298:   	or	%o0, %o5, %o5
	.word	0xdd9e7ff8	! t0_kref+0x129c:   	ldda	[%i1 - 8]%asi, %f14
	.word	0xd0ae2017	! t0_kref+0x12a0:   	stba	%o0, [%i0 + 0x17]%asi
	.word	0x81ad0ab8	! t0_kref+0x12a4:   	fcmpes	%fcc0, %f20, %f24
	.word	0xd83e0000	! t0_kref+0x12a8:   	std	%o4, [%i0]
	.word	0xe9be5a5d	! t0_kref+0x12ac:   	stda	%f20, [%i1 + %i5]0xd2
	.word	0xa8750015	! t0_kref+0x12b0:   	udiv	%l4, %l5, %l4
	.word	0x948d801b	! t0_kref+0x12b4:   	andcc	%l6, %i3, %o2
	.word	0x86102007	! t0_kref+0x12b8:   	mov	0x7, %g3
	.word	0x86a0e001	! t0_kref+0x12bc:   	subcc	%g3, 1, %g3
	.word	0x22800013	! t0_kref+0x12c0:   	be,a	_kref+0x130c
	.word	0xd2270018	! t0_kref+0x12c4:   	st	%o1, [%i4 + %i0]
	.word	0xada00132	! t0_kref+0x12c8:   	fabss	%f18, %f22
	.word	0x92233c75	! t0_kref+0x12cc:   	sub	%o4, -0x38b, %o1
	.word	0x3a4ffffb	! t0_kref+0x12d0:   	bcc,a,pt	%icc, _kref+0x12bc
	.word	0xd8366016	! t0_kref+0x12d4:   	sth	%o4, [%i1 + 0x16]
	.word	0xa5b30280	! t0_kref+0x12d8:   	array32	%o4, %g0, %l2
	.word	0x2c480003	! t0_kref+0x12dc:   	bneg,a,pt	%icc, _kref+0x12e8
	.word	0xe91e7fe8	! t0_kref+0x12e0:   	ldd	[%i1 - 0x18], %f20
	.word	0xac3d001a	! t0_kref+0x12e4:   	xnor	%l4, %i2, %l6
	.word	0x81ae0ad0	! t0_kref+0x12e8:   	fcmped	%fcc0, %f24, %f16
	.word	0xec36001b	! t0_kref+0x12ec:   	sth	%l6, [%i0 + %i3]
	.word	0xd6a8a037	! t0_kref+0x12f0:   	stba	%o3, [%g2 + 0x37]%asi
	.word	0xabb50a6b	! t0_kref+0x12f4:   	fpadd32s	%f20, %f11, %f21
	.word	0xaa2d001a	! t0_kref+0x12f8:   	andn	%l4, %i2, %l5
	.word	0x95b680db	! t0_kref+0x12fc:   	edge16l	%i2, %i3, %o2
	.word	0xa1a388b4	! t0_kref+0x1300:   	fsubs	%f14, %f20, %f16
	.word	0x25078b53	! t0_kref+0x1304:   	sethi	%hi(0x1e2d4c00), %l2
	.word	0x95400000	! t0_kref+0x1308:   	mov	%y, %o2
	.word	0x93b3406a	! t0_kref+0x130c:   	edge8ln	%o5, %o2, %o1
	.word	0xed68a088	! t0_kref+0x1310:   	prefetch	%g2 + 0x88, 22
	.word	0x97b580fb	! t0_kref+0x1314:   	edge16ln	%l6, %i3, %o3
	.word	0xd51e7ff8	! t0_kref+0x1318:   	ldd	[%i1 - 8], %f10
	.word	0x9ba3c8ad	! t0_kref+0x131c:   	fsubs	%f15, %f13, %f13
	.word	0xa8380009	! t0_kref+0x1320:   	xnor	%g0, %o1, %l4
	.word	0x900b3512	! t0_kref+0x1324:   	and	%o4, -0xaee, %o0
	.word	0xf76e401a	! t0_kref+0x1328:   	prefetch	%i1 + %i2, 27
	.word	0xd028a02b	! t0_kref+0x132c:   	stb	%o0, [%g2 + 0x2b]
	.word	0xebe8a00e	! t0_kref+0x1330:   	prefetcha	%g2 + 0xe, 21
	.word	0x99a289cc	! t0_kref+0x1334:   	fdivd	%f10, %f12, %f12
	.word	0xa416c008	! t0_kref+0x1338:   	or	%i3, %o0, %l2
	.word	0x9ed2c000	! t0_kref+0x133c:   	umulcc	%o3, %g0, %o7
	.word	0xe900a01c	! t0_kref+0x1340:   	ld	[%g2 + 0x1c], %f20
	.word	0x8d85c00a	! t0_kref+0x1344:   	wr	%l7, %o2, %fprs
	.word	0x91a01930	! t0_kref+0x1348:   	fstod	%f16, %f8
	.word	0xa8b330e0	! t0_kref+0x134c:   	orncc	%o4, -0xf20, %l4
	.word	0xf83e401d	! t0_kref+0x1350:   	std	%i4, [%i1 + %i5]
	.word	0x9ad27ffa	! t0_kref+0x1354:   	umulcc	%o1, -0x6, %o5
	.word	0x97a01a50	! t0_kref+0x1358:   	fdtoi	%f16, %f11
	.word	0xaa32400a	! t0_kref+0x135c:   	orn	%o1, %o2, %l5
	.word	0xe6560000	! t0_kref+0x1360:   	ldsh	[%i0], %l3
	.word	0x98c2401b	! t0_kref+0x1364:   	addccc	%o1, %i3, %o4
	.word	0xada649a9	! t0_kref+0x1368:   	fdivs	%f25, %f9, %f22
	.word	0x81ad0ad8	! t0_kref+0x136c:   	fcmped	%fcc0, %f20, %f24
	.word	0x22480006	! t0_kref+0x1370:   	be,a,pt	%icc, _kref+0x1388
	.word	0xa5b00fc0	! t0_kref+0x1374:   	fone	%f18
	.word	0x9a82fed2	! t0_kref+0x1378:   	addcc	%o3, -0x12e, %o5
	.word	0xea467fec	! t0_kref+0x137c:   	ldsw	[%i1 - 0x14], %l5
	.word	0x9088000d	! t0_kref+0x1380:   	andcc	%g0, %o5, %o0
	.word	0xdf270019	! t0_kref+0x1384:   	st	%f15, [%i4 + %i1]
	.word	0x81580000	! t0_kref+0x1388:   	flushw
	.word	0x93b5c154	! t0_kref+0x138c:   	edge32l	%l7, %l4, %o1
	.word	0x97b50f69	! t0_kref+0x1390:   	fornot1s	%f20, %f9, %f11
	.word	0x97a00530	! t0_kref+0x1394:   	fsqrts	%f16, %f11
	.word	0x34800008	! t0_kref+0x1398:   	bg,a	_kref+0x13b8
	.word	0x9fa01a31	! t0_kref+0x139c:   	fstoi	%f17, %f15
	.word	0x92f2776d	! t0_kref+0x13a0:   	udivcc	%o1, -0x893, %o1
	.word	0xa1a5094a	! t0_kref+0x13a4:   	fmuld	%f20, %f10, %f16
	.word	0xd0b66004	! t0_kref+0x13a8:   	stha	%o0, [%i1 + 4]%asi
	.word	0x2d800007	! t0_kref+0x13ac:   	fbg,a	_kref+0x13c8
	.word	0x97b34160	! t0_kref+0x13b0:   	edge32ln	%o5, %g0, %o3
	.word	0xe66e401a	! t0_kref+0x13b4:   	ldstub	[%i1 + %i2], %l3
	.word	0x94834008	! t0_kref+0x13b8:   	addcc	%o5, %o0, %o2
	.word	0x81830000	! t0_kref+0x13bc:   	wr	%o4, %g0, %y
	.word	0xada00530	! t0_kref+0x13c0:   	fsqrts	%f16, %f22
	.word	0xa212f5c1	! t0_kref+0x13c4:   	or	%o3, -0xa3f, %l1
	.word	0x9fa01a56	! t0_kref+0x13c8:   	fdtoi	%f22, %f15
	.word	0xa5a589b8	! t0_kref+0x13cc:   	fdivs	%f22, %f24, %f18
	.word	0xa4c24014	! t0_kref+0x13d0:   	addccc	%o1, %l4, %l2
	.word	0x8143e040	! t0_kref+0x13d4:   	membar	0x40
	.word	0xa840001a	! t0_kref+0x13d8:   	addc	%g0, %i2, %l4
	.word	0xd19f5a19	! t0_kref+0x13dc:   	ldda	[%i5 + %i1]0xd0, %f8
	.word	0x963376cd	! t0_kref+0x13e0:   	orn	%o5, -0x933, %o3
	.word	0x86102003	! t0_kref+0x13e4:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x13e8:   	bne,a	_kref+0x13e8
	.word	0x86a0e001	! t0_kref+0x13ec:   	subcc	%g3, 1, %g3
	.word	0xf19f1a18	! t0_kref+0x13f0:   	ldda	[%i4 + %i0]0xd0, %f24
	.word	0x2d2e9e10	! t0_kref+0x13f4:   	sethi	%hi(0xba784000), %l6
	.word	0xd4100018	! t0_kref+0x13f8:   	lduh	[%g0 + %i0], %o2
	.word	0xee070018	! t0_kref+0x13fc:   	ld	[%i4 + %i0], %l7
	.word	0xa876ee5a	! t0_kref+0x1400:   	udiv	%i3, 0xe5a, %l4
	.word	0xd4ce3fec	! t0_kref+0x1404:   	ldsba	[%i0 - 0x14]%asi, %o2
	.word	0x99a64d33	! t0_kref+0x1408:   	fsmuld	%f25, %f19, %f12
	.word	0x3e800006	! t0_kref+0x140c:   	bvc,a	_kref+0x1424
	.word	0xaba01a2f	! t0_kref+0x1410:   	fstoi	%f15, %f21
	.word	0xda08a009	! t0_kref+0x1414:   	ldub	[%g2 + 9], %o5
	.word	0x81ab8ad6	! t0_kref+0x1418:   	fcmped	%fcc0, %f14, %f22
	.word	0xa9a01a4e	! t0_kref+0x141c:   	fdtoi	%f14, %f20
	.word	0x293d3449	! t0_kref+0x1420:   	sethi	%hi(0xf4d12400), %l4
	.word	0xe780a024	! t0_kref+0x1424:   	lda	[%g2 + 0x24]%asi, %f19
	.word	0x90ad4014	! t0_kref+0x1428:   	andncc	%l5, %l4, %o0
	.word	0xdf20a018	! t0_kref+0x142c:   	st	%f15, [%g2 + 0x18]
	.word	0x81aa0ab5	! t0_kref+0x1430:   	fcmpes	%fcc0, %f8, %f21
	.word	0x81b01023	! t0_kref+0x1434:   	siam	0x3
	.word	0xd4f6501d	! t0_kref+0x1438:   	stxa	%o2, [%i1 + %i5]0x80
	.word	0x3b800006	! t0_kref+0x143c:   	fble,a	_kref+0x1454
	.word	0x9db00c00	! t0_kref+0x1440:   	fzero	%f14
	.word	0x90083cbd	! t0_kref+0x1444:   	and	%g0, -0x343, %o0
	.word	0xda10a036	! t0_kref+0x1448:   	lduh	[%g2 + 0x36], %o5
	.word	0xee6e6017	! t0_kref+0x144c:   	ldstub	[%i1 + 0x17], %l7
	.word	0x963eba9f	! t0_kref+0x1450:   	xnor	%i2, -0x561, %o3
	.word	0xa5b5cfad	! t0_kref+0x1454:   	fors	%f23, %f13, %f18
	.word	0x3e480003	! t0_kref+0x1458:   	bvc,a,pt	%icc, _kref+0x1464
	.word	0xde4e8018	! t0_kref+0x145c:   	ldsb	[%i2 + %i0], %o7
	.word	0x93b34009	! t0_kref+0x1460:   	edge8	%o5, %o1, %o1
	.word	0xda160000	! t0_kref+0x1464:   	lduh	[%i0], %o5
	.word	0xe24e001a	! t0_kref+0x1468:   	ldsb	[%i0 + %i2], %l1
	.word	0x9ef5001b	! t0_kref+0x146c:   	udivcc	%l4, %i3, %o7
	.word	0xa5b44dee	! t0_kref+0x1470:   	fnands	%f17, %f14, %f18
	.word	0x9da01937	! t0_kref+0x1474:   	fstod	%f23, %f14
	.word	0xe1be1857	! t0_kref+0x1478:   	stda	%f16, [%i0 + %l7]0xc2
	.word	0xf6200019	! t0_kref+0x147c:   	st	%i3, [%g0 + %i1]
	.word	0x81aa0ad2	! t0_kref+0x1480:   	fcmped	%fcc0, %f8, %f18
	.word	0xf83e0000	! t0_kref+0x1484:   	std	%i4, [%i0]
	.word	0x93b2854a	! t0_kref+0x1488:   	fcmpeq16	%f10, %f10, %o1
	.word	0xf76e6000	! t0_kref+0x148c:   	prefetch	%i1, 27
	.word	0x3c480004	! t0_kref+0x1490:   	bpos,a,pt	%icc, _kref+0x14a0
	.word	0xa00d2372	! t0_kref+0x1494:   	and	%l4, 0x372, %l0
	.word	0x3e480002	! t0_kref+0x1498:   	bvc,a,pt	%icc, _kref+0x14a0
	.word	0x91a28858	! t0_kref+0x149c:   	faddd	%f10, %f24, %f8
	.word	0xa00339ae	! t0_kref+0x14a0:   	add	%o4, -0x652, %l0
	.word	0x9633401b	! t0_kref+0x14a4:   	orn	%o5, %i3, %o3
	.word	0x22480001	! t0_kref+0x14a8:   	be,a,pt	%icc, _kref+0x14ac
	.word	0xe91f4019	! t0_kref+0x14ac:   	ldd	[%i5 + %i1], %f20
	.word	0x99b44c6b	! t0_kref+0x14b0:   	fnors	%f17, %f11, %f12
	.word	0x91a4084a	! t0_kref+0x14b4:   	faddd	%f16, %f10, %f8
	.word	0x95a50d38	! t0_kref+0x14b8:   	fsmuld	%f20, %f24, %f10
	.word	0xe24e401a	! t0_kref+0x14bc:   	ldsb	[%i1 + %i2], %l1
	.word	0xdade2000	! t0_kref+0x14c0:   	ldxa	[%i0]%asi, %o5
	.word	0xa6bac008	! t0_kref+0x14c4:   	xnorcc	%o3, %o0, %l3
	.word	0xd206200c	! t0_kref+0x14c8:   	ld	[%i0 + 0xc], %o1
	.word	0xe1be5889	! t0_kref+0x14cc:   	stda	%f16, [%i1 + %o1]0xc4
	.word	0xa615674d	! t0_kref+0x14d0:   	or	%l5, 0x74d, %l3
	.word	0xabb64a70	! t0_kref+0x14d4:   	fpadd32s	%f25, %f16, %f21
	call	SYM(t0_subr1)
	.word	0xc0367ff4	! t0_kref+0x14dc:   	clrh	[%i1 - 0xc]
	.word	0xa1b38a92	! t0_kref+0x14e0:   	fpsub16	%f14, %f18, %f16
	.word	0x36480004	! t0_kref+0x14e4:   	bge,a,pt	%icc, _kref+0x14f4
	.word	0xee88a039	! t0_kref+0x14e8:   	lduba	[%g2 + 0x39]%asi, %l7
	.word	0xa4dec00c	! t0_kref+0x14ec:   	smulcc	%i3, %o4, %l2
	.word	0xe2563ff6	! t0_kref+0x14f0:   	ldsh	[%i0 - 0xa], %l1
	.word	0x93a01a36	! t0_kref+0x14f4:   	fstoi	%f22, %f9
	.word	0xadb2034b	! t0_kref+0x14f8:   	alignaddrl	%o0, %o3, %l6
	.word	0x9ac32a15	! t0_kref+0x14fc:   	addccc	%o4, 0xa15, %o5
	.word	0xe850a020	! t0_kref+0x1500:   	ldsh	[%g2 + 0x20], %l4
	.word	0xf96e2010	! t0_kref+0x1504:   	prefetch	%i0 + 0x10, 28
	.word	0xae8eb5b1	! t0_kref+0x1508:   	andcc	%i2, -0xa4f, %l7
	.word	0x25800001	! t0_kref+0x150c:   	fblg,a	_kref+0x1510
	.word	0x9da01939	! t0_kref+0x1510:   	fstod	%f25, %f14
	.word	0x9ee58016	! t0_kref+0x1514:   	subccc	%l6, %l6, %o7
	.word	0xb3b00c20	! t0_kref+0x1518:   	fzeros	%f25
	.word	0x27800004	! t0_kref+0x151c:   	fbul,a	_kref+0x152c
	.word	0xafb6c177	! t0_kref+0x1520:   	edge32ln	%i3, %l7, %l7
	.word	0x99b40994	! t0_kref+0x1524:   	bshuffle	%f16, %f20, %f12
	.word	0xec1e6018	! t0_kref+0x1528:   	ldd	[%i1 + 0x18], %l6
	.word	0xada01a29	! t0_kref+0x152c:   	fstoi	%f9, %f22
	.word	0xe300a034	! t0_kref+0x1530:   	ld	[%g2 + 0x34], %f17
	.word	0xa9b68168	! t0_kref+0x1534:   	edge32ln	%i2, %o0, %l4
	.word	0x9b2aa014	! t0_kref+0x1538:   	sll	%o2, 0x14, %o5
	call	SYM(t0_subr3)
	.word	0xd226601c	! t0_kref+0x1540:   	st	%o1, [%i1 + 0x1c]
	.word	0xd3267ffc	! t0_kref+0x1544:   	st	%f9, [%i1 - 4]
	.word	0x99b38e14	! t0_kref+0x1548:   	fand	%f14, %f20, %f12
	.word	0xa2b32ae7	! t0_kref+0x154c:   	orncc	%o4, 0xae7, %l1
	.word	0x9db6072f	! t0_kref+0x1550:   	fmuld8ulx16	%f24, %f15, %f14
	.word	0x96b33a9c	! t0_kref+0x1554:   	orncc	%o4, -0x564, %o3
	.word	0xa3b2812a	! t0_kref+0x1558:   	edge32n	%o2, %o2, %l1
	.word	0xa3a448b6	! t0_kref+0x155c:   	fsubs	%f17, %f22, %f17
	.word	0x91a3cd31	! t0_kref+0x1560:   	fsmuld	%f15, %f17, %f8
	.word	0xe96e3ff8	! t0_kref+0x1564:   	prefetch	%i0 - 8, 20
	.word	0xa9b48e54	! t0_kref+0x1568:   	fxnor	%f18, %f20, %f20
	.word	0xe9be584c	! t0_kref+0x156c:   	stda	%f20, [%i1 + %o4]0xc2
	.word	0x39800003	! t0_kref+0x1570:   	fbuge,a	_kref+0x157c
	.word	0xd1861000	! t0_kref+0x1574:   	lda	[%i0]0x80, %f8
	.word	0xd91f4019	! t0_kref+0x1578:   	ldd	[%i5 + %i1], %f12
	.word	0x8610201b	! t0_kref+0x157c:   	mov	0x1b, %g3
	.word	0x86a0e001	! t0_kref+0x1580:   	subcc	%g3, 1, %g3
	.word	0x2280000d	! t0_kref+0x1584:   	be,a	_kref+0x15b8
	.word	0xa5a0004c	! t0_kref+0x1588:   	fmovd	%f12, %f18
	.word	0xc0364000	! t0_kref+0x158c:   	clrh	[%i1]
	.word	0xa8222ae9	! t0_kref+0x1590:   	sub	%o0, 0xae9, %l4
	.word	0xaee6e302	! t0_kref+0x1594:   	subccc	%i3, 0x302, %l7
	.word	0x9fa01a54	! t0_kref+0x1598:   	fdtoi	%f20, %f15
	.word	0xe91e7fe8	! t0_kref+0x159c:   	ldd	[%i1 - 0x18], %f20
	.word	0x81ae0acc	! t0_kref+0x15a0:   	fcmped	%fcc0, %f24, %f12
	.word	0x960d6976	! t0_kref+0x15a4:   	and	%l5, 0x976, %o3
	.word	0x988a7115	! t0_kref+0x15a8:   	andcc	%o1, -0xeeb, %o4
	.word	0xa9b00cf9	! t0_kref+0x15ac:   	fnot2s	%f25, %f20
	.word	0x2f354fd6	! t0_kref+0x15b0:   	sethi	%hi(0xd53f5800), %l7
	.word	0xad2dc00b	! t0_kref+0x15b4:   	sll	%l7, %o3, %l6
	.word	0x86102003	! t0_kref+0x15b8:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x15bc:   	bne,a	_kref+0x15bc
	.word	0x86a0e001	! t0_kref+0x15c0:   	subcc	%g3, 1, %g3
	.word	0xdfa66010	! t0_kref+0x15c4:   	sta	%f15, [%i1 + 0x10]%asi
	.word	0xe208a01e	! t0_kref+0x15c8:   	ldub	[%g2 + 0x1e], %l1
	.word	0xafb58492	! t0_kref+0x15cc:   	fcmple32	%f22, %f18, %l7
	.word	0x9a9b6e1d	! t0_kref+0x15d0:   	xorcc	%o5, 0xe1d, %o5
	.word	0x8143e072	! t0_kref+0x15d4:   	membar	0x72
	.word	0x98aac00a	! t0_kref+0x15d8:   	andncc	%o3, %o2, %o4
	.word	0xa212bf58	! t0_kref+0x15dc:   	or	%o2, -0xa8, %l1
	.word	0xa913401b	! t0_kref+0x15e0:   	taddcctv	%o5, %i3, %l4
	.word	0xec5e7fe0	! t0_kref+0x15e4:   	ldx	[%i1 - 0x20], %l6
	.word	0x81820000	! t0_kref+0x15e8:   	wr	%o0, %g0, %y
	.word	0xa1b484d2	! t0_kref+0x15ec:   	fcmpne32	%f18, %f18, %l0
	.word	0x1737a0e1	! t0_kref+0x15f0:   	sethi	%hi(0xde838400), %o3
	.word	0xe49f5019	! t0_kref+0x15f4:   	ldda	[%i5 + %i1]0x80, %l2
	.word	0x95a0054c	! t0_kref+0x15f8:   	fsqrtd	%f12, %f10
	.word	0xd4a8a001	! t0_kref+0x15fc:   	stba	%o2, [%g2 + 1]%asi
	.word	0x86102006	! t0_kref+0x1600:   	mov	0x6, %g3
	.word	0x86a0e001	! t0_kref+0x1604:   	subcc	%g3, 1, %g3
	.word	0x22800003	! t0_kref+0x1608:   	be,a	_kref+0x1614
	.word	0xa470000c	! t0_kref+0x160c:   	udiv	%g0, %o4, %l2
	.word	0xa9a000c8	! t0_kref+0x1610:   	fnegd	%f8, %f20
	.word	0xa4b5b423	! t0_kref+0x1614:   	orncc	%l6, -0xbdd, %l2
	.word	0xb1a0002e	! t0_kref+0x1618:   	fmovs	%f14, %f24
	.word	0xa1b38f94	! t0_kref+0x161c:   	for	%f14, %f20, %f16
	.word	0x91b58d0c	! t0_kref+0x1620:   	fandnot1	%f22, %f12, %f8
	.word	0xed062004	! t0_kref+0x1624:   	ld	[%i0 + 4], %f22
	.word	0x3a800002	! t0_kref+0x1628:   	bcc,a	_kref+0x1630
	.word	0x9fa0002a	! t0_kref+0x162c:   	fmovs	%f10, %f15
	.word	0x963ac015	! t0_kref+0x1630:   	xnor	%o3, %l5, %o3
	.word	0xebe8a08e	! t0_kref+0x1634:   	prefetcha	%g2 + 0x8e, 21
	.word	0xd06e2017	! t0_kref+0x1638:   	ldstub	[%i0 + 0x17], %o0
	.word	0x9fa01a4a	! t0_kref+0x163c:   	fdtoi	%f10, %f15
	.word	0xab253509	! t0_kref+0x1640:   	mulscc	%l4, -0xaf7, %l5
	.word	0xabb00772	! t0_kref+0x1644:   	fpack16	%f18, %f21
	.word	0xa3a0012b	! t0_kref+0x1648:   	fabss	%f11, %f17
	.word	0x9da01a2f	! t0_kref+0x164c:   	fstoi	%f15, %f14
	.word	0x93a0188c	! t0_kref+0x1650:   	fitos	%f12, %f9
	.word	0x99a0054e	! t0_kref+0x1654:   	fsqrtd	%f14, %f12
	.word	0xf6363ff6	! t0_kref+0x1658:   	sth	%i3, [%i0 - 0xa]
	.word	0xa9b58ca8	! t0_kref+0x165c:   	fandnot2s	%f22, %f8, %f20
	.word	0x8143c000	! t0_kref+0x1660:   	stbar
	.word	0x9da018d4	! t0_kref+0x1664:   	fdtos	%f20, %f14
	.word	0x9da01a52	! t0_kref+0x1668:   	fdtoi	%f18, %f14
	.word	0xa80b0016	! t0_kref+0x166c:   	and	%o4, %l6, %l4
	.word	0xa5a0052a	! t0_kref+0x1670:   	fsqrts	%f10, %f18
	.word	0xdd00a03c	! t0_kref+0x1674:   	ld	[%g2 + 0x3c], %f14
	.word	0x9db28e2f	! t0_kref+0x1678:   	fands	%f10, %f15, %f14
	.word	0xe6562006	! t0_kref+0x167c:   	ldsh	[%i0 + 6], %l3
	.word	0xb1a018d2	! t0_kref+0x1680:   	fdtos	%f18, %f24
	.word	0xd036201c	! t0_kref+0x1684:   	sth	%o0, [%i0 + 0x1c]
	.word	0xdd00a034	! t0_kref+0x1688:   	ld	[%g2 + 0x34], %f14
	.word	0x93a00031	! t0_kref+0x168c:   	fmovs	%f17, %f9
	.word	0x9295000d	! t0_kref+0x1690:   	orcc	%l4, %o5, %o1
	.word	0x9e056935	! t0_kref+0x1694:   	add	%l5, 0x935, %o7
	.word	0xd296501b	! t0_kref+0x1698:   	lduha	[%i1 + %i3]0x80, %o1
	.word	0xe8567ffe	! t0_kref+0x169c:   	ldsh	[%i1 - 2], %l4
	.word	0x86102005	! t0_kref+0x16a0:   	mov	0x5, %g3
	.word	0x86a0e001	! t0_kref+0x16a4:   	subcc	%g3, 1, %g3
	.word	0x2280000b	! t0_kref+0x16a8:   	be,a	_kref+0x16d4
	.word	0xafb5858e	! t0_kref+0x16ac:   	fcmpgt32	%f22, %f14, %l7
	.word	0xa1a0192b	! t0_kref+0x16b0:   	fstod	%f11, %f16
	.word	0xad3da01a	! t0_kref+0x16b4:   	sra	%l6, 0x1a, %l6
	.word	0xb3a01894	! t0_kref+0x16b8:   	fitos	%f20, %f25
	.word	0xaef5a2cf	! t0_kref+0x16bc:   	udivcc	%l6, 0x2cf, %l7
	.word	0x96ab000b	! t0_kref+0x16c0:   	andncc	%o4, %o3, %o3
	.word	0x9fb60594	! t0_kref+0x16c4:   	fcmpgt32	%f24, %f20, %o7
	.word	0x81800000	! t0_kref+0x16c8:   	mov	%g0, %y
!	.word	0x3a48624c	! t0_kref+0x16cc:   	bcc,a,pt	%icc, SYM(t0_subr2)
	   	bcc,a,pt	%icc, SYM(t0_subr2)
	.word	0x9e006bf0	! t0_kref+0x16d0:   	add	%g1, 0xbf0, %o7
	.word	0x95a60952	! t0_kref+0x16d4:   	fmuld	%f24, %f18, %f10
	.word	0x91b60990	! t0_kref+0x16d8:   	bshuffle	%f24, %f16, %f8
	.word	0x9bb2406d	! t0_kref+0x16dc:   	edge8ln	%o1, %o5, %o5
	.word	0xd240a030	! t0_kref+0x16e0:   	ldsw	[%g2 + 0x30], %o1
	.word	0x95a01937	! t0_kref+0x16e4:   	fstod	%f23, %f10
	.word	0xea50a01e	! t0_kref+0x16e8:   	ldsh	[%g2 + 0x1e], %l5
	.word	0xada01930	! t0_kref+0x16ec:   	fstod	%f16, %f22
	.word	0x30480003	! t0_kref+0x16f0:   	ba,a,pt	%icc, _kref+0x16fc
	.word	0xf19e5a1a	! t0_kref+0x16f4:   	ldda	[%i1 + %i2]0xd0, %f24
	.word	0xc9ee1016	! t0_kref+0x16f8:   	prefetcha	%i0 + %l6, 4
	.word	0xec10a024	! t0_kref+0x16fc:   	lduh	[%g2 + 0x24], %l6
	.word	0xee6e2003	! t0_kref+0x1700:   	ldstub	[%i0 + 3], %l7
	.word	0x81aa4aaa	! t0_kref+0x1704:   	fcmpes	%fcc0, %f9, %f10
	.word	0xd8be6000	! t0_kref+0x1708:   	stda	%o4, [%i1]%asi
	call	SYM(t0_subr0)
	.word	0xab254017	! t0_kref+0x1710:   	mulscc	%l5, %l7, %l5
	.word	0xa5b30c58	! t0_kref+0x1714:   	fnor	%f12, %f24, %f18
	.word	0xd240a03c	! t0_kref+0x1718:   	ldsw	[%g2 + 0x3c], %o1
	.word	0x3a480007	! t0_kref+0x171c:   	bcc,a,pt	%icc, _kref+0x1738
	.word	0xa1a209a9	! t0_kref+0x1720:   	fdivs	%f8, %f9, %f16
	.word	0xe0563fe6	! t0_kref+0x1724:   	ldsh	[%i0 - 0x1a], %l0
	.word	0xa0d2001b	! t0_kref+0x1728:   	umulcc	%o0, %i3, %l0
	.word	0x25800007	! t0_kref+0x172c:   	fblg,a	_kref+0x1748
	.word	0xd850a002	! t0_kref+0x1730:   	ldsh	[%g2 + 2], %o4
	.word	0x9da2084a	! t0_kref+0x1734:   	faddd	%f8, %f10, %f14
	.word	0xee262014	! t0_kref+0x1738:   	st	%l7, [%i0 + 0x14]
	.word	0xda36001b	! t0_kref+0x173c:   	sth	%o5, [%i0 + %i3]
	.word	0xa9b00f0a	! t0_kref+0x1740:   	fsrc2	%f10, %f20
	.word	0x81b01020	! t0_kref+0x1744:   	siam	0x0
	.word	0x2725a4b3	! t0_kref+0x1748:   	sethi	%hi(0x9692cc00), %l3
	.word	0xa2adc00d	! t0_kref+0x174c:   	andncc	%l7, %o5, %l1
	.word	0xd2c0a018	! t0_kref+0x1750:   	ldswa	[%g2 + 0x18]%asi, %o1
	.word	0x34480002	! t0_kref+0x1754:   	bg,a,pt	%icc, _kref+0x175c
	.word	0xa3a508ad	! t0_kref+0x1758:   	fsubs	%f20, %f13, %f17
	.word	0xa5a489ad	! t0_kref+0x175c:   	fdivs	%f18, %f13, %f18
	.word	0x99b60f4e	! t0_kref+0x1760:   	fornot1	%f24, %f14, %f12
	.word	0x2a480006	! t0_kref+0x1764:   	bcs,a,pt	%icc, _kref+0x177c
	.word	0xf56e401d	! t0_kref+0x1768:   	prefetch	%i1 + %i5, 26
	.word	0x91a0192e	! t0_kref+0x176c:   	fstod	%f14, %f8
	.word	0xe16e401a	! t0_kref+0x1770:   	prefetch	%i1 + %i2, 16
	.word	0xada448a9	! t0_kref+0x1774:   	fsubs	%f17, %f9, %f22
	.word	0x9a930015	! t0_kref+0x1778:   	orcc	%o4, %l5, %o5
	.word	0x81aa8ac8	! t0_kref+0x177c:   	fcmped	%fcc0, %f10, %f8
	.word	0xad700000	! t0_kref+0x1780:   	popc	%g0, %l6
	.word	0xc36e400c	! t0_kref+0x1784:   	prefetch	%i1 + %o4, 1
	.word	0xd250a02e	! t0_kref+0x1788:   	ldsh	[%g2 + 0x2e], %o1
	.word	0x9bb2807b	! t0_kref+0x178c:   	edge8ln	%o2, %i3, %o5
	.word	0xaba01a48	! t0_kref+0x1790:   	fdtoi	%f8, %f21
	.word	0xde567fe0	! t0_kref+0x1794:   	ldsh	[%i1 - 0x20], %o7
	.word	0x3a480002	! t0_kref+0x1798:   	bcc,a,pt	%icc, _kref+0x17a0
	.word	0xda16401b	! t0_kref+0x179c:   	lduh	[%i1 + %i3], %o5
	.word	0x9db4c714	! t0_kref+0x17a0:   	fmuld8sux16	%f19, %f20, %f14
	.word	0x3e800004	! t0_kref+0x17a4:   	bvc,a	_kref+0x17b4
	.word	0x99b40a88	! t0_kref+0x17a8:   	fpsub16	%f16, %f8, %f12
	.word	0xa0d2c00a	! t0_kref+0x17ac:   	umulcc	%o3, %o2, %l0
	.word	0x9da00048	! t0_kref+0x17b0:   	fmovd	%f8, %f14
	.word	0x2e800001	! t0_kref+0x17b4:   	bvs,a	_kref+0x17b8
	.word	0xac436f2b	! t0_kref+0x17b8:   	addc	%o5, 0xf2b, %l6
	.word	0xf436401b	! t0_kref+0x17bc:   	sth	%i2, [%i1 + %i3]
	.word	0xc768a006	! t0_kref+0x17c0:   	prefetch	%g2 + 6, 3
	.word	0xa9b6096c	! t0_kref+0x17c4:   	fpmerge	%f24, %f12, %f20
	.word	0xada58831	! t0_kref+0x17c8:   	fadds	%f22, %f17, %f22
	.word	0xaba00033	! t0_kref+0x17cc:   	fmovs	%f19, %f21
	.word	0xafb50488	! t0_kref+0x17d0:   	fcmple32	%f20, %f8, %l7
	.word	0x13240230	! t0_kref+0x17d4:   	sethi	%hi(0x9008c000), %o1
	.word	0xdac0a034	! t0_kref+0x17d8:   	ldswa	[%g2 + 0x34]%asi, %o5
	.word	0x93a288b8	! t0_kref+0x17dc:   	fsubs	%f10, %f24, %f9
	.word	0x91a01a4e	! t0_kref+0x17e0:   	fdtoi	%f14, %f8
	.word	0xac26801b	! t0_kref+0x17e4:   	sub	%i2, %i3, %l6
	.word	0xd2300018	! t0_kref+0x17e8:   	sth	%o1, [%g0 + %i0]
	.word	0x21309551	! t0_kref+0x17ec:   	sethi	%hi(0xc2554400), %l0
	.word	0xfdee101b	! t0_kref+0x17f0:   	prefetcha	%i0 + %i3, 30
	.word	0xd2270018	! t0_kref+0x17f4:   	st	%o1, [%i4 + %i0]
	.word	0x9636c00a	! t0_kref+0x17f8:   	orn	%i3, %o2, %o3
	.word	0xee0e001a	! t0_kref+0x17fc:   	ldub	[%i0 + %i2], %l7
	.word	0xc96e2010	! t0_kref+0x1800:   	prefetch	%i0 + 0x10, 4
	.word	0xe53e7ff8	! t0_kref+0x1804:   	std	%f18, [%i1 - 8]
	.word	0xe3a67ffc	! t0_kref+0x1808:   	sta	%f17, [%i1 - 4]%asi
	.word	0xa7b68156	! t0_kref+0x180c:   	edge32l	%i2, %l6, %l3
	.word	0xada3c8b5	! t0_kref+0x1810:   	fsubs	%f15, %f21, %f22
	.word	0x91a88050	! t0_kref+0x1814:   	fmovdlg	%fcc0, %f16, %f8
	.word	0x95b3866c	! t0_kref+0x1818:   	fmul8x16au	%f14, %f12, %f10
	.word	0xa7a388ad	! t0_kref+0x181c:   	fsubs	%f14, %f13, %f19
	.word	0xa6ad001b	! t0_kref+0x1820:   	andncc	%l4, %i3, %l3
	.word	0xe1270019	! t0_kref+0x1824:   	st	%f16, [%i4 + %i1]
	.word	0x9ba00029	! t0_kref+0x1828:   	fmovs	%f9, %f13
	.word	0xed3e7ff0	! t0_kref+0x182c:   	std	%f22, [%i1 - 0x10]
	.word	0x9ed37aad	! t0_kref+0x1830:   	umulcc	%o5, -0x553, %o7
	.word	0xb1a01116	! t0_kref+0x1834:   	fxtod	%f22, %f24
	.word	0xea367ff4	! t0_kref+0x1838:   	sth	%l5, [%i1 - 0xc]
	.word	0xa08eb0b2	! t0_kref+0x183c:   	andcc	%i2, -0xf4e, %l0
	.word	0xadb28912	! t0_kref+0x1840:   	faligndata	%f10, %f18, %f22
	.word	0xd480a018	! t0_kref+0x1844:   	lda	[%g2 + 0x18]%asi, %o2
	.word	0xf3a0a03c	! t0_kref+0x1848:   	sta	%f25, [%g2 + 0x3c]%asi
	.word	0x99a60d28	! t0_kref+0x184c:   	fsmuld	%f24, %f8, %f12
	.word	0x9da5082d	! t0_kref+0x1850:   	fadds	%f20, %f13, %f14
	.word	0x96883cb9	! t0_kref+0x1854:   	andcc	%g0, -0x347, %o3
	.word	0xd326601c	! t0_kref+0x1858:   	st	%f9, [%i1 + 0x1c]
	.word	0xee366014	! t0_kref+0x185c:   	sth	%l7, [%i1 + 0x14]
	.word	0x9fb00348	! t0_kref+0x1860:   	alignaddrl	%g0, %o0, %o7
	.word	0xf326401c	! t0_kref+0x1864:   	st	%f25, [%i1 + %i4]
	.word	0x24800003	! t0_kref+0x1868:   	ble,a	_kref+0x1874
	.word	0xec08a01b	! t0_kref+0x186c:   	ldub	[%g2 + 0x1b], %l6
	.word	0x9fa01a35	! t0_kref+0x1870:   	fstoi	%f21, %f15
	.word	0xf6280018	! t0_kref+0x1874:   	stb	%i3, [%g0 + %i0]
	.word	0x95a50954	! t0_kref+0x1878:   	fmuld	%f20, %f20, %f10
	.word	0x28480004	! t0_kref+0x187c:   	bleu,a,pt	%icc, _kref+0x188c
	.word	0xe4070018	! t0_kref+0x1880:   	ld	[%i4 + %i0], %l2
	.word	0xb3a000b8	! t0_kref+0x1884:   	fnegs	%f24, %f25
	.word	0xe91861d0	! t0_kref+0x1888:   	ldd	[%g1 + 0x1d0], %f20
	.word	0x91b5c136	! t0_kref+0x188c:   	edge32n	%l7, %l6, %o0
	.word	0xaef2000d	! t0_kref+0x1890:   	udivcc	%o0, %o5, %l7
	.word	0xa5a30d2f	! t0_kref+0x1894:   	fsmuld	%f12, %f15, %f18
	.word	0x27051c53	! t0_kref+0x1898:   	sethi	%hi(0x14714c00), %l3
	.word	0xd44e3ffa	! t0_kref+0x189c:   	ldsb	[%i0 - 6], %o2
	.word	0xe686501c	! t0_kref+0x18a0:   	lda	[%i1 + %i4]0x80, %l3
	.word	0x28480005	! t0_kref+0x18a4:   	bleu,a,pt	%icc, _kref+0x18b8
	.word	0xd7070018	! t0_kref+0x18a8:   	ld	[%i4 + %i0], %f11
	.word	0xac224017	! t0_kref+0x18ac:   	sub	%o1, %l7, %l6
	.word	0x9bb68240	! t0_kref+0x18b0:   	array16	%i2, %g0, %o5
	.word	0xc3ee5016	! t0_kref+0x18b4:   	prefetcha	%i1 + %l6, 1
	.word	0x3e480007	! t0_kref+0x18b8:   	bvc,a,pt	%icc, _kref+0x18d4
	.word	0xafa2c8b0	! t0_kref+0x18bc:   	fsubs	%f11, %f16, %f23
	.word	0x98f3401a	! t0_kref+0x18c0:   	udivcc	%o5, %i2, %o4
	.word	0x93a00129	! t0_kref+0x18c4:   	fabss	%f9, %f9
	.word	0x99b38d32	! t0_kref+0x18c8:   	fandnot1s	%f14, %f18, %f12
	.word	0x9a2a4015	! t0_kref+0x18cc:   	andn	%o1, %l5, %o5
	.word	0x2b800005	! t0_kref+0x18d0:   	fbug,a	_kref+0x18e4
	.word	0x912a2004	! t0_kref+0x18d4:   	sll	%o0, 0x4, %o0
	.word	0x81ac8ad2	! t0_kref+0x18d8:   	fcmped	%fcc0, %f18, %f18
	.word	0xa5b00cce	! t0_kref+0x18dc:   	fnot2	%f14, %f18
	.word	0xb3a01a50	! t0_kref+0x18e0:   	fdtoi	%f16, %f25
	.word	0xadb28448	! t0_kref+0x18e4:   	fcmpne16	%f10, %f8, %l6
	.word	0xa9a00558	! t0_kref+0x18e8:   	fsqrtd	%f24, %f20
	.word	0xa80b4016	! t0_kref+0x18ec:   	and	%o5, %l6, %l4
	.word	0xe6ee6004	! t0_kref+0x18f0:   	ldstuba	[%i1 + 4]%asi, %l3
	.word	0xc036600e	! t0_kref+0x18f4:   	clrh	[%i1 + 0xe]
	.word	0x91a00550	! t0_kref+0x18f8:   	fsqrtd	%f16, %f8
	.word	0xe68e3fe1	! t0_kref+0x18fc:   	lduba	[%i0 - 0x1f]%asi, %l3
	.word	0x97b007b8	! t0_kref+0x1900:   	fpackfix	%f24, %f11
	.word	0xe41e3ff8	! t0_kref+0x1904:   	ldd	[%i0 - 8], %l2
	.word	0x36800001	! t0_kref+0x1908:   	bge,a	_kref+0x190c
	.word	0xd02e6002	! t0_kref+0x190c:   	stb	%o0, [%i1 + 2]
	.word	0x2f3136e3	! t0_kref+0x1910:   	sethi	%hi(0xc4db8c00), %l7
	.word	0xada01a2f	! t0_kref+0x1914:   	fstoi	%f15, %f22
	.word	0xa7a018c8	! t0_kref+0x1918:   	fdtos	%f8, %f19
	.word	0xab3ea01b	! t0_kref+0x191c:   	sra	%i2, 0x1b, %l5
	.word	0x98436e05	! t0_kref+0x1920:   	addc	%o5, 0xe05, %o4
	.word	0xd65e6000	! t0_kref+0x1924:   	ldx	[%i1], %o3
	.word	0xd80e001a	! t0_kref+0x1928:   	ldub	[%i0 + %i2], %o4
	.word	0xb1b58748	! t0_kref+0x192c:   	fpack32	%f22, %f8, %f24
	.word	0xa3400000	! t0_kref+0x1930:   	mov	%y, %l1
	.word	0x9af00000	! t0_kref+0x1934:   	udivcc	%g0, %g0, %o5
	.word	0x81ad8ac8	! t0_kref+0x1938:   	fcmped	%fcc0, %f22, %f8
	.word	0xed380019	! t0_kref+0x193c:   	std	%f22, [%g0 + %i1]
	.word	0xaba2c82d	! t0_kref+0x1940:   	fadds	%f11, %f13, %f21
	.word	0x36800002	! t0_kref+0x1944:   	bge,a	_kref+0x194c
	.word	0xa3a649b6	! t0_kref+0x1948:   	fdivs	%f25, %f22, %f17
	.word	0x94b269c0	! t0_kref+0x194c:   	orncc	%o1, 0x9c0, %o2
	.word	0xa9a018ca	! t0_kref+0x1950:   	fdtos	%f10, %f20
	.word	0xe5267fe8	! t0_kref+0x1954:   	st	%f18, [%i1 - 0x18]
	.word	0xd180a00c	! t0_kref+0x1958:   	lda	[%g2 + 0xc]%asi, %f8
	.word	0x99a0188e	! t0_kref+0x195c:   	fitos	%f14, %f12
	.word	0xd86e0000	! t0_kref+0x1960:   	ldstub	[%i0], %o4
	.word	0x94922b98	! t0_kref+0x1964:   	orcc	%o0, 0xb98, %o2
	.word	0xaba00038	! t0_kref+0x1968:   	fmovs	%f24, %f21
	.word	0xab20000c	! t0_kref+0x196c:   	mulscc	%g0, %o4, %l5
	.word	0xe27e7fe4	! t0_kref+0x1970:   	swap	[%i1 - 0x1c], %l1
	.word	0xa3a608b7	! t0_kref+0x1974:   	fsubs	%f24, %f23, %f17
	.word	0x99b40e18	! t0_kref+0x1978:   	fand	%f16, %f24, %f12
	.word	0xb3a01a29	! t0_kref+0x197c:   	fstoi	%f9, %f25
	.word	0xea06401c	! t0_kref+0x1980:   	ld	[%i1 + %i4], %l5
	.word	0xee6e7fe7	! t0_kref+0x1984:   	ldstub	[%i1 - 0x19], %l7
	.word	0xd06e3fe9	! t0_kref+0x1988:   	ldstub	[%i0 - 0x17], %o0
	.word	0xee4e2001	! t0_kref+0x198c:   	ldsb	[%i0 + 1], %l7
	.word	0x81820000	! t0_kref+0x1990:   	wr	%o0, %g0, %y
	.word	0x9a2daea5	! t0_kref+0x1994:   	andn	%l6, 0xea5, %o5
	.word	0x28480004	! t0_kref+0x1998:   	bleu,a,pt	%icc, _kref+0x19a8
	.word	0xb3a548b3	! t0_kref+0x199c:   	fsubs	%f21, %f19, %f25
	.word	0xe2567ff6	! t0_kref+0x19a0:   	ldsh	[%i1 - 0xa], %l1
	.word	0x91b20a56	! t0_kref+0x19a4:   	fpadd32	%f8, %f22, %f8
	.word	0x27800006	! t0_kref+0x19a8:   	fbul,a	_kref+0x19c0
	.word	0xa9b3466d	! t0_kref+0x19ac:   	fmul8x16au	%f13, %f13, %f20
	.word	0xb3a649b8	! t0_kref+0x19b0:   	fdivs	%f25, %f24, %f25
	.word	0xa4d23824	! t0_kref+0x19b4:   	umulcc	%o0, -0x7dc, %l2
	.word	0xec9e7ff0	! t0_kref+0x19b8:   	ldda	[%i1 - 0x10]%asi, %l6
	.word	0xd02e7fe0	! t0_kref+0x19bc:   	stb	%o0, [%i1 - 0x20]
	.word	0x8582000c	! t0_kref+0x19c0:   	wr	%o0, %o4, %ccr
	.word	0x81aa0ad8	! t0_kref+0x19c4:   	fcmped	%fcc0, %f8, %f24
	.word	0xdf80a034	! t0_kref+0x19c8:   	lda	[%g2 + 0x34]%asi, %f15
	.word	0xe250a022	! t0_kref+0x19cc:   	ldsh	[%g2 + 0x22], %l1
	.word	0x99b387d6	! t0_kref+0x19d0:   	pdist	%f14, %f22, %f12
	.word	0xeb267ffc	! t0_kref+0x19d4:   	st	%f21, [%i1 - 4]
	.word	0xa2750017	! t0_kref+0x19d8:   	udiv	%l4, %l7, %l1
	.word	0x28480002	! t0_kref+0x19dc:   	bleu,a,pt	%icc, _kref+0x19e4
	.word	0xa6252b2f	! t0_kref+0x19e0:   	sub	%l4, 0xb2f, %l3
	.word	0x3c480001	! t0_kref+0x19e4:   	bpos,a,pt	%icc, _kref+0x19e8
	.word	0x99b20100	! t0_kref+0x19e8:   	edge32	%o0, %g0, %o4
	.word	0xa4f68008	! t0_kref+0x19ec:   	udivcc	%i2, %o0, %l2
	.word	0x81aa0ad6	! t0_kref+0x19f0:   	fcmped	%fcc0, %f8, %f22
	.word	0x96dd0008	! t0_kref+0x19f4:   	smulcc	%l4, %o0, %o3
	.word	0x24800003	! t0_kref+0x19f8:   	ble,a	_kref+0x1a04
	.word	0x9482c00b	! t0_kref+0x19fc:   	addcc	%o3, %o3, %o2
	.word	0x97a01893	! t0_kref+0x1a00:   	fitos	%f19, %f11
	.word	0x36800001	! t0_kref+0x1a04:   	bge,a	_kref+0x1a08
	.word	0x9170001b	! t0_kref+0x1a08:   	popc	%i3, %o0
	.word	0xadb50f6f	! t0_kref+0x1a0c:   	fornot1s	%f20, %f15, %f22
	.word	0xe82e0000	! t0_kref+0x1a10:   	stb	%l4, [%i0]
	.word	0xdd9e7ff0	! t0_kref+0x1a14:   	ldda	[%i1 - 0x10]%asi, %f14
	.word	0x90ad000d	! t0_kref+0x1a18:   	andncc	%l4, %o5, %o0
	.word	0xa01327d6	! t0_kref+0x1a1c:   	or	%o4, 0x7d6, %l0
	.word	0xf7ee501c	! t0_kref+0x1a20:   	prefetcha	%i1 + %i4, 27
	.word	0xada40d2b	! t0_kref+0x1a24:   	fsmuld	%f16, %f11, %f22
	.word	0xafa00131	! t0_kref+0x1a28:   	fabss	%f17, %f23
	.word	0x9a36c00c	! t0_kref+0x1a2c:   	orn	%i3, %o4, %o5
	.word	0xe00e201e	! t0_kref+0x1a30:   	ldub	[%i0 + 0x1e], %l0
	.word	0x2e480004	! t0_kref+0x1a34:   	bvs,a,pt	%icc, _kref+0x1a44
	.word	0x93a249b3	! t0_kref+0x1a38:   	fdivs	%f9, %f19, %f9
	.word	0x9fc10000	! t0_kref+0x1a3c:   	call	%g4
	.word	0x98127cb6	! t0_kref+0x1a40:   	or	%o1, -0x34a, %o4
	.word	0xb3a01a4e	! t0_kref+0x1a44:   	fdtoi	%f14, %f25
	.word	0x99a01a4c	! t0_kref+0x1a48:   	fdtoi	%f12, %f12
	.word	0xadb40ad0	! t0_kref+0x1a4c:   	fpsub32	%f16, %f16, %f22
	.word	0xa8d28016	! t0_kref+0x1a50:   	umulcc	%o2, %l6, %l4
	.word	0x97b48ab1	! t0_kref+0x1a54:   	fpsub16s	%f18, %f17, %f11
	.word	0xeece600c	! t0_kref+0x1a58:   	ldsba	[%i1 + 0xc]%asi, %l7
	.word	0xa9a00054	! t0_kref+0x1a5c:   	fmovd	%f20, %f20
	.word	0x99b48a98	! t0_kref+0x1a60:   	fpsub16	%f18, %f24, %f12
	.word	0x81ad8aca	! t0_kref+0x1a64:   	fcmped	%fcc0, %f22, %f10
	.word	0x902ac015	! t0_kref+0x1a68:   	andn	%o3, %l5, %o0
	.word	0xe820a028	! t0_kref+0x1a6c:   	st	%l4, [%g2 + 0x28]
	.word	0xd13e001d	! t0_kref+0x1a70:   	std	%f8, [%i0 + %i5]
	.word	0x9a9b401b	! t0_kref+0x1a74:   	xorcc	%o5, %i3, %o5
	.word	0xe99e5a1c	! t0_kref+0x1a78:   	ldda	[%i1 + %i4]0xd0, %f20
	.word	0xb1b50a8e	! t0_kref+0x1a7c:   	fpsub16	%f20, %f14, %f24
	.word	0x32800001	! t0_kref+0x1a80:   	bne,a	_kref+0x1a84
	.word	0x81800000	! t0_kref+0x1a84:   	mov	%g0, %y
	.word	0xe640a028	! t0_kref+0x1a88:   	ldsw	[%g2 + 0x28], %l3
	.word	0xef00a018	! t0_kref+0x1a8c:   	ld	[%g2 + 0x18], %f23
	.word	0xaca5bf1e	! t0_kref+0x1a90:   	subcc	%l6, -0xe2, %l6
	.word	0xa8253322	! t0_kref+0x1a94:   	sub	%l4, -0xcde, %l4
	.word	0x37800006	! t0_kref+0x1a98:   	fbge,a	_kref+0x1ab0
	.word	0xa6a5801b	! t0_kref+0x1a9c:   	subcc	%l6, %i3, %l3
	.word	0xd6270019	! t0_kref+0x1aa0:   	st	%o3, [%i4 + %i1]
	.word	0x9fb50080	! t0_kref+0x1aa4:   	edge16	%l4, %g0, %o7
	.word	0x81ac4a39	! t0_kref+0x1aa8:   	fcmps	%fcc0, %f17, %f25
	.word	0x91a0052c	! t0_kref+0x1aac:   	fsqrts	%f12, %f8
	.word	0xb3a349af	! t0_kref+0x1ab0:   	fdivs	%f13, %f15, %f25
	.word	0xe36e401d	! t0_kref+0x1ab4:   	prefetch	%i1 + %i5, 17
	.word	0xc0263ff4	! t0_kref+0x1ab8:   	clr	[%i0 - 0xc]
	.word	0xa7b2c075	! t0_kref+0x1abc:   	edge8ln	%o3, %l5, %l3
	.word	0xe100a03c	! t0_kref+0x1ac0:   	ld	[%g2 + 0x3c], %f16
	.word	0xd5be6000	! t0_kref+0x1ac4:   	stda	%f10, [%i1]%asi
	.word	0xadaa4056	! t0_kref+0x1ac8:   	fmovde	%fcc0, %f22, %f22
	.word	0xa3a388af	! t0_kref+0x1acc:   	fsubs	%f14, %f15, %f17
	.word	0x97b3000a	! t0_kref+0x1ad0:   	edge8	%o4, %o2, %o3
	.word	0xec50a030	! t0_kref+0x1ad4:   	ldsh	[%g2 + 0x30], %l6
	.word	0x9a25c016	! t0_kref+0x1ad8:   	sub	%l7, %l6, %o5
	.word	0x91a00028	! t0_kref+0x1adc:   	fmovs	%f8, %f8
	.word	0xa21d800a	! t0_kref+0x1ae0:   	xor	%l6, %o2, %l1
	.word	0x2a480001	! t0_kref+0x1ae4:   	bcs,a,pt	%icc, _kref+0x1ae8
	.word	0xd0c8a025	! t0_kref+0x1ae8:   	ldsba	[%g2 + 0x25]%asi, %o0
	.word	0x8143e040	! t0_kref+0x1aec:   	membar	0x40
	.word	0x94053400	! t0_kref+0x1af0:   	add	%l4, -0xc00, %o2
	.word	0xaa9aa9dc	! t0_kref+0x1af4:   	xorcc	%o2, 0x9dc, %l5
	.word	0x130e94f3	! t0_kref+0x1af8:   	sethi	%hi(0x3a53cc00), %o1
	.word	0x9233000a	! t0_kref+0x1afc:   	orn	%o4, %o2, %o1
	.word	0xb1b00cf8	! t0_kref+0x1b00:   	fnot2s	%f24, %f24
	.word	0xa9a589a9	! t0_kref+0x1b04:   	fdivs	%f22, %f9, %f20
	.word	0xe41e2000	! t0_kref+0x1b08:   	ldd	[%i0], %l2
	.word	0xa5a4084c	! t0_kref+0x1b0c:   	faddd	%f16, %f12, %f18
	.word	0xec10a01c	! t0_kref+0x1b10:   	lduh	[%g2 + 0x1c], %l6
	.word	0xea362002	! t0_kref+0x1b14:   	sth	%l5, [%i0 + 2]
	.word	0x95b58ad4	! t0_kref+0x1b18:   	fpsub32	%f22, %f20, %f10
	.word	0x9db20632	! t0_kref+0x1b1c:   	fmul8x16	%f8, %f18, %f14
	.word	0xa1b3cd2d	! t0_kref+0x1b20:   	fandnot1s	%f15, %f13, %f16
	.word	0x30800005	! t0_kref+0x1b24:   	ba,a	_kref+0x1b38
	.word	0xd5f6101b	! t0_kref+0x1b28:   	casxa	[%i0]0x80, %i3, %o2
	.word	0x2a800006	! t0_kref+0x1b2c:   	bcs,a	_kref+0x1b44
	.word	0x81850000	! t0_kref+0x1b30:   	wr	%l4, %g0, %y
	.word	0x903eea6a	! t0_kref+0x1b34:   	xnor	%i3, 0xa6a, %o0
	.word	0xda4e2011	! t0_kref+0x1b38:   	ldsb	[%i0 + 0x11], %o5
	.word	0x96d5401b	! t0_kref+0x1b3c:   	umulcc	%l5, %i3, %o3
	.word	0x99a01932	! t0_kref+0x1b40:   	fstod	%f18, %f12
	.word	0x969d8015	! t0_kref+0x1b44:   	xorcc	%l6, %l5, %o3
	.word	0xd4160000	! t0_kref+0x1b48:   	lduh	[%i0], %o2
	.word	0xa6d20000	! t0_kref+0x1b4c:   	umulcc	%o0, %g0, %l3
	.word	0x99a549a9	! t0_kref+0x1b50:   	fdivs	%f21, %f9, %f12
	.word	0x99a00536	! t0_kref+0x1b54:   	fsqrts	%f22, %f12
	.word	0xafb50309	! t0_kref+0x1b58:   	alignaddr	%l4, %o1, %l7
	.word	0xeb68a047	! t0_kref+0x1b5c:   	prefetch	%g2 + 0x47, 21
	.word	0x95b2070d	! t0_kref+0x1b60:   	fmuld8sux16	%f8, %f13, %f10
	.word	0x22800001	! t0_kref+0x1b64:   	be,a	_kref+0x1b68
	.word	0x99b20055	! t0_kref+0x1b68:   	edge8l	%o0, %l5, %o4
	.word	0x81ac0ad4	! t0_kref+0x1b6c:   	fcmped	%fcc0, %f16, %f20
	.word	0x95a00556	! t0_kref+0x1b70:   	fsqrtd	%f22, %f10
	.word	0xadb60d12	! t0_kref+0x1b74:   	fandnot1	%f24, %f18, %f22
	.word	0xb1a01108	! t0_kref+0x1b78:   	fxtod	%f8, %f24
	.word	0x982dc009	! t0_kref+0x1b7c:   	andn	%l7, %o1, %o4
	.word	0x91a389ca	! t0_kref+0x1b80:   	fdivd	%f14, %f10, %f8
	.word	0xad12401a	! t0_kref+0x1b84:   	taddcctv	%o1, %i2, %l6
	.word	0xef270018	! t0_kref+0x1b88:   	st	%f23, [%i4 + %i0]
	.word	0xac92b12e	! t0_kref+0x1b8c:   	orcc	%o2, -0xed2, %l6
	.word	0xebe8a00e	! t0_kref+0x1b90:   	prefetcha	%g2 + 0xe, 21
	.word	0xec262008	! t0_kref+0x1b94:   	st	%l6, [%i0 + 8]
	.word	0x942b000a	! t0_kref+0x1b98:   	andn	%o4, %o2, %o2
	.word	0xf1be588a	! t0_kref+0x1b9c:   	stda	%f24, [%i1 + %o2]0xc4
	.word	0xb1a60830	! t0_kref+0x1ba0:   	fadds	%f24, %f16, %f24
	.word	0xaba00129	! t0_kref+0x1ba4:   	fabss	%f9, %f21
	.word	0xe180a014	! t0_kref+0x1ba8:   	lda	[%g2 + 0x14]%asi, %f16
	.word	0xac226b02	! t0_kref+0x1bac:   	sub	%o1, 0xb02, %l6
	.word	0x29800001	! t0_kref+0x1bb0:   	fbl,a	_kref+0x1bb4
	.word	0x9db30f8e	! t0_kref+0x1bb4:   	for	%f12, %f14, %f14
	.word	0xa5a01a35	! t0_kref+0x1bb8:   	fstoi	%f21, %f18
	.word	0xa28a0016	! t0_kref+0x1bbc:   	andcc	%o0, %l6, %l1
	.word	0x24800003	! t0_kref+0x1bc0:   	ble,a	_kref+0x1bcc
	.word	0xc96e400a	! t0_kref+0x1bc4:   	prefetch	%i1 + %o2, 4
	.word	0xaba40831	! t0_kref+0x1bc8:   	fadds	%f16, %f17, %f21
	.word	0xe8200018	! t0_kref+0x1bcc:   	st	%l4, [%g0 + %i0]
	.word	0x38800004	! t0_kref+0x1bd0:   	bgu,a	_kref+0x1be0
	.word	0xd11e4000	! t0_kref+0x1bd4:   	ldd	[%i1], %f8
	.word	0xe6480019	! t0_kref+0x1bd8:   	ldsb	[%g0 + %i1], %l3
	.word	0xadb24ee8	! t0_kref+0x1bdc:   	fornot2s	%f9, %f8, %f22
	.word	0x81ae4ab4	! t0_kref+0x1be0:   	fcmpes	%fcc0, %f25, %f20
	.word	0x95a01a39	! t0_kref+0x1be4:   	fstoi	%f25, %f10
	.word	0x8610201f	! t0_kref+0x1be8:   	mov	0x1f, %g3
	.word	0x86a0e001	! t0_kref+0x1bec:   	subcc	%g3, 1, %g3
	.word	0x22800001	! t0_kref+0x1bf0:   	be,a	_kref+0x1bf4
	.word	0xe5260000	! t0_kref+0x1bf4:   	st	%f18, [%i0]
	.word	0x9db30c56	! t0_kref+0x1bf8:   	fnor	%f12, %f22, %f14
	.word	0x912e8015	! t0_kref+0x1bfc:   	sll	%i2, %l5, %o0
	.word	0x94222d04	! t0_kref+0x1c00:   	sub	%o0, 0xd04, %o2
	.word	0x2e800007	! t0_kref+0x1c04:   	bvs,a	_kref+0x1c20
	.word	0xe1200018	! t0_kref+0x1c08:   	st	%f16, [%g0 + %i0]
	.word	0x98950017	! t0_kref+0x1c0c:   	orcc	%l4, %l7, %o4
	.word	0xf1064000	! t0_kref+0x1c10:   	ld	[%i1], %f24
	.word	0x9abb603e	! t0_kref+0x1c14:   	xnorcc	%o5, 0x3e, %o5
	.word	0xa6f80009	! t0_kref+0x1c18:   	sdivcc	%g0, %o1, %l3
	.word	0xd9be1a1a	! t0_kref+0x1c1c:   	stda	%f12, [%i0 + %i2]0xd0
	.word	0x9da3c82e	! t0_kref+0x1c20:   	fadds	%f15, %f14, %f14
	.word	0xeb267ff0	! t0_kref+0x1c24:   	st	%f21, [%i1 - 0x10]
	.word	0xd1be1848	! t0_kref+0x1c28:   	stda	%f8, [%i0 + %o0]0xc2
	.word	0x86102002	! t0_kref+0x1c2c:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x1c30:   	bne,a	_kref+0x1c30
	.word	0x86a0e001	! t0_kref+0x1c34:   	subcc	%g3, 1, %g3
	.word	0xada01048	! t0_kref+0x1c38:   	fdtox	%f8, %f22
	.word	0x9db60d12	! t0_kref+0x1c3c:   	fandnot1	%f24, %f18, %f14
	.word	0x9f282012	! t0_kref+0x1c40:   	sll	%g0, 0x12, %o7
	.word	0xac2d400d	! t0_kref+0x1c44:   	andn	%l5, %o5, %l6
	.word	0x94c2bd39	! t0_kref+0x1c48:   	addccc	%o2, -0x2c7, %o2
	.word	0xd9be1896	! t0_kref+0x1c4c:   	stda	%f12, [%i0 + %l6]0xc4
	.word	0xdec8a020	! t0_kref+0x1c50:   	ldsba	[%g2 + 0x20]%asi, %o7
	.word	0xd6563ff2	! t0_kref+0x1c54:   	ldsh	[%i0 - 0xe], %o3
	.word	0xe248a014	! t0_kref+0x1c58:   	ldsb	[%g2 + 0x14], %l1
	.word	0xa6f3000c	! t0_kref+0x1c5c:   	udivcc	%o4, %o4, %l3
	.word	0x969eef83	! t0_kref+0x1c60:   	xorcc	%i3, 0xf83, %o3
	.word	0xc3e8a04f	! t0_kref+0x1c64:   	prefetcha	%g2 + 0x4f, 1
	.word	0x96823ad9	! t0_kref+0x1c68:   	addcc	%o0, -0x527, %o3
	.word	0xa3b3cdea	! t0_kref+0x1c6c:   	fnands	%f15, %f10, %f17
	.word	0xd2166016	! t0_kref+0x1c70:   	lduh	[%i1 + 0x16], %o1
	.word	0x923a4017	! t0_kref+0x1c74:   	xnor	%o1, %l7, %o1
	.word	0x9e2a400b	! t0_kref+0x1c78:   	andn	%o1, %o3, %o7
	.word	0xa2b5800b	! t0_kref+0x1c7c:   	orncc	%l6, %o3, %l1
	.word	0x81acca2c	! t0_kref+0x1c80:   	fcmps	%fcc0, %f19, %f12
	.word	0xa4bde6db	! t0_kref+0x1c84:   	xnorcc	%l7, 0x6db, %l2
	.word	0x9a2dc017	! t0_kref+0x1c88:   	andn	%l7, %l7, %o5
	.word	0xf430a004	! t0_kref+0x1c8c:   	sth	%i2, [%g2 + 4]
	.word	0xe81e6000	! t0_kref+0x1c90:   	ldd	[%i1], %l4
	.word	0xa40ec009	! t0_kref+0x1c94:   	and	%i3, %o1, %l2
	.word	0xa9a01a56	! t0_kref+0x1c98:   	fdtoi	%f22, %f20
	.word	0xada00139	! t0_kref+0x1c9c:   	fabss	%f25, %f22
	.word	0x39480003	! t0_kref+0x1ca0:   	fbuge,a,pt	%fcc0, _kref+0x1cac
	.word	0xa0b5c017	! t0_kref+0x1ca4:   	orncc	%l7, %l7, %l0
	.word	0x9ebac015	! t0_kref+0x1ca8:   	xnorcc	%o3, %l5, %o7
	.word	0xa5b20e70	! t0_kref+0x1cac:   	fxnors	%f8, %f16, %f18
	.word	0x97a01a32	! t0_kref+0x1cb0:   	fstoi	%f18, %f11
	.word	0x95a01a2a	! t0_kref+0x1cb4:   	fstoi	%f10, %f10
	.word	0xeaa8a032	! t0_kref+0x1cb8:   	stba	%l5, [%g2 + 0x32]%asi
	.word	0x99b38990	! t0_kref+0x1cbc:   	bshuffle	%f14, %f16, %f12
	.word	0x2e480005	! t0_kref+0x1cc0:   	bvs,a,pt	%icc, _kref+0x1cd4
	.word	0xa1b00f32	! t0_kref+0x1cc4:   	fsrc2s	%f18, %f16
	.word	0xd4066018	! t0_kref+0x1cc8:   	ld	[%i1 + 0x18], %o2
	.word	0xadb304d2	! t0_kref+0x1ccc:   	fcmpne32	%f12, %f18, %l6
	.word	0xa9a508ab	! t0_kref+0x1cd0:   	fsubs	%f20, %f11, %f20
	.word	0xa92ae019	! t0_kref+0x1cd4:   	sll	%o3, 0x19, %l4
	.word	0x91a00548	! t0_kref+0x1cd8:   	fsqrtd	%f8, %f8
	.word	0xf620a01c	! t0_kref+0x1cdc:   	st	%i3, [%g2 + 0x1c]
	.word	0x131986fd	! t0_kref+0x1ce0:   	sethi	%hi(0x661bf400), %o1
	.word	0xe808a00a	! t0_kref+0x1ce4:   	ldub	[%g2 + 0xa], %l4
	call	1f
	.empty
	.word	0xe9866000	! t0_kref+0x1cec:   	lda	[%i1]%asi, %f20
	.word	0xd0080019	! t0_kref+0x1cf0:   	ldub	[%g0 + %i1], %o0
	.word	0xe8a81018	! t0_kref+0x1cf4:   	stba	%l4, [%g0 + %i0]0x80
	.word	0xa1a0110c	! t0_kref+0x1cf8:   	fxtod	%f12, %f16
	.word	0xda300019	! t0_kref+0x1cfc:   	sth	%o5, [%g0 + %i1]
	.word	0xe11e401d	! t0_kref+0x1d00:   	ldd	[%i1 + %i5], %f16
	.word	0x95b3ccb6	! t0_kref+0x1d04:   	fandnot2s	%f15, %f22, %f10
	.word	0x3e480008	! t0_kref+0x1d08:   	bvc,a,pt	%icc, _kref+0x1d28
1:	.word	0xa72ae015	! t0_kref+0x1d0c:   	sll	%o3, 0x15, %l3
	.word	0xa4ad3bb4	! t0_kref+0x1d10:   	andncc	%l4, -0x44c, %l2
	.word	0x9563c01b	! t0_kref+0x1d14:   	movo	%fcc0, %i3, %o2
	.word	0x81ad4a2a	! t0_kref+0x1d18:   	fcmps	%fcc0, %f21, %f10
	.word	0x81580000	! t0_kref+0x1d1c:   	flushw
	.word	0x981338af	! t0_kref+0x1d20:   	or	%o4, -0x751, %o4
	.word	0xa7a5c9b8	! t0_kref+0x1d24:   	fdivs	%f23, %f24, %f19
	.word	0xa2adbb4f	! t0_kref+0x1d28:   	andncc	%l6, -0x4b1, %l1
	.word	0x9012fa30	! t0_kref+0x1d2c:   	or	%o3, -0x5d0, %o0
	.word	0x8143c000	! t0_kref+0x1d30:   	stbar
	.word	0x9165a2f7	! t0_kref+0x1d34:   	movneg	%icc, 0x2f7, %o0
	.word	0x99b58356	! t0_kref+0x1d38:   	alignaddrl	%l6, %l6, %o4
	.word	0xeec8a02a	! t0_kref+0x1d3c:   	ldsba	[%g2 + 0x2a]%asi, %l7
	.word	0xa7a0188d	! t0_kref+0x1d40:   	fitos	%f13, %f19
	.word	0x81dbc01a	! t0_kref+0x1d44:   	flush	%o7 + %i2
	.word	0xb1b387ca	! t0_kref+0x1d48:   	pdist	%f14, %f10, %f24
	.word	0x9e3a401a	! t0_kref+0x1d4c:   	xnor	%o1, %i2, %o7
	.word	0xda366018	! t0_kref+0x1d50:   	sth	%o5, [%i1 + 0x18]
	.word	0xa5a01938	! t0_kref+0x1d54:   	fstod	%f24, %f18
	.word	0xb1b54a69	! t0_kref+0x1d58:   	fpadd32s	%f21, %f9, %f24
	.word	0x9fc10000	! t0_kref+0x1d5c:   	call	%g4
	.word	0x1936a82e	! t0_kref+0x1d60:   	sethi	%hi(0xdaa0b800), %o4
	.word	0x2d3ea141	! t0_kref+0x1d64:   	sethi	%hi(0xfa850400), %l6
	.word	0xc02e0000	! t0_kref+0x1d68:   	clrb	[%i0]
	.word	0xe9f6100a	! t0_kref+0x1d6c:   	casxa	[%i0]0x80, %o2, %l4
	.word	0xada0052b	! t0_kref+0x1d70:   	fsqrts	%f11, %f22
	.word	0x9232b4ca	! t0_kref+0x1d74:   	orn	%o2, -0xb36, %o1
	.word	0xada01931	! t0_kref+0x1d78:   	fstod	%f17, %f22
	.word	0x99400000	! t0_kref+0x1d7c:   	mov	%y, %o4
	.word	0xa78235e0	! t0_kref+0x1d80:   	wr	%o0, 0xfffff5e0, %gsr
	.word	0xada01a4e	! t0_kref+0x1d84:   	fdtoi	%f14, %f22
	.word	0x92fd8014	! t0_kref+0x1d88:   	sdivcc	%l6, %l4, %o1
	.word	0x20800001	! t0_kref+0x1d8c:   	bn,a	_kref+0x1d90
	.word	0x81b01021	! t0_kref+0x1d90:   	siam	0x1
	.word	0xe5070019	! t0_kref+0x1d94:   	ld	[%i4 + %i1], %f18
	.word	0x81abca38	! t0_kref+0x1d98:   	fcmps	%fcc0, %f15, %f24
	.word	0x99b38638	! t0_kref+0x1d9c:   	fmul8x16	%f14, %f24, %f12
	.word	0x932d401a	! t0_kref+0x1da0:   	sll	%l5, %i2, %o1
	.word	0xb1b58a8e	! t0_kref+0x1da4:   	fpsub16	%f22, %f14, %f24
	.word	0xa8c20008	! t0_kref+0x1da8:   	addccc	%o0, %o0, %l4
	.word	0xad26f5d4	! t0_kref+0x1dac:   	mulscc	%i3, -0xa2c, %l6
	.word	0x81868000	! t0_kref+0x1db0:   	wr	%i2, %g0, %y
	.word	0xaa0df980	! t0_kref+0x1db4:   	and	%l7, -0x680, %l5
	.word	0xa4b37425	! t0_kref+0x1db8:   	orncc	%o5, -0xbdb, %l2
	.word	0xc56e6010	! t0_kref+0x1dbc:   	prefetch	%i1 + 0x10, 2
	.word	0xadb584c8	! t0_kref+0x1dc0:   	fcmpne32	%f22, %f8, %l6
	.word	0xea362000	! t0_kref+0x1dc4:   	sth	%l5, [%i0]
	.word	0x96f2c008	! t0_kref+0x1dc8:   	udivcc	%o3, %o0, %o3
	.word	0x91a00558	! t0_kref+0x1dcc:   	fsqrtd	%f24, %f8
	.word	0xac3a68af	! t0_kref+0x1dd0:   	xnor	%o1, 0x8af, %l6
	.word	0x9da0110c	! t0_kref+0x1dd4:   	fxtod	%f12, %f14
	.word	0xacfebd4b	! t0_kref+0x1dd8:   	sdivcc	%i2, -0x2b5, %l6
	.word	0x81ac4ab8	! t0_kref+0x1ddc:   	fcmpes	%fcc0, %f17, %f24
	.word	0xada0002a	! t0_kref+0x1de0:   	fmovs	%f10, %f22
	.word	0xa7b5c116	! t0_kref+0x1de4:   	edge32	%l7, %l6, %l3
	.word	0xa7852b45	! t0_kref+0x1de8:   	wr	%l4, 0xb45, %gsr
	.word	0xb1a01888	! t0_kref+0x1dec:   	fitos	%f8, %f24
	.word	0xe16e3ff0	! t0_kref+0x1df0:   	prefetch	%i0 - 0x10, 16
	.word	0xd40e8019	! t0_kref+0x1df4:   	ldub	[%i2 + %i1], %o2
	.word	0xd62e7feb	! t0_kref+0x1df8:   	stb	%o3, [%i1 - 0x15]
	.word	0x9ba01a37	! t0_kref+0x1dfc:   	fstoi	%f23, %f13
	.word	0x9de3bfa0	! t0_kref+0x1e00:   	save	%sp, -0x60, %sp
	.word	0xb42ec000	! t0_kref+0x1e04:   	andn	%i3, %g0, %i2
	.word	0x91eec018	! t0_kref+0x1e08:   	restore	%i3, %i0, %o0
	.word	0xd2c0a018	! t0_kref+0x1e0c:   	ldswa	[%g2 + 0x18]%asi, %o1
	.word	0x9636f537	! t0_kref+0x1e10:   	orn	%i3, -0xac9, %o3
	.word	0xa5a0192a	! t0_kref+0x1e14:   	fstod	%f10, %f18
	.word	0x81acca34	! t0_kref+0x1e18:   	fcmps	%fcc0, %f19, %f20
	.word	0xe040a01c	! t0_kref+0x1e1c:   	ldsw	[%g2 + 0x1c], %l0
	.word	0xc16e2010	! t0_kref+0x1e20:   	prefetch	%i0 + 0x10, 0
	.word	0x908ef1db	! t0_kref+0x1e24:   	andcc	%i3, -0xe25, %o0
	.word	0xa5a309d4	! t0_kref+0x1e28:   	fdivd	%f12, %f20, %f18
	.word	0x95b58492	! t0_kref+0x1e2c:   	fcmple32	%f22, %f18, %o2
	.word	0xedee101a	! t0_kref+0x1e30:   	prefetcha	%i0 + %i2, 22
	.word	0xd84e7fea	! t0_kref+0x1e34:   	ldsb	[%i1 - 0x16], %o4
	.word	0x93418000	! t0_kref+0x1e38:   	mov	%fprs, %o1
	.word	0x91a01929	! t0_kref+0x1e3c:   	fstod	%f9, %f8
	.word	0x81aacab8	! t0_kref+0x1e40:   	fcmpes	%fcc0, %f11, %f24
	.word	0xad2de00d	! t0_kref+0x1e44:   	sll	%l7, 0xd, %l6
	.word	0xa9a00558	! t0_kref+0x1e48:   	fsqrtd	%f24, %f20
	.word	0xe056200c	! t0_kref+0x1e4c:   	ldsh	[%i0 + 0xc], %l0
	.word	0xac0ebf9d	! t0_kref+0x1e50:   	and	%i2, -0x63, %l6
	.word	0x9db20a0a	! t0_kref+0x1e54:   	fpadd16	%f8, %f10, %f14
	.word	0xa1b48e6c	! t0_kref+0x1e58:   	fxnors	%f18, %f12, %f16
	call	SYM(t0_subr1)
	.word	0x95a0054c	! t0_kref+0x1e60:   	fsqrtd	%f12, %f10
	.word	0xe5981018	! t0_kref+0x1e64:   	ldda	[%g0 + %i0]0x80, %f18
	.word	0xc568a04d	! t0_kref+0x1e68:   	prefetch	%g2 + 0x4d, 2
	.word	0x9fa3c8b9	! t0_kref+0x1e6c:   	fsubs	%f15, %f25, %f15
	.word	0xd51fbfd8	! t0_kref+0x1e70:   	ldd	[%fp - 0x28], %f10
	.word	0xd1be9a18	! t0_kref+0x1e74:   	stda	%f8, [%i2 + %i0]0xd0
	.word	0xa5b507ce	! t0_kref+0x1e78:   	pdist	%f20, %f14, %f18
	.word	0xb1a0054c	! t0_kref+0x1e7c:   	fsqrtd	%f12, %f24
	.word	0xe8a63fec	! t0_kref+0x1e80:   	sta	%l4, [%i0 - 0x14]%asi
	.word	0xd6200018	! t0_kref+0x1e84:   	st	%o3, [%g0 + %i0]
	.word	0xe828a006	! t0_kref+0x1e88:   	stb	%l4, [%g2 + 6]
	.word	0x9db40c88	! t0_kref+0x1e8c:   	fandnot2	%f16, %f8, %f14
	.word	0xea067ff4	! t0_kref+0x1e90:   	ld	[%i1 - 0xc], %l5
	.word	0x8143e040	! t0_kref+0x1e94:   	membar	0x40
	.word	0xa0f5800d	! t0_kref+0x1e98:   	udivcc	%l6, %o5, %l0
	.word	0xa5a00032	! t0_kref+0x1e9c:   	fmovs	%f18, %f18
	.word	0xc5e8a04a	! t0_kref+0x1ea0:   	prefetcha	%g2 + 0x4a, 2
	.word	0x21800005	! t0_kref+0x1ea4:   	fbn,a	_kref+0x1eb8
	.word	0xd6480018	! t0_kref+0x1ea8:   	ldsb	[%g0 + %i0], %o3
	.word	0x9db58c48	! t0_kref+0x1eac:   	fnor	%f22, %f8, %f14
	.word	0x27800001	! t0_kref+0x1eb0:   	fbul,a	_kref+0x1eb4
	.word	0xa9a01a37	! t0_kref+0x1eb4:   	fstoi	%f23, %f20
	.word	0x3c800005	! t0_kref+0x1eb8:   	bpos,a	_kref+0x1ecc
	.word	0xf1267fe4	! t0_kref+0x1ebc:   	st	%f24, [%i1 - 0x1c]
	.word	0x91a00139	! t0_kref+0x1ec0:   	fabss	%f25, %f8
	.word	0xa7b300cc	! t0_kref+0x1ec4:   	edge16l	%o4, %o4, %l3
	.word	0x22480002	! t0_kref+0x1ec8:   	be,a,pt	%icc, _kref+0x1ed0
	.word	0xa5b587d4	! t0_kref+0x1ecc:   	pdist	%f22, %f20, %f18
	.word	0xae432e6e	! t0_kref+0x1ed0:   	addc	%o4, 0xe6e, %l7
	.word	0x97b68077	! t0_kref+0x1ed4:   	edge8ln	%i2, %l7, %o3
	.word	0x99b48cb6	! t0_kref+0x1ed8:   	fandnot2s	%f18, %f22, %f12
	.word	0x94130017	! t0_kref+0x1edc:   	or	%o4, %l7, %o2
	.word	0xa9a00139	! t0_kref+0x1ee0:   	fabss	%f25, %f20
	.word	0x9bb2805a	! t0_kref+0x1ee4:   	edge8l	%o2, %i2, %o5
	.word	0x9de3bfa0	! t0_kref+0x1ee8:   	save	%sp, -0x60, %sp
	.word	0x99ef001b	! t0_kref+0x1eec:   	restore	%i4, %i3, %o4
	.word	0x97b54f77	! t0_kref+0x1ef0:   	fornot1s	%f21, %f23, %f11
	.word	0xf428a003	! t0_kref+0x1ef4:   	stb	%i2, [%g2 + 3]
	.word	0xd13e2018	! t0_kref+0x1ef8:   	std	%f8, [%i0 + 0x18]
	.word	0xa5a00539	! t0_kref+0x1efc:   	fsqrts	%f25, %f18
	.word	0x81daf920	! t0_kref+0x1f00:   	flush	%o3 - 0x6e0
	.word	0x9fa00132	! t0_kref+0x1f04:   	fabss	%f18, %f15
	.word	0x36800001	! t0_kref+0x1f08:   	bge,a	_kref+0x1f0c
	.word	0xd6a8a019	! t0_kref+0x1f0c:   	stba	%o3, [%g2 + 0x19]%asi
	.word	0xd9a01019	! t0_kref+0x1f10:   	sta	%f12, [%g0 + %i1]0x80
	.word	0xc568a040	! t0_kref+0x1f14:   	prefetch	%g2 + 0x40, 2
	.word	0x81820000	! t0_kref+0x1f18:   	wr	%o0, %g0, %y
	.word	0xa3b3ceed	! t0_kref+0x1f1c:   	fornot2s	%f15, %f13, %f17
	.word	0xa9a48d39	! t0_kref+0x1f20:   	fsmuld	%f18, %f25, %f20
	.word	0xecc67ff4	! t0_kref+0x1f24:   	ldswa	[%i1 - 0xc]%asi, %l6
	.word	0xae9e8008	! t0_kref+0x1f28:   	xorcc	%i2, %o0, %l7
	.word	0x8143c000	! t0_kref+0x1f2c:   	stbar
	.word	0xa296b4e7	! t0_kref+0x1f30:   	orcc	%i2, -0xb19, %l1
	.word	0x8585400b	! t0_kref+0x1f34:   	wr	%l5, %o3, %ccr
	.word	0x81aacaad	! t0_kref+0x1f38:   	fcmpes	%fcc0, %f11, %f13
	.word	0xea26401c	! t0_kref+0x1f3c:   	st	%l5, [%i1 + %i4]
	.word	0xae0dc00a	! t0_kref+0x1f40:   	and	%l7, %o2, %l7
	.word	0xe5070018	! t0_kref+0x1f44:   	ld	[%i4 + %i0], %f18
	.word	0x99a2c8b5	! t0_kref+0x1f48:   	fsubs	%f11, %f21, %f12
	.word	0xec40a030	! t0_kref+0x1f4c:   	ldsw	[%g2 + 0x30], %l6
	.word	0xa5a289ac	! t0_kref+0x1f50:   	fdivs	%f10, %f12, %f18
	.word	0x98f274bd	! t0_kref+0x1f54:   	udivcc	%o1, -0xb43, %o4
	.word	0xaa828016	! t0_kref+0x1f58:   	addcc	%o2, %l6, %l5
	.word	0xa32a0016	! t0_kref+0x1f5c:   	sll	%o0, %l6, %l1
	.word	0xda000019	! t0_kref+0x1f60:   	ld	[%g0 + %i1], %o5
	.word	0xa7a649b1	! t0_kref+0x1f64:   	fdivs	%f25, %f17, %f19
	.word	0x94352072	! t0_kref+0x1f68:   	orn	%l4, 0x72, %o2
	.word	0x9255688b	! t0_kref+0x1f6c:   	umul	%l5, 0x88b, %o1
	.word	0xf5206f56	! t0_kref+0x1f70:   	st	%f26, [%g1 + 0xf56]
	.word	0xea28a034	! t0_kref+0x1f74:   	stb	%l5, [%g2 + 0x34]
	.word	0xd91e6018	! t0_kref+0x1f78:   	ldd	[%i1 + 0x18], %f12
	.word	0xd1be1848	! t0_kref+0x1f7c:   	stda	%f8, [%i0 + %o0]0xc2
	.word	0xc0196598	! t0_kref+0x1f80:   	ldd	[%g5 + 0x598], %g0
	.word	0xe100a038	! t0_kref+0x1f84:   	ld	[%g2 + 0x38], %f16
	.word	0x9da0012d	! t0_kref+0x1f88:   	fabss	%f13, %f14
	.word	0xe8266000	! t0_kref+0x1f8c:   	st	%l4, [%i1]
	.word	0xd07e2014	! t0_kref+0x1f90:   	swap	[%i0 + 0x14], %o0
	.word	0x97a00033	! t0_kref+0x1f94:   	fmovs	%f19, %f11
	.word	0xa9a00552	! t0_kref+0x1f98:   	fsqrtd	%f18, %f20
	.word	0xa9a018d2	! t0_kref+0x1f9c:   	fdtos	%f18, %f20
	.word	0x95408000	! t0_kref+0x1fa0:   	mov	%ccr, %o2
	.word	0x982ec000	! t0_kref+0x1fa4:   	andn	%i3, %g0, %o4
	.word	0xa3a01a30	! t0_kref+0x1fa8:   	fstoi	%f16, %f17
	.word	0xd42e8019	! t0_kref+0x1fac:   	stb	%o2, [%i2 + %i1]
	.word	0xe180a034	! t0_kref+0x1fb0:   	lda	[%g2 + 0x34]%asi, %f16
	.word	0xaba018ce	! t0_kref+0x1fb4:   	fdtos	%f14, %f21
	.word	0x8143e040	! t0_kref+0x1fb8:   	membar	0x40
	.word	0xe290a036	! t0_kref+0x1fbc:   	lduha	[%g2 + 0x36]%asi, %l1
	.word	0x2b800001	! t0_kref+0x1fc0:   	fbug,a	_kref+0x1fc4
	.word	0xeaae7fff	! t0_kref+0x1fc4:   	stba	%l5, [%i1 - 1]%asi
	.word	0xe9be5a1b	! t0_kref+0x1fc8:   	stda	%f20, [%i1 + %i3]0xd0
	.word	0xada01911	! t0_kref+0x1fcc:   	fitod	%f17, %f22
	.word	0xaec68000	! t0_kref+0x1fd0:   	addccc	%i2, %g0, %l7
	.word	0x99b60eeb	! t0_kref+0x1fd4:   	fornot2s	%f24, %f11, %f12
	.word	0xee36c019	! t0_kref+0x1fd8:   	sth	%l7, [%i3 + %i1]
	.word	0xd100a01c	! t0_kref+0x1fdc:   	ld	[%g2 + 0x1c], %f8
	.word	0xacfdc015	! t0_kref+0x1fe0:   	sdivcc	%l7, %l5, %l6
	.word	0x81ad4ab6	! t0_kref+0x1fe4:   	fcmpes	%fcc0, %f21, %f22
	.word	0xe4d0a034	! t0_kref+0x1fe8:   	ldsha	[%g2 + 0x34]%asi, %l2
	.word	0xe49e501d	! t0_kref+0x1fec:   	ldda	[%i1 + %i5]0x80, %l2
	.word	0xaa32401a	! t0_kref+0x1ff0:   	orn	%o1, %i2, %l5
	.word	0xb1a01a4a	! t0_kref+0x1ff4:   	fdtoi	%f10, %f24
	.word	0x99b38c56	! t0_kref+0x1ff8:   	fnor	%f14, %f22, %f12
	.word	0xd656c019	! t0_kref+0x1ffc:   	ldsh	[%i3 + %i1], %o3
	.word	0x99b58408	! t0_kref+0x2000:   	fcmple16	%f22, %f8, %o4
	.word	0x1903615a	! t0_kref+0x2004:   	sethi	%hi(0xd856800), %o4
	.word	0x2f800004	! t0_kref+0x2008:   	fbu,a	_kref+0x2018
	.word	0x9fb20d2b	! t0_kref+0x200c:   	fandnot1s	%f8, %f11, %f15
	.word	0x96f54008	! t0_kref+0x2010:   	udivcc	%l5, %o0, %o3
	.word	0x81ac8ad4	! t0_kref+0x2014:   	fcmped	%fcc0, %f18, %f20
	.word	0x9fc00004	! t0_kref+0x2018:   	call	%g0 + %g4
	.word	0xb1b20a8a	! t0_kref+0x201c:   	fpsub16	%f8, %f10, %f24
	.word	0xb1a00132	! t0_kref+0x2020:   	fabss	%f18, %f24
	.word	0x9db5ce6d	! t0_kref+0x2024:   	fxnors	%f23, %f13, %f14
	.word	0x26480006	! t0_kref+0x2028:   	bl,a,pt	%icc, _kref+0x2040
	.word	0xc9ee100a	! t0_kref+0x202c:   	prefetcha	%i0 + %o2, 4
	.word	0xd6063fe4	! t0_kref+0x2030:   	ld	[%i0 - 0x1c], %o3
	.word	0xa5a509b1	! t0_kref+0x2034:   	fdivs	%f20, %f17, %f18
	.word	0x91a00556	! t0_kref+0x2038:   	fsqrtd	%f22, %f8
	.word	0x97a01a32	! t0_kref+0x203c:   	fstoi	%f18, %f11
	.word	0xe9070019	! t0_kref+0x2040:   	ld	[%i4 + %i1], %f20
	.word	0xf4be6010	! t0_kref+0x2044:   	stda	%i2, [%i1 + 0x10]%asi
	.word	0xd0d81019	! t0_kref+0x2048:   	ldxa	[%g0 + %i1]0x80, %o0
	.word	0xc700611e	! t0_kref+0x204c:   	ld	[%g1 + 0x11e], %f3
	.word	0xb1a01a50	! t0_kref+0x2050:   	fdtoi	%f16, %f24
	.word	0xe41f4018	! t0_kref+0x2054:   	ldd	[%i5 + %i0], %l2
	.word	0x92100009	! t0_kref+0x2058:   	mov	%o1, %o1
	.word	0xe93f4019	! t0_kref+0x205c:   	std	%f20, [%i5 + %i1]
	.word	0x33800005	! t0_kref+0x2060:   	fbe,a	_kref+0x2074
	.word	0xb1a609ca	! t0_kref+0x2064:   	fdivd	%f24, %f10, %f24
	.word	0x93a24828	! t0_kref+0x2068:   	fadds	%f9, %f8, %f9
	.word	0x3a480008	! t0_kref+0x206c:   	bcc,a,pt	%icc, _kref+0x208c
	.word	0xe51f4019	! t0_kref+0x2070:   	ldd	[%i5 + %i1], %f18
	.word	0x81ac0ace	! t0_kref+0x2074:   	fcmped	%fcc0, %f16, %f14
	.word	0xe210a02c	! t0_kref+0x2078:   	lduh	[%g2 + 0x2c], %l1
	.word	0x99a018d4	! t0_kref+0x207c:   	fdtos	%f20, %f12
	.word	0x9da0002b	! t0_kref+0x2080:   	fmovs	%f11, %f14
	.word	0x94532867	! t0_kref+0x2084:   	umul	%o4, 0x867, %o2
	.word	0xee6e3fe4	! t0_kref+0x2088:   	ldstub	[%i0 - 0x1c], %l7
	.word	0xde162010	! t0_kref+0x208c:   	lduh	[%i0 + 0x10], %o7
	.word	0x152479ca	! t0_kref+0x2090:   	sethi	%hi(0x91e72800), %o2
	.word	0xac056999	! t0_kref+0x2094:   	add	%l5, 0x999, %l6
	.word	0xf3266000	! t0_kref+0x2098:   	st	%f25, [%i1]
	.word	0xc807bfec	! t0_kref+0x209c:   	ld	[%fp - 0x14], %g4
	.word	0x33800001	! t0_kref+0x20a0:   	fbe,a	_kref+0x20a4
	.word	0x2b2acc01	! t0_kref+0x20a4:   	sethi	%hi(0xab300400), %l5
	.word	0x81ad0aaa	! t0_kref+0x20a8:   	fcmpes	%fcc0, %f20, %f10
	.word	0xafa00036	! t0_kref+0x20ac:   	fmovs	%f22, %f23
	.word	0x980038a5	! t0_kref+0x20b0:   	add	%g0, -0x75b, %o4
	.word	0xd64e0000	! t0_kref+0x20b4:   	ldsb	[%i0], %o3
	.word	0xe81e6000	! t0_kref+0x20b8:   	ldd	[%i1], %l4
	.word	0xd93e6000	! t0_kref+0x20bc:   	std	%f12, [%i1]
	.word	0xd288a024	! t0_kref+0x20c0:   	lduba	[%g2 + 0x24]%asi, %o1
	.word	0x99b284c8	! t0_kref+0x20c4:   	fcmpne32	%f10, %f8, %o4
	.word	0xe41e2010	! t0_kref+0x20c8:   	ldd	[%i0 + 0x10], %l2
	.word	0xa7a01a56	! t0_kref+0x20cc:   	fdtoi	%f22, %f19
	.word	0x150780a9	! t0_kref+0x20d0:   	sethi	%hi(0x1e02a400), %o2
	.word	0x20800001	! t0_kref+0x20d4:   	bn,a	_kref+0x20d8
	.word	0xf36e001b	! t0_kref+0x20d8:   	prefetch	%i0 + %i3, 25
	.word	0x99b5ce28	! t0_kref+0x20dc:   	fands	%f23, %f8, %f12
	.word	0x992d8000	! t0_kref+0x20e0:   	sll	%l6, %g0, %o4
	.word	0xdf070019	! t0_kref+0x20e4:   	ld	[%i4 + %i1], %f15
	.word	0xa00b6cf6	! t0_kref+0x20e8:   	and	%o5, 0xcf6, %l0
	.word	0xb1b58c76	! t0_kref+0x20ec:   	fnors	%f22, %f22, %f24
	.word	0x91a0188e	! t0_kref+0x20f0:   	fitos	%f14, %f8
	.word	0xd780a010	! t0_kref+0x20f4:   	lda	[%g2 + 0x10]%asi, %f11
	.word	0xaa8dc00d	! t0_kref+0x20f8:   	andcc	%l7, %o5, %l5
	.word	0xee6e7fed	! t0_kref+0x20fc:   	ldstub	[%i1 - 0x13], %l7
	.word	0xe0f81018	! t0_kref+0x2100:   	swapa	[%g0 + %i0]0x80, %l0
	.word	0x95a00552	! t0_kref+0x2104:   	fsqrtd	%f18, %f10
	.word	0x95a4cd36	! t0_kref+0x2108:   	fsmuld	%f19, %f22, %f10
	.word	0x34480004	! t0_kref+0x210c:   	bg,a,pt	%icc, _kref+0x211c
	.word	0xa246be91	! t0_kref+0x2110:   	addc	%i2, -0x16f, %l1
	.word	0x9fc10000	! t0_kref+0x2114:   	call	%g4
	.word	0xe180a014	! t0_kref+0x2118:   	lda	[%g2 + 0x14]%asi, %f16
	.word	0x86102021	! t0_kref+0x211c:   	mov	0x21, %g3
	.word	0x86a0e001	! t0_kref+0x2120:   	subcc	%g3, 1, %g3
	.word	0x22800002	! t0_kref+0x2124:   	be,a	_kref+0x212c
	.word	0xd93e3fe0	! t0_kref+0x2128:   	std	%f12, [%i0 - 0x20]
	.word	0xed270018	! t0_kref+0x212c:   	st	%f22, [%i4 + %i0]
	.word	0x9a25400c	! t0_kref+0x2130:   	sub	%l5, %o4, %o5
	.word	0x001fffff	! t0_kref+0x2134:   	illtrap	0x1fffff
	.word	0xafb5c06c	! t0_kref+0x2138:   	edge8ln	%l7, %o4, %l7
	.word	0xe6066014	! t0_kref+0x213c:   	ld	[%i1 + 0x14], %l3
	.word	0xfb6e401a	! t0_kref+0x2140:   	prefetch	%i1 + %i2, 29
	.word	0xa69ec01a	! t0_kref+0x2144:   	xorcc	%i3, %i2, %l3
	.word	0xad62e2d6	! t0_kref+0x2148:   	movge	%fcc0, 0x2d6, %l6
	.word	0x8143c000	! t0_kref+0x214c:   	stbar
	.word	0xa5a01888	! t0_kref+0x2150:   	fitos	%f8, %f18
	.word	0xa69b71e2	! t0_kref+0x2154:   	xorcc	%o5, -0xe1e, %l3
	.word	0x94b80014	! t0_kref+0x2158:   	xnorcc	%g0, %l4, %o2
	.word	0xa1b0031b	! t0_kref+0x215c:   	alignaddr	%g0, %i3, %l0
	.word	0x8143c000	! t0_kref+0x2160:   	stbar
	.word	0xa292720a	! t0_kref+0x2164:   	orcc	%o1, -0xdf6, %l1
	.word	0x93a00128	! t0_kref+0x2168:   	fabss	%f8, %f9
	.word	0xe106001c	! t0_kref+0x216c:   	ld	[%i0 + %i4], %f16
	.word	0x9da0104a	! t0_kref+0x2170:   	fdtox	%f10, %f14
	.word	0x99a0002a	! t0_kref+0x2174:   	fmovs	%f10, %f12
	.word	0xa3b40410	! t0_kref+0x2178:   	fcmple16	%f16, %f16, %l1
	.word	0xa5a60d29	! t0_kref+0x217c:   	fsmuld	%f24, %f9, %f18
	.word	0xe968a08a	! t0_kref+0x2180:   	prefetch	%g2 + 0x8a, 20
	.word	0xa1a01029	! t0_kref+0x2184:   	fstox	%f9, %f16
	.word	0xa8ae8015	! t0_kref+0x2188:   	andncc	%i2, %l5, %l4
	.word	0x81ad0ace	! t0_kref+0x218c:   	fcmped	%fcc0, %f20, %f14
	.word	0xa412800a	! t0_kref+0x2190:   	or	%o2, %o2, %l2
	.word	0xab120000	! t0_kref+0x2194:   	taddcctv	%o0, %g0, %l5
	.word	0xb1b40f8c	! t0_kref+0x2198:   	for	%f16, %f12, %f24
	.word	0xd600a010	! t0_kref+0x219c:   	ld	[%g2 + 0x10], %o3
	.word	0xa9b40d0a	! t0_kref+0x21a0:   	fandnot1	%f16, %f10, %f20
	.word	0xc12e2014	! t0_kref+0x21a4:   	st	%fsr, [%i0 + 0x14]
	.word	0x95b5c240	! t0_kref+0x21a8:   	array16	%l7, %g0, %o2
	.word	0x81ac4ab8	! t0_kref+0x21ac:   	fcmpes	%fcc0, %f17, %f24
	.word	0x9bb64a2e	! t0_kref+0x21b0:   	fpadd16s	%f25, %f14, %f13
	.word	0xada60d29	! t0_kref+0x21b4:   	fsmuld	%f24, %f9, %f22
	.word	0x32480007	! t0_kref+0x21b8:   	bne,a,pt	%icc, _kref+0x21d4
	.word	0xd4f67fe0	! t0_kref+0x21bc:   	stxa	%o2, [%i1 - 0x20]%asi
	.word	0xe43835f0	! t0_kref+0x21c0:   	std	%l2, [%g0 - 0xa10]
	.word	0xaf12f62d	! t0_kref+0x21c4:   	taddcctv	%o3, -0x9d3, %l7
	.word	0x32480003	! t0_kref+0x21c8:   	bne,a,pt	%icc, _kref+0x21d4
	.word	0xad64e046	! t0_kref+0x21cc:   	movl	%icc, 0x46, %l6
	.word	0x2b480003	! t0_kref+0x21d0:   	fbug,a,pt	%fcc0, _kref+0x21dc
	.word	0xf656c005	! t0_kref+0x21d4:   	ldsh	[%i3 + %g5], %i3
	.word	0xada00558	! t0_kref+0x21d8:   	fsqrtd	%f24, %f22
	.word	0x878020e0	! t0_kref+0x21dc:   	mov	0xe0, %asi
	.word	0xe64e8019	! t0_kref+0x21e0:   	ldsb	[%i2 + %i1], %l3
	.word	0x81850000	! t0_kref+0x21e4:   	wr	%l4, %g0, %y
	.word	0xea08a039	! t0_kref+0x21e8:   	ldub	[%g2 + 0x39], %l5
	.word	0xaba00034	! t0_kref+0x21ec:   	fmovs	%f20, %f21
	.word	0xafa018d0	! t0_kref+0x21f0:   	fdtos	%f16, %f23
	.word	0xe5063fec	! t0_kref+0x21f4:   	ld	[%i0 - 0x14], %f18
	.word	0x8143c000	! t0_kref+0x21f8:   	stbar
	.word	0xd64e8018	! t0_kref+0x21fc:   	ldsb	[%i2 + %i0], %o3
	.word	0xd900a03c	! t0_kref+0x2200:   	ld	[%g2 + 0x3c], %f12
	.word	0xa8f2c014	! t0_kref+0x2204:   	udivcc	%o3, %l4, %l4
	.word	0x32800002	! t0_kref+0x2208:   	bne,a	_kref+0x2210
	.word	0x9e08000b	! t0_kref+0x220c:   	and	%g0, %o3, %o7
	.word	0xd68e9040	! t0_kref+0x2210:   	lduba	[%i2]0x82, %o3
	.word	0x81830000	! t0_kref+0x2214:   	wr	%o4, %g0, %y
	.word	0x3a480004	! t0_kref+0x2218:   	bcc,a,pt	%icc, _kref+0x2228
	.word	0x9eb36e62	! t0_kref+0x221c:   	orncc	%o5, 0xe62, %o7
	.word	0x91a018d8	! t0_kref+0x2220:   	fdtos	%f24, %f8
	.word	0xe46e3fe4	! t0_kref+0x2224:   	ldstub	[%i0 - 0x1c], %l2
	.word	0x95a409d6	! t0_kref+0x2228:   	fdivd	%f16, %f22, %f10
	.word	0xd636001b	! t0_kref+0x222c:   	sth	%o3, [%i0 + %i3]
	.word	0x30480002	! t0_kref+0x2230:   	ba,a,pt	%icc, _kref+0x2238
	.word	0xec48a013	! t0_kref+0x2234:   	ldsb	[%g2 + 0x13], %l6
	.word	0xd0ce501a	! t0_kref+0x2238:   	ldsba	[%i1 + %i2]0x80, %o0
	.word	0x932a6003	! t0_kref+0x223c:   	sll	%o1, 0x3, %o1
	.word	0x9a3e8000	! t0_kref+0x2240:   	not	%i2, %o5
	.word	0xe3262014	! t0_kref+0x2244:   	st	%f17, [%i0 + 0x14]
	.word	0xafa208ac	! t0_kref+0x2248:   	fsubs	%f8, %f12, %f23
	.word	0xe26e3fe0	! t0_kref+0x224c:   	ldstub	[%i0 - 0x20], %l1
	.word	0xe4f81018	! t0_kref+0x2250:   	swapa	[%g0 + %i0]0x80, %l2
	.word	0xafa01a58	! t0_kref+0x2254:   	fdtoi	%f24, %f23
	.word	0xaf2a6006	! t0_kref+0x2258:   	sll	%o1, 0x6, %l7
	.word	0x2c800001	! t0_kref+0x225c:   	bneg,a	_kref+0x2260
	.word	0xd610a014	! t0_kref+0x2260:   	lduh	[%g2 + 0x14], %o3
	.word	0xe040a028	! t0_kref+0x2264:   	ldsw	[%g2 + 0x28], %l0
	.word	0x22480006	! t0_kref+0x2268:   	be,a,pt	%icc, _kref+0x2280
	.word	0xe2df5018	! t0_kref+0x226c:   	ldxa	[%i5 + %i0]0x80, %l1
	.word	0xd800a030	! t0_kref+0x2270:   	ld	[%g2 + 0x30], %o4
	.word	0x9fa01a4e	! t0_kref+0x2274:   	fdtoi	%f14, %f15
	.word	0xaba5c9b3	! t0_kref+0x2278:   	fdivs	%f23, %f19, %f21
	.word	0xe91e001d	! t0_kref+0x227c:   	ldd	[%i0 + %i5], %f20
	.word	0xea267fe0	! t0_kref+0x2280:   	st	%l5, [%i1 - 0x20]
	.word	0x34800006	! t0_kref+0x2284:   	bg,a	_kref+0x229c
	.word	0xa215b31f	! t0_kref+0x2288:   	or	%l6, -0xce1, %l1
	.word	0xc02e3fe8	! t0_kref+0x228c:   	clrb	[%i0 - 0x18]
	.word	0xadb00309	! t0_kref+0x2290:   	alignaddr	%g0, %o1, %l6
	.word	0xa5b6c32b	! t0_kref+0x2294:   	bmask	%i3, %o3, %l2
	.word	0x1703e9de	! t0_kref+0x2298:   	sethi	%hi(0xfa77800), %o3
	.word	0x21800003	! t0_kref+0x229c:   	fbn,a	_kref+0x22a8
	.word	0x9435f049	! t0_kref+0x22a0:   	orn	%l7, -0xfb7, %o2
	.word	0xa9a01935	! t0_kref+0x22a4:   	fstod	%f21, %f20
	.word	0x91b58ac8	! t0_kref+0x22a8:   	fpsub32	%f22, %f8, %f8
	.word	0x9a3dc014	! t0_kref+0x22ac:   	xnor	%l7, %l4, %o5
	.word	0xa895a761	! t0_kref+0x22b0:   	orcc	%l6, 0x761, %l4
	.word	0xa5a609d2	! t0_kref+0x22b4:   	fdivd	%f24, %f18, %f18
	.word	0xe648a03a	! t0_kref+0x22b8:   	ldsb	[%g2 + 0x3a], %l3
	.word	0x81ab0ace	! t0_kref+0x22bc:   	fcmped	%fcc0, %f12, %f14
	.word	0x91a588b9	! t0_kref+0x22c0:   	fsubs	%f22, %f25, %f8
	sethi	%hi(1f), %o7
	jmpl	%o7+%lo(1f), %g1
	.empty
	.word	0x9da509ca	! t0_kref+0x22cc:   	fdivd	%f20, %f10, %f14
	.word	0xa40d401a	! t0_kref+0x22d0:   	and	%l5, %i2, %l2
	.word	0x81834000	! t0_kref+0x22d4:   	wr	%o5, %g0, %y
	.word	0xafa208b9	! t0_kref+0x22d8:   	fsubs	%f8, %f25, %f23
	.word	0xa7a38831	! t0_kref+0x22dc:   	fadds	%f14, %f17, %f19
1:	.word	0x9a3a801a	! t0_kref+0x22e0:   	xnor	%o2, %i2, %o5
	.word	0x81ab4a2e	! t0_kref+0x22e4:   	fcmps	%fcc0, %f13, %f14
	.word	0x9895c016	! t0_kref+0x22e8:   	orcc	%l7, %l6, %o4
	.word	0xaac5e9e0	! t0_kref+0x22ec:   	addccc	%l7, 0x9e0, %l5
	.word	0xdd1e2008	! t0_kref+0x22f0:   	ldd	[%i0 + 8], %f14
	.word	0xa1b5c340	! t0_kref+0x22f4:   	alignaddrl	%l7, %g0, %l0
	.word	0xa9a3c8ab	! t0_kref+0x22f8:   	fsubs	%f15, %f11, %f20
	.word	0x9a3ac00b	! t0_kref+0x22fc:   	xnor	%o3, %o3, %o5
	.word	0xd9f65016	! t0_kref+0x2300:   	casxa	[%i1]0x80, %l6, %o4
	.word	0x3d800002	! t0_kref+0x2304:   	fbule,a	_kref+0x230c
	.word	0xe7ee501a	! t0_kref+0x2308:   	prefetcha	%i1 + %i2, 19
	.word	0xeab61000	! t0_kref+0x230c:   	stha	%l5, [%i0]0x80
	.word	0xd2364000	! t0_kref+0x2310:   	sth	%o1, [%i1]
	.word	0xb1a01910	! t0_kref+0x2314:   	fitod	%f16, %f24
	.word	0xdb070019	! t0_kref+0x2318:   	ld	[%i4 + %i1], %f13
	.word	0xadb6816c	! t0_kref+0x231c:   	edge32ln	%i2, %o4, %l6
	.word	0xd2560000	! t0_kref+0x2320:   	ldsh	[%i0], %o1
	.word	0xdede5000	! t0_kref+0x2324:   	ldxa	[%i1]0x80, %o7
	.word	0xa92d0015	! t0_kref+0x2328:   	sll	%l4, %l5, %l4
	.word	0xadb4854e	! t0_kref+0x232c:   	fcmpeq16	%f18, %f14, %l6
	.word	0xb1a588c8	! t0_kref+0x2330:   	fsubd	%f22, %f8, %f24
	.word	0xada0192e	! t0_kref+0x2334:   	fstod	%f14, %f22
	.word	0xec28a039	! t0_kref+0x2338:   	stb	%l6, [%g2 + 0x39]
	.word	0xd4366002	! t0_kref+0x233c:   	sth	%o2, [%i1 + 2]
	.word	0xab2d401b	! t0_kref+0x2340:   	sll	%l5, %i3, %l5
	.word	0xada00128	! t0_kref+0x2344:   	fabss	%f8, %f22
	.word	0x2f2204d2	! t0_kref+0x2348:   	sethi	%hi(0x88134800), %l7
	.word	0xd9e65014	! t0_kref+0x234c:   	casa	[%i1]0x80, %l4, %o4
	.word	0xc026401c	! t0_kref+0x2350:   	clr	[%i1 + %i4]
	.word	0xee4e7ff0	! t0_kref+0x2354:   	ldsb	[%i1 - 0x10], %l7
	.word	0x9db00c00	! t0_kref+0x2358:   	fzero	%f14
	.word	0x91b60408	! t0_kref+0x235c:   	fcmple16	%f24, %f8, %o0
	.word	0x9db00cd8	! t0_kref+0x2360:   	fnot2	%f24, %f14
	.word	0xe240a02c	! t0_kref+0x2364:   	ldsw	[%g2 + 0x2c], %l1
	.word	0x28480002	! t0_kref+0x2368:   	bleu,a,pt	%icc, _kref+0x2370
	.word	0x9fa5c8b3	! t0_kref+0x236c:   	fsubs	%f23, %f19, %f15
	.word	0xd1b81019	! t0_kref+0x2370:   	stda	%f8, [%g0 + %i1]0x80
	.word	0x32480004	! t0_kref+0x2374:   	bne,a,pt	%icc, _kref+0x2384
	.word	0x91b30488	! t0_kref+0x2378:   	fcmple32	%f12, %f8, %o0
	.word	0xaef5400a	! t0_kref+0x237c:   	udivcc	%l5, %o2, %l7
	.word	0xe3b8a080	! t0_kref+0x2380:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xa6f5e103	! t0_kref+0x2384:   	udivcc	%l7, 0x103, %l3
	.word	0xadb28e4a	! t0_kref+0x2388:   	fxnor	%f10, %f10, %f22
	.word	0x81868000	! t0_kref+0x238c:   	wr	%i2, %g0, %y
	.word	0xf1be1889	! t0_kref+0x2390:   	stda	%f24, [%i0 + %o1]0xc4
	.word	0xa0128000	! t0_kref+0x2394:   	or	%o2, %g0, %l0
	.word	0xee0e3fe0	! t0_kref+0x2398:   	ldub	[%i0 - 0x20], %l7
	.word	0x36800005	! t0_kref+0x239c:   	bge,a	_kref+0x23b0
	.word	0xb1a01a50	! t0_kref+0x23a0:   	fdtoi	%f16, %f24
	.word	0xa9b44e68	! t0_kref+0x23a4:   	fxnors	%f17, %f8, %f20
	.word	0xd630a024	! t0_kref+0x23a8:   	sth	%o3, [%g2 + 0x24]
	.word	0xda0e7ff9	! t0_kref+0x23ac:   	ldub	[%i1 - 7], %o5
	.word	0xeb263ff4	! t0_kref+0x23b0:   	st	%f21, [%i0 - 0xc]
	.word	0x95b60ea0	! t0_kref+0x23b4:   	fsrc1s	%f24, %f10
	.word	0x3e800003	! t0_kref+0x23b8:   	bvc,a	_kref+0x23c4
	.word	0x91154017	! t0_kref+0x23bc:   	taddcctv	%l5, %l7, %o0
	.word	0xa226a8ab	! t0_kref+0x23c0:   	sub	%i2, 0x8ab, %l1
	.word	0x9da00038	! t0_kref+0x23c4:   	fmovs	%f24, %f14
	.word	0x951220ec	! t0_kref+0x23c8:   	taddcctv	%o0, 0xec, %o2
	.word	0xd040a008	! t0_kref+0x23cc:   	ldsw	[%g2 + 8], %o0
	.word	0xd93e3ff0	! t0_kref+0x23d0:   	std	%f12, [%i0 - 0x10]
	.word	0xafb34fb5	! t0_kref+0x23d4:   	fors	%f13, %f21, %f23
	.word	0xd9380019	! t0_kref+0x23d8:   	std	%f12, [%g0 + %i1]
	.word	0xa5b3cea0	! t0_kref+0x23dc:   	fsrc1s	%f15, %f18
	.word	0x91b30d18	! t0_kref+0x23e0:   	fandnot1	%f12, %f24, %f8
	.word	0x923e8009	! t0_kref+0x23e4:   	xnor	%i2, %o1, %o1
	.word	0x8143c000	! t0_kref+0x23e8:   	stbar
	.word	0xd22e7fe8	! t0_kref+0x23ec:   	stb	%o1, [%i1 - 0x18]
	.word	0x39800002	! t0_kref+0x23f0:   	fbuge,a	_kref+0x23f8
	.word	0xe6562002	! t0_kref+0x23f4:   	ldsh	[%i0 + 2], %l3
	.word	0xc0680018	! t0_kref+0x23f8:   	ldstub	[%g0 + %i0], %g0
	.word	0xda48a01b	! t0_kref+0x23fc:   	ldsb	[%g2 + 0x1b], %o5
	.word	0xe5380018	! t0_kref+0x2400:   	std	%f18, [%g0 + %i0]
	.word	0xabb58280	! t0_kref+0x2404:   	array32	%l6, %g0, %l5
	.word	0x9315f088	! t0_kref+0x2408:   	taddcctv	%l7, -0xf78, %o1
	.word	0x99a3c8ae	! t0_kref+0x240c:   	fsubs	%f15, %f14, %f12
	.word	0xd13e3ff8	! t0_kref+0x2410:   	std	%f8, [%i0 - 8]
	.word	0x95b28550	! t0_kref+0x2414:   	fcmpeq16	%f10, %f16, %o2
	.word	0x95a00558	! t0_kref+0x2418:   	fsqrtd	%f24, %f10
	.word	0xd1be5880	! t0_kref+0x241c:   	stda	%f8, [%i1]0xc4
	.word	0x2c800006	! t0_kref+0x2420:   	bneg,a	_kref+0x2438
	.word	0xa0b52d06	! t0_kref+0x2424:   	orncc	%l4, 0xd06, %l0
	.word	0xec00a028	! t0_kref+0x2428:   	ld	[%g2 + 0x28], %l6
	.word	0x81ac0aaf	! t0_kref+0x242c:   	fcmpes	%fcc0, %f16, %f15
	.word	0x81ac8ab7	! t0_kref+0x2430:   	fcmpes	%fcc0, %f18, %f23
	.word	0xa5b00772	! t0_kref+0x2434:   	fpack16	%f18, %f18
	.word	0xa9b200d6	! t0_kref+0x2438:   	edge16l	%o0, %l6, %l4
	.word	0xae9b2488	! t0_kref+0x243c:   	xorcc	%o4, 0x488, %l7
	.word	0xa4b54008	! t0_kref+0x2440:   	orncc	%l5, %o0, %l2
	.word	0xe4680019	! t0_kref+0x2444:   	ldstub	[%g0 + %i1], %l2
	.word	0xa9b64d60	! t0_kref+0x2448:   	fnot1s	%f25, %f20
	.word	0x26480008	! t0_kref+0x244c:   	bl,a,pt	%icc, _kref+0x246c
	.word	0xed68a008	! t0_kref+0x2450:   	prefetch	%g2 + 8, 22
	.word	0xa5a00548	! t0_kref+0x2454:   	fsqrtd	%f8, %f18
	.word	0xabb5408c	! t0_kref+0x2458:   	edge16	%l5, %o4, %l5
	.word	0x24480003	! t0_kref+0x245c:   	ble,a,pt	%icc, _kref+0x2468
	.word	0xafa00528	! t0_kref+0x2460:   	fsqrts	%f8, %f23
	.word	0x38480005	! t0_kref+0x2464:   	bgu,a,pt	%icc, _kref+0x2478
	.word	0x9ba2482f	! t0_kref+0x2468:   	fadds	%f9, %f15, %f13
	.word	0xae9ac00c	! t0_kref+0x246c:   	xorcc	%o3, %o4, %l7
	.word	0xa636abda	! t0_kref+0x2470:   	orn	%i2, 0xbda, %l3
	.word	0xe51e2010	! t0_kref+0x2474:   	ldd	[%i0 + 0x10], %f18
	.word	0xd6080018	! t0_kref+0x2478:   	ldub	[%g0 + %i0], %o3
	.word	0xf96e6000	! t0_kref+0x247c:   	prefetch	%i1, 28
	.word	0xb1a2882a	! t0_kref+0x2480:   	fadds	%f10, %f10, %f24
	.word	0x3d800006	! t0_kref+0x2484:   	fbule,a	_kref+0x249c
	.word	0x2520edef	! t0_kref+0x2488:   	sethi	%hi(0x83b7bc00), %l2
	.word	0x92434000	! t0_kref+0x248c:   	addc	%o5, %g0, %o1
	.word	0x35800008	! t0_kref+0x2490:   	fbue,a	_kref+0x24b0
	.word	0xd0067fec	! t0_kref+0x2494:   	ld	[%i1 - 0x14], %o0
	.word	0xe648a00a	! t0_kref+0x2498:   	ldsb	[%g2 + 0xa], %l3
	.word	0xafb50414	! t0_kref+0x249c:   	fcmple16	%f20, %f20, %l7
	.word	0xa7b6048c	! t0_kref+0x24a0:   	fcmple32	%f24, %f12, %l3
	.word	0xfb6e401a	! t0_kref+0x24a4:   	prefetch	%i1 + %i2, 29
	.word	0x2b0c7644	! t0_kref+0x24a8:   	sethi	%hi(0x31d91000), %l5
	.word	0xa4128008	! t0_kref+0x24ac:   	or	%o2, %o0, %l2
	.word	0x1530ddec	! t0_kref+0x24b0:   	sethi	%hi(0xc377b000), %o2
	.word	0xa9b54c78	! t0_kref+0x24b4:   	fnors	%f21, %f24, %f20
	.word	0x36480008	! t0_kref+0x24b8:   	bge,a,pt	%icc, _kref+0x24d8
	.word	0xac2eeeb6	! t0_kref+0x24bc:   	andn	%i3, 0xeb6, %l6
	.word	0x2f800002	! t0_kref+0x24c0:   	fbu,a	_kref+0x24c8
	.word	0xa1b00cd2	! t0_kref+0x24c4:   	fnot2	%f18, %f16
	.word	0x9da01932	! t0_kref+0x24c8:   	fstod	%f18, %f14
	.word	0xafa549ab	! t0_kref+0x24cc:   	fdivs	%f21, %f11, %f23
	.word	0xa1a4c830	! t0_kref+0x24d0:   	fadds	%f19, %f16, %f16
	.word	0x15129b3c	! t0_kref+0x24d4:   	sethi	%hi(0x4a6cf000), %o2
	.word	0xaaf80015	! t0_kref+0x24d8:   	sdivcc	%g0, %l5, %l5
	.word	0x270891dd	! t0_kref+0x24dc:   	sethi	%hi(0x22477400), %l3
	.word	0x27800004	! t0_kref+0x24e0:   	fbul,a	_kref+0x24f0
	.word	0xf36e001d	! t0_kref+0x24e4:   	prefetch	%i0 + %i5, 25
	.word	0xabb40556	! t0_kref+0x24e8:   	fcmpeq16	%f16, %f22, %l5
	.word	0x94aa800b	! t0_kref+0x24ec:   	andncc	%o2, %o3, %o2
	.word	0xe3b8a080	! t0_kref+0x24f0:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x86102001	! t0_kref+0x24f4:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x24f8:   	bne,a	_kref+0x24f8
	.word	0x86a0e001	! t0_kref+0x24fc:   	subcc	%g3, 1, %g3
	.word	0x9a8eea37	! t0_kref+0x2500:   	andcc	%i3, 0xa37, %o5
	.word	0x95b6c148	! t0_kref+0x2504:   	edge32l	%i3, %o0, %o2
	.word	0xe5be5000	! t0_kref+0x2508:   	stda	%f18, [%i1]0x80
	.word	0xa7a608b4	! t0_kref+0x250c:   	fsubs	%f24, %f20, %f19
	.word	0xd028a001	! t0_kref+0x2510:   	stb	%o0, [%g2 + 1]
	.word	0xa52b0008	! t0_kref+0x2514:   	sll	%o4, %o0, %l2
	.word	0xabb00cf2	! t0_kref+0x2518:   	fnot2s	%f18, %f21
	.word	0x9fb30d29	! t0_kref+0x251c:   	fandnot1s	%f12, %f9, %f15
	.word	0xd9e61015	! t0_kref+0x2520:   	casa	[%i0]0x80, %l5, %o4
	.word	0xc768a007	! t0_kref+0x2524:   	prefetch	%g2 + 7, 3
	.word	0x95a00133	! t0_kref+0x2528:   	fabss	%f19, %f10
	.word	0xa89275d1	! t0_kref+0x252c:   	orcc	%o1, -0xa2f, %l4
	.word	0xd64e401a	! t0_kref+0x2530:   	ldsb	[%i1 + %i2], %o3
	.word	0xd1be9a19	! t0_kref+0x2534:   	stda	%f8, [%i2 + %i1]0xd0
	.word	0xea06001c	! t0_kref+0x2538:   	ld	[%i0 + %i4], %l5
	.word	0xada00548	! t0_kref+0x253c:   	fsqrtd	%f8, %f22
	.word	0xe900a004	! t0_kref+0x2540:   	ld	[%g2 + 4], %f20
	.word	0xa12e800b	! t0_kref+0x2544:   	sll	%i2, %o3, %l0
	.word	0xd6c01019	! t0_kref+0x2548:   	ldswa	[%g0 + %i1]0x80, %o3
	.word	0xc12e3ffc	! t0_kref+0x254c:   	st	%fsr, [%i0 - 4]
	.word	0x9db58754	! t0_kref+0x2550:   	fpack32	%f22, %f20, %f14
	.word	0xdaf01018	! t0_kref+0x2554:   	stxa	%o5, [%g0 + %i0]0x80
	.word	0xf6270005	! t0_kref+0x2558:   	st	%i3, [%i4 + %g5]
	.word	0x23800002	! t0_kref+0x255c:   	fbne,a	_kref+0x2564
	.word	0xe04e001a	! t0_kref+0x2560:   	ldsb	[%i0 + %i2], %l0
	.word	0xf6263fe4	! t0_kref+0x2564:   	st	%i3, [%i0 - 0x1c]
	.word	0xd600a030	! t0_kref+0x2568:   	ld	[%g2 + 0x30], %o3
	.word	0xea362014	! t0_kref+0x256c:   	sth	%l5, [%i0 + 0x14]
	.word	0x962a6cc6	! t0_kref+0x2570:   	andn	%o1, 0xcc6, %o3
	.word	0x99a48837	! t0_kref+0x2574:   	fadds	%f18, %f23, %f12
	.word	0xb1a00032	! t0_kref+0x2578:   	fmovs	%f18, %f24
	.word	0xa6f2f945	! t0_kref+0x257c:   	udivcc	%o3, -0x6bb, %l3
	.word	0xd06e3fe1	! t0_kref+0x2580:   	ldstub	[%i0 - 0x1f], %o0
	.word	0x982d6250	! t0_kref+0x2584:   	andn	%l5, 0x250, %o4
	.word	0x908d001b	! t0_kref+0x2588:   	andcc	%l4, %i3, %o0
	.word	0xe5ee101b	! t0_kref+0x258c:   	prefetcha	%i0 + %i3, 18
	.word	0x93b2414b	! t0_kref+0x2590:   	edge32l	%o1, %o3, %o1
	.word	0xa4aa381b	! t0_kref+0x2594:   	andncc	%o0, -0x7e5, %l2
	.word	0xd86e2009	! t0_kref+0x2598:   	ldstub	[%i0 + 9], %o4
	.word	0xe648a002	! t0_kref+0x259c:   	ldsb	[%g2 + 2], %l3
	.word	0xa1b24280	! t0_kref+0x25a0:   	array32	%o1, %g0, %l0
	.word	0x9de3bfa0	! t0_kref+0x25a4:   	save	%sp, -0x60, %sp
	.word	0x93eef526	! t0_kref+0x25a8:   	restore	%i3, -0xada, %o1
	.word	0xe13e4000	! t0_kref+0x25ac:   	std	%f16, [%i1]
	.word	0x962ef6c4	! t0_kref+0x25b0:   	andn	%i3, -0x93c, %o3
	.word	0xa9b40636	! t0_kref+0x25b4:   	fmul8x16	%f16, %f22, %f20
	.word	0xe9bf5a19	! t0_kref+0x25b8:   	stda	%f20, [%i5 + %i1]0xd0
	.word	0xe168a045	! t0_kref+0x25bc:   	prefetch	%g2 + 0x45, 16
	.word	0x81ac0a29	! t0_kref+0x25c0:   	fcmps	%fcc0, %f16, %f9
	.word	0xda08a016	! t0_kref+0x25c4:   	ldub	[%g2 + 0x16], %o5
	.word	0xe1be1000	! t0_kref+0x25c8:   	stda	%f16, [%i0]0x80
	.word	0xa7b20556	! t0_kref+0x25cc:   	fcmpeq16	%f8, %f22, %l3
	.word	0xc568a04f	! t0_kref+0x25d0:   	prefetch	%g2 + 0x4f, 2
	.word	0xd120a004	! t0_kref+0x25d4:   	st	%f8, [%g2 + 4]
	.word	0xd836401b	! t0_kref+0x25d8:   	sth	%o4, [%i1 + %i3]
	.word	0x94a825bd	! t0_kref+0x25dc:   	andncc	%g0, 0x5bd, %o2
	.word	0x81830000	! t0_kref+0x25e0:   	wr	%o4, %g0, %y
	.word	0xe0166012	! t0_kref+0x25e4:   	lduh	[%i1 + 0x12], %l0
	.word	0x86102002	! t0_kref+0x25e8:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x25ec:   	bne,a	_kref+0x25ec
	.word	0x86a0e001	! t0_kref+0x25f0:   	subcc	%g3, 1, %g3
	.word	0xdf062008	! t0_kref+0x25f4:   	ld	[%i0 + 8], %f15
	.word	0xaa027429	! t0_kref+0x25f8:   	add	%o1, -0xbd7, %l5
	.word	0x9482001b	! t0_kref+0x25fc:   	addcc	%o0, %i3, %o2
	.word	0xe9bf5019	! t0_kref+0x2600:   	stda	%f20, [%i5 + %i1]0x80
	.word	0xadb30a88	! t0_kref+0x2604:   	fpsub16	%f12, %f8, %f22
	.word	0x920a0009	! t0_kref+0x2608:   	and	%o0, %o1, %o1
	.word	0x3e800001	! t0_kref+0x260c:   	bvc,a	_kref+0x2610
	.word	0x98bac00d	! t0_kref+0x2610:   	xnorcc	%o3, %o5, %o4
	.word	0xc06e7fed	! t0_kref+0x2614:   	ldstub	[%i1 - 0x13], %g0
	.word	0x99a4894a	! t0_kref+0x2618:   	fmuld	%f18, %f10, %f12
	.word	0xec267ffc	! t0_kref+0x261c:   	st	%l6, [%i1 - 4]
	.word	0xa7a309ac	! t0_kref+0x2620:   	fdivs	%f12, %f12, %f19
	.word	0xa1b4870c	! t0_kref+0x2624:   	fmuld8sux16	%f18, %f12, %f16
	.word	0xea28a02f	! t0_kref+0x2628:   	stb	%l5, [%g2 + 0x2f]
	.word	0xde480018	! t0_kref+0x262c:   	ldsb	[%g0 + %i0], %o7
	.word	0xa2dd4015	! t0_kref+0x2630:   	smulcc	%l5, %l5, %l1
	.word	0xb1b34a71	! t0_kref+0x2634:   	fpadd32s	%f13, %f17, %f24
	.word	0xaba4082c	! t0_kref+0x2638:   	fadds	%f16, %f12, %f21
	.word	0xeb68a00a	! t0_kref+0x263c:   	prefetch	%g2 + 0xa, 21
	.word	0x91a28856	! t0_kref+0x2640:   	faddd	%f10, %f22, %f8
	.word	0x91a000cc	! t0_kref+0x2644:   	fnegd	%f12, %f8
	.word	0xddbf5018	! t0_kref+0x2648:   	stda	%f14, [%i5 + %i0]0x80
	.word	0x933a2008	! t0_kref+0x264c:   	sra	%o0, 0x8, %o1
	.word	0xd8c6101c	! t0_kref+0x2650:   	ldswa	[%i0 + %i4]0x80, %o4
	.word	0xa8b6c014	! t0_kref+0x2654:   	orncc	%i3, %l4, %l4
	.word	0xe68e1000	! t0_kref+0x2658:   	lduba	[%i0]0x80, %l3
	.word	0xada58838	! t0_kref+0x265c:   	fadds	%f22, %f24, %f22
	.word	0xa5b6830b	! t0_kref+0x2660:   	alignaddr	%i2, %o3, %l2
	.word	0x94d0000b	! t0_kref+0x2664:   	umulcc	%g0, %o3, %o2
	.word	0x3c480001	! t0_kref+0x2668:   	bpos,a,pt	%icc, _kref+0x266c
	.word	0x91b4c732	! t0_kref+0x266c:   	fmuld8ulx16	%f19, %f18, %f8
	.word	0x909b000a	! t0_kref+0x2670:   	xorcc	%o4, %o2, %o0
	.word	0xad2ac017	! t0_kref+0x2674:   	sll	%o3, %l7, %l6
	.word	0xd248a029	! t0_kref+0x2678:   	ldsb	[%g2 + 0x29], %o1
	.word	0x9fc00004	! t0_kref+0x267c:   	call	%g0 + %g4
	.word	0xa9a01a54	! t0_kref+0x2680:   	fdtoi	%f20, %f20
	.word	0x8143c000	! t0_kref+0x2684:   	stbar
	.word	0xa1a00034	! t0_kref+0x2688:   	fmovs	%f20, %f16
	.word	0x3e480007	! t0_kref+0x268c:   	bvc,a,pt	%icc, _kref+0x26a8
	.word	0xadb28d2a	! t0_kref+0x2690:   	fandnot1s	%f10, %f10, %f22
	.word	0xaba0002c	! t0_kref+0x2694:   	fmovs	%f12, %f21
	.word	0xe3b8a080	! t0_kref+0x2698:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xd0ce9019	! t0_kref+0x269c:   	ldsba	[%i2 + %i1]0x80, %o0
	.word	0xa5a00056	! t0_kref+0x26a0:   	fmovd	%f22, %f18
	.word	0xd24e2000	! t0_kref+0x26a4:   	ldsb	[%i0], %o1
	.word	0xada00529	! t0_kref+0x26a8:   	fsqrts	%f9, %f22
	.word	0xa5b6c30b	! t0_kref+0x26ac:   	alignaddr	%i3, %o3, %l2
	.word	0xe836001b	! t0_kref+0x26b0:   	sth	%l4, [%i0 + %i3]
	.word	0xd1be1880	! t0_kref+0x26b4:   	stda	%f8, [%i0]0xc4
	.word	0xc807bfe4	! t0_kref+0x26b8:   	ld	[%fp - 0x1c], %g4
	.word	0x81ad8ac8	! t0_kref+0x26bc:   	fcmped	%fcc0, %f22, %f8
	.word	0xacc02d8f	! t0_kref+0x26c0:   	addccc	%g0, 0xd8f, %l6
	.word	0x36480003	! t0_kref+0x26c4:   	bge,a,pt	%icc, _kref+0x26d0
	.word	0xd64e2010	! t0_kref+0x26c8:   	ldsb	[%i0 + 0x10], %o3
	.word	0xb1a000d8	! t0_kref+0x26cc:   	fnegd	%f24, %f24
	.word	0xb3a0012b	! t0_kref+0x26d0:   	fabss	%f11, %f25
	.word	0xa1a01939	! t0_kref+0x26d4:   	fstod	%f25, %f16
	.word	0x9ab2400d	! t0_kref+0x26d8:   	orncc	%o1, %o5, %o5
	.word	0xe2463ffc	! t0_kref+0x26dc:   	ldsw	[%i0 - 4], %l1
	.word	0x34800002	! t0_kref+0x26e0:   	bg,a	_kref+0x26e8
	.word	0xa0fd778b	! t0_kref+0x26e4:   	sdivcc	%l5, -0x875, %l0
	.word	0xae0a4017	! t0_kref+0x26e8:   	and	%o1, %l7, %l7
	.word	0xd840a00c	! t0_kref+0x26ec:   	ldsw	[%g2 + 0xc], %o4
	.word	0x9da01a4c	! t0_kref+0x26f0:   	fdtoi	%f12, %f14
	.word	0x98268016	! t0_kref+0x26f4:   	sub	%i2, %l6, %o4
	.word	0xa7b2058e	! t0_kref+0x26f8:   	fcmpgt32	%f8, %f14, %l3
	.word	0x2f800007	! t0_kref+0x26fc:   	fbu,a	_kref+0x2718
	.word	0x9da5084c	! t0_kref+0x2700:   	faddd	%f20, %f12, %f14
	.word	0x983e800c	! t0_kref+0x2704:   	xnor	%i2, %o4, %o4
	.word	0x96c22c0d	! t0_kref+0x2708:   	addccc	%o0, 0xc0d, %o3
	.word	0x9da389d4	! t0_kref+0x270c:   	fdivd	%f14, %f20, %f14
	.word	0xa025c017	! t0_kref+0x2710:   	sub	%l7, %l7, %l0
	.word	0x2b800005	! t0_kref+0x2714:   	fbug,a	_kref+0x2728
	.word	0xe53e0000	! t0_kref+0x2718:   	std	%f18, [%i0]
	.word	0x81ab4ab3	! t0_kref+0x271c:   	fcmpes	%fcc0, %f13, %f19
	.word	0x32480006	! t0_kref+0x2720:   	bne,a,pt	%icc, _kref+0x2738
	.word	0xd11e6010	! t0_kref+0x2724:   	ldd	[%i1 + 0x10], %f8
	.word	0x92db25ee	! t0_kref+0x2728:   	smulcc	%o4, 0x5ee, %o1
	.word	0xb1a548a9	! t0_kref+0x272c:   	fsubs	%f21, %f9, %f24
	.word	0xea48a015	! t0_kref+0x2730:   	ldsb	[%g2 + 0x15], %l5
	.word	0xc3ee5009	! t0_kref+0x2734:   	prefetcha	%i1 + %o1, 1
	.word	0x81aa0aca	! t0_kref+0x2738:   	fcmped	%fcc0, %f8, %f10
	.word	0xef00a008	! t0_kref+0x273c:   	ld	[%g2 + 8], %f23
	.word	0x2a480006	! t0_kref+0x2740:   	bcs,a,pt	%icc, _kref+0x2758
	.word	0xa012801b	! t0_kref+0x2744:   	or	%o2, %i3, %l0
	.word	0x191d611d	! t0_kref+0x2748:   	sethi	%hi(0x75847400), %o4
	.word	0x81868000	! t0_kref+0x274c:   	wr	%i2, %g0, %y
	.word	0x9bb6c008	! t0_kref+0x2750:   	edge8	%i3, %o0, %o5
	.word	0xdd801018	! t0_kref+0x2754:   	lda	[%g0 + %i0]0x80, %f14
	.word	0xb3a34828	! t0_kref+0x2758:   	fadds	%f13, %f8, %f25
	.word	0x91a6084c	! t0_kref+0x275c:   	faddd	%f24, %f12, %f8
	.word	0x34800007	! t0_kref+0x2760:   	bg,a	_kref+0x277c
	.word	0xe3b8a080	! t0_kref+0x2764:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x2b800001	! t0_kref+0x2768:   	fbug,a	_kref+0x276c
	.word	0x94b2800c	! t0_kref+0x276c:   	orncc	%o2, %o4, %o2
	.word	0xacb533e0	! t0_kref+0x2770:   	orncc	%l4, -0xc20, %l6
	.word	0xa20dc01a	! t0_kref+0x2774:   	and	%l7, %i2, %l1
	.word	0xc128001c	! t0_kref+0x2778:   	st	%fsr, [%g0 + %i4]
	.word	0xdd3f4019	! t0_kref+0x277c:   	std	%f14, [%i5 + %i1]
	.word	0x99a0054a	! t0_kref+0x2780:   	fsqrtd	%f10, %f12
	.word	0xe8362008	! t0_kref+0x2784:   	sth	%l4, [%i0 + 8]
	.word	0xe2562012	! t0_kref+0x2788:   	ldsh	[%i0 + 0x12], %l1
	.word	0xe16e6008	! t0_kref+0x278c:   	prefetch	%i1 + 8, 16
	.word	0xa5a0192d	! t0_kref+0x2790:   	fstod	%f13, %f18
	.word	0xa63a27ac	! t0_kref+0x2794:   	xnor	%o0, 0x7ac, %l3
	.word	0xada50858	! t0_kref+0x2798:   	faddd	%f20, %f24, %f22
	.word	0xa5a01936	! t0_kref+0x279c:   	fstod	%f22, %f18
	.word	0x95a01937	! t0_kref+0x27a0:   	fstod	%f23, %f10
	.word	0x95a01a4a	! t0_kref+0x27a4:   	fdtoi	%f10, %f10
	.word	0x9842800d	! t0_kref+0x27a8:   	addc	%o2, %o5, %o4
	.word	0xe248a028	! t0_kref+0x27ac:   	ldsb	[%g2 + 0x28], %l1
	.word	0xa5254015	! t0_kref+0x27b0:   	mulscc	%l5, %l5, %l2
	.word	0xde4e001a	! t0_kref+0x27b4:   	ldsb	[%i0 + %i2], %o7
	.word	0x9fc00004	! t0_kref+0x27b8:   	call	%g0 + %g4
	.word	0xe4180019	! t0_kref+0x27bc:   	ldd	[%g0 + %i1], %l2
	.word	0xed00a01c	! t0_kref+0x27c0:   	ld	[%g2 + 0x1c], %f22
	.word	0x99b30d0e	! t0_kref+0x27c4:   	fandnot1	%f12, %f14, %f12
	.word	0xa3a388ad	! t0_kref+0x27c8:   	fsubs	%f14, %f13, %f17
	.word	0xaed6ac7e	! t0_kref+0x27cc:   	umulcc	%i2, 0xc7e, %l7
	.word	0xada0054c	! t0_kref+0x27d0:   	fsqrtd	%f12, %f22
	.word	0xaab6e321	! t0_kref+0x27d4:   	orncc	%i3, 0x321, %l5
	.word	0xa1b20d08	! t0_kref+0x27d8:   	fandnot1	%f8, %f8, %f16
	.word	0xf43f4019	! t0_kref+0x27dc:   	std	%i2, [%i5 + %i1]
	.word	0xa0ab4008	! t0_kref+0x27e0:   	andncc	%o5, %o0, %l0
	.word	0xafb6c17a	! t0_kref+0x27e4:   	edge32ln	%i3, %i2, %l7
	.word	0xada50954	! t0_kref+0x27e8:   	fmuld	%f20, %f20, %f22
	.word	0xd24e8019	! t0_kref+0x27ec:   	ldsb	[%i2 + %i1], %o1
	.word	0xb1b48dc8	! t0_kref+0x27f0:   	fnand	%f18, %f8, %f24
	.word	0xd06e8018	! t0_kref+0x27f4:   	ldstub	[%i2 + %i0], %o0
	.word	0x34480002	! t0_kref+0x27f8:   	bg,a,pt	%icc, _kref+0x2800
	.word	0xaba00128	! t0_kref+0x27fc:   	fabss	%f8, %f21
	.word	0xf16e6000	! t0_kref+0x2800:   	prefetch	%i1, 24
	.word	0x2e480007	! t0_kref+0x2804:   	bvs,a,pt	%icc, _kref+0x2820
	.word	0xe4566004	! t0_kref+0x2808:   	ldsh	[%i1 + 4], %l2
	.word	0xaa26e9a7	! t0_kref+0x280c:   	sub	%i3, 0x9a7, %l5
	.word	0x91a508ce	! t0_kref+0x2810:   	fsubd	%f20, %f14, %f8
	.word	0x95b28077	! t0_kref+0x2814:   	edge8ln	%o2, %l7, %o2
	.word	0x9da0192e	! t0_kref+0x2818:   	fstod	%f14, %f14
	.word	0x97b24df9	! t0_kref+0x281c:   	fnands	%f9, %f25, %f11
	.word	0x93a01889	! t0_kref+0x2820:   	fitos	%f9, %f9
	.word	0x9da40952	! t0_kref+0x2824:   	fmuld	%f16, %f18, %f14
	.word	0x34480001	! t0_kref+0x2828:   	bg,a,pt	%icc, _kref+0x282c
	.word	0xe80e7fe4	! t0_kref+0x282c:   	ldub	[%i1 - 0x1c], %l4
	.word	0xa08a634c	! t0_kref+0x2830:   	andcc	%o1, 0x34c, %l0
	.word	0xa1a01a4c	! t0_kref+0x2834:   	fdtoi	%f12, %f16
	.word	0xa485801a	! t0_kref+0x2838:   	addcc	%l6, %i2, %l2
	.word	0x81820000	! t0_kref+0x283c:   	wr	%o0, %g0, %y
	.word	0xa03d221e	! t0_kref+0x2840:   	xnor	%l4, 0x21e, %l0
	.word	0x91b3cd39	! t0_kref+0x2844:   	fandnot1s	%f15, %f25, %f8
	.word	0xed801019	! t0_kref+0x2848:   	lda	[%g0 + %i1]0x80, %f22
	.word	0xd8200018	! t0_kref+0x284c:   	st	%o4, [%g0 + %i0]
	.word	0xa7b44e79	! t0_kref+0x2850:   	fxnors	%f17, %f25, %f19
	.word	0xb1b00fc0	! t0_kref+0x2854:   	fone	%f24
	.word	0xa1a5094e	! t0_kref+0x2858:   	fmuld	%f20, %f14, %f16
	.word	0x8143e067	! t0_kref+0x285c:   	membar	0x67
	.word	0xae8a726f	! t0_kref+0x2860:   	andcc	%o1, -0xd91, %l7
	.word	0xa1b28014	! t0_kref+0x2864:   	edge8	%o2, %l4, %l0
	.word	0xa885000c	! t0_kref+0x2868:   	addcc	%l4, %o4, %l4
	.word	0xb1b54e28	! t0_kref+0x286c:   	fands	%f21, %f8, %f24
	.word	0xb1b40df6	! t0_kref+0x2870:   	fnands	%f16, %f22, %f24
	.word	0xa8268015	! t0_kref+0x2874:   	sub	%i2, %l5, %l4
	.word	0xa2f3256c	! t0_kref+0x2878:   	udivcc	%o4, 0x56c, %l1
	.word	0xa2137b55	! t0_kref+0x287c:   	or	%o5, -0x4ab, %l1
	.word	0xe91f4018	! t0_kref+0x2880:   	ldd	[%i5 + %i0], %f20
	.word	0xa3b6c280	! t0_kref+0x2884:   	array32	%i3, %g0, %l1
	.word	0x95a608ac	! t0_kref+0x2888:   	fsubs	%f24, %f12, %f10
	.word	0x33800004	! t0_kref+0x288c:   	fbe,a	_kref+0x289c
	.word	0x99b00c20	! t0_kref+0x2890:   	fzeros	%f12
	.word	0x909dfed1	! t0_kref+0x2894:   	xorcc	%l7, -0x12f, %o0
	.word	0xef270018	! t0_kref+0x2898:   	st	%f23, [%i4 + %i0]
	.word	0x9afd6d2d	! t0_kref+0x289c:   	sdivcc	%l5, 0xd2d, %o5
	.word	0xf76e2018	! t0_kref+0x28a0:   	prefetch	%i0 + 0x18, 27
	.word	0xd53e3fe0	! t0_kref+0x28a4:   	std	%f10, [%i0 - 0x20]
	.word	0xe3b8a080	! t0_kref+0x28a8:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xd99e1a1d	! t0_kref+0x28ac:   	ldda	[%i0 + %i5]0xd0, %f12
	.word	0x8143c000	! t0_kref+0x28b0:   	stbar
	.word	0x95a64932	! t0_kref+0x28b4:   	fmuls	%f25, %f18, %f10
	.word	0x9fc00004	! t0_kref+0x28b8:   	call	%g0 + %g4
	.word	0xa445726c	! t0_kref+0x28bc:   	addc	%l5, -0xd94, %l2
	.word	0x9fc10000	! t0_kref+0x28c0:   	call	%g4
	.word	0xafa01a50	! t0_kref+0x28c4:   	fdtoi	%f16, %f23
	.word	0xe1180019	! t0_kref+0x28c8:   	ldd	[%g0 + %i1], %f16
	.word	0xe0881018	! t0_kref+0x28cc:   	lduba	[%g0 + %i0]0x80, %l0
	.word	0xa1b64709	! t0_kref+0x28d0:   	fmuld8sux16	%f25, %f9, %f16
	.word	0x90f2c017	! t0_kref+0x28d4:   	udivcc	%o3, %l7, %o0
	.word	0x9bb3058e	! t0_kref+0x28d8:   	fcmpgt32	%f12, %f14, %o5
	.word	0xa736a009	! t0_kref+0x28dc:   	srl	%i2, 0x9, %l3
	.word	0xd04e7ff9	! t0_kref+0x28e0:   	ldsb	[%i1 - 7], %o0
	.word	0x8143e06e	! t0_kref+0x28e4:   	membar	0x6e
	.word	0xfb6e001c	! t0_kref+0x28e8:   	prefetch	%i0 + %i4, 29
	.word	0x97a589b9	! t0_kref+0x28ec:   	fdivs	%f22, %f25, %f11
	.word	0x9925bc51	! t0_kref+0x28f0:   	mulscc	%l6, -0x3af, %o4
	.word	0xd016001b	! t0_kref+0x28f4:   	lduh	[%i0 + %i3], %o0
	.word	0xea270018	! t0_kref+0x28f8:   	st	%l5, [%i4 + %i0]
	.word	0xec9e1000	! t0_kref+0x28fc:   	ldda	[%i0]0x80, %l6
	.word	0xa7a0002d	! t0_kref+0x2900:   	fmovs	%f13, %f19
	.word	0xa7a0188f	! t0_kref+0x2904:   	fitos	%f15, %f19
	.word	0xabb5032b	! t0_kref+0x2908:   	bmask	%l4, %o3, %l5
	.word	0x96768016	! t0_kref+0x290c:   	udiv	%i2, %l6, %o3
	.word	0xa8f03900	! t0_kref+0x2910:   	udivcc	%g0, -0x700, %l4
	.word	0x8143e044	! t0_kref+0x2914:   	membar	0x44
	.word	0x9e723df2	! t0_kref+0x2918:   	udiv	%o0, -0x20e, %o7
	.word	0xe3b8a080	! t0_kref+0x291c:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x81ad0a29	! t0_kref+0x2920:   	fcmps	%fcc0, %f20, %f9
	.word	0x9fa30830	! t0_kref+0x2924:   	fadds	%f12, %f16, %f15
	.word	0xe9be189b	! t0_kref+0x2928:   	stda	%f20, [%i0 + %i3]0xc4
	.word	0xa092401a	! t0_kref+0x292c:   	orcc	%o1, %i2, %l0
	.word	0x2e800004	! t0_kref+0x2930:   	bvs,a	_kref+0x2940
	.word	0xafa00037	! t0_kref+0x2934:   	fmovs	%f23, %f23
	.word	0xaa22c00a	! t0_kref+0x2938:   	sub	%o3, %o2, %l5
	.word	0xe59f5019	! t0_kref+0x293c:   	ldda	[%i5 + %i1]0x80, %f18
	.word	0xd5f61016	! t0_kref+0x2940:   	casxa	[%i0]0x80, %l6, %o2
	.word	0x960b4014	! t0_kref+0x2944:   	and	%o5, %l4, %o3
	.word	0x9fc10000	! t0_kref+0x2948:   	call	%g4
	.word	0xe1bf1a59	! t0_kref+0x294c:   	stda	%f16, [%i4 + %i1]0xd2
	.word	0xd0000019	! t0_kref+0x2950:   	ld	[%g0 + %i1], %o0
	.word	0xd1000018	! t0_kref+0x2954:   	ld	[%g0 + %i0], %f8
	.word	0x858237bb	! t0_kref+0x2958:   	wr	%o0, 0xfffff7bb, %ccr
	.word	0xafa448b1	! t0_kref+0x295c:   	fsubs	%f17, %f17, %f23
	.word	0x95b28d8c	! t0_kref+0x2960:   	fxor	%f10, %f12, %f10
	.word	0x92f5a383	! t0_kref+0x2964:   	udivcc	%l6, 0x383, %o1
	.word	0xafa0002d	! t0_kref+0x2968:   	fmovs	%f13, %f23
	.word	0x9da00552	! t0_kref+0x296c:   	fsqrtd	%f18, %f14
	.word	0x1b0be7e1	! t0_kref+0x2970:   	sethi	%hi(0x2f9f8400), %o5
	.word	0xe3b8a080	! t0_kref+0x2974:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x81580000	! t0_kref+0x2978:   	flushw
	.word	0x36800004	! t0_kref+0x297c:   	bge,a	_kref+0x298c
	.word	0xafa588ae	! t0_kref+0x2980:   	fsubs	%f22, %f14, %f23
	.word	0x9fc00004	! t0_kref+0x2984:   	call	%g0 + %g4
	.word	0xa6050016	! t0_kref+0x2988:   	add	%l4, %l6, %l3
	.word	0xd8ee1000	! t0_kref+0x298c:   	ldstuba	[%i0]0x80, %o4
	.word	0x81ab4a28	! t0_kref+0x2990:   	fcmps	%fcc0, %f13, %f8
	.word	0x81830000	! t0_kref+0x2994:   	wr	%o4, %g0, %y
	.word	0x94b37c4c	! t0_kref+0x2998:   	orncc	%o5, -0x3b4, %o2
	.word	0xa9a508b7	! t0_kref+0x299c:   	fsubs	%f20, %f23, %f20
	.word	0x952a6013	! t0_kref+0x29a0:   	sll	%o1, 0x13, %o2
	.word	0x9f2ea013	! t0_kref+0x29a4:   	sll	%i2, 0x13, %o7
	.word	0xef20a00c	! t0_kref+0x29a8:   	st	%f23, [%g2 + 0xc]
	.word	0x96720014	! t0_kref+0x29ac:   	udiv	%o0, %l4, %o3
	.word	0xe5ee501b	! t0_kref+0x29b0:   	prefetcha	%i1 + %i3, 18
	.word	0x99b20329	! t0_kref+0x29b4:   	bmask	%o0, %o1, %o4
	.word	0xa1a2cd33	! t0_kref+0x29b8:   	fsmuld	%f11, %f19, %f16
	.word	0x95b28ad6	! t0_kref+0x29bc:   	fpsub32	%f10, %f22, %f10
	.word	0xada000ce	! t0_kref+0x29c0:   	fnegd	%f14, %f22
	.word	0xaefa8008	! t0_kref+0x29c4:   	sdivcc	%o2, %o0, %l7
	.word	0xaa927447	! t0_kref+0x29c8:   	orcc	%o1, -0xbb9, %l5
	.word	0x9bb2848c	! t0_kref+0x29cc:   	fcmple32	%f10, %f12, %o5
	.word	0xa4324015	! t0_kref+0x29d0:   	orn	%o1, %l5, %l2
	.word	0xdb00a028	! t0_kref+0x29d4:   	ld	[%g2 + 0x28], %f13
	.word	0xa7a00036	! t0_kref+0x29d8:   	fmovs	%f22, %f19
	.word	0x932ae016	! t0_kref+0x29dc:   	sll	%o3, 0x16, %o1
	.word	0xe828a008	! t0_kref+0x29e0:   	stb	%l4, [%g2 + 8]
	.word	0x9161c00b	! t0_kref+0x29e4:   	movu	%fcc0, %o3, %o0
	.word	0xa9b30c74	! t0_kref+0x29e8:   	fnors	%f12, %f20, %f20
	.word	0xef68a087	! t0_kref+0x29ec:   	prefetch	%g2 + 0x87, 23
	.word	0x9fa609ab	! t0_kref+0x29f0:   	fdivs	%f24, %f11, %f15
	.word	0xec20a018	! t0_kref+0x29f4:   	st	%l6, [%g2 + 0x18]
	.word	0xafa4882b	! t0_kref+0x29f8:   	fadds	%f18, %f11, %f23
	.word	0x81ac0a58	! t0_kref+0x29fc:   	fcmpd	%fcc0, %f16, %f24
	.word	0xa1a000d6	! t0_kref+0x2a00:   	fnegd	%f22, %f16
	.word	0x9810363b	! t0_kref+0x2a04:   	mov	0xfffff63b, %o4
	.word	0xb3a28830	! t0_kref+0x2a08:   	fadds	%f10, %f16, %f25
	.word	0xa9b00ceb	! t0_kref+0x2a0c:   	fnot2s	%f11, %f20
	.word	0xc129401c	! t0_kref+0x2a10:   	st	%fsr, [%g5 + %i4]
	.word	0xafb20f6b	! t0_kref+0x2a14:   	fornot1s	%f8, %f11, %f23
	.word	0xc16e3fe8	! t0_kref+0x2a18:   	prefetch	%i0 - 0x18, 0
	.word	0x96b2c008	! t0_kref+0x2a1c:   	orncc	%o3, %o0, %o3
	.word	0xb1a0002b	! t0_kref+0x2a20:   	fmovs	%f11, %f24
	.word	0x81ad8a39	! t0_kref+0x2a24:   	fcmps	%fcc0, %f22, %f25
	.word	0x26800007	! t0_kref+0x2a28:   	bl,a	_kref+0x2a44
	.word	0x99a489b8	! t0_kref+0x2a2c:   	fdivs	%f18, %f24, %f12
	.word	0xd0c6101c	! t0_kref+0x2a30:   	ldswa	[%i0 + %i4]0x80, %o0
	.word	0x81acca32	! t0_kref+0x2a34:   	fcmps	%fcc0, %f19, %f18
	.word	0xe53e2010	! t0_kref+0x2a38:   	std	%f18, [%i0 + 0x10]
	.word	0xaf2ea00f	! t0_kref+0x2a3c:   	sll	%i2, 0xf, %l7
	.word	0x96b0000c	! t0_kref+0x2a40:   	orncc	%g0, %o4, %o3
	.word	0x95b48ef1	! t0_kref+0x2a44:   	fornot2s	%f18, %f17, %f10
	.word	0xa7a00530	! t0_kref+0x2a48:   	fsqrts	%f16, %f19
	.word	0xae32acf8	! t0_kref+0x2a4c:   	orn	%o2, 0xcf8, %l7
	.word	0xe3b8a080	! t0_kref+0x2a50:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xda56c018	! t0_kref+0x2a54:   	ldsh	[%i3 + %i0], %o5
	.word	0x968364b6	! t0_kref+0x2a58:   	addcc	%o5, 0x4b6, %o3
	.word	0xae72303e	! t0_kref+0x2a5c:   	udiv	%o0, -0xfc2, %l7
	.word	0x9af00008	! t0_kref+0x2a60:   	udivcc	%g0, %o0, %o5
	.word	0x8143c000	! t0_kref+0x2a64:   	stbar
	.word	0xe99e1a1d	! t0_kref+0x2a68:   	ldda	[%i0 + %i5]0xd0, %f20
	.word	0xa9a01a58	! t0_kref+0x2a6c:   	fdtoi	%f24, %f20
	.word	0xa5a00558	! t0_kref+0x2a70:   	fsqrtd	%f24, %f18
	.word	0xa9268017	! t0_kref+0x2a74:   	mulscc	%i2, %l7, %l4
	.word	0xa60aeaab	! t0_kref+0x2a78:   	and	%o3, 0xaab, %l3
	.word	0xe3b8a080	! t0_kref+0x2a7c:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x39800008	! t0_kref+0x2a80:   	fbuge,a	_kref+0x2aa0
	.word	0x93a01a35	! t0_kref+0x2a84:   	fstoi	%f21, %f9
	.word	0xe9380019	! t0_kref+0x2a88:   	std	%f20, [%g0 + %i1]
	.word	0xa0dd4009	! t0_kref+0x2a8c:   	smulcc	%l5, %o1, %l0
	.word	0xf13e401d	! t0_kref+0x2a90:   	std	%f24, [%i1 + %i5]
	.word	0x99a01932	! t0_kref+0x2a94:   	fstod	%f18, %f12
	.word	0xe8b01019	! t0_kref+0x2a98:   	stha	%l4, [%g0 + %i1]0x80
	.word	0x99b60db3	! t0_kref+0x2a9c:   	fxors	%f24, %f19, %f12
	.word	0x81868000	! t0_kref+0x2aa0:   	wr	%i2, %g0, %y
	.word	0xa1a00058	! t0_kref+0x2aa4:   	fmovd	%f24, %f16
	.word	0x81858000	! t0_kref+0x2aa8:   	wr	%l6, %g0, %y
	.word	0xda400019	! t0_kref+0x2aac:   	ldsw	[%g0 + %i1], %o5
	.word	0xadb34280	! t0_kref+0x2ab0:   	array32	%o5, %g0, %l6
	.word	0xc768a043	! t0_kref+0x2ab4:   	prefetch	%g2 + 0x43, 3
	.word	0xa1a0192f	! t0_kref+0x2ab8:   	fstod	%f15, %f16
	.word	0xe01e2000	! t0_kref+0x2abc:   	ldd	[%i0], %l0
	.word	0xda20a03c	! t0_kref+0x2ac0:   	st	%o5, [%g2 + 0x3c]
	.word	0xe600a028	! t0_kref+0x2ac4:   	ld	[%g2 + 0x28], %l3
	.word	0xe01e2008	! t0_kref+0x2ac8:   	ldd	[%i0 + 8], %l0
	.word	0xee067ff0	! t0_kref+0x2acc:   	ld	[%i1 - 0x10], %l7
	.word	0xafb40af2	! t0_kref+0x2ad0:   	fpsub32s	%f16, %f18, %f23
	.word	0x81ac0ad4	! t0_kref+0x2ad4:   	fcmped	%fcc0, %f16, %f20
	.word	0x36480008	! t0_kref+0x2ad8:   	bge,a,pt	%icc, _kref+0x2af8
	.word	0x963a8000	! t0_kref+0x2adc:   	not	%o2, %o3
	.word	0xe6566018	! t0_kref+0x2ae0:   	ldsh	[%i1 + 0x18], %l3
	.word	0x95b4cea0	! t0_kref+0x2ae4:   	fsrc1s	%f19, %f10
	.word	0xee4e7fe6	! t0_kref+0x2ae8:   	ldsb	[%i1 - 0x1a], %l7
	.word	0xe3b8a080	! t0_kref+0x2aec:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xddb81019	! t0_kref+0x2af0:   	stda	%f14, [%g0 + %i1]0x80
	.word	0xe11e2018	! t0_kref+0x2af4:   	ldd	[%i0 + 0x18], %f16
	.word	0xf436c019	! t0_kref+0x2af8:   	sth	%i2, [%i3 + %i1]
	.word	0x291fbc09	! t0_kref+0x2afc:   	sethi	%hi(0x7ef02400), %l4
	.word	0x3e480002	! t0_kref+0x2b00:   	bvc,a,pt	%icc, _kref+0x2b08
	.word	0xb3a00130	! t0_kref+0x2b04:   	fabss	%f16, %f25
	.word	0x91a00552	! t0_kref+0x2b08:   	fsqrtd	%f18, %f8
	.word	0x91a28948	! t0_kref+0x2b0c:   	fmuld	%f10, %f8, %f8
	.word	0x2c480005	! t0_kref+0x2b10:   	bneg,a,pt	%icc, _kref+0x2b24
	.word	0xe8480018	! t0_kref+0x2b14:   	ldsb	[%g0 + %i0], %l4
	.word	0xadb44c76	! t0_kref+0x2b18:   	fnors	%f17, %f22, %f22
	.word	0xd7f61015	! t0_kref+0x2b1c:   	casxa	[%i0]0x80, %l5, %o3
	.word	0xac2a000b	! t0_kref+0x2b20:   	andn	%o0, %o3, %l6
	.word	0xa1a0002b	! t0_kref+0x2b24:   	fmovs	%f11, %f16
	.word	0xe3b8a080	! t0_kref+0x2b28:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xa9a2082c	! t0_kref+0x2b2c:   	fadds	%f8, %f12, %f20
	.word	0x9fc00004	! t0_kref+0x2b30:   	call	%g0 + %g4
	.word	0xa9b50c6d	! t0_kref+0x2b34:   	fnors	%f20, %f13, %f20
	.word	0x95a000ad	! t0_kref+0x2b38:   	fnegs	%f13, %f10
	.word	0x23480002	! t0_kref+0x2b3c:   	fbne,a,pt	%fcc0, _kref+0x2b44
	.word	0xc12e7fe4	! t0_kref+0x2b40:   	st	%fsr, [%i1 - 0x1c]
	.word	0x9e803f94	! t0_kref+0x2b44:   	addcc	%g0, -0x6c, %o7
	.word	0x95a548b7	! t0_kref+0x2b48:   	fsubs	%f21, %f23, %f10
	.word	0xee267fe4	! t0_kref+0x2b4c:   	st	%l7, [%i1 - 0x1c]
	.word	0xa1a208b8	! t0_kref+0x2b50:   	fsubs	%f8, %f24, %f16
	.word	0x81ad0a54	! t0_kref+0x2b54:   	fcmpd	%fcc0, %f20, %f20
	.word	0xe5263ff0	! t0_kref+0x2b58:   	st	%f18, [%i0 - 0x10]
	.word	0xb1a0004e	! t0_kref+0x2b5c:   	fmovd	%f14, %f24
	.word	0x24480008	! t0_kref+0x2b60:   	ble,a,pt	%icc, _kref+0x2b80
	.word	0x93a01a4c	! t0_kref+0x2b64:   	fdtoi	%f12, %f9
	.word	0xa3b50498	! t0_kref+0x2b68:   	fcmple32	%f20, %f24, %l1
	.word	0xacf2c01a	! t0_kref+0x2b6c:   	udivcc	%o3, %i2, %l6
	.word	0xdd26001c	! t0_kref+0x2b70:   	st	%f14, [%i0 + %i4]
	.word	0xec360000	! t0_kref+0x2b74:   	sth	%l6, [%i0]
	.word	0x95b48ae8	! t0_kref+0x2b78:   	fpsub32s	%f18, %f8, %f10
	.word	0xa0f37e04	! t0_kref+0x2b7c:   	udivcc	%o5, -0x1fc, %l0
	.word	0xa9b3012b	! t0_kref+0x2b80:   	edge32n	%o4, %o3, %l4
	.word	0xa6f039b9	! t0_kref+0x2b84:   	udivcc	%g0, -0x647, %l3
	.word	0x99a01931	! t0_kref+0x2b88:   	fstod	%f17, %f12
	.word	0x9da309b2	! t0_kref+0x2b8c:   	fdivs	%f12, %f18, %f14
	.word	0xadb30057	! t0_kref+0x2b90:   	edge8l	%o4, %l7, %l6
	.word	0xb1a3c836	! t0_kref+0x2b94:   	fadds	%f15, %f22, %f24
	.word	0x91380017	! t0_kref+0x2b98:   	sra	%g0, %l7, %o0
	.word	0xa7b28a6b	! t0_kref+0x2b9c:   	fpadd32s	%f10, %f11, %f19
	.word	0x9a76b3ae	! t0_kref+0x2ba0:   	udiv	%i2, -0xc52, %o5
	.word	0xc76e3fe0	! t0_kref+0x2ba4:   	prefetch	%i0 - 0x20, 3
	.word	0xadb2098a	! t0_kref+0x2ba8:   	bshuffle	%f8, %f10, %f22
	.word	0xa9b50c58	! t0_kref+0x2bac:   	fnor	%f20, %f24, %f20
	.word	0xada018cc	! t0_kref+0x2bb0:   	fdtos	%f12, %f22
	.word	0xe64e8019	! t0_kref+0x2bb4:   	ldsb	[%i2 + %i1], %l3
	.word	0xed20a01c	! t0_kref+0x2bb8:   	st	%f22, [%g2 + 0x1c]
	.word	0xa322610e	! t0_kref+0x2bbc:   	mulscc	%o1, 0x10e, %l1
	.word	0xd24e0000	! t0_kref+0x2bc0:   	ldsb	[%i0], %o1
	.word	0x8143e040	! t0_kref+0x2bc4:   	membar	0x40
	.word	0x37800001	! t0_kref+0x2bc8:   	fbge,a	_kref+0x2bcc
	.word	0xb3a2482d	! t0_kref+0x2bcc:   	fadds	%f9, %f13, %f25
	.word	0x9da589ce	! t0_kref+0x2bd0:   	fdivd	%f22, %f14, %f14
	.word	0x97b30eed	! t0_kref+0x2bd4:   	fornot2s	%f12, %f13, %f11
	.word	0xa1a0052d	! t0_kref+0x2bd8:   	fsqrts	%f13, %f16
	.word	0x2b3df7ba	! t0_kref+0x2bdc:   	sethi	%hi(0xf7dee800), %l5
	.word	0xeac65000	! t0_kref+0x2be0:   	ldswa	[%i1]0x80, %l5
	.word	0xaec28016	! t0_kref+0x2be4:   	addccc	%o2, %l6, %l7
	.word	0x81abca38	! t0_kref+0x2be8:   	fcmps	%fcc0, %f15, %f24
	.word	0xd656c019	! t0_kref+0x2bec:   	ldsh	[%i3 + %i1], %o3
	.word	0xf9ee501c	! t0_kref+0x2bf0:   	prefetcha	%i1 + %i4, 28
	.word	0xd426200c	! t0_kref+0x2bf4:   	st	%o2, [%i0 + 0xc]
	.word	0x30480006	! t0_kref+0x2bf8:   	ba,a,pt	%icc, _kref+0x2c10
	.word	0x9da20852	! t0_kref+0x2bfc:   	faddd	%f8, %f18, %f14
	.word	0xf83e401d	! t0_kref+0x2c00:   	std	%i4, [%i1 + %i5]
	.word	0xd59e501d	! t0_kref+0x2c04:   	ldda	[%i1 + %i5]0x80, %f10
	.word	0x22480004	! t0_kref+0x2c08:   	be,a,pt	%icc, _kref+0x2c18
	.word	0xa292400a	! t0_kref+0x2c0c:   	orcc	%o1, %o2, %l1
	.word	0xdd3e0000	! t0_kref+0x2c10:   	std	%f14, [%i0]
	.word	0xa5b30f88	! t0_kref+0x2c14:   	for	%f12, %f8, %f18
	.word	0x25144994	! t0_kref+0x2c18:   	sethi	%hi(0x51265000), %l2
	.word	0x30800006	! t0_kref+0x2c1c:   	ba,a	_kref+0x2c34
	.word	0xada409ab	! t0_kref+0x2c20:   	fdivs	%f16, %f11, %f22
	.word	0x9da0004e	! t0_kref+0x2c24:   	fmovd	%f14, %f14
	.word	0x28800001	! t0_kref+0x2c28:   	bleu,a	_kref+0x2c2c
	.word	0xe49e501d	! t0_kref+0x2c2c:   	ldda	[%i1 + %i5]0x80, %l2
	.word	0xe120a024	! t0_kref+0x2c30:   	st	%f16, [%g2 + 0x24]
	.word	0xd20e8019	! t0_kref+0x2c34:   	ldub	[%i2 + %i1], %o1
	.word	0x940a24eb	! t0_kref+0x2c38:   	and	%o0, 0x4eb, %o2
	.word	0xa1b38f4c	! t0_kref+0x2c3c:   	fornot1	%f14, %f12, %f16
	.word	0xa1a608ad	! t0_kref+0x2c40:   	fsubs	%f24, %f13, %f16
	.word	0xae830009	! t0_kref+0x2c44:   	addcc	%o4, %o1, %l7
	.word	0xd45e3ff8	! t0_kref+0x2c48:   	ldx	[%i0 - 8], %o2
	.word	0x81850000	! t0_kref+0x2c4c:   	wr	%l4, %g0, %y
	.word	0xa1b40acc	! t0_kref+0x2c50:   	fpsub32	%f16, %f12, %f16
	.word	0x91b60998	! t0_kref+0x2c54:   	bshuffle	%f24, %f24, %f8
	.word	0x28480001	! t0_kref+0x2c58:   	bleu,a,pt	%icc, _kref+0x2c5c
	.word	0xef68a084	! t0_kref+0x2c5c:   	prefetch	%g2 + 0x84, 23
	.word	0x31480004	! t0_kref+0x2c60:   	fba,a,pt	%fcc0, _kref+0x2c70
	.word	0x9293273a	! t0_kref+0x2c64:   	orcc	%o4, 0x73a, %o1
	.word	0xaba0002c	! t0_kref+0x2c68:   	fmovs	%f12, %f21
	.word	0xa9a648b1	! t0_kref+0x2c6c:   	fsubs	%f25, %f17, %f20
	.word	0xd886501c	! t0_kref+0x2c70:   	lda	[%i1 + %i4]0x80, %o4
	.word	0x2c480002	! t0_kref+0x2c74:   	bneg,a,pt	%icc, _kref+0x2c7c
	.word	0x8143c000	! t0_kref+0x2c78:   	stbar
	.word	0xd7264000	! t0_kref+0x2c7c:   	st	%f11, [%i1]
	.word	0xd8c65000	! t0_kref+0x2c80:   	ldswa	[%i1]0x80, %o4
	.word	0x98268014	! t0_kref+0x2c84:   	sub	%i2, %l4, %o4
	.word	0x9fb50d2c	! t0_kref+0x2c88:   	fandnot1s	%f20, %f12, %f15
	.word	0xb1a00556	! t0_kref+0x2c8c:   	fsqrtd	%f22, %f24
	.word	0x2e480003	! t0_kref+0x2c90:   	bvs,a,pt	%icc, _kref+0x2c9c
	.word	0xafb58ded	! t0_kref+0x2c94:   	fnands	%f22, %f13, %f23
	.word	0xa5a0054c	! t0_kref+0x2c98:   	fsqrtd	%f12, %f18
	.word	0x99a00033	! t0_kref+0x2c9c:   	fmovs	%f19, %f12
	.word	0x2b26e03d	! t0_kref+0x2ca0:   	sethi	%hi(0x9b80f400), %l5
	.word	0xa4fa4009	! t0_kref+0x2ca4:   	sdivcc	%o1, %o1, %l2
	.word	0xd426201c	! t0_kref+0x2ca8:   	st	%o2, [%i0 + 0x1c]
	.word	0xb3a018ca	! t0_kref+0x2cac:   	fdtos	%f10, %f25
	.word	0xb1b60ace	! t0_kref+0x2cb0:   	fpsub32	%f24, %f14, %f24
	.word	0x94a82251	! t0_kref+0x2cb4:   	andncc	%g0, 0x251, %o2
	.word	0x8143c000	! t0_kref+0x2cb8:   	stbar
	.word	0x30480001	! t0_kref+0x2cbc:   	ba,a,pt	%icc, _kref+0x2cc0
	.word	0xd65e6000	! t0_kref+0x2cc0:   	ldx	[%i1], %o3
	.word	0xaa0ee143	! t0_kref+0x2cc4:   	and	%i3, 0x143, %l5
	.word	0xa5b2c280	! t0_kref+0x2cc8:   	array32	%o3, %g0, %l2
	.word	0xaba24835	! t0_kref+0x2ccc:   	fadds	%f9, %f21, %f21
	.word	0x97a2c8a8	! t0_kref+0x2cd0:   	fsubs	%f11, %f8, %f11
	.word	0xc1e6100a	! t0_kref+0x2cd4:   	casa	[%i0]0x80, %o2, %g0
	.word	0x95b00f08	! t0_kref+0x2cd8:   	fsrc2	%f8, %f10
	.word	0xa9b38988	! t0_kref+0x2cdc:   	bshuffle	%f14, %f8, %f20
	.word	0xf96e3fe8	! t0_kref+0x2ce0:   	prefetch	%i0 - 0x18, 28
	.word	0x9da00558	! t0_kref+0x2ce4:   	fsqrtd	%f24, %f14
	.word	0xaba408aa	! t0_kref+0x2ce8:   	fsubs	%f16, %f10, %f21
	.word	0xd408a033	! t0_kref+0x2cec:   	ldub	[%g2 + 0x33], %o2
	.word	0xadb30756	! t0_kref+0x2cf0:   	fpack32	%f12, %f22, %f22
	.word	0x86102013	! t0_kref+0x2cf4:   	mov	0x13, %g3
	.word	0x86a0e001	! t0_kref+0x2cf8:   	subcc	%g3, 1, %g3
	.word	0x2280000a	! t0_kref+0x2cfc:   	be,a	_kref+0x2d24
	.word	0x983a2a09	! t0_kref+0x2d00:   	xnor	%o0, 0xa09, %o4
	.word	0xea48a00b	! t0_kref+0x2d04:   	ldsb	[%g2 + 0xb], %l5
	.word	0xd64e3fef	! t0_kref+0x2d08:   	ldsb	[%i0 - 0x11], %o3
	.word	0x91a58d36	! t0_kref+0x2d0c:   	fsmuld	%f22, %f22, %f8
	.word	0x9da00030	! t0_kref+0x2d10:   	fmovs	%f16, %f14
	.word	0xdb270018	! t0_kref+0x2d14:   	st	%f13, [%i4 + %i0]
	.word	0xd28e5000	! t0_kref+0x2d18:   	lduba	[%i1]0x80, %o1
	.word	0xe2062004	! t0_kref+0x2d1c:   	ld	[%i0 + 4], %l1
	.word	0x2f800004	! t0_kref+0x2d20:   	fbu,a	_kref+0x2d30
	.word	0x99a01930	! t0_kref+0x2d24:   	fstod	%f16, %f12
	.word	0x95a308ac	! t0_kref+0x2d28:   	fsubs	%f12, %f12, %f10
	.word	0xa4b22210	! t0_kref+0x2d2c:   	orncc	%o0, 0x210, %l2
	.word	0x9ba288ae	! t0_kref+0x2d30:   	fsubs	%f10, %f14, %f13
	.word	0xa5b38e6e	! t0_kref+0x2d34:   	fxnors	%f14, %f14, %f18
	.word	0xadb48af1	! t0_kref+0x2d38:   	fpsub32s	%f18, %f17, %f22
	.word	0xe3b8a040	! t0_kref+0x2d3c:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x81824000	! t0_kref+0x2d40:   	wr	%o1, %g0, %y
	.word	0xa2b2c009	! t0_kref+0x2d44:   	orncc	%o3, %o1, %l1
	.word	0x81b01027	! t0_kref+0x2d48:   	siam	0x7
	.word	0xc12e001c	! t0_kref+0x2d4c:   	st	%fsr, [%i0 + %i4]
	.word	0x3b800003	! t0_kref+0x2d50:   	fble,a	_kref+0x2d5c
	.word	0x91a88056	! t0_kref+0x2d54:   	fmovdlg	%fcc0, %f22, %f8
	.word	0x9416b3c7	! t0_kref+0x2d58:   	or	%i2, -0xc39, %o2
	.word	0x9af5616b	! t0_kref+0x2d5c:   	udivcc	%l5, 0x16b, %o5
	.word	0xa83ec00d	! t0_kref+0x2d60:   	xnor	%i3, %o5, %l4
	.word	0xd9beda58	! t0_kref+0x2d64:   	stda	%f12, [%i3 + %i0]0xd2
	.word	0x9626fe15	! t0_kref+0x2d68:   	sub	%i3, -0x1eb, %o3
	.word	0x34480004	! t0_kref+0x2d6c:   	bg,a,pt	%icc, _kref+0x2d7c
	.word	0xa8980008	! t0_kref+0x2d70:   	xorcc	%g0, %o0, %l4
	.word	0xa5a01a56	! t0_kref+0x2d74:   	fdtoi	%f22, %f18
	.word	0xd0266008	! t0_kref+0x2d78:   	st	%o0, [%i1 + 8]
	.word	0x942ec01b	! t0_kref+0x2d7c:   	andn	%i3, %i3, %o2
	.word	0xa615c015	! t0_kref+0x2d80:   	or	%l7, %l5, %l3
	.word	0xd53e4000	! t0_kref+0x2d84:   	std	%f10, [%i1]
	.word	0x99a01a56	! t0_kref+0x2d88:   	fdtoi	%f22, %f12
	.word	0xa3a01a48	! t0_kref+0x2d8c:   	fdtoi	%f8, %f17
	.word	0xf6362006	! t0_kref+0x2d90:   	sth	%i3, [%i0 + 6]
	.word	0xf3064000	! t0_kref+0x2d94:   	ld	[%i1], %f25
	.word	0xa92b000d	! t0_kref+0x2d98:   	sll	%o4, %o5, %l4
	.word	0xae2d400b	! t0_kref+0x2d9c:   	andn	%l5, %o3, %l7
	.word	0xde50a032	! t0_kref+0x2da0:   	ldsh	[%g2 + 0x32], %o7
	.word	0xe9267fe8	! t0_kref+0x2da4:   	st	%f20, [%i1 - 0x18]
	.word	0xa8f6a0c4	! t0_kref+0x2da8:   	udivcc	%i2, 0xc4, %l4
	.word	0x36800008	! t0_kref+0x2dac:   	bge,a	_kref+0x2dcc
	.word	0xf19e9a18	! t0_kref+0x2db0:   	ldda	[%i2 + %i0]0xd0, %f24
	.word	0x92bd6c5b	! t0_kref+0x2db4:   	xnorcc	%l5, 0xc5b, %o1
	.word	0x9da2cd39	! t0_kref+0x2db8:   	fsmuld	%f11, %f25, %f14
	.word	0xb1b38d08	! t0_kref+0x2dbc:   	fandnot1	%f14, %f8, %f24
	.word	0xada4482b	! t0_kref+0x2dc0:   	fadds	%f17, %f11, %f22
	.word	0x8143c000	! t0_kref+0x2dc4:   	stbar
	.word	0xf11fbda8	! t0_kref+0x2dc8:   	ldd	[%fp - 0x258], %f24
	.word	0x8182c000	! t0_kref+0x2dcc:   	wr	%o3, %g0, %y
	.word	0x9fc00004	! t0_kref+0x2dd0:   	call	%g0 + %g4
	.word	0xaba0052b	! t0_kref+0x2dd4:   	fsqrts	%f11, %f21
	.word	0xe656001b	! t0_kref+0x2dd8:   	ldsh	[%i0 + %i3], %l3
	.word	0xabb20280	! t0_kref+0x2ddc:   	array32	%o0, %g0, %l5
	.word	0x3d800006	! t0_kref+0x2de0:   	fbule,a	_kref+0x2df8
	.word	0xf1be1894	! t0_kref+0x2de4:   	stda	%f24, [%i0 + %l4]0xc4
	.word	0xd410a018	! t0_kref+0x2de8:   	lduh	[%g2 + 0x18], %o2
	.word	0x973a601b	! t0_kref+0x2dec:   	sra	%o1, 0x1b, %o3
	.word	0xe01e7fe0	! t0_kref+0x2df0:   	ldd	[%i1 - 0x20], %l0
	.word	0x95227ec6	! t0_kref+0x2df4:   	mulscc	%o1, -0x13a, %o2
	.word	0x9fa20837	! t0_kref+0x2df8:   	fadds	%f8, %f23, %f15
	.word	0x28480003	! t0_kref+0x2dfc:   	bleu,a,pt	%icc, _kref+0x2e08
	.word	0x9b40c000	! t0_kref+0x2e00:   	mov	%asi, %o5
	.word	0xfd6e001c	! t0_kref+0x2e04:   	prefetch	%i0 + %i4, 30
	.word	0xa5a3094e	! t0_kref+0x2e08:   	fmuld	%f12, %f14, %f18
	.word	0x91a00031	! t0_kref+0x2e0c:   	fmovs	%f17, %f8
	.word	0x9da01897	! t0_kref+0x2e10:   	fitos	%f23, %f14
	.word	0x8143c000	! t0_kref+0x2e14:   	stbar
	.word	0xed266018	! t0_kref+0x2e18:   	st	%f22, [%i1 + 0x18]
	.word	0x81acca2e	! t0_kref+0x2e1c:   	fcmps	%fcc0, %f19, %f14
	.word	0xd66e6007	! t0_kref+0x2e20:   	ldstub	[%i1 + 7], %o3
	.word	0x27137b39	! t0_kref+0x2e24:   	sethi	%hi(0x4dece400), %l3
	.word	0x9a26f606	! t0_kref+0x2e28:   	sub	%i3, -0x9fa, %o5
	.word	0xa606800c	! t0_kref+0x2e2c:   	add	%i2, %o4, %l3
	.word	0xa045801b	! t0_kref+0x2e30:   	addc	%l6, %i3, %l0
	.word	0x95b3854a	! t0_kref+0x2e34:   	fcmpeq16	%f14, %f10, %o2
	.word	0x81ae0aca	! t0_kref+0x2e38:   	fcmped	%fcc0, %f24, %f10
	.word	0x3c480005	! t0_kref+0x2e3c:   	bpos,a,pt	%icc, _kref+0x2e50
	.word	0xd5200018	! t0_kref+0x2e40:   	st	%f10, [%g0 + %i0]
	.word	0xa9b2cea0	! t0_kref+0x2e44:   	fsrc1s	%f11, %f20
	.word	0xaae6b2f3	! t0_kref+0x2e48:   	subccc	%i2, -0xd0d, %l5
	.word	0xa2d50009	! t0_kref+0x2e4c:   	umulcc	%l4, %o1, %l1
	.word	0xfdee501b	! t0_kref+0x2e50:   	prefetcha	%i1 + %i3, 30
	.word	0xd440a004	! t0_kref+0x2e54:   	ldsw	[%g2 + 4], %o2
	.word	0x2338574d	! t0_kref+0x2e58:   	sethi	%hi(0xe15d3400), %l1
	.word	0x001fffff	! t0_kref+0x2e5c:   	illtrap	0x1fffff
	.word	0x81ab8ace	! t0_kref+0x2e60:   	fcmped	%fcc0, %f14, %f14
	.word	0x81ab8ad4	! t0_kref+0x2e64:   	fcmped	%fcc0, %f14, %f20
	.word	0xa3a01a52	! t0_kref+0x2e68:   	fdtoi	%f18, %f17
	.word	0x81aaca34	! t0_kref+0x2e6c:   	fcmps	%fcc0, %f11, %f20
	.word	0xaeb5c008	! t0_kref+0x2e70:   	orncc	%l7, %o0, %l7
	.word	0xadb307ca	! t0_kref+0x2e74:   	pdist	%f12, %f10, %f22
	.word	0x99b28a14	! t0_kref+0x2e78:   	fpadd16	%f10, %f20, %f12
	.word	0xde467ff8	! t0_kref+0x2e7c:   	ldsw	[%i1 - 8], %o7
	.word	0xb1a0102b	! t0_kref+0x2e80:   	fstox	%f11, %f24
	.word	0xa82ea055	! t0_kref+0x2e84:   	andn	%i2, 0x55, %l4
	.word	0xafb5c00a	! t0_kref+0x2e88:   	edge8	%l7, %o2, %l7
	.word	0x9da449b7	! t0_kref+0x2e8c:   	fdivs	%f17, %f23, %f14
	.word	0x942dab65	! t0_kref+0x2e90:   	andn	%l6, 0xb65, %o2
	.word	0x9de3bfa0	! t0_kref+0x2e94:   	save	%sp, -0x60, %sp
	.word	0x8106be58	! t0_kref+0x2e98:   	taddcc	%i2, -0x1a8, %g0
	.word	0xabeec01d	! t0_kref+0x2e9c:   	restore	%i3, %i5, %l5
	.word	0x96b2000d	! t0_kref+0x2ea0:   	orncc	%o0, %o5, %o3
	.word	0xa1a0054e	! t0_kref+0x2ea4:   	fsqrtd	%f14, %f16
	.word	0xa126c015	! t0_kref+0x2ea8:   	mulscc	%i3, %l5, %l0
	.word	0x95a01a56	! t0_kref+0x2eac:   	fdtoi	%f22, %f10
	.word	0xfd6e001d	! t0_kref+0x2eb0:   	prefetch	%i0 + %i5, 30
	.word	0x9ba2882a	! t0_kref+0x2eb4:   	fadds	%f10, %f10, %f13
	.word	0x8143e040	! t0_kref+0x2eb8:   	membar	0x40
	.word	0x26480001	! t0_kref+0x2ebc:   	bl,a,pt	%icc, _kref+0x2ec0
	.word	0xada30d38	! t0_kref+0x2ec0:   	fsmuld	%f12, %f24, %f22
	.word	0xb3b28df2	! t0_kref+0x2ec4:   	fnands	%f10, %f18, %f25
	.word	0xde0e001a	! t0_kref+0x2ec8:   	ldub	[%i0 + %i2], %o7
	.word	0x9fb50c75	! t0_kref+0x2ecc:   	fnors	%f20, %f21, %f15
	.word	0x93a000b1	! t0_kref+0x2ed0:   	fnegs	%f17, %f9
	.word	0xe400a028	! t0_kref+0x2ed4:   	ld	[%g2 + 0x28], %l2
	.word	0x22480002	! t0_kref+0x2ed8:   	be,a,pt	%icc, _kref+0x2ee0
	.word	0xfd3f4005	! t0_kref+0x2edc:   	std	%f30, [%i5 + %g5]
	.word	0xa9b64ef9	! t0_kref+0x2ee0:   	fornot2s	%f25, %f25, %f20
	.word	0x97200009	! t0_kref+0x2ee4:   	mulscc	%g0, %o1, %o3
	.word	0xec160000	! t0_kref+0x2ee8:   	lduh	[%i0], %l6
	.word	0xaaaa401b	! t0_kref+0x2eec:   	andncc	%o1, %i3, %l5
	.word	0xd6680019	! t0_kref+0x2ef0:   	ldstub	[%g0 + %i1], %o3
	.word	0x93a01888	! t0_kref+0x2ef4:   	fitos	%f8, %f9
	.word	0xa3b30cb2	! t0_kref+0x2ef8:   	fandnot2s	%f12, %f18, %f17
	.word	0xe900a00c	! t0_kref+0x2efc:   	ld	[%g2 + 0xc], %f20
	.word	0xada24833	! t0_kref+0x2f00:   	fadds	%f9, %f19, %f22
	.word	0x81824000	! t0_kref+0x2f04:   	wr	%o1, %g0, %y
	.word	0x909eee56	! t0_kref+0x2f08:   	xorcc	%i3, 0xe56, %o0
	.word	0xd9260000	! t0_kref+0x2f0c:   	st	%f12, [%i0]
	.word	0x2a480007	! t0_kref+0x2f10:   	bcs,a,pt	%icc, _kref+0x2f2c
	.word	0xf43e001d	! t0_kref+0x2f14:   	std	%i2, [%i0 + %i5]
	.word	0xa7a01a37	! t0_kref+0x2f18:   	fstoi	%f23, %f19
	.word	0xa786c014	! t0_kref+0x2f1c:   	wr	%i3, %l4, %gsr
	.word	0xda4e7ff7	! t0_kref+0x2f20:   	ldsb	[%i1 - 9], %o5
	.word	0xff6e7ff0	! t0_kref+0x2f24:   	prefetch	%i1 - 0x10, 31
	.word	0xe168a00f	! t0_kref+0x2f28:   	prefetch	%g2 + 0xf, 16
	.word	0xec7e7ffc	! t0_kref+0x2f2c:   	swap	[%i1 - 4], %l6
	.word	0x95a6094e	! t0_kref+0x2f30:   	fmuld	%f24, %f14, %f10
	.word	0x38480004	! t0_kref+0x2f34:   	bgu,a,pt	%icc, _kref+0x2f44
	.word	0xc3ee1015	! t0_kref+0x2f38:   	prefetcha	%i0 + %l5, 1
	.word	0x99a28848	! t0_kref+0x2f3c:   	faddd	%f10, %f8, %f12
	.word	0x9628286b	! t0_kref+0x2f40:   	andn	%g0, 0x86b, %o3
	.word	0xa9b6c13a	! t0_kref+0x2f44:   	edge32n	%i3, %i2, %l4
	.word	0xb1a0190a	! t0_kref+0x2f48:   	fitod	%f10, %f24
	.word	0x9da000d2	! t0_kref+0x2f4c:   	fnegd	%f18, %f14
	.word	0x95a0054e	! t0_kref+0x2f50:   	fsqrtd	%f14, %f10
	.word	0x9de3bfa0	! t0_kref+0x2f54:   	save	%sp, -0x60, %sp
	.word	0x80102947	! t0_kref+0x2f58:   	mov	0x947, %g0
	.word	0xa9ee7734	! t0_kref+0x2f5c:   	restore	%i1, -0x8cc, %l4
	.word	0x34800002	! t0_kref+0x2f60:   	bg,a	_kref+0x2f68
	.word	0x9ba018c8	! t0_kref+0x2f64:   	fdtos	%f8, %f13
	.word	0xa9a389ae	! t0_kref+0x2f68:   	fdivs	%f14, %f14, %f20
	.word	0xa4fafdfe	! t0_kref+0x2f6c:   	sdivcc	%o3, -0x202, %l2
	.word	0xf436c019	! t0_kref+0x2f70:   	sth	%i2, [%i3 + %i1]
	.word	0x3e800005	! t0_kref+0x2f74:   	bvc,a	_kref+0x2f88
	.word	0xa9b60754	! t0_kref+0x2f78:   	fpack32	%f24, %f20, %f20
	.word	0xa7b48e6e	! t0_kref+0x2f7c:   	fxnors	%f18, %f14, %f19
	.word	0x24800001	! t0_kref+0x2f80:   	ble,a	_kref+0x2f84
	.word	0x81858000	! t0_kref+0x2f84:   	wr	%l6, %g0, %y
	.word	0xad320009	! t0_kref+0x2f88:   	srl	%o0, %o1, %l6
	.word	0xc3ee5015	! t0_kref+0x2f8c:   	prefetcha	%i1 + %l5, 1
	.word	0xada01a28	! t0_kref+0x2f90:   	fstoi	%f8, %f22
	.word	0xaa92fb19	! t0_kref+0x2f94:   	orcc	%o3, -0x4e7, %l5
	.word	0x3c480008	! t0_kref+0x2f98:   	bpos,a,pt	%icc, _kref+0x2fb8
	.word	0xa8ad3e2f	! t0_kref+0x2f9c:   	andncc	%l4, -0x1d1, %l4
	.word	0xe9e6500b	! t0_kref+0x2fa0:   	casa	[%i1]0x80, %o3, %l4
	.word	0x81ab0a39	! t0_kref+0x2fa4:   	fcmps	%fcc0, %f12, %f25
	.word	0xf1ee501c	! t0_kref+0x2fa8:   	prefetcha	%i1 + %i4, 24
	.word	0x98ddf024	! t0_kref+0x2fac:   	smulcc	%l7, -0xfdc, %o4
	.word	0xe7262004	! t0_kref+0x2fb0:   	st	%f19, [%i0 + 4]
	.word	0xea00a030	! t0_kref+0x2fb4:   	ld	[%g2 + 0x30], %l5
	.word	0x9740c000	! t0_kref+0x2fb8:   	mov	%asi, %o3
	.word	0x81aa0a50	! t0_kref+0x2fbc:   	fcmpd	%fcc0, %f8, %f16
	.word	0xe5981019	! t0_kref+0x2fc0:   	ldda	[%g0 + %i1]0x80, %f18
	.word	0xe64e601d	! t0_kref+0x2fc4:   	ldsb	[%i1 + 0x1d], %l3
	.word	0x9de3bfa0	! t0_kref+0x2fc8:   	save	%sp, -0x60, %sp
	.word	0xb0aec018	! t0_kref+0x2fcc:   	andncc	%i3, %i0, %i0
	.word	0x95e82f50	! t0_kref+0x2fd0:   	restore	%g0, 0xf50, %o2
	.word	0x3c480008	! t0_kref+0x2fd4:   	bpos,a,pt	%icc, _kref+0x2ff4
	.word	0x920a0014	! t0_kref+0x2fd8:   	and	%o0, %l4, %o1
	.word	0x97a01a50	! t0_kref+0x2fdc:   	fdtoi	%f16, %f11
	.word	0x97b58e32	! t0_kref+0x2fe0:   	fands	%f22, %f18, %f11
	.word	0xa9a01892	! t0_kref+0x2fe4:   	fitos	%f18, %f20
	.word	0xef00a004	! t0_kref+0x2fe8:   	ld	[%g2 + 4], %f23
	.word	0xdfa01019	! t0_kref+0x2fec:   	sta	%f15, [%g0 + %i1]0x80
	.word	0x81820000	! t0_kref+0x2ff0:   	wr	%o0, %g0, %y
	.word	0xe81e401d	! t0_kref+0x2ff4:   	ldd	[%i1 + %i5], %l4
	.word	0xd9067fe0	! t0_kref+0x2ff8:   	ld	[%i1 - 0x20], %f12
	.word	0x8143e016	! t0_kref+0x2ffc:   	membar	0x16
	.word	0xee066014	! t0_kref+0x3000:   	ld	[%i1 + 0x14], %l7
	.word	0xb1a0102c	! t0_kref+0x3004:   	fstox	%f12, %f24
	.word	0xa7a00138	! t0_kref+0x3008:   	fabss	%f24, %f19
	.word	0x81ae0ad0	! t0_kref+0x300c:   	fcmped	%fcc0, %f24, %f16
	.word	0xa9b5c06d	! t0_kref+0x3010:   	edge8ln	%l7, %o5, %l4
	.word	0xf1be1a5c	! t0_kref+0x3014:   	stda	%f24, [%i0 + %i4]0xd2
	.word	0xfd6e6010	! t0_kref+0x3018:   	prefetch	%i1 + 0x10, 30
	.word	0xdd267fe8	! t0_kref+0x301c:   	st	%f14, [%i1 - 0x18]
	.word	0xd26e7fe1	! t0_kref+0x3020:   	ldstub	[%i1 - 0x1f], %o1
	.word	0xa1a2c836	! t0_kref+0x3024:   	fadds	%f11, %f22, %f16
	.word	0x9bb00cf3	! t0_kref+0x3028:   	fnot2s	%f19, %f13
	.word	0x90f3401b	! t0_kref+0x302c:   	udivcc	%o5, %i3, %o0
	.word	0x95a00554	! t0_kref+0x3030:   	fsqrtd	%f20, %f10
	.word	0xa9642366	! t0_kref+0x3034:   	movn	%icc, 0x366, %l4
	.word	0x99a018cc	! t0_kref+0x3038:   	fdtos	%f12, %f12
	.word	0xada00052	! t0_kref+0x303c:   	fmovd	%f18, %f22
	.word	0x112bf3ee	! t0_kref+0x3040:   	sethi	%hi(0xafcfb800), %o0
	.word	0xd44e3ff4	! t0_kref+0x3044:   	ldsb	[%i0 - 0xc], %o2
	.word	0x9fb54068	! t0_kref+0x3048:   	edge8ln	%l5, %o0, %o7
	.word	0xd04e3ff1	! t0_kref+0x304c:   	ldsb	[%i0 - 0xf], %o0
	.word	0xd610001b	! t0_kref+0x3050:   	lduh	[%g0 + %i3], %o3
	.word	0x91a01a54	! t0_kref+0x3054:   	fdtoi	%f20, %f8
	.word	0xd920a028	! t0_kref+0x3058:   	st	%f12, [%g2 + 0x28]
	.word	0xa6f2a7e7	! t0_kref+0x305c:   	udivcc	%o2, 0x7e7, %l3
	.word	0x81aa8ad6	! t0_kref+0x3060:   	fcmped	%fcc0, %f10, %f22
	.word	0xe66e2014	! t0_kref+0x3064:   	ldstub	[%i0 + 0x14], %l3
	.word	0x36800006	! t0_kref+0x3068:   	bge,a	_kref+0x3080
	.word	0xec40a004	! t0_kref+0x306c:   	ldsw	[%g2 + 4], %l6
	.word	0x81ab8ac8	! t0_kref+0x3070:   	fcmped	%fcc0, %f14, %f8
	.word	0x97a00536	! t0_kref+0x3074:   	fsqrts	%f22, %f11
	.word	0xd410a00e	! t0_kref+0x3078:   	lduh	[%g2 + 0xe], %o2
	.word	0xda40a00c	! t0_kref+0x307c:   	ldsw	[%g2 + 0xc], %o5
	.word	0xab3ea001	! t0_kref+0x3080:   	sra	%i2, 0x1, %l5
	.word	0x9ba01a2c	! t0_kref+0x3084:   	fstoi	%f12, %f13
	.word	0x8143e040	! t0_kref+0x3088:   	membar	0x40
	.word	0x20800001	! t0_kref+0x308c:   	bn,a	_kref+0x3090
	.word	0x95a01896	! t0_kref+0x3090:   	fitos	%f22, %f10
	.word	0xd51e6000	! t0_kref+0x3094:   	ldd	[%i1], %f10
	.word	0xda262004	! t0_kref+0x3098:   	st	%o5, [%i0 + 4]
	.word	0x81ab8ad4	! t0_kref+0x309c:   	fcmped	%fcc0, %f14, %f20
	.word	0x99b3848c	! t0_kref+0x30a0:   	fcmple32	%f14, %f12, %o4
	.word	0xae22800b	! t0_kref+0x30a4:   	sub	%o2, %o3, %l7
	.word	0x93a30828	! t0_kref+0x30a8:   	fadds	%f12, %f8, %f9
	.word	0x81acca35	! t0_kref+0x30ac:   	fcmps	%fcc0, %f19, %f21
	.word	0xe8000018	! t0_kref+0x30b0:   	ld	[%g0 + %i0], %l4
	.word	0x8610200a	! t0_kref+0x30b4:   	mov	0xa, %g3
	.word	0x86a0e001	! t0_kref+0x30b8:   	subcc	%g3, 1, %g3
	.word	0x2280001a	! t0_kref+0x30bc:   	be,a	_kref+0x3124
	.word	0x912ee00f	! t0_kref+0x30c0:   	sll	%i3, 0xf, %o0
	.word	0xaaa2400d	! t0_kref+0x30c4:   	subcc	%o1, %o5, %l5
	.word	0xa5b50a4a	! t0_kref+0x30c8:   	fpadd32	%f20, %f10, %f18
	.word	0xd7000019	! t0_kref+0x30cc:   	ld	[%g0 + %i1], %f11
	.word	0xda562008	! t0_kref+0x30d0:   	ldsh	[%i0 + 8], %o5
	.word	0x93a0002c	! t0_kref+0x30d4:   	fmovs	%f12, %f9
	.word	0xa5a01930	! t0_kref+0x30d8:   	fstod	%f16, %f18
	.word	0xaa16c017	! t0_kref+0x30dc:   	or	%i3, %l7, %l5
	.word	0x91b48994	! t0_kref+0x30e0:   	bshuffle	%f18, %f20, %f8
	.word	0xa69e8014	! t0_kref+0x30e4:   	xorcc	%i2, %l4, %l3
	.word	0xa8a80000	! t0_kref+0x30e8:   	andncc	%g0, %g0, %l4
	.word	0x81adca2b	! t0_kref+0x30ec:   	fcmps	%fcc0, %f23, %f11
	.word	0xafb20f69	! t0_kref+0x30f0:   	fornot1s	%f8, %f9, %f23
	.word	0x23800004	! t0_kref+0x30f4:   	fbne,a	_kref+0x3104
	.word	0xded6d019	! t0_kref+0x30f8:   	ldsha	[%i3 + %i1]0x80, %o7
	.word	0xdd3f4018	! t0_kref+0x30fc:   	std	%f14, [%i5 + %i0]
	.word	0xa7b5407b	! t0_kref+0x3100:   	edge8ln	%l5, %i3, %l3
	.word	0xa5a248b2	! t0_kref+0x3104:   	fsubs	%f9, %f18, %f18
	.word	0xd83e2008	! t0_kref+0x3108:   	std	%o4, [%i0 + 8]
	.word	0xae0aef03	! t0_kref+0x310c:   	and	%o3, 0xf03, %l7
	.word	0xd6000019	! t0_kref+0x3110:   	ld	[%g0 + %i1], %o3
	.word	0x193e7ece	! t0_kref+0x3114:   	sethi	%hi(0xf9fb3800), %o4
	.word	0xf11e7ff0	! t0_kref+0x3118:   	ldd	[%i1 - 0x10], %f24
	.word	0x97a01a58	! t0_kref+0x311c:   	fdtoi	%f24, %f11
	.word	0xe800a01c	! t0_kref+0x3120:   	ld	[%g2 + 0x1c], %l4
	.word	0x2e800008	! t0_kref+0x3124:   	bvs,a	_kref+0x3144
	.word	0xd448a03f	! t0_kref+0x3128:   	ldsb	[%g2 + 0x3f], %o2
	.word	0x9fa00035	! t0_kref+0x312c:   	fmovs	%f21, %f15
	.word	0x9486a4e6	! t0_kref+0x3130:   	addcc	%i2, 0x4e6, %o2
	.word	0x81ad8aad	! t0_kref+0x3134:   	fcmpes	%fcc0, %f22, %f13
	.word	0xa2c34009	! t0_kref+0x3138:   	addccc	%o5, %o1, %l1
	.word	0xa43aa04b	! t0_kref+0x313c:   	xnor	%o2, 0x4b, %l2
	.word	0xabb50af9	! t0_kref+0x3140:   	fpsub32s	%f20, %f25, %f21
	.word	0x91a2c82e	! t0_kref+0x3144:   	fadds	%f11, %f14, %f8
	.word	0xabb0017b	! t0_kref+0x3148:   	edge32ln	%g0, %i3, %l5
	.word	0xe93e4000	! t0_kref+0x314c:   	std	%f20, [%i1]
	.word	0xd7062014	! t0_kref+0x3150:   	ld	[%i0 + 0x14], %f11
	.word	0xaba00036	! t0_kref+0x3154:   	fmovs	%f22, %f21
	.word	0x87802082	! t0_kref+0x3158:   	mov	0x82, %asi
	.word	0xec6e2015	! t0_kref+0x315c:   	ldstub	[%i0 + 0x15], %l6
	.word	0x9e168017	! t0_kref+0x3160:   	or	%i2, %l7, %o7
	.word	0xb1a00038	! t0_kref+0x3164:   	fmovs	%f24, %f24
	.word	0x8143c000	! t0_kref+0x3168:   	stbar
	.word	0xef270019	! t0_kref+0x316c:   	st	%f23, [%i4 + %i1]
	.word	0x90b30017	! t0_kref+0x3170:   	orncc	%o4, %l7, %o0
	.word	0x81ae0a50	! t0_kref+0x3174:   	fcmpd	%fcc0, %f24, %f16
	.word	0x99a0192a	! t0_kref+0x3178:   	fstod	%f10, %f12
	.word	0x86102004	! t0_kref+0x317c:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x3180:   	bne,a	_kref+0x3180
	.word	0x86a0e001	! t0_kref+0x3184:   	subcc	%g3, 1, %g3
	.word	0x2f800003	! t0_kref+0x3188:   	fbu,a	_kref+0x3194
	.word	0xa9b28e69	! t0_kref+0x318c:   	fxnors	%f10, %f9, %f20
	.word	0xe450a022	! t0_kref+0x3190:   	ldsh	[%g2 + 0x22], %l2
	.word	0xd62e3ff4	! t0_kref+0x3194:   	stb	%o3, [%i0 - 0xc]
	.word	0xa69abc05	! t0_kref+0x3198:   	xorcc	%o2, -0x3fb, %l3
	.word	0xd11e3ff0	! t0_kref+0x319c:   	ldd	[%i0 - 0x10], %f8
	.word	0x9da64d39	! t0_kref+0x31a0:   	fsmuld	%f25, %f25, %f14
	.word	0xd5a6501c	! t0_kref+0x31a4:   	sta	%f10, [%i1 + %i4]0x80
	.word	0x96326e93	! t0_kref+0x31a8:   	orn	%o1, 0xe93, %o3
	.word	0xa032001b	! t0_kref+0x31ac:   	orn	%o0, %i3, %l0
	.word	0xde5e2008	! t0_kref+0x31b0:   	ldx	[%i0 + 8], %o7
	.word	0xec366010	! t0_kref+0x31b4:   	sth	%l6, [%i1 + 0x10]
	.word	0xa9b58c4a	! t0_kref+0x31b8:   	fnor	%f22, %f10, %f20
	.word	0xadb20ab9	! t0_kref+0x31bc:   	fpsub16s	%f8, %f25, %f22
	.word	0xea200019	! t0_kref+0x31c0:   	st	%l5, [%g0 + %i1]
	.word	0xdd20a018	! t0_kref+0x31c4:   	st	%f14, [%g2 + 0x18]
	.word	0xe8162000	! t0_kref+0x31c8:   	lduh	[%i0], %l4
	.word	0xee08a00b	! t0_kref+0x31cc:   	ldub	[%g2 + 0xb], %l7
	.word	0xadb4848a	! t0_kref+0x31d0:   	fcmple32	%f18, %f10, %l6
	.word	0xe91e001d	! t0_kref+0x31d4:   	ldd	[%i0 + %i5], %f20
	.word	0xa9b5862e	! t0_kref+0x31d8:   	fmul8x16	%f22, %f14, %f20
	.word	0x9da4cd2f	! t0_kref+0x31dc:   	fsmuld	%f19, %f15, %f14
	.word	0xb1a01916	! t0_kref+0x31e0:   	fitod	%f22, %f24
	.word	0xae82c00d	! t0_kref+0x31e4:   	addcc	%o3, %o5, %l7
	.word	0x91a01a4e	! t0_kref+0x31e8:   	fdtoi	%f14, %f8
	.word	0xb1a54d28	! t0_kref+0x31ec:   	fsmuld	%f21, %f8, %f24
	.word	0x9da00132	! t0_kref+0x31f0:   	fabss	%f18, %f14
	.word	0x3e800002	! t0_kref+0x31f4:   	bvc,a	_kref+0x31fc
	.word	0xd91e2000	! t0_kref+0x31f8:   	ldd	[%i0], %f12
	.word	0xd828a00e	! t0_kref+0x31fc:   	stb	%o4, [%g2 + 0xe]
	.word	0xd11e6000	! t0_kref+0x3200:   	ldd	[%i1], %f8
	.word	0xe6167fee	! t0_kref+0x3204:   	lduh	[%i1 - 0x12], %l3
	.word	0xacf6f94e	! t0_kref+0x3208:   	udivcc	%i3, -0x6b2, %l6
	.word	0xa12aa01a	! t0_kref+0x320c:   	sll	%o2, 0x1a, %l0
	.word	0x3e480004	! t0_kref+0x3210:   	bvc,a,pt	%icc, _kref+0x3220
	.word	0x91a01a2f	! t0_kref+0x3214:   	fstoi	%f15, %f8
	.word	0xe51e001d	! t0_kref+0x3218:   	ldd	[%i0 + %i5], %f18
	.word	0xe8267ff4	! t0_kref+0x321c:   	st	%l4, [%i1 - 0xc]
	.word	0xada58829	! t0_kref+0x3220:   	fadds	%f22, %f9, %f22
	.word	0xa7b405d8	! t0_kref+0x3224:   	fcmpeq32	%f16, %f24, %l3
	.word	0xd608a003	! t0_kref+0x3228:   	ldub	[%g2 + 3], %o3
	.word	0x988e8017	! t0_kref+0x322c:   	andcc	%i2, %l7, %o4
	.word	0x95a408b2	! t0_kref+0x3230:   	fsubs	%f16, %f18, %f10
	.word	0x903dfa1e	! t0_kref+0x3234:   	xnor	%l7, -0x5e2, %o0
	.word	0x86102001	! t0_kref+0x3238:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x323c:   	bne,a	_kref+0x323c
	.word	0x86a0e001	! t0_kref+0x3240:   	subcc	%g3, 1, %g3
	.word	0xb1b50df8	! t0_kref+0x3244:   	fnands	%f20, %f24, %f24
	.word	0x3a480006	! t0_kref+0x3248:   	bcc,a,pt	%icc, _kref+0x3260
	.word	0x9ba01a2a	! t0_kref+0x324c:   	fstoi	%f10, %f13
	.word	0x90aec017	! t0_kref+0x3250:   	andncc	%i3, %l7, %o0
	.word	0xc568a041	! t0_kref+0x3254:   	prefetch	%g2 + 0x41, 2
	.word	0xe3262010	! t0_kref+0x3258:   	st	%f17, [%i0 + 0x10]
	.word	0x90383874	! t0_kref+0x325c:   	xnor	%g0, -0x78c, %o0
	.word	0x9115214f	! t0_kref+0x3260:   	taddcctv	%l4, 0x14f, %o0
	.word	0xa5a0188e	! t0_kref+0x3264:   	fitos	%f14, %f18
	.word	0xafa018cc	! t0_kref+0x3268:   	fdtos	%f12, %f23
	.word	0xde000018	! t0_kref+0x326c:   	ld	[%g0 + %i0], %o7
	.word	0x2d800006	! t0_kref+0x3270:   	fbg,a	_kref+0x3288
	.word	0x95b58a96	! t0_kref+0x3274:   	fpsub16	%f22, %f22, %f10
	.word	0x93a01a48	! t0_kref+0x3278:   	fdtoi	%f8, %f9
	.word	0xa1a0188d	! t0_kref+0x327c:   	fitos	%f13, %f16
	.word	0xb1b2472e	! t0_kref+0x3280:   	fmuld8ulx16	%f9, %f14, %f24
	.word	0x38480004	! t0_kref+0x3284:   	bgu,a,pt	%icc, _kref+0x3294
	.word	0x81820000	! t0_kref+0x3288:   	wr	%o0, %g0, %y
	.word	0x91b58a0a	! t0_kref+0x328c:   	fpadd16	%f22, %f10, %f8
	.word	0xafb20dab	! t0_kref+0x3290:   	fxors	%f8, %f11, %f23
	.word	0x3a480001	! t0_kref+0x3294:   	bcc,a,pt	%icc, _kref+0x3298
	.word	0xd9b81019	! t0_kref+0x3298:   	stda	%f12, [%g0 + %i1]0x80
	.word	0x95b607cc	! t0_kref+0x329c:   	pdist	%f24, %f12, %f10
	.word	0x2c480006	! t0_kref+0x32a0:   	bneg,a,pt	%icc, _kref+0x32b8
	.word	0x9762a66e	! t0_kref+0x32a4:   	movue	%fcc0, -0x192, %o3
	.word	0x95a01931	! t0_kref+0x32a8:   	fstod	%f17, %f10
	.word	0xd6ce501a	! t0_kref+0x32ac:   	ldsba	[%i1 + %i2]0x80, %o3
	.word	0xa1a000d8	! t0_kref+0x32b0:   	fnegd	%f24, %f16
	.word	0x943e800d	! t0_kref+0x32b4:   	xnor	%i2, %o5, %o2
	.word	0xaaaeea84	! t0_kref+0x32b8:   	andncc	%i3, 0xa84, %l5
	.word	0xa4f00009	! t0_kref+0x32bc:   	udivcc	%g0, %o1, %l2
	.word	0x81ae4a33	! t0_kref+0x32c0:   	fcmps	%fcc0, %f25, %f19
	.word	0xc768a00c	! t0_kref+0x32c4:   	prefetch	%g2 + 0xc, 3
	.word	0x81ad0acc	! t0_kref+0x32c8:   	fcmped	%fcc0, %f20, %f12
	.word	0xa7a01a52	! t0_kref+0x32cc:   	fdtoi	%f18, %f19
	.word	0xed260000	! t0_kref+0x32d0:   	st	%f22, [%i0]
	.word	0x32800004	! t0_kref+0x32d4:   	bne,a	_kref+0x32e4
	.word	0xc938001d	! t0_kref+0x32d8:   	std	%f4, [%g0 + %i5]
	.word	0x9a957549	! t0_kref+0x32dc:   	orcc	%l5, -0xab7, %o5
	.word	0xef68a00c	! t0_kref+0x32e0:   	prefetch	%g2 + 0xc, 23
	.word	0xa5a00035	! t0_kref+0x32e4:   	fmovs	%f21, %f18
	.word	0xdc36c000	! t0_kref+0x32e8:   	sth	%sp, [%i3]
	.word	0x9567e1fc	! t0_kref+0x32ec:   	movvc	%icc, 0x1fc, %o2
	.word	0xef68a00a	! t0_kref+0x32f0:   	prefetch	%g2 + 0xa, 23
	.word	0x9efac01a	! t0_kref+0x32f4:   	sdivcc	%o3, %i2, %o7
	.word	0xe1be189a	! t0_kref+0x32f8:   	stda	%f16, [%i0 + %i2]0xc4
	.word	0xe608a029	! t0_kref+0x32fc:   	ldub	[%g2 + 0x29], %l3
	.word	0x2e480001	! t0_kref+0x3300:   	bvs,a,pt	%icc, _kref+0x3304
	.word	0xf11e6008	! t0_kref+0x3304:   	ldd	[%i1 + 8], %f24
	.word	0xe9380018	! t0_kref+0x3308:   	std	%f20, [%g0 + %i0]
	.word	0xd820a01c	! t0_kref+0x330c:   	st	%o4, [%g2 + 0x1c]
	.word	0x8185c000	! t0_kref+0x3310:   	wr	%l7, %g0, %y
	.word	0xac9dbb82	! t0_kref+0x3314:   	xorcc	%l6, -0x47e, %l6
	.word	0xb3b48dee	! t0_kref+0x3318:   	fnands	%f18, %f14, %f25
	.word	0x878020e0	! t0_kref+0x331c:   	mov	0xe0, %asi
	.word	0x9ba00134	! t0_kref+0x3320:   	fabss	%f20, %f13
	.word	0xd4263ff8	! t0_kref+0x3324:   	st	%o2, [%i0 - 8]
	.word	0xe1be185a	! t0_kref+0x3328:   	stda	%f16, [%i0 + %i2]0xc2
	.word	0xd500a020	! t0_kref+0x332c:   	ld	[%g2 + 0x20], %f10
	.word	0xa0c30015	! t0_kref+0x3330:   	addccc	%o4, %l5, %l0
	.word	0x15219d84	! t0_kref+0x3334:   	sethi	%hi(0x86761000), %o2
	.word	0x9db50a4a	! t0_kref+0x3338:   	fpadd32	%f20, %f10, %f14
	.word	0xadb68169	! t0_kref+0x333c:   	edge32ln	%i2, %o1, %l6
	.word	0xd620a038	! t0_kref+0x3340:   	st	%o3, [%g2 + 0x38]
	.word	0xa1b58240	! t0_kref+0x3344:   	array16	%l6, %g0, %l0
	.word	0xe7267ff4	! t0_kref+0x3348:   	st	%f19, [%i1 - 0xc]
	.word	0xf1180018	! t0_kref+0x334c:   	ldd	[%g0 + %i0], %f24
	.word	0x9a1338f9	! t0_kref+0x3350:   	or	%o4, -0x707, %o5
	.word	0x91a20950	! t0_kref+0x3354:   	fmuld	%f8, %f16, %f8
	.word	0xef064000	! t0_kref+0x3358:   	ld	[%i1], %f23
!	.word	0x25485b28	! t0_kref+0x335c:   	fblg,a,pt	%fcc0, SYM(t0_subr2)
	   	fblg,a,pt	%fcc0, SYM(t0_subr2)
	.word	0x9f414000	! t0_kref+0x3360:   	mov	%pc, %o7
	.word	0xa1a01913	! t0_kref+0x3364:   	fitod	%f19, %f16
	.word	0xa1a01a54	! t0_kref+0x3368:   	fdtoi	%f20, %f16
	.word	0xadb50e10	! t0_kref+0x336c:   	fand	%f20, %f16, %f22
	.word	0xd48e501a	! t0_kref+0x3370:   	lduba	[%i1 + %i2]0x80, %o2
	.word	0xa5a208d4	! t0_kref+0x3374:   	fsubd	%f8, %f20, %f18
	.word	0xa1a0102f	! t0_kref+0x3378:   	fstox	%f15, %f16
	.word	0xc568a040	! t0_kref+0x337c:   	prefetch	%g2 + 0x40, 2
	.word	0xc0386744	! t0_kref+0x3380:   	std	%g0, [%g1 + 0x744]
	.word	0x9a637ffd	! t0_kref+0x3384:   	subc	%o5, -0x3, %o5
	.word	0xacfaf5f3	! t0_kref+0x3388:   	sdivcc	%o3, -0xa0d, %l6
	.word	0xa1a40958	! t0_kref+0x338c:   	fmuld	%f16, %f24, %f16
	.word	0x94154014	! t0_kref+0x3390:   	or	%l5, %l4, %o2
	.word	0xea56401b	! t0_kref+0x3394:   	ldsh	[%i1 + %i3], %l5
	.word	0xec36001b	! t0_kref+0x3398:   	sth	%l6, [%i0 + %i3]
	.word	0x9436801b	! t0_kref+0x339c:   	orn	%i2, %i3, %o2
	.word	0x921ac016	! t0_kref+0x33a0:   	xor	%o3, %l6, %o1
	call	1f
	.empty
	.word	0xed6e001b	! t0_kref+0x33a8:   	prefetch	%i0 + %i3, 22
	.word	0xe3b8a040	! t0_kref+0x33ac:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xec180018	! t0_kref+0x33b0:   	ldd	[%g0 + %i0], %l6
1:	.word	0x81ae0ad2	! t0_kref+0x33b4:   	fcmped	%fcc0, %f24, %f18
	.word	0x81accab1	! t0_kref+0x33b8:   	fcmpes	%fcc0, %f19, %f17
	.word	0xac22f40b	! t0_kref+0x33bc:   	sub	%o3, -0xbf5, %l6
	.word	0xd5b81019	! t0_kref+0x33c0:   	stda	%f10, [%g0 + %i1]0x80
	.word	0xa1a44d2f	! t0_kref+0x33c4:   	fsmuld	%f17, %f15, %f16
	.word	0x8143e040	! t0_kref+0x33c8:   	membar	0x40
	.word	0x81ac8ad4	! t0_kref+0x33cc:   	fcmped	%fcc0, %f18, %f20
	.word	0xd920a024	! t0_kref+0x33d0:   	st	%f12, [%g2 + 0x24]
	.word	0xde480019	! t0_kref+0x33d4:   	ldsb	[%g0 + %i1], %o7
	.word	0xa68d7d52	! t0_kref+0x33d8:   	andcc	%l5, -0x2ae, %l3
	.word	0xb1a489ca	! t0_kref+0x33dc:   	fdivd	%f18, %f10, %f24
	.word	0x9096801b	! t0_kref+0x33e0:   	orcc	%i2, %i3, %o0
	.word	0x2e800008	! t0_kref+0x33e4:   	bvs,a	_kref+0x3404
	.word	0x909d0016	! t0_kref+0x33e8:   	xorcc	%l4, %l6, %o0
	.word	0x20800008	! t0_kref+0x33ec:   	bn,a	_kref+0x340c
	.word	0xd2500018	! t0_kref+0x33f0:   	ldsh	[%g0 + %i0], %o1
	.word	0xafb2c334	! t0_kref+0x33f4:   	bmask	%o3, %l4, %l7
	.word	0x81ad4a2e	! t0_kref+0x33f8:   	fcmps	%fcc0, %f21, %f14
	.word	0xa1a348b9	! t0_kref+0x33fc:   	fsubs	%f13, %f25, %f16
	.word	0xc807bfe8	! t0_kref+0x3400:   	ld	[%fp - 0x18], %g4
	.word	0x9a834016	! t0_kref+0x3404:   	addcc	%o5, %l6, %o5
	.word	0x95b48ab1	! t0_kref+0x3408:   	fpsub16s	%f18, %f17, %f10
	.word	0xeed81019	! t0_kref+0x340c:   	ldxa	[%g0 + %i1]0x80, %l7
	.word	0x9ba01a33	! t0_kref+0x3410:   	fstoi	%f19, %f13
	.word	0xda40a000	! t0_kref+0x3414:   	ldsw	[%g2], %o5
	.word	0xa62ea4b5	! t0_kref+0x3418:   	andn	%i2, 0x4b5, %l3
	.word	0xf76e001c	! t0_kref+0x341c:   	prefetch	%i0 + %i4, 27
	.word	0xa0f50009	! t0_kref+0x3420:   	udivcc	%l4, %o1, %l0
	.word	0xa4aa800d	! t0_kref+0x3424:   	andncc	%o2, %o5, %l2
	.word	0x9fa44830	! t0_kref+0x3428:   	fadds	%f17, %f16, %f15
	.word	0xec10a002	! t0_kref+0x342c:   	lduh	[%g2 + 2], %l6
	.word	0xe2480019	! t0_kref+0x3430:   	ldsb	[%g0 + %i1], %l1
	.word	0xa566e3d2	! t0_kref+0x3434:   	movge	%icc, 0x3d2, %l2
	.word	0xffee101d	! t0_kref+0x3438:   	prefetcha	%i0 + %i5, 31
	.word	0xd87e7fe8	! t0_kref+0x343c:   	swap	[%i1 - 0x18], %o4
	.word	0xd500a014	! t0_kref+0x3440:   	ld	[%g2 + 0x14], %f10
	.word	0xa5b00f38	! t0_kref+0x3444:   	fsrc2s	%f24, %f18
	.word	0xe7060000	! t0_kref+0x3448:   	ld	[%i0], %f19
	.word	0x30480001	! t0_kref+0x344c:   	ba,a,pt	%icc, _kref+0x3450
	.word	0x95122588	! t0_kref+0x3450:   	taddcctv	%o0, 0x588, %o2
	.word	0xa202a204	! t0_kref+0x3454:   	add	%o2, 0x204, %l1
	.word	0xec262000	! t0_kref+0x3458:   	st	%l6, [%i0]
	.word	0xd636001b	! t0_kref+0x345c:   	sth	%o3, [%i0 + %i3]
	.word	0xa9a0002d	! t0_kref+0x3460:   	fmovs	%f13, %f20
	.word	0xa3a01a50	! t0_kref+0x3464:   	fdtoi	%f16, %f17
	.word	0xd4267fe4	! t0_kref+0x3468:   	st	%o2, [%i1 - 0x1c]
	.word	0xe968a086	! t0_kref+0x346c:   	prefetch	%g2 + 0x86, 20
	.word	0xaba01a35	! t0_kref+0x3470:   	fstoi	%f21, %f21
	.word	0x95a28856	! t0_kref+0x3474:   	faddd	%f10, %f22, %f10
	.word	0xd6564000	! t0_kref+0x3478:   	ldsh	[%i1], %o3
	.word	0x9a9dfd47	! t0_kref+0x347c:   	xorcc	%l7, -0x2b9, %o5
	.word	0x8143c000	! t0_kref+0x3480:   	stbar
	.word	0xa5a4c9ac	! t0_kref+0x3484:   	fdivs	%f19, %f12, %f18
	.word	0x98dd001b	! t0_kref+0x3488:   	smulcc	%l4, %i3, %o4
	.word	0x22480006	! t0_kref+0x348c:   	be,a,pt	%icc, _kref+0x34a4
	.word	0xadb60c58	! t0_kref+0x3490:   	fnor	%f24, %f24, %f22
	.word	0x99b00cd6	! t0_kref+0x3494:   	fnot2	%f22, %f12
	.word	0xec1f4018	! t0_kref+0x3498:   	ldd	[%i5 + %i0], %l6
	.word	0xaa457a71	! t0_kref+0x349c:   	addc	%l5, -0x58f, %l5
	.word	0x9675653d	! t0_kref+0x34a0:   	udiv	%l5, 0x53d, %o3
	.word	0xddbe501d	! t0_kref+0x34a4:   	stda	%f14, [%i1 + %i5]0x80
	.word	0xe3264000	! t0_kref+0x34a8:   	st	%f17, [%i1]
	.word	0x91b5898c	! t0_kref+0x34ac:   	bshuffle	%f22, %f12, %f8
	.word	0xe408a033	! t0_kref+0x34b0:   	ldub	[%g2 + 0x33], %l2
	.word	0xaf25aae2	! t0_kref+0x34b4:   	mulscc	%l6, 0xae2, %l7
	.word	0xe836201c	! t0_kref+0x34b8:   	sth	%l4, [%i0 + 0x1c]
	.word	0xadb58488	! t0_kref+0x34bc:   	fcmple32	%f22, %f8, %l6
	.word	0x8143e040	! t0_kref+0x34c0:   	membar	0x40
	.word	0xd0965000	! t0_kref+0x34c4:   	lduha	[%i1]0x80, %o0
	.word	0x902a000c	! t0_kref+0x34c8:   	andn	%o0, %o4, %o0
	.word	0x9da34d36	! t0_kref+0x34cc:   	fsmuld	%f13, %f22, %f14
	.word	0xfdee501d	! t0_kref+0x34d0:   	prefetcha	%i1 + %i5, 30
	call	SYM(t0_subr3)
	.word	0xec4e2003	! t0_kref+0x34d8:   	ldsb	[%i0 + 3], %l6
	.word	0xa3b5817b	! t0_kref+0x34dc:   	edge32ln	%l6, %i3, %l1
	.word	0xa5b287d0	! t0_kref+0x34e0:   	pdist	%f10, %f16, %f18
	.word	0xeeee501a	! t0_kref+0x34e4:   	ldstuba	[%i1 + %i2]0x80, %l7
	.word	0xa3a01a58	! t0_kref+0x34e8:   	fdtoi	%f24, %f17
	.word	0xe51e6008	! t0_kref+0x34ec:   	ldd	[%i1 + 8], %f18
	.word	0xd500a01c	! t0_kref+0x34f0:   	ld	[%g2 + 0x1c], %f10
	.word	0xada0054e	! t0_kref+0x34f4:   	fsqrtd	%f14, %f22
	.word	0xee6e8018	! t0_kref+0x34f8:   	ldstub	[%i2 + %i0], %l7
	.word	0xea480018	! t0_kref+0x34fc:   	ldsb	[%g0 + %i0], %l5
	.word	0xacd02481	! t0_kref+0x3500:   	umulcc	%g0, 0x481, %l6
	.word	0x9a16b2b2	! t0_kref+0x3504:   	or	%i2, -0xd4e, %o5
	.word	0x36800004	! t0_kref+0x3508:   	bge,a	_kref+0x3518
	.word	0xa786e80a	! t0_kref+0x350c:   	wr	%i3, 0x80a, %gsr
	.word	0xea26600c	! t0_kref+0x3510:   	st	%l5, [%i1 + 0xc]
	.word	0xe76e001d	! t0_kref+0x3514:   	prefetch	%i0 + %i5, 19
	.word	0x99a00034	! t0_kref+0x3518:   	fmovs	%f20, %f12
	.word	0xed00a010	! t0_kref+0x351c:   	ld	[%g2 + 0x10], %f22
	.word	0x9da0012d	! t0_kref+0x3520:   	fabss	%f13, %f14
	.word	0xd6266000	! t0_kref+0x3524:   	st	%o3, [%i1]
	.word	0xda68001a	! t0_kref+0x3528:   	ldstub	[%g0 + %i2], %o5
	.word	0x2f800005	! t0_kref+0x352c:   	fbu,a	_kref+0x3540
	.word	0xe00e401a	! t0_kref+0x3530:   	ldub	[%i1 + %i2], %l0
	.word	0xa5a58831	! t0_kref+0x3534:   	fadds	%f22, %f17, %f18
	.word	0xc12f0005	! t0_kref+0x3538:   	st	%fsr, [%i4 + %g5]
	.word	0x9fa01a56	! t0_kref+0x353c:   	fdtoi	%f22, %f15
	.word	0xaad2800b	! t0_kref+0x3540:   	umulcc	%o2, %o3, %l5
	.word	0xacf5c00d	! t0_kref+0x3544:   	udivcc	%l7, %o5, %l6
	.word	0x908a6054	! t0_kref+0x3548:   	andcc	%o1, 0x54, %o0
	.word	0x91b00ce8	! t0_kref+0x354c:   	fnot2s	%f8, %f8
	.word	0x9da0052b	! t0_kref+0x3550:   	fsqrts	%f11, %f14
	.word	0xec56c018	! t0_kref+0x3554:   	ldsh	[%i3 + %i0], %l6
	.word	0xee50a00e	! t0_kref+0x3558:   	ldsh	[%g2 + 0xe], %l7
	.word	0xd1be1a5d	! t0_kref+0x355c:   	stda	%f8, [%i0 + %i5]0xd2
	.word	0xadb40a0c	! t0_kref+0x3560:   	fpadd16	%f16, %f12, %f22
	.word	0xe66e6005	! t0_kref+0x3564:   	ldstub	[%i1 + 5], %l3
	.word	0xd53e401d	! t0_kref+0x3568:   	std	%f10, [%i1 + %i5]
	.word	0x93b54e75	! t0_kref+0x356c:   	fxnors	%f21, %f21, %f9
	.word	0xa7a44828	! t0_kref+0x3570:   	fadds	%f17, %f8, %f19
	.word	0x9822400b	! t0_kref+0x3574:   	sub	%o1, %o3, %o4
	.word	0xada389b1	! t0_kref+0x3578:   	fdivs	%f14, %f17, %f22
	.word	0xd2c81018	! t0_kref+0x357c:   	ldsba	[%g0 + %i0]0x80, %o1
	.word	0xada0002d	! t0_kref+0x3580:   	fmovs	%f13, %f22
	.word	0x2a800008	! t0_kref+0x3584:   	bcs,a	_kref+0x35a4
	.word	0xa1b386f6	! t0_kref+0x3588:   	fmul8ulx16	%f14, %f22, %f16
	.word	0xe008a00e	! t0_kref+0x358c:   	ldub	[%g2 + 0xe], %l0
	.word	0xfbee101d	! t0_kref+0x3590:   	prefetcha	%i0 + %i5, 29
	.word	0x9fa01a28	! t0_kref+0x3594:   	fstoi	%f8, %f15
	.word	0x3c480007	! t0_kref+0x3598:   	bpos,a,pt	%icc, _kref+0x35b4
	.word	0x9ba01a52	! t0_kref+0x359c:   	fdtoi	%f18, %f13
	.word	0xa1a388b3	! t0_kref+0x35a0:   	fsubs	%f14, %f19, %f16
	.word	0xac96c00c	! t0_kref+0x35a4:   	orcc	%i3, %o4, %l6
	.word	0xaaaa800c	! t0_kref+0x35a8:   	andncc	%o2, %o4, %l5
	.word	0xa1a01930	! t0_kref+0x35ac:   	fstod	%f16, %f16
	.word	0x99a58834	! t0_kref+0x35b0:   	fadds	%f22, %f20, %f12
	.word	0xa1a0052a	! t0_kref+0x35b4:   	fsqrts	%f10, %f16
	.word	0x9fc00004	! t0_kref+0x35b8:   	call	%g0 + %g4
	.word	0xa0852741	! t0_kref+0x35bc:   	addcc	%l4, 0x741, %l0
	.word	0x92f2e5a4	! t0_kref+0x35c0:   	udivcc	%o3, 0x5a4, %o1
	.word	0xb1a2cd2f	! t0_kref+0x35c4:   	fsmuld	%f11, %f15, %f24
	.word	0x9e0b0008	! t0_kref+0x35c8:   	and	%o4, %o0, %o7
	.word	0x9e25c015	! t0_kref+0x35cc:   	sub	%l7, %l5, %o7
	.word	0xe608a025	! t0_kref+0x35d0:   	ldub	[%g2 + 0x25], %l3
	.word	0xed070019	! t0_kref+0x35d4:   	ld	[%i4 + %i1], %f22
	.word	0xa1b38e80	! t0_kref+0x35d8:   	fsrc1	%f14, %f16
	.word	0x9e2b0016	! t0_kref+0x35dc:   	andn	%o4, %l6, %o7
	.word	0xe76e401a	! t0_kref+0x35e0:   	prefetch	%i1 + %i2, 19
	.word	0x99b64673	! t0_kref+0x35e4:   	fmul8x16au	%f25, %f19, %f12
	.word	0xc96e0015	! t0_kref+0x35e8:   	prefetch	%i0 + %l5, 4
	.word	0xd0262000	! t0_kref+0x35ec:   	st	%o0, [%i0]
	.word	0xaba00035	! t0_kref+0x35f0:   	fmovs	%f21, %f21
	.word	0xb1b20990	! t0_kref+0x35f4:   	bshuffle	%f8, %f16, %f24
	.word	0xa1a01112	! t0_kref+0x35f8:   	fxtod	%f18, %f16
	.word	0xdd1f4019	! t0_kref+0x35fc:   	ldd	[%i5 + %i1], %f14
	.word	0xd428a000	! t0_kref+0x3600:   	stb	%o2, [%g2]
	.word	0xd1be5849	! t0_kref+0x3604:   	stda	%f8, [%i1 + %o1]0xc2
	.word	0xd9000018	! t0_kref+0x3608:   	ld	[%g0 + %i0], %f12
	.word	0xe3b8a040	! t0_kref+0x360c:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xa3100016	! t0_kref+0x3610:   	taddcctv	%g0, %l6, %l1
	.word	0xee40a020	! t0_kref+0x3614:   	ldsw	[%g2 + 0x20], %l7
	.word	0x9062800a	! t0_kref+0x3618:   	subc	%o2, %o2, %o0
	.word	0x983eb198	! t0_kref+0x361c:   	xnor	%i2, -0xe68, %o4
	.word	0xa4a6bd35	! t0_kref+0x3620:   	subcc	%i2, -0x2cb, %l2
	.word	0xa8bb2de2	! t0_kref+0x3624:   	xnorcc	%o4, 0xde2, %l4
	.word	0x20800004	! t0_kref+0x3628:   	bn,a	_kref+0x3638
	.word	0xa72b601f	! t0_kref+0x362c:   	sll	%o5, 0x1f, %l3
	.word	0xea563fee	! t0_kref+0x3630:   	ldsh	[%i0 - 0x12], %l5
	.word	0xe3b8a040	! t0_kref+0x3634:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x2c480008	! t0_kref+0x3638:   	bneg,a,pt	%icc, _kref+0x3658
	.word	0x90b28008	! t0_kref+0x363c:   	orncc	%o2, %o0, %o0
	.word	0xd25e0000	! t0_kref+0x3640:   	ldx	[%i0], %o1
	.word	0xe2000018	! t0_kref+0x3644:   	ld	[%g0 + %i0], %l1
	.word	0x90383fee	! t0_kref+0x3648:   	xnor	%g0, -0x12, %o0
	.word	0xa9a00034	! t0_kref+0x364c:   	fmovs	%f20, %f20
	.word	0x9ba24838	! t0_kref+0x3650:   	fadds	%f9, %f24, %f13
	.word	0xde8e1000	! t0_kref+0x3654:   	lduba	[%i0]0x80, %o7
	.word	0x9126b2fa	! t0_kref+0x3658:   	mulscc	%i2, -0xd06, %o0
	.word	0x92bd0016	! t0_kref+0x365c:   	xnorcc	%l4, %l6, %o1
	.word	0xde000019	! t0_kref+0x3660:   	ld	[%g0 + %i1], %o7
	.word	0xabb28280	! t0_kref+0x3664:   	array32	%o2, %g0, %l5
	.word	0x91a28950	! t0_kref+0x3668:   	fmuld	%f10, %f16, %f8
	.word	0xd456201c	! t0_kref+0x366c:   	ldsh	[%i0 + 0x1c], %o2
	.word	0x9212f8ac	! t0_kref+0x3670:   	or	%o3, -0x754, %o1
	.word	0xe88e1000	! t0_kref+0x3674:   	lduba	[%i0]0x80, %l4
	.word	0x22800005	! t0_kref+0x3678:   	be,a	_kref+0x368c
	.word	0x99a60837	! t0_kref+0x367c:   	fadds	%f24, %f23, %f12
	.word	0x93a01a52	! t0_kref+0x3680:   	fdtoi	%f18, %f9
	.word	0x91b4c669	! t0_kref+0x3684:   	fmul8x16au	%f19, %f9, %f8
	.word	0xd6562008	! t0_kref+0x3688:   	ldsh	[%i0 + 8], %o3
	.word	0xe81e401d	! t0_kref+0x368c:   	ldd	[%i1 + %i5], %l4
	.word	0xada0002e	! t0_kref+0x3690:   	fmovs	%f14, %f22
	.word	0xb1a01a31	! t0_kref+0x3694:   	fstoi	%f17, %f24
	.word	0x9f414000	! t0_kref+0x3698:   	mov	%pc, %o7
!	.word	0x36485a58	! t0_kref+0x369c:   	bge,a,pt	%icc, SYM(t0_subr2)
	   	bge,a,pt	%icc, SYM(t0_subr2)
	.word	0x989a8016	! t0_kref+0x36a0:   	xorcc	%o2, %l6, %o4
	.word	0x98c367fe	! t0_kref+0x36a4:   	addccc	%o5, 0x7fe, %o4
	.word	0xb1a01a4e	! t0_kref+0x36a8:   	fdtoi	%f14, %f24
	.word	0x9de3bfa0	! t0_kref+0x36ac:   	save	%sp, -0x60, %sp
	.word	0xb6502fc3	! t0_kref+0x36b0:   	umul	%g0, 0xfc3, %i3
	.word	0x95ee22b8	! t0_kref+0x36b4:   	restore	%i0, 0x2b8, %o2
	.word	0x81aa0ac8	! t0_kref+0x36b8:   	fcmped	%fcc0, %f8, %f8
	.word	0xd620a018	! t0_kref+0x36bc:   	st	%o3, [%g2 + 0x18]
	.word	0xa3a01a48	! t0_kref+0x36c0:   	fdtoi	%f8, %f17
	.word	0xa9a2084a	! t0_kref+0x36c4:   	faddd	%f8, %f10, %f20
	.word	0xef68a081	! t0_kref+0x36c8:   	prefetch	%g2 + 0x81, 23
	.word	0xe8163fe4	! t0_kref+0x36cc:   	lduh	[%i0 - 0x1c], %l4
	.word	0xadb40e48	! t0_kref+0x36d0:   	fxnor	%f16, %f8, %f22
	.word	0x9db38ab6	! t0_kref+0x36d4:   	fpsub16s	%f14, %f22, %f14
	.word	0xa9b60558	! t0_kref+0x36d8:   	fcmpeq16	%f24, %f24, %l4
	.word	0x99b48c74	! t0_kref+0x36dc:   	fnors	%f18, %f20, %f12
	.word	0x2d800002	! t0_kref+0x36e0:   	fbg,a	_kref+0x36e8
	.word	0x9bb34db5	! t0_kref+0x36e4:   	fxors	%f13, %f21, %f13
	.word	0xe3b8a040	! t0_kref+0x36e8:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x91b64cb9	! t0_kref+0x36ec:   	fandnot2s	%f25, %f25, %f8
	.word	0xf126401c	! t0_kref+0x36f0:   	st	%f24, [%i1 + %i4]
	.word	0x172d4a60	! t0_kref+0x36f4:   	sethi	%hi(0xb5298000), %o3
	.word	0xaba5c833	! t0_kref+0x36f8:   	fadds	%f23, %f19, %f21
	.word	0xea16001b	! t0_kref+0x36fc:   	lduh	[%i0 + %i3], %l5
	.word	0x3d800003	! t0_kref+0x3700:   	fbule,a	_kref+0x370c
	.word	0xaead226f	! t0_kref+0x3704:   	andncc	%l4, 0x26f, %l7
	.word	0xa9a2c82b	! t0_kref+0x3708:   	fadds	%f11, %f11, %f20
	.word	0xa1b3016c	! t0_kref+0x370c:   	edge32ln	%o4, %o4, %l0
	.word	0xe078a024	! t0_kref+0x3710:   	swap	[%g2 + 0x24], %l0
	.word	0x91a0188a	! t0_kref+0x3714:   	fitos	%f10, %f8
	.word	0xa5a01a48	! t0_kref+0x3718:   	fdtoi	%f8, %f18
	.word	0x30800005	! t0_kref+0x371c:   	ba,a	_kref+0x3730
	.word	0x972b2019	! t0_kref+0x3720:   	sll	%o4, 0x19, %o3
	.word	0xb1aa0056	! t0_kref+0x3724:   	fmovda	%fcc0, %f22, %f24
	.word	0x37800003	! t0_kref+0x3728:   	fbge,a	_kref+0x3734
	.word	0xaab37801	! t0_kref+0x372c:   	orncc	%o5, -0x7ff, %l5
	.word	0xa7b58496	! t0_kref+0x3730:   	fcmple32	%f22, %f22, %l3
	.word	0x9216ebbe	! t0_kref+0x3734:   	or	%i3, 0xbbe, %o1
	.word	0x98268000	! t0_kref+0x3738:   	sub	%i2, %g0, %o4
	.word	0x878020d0	! t0_kref+0x373c:   	mov	0xd0, %asi
	.word	0x902eb1a9	! t0_kref+0x3740:   	andn	%i2, -0xe57, %o0
	.word	0x9fc00004	! t0_kref+0x3744:   	call	%g0 + %g4
	.word	0xe968a048	! t0_kref+0x3748:   	prefetch	%g2 + 0x48, 20
	.word	0x9da018d4	! t0_kref+0x374c:   	fdtos	%f20, %f14
	.word	0x9bb38ef3	! t0_kref+0x3750:   	fornot2s	%f14, %f19, %f13
	.word	0xee2e401a	! t0_kref+0x3754:   	stb	%l7, [%i1 + %i2]
	.word	0x9bb58db4	! t0_kref+0x3758:   	fxors	%f22, %f20, %f13
	.word	0x94b3400c	! t0_kref+0x375c:   	orncc	%o5, %o4, %o2
	.word	0xacddf36b	! t0_kref+0x3760:   	smulcc	%l7, -0xc95, %l6
	.word	0xa1250009	! t0_kref+0x3764:   	mulscc	%l4, %o1, %l0
	.word	0xe1be1a5b	! t0_kref+0x3768:   	stda	%f16, [%i0 + %i3]0xd2
	.word	0xafa01a4e	! t0_kref+0x376c:   	fdtoi	%f14, %f23
	.word	0x9bb20240	! t0_kref+0x3770:   	array16	%o0, %g0, %o5
	.word	0xe66e2006	! t0_kref+0x3774:   	ldstub	[%i0 + 6], %l3
	.word	0xe6fe1000	! t0_kref+0x3778:   	swapa	[%i0]0x80, %l3
	.word	0xc56e6018	! t0_kref+0x377c:   	prefetch	%i1 + 0x18, 2
	.word	0xae15fb3f	! t0_kref+0x3780:   	or	%l7, -0x4c1, %l7
	.word	0x9da3cd2a	! t0_kref+0x3784:   	fsmuld	%f15, %f10, %f14
	.word	0xd40e8018	! t0_kref+0x3788:   	ldub	[%i2 + %i0], %o2
	.word	0xa1a0052f	! t0_kref+0x378c:   	fsqrts	%f15, %f16
	.word	0xc36e6008	! t0_kref+0x3790:   	prefetch	%i1 + 8, 1
	.word	0xa73a0000	! t0_kref+0x3794:   	sra	%o0, %g0, %l3
	.word	0xa9b40ad4	! t0_kref+0x3798:   	fpsub32	%f16, %f20, %f20
	.word	0x86102021	! t0_kref+0x379c:   	mov	0x21, %g3
	.word	0x86a0e001	! t0_kref+0x37a0:   	subcc	%g3, 1, %g3
	.word	0x2280001a	! t0_kref+0x37a4:   	be,a	_kref+0x380c
	.word	0xff270000	! t0_kref+0x37a8:   	st	%f31, [%i4]
	.word	0xa9a01a2e	! t0_kref+0x37ac:   	fstoi	%f14, %f20
	.word	0xf56e401b	! t0_kref+0x37b0:   	prefetch	%i1 + %i3, 26
	.word	0x91a00537	! t0_kref+0x37b4:   	fsqrts	%f23, %f8
	.word	0xadb2401a	! t0_kref+0x37b8:   	edge8	%o1, %i2, %l6
	.word	0x1331004a	! t0_kref+0x37bc:   	sethi	%hi(0xc4012800), %o1
	.word	0xd900a034	! t0_kref+0x37c0:   	ld	[%g2 + 0x34], %f12
	.word	0xa262800b	! t0_kref+0x37c4:   	subc	%o2, %o3, %l1
	.word	0xa9a00139	! t0_kref+0x37c8:   	fabss	%f25, %f20
	.word	0xa00b714d	! t0_kref+0x37cc:   	and	%o5, -0xeb3, %l0
	.word	0x21480004	! t0_kref+0x37d0:   	fbn,a,pt	%fcc0, _kref+0x37e0
	.word	0xa9a01937	! t0_kref+0x37d4:   	fstod	%f23, %f20
	.word	0x99408000	! t0_kref+0x37d8:   	mov	%ccr, %o4
	.word	0xd6de501d	! t0_kref+0x37dc:   	ldxa	[%i1 + %i5]0x80, %o3
	.word	0x81aa0aaf	! t0_kref+0x37e0:   	fcmpes	%fcc0, %f8, %f15
	.word	0x1b123e24	! t0_kref+0x37e4:   	sethi	%hi(0x48f89000), %o5
	.word	0x988df57a	! t0_kref+0x37e8:   	andcc	%l7, -0xa86, %o4
	.word	0xe24e0000	! t0_kref+0x37ec:   	ldsb	[%i0], %l1
	.word	0xee267ff8	! t0_kref+0x37f0:   	st	%l7, [%i1 - 8]
	.word	0xe91f4019	! t0_kref+0x37f4:   	ldd	[%i5 + %i1], %f20
	.word	0x92b2000d	! t0_kref+0x37f8:   	orncc	%o0, %o5, %o1
	.word	0xd86e3fee	! t0_kref+0x37fc:   	ldstub	[%i0 - 0x12], %o4
	.word	0xde4e601b	! t0_kref+0x3800:   	ldsb	[%i1 + 0x1b], %o7
	.word	0xac200009	! t0_kref+0x3804:   	neg	%o1, %l6
	.word	0x90fb62d6	! t0_kref+0x3808:   	sdivcc	%o5, 0x2d6, %o0
	.word	0xac08001b	! t0_kref+0x380c:   	and	%g0, %i3, %l6
	.word	0x9da508b2	! t0_kref+0x3810:   	fsubs	%f20, %f18, %f14
	.word	0xa9b60408	! t0_kref+0x3814:   	fcmple16	%f24, %f8, %l4
	.word	0xe8180019	! t0_kref+0x3818:   	ldd	[%g0 + %i1], %l4
	.word	0xee263fe4	! t0_kref+0x381c:   	st	%l7, [%i0 - 0x1c]
	.word	0xb1b20d0c	! t0_kref+0x3820:   	fandnot1	%f8, %f12, %f24
	.word	0xaba01a50	! t0_kref+0x3824:   	fdtoi	%f16, %f21
	.word	0xd9f65009	! t0_kref+0x3828:   	casxa	[%i1]0x80, %o1, %o4
	.word	0xe11f4019	! t0_kref+0x382c:   	ldd	[%i5 + %i1], %f16
	.word	0xa08d0014	! t0_kref+0x3830:   	andcc	%l4, %l4, %l0
	.word	0x34480005	! t0_kref+0x3834:   	bg,a,pt	%icc, _kref+0x3848
	.word	0xaa720015	! t0_kref+0x3838:   	udiv	%o0, %l5, %l5
	.word	0xd27f0019	! t0_kref+0x383c:   	swap	[%i4 + %i1], %o1
	.word	0xd6363fec	! t0_kref+0x3840:   	sth	%o3, [%i0 - 0x14]
	.word	0x9ba018d6	! t0_kref+0x3844:   	fdtos	%f22, %f13
	.word	0x86102003	! t0_kref+0x3848:   	mov	0x3, %g3
	.word	0x86a0e001	! t0_kref+0x384c:   	subcc	%g3, 1, %g3
	.word	0x22800014	! t0_kref+0x3850:   	be,a	_kref+0x38a0
	.word	0xf9ee101b	! t0_kref+0x3854:   	prefetcha	%i0 + %i3, 28
	.word	0xeafe5000	! t0_kref+0x3858:   	swapa	[%i1]0x80, %l5
	.word	0xada01931	! t0_kref+0x385c:   	fstod	%f17, %f22
	.word	0x93a01890	! t0_kref+0x3860:   	fitos	%f16, %f9
	.word	0xa12ee011	! t0_kref+0x3864:   	sll	%i3, 0x11, %l0
	.word	0x9fb68340	! t0_kref+0x3868:   	alignaddrl	%i2, %g0, %o7
	.word	0x94d278de	! t0_kref+0x386c:   	umulcc	%o1, -0x722, %o2
	.word	0x81828000	! t0_kref+0x3870:   	wr	%o2, %g0, %y
	.word	0xa7b64af0	! t0_kref+0x3874:   	fpsub32s	%f25, %f16, %f19
	.word	0xec2e3fe6	! t0_kref+0x3878:   	stb	%l6, [%i0 - 0x1a]
!	.word	0x334859e0	! t0_kref+0x387c:   	fbe,a,pt	%fcc0, SYM(t0_subr2)
	   	fbe,a,pt	%fcc0, SYM(t0_subr2)
	.word	0x9f414000	! t0_kref+0x3880:   	mov	%pc, %o7
	.word	0x9da0054a	! t0_kref+0x3884:   	fsqrtd	%f10, %f14
	.word	0xa7b5c308	! t0_kref+0x3888:   	alignaddr	%l7, %o0, %l3
	.word	0xa1a28832	! t0_kref+0x388c:   	fadds	%f10, %f18, %f16
	.word	0xc568a082	! t0_kref+0x3890:   	prefetch	%g2 + 0x82, 2
	.word	0xd900a02c	! t0_kref+0x3894:   	ld	[%g2 + 0x2c], %f12
	.word	0xd46e001a	! t0_kref+0x3898:   	ldstub	[%i0 + %i2], %o2
	.word	0xd5861000	! t0_kref+0x389c:   	lda	[%i0]0x80, %f10
	.word	0xb1a00554	! t0_kref+0x38a0:   	fsqrtd	%f20, %f24
	.word	0x9da000b2	! t0_kref+0x38a4:   	fnegs	%f18, %f14
	.word	0xd010a016	! t0_kref+0x38a8:   	lduh	[%g2 + 0x16], %o0
	.word	0xe24e8019	! t0_kref+0x38ac:   	ldsb	[%i2 + %i1], %l1
	.word	0xb3a01a2d	! t0_kref+0x38b0:   	fstoi	%f13, %f25
	.word	0xdb060000	! t0_kref+0x38b4:   	ld	[%i0], %f13
	.word	0xabb300aa	! t0_kref+0x38b8:   	edge16n	%o4, %o2, %l5
	.word	0x95a01a50	! t0_kref+0x38bc:   	fdtoi	%f16, %f10
	.word	0xa7a01a28	! t0_kref+0x38c0:   	fstoi	%f8, %f19
	.word	0x2301bbb8	! t0_kref+0x38c4:   	sethi	%hi(0x6eee000), %l1
	.word	0xeb200018	! t0_kref+0x38c8:   	st	%f21, [%g0 + %i0]
	.word	0xab220014	! t0_kref+0x38cc:   	mulscc	%o0, %l4, %l5
	.word	0xe608a016	! t0_kref+0x38d0:   	ldub	[%g2 + 0x16], %l3
	.word	0xa4aabde2	! t0_kref+0x38d4:   	andncc	%o2, -0x21e, %l2
	.word	0x20480005	! t0_kref+0x38d8:   	bn,a,pt	%icc, _kref+0x38ec
	.word	0xa9ab4058	! t0_kref+0x38dc:   	fmovdle	%fcc0, %f24, %f20
	.word	0xaa0a800c	! t0_kref+0x38e0:   	and	%o2, %o4, %l5
	.word	0xada0004c	! t0_kref+0x38e4:   	fmovd	%f12, %f22
	.word	0xafb2817a	! t0_kref+0x38e8:   	edge32ln	%o2, %i2, %l7
	.word	0x99b20ad8	! t0_kref+0x38ec:   	fpsub32	%f8, %f24, %f12
	.word	0xb1a00531	! t0_kref+0x38f0:   	fsqrts	%f17, %f24
	.word	0xe1263fe8	! t0_kref+0x38f4:   	st	%f16, [%i0 - 0x18]
	.word	0x9da00028	! t0_kref+0x38f8:   	fmovs	%f8, %f14
	.word	0x91b284d0	! t0_kref+0x38fc:   	fcmpne32	%f10, %f16, %o0
	.word	0xa1a64830	! t0_kref+0x3900:   	fadds	%f25, %f16, %f16
	.word	0x9223000b	! t0_kref+0x3904:   	sub	%o4, %o3, %o1
	.word	0xe3263ff4	! t0_kref+0x3908:   	st	%f17, [%i0 - 0xc]
	.word	0x9ba60833	! t0_kref+0x390c:   	fadds	%f24, %f19, %f13
	.word	0xa9b60ded	! t0_kref+0x3910:   	fnands	%f24, %f13, %f20
	.word	0xde08a024	! t0_kref+0x3914:   	ldub	[%g2 + 0x24], %o7
	.word	0xa7a01895	! t0_kref+0x3918:   	fitos	%f21, %f19
	.word	0x30480008	! t0_kref+0x391c:   	ba,a,pt	%icc, _kref+0x393c
	.word	0xacad400c	! t0_kref+0x3920:   	andncc	%l5, %o4, %l6
	.word	0x99a30850	! t0_kref+0x3924:   	faddd	%f12, %f16, %f12
	.word	0x9efab8ac	! t0_kref+0x3928:   	sdivcc	%o2, -0x754, %o7
	.word	0xa83ef67e	! t0_kref+0x392c:   	xnor	%i3, -0x982, %l4
	.word	0xc76e3ff0	! t0_kref+0x3930:   	prefetch	%i0 - 0x10, 3
	.word	0xaba6082c	! t0_kref+0x3934:   	fadds	%f24, %f12, %f21
	.word	0xa3a6082d	! t0_kref+0x3938:   	fadds	%f24, %f13, %f17
	.word	0x30800004	! t0_kref+0x393c:   	ba,a	_kref+0x394c
	.word	0x95a5482f	! t0_kref+0x3940:   	fadds	%f21, %f15, %f10
	.word	0xa5b58a4a	! t0_kref+0x3944:   	fpadd32	%f22, %f10, %f18
	.word	0x9f2d8015	! t0_kref+0x3948:   	sll	%l6, %l5, %o7
	.word	0x9da208ce	! t0_kref+0x394c:   	fsubd	%f8, %f14, %f14
	.word	0x95a01928	! t0_kref+0x3950:   	fstod	%f8, %f10
	.word	0x81ab8ad0	! t0_kref+0x3954:   	fcmped	%fcc0, %f14, %f16
	.word	0x36800007	! t0_kref+0x3958:   	bge,a	_kref+0x3974
	.word	0xae3aab51	! t0_kref+0x395c:   	xnor	%o2, 0xb51, %l7
	.word	0x9512c009	! t0_kref+0x3960:   	taddcctv	%o3, %o1, %o2
	.word	0xe8d6d018	! t0_kref+0x3964:   	ldsha	[%i3 + %i0]0x80, %l4
	.word	0xe4067fec	! t0_kref+0x3968:   	ld	[%i1 - 0x14], %l2
	.word	0xc568a04a	! t0_kref+0x396c:   	prefetch	%g2 + 0x4a, 2
	.word	0xe2df5018	! t0_kref+0x3970:   	ldxa	[%i5 + %i0]0x80, %l1
	.word	0xd048a021	! t0_kref+0x3974:   	ldsb	[%g2 + 0x21], %o0
	.word	0x94968000	! t0_kref+0x3978:   	orcc	%i2, %g0, %o2
	.word	0xa3b0076a	! t0_kref+0x397c:   	fpack16	%f10, %f17
	.word	0xa812a5ff	! t0_kref+0x3980:   	or	%o2, 0x5ff, %l4
	.word	0x21279e5b	! t0_kref+0x3984:   	sethi	%hi(0x9e796c00), %l0
	.word	0x9a0ac016	! t0_kref+0x3988:   	and	%o3, %l6, %o5
	.word	0xe24e8018	! t0_kref+0x398c:   	ldsb	[%i2 + %i0], %l1
	.word	0xa3700014	! t0_kref+0x3990:   	popc	%l4, %l1
	.word	0xe006001c	! t0_kref+0x3994:   	ld	[%i0 + %i4], %l0
	.word	0x97b4048a	! t0_kref+0x3998:   	fcmple32	%f16, %f10, %o3
	.word	0xe8263ffc	! t0_kref+0x399c:   	st	%l4, [%i0 - 4]
	.word	0x29800002	! t0_kref+0x39a0:   	fbl,a	_kref+0x39a8
	.word	0xb1a389d2	! t0_kref+0x39a4:   	fdivd	%f14, %f18, %f24
	.word	0xaf650015	! t0_kref+0x39a8:   	movleu	%icc, %l5, %l7
	.word	0xa92522af	! t0_kref+0x39ac:   	mulscc	%l4, 0x2af, %l4
	.word	0x81aa8a56	! t0_kref+0x39b0:   	fcmpd	%fcc0, %f10, %f22
	.word	0xec50a026	! t0_kref+0x39b4:   	ldsh	[%g2 + 0x26], %l6
	.word	0xa5a00131	! t0_kref+0x39b8:   	fabss	%f17, %f18
	.word	0xc96e6010	! t0_kref+0x39bc:   	prefetch	%i1 + 0x10, 4
	.word	0xe59e1000	! t0_kref+0x39c0:   	ldda	[%i0]0x80, %f18
	.word	0x9085c00a	! t0_kref+0x39c4:   	addcc	%l7, %o2, %o0
	.word	0xa4f5401b	! t0_kref+0x39c8:   	udivcc	%l5, %i3, %l2
	.word	0x9de3bfa0	! t0_kref+0x39cc:   	save	%sp, -0x60, %sp
	.word	0xb2df4000	! t0_kref+0x39d0:   	smulcc	%i5, %g0, %i1
	.word	0xa3ef7c09	! t0_kref+0x39d4:   	restore	%i5, -0x3f7, %l1
	.word	0xe8801019	! t0_kref+0x39d8:   	lda	[%g0 + %i1]0x80, %l4
	.word	0x28800003	! t0_kref+0x39dc:   	bleu,a	_kref+0x39e8
	.word	0x99b5cc76	! t0_kref+0x39e0:   	fnors	%f23, %f22, %f12
	.word	0xd816c019	! t0_kref+0x39e4:   	lduh	[%i3 + %i1], %o4
	.word	0xa1b3074a	! t0_kref+0x39e8:   	fpack32	%f12, %f10, %f16
	.word	0x20480006	! t0_kref+0x39ec:   	bn,a,pt	%icc, _kref+0x3a04
	.word	0x93a2482c	! t0_kref+0x39f0:   	fadds	%f9, %f12, %f9
	.word	0x97b44f76	! t0_kref+0x39f4:   	fornot1s	%f17, %f22, %f11
	.word	0xadb38d12	! t0_kref+0x39f8:   	fandnot1	%f14, %f18, %f22
	.word	0xe51fbea0	! t0_kref+0x39fc:   	ldd	[%fp - 0x160], %f18
	.word	0x3c800004	! t0_kref+0x3a00:   	bpos,a	_kref+0x3a10
	.word	0x9a2efe4f	! t0_kref+0x3a04:   	andn	%i3, -0x1b1, %o5
	.word	0x8143c000	! t0_kref+0x3a08:   	stbar
	.word	0xd66e001a	! t0_kref+0x3a0c:   	ldstub	[%i0 + %i2], %o3
	.word	0xa4258015	! t0_kref+0x3a10:   	sub	%l6, %l5, %l2
	.word	0x9870001b	! t0_kref+0x3a14:   	udiv	%g0, %i3, %o4
	.word	0xada0192d	! t0_kref+0x3a18:   	fstod	%f13, %f22
	.word	0xed68a080	! t0_kref+0x3a1c:   	prefetch	%g2 + 0x80, 22
	.word	0x95b2810d	! t0_kref+0x3a20:   	edge32	%o2, %o5, %o2
	.word	0xf436200a	! t0_kref+0x3a24:   	sth	%i2, [%i0 + 0xa]
	.word	0x81ad4ab9	! t0_kref+0x3a28:   	fcmpes	%fcc0, %f21, %f25
	.word	0xafb2400a	! t0_kref+0x3a2c:   	edge8	%o1, %o2, %l7
	.word	0x93b68240	! t0_kref+0x3a30:   	array16	%i2, %g0, %o1
	.word	0xa3a0012c	! t0_kref+0x3a34:   	fabss	%f12, %f17
	.word	0xada388b6	! t0_kref+0x3a38:   	fsubs	%f14, %f22, %f22
	.word	0x30480007	! t0_kref+0x3a3c:   	ba,a,pt	%icc, _kref+0x3a58
	.word	0x99a00558	! t0_kref+0x3a40:   	fsqrtd	%f24, %f12
	.word	0xac08000b	! t0_kref+0x3a44:   	and	%g0, %o3, %l6
	.word	0xaa9b61e5	! t0_kref+0x3a48:   	xorcc	%o5, 0x1e5, %l5
	.word	0xda48a00d	! t0_kref+0x3a4c:   	ldsb	[%g2 + 0xd], %o5
	.word	0xeb00a034	! t0_kref+0x3a50:   	ld	[%g2 + 0x34], %f21
	.word	0xf83f4018	! t0_kref+0x3a54:   	std	%i4, [%i5 + %i0]
	.word	0xc768a000	! t0_kref+0x3a58:   	prefetch	%g2, 3
	.word	0x989825ca	! t0_kref+0x3a5c:   	xorcc	%g0, 0x5ca, %o4
	.word	0x2e800004	! t0_kref+0x3a60:   	bvs,a	_kref+0x3a70
	.word	0xd456c018	! t0_kref+0x3a64:   	ldsh	[%i3 + %i0], %o2
	.word	0x34480005	! t0_kref+0x3a68:   	bg,a,pt	%icc, _kref+0x3a7c
	.word	0xa5a00558	! t0_kref+0x3a6c:   	fsqrtd	%f24, %f18
	.word	0xee266010	! t0_kref+0x3a70:   	st	%l7, [%i1 + 0x10]
	.word	0xa03b7999	! t0_kref+0x3a74:   	xnor	%o5, -0x667, %l0
	.word	0x81b01027	! t0_kref+0x3a78:   	siam	0x7
	.word	0xd3263ff0	! t0_kref+0x3a7c:   	st	%f9, [%i0 - 0x10]
	.word	0x878020f0	! t0_kref+0x3a80:   	mov	0xf0, %asi
	.word	0x001fffff	! t0_kref+0x3a84:   	illtrap	0x1fffff
	.word	0x9a082267	! t0_kref+0x3a88:   	and	%g0, 0x267, %o5
	.word	0xc568a00f	! t0_kref+0x3a8c:   	prefetch	%g2 + 0xf, 2
	.word	0xafb48c77	! t0_kref+0x3a90:   	fnors	%f18, %f23, %f23
	.word	0xeb68a08e	! t0_kref+0x3a94:   	prefetch	%g2 + 0x8e, 21
	.word	0x3a800008	! t0_kref+0x3a98:   	bcc,a	_kref+0x3ab8
	.word	0x95b50ded	! t0_kref+0x3a9c:   	fnands	%f20, %f13, %f10
	.word	0xdb270018	! t0_kref+0x3aa0:   	st	%f13, [%i4 + %i0]
	.word	0x99b3054e	! t0_kref+0x3aa4:   	fcmpeq16	%f12, %f14, %o4
	.word	0x963b000a	! t0_kref+0x3aa8:   	xnor	%o4, %o2, %o3
	.word	0xdf801018	! t0_kref+0x3aac:   	lda	[%g0 + %i0]0x80, %f15
	.word	0x99a01930	! t0_kref+0x3ab0:   	fstod	%f16, %f12
	.word	0xe3b8a040	! t0_kref+0x3ab4:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x9fa01a28	! t0_kref+0x3ab8:   	fstoi	%f8, %f15
	.word	0x38480001	! t0_kref+0x3abc:   	bgu,a,pt	%icc, _kref+0x3ac0
	.word	0xa1a58948	! t0_kref+0x3ac0:   	fmuld	%f22, %f8, %f16
	.word	0x8143e040	! t0_kref+0x3ac4:   	membar	0x40
	.word	0x93a3482a	! t0_kref+0x3ac8:   	fadds	%f13, %f10, %f9
	.word	0xa1a0192f	! t0_kref+0x3acc:   	fstod	%f15, %f16
	.word	0xd4f65000	! t0_kref+0x3ad0:   	stxa	%o2, [%i1]0x80
	.word	0x33800006	! t0_kref+0x3ad4:   	fbe,a	_kref+0x3aec
	.word	0xacddc00d	! t0_kref+0x3ad8:   	smulcc	%l7, %o5, %l6
	.word	0x36480001	! t0_kref+0x3adc:   	bge,a,pt	%icc, _kref+0x3ae0
	.word	0xac3ee7d3	! t0_kref+0x3ae0:   	xnor	%i3, 0x7d3, %l6
	.word	0xde56601e	! t0_kref+0x3ae4:   	ldsh	[%i1 + 0x1e], %o7
	.word	0x8143c000	! t0_kref+0x3ae8:   	stbar
	.word	0xee070018	! t0_kref+0x3aec:   	ld	[%i4 + %i0], %l7
	.word	0x37800008	! t0_kref+0x3af0:   	fbge,a	_kref+0x3b10
	.word	0xee20a00c	! t0_kref+0x3af4:   	st	%l7, [%g2 + 0xc]
	.word	0xa2fee083	! t0_kref+0x3af8:   	sdivcc	%i3, 0x83, %l1
	.word	0x95b404ca	! t0_kref+0x3afc:   	fcmpne32	%f16, %f10, %o2
	.word	0xaba01889	! t0_kref+0x3b00:   	fitos	%f9, %f21
	.word	0x81ad8aad	! t0_kref+0x3b04:   	fcmpes	%fcc0, %f22, %f13
	.word	0xe93e001d	! t0_kref+0x3b08:   	std	%f20, [%i0 + %i5]
	.word	0x91b34280	! t0_kref+0x3b0c:   	array32	%o5, %g0, %o0
	.word	0x39800001	! t0_kref+0x3b10:   	fbuge,a	_kref+0x3b14
	.word	0xafb34eea	! t0_kref+0x3b14:   	fornot2s	%f13, %f10, %f23
	.word	0xafb3415a	! t0_kref+0x3b18:   	edge32l	%o5, %i2, %l7
	.word	0x97a01a2b	! t0_kref+0x3b1c:   	fstoi	%f11, %f11
	.word	0xd8367fe6	! t0_kref+0x3b20:   	sth	%o4, [%i1 - 0x1a]
	.word	0x99b48c52	! t0_kref+0x3b24:   	fnor	%f18, %f18, %f12
	.word	0xe9380018	! t0_kref+0x3b28:   	std	%f20, [%g0 + %i0]
	.word	0x2f124fb1	! t0_kref+0x3b2c:   	sethi	%hi(0x493ec400), %l7
	.word	0x2a800005	! t0_kref+0x3b30:   	bcs,a	_kref+0x3b44
	.word	0xa9a0192f	! t0_kref+0x3b34:   	fstod	%f15, %f20
	.word	0x32480007	! t0_kref+0x3b38:   	bne,a,pt	%icc, _kref+0x3b54
	.word	0xe240a018	! t0_kref+0x3b3c:   	ldsw	[%g2 + 0x18], %l1
	.word	0x81aa8aac	! t0_kref+0x3b40:   	fcmpes	%fcc0, %f10, %f12
	.word	0xa6b2ae75	! t0_kref+0x3b44:   	orncc	%o2, 0xe75, %l3
	.word	0x81ac8a37	! t0_kref+0x3b48:   	fcmps	%fcc0, %f18, %f23
	.word	0x909dba91	! t0_kref+0x3b4c:   	xorcc	%l6, -0x56f, %o0
	.word	0x9fc10000	! t0_kref+0x3b50:   	call	%g4
	.word	0x93b34a75	! t0_kref+0x3b54:   	fpadd32s	%f13, %f21, %f9
	.word	0x93a00129	! t0_kref+0x3b58:   	fabss	%f9, %f9
	.word	0xacc00016	! t0_kref+0x3b5c:   	addccc	%g0, %l6, %l6
	.word	0xd2062004	! t0_kref+0x3b60:   	ld	[%i0 + 4], %o1
	.word	0xe1beda58	! t0_kref+0x3b64:   	stda	%f16, [%i3 + %i0]0xd2
	.word	0x81ab0aa8	! t0_kref+0x3b68:   	fcmpes	%fcc0, %f12, %f8
	.word	0x92f2a578	! t0_kref+0x3b6c:   	udivcc	%o2, 0x578, %o1
	.word	0xe41e6000	! t0_kref+0x3b70:   	ldd	[%i1], %l2
	.word	0xd848a026	! t0_kref+0x3b74:   	ldsb	[%g2 + 0x26], %o4
	.word	0xa20ea804	! t0_kref+0x3b78:   	and	%i2, 0x804, %l1
	.word	0x9ab3400d	! t0_kref+0x3b7c:   	orncc	%o5, %o5, %o5
	.word	0x95b40f88	! t0_kref+0x3b80:   	for	%f16, %f8, %f10
	.word	0x9bb68240	! t0_kref+0x3b84:   	array16	%i2, %g0, %o5
	.word	0x86102003	! t0_kref+0x3b88:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x3b8c:   	bne,a	_kref+0x3b8c
	.word	0x86a0e001	! t0_kref+0x3b90:   	subcc	%g3, 1, %g3
	.word	0xa4aa400d	! t0_kref+0x3b94:   	andncc	%o1, %o5, %l2
	.word	0xa523400c	! t0_kref+0x3b98:   	mulscc	%o5, %o4, %l2
	.word	0xada349a8	! t0_kref+0x3b9c:   	fdivs	%f13, %f8, %f22
	.word	0x9fa00135	! t0_kref+0x3ba0:   	fabss	%f21, %f15
	.word	0xc398a040	! t0_kref+0x3ba4:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0x93a01a56	! t0_kref+0x3ba8:   	fdtoi	%f22, %f9
	.word	0xf3262008	! t0_kref+0x3bac:   	st	%f25, [%i0 + 8]
	.word	0xedee101a	! t0_kref+0x3bb0:   	prefetcha	%i0 + %i2, 22
	.word	0x913a801b	! t0_kref+0x3bb4:   	sra	%o2, %i3, %o0
	.word	0xadb2058a	! t0_kref+0x3bb8:   	fcmpgt32	%f8, %f10, %l6
	.word	0xea262000	! t0_kref+0x3bbc:   	st	%l5, [%i0]
	.word	0x85832137	! t0_kref+0x3bc0:   	wr	%o4, 0x137, %ccr
	.word	0xe53e0000	! t0_kref+0x3bc4:   	std	%f18, [%i0]
	.word	0x32800003	! t0_kref+0x3bc8:   	bne,a	_kref+0x3bd4
	.word	0xac8a801b	! t0_kref+0x3bcc:   	andcc	%o2, %i3, %l6
	.word	0xe8d81019	! t0_kref+0x3bd0:   	ldxa	[%g0 + %i1]0x80, %l4
	.word	0xaa124008	! t0_kref+0x3bd4:   	or	%o1, %o0, %l5
	.word	0xd0266018	! t0_kref+0x3bd8:   	st	%o0, [%i1 + 0x18]
	.word	0x9da4c9a8	! t0_kref+0x3bdc:   	fdivs	%f19, %f8, %f14
	.word	0xd11e4000	! t0_kref+0x3be0:   	ldd	[%i1], %f8
	.word	0xd236600e	! t0_kref+0x3be4:   	sth	%o1, [%i1 + 0xe]
	.word	0xa5b40a4e	! t0_kref+0x3be8:   	fpadd32	%f16, %f14, %f18
	.word	0x1b2ebafa	! t0_kref+0x3bec:   	sethi	%hi(0xbaebe800), %o5
	.word	0x9b2b4015	! t0_kref+0x3bf0:   	sll	%o5, %l5, %o5
	.word	0xa9a01a29	! t0_kref+0x3bf4:   	fstoi	%f9, %f20
	.word	0xa6383005	! t0_kref+0x3bf8:   	xnor	%g0, -0xffb, %l3
	.word	0xe240a030	! t0_kref+0x3bfc:   	ldsw	[%g2 + 0x30], %l1
	.word	0x99b6048a	! t0_kref+0x3c00:   	fcmple32	%f24, %f10, %o4
	.word	0xd2d01019	! t0_kref+0x3c04:   	ldsha	[%g0 + %i1]0x80, %o1
	.word	0x95b34634	! t0_kref+0x3c08:   	fmul8x16	%f13, %f20, %f10
	.word	0xc1ee101a	! t0_kref+0x3c0c:   	prefetcha	%i0 + %i2, 0
	.word	0xd6262008	! t0_kref+0x3c10:   	st	%o3, [%i0 + 8]
	.word	0xab2b200d	! t0_kref+0x3c14:   	sll	%o4, 0xd, %l5
	.word	0xa522c015	! t0_kref+0x3c18:   	mulscc	%o3, %l5, %l2
	.word	0x91a489d8	! t0_kref+0x3c1c:   	fdivd	%f18, %f24, %f8
	.word	0xae0b4017	! t0_kref+0x3c20:   	and	%o5, %l7, %l7
	.word	0xe8901018	! t0_kref+0x3c24:   	lduha	[%g0 + %i0]0x80, %l4
	.word	0xd2360000	! t0_kref+0x3c28:   	sth	%o1, [%i0]
	.word	0x9fa4c8b4	! t0_kref+0x3c2c:   	fsubs	%f19, %f20, %f15
	.word	0xa5c06c32	! t0_kref+0x3c30:   	jmpl	%g1 + 0xc32, %l2
	.word	0xa1b40d16	! t0_kref+0x3c34:   	fandnot1	%f16, %f22, %f16
	.word	0x8143c000	! t0_kref+0x3c38:   	stbar
	.word	0xec10a020	! t0_kref+0x3c3c:   	lduh	[%g2 + 0x20], %l6
	.word	0xea0e7feb	! t0_kref+0x3c40:   	ldub	[%i1 - 0x15], %l5
	.word	0x99a01a56	! t0_kref+0x3c44:   	fdtoi	%f22, %f12
	.word	0xada00133	! t0_kref+0x3c48:   	fabss	%f19, %f22
	.word	0x989331ab	! t0_kref+0x3c4c:   	orcc	%o4, -0xe55, %o4
	.word	0xa92a201d	! t0_kref+0x3c50:   	sll	%o0, 0x1d, %l4
	.word	0x8143e040	! t0_kref+0x3c54:   	membar	0x40
	.word	0x37800006	! t0_kref+0x3c58:   	fbge,a	_kref+0x3c70
	.word	0xa22ac000	! t0_kref+0x3c5c:   	andn	%o3, %g0, %l1
	.word	0xa7b2804a	! t0_kref+0x3c60:   	edge8l	%o2, %o2, %l3
	.word	0x912ee015	! t0_kref+0x3c64:   	sll	%i3, 0x15, %o0
	.word	0x81adcab1	! t0_kref+0x3c68:   	fcmpes	%fcc0, %f23, %f17
	.word	0xd42e6000	! t0_kref+0x3c6c:   	stb	%o2, [%i1]
	.word	0x91b24aef	! t0_kref+0x3c70:   	fpsub32s	%f9, %f15, %f8
	.word	0xea167ffa	! t0_kref+0x3c74:   	lduh	[%i1 - 6], %l5
	.word	0xb3a2c9b6	! t0_kref+0x3c78:   	fdivs	%f11, %f22, %f25
	.word	0xd700a030	! t0_kref+0x3c7c:   	ld	[%g2 + 0x30], %f11
	.word	0xd2562000	! t0_kref+0x3c80:   	ldsh	[%i0], %o1
	.word	0xe256c019	! t0_kref+0x3c84:   	ldsh	[%i3 + %i1], %l1
	.word	0xa293400b	! t0_kref+0x3c88:   	orcc	%o5, %o3, %l1
	.word	0xec7e600c	! t0_kref+0x3c8c:   	swap	[%i1 + 0xc], %l6
	.word	0xe13e7fe0	! t0_kref+0x3c90:   	std	%f16, [%i1 - 0x20]
	.word	0xd6564000	! t0_kref+0x3c94:   	ldsh	[%i1], %o3
	.word	0xac0a000d	! t0_kref+0x3c98:   	and	%o0, %o5, %l6
	.word	0x9ba289ac	! t0_kref+0x3c9c:   	fdivs	%f10, %f12, %f13
	.word	0xa1a01a48	! t0_kref+0x3ca0:   	fdtoi	%f8, %f16
	.word	0xafb5c16d	! t0_kref+0x3ca4:   	edge32ln	%l7, %o5, %l7
	.word	0xda6e7ff6	! t0_kref+0x3ca8:   	ldstub	[%i1 - 0xa], %o5
	.word	0x99b40f6b	! t0_kref+0x3cac:   	fornot1s	%f16, %f11, %f12
	.word	0xc3ee100c	! t0_kref+0x3cb0:   	prefetcha	%i0 + %o4, 1
	.word	0x91a000ca	! t0_kref+0x3cb4:   	fnegd	%f10, %f8
	.word	0x9896aac9	! t0_kref+0x3cb8:   	orcc	%i2, 0xac9, %o4
	.word	0xe44e8019	! t0_kref+0x3cbc:   	ldsb	[%i2 + %i1], %l2
	.word	0xe7e6100b	! t0_kref+0x3cc0:   	casa	[%i0]0x80, %o3, %l3
	.word	0x93b00768	! t0_kref+0x3cc4:   	fpack16	%f8, %f9
	.word	0xd040a000	! t0_kref+0x3cc8:   	ldsw	[%g2], %o0
	.word	0x98e37cd6	! t0_kref+0x3ccc:   	subccc	%o5, -0x32a, %o4
	.word	0xa82d232a	! t0_kref+0x3cd0:   	andn	%l4, 0x32a, %l4
	.word	0xd64e001a	! t0_kref+0x3cd4:   	ldsb	[%i0 + %i2], %o3
	.word	0xd200a024	! t0_kref+0x3cd8:   	ld	[%g2 + 0x24], %o1
	.word	0x22800006	! t0_kref+0x3cdc:   	be,a	_kref+0x3cf4
	.word	0xa120232a	! t0_kref+0x3ce0:   	mulscc	%g0, 0x32a, %l0
	.word	0xa025701f	! t0_kref+0x3ce4:   	sub	%l5, -0xfe1, %l0
	.word	0x20480008	! t0_kref+0x3ce8:   	bn,a,pt	%icc, _kref+0x3d08
	.word	0xeede5000	! t0_kref+0x3cec:   	ldxa	[%i1]0x80, %l7
	.word	0xada00536	! t0_kref+0x3cf0:   	fsqrts	%f22, %f22
	.word	0x9e35c00d	! t0_kref+0x3cf4:   	orn	%l7, %o5, %o7
	.word	0xeb00a010	! t0_kref+0x3cf8:   	ld	[%g2 + 0x10], %f21
	.word	0xe9be5a5d	! t0_kref+0x3cfc:   	stda	%f20, [%i1 + %i5]0xd2
	.word	0xa02d7059	! t0_kref+0x3d00:   	andn	%l5, -0xfa7, %l0
	.word	0xe51e0000	! t0_kref+0x3d04:   	ldd	[%i0], %f18
	.word	0xd4270018	! t0_kref+0x3d08:   	st	%o2, [%i4 + %i0]
	.word	0xd82e6012	! t0_kref+0x3d0c:   	stb	%o4, [%i1 + 0x12]
	.word	0xa9b30aaa	! t0_kref+0x3d10:   	fpsub16s	%f12, %f10, %f20
	.word	0x980a4015	! t0_kref+0x3d14:   	and	%o1, %l5, %o4
	.word	0x9bb54ef9	! t0_kref+0x3d18:   	fornot2s	%f21, %f25, %f13
	.word	0xa9b58dd4	! t0_kref+0x3d1c:   	fnand	%f22, %f20, %f20
	.word	0x36480006	! t0_kref+0x3d20:   	bge,a,pt	%icc, _kref+0x3d38
	.word	0xa83dc014	! t0_kref+0x3d24:   	xnor	%l7, %l4, %l4
	.word	0x2b800008	! t0_kref+0x3d28:   	fbug,a	_kref+0x3d48
	.word	0xa63a4000	! t0_kref+0x3d2c:   	not	%o1, %l3
	.word	0xadb48dd0	! t0_kref+0x3d30:   	fnand	%f18, %f16, %f22
	.word	0x27338df8	! t0_kref+0x3d34:   	sethi	%hi(0xce37e000), %l3
	.word	0xb1a2c835	! t0_kref+0x3d38:   	fadds	%f11, %f21, %f24
	.word	0xa1a01a38	! t0_kref+0x3d3c:   	fstoi	%f24, %f16
	.word	0x95b40c56	! t0_kref+0x3d40:   	fnor	%f16, %f22, %f10
	.word	0x9fa01a2c	! t0_kref+0x3d44:   	fstoi	%f12, %f15
	.word	0x81580000	! t0_kref+0x3d48:   	flushw
	.word	0x91a0002d	! t0_kref+0x3d4c:   	fmovs	%f13, %f8
	.word	0xa5b00cf0	! t0_kref+0x3d50:   	fnot2s	%f16, %f18
	.word	0xa52a800a	! t0_kref+0x3d54:   	sll	%o2, %o2, %l2
	.word	0xe726401c	! t0_kref+0x3d58:   	st	%f19, [%i1 + %i4]
	.word	0xa9a489ce	! t0_kref+0x3d5c:   	fdivd	%f18, %f14, %f20
	.word	0xf36e001a	! t0_kref+0x3d60:   	prefetch	%i0 + %i2, 25
	.word	0xd28e101a	! t0_kref+0x3d64:   	lduba	[%i0 + %i2]0x80, %o1
	.word	0x91a01890	! t0_kref+0x3d68:   	fitos	%f16, %f8
	.word	0xc0300019	! t0_kref+0x3d6c:   	clrh	[%g0 + %i1]
	.word	0x9883001b	! t0_kref+0x3d70:   	addcc	%o4, %i3, %o4
	.word	0xe28e101a	! t0_kref+0x3d74:   	lduba	[%i0 + %i2]0x80, %l1
	.word	0x9045c00c	! t0_kref+0x3d78:   	addc	%l7, %o4, %o0
	.word	0xaf7030ca	! t0_kref+0x3d7c:   	popc	-0xf36, %l7
	.word	0x99a00554	! t0_kref+0x3d80:   	fsqrtd	%f20, %f12
	.word	0xda20a030	! t0_kref+0x3d84:   	st	%o5, [%g2 + 0x30]
	.word	0x912da01a	! t0_kref+0x3d88:   	sll	%l6, 0x1a, %o0
	.word	0xe8767ff0	! t0_kref+0x3d8c:   	stx	%l4, [%i1 - 0x10]
	.word	0x9fa0188b	! t0_kref+0x3d90:   	fitos	%f11, %f15
	.word	0xa29b62bd	! t0_kref+0x3d94:   	xorcc	%o5, 0x2bd, %l1
	.word	0xa9b3400d	! t0_kref+0x3d98:   	edge8	%o5, %o5, %l4
	.word	0xda40a024	! t0_kref+0x3d9c:   	ldsw	[%g2 + 0x24], %o5
	.word	0xaaaa801b	! t0_kref+0x3da0:   	andncc	%o2, %i3, %l5
	.word	0xf96e401d	! t0_kref+0x3da4:   	prefetch	%i1 + %i5, 28
	.word	0xeda71019	! t0_kref+0x3da8:   	sta	%f22, [%i4 + %i1]0x80
	.word	0xd9266004	! t0_kref+0x3dac:   	st	%f12, [%i1 + 4]
	.word	0xa1a44837	! t0_kref+0x3db0:   	fadds	%f17, %f23, %f16
	.word	0xd250a00e	! t0_kref+0x3db4:   	ldsh	[%g2 + 0xe], %o1
	.word	0xe7264000	! t0_kref+0x3db8:   	st	%f19, [%i1]
	.word	0xe48e9018	! t0_kref+0x3dbc:   	lduba	[%i2 + %i0]0x80, %l2
	.word	0x3c800008	! t0_kref+0x3dc0:   	bpos,a	_kref+0x3de0
	.word	0xa1b6c05b	! t0_kref+0x3dc4:   	edge8l	%i3, %i3, %l0
	.word	0x91b58998	! t0_kref+0x3dc8:   	bshuffle	%f22, %f24, %f8
	.word	0xf11e0000	! t0_kref+0x3dcc:   	ldd	[%i0], %f24
	.word	0xb1b44a6a	! t0_kref+0x3dd0:   	fpadd32s	%f17, %f10, %f24
	.word	0xa3a609aa	! t0_kref+0x3dd4:   	fdivs	%f24, %f10, %f17
	.word	0x9296c015	! t0_kref+0x3dd8:   	orcc	%i3, %l5, %o1
	.word	0x988368ca	! t0_kref+0x3ddc:   	addcc	%o5, 0x8ca, %o4
	.word	0x91a0102b	! t0_kref+0x3de0:   	fstox	%f11, %f8
	.word	0x20480008	! t0_kref+0x3de4:   	bn,a,pt	%icc, _kref+0x3e04
	.word	0xeb6e401c	! t0_kref+0x3de8:   	prefetch	%i1 + %i4, 21
	.word	0x2b2ab25f	! t0_kref+0x3dec:   	sethi	%hi(0xaac97c00), %l5
	.word	0xa9a01a31	! t0_kref+0x3df0:   	fstoi	%f17, %f20
	.word	0x91b4cdaf	! t0_kref+0x3df4:   	fxors	%f19, %f15, %f8
	.word	0xe82e0000	! t0_kref+0x3df8:   	stb	%l4, [%i0]
	.word	0xa92de016	! t0_kref+0x3dfc:   	sll	%l7, 0x16, %l4
	.word	0xda362016	! t0_kref+0x3e00:   	sth	%o5, [%i0 + 0x16]
	.word	0x9a36c015	! t0_kref+0x3e04:   	orn	%i3, %l5, %o5
	.word	0x8143e040	! t0_kref+0x3e08:   	membar	0x40
	.word	0xa9a4cd29	! t0_kref+0x3e0c:   	fsmuld	%f19, %f9, %f20
	.word	0xadb28a94	! t0_kref+0x3e10:   	fpsub16	%f10, %f20, %f22
	.word	0x3e480005	! t0_kref+0x3e14:   	bvc,a,pt	%icc, _kref+0x3e28
	.word	0x81868000	! t0_kref+0x3e18:   	wr	%i2, %g0, %y
	.word	0x81ae0a30	! t0_kref+0x3e1c:   	fcmps	%fcc0, %f24, %f16
	.word	0xc9ee100c	! t0_kref+0x3e20:   	prefetcha	%i0 + %o4, 4
	.word	0xa9a0110e	! t0_kref+0x3e24:   	fxtod	%f14, %f20
	.word	0xa1a00548	! t0_kref+0x3e28:   	fsqrtd	%f8, %f16
	.word	0xd0480019	! t0_kref+0x3e2c:   	ldsb	[%g0 + %i1], %o0
	.word	0x94d82a6f	! t0_kref+0x3e30:   	smulcc	%g0, 0xa6f, %o2
	.word	0xa1a00033	! t0_kref+0x3e34:   	fmovs	%f19, %f16
	.word	0x95b48556	! t0_kref+0x3e38:   	fcmpeq16	%f18, %f22, %o2
	.word	0xae96800a	! t0_kref+0x3e3c:   	orcc	%i2, %o2, %l7
	.word	0xac12c015	! t0_kref+0x3e40:   	or	%o3, %l5, %l6
	.word	0x38480004	! t0_kref+0x3e44:   	bgu,a,pt	%icc, _kref+0x3e54
	.word	0xd6360000	! t0_kref+0x3e48:   	sth	%o3, [%i0]
	.word	0xd208a029	! t0_kref+0x3e4c:   	ldub	[%g2 + 0x29], %o1
	.word	0xe0062004	! t0_kref+0x3e50:   	ld	[%i0 + 4], %l0
	.word	0x2e800008	! t0_kref+0x3e54:   	bvs,a	_kref+0x3e74
	.word	0x91a01108	! t0_kref+0x3e58:   	fxtod	%f8, %f8
	.word	0x99a50956	! t0_kref+0x3e5c:   	fmuld	%f20, %f22, %f12
	.word	0x32480007	! t0_kref+0x3e60:   	bne,a,pt	%icc, _kref+0x3e7c
	.word	0xe01e3ff0	! t0_kref+0x3e64:   	ldd	[%i0 - 0x10], %l0
	.word	0xd896505b	! t0_kref+0x3e68:   	lduha	[%i1 + %i3]0x82, %o4
	.word	0x98b54015	! t0_kref+0x3e6c:   	orncc	%l5, %l5, %o4
	.word	0xb1b40dd0	! t0_kref+0x3e70:   	fnand	%f16, %f16, %f24
	.word	0x91a01a56	! t0_kref+0x3e74:   	fdtoi	%f22, %f8
	.word	0x949deca8	! t0_kref+0x3e78:   	xorcc	%l7, 0xca8, %o2
	.word	0x81ad0a52	! t0_kref+0x3e7c:   	fcmpd	%fcc0, %f20, %f18
	.word	0x90b2294a	! t0_kref+0x3e80:   	orncc	%o0, 0x94a, %o0
	.word	0xe6567fee	! t0_kref+0x3e84:   	ldsh	[%i1 - 0x12], %l3
	.word	0x9a8e800d	! t0_kref+0x3e88:   	andcc	%i2, %o5, %o5
	.word	0xec270018	! t0_kref+0x3e8c:   	st	%l6, [%i4 + %i0]
	.word	0xeeb61000	! t0_kref+0x3e90:   	stha	%l7, [%i0]0x80
	.word	0x95b500c8	! t0_kref+0x3e94:   	edge16l	%l4, %o0, %o2
	.word	0xa1a0192a	! t0_kref+0x3e98:   	fstod	%f10, %f16
	.word	0x94932dc5	! t0_kref+0x3e9c:   	orcc	%o4, 0xdc5, %o2
	.word	0xa3b30175	! t0_kref+0x3ea0:   	edge32ln	%o4, %l5, %l1
	.word	0xa3282002	! t0_kref+0x3ea4:   	sll	%g0, 0x2, %l1
	.word	0xb1a00556	! t0_kref+0x3ea8:   	fsqrtd	%f22, %f24
	.word	0x99a309a9	! t0_kref+0x3eac:   	fdivs	%f12, %f9, %f12
	.word	0xee270019	! t0_kref+0x3eb0:   	st	%l7, [%i4 + %i1]
	.word	0xa7a01a33	! t0_kref+0x3eb4:   	fstoi	%f19, %f19
	.word	0x91a309ac	! t0_kref+0x3eb8:   	fdivs	%f12, %f12, %f8
	.word	0xa4b2c00c	! t0_kref+0x3ebc:   	orncc	%o3, %o4, %l2
	.word	0xa42d0017	! t0_kref+0x3ec0:   	andn	%l4, %l7, %l2
	.word	0x9882c009	! t0_kref+0x3ec4:   	addcc	%o3, %o1, %o4
	.word	0xaf234009	! t0_kref+0x3ec8:   	mulscc	%o5, %o1, %l7
	.word	0x9e2dea38	! t0_kref+0x3ecc:   	andn	%l7, 0xa38, %o7
	.word	0xe810a03a	! t0_kref+0x3ed0:   	lduh	[%g2 + 0x3a], %l4
	.word	0xef68a041	! t0_kref+0x3ed4:   	prefetch	%g2 + 0x41, 23
	.word	0x2a800007	! t0_kref+0x3ed8:   	bcs,a	_kref+0x3ef4
	.word	0x98f6c00c	! t0_kref+0x3edc:   	udivcc	%i3, %o4, %o4
	.word	0x81aa0a2b	! t0_kref+0x3ee0:   	fcmps	%fcc0, %f8, %f11
	.word	0xac15c00c	! t0_kref+0x3ee4:   	or	%l7, %o4, %l6
	.word	0x9bb5c240	! t0_kref+0x3ee8:   	array16	%l7, %g0, %o5
	.word	0xe6500018	! t0_kref+0x3eec:   	ldsh	[%g0 + %i0], %l3
	.word	0x81ad4aae	! t0_kref+0x3ef0:   	fcmpes	%fcc0, %f21, %f14
	.word	0x922d4000	! t0_kref+0x3ef4:   	andn	%l5, %g0, %o1
	.word	0xa9b54729	! t0_kref+0x3ef8:   	fmuld8ulx16	%f21, %f9, %f20
	.word	0xecb01019	! t0_kref+0x3efc:   	stha	%l6, [%g0 + %i1]0x80
	.word	0xec000019	! t0_kref+0x3f00:   	ld	[%g0 + %i1], %l6
	.word	0xe93e0000	! t0_kref+0x3f04:   	std	%f20, [%i0]
	.word	0xec1e7ff0	! t0_kref+0x3f08:   	ldd	[%i1 - 0x10], %l6
	.word	0xa1a3884c	! t0_kref+0x3f0c:   	faddd	%f14, %f12, %f16
	.word	0xa6b569cf	! t0_kref+0x3f10:   	orncc	%l5, 0x9cf, %l3
	.word	0x878020d2	! t0_kref+0x3f14:   	mov	0xd2, %asi
	.word	0x95b5832c	! t0_kref+0x3f18:   	bmask	%l6, %o4, %o2
	.word	0x91b50990	! t0_kref+0x3f1c:   	bshuffle	%f20, %f16, %f8
	.word	0x90b2c00b	! t0_kref+0x3f20:   	orncc	%o3, %o3, %o0
	.word	0x9ba01a37	! t0_kref+0x3f24:   	fstoi	%f23, %f13
	.word	0x944038ac	! t0_kref+0x3f28:   	addc	%g0, -0x754, %o2
	.word	0x87802080	! t0_kref+0x3f2c:   	mov	0x80, %asi
	.word	0xed6e001a	! t0_kref+0x3f30:   	prefetch	%i0 + %i2, 22
	.word	0x131f6449	! t0_kref+0x3f34:   	sethi	%hi(0x7d912400), %o1
	.word	0x94f5c009	! t0_kref+0x3f38:   	udivcc	%l7, %o1, %o2
	.word	0x99200009	! t0_kref+0x3f3c:   	mulscc	%g0, %o1, %o4
	.word	0xec90a030	! t0_kref+0x3f40:   	lduha	[%g2 + 0x30]%asi, %l6
	.word	0x81ad8ac8	! t0_kref+0x3f44:   	fcmped	%fcc0, %f22, %f8
	.word	0x9ba01a50	! t0_kref+0x3f48:   	fdtoi	%f16, %f13
	.word	0x90b6c017	! t0_kref+0x3f4c:   	orncc	%i3, %l7, %o0
	.word	0xe500a024	! t0_kref+0x3f50:   	ld	[%g2 + 0x24], %f18
	.word	0x92fd0008	! t0_kref+0x3f54:   	sdivcc	%l4, %o0, %o1
	.word	0xc026401c	! t0_kref+0x3f58:   	clr	[%i1 + %i4]
	.word	0xa9a2cd36	! t0_kref+0x3f5c:   	fsmuld	%f11, %f22, %f20
	.word	0xd8c0a024	! t0_kref+0x3f60:   	ldswa	[%g2 + 0x24]%asi, %o4
	.word	0xe47e001c	! t0_kref+0x3f64:   	swap	[%i0 + %i4], %l2
	.word	0xecc0a00c	! t0_kref+0x3f68:   	ldswa	[%g2 + 0xc]%asi, %l6
	.word	0xe5be3ff8	! t0_kref+0x3f6c:   	stda	%f18, [%i0 - 8]%asi
	.word	0xa2833d1c	! t0_kref+0x3f70:   	addcc	%o4, -0x2e4, %l1
	.word	0xa9b5848e	! t0_kref+0x3f74:   	fcmple32	%f22, %f14, %l4
	.word	0xa1154015	! t0_kref+0x3f78:   	taddcctv	%l5, %l5, %l0
	.word	0xa7a01a38	! t0_kref+0x3f7c:   	fstoi	%f24, %f19
	.word	0xea48a03b	! t0_kref+0x3f80:   	ldsb	[%g2 + 0x3b], %l5
	.word	0x81ad0ad8	! t0_kref+0x3f84:   	fcmped	%fcc0, %f20, %f24
	.word	0xada01a56	! t0_kref+0x3f88:   	fdtoi	%f22, %f22
	.word	0xeec0a02c	! t0_kref+0x3f8c:   	ldswa	[%g2 + 0x2c]%asi, %l7
	.word	0x20480004	! t0_kref+0x3f90:   	bn,a,pt	%icc, _kref+0x3fa0
	.word	0xa5b5c169	! t0_kref+0x3f94:   	edge32ln	%l7, %o1, %l2
	.word	0x32480005	! t0_kref+0x3f98:   	bne,a,pt	%icc, _kref+0x3fac
	.word	0x9db48d40	! t0_kref+0x3f9c:   	fnot1	%f18, %f14
	.word	0xaca58000	! t0_kref+0x3fa0:   	subcc	%l6, %g0, %l6
	.word	0xa1a0004c	! t0_kref+0x3fa4:   	fmovd	%f12, %f16
	.word	0x38480005	! t0_kref+0x3fa8:   	bgu,a,pt	%icc, _kref+0x3fbc
	.word	0xd036c018	! t0_kref+0x3fac:   	sth	%o0, [%i3 + %i0]
	.word	0x9db20f92	! t0_kref+0x3fb0:   	for	%f8, %f18, %f14
	.word	0x900a4009	! t0_kref+0x3fb4:   	and	%o1, %o1, %o0
	.word	0xeeae5000	! t0_kref+0x3fb8:   	stba	%l7, [%i1]0x80
	.word	0xada01936	! t0_kref+0x3fbc:   	fstod	%f22, %f22
	.word	0x9025fb5f	! t0_kref+0x3fc0:   	sub	%l7, -0x4a1, %o0
	.word	0x96f30015	! t0_kref+0x3fc4:   	udivcc	%o4, %l5, %o3
	.word	0x9bb4cdad	! t0_kref+0x3fc8:   	fxors	%f19, %f13, %f13
	.word	0xe4c8a012	! t0_kref+0x3fcc:   	ldsba	[%g2 + 0x12]%asi, %l2
	call	SYM(t0_subr0)
	.word	0xae258014	! t0_kref+0x3fd4:   	sub	%l6, %l4, %l7
	.word	0xaa3e8008	! t0_kref+0x3fd8:   	xnor	%i2, %o0, %l5
	.word	0xa9b50069	! t0_kref+0x3fdc:   	edge8ln	%l4, %o1, %l4
	.word	0xa1b00fe0	! t0_kref+0x3fe0:   	fones	%f16
	.word	0xe9be5a5d	! t0_kref+0x3fe4:   	stda	%f20, [%i1 + %i5]0xd2
	.word	0xa9a01929	! t0_kref+0x3fe8:   	fstod	%f9, %f20
	.word	0xe4c8a007	! t0_kref+0x3fec:   	ldsba	[%g2 + 7]%asi, %l2
	.word	0x99b00fc0	! t0_kref+0x3ff0:   	fone	%f12
	.word	0xde88a033	! t0_kref+0x3ff4:   	lduba	[%g2 + 0x33]%asi, %o7
	.word	0xae3a8008	! t0_kref+0x3ff8:   	xnor	%o2, %o0, %l7
	.word	0xb1a489ce	! t0_kref+0x3ffc:   	fdivd	%f18, %f14, %f24
	.word	0x9a98000b	! t0_kref+0x4000:   	xorcc	%g0, %o3, %o5
	.word	0xf83e3fe0	! t0_kref+0x4004:   	std	%i4, [%i0 - 0x20]
	.word	0x3e480006	! t0_kref+0x4008:   	bvc,a,pt	%icc, _kref+0x4020
	.word	0xb1a4c8b0	! t0_kref+0x400c:   	fsubs	%f19, %f16, %f24
	.word	0x99a00556	! t0_kref+0x4010:   	fsqrtd	%f22, %f12
	.word	0xe688a03e	! t0_kref+0x4014:   	lduba	[%g2 + 0x3e]%asi, %l3
	.word	0x20480003	! t0_kref+0x4018:   	bn,a,pt	%icc, _kref+0x4024
	.word	0xd64e200b	! t0_kref+0x401c:   	ldsb	[%i0 + 0xb], %o3
	.word	0x9db60e48	! t0_kref+0x4020:   	fxnor	%f24, %f8, %f14
	.word	0x908e800d	! t0_kref+0x4024:   	andcc	%i2, %o5, %o0
	.word	0xa1a0192d	! t0_kref+0x4028:   	fstod	%f13, %f16
	.word	0x95b60a16	! t0_kref+0x402c:   	fpadd16	%f24, %f22, %f10
	.word	0xe688a035	! t0_kref+0x4030:   	lduba	[%g2 + 0x35]%asi, %l3
	.word	0x2325cc7f	! t0_kref+0x4034:   	sethi	%hi(0x9731fc00), %l1
	.word	0xe01e7fe8	! t0_kref+0x4038:   	ldd	[%i1 - 0x18], %l0
	.word	0x8186c000	! t0_kref+0x403c:   	wr	%i3, %g0, %y
	.word	0xaef2a8c2	! t0_kref+0x4040:   	udivcc	%o2, 0x8c2, %l7
	.word	0xdede5000	! t0_kref+0x4044:   	ldxa	[%i1]0x80, %o7
	.word	0xf1863ffc	! t0_kref+0x4048:   	lda	[%i0 - 4]%asi, %f24
	.word	0xada01a50	! t0_kref+0x404c:   	fdtoi	%f16, %f22
	.word	0x2e480008	! t0_kref+0x4050:   	bvs,a,pt	%icc, _kref+0x4070
	.word	0xd6de7ff0	! t0_kref+0x4054:   	ldxa	[%i1 - 0x10]%asi, %o3
	.word	0x81ac8ad8	! t0_kref+0x4058:   	fcmped	%fcc0, %f18, %f24
	.word	0x9ba01a50	! t0_kref+0x405c:   	fdtoi	%f16, %f13
	.word	0x8143c000	! t0_kref+0x4060:   	stbar
	.word	0xd036401b	! t0_kref+0x4064:   	sth	%o0, [%i1 + %i3]
	.word	0xd026601c	! t0_kref+0x4068:   	st	%o0, [%i1 + 0x1c]
	.word	0x96c2800b	! t0_kref+0x406c:   	addccc	%o2, %o3, %o3
	.word	0xef68a006	! t0_kref+0x4070:   	prefetch	%g2 + 6, 23
	.word	0x86102001	! t0_kref+0x4074:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x4078:   	bne,a	_kref+0x4078
	.word	0x86a0e001	! t0_kref+0x407c:   	subcc	%g3, 1, %g3
	.word	0xadb50c58	! t0_kref+0x4080:   	fnor	%f20, %f24, %f22
	.word	0xec4e001a	! t0_kref+0x4084:   	ldsb	[%i0 + %i2], %l6
	.word	0x81828000	! t0_kref+0x4088:   	wr	%o2, %g0, %y
	.word	0x81ac4a35	! t0_kref+0x408c:   	fcmps	%fcc0, %f17, %f21
	.word	0xa3b3840c	! t0_kref+0x4090:   	fcmple16	%f14, %f12, %l1
	.word	0xdec62008	! t0_kref+0x4094:   	ldswa	[%i0 + 8]%asi, %o7
	.word	0xada588b3	! t0_kref+0x4098:   	fsubs	%f22, %f19, %f22
	.word	0xa1a38856	! t0_kref+0x409c:   	faddd	%f14, %f22, %f16
	.word	0x20800006	! t0_kref+0x40a0:   	bn,a	_kref+0x40b8
	.word	0xafa00139	! t0_kref+0x40a4:   	fabss	%f25, %f23
	.word	0xd048a03c	! t0_kref+0x40a8:   	ldsb	[%g2 + 0x3c], %o0
	.word	0xea270019	! t0_kref+0x40ac:   	st	%l5, [%i4 + %i1]
	.word	0xea2e6018	! t0_kref+0x40b0:   	stb	%l5, [%i1 + 0x18]
	.word	0x9a0aa317	! t0_kref+0x40b4:   	and	%o2, 0x317, %o5
	.word	0x99b00cc8	! t0_kref+0x40b8:   	fnot2	%f8, %f12
	.word	0xafa00037	! t0_kref+0x40bc:   	fmovs	%f23, %f23
	.word	0x99b4c969	! t0_kref+0x40c0:   	fpmerge	%f19, %f9, %f12
	.word	0xa5a2cd2e	! t0_kref+0x40c4:   	fsmuld	%f11, %f14, %f18
	.word	0x97a0012a	! t0_kref+0x40c8:   	fabss	%f10, %f11
	.word	0x96958016	! t0_kref+0x40cc:   	orcc	%l6, %l6, %o3
	.word	0xb3b28a68	! t0_kref+0x40d0:   	fpadd32s	%f10, %f8, %f25
	.word	0x9bb58a35	! t0_kref+0x40d4:   	fpadd16s	%f22, %f21, %f13
	.word	0xa65327bf	! t0_kref+0x40d8:   	umul	%o4, 0x7bf, %l3
	.word	0xecde3ff0	! t0_kref+0x40dc:   	ldxa	[%i0 - 0x10]%asi, %l6
	.word	0x2e800002	! t0_kref+0x40e0:   	bvs,a	_kref+0x40e8
	.word	0xa8db400a	! t0_kref+0x40e4:   	smulcc	%o5, %o2, %l4
	.word	0x91a0054e	! t0_kref+0x40e8:   	fsqrtd	%f14, %f8
	.word	0xb1b50752	! t0_kref+0x40ec:   	fpack32	%f20, %f18, %f24
	.word	0xa1a00558	! t0_kref+0x40f0:   	fsqrtd	%f24, %f16
	.word	0xac230014	! t0_kref+0x40f4:   	sub	%o4, %l4, %l6
	.word	0xe41e4000	! t0_kref+0x40f8:   	ldd	[%i1], %l2
	.word	0xafb3015a	! t0_kref+0x40fc:   	edge32l	%o4, %i2, %l7
	.word	0x97a5482e	! t0_kref+0x4100:   	fadds	%f21, %f14, %f11
	.word	0x81da800d	! t0_kref+0x4104:   	flush	%o2 + %o5
	.word	0xe7e6100a	! t0_kref+0x4108:   	casa	[%i0]0x80, %o2, %l3
	.word	0x38800005	! t0_kref+0x410c:   	bgu,a	_kref+0x4120
	.word	0xe06e8019	! t0_kref+0x4110:   	ldstub	[%i2 + %i1], %l0
	.word	0xd0270019	! t0_kref+0x4114:   	st	%o0, [%i4 + %i1]
	.word	0x91a3894a	! t0_kref+0x4118:   	fmuld	%f14, %f10, %f8
	.word	0xf62e6000	! t0_kref+0x411c:   	stb	%i3, [%i1]
	.word	0xa1a000d6	! t0_kref+0x4120:   	fnegd	%f22, %f16
	.word	0x36800001	! t0_kref+0x4124:   	bge,a	_kref+0x4128
	.word	0x9ba24828	! t0_kref+0x4128:   	fadds	%f9, %f8, %f13
	.word	0x81854000	! t0_kref+0x412c:   	wr	%l5, %g0, %y
	.word	0xa225663f	! t0_kref+0x4130:   	sub	%l5, 0x63f, %l1
	.word	0x96f2801a	! t0_kref+0x4134:   	udivcc	%o2, %i2, %o3
	.word	0x81aaca2b	! t0_kref+0x4138:   	fcmps	%fcc0, %f11, %f11
	.word	0xeff6100a	! t0_kref+0x413c:   	casxa	[%i0]0x80, %o2, %l7
	.word	0x9eda8016	! t0_kref+0x4140:   	smulcc	%o2, %l6, %o7
	.word	0x92b23fb5	! t0_kref+0x4144:   	orncc	%o0, -0x4b, %o1
	.word	0x8185c000	! t0_kref+0x4148:   	wr	%l7, %g0, %y
	.word	0x81aa4a2a	! t0_kref+0x414c:   	fcmps	%fcc0, %f9, %f10
	.word	0xdac0a03c	! t0_kref+0x4150:   	ldswa	[%g2 + 0x3c]%asi, %o5
	.word	0xada01a54	! t0_kref+0x4154:   	fdtoi	%f20, %f22
	.word	0xd04e3fff	! t0_kref+0x4158:   	ldsb	[%i0 - 1], %o0
	.word	0xa09ec00b	! t0_kref+0x415c:   	xorcc	%i3, %o3, %l0
	.word	0x95a0190f	! t0_kref+0x4160:   	fitod	%f15, %f10
	.word	0xc12967d4	! t0_kref+0x4164:   	st	%fsr, [%g5 + 0x7d4]
	.word	0xa8f36d13	! t0_kref+0x4168:   	udivcc	%o5, 0xd13, %l4
	.word	0xd656601a	! t0_kref+0x416c:   	ldsh	[%i1 + 0x1a], %o3
	.word	0xe24e7ff6	! t0_kref+0x4170:   	ldsb	[%i1 - 0xa], %l1
	.word	0xef064000	! t0_kref+0x4174:   	ld	[%i1], %f23
	.word	0xada0190f	! t0_kref+0x4178:   	fitod	%f15, %f22
	.word	0xaeb6c015	! t0_kref+0x417c:   	orncc	%i3, %l5, %l7
	.word	0xd630a016	! t0_kref+0x4180:   	sth	%o3, [%g2 + 0x16]
	.word	0xd636c018	! t0_kref+0x4184:   	sth	%o3, [%i3 + %i0]
	.word	0xada40833	! t0_kref+0x4188:   	fadds	%f16, %f19, %f22
	.word	0xd6060000	! t0_kref+0x418c:   	ld	[%i0], %o3
	.word	0x94f2a165	! t0_kref+0x4190:   	udivcc	%o2, 0x165, %o2
	.word	0x9682c015	! t0_kref+0x4194:   	addcc	%o3, %l5, %o3
	call	SYM(t0_subr3)
	.word	0xd0300018	! t0_kref+0x419c:   	sth	%o0, [%g0 + %i0]
	.word	0xb3a01a48	! t0_kref+0x41a0:   	fdtoi	%f8, %f25
	.word	0x98b5fa2c	! t0_kref+0x41a4:   	orncc	%l7, -0x5d4, %o4
	.word	0xa1a3084c	! t0_kref+0x41a8:   	faddd	%f12, %f12, %f16
	.word	0xd53e001d	! t0_kref+0x41ac:   	std	%f10, [%i0 + %i5]
	.word	0x94b2001b	! t0_kref+0x41b0:   	orncc	%o0, %i3, %o2
	.word	0xeaae3ff4	! t0_kref+0x41b4:   	stba	%l5, [%i0 - 0xc]%asi
	.word	0x98f5800c	! t0_kref+0x41b8:   	udivcc	%l6, %o4, %o4
	.word	0x9822629f	! t0_kref+0x41bc:   	sub	%o1, 0x29f, %o4
	.word	0x2f3b9ea1	! t0_kref+0x41c0:   	sethi	%hi(0xee7a8400), %l7
	.word	0xda063ffc	! t0_kref+0x41c4:   	ld	[%i0 - 4], %o5
	.word	0xd5a6501c	! t0_kref+0x41c8:   	sta	%f10, [%i1 + %i4]0x80
	.word	0xa7a5c9a8	! t0_kref+0x41cc:   	fdivs	%f23, %f8, %f19
	.word	0xaba01a56	! t0_kref+0x41d0:   	fdtoi	%f22, %f21
	.word	0x9bb60eee	! t0_kref+0x41d4:   	fornot2s	%f24, %f14, %f13
	.word	0xa3a54831	! t0_kref+0x41d8:   	fadds	%f21, %f17, %f17
	.word	0x91b340d5	! t0_kref+0x41dc:   	edge16l	%o5, %l5, %o0
	.word	0xa2c6a91c	! t0_kref+0x41e0:   	addccc	%i2, 0x91c, %l1
	.word	0xd226600c	! t0_kref+0x41e4:   	st	%o1, [%i1 + 0xc]
	.word	0x9492af97	! t0_kref+0x41e8:   	orcc	%o2, 0xf97, %o2
	.word	0x95a01a4c	! t0_kref+0x41ec:   	fdtoi	%f12, %f10
	.word	0xa222c014	! t0_kref+0x41f0:   	sub	%o3, %l4, %l1
	.word	0xe93e6008	! t0_kref+0x41f4:   	std	%f20, [%i1 + 8]
	.word	0x8143c000	! t0_kref+0x41f8:   	stbar
	.word	0xa8d5801b	! t0_kref+0x41fc:   	umulcc	%l6, %i3, %l4
	.word	0xeace5000	! t0_kref+0x4200:   	ldsba	[%i1]0x80, %l5
	.word	0xaf22f884	! t0_kref+0x4204:   	mulscc	%o3, -0x77c, %l7
	.word	0x9de3bfa0	! t0_kref+0x4208:   	save	%sp, -0x60, %sp
	.word	0xabee801c	! t0_kref+0x420c:   	restore	%i2, %i4, %l5
	.word	0xa9a00033	! t0_kref+0x4210:   	fmovs	%f19, %f20
	.word	0x3c800007	! t0_kref+0x4214:   	bpos,a	_kref+0x4230
	.word	0x9022b1be	! t0_kref+0x4218:   	sub	%o2, -0xe42, %o0
	.word	0xe41f4019	! t0_kref+0x421c:   	ldd	[%i5 + %i1], %l2
	.word	0xde0e6003	! t0_kref+0x4220:   	ldub	[%i1 + 3], %o7
	.word	0x98f6c017	! t0_kref+0x4224:   	udivcc	%i3, %l7, %o4
	.word	0xee262004	! t0_kref+0x4228:   	st	%l7, [%i0 + 4]
	.word	0x99b28a56	! t0_kref+0x422c:   	fpadd32	%f10, %f22, %f12
	.word	0xaea00016	! t0_kref+0x4230:   	subcc	%g0, %l6, %l7
	.word	0x38800001	! t0_kref+0x4234:   	bgu,a	_kref+0x4238
	.word	0xa3a00132	! t0_kref+0x4238:   	fabss	%f18, %f17
	.word	0x96b3000c	! t0_kref+0x423c:   	orncc	%o4, %o4, %o3
	.word	0xe9e8a08e	! t0_kref+0x4240:   	prefetcha	%g2 + 0x8e, 20
	.word	0xe8066010	! t0_kref+0x4244:   	ld	[%i1 + 0x10], %l4
	.word	0x27352aa2	! t0_kref+0x4248:   	sethi	%hi(0xd4aa8800), %l3
	.word	0xe4500019	! t0_kref+0x424c:   	ldsh	[%g0 + %i1], %l2
	.word	0xd8480018	! t0_kref+0x4250:   	ldsb	[%g0 + %i0], %o4
	.word	0x91b007b0	! t0_kref+0x4254:   	fpackfix	%f16, %f8
	.word	0xa82b0008	! t0_kref+0x4258:   	andn	%o4, %o0, %l4
	.word	0xa1b00fc0	! t0_kref+0x425c:   	fone	%f16
	.word	0x81ad8aac	! t0_kref+0x4260:   	fcmpes	%fcc0, %f22, %f12
	.word	0xe11e2000	! t0_kref+0x4264:   	ldd	[%i0], %f16
	.word	0xa092800b	! t0_kref+0x4268:   	orcc	%o2, %o3, %l0
	.word	0xe7ee501b	! t0_kref+0x426c:   	prefetcha	%i1 + %i3, 19
	.word	0xe408a01b	! t0_kref+0x4270:   	ldub	[%g2 + 0x1b], %l2
	.word	0xe8162014	! t0_kref+0x4274:   	lduh	[%i0 + 0x14], %l4
	.word	0xd04e6001	! t0_kref+0x4278:   	ldsb	[%i1 + 1], %o0
	.word	0x923b000b	! t0_kref+0x427c:   	xnor	%o4, %o3, %o1
	.word	0xd5064000	! t0_kref+0x4280:   	ld	[%i1], %f10
	.word	0x22800001	! t0_kref+0x4284:   	be,a	_kref+0x4288
	.word	0xe0180019	! t0_kref+0x4288:   	ldd	[%g0 + %i1], %l0
	.word	0xa1a30950	! t0_kref+0x428c:   	fmuld	%f12, %f16, %f16
	.word	0x1b131b7a	! t0_kref+0x4290:   	sethi	%hi(0x4c6de800), %o5
	.word	0xafa0012c	! t0_kref+0x4294:   	fabss	%f12, %f23
	.word	0xd60e6014	! t0_kref+0x4298:   	ldub	[%i1 + 0x14], %o3
	.word	0xada00033	! t0_kref+0x429c:   	fmovs	%f19, %f22
	.word	0x962ac008	! t0_kref+0x42a0:   	andn	%o3, %o0, %o3
	.word	0xe84e401a	! t0_kref+0x42a4:   	ldsb	[%i1 + %i2], %l4
	.word	0xf831401b	! t0_kref+0x42a8:   	sth	%i4, [%g5 + %i3]
	.word	0x9da01a29	! t0_kref+0x42ac:   	fstoi	%f9, %f14
	.word	0xd808a023	! t0_kref+0x42b0:   	ldub	[%g2 + 0x23], %o4
	.word	0x99b34240	! t0_kref+0x42b4:   	array16	%o5, %g0, %o4
	.word	0x9da01928	! t0_kref+0x42b8:   	fstod	%f8, %f14
	.word	0xa2b5a19d	! t0_kref+0x42bc:   	orncc	%l6, 0x19d, %l1
	.word	0x2f800005	! t0_kref+0x42c0:   	fbu,a	_kref+0x42d4
	.word	0xb3b44d60	! t0_kref+0x42c4:   	fnot1s	%f17, %f25
	.word	0x9bb60498	! t0_kref+0x42c8:   	fcmple32	%f24, %f24, %o5
	.word	0x81ac0acc	! t0_kref+0x42cc:   	fcmped	%fcc0, %f16, %f12
	.word	0x99a3884a	! t0_kref+0x42d0:   	faddd	%f14, %f10, %f12
	.word	0xd856c018	! t0_kref+0x42d4:   	ldsh	[%i3 + %i0], %o4
	.word	0x91b406f4	! t0_kref+0x42d8:   	fmul8ulx16	%f16, %f20, %f8
	.word	0x98f0000d	! t0_kref+0x42dc:   	udivcc	%g0, %o5, %o4
	.word	0xd4567fe4	! t0_kref+0x42e0:   	ldsh	[%i1 - 0x1c], %o2
	.word	0xe8066014	! t0_kref+0x42e4:   	ld	[%i1 + 0x14], %l4
	.word	0xa1a01a50	! t0_kref+0x42e8:   	fdtoi	%f16, %f16
	.word	0x81ad0ad0	! t0_kref+0x42ec:   	fcmped	%fcc0, %f20, %f16
	.word	0x9da00039	! t0_kref+0x42f0:   	fmovs	%f25, %f14
	.word	0xd6264000	! t0_kref+0x42f4:   	st	%o3, [%i1]
	.word	0xe09e1000	! t0_kref+0x42f8:   	ldda	[%i0]0x80, %l0
	.word	0xd2470018	! t0_kref+0x42fc:   	ldsw	[%i4 + %i0], %o1
	.word	0xd0070019	! t0_kref+0x4300:   	ld	[%i4 + %i1], %o0
	.word	0xd2260000	! t0_kref+0x4304:   	st	%o1, [%i0]
	.word	0x81ae0a31	! t0_kref+0x4308:   	fcmps	%fcc0, %f24, %f17
	.word	0x28480005	! t0_kref+0x430c:   	bleu,a,pt	%icc, _kref+0x4320
	.word	0xf6267ff4	! t0_kref+0x4310:   	st	%i3, [%i1 - 0xc]
	.word	0xadb34329	! t0_kref+0x4314:   	bmask	%o5, %o1, %l6
	.word	0x91b64a77	! t0_kref+0x4318:   	fpadd32s	%f25, %f23, %f8
	.word	0x9da00031	! t0_kref+0x431c:   	fmovs	%f17, %f14
	.word	0x99b5c07b	! t0_kref+0x4320:   	edge8ln	%l7, %i3, %o4
	.word	0x900b0009	! t0_kref+0x4324:   	and	%o4, %o1, %o0
	.word	0x9db48c50	! t0_kref+0x4328:   	fnor	%f18, %f16, %f14
	.word	0xada208a9	! t0_kref+0x432c:   	fsubs	%f8, %f9, %f22
	.word	0x91a0054c	! t0_kref+0x4330:   	fsqrtd	%f12, %f8
	.word	0xb3a01888	! t0_kref+0x4334:   	fitos	%f8, %f25
	.word	0xafb5830c	! t0_kref+0x4338:   	alignaddr	%l6, %o4, %l7
	.word	0xa1b387ca	! t0_kref+0x433c:   	pdist	%f14, %f10, %f16
	.word	0x81ac8a52	! t0_kref+0x4340:   	fcmpd	%fcc0, %f18, %f18
	.word	0x3e800003	! t0_kref+0x4344:   	bvc,a	_kref+0x4350
	.word	0xa09b0017	! t0_kref+0x4348:   	xorcc	%o4, %l7, %l0
	.word	0xada00558	! t0_kref+0x434c:   	fsqrtd	%f24, %f22
	.word	0x3e480002	! t0_kref+0x4350:   	bvc,a,pt	%icc, _kref+0x4358
	.word	0x9da48d29	! t0_kref+0x4354:   	fsmuld	%f18, %f9, %f14
	.word	0x992d201e	! t0_kref+0x4358:   	sll	%l4, 0x1e, %o4
	.word	0x95a30d36	! t0_kref+0x435c:   	fsmuld	%f12, %f22, %f10
	.word	0x95a48834	! t0_kref+0x4360:   	fadds	%f18, %f20, %f10
	.word	0x8143e040	! t0_kref+0x4364:   	membar	0x40
	.word	0xa3400000	! t0_kref+0x4368:   	mov	%y, %l1
	.word	0xf1a0a024	! t0_kref+0x436c:   	sta	%f24, [%g2 + 0x24]%asi
	.word	0xada01896	! t0_kref+0x4370:   	fitos	%f22, %f22
	.word	0x36800003	! t0_kref+0x4374:   	bge,a	_kref+0x4380
	.word	0xada449af	! t0_kref+0x4378:   	fdivs	%f17, %f15, %f22
	.word	0xede8a084	! t0_kref+0x437c:   	prefetcha	%g2 + 0x84, 22
	.word	0x86102004	! t0_kref+0x4380:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x4384:   	bne,a	_kref+0x4384
	.word	0x86a0e001	! t0_kref+0x4388:   	subcc	%g3, 1, %g3
	.word	0xada0002a	! t0_kref+0x438c:   	fmovs	%f10, %f22
	.word	0x95b34668	! t0_kref+0x4390:   	fmul8x16au	%f13, %f8, %f10
	.word	0xde480019	! t0_kref+0x4394:   	ldsb	[%g0 + %i1], %o7
	.word	0xf1270018	! t0_kref+0x4398:   	st	%f24, [%i4 + %i0]
	.word	0xe290a016	! t0_kref+0x439c:   	lduha	[%g2 + 0x16]%asi, %l1
	.word	0xa6354008	! t0_kref+0x43a0:   	orn	%l5, %o0, %l3
	.word	0xa1a389d2	! t0_kref+0x43a4:   	fdivd	%f14, %f18, %f16
	.word	0xe4567ff6	! t0_kref+0x43a8:   	ldsh	[%i1 - 0xa], %l2
	.word	0xf6266000	! t0_kref+0x43ac:   	st	%i3, [%i1]
	.word	0x91a01891	! t0_kref+0x43b0:   	fitos	%f17, %f8
	.word	0x81ad8ac8	! t0_kref+0x43b4:   	fcmped	%fcc0, %f22, %f8
	.word	0xa615e259	! t0_kref+0x43b8:   	or	%l7, 0x259, %l3
	.word	0xe53e2000	! t0_kref+0x43bc:   	std	%f18, [%i0]
	.word	0x2120e85c	! t0_kref+0x43c0:   	sethi	%hi(0x83a17000), %l0
	.word	0x8143c000	! t0_kref+0x43c4:   	stbar
	.word	0x3a800002	! t0_kref+0x43c8:   	bcc,a	_kref+0x43d0
	.word	0xdd1fbcf8	! t0_kref+0x43cc:   	ldd	[%fp - 0x308], %f14
	.word	0x92db3b9a	! t0_kref+0x43d0:   	smulcc	%o4, -0x466, %o1
	.word	0x99b20f88	! t0_kref+0x43d4:   	for	%f8, %f8, %f12
	.word	0xa7b58c71	! t0_kref+0x43d8:   	fnors	%f22, %f17, %f19
	.word	0xa7a01888	! t0_kref+0x43dc:   	fitos	%f8, %f19
	.word	0x95a8404c	! t0_kref+0x43e0:   	fmovdne	%fcc0, %f12, %f10
	.word	0xf56e401c	! t0_kref+0x43e4:   	prefetch	%i1 + %i4, 26
	.word	0xa0830016	! t0_kref+0x43e8:   	addcc	%o4, %l6, %l0
	.word	0x30480003	! t0_kref+0x43ec:   	ba,a,pt	%icc, _kref+0x43f8
	.word	0xe488a000	! t0_kref+0x43f0:   	lduba	[%g2]%asi, %l2
	.word	0x9325400a	! t0_kref+0x43f4:   	mulscc	%l5, %o2, %o1
	.word	0xe3262008	! t0_kref+0x43f8:   	st	%f17, [%i0 + 8]
	.word	0x81aa0ab9	! t0_kref+0x43fc:   	fcmpes	%fcc0, %f8, %f25
	.word	0x8143e040	! t0_kref+0x4400:   	membar	0x40
	.word	0xe1266000	! t0_kref+0x4404:   	st	%f16, [%i1]
	.word	0x8143c000	! t0_kref+0x4408:   	stbar
	.word	0x2e480003	! t0_kref+0x440c:   	bvs,a,pt	%icc, _kref+0x4418
	.word	0xea200019	! t0_kref+0x4410:   	st	%l5, [%g0 + %i1]
	.word	0x91a40848	! t0_kref+0x4414:   	faddd	%f16, %f8, %f8
	.word	0xf42e001a	! t0_kref+0x4418:   	stb	%i2, [%i0 + %i2]
	.word	0x2a480002	! t0_kref+0x441c:   	bcs,a,pt	%icc, _kref+0x4424
	.word	0xc1086342	! t0_kref+0x4420:   	ld	[%g1 + 0x342], %fsr
	.word	0xef6e7fe0	! t0_kref+0x4424:   	prefetch	%i1 - 0x20, 23
	.word	0x99a000ac	! t0_kref+0x4428:   	fnegs	%f12, %f12
	.word	0x3c800003	! t0_kref+0x442c:   	bpos,a	_kref+0x4438
	.word	0xe8562002	! t0_kref+0x4430:   	ldsh	[%i0 + 2], %l4
	.word	0xa5b30ed2	! t0_kref+0x4434:   	fornot2	%f12, %f18, %f18
	.word	0xadb58d31	! t0_kref+0x4438:   	fandnot1s	%f22, %f17, %f22
	.word	0xe210a010	! t0_kref+0x443c:   	lduh	[%g2 + 0x10], %l1
	.word	0x28480006	! t0_kref+0x4440:   	bleu,a,pt	%icc, _kref+0x4458
	.word	0x99b00cce	! t0_kref+0x4444:   	fnot2	%f14, %f12
	.word	0x251d7391	! t0_kref+0x4448:   	sethi	%hi(0x75ce4400), %l2
	.word	0xa5a0054e	! t0_kref+0x444c:   	fsqrtd	%f14, %f18
	.word	0xa7a01893	! t0_kref+0x4450:   	fitos	%f19, %f19
	.word	0xf13e001d	! t0_kref+0x4454:   	std	%f24, [%i0 + %i5]
	.word	0xd0563fec	! t0_kref+0x4458:   	ldsh	[%i0 - 0x14], %o0
	.word	0xed6e3ff8	! t0_kref+0x445c:   	prefetch	%i0 - 8, 22
	.word	0xe1be1854	! t0_kref+0x4460:   	stda	%f16, [%i0 + %l4]0xc2
	.word	0xd1861000	! t0_kref+0x4464:   	lda	[%i0]0x80, %f8
	.word	0xa5b48ef9	! t0_kref+0x4468:   	fornot2s	%f18, %f25, %f18
	.word	0xa88a8008	! t0_kref+0x446c:   	andcc	%o2, %o0, %l4
	.word	0xad2de006	! t0_kref+0x4470:   	sll	%l7, 0x6, %l6
	.word	0xa43d400d	! t0_kref+0x4474:   	xnor	%l5, %o5, %l2
	.word	0xaa150016	! t0_kref+0x4478:   	or	%l4, %l6, %l5
	sethi	%hi(1f), %o7
	jmpl	%o7+%lo(1f), %g1
	.empty
	.word	0x9e9264a4	! t0_kref+0x4484:   	orcc	%o1, 0x4a4, %o7
1:	.word	0xa7a3c830	! t0_kref+0x4488:   	fadds	%f15, %f16, %f19
	.word	0xa7a38836	! t0_kref+0x448c:   	fadds	%f14, %f22, %f19
	.word	0x34800008	! t0_kref+0x4490:   	bg,a	_kref+0x44b0
	.word	0xa3a01a2e	! t0_kref+0x4494:   	fstoi	%f14, %f17
	.word	0x92f56246	! t0_kref+0x4498:   	udivcc	%l5, 0x246, %o1
	.word	0x8143c000	! t0_kref+0x449c:   	stbar
	.word	0xada018c8	! t0_kref+0x44a0:   	fdtos	%f8, %f22
	.word	0x9128000a	! t0_kref+0x44a4:   	sll	%g0, %o2, %o0
	.word	0xea8e6003	! t0_kref+0x44a8:   	lduba	[%i1 + 3]%asi, %l5
	.word	0xeb200018	! t0_kref+0x44ac:   	st	%f21, [%g0 + %i0]
	.word	0x96124009	! t0_kref+0x44b0:   	or	%o1, %o1, %o3
	.word	0xd380a03c	! t0_kref+0x44b4:   	lda	[%g2 + 0x3c]%asi, %f9
	.word	0x9db38c58	! t0_kref+0x44b8:   	fnor	%f14, %f24, %f14
	.word	0x9413247d	! t0_kref+0x44bc:   	or	%o4, 0x47d, %o2
	.word	0xef260000	! t0_kref+0x44c0:   	st	%f23, [%i0]
	.word	0xae3eb393	! t0_kref+0x44c4:   	xnor	%i2, -0xc6d, %l7
	.word	0xe13e6008	! t0_kref+0x44c8:   	std	%f16, [%i1 + 8]
	.word	0x94d6b684	! t0_kref+0x44cc:   	umulcc	%i2, -0x97c, %o2
	.word	0x91b44638	! t0_kref+0x44d0:   	fmul8x16	%f17, %f24, %f8
	.word	0xef00a004	! t0_kref+0x44d4:   	ld	[%g2 + 4], %f23
	.word	0xa5b3858a	! t0_kref+0x44d8:   	fcmpgt32	%f14, %f10, %l2
	.word	0xd51e001d	! t0_kref+0x44dc:   	ldd	[%i0 + %i5], %f10
	.word	0x81ab0ab5	! t0_kref+0x44e0:   	fcmpes	%fcc0, %f12, %f21
	.word	0x9de3bfa0	! t0_kref+0x44e4:   	save	%sp, -0x60, %sp
	.word	0xb016c01c	! t0_kref+0x44e8:   	or	%i3, %i4, %i0
	.word	0x9bef6647	! t0_kref+0x44ec:   	restore	%i5, 0x647, %o5
	.word	0xa5a01a2a	! t0_kref+0x44f0:   	fstoi	%f10, %f18
	.word	0x95b50db5	! t0_kref+0x44f4:   	fxors	%f20, %f21, %f10
	.word	0x95a01a38	! t0_kref+0x44f8:   	fstoi	%f24, %f10
	.word	0xf100a014	! t0_kref+0x44fc:   	ld	[%g2 + 0x14], %f24
	.word	0xb1b00cc8	! t0_kref+0x4500:   	fnot2	%f8, %f24
	.word	0x1317c8c8	! t0_kref+0x4504:   	sethi	%hi(0x5f232000), %o1
	.word	0x92f5c015	! t0_kref+0x4508:   	udivcc	%l7, %l5, %o1
	.word	0xe1264000	! t0_kref+0x450c:   	st	%f16, [%i1]
	.word	0xe608a021	! t0_kref+0x4510:   	ldub	[%g2 + 0x21], %l3
	.word	0xed063fe0	! t0_kref+0x4514:   	ld	[%i0 - 0x20], %f22
	.word	0xa52b001b	! t0_kref+0x4518:   	sll	%o4, %i3, %l2
	.word	0x94b5000b	! t0_kref+0x451c:   	orncc	%l4, %o3, %o2
	.word	0xe380a010	! t0_kref+0x4520:   	lda	[%g2 + 0x10]%asi, %f17
	.word	0xaeb2c016	! t0_kref+0x4524:   	orncc	%o3, %l6, %l7
	.word	0xa03d401a	! t0_kref+0x4528:   	xnor	%l5, %i2, %l0
	.word	0x96122970	! t0_kref+0x452c:   	or	%o0, 0x970, %o3
	.word	0x9aa6e024	! t0_kref+0x4530:   	subcc	%i3, 0x24, %o5
	.word	0xa9b0034a	! t0_kref+0x4534:   	alignaddrl	%g0, %o2, %l4
	.word	0xabb5032c	! t0_kref+0x4538:   	bmask	%l4, %o4, %l5
	.word	0xfd6e401c	! t0_kref+0x453c:   	prefetch	%i1 + %i4, 30
	.word	0x9425801b	! t0_kref+0x4540:   	sub	%l6, %i3, %o2
	.word	0x9ba64836	! t0_kref+0x4544:   	fadds	%f25, %f22, %f13
	.word	0xb1a9004e	! t0_kref+0x4548:   	fmovdl	%fcc0, %f14, %f24
	.word	0xe05e7ff0	! t0_kref+0x454c:   	ldx	[%i1 - 0x10], %l0
	.word	0xa1b48e37	! t0_kref+0x4550:   	fands	%f18, %f23, %f16
	.word	0xf436001b	! t0_kref+0x4554:   	sth	%i2, [%i0 + %i3]
	.word	0x99a389ce	! t0_kref+0x4558:   	fdivd	%f14, %f14, %f12
	.word	0x91400000	! t0_kref+0x455c:   	mov	%y, %o0
	.word	0x23480005	! t0_kref+0x4560:   	fbne,a,pt	%fcc0, _kref+0x4574
	.word	0xd87f0005	! t0_kref+0x4564:   	swap	[%i4 + %g5], %o4
	.word	0x36800003	! t0_kref+0x4568:   	bge,a	_kref+0x4574
	.word	0x81dc7cf8	! t0_kref+0x456c:   	flush	%l1 - 0x308
	.word	0x3e480005	! t0_kref+0x4570:   	bvc,a,pt	%icc, _kref+0x4584
	.word	0xe89e501d	! t0_kref+0x4574:   	ldda	[%i1 + %i5]0x80, %l4
	.word	0x81ac0aaa	! t0_kref+0x4578:   	fcmpes	%fcc0, %f16, %f10
	.word	0xe56e001a	! t0_kref+0x457c:   	prefetch	%i0 + %i2, 18
	.word	0x968d70a9	! t0_kref+0x4580:   	andcc	%l5, -0xf57, %o3
	.word	0xd3200018	! t0_kref+0x4584:   	st	%f9, [%g0 + %i0]
	.word	0x86102001	! t0_kref+0x4588:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x458c:   	bne,a	_kref+0x458c
	.word	0x86a0e001	! t0_kref+0x4590:   	subcc	%g3, 1, %g3
	.word	0x9aaec017	! t0_kref+0x4594:   	andncc	%i3, %l7, %o5
	.word	0x3b800008	! t0_kref+0x4598:   	fble,a	_kref+0x45b8
	.word	0xe8262004	! t0_kref+0x459c:   	st	%l4, [%i0 + 4]
	.word	0x233d61ec	! t0_kref+0x45a0:   	sethi	%hi(0xf587b000), %l1
	.word	0xdf00a03c	! t0_kref+0x45a4:   	ld	[%g2 + 0x3c], %f15
	.word	0x992d4015	! t0_kref+0x45a8:   	sll	%l5, %l5, %o4
	.word	0x8585e5d9	! t0_kref+0x45ac:   	wr	%l7, 0x5d9, %ccr
	.word	0x93120000	! t0_kref+0x45b0:   	taddcctv	%o0, %g0, %o1
	.word	0xeba0a02c	! t0_kref+0x45b4:   	sta	%f21, [%g2 + 0x2c]%asi
	.word	0xe81e401d	! t0_kref+0x45b8:   	ldd	[%i1 + %i5], %l4
	.word	0xec564000	! t0_kref+0x45bc:   	ldsh	[%i1], %l6
	.word	0xc368a00c	! t0_kref+0x45c0:   	prefetch	%g2 + 0xc, 1
	.word	0xad400000	! t0_kref+0x45c4:   	mov	%y, %l6
	.word	0xaeb2bb9e	! t0_kref+0x45c8:   	orncc	%o2, -0x462, %l7
	.word	0xd84e0000	! t0_kref+0x45cc:   	ldsb	[%i0], %o4
	.word	0xadb4044c	! t0_kref+0x45d0:   	fcmpne16	%f16, %f12, %l6
	.word	0x87802082	! t0_kref+0x45d4:   	mov	0x82, %asi
	.word	0x9a25ab7c	! t0_kref+0x45d8:   	sub	%l6, 0xb7c, %o5
	.word	0x9da38858	! t0_kref+0x45dc:   	faddd	%f14, %f24, %f14
	.word	0xd1070019	! t0_kref+0x45e0:   	ld	[%i4 + %i1], %f8
	.word	0xa12b200c	! t0_kref+0x45e4:   	sll	%o4, 0xc, %l0
	.word	0xeb070018	! t0_kref+0x45e8:   	ld	[%i4 + %i0], %f21
	.word	0xa5a28858	! t0_kref+0x45ec:   	faddd	%f10, %f24, %f18
	.word	0xa1a01033	! t0_kref+0x45f0:   	fstox	%f19, %f16
	.word	0x2a480003	! t0_kref+0x45f4:   	bcs,a,pt	%icc, _kref+0x4600
	.word	0xe11f4019	! t0_kref+0x45f8:   	ldd	[%i5 + %i1], %f16
	.word	0x95a5cd2e	! t0_kref+0x45fc:   	fsmuld	%f23, %f14, %f10
	.word	0xdd3e6010	! t0_kref+0x4600:   	std	%f14, [%i1 + 0x10]
	.word	0x17107869	! t0_kref+0x4604:   	sethi	%hi(0x41e1a400), %o3
	.word	0x81ac8ad6	! t0_kref+0x4608:   	fcmped	%fcc0, %f18, %f22
	.word	0xa1a6094c	! t0_kref+0x460c:   	fmuld	%f24, %f12, %f16
	.word	0xda062018	! t0_kref+0x4610:   	ld	[%i0 + 0x18], %o5
	.word	0x9a856c9b	! t0_kref+0x4614:   	addcc	%l5, 0xc9b, %o5
	.word	0x99b4098c	! t0_kref+0x4618:   	bshuffle	%f16, %f12, %f12
	.word	0x9ba01a54	! t0_kref+0x461c:   	fdtoi	%f20, %f13
	.word	0x9226e778	! t0_kref+0x4620:   	sub	%i3, 0x778, %o1
	.word	0xaa26801a	! t0_kref+0x4624:   	sub	%i2, %i2, %l5
	.word	0xa8558015	! t0_kref+0x4628:   	umul	%l6, %l5, %l4
	.word	0xe36e001a	! t0_kref+0x462c:   	prefetch	%i0 + %i2, 17
	.word	0xaafa801b	! t0_kref+0x4630:   	sdivcc	%o2, %i3, %l5
	.word	0x8143c000	! t0_kref+0x4634:   	stbar
	.word	0xecdf5018	! t0_kref+0x4638:   	ldxa	[%i5 + %i0]0x80, %l6
	.word	0xa5a01a35	! t0_kref+0x463c:   	fstoi	%f21, %f18
	.word	0xa20d800c	! t0_kref+0x4640:   	and	%l6, %o4, %l1
	.word	0xd8ee5000	! t0_kref+0x4644:   	ldstuba	[%i1]0x80, %o4
	.word	0x9da0192d	! t0_kref+0x4648:   	fstod	%f13, %f14
	.word	0x9a9b7bbe	! t0_kref+0x464c:   	xorcc	%o5, -0x442, %o5
	.word	0x9db4862c	! t0_kref+0x4650:   	fmul8x16	%f18, %f12, %f14
	.word	0x86102010	! t0_kref+0x4654:   	mov	0x10, %g3
	.word	0x86a0e001	! t0_kref+0x4658:   	subcc	%g3, 1, %g3
	.word	0x2280000c	! t0_kref+0x465c:   	be,a	_kref+0x468c
	.word	0xb3b38cab	! t0_kref+0x4660:   	fandnot2s	%f14, %f11, %f25
	.word	0xeb68a086	! t0_kref+0x4664:   	prefetch	%g2 + 0x86, 21
	.word	0x9203000b	! t0_kref+0x4668:   	add	%o4, %o3, %o1
	.word	0xa4bac000	! t0_kref+0x466c:   	xnorcc	%o3, %g0, %l2
	.word	0xef6e2010	! t0_kref+0x4670:   	prefetch	%i0 + 0x10, 23
	.word	0x294ffff9	! t0_kref+0x4674:   	fbl,a,pt	%fcc0, _kref+0x4658
	.word	0x9fa01a2f	! t0_kref+0x4678:   	fstoi	%f15, %f15
	.word	0xdb263ff8	! t0_kref+0x467c:   	st	%f13, [%i0 - 8]
	.word	0xa115800c	! t0_kref+0x4680:   	taddcctv	%l6, %o4, %l0
	.word	0x9af56737	! t0_kref+0x4684:   	udivcc	%l5, 0x737, %o5
	.word	0x2d08e6c4	! t0_kref+0x4688:   	sethi	%hi(0x239b1000), %l6
	.word	0x99a648b9	! t0_kref+0x468c:   	fsubs	%f25, %f25, %f12
	.word	0xecce9019	! t0_kref+0x4690:   	ldsba	[%i2 + %i1]0x80, %l6
	.word	0xe250a038	! t0_kref+0x4694:   	ldsh	[%g2 + 0x38], %l1
	.word	0x9fa01a54	! t0_kref+0x4698:   	fdtoi	%f20, %f15
	.word	0xaba3882a	! t0_kref+0x469c:   	fadds	%f14, %f10, %f21
	.word	0xdd3e4000	! t0_kref+0x46a0:   	std	%f14, [%i1]
	.word	0x9bb304ca	! t0_kref+0x46a4:   	fcmpne32	%f12, %f10, %o5
	.word	0xaf44c000	! t0_kref+0x46a8:   	mov	%gsr, %l7
	.word	0xa8a30008	! t0_kref+0x46ac:   	subcc	%o4, %o0, %l4
	.word	0xe826401c	! t0_kref+0x46b0:   	st	%l4, [%i1 + %i4]
	.word	0xd4363fe6	! t0_kref+0x46b4:   	sth	%o2, [%i0 - 0x1a]
	.word	0x28480005	! t0_kref+0x46b8:   	bleu,a,pt	%icc, _kref+0x46cc
	.word	0xd6066014	! t0_kref+0x46bc:   	ld	[%i1 + 0x14], %o3
	.word	0x95b20f69	! t0_kref+0x46c0:   	fornot1s	%f8, %f9, %f10
	.word	0x33800006	! t0_kref+0x46c4:   	fbe,a	_kref+0x46dc
	.word	0xa5a3082e	! t0_kref+0x46c8:   	fadds	%f12, %f14, %f18
	.word	0x9885400d	! t0_kref+0x46cc:   	addcc	%l5, %o5, %o4
	.word	0xa8f3000a	! t0_kref+0x46d0:   	udivcc	%o4, %o2, %l4
	.word	0x90100009	! t0_kref+0x46d4:   	mov	%o1, %o0
	.word	0xd1be5a5d	! t0_kref+0x46d8:   	stda	%f8, [%i1 + %i5]0xd2
	.word	0xa1b00ced	! t0_kref+0x46dc:   	fnot2s	%f13, %f16
	.word	0xe0180018	! t0_kref+0x46e0:   	ldd	[%g0 + %i0], %l0
	.word	0xda40a024	! t0_kref+0x46e4:   	ldsw	[%g2 + 0x24], %o5
	.word	0xa722b226	! t0_kref+0x46e8:   	mulscc	%o2, -0xdda, %l3
	.word	0x90b2ab0f	! t0_kref+0x46ec:   	orncc	%o2, 0xb0f, %o0
	.word	0x99a00035	! t0_kref+0x46f0:   	fmovs	%f21, %f12
	.word	0x992ac01b	! t0_kref+0x46f4:   	sll	%o3, %i3, %o4
	.word	0xe5be1000	! t0_kref+0x46f8:   	stda	%f18, [%i0]0x80
	.word	0xd4262004	! t0_kref+0x46fc:   	st	%o2, [%i0 + 4]
	.word	0x91a0108a	! t0_kref+0x4700:   	fxtos	%f10, %f8
	.word	0xd6270018	! t0_kref+0x4704:   	st	%o3, [%i4 + %i0]
	.word	0xed3e0000	! t0_kref+0x4708:   	std	%f22, [%i0]
	.word	0xc1086392	! t0_kref+0x470c:   	ld	[%g1 + 0x392], %fsr
	.word	0x92b6801b	! t0_kref+0x4710:   	orncc	%i2, %i3, %o1
	.word	0xd706200c	! t0_kref+0x4714:   	ld	[%i0 + 0xc], %f11
	.word	0x93a01a4c	! t0_kref+0x4718:   	fdtoi	%f12, %f9
	.word	0xa1b2ca69	! t0_kref+0x471c:   	fpadd32s	%f11, %f9, %f16
	.word	0x9da01928	! t0_kref+0x4720:   	fstod	%f8, %f14
	.word	0xa4fb7d45	! t0_kref+0x4724:   	sdivcc	%o5, -0x2bb, %l2
	.word	0xf6f01019	! t0_kref+0x4728:   	stxa	%i3, [%g0 + %i1]0x80
	.word	0xd2264000	! t0_kref+0x472c:   	st	%o1, [%i1]
	.word	0x9a458008	! t0_kref+0x4730:   	addc	%l6, %o0, %o5
	.word	0x94124014	! t0_kref+0x4734:   	or	%o1, %l4, %o2
	.word	0xaf2d6003	! t0_kref+0x4738:   	sll	%l5, 0x3, %l7
	.word	0x21800005	! t0_kref+0x473c:   	fbn,a	_kref+0x4750
	.word	0x99a018d0	! t0_kref+0x4740:   	fdtos	%f16, %f12
	.word	0x31800002	! t0_kref+0x4744:   	fba,a	_kref+0x474c
	.word	0xea366002	! t0_kref+0x4748:   	sth	%l5, [%i1 + 2]
	.word	0x31480003	! t0_kref+0x474c:   	fba,a,pt	%fcc0, _kref+0x4758
	.word	0xecee9019	! t0_kref+0x4750:   	ldstuba	[%i2 + %i1]0x80, %l6
	.word	0xa40d4008	! t0_kref+0x4754:   	and	%l5, %o0, %l2
	.word	0x9a8da3e4	! t0_kref+0x4758:   	andcc	%l6, 0x3e4, %o5
	.word	0x94152cb9	! t0_kref+0x475c:   	or	%l4, 0xcb9, %o2
	.word	0xec6e601b	! t0_kref+0x4760:   	ldstub	[%i1 + 0x1b], %l6
	.word	0x9aab0009	! t0_kref+0x4764:   	andncc	%o4, %o1, %o5
	.word	0xda4e001a	! t0_kref+0x4768:   	ldsb	[%i0 + %i2], %o5
	.word	0x86102003	! t0_kref+0x476c:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x4770:   	bne,a	_kref+0x4770
	.word	0x86a0e001	! t0_kref+0x4774:   	subcc	%g3, 1, %g3
	.word	0xb3a388b1	! t0_kref+0x4778:   	fsubs	%f14, %f17, %f25
	.word	0xf9ee501a	! t0_kref+0x477c:   	prefetcha	%i1 + %i2, 28
	.word	0x91227567	! t0_kref+0x4780:   	mulscc	%o1, -0xa99, %o0
	.word	0xa5a000d2	! t0_kref+0x4784:   	fnegd	%f18, %f18
	.word	0x9db48f96	! t0_kref+0x4788:   	for	%f18, %f22, %f14
	.word	0x81580000	! t0_kref+0x478c:   	flushw
	.word	0xec40a024	! t0_kref+0x4790:   	ldsw	[%g2 + 0x24], %l6
	.word	0x91a01a4c	! t0_kref+0x4794:   	fdtoi	%f12, %f8
	.word	0x92837820	! t0_kref+0x4798:   	addcc	%o5, -0x7e0, %o1
	.word	0x20480008	! t0_kref+0x479c:   	bn,a,pt	%icc, _kref+0x47bc
	.word	0xa5253470	! t0_kref+0x47a0:   	mulscc	%l4, -0xb90, %l2
	.word	0x913a6002	! t0_kref+0x47a4:   	sra	%o1, 0x2, %o0
	.word	0x3a480004	! t0_kref+0x47a8:   	bcc,a,pt	%icc, _kref+0x47b8
	.word	0xadb58c4c	! t0_kref+0x47ac:   	fnor	%f22, %f12, %f22
	.word	0x9da0054a	! t0_kref+0x47b0:   	fsqrtd	%f10, %f14
	.word	0x81ab8a32	! t0_kref+0x47b4:   	fcmps	%fcc0, %f14, %f18
	.word	0xa9a01938	! t0_kref+0x47b8:   	fstod	%f24, %f20
	.word	0xb1a2894c	! t0_kref+0x47bc:   	fmuld	%f10, %f12, %f24
	.word	0x99a0192c	! t0_kref+0x47c0:   	fstod	%f12, %f12
	.word	0xe3e65000	! t0_kref+0x47c4:   	casa	[%i1]0x80, %g0, %l1
	.word	0x9da389b4	! t0_kref+0x47c8:   	fdivs	%f14, %f20, %f14
	.word	0x8143c000	! t0_kref+0x47cc:   	stbar
	.word	0xada00535	! t0_kref+0x47d0:   	fsqrts	%f21, %f22
	.word	0xe44e8018	! t0_kref+0x47d4:   	ldsb	[%i2 + %i0], %l2
	.word	0x9db286f6	! t0_kref+0x47d8:   	fmul8ulx16	%f10, %f22, %f14
	.word	0xeff65015	! t0_kref+0x47dc:   	casxa	[%i1]0x80, %l5, %l7
	.word	0xe056201e	! t0_kref+0x47e0:   	ldsh	[%i0 + 0x1e], %l0
	.word	0x9e13400c	! t0_kref+0x47e4:   	or	%o5, %o4, %o7
	.word	0xf207bfe0	! t0_kref+0x47e8:   	ld	[%fp - 0x20], %i1
	.word	0xd1a6501c	! t0_kref+0x47ec:   	sta	%f8, [%i1 + %i4]0x80
	.word	0x15115858	! t0_kref+0x47f0:   	sethi	%hi(0x45616000), %o2
	.word	0x2a800003	! t0_kref+0x47f4:   	bcs,a	_kref+0x4800
	.word	0xada0192d	! t0_kref+0x47f8:   	fstod	%f13, %f22
	.word	0xe400a018	! t0_kref+0x47fc:   	ld	[%g2 + 0x18], %l2
	.word	0x9b660016	! t0_kref+0x4800:   	mova	%icc, %l6, %o5
	call	1f
	.empty
	.word	0xaedd3dbb	! t0_kref+0x4808:   	smulcc	%l4, -0x245, %l7
1:	.word	0x9db3cdb6	! t0_kref+0x480c:   	fxors	%f15, %f22, %f14
	.word	0xe410a008	! t0_kref+0x4810:   	lduh	[%g2 + 8], %l2
	.word	0x32480006	! t0_kref+0x4814:   	bne,a,pt	%icc, _kref+0x482c
	.word	0x95b40d0e	! t0_kref+0x4818:   	fandnot1	%f16, %f14, %f10
	.word	0xc36e001b	! t0_kref+0x481c:   	prefetch	%i0 + %i3, 1
	.word	0xee4e601b	! t0_kref+0x4820:   	ldsb	[%i1 + 0x1b], %l7
	.word	0xa9a58950	! t0_kref+0x4824:   	fmuld	%f22, %f16, %f20
	.word	0xd24e6012	! t0_kref+0x4828:   	ldsb	[%i1 + 0x12], %o1
	.word	0xd420a010	! t0_kref+0x482c:   	st	%o2, [%g2 + 0x10]
	.word	0xe53e6010	! t0_kref+0x4830:   	std	%f18, [%i1 + 0x10]
	.word	0xf456c005	! t0_kref+0x4834:   	ldsh	[%i3 + %g5], %i2
	.word	0x22800008	! t0_kref+0x4838:   	be,a	_kref+0x4858
	.word	0x942d000b	! t0_kref+0x483c:   	andn	%l4, %o3, %o2
	.word	0x3f800003	! t0_kref+0x4840:   	fbo,a	_kref+0x484c
	.word	0xe168a00c	! t0_kref+0x4844:   	prefetch	%g2 + 0xc, 16
	.word	0xa4202077	! t0_kref+0x4848:   	sub	%g0, 0x77, %l2
	.word	0xe0563fea	! t0_kref+0x484c:   	ldsh	[%i0 - 0x16], %l0
	.word	0xd650a000	! t0_kref+0x4850:   	ldsh	[%g2], %o3
	.word	0x9ab5001a	! t0_kref+0x4854:   	orncc	%l4, %i2, %o5
	.word	0x90134009	! t0_kref+0x4858:   	or	%o5, %o1, %o0
	.word	0x3c480006	! t0_kref+0x485c:   	bpos,a,pt	%icc, _kref+0x4874
	.word	0xeb00a004	! t0_kref+0x4860:   	ld	[%g2 + 4], %f21
	.word	0x962b401b	! t0_kref+0x4864:   	andn	%o5, %i3, %o3
	.word	0xe526200c	! t0_kref+0x4868:   	st	%f18, [%i0 + 0xc]
	.word	0x8143c000	! t0_kref+0x486c:   	stbar
	.word	0xf1262018	! t0_kref+0x4870:   	st	%f24, [%i0 + 0x18]
	.word	0xfbee501c	! t0_kref+0x4874:   	prefetcha	%i1 + %i4, 29
	.word	0xd19e1a1a	! t0_kref+0x4878:   	ldda	[%i0 + %i2]0xd0, %f8
	.word	0x86102002	! t0_kref+0x487c:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x4880:   	bne,a	_kref+0x4880
	.word	0x86a0e001	! t0_kref+0x4884:   	subcc	%g3, 1, %g3
	.word	0x81accab4	! t0_kref+0x4888:   	fcmpes	%fcc0, %f19, %f20
	.word	0xda280019	! t0_kref+0x488c:   	stb	%o5, [%g0 + %i1]
	.word	0x99a50833	! t0_kref+0x4890:   	fadds	%f20, %f19, %f12
	.word	0xe1bf5018	! t0_kref+0x4894:   	stda	%f16, [%i5 + %i0]0x80
	.word	0xa5b50e56	! t0_kref+0x4898:   	fxnor	%f20, %f22, %f18
	.word	0xa1a60d38	! t0_kref+0x489c:   	fsmuld	%f24, %f24, %f16
	.word	0x2c800008	! t0_kref+0x48a0:   	bneg,a	_kref+0x48c0
	.word	0xc0b6d019	! t0_kref+0x48a4:   	stha	%g0, [%i3 + %i1]0x80
	.word	0x3a800005	! t0_kref+0x48a8:   	bcc,a	_kref+0x48bc
	.word	0x99a609d2	! t0_kref+0x48ac:   	fdivd	%f24, %f18, %f12
	.word	0xde40a030	! t0_kref+0x48b0:   	ldsw	[%g2 + 0x30], %o7
	.word	0xa03b000b	! t0_kref+0x48b4:   	xnor	%o4, %o3, %l0
	.word	0x97a208b0	! t0_kref+0x48b8:   	fsubs	%f8, %f16, %f11
	.word	0xdf00a038	! t0_kref+0x48bc:   	ld	[%g2 + 0x38], %f15
	.word	0xa5a28848	! t0_kref+0x48c0:   	faddd	%f10, %f8, %f18
	.word	0xc06e401a	! t0_kref+0x48c4:   	ldstub	[%i1 + %i2], %g0
	.word	0xa9b300ca	! t0_kref+0x48c8:   	edge16l	%o4, %o2, %l4
	.word	0xc0260000	! t0_kref+0x48cc:   	clr	[%i0]
	.word	0xf9ee101b	! t0_kref+0x48d0:   	prefetcha	%i0 + %i3, 28
	.word	0x8143c000	! t0_kref+0x48d4:   	stbar
	.word	0xec2e8019	! t0_kref+0x48d8:   	stb	%l6, [%i2 + %i1]
	.word	0xc028a00b	! t0_kref+0x48dc:   	clrb	[%g2 + 0xb]
	.word	0x81ae0ad6	! t0_kref+0x48e0:   	fcmped	%fcc0, %f24, %f22
	.word	0xd456200e	! t0_kref+0x48e4:   	ldsh	[%i0 + 0xe], %o2
	.word	0x9f26ebb6	! t0_kref+0x48e8:   	mulscc	%i3, 0xbb6, %o7
	.word	0xb1a34d29	! t0_kref+0x48ec:   	fsmuld	%f13, %f9, %f24
	.word	0x91a28852	! t0_kref+0x48f0:   	faddd	%f10, %f18, %f8
	.word	0x91a01a4c	! t0_kref+0x48f4:   	fdtoi	%f12, %f8
	.word	0xf56e001a	! t0_kref+0x48f8:   	prefetch	%i0 + %i2, 26
	.word	0xd11f4019	! t0_kref+0x48fc:   	ldd	[%i5 + %i1], %f8
	.word	0xb1a589d8	! t0_kref+0x4900:   	fdivd	%f22, %f24, %f24
	.word	0x9ab27f23	! t0_kref+0x4904:   	orncc	%o1, -0xdd, %o5
	.word	0xe6901019	! t0_kref+0x4908:   	lduha	[%g0 + %i1]0x80, %l3
	.word	0x36800001	! t0_kref+0x490c:   	bge,a	_kref+0x4910
	.word	0xa786800c	! t0_kref+0x4910:   	wr	%i2, %o4, %gsr
	.word	0xd0270018	! t0_kref+0x4914:   	st	%o0, [%i4 + %i0]
	.word	0x99a01929	! t0_kref+0x4918:   	fstod	%f9, %f12
	.word	0xc168a08e	! t0_kref+0x491c:   	prefetch	%g2 + 0x8e, 0
	.word	0xd66e6009	! t0_kref+0x4920:   	ldstub	[%i1 + 9], %o3
	.word	0x99a01a56	! t0_kref+0x4924:   	fdtoi	%f22, %f12
	.word	0x97a00029	! t0_kref+0x4928:   	fmovs	%f9, %f11
	.word	0x9de3bfa0	! t0_kref+0x492c:   	save	%sp, -0x60, %sp
	.word	0xba664018	! t0_kref+0x4930:   	subc	%i1, %i0, %i5
	.word	0x91ee0000	! t0_kref+0x4934:   	restore	%i0, %g0, %o0
	.word	0xf6264000	! t0_kref+0x4938:   	st	%i3, [%i1]
	.word	0xe040a020	! t0_kref+0x493c:   	ldsw	[%g2 + 0x20], %l0
	.word	0x9da34d33	! t0_kref+0x4940:   	fsmuld	%f13, %f19, %f14
	.word	0xa62ab70c	! t0_kref+0x4944:   	andn	%o2, -0x8f4, %l3
	.word	0x9da00539	! t0_kref+0x4948:   	fsqrts	%f25, %f14
	.word	0x26480001	! t0_kref+0x494c:   	bl,a,pt	%icc, _kref+0x4950
	.word	0x91a0192f	! t0_kref+0x4950:   	fstod	%f15, %f8
	.word	0xa5b30990	! t0_kref+0x4954:   	bshuffle	%f12, %f16, %f18
	.word	0x9da01929	! t0_kref+0x4958:   	fstod	%f9, %f14
	.word	0xd008a02b	! t0_kref+0x495c:   	ldub	[%g2 + 0x2b], %o0
	.word	0xe2560000	! t0_kref+0x4960:   	ldsh	[%i0], %l1
	.word	0xa48ec00a	! t0_kref+0x4964:   	andcc	%i3, %o2, %l2
	.word	0xd93e401d	! t0_kref+0x4968:   	std	%f12, [%i1 + %i5]
	.word	0x95a00039	! t0_kref+0x496c:   	fmovs	%f25, %f10
	.word	0xa9b304d2	! t0_kref+0x4970:   	fcmpne32	%f12, %f18, %l4
	.word	0xd8be101d	! t0_kref+0x4974:   	stda	%o4, [%i0 + %i5]0x80
	.word	0x22480006	! t0_kref+0x4978:   	be,a,pt	%icc, _kref+0x4990
	.word	0xe16e001d	! t0_kref+0x497c:   	prefetch	%i0 + %i5, 16
	.word	0x95a01a2f	! t0_kref+0x4980:   	fstoi	%f15, %f10
	.word	0xa806b67c	! t0_kref+0x4984:   	add	%i2, -0x984, %l4
	.word	0xe250a02a	! t0_kref+0x4988:   	ldsh	[%g2 + 0x2a], %l1
	.word	0xa2330017	! t0_kref+0x498c:   	orn	%o4, %l7, %l1
	.word	0x93b20590	! t0_kref+0x4990:   	fcmpgt32	%f8, %f16, %o1
	.word	0xe056600e	! t0_kref+0x4994:   	ldsh	[%i1 + 0xe], %l0
	.word	0x91a01a50	! t0_kref+0x4998:   	fdtoi	%f16, %f8
	.word	0xe2562004	! t0_kref+0x499c:   	ldsh	[%i0 + 4], %l1
	.word	0x9e750014	! t0_kref+0x49a0:   	udiv	%l4, %l4, %o7
	.word	0x97a01892	! t0_kref+0x49a4:   	fitos	%f18, %f11
	.word	0xdd00a028	! t0_kref+0x49a8:   	ld	[%g2 + 0x28], %f14
	.word	0xec20a034	! t0_kref+0x49ac:   	st	%l6, [%g2 + 0x34]
	.word	0xaba01890	! t0_kref+0x49b0:   	fitos	%f16, %f21
	.word	0xea260000	! t0_kref+0x49b4:   	st	%l5, [%i0]
	.word	0xada2482c	! t0_kref+0x49b8:   	fadds	%f9, %f12, %f22
	.word	0xaa26801b	! t0_kref+0x49bc:   	sub	%i2, %i3, %l5
	.word	0xa5b00cd8	! t0_kref+0x49c0:   	fnot2	%f24, %f18
	.word	0xd5f65008	! t0_kref+0x49c4:   	casxa	[%i1]0x80, %o0, %o2
	.word	0xd5be5000	! t0_kref+0x49c8:   	stda	%f10, [%i1]0x80
	.word	0x9e006550	! t0_kref+0x49cc:   	add	%g1, 0x550, %o7
!	.word	0x3280558b	! t0_kref+0x49d0:   	bne,a	SYM(t0_subr2)
	   	bne,a	SYM(t0_subr2)
	.word	0xd820a018	! t0_kref+0x49d4:   	st	%o4, [%g2 + 0x18]
	.word	0x21800004	! t0_kref+0x49d8:   	fbn,a	_kref+0x49e8
	.word	0x95a01110	! t0_kref+0x49dc:   	fxtod	%f16, %f10
	.word	0xc06e7fef	! t0_kref+0x49e0:   	ldstub	[%i1 - 0x11], %g0
	.word	0xe5ee501a	! t0_kref+0x49e4:   	prefetcha	%i1 + %i2, 18
	.word	0x96556fd7	! t0_kref+0x49e8:   	umul	%l5, 0xfd7, %o3
	.word	0x9db44aeb	! t0_kref+0x49ec:   	fpsub32s	%f17, %f11, %f14
	.word	0x9a16801b	! t0_kref+0x49f0:   	or	%i2, %i3, %o5
	.word	0xe7f61017	! t0_kref+0x49f4:   	casxa	[%i0]0x80, %l7, %l3
	.word	0x95b48598	! t0_kref+0x49f8:   	fcmpgt32	%f18, %f24, %o2
	.word	0xa9b50c4e	! t0_kref+0x49fc:   	fnor	%f20, %f14, %f20
	.word	0xa1b30f96	! t0_kref+0x4a00:   	for	%f12, %f22, %f16
	.word	0xa5b00fe0	! t0_kref+0x4a04:   	fones	%f18
	.word	0xadb00c00	! t0_kref+0x4a08:   	fzero	%f22
	.word	0xd720a004	! t0_kref+0x4a0c:   	st	%f11, [%g2 + 4]
	.word	0xd6064000	! t0_kref+0x4a10:   	ld	[%i1], %o3
	.word	0xd6263ff4	! t0_kref+0x4a14:   	st	%o3, [%i0 - 0xc]
	.word	0xd9be1889	! t0_kref+0x4a18:   	stda	%f12, [%i0 + %o1]0xc4
	.word	0xf3063ff8	! t0_kref+0x4a1c:   	ld	[%i0 - 8], %f25
	.word	0xa63a630c	! t0_kref+0x4a20:   	xnor	%o1, 0x30c, %l3
	.word	0xabb54de8	! t0_kref+0x4a24:   	fnands	%f21, %f8, %f21
	.word	0x86102003	! t0_kref+0x4a28:   	mov	0x3, %g3
	.word	0x86a0e001	! t0_kref+0x4a2c:   	subcc	%g3, 1, %g3
	.word	0x22800017	! t0_kref+0x4a30:   	be,a	_kref+0x4a8c
	.word	0xdf264000	! t0_kref+0x4a34:   	st	%f15, [%i1]
	.word	0xd1be589b	! t0_kref+0x4a38:   	stda	%f8, [%i1 + %i3]0xc4
	.word	0xaf2577f9	! t0_kref+0x4a3c:   	mulscc	%l5, -0x807, %l7
	.word	0x9b408000	! t0_kref+0x4a40:   	mov	%ccr, %o5
	.word	0x253495dd	! t0_kref+0x4a44:   	sethi	%hi(0xd2577400), %l2
	.word	0xabb34280	! t0_kref+0x4a48:   	array32	%o5, %g0, %l5
	.word	0xa940c000	! t0_kref+0x4a4c:   	mov	%asi, %l4
	.word	0xec500019	! t0_kref+0x4a50:   	ldsh	[%g0 + %i1], %l6
	.word	0xa9a20d39	! t0_kref+0x4a54:   	fsmuld	%f8, %f25, %f20
	.word	0x99a00533	! t0_kref+0x4a58:   	fsqrts	%f19, %f12
	.word	0xada00548	! t0_kref+0x4a5c:   	fsqrtd	%f8, %f22
	.word	0xe16e6018	! t0_kref+0x4a60:   	prefetch	%i1 + 0x18, 16
	.word	0xb3a01a4a	! t0_kref+0x4a64:   	fdtoi	%f10, %f25
	.word	0xd0567ffc	! t0_kref+0x4a68:   	ldsh	[%i1 - 4], %o0
	.word	0xa8582614	! t0_kref+0x4a6c:   	smul	%g0, 0x614, %l4
	.word	0x9695f4f4	! t0_kref+0x4a70:   	orcc	%l7, -0xb0c, %o3
	.word	0x244fffee	! t0_kref+0x4a74:   	ble,a,pt	%icc, _kref+0x4a2c
	.word	0xa2320009	! t0_kref+0x4a78:   	orn	%o0, %o1, %l1
	.word	0x20480004	! t0_kref+0x4a7c:   	bn,a,pt	%icc, _kref+0x4a8c
	.word	0x9da3cd2f	! t0_kref+0x4a80:   	fsmuld	%f15, %f15, %f14
	.word	0x9db407ca	! t0_kref+0x4a84:   	pdist	%f16, %f10, %f14
	.word	0x99b20ef2	! t0_kref+0x4a88:   	fornot2s	%f8, %f18, %f12
	.word	0xd11f4018	! t0_kref+0x4a8c:   	ldd	[%i5 + %i0], %f8
	.word	0x972a801b	! t0_kref+0x4a90:   	sll	%o2, %i3, %o3
	.word	0x99a000d6	! t0_kref+0x4a94:   	fnegd	%f22, %f12
	.word	0x9ab2000c	! t0_kref+0x4a98:   	orncc	%o0, %o4, %o5
	.word	0xaf12a9d8	! t0_kref+0x4a9c:   	taddcctv	%o2, 0x9d8, %l7
	.word	0xe5060000	! t0_kref+0x4aa0:   	ld	[%i0], %f18
	.word	0xf13e2018	! t0_kref+0x4aa4:   	std	%f24, [%i0 + 0x18]
	.word	0xee266018	! t0_kref+0x4aa8:   	st	%l7, [%i1 + 0x18]
	.word	0x2f800006	! t0_kref+0x4aac:   	fbu,a	_kref+0x4ac4
	.word	0x9a13400c	! t0_kref+0x4ab0:   	or	%o5, %o4, %o5
	.word	0xe019401d	! t0_kref+0x4ab4:   	ldd	[%g5 + %i5], %l0
	.word	0xa9a00131	! t0_kref+0x4ab8:   	fabss	%f17, %f20
	.word	0xf83e001d	! t0_kref+0x4abc:   	std	%i4, [%i0 + %i5]
	.word	0xd44e0000	! t0_kref+0x4ac0:   	ldsb	[%i0], %o2
	.word	0x95b286f6	! t0_kref+0x4ac4:   	fmul8ulx16	%f10, %f22, %f10
	.word	0x81ad0ac8	! t0_kref+0x4ac8:   	fcmped	%fcc0, %f20, %f8
	.word	0xc16e400d	! t0_kref+0x4acc:   	prefetch	%i1 + %o5, 0
	.word	0xed070018	! t0_kref+0x4ad0:   	ld	[%i4 + %i0], %f22
	.word	0xd636001b	! t0_kref+0x4ad4:   	sth	%o3, [%i0 + %i3]
	.word	0x91a00037	! t0_kref+0x4ad8:   	fmovs	%f23, %f8
	.word	0x8610200e	! t0_kref+0x4adc:   	mov	0xe, %g3
	.word	0x86a0e001	! t0_kref+0x4ae0:   	subcc	%g3, 1, %g3
	.word	0x22800005	! t0_kref+0x4ae4:   	be,a	_kref+0x4af8
	.word	0x9072641c	! t0_kref+0x4ae8:   	udiv	%o1, 0x41c, %o0
	.word	0xa013001b	! t0_kref+0x4aec:   	or	%o4, %i3, %l0
	.word	0x91a0188c	! t0_kref+0x4af0:   	fitos	%f12, %f8
	.word	0x81ae0a34	! t0_kref+0x4af4:   	fcmps	%fcc0, %f24, %f20
	.word	0xf11e3fe0	! t0_kref+0x4af8:   	ldd	[%i0 - 0x20], %f24
	.word	0x95b50e2f	! t0_kref+0x4afc:   	fands	%f20, %f15, %f10
	.word	0xd51e4000	! t0_kref+0x4b00:   	ldd	[%i1], %f10
	.word	0xa765a459	! t0_kref+0x4b04:   	movneg	%icc, -0x3a7, %l3
	.word	0x24480003	! t0_kref+0x4b08:   	ble,a,pt	%icc, _kref+0x4b14
	.word	0xa1b30c4e	! t0_kref+0x4b0c:   	fnor	%f12, %f14, %f16
	.word	0x99a01a33	! t0_kref+0x4b10:   	fstoi	%f19, %f12
	.word	0x81820000	! t0_kref+0x4b14:   	wr	%o0, %g0, %y
	.word	0x9bb38490	! t0_kref+0x4b18:   	fcmple32	%f14, %f16, %o5
	.word	0x81aa8ad8	! t0_kref+0x4b1c:   	fcmped	%fcc0, %f10, %f24
	.word	0xc1082f48	! t0_kref+0x4b20:   	ld	[%g0 + 0xf48], %fsr
	.word	0xa3a01a54	! t0_kref+0x4b24:   	fdtoi	%f20, %f17
	.word	0xa233211d	! t0_kref+0x4b28:   	orn	%o4, 0x11d, %l1
	.word	0x95a0004e	! t0_kref+0x4b2c:   	fmovd	%f14, %f10
	.word	0xb1b2096f	! t0_kref+0x4b30:   	fpmerge	%f8, %f15, %f24
	.word	0x9eb336a2	! t0_kref+0x4b34:   	orncc	%o4, -0x95e, %o7
	.word	0x37800004	! t0_kref+0x4b38:   	fbge,a	_kref+0x4b48
	.word	0xa32a8015	! t0_kref+0x4b3c:   	sll	%o2, %l5, %l1
	.word	0xc0363ff4	! t0_kref+0x4b40:   	clrh	[%i0 - 0xc]
	.word	0x26800001	! t0_kref+0x4b44:   	bl,a	_kref+0x4b48
	.word	0x9da40839	! t0_kref+0x4b48:   	fadds	%f16, %f25, %f14
	.word	0xeb20a008	! t0_kref+0x4b4c:   	st	%f21, [%g2 + 8]
	.word	0x9203400c	! t0_kref+0x4b50:   	add	%o5, %o4, %o1
	.word	0xa5b60a8c	! t0_kref+0x4b54:   	fpsub16	%f24, %f12, %f18
	.word	0x3a480002	! t0_kref+0x4b58:   	bcc,a,pt	%icc, _kref+0x4b60
	.word	0xf4f75018	! t0_kref+0x4b5c:   	stxa	%i2, [%i5 + %i0]0x80
	.word	0x9ba01a30	! t0_kref+0x4b60:   	fstoi	%f16, %f13
	.word	0x9ba589aa	! t0_kref+0x4b64:   	fdivs	%f22, %f10, %f13
	.word	0xe400a000	! t0_kref+0x4b68:   	ld	[%g2], %l2
	.word	0x9fb38414	! t0_kref+0x4b6c:   	fcmple16	%f14, %f20, %o7
	.word	0xec4e8019	! t0_kref+0x4b70:   	ldsb	[%i2 + %i1], %l6
	.word	0x903ec016	! t0_kref+0x4b74:   	xnor	%i3, %l6, %o0
	.word	0x94950008	! t0_kref+0x4b78:   	orcc	%l4, %o0, %o2
	.word	0xa1a01a29	! t0_kref+0x4b7c:   	fstoi	%f9, %f16
	.word	0x9f0b7c78	! t0_kref+0x4b80:   	tsubcc	%o5, -0x388, %o7
	.word	0xd4270019	! t0_kref+0x4b84:   	st	%o2, [%i4 + %i1]
	.word	0x9db407d8	! t0_kref+0x4b88:   	pdist	%f16, %f24, %f14
	.word	0x9676ec08	! t0_kref+0x4b8c:   	udiv	%i3, 0xc08, %o3
	.word	0x81ae0ad2	! t0_kref+0x4b90:   	fcmped	%fcc0, %f24, %f18
	.word	0xa52d601c	! t0_kref+0x4b94:   	sll	%l5, 0x1c, %l2
	.word	0x963a4000	! t0_kref+0x4b98:   	not	%o1, %o3
	.word	0xec00a02c	! t0_kref+0x4b9c:   	ld	[%g2 + 0x2c], %l6
	.word	0xe91e001d	! t0_kref+0x4ba0:   	ldd	[%i0 + %i5], %f20
	.word	0xe66e7ff5	! t0_kref+0x4ba4:   	ldstub	[%i1 - 0xb], %l3
	.word	0x95a01a30	! t0_kref+0x4ba8:   	fstoi	%f16, %f10
	.word	0xaba0012d	! t0_kref+0x4bac:   	fabss	%f13, %f21
	.word	0x913ec014	! t0_kref+0x4bb0:   	sra	%i3, %l4, %o0
	.word	0x25800002	! t0_kref+0x4bb4:   	fblg,a	_kref+0x4bbc
	.word	0xadb4cc68	! t0_kref+0x4bb8:   	fnors	%f19, %f8, %f22
	.word	0x9825c00b	! t0_kref+0x4bbc:   	sub	%l7, %o3, %o4
	.word	0x95b58240	! t0_kref+0x4bc0:   	array16	%l6, %g0, %o2
	.word	0xa9a0052d	! t0_kref+0x4bc4:   	fsqrts	%f13, %f20
	.word	0xe64e7fe6	! t0_kref+0x4bc8:   	ldsb	[%i1 - 0x1a], %l3
	.word	0xd830001b	! t0_kref+0x4bcc:   	sth	%o4, [%g0 + %i3]
	.word	0xa5a28834	! t0_kref+0x4bd0:   	fadds	%f10, %f20, %f18
	.word	0x8d86ea37	! t0_kref+0x4bd4:   	wr	%i3, 0xa37, %fprs
	.word	0x9de3bfa0	! t0_kref+0x4bd8:   	save	%sp, -0x60, %sp
	.word	0xa1ee001d	! t0_kref+0x4bdc:   	restore	%i0, %i5, %l0
	.word	0x9db00cca	! t0_kref+0x4be0:   	fnot2	%f10, %f14
	.word	0x95a249b1	! t0_kref+0x4be4:   	fdivs	%f9, %f17, %f10
	.word	0xa1a409d0	! t0_kref+0x4be8:   	fdivd	%f16, %f16, %f16
	.word	0x81ac0ad6	! t0_kref+0x4bec:   	fcmped	%fcc0, %f16, %f22
	.word	0xa1a0102d	! t0_kref+0x4bf0:   	fstox	%f13, %f16
	.word	0x272bf135	! t0_kref+0x4bf4:   	sethi	%hi(0xafc4d400), %l3
	.word	0x91a01a52	! t0_kref+0x4bf8:   	fdtoi	%f18, %f8
	.word	0x9da01110	! t0_kref+0x4bfc:   	fxtod	%f16, %f14
	.word	0xc868311e	! t0_kref+0x4c00:   	ldstub	[%g0 - 0xee2], %g4
	.word	0x9adead29	! t0_kref+0x4c04:   	smulcc	%i2, 0xd29, %o5
	.word	0x97b6c0d6	! t0_kref+0x4c08:   	edge16l	%i3, %l6, %o3
	.word	0xe64e4000	! t0_kref+0x4c0c:   	ldsb	[%i1], %l3
	.word	0x9856800d	! t0_kref+0x4c10:   	umul	%i2, %o5, %o4
	.word	0xc1ee1009	! t0_kref+0x4c14:   	prefetcha	%i0 + %o1, 0
	.word	0x95a58829	! t0_kref+0x4c18:   	fadds	%f22, %f9, %f10
	.word	0xaaf53e9e	! t0_kref+0x4c1c:   	udivcc	%l4, -0x162, %l5
	.word	0x9db2cab4	! t0_kref+0x4c20:   	fpsub16s	%f11, %f20, %f14
	.word	0x9db2896c	! t0_kref+0x4c24:   	fpmerge	%f10, %f12, %f14
	.word	0x91b28e2c	! t0_kref+0x4c28:   	fands	%f10, %f12, %f8
	.word	0x2e480008	! t0_kref+0x4c2c:   	bvs,a,pt	%icc, _kref+0x4c4c
	.word	0x933b4009	! t0_kref+0x4c30:   	sra	%o5, %o1, %o1
	.word	0x94b6b0ab	! t0_kref+0x4c34:   	orncc	%i2, -0xf55, %o2
	.word	0x2c480003	! t0_kref+0x4c38:   	bneg,a,pt	%icc, _kref+0x4c44
	.word	0x8143c000	! t0_kref+0x4c3c:   	stbar
	.word	0x81abca32	! t0_kref+0x4c40:   	fcmps	%fcc0, %f15, %f18
	.word	0x92383c2e	! t0_kref+0x4c44:   	xnor	%g0, -0x3d2, %o1
	.word	0xb1b00cd8	! t0_kref+0x4c48:   	fnot2	%f24, %f24
	.word	0x9a622f05	! t0_kref+0x4c4c:   	subc	%o0, 0xf05, %o5
	.word	0xe81e6000	! t0_kref+0x4c50:   	ldd	[%i1], %l4
	.word	0xed00a004	! t0_kref+0x4c54:   	ld	[%g2 + 4], %f22
	.word	0x9406800a	! t0_kref+0x4c58:   	add	%i2, %o2, %o2
	.word	0x81ab8a52	! t0_kref+0x4c5c:   	fcmpd	%fcc0, %f14, %f18
	.word	0xacd5658b	! t0_kref+0x4c60:   	umulcc	%l5, 0x58b, %l6
	.word	0xadb50992	! t0_kref+0x4c64:   	bshuffle	%f20, %f18, %f22
	.word	0xda40a010	! t0_kref+0x4c68:   	ldsw	[%g2 + 0x10], %o5
	.word	0x9fc00004	! t0_kref+0x4c6c:   	call	%g0 + %g4
	.word	0xf6b65000	! t0_kref+0x4c70:   	stha	%i3, [%i1]0x80
	.word	0xa9b28176	! t0_kref+0x4c74:   	edge32ln	%o2, %l6, %l4
	.word	0x39800008	! t0_kref+0x4c78:   	fbuge,a	_kref+0x4c98
	.word	0xa9a01919	! t0_kref+0x4c7c:   	fitod	%f25, %f20
	.word	0xec280019	! t0_kref+0x4c80:   	stb	%l6, [%g0 + %i1]
	.word	0x81ae4ab9	! t0_kref+0x4c84:   	fcmpes	%fcc0, %f25, %f25
	.word	0xe5ee501c	! t0_kref+0x4c88:   	prefetcha	%i1 + %i4, 18
	.word	0x2f800005	! t0_kref+0x4c8c:   	fbu,a	_kref+0x4ca0
	.word	0xe500a014	! t0_kref+0x4c90:   	ld	[%g2 + 0x14], %f18
	.word	0x9da488b3	! t0_kref+0x4c94:   	fsubs	%f18, %f19, %f14
	.word	0xec066018	! t0_kref+0x4c98:   	ld	[%i1 + 0x18], %l6
	.word	0xac26800c	! t0_kref+0x4c9c:   	sub	%i2, %o4, %l6
	.word	0xd126001c	! t0_kref+0x4ca0:   	st	%f8, [%i0 + %i4]
	.word	0xd9beda58	! t0_kref+0x4ca4:   	stda	%f12, [%i3 + %i0]0xd2
	.word	0x81aa0a31	! t0_kref+0x4ca8:   	fcmps	%fcc0, %f8, %f17
	.word	0xa9b387d6	! t0_kref+0x4cac:   	pdist	%f14, %f22, %f20
	.word	0xc12e3ff8	! t0_kref+0x4cb0:   	st	%fsr, [%i0 - 8]
	.word	0x9f2ac015	! t0_kref+0x4cb4:   	sll	%o3, %l5, %o7
	.word	0xb1a0012a	! t0_kref+0x4cb8:   	fabss	%f10, %f24
	.word	0xedee101c	! t0_kref+0x4cbc:   	prefetcha	%i0 + %i4, 22
	.word	0xea267ff0	! t0_kref+0x4cc0:   	st	%l5, [%i1 - 0x10]
	.word	0xdd3e0000	! t0_kref+0x4cc4:   	std	%f14, [%i0]
	.word	0x9fc00004	! t0_kref+0x4cc8:   	call	%g0 + %g4
	.word	0xb1b30a52	! t0_kref+0x4ccc:   	fpadd32	%f12, %f18, %f24
	.word	0x22800007	! t0_kref+0x4cd0:   	be,a	_kref+0x4cec
	.word	0x92b52f03	! t0_kref+0x4cd4:   	orncc	%l4, 0xf03, %o1
	.word	0xd11fbd20	! t0_kref+0x4cd8:   	ldd	[%fp - 0x2e0], %f8
	.word	0x20480002	! t0_kref+0x4cdc:   	bn,a,pt	%icc, _kref+0x4ce4
	.word	0xf11f4019	! t0_kref+0x4ce0:   	ldd	[%i5 + %i1], %f24
	.word	0xe300a020	! t0_kref+0x4ce4:   	ld	[%g2 + 0x20], %f17
	.word	0x9a3a800c	! t0_kref+0x4ce8:   	xnor	%o2, %o4, %o5
	.word	0xd11e2018	! t0_kref+0x4cec:   	ldd	[%i0 + 0x18], %f8
	.word	0xacf5708a	! t0_kref+0x4cf0:   	udivcc	%l5, -0xf76, %l6
	.word	0xa875f4da	! t0_kref+0x4cf4:   	udiv	%l7, -0xb26, %l4
	.word	0xae95af8d	! t0_kref+0x4cf8:   	orcc	%l6, 0xf8d, %l7
	.word	0xd0264000	! t0_kref+0x4cfc:   	st	%o0, [%i1]
	.word	0xc768a048	! t0_kref+0x4d00:   	prefetch	%g2 + 0x48, 3
	.word	0xa5a0188c	! t0_kref+0x4d04:   	fitos	%f12, %f18
	.word	0xa5b00f2d	! t0_kref+0x4d08:   	fsrc2s	%f13, %f18
	call	SYM(t0_subr0)
	.word	0xb3a00533	! t0_kref+0x4d10:   	fsqrts	%f19, %f25
	.word	0xb1a01a56	! t0_kref+0x4d14:   	fdtoi	%f22, %f24
	.word	0xaf2d8008	! t0_kref+0x4d18:   	sll	%l6, %o0, %l7
	.word	0xada209cc	! t0_kref+0x4d1c:   	fdivd	%f8, %f12, %f22
	.word	0x81ab0ac8	! t0_kref+0x4d20:   	fcmped	%fcc0, %f12, %f8
	.word	0x33480001	! t0_kref+0x4d24:   	fbe,a,pt	%fcc0, _kref+0x4d28
	.word	0xa216c00a	! t0_kref+0x4d28:   	or	%i3, %o2, %l1
	.word	0x8143e03f	! t0_kref+0x4d2c:   	membar	0x3f
	.word	0xa5b507d0	! t0_kref+0x4d30:   	pdist	%f20, %f16, %f18
	.word	0xd9983fe0	! t0_kref+0x4d34:   	ldda	[%g0 - 0x20]%asi, %f12
	.word	0xac15f8e9	! t0_kref+0x4d38:   	or	%l7, -0x717, %l6
	.word	0xadb20c90	! t0_kref+0x4d3c:   	fandnot2	%f8, %f16, %f22
	.word	0x93a488b5	! t0_kref+0x4d40:   	fsubs	%f18, %f21, %f9
	.word	0xac8ec00d	! t0_kref+0x4d44:   	andcc	%i3, %o5, %l6
	.word	0x86102002	! t0_kref+0x4d48:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x4d4c:   	bne,a	_kref+0x4d4c
	.word	0x86a0e001	! t0_kref+0x4d50:   	subcc	%g3, 1, %g3
	.word	0x28480003	! t0_kref+0x4d54:   	bleu,a,pt	%icc, _kref+0x4d60
	.word	0xef260000	! t0_kref+0x4d58:   	st	%f23, [%i0]
	.word	0xaedaeb17	! t0_kref+0x4d5c:   	smulcc	%o3, 0xb17, %l7
	.word	0xe04e001a	! t0_kref+0x4d60:   	ldsb	[%i0 + %i2], %l0
	.word	0x91a00550	! t0_kref+0x4d64:   	fsqrtd	%f16, %f8
	.word	0xe36e3fe0	! t0_kref+0x4d68:   	prefetch	%i0 - 0x20, 17
	.word	0x9fc00004	! t0_kref+0x4d6c:   	call	%g0 + %g4
	.word	0xc568a003	! t0_kref+0x4d70:   	prefetch	%g2 + 3, 2
	.word	0xecd81018	! t0_kref+0x4d74:   	ldxa	[%g0 + %i0]0x80, %l6
	.word	0xb1b40de9	! t0_kref+0x4d78:   	fnands	%f16, %f9, %f24
	.word	0xe93e001d	! t0_kref+0x4d7c:   	std	%f20, [%i0 + %i5]
	.word	0x93a00133	! t0_kref+0x4d80:   	fabss	%f19, %f9
	.word	0x95a01933	! t0_kref+0x4d84:   	fstod	%f19, %f10
	.word	0x97b58240	! t0_kref+0x4d88:   	array16	%l6, %g0, %o3
	.word	0xb3a0002d	! t0_kref+0x4d8c:   	fmovs	%f13, %f25
	.word	0x24480004	! t0_kref+0x4d90:   	ble,a,pt	%icc, _kref+0x4da0
	.word	0xe51e2010	! t0_kref+0x4d94:   	ldd	[%i0 + 0x10], %f18
	.word	0x8143c000	! t0_kref+0x4d98:   	stbar
	.word	0x30480001	! t0_kref+0x4d9c:   	ba,a,pt	%icc, _kref+0x4da0
	.word	0x233d6297	! t0_kref+0x4da0:   	sethi	%hi(0xf58a5c00), %l1
	.word	0xa9b38a58	! t0_kref+0x4da4:   	fpadd32	%f14, %f24, %f20
	.word	0xea263fec	! t0_kref+0x4da8:   	st	%l5, [%i0 - 0x14]
	.word	0xee0e0000	! t0_kref+0x4dac:   	ldub	[%i0], %l7
	.word	0xa80b3f5d	! t0_kref+0x4db0:   	and	%o4, -0xa3, %l4
	.word	0xaaf26ce4	! t0_kref+0x4db4:   	udivcc	%o1, 0xce4, %l5
	.word	0xd4266018	! t0_kref+0x4db8:   	st	%o2, [%i1 + 0x18]
	.word	0x90900017	! t0_kref+0x4dbc:   	orcc	%g0, %l7, %o0
	.word	0xe500a038	! t0_kref+0x4dc0:   	ld	[%g2 + 0x38], %f18
	.word	0x91b300cc	! t0_kref+0x4dc4:   	edge16l	%o4, %o4, %o0
	.word	0x99a00554	! t0_kref+0x4dc8:   	fsqrtd	%f20, %f12
	.word	0xada648ab	! t0_kref+0x4dcc:   	fsubs	%f25, %f11, %f22
	.word	0xa02ae50d	! t0_kref+0x4dd0:   	andn	%o3, 0x50d, %l0
	.word	0x9e006958	! t0_kref+0x4dd4:   	add	%g1, 0x958, %o7
!	.word	0x31805489	! t0_kref+0x4dd8:   	fba,a	SYM(t0_subr2)
	   	fba,a	SYM(t0_subr2)
	.word	0xa7b50ab8	! t0_kref+0x4ddc:   	fpsub16s	%f20, %f24, %f19
	.word	0xecde5000	! t0_kref+0x4de0:   	ldxa	[%i1]0x80, %l6
	.word	0x9aaef085	! t0_kref+0x4de4:   	andncc	%i3, -0xf7b, %o5
	.word	0xd0062018	! t0_kref+0x4de8:   	ld	[%i0 + 0x18], %o0
	.word	0x9fa01891	! t0_kref+0x4dec:   	fitos	%f17, %f15
	.word	0xd6267ffc	! t0_kref+0x4df0:   	st	%o3, [%i1 - 4]
	.word	0x9b2a8016	! t0_kref+0x4df4:   	sll	%o2, %l6, %o5
	.word	0x9625001a	! t0_kref+0x4df8:   	sub	%l4, %i2, %o3
	.word	0xd24e7fe3	! t0_kref+0x4dfc:   	ldsb	[%i1 - 0x1d], %o1
	.word	0x9fc00004	! t0_kref+0x4e00:   	call	%g0 + %g4
	.word	0x9476f762	! t0_kref+0x4e04:   	udiv	%i3, -0x89e, %o2
	.word	0xa60d001a	! t0_kref+0x4e08:   	and	%l4, %i2, %l3
	.word	0x81ac0ad2	! t0_kref+0x4e0c:   	fcmped	%fcc0, %f16, %f18
	.word	0xee56c019	! t0_kref+0x4e10:   	ldsh	[%i3 + %i1], %l7
	.word	0xa5a50858	! t0_kref+0x4e14:   	faddd	%f20, %f24, %f18
	.word	0xdd1e2010	! t0_kref+0x4e18:   	ldd	[%i0 + 0x10], %f14
	.word	0x81ab8ab2	! t0_kref+0x4e1c:   	fcmpes	%fcc0, %f14, %f18
	call	SYM(_kaos_done)
	.word	0x01000000	! t0_kref+0x4e24:   	nop
	KGLOBAL(t0_ktbl_end)
t0_ktbl_end:
t0_ktbl_page_end:

KTEXT_MODULE(t0_module_subr0, 0x20d30000)
.seg "text"
t0_subr0_page_begin:
	.skip 8188
.global _t0_subr0; ENTRY(t0_subr0)
	.word	0xa6844012	! t0_subr0+0x0:   	addcc	%l1, %l2, %l3
	.word	0x81c3e008	! t0_subr0+0x4:   	retl
	.word	0xaa64c014	! t0_subr0+0x8:   	subc	%l3, %l4, %l5
t0_subr0_page_end:

KTEXT_MODULE(t0_module_subr1, 0x52260000)
.seg "text"
t0_subr1_page_begin:
	.skip 8188
.global _t0_subr1; ENTRY(t0_subr1)
	.word	0x9de3bfa0	! t0_subr1+0x0:   	save	%sp, -0x60, %sp
	.word	0xb29eaa5a	! t0_subr1+0x4:   	xorcc	%i2, 0xa5a, %i1
	.word	0x81c7e008	! t0_subr1+0x8:   	ret
	.word	0xa7ee6001	! t0_subr1+0xc:   	restore	%i1, 1, %l3
t0_subr1_page_end:

KTEXT_MODULE(t0_module_subr2, 0x0e65e000)
.seg "text"
t0_subr2_page_begin:
	.skip 8188
.global _t0_subr2; ENTRY(t0_subr2)
	.word	0x9de3bfa0	! t0_subr2+0x0:   	save	%sp, -0x60, %sp
	.word	0xb2066001	! t0_subr2+0x4:   	add	%i1, 1, %i1
	.word	0x81c7e008	! t0_subr2+0x8:   	ret
	.word	0xa3ee6001	! t0_subr2+0xc:   	restore	%i1, 1, %l1
t0_subr2_page_end:

KTEXT_MODULE(t0_module_subr3, 0x6ff00000)
.seg "text"
t0_subr3_page_begin:
	.skip 8108
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
!  Total operations: 4882  
!
!  Operation frequencies
!
!  name               exp    obs
!  ldsb              1.39   1.62
!  ldub              0.57   0.47
!  ldsh              1.36   1.56
!  lduh              0.42   0.43
!  ld                0.67   0.96
!  ldd               0.52   0.68
!  swap              0.21   0.20
!  ldstub            0.98   0.86
!  stb               0.56   0.51
!  sth               1.02   1.21
!  st                1.39   1.86
!  std               0.22   0.23
!  add               0.24   0.33
!  addcc             0.59   0.70
!  addx              0.46   0.37
!  addxcc            0.40   0.43
!  taddcc            0.03   0.00
!  taddcctv          0.28   0.45
!  sub               0.92   1.15
!  subcc             0.22   0.27
!  subx              0.12   0.12
!  subxcc            0.10   0.12
!  tsubcc            0.07   0.04
!  tsubcctv          0.02   0.02
!  mulscc            0.82   0.72
!  and               1.18   1.15
!  andcc             0.59   0.72
!  andn              0.92   1.04
!  andncc            0.70   0.74
!  or                1.47   1.29
!  orcc              0.67   0.74
!  orn               0.71   0.57
!  orncc             1.38   1.54
!  xor               0.04   0.06
!  xorcc             0.72   0.84
!  xnor              1.04   1.21
!  xnorcc            0.43   0.33
!  sll               0.95   1.25
!  srl               0.11   0.04
!  sra               0.23   0.23
!  unimp             0.16   0.10
!  umul              0.14   0.18
!  smul              0.03   0.04
!  udiv              0.51   0.43
!  sdiv              0.01   0.00
!  umulcc            0.52   0.49
!  smulcc            0.44   0.39
!  udivcc            1.31   1.47
!  sdivcc            0.56   0.45
!  rdy               0.10   0.12
!  wry               0.69   0.84
!  bicc              2.11   2.17
!  sethi             1.26   1.72
!  jmpl              0.39   0.47
!  call              0.19   0.23
!  ticc              0.00   0.00
!  flush             0.12   0.12
!  save              0.36   0.33
!  restore           0.35   0.00
!  stbar             0.92   0.86
!  ldf               0.88   0.90
!  lddf              1.02   1.15
!  stf               1.36   1.62
!  stdf              1.08   1.15
!  fadds             1.53   1.66
!  fsubs             1.41   1.41
!  fmuls             0.07   0.06
!  fdivs             0.98   1.00
!  faddd             0.65   0.66
!  fsubd             0.11   0.08
!  fmuld             0.55   0.68
!  fdivd             0.44   0.47
!  faddq             0.00   0.00
!  fsubq             0.00   0.00
!  fmulq             0.00   0.00
!  fdivq             0.00   0.00
!  fsmuld            0.72   0.74
!  fdmulq            0.00   0.00
!  fitos             0.89   0.88
!  fitod             0.33   0.27
!  fitoq             0.00   0.00
!  fstoi             1.43   1.21
!  fstod             1.51   1.39
!  fstoq             0.00   0.00
!  fdtoi             1.37   1.95
!  fdtos             0.54   0.47
!  fdtoq             0.00   0.00
!  fqtoi             0.00   0.00
!  fqtos             0.00   0.00
!  fqtod             0.00   0.00
!  fmovs             1.51   1.52
!  fnegs             0.10   0.12
!  fabss             0.97   0.90
!  fsqrts            0.65   0.59
!  fsqrtd            1.66   1.39
!  fsqrtq            0.00   0.00
!  fcmps             0.97   0.80
!  fcmpd             0.48   0.23
!  fcmpq             0.00   0.00
!  fcmpes            0.81   0.86
!  fcmped            1.49   1.11
!  fcmpeq            0.00   0.00
!  fbfcc             2.08   1.68
!  ldfsr             0.11   0.00
!  stfsr             0.12   0.16
!  loop              1.02   0.84
!  offset            0.04   0.00
!  area              0.05   0.02
!  target            0.04   0.10
!  goto              0.20   0.12
!  sigsegv           0.23   0.25
!  sigbus            0.27   0.49
!  imodify           0.00   0.00
!  ldfsr_offset      0.22   0.00
!  fpattern          0.11   0.10
!  lbranch           0.15   0.18
!  shmld             4.01   4.30
!  shmst             1.18   1.21
!  shmpf             0.90   1.13
!  shmswap           0.12   0.04
!  shmblkld          0.29   0.02
!  shmblkst          1.28   0.35
!  shmblkchk         0.40   0.33
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
!  casa              0.19   0.20
!  rdasi             0.09   0.10
!  wrasi             0.23   0.18
!  bpcc              3.40   3.09
!  fbpfcc            0.12   0.23
!  fmovscc           0.01   0.00
!  fmovdcc           0.26   0.20
!  fmovqcc           0.00   0.00
!  movcc             0.30   0.27
!  flushw            0.27   0.16
!  membar            0.27   0.16
!  prefetch          1.47   1.54
!  rdpc              0.02   0.00
!  ldqf              0.00   0.00
!  stqf              0.00   0.00
!  ldfa              0.16   0.18
!  lddfa             0.21   0.18
!  ldqfa             0.00   0.00
!  ldsba             0.21   0.20
!  ldsha             0.10   0.08
!  lduba             0.28   0.33
!  lduha             0.16   0.10
!  lda               0.24   0.10
!  ldda              0.20   0.20
!  ldstuba           0.09   0.14
!  prefetcha         0.92   0.86
!  stfa              0.16   0.18
!  stdfa             0.28   0.35
!  stqfa             0.00   0.00
!  stba              0.08   0.14
!  stha              0.19   0.18
!  sta               0.02   0.04
!  stda              0.11   0.08
!  swapa             0.05   0.10
!  fmovd             0.28   0.29
!  fnegd             0.26   0.25
!  fabsd             0.02   0.00
!  fstox             0.17   0.16
!  fdtox             0.04   0.06
!  fxtos             0.10   0.04
!  fxtod             0.29   0.18
!  lds               0.20   0.16
!  ldsa              0.21   0.18
!  ldx               0.23   0.14
!  ldxa              0.27   0.35
!  nofault           0.03   0.06
!  rdgsr             0.07   0.06
!  wrgsr             0.11   0.14
!  fpadd16           0.20   0.20
!  fpadd16s          0.02   0.06
!  fpadd32           0.25   0.27
!  fpadd32s          0.20   0.29
!  fpsub16           0.24   0.20
!  fpsub16s          0.15   0.18
!  fpsub32           0.13   0.18
!  fpsub32s          0.13   0.16
!  fpack16           0.07   0.10
!  fpack32           0.21   0.14
!  fpackfix          0.12   0.08
!  fexpand           0.01   0.02
!  fpmerge           0.13   0.10
!  fmul8x16          0.16   0.16
!  fmul8x16au        0.11   0.12
!  fmul8x16al        0.02   0.00
!  fmul8sux16        0.04   0.00
!  fmul8ulx16        0.07   0.12
!  fmuld8sux16       0.07   0.14
!  fmuld8ulx16       0.14   0.10
!  alignaddr         0.23   0.16
!  alignaddrl        0.24   0.18
!  faligndata        0.04   0.06
!  fzero             0.16   0.06
!  fzeros            0.02   0.06
!  fone              0.23   0.12
!  fones             0.08   0.06
!  fsrc1             0.03   0.02
!  fsrc1s            0.14   0.08
!  fsrc2             0.08   0.06
!  fsrc2s            0.10   0.08
!  fnot1             0.08   0.02
!  fnot1s            0.08   0.04
!  fnot2             0.29   0.23
!  fnot2s            0.19   0.25
!  for               0.17   0.18
!  fors              0.14   0.12
!  fnor              0.29   0.41
!  fnors             0.23   0.31
!  fand              0.26   0.08
!  fands             0.26   0.18
!  fnand             0.09   0.08
!  fnands            0.21   0.31
!  fxor              0.01   0.02
!  fxors             0.09   0.23
!  fxnor             0.10   0.14
!  fxnors            0.16   0.18
!  fornot1           0.10   0.10
!  fornot1s          0.17   0.23
!  fornot2           0.01   0.02
!  fornot2s          0.29   0.31
!  fandnot1          0.29   0.29
!  fandnot1s         0.20   0.18
!  fandnot2          0.07   0.08
!  fandnot2s         0.16   0.14
!  fcmpgt16          0.01   0.00
!  fcmpgt32          0.24   0.27
!  fcmple16          0.23   0.18
!  fcmple32          0.29   0.45
!  fcmpne16          0.08   0.06
!  fcmpne32          0.10   0.18
!  fcmpeq16          0.15   0.18
!  fcmpeq32          0.07   0.02
!  edge8             0.17   0.20
!  edge8l            0.09   0.10
!  edge16            0.08   0.04
!  edge16l           0.24   0.20
!  edge32            0.10   0.06
!  edge32l           0.20   0.14
!  pdist             0.29   0.27
!  partial_st8       0.00   0.00
!  partial_st16      0.28   0.14
!  partial_st32      0.26   0.33
!  short_st8         0.29   0.10
!  short_st16        0.18   0.27
!  short_ld8         0.29   0.20
!  short_ld16        0.01   0.00
!  blkld             0.24   0.00
!  blkst             0.05   0.00
!  blkld_offset      0.10   0.00
!  blkst_offset      0.00   0.00
!  blk_check         0.00   0.00
!  casxa             0.22   0.29
!  rdccr             0.17   0.12
!  rdfprs            0.10   0.06
!  wrccr             0.18   0.18
!  popc              0.17   0.10
!  wrfprs            0.07   0.12
!  stx               0.03   0.02
!  stxa              0.11   0.20
!  cflush            0.00   0.00
!  array8            0.01   0.00
!  array16           0.23   0.23
!  array32           0.14   0.29
!  edge8n            0.01   0.00
!  edge8ln           0.25   0.31
!  edge16n           0.02   0.02
!  edge16ln          0.02   0.02
!  edge32n           0.20   0.10
!  edge32ln          0.20   0.33
!  bmask             0.11   0.14
!  bshuffle          0.27   0.41
!  siam              0.10   0.10
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
KDATA_MODULE(t0_module_offset_table, 0x4245e000)
.seg "data"
t0_offset_table_start:
t0_offset_table_size:	.word	0x00000008
t0_offset_table:
	.word	0xfffffff0
	.word	0x00000010
	.word	0x00000018
	.word	0x00000008
	.word	0xffffffe8
	.word	0x00000000
	.word	0xffffffe0
	.word	0xfffffff8
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

KDATA_MODULE(t0_module_data_in_regs, 0x60e82000)
.seg "data"
KGLOBAL(t0_data_in_regs)
t0_data_in_regs_start:
t0_data_in_regs:
	.word	0xb159e9cc          ! %f0
	.word	0x3e33b6fd          ! %f1
	.word	0xc5f5243f          ! %f2
	.word	0xd08f4046          ! %f3
	.word	0xcb670e22          ! %f4
	.word	0x26007d94          ! %f5
	.word	0x0fc50a08          ! %f6
	.word	0x62aca0c3          ! %f7
	.word	0xf69f7db1          ! %f8
	.word	0x33992f68          ! %f9
	.word	0xbef64e38          ! %f10
	.word	0xb888b9a3          ! %f11
	.word	0xf585a6a4          ! %f12
	.word	0x4d61fbeb          ! %f13
	.word	0xf41133ef          ! %f14
	.word	0x3feaee50          ! %f15
	.word	0x5283ccb6          ! %f16
	.word	0x96964dc0          ! %f17
	.word	0x7c445832          ! %f18
	.word	0x4b09e051          ! %f19
	.word	0xceba072a          ! %f20
	.word	0x641723a2          ! %f21
	.word	0x1b4d62fe          ! %f22
	.word	0x2e26cccc          ! %f23
	.word	0x40d9a9fe          ! %f24
	.word	0x544b9383          ! %f25
	.word	0x891335a0          ! %f26
	.word	0x4d42be4c          ! %f27
	.word	0x0eb18e5f          ! %f28
	.word	0x7be3dbf8          ! %f29
	.word	0x82842a43          ! %f30
	.word	0xec4e96c4          ! %f31
	.word	0xae51ee5f          ! %f32
	.word	0x3b71a7d3          ! %f33
	.word	0x1b6038ca          ! %f34
	.word	0x6ac335d4          ! %f35
	.word	0xf6e5c7e5          ! %f36
	.word	0xcbce6811          ! %f37
	.word	0x10c014e0          ! %f38
	.word	0xde9f3f4a          ! %f39
	.word	0x98cafae4          ! %f40
	.word	0xfb72e7f6          ! %f41
	.word	0xdfa7994c          ! %f42
	.word	0x069c45ea          ! %f43
	.word	0x675196ce          ! %f44
	.word	0x73717f76          ! %f45
	.word	0x19031489          ! %f46
	.word	0x90455e72          ! %f47
	.word	0x781e0b4b          ! %f48
	.word	0x49f687d7          ! %f49
	.word	0xea544a95          ! %f50
	.word	0x40b55ed8          ! %f51
	.word	0xb3b13026          ! %f52
	.word	0xb048f693          ! %f53
	.word	0x414d4009          ! %f54
	.word	0xbe634dd5          ! %f55
	.word	0xb3545887          ! %f56
	.word	0x557f4282          ! %f57
	.word	0xcde42269          ! %f58
	.word	0x5bc7c6a6          ! %f59
	.word	0x91d6e567          ! %f60
	.word	0x33baf738          ! %f61
	.word	0x834ce1bd          ! %f62
	.word	0x2e0e5511          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0xadc       ! %g1 (code pointer)
	.word	t0_data_in_shm_area ! %g2 (shared area pointer)
	.word	0x42f5cadc          ! %g3 (loop index)
	.word	SYM(t0_subr1)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0x5024fe4e          ! %o0
	.word	0xc685ab28          ! %o1
	.word	0x14da1f65          ! %o2
	.word	0xe01592e8          ! %o3
	.word	0x784ae6dd          ! %o4
	.word	0x074a2a4e          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0x396e0b3f          ! %l0
	.word	0x1dff9aab          ! %l1
	.word	0xf9fa4f60          ! %l2
	.word	0x0cb20da5          ! %l3
	.word	0x40debf02          ! %l4
	.word	0x9edfc919          ! %l5
	.word	0x3491d617          ! %l6
	.word	0x6f14e646          ! %l7
	.word	t0_data_in_area0    ! %i0 (area pointer)
	.word	t0_data_in_area0    ! %i1 (area pointer)
	.word	0x00000013          ! %i2 (byte offset)
	.word	0xfffffffc          ! %i3 (halfword offset)
	.word	0xfffffff4          ! %i4 (word offset)
	.word	0xfffffff8          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0x255e3a1c          ! %y
	.word	0x0000000a          ! %icc (nzvc)
	.word	0x400003eb          ! %fsr
	.word	0x00000000          ! %gsr.mask
	.word	0x00000000          ! %gsr
	.word	0x000000d2          ! %asi
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

KDATA_MODULE(t0_module_data_in_stack, 0x73a1e000)
.seg "data"
KGLOBAL(t0_data_in_mtbl_size)
KGLOBAL(t0_data_in_mtbl)
KGLOBAL(t0_data_in_stack)
t0_data_in_stack_start:
	.word	0x77524f24
	.word	0x9e407f48
	.word	0xfcca0b95
	.word	0x4518ff8d
	.word	0x8c194b68
	.word	0xbb1d0b03
	.word	0xc86e4923
	.word	0xfa1a0934
	.word	0x9831ff95
	.word	0x253ac57f
	.word	0x82389017
	.word	0xef37e206
	.word	0xa1e5c8e9
	.word	0x5c1004e4
	.word	0x7d93f979
	.word	0xd012edfa
	.word	0x7b17ab91
	.word	0xf762f392
	.word	0xcbee83c1
	.word	0x816bce9c
	.word	0x1609487f
	.word	0x2b72b365
	.word	0xf29c2ed1
	.word	0xfae381ea
	.word	0x0a18dc80
	.word	0x7f78f139
	.word	0x803b6325
	.word	0x53640b7f
	.word	0x09779c8d
	.word	0xb8b2acb0
	.word	0x239c1848
	.word	0x39080bf3
	.word	0x48f90360
	.word	0x29c73832
	.word	0x804e6e89
	.word	0x59d9ea80
	.word	0x7410e44a
	.word	0x0e50b535
	.word	0x4e14afee
	.word	0xad2974e9
	.word	0xf21f5743
	.word	0x3cb990be
	.word	0x53bfec69
	.word	0x8fc11996
	.word	0x8c86d242
	.word	0xe9d6c426
	.word	0xf2bda549
	.word	0x1e322003
	.word	0x0ffa03cf
	.word	0x21dede21
	.word	0x62103bf3
	.word	0xaa01835b
	.word	0x443442d5
	.word	0xe5da17fc
	.word	0x7cd317d1
	.word	0xf6f5535f
	.word	0x9528a7bc
	.word	0xfba7fb25
	.word	0x7506b789
	.word	0xa75cbf8d
	.word	0x64e122b7
	.word	0xa57b5af0
	.word	0x8e702172
	.word	0xcf2b307d
	.word	0x2708235a
	.word	0xdc75a697
	.word	0xb21a6743
	.word	0xa061138d
	.word	0xe3aca56e
	.word	0xcd16d783
	.word	0x98c0310d
	.word	0xfdc33cc0
	.word	0x6779b708
	.word	0x33c77fc9
	.word	0x144e836a
	.word	0x158c02e3
	.word	0x6997cbd8
	.word	0x9816bcf6
	.word	0xb61134f6
	.word	0xf2cf79f1
	.word	0x0bff71be
	.word	0x0e9e130f
	.word	0x732cc6fe
	.word	0xdbfe6fb8
	.word	0xe76a3aa2
	.word	0x281973d3
	.word	0xb3109577
	.word	0xdd8a0ebb
	.word	0xf987ef84
	.word	0x9861f642
	.word	0x4ec79231
	.word	0xb3644b5a
	.word	0x47eb60d1
	.word	0x3dde0262
	.word	0xd3bcff4c
	.word	0x71377f30
	.word	0x6d8367f9
	.word	0xe1e1f540
	.word	0xebeddcea
	.word	0x81f1d6bc
	.word	0xf8a9ee3d
	.word	0xe8a88134
	.word	0x27d6fe26
	.word	0x71e77542
	.word	0xf61c0ccd
	.word	0x543a4e69
	.word	0xc6faf944
	.word	0x2d9872f3
	.word	0x0ecb9a11
	.word	0xdd109f9c
	.word	0x31da6728
	.word	0x1056194b
	.word	0x9cabb846
	.word	0x5db6ff24
	.word	0x06ec260c
	.word	0x0bd501ba
	.word	0x429f394d
	.word	0x906c3831
	.word	0x3aca936d
	.word	0x026ffa86
	.word	0x2ec8ebbf
	.word	0xd7032058
	.word	0x65a5f146
	.word	0xebb9d5ef
	.word	0xd9eb2544
	.word	0xea47f54e
	.word	0xec5b6a80
	.word	0xb43a8793
	.word	0x03851e25
	.word	0x573752f3
	.word	0xf5936aa8
	.word	0xd0163413
	.word	0xde31f21e
	.word	0x59a00592
	.word	0xb2413ce2
	.word	0xe32316f7
	.word	0xf3b65a79
	.word	0x2d993c67
	.word	0x4809261d
	.word	0x89dd62ce
	.word	0xa9677557
	.word	0x5fcae061
	.word	0xf2b16e87
	.word	0x73f67f99
	.word	0x7d662e50
	.word	0x001e1328
	.word	0xbb160e43
	.word	0x852f4b6a
	.word	0xe8d01c3e
	.word	0x2f481a60
	.word	0x655df159
	.word	0x5a034147
	.word	0x33bfe856
	.word	0x1e023b2f
	.word	0x20ac06ee
	.word	0x45a4aa53
	.word	0xb3049277
	.word	0xd0e549fd
	.word	0xaf758fb4
	.word	0xf4283d2f
	.word	0xae1826c6
	.word	0x6e07f27a
	.word	0x844a5fa3
	.word	0x40c0cf9d
	.word	0x3353b87a
	.word	0x5deafbe4
	.word	0xf27306e8
	.word	0x5ad1fe66
t0_data_in_sp:
	.word	0x21e7b5f4
	.word	0x802f0d89
	.word	0x8f94161d
	.word	0xffaaef7e
	.word	0xb9fcea12
	.word	0x4243b78b
	.word	0x2ac4f1bb
	.word	0xb8289265
	.word	t0_data_in_area0
	.word	t0_data_in_area0
	.word	0x0000000f
	.word	0x0000000c
	.word	0xffffffec
	.word	0xfffffff8
	.word	t0_data_in_fp
	.word	0x25cf13a7
	.word	0x129882e4
	.word	0xe9eff186
	.word	0x5d1d452f
	.word	0x8c828c8f
	.word	0x36f03951
	.word	0xb256378f
	.word	0x3a651ed3
	.word	0x1052dab5
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
	.word   	0xbc510f91	! [%fp - 0xc]
	.word   	0x5adcf78b	! [%fp - 0x8]
	.word   	0xd811f6c5	! [%fp - 0x4]
.global t0_data_in_fp; t0_data_in_fp:
	.word	0x601f0a9b
	.word	0xb730bf04
	.word	0xa36ef160
	.word	0x367e1cb8
	.word	0x97bc3f72
	.word	0x3f7669e2
	.word	0x3760ec18
	.word	0xd7584926
	.word	0x191c0999
	.word	0x9138096e
	.word	0x7f0c5a08
	.word	0x7523d8a8
	.word	0x6ca32163
	.word	0xa2240b6b
	.word	0xe02d9b34
	.word	0x0730e888
	.word	0x8bea8a1d
	.word	0x3ae2d2cf
	.word	0xe3f981f2
	.word	0xcd212894
	.word	0x6541614e
	.word	0xa0430fb6
	.word	0xc2f3fdcc
	.word	0xf9077634
t0_data_in_stacktop:
	.word	0
t0_data_in_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_in_area0, 0x0f4a6000)
.seg "data"
t0_data_in_area0_start:
.skip 6016
t0_data_in_area0_begin:
	.word	0xfee5de40	! t0_data_in_area0-0x20
	.word	0xcdbf2299	! t0_data_in_area0-0x1c
	.word	0xb2cc10aa	! t0_data_in_area0-0x18
	.word	0xa97d94bf	! t0_data_in_area0-0x14
	.word	0x3b5045bf	! t0_data_in_area0-0x10
	.word	0x1118febf	! t0_data_in_area0-0xc
	.word	0x901f7230	! t0_data_in_area0-0x8
	.word	0x4eec9709	! t0_data_in_area0-0x4
.global t0_data_in_area0; t0_data_in_area0:
	.word	0xb452d620	! t0_data_in_area0+0x0
	.word	0x10ad3ff2	! t0_data_in_area0+0x4
	.word	0x4f4a8565	! t0_data_in_area0+0x8
	.word	0x35f9ce40	! t0_data_in_area0+0xc
	.word	0x8d7def84	! t0_data_in_area0+0x10
	.word	0x72f56776	! t0_data_in_area0+0x14
	.word	0x1a8f8494	! t0_data_in_area0+0x18
	.word	0xbdd351f8	! t0_data_in_area0+0x1c
t0_data_in_area0_end:
.skip 2112
t0_data_in_area0_stop:

KDATA_MODULE(t0_module_data_in_shm_area, 0x36ed2000)
.seg "data"
t0_data_in_shm_area_start:
t0_data_in_shm_area_begin:
.global t0_data_in_shm_area; t0_data_in_shm_area:
	.word	0x1f67fc5e	! t0_data_in_shm_area+0x0 (t0)
	.word	0x38bc7437	! t0_data_in_shm_area+0x4 (t0)
	.word	0x632a0776	! t0_data_in_shm_area+0x8 (t0)
	.word	0x09347583	! t0_data_in_shm_area+0xc (t0)
	.word	0x596cde32	! t0_data_in_shm_area+0x10 (t0)
	.word	0x94084a40	! t0_data_in_shm_area+0x14 (t0)
	.word	0x0c924791	! t0_data_in_shm_area+0x18 (t0)
	.word	0x9dabbe86	! t0_data_in_shm_area+0x1c (t0)
	.word	0x1670e29e	! t0_data_in_shm_area+0x20 (t0)
	.word	0x7eed9d74	! t0_data_in_shm_area+0x24 (t0)
	.word	0x7f85c6da	! t0_data_in_shm_area+0x28 (t0)
	.word	0x1b3130c8	! t0_data_in_shm_area+0x2c (t0)
	.word	0x0f6f849e	! t0_data_in_shm_area+0x30 (t0)
	.word	0x66ab5377	! t0_data_in_shm_area+0x34 (t0)
	.word	0x03a13ca1	! t0_data_in_shm_area+0x38 (t0)
	.word	0xc7b5034d	! t0_data_in_shm_area+0x3c (t0)
	.word	0xc45e7e0a	! t0_data_in_shm_area+0x40 (t0 bload)
	.word	0xf3c590ec	! t0_data_in_shm_area+0x44
	.word	0x84b1ecad	! t0_data_in_shm_area+0x48
	.word	0x343c12a3	! t0_data_in_shm_area+0x4c
	.word	0x9571ed64	! t0_data_in_shm_area+0x50
	.word	0xcea7e5e5	! t0_data_in_shm_area+0x54
	.word	0x92a2cca6	! t0_data_in_shm_area+0x58
	.word	0x74a0a47b	! t0_data_in_shm_area+0x5c
	.word	0x545693d0	! t0_data_in_shm_area+0x60
	.word	0x6cd94d97	! t0_data_in_shm_area+0x64
	.word	0x4a4c1bb3	! t0_data_in_shm_area+0x68
	.word	0xc563507a	! t0_data_in_shm_area+0x6c
	.word	0x0ac36f63	! t0_data_in_shm_area+0x70
	.word	0x9c43f54d	! t0_data_in_shm_area+0x74
	.word	0x20b25063	! t0_data_in_shm_area+0x78
	.word	0xa5612251	! t0_data_in_shm_area+0x7c
	.word	0x5214359f	! t0_data_in_shm_area+0x80 (t0 bstore)
	.word	0x03bdfe9f	! t0_data_in_shm_area+0x84
	.word	0x9bab80d0	! t0_data_in_shm_area+0x88
	.word	0x4901490a	! t0_data_in_shm_area+0x8c
	.word	0xe2b2723e	! t0_data_in_shm_area+0x90
	.word	0xf91fb0e3	! t0_data_in_shm_area+0x94
	.word	0x98b0a901	! t0_data_in_shm_area+0x98
	.word	0x62bde7a5	! t0_data_in_shm_area+0x9c
	.word	0x822b4e2e	! t0_data_in_shm_area+0xa0
	.word	0x6106cde2	! t0_data_in_shm_area+0xa4
	.word	0x3f127390	! t0_data_in_shm_area+0xa8
	.word	0xdf10dae3	! t0_data_in_shm_area+0xac
	.word	0xf82c42dd	! t0_data_in_shm_area+0xb0
	.word	0x422dfdce	! t0_data_in_shm_area+0xb4
	.word	0x641f688c	! t0_data_in_shm_area+0xb8
	.word	0xc9068860	! t0_data_in_shm_area+0xbc
t0_data_in_shm_area_end:
t0_data_in_shm_area_stop:

KDATA_MODULE(t0_module_data_exp_regs, 0x3dacc000)
.seg "data"
KGLOBAL(t0_data_exp_regs)
t0_data_exp_regs_start:
t0_data_exp_regs:
	.word	0xb159e9cc          ! %f0
	.word	0x3e33b6fd          ! %f1
	.word	0xc5f5243f          ! %f2
	.word	0xd08f4046          ! %f3
	.word	0xcb670e22          ! %f4
	.word	0x26007d94          ! %f5
	.word	0x0fc50a08          ! %f6
	.word	0x62aca0c3          ! %f7
	.word	0xf69f7db1          ! %f8
	.word	0x33992f68          ! %f9
	.word	0xbef64e38          ! %f10
	.word	0xb888b9a3          ! %f11
	.word	0xf585a6a4          ! %f12
	.word	0x4d61fbeb          ! %f13
	.word	0xf41133ef          ! %f14
	.word	0x3feaee50          ! %f15
	.word	0x5283ccb6          ! %f16
	.word	0x96964dc0          ! %f17
	.word	0x7c445832          ! %f18
	.word	0x4b09e051          ! %f19
	.word	0xceba072a          ! %f20
	.word	0x641723a2          ! %f21
	.word	0x1b4d62fe          ! %f22
	.word	0x2e26cccc          ! %f23
	.word	0x40d9a9fe          ! %f24
	.word	0x544b9383          ! %f25
	.word	0x891335a0          ! %f26
	.word	0x4d42be4c          ! %f27
	.word	0x0eb18e5f          ! %f28
	.word	0x7be3dbf8          ! %f29
	.word	0x82842a43          ! %f30
	.word	0xec4e96c4          ! %f31
	.word	0xae51ee5f          ! %f32
	.word	0x3b71a7d3          ! %f33
	.word	0x1b6038ca          ! %f34
	.word	0x6ac335d4          ! %f35
	.word	0xf6e5c7e5          ! %f36
	.word	0xcbce6811          ! %f37
	.word	0x10c014e0          ! %f38
	.word	0xde9f3f4a          ! %f39
	.word	0x98cafae4          ! %f40
	.word	0xfb72e7f6          ! %f41
	.word	0xdfa7994c          ! %f42
	.word	0x069c45ea          ! %f43
	.word	0x675196ce          ! %f44
	.word	0x73717f76          ! %f45
	.word	0x19031489          ! %f46
	.word	0x90455e72          ! %f47
	.word	0x781e0b4b          ! %f48
	.word	0x49f687d7          ! %f49
	.word	0xea544a95          ! %f50
	.word	0x40b55ed8          ! %f51
	.word	0xb3b13026          ! %f52
	.word	0xb048f693          ! %f53
	.word	0x414d4009          ! %f54
	.word	0xbe634dd5          ! %f55
	.word	0xb3545887          ! %f56
	.word	0x557f4282          ! %f57
	.word	0xcde42269          ! %f58
	.word	0x5bc7c6a6          ! %f59
	.word	0x91d6e567          ! %f60
	.word	0x33baf738          ! %f61
	.word	0x834ce1bd          ! %f62
	.word	0x2e0e5511          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0xadc       ! %g1 (code pointer)
	.word	t0_data_exp_shm_area! %g2 (shared area pointer)
	.word	0x42f5cadc          ! %g3 (loop index)
	.word	SYM(t0_subr1)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0x5024fe4e          ! %o0
	.word	0xc685ab28          ! %o1
	.word	0x14da1f65          ! %o2
	.word	0xe01592e8          ! %o3
	.word	0x784ae6dd          ! %o4
	.word	0x074a2a4e          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0x396e0b3f          ! %l0
	.word	0x1dff9aab          ! %l1
	.word	0xf9fa4f60          ! %l2
	.word	0x0cb20da5          ! %l3
	.word	0x40debf02          ! %l4
	.word	0x9edfc919          ! %l5
	.word	0x3491d617          ! %l6
	.word	0x6f14e646          ! %l7
	.word	t0_data_exp_area0   ! %i0 (area pointer)
	.word	t0_data_exp_area0   ! %i1 (area pointer)
	.word	0x00000013          ! %i2 (byte offset)
	.word	0xfffffffc          ! %i3 (halfword offset)
	.word	0xfffffff4          ! %i4 (word offset)
	.word	0xfffffff8          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0x255e3a1c          ! %y
	.word	0x0000000a          ! %icc (nzvc)
	.word	0x400003eb          ! %fsr
	.word	0x00000000          ! %gsr.mask
	.word	0x00000000          ! %gsr
	.word	0x000000d2          ! %asi
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

KDATA_MODULE(t0_module_data_exp_stack, 0x1b94e000)
.seg "data"
KGLOBAL(t0_data_exp_mtbl_size)
KGLOBAL(t0_data_exp_mtbl)
KGLOBAL(t0_data_exp_stack)
t0_data_exp_stack_start:
	.word	0x77524f24
	.word	0x9e407f48
	.word	0xfcca0b95
	.word	0x4518ff8d
	.word	0x8c194b68
	.word	0xbb1d0b03
	.word	0xc86e4923
	.word	0xfa1a0934
	.word	0x9831ff95
	.word	0x253ac57f
	.word	0x82389017
	.word	0xef37e206
	.word	0xa1e5c8e9
	.word	0x5c1004e4
	.word	0x7d93f979
	.word	0xd012edfa
	.word	0x7b17ab91
	.word	0xf762f392
	.word	0xcbee83c1
	.word	0x816bce9c
	.word	0x1609487f
	.word	0x2b72b365
	.word	0xf29c2ed1
	.word	0xfae381ea
	.word	0x0a18dc80
	.word	0x7f78f139
	.word	0x803b6325
	.word	0x53640b7f
	.word	0x09779c8d
	.word	0xb8b2acb0
	.word	0x239c1848
	.word	0x39080bf3
	.word	0x48f90360
	.word	0x29c73832
	.word	0x804e6e89
	.word	0x59d9ea80
	.word	0x7410e44a
	.word	0x0e50b535
	.word	0x4e14afee
	.word	0xad2974e9
	.word	0xf21f5743
	.word	0x3cb990be
	.word	0x53bfec69
	.word	0x8fc11996
	.word	0x8c86d242
	.word	0xe9d6c426
	.word	0xf2bda549
	.word	0x1e322003
	.word	0x0ffa03cf
	.word	0x21dede21
	.word	0x62103bf3
	.word	0xaa01835b
	.word	0x443442d5
	.word	0xe5da17fc
	.word	0x7cd317d1
	.word	0xf6f5535f
	.word	0x9528a7bc
	.word	0xfba7fb25
	.word	0x7506b789
	.word	0xa75cbf8d
	.word	0x64e122b7
	.word	0xa57b5af0
	.word	0x8e702172
	.word	0xcf2b307d
	.word	0x2708235a
	.word	0xdc75a697
	.word	0xb21a6743
	.word	0xa061138d
	.word	0xe3aca56e
	.word	0xcd16d783
	.word	0x98c0310d
	.word	0xfdc33cc0
	.word	0x6779b708
	.word	0x33c77fc9
	.word	0x144e836a
	.word	0x158c02e3
	.word	0x6997cbd8
	.word	0x9816bcf6
	.word	0xb61134f6
	.word	0xf2cf79f1
	.word	0x0bff71be
	.word	0x0e9e130f
	.word	0x732cc6fe
	.word	0xdbfe6fb8
	.word	0xe76a3aa2
	.word	0x281973d3
	.word	0xb3109577
	.word	0xdd8a0ebb
	.word	0xf987ef84
	.word	0x9861f642
	.word	0x4ec79231
	.word	0xb3644b5a
	.word	0x47eb60d1
	.word	0x3dde0262
	.word	0xd3bcff4c
	.word	0x71377f30
	.word	0x6d8367f9
	.word	0xe1e1f540
	.word	0xebeddcea
	.word	0x81f1d6bc
	.word	0xf8a9ee3d
	.word	0xe8a88134
	.word	0x27d6fe26
	.word	0x71e77542
	.word	0xf61c0ccd
	.word	0x543a4e69
	.word	0xc6faf944
	.word	0x2d9872f3
	.word	0x0ecb9a11
	.word	0xdd109f9c
	.word	0x31da6728
	.word	0x1056194b
	.word	0x9cabb846
	.word	0x5db6ff24
	.word	0x06ec260c
	.word	0x0bd501ba
	.word	0x429f394d
	.word	0x906c3831
	.word	0x3aca936d
	.word	0x026ffa86
	.word	0x2ec8ebbf
	.word	0xd7032058
	.word	0x65a5f146
	.word	0xebb9d5ef
	.word	0xd9eb2544
	.word	0xea47f54e
	.word	0xec5b6a80
	.word	0xb43a8793
	.word	0x03851e25
	.word	0x573752f3
	.word	0xf5936aa8
	.word	0xd0163413
	.word	0xde31f21e
	.word	0x59a00592
	.word	0xb2413ce2
	.word	0xe32316f7
	.word	0xf3b65a79
	.word	0x2d993c67
	.word	0x4809261d
	.word	0x89dd62ce
	.word	0xa9677557
	.word	0x5fcae061
	.word	0xf2b16e87
	.word	0x73f67f99
	.word	0x7d662e50
	.word	0x001e1328
	.word	0xbb160e43
	.word	0x852f4b6a
	.word	0xe8d01c3e
	.word	0x2f481a60
	.word	0x655df159
	.word	0x5a034147
	.word	0x33bfe856
	.word	0x1e023b2f
	.word	0x20ac06ee
	.word	0x45a4aa53
	.word	0xb3049277
	.word	0xd0e549fd
	.word	0xaf758fb4
	.word	0xf4283d2f
	.word	0xae1826c6
	.word	0x6e07f27a
	.word	0x844a5fa3
	.word	0x40c0cf9d
	.word	0x3353b87a
	.word	0x5deafbe4
	.word	0xf27306e8
	.word	0x5ad1fe66
t0_data_exp_sp:
	.word	0x21e7b5f4
	.word	0x802f0d89
	.word	0x8f94161d
	.word	0xffaaef7e
	.word	0xb9fcea12
	.word	0x4243b78b
	.word	0x2ac4f1bb
	.word	0xb8289265
	.word	t0_data_exp_area0
	.word	t0_data_exp_area0
	.word	0x0000000f
	.word	0x0000000c
	.word	0xffffffec
	.word	0xfffffff8
	.word	t0_data_exp_fp
	.word	0x25cf13a7
	.word	0x129882e4
	.word	0xe9eff186
	.word	0x5d1d452f
	.word	0x8c828c8f
	.word	0x36f03951
	.word	0xb256378f
	.word	0x3a651ed3
	.word	0x1052dab5
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
	.word   	0xbc510f91	! [%fp - 0xc]
	.word   	0x5adcf78b	! [%fp - 0x8]
	.word   	0xd811f6c5	! [%fp - 0x4]
t0_data_exp_fp:
	.word	0x601f0a9b
	.word	0xb730bf04
	.word	0xa36ef160
	.word	0x367e1cb8
	.word	0x97bc3f72
	.word	0x3f7669e2
	.word	0x3760ec18
	.word	0xd7584926
	.word	0x191c0999
	.word	0x9138096e
	.word	0x7f0c5a08
	.word	0x7523d8a8
	.word	0x6ca32163
	.word	0xa2240b6b
	.word	0xe02d9b34
	.word	0x0730e888
	.word	0x8bea8a1d
	.word	0x3ae2d2cf
	.word	0xe3f981f2
	.word	0xcd212894
	.word	0x6541614e
	.word	0xa0430fb6
	.word	0xc2f3fdcc
	.word	0xf9077634
t0_data_exp_stacktop:
	.word	0
t0_data_exp_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_exp_area0, 0x39f5e000)
.seg "data"
t0_data_exp_area0_start:
.skip 6016
t0_data_exp_area0_begin:
	.word	0xfee5de40	! t0_data_exp_area0-0x20
	.word	0xcdbf2299	! t0_data_exp_area0-0x1c
	.word	0xb2cc10aa	! t0_data_exp_area0-0x18
	.word	0xa97d94bf	! t0_data_exp_area0-0x14
	.word	0x3b5045bf	! t0_data_exp_area0-0x10
	.word	0x1118febf	! t0_data_exp_area0-0xc
	.word	0x901f7230	! t0_data_exp_area0-0x8
	.word	0x4eec9709	! t0_data_exp_area0-0x4
.global t0_data_exp_area0; t0_data_exp_area0:
	.word	0xb452d620	! t0_data_exp_area0+0x0
	.word	0x10ad3ff2	! t0_data_exp_area0+0x4
	.word	0x4f4a8565	! t0_data_exp_area0+0x8
	.word	0x35f9ce40	! t0_data_exp_area0+0xc
	.word	0x8d7def84	! t0_data_exp_area0+0x10
	.word	0x72f56776	! t0_data_exp_area0+0x14
	.word	0x1a8f8494	! t0_data_exp_area0+0x18
	.word	0xbdd351f8	! t0_data_exp_area0+0x1c
t0_data_exp_area0_end:
.skip 2112
t0_data_exp_area0_stop:

KDATA_MODULE(t0_module_data_exp_shm_area, 0x2b03c000)
.seg "data"
t0_data_exp_shm_area_start:
t0_data_exp_shm_area_begin:
.global t0_data_exp_shm_area; t0_data_exp_shm_area:
	.word	0x1f67fc5e	! t0_data_exp_shm_area+0x0 (t0)
	.word	0x38bc7437	! t0_data_exp_shm_area+0x4 (t0)
	.word	0x632a0776	! t0_data_exp_shm_area+0x8 (t0)
	.word	0x09347583	! t0_data_exp_shm_area+0xc (t0)
	.word	0x596cde32	! t0_data_exp_shm_area+0x10 (t0)
	.word	0x94084a40	! t0_data_exp_shm_area+0x14 (t0)
	.word	0x0c924791	! t0_data_exp_shm_area+0x18 (t0)
	.word	0x9dabbe86	! t0_data_exp_shm_area+0x1c (t0)
	.word	0x1670e29e	! t0_data_exp_shm_area+0x20 (t0)
	.word	0x7eed9d74	! t0_data_exp_shm_area+0x24 (t0)
	.word	0x7f85c6da	! t0_data_exp_shm_area+0x28 (t0)
	.word	0x1b3130c8	! t0_data_exp_shm_area+0x2c (t0)
	.word	0x0f6f849e	! t0_data_exp_shm_area+0x30 (t0)
	.word	0x66ab5377	! t0_data_exp_shm_area+0x34 (t0)
	.word	0x03a13ca1	! t0_data_exp_shm_area+0x38 (t0)
	.word	0xc7b5034d	! t0_data_exp_shm_area+0x3c (t0)
	.word	0xc45e7e0a	! t0_data_exp_shm_area+0x40 (t0 bload)
	.word	0xf3c590ec	! t0_data_exp_shm_area+0x44
	.word	0x84b1ecad	! t0_data_exp_shm_area+0x48
	.word	0x343c12a3	! t0_data_exp_shm_area+0x4c
	.word	0x9571ed64	! t0_data_exp_shm_area+0x50
	.word	0xcea7e5e5	! t0_data_exp_shm_area+0x54
	.word	0x92a2cca6	! t0_data_exp_shm_area+0x58
	.word	0x74a0a47b	! t0_data_exp_shm_area+0x5c
	.word	0x545693d0	! t0_data_exp_shm_area+0x60
	.word	0x6cd94d97	! t0_data_exp_shm_area+0x64
	.word	0x4a4c1bb3	! t0_data_exp_shm_area+0x68
	.word	0xc563507a	! t0_data_exp_shm_area+0x6c
	.word	0x0ac36f63	! t0_data_exp_shm_area+0x70
	.word	0x9c43f54d	! t0_data_exp_shm_area+0x74
	.word	0x20b25063	! t0_data_exp_shm_area+0x78
	.word	0xa5612251	! t0_data_exp_shm_area+0x7c
	.word	0x5214359f	! t0_data_exp_shm_area+0x80 (t0 bstore)
	.word	0x03bdfe9f	! t0_data_exp_shm_area+0x84
	.word	0x9bab80d0	! t0_data_exp_shm_area+0x88
	.word	0x4901490a	! t0_data_exp_shm_area+0x8c
	.word	0xe2b2723e	! t0_data_exp_shm_area+0x90
	.word	0xf91fb0e3	! t0_data_exp_shm_area+0x94
	.word	0x98b0a901	! t0_data_exp_shm_area+0x98
	.word	0x62bde7a5	! t0_data_exp_shm_area+0x9c
	.word	0x822b4e2e	! t0_data_exp_shm_area+0xa0
	.word	0x6106cde2	! t0_data_exp_shm_area+0xa4
	.word	0x3f127390	! t0_data_exp_shm_area+0xa8
	.word	0xdf10dae3	! t0_data_exp_shm_area+0xac
	.word	0xf82c42dd	! t0_data_exp_shm_area+0xb0
	.word	0x422dfdce	! t0_data_exp_shm_area+0xb4
	.word	0x641f688c	! t0_data_exp_shm_area+0xb8
	.word	0xc9068860	! t0_data_exp_shm_area+0xbc
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
#define T0_KAOS_SEED          d33f85a5494e
#define T0_KAOS_ICOUNT        5000
#define T0_KAOS_AREAS         1
#define T0_KAOS_AREASIZE      64
#define T0_KAOS_AREAOFFSET    6016
#define T0_KAOS_PAGESIZE      8192
#define T0_KAOS_CODECOUNT     5002

#define T0_KAOS_BOOT_VA                  0x6183c000
#define T0_KAOS_BOOT_PA                  0x0000000001ccc000
#define T0_KAOS_BOOT_CACHEABLE           1
#define T0_KAOS_BOOT_NONCACHEABLE        0

#define T0_KAOS_STARTUP_VA               0x5e7ee000
#define T0_KAOS_STARTUP_PA               0x00000000020cc000
#define T0_KAOS_STARTUP_CACHEABLE        1
#define T0_KAOS_STARTUP_NONCACHEABLE     0

#define T0_KAOS_OFFSET_TBL_VA            0x4245e000
#define T0_KAOS_OFFSET_TBL_PA            0x0000000005a80000
#define T0_KAOS_OFFSET_TBL_CACHEABLE     1
#define T0_KAOS_OFFSET_TBL_NONCACHEABLE  0

#define T0_KAOS_DONE_VA                  0x3268e000
#define T0_KAOS_DONE_PA                  0x00000000070f2000
#define T0_KAOS_DONE_CACHEABLE           1
#define T0_KAOS_DONE_NONCACHEABLE        0

#define T0_KAOS_KTBL_VA                  0x0e646000
#define T0_KAOS_KTBL_PA                  0x00000000096d6000
#define T0_KAOS_KTBL_CACHEABLE           1
#define T0_KAOS_KTBL_NONCACHEABLE        0

#define T0_KAOS_SUBR0_VA                 0x20d30000
#define T0_KAOS_SUBR0_PA                 0x000000000b79a000
#define T0_KAOS_SUBR0_CACHEABLE          1
#define T0_KAOS_SUBR0_NONCACHEABLE       0
#define T0_KAOS_SUBR1_VA                 0x52260000
#define T0_KAOS_SUBR1_PA                 0x000000000ce00000
#define T0_KAOS_SUBR1_CACHEABLE          1
#define T0_KAOS_SUBR1_NONCACHEABLE       0
#define T0_KAOS_SUBR2_VA                 0x0e65e000
#define T0_KAOS_SUBR2_PA                 0x000000000e842000
#define T0_KAOS_SUBR2_CACHEABLE          1
#define T0_KAOS_SUBR2_NONCACHEABLE       0
#define T0_KAOS_SUBR3_VA                 0x6ff00000
#define T0_KAOS_SUBR3_PA                 0x000000001184a000
#define T0_KAOS_SUBR3_CACHEABLE          1
#define T0_KAOS_SUBR3_NONCACHEABLE       0

#define T0_KAOS_EXP_REGS_VA              0x3dacc000
#define T0_KAOS_EXP_REGS_PA              0x00000000135d6000
#define T0_KAOS_EXP_REGS_CACHEABLE       1
#define T0_KAOS_EXP_REGS_NONCACHEABLE    0
#define T0_KAOS_RUN_REGS_VA              0x60e82000
#define T0_KAOS_RUN_REGS_PA              0x0000000014abc000
#define T0_KAOS_RUN_REGS_CACHEABLE       1
#define T0_KAOS_RUN_REGS_NONCACHEABLE    0

#define T0_KAOS_EXP_STACK_VA             0x1b94e000
#define T0_KAOS_EXP_STACK_PA             0x00000000162f4000
#define T0_KAOS_EXP_STACK_CACHEABLE      1
#define T0_KAOS_EXP_STACK_NONCACHEABLE   0
#define T0_KAOS_RUN_STACK_VA             0x73a1e000
#define T0_KAOS_RUN_STACK_PA             0x0000000019bb6000
#define T0_KAOS_RUN_STACK_CACHEABLE      1
#define T0_KAOS_RUN_STACK_NONCACHEABLE   0

#define T0_KAOS_AREA0
#define T0_KAOS_EXP_AREA0_VA             0x39f5e000
#define T0_KAOS_EXP_AREA0_PA             0x000000001afc0000
#define T0_KAOS_EXP_AREA0_CACHEABLE      1
#define T0_KAOS_EXP_AREA0_NONCACHEABLE   0
#define T0_KAOS_RUN_AREA0_VA             0x0f4a6000
#define T0_KAOS_RUN_AREA0_PA             0x000000001d084000
#define T0_KAOS_RUN_AREA0_CACHEABLE      1
#define T0_KAOS_RUN_AREA0_NONCACHEABLE   0

#define T0_KAOS_SHM_AREA
#define T0_KAOS_EXP_SHM_AREA_VA          0x2b03c000
#define T0_KAOS_EXP_SHM_AREA_PA          0x0000000001a5c000
#define T0_KAOS_EXP_SHM_AREA_CACHEABLE   1
#define T0_KAOS_EXP_SHM_AREA_NONCACHEABLE 0
#define T0_KAOS_RUN_SHM_AREA_VA          0x36ed2000
#define T0_KAOS_RUN_SHM_AREA_PA          0x00000000018da000
#define T0_KAOS_RUN_SHM_AREA_CACHEABLE   1
#define T0_KAOS_RUN_SHM_AREA_NONCACHEABLE 0

#define T0_KAOS_RANVAL_00     0x85813db6
#define T0_KAOS_RANVAL_01     0xf93a8673
#define T0_KAOS_RANVAL_02     0x6843a6a0
#define T0_KAOS_RANVAL_03     0xd6460ae7
#define T0_KAOS_RANVAL_04     0x90d2f7ea
#define T0_KAOS_RANVAL_05     0xa951c1ad
#define T0_KAOS_RANVAL_06     0x3a088a74
#define T0_KAOS_RANVAL_07     0x667f5001
#define T0_KAOS_RANVAL_08     0xf38c8673
#define T0_KAOS_RANVAL_09     0x74eb0719
#define T0_KAOS_RANVAL_0a     0xa95ce853
#define T0_KAOS_RANVAL_0b     0x3824facf
#define T0_KAOS_RANVAL_0c     0xe23b6655
#define T0_KAOS_RANVAL_0d     0x0069fd0f
#define T0_KAOS_RANVAL_0e     0xe0f4bc0d
#define T0_KAOS_RANVAL_0f     0xec612019
#define T0_KAOS_RANVAL_10     0xb72d8926
#define T0_KAOS_RANVAL_11     0xb85884cf
#define T0_KAOS_RANVAL_12     0x2f19731e
#define T0_KAOS_RANVAL_13     0x3b912fa6
#define T0_KAOS_RANVAL_14     0x904525d1
#define T0_KAOS_RANVAL_15     0xbed6b5f9
#define T0_KAOS_RANVAL_16     0x2132350f
#define T0_KAOS_RANVAL_17     0x93869ecd
#define T0_KAOS_RANVAL_18     0x62325196
#define T0_KAOS_RANVAL_19     0x624a9d42
#define T0_KAOS_RANVAL_1a     0xd7ddce1c
#define T0_KAOS_RANVAL_1b     0xb68f284c
#define T0_KAOS_RANVAL_1c     0xc7bea554
#define T0_KAOS_RANVAL_1d     0xa9c0b265
#define T0_KAOS_RANVAL_1e     0xcaee2016
#define T0_KAOS_RANVAL_1f     0xdf20b557
#define T0_KAOS_RANVAL_20     0xdbd7730a
#define T0_KAOS_RANVAL_21     0x25093956
#define T0_KAOS_RANVAL_22     0x7f2f3d8a
#define T0_KAOS_RANVAL_23     0x453243f4
#define T0_KAOS_RANVAL_24     0x0cc74f9b
#define T0_KAOS_RANVAL_25     0x86ae02bd
#define T0_KAOS_RANVAL_26     0xe1e29323
#define T0_KAOS_RANVAL_27     0x990c5e85
#define T0_KAOS_RANVAL_28     0x46d7f4d0
#define T0_KAOS_RANVAL_29     0x0f9f3fa2
#define T0_KAOS_RANVAL_2a     0xa978c34c
#define T0_KAOS_RANVAL_2b     0xe0f0f8a6
#define T0_KAOS_RANVAL_2c     0x90a1bfa3
#define T0_KAOS_RANVAL_2d     0xe72d5c64
#define T0_KAOS_RANVAL_2e     0xb69b1819
#define T0_KAOS_RANVAL_2f     0xfca3c539
#define T0_KAOS_RANVAL_30     0x3bde4eba
#define T0_KAOS_RANVAL_31     0xb8d116ef
#define T0_KAOS_RANVAL_32     0x963faf67
#define T0_KAOS_RANVAL_33     0x10d959be
#define T0_KAOS_RANVAL_34     0xe6e80531
#define T0_KAOS_RANVAL_35     0x6ba2442d
#define T0_KAOS_RANVAL_36     0xf391c541
#define T0_KAOS_RANVAL_37     0x0624b2e7
#define T0_KAOS_RANVAL_38     0x7d68759c
#define T0_KAOS_RANVAL_39     0x4070f8bc
#define T0_KAOS_RANVAL_3a     0xa129c085
#define T0_KAOS_RANVAL_3b     0xb05fee6b
#define T0_KAOS_RANVAL_3c     0x3e53f94b
#define T0_KAOS_RANVAL_3d     0xd27c08e2
#define T0_KAOS_RANVAL_3e     0x6aa6e5c6
#define T0_KAOS_RANVAL_3f     0xc6064e1a
#define T0_KAOS_RANVAL_40     0x1a70f7cf
#define T0_KAOS_RANVAL_41     0x46fb13bd
#define T0_KAOS_RANVAL_42     0xc476d474
#define T0_KAOS_RANVAL_43     0x87c2d831
#define T0_KAOS_RANVAL_44     0xd58da2bd
#define T0_KAOS_RANVAL_45     0xc8618dbe
#define T0_KAOS_RANVAL_46     0xbdb5323a
#define T0_KAOS_RANVAL_47     0x68d828ef
#define T0_KAOS_RANVAL_48     0x8d6f29b1
#define T0_KAOS_RANVAL_49     0x4ea37e58
#define T0_KAOS_RANVAL_4a     0x01d028a7
#define T0_KAOS_RANVAL_4b     0x963b4967
#define T0_KAOS_RANVAL_4c     0x40b1aa96
#define T0_KAOS_RANVAL_4d     0xb51be4f3
#define T0_KAOS_RANVAL_4e     0xd344990f
#define T0_KAOS_RANVAL_4f     0x5d849f97
#define T0_KAOS_RANVAL_50     0xc5806223
#define T0_KAOS_RANVAL_51     0x743ff926
#define T0_KAOS_RANVAL_52     0x708f2ab3
#define T0_KAOS_RANVAL_53     0xfb774bba
#define T0_KAOS_RANVAL_54     0x3881e0a8
#define T0_KAOS_RANVAL_55     0xb049ba26
#define T0_KAOS_RANVAL_56     0x669d971f
#define T0_KAOS_RANVAL_57     0xa51086da
#define T0_KAOS_RANVAL_58     0x2fcc470a
#define T0_KAOS_RANVAL_59     0x11b78178
#define T0_KAOS_RANVAL_5a     0xb2ddd8d3
#define T0_KAOS_RANVAL_5b     0xe315d6a8
#define T0_KAOS_RANVAL_5c     0x1871d00b
#define T0_KAOS_RANVAL_5d     0x60258cee
#define T0_KAOS_RANVAL_5e     0xe8bf2025
#define T0_KAOS_RANVAL_5f     0xe0322a8f
#define T0_KAOS_RANVAL_60     0xc77629ce
#define T0_KAOS_RANVAL_61     0xa6e1b3d0
#define T0_KAOS_RANVAL_62     0x9d52b265
#define T0_KAOS_RANVAL_63     0xb21f3606
#define T0_KAOS_RANVAL_64     0xe501639a
#define T0_KAOS_RANVAL_65     0xc3e8bb58
#define T0_KAOS_RANVAL_66     0x55f91742
#define T0_KAOS_RANVAL_67     0x20599c25
#define T0_KAOS_RANVAL_68     0xeaad73dd
#define T0_KAOS_RANVAL_69     0x58fffe63
#define T0_KAOS_RANVAL_6a     0xeeea386b
#define T0_KAOS_RANVAL_6b     0xfbb3c07b
#define T0_KAOS_RANVAL_6c     0xb0179a74
#define T0_KAOS_RANVAL_6d     0xd2955c66
#define T0_KAOS_RANVAL_6e     0x9a2d5779
#define T0_KAOS_RANVAL_6f     0xdb04511e
#define T0_KAOS_RANVAL_70     0x33af2329
#define T0_KAOS_RANVAL_71     0x743aa39e
#define T0_KAOS_RANVAL_72     0x117ffe0b
#define T0_KAOS_RANVAL_73     0x6f6ade02
#define T0_KAOS_RANVAL_74     0x754f4c7c
#define T0_KAOS_RANVAL_75     0x6630ea8b
#define T0_KAOS_RANVAL_76     0x9bf94c32
#define T0_KAOS_RANVAL_77     0x9f76118e
#define T0_KAOS_RANVAL_78     0xdcca56a6
#define T0_KAOS_RANVAL_79     0x9dcb8c9e
#define T0_KAOS_RANVAL_7a     0xfd29490f
#define T0_KAOS_RANVAL_7b     0x091c5e6c
#define T0_KAOS_RANVAL_7c     0x1467feda
#define T0_KAOS_RANVAL_7d     0x22b9be30
#define T0_KAOS_RANVAL_7e     0x0d4a19bb
#define T0_KAOS_RANVAL_7f     0x583136a0
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
!    areaoffset     6016
!    ncache         0
!    emulate_ncache 1
!    pagesize       8192
!    invsize        0
!    codecount      5002
!    code           0e646000
!    entry          0e646000
!    fsr_exceptions 00000000
!    fsr_roundmode  00000004
!    fsr_mask       c0000fff
!    seed           d33f85a5494e
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

KTEXT_MODULE(t0_module_ktbl, 0x0e646000)
.seg "text"
	KGLOBAL(t0_ktbl)
t0_ktbl_page_begin:
.global t0_kref; t0_kref:
	.skip 0
t0_ktbl:
	.word	0x36480007	! t0_kref+0x0:   	bge,a,pt	%icc, _kref+0x1c
	.word	0xd850a00a	! t0_kref+0x4:   	ldsh	[%g2 + 0xa], %o4
	.word	0xac868008	! t0_kref+0x8:   	addcc	%i2, %o0, %l6
	.word	0xabb58db2	! t0_kref+0xc:   	fxors	%f22, %f18, %f21
	.word	0xa60ded45	! t0_kref+0x10:   	and	%l7, 0xd45, %l3
	.word	0xabb58494	! t0_kref+0x14:   	fcmple32	%f22, %f20, %l5
	.word	0xc12e001c	! t0_kref+0x18:   	st	%fsr, [%i0 + %i4]
	.word	0x35800001	! t0_kref+0x1c:   	fbue,a	_kref+0x20
	.word	0xa5b48918	! t0_kref+0x20:   	faligndata	%f18, %f24, %f18
	.word	0x9f414000	! t0_kref+0x24:   	mov	%pc, %o7
!	.word	0x248067f5	! t0_kref+0x28:   	ble,a	SYM(t0_subr2)
	   	ble,a	SYM(t0_subr2)
	.word	0xa5b30988	! t0_kref+0x2c:   	bshuffle	%f12, %f8, %f18
	.word	0x23800006	! t0_kref+0x30:   	fbne,a	_kref+0x48
	.word	0xde0e0000	! t0_kref+0x34:   	ldub	[%i0], %o7
	.word	0x8143c000	! t0_kref+0x38:   	stbar
	.word	0x22800001	! t0_kref+0x3c:   	be,a	_kref+0x40
	.word	0x97a00038	! t0_kref+0x40:   	fmovs	%f24, %f11
	.word	0x13085e82	! t0_kref+0x44:   	sethi	%hi(0x217a0800), %o1
	.word	0xa486c00a	! t0_kref+0x48:   	addcc	%i3, %o2, %l2
	.word	0x9bb54d34	! t0_kref+0x4c:   	fandnot1s	%f21, %f20, %f13
	.word	0xd830a020	! t0_kref+0x50:   	sth	%o4, [%g2 + 0x20]
	.word	0x92b33b0a	! t0_kref+0x54:   	orncc	%o4, -0x4f6, %o1
	.word	0xe256001b	! t0_kref+0x58:   	ldsh	[%i0 + %i3], %l1
	.word	0x24800002	! t0_kref+0x5c:   	ble,a	_kref+0x64
	.word	0xa340c000	! t0_kref+0x60:   	mov	%asi, %l1
	.word	0xa9b58496	! t0_kref+0x64:   	fcmple32	%f22, %f22, %l4
	.word	0xa815a6e3	! t0_kref+0x68:   	or	%l6, 0x6e3, %l4
	.word	0x9622b28a	! t0_kref+0x6c:   	sub	%o2, -0xd76, %o3
	.word	0xada01937	! t0_kref+0x70:   	fstod	%f23, %f22
	.word	0xa5a5c830	! t0_kref+0x74:   	fadds	%f23, %f16, %f18
	.word	0xd6f6101d	! t0_kref+0x78:   	stxa	%o3, [%i0 + %i5]0x80
	.word	0xd8680019	! t0_kref+0x7c:   	ldstub	[%g0 + %i1], %o4
	.word	0x001fffff	! t0_kref+0x80:   	illtrap	0x1fffff
	.word	0xa815fde1	! t0_kref+0x84:   	or	%l7, -0x21f, %l4
	.word	0xe248a00c	! t0_kref+0x88:   	ldsb	[%g2 + 0xc], %l1
	.word	0xad1d3d03	! t0_kref+0x8c:   	tsubcctv	%l4, -0x2fd, %l6
	.word	0x9da0054a	! t0_kref+0x90:   	fsqrtd	%f10, %f14
	.word	0x85826080	! t0_kref+0x94:   	wr	%o1, 0x80, %ccr
	.word	0x2923088c	! t0_kref+0x98:   	sethi	%hi(0x8c223000), %l4
	.word	0x9fc00004	! t0_kref+0x9c:   	call	%g0 + %g4
	.word	0xa3a0002e	! t0_kref+0xa0:   	fmovs	%f14, %f17
	.word	0x95a0192a	! t0_kref+0xa4:   	fstod	%f10, %f10
	.word	0xd6ee9018	! t0_kref+0xa8:   	ldstuba	[%i2 + %i0]0x80, %o3
	.word	0x86102004	! t0_kref+0xac:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0xb0:   	bne,a	_kref+0xb0
	.word	0x86a0e001	! t0_kref+0xb4:   	subcc	%g3, 1, %g3
	.word	0xd1bf5a59	! t0_kref+0xb8:   	stda	%f8, [%i5 + %i1]0xd2
	.word	0xee8e101a	! t0_kref+0xbc:   	lduba	[%i0 + %i2]0x80, %l7
	.word	0xee567ffc	! t0_kref+0xc0:   	ldsh	[%i1 - 4], %l7
	.word	0xaef5bc88	! t0_kref+0xc4:   	udivcc	%l6, -0x378, %l7
	.word	0x2c480008	! t0_kref+0xc8:   	bneg,a,pt	%icc, _kref+0xe8
	.word	0xea36c019	! t0_kref+0xcc:   	sth	%l5, [%i3 + %i1]
	.word	0xb1a0054a	! t0_kref+0xd0:   	fsqrtd	%f10, %f24
	.word	0x91a28856	! t0_kref+0xd4:   	faddd	%f10, %f22, %f8
	.word	0xab156cd3	! t0_kref+0xd8:   	taddcctv	%l5, 0xcd3, %l5
	.word	0xa4f20017	! t0_kref+0xdc:   	udivcc	%o0, %l7, %l2
	.word	0xaba2c9b5	! t0_kref+0xe0:   	fdivs	%f11, %f21, %f21
	.word	0x95a0054a	! t0_kref+0xe4:   	fsqrtd	%f10, %f10
	.word	0x9bb3016b	! t0_kref+0xe8:   	edge32ln	%o4, %o3, %o5
	.word	0x91b44c77	! t0_kref+0xec:   	fnors	%f17, %f23, %f8
	.word	0x81854000	! t0_kref+0xf0:   	wr	%l5, %g0, %y
	.word	0xd9f61000	! t0_kref+0xf4:   	casxa	[%i0]0x80, %g0, %o4
	.word	0xef6e401c	! t0_kref+0xf8:   	prefetch	%i1 + %i4, 23
	.word	0x91a01a2f	! t0_kref+0xfc:   	fstoi	%f15, %f8
	.word	0xb1a0002b	! t0_kref+0x100:   	fmovs	%f11, %f24
	.word	0xd5f6100a	! t0_kref+0x104:   	casxa	[%i0]0x80, %o2, %o2
	.word	0xadb30e39	! t0_kref+0x108:   	fands	%f12, %f25, %f22
	.word	0x95a01929	! t0_kref+0x10c:   	fstod	%f9, %f10
	.word	0xa3b580cc	! t0_kref+0x110:   	edge16l	%l6, %o4, %l1
	.word	0x95a01a29	! t0_kref+0x114:   	fstoi	%f9, %f10
	.word	0x86102004	! t0_kref+0x118:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x11c:   	bne,a	_kref+0x11c
	.word	0x86a0e001	! t0_kref+0x120:   	subcc	%g3, 1, %g3
	.word	0xde063fe4	! t0_kref+0x124:   	ld	[%i0 - 0x1c], %o7
	.word	0x962b6b9d	! t0_kref+0x128:   	andn	%o5, 0xb9d, %o3
	.word	0xe09e5000	! t0_kref+0x12c:   	ldda	[%i1]0x80, %l0
	.word	0xec1e7fe0	! t0_kref+0x130:   	ldd	[%i1 - 0x20], %l6
	.word	0xa5a38852	! t0_kref+0x134:   	faddd	%f14, %f18, %f18
	.word	0xde4e3ff7	! t0_kref+0x138:   	ldsb	[%i0 - 9], %o7
	.word	0xa9a0002e	! t0_kref+0x13c:   	fmovs	%f14, %f20
	.word	0x91a0054a	! t0_kref+0x140:   	fsqrtd	%f10, %f8
	.word	0x99b3472d	! t0_kref+0x144:   	fmuld8ulx16	%f13, %f13, %f12
	.word	0xa1a01931	! t0_kref+0x148:   	fstod	%f17, %f16
	.word	0x9da01030	! t0_kref+0x14c:   	fstox	%f16, %f14
	.word	0x9a132d40	! t0_kref+0x150:   	or	%o4, 0xd40, %o5
	.word	0x98257a74	! t0_kref+0x154:   	sub	%l5, -0x58c, %o4
	.word	0xe0d01018	! t0_kref+0x158:   	ldsha	[%g0 + %i0]0x80, %l0
	.word	0x99a00132	! t0_kref+0x15c:   	fabss	%f18, %f12
	.word	0xe9e6500a	! t0_kref+0x160:   	casa	[%i1]0x80, %o2, %l4
	.word	0x86102004	! t0_kref+0x164:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x168:   	bne,a	_kref+0x168
	.word	0x86a0e001	! t0_kref+0x16c:   	subcc	%g3, 1, %g3
	.word	0x9afa800d	! t0_kref+0x170:   	sdivcc	%o2, %o5, %o5
	.word	0xa7a00030	! t0_kref+0x174:   	fmovs	%f16, %f19
	.word	0x8143c000	! t0_kref+0x178:   	stbar
	.word	0x98b20014	! t0_kref+0x17c:   	orncc	%o0, %l4, %o4
	.word	0x90f37e72	! t0_kref+0x180:   	udivcc	%o5, -0x18e, %o0
	.word	0xb1a0002d	! t0_kref+0x184:   	fmovs	%f13, %f24
	.word	0xc5ee100c	! t0_kref+0x188:   	prefetcha	%i0 + %o4, 2
	.word	0xace5400a	! t0_kref+0x18c:   	subccc	%l5, %o2, %l6
	.word	0x26480004	! t0_kref+0x190:   	bl,a,pt	%icc, _kref+0x1a0
	.word	0xa32ea008	! t0_kref+0x194:   	sll	%i2, 0x8, %l1
	.word	0x81ad4ab5	! t0_kref+0x198:   	fcmpes	%fcc0, %f21, %f21
	.word	0xb3a0188b	! t0_kref+0x19c:   	fitos	%f11, %f25
	.word	0x9f0db9f1	! t0_kref+0x1a0:   	tsubcc	%l6, -0x60f, %o7
	.word	0xadb60488	! t0_kref+0x1a4:   	fcmple32	%f24, %f8, %l6
	.word	0xa21279f5	! t0_kref+0x1a8:   	or	%o1, -0x60b, %l1
	.word	0xae2d0009	! t0_kref+0x1ac:   	andn	%l4, %o1, %l7
	.word	0xa1b48590	! t0_kref+0x1b0:   	fcmpgt32	%f18, %f16, %l0
	.word	0xc026401c	! t0_kref+0x1b4:   	clr	[%i1 + %i4]
	.word	0xd410a00e	! t0_kref+0x1b8:   	lduh	[%g2 + 0xe], %o2
	.word	0xe500a038	! t0_kref+0x1bc:   	ld	[%g2 + 0x38], %f18
	.word	0x27800006	! t0_kref+0x1c0:   	fbul,a	_kref+0x1d8
	.word	0xa3408000	! t0_kref+0x1c4:   	mov	%ccr, %l1
	.word	0x38480003	! t0_kref+0x1c8:   	bgu,a,pt	%icc, _kref+0x1d4
	.word	0xd9be188d	! t0_kref+0x1cc:   	stda	%f12, [%i0 + %o5]0xc4
	.word	0x908dfbe1	! t0_kref+0x1d0:   	andcc	%l7, -0x41f, %o0
	.word	0xa4bee34f	! t0_kref+0x1d4:   	xnorcc	%i3, 0x34f, %l2
	.word	0xdb000019	! t0_kref+0x1d8:   	ld	[%g0 + %i1], %f13
	.word	0x99a00554	! t0_kref+0x1dc:   	fsqrtd	%f20, %f12
	.word	0x99a00139	! t0_kref+0x1e0:   	fabss	%f25, %f12
	.word	0x8143e03b	! t0_kref+0x1e4:   	membar	0x3b
	.word	0x91b00cf4	! t0_kref+0x1e8:   	fnot2s	%f20, %f8
	.word	0xa9126b16	! t0_kref+0x1ec:   	taddcctv	%o1, 0xb16, %l4
	.word	0xdd3e4000	! t0_kref+0x1f0:   	std	%f14, [%i1]
	.word	0xa3b5006a	! t0_kref+0x1f4:   	edge8ln	%l4, %o2, %l1
	.word	0xd436c018	! t0_kref+0x1f8:   	sth	%o2, [%i3 + %i0]
	.word	0x989a4014	! t0_kref+0x1fc:   	xorcc	%o1, %l4, %o4
	.word	0x81ab4aad	! t0_kref+0x200:   	fcmpes	%fcc0, %f13, %f13
	.word	0xec266018	! t0_kref+0x204:   	st	%l6, [%i1 + 0x18]
	.word	0x8582c017	! t0_kref+0x208:   	wr	%o3, %l7, %ccr
	.word	0x24480008	! t0_kref+0x20c:   	ble,a,pt	%icc, _kref+0x22c
	.word	0xd256c018	! t0_kref+0x210:   	ldsh	[%i3 + %i0], %o1
	.word	0xd2a81018	! t0_kref+0x214:   	stba	%o1, [%g0 + %i0]0x80
	.word	0x9a3b3983	! t0_kref+0x218:   	xnor	%o4, -0x67d, %o5
	.word	0x2a480004	! t0_kref+0x21c:   	bcs,a,pt	%icc, _kref+0x22c
	.word	0xe448a024	! t0_kref+0x220:   	ldsb	[%g2 + 0x24], %l2
	.word	0x3c800003	! t0_kref+0x224:   	bpos,a	_kref+0x230
	.word	0xe608a01f	! t0_kref+0x228:   	ldub	[%g2 + 0x1f], %l3
	.word	0xafb34129	! t0_kref+0x22c:   	edge32n	%o5, %o1, %l7
	.word	0x91a00030	! t0_kref+0x230:   	fmovs	%f16, %f8
	.word	0xadb30e29	! t0_kref+0x234:   	fands	%f12, %f9, %f22
	.word	0x2e480002	! t0_kref+0x238:   	bvs,a,pt	%icc, _kref+0x240
	.word	0xda567ff0	! t0_kref+0x23c:   	ldsh	[%i1 - 0x10], %o5
	.word	0xf56e401b	! t0_kref+0x240:   	prefetch	%i1 + %i3, 26
	.word	0xa283777d	! t0_kref+0x244:   	addcc	%o5, -0x883, %l1
	.word	0x9ba609b1	! t0_kref+0x248:   	fdivs	%f24, %f17, %f13
	.word	0x9476bbb4	! t0_kref+0x24c:   	udiv	%i2, -0x44c, %o2
	.word	0x9af5b8a0	! t0_kref+0x250:   	udivcc	%l6, -0x760, %o5
	.word	0xe00e2003	! t0_kref+0x254:   	ldub	[%i0 + 3], %l0
	.word	0xae9ae822	! t0_kref+0x258:   	xorcc	%o3, 0x822, %l7
	.word	0xed1e401d	! t0_kref+0x25c:   	ldd	[%i1 + %i5], %f22
	.word	0x9e302835	! t0_kref+0x260:   	orn	%g0, 0x835, %o7
	.word	0x24800004	! t0_kref+0x264:   	ble,a	_kref+0x274
	.word	0x9ba01a4a	! t0_kref+0x268:   	fdtoi	%f10, %f13
	.word	0x96baf959	! t0_kref+0x26c:   	xnorcc	%o3, -0x6a7, %o3
	.word	0x9a353103	! t0_kref+0x270:   	orn	%l4, -0xefd, %o5
	.word	0xadb60d0c	! t0_kref+0x274:   	fandnot1	%f24, %f12, %f22
	.word	0xb1a5882b	! t0_kref+0x278:   	fadds	%f22, %f11, %f24
	.word	0x99a38958	! t0_kref+0x27c:   	fmuld	%f14, %f24, %f12
	.word	0xd8260000	! t0_kref+0x280:   	st	%o4, [%i0]
	.word	0x96bdf5ad	! t0_kref+0x284:   	xnorcc	%l7, -0xa53, %o3
	.word	0xaba018c8	! t0_kref+0x288:   	fdtos	%f8, %f21
	.word	0xafa018d2	! t0_kref+0x28c:   	fdtos	%f18, %f23
	.word	0x929b0009	! t0_kref+0x290:   	xorcc	%o4, %o1, %o1
	.word	0xda480018	! t0_kref+0x294:   	ldsb	[%g0 + %i0], %o5
	.word	0xaf2a6011	! t0_kref+0x298:   	sll	%o1, 0x11, %l7
	.word	0x9db207d2	! t0_kref+0x29c:   	pdist	%f8, %f18, %f14
	.word	0xa40a4009	! t0_kref+0x2a0:   	and	%o1, %o1, %l2
	.word	0xd3260000	! t0_kref+0x2a4:   	st	%f9, [%i0]
	.word	0x8182c000	! t0_kref+0x2a8:   	wr	%o3, %g0, %y
	.word	0xac2eac06	! t0_kref+0x2ac:   	andn	%i2, 0xc06, %l6
	.word	0xf300a014	! t0_kref+0x2b0:   	ld	[%g2 + 0x14], %f25
	.word	0x9fc00004	! t0_kref+0x2b4:   	call	%g0 + %g4
	.word	0xa2d20017	! t0_kref+0x2b8:   	umulcc	%o0, %l7, %l1
	.word	0x39800006	! t0_kref+0x2bc:   	fbuge,a	_kref+0x2d4
	.word	0xfb6e6018	! t0_kref+0x2c0:   	prefetch	%i1 + 0x18, 29
	.word	0xa9a00558	! t0_kref+0x2c4:   	fsqrtd	%f24, %f20
	.word	0xc036401b	! t0_kref+0x2c8:   	clrh	[%i1 + %i3]
	.word	0xa423000c	! t0_kref+0x2cc:   	sub	%o4, %o4, %l2
	.word	0xd8567fee	! t0_kref+0x2d0:   	ldsh	[%i1 - 0x12], %o4
	.word	0xec56c018	! t0_kref+0x2d4:   	ldsh	[%i3 + %i0], %l6
	.word	0x81580000	! t0_kref+0x2d8:   	flushw
	.word	0x31800005	! t0_kref+0x2dc:   	fba,a	_kref+0x2f0
	.word	0xde00a018	! t0_kref+0x2e0:   	ld	[%g2 + 0x18], %o7
	.word	0xd626200c	! t0_kref+0x2e4:   	st	%o3, [%i0 + 0xc]
	.word	0x35480005	! t0_kref+0x2e8:   	fbue,a,pt	%fcc0, _kref+0x2fc
	.word	0x908db756	! t0_kref+0x2ec:   	andcc	%l6, -0x8aa, %o0
	.word	0xec2e7ff9	! t0_kref+0x2f0:   	stb	%l6, [%i1 - 7]
	.word	0xaaa58017	! t0_kref+0x2f4:   	subcc	%l6, %l7, %l5
	.word	0x81acca2e	! t0_kref+0x2f8:   	fcmps	%fcc0, %f19, %f14
	.word	0x8582c00c	! t0_kref+0x2fc:   	wr	%o3, %o4, %ccr
	.word	0xdd067ff0	! t0_kref+0x300:   	ld	[%i1 - 0x10], %f14
	.word	0xd2480019	! t0_kref+0x304:   	ldsb	[%g0 + %i1], %o1
	.word	0xa1418000	! t0_kref+0x308:   	mov	%fprs, %l0
	.word	0xf11f4019	! t0_kref+0x30c:   	ldd	[%i5 + %i1], %f24
	.word	0xd648a012	! t0_kref+0x310:   	ldsb	[%g2 + 0x12], %o3
	.word	0x9bb00774	! t0_kref+0x314:   	fpack16	%f20, %f13
	.word	0xa7a01a50	! t0_kref+0x318:   	fdtoi	%f16, %f19
	.word	0x33800007	! t0_kref+0x31c:   	fbe,a	_kref+0x338
	.word	0xb3b58c6d	! t0_kref+0x320:   	fnors	%f22, %f13, %f25
	.word	0x13234742	! t0_kref+0x324:   	sethi	%hi(0x8d1d0800), %o1
	.word	0xdd3e3fe0	! t0_kref+0x328:   	std	%f14, [%i0 - 0x20]
	.word	0xec40a000	! t0_kref+0x32c:   	ldsw	[%g2], %l6
	.word	0x20480006	! t0_kref+0x330:   	bn,a,pt	%icc, _kref+0x348
	.word	0xe4070018	! t0_kref+0x334:   	ld	[%i4 + %i0], %l2
	.word	0x9f2530ec	! t0_kref+0x338:   	mulscc	%l4, -0xf14, %o7
	.word	0xee067fec	! t0_kref+0x33c:   	ld	[%i1 - 0x14], %l7
	.word	0x81d94001	! t0_kref+0x340:   	flush	%g5 + %g1
	.word	0x38480004	! t0_kref+0x344:   	bgu,a,pt	%icc, _kref+0x354
	.word	0xd1270019	! t0_kref+0x348:   	st	%f8, [%i4 + %i1]
	.word	0xf636600a	! t0_kref+0x34c:   	sth	%i3, [%i1 + 0xa]
	.word	0xac13268c	! t0_kref+0x350:   	or	%o4, 0x68c, %l6
	.word	0xebee101d	! t0_kref+0x354:   	prefetcha	%i0 + %i5, 21
	.word	0xd700a024	! t0_kref+0x358:   	ld	[%g2 + 0x24], %f11
	.word	0x91b48a4c	! t0_kref+0x35c:   	fpadd32	%f18, %f12, %f8
	.word	0xde56001b	! t0_kref+0x360:   	ldsh	[%i0 + %i3], %o7
	.word	0x9123000b	! t0_kref+0x364:   	mulscc	%o4, %o3, %o0
	.word	0x9fa00038	! t0_kref+0x368:   	fmovs	%f24, %f15
	.word	0x90c5f59e	! t0_kref+0x36c:   	addccc	%l7, -0xa62, %o0
	.word	0xe5066008	! t0_kref+0x370:   	ld	[%i1 + 8], %f18
	.word	0x9da40832	! t0_kref+0x374:   	fadds	%f16, %f18, %f14
	.word	0xa5a3094c	! t0_kref+0x378:   	fmuld	%f12, %f12, %f18
	.word	0x9f414000	! t0_kref+0x37c:   	mov	%pc, %o7
!	.word	0x2648671f	! t0_kref+0x380:   	bl,a,pt	%icc, SYM(t0_subr2)
	   	bl,a,pt	%icc, SYM(t0_subr2)
	.word	0x923a273d	! t0_kref+0x384:   	xnor	%o0, 0x73d, %o1
	.word	0x2c480006	! t0_kref+0x388:   	bneg,a,pt	%icc, _kref+0x3a0
	.word	0x9ba209ad	! t0_kref+0x38c:   	fdivs	%f8, %f13, %f13
	.word	0xa3a588b2	! t0_kref+0x390:   	fsubs	%f22, %f18, %f17
	.word	0x22480008	! t0_kref+0x394:   	be,a,pt	%icc, _kref+0x3b4
	.word	0xa5b58c4c	! t0_kref+0x398:   	fnor	%f22, %f12, %f18
	.word	0xa8b6800b	! t0_kref+0x39c:   	orncc	%i2, %o3, %l4
	.word	0xada01928	! t0_kref+0x3a0:   	fstod	%f8, %f22
	.word	0x28800007	! t0_kref+0x3a4:   	bleu,a	_kref+0x3c0
	.word	0xc3ee101a	! t0_kref+0x3a8:   	prefetcha	%i0 + %i2, 1
	.word	0xa1b4848c	! t0_kref+0x3ac:   	fcmple32	%f18, %f12, %l0
	.word	0x9695401b	! t0_kref+0x3b0:   	orcc	%l5, %i3, %o3
	.word	0x9e0d800a	! t0_kref+0x3b4:   	and	%l6, %o2, %o7
	.word	0x81ac0ab9	! t0_kref+0x3b8:   	fcmpes	%fcc0, %f16, %f25
	.word	0xec200018	! t0_kref+0x3bc:   	st	%l6, [%g0 + %i0]
	.word	0x2b800002	! t0_kref+0x3c0:   	fbug,a	_kref+0x3c8
	.word	0xe01e401d	! t0_kref+0x3c4:   	ldd	[%i1 + %i5], %l0
	.word	0x963a4016	! t0_kref+0x3c8:   	xnor	%o1, %l6, %o3
	.word	0xdd06001c	! t0_kref+0x3cc:   	ld	[%i0 + %i4], %f14
	.word	0xe01e3fe8	! t0_kref+0x3d0:   	ldd	[%i0 - 0x18], %l0
	.word	0x81800000	! t0_kref+0x3d4:   	mov	%g0, %y
	.word	0x81ab0a33	! t0_kref+0x3d8:   	fcmps	%fcc0, %f12, %f19
	.word	0xeb6e001a	! t0_kref+0x3dc:   	prefetch	%i0 + %i2, 21
	.word	0xa83d000c	! t0_kref+0x3e0:   	xnor	%l4, %o4, %l4
	.word	0x95a00539	! t0_kref+0x3e4:   	fsqrts	%f25, %f10
	.word	0xa23b4014	! t0_kref+0x3e8:   	xnor	%o5, %l4, %l1
	.word	0xee0e2001	! t0_kref+0x3ec:   	ldub	[%i0 + 1], %l7
	.word	0x9ac6a36d	! t0_kref+0x3f0:   	addccc	%i2, 0x36d, %o5
	.word	0x93b58280	! t0_kref+0x3f4:   	array32	%l6, %g0, %o1
	.word	0x20480002	! t0_kref+0x3f8:   	bn,a,pt	%icc, _kref+0x400
	.word	0x91a01913	! t0_kref+0x3fc:   	fitod	%f19, %f8
	.word	0xa5b2ceec	! t0_kref+0x400:   	fornot2s	%f11, %f12, %f18
	.word	0x95b48e10	! t0_kref+0x404:   	fand	%f18, %f16, %f10
	.word	0xdaa01018	! t0_kref+0x408:   	sta	%o5, [%g0 + %i0]0x80
	.word	0x81ab4a37	! t0_kref+0x40c:   	fcmps	%fcc0, %f13, %f23
	.word	0xea062000	! t0_kref+0x410:   	ld	[%i0], %l5
	.word	0xf83e7ff0	! t0_kref+0x414:   	std	%i4, [%i1 - 0x10]
	.word	0xd0480018	! t0_kref+0x418:   	ldsb	[%g0 + %i0], %o0
	.word	0xf6267fe0	! t0_kref+0x41c:   	st	%i3, [%i1 - 0x20]
	.word	0x81aa8a4c	! t0_kref+0x420:   	fcmpd	%fcc0, %f10, %f12
	.word	0xf6270018	! t0_kref+0x424:   	st	%i3, [%i4 + %i0]
	.word	0xa9a3cd39	! t0_kref+0x428:   	fsmuld	%f15, %f25, %f20
	.word	0xd1380018	! t0_kref+0x42c:   	std	%f8, [%g0 + %i0]
	.word	0xada5c839	! t0_kref+0x430:   	fadds	%f23, %f25, %f22
	.word	0x9ba0002f	! t0_kref+0x434:   	fmovs	%f15, %f13
	.word	0x9744c000	! t0_kref+0x438:   	mov	%gsr, %o3
	.word	0x34800002	! t0_kref+0x43c:   	bg,a	_kref+0x444
	.word	0xa852325d	! t0_kref+0x440:   	umul	%o0, -0xda3, %l4
	.word	0x131b3bf5	! t0_kref+0x444:   	sethi	%hi(0x6cefd400), %o1
	.word	0x81ab8a31	! t0_kref+0x448:   	fcmps	%fcc0, %f14, %f17
	.word	0x99b00fc0	! t0_kref+0x44c:   	fone	%f12
	.word	0xa1a00133	! t0_kref+0x450:   	fabss	%f19, %f16
	.word	0xa08d4008	! t0_kref+0x454:   	andcc	%l5, %o0, %l0
	.word	0x24480006	! t0_kref+0x458:   	ble,a,pt	%icc, _kref+0x470
	.word	0x15325cff	! t0_kref+0x45c:   	sethi	%hi(0xc973fc00), %o2
	.word	0xdaae9019	! t0_kref+0x460:   	stba	%o5, [%i2 + %i1]0x80
	.word	0xd848a028	! t0_kref+0x464:   	ldsb	[%g2 + 0x28], %o4
	.word	0x9ba0002f	! t0_kref+0x468:   	fmovs	%f15, %f13
	.word	0x96124014	! t0_kref+0x46c:   	or	%o1, %l4, %o3
	.word	0xa5a01a50	! t0_kref+0x470:   	fdtoi	%f16, %f18
	.word	0xada30852	! t0_kref+0x474:   	faddd	%f12, %f18, %f22
	.word	0x81ad4a38	! t0_kref+0x478:   	fcmps	%fcc0, %f21, %f24
	.word	0x8610201c	! t0_kref+0x47c:   	mov	0x1c, %g3
	.word	0x86a0e001	! t0_kref+0x480:   	subcc	%g3, 1, %g3
	.word	0x22800008	! t0_kref+0x484:   	be,a	_kref+0x4a4
	.word	0xd1be5897	! t0_kref+0x488:   	stda	%f8, [%i1 + %l7]0xc4
	.word	0xa5a01a4c	! t0_kref+0x48c:   	fdtoi	%f12, %f18
	.word	0x91b28408	! t0_kref+0x490:   	fcmple16	%f10, %f8, %o0
	.word	0x95a609d6	! t0_kref+0x494:   	fdivd	%f24, %f22, %f10
	.word	0xa7a01a4a	! t0_kref+0x498:   	fdtoi	%f10, %f19
	.word	0x91a58858	! t0_kref+0x49c:   	faddd	%f22, %f24, %f8
	.word	0x91a309d4	! t0_kref+0x4a0:   	fdivd	%f12, %f20, %f8
	.word	0xdd1e0000	! t0_kref+0x4a4:   	ldd	[%i0], %f14
	.word	0xe41e001d	! t0_kref+0x4a8:   	ldd	[%i0 + %i5], %l2
	.word	0x2f800001	! t0_kref+0x4ac:   	fbu,a	_kref+0x4b0
	.word	0x112b3aba	! t0_kref+0x4b0:   	sethi	%hi(0xaceae800), %o0
	.word	0x86102003	! t0_kref+0x4b4:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x4b8:   	bne,a	_kref+0x4b8
	.word	0x86a0e001	! t0_kref+0x4bc:   	subcc	%g3, 1, %g3
	.word	0xda162012	! t0_kref+0x4c0:   	lduh	[%i0 + 0x12], %o5
	.word	0x28480001	! t0_kref+0x4c4:   	bleu,a,pt	%icc, _kref+0x4c8
	.word	0xd9be188c	! t0_kref+0x4c8:   	stda	%f12, [%i0 + %o4]0xc4
	.word	0x91a00558	! t0_kref+0x4cc:   	fsqrtd	%f24, %f8
	.word	0xaba00134	! t0_kref+0x4d0:   	fabss	%f20, %f21
	.word	0xb1b58c48	! t0_kref+0x4d4:   	fnor	%f22, %f8, %f24
	.word	0xa1a01939	! t0_kref+0x4d8:   	fstod	%f25, %f16
	.word	0xafa348b9	! t0_kref+0x4dc:   	fsubs	%f13, %f25, %f23
	.word	0xa5130009	! t0_kref+0x4e0:   	taddcctv	%o4, %o1, %l2
	.word	0x9fa01a4c	! t0_kref+0x4e4:   	fdtoi	%f12, %f15
	.word	0xe6680019	! t0_kref+0x4e8:   	ldstub	[%g0 + %i1], %l3
	.word	0x8143c000	! t0_kref+0x4ec:   	stbar
	.word	0xe8070019	! t0_kref+0x4f0:   	ld	[%i4 + %i1], %l4
	.word	0x96a83990	! t0_kref+0x4f4:   	andncc	%g0, -0x670, %o3
	.word	0xa0fef22e	! t0_kref+0x4f8:   	sdivcc	%i3, -0xdd2, %l0
	.word	0x36480003	! t0_kref+0x4fc:   	bge,a,pt	%icc, _kref+0x508
	.word	0xaa802aa2	! t0_kref+0x500:   	addcc	%g0, 0xaa2, %l5
	.word	0xa4356da0	! t0_kref+0x504:   	orn	%l5, 0xda0, %l2
	.word	0xaba2c8b7	! t0_kref+0x508:   	fsubs	%f11, %f23, %f21
	.word	0x8143e040	! t0_kref+0x50c:   	membar	0x40
	.word	0xada58832	! t0_kref+0x510:   	fadds	%f22, %f18, %f22
	.word	0xe8200018	! t0_kref+0x514:   	st	%l4, [%g0 + %i0]
	.word	0xee50a004	! t0_kref+0x518:   	ldsh	[%g2 + 4], %l7
	.word	0x81aa0ace	! t0_kref+0x51c:   	fcmped	%fcc0, %f8, %f14
	.word	0x2f1928a4	! t0_kref+0x520:   	sethi	%hi(0x64a29000), %l7
	.word	0x909d0015	! t0_kref+0x524:   	xorcc	%l4, %l5, %o0
	.word	0xe056200c	! t0_kref+0x528:   	ldsh	[%i0 + 0xc], %l0
	.word	0x170af82b	! t0_kref+0x52c:   	sethi	%hi(0x2be0ac00), %o3
	.word	0x91a00548	! t0_kref+0x530:   	fsqrtd	%f8, %f8
	.word	0xe36e401b	! t0_kref+0x534:   	prefetch	%i1 + %i3, 17
	.word	0x26800002	! t0_kref+0x538:   	bl,a	_kref+0x540
	.word	0xa1a0192f	! t0_kref+0x53c:   	fstod	%f15, %f16
	.word	0xe24e8019	! t0_kref+0x540:   	ldsb	[%i2 + %i1], %l1
	.word	0xd608a026	! t0_kref+0x544:   	ldub	[%g2 + 0x26], %o3
	.word	0x2e480005	! t0_kref+0x548:   	bvs,a,pt	%icc, _kref+0x55c
	.word	0xa6a6a9c7	! t0_kref+0x54c:   	subcc	%i2, 0x9c7, %l3
	.word	0x9fa649af	! t0_kref+0x550:   	fdivs	%f25, %f15, %f15
	.word	0xda564000	! t0_kref+0x554:   	ldsh	[%i1], %o5
	.word	0xf3000018	! t0_kref+0x558:   	ld	[%g0 + %i0], %f25
	.word	0x9a0dab57	! t0_kref+0x55c:   	and	%l6, 0xb57, %o5
	call	SYM(t0_subr2)
	.word	0xa716efbe	! t0_kref+0x564:   	taddcctv	%i3, 0xfbe, %l3
	.word	0xb1a00554	! t0_kref+0x568:   	fsqrtd	%f20, %f24
	.word	0x81ae0ad0	! t0_kref+0x56c:   	fcmped	%fcc0, %f24, %f16
	.word	0x9bb3058e	! t0_kref+0x570:   	fcmpgt32	%f12, %f14, %o5
	.word	0x34480001	! t0_kref+0x574:   	bg,a,pt	%icc, _kref+0x578
	.word	0xada000ce	! t0_kref+0x578:   	fnegd	%f14, %f22
	.word	0xd240a004	! t0_kref+0x57c:   	ldsw	[%g2 + 4], %o1
	.word	0x92f5b1f2	! t0_kref+0x580:   	udivcc	%l6, -0xe0e, %o1
	.word	0xd7066008	! t0_kref+0x584:   	ld	[%i1 + 8], %f11
	.word	0x858227b5	! t0_kref+0x588:   	wr	%o0, 0x7b5, %ccr
	.word	0xa5a30838	! t0_kref+0x58c:   	fadds	%f12, %f24, %f18
	.word	0xe800a01c	! t0_kref+0x590:   	ld	[%g2 + 0x1c], %l4
	.word	0x9e3a4008	! t0_kref+0x594:   	xnor	%o1, %o0, %o7
	.word	0xda30a038	! t0_kref+0x598:   	sth	%o5, [%g2 + 0x38]
	.word	0x99a01914	! t0_kref+0x59c:   	fitod	%f20, %f12
	.word	0x90bd6f6d	! t0_kref+0x5a0:   	xnorcc	%l5, 0xf6d, %o0
	.word	0xa29e800c	! t0_kref+0x5a4:   	xorcc	%i2, %o4, %l1
	.word	0x8143e040	! t0_kref+0x5a8:   	membar	0x40
	.word	0x20800006	! t0_kref+0x5ac:   	bn,a	_kref+0x5c4
	.word	0x93a0188c	! t0_kref+0x5b0:   	fitos	%f12, %f9
	.word	0xa216800c	! t0_kref+0x5b4:   	or	%i2, %o4, %l1
	.word	0x91b28718	! t0_kref+0x5b8:   	fmuld8sux16	%f10, %f24, %f8
	.word	0x93a00536	! t0_kref+0x5bc:   	fsqrts	%f22, %f9
	.word	0xee262010	! t0_kref+0x5c0:   	st	%l7, [%i0 + 0x10]
	.word	0x9ba308b9	! t0_kref+0x5c4:   	fsubs	%f12, %f25, %f13
	.word	0xac824009	! t0_kref+0x5c8:   	addcc	%o1, %o1, %l6
	.word	0x91b60454	! t0_kref+0x5cc:   	fcmpne16	%f24, %f20, %o0
	.word	0xada448aa	! t0_kref+0x5d0:   	fsubs	%f17, %f10, %f22
	.word	0xa144c000	! t0_kref+0x5d4:   	mov	%gsr, %l0
	.word	0xa5a5c9b2	! t0_kref+0x5d8:   	fdivs	%f23, %f18, %f18
	.word	0x9815000a	! t0_kref+0x5dc:   	or	%l4, %o2, %o4
	.word	0x95a01a34	! t0_kref+0x5e0:   	fstoi	%f20, %f10
	.word	0x27800004	! t0_kref+0x5e4:   	fbul,a	_kref+0x5f4
	.word	0xeb263fe8	! t0_kref+0x5e8:   	st	%f21, [%i0 - 0x18]
	.word	0xda10a034	! t0_kref+0x5ec:   	lduh	[%g2 + 0x34], %o5
	.word	0x96082c77	! t0_kref+0x5f0:   	and	%g0, 0xc77, %o3
	.word	0xa436a865	! t0_kref+0x5f4:   	orn	%i2, 0x865, %l2
	.word	0xa9a24d2b	! t0_kref+0x5f8:   	fsmuld	%f9, %f11, %f20
	.word	0xe53e7ff8	! t0_kref+0x5fc:   	std	%f18, [%i1 - 8]
	.word	0x81ac0a2b	! t0_kref+0x600:   	fcmps	%fcc0, %f16, %f11
	.word	0xe16e001a	! t0_kref+0x604:   	prefetch	%i0 + %i2, 16
	.word	0xa7a01896	! t0_kref+0x608:   	fitos	%f22, %f19
	.word	0x9da0190e	! t0_kref+0x60c:   	fitod	%f14, %f14
	.word	0x91a01939	! t0_kref+0x610:   	fstod	%f25, %f8
	.word	0x9fa5c8b8	! t0_kref+0x614:   	fsubs	%f23, %f24, %f15
	.word	0xa1b50c6d	! t0_kref+0x618:   	fnors	%f20, %f13, %f16
	.word	0xab228015	! t0_kref+0x61c:   	mulscc	%o2, %l5, %l5
	.word	0xa2920014	! t0_kref+0x620:   	orcc	%o0, %l4, %l1
	.word	0x9db30a4c	! t0_kref+0x624:   	fpadd32	%f12, %f12, %f14
	.word	0x91a0188a	! t0_kref+0x628:   	fitos	%f10, %f8
	.word	0x87802080	! t0_kref+0x62c:   	mov	0x80, %asi
	.word	0xa7a01a29	! t0_kref+0x630:   	fstoi	%f9, %f19
	.word	0x98fec00d	! t0_kref+0x634:   	sdivcc	%i3, %o5, %o4
	.word	0x9efdb646	! t0_kref+0x638:   	sdivcc	%l6, -0x9ba, %o7
	.word	0x81adcab9	! t0_kref+0x63c:   	fcmpes	%fcc0, %f23, %f25
	.word	0xc1e6500c	! t0_kref+0x640:   	casa	[%i1]0x80, %o4, %g0
	.word	0xaea30017	! t0_kref+0x644:   	subcc	%o4, %l7, %l7
	.word	0x96b53a88	! t0_kref+0x648:   	orncc	%l4, -0x578, %o3
	.word	0x35800003	! t0_kref+0x64c:   	fbue,a	_kref+0x658
	.word	0xe24e6003	! t0_kref+0x650:   	ldsb	[%i1 + 3], %l1
	.word	0xdede1000	! t0_kref+0x654:   	ldxa	[%i0]0x80, %o7
	.word	0x9fc10000	! t0_kref+0x658:   	call	%g4
	.word	0x9bb48408	! t0_kref+0x65c:   	fcmple16	%f18, %f8, %o5
	.word	0xea6e8019	! t0_kref+0x660:   	ldstub	[%i2 + %i1], %l5
	.word	0xdaa8a036	! t0_kref+0x664:   	stba	%o5, [%g2 + 0x36]%asi
	.word	0xd6566008	! t0_kref+0x668:   	ldsh	[%i1 + 8], %o3
	.word	0x9bb00c20	! t0_kref+0x66c:   	fzeros	%f13
	.word	0x9418001a	! t0_kref+0x670:   	xor	%g0, %i2, %o2
	.word	0xd9180019	! t0_kref+0x674:   	ldd	[%g0 + %i1], %f12
	.word	0x81ad0a35	! t0_kref+0x678:   	fcmps	%fcc0, %f20, %f21
	.word	0xd9be1a5c	! t0_kref+0x67c:   	stda	%f12, [%i0 + %i4]0xd2
	.word	0xa3a01a4a	! t0_kref+0x680:   	fdtoi	%f10, %f17
	.word	0x980d801a	! t0_kref+0x684:   	and	%l6, %i2, %o4
	.word	0x24800005	! t0_kref+0x688:   	ble,a	_kref+0x69c
	.word	0xe41e0000	! t0_kref+0x68c:   	ldd	[%i0], %l2
	.word	0x9ba01a58	! t0_kref+0x690:   	fdtoi	%f24, %f13
	.word	0xef68a04a	! t0_kref+0x694:   	prefetch	%g2 + 0x4a, 23
	.word	0x1f2a8ac1	! t0_kref+0x698:   	sethi	%hi(0xaa2b0400), %o7
	.word	0xdd066000	! t0_kref+0x69c:   	ld	[%i1], %f14
	.word	0xaab54015	! t0_kref+0x6a0:   	orncc	%l5, %l5, %l5
	.word	0x99a588b5	! t0_kref+0x6a4:   	fsubs	%f22, %f21, %f12
	.word	0x81ae0a4c	! t0_kref+0x6a8:   	fcmpd	%fcc0, %f24, %f12
	.word	0x91a01937	! t0_kref+0x6ac:   	fstod	%f23, %f8
	.word	0xec500018	! t0_kref+0x6b0:   	ldsh	[%g0 + %i0], %l6
	.word	0xd1267fec	! t0_kref+0x6b4:   	st	%f8, [%i1 - 0x14]
	.word	0xe68e501a	! t0_kref+0x6b8:   	lduba	[%i1 + %i2]0x80, %l3
	.word	0xe76e7ff8	! t0_kref+0x6bc:   	prefetch	%i1 - 8, 19
	.word	0xb1a40958	! t0_kref+0x6c0:   	fmuld	%f16, %f24, %f24
	.word	0x2d800006	! t0_kref+0x6c4:   	fbg,a	_kref+0x6dc
	.word	0xa5b30750	! t0_kref+0x6c8:   	fpack32	%f12, %f16, %f18
	.word	0xaa054014	! t0_kref+0x6cc:   	add	%l5, %l4, %l5
	.word	0x93a509aa	! t0_kref+0x6d0:   	fdivs	%f20, %f10, %f9
	.word	0xa9b40a12	! t0_kref+0x6d4:   	fpadd16	%f16, %f18, %f20
	.word	0x3a800003	! t0_kref+0x6d8:   	bcc,a	_kref+0x6e4
	.word	0xee4e001a	! t0_kref+0x6dc:   	ldsb	[%i0 + %i2], %l7
	.word	0xa5b28008	! t0_kref+0x6e0:   	edge8	%o2, %o0, %l2
	.word	0x9fa5082a	! t0_kref+0x6e4:   	fadds	%f20, %f10, %f15
	.word	0xaef2c008	! t0_kref+0x6e8:   	udivcc	%o3, %o0, %l7
	.word	0xa43830a5	! t0_kref+0x6ec:   	xnor	%g0, -0xf5b, %l2
	.word	0x98424016	! t0_kref+0x6f0:   	addc	%o1, %l6, %o4
	.word	0xc807bff0	! t0_kref+0x6f4:   	ld	[%fp - 0x10], %g4
	.word	0x93a01092	! t0_kref+0x6f8:   	fxtos	%f18, %f9
	.word	0xe51e3fe8	! t0_kref+0x6fc:   	ldd	[%i0 - 0x18], %f18
	.word	0xaba2c8ac	! t0_kref+0x700:   	fsubs	%f11, %f12, %f21
	.word	0x91a0054c	! t0_kref+0x704:   	fsqrtd	%f12, %f8
	.word	0x99b00f39	! t0_kref+0x708:   	fsrc2s	%f25, %f12
	.word	0x983d4016	! t0_kref+0x70c:   	xnor	%l5, %l6, %o4
	.word	0x99a01a50	! t0_kref+0x710:   	fdtoi	%f16, %f12
	.word	0xd8d0a026	! t0_kref+0x714:   	ldsha	[%g2 + 0x26]%asi, %o4
	.word	0x8d82401b	! t0_kref+0x718:   	wr	%o1, %i3, %fprs
	.word	0x91b5c679	! t0_kref+0x71c:   	fmul8x16au	%f23, %f25, %f8
	.word	0xaa12f307	! t0_kref+0x720:   	or	%o3, -0xcf9, %l5
	.word	0x972b000b	! t0_kref+0x724:   	sll	%o4, %o3, %o3
	.word	0xe0566012	! t0_kref+0x728:   	ldsh	[%i1 + 0x12], %l0
	.word	0xd84e001a	! t0_kref+0x72c:   	ldsb	[%i0 + %i2], %o4
	.word	0x9abac00d	! t0_kref+0x730:   	xnorcc	%o3, %o5, %o5
	.word	0xe3266010	! t0_kref+0x734:   	st	%f17, [%i1 + 0x10]
	.word	0xd836001b	! t0_kref+0x738:   	sth	%o4, [%i0 + %i3]
	.word	0x95a3082d	! t0_kref+0x73c:   	fadds	%f12, %f13, %f10
	.word	0x94500008	! t0_kref+0x740:   	umul	%g0, %o0, %o2
	.word	0x81aa4ab3	! t0_kref+0x744:   	fcmpes	%fcc0, %f9, %f19
	.word	0xa7a00139	! t0_kref+0x748:   	fabss	%f25, %f19
	.word	0x9725801a	! t0_kref+0x74c:   	mulscc	%l6, %i2, %o3
	.word	0x86102001	! t0_kref+0x750:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x754:   	bne,a	_kref+0x754
	.word	0x86a0e001	! t0_kref+0x758:   	subcc	%g3, 1, %g3
	.word	0xc0270018	! t0_kref+0x75c:   	clr	[%i4 + %i0]
	.word	0x81ad0acc	! t0_kref+0x760:   	fcmped	%fcc0, %f20, %f12
	.word	0x9af6f4bd	! t0_kref+0x764:   	udivcc	%i3, -0xb43, %o5
	.word	0x81ab0acc	! t0_kref+0x768:   	fcmped	%fcc0, %f12, %f12
	.word	0xe07961dc	! t0_kref+0x76c:   	swap	[%g5 + 0x1dc], %l0
	.word	0xd4000019	! t0_kref+0x770:   	ld	[%g0 + %i1], %o2
	.word	0xa432001b	! t0_kref+0x774:   	orn	%o0, %i3, %l2
	.word	0xac2b0017	! t0_kref+0x778:   	andn	%o4, %l7, %l6
	.word	0xa5a60948	! t0_kref+0x77c:   	fmuld	%f24, %f8, %f18
	.word	0xecc8a03c	! t0_kref+0x780:   	ldsba	[%g2 + 0x3c]%asi, %l6
	.word	0x980dc017	! t0_kref+0x784:   	and	%l7, %l7, %o4
	.word	0xd6200019	! t0_kref+0x788:   	st	%o3, [%g0 + %i1]
	.word	0xe0963ff8	! t0_kref+0x78c:   	lduha	[%i0 - 8]%asi, %l0
	.word	0xa4f2a8b2	! t0_kref+0x790:   	udivcc	%o2, 0x8b2, %l2
	.word	0xa8c2c00b	! t0_kref+0x794:   	addccc	%o3, %o3, %l4
	.word	0x9a834015	! t0_kref+0x798:   	addcc	%o5, %l5, %o5
	.word	0xa6b27253	! t0_kref+0x79c:   	orncc	%o1, -0xdad, %l3
	.word	0xada00548	! t0_kref+0x7a0:   	fsqrtd	%f8, %f22
	.word	0x213618ca	! t0_kref+0x7a4:   	sethi	%hi(0xd8632800), %l0
	.word	0xeff61008	! t0_kref+0x7a8:   	casxa	[%i0]0x80, %o0, %l7
	.word	0xa9a00534	! t0_kref+0x7ac:   	fsqrts	%f20, %f20
	.word	0xc1e8a084	! t0_kref+0x7b0:   	prefetcha	%g2 + 0x84, 0
	.word	0xc020a010	! t0_kref+0x7b4:   	clr	[%g2 + 0x10]
	.word	0xa1a00132	! t0_kref+0x7b8:   	fabss	%f18, %f16
	.word	0x9da01932	! t0_kref+0x7bc:   	fstod	%f18, %f14
	.word	0x81dd4019	! t0_kref+0x7c0:   	flush	%l5 + %i1
	.word	0xe6563fe6	! t0_kref+0x7c4:   	ldsh	[%i0 - 0x1a], %l3
	.word	0xaa65f190	! t0_kref+0x7c8:   	subc	%l7, -0xe70, %l5
	.word	0xe7270019	! t0_kref+0x7cc:   	st	%f19, [%i4 + %i1]
	.word	0x91b40a12	! t0_kref+0x7d0:   	fpadd16	%f16, %f18, %f8
	.word	0x97a00038	! t0_kref+0x7d4:   	fmovs	%f24, %f11
	.word	0xe290a030	! t0_kref+0x7d8:   	lduha	[%g2 + 0x30]%asi, %l1
	.word	0xada01896	! t0_kref+0x7dc:   	fitos	%f22, %f22
	.word	0xa715f5be	! t0_kref+0x7e0:   	taddcctv	%l7, -0xa42, %l3
	.word	0x95a00052	! t0_kref+0x7e4:   	fmovd	%f18, %f10
	.word	0xea30a026	! t0_kref+0x7e8:   	sth	%l5, [%g2 + 0x26]
	.word	0x24480003	! t0_kref+0x7ec:   	ble,a,pt	%icc, _kref+0x7f8
	.word	0x9012400d	! t0_kref+0x7f0:   	or	%o1, %o5, %o0
	.word	0x24480003	! t0_kref+0x7f4:   	ble,a,pt	%icc, _kref+0x800
	.word	0xd828a02f	! t0_kref+0x7f8:   	stb	%o4, [%g2 + 0x2f]
	.word	0xadb54280	! t0_kref+0x7fc:   	array32	%l5, %g0, %l6
	.word	0xa4b52ef3	! t0_kref+0x800:   	orncc	%l4, 0xef3, %l2
	.word	0x9da4894a	! t0_kref+0x804:   	fmuld	%f18, %f10, %f14
	.word	0xadb50596	! t0_kref+0x808:   	fcmpgt32	%f20, %f22, %l6
	.word	0xde500018	! t0_kref+0x80c:   	ldsh	[%g0 + %i0], %o7
	.word	0xec00a020	! t0_kref+0x810:   	ld	[%g2 + 0x20], %l6
	.word	0xd920a00c	! t0_kref+0x814:   	st	%f12, [%g2 + 0xc]
	.word	0x8143c000	! t0_kref+0x818:   	stbar
	.word	0x9da01889	! t0_kref+0x81c:   	fitos	%f9, %f14
	.word	0xa0a58016	! t0_kref+0x820:   	subcc	%l6, %l6, %l0
	.word	0xada0004c	! t0_kref+0x824:   	fmovd	%f12, %f22
	.word	0xeaa8a005	! t0_kref+0x828:   	stba	%l5, [%g2 + 5]%asi
	.word	0x81820000	! t0_kref+0x82c:   	wr	%o0, %g0, %y
	.word	0xe7066008	! t0_kref+0x830:   	ld	[%i1 + 8], %f19
	.word	0x81858000	! t0_kref+0x834:   	wr	%l6, %g0, %y
	.word	0xd448a003	! t0_kref+0x838:   	ldsb	[%g2 + 3], %o2
	.word	0xd0c8a00e	! t0_kref+0x83c:   	ldsba	[%g2 + 0xe]%asi, %o0
	.word	0x91a208b0	! t0_kref+0x840:   	fsubs	%f8, %f16, %f8
	.word	0x9db6462c	! t0_kref+0x844:   	fmul8x16	%f25, %f12, %f14
	.word	0xa8b5c017	! t0_kref+0x848:   	orncc	%l7, %l7, %l4
	.word	0x9db4070a	! t0_kref+0x84c:   	fmuld8sux16	%f16, %f10, %f14
	.word	0xa1a00129	! t0_kref+0x850:   	fabss	%f9, %f16
	.word	0xa7a01a2c	! t0_kref+0x854:   	fstoi	%f12, %f19
	.word	0x93b00ce9	! t0_kref+0x858:   	fnot2s	%f9, %f9
	.word	0xa5a50d2e	! t0_kref+0x85c:   	fsmuld	%f20, %f14, %f18
	call	SYM(t0_subr1)
	.word	0xedbe3fe0	! t0_kref+0x864:   	stda	%f22, [%i0 - 0x20]%asi
	.word	0x9fb34dad	! t0_kref+0x868:   	fxors	%f13, %f13, %f15
	.word	0xa2b3400c	! t0_kref+0x86c:   	orncc	%o5, %o4, %l1
	.word	0xa7b54fb7	! t0_kref+0x870:   	fors	%f21, %f23, %f19
	.word	0xef6e001d	! t0_kref+0x874:   	prefetch	%i0 + %i5, 23
	.word	0xea563ff8	! t0_kref+0x878:   	ldsh	[%i0 - 8], %l5
	.word	0x91b20c58	! t0_kref+0x87c:   	fnor	%f8, %f24, %f8
	.word	0x81aacaaa	! t0_kref+0x880:   	fcmpes	%fcc0, %f11, %f10
	.word	0x99a0054a	! t0_kref+0x884:   	fsqrtd	%f10, %f12
	.word	0x99b34718	! t0_kref+0x888:   	fmuld8sux16	%f13, %f24, %f12
	.word	0xe416c018	! t0_kref+0x88c:   	lduh	[%i3 + %i0], %l2
	.word	0xb1a0054a	! t0_kref+0x890:   	fsqrtd	%f10, %f24
	.word	0xf3264000	! t0_kref+0x894:   	st	%f25, [%i1]
	.word	0xada0054e	! t0_kref+0x898:   	fsqrtd	%f14, %f22
	.word	0x942b6742	! t0_kref+0x89c:   	andn	%o5, 0x742, %o2
	.word	0xd700a000	! t0_kref+0x8a0:   	ld	[%g2], %f11
	.word	0x8143c000	! t0_kref+0x8a4:   	stbar
	.word	0x952ec00c	! t0_kref+0x8a8:   	sll	%i3, %o4, %o2
	.word	0xa5a5c9b5	! t0_kref+0x8ac:   	fdivs	%f23, %f21, %f18
	.word	0xa5b4048e	! t0_kref+0x8b0:   	fcmple32	%f16, %f14, %l2
	.word	0xc36e4016	! t0_kref+0x8b4:   	prefetch	%i1 + %l6, 1
	.word	0xa8b6801b	! t0_kref+0x8b8:   	orncc	%i2, %i3, %l4
	.word	0xa5a0054c	! t0_kref+0x8bc:   	fsqrtd	%f12, %f18
	.word	0x1b2f3ee9	! t0_kref+0x8c0:   	sethi	%hi(0xbcfba400), %o5
	.word	0xe1067fe0	! t0_kref+0x8c4:   	ld	[%i1 - 0x20], %f16
	.word	0x2f800001	! t0_kref+0x8c8:   	fbu,a	_kref+0x8cc
	.word	0xa486a5c7	! t0_kref+0x8cc:   	addcc	%i2, 0x5c7, %l2
	.word	0xac9a401b	! t0_kref+0x8d0:   	xorcc	%o1, %i3, %l6
	.word	0xe8f6501d	! t0_kref+0x8d4:   	stxa	%l4, [%i1 + %i5]0x80
	.word	0x20800004	! t0_kref+0x8d8:   	bn,a	_kref+0x8e8
	.word	0xa1b48f4c	! t0_kref+0x8dc:   	fornot1	%f18, %f12, %f16
	.word	0xf16e6018	! t0_kref+0x8e0:   	prefetch	%i1 + 0x18, 24
	.word	0xdfa6201c	! t0_kref+0x8e4:   	sta	%f15, [%i0 + 0x1c]%asi
	.word	0xd2567ff0	! t0_kref+0x8e8:   	ldsh	[%i1 - 0x10], %o1
	.word	0xd2363fe0	! t0_kref+0x8ec:   	sth	%o1, [%i0 - 0x20]
	.word	0x8143c000	! t0_kref+0x8f0:   	stbar
	.word	0xa6b2c015	! t0_kref+0x8f4:   	orncc	%o3, %l5, %l3
	.word	0x922ac00a	! t0_kref+0x8f8:   	andn	%o3, %o2, %o1
	.word	0xb1a58856	! t0_kref+0x8fc:   	faddd	%f22, %f22, %f24
	.word	0xe320a018	! t0_kref+0x900:   	st	%f17, [%g2 + 0x18]
	.word	0xb1a0002d	! t0_kref+0x904:   	fmovs	%f13, %f24
	.word	0xec78a02c	! t0_kref+0x908:   	swap	[%g2 + 0x2c], %l6
	.word	0x9e12c016	! t0_kref+0x90c:   	or	%o3, %l6, %o7
	.word	0x32800008	! t0_kref+0x910:   	bne,a	_kref+0x930
	.word	0xda567ff8	! t0_kref+0x914:   	ldsh	[%i1 - 8], %o5
	.word	0xd850a028	! t0_kref+0x918:   	ldsh	[%g2 + 0x28], %o4
	.word	0x99a54d31	! t0_kref+0x91c:   	fsmuld	%f21, %f17, %f12
	.word	0xec563fec	! t0_kref+0x920:   	ldsh	[%i0 - 0x14], %l6
	.word	0xfa316a2c	! t0_kref+0x924:   	sth	%i5, [%g5 + 0xa2c]
	.word	0xadb38c56	! t0_kref+0x928:   	fnor	%f14, %f22, %f22
	.word	0xeb6e001d	! t0_kref+0x92c:   	prefetch	%i0 + %i5, 21
	.word	0xa5b54fae	! t0_kref+0x930:   	fors	%f21, %f14, %f18
	.word	0xf5ee101c	! t0_kref+0x934:   	prefetcha	%i0 + %i4, 26
	.word	0x9da00548	! t0_kref+0x938:   	fsqrtd	%f8, %f14
	.word	0xe91e2008	! t0_kref+0x93c:   	ldd	[%i0 + 8], %f20
	.word	0xe3267ff4	! t0_kref+0x940:   	st	%f17, [%i1 - 0xc]
	.word	0x97a01a4a	! t0_kref+0x944:   	fdtoi	%f10, %f11
	.word	0xc168a00c	! t0_kref+0x948:   	prefetch	%g2 + 0xc, 0
	.word	0xe080a030	! t0_kref+0x94c:   	lda	[%g2 + 0x30]%asi, %l0
	.word	0xb3a01a2c	! t0_kref+0x950:   	fstoi	%f12, %f25
	.word	0xac42800b	! t0_kref+0x954:   	addc	%o2, %o3, %l6
	.word	0xada0002d	! t0_kref+0x958:   	fmovs	%f13, %f22
	.word	0x96f5000a	! t0_kref+0x95c:   	udivcc	%l4, %o2, %o3
	.word	0xe611401b	! t0_kref+0x960:   	lduh	[%g5 + %i3], %l3
	.word	0x9de3bfa0	! t0_kref+0x964:   	save	%sp, -0x60, %sp
	.word	0xb106b425	! t0_kref+0x968:   	taddcc	%i2, -0xbdb, %i0
	.word	0xabee717e	! t0_kref+0x96c:   	restore	%i1, -0xe82, %l5
	.word	0xa8ada22f	! t0_kref+0x970:   	andncc	%l6, 0x22f, %l4
	.word	0x9e2334aa	! t0_kref+0x974:   	sub	%o4, -0xb56, %o7
	.word	0xa80ab9a1	! t0_kref+0x978:   	and	%o2, -0x65f, %l4
	.word	0xb1b20a50	! t0_kref+0x97c:   	fpadd32	%f8, %f16, %f24
	.word	0x27800008	! t0_kref+0x980:   	fbul,a	_kref+0x9a0
	.word	0xeeb0a002	! t0_kref+0x984:   	stha	%l7, [%g2 + 2]%asi
	.word	0x95a01a48	! t0_kref+0x988:   	fdtoi	%f8, %f10
	.word	0xa3a34831	! t0_kref+0x98c:   	fadds	%f13, %f17, %f17
	.word	0x9965c014	! t0_kref+0x990:   	movvs	%icc, %l4, %o4
	.word	0xe51e3fe0	! t0_kref+0x994:   	ldd	[%i0 - 0x20], %f18
	.word	0xe89e101d	! t0_kref+0x998:   	ldda	[%i0 + %i5]0x80, %l4
	.word	0xd2263ffc	! t0_kref+0x99c:   	st	%o1, [%i0 - 4]
	.word	0xe56e6000	! t0_kref+0x9a0:   	prefetch	%i1, 18
	.word	0xad224017	! t0_kref+0x9a4:   	mulscc	%o1, %l7, %l6
	.word	0xe6780018	! t0_kref+0x9a8:   	swap	[%g0 + %i0], %l3
	.word	0xd2300018	! t0_kref+0x9ac:   	sth	%o1, [%g0 + %i0]
	.word	0xb3a00130	! t0_kref+0x9b0:   	fabss	%f16, %f25
	.word	0x9db5ca69	! t0_kref+0x9b4:   	fpadd32s	%f23, %f9, %f14
	.word	0x95b00fc0	! t0_kref+0x9b8:   	fone	%f10
	.word	0xd4f67ff8	! t0_kref+0x9bc:   	stxa	%o2, [%i1 - 8]%asi
	.word	0x988b6e51	! t0_kref+0x9c0:   	andcc	%o5, 0xe51, %o4
	.word	0xea80a020	! t0_kref+0x9c4:   	lda	[%g2 + 0x20]%asi, %l5
	.word	0xe1e8a006	! t0_kref+0x9c8:   	prefetcha	%g2 + 6, 16
	.word	0xf4367ffe	! t0_kref+0x9cc:   	sth	%i2, [%i1 - 2]
	.word	0x2e480002	! t0_kref+0x9d0:   	bvs,a,pt	%icc, _kref+0x9d8
	.word	0xe9262008	! t0_kref+0x9d4:   	st	%f20, [%i0 + 8]
	.word	0xd84e4000	! t0_kref+0x9d8:   	ldsb	[%i1], %o4
	.word	0xada2c82a	! t0_kref+0x9dc:   	fadds	%f11, %f10, %f22
	.word	0xd020a00c	! t0_kref+0x9e0:   	st	%o0, [%g2 + 0xc]
	.word	0xaeb6f13a	! t0_kref+0x9e4:   	orncc	%i3, -0xec6, %l7
	.word	0x983dc000	! t0_kref+0x9e8:   	not	%l7, %o4
	.word	0xe1263ffc	! t0_kref+0x9ec:   	st	%f16, [%i0 - 4]
	.word	0x97203f41	! t0_kref+0x9f0:   	mulscc	%g0, -0xbf, %o3
	.word	0xd46e6006	! t0_kref+0x9f4:   	ldstub	[%i1 + 6], %o2
	.word	0xa1b50a0e	! t0_kref+0x9f8:   	fpadd16	%f20, %f14, %f16
	.word	0xada00548	! t0_kref+0x9fc:   	fsqrtd	%f8, %f22
	.word	0xd2262010	! t0_kref+0xa00:   	st	%o1, [%i0 + 0x10]
	.word	0xada0190f	! t0_kref+0xa04:   	fitod	%f15, %f22
	.word	0xa62dfaea	! t0_kref+0xa08:   	andn	%l7, -0x516, %l3
	.word	0x99b5035b	! t0_kref+0xa0c:   	alignaddrl	%l4, %i3, %o4
	.word	0x93a01a48	! t0_kref+0xa10:   	fdtoi	%f8, %f9
	.word	0x982a0009	! t0_kref+0xa14:   	andn	%o0, %o1, %o4
	.word	0xf4a8a035	! t0_kref+0xa18:   	stba	%i2, [%g2 + 0x35]%asi
	.word	0xa5b00cd4	! t0_kref+0xa1c:   	fnot2	%f20, %f18
	.word	0xaba3c838	! t0_kref+0xa20:   	fadds	%f15, %f24, %f21
	.word	0xadb50fb7	! t0_kref+0xa24:   	fors	%f20, %f23, %f22
	.word	0x81ad4a34	! t0_kref+0xa28:   	fcmps	%fcc0, %f21, %f20
	.word	0xa3a3c8b1	! t0_kref+0xa2c:   	fsubs	%f15, %f17, %f17
	.word	0xea2e8019	! t0_kref+0xa30:   	stb	%l5, [%i2 + %i1]
	.word	0xa1a44830	! t0_kref+0xa34:   	fadds	%f17, %f16, %f16
	.word	0x97b34fb1	! t0_kref+0xa38:   	fors	%f13, %f17, %f11
	.word	0xda162012	! t0_kref+0xa3c:   	lduh	[%i0 + 0x12], %o5
	.word	0xe16e3fe0	! t0_kref+0xa40:   	prefetch	%i0 - 0x20, 16
	.word	0xaab2401b	! t0_kref+0xa44:   	orncc	%o1, %i3, %l5
	.word	0x94b2c015	! t0_kref+0xa48:   	orncc	%o3, %l5, %o2
	.word	0x98d2c014	! t0_kref+0xa4c:   	umulcc	%o3, %l4, %o4
	.word	0xd7070005	! t0_kref+0xa50:   	ld	[%i4 + %g5], %f11
	.word	0xd0a8a03f	! t0_kref+0xa54:   	stba	%o0, [%g2 + 0x3f]%asi
	.word	0x9da20948	! t0_kref+0xa58:   	fmuld	%f8, %f8, %f14
	.word	0x99b30914	! t0_kref+0xa5c:   	faligndata	%f12, %f20, %f12
	.word	0x99a548b2	! t0_kref+0xa60:   	fsubs	%f21, %f18, %f12
	.word	0x91b28992	! t0_kref+0xa64:   	bshuffle	%f10, %f18, %f8
	.word	0x905ac00b	! t0_kref+0xa68:   	smul	%o3, %o3, %o0
	.word	0x34800002	! t0_kref+0xa6c:   	bg,a	_kref+0xa74
	.word	0x9da01933	! t0_kref+0xa70:   	fstod	%f19, %f14
	.word	0xaa8d000a	! t0_kref+0xa74:   	andcc	%l4, %o2, %l5
	.word	0xafa00030	! t0_kref+0xa78:   	fmovs	%f16, %f23
	.word	0x912ec008	! t0_kref+0xa7c:   	sll	%i3, %o0, %o0
	.word	0x95a50954	! t0_kref+0xa80:   	fmuld	%f20, %f20, %f10
	.word	0x9de3bfa0	! t0_kref+0xa84:   	save	%sp, -0x60, %sp
	.word	0x91ef762e	! t0_kref+0xa88:   	restore	%i5, -0x9d2, %o0
	.word	0xef80a010	! t0_kref+0xa8c:   	lda	[%g2 + 0x10]%asi, %f23
	.word	0xf1180018	! t0_kref+0xa90:   	ldd	[%g0 + %i0], %f24
	.word	0xa5b50496	! t0_kref+0xa94:   	fcmple32	%f20, %f22, %l2
	.word	0xc36e0014	! t0_kref+0xa98:   	prefetch	%i0 + %l4, 1
	.word	0x32800001	! t0_kref+0xa9c:   	bne,a	_kref+0xaa0
	.word	0xa6f24009	! t0_kref+0xaa0:   	udivcc	%o1, %o1, %l3
	.word	0x95a0054c	! t0_kref+0xaa4:   	fsqrtd	%f12, %f10
	.word	0x92a24009	! t0_kref+0xaa8:   	subcc	%o1, %o1, %o1
	.word	0x2b800008	! t0_kref+0xaac:   	fbug,a	_kref+0xacc
	.word	0x99b009b8	! t0_kref+0xab0:   	fexpand	%f24, %f12
	.word	0xa8b52f31	! t0_kref+0xab4:   	orncc	%l4, 0xf31, %l4
	.word	0x81aa4aac	! t0_kref+0xab8:   	fcmpes	%fcc0, %f9, %f12
	.word	0xaae3000c	! t0_kref+0xabc:   	subccc	%o4, %o4, %l5
	.word	0x99b38d14	! t0_kref+0xac0:   	fandnot1	%f14, %f20, %f12
	.word	0xd1200019	! t0_kref+0xac4:   	st	%f8, [%g0 + %i1]
	.word	0xd5070018	! t0_kref+0xac8:   	ld	[%i4 + %i0], %f10
	.word	0x95b000c0	! t0_kref+0xacc:   	edge16l	%g0, %g0, %o2
	.word	0xdd267fe8	! t0_kref+0xad0:   	st	%f14, [%i1 - 0x18]
	.word	0xadb3430b	! t0_kref+0xad4:   	alignaddr	%o5, %o3, %l6
	.word	0x86102009	! t0_kref+0xad8:   	mov	0x9, %g3
	.word	0x86a0e001	! t0_kref+0xadc:   	subcc	%g3, 1, %g3
	.word	0x22800018	! t0_kref+0xae0:   	be,a	_kref+0xb40
	.word	0x920ec00d	! t0_kref+0xae4:   	and	%i3, %o5, %o1
	.word	0x2dbffffd	! t0_kref+0xae8:   	fbg,a	_kref+0xadc
	.word	0xaa92afc9	! t0_kref+0xaec:   	orcc	%o2, 0xfc9, %l5
	.word	0xee4e600a	! t0_kref+0xaf0:   	ldsb	[%i1 + 0xa], %l7
	.word	0x90137ea5	! t0_kref+0xaf4:   	or	%o5, -0x15b, %o0
	.word	0x2fbffff9	! t0_kref+0xaf8:   	fbu,a	_kref+0xadc
	.word	0xb3a01a2d	! t0_kref+0xafc:   	fstoi	%f13, %f25
	.word	0x97418000	! t0_kref+0xb00:   	mov	%fprs, %o3
	.word	0xd44e8019	! t0_kref+0xb04:   	ldsb	[%i2 + %i1], %o2
	.word	0xda56c019	! t0_kref+0xb08:   	ldsh	[%i3 + %i1], %o5
	.word	0x9fb28f69	! t0_kref+0xb0c:   	fornot1s	%f10, %f9, %f15
	.word	0xafa508b7	! t0_kref+0xb10:   	fsubs	%f20, %f23, %f23
	.word	0x9ead66de	! t0_kref+0xb14:   	andncc	%l5, 0x6de, %o7
	.word	0xe46e8019	! t0_kref+0xb18:   	ldstub	[%i2 + %i1], %l2
	.word	0xd19e1a1c	! t0_kref+0xb1c:   	ldda	[%i0 + %i4]0xd0, %f8
	.word	0xae56e26d	! t0_kref+0xb20:   	umul	%i3, 0x26d, %l7
	.word	0xada3884e	! t0_kref+0xb24:   	faddd	%f14, %f14, %f22
	.word	0x250d7707	! t0_kref+0xb28:   	sethi	%hi(0x35dc1c00), %l2
	.word	0xa312401a	! t0_kref+0xb2c:   	taddcctv	%o1, %i2, %l1
	.word	0xe2680019	! t0_kref+0xb30:   	ldstub	[%g0 + %i1], %l1
	.word	0xd93e6000	! t0_kref+0xb34:   	std	%f12, [%i1]
	.word	0x9fb5407a	! t0_kref+0xb38:   	edge8ln	%l5, %i2, %o7
	.word	0xd246401c	! t0_kref+0xb3c:   	ldsw	[%i1 + %i4], %o1
	.word	0x8143c000	! t0_kref+0xb40:   	stbar
	.word	0xa1b2c148	! t0_kref+0xb44:   	edge32l	%o3, %o0, %l0
	.word	0xd24e200e	! t0_kref+0xb48:   	ldsb	[%i0 + 0xe], %o1
	.word	0x97408000	! t0_kref+0xb4c:   	mov	%ccr, %o3
	.word	0x3b800006	! t0_kref+0xb50:   	fble,a	_kref+0xb68
	.word	0xc12e001c	! t0_kref+0xb54:   	st	%fsr, [%i0 + %i4]
	.word	0x9da01929	! t0_kref+0xb58:   	fstod	%f9, %f14
	.word	0xe3200019	! t0_kref+0xb5c:   	st	%f17, [%g0 + %i1]
	.word	0xa40d0017	! t0_kref+0xb60:   	and	%l4, %l7, %l2
	.word	0xe53e401d	! t0_kref+0xb64:   	std	%f18, [%i1 + %i5]
	.word	0xafb5ca28	! t0_kref+0xb68:   	fpadd16s	%f23, %f8, %f23
	.word	0xabb38a71	! t0_kref+0xb6c:   	fpadd32s	%f14, %f17, %f21
	.word	0xab2a000b	! t0_kref+0xb70:   	sll	%o0, %o3, %l5
	.word	0x90f0000d	! t0_kref+0xb74:   	udivcc	%g0, %o5, %o0
	.word	0xed80a018	! t0_kref+0xb78:   	lda	[%g2 + 0x18]%asi, %f22
	.word	0xa6982929	! t0_kref+0xb7c:   	xorcc	%g0, 0x929, %l3
	.word	0xa9b30994	! t0_kref+0xb80:   	bshuffle	%f12, %f20, %f20
	.word	0xdb06001c	! t0_kref+0xb84:   	ld	[%i0 + %i4], %f13
	.word	0x92b0201f	! t0_kref+0xb88:   	orncc	%g0, 0x1f, %o1
	.word	0xada0002a	! t0_kref+0xb8c:   	fmovs	%f10, %f22
	.word	0xa63a7db6	! t0_kref+0xb90:   	xnor	%o1, -0x24a, %l3
	.word	0xa6bdc015	! t0_kref+0xb94:   	xnorcc	%l7, %l5, %l3
	.word	0xd5264000	! t0_kref+0xb98:   	st	%f10, [%i1]
	.word	0x972d0014	! t0_kref+0xb9c:   	sll	%l4, %l4, %o3
	.word	0xa4237fae	! t0_kref+0xba0:   	sub	%o5, -0x52, %l2
	.word	0xc76e7fe0	! t0_kref+0xba4:   	prefetch	%i1 - 0x20, 3
	.word	0x81ab8a48	! t0_kref+0xba8:   	fcmpd	%fcc0, %f14, %f8
	.word	0xd406201c	! t0_kref+0xbac:   	ld	[%i0 + 0x1c], %o2
	.word	0x86102001	! t0_kref+0xbb0:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0xbb4:   	bne,a	_kref+0xbb4
	.word	0x86a0e001	! t0_kref+0xbb8:   	subcc	%g3, 1, %g3
	.word	0xe4066000	! t0_kref+0xbbc:   	ld	[%i1], %l2
	.word	0x9645fdbe	! t0_kref+0xbc0:   	addc	%l7, -0x242, %o3
	.word	0xaeb6f9aa	! t0_kref+0xbc4:   	orncc	%i3, -0x656, %l7
	.word	0x95b34280	! t0_kref+0xbc8:   	array32	%o5, %g0, %o2
	.word	0xada2094c	! t0_kref+0xbcc:   	fmuld	%f8, %f12, %f22
	.word	0xe28e5000	! t0_kref+0xbd0:   	lduba	[%i1]0x80, %l1
	.word	0x9425b506	! t0_kref+0xbd4:   	sub	%l6, -0xafa, %o2
	.word	0xa8153325	! t0_kref+0xbd8:   	or	%l4, -0xcdb, %l4
	.word	0x95b54356	! t0_kref+0xbdc:   	alignaddrl	%l5, %l6, %o2
	.word	0x93b50cae	! t0_kref+0xbe0:   	fandnot2s	%f20, %f14, %f9
	.word	0xafa01894	! t0_kref+0xbe4:   	fitos	%f20, %f23
	.word	0xa29a2dbb	! t0_kref+0xbe8:   	xorcc	%o0, 0xdbb, %l1
	.word	0x29480008	! t0_kref+0xbec:   	fbl,a,pt	%fcc0, _kref+0xc0c
	.word	0xd1267ff0	! t0_kref+0xbf0:   	st	%f8, [%i1 - 0x10]
	.word	0x32480003	! t0_kref+0xbf4:   	bne,a,pt	%icc, _kref+0xc00
	.word	0xa1b28f54	! t0_kref+0xbf8:   	fornot1	%f10, %f20, %f16
	.word	0x2503be86	! t0_kref+0xbfc:   	sethi	%hi(0xefa1800), %l2
	.word	0xe81e2008	! t0_kref+0xc00:   	ldd	[%i0 + 8], %l4
	.word	0x28480003	! t0_kref+0xc04:   	bleu,a,pt	%icc, _kref+0xc10
	.word	0x81858000	! t0_kref+0xc08:   	wr	%l6, %g0, %y
	.word	0x271be627	! t0_kref+0xc0c:   	sethi	%hi(0x6f989c00), %l3
	.word	0x9e12000a	! t0_kref+0xc10:   	or	%o0, %o2, %o7
	.word	0xc12e401c	! t0_kref+0xc14:   	st	%fsr, [%i1 + %i4]
	.word	0x9a2b64ee	! t0_kref+0xc18:   	andn	%o5, 0x4ee, %o5
	.word	0xa6d2605b	! t0_kref+0xc1c:   	umulcc	%o1, 0x5b, %l3
	.word	0xae22b737	! t0_kref+0xc20:   	sub	%o2, -0x8c9, %l7
	.word	0x969ef251	! t0_kref+0xc24:   	xorcc	%i3, -0xdaf, %o3
	.word	0x86102003	! t0_kref+0xc28:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0xc2c:   	bne,a	_kref+0xc2c
	.word	0x86a0e001	! t0_kref+0xc30:   	subcc	%g3, 1, %g3
	.word	0xd980a014	! t0_kref+0xc34:   	lda	[%g2 + 0x14]%asi, %f12
	.word	0x112f36fc	! t0_kref+0xc38:   	sethi	%hi(0xbcdbf000), %o0
	.word	0xe690a01c	! t0_kref+0xc3c:   	lduha	[%g2 + 0x1c]%asi, %l3
	.word	0x20480007	! t0_kref+0xc40:   	bn,a,pt	%icc, _kref+0xc5c
	.word	0xae85c000	! t0_kref+0xc44:   	addcc	%l7, %g0, %l7
	.word	0x908a0008	! t0_kref+0xc48:   	andcc	%o0, %o0, %o0
	.word	0xf4262014	! t0_kref+0xc4c:   	st	%i2, [%i0 + 0x14]
	.word	0x99a01a2e	! t0_kref+0xc50:   	fstoi	%f14, %f12
	.word	0xda90a00a	! t0_kref+0xc54:   	lduha	[%g2 + 0xa]%asi, %o5
	.word	0xf1262000	! t0_kref+0xc58:   	st	%f24, [%i0]
	.word	0xa7a00032	! t0_kref+0xc5c:   	fmovs	%f18, %f19
	.word	0x9fc00004	! t0_kref+0xc60:   	call	%g0 + %g4
	.word	0xdd26200c	! t0_kref+0xc64:   	st	%f14, [%i0 + 0xc]
	.word	0x81adcaaa	! t0_kref+0xc68:   	fcmpes	%fcc0, %f23, %f10
	.word	0xd4480018	! t0_kref+0xc6c:   	ldsb	[%g0 + %i0], %o2
	.word	0xada0054c	! t0_kref+0xc70:   	fsqrtd	%f12, %f22
	.word	0xe11e001d	! t0_kref+0xc74:   	ldd	[%i0 + %i5], %f16
	.word	0x8143c000	! t0_kref+0xc78:   	stbar
	.word	0x81aa0acc	! t0_kref+0xc7c:   	fcmped	%fcc0, %f8, %f12
	.word	0x38800008	! t0_kref+0xc80:   	bgu,a	_kref+0xca0
	.word	0xa60b4009	! t0_kref+0xc84:   	and	%o5, %o1, %l3
	.word	0xa0da69e9	! t0_kref+0xc88:   	smulcc	%o1, 0x9e9, %l0
	.word	0xa8ab335e	! t0_kref+0xc8c:   	andncc	%o4, -0xca2, %l4
	.word	0x24480004	! t0_kref+0xc90:   	ble,a,pt	%icc, _kref+0xca0
	.word	0xa5a01a4c	! t0_kref+0xc94:   	fdtoi	%f12, %f18
	.word	0xa6b5b189	! t0_kref+0xc98:   	orncc	%l6, -0xe77, %l3
	.word	0xa80d0014	! t0_kref+0xc9c:   	and	%l4, %l4, %l4
	.word	0xd44e001a	! t0_kref+0xca0:   	ldsb	[%i0 + %i2], %o2
	.word	0x2139f118	! t0_kref+0xca4:   	sethi	%hi(0xe7c46000), %l0
	.word	0xb1a0002d	! t0_kref+0xca8:   	fmovs	%f13, %f24
	.word	0x86102011	! t0_kref+0xcac:   	mov	0x11, %g3
	.word	0x86a0e001	! t0_kref+0xcb0:   	subcc	%g3, 1, %g3
	.word	0x2280001f	! t0_kref+0xcb4:   	be,a	_kref+0xd30
	.word	0xe8f63fe8	! t0_kref+0xcb8:   	stxa	%l4, [%i0 - 0x18]%asi
	.word	0x8143c000	! t0_kref+0xcbc:   	stbar
	.word	0x9842bb4b	! t0_kref+0xcc0:   	addc	%o2, -0x4b5, %o4
	.word	0xe6080019	! t0_kref+0xcc4:   	ldub	[%g0 + %i1], %l3
	.word	0x9e0a7aab	! t0_kref+0xcc8:   	and	%o1, -0x555, %o7
	.word	0xa0254009	! t0_kref+0xccc:   	sub	%l5, %o1, %l0
	.word	0xc1ee5016	! t0_kref+0xcd0:   	prefetcha	%i1 + %l6, 0
	.word	0x99a0192f	! t0_kref+0xcd4:   	fstod	%f15, %f12
	.word	0xa9b58f75	! t0_kref+0xcd8:   	fornot1s	%f22, %f21, %f20
	.word	0xd51e6008	! t0_kref+0xcdc:   	ldd	[%i1 + 8], %f10
	.word	0xd4b6d018	! t0_kref+0xce0:   	stha	%o2, [%i3 + %i0]0x80
	.word	0x98c3401b	! t0_kref+0xce4:   	addccc	%o5, %i3, %o4
	.word	0xada01938	! t0_kref+0xce8:   	fstod	%f24, %f22
	.word	0xd526001c	! t0_kref+0xcec:   	st	%f10, [%i0 + %i4]
	.word	0x9fa00530	! t0_kref+0xcf0:   	fsqrts	%f16, %f15
	.word	0xd0c8a009	! t0_kref+0xcf4:   	ldsba	[%g2 + 9]%asi, %o0
	.word	0xe0160000	! t0_kref+0xcf8:   	lduh	[%i0], %l0
	.word	0x81854000	! t0_kref+0xcfc:   	wr	%l5, %g0, %y
	.word	0x99a0192a	! t0_kref+0xd00:   	fstod	%f10, %f12
	.word	0xa1b20988	! t0_kref+0xd04:   	bshuffle	%f8, %f8, %f16
	.word	0xa2f54008	! t0_kref+0xd08:   	udivcc	%l5, %o0, %l1
	.word	0x9ba00028	! t0_kref+0xd0c:   	fmovs	%f8, %f13
	.word	0x2107ce2b	! t0_kref+0xd10:   	sethi	%hi(0x1f38ac00), %l0
	.word	0x8143c000	! t0_kref+0xd14:   	stbar
	.word	0x3e800003	! t0_kref+0xd18:   	bvc,a	_kref+0xd24
	.word	0xaba38830	! t0_kref+0xd1c:   	fadds	%f14, %f16, %f21
	.word	0xa9aa804e	! t0_kref+0xd20:   	fmovdue	%fcc0, %f14, %f20
	.word	0x909a0015	! t0_kref+0xd24:   	xorcc	%o0, %l5, %o0
	.word	0xae3b0016	! t0_kref+0xd28:   	xnor	%o4, %l6, %l7
	.word	0x97b34240	! t0_kref+0xd2c:   	array16	%o5, %g0, %o3
	.word	0x98237e35	! t0_kref+0xd30:   	sub	%o5, -0x1cb, %o4
	.word	0x3e480008	! t0_kref+0xd34:   	bvc,a,pt	%icc, _kref+0xd54
	.word	0x91b00fe0	! t0_kref+0xd38:   	fones	%f8
	.word	0x91aa404e	! t0_kref+0xd3c:   	fmovde	%fcc0, %f14, %f8
	.word	0x9a3dc016	! t0_kref+0xd40:   	xnor	%l7, %l6, %o5
	.word	0xee462000	! t0_kref+0xd44:   	ldsw	[%i0], %l7
	.word	0x91a00056	! t0_kref+0xd48:   	fmovd	%f22, %f8
	.word	0xd93e2008	! t0_kref+0xd4c:   	std	%f12, [%i0 + 8]
	.word	0xd53f4019	! t0_kref+0xd50:   	std	%f10, [%i5 + %i1]
	.word	0x27800005	! t0_kref+0xd54:   	fbul,a	_kref+0xd68
	.word	0xa7a01a4a	! t0_kref+0xd58:   	fdtoi	%f10, %f19
	.word	0x91ab8054	! t0_kref+0xd5c:   	fmovdule	%fcc0, %f20, %f8
	.word	0xabb007b4	! t0_kref+0xd60:   	fpackfix	%f20, %f21
	.word	0xd0c0a010	! t0_kref+0xd64:   	ldswa	[%g2 + 0x10]%asi, %o0
	.word	0x9e0d68a3	! t0_kref+0xd68:   	and	%l5, 0x8a3, %o7
	.word	0x32480007	! t0_kref+0xd6c:   	bne,a,pt	%icc, _kref+0xd88
	.word	0x99a0192c	! t0_kref+0xd70:   	fstod	%f12, %f12
	.word	0x8d85741e	! t0_kref+0xd74:   	wr	%l5, 0xfffff41e, %fprs
	.word	0x34480006	! t0_kref+0xd78:   	bg,a,pt	%icc, _kref+0xd90
	.word	0x91a018d8	! t0_kref+0xd7c:   	fdtos	%f24, %f8
	.word	0xaeb26c38	! t0_kref+0xd80:   	orncc	%o1, 0xc38, %l7
	.word	0xaba28839	! t0_kref+0xd84:   	fadds	%f10, %f25, %f21
	.word	0x91a01898	! t0_kref+0xd88:   	fitos	%f24, %f8
	.word	0xd93e2000	! t0_kref+0xd8c:   	std	%f12, [%i0]
	.word	0x9215c01a	! t0_kref+0xd90:   	or	%l7, %i2, %o1
	.word	0xa5b44979	! t0_kref+0xd94:   	fpmerge	%f17, %f25, %f18
	.word	0xaef0000d	! t0_kref+0xd98:   	udivcc	%g0, %o5, %l7
	.word	0xee871019	! t0_kref+0xd9c:   	lda	[%i4 + %i1]0x80, %l7
	.word	0xa6f0291a	! t0_kref+0xda0:   	udivcc	%g0, 0x91a, %l3
	.word	0x2d800003	! t0_kref+0xda4:   	fbg,a	_kref+0xdb0
	.word	0x25257080	! t0_kref+0xda8:   	sethi	%hi(0x95c20000), %l2
	.word	0x30800003	! t0_kref+0xdac:   	ba,a	_kref+0xdb8
	.word	0xe0500018	! t0_kref+0xdb0:   	ldsh	[%g0 + %i0], %l0
	.word	0xd8000018	! t0_kref+0xdb4:   	ld	[%g0 + %i0], %o4
	.word	0x9ed22385	! t0_kref+0xdb8:   	umulcc	%o0, 0x385, %o7
	.word	0x93a4c829	! t0_kref+0xdbc:   	fadds	%f19, %f9, %f9
	.word	0x91b24a79	! t0_kref+0xdc0:   	fpadd32s	%f9, %f25, %f8
	.word	0x1b0b07b5	! t0_kref+0xdc4:   	sethi	%hi(0x2c1ed400), %o5
	.word	0x94d57ed0	! t0_kref+0xdc8:   	umulcc	%l5, -0x130, %o2
	.word	0xe1e8a085	! t0_kref+0xdcc:   	prefetcha	%g2 + 0x85, 16
	.word	0xee270019	! t0_kref+0xdd0:   	st	%l7, [%i4 + %i1]
	.word	0xa7a00029	! t0_kref+0xdd4:   	fmovs	%f9, %f19
	.word	0xb1b2898e	! t0_kref+0xdd8:   	bshuffle	%f10, %f14, %f24
	.word	0xada50848	! t0_kref+0xddc:   	faddd	%f20, %f8, %f22
	.word	0xc9ee500b	! t0_kref+0xde0:   	prefetcha	%i1 + %o3, 4
	.word	0x95b4098a	! t0_kref+0xde4:   	bshuffle	%f16, %f10, %f10
	.word	0xadb38f50	! t0_kref+0xde8:   	fornot1	%f14, %f16, %f22
	.word	0x9ba018ca	! t0_kref+0xdec:   	fdtos	%f10, %f13
	.word	0x95a40858	! t0_kref+0xdf0:   	faddd	%f16, %f24, %f10
	.word	0xc568a087	! t0_kref+0xdf4:   	prefetch	%g2 + 0x87, 2
	.word	0xa2d3395a	! t0_kref+0xdf8:   	umulcc	%o4, -0x6a6, %l1
	.word	0x25800008	! t0_kref+0xdfc:   	fblg,a	_kref+0xe1c
	.word	0x95b28ab7	! t0_kref+0xe00:   	fpsub16s	%f10, %f23, %f10
	.word	0x9f2e800c	! t0_kref+0xe04:   	sll	%i2, %o4, %o7
	.word	0x81adcab5	! t0_kref+0xe08:   	fcmpes	%fcc0, %f23, %f21
	.word	0x93a549a9	! t0_kref+0xe0c:   	fdivs	%f21, %f9, %f9
	.word	0xa5b58a0a	! t0_kref+0xe10:   	fpadd16	%f22, %f10, %f18
	.word	0xa2f30017	! t0_kref+0xe14:   	udivcc	%o4, %l7, %l1
	.word	0x9f122717	! t0_kref+0xe18:   	taddcctv	%o0, 0x717, %o7
	.word	0x980de24d	! t0_kref+0xe1c:   	and	%l7, 0x24d, %o4
	.word	0xec48a020	! t0_kref+0xe20:   	ldsb	[%g2 + 0x20], %l6
	.word	0x26800007	! t0_kref+0xe24:   	bl,a	_kref+0xe40
	.word	0xa43d37bf	! t0_kref+0xe28:   	xnor	%l4, -0x841, %l2
	.word	0xadb40eef	! t0_kref+0xe2c:   	fornot2s	%f16, %f15, %f22
	.word	0x95a0054a	! t0_kref+0xe30:   	fsqrtd	%f10, %f10
	.word	0xe1be5000	! t0_kref+0xe34:   	stda	%f16, [%i1]0x80
	.word	0xecc6600c	! t0_kref+0xe38:   	ldswa	[%i1 + 0xc]%asi, %l6
	.word	0x9605209e	! t0_kref+0xe3c:   	add	%l4, 0x9e, %o3
	.word	0xef68a041	! t0_kref+0xe40:   	prefetch	%g2 + 0x41, 23
	.word	0xaaf5ec5e	! t0_kref+0xe44:   	udivcc	%l7, 0xc5e, %l5
	.word	0x9aab70bb	! t0_kref+0xe48:   	andncc	%o5, -0xf45, %o5
	.word	0x9ba4882c	! t0_kref+0xe4c:   	fadds	%f18, %f12, %f13
	.word	0x81ac8a37	! t0_kref+0xe50:   	fcmps	%fcc0, %f18, %f23
	.word	0xadb50e4e	! t0_kref+0xe54:   	fxnor	%f20, %f14, %f22
!	call	0xfffffc60
	.word	0xd9267ff0	! t0_kref+0xe5c:   	st	%f12, [%i1 - 0x10]
	.word	0x9db007aa	! t0_kref+0xe60:   	fpackfix	%f10, %f14
	.word	0xa1b00cee	! t0_kref+0xe64:   	fnot2s	%f14, %f16
	.word	0xd290a016	! t0_kref+0xe68:   	lduha	[%g2 + 0x16]%asi, %o1
	.word	0x86102004	! t0_kref+0xe6c:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0xe70:   	bne,a	_kref+0xe70
	.word	0x86a0e001	! t0_kref+0xe74:   	subcc	%g3, 1, %g3
	.word	0xa9b38c88	! t0_kref+0xe78:   	fandnot2	%f14, %f8, %f20
	.word	0xed68a080	! t0_kref+0xe7c:   	prefetch	%g2 + 0x80, 22
	.word	0xd616001b	! t0_kref+0xe80:   	lduh	[%i0 + %i3], %o3
	.word	0x95b28000	! t0_kref+0xe84:   	edge8	%o2, %g0, %o2
	.word	0xca00001c	! t0_kref+0xe88:   	ld	[%g0 + %i4], %g5
	.word	0xa5b50a14	! t0_kref+0xe8c:   	fpadd16	%f20, %f20, %f18
	.word	0x9de3bfa0	! t0_kref+0xe90:   	save	%sp, -0x60, %sp
	.word	0xa9eec018	! t0_kref+0xe94:   	restore	%i3, %i0, %l4
	.word	0x86102001	! t0_kref+0xe98:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0xe9c:   	bne,a	_kref+0xe9c
	.word	0x86a0e001	! t0_kref+0xea0:   	subcc	%g3, 1, %g3
	.word	0xa2f50008	! t0_kref+0xea4:   	udivcc	%l4, %o0, %l1
	call	SYM(t0_subr1)
	.word	0xe1270019	! t0_kref+0xeac:   	st	%f16, [%i4 + %i1]
	.word	0x95a209b6	! t0_kref+0xeb0:   	fdivs	%f8, %f22, %f10
	.word	0x93b28ab4	! t0_kref+0xeb4:   	fpsub16s	%f10, %f20, %f9
	.word	0xda2e4000	! t0_kref+0xeb8:   	stb	%o5, [%i1]
	.word	0xd84e0000	! t0_kref+0xebc:   	ldsb	[%i0], %o4
	.word	0xee262004	! t0_kref+0xec0:   	st	%l7, [%i0 + 4]
	.word	0x9de3bfa0	! t0_kref+0xec4:   	save	%sp, -0x60, %sp
	.word	0xade82466	! t0_kref+0xec8:   	restore	%g0, 0x466, %l6
	.word	0x99a589d0	! t0_kref+0xecc:   	fdivd	%f22, %f16, %f12
	.word	0x81ab8ac8	! t0_kref+0xed0:   	fcmped	%fcc0, %f14, %f8
	.word	0xb3a308b7	! t0_kref+0xed4:   	fsubs	%f12, %f23, %f25
	.word	0x95a01a31	! t0_kref+0xed8:   	fstoi	%f17, %f10
	.word	0xda4e8018	! t0_kref+0xedc:   	ldsb	[%i2 + %i0], %o5
	.word	0x99b50a4c	! t0_kref+0xee0:   	fpadd32	%f20, %f12, %f12
	.word	0x9e8ec00a	! t0_kref+0xee4:   	andcc	%i3, %o2, %o7
	.word	0x8610200d	! t0_kref+0xee8:   	mov	0xd, %g3
	.word	0x86a0e001	! t0_kref+0xeec:   	subcc	%g3, 1, %g3
	.word	0x2280001e	! t0_kref+0xef0:   	be,a	_kref+0xf68
	.word	0x909a4016	! t0_kref+0xef4:   	xorcc	%o1, %l6, %o0
	.word	0xadb48df6	! t0_kref+0xef8:   	fnands	%f18, %f22, %f22
	.word	0x91a01a50	! t0_kref+0xefc:   	fdtoi	%f16, %f8
	.word	0x93b20596	! t0_kref+0xf00:   	fcmpgt32	%f8, %f22, %o1
	.word	0xd22e200e	! t0_kref+0xf04:   	stb	%o1, [%i0 + 0xe]
	.word	0x9fa30834	! t0_kref+0xf08:   	fadds	%f12, %f20, %f15
	.word	0xd8be7fe0	! t0_kref+0xf0c:   	stda	%o4, [%i1 - 0x20]%asi
	.word	0xe44e3ff8	! t0_kref+0xf10:   	ldsb	[%i0 - 8], %l2
	.word	0xebe6100b	! t0_kref+0xf14:   	casa	[%i0]0x80, %o3, %l5
	.word	0xd856401b	! t0_kref+0xf18:   	ldsh	[%i1 + %i3], %o4
	.word	0xb1b50c4e	! t0_kref+0xf1c:   	fnor	%f20, %f14, %f24
	.word	0xa1a389b7	! t0_kref+0xf20:   	fdivs	%f14, %f23, %f16
	.word	0xb1a60950	! t0_kref+0xf24:   	fmuld	%f24, %f16, %f24
	.word	0xd19e6010	! t0_kref+0xf28:   	ldda	[%i1 + 0x10]%asi, %f8
	.word	0x91a01939	! t0_kref+0xf2c:   	fstod	%f25, %f8
	.word	0xa1b00f14	! t0_kref+0xf30:   	fsrc2	%f20, %f16
	.word	0x968a4017	! t0_kref+0xf34:   	andcc	%o1, %l7, %o3
	.word	0xf320a014	! t0_kref+0xf38:   	st	%f25, [%g2 + 0x14]
	.word	0xa5a01929	! t0_kref+0xf3c:   	fstod	%f9, %f18
	.word	0xe9070019	! t0_kref+0xf40:   	ld	[%i4 + %i1], %f20
	.word	0xd280a004	! t0_kref+0xf44:   	lda	[%g2 + 4]%asi, %o1
	.word	0xde4e8019	! t0_kref+0xf48:   	ldsb	[%i2 + %i1], %o7
	.word	0xa786801a	! t0_kref+0xf4c:   	wr	%i2, %i2, %gsr
	.word	0x21800007	! t0_kref+0xf50:   	fbn,a	_kref+0xf6c
	.word	0x95a40848	! t0_kref+0xf54:   	faddd	%f16, %f8, %f10
	.word	0xee7f0019	! t0_kref+0xf58:   	swap	[%i4 + %i1], %l7
	.word	0xea080019	! t0_kref+0xf5c:   	ldub	[%g0 + %i1], %l5
	.word	0xae054014	! t0_kref+0xf60:   	add	%l5, %l4, %l7
	.word	0x8143c000	! t0_kref+0xf64:   	stbar
	.word	0x99a3082a	! t0_kref+0xf68:   	fadds	%f12, %f10, %f12
	.word	0xd6366006	! t0_kref+0xf6c:   	sth	%o3, [%i1 + 6]
	.word	0x95b5ca6b	! t0_kref+0xf70:   	fpadd32s	%f23, %f11, %f10
	.word	0xac2227ae	! t0_kref+0xf74:   	sub	%o0, 0x7ae, %l6
	call	1f
	.empty
	.word	0xaba54932	! t0_kref+0xf7c:   	fmuls	%f21, %f18, %f21
	.word	0x001fffff	! t0_kref+0xf80:   	illtrap	0x1fffff
	.word	0xe03962e8	! t0_kref+0xf84:   	std	%l0, [%g5 + 0x2e8]
1:	.word	0xec1e001d	! t0_kref+0xf88:   	ldd	[%i0 + %i5], %l6
	.word	0x943da11f	! t0_kref+0xf8c:   	xnor	%l6, 0x11f, %o2
	.word	0x9db44df5	! t0_kref+0xf90:   	fnands	%f17, %f21, %f14
	.word	0x81580000	! t0_kref+0xf94:   	flushw
	.word	0xde56001b	! t0_kref+0xf98:   	ldsh	[%i0 + %i3], %o7
	.word	0xed6e6008	! t0_kref+0xf9c:   	prefetch	%i1 + 8, 22
	.word	0x99a38956	! t0_kref+0xfa0:   	fmuld	%f14, %f22, %f12
	.word	0x9da01a58	! t0_kref+0xfa4:   	fdtoi	%f24, %f14
	.word	0xe0ce501a	! t0_kref+0xfa8:   	ldsba	[%i1 + %i2]0x80, %l0
	.word	0x99a01a54	! t0_kref+0xfac:   	fdtoi	%f20, %f12
	.word	0xf6200019	! t0_kref+0xfb0:   	st	%i3, [%g0 + %i1]
	.word	0xada0188a	! t0_kref+0xfb4:   	fitos	%f10, %f22
	.word	0xf1ee501a	! t0_kref+0xfb8:   	prefetcha	%i1 + %i2, 24
	.word	0x9076800a	! t0_kref+0xfbc:   	udiv	%i2, %o2, %o0
	.word	0x24800001	! t0_kref+0xfc0:   	ble,a	_kref+0xfc4
	.word	0xa7a308b1	! t0_kref+0xfc4:   	fsubs	%f12, %f17, %f19
	.word	0xedf65016	! t0_kref+0xfc8:   	casxa	[%i1]0x80, %l6, %l6
	.word	0xada01894	! t0_kref+0xfcc:   	fitos	%f20, %f22
	.word	0xadb606e8	! t0_kref+0xfd0:   	fmul8ulx16	%f24, %f8, %f22
	.word	0x9fa018ce	! t0_kref+0xfd4:   	fdtos	%f14, %f15
	.word	0xe1be1896	! t0_kref+0xfd8:   	stda	%f16, [%i0 + %l6]0xc4
	.word	0xa5b30280	! t0_kref+0xfdc:   	array32	%o4, %g0, %l2
	.word	0xada449b4	! t0_kref+0xfe0:   	fdivs	%f17, %f20, %f22
	.word	0xd2b6d018	! t0_kref+0xfe4:   	stha	%o1, [%i3 + %i0]0x80
	.word	0xe27e001c	! t0_kref+0xfe8:   	swap	[%i0 + %i4], %l1
	.word	0xed3e6000	! t0_kref+0xfec:   	std	%f22, [%i1]
	.word	0x94b263b3	! t0_kref+0xff0:   	orncc	%o1, 0x3b3, %o2
	.word	0x81ad0ad6	! t0_kref+0xff4:   	fcmped	%fcc0, %f20, %f22
	.word	0x99a548ab	! t0_kref+0xff8:   	fsubs	%f21, %f11, %f12
	.word	0x8610201b	! t0_kref+0xffc:   	mov	0x1b, %g3
	.word	0x86a0e001	! t0_kref+0x1000:   	subcc	%g3, 1, %g3
	.word	0x22800001	! t0_kref+0x1004:   	be,a	_kref+0x1008
	.word	0xe6070019	! t0_kref+0x1008:   	ld	[%i4 + %i1], %l3
	.word	0x9da0012e	! t0_kref+0x100c:   	fabss	%f14, %f14
	.word	0xe99f1a19	! t0_kref+0x1010:   	ldda	[%i4 + %i1]0xd0, %f20
	.word	0x932a800d	! t0_kref+0x1014:   	sll	%o2, %o5, %o1
	.word	0x3e800008	! t0_kref+0x1018:   	bvc,a	_kref+0x1038
	.word	0xf6260000	! t0_kref+0x101c:   	st	%i3, [%i0]
	.word	0x91b48db4	! t0_kref+0x1020:   	fxors	%f18, %f20, %f8
	.word	0xe11e0000	! t0_kref+0x1024:   	ldd	[%i0], %f16
	.word	0x8d828009	! t0_kref+0x1028:   	wr	%o2, %o1, %fprs
	.word	0xe8c8a014	! t0_kref+0x102c:   	ldsba	[%g2 + 0x14]%asi, %l4
	.word	0xe6fe101c	! t0_kref+0x1030:   	swapa	[%i0 + %i4]0x80, %l3
	.word	0xa6ab28c0	! t0_kref+0x1034:   	andncc	%o4, 0x8c0, %l3
	.word	0xf326001c	! t0_kref+0x1038:   	st	%f25, [%i0 + %i4]
	.word	0x9140c000	! t0_kref+0x103c:   	mov	%asi, %o0
	.word	0xec080018	! t0_kref+0x1040:   	ldub	[%g0 + %i0], %l6
	.word	0xd2566004	! t0_kref+0x1044:   	ldsh	[%i1 + 4], %o1
	.word	0x91b206f4	! t0_kref+0x1048:   	fmul8ulx16	%f8, %f20, %f8
	.word	0xa282eab8	! t0_kref+0x104c:   	addcc	%o3, 0xab8, %l1
	.word	0xaeda4014	! t0_kref+0x1050:   	smulcc	%o1, %l4, %l7
	.word	0xeede1000	! t0_kref+0x1054:   	ldxa	[%i0]0x80, %l7
	.word	0xc568a005	! t0_kref+0x1058:   	prefetch	%g2 + 5, 2
	.word	0xe8562016	! t0_kref+0x105c:   	ldsh	[%i0 + 0x16], %l4
	.word	0x2d800005	! t0_kref+0x1060:   	fbg,a	_kref+0x1074
	.word	0xa7a00032	! t0_kref+0x1064:   	fmovs	%f18, %f19
	.word	0xefee501d	! t0_kref+0x1068:   	prefetcha	%i1 + %i5, 23
	.word	0xf620a038	! t0_kref+0x106c:   	st	%i3, [%g2 + 0x38]
	.word	0xdb264000	! t0_kref+0x1070:   	st	%f13, [%i1]
	.word	0xe4d0a030	! t0_kref+0x1074:   	ldsha	[%g2 + 0x30]%asi, %l2
	.word	0xc768a043	! t0_kref+0x1078:   	prefetch	%g2 + 0x43, 3
	.word	0xd8264000	! t0_kref+0x107c:   	st	%o4, [%i1]
	.word	0x81aa4ab4	! t0_kref+0x1080:   	fcmpes	%fcc0, %f9, %f20
	.word	0xe9ee501d	! t0_kref+0x1084:   	prefetcha	%i1 + %i5, 20
	.word	0xda50a01c	! t0_kref+0x1088:   	ldsh	[%g2 + 0x1c], %o5
	.word	0xee871018	! t0_kref+0x108c:   	lda	[%i4 + %i0]0x80, %l7
	.word	0xec9e3ff0	! t0_kref+0x1090:   	ldda	[%i0 - 0x10]%asi, %l6
	.word	0x9fa00039	! t0_kref+0x1094:   	fmovs	%f25, %f15
	.word	0x15178e03	! t0_kref+0x1098:   	sethi	%hi(0x5e380c00), %o2
	.word	0xa9a4894c	! t0_kref+0x109c:   	fmuld	%f18, %f12, %f20
	.word	0x97a01a54	! t0_kref+0x10a0:   	fdtoi	%f20, %f11
	.word	0xa0f5400d	! t0_kref+0x10a4:   	udivcc	%l5, %o5, %l0
	.word	0xa9b40a56	! t0_kref+0x10a8:   	fpadd32	%f16, %f22, %f20
	.word	0xeca8a038	! t0_kref+0x10ac:   	stba	%l6, [%g2 + 0x38]%asi
	.word	0xa2aa4017	! t0_kref+0x10b0:   	andncc	%o1, %l7, %l1
	.word	0x9da6094c	! t0_kref+0x10b4:   	fmuld	%f24, %f12, %f14
	.word	0xa48a0008	! t0_kref+0x10b8:   	andcc	%o0, %o0, %l2
	.word	0xa2b6c00a	! t0_kref+0x10bc:   	orncc	%i3, %o2, %l1
	.word	0xa0234014	! t0_kref+0x10c0:   	sub	%o5, %l4, %l0
	.word	0xa7b00ce9	! t0_kref+0x10c4:   	fnot2s	%f9, %f19
	.word	0xf36e3fe0	! t0_kref+0x10c8:   	prefetch	%i0 - 0x20, 25
	.word	0xe9be5895	! t0_kref+0x10cc:   	stda	%f20, [%i1 + %l5]0xc4
	.word	0xada01a4a	! t0_kref+0x10d0:   	fdtoi	%f10, %f22
	.word	0xd0363fe2	! t0_kref+0x10d4:   	sth	%o0, [%i0 - 0x1e]
	.word	0x81ad0ace	! t0_kref+0x10d8:   	fcmped	%fcc0, %f20, %f14
	.word	0x99b48592	! t0_kref+0x10dc:   	fcmpgt32	%f18, %f18, %o4
	.word	0xd9267ffc	! t0_kref+0x10e0:   	st	%f12, [%i1 - 4]
	.word	0x93a01a37	! t0_kref+0x10e4:   	fstoi	%f23, %f9
	.word	0x81ac8ac8	! t0_kref+0x10e8:   	fcmped	%fcc0, %f18, %f8
	.word	0xe8267ffc	! t0_kref+0x10ec:   	st	%l4, [%i1 - 4]
	.word	0x3d800003	! t0_kref+0x10f0:   	fbule,a	_kref+0x10fc
	.word	0xdb066000	! t0_kref+0x10f4:   	ld	[%i1], %f13
	.word	0xb1a0190f	! t0_kref+0x10f8:   	fitod	%f15, %f24
	.word	0xe850a020	! t0_kref+0x10fc:   	ldsh	[%g2 + 0x20], %l4
	.word	0xa72d401a	! t0_kref+0x1100:   	sll	%l5, %i2, %l3
	.word	0x2d2563b3	! t0_kref+0x1104:   	sethi	%hi(0x958ecc00), %l6
	.word	0xdb00a008	! t0_kref+0x1108:   	ld	[%g2 + 8], %f13
	.word	0x90728008	! t0_kref+0x110c:   	udiv	%o2, %o0, %o0
	.word	0xada01a50	! t0_kref+0x1110:   	fdtoi	%f16, %f22
	.word	0xdd3e7ff8	! t0_kref+0x1114:   	std	%f14, [%i1 - 8]
	.word	0x3c800006	! t0_kref+0x1118:   	bpos,a	_kref+0x1130
	.word	0x97b3034d	! t0_kref+0x111c:   	alignaddrl	%o4, %o5, %o3
	.word	0xa82ae4c3	! t0_kref+0x1120:   	andn	%o3, 0x4c3, %l4
	.word	0x3e480003	! t0_kref+0x1124:   	bvc,a,pt	%icc, _kref+0x1130
	.word	0xd6563fea	! t0_kref+0x1128:   	ldsh	[%i0 - 0x16], %o3
	.word	0x9da01a4e	! t0_kref+0x112c:   	fdtoi	%f14, %f14
	.word	0x9816ae7c	! t0_kref+0x1130:   	or	%i2, 0xe7c, %o4
	.word	0x9da30956	! t0_kref+0x1134:   	fmuld	%f12, %f22, %f14
	.word	0xc3e8a04c	! t0_kref+0x1138:   	prefetcha	%g2 + 0x4c, 1
	.word	0xa7a48928	! t0_kref+0x113c:   	fmuls	%f18, %f8, %f19
	.word	0xd5bf5018	! t0_kref+0x1140:   	stda	%f10, [%i5 + %i0]0x80
	.word	0xec516996	! t0_kref+0x1144:   	ldsh	[%g5 + 0x996], %l6
	.word	0xe76e401d	! t0_kref+0x1148:   	prefetch	%i1 + %i5, 19
	.word	0xa6f3400a	! t0_kref+0x114c:   	udivcc	%o5, %o2, %l3
	.word	0x9a2d400b	! t0_kref+0x1150:   	andn	%l5, %o3, %o5
	.word	0x91408000	! t0_kref+0x1154:   	mov	%ccr, %o0
	.word	0x3c800001	! t0_kref+0x1158:   	bpos,a	_kref+0x115c
	.word	0x95a01a58	! t0_kref+0x115c:   	fdtoi	%f24, %f10
	.word	0x9da0188c	! t0_kref+0x1160:   	fitos	%f12, %f14
	.word	0x81580000	! t0_kref+0x1164:   	flushw
	.word	0xdd064000	! t0_kref+0x1168:   	ld	[%i1], %f14
	.word	0xee6e7ffc	! t0_kref+0x116c:   	ldstub	[%i1 - 4], %l7
	.word	0xd4567fe6	! t0_kref+0x1170:   	ldsh	[%i1 - 0x1a], %o2
	.word	0xac2d66f3	! t0_kref+0x1174:   	andn	%l5, 0x6f3, %l6
	.word	0xaa0d401b	! t0_kref+0x1178:   	and	%l5, %i3, %l5
	.word	0x81aa4ab4	! t0_kref+0x117c:   	fcmpes	%fcc0, %f9, %f20
	.word	0xe13f4018	! t0_kref+0x1180:   	std	%f16, [%i5 + %i0]
	.word	0xe9ee101a	! t0_kref+0x1184:   	prefetcha	%i0 + %i2, 20
	.word	0xe99e7ff0	! t0_kref+0x1188:   	ldda	[%i1 - 0x10]%asi, %f20
	.word	0xb3b48af3	! t0_kref+0x118c:   	fpsub32s	%f18, %f19, %f25
	.word	0xeac8a017	! t0_kref+0x1190:   	ldsba	[%g2 + 0x17]%asi, %l5
	.word	0xa3700015	! t0_kref+0x1194:   	popc	%l5, %l1
	.word	0xada01052	! t0_kref+0x1198:   	fdtox	%f18, %f22
	.word	0xe8d0a008	! t0_kref+0x119c:   	ldsha	[%g2 + 8]%asi, %l4
	.word	0x81868000	! t0_kref+0x11a0:   	wr	%i2, %g0, %y
	.word	0xa782a376	! t0_kref+0x11a4:   	wr	%o2, 0x376, %gsr
	.word	0x17189eea	! t0_kref+0x11a8:   	sethi	%hi(0x627ba800), %o3
	.word	0xa9a00558	! t0_kref+0x11ac:   	fsqrtd	%f24, %f20
	.word	0x91b60ac8	! t0_kref+0x11b0:   	fpsub32	%f24, %f8, %f8
	.word	0xa2b50000	! t0_kref+0x11b4:   	orncc	%l4, %g0, %l1
	.word	0xaaf24014	! t0_kref+0x11b8:   	udivcc	%o1, %l4, %l5
	.word	0x8d82af73	! t0_kref+0x11bc:   	wr	%o2, 0xf73, %fprs
	.word	0x9da548b3	! t0_kref+0x11c0:   	fsubs	%f21, %f19, %f14
	.word	0xabb58ef7	! t0_kref+0x11c4:   	fornot2s	%f22, %f23, %f21
	.word	0xf3867fe8	! t0_kref+0x11c8:   	lda	[%i1 - 0x18]%asi, %f25
	.word	0xa02d801b	! t0_kref+0x11cc:   	andn	%l6, %i3, %l0
	.word	0x28480001	! t0_kref+0x11d0:   	bleu,a,pt	%icc, _kref+0x11d4
	.word	0xa5b38c94	! t0_kref+0x11d4:   	fandnot2	%f14, %f20, %f18
	.word	0xec26001c	! t0_kref+0x11d8:   	st	%l6, [%i0 + %i4]
	.word	0x9f414000	! t0_kref+0x11dc:   	mov	%pc, %o7
!	.word	0x38806387	! t0_kref+0x11e0:   	bgu,a	SYM(t0_subr2)
	   	bgu,a	SYM(t0_subr2)
	.word	0xe93e001d	! t0_kref+0x11e4:   	std	%f20, [%i0 + %i5]
	.word	0xb3a00536	! t0_kref+0x11e8:   	fsqrts	%f22, %f25
	.word	0xaec50009	! t0_kref+0x11ec:   	addccc	%l4, %o1, %l7
	.word	0xa5a000b0	! t0_kref+0x11f0:   	fnegs	%f16, %f18
	.word	0xd48e1000	! t0_kref+0x11f4:   	lduba	[%i0]0x80, %o2
	.word	0x91a00558	! t0_kref+0x11f8:   	fsqrtd	%f24, %f8
	.word	0xd4480019	! t0_kref+0x11fc:   	ldsb	[%g0 + %i1], %o2
	.word	0x81aa8ab7	! t0_kref+0x1200:   	fcmpes	%fcc0, %f10, %f23
	.word	0xa6637485	! t0_kref+0x1204:   	subc	%o5, -0xb7b, %l3
	.word	0xe8c66004	! t0_kref+0x1208:   	ldswa	[%i1 + 4]%asi, %l4
	.word	0x9025401b	! t0_kref+0x120c:   	sub	%l5, %i3, %o0
	.word	0xfbee101c	! t0_kref+0x1210:   	prefetcha	%i0 + %i4, 29
	.word	0x81abcab8	! t0_kref+0x1214:   	fcmpes	%fcc0, %f15, %f24
	.word	0xa1a0192e	! t0_kref+0x1218:   	fstod	%f14, %f16
	.word	0xdece3ff2	! t0_kref+0x121c:   	ldsba	[%i0 - 0xe]%asi, %o7
	.word	0xd8ee7fe0	! t0_kref+0x1220:   	ldstuba	[%i1 - 0x20]%asi, %o4
	.word	0x9a75bf3e	! t0_kref+0x1224:   	udiv	%l6, -0xc2, %o5
	.word	0x9fb44f68	! t0_kref+0x1228:   	fornot1s	%f17, %f8, %f15
	.word	0xa29b000a	! t0_kref+0x122c:   	xorcc	%o4, %o2, %l1
	.word	0x91b48e52	! t0_kref+0x1230:   	fxnor	%f18, %f18, %f8
	.word	0xa322800d	! t0_kref+0x1234:   	mulscc	%o2, %o5, %l1
	.word	0x33800005	! t0_kref+0x1238:   	fbe,a	_kref+0x124c
	.word	0x8143c000	! t0_kref+0x123c:   	stbar
	.word	0xed264000	! t0_kref+0x1240:   	st	%f22, [%i1]
	.word	0xa62d401b	! t0_kref+0x1244:   	andn	%l5, %i3, %l3
	.word	0xee270019	! t0_kref+0x1248:   	st	%l7, [%i4 + %i1]
	.word	0x2e480003	! t0_kref+0x124c:   	bvs,a,pt	%icc, _kref+0x1258
	.word	0xafb6c075	! t0_kref+0x1250:   	edge8ln	%i3, %l5, %l7
	.word	0x3c800003	! t0_kref+0x1254:   	bpos,a	_kref+0x1260
	.word	0xf11e7ff0	! t0_kref+0x1258:   	ldd	[%i1 - 0x10], %f24
	.word	0xd0466018	! t0_kref+0x125c:   	ldsw	[%i1 + 0x18], %o0
	.word	0xa2dd237b	! t0_kref+0x1260:   	smulcc	%l4, 0x37b, %l1
	.word	0x93b34df7	! t0_kref+0x1264:   	fnands	%f13, %f23, %f9
	.word	0x8143e020	! t0_kref+0x1268:   	membar	0x20
	.word	0x1f1b7c96	! t0_kref+0x126c:   	sethi	%hi(0x6df25800), %o7
	.word	0x9443398f	! t0_kref+0x1270:   	addc	%o4, -0x671, %o2
	.word	0xea8e6016	! t0_kref+0x1274:   	lduba	[%i1 + 0x16]%asi, %l5
	.word	0xa9a3c8b1	! t0_kref+0x1278:   	fsubs	%f15, %f17, %f20
	.word	0xa1b584ce	! t0_kref+0x127c:   	fcmpne32	%f22, %f14, %l0
	.word	0xff6e401b	! t0_kref+0x1280:   	prefetch	%i1 + %i3, 31
	.word	0xd780a02c	! t0_kref+0x1284:   	lda	[%g2 + 0x2c]%asi, %f11
	.word	0xc807bfe8	! t0_kref+0x1288:   	ld	[%fp - 0x18], %g4
	.word	0x23153bc7	! t0_kref+0x128c:   	sethi	%hi(0x54ef1c00), %l1
	.word	0xa1b28174	! t0_kref+0x1290:   	edge32ln	%o2, %l4, %l0
	.word	0xd4067ff0	! t0_kref+0x1294:   	ld	[%i1 - 0x10], %o2
	.word	0x9a12000d	! t0_kref+0x1298:   	or	%o0, %o5, %o5
	.word	0xdd9e7ff8	! t0_kref+0x129c:   	ldda	[%i1 - 8]%asi, %f14
	.word	0xd0ae2017	! t0_kref+0x12a0:   	stba	%o0, [%i0 + 0x17]%asi
	.word	0x81ad0ab8	! t0_kref+0x12a4:   	fcmpes	%fcc0, %f20, %f24
	.word	0xd83e0000	! t0_kref+0x12a8:   	std	%o4, [%i0]
	.word	0xe9be5a5d	! t0_kref+0x12ac:   	stda	%f20, [%i1 + %i5]0xd2
	.word	0xa8750015	! t0_kref+0x12b0:   	udiv	%l4, %l5, %l4
	.word	0x948d801b	! t0_kref+0x12b4:   	andcc	%l6, %i3, %o2
	.word	0x86102007	! t0_kref+0x12b8:   	mov	0x7, %g3
	.word	0x86a0e001	! t0_kref+0x12bc:   	subcc	%g3, 1, %g3
	.word	0x22800013	! t0_kref+0x12c0:   	be,a	_kref+0x130c
	.word	0xd2270018	! t0_kref+0x12c4:   	st	%o1, [%i4 + %i0]
	.word	0xada00132	! t0_kref+0x12c8:   	fabss	%f18, %f22
	.word	0x92233c75	! t0_kref+0x12cc:   	sub	%o4, -0x38b, %o1
	.word	0x3a4ffffb	! t0_kref+0x12d0:   	bcc,a,pt	%icc, _kref+0x12bc
	.word	0xd8366016	! t0_kref+0x12d4:   	sth	%o4, [%i1 + 0x16]
	.word	0xa5b30280	! t0_kref+0x12d8:   	array32	%o4, %g0, %l2
	.word	0x2c480003	! t0_kref+0x12dc:   	bneg,a,pt	%icc, _kref+0x12e8
	.word	0xe91e7fe8	! t0_kref+0x12e0:   	ldd	[%i1 - 0x18], %f20
	.word	0xac3d001a	! t0_kref+0x12e4:   	xnor	%l4, %i2, %l6
	.word	0x81ae0ad0	! t0_kref+0x12e8:   	fcmped	%fcc0, %f24, %f16
	.word	0xec36001b	! t0_kref+0x12ec:   	sth	%l6, [%i0 + %i3]
	.word	0xd6a8a037	! t0_kref+0x12f0:   	stba	%o3, [%g2 + 0x37]%asi
	.word	0xabb50a6b	! t0_kref+0x12f4:   	fpadd32s	%f20, %f11, %f21
	.word	0xaa2d001a	! t0_kref+0x12f8:   	andn	%l4, %i2, %l5
	.word	0x95b680db	! t0_kref+0x12fc:   	edge16l	%i2, %i3, %o2
	.word	0xa1a388b4	! t0_kref+0x1300:   	fsubs	%f14, %f20, %f16
	.word	0x25078b53	! t0_kref+0x1304:   	sethi	%hi(0x1e2d4c00), %l2
	.word	0x95400000	! t0_kref+0x1308:   	mov	%y, %o2
	.word	0x93b3406a	! t0_kref+0x130c:   	edge8ln	%o5, %o2, %o1
	.word	0xed68a088	! t0_kref+0x1310:   	prefetch	%g2 + 0x88, 22
	.word	0x97b580fb	! t0_kref+0x1314:   	edge16ln	%l6, %i3, %o3
	.word	0xd51e7ff8	! t0_kref+0x1318:   	ldd	[%i1 - 8], %f10
	.word	0x9ba3c8ad	! t0_kref+0x131c:   	fsubs	%f15, %f13, %f13
	.word	0xa8380009	! t0_kref+0x1320:   	xnor	%g0, %o1, %l4
	.word	0x900b3512	! t0_kref+0x1324:   	and	%o4, -0xaee, %o0
	.word	0xf76e401a	! t0_kref+0x1328:   	prefetch	%i1 + %i2, 27
	.word	0xd028a02b	! t0_kref+0x132c:   	stb	%o0, [%g2 + 0x2b]
	.word	0xebe8a00e	! t0_kref+0x1330:   	prefetcha	%g2 + 0xe, 21
	.word	0x99a289cc	! t0_kref+0x1334:   	fdivd	%f10, %f12, %f12
	.word	0xa416c008	! t0_kref+0x1338:   	or	%i3, %o0, %l2
	.word	0x9ed2c000	! t0_kref+0x133c:   	umulcc	%o3, %g0, %o7
	.word	0xe900a01c	! t0_kref+0x1340:   	ld	[%g2 + 0x1c], %f20
	.word	0x8d85c00a	! t0_kref+0x1344:   	wr	%l7, %o2, %fprs
	.word	0x91a01930	! t0_kref+0x1348:   	fstod	%f16, %f8
	.word	0xa8b330e0	! t0_kref+0x134c:   	orncc	%o4, -0xf20, %l4
	.word	0xf83e401d	! t0_kref+0x1350:   	std	%i4, [%i1 + %i5]
	.word	0x9ad27ffa	! t0_kref+0x1354:   	umulcc	%o1, -0x6, %o5
	.word	0x97a01a50	! t0_kref+0x1358:   	fdtoi	%f16, %f11
	.word	0xaa32400a	! t0_kref+0x135c:   	orn	%o1, %o2, %l5
	.word	0xe6560000	! t0_kref+0x1360:   	ldsh	[%i0], %l3
	.word	0x98c2401b	! t0_kref+0x1364:   	addccc	%o1, %i3, %o4
	.word	0xada649a9	! t0_kref+0x1368:   	fdivs	%f25, %f9, %f22
	.word	0x81ad0ad8	! t0_kref+0x136c:   	fcmped	%fcc0, %f20, %f24
	.word	0x22480006	! t0_kref+0x1370:   	be,a,pt	%icc, _kref+0x1388
	.word	0xa5b00fc0	! t0_kref+0x1374:   	fone	%f18
	.word	0x9a82fed2	! t0_kref+0x1378:   	addcc	%o3, -0x12e, %o5
	.word	0xea467fec	! t0_kref+0x137c:   	ldsw	[%i1 - 0x14], %l5
	.word	0x9088000d	! t0_kref+0x1380:   	andcc	%g0, %o5, %o0
	.word	0xdf270019	! t0_kref+0x1384:   	st	%f15, [%i4 + %i1]
	.word	0x81580000	! t0_kref+0x1388:   	flushw
	.word	0x93b5c154	! t0_kref+0x138c:   	edge32l	%l7, %l4, %o1
	.word	0x97b50f69	! t0_kref+0x1390:   	fornot1s	%f20, %f9, %f11
	.word	0x97a00530	! t0_kref+0x1394:   	fsqrts	%f16, %f11
	.word	0x34800008	! t0_kref+0x1398:   	bg,a	_kref+0x13b8
	.word	0x9fa01a31	! t0_kref+0x139c:   	fstoi	%f17, %f15
	.word	0x92f2776d	! t0_kref+0x13a0:   	udivcc	%o1, -0x893, %o1
	.word	0xa1a5094a	! t0_kref+0x13a4:   	fmuld	%f20, %f10, %f16
	.word	0xd0b66004	! t0_kref+0x13a8:   	stha	%o0, [%i1 + 4]%asi
	.word	0x2d800007	! t0_kref+0x13ac:   	fbg,a	_kref+0x13c8
	.word	0x97b34160	! t0_kref+0x13b0:   	edge32ln	%o5, %g0, %o3
	.word	0xe66e401a	! t0_kref+0x13b4:   	ldstub	[%i1 + %i2], %l3
	.word	0x94834008	! t0_kref+0x13b8:   	addcc	%o5, %o0, %o2
	.word	0x81830000	! t0_kref+0x13bc:   	wr	%o4, %g0, %y
	.word	0xada00530	! t0_kref+0x13c0:   	fsqrts	%f16, %f22
	.word	0xa212f5c1	! t0_kref+0x13c4:   	or	%o3, -0xa3f, %l1
	.word	0x9fa01a56	! t0_kref+0x13c8:   	fdtoi	%f22, %f15
	.word	0xa5a589b8	! t0_kref+0x13cc:   	fdivs	%f22, %f24, %f18
	.word	0xa4c24014	! t0_kref+0x13d0:   	addccc	%o1, %l4, %l2
	.word	0x8143e040	! t0_kref+0x13d4:   	membar	0x40
	.word	0xa840001a	! t0_kref+0x13d8:   	addc	%g0, %i2, %l4
	.word	0xd19f5a19	! t0_kref+0x13dc:   	ldda	[%i5 + %i1]0xd0, %f8
	.word	0x963376cd	! t0_kref+0x13e0:   	orn	%o5, -0x933, %o3
	.word	0x86102003	! t0_kref+0x13e4:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x13e8:   	bne,a	_kref+0x13e8
	.word	0x86a0e001	! t0_kref+0x13ec:   	subcc	%g3, 1, %g3
	.word	0xf19f1a18	! t0_kref+0x13f0:   	ldda	[%i4 + %i0]0xd0, %f24
	.word	0x2d2e9e10	! t0_kref+0x13f4:   	sethi	%hi(0xba784000), %l6
	.word	0xd4100018	! t0_kref+0x13f8:   	lduh	[%g0 + %i0], %o2
	.word	0xee070018	! t0_kref+0x13fc:   	ld	[%i4 + %i0], %l7
	.word	0xa876ee5a	! t0_kref+0x1400:   	udiv	%i3, 0xe5a, %l4
	.word	0xd4ce3fec	! t0_kref+0x1404:   	ldsba	[%i0 - 0x14]%asi, %o2
	.word	0x99a64d33	! t0_kref+0x1408:   	fsmuld	%f25, %f19, %f12
	.word	0x3e800006	! t0_kref+0x140c:   	bvc,a	_kref+0x1424
	.word	0xaba01a2f	! t0_kref+0x1410:   	fstoi	%f15, %f21
	.word	0xda08a009	! t0_kref+0x1414:   	ldub	[%g2 + 9], %o5
	.word	0x81ab8ad6	! t0_kref+0x1418:   	fcmped	%fcc0, %f14, %f22
	.word	0xa9a01a4e	! t0_kref+0x141c:   	fdtoi	%f14, %f20
	.word	0x293d3449	! t0_kref+0x1420:   	sethi	%hi(0xf4d12400), %l4
	.word	0xe780a024	! t0_kref+0x1424:   	lda	[%g2 + 0x24]%asi, %f19
	.word	0x90ad4014	! t0_kref+0x1428:   	andncc	%l5, %l4, %o0
	.word	0xdf20a018	! t0_kref+0x142c:   	st	%f15, [%g2 + 0x18]
	.word	0x81aa0ab5	! t0_kref+0x1430:   	fcmpes	%fcc0, %f8, %f21
	.word	0x81b01023	! t0_kref+0x1434:   	siam	0x3
	.word	0xd4f6501d	! t0_kref+0x1438:   	stxa	%o2, [%i1 + %i5]0x80
	.word	0x3b800006	! t0_kref+0x143c:   	fble,a	_kref+0x1454
	.word	0x9db00c00	! t0_kref+0x1440:   	fzero	%f14
	.word	0x90083cbd	! t0_kref+0x1444:   	and	%g0, -0x343, %o0
	.word	0xda10a036	! t0_kref+0x1448:   	lduh	[%g2 + 0x36], %o5
	.word	0xee6e6017	! t0_kref+0x144c:   	ldstub	[%i1 + 0x17], %l7
	.word	0x963eba9f	! t0_kref+0x1450:   	xnor	%i2, -0x561, %o3
	.word	0xa5b5cfad	! t0_kref+0x1454:   	fors	%f23, %f13, %f18
	.word	0x3e480003	! t0_kref+0x1458:   	bvc,a,pt	%icc, _kref+0x1464
	.word	0xde4e8018	! t0_kref+0x145c:   	ldsb	[%i2 + %i0], %o7
	.word	0x93b34009	! t0_kref+0x1460:   	edge8	%o5, %o1, %o1
	.word	0xda160000	! t0_kref+0x1464:   	lduh	[%i0], %o5
	.word	0xe24e001a	! t0_kref+0x1468:   	ldsb	[%i0 + %i2], %l1
	.word	0x9ef5001b	! t0_kref+0x146c:   	udivcc	%l4, %i3, %o7
	.word	0xa5b44dee	! t0_kref+0x1470:   	fnands	%f17, %f14, %f18
	.word	0x9da01937	! t0_kref+0x1474:   	fstod	%f23, %f14
	.word	0xe1be1857	! t0_kref+0x1478:   	stda	%f16, [%i0 + %l7]0xc2
	.word	0xf6200019	! t0_kref+0x147c:   	st	%i3, [%g0 + %i1]
	.word	0x81aa0ad2	! t0_kref+0x1480:   	fcmped	%fcc0, %f8, %f18
	.word	0xf83e0000	! t0_kref+0x1484:   	std	%i4, [%i0]
	.word	0x93b2854a	! t0_kref+0x1488:   	fcmpeq16	%f10, %f10, %o1
	.word	0xf76e6000	! t0_kref+0x148c:   	prefetch	%i1, 27
	.word	0x3c480004	! t0_kref+0x1490:   	bpos,a,pt	%icc, _kref+0x14a0
	.word	0xa00d2372	! t0_kref+0x1494:   	and	%l4, 0x372, %l0
	.word	0x3e480002	! t0_kref+0x1498:   	bvc,a,pt	%icc, _kref+0x14a0
	.word	0x91a28858	! t0_kref+0x149c:   	faddd	%f10, %f24, %f8
	.word	0xa00339ae	! t0_kref+0x14a0:   	add	%o4, -0x652, %l0
	.word	0x9633401b	! t0_kref+0x14a4:   	orn	%o5, %i3, %o3
	.word	0x22480001	! t0_kref+0x14a8:   	be,a,pt	%icc, _kref+0x14ac
	.word	0xe91f4019	! t0_kref+0x14ac:   	ldd	[%i5 + %i1], %f20
	.word	0x99b44c6b	! t0_kref+0x14b0:   	fnors	%f17, %f11, %f12
	.word	0x91a4084a	! t0_kref+0x14b4:   	faddd	%f16, %f10, %f8
	.word	0x95a50d38	! t0_kref+0x14b8:   	fsmuld	%f20, %f24, %f10
	.word	0xe24e401a	! t0_kref+0x14bc:   	ldsb	[%i1 + %i2], %l1
	.word	0xdade2000	! t0_kref+0x14c0:   	ldxa	[%i0]%asi, %o5
	.word	0xa6bac008	! t0_kref+0x14c4:   	xnorcc	%o3, %o0, %l3
	.word	0xd206200c	! t0_kref+0x14c8:   	ld	[%i0 + 0xc], %o1
	.word	0xe1be5889	! t0_kref+0x14cc:   	stda	%f16, [%i1 + %o1]0xc4
	.word	0xa615674d	! t0_kref+0x14d0:   	or	%l5, 0x74d, %l3
	.word	0xabb64a70	! t0_kref+0x14d4:   	fpadd32s	%f25, %f16, %f21
	call	SYM(t0_subr1)
	.word	0xc0367ff4	! t0_kref+0x14dc:   	clrh	[%i1 - 0xc]
	.word	0xa1b38a92	! t0_kref+0x14e0:   	fpsub16	%f14, %f18, %f16
	.word	0x36480004	! t0_kref+0x14e4:   	bge,a,pt	%icc, _kref+0x14f4
	.word	0xee88a039	! t0_kref+0x14e8:   	lduba	[%g2 + 0x39]%asi, %l7
	.word	0xa4dec00c	! t0_kref+0x14ec:   	smulcc	%i3, %o4, %l2
	.word	0xe2563ff6	! t0_kref+0x14f0:   	ldsh	[%i0 - 0xa], %l1
	.word	0x93a01a36	! t0_kref+0x14f4:   	fstoi	%f22, %f9
	.word	0xadb2034b	! t0_kref+0x14f8:   	alignaddrl	%o0, %o3, %l6
	.word	0x9ac32a15	! t0_kref+0x14fc:   	addccc	%o4, 0xa15, %o5
	.word	0xe850a020	! t0_kref+0x1500:   	ldsh	[%g2 + 0x20], %l4
	.word	0xf96e2010	! t0_kref+0x1504:   	prefetch	%i0 + 0x10, 28
	.word	0xae8eb5b1	! t0_kref+0x1508:   	andcc	%i2, -0xa4f, %l7
	.word	0x25800001	! t0_kref+0x150c:   	fblg,a	_kref+0x1510
	.word	0x9da01939	! t0_kref+0x1510:   	fstod	%f25, %f14
	.word	0x9ee58016	! t0_kref+0x1514:   	subccc	%l6, %l6, %o7
	.word	0xb3b00c20	! t0_kref+0x1518:   	fzeros	%f25
	.word	0x27800004	! t0_kref+0x151c:   	fbul,a	_kref+0x152c
	.word	0xafb6c177	! t0_kref+0x1520:   	edge32ln	%i3, %l7, %l7
	.word	0x99b40994	! t0_kref+0x1524:   	bshuffle	%f16, %f20, %f12
	.word	0xec1e6018	! t0_kref+0x1528:   	ldd	[%i1 + 0x18], %l6
	.word	0xada01a29	! t0_kref+0x152c:   	fstoi	%f9, %f22
	.word	0xe300a034	! t0_kref+0x1530:   	ld	[%g2 + 0x34], %f17
	.word	0xa9b68168	! t0_kref+0x1534:   	edge32ln	%i2, %o0, %l4
	.word	0x9b2aa014	! t0_kref+0x1538:   	sll	%o2, 0x14, %o5
	call	SYM(t0_subr3)
	.word	0xd226601c	! t0_kref+0x1540:   	st	%o1, [%i1 + 0x1c]
	.word	0xd3267ffc	! t0_kref+0x1544:   	st	%f9, [%i1 - 4]
	.word	0x99b38e14	! t0_kref+0x1548:   	fand	%f14, %f20, %f12
	.word	0xa2b32ae7	! t0_kref+0x154c:   	orncc	%o4, 0xae7, %l1
	.word	0x9db6072f	! t0_kref+0x1550:   	fmuld8ulx16	%f24, %f15, %f14
	.word	0x96b33a9c	! t0_kref+0x1554:   	orncc	%o4, -0x564, %o3
	.word	0xa3b2812a	! t0_kref+0x1558:   	edge32n	%o2, %o2, %l1
	.word	0xa3a448b6	! t0_kref+0x155c:   	fsubs	%f17, %f22, %f17
	.word	0x91a3cd31	! t0_kref+0x1560:   	fsmuld	%f15, %f17, %f8
	.word	0xe96e3ff8	! t0_kref+0x1564:   	prefetch	%i0 - 8, 20
	.word	0xa9b48e54	! t0_kref+0x1568:   	fxnor	%f18, %f20, %f20
	.word	0xe9be584c	! t0_kref+0x156c:   	stda	%f20, [%i1 + %o4]0xc2
	.word	0x39800003	! t0_kref+0x1570:   	fbuge,a	_kref+0x157c
	.word	0xd1861000	! t0_kref+0x1574:   	lda	[%i0]0x80, %f8
	.word	0xd91f4019	! t0_kref+0x1578:   	ldd	[%i5 + %i1], %f12
	.word	0x8610201b	! t0_kref+0x157c:   	mov	0x1b, %g3
	.word	0x86a0e001	! t0_kref+0x1580:   	subcc	%g3, 1, %g3
	.word	0x2280000d	! t0_kref+0x1584:   	be,a	_kref+0x15b8
	.word	0xa5a0004c	! t0_kref+0x1588:   	fmovd	%f12, %f18
	.word	0xc0364000	! t0_kref+0x158c:   	clrh	[%i1]
	.word	0xa8222ae9	! t0_kref+0x1590:   	sub	%o0, 0xae9, %l4
	.word	0xaee6e302	! t0_kref+0x1594:   	subccc	%i3, 0x302, %l7
	.word	0x9fa01a54	! t0_kref+0x1598:   	fdtoi	%f20, %f15
	.word	0xe91e7fe8	! t0_kref+0x159c:   	ldd	[%i1 - 0x18], %f20
	.word	0x81ae0acc	! t0_kref+0x15a0:   	fcmped	%fcc0, %f24, %f12
	.word	0x960d6976	! t0_kref+0x15a4:   	and	%l5, 0x976, %o3
	.word	0x988a7115	! t0_kref+0x15a8:   	andcc	%o1, -0xeeb, %o4
	.word	0xa9b00cf9	! t0_kref+0x15ac:   	fnot2s	%f25, %f20
	.word	0x2f354fd6	! t0_kref+0x15b0:   	sethi	%hi(0xd53f5800), %l7
	.word	0xad2dc00b	! t0_kref+0x15b4:   	sll	%l7, %o3, %l6
	.word	0x86102003	! t0_kref+0x15b8:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x15bc:   	bne,a	_kref+0x15bc
	.word	0x86a0e001	! t0_kref+0x15c0:   	subcc	%g3, 1, %g3
	.word	0xdfa66010	! t0_kref+0x15c4:   	sta	%f15, [%i1 + 0x10]%asi
	.word	0xe208a01e	! t0_kref+0x15c8:   	ldub	[%g2 + 0x1e], %l1
	.word	0xafb58492	! t0_kref+0x15cc:   	fcmple32	%f22, %f18, %l7
	.word	0x9a9b6e1d	! t0_kref+0x15d0:   	xorcc	%o5, 0xe1d, %o5
	.word	0x8143e072	! t0_kref+0x15d4:   	membar	0x72
	.word	0x98aac00a	! t0_kref+0x15d8:   	andncc	%o3, %o2, %o4
	.word	0xa212bf58	! t0_kref+0x15dc:   	or	%o2, -0xa8, %l1
	.word	0xa913401b	! t0_kref+0x15e0:   	taddcctv	%o5, %i3, %l4
	.word	0xec5e7fe0	! t0_kref+0x15e4:   	ldx	[%i1 - 0x20], %l6
	.word	0x81820000	! t0_kref+0x15e8:   	wr	%o0, %g0, %y
	.word	0xa1b484d2	! t0_kref+0x15ec:   	fcmpne32	%f18, %f18, %l0
	.word	0x1737a0e1	! t0_kref+0x15f0:   	sethi	%hi(0xde838400), %o3
	.word	0xe49f5019	! t0_kref+0x15f4:   	ldda	[%i5 + %i1]0x80, %l2
	.word	0x95a0054c	! t0_kref+0x15f8:   	fsqrtd	%f12, %f10
	.word	0xd4a8a001	! t0_kref+0x15fc:   	stba	%o2, [%g2 + 1]%asi
	.word	0x86102006	! t0_kref+0x1600:   	mov	0x6, %g3
	.word	0x86a0e001	! t0_kref+0x1604:   	subcc	%g3, 1, %g3
	.word	0x22800003	! t0_kref+0x1608:   	be,a	_kref+0x1614
	.word	0xa470000c	! t0_kref+0x160c:   	udiv	%g0, %o4, %l2
	.word	0xa9a000c8	! t0_kref+0x1610:   	fnegd	%f8, %f20
	.word	0xa4b5b423	! t0_kref+0x1614:   	orncc	%l6, -0xbdd, %l2
	.word	0xb1a0002e	! t0_kref+0x1618:   	fmovs	%f14, %f24
	.word	0xa1b38f94	! t0_kref+0x161c:   	for	%f14, %f20, %f16
	.word	0x91b58d0c	! t0_kref+0x1620:   	fandnot1	%f22, %f12, %f8
	.word	0xed062004	! t0_kref+0x1624:   	ld	[%i0 + 4], %f22
	.word	0x3a800002	! t0_kref+0x1628:   	bcc,a	_kref+0x1630
	.word	0x9fa0002a	! t0_kref+0x162c:   	fmovs	%f10, %f15
	.word	0x963ac015	! t0_kref+0x1630:   	xnor	%o3, %l5, %o3
	.word	0xebe8a08e	! t0_kref+0x1634:   	prefetcha	%g2 + 0x8e, 21
	.word	0xd06e2017	! t0_kref+0x1638:   	ldstub	[%i0 + 0x17], %o0
	.word	0x9fa01a4a	! t0_kref+0x163c:   	fdtoi	%f10, %f15
	.word	0xab253509	! t0_kref+0x1640:   	mulscc	%l4, -0xaf7, %l5
	.word	0xabb00772	! t0_kref+0x1644:   	fpack16	%f18, %f21
	.word	0xa3a0012b	! t0_kref+0x1648:   	fabss	%f11, %f17
	.word	0x9da01a2f	! t0_kref+0x164c:   	fstoi	%f15, %f14
	.word	0x93a0188c	! t0_kref+0x1650:   	fitos	%f12, %f9
	.word	0x99a0054e	! t0_kref+0x1654:   	fsqrtd	%f14, %f12
	.word	0xf6363ff6	! t0_kref+0x1658:   	sth	%i3, [%i0 - 0xa]
	.word	0xa9b58ca8	! t0_kref+0x165c:   	fandnot2s	%f22, %f8, %f20
	.word	0x8143c000	! t0_kref+0x1660:   	stbar
	.word	0x9da018d4	! t0_kref+0x1664:   	fdtos	%f20, %f14
	.word	0x9da01a52	! t0_kref+0x1668:   	fdtoi	%f18, %f14
	.word	0xa80b0016	! t0_kref+0x166c:   	and	%o4, %l6, %l4
	.word	0xa5a0052a	! t0_kref+0x1670:   	fsqrts	%f10, %f18
	.word	0xdd00a03c	! t0_kref+0x1674:   	ld	[%g2 + 0x3c], %f14
	.word	0x9db28e2f	! t0_kref+0x1678:   	fands	%f10, %f15, %f14
	.word	0xe6562006	! t0_kref+0x167c:   	ldsh	[%i0 + 6], %l3
	.word	0xb1a018d2	! t0_kref+0x1680:   	fdtos	%f18, %f24
	.word	0xd036201c	! t0_kref+0x1684:   	sth	%o0, [%i0 + 0x1c]
	.word	0xdd00a034	! t0_kref+0x1688:   	ld	[%g2 + 0x34], %f14
	.word	0x93a00031	! t0_kref+0x168c:   	fmovs	%f17, %f9
	.word	0x9295000d	! t0_kref+0x1690:   	orcc	%l4, %o5, %o1
	.word	0x9e056935	! t0_kref+0x1694:   	add	%l5, 0x935, %o7
	.word	0xd296501b	! t0_kref+0x1698:   	lduha	[%i1 + %i3]0x80, %o1
	.word	0xe8567ffe	! t0_kref+0x169c:   	ldsh	[%i1 - 2], %l4
	.word	0x86102005	! t0_kref+0x16a0:   	mov	0x5, %g3
	.word	0x86a0e001	! t0_kref+0x16a4:   	subcc	%g3, 1, %g3
	.word	0x2280000b	! t0_kref+0x16a8:   	be,a	_kref+0x16d4
	.word	0xafb5858e	! t0_kref+0x16ac:   	fcmpgt32	%f22, %f14, %l7
	.word	0xa1a0192b	! t0_kref+0x16b0:   	fstod	%f11, %f16
	.word	0xad3da01a	! t0_kref+0x16b4:   	sra	%l6, 0x1a, %l6
	.word	0xb3a01894	! t0_kref+0x16b8:   	fitos	%f20, %f25
	.word	0xaef5a2cf	! t0_kref+0x16bc:   	udivcc	%l6, 0x2cf, %l7
	.word	0x96ab000b	! t0_kref+0x16c0:   	andncc	%o4, %o3, %o3
	.word	0x9fb60594	! t0_kref+0x16c4:   	fcmpgt32	%f24, %f20, %o7
	.word	0x81800000	! t0_kref+0x16c8:   	mov	%g0, %y
!	.word	0x3a48624c	! t0_kref+0x16cc:   	bcc,a,pt	%icc, SYM(t0_subr2)
	   	bcc,a,pt	%icc, SYM(t0_subr2)
	.word	0x9e006bf0	! t0_kref+0x16d0:   	add	%g1, 0xbf0, %o7
	.word	0x95a60952	! t0_kref+0x16d4:   	fmuld	%f24, %f18, %f10
	.word	0x91b60990	! t0_kref+0x16d8:   	bshuffle	%f24, %f16, %f8
	.word	0x9bb2406d	! t0_kref+0x16dc:   	edge8ln	%o1, %o5, %o5
	.word	0xd240a030	! t0_kref+0x16e0:   	ldsw	[%g2 + 0x30], %o1
	.word	0x95a01937	! t0_kref+0x16e4:   	fstod	%f23, %f10
	.word	0xea50a01e	! t0_kref+0x16e8:   	ldsh	[%g2 + 0x1e], %l5
	.word	0xada01930	! t0_kref+0x16ec:   	fstod	%f16, %f22
	.word	0x30480003	! t0_kref+0x16f0:   	ba,a,pt	%icc, _kref+0x16fc
	.word	0xf19e5a1a	! t0_kref+0x16f4:   	ldda	[%i1 + %i2]0xd0, %f24
	.word	0xc9ee1016	! t0_kref+0x16f8:   	prefetcha	%i0 + %l6, 4
	.word	0xec10a024	! t0_kref+0x16fc:   	lduh	[%g2 + 0x24], %l6
	.word	0xee6e2003	! t0_kref+0x1700:   	ldstub	[%i0 + 3], %l7
	.word	0x81aa4aaa	! t0_kref+0x1704:   	fcmpes	%fcc0, %f9, %f10
	.word	0xd8be6000	! t0_kref+0x1708:   	stda	%o4, [%i1]%asi
	call	SYM(t0_subr0)
	.word	0xab254017	! t0_kref+0x1710:   	mulscc	%l5, %l7, %l5
	.word	0xa5b30c58	! t0_kref+0x1714:   	fnor	%f12, %f24, %f18
	.word	0xd240a03c	! t0_kref+0x1718:   	ldsw	[%g2 + 0x3c], %o1
	.word	0x3a480007	! t0_kref+0x171c:   	bcc,a,pt	%icc, _kref+0x1738
	.word	0xa1a209a9	! t0_kref+0x1720:   	fdivs	%f8, %f9, %f16
	.word	0xe0563fe6	! t0_kref+0x1724:   	ldsh	[%i0 - 0x1a], %l0
	.word	0xa0d2001b	! t0_kref+0x1728:   	umulcc	%o0, %i3, %l0
	.word	0x25800007	! t0_kref+0x172c:   	fblg,a	_kref+0x1748
	.word	0xd850a002	! t0_kref+0x1730:   	ldsh	[%g2 + 2], %o4
	.word	0x9da2084a	! t0_kref+0x1734:   	faddd	%f8, %f10, %f14
	.word	0xee262014	! t0_kref+0x1738:   	st	%l7, [%i0 + 0x14]
	.word	0xda36001b	! t0_kref+0x173c:   	sth	%o5, [%i0 + %i3]
	.word	0xa9b00f0a	! t0_kref+0x1740:   	fsrc2	%f10, %f20
	.word	0x81b01020	! t0_kref+0x1744:   	siam	0x0
	.word	0x2725a4b3	! t0_kref+0x1748:   	sethi	%hi(0x9692cc00), %l3
	.word	0xa2adc00d	! t0_kref+0x174c:   	andncc	%l7, %o5, %l1
	.word	0xd2c0a018	! t0_kref+0x1750:   	ldswa	[%g2 + 0x18]%asi, %o1
	.word	0x34480002	! t0_kref+0x1754:   	bg,a,pt	%icc, _kref+0x175c
	.word	0xa3a508ad	! t0_kref+0x1758:   	fsubs	%f20, %f13, %f17
	.word	0xa5a489ad	! t0_kref+0x175c:   	fdivs	%f18, %f13, %f18
	.word	0x99b60f4e	! t0_kref+0x1760:   	fornot1	%f24, %f14, %f12
	.word	0x2a480006	! t0_kref+0x1764:   	bcs,a,pt	%icc, _kref+0x177c
	.word	0xf56e401d	! t0_kref+0x1768:   	prefetch	%i1 + %i5, 26
	.word	0x91a0192e	! t0_kref+0x176c:   	fstod	%f14, %f8
	.word	0xe16e401a	! t0_kref+0x1770:   	prefetch	%i1 + %i2, 16
	.word	0xada448a9	! t0_kref+0x1774:   	fsubs	%f17, %f9, %f22
	.word	0x9a930015	! t0_kref+0x1778:   	orcc	%o4, %l5, %o5
	.word	0x81aa8ac8	! t0_kref+0x177c:   	fcmped	%fcc0, %f10, %f8
	.word	0xad700000	! t0_kref+0x1780:   	popc	%g0, %l6
	.word	0xc36e400c	! t0_kref+0x1784:   	prefetch	%i1 + %o4, 1
	.word	0xd250a02e	! t0_kref+0x1788:   	ldsh	[%g2 + 0x2e], %o1
	.word	0x9bb2807b	! t0_kref+0x178c:   	edge8ln	%o2, %i3, %o5
	.word	0xaba01a48	! t0_kref+0x1790:   	fdtoi	%f8, %f21
	.word	0xde567fe0	! t0_kref+0x1794:   	ldsh	[%i1 - 0x20], %o7
	.word	0x3a480002	! t0_kref+0x1798:   	bcc,a,pt	%icc, _kref+0x17a0
	.word	0xda16401b	! t0_kref+0x179c:   	lduh	[%i1 + %i3], %o5
	.word	0x9db4c714	! t0_kref+0x17a0:   	fmuld8sux16	%f19, %f20, %f14
	.word	0x3e800004	! t0_kref+0x17a4:   	bvc,a	_kref+0x17b4
	.word	0x99b40a88	! t0_kref+0x17a8:   	fpsub16	%f16, %f8, %f12
	.word	0xa0d2c00a	! t0_kref+0x17ac:   	umulcc	%o3, %o2, %l0
	.word	0x9da00048	! t0_kref+0x17b0:   	fmovd	%f8, %f14
	.word	0x2e800001	! t0_kref+0x17b4:   	bvs,a	_kref+0x17b8
	.word	0xac436f2b	! t0_kref+0x17b8:   	addc	%o5, 0xf2b, %l6
	.word	0xf436401b	! t0_kref+0x17bc:   	sth	%i2, [%i1 + %i3]
	.word	0xc768a006	! t0_kref+0x17c0:   	prefetch	%g2 + 6, 3
	.word	0xa9b6096c	! t0_kref+0x17c4:   	fpmerge	%f24, %f12, %f20
	.word	0xada58831	! t0_kref+0x17c8:   	fadds	%f22, %f17, %f22
	.word	0xaba00033	! t0_kref+0x17cc:   	fmovs	%f19, %f21
	.word	0xafb50488	! t0_kref+0x17d0:   	fcmple32	%f20, %f8, %l7
	.word	0x13240230	! t0_kref+0x17d4:   	sethi	%hi(0x9008c000), %o1
	.word	0xdac0a034	! t0_kref+0x17d8:   	ldswa	[%g2 + 0x34]%asi, %o5
	.word	0x93a288b8	! t0_kref+0x17dc:   	fsubs	%f10, %f24, %f9
	.word	0x91a01a4e	! t0_kref+0x17e0:   	fdtoi	%f14, %f8
	.word	0xac26801b	! t0_kref+0x17e4:   	sub	%i2, %i3, %l6
	.word	0xd2300018	! t0_kref+0x17e8:   	sth	%o1, [%g0 + %i0]
	.word	0x21309551	! t0_kref+0x17ec:   	sethi	%hi(0xc2554400), %l0
	.word	0xfdee101b	! t0_kref+0x17f0:   	prefetcha	%i0 + %i3, 30
	.word	0xd2270018	! t0_kref+0x17f4:   	st	%o1, [%i4 + %i0]
	.word	0x9636c00a	! t0_kref+0x17f8:   	orn	%i3, %o2, %o3
	.word	0xee0e001a	! t0_kref+0x17fc:   	ldub	[%i0 + %i2], %l7
	.word	0xc96e2010	! t0_kref+0x1800:   	prefetch	%i0 + 0x10, 4
	.word	0xe53e7ff8	! t0_kref+0x1804:   	std	%f18, [%i1 - 8]
	.word	0xe3a67ffc	! t0_kref+0x1808:   	sta	%f17, [%i1 - 4]%asi
	.word	0xa7b68156	! t0_kref+0x180c:   	edge32l	%i2, %l6, %l3
	.word	0xada3c8b5	! t0_kref+0x1810:   	fsubs	%f15, %f21, %f22
	.word	0x91a88050	! t0_kref+0x1814:   	fmovdlg	%fcc0, %f16, %f8
	.word	0x95b3866c	! t0_kref+0x1818:   	fmul8x16au	%f14, %f12, %f10
	.word	0xa7a388ad	! t0_kref+0x181c:   	fsubs	%f14, %f13, %f19
	.word	0xa6ad001b	! t0_kref+0x1820:   	andncc	%l4, %i3, %l3
	.word	0xe1270019	! t0_kref+0x1824:   	st	%f16, [%i4 + %i1]
	.word	0x9ba00029	! t0_kref+0x1828:   	fmovs	%f9, %f13
	.word	0xed3e7ff0	! t0_kref+0x182c:   	std	%f22, [%i1 - 0x10]
	.word	0x9ed37aad	! t0_kref+0x1830:   	umulcc	%o5, -0x553, %o7
	.word	0xb1a01116	! t0_kref+0x1834:   	fxtod	%f22, %f24
	.word	0xea367ff4	! t0_kref+0x1838:   	sth	%l5, [%i1 - 0xc]
	.word	0xa08eb0b2	! t0_kref+0x183c:   	andcc	%i2, -0xf4e, %l0
	.word	0xadb28912	! t0_kref+0x1840:   	faligndata	%f10, %f18, %f22
	.word	0xd480a018	! t0_kref+0x1844:   	lda	[%g2 + 0x18]%asi, %o2
	.word	0xf3a0a03c	! t0_kref+0x1848:   	sta	%f25, [%g2 + 0x3c]%asi
	.word	0x99a60d28	! t0_kref+0x184c:   	fsmuld	%f24, %f8, %f12
	.word	0x9da5082d	! t0_kref+0x1850:   	fadds	%f20, %f13, %f14
	.word	0x96883cb9	! t0_kref+0x1854:   	andcc	%g0, -0x347, %o3
	.word	0xd326601c	! t0_kref+0x1858:   	st	%f9, [%i1 + 0x1c]
	.word	0xee366014	! t0_kref+0x185c:   	sth	%l7, [%i1 + 0x14]
	.word	0x9fb00348	! t0_kref+0x1860:   	alignaddrl	%g0, %o0, %o7
	.word	0xf326401c	! t0_kref+0x1864:   	st	%f25, [%i1 + %i4]
	.word	0x24800003	! t0_kref+0x1868:   	ble,a	_kref+0x1874
	.word	0xec08a01b	! t0_kref+0x186c:   	ldub	[%g2 + 0x1b], %l6
	.word	0x9fa01a35	! t0_kref+0x1870:   	fstoi	%f21, %f15
	.word	0xf6280018	! t0_kref+0x1874:   	stb	%i3, [%g0 + %i0]
	.word	0x95a50954	! t0_kref+0x1878:   	fmuld	%f20, %f20, %f10
	.word	0x28480004	! t0_kref+0x187c:   	bleu,a,pt	%icc, _kref+0x188c
	.word	0xe4070018	! t0_kref+0x1880:   	ld	[%i4 + %i0], %l2
	.word	0xb3a000b8	! t0_kref+0x1884:   	fnegs	%f24, %f25
	.word	0xe91861d0	! t0_kref+0x1888:   	ldd	[%g1 + 0x1d0], %f20
	.word	0x91b5c136	! t0_kref+0x188c:   	edge32n	%l7, %l6, %o0
	.word	0xaef2000d	! t0_kref+0x1890:   	udivcc	%o0, %o5, %l7
	.word	0xa5a30d2f	! t0_kref+0x1894:   	fsmuld	%f12, %f15, %f18
	.word	0x27051c53	! t0_kref+0x1898:   	sethi	%hi(0x14714c00), %l3
	.word	0xd44e3ffa	! t0_kref+0x189c:   	ldsb	[%i0 - 6], %o2
	.word	0xe686501c	! t0_kref+0x18a0:   	lda	[%i1 + %i4]0x80, %l3
	.word	0x28480005	! t0_kref+0x18a4:   	bleu,a,pt	%icc, _kref+0x18b8
	.word	0xd7070018	! t0_kref+0x18a8:   	ld	[%i4 + %i0], %f11
	.word	0xac224017	! t0_kref+0x18ac:   	sub	%o1, %l7, %l6
	.word	0x9bb68240	! t0_kref+0x18b0:   	array16	%i2, %g0, %o5
	.word	0xc3ee5016	! t0_kref+0x18b4:   	prefetcha	%i1 + %l6, 1
	.word	0x3e480007	! t0_kref+0x18b8:   	bvc,a,pt	%icc, _kref+0x18d4
	.word	0xafa2c8b0	! t0_kref+0x18bc:   	fsubs	%f11, %f16, %f23
	.word	0x98f3401a	! t0_kref+0x18c0:   	udivcc	%o5, %i2, %o4
	.word	0x93a00129	! t0_kref+0x18c4:   	fabss	%f9, %f9
	.word	0x99b38d32	! t0_kref+0x18c8:   	fandnot1s	%f14, %f18, %f12
	.word	0x9a2a4015	! t0_kref+0x18cc:   	andn	%o1, %l5, %o5
	.word	0x2b800005	! t0_kref+0x18d0:   	fbug,a	_kref+0x18e4
	.word	0x912a2004	! t0_kref+0x18d4:   	sll	%o0, 0x4, %o0
	.word	0x81ac8ad2	! t0_kref+0x18d8:   	fcmped	%fcc0, %f18, %f18
	.word	0xa5b00cce	! t0_kref+0x18dc:   	fnot2	%f14, %f18
	.word	0xb3a01a50	! t0_kref+0x18e0:   	fdtoi	%f16, %f25
	.word	0xadb28448	! t0_kref+0x18e4:   	fcmpne16	%f10, %f8, %l6
	.word	0xa9a00558	! t0_kref+0x18e8:   	fsqrtd	%f24, %f20
	.word	0xa80b4016	! t0_kref+0x18ec:   	and	%o5, %l6, %l4
	.word	0xe6ee6004	! t0_kref+0x18f0:   	ldstuba	[%i1 + 4]%asi, %l3
	.word	0xc036600e	! t0_kref+0x18f4:   	clrh	[%i1 + 0xe]
	.word	0x91a00550	! t0_kref+0x18f8:   	fsqrtd	%f16, %f8
	.word	0xe68e3fe1	! t0_kref+0x18fc:   	lduba	[%i0 - 0x1f]%asi, %l3
	.word	0x97b007b8	! t0_kref+0x1900:   	fpackfix	%f24, %f11
	.word	0xe41e3ff8	! t0_kref+0x1904:   	ldd	[%i0 - 8], %l2
	.word	0x36800001	! t0_kref+0x1908:   	bge,a	_kref+0x190c
	.word	0xd02e6002	! t0_kref+0x190c:   	stb	%o0, [%i1 + 2]
	.word	0x2f3136e3	! t0_kref+0x1910:   	sethi	%hi(0xc4db8c00), %l7
	.word	0xada01a2f	! t0_kref+0x1914:   	fstoi	%f15, %f22
	.word	0xa7a018c8	! t0_kref+0x1918:   	fdtos	%f8, %f19
	.word	0xab3ea01b	! t0_kref+0x191c:   	sra	%i2, 0x1b, %l5
	.word	0x98436e05	! t0_kref+0x1920:   	addc	%o5, 0xe05, %o4
	.word	0xd65e6000	! t0_kref+0x1924:   	ldx	[%i1], %o3
	.word	0xd80e001a	! t0_kref+0x1928:   	ldub	[%i0 + %i2], %o4
	.word	0xb1b58748	! t0_kref+0x192c:   	fpack32	%f22, %f8, %f24
	.word	0xa3400000	! t0_kref+0x1930:   	mov	%y, %l1
	.word	0x9af00000	! t0_kref+0x1934:   	udivcc	%g0, %g0, %o5
	.word	0x81ad8ac8	! t0_kref+0x1938:   	fcmped	%fcc0, %f22, %f8
	.word	0xed380019	! t0_kref+0x193c:   	std	%f22, [%g0 + %i1]
	.word	0xaba2c82d	! t0_kref+0x1940:   	fadds	%f11, %f13, %f21
	.word	0x36800002	! t0_kref+0x1944:   	bge,a	_kref+0x194c
	.word	0xa3a649b6	! t0_kref+0x1948:   	fdivs	%f25, %f22, %f17
	.word	0x94b269c0	! t0_kref+0x194c:   	orncc	%o1, 0x9c0, %o2
	.word	0xa9a018ca	! t0_kref+0x1950:   	fdtos	%f10, %f20
	.word	0xe5267fe8	! t0_kref+0x1954:   	st	%f18, [%i1 - 0x18]
	.word	0xd180a00c	! t0_kref+0x1958:   	lda	[%g2 + 0xc]%asi, %f8
	.word	0x99a0188e	! t0_kref+0x195c:   	fitos	%f14, %f12
	.word	0xd86e0000	! t0_kref+0x1960:   	ldstub	[%i0], %o4
	.word	0x94922b98	! t0_kref+0x1964:   	orcc	%o0, 0xb98, %o2
	.word	0xaba00038	! t0_kref+0x1968:   	fmovs	%f24, %f21
	.word	0xab20000c	! t0_kref+0x196c:   	mulscc	%g0, %o4, %l5
	.word	0xe27e7fe4	! t0_kref+0x1970:   	swap	[%i1 - 0x1c], %l1
	.word	0xa3a608b7	! t0_kref+0x1974:   	fsubs	%f24, %f23, %f17
	.word	0x99b40e18	! t0_kref+0x1978:   	fand	%f16, %f24, %f12
	.word	0xb3a01a29	! t0_kref+0x197c:   	fstoi	%f9, %f25
	.word	0xea06401c	! t0_kref+0x1980:   	ld	[%i1 + %i4], %l5
	.word	0xee6e7fe7	! t0_kref+0x1984:   	ldstub	[%i1 - 0x19], %l7
	.word	0xd06e3fe9	! t0_kref+0x1988:   	ldstub	[%i0 - 0x17], %o0
	.word	0xee4e2001	! t0_kref+0x198c:   	ldsb	[%i0 + 1], %l7
	.word	0x81820000	! t0_kref+0x1990:   	wr	%o0, %g0, %y
	.word	0x9a2daea5	! t0_kref+0x1994:   	andn	%l6, 0xea5, %o5
	.word	0x28480004	! t0_kref+0x1998:   	bleu,a,pt	%icc, _kref+0x19a8
	.word	0xb3a548b3	! t0_kref+0x199c:   	fsubs	%f21, %f19, %f25
	.word	0xe2567ff6	! t0_kref+0x19a0:   	ldsh	[%i1 - 0xa], %l1
	.word	0x91b20a56	! t0_kref+0x19a4:   	fpadd32	%f8, %f22, %f8
	.word	0x27800006	! t0_kref+0x19a8:   	fbul,a	_kref+0x19c0
	.word	0xa9b3466d	! t0_kref+0x19ac:   	fmul8x16au	%f13, %f13, %f20
	.word	0xb3a649b8	! t0_kref+0x19b0:   	fdivs	%f25, %f24, %f25
	.word	0xa4d23824	! t0_kref+0x19b4:   	umulcc	%o0, -0x7dc, %l2
	.word	0xec9e7ff0	! t0_kref+0x19b8:   	ldda	[%i1 - 0x10]%asi, %l6
	.word	0xd02e7fe0	! t0_kref+0x19bc:   	stb	%o0, [%i1 - 0x20]
	.word	0x8582000c	! t0_kref+0x19c0:   	wr	%o0, %o4, %ccr
	.word	0x81aa0ad8	! t0_kref+0x19c4:   	fcmped	%fcc0, %f8, %f24
	.word	0xdf80a034	! t0_kref+0x19c8:   	lda	[%g2 + 0x34]%asi, %f15
	.word	0xe250a022	! t0_kref+0x19cc:   	ldsh	[%g2 + 0x22], %l1
	.word	0x99b387d6	! t0_kref+0x19d0:   	pdist	%f14, %f22, %f12
	.word	0xeb267ffc	! t0_kref+0x19d4:   	st	%f21, [%i1 - 4]
	.word	0xa2750017	! t0_kref+0x19d8:   	udiv	%l4, %l7, %l1
	.word	0x28480002	! t0_kref+0x19dc:   	bleu,a,pt	%icc, _kref+0x19e4
	.word	0xa6252b2f	! t0_kref+0x19e0:   	sub	%l4, 0xb2f, %l3
	.word	0x3c480001	! t0_kref+0x19e4:   	bpos,a,pt	%icc, _kref+0x19e8
	.word	0x99b20100	! t0_kref+0x19e8:   	edge32	%o0, %g0, %o4
	.word	0xa4f68008	! t0_kref+0x19ec:   	udivcc	%i2, %o0, %l2
	.word	0x81aa0ad6	! t0_kref+0x19f0:   	fcmped	%fcc0, %f8, %f22
	.word	0x96dd0008	! t0_kref+0x19f4:   	smulcc	%l4, %o0, %o3
	.word	0x24800003	! t0_kref+0x19f8:   	ble,a	_kref+0x1a04
	.word	0x9482c00b	! t0_kref+0x19fc:   	addcc	%o3, %o3, %o2
	.word	0x97a01893	! t0_kref+0x1a00:   	fitos	%f19, %f11
	.word	0x36800001	! t0_kref+0x1a04:   	bge,a	_kref+0x1a08
	.word	0x9170001b	! t0_kref+0x1a08:   	popc	%i3, %o0
	.word	0xadb50f6f	! t0_kref+0x1a0c:   	fornot1s	%f20, %f15, %f22
	.word	0xe82e0000	! t0_kref+0x1a10:   	stb	%l4, [%i0]
	.word	0xdd9e7ff0	! t0_kref+0x1a14:   	ldda	[%i1 - 0x10]%asi, %f14
	.word	0x90ad000d	! t0_kref+0x1a18:   	andncc	%l4, %o5, %o0
	.word	0xa01327d6	! t0_kref+0x1a1c:   	or	%o4, 0x7d6, %l0
	.word	0xf7ee501c	! t0_kref+0x1a20:   	prefetcha	%i1 + %i4, 27
	.word	0xada40d2b	! t0_kref+0x1a24:   	fsmuld	%f16, %f11, %f22
	.word	0xafa00131	! t0_kref+0x1a28:   	fabss	%f17, %f23
	.word	0x9a36c00c	! t0_kref+0x1a2c:   	orn	%i3, %o4, %o5
	.word	0xe00e201e	! t0_kref+0x1a30:   	ldub	[%i0 + 0x1e], %l0
	.word	0x2e480004	! t0_kref+0x1a34:   	bvs,a,pt	%icc, _kref+0x1a44
	.word	0x93a249b3	! t0_kref+0x1a38:   	fdivs	%f9, %f19, %f9
	.word	0x9fc10000	! t0_kref+0x1a3c:   	call	%g4
	.word	0x98127cb6	! t0_kref+0x1a40:   	or	%o1, -0x34a, %o4
	.word	0xb3a01a4e	! t0_kref+0x1a44:   	fdtoi	%f14, %f25
	.word	0x99a01a4c	! t0_kref+0x1a48:   	fdtoi	%f12, %f12
	.word	0xadb40ad0	! t0_kref+0x1a4c:   	fpsub32	%f16, %f16, %f22
	.word	0xa8d28016	! t0_kref+0x1a50:   	umulcc	%o2, %l6, %l4
	.word	0x97b48ab1	! t0_kref+0x1a54:   	fpsub16s	%f18, %f17, %f11
	.word	0xeece600c	! t0_kref+0x1a58:   	ldsba	[%i1 + 0xc]%asi, %l7
	.word	0xa9a00054	! t0_kref+0x1a5c:   	fmovd	%f20, %f20
	.word	0x99b48a98	! t0_kref+0x1a60:   	fpsub16	%f18, %f24, %f12
	.word	0x81ad8aca	! t0_kref+0x1a64:   	fcmped	%fcc0, %f22, %f10
	.word	0x902ac015	! t0_kref+0x1a68:   	andn	%o3, %l5, %o0
	.word	0xe820a028	! t0_kref+0x1a6c:   	st	%l4, [%g2 + 0x28]
	.word	0xd13e001d	! t0_kref+0x1a70:   	std	%f8, [%i0 + %i5]
	.word	0x9a9b401b	! t0_kref+0x1a74:   	xorcc	%o5, %i3, %o5
	.word	0xe99e5a1c	! t0_kref+0x1a78:   	ldda	[%i1 + %i4]0xd0, %f20
	.word	0xb1b50a8e	! t0_kref+0x1a7c:   	fpsub16	%f20, %f14, %f24
	.word	0x32800001	! t0_kref+0x1a80:   	bne,a	_kref+0x1a84
	.word	0x81800000	! t0_kref+0x1a84:   	mov	%g0, %y
	.word	0xe640a028	! t0_kref+0x1a88:   	ldsw	[%g2 + 0x28], %l3
	.word	0xef00a018	! t0_kref+0x1a8c:   	ld	[%g2 + 0x18], %f23
	.word	0xaca5bf1e	! t0_kref+0x1a90:   	subcc	%l6, -0xe2, %l6
	.word	0xa8253322	! t0_kref+0x1a94:   	sub	%l4, -0xcde, %l4
	.word	0x37800006	! t0_kref+0x1a98:   	fbge,a	_kref+0x1ab0
	.word	0xa6a5801b	! t0_kref+0x1a9c:   	subcc	%l6, %i3, %l3
	.word	0xd6270019	! t0_kref+0x1aa0:   	st	%o3, [%i4 + %i1]
	.word	0x9fb50080	! t0_kref+0x1aa4:   	edge16	%l4, %g0, %o7
	.word	0x81ac4a39	! t0_kref+0x1aa8:   	fcmps	%fcc0, %f17, %f25
	.word	0x91a0052c	! t0_kref+0x1aac:   	fsqrts	%f12, %f8
	.word	0xb3a349af	! t0_kref+0x1ab0:   	fdivs	%f13, %f15, %f25
	.word	0xe36e401d	! t0_kref+0x1ab4:   	prefetch	%i1 + %i5, 17
	.word	0xc0263ff4	! t0_kref+0x1ab8:   	clr	[%i0 - 0xc]
	.word	0xa7b2c075	! t0_kref+0x1abc:   	edge8ln	%o3, %l5, %l3
	.word	0xe100a03c	! t0_kref+0x1ac0:   	ld	[%g2 + 0x3c], %f16
	.word	0xd5be6000	! t0_kref+0x1ac4:   	stda	%f10, [%i1]%asi
	.word	0xadaa4056	! t0_kref+0x1ac8:   	fmovde	%fcc0, %f22, %f22
	.word	0xa3a388af	! t0_kref+0x1acc:   	fsubs	%f14, %f15, %f17
	.word	0x97b3000a	! t0_kref+0x1ad0:   	edge8	%o4, %o2, %o3
	.word	0xec50a030	! t0_kref+0x1ad4:   	ldsh	[%g2 + 0x30], %l6
	.word	0x9a25c016	! t0_kref+0x1ad8:   	sub	%l7, %l6, %o5
	.word	0x91a00028	! t0_kref+0x1adc:   	fmovs	%f8, %f8
	.word	0xa21d800a	! t0_kref+0x1ae0:   	xor	%l6, %o2, %l1
	.word	0x2a480001	! t0_kref+0x1ae4:   	bcs,a,pt	%icc, _kref+0x1ae8
	.word	0xd0c8a025	! t0_kref+0x1ae8:   	ldsba	[%g2 + 0x25]%asi, %o0
	.word	0x8143e040	! t0_kref+0x1aec:   	membar	0x40
	.word	0x94053400	! t0_kref+0x1af0:   	add	%l4, -0xc00, %o2
	.word	0xaa9aa9dc	! t0_kref+0x1af4:   	xorcc	%o2, 0x9dc, %l5
	.word	0x130e94f3	! t0_kref+0x1af8:   	sethi	%hi(0x3a53cc00), %o1
	.word	0x9233000a	! t0_kref+0x1afc:   	orn	%o4, %o2, %o1
	.word	0xb1b00cf8	! t0_kref+0x1b00:   	fnot2s	%f24, %f24
	.word	0xa9a589a9	! t0_kref+0x1b04:   	fdivs	%f22, %f9, %f20
	.word	0xe41e2000	! t0_kref+0x1b08:   	ldd	[%i0], %l2
	.word	0xa5a4084c	! t0_kref+0x1b0c:   	faddd	%f16, %f12, %f18
	.word	0xec10a01c	! t0_kref+0x1b10:   	lduh	[%g2 + 0x1c], %l6
	.word	0xea362002	! t0_kref+0x1b14:   	sth	%l5, [%i0 + 2]
	.word	0x95b58ad4	! t0_kref+0x1b18:   	fpsub32	%f22, %f20, %f10
	.word	0x9db20632	! t0_kref+0x1b1c:   	fmul8x16	%f8, %f18, %f14
	.word	0xa1b3cd2d	! t0_kref+0x1b20:   	fandnot1s	%f15, %f13, %f16
	.word	0x30800005	! t0_kref+0x1b24:   	ba,a	_kref+0x1b38
	.word	0xd5f6101b	! t0_kref+0x1b28:   	casxa	[%i0]0x80, %i3, %o2
	.word	0x2a800006	! t0_kref+0x1b2c:   	bcs,a	_kref+0x1b44
	.word	0x81850000	! t0_kref+0x1b30:   	wr	%l4, %g0, %y
	.word	0x903eea6a	! t0_kref+0x1b34:   	xnor	%i3, 0xa6a, %o0
	.word	0xda4e2011	! t0_kref+0x1b38:   	ldsb	[%i0 + 0x11], %o5
	.word	0x96d5401b	! t0_kref+0x1b3c:   	umulcc	%l5, %i3, %o3
	.word	0x99a01932	! t0_kref+0x1b40:   	fstod	%f18, %f12
	.word	0x969d8015	! t0_kref+0x1b44:   	xorcc	%l6, %l5, %o3
	.word	0xd4160000	! t0_kref+0x1b48:   	lduh	[%i0], %o2
	.word	0xa6d20000	! t0_kref+0x1b4c:   	umulcc	%o0, %g0, %l3
	.word	0x99a549a9	! t0_kref+0x1b50:   	fdivs	%f21, %f9, %f12
	.word	0x99a00536	! t0_kref+0x1b54:   	fsqrts	%f22, %f12
	.word	0xafb50309	! t0_kref+0x1b58:   	alignaddr	%l4, %o1, %l7
	.word	0xeb68a047	! t0_kref+0x1b5c:   	prefetch	%g2 + 0x47, 21
	.word	0x95b2070d	! t0_kref+0x1b60:   	fmuld8sux16	%f8, %f13, %f10
	.word	0x22800001	! t0_kref+0x1b64:   	be,a	_kref+0x1b68
	.word	0x99b20055	! t0_kref+0x1b68:   	edge8l	%o0, %l5, %o4
	.word	0x81ac0ad4	! t0_kref+0x1b6c:   	fcmped	%fcc0, %f16, %f20
	.word	0x95a00556	! t0_kref+0x1b70:   	fsqrtd	%f22, %f10
	.word	0xadb60d12	! t0_kref+0x1b74:   	fandnot1	%f24, %f18, %f22
	.word	0xb1a01108	! t0_kref+0x1b78:   	fxtod	%f8, %f24
	.word	0x982dc009	! t0_kref+0x1b7c:   	andn	%l7, %o1, %o4
	.word	0x91a389ca	! t0_kref+0x1b80:   	fdivd	%f14, %f10, %f8
	.word	0xad12401a	! t0_kref+0x1b84:   	taddcctv	%o1, %i2, %l6
	.word	0xef270018	! t0_kref+0x1b88:   	st	%f23, [%i4 + %i0]
	.word	0xac92b12e	! t0_kref+0x1b8c:   	orcc	%o2, -0xed2, %l6
	.word	0xebe8a00e	! t0_kref+0x1b90:   	prefetcha	%g2 + 0xe, 21
	.word	0xec262008	! t0_kref+0x1b94:   	st	%l6, [%i0 + 8]
	.word	0x942b000a	! t0_kref+0x1b98:   	andn	%o4, %o2, %o2
	.word	0xf1be588a	! t0_kref+0x1b9c:   	stda	%f24, [%i1 + %o2]0xc4
	.word	0xb1a60830	! t0_kref+0x1ba0:   	fadds	%f24, %f16, %f24
	.word	0xaba00129	! t0_kref+0x1ba4:   	fabss	%f9, %f21
	.word	0xe180a014	! t0_kref+0x1ba8:   	lda	[%g2 + 0x14]%asi, %f16
	.word	0xac226b02	! t0_kref+0x1bac:   	sub	%o1, 0xb02, %l6
	.word	0x29800001	! t0_kref+0x1bb0:   	fbl,a	_kref+0x1bb4
	.word	0x9db30f8e	! t0_kref+0x1bb4:   	for	%f12, %f14, %f14
	.word	0xa5a01a35	! t0_kref+0x1bb8:   	fstoi	%f21, %f18
	.word	0xa28a0016	! t0_kref+0x1bbc:   	andcc	%o0, %l6, %l1
	.word	0x24800003	! t0_kref+0x1bc0:   	ble,a	_kref+0x1bcc
	.word	0xc96e400a	! t0_kref+0x1bc4:   	prefetch	%i1 + %o2, 4
	.word	0xaba40831	! t0_kref+0x1bc8:   	fadds	%f16, %f17, %f21
	.word	0xe8200018	! t0_kref+0x1bcc:   	st	%l4, [%g0 + %i0]
	.word	0x38800004	! t0_kref+0x1bd0:   	bgu,a	_kref+0x1be0
	.word	0xd11e4000	! t0_kref+0x1bd4:   	ldd	[%i1], %f8
	.word	0xe6480019	! t0_kref+0x1bd8:   	ldsb	[%g0 + %i1], %l3
	.word	0xadb24ee8	! t0_kref+0x1bdc:   	fornot2s	%f9, %f8, %f22
	.word	0x81ae4ab4	! t0_kref+0x1be0:   	fcmpes	%fcc0, %f25, %f20
	.word	0x95a01a39	! t0_kref+0x1be4:   	fstoi	%f25, %f10
	.word	0x8610201f	! t0_kref+0x1be8:   	mov	0x1f, %g3
	.word	0x86a0e001	! t0_kref+0x1bec:   	subcc	%g3, 1, %g3
	.word	0x22800001	! t0_kref+0x1bf0:   	be,a	_kref+0x1bf4
	.word	0xe5260000	! t0_kref+0x1bf4:   	st	%f18, [%i0]
	.word	0x9db30c56	! t0_kref+0x1bf8:   	fnor	%f12, %f22, %f14
	.word	0x912e8015	! t0_kref+0x1bfc:   	sll	%i2, %l5, %o0
	.word	0x94222d04	! t0_kref+0x1c00:   	sub	%o0, 0xd04, %o2
	.word	0x2e800007	! t0_kref+0x1c04:   	bvs,a	_kref+0x1c20
	.word	0xe1200018	! t0_kref+0x1c08:   	st	%f16, [%g0 + %i0]
	.word	0x98950017	! t0_kref+0x1c0c:   	orcc	%l4, %l7, %o4
	.word	0xf1064000	! t0_kref+0x1c10:   	ld	[%i1], %f24
	.word	0x9abb603e	! t0_kref+0x1c14:   	xnorcc	%o5, 0x3e, %o5
	.word	0xa6f80009	! t0_kref+0x1c18:   	sdivcc	%g0, %o1, %l3
	.word	0xd9be1a1a	! t0_kref+0x1c1c:   	stda	%f12, [%i0 + %i2]0xd0
	.word	0x9da3c82e	! t0_kref+0x1c20:   	fadds	%f15, %f14, %f14
	.word	0xeb267ff0	! t0_kref+0x1c24:   	st	%f21, [%i1 - 0x10]
	.word	0xd1be1848	! t0_kref+0x1c28:   	stda	%f8, [%i0 + %o0]0xc2
	.word	0x86102002	! t0_kref+0x1c2c:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x1c30:   	bne,a	_kref+0x1c30
	.word	0x86a0e001	! t0_kref+0x1c34:   	subcc	%g3, 1, %g3
	.word	0xada01048	! t0_kref+0x1c38:   	fdtox	%f8, %f22
	.word	0x9db60d12	! t0_kref+0x1c3c:   	fandnot1	%f24, %f18, %f14
	.word	0x9f282012	! t0_kref+0x1c40:   	sll	%g0, 0x12, %o7
	.word	0xac2d400d	! t0_kref+0x1c44:   	andn	%l5, %o5, %l6
	.word	0x94c2bd39	! t0_kref+0x1c48:   	addccc	%o2, -0x2c7, %o2
	.word	0xd9be1896	! t0_kref+0x1c4c:   	stda	%f12, [%i0 + %l6]0xc4
	.word	0xdec8a020	! t0_kref+0x1c50:   	ldsba	[%g2 + 0x20]%asi, %o7
	.word	0xd6563ff2	! t0_kref+0x1c54:   	ldsh	[%i0 - 0xe], %o3
	.word	0xe248a014	! t0_kref+0x1c58:   	ldsb	[%g2 + 0x14], %l1
	.word	0xa6f3000c	! t0_kref+0x1c5c:   	udivcc	%o4, %o4, %l3
	.word	0x969eef83	! t0_kref+0x1c60:   	xorcc	%i3, 0xf83, %o3
	.word	0xc3e8a04f	! t0_kref+0x1c64:   	prefetcha	%g2 + 0x4f, 1
	.word	0x96823ad9	! t0_kref+0x1c68:   	addcc	%o0, -0x527, %o3
	.word	0xa3b3cdea	! t0_kref+0x1c6c:   	fnands	%f15, %f10, %f17
	.word	0xd2166016	! t0_kref+0x1c70:   	lduh	[%i1 + 0x16], %o1
	.word	0x923a4017	! t0_kref+0x1c74:   	xnor	%o1, %l7, %o1
	.word	0x9e2a400b	! t0_kref+0x1c78:   	andn	%o1, %o3, %o7
	.word	0xa2b5800b	! t0_kref+0x1c7c:   	orncc	%l6, %o3, %l1
	.word	0x81acca2c	! t0_kref+0x1c80:   	fcmps	%fcc0, %f19, %f12
	.word	0xa4bde6db	! t0_kref+0x1c84:   	xnorcc	%l7, 0x6db, %l2
	.word	0x9a2dc017	! t0_kref+0x1c88:   	andn	%l7, %l7, %o5
	.word	0xf430a004	! t0_kref+0x1c8c:   	sth	%i2, [%g2 + 4]
	.word	0xe81e6000	! t0_kref+0x1c90:   	ldd	[%i1], %l4
	.word	0xa40ec009	! t0_kref+0x1c94:   	and	%i3, %o1, %l2
	.word	0xa9a01a56	! t0_kref+0x1c98:   	fdtoi	%f22, %f20
	.word	0xada00139	! t0_kref+0x1c9c:   	fabss	%f25, %f22
	.word	0x39480003	! t0_kref+0x1ca0:   	fbuge,a,pt	%fcc0, _kref+0x1cac
	.word	0xa0b5c017	! t0_kref+0x1ca4:   	orncc	%l7, %l7, %l0
	.word	0x9ebac015	! t0_kref+0x1ca8:   	xnorcc	%o3, %l5, %o7
	.word	0xa5b20e70	! t0_kref+0x1cac:   	fxnors	%f8, %f16, %f18
	.word	0x97a01a32	! t0_kref+0x1cb0:   	fstoi	%f18, %f11
	.word	0x95a01a2a	! t0_kref+0x1cb4:   	fstoi	%f10, %f10
	.word	0xeaa8a032	! t0_kref+0x1cb8:   	stba	%l5, [%g2 + 0x32]%asi
	.word	0x99b38990	! t0_kref+0x1cbc:   	bshuffle	%f14, %f16, %f12
	.word	0x2e480005	! t0_kref+0x1cc0:   	bvs,a,pt	%icc, _kref+0x1cd4
	.word	0xa1b00f32	! t0_kref+0x1cc4:   	fsrc2s	%f18, %f16
	.word	0xd4066018	! t0_kref+0x1cc8:   	ld	[%i1 + 0x18], %o2
	.word	0xadb304d2	! t0_kref+0x1ccc:   	fcmpne32	%f12, %f18, %l6
	.word	0xa9a508ab	! t0_kref+0x1cd0:   	fsubs	%f20, %f11, %f20
	.word	0xa92ae019	! t0_kref+0x1cd4:   	sll	%o3, 0x19, %l4
	.word	0x91a00548	! t0_kref+0x1cd8:   	fsqrtd	%f8, %f8
	.word	0xf620a01c	! t0_kref+0x1cdc:   	st	%i3, [%g2 + 0x1c]
	.word	0x131986fd	! t0_kref+0x1ce0:   	sethi	%hi(0x661bf400), %o1
	.word	0xe808a00a	! t0_kref+0x1ce4:   	ldub	[%g2 + 0xa], %l4
	call	1f
	.empty
	.word	0xe9866000	! t0_kref+0x1cec:   	lda	[%i1]%asi, %f20
	.word	0xd0080019	! t0_kref+0x1cf0:   	ldub	[%g0 + %i1], %o0
	.word	0xe8a81018	! t0_kref+0x1cf4:   	stba	%l4, [%g0 + %i0]0x80
	.word	0xa1a0110c	! t0_kref+0x1cf8:   	fxtod	%f12, %f16
	.word	0xda300019	! t0_kref+0x1cfc:   	sth	%o5, [%g0 + %i1]
	.word	0xe11e401d	! t0_kref+0x1d00:   	ldd	[%i1 + %i5], %f16
	.word	0x95b3ccb6	! t0_kref+0x1d04:   	fandnot2s	%f15, %f22, %f10
	.word	0x3e480008	! t0_kref+0x1d08:   	bvc,a,pt	%icc, _kref+0x1d28
1:	.word	0xa72ae015	! t0_kref+0x1d0c:   	sll	%o3, 0x15, %l3
	.word	0xa4ad3bb4	! t0_kref+0x1d10:   	andncc	%l4, -0x44c, %l2
	.word	0x9563c01b	! t0_kref+0x1d14:   	movo	%fcc0, %i3, %o2
	.word	0x81ad4a2a	! t0_kref+0x1d18:   	fcmps	%fcc0, %f21, %f10
	.word	0x81580000	! t0_kref+0x1d1c:   	flushw
	.word	0x981338af	! t0_kref+0x1d20:   	or	%o4, -0x751, %o4
	.word	0xa7a5c9b8	! t0_kref+0x1d24:   	fdivs	%f23, %f24, %f19
	.word	0xa2adbb4f	! t0_kref+0x1d28:   	andncc	%l6, -0x4b1, %l1
	.word	0x9012fa30	! t0_kref+0x1d2c:   	or	%o3, -0x5d0, %o0
	.word	0x8143c000	! t0_kref+0x1d30:   	stbar
	.word	0x9165a2f7	! t0_kref+0x1d34:   	movneg	%icc, 0x2f7, %o0
	.word	0x99b58356	! t0_kref+0x1d38:   	alignaddrl	%l6, %l6, %o4
	.word	0xeec8a02a	! t0_kref+0x1d3c:   	ldsba	[%g2 + 0x2a]%asi, %l7
	.word	0xa7a0188d	! t0_kref+0x1d40:   	fitos	%f13, %f19
	.word	0x81dbc01a	! t0_kref+0x1d44:   	flush	%o7 + %i2
	.word	0xb1b387ca	! t0_kref+0x1d48:   	pdist	%f14, %f10, %f24
	.word	0x9e3a401a	! t0_kref+0x1d4c:   	xnor	%o1, %i2, %o7
	.word	0xda366018	! t0_kref+0x1d50:   	sth	%o5, [%i1 + 0x18]
	.word	0xa5a01938	! t0_kref+0x1d54:   	fstod	%f24, %f18
	.word	0xb1b54a69	! t0_kref+0x1d58:   	fpadd32s	%f21, %f9, %f24
	.word	0x9fc10000	! t0_kref+0x1d5c:   	call	%g4
	.word	0x1936a82e	! t0_kref+0x1d60:   	sethi	%hi(0xdaa0b800), %o4
	.word	0x2d3ea141	! t0_kref+0x1d64:   	sethi	%hi(0xfa850400), %l6
	.word	0xc02e0000	! t0_kref+0x1d68:   	clrb	[%i0]
	.word	0xe9f6100a	! t0_kref+0x1d6c:   	casxa	[%i0]0x80, %o2, %l4
	.word	0xada0052b	! t0_kref+0x1d70:   	fsqrts	%f11, %f22
	.word	0x9232b4ca	! t0_kref+0x1d74:   	orn	%o2, -0xb36, %o1
	.word	0xada01931	! t0_kref+0x1d78:   	fstod	%f17, %f22
	.word	0x99400000	! t0_kref+0x1d7c:   	mov	%y, %o4
	.word	0xa78235e0	! t0_kref+0x1d80:   	wr	%o0, 0xfffff5e0, %gsr
	.word	0xada01a4e	! t0_kref+0x1d84:   	fdtoi	%f14, %f22
	.word	0x92fd8014	! t0_kref+0x1d88:   	sdivcc	%l6, %l4, %o1
	.word	0x20800001	! t0_kref+0x1d8c:   	bn,a	_kref+0x1d90
	.word	0x81b01021	! t0_kref+0x1d90:   	siam	0x1
	.word	0xe5070019	! t0_kref+0x1d94:   	ld	[%i4 + %i1], %f18
	.word	0x81abca38	! t0_kref+0x1d98:   	fcmps	%fcc0, %f15, %f24
	.word	0x99b38638	! t0_kref+0x1d9c:   	fmul8x16	%f14, %f24, %f12
	.word	0x932d401a	! t0_kref+0x1da0:   	sll	%l5, %i2, %o1
	.word	0xb1b58a8e	! t0_kref+0x1da4:   	fpsub16	%f22, %f14, %f24
	.word	0xa8c20008	! t0_kref+0x1da8:   	addccc	%o0, %o0, %l4
	.word	0xad26f5d4	! t0_kref+0x1dac:   	mulscc	%i3, -0xa2c, %l6
	.word	0x81868000	! t0_kref+0x1db0:   	wr	%i2, %g0, %y
	.word	0xaa0df980	! t0_kref+0x1db4:   	and	%l7, -0x680, %l5
	.word	0xa4b37425	! t0_kref+0x1db8:   	orncc	%o5, -0xbdb, %l2
	.word	0xc56e6010	! t0_kref+0x1dbc:   	prefetch	%i1 + 0x10, 2
	.word	0xadb584c8	! t0_kref+0x1dc0:   	fcmpne32	%f22, %f8, %l6
	.word	0xea362000	! t0_kref+0x1dc4:   	sth	%l5, [%i0]
	.word	0x96f2c008	! t0_kref+0x1dc8:   	udivcc	%o3, %o0, %o3
	.word	0x91a00558	! t0_kref+0x1dcc:   	fsqrtd	%f24, %f8
	.word	0xac3a68af	! t0_kref+0x1dd0:   	xnor	%o1, 0x8af, %l6
	.word	0x9da0110c	! t0_kref+0x1dd4:   	fxtod	%f12, %f14
	.word	0xacfebd4b	! t0_kref+0x1dd8:   	sdivcc	%i2, -0x2b5, %l6
	.word	0x81ac4ab8	! t0_kref+0x1ddc:   	fcmpes	%fcc0, %f17, %f24
	.word	0xada0002a	! t0_kref+0x1de0:   	fmovs	%f10, %f22
	.word	0xa7b5c116	! t0_kref+0x1de4:   	edge32	%l7, %l6, %l3
	.word	0xa7852b45	! t0_kref+0x1de8:   	wr	%l4, 0xb45, %gsr
	.word	0xb1a01888	! t0_kref+0x1dec:   	fitos	%f8, %f24
	.word	0xe16e3ff0	! t0_kref+0x1df0:   	prefetch	%i0 - 0x10, 16
	.word	0xd40e8019	! t0_kref+0x1df4:   	ldub	[%i2 + %i1], %o2
	.word	0xd62e7feb	! t0_kref+0x1df8:   	stb	%o3, [%i1 - 0x15]
	.word	0x9ba01a37	! t0_kref+0x1dfc:   	fstoi	%f23, %f13
	.word	0x9de3bfa0	! t0_kref+0x1e00:   	save	%sp, -0x60, %sp
	.word	0xb42ec000	! t0_kref+0x1e04:   	andn	%i3, %g0, %i2
	.word	0x91eec018	! t0_kref+0x1e08:   	restore	%i3, %i0, %o0
	.word	0xd2c0a018	! t0_kref+0x1e0c:   	ldswa	[%g2 + 0x18]%asi, %o1
	.word	0x9636f537	! t0_kref+0x1e10:   	orn	%i3, -0xac9, %o3
	.word	0xa5a0192a	! t0_kref+0x1e14:   	fstod	%f10, %f18
	.word	0x81acca34	! t0_kref+0x1e18:   	fcmps	%fcc0, %f19, %f20
	.word	0xe040a01c	! t0_kref+0x1e1c:   	ldsw	[%g2 + 0x1c], %l0
	.word	0xc16e2010	! t0_kref+0x1e20:   	prefetch	%i0 + 0x10, 0
	.word	0x908ef1db	! t0_kref+0x1e24:   	andcc	%i3, -0xe25, %o0
	.word	0xa5a309d4	! t0_kref+0x1e28:   	fdivd	%f12, %f20, %f18
	.word	0x95b58492	! t0_kref+0x1e2c:   	fcmple32	%f22, %f18, %o2
	.word	0xedee101a	! t0_kref+0x1e30:   	prefetcha	%i0 + %i2, 22
	.word	0xd84e7fea	! t0_kref+0x1e34:   	ldsb	[%i1 - 0x16], %o4
	.word	0x93418000	! t0_kref+0x1e38:   	mov	%fprs, %o1
	.word	0x91a01929	! t0_kref+0x1e3c:   	fstod	%f9, %f8
	.word	0x81aacab8	! t0_kref+0x1e40:   	fcmpes	%fcc0, %f11, %f24
	.word	0xad2de00d	! t0_kref+0x1e44:   	sll	%l7, 0xd, %l6
	.word	0xa9a00558	! t0_kref+0x1e48:   	fsqrtd	%f24, %f20
	.word	0xe056200c	! t0_kref+0x1e4c:   	ldsh	[%i0 + 0xc], %l0
	.word	0xac0ebf9d	! t0_kref+0x1e50:   	and	%i2, -0x63, %l6
	.word	0x9db20a0a	! t0_kref+0x1e54:   	fpadd16	%f8, %f10, %f14
	.word	0xa1b48e6c	! t0_kref+0x1e58:   	fxnors	%f18, %f12, %f16
	call	SYM(t0_subr1)
	.word	0x95a0054c	! t0_kref+0x1e60:   	fsqrtd	%f12, %f10
	.word	0xe5981018	! t0_kref+0x1e64:   	ldda	[%g0 + %i0]0x80, %f18
	.word	0xc568a04d	! t0_kref+0x1e68:   	prefetch	%g2 + 0x4d, 2
	.word	0x9fa3c8b9	! t0_kref+0x1e6c:   	fsubs	%f15, %f25, %f15
	.word	0xd51fbfd8	! t0_kref+0x1e70:   	ldd	[%fp - 0x28], %f10
	.word	0xd1be9a18	! t0_kref+0x1e74:   	stda	%f8, [%i2 + %i0]0xd0
	.word	0xa5b507ce	! t0_kref+0x1e78:   	pdist	%f20, %f14, %f18
	.word	0xb1a0054c	! t0_kref+0x1e7c:   	fsqrtd	%f12, %f24
	.word	0xe8a63fec	! t0_kref+0x1e80:   	sta	%l4, [%i0 - 0x14]%asi
	.word	0xd6200018	! t0_kref+0x1e84:   	st	%o3, [%g0 + %i0]
	.word	0xe828a006	! t0_kref+0x1e88:   	stb	%l4, [%g2 + 6]
	.word	0x9db40c88	! t0_kref+0x1e8c:   	fandnot2	%f16, %f8, %f14
	.word	0xea067ff4	! t0_kref+0x1e90:   	ld	[%i1 - 0xc], %l5
	.word	0x8143e040	! t0_kref+0x1e94:   	membar	0x40
	.word	0xa0f5800d	! t0_kref+0x1e98:   	udivcc	%l6, %o5, %l0
	.word	0xa5a00032	! t0_kref+0x1e9c:   	fmovs	%f18, %f18
	.word	0xc5e8a04a	! t0_kref+0x1ea0:   	prefetcha	%g2 + 0x4a, 2
	.word	0x21800005	! t0_kref+0x1ea4:   	fbn,a	_kref+0x1eb8
	.word	0xd6480018	! t0_kref+0x1ea8:   	ldsb	[%g0 + %i0], %o3
	.word	0x9db58c48	! t0_kref+0x1eac:   	fnor	%f22, %f8, %f14
	.word	0x27800001	! t0_kref+0x1eb0:   	fbul,a	_kref+0x1eb4
	.word	0xa9a01a37	! t0_kref+0x1eb4:   	fstoi	%f23, %f20
	.word	0x3c800005	! t0_kref+0x1eb8:   	bpos,a	_kref+0x1ecc
	.word	0xf1267fe4	! t0_kref+0x1ebc:   	st	%f24, [%i1 - 0x1c]
	.word	0x91a00139	! t0_kref+0x1ec0:   	fabss	%f25, %f8
	.word	0xa7b300cc	! t0_kref+0x1ec4:   	edge16l	%o4, %o4, %l3
	.word	0x22480002	! t0_kref+0x1ec8:   	be,a,pt	%icc, _kref+0x1ed0
	.word	0xa5b587d4	! t0_kref+0x1ecc:   	pdist	%f22, %f20, %f18
	.word	0xae432e6e	! t0_kref+0x1ed0:   	addc	%o4, 0xe6e, %l7
	.word	0x97b68077	! t0_kref+0x1ed4:   	edge8ln	%i2, %l7, %o3
	.word	0x99b48cb6	! t0_kref+0x1ed8:   	fandnot2s	%f18, %f22, %f12
	.word	0x94130017	! t0_kref+0x1edc:   	or	%o4, %l7, %o2
	.word	0xa9a00139	! t0_kref+0x1ee0:   	fabss	%f25, %f20
	.word	0x9bb2805a	! t0_kref+0x1ee4:   	edge8l	%o2, %i2, %o5
	.word	0x9de3bfa0	! t0_kref+0x1ee8:   	save	%sp, -0x60, %sp
	.word	0x99ef001b	! t0_kref+0x1eec:   	restore	%i4, %i3, %o4
	.word	0x97b54f77	! t0_kref+0x1ef0:   	fornot1s	%f21, %f23, %f11
	.word	0xf428a003	! t0_kref+0x1ef4:   	stb	%i2, [%g2 + 3]
	.word	0xd13e2018	! t0_kref+0x1ef8:   	std	%f8, [%i0 + 0x18]
	.word	0xa5a00539	! t0_kref+0x1efc:   	fsqrts	%f25, %f18
	.word	0x81daf920	! t0_kref+0x1f00:   	flush	%o3 - 0x6e0
	.word	0x9fa00132	! t0_kref+0x1f04:   	fabss	%f18, %f15
	.word	0x36800001	! t0_kref+0x1f08:   	bge,a	_kref+0x1f0c
	.word	0xd6a8a019	! t0_kref+0x1f0c:   	stba	%o3, [%g2 + 0x19]%asi
	.word	0xd9a01019	! t0_kref+0x1f10:   	sta	%f12, [%g0 + %i1]0x80
	.word	0xc568a040	! t0_kref+0x1f14:   	prefetch	%g2 + 0x40, 2
	.word	0x81820000	! t0_kref+0x1f18:   	wr	%o0, %g0, %y
	.word	0xa3b3ceed	! t0_kref+0x1f1c:   	fornot2s	%f15, %f13, %f17
	.word	0xa9a48d39	! t0_kref+0x1f20:   	fsmuld	%f18, %f25, %f20
	.word	0xecc67ff4	! t0_kref+0x1f24:   	ldswa	[%i1 - 0xc]%asi, %l6
	.word	0xae9e8008	! t0_kref+0x1f28:   	xorcc	%i2, %o0, %l7
	.word	0x8143c000	! t0_kref+0x1f2c:   	stbar
	.word	0xa296b4e7	! t0_kref+0x1f30:   	orcc	%i2, -0xb19, %l1
	.word	0x8585400b	! t0_kref+0x1f34:   	wr	%l5, %o3, %ccr
	.word	0x81aacaad	! t0_kref+0x1f38:   	fcmpes	%fcc0, %f11, %f13
	.word	0xea26401c	! t0_kref+0x1f3c:   	st	%l5, [%i1 + %i4]
	.word	0xae0dc00a	! t0_kref+0x1f40:   	and	%l7, %o2, %l7
	.word	0xe5070018	! t0_kref+0x1f44:   	ld	[%i4 + %i0], %f18
	.word	0x99a2c8b5	! t0_kref+0x1f48:   	fsubs	%f11, %f21, %f12
	.word	0xec40a030	! t0_kref+0x1f4c:   	ldsw	[%g2 + 0x30], %l6
	.word	0xa5a289ac	! t0_kref+0x1f50:   	fdivs	%f10, %f12, %f18
	.word	0x98f274bd	! t0_kref+0x1f54:   	udivcc	%o1, -0xb43, %o4
	.word	0xaa828016	! t0_kref+0x1f58:   	addcc	%o2, %l6, %l5
	.word	0xa32a0016	! t0_kref+0x1f5c:   	sll	%o0, %l6, %l1
	.word	0xda000019	! t0_kref+0x1f60:   	ld	[%g0 + %i1], %o5
	.word	0xa7a649b1	! t0_kref+0x1f64:   	fdivs	%f25, %f17, %f19
	.word	0x94352072	! t0_kref+0x1f68:   	orn	%l4, 0x72, %o2
	.word	0x9255688b	! t0_kref+0x1f6c:   	umul	%l5, 0x88b, %o1
	.word	0xf5206f56	! t0_kref+0x1f70:   	st	%f26, [%g1 + 0xf56]
	.word	0xea28a034	! t0_kref+0x1f74:   	stb	%l5, [%g2 + 0x34]
	.word	0xd91e6018	! t0_kref+0x1f78:   	ldd	[%i1 + 0x18], %f12
	.word	0xd1be1848	! t0_kref+0x1f7c:   	stda	%f8, [%i0 + %o0]0xc2
	.word	0xc0196598	! t0_kref+0x1f80:   	ldd	[%g5 + 0x598], %g0
	.word	0xe100a038	! t0_kref+0x1f84:   	ld	[%g2 + 0x38], %f16
	.word	0x9da0012d	! t0_kref+0x1f88:   	fabss	%f13, %f14
	.word	0xe8266000	! t0_kref+0x1f8c:   	st	%l4, [%i1]
	.word	0xd07e2014	! t0_kref+0x1f90:   	swap	[%i0 + 0x14], %o0
	.word	0x97a00033	! t0_kref+0x1f94:   	fmovs	%f19, %f11
	.word	0xa9a00552	! t0_kref+0x1f98:   	fsqrtd	%f18, %f20
	.word	0xa9a018d2	! t0_kref+0x1f9c:   	fdtos	%f18, %f20
	.word	0x95408000	! t0_kref+0x1fa0:   	mov	%ccr, %o2
	.word	0x982ec000	! t0_kref+0x1fa4:   	andn	%i3, %g0, %o4
	.word	0xa3a01a30	! t0_kref+0x1fa8:   	fstoi	%f16, %f17
	.word	0xd42e8019	! t0_kref+0x1fac:   	stb	%o2, [%i2 + %i1]
	.word	0xe180a034	! t0_kref+0x1fb0:   	lda	[%g2 + 0x34]%asi, %f16
	.word	0xaba018ce	! t0_kref+0x1fb4:   	fdtos	%f14, %f21
	.word	0x8143e040	! t0_kref+0x1fb8:   	membar	0x40
	.word	0xe290a036	! t0_kref+0x1fbc:   	lduha	[%g2 + 0x36]%asi, %l1
	.word	0x2b800001	! t0_kref+0x1fc0:   	fbug,a	_kref+0x1fc4
	.word	0xeaae7fff	! t0_kref+0x1fc4:   	stba	%l5, [%i1 - 1]%asi
	.word	0xe9be5a1b	! t0_kref+0x1fc8:   	stda	%f20, [%i1 + %i3]0xd0
	.word	0xada01911	! t0_kref+0x1fcc:   	fitod	%f17, %f22
	.word	0xaec68000	! t0_kref+0x1fd0:   	addccc	%i2, %g0, %l7
	.word	0x99b60eeb	! t0_kref+0x1fd4:   	fornot2s	%f24, %f11, %f12
	.word	0xee36c019	! t0_kref+0x1fd8:   	sth	%l7, [%i3 + %i1]
	.word	0xd100a01c	! t0_kref+0x1fdc:   	ld	[%g2 + 0x1c], %f8
	.word	0xacfdc015	! t0_kref+0x1fe0:   	sdivcc	%l7, %l5, %l6
	.word	0x81ad4ab6	! t0_kref+0x1fe4:   	fcmpes	%fcc0, %f21, %f22
	.word	0xe4d0a034	! t0_kref+0x1fe8:   	ldsha	[%g2 + 0x34]%asi, %l2
	.word	0xe49e501d	! t0_kref+0x1fec:   	ldda	[%i1 + %i5]0x80, %l2
	.word	0xaa32401a	! t0_kref+0x1ff0:   	orn	%o1, %i2, %l5
	.word	0xb1a01a4a	! t0_kref+0x1ff4:   	fdtoi	%f10, %f24
	.word	0x99b38c56	! t0_kref+0x1ff8:   	fnor	%f14, %f22, %f12
	.word	0xd656c019	! t0_kref+0x1ffc:   	ldsh	[%i3 + %i1], %o3
	.word	0x99b58408	! t0_kref+0x2000:   	fcmple16	%f22, %f8, %o4
	.word	0x1903615a	! t0_kref+0x2004:   	sethi	%hi(0xd856800), %o4
	.word	0x2f800004	! t0_kref+0x2008:   	fbu,a	_kref+0x2018
	.word	0x9fb20d2b	! t0_kref+0x200c:   	fandnot1s	%f8, %f11, %f15
	.word	0x96f54008	! t0_kref+0x2010:   	udivcc	%l5, %o0, %o3
	.word	0x81ac8ad4	! t0_kref+0x2014:   	fcmped	%fcc0, %f18, %f20
	.word	0x9fc00004	! t0_kref+0x2018:   	call	%g0 + %g4
	.word	0xb1b20a8a	! t0_kref+0x201c:   	fpsub16	%f8, %f10, %f24
	.word	0xb1a00132	! t0_kref+0x2020:   	fabss	%f18, %f24
	.word	0x9db5ce6d	! t0_kref+0x2024:   	fxnors	%f23, %f13, %f14
	.word	0x26480006	! t0_kref+0x2028:   	bl,a,pt	%icc, _kref+0x2040
	.word	0xc9ee100a	! t0_kref+0x202c:   	prefetcha	%i0 + %o2, 4
	.word	0xd6063fe4	! t0_kref+0x2030:   	ld	[%i0 - 0x1c], %o3
	.word	0xa5a509b1	! t0_kref+0x2034:   	fdivs	%f20, %f17, %f18
	.word	0x91a00556	! t0_kref+0x2038:   	fsqrtd	%f22, %f8
	.word	0x97a01a32	! t0_kref+0x203c:   	fstoi	%f18, %f11
	.word	0xe9070019	! t0_kref+0x2040:   	ld	[%i4 + %i1], %f20
	.word	0xf4be6010	! t0_kref+0x2044:   	stda	%i2, [%i1 + 0x10]%asi
	.word	0xd0d81019	! t0_kref+0x2048:   	ldxa	[%g0 + %i1]0x80, %o0
	.word	0xc700611e	! t0_kref+0x204c:   	ld	[%g1 + 0x11e], %f3
	.word	0xb1a01a50	! t0_kref+0x2050:   	fdtoi	%f16, %f24
	.word	0xe41f4018	! t0_kref+0x2054:   	ldd	[%i5 + %i0], %l2
	.word	0x92100009	! t0_kref+0x2058:   	mov	%o1, %o1
	.word	0xe93f4019	! t0_kref+0x205c:   	std	%f20, [%i5 + %i1]
	.word	0x33800005	! t0_kref+0x2060:   	fbe,a	_kref+0x2074
	.word	0xb1a609ca	! t0_kref+0x2064:   	fdivd	%f24, %f10, %f24
	.word	0x93a24828	! t0_kref+0x2068:   	fadds	%f9, %f8, %f9
	.word	0x3a480008	! t0_kref+0x206c:   	bcc,a,pt	%icc, _kref+0x208c
	.word	0xe51f4019	! t0_kref+0x2070:   	ldd	[%i5 + %i1], %f18
	.word	0x81ac0ace	! t0_kref+0x2074:   	fcmped	%fcc0, %f16, %f14
	.word	0xe210a02c	! t0_kref+0x2078:   	lduh	[%g2 + 0x2c], %l1
	.word	0x99a018d4	! t0_kref+0x207c:   	fdtos	%f20, %f12
	.word	0x9da0002b	! t0_kref+0x2080:   	fmovs	%f11, %f14
	.word	0x94532867	! t0_kref+0x2084:   	umul	%o4, 0x867, %o2
	.word	0xee6e3fe4	! t0_kref+0x2088:   	ldstub	[%i0 - 0x1c], %l7
	.word	0xde162010	! t0_kref+0x208c:   	lduh	[%i0 + 0x10], %o7
	.word	0x152479ca	! t0_kref+0x2090:   	sethi	%hi(0x91e72800), %o2
	.word	0xac056999	! t0_kref+0x2094:   	add	%l5, 0x999, %l6
	.word	0xf3266000	! t0_kref+0x2098:   	st	%f25, [%i1]
	.word	0xc807bfec	! t0_kref+0x209c:   	ld	[%fp - 0x14], %g4
	.word	0x33800001	! t0_kref+0x20a0:   	fbe,a	_kref+0x20a4
	.word	0x2b2acc01	! t0_kref+0x20a4:   	sethi	%hi(0xab300400), %l5
	.word	0x81ad0aaa	! t0_kref+0x20a8:   	fcmpes	%fcc0, %f20, %f10
	.word	0xafa00036	! t0_kref+0x20ac:   	fmovs	%f22, %f23
	.word	0x980038a5	! t0_kref+0x20b0:   	add	%g0, -0x75b, %o4
	.word	0xd64e0000	! t0_kref+0x20b4:   	ldsb	[%i0], %o3
	.word	0xe81e6000	! t0_kref+0x20b8:   	ldd	[%i1], %l4
	.word	0xd93e6000	! t0_kref+0x20bc:   	std	%f12, [%i1]
	.word	0xd288a024	! t0_kref+0x20c0:   	lduba	[%g2 + 0x24]%asi, %o1
	.word	0x99b284c8	! t0_kref+0x20c4:   	fcmpne32	%f10, %f8, %o4
	.word	0xe41e2010	! t0_kref+0x20c8:   	ldd	[%i0 + 0x10], %l2
	.word	0xa7a01a56	! t0_kref+0x20cc:   	fdtoi	%f22, %f19
	.word	0x150780a9	! t0_kref+0x20d0:   	sethi	%hi(0x1e02a400), %o2
	.word	0x20800001	! t0_kref+0x20d4:   	bn,a	_kref+0x20d8
	.word	0xf36e001b	! t0_kref+0x20d8:   	prefetch	%i0 + %i3, 25
	.word	0x99b5ce28	! t0_kref+0x20dc:   	fands	%f23, %f8, %f12
	.word	0x992d8000	! t0_kref+0x20e0:   	sll	%l6, %g0, %o4
	.word	0xdf070019	! t0_kref+0x20e4:   	ld	[%i4 + %i1], %f15
	.word	0xa00b6cf6	! t0_kref+0x20e8:   	and	%o5, 0xcf6, %l0
	.word	0xb1b58c76	! t0_kref+0x20ec:   	fnors	%f22, %f22, %f24
	.word	0x91a0188e	! t0_kref+0x20f0:   	fitos	%f14, %f8
	.word	0xd780a010	! t0_kref+0x20f4:   	lda	[%g2 + 0x10]%asi, %f11
	.word	0xaa8dc00d	! t0_kref+0x20f8:   	andcc	%l7, %o5, %l5
	.word	0xee6e7fed	! t0_kref+0x20fc:   	ldstub	[%i1 - 0x13], %l7
	.word	0xe0f81018	! t0_kref+0x2100:   	swapa	[%g0 + %i0]0x80, %l0
	.word	0x95a00552	! t0_kref+0x2104:   	fsqrtd	%f18, %f10
	.word	0x95a4cd36	! t0_kref+0x2108:   	fsmuld	%f19, %f22, %f10
	.word	0x34480004	! t0_kref+0x210c:   	bg,a,pt	%icc, _kref+0x211c
	.word	0xa246be91	! t0_kref+0x2110:   	addc	%i2, -0x16f, %l1
	.word	0x9fc10000	! t0_kref+0x2114:   	call	%g4
	.word	0xe180a014	! t0_kref+0x2118:   	lda	[%g2 + 0x14]%asi, %f16
	.word	0x86102021	! t0_kref+0x211c:   	mov	0x21, %g3
	.word	0x86a0e001	! t0_kref+0x2120:   	subcc	%g3, 1, %g3
	.word	0x22800002	! t0_kref+0x2124:   	be,a	_kref+0x212c
	.word	0xd93e3fe0	! t0_kref+0x2128:   	std	%f12, [%i0 - 0x20]
	.word	0xed270018	! t0_kref+0x212c:   	st	%f22, [%i4 + %i0]
	.word	0x9a25400c	! t0_kref+0x2130:   	sub	%l5, %o4, %o5
	.word	0x001fffff	! t0_kref+0x2134:   	illtrap	0x1fffff
	.word	0xafb5c06c	! t0_kref+0x2138:   	edge8ln	%l7, %o4, %l7
	.word	0xe6066014	! t0_kref+0x213c:   	ld	[%i1 + 0x14], %l3
	.word	0xfb6e401a	! t0_kref+0x2140:   	prefetch	%i1 + %i2, 29
	.word	0xa69ec01a	! t0_kref+0x2144:   	xorcc	%i3, %i2, %l3
	.word	0xad62e2d6	! t0_kref+0x2148:   	movge	%fcc0, 0x2d6, %l6
	.word	0x8143c000	! t0_kref+0x214c:   	stbar
	.word	0xa5a01888	! t0_kref+0x2150:   	fitos	%f8, %f18
	.word	0xa69b71e2	! t0_kref+0x2154:   	xorcc	%o5, -0xe1e, %l3
	.word	0x94b80014	! t0_kref+0x2158:   	xnorcc	%g0, %l4, %o2
	.word	0xa1b0031b	! t0_kref+0x215c:   	alignaddr	%g0, %i3, %l0
	.word	0x8143c000	! t0_kref+0x2160:   	stbar
	.word	0xa292720a	! t0_kref+0x2164:   	orcc	%o1, -0xdf6, %l1
	.word	0x93a00128	! t0_kref+0x2168:   	fabss	%f8, %f9
	.word	0xe106001c	! t0_kref+0x216c:   	ld	[%i0 + %i4], %f16
	.word	0x9da0104a	! t0_kref+0x2170:   	fdtox	%f10, %f14
	.word	0x99a0002a	! t0_kref+0x2174:   	fmovs	%f10, %f12
	.word	0xa3b40410	! t0_kref+0x2178:   	fcmple16	%f16, %f16, %l1
	.word	0xa5a60d29	! t0_kref+0x217c:   	fsmuld	%f24, %f9, %f18
	.word	0xe968a08a	! t0_kref+0x2180:   	prefetch	%g2 + 0x8a, 20
	.word	0xa1a01029	! t0_kref+0x2184:   	fstox	%f9, %f16
	.word	0xa8ae8015	! t0_kref+0x2188:   	andncc	%i2, %l5, %l4
	.word	0x81ad0ace	! t0_kref+0x218c:   	fcmped	%fcc0, %f20, %f14
	.word	0xa412800a	! t0_kref+0x2190:   	or	%o2, %o2, %l2
	.word	0xab120000	! t0_kref+0x2194:   	taddcctv	%o0, %g0, %l5
	.word	0xb1b40f8c	! t0_kref+0x2198:   	for	%f16, %f12, %f24
	.word	0xd600a010	! t0_kref+0x219c:   	ld	[%g2 + 0x10], %o3
	.word	0xa9b40d0a	! t0_kref+0x21a0:   	fandnot1	%f16, %f10, %f20
	.word	0xc12e2014	! t0_kref+0x21a4:   	st	%fsr, [%i0 + 0x14]
	.word	0x95b5c240	! t0_kref+0x21a8:   	array16	%l7, %g0, %o2
	.word	0x81ac4ab8	! t0_kref+0x21ac:   	fcmpes	%fcc0, %f17, %f24
	.word	0x9bb64a2e	! t0_kref+0x21b0:   	fpadd16s	%f25, %f14, %f13
	.word	0xada60d29	! t0_kref+0x21b4:   	fsmuld	%f24, %f9, %f22
	.word	0x32480007	! t0_kref+0x21b8:   	bne,a,pt	%icc, _kref+0x21d4
	.word	0xd4f67fe0	! t0_kref+0x21bc:   	stxa	%o2, [%i1 - 0x20]%asi
	.word	0xe43835f0	! t0_kref+0x21c0:   	std	%l2, [%g0 - 0xa10]
	.word	0xaf12f62d	! t0_kref+0x21c4:   	taddcctv	%o3, -0x9d3, %l7
	.word	0x32480003	! t0_kref+0x21c8:   	bne,a,pt	%icc, _kref+0x21d4
	.word	0xad64e046	! t0_kref+0x21cc:   	movl	%icc, 0x46, %l6
	.word	0x2b480003	! t0_kref+0x21d0:   	fbug,a,pt	%fcc0, _kref+0x21dc
	.word	0xf656c005	! t0_kref+0x21d4:   	ldsh	[%i3 + %g5], %i3
	.word	0xada00558	! t0_kref+0x21d8:   	fsqrtd	%f24, %f22
	.word	0x878020e0	! t0_kref+0x21dc:   	mov	0xe0, %asi
	.word	0xe64e8019	! t0_kref+0x21e0:   	ldsb	[%i2 + %i1], %l3
	.word	0x81850000	! t0_kref+0x21e4:   	wr	%l4, %g0, %y
	.word	0xea08a039	! t0_kref+0x21e8:   	ldub	[%g2 + 0x39], %l5
	.word	0xaba00034	! t0_kref+0x21ec:   	fmovs	%f20, %f21
	.word	0xafa018d0	! t0_kref+0x21f0:   	fdtos	%f16, %f23
	.word	0xe5063fec	! t0_kref+0x21f4:   	ld	[%i0 - 0x14], %f18
	.word	0x8143c000	! t0_kref+0x21f8:   	stbar
	.word	0xd64e8018	! t0_kref+0x21fc:   	ldsb	[%i2 + %i0], %o3
	.word	0xd900a03c	! t0_kref+0x2200:   	ld	[%g2 + 0x3c], %f12
	.word	0xa8f2c014	! t0_kref+0x2204:   	udivcc	%o3, %l4, %l4
	.word	0x32800002	! t0_kref+0x2208:   	bne,a	_kref+0x2210
	.word	0x9e08000b	! t0_kref+0x220c:   	and	%g0, %o3, %o7
	.word	0xd68e9040	! t0_kref+0x2210:   	lduba	[%i2]0x82, %o3
	.word	0x81830000	! t0_kref+0x2214:   	wr	%o4, %g0, %y
	.word	0x3a480004	! t0_kref+0x2218:   	bcc,a,pt	%icc, _kref+0x2228
	.word	0x9eb36e62	! t0_kref+0x221c:   	orncc	%o5, 0xe62, %o7
	.word	0x91a018d8	! t0_kref+0x2220:   	fdtos	%f24, %f8
	.word	0xe46e3fe4	! t0_kref+0x2224:   	ldstub	[%i0 - 0x1c], %l2
	.word	0x95a409d6	! t0_kref+0x2228:   	fdivd	%f16, %f22, %f10
	.word	0xd636001b	! t0_kref+0x222c:   	sth	%o3, [%i0 + %i3]
	.word	0x30480002	! t0_kref+0x2230:   	ba,a,pt	%icc, _kref+0x2238
	.word	0xec48a013	! t0_kref+0x2234:   	ldsb	[%g2 + 0x13], %l6
	.word	0xd0ce501a	! t0_kref+0x2238:   	ldsba	[%i1 + %i2]0x80, %o0
	.word	0x932a6003	! t0_kref+0x223c:   	sll	%o1, 0x3, %o1
	.word	0x9a3e8000	! t0_kref+0x2240:   	not	%i2, %o5
	.word	0xe3262014	! t0_kref+0x2244:   	st	%f17, [%i0 + 0x14]
	.word	0xafa208ac	! t0_kref+0x2248:   	fsubs	%f8, %f12, %f23
	.word	0xe26e3fe0	! t0_kref+0x224c:   	ldstub	[%i0 - 0x20], %l1
	.word	0xe4f81018	! t0_kref+0x2250:   	swapa	[%g0 + %i0]0x80, %l2
	.word	0xafa01a58	! t0_kref+0x2254:   	fdtoi	%f24, %f23
	.word	0xaf2a6006	! t0_kref+0x2258:   	sll	%o1, 0x6, %l7
	.word	0x2c800001	! t0_kref+0x225c:   	bneg,a	_kref+0x2260
	.word	0xd610a014	! t0_kref+0x2260:   	lduh	[%g2 + 0x14], %o3
	.word	0xe040a028	! t0_kref+0x2264:   	ldsw	[%g2 + 0x28], %l0
	.word	0x22480006	! t0_kref+0x2268:   	be,a,pt	%icc, _kref+0x2280
	.word	0xe2df5018	! t0_kref+0x226c:   	ldxa	[%i5 + %i0]0x80, %l1
	.word	0xd800a030	! t0_kref+0x2270:   	ld	[%g2 + 0x30], %o4
	.word	0x9fa01a4e	! t0_kref+0x2274:   	fdtoi	%f14, %f15
	.word	0xaba5c9b3	! t0_kref+0x2278:   	fdivs	%f23, %f19, %f21
	.word	0xe91e001d	! t0_kref+0x227c:   	ldd	[%i0 + %i5], %f20
	.word	0xea267fe0	! t0_kref+0x2280:   	st	%l5, [%i1 - 0x20]
	.word	0x34800006	! t0_kref+0x2284:   	bg,a	_kref+0x229c
	.word	0xa215b31f	! t0_kref+0x2288:   	or	%l6, -0xce1, %l1
	.word	0xc02e3fe8	! t0_kref+0x228c:   	clrb	[%i0 - 0x18]
	.word	0xadb00309	! t0_kref+0x2290:   	alignaddr	%g0, %o1, %l6
	.word	0xa5b6c32b	! t0_kref+0x2294:   	bmask	%i3, %o3, %l2
	.word	0x1703e9de	! t0_kref+0x2298:   	sethi	%hi(0xfa77800), %o3
	.word	0x21800003	! t0_kref+0x229c:   	fbn,a	_kref+0x22a8
	.word	0x9435f049	! t0_kref+0x22a0:   	orn	%l7, -0xfb7, %o2
	.word	0xa9a01935	! t0_kref+0x22a4:   	fstod	%f21, %f20
	.word	0x91b58ac8	! t0_kref+0x22a8:   	fpsub32	%f22, %f8, %f8
	.word	0x9a3dc014	! t0_kref+0x22ac:   	xnor	%l7, %l4, %o5
	.word	0xa895a761	! t0_kref+0x22b0:   	orcc	%l6, 0x761, %l4
	.word	0xa5a609d2	! t0_kref+0x22b4:   	fdivd	%f24, %f18, %f18
	.word	0xe648a03a	! t0_kref+0x22b8:   	ldsb	[%g2 + 0x3a], %l3
	.word	0x81ab0ace	! t0_kref+0x22bc:   	fcmped	%fcc0, %f12, %f14
	.word	0x91a588b9	! t0_kref+0x22c0:   	fsubs	%f22, %f25, %f8
	sethi	%hi(1f), %o7
	jmpl	%o7+%lo(1f), %g1
	.empty
	.word	0x9da509ca	! t0_kref+0x22cc:   	fdivd	%f20, %f10, %f14
	.word	0xa40d401a	! t0_kref+0x22d0:   	and	%l5, %i2, %l2
	.word	0x81834000	! t0_kref+0x22d4:   	wr	%o5, %g0, %y
	.word	0xafa208b9	! t0_kref+0x22d8:   	fsubs	%f8, %f25, %f23
	.word	0xa7a38831	! t0_kref+0x22dc:   	fadds	%f14, %f17, %f19
1:	.word	0x9a3a801a	! t0_kref+0x22e0:   	xnor	%o2, %i2, %o5
	.word	0x81ab4a2e	! t0_kref+0x22e4:   	fcmps	%fcc0, %f13, %f14
	.word	0x9895c016	! t0_kref+0x22e8:   	orcc	%l7, %l6, %o4
	.word	0xaac5e9e0	! t0_kref+0x22ec:   	addccc	%l7, 0x9e0, %l5
	.word	0xdd1e2008	! t0_kref+0x22f0:   	ldd	[%i0 + 8], %f14
	.word	0xa1b5c340	! t0_kref+0x22f4:   	alignaddrl	%l7, %g0, %l0
	.word	0xa9a3c8ab	! t0_kref+0x22f8:   	fsubs	%f15, %f11, %f20
	.word	0x9a3ac00b	! t0_kref+0x22fc:   	xnor	%o3, %o3, %o5
	.word	0xd9f65016	! t0_kref+0x2300:   	casxa	[%i1]0x80, %l6, %o4
	.word	0x3d800002	! t0_kref+0x2304:   	fbule,a	_kref+0x230c
	.word	0xe7ee501a	! t0_kref+0x2308:   	prefetcha	%i1 + %i2, 19
	.word	0xeab61000	! t0_kref+0x230c:   	stha	%l5, [%i0]0x80
	.word	0xd2364000	! t0_kref+0x2310:   	sth	%o1, [%i1]
	.word	0xb1a01910	! t0_kref+0x2314:   	fitod	%f16, %f24
	.word	0xdb070019	! t0_kref+0x2318:   	ld	[%i4 + %i1], %f13
	.word	0xadb6816c	! t0_kref+0x231c:   	edge32ln	%i2, %o4, %l6
	.word	0xd2560000	! t0_kref+0x2320:   	ldsh	[%i0], %o1
	.word	0xdede5000	! t0_kref+0x2324:   	ldxa	[%i1]0x80, %o7
	.word	0xa92d0015	! t0_kref+0x2328:   	sll	%l4, %l5, %l4
	.word	0xadb4854e	! t0_kref+0x232c:   	fcmpeq16	%f18, %f14, %l6
	.word	0xb1a588c8	! t0_kref+0x2330:   	fsubd	%f22, %f8, %f24
	.word	0xada0192e	! t0_kref+0x2334:   	fstod	%f14, %f22
	.word	0xec28a039	! t0_kref+0x2338:   	stb	%l6, [%g2 + 0x39]
	.word	0xd4366002	! t0_kref+0x233c:   	sth	%o2, [%i1 + 2]
	.word	0xab2d401b	! t0_kref+0x2340:   	sll	%l5, %i3, %l5
	.word	0xada00128	! t0_kref+0x2344:   	fabss	%f8, %f22
	.word	0x2f2204d2	! t0_kref+0x2348:   	sethi	%hi(0x88134800), %l7
	.word	0xd9e65014	! t0_kref+0x234c:   	casa	[%i1]0x80, %l4, %o4
	.word	0xc026401c	! t0_kref+0x2350:   	clr	[%i1 + %i4]
	.word	0xee4e7ff0	! t0_kref+0x2354:   	ldsb	[%i1 - 0x10], %l7
	.word	0x9db00c00	! t0_kref+0x2358:   	fzero	%f14
	.word	0x91b60408	! t0_kref+0x235c:   	fcmple16	%f24, %f8, %o0
	.word	0x9db00cd8	! t0_kref+0x2360:   	fnot2	%f24, %f14
	.word	0xe240a02c	! t0_kref+0x2364:   	ldsw	[%g2 + 0x2c], %l1
	.word	0x28480002	! t0_kref+0x2368:   	bleu,a,pt	%icc, _kref+0x2370
	.word	0x9fa5c8b3	! t0_kref+0x236c:   	fsubs	%f23, %f19, %f15
	.word	0xd1b81019	! t0_kref+0x2370:   	stda	%f8, [%g0 + %i1]0x80
	.word	0x32480004	! t0_kref+0x2374:   	bne,a,pt	%icc, _kref+0x2384
	.word	0x91b30488	! t0_kref+0x2378:   	fcmple32	%f12, %f8, %o0
	.word	0xaef5400a	! t0_kref+0x237c:   	udivcc	%l5, %o2, %l7
	.word	0xe3b8a080	! t0_kref+0x2380:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xa6f5e103	! t0_kref+0x2384:   	udivcc	%l7, 0x103, %l3
	.word	0xadb28e4a	! t0_kref+0x2388:   	fxnor	%f10, %f10, %f22
	.word	0x81868000	! t0_kref+0x238c:   	wr	%i2, %g0, %y
	.word	0xf1be1889	! t0_kref+0x2390:   	stda	%f24, [%i0 + %o1]0xc4
	.word	0xa0128000	! t0_kref+0x2394:   	or	%o2, %g0, %l0
	.word	0xee0e3fe0	! t0_kref+0x2398:   	ldub	[%i0 - 0x20], %l7
	.word	0x36800005	! t0_kref+0x239c:   	bge,a	_kref+0x23b0
	.word	0xb1a01a50	! t0_kref+0x23a0:   	fdtoi	%f16, %f24
	.word	0xa9b44e68	! t0_kref+0x23a4:   	fxnors	%f17, %f8, %f20
	.word	0xd630a024	! t0_kref+0x23a8:   	sth	%o3, [%g2 + 0x24]
	.word	0xda0e7ff9	! t0_kref+0x23ac:   	ldub	[%i1 - 7], %o5
	.word	0xeb263ff4	! t0_kref+0x23b0:   	st	%f21, [%i0 - 0xc]
	.word	0x95b60ea0	! t0_kref+0x23b4:   	fsrc1s	%f24, %f10
	.word	0x3e800003	! t0_kref+0x23b8:   	bvc,a	_kref+0x23c4
	.word	0x91154017	! t0_kref+0x23bc:   	taddcctv	%l5, %l7, %o0
	.word	0xa226a8ab	! t0_kref+0x23c0:   	sub	%i2, 0x8ab, %l1
	.word	0x9da00038	! t0_kref+0x23c4:   	fmovs	%f24, %f14
	.word	0x951220ec	! t0_kref+0x23c8:   	taddcctv	%o0, 0xec, %o2
	.word	0xd040a008	! t0_kref+0x23cc:   	ldsw	[%g2 + 8], %o0
	.word	0xd93e3ff0	! t0_kref+0x23d0:   	std	%f12, [%i0 - 0x10]
	.word	0xafb34fb5	! t0_kref+0x23d4:   	fors	%f13, %f21, %f23
	.word	0xd9380019	! t0_kref+0x23d8:   	std	%f12, [%g0 + %i1]
	.word	0xa5b3cea0	! t0_kref+0x23dc:   	fsrc1s	%f15, %f18
	.word	0x91b30d18	! t0_kref+0x23e0:   	fandnot1	%f12, %f24, %f8
	.word	0x923e8009	! t0_kref+0x23e4:   	xnor	%i2, %o1, %o1
	.word	0x8143c000	! t0_kref+0x23e8:   	stbar
	.word	0xd22e7fe8	! t0_kref+0x23ec:   	stb	%o1, [%i1 - 0x18]
	.word	0x39800002	! t0_kref+0x23f0:   	fbuge,a	_kref+0x23f8
	.word	0xe6562002	! t0_kref+0x23f4:   	ldsh	[%i0 + 2], %l3
	.word	0xc0680018	! t0_kref+0x23f8:   	ldstub	[%g0 + %i0], %g0
	.word	0xda48a01b	! t0_kref+0x23fc:   	ldsb	[%g2 + 0x1b], %o5
	.word	0xe5380018	! t0_kref+0x2400:   	std	%f18, [%g0 + %i0]
	.word	0xabb58280	! t0_kref+0x2404:   	array32	%l6, %g0, %l5
	.word	0x9315f088	! t0_kref+0x2408:   	taddcctv	%l7, -0xf78, %o1
	.word	0x99a3c8ae	! t0_kref+0x240c:   	fsubs	%f15, %f14, %f12
	.word	0xd13e3ff8	! t0_kref+0x2410:   	std	%f8, [%i0 - 8]
	.word	0x95b28550	! t0_kref+0x2414:   	fcmpeq16	%f10, %f16, %o2
	.word	0x95a00558	! t0_kref+0x2418:   	fsqrtd	%f24, %f10
	.word	0xd1be5880	! t0_kref+0x241c:   	stda	%f8, [%i1]0xc4
	.word	0x2c800006	! t0_kref+0x2420:   	bneg,a	_kref+0x2438
	.word	0xa0b52d06	! t0_kref+0x2424:   	orncc	%l4, 0xd06, %l0
	.word	0xec00a028	! t0_kref+0x2428:   	ld	[%g2 + 0x28], %l6
	.word	0x81ac0aaf	! t0_kref+0x242c:   	fcmpes	%fcc0, %f16, %f15
	.word	0x81ac8ab7	! t0_kref+0x2430:   	fcmpes	%fcc0, %f18, %f23
	.word	0xa5b00772	! t0_kref+0x2434:   	fpack16	%f18, %f18
	.word	0xa9b200d6	! t0_kref+0x2438:   	edge16l	%o0, %l6, %l4
	.word	0xae9b2488	! t0_kref+0x243c:   	xorcc	%o4, 0x488, %l7
	.word	0xa4b54008	! t0_kref+0x2440:   	orncc	%l5, %o0, %l2
	.word	0xe4680019	! t0_kref+0x2444:   	ldstub	[%g0 + %i1], %l2
	.word	0xa9b64d60	! t0_kref+0x2448:   	fnot1s	%f25, %f20
	.word	0x26480008	! t0_kref+0x244c:   	bl,a,pt	%icc, _kref+0x246c
	.word	0xed68a008	! t0_kref+0x2450:   	prefetch	%g2 + 8, 22
	.word	0xa5a00548	! t0_kref+0x2454:   	fsqrtd	%f8, %f18
	.word	0xabb5408c	! t0_kref+0x2458:   	edge16	%l5, %o4, %l5
	.word	0x24480003	! t0_kref+0x245c:   	ble,a,pt	%icc, _kref+0x2468
	.word	0xafa00528	! t0_kref+0x2460:   	fsqrts	%f8, %f23
	.word	0x38480005	! t0_kref+0x2464:   	bgu,a,pt	%icc, _kref+0x2478
	.word	0x9ba2482f	! t0_kref+0x2468:   	fadds	%f9, %f15, %f13
	.word	0xae9ac00c	! t0_kref+0x246c:   	xorcc	%o3, %o4, %l7
	.word	0xa636abda	! t0_kref+0x2470:   	orn	%i2, 0xbda, %l3
	.word	0xe51e2010	! t0_kref+0x2474:   	ldd	[%i0 + 0x10], %f18
	.word	0xd6080018	! t0_kref+0x2478:   	ldub	[%g0 + %i0], %o3
	.word	0xf96e6000	! t0_kref+0x247c:   	prefetch	%i1, 28
	.word	0xb1a2882a	! t0_kref+0x2480:   	fadds	%f10, %f10, %f24
	.word	0x3d800006	! t0_kref+0x2484:   	fbule,a	_kref+0x249c
	.word	0x2520edef	! t0_kref+0x2488:   	sethi	%hi(0x83b7bc00), %l2
	.word	0x92434000	! t0_kref+0x248c:   	addc	%o5, %g0, %o1
	.word	0x35800008	! t0_kref+0x2490:   	fbue,a	_kref+0x24b0
	.word	0xd0067fec	! t0_kref+0x2494:   	ld	[%i1 - 0x14], %o0
	.word	0xe648a00a	! t0_kref+0x2498:   	ldsb	[%g2 + 0xa], %l3
	.word	0xafb50414	! t0_kref+0x249c:   	fcmple16	%f20, %f20, %l7
	.word	0xa7b6048c	! t0_kref+0x24a0:   	fcmple32	%f24, %f12, %l3
	.word	0xfb6e401a	! t0_kref+0x24a4:   	prefetch	%i1 + %i2, 29
	.word	0x2b0c7644	! t0_kref+0x24a8:   	sethi	%hi(0x31d91000), %l5
	.word	0xa4128008	! t0_kref+0x24ac:   	or	%o2, %o0, %l2
	.word	0x1530ddec	! t0_kref+0x24b0:   	sethi	%hi(0xc377b000), %o2
	.word	0xa9b54c78	! t0_kref+0x24b4:   	fnors	%f21, %f24, %f20
	.word	0x36480008	! t0_kref+0x24b8:   	bge,a,pt	%icc, _kref+0x24d8
	.word	0xac2eeeb6	! t0_kref+0x24bc:   	andn	%i3, 0xeb6, %l6
	.word	0x2f800002	! t0_kref+0x24c0:   	fbu,a	_kref+0x24c8
	.word	0xa1b00cd2	! t0_kref+0x24c4:   	fnot2	%f18, %f16
	.word	0x9da01932	! t0_kref+0x24c8:   	fstod	%f18, %f14
	.word	0xafa549ab	! t0_kref+0x24cc:   	fdivs	%f21, %f11, %f23
	.word	0xa1a4c830	! t0_kref+0x24d0:   	fadds	%f19, %f16, %f16
	.word	0x15129b3c	! t0_kref+0x24d4:   	sethi	%hi(0x4a6cf000), %o2
	.word	0xaaf80015	! t0_kref+0x24d8:   	sdivcc	%g0, %l5, %l5
	.word	0x270891dd	! t0_kref+0x24dc:   	sethi	%hi(0x22477400), %l3
	.word	0x27800004	! t0_kref+0x24e0:   	fbul,a	_kref+0x24f0
	.word	0xf36e001d	! t0_kref+0x24e4:   	prefetch	%i0 + %i5, 25
	.word	0xabb40556	! t0_kref+0x24e8:   	fcmpeq16	%f16, %f22, %l5
	.word	0x94aa800b	! t0_kref+0x24ec:   	andncc	%o2, %o3, %o2
	.word	0xe3b8a080	! t0_kref+0x24f0:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x86102001	! t0_kref+0x24f4:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x24f8:   	bne,a	_kref+0x24f8
	.word	0x86a0e001	! t0_kref+0x24fc:   	subcc	%g3, 1, %g3
	.word	0x9a8eea37	! t0_kref+0x2500:   	andcc	%i3, 0xa37, %o5
	.word	0x95b6c148	! t0_kref+0x2504:   	edge32l	%i3, %o0, %o2
	.word	0xe5be5000	! t0_kref+0x2508:   	stda	%f18, [%i1]0x80
	.word	0xa7a608b4	! t0_kref+0x250c:   	fsubs	%f24, %f20, %f19
	.word	0xd028a001	! t0_kref+0x2510:   	stb	%o0, [%g2 + 1]
	.word	0xa52b0008	! t0_kref+0x2514:   	sll	%o4, %o0, %l2
	.word	0xabb00cf2	! t0_kref+0x2518:   	fnot2s	%f18, %f21
	.word	0x9fb30d29	! t0_kref+0x251c:   	fandnot1s	%f12, %f9, %f15
	.word	0xd9e61015	! t0_kref+0x2520:   	casa	[%i0]0x80, %l5, %o4
	.word	0xc768a007	! t0_kref+0x2524:   	prefetch	%g2 + 7, 3
	.word	0x95a00133	! t0_kref+0x2528:   	fabss	%f19, %f10
	.word	0xa89275d1	! t0_kref+0x252c:   	orcc	%o1, -0xa2f, %l4
	.word	0xd64e401a	! t0_kref+0x2530:   	ldsb	[%i1 + %i2], %o3
	.word	0xd1be9a19	! t0_kref+0x2534:   	stda	%f8, [%i2 + %i1]0xd0
	.word	0xea06001c	! t0_kref+0x2538:   	ld	[%i0 + %i4], %l5
	.word	0xada00548	! t0_kref+0x253c:   	fsqrtd	%f8, %f22
	.word	0xe900a004	! t0_kref+0x2540:   	ld	[%g2 + 4], %f20
	.word	0xa12e800b	! t0_kref+0x2544:   	sll	%i2, %o3, %l0
	.word	0xd6c01019	! t0_kref+0x2548:   	ldswa	[%g0 + %i1]0x80, %o3
	.word	0xc12e3ffc	! t0_kref+0x254c:   	st	%fsr, [%i0 - 4]
	.word	0x9db58754	! t0_kref+0x2550:   	fpack32	%f22, %f20, %f14
	.word	0xdaf01018	! t0_kref+0x2554:   	stxa	%o5, [%g0 + %i0]0x80
	.word	0xf6270005	! t0_kref+0x2558:   	st	%i3, [%i4 + %g5]
	.word	0x23800002	! t0_kref+0x255c:   	fbne,a	_kref+0x2564
	.word	0xe04e001a	! t0_kref+0x2560:   	ldsb	[%i0 + %i2], %l0
	.word	0xf6263fe4	! t0_kref+0x2564:   	st	%i3, [%i0 - 0x1c]
	.word	0xd600a030	! t0_kref+0x2568:   	ld	[%g2 + 0x30], %o3
	.word	0xea362014	! t0_kref+0x256c:   	sth	%l5, [%i0 + 0x14]
	.word	0x962a6cc6	! t0_kref+0x2570:   	andn	%o1, 0xcc6, %o3
	.word	0x99a48837	! t0_kref+0x2574:   	fadds	%f18, %f23, %f12
	.word	0xb1a00032	! t0_kref+0x2578:   	fmovs	%f18, %f24
	.word	0xa6f2f945	! t0_kref+0x257c:   	udivcc	%o3, -0x6bb, %l3
	.word	0xd06e3fe1	! t0_kref+0x2580:   	ldstub	[%i0 - 0x1f], %o0
	.word	0x982d6250	! t0_kref+0x2584:   	andn	%l5, 0x250, %o4
	.word	0x908d001b	! t0_kref+0x2588:   	andcc	%l4, %i3, %o0
	.word	0xe5ee101b	! t0_kref+0x258c:   	prefetcha	%i0 + %i3, 18
	.word	0x93b2414b	! t0_kref+0x2590:   	edge32l	%o1, %o3, %o1
	.word	0xa4aa381b	! t0_kref+0x2594:   	andncc	%o0, -0x7e5, %l2
	.word	0xd86e2009	! t0_kref+0x2598:   	ldstub	[%i0 + 9], %o4
	.word	0xe648a002	! t0_kref+0x259c:   	ldsb	[%g2 + 2], %l3
	.word	0xa1b24280	! t0_kref+0x25a0:   	array32	%o1, %g0, %l0
	.word	0x9de3bfa0	! t0_kref+0x25a4:   	save	%sp, -0x60, %sp
	.word	0x93eef526	! t0_kref+0x25a8:   	restore	%i3, -0xada, %o1
	.word	0xe13e4000	! t0_kref+0x25ac:   	std	%f16, [%i1]
	.word	0x962ef6c4	! t0_kref+0x25b0:   	andn	%i3, -0x93c, %o3
	.word	0xa9b40636	! t0_kref+0x25b4:   	fmul8x16	%f16, %f22, %f20
	.word	0xe9bf5a19	! t0_kref+0x25b8:   	stda	%f20, [%i5 + %i1]0xd0
	.word	0xe168a045	! t0_kref+0x25bc:   	prefetch	%g2 + 0x45, 16
	.word	0x81ac0a29	! t0_kref+0x25c0:   	fcmps	%fcc0, %f16, %f9
	.word	0xda08a016	! t0_kref+0x25c4:   	ldub	[%g2 + 0x16], %o5
	.word	0xe1be1000	! t0_kref+0x25c8:   	stda	%f16, [%i0]0x80
	.word	0xa7b20556	! t0_kref+0x25cc:   	fcmpeq16	%f8, %f22, %l3
	.word	0xc568a04f	! t0_kref+0x25d0:   	prefetch	%g2 + 0x4f, 2
	.word	0xd120a004	! t0_kref+0x25d4:   	st	%f8, [%g2 + 4]
	.word	0xd836401b	! t0_kref+0x25d8:   	sth	%o4, [%i1 + %i3]
	.word	0x94a825bd	! t0_kref+0x25dc:   	andncc	%g0, 0x5bd, %o2
	.word	0x81830000	! t0_kref+0x25e0:   	wr	%o4, %g0, %y
	.word	0xe0166012	! t0_kref+0x25e4:   	lduh	[%i1 + 0x12], %l0
	.word	0x86102002	! t0_kref+0x25e8:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x25ec:   	bne,a	_kref+0x25ec
	.word	0x86a0e001	! t0_kref+0x25f0:   	subcc	%g3, 1, %g3
	.word	0xdf062008	! t0_kref+0x25f4:   	ld	[%i0 + 8], %f15
	.word	0xaa027429	! t0_kref+0x25f8:   	add	%o1, -0xbd7, %l5
	.word	0x9482001b	! t0_kref+0x25fc:   	addcc	%o0, %i3, %o2
	.word	0xe9bf5019	! t0_kref+0x2600:   	stda	%f20, [%i5 + %i1]0x80
	.word	0xadb30a88	! t0_kref+0x2604:   	fpsub16	%f12, %f8, %f22
	.word	0x920a0009	! t0_kref+0x2608:   	and	%o0, %o1, %o1
	.word	0x3e800001	! t0_kref+0x260c:   	bvc,a	_kref+0x2610
	.word	0x98bac00d	! t0_kref+0x2610:   	xnorcc	%o3, %o5, %o4
	.word	0xc06e7fed	! t0_kref+0x2614:   	ldstub	[%i1 - 0x13], %g0
	.word	0x99a4894a	! t0_kref+0x2618:   	fmuld	%f18, %f10, %f12
	.word	0xec267ffc	! t0_kref+0x261c:   	st	%l6, [%i1 - 4]
	.word	0xa7a309ac	! t0_kref+0x2620:   	fdivs	%f12, %f12, %f19
	.word	0xa1b4870c	! t0_kref+0x2624:   	fmuld8sux16	%f18, %f12, %f16
	.word	0xea28a02f	! t0_kref+0x2628:   	stb	%l5, [%g2 + 0x2f]
	.word	0xde480018	! t0_kref+0x262c:   	ldsb	[%g0 + %i0], %o7
	.word	0xa2dd4015	! t0_kref+0x2630:   	smulcc	%l5, %l5, %l1
	.word	0xb1b34a71	! t0_kref+0x2634:   	fpadd32s	%f13, %f17, %f24
	.word	0xaba4082c	! t0_kref+0x2638:   	fadds	%f16, %f12, %f21
	.word	0xeb68a00a	! t0_kref+0x263c:   	prefetch	%g2 + 0xa, 21
	.word	0x91a28856	! t0_kref+0x2640:   	faddd	%f10, %f22, %f8
	.word	0x91a000cc	! t0_kref+0x2644:   	fnegd	%f12, %f8
	.word	0xddbf5018	! t0_kref+0x2648:   	stda	%f14, [%i5 + %i0]0x80
	.word	0x933a2008	! t0_kref+0x264c:   	sra	%o0, 0x8, %o1
	.word	0xd8c6101c	! t0_kref+0x2650:   	ldswa	[%i0 + %i4]0x80, %o4
	.word	0xa8b6c014	! t0_kref+0x2654:   	orncc	%i3, %l4, %l4
	.word	0xe68e1000	! t0_kref+0x2658:   	lduba	[%i0]0x80, %l3
	.word	0xada58838	! t0_kref+0x265c:   	fadds	%f22, %f24, %f22
	.word	0xa5b6830b	! t0_kref+0x2660:   	alignaddr	%i2, %o3, %l2
	.word	0x94d0000b	! t0_kref+0x2664:   	umulcc	%g0, %o3, %o2
	.word	0x3c480001	! t0_kref+0x2668:   	bpos,a,pt	%icc, _kref+0x266c
	.word	0x91b4c732	! t0_kref+0x266c:   	fmuld8ulx16	%f19, %f18, %f8
	.word	0x909b000a	! t0_kref+0x2670:   	xorcc	%o4, %o2, %o0
	.word	0xad2ac017	! t0_kref+0x2674:   	sll	%o3, %l7, %l6
	.word	0xd248a029	! t0_kref+0x2678:   	ldsb	[%g2 + 0x29], %o1
	.word	0x9fc00004	! t0_kref+0x267c:   	call	%g0 + %g4
	.word	0xa9a01a54	! t0_kref+0x2680:   	fdtoi	%f20, %f20
	.word	0x8143c000	! t0_kref+0x2684:   	stbar
	.word	0xa1a00034	! t0_kref+0x2688:   	fmovs	%f20, %f16
	.word	0x3e480007	! t0_kref+0x268c:   	bvc,a,pt	%icc, _kref+0x26a8
	.word	0xadb28d2a	! t0_kref+0x2690:   	fandnot1s	%f10, %f10, %f22
	.word	0xaba0002c	! t0_kref+0x2694:   	fmovs	%f12, %f21
	.word	0xe3b8a080	! t0_kref+0x2698:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xd0ce9019	! t0_kref+0x269c:   	ldsba	[%i2 + %i1]0x80, %o0
	.word	0xa5a00056	! t0_kref+0x26a0:   	fmovd	%f22, %f18
	.word	0xd24e2000	! t0_kref+0x26a4:   	ldsb	[%i0], %o1
	.word	0xada00529	! t0_kref+0x26a8:   	fsqrts	%f9, %f22
	.word	0xa5b6c30b	! t0_kref+0x26ac:   	alignaddr	%i3, %o3, %l2
	.word	0xe836001b	! t0_kref+0x26b0:   	sth	%l4, [%i0 + %i3]
	.word	0xd1be1880	! t0_kref+0x26b4:   	stda	%f8, [%i0]0xc4
	.word	0xc807bfe4	! t0_kref+0x26b8:   	ld	[%fp - 0x1c], %g4
	.word	0x81ad8ac8	! t0_kref+0x26bc:   	fcmped	%fcc0, %f22, %f8
	.word	0xacc02d8f	! t0_kref+0x26c0:   	addccc	%g0, 0xd8f, %l6
	.word	0x36480003	! t0_kref+0x26c4:   	bge,a,pt	%icc, _kref+0x26d0
	.word	0xd64e2010	! t0_kref+0x26c8:   	ldsb	[%i0 + 0x10], %o3
	.word	0xb1a000d8	! t0_kref+0x26cc:   	fnegd	%f24, %f24
	.word	0xb3a0012b	! t0_kref+0x26d0:   	fabss	%f11, %f25
	.word	0xa1a01939	! t0_kref+0x26d4:   	fstod	%f25, %f16
	.word	0x9ab2400d	! t0_kref+0x26d8:   	orncc	%o1, %o5, %o5
	.word	0xe2463ffc	! t0_kref+0x26dc:   	ldsw	[%i0 - 4], %l1
	.word	0x34800002	! t0_kref+0x26e0:   	bg,a	_kref+0x26e8
	.word	0xa0fd778b	! t0_kref+0x26e4:   	sdivcc	%l5, -0x875, %l0
	.word	0xae0a4017	! t0_kref+0x26e8:   	and	%o1, %l7, %l7
	.word	0xd840a00c	! t0_kref+0x26ec:   	ldsw	[%g2 + 0xc], %o4
	.word	0x9da01a4c	! t0_kref+0x26f0:   	fdtoi	%f12, %f14
	.word	0x98268016	! t0_kref+0x26f4:   	sub	%i2, %l6, %o4
	.word	0xa7b2058e	! t0_kref+0x26f8:   	fcmpgt32	%f8, %f14, %l3
	.word	0x2f800007	! t0_kref+0x26fc:   	fbu,a	_kref+0x2718
	.word	0x9da5084c	! t0_kref+0x2700:   	faddd	%f20, %f12, %f14
	.word	0x983e800c	! t0_kref+0x2704:   	xnor	%i2, %o4, %o4
	.word	0x96c22c0d	! t0_kref+0x2708:   	addccc	%o0, 0xc0d, %o3
	.word	0x9da389d4	! t0_kref+0x270c:   	fdivd	%f14, %f20, %f14
	.word	0xa025c017	! t0_kref+0x2710:   	sub	%l7, %l7, %l0
	.word	0x2b800005	! t0_kref+0x2714:   	fbug,a	_kref+0x2728
	.word	0xe53e0000	! t0_kref+0x2718:   	std	%f18, [%i0]
	.word	0x81ab4ab3	! t0_kref+0x271c:   	fcmpes	%fcc0, %f13, %f19
	.word	0x32480006	! t0_kref+0x2720:   	bne,a,pt	%icc, _kref+0x2738
	.word	0xd11e6010	! t0_kref+0x2724:   	ldd	[%i1 + 0x10], %f8
	.word	0x92db25ee	! t0_kref+0x2728:   	smulcc	%o4, 0x5ee, %o1
	.word	0xb1a548a9	! t0_kref+0x272c:   	fsubs	%f21, %f9, %f24
	.word	0xea48a015	! t0_kref+0x2730:   	ldsb	[%g2 + 0x15], %l5
	.word	0xc3ee5009	! t0_kref+0x2734:   	prefetcha	%i1 + %o1, 1
	.word	0x81aa0aca	! t0_kref+0x2738:   	fcmped	%fcc0, %f8, %f10
	.word	0xef00a008	! t0_kref+0x273c:   	ld	[%g2 + 8], %f23
	.word	0x2a480006	! t0_kref+0x2740:   	bcs,a,pt	%icc, _kref+0x2758
	.word	0xa012801b	! t0_kref+0x2744:   	or	%o2, %i3, %l0
	.word	0x191d611d	! t0_kref+0x2748:   	sethi	%hi(0x75847400), %o4
	.word	0x81868000	! t0_kref+0x274c:   	wr	%i2, %g0, %y
	.word	0x9bb6c008	! t0_kref+0x2750:   	edge8	%i3, %o0, %o5
	.word	0xdd801018	! t0_kref+0x2754:   	lda	[%g0 + %i0]0x80, %f14
	.word	0xb3a34828	! t0_kref+0x2758:   	fadds	%f13, %f8, %f25
	.word	0x91a6084c	! t0_kref+0x275c:   	faddd	%f24, %f12, %f8
	.word	0x34800007	! t0_kref+0x2760:   	bg,a	_kref+0x277c
	.word	0xe3b8a080	! t0_kref+0x2764:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x2b800001	! t0_kref+0x2768:   	fbug,a	_kref+0x276c
	.word	0x94b2800c	! t0_kref+0x276c:   	orncc	%o2, %o4, %o2
	.word	0xacb533e0	! t0_kref+0x2770:   	orncc	%l4, -0xc20, %l6
	.word	0xa20dc01a	! t0_kref+0x2774:   	and	%l7, %i2, %l1
	.word	0xc128001c	! t0_kref+0x2778:   	st	%fsr, [%g0 + %i4]
	.word	0xdd3f4019	! t0_kref+0x277c:   	std	%f14, [%i5 + %i1]
	.word	0x99a0054a	! t0_kref+0x2780:   	fsqrtd	%f10, %f12
	.word	0xe8362008	! t0_kref+0x2784:   	sth	%l4, [%i0 + 8]
	.word	0xe2562012	! t0_kref+0x2788:   	ldsh	[%i0 + 0x12], %l1
	.word	0xe16e6008	! t0_kref+0x278c:   	prefetch	%i1 + 8, 16
	.word	0xa5a0192d	! t0_kref+0x2790:   	fstod	%f13, %f18
	.word	0xa63a27ac	! t0_kref+0x2794:   	xnor	%o0, 0x7ac, %l3
	.word	0xada50858	! t0_kref+0x2798:   	faddd	%f20, %f24, %f22
	.word	0xa5a01936	! t0_kref+0x279c:   	fstod	%f22, %f18
	.word	0x95a01937	! t0_kref+0x27a0:   	fstod	%f23, %f10
	.word	0x95a01a4a	! t0_kref+0x27a4:   	fdtoi	%f10, %f10
	.word	0x9842800d	! t0_kref+0x27a8:   	addc	%o2, %o5, %o4
	.word	0xe248a028	! t0_kref+0x27ac:   	ldsb	[%g2 + 0x28], %l1
	.word	0xa5254015	! t0_kref+0x27b0:   	mulscc	%l5, %l5, %l2
	.word	0xde4e001a	! t0_kref+0x27b4:   	ldsb	[%i0 + %i2], %o7
	.word	0x9fc00004	! t0_kref+0x27b8:   	call	%g0 + %g4
	.word	0xe4180019	! t0_kref+0x27bc:   	ldd	[%g0 + %i1], %l2
	.word	0xed00a01c	! t0_kref+0x27c0:   	ld	[%g2 + 0x1c], %f22
	.word	0x99b30d0e	! t0_kref+0x27c4:   	fandnot1	%f12, %f14, %f12
	.word	0xa3a388ad	! t0_kref+0x27c8:   	fsubs	%f14, %f13, %f17
	.word	0xaed6ac7e	! t0_kref+0x27cc:   	umulcc	%i2, 0xc7e, %l7
	.word	0xada0054c	! t0_kref+0x27d0:   	fsqrtd	%f12, %f22
	.word	0xaab6e321	! t0_kref+0x27d4:   	orncc	%i3, 0x321, %l5
	.word	0xa1b20d08	! t0_kref+0x27d8:   	fandnot1	%f8, %f8, %f16
	.word	0xf43f4019	! t0_kref+0x27dc:   	std	%i2, [%i5 + %i1]
	.word	0xa0ab4008	! t0_kref+0x27e0:   	andncc	%o5, %o0, %l0
	.word	0xafb6c17a	! t0_kref+0x27e4:   	edge32ln	%i3, %i2, %l7
	.word	0xada50954	! t0_kref+0x27e8:   	fmuld	%f20, %f20, %f22
	.word	0xd24e8019	! t0_kref+0x27ec:   	ldsb	[%i2 + %i1], %o1
	.word	0xb1b48dc8	! t0_kref+0x27f0:   	fnand	%f18, %f8, %f24
	.word	0xd06e8018	! t0_kref+0x27f4:   	ldstub	[%i2 + %i0], %o0
	.word	0x34480002	! t0_kref+0x27f8:   	bg,a,pt	%icc, _kref+0x2800
	.word	0xaba00128	! t0_kref+0x27fc:   	fabss	%f8, %f21
	.word	0xf16e6000	! t0_kref+0x2800:   	prefetch	%i1, 24
	.word	0x2e480007	! t0_kref+0x2804:   	bvs,a,pt	%icc, _kref+0x2820
	.word	0xe4566004	! t0_kref+0x2808:   	ldsh	[%i1 + 4], %l2
	.word	0xaa26e9a7	! t0_kref+0x280c:   	sub	%i3, 0x9a7, %l5
	.word	0x91a508ce	! t0_kref+0x2810:   	fsubd	%f20, %f14, %f8
	.word	0x95b28077	! t0_kref+0x2814:   	edge8ln	%o2, %l7, %o2
	.word	0x9da0192e	! t0_kref+0x2818:   	fstod	%f14, %f14
	.word	0x97b24df9	! t0_kref+0x281c:   	fnands	%f9, %f25, %f11
	.word	0x93a01889	! t0_kref+0x2820:   	fitos	%f9, %f9
	.word	0x9da40952	! t0_kref+0x2824:   	fmuld	%f16, %f18, %f14
	.word	0x34480001	! t0_kref+0x2828:   	bg,a,pt	%icc, _kref+0x282c
	.word	0xe80e7fe4	! t0_kref+0x282c:   	ldub	[%i1 - 0x1c], %l4
	.word	0xa08a634c	! t0_kref+0x2830:   	andcc	%o1, 0x34c, %l0
	.word	0xa1a01a4c	! t0_kref+0x2834:   	fdtoi	%f12, %f16
	.word	0xa485801a	! t0_kref+0x2838:   	addcc	%l6, %i2, %l2
	.word	0x81820000	! t0_kref+0x283c:   	wr	%o0, %g0, %y
	.word	0xa03d221e	! t0_kref+0x2840:   	xnor	%l4, 0x21e, %l0
	.word	0x91b3cd39	! t0_kref+0x2844:   	fandnot1s	%f15, %f25, %f8
	.word	0xed801019	! t0_kref+0x2848:   	lda	[%g0 + %i1]0x80, %f22
	.word	0xd8200018	! t0_kref+0x284c:   	st	%o4, [%g0 + %i0]
	.word	0xa7b44e79	! t0_kref+0x2850:   	fxnors	%f17, %f25, %f19
	.word	0xb1b00fc0	! t0_kref+0x2854:   	fone	%f24
	.word	0xa1a5094e	! t0_kref+0x2858:   	fmuld	%f20, %f14, %f16
	.word	0x8143e067	! t0_kref+0x285c:   	membar	0x67
	.word	0xae8a726f	! t0_kref+0x2860:   	andcc	%o1, -0xd91, %l7
	.word	0xa1b28014	! t0_kref+0x2864:   	edge8	%o2, %l4, %l0
	.word	0xa885000c	! t0_kref+0x2868:   	addcc	%l4, %o4, %l4
	.word	0xb1b54e28	! t0_kref+0x286c:   	fands	%f21, %f8, %f24
	.word	0xb1b40df6	! t0_kref+0x2870:   	fnands	%f16, %f22, %f24
	.word	0xa8268015	! t0_kref+0x2874:   	sub	%i2, %l5, %l4
	.word	0xa2f3256c	! t0_kref+0x2878:   	udivcc	%o4, 0x56c, %l1
	.word	0xa2137b55	! t0_kref+0x287c:   	or	%o5, -0x4ab, %l1
	.word	0xe91f4018	! t0_kref+0x2880:   	ldd	[%i5 + %i0], %f20
	.word	0xa3b6c280	! t0_kref+0x2884:   	array32	%i3, %g0, %l1
	.word	0x95a608ac	! t0_kref+0x2888:   	fsubs	%f24, %f12, %f10
	.word	0x33800004	! t0_kref+0x288c:   	fbe,a	_kref+0x289c
	.word	0x99b00c20	! t0_kref+0x2890:   	fzeros	%f12
	.word	0x909dfed1	! t0_kref+0x2894:   	xorcc	%l7, -0x12f, %o0
	.word	0xef270018	! t0_kref+0x2898:   	st	%f23, [%i4 + %i0]
	.word	0x9afd6d2d	! t0_kref+0x289c:   	sdivcc	%l5, 0xd2d, %o5
	.word	0xf76e2018	! t0_kref+0x28a0:   	prefetch	%i0 + 0x18, 27
	.word	0xd53e3fe0	! t0_kref+0x28a4:   	std	%f10, [%i0 - 0x20]
	.word	0xe3b8a080	! t0_kref+0x28a8:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xd99e1a1d	! t0_kref+0x28ac:   	ldda	[%i0 + %i5]0xd0, %f12
	.word	0x8143c000	! t0_kref+0x28b0:   	stbar
	.word	0x95a64932	! t0_kref+0x28b4:   	fmuls	%f25, %f18, %f10
	.word	0x9fc00004	! t0_kref+0x28b8:   	call	%g0 + %g4
	.word	0xa445726c	! t0_kref+0x28bc:   	addc	%l5, -0xd94, %l2
	.word	0x9fc10000	! t0_kref+0x28c0:   	call	%g4
	.word	0xafa01a50	! t0_kref+0x28c4:   	fdtoi	%f16, %f23
	.word	0xe1180019	! t0_kref+0x28c8:   	ldd	[%g0 + %i1], %f16
	.word	0xe0881018	! t0_kref+0x28cc:   	lduba	[%g0 + %i0]0x80, %l0
	.word	0xa1b64709	! t0_kref+0x28d0:   	fmuld8sux16	%f25, %f9, %f16
	.word	0x90f2c017	! t0_kref+0x28d4:   	udivcc	%o3, %l7, %o0
	.word	0x9bb3058e	! t0_kref+0x28d8:   	fcmpgt32	%f12, %f14, %o5
	.word	0xa736a009	! t0_kref+0x28dc:   	srl	%i2, 0x9, %l3
	.word	0xd04e7ff9	! t0_kref+0x28e0:   	ldsb	[%i1 - 7], %o0
	.word	0x8143e06e	! t0_kref+0x28e4:   	membar	0x6e
	.word	0xfb6e001c	! t0_kref+0x28e8:   	prefetch	%i0 + %i4, 29
	.word	0x97a589b9	! t0_kref+0x28ec:   	fdivs	%f22, %f25, %f11
	.word	0x9925bc51	! t0_kref+0x28f0:   	mulscc	%l6, -0x3af, %o4
	.word	0xd016001b	! t0_kref+0x28f4:   	lduh	[%i0 + %i3], %o0
	.word	0xea270018	! t0_kref+0x28f8:   	st	%l5, [%i4 + %i0]
	.word	0xec9e1000	! t0_kref+0x28fc:   	ldda	[%i0]0x80, %l6
	.word	0xa7a0002d	! t0_kref+0x2900:   	fmovs	%f13, %f19
	.word	0xa7a0188f	! t0_kref+0x2904:   	fitos	%f15, %f19
	.word	0xabb5032b	! t0_kref+0x2908:   	bmask	%l4, %o3, %l5
	.word	0x96768016	! t0_kref+0x290c:   	udiv	%i2, %l6, %o3
	.word	0xa8f03900	! t0_kref+0x2910:   	udivcc	%g0, -0x700, %l4
	.word	0x8143e044	! t0_kref+0x2914:   	membar	0x44
	.word	0x9e723df2	! t0_kref+0x2918:   	udiv	%o0, -0x20e, %o7
	.word	0xe3b8a080	! t0_kref+0x291c:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x81ad0a29	! t0_kref+0x2920:   	fcmps	%fcc0, %f20, %f9
	.word	0x9fa30830	! t0_kref+0x2924:   	fadds	%f12, %f16, %f15
	.word	0xe9be189b	! t0_kref+0x2928:   	stda	%f20, [%i0 + %i3]0xc4
	.word	0xa092401a	! t0_kref+0x292c:   	orcc	%o1, %i2, %l0
	.word	0x2e800004	! t0_kref+0x2930:   	bvs,a	_kref+0x2940
	.word	0xafa00037	! t0_kref+0x2934:   	fmovs	%f23, %f23
	.word	0xaa22c00a	! t0_kref+0x2938:   	sub	%o3, %o2, %l5
	.word	0xe59f5019	! t0_kref+0x293c:   	ldda	[%i5 + %i1]0x80, %f18
	.word	0xd5f61016	! t0_kref+0x2940:   	casxa	[%i0]0x80, %l6, %o2
	.word	0x960b4014	! t0_kref+0x2944:   	and	%o5, %l4, %o3
	.word	0x9fc10000	! t0_kref+0x2948:   	call	%g4
	.word	0xe1bf1a59	! t0_kref+0x294c:   	stda	%f16, [%i4 + %i1]0xd2
	.word	0xd0000019	! t0_kref+0x2950:   	ld	[%g0 + %i1], %o0
	.word	0xd1000018	! t0_kref+0x2954:   	ld	[%g0 + %i0], %f8
	.word	0x858237bb	! t0_kref+0x2958:   	wr	%o0, 0xfffff7bb, %ccr
	.word	0xafa448b1	! t0_kref+0x295c:   	fsubs	%f17, %f17, %f23
	.word	0x95b28d8c	! t0_kref+0x2960:   	fxor	%f10, %f12, %f10
	.word	0x92f5a383	! t0_kref+0x2964:   	udivcc	%l6, 0x383, %o1
	.word	0xafa0002d	! t0_kref+0x2968:   	fmovs	%f13, %f23
	.word	0x9da00552	! t0_kref+0x296c:   	fsqrtd	%f18, %f14
	.word	0x1b0be7e1	! t0_kref+0x2970:   	sethi	%hi(0x2f9f8400), %o5
	.word	0xe3b8a080	! t0_kref+0x2974:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x81580000	! t0_kref+0x2978:   	flushw
	.word	0x36800004	! t0_kref+0x297c:   	bge,a	_kref+0x298c
	.word	0xafa588ae	! t0_kref+0x2980:   	fsubs	%f22, %f14, %f23
	.word	0x9fc00004	! t0_kref+0x2984:   	call	%g0 + %g4
	.word	0xa6050016	! t0_kref+0x2988:   	add	%l4, %l6, %l3
	.word	0xd8ee1000	! t0_kref+0x298c:   	ldstuba	[%i0]0x80, %o4
	.word	0x81ab4a28	! t0_kref+0x2990:   	fcmps	%fcc0, %f13, %f8
	.word	0x81830000	! t0_kref+0x2994:   	wr	%o4, %g0, %y
	.word	0x94b37c4c	! t0_kref+0x2998:   	orncc	%o5, -0x3b4, %o2
	.word	0xa9a508b7	! t0_kref+0x299c:   	fsubs	%f20, %f23, %f20
	.word	0x952a6013	! t0_kref+0x29a0:   	sll	%o1, 0x13, %o2
	.word	0x9f2ea013	! t0_kref+0x29a4:   	sll	%i2, 0x13, %o7
	.word	0xef20a00c	! t0_kref+0x29a8:   	st	%f23, [%g2 + 0xc]
	.word	0x96720014	! t0_kref+0x29ac:   	udiv	%o0, %l4, %o3
	.word	0xe5ee501b	! t0_kref+0x29b0:   	prefetcha	%i1 + %i3, 18
	.word	0x99b20329	! t0_kref+0x29b4:   	bmask	%o0, %o1, %o4
	.word	0xa1a2cd33	! t0_kref+0x29b8:   	fsmuld	%f11, %f19, %f16
	.word	0x95b28ad6	! t0_kref+0x29bc:   	fpsub32	%f10, %f22, %f10
	.word	0xada000ce	! t0_kref+0x29c0:   	fnegd	%f14, %f22
	.word	0xaefa8008	! t0_kref+0x29c4:   	sdivcc	%o2, %o0, %l7
	.word	0xaa927447	! t0_kref+0x29c8:   	orcc	%o1, -0xbb9, %l5
	.word	0x9bb2848c	! t0_kref+0x29cc:   	fcmple32	%f10, %f12, %o5
	.word	0xa4324015	! t0_kref+0x29d0:   	orn	%o1, %l5, %l2
	.word	0xdb00a028	! t0_kref+0x29d4:   	ld	[%g2 + 0x28], %f13
	.word	0xa7a00036	! t0_kref+0x29d8:   	fmovs	%f22, %f19
	.word	0x932ae016	! t0_kref+0x29dc:   	sll	%o3, 0x16, %o1
	.word	0xe828a008	! t0_kref+0x29e0:   	stb	%l4, [%g2 + 8]
	.word	0x9161c00b	! t0_kref+0x29e4:   	movu	%fcc0, %o3, %o0
	.word	0xa9b30c74	! t0_kref+0x29e8:   	fnors	%f12, %f20, %f20
	.word	0xef68a087	! t0_kref+0x29ec:   	prefetch	%g2 + 0x87, 23
	.word	0x9fa609ab	! t0_kref+0x29f0:   	fdivs	%f24, %f11, %f15
	.word	0xec20a018	! t0_kref+0x29f4:   	st	%l6, [%g2 + 0x18]
	.word	0xafa4882b	! t0_kref+0x29f8:   	fadds	%f18, %f11, %f23
	.word	0x81ac0a58	! t0_kref+0x29fc:   	fcmpd	%fcc0, %f16, %f24
	.word	0xa1a000d6	! t0_kref+0x2a00:   	fnegd	%f22, %f16
	.word	0x9810363b	! t0_kref+0x2a04:   	mov	0xfffff63b, %o4
	.word	0xb3a28830	! t0_kref+0x2a08:   	fadds	%f10, %f16, %f25
	.word	0xa9b00ceb	! t0_kref+0x2a0c:   	fnot2s	%f11, %f20
	.word	0xc129401c	! t0_kref+0x2a10:   	st	%fsr, [%g5 + %i4]
	.word	0xafb20f6b	! t0_kref+0x2a14:   	fornot1s	%f8, %f11, %f23
	.word	0xc16e3fe8	! t0_kref+0x2a18:   	prefetch	%i0 - 0x18, 0
	.word	0x96b2c008	! t0_kref+0x2a1c:   	orncc	%o3, %o0, %o3
	.word	0xb1a0002b	! t0_kref+0x2a20:   	fmovs	%f11, %f24
	.word	0x81ad8a39	! t0_kref+0x2a24:   	fcmps	%fcc0, %f22, %f25
	.word	0x26800007	! t0_kref+0x2a28:   	bl,a	_kref+0x2a44
	.word	0x99a489b8	! t0_kref+0x2a2c:   	fdivs	%f18, %f24, %f12
	.word	0xd0c6101c	! t0_kref+0x2a30:   	ldswa	[%i0 + %i4]0x80, %o0
	.word	0x81acca32	! t0_kref+0x2a34:   	fcmps	%fcc0, %f19, %f18
	.word	0xe53e2010	! t0_kref+0x2a38:   	std	%f18, [%i0 + 0x10]
	.word	0xaf2ea00f	! t0_kref+0x2a3c:   	sll	%i2, 0xf, %l7
	.word	0x96b0000c	! t0_kref+0x2a40:   	orncc	%g0, %o4, %o3
	.word	0x95b48ef1	! t0_kref+0x2a44:   	fornot2s	%f18, %f17, %f10
	.word	0xa7a00530	! t0_kref+0x2a48:   	fsqrts	%f16, %f19
	.word	0xae32acf8	! t0_kref+0x2a4c:   	orn	%o2, 0xcf8, %l7
	.word	0xe3b8a080	! t0_kref+0x2a50:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xda56c018	! t0_kref+0x2a54:   	ldsh	[%i3 + %i0], %o5
	.word	0x968364b6	! t0_kref+0x2a58:   	addcc	%o5, 0x4b6, %o3
	.word	0xae72303e	! t0_kref+0x2a5c:   	udiv	%o0, -0xfc2, %l7
	.word	0x9af00008	! t0_kref+0x2a60:   	udivcc	%g0, %o0, %o5
	.word	0x8143c000	! t0_kref+0x2a64:   	stbar
	.word	0xe99e1a1d	! t0_kref+0x2a68:   	ldda	[%i0 + %i5]0xd0, %f20
	.word	0xa9a01a58	! t0_kref+0x2a6c:   	fdtoi	%f24, %f20
	.word	0xa5a00558	! t0_kref+0x2a70:   	fsqrtd	%f24, %f18
	.word	0xa9268017	! t0_kref+0x2a74:   	mulscc	%i2, %l7, %l4
	.word	0xa60aeaab	! t0_kref+0x2a78:   	and	%o3, 0xaab, %l3
	.word	0xe3b8a080	! t0_kref+0x2a7c:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x39800008	! t0_kref+0x2a80:   	fbuge,a	_kref+0x2aa0
	.word	0x93a01a35	! t0_kref+0x2a84:   	fstoi	%f21, %f9
	.word	0xe9380019	! t0_kref+0x2a88:   	std	%f20, [%g0 + %i1]
	.word	0xa0dd4009	! t0_kref+0x2a8c:   	smulcc	%l5, %o1, %l0
	.word	0xf13e401d	! t0_kref+0x2a90:   	std	%f24, [%i1 + %i5]
	.word	0x99a01932	! t0_kref+0x2a94:   	fstod	%f18, %f12
	.word	0xe8b01019	! t0_kref+0x2a98:   	stha	%l4, [%g0 + %i1]0x80
	.word	0x99b60db3	! t0_kref+0x2a9c:   	fxors	%f24, %f19, %f12
	.word	0x81868000	! t0_kref+0x2aa0:   	wr	%i2, %g0, %y
	.word	0xa1a00058	! t0_kref+0x2aa4:   	fmovd	%f24, %f16
	.word	0x81858000	! t0_kref+0x2aa8:   	wr	%l6, %g0, %y
	.word	0xda400019	! t0_kref+0x2aac:   	ldsw	[%g0 + %i1], %o5
	.word	0xadb34280	! t0_kref+0x2ab0:   	array32	%o5, %g0, %l6
	.word	0xc768a043	! t0_kref+0x2ab4:   	prefetch	%g2 + 0x43, 3
	.word	0xa1a0192f	! t0_kref+0x2ab8:   	fstod	%f15, %f16
	.word	0xe01e2000	! t0_kref+0x2abc:   	ldd	[%i0], %l0
	.word	0xda20a03c	! t0_kref+0x2ac0:   	st	%o5, [%g2 + 0x3c]
	.word	0xe600a028	! t0_kref+0x2ac4:   	ld	[%g2 + 0x28], %l3
	.word	0xe01e2008	! t0_kref+0x2ac8:   	ldd	[%i0 + 8], %l0
	.word	0xee067ff0	! t0_kref+0x2acc:   	ld	[%i1 - 0x10], %l7
	.word	0xafb40af2	! t0_kref+0x2ad0:   	fpsub32s	%f16, %f18, %f23
	.word	0x81ac0ad4	! t0_kref+0x2ad4:   	fcmped	%fcc0, %f16, %f20
	.word	0x36480008	! t0_kref+0x2ad8:   	bge,a,pt	%icc, _kref+0x2af8
	.word	0x963a8000	! t0_kref+0x2adc:   	not	%o2, %o3
	.word	0xe6566018	! t0_kref+0x2ae0:   	ldsh	[%i1 + 0x18], %l3
	.word	0x95b4cea0	! t0_kref+0x2ae4:   	fsrc1s	%f19, %f10
	.word	0xee4e7fe6	! t0_kref+0x2ae8:   	ldsb	[%i1 - 0x1a], %l7
	.word	0xe3b8a080	! t0_kref+0x2aec:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xddb81019	! t0_kref+0x2af0:   	stda	%f14, [%g0 + %i1]0x80
	.word	0xe11e2018	! t0_kref+0x2af4:   	ldd	[%i0 + 0x18], %f16
	.word	0xf436c019	! t0_kref+0x2af8:   	sth	%i2, [%i3 + %i1]
	.word	0x291fbc09	! t0_kref+0x2afc:   	sethi	%hi(0x7ef02400), %l4
	.word	0x3e480002	! t0_kref+0x2b00:   	bvc,a,pt	%icc, _kref+0x2b08
	.word	0xb3a00130	! t0_kref+0x2b04:   	fabss	%f16, %f25
	.word	0x91a00552	! t0_kref+0x2b08:   	fsqrtd	%f18, %f8
	.word	0x91a28948	! t0_kref+0x2b0c:   	fmuld	%f10, %f8, %f8
	.word	0x2c480005	! t0_kref+0x2b10:   	bneg,a,pt	%icc, _kref+0x2b24
	.word	0xe8480018	! t0_kref+0x2b14:   	ldsb	[%g0 + %i0], %l4
	.word	0xadb44c76	! t0_kref+0x2b18:   	fnors	%f17, %f22, %f22
	.word	0xd7f61015	! t0_kref+0x2b1c:   	casxa	[%i0]0x80, %l5, %o3
	.word	0xac2a000b	! t0_kref+0x2b20:   	andn	%o0, %o3, %l6
	.word	0xa1a0002b	! t0_kref+0x2b24:   	fmovs	%f11, %f16
	.word	0xe3b8a080	! t0_kref+0x2b28:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xa9a2082c	! t0_kref+0x2b2c:   	fadds	%f8, %f12, %f20
	.word	0x9fc00004	! t0_kref+0x2b30:   	call	%g0 + %g4
	.word	0xa9b50c6d	! t0_kref+0x2b34:   	fnors	%f20, %f13, %f20
	.word	0x95a000ad	! t0_kref+0x2b38:   	fnegs	%f13, %f10
	.word	0x23480002	! t0_kref+0x2b3c:   	fbne,a,pt	%fcc0, _kref+0x2b44
	.word	0xc12e7fe4	! t0_kref+0x2b40:   	st	%fsr, [%i1 - 0x1c]
	.word	0x9e803f94	! t0_kref+0x2b44:   	addcc	%g0, -0x6c, %o7
	.word	0x95a548b7	! t0_kref+0x2b48:   	fsubs	%f21, %f23, %f10
	.word	0xee267fe4	! t0_kref+0x2b4c:   	st	%l7, [%i1 - 0x1c]
	.word	0xa1a208b8	! t0_kref+0x2b50:   	fsubs	%f8, %f24, %f16
	.word	0x81ad0a54	! t0_kref+0x2b54:   	fcmpd	%fcc0, %f20, %f20
	.word	0xe5263ff0	! t0_kref+0x2b58:   	st	%f18, [%i0 - 0x10]
	.word	0xb1a0004e	! t0_kref+0x2b5c:   	fmovd	%f14, %f24
	.word	0x24480008	! t0_kref+0x2b60:   	ble,a,pt	%icc, _kref+0x2b80
	.word	0x93a01a4c	! t0_kref+0x2b64:   	fdtoi	%f12, %f9
	.word	0xa3b50498	! t0_kref+0x2b68:   	fcmple32	%f20, %f24, %l1
	.word	0xacf2c01a	! t0_kref+0x2b6c:   	udivcc	%o3, %i2, %l6
	.word	0xdd26001c	! t0_kref+0x2b70:   	st	%f14, [%i0 + %i4]
	.word	0xec360000	! t0_kref+0x2b74:   	sth	%l6, [%i0]
	.word	0x95b48ae8	! t0_kref+0x2b78:   	fpsub32s	%f18, %f8, %f10
	.word	0xa0f37e04	! t0_kref+0x2b7c:   	udivcc	%o5, -0x1fc, %l0
	.word	0xa9b3012b	! t0_kref+0x2b80:   	edge32n	%o4, %o3, %l4
	.word	0xa6f039b9	! t0_kref+0x2b84:   	udivcc	%g0, -0x647, %l3
	.word	0x99a01931	! t0_kref+0x2b88:   	fstod	%f17, %f12
	.word	0x9da309b2	! t0_kref+0x2b8c:   	fdivs	%f12, %f18, %f14
	.word	0xadb30057	! t0_kref+0x2b90:   	edge8l	%o4, %l7, %l6
	.word	0xb1a3c836	! t0_kref+0x2b94:   	fadds	%f15, %f22, %f24
	.word	0x91380017	! t0_kref+0x2b98:   	sra	%g0, %l7, %o0
	.word	0xa7b28a6b	! t0_kref+0x2b9c:   	fpadd32s	%f10, %f11, %f19
	.word	0x9a76b3ae	! t0_kref+0x2ba0:   	udiv	%i2, -0xc52, %o5
	.word	0xc76e3fe0	! t0_kref+0x2ba4:   	prefetch	%i0 - 0x20, 3
	.word	0xadb2098a	! t0_kref+0x2ba8:   	bshuffle	%f8, %f10, %f22
	.word	0xa9b50c58	! t0_kref+0x2bac:   	fnor	%f20, %f24, %f20
	.word	0xada018cc	! t0_kref+0x2bb0:   	fdtos	%f12, %f22
	.word	0xe64e8019	! t0_kref+0x2bb4:   	ldsb	[%i2 + %i1], %l3
	.word	0xed20a01c	! t0_kref+0x2bb8:   	st	%f22, [%g2 + 0x1c]
	.word	0xa322610e	! t0_kref+0x2bbc:   	mulscc	%o1, 0x10e, %l1
	.word	0xd24e0000	! t0_kref+0x2bc0:   	ldsb	[%i0], %o1
	.word	0x8143e040	! t0_kref+0x2bc4:   	membar	0x40
	.word	0x37800001	! t0_kref+0x2bc8:   	fbge,a	_kref+0x2bcc
	.word	0xb3a2482d	! t0_kref+0x2bcc:   	fadds	%f9, %f13, %f25
	.word	0x9da589ce	! t0_kref+0x2bd0:   	fdivd	%f22, %f14, %f14
	.word	0x97b30eed	! t0_kref+0x2bd4:   	fornot2s	%f12, %f13, %f11
	.word	0xa1a0052d	! t0_kref+0x2bd8:   	fsqrts	%f13, %f16
	.word	0x2b3df7ba	! t0_kref+0x2bdc:   	sethi	%hi(0xf7dee800), %l5
	.word	0xeac65000	! t0_kref+0x2be0:   	ldswa	[%i1]0x80, %l5
	.word	0xaec28016	! t0_kref+0x2be4:   	addccc	%o2, %l6, %l7
	.word	0x81abca38	! t0_kref+0x2be8:   	fcmps	%fcc0, %f15, %f24
	.word	0xd656c019	! t0_kref+0x2bec:   	ldsh	[%i3 + %i1], %o3
	.word	0xf9ee501c	! t0_kref+0x2bf0:   	prefetcha	%i1 + %i4, 28
	.word	0xd426200c	! t0_kref+0x2bf4:   	st	%o2, [%i0 + 0xc]
	.word	0x30480006	! t0_kref+0x2bf8:   	ba,a,pt	%icc, _kref+0x2c10
	.word	0x9da20852	! t0_kref+0x2bfc:   	faddd	%f8, %f18, %f14
	.word	0xf83e401d	! t0_kref+0x2c00:   	std	%i4, [%i1 + %i5]
	.word	0xd59e501d	! t0_kref+0x2c04:   	ldda	[%i1 + %i5]0x80, %f10
	.word	0x22480004	! t0_kref+0x2c08:   	be,a,pt	%icc, _kref+0x2c18
	.word	0xa292400a	! t0_kref+0x2c0c:   	orcc	%o1, %o2, %l1
	.word	0xdd3e0000	! t0_kref+0x2c10:   	std	%f14, [%i0]
	.word	0xa5b30f88	! t0_kref+0x2c14:   	for	%f12, %f8, %f18
	.word	0x25144994	! t0_kref+0x2c18:   	sethi	%hi(0x51265000), %l2
	.word	0x30800006	! t0_kref+0x2c1c:   	ba,a	_kref+0x2c34
	.word	0xada409ab	! t0_kref+0x2c20:   	fdivs	%f16, %f11, %f22
	.word	0x9da0004e	! t0_kref+0x2c24:   	fmovd	%f14, %f14
	.word	0x28800001	! t0_kref+0x2c28:   	bleu,a	_kref+0x2c2c
	.word	0xe49e501d	! t0_kref+0x2c2c:   	ldda	[%i1 + %i5]0x80, %l2
	.word	0xe120a024	! t0_kref+0x2c30:   	st	%f16, [%g2 + 0x24]
	.word	0xd20e8019	! t0_kref+0x2c34:   	ldub	[%i2 + %i1], %o1
	.word	0x940a24eb	! t0_kref+0x2c38:   	and	%o0, 0x4eb, %o2
	.word	0xa1b38f4c	! t0_kref+0x2c3c:   	fornot1	%f14, %f12, %f16
	.word	0xa1a608ad	! t0_kref+0x2c40:   	fsubs	%f24, %f13, %f16
	.word	0xae830009	! t0_kref+0x2c44:   	addcc	%o4, %o1, %l7
	.word	0xd45e3ff8	! t0_kref+0x2c48:   	ldx	[%i0 - 8], %o2
	.word	0x81850000	! t0_kref+0x2c4c:   	wr	%l4, %g0, %y
	.word	0xa1b40acc	! t0_kref+0x2c50:   	fpsub32	%f16, %f12, %f16
	.word	0x91b60998	! t0_kref+0x2c54:   	bshuffle	%f24, %f24, %f8
	.word	0x28480001	! t0_kref+0x2c58:   	bleu,a,pt	%icc, _kref+0x2c5c
	.word	0xef68a084	! t0_kref+0x2c5c:   	prefetch	%g2 + 0x84, 23
	.word	0x31480004	! t0_kref+0x2c60:   	fba,a,pt	%fcc0, _kref+0x2c70
	.word	0x9293273a	! t0_kref+0x2c64:   	orcc	%o4, 0x73a, %o1
	.word	0xaba0002c	! t0_kref+0x2c68:   	fmovs	%f12, %f21
	.word	0xa9a648b1	! t0_kref+0x2c6c:   	fsubs	%f25, %f17, %f20
	.word	0xd886501c	! t0_kref+0x2c70:   	lda	[%i1 + %i4]0x80, %o4
	.word	0x2c480002	! t0_kref+0x2c74:   	bneg,a,pt	%icc, _kref+0x2c7c
	.word	0x8143c000	! t0_kref+0x2c78:   	stbar
	.word	0xd7264000	! t0_kref+0x2c7c:   	st	%f11, [%i1]
	.word	0xd8c65000	! t0_kref+0x2c80:   	ldswa	[%i1]0x80, %o4
	.word	0x98268014	! t0_kref+0x2c84:   	sub	%i2, %l4, %o4
	.word	0x9fb50d2c	! t0_kref+0x2c88:   	fandnot1s	%f20, %f12, %f15
	.word	0xb1a00556	! t0_kref+0x2c8c:   	fsqrtd	%f22, %f24
	.word	0x2e480003	! t0_kref+0x2c90:   	bvs,a,pt	%icc, _kref+0x2c9c
	.word	0xafb58ded	! t0_kref+0x2c94:   	fnands	%f22, %f13, %f23
	.word	0xa5a0054c	! t0_kref+0x2c98:   	fsqrtd	%f12, %f18
	.word	0x99a00033	! t0_kref+0x2c9c:   	fmovs	%f19, %f12
	.word	0x2b26e03d	! t0_kref+0x2ca0:   	sethi	%hi(0x9b80f400), %l5
	.word	0xa4fa4009	! t0_kref+0x2ca4:   	sdivcc	%o1, %o1, %l2
	.word	0xd426201c	! t0_kref+0x2ca8:   	st	%o2, [%i0 + 0x1c]
	.word	0xb3a018ca	! t0_kref+0x2cac:   	fdtos	%f10, %f25
	.word	0xb1b60ace	! t0_kref+0x2cb0:   	fpsub32	%f24, %f14, %f24
	.word	0x94a82251	! t0_kref+0x2cb4:   	andncc	%g0, 0x251, %o2
	.word	0x8143c000	! t0_kref+0x2cb8:   	stbar
	.word	0x30480001	! t0_kref+0x2cbc:   	ba,a,pt	%icc, _kref+0x2cc0
	.word	0xd65e6000	! t0_kref+0x2cc0:   	ldx	[%i1], %o3
	.word	0xaa0ee143	! t0_kref+0x2cc4:   	and	%i3, 0x143, %l5
	.word	0xa5b2c280	! t0_kref+0x2cc8:   	array32	%o3, %g0, %l2
	.word	0xaba24835	! t0_kref+0x2ccc:   	fadds	%f9, %f21, %f21
	.word	0x97a2c8a8	! t0_kref+0x2cd0:   	fsubs	%f11, %f8, %f11
	.word	0xc1e6100a	! t0_kref+0x2cd4:   	casa	[%i0]0x80, %o2, %g0
	.word	0x95b00f08	! t0_kref+0x2cd8:   	fsrc2	%f8, %f10
	.word	0xa9b38988	! t0_kref+0x2cdc:   	bshuffle	%f14, %f8, %f20
	.word	0xf96e3fe8	! t0_kref+0x2ce0:   	prefetch	%i0 - 0x18, 28
	.word	0x9da00558	! t0_kref+0x2ce4:   	fsqrtd	%f24, %f14
	.word	0xaba408aa	! t0_kref+0x2ce8:   	fsubs	%f16, %f10, %f21
	.word	0xd408a033	! t0_kref+0x2cec:   	ldub	[%g2 + 0x33], %o2
	.word	0xadb30756	! t0_kref+0x2cf0:   	fpack32	%f12, %f22, %f22
	.word	0x86102013	! t0_kref+0x2cf4:   	mov	0x13, %g3
	.word	0x86a0e001	! t0_kref+0x2cf8:   	subcc	%g3, 1, %g3
	.word	0x2280000a	! t0_kref+0x2cfc:   	be,a	_kref+0x2d24
	.word	0x983a2a09	! t0_kref+0x2d00:   	xnor	%o0, 0xa09, %o4
	.word	0xea48a00b	! t0_kref+0x2d04:   	ldsb	[%g2 + 0xb], %l5
	.word	0xd64e3fef	! t0_kref+0x2d08:   	ldsb	[%i0 - 0x11], %o3
	.word	0x91a58d36	! t0_kref+0x2d0c:   	fsmuld	%f22, %f22, %f8
	.word	0x9da00030	! t0_kref+0x2d10:   	fmovs	%f16, %f14
	.word	0xdb270018	! t0_kref+0x2d14:   	st	%f13, [%i4 + %i0]
	.word	0xd28e5000	! t0_kref+0x2d18:   	lduba	[%i1]0x80, %o1
	.word	0xe2062004	! t0_kref+0x2d1c:   	ld	[%i0 + 4], %l1
	.word	0x2f800004	! t0_kref+0x2d20:   	fbu,a	_kref+0x2d30
	.word	0x99a01930	! t0_kref+0x2d24:   	fstod	%f16, %f12
	.word	0x95a308ac	! t0_kref+0x2d28:   	fsubs	%f12, %f12, %f10
	.word	0xa4b22210	! t0_kref+0x2d2c:   	orncc	%o0, 0x210, %l2
	.word	0x9ba288ae	! t0_kref+0x2d30:   	fsubs	%f10, %f14, %f13
	.word	0xa5b38e6e	! t0_kref+0x2d34:   	fxnors	%f14, %f14, %f18
	.word	0xadb48af1	! t0_kref+0x2d38:   	fpsub32s	%f18, %f17, %f22
	.word	0xe3b8a040	! t0_kref+0x2d3c:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x81824000	! t0_kref+0x2d40:   	wr	%o1, %g0, %y
	.word	0xa2b2c009	! t0_kref+0x2d44:   	orncc	%o3, %o1, %l1
	.word	0x81b01027	! t0_kref+0x2d48:   	siam	0x7
	.word	0xc12e001c	! t0_kref+0x2d4c:   	st	%fsr, [%i0 + %i4]
	.word	0x3b800003	! t0_kref+0x2d50:   	fble,a	_kref+0x2d5c
	.word	0x91a88056	! t0_kref+0x2d54:   	fmovdlg	%fcc0, %f22, %f8
	.word	0x9416b3c7	! t0_kref+0x2d58:   	or	%i2, -0xc39, %o2
	.word	0x9af5616b	! t0_kref+0x2d5c:   	udivcc	%l5, 0x16b, %o5
	.word	0xa83ec00d	! t0_kref+0x2d60:   	xnor	%i3, %o5, %l4
	.word	0xd9beda58	! t0_kref+0x2d64:   	stda	%f12, [%i3 + %i0]0xd2
	.word	0x9626fe15	! t0_kref+0x2d68:   	sub	%i3, -0x1eb, %o3
	.word	0x34480004	! t0_kref+0x2d6c:   	bg,a,pt	%icc, _kref+0x2d7c
	.word	0xa8980008	! t0_kref+0x2d70:   	xorcc	%g0, %o0, %l4
	.word	0xa5a01a56	! t0_kref+0x2d74:   	fdtoi	%f22, %f18
	.word	0xd0266008	! t0_kref+0x2d78:   	st	%o0, [%i1 + 8]
	.word	0x942ec01b	! t0_kref+0x2d7c:   	andn	%i3, %i3, %o2
	.word	0xa615c015	! t0_kref+0x2d80:   	or	%l7, %l5, %l3
	.word	0xd53e4000	! t0_kref+0x2d84:   	std	%f10, [%i1]
	.word	0x99a01a56	! t0_kref+0x2d88:   	fdtoi	%f22, %f12
	.word	0xa3a01a48	! t0_kref+0x2d8c:   	fdtoi	%f8, %f17
	.word	0xf6362006	! t0_kref+0x2d90:   	sth	%i3, [%i0 + 6]
	.word	0xf3064000	! t0_kref+0x2d94:   	ld	[%i1], %f25
	.word	0xa92b000d	! t0_kref+0x2d98:   	sll	%o4, %o5, %l4
	.word	0xae2d400b	! t0_kref+0x2d9c:   	andn	%l5, %o3, %l7
	.word	0xde50a032	! t0_kref+0x2da0:   	ldsh	[%g2 + 0x32], %o7
	.word	0xe9267fe8	! t0_kref+0x2da4:   	st	%f20, [%i1 - 0x18]
	.word	0xa8f6a0c4	! t0_kref+0x2da8:   	udivcc	%i2, 0xc4, %l4
	.word	0x36800008	! t0_kref+0x2dac:   	bge,a	_kref+0x2dcc
	.word	0xf19e9a18	! t0_kref+0x2db0:   	ldda	[%i2 + %i0]0xd0, %f24
	.word	0x92bd6c5b	! t0_kref+0x2db4:   	xnorcc	%l5, 0xc5b, %o1
	.word	0x9da2cd39	! t0_kref+0x2db8:   	fsmuld	%f11, %f25, %f14
	.word	0xb1b38d08	! t0_kref+0x2dbc:   	fandnot1	%f14, %f8, %f24
	.word	0xada4482b	! t0_kref+0x2dc0:   	fadds	%f17, %f11, %f22
	.word	0x8143c000	! t0_kref+0x2dc4:   	stbar
	.word	0xf11fbda8	! t0_kref+0x2dc8:   	ldd	[%fp - 0x258], %f24
	.word	0x8182c000	! t0_kref+0x2dcc:   	wr	%o3, %g0, %y
	.word	0x9fc00004	! t0_kref+0x2dd0:   	call	%g0 + %g4
	.word	0xaba0052b	! t0_kref+0x2dd4:   	fsqrts	%f11, %f21
	.word	0xe656001b	! t0_kref+0x2dd8:   	ldsh	[%i0 + %i3], %l3
	.word	0xabb20280	! t0_kref+0x2ddc:   	array32	%o0, %g0, %l5
	.word	0x3d800006	! t0_kref+0x2de0:   	fbule,a	_kref+0x2df8
	.word	0xf1be1894	! t0_kref+0x2de4:   	stda	%f24, [%i0 + %l4]0xc4
	.word	0xd410a018	! t0_kref+0x2de8:   	lduh	[%g2 + 0x18], %o2
	.word	0x973a601b	! t0_kref+0x2dec:   	sra	%o1, 0x1b, %o3
	.word	0xe01e7fe0	! t0_kref+0x2df0:   	ldd	[%i1 - 0x20], %l0
	.word	0x95227ec6	! t0_kref+0x2df4:   	mulscc	%o1, -0x13a, %o2
	.word	0x9fa20837	! t0_kref+0x2df8:   	fadds	%f8, %f23, %f15
	.word	0x28480003	! t0_kref+0x2dfc:   	bleu,a,pt	%icc, _kref+0x2e08
	.word	0x9b40c000	! t0_kref+0x2e00:   	mov	%asi, %o5
	.word	0xfd6e001c	! t0_kref+0x2e04:   	prefetch	%i0 + %i4, 30
	.word	0xa5a3094e	! t0_kref+0x2e08:   	fmuld	%f12, %f14, %f18
	.word	0x91a00031	! t0_kref+0x2e0c:   	fmovs	%f17, %f8
	.word	0x9da01897	! t0_kref+0x2e10:   	fitos	%f23, %f14
	.word	0x8143c000	! t0_kref+0x2e14:   	stbar
	.word	0xed266018	! t0_kref+0x2e18:   	st	%f22, [%i1 + 0x18]
	.word	0x81acca2e	! t0_kref+0x2e1c:   	fcmps	%fcc0, %f19, %f14
	.word	0xd66e6007	! t0_kref+0x2e20:   	ldstub	[%i1 + 7], %o3
	.word	0x27137b39	! t0_kref+0x2e24:   	sethi	%hi(0x4dece400), %l3
	.word	0x9a26f606	! t0_kref+0x2e28:   	sub	%i3, -0x9fa, %o5
	.word	0xa606800c	! t0_kref+0x2e2c:   	add	%i2, %o4, %l3
	.word	0xa045801b	! t0_kref+0x2e30:   	addc	%l6, %i3, %l0
	.word	0x95b3854a	! t0_kref+0x2e34:   	fcmpeq16	%f14, %f10, %o2
	.word	0x81ae0aca	! t0_kref+0x2e38:   	fcmped	%fcc0, %f24, %f10
	.word	0x3c480005	! t0_kref+0x2e3c:   	bpos,a,pt	%icc, _kref+0x2e50
	.word	0xd5200018	! t0_kref+0x2e40:   	st	%f10, [%g0 + %i0]
	.word	0xa9b2cea0	! t0_kref+0x2e44:   	fsrc1s	%f11, %f20
	.word	0xaae6b2f3	! t0_kref+0x2e48:   	subccc	%i2, -0xd0d, %l5
	.word	0xa2d50009	! t0_kref+0x2e4c:   	umulcc	%l4, %o1, %l1
	.word	0xfdee501b	! t0_kref+0x2e50:   	prefetcha	%i1 + %i3, 30
	.word	0xd440a004	! t0_kref+0x2e54:   	ldsw	[%g2 + 4], %o2
	.word	0x2338574d	! t0_kref+0x2e58:   	sethi	%hi(0xe15d3400), %l1
	.word	0x001fffff	! t0_kref+0x2e5c:   	illtrap	0x1fffff
	.word	0x81ab8ace	! t0_kref+0x2e60:   	fcmped	%fcc0, %f14, %f14
	.word	0x81ab8ad4	! t0_kref+0x2e64:   	fcmped	%fcc0, %f14, %f20
	.word	0xa3a01a52	! t0_kref+0x2e68:   	fdtoi	%f18, %f17
	.word	0x81aaca34	! t0_kref+0x2e6c:   	fcmps	%fcc0, %f11, %f20
	.word	0xaeb5c008	! t0_kref+0x2e70:   	orncc	%l7, %o0, %l7
	.word	0xadb307ca	! t0_kref+0x2e74:   	pdist	%f12, %f10, %f22
	.word	0x99b28a14	! t0_kref+0x2e78:   	fpadd16	%f10, %f20, %f12
	.word	0xde467ff8	! t0_kref+0x2e7c:   	ldsw	[%i1 - 8], %o7
	.word	0xb1a0102b	! t0_kref+0x2e80:   	fstox	%f11, %f24
	.word	0xa82ea055	! t0_kref+0x2e84:   	andn	%i2, 0x55, %l4
	.word	0xafb5c00a	! t0_kref+0x2e88:   	edge8	%l7, %o2, %l7
	.word	0x9da449b7	! t0_kref+0x2e8c:   	fdivs	%f17, %f23, %f14
	.word	0x942dab65	! t0_kref+0x2e90:   	andn	%l6, 0xb65, %o2
	.word	0x9de3bfa0	! t0_kref+0x2e94:   	save	%sp, -0x60, %sp
	.word	0x8106be58	! t0_kref+0x2e98:   	taddcc	%i2, -0x1a8, %g0
	.word	0xabeec01d	! t0_kref+0x2e9c:   	restore	%i3, %i5, %l5
	.word	0x96b2000d	! t0_kref+0x2ea0:   	orncc	%o0, %o5, %o3
	.word	0xa1a0054e	! t0_kref+0x2ea4:   	fsqrtd	%f14, %f16
	.word	0xa126c015	! t0_kref+0x2ea8:   	mulscc	%i3, %l5, %l0
	.word	0x95a01a56	! t0_kref+0x2eac:   	fdtoi	%f22, %f10
	.word	0xfd6e001d	! t0_kref+0x2eb0:   	prefetch	%i0 + %i5, 30
	.word	0x9ba2882a	! t0_kref+0x2eb4:   	fadds	%f10, %f10, %f13
	.word	0x8143e040	! t0_kref+0x2eb8:   	membar	0x40
	.word	0x26480001	! t0_kref+0x2ebc:   	bl,a,pt	%icc, _kref+0x2ec0
	.word	0xada30d38	! t0_kref+0x2ec0:   	fsmuld	%f12, %f24, %f22
	.word	0xb3b28df2	! t0_kref+0x2ec4:   	fnands	%f10, %f18, %f25
	.word	0xde0e001a	! t0_kref+0x2ec8:   	ldub	[%i0 + %i2], %o7
	.word	0x9fb50c75	! t0_kref+0x2ecc:   	fnors	%f20, %f21, %f15
	.word	0x93a000b1	! t0_kref+0x2ed0:   	fnegs	%f17, %f9
	.word	0xe400a028	! t0_kref+0x2ed4:   	ld	[%g2 + 0x28], %l2
	.word	0x22480002	! t0_kref+0x2ed8:   	be,a,pt	%icc, _kref+0x2ee0
	.word	0xfd3f4005	! t0_kref+0x2edc:   	std	%f30, [%i5 + %g5]
	.word	0xa9b64ef9	! t0_kref+0x2ee0:   	fornot2s	%f25, %f25, %f20
	.word	0x97200009	! t0_kref+0x2ee4:   	mulscc	%g0, %o1, %o3
	.word	0xec160000	! t0_kref+0x2ee8:   	lduh	[%i0], %l6
	.word	0xaaaa401b	! t0_kref+0x2eec:   	andncc	%o1, %i3, %l5
	.word	0xd6680019	! t0_kref+0x2ef0:   	ldstub	[%g0 + %i1], %o3
	.word	0x93a01888	! t0_kref+0x2ef4:   	fitos	%f8, %f9
	.word	0xa3b30cb2	! t0_kref+0x2ef8:   	fandnot2s	%f12, %f18, %f17
	.word	0xe900a00c	! t0_kref+0x2efc:   	ld	[%g2 + 0xc], %f20
	.word	0xada24833	! t0_kref+0x2f00:   	fadds	%f9, %f19, %f22
	.word	0x81824000	! t0_kref+0x2f04:   	wr	%o1, %g0, %y
	.word	0x909eee56	! t0_kref+0x2f08:   	xorcc	%i3, 0xe56, %o0
	.word	0xd9260000	! t0_kref+0x2f0c:   	st	%f12, [%i0]
	.word	0x2a480007	! t0_kref+0x2f10:   	bcs,a,pt	%icc, _kref+0x2f2c
	.word	0xf43e001d	! t0_kref+0x2f14:   	std	%i2, [%i0 + %i5]
	.word	0xa7a01a37	! t0_kref+0x2f18:   	fstoi	%f23, %f19
	.word	0xa786c014	! t0_kref+0x2f1c:   	wr	%i3, %l4, %gsr
	.word	0xda4e7ff7	! t0_kref+0x2f20:   	ldsb	[%i1 - 9], %o5
	.word	0xff6e7ff0	! t0_kref+0x2f24:   	prefetch	%i1 - 0x10, 31
	.word	0xe168a00f	! t0_kref+0x2f28:   	prefetch	%g2 + 0xf, 16
	.word	0xec7e7ffc	! t0_kref+0x2f2c:   	swap	[%i1 - 4], %l6
	.word	0x95a6094e	! t0_kref+0x2f30:   	fmuld	%f24, %f14, %f10
	.word	0x38480004	! t0_kref+0x2f34:   	bgu,a,pt	%icc, _kref+0x2f44
	.word	0xc3ee1015	! t0_kref+0x2f38:   	prefetcha	%i0 + %l5, 1
	.word	0x99a28848	! t0_kref+0x2f3c:   	faddd	%f10, %f8, %f12
	.word	0x9628286b	! t0_kref+0x2f40:   	andn	%g0, 0x86b, %o3
	.word	0xa9b6c13a	! t0_kref+0x2f44:   	edge32n	%i3, %i2, %l4
	.word	0xb1a0190a	! t0_kref+0x2f48:   	fitod	%f10, %f24
	.word	0x9da000d2	! t0_kref+0x2f4c:   	fnegd	%f18, %f14
	.word	0x95a0054e	! t0_kref+0x2f50:   	fsqrtd	%f14, %f10
	.word	0x9de3bfa0	! t0_kref+0x2f54:   	save	%sp, -0x60, %sp
	.word	0x80102947	! t0_kref+0x2f58:   	mov	0x947, %g0
	.word	0xa9ee7734	! t0_kref+0x2f5c:   	restore	%i1, -0x8cc, %l4
	.word	0x34800002	! t0_kref+0x2f60:   	bg,a	_kref+0x2f68
	.word	0x9ba018c8	! t0_kref+0x2f64:   	fdtos	%f8, %f13
	.word	0xa9a389ae	! t0_kref+0x2f68:   	fdivs	%f14, %f14, %f20
	.word	0xa4fafdfe	! t0_kref+0x2f6c:   	sdivcc	%o3, -0x202, %l2
	.word	0xf436c019	! t0_kref+0x2f70:   	sth	%i2, [%i3 + %i1]
	.word	0x3e800005	! t0_kref+0x2f74:   	bvc,a	_kref+0x2f88
	.word	0xa9b60754	! t0_kref+0x2f78:   	fpack32	%f24, %f20, %f20
	.word	0xa7b48e6e	! t0_kref+0x2f7c:   	fxnors	%f18, %f14, %f19
	.word	0x24800001	! t0_kref+0x2f80:   	ble,a	_kref+0x2f84
	.word	0x81858000	! t0_kref+0x2f84:   	wr	%l6, %g0, %y
	.word	0xad320009	! t0_kref+0x2f88:   	srl	%o0, %o1, %l6
	.word	0xc3ee5015	! t0_kref+0x2f8c:   	prefetcha	%i1 + %l5, 1
	.word	0xada01a28	! t0_kref+0x2f90:   	fstoi	%f8, %f22
	.word	0xaa92fb19	! t0_kref+0x2f94:   	orcc	%o3, -0x4e7, %l5
	.word	0x3c480008	! t0_kref+0x2f98:   	bpos,a,pt	%icc, _kref+0x2fb8
	.word	0xa8ad3e2f	! t0_kref+0x2f9c:   	andncc	%l4, -0x1d1, %l4
	.word	0xe9e6500b	! t0_kref+0x2fa0:   	casa	[%i1]0x80, %o3, %l4
	.word	0x81ab0a39	! t0_kref+0x2fa4:   	fcmps	%fcc0, %f12, %f25
	.word	0xf1ee501c	! t0_kref+0x2fa8:   	prefetcha	%i1 + %i4, 24
	.word	0x98ddf024	! t0_kref+0x2fac:   	smulcc	%l7, -0xfdc, %o4
	.word	0xe7262004	! t0_kref+0x2fb0:   	st	%f19, [%i0 + 4]
	.word	0xea00a030	! t0_kref+0x2fb4:   	ld	[%g2 + 0x30], %l5
	.word	0x9740c000	! t0_kref+0x2fb8:   	mov	%asi, %o3
	.word	0x81aa0a50	! t0_kref+0x2fbc:   	fcmpd	%fcc0, %f8, %f16
	.word	0xe5981019	! t0_kref+0x2fc0:   	ldda	[%g0 + %i1]0x80, %f18
	.word	0xe64e601d	! t0_kref+0x2fc4:   	ldsb	[%i1 + 0x1d], %l3
	.word	0x9de3bfa0	! t0_kref+0x2fc8:   	save	%sp, -0x60, %sp
	.word	0xb0aec018	! t0_kref+0x2fcc:   	andncc	%i3, %i0, %i0
	.word	0x95e82f50	! t0_kref+0x2fd0:   	restore	%g0, 0xf50, %o2
	.word	0x3c480008	! t0_kref+0x2fd4:   	bpos,a,pt	%icc, _kref+0x2ff4
	.word	0x920a0014	! t0_kref+0x2fd8:   	and	%o0, %l4, %o1
	.word	0x97a01a50	! t0_kref+0x2fdc:   	fdtoi	%f16, %f11
	.word	0x97b58e32	! t0_kref+0x2fe0:   	fands	%f22, %f18, %f11
	.word	0xa9a01892	! t0_kref+0x2fe4:   	fitos	%f18, %f20
	.word	0xef00a004	! t0_kref+0x2fe8:   	ld	[%g2 + 4], %f23
	.word	0xdfa01019	! t0_kref+0x2fec:   	sta	%f15, [%g0 + %i1]0x80
	.word	0x81820000	! t0_kref+0x2ff0:   	wr	%o0, %g0, %y
	.word	0xe81e401d	! t0_kref+0x2ff4:   	ldd	[%i1 + %i5], %l4
	.word	0xd9067fe0	! t0_kref+0x2ff8:   	ld	[%i1 - 0x20], %f12
	.word	0x8143e016	! t0_kref+0x2ffc:   	membar	0x16
	.word	0xee066014	! t0_kref+0x3000:   	ld	[%i1 + 0x14], %l7
	.word	0xb1a0102c	! t0_kref+0x3004:   	fstox	%f12, %f24
	.word	0xa7a00138	! t0_kref+0x3008:   	fabss	%f24, %f19
	.word	0x81ae0ad0	! t0_kref+0x300c:   	fcmped	%fcc0, %f24, %f16
	.word	0xa9b5c06d	! t0_kref+0x3010:   	edge8ln	%l7, %o5, %l4
	.word	0xf1be1a5c	! t0_kref+0x3014:   	stda	%f24, [%i0 + %i4]0xd2
	.word	0xfd6e6010	! t0_kref+0x3018:   	prefetch	%i1 + 0x10, 30
	.word	0xdd267fe8	! t0_kref+0x301c:   	st	%f14, [%i1 - 0x18]
	.word	0xd26e7fe1	! t0_kref+0x3020:   	ldstub	[%i1 - 0x1f], %o1
	.word	0xa1a2c836	! t0_kref+0x3024:   	fadds	%f11, %f22, %f16
	.word	0x9bb00cf3	! t0_kref+0x3028:   	fnot2s	%f19, %f13
	.word	0x90f3401b	! t0_kref+0x302c:   	udivcc	%o5, %i3, %o0
	.word	0x95a00554	! t0_kref+0x3030:   	fsqrtd	%f20, %f10
	.word	0xa9642366	! t0_kref+0x3034:   	movn	%icc, 0x366, %l4
	.word	0x99a018cc	! t0_kref+0x3038:   	fdtos	%f12, %f12
	.word	0xada00052	! t0_kref+0x303c:   	fmovd	%f18, %f22
	.word	0x112bf3ee	! t0_kref+0x3040:   	sethi	%hi(0xafcfb800), %o0
	.word	0xd44e3ff4	! t0_kref+0x3044:   	ldsb	[%i0 - 0xc], %o2
	.word	0x9fb54068	! t0_kref+0x3048:   	edge8ln	%l5, %o0, %o7
	.word	0xd04e3ff1	! t0_kref+0x304c:   	ldsb	[%i0 - 0xf], %o0
	.word	0xd610001b	! t0_kref+0x3050:   	lduh	[%g0 + %i3], %o3
	.word	0x91a01a54	! t0_kref+0x3054:   	fdtoi	%f20, %f8
	.word	0xd920a028	! t0_kref+0x3058:   	st	%f12, [%g2 + 0x28]
	.word	0xa6f2a7e7	! t0_kref+0x305c:   	udivcc	%o2, 0x7e7, %l3
	.word	0x81aa8ad6	! t0_kref+0x3060:   	fcmped	%fcc0, %f10, %f22
	.word	0xe66e2014	! t0_kref+0x3064:   	ldstub	[%i0 + 0x14], %l3
	.word	0x36800006	! t0_kref+0x3068:   	bge,a	_kref+0x3080
	.word	0xec40a004	! t0_kref+0x306c:   	ldsw	[%g2 + 4], %l6
	.word	0x81ab8ac8	! t0_kref+0x3070:   	fcmped	%fcc0, %f14, %f8
	.word	0x97a00536	! t0_kref+0x3074:   	fsqrts	%f22, %f11
	.word	0xd410a00e	! t0_kref+0x3078:   	lduh	[%g2 + 0xe], %o2
	.word	0xda40a00c	! t0_kref+0x307c:   	ldsw	[%g2 + 0xc], %o5
	.word	0xab3ea001	! t0_kref+0x3080:   	sra	%i2, 0x1, %l5
	.word	0x9ba01a2c	! t0_kref+0x3084:   	fstoi	%f12, %f13
	.word	0x8143e040	! t0_kref+0x3088:   	membar	0x40
	.word	0x20800001	! t0_kref+0x308c:   	bn,a	_kref+0x3090
	.word	0x95a01896	! t0_kref+0x3090:   	fitos	%f22, %f10
	.word	0xd51e6000	! t0_kref+0x3094:   	ldd	[%i1], %f10
	.word	0xda262004	! t0_kref+0x3098:   	st	%o5, [%i0 + 4]
	.word	0x81ab8ad4	! t0_kref+0x309c:   	fcmped	%fcc0, %f14, %f20
	.word	0x99b3848c	! t0_kref+0x30a0:   	fcmple32	%f14, %f12, %o4
	.word	0xae22800b	! t0_kref+0x30a4:   	sub	%o2, %o3, %l7
	.word	0x93a30828	! t0_kref+0x30a8:   	fadds	%f12, %f8, %f9
	.word	0x81acca35	! t0_kref+0x30ac:   	fcmps	%fcc0, %f19, %f21
	.word	0xe8000018	! t0_kref+0x30b0:   	ld	[%g0 + %i0], %l4
	.word	0x8610200a	! t0_kref+0x30b4:   	mov	0xa, %g3
	.word	0x86a0e001	! t0_kref+0x30b8:   	subcc	%g3, 1, %g3
	.word	0x2280001a	! t0_kref+0x30bc:   	be,a	_kref+0x3124
	.word	0x912ee00f	! t0_kref+0x30c0:   	sll	%i3, 0xf, %o0
	.word	0xaaa2400d	! t0_kref+0x30c4:   	subcc	%o1, %o5, %l5
	.word	0xa5b50a4a	! t0_kref+0x30c8:   	fpadd32	%f20, %f10, %f18
	.word	0xd7000019	! t0_kref+0x30cc:   	ld	[%g0 + %i1], %f11
	.word	0xda562008	! t0_kref+0x30d0:   	ldsh	[%i0 + 8], %o5
	.word	0x93a0002c	! t0_kref+0x30d4:   	fmovs	%f12, %f9
	.word	0xa5a01930	! t0_kref+0x30d8:   	fstod	%f16, %f18
	.word	0xaa16c017	! t0_kref+0x30dc:   	or	%i3, %l7, %l5
	.word	0x91b48994	! t0_kref+0x30e0:   	bshuffle	%f18, %f20, %f8
	.word	0xa69e8014	! t0_kref+0x30e4:   	xorcc	%i2, %l4, %l3
	.word	0xa8a80000	! t0_kref+0x30e8:   	andncc	%g0, %g0, %l4
	.word	0x81adca2b	! t0_kref+0x30ec:   	fcmps	%fcc0, %f23, %f11
	.word	0xafb20f69	! t0_kref+0x30f0:   	fornot1s	%f8, %f9, %f23
	.word	0x23800004	! t0_kref+0x30f4:   	fbne,a	_kref+0x3104
	.word	0xded6d019	! t0_kref+0x30f8:   	ldsha	[%i3 + %i1]0x80, %o7
	.word	0xdd3f4018	! t0_kref+0x30fc:   	std	%f14, [%i5 + %i0]
	.word	0xa7b5407b	! t0_kref+0x3100:   	edge8ln	%l5, %i3, %l3
	.word	0xa5a248b2	! t0_kref+0x3104:   	fsubs	%f9, %f18, %f18
	.word	0xd83e2008	! t0_kref+0x3108:   	std	%o4, [%i0 + 8]
	.word	0xae0aef03	! t0_kref+0x310c:   	and	%o3, 0xf03, %l7
	.word	0xd6000019	! t0_kref+0x3110:   	ld	[%g0 + %i1], %o3
	.word	0x193e7ece	! t0_kref+0x3114:   	sethi	%hi(0xf9fb3800), %o4
	.word	0xf11e7ff0	! t0_kref+0x3118:   	ldd	[%i1 - 0x10], %f24
	.word	0x97a01a58	! t0_kref+0x311c:   	fdtoi	%f24, %f11
	.word	0xe800a01c	! t0_kref+0x3120:   	ld	[%g2 + 0x1c], %l4
	.word	0x2e800008	! t0_kref+0x3124:   	bvs,a	_kref+0x3144
	.word	0xd448a03f	! t0_kref+0x3128:   	ldsb	[%g2 + 0x3f], %o2
	.word	0x9fa00035	! t0_kref+0x312c:   	fmovs	%f21, %f15
	.word	0x9486a4e6	! t0_kref+0x3130:   	addcc	%i2, 0x4e6, %o2
	.word	0x81ad8aad	! t0_kref+0x3134:   	fcmpes	%fcc0, %f22, %f13
	.word	0xa2c34009	! t0_kref+0x3138:   	addccc	%o5, %o1, %l1
	.word	0xa43aa04b	! t0_kref+0x313c:   	xnor	%o2, 0x4b, %l2
	.word	0xabb50af9	! t0_kref+0x3140:   	fpsub32s	%f20, %f25, %f21
	.word	0x91a2c82e	! t0_kref+0x3144:   	fadds	%f11, %f14, %f8
	.word	0xabb0017b	! t0_kref+0x3148:   	edge32ln	%g0, %i3, %l5
	.word	0xe93e4000	! t0_kref+0x314c:   	std	%f20, [%i1]
	.word	0xd7062014	! t0_kref+0x3150:   	ld	[%i0 + 0x14], %f11
	.word	0xaba00036	! t0_kref+0x3154:   	fmovs	%f22, %f21
	.word	0x87802082	! t0_kref+0x3158:   	mov	0x82, %asi
	.word	0xec6e2015	! t0_kref+0x315c:   	ldstub	[%i0 + 0x15], %l6
	.word	0x9e168017	! t0_kref+0x3160:   	or	%i2, %l7, %o7
	.word	0xb1a00038	! t0_kref+0x3164:   	fmovs	%f24, %f24
	.word	0x8143c000	! t0_kref+0x3168:   	stbar
	.word	0xef270019	! t0_kref+0x316c:   	st	%f23, [%i4 + %i1]
	.word	0x90b30017	! t0_kref+0x3170:   	orncc	%o4, %l7, %o0
	.word	0x81ae0a50	! t0_kref+0x3174:   	fcmpd	%fcc0, %f24, %f16
	.word	0x99a0192a	! t0_kref+0x3178:   	fstod	%f10, %f12
	.word	0x86102004	! t0_kref+0x317c:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x3180:   	bne,a	_kref+0x3180
	.word	0x86a0e001	! t0_kref+0x3184:   	subcc	%g3, 1, %g3
	.word	0x2f800003	! t0_kref+0x3188:   	fbu,a	_kref+0x3194
	.word	0xa9b28e69	! t0_kref+0x318c:   	fxnors	%f10, %f9, %f20
	.word	0xe450a022	! t0_kref+0x3190:   	ldsh	[%g2 + 0x22], %l2
	.word	0xd62e3ff4	! t0_kref+0x3194:   	stb	%o3, [%i0 - 0xc]
	.word	0xa69abc05	! t0_kref+0x3198:   	xorcc	%o2, -0x3fb, %l3
	.word	0xd11e3ff0	! t0_kref+0x319c:   	ldd	[%i0 - 0x10], %f8
	.word	0x9da64d39	! t0_kref+0x31a0:   	fsmuld	%f25, %f25, %f14
	.word	0xd5a6501c	! t0_kref+0x31a4:   	sta	%f10, [%i1 + %i4]0x80
	.word	0x96326e93	! t0_kref+0x31a8:   	orn	%o1, 0xe93, %o3
	.word	0xa032001b	! t0_kref+0x31ac:   	orn	%o0, %i3, %l0
	.word	0xde5e2008	! t0_kref+0x31b0:   	ldx	[%i0 + 8], %o7
	.word	0xec366010	! t0_kref+0x31b4:   	sth	%l6, [%i1 + 0x10]
	.word	0xa9b58c4a	! t0_kref+0x31b8:   	fnor	%f22, %f10, %f20
	.word	0xadb20ab9	! t0_kref+0x31bc:   	fpsub16s	%f8, %f25, %f22
	.word	0xea200019	! t0_kref+0x31c0:   	st	%l5, [%g0 + %i1]
	.word	0xdd20a018	! t0_kref+0x31c4:   	st	%f14, [%g2 + 0x18]
	.word	0xe8162000	! t0_kref+0x31c8:   	lduh	[%i0], %l4
	.word	0xee08a00b	! t0_kref+0x31cc:   	ldub	[%g2 + 0xb], %l7
	.word	0xadb4848a	! t0_kref+0x31d0:   	fcmple32	%f18, %f10, %l6
	.word	0xe91e001d	! t0_kref+0x31d4:   	ldd	[%i0 + %i5], %f20
	.word	0xa9b5862e	! t0_kref+0x31d8:   	fmul8x16	%f22, %f14, %f20
	.word	0x9da4cd2f	! t0_kref+0x31dc:   	fsmuld	%f19, %f15, %f14
	.word	0xb1a01916	! t0_kref+0x31e0:   	fitod	%f22, %f24
	.word	0xae82c00d	! t0_kref+0x31e4:   	addcc	%o3, %o5, %l7
	.word	0x91a01a4e	! t0_kref+0x31e8:   	fdtoi	%f14, %f8
	.word	0xb1a54d28	! t0_kref+0x31ec:   	fsmuld	%f21, %f8, %f24
	.word	0x9da00132	! t0_kref+0x31f0:   	fabss	%f18, %f14
	.word	0x3e800002	! t0_kref+0x31f4:   	bvc,a	_kref+0x31fc
	.word	0xd91e2000	! t0_kref+0x31f8:   	ldd	[%i0], %f12
	.word	0xd828a00e	! t0_kref+0x31fc:   	stb	%o4, [%g2 + 0xe]
	.word	0xd11e6000	! t0_kref+0x3200:   	ldd	[%i1], %f8
	.word	0xe6167fee	! t0_kref+0x3204:   	lduh	[%i1 - 0x12], %l3
	.word	0xacf6f94e	! t0_kref+0x3208:   	udivcc	%i3, -0x6b2, %l6
	.word	0xa12aa01a	! t0_kref+0x320c:   	sll	%o2, 0x1a, %l0
	.word	0x3e480004	! t0_kref+0x3210:   	bvc,a,pt	%icc, _kref+0x3220
	.word	0x91a01a2f	! t0_kref+0x3214:   	fstoi	%f15, %f8
	.word	0xe51e001d	! t0_kref+0x3218:   	ldd	[%i0 + %i5], %f18
	.word	0xe8267ff4	! t0_kref+0x321c:   	st	%l4, [%i1 - 0xc]
	.word	0xada58829	! t0_kref+0x3220:   	fadds	%f22, %f9, %f22
	.word	0xa7b405d8	! t0_kref+0x3224:   	fcmpeq32	%f16, %f24, %l3
	.word	0xd608a003	! t0_kref+0x3228:   	ldub	[%g2 + 3], %o3
	.word	0x988e8017	! t0_kref+0x322c:   	andcc	%i2, %l7, %o4
	.word	0x95a408b2	! t0_kref+0x3230:   	fsubs	%f16, %f18, %f10
	.word	0x903dfa1e	! t0_kref+0x3234:   	xnor	%l7, -0x5e2, %o0
	.word	0x86102001	! t0_kref+0x3238:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x323c:   	bne,a	_kref+0x323c
	.word	0x86a0e001	! t0_kref+0x3240:   	subcc	%g3, 1, %g3
	.word	0xb1b50df8	! t0_kref+0x3244:   	fnands	%f20, %f24, %f24
	.word	0x3a480006	! t0_kref+0x3248:   	bcc,a,pt	%icc, _kref+0x3260
	.word	0x9ba01a2a	! t0_kref+0x324c:   	fstoi	%f10, %f13
	.word	0x90aec017	! t0_kref+0x3250:   	andncc	%i3, %l7, %o0
	.word	0xc568a041	! t0_kref+0x3254:   	prefetch	%g2 + 0x41, 2
	.word	0xe3262010	! t0_kref+0x3258:   	st	%f17, [%i0 + 0x10]
	.word	0x90383874	! t0_kref+0x325c:   	xnor	%g0, -0x78c, %o0
	.word	0x9115214f	! t0_kref+0x3260:   	taddcctv	%l4, 0x14f, %o0
	.word	0xa5a0188e	! t0_kref+0x3264:   	fitos	%f14, %f18
	.word	0xafa018cc	! t0_kref+0x3268:   	fdtos	%f12, %f23
	.word	0xde000018	! t0_kref+0x326c:   	ld	[%g0 + %i0], %o7
	.word	0x2d800006	! t0_kref+0x3270:   	fbg,a	_kref+0x3288
	.word	0x95b58a96	! t0_kref+0x3274:   	fpsub16	%f22, %f22, %f10
	.word	0x93a01a48	! t0_kref+0x3278:   	fdtoi	%f8, %f9
	.word	0xa1a0188d	! t0_kref+0x327c:   	fitos	%f13, %f16
	.word	0xb1b2472e	! t0_kref+0x3280:   	fmuld8ulx16	%f9, %f14, %f24
	.word	0x38480004	! t0_kref+0x3284:   	bgu,a,pt	%icc, _kref+0x3294
	.word	0x81820000	! t0_kref+0x3288:   	wr	%o0, %g0, %y
	.word	0x91b58a0a	! t0_kref+0x328c:   	fpadd16	%f22, %f10, %f8
	.word	0xafb20dab	! t0_kref+0x3290:   	fxors	%f8, %f11, %f23
	.word	0x3a480001	! t0_kref+0x3294:   	bcc,a,pt	%icc, _kref+0x3298
	.word	0xd9b81019	! t0_kref+0x3298:   	stda	%f12, [%g0 + %i1]0x80
	.word	0x95b607cc	! t0_kref+0x329c:   	pdist	%f24, %f12, %f10
	.word	0x2c480006	! t0_kref+0x32a0:   	bneg,a,pt	%icc, _kref+0x32b8
	.word	0x9762a66e	! t0_kref+0x32a4:   	movue	%fcc0, -0x192, %o3
	.word	0x95a01931	! t0_kref+0x32a8:   	fstod	%f17, %f10
	.word	0xd6ce501a	! t0_kref+0x32ac:   	ldsba	[%i1 + %i2]0x80, %o3
	.word	0xa1a000d8	! t0_kref+0x32b0:   	fnegd	%f24, %f16
	.word	0x943e800d	! t0_kref+0x32b4:   	xnor	%i2, %o5, %o2
	.word	0xaaaeea84	! t0_kref+0x32b8:   	andncc	%i3, 0xa84, %l5
	.word	0xa4f00009	! t0_kref+0x32bc:   	udivcc	%g0, %o1, %l2
	.word	0x81ae4a33	! t0_kref+0x32c0:   	fcmps	%fcc0, %f25, %f19
	.word	0xc768a00c	! t0_kref+0x32c4:   	prefetch	%g2 + 0xc, 3
	.word	0x81ad0acc	! t0_kref+0x32c8:   	fcmped	%fcc0, %f20, %f12
	.word	0xa7a01a52	! t0_kref+0x32cc:   	fdtoi	%f18, %f19
	.word	0xed260000	! t0_kref+0x32d0:   	st	%f22, [%i0]
	.word	0x32800004	! t0_kref+0x32d4:   	bne,a	_kref+0x32e4
	.word	0xc938001d	! t0_kref+0x32d8:   	std	%f4, [%g0 + %i5]
	.word	0x9a957549	! t0_kref+0x32dc:   	orcc	%l5, -0xab7, %o5
	.word	0xef68a00c	! t0_kref+0x32e0:   	prefetch	%g2 + 0xc, 23
	.word	0xa5a00035	! t0_kref+0x32e4:   	fmovs	%f21, %f18
	.word	0xdc36c000	! t0_kref+0x32e8:   	sth	%sp, [%i3]
	.word	0x9567e1fc	! t0_kref+0x32ec:   	movvc	%icc, 0x1fc, %o2
	.word	0xef68a00a	! t0_kref+0x32f0:   	prefetch	%g2 + 0xa, 23
	.word	0x9efac01a	! t0_kref+0x32f4:   	sdivcc	%o3, %i2, %o7
	.word	0xe1be189a	! t0_kref+0x32f8:   	stda	%f16, [%i0 + %i2]0xc4
	.word	0xe608a029	! t0_kref+0x32fc:   	ldub	[%g2 + 0x29], %l3
	.word	0x2e480001	! t0_kref+0x3300:   	bvs,a,pt	%icc, _kref+0x3304
	.word	0xf11e6008	! t0_kref+0x3304:   	ldd	[%i1 + 8], %f24
	.word	0xe9380018	! t0_kref+0x3308:   	std	%f20, [%g0 + %i0]
	.word	0xd820a01c	! t0_kref+0x330c:   	st	%o4, [%g2 + 0x1c]
	.word	0x8185c000	! t0_kref+0x3310:   	wr	%l7, %g0, %y
	.word	0xac9dbb82	! t0_kref+0x3314:   	xorcc	%l6, -0x47e, %l6
	.word	0xb3b48dee	! t0_kref+0x3318:   	fnands	%f18, %f14, %f25
	.word	0x878020e0	! t0_kref+0x331c:   	mov	0xe0, %asi
	.word	0x9ba00134	! t0_kref+0x3320:   	fabss	%f20, %f13
	.word	0xd4263ff8	! t0_kref+0x3324:   	st	%o2, [%i0 - 8]
	.word	0xe1be185a	! t0_kref+0x3328:   	stda	%f16, [%i0 + %i2]0xc2
	.word	0xd500a020	! t0_kref+0x332c:   	ld	[%g2 + 0x20], %f10
	.word	0xa0c30015	! t0_kref+0x3330:   	addccc	%o4, %l5, %l0
	.word	0x15219d84	! t0_kref+0x3334:   	sethi	%hi(0x86761000), %o2
	.word	0x9db50a4a	! t0_kref+0x3338:   	fpadd32	%f20, %f10, %f14
	.word	0xadb68169	! t0_kref+0x333c:   	edge32ln	%i2, %o1, %l6
	.word	0xd620a038	! t0_kref+0x3340:   	st	%o3, [%g2 + 0x38]
	.word	0xa1b58240	! t0_kref+0x3344:   	array16	%l6, %g0, %l0
	.word	0xe7267ff4	! t0_kref+0x3348:   	st	%f19, [%i1 - 0xc]
	.word	0xf1180018	! t0_kref+0x334c:   	ldd	[%g0 + %i0], %f24
	.word	0x9a1338f9	! t0_kref+0x3350:   	or	%o4, -0x707, %o5
	.word	0x91a20950	! t0_kref+0x3354:   	fmuld	%f8, %f16, %f8
	.word	0xef064000	! t0_kref+0x3358:   	ld	[%i1], %f23
!	.word	0x25485b28	! t0_kref+0x335c:   	fblg,a,pt	%fcc0, SYM(t0_subr2)
	   	fblg,a,pt	%fcc0, SYM(t0_subr2)
	.word	0x9f414000	! t0_kref+0x3360:   	mov	%pc, %o7
	.word	0xa1a01913	! t0_kref+0x3364:   	fitod	%f19, %f16
	.word	0xa1a01a54	! t0_kref+0x3368:   	fdtoi	%f20, %f16
	.word	0xadb50e10	! t0_kref+0x336c:   	fand	%f20, %f16, %f22
	.word	0xd48e501a	! t0_kref+0x3370:   	lduba	[%i1 + %i2]0x80, %o2
	.word	0xa5a208d4	! t0_kref+0x3374:   	fsubd	%f8, %f20, %f18
	.word	0xa1a0102f	! t0_kref+0x3378:   	fstox	%f15, %f16
	.word	0xc568a040	! t0_kref+0x337c:   	prefetch	%g2 + 0x40, 2
	.word	0xc0386744	! t0_kref+0x3380:   	std	%g0, [%g1 + 0x744]
	.word	0x9a637ffd	! t0_kref+0x3384:   	subc	%o5, -0x3, %o5
	.word	0xacfaf5f3	! t0_kref+0x3388:   	sdivcc	%o3, -0xa0d, %l6
	.word	0xa1a40958	! t0_kref+0x338c:   	fmuld	%f16, %f24, %f16
	.word	0x94154014	! t0_kref+0x3390:   	or	%l5, %l4, %o2
	.word	0xea56401b	! t0_kref+0x3394:   	ldsh	[%i1 + %i3], %l5
	.word	0xec36001b	! t0_kref+0x3398:   	sth	%l6, [%i0 + %i3]
	.word	0x9436801b	! t0_kref+0x339c:   	orn	%i2, %i3, %o2
	.word	0x921ac016	! t0_kref+0x33a0:   	xor	%o3, %l6, %o1
	call	1f
	.empty
	.word	0xed6e001b	! t0_kref+0x33a8:   	prefetch	%i0 + %i3, 22
	.word	0xe3b8a040	! t0_kref+0x33ac:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xec180018	! t0_kref+0x33b0:   	ldd	[%g0 + %i0], %l6
1:	.word	0x81ae0ad2	! t0_kref+0x33b4:   	fcmped	%fcc0, %f24, %f18
	.word	0x81accab1	! t0_kref+0x33b8:   	fcmpes	%fcc0, %f19, %f17
	.word	0xac22f40b	! t0_kref+0x33bc:   	sub	%o3, -0xbf5, %l6
	.word	0xd5b81019	! t0_kref+0x33c0:   	stda	%f10, [%g0 + %i1]0x80
	.word	0xa1a44d2f	! t0_kref+0x33c4:   	fsmuld	%f17, %f15, %f16
	.word	0x8143e040	! t0_kref+0x33c8:   	membar	0x40
	.word	0x81ac8ad4	! t0_kref+0x33cc:   	fcmped	%fcc0, %f18, %f20
	.word	0xd920a024	! t0_kref+0x33d0:   	st	%f12, [%g2 + 0x24]
	.word	0xde480019	! t0_kref+0x33d4:   	ldsb	[%g0 + %i1], %o7
	.word	0xa68d7d52	! t0_kref+0x33d8:   	andcc	%l5, -0x2ae, %l3
	.word	0xb1a489ca	! t0_kref+0x33dc:   	fdivd	%f18, %f10, %f24
	.word	0x9096801b	! t0_kref+0x33e0:   	orcc	%i2, %i3, %o0
	.word	0x2e800008	! t0_kref+0x33e4:   	bvs,a	_kref+0x3404
	.word	0x909d0016	! t0_kref+0x33e8:   	xorcc	%l4, %l6, %o0
	.word	0x20800008	! t0_kref+0x33ec:   	bn,a	_kref+0x340c
	.word	0xd2500018	! t0_kref+0x33f0:   	ldsh	[%g0 + %i0], %o1
	.word	0xafb2c334	! t0_kref+0x33f4:   	bmask	%o3, %l4, %l7
	.word	0x81ad4a2e	! t0_kref+0x33f8:   	fcmps	%fcc0, %f21, %f14
	.word	0xa1a348b9	! t0_kref+0x33fc:   	fsubs	%f13, %f25, %f16
	.word	0xc807bfe8	! t0_kref+0x3400:   	ld	[%fp - 0x18], %g4
	.word	0x9a834016	! t0_kref+0x3404:   	addcc	%o5, %l6, %o5
	.word	0x95b48ab1	! t0_kref+0x3408:   	fpsub16s	%f18, %f17, %f10
	.word	0xeed81019	! t0_kref+0x340c:   	ldxa	[%g0 + %i1]0x80, %l7
	.word	0x9ba01a33	! t0_kref+0x3410:   	fstoi	%f19, %f13
	.word	0xda40a000	! t0_kref+0x3414:   	ldsw	[%g2], %o5
	.word	0xa62ea4b5	! t0_kref+0x3418:   	andn	%i2, 0x4b5, %l3
	.word	0xf76e001c	! t0_kref+0x341c:   	prefetch	%i0 + %i4, 27
	.word	0xa0f50009	! t0_kref+0x3420:   	udivcc	%l4, %o1, %l0
	.word	0xa4aa800d	! t0_kref+0x3424:   	andncc	%o2, %o5, %l2
	.word	0x9fa44830	! t0_kref+0x3428:   	fadds	%f17, %f16, %f15
	.word	0xec10a002	! t0_kref+0x342c:   	lduh	[%g2 + 2], %l6
	.word	0xe2480019	! t0_kref+0x3430:   	ldsb	[%g0 + %i1], %l1
	.word	0xa566e3d2	! t0_kref+0x3434:   	movge	%icc, 0x3d2, %l2
	.word	0xffee101d	! t0_kref+0x3438:   	prefetcha	%i0 + %i5, 31
	.word	0xd87e7fe8	! t0_kref+0x343c:   	swap	[%i1 - 0x18], %o4
	.word	0xd500a014	! t0_kref+0x3440:   	ld	[%g2 + 0x14], %f10
	.word	0xa5b00f38	! t0_kref+0x3444:   	fsrc2s	%f24, %f18
	.word	0xe7060000	! t0_kref+0x3448:   	ld	[%i0], %f19
	.word	0x30480001	! t0_kref+0x344c:   	ba,a,pt	%icc, _kref+0x3450
	.word	0x95122588	! t0_kref+0x3450:   	taddcctv	%o0, 0x588, %o2
	.word	0xa202a204	! t0_kref+0x3454:   	add	%o2, 0x204, %l1
	.word	0xec262000	! t0_kref+0x3458:   	st	%l6, [%i0]
	.word	0xd636001b	! t0_kref+0x345c:   	sth	%o3, [%i0 + %i3]
	.word	0xa9a0002d	! t0_kref+0x3460:   	fmovs	%f13, %f20
	.word	0xa3a01a50	! t0_kref+0x3464:   	fdtoi	%f16, %f17
	.word	0xd4267fe4	! t0_kref+0x3468:   	st	%o2, [%i1 - 0x1c]
	.word	0xe968a086	! t0_kref+0x346c:   	prefetch	%g2 + 0x86, 20
	.word	0xaba01a35	! t0_kref+0x3470:   	fstoi	%f21, %f21
	.word	0x95a28856	! t0_kref+0x3474:   	faddd	%f10, %f22, %f10
	.word	0xd6564000	! t0_kref+0x3478:   	ldsh	[%i1], %o3
	.word	0x9a9dfd47	! t0_kref+0x347c:   	xorcc	%l7, -0x2b9, %o5
	.word	0x8143c000	! t0_kref+0x3480:   	stbar
	.word	0xa5a4c9ac	! t0_kref+0x3484:   	fdivs	%f19, %f12, %f18
	.word	0x98dd001b	! t0_kref+0x3488:   	smulcc	%l4, %i3, %o4
	.word	0x22480006	! t0_kref+0x348c:   	be,a,pt	%icc, _kref+0x34a4
	.word	0xadb60c58	! t0_kref+0x3490:   	fnor	%f24, %f24, %f22
	.word	0x99b00cd6	! t0_kref+0x3494:   	fnot2	%f22, %f12
	.word	0xec1f4018	! t0_kref+0x3498:   	ldd	[%i5 + %i0], %l6
	.word	0xaa457a71	! t0_kref+0x349c:   	addc	%l5, -0x58f, %l5
	.word	0x9675653d	! t0_kref+0x34a0:   	udiv	%l5, 0x53d, %o3
	.word	0xddbe501d	! t0_kref+0x34a4:   	stda	%f14, [%i1 + %i5]0x80
	.word	0xe3264000	! t0_kref+0x34a8:   	st	%f17, [%i1]
	.word	0x91b5898c	! t0_kref+0x34ac:   	bshuffle	%f22, %f12, %f8
	.word	0xe408a033	! t0_kref+0x34b0:   	ldub	[%g2 + 0x33], %l2
	.word	0xaf25aae2	! t0_kref+0x34b4:   	mulscc	%l6, 0xae2, %l7
	.word	0xe836201c	! t0_kref+0x34b8:   	sth	%l4, [%i0 + 0x1c]
	.word	0xadb58488	! t0_kref+0x34bc:   	fcmple32	%f22, %f8, %l6
	.word	0x8143e040	! t0_kref+0x34c0:   	membar	0x40
	.word	0xd0965000	! t0_kref+0x34c4:   	lduha	[%i1]0x80, %o0
	.word	0x902a000c	! t0_kref+0x34c8:   	andn	%o0, %o4, %o0
	.word	0x9da34d36	! t0_kref+0x34cc:   	fsmuld	%f13, %f22, %f14
	.word	0xfdee501d	! t0_kref+0x34d0:   	prefetcha	%i1 + %i5, 30
	call	SYM(t0_subr3)
	.word	0xec4e2003	! t0_kref+0x34d8:   	ldsb	[%i0 + 3], %l6
	.word	0xa3b5817b	! t0_kref+0x34dc:   	edge32ln	%l6, %i3, %l1
	.word	0xa5b287d0	! t0_kref+0x34e0:   	pdist	%f10, %f16, %f18
	.word	0xeeee501a	! t0_kref+0x34e4:   	ldstuba	[%i1 + %i2]0x80, %l7
	.word	0xa3a01a58	! t0_kref+0x34e8:   	fdtoi	%f24, %f17
	.word	0xe51e6008	! t0_kref+0x34ec:   	ldd	[%i1 + 8], %f18
	.word	0xd500a01c	! t0_kref+0x34f0:   	ld	[%g2 + 0x1c], %f10
	.word	0xada0054e	! t0_kref+0x34f4:   	fsqrtd	%f14, %f22
	.word	0xee6e8018	! t0_kref+0x34f8:   	ldstub	[%i2 + %i0], %l7
	.word	0xea480018	! t0_kref+0x34fc:   	ldsb	[%g0 + %i0], %l5
	.word	0xacd02481	! t0_kref+0x3500:   	umulcc	%g0, 0x481, %l6
	.word	0x9a16b2b2	! t0_kref+0x3504:   	or	%i2, -0xd4e, %o5
	.word	0x36800004	! t0_kref+0x3508:   	bge,a	_kref+0x3518
	.word	0xa786e80a	! t0_kref+0x350c:   	wr	%i3, 0x80a, %gsr
	.word	0xea26600c	! t0_kref+0x3510:   	st	%l5, [%i1 + 0xc]
	.word	0xe76e001d	! t0_kref+0x3514:   	prefetch	%i0 + %i5, 19
	.word	0x99a00034	! t0_kref+0x3518:   	fmovs	%f20, %f12
	.word	0xed00a010	! t0_kref+0x351c:   	ld	[%g2 + 0x10], %f22
	.word	0x9da0012d	! t0_kref+0x3520:   	fabss	%f13, %f14
	.word	0xd6266000	! t0_kref+0x3524:   	st	%o3, [%i1]
	.word	0xda68001a	! t0_kref+0x3528:   	ldstub	[%g0 + %i2], %o5
	.word	0x2f800005	! t0_kref+0x352c:   	fbu,a	_kref+0x3540
	.word	0xe00e401a	! t0_kref+0x3530:   	ldub	[%i1 + %i2], %l0
	.word	0xa5a58831	! t0_kref+0x3534:   	fadds	%f22, %f17, %f18
	.word	0xc12f0005	! t0_kref+0x3538:   	st	%fsr, [%i4 + %g5]
	.word	0x9fa01a56	! t0_kref+0x353c:   	fdtoi	%f22, %f15
	.word	0xaad2800b	! t0_kref+0x3540:   	umulcc	%o2, %o3, %l5
	.word	0xacf5c00d	! t0_kref+0x3544:   	udivcc	%l7, %o5, %l6
	.word	0x908a6054	! t0_kref+0x3548:   	andcc	%o1, 0x54, %o0
	.word	0x91b00ce8	! t0_kref+0x354c:   	fnot2s	%f8, %f8
	.word	0x9da0052b	! t0_kref+0x3550:   	fsqrts	%f11, %f14
	.word	0xec56c018	! t0_kref+0x3554:   	ldsh	[%i3 + %i0], %l6
	.word	0xee50a00e	! t0_kref+0x3558:   	ldsh	[%g2 + 0xe], %l7
	.word	0xd1be1a5d	! t0_kref+0x355c:   	stda	%f8, [%i0 + %i5]0xd2
	.word	0xadb40a0c	! t0_kref+0x3560:   	fpadd16	%f16, %f12, %f22
	.word	0xe66e6005	! t0_kref+0x3564:   	ldstub	[%i1 + 5], %l3
	.word	0xd53e401d	! t0_kref+0x3568:   	std	%f10, [%i1 + %i5]
	.word	0x93b54e75	! t0_kref+0x356c:   	fxnors	%f21, %f21, %f9
	.word	0xa7a44828	! t0_kref+0x3570:   	fadds	%f17, %f8, %f19
	.word	0x9822400b	! t0_kref+0x3574:   	sub	%o1, %o3, %o4
	.word	0xada389b1	! t0_kref+0x3578:   	fdivs	%f14, %f17, %f22
	.word	0xd2c81018	! t0_kref+0x357c:   	ldsba	[%g0 + %i0]0x80, %o1
	.word	0xada0002d	! t0_kref+0x3580:   	fmovs	%f13, %f22
	.word	0x2a800008	! t0_kref+0x3584:   	bcs,a	_kref+0x35a4
	.word	0xa1b386f6	! t0_kref+0x3588:   	fmul8ulx16	%f14, %f22, %f16
	.word	0xe008a00e	! t0_kref+0x358c:   	ldub	[%g2 + 0xe], %l0
	.word	0xfbee101d	! t0_kref+0x3590:   	prefetcha	%i0 + %i5, 29
	.word	0x9fa01a28	! t0_kref+0x3594:   	fstoi	%f8, %f15
	.word	0x3c480007	! t0_kref+0x3598:   	bpos,a,pt	%icc, _kref+0x35b4
	.word	0x9ba01a52	! t0_kref+0x359c:   	fdtoi	%f18, %f13
	.word	0xa1a388b3	! t0_kref+0x35a0:   	fsubs	%f14, %f19, %f16
	.word	0xac96c00c	! t0_kref+0x35a4:   	orcc	%i3, %o4, %l6
	.word	0xaaaa800c	! t0_kref+0x35a8:   	andncc	%o2, %o4, %l5
	.word	0xa1a01930	! t0_kref+0x35ac:   	fstod	%f16, %f16
	.word	0x99a58834	! t0_kref+0x35b0:   	fadds	%f22, %f20, %f12
	.word	0xa1a0052a	! t0_kref+0x35b4:   	fsqrts	%f10, %f16
	.word	0x9fc00004	! t0_kref+0x35b8:   	call	%g0 + %g4
	.word	0xa0852741	! t0_kref+0x35bc:   	addcc	%l4, 0x741, %l0
	.word	0x92f2e5a4	! t0_kref+0x35c0:   	udivcc	%o3, 0x5a4, %o1
	.word	0xb1a2cd2f	! t0_kref+0x35c4:   	fsmuld	%f11, %f15, %f24
	.word	0x9e0b0008	! t0_kref+0x35c8:   	and	%o4, %o0, %o7
	.word	0x9e25c015	! t0_kref+0x35cc:   	sub	%l7, %l5, %o7
	.word	0xe608a025	! t0_kref+0x35d0:   	ldub	[%g2 + 0x25], %l3
	.word	0xed070019	! t0_kref+0x35d4:   	ld	[%i4 + %i1], %f22
	.word	0xa1b38e80	! t0_kref+0x35d8:   	fsrc1	%f14, %f16
	.word	0x9e2b0016	! t0_kref+0x35dc:   	andn	%o4, %l6, %o7
	.word	0xe76e401a	! t0_kref+0x35e0:   	prefetch	%i1 + %i2, 19
	.word	0x99b64673	! t0_kref+0x35e4:   	fmul8x16au	%f25, %f19, %f12
	.word	0xc96e0015	! t0_kref+0x35e8:   	prefetch	%i0 + %l5, 4
	.word	0xd0262000	! t0_kref+0x35ec:   	st	%o0, [%i0]
	.word	0xaba00035	! t0_kref+0x35f0:   	fmovs	%f21, %f21
	.word	0xb1b20990	! t0_kref+0x35f4:   	bshuffle	%f8, %f16, %f24
	.word	0xa1a01112	! t0_kref+0x35f8:   	fxtod	%f18, %f16
	.word	0xdd1f4019	! t0_kref+0x35fc:   	ldd	[%i5 + %i1], %f14
	.word	0xd428a000	! t0_kref+0x3600:   	stb	%o2, [%g2]
	.word	0xd1be5849	! t0_kref+0x3604:   	stda	%f8, [%i1 + %o1]0xc2
	.word	0xd9000018	! t0_kref+0x3608:   	ld	[%g0 + %i0], %f12
	.word	0xe3b8a040	! t0_kref+0x360c:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xa3100016	! t0_kref+0x3610:   	taddcctv	%g0, %l6, %l1
	.word	0xee40a020	! t0_kref+0x3614:   	ldsw	[%g2 + 0x20], %l7
	.word	0x9062800a	! t0_kref+0x3618:   	subc	%o2, %o2, %o0
	.word	0x983eb198	! t0_kref+0x361c:   	xnor	%i2, -0xe68, %o4
	.word	0xa4a6bd35	! t0_kref+0x3620:   	subcc	%i2, -0x2cb, %l2
	.word	0xa8bb2de2	! t0_kref+0x3624:   	xnorcc	%o4, 0xde2, %l4
	.word	0x20800004	! t0_kref+0x3628:   	bn,a	_kref+0x3638
	.word	0xa72b601f	! t0_kref+0x362c:   	sll	%o5, 0x1f, %l3
	.word	0xea563fee	! t0_kref+0x3630:   	ldsh	[%i0 - 0x12], %l5
	.word	0xe3b8a040	! t0_kref+0x3634:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x2c480008	! t0_kref+0x3638:   	bneg,a,pt	%icc, _kref+0x3658
	.word	0x90b28008	! t0_kref+0x363c:   	orncc	%o2, %o0, %o0
	.word	0xd25e0000	! t0_kref+0x3640:   	ldx	[%i0], %o1
	.word	0xe2000018	! t0_kref+0x3644:   	ld	[%g0 + %i0], %l1
	.word	0x90383fee	! t0_kref+0x3648:   	xnor	%g0, -0x12, %o0
	.word	0xa9a00034	! t0_kref+0x364c:   	fmovs	%f20, %f20
	.word	0x9ba24838	! t0_kref+0x3650:   	fadds	%f9, %f24, %f13
	.word	0xde8e1000	! t0_kref+0x3654:   	lduba	[%i0]0x80, %o7
	.word	0x9126b2fa	! t0_kref+0x3658:   	mulscc	%i2, -0xd06, %o0
	.word	0x92bd0016	! t0_kref+0x365c:   	xnorcc	%l4, %l6, %o1
	.word	0xde000019	! t0_kref+0x3660:   	ld	[%g0 + %i1], %o7
	.word	0xabb28280	! t0_kref+0x3664:   	array32	%o2, %g0, %l5
	.word	0x91a28950	! t0_kref+0x3668:   	fmuld	%f10, %f16, %f8
	.word	0xd456201c	! t0_kref+0x366c:   	ldsh	[%i0 + 0x1c], %o2
	.word	0x9212f8ac	! t0_kref+0x3670:   	or	%o3, -0x754, %o1
	.word	0xe88e1000	! t0_kref+0x3674:   	lduba	[%i0]0x80, %l4
	.word	0x22800005	! t0_kref+0x3678:   	be,a	_kref+0x368c
	.word	0x99a60837	! t0_kref+0x367c:   	fadds	%f24, %f23, %f12
	.word	0x93a01a52	! t0_kref+0x3680:   	fdtoi	%f18, %f9
	.word	0x91b4c669	! t0_kref+0x3684:   	fmul8x16au	%f19, %f9, %f8
	.word	0xd6562008	! t0_kref+0x3688:   	ldsh	[%i0 + 8], %o3
	.word	0xe81e401d	! t0_kref+0x368c:   	ldd	[%i1 + %i5], %l4
	.word	0xada0002e	! t0_kref+0x3690:   	fmovs	%f14, %f22
	.word	0xb1a01a31	! t0_kref+0x3694:   	fstoi	%f17, %f24
	.word	0x9f414000	! t0_kref+0x3698:   	mov	%pc, %o7
!	.word	0x36485a58	! t0_kref+0x369c:   	bge,a,pt	%icc, SYM(t0_subr2)
	   	bge,a,pt	%icc, SYM(t0_subr2)
	.word	0x989a8016	! t0_kref+0x36a0:   	xorcc	%o2, %l6, %o4
	.word	0x98c367fe	! t0_kref+0x36a4:   	addccc	%o5, 0x7fe, %o4
	.word	0xb1a01a4e	! t0_kref+0x36a8:   	fdtoi	%f14, %f24
	.word	0x9de3bfa0	! t0_kref+0x36ac:   	save	%sp, -0x60, %sp
	.word	0xb6502fc3	! t0_kref+0x36b0:   	umul	%g0, 0xfc3, %i3
	.word	0x95ee22b8	! t0_kref+0x36b4:   	restore	%i0, 0x2b8, %o2
	.word	0x81aa0ac8	! t0_kref+0x36b8:   	fcmped	%fcc0, %f8, %f8
	.word	0xd620a018	! t0_kref+0x36bc:   	st	%o3, [%g2 + 0x18]
	.word	0xa3a01a48	! t0_kref+0x36c0:   	fdtoi	%f8, %f17
	.word	0xa9a2084a	! t0_kref+0x36c4:   	faddd	%f8, %f10, %f20
	.word	0xef68a081	! t0_kref+0x36c8:   	prefetch	%g2 + 0x81, 23
	.word	0xe8163fe4	! t0_kref+0x36cc:   	lduh	[%i0 - 0x1c], %l4
	.word	0xadb40e48	! t0_kref+0x36d0:   	fxnor	%f16, %f8, %f22
	.word	0x9db38ab6	! t0_kref+0x36d4:   	fpsub16s	%f14, %f22, %f14
	.word	0xa9b60558	! t0_kref+0x36d8:   	fcmpeq16	%f24, %f24, %l4
	.word	0x99b48c74	! t0_kref+0x36dc:   	fnors	%f18, %f20, %f12
	.word	0x2d800002	! t0_kref+0x36e0:   	fbg,a	_kref+0x36e8
	.word	0x9bb34db5	! t0_kref+0x36e4:   	fxors	%f13, %f21, %f13
	.word	0xe3b8a040	! t0_kref+0x36e8:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x91b64cb9	! t0_kref+0x36ec:   	fandnot2s	%f25, %f25, %f8
	.word	0xf126401c	! t0_kref+0x36f0:   	st	%f24, [%i1 + %i4]
	.word	0x172d4a60	! t0_kref+0x36f4:   	sethi	%hi(0xb5298000), %o3
	.word	0xaba5c833	! t0_kref+0x36f8:   	fadds	%f23, %f19, %f21
	.word	0xea16001b	! t0_kref+0x36fc:   	lduh	[%i0 + %i3], %l5
	.word	0x3d800003	! t0_kref+0x3700:   	fbule,a	_kref+0x370c
	.word	0xaead226f	! t0_kref+0x3704:   	andncc	%l4, 0x26f, %l7
	.word	0xa9a2c82b	! t0_kref+0x3708:   	fadds	%f11, %f11, %f20
	.word	0xa1b3016c	! t0_kref+0x370c:   	edge32ln	%o4, %o4, %l0
	.word	0xe078a024	! t0_kref+0x3710:   	swap	[%g2 + 0x24], %l0
	.word	0x91a0188a	! t0_kref+0x3714:   	fitos	%f10, %f8
	.word	0xa5a01a48	! t0_kref+0x3718:   	fdtoi	%f8, %f18
	.word	0x30800005	! t0_kref+0x371c:   	ba,a	_kref+0x3730
	.word	0x972b2019	! t0_kref+0x3720:   	sll	%o4, 0x19, %o3
	.word	0xb1aa0056	! t0_kref+0x3724:   	fmovda	%fcc0, %f22, %f24
	.word	0x37800003	! t0_kref+0x3728:   	fbge,a	_kref+0x3734
	.word	0xaab37801	! t0_kref+0x372c:   	orncc	%o5, -0x7ff, %l5
	.word	0xa7b58496	! t0_kref+0x3730:   	fcmple32	%f22, %f22, %l3
	.word	0x9216ebbe	! t0_kref+0x3734:   	or	%i3, 0xbbe, %o1
	.word	0x98268000	! t0_kref+0x3738:   	sub	%i2, %g0, %o4
	.word	0x878020d0	! t0_kref+0x373c:   	mov	0xd0, %asi
	.word	0x902eb1a9	! t0_kref+0x3740:   	andn	%i2, -0xe57, %o0
	.word	0x9fc00004	! t0_kref+0x3744:   	call	%g0 + %g4
	.word	0xe968a048	! t0_kref+0x3748:   	prefetch	%g2 + 0x48, 20
	.word	0x9da018d4	! t0_kref+0x374c:   	fdtos	%f20, %f14
	.word	0x9bb38ef3	! t0_kref+0x3750:   	fornot2s	%f14, %f19, %f13
	.word	0xee2e401a	! t0_kref+0x3754:   	stb	%l7, [%i1 + %i2]
	.word	0x9bb58db4	! t0_kref+0x3758:   	fxors	%f22, %f20, %f13
	.word	0x94b3400c	! t0_kref+0x375c:   	orncc	%o5, %o4, %o2
	.word	0xacddf36b	! t0_kref+0x3760:   	smulcc	%l7, -0xc95, %l6
	.word	0xa1250009	! t0_kref+0x3764:   	mulscc	%l4, %o1, %l0
	.word	0xe1be1a5b	! t0_kref+0x3768:   	stda	%f16, [%i0 + %i3]0xd2
	.word	0xafa01a4e	! t0_kref+0x376c:   	fdtoi	%f14, %f23
	.word	0x9bb20240	! t0_kref+0x3770:   	array16	%o0, %g0, %o5
	.word	0xe66e2006	! t0_kref+0x3774:   	ldstub	[%i0 + 6], %l3
	.word	0xe6fe1000	! t0_kref+0x3778:   	swapa	[%i0]0x80, %l3
	.word	0xc56e6018	! t0_kref+0x377c:   	prefetch	%i1 + 0x18, 2
	.word	0xae15fb3f	! t0_kref+0x3780:   	or	%l7, -0x4c1, %l7
	.word	0x9da3cd2a	! t0_kref+0x3784:   	fsmuld	%f15, %f10, %f14
	.word	0xd40e8018	! t0_kref+0x3788:   	ldub	[%i2 + %i0], %o2
	.word	0xa1a0052f	! t0_kref+0x378c:   	fsqrts	%f15, %f16
	.word	0xc36e6008	! t0_kref+0x3790:   	prefetch	%i1 + 8, 1
	.word	0xa73a0000	! t0_kref+0x3794:   	sra	%o0, %g0, %l3
	.word	0xa9b40ad4	! t0_kref+0x3798:   	fpsub32	%f16, %f20, %f20
	.word	0x86102021	! t0_kref+0x379c:   	mov	0x21, %g3
	.word	0x86a0e001	! t0_kref+0x37a0:   	subcc	%g3, 1, %g3
	.word	0x2280001a	! t0_kref+0x37a4:   	be,a	_kref+0x380c
	.word	0xff270000	! t0_kref+0x37a8:   	st	%f31, [%i4]
	.word	0xa9a01a2e	! t0_kref+0x37ac:   	fstoi	%f14, %f20
	.word	0xf56e401b	! t0_kref+0x37b0:   	prefetch	%i1 + %i3, 26
	.word	0x91a00537	! t0_kref+0x37b4:   	fsqrts	%f23, %f8
	.word	0xadb2401a	! t0_kref+0x37b8:   	edge8	%o1, %i2, %l6
	.word	0x1331004a	! t0_kref+0x37bc:   	sethi	%hi(0xc4012800), %o1
	.word	0xd900a034	! t0_kref+0x37c0:   	ld	[%g2 + 0x34], %f12
	.word	0xa262800b	! t0_kref+0x37c4:   	subc	%o2, %o3, %l1
	.word	0xa9a00139	! t0_kref+0x37c8:   	fabss	%f25, %f20
	.word	0xa00b714d	! t0_kref+0x37cc:   	and	%o5, -0xeb3, %l0
	.word	0x21480004	! t0_kref+0x37d0:   	fbn,a,pt	%fcc0, _kref+0x37e0
	.word	0xa9a01937	! t0_kref+0x37d4:   	fstod	%f23, %f20
	.word	0x99408000	! t0_kref+0x37d8:   	mov	%ccr, %o4
	.word	0xd6de501d	! t0_kref+0x37dc:   	ldxa	[%i1 + %i5]0x80, %o3
	.word	0x81aa0aaf	! t0_kref+0x37e0:   	fcmpes	%fcc0, %f8, %f15
	.word	0x1b123e24	! t0_kref+0x37e4:   	sethi	%hi(0x48f89000), %o5
	.word	0x988df57a	! t0_kref+0x37e8:   	andcc	%l7, -0xa86, %o4
	.word	0xe24e0000	! t0_kref+0x37ec:   	ldsb	[%i0], %l1
	.word	0xee267ff8	! t0_kref+0x37f0:   	st	%l7, [%i1 - 8]
	.word	0xe91f4019	! t0_kref+0x37f4:   	ldd	[%i5 + %i1], %f20
	.word	0x92b2000d	! t0_kref+0x37f8:   	orncc	%o0, %o5, %o1
	.word	0xd86e3fee	! t0_kref+0x37fc:   	ldstub	[%i0 - 0x12], %o4
	.word	0xde4e601b	! t0_kref+0x3800:   	ldsb	[%i1 + 0x1b], %o7
	.word	0xac200009	! t0_kref+0x3804:   	neg	%o1, %l6
	.word	0x90fb62d6	! t0_kref+0x3808:   	sdivcc	%o5, 0x2d6, %o0
	.word	0xac08001b	! t0_kref+0x380c:   	and	%g0, %i3, %l6
	.word	0x9da508b2	! t0_kref+0x3810:   	fsubs	%f20, %f18, %f14
	.word	0xa9b60408	! t0_kref+0x3814:   	fcmple16	%f24, %f8, %l4
	.word	0xe8180019	! t0_kref+0x3818:   	ldd	[%g0 + %i1], %l4
	.word	0xee263fe4	! t0_kref+0x381c:   	st	%l7, [%i0 - 0x1c]
	.word	0xb1b20d0c	! t0_kref+0x3820:   	fandnot1	%f8, %f12, %f24
	.word	0xaba01a50	! t0_kref+0x3824:   	fdtoi	%f16, %f21
	.word	0xd9f65009	! t0_kref+0x3828:   	casxa	[%i1]0x80, %o1, %o4
	.word	0xe11f4019	! t0_kref+0x382c:   	ldd	[%i5 + %i1], %f16
	.word	0xa08d0014	! t0_kref+0x3830:   	andcc	%l4, %l4, %l0
	.word	0x34480005	! t0_kref+0x3834:   	bg,a,pt	%icc, _kref+0x3848
	.word	0xaa720015	! t0_kref+0x3838:   	udiv	%o0, %l5, %l5
	.word	0xd27f0019	! t0_kref+0x383c:   	swap	[%i4 + %i1], %o1
	.word	0xd6363fec	! t0_kref+0x3840:   	sth	%o3, [%i0 - 0x14]
	.word	0x9ba018d6	! t0_kref+0x3844:   	fdtos	%f22, %f13
	.word	0x86102003	! t0_kref+0x3848:   	mov	0x3, %g3
	.word	0x86a0e001	! t0_kref+0x384c:   	subcc	%g3, 1, %g3
	.word	0x22800014	! t0_kref+0x3850:   	be,a	_kref+0x38a0
	.word	0xf9ee101b	! t0_kref+0x3854:   	prefetcha	%i0 + %i3, 28
	.word	0xeafe5000	! t0_kref+0x3858:   	swapa	[%i1]0x80, %l5
	.word	0xada01931	! t0_kref+0x385c:   	fstod	%f17, %f22
	.word	0x93a01890	! t0_kref+0x3860:   	fitos	%f16, %f9
	.word	0xa12ee011	! t0_kref+0x3864:   	sll	%i3, 0x11, %l0
	.word	0x9fb68340	! t0_kref+0x3868:   	alignaddrl	%i2, %g0, %o7
	.word	0x94d278de	! t0_kref+0x386c:   	umulcc	%o1, -0x722, %o2
	.word	0x81828000	! t0_kref+0x3870:   	wr	%o2, %g0, %y
	.word	0xa7b64af0	! t0_kref+0x3874:   	fpsub32s	%f25, %f16, %f19
	.word	0xec2e3fe6	! t0_kref+0x3878:   	stb	%l6, [%i0 - 0x1a]
!	.word	0x334859e0	! t0_kref+0x387c:   	fbe,a,pt	%fcc0, SYM(t0_subr2)
	   	fbe,a,pt	%fcc0, SYM(t0_subr2)
	.word	0x9f414000	! t0_kref+0x3880:   	mov	%pc, %o7
	.word	0x9da0054a	! t0_kref+0x3884:   	fsqrtd	%f10, %f14
	.word	0xa7b5c308	! t0_kref+0x3888:   	alignaddr	%l7, %o0, %l3
	.word	0xa1a28832	! t0_kref+0x388c:   	fadds	%f10, %f18, %f16
	.word	0xc568a082	! t0_kref+0x3890:   	prefetch	%g2 + 0x82, 2
	.word	0xd900a02c	! t0_kref+0x3894:   	ld	[%g2 + 0x2c], %f12
	.word	0xd46e001a	! t0_kref+0x3898:   	ldstub	[%i0 + %i2], %o2
	.word	0xd5861000	! t0_kref+0x389c:   	lda	[%i0]0x80, %f10
	.word	0xb1a00554	! t0_kref+0x38a0:   	fsqrtd	%f20, %f24
	.word	0x9da000b2	! t0_kref+0x38a4:   	fnegs	%f18, %f14
	.word	0xd010a016	! t0_kref+0x38a8:   	lduh	[%g2 + 0x16], %o0
	.word	0xe24e8019	! t0_kref+0x38ac:   	ldsb	[%i2 + %i1], %l1
	.word	0xb3a01a2d	! t0_kref+0x38b0:   	fstoi	%f13, %f25
	.word	0xdb060000	! t0_kref+0x38b4:   	ld	[%i0], %f13
	.word	0xabb300aa	! t0_kref+0x38b8:   	edge16n	%o4, %o2, %l5
	.word	0x95a01a50	! t0_kref+0x38bc:   	fdtoi	%f16, %f10
	.word	0xa7a01a28	! t0_kref+0x38c0:   	fstoi	%f8, %f19
	.word	0x2301bbb8	! t0_kref+0x38c4:   	sethi	%hi(0x6eee000), %l1
	.word	0xeb200018	! t0_kref+0x38c8:   	st	%f21, [%g0 + %i0]
	.word	0xab220014	! t0_kref+0x38cc:   	mulscc	%o0, %l4, %l5
	.word	0xe608a016	! t0_kref+0x38d0:   	ldub	[%g2 + 0x16], %l3
	.word	0xa4aabde2	! t0_kref+0x38d4:   	andncc	%o2, -0x21e, %l2
	.word	0x20480005	! t0_kref+0x38d8:   	bn,a,pt	%icc, _kref+0x38ec
	.word	0xa9ab4058	! t0_kref+0x38dc:   	fmovdle	%fcc0, %f24, %f20
	.word	0xaa0a800c	! t0_kref+0x38e0:   	and	%o2, %o4, %l5
	.word	0xada0004c	! t0_kref+0x38e4:   	fmovd	%f12, %f22
	.word	0xafb2817a	! t0_kref+0x38e8:   	edge32ln	%o2, %i2, %l7
	.word	0x99b20ad8	! t0_kref+0x38ec:   	fpsub32	%f8, %f24, %f12
	.word	0xb1a00531	! t0_kref+0x38f0:   	fsqrts	%f17, %f24
	.word	0xe1263fe8	! t0_kref+0x38f4:   	st	%f16, [%i0 - 0x18]
	.word	0x9da00028	! t0_kref+0x38f8:   	fmovs	%f8, %f14
	.word	0x91b284d0	! t0_kref+0x38fc:   	fcmpne32	%f10, %f16, %o0
	.word	0xa1a64830	! t0_kref+0x3900:   	fadds	%f25, %f16, %f16
	.word	0x9223000b	! t0_kref+0x3904:   	sub	%o4, %o3, %o1
	.word	0xe3263ff4	! t0_kref+0x3908:   	st	%f17, [%i0 - 0xc]
	.word	0x9ba60833	! t0_kref+0x390c:   	fadds	%f24, %f19, %f13
	.word	0xa9b60ded	! t0_kref+0x3910:   	fnands	%f24, %f13, %f20
	.word	0xde08a024	! t0_kref+0x3914:   	ldub	[%g2 + 0x24], %o7
	.word	0xa7a01895	! t0_kref+0x3918:   	fitos	%f21, %f19
	.word	0x30480008	! t0_kref+0x391c:   	ba,a,pt	%icc, _kref+0x393c
	.word	0xacad400c	! t0_kref+0x3920:   	andncc	%l5, %o4, %l6
	.word	0x99a30850	! t0_kref+0x3924:   	faddd	%f12, %f16, %f12
	.word	0x9efab8ac	! t0_kref+0x3928:   	sdivcc	%o2, -0x754, %o7
	.word	0xa83ef67e	! t0_kref+0x392c:   	xnor	%i3, -0x982, %l4
	.word	0xc76e3ff0	! t0_kref+0x3930:   	prefetch	%i0 - 0x10, 3
	.word	0xaba6082c	! t0_kref+0x3934:   	fadds	%f24, %f12, %f21
	.word	0xa3a6082d	! t0_kref+0x3938:   	fadds	%f24, %f13, %f17
	.word	0x30800004	! t0_kref+0x393c:   	ba,a	_kref+0x394c
	.word	0x95a5482f	! t0_kref+0x3940:   	fadds	%f21, %f15, %f10
	.word	0xa5b58a4a	! t0_kref+0x3944:   	fpadd32	%f22, %f10, %f18
	.word	0x9f2d8015	! t0_kref+0x3948:   	sll	%l6, %l5, %o7
	.word	0x9da208ce	! t0_kref+0x394c:   	fsubd	%f8, %f14, %f14
	.word	0x95a01928	! t0_kref+0x3950:   	fstod	%f8, %f10
	.word	0x81ab8ad0	! t0_kref+0x3954:   	fcmped	%fcc0, %f14, %f16
	.word	0x36800007	! t0_kref+0x3958:   	bge,a	_kref+0x3974
	.word	0xae3aab51	! t0_kref+0x395c:   	xnor	%o2, 0xb51, %l7
	.word	0x9512c009	! t0_kref+0x3960:   	taddcctv	%o3, %o1, %o2
	.word	0xe8d6d018	! t0_kref+0x3964:   	ldsha	[%i3 + %i0]0x80, %l4
	.word	0xe4067fec	! t0_kref+0x3968:   	ld	[%i1 - 0x14], %l2
	.word	0xc568a04a	! t0_kref+0x396c:   	prefetch	%g2 + 0x4a, 2
	.word	0xe2df5018	! t0_kref+0x3970:   	ldxa	[%i5 + %i0]0x80, %l1
	.word	0xd048a021	! t0_kref+0x3974:   	ldsb	[%g2 + 0x21], %o0
	.word	0x94968000	! t0_kref+0x3978:   	orcc	%i2, %g0, %o2
	.word	0xa3b0076a	! t0_kref+0x397c:   	fpack16	%f10, %f17
	.word	0xa812a5ff	! t0_kref+0x3980:   	or	%o2, 0x5ff, %l4
	.word	0x21279e5b	! t0_kref+0x3984:   	sethi	%hi(0x9e796c00), %l0
	.word	0x9a0ac016	! t0_kref+0x3988:   	and	%o3, %l6, %o5
	.word	0xe24e8018	! t0_kref+0x398c:   	ldsb	[%i2 + %i0], %l1
	.word	0xa3700014	! t0_kref+0x3990:   	popc	%l4, %l1
	.word	0xe006001c	! t0_kref+0x3994:   	ld	[%i0 + %i4], %l0
	.word	0x97b4048a	! t0_kref+0x3998:   	fcmple32	%f16, %f10, %o3
	.word	0xe8263ffc	! t0_kref+0x399c:   	st	%l4, [%i0 - 4]
	.word	0x29800002	! t0_kref+0x39a0:   	fbl,a	_kref+0x39a8
	.word	0xb1a389d2	! t0_kref+0x39a4:   	fdivd	%f14, %f18, %f24
	.word	0xaf650015	! t0_kref+0x39a8:   	movleu	%icc, %l5, %l7
	.word	0xa92522af	! t0_kref+0x39ac:   	mulscc	%l4, 0x2af, %l4
	.word	0x81aa8a56	! t0_kref+0x39b0:   	fcmpd	%fcc0, %f10, %f22
	.word	0xec50a026	! t0_kref+0x39b4:   	ldsh	[%g2 + 0x26], %l6
	.word	0xa5a00131	! t0_kref+0x39b8:   	fabss	%f17, %f18
	.word	0xc96e6010	! t0_kref+0x39bc:   	prefetch	%i1 + 0x10, 4
	.word	0xe59e1000	! t0_kref+0x39c0:   	ldda	[%i0]0x80, %f18
	.word	0x9085c00a	! t0_kref+0x39c4:   	addcc	%l7, %o2, %o0
	.word	0xa4f5401b	! t0_kref+0x39c8:   	udivcc	%l5, %i3, %l2
	.word	0x9de3bfa0	! t0_kref+0x39cc:   	save	%sp, -0x60, %sp
	.word	0xb2df4000	! t0_kref+0x39d0:   	smulcc	%i5, %g0, %i1
	.word	0xa3ef7c09	! t0_kref+0x39d4:   	restore	%i5, -0x3f7, %l1
	.word	0xe8801019	! t0_kref+0x39d8:   	lda	[%g0 + %i1]0x80, %l4
	.word	0x28800003	! t0_kref+0x39dc:   	bleu,a	_kref+0x39e8
	.word	0x99b5cc76	! t0_kref+0x39e0:   	fnors	%f23, %f22, %f12
	.word	0xd816c019	! t0_kref+0x39e4:   	lduh	[%i3 + %i1], %o4
	.word	0xa1b3074a	! t0_kref+0x39e8:   	fpack32	%f12, %f10, %f16
	.word	0x20480006	! t0_kref+0x39ec:   	bn,a,pt	%icc, _kref+0x3a04
	.word	0x93a2482c	! t0_kref+0x39f0:   	fadds	%f9, %f12, %f9
	.word	0x97b44f76	! t0_kref+0x39f4:   	fornot1s	%f17, %f22, %f11
	.word	0xadb38d12	! t0_kref+0x39f8:   	fandnot1	%f14, %f18, %f22
	.word	0xe51fbea0	! t0_kref+0x39fc:   	ldd	[%fp - 0x160], %f18
	.word	0x3c800004	! t0_kref+0x3a00:   	bpos,a	_kref+0x3a10
	.word	0x9a2efe4f	! t0_kref+0x3a04:   	andn	%i3, -0x1b1, %o5
	.word	0x8143c000	! t0_kref+0x3a08:   	stbar
	.word	0xd66e001a	! t0_kref+0x3a0c:   	ldstub	[%i0 + %i2], %o3
	.word	0xa4258015	! t0_kref+0x3a10:   	sub	%l6, %l5, %l2
	.word	0x9870001b	! t0_kref+0x3a14:   	udiv	%g0, %i3, %o4
	.word	0xada0192d	! t0_kref+0x3a18:   	fstod	%f13, %f22
	.word	0xed68a080	! t0_kref+0x3a1c:   	prefetch	%g2 + 0x80, 22
	.word	0x95b2810d	! t0_kref+0x3a20:   	edge32	%o2, %o5, %o2
	.word	0xf436200a	! t0_kref+0x3a24:   	sth	%i2, [%i0 + 0xa]
	.word	0x81ad4ab9	! t0_kref+0x3a28:   	fcmpes	%fcc0, %f21, %f25
	.word	0xafb2400a	! t0_kref+0x3a2c:   	edge8	%o1, %o2, %l7
	.word	0x93b68240	! t0_kref+0x3a30:   	array16	%i2, %g0, %o1
	.word	0xa3a0012c	! t0_kref+0x3a34:   	fabss	%f12, %f17
	.word	0xada388b6	! t0_kref+0x3a38:   	fsubs	%f14, %f22, %f22
	.word	0x30480007	! t0_kref+0x3a3c:   	ba,a,pt	%icc, _kref+0x3a58
	.word	0x99a00558	! t0_kref+0x3a40:   	fsqrtd	%f24, %f12
	.word	0xac08000b	! t0_kref+0x3a44:   	and	%g0, %o3, %l6
	.word	0xaa9b61e5	! t0_kref+0x3a48:   	xorcc	%o5, 0x1e5, %l5
	.word	0xda48a00d	! t0_kref+0x3a4c:   	ldsb	[%g2 + 0xd], %o5
	.word	0xeb00a034	! t0_kref+0x3a50:   	ld	[%g2 + 0x34], %f21
	.word	0xf83f4018	! t0_kref+0x3a54:   	std	%i4, [%i5 + %i0]
	.word	0xc768a000	! t0_kref+0x3a58:   	prefetch	%g2, 3
	.word	0x989825ca	! t0_kref+0x3a5c:   	xorcc	%g0, 0x5ca, %o4
	.word	0x2e800004	! t0_kref+0x3a60:   	bvs,a	_kref+0x3a70
	.word	0xd456c018	! t0_kref+0x3a64:   	ldsh	[%i3 + %i0], %o2
	.word	0x34480005	! t0_kref+0x3a68:   	bg,a,pt	%icc, _kref+0x3a7c
	.word	0xa5a00558	! t0_kref+0x3a6c:   	fsqrtd	%f24, %f18
	.word	0xee266010	! t0_kref+0x3a70:   	st	%l7, [%i1 + 0x10]
	.word	0xa03b7999	! t0_kref+0x3a74:   	xnor	%o5, -0x667, %l0
	.word	0x81b01027	! t0_kref+0x3a78:   	siam	0x7
	.word	0xd3263ff0	! t0_kref+0x3a7c:   	st	%f9, [%i0 - 0x10]
	.word	0x878020f0	! t0_kref+0x3a80:   	mov	0xf0, %asi
	.word	0x001fffff	! t0_kref+0x3a84:   	illtrap	0x1fffff
	.word	0x9a082267	! t0_kref+0x3a88:   	and	%g0, 0x267, %o5
	.word	0xc568a00f	! t0_kref+0x3a8c:   	prefetch	%g2 + 0xf, 2
	.word	0xafb48c77	! t0_kref+0x3a90:   	fnors	%f18, %f23, %f23
	.word	0xeb68a08e	! t0_kref+0x3a94:   	prefetch	%g2 + 0x8e, 21
	.word	0x3a800008	! t0_kref+0x3a98:   	bcc,a	_kref+0x3ab8
	.word	0x95b50ded	! t0_kref+0x3a9c:   	fnands	%f20, %f13, %f10
	.word	0xdb270018	! t0_kref+0x3aa0:   	st	%f13, [%i4 + %i0]
	.word	0x99b3054e	! t0_kref+0x3aa4:   	fcmpeq16	%f12, %f14, %o4
	.word	0x963b000a	! t0_kref+0x3aa8:   	xnor	%o4, %o2, %o3
	.word	0xdf801018	! t0_kref+0x3aac:   	lda	[%g0 + %i0]0x80, %f15
	.word	0x99a01930	! t0_kref+0x3ab0:   	fstod	%f16, %f12
	.word	0xe3b8a040	! t0_kref+0x3ab4:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x9fa01a28	! t0_kref+0x3ab8:   	fstoi	%f8, %f15
	.word	0x38480001	! t0_kref+0x3abc:   	bgu,a,pt	%icc, _kref+0x3ac0
	.word	0xa1a58948	! t0_kref+0x3ac0:   	fmuld	%f22, %f8, %f16
	.word	0x8143e040	! t0_kref+0x3ac4:   	membar	0x40
	.word	0x93a3482a	! t0_kref+0x3ac8:   	fadds	%f13, %f10, %f9
	.word	0xa1a0192f	! t0_kref+0x3acc:   	fstod	%f15, %f16
	.word	0xd4f65000	! t0_kref+0x3ad0:   	stxa	%o2, [%i1]0x80
	.word	0x33800006	! t0_kref+0x3ad4:   	fbe,a	_kref+0x3aec
	.word	0xacddc00d	! t0_kref+0x3ad8:   	smulcc	%l7, %o5, %l6
	.word	0x36480001	! t0_kref+0x3adc:   	bge,a,pt	%icc, _kref+0x3ae0
	.word	0xac3ee7d3	! t0_kref+0x3ae0:   	xnor	%i3, 0x7d3, %l6
	.word	0xde56601e	! t0_kref+0x3ae4:   	ldsh	[%i1 + 0x1e], %o7
	.word	0x8143c000	! t0_kref+0x3ae8:   	stbar
	.word	0xee070018	! t0_kref+0x3aec:   	ld	[%i4 + %i0], %l7
	.word	0x37800008	! t0_kref+0x3af0:   	fbge,a	_kref+0x3b10
	.word	0xee20a00c	! t0_kref+0x3af4:   	st	%l7, [%g2 + 0xc]
	.word	0xa2fee083	! t0_kref+0x3af8:   	sdivcc	%i3, 0x83, %l1
	.word	0x95b404ca	! t0_kref+0x3afc:   	fcmpne32	%f16, %f10, %o2
	.word	0xaba01889	! t0_kref+0x3b00:   	fitos	%f9, %f21
	.word	0x81ad8aad	! t0_kref+0x3b04:   	fcmpes	%fcc0, %f22, %f13
	.word	0xe93e001d	! t0_kref+0x3b08:   	std	%f20, [%i0 + %i5]
	.word	0x91b34280	! t0_kref+0x3b0c:   	array32	%o5, %g0, %o0
	.word	0x39800001	! t0_kref+0x3b10:   	fbuge,a	_kref+0x3b14
	.word	0xafb34eea	! t0_kref+0x3b14:   	fornot2s	%f13, %f10, %f23
	.word	0xafb3415a	! t0_kref+0x3b18:   	edge32l	%o5, %i2, %l7
	.word	0x97a01a2b	! t0_kref+0x3b1c:   	fstoi	%f11, %f11
	.word	0xd8367fe6	! t0_kref+0x3b20:   	sth	%o4, [%i1 - 0x1a]
	.word	0x99b48c52	! t0_kref+0x3b24:   	fnor	%f18, %f18, %f12
	.word	0xe9380018	! t0_kref+0x3b28:   	std	%f20, [%g0 + %i0]
	.word	0x2f124fb1	! t0_kref+0x3b2c:   	sethi	%hi(0x493ec400), %l7
	.word	0x2a800005	! t0_kref+0x3b30:   	bcs,a	_kref+0x3b44
	.word	0xa9a0192f	! t0_kref+0x3b34:   	fstod	%f15, %f20
	.word	0x32480007	! t0_kref+0x3b38:   	bne,a,pt	%icc, _kref+0x3b54
	.word	0xe240a018	! t0_kref+0x3b3c:   	ldsw	[%g2 + 0x18], %l1
	.word	0x81aa8aac	! t0_kref+0x3b40:   	fcmpes	%fcc0, %f10, %f12
	.word	0xa6b2ae75	! t0_kref+0x3b44:   	orncc	%o2, 0xe75, %l3
	.word	0x81ac8a37	! t0_kref+0x3b48:   	fcmps	%fcc0, %f18, %f23
	.word	0x909dba91	! t0_kref+0x3b4c:   	xorcc	%l6, -0x56f, %o0
	.word	0x9fc10000	! t0_kref+0x3b50:   	call	%g4
	.word	0x93b34a75	! t0_kref+0x3b54:   	fpadd32s	%f13, %f21, %f9
	.word	0x93a00129	! t0_kref+0x3b58:   	fabss	%f9, %f9
	.word	0xacc00016	! t0_kref+0x3b5c:   	addccc	%g0, %l6, %l6
	.word	0xd2062004	! t0_kref+0x3b60:   	ld	[%i0 + 4], %o1
	.word	0xe1beda58	! t0_kref+0x3b64:   	stda	%f16, [%i3 + %i0]0xd2
	.word	0x81ab0aa8	! t0_kref+0x3b68:   	fcmpes	%fcc0, %f12, %f8
	.word	0x92f2a578	! t0_kref+0x3b6c:   	udivcc	%o2, 0x578, %o1
	.word	0xe41e6000	! t0_kref+0x3b70:   	ldd	[%i1], %l2
	.word	0xd848a026	! t0_kref+0x3b74:   	ldsb	[%g2 + 0x26], %o4
	.word	0xa20ea804	! t0_kref+0x3b78:   	and	%i2, 0x804, %l1
	.word	0x9ab3400d	! t0_kref+0x3b7c:   	orncc	%o5, %o5, %o5
	.word	0x95b40f88	! t0_kref+0x3b80:   	for	%f16, %f8, %f10
	.word	0x9bb68240	! t0_kref+0x3b84:   	array16	%i2, %g0, %o5
	.word	0x86102003	! t0_kref+0x3b88:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x3b8c:   	bne,a	_kref+0x3b8c
	.word	0x86a0e001	! t0_kref+0x3b90:   	subcc	%g3, 1, %g3
	.word	0xa4aa400d	! t0_kref+0x3b94:   	andncc	%o1, %o5, %l2
	.word	0xa523400c	! t0_kref+0x3b98:   	mulscc	%o5, %o4, %l2
	.word	0xada349a8	! t0_kref+0x3b9c:   	fdivs	%f13, %f8, %f22
	.word	0x9fa00135	! t0_kref+0x3ba0:   	fabss	%f21, %f15
	.word	0xc398a040	! t0_kref+0x3ba4:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0x93a01a56	! t0_kref+0x3ba8:   	fdtoi	%f22, %f9
	.word	0xf3262008	! t0_kref+0x3bac:   	st	%f25, [%i0 + 8]
	.word	0xedee101a	! t0_kref+0x3bb0:   	prefetcha	%i0 + %i2, 22
	.word	0x913a801b	! t0_kref+0x3bb4:   	sra	%o2, %i3, %o0
	.word	0xadb2058a	! t0_kref+0x3bb8:   	fcmpgt32	%f8, %f10, %l6
	.word	0xea262000	! t0_kref+0x3bbc:   	st	%l5, [%i0]
	.word	0x85832137	! t0_kref+0x3bc0:   	wr	%o4, 0x137, %ccr
	.word	0xe53e0000	! t0_kref+0x3bc4:   	std	%f18, [%i0]
	.word	0x32800003	! t0_kref+0x3bc8:   	bne,a	_kref+0x3bd4
	.word	0xac8a801b	! t0_kref+0x3bcc:   	andcc	%o2, %i3, %l6
	.word	0xe8d81019	! t0_kref+0x3bd0:   	ldxa	[%g0 + %i1]0x80, %l4
	.word	0xaa124008	! t0_kref+0x3bd4:   	or	%o1, %o0, %l5
	.word	0xd0266018	! t0_kref+0x3bd8:   	st	%o0, [%i1 + 0x18]
	.word	0x9da4c9a8	! t0_kref+0x3bdc:   	fdivs	%f19, %f8, %f14
	.word	0xd11e4000	! t0_kref+0x3be0:   	ldd	[%i1], %f8
	.word	0xd236600e	! t0_kref+0x3be4:   	sth	%o1, [%i1 + 0xe]
	.word	0xa5b40a4e	! t0_kref+0x3be8:   	fpadd32	%f16, %f14, %f18
	.word	0x1b2ebafa	! t0_kref+0x3bec:   	sethi	%hi(0xbaebe800), %o5
	.word	0x9b2b4015	! t0_kref+0x3bf0:   	sll	%o5, %l5, %o5
	.word	0xa9a01a29	! t0_kref+0x3bf4:   	fstoi	%f9, %f20
	.word	0xa6383005	! t0_kref+0x3bf8:   	xnor	%g0, -0xffb, %l3
	.word	0xe240a030	! t0_kref+0x3bfc:   	ldsw	[%g2 + 0x30], %l1
	.word	0x99b6048a	! t0_kref+0x3c00:   	fcmple32	%f24, %f10, %o4
	.word	0xd2d01019	! t0_kref+0x3c04:   	ldsha	[%g0 + %i1]0x80, %o1
	.word	0x95b34634	! t0_kref+0x3c08:   	fmul8x16	%f13, %f20, %f10
	.word	0xc1ee101a	! t0_kref+0x3c0c:   	prefetcha	%i0 + %i2, 0
	.word	0xd6262008	! t0_kref+0x3c10:   	st	%o3, [%i0 + 8]
	.word	0xab2b200d	! t0_kref+0x3c14:   	sll	%o4, 0xd, %l5
	.word	0xa522c015	! t0_kref+0x3c18:   	mulscc	%o3, %l5, %l2
	.word	0x91a489d8	! t0_kref+0x3c1c:   	fdivd	%f18, %f24, %f8
	.word	0xae0b4017	! t0_kref+0x3c20:   	and	%o5, %l7, %l7
	.word	0xe8901018	! t0_kref+0x3c24:   	lduha	[%g0 + %i0]0x80, %l4
	.word	0xd2360000	! t0_kref+0x3c28:   	sth	%o1, [%i0]
	.word	0x9fa4c8b4	! t0_kref+0x3c2c:   	fsubs	%f19, %f20, %f15
	.word	0xa5c06c32	! t0_kref+0x3c30:   	jmpl	%g1 + 0xc32, %l2
	.word	0xa1b40d16	! t0_kref+0x3c34:   	fandnot1	%f16, %f22, %f16
	.word	0x8143c000	! t0_kref+0x3c38:   	stbar
	.word	0xec10a020	! t0_kref+0x3c3c:   	lduh	[%g2 + 0x20], %l6
	.word	0xea0e7feb	! t0_kref+0x3c40:   	ldub	[%i1 - 0x15], %l5
	.word	0x99a01a56	! t0_kref+0x3c44:   	fdtoi	%f22, %f12
	.word	0xada00133	! t0_kref+0x3c48:   	fabss	%f19, %f22
	.word	0x989331ab	! t0_kref+0x3c4c:   	orcc	%o4, -0xe55, %o4
	.word	0xa92a201d	! t0_kref+0x3c50:   	sll	%o0, 0x1d, %l4
	.word	0x8143e040	! t0_kref+0x3c54:   	membar	0x40
	.word	0x37800006	! t0_kref+0x3c58:   	fbge,a	_kref+0x3c70
	.word	0xa22ac000	! t0_kref+0x3c5c:   	andn	%o3, %g0, %l1
	.word	0xa7b2804a	! t0_kref+0x3c60:   	edge8l	%o2, %o2, %l3
	.word	0x912ee015	! t0_kref+0x3c64:   	sll	%i3, 0x15, %o0
	.word	0x81adcab1	! t0_kref+0x3c68:   	fcmpes	%fcc0, %f23, %f17
	.word	0xd42e6000	! t0_kref+0x3c6c:   	stb	%o2, [%i1]
	.word	0x91b24aef	! t0_kref+0x3c70:   	fpsub32s	%f9, %f15, %f8
	.word	0xea167ffa	! t0_kref+0x3c74:   	lduh	[%i1 - 6], %l5
	.word	0xb3a2c9b6	! t0_kref+0x3c78:   	fdivs	%f11, %f22, %f25
	.word	0xd700a030	! t0_kref+0x3c7c:   	ld	[%g2 + 0x30], %f11
	.word	0xd2562000	! t0_kref+0x3c80:   	ldsh	[%i0], %o1
	.word	0xe256c019	! t0_kref+0x3c84:   	ldsh	[%i3 + %i1], %l1
	.word	0xa293400b	! t0_kref+0x3c88:   	orcc	%o5, %o3, %l1
	.word	0xec7e600c	! t0_kref+0x3c8c:   	swap	[%i1 + 0xc], %l6
	.word	0xe13e7fe0	! t0_kref+0x3c90:   	std	%f16, [%i1 - 0x20]
	.word	0xd6564000	! t0_kref+0x3c94:   	ldsh	[%i1], %o3
	.word	0xac0a000d	! t0_kref+0x3c98:   	and	%o0, %o5, %l6
	.word	0x9ba289ac	! t0_kref+0x3c9c:   	fdivs	%f10, %f12, %f13
	.word	0xa1a01a48	! t0_kref+0x3ca0:   	fdtoi	%f8, %f16
	.word	0xafb5c16d	! t0_kref+0x3ca4:   	edge32ln	%l7, %o5, %l7
	.word	0xda6e7ff6	! t0_kref+0x3ca8:   	ldstub	[%i1 - 0xa], %o5
	.word	0x99b40f6b	! t0_kref+0x3cac:   	fornot1s	%f16, %f11, %f12
	.word	0xc3ee100c	! t0_kref+0x3cb0:   	prefetcha	%i0 + %o4, 1
	.word	0x91a000ca	! t0_kref+0x3cb4:   	fnegd	%f10, %f8
	.word	0x9896aac9	! t0_kref+0x3cb8:   	orcc	%i2, 0xac9, %o4
	.word	0xe44e8019	! t0_kref+0x3cbc:   	ldsb	[%i2 + %i1], %l2
	.word	0xe7e6100b	! t0_kref+0x3cc0:   	casa	[%i0]0x80, %o3, %l3
	.word	0x93b00768	! t0_kref+0x3cc4:   	fpack16	%f8, %f9
	.word	0xd040a000	! t0_kref+0x3cc8:   	ldsw	[%g2], %o0
	.word	0x98e37cd6	! t0_kref+0x3ccc:   	subccc	%o5, -0x32a, %o4
	.word	0xa82d232a	! t0_kref+0x3cd0:   	andn	%l4, 0x32a, %l4
	.word	0xd64e001a	! t0_kref+0x3cd4:   	ldsb	[%i0 + %i2], %o3
	.word	0xd200a024	! t0_kref+0x3cd8:   	ld	[%g2 + 0x24], %o1
	.word	0x22800006	! t0_kref+0x3cdc:   	be,a	_kref+0x3cf4
	.word	0xa120232a	! t0_kref+0x3ce0:   	mulscc	%g0, 0x32a, %l0
	.word	0xa025701f	! t0_kref+0x3ce4:   	sub	%l5, -0xfe1, %l0
	.word	0x20480008	! t0_kref+0x3ce8:   	bn,a,pt	%icc, _kref+0x3d08
	.word	0xeede5000	! t0_kref+0x3cec:   	ldxa	[%i1]0x80, %l7
	.word	0xada00536	! t0_kref+0x3cf0:   	fsqrts	%f22, %f22
	.word	0x9e35c00d	! t0_kref+0x3cf4:   	orn	%l7, %o5, %o7
	.word	0xeb00a010	! t0_kref+0x3cf8:   	ld	[%g2 + 0x10], %f21
	.word	0xe9be5a5d	! t0_kref+0x3cfc:   	stda	%f20, [%i1 + %i5]0xd2
	.word	0xa02d7059	! t0_kref+0x3d00:   	andn	%l5, -0xfa7, %l0
	.word	0xe51e0000	! t0_kref+0x3d04:   	ldd	[%i0], %f18
	.word	0xd4270018	! t0_kref+0x3d08:   	st	%o2, [%i4 + %i0]
	.word	0xd82e6012	! t0_kref+0x3d0c:   	stb	%o4, [%i1 + 0x12]
	.word	0xa9b30aaa	! t0_kref+0x3d10:   	fpsub16s	%f12, %f10, %f20
	.word	0x980a4015	! t0_kref+0x3d14:   	and	%o1, %l5, %o4
	.word	0x9bb54ef9	! t0_kref+0x3d18:   	fornot2s	%f21, %f25, %f13
	.word	0xa9b58dd4	! t0_kref+0x3d1c:   	fnand	%f22, %f20, %f20
	.word	0x36480006	! t0_kref+0x3d20:   	bge,a,pt	%icc, _kref+0x3d38
	.word	0xa83dc014	! t0_kref+0x3d24:   	xnor	%l7, %l4, %l4
	.word	0x2b800008	! t0_kref+0x3d28:   	fbug,a	_kref+0x3d48
	.word	0xa63a4000	! t0_kref+0x3d2c:   	not	%o1, %l3
	.word	0xadb48dd0	! t0_kref+0x3d30:   	fnand	%f18, %f16, %f22
	.word	0x27338df8	! t0_kref+0x3d34:   	sethi	%hi(0xce37e000), %l3
	.word	0xb1a2c835	! t0_kref+0x3d38:   	fadds	%f11, %f21, %f24
	.word	0xa1a01a38	! t0_kref+0x3d3c:   	fstoi	%f24, %f16
	.word	0x95b40c56	! t0_kref+0x3d40:   	fnor	%f16, %f22, %f10
	.word	0x9fa01a2c	! t0_kref+0x3d44:   	fstoi	%f12, %f15
	.word	0x81580000	! t0_kref+0x3d48:   	flushw
	.word	0x91a0002d	! t0_kref+0x3d4c:   	fmovs	%f13, %f8
	.word	0xa5b00cf0	! t0_kref+0x3d50:   	fnot2s	%f16, %f18
	.word	0xa52a800a	! t0_kref+0x3d54:   	sll	%o2, %o2, %l2
	.word	0xe726401c	! t0_kref+0x3d58:   	st	%f19, [%i1 + %i4]
	.word	0xa9a489ce	! t0_kref+0x3d5c:   	fdivd	%f18, %f14, %f20
	.word	0xf36e001a	! t0_kref+0x3d60:   	prefetch	%i0 + %i2, 25
	.word	0xd28e101a	! t0_kref+0x3d64:   	lduba	[%i0 + %i2]0x80, %o1
	.word	0x91a01890	! t0_kref+0x3d68:   	fitos	%f16, %f8
	.word	0xc0300019	! t0_kref+0x3d6c:   	clrh	[%g0 + %i1]
	.word	0x9883001b	! t0_kref+0x3d70:   	addcc	%o4, %i3, %o4
	.word	0xe28e101a	! t0_kref+0x3d74:   	lduba	[%i0 + %i2]0x80, %l1
	.word	0x9045c00c	! t0_kref+0x3d78:   	addc	%l7, %o4, %o0
	.word	0xaf7030ca	! t0_kref+0x3d7c:   	popc	-0xf36, %l7
	.word	0x99a00554	! t0_kref+0x3d80:   	fsqrtd	%f20, %f12
	.word	0xda20a030	! t0_kref+0x3d84:   	st	%o5, [%g2 + 0x30]
	.word	0x912da01a	! t0_kref+0x3d88:   	sll	%l6, 0x1a, %o0
	.word	0xe8767ff0	! t0_kref+0x3d8c:   	stx	%l4, [%i1 - 0x10]
	.word	0x9fa0188b	! t0_kref+0x3d90:   	fitos	%f11, %f15
	.word	0xa29b62bd	! t0_kref+0x3d94:   	xorcc	%o5, 0x2bd, %l1
	.word	0xa9b3400d	! t0_kref+0x3d98:   	edge8	%o5, %o5, %l4
	.word	0xda40a024	! t0_kref+0x3d9c:   	ldsw	[%g2 + 0x24], %o5
	.word	0xaaaa801b	! t0_kref+0x3da0:   	andncc	%o2, %i3, %l5
	.word	0xf96e401d	! t0_kref+0x3da4:   	prefetch	%i1 + %i5, 28
	.word	0xeda71019	! t0_kref+0x3da8:   	sta	%f22, [%i4 + %i1]0x80
	.word	0xd9266004	! t0_kref+0x3dac:   	st	%f12, [%i1 + 4]
	.word	0xa1a44837	! t0_kref+0x3db0:   	fadds	%f17, %f23, %f16
	.word	0xd250a00e	! t0_kref+0x3db4:   	ldsh	[%g2 + 0xe], %o1
	.word	0xe7264000	! t0_kref+0x3db8:   	st	%f19, [%i1]
	.word	0xe48e9018	! t0_kref+0x3dbc:   	lduba	[%i2 + %i0]0x80, %l2
	.word	0x3c800008	! t0_kref+0x3dc0:   	bpos,a	_kref+0x3de0
	.word	0xa1b6c05b	! t0_kref+0x3dc4:   	edge8l	%i3, %i3, %l0
	.word	0x91b58998	! t0_kref+0x3dc8:   	bshuffle	%f22, %f24, %f8
	.word	0xf11e0000	! t0_kref+0x3dcc:   	ldd	[%i0], %f24
	.word	0xb1b44a6a	! t0_kref+0x3dd0:   	fpadd32s	%f17, %f10, %f24
	.word	0xa3a609aa	! t0_kref+0x3dd4:   	fdivs	%f24, %f10, %f17
	.word	0x9296c015	! t0_kref+0x3dd8:   	orcc	%i3, %l5, %o1
	.word	0x988368ca	! t0_kref+0x3ddc:   	addcc	%o5, 0x8ca, %o4
	.word	0x91a0102b	! t0_kref+0x3de0:   	fstox	%f11, %f8
	.word	0x20480008	! t0_kref+0x3de4:   	bn,a,pt	%icc, _kref+0x3e04
	.word	0xeb6e401c	! t0_kref+0x3de8:   	prefetch	%i1 + %i4, 21
	.word	0x2b2ab25f	! t0_kref+0x3dec:   	sethi	%hi(0xaac97c00), %l5
	.word	0xa9a01a31	! t0_kref+0x3df0:   	fstoi	%f17, %f20
	.word	0x91b4cdaf	! t0_kref+0x3df4:   	fxors	%f19, %f15, %f8
	.word	0xe82e0000	! t0_kref+0x3df8:   	stb	%l4, [%i0]
	.word	0xa92de016	! t0_kref+0x3dfc:   	sll	%l7, 0x16, %l4
	.word	0xda362016	! t0_kref+0x3e00:   	sth	%o5, [%i0 + 0x16]
	.word	0x9a36c015	! t0_kref+0x3e04:   	orn	%i3, %l5, %o5
	.word	0x8143e040	! t0_kref+0x3e08:   	membar	0x40
	.word	0xa9a4cd29	! t0_kref+0x3e0c:   	fsmuld	%f19, %f9, %f20
	.word	0xadb28a94	! t0_kref+0x3e10:   	fpsub16	%f10, %f20, %f22
	.word	0x3e480005	! t0_kref+0x3e14:   	bvc,a,pt	%icc, _kref+0x3e28
	.word	0x81868000	! t0_kref+0x3e18:   	wr	%i2, %g0, %y
	.word	0x81ae0a30	! t0_kref+0x3e1c:   	fcmps	%fcc0, %f24, %f16
	.word	0xc9ee100c	! t0_kref+0x3e20:   	prefetcha	%i0 + %o4, 4
	.word	0xa9a0110e	! t0_kref+0x3e24:   	fxtod	%f14, %f20
	.word	0xa1a00548	! t0_kref+0x3e28:   	fsqrtd	%f8, %f16
	.word	0xd0480019	! t0_kref+0x3e2c:   	ldsb	[%g0 + %i1], %o0
	.word	0x94d82a6f	! t0_kref+0x3e30:   	smulcc	%g0, 0xa6f, %o2
	.word	0xa1a00033	! t0_kref+0x3e34:   	fmovs	%f19, %f16
	.word	0x95b48556	! t0_kref+0x3e38:   	fcmpeq16	%f18, %f22, %o2
	.word	0xae96800a	! t0_kref+0x3e3c:   	orcc	%i2, %o2, %l7
	.word	0xac12c015	! t0_kref+0x3e40:   	or	%o3, %l5, %l6
	.word	0x38480004	! t0_kref+0x3e44:   	bgu,a,pt	%icc, _kref+0x3e54
	.word	0xd6360000	! t0_kref+0x3e48:   	sth	%o3, [%i0]
	.word	0xd208a029	! t0_kref+0x3e4c:   	ldub	[%g2 + 0x29], %o1
	.word	0xe0062004	! t0_kref+0x3e50:   	ld	[%i0 + 4], %l0
	.word	0x2e800008	! t0_kref+0x3e54:   	bvs,a	_kref+0x3e74
	.word	0x91a01108	! t0_kref+0x3e58:   	fxtod	%f8, %f8
	.word	0x99a50956	! t0_kref+0x3e5c:   	fmuld	%f20, %f22, %f12
	.word	0x32480007	! t0_kref+0x3e60:   	bne,a,pt	%icc, _kref+0x3e7c
	.word	0xe01e3ff0	! t0_kref+0x3e64:   	ldd	[%i0 - 0x10], %l0
	.word	0xd896505b	! t0_kref+0x3e68:   	lduha	[%i1 + %i3]0x82, %o4
	.word	0x98b54015	! t0_kref+0x3e6c:   	orncc	%l5, %l5, %o4
	.word	0xb1b40dd0	! t0_kref+0x3e70:   	fnand	%f16, %f16, %f24
	.word	0x91a01a56	! t0_kref+0x3e74:   	fdtoi	%f22, %f8
	.word	0x949deca8	! t0_kref+0x3e78:   	xorcc	%l7, 0xca8, %o2
	.word	0x81ad0a52	! t0_kref+0x3e7c:   	fcmpd	%fcc0, %f20, %f18
	.word	0x90b2294a	! t0_kref+0x3e80:   	orncc	%o0, 0x94a, %o0
	.word	0xe6567fee	! t0_kref+0x3e84:   	ldsh	[%i1 - 0x12], %l3
	.word	0x9a8e800d	! t0_kref+0x3e88:   	andcc	%i2, %o5, %o5
	.word	0xec270018	! t0_kref+0x3e8c:   	st	%l6, [%i4 + %i0]
	.word	0xeeb61000	! t0_kref+0x3e90:   	stha	%l7, [%i0]0x80
	.word	0x95b500c8	! t0_kref+0x3e94:   	edge16l	%l4, %o0, %o2
	.word	0xa1a0192a	! t0_kref+0x3e98:   	fstod	%f10, %f16
	.word	0x94932dc5	! t0_kref+0x3e9c:   	orcc	%o4, 0xdc5, %o2
	.word	0xa3b30175	! t0_kref+0x3ea0:   	edge32ln	%o4, %l5, %l1
	.word	0xa3282002	! t0_kref+0x3ea4:   	sll	%g0, 0x2, %l1
	.word	0xb1a00556	! t0_kref+0x3ea8:   	fsqrtd	%f22, %f24
	.word	0x99a309a9	! t0_kref+0x3eac:   	fdivs	%f12, %f9, %f12
	.word	0xee270019	! t0_kref+0x3eb0:   	st	%l7, [%i4 + %i1]
	.word	0xa7a01a33	! t0_kref+0x3eb4:   	fstoi	%f19, %f19
	.word	0x91a309ac	! t0_kref+0x3eb8:   	fdivs	%f12, %f12, %f8
	.word	0xa4b2c00c	! t0_kref+0x3ebc:   	orncc	%o3, %o4, %l2
	.word	0xa42d0017	! t0_kref+0x3ec0:   	andn	%l4, %l7, %l2
	.word	0x9882c009	! t0_kref+0x3ec4:   	addcc	%o3, %o1, %o4
	.word	0xaf234009	! t0_kref+0x3ec8:   	mulscc	%o5, %o1, %l7
	.word	0x9e2dea38	! t0_kref+0x3ecc:   	andn	%l7, 0xa38, %o7
	.word	0xe810a03a	! t0_kref+0x3ed0:   	lduh	[%g2 + 0x3a], %l4
	.word	0xef68a041	! t0_kref+0x3ed4:   	prefetch	%g2 + 0x41, 23
	.word	0x2a800007	! t0_kref+0x3ed8:   	bcs,a	_kref+0x3ef4
	.word	0x98f6c00c	! t0_kref+0x3edc:   	udivcc	%i3, %o4, %o4
	.word	0x81aa0a2b	! t0_kref+0x3ee0:   	fcmps	%fcc0, %f8, %f11
	.word	0xac15c00c	! t0_kref+0x3ee4:   	or	%l7, %o4, %l6
	.word	0x9bb5c240	! t0_kref+0x3ee8:   	array16	%l7, %g0, %o5
	.word	0xe6500018	! t0_kref+0x3eec:   	ldsh	[%g0 + %i0], %l3
	.word	0x81ad4aae	! t0_kref+0x3ef0:   	fcmpes	%fcc0, %f21, %f14
	.word	0x922d4000	! t0_kref+0x3ef4:   	andn	%l5, %g0, %o1
	.word	0xa9b54729	! t0_kref+0x3ef8:   	fmuld8ulx16	%f21, %f9, %f20
	.word	0xecb01019	! t0_kref+0x3efc:   	stha	%l6, [%g0 + %i1]0x80
	.word	0xec000019	! t0_kref+0x3f00:   	ld	[%g0 + %i1], %l6
	.word	0xe93e0000	! t0_kref+0x3f04:   	std	%f20, [%i0]
	.word	0xec1e7ff0	! t0_kref+0x3f08:   	ldd	[%i1 - 0x10], %l6
	.word	0xa1a3884c	! t0_kref+0x3f0c:   	faddd	%f14, %f12, %f16
	.word	0xa6b569cf	! t0_kref+0x3f10:   	orncc	%l5, 0x9cf, %l3
	.word	0x878020d2	! t0_kref+0x3f14:   	mov	0xd2, %asi
	.word	0x95b5832c	! t0_kref+0x3f18:   	bmask	%l6, %o4, %o2
	.word	0x91b50990	! t0_kref+0x3f1c:   	bshuffle	%f20, %f16, %f8
	.word	0x90b2c00b	! t0_kref+0x3f20:   	orncc	%o3, %o3, %o0
	.word	0x9ba01a37	! t0_kref+0x3f24:   	fstoi	%f23, %f13
	.word	0x944038ac	! t0_kref+0x3f28:   	addc	%g0, -0x754, %o2
	.word	0x87802080	! t0_kref+0x3f2c:   	mov	0x80, %asi
	.word	0xed6e001a	! t0_kref+0x3f30:   	prefetch	%i0 + %i2, 22
	.word	0x131f6449	! t0_kref+0x3f34:   	sethi	%hi(0x7d912400), %o1
	.word	0x94f5c009	! t0_kref+0x3f38:   	udivcc	%l7, %o1, %o2
	.word	0x99200009	! t0_kref+0x3f3c:   	mulscc	%g0, %o1, %o4
	.word	0xec90a030	! t0_kref+0x3f40:   	lduha	[%g2 + 0x30]%asi, %l6
	.word	0x81ad8ac8	! t0_kref+0x3f44:   	fcmped	%fcc0, %f22, %f8
	.word	0x9ba01a50	! t0_kref+0x3f48:   	fdtoi	%f16, %f13
	.word	0x90b6c017	! t0_kref+0x3f4c:   	orncc	%i3, %l7, %o0
	.word	0xe500a024	! t0_kref+0x3f50:   	ld	[%g2 + 0x24], %f18
	.word	0x92fd0008	! t0_kref+0x3f54:   	sdivcc	%l4, %o0, %o1
	.word	0xc026401c	! t0_kref+0x3f58:   	clr	[%i1 + %i4]
	.word	0xa9a2cd36	! t0_kref+0x3f5c:   	fsmuld	%f11, %f22, %f20
	.word	0xd8c0a024	! t0_kref+0x3f60:   	ldswa	[%g2 + 0x24]%asi, %o4
	.word	0xe47e001c	! t0_kref+0x3f64:   	swap	[%i0 + %i4], %l2
	.word	0xecc0a00c	! t0_kref+0x3f68:   	ldswa	[%g2 + 0xc]%asi, %l6
	.word	0xe5be3ff8	! t0_kref+0x3f6c:   	stda	%f18, [%i0 - 8]%asi
	.word	0xa2833d1c	! t0_kref+0x3f70:   	addcc	%o4, -0x2e4, %l1
	.word	0xa9b5848e	! t0_kref+0x3f74:   	fcmple32	%f22, %f14, %l4
	.word	0xa1154015	! t0_kref+0x3f78:   	taddcctv	%l5, %l5, %l0
	.word	0xa7a01a38	! t0_kref+0x3f7c:   	fstoi	%f24, %f19
	.word	0xea48a03b	! t0_kref+0x3f80:   	ldsb	[%g2 + 0x3b], %l5
	.word	0x81ad0ad8	! t0_kref+0x3f84:   	fcmped	%fcc0, %f20, %f24
	.word	0xada01a56	! t0_kref+0x3f88:   	fdtoi	%f22, %f22
	.word	0xeec0a02c	! t0_kref+0x3f8c:   	ldswa	[%g2 + 0x2c]%asi, %l7
	.word	0x20480004	! t0_kref+0x3f90:   	bn,a,pt	%icc, _kref+0x3fa0
	.word	0xa5b5c169	! t0_kref+0x3f94:   	edge32ln	%l7, %o1, %l2
	.word	0x32480005	! t0_kref+0x3f98:   	bne,a,pt	%icc, _kref+0x3fac
	.word	0x9db48d40	! t0_kref+0x3f9c:   	fnot1	%f18, %f14
	.word	0xaca58000	! t0_kref+0x3fa0:   	subcc	%l6, %g0, %l6
	.word	0xa1a0004c	! t0_kref+0x3fa4:   	fmovd	%f12, %f16
	.word	0x38480005	! t0_kref+0x3fa8:   	bgu,a,pt	%icc, _kref+0x3fbc
	.word	0xd036c018	! t0_kref+0x3fac:   	sth	%o0, [%i3 + %i0]
	.word	0x9db20f92	! t0_kref+0x3fb0:   	for	%f8, %f18, %f14
	.word	0x900a4009	! t0_kref+0x3fb4:   	and	%o1, %o1, %o0
	.word	0xeeae5000	! t0_kref+0x3fb8:   	stba	%l7, [%i1]0x80
	.word	0xada01936	! t0_kref+0x3fbc:   	fstod	%f22, %f22
	.word	0x9025fb5f	! t0_kref+0x3fc0:   	sub	%l7, -0x4a1, %o0
	.word	0x96f30015	! t0_kref+0x3fc4:   	udivcc	%o4, %l5, %o3
	.word	0x9bb4cdad	! t0_kref+0x3fc8:   	fxors	%f19, %f13, %f13
	.word	0xe4c8a012	! t0_kref+0x3fcc:   	ldsba	[%g2 + 0x12]%asi, %l2
	call	SYM(t0_subr0)
	.word	0xae258014	! t0_kref+0x3fd4:   	sub	%l6, %l4, %l7
	.word	0xaa3e8008	! t0_kref+0x3fd8:   	xnor	%i2, %o0, %l5
	.word	0xa9b50069	! t0_kref+0x3fdc:   	edge8ln	%l4, %o1, %l4
	.word	0xa1b00fe0	! t0_kref+0x3fe0:   	fones	%f16
	.word	0xe9be5a5d	! t0_kref+0x3fe4:   	stda	%f20, [%i1 + %i5]0xd2
	.word	0xa9a01929	! t0_kref+0x3fe8:   	fstod	%f9, %f20
	.word	0xe4c8a007	! t0_kref+0x3fec:   	ldsba	[%g2 + 7]%asi, %l2
	.word	0x99b00fc0	! t0_kref+0x3ff0:   	fone	%f12
	.word	0xde88a033	! t0_kref+0x3ff4:   	lduba	[%g2 + 0x33]%asi, %o7
	.word	0xae3a8008	! t0_kref+0x3ff8:   	xnor	%o2, %o0, %l7
	.word	0xb1a489ce	! t0_kref+0x3ffc:   	fdivd	%f18, %f14, %f24
	.word	0x9a98000b	! t0_kref+0x4000:   	xorcc	%g0, %o3, %o5
	.word	0xf83e3fe0	! t0_kref+0x4004:   	std	%i4, [%i0 - 0x20]
	.word	0x3e480006	! t0_kref+0x4008:   	bvc,a,pt	%icc, _kref+0x4020
	.word	0xb1a4c8b0	! t0_kref+0x400c:   	fsubs	%f19, %f16, %f24
	.word	0x99a00556	! t0_kref+0x4010:   	fsqrtd	%f22, %f12
	.word	0xe688a03e	! t0_kref+0x4014:   	lduba	[%g2 + 0x3e]%asi, %l3
	.word	0x20480003	! t0_kref+0x4018:   	bn,a,pt	%icc, _kref+0x4024
	.word	0xd64e200b	! t0_kref+0x401c:   	ldsb	[%i0 + 0xb], %o3
	.word	0x9db60e48	! t0_kref+0x4020:   	fxnor	%f24, %f8, %f14
	.word	0x908e800d	! t0_kref+0x4024:   	andcc	%i2, %o5, %o0
	.word	0xa1a0192d	! t0_kref+0x4028:   	fstod	%f13, %f16
	.word	0x95b60a16	! t0_kref+0x402c:   	fpadd16	%f24, %f22, %f10
	.word	0xe688a035	! t0_kref+0x4030:   	lduba	[%g2 + 0x35]%asi, %l3
	.word	0x2325cc7f	! t0_kref+0x4034:   	sethi	%hi(0x9731fc00), %l1
	.word	0xe01e7fe8	! t0_kref+0x4038:   	ldd	[%i1 - 0x18], %l0
	.word	0x8186c000	! t0_kref+0x403c:   	wr	%i3, %g0, %y
	.word	0xaef2a8c2	! t0_kref+0x4040:   	udivcc	%o2, 0x8c2, %l7
	.word	0xdede5000	! t0_kref+0x4044:   	ldxa	[%i1]0x80, %o7
	.word	0xf1863ffc	! t0_kref+0x4048:   	lda	[%i0 - 4]%asi, %f24
	.word	0xada01a50	! t0_kref+0x404c:   	fdtoi	%f16, %f22
	.word	0x2e480008	! t0_kref+0x4050:   	bvs,a,pt	%icc, _kref+0x4070
	.word	0xd6de7ff0	! t0_kref+0x4054:   	ldxa	[%i1 - 0x10]%asi, %o3
	.word	0x81ac8ad8	! t0_kref+0x4058:   	fcmped	%fcc0, %f18, %f24
	.word	0x9ba01a50	! t0_kref+0x405c:   	fdtoi	%f16, %f13
	.word	0x8143c000	! t0_kref+0x4060:   	stbar
	.word	0xd036401b	! t0_kref+0x4064:   	sth	%o0, [%i1 + %i3]
	.word	0xd026601c	! t0_kref+0x4068:   	st	%o0, [%i1 + 0x1c]
	.word	0x96c2800b	! t0_kref+0x406c:   	addccc	%o2, %o3, %o3
	.word	0xef68a006	! t0_kref+0x4070:   	prefetch	%g2 + 6, 23
	.word	0x86102001	! t0_kref+0x4074:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x4078:   	bne,a	_kref+0x4078
	.word	0x86a0e001	! t0_kref+0x407c:   	subcc	%g3, 1, %g3
	.word	0xadb50c58	! t0_kref+0x4080:   	fnor	%f20, %f24, %f22
	.word	0xec4e001a	! t0_kref+0x4084:   	ldsb	[%i0 + %i2], %l6
	.word	0x81828000	! t0_kref+0x4088:   	wr	%o2, %g0, %y
	.word	0x81ac4a35	! t0_kref+0x408c:   	fcmps	%fcc0, %f17, %f21
	.word	0xa3b3840c	! t0_kref+0x4090:   	fcmple16	%f14, %f12, %l1
	.word	0xdec62008	! t0_kref+0x4094:   	ldswa	[%i0 + 8]%asi, %o7
	.word	0xada588b3	! t0_kref+0x4098:   	fsubs	%f22, %f19, %f22
	.word	0xa1a38856	! t0_kref+0x409c:   	faddd	%f14, %f22, %f16
	.word	0x20800006	! t0_kref+0x40a0:   	bn,a	_kref+0x40b8
	.word	0xafa00139	! t0_kref+0x40a4:   	fabss	%f25, %f23
	.word	0xd048a03c	! t0_kref+0x40a8:   	ldsb	[%g2 + 0x3c], %o0
	.word	0xea270019	! t0_kref+0x40ac:   	st	%l5, [%i4 + %i1]
	.word	0xea2e6018	! t0_kref+0x40b0:   	stb	%l5, [%i1 + 0x18]
	.word	0x9a0aa317	! t0_kref+0x40b4:   	and	%o2, 0x317, %o5
	.word	0x99b00cc8	! t0_kref+0x40b8:   	fnot2	%f8, %f12
	.word	0xafa00037	! t0_kref+0x40bc:   	fmovs	%f23, %f23
	.word	0x99b4c969	! t0_kref+0x40c0:   	fpmerge	%f19, %f9, %f12
	.word	0xa5a2cd2e	! t0_kref+0x40c4:   	fsmuld	%f11, %f14, %f18
	.word	0x97a0012a	! t0_kref+0x40c8:   	fabss	%f10, %f11
	.word	0x96958016	! t0_kref+0x40cc:   	orcc	%l6, %l6, %o3
	.word	0xb3b28a68	! t0_kref+0x40d0:   	fpadd32s	%f10, %f8, %f25
	.word	0x9bb58a35	! t0_kref+0x40d4:   	fpadd16s	%f22, %f21, %f13
	.word	0xa65327bf	! t0_kref+0x40d8:   	umul	%o4, 0x7bf, %l3
	.word	0xecde3ff0	! t0_kref+0x40dc:   	ldxa	[%i0 - 0x10]%asi, %l6
	.word	0x2e800002	! t0_kref+0x40e0:   	bvs,a	_kref+0x40e8
	.word	0xa8db400a	! t0_kref+0x40e4:   	smulcc	%o5, %o2, %l4
	.word	0x91a0054e	! t0_kref+0x40e8:   	fsqrtd	%f14, %f8
	.word	0xb1b50752	! t0_kref+0x40ec:   	fpack32	%f20, %f18, %f24
	.word	0xa1a00558	! t0_kref+0x40f0:   	fsqrtd	%f24, %f16
	.word	0xac230014	! t0_kref+0x40f4:   	sub	%o4, %l4, %l6
	.word	0xe41e4000	! t0_kref+0x40f8:   	ldd	[%i1], %l2
	.word	0xafb3015a	! t0_kref+0x40fc:   	edge32l	%o4, %i2, %l7
	.word	0x97a5482e	! t0_kref+0x4100:   	fadds	%f21, %f14, %f11
	.word	0x81da800d	! t0_kref+0x4104:   	flush	%o2 + %o5
	.word	0xe7e6100a	! t0_kref+0x4108:   	casa	[%i0]0x80, %o2, %l3
	.word	0x38800005	! t0_kref+0x410c:   	bgu,a	_kref+0x4120
	.word	0xe06e8019	! t0_kref+0x4110:   	ldstub	[%i2 + %i1], %l0
	.word	0xd0270019	! t0_kref+0x4114:   	st	%o0, [%i4 + %i1]
	.word	0x91a3894a	! t0_kref+0x4118:   	fmuld	%f14, %f10, %f8
	.word	0xf62e6000	! t0_kref+0x411c:   	stb	%i3, [%i1]
	.word	0xa1a000d6	! t0_kref+0x4120:   	fnegd	%f22, %f16
	.word	0x36800001	! t0_kref+0x4124:   	bge,a	_kref+0x4128
	.word	0x9ba24828	! t0_kref+0x4128:   	fadds	%f9, %f8, %f13
	.word	0x81854000	! t0_kref+0x412c:   	wr	%l5, %g0, %y
	.word	0xa225663f	! t0_kref+0x4130:   	sub	%l5, 0x63f, %l1
	.word	0x96f2801a	! t0_kref+0x4134:   	udivcc	%o2, %i2, %o3
	.word	0x81aaca2b	! t0_kref+0x4138:   	fcmps	%fcc0, %f11, %f11
	.word	0xeff6100a	! t0_kref+0x413c:   	casxa	[%i0]0x80, %o2, %l7
	.word	0x9eda8016	! t0_kref+0x4140:   	smulcc	%o2, %l6, %o7
	.word	0x92b23fb5	! t0_kref+0x4144:   	orncc	%o0, -0x4b, %o1
	.word	0x8185c000	! t0_kref+0x4148:   	wr	%l7, %g0, %y
	.word	0x81aa4a2a	! t0_kref+0x414c:   	fcmps	%fcc0, %f9, %f10
	.word	0xdac0a03c	! t0_kref+0x4150:   	ldswa	[%g2 + 0x3c]%asi, %o5
	.word	0xada01a54	! t0_kref+0x4154:   	fdtoi	%f20, %f22
	.word	0xd04e3fff	! t0_kref+0x4158:   	ldsb	[%i0 - 1], %o0
	.word	0xa09ec00b	! t0_kref+0x415c:   	xorcc	%i3, %o3, %l0
	.word	0x95a0190f	! t0_kref+0x4160:   	fitod	%f15, %f10
	.word	0xc12967d4	! t0_kref+0x4164:   	st	%fsr, [%g5 + 0x7d4]
	.word	0xa8f36d13	! t0_kref+0x4168:   	udivcc	%o5, 0xd13, %l4
	.word	0xd656601a	! t0_kref+0x416c:   	ldsh	[%i1 + 0x1a], %o3
	.word	0xe24e7ff6	! t0_kref+0x4170:   	ldsb	[%i1 - 0xa], %l1
	.word	0xef064000	! t0_kref+0x4174:   	ld	[%i1], %f23
	.word	0xada0190f	! t0_kref+0x4178:   	fitod	%f15, %f22
	.word	0xaeb6c015	! t0_kref+0x417c:   	orncc	%i3, %l5, %l7
	.word	0xd630a016	! t0_kref+0x4180:   	sth	%o3, [%g2 + 0x16]
	.word	0xd636c018	! t0_kref+0x4184:   	sth	%o3, [%i3 + %i0]
	.word	0xada40833	! t0_kref+0x4188:   	fadds	%f16, %f19, %f22
	.word	0xd6060000	! t0_kref+0x418c:   	ld	[%i0], %o3
	.word	0x94f2a165	! t0_kref+0x4190:   	udivcc	%o2, 0x165, %o2
	.word	0x9682c015	! t0_kref+0x4194:   	addcc	%o3, %l5, %o3
	call	SYM(t0_subr3)
	.word	0xd0300018	! t0_kref+0x419c:   	sth	%o0, [%g0 + %i0]
	.word	0xb3a01a48	! t0_kref+0x41a0:   	fdtoi	%f8, %f25
	.word	0x98b5fa2c	! t0_kref+0x41a4:   	orncc	%l7, -0x5d4, %o4
	.word	0xa1a3084c	! t0_kref+0x41a8:   	faddd	%f12, %f12, %f16
	.word	0xd53e001d	! t0_kref+0x41ac:   	std	%f10, [%i0 + %i5]
	.word	0x94b2001b	! t0_kref+0x41b0:   	orncc	%o0, %i3, %o2
	.word	0xeaae3ff4	! t0_kref+0x41b4:   	stba	%l5, [%i0 - 0xc]%asi
	.word	0x98f5800c	! t0_kref+0x41b8:   	udivcc	%l6, %o4, %o4
	.word	0x9822629f	! t0_kref+0x41bc:   	sub	%o1, 0x29f, %o4
	.word	0x2f3b9ea1	! t0_kref+0x41c0:   	sethi	%hi(0xee7a8400), %l7
	.word	0xda063ffc	! t0_kref+0x41c4:   	ld	[%i0 - 4], %o5
	.word	0xd5a6501c	! t0_kref+0x41c8:   	sta	%f10, [%i1 + %i4]0x80
	.word	0xa7a5c9a8	! t0_kref+0x41cc:   	fdivs	%f23, %f8, %f19
	.word	0xaba01a56	! t0_kref+0x41d0:   	fdtoi	%f22, %f21
	.word	0x9bb60eee	! t0_kref+0x41d4:   	fornot2s	%f24, %f14, %f13
	.word	0xa3a54831	! t0_kref+0x41d8:   	fadds	%f21, %f17, %f17
	.word	0x91b340d5	! t0_kref+0x41dc:   	edge16l	%o5, %l5, %o0
	.word	0xa2c6a91c	! t0_kref+0x41e0:   	addccc	%i2, 0x91c, %l1
	.word	0xd226600c	! t0_kref+0x41e4:   	st	%o1, [%i1 + 0xc]
	.word	0x9492af97	! t0_kref+0x41e8:   	orcc	%o2, 0xf97, %o2
	.word	0x95a01a4c	! t0_kref+0x41ec:   	fdtoi	%f12, %f10
	.word	0xa222c014	! t0_kref+0x41f0:   	sub	%o3, %l4, %l1
	.word	0xe93e6008	! t0_kref+0x41f4:   	std	%f20, [%i1 + 8]
	.word	0x8143c000	! t0_kref+0x41f8:   	stbar
	.word	0xa8d5801b	! t0_kref+0x41fc:   	umulcc	%l6, %i3, %l4
	.word	0xeace5000	! t0_kref+0x4200:   	ldsba	[%i1]0x80, %l5
	.word	0xaf22f884	! t0_kref+0x4204:   	mulscc	%o3, -0x77c, %l7
	.word	0x9de3bfa0	! t0_kref+0x4208:   	save	%sp, -0x60, %sp
	.word	0xabee801c	! t0_kref+0x420c:   	restore	%i2, %i4, %l5
	.word	0xa9a00033	! t0_kref+0x4210:   	fmovs	%f19, %f20
	.word	0x3c800007	! t0_kref+0x4214:   	bpos,a	_kref+0x4230
	.word	0x9022b1be	! t0_kref+0x4218:   	sub	%o2, -0xe42, %o0
	.word	0xe41f4019	! t0_kref+0x421c:   	ldd	[%i5 + %i1], %l2
	.word	0xde0e6003	! t0_kref+0x4220:   	ldub	[%i1 + 3], %o7
	.word	0x98f6c017	! t0_kref+0x4224:   	udivcc	%i3, %l7, %o4
	.word	0xee262004	! t0_kref+0x4228:   	st	%l7, [%i0 + 4]
	.word	0x99b28a56	! t0_kref+0x422c:   	fpadd32	%f10, %f22, %f12
	.word	0xaea00016	! t0_kref+0x4230:   	subcc	%g0, %l6, %l7
	.word	0x38800001	! t0_kref+0x4234:   	bgu,a	_kref+0x4238
	.word	0xa3a00132	! t0_kref+0x4238:   	fabss	%f18, %f17
	.word	0x96b3000c	! t0_kref+0x423c:   	orncc	%o4, %o4, %o3
	.word	0xe9e8a08e	! t0_kref+0x4240:   	prefetcha	%g2 + 0x8e, 20
	.word	0xe8066010	! t0_kref+0x4244:   	ld	[%i1 + 0x10], %l4
	.word	0x27352aa2	! t0_kref+0x4248:   	sethi	%hi(0xd4aa8800), %l3
	.word	0xe4500019	! t0_kref+0x424c:   	ldsh	[%g0 + %i1], %l2
	.word	0xd8480018	! t0_kref+0x4250:   	ldsb	[%g0 + %i0], %o4
	.word	0x91b007b0	! t0_kref+0x4254:   	fpackfix	%f16, %f8
	.word	0xa82b0008	! t0_kref+0x4258:   	andn	%o4, %o0, %l4
	.word	0xa1b00fc0	! t0_kref+0x425c:   	fone	%f16
	.word	0x81ad8aac	! t0_kref+0x4260:   	fcmpes	%fcc0, %f22, %f12
	.word	0xe11e2000	! t0_kref+0x4264:   	ldd	[%i0], %f16
	.word	0xa092800b	! t0_kref+0x4268:   	orcc	%o2, %o3, %l0
	.word	0xe7ee501b	! t0_kref+0x426c:   	prefetcha	%i1 + %i3, 19
	.word	0xe408a01b	! t0_kref+0x4270:   	ldub	[%g2 + 0x1b], %l2
	.word	0xe8162014	! t0_kref+0x4274:   	lduh	[%i0 + 0x14], %l4
	.word	0xd04e6001	! t0_kref+0x4278:   	ldsb	[%i1 + 1], %o0
	.word	0x923b000b	! t0_kref+0x427c:   	xnor	%o4, %o3, %o1
	.word	0xd5064000	! t0_kref+0x4280:   	ld	[%i1], %f10
	.word	0x22800001	! t0_kref+0x4284:   	be,a	_kref+0x4288
	.word	0xe0180019	! t0_kref+0x4288:   	ldd	[%g0 + %i1], %l0
	.word	0xa1a30950	! t0_kref+0x428c:   	fmuld	%f12, %f16, %f16
	.word	0x1b131b7a	! t0_kref+0x4290:   	sethi	%hi(0x4c6de800), %o5
	.word	0xafa0012c	! t0_kref+0x4294:   	fabss	%f12, %f23
	.word	0xd60e6014	! t0_kref+0x4298:   	ldub	[%i1 + 0x14], %o3
	.word	0xada00033	! t0_kref+0x429c:   	fmovs	%f19, %f22
	.word	0x962ac008	! t0_kref+0x42a0:   	andn	%o3, %o0, %o3
	.word	0xe84e401a	! t0_kref+0x42a4:   	ldsb	[%i1 + %i2], %l4
	.word	0xf831401b	! t0_kref+0x42a8:   	sth	%i4, [%g5 + %i3]
	.word	0x9da01a29	! t0_kref+0x42ac:   	fstoi	%f9, %f14
	.word	0xd808a023	! t0_kref+0x42b0:   	ldub	[%g2 + 0x23], %o4
	.word	0x99b34240	! t0_kref+0x42b4:   	array16	%o5, %g0, %o4
	.word	0x9da01928	! t0_kref+0x42b8:   	fstod	%f8, %f14
	.word	0xa2b5a19d	! t0_kref+0x42bc:   	orncc	%l6, 0x19d, %l1
	.word	0x2f800005	! t0_kref+0x42c0:   	fbu,a	_kref+0x42d4
	.word	0xb3b44d60	! t0_kref+0x42c4:   	fnot1s	%f17, %f25
	.word	0x9bb60498	! t0_kref+0x42c8:   	fcmple32	%f24, %f24, %o5
	.word	0x81ac0acc	! t0_kref+0x42cc:   	fcmped	%fcc0, %f16, %f12
	.word	0x99a3884a	! t0_kref+0x42d0:   	faddd	%f14, %f10, %f12
	.word	0xd856c018	! t0_kref+0x42d4:   	ldsh	[%i3 + %i0], %o4
	.word	0x91b406f4	! t0_kref+0x42d8:   	fmul8ulx16	%f16, %f20, %f8
	.word	0x98f0000d	! t0_kref+0x42dc:   	udivcc	%g0, %o5, %o4
	.word	0xd4567fe4	! t0_kref+0x42e0:   	ldsh	[%i1 - 0x1c], %o2
	.word	0xe8066014	! t0_kref+0x42e4:   	ld	[%i1 + 0x14], %l4
	.word	0xa1a01a50	! t0_kref+0x42e8:   	fdtoi	%f16, %f16
	.word	0x81ad0ad0	! t0_kref+0x42ec:   	fcmped	%fcc0, %f20, %f16
	.word	0x9da00039	! t0_kref+0x42f0:   	fmovs	%f25, %f14
	.word	0xd6264000	! t0_kref+0x42f4:   	st	%o3, [%i1]
	.word	0xe09e1000	! t0_kref+0x42f8:   	ldda	[%i0]0x80, %l0
	.word	0xd2470018	! t0_kref+0x42fc:   	ldsw	[%i4 + %i0], %o1
	.word	0xd0070019	! t0_kref+0x4300:   	ld	[%i4 + %i1], %o0
	.word	0xd2260000	! t0_kref+0x4304:   	st	%o1, [%i0]
	.word	0x81ae0a31	! t0_kref+0x4308:   	fcmps	%fcc0, %f24, %f17
	.word	0x28480005	! t0_kref+0x430c:   	bleu,a,pt	%icc, _kref+0x4320
	.word	0xf6267ff4	! t0_kref+0x4310:   	st	%i3, [%i1 - 0xc]
	.word	0xadb34329	! t0_kref+0x4314:   	bmask	%o5, %o1, %l6
	.word	0x91b64a77	! t0_kref+0x4318:   	fpadd32s	%f25, %f23, %f8
	.word	0x9da00031	! t0_kref+0x431c:   	fmovs	%f17, %f14
	.word	0x99b5c07b	! t0_kref+0x4320:   	edge8ln	%l7, %i3, %o4
	.word	0x900b0009	! t0_kref+0x4324:   	and	%o4, %o1, %o0
	.word	0x9db48c50	! t0_kref+0x4328:   	fnor	%f18, %f16, %f14
	.word	0xada208a9	! t0_kref+0x432c:   	fsubs	%f8, %f9, %f22
	.word	0x91a0054c	! t0_kref+0x4330:   	fsqrtd	%f12, %f8
	.word	0xb3a01888	! t0_kref+0x4334:   	fitos	%f8, %f25
	.word	0xafb5830c	! t0_kref+0x4338:   	alignaddr	%l6, %o4, %l7
	.word	0xa1b387ca	! t0_kref+0x433c:   	pdist	%f14, %f10, %f16
	.word	0x81ac8a52	! t0_kref+0x4340:   	fcmpd	%fcc0, %f18, %f18
	.word	0x3e800003	! t0_kref+0x4344:   	bvc,a	_kref+0x4350
	.word	0xa09b0017	! t0_kref+0x4348:   	xorcc	%o4, %l7, %l0
	.word	0xada00558	! t0_kref+0x434c:   	fsqrtd	%f24, %f22
	.word	0x3e480002	! t0_kref+0x4350:   	bvc,a,pt	%icc, _kref+0x4358
	.word	0x9da48d29	! t0_kref+0x4354:   	fsmuld	%f18, %f9, %f14
	.word	0x992d201e	! t0_kref+0x4358:   	sll	%l4, 0x1e, %o4
	.word	0x95a30d36	! t0_kref+0x435c:   	fsmuld	%f12, %f22, %f10
	.word	0x95a48834	! t0_kref+0x4360:   	fadds	%f18, %f20, %f10
	.word	0x8143e040	! t0_kref+0x4364:   	membar	0x40
	.word	0xa3400000	! t0_kref+0x4368:   	mov	%y, %l1
	.word	0xf1a0a024	! t0_kref+0x436c:   	sta	%f24, [%g2 + 0x24]%asi
	.word	0xada01896	! t0_kref+0x4370:   	fitos	%f22, %f22
	.word	0x36800003	! t0_kref+0x4374:   	bge,a	_kref+0x4380
	.word	0xada449af	! t0_kref+0x4378:   	fdivs	%f17, %f15, %f22
	.word	0xede8a084	! t0_kref+0x437c:   	prefetcha	%g2 + 0x84, 22
	.word	0x86102004	! t0_kref+0x4380:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x4384:   	bne,a	_kref+0x4384
	.word	0x86a0e001	! t0_kref+0x4388:   	subcc	%g3, 1, %g3
	.word	0xada0002a	! t0_kref+0x438c:   	fmovs	%f10, %f22
	.word	0x95b34668	! t0_kref+0x4390:   	fmul8x16au	%f13, %f8, %f10
	.word	0xde480019	! t0_kref+0x4394:   	ldsb	[%g0 + %i1], %o7
	.word	0xf1270018	! t0_kref+0x4398:   	st	%f24, [%i4 + %i0]
	.word	0xe290a016	! t0_kref+0x439c:   	lduha	[%g2 + 0x16]%asi, %l1
	.word	0xa6354008	! t0_kref+0x43a0:   	orn	%l5, %o0, %l3
	.word	0xa1a389d2	! t0_kref+0x43a4:   	fdivd	%f14, %f18, %f16
	.word	0xe4567ff6	! t0_kref+0x43a8:   	ldsh	[%i1 - 0xa], %l2
	.word	0xf6266000	! t0_kref+0x43ac:   	st	%i3, [%i1]
	.word	0x91a01891	! t0_kref+0x43b0:   	fitos	%f17, %f8
	.word	0x81ad8ac8	! t0_kref+0x43b4:   	fcmped	%fcc0, %f22, %f8
	.word	0xa615e259	! t0_kref+0x43b8:   	or	%l7, 0x259, %l3
	.word	0xe53e2000	! t0_kref+0x43bc:   	std	%f18, [%i0]
	.word	0x2120e85c	! t0_kref+0x43c0:   	sethi	%hi(0x83a17000), %l0
	.word	0x8143c000	! t0_kref+0x43c4:   	stbar
	.word	0x3a800002	! t0_kref+0x43c8:   	bcc,a	_kref+0x43d0
	.word	0xdd1fbcf8	! t0_kref+0x43cc:   	ldd	[%fp - 0x308], %f14
	.word	0x92db3b9a	! t0_kref+0x43d0:   	smulcc	%o4, -0x466, %o1
	.word	0x99b20f88	! t0_kref+0x43d4:   	for	%f8, %f8, %f12
	.word	0xa7b58c71	! t0_kref+0x43d8:   	fnors	%f22, %f17, %f19
	.word	0xa7a01888	! t0_kref+0x43dc:   	fitos	%f8, %f19
	.word	0x95a8404c	! t0_kref+0x43e0:   	fmovdne	%fcc0, %f12, %f10
	.word	0xf56e401c	! t0_kref+0x43e4:   	prefetch	%i1 + %i4, 26
	.word	0xa0830016	! t0_kref+0x43e8:   	addcc	%o4, %l6, %l0
	.word	0x30480003	! t0_kref+0x43ec:   	ba,a,pt	%icc, _kref+0x43f8
	.word	0xe488a000	! t0_kref+0x43f0:   	lduba	[%g2]%asi, %l2
	.word	0x9325400a	! t0_kref+0x43f4:   	mulscc	%l5, %o2, %o1
	.word	0xe3262008	! t0_kref+0x43f8:   	st	%f17, [%i0 + 8]
	.word	0x81aa0ab9	! t0_kref+0x43fc:   	fcmpes	%fcc0, %f8, %f25
	.word	0x8143e040	! t0_kref+0x4400:   	membar	0x40
	.word	0xe1266000	! t0_kref+0x4404:   	st	%f16, [%i1]
	.word	0x8143c000	! t0_kref+0x4408:   	stbar
	.word	0x2e480003	! t0_kref+0x440c:   	bvs,a,pt	%icc, _kref+0x4418
	.word	0xea200019	! t0_kref+0x4410:   	st	%l5, [%g0 + %i1]
	.word	0x91a40848	! t0_kref+0x4414:   	faddd	%f16, %f8, %f8
	.word	0xf42e001a	! t0_kref+0x4418:   	stb	%i2, [%i0 + %i2]
	.word	0x2a480002	! t0_kref+0x441c:   	bcs,a,pt	%icc, _kref+0x4424
	.word	0xc1086342	! t0_kref+0x4420:   	ld	[%g1 + 0x342], %fsr
	.word	0xef6e7fe0	! t0_kref+0x4424:   	prefetch	%i1 - 0x20, 23
	.word	0x99a000ac	! t0_kref+0x4428:   	fnegs	%f12, %f12
	.word	0x3c800003	! t0_kref+0x442c:   	bpos,a	_kref+0x4438
	.word	0xe8562002	! t0_kref+0x4430:   	ldsh	[%i0 + 2], %l4
	.word	0xa5b30ed2	! t0_kref+0x4434:   	fornot2	%f12, %f18, %f18
	.word	0xadb58d31	! t0_kref+0x4438:   	fandnot1s	%f22, %f17, %f22
	.word	0xe210a010	! t0_kref+0x443c:   	lduh	[%g2 + 0x10], %l1
	.word	0x28480006	! t0_kref+0x4440:   	bleu,a,pt	%icc, _kref+0x4458
	.word	0x99b00cce	! t0_kref+0x4444:   	fnot2	%f14, %f12
	.word	0x251d7391	! t0_kref+0x4448:   	sethi	%hi(0x75ce4400), %l2
	.word	0xa5a0054e	! t0_kref+0x444c:   	fsqrtd	%f14, %f18
	.word	0xa7a01893	! t0_kref+0x4450:   	fitos	%f19, %f19
	.word	0xf13e001d	! t0_kref+0x4454:   	std	%f24, [%i0 + %i5]
	.word	0xd0563fec	! t0_kref+0x4458:   	ldsh	[%i0 - 0x14], %o0
	.word	0xed6e3ff8	! t0_kref+0x445c:   	prefetch	%i0 - 8, 22
	.word	0xe1be1854	! t0_kref+0x4460:   	stda	%f16, [%i0 + %l4]0xc2
	.word	0xd1861000	! t0_kref+0x4464:   	lda	[%i0]0x80, %f8
	.word	0xa5b48ef9	! t0_kref+0x4468:   	fornot2s	%f18, %f25, %f18
	.word	0xa88a8008	! t0_kref+0x446c:   	andcc	%o2, %o0, %l4
	.word	0xad2de006	! t0_kref+0x4470:   	sll	%l7, 0x6, %l6
	.word	0xa43d400d	! t0_kref+0x4474:   	xnor	%l5, %o5, %l2
	.word	0xaa150016	! t0_kref+0x4478:   	or	%l4, %l6, %l5
	sethi	%hi(1f), %o7
	jmpl	%o7+%lo(1f), %g1
	.empty
	.word	0x9e9264a4	! t0_kref+0x4484:   	orcc	%o1, 0x4a4, %o7
1:	.word	0xa7a3c830	! t0_kref+0x4488:   	fadds	%f15, %f16, %f19
	.word	0xa7a38836	! t0_kref+0x448c:   	fadds	%f14, %f22, %f19
	.word	0x34800008	! t0_kref+0x4490:   	bg,a	_kref+0x44b0
	.word	0xa3a01a2e	! t0_kref+0x4494:   	fstoi	%f14, %f17
	.word	0x92f56246	! t0_kref+0x4498:   	udivcc	%l5, 0x246, %o1
	.word	0x8143c000	! t0_kref+0x449c:   	stbar
	.word	0xada018c8	! t0_kref+0x44a0:   	fdtos	%f8, %f22
	.word	0x9128000a	! t0_kref+0x44a4:   	sll	%g0, %o2, %o0
	.word	0xea8e6003	! t0_kref+0x44a8:   	lduba	[%i1 + 3]%asi, %l5
	.word	0xeb200018	! t0_kref+0x44ac:   	st	%f21, [%g0 + %i0]
	.word	0x96124009	! t0_kref+0x44b0:   	or	%o1, %o1, %o3
	.word	0xd380a03c	! t0_kref+0x44b4:   	lda	[%g2 + 0x3c]%asi, %f9
	.word	0x9db38c58	! t0_kref+0x44b8:   	fnor	%f14, %f24, %f14
	.word	0x9413247d	! t0_kref+0x44bc:   	or	%o4, 0x47d, %o2
	.word	0xef260000	! t0_kref+0x44c0:   	st	%f23, [%i0]
	.word	0xae3eb393	! t0_kref+0x44c4:   	xnor	%i2, -0xc6d, %l7
	.word	0xe13e6008	! t0_kref+0x44c8:   	std	%f16, [%i1 + 8]
	.word	0x94d6b684	! t0_kref+0x44cc:   	umulcc	%i2, -0x97c, %o2
	.word	0x91b44638	! t0_kref+0x44d0:   	fmul8x16	%f17, %f24, %f8
	.word	0xef00a004	! t0_kref+0x44d4:   	ld	[%g2 + 4], %f23
	.word	0xa5b3858a	! t0_kref+0x44d8:   	fcmpgt32	%f14, %f10, %l2
	.word	0xd51e001d	! t0_kref+0x44dc:   	ldd	[%i0 + %i5], %f10
	.word	0x81ab0ab5	! t0_kref+0x44e0:   	fcmpes	%fcc0, %f12, %f21
	.word	0x9de3bfa0	! t0_kref+0x44e4:   	save	%sp, -0x60, %sp
	.word	0xb016c01c	! t0_kref+0x44e8:   	or	%i3, %i4, %i0
	.word	0x9bef6647	! t0_kref+0x44ec:   	restore	%i5, 0x647, %o5
	.word	0xa5a01a2a	! t0_kref+0x44f0:   	fstoi	%f10, %f18
	.word	0x95b50db5	! t0_kref+0x44f4:   	fxors	%f20, %f21, %f10
	.word	0x95a01a38	! t0_kref+0x44f8:   	fstoi	%f24, %f10
	.word	0xf100a014	! t0_kref+0x44fc:   	ld	[%g2 + 0x14], %f24
	.word	0xb1b00cc8	! t0_kref+0x4500:   	fnot2	%f8, %f24
	.word	0x1317c8c8	! t0_kref+0x4504:   	sethi	%hi(0x5f232000), %o1
	.word	0x92f5c015	! t0_kref+0x4508:   	udivcc	%l7, %l5, %o1
	.word	0xe1264000	! t0_kref+0x450c:   	st	%f16, [%i1]
	.word	0xe608a021	! t0_kref+0x4510:   	ldub	[%g2 + 0x21], %l3
	.word	0xed063fe0	! t0_kref+0x4514:   	ld	[%i0 - 0x20], %f22
	.word	0xa52b001b	! t0_kref+0x4518:   	sll	%o4, %i3, %l2
	.word	0x94b5000b	! t0_kref+0x451c:   	orncc	%l4, %o3, %o2
	.word	0xe380a010	! t0_kref+0x4520:   	lda	[%g2 + 0x10]%asi, %f17
	.word	0xaeb2c016	! t0_kref+0x4524:   	orncc	%o3, %l6, %l7
	.word	0xa03d401a	! t0_kref+0x4528:   	xnor	%l5, %i2, %l0
	.word	0x96122970	! t0_kref+0x452c:   	or	%o0, 0x970, %o3
	.word	0x9aa6e024	! t0_kref+0x4530:   	subcc	%i3, 0x24, %o5
	.word	0xa9b0034a	! t0_kref+0x4534:   	alignaddrl	%g0, %o2, %l4
	.word	0xabb5032c	! t0_kref+0x4538:   	bmask	%l4, %o4, %l5
	.word	0xfd6e401c	! t0_kref+0x453c:   	prefetch	%i1 + %i4, 30
	.word	0x9425801b	! t0_kref+0x4540:   	sub	%l6, %i3, %o2
	.word	0x9ba64836	! t0_kref+0x4544:   	fadds	%f25, %f22, %f13
	.word	0xb1a9004e	! t0_kref+0x4548:   	fmovdl	%fcc0, %f14, %f24
	.word	0xe05e7ff0	! t0_kref+0x454c:   	ldx	[%i1 - 0x10], %l0
	.word	0xa1b48e37	! t0_kref+0x4550:   	fands	%f18, %f23, %f16
	.word	0xf436001b	! t0_kref+0x4554:   	sth	%i2, [%i0 + %i3]
	.word	0x99a389ce	! t0_kref+0x4558:   	fdivd	%f14, %f14, %f12
	.word	0x91400000	! t0_kref+0x455c:   	mov	%y, %o0
	.word	0x23480005	! t0_kref+0x4560:   	fbne,a,pt	%fcc0, _kref+0x4574
	.word	0xd87f0005	! t0_kref+0x4564:   	swap	[%i4 + %g5], %o4
	.word	0x36800003	! t0_kref+0x4568:   	bge,a	_kref+0x4574
	.word	0x81dc7cf8	! t0_kref+0x456c:   	flush	%l1 - 0x308
	.word	0x3e480005	! t0_kref+0x4570:   	bvc,a,pt	%icc, _kref+0x4584
	.word	0xe89e501d	! t0_kref+0x4574:   	ldda	[%i1 + %i5]0x80, %l4
	.word	0x81ac0aaa	! t0_kref+0x4578:   	fcmpes	%fcc0, %f16, %f10
	.word	0xe56e001a	! t0_kref+0x457c:   	prefetch	%i0 + %i2, 18
	.word	0x968d70a9	! t0_kref+0x4580:   	andcc	%l5, -0xf57, %o3
	.word	0xd3200018	! t0_kref+0x4584:   	st	%f9, [%g0 + %i0]
	.word	0x86102001	! t0_kref+0x4588:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x458c:   	bne,a	_kref+0x458c
	.word	0x86a0e001	! t0_kref+0x4590:   	subcc	%g3, 1, %g3
	.word	0x9aaec017	! t0_kref+0x4594:   	andncc	%i3, %l7, %o5
	.word	0x3b800008	! t0_kref+0x4598:   	fble,a	_kref+0x45b8
	.word	0xe8262004	! t0_kref+0x459c:   	st	%l4, [%i0 + 4]
	.word	0x233d61ec	! t0_kref+0x45a0:   	sethi	%hi(0xf587b000), %l1
	.word	0xdf00a03c	! t0_kref+0x45a4:   	ld	[%g2 + 0x3c], %f15
	.word	0x992d4015	! t0_kref+0x45a8:   	sll	%l5, %l5, %o4
	.word	0x8585e5d9	! t0_kref+0x45ac:   	wr	%l7, 0x5d9, %ccr
	.word	0x93120000	! t0_kref+0x45b0:   	taddcctv	%o0, %g0, %o1
	.word	0xeba0a02c	! t0_kref+0x45b4:   	sta	%f21, [%g2 + 0x2c]%asi
	.word	0xe81e401d	! t0_kref+0x45b8:   	ldd	[%i1 + %i5], %l4
	.word	0xec564000	! t0_kref+0x45bc:   	ldsh	[%i1], %l6
	.word	0xc368a00c	! t0_kref+0x45c0:   	prefetch	%g2 + 0xc, 1
	.word	0xad400000	! t0_kref+0x45c4:   	mov	%y, %l6
	.word	0xaeb2bb9e	! t0_kref+0x45c8:   	orncc	%o2, -0x462, %l7
	.word	0xd84e0000	! t0_kref+0x45cc:   	ldsb	[%i0], %o4
	.word	0xadb4044c	! t0_kref+0x45d0:   	fcmpne16	%f16, %f12, %l6
	.word	0x87802082	! t0_kref+0x45d4:   	mov	0x82, %asi
	.word	0x9a25ab7c	! t0_kref+0x45d8:   	sub	%l6, 0xb7c, %o5
	.word	0x9da38858	! t0_kref+0x45dc:   	faddd	%f14, %f24, %f14
	.word	0xd1070019	! t0_kref+0x45e0:   	ld	[%i4 + %i1], %f8
	.word	0xa12b200c	! t0_kref+0x45e4:   	sll	%o4, 0xc, %l0
	.word	0xeb070018	! t0_kref+0x45e8:   	ld	[%i4 + %i0], %f21
	.word	0xa5a28858	! t0_kref+0x45ec:   	faddd	%f10, %f24, %f18
	.word	0xa1a01033	! t0_kref+0x45f0:   	fstox	%f19, %f16
	.word	0x2a480003	! t0_kref+0x45f4:   	bcs,a,pt	%icc, _kref+0x4600
	.word	0xe11f4019	! t0_kref+0x45f8:   	ldd	[%i5 + %i1], %f16
	.word	0x95a5cd2e	! t0_kref+0x45fc:   	fsmuld	%f23, %f14, %f10
	.word	0xdd3e6010	! t0_kref+0x4600:   	std	%f14, [%i1 + 0x10]
	.word	0x17107869	! t0_kref+0x4604:   	sethi	%hi(0x41e1a400), %o3
	.word	0x81ac8ad6	! t0_kref+0x4608:   	fcmped	%fcc0, %f18, %f22
	.word	0xa1a6094c	! t0_kref+0x460c:   	fmuld	%f24, %f12, %f16
	.word	0xda062018	! t0_kref+0x4610:   	ld	[%i0 + 0x18], %o5
	.word	0x9a856c9b	! t0_kref+0x4614:   	addcc	%l5, 0xc9b, %o5
	.word	0x99b4098c	! t0_kref+0x4618:   	bshuffle	%f16, %f12, %f12
	.word	0x9ba01a54	! t0_kref+0x461c:   	fdtoi	%f20, %f13
	.word	0x9226e778	! t0_kref+0x4620:   	sub	%i3, 0x778, %o1
	.word	0xaa26801a	! t0_kref+0x4624:   	sub	%i2, %i2, %l5
	.word	0xa8558015	! t0_kref+0x4628:   	umul	%l6, %l5, %l4
	.word	0xe36e001a	! t0_kref+0x462c:   	prefetch	%i0 + %i2, 17
	.word	0xaafa801b	! t0_kref+0x4630:   	sdivcc	%o2, %i3, %l5
	.word	0x8143c000	! t0_kref+0x4634:   	stbar
	.word	0xecdf5018	! t0_kref+0x4638:   	ldxa	[%i5 + %i0]0x80, %l6
	.word	0xa5a01a35	! t0_kref+0x463c:   	fstoi	%f21, %f18
	.word	0xa20d800c	! t0_kref+0x4640:   	and	%l6, %o4, %l1
	.word	0xd8ee5000	! t0_kref+0x4644:   	ldstuba	[%i1]0x80, %o4
	.word	0x9da0192d	! t0_kref+0x4648:   	fstod	%f13, %f14
	.word	0x9a9b7bbe	! t0_kref+0x464c:   	xorcc	%o5, -0x442, %o5
	.word	0x9db4862c	! t0_kref+0x4650:   	fmul8x16	%f18, %f12, %f14
	.word	0x86102010	! t0_kref+0x4654:   	mov	0x10, %g3
	.word	0x86a0e001	! t0_kref+0x4658:   	subcc	%g3, 1, %g3
	.word	0x2280000c	! t0_kref+0x465c:   	be,a	_kref+0x468c
	.word	0xb3b38cab	! t0_kref+0x4660:   	fandnot2s	%f14, %f11, %f25
	.word	0xeb68a086	! t0_kref+0x4664:   	prefetch	%g2 + 0x86, 21
	.word	0x9203000b	! t0_kref+0x4668:   	add	%o4, %o3, %o1
	.word	0xa4bac000	! t0_kref+0x466c:   	xnorcc	%o3, %g0, %l2
	.word	0xef6e2010	! t0_kref+0x4670:   	prefetch	%i0 + 0x10, 23
	.word	0x294ffff9	! t0_kref+0x4674:   	fbl,a,pt	%fcc0, _kref+0x4658
	.word	0x9fa01a2f	! t0_kref+0x4678:   	fstoi	%f15, %f15
	.word	0xdb263ff8	! t0_kref+0x467c:   	st	%f13, [%i0 - 8]
	.word	0xa115800c	! t0_kref+0x4680:   	taddcctv	%l6, %o4, %l0
	.word	0x9af56737	! t0_kref+0x4684:   	udivcc	%l5, 0x737, %o5
	.word	0x2d08e6c4	! t0_kref+0x4688:   	sethi	%hi(0x239b1000), %l6
	.word	0x99a648b9	! t0_kref+0x468c:   	fsubs	%f25, %f25, %f12
	.word	0xecce9019	! t0_kref+0x4690:   	ldsba	[%i2 + %i1]0x80, %l6
	.word	0xe250a038	! t0_kref+0x4694:   	ldsh	[%g2 + 0x38], %l1
	.word	0x9fa01a54	! t0_kref+0x4698:   	fdtoi	%f20, %f15
	.word	0xaba3882a	! t0_kref+0x469c:   	fadds	%f14, %f10, %f21
	.word	0xdd3e4000	! t0_kref+0x46a0:   	std	%f14, [%i1]
	.word	0x9bb304ca	! t0_kref+0x46a4:   	fcmpne32	%f12, %f10, %o5
	.word	0xaf44c000	! t0_kref+0x46a8:   	mov	%gsr, %l7
	.word	0xa8a30008	! t0_kref+0x46ac:   	subcc	%o4, %o0, %l4
	.word	0xe826401c	! t0_kref+0x46b0:   	st	%l4, [%i1 + %i4]
	.word	0xd4363fe6	! t0_kref+0x46b4:   	sth	%o2, [%i0 - 0x1a]
	.word	0x28480005	! t0_kref+0x46b8:   	bleu,a,pt	%icc, _kref+0x46cc
	.word	0xd6066014	! t0_kref+0x46bc:   	ld	[%i1 + 0x14], %o3
	.word	0x95b20f69	! t0_kref+0x46c0:   	fornot1s	%f8, %f9, %f10
	.word	0x33800006	! t0_kref+0x46c4:   	fbe,a	_kref+0x46dc
	.word	0xa5a3082e	! t0_kref+0x46c8:   	fadds	%f12, %f14, %f18
	.word	0x9885400d	! t0_kref+0x46cc:   	addcc	%l5, %o5, %o4
	.word	0xa8f3000a	! t0_kref+0x46d0:   	udivcc	%o4, %o2, %l4
	.word	0x90100009	! t0_kref+0x46d4:   	mov	%o1, %o0
	.word	0xd1be5a5d	! t0_kref+0x46d8:   	stda	%f8, [%i1 + %i5]0xd2
	.word	0xa1b00ced	! t0_kref+0x46dc:   	fnot2s	%f13, %f16
	.word	0xe0180018	! t0_kref+0x46e0:   	ldd	[%g0 + %i0], %l0
	.word	0xda40a024	! t0_kref+0x46e4:   	ldsw	[%g2 + 0x24], %o5
	.word	0xa722b226	! t0_kref+0x46e8:   	mulscc	%o2, -0xdda, %l3
	.word	0x90b2ab0f	! t0_kref+0x46ec:   	orncc	%o2, 0xb0f, %o0
	.word	0x99a00035	! t0_kref+0x46f0:   	fmovs	%f21, %f12
	.word	0x992ac01b	! t0_kref+0x46f4:   	sll	%o3, %i3, %o4
	.word	0xe5be1000	! t0_kref+0x46f8:   	stda	%f18, [%i0]0x80
	.word	0xd4262004	! t0_kref+0x46fc:   	st	%o2, [%i0 + 4]
	.word	0x91a0108a	! t0_kref+0x4700:   	fxtos	%f10, %f8
	.word	0xd6270018	! t0_kref+0x4704:   	st	%o3, [%i4 + %i0]
	.word	0xed3e0000	! t0_kref+0x4708:   	std	%f22, [%i0]
	.word	0xc1086392	! t0_kref+0x470c:   	ld	[%g1 + 0x392], %fsr
	.word	0x92b6801b	! t0_kref+0x4710:   	orncc	%i2, %i3, %o1
	.word	0xd706200c	! t0_kref+0x4714:   	ld	[%i0 + 0xc], %f11
	.word	0x93a01a4c	! t0_kref+0x4718:   	fdtoi	%f12, %f9
	.word	0xa1b2ca69	! t0_kref+0x471c:   	fpadd32s	%f11, %f9, %f16
	.word	0x9da01928	! t0_kref+0x4720:   	fstod	%f8, %f14
	.word	0xa4fb7d45	! t0_kref+0x4724:   	sdivcc	%o5, -0x2bb, %l2
	.word	0xf6f01019	! t0_kref+0x4728:   	stxa	%i3, [%g0 + %i1]0x80
	.word	0xd2264000	! t0_kref+0x472c:   	st	%o1, [%i1]
	.word	0x9a458008	! t0_kref+0x4730:   	addc	%l6, %o0, %o5
	.word	0x94124014	! t0_kref+0x4734:   	or	%o1, %l4, %o2
	.word	0xaf2d6003	! t0_kref+0x4738:   	sll	%l5, 0x3, %l7
	.word	0x21800005	! t0_kref+0x473c:   	fbn,a	_kref+0x4750
	.word	0x99a018d0	! t0_kref+0x4740:   	fdtos	%f16, %f12
	.word	0x31800002	! t0_kref+0x4744:   	fba,a	_kref+0x474c
	.word	0xea366002	! t0_kref+0x4748:   	sth	%l5, [%i1 + 2]
	.word	0x31480003	! t0_kref+0x474c:   	fba,a,pt	%fcc0, _kref+0x4758
	.word	0xecee9019	! t0_kref+0x4750:   	ldstuba	[%i2 + %i1]0x80, %l6
	.word	0xa40d4008	! t0_kref+0x4754:   	and	%l5, %o0, %l2
	.word	0x9a8da3e4	! t0_kref+0x4758:   	andcc	%l6, 0x3e4, %o5
	.word	0x94152cb9	! t0_kref+0x475c:   	or	%l4, 0xcb9, %o2
	.word	0xec6e601b	! t0_kref+0x4760:   	ldstub	[%i1 + 0x1b], %l6
	.word	0x9aab0009	! t0_kref+0x4764:   	andncc	%o4, %o1, %o5
	.word	0xda4e001a	! t0_kref+0x4768:   	ldsb	[%i0 + %i2], %o5
	.word	0x86102003	! t0_kref+0x476c:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x4770:   	bne,a	_kref+0x4770
	.word	0x86a0e001	! t0_kref+0x4774:   	subcc	%g3, 1, %g3
	.word	0xb3a388b1	! t0_kref+0x4778:   	fsubs	%f14, %f17, %f25
	.word	0xf9ee501a	! t0_kref+0x477c:   	prefetcha	%i1 + %i2, 28
	.word	0x91227567	! t0_kref+0x4780:   	mulscc	%o1, -0xa99, %o0
	.word	0xa5a000d2	! t0_kref+0x4784:   	fnegd	%f18, %f18
	.word	0x9db48f96	! t0_kref+0x4788:   	for	%f18, %f22, %f14
	.word	0x81580000	! t0_kref+0x478c:   	flushw
	.word	0xec40a024	! t0_kref+0x4790:   	ldsw	[%g2 + 0x24], %l6
	.word	0x91a01a4c	! t0_kref+0x4794:   	fdtoi	%f12, %f8
	.word	0x92837820	! t0_kref+0x4798:   	addcc	%o5, -0x7e0, %o1
	.word	0x20480008	! t0_kref+0x479c:   	bn,a,pt	%icc, _kref+0x47bc
	.word	0xa5253470	! t0_kref+0x47a0:   	mulscc	%l4, -0xb90, %l2
	.word	0x913a6002	! t0_kref+0x47a4:   	sra	%o1, 0x2, %o0
	.word	0x3a480004	! t0_kref+0x47a8:   	bcc,a,pt	%icc, _kref+0x47b8
	.word	0xadb58c4c	! t0_kref+0x47ac:   	fnor	%f22, %f12, %f22
	.word	0x9da0054a	! t0_kref+0x47b0:   	fsqrtd	%f10, %f14
	.word	0x81ab8a32	! t0_kref+0x47b4:   	fcmps	%fcc0, %f14, %f18
	.word	0xa9a01938	! t0_kref+0x47b8:   	fstod	%f24, %f20
	.word	0xb1a2894c	! t0_kref+0x47bc:   	fmuld	%f10, %f12, %f24
	.word	0x99a0192c	! t0_kref+0x47c0:   	fstod	%f12, %f12
	.word	0xe3e65000	! t0_kref+0x47c4:   	casa	[%i1]0x80, %g0, %l1
	.word	0x9da389b4	! t0_kref+0x47c8:   	fdivs	%f14, %f20, %f14
	.word	0x8143c000	! t0_kref+0x47cc:   	stbar
	.word	0xada00535	! t0_kref+0x47d0:   	fsqrts	%f21, %f22
	.word	0xe44e8018	! t0_kref+0x47d4:   	ldsb	[%i2 + %i0], %l2
	.word	0x9db286f6	! t0_kref+0x47d8:   	fmul8ulx16	%f10, %f22, %f14
	.word	0xeff65015	! t0_kref+0x47dc:   	casxa	[%i1]0x80, %l5, %l7
	.word	0xe056201e	! t0_kref+0x47e0:   	ldsh	[%i0 + 0x1e], %l0
	.word	0x9e13400c	! t0_kref+0x47e4:   	or	%o5, %o4, %o7
	.word	0xf207bfe0	! t0_kref+0x47e8:   	ld	[%fp - 0x20], %i1
	.word	0xd1a6501c	! t0_kref+0x47ec:   	sta	%f8, [%i1 + %i4]0x80
	.word	0x15115858	! t0_kref+0x47f0:   	sethi	%hi(0x45616000), %o2
	.word	0x2a800003	! t0_kref+0x47f4:   	bcs,a	_kref+0x4800
	.word	0xada0192d	! t0_kref+0x47f8:   	fstod	%f13, %f22
	.word	0xe400a018	! t0_kref+0x47fc:   	ld	[%g2 + 0x18], %l2
	.word	0x9b660016	! t0_kref+0x4800:   	mova	%icc, %l6, %o5
	call	1f
	.empty
	.word	0xaedd3dbb	! t0_kref+0x4808:   	smulcc	%l4, -0x245, %l7
1:	.word	0x9db3cdb6	! t0_kref+0x480c:   	fxors	%f15, %f22, %f14
	.word	0xe410a008	! t0_kref+0x4810:   	lduh	[%g2 + 8], %l2
	.word	0x32480006	! t0_kref+0x4814:   	bne,a,pt	%icc, _kref+0x482c
	.word	0x95b40d0e	! t0_kref+0x4818:   	fandnot1	%f16, %f14, %f10
	.word	0xc36e001b	! t0_kref+0x481c:   	prefetch	%i0 + %i3, 1
	.word	0xee4e601b	! t0_kref+0x4820:   	ldsb	[%i1 + 0x1b], %l7
	.word	0xa9a58950	! t0_kref+0x4824:   	fmuld	%f22, %f16, %f20
	.word	0xd24e6012	! t0_kref+0x4828:   	ldsb	[%i1 + 0x12], %o1
	.word	0xd420a010	! t0_kref+0x482c:   	st	%o2, [%g2 + 0x10]
	.word	0xe53e6010	! t0_kref+0x4830:   	std	%f18, [%i1 + 0x10]
	.word	0xf456c005	! t0_kref+0x4834:   	ldsh	[%i3 + %g5], %i2
	.word	0x22800008	! t0_kref+0x4838:   	be,a	_kref+0x4858
	.word	0x942d000b	! t0_kref+0x483c:   	andn	%l4, %o3, %o2
	.word	0x3f800003	! t0_kref+0x4840:   	fbo,a	_kref+0x484c
	.word	0xe168a00c	! t0_kref+0x4844:   	prefetch	%g2 + 0xc, 16
	.word	0xa4202077	! t0_kref+0x4848:   	sub	%g0, 0x77, %l2
	.word	0xe0563fea	! t0_kref+0x484c:   	ldsh	[%i0 - 0x16], %l0
	.word	0xd650a000	! t0_kref+0x4850:   	ldsh	[%g2], %o3
	.word	0x9ab5001a	! t0_kref+0x4854:   	orncc	%l4, %i2, %o5
	.word	0x90134009	! t0_kref+0x4858:   	or	%o5, %o1, %o0
	.word	0x3c480006	! t0_kref+0x485c:   	bpos,a,pt	%icc, _kref+0x4874
	.word	0xeb00a004	! t0_kref+0x4860:   	ld	[%g2 + 4], %f21
	.word	0x962b401b	! t0_kref+0x4864:   	andn	%o5, %i3, %o3
	.word	0xe526200c	! t0_kref+0x4868:   	st	%f18, [%i0 + 0xc]
	.word	0x8143c000	! t0_kref+0x486c:   	stbar
	.word	0xf1262018	! t0_kref+0x4870:   	st	%f24, [%i0 + 0x18]
	.word	0xfbee501c	! t0_kref+0x4874:   	prefetcha	%i1 + %i4, 29
	.word	0xd19e1a1a	! t0_kref+0x4878:   	ldda	[%i0 + %i2]0xd0, %f8
	.word	0x86102002	! t0_kref+0x487c:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x4880:   	bne,a	_kref+0x4880
	.word	0x86a0e001	! t0_kref+0x4884:   	subcc	%g3, 1, %g3
	.word	0x81accab4	! t0_kref+0x4888:   	fcmpes	%fcc0, %f19, %f20
	.word	0xda280019	! t0_kref+0x488c:   	stb	%o5, [%g0 + %i1]
	.word	0x99a50833	! t0_kref+0x4890:   	fadds	%f20, %f19, %f12
	.word	0xe1bf5018	! t0_kref+0x4894:   	stda	%f16, [%i5 + %i0]0x80
	.word	0xa5b50e56	! t0_kref+0x4898:   	fxnor	%f20, %f22, %f18
	.word	0xa1a60d38	! t0_kref+0x489c:   	fsmuld	%f24, %f24, %f16
	.word	0x2c800008	! t0_kref+0x48a0:   	bneg,a	_kref+0x48c0
	.word	0xc0b6d019	! t0_kref+0x48a4:   	stha	%g0, [%i3 + %i1]0x80
	.word	0x3a800005	! t0_kref+0x48a8:   	bcc,a	_kref+0x48bc
	.word	0x99a609d2	! t0_kref+0x48ac:   	fdivd	%f24, %f18, %f12
	.word	0xde40a030	! t0_kref+0x48b0:   	ldsw	[%g2 + 0x30], %o7
	.word	0xa03b000b	! t0_kref+0x48b4:   	xnor	%o4, %o3, %l0
	.word	0x97a208b0	! t0_kref+0x48b8:   	fsubs	%f8, %f16, %f11
	.word	0xdf00a038	! t0_kref+0x48bc:   	ld	[%g2 + 0x38], %f15
	.word	0xa5a28848	! t0_kref+0x48c0:   	faddd	%f10, %f8, %f18
	.word	0xc06e401a	! t0_kref+0x48c4:   	ldstub	[%i1 + %i2], %g0
	.word	0xa9b300ca	! t0_kref+0x48c8:   	edge16l	%o4, %o2, %l4
	.word	0xc0260000	! t0_kref+0x48cc:   	clr	[%i0]
	.word	0xf9ee101b	! t0_kref+0x48d0:   	prefetcha	%i0 + %i3, 28
	.word	0x8143c000	! t0_kref+0x48d4:   	stbar
	.word	0xec2e8019	! t0_kref+0x48d8:   	stb	%l6, [%i2 + %i1]
	.word	0xc028a00b	! t0_kref+0x48dc:   	clrb	[%g2 + 0xb]
	.word	0x81ae0ad6	! t0_kref+0x48e0:   	fcmped	%fcc0, %f24, %f22
	.word	0xd456200e	! t0_kref+0x48e4:   	ldsh	[%i0 + 0xe], %o2
	.word	0x9f26ebb6	! t0_kref+0x48e8:   	mulscc	%i3, 0xbb6, %o7
	.word	0xb1a34d29	! t0_kref+0x48ec:   	fsmuld	%f13, %f9, %f24
	.word	0x91a28852	! t0_kref+0x48f0:   	faddd	%f10, %f18, %f8
	.word	0x91a01a4c	! t0_kref+0x48f4:   	fdtoi	%f12, %f8
	.word	0xf56e001a	! t0_kref+0x48f8:   	prefetch	%i0 + %i2, 26
	.word	0xd11f4019	! t0_kref+0x48fc:   	ldd	[%i5 + %i1], %f8
	.word	0xb1a589d8	! t0_kref+0x4900:   	fdivd	%f22, %f24, %f24
	.word	0x9ab27f23	! t0_kref+0x4904:   	orncc	%o1, -0xdd, %o5
	.word	0xe6901019	! t0_kref+0x4908:   	lduha	[%g0 + %i1]0x80, %l3
	.word	0x36800001	! t0_kref+0x490c:   	bge,a	_kref+0x4910
	.word	0xa786800c	! t0_kref+0x4910:   	wr	%i2, %o4, %gsr
	.word	0xd0270018	! t0_kref+0x4914:   	st	%o0, [%i4 + %i0]
	.word	0x99a01929	! t0_kref+0x4918:   	fstod	%f9, %f12
	.word	0xc168a08e	! t0_kref+0x491c:   	prefetch	%g2 + 0x8e, 0
	.word	0xd66e6009	! t0_kref+0x4920:   	ldstub	[%i1 + 9], %o3
	.word	0x99a01a56	! t0_kref+0x4924:   	fdtoi	%f22, %f12
	.word	0x97a00029	! t0_kref+0x4928:   	fmovs	%f9, %f11
	.word	0x9de3bfa0	! t0_kref+0x492c:   	save	%sp, -0x60, %sp
	.word	0xba664018	! t0_kref+0x4930:   	subc	%i1, %i0, %i5
	.word	0x91ee0000	! t0_kref+0x4934:   	restore	%i0, %g0, %o0
	.word	0xf6264000	! t0_kref+0x4938:   	st	%i3, [%i1]
	.word	0xe040a020	! t0_kref+0x493c:   	ldsw	[%g2 + 0x20], %l0
	.word	0x9da34d33	! t0_kref+0x4940:   	fsmuld	%f13, %f19, %f14
	.word	0xa62ab70c	! t0_kref+0x4944:   	andn	%o2, -0x8f4, %l3
	.word	0x9da00539	! t0_kref+0x4948:   	fsqrts	%f25, %f14
	.word	0x26480001	! t0_kref+0x494c:   	bl,a,pt	%icc, _kref+0x4950
	.word	0x91a0192f	! t0_kref+0x4950:   	fstod	%f15, %f8
	.word	0xa5b30990	! t0_kref+0x4954:   	bshuffle	%f12, %f16, %f18
	.word	0x9da01929	! t0_kref+0x4958:   	fstod	%f9, %f14
	.word	0xd008a02b	! t0_kref+0x495c:   	ldub	[%g2 + 0x2b], %o0
	.word	0xe2560000	! t0_kref+0x4960:   	ldsh	[%i0], %l1
	.word	0xa48ec00a	! t0_kref+0x4964:   	andcc	%i3, %o2, %l2
	.word	0xd93e401d	! t0_kref+0x4968:   	std	%f12, [%i1 + %i5]
	.word	0x95a00039	! t0_kref+0x496c:   	fmovs	%f25, %f10
	.word	0xa9b304d2	! t0_kref+0x4970:   	fcmpne32	%f12, %f18, %l4
	.word	0xd8be101d	! t0_kref+0x4974:   	stda	%o4, [%i0 + %i5]0x80
	.word	0x22480006	! t0_kref+0x4978:   	be,a,pt	%icc, _kref+0x4990
	.word	0xe16e001d	! t0_kref+0x497c:   	prefetch	%i0 + %i5, 16
	.word	0x95a01a2f	! t0_kref+0x4980:   	fstoi	%f15, %f10
	.word	0xa806b67c	! t0_kref+0x4984:   	add	%i2, -0x984, %l4
	.word	0xe250a02a	! t0_kref+0x4988:   	ldsh	[%g2 + 0x2a], %l1
	.word	0xa2330017	! t0_kref+0x498c:   	orn	%o4, %l7, %l1
	.word	0x93b20590	! t0_kref+0x4990:   	fcmpgt32	%f8, %f16, %o1
	.word	0xe056600e	! t0_kref+0x4994:   	ldsh	[%i1 + 0xe], %l0
	.word	0x91a01a50	! t0_kref+0x4998:   	fdtoi	%f16, %f8
	.word	0xe2562004	! t0_kref+0x499c:   	ldsh	[%i0 + 4], %l1
	.word	0x9e750014	! t0_kref+0x49a0:   	udiv	%l4, %l4, %o7
	.word	0x97a01892	! t0_kref+0x49a4:   	fitos	%f18, %f11
	.word	0xdd00a028	! t0_kref+0x49a8:   	ld	[%g2 + 0x28], %f14
	.word	0xec20a034	! t0_kref+0x49ac:   	st	%l6, [%g2 + 0x34]
	.word	0xaba01890	! t0_kref+0x49b0:   	fitos	%f16, %f21
	.word	0xea260000	! t0_kref+0x49b4:   	st	%l5, [%i0]
	.word	0xada2482c	! t0_kref+0x49b8:   	fadds	%f9, %f12, %f22
	.word	0xaa26801b	! t0_kref+0x49bc:   	sub	%i2, %i3, %l5
	.word	0xa5b00cd8	! t0_kref+0x49c0:   	fnot2	%f24, %f18
	.word	0xd5f65008	! t0_kref+0x49c4:   	casxa	[%i1]0x80, %o0, %o2
	.word	0xd5be5000	! t0_kref+0x49c8:   	stda	%f10, [%i1]0x80
	.word	0x9e006550	! t0_kref+0x49cc:   	add	%g1, 0x550, %o7
!	.word	0x3280558b	! t0_kref+0x49d0:   	bne,a	SYM(t0_subr2)
	   	bne,a	SYM(t0_subr2)
	.word	0xd820a018	! t0_kref+0x49d4:   	st	%o4, [%g2 + 0x18]
	.word	0x21800004	! t0_kref+0x49d8:   	fbn,a	_kref+0x49e8
	.word	0x95a01110	! t0_kref+0x49dc:   	fxtod	%f16, %f10
	.word	0xc06e7fef	! t0_kref+0x49e0:   	ldstub	[%i1 - 0x11], %g0
	.word	0xe5ee501a	! t0_kref+0x49e4:   	prefetcha	%i1 + %i2, 18
	.word	0x96556fd7	! t0_kref+0x49e8:   	umul	%l5, 0xfd7, %o3
	.word	0x9db44aeb	! t0_kref+0x49ec:   	fpsub32s	%f17, %f11, %f14
	.word	0x9a16801b	! t0_kref+0x49f0:   	or	%i2, %i3, %o5
	.word	0xe7f61017	! t0_kref+0x49f4:   	casxa	[%i0]0x80, %l7, %l3
	.word	0x95b48598	! t0_kref+0x49f8:   	fcmpgt32	%f18, %f24, %o2
	.word	0xa9b50c4e	! t0_kref+0x49fc:   	fnor	%f20, %f14, %f20
	.word	0xa1b30f96	! t0_kref+0x4a00:   	for	%f12, %f22, %f16
	.word	0xa5b00fe0	! t0_kref+0x4a04:   	fones	%f18
	.word	0xadb00c00	! t0_kref+0x4a08:   	fzero	%f22
	.word	0xd720a004	! t0_kref+0x4a0c:   	st	%f11, [%g2 + 4]
	.word	0xd6064000	! t0_kref+0x4a10:   	ld	[%i1], %o3
	.word	0xd6263ff4	! t0_kref+0x4a14:   	st	%o3, [%i0 - 0xc]
	.word	0xd9be1889	! t0_kref+0x4a18:   	stda	%f12, [%i0 + %o1]0xc4
	.word	0xf3063ff8	! t0_kref+0x4a1c:   	ld	[%i0 - 8], %f25
	.word	0xa63a630c	! t0_kref+0x4a20:   	xnor	%o1, 0x30c, %l3
	.word	0xabb54de8	! t0_kref+0x4a24:   	fnands	%f21, %f8, %f21
	.word	0x86102003	! t0_kref+0x4a28:   	mov	0x3, %g3
	.word	0x86a0e001	! t0_kref+0x4a2c:   	subcc	%g3, 1, %g3
	.word	0x22800017	! t0_kref+0x4a30:   	be,a	_kref+0x4a8c
	.word	0xdf264000	! t0_kref+0x4a34:   	st	%f15, [%i1]
	.word	0xd1be589b	! t0_kref+0x4a38:   	stda	%f8, [%i1 + %i3]0xc4
	.word	0xaf2577f9	! t0_kref+0x4a3c:   	mulscc	%l5, -0x807, %l7
	.word	0x9b408000	! t0_kref+0x4a40:   	mov	%ccr, %o5
	.word	0x253495dd	! t0_kref+0x4a44:   	sethi	%hi(0xd2577400), %l2
	.word	0xabb34280	! t0_kref+0x4a48:   	array32	%o5, %g0, %l5
	.word	0xa940c000	! t0_kref+0x4a4c:   	mov	%asi, %l4
	.word	0xec500019	! t0_kref+0x4a50:   	ldsh	[%g0 + %i1], %l6
	.word	0xa9a20d39	! t0_kref+0x4a54:   	fsmuld	%f8, %f25, %f20
	.word	0x99a00533	! t0_kref+0x4a58:   	fsqrts	%f19, %f12
	.word	0xada00548	! t0_kref+0x4a5c:   	fsqrtd	%f8, %f22
	.word	0xe16e6018	! t0_kref+0x4a60:   	prefetch	%i1 + 0x18, 16
	.word	0xb3a01a4a	! t0_kref+0x4a64:   	fdtoi	%f10, %f25
	.word	0xd0567ffc	! t0_kref+0x4a68:   	ldsh	[%i1 - 4], %o0
	.word	0xa8582614	! t0_kref+0x4a6c:   	smul	%g0, 0x614, %l4
	.word	0x9695f4f4	! t0_kref+0x4a70:   	orcc	%l7, -0xb0c, %o3
	.word	0x244fffee	! t0_kref+0x4a74:   	ble,a,pt	%icc, _kref+0x4a2c
	.word	0xa2320009	! t0_kref+0x4a78:   	orn	%o0, %o1, %l1
	.word	0x20480004	! t0_kref+0x4a7c:   	bn,a,pt	%icc, _kref+0x4a8c
	.word	0x9da3cd2f	! t0_kref+0x4a80:   	fsmuld	%f15, %f15, %f14
	.word	0x9db407ca	! t0_kref+0x4a84:   	pdist	%f16, %f10, %f14
	.word	0x99b20ef2	! t0_kref+0x4a88:   	fornot2s	%f8, %f18, %f12
	.word	0xd11f4018	! t0_kref+0x4a8c:   	ldd	[%i5 + %i0], %f8
	.word	0x972a801b	! t0_kref+0x4a90:   	sll	%o2, %i3, %o3
	.word	0x99a000d6	! t0_kref+0x4a94:   	fnegd	%f22, %f12
	.word	0x9ab2000c	! t0_kref+0x4a98:   	orncc	%o0, %o4, %o5
	.word	0xaf12a9d8	! t0_kref+0x4a9c:   	taddcctv	%o2, 0x9d8, %l7
	.word	0xe5060000	! t0_kref+0x4aa0:   	ld	[%i0], %f18
	.word	0xf13e2018	! t0_kref+0x4aa4:   	std	%f24, [%i0 + 0x18]
	.word	0xee266018	! t0_kref+0x4aa8:   	st	%l7, [%i1 + 0x18]
	.word	0x2f800006	! t0_kref+0x4aac:   	fbu,a	_kref+0x4ac4
	.word	0x9a13400c	! t0_kref+0x4ab0:   	or	%o5, %o4, %o5
	.word	0xe019401d	! t0_kref+0x4ab4:   	ldd	[%g5 + %i5], %l0
	.word	0xa9a00131	! t0_kref+0x4ab8:   	fabss	%f17, %f20
	.word	0xf83e001d	! t0_kref+0x4abc:   	std	%i4, [%i0 + %i5]
	.word	0xd44e0000	! t0_kref+0x4ac0:   	ldsb	[%i0], %o2
	.word	0x95b286f6	! t0_kref+0x4ac4:   	fmul8ulx16	%f10, %f22, %f10
	.word	0x81ad0ac8	! t0_kref+0x4ac8:   	fcmped	%fcc0, %f20, %f8
	.word	0xc16e400d	! t0_kref+0x4acc:   	prefetch	%i1 + %o5, 0
	.word	0xed070018	! t0_kref+0x4ad0:   	ld	[%i4 + %i0], %f22
	.word	0xd636001b	! t0_kref+0x4ad4:   	sth	%o3, [%i0 + %i3]
	.word	0x91a00037	! t0_kref+0x4ad8:   	fmovs	%f23, %f8
	.word	0x8610200e	! t0_kref+0x4adc:   	mov	0xe, %g3
	.word	0x86a0e001	! t0_kref+0x4ae0:   	subcc	%g3, 1, %g3
	.word	0x22800005	! t0_kref+0x4ae4:   	be,a	_kref+0x4af8
	.word	0x9072641c	! t0_kref+0x4ae8:   	udiv	%o1, 0x41c, %o0
	.word	0xa013001b	! t0_kref+0x4aec:   	or	%o4, %i3, %l0
	.word	0x91a0188c	! t0_kref+0x4af0:   	fitos	%f12, %f8
	.word	0x81ae0a34	! t0_kref+0x4af4:   	fcmps	%fcc0, %f24, %f20
	.word	0xf11e3fe0	! t0_kref+0x4af8:   	ldd	[%i0 - 0x20], %f24
	.word	0x95b50e2f	! t0_kref+0x4afc:   	fands	%f20, %f15, %f10
	.word	0xd51e4000	! t0_kref+0x4b00:   	ldd	[%i1], %f10
	.word	0xa765a459	! t0_kref+0x4b04:   	movneg	%icc, -0x3a7, %l3
	.word	0x24480003	! t0_kref+0x4b08:   	ble,a,pt	%icc, _kref+0x4b14
	.word	0xa1b30c4e	! t0_kref+0x4b0c:   	fnor	%f12, %f14, %f16
	.word	0x99a01a33	! t0_kref+0x4b10:   	fstoi	%f19, %f12
	.word	0x81820000	! t0_kref+0x4b14:   	wr	%o0, %g0, %y
	.word	0x9bb38490	! t0_kref+0x4b18:   	fcmple32	%f14, %f16, %o5
	.word	0x81aa8ad8	! t0_kref+0x4b1c:   	fcmped	%fcc0, %f10, %f24
	.word	0xc1082f48	! t0_kref+0x4b20:   	ld	[%g0 + 0xf48], %fsr
	.word	0xa3a01a54	! t0_kref+0x4b24:   	fdtoi	%f20, %f17
	.word	0xa233211d	! t0_kref+0x4b28:   	orn	%o4, 0x11d, %l1
	.word	0x95a0004e	! t0_kref+0x4b2c:   	fmovd	%f14, %f10
	.word	0xb1b2096f	! t0_kref+0x4b30:   	fpmerge	%f8, %f15, %f24
	.word	0x9eb336a2	! t0_kref+0x4b34:   	orncc	%o4, -0x95e, %o7
	.word	0x37800004	! t0_kref+0x4b38:   	fbge,a	_kref+0x4b48
	.word	0xa32a8015	! t0_kref+0x4b3c:   	sll	%o2, %l5, %l1
	.word	0xc0363ff4	! t0_kref+0x4b40:   	clrh	[%i0 - 0xc]
	.word	0x26800001	! t0_kref+0x4b44:   	bl,a	_kref+0x4b48
	.word	0x9da40839	! t0_kref+0x4b48:   	fadds	%f16, %f25, %f14
	.word	0xeb20a008	! t0_kref+0x4b4c:   	st	%f21, [%g2 + 8]
	.word	0x9203400c	! t0_kref+0x4b50:   	add	%o5, %o4, %o1
	.word	0xa5b60a8c	! t0_kref+0x4b54:   	fpsub16	%f24, %f12, %f18
	.word	0x3a480002	! t0_kref+0x4b58:   	bcc,a,pt	%icc, _kref+0x4b60
	.word	0xf4f75018	! t0_kref+0x4b5c:   	stxa	%i2, [%i5 + %i0]0x80
	.word	0x9ba01a30	! t0_kref+0x4b60:   	fstoi	%f16, %f13
	.word	0x9ba589aa	! t0_kref+0x4b64:   	fdivs	%f22, %f10, %f13
	.word	0xe400a000	! t0_kref+0x4b68:   	ld	[%g2], %l2
	.word	0x9fb38414	! t0_kref+0x4b6c:   	fcmple16	%f14, %f20, %o7
	.word	0xec4e8019	! t0_kref+0x4b70:   	ldsb	[%i2 + %i1], %l6
	.word	0x903ec016	! t0_kref+0x4b74:   	xnor	%i3, %l6, %o0
	.word	0x94950008	! t0_kref+0x4b78:   	orcc	%l4, %o0, %o2
	.word	0xa1a01a29	! t0_kref+0x4b7c:   	fstoi	%f9, %f16
	.word	0x9f0b7c78	! t0_kref+0x4b80:   	tsubcc	%o5, -0x388, %o7
	.word	0xd4270019	! t0_kref+0x4b84:   	st	%o2, [%i4 + %i1]
	.word	0x9db407d8	! t0_kref+0x4b88:   	pdist	%f16, %f24, %f14
	.word	0x9676ec08	! t0_kref+0x4b8c:   	udiv	%i3, 0xc08, %o3
	.word	0x81ae0ad2	! t0_kref+0x4b90:   	fcmped	%fcc0, %f24, %f18
	.word	0xa52d601c	! t0_kref+0x4b94:   	sll	%l5, 0x1c, %l2
	.word	0x963a4000	! t0_kref+0x4b98:   	not	%o1, %o3
	.word	0xec00a02c	! t0_kref+0x4b9c:   	ld	[%g2 + 0x2c], %l6
	.word	0xe91e001d	! t0_kref+0x4ba0:   	ldd	[%i0 + %i5], %f20
	.word	0xe66e7ff5	! t0_kref+0x4ba4:   	ldstub	[%i1 - 0xb], %l3
	.word	0x95a01a30	! t0_kref+0x4ba8:   	fstoi	%f16, %f10
	.word	0xaba0012d	! t0_kref+0x4bac:   	fabss	%f13, %f21
	.word	0x913ec014	! t0_kref+0x4bb0:   	sra	%i3, %l4, %o0
	.word	0x25800002	! t0_kref+0x4bb4:   	fblg,a	_kref+0x4bbc
	.word	0xadb4cc68	! t0_kref+0x4bb8:   	fnors	%f19, %f8, %f22
	.word	0x9825c00b	! t0_kref+0x4bbc:   	sub	%l7, %o3, %o4
	.word	0x95b58240	! t0_kref+0x4bc0:   	array16	%l6, %g0, %o2
	.word	0xa9a0052d	! t0_kref+0x4bc4:   	fsqrts	%f13, %f20
	.word	0xe64e7fe6	! t0_kref+0x4bc8:   	ldsb	[%i1 - 0x1a], %l3
	.word	0xd830001b	! t0_kref+0x4bcc:   	sth	%o4, [%g0 + %i3]
	.word	0xa5a28834	! t0_kref+0x4bd0:   	fadds	%f10, %f20, %f18
	.word	0x8d86ea37	! t0_kref+0x4bd4:   	wr	%i3, 0xa37, %fprs
	.word	0x9de3bfa0	! t0_kref+0x4bd8:   	save	%sp, -0x60, %sp
	.word	0xa1ee001d	! t0_kref+0x4bdc:   	restore	%i0, %i5, %l0
	.word	0x9db00cca	! t0_kref+0x4be0:   	fnot2	%f10, %f14
	.word	0x95a249b1	! t0_kref+0x4be4:   	fdivs	%f9, %f17, %f10
	.word	0xa1a409d0	! t0_kref+0x4be8:   	fdivd	%f16, %f16, %f16
	.word	0x81ac0ad6	! t0_kref+0x4bec:   	fcmped	%fcc0, %f16, %f22
	.word	0xa1a0102d	! t0_kref+0x4bf0:   	fstox	%f13, %f16
	.word	0x272bf135	! t0_kref+0x4bf4:   	sethi	%hi(0xafc4d400), %l3
	.word	0x91a01a52	! t0_kref+0x4bf8:   	fdtoi	%f18, %f8
	.word	0x9da01110	! t0_kref+0x4bfc:   	fxtod	%f16, %f14
	.word	0xc868311e	! t0_kref+0x4c00:   	ldstub	[%g0 - 0xee2], %g4
	.word	0x9adead29	! t0_kref+0x4c04:   	smulcc	%i2, 0xd29, %o5
	.word	0x97b6c0d6	! t0_kref+0x4c08:   	edge16l	%i3, %l6, %o3
	.word	0xe64e4000	! t0_kref+0x4c0c:   	ldsb	[%i1], %l3
	.word	0x9856800d	! t0_kref+0x4c10:   	umul	%i2, %o5, %o4
	.word	0xc1ee1009	! t0_kref+0x4c14:   	prefetcha	%i0 + %o1, 0
	.word	0x95a58829	! t0_kref+0x4c18:   	fadds	%f22, %f9, %f10
	.word	0xaaf53e9e	! t0_kref+0x4c1c:   	udivcc	%l4, -0x162, %l5
	.word	0x9db2cab4	! t0_kref+0x4c20:   	fpsub16s	%f11, %f20, %f14
	.word	0x9db2896c	! t0_kref+0x4c24:   	fpmerge	%f10, %f12, %f14
	.word	0x91b28e2c	! t0_kref+0x4c28:   	fands	%f10, %f12, %f8
	.word	0x2e480008	! t0_kref+0x4c2c:   	bvs,a,pt	%icc, _kref+0x4c4c
	.word	0x933b4009	! t0_kref+0x4c30:   	sra	%o5, %o1, %o1
	.word	0x94b6b0ab	! t0_kref+0x4c34:   	orncc	%i2, -0xf55, %o2
	.word	0x2c480003	! t0_kref+0x4c38:   	bneg,a,pt	%icc, _kref+0x4c44
	.word	0x8143c000	! t0_kref+0x4c3c:   	stbar
	.word	0x81abca32	! t0_kref+0x4c40:   	fcmps	%fcc0, %f15, %f18
	.word	0x92383c2e	! t0_kref+0x4c44:   	xnor	%g0, -0x3d2, %o1
	.word	0xb1b00cd8	! t0_kref+0x4c48:   	fnot2	%f24, %f24
	.word	0x9a622f05	! t0_kref+0x4c4c:   	subc	%o0, 0xf05, %o5
	.word	0xe81e6000	! t0_kref+0x4c50:   	ldd	[%i1], %l4
	.word	0xed00a004	! t0_kref+0x4c54:   	ld	[%g2 + 4], %f22
	.word	0x9406800a	! t0_kref+0x4c58:   	add	%i2, %o2, %o2
	.word	0x81ab8a52	! t0_kref+0x4c5c:   	fcmpd	%fcc0, %f14, %f18
	.word	0xacd5658b	! t0_kref+0x4c60:   	umulcc	%l5, 0x58b, %l6
	.word	0xadb50992	! t0_kref+0x4c64:   	bshuffle	%f20, %f18, %f22
	.word	0xda40a010	! t0_kref+0x4c68:   	ldsw	[%g2 + 0x10], %o5
	.word	0x9fc00004	! t0_kref+0x4c6c:   	call	%g0 + %g4
	.word	0xf6b65000	! t0_kref+0x4c70:   	stha	%i3, [%i1]0x80
	.word	0xa9b28176	! t0_kref+0x4c74:   	edge32ln	%o2, %l6, %l4
	.word	0x39800008	! t0_kref+0x4c78:   	fbuge,a	_kref+0x4c98
	.word	0xa9a01919	! t0_kref+0x4c7c:   	fitod	%f25, %f20
	.word	0xec280019	! t0_kref+0x4c80:   	stb	%l6, [%g0 + %i1]
	.word	0x81ae4ab9	! t0_kref+0x4c84:   	fcmpes	%fcc0, %f25, %f25
	.word	0xe5ee501c	! t0_kref+0x4c88:   	prefetcha	%i1 + %i4, 18
	.word	0x2f800005	! t0_kref+0x4c8c:   	fbu,a	_kref+0x4ca0
	.word	0xe500a014	! t0_kref+0x4c90:   	ld	[%g2 + 0x14], %f18
	.word	0x9da488b3	! t0_kref+0x4c94:   	fsubs	%f18, %f19, %f14
	.word	0xec066018	! t0_kref+0x4c98:   	ld	[%i1 + 0x18], %l6
	.word	0xac26800c	! t0_kref+0x4c9c:   	sub	%i2, %o4, %l6
	.word	0xd126001c	! t0_kref+0x4ca0:   	st	%f8, [%i0 + %i4]
	.word	0xd9beda58	! t0_kref+0x4ca4:   	stda	%f12, [%i3 + %i0]0xd2
	.word	0x81aa0a31	! t0_kref+0x4ca8:   	fcmps	%fcc0, %f8, %f17
	.word	0xa9b387d6	! t0_kref+0x4cac:   	pdist	%f14, %f22, %f20
	.word	0xc12e3ff8	! t0_kref+0x4cb0:   	st	%fsr, [%i0 - 8]
	.word	0x9f2ac015	! t0_kref+0x4cb4:   	sll	%o3, %l5, %o7
	.word	0xb1a0012a	! t0_kref+0x4cb8:   	fabss	%f10, %f24
	.word	0xedee101c	! t0_kref+0x4cbc:   	prefetcha	%i0 + %i4, 22
	.word	0xea267ff0	! t0_kref+0x4cc0:   	st	%l5, [%i1 - 0x10]
	.word	0xdd3e0000	! t0_kref+0x4cc4:   	std	%f14, [%i0]
	.word	0x9fc00004	! t0_kref+0x4cc8:   	call	%g0 + %g4
	.word	0xb1b30a52	! t0_kref+0x4ccc:   	fpadd32	%f12, %f18, %f24
	.word	0x22800007	! t0_kref+0x4cd0:   	be,a	_kref+0x4cec
	.word	0x92b52f03	! t0_kref+0x4cd4:   	orncc	%l4, 0xf03, %o1
	.word	0xd11fbd20	! t0_kref+0x4cd8:   	ldd	[%fp - 0x2e0], %f8
	.word	0x20480002	! t0_kref+0x4cdc:   	bn,a,pt	%icc, _kref+0x4ce4
	.word	0xf11f4019	! t0_kref+0x4ce0:   	ldd	[%i5 + %i1], %f24
	.word	0xe300a020	! t0_kref+0x4ce4:   	ld	[%g2 + 0x20], %f17
	.word	0x9a3a800c	! t0_kref+0x4ce8:   	xnor	%o2, %o4, %o5
	.word	0xd11e2018	! t0_kref+0x4cec:   	ldd	[%i0 + 0x18], %f8
	.word	0xacf5708a	! t0_kref+0x4cf0:   	udivcc	%l5, -0xf76, %l6
	.word	0xa875f4da	! t0_kref+0x4cf4:   	udiv	%l7, -0xb26, %l4
	.word	0xae95af8d	! t0_kref+0x4cf8:   	orcc	%l6, 0xf8d, %l7
	.word	0xd0264000	! t0_kref+0x4cfc:   	st	%o0, [%i1]
	.word	0xc768a048	! t0_kref+0x4d00:   	prefetch	%g2 + 0x48, 3
	.word	0xa5a0188c	! t0_kref+0x4d04:   	fitos	%f12, %f18
	.word	0xa5b00f2d	! t0_kref+0x4d08:   	fsrc2s	%f13, %f18
	call	SYM(t0_subr0)
	.word	0xb3a00533	! t0_kref+0x4d10:   	fsqrts	%f19, %f25
	.word	0xb1a01a56	! t0_kref+0x4d14:   	fdtoi	%f22, %f24
	.word	0xaf2d8008	! t0_kref+0x4d18:   	sll	%l6, %o0, %l7
	.word	0xada209cc	! t0_kref+0x4d1c:   	fdivd	%f8, %f12, %f22
	.word	0x81ab0ac8	! t0_kref+0x4d20:   	fcmped	%fcc0, %f12, %f8
	.word	0x33480001	! t0_kref+0x4d24:   	fbe,a,pt	%fcc0, _kref+0x4d28
	.word	0xa216c00a	! t0_kref+0x4d28:   	or	%i3, %o2, %l1
	.word	0x8143e03f	! t0_kref+0x4d2c:   	membar	0x3f
	.word	0xa5b507d0	! t0_kref+0x4d30:   	pdist	%f20, %f16, %f18
	.word	0xd9983fe0	! t0_kref+0x4d34:   	ldda	[%g0 - 0x20]%asi, %f12
	.word	0xac15f8e9	! t0_kref+0x4d38:   	or	%l7, -0x717, %l6
	.word	0xadb20c90	! t0_kref+0x4d3c:   	fandnot2	%f8, %f16, %f22
	.word	0x93a488b5	! t0_kref+0x4d40:   	fsubs	%f18, %f21, %f9
	.word	0xac8ec00d	! t0_kref+0x4d44:   	andcc	%i3, %o5, %l6
	.word	0x86102002	! t0_kref+0x4d48:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x4d4c:   	bne,a	_kref+0x4d4c
	.word	0x86a0e001	! t0_kref+0x4d50:   	subcc	%g3, 1, %g3
	.word	0x28480003	! t0_kref+0x4d54:   	bleu,a,pt	%icc, _kref+0x4d60
	.word	0xef260000	! t0_kref+0x4d58:   	st	%f23, [%i0]
	.word	0xaedaeb17	! t0_kref+0x4d5c:   	smulcc	%o3, 0xb17, %l7
	.word	0xe04e001a	! t0_kref+0x4d60:   	ldsb	[%i0 + %i2], %l0
	.word	0x91a00550	! t0_kref+0x4d64:   	fsqrtd	%f16, %f8
	.word	0xe36e3fe0	! t0_kref+0x4d68:   	prefetch	%i0 - 0x20, 17
	.word	0x9fc00004	! t0_kref+0x4d6c:   	call	%g0 + %g4
	.word	0xc568a003	! t0_kref+0x4d70:   	prefetch	%g2 + 3, 2
	.word	0xecd81018	! t0_kref+0x4d74:   	ldxa	[%g0 + %i0]0x80, %l6
	.word	0xb1b40de9	! t0_kref+0x4d78:   	fnands	%f16, %f9, %f24
	.word	0xe93e001d	! t0_kref+0x4d7c:   	std	%f20, [%i0 + %i5]
	.word	0x93a00133	! t0_kref+0x4d80:   	fabss	%f19, %f9
	.word	0x95a01933	! t0_kref+0x4d84:   	fstod	%f19, %f10
	.word	0x97b58240	! t0_kref+0x4d88:   	array16	%l6, %g0, %o3
	.word	0xb3a0002d	! t0_kref+0x4d8c:   	fmovs	%f13, %f25
	.word	0x24480004	! t0_kref+0x4d90:   	ble,a,pt	%icc, _kref+0x4da0
	.word	0xe51e2010	! t0_kref+0x4d94:   	ldd	[%i0 + 0x10], %f18
	.word	0x8143c000	! t0_kref+0x4d98:   	stbar
	.word	0x30480001	! t0_kref+0x4d9c:   	ba,a,pt	%icc, _kref+0x4da0
	.word	0x233d6297	! t0_kref+0x4da0:   	sethi	%hi(0xf58a5c00), %l1
	.word	0xa9b38a58	! t0_kref+0x4da4:   	fpadd32	%f14, %f24, %f20
	.word	0xea263fec	! t0_kref+0x4da8:   	st	%l5, [%i0 - 0x14]
	.word	0xee0e0000	! t0_kref+0x4dac:   	ldub	[%i0], %l7
	.word	0xa80b3f5d	! t0_kref+0x4db0:   	and	%o4, -0xa3, %l4
	.word	0xaaf26ce4	! t0_kref+0x4db4:   	udivcc	%o1, 0xce4, %l5
	.word	0xd4266018	! t0_kref+0x4db8:   	st	%o2, [%i1 + 0x18]
	.word	0x90900017	! t0_kref+0x4dbc:   	orcc	%g0, %l7, %o0
	.word	0xe500a038	! t0_kref+0x4dc0:   	ld	[%g2 + 0x38], %f18
	.word	0x91b300cc	! t0_kref+0x4dc4:   	edge16l	%o4, %o4, %o0
	.word	0x99a00554	! t0_kref+0x4dc8:   	fsqrtd	%f20, %f12
	.word	0xada648ab	! t0_kref+0x4dcc:   	fsubs	%f25, %f11, %f22
	.word	0xa02ae50d	! t0_kref+0x4dd0:   	andn	%o3, 0x50d, %l0
	.word	0x9e006958	! t0_kref+0x4dd4:   	add	%g1, 0x958, %o7
!	.word	0x31805489	! t0_kref+0x4dd8:   	fba,a	SYM(t0_subr2)
	   	fba,a	SYM(t0_subr2)
	.word	0xa7b50ab8	! t0_kref+0x4ddc:   	fpsub16s	%f20, %f24, %f19
	.word	0xecde5000	! t0_kref+0x4de0:   	ldxa	[%i1]0x80, %l6
	.word	0x9aaef085	! t0_kref+0x4de4:   	andncc	%i3, -0xf7b, %o5
	.word	0xd0062018	! t0_kref+0x4de8:   	ld	[%i0 + 0x18], %o0
	.word	0x9fa01891	! t0_kref+0x4dec:   	fitos	%f17, %f15
	.word	0xd6267ffc	! t0_kref+0x4df0:   	st	%o3, [%i1 - 4]
	.word	0x9b2a8016	! t0_kref+0x4df4:   	sll	%o2, %l6, %o5
	.word	0x9625001a	! t0_kref+0x4df8:   	sub	%l4, %i2, %o3
	.word	0xd24e7fe3	! t0_kref+0x4dfc:   	ldsb	[%i1 - 0x1d], %o1
	.word	0x9fc00004	! t0_kref+0x4e00:   	call	%g0 + %g4
	.word	0x9476f762	! t0_kref+0x4e04:   	udiv	%i3, -0x89e, %o2
	.word	0xa60d001a	! t0_kref+0x4e08:   	and	%l4, %i2, %l3
	.word	0x81ac0ad2	! t0_kref+0x4e0c:   	fcmped	%fcc0, %f16, %f18
	.word	0xee56c019	! t0_kref+0x4e10:   	ldsh	[%i3 + %i1], %l7
	.word	0xa5a50858	! t0_kref+0x4e14:   	faddd	%f20, %f24, %f18
	.word	0xdd1e2010	! t0_kref+0x4e18:   	ldd	[%i0 + 0x10], %f14
	.word	0x81ab8ab2	! t0_kref+0x4e1c:   	fcmpes	%fcc0, %f14, %f18
	call	SYM(_kaos_done)
	.word	0x01000000	! t0_kref+0x4e24:   	nop
	KGLOBAL(t0_ktbl_end)
t0_ktbl_end:
t0_ktbl_page_end:

KTEXT_MODULE(t0_module_subr0, 0x20d30000)
.seg "text"
t0_subr0_page_begin:
	.skip 8188
.global _t0_subr0; ENTRY(t0_subr0)
	.word	0xa6844012	! t0_subr0+0x0:   	addcc	%l1, %l2, %l3
	.word	0x81c3e008	! t0_subr0+0x4:   	retl
	.word	0xaa64c014	! t0_subr0+0x8:   	subc	%l3, %l4, %l5
t0_subr0_page_end:

KTEXT_MODULE(t0_module_subr1, 0x52260000)
.seg "text"
t0_subr1_page_begin:
	.skip 8188
.global _t0_subr1; ENTRY(t0_subr1)
	.word	0x9de3bfa0	! t0_subr1+0x0:   	save	%sp, -0x60, %sp
	.word	0xb29eaa5a	! t0_subr1+0x4:   	xorcc	%i2, 0xa5a, %i1
	.word	0x81c7e008	! t0_subr1+0x8:   	ret
	.word	0xa7ee6001	! t0_subr1+0xc:   	restore	%i1, 1, %l3
t0_subr1_page_end:

KTEXT_MODULE(t0_module_subr2, 0x0e65e000)
.seg "text"
t0_subr2_page_begin:
	.skip 8188
.global _t0_subr2; ENTRY(t0_subr2)
	.word	0x9de3bfa0	! t0_subr2+0x0:   	save	%sp, -0x60, %sp
	.word	0xb2066001	! t0_subr2+0x4:   	add	%i1, 1, %i1
	.word	0x81c7e008	! t0_subr2+0x8:   	ret
	.word	0xa3ee6001	! t0_subr2+0xc:   	restore	%i1, 1, %l1
t0_subr2_page_end:

KTEXT_MODULE(t0_module_subr3, 0x6ff00000)
.seg "text"
t0_subr3_page_begin:
	.skip 8108
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
!  Total operations: 4882  
!
!  Operation frequencies
!
!  name               exp    obs
!  ldsb              1.39   1.62
!  ldub              0.57   0.47
!  ldsh              1.36   1.56
!  lduh              0.42   0.43
!  ld                0.67   0.96
!  ldd               0.52   0.68
!  swap              0.21   0.20
!  ldstub            0.98   0.86
!  stb               0.56   0.51
!  sth               1.02   1.21
!  st                1.39   1.86
!  std               0.22   0.23
!  add               0.24   0.33
!  addcc             0.59   0.70
!  addx              0.46   0.37
!  addxcc            0.40   0.43
!  taddcc            0.03   0.00
!  taddcctv          0.28   0.45
!  sub               0.92   1.15
!  subcc             0.22   0.27
!  subx              0.12   0.12
!  subxcc            0.10   0.12
!  tsubcc            0.07   0.04
!  tsubcctv          0.02   0.02
!  mulscc            0.82   0.72
!  and               1.18   1.15
!  andcc             0.59   0.72
!  andn              0.92   1.04
!  andncc            0.70   0.74
!  or                1.47   1.29
!  orcc              0.67   0.74
!  orn               0.71   0.57
!  orncc             1.38   1.54
!  xor               0.04   0.06
!  xorcc             0.72   0.84
!  xnor              1.04   1.21
!  xnorcc            0.43   0.33
!  sll               0.95   1.25
!  srl               0.11   0.04
!  sra               0.23   0.23
!  unimp             0.16   0.10
!  umul              0.14   0.18
!  smul              0.03   0.04
!  udiv              0.51   0.43
!  sdiv              0.01   0.00
!  umulcc            0.52   0.49
!  smulcc            0.44   0.39
!  udivcc            1.31   1.47
!  sdivcc            0.56   0.45
!  rdy               0.10   0.12
!  wry               0.69   0.84
!  bicc              2.11   2.17
!  sethi             1.26   1.72
!  jmpl              0.39   0.47
!  call              0.19   0.23
!  ticc              0.00   0.00
!  flush             0.12   0.12
!  save              0.36   0.33
!  restore           0.35   0.00
!  stbar             0.92   0.86
!  ldf               0.88   0.90
!  lddf              1.02   1.15
!  stf               1.36   1.62
!  stdf              1.08   1.15
!  fadds             1.53   1.66
!  fsubs             1.41   1.41
!  fmuls             0.07   0.06
!  fdivs             0.98   1.00
!  faddd             0.65   0.66
!  fsubd             0.11   0.08
!  fmuld             0.55   0.68
!  fdivd             0.44   0.47
!  faddq             0.00   0.00
!  fsubq             0.00   0.00
!  fmulq             0.00   0.00
!  fdivq             0.00   0.00
!  fsmuld            0.72   0.74
!  fdmulq            0.00   0.00
!  fitos             0.89   0.88
!  fitod             0.33   0.27
!  fitoq             0.00   0.00
!  fstoi             1.43   1.21
!  fstod             1.51   1.39
!  fstoq             0.00   0.00
!  fdtoi             1.37   1.95
!  fdtos             0.54   0.47
!  fdtoq             0.00   0.00
!  fqtoi             0.00   0.00
!  fqtos             0.00   0.00
!  fqtod             0.00   0.00
!  fmovs             1.51   1.52
!  fnegs             0.10   0.12
!  fabss             0.97   0.90
!  fsqrts            0.65   0.59
!  fsqrtd            1.66   1.39
!  fsqrtq            0.00   0.00
!  fcmps             0.97   0.80
!  fcmpd             0.48   0.23
!  fcmpq             0.00   0.00
!  fcmpes            0.81   0.86
!  fcmped            1.49   1.11
!  fcmpeq            0.00   0.00
!  fbfcc             2.08   1.68
!  ldfsr             0.11   0.00
!  stfsr             0.12   0.16
!  loop              1.02   0.84
!  offset            0.04   0.00
!  area              0.05   0.02
!  target            0.04   0.10
!  goto              0.20   0.12
!  sigsegv           0.23   0.25
!  sigbus            0.27   0.49
!  imodify           0.00   0.00
!  ldfsr_offset      0.22   0.00
!  fpattern          0.11   0.10
!  lbranch           0.15   0.18
!  shmld             4.01   4.30
!  shmst             1.18   1.21
!  shmpf             0.90   1.13
!  shmswap           0.12   0.04
!  shmblkld          0.29   0.02
!  shmblkst          1.28   0.35
!  shmblkchk         0.40   0.33
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
!  casa              0.19   0.20
!  rdasi             0.09   0.10
!  wrasi             0.23   0.18
!  bpcc              3.40   3.09
!  fbpfcc            0.12   0.23
!  fmovscc           0.01   0.00
!  fmovdcc           0.26   0.20
!  fmovqcc           0.00   0.00
!  movcc             0.30   0.27
!  flushw            0.27   0.16
!  membar            0.27   0.16
!  prefetch          1.47   1.54
!  rdpc              0.02   0.00
!  ldqf              0.00   0.00
!  stqf              0.00   0.00
!  ldfa              0.16   0.18
!  lddfa             0.21   0.18
!  ldqfa             0.00   0.00
!  ldsba             0.21   0.20
!  ldsha             0.10   0.08
!  lduba             0.28   0.33
!  lduha             0.16   0.10
!  lda               0.24   0.10
!  ldda              0.20   0.20
!  ldstuba           0.09   0.14
!  prefetcha         0.92   0.86
!  stfa              0.16   0.18
!  stdfa             0.28   0.35
!  stqfa             0.00   0.00
!  stba              0.08   0.14
!  stha              0.19   0.18
!  sta               0.02   0.04
!  stda              0.11   0.08
!  swapa             0.05   0.10
!  fmovd             0.28   0.29
!  fnegd             0.26   0.25
!  fabsd             0.02   0.00
!  fstox             0.17   0.16
!  fdtox             0.04   0.06
!  fxtos             0.10   0.04
!  fxtod             0.29   0.18
!  lds               0.20   0.16
!  ldsa              0.21   0.18
!  ldx               0.23   0.14
!  ldxa              0.27   0.35
!  nofault           0.03   0.06
!  rdgsr             0.07   0.06
!  wrgsr             0.11   0.14
!  fpadd16           0.20   0.20
!  fpadd16s          0.02   0.06
!  fpadd32           0.25   0.27
!  fpadd32s          0.20   0.29
!  fpsub16           0.24   0.20
!  fpsub16s          0.15   0.18
!  fpsub32           0.13   0.18
!  fpsub32s          0.13   0.16
!  fpack16           0.07   0.10
!  fpack32           0.21   0.14
!  fpackfix          0.12   0.08
!  fexpand           0.01   0.02
!  fpmerge           0.13   0.10
!  fmul8x16          0.16   0.16
!  fmul8x16au        0.11   0.12
!  fmul8x16al        0.02   0.00
!  fmul8sux16        0.04   0.00
!  fmul8ulx16        0.07   0.12
!  fmuld8sux16       0.07   0.14
!  fmuld8ulx16       0.14   0.10
!  alignaddr         0.23   0.16
!  alignaddrl        0.24   0.18
!  faligndata        0.04   0.06
!  fzero             0.16   0.06
!  fzeros            0.02   0.06
!  fone              0.23   0.12
!  fones             0.08   0.06
!  fsrc1             0.03   0.02
!  fsrc1s            0.14   0.08
!  fsrc2             0.08   0.06
!  fsrc2s            0.10   0.08
!  fnot1             0.08   0.02
!  fnot1s            0.08   0.04
!  fnot2             0.29   0.23
!  fnot2s            0.19   0.25
!  for               0.17   0.18
!  fors              0.14   0.12
!  fnor              0.29   0.41
!  fnors             0.23   0.31
!  fand              0.26   0.08
!  fands             0.26   0.18
!  fnand             0.09   0.08
!  fnands            0.21   0.31
!  fxor              0.01   0.02
!  fxors             0.09   0.23
!  fxnor             0.10   0.14
!  fxnors            0.16   0.18
!  fornot1           0.10   0.10
!  fornot1s          0.17   0.23
!  fornot2           0.01   0.02
!  fornot2s          0.29   0.31
!  fandnot1          0.29   0.29
!  fandnot1s         0.20   0.18
!  fandnot2          0.07   0.08
!  fandnot2s         0.16   0.14
!  fcmpgt16          0.01   0.00
!  fcmpgt32          0.24   0.27
!  fcmple16          0.23   0.18
!  fcmple32          0.29   0.45
!  fcmpne16          0.08   0.06
!  fcmpne32          0.10   0.18
!  fcmpeq16          0.15   0.18
!  fcmpeq32          0.07   0.02
!  edge8             0.17   0.20
!  edge8l            0.09   0.10
!  edge16            0.08   0.04
!  edge16l           0.24   0.20
!  edge32            0.10   0.06
!  edge32l           0.20   0.14
!  pdist             0.29   0.27
!  partial_st8       0.00   0.00
!  partial_st16      0.28   0.14
!  partial_st32      0.26   0.33
!  short_st8         0.29   0.10
!  short_st16        0.18   0.27
!  short_ld8         0.29   0.20
!  short_ld16        0.01   0.00
!  blkld             0.24   0.00
!  blkst             0.05   0.00
!  blkld_offset      0.10   0.00
!  blkst_offset      0.00   0.00
!  blk_check         0.00   0.00
!  casxa             0.22   0.29
!  rdccr             0.17   0.12
!  rdfprs            0.10   0.06
!  wrccr             0.18   0.18
!  popc              0.17   0.10
!  wrfprs            0.07   0.12
!  stx               0.03   0.02
!  stxa              0.11   0.20
!  cflush            0.00   0.00
!  array8            0.01   0.00
!  array16           0.23   0.23
!  array32           0.14   0.29
!  edge8n            0.01   0.00
!  edge8ln           0.25   0.31
!  edge16n           0.02   0.02
!  edge16ln          0.02   0.02
!  edge32n           0.20   0.10
!  edge32ln          0.20   0.33
!  bmask             0.11   0.14
!  bshuffle          0.27   0.41
!  siam              0.10   0.10
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
KDATA_MODULE(t0_module_offset_table, 0x4245e000)
.seg "data"
t0_offset_table_start:
t0_offset_table_size:	.word	0x00000008
t0_offset_table:
	.word	0xfffffff0
	.word	0x00000010
	.word	0x00000018
	.word	0x00000008
	.word	0xffffffe8
	.word	0x00000000
	.word	0xffffffe0
	.word	0xfffffff8
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

KDATA_MODULE(t0_module_data_in_regs, 0x60e82000)
.seg "data"
KGLOBAL(t0_data_in_regs)
t0_data_in_regs_start:
t0_data_in_regs:
	.word	0xb159e9cc          ! %f0
	.word	0x3e33b6fd          ! %f1
	.word	0xc5f5243f          ! %f2
	.word	0xd08f4046          ! %f3
	.word	0xcb670e22          ! %f4
	.word	0x26007d94          ! %f5
	.word	0x0fc50a08          ! %f6
	.word	0x62aca0c3          ! %f7
	.word	0xf69f7db1          ! %f8
	.word	0x33992f68          ! %f9
	.word	0xbef64e38          ! %f10
	.word	0xb888b9a3          ! %f11
	.word	0xf585a6a4          ! %f12
	.word	0x4d61fbeb          ! %f13
	.word	0xf41133ef          ! %f14
	.word	0x3feaee50          ! %f15
	.word	0x5283ccb6          ! %f16
	.word	0x96964dc0          ! %f17
	.word	0x7c445832          ! %f18
	.word	0x4b09e051          ! %f19
	.word	0xceba072a          ! %f20
	.word	0x641723a2          ! %f21
	.word	0x1b4d62fe          ! %f22
	.word	0x2e26cccc          ! %f23
	.word	0x40d9a9fe          ! %f24
	.word	0x544b9383          ! %f25
	.word	0x891335a0          ! %f26
	.word	0x4d42be4c          ! %f27
	.word	0x0eb18e5f          ! %f28
	.word	0x7be3dbf8          ! %f29
	.word	0x82842a43          ! %f30
	.word	0xec4e96c4          ! %f31
	.word	0xae51ee5f          ! %f32
	.word	0x3b71a7d3          ! %f33
	.word	0x1b6038ca          ! %f34
	.word	0x6ac335d4          ! %f35
	.word	0xf6e5c7e5          ! %f36
	.word	0xcbce6811          ! %f37
	.word	0x10c014e0          ! %f38
	.word	0xde9f3f4a          ! %f39
	.word	0x98cafae4          ! %f40
	.word	0xfb72e7f6          ! %f41
	.word	0xdfa7994c          ! %f42
	.word	0x069c45ea          ! %f43
	.word	0x675196ce          ! %f44
	.word	0x73717f76          ! %f45
	.word	0x19031489          ! %f46
	.word	0x90455e72          ! %f47
	.word	0x781e0b4b          ! %f48
	.word	0x49f687d7          ! %f49
	.word	0xea544a95          ! %f50
	.word	0x40b55ed8          ! %f51
	.word	0xb3b13026          ! %f52
	.word	0xb048f693          ! %f53
	.word	0x414d4009          ! %f54
	.word	0xbe634dd5          ! %f55
	.word	0xb3545887          ! %f56
	.word	0x557f4282          ! %f57
	.word	0xcde42269          ! %f58
	.word	0x5bc7c6a6          ! %f59
	.word	0x91d6e567          ! %f60
	.word	0x33baf738          ! %f61
	.word	0x834ce1bd          ! %f62
	.word	0x2e0e5511          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0xadc       ! %g1 (code pointer)
	.word	t0_data_in_shm_area ! %g2 (shared area pointer)
	.word	0x42f5cadc          ! %g3 (loop index)
	.word	SYM(t0_subr1)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0x5024fe4e          ! %o0
	.word	0xc685ab28          ! %o1
	.word	0x14da1f65          ! %o2
	.word	0xe01592e8          ! %o3
	.word	0x784ae6dd          ! %o4
	.word	0x074a2a4e          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0x396e0b3f          ! %l0
	.word	0x1dff9aab          ! %l1
	.word	0xf9fa4f60          ! %l2
	.word	0x0cb20da5          ! %l3
	.word	0x40debf02          ! %l4
	.word	0x9edfc919          ! %l5
	.word	0x3491d617          ! %l6
	.word	0x6f14e646          ! %l7
	.word	t0_data_in_area0    ! %i0 (area pointer)
	.word	t0_data_in_area0    ! %i1 (area pointer)
	.word	0x00000013          ! %i2 (byte offset)
	.word	0xfffffffc          ! %i3 (halfword offset)
	.word	0xfffffff4          ! %i4 (word offset)
	.word	0xfffffff8          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0x255e3a1c          ! %y
	.word	0x0000000a          ! %icc (nzvc)
	.word	0x400003eb          ! %fsr
	.word	0x00000000          ! %gsr.mask
	.word	0x00000000          ! %gsr
	.word	0x000000d2          ! %asi
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

KDATA_MODULE(t0_module_data_in_stack, 0x73a1e000)
.seg "data"
KGLOBAL(t0_data_in_mtbl_size)
KGLOBAL(t0_data_in_mtbl)
KGLOBAL(t0_data_in_stack)
t0_data_in_stack_start:
	.word	0x77524f24
	.word	0x9e407f48
	.word	0xfcca0b95
	.word	0x4518ff8d
	.word	0x8c194b68
	.word	0xbb1d0b03
	.word	0xc86e4923
	.word	0xfa1a0934
	.word	0x9831ff95
	.word	0x253ac57f
	.word	0x82389017
	.word	0xef37e206
	.word	0xa1e5c8e9
	.word	0x5c1004e4
	.word	0x7d93f979
	.word	0xd012edfa
	.word	0x7b17ab91
	.word	0xf762f392
	.word	0xcbee83c1
	.word	0x816bce9c
	.word	0x1609487f
	.word	0x2b72b365
	.word	0xf29c2ed1
	.word	0xfae381ea
	.word	0x0a18dc80
	.word	0x7f78f139
	.word	0x803b6325
	.word	0x53640b7f
	.word	0x09779c8d
	.word	0xb8b2acb0
	.word	0x239c1848
	.word	0x39080bf3
	.word	0x48f90360
	.word	0x29c73832
	.word	0x804e6e89
	.word	0x59d9ea80
	.word	0x7410e44a
	.word	0x0e50b535
	.word	0x4e14afee
	.word	0xad2974e9
	.word	0xf21f5743
	.word	0x3cb990be
	.word	0x53bfec69
	.word	0x8fc11996
	.word	0x8c86d242
	.word	0xe9d6c426
	.word	0xf2bda549
	.word	0x1e322003
	.word	0x0ffa03cf
	.word	0x21dede21
	.word	0x62103bf3
	.word	0xaa01835b
	.word	0x443442d5
	.word	0xe5da17fc
	.word	0x7cd317d1
	.word	0xf6f5535f
	.word	0x9528a7bc
	.word	0xfba7fb25
	.word	0x7506b789
	.word	0xa75cbf8d
	.word	0x64e122b7
	.word	0xa57b5af0
	.word	0x8e702172
	.word	0xcf2b307d
	.word	0x2708235a
	.word	0xdc75a697
	.word	0xb21a6743
	.word	0xa061138d
	.word	0xe3aca56e
	.word	0xcd16d783
	.word	0x98c0310d
	.word	0xfdc33cc0
	.word	0x6779b708
	.word	0x33c77fc9
	.word	0x144e836a
	.word	0x158c02e3
	.word	0x6997cbd8
	.word	0x9816bcf6
	.word	0xb61134f6
	.word	0xf2cf79f1
	.word	0x0bff71be
	.word	0x0e9e130f
	.word	0x732cc6fe
	.word	0xdbfe6fb8
	.word	0xe76a3aa2
	.word	0x281973d3
	.word	0xb3109577
	.word	0xdd8a0ebb
	.word	0xf987ef84
	.word	0x9861f642
	.word	0x4ec79231
	.word	0xb3644b5a
	.word	0x47eb60d1
	.word	0x3dde0262
	.word	0xd3bcff4c
	.word	0x71377f30
	.word	0x6d8367f9
	.word	0xe1e1f540
	.word	0xebeddcea
	.word	0x81f1d6bc
	.word	0xf8a9ee3d
	.word	0xe8a88134
	.word	0x27d6fe26
	.word	0x71e77542
	.word	0xf61c0ccd
	.word	0x543a4e69
	.word	0xc6faf944
	.word	0x2d9872f3
	.word	0x0ecb9a11
	.word	0xdd109f9c
	.word	0x31da6728
	.word	0x1056194b
	.word	0x9cabb846
	.word	0x5db6ff24
	.word	0x06ec260c
	.word	0x0bd501ba
	.word	0x429f394d
	.word	0x906c3831
	.word	0x3aca936d
	.word	0x026ffa86
	.word	0x2ec8ebbf
	.word	0xd7032058
	.word	0x65a5f146
	.word	0xebb9d5ef
	.word	0xd9eb2544
	.word	0xea47f54e
	.word	0xec5b6a80
	.word	0xb43a8793
	.word	0x03851e25
	.word	0x573752f3
	.word	0xf5936aa8
	.word	0xd0163413
	.word	0xde31f21e
	.word	0x59a00592
	.word	0xb2413ce2
	.word	0xe32316f7
	.word	0xf3b65a79
	.word	0x2d993c67
	.word	0x4809261d
	.word	0x89dd62ce
	.word	0xa9677557
	.word	0x5fcae061
	.word	0xf2b16e87
	.word	0x73f67f99
	.word	0x7d662e50
	.word	0x001e1328
	.word	0xbb160e43
	.word	0x852f4b6a
	.word	0xe8d01c3e
	.word	0x2f481a60
	.word	0x655df159
	.word	0x5a034147
	.word	0x33bfe856
	.word	0x1e023b2f
	.word	0x20ac06ee
	.word	0x45a4aa53
	.word	0xb3049277
	.word	0xd0e549fd
	.word	0xaf758fb4
	.word	0xf4283d2f
	.word	0xae1826c6
	.word	0x6e07f27a
	.word	0x844a5fa3
	.word	0x40c0cf9d
	.word	0x3353b87a
	.word	0x5deafbe4
	.word	0xf27306e8
	.word	0x5ad1fe66
t0_data_in_sp:
	.word	0x21e7b5f4
	.word	0x802f0d89
	.word	0x8f94161d
	.word	0xffaaef7e
	.word	0xb9fcea12
	.word	0x4243b78b
	.word	0x2ac4f1bb
	.word	0xb8289265
	.word	t0_data_in_area0
	.word	t0_data_in_area0
	.word	0x0000000f
	.word	0x0000000c
	.word	0xffffffec
	.word	0xfffffff8
	.word	t0_data_in_fp
	.word	0x25cf13a7
	.word	0x129882e4
	.word	0xe9eff186
	.word	0x5d1d452f
	.word	0x8c828c8f
	.word	0x36f03951
	.word	0xb256378f
	.word	0x3a651ed3
	.word	0x1052dab5
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
	.word   	0xbc510f91	! [%fp - 0xc]
	.word   	0x5adcf78b	! [%fp - 0x8]
	.word   	0xd811f6c5	! [%fp - 0x4]
.global t0_data_in_fp; t0_data_in_fp:
	.word	0x601f0a9b
	.word	0xb730bf04
	.word	0xa36ef160
	.word	0x367e1cb8
	.word	0x97bc3f72
	.word	0x3f7669e2
	.word	0x3760ec18
	.word	0xd7584926
	.word	0x191c0999
	.word	0x9138096e
	.word	0x7f0c5a08
	.word	0x7523d8a8
	.word	0x6ca32163
	.word	0xa2240b6b
	.word	0xe02d9b34
	.word	0x0730e888
	.word	0x8bea8a1d
	.word	0x3ae2d2cf
	.word	0xe3f981f2
	.word	0xcd212894
	.word	0x6541614e
	.word	0xa0430fb6
	.word	0xc2f3fdcc
	.word	0xf9077634
t0_data_in_stacktop:
	.word	0
t0_data_in_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_in_area0, 0x0f4a6000)
.seg "data"
t0_data_in_area0_start:
.skip 6016
t0_data_in_area0_begin:
	.word	0xfee5de40	! t0_data_in_area0-0x20
	.word	0xcdbf2299	! t0_data_in_area0-0x1c
	.word	0xb2cc10aa	! t0_data_in_area0-0x18
	.word	0xa97d94bf	! t0_data_in_area0-0x14
	.word	0x3b5045bf	! t0_data_in_area0-0x10
	.word	0x1118febf	! t0_data_in_area0-0xc
	.word	0x901f7230	! t0_data_in_area0-0x8
	.word	0x4eec9709	! t0_data_in_area0-0x4
.global t0_data_in_area0; t0_data_in_area0:
	.word	0xb452d620	! t0_data_in_area0+0x0
	.word	0x10ad3ff2	! t0_data_in_area0+0x4
	.word	0x4f4a8565	! t0_data_in_area0+0x8
	.word	0x35f9ce40	! t0_data_in_area0+0xc
	.word	0x8d7def84	! t0_data_in_area0+0x10
	.word	0x72f56776	! t0_data_in_area0+0x14
	.word	0x1a8f8494	! t0_data_in_area0+0x18
	.word	0xbdd351f8	! t0_data_in_area0+0x1c
t0_data_in_area0_end:
.skip 2112
t0_data_in_area0_stop:

KDATA_MODULE(t0_module_data_in_shm_area, 0x36ed2000)
.seg "data"
t0_data_in_shm_area_start:
t0_data_in_shm_area_begin:
.global t0_data_in_shm_area; t0_data_in_shm_area:
	.word	0x1f67fc5e	! t0_data_in_shm_area+0x0 (t0)
	.word	0x38bc7437	! t0_data_in_shm_area+0x4 (t0)
	.word	0x632a0776	! t0_data_in_shm_area+0x8 (t0)
	.word	0x09347583	! t0_data_in_shm_area+0xc (t0)
	.word	0x596cde32	! t0_data_in_shm_area+0x10 (t0)
	.word	0x94084a40	! t0_data_in_shm_area+0x14 (t0)
	.word	0x0c924791	! t0_data_in_shm_area+0x18 (t0)
	.word	0x9dabbe86	! t0_data_in_shm_area+0x1c (t0)
	.word	0x1670e29e	! t0_data_in_shm_area+0x20 (t0)
	.word	0x7eed9d74	! t0_data_in_shm_area+0x24 (t0)
	.word	0x7f85c6da	! t0_data_in_shm_area+0x28 (t0)
	.word	0x1b3130c8	! t0_data_in_shm_area+0x2c (t0)
	.word	0x0f6f849e	! t0_data_in_shm_area+0x30 (t0)
	.word	0x66ab5377	! t0_data_in_shm_area+0x34 (t0)
	.word	0x03a13ca1	! t0_data_in_shm_area+0x38 (t0)
	.word	0xc7b5034d	! t0_data_in_shm_area+0x3c (t0)
	.word	0xc45e7e0a	! t0_data_in_shm_area+0x40 (t0 bload)
	.word	0xf3c590ec	! t0_data_in_shm_area+0x44
	.word	0x84b1ecad	! t0_data_in_shm_area+0x48
	.word	0x343c12a3	! t0_data_in_shm_area+0x4c
	.word	0x9571ed64	! t0_data_in_shm_area+0x50
	.word	0xcea7e5e5	! t0_data_in_shm_area+0x54
	.word	0x92a2cca6	! t0_data_in_shm_area+0x58
	.word	0x74a0a47b	! t0_data_in_shm_area+0x5c
	.word	0x545693d0	! t0_data_in_shm_area+0x60
	.word	0x6cd94d97	! t0_data_in_shm_area+0x64
	.word	0x4a4c1bb3	! t0_data_in_shm_area+0x68
	.word	0xc563507a	! t0_data_in_shm_area+0x6c
	.word	0x0ac36f63	! t0_data_in_shm_area+0x70
	.word	0x9c43f54d	! t0_data_in_shm_area+0x74
	.word	0x20b25063	! t0_data_in_shm_area+0x78
	.word	0xa5612251	! t0_data_in_shm_area+0x7c
	.word	0x5214359f	! t0_data_in_shm_area+0x80 (t0 bstore)
	.word	0x03bdfe9f	! t0_data_in_shm_area+0x84
	.word	0x9bab80d0	! t0_data_in_shm_area+0x88
	.word	0x4901490a	! t0_data_in_shm_area+0x8c
	.word	0xe2b2723e	! t0_data_in_shm_area+0x90
	.word	0xf91fb0e3	! t0_data_in_shm_area+0x94
	.word	0x98b0a901	! t0_data_in_shm_area+0x98
	.word	0x62bde7a5	! t0_data_in_shm_area+0x9c
	.word	0x822b4e2e	! t0_data_in_shm_area+0xa0
	.word	0x6106cde2	! t0_data_in_shm_area+0xa4
	.word	0x3f127390	! t0_data_in_shm_area+0xa8
	.word	0xdf10dae3	! t0_data_in_shm_area+0xac
	.word	0xf82c42dd	! t0_data_in_shm_area+0xb0
	.word	0x422dfdce	! t0_data_in_shm_area+0xb4
	.word	0x641f688c	! t0_data_in_shm_area+0xb8
	.word	0xc9068860	! t0_data_in_shm_area+0xbc
t0_data_in_shm_area_end:
t0_data_in_shm_area_stop:

KDATA_MODULE(t0_module_data_exp_regs, 0x3dacc000)
.seg "data"
KGLOBAL(t0_data_exp_regs)
t0_data_exp_regs_start:
t0_data_exp_regs:
	.word	0xb159e9cc          ! %f0
	.word	0x3e33b6fd          ! %f1
	.word	0xc5f5243f          ! %f2
	.word	0xd08f4046          ! %f3
	.word	0xcb670e22          ! %f4
	.word	0x26007d94          ! %f5
	.word	0x0fc50a08          ! %f6
	.word	0x62aca0c3          ! %f7
	.word	0xf69f7db1          ! %f8
	.word	0x33992f68          ! %f9
	.word	0xbef64e38          ! %f10
	.word	0xb888b9a3          ! %f11
	.word	0xf585a6a4          ! %f12
	.word	0x4d61fbeb          ! %f13
	.word	0xf41133ef          ! %f14
	.word	0x3feaee50          ! %f15
	.word	0x5283ccb6          ! %f16
	.word	0x96964dc0          ! %f17
	.word	0x7c445832          ! %f18
	.word	0x4b09e051          ! %f19
	.word	0xceba072a          ! %f20
	.word	0x641723a2          ! %f21
	.word	0x1b4d62fe          ! %f22
	.word	0x2e26cccc          ! %f23
	.word	0x40d9a9fe          ! %f24
	.word	0x544b9383          ! %f25
	.word	0x891335a0          ! %f26
	.word	0x4d42be4c          ! %f27
	.word	0x0eb18e5f          ! %f28
	.word	0x7be3dbf8          ! %f29
	.word	0x82842a43          ! %f30
	.word	0xec4e96c4          ! %f31
	.word	0xae51ee5f          ! %f32
	.word	0x3b71a7d3          ! %f33
	.word	0x1b6038ca          ! %f34
	.word	0x6ac335d4          ! %f35
	.word	0xf6e5c7e5          ! %f36
	.word	0xcbce6811          ! %f37
	.word	0x10c014e0          ! %f38
	.word	0xde9f3f4a          ! %f39
	.word	0x98cafae4          ! %f40
	.word	0xfb72e7f6          ! %f41
	.word	0xdfa7994c          ! %f42
	.word	0x069c45ea          ! %f43
	.word	0x675196ce          ! %f44
	.word	0x73717f76          ! %f45
	.word	0x19031489          ! %f46
	.word	0x90455e72          ! %f47
	.word	0x781e0b4b          ! %f48
	.word	0x49f687d7          ! %f49
	.word	0xea544a95          ! %f50
	.word	0x40b55ed8          ! %f51
	.word	0xb3b13026          ! %f52
	.word	0xb048f693          ! %f53
	.word	0x414d4009          ! %f54
	.word	0xbe634dd5          ! %f55
	.word	0xb3545887          ! %f56
	.word	0x557f4282          ! %f57
	.word	0xcde42269          ! %f58
	.word	0x5bc7c6a6          ! %f59
	.word	0x91d6e567          ! %f60
	.word	0x33baf738          ! %f61
	.word	0x834ce1bd          ! %f62
	.word	0x2e0e5511          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0xadc       ! %g1 (code pointer)
	.word	t0_data_exp_shm_area! %g2 (shared area pointer)
	.word	0x42f5cadc          ! %g3 (loop index)
	.word	SYM(t0_subr1)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0x5024fe4e          ! %o0
	.word	0xc685ab28          ! %o1
	.word	0x14da1f65          ! %o2
	.word	0xe01592e8          ! %o3
	.word	0x784ae6dd          ! %o4
	.word	0x074a2a4e          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0x396e0b3f          ! %l0
	.word	0x1dff9aab          ! %l1
	.word	0xf9fa4f60          ! %l2
	.word	0x0cb20da5          ! %l3
	.word	0x40debf02          ! %l4
	.word	0x9edfc919          ! %l5
	.word	0x3491d617          ! %l6
	.word	0x6f14e646          ! %l7
	.word	t0_data_exp_area0   ! %i0 (area pointer)
	.word	t0_data_exp_area0   ! %i1 (area pointer)
	.word	0x00000013          ! %i2 (byte offset)
	.word	0xfffffffc          ! %i3 (halfword offset)
	.word	0xfffffff4          ! %i4 (word offset)
	.word	0xfffffff8          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0x255e3a1c          ! %y
	.word	0x0000000a          ! %icc (nzvc)
	.word	0x400003eb          ! %fsr
	.word	0x00000000          ! %gsr.mask
	.word	0x00000000          ! %gsr
	.word	0x000000d2          ! %asi
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

KDATA_MODULE(t0_module_data_exp_stack, 0x1b94e000)
.seg "data"
KGLOBAL(t0_data_exp_mtbl_size)
KGLOBAL(t0_data_exp_mtbl)
KGLOBAL(t0_data_exp_stack)
t0_data_exp_stack_start:
	.word	0x77524f24
	.word	0x9e407f48
	.word	0xfcca0b95
	.word	0x4518ff8d
	.word	0x8c194b68
	.word	0xbb1d0b03
	.word	0xc86e4923
	.word	0xfa1a0934
	.word	0x9831ff95
	.word	0x253ac57f
	.word	0x82389017
	.word	0xef37e206
	.word	0xa1e5c8e9
	.word	0x5c1004e4
	.word	0x7d93f979
	.word	0xd012edfa
	.word	0x7b17ab91
	.word	0xf762f392
	.word	0xcbee83c1
	.word	0x816bce9c
	.word	0x1609487f
	.word	0x2b72b365
	.word	0xf29c2ed1
	.word	0xfae381ea
	.word	0x0a18dc80
	.word	0x7f78f139
	.word	0x803b6325
	.word	0x53640b7f
	.word	0x09779c8d
	.word	0xb8b2acb0
	.word	0x239c1848
	.word	0x39080bf3
	.word	0x48f90360
	.word	0x29c73832
	.word	0x804e6e89
	.word	0x59d9ea80
	.word	0x7410e44a
	.word	0x0e50b535
	.word	0x4e14afee
	.word	0xad2974e9
	.word	0xf21f5743
	.word	0x3cb990be
	.word	0x53bfec69
	.word	0x8fc11996
	.word	0x8c86d242
	.word	0xe9d6c426
	.word	0xf2bda549
	.word	0x1e322003
	.word	0x0ffa03cf
	.word	0x21dede21
	.word	0x62103bf3
	.word	0xaa01835b
	.word	0x443442d5
	.word	0xe5da17fc
	.word	0x7cd317d1
	.word	0xf6f5535f
	.word	0x9528a7bc
	.word	0xfba7fb25
	.word	0x7506b789
	.word	0xa75cbf8d
	.word	0x64e122b7
	.word	0xa57b5af0
	.word	0x8e702172
	.word	0xcf2b307d
	.word	0x2708235a
	.word	0xdc75a697
	.word	0xb21a6743
	.word	0xa061138d
	.word	0xe3aca56e
	.word	0xcd16d783
	.word	0x98c0310d
	.word	0xfdc33cc0
	.word	0x6779b708
	.word	0x33c77fc9
	.word	0x144e836a
	.word	0x158c02e3
	.word	0x6997cbd8
	.word	0x9816bcf6
	.word	0xb61134f6
	.word	0xf2cf79f1
	.word	0x0bff71be
	.word	0x0e9e130f
	.word	0x732cc6fe
	.word	0xdbfe6fb8
	.word	0xe76a3aa2
	.word	0x281973d3
	.word	0xb3109577
	.word	0xdd8a0ebb
	.word	0xf987ef84
	.word	0x9861f642
	.word	0x4ec79231
	.word	0xb3644b5a
	.word	0x47eb60d1
	.word	0x3dde0262
	.word	0xd3bcff4c
	.word	0x71377f30
	.word	0x6d8367f9
	.word	0xe1e1f540
	.word	0xebeddcea
	.word	0x81f1d6bc
	.word	0xf8a9ee3d
	.word	0xe8a88134
	.word	0x27d6fe26
	.word	0x71e77542
	.word	0xf61c0ccd
	.word	0x543a4e69
	.word	0xc6faf944
	.word	0x2d9872f3
	.word	0x0ecb9a11
	.word	0xdd109f9c
	.word	0x31da6728
	.word	0x1056194b
	.word	0x9cabb846
	.word	0x5db6ff24
	.word	0x06ec260c
	.word	0x0bd501ba
	.word	0x429f394d
	.word	0x906c3831
	.word	0x3aca936d
	.word	0x026ffa86
	.word	0x2ec8ebbf
	.word	0xd7032058
	.word	0x65a5f146
	.word	0xebb9d5ef
	.word	0xd9eb2544
	.word	0xea47f54e
	.word	0xec5b6a80
	.word	0xb43a8793
	.word	0x03851e25
	.word	0x573752f3
	.word	0xf5936aa8
	.word	0xd0163413
	.word	0xde31f21e
	.word	0x59a00592
	.word	0xb2413ce2
	.word	0xe32316f7
	.word	0xf3b65a79
	.word	0x2d993c67
	.word	0x4809261d
	.word	0x89dd62ce
	.word	0xa9677557
	.word	0x5fcae061
	.word	0xf2b16e87
	.word	0x73f67f99
	.word	0x7d662e50
	.word	0x001e1328
	.word	0xbb160e43
	.word	0x852f4b6a
	.word	0xe8d01c3e
	.word	0x2f481a60
	.word	0x655df159
	.word	0x5a034147
	.word	0x33bfe856
	.word	0x1e023b2f
	.word	0x20ac06ee
	.word	0x45a4aa53
	.word	0xb3049277
	.word	0xd0e549fd
	.word	0xaf758fb4
	.word	0xf4283d2f
	.word	0xae1826c6
	.word	0x6e07f27a
	.word	0x844a5fa3
	.word	0x40c0cf9d
	.word	0x3353b87a
	.word	0x5deafbe4
	.word	0xf27306e8
	.word	0x5ad1fe66
t0_data_exp_sp:
	.word	0x21e7b5f4
	.word	0x802f0d89
	.word	0x8f94161d
	.word	0xffaaef7e
	.word	0xb9fcea12
	.word	0x4243b78b
	.word	0x2ac4f1bb
	.word	0xb8289265
	.word	t0_data_exp_area0
	.word	t0_data_exp_area0
	.word	0x0000000f
	.word	0x0000000c
	.word	0xffffffec
	.word	0xfffffff8
	.word	t0_data_exp_fp
	.word	0x25cf13a7
	.word	0x129882e4
	.word	0xe9eff186
	.word	0x5d1d452f
	.word	0x8c828c8f
	.word	0x36f03951
	.word	0xb256378f
	.word	0x3a651ed3
	.word	0x1052dab5
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
	.word   	0xbc510f91	! [%fp - 0xc]
	.word   	0x5adcf78b	! [%fp - 0x8]
	.word   	0xd811f6c5	! [%fp - 0x4]
t0_data_exp_fp:
	.word	0x601f0a9b
	.word	0xb730bf04
	.word	0xa36ef160
	.word	0x367e1cb8
	.word	0x97bc3f72
	.word	0x3f7669e2
	.word	0x3760ec18
	.word	0xd7584926
	.word	0x191c0999
	.word	0x9138096e
	.word	0x7f0c5a08
	.word	0x7523d8a8
	.word	0x6ca32163
	.word	0xa2240b6b
	.word	0xe02d9b34
	.word	0x0730e888
	.word	0x8bea8a1d
	.word	0x3ae2d2cf
	.word	0xe3f981f2
	.word	0xcd212894
	.word	0x6541614e
	.word	0xa0430fb6
	.word	0xc2f3fdcc
	.word	0xf9077634
t0_data_exp_stacktop:
	.word	0
t0_data_exp_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_exp_area0, 0x39f5e000)
.seg "data"
t0_data_exp_area0_start:
.skip 6016
t0_data_exp_area0_begin:
	.word	0xfee5de40	! t0_data_exp_area0-0x20
	.word	0xcdbf2299	! t0_data_exp_area0-0x1c
	.word	0xb2cc10aa	! t0_data_exp_area0-0x18
	.word	0xa97d94bf	! t0_data_exp_area0-0x14
	.word	0x3b5045bf	! t0_data_exp_area0-0x10
	.word	0x1118febf	! t0_data_exp_area0-0xc
	.word	0x901f7230	! t0_data_exp_area0-0x8
	.word	0x4eec9709	! t0_data_exp_area0-0x4
.global t0_data_exp_area0; t0_data_exp_area0:
	.word	0xb452d620	! t0_data_exp_area0+0x0
	.word	0x10ad3ff2	! t0_data_exp_area0+0x4
	.word	0x4f4a8565	! t0_data_exp_area0+0x8
	.word	0x35f9ce40	! t0_data_exp_area0+0xc
	.word	0x8d7def84	! t0_data_exp_area0+0x10
	.word	0x72f56776	! t0_data_exp_area0+0x14
	.word	0x1a8f8494	! t0_data_exp_area0+0x18
	.word	0xbdd351f8	! t0_data_exp_area0+0x1c
t0_data_exp_area0_end:
.skip 2112
t0_data_exp_area0_stop:

KDATA_MODULE(t0_module_data_exp_shm_area, 0x2b03c000)
.seg "data"
t0_data_exp_shm_area_start:
t0_data_exp_shm_area_begin:
.global t0_data_exp_shm_area; t0_data_exp_shm_area:
	.word	0x1f67fc5e	! t0_data_exp_shm_area+0x0 (t0)
	.word	0x38bc7437	! t0_data_exp_shm_area+0x4 (t0)
	.word	0x632a0776	! t0_data_exp_shm_area+0x8 (t0)
	.word	0x09347583	! t0_data_exp_shm_area+0xc (t0)
	.word	0x596cde32	! t0_data_exp_shm_area+0x10 (t0)
	.word	0x94084a40	! t0_data_exp_shm_area+0x14 (t0)
	.word	0x0c924791	! t0_data_exp_shm_area+0x18 (t0)
	.word	0x9dabbe86	! t0_data_exp_shm_area+0x1c (t0)
	.word	0x1670e29e	! t0_data_exp_shm_area+0x20 (t0)
	.word	0x7eed9d74	! t0_data_exp_shm_area+0x24 (t0)
	.word	0x7f85c6da	! t0_data_exp_shm_area+0x28 (t0)
	.word	0x1b3130c8	! t0_data_exp_shm_area+0x2c (t0)
	.word	0x0f6f849e	! t0_data_exp_shm_area+0x30 (t0)
	.word	0x66ab5377	! t0_data_exp_shm_area+0x34 (t0)
	.word	0x03a13ca1	! t0_data_exp_shm_area+0x38 (t0)
	.word	0xc7b5034d	! t0_data_exp_shm_area+0x3c (t0)
	.word	0xc45e7e0a	! t0_data_exp_shm_area+0x40 (t0 bload)
	.word	0xf3c590ec	! t0_data_exp_shm_area+0x44
	.word	0x84b1ecad	! t0_data_exp_shm_area+0x48
	.word	0x343c12a3	! t0_data_exp_shm_area+0x4c
	.word	0x9571ed64	! t0_data_exp_shm_area+0x50
	.word	0xcea7e5e5	! t0_data_exp_shm_area+0x54
	.word	0x92a2cca6	! t0_data_exp_shm_area+0x58
	.word	0x74a0a47b	! t0_data_exp_shm_area+0x5c
	.word	0x545693d0	! t0_data_exp_shm_area+0x60
	.word	0x6cd94d97	! t0_data_exp_shm_area+0x64
	.word	0x4a4c1bb3	! t0_data_exp_shm_area+0x68
	.word	0xc563507a	! t0_data_exp_shm_area+0x6c
	.word	0x0ac36f63	! t0_data_exp_shm_area+0x70
	.word	0x9c43f54d	! t0_data_exp_shm_area+0x74
	.word	0x20b25063	! t0_data_exp_shm_area+0x78
	.word	0xa5612251	! t0_data_exp_shm_area+0x7c
	.word	0x5214359f	! t0_data_exp_shm_area+0x80 (t0 bstore)
	.word	0x03bdfe9f	! t0_data_exp_shm_area+0x84
	.word	0x9bab80d0	! t0_data_exp_shm_area+0x88
	.word	0x4901490a	! t0_data_exp_shm_area+0x8c
	.word	0xe2b2723e	! t0_data_exp_shm_area+0x90
	.word	0xf91fb0e3	! t0_data_exp_shm_area+0x94
	.word	0x98b0a901	! t0_data_exp_shm_area+0x98
	.word	0x62bde7a5	! t0_data_exp_shm_area+0x9c
	.word	0x822b4e2e	! t0_data_exp_shm_area+0xa0
	.word	0x6106cde2	! t0_data_exp_shm_area+0xa4
	.word	0x3f127390	! t0_data_exp_shm_area+0xa8
	.word	0xdf10dae3	! t0_data_exp_shm_area+0xac
	.word	0xf82c42dd	! t0_data_exp_shm_area+0xb0
	.word	0x422dfdce	! t0_data_exp_shm_area+0xb4
	.word	0x641f688c	! t0_data_exp_shm_area+0xb8
	.word	0xc9068860	! t0_data_exp_shm_area+0xbc
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



